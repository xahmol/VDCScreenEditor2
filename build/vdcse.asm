; Compiled with 1.27.239
--------------------------------------------------------------------
startup: ; startup
1c01 : 0b __ __ INV
1c02 : 08 __ __ PHP
1c03 : 0a __ __ ASL
1c04 : 00 __ __ BRK
1c05 : 9e __ __ INV
1c06 : 37 __ __ INV
1c07 : 31 38 __ AND ($38),y 
1c09 : 31 00 __ AND ($00),y 
1c0b : 00 __ __ BRK
1c0c : 00 __ __ BRK
1c0d : a9 0e __ LDA #$0e
1c0f : 8d 00 ff STA $ff00 
1c12 : ba __ __ TSX
1c13 : 8e fe 61 STX $61fe ; (spentry + 0)
1c16 : a9 7a __ LDA #$7a
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 87 __ LDA #$87
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 8b __ LDA #$8b
1c21 : e9 87 __ SBC #$87
1c23 : f0 0f __ BEQ $1c34 ; (startup + 51)
1c25 : aa __ __ TAX
1c26 : a9 00 __ LDA #$00
1c28 : a0 00 __ LDY #$00
1c2a : 91 19 __ STA (IP + 0),y 
1c2c : c8 __ __ INY
1c2d : d0 fb __ BNE $1c2a ; (startup + 41)
1c2f : e6 1a __ INC IP + 1 
1c31 : ca __ __ DEX
1c32 : d0 f6 __ BNE $1c2a ; (startup + 41)
1c34 : 38 __ __ SEC
1c35 : a9 64 __ LDA #$64
1c37 : e9 7a __ SBC #$7a
1c39 : f0 08 __ BEQ $1c43 ; (startup + 66)
1c3b : a8 __ __ TAY
1c3c : a9 00 __ LDA #$00
1c3e : 88 __ __ DEY
1c3f : 91 19 __ STA (IP + 0),y 
1c41 : d0 fb __ BNE $1c3e ; (startup + 61)
1c43 : a2 f7 __ LDX #$f7
1c45 : e0 f7 __ CPX #$f7
1c47 : f0 07 __ BEQ $1c50 ; (startup + 79)
1c49 : 95 00 __ STA $00,x 
1c4b : e8 __ __ INX
1c4c : e0 f7 __ CPX #$f7
1c4e : d0 f9 __ BNE $1c49 ; (startup + 72)
1c50 : a9 70 __ LDA #$70
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 ab __ LDA #$ab
1c56 : 85 24 __ STA SP + 1 
1c58 : 20 80 1c JSR $1c80 ; (main.s1000 + 0)
1c5b : a9 4c __ LDA #$4c
1c5d : 85 54 __ STA $54 
1c5f : a9 00 __ LDA #$00
1c61 : 85 13 __ STA P6 
1c63 : 85 1a __ STA IP + 1 
1c65 : a9 19 __ LDA #$19
1c67 : 85 16 __ STA P9 
1c69 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
1c80 : a2 05 __ LDX #$05
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d 72 ab STA $ab72,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
.s0:
1c8a : a9 7f __ LDA #$7f
1c8c : 8d f6 86 STA $86f6 ; (winCfg + 0)
1c8f : a9 00 __ LDA #$00
1c91 : 8d f9 86 STA $86f9 ; (winCfg + 3)
1c94 : 8d fb 86 STA $86fb ; (winCfg + 5)
1c97 : 8d f7 86 STA $86f7 ; (winCfg + 1)
1c9a : 8d fc 86 STA $86fc ; (winCfg + 6)
1c9d : a9 20 __ LDA #$20
1c9f : 8d fa 86 STA $86fa ; (winCfg + 4)
1ca2 : 8d f8 86 STA $86f8 ; (winCfg + 2)
1ca5 : 8d fd 86 STA $86fd ; (winCfg + 7)
1ca8 : 20 a1 22 JSR $22a1 ; (bnk_init.s1000 + 0)
1cab : a9 00 __ LDA #$00
1cad : 8d 8a 87 STA $878a ; (charsetchanged + 0)
1cb0 : 8d 8b 87 STA $878b ; (charsetchanged + 1)
1cb3 : 8d ff 86 STA $86ff ; (appexit + 0)
1cb6 : 8d 8c 87 STA $878c ; (screen_col + 0)
1cb9 : 8d 8d 87 STA $878d ; (screen_col + 1)
1cbc : 8d 8e 87 STA $878e ; (screen_row + 0)
1cbf : 8d 8f 87 STA $878f ; (screen_row + 1)
1cc2 : 8d 90 87 STA $8790 ; (screenbackground + 0)
1cc5 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
1cc8 : 8d 93 87 STA $8793 ; (plotreverse + 0)
1ccb : 8d 94 87 STA $8794 ; (plotunderline + 0)
1cce : 8d 95 87 STA $8795 ; (plotblink + 0)
1cd1 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
1cd4 : a9 0f __ LDA #$0f
1cd6 : 8d 92 87 STA $8792 ; (plotcolor + 0)
1cd9 : a9 00 __ LDA #$00
1cdb : a2 15 __ LDX #$15
.l1002:
1cdd : ca __ __ DEX
1cde : 9d 97 87 STA $8797,x ; (filename + 0)
1ce1 : d0 fa __ BNE $1cdd ; (main.l1002 + 0)
.s1003:
1ce3 : a5 ba __ LDA $ba 
1ce5 : d0 02 __ BNE $1ce9 ; (main.s1128 + 0)
.s4:
1ce7 : a9 08 __ LDA #$08
.s1128:
1ce9 : 8d fe 86 STA $86fe ; (bootdevice + 0)
1cec : 8d ac 87 STA $87ac ; (targetdevice + 0)
1cef : 20 50 2b JSR $2b50 ; (vdc_init.s1000 + 0)
1cf2 : a9 7f __ LDA #$7f
1cf4 : 8d c6 87 STA $87c6 ; (canvas + 0)
1cf7 : a9 00 __ LDA #$00
1cf9 : 8d ca 87 STA $87ca ; (canvas + 4)
1cfc : 8d cc 87 STA $87cc ; (canvas + 6)
1cff : 8d cd 87 STA $87cd ; (canvas + 7)
1d02 : 8d ce 87 STA $87ce ; (canvas + 8)
1d05 : 8d cf 87 STA $87cf ; (canvas + 9)
1d08 : 8d d0 87 STA $87d0 ; (canvas + 10)
1d0b : 8d c7 87 STA $87c7 ; (canvas + 1)
1d0e : 85 0f __ STA P2 
1d10 : 85 10 __ STA P3 
1d12 : a9 50 __ LDA #$50
1d14 : 8d c9 87 STA $87c9 ; (canvas + 3)
1d17 : 85 11 __ STA P4 
1d19 : a9 19 __ LDA #$19
1d1b : 8d cb 87 STA $87cb ; (canvas + 5)
1d1e : 85 12 __ STA P5 
1d20 : a9 58 __ LDA #$58
1d22 : 8d c8 87 STA $87c8 ; (canvas + 2)
1d25 : a9 d1 __ LDA #$d1
1d27 : 85 0d __ STA P0 
1d29 : a9 87 __ LDA #$87
1d2b : 85 0e __ STA P1 
1d2d : 20 12 31 JSR $3112 ; (vdcwin_init.s0 + 0)
1d30 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
1d33 : a9 b3 __ LDA #$b3
1d35 : 85 16 __ STA P9 
1d37 : a9 35 __ LDA #$35
1d39 : 85 17 __ STA P10 
1d3b : ad ad 87 LDA $87ad ; (vdc_state + 0)
1d3e : c9 40 __ CMP #$40
1d40 : d0 2c __ BNE $1d6e ; (main.s11 + 0)
.s9:
1d42 : a9 03 __ LDA #$03
1d44 : 8d 59 82 STA $8259 ; (pulldown_options + 4)
1d47 : a9 01 __ LDA #$01
1d49 : 8d fe 69 STA $69fe ; (undoenabled + 0)
1d4c : a9 00 __ LDA #$00
1d4e : 8d df 87 STA $87df ; (undonumber + 0)
1d51 : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
1d54 : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
1d57 : a2 ff __ LDX #$ff
.l1122:
1d59 : e8 __ __ INX
1d5a : bd 21 33 LDA $3321,x 
1d5d : 9d 78 85 STA $8578,x ; (pulldown_titles + 416)
1d60 : d0 f7 __ BNE $1d59 ; (main.l1122 + 0)
.s1123:
1d62 : ad c1 87 LDA $87c1 ; (vdc_state + 20)
1d65 : 8d dd 87 STA $87dd ; (undoaddress + 0)
1d68 : ad c2 87 LDA $87c2 ; (vdc_state + 21)
1d6b : 8d de 87 STA $87de ; (undoaddress + 1)
.s11:
1d6e : 20 31 33 JSR $3331 ; (printcentered.s0 + 0)
1d71 : a9 01 __ LDA #$01
1d73 : 85 10 __ STA P3 
1d75 : a9 00 __ LDA #$00
1d77 : 85 11 __ STA P4 
1d79 : a9 58 __ LDA #$58
1d7b : 85 12 __ STA P5 
1d7d : ad fe 86 LDA $86fe ; (bootdevice + 0)
1d80 : 85 55 __ STA T1 + 0 
1d82 : 85 0f __ STA P2 
1d84 : a9 c5 __ LDA #$c5
1d86 : 85 13 __ STA P6 
1d88 : a9 35 __ LDA #$35
1d8a : 85 14 __ STA P7 
1d8c : 20 6c 13 JSR $136c ; (bnk_load.s0 + 0)
1d8f : a5 1b __ LDA ACCU + 0 
1d91 : d0 09 __ BNE $1d9c ; (main.s12 + 0)
.s13:
1d93 : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
1d96 : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
1d99 : 4c a3 1d JMP $1da3 ; (main.s14 + 0)
.s12:
1d9c : a9 58 __ LDA #$58
1d9e : 85 13 __ STA P6 
1da0 : 20 1b 1a JSR $1a1b ; (bnk_cpytovdc@proxy + 0)
.s14:
1da3 : 20 5e 3b JSR $3b5e ; (initoverlay.s1000 + 0)
1da6 : a9 ad __ LDA #$ad
1da8 : 85 16 __ STA P9 
1daa : a9 3c __ LDA #$3c
1dac : 85 17 __ STA P10 
1dae : 20 31 33 JSR $3331 ; (printcentered.s0 + 0)
1db1 : a5 55 __ LDA T1 + 0 
1db3 : 85 0f __ STA P2 
1db5 : a9 00 __ LDA #$00
1db7 : 85 10 __ STA P3 
1db9 : 85 11 __ STA P4 
1dbb : a9 0c __ LDA #$0c
1dbd : 85 12 __ STA P5 
1dbf : a9 c1 __ LDA #$c1
1dc1 : 85 13 __ STA P6 
1dc3 : a9 3c __ LDA #$3c
1dc5 : 85 14 __ STA P7 
1dc7 : 20 6c 13 JSR $136c ; (bnk_load.s0 + 0)
1dca : a5 1b __ LDA ACCU + 0 
1dcc : d0 06 __ BNE $1dd4 ; (main.s17 + 0)
.s15:
1dce : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
1dd1 : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
.s17:
1dd4 : a9 cb __ LDA #$cb
1dd6 : 85 16 __ STA P9 
1dd8 : a9 3c __ LDA #$3c
1dda : 85 17 __ STA P10 
1ddc : 20 31 33 JSR $3331 ; (printcentered.s0 + 0)
1ddf : a9 7f __ LDA #$7f
1de1 : 85 0d __ STA P0 
1de3 : a9 01 __ LDA #$01
1de5 : 85 10 __ STA P3 
1de7 : a9 00 __ LDA #$00
1de9 : 85 13 __ STA P6 
1deb : 85 0e __ STA P1 
1ded : 85 11 __ STA P4 
1def : 20 8a 14 JSR $148a ; (bnk_memcpy@proxy + 0)
1df2 : a9 7f __ LDA #$7f
1df4 : 85 10 __ STA P3 
1df6 : a9 00 __ LDA #$00
1df8 : 85 13 __ STA P6 
1dfa : 85 0e __ STA P1 
1dfc : 85 11 __ STA P4 
1dfe : a9 08 __ LDA #$08
1e00 : 85 14 __ STA P7 
1e02 : a9 40 __ LDA #$40
1e04 : 85 0f __ STA P2 
1e06 : a9 50 __ LDA #$50
1e08 : 85 12 __ STA P5 
1e0a : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
1e0d : a9 20 __ LDA #$20
1e0f : 8d f8 ab STA $abf8 ; (sstack + 5)
1e12 : a9 0f __ LDA #$0f
1e14 : 8d f9 ab STA $abf9 ; (sstack + 6)
1e17 : 20 d9 3c JSR $3cd9 ; (screenmapfill.s0 + 0)
1e1a : a9 e2 __ LDA #$e2
1e1c : 85 16 __ STA P9 
1e1e : a9 3d __ LDA #$3d
1e20 : 85 17 __ STA P10 
1e22 : 20 31 33 JSR $3331 ; (printcentered.s0 + 0)
1e25 : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
1e28 : 20 98 2c JSR $2c98 ; (vdc_cls.s0 + 0)
1e2b : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
1e2e : a9 01 __ LDA #$01
1e30 : 8d ff 87 STA $87ff ; (showbar + 0)
1e33 : a2 ff __ LDX #$ff
.l1004:
1e35 : e8 __ __ INX
1e36 : bd cf 3e LDA $3ecf,x 
1e39 : 9d f4 87 STA $87f4,x ; (programmode + 0)
1e3c : d0 f7 __ BNE $1e35 ; (main.l1004 + 0)
.s1005:
1e3e : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.l20:
1e41 : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.l22:
1e44 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
1e47 : a5 1b __ LDA ACCU + 0 
1e49 : c9 4c __ CMP #$4c
1e4b : d0 13 __ BNE $1e60 ; (main.s116 + 0)
.s72:
1e4d : a9 02 __ LDA #$02
1e4f : 8d fa ab STA $abfa ; (sstack + 7)
1e52 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
1e55 : a9 01 __ LDA #$01
1e57 : 8d fc ab STA $abfc ; (sstack + 9)
1e5a : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
1e5d : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s116:
1e60 : 85 53 __ STA T0 + 0 
1e62 : 85 56 __ STA T2 + 0 
1e64 : c9 4c __ CMP #$4c
1e66 : b0 03 __ BCS $1e6b ; (main.s117 + 0)
1e68 : 4c e1 1f JMP $1fe1 ; (main.s118 + 0)
.s117:
1e6b : c9 59 __ CMP #$59
1e6d : d0 03 __ BNE $1e72 ; (main.s146 + 0)
1e6f : 4c c9 1f JMP $1fc9 ; (main.s80 + 0)
.s146:
1e72 : b0 03 __ BCS $1e77 ; (main.s147 + 0)
1e74 : 4c 45 1f JMP $1f45 ; (main.s148 + 0)
.s147:
1e77 : c9 8c __ CMP #$8c
1e79 : d0 0b __ BNE $1e86 ; (main.s161 + 0)
.s104:
1e7b : a9 01 __ LDA #$01
1e7d : 8d f8 ab STA $abf8 ; (sstack + 5)
1e80 : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
1e83 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s161:
1e86 : 90 7c __ BCC $1f04 ; (main.s163 + 0)
.s162:
1e88 : c9 91 __ CMP #$91
1e8a : f0 04 __ BEQ $1e90 ; (main.s24 + 0)
.s169:
1e8c : c9 9d __ CMP #$9d
1e8e : d0 0b __ BNE $1e9b ; (main.s106 + 0)
.s24:
1e90 : a5 1b __ LDA ACCU + 0 
1e92 : 8d fc ab STA $abfc ; (sstack + 9)
1e95 : 20 6d 41 JSR $416d ; (plotmove.s1000 + 0)
1e98 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s106:
1e9b : c9 30 __ CMP #$30
1e9d : 90 18 __ BCC $1eb7 ; (main.s109 + 0)
.s110:
1e9f : c9 3a __ CMP #$3a
1ea1 : b0 14 __ BCS $1eb7 ; (main.s109 + 0)
.s107:
1ea3 : 0a __ __ ASL
1ea4 : aa __ __ TAX
1ea5 : bd 58 88 LDA $8858,x ; (multab + 88)
1ea8 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
1eab : bd 59 88 LDA $8859,x ; (multab + 89)
1eae : 8d 96 87 STA $8796 ; (plotaltchar + 0)
1eb1 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
1eb4 : 4c bd 1e JMP $1ebd ; (main.s114 + 0)
.s109:
1eb7 : a9 20 __ LDA #$20
1eb9 : c5 1b __ CMP ACCU + 0 
1ebb : b0 16 __ BCS $1ed3 ; (main.s225 + 0)
.s114:
1ebd : a5 53 __ LDA T0 + 0 
1ebf : c9 2b __ CMP #$2b
1ec1 : b0 10 __ BCS $1ed3 ; (main.s225 + 0)
.s111:
1ec3 : a5 56 __ LDA T2 + 0 
1ec5 : 0a __ __ ASL
1ec6 : aa __ __ TAX
1ec7 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
1eca : 9d 76 88 STA $8876,x ; (multab + 118)
1ecd : ad 96 87 LDA $8796 ; (plotaltchar + 0)
1ed0 : 9d 77 88 STA $8877,x ; (multab + 119)
.s225:
1ed3 : ad ff 86 LDA $86ff ; (appexit + 0)
1ed6 : d0 0b __ BNE $1ee3 ; (main.s19 + 0)
.s18:
1ed8 : ad ff 87 LDA $87ff ; (showbar + 0)
1edb : d0 03 __ BNE $1ee0 ; (main.s18 + 8)
1edd : 4c 44 1e JMP $1e44 ; (main.l22 + 0)
1ee0 : 4c 41 1e JMP $1e41 ; (main.l20 + 0)
.s19:
1ee3 : a9 00 __ LDA #$00
1ee5 : 20 18 2e JSR $2e18 ; (fastmode.s0 + 0)
1ee8 : 20 37 2e JSR $2e37 ; (vdc_set_mode@proxy + 0)
1eeb : 20 98 2c JSR $2c98 ; (vdc_cls.s0 + 0)
1eee : a9 04 __ LDA #$04
1ef0 : 8d 06 d5 STA $d506 
1ef3 : a9 00 __ LDA #$00
1ef5 : 85 1b __ STA ACCU + 0 
1ef7 : 85 1c __ STA ACCU + 1 
.s1001:
1ef9 : a2 05 __ LDX #$05
1efb : bd 72 ab LDA $ab72,x ; (main@stack + 0)
1efe : 95 53 __ STA T0 + 0,x 
1f00 : ca __ __ DEX
1f01 : 10 f8 __ BPL $1efb ; (main.s1001 + 2)
1f03 : 60 __ __ RTS
.s163:
1f04 : c9 85 __ CMP #$85
1f06 : d0 12 __ BNE $1f1a ; (main.s164 + 0)
.s102:
1f08 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
1f0b : 20 ca 59 JSR $59ca ; (mainmenuloop.s1000 + 0)
1f0e : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
1f11 : ad 92 87 LDA $8792 ; (plotcolor + 0)
1f14 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
1f17 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s164:
1f1a : b0 19 __ BCS $1f35 ; (main.s165 + 0)
.s166:
1f1c : c9 5a __ CMP #$5a
1f1e : f0 03 __ BEQ $1f23 ; (main.s75 + 0)
1f20 : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s75:
1f23 : ad fe 69 LDA $69fe ; (undoenabled + 0)
1f26 : c9 01 __ CMP #$01
1f28 : d0 a9 __ BNE $1ed3 ; (main.s225 + 0)
.s79:
1f2a : ad e0 87 LDA $87e0 ; (undo_undopossible + 0)
1f2d : f0 a4 __ BEQ $1ed3 ; (main.s225 + 0)
.s76:
1f2f : 20 9e 54 JSR $549e ; (undo_performundo.s1000 + 0)
1f32 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s165:
1f35 : c9 8b __ CMP #$8b
1f37 : f0 03 __ BEQ $1f3c ; (main.s103 + 0)
1f39 : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s103:
1f3c : 20 4f 50 JSR $504f ; (togglestatusbar.s0 + 0)
.s284:
1f3f : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
1f42 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s148:
1f45 : c9 53 __ CMP #$53
1f47 : d0 0e __ BNE $1f57 ; (main.s149 + 0)
.s74:
1f49 : a9 02 __ LDA #$02
1f4b : 8d fa ab STA $abfa ; (sstack + 7)
1f4e : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
1f51 : 20 b1 b3 JSR $b3b1 ; (writemode.s13 + 7)
1f54 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s149:
1f57 : 90 34 __ BCC $1f8d ; (main.s151 + 0)
.s150:
1f59 : c9 55 __ CMP #$55
1f5b : d0 0b __ BNE $1f68 ; (main.s157 + 0)
.s47:
1f5d : a9 00 __ LDA #$00
1f5f : cd 94 87 CMP $8794 ; (plotunderline + 0)
1f62 : 2a __ __ ROL
1f63 : 8d 94 87 STA $8794 ; (plotunderline + 0)
1f66 : 90 d7 __ BCC $1f3f ; (main.s284 + 0)
.s157:
1f68 : b0 0e __ BCS $1f78 ; (main.s158 + 0)
.s85:
1f6a : a9 02 __ LDA #$02
1f6c : 8d fa ab STA $abfa ; (sstack + 7)
1f6f : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
1f72 : 20 a7 ba JSR $baa7 ; (resizewidth.s1030 + 1)
1f75 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s158:
1f78 : c9 57 __ CMP #$57
1f7a : f0 03 __ BEQ $1f7f ; (main.s70 + 0)
1f7c : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s70:
1f7f : a9 01 __ LDA #$01
1f81 : 8d fa ab STA $abfa ; (sstack + 7)
1f84 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
1f87 : 20 6e b1 JSR $b16e ; (writemode.s1000 + 0)
1f8a : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s151:
1f8d : c9 50 __ CMP #$50
1f8f : d0 0e __ BNE $1f9f ; (main.s152 + 0)
.s52:
1f91 : a9 01 __ LDA #$01
1f93 : 8d fa ab STA $abfa ; (sstack + 7)
1f96 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
1f99 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
1f9c : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s152:
1f9f : b0 15 __ BCS $1fb6 ; (main.s153 + 0)
.s154:
1fa1 : c9 4d __ CMP #$4d
1fa3 : f0 03 __ BEQ $1fa8 ; (main.s73 + 0)
1fa5 : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s73:
1fa8 : a9 02 __ LDA #$02
1faa : 8d fa ab STA $abfa ; (sstack + 7)
1fad : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
1fb0 : 20 fd b0 JSR $b0fd ; (palette_returnscreencode.s1003 + 2)
1fb3 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s153:
1fb6 : c9 52 __ CMP #$52
1fb8 : f0 03 __ BEQ $1fbd ; (main.s49 + 0)
1fba : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s49:
1fbd : a9 00 __ LDA #$00
1fbf : cd 93 87 CMP $8793 ; (plotreverse + 0)
1fc2 : 2a __ __ ROL
1fc3 : 8d 93 87 STA $8793 ; (plotreverse + 0)
1fc6 : 4c 3f 1f JMP $1f3f ; (main.s284 + 0)
.s80:
1fc9 : ad fe 69 LDA $69fe ; (undoenabled + 0)
1fcc : c9 01 __ CMP #$01
1fce : f0 03 __ BEQ $1fd3 ; (main.s84 + 0)
1fd0 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s84:
1fd3 : ad e1 87 LDA $87e1 ; (undo_redopossible + 0)
1fd6 : d0 03 __ BNE $1fdb ; (main.s81 + 0)
1fd8 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s81:
1fdb : 20 62 57 JSR $5762 ; (undo_performredo.s1000 + 0)
1fde : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s118:
1fe1 : c9 2d __ CMP #$2d
1fe3 : d0 07 __ BNE $1fec ; (main.s119 + 0)
.s26:
1fe5 : ac 91 87 LDY $8791 ; (plotscreencode + 0)
1fe8 : 88 __ __ DEY
1fe9 : 4c aa 20 JMP $20aa ; (main.s287 + 0)
.s119:
1fec : 90 03 __ BCC $1ff1 ; (main.s121 + 0)
1fee : 4c 36 21 JMP $2136 ; (main.s120 + 0)
.s121:
1ff1 : c9 1d __ CMP #$1d
1ff3 : d0 03 __ BNE $1ff8 ; (main.s122 + 0)
1ff5 : 4c 90 1e JMP $1e90 ; (main.s24 + 0)
.s122:
1ff8 : b0 03 __ BCS $1ffd ; (main.s123 + 0)
1ffa : 4c b1 20 JMP $20b1 ; (main.s124 + 0)
.s123:
1ffd : c9 2b __ CMP #$2b
1fff : d0 07 __ BNE $2008 ; (main.s130 + 0)
.s25:
2001 : ac 91 87 LDY $8791 ; (plotscreencode + 0)
2004 : c8 __ __ INY
2005 : 4c aa 20 JMP $20aa ; (main.s287 + 0)
.s130:
2008 : b0 76 __ BCS $2080 ; (main.s27 + 0)
.s132:
200a : c9 20 __ CMP #$20
200c : f0 03 __ BEQ $2011 ; (main.s87 + 0)
200e : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s87:
2011 : ad fe 69 LDA $69fe ; (undoenabled + 0)
2014 : c9 01 __ CMP #$01
2016 : d0 1a __ BNE $2032 ; (main.s90 + 0)
.s88:
2018 : 85 18 __ STA P11 
201a : 8d f3 ab STA $abf3 ; (sstack + 0)
201d : ad cf 87 LDA $87cf ; (canvas + 9)
2020 : 18 __ __ CLC
2021 : 6d 8e 87 ADC $878e ; (screen_row + 0)
2024 : 85 16 __ STA P9 
2026 : ad cd 87 LDA $87cd ; (canvas + 7)
2029 : 18 __ __ CLC
202a : 6d 8c 87 ADC $878c ; (screen_col + 0)
202d : 85 17 __ STA P10 
202f : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s90:
2032 : ad cf 87 LDA $87cf ; (canvas + 9)
2035 : 18 __ __ CLC
2036 : 6d 8e 87 ADC $878e ; (screen_row + 0)
2039 : 85 10 __ STA P3 
203b : ad cd 87 LDA $87cd ; (canvas + 7)
203e : 18 __ __ CLC
203f : 6d 8c 87 ADC $878c ; (screen_col + 0)
2042 : 85 11 __ STA P4 
2044 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
2047 : 85 12 __ STA P5 
2049 : ad 95 87 LDA $8795 ; (plotblink + 0)
204c : 0a __ __ ASL
204d : 0a __ __ ASL
204e : 0a __ __ ASL
204f : 0a __ __ ASL
2050 : 18 __ __ CLC
2051 : 6d 92 87 ADC $8792 ; (plotcolor + 0)
2054 : 85 53 __ STA T0 + 0 
2056 : ad 94 87 LDA $8794 ; (plotunderline + 0)
2059 : 4a __ __ LSR
205a : 6a __ __ ROR
205b : 6a __ __ ROR
205c : 29 c0 __ AND #$c0
205e : 6a __ __ ROR
205f : 65 53 __ ADC T0 + 0 
2061 : 85 53 __ STA T0 + 0 
2063 : ad 93 87 LDA $8793 ; (plotreverse + 0)
2066 : 4a __ __ LSR
2067 : 6a __ __ ROR
2068 : 29 80 __ AND #$80
206a : 6a __ __ ROR
206b : 65 53 __ ADC T0 + 0 
206d : 85 53 __ STA T0 + 0 
206f : ad 96 87 LDA $8796 ; (plotaltchar + 0)
2072 : 4a __ __ LSR
2073 : a9 00 __ LDA #$00
2075 : 6a __ __ ROR
2076 : 65 53 __ ADC T0 + 0 
2078 : 85 13 __ STA P6 
.s286:
207a : 20 2b 54 JSR $542b ; (screenmapplot.s0 + 0)
207d : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s27:
2080 : ad 92 87 LDA $8792 ; (plotcolor + 0)
2083 : f0 1a __ BEQ $209f ; (main.s28 + 0)
.s29:
2085 : 38 __ __ SEC
2086 : e9 01 __ SBC #$01
2088 : a8 __ __ TAY
2089 : cd 90 87 CMP $8790 ; (screenbackground + 0)
208c : d0 08 __ BNE $2096 ; (main.s288 + 0)
.s31:
208e : 98 __ __ TYA
208f : d0 04 __ BNE $2095 ; (main.s35 + 0)
.s34:
2091 : a9 0f __ LDA #$0f
2093 : d0 02 __ BNE $2097 ; (main.s285 + 0)
.s35:
2095 : 88 __ __ DEY
.s288:
2096 : 98 __ __ TYA
.s285:
2097 : 85 11 __ STA P4 
2099 : 20 f6 3d JSR $3df6 ; (change_plotcolor.s0 + 0)
209c : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s28:
209f : a9 0f __ LDA #$0f
20a1 : a8 __ __ TAY
20a2 : cd 90 87 CMP $8790 ; (screenbackground + 0)
20a5 : d0 ef __ BNE $2096 ; (main.s288 + 0)
20a7 : 4c 8e 20 JMP $208e ; (main.s31 + 0)
.s287:
20aa : 98 __ __ TYA
.s1127:
20ab : 8d 91 87 STA $8791 ; (plotscreencode + 0)
20ae : 4c 3f 1f JMP $1f3f ; (main.s284 + 0)
.s124:
20b1 : c9 13 __ CMP #$13
20b3 : f0 51 __ BEQ $2106 ; (main.s97 + 0)
.s125:
20b5 : b0 0a __ BCS $20c1 ; (main.s126 + 0)
.s127:
20b7 : c9 11 __ CMP #$11
20b9 : f0 03 __ BEQ $20be ; (main.s127 + 7)
20bb : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
20be : 4c 90 1e JMP $1e90 ; (main.s24 + 0)
.s126:
20c1 : c9 14 __ CMP #$14
20c3 : f0 03 __ BEQ $20c8 ; (main.s93 + 0)
20c5 : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s93:
20c8 : ad fe 69 LDA $69fe ; (undoenabled + 0)
20cb : c9 01 __ CMP #$01
20cd : d0 1a __ BNE $20e9 ; (main.s96 + 0)
.s94:
20cf : 85 18 __ STA P11 
20d1 : 8d f3 ab STA $abf3 ; (sstack + 0)
20d4 : ad cf 87 LDA $87cf ; (canvas + 9)
20d7 : 18 __ __ CLC
20d8 : 6d 8e 87 ADC $878e ; (screen_row + 0)
20db : 85 16 __ STA P9 
20dd : ad cd 87 LDA $87cd ; (canvas + 7)
20e0 : 18 __ __ CLC
20e1 : 6d 8c 87 ADC $878c ; (screen_col + 0)
20e4 : 85 17 __ STA P10 
20e6 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s96:
20e9 : a9 20 __ LDA #$20
20eb : 85 12 __ STA P5 
20ed : a9 0f __ LDA #$0f
20ef : 85 13 __ STA P6 
20f1 : ad cf 87 LDA $87cf ; (canvas + 9)
20f4 : 18 __ __ CLC
20f5 : 6d 8e 87 ADC $878e ; (screen_row + 0)
20f8 : 85 10 __ STA P3 
20fa : ad cd 87 LDA $87cd ; (canvas + 7)
20fd : 18 __ __ CLC
20fe : 6d 8c 87 ADC $878c ; (screen_col + 0)
2101 : 85 11 __ STA P4 
2103 : 4c 7a 20 JMP $207a ; (main.s286 + 0)
.s97:
2106 : a9 00 __ LDA #$00
2108 : 8d 8e 87 STA $878e ; (screen_row + 0)
210b : 8d 8f 87 STA $878f ; (screen_row + 1)
210e : 8d 8c 87 STA $878c ; (screen_col + 0)
2111 : 8d 8d 87 STA $878d ; (screen_col + 1)
2114 : 8d cd 87 STA $87cd ; (canvas + 7)
2117 : 8d ce 87 STA $87ce ; (canvas + 8)
211a : 8d cf 87 STA $87cf ; (canvas + 9)
211d : 8d d0 87 STA $87d0 ; (canvas + 10)
2120 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
2123 : ad ff 87 LDA $87ff ; (showbar + 0)
2126 : f0 03 __ BEQ $212b ; (main.s100 + 0)
.s98:
2128 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s100:
212b : a9 00 __ LDA #$00
212d : 8d d5 87 STA $87d5 ; (canvas + 15)
2130 : 8d d6 87 STA $87d6 ; (canvas + 16)
2133 : 4c 3f 1f JMP $1f3f ; (main.s284 + 0)
.s120:
2136 : c9 43 __ CMP #$43
2138 : d0 0e __ BNE $2148 ; (main.s134 + 0)
.s71:
213a : a9 01 __ LDA #$01
213c : 8d fa ab STA $abfa ; (sstack + 7)
213f : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
2142 : 20 ea b3 JSR $b3ea ; (colorwrite.s1000 + 0)
2145 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s134:
2148 : b0 03 __ BCS $214d ; (main.s135 + 0)
214a : 4c 52 22 JMP $2252 ; (main.s136 + 0)
.s135:
214d : c9 47 __ CMP #$47
214f : f0 27 __ BEQ $2178 ; (main.s53 + 0)
.s141:
2151 : b0 15 __ BCS $2168 ; (main.s142 + 0)
.s143:
2153 : c9 45 __ CMP #$45
2155 : f0 03 __ BEQ $215a ; (main.s51 + 0)
2157 : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s51:
215a : a9 04 __ LDA #$04
215c : 8d fa ab STA $abfa ; (sstack + 7)
215f : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
2162 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
2165 : 4c d3 1e JMP $1ed3 ; (main.s225 + 0)
.s142:
2168 : c9 49 __ CMP #$49
216a : f0 03 __ BEQ $216f ; (main.s86 + 0)
216c : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s86:
216f : ad 91 87 LDA $8791 ; (plotscreencode + 0)
2172 : 18 __ __ CLC
2173 : 69 80 __ ADC #$80
2175 : 4c ab 20 JMP $20ab ; (main.s1127 + 0)
.s53:
2178 : a9 7f __ LDA #$7f
217a : 85 0d __ STA P0 
217c : ad cd 87 LDA $87cd ; (canvas + 7)
217f : 18 __ __ CLC
2180 : 6d 8c 87 ADC $878c ; (screen_col + 0)
2183 : 85 53 __ STA T0 + 0 
2185 : ad ce 87 LDA $87ce ; (canvas + 8)
2188 : 6d 8d 87 ADC $878d ; (screen_col + 1)
218b : 85 54 __ STA T0 + 1 
218d : ad cf 87 LDA $87cf ; (canvas + 9)
2190 : 18 __ __ CLC
2191 : 6d 8e 87 ADC $878e ; (screen_row + 0)
2194 : 85 03 __ STA WORK + 0 
2196 : ad d0 87 LDA $87d0 ; (canvas + 10)
2199 : 6d 8f 87 ADC $878f ; (screen_row + 1)
219c : 85 04 __ STA WORK + 1 
219e : ad c9 87 LDA $87c9 ; (canvas + 3)
21a1 : 85 57 __ STA T3 + 0 
21a3 : 85 1b __ STA ACCU + 0 
21a5 : ad ca 87 LDA $87ca ; (canvas + 4)
21a8 : 85 58 __ STA T3 + 1 
21aa : 85 1c __ STA ACCU + 1 
21ac : 20 87 7c JSR $7c87 ; (mul16 + 0)
21af : 18 __ __ CLC
21b0 : a5 06 __ LDA WORK + 3 
21b2 : 69 58 __ ADC #$58
21b4 : aa __ __ TAX
21b5 : 18 __ __ CLC
21b6 : a5 05 __ LDA WORK + 2 
21b8 : 65 53 __ ADC T0 + 0 
21ba : 85 0e __ STA P1 
21bc : 8a __ __ TXA
21bd : 65 54 __ ADC T0 + 1 
21bf : 85 0f __ STA P2 
21c1 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
21c4 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
21c7 : ad cb 87 LDA $87cb ; (canvas + 5)
21ca : 85 1b __ STA ACCU + 0 
21cc : ad cc 87 LDA $87cc ; (canvas + 6)
21cf : 85 1c __ STA ACCU + 1 
21d1 : a5 57 __ LDA T3 + 0 
21d3 : 85 03 __ STA WORK + 0 
21d5 : a5 58 __ LDA T3 + 1 
21d7 : 85 04 __ STA WORK + 1 
21d9 : 20 87 7c JSR $7c87 ; (mul16 + 0)
21dc : 18 __ __ CLC
21dd : a5 05 __ LDA WORK + 2 
21df : 65 0e __ ADC P1 
21e1 : a8 __ __ TAY
21e2 : a5 06 __ LDA WORK + 3 
21e4 : 65 0f __ ADC P2 
21e6 : aa __ __ TAX
21e7 : 98 __ __ TYA
21e8 : 18 __ __ CLC
21e9 : 69 30 __ ADC #$30
21eb : 85 0e __ STA P1 
21ed : 90 01 __ BCC $21f0 ; (main.s1134 + 0)
.s1133:
21ef : e8 __ __ INX
.s1134:
21f0 : 86 0f __ STX P2 
21f2 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
21f5 : c9 81 __ CMP #$81
21f7 : a8 __ __ TAY
21f8 : b0 08 __ BCS $2202 ; (main.s58 + 0)
.s59:
21fa : a9 00 __ LDA #$00
21fc : 8d 96 87 STA $8796 ; (plotaltchar + 0)
21ff : 98 __ __ TYA
2200 : 90 09 __ BCC $220b ; (main.s257 + 0)
.s58:
2202 : a9 01 __ LDA #$01
2204 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
2207 : 98 __ __ TYA
2208 : e9 80 __ SBC #$80
220a : a8 __ __ TAY
.s257:
220b : c9 41 __ CMP #$41
220d : b0 08 __ BCS $2217 ; (main.s61 + 0)
.s62:
220f : a9 00 __ LDA #$00
2211 : 8d 93 87 STA $8793 ; (plotreverse + 0)
2214 : 98 __ __ TYA
2215 : 90 09 __ BCC $2220 ; (main.s258 + 0)
.s61:
2217 : a9 01 __ LDA #$01
2219 : 8d 93 87 STA $8793 ; (plotreverse + 0)
221c : 98 __ __ TYA
221d : e9 40 __ SBC #$40
221f : a8 __ __ TAY
.s258:
2220 : c9 21 __ CMP #$21
2222 : b0 08 __ BCS $222c ; (main.s64 + 0)
.s65:
2224 : a9 00 __ LDA #$00
2226 : 8d 94 87 STA $8794 ; (plotunderline + 0)
2229 : 98 __ __ TYA
222a : 90 09 __ BCC $2235 ; (main.s259 + 0)
.s64:
222c : a9 01 __ LDA #$01
222e : 8d 94 87 STA $8794 ; (plotunderline + 0)
2231 : 98 __ __ TYA
2232 : e9 20 __ SBC #$20
2234 : a8 __ __ TAY
.s259:
2235 : c9 11 __ CMP #$11
2237 : b0 08 __ BCS $2241 ; (main.s67 + 0)
.s68:
2239 : a9 00 __ LDA #$00
223b : 8d 95 87 STA $8795 ; (plotblink + 0)
223e : 98 __ __ TYA
223f : 90 08 __ BCC $2249 ; (main.s1126 + 0)
.s67:
2241 : a9 01 __ LDA #$01
2243 : 8d 95 87 STA $8795 ; (plotblink + 0)
2246 : 98 __ __ TYA
2247 : e9 10 __ SBC #$10
.s1126:
2249 : 8d 92 87 STA $8792 ; (plotcolor + 0)
224c : 8d b4 87 STA $87b4 ; (vdc_state + 7)
224f : 4c 3f 1f JMP $1f3f ; (main.s284 + 0)
.s136:
2252 : c9 41 __ CMP #$41
2254 : d0 0c __ BNE $2262 ; (main.s137 + 0)
.s50:
2256 : a9 00 __ LDA #$00
2258 : cd 96 87 CMP $8796 ; (plotaltchar + 0)
225b : 2a __ __ ROL
225c : 8d 96 87 STA $8796 ; (plotaltchar + 0)
225f : 4c 3f 1f JMP $1f3f ; (main.s284 + 0)
.s137:
2262 : b0 31 __ BCS $2295 ; (main.s48 + 0)
.s139:
2264 : c9 2e __ CMP #$2e
2266 : f0 03 __ BEQ $226b ; (main.s37 + 0)
2268 : 4c 9b 1e JMP $1e9b ; (main.s106 + 0)
.s37:
226b : ad 92 87 LDA $8792 ; (plotcolor + 0)
226e : c9 0f __ CMP #$0f
2270 : d0 17 __ BNE $2289 ; (main.s39 + 0)
.s38:
2272 : a0 00 __ LDY #$00
2274 : ad 90 87 LDA $8790 ; (screenbackground + 0)
2277 : f0 03 __ BEQ $227c ; (main.s41 + 0)
2279 : 4c 96 20 JMP $2096 ; (main.s288 + 0)
.s41:
227c : c0 0f __ CPY #$0f
227e : d0 05 __ BNE $2285 ; (main.s45 + 0)
.s44:
2280 : a9 00 __ LDA #$00
2282 : 4c 97 20 JMP $2097 ; (main.s285 + 0)
.s45:
2285 : c8 __ __ INY
2286 : 4c 96 20 JMP $2096 ; (main.s288 + 0)
.s39:
2289 : 18 __ __ CLC
228a : 69 01 __ ADC #$01
228c : a8 __ __ TAY
228d : cd 90 87 CMP $8790 ; (screenbackground + 0)
2290 : f0 ea __ BEQ $227c ; (main.s41 + 0)
2292 : 4c 96 20 JMP $2096 ; (main.s288 + 0)
.s48:
2295 : a9 00 __ LDA #$00
2297 : cd 95 87 CMP $8795 ; (plotblink + 0)
229a : 2a __ __ ROL
229b : 8d 95 87 STA $8795 ; (plotblink + 0)
229e : 4c 3f 1f JMP $1f3f ; (main.s284 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
22a1 : 38 __ __ SEC
22a2 : a5 23 __ LDA SP + 0 
22a4 : e9 06 __ SBC #$06
22a6 : 85 23 __ STA SP + 0 
22a8 : b0 02 __ BCS $22ac ; (bnk_init.s0 + 0)
22aa : c6 24 __ DEC SP + 1 
.s0:
22ac : a9 1f __ LDA #$1f
22ae : a0 02 __ LDY #$02
22b0 : 91 23 __ STA (SP + 0),y 
22b2 : a9 2a __ LDA #$2a
22b4 : c8 __ __ INY
22b5 : 91 23 __ STA (SP + 0),y 
22b7 : a5 ba __ LDA $ba 
22b9 : d0 02 __ BNE $22bd ; (bnk_init.s1002 + 0)
.s2:
22bb : a9 08 __ LDA #$08
.s1002:
22bd : 8d fe 86 STA $86fe ; (bootdevice + 0)
22c0 : a0 04 __ LDY #$04
22c2 : 91 23 __ STA (SP + 0),y 
22c4 : a9 00 __ LDA #$00
22c6 : c8 __ __ INY
22c7 : 91 23 __ STA (SP + 0),y 
22c9 : 20 f8 22 JSR $22f8 ; (printf.s0 + 0)
22cc : a9 06 __ LDA #$06
22ce : 8d 06 d5 STA $d506 
22d1 : a9 2f __ LDA #$2f
22d3 : a0 02 __ LDY #$02
22d5 : 91 23 __ STA (SP + 0),y 
22d7 : a9 2a __ LDA #$2a
22d9 : c8 __ __ INY
22da : 91 23 __ STA (SP + 0),y 
22dc : 20 f8 22 JSR $22f8 ; (printf.s0 + 0)
22df : a9 47 __ LDA #$47
22e1 : 8d f8 ab STA $abf8 ; (sstack + 5)
22e4 : a9 2b __ LDA #$2b
22e6 : 8d f9 ab STA $abf9 ; (sstack + 6)
22e9 : 20 49 2a JSR $2a49 ; (load_overlay.s1000 + 0)
.s1001:
22ec : 18 __ __ CLC
22ed : a5 23 __ LDA SP + 0 
22ef : 69 06 __ ADC #$06
22f1 : 85 23 __ STA SP + 0 
22f3 : 90 02 __ BCC $22f7 ; (bnk_init.s1001 + 11)
22f5 : e6 24 __ INC SP + 1 
22f7 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22f8 : a9 01 __ LDA #$01
22fa : 8d f7 ab STA $abf7 ; (sstack + 4)
22fd : a9 a5 __ LDA #$a5
22ff : 85 16 __ STA P9 
2301 : a9 ab __ LDA #$ab
2303 : 85 17 __ STA P10 
2305 : a0 02 __ LDY #$02
2307 : b1 23 __ LDA (SP + 0),y 
2309 : 8d f3 ab STA $abf3 ; (sstack + 0)
230c : c8 __ __ INY
230d : b1 23 __ LDA (SP + 0),y 
230f : 8d f4 ab STA $abf4 ; (sstack + 1)
2312 : 18 __ __ CLC
2313 : a5 23 __ LDA SP + 0 
2315 : 69 04 __ ADC #$04
2317 : 8d f5 ab STA $abf5 ; (sstack + 2)
231a : a5 24 __ LDA SP + 1 
231c : 69 00 __ ADC #$00
231e : 8d f6 ab STA $abf6 ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
2321 : a5 53 __ LDA T7 + 0 
2323 : 8d d7 ab STA $abd7 ; (vp_fill + 10)
2326 : a5 54 __ LDA T7 + 1 
2328 : 8d d8 ab STA $abd8 ; (vp_fill + 11)
232b : a5 55 __ LDA T7 + 2 
232d : 8d d9 ab STA $abd9 ; (vp_fill + 12)
.s0:
2330 : a9 00 __ LDA #$00
2332 : 85 47 __ STA T0 + 0 
2334 : ad f3 ab LDA $abf3 ; (sstack + 0)
2337 : 85 49 __ STA T1 + 0 
2339 : ad f4 ab LDA $abf4 ; (sstack + 1)
233c : 85 4a __ STA T1 + 1 
.l1:
233e : a0 00 __ LDY #$00
2340 : b1 49 __ LDA (T1 + 0),y 
2342 : d0 3c __ BNE $2380 ; (sformat.s2 + 0)
.s3:
2344 : a4 47 __ LDY T0 + 0 
2346 : 91 16 __ STA (P9),y ; (buff + 0)
2348 : 98 __ __ TYA
2349 : f0 1d __ BEQ $2368 ; (sformat.s1070 + 0)
.s116:
234b : ad f7 ab LDA $abf7 ; (sstack + 4)
234e : d0 0d __ BNE $235d ; (sformat.s119 + 0)
.s120:
2350 : 18 __ __ CLC
2351 : a5 16 __ LDA P9 ; (buff + 0)
2353 : 65 47 __ ADC T0 + 0 
2355 : aa __ __ TAX
2356 : a5 17 __ LDA P10 ; (buff + 1)
2358 : 69 00 __ ADC #$00
235a : 4c 6c 23 JMP $236c ; (sformat.s1001 + 0)
.s119:
235d : a5 16 __ LDA P9 ; (buff + 0)
235f : 85 0d __ STA P0 
2361 : a5 17 __ LDA P10 ; (buff + 1)
2363 : 85 0e __ STA P1 
2365 : 20 22 27 JSR $2722 ; (puts.s0 + 0)
.s1070:
2368 : a5 17 __ LDA P10 ; (buff + 1)
236a : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
236c : 86 1b __ STX ACCU + 0 ; (fps + 0)
236e : 85 1c __ STA ACCU + 1 ; (fps + 1)
2370 : ad d7 ab LDA $abd7 ; (vp_fill + 10)
2373 : 85 53 __ STA T7 + 0 
2375 : ad d8 ab LDA $abd8 ; (vp_fill + 11)
2378 : 85 54 __ STA T7 + 1 
237a : ad d9 ab LDA $abd9 ; (vp_fill + 12)
237d : 85 55 __ STA T7 + 2 
237f : 60 __ __ RTS
.s2:
2380 : c9 25 __ CMP #$25
2382 : f0 3f __ BEQ $23c3 ; (sformat.s4 + 0)
.s5:
2384 : a4 47 __ LDY T0 + 0 
2386 : 91 16 __ STA (P9),y ; (buff + 0)
2388 : e6 49 __ INC T1 + 0 
238a : d0 02 __ BNE $238e ; (sformat.s1098 + 0)
.s1097:
238c : e6 4a __ INC T1 + 1 
.s1098:
238e : c8 __ __ INY
238f : 84 47 __ STY T0 + 0 
2391 : 98 __ __ TYA
2392 : c0 28 __ CPY #$28
2394 : 90 a8 __ BCC $233e ; (sformat.l1 + 0)
.s110:
2396 : 85 4c __ STA T5 + 0 
2398 : a9 00 __ LDA #$00
239a : 85 47 __ STA T0 + 0 
239c : ad f7 ab LDA $abf7 ; (sstack + 4)
239f : f0 14 __ BEQ $23b5 ; (sformat.s114 + 0)
.s113:
23a1 : a5 16 __ LDA P9 ; (buff + 0)
23a3 : 85 0d __ STA P0 
23a5 : a5 17 __ LDA P10 ; (buff + 1)
23a7 : 85 0e __ STA P1 
23a9 : a9 00 __ LDA #$00
23ab : a4 4c __ LDY T5 + 0 
23ad : 91 16 __ STA (P9),y ; (buff + 0)
23af : 20 22 27 JSR $2722 ; (puts.s0 + 0)
23b2 : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s114:
23b5 : 18 __ __ CLC
23b6 : a5 16 __ LDA P9 ; (buff + 0)
23b8 : 65 4c __ ADC T5 + 0 
23ba : 85 16 __ STA P9 ; (buff + 0)
23bc : 90 80 __ BCC $233e ; (sformat.l1 + 0)
.s1099:
23be : e6 17 __ INC P10 ; (buff + 1)
23c0 : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s4:
23c3 : a5 47 __ LDA T0 + 0 
23c5 : f0 27 __ BEQ $23ee ; (sformat.s9 + 0)
.s7:
23c7 : 84 47 __ STY T0 + 0 
23c9 : 85 4c __ STA T5 + 0 
23cb : ad f7 ab LDA $abf7 ; (sstack + 4)
23ce : f0 13 __ BEQ $23e3 ; (sformat.s11 + 0)
.s10:
23d0 : a5 16 __ LDA P9 ; (buff + 0)
23d2 : 85 0d __ STA P0 
23d4 : a5 17 __ LDA P10 ; (buff + 1)
23d6 : 85 0e __ STA P1 
23d8 : 98 __ __ TYA
23d9 : a4 4c __ LDY T5 + 0 
23db : 91 16 __ STA (P9),y ; (buff + 0)
23dd : 20 22 27 JSR $2722 ; (puts.s0 + 0)
23e0 : 4c ee 23 JMP $23ee ; (sformat.s9 + 0)
.s11:
23e3 : 18 __ __ CLC
23e4 : a5 16 __ LDA P9 ; (buff + 0)
23e6 : 65 4c __ ADC T5 + 0 
23e8 : 85 16 __ STA P9 ; (buff + 0)
23ea : 90 02 __ BCC $23ee ; (sformat.s9 + 0)
.s1095:
23ec : e6 17 __ INC P10 ; (buff + 1)
.s9:
23ee : a9 0a __ LDA #$0a
23f0 : 8d de ab STA $abde ; (vp_fill + 17)
23f3 : a9 00 __ LDA #$00
23f5 : 8d df ab STA $abdf ; (vp_fill + 18)
23f8 : 8d e0 ab STA $abe0 ; (vp_fill + 19)
23fb : 8d e1 ab STA $abe1 ; (vp_fill + 20)
23fe : 8d e2 ab STA $abe2 ; (vp_fill + 21)
2401 : a0 01 __ LDY #$01
2403 : b1 49 __ LDA (T1 + 0),y 
2405 : a2 20 __ LDX #$20
2407 : 8e db ab STX $abdb ; (vp_fill + 14)
240a : a2 00 __ LDX #$00
240c : 8e dc ab STX $abdc ; (vp_fill + 15)
240f : ca __ __ DEX
2410 : 8e dd ab STX $abdd ; (vp_fill + 16)
2413 : aa __ __ TAX
2414 : 18 __ __ CLC
2415 : a5 49 __ LDA T1 + 0 
2417 : 69 02 __ ADC #$02
.l14:
2419 : 85 49 __ STA T1 + 0 
241b : 90 02 __ BCC $241f ; (sformat.s1082 + 0)
.s1081:
241d : e6 4a __ INC T1 + 1 
.s1082:
241f : 8a __ __ TXA
2420 : e0 2b __ CPX #$2b
2422 : d0 08 __ BNE $242c ; (sformat.s17 + 0)
.s16:
2424 : a9 01 __ LDA #$01
2426 : 8d e0 ab STA $abe0 ; (vp_fill + 19)
2429 : 4c 0d 27 JMP $270d ; (sformat.s264 + 0)
.s17:
242c : c9 30 __ CMP #$30
242e : d0 06 __ BNE $2436 ; (sformat.s20 + 0)
.s19:
2430 : 8d db ab STA $abdb ; (vp_fill + 14)
2433 : 4c 0d 27 JMP $270d ; (sformat.s264 + 0)
.s20:
2436 : c9 23 __ CMP #$23
2438 : d0 08 __ BNE $2442 ; (sformat.s23 + 0)
.s22:
243a : a9 01 __ LDA #$01
243c : 8d e2 ab STA $abe2 ; (vp_fill + 21)
243f : 4c 0d 27 JMP $270d ; (sformat.s264 + 0)
.s23:
2442 : c9 2d __ CMP #$2d
2444 : d0 08 __ BNE $244e ; (sformat.s15 + 0)
.s25:
2446 : a9 01 __ LDA #$01
2448 : 8d e1 ab STA $abe1 ; (vp_fill + 20)
244b : 4c 0d 27 JMP $270d ; (sformat.s264 + 0)
.s15:
244e : 85 4c __ STA T5 + 0 
2450 : c9 30 __ CMP #$30
2452 : 90 55 __ BCC $24a9 ; (sformat.s31 + 0)
.s32:
2454 : c9 3a __ CMP #$3a
2456 : b0 51 __ BCS $24a9 ; (sformat.s31 + 0)
.s29:
2458 : a9 00 __ LDA #$00
245a : 85 44 __ STA T6 + 0 
245c : 85 45 __ STA T6 + 1 
245e : e0 3a __ CPX #$3a
2460 : b0 40 __ BCS $24a2 ; (sformat.s35 + 0)
.l34:
2462 : a5 44 __ LDA T6 + 0 
2464 : 0a __ __ ASL
2465 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2467 : a5 45 __ LDA T6 + 1 
2469 : 2a __ __ ROL
246a : 06 1b __ ASL ACCU + 0 ; (fps + 0)
246c : 2a __ __ ROL
246d : aa __ __ TAX
246e : 18 __ __ CLC
246f : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2471 : 65 44 __ ADC T6 + 0 
2473 : 85 44 __ STA T6 + 0 
2475 : 8a __ __ TXA
2476 : 65 45 __ ADC T6 + 1 
2478 : 06 44 __ ASL T6 + 0 
247a : 2a __ __ ROL
247b : aa __ __ TAX
247c : 18 __ __ CLC
247d : a5 44 __ LDA T6 + 0 
247f : 65 4c __ ADC T5 + 0 
2481 : 90 01 __ BCC $2484 ; (sformat.s1092 + 0)
.s1091:
2483 : e8 __ __ INX
.s1092:
2484 : 38 __ __ SEC
2485 : e9 30 __ SBC #$30
2487 : 85 44 __ STA T6 + 0 
2489 : 8a __ __ TXA
248a : e9 00 __ SBC #$00
248c : 85 45 __ STA T6 + 1 
248e : a0 00 __ LDY #$00
2490 : b1 49 __ LDA (T1 + 0),y 
2492 : 85 4c __ STA T5 + 0 
2494 : e6 49 __ INC T1 + 0 
2496 : d0 02 __ BNE $249a ; (sformat.s1094 + 0)
.s1093:
2498 : e6 4a __ INC T1 + 1 
.s1094:
249a : c9 30 __ CMP #$30
249c : 90 04 __ BCC $24a2 ; (sformat.s35 + 0)
.s36:
249e : c9 3a __ CMP #$3a
24a0 : 90 c0 __ BCC $2462 ; (sformat.l34 + 0)
.s35:
24a2 : a5 44 __ LDA T6 + 0 
24a4 : 8d dc ab STA $abdc ; (vp_fill + 15)
24a7 : a5 4c __ LDA T5 + 0 
.s31:
24a9 : c9 2e __ CMP #$2e
24ab : d0 51 __ BNE $24fe ; (sformat.s39 + 0)
.s37:
24ad : a9 00 __ LDA #$00
24af : 85 44 __ STA T6 + 0 
.l243:
24b1 : 85 45 __ STA T6 + 1 
24b3 : a0 00 __ LDY #$00
24b5 : b1 49 __ LDA (T1 + 0),y 
24b7 : 85 4c __ STA T5 + 0 
24b9 : e6 49 __ INC T1 + 0 
24bb : d0 02 __ BNE $24bf ; (sformat.s1084 + 0)
.s1083:
24bd : e6 4a __ INC T1 + 1 
.s1084:
24bf : c9 30 __ CMP #$30
24c1 : 90 04 __ BCC $24c7 ; (sformat.s42 + 0)
.s43:
24c3 : c9 3a __ CMP #$3a
24c5 : 90 0a __ BCC $24d1 ; (sformat.s41 + 0)
.s42:
24c7 : a5 44 __ LDA T6 + 0 
24c9 : 8d dd ab STA $abdd ; (vp_fill + 16)
24cc : a5 4c __ LDA T5 + 0 
24ce : 4c fe 24 JMP $24fe ; (sformat.s39 + 0)
.s41:
24d1 : a5 44 __ LDA T6 + 0 
24d3 : 0a __ __ ASL
24d4 : 85 1b __ STA ACCU + 0 ; (fps + 0)
24d6 : a5 45 __ LDA T6 + 1 
24d8 : 2a __ __ ROL
24d9 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24db : 2a __ __ ROL
24dc : aa __ __ TAX
24dd : 18 __ __ CLC
24de : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24e0 : 65 44 __ ADC T6 + 0 
24e2 : 85 44 __ STA T6 + 0 
24e4 : 8a __ __ TXA
24e5 : 65 45 __ ADC T6 + 1 
24e7 : 06 44 __ ASL T6 + 0 
24e9 : 2a __ __ ROL
24ea : aa __ __ TAX
24eb : 18 __ __ CLC
24ec : a5 44 __ LDA T6 + 0 
24ee : 65 4c __ ADC T5 + 0 
24f0 : 90 01 __ BCC $24f3 ; (sformat.s1090 + 0)
.s1089:
24f2 : e8 __ __ INX
.s1090:
24f3 : 38 __ __ SEC
24f4 : e9 30 __ SBC #$30
24f6 : 85 44 __ STA T6 + 0 
24f8 : 8a __ __ TXA
24f9 : e9 00 __ SBC #$00
24fb : 4c b1 24 JMP $24b1 ; (sformat.l243 + 0)
.s39:
24fe : c9 64 __ CMP #$64
2500 : f0 04 __ BEQ $2506 ; (sformat.s44 + 0)
.s47:
2502 : c9 44 __ CMP #$44
2504 : d0 05 __ BNE $250b ; (sformat.s45 + 0)
.s44:
2506 : a9 01 __ LDA #$01
2508 : 4c d1 26 JMP $26d1 ; (sformat.s261 + 0)
.s45:
250b : c9 75 __ CMP #$75
250d : d0 03 __ BNE $2512 ; (sformat.s51 + 0)
250f : 4c cf 26 JMP $26cf ; (sformat.s291 + 0)
.s51:
2512 : c9 55 __ CMP #$55
2514 : d0 03 __ BNE $2519 ; (sformat.s49 + 0)
2516 : 4c cf 26 JMP $26cf ; (sformat.s291 + 0)
.s49:
2519 : c9 78 __ CMP #$78
251b : f0 04 __ BEQ $2521 ; (sformat.s52 + 0)
.s55:
251d : c9 58 __ CMP #$58
251f : d0 0d __ BNE $252e ; (sformat.s53 + 0)
.s52:
2521 : a9 10 __ LDA #$10
2523 : 8d de ab STA $abde ; (vp_fill + 17)
2526 : a9 00 __ LDA #$00
2528 : 8d df ab STA $abdf ; (vp_fill + 18)
252b : 4c cf 26 JMP $26cf ; (sformat.s291 + 0)
.s53:
252e : c9 6c __ CMP #$6c
2530 : d0 03 __ BNE $2535 ; (sformat.s59 + 0)
2532 : 4c 46 26 JMP $2646 ; (sformat.s56 + 0)
.s59:
2535 : c9 4c __ CMP #$4c
2537 : d0 03 __ BNE $253c ; (sformat.s57 + 0)
2539 : 4c 46 26 JMP $2646 ; (sformat.s56 + 0)
.s57:
253c : c9 73 __ CMP #$73
253e : f0 54 __ BEQ $2594 ; (sformat.s72 + 0)
.s75:
2540 : c9 53 __ CMP #$53
2542 : f0 50 __ BEQ $2594 ; (sformat.s72 + 0)
.s73:
2544 : c9 63 __ CMP #$63
2546 : f0 23 __ BEQ $256b ; (sformat.s103 + 0)
.s106:
2548 : c9 43 __ CMP #$43
254a : f0 1f __ BEQ $256b ; (sformat.s103 + 0)
.s104:
254c : 09 00 __ ORA #$00
254e : d0 03 __ BNE $2553 ; (sformat.s107 + 0)
2550 : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s107:
2553 : 18 __ __ CLC
2554 : a5 16 __ LDA P9 ; (buff + 0)
2556 : 65 47 __ ADC T0 + 0 
2558 : 85 44 __ STA T6 + 0 
255a : a5 17 __ LDA P10 ; (buff + 1)
255c : 69 00 __ ADC #$00
255e : 85 45 __ STA T6 + 1 
2560 : a5 4c __ LDA T5 + 0 
.s1068:
2562 : a0 00 __ LDY #$00
2564 : 91 44 __ STA (T6 + 0),y 
2566 : e6 47 __ INC T0 + 0 
2568 : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s103:
256b : ad f5 ab LDA $abf5 ; (sstack + 2)
256e : 85 4c __ STA T5 + 0 
2570 : 18 __ __ CLC
2571 : 69 02 __ ADC #$02
2573 : 8d f5 ab STA $abf5 ; (sstack + 2)
2576 : ad f6 ab LDA $abf6 ; (sstack + 3)
2579 : 85 4d __ STA T5 + 1 
257b : 69 00 __ ADC #$00
257d : 8d f6 ab STA $abf6 ; (sstack + 3)
2580 : 18 __ __ CLC
2581 : a5 16 __ LDA P9 ; (buff + 0)
2583 : 65 47 __ ADC T0 + 0 
2585 : 85 44 __ STA T6 + 0 
2587 : a5 17 __ LDA P10 ; (buff + 1)
2589 : 69 00 __ ADC #$00
258b : 85 45 __ STA T6 + 1 
258d : a0 00 __ LDY #$00
258f : b1 4c __ LDA (T5 + 0),y 
2591 : 4c 62 25 JMP $2562 ; (sformat.s1068 + 0)
.s72:
2594 : ad f5 ab LDA $abf5 ; (sstack + 2)
2597 : 85 4c __ STA T5 + 0 
2599 : 18 __ __ CLC
259a : 69 02 __ ADC #$02
259c : 8d f5 ab STA $abf5 ; (sstack + 2)
259f : ad f6 ab LDA $abf6 ; (sstack + 3)
25a2 : 85 4d __ STA T5 + 1 
25a4 : 69 00 __ ADC #$00
25a6 : 8d f6 ab STA $abf6 ; (sstack + 3)
25a9 : a0 00 __ LDY #$00
25ab : 84 4b __ STY T3 + 0 
25ad : b1 4c __ LDA (T5 + 0),y 
25af : aa __ __ TAX
25b0 : c8 __ __ INY
25b1 : b1 4c __ LDA (T5 + 0),y 
25b3 : 86 4c __ STX T5 + 0 
25b5 : 85 4d __ STA T5 + 1 
25b7 : ad dc ab LDA $abdc ; (vp_fill + 15)
25ba : f0 0c __ BEQ $25c8 ; (sformat.s78 + 0)
.s1073:
25bc : 88 __ __ DEY
25bd : b1 4c __ LDA (T5 + 0),y 
25bf : f0 05 __ BEQ $25c6 ; (sformat.s1074 + 0)
.l80:
25c1 : c8 __ __ INY
25c2 : b1 4c __ LDA (T5 + 0),y 
25c4 : d0 fb __ BNE $25c1 ; (sformat.l80 + 0)
.s1074:
25c6 : 84 4b __ STY T3 + 0 
.s78:
25c8 : ad e1 ab LDA $abe1 ; (vp_fill + 20)
25cb : d0 19 __ BNE $25e6 ; (sformat.s84 + 0)
.s1077:
25cd : a6 4b __ LDX T3 + 0 
25cf : ec dc ab CPX $abdc ; (vp_fill + 15)
25d2 : a4 47 __ LDY T0 + 0 
25d4 : b0 0c __ BCS $25e2 ; (sformat.s1078 + 0)
.l86:
25d6 : ad db ab LDA $abdb ; (vp_fill + 14)
25d9 : 91 16 __ STA (P9),y ; (buff + 0)
25db : e8 __ __ INX
25dc : ec dc ab CPX $abdc ; (vp_fill + 15)
25df : c8 __ __ INY
25e0 : 90 f4 __ BCC $25d6 ; (sformat.l86 + 0)
.s1078:
25e2 : 86 4b __ STX T3 + 0 
25e4 : 84 47 __ STY T0 + 0 
.s84:
25e6 : ad f7 ab LDA $abf7 ; (sstack + 4)
25e9 : d0 37 __ BNE $2622 ; (sformat.s88 + 0)
.l94:
25eb : a0 00 __ LDY #$00
25ed : b1 4c __ LDA (T5 + 0),y 
25ef : f0 0f __ BEQ $2600 ; (sformat.s251 + 0)
.s95:
25f1 : a4 47 __ LDY T0 + 0 
25f3 : 91 16 __ STA (P9),y ; (buff + 0)
25f5 : e6 47 __ INC T0 + 0 
25f7 : e6 4c __ INC T5 + 0 
25f9 : d0 f0 __ BNE $25eb ; (sformat.l94 + 0)
.s1087:
25fb : e6 4d __ INC T5 + 1 
25fd : 4c eb 25 JMP $25eb ; (sformat.l94 + 0)
.s251:
2600 : ad e1 ab LDA $abe1 ; (vp_fill + 20)
2603 : d0 03 __ BNE $2608 ; (sformat.s1075 + 0)
2605 : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s1075:
2608 : a6 4b __ LDX T3 + 0 
260a : ec dc ab CPX $abdc ; (vp_fill + 15)
260d : a4 47 __ LDY T0 + 0 
260f : b0 0c __ BCS $261d ; (sformat.s1076 + 0)
.l101:
2611 : ad db ab LDA $abdb ; (vp_fill + 14)
2614 : 91 16 __ STA (P9),y ; (buff + 0)
2616 : e8 __ __ INX
2617 : ec dc ab CPX $abdc ; (vp_fill + 15)
261a : c8 __ __ INY
261b : 90 f4 __ BCC $2611 ; (sformat.l101 + 0)
.s1076:
261d : 84 47 __ STY T0 + 0 
261f : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s88:
2622 : a5 47 __ LDA T0 + 0 
2624 : f0 1a __ BEQ $2640 ; (sformat.s93 + 0)
.s91:
2626 : a5 16 __ LDA P9 ; (buff + 0)
2628 : 85 0d __ STA P0 
262a : a5 17 __ LDA P10 ; (buff + 1)
262c : 85 0e __ STA P1 
262e : a9 00 __ LDA #$00
2630 : a4 47 __ LDY T0 + 0 
2632 : 91 16 __ STA (P9),y ; (buff + 0)
2634 : 20 22 27 JSR $2722 ; (puts.s0 + 0)
2637 : 20 1a 27 JSR $271a ; (puts@proxy + 0)
263a : a9 00 __ LDA #$00
263c : 85 47 __ STA T0 + 0 
263e : f0 c0 __ BEQ $2600 ; (sformat.s251 + 0)
.s93:
2640 : 20 1a 27 JSR $271a ; (puts@proxy + 0)
2643 : 4c 00 26 JMP $2600 ; (sformat.s251 + 0)
.s56:
2646 : ad f5 ab LDA $abf5 ; (sstack + 2)
2649 : 85 4c __ STA T5 + 0 
264b : 18 __ __ CLC
264c : 69 04 __ ADC #$04
264e : 8d f5 ab STA $abf5 ; (sstack + 2)
2651 : ad f6 ab LDA $abf6 ; (sstack + 3)
2654 : 85 4d __ STA T5 + 1 
2656 : 69 00 __ ADC #$00
2658 : 8d f6 ab STA $abf6 ; (sstack + 3)
265b : a0 00 __ LDY #$00
265d : b1 49 __ LDA (T1 + 0),y 
265f : aa __ __ TAX
2660 : e6 49 __ INC T1 + 0 
2662 : d0 02 __ BNE $2666 ; (sformat.s1086 + 0)
.s1085:
2664 : e6 4a __ INC T1 + 1 
.s1086:
2666 : b1 4c __ LDA (T5 + 0),y 
2668 : 85 53 __ STA T7 + 0 
266a : a0 01 __ LDY #$01
266c : b1 4c __ LDA (T5 + 0),y 
266e : 85 54 __ STA T7 + 1 
2670 : c8 __ __ INY
2671 : b1 4c __ LDA (T5 + 0),y 
2673 : 85 55 __ STA T7 + 2 
2675 : c8 __ __ INY
2676 : b1 4c __ LDA (T5 + 0),y 
2678 : a8 __ __ TAY
2679 : 8a __ __ TXA
267a : e0 64 __ CPX #$64
267c : f0 04 __ BEQ $2682 ; (sformat.s60 + 0)
.s63:
267e : c9 44 __ CMP #$44
2680 : d0 04 __ BNE $2686 ; (sformat.s61 + 0)
.s60:
2682 : a9 01 __ LDA #$01
2684 : d0 1f __ BNE $26a5 ; (sformat.s262 + 0)
.s61:
2686 : c9 75 __ CMP #$75
2688 : f0 19 __ BEQ $26a3 ; (sformat.s292 + 0)
.s67:
268a : c9 55 __ CMP #$55
268c : f0 15 __ BEQ $26a3 ; (sformat.s292 + 0)
.s65:
268e : c9 78 __ CMP #$78
2690 : f0 07 __ BEQ $2699 ; (sformat.s68 + 0)
.s71:
2692 : c9 58 __ CMP #$58
2694 : f0 03 __ BEQ $2699 ; (sformat.s68 + 0)
2696 : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s68:
2699 : a9 10 __ LDA #$10
269b : 8d de ab STA $abde ; (vp_fill + 17)
269e : a9 00 __ LDA #$00
26a0 : 8d df ab STA $abdf ; (vp_fill + 18)
.s292:
26a3 : a9 00 __ LDA #$00
.s262:
26a5 : 84 14 __ STY P7 
26a7 : 85 15 __ STA P8 
26a9 : a5 16 __ LDA P9 ; (buff + 0)
26ab : 85 0f __ STA P2 
26ad : a5 17 __ LDA P10 ; (buff + 1)
26af : 85 10 __ STA P3 
26b1 : a5 53 __ LDA T7 + 0 
26b3 : 85 11 __ STA P4 
26b5 : a5 54 __ LDA T7 + 1 
26b7 : 85 12 __ STA P5 
26b9 : a5 55 __ LDA T7 + 2 
26bb : 85 13 __ STA P6 
26bd : a9 db __ LDA #$db
26bf : 85 0d __ STA P0 
26c1 : a9 ab __ LDA #$ab
26c3 : 85 0e __ STA P1 
26c5 : 20 ac 28 JSR $28ac ; (nforml.s0 + 0)
.s1069:
26c8 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26ca : 85 47 __ STA T0 + 0 
26cc : 4c 3e 23 JMP $233e ; (sformat.l1 + 0)
.s291:
26cf : a9 00 __ LDA #$00
.s261:
26d1 : 85 13 __ STA P6 
26d3 : a5 16 __ LDA P9 ; (buff + 0)
26d5 : 85 0f __ STA P2 
26d7 : a5 17 __ LDA P10 ; (buff + 1)
26d9 : 85 10 __ STA P3 
26db : ad f5 ab LDA $abf5 ; (sstack + 2)
26de : 85 47 __ STA T0 + 0 
26e0 : ad f6 ab LDA $abf6 ; (sstack + 3)
26e3 : 85 48 __ STA T0 + 1 
26e5 : a0 00 __ LDY #$00
26e7 : b1 47 __ LDA (T0 + 0),y 
26e9 : 85 11 __ STA P4 
26eb : c8 __ __ INY
26ec : b1 47 __ LDA (T0 + 0),y 
26ee : 85 12 __ STA P5 
26f0 : 18 __ __ CLC
26f1 : a5 47 __ LDA T0 + 0 
26f3 : 69 02 __ ADC #$02
26f5 : 8d f5 ab STA $abf5 ; (sstack + 2)
26f8 : a5 48 __ LDA T0 + 1 
26fa : 69 00 __ ADC #$00
26fc : 8d f6 ab STA $abf6 ; (sstack + 3)
26ff : a9 db __ LDA #$db
2701 : 85 0d __ STA P0 
2703 : a9 ab __ LDA #$ab
2705 : 85 0e __ STA P1 
2707 : 20 77 27 JSR $2777 ; (nformi.s0 + 0)
270a : 4c c8 26 JMP $26c8 ; (sformat.s1069 + 0)
.s264:
270d : a0 00 __ LDY #$00
270f : b1 49 __ LDA (T1 + 0),y 
2711 : aa __ __ TAX
2712 : 18 __ __ CLC
2713 : a5 49 __ LDA T1 + 0 
2715 : 69 01 __ ADC #$01
2717 : 4c 19 24 JMP $2419 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
271a : a5 4c __ LDA $4c 
271c : 85 0d __ STA P0 
271e : a5 4d __ LDA $4d 
2720 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2722 : a0 00 __ LDY #$00
2724 : b1 0d __ LDA (P0),y 
2726 : f0 0b __ BEQ $2733 ; (puts.s1001 + 0)
2728 : 20 34 27 JSR $2734 ; (putpch + 0)
272b : e6 0d __ INC P0 
272d : d0 f3 __ BNE $2722 ; (puts.s0 + 0)
272f : e6 0e __ INC P1 
2731 : d0 ef __ BNE $2722 ; (puts.s0 + 0)
.s1001:
2733 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2734 : ae ff 61 LDX $61ff ; (giocharmap + 0)
2737 : e0 01 __ CPX #$01
2739 : 90 26 __ BCC $2761 ; (putpch + 45)
273b : c9 0a __ CMP #$0a
273d : d0 02 __ BNE $2741 ; (putpch + 13)
273f : a9 0d __ LDA #$0d
2741 : c9 09 __ CMP #$09
2743 : f0 1f __ BEQ $2764 ; (putpch + 48)
2745 : e0 02 __ CPX #$02
2747 : 90 18 __ BCC $2761 ; (putpch + 45)
2749 : c9 41 __ CMP #$41
274b : 90 14 __ BCC $2761 ; (putpch + 45)
274d : c9 7b __ CMP #$7b
274f : b0 10 __ BCS $2761 ; (putpch + 45)
2751 : c9 61 __ CMP #$61
2753 : b0 04 __ BCS $2759 ; (putpch + 37)
2755 : c9 5b __ CMP #$5b
2757 : b0 08 __ BCS $2761 ; (putpch + 45)
2759 : 49 20 __ EOR #$20
275b : e0 03 __ CPX #$03
275d : f0 02 __ BEQ $2761 ; (putpch + 45)
275f : 29 df __ AND #$df
2761 : 4c d2 ff JMP $ffd2 
2764 : 38 __ __ SEC
2765 : 20 f0 ff JSR $fff0 
2768 : 98 __ __ TYA
2769 : 29 03 __ AND #$03
276b : 49 03 __ EOR #$03
276d : aa __ __ TAX
276e : a9 20 __ LDA #$20
2770 : 20 d2 ff JSR $ffd2 
2773 : ca __ __ DEX
2774 : 10 fa __ BPL $2770 ; (putpch + 60)
2776 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2777 : a9 00 __ LDA #$00
2779 : 85 43 __ STA T0 + 0 
277b : a5 13 __ LDA P6 ; (s + 0)
277d : f0 13 __ BEQ $2792 ; (nformi.s182 + 0)
.s4:
277f : 24 12 __ BIT P5 ; (v + 1)
2781 : 10 0f __ BPL $2792 ; (nformi.s182 + 0)
.s1:
2783 : 38 __ __ SEC
2784 : a9 00 __ LDA #$00
2786 : e5 11 __ SBC P4 ; (v + 0)
2788 : 85 11 __ STA P4 ; (v + 0)
278a : a9 00 __ LDA #$00
278c : e5 12 __ SBC P5 ; (v + 1)
278e : 85 12 __ STA P5 ; (v + 1)
2790 : e6 43 __ INC T0 + 0 
.s182:
2792 : a9 10 __ LDA #$10
2794 : 85 44 __ STA T2 + 0 
2796 : a5 11 __ LDA P4 ; (v + 0)
2798 : 05 12 __ ORA P5 ; (v + 1)
279a : f0 46 __ BEQ $27e2 ; (nformi.s7 + 0)
.s42:
279c : a0 03 __ LDY #$03
279e : b1 0d __ LDA (P0),y ; (si + 0)
27a0 : 85 45 __ STA T4 + 0 
27a2 : c8 __ __ INY
27a3 : b1 0d __ LDA (P0),y ; (si + 0)
27a5 : 85 46 __ STA T4 + 1 
.l6:
27a7 : a5 11 __ LDA P4 ; (v + 0)
27a9 : 85 1b __ STA ACCU + 0 
27ab : a5 12 __ LDA P5 ; (v + 1)
27ad : 85 1c __ STA ACCU + 1 
27af : a5 45 __ LDA T4 + 0 
27b1 : 85 03 __ STA WORK + 0 
27b3 : a5 46 __ LDA T4 + 1 
27b5 : 85 04 __ STA WORK + 1 
27b7 : 20 c9 7c JSR $7cc9 ; (divmod + 0)
27ba : a5 06 __ LDA WORK + 3 
27bc : 30 08 __ BMI $27c6 ; (nformi.s78 + 0)
.s1019:
27be : d0 0a __ BNE $27ca ; (nformi.s77 + 0)
.s1018:
27c0 : a5 05 __ LDA WORK + 2 
27c2 : c9 0a __ CMP #$0a
27c4 : b0 04 __ BCS $27ca ; (nformi.s77 + 0)
.s78:
27c6 : a9 30 __ LDA #$30
27c8 : d0 02 __ BNE $27cc ; (nformi.s79 + 0)
.s77:
27ca : a9 37 __ LDA #$37
.s79:
27cc : 18 __ __ CLC
27cd : 65 05 __ ADC WORK + 2 
27cf : c6 44 __ DEC T2 + 0 
27d1 : a6 44 __ LDX T2 + 0 
27d3 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
27d6 : a5 1b __ LDA ACCU + 0 
27d8 : 85 11 __ STA P4 ; (v + 0)
27da : a5 1c __ LDA ACCU + 1 
27dc : 85 12 __ STA P5 ; (v + 1)
27de : 05 11 __ ORA P4 ; (v + 0)
27e0 : d0 c5 __ BNE $27a7 ; (nformi.l6 + 0)
.s7:
27e2 : a0 02 __ LDY #$02
27e4 : b1 0d __ LDA (P0),y ; (si + 0)
27e6 : c9 ff __ CMP #$ff
27e8 : d0 04 __ BNE $27ee ; (nformi.s80 + 0)
.s81:
27ea : a9 0f __ LDA #$0f
27ec : d0 05 __ BNE $27f3 ; (nformi.s1026 + 0)
.s80:
27ee : 38 __ __ SEC
27ef : a9 10 __ LDA #$10
27f1 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27f3 : a8 __ __ TAY
27f4 : c4 44 __ CPY T2 + 0 
27f6 : b0 0d __ BCS $2805 ; (nformi.s10 + 0)
.s9:
27f8 : a9 30 __ LDA #$30
.l1027:
27fa : c6 44 __ DEC T2 + 0 
27fc : a6 44 __ LDX T2 + 0 
27fe : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
2801 : c4 44 __ CPY T2 + 0 
2803 : 90 f5 __ BCC $27fa ; (nformi.l1027 + 0)
.s10:
2805 : a0 07 __ LDY #$07
2807 : b1 0d __ LDA (P0),y ; (si + 0)
2809 : f0 20 __ BEQ $282b ; (nformi.s13 + 0)
.s14:
280b : a0 04 __ LDY #$04
280d : b1 0d __ LDA (P0),y ; (si + 0)
280f : d0 1a __ BNE $282b ; (nformi.s13 + 0)
.s1013:
2811 : 88 __ __ DEY
2812 : b1 0d __ LDA (P0),y ; (si + 0)
2814 : c9 10 __ CMP #$10
2816 : d0 13 __ BNE $282b ; (nformi.s13 + 0)
.s11:
2818 : a9 58 __ LDA #$58
281a : a6 44 __ LDX T2 + 0 
281c : 9d e2 ab STA $abe2,x ; (vp_fill + 21)
281f : 8a __ __ TXA
2820 : 18 __ __ CLC
2821 : 69 fe __ ADC #$fe
2823 : 85 44 __ STA T2 + 0 
2825 : aa __ __ TAX
2826 : a9 30 __ LDA #$30
2828 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s13:
282b : a9 00 __ LDA #$00
282d : 85 1b __ STA ACCU + 0 
282f : a5 43 __ LDA T0 + 0 
2831 : f0 06 __ BEQ $2839 ; (nformi.s16 + 0)
.s15:
2833 : c6 44 __ DEC T2 + 0 
2835 : a9 2d __ LDA #$2d
2837 : d0 0a __ BNE $2843 ; (nformi.s1025 + 0)
.s16:
2839 : a0 05 __ LDY #$05
283b : b1 0d __ LDA (P0),y ; (si + 0)
283d : f0 09 __ BEQ $2848 ; (nformi.s163 + 0)
.s18:
283f : c6 44 __ DEC T2 + 0 
2841 : a9 2b __ LDA #$2b
.s1025:
2843 : a6 44 __ LDX T2 + 0 
2845 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s163:
2848 : a0 06 __ LDY #$06
284a : b1 0d __ LDA (P0),y ; (si + 0)
284c : d0 33 __ BNE $2881 ; (nformi.s24 + 0)
.l30:
284e : a0 01 __ LDY #$01
2850 : b1 0d __ LDA (P0),y ; (si + 0)
2852 : 18 __ __ CLC
2853 : 65 44 __ ADC T2 + 0 
2855 : b0 04 __ BCS $285b ; (nformi.s31 + 0)
.s1006:
2857 : c9 11 __ CMP #$11
2859 : 90 0d __ BCC $2868 ; (nformi.s33 + 0)
.s31:
285b : c6 44 __ DEC T2 + 0 
285d : a0 00 __ LDY #$00
285f : b1 0d __ LDA (P0),y ; (si + 0)
2861 : a6 44 __ LDX T2 + 0 
2863 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
2866 : b0 e6 __ BCS $284e ; (nformi.l30 + 0)
.s33:
2868 : a6 44 __ LDX T2 + 0 
286a : e0 10 __ CPX #$10
286c : b0 0e __ BCS $287c ; (nformi.s23 + 0)
.s34:
286e : 88 __ __ DEY
.l1022:
286f : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
2872 : 91 0f __ STA (P2),y ; (str + 0)
2874 : e8 __ __ INX
2875 : e0 10 __ CPX #$10
2877 : c8 __ __ INY
2878 : 90 f5 __ BCC $286f ; (nformi.l1022 + 0)
.s1023:
287a : 84 1b __ STY ACCU + 0 
.s23:
287c : a9 00 __ LDA #$00
287e : 85 1c __ STA ACCU + 1 
.s1001:
2880 : 60 __ __ RTS
.s24:
2881 : a6 44 __ LDX T2 + 0 
2883 : e0 10 __ CPX #$10
2885 : b0 1a __ BCS $28a1 ; (nformi.l27 + 0)
.s25:
2887 : a0 00 __ LDY #$00
.l1020:
2889 : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
288c : 91 0f __ STA (P2),y ; (str + 0)
288e : e8 __ __ INX
288f : e0 10 __ CPX #$10
2891 : c8 __ __ INY
2892 : 90 f5 __ BCC $2889 ; (nformi.l1020 + 0)
.s1021:
2894 : 84 1b __ STY ACCU + 0 
2896 : b0 09 __ BCS $28a1 ; (nformi.l27 + 0)
.s28:
2898 : 88 __ __ DEY
2899 : b1 0d __ LDA (P0),y ; (si + 0)
289b : a4 1b __ LDY ACCU + 0 
289d : 91 0f __ STA (P2),y ; (str + 0)
289f : e6 1b __ INC ACCU + 0 
.l27:
28a1 : a5 1b __ LDA ACCU + 0 
28a3 : a0 01 __ LDY #$01
28a5 : d1 0d __ CMP (P0),y ; (si + 0)
28a7 : 90 ef __ BCC $2898 ; (nformi.s28 + 0)
28a9 : 4c 7c 28 JMP $287c ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
28ac : a9 00 __ LDA #$00
28ae : 85 43 __ STA T0 + 0 
28b0 : a5 15 __ LDA P8 ; (s + 0)
28b2 : f0 21 __ BEQ $28d5 ; (nforml.s182 + 0)
.s4:
28b4 : a5 14 __ LDA P7 ; (v + 3)
28b6 : f0 1d __ BEQ $28d5 ; (nforml.s182 + 0)
.s1032:
28b8 : 10 1b __ BPL $28d5 ; (nforml.s182 + 0)
.s1:
28ba : 38 __ __ SEC
28bb : a9 00 __ LDA #$00
28bd : e5 11 __ SBC P4 ; (v + 0)
28bf : 85 11 __ STA P4 ; (v + 0)
28c1 : a9 00 __ LDA #$00
28c3 : e5 12 __ SBC P5 ; (v + 1)
28c5 : 85 12 __ STA P5 ; (v + 1)
28c7 : a9 00 __ LDA #$00
28c9 : e5 13 __ SBC P6 ; (v + 2)
28cb : 85 13 __ STA P6 ; (v + 2)
28cd : a9 00 __ LDA #$00
28cf : e5 14 __ SBC P7 ; (v + 3)
28d1 : 85 14 __ STA P7 ; (v + 3)
28d3 : e6 43 __ INC T0 + 0 
.s182:
28d5 : a9 10 __ LDA #$10
28d7 : 85 44 __ STA T2 + 0 
28d9 : a5 14 __ LDA P7 ; (v + 3)
28db : d0 0c __ BNE $28e9 ; (nforml.s42 + 0)
.s1024:
28dd : a5 13 __ LDA P6 ; (v + 2)
28df : d0 08 __ BNE $28e9 ; (nforml.s42 + 0)
.s1025:
28e1 : a5 12 __ LDA P5 ; (v + 1)
28e3 : d0 04 __ BNE $28e9 ; (nforml.s42 + 0)
.s1026:
28e5 : c5 11 __ CMP P4 ; (v + 0)
28e7 : b0 0e __ BCS $28f7 ; (nforml.s7 + 0)
.s42:
28e9 : a0 03 __ LDY #$03
28eb : b1 0d __ LDA (P0),y ; (si + 0)
28ed : 85 45 __ STA T5 + 0 
28ef : c8 __ __ INY
28f0 : b1 0d __ LDA (P0),y ; (si + 0)
28f2 : 85 46 __ STA T5 + 1 
28f4 : 4c c1 29 JMP $29c1 ; (nforml.l6 + 0)
.s7:
28f7 : a0 02 __ LDY #$02
28f9 : b1 0d __ LDA (P0),y ; (si + 0)
28fb : c9 ff __ CMP #$ff
28fd : d0 04 __ BNE $2903 ; (nforml.s80 + 0)
.s81:
28ff : a9 0f __ LDA #$0f
2901 : d0 05 __ BNE $2908 ; (nforml.s1039 + 0)
.s80:
2903 : 38 __ __ SEC
2904 : a9 10 __ LDA #$10
2906 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2908 : a8 __ __ TAY
2909 : c4 44 __ CPY T2 + 0 
290b : b0 0d __ BCS $291a ; (nforml.s10 + 0)
.s9:
290d : a9 30 __ LDA #$30
.l1040:
290f : c6 44 __ DEC T2 + 0 
2911 : a6 44 __ LDX T2 + 0 
2913 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
2916 : c4 44 __ CPY T2 + 0 
2918 : 90 f5 __ BCC $290f ; (nforml.l1040 + 0)
.s10:
291a : a0 07 __ LDY #$07
291c : b1 0d __ LDA (P0),y ; (si + 0)
291e : f0 20 __ BEQ $2940 ; (nforml.s13 + 0)
.s14:
2920 : a0 04 __ LDY #$04
2922 : b1 0d __ LDA (P0),y ; (si + 0)
2924 : d0 1a __ BNE $2940 ; (nforml.s13 + 0)
.s1013:
2926 : 88 __ __ DEY
2927 : b1 0d __ LDA (P0),y ; (si + 0)
2929 : c9 10 __ CMP #$10
292b : d0 13 __ BNE $2940 ; (nforml.s13 + 0)
.s11:
292d : a9 58 __ LDA #$58
292f : a6 44 __ LDX T2 + 0 
2931 : 9d e2 ab STA $abe2,x ; (vp_fill + 21)
2934 : 8a __ __ TXA
2935 : 18 __ __ CLC
2936 : 69 fe __ ADC #$fe
2938 : 85 44 __ STA T2 + 0 
293a : aa __ __ TAX
293b : a9 30 __ LDA #$30
293d : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s13:
2940 : a9 00 __ LDA #$00
2942 : 85 1b __ STA ACCU + 0 
2944 : a5 43 __ LDA T0 + 0 
2946 : f0 06 __ BEQ $294e ; (nforml.s16 + 0)
.s15:
2948 : c6 44 __ DEC T2 + 0 
294a : a9 2d __ LDA #$2d
294c : d0 0a __ BNE $2958 ; (nforml.s1038 + 0)
.s16:
294e : a0 05 __ LDY #$05
2950 : b1 0d __ LDA (P0),y ; (si + 0)
2952 : f0 09 __ BEQ $295d ; (nforml.s163 + 0)
.s18:
2954 : c6 44 __ DEC T2 + 0 
2956 : a9 2b __ LDA #$2b
.s1038:
2958 : a6 44 __ LDX T2 + 0 
295a : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s163:
295d : a0 06 __ LDY #$06
295f : b1 0d __ LDA (P0),y ; (si + 0)
2961 : d0 33 __ BNE $2996 ; (nforml.s24 + 0)
.l30:
2963 : a0 01 __ LDY #$01
2965 : b1 0d __ LDA (P0),y ; (si + 0)
2967 : 18 __ __ CLC
2968 : 65 44 __ ADC T2 + 0 
296a : b0 04 __ BCS $2970 ; (nforml.s31 + 0)
.s1006:
296c : c9 11 __ CMP #$11
296e : 90 0d __ BCC $297d ; (nforml.s33 + 0)
.s31:
2970 : c6 44 __ DEC T2 + 0 
2972 : a0 00 __ LDY #$00
2974 : b1 0d __ LDA (P0),y ; (si + 0)
2976 : a6 44 __ LDX T2 + 0 
2978 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
297b : b0 e6 __ BCS $2963 ; (nforml.l30 + 0)
.s33:
297d : a6 44 __ LDX T2 + 0 
297f : e0 10 __ CPX #$10
2981 : b0 0e __ BCS $2991 ; (nforml.s23 + 0)
.s34:
2983 : 88 __ __ DEY
.l1035:
2984 : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
2987 : 91 0f __ STA (P2),y ; (str + 0)
2989 : e8 __ __ INX
298a : e0 10 __ CPX #$10
298c : c8 __ __ INY
298d : 90 f5 __ BCC $2984 ; (nforml.l1035 + 0)
.s1036:
298f : 84 1b __ STY ACCU + 0 
.s23:
2991 : a9 00 __ LDA #$00
2993 : 85 1c __ STA ACCU + 1 
.s1001:
2995 : 60 __ __ RTS
.s24:
2996 : a6 44 __ LDX T2 + 0 
2998 : e0 10 __ CPX #$10
299a : b0 1a __ BCS $29b6 ; (nforml.l27 + 0)
.s25:
299c : a0 00 __ LDY #$00
.l1033:
299e : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
29a1 : 91 0f __ STA (P2),y ; (str + 0)
29a3 : e8 __ __ INX
29a4 : e0 10 __ CPX #$10
29a6 : c8 __ __ INY
29a7 : 90 f5 __ BCC $299e ; (nforml.l1033 + 0)
.s1034:
29a9 : 84 1b __ STY ACCU + 0 
29ab : b0 09 __ BCS $29b6 ; (nforml.l27 + 0)
.s28:
29ad : 88 __ __ DEY
29ae : b1 0d __ LDA (P0),y ; (si + 0)
29b0 : a4 1b __ LDY ACCU + 0 
29b2 : 91 0f __ STA (P2),y ; (str + 0)
29b4 : e6 1b __ INC ACCU + 0 
.l27:
29b6 : a5 1b __ LDA ACCU + 0 
29b8 : a0 01 __ LDY #$01
29ba : d1 0d __ CMP (P0),y ; (si + 0)
29bc : 90 ef __ BCC $29ad ; (nforml.s28 + 0)
29be : 4c 91 29 JMP $2991 ; (nforml.s23 + 0)
.l6:
29c1 : a5 11 __ LDA P4 ; (v + 0)
29c3 : 85 1b __ STA ACCU + 0 
29c5 : a5 12 __ LDA P5 ; (v + 1)
29c7 : 85 1c __ STA ACCU + 1 
29c9 : a5 13 __ LDA P6 ; (v + 2)
29cb : 85 1d __ STA ACCU + 2 
29cd : a5 14 __ LDA P7 ; (v + 3)
29cf : 85 1e __ STA ACCU + 3 
29d1 : a5 45 __ LDA T5 + 0 
29d3 : 85 03 __ STA WORK + 0 
29d5 : a5 46 __ LDA T5 + 1 
29d7 : 85 04 __ STA WORK + 1 
29d9 : a9 00 __ LDA #$00
29db : 85 05 __ STA WORK + 2 
29dd : 85 06 __ STA WORK + 3 
29df : 20 a7 7d JSR $7da7 ; (divmod32 + 0)
29e2 : a5 08 __ LDA WORK + 5 
29e4 : 30 08 __ BMI $29ee ; (nforml.s78 + 0)
.s1023:
29e6 : d0 0a __ BNE $29f2 ; (nforml.s77 + 0)
.s1022:
29e8 : a5 07 __ LDA WORK + 4 
29ea : c9 0a __ CMP #$0a
29ec : b0 04 __ BCS $29f2 ; (nforml.s77 + 0)
.s78:
29ee : a9 30 __ LDA #$30
29f0 : d0 02 __ BNE $29f4 ; (nforml.s79 + 0)
.s77:
29f2 : a9 37 __ LDA #$37
.s79:
29f4 : 18 __ __ CLC
29f5 : 65 07 __ ADC WORK + 4 
29f7 : c6 44 __ DEC T2 + 0 
29f9 : a6 44 __ LDX T2 + 0 
29fb : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
29fe : a5 1b __ LDA ACCU + 0 
2a00 : 85 11 __ STA P4 ; (v + 0)
2a02 : a5 1c __ LDA ACCU + 1 
2a04 : 85 12 __ STA P5 ; (v + 1)
2a06 : a5 1d __ LDA ACCU + 2 
2a08 : 85 13 __ STA P6 ; (v + 2)
2a0a : a5 1e __ LDA ACCU + 3 
2a0c : 85 14 __ STA P7 ; (v + 3)
2a0e : d0 b1 __ BNE $29c1 ; (nforml.l6 + 0)
.s1018:
2a10 : a5 13 __ LDA P6 ; (v + 2)
2a12 : d0 ad __ BNE $29c1 ; (nforml.l6 + 0)
.s1019:
2a14 : a5 12 __ LDA P5 ; (v + 1)
2a16 : d0 a9 __ BNE $29c1 ; (nforml.l6 + 0)
.s1020:
2a18 : c5 11 __ CMP P4 ; (v + 0)
2a1a : 90 a5 __ BCC $29c1 ; (nforml.l6 + 0)
2a1c : 4c f7 28 JMP $28f7 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2a1f : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2a2f : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2a3f : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2a49 : 38 __ __ SEC
2a4a : a5 23 __ LDA SP + 0 
2a4c : e9 06 __ SBC #$06
2a4e : 85 23 __ STA SP + 0 
2a50 : b0 02 __ BCS $2a54 ; (load_overlay.s0 + 0)
2a52 : c6 24 __ DEC SP + 1 
.s0:
2a54 : a9 00 __ LDA #$00
2a56 : 85 0d __ STA P0 
2a58 : 85 0e __ STA P1 
2a5a : 20 b6 2a JSR $2ab6 ; (krnio_setbnk.s0 + 0)
2a5d : ad f8 ab LDA $abf8 ; (sstack + 5)
2a60 : 85 0d __ STA P0 
2a62 : ad f9 ab LDA $abf9 ; (sstack + 6)
2a65 : 85 0e __ STA P1 
2a67 : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
2a6a : a9 01 __ LDA #$01
2a6c : 85 0d __ STA P0 
2a6e : 85 0f __ STA P2 
2a70 : ad fe 86 LDA $86fe ; (bootdevice + 0)
2a73 : 85 0e __ STA P1 
2a75 : 20 db 2a JSR $2adb ; (krnio_load.s0 + 0)
2a78 : 09 00 __ ORA #$00
2a7a : d0 2a __ BNE $2aa6 ; (load_overlay.s1001 + 0)
.s1:
2a7c : a9 00 __ LDA #$00
2a7e : a0 02 __ LDY #$02
2a80 : 91 23 __ STA (SP + 0),y 
2a82 : a9 2b __ LDA #$2b
2a84 : c8 __ __ INY
2a85 : 91 23 __ STA (SP + 0),y 
2a87 : 20 f8 22 JSR $22f8 ; (printf.s0 + 0)
2a8a : a9 1e __ LDA #$1e
2a8c : a0 02 __ LDY #$02
2a8e : 91 23 __ STA (SP + 0),y 
2a90 : a9 2b __ LDA #$2b
2a92 : c8 __ __ INY
2a93 : 91 23 __ STA (SP + 0),y 
2a95 : ad 7b 87 LDA $877b ; (krnio_pstatus + 1)
2a98 : c8 __ __ INY
2a99 : 91 23 __ STA (SP + 0),y 
2a9b : a9 00 __ LDA #$00
2a9d : c8 __ __ INY
2a9e : 91 23 __ STA (SP + 0),y 
2aa0 : 20 f8 22 JSR $22f8 ; (printf.s0 + 0)
2aa3 : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
.s1001:
2aa6 : 18 __ __ CLC
2aa7 : a5 23 __ LDA SP + 0 
2aa9 : 69 06 __ ADC #$06
2aab : 85 23 __ STA SP + 0 
2aad : 90 02 __ BCC $2ab1 ; (load_overlay.s1001 + 11)
2aaf : e6 24 __ INC SP + 1 
2ab1 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setbnk@proxy: ; krnio_setbnk@proxy
2ab2 : a9 00 __ LDA #$00
2ab4 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2ab6 : a5 0d __ LDA P0 
2ab8 : a6 0e __ LDX P1 
2aba : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam@proxy: ; krnio_setnam@proxy
2abd : a9 00 __ LDA #$00
2abf : 85 0d __ STA P0 
2ac1 : a9 89 __ LDA #$89
2ac3 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2ac5 : a5 0d __ LDA P0 
2ac7 : 05 0e __ ORA P1 
2ac9 : f0 08 __ BEQ $2ad3 ; (krnio_setnam.s0 + 14)
2acb : a0 ff __ LDY #$ff
2acd : c8 __ __ INY
2ace : b1 0d __ LDA (P0),y 
2ad0 : d0 fb __ BNE $2acd ; (krnio_setnam.s0 + 8)
2ad2 : 98 __ __ TYA
2ad3 : a6 0d __ LDX P0 
2ad5 : a4 0e __ LDY P1 
2ad7 : 20 bd ff JSR $ffbd 
.s1001:
2ada : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2adb : a5 0d __ LDA P0 
2add : a6 0e __ LDX P1 
2adf : a4 0f __ LDY P2 
2ae1 : 20 ba ff JSR $ffba 
2ae4 : a9 00 __ LDA #$00
2ae6 : a2 00 __ LDX #$00
2ae8 : a0 00 __ LDY #$00
2aea : 20 d5 ff JSR $ffd5 
2aed : a9 00 __ LDA #$00
2aef : b0 02 __ BCS $2af3 ; (krnio_load.s0 + 24)
2af1 : a9 01 __ LDA #$01
2af3 : 85 1b __ STA ACCU + 0 
.s1001:
2af5 : a5 1b __ LDA ACCU + 0 
2af7 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
2af8 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
2afb : 85 12 __ STA P5 
2afd : 4c d2 2c JMP $2cd2 ; (vdc_hchar.s0 + 0)
--------------------------------------------------------------------
2b00 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2b10 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
2b1e : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
2b2a : a9 01 __ LDA #$01
2b2c : 85 0d __ STA P0 
2b2e : a9 00 __ LDA #$00
2b30 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2b32 : a5 0d __ LDA P0 
2b34 : 85 1b __ STA ACCU + 0 
2b36 : a5 0e __ LDA P1 
2b38 : 85 1c __ STA ACCU + 1 
2b3a : ae fe 61 LDX $61fe ; (spentry + 0)
2b3d : 9a __ __ TXS
2b3e : a9 4c __ LDA #$4c
2b40 : 85 54 __ STA $54 
2b42 : a9 00 __ LDA #$00
2b44 : 85 13 __ STA P6 
.s1001:
2b46 : 60 __ __ RTS
--------------------------------------------------------------------
2b47 : __ __ __ BYT 56 44 43 53 45 4c 4d 43 00                      : VDCSELMC.
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2b50 : 38 __ __ SEC
2b51 : a5 23 __ LDA SP + 0 
2b53 : e9 04 __ SBC #$04
2b55 : 85 23 __ STA SP + 0 
2b57 : b0 02 __ BCS $2b5b ; (vdc_init.s0 + 0)
2b59 : c6 24 __ DEC SP + 1 
.s0:
2b5b : a2 14 __ LDX #$14
.l1002:
2b5d : bd 40 82 LDA $8240,x ; (vdc_clear@proxy + 10)
2b60 : 9d ff 0f STA $0fff,x 
2b63 : ca __ __ DEX
2b64 : d0 f7 __ BNE $2b5d ; (vdc_init.l1002 + 0)
.s1003:
2b66 : a9 1a __ LDA #$1a
2b68 : 8d 00 d6 STA $d600 
.l128:
2b6b : 2c 00 d6 BIT $d600 
2b6e : 10 fb __ BPL $2b6b ; (vdc_init.l128 + 0)
.s7:
2b70 : ad 01 d6 LDA $d601 
2b73 : 29 f0 __ AND #$f0
2b75 : aa __ __ TAX
2b76 : a9 1a __ LDA #$1a
2b78 : 8d 00 d6 STA $d600 
.l130:
2b7b : 2c 00 d6 BIT $d600 
2b7e : 10 fb __ BPL $2b7b ; (vdc_init.l130 + 0)
.s13:
2b80 : 8e 01 d6 STX $d601 
2b83 : 8d 00 d6 STA $d600 
.l132:
2b86 : 2c 00 d6 BIT $d600 
2b89 : 10 fb __ BPL $2b86 ; (vdc_init.l132 + 0)
.s20:
2b8b : ad 01 d6 LDA $d601 
2b8e : 29 0f __ AND #$0f
2b90 : 09 d0 __ ORA #$d0
2b92 : a2 1a __ LDX #$1a
2b94 : 8e 00 d6 STX $d600 
.l134:
2b97 : 2c 00 d6 BIT $d600 
2b9a : 10 fb __ BPL $2b97 ; (vdc_init.l134 + 0)
.s26:
2b9c : 8d 01 d6 STA $d601 
2b9f : a9 8d __ LDA #$8d
2ba1 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
2ba4 : 20 e0 2b JSR $2be0 ; (vdc_detect_mem_size.s0 + 0)
2ba7 : 24 d7 __ BIT $d7 
2ba9 : 30 17 __ BMI $2bc2 ; (vdc_init.s29 + 0)
.s32:
2bab : a9 a5 __ LDA #$a5
2bad : a0 02 __ LDY #$02
2baf : 91 23 __ STA (SP + 0),y 
2bb1 : a9 2d __ LDA #$2d
2bb3 : c8 __ __ INY
2bb4 : 91 23 __ STA (SP + 0),y 
2bb6 : 20 f8 22 JSR $22f8 ; (printf.s0 + 0)
2bb9 : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
2bbc : 20 81 ff JSR $ff81 
2bbf : 20 10 2e JSR $2e10 ; (screen_setmode.s0 + 0)
.s29:
2bc2 : a9 01 __ LDA #$01
2bc4 : 20 18 2e JSR $2e18 ; (fastmode.s0 + 0)
2bc7 : 20 37 2e JSR $2e37 ; (vdc_set_mode@proxy + 0)
2bca : ad ad 87 LDA $87ad ; (vdc_state + 0)
2bcd : c9 40 __ CMP #$40
2bcf : d0 03 __ BNE $2bd4 ; (vdc_init.s1001 + 0)
.s39:
2bd1 : 20 2a 30 JSR $302a ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
2bd4 : 18 __ __ CLC
2bd5 : a5 23 __ LDA SP + 0 
2bd7 : 69 04 __ ADC #$04
2bd9 : 85 23 __ STA SP + 0 
2bdb : 90 02 __ BCC $2bdf ; (vdc_init.s1001 + 11)
2bdd : e6 24 __ INC SP + 1 
2bdf : 60 __ __ RTS
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2be0 : a9 1c __ LDA #$1c
2be2 : 8d 00 d6 STA $d600 
.l335:
2be5 : 2c 00 d6 BIT $d600 
2be8 : 10 fb __ BPL $2be5 ; (vdc_detect_mem_size.l335 + 0)
.s5:
2bea : ad 01 d6 LDA $d601 
2bed : a8 __ __ TAY
2bee : 09 10 __ ORA #$10
2bf0 : a2 1c __ LDX #$1c
2bf2 : 8e 00 d6 STX $d600 
.l337:
2bf5 : 2c 00 d6 BIT $d600 
2bf8 : 10 fb __ BPL $2bf5 ; (vdc_detect_mem_size.l337 + 0)
.s12:
2bfa : 8d 01 d6 STA $d601 
2bfd : a9 12 __ LDA #$12
2bff : 8d 00 d6 STA $d600 
.l339:
2c02 : 2c 00 d6 BIT $d600 
2c05 : 10 fb __ BPL $2c02 ; (vdc_detect_mem_size.l339 + 0)
.s19:
2c07 : a9 1f __ LDA #$1f
2c09 : 8d 01 d6 STA $d601 
2c0c : a9 13 __ LDA #$13
2c0e : 8d 00 d6 STA $d600 
.l341:
2c11 : 2c 00 d6 BIT $d600 
2c14 : 10 fb __ BPL $2c11 ; (vdc_detect_mem_size.l341 + 0)
.s24:
2c16 : a9 ff __ LDA #$ff
2c18 : 8d 01 d6 STA $d601 
2c1b : a9 1f __ LDA #$1f
2c1d : 8d 00 d6 STA $d600 
.l343:
2c20 : 2c 00 d6 BIT $d600 
2c23 : 10 fb __ BPL $2c20 ; (vdc_detect_mem_size.l343 + 0)
.s28:
2c25 : a9 00 __ LDA #$00
2c27 : 8d 01 d6 STA $d601 
2c2a : a9 12 __ LDA #$12
2c2c : 8d 00 d6 STA $d600 
.l345:
2c2f : 2c 00 d6 BIT $d600 
2c32 : 10 fb __ BPL $2c2f ; (vdc_detect_mem_size.l345 + 0)
.s35:
2c34 : a9 9f __ LDA #$9f
2c36 : 8d 01 d6 STA $d601 
2c39 : a9 13 __ LDA #$13
2c3b : 8d 00 d6 STA $d600 
.l347:
2c3e : 2c 00 d6 BIT $d600 
2c41 : 10 fb __ BPL $2c3e ; (vdc_detect_mem_size.l347 + 0)
.s40:
2c43 : a9 ff __ LDA #$ff
2c45 : 8d 01 d6 STA $d601 
2c48 : a9 1f __ LDA #$1f
2c4a : 8d 00 d6 STA $d600 
.l349:
2c4d : 2c 00 d6 BIT $d600 
2c50 : 10 fb __ BPL $2c4d ; (vdc_detect_mem_size.l349 + 0)
.s44:
2c52 : a9 ff __ LDA #$ff
2c54 : 8d 01 d6 STA $d601 
2c57 : a9 12 __ LDA #$12
2c59 : 8d 00 d6 STA $d600 
.l351:
2c5c : 2c 00 d6 BIT $d600 
2c5f : 10 fb __ BPL $2c5c ; (vdc_detect_mem_size.l351 + 0)
.s51:
2c61 : a9 1f __ LDA #$1f
2c63 : 8d 01 d6 STA $d601 
2c66 : a9 13 __ LDA #$13
2c68 : 8d 00 d6 STA $d600 
.l353:
2c6b : 2c 00 d6 BIT $d600 
2c6e : 10 fb __ BPL $2c6b ; (vdc_detect_mem_size.l353 + 0)
.s56:
2c70 : a9 ff __ LDA #$ff
2c72 : 8d 01 d6 STA $d601 
2c75 : a9 1f __ LDA #$1f
2c77 : 8d 00 d6 STA $d600 
.l355:
2c7a : 2c 00 d6 BIT $d600 
2c7d : 10 fb __ BPL $2c7a ; (vdc_detect_mem_size.l355 + 0)
.s60:
2c7f : ad 01 d6 LDA $d601 
2c82 : f0 04 __ BEQ $2c88 ; (vdc_detect_mem_size.s1026 + 0)
.s1027:
2c84 : a9 10 __ LDA #$10
2c86 : d0 02 __ BNE $2c8a ; (vdc_detect_mem_size.s1028 + 0)
.s1026:
2c88 : a9 40 __ LDA #$40
.s1028:
2c8a : 8d ad 87 STA $87ad ; (vdc_state + 0)
2c8d : 8e 00 d6 STX $d600 
.l358:
2c90 : 2c 00 d6 BIT $d600 
2c93 : 10 fb __ BPL $2c90 ; (vdc_detect_mem_size.l358 + 0)
.s67:
2c95 : 8c 01 d6 STY $d601 
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2c98 : a9 00 __ LDA #$00
2c9a : 85 0f __ STA P2 
2c9c : 85 14 __ STA P7 
2c9e : ad b0 87 LDA $87b0 ; (vdc_state + 3)
2ca1 : 85 13 __ STA P6 
2ca3 : ad b2 87 LDA $87b2 ; (vdc_state + 5)
2ca6 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
2ca8 : a9 20 __ LDA #$20
2caa : 85 11 __ STA P4 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2cac : 18 __ __ CLC
2cad : a5 14 __ LDA P7 ; (y + 0)
2caf : 65 15 __ ADC P8 ; (lines + 0)
2cb1 : 85 46 __ STA T1 + 0 
2cb3 : a9 00 __ LDA #$00
2cb5 : 2a __ __ ROL
2cb6 : 85 47 __ STA T1 + 1 
.l1:
2cb8 : f0 05 __ BEQ $2cbf ; (vdc_clear.s1002 + 0)
.s1004:
2cba : a5 14 __ LDA P7 ; (y + 0)
2cbc : 4c c5 2c JMP $2cc5 ; (vdc_clear.s2 + 0)
.s1002:
2cbf : a5 14 __ LDA P7 ; (y + 0)
2cc1 : c5 46 __ CMP T1 + 0 
2cc3 : b0 0c __ BCS $2cd1 ; (vdc_clear.s1001 + 0)
.s2:
2cc5 : 85 10 __ STA P3 
2cc7 : 20 f8 2a JSR $2af8 ; (vdc_hchar@proxy + 0)
2cca : e6 14 __ INC P7 ; (y + 0)
2ccc : a5 47 __ LDA T1 + 1 
2cce : 4c b8 2c JMP $2cb8 ; (vdc_clear.l1 + 0)
.s1001:
2cd1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
2cd2 : a5 10 __ LDA P3 ; (y + 0)
2cd4 : 0a __ __ ASL
2cd5 : aa __ __ TAX
2cd6 : bd 00 88 LDA $8800,x ; (multab + 0)
2cd9 : 18 __ __ CLC
2cda : 65 0f __ ADC P2 ; (x + 0)
2cdc : 85 43 __ STA T1 + 0 
2cde : bd 01 88 LDA $8801,x ; (multab + 1)
2ce1 : 69 00 __ ADC #$00
2ce3 : 85 44 __ STA T1 + 1 
2ce5 : ad b5 87 LDA $87b5 ; (vdc_state + 8)
2ce8 : 18 __ __ CLC
2ce9 : 65 43 __ ADC T1 + 0 
2ceb : 85 0d __ STA P0 
2ced : ad b6 87 LDA $87b6 ; (vdc_state + 9)
2cf0 : 65 44 __ ADC T1 + 1 
2cf2 : 85 0e __ STA P1 
2cf4 : 20 81 2d JSR $2d81 ; (vdc_mem_addr.s0 + 0)
2cf7 : a6 13 __ LDX P6 ; (length + 0)
2cf9 : ca __ __ DEX
2cfa : 86 45 __ STX T2 + 0 
.l221:
2cfc : 2c 00 d6 BIT $d600 
2cff : 10 fb __ BPL $2cfc ; (vdc_hchar.l221 + 0)
.s6:
2d01 : a5 11 __ LDA P4 ; (val + 0)
2d03 : 8d 01 d6 STA $d601 
2d06 : a9 18 __ LDA #$18
2d08 : 8d 00 d6 STA $d600 
.l223:
2d0b : 2c 00 d6 BIT $d600 
2d0e : 10 fb __ BPL $2d0b ; (vdc_hchar.l223 + 0)
.s12:
2d10 : ad 01 d6 LDA $d601 
2d13 : 29 7f __ AND #$7f
2d15 : a2 18 __ LDX #$18
2d17 : 8e 00 d6 STX $d600 
.l225:
2d1a : 2c 00 d6 BIT $d600 
2d1d : 10 fb __ BPL $2d1a ; (vdc_hchar.l225 + 0)
.s18:
2d1f : 8d 01 d6 STA $d601 
2d22 : a9 1e __ LDA #$1e
2d24 : 8d 00 d6 STA $d600 
.l227:
2d27 : 2c 00 d6 BIT $d600 
2d2a : 10 fb __ BPL $2d27 ; (vdc_hchar.l227 + 0)
.s23:
2d2c : a5 45 __ LDA T2 + 0 
2d2e : 8d 01 d6 STA $d601 
2d31 : ad b7 87 LDA $87b7 ; (vdc_state + 10)
2d34 : 18 __ __ CLC
2d35 : 65 43 __ ADC T1 + 0 
2d37 : 85 0d __ STA P0 
2d39 : ad b8 87 LDA $87b8 ; (vdc_state + 11)
2d3c : 65 44 __ ADC T1 + 1 
2d3e : 85 0e __ STA P1 
2d40 : 20 81 2d JSR $2d81 ; (vdc_mem_addr.s0 + 0)
.l229:
2d43 : 2c 00 d6 BIT $d600 
2d46 : 10 fb __ BPL $2d43 ; (vdc_hchar.l229 + 0)
.s27:
2d48 : a5 12 __ LDA P5 ; (attr + 0)
2d4a : 8d 01 d6 STA $d601 
2d4d : a9 18 __ LDA #$18
2d4f : 8d 00 d6 STA $d600 
.l231:
2d52 : 2c 00 d6 BIT $d600 
2d55 : 10 fb __ BPL $2d52 ; (vdc_hchar.l231 + 0)
.s33:
2d57 : ad 01 d6 LDA $d601 
2d5a : 29 7f __ AND #$7f
2d5c : a2 18 __ LDX #$18
2d5e : 8e 00 d6 STX $d600 
.l233:
2d61 : 2c 00 d6 BIT $d600 
2d64 : 10 fb __ BPL $2d61 ; (vdc_hchar.l233 + 0)
.s39:
2d66 : 8d 01 d6 STA $d601 
2d69 : a9 1e __ LDA #$1e
2d6b : 8d 00 d6 STA $d600 
.l235:
2d6e : 2c 00 d6 BIT $d600 
2d71 : 10 fb __ BPL $2d6e ; (vdc_hchar.l235 + 0)
.s44:
2d73 : a5 45 __ LDA T2 + 0 
2d75 : 8d 01 d6 STA $d601 
.s1001:
2d78 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2d79 : a5 0f __ LDA P2 
2d7b : 85 0d __ STA P0 
2d7d : a5 10 __ LDA P3 
2d7f : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2d81 : a9 12 __ LDA #$12
2d83 : 8d 00 d6 STA $d600 
.l56:
2d86 : 2c 00 d6 BIT $d600 
2d89 : 10 fb __ BPL $2d86 ; (vdc_mem_addr.l56 + 0)
.s5:
2d8b : a5 0e __ LDA P1 ; (addr + 1)
2d8d : 8d 01 d6 STA $d601 
2d90 : a9 13 __ LDA #$13
2d92 : 8d 00 d6 STA $d600 
.l58:
2d95 : 2c 00 d6 BIT $d600 
2d98 : 10 fb __ BPL $2d95 ; (vdc_mem_addr.l58 + 0)
.s10:
2d9a : a5 0d __ LDA P0 ; (addr + 0)
2d9c : 8d 01 d6 STA $d601 
2d9f : a9 1f __ LDA #$1f
2da1 : 8d 00 d6 STA $d600 
.s1001:
2da4 : 60 __ __ RTS
--------------------------------------------------------------------
2da5 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2db5 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2dc5 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
2dd0 : 20 dc 2d JSR $2ddc ; (getpch + 0)
2dd3 : c9 00 __ CMP #$00
2dd5 : f0 f9 __ BEQ $2dd0 ; (getch.s0 + 0)
2dd7 : 85 1b __ STA ACCU + 0 
.s1001:
2dd9 : a5 1b __ LDA ACCU + 0 
2ddb : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2ddc : 20 e4 ff JSR $ffe4 
2ddf : ae ff 61 LDX $61ff ; (giocharmap + 0)
2de2 : e0 01 __ CPX #$01
2de4 : 90 26 __ BCC $2e0c ; (getpch + 48)
2de6 : c9 0d __ CMP #$0d
2de8 : d0 02 __ BNE $2dec ; (getpch + 16)
2dea : a9 0a __ LDA #$0a
2dec : e0 02 __ CPX #$02
2dee : 90 1c __ BCC $2e0c ; (getpch + 48)
2df0 : c9 db __ CMP #$db
2df2 : b0 18 __ BCS $2e0c ; (getpch + 48)
2df4 : c9 41 __ CMP #$41
2df6 : 90 14 __ BCC $2e0c ; (getpch + 48)
2df8 : c9 c1 __ CMP #$c1
2dfa : 90 02 __ BCC $2dfe ; (getpch + 34)
2dfc : 49 a0 __ EOR #$a0
2dfe : c9 7b __ CMP #$7b
2e00 : b0 0a __ BCS $2e0c ; (getpch + 48)
2e02 : c9 61 __ CMP #$61
2e04 : b0 04 __ BCS $2e0a ; (getpch + 46)
2e06 : c9 5b __ CMP #$5b
2e08 : b0 02 __ BCS $2e0c ; (getpch + 48)
2e0a : 49 20 __ EOR #$20
2e0c : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2e0d : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2e10 : 24 d7 __ BIT $d7 
2e12 : 10 01 __ BPL $2e15 ; (screen_setmode.s6 + 0)
.s1001:
2e14 : 60 __ __ RTS
.s6:
2e15 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2e18 : 09 00 __ ORA #$00
2e1a : d0 0d __ BNE $2e29 ; (fastmode.s1 + 0)
.s2:
2e1c : 8d 30 d0 STA $d030 
2e1f : ad 11 d0 LDA $d011 
2e22 : 29 7f __ AND #$7f
2e24 : 09 10 __ ORA #$10
2e26 : 4c 33 2e JMP $2e33 ; (fastmode.s3 + 0)
.s1:
2e29 : a9 01 __ LDA #$01
2e2b : 8d 30 d0 STA $d030 
2e2e : ad 11 d0 LDA $d011 
2e31 : 29 6f __ AND #$6f
.s3:
2e33 : 8d 11 d0 STA $d011 
.s1001:
2e36 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2e37 : a9 00 __ LDA #$00
2e39 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2e3b : a4 16 __ LDY P9 ; (mode + 0)
2e3d : be 5b 80 LDX $805b,y ; (__multab36L + 0)
2e40 : 86 49 __ STX T1 + 0 
2e42 : 86 4b __ STX T2 + 0 
2e44 : bd 04 83 LDA $8304,x ; (vdc_modes + 4)
2e47 : f0 08 __ BEQ $2e51 ; (vdc_set_mode.s3 + 0)
.s4:
2e49 : ad ad 87 LDA $87ad ; (vdc_state + 0)
2e4c : c9 10 __ CMP #$10
2e4e : d0 01 __ BNE $2e51 ; (vdc_set_mode.s3 + 0)
2e50 : 60 __ __ RTS
.s3:
2e51 : 8c af 87 STY $87af ; (vdc_state + 2)
2e54 : a9 8d __ LDA #$8d
2e56 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
2e59 : a9 00 __ LDA #$00
2e5b : 8d c3 87 STA $87c3 ; (vdc_state + 22)
2e5e : 8d c4 87 STA $87c4 ; (vdc_state + 23)
2e61 : 8d c5 87 STA $87c5 ; (vdc_state + 24)
2e64 : bd 00 83 LDA $8300,x ; (vdc_modes + 0)
2e67 : 8d b0 87 STA $87b0 ; (vdc_state + 3)
2e6a : bd 01 83 LDA $8301,x ; (vdc_modes + 1)
2e6d : 8d b1 87 STA $87b1 ; (vdc_state + 4)
2e70 : bd 02 83 LDA $8302,x ; (vdc_modes + 2)
2e73 : 8d b2 87 STA $87b2 ; (vdc_state + 5)
2e76 : bd 03 83 LDA $8303,x ; (vdc_modes + 3)
2e79 : 8d b3 87 STA $87b3 ; (vdc_state + 6)
2e7c : bd 09 83 LDA $8309,x ; (vdc_modes + 9)
2e7f : 8d b9 87 STA $87b9 ; (vdc_state + 12)
2e82 : bd 0a 83 LDA $830a,x ; (vdc_modes + 10)
2e85 : 8d ba 87 STA $87ba ; (vdc_state + 13)
2e88 : bd 0b 83 LDA $830b,x ; (vdc_modes + 11)
2e8b : 8d bb 87 STA $87bb ; (vdc_state + 14)
2e8e : bd 0c 83 LDA $830c,x ; (vdc_modes + 12)
2e91 : 8d bc 87 STA $87bc ; (vdc_state + 15)
2e94 : bd 0d 83 LDA $830d,x ; (vdc_modes + 13)
2e97 : 8d bd 87 STA $87bd ; (vdc_state + 16)
2e9a : bd 0e 83 LDA $830e,x ; (vdc_modes + 14)
2e9d : 8d be 87 STA $87be ; (vdc_state + 17)
2ea0 : bd 0f 83 LDA $830f,x ; (vdc_modes + 15)
2ea3 : 8d bf 87 STA $87bf ; (vdc_state + 18)
2ea6 : bd 10 83 LDA $8310,x ; (vdc_modes + 16)
2ea9 : 8d c0 87 STA $87c0 ; (vdc_state + 19)
2eac : bd 11 83 LDA $8311,x ; (vdc_modes + 17)
2eaf : 8d c1 87 STA $87c1 ; (vdc_state + 20)
2eb2 : bd 12 83 LDA $8312,x ; (vdc_modes + 18)
2eb5 : 8d c2 87 STA $87c2 ; (vdc_state + 21)
2eb8 : bd 05 83 LDA $8305,x ; (vdc_modes + 5)
2ebb : 85 4c __ STA T3 + 0 
2ebd : 8d b5 87 STA $87b5 ; (vdc_state + 8)
2ec0 : bd 06 83 LDA $8306,x ; (vdc_modes + 6)
2ec3 : 85 4d __ STA T3 + 1 
2ec5 : 8d b6 87 STA $87b6 ; (vdc_state + 9)
2ec8 : bd 07 83 LDA $8307,x ; (vdc_modes + 7)
2ecb : 85 4e __ STA T5 + 0 
2ecd : 8d b7 87 STA $87b7 ; (vdc_state + 10)
2ed0 : bd 08 83 LDA $8308,x ; (vdc_modes + 8)
2ed3 : 85 4f __ STA T5 + 1 
2ed5 : 8d b8 87 STA $87b8 ; (vdc_state + 11)
2ed8 : 20 b0 2f JSR $2fb0 ; (vdc_set_multab.s0 + 0)
2edb : a9 22 __ LDA #$22
2edd : 8d 00 d6 STA $d600 
.l295:
2ee0 : 2c 00 d6 BIT $d600 
2ee3 : 10 fb __ BPL $2ee0 ; (vdc_set_mode.l295 + 0)
.s11:
2ee5 : a9 80 __ LDA #$80
2ee7 : 8d 01 d6 STA $d601 
2eea : a9 0c __ LDA #$0c
2eec : 8d 00 d6 STA $d600 
.l297:
2eef : 2c 00 d6 BIT $d600 
2ef2 : 10 fb __ BPL $2eef ; (vdc_set_mode.l297 + 0)
.s17:
2ef4 : a5 4d __ LDA T3 + 1 
2ef6 : 8d 01 d6 STA $d601 
2ef9 : a9 0d __ LDA #$0d
2efb : 8d 00 d6 STA $d600 
.l299:
2efe : 2c 00 d6 BIT $d600 
2f01 : 10 fb __ BPL $2efe ; (vdc_set_mode.l299 + 0)
.s22:
2f03 : a5 4c __ LDA T3 + 0 
2f05 : 8d 01 d6 STA $d601 
2f08 : a9 14 __ LDA #$14
2f0a : 8d 00 d6 STA $d600 
.l301:
2f0d : 2c 00 d6 BIT $d600 
2f10 : 10 fb __ BPL $2f0d ; (vdc_set_mode.l301 + 0)
.s27:
2f12 : a5 4f __ LDA T5 + 1 
2f14 : 8d 01 d6 STA $d601 
2f17 : a9 15 __ LDA #$15
2f19 : 8d 00 d6 STA $d600 
.l303:
2f1c : 2c 00 d6 BIT $d600 
2f1f : 10 fb __ BPL $2f1c ; (vdc_set_mode.l303 + 0)
.s32:
2f21 : a5 4e __ LDA T5 + 0 
2f23 : 8d 01 d6 STA $d601 
2f26 : a6 49 __ LDX T1 + 0 
2f28 : bd 0e 83 LDA $830e,x ; (vdc_modes + 14)
2f2b : a2 1c __ LDX #$1c
2f2d : 8e 00 d6 STX $d600 
.l305:
2f30 : 2c 00 d6 BIT $d600 
2f33 : 10 fb __ BPL $2f30 ; (vdc_set_mode.l305 + 0)
.s39:
2f35 : aa __ __ TAX
2f36 : ad 01 d6 LDA $d601 
2f39 : 29 10 __ AND #$10
2f3b : 85 4e __ STA T5 + 0 
2f3d : a9 1c __ LDA #$1c
2f3f : 8d 00 d6 STA $d600 
2f42 : 8a __ __ TXA
2f43 : 29 e0 __ AND #$e0
2f45 : 05 4e __ ORA T5 + 0 
.l307:
2f47 : 2c 00 d6 BIT $d600 
2f4a : 10 fb __ BPL $2f47 ; (vdc_set_mode.l307 + 0)
.s45:
2f4c : 8d 01 d6 STA $d601 
2f4f : 20 0b 30 JSR $300b ; (vdc_restore_charsets.s0 + 0)
2f52 : 18 __ __ CLC
2f53 : a9 13 __ LDA #$13
2f55 : 65 49 __ ADC T1 + 0 
2f57 : 85 49 __ STA T1 + 0 
2f59 : a9 83 __ LDA #$83
2f5b : 69 00 __ ADC #$00
2f5d : 85 4a __ STA T1 + 1 
2f5f : 18 __ __ CLC
2f60 : a5 4b __ LDA T2 + 0 
2f62 : 69 13 __ ADC #$13
2f64 : 85 4c __ STA T3 + 0 
2f66 : a9 00 __ LDA #$00
2f68 : 85 43 __ STA T0 + 0 
2f6a : 69 83 __ ADC #$83
2f6c : 85 4d __ STA T3 + 1 
.l46:
2f6e : a4 43 __ LDY T0 + 0 
2f70 : b1 49 __ LDA (T1 + 0),y 
2f72 : 85 47 __ STA T7 + 0 
2f74 : c8 __ __ INY
2f75 : b1 49 __ LDA (T1 + 0),y 
2f77 : aa __ __ TAX
2f78 : a5 47 __ LDA T7 + 0 
2f7a : 8d 00 d6 STA $d600 
2f7d : c8 __ __ INY
2f7e : 84 43 __ STY T0 + 0 
.l309:
2f80 : 2c 00 d6 BIT $d600 
2f83 : 10 fb __ BPL $2f80 ; (vdc_set_mode.l309 + 0)
.s52:
2f85 : 8e 01 d6 STX $d601 
2f88 : b1 4c __ LDA (T3 + 0),y 
2f8a : c9 ff __ CMP #$ff
2f8c : d0 e0 __ BNE $2f6e ; (vdc_set_mode.l46 + 0)
.s47:
2f8e : a6 4b __ LDX T2 + 0 
2f90 : bd 04 83 LDA $8304,x ; (vdc_modes + 4)
2f93 : f0 08 __ BEQ $2f9d ; (vdc_set_mode.s55 + 0)
.s56:
2f95 : ad ae 87 LDA $87ae ; (vdc_state + 1)
2f98 : d0 03 __ BNE $2f9d ; (vdc_set_mode.s55 + 0)
.s53:
2f9a : 20 2a 30 JSR $302a ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2f9d : 20 98 2c JSR $2c98 ; (vdc_cls.s0 + 0)
2fa0 : a9 22 __ LDA #$22
2fa2 : 8d 00 d6 STA $d600 
.l314:
2fa5 : 2c 00 d6 BIT $d600 
2fa8 : 10 fb __ BPL $2fa5 ; (vdc_set_mode.l314 + 0)
.s62:
2faa : a9 7d __ LDA #$7d
2fac : 8d 01 d6 STA $d601 
.s1001:
2faf : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2fb0 : ad b3 87 LDA $87b3 ; (vdc_state + 6)
2fb3 : 85 1c __ STA ACCU + 1 
2fb5 : ad b2 87 LDA $87b2 ; (vdc_state + 5)
2fb8 : 85 1b __ STA ACCU + 0 
2fba : 05 1c __ ORA ACCU + 1 
2fbc : f0 4c __ BEQ $300a ; (vdc_set_multab.s1001 + 0)
.s5:
2fbe : ad b0 87 LDA $87b0 ; (vdc_state + 3)
2fc1 : 18 __ __ CLC
2fc2 : 6d c5 87 ADC $87c5 ; (vdc_state + 24)
2fc5 : 85 43 __ STA T2 + 0 
2fc7 : ad b1 87 LDA $87b1 ; (vdc_state + 4)
2fca : 69 00 __ ADC #$00
2fcc : 85 44 __ STA T2 + 1 
2fce : a9 00 __ LDA #$00
2fd0 : 85 45 __ STA T3 + 0 
2fd2 : 85 46 __ STA T3 + 1 
2fd4 : a9 00 __ LDA #$00
2fd6 : 85 47 __ STA T4 + 0 
2fd8 : a9 88 __ LDA #$88
2fda : 85 48 __ STA T4 + 1 
2fdc : a2 00 __ LDX #$00
.l2:
2fde : a5 45 __ LDA T3 + 0 
2fe0 : a0 00 __ LDY #$00
2fe2 : 91 47 __ STA (T4 + 0),y 
2fe4 : a5 46 __ LDA T3 + 1 
2fe6 : c8 __ __ INY
2fe7 : 91 47 __ STA (T4 + 0),y 
2fe9 : 18 __ __ CLC
2fea : a5 43 __ LDA T2 + 0 
2fec : 65 45 __ ADC T3 + 0 
2fee : 85 45 __ STA T3 + 0 
2ff0 : a5 44 __ LDA T2 + 1 
2ff2 : 65 46 __ ADC T3 + 1 
2ff4 : 85 46 __ STA T3 + 1 
2ff6 : 18 __ __ CLC
2ff7 : a5 47 __ LDA T4 + 0 
2ff9 : 69 02 __ ADC #$02
2ffb : 85 47 __ STA T4 + 0 
2ffd : 90 02 __ BCC $3001 ; (vdc_set_multab.s1006 + 0)
.s1005:
2fff : e6 48 __ INC T4 + 1 
.s1006:
3001 : e8 __ __ INX
3002 : a5 1c __ LDA ACCU + 1 
3004 : d0 d8 __ BNE $2fde ; (vdc_set_multab.l2 + 0)
.s1002:
3006 : e4 1b __ CPX ACCU + 0 
3008 : 90 d4 __ BCC $2fde ; (vdc_set_multab.l2 + 0)
.s1001:
300a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
300b : a9 01 __ LDA #$01
300d : 85 11 __ STA P4 
300f : a9 02 __ LDA #$02
3011 : 85 15 __ STA P8 
3013 : ad bd 87 LDA $87bd ; (vdc_state + 16)
3016 : 85 0f __ STA P2 
3018 : ad be 87 LDA $87be ; (vdc_state + 17)
301b : 85 10 __ STA P3 
301d : a9 00 __ LDA #$00
301f : 85 14 __ STA P7 
3021 : 85 12 __ STA P5 
3023 : a9 d0 __ LDA #$d0
3025 : 85 13 __ STA P6 
3027 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
302a : ad ad 87 LDA $87ad ; (vdc_state + 0)
302d : c9 10 __ CMP #$10
302f : f0 4d __ BEQ $307e ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
3031 : ad ae 87 LDA $87ae ; (vdc_state + 1)
3034 : d0 48 __ BNE $307e ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
3036 : a9 22 __ LDA #$22
3038 : 8d 00 d6 STA $d600 
.l120:
303b : 2c 00 d6 BIT $d600 
303e : 10 fb __ BPL $303b ; (vdc_set_extended_memsize.l120 + 0)
.s11:
3040 : a9 80 __ LDA #$80
3042 : 8d 01 d6 STA $d601 
3045 : 20 7f 30 JSR $307f ; (vdc_wipe_mem.s0 + 0)
3048 : a9 1c __ LDA #$1c
304a : 8d 00 d6 STA $d600 
.l122:
304d : 2c 00 d6 BIT $d600 
3050 : 10 fb __ BPL $304d ; (vdc_set_extended_memsize.l122 + 0)
.s17:
3052 : ad 01 d6 LDA $d601 
3055 : 09 10 __ ORA #$10
3057 : a2 1c __ LDX #$1c
3059 : 8e 00 d6 STX $d600 
.l124:
305c : 2c 00 d6 BIT $d600 
305f : 10 fb __ BPL $305c ; (vdc_set_extended_memsize.l124 + 0)
.s23:
3061 : 8d 01 d6 STA $d601 
3064 : 20 0b 30 JSR $300b ; (vdc_restore_charsets.s0 + 0)
3067 : 20 98 2c JSR $2c98 ; (vdc_cls.s0 + 0)
306a : a9 22 __ LDA #$22
306c : 8d 00 d6 STA $d600 
.l126:
306f : 2c 00 d6 BIT $d600 
3072 : 10 fb __ BPL $306f ; (vdc_set_extended_memsize.l126 + 0)
.s29:
3074 : a9 7d __ LDA #$7d
3076 : 8d 01 d6 STA $d601 
3079 : a9 01 __ LDA #$01
307b : 8d ae 87 STA $87ae ; (vdc_state + 1)
.s1001:
307e : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
307f : a9 00 __ LDA #$00
3081 : 85 44 __ STA T0 + 1 
3083 : 85 0d __ STA P0 
3085 : a9 ff __ LDA #$ff
3087 : 85 45 __ STA T1 + 0 
.l2:
3089 : 20 09 82 JSR $8209 ; (vdc_mem_addr@proxy + 0)
.l252:
308c : 2c 00 d6 BIT $d600 
308f : 10 fb __ BPL $308c ; (vdc_wipe_mem.l252 + 0)
.s8:
3091 : a9 00 __ LDA #$00
3093 : 8d 01 d6 STA $d601 
3096 : a9 18 __ LDA #$18
3098 : 8d 00 d6 STA $d600 
.l254:
309b : 2c 00 d6 BIT $d600 
309e : 10 fb __ BPL $309b ; (vdc_wipe_mem.l254 + 0)
.s14:
30a0 : ad 01 d6 LDA $d601 
30a3 : 29 7f __ AND #$7f
30a5 : a2 18 __ LDX #$18
30a7 : 8e 00 d6 STX $d600 
.l256:
30aa : 2c 00 d6 BIT $d600 
30ad : 10 fb __ BPL $30aa ; (vdc_wipe_mem.l256 + 0)
.s20:
30af : 8d 01 d6 STA $d601 
30b2 : a9 1e __ LDA #$1e
30b4 : 8d 00 d6 STA $d600 
.l258:
30b7 : 2c 00 d6 BIT $d600 
30ba : 10 fb __ BPL $30b7 ; (vdc_wipe_mem.l258 + 0)
.s25:
30bc : e6 44 __ INC T0 + 1 
30be : a9 ff __ LDA #$ff
30c0 : 8d 01 d6 STA $d601 
30c3 : c6 45 __ DEC T1 + 0 
30c5 : d0 c2 __ BNE $3089 ; (vdc_wipe_mem.l2 + 0)
.s4:
30c7 : 20 09 82 JSR $8209 ; (vdc_mem_addr@proxy + 0)
.l261:
30ca : 2c 00 d6 BIT $d600 
30cd : 10 fb __ BPL $30ca ; (vdc_wipe_mem.l261 + 0)
.s29:
30cf : a9 00 __ LDA #$00
30d1 : 8d 01 d6 STA $d601 
30d4 : a9 18 __ LDA #$18
30d6 : 8d 00 d6 STA $d600 
.l263:
30d9 : 2c 00 d6 BIT $d600 
30dc : 10 fb __ BPL $30d9 ; (vdc_wipe_mem.l263 + 0)
.s35:
30de : ad 01 d6 LDA $d601 
30e1 : 29 7f __ AND #$7f
30e3 : a2 18 __ LDX #$18
30e5 : 8e 00 d6 STX $d600 
.l265:
30e8 : 2c 00 d6 BIT $d600 
30eb : 10 fb __ BPL $30e8 ; (vdc_wipe_mem.l265 + 0)
.s41:
30ed : 8d 01 d6 STA $d601 
30f0 : a9 1e __ LDA #$1e
30f2 : 8d 00 d6 STA $d600 
.l267:
30f5 : 2c 00 d6 BIT $d600 
30f8 : 10 fb __ BPL $30f5 ; (vdc_wipe_mem.l267 + 0)
.s46:
30fa : a9 ff __ LDA #$ff
30fc : 8d 01 d6 STA $d601 
.s1001:
30ff : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
3100 : a9 d8 __ LDA #$d8
3102 : 85 0d __ STA P0 
3104 : a9 ab __ LDA #$ab
3106 : 85 0e __ STA P1 
3108 : ad d1 87 LDA $87d1 ; (canvas + 11)
310b : 85 0f __ STA P2 
310d : ad d2 87 LDA $87d2 ; (canvas + 12)
3110 : 85 10 __ STA P3 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
3112 : a9 00 __ LDA #$00
3114 : a0 04 __ LDY #$04
3116 : 91 0d __ STA (P0),y ; (win + 0)
3118 : c8 __ __ INY
3119 : 91 0d __ STA (P0),y ; (win + 0)
311b : a5 0f __ LDA P2 ; (sx + 0)
311d : a0 00 __ LDY #$00
311f : 91 0d __ STA (P0),y ; (win + 0)
3121 : a5 10 __ LDA P3 ; (sy + 0)
3123 : c8 __ __ INY
3124 : 91 0d __ STA (P0),y ; (win + 0)
3126 : a5 11 __ LDA P4 ; (wx + 0)
3128 : c8 __ __ INY
3129 : 91 0d __ STA (P0),y ; (win + 0)
312b : a5 12 __ LDA P5 ; (wy + 0)
312d : c8 __ __ INY
312e : 91 0d __ STA (P0),y ; (win + 0)
3130 : 06 10 __ ASL P3 ; (sy + 0)
3132 : a6 10 __ LDX P3 ; (sy + 0)
3134 : bd 00 88 LDA $8800,x ; (multab + 0)
3137 : 18 __ __ CLC
3138 : 65 0f __ ADC P2 ; (sx + 0)
313a : 85 1b __ STA ACCU + 0 
313c : bd 01 88 LDA $8801,x ; (multab + 1)
313f : 69 00 __ ADC #$00
3141 : a8 __ __ TAY
3142 : ad b5 87 LDA $87b5 ; (vdc_state + 8)
3145 : 18 __ __ CLC
3146 : 65 1b __ ADC ACCU + 0 
3148 : 85 1b __ STA ACCU + 0 
314a : 98 __ __ TYA
314b : 6d b6 87 ADC $87b6 ; (vdc_state + 9)
314e : a0 07 __ LDY #$07
3150 : 91 0d __ STA (P0),y ; (win + 0)
3152 : a5 1b __ LDA ACCU + 0 
3154 : 88 __ __ DEY
3155 : 91 0d __ STA (P0),y ; (win + 0)
3157 : bd 00 88 LDA $8800,x ; (multab + 0)
315a : 18 __ __ CLC
315b : 65 0f __ ADC P2 ; (sx + 0)
315d : 85 1b __ STA ACCU + 0 
315f : bd 01 88 LDA $8801,x ; (multab + 1)
3162 : 69 00 __ ADC #$00
3164 : aa __ __ TAX
3165 : ad b7 87 LDA $87b7 ; (vdc_state + 10)
3168 : 18 __ __ CLC
3169 : 65 1b __ ADC ACCU + 0 
316b : 85 1b __ STA ACCU + 0 
316d : 8a __ __ TXA
316e : 6d b8 87 ADC $87b8 ; (vdc_state + 11)
3171 : a0 09 __ LDY #$09
3173 : 91 0d __ STA (P0),y ; (win + 0)
3175 : a5 1b __ LDA ACCU + 0 
3177 : 88 __ __ DEY
3178 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
317a : 60 __ __ RTS
--------------------------------------------------------------------
updatecanvas: ; updatecanvas()->void
.s1000:
317b : 38 __ __ SEC
317c : a5 23 __ LDA SP + 0 
317e : e9 08 __ SBC #$08
3180 : 85 23 __ STA SP + 0 
3182 : b0 02 __ BCS $3186 ; (updatecanvas.s0 + 0)
3184 : c6 24 __ DEC SP + 1 
.s0:
3186 : a9 d8 __ LDA #$d8
3188 : a0 02 __ LDY #$02
318a : 91 23 __ STA (SP + 0),y 
318c : a9 83 __ LDA #$83
318e : c8 __ __ INY
318f : 91 23 __ STA (SP + 0),y 
3191 : a9 ab __ LDA #$ab
3193 : c8 __ __ INY
3194 : 91 23 __ STA (SP + 0),y 
3196 : a9 32 __ LDA #$32
3198 : c8 __ __ INY
3199 : 91 23 __ STA (SP + 0),y 
319b : ad c9 87 LDA $87c9 ; (canvas + 3)
319e : c8 __ __ INY
319f : 91 23 __ STA (SP + 0),y 
31a1 : ad ca 87 LDA $87ca ; (canvas + 4)
31a4 : c8 __ __ INY
31a5 : 91 23 __ STA (SP + 0),y 
31a7 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
31aa : a9 e8 __ LDA #$e8
31ac : a0 02 __ LDY #$02
31ae : 91 23 __ STA (SP + 0),y 
31b0 : a9 83 __ LDA #$83
31b2 : c8 __ __ INY
31b3 : 91 23 __ STA (SP + 0),y 
31b5 : a9 b9 __ LDA #$b9
31b7 : c8 __ __ INY
31b8 : 91 23 __ STA (SP + 0),y 
31ba : a9 32 __ LDA #$32
31bc : c8 __ __ INY
31bd : 91 23 __ STA (SP + 0),y 
31bf : ad cb 87 LDA $87cb ; (canvas + 5)
31c2 : c8 __ __ INY
31c3 : 91 23 __ STA (SP + 0),y 
31c5 : ad cc 87 LDA $87cc ; (canvas + 6)
31c8 : c8 __ __ INY
31c9 : 91 23 __ STA (SP + 0),y 
31cb : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
31ce : a9 f8 __ LDA #$f8
31d0 : a0 02 __ LDY #$02
31d2 : 91 23 __ STA (SP + 0),y 
31d4 : a9 83 __ LDA #$83
31d6 : c8 __ __ INY
31d7 : 91 23 __ STA (SP + 0),y 
31d9 : a9 c7 __ LDA #$c7
31db : c8 __ __ INY
31dc : 91 23 __ STA (SP + 0),y 
31de : a9 32 __ LDA #$32
31e0 : c8 __ __ INY
31e1 : 91 23 __ STA (SP + 0),y 
31e3 : ad 90 87 LDA $8790 ; (screenbackground + 0)
31e6 : c8 __ __ INY
31e7 : 91 23 __ STA (SP + 0),y 
31e9 : a9 00 __ LDA #$00
31eb : c8 __ __ INY
31ec : 91 23 __ STA (SP + 0),y 
31ee : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
31f1 : a9 08 __ LDA #$08
31f3 : a0 02 __ LDY #$02
31f5 : 91 23 __ STA (SP + 0),y 
31f7 : a9 84 __ LDA #$84
31f9 : c8 __ __ INY
31fa : 91 23 __ STA (SP + 0),y 
31fc : a9 d8 __ LDA #$d8
31fe : c8 __ __ INY
31ff : 91 23 __ STA (SP + 0),y 
3201 : a9 32 __ LDA #$32
3203 : c8 __ __ INY
3204 : 91 23 __ STA (SP + 0),y 
3206 : ad af 87 LDA $87af ; (vdc_state + 2)
3209 : c8 __ __ INY
320a : 91 23 __ STA (SP + 0),y 
320c : a9 00 __ LDA #$00
320e : c8 __ __ INY
320f : 91 23 __ STA (SP + 0),y 
3211 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
3214 : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
3217 : 85 4e __ STA T1 + 0 
3219 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
321c : 18 __ __ CLC
321d : 69 01 __ ADC #$01
321f : 85 12 __ STA P5 
3221 : a9 7f __ LDA #$7f
3223 : 8d c6 87 STA $87c6 ; (canvas + 0)
3226 : a9 00 __ LDA #$00
3228 : 8d cd 87 STA $87cd ; (canvas + 7)
322b : 8d ce 87 STA $87ce ; (canvas + 8)
322e : 8d cf 87 STA $87cf ; (canvas + 9)
3231 : 8d d0 87 STA $87d0 ; (canvas + 10)
3234 : 85 0f __ STA P2 
3236 : 85 10 __ STA P3 
3238 : 8d c7 87 STA $87c7 ; (canvas + 1)
323b : a9 58 __ LDA #$58
323d : 8d c8 87 STA $87c8 ; (canvas + 2)
3240 : a9 d1 __ LDA #$d1
3242 : 85 0d __ STA P0 
3244 : a9 87 __ LDA #$87
3246 : 85 0e __ STA P1 
3248 : a6 4e __ LDX T1 + 0 
324a : e8 __ __ INX
324b : 86 11 __ STX P4 
324d : 20 12 31 JSR $3112 ; (vdcwin_init.s0 + 0)
3250 : ad cb 87 LDA $87cb ; (canvas + 5)
3253 : 85 1b __ STA ACCU + 0 
3255 : ad cc 87 LDA $87cc ; (canvas + 6)
3258 : 85 1c __ STA ACCU + 1 
325a : ad c9 87 LDA $87c9 ; (canvas + 3)
325d : 85 03 __ STA WORK + 0 
325f : ad ca 87 LDA $87ca ; (canvas + 4)
3262 : 85 04 __ STA WORK + 1 
3264 : 20 87 7c JSR $7c87 ; (mul16 + 0)
3267 : a5 05 __ LDA WORK + 2 
3269 : 8d db 87 STA $87db ; (screentotal + 0)
326c : a5 06 __ LDA WORK + 3 
326e : 8d dc 87 STA $87dc ; (screentotal + 1)
.s1001:
3271 : 18 __ __ CLC
3272 : a5 23 __ LDA SP + 0 
3274 : 69 08 __ ADC #$08
3276 : 85 23 __ STA SP + 0 
3278 : 90 02 __ BCC $327c ; (updatecanvas.s1001 + 11)
327a : e6 24 __ INC SP + 1 
327c : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
327d : a9 00 __ LDA #$00
327f : 8d f7 ab STA $abf7 ; (sstack + 4)
3282 : a0 02 __ LDY #$02
3284 : b1 23 __ LDA (SP + 0),y 
3286 : 85 16 __ STA P9 
3288 : c8 __ __ INY
3289 : b1 23 __ LDA (SP + 0),y 
328b : 85 17 __ STA P10 
328d : c8 __ __ INY
328e : b1 23 __ LDA (SP + 0),y 
3290 : 8d f3 ab STA $abf3 ; (sstack + 0)
3293 : c8 __ __ INY
3294 : b1 23 __ LDA (SP + 0),y 
3296 : 8d f4 ab STA $abf4 ; (sstack + 1)
3299 : 18 __ __ CLC
329a : a5 23 __ LDA SP + 0 
329c : 69 06 __ ADC #$06
329e : 8d f5 ab STA $abf5 ; (sstack + 2)
32a1 : a5 24 __ LDA SP + 1 
32a3 : 69 00 __ ADC #$00
32a5 : 8d f6 ab STA $abf6 ; (sstack + 3)
32a8 : 4c 21 23 JMP $2321 ; (sformat.s1000 + 0)
--------------------------------------------------------------------
32ab : __ __ __ BYT 77 49 44 54 48 3a 20 20 20 25 35 55 20 00       : wIDTH:   %5U .
--------------------------------------------------------------------
32b9 : __ __ __ BYT 68 45 49 47 48 54 3a 20 20 25 35 55 20 00       : hEIGHT:  %5U .
--------------------------------------------------------------------
32c7 : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 3a 20 25 32 55 20 : bACKGROUND: %2U 
32d7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
32d8 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 32 55 20 : sCREENMODE: %2U 
32e8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
getmaxx: ; getmaxx()->u8
.s0:
32e9 : ad ca 87 LDA $87ca ; (canvas + 4)
32ec : cd b1 87 CMP $87b1 ; (vdc_state + 4)
32ef : d0 06 __ BNE $32f7 ; (getmaxx.s1003 + 0)
.s1002:
32f1 : ad c9 87 LDA $87c9 ; (canvas + 3)
32f4 : cd b0 87 CMP $87b0 ; (vdc_state + 3)
.s1003:
32f7 : b0 05 __ BCS $32fe ; (getmaxx.s2 + 0)
.s1:
32f9 : ad c9 87 LDA $87c9 ; (canvas + 3)
32fc : 90 03 __ BCC $3301 ; (getmaxx.s1001 + 0)
.s2:
32fe : ad b0 87 LDA $87b0 ; (vdc_state + 3)
.s1001:
3301 : 38 __ __ SEC
3302 : e9 01 __ SBC #$01
3304 : 60 __ __ RTS
--------------------------------------------------------------------
getmaxy: ; getmaxy()->u8
.s0:
3305 : ad cc 87 LDA $87cc ; (canvas + 6)
3308 : cd b3 87 CMP $87b3 ; (vdc_state + 6)
330b : d0 06 __ BNE $3313 ; (getmaxy.s1003 + 0)
.s1002:
330d : ad cb 87 LDA $87cb ; (canvas + 5)
3310 : cd b2 87 CMP $87b2 ; (vdc_state + 5)
.s1003:
3313 : b0 05 __ BCS $331a ; (getmaxy.s2 + 0)
.s1:
3315 : ad cb 87 LDA $87cb ; (canvas + 5)
3318 : 90 03 __ BCC $331d ; (getmaxy.s1001 + 0)
.s2:
331a : ad b2 87 LDA $87b2 ; (vdc_state + 5)
.s1001:
331d : 38 __ __ SEC
331e : e9 01 __ SBC #$01
3320 : 60 __ __ RTS
--------------------------------------------------------------------
3321 : __ __ __ BYT 75 4e 44 4f 3a 20 65 4e 41 42 4c 45 44 20 20 00 : uNDO: eNABLED  .
--------------------------------------------------------------------
printcentered: ; printcentered(const u8*,u8,u8,u8)->void
.s0:
3331 : a9 1d __ LDA #$1d
3333 : 85 0f __ STA P2 
3335 : a9 16 __ LDA #$16
3337 : 85 13 __ STA P6 
3339 : a9 18 __ LDA #$18
333b : 85 14 __ STA P7 
333d : 20 36 82 JSR $8236 ; (vdc_clear@proxy + 0)
3340 : a5 16 __ LDA P9 ; (text + 0)
3342 : 85 0d __ STA P0 
3344 : a5 17 __ LDA P10 ; (text + 1)
3346 : 85 0e __ STA P1 
3348 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
334b : a5 1c __ LDA ACCU + 1 
334d : 30 0c __ BMI $335b ; (printcentered.s1 + 0)
.s1003:
334f : d0 06 __ BNE $3357 ; (printcentered.s5 + 0)
.s1002:
3351 : a5 1b __ LDA ACCU + 0 
3353 : c9 16 __ CMP #$16
3355 : 90 04 __ BCC $335b ; (printcentered.s1 + 0)
.s5:
3357 : a9 1d __ LDA #$1d
3359 : d0 1c __ BNE $3377 ; (printcentered.s1004 + 0)
.s1:
335b : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
335e : 38 __ __ SEC
335f : a9 16 __ LDA #$16
3361 : e5 1b __ SBC ACCU + 0 
3363 : aa __ __ TAX
3364 : a9 00 __ LDA #$00
3366 : e5 1c __ SBC ACCU + 1 
3368 : a8 __ __ TAY
3369 : 0a __ __ ASL
336a : 8a __ __ TXA
336b : 69 00 __ ADC #$00
336d : aa __ __ TAX
336e : 98 __ __ TYA
336f : 69 00 __ ADC #$00
3371 : 4a __ __ LSR
3372 : 8a __ __ TXA
3373 : 6a __ __ ROR
3374 : 18 __ __ CLC
3375 : 69 1c __ ADC #$1c
.s1004:
3377 : 85 11 __ STA P4 
3379 : a9 18 __ LDA #$18
337b : 85 12 __ STA P5 
337d : a5 16 __ LDA P9 ; (text + 0)
337f : 85 13 __ STA P6 
3381 : a5 17 __ LDA P10 ; (text + 1)
3383 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
3385 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
3388 : 85 15 __ STA P8 
338a : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
338d : a9 00 __ LDA #$00
338f : 85 1b __ STA ACCU + 0 
3391 : 85 1c __ STA ACCU + 1 
3393 : a8 __ __ TAY
3394 : b1 0d __ LDA (P0),y ; (str + 0)
3396 : f0 18 __ BEQ $33b0 ; (strlen.s1001 + 0)
.s2:
3398 : a5 0d __ LDA P0 ; (str + 0)
339a : 85 1b __ STA ACCU + 0 
339c : a2 00 __ LDX #$00
.l1002:
339e : c8 __ __ INY
339f : d0 01 __ BNE $33a2 ; (strlen.s1005 + 0)
.s1004:
33a1 : e8 __ __ INX
.s1005:
33a2 : 8a __ __ TXA
33a3 : 18 __ __ CLC
33a4 : 65 0e __ ADC P1 ; (str + 1)
33a6 : 85 1c __ STA ACCU + 1 
33a8 : b1 1b __ LDA (ACCU + 0),y 
33aa : d0 f2 __ BNE $339e ; (strlen.l1002 + 0)
.s1003:
33ac : 86 1c __ STX ACCU + 1 
33ae : 84 1b __ STY ACCU + 0 
.s1001:
33b0 : 60 __ __ RTS
--------------------------------------------------------------------
updateMenu: ; updateMenu()->void
.s0:
33b1 : a9 37 __ LDA #$37
33b3 : 85 0f __ STA P2 
33b5 : a9 20 __ LDA #$20
33b7 : 85 11 __ STA P4 
33b9 : a9 0e __ LDA #$0e
33bb : 85 13 __ STA P6 
33bd : a9 04 __ LDA #$04
33bf : 85 14 __ STA P7 
33c1 : a9 0a __ LDA #$0a
33c3 : 85 15 __ STA P8 
33c5 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
33c8 : 85 49 __ STA T0 + 0 
33ca : 8d b4 87 STA $87b4 ; (vdc_state + 7)
33cd : 20 ac 2c JSR $2cac ; (vdc_clear.s0 + 0)
33d0 : a9 37 __ LDA #$37
33d2 : 85 11 __ STA P4 
33d4 : a9 05 __ LDA #$05
33d6 : 85 12 __ STA P5 
33d8 : a5 49 __ LDA T0 + 0 
33da : 85 15 __ STA P8 
33dc : a9 f2 __ LDA #$f2
33de : 85 13 __ STA P6 
33e0 : a9 71 __ LDA #$71
33e2 : 85 14 __ STA P7 
33e4 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
33e7 : e6 12 __ INC P5 
33e9 : a9 00 __ LDA #$00
33eb : 85 13 __ STA P6 
33ed : a9 72 __ LDA #$72
33ef : 85 14 __ STA P7 
33f1 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
33f4 : e6 12 __ INC P5 
33f6 : a9 0b __ LDA #$0b
33f8 : 85 13 __ STA P6 
33fa : a9 72 __ LDA #$72
33fc : 85 14 __ STA P7 
33fe : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3401 : e6 12 __ INC P5 
3403 : a9 16 __ LDA #$16
3405 : 85 13 __ STA P6 
3407 : a9 72 __ LDA #$72
3409 : 85 14 __ STA P7 
340b : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
340e : e6 12 __ INC P5 
3410 : a9 1e __ LDA #$1e
3412 : 85 13 __ STA P6 
3414 : a9 72 __ LDA #$72
3416 : 85 14 __ STA P7 
3418 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
341b : e6 12 __ INC P5 
341d : a9 26 __ LDA #$26
341f : 85 13 __ STA P6 
3421 : a9 72 __ LDA #$72
3423 : 85 14 __ STA P7 
3425 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3428 : e6 12 __ INC P5 
342a : a9 35 __ LDA #$35
342c : 85 13 __ STA P6 
342e : a9 72 __ LDA #$72
3430 : 85 14 __ STA P7 
3432 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3435 : e6 12 __ INC P5 
3437 : a9 42 __ LDA #$42
3439 : 85 13 __ STA P6 
343b : a9 72 __ LDA #$72
343d : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
343f : a5 13 __ LDA P6 ; (string + 0)
3441 : 85 0d __ STA P0 
3443 : 85 43 __ STA T0 + 0 
3445 : a5 14 __ LDA P7 ; (string + 1)
3447 : 85 0e __ STA P1 
3449 : 85 44 __ STA T0 + 1 
344b : a5 12 __ LDA P5 ; (y + 0)
344d : 0a __ __ ASL
344e : aa __ __ TAX
344f : bd 00 88 LDA $8800,x ; (multab + 0)
3452 : 85 46 __ STA T2 + 0 
3454 : bd 01 88 LDA $8801,x ; (multab + 1)
3457 : 85 47 __ STA T2 + 1 
3459 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
345c : a5 1b __ LDA ACCU + 0 
345e : d0 01 __ BNE $3461 ; (vdc_prints_attr.s5 + 0)
.s1001:
3460 : 60 __ __ RTS
.s5:
3461 : c9 01 __ CMP #$01
3463 : d0 03 __ BNE $3468 ; (vdc_prints_attr.s9 + 0)
3465 : 4c ea 34 JMP $34ea ; (vdc_prints_attr.s7 + 0)
.s9:
3468 : 85 48 __ STA T3 + 0 
346a : 18 __ __ CLC
346b : a5 11 __ LDA P4 ; (x + 0)
346d : 65 46 __ ADC T2 + 0 
346f : 85 46 __ STA T2 + 0 
3471 : 90 02 __ BCC $3475 ; (vdc_prints_attr.s1021 + 0)
.s1020:
3473 : e6 47 __ INC T2 + 1 
.s1021:
3475 : 18 __ __ CLC
3476 : 6d b5 87 ADC $87b5 ; (vdc_state + 8)
3479 : 85 0d __ STA P0 
347b : ad b6 87 LDA $87b6 ; (vdc_state + 9)
347e : 65 47 __ ADC T2 + 1 
3480 : 85 0e __ STA P1 
3482 : 20 81 2d JSR $2d81 ; (vdc_mem_addr.s0 + 0)
3485 : a5 48 __ LDA T3 + 0 
3487 : f0 18 __ BEQ $34a1 ; (vdc_prints_attr.s14 + 0)
.s44:
3489 : a0 00 __ LDY #$00
.l12:
348b : 84 45 __ STY T1 + 0 
348d : b1 43 __ LDA (T0 + 0),y 
348f : 20 7a 35 JSR $357a ; (pet2screen.s0 + 0)
.l174:
3492 : 2c 00 d6 BIT $d600 
3495 : 10 fb __ BPL $3492 ; (vdc_prints_attr.l174 + 0)
.s17:
3497 : 8d 01 d6 STA $d601 
349a : a4 45 __ LDY T1 + 0 
349c : c8 __ __ INY
349d : c4 48 __ CPY T3 + 0 
349f : 90 ea __ BCC $348b ; (vdc_prints_attr.l12 + 0)
.s14:
34a1 : ad b7 87 LDA $87b7 ; (vdc_state + 10)
34a4 : 18 __ __ CLC
34a5 : 65 46 __ ADC T2 + 0 
34a7 : 85 0d __ STA P0 
34a9 : ad b8 87 LDA $87b8 ; (vdc_state + 11)
34ac : 65 47 __ ADC T2 + 1 
34ae : 85 0e __ STA P1 
34b0 : 20 81 2d JSR $2d81 ; (vdc_mem_addr.s0 + 0)
34b3 : a6 48 __ LDX T3 + 0 
34b5 : ca __ __ DEX
.l177:
34b6 : 2c 00 d6 BIT $d600 
34b9 : 10 fb __ BPL $34b6 ; (vdc_prints_attr.l177 + 0)
.s21:
34bb : a5 15 __ LDA P8 ; (attr + 0)
34bd : 8d 01 d6 STA $d601 
34c0 : a9 18 __ LDA #$18
34c2 : 8d 00 d6 STA $d600 
.l179:
34c5 : 2c 00 d6 BIT $d600 
34c8 : 10 fb __ BPL $34c5 ; (vdc_prints_attr.l179 + 0)
.s27:
34ca : ad 01 d6 LDA $d601 
34cd : 29 7f __ AND #$7f
34cf : a0 18 __ LDY #$18
34d1 : 8c 00 d6 STY $d600 
.l181:
34d4 : 2c 00 d6 BIT $d600 
34d7 : 10 fb __ BPL $34d4 ; (vdc_prints_attr.l181 + 0)
.s33:
34d9 : 8d 01 d6 STA $d601 
34dc : a9 1e __ LDA #$1e
34de : 8d 00 d6 STA $d600 
.l183:
34e1 : 2c 00 d6 BIT $d600 
34e4 : 10 fb __ BPL $34e1 ; (vdc_prints_attr.l183 + 0)
.s38:
34e6 : 8e 01 d6 STX $d601 
34e9 : 60 __ __ RTS
.s7:
34ea : a5 11 __ LDA P4 ; (x + 0)
34ec : 85 0d __ STA P0 
34ee : a5 12 __ LDA P5 ; (y + 0)
34f0 : 85 0e __ STA P1 
34f2 : a0 00 __ LDY #$00
34f4 : b1 13 __ LDA (P6),y ; (string + 0)
34f6 : 85 0f __ STA P2 
34f8 : a5 15 __ LDA P8 ; (attr + 0)
34fa : 85 10 __ STA P3 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
34fc : a5 0e __ LDA P1 ; (y + 0)
34fe : 0a __ __ ASL
34ff : a2 12 __ LDX #$12
3501 : 8e 00 d6 STX $d600 
3504 : aa __ __ TAX
3505 : 18 __ __ CLC
3506 : a5 0d __ LDA P0 ; (x + 0)
3508 : 7d 00 88 ADC $8800,x ; (multab + 0)
350b : 85 1b __ STA ACCU + 0 
350d : a9 00 __ LDA #$00
350f : 7d 01 88 ADC $8801,x ; (multab + 1)
3512 : 85 1c __ STA ACCU + 1 
3514 : 18 __ __ CLC
3515 : a5 1b __ LDA ACCU + 0 
3517 : 6d b5 87 ADC $87b5 ; (vdc_state + 8)
351a : aa __ __ TAX
351b : a5 1c __ LDA ACCU + 1 
351d : 6d b6 87 ADC $87b6 ; (vdc_state + 9)
.l167:
3520 : 2c 00 d6 BIT $d600 
3523 : 10 fb __ BPL $3520 ; (vdc_printc.l167 + 0)
.s9:
3525 : 8d 01 d6 STA $d601 
3528 : a9 13 __ LDA #$13
352a : 8d 00 d6 STA $d600 
.l169:
352d : 2c 00 d6 BIT $d600 
3530 : 10 fb __ BPL $352d ; (vdc_printc.l169 + 0)
.s14:
3532 : 8e 01 d6 STX $d601 
3535 : a9 1f __ LDA #$1f
3537 : 8d 00 d6 STA $d600 
.l171:
353a : 2c 00 d6 BIT $d600 
353d : 10 fb __ BPL $353a ; (vdc_printc.l171 + 0)
.s18:
353f : a5 0f __ LDA P2 ; (val + 0)
3541 : 8d 01 d6 STA $d601 
3544 : ad b7 87 LDA $87b7 ; (vdc_state + 10)
3547 : 18 __ __ CLC
3548 : 65 1b __ ADC ACCU + 0 
354a : a8 __ __ TAY
354b : a9 12 __ LDA #$12
354d : 8d 00 d6 STA $d600 
3550 : ad b8 87 LDA $87b8 ; (vdc_state + 11)
3553 : 65 1c __ ADC ACCU + 1 
.l173:
3555 : 2c 00 d6 BIT $d600 
3558 : 10 fb __ BPL $3555 ; (vdc_printc.l173 + 0)
.s25:
355a : 8d 01 d6 STA $d601 
355d : a9 13 __ LDA #$13
355f : 8d 00 d6 STA $d600 
.l175:
3562 : 2c 00 d6 BIT $d600 
3565 : 10 fb __ BPL $3562 ; (vdc_printc.l175 + 0)
.s30:
3567 : 8c 01 d6 STY $d601 
356a : a9 1f __ LDA #$1f
356c : 8d 00 d6 STA $d600 
.l177:
356f : 2c 00 d6 BIT $d600 
3572 : 10 fb __ BPL $356f ; (vdc_printc.l177 + 0)
.s34:
3574 : a5 10 __ LDA P3 ; (attr + 0)
3576 : 8d 01 d6 STA $d601 
.s1001:
3579 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
357a : c9 20 __ CMP #$20
357c : b0 03 __ BCS $3581 ; (pet2screen.s2 + 0)
.s1:
357e : 69 80 __ ADC #$80
3580 : 60 __ __ RTS
.s2:
3581 : c9 40 __ CMP #$40
3583 : 90 27 __ BCC $35ac ; (pet2screen.s21 + 0)
.s7:
3585 : c9 60 __ CMP #$60
3587 : 90 17 __ BCC $35a0 ; (pet2screen.s4 + 0)
.s11:
3589 : 09 00 __ ORA #$00
358b : 30 04 __ BMI $3591 ; (pet2screen.s9 + 0)
.s8:
358d : 38 __ __ SEC
358e : e9 20 __ SBC #$20
3590 : 60 __ __ RTS
.s9:
3591 : c9 80 __ CMP #$80
3593 : 90 17 __ BCC $35ac ; (pet2screen.s21 + 0)
.s15:
3595 : c9 a0 __ CMP #$a0
3597 : b0 03 __ BCS $359c ; (pet2screen.s19 + 0)
.s12:
3599 : 69 40 __ ADC #$40
359b : 60 __ __ RTS
.s19:
359c : c9 c0 __ CMP #$c0
359e : b0 04 __ BCS $35a4 ; (pet2screen.s23 + 0)
.s4:
35a0 : 38 __ __ SEC
35a1 : e9 40 __ SBC #$40
35a3 : 60 __ __ RTS
.s23:
35a4 : c9 ff __ CMP #$ff
35a6 : b0 04 __ BCS $35ac ; (pet2screen.s21 + 0)
.s20:
35a8 : 38 __ __ SEC
35a9 : e9 80 __ SBC #$80
35ab : 60 __ __ RTS
.s21:
35ac : c9 ff __ CMP #$ff
35ae : d0 02 __ BNE $35b2 ; (pet2screen.s1001 + 0)
.s24:
35b0 : a9 5e __ LDA #$5e
.s1001:
35b2 : 60 __ __ RTS
--------------------------------------------------------------------
35b3 : __ __ __ BYT 6c 4f 41 44 20 54 49 54 4c 45 20 53 43 52 45 45 : lOAD TITLE SCREE
35c3 : __ __ __ BYT 4e 00                                           : N.
--------------------------------------------------------------------
35c5 : __ __ __ BYT 56 44 43 53 45 54 53 43 52 00                   : VDCSETSCR.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
35cf : a5 53 __ LDA T1 + 0 
35d1 : 8d d4 ab STA $abd4 ; (buff + 47)
35d4 : 38 __ __ SEC
35d5 : a5 23 __ LDA SP + 0 
35d7 : e9 08 __ SBC #$08
35d9 : 85 23 __ STA SP + 0 
35db : b0 02 __ BCS $35df ; (menu_fileerrormessage.s0 + 0)
35dd : c6 24 __ DEC SP + 1 
.s0:
35df : a9 00 __ LDA #$00
35e1 : 85 17 __ STA P10 
35e3 : a9 08 __ LDA #$08
35e5 : 85 18 __ STA P11 
35e7 : 8d f3 ab STA $abf3 ; (sstack + 0)
35ea : a9 1e __ LDA #$1e
35ec : 8d f4 ab STA $abf4 ; (sstack + 1)
35ef : a9 06 __ LDA #$06
35f1 : 8d f5 ab STA $abf5 ; (sstack + 2)
35f4 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
35f7 : 85 53 __ STA T1 + 0 
35f9 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
35fc : 85 52 __ STA T0 + 0 
35fe : 8d b4 87 STA $87b4 ; (vdc_state + 7)
3601 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
3604 : a9 e8 __ LDA #$e8
3606 : 85 13 __ STA P6 
3608 : a9 39 __ LDA #$39
360a : 85 14 __ STA P7 
360c : 20 df 81 JSR $81df ; (vdc_prints_attr@proxy + 0)
360f : a9 00 __ LDA #$00
3611 : a0 02 __ LDY #$02
3613 : 91 23 __ STA (SP + 0),y 
3615 : a9 89 __ LDA #$89
3617 : c8 __ __ INY
3618 : 91 23 __ STA (SP + 0),y 
361a : a9 00 __ LDA #$00
361c : c8 __ __ INY
361d : 91 23 __ STA (SP + 0),y 
361f : a9 3a __ LDA #$3a
3621 : c8 __ __ INY
3622 : 91 23 __ STA (SP + 0),y 
3624 : ad 7b 87 LDA $877b ; (krnio_pstatus + 1)
3627 : c8 __ __ INY
3628 : 91 23 __ STA (SP + 0),y 
362a : a9 00 __ LDA #$00
362c : c8 __ __ INY
362d : 91 23 __ STA (SP + 0),y 
362f : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
3632 : a9 0a __ LDA #$0a
3634 : 85 11 __ STA P4 
3636 : a9 0b __ LDA #$0b
3638 : 85 12 __ STA P5 
363a : a5 52 __ LDA T0 + 0 
363c : 85 15 __ STA P8 
363e : 20 69 81 JSR $8169 ; (vdc_prints_attr@proxy + 0)
3641 : a9 0d __ LDA #$0d
3643 : 85 12 __ STA P5 
3645 : 20 d4 81 JSR $81d4 ; (vdc_prints_attr@proxy + 0)
3648 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
364b : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
364e : a5 53 __ LDA T1 + 0 
3650 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
.s1001:
3653 : 18 __ __ CLC
3654 : a5 23 __ LDA SP + 0 
3656 : 69 08 __ ADC #$08
3658 : 85 23 __ STA SP + 0 
365a : 90 02 __ BCC $365e ; (menu_fileerrormessage.s1001 + 11)
365c : e6 24 __ INC SP + 1 
365e : ad d4 ab LDA $abd4 ; (buff + 47)
3661 : 85 53 __ STA T1 + 0 
3663 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
3664 : a2 03 __ LDX #$03
3666 : b5 53 __ LDA T8 + 0,x 
3668 : 9d ef ab STA $abef,x ; (buffer + 12)
366b : ca __ __ DEX
366c : 10 f8 __ BPL $3666 ; (vdcwin_win_new.s1000 + 2)
.s0:
366e : ad f4 ab LDA $abf4 ; (sstack + 1)
3671 : 85 4b __ STA T0 + 0 
3673 : 85 4c __ STA T1 + 0 
3675 : ad f5 ab LDA $abf5 ; (sstack + 2)
3678 : 85 43 __ STA T2 + 0 
367a : 85 4d __ STA T3 + 0 
367c : ad f3 ab LDA $abf3 ; (sstack + 0)
367f : 0a __ __ ASL
3680 : aa __ __ TAX
3681 : bd 00 88 LDA $8800,x ; (multab + 0)
3684 : 18 __ __ CLC
3685 : 65 18 __ ADC P11 ; (xpos + 0)
3687 : 85 53 __ STA T8 + 0 
3689 : bd 01 88 LDA $8801,x ; (multab + 1)
368c : 69 00 __ ADC #$00
368e : 85 54 __ STA T8 + 1 
3690 : a5 17 __ LDA P10 ; (border + 0)
3692 : 0a __ __ ASL
3693 : 10 0e __ BPL $36a3 ; (vdcwin_win_new.s57 + 0)
.s6:
3695 : a5 18 __ LDA P11 ; (xpos + 0)
3697 : f0 0a __ BEQ $36a3 ; (vdcwin_win_new.s57 + 0)
.s3:
3699 : e6 4c __ INC T1 + 0 
369b : a5 53 __ LDA T8 + 0 
369d : d0 02 __ BNE $36a1 ; (vdcwin_win_new.s1013 + 0)
.s1012:
369f : c6 54 __ DEC T8 + 1 
.s1013:
36a1 : c6 53 __ DEC T8 + 0 
.s57:
36a3 : a5 17 __ LDA P10 ; (border + 0)
36a5 : 29 20 __ AND #$20
36a7 : f0 15 __ BEQ $36be ; (vdcwin_win_new.s59 + 0)
.s10:
36a9 : 18 __ __ CLC
36aa : a5 4b __ LDA T0 + 0 
36ac : 65 18 __ ADC P11 ; (xpos + 0)
36ae : a8 __ __ TAY
36af : a9 00 __ LDA #$00
36b1 : 2a __ __ ROL
36b2 : cd b1 87 CMP $87b1 ; (vdc_state + 4)
36b5 : d0 03 __ BNE $36ba ; (vdcwin_win_new.s1009 + 0)
.s1008:
36b7 : cc b0 87 CPY $87b0 ; (vdc_state + 3)
.s1009:
36ba : b0 02 __ BCS $36be ; (vdcwin_win_new.s59 + 0)
.s7:
36bc : e6 4c __ INC T1 + 0 
.s59:
36be : 24 17 __ BIT P10 ; (border + 0)
36c0 : 10 1e __ BPL $36e0 ; (vdcwin_win_new.s60 + 0)
.s14:
36c2 : ad f3 ab LDA $abf3 ; (sstack + 0)
36c5 : f0 19 __ BEQ $36e0 ; (vdcwin_win_new.s60 + 0)
.s11:
36c7 : e6 4d __ INC T3 + 0 
36c9 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
36cc : 85 03 __ STA WORK + 0 
36ce : ad b1 87 LDA $87b1 ; (vdc_state + 4)
36d1 : 85 04 __ STA WORK + 1 
36d3 : 38 __ __ SEC
36d4 : a5 53 __ LDA T8 + 0 
36d6 : e5 03 __ SBC WORK + 0 
36d8 : 85 53 __ STA T8 + 0 
36da : a5 54 __ LDA T8 + 1 
36dc : e5 04 __ SBC WORK + 1 
36de : 85 54 __ STA T8 + 1 
.s60:
36e0 : a5 17 __ LDA P10 ; (border + 0)
36e2 : 29 10 __ AND #$10
36e4 : f0 16 __ BEQ $36fc ; (vdcwin_win_new.s17 + 0)
.s18:
36e6 : 18 __ __ CLC
36e7 : a5 43 __ LDA T2 + 0 
36e9 : 6d f3 ab ADC $abf3 ; (sstack + 0)
36ec : a8 __ __ TAY
36ed : a9 00 __ LDA #$00
36ef : 2a __ __ ROL
36f0 : cd b3 87 CMP $87b3 ; (vdc_state + 6)
36f3 : d0 03 __ BNE $36f8 ; (vdcwin_win_new.s1007 + 0)
.s1006:
36f5 : cc b2 87 CPY $87b2 ; (vdc_state + 5)
.s1007:
36f8 : b0 02 __ BCS $36fc ; (vdcwin_win_new.s17 + 0)
.s15:
36fa : e6 4d __ INC T3 + 0 
.s17:
36fc : a5 43 __ LDA T2 + 0 
36fe : 85 1b __ STA ACCU + 0 ; (height + 0)
3700 : a9 00 __ LDA #$00
3702 : 85 1c __ STA ACCU + 1 
3704 : a5 4b __ LDA T0 + 0 
3706 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
3709 : a5 05 __ LDA WORK + 2 
370b : 0a __ __ ASL
370c : 85 4e __ STA T5 + 0 
370e : a5 06 __ LDA WORK + 3 
3710 : 2a __ __ ROL
3711 : 85 4f __ STA T5 + 1 
3713 : ad fc 86 LDA $86fc ; (winCfg + 6)
3716 : 85 50 __ STA T7 + 0 
3718 : 18 __ __ CLC
3719 : 65 4e __ ADC T5 + 0 
371b : 85 4e __ STA T5 + 0 
371d : ad fd 86 LDA $86fd ; (winCfg + 7)
3720 : 85 51 __ STA T7 + 1 
3722 : 65 4f __ ADC T5 + 1 
3724 : 85 4f __ STA T5 + 1 
3726 : ad f7 86 LDA $86f7 ; (winCfg + 1)
3729 : 18 __ __ CLC
372a : 6d f9 86 ADC $86f9 ; (winCfg + 3)
372d : a8 __ __ TAY
372e : ad f8 86 LDA $86f8 ; (winCfg + 2)
3731 : 6d fa 86 ADC $86fa ; (winCfg + 4)
3734 : aa __ __ TAX
3735 : 98 __ __ TYA
3736 : 18 __ __ CLC
3737 : 69 fe __ ADC #$fe
3739 : a8 __ __ TAY
373a : 8a __ __ TXA
373b : 69 ff __ ADC #$ff
373d : c5 4f __ CMP T5 + 1 
373f : d0 02 __ BNE $3743 ; (vdcwin_win_new.s1005 + 0)
.s1004:
3741 : c4 4e __ CPY T5 + 0 
.s1005:
3743 : 90 59 __ BCC $379e ; (vdcwin_win_new.s1001 + 0)
.s21:
3745 : ad fb 86 LDA $86fb ; (winCfg + 5)
3748 : c9 03 __ CMP #$03
374a : f0 52 __ BEQ $379e ; (vdcwin_win_new.s1001 + 0)
.s25:
374c : a5 18 __ LDA P11 ; (xpos + 0)
374e : 85 0f __ STA P2 
3750 : ad f3 ab LDA $abf3 ; (sstack + 0)
3753 : 85 10 __ STA P3 
3755 : a5 4b __ LDA T0 + 0 
3757 : 85 11 __ STA P4 
3759 : a5 43 __ LDA T2 + 0 
375b : 85 12 __ STA P5 
375d : ee fb 86 INC $86fb ; (winCfg + 5)
3760 : ae fb 86 LDX $86fb ; (winCfg + 5)
3763 : bd 61 80 LDA $8061,x ; (__multab13L + 0)
3766 : 85 4e __ STA T5 + 0 
3768 : 18 __ __ CLC
3769 : 69 86 __ ADC #$86
376b : 85 55 __ STA T10 + 0 
376d : 85 0d __ STA P0 
376f : a9 88 __ LDA #$88
3771 : 69 00 __ ADC #$00
3773 : 85 56 __ STA T10 + 1 
3775 : 85 0e __ STA P1 
3777 : 20 12 31 JSR $3112 ; (vdcwin_init.s0 + 0)
377a : a5 50 __ LDA T7 + 0 
377c : a6 4e __ LDX T5 + 0 
377e : 9d 83 88 STA $8883,x ; (multab + 131)
3781 : a5 51 __ LDA T7 + 1 
3783 : 9d 84 88 STA $8884,x ; (multab + 132)
3786 : a5 17 __ LDA P10 ; (border + 0)
3788 : 9d 85 88 STA $8885,x ; (multab + 133)
378b : a5 4d __ LDA T3 + 0 
378d : d0 1a __ BNE $37a9 ; (vdcwin_win_new.s32 + 0)
.s30:
378f : a5 55 __ LDA T10 + 0 
3791 : 85 14 __ STA P7 
3793 : a5 56 __ LDA T10 + 1 
3795 : 85 15 __ STA P8 
3797 : a5 17 __ LDA P10 ; (border + 0)
3799 : 85 16 __ STA P9 
379b : 20 2a 38 JSR $382a ; (vdcwin_border_clear.s0 + 0)
.s1001:
379e : a2 03 __ LDX #$03
37a0 : bd ef ab LDA $abef,x ; (buffer + 12)
37a3 : 95 53 __ STA T8 + 0,x 
37a5 : ca __ __ DEX
37a6 : 10 f8 __ BPL $37a0 ; (vdcwin_win_new.s1001 + 2)
37a8 : 60 __ __ RTS
.s32:
37a9 : 85 4b __ STA T0 + 0 
37ab : a5 4c __ LDA T1 + 0 
37ad : 85 12 __ STA P5 
.l1010:
37af : a9 00 __ LDA #$00
37b1 : 85 13 __ STA P6 
37b3 : ad f6 86 LDA $86f6 ; (winCfg + 0)
37b6 : 85 0d __ STA P0 
37b8 : ad fc 86 LDA $86fc ; (winCfg + 6)
37bb : 85 50 __ STA T7 + 0 
37bd : 85 0e __ STA P1 
37bf : ad fd 86 LDA $86fd ; (winCfg + 7)
37c2 : 85 51 __ STA T7 + 1 
37c4 : 85 0f __ STA P2 
37c6 : ad b5 87 LDA $87b5 ; (vdc_state + 8)
37c9 : 18 __ __ CLC
37ca : 65 53 __ ADC T8 + 0 
37cc : 85 10 __ STA P3 
37ce : ad b6 87 LDA $87b6 ; (vdc_state + 9)
37d1 : 65 54 __ ADC T8 + 1 
37d3 : 85 11 __ STA P4 
37d5 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
37d8 : a9 00 __ LDA #$00
37da : 85 13 __ STA P6 
37dc : 18 __ __ CLC
37dd : a5 50 __ LDA T7 + 0 
37df : 65 12 __ ADC P5 
37e1 : 85 50 __ STA T7 + 0 
37e3 : 85 0e __ STA P1 
37e5 : 8d fc 86 STA $86fc ; (winCfg + 6)
37e8 : a5 51 __ LDA T7 + 1 
37ea : 69 00 __ ADC #$00
37ec : 85 51 __ STA T7 + 1 
37ee : 85 0f __ STA P2 
37f0 : 8d fd 86 STA $86fd ; (winCfg + 7)
37f3 : ad b7 87 LDA $87b7 ; (vdc_state + 10)
37f6 : 18 __ __ CLC
37f7 : 65 53 __ ADC T8 + 0 
37f9 : 85 10 __ STA P3 
37fb : ad b8 87 LDA $87b8 ; (vdc_state + 11)
37fe : 65 54 __ ADC T8 + 1 
3800 : 85 11 __ STA P4 
3802 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
3805 : 18 __ __ CLC
3806 : a5 50 __ LDA T7 + 0 
3808 : 65 12 __ ADC P5 
380a : 8d fc 86 STA $86fc ; (winCfg + 6)
380d : a5 51 __ LDA T7 + 1 
380f : 69 00 __ ADC #$00
3811 : 8d fd 86 STA $86fd ; (winCfg + 7)
3814 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
3817 : 18 __ __ CLC
3818 : 65 53 __ ADC T8 + 0 
381a : 85 53 __ STA T8 + 0 
381c : ad b1 87 LDA $87b1 ; (vdc_state + 4)
381f : 65 54 __ ADC T8 + 1 
3821 : 85 54 __ STA T8 + 1 
3823 : c6 4b __ DEC T0 + 0 
3825 : d0 88 __ BNE $37af ; (vdcwin_win_new.l1010 + 0)
3827 : 4c 8f 37 JMP $378f ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
382a : a5 16 __ LDA P9 ; (border + 0)
382c : 29 0f __ AND #$0f
382e : 85 47 __ STA T2 + 0 
3830 : 49 ff __ EOR #$ff
3832 : 18 __ __ CLC
3833 : 69 01 __ ADC #$01
3835 : 29 09 __ AND #$09
3837 : 85 48 __ STA T3 + 0 
3839 : aa __ __ TAX
383a : bd 5d 82 LDA $825d,x ; (winStyles + 0)
383d : 85 49 __ STA T4 + 0 
383f : a5 16 __ LDA P9 ; (border + 0)
3841 : 0a __ __ ASL
3842 : 10 0c __ BPL $3850 ; (vdcwin_border_clear.s53 + 0)
.s4:
3844 : a0 00 __ LDY #$00
3846 : b1 14 __ LDA (P7),y ; (win + 0)
3848 : d0 06 __ BNE $3850 ; (vdcwin_border_clear.s53 + 0)
.s1:
384a : a5 16 __ LDA P9 ; (border + 0)
384c : 29 bf __ AND #$bf
384e : 85 16 __ STA P9 ; (border + 0)
.s53:
3850 : a5 16 __ LDA P9 ; (border + 0)
3852 : 29 20 __ AND #$20
3854 : f0 2c __ BEQ $3882 ; (vdcwin_border_clear.s55 + 0)
.s8:
3856 : a0 00 __ LDY #$00
3858 : b1 14 __ LDA (P7),y ; (win + 0)
385a : 18 __ __ CLC
385b : a0 02 __ LDY #$02
385d : 71 14 __ ADC (P7),y ; (win + 0)
385f : a8 __ __ TAY
3860 : a9 00 __ LDA #$00
3862 : 2a __ __ ROL
3863 : 85 1c __ STA ACCU + 1 
3865 : 98 __ __ TYA
3866 : 69 01 __ ADC #$01
3868 : 85 1b __ STA ACCU + 0 
386a : 90 02 __ BCC $386e ; (vdcwin_border_clear.s8 + 24)
386c : e6 1c __ INC ACCU + 1 
386e : ad b1 87 LDA $87b1 ; (vdc_state + 4)
3871 : c5 1c __ CMP ACCU + 1 
3873 : d0 05 __ BNE $387a ; (vdcwin_border_clear.s1007 + 0)
.s1006:
3875 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
3878 : c5 1b __ CMP ACCU + 0 
.s1007:
387a : b0 06 __ BCS $3882 ; (vdcwin_border_clear.s55 + 0)
.s5:
387c : a5 16 __ LDA P9 ; (border + 0)
387e : 29 df __ AND #$df
3880 : 85 16 __ STA P9 ; (border + 0)
.s55:
3882 : 24 16 __ BIT P9 ; (border + 0)
3884 : 10 67 __ BPL $38ed ; (vdcwin_border_clear.s59 + 0)
.s12:
3886 : a0 01 __ LDY #$01
3888 : b1 14 __ LDA (P7),y ; (win + 0)
388a : f0 61 __ BEQ $38ed ; (vdcwin_border_clear.s59 + 0)
.s9:
388c : 38 __ __ SEC
388d : e9 01 __ SBC #$01
388f : 85 4a __ STA T7 + 0 
3891 : a5 16 __ LDA P9 ; (border + 0)
3893 : 0a __ __ ASL
3894 : 10 18 __ BPL $38ae ; (vdcwin_border_clear.s15 + 0)
.s13:
3896 : a5 4a __ LDA T7 + 0 
3898 : 85 0e __ STA P1 
389a : a5 49 __ LDA T4 + 0 
389c : 85 10 __ STA P3 
389e : bd 5e 82 LDA $825e,x ; (winStyles + 1)
38a1 : 85 0f __ STA P2 
38a3 : 38 __ __ SEC
38a4 : 88 __ __ DEY
38a5 : b1 14 __ LDA (P7),y ; (win + 0)
38a7 : e9 01 __ SBC #$01
38a9 : 85 0d __ STA P0 
38ab : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s15:
38ae : a0 00 __ LDY #$00
38b0 : b1 14 __ LDA (P7),y ; (win + 0)
38b2 : 85 46 __ STA T0 + 0 
38b4 : 85 0f __ STA P2 
38b6 : a5 4a __ LDA T7 + 0 
38b8 : 85 10 __ STA P3 
38ba : a5 49 __ LDA T4 + 0 
38bc : 85 12 __ STA P5 
38be : a6 48 __ LDX T3 + 0 
38c0 : bd 62 82 LDA $8262,x ; (winStyles + 5)
38c3 : 85 11 __ STA P4 
38c5 : a0 02 __ LDY #$02
38c7 : b1 14 __ LDA (P7),y ; (win + 0)
38c9 : 85 13 __ STA P6 
38cb : 20 d2 2c JSR $2cd2 ; (vdc_hchar.s0 + 0)
38ce : a5 16 __ LDA P9 ; (border + 0)
38d0 : 29 20 __ AND #$20
38d2 : f0 19 __ BEQ $38ed ; (vdcwin_border_clear.s59 + 0)
.s16:
38d4 : a5 10 __ LDA P3 
38d6 : 85 0e __ STA P1 
38d8 : a5 12 __ LDA P5 
38da : 85 10 __ STA P3 
38dc : a6 48 __ LDX T3 + 0 
38de : bd 5f 82 LDA $825f,x ; (winStyles + 2)
38e1 : 85 0f __ STA P2 
38e3 : 18 __ __ CLC
38e4 : a5 13 __ LDA P6 
38e6 : 65 46 __ ADC T0 + 0 
38e8 : 85 0d __ STA P0 
38ea : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s59:
38ed : a5 16 __ LDA P9 ; (border + 0)
38ef : 29 10 __ AND #$10
38f1 : f0 79 __ BEQ $396c ; (vdcwin_border_clear.s39 + 0)
.s22:
38f3 : a0 01 __ LDY #$01
38f5 : b1 14 __ LDA (P7),y ; (win + 0)
38f7 : 18 __ __ CLC
38f8 : a0 03 __ LDY #$03
38fa : 71 14 __ ADC (P7),y ; (win + 0)
38fc : 85 4a __ STA T7 + 0 
38fe : a9 00 __ LDA #$00
3900 : 2a __ __ ROL
3901 : cd b3 87 CMP $87b3 ; (vdc_state + 6)
3904 : d0 05 __ BNE $390b ; (vdcwin_border_clear.s1005 + 0)
.s1004:
3906 : a5 4a __ LDA T7 + 0 
3908 : cd b2 87 CMP $87b2 ; (vdc_state + 5)
.s1005:
390b : b0 5f __ BCS $396c ; (vdcwin_border_clear.s39 + 0)
.s19:
390d : a5 16 __ LDA P9 ; (border + 0)
390f : 0a __ __ ASL
3910 : 10 1b __ BPL $392d ; (vdcwin_border_clear.s25 + 0)
.s23:
3912 : a5 4a __ LDA T7 + 0 
3914 : 85 0e __ STA P1 
3916 : a5 49 __ LDA T4 + 0 
3918 : 85 10 __ STA P3 
391a : a6 48 __ LDX T3 + 0 
391c : bd 60 82 LDA $8260,x ; (winStyles + 3)
391f : 85 0f __ STA P2 
3921 : 38 __ __ SEC
3922 : a0 00 __ LDY #$00
3924 : b1 14 __ LDA (P7),y ; (win + 0)
3926 : e9 01 __ SBC #$01
3928 : 85 0d __ STA P0 
392a : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s25:
392d : a0 00 __ LDY #$00
392f : b1 14 __ LDA (P7),y ; (win + 0)
3931 : 85 46 __ STA T0 + 0 
3933 : 85 0f __ STA P2 
3935 : a5 4a __ LDA T7 + 0 
3937 : 85 10 __ STA P3 
3939 : a5 49 __ LDA T4 + 0 
393b : 85 12 __ STA P5 
393d : a6 48 __ LDX T3 + 0 
393f : bd 63 82 LDA $8263,x ; (winStyles + 6)
3942 : 85 11 __ STA P4 
3944 : a0 02 __ LDY #$02
3946 : b1 14 __ LDA (P7),y ; (win + 0)
3948 : 85 13 __ STA P6 
394a : 20 d2 2c JSR $2cd2 ; (vdc_hchar.s0 + 0)
394d : a5 16 __ LDA P9 ; (border + 0)
394f : 29 20 __ AND #$20
3951 : f0 19 __ BEQ $396c ; (vdcwin_border_clear.s39 + 0)
.s26:
3953 : a5 10 __ LDA P3 
3955 : 85 0e __ STA P1 
3957 : a5 12 __ LDA P5 
3959 : 85 10 __ STA P3 
395b : a6 48 __ LDX T3 + 0 
395d : bd 61 82 LDA $8261,x ; (winStyles + 4)
3960 : 85 0f __ STA P2 
3962 : 18 __ __ CLC
3963 : a5 13 __ LDA P6 
3965 : 65 46 __ ADC T0 + 0 
3967 : 85 0d __ STA P0 
3969 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s39:
396c : a9 00 __ LDA #$00
396e : 85 46 __ STA T0 + 0 
.l29:
3970 : a0 03 __ LDY #$03
3972 : d1 14 __ CMP (P7),y ; (win + 0)
3974 : 90 01 __ BCC $3977 ; (vdcwin_border_clear.s30 + 0)
.s1001:
3976 : 60 __ __ RTS
.s30:
3977 : a5 16 __ LDA P9 ; (border + 0)
3979 : 0a __ __ ASL
397a : 10 25 __ BPL $39a1 ; (vdcwin_border_clear.s35 + 0)
.s33:
397c : a5 49 __ LDA T4 + 0 
397e : 85 10 __ STA P3 
3980 : 38 __ __ SEC
3981 : a0 00 __ LDY #$00
3983 : b1 14 __ LDA (P7),y ; (win + 0)
3985 : e9 01 __ SBC #$01
3987 : 85 0d __ STA P0 
3989 : c8 __ __ INY
398a : b1 14 __ LDA (P7),y ; (win + 0)
398c : 18 __ __ CLC
398d : 65 46 __ ADC T0 + 0 
398f : 85 0e __ STA P1 
3991 : 38 __ __ SEC
3992 : a9 00 __ LDA #$00
3994 : e5 47 __ SBC T2 + 0 
3996 : 29 09 __ AND #$09
3998 : aa __ __ TAX
3999 : bd 64 82 LDA $8264,x ; (winStyles + 7)
399c : 85 0f __ STA P2 
399e : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s35:
39a1 : a9 20 __ LDA #$20
39a3 : 85 11 __ STA P4 
39a5 : a0 02 __ LDY #$02
39a7 : b1 14 __ LDA (P7),y ; (win + 0)
39a9 : 85 13 __ STA P6 
39ab : a0 00 __ LDY #$00
39ad : b1 14 __ LDA (P7),y ; (win + 0)
39af : 85 0f __ STA P2 
39b1 : c8 __ __ INY
39b2 : b1 14 __ LDA (P7),y ; (win + 0)
39b4 : 18 __ __ CLC
39b5 : 65 46 __ ADC T0 + 0 
39b7 : 85 10 __ STA P3 
39b9 : 20 f8 2a JSR $2af8 ; (vdc_hchar@proxy + 0)
39bc : a5 16 __ LDA P9 ; (border + 0)
39be : 29 20 __ AND #$20
39c0 : f0 1f __ BEQ $39e1 ; (vdcwin_border_clear.s69 + 0)
.s36:
39c2 : a5 10 __ LDA P3 
39c4 : 85 0e __ STA P1 
39c6 : a5 49 __ LDA T4 + 0 
39c8 : 85 10 __ STA P3 
39ca : 18 __ __ CLC
39cb : a5 13 __ LDA P6 
39cd : 65 0f __ ADC P2 
39cf : 85 0d __ STA P0 
39d1 : 38 __ __ SEC
39d2 : a9 00 __ LDA #$00
39d4 : e5 47 __ SBC T2 + 0 
39d6 : 29 09 __ AND #$09
39d8 : aa __ __ TAX
39d9 : bd 65 82 LDA $8265,x ; (winStyles + 8)
39dc : 85 0f __ STA P2 
39de : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s69:
39e1 : e6 46 __ INC T0 + 0 
39e3 : a5 46 __ LDA T0 + 0 
39e5 : 4c 70 39 JMP $3970 ; (vdcwin_border_clear.l29 + 0)
--------------------------------------------------------------------
39e8 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
39f4 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
39ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3a00 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
3a0f : 20 e4 ff JSR $ffe4 
3a12 : c9 00 __ CMP #$00
3a14 : f0 f9 __ BEQ $3a0f ; (vdcwin_getch.s0 + 0)
3a16 : 85 1b __ STA ACCU + 0 
3a18 : a9 00 __ LDA #$00
3a1a : 85 1c __ STA ACCU + 1 
.s1001:
3a1c : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
3a1d : ad fb 86 LDA $86fb ; (winCfg + 5)
3a20 : d0 01 __ BNE $3a23 ; (vdcwin_win_free.s3 + 0)
3a22 : 60 __ __ RTS
.s3:
3a23 : 85 44 __ STA T0 + 0 
3a25 : a8 __ __ TAY
3a26 : be 61 80 LDX $8061,y ; (__multab13L + 0)
3a29 : 86 1b __ STX ACCU + 0 
3a2b : bc 88 88 LDY $8888,x ; (multab + 136)
3a2e : 84 1c __ STY ACCU + 1 
3a30 : bd 89 88 LDA $8889,x ; (multab + 137)
3a33 : 85 43 __ STA T5 + 0 
3a35 : 85 1d __ STA ACCU + 2 
3a37 : bd 83 88 LDA $8883,x ; (multab + 131)
3a3a : 85 45 __ STA T2 + 0 
3a3c : 8d fc 86 STA $86fc ; (winCfg + 6)
3a3f : bd 84 88 LDA $8884,x ; (multab + 132)
3a42 : 85 46 __ STA T2 + 1 
3a44 : 8d fd 86 STA $86fd ; (winCfg + 7)
3a47 : bd 86 88 LDA $8886,x ; (multab + 134)
3a4a : 85 1e __ STA ACCU + 3 
3a4c : bd 87 88 LDA $8887,x ; (multab + 135)
3a4f : 85 4a __ STA T10 + 0 
3a51 : 0a __ __ ASL
3a52 : aa __ __ TAX
3a53 : bd 00 88 LDA $8800,x ; (multab + 0)
3a56 : 18 __ __ CLC
3a57 : 65 1e __ ADC ACCU + 3 
3a59 : 85 4b __ STA T11 + 0 
3a5b : bd 01 88 LDA $8801,x ; (multab + 1)
3a5e : 69 00 __ ADC #$00
3a60 : 85 4c __ STA T11 + 1 
3a62 : a6 1b __ LDX ACCU + 0 
3a64 : bd 85 88 LDA $8885,x ; (multab + 133)
3a67 : 85 1b __ STA ACCU + 0 
3a69 : 0a __ __ ASL
3a6a : 10 0e __ BPL $3a7a ; (vdcwin_win_free.s53 + 0)
.s10:
3a6c : a5 1e __ LDA ACCU + 3 
3a6e : f0 0a __ BEQ $3a7a ; (vdcwin_win_free.s53 + 0)
.s7:
3a70 : e6 1c __ INC ACCU + 1 
3a72 : a5 4b __ LDA T11 + 0 
3a74 : d0 02 __ BNE $3a78 ; (vdcwin_win_free.s1009 + 0)
.s1008:
3a76 : c6 4c __ DEC T11 + 1 
.s1009:
3a78 : c6 4b __ DEC T11 + 0 
.s53:
3a7a : a5 1b __ LDA ACCU + 0 
3a7c : 29 20 __ AND #$20
3a7e : f0 14 __ BEQ $3a94 ; (vdcwin_win_free.s55 + 0)
.s14:
3a80 : 98 __ __ TYA
3a81 : 18 __ __ CLC
3a82 : 65 1e __ ADC ACCU + 3 
3a84 : a8 __ __ TAY
3a85 : a9 00 __ LDA #$00
3a87 : 2a __ __ ROL
3a88 : cd b1 87 CMP $87b1 ; (vdc_state + 4)
3a8b : d0 03 __ BNE $3a90 ; (vdcwin_win_free.s1005 + 0)
.s1004:
3a8d : cc b0 87 CPY $87b0 ; (vdc_state + 3)
.s1005:
3a90 : b0 02 __ BCS $3a94 ; (vdcwin_win_free.s55 + 0)
.s11:
3a92 : e6 1c __ INC ACCU + 1 
.s55:
3a94 : 24 1b __ BIT ACCU + 0 
3a96 : 10 15 __ BPL $3aad ; (vdcwin_win_free.s56 + 0)
.s18:
3a98 : a5 4a __ LDA T10 + 0 
3a9a : f0 11 __ BEQ $3aad ; (vdcwin_win_free.s56 + 0)
.s15:
3a9c : e6 1d __ INC ACCU + 2 
3a9e : 38 __ __ SEC
3a9f : a5 4b __ LDA T11 + 0 
3aa1 : ed b0 87 SBC $87b0 ; (vdc_state + 3)
3aa4 : 85 4b __ STA T11 + 0 
3aa6 : a5 4c __ LDA T11 + 1 
3aa8 : ed b1 87 SBC $87b1 ; (vdc_state + 4)
3aab : 85 4c __ STA T11 + 1 
.s56:
3aad : a5 1b __ LDA ACCU + 0 
3aaf : 29 10 __ AND #$10
3ab1 : f0 15 __ BEQ $3ac8 ; (vdcwin_win_free.s21 + 0)
.s22:
3ab3 : 18 __ __ CLC
3ab4 : a5 43 __ LDA T5 + 0 
3ab6 : 65 4a __ ADC T10 + 0 
3ab8 : a8 __ __ TAY
3ab9 : a9 00 __ LDA #$00
3abb : 2a __ __ ROL
3abc : cd b3 87 CMP $87b3 ; (vdc_state + 6)
3abf : d0 03 __ BNE $3ac4 ; (vdcwin_win_free.s1003 + 0)
.s1002:
3ac1 : cc b2 87 CPY $87b2 ; (vdc_state + 5)
.s1003:
3ac4 : b0 02 __ BCS $3ac8 ; (vdcwin_win_free.s21 + 0)
.s19:
3ac6 : e6 1d __ INC ACCU + 2 
.s21:
3ac8 : a5 1d __ LDA ACCU + 2 
3aca : d0 11 __ BNE $3add ; (vdcwin_win_free.s27 + 0)
.s26:
3acc : a5 45 __ LDA T2 + 0 
3ace : 8d fc 86 STA $86fc ; (winCfg + 6)
3ad1 : a5 46 __ LDA T2 + 1 
3ad3 : 8d fd 86 STA $86fd ; (winCfg + 7)
3ad6 : a6 44 __ LDX T0 + 0 
3ad8 : ca __ __ DEX
3ad9 : 8e fb 86 STX $86fb ; (winCfg + 5)
.s1001:
3adc : 60 __ __ RTS
.s27:
3add : 85 47 __ STA T3 + 0 
3adf : a5 1c __ LDA ACCU + 1 
3ae1 : 85 14 __ STA P7 
.l1006:
3ae3 : a9 00 __ LDA #$00
3ae5 : 85 15 __ STA P8 
3ae7 : ad b5 87 LDA $87b5 ; (vdc_state + 8)
3aea : 18 __ __ CLC
3aeb : 65 4b __ ADC T11 + 0 
3aed : 85 0f __ STA P2 
3aef : ad b6 87 LDA $87b6 ; (vdc_state + 9)
3af2 : 65 4c __ ADC T11 + 1 
3af4 : 85 10 __ STA P3 
3af6 : ad f6 86 LDA $86f6 ; (winCfg + 0)
3af9 : 85 11 __ STA P4 
3afb : ad fc 86 LDA $86fc ; (winCfg + 6)
3afe : 85 48 __ STA T7 + 0 
3b00 : 85 12 __ STA P5 
3b02 : ad fd 86 LDA $86fd ; (winCfg + 7)
3b05 : 85 49 __ STA T7 + 1 
3b07 : 85 13 __ STA P6 
3b09 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
3b0c : a9 00 __ LDA #$00
3b0e : 85 15 __ STA P8 
3b10 : 18 __ __ CLC
3b11 : a5 48 __ LDA T7 + 0 
3b13 : 65 14 __ ADC P7 
3b15 : 85 48 __ STA T7 + 0 
3b17 : 85 12 __ STA P5 
3b19 : 8d fc 86 STA $86fc ; (winCfg + 6)
3b1c : a5 49 __ LDA T7 + 1 
3b1e : 69 00 __ ADC #$00
3b20 : 85 49 __ STA T7 + 1 
3b22 : 85 13 __ STA P6 
3b24 : 8d fd 86 STA $86fd ; (winCfg + 7)
3b27 : ad b7 87 LDA $87b7 ; (vdc_state + 10)
3b2a : 18 __ __ CLC
3b2b : 65 4b __ ADC T11 + 0 
3b2d : 85 0f __ STA P2 
3b2f : ad b8 87 LDA $87b8 ; (vdc_state + 11)
3b32 : 65 4c __ ADC T11 + 1 
3b34 : 85 10 __ STA P3 
3b36 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
3b39 : 18 __ __ CLC
3b3a : a5 48 __ LDA T7 + 0 
3b3c : 65 14 __ ADC P7 
3b3e : 8d fc 86 STA $86fc ; (winCfg + 6)
3b41 : a5 49 __ LDA T7 + 1 
3b43 : 69 00 __ ADC #$00
3b45 : 8d fd 86 STA $86fd ; (winCfg + 7)
3b48 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
3b4b : 18 __ __ CLC
3b4c : 65 4b __ ADC T11 + 0 
3b4e : 85 4b __ STA T11 + 0 
3b50 : ad b1 87 LDA $87b1 ; (vdc_state + 4)
3b53 : 65 4c __ ADC T11 + 1 
3b55 : 85 4c __ STA T11 + 1 
3b57 : c6 47 __ DEC T3 + 0 
3b59 : d0 88 __ BNE $3ae3 ; (vdcwin_win_free.l1006 + 0)
3b5b : 4c cc 3a JMP $3acc ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
initoverlay: ; initoverlay()->void
.s1000:
3b5e : a5 53 __ LDA T4 + 0 
3b60 : 8d 9f ab STA $ab9f ; (projbuffer + 16)
3b63 : a5 54 __ LDA T4 + 1 
3b65 : 8d a0 ab STA $aba0 ; (projbuffer + 17)
3b68 : a5 55 __ LDA T5 + 0 
3b6a : 8d a1 ab STA $aba1 ; (projbuffer + 18)
3b6d : 38 __ __ SEC
3b6e : a5 23 __ LDA SP + 0 
3b70 : e9 08 __ SBC #$08
3b72 : 85 23 __ STA SP + 0 
3b74 : b0 02 __ BCS $3b78 ; (initoverlay.s0 + 0)
3b76 : c6 24 __ DEC SP + 1 
.s0:
3b78 : a9 00 __ LDA #$00
3b7a : 85 51 __ STA T2 + 0 
3b7c : a9 c0 __ LDA #$c0
3b7e : 85 4f __ STA T0 + 1 
3b80 : a9 3f __ LDA #$3f
3b82 : 85 50 __ STA T1 + 0 
.l2:
3b84 : a9 51 __ LDA #$51
3b86 : a0 02 __ LDY #$02
3b88 : 91 23 __ STA (SP + 0),y 
3b8a : a9 89 __ LDA #$89
3b8c : c8 __ __ INY
3b8d : 91 23 __ STA (SP + 0),y 
3b8f : a9 90 __ LDA #$90
3b91 : c8 __ __ INY
3b92 : 91 23 __ STA (SP + 0),y 
3b94 : a9 3c __ LDA #$3c
3b96 : c8 __ __ INY
3b97 : 91 23 __ STA (SP + 0),y 
3b99 : 18 __ __ CLC
3b9a : a5 51 __ LDA T2 + 0 
3b9c : 69 01 __ ADC #$01
3b9e : 85 55 __ STA T5 + 0 
3ba0 : c8 __ __ INY
3ba1 : 91 23 __ STA (SP + 0),y 
3ba3 : a9 00 __ LDA #$00
3ba5 : c8 __ __ INY
3ba6 : 91 23 __ STA (SP + 0),y 
3ba8 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
3bab : a9 51 __ LDA #$51
3bad : 85 16 __ STA P9 
3baf : a9 89 __ LDA #$89
3bb1 : 85 17 __ STA P10 
3bb3 : 20 31 33 JSR $3331 ; (printcentered.s0 + 0)
3bb6 : a9 51 __ LDA #$51
3bb8 : a0 02 __ LDY #$02
3bba : 91 23 __ STA (SP + 0),y 
3bbc : a9 89 __ LDA #$89
3bbe : c8 __ __ INY
3bbf : 91 23 __ STA (SP + 0),y 
3bc1 : a5 55 __ LDA T5 + 0 
3bc3 : a0 06 __ LDY #$06
3bc5 : 91 23 __ STA (SP + 0),y 
3bc7 : a9 00 __ LDA #$00
3bc9 : c8 __ __ INY
3bca : 91 23 __ STA (SP + 0),y 
3bcc : a9 a2 __ LDA #$a2
3bce : a0 04 __ LDY #$04
3bd0 : 91 23 __ STA (SP + 0),y 
3bd2 : a9 3c __ LDA #$3c
3bd4 : c8 __ __ INY
3bd5 : 91 23 __ STA (SP + 0),y 
3bd7 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
3bda : a6 51 __ LDX T2 + 0 
3bdc : bd 65 80 LDA $8065,x ; (__multab3L + 0)
3bdf : aa __ __ TAX
3be0 : 18 __ __ CLC
3be1 : 69 e2 __ ADC #$e2
3be3 : 85 53 __ STA T4 + 0 
3be5 : a9 87 __ LDA #$87
3be7 : 69 00 __ ADC #$00
3be9 : 85 54 __ STA T4 + 1 
3beb : a5 50 __ LDA T1 + 0 
3bed : 9d e2 87 STA $87e2,x ; (overlaydata + 0)
3bf0 : f0 59 __ BEQ $3c4b ; (initoverlay.s3 + 0)
.s5:
3bf2 : a9 51 __ LDA #$51
3bf4 : 8d f8 ab STA $abf8 ; (sstack + 5)
3bf7 : a9 89 __ LDA #$89
3bf9 : 8d f9 ab STA $abf9 ; (sstack + 6)
3bfc : 20 49 2a JSR $2a49 ; (load_overlay.s1000 + 0)
3bff : a5 50 __ LDA T1 + 0 
3c01 : a0 00 __ LDY #$00
3c03 : 84 13 __ STY P6 
3c05 : 84 11 __ STY P4 
3c07 : 84 0e __ STY P1 
3c09 : 91 53 __ STA (T4 + 0),y 
3c0b : 85 0d __ STA P0 
3c0d : a9 3f __ LDA #$3f
3c0f : 85 10 __ STA P3 
3c11 : a9 14 __ LDA #$14
3c13 : 85 14 __ STA P7 
3c15 : a5 4f __ LDA T0 + 1 
3c17 : 85 0f __ STA P2 
3c19 : a9 ac __ LDA #$ac
3c1b : 85 12 __ STA P5 
3c1d : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
3c20 : a9 00 __ LDA #$00
3c22 : a0 01 __ LDY #$01
3c24 : 91 53 __ STA (T4 + 0),y 
3c26 : a5 4f __ LDA T0 + 1 
3c28 : c8 __ __ INY
3c29 : 91 53 __ STA (T4 + 0),y 
3c2b : 18 __ __ CLC
3c2c : 69 28 __ ADC #$28
3c2e : 85 1c __ STA ACCU + 1 
3c30 : 18 __ __ CLC
3c31 : 69 ec __ ADC #$ec
3c33 : 85 4f __ STA T0 + 1 
3c35 : a5 0d __ LDA P0 
3c37 : c9 3f __ CMP #$3f
3c39 : f0 36 __ BEQ $3c71 ; (initoverlay.s8 + 0)
.s9:
3c3b : a5 1c __ LDA ACCU + 1 
3c3d : c9 d0 __ CMP #$d0
3c3f : 90 06 __ BCC $3c47 ; (initoverlay.s15 + 0)
.s18:
3c41 : a9 ef __ LDA #$ef
3c43 : c5 1c __ CMP ACCU + 1 
3c45 : b0 04 __ BCS $3c4b ; (initoverlay.s3 + 0)
.s15:
3c47 : a9 00 __ LDA #$00
3c49 : 85 50 __ STA T1 + 0 
.s3:
3c4b : e6 51 __ INC T2 + 0 
3c4d : a5 51 __ LDA T2 + 0 
3c4f : c9 06 __ CMP #$06
3c51 : b0 03 __ BCS $3c56 ; (initoverlay.s1001 + 0)
3c53 : 4c 84 3b JMP $3b84 ; (initoverlay.l2 + 0)
.s1001:
3c56 : 18 __ __ CLC
3c57 : a5 23 __ LDA SP + 0 
3c59 : 69 08 __ ADC #$08
3c5b : 85 23 __ STA SP + 0 
3c5d : 90 02 __ BCC $3c61 ; (initoverlay.s1001 + 11)
3c5f : e6 24 __ INC SP + 1 
3c61 : ad 9f ab LDA $ab9f ; (projbuffer + 16)
3c64 : 85 53 __ STA T4 + 0 
3c66 : ad a0 ab LDA $aba0 ; (projbuffer + 17)
3c69 : 85 54 __ STA T4 + 1 
3c6b : ad a1 ab LDA $aba1 ; (projbuffer + 18)
3c6e : 85 55 __ STA T5 + 0 
3c70 : 60 __ __ RTS
.s8:
3c71 : a5 1c __ LDA ACCU + 1 
3c73 : c9 c0 __ CMP #$c0
3c75 : 90 06 __ BCC $3c7d ; (initoverlay.s11 + 0)
.s14:
3c77 : a9 ef __ LDA #$ef
3c79 : c5 1c __ CMP ACCU + 1 
3c7b : b0 ce __ BCS $3c4b ; (initoverlay.s3 + 0)
.s11:
3c7d : e6 51 __ INC T2 + 0 
3c7f : a5 51 __ LDA T2 + 0 
3c81 : c9 06 __ CMP #$06
3c83 : b0 d1 __ BCS $3c56 ; (initoverlay.s1001 + 0)
.s26:
3c85 : a9 7f __ LDA #$7f
3c87 : 85 50 __ STA T1 + 0 
3c89 : a9 d0 __ LDA #$d0
3c8b : 85 4f __ STA T0 + 1 
3c8d : 4c 84 3b JMP $3b84 ; (initoverlay.l2 + 0)
--------------------------------------------------------------------
3c90 : __ __ __ BYT 6d 45 4d 4f 52 59 20 4f 56 45 52 4c 41 59 20 25 : mEMORY OVERLAY %
3ca0 : __ __ __ BYT 55 00                                           : U.
--------------------------------------------------------------------
3ca2 : __ __ __ BYT 56 44 43 53 45 4f 56 4c 25 55 00                : VDCSEOVL%U.
--------------------------------------------------------------------
3cad : __ __ __ BYT 6c 4f 41 44 20 56 49 53 55 41 4c 20 70 65 74 73 : lOAD VISUAL pets
3cbd : __ __ __ BYT 63 69 69 00                                     : cii.
--------------------------------------------------------------------
3cc1 : __ __ __ BYT 56 44 43 53 45 50 45 54 56 00                   : VDCSEPETV.
--------------------------------------------------------------------
3ccb : __ __ __ BYT 63 4f 50 59 20 43 48 41 52 53 45 54 53 00       : cOPY CHARSETS.
--------------------------------------------------------------------
screenmapfill: ; screenmapfill(u8,u8)->void
.s0:
3cd9 : a9 00 __ LDA #$00
3cdb : 85 0d __ STA P0 
3cdd : a9 58 __ LDA #$58
3cdf : 85 0e __ STA P1 
3ce1 : ad f8 ab LDA $abf8 ; (sstack + 5)
3ce4 : 85 0f __ STA P2 
3ce6 : ad db 87 LDA $87db ; (screentotal + 0)
3ce9 : 85 51 __ STA T0 + 0 
3ceb : 18 __ __ CLC
3cec : 69 30 __ ADC #$30
3cee : 85 10 __ STA P3 
3cf0 : ad dc 87 LDA $87dc ; (screentotal + 1)
3cf3 : 85 52 __ STA T0 + 1 
3cf5 : 69 00 __ ADC #$00
3cf7 : 85 11 __ STA P4 
3cf9 : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
3cfc : 20 18 3d JSR $3d18 ; (placesignature.s1000 + 0)
3cff : a5 51 __ LDA T0 + 0 
3d01 : 85 10 __ STA P3 
3d03 : 18 __ __ CLC
3d04 : 69 30 __ ADC #$30
3d06 : 85 0d __ STA P0 
3d08 : a5 52 __ LDA T0 + 1 
3d0a : 85 11 __ STA P4 
3d0c : 69 58 __ ADC #$58
3d0e : 85 0e __ STA P1 
3d10 : ad f9 ab LDA $abf9 ; (sstack + 6)
3d13 : 85 0f __ STA P2 
3d15 : 4c e2 14 JMP $14e2 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
placesignature: ; placesignature()->void
.s1000:
3d18 : 38 __ __ SEC
3d19 : a5 23 __ LDA SP + 0 
3d1b : e9 08 __ SBC #$08
3d1d : 85 23 __ STA SP + 0 
3d1f : b0 02 __ BCS $3d23 ; (placesignature.s0 + 0)
3d21 : c6 24 __ DEC SP + 1 
.s0:
3d23 : a9 00 __ LDA #$00
3d25 : a2 31 __ LDX #$31
.l1007:
3d27 : 9d a5 ab STA $aba5,x ; (projbuffer + 22)
3d2a : ca __ __ DEX
3d2b : d0 fa __ BNE $3d27 ; (placesignature.l1007 + 0)
.s1003:
3d2d : ad cb 87 LDA $87cb ; (canvas + 5)
3d30 : 85 1b __ STA ACCU + 0 
3d32 : ad cc 87 LDA $87cc ; (canvas + 6)
3d35 : 85 1c __ STA ACCU + 1 
3d37 : ad c9 87 LDA $87c9 ; (canvas + 3)
3d3a : 85 03 __ STA WORK + 0 
3d3c : ad ca 87 LDA $87ca ; (canvas + 4)
3d3f : 85 04 __ STA WORK + 1 
3d41 : 20 87 7c JSR $7c87 ; (mul16 + 0)
3d44 : a5 05 __ LDA WORK + 2 
3d46 : 85 4e __ STA T0 + 0 
3d48 : 18 __ __ CLC
3d49 : a5 06 __ LDA WORK + 3 
3d4b : 69 58 __ ADC #$58
3d4d : 85 4f __ STA T0 + 1 
3d4f : a9 a6 __ LDA #$a6
3d51 : a0 02 __ LDY #$02
3d53 : 91 23 __ STA (SP + 0),y 
3d55 : a9 ab __ LDA #$ab
3d57 : c8 __ __ INY
3d58 : 91 23 __ STA (SP + 0),y 
3d5a : a9 b4 __ LDA #$b4
3d5c : c8 __ __ INY
3d5d : 91 23 __ STA (SP + 0),y 
3d5f : a9 3d __ LDA #$3d
3d61 : c8 __ __ INY
3d62 : 91 23 __ STA (SP + 0),y 
3d64 : a9 d0 __ LDA #$d0
3d66 : c8 __ __ INY
3d67 : 91 23 __ STA (SP + 0),y 
3d69 : a9 3d __ LDA #$3d
3d6b : c8 __ __ INY
3d6c : 91 23 __ STA (SP + 0),y 
3d6e : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
3d71 : a9 00 __ LDA #$00
3d73 : 85 50 __ STA T2 + 0 
.l1:
3d75 : a9 a6 __ LDA #$a6
3d77 : 85 0d __ STA P0 
3d79 : a9 ab __ LDA #$ab
3d7b : 85 0e __ STA P1 
3d7d : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
3d80 : a5 1c __ LDA ACCU + 1 
3d82 : 30 24 __ BMI $3da8 ; (placesignature.s1001 + 0)
.s1006:
3d84 : d0 06 __ BNE $3d8c ; (placesignature.s2 + 0)
.s1004:
3d86 : a5 50 __ LDA T2 + 0 
3d88 : c5 1b __ CMP ACCU + 0 
3d8a : b0 1c __ BCS $3da8 ; (placesignature.s1001 + 0)
.s2:
3d8c : 18 __ __ CLC
3d8d : a5 4e __ LDA T0 + 0 
3d8f : 65 50 __ ADC T2 + 0 
3d91 : 85 0d __ STA P0 
3d93 : a5 4f __ LDA T0 + 1 
3d95 : 69 00 __ ADC #$00
3d97 : 85 0e __ STA P1 
3d99 : a6 50 __ LDX T2 + 0 
3d9b : bd a6 ab LDA $aba6,x ; (chareditor@stack + 22)
3d9e : 85 0f __ STA P2 
3da0 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
3da3 : e6 50 __ INC T2 + 0 
3da5 : 4c 75 3d JMP $3d75 ; (placesignature.l1 + 0)
.s1001:
3da8 : 18 __ __ CLC
3da9 : a5 23 __ LDA SP + 0 
3dab : 69 08 __ ADC #$08
3dad : 85 23 __ STA SP + 0 
3daf : 90 02 __ BCC $3db3 ; (placesignature.s1001 + 11)
3db1 : e6 24 __ INC SP + 1 
3db3 : 60 __ __ RTS
--------------------------------------------------------------------
3db4 : __ __ __ BYT 76 64 63 20 73 43 52 45 45 4e 20 65 44 49 54 4f : vdc sCREEN eDITO
3dc4 : __ __ __ BYT 52 20 25 53 20 78 2e 6d 4f 4c 20 00             : R %S x.mOL .
--------------------------------------------------------------------
3dd0 : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 30 39 2d 31 38 32 : V20-20240409-182
3de0 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
3de2 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 53 54 41 : pRESS KEY TO STA
3df2 : __ __ __ BYT 52 54 2e 00                                     : RT..
--------------------------------------------------------------------
change_plotcolor: ; change_plotcolor(u8)->void
.s0:
3df6 : a5 11 __ LDA P4 ; (newval + 0)
3df8 : 8d 92 87 STA $8792 ; (plotcolor + 0)
3dfb : ad b4 87 LDA $87b4 ; (vdc_state + 7)
3dfe : 29 f0 __ AND #$f0
3e00 : 18 __ __ CLC
3e01 : 65 11 __ ADC P4 ; (newval + 0)
3e03 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
--------------------------------------------------------------------
plotcursor: ; plotcursor()->void
.s0:
3e06 : ad 8c 87 LDA $878c ; (screen_col + 0)
3e09 : 85 0d __ STA P0 
3e0b : ad 8e 87 LDA $878e ; (screen_row + 0)
3e0e : 85 0e __ STA P1 
3e10 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
3e13 : 85 0f __ STA P2 
3e15 : ad 95 87 LDA $8795 ; (plotblink + 0)
3e18 : 0a __ __ ASL
3e19 : 0a __ __ ASL
3e1a : 0a __ __ ASL
3e1b : 0a __ __ ASL
3e1c : 18 __ __ CLC
3e1d : 6d 92 87 ADC $8792 ; (plotcolor + 0)
3e20 : 85 43 __ STA T0 + 0 
3e22 : ad 94 87 LDA $8794 ; (plotunderline + 0)
3e25 : 4a __ __ LSR
3e26 : 6a __ __ ROR
3e27 : 6a __ __ ROR
3e28 : 29 c0 __ AND #$c0
3e2a : 6a __ __ ROR
3e2b : 65 43 __ ADC T0 + 0 
3e2d : 85 43 __ STA T0 + 0 
3e2f : ad 93 87 LDA $8793 ; (plotreverse + 0)
3e32 : 4a __ __ LSR
3e33 : 6a __ __ ROR
3e34 : 29 80 __ AND #$80
3e36 : 6a __ __ ROR
3e37 : 65 43 __ ADC T0 + 0 
3e39 : 85 43 __ STA T0 + 0 
3e3b : ad 96 87 LDA $8796 ; (plotaltchar + 0)
3e3e : 4a __ __ LSR
3e3f : a9 00 __ LDA #$00
3e41 : 6a __ __ ROR
3e42 : 65 43 __ ADC T0 + 0 
3e44 : 85 10 __ STA P3 
3e46 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_cursor_toggle@proxy: ; vdcwin_cursor_toggle@proxy
3e49 : a9 d1 __ LDA #$d1
3e4b : 85 0d __ STA P0 
3e4d : a9 87 __ LDA #$87
3e4f : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_cursor_toggle: ; vdcwin_cursor_toggle(struct VDCWin*)->void
.s0:
3e51 : a0 01 __ LDY #$01
3e53 : b1 0d __ LDA (P0),y ; (win + 0)
3e55 : 18 __ __ CLC
3e56 : a0 05 __ LDY #$05
3e58 : 71 0d __ ADC (P0),y ; (win + 0)
3e5a : 0a __ __ ASL
3e5b : aa __ __ TAX
3e5c : 18 __ __ CLC
3e5d : 88 __ __ DEY
3e5e : b1 0d __ LDA (P0),y ; (win + 0)
3e60 : a0 00 __ LDY #$00
3e62 : 71 0d __ ADC (P0),y ; (win + 0)
3e64 : 18 __ __ CLC
3e65 : 7d 00 88 ADC $8800,x ; (multab + 0)
3e68 : a8 __ __ TAY
3e69 : a9 00 __ LDA #$00
3e6b : 7d 01 88 ADC $8801,x ; (multab + 1)
3e6e : a2 12 __ LDX #$12
3e70 : 8e 00 d6 STX $d600 
3e73 : aa __ __ TAX
3e74 : 98 __ __ TYA
3e75 : 18 __ __ CLC
3e76 : 6d b7 87 ADC $87b7 ; (vdc_state + 10)
3e79 : a8 __ __ TAY
3e7a : 8a __ __ TXA
3e7b : 6d b8 87 ADC $87b8 ; (vdc_state + 11)
.l169:
3e7e : 2c 00 d6 BIT $d600 
3e81 : 10 fb __ BPL $3e7e ; (vdcwin_cursor_toggle.l169 + 0)
.s9:
3e83 : 8d 01 d6 STA $d601 
3e86 : a2 13 __ LDX #$13
3e88 : 8e 00 d6 STX $d600 
.l171:
3e8b : 2c 00 d6 BIT $d600 
3e8e : 10 fb __ BPL $3e8b ; (vdcwin_cursor_toggle.l171 + 0)
.s14:
3e90 : 8c 01 d6 STY $d601 
3e93 : a2 1f __ LDX #$1f
3e95 : 8e 00 d6 STX $d600 
.l173:
3e98 : 2c 00 d6 BIT $d600 
3e9b : 10 fb __ BPL $3e98 ; (vdcwin_cursor_toggle.l173 + 0)
.s18:
3e9d : aa __ __ TAX
3e9e : ad 01 d6 LDA $d601 
3ea1 : 49 50 __ EOR #$50
3ea3 : 85 1b __ STA ACCU + 0 
3ea5 : a9 12 __ LDA #$12
3ea7 : 8d 00 d6 STA $d600 
.l175:
3eaa : 2c 00 d6 BIT $d600 
3ead : 10 fb __ BPL $3eaa ; (vdcwin_cursor_toggle.l175 + 0)
.s27:
3eaf : 8e 01 d6 STX $d601 
3eb2 : a9 13 __ LDA #$13
3eb4 : 8d 00 d6 STA $d600 
.l177:
3eb7 : 2c 00 d6 BIT $d600 
3eba : 10 fb __ BPL $3eb7 ; (vdcwin_cursor_toggle.l177 + 0)
.s32:
3ebc : 8c 01 d6 STY $d601 
3ebf : a9 1f __ LDA #$1f
3ec1 : 8d 00 d6 STA $d600 
.l179:
3ec4 : 2c 00 d6 BIT $d600 
3ec7 : 10 fb __ BPL $3ec4 ; (vdcwin_cursor_toggle.l179 + 0)
.s36:
3ec9 : a5 1b __ LDA ACCU + 0 
3ecb : 8d 01 d6 STA $d601 
.s1001:
3ece : 60 __ __ RTS
--------------------------------------------------------------------
3ecf : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
initstatusbar: ; initstatusbar()->void
.s1000:
3ed4 : a5 53 __ LDA T0 + 0 
3ed6 : 8d d0 ab STA $abd0 ; (buff + 43)
3ed9 : a5 54 __ LDA T3 + 0 
3edb : 8d d1 ab STA $abd1 ; (buff + 44)
.s0:
3ede : ae b2 87 LDX $87b2 ; (vdc_state + 5)
3ee1 : ca __ __ DEX
3ee2 : 86 53 __ STX T0 + 0 
3ee4 : ad 8f 87 LDA $878f ; (screen_row + 1)
3ee7 : d0 07 __ BNE $3ef0 ; (initstatusbar.s3 + 0)
.s1002:
3ee9 : a5 53 __ LDA T0 + 0 
3eeb : cd 8e 87 CMP $878e ; (screen_row + 0)
3eee : f0 75 __ BEQ $3f65 ; (initstatusbar.s1001 + 0)
.s3:
3ef0 : a9 00 __ LDA #$00
3ef2 : 85 0f __ STA P2 
3ef4 : a9 20 __ LDA #$20
3ef6 : 85 11 __ STA P4 
3ef8 : a9 50 __ LDA #$50
3efa : 85 13 __ STA P6 
3efc : a5 53 __ LDA T0 + 0 
3efe : 85 14 __ STA P7 
3f00 : a9 01 __ LDA #$01
3f02 : 85 15 __ STA P8 
3f04 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
3f07 : 85 54 __ STA T3 + 0 
3f09 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
3f0c : 20 ac 2c JSR $2cac ; (vdc_clear.s0 + 0)
3f0f : a9 00 __ LDA #$00
3f11 : 85 11 __ STA P4 
3f13 : a5 53 __ LDA T0 + 0 
3f15 : 85 12 __ STA P5 
3f17 : a5 54 __ LDA T3 + 0 
3f19 : 85 15 __ STA P8 
3f1b : a9 70 __ LDA #$70
3f1d : 85 13 __ STA P6 
3f1f : a9 3f __ LDA #$3f
3f21 : 85 14 __ STA P7 
3f23 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3f26 : a9 11 __ LDA #$11
3f28 : 85 11 __ STA P4 
3f2a : a9 76 __ LDA #$76
3f2c : 85 13 __ STA P6 
3f2e : a9 3f __ LDA #$3f
3f30 : 85 14 __ STA P7 
3f32 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3f35 : a9 1f __ LDA #$1f
3f37 : 85 11 __ STA P4 
3f39 : a9 7b __ LDA #$7b
3f3b : 85 13 __ STA P6 
3f3d : a9 3f __ LDA #$3f
3f3f : 85 14 __ STA P7 
3f41 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3f44 : a9 29 __ LDA #$29
3f46 : 85 11 __ STA P4 
3f48 : a9 81 __ LDA #$81
3f4a : 85 13 __ STA P6 
3f4c : a9 3f __ LDA #$3f
3f4e : 85 14 __ STA P7 
3f50 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3f53 : a9 49 __ LDA #$49
3f55 : 85 11 __ STA P4 
3f57 : a9 88 __ LDA #$88
3f59 : 85 13 __ STA P6 
3f5b : a9 3f __ LDA #$3f
3f5d : 85 14 __ STA P7 
3f5f : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
3f62 : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s1001:
3f65 : ad d0 ab LDA $abd0 ; (buff + 43)
3f68 : 85 53 __ STA T0 + 0 
3f6a : ad d1 ab LDA $abd1 ; (buff + 44)
3f6d : 85 54 __ STA T3 + 0 
3f6f : 60 __ __ RTS
--------------------------------------------------------------------
3f70 : __ __ __ BYT 6d 4f 44 45 3a 00                               : mODE:.
--------------------------------------------------------------------
3f76 : __ __ __ BYT 78 2c 79 3a 00                                  : x,y:.
--------------------------------------------------------------------
3f7b : __ __ __ BYT 63 48 41 52 3a 00                               : cHAR:.
--------------------------------------------------------------------
3f81 : __ __ __ BYT 63 4f 4c 4f 52 3a 00                            : cOLOR:.
--------------------------------------------------------------------
3f88 : __ __ __ BYT 66 38 3d 68 45 4c 50 00                         : f8=hELP.
--------------------------------------------------------------------
printstatusbar: ; printstatusbar()->void
.s1000:
3f90 : a5 53 __ LDA T7 + 0 
3f92 : 8d d3 ab STA $abd3 ; (buff + 46)
3f95 : 38 __ __ SEC
3f96 : a5 23 __ LDA SP + 0 
3f98 : e9 0a __ SBC #$0a
3f9a : 85 23 __ STA SP + 0 
3f9c : b0 02 __ BCS $3fa0 ; (printstatusbar.s0 + 0)
3f9e : c6 24 __ DEC SP + 1 
.s0:
3fa0 : ae b2 87 LDX $87b2 ; (vdc_state + 5)
3fa3 : ca __ __ DEX
3fa4 : 86 4e __ STX T0 + 0 
3fa6 : ad 8e 87 LDA $878e ; (screen_row + 0)
3fa9 : 85 4f __ STA T2 + 0 
3fab : ad 8f 87 LDA $878f ; (screen_row + 1)
3fae : 85 50 __ STA T2 + 1 
3fb0 : d0 09 __ BNE $3fbb ; (printstatusbar.s3 + 0)
.s1002:
3fb2 : a5 4f __ LDA T2 + 0 
3fb4 : c5 4e __ CMP T0 + 0 
3fb6 : d0 03 __ BNE $3fbb ; (printstatusbar.s3 + 0)
3fb8 : 4c 32 41 JMP $4132 ; (printstatusbar.s1001 + 0)
.s3:
3fbb : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
3fbe : 85 51 __ STA T3 + 0 
3fc0 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
3fc3 : a9 51 __ LDA #$51
3fc5 : a0 02 __ LDY #$02
3fc7 : 91 23 __ STA (SP + 0),y 
3fc9 : a9 89 __ LDA #$89
3fcb : c8 __ __ INY
3fcc : 91 23 __ STA (SP + 0),y 
3fce : a9 43 __ LDA #$43
3fd0 : c8 __ __ INY
3fd1 : 91 23 __ STA (SP + 0),y 
3fd3 : a9 41 __ LDA #$41
3fd5 : c8 __ __ INY
3fd6 : 91 23 __ STA (SP + 0),y 
3fd8 : a9 f4 __ LDA #$f4
3fda : c8 __ __ INY
3fdb : 91 23 __ STA (SP + 0),y 
3fdd : a9 87 __ LDA #$87
3fdf : c8 __ __ INY
3fe0 : 91 23 __ STA (SP + 0),y 
3fe2 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
3fe5 : a9 06 __ LDA #$06
3fe7 : 85 11 __ STA P4 
3fe9 : 20 ee 81 JSR $81ee ; (vdc_prints_attr@proxy + 0)
3fec : a9 51 __ LDA #$51
3fee : a0 02 __ LDY #$02
3ff0 : 91 23 __ STA (SP + 0),y 
3ff2 : a9 89 __ LDA #$89
3ff4 : c8 __ __ INY
3ff5 : 91 23 __ STA (SP + 0),y 
3ff7 : a9 49 __ LDA #$49
3ff9 : c8 __ __ INY
3ffa : 91 23 __ STA (SP + 0),y 
3ffc : a9 41 __ LDA #$41
3ffe : c8 __ __ INY
3fff : 91 23 __ STA (SP + 0),y 
4001 : ad cd 87 LDA $87cd ; (canvas + 7)
4004 : 18 __ __ CLC
4005 : 6d 8c 87 ADC $878c ; (screen_col + 0)
4008 : aa __ __ TAX
4009 : ad ce 87 LDA $87ce ; (canvas + 8)
400c : 6d 8d 87 ADC $878d ; (screen_col + 1)
400f : a0 07 __ LDY #$07
4011 : 91 23 __ STA (SP + 0),y 
4013 : 8a __ __ TXA
4014 : 88 __ __ DEY
4015 : 91 23 __ STA (SP + 0),y 
4017 : ad cf 87 LDA $87cf ; (canvas + 9)
401a : 18 __ __ CLC
401b : 65 4f __ ADC T2 + 0 
401d : aa __ __ TAX
401e : ad d0 87 LDA $87d0 ; (canvas + 10)
4021 : 65 50 __ ADC T2 + 1 
4023 : a0 09 __ LDY #$09
4025 : 91 23 __ STA (SP + 0),y 
4027 : 8a __ __ TXA
4028 : 88 __ __ DEY
4029 : 91 23 __ STA (SP + 0),y 
402b : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
402e : a9 16 __ LDA #$16
4030 : 85 11 __ STA P4 
4032 : 20 ee 81 JSR $81ee ; (vdc_prints_attr@proxy + 0)
4035 : a9 24 __ LDA #$24
4037 : 85 0d __ STA P0 
4039 : a5 12 __ LDA P5 
403b : 85 0e __ STA P1 
403d : ad 91 87 LDA $8791 ; (plotscreencode + 0)
4040 : 85 52 __ STA T6 + 0 
4042 : 85 0f __ STA P2 
4044 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
4047 : 85 53 __ STA T7 + 0 
4049 : d0 08 __ BNE $4053 ; (printstatusbar.s7 + 0)
.s8:
404b : 38 __ __ SEC
404c : a5 15 __ LDA P8 
404e : e9 80 __ SBC #$80
4050 : 4c 55 40 JMP $4055 ; (printstatusbar.s9 + 0)
.s7:
4053 : a5 15 __ LDA P8 
.s9:
4055 : 85 10 __ STA P3 
4057 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
405a : a9 51 __ LDA #$51
405c : a0 02 __ LDY #$02
405e : 91 23 __ STA (SP + 0),y 
4060 : a9 89 __ LDA #$89
4062 : c8 __ __ INY
4063 : 91 23 __ STA (SP + 0),y 
4065 : a9 51 __ LDA #$51
4067 : c8 __ __ INY
4068 : 91 23 __ STA (SP + 0),y 
406a : a9 41 __ LDA #$41
406c : c8 __ __ INY
406d : 91 23 __ STA (SP + 0),y 
406f : a5 52 __ LDA T6 + 0 
4071 : c8 __ __ INY
4072 : 91 23 __ STA (SP + 0),y 
4074 : a9 00 __ LDA #$00
4076 : c8 __ __ INY
4077 : 91 23 __ STA (SP + 0),y 
4079 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
407c : a9 26 __ LDA #$26
407e : 85 11 __ STA P4 
4080 : 20 ee 81 JSR $81ee ; (vdc_prints_attr@proxy + 0)
4083 : a9 30 __ LDA #$30
4085 : 85 0d __ STA P0 
4087 : a5 12 __ LDA P5 
4089 : 85 0e __ STA P1 
408b : a9 20 __ LDA #$20
408d : 85 0f __ STA P2 
408f : ad 92 87 LDA $8792 ; (plotcolor + 0)
4092 : 85 52 __ STA T6 + 0 
4094 : 18 __ __ CLC
4095 : 69 40 __ ADC #$40
4097 : 85 10 __ STA P3 
4099 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
409c : a9 51 __ LDA #$51
409e : a0 02 __ LDY #$02
40a0 : 91 23 __ STA (SP + 0),y 
40a2 : a9 89 __ LDA #$89
40a4 : c8 __ __ INY
40a5 : 91 23 __ STA (SP + 0),y 
40a7 : a5 52 __ LDA T6 + 0 
40a9 : a0 06 __ LDY #$06
40ab : 91 23 __ STA (SP + 0),y 
40ad : a9 00 __ LDA #$00
40af : c8 __ __ INY
40b0 : 91 23 __ STA (SP + 0),y 
40b2 : a9 55 __ LDA #$55
40b4 : a0 04 __ LDY #$04
40b6 : 91 23 __ STA (SP + 0),y 
40b8 : a9 41 __ LDA #$41
40ba : c8 __ __ INY
40bb : 91 23 __ STA (SP + 0),y 
40bd : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
40c0 : a9 32 __ LDA #$32
40c2 : 85 11 __ STA P4 
40c4 : 20 ee 81 JSR $81ee ; (vdc_prints_attr@proxy + 0)
40c7 : a9 36 __ LDA #$36
40c9 : 85 11 __ STA P4 
40cb : ad 93 87 LDA $8793 ; (plotreverse + 0)
40ce : d0 07 __ BNE $40d7 ; (printstatusbar.s12 + 0)
.s13:
40d0 : a9 41 __ LDA #$41
40d2 : a2 5d __ LDX #$5d
40d4 : 4c db 40 JMP $40db ; (printstatusbar.s35 + 0)
.s12:
40d7 : a9 41 __ LDA #$41
40d9 : a2 59 __ LDX #$59
.s35:
40db : 86 13 __ STX P6 
40dd : 85 14 __ STA P7 
40df : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
40e2 : a9 3a __ LDA #$3a
40e4 : 85 11 __ STA P4 
40e6 : ad 94 87 LDA $8794 ; (plotunderline + 0)
40e9 : d0 07 __ BNE $40f2 ; (printstatusbar.s17 + 0)
.s18:
40eb : a9 41 __ LDA #$41
40ed : a2 5d __ LDX #$5d
40ef : 4c f6 40 JMP $40f6 ; (printstatusbar.s36 + 0)
.s17:
40f2 : a9 41 __ LDA #$41
40f4 : a2 61 __ LDX #$61
.s36:
40f6 : 86 13 __ STX P6 
40f8 : 85 14 __ STA P7 
40fa : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
40fd : a9 3e __ LDA #$3e
40ff : 85 11 __ STA P4 
4101 : ad 95 87 LDA $8795 ; (plotblink + 0)
4104 : d0 07 __ BNE $410d ; (printstatusbar.s22 + 0)
.s23:
4106 : a9 41 __ LDA #$41
4108 : a2 5d __ LDX #$5d
410a : 4c 11 41 JMP $4111 ; (printstatusbar.s37 + 0)
.s22:
410d : a9 41 __ LDA #$41
410f : a2 65 __ LDX #$65
.s37:
4111 : 86 13 __ STX P6 
4113 : 85 14 __ STA P7 
4115 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
4118 : a5 53 __ LDA T7 + 0 
411a : d0 07 __ BNE $4123 ; (printstatusbar.s27 + 0)
.s28:
411c : a9 41 __ LDA #$41
411e : a2 5d __ LDX #$5d
4120 : 4c 27 41 JMP $4127 ; (printstatusbar.s29 + 0)
.s27:
4123 : a9 41 __ LDA #$41
4125 : a2 69 __ LDX #$69
.s29:
4127 : 86 13 __ STX P6 
4129 : 85 14 __ STA P7 
412b : a9 42 __ LDA #$42
412d : 85 11 __ STA P4 
412f : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
.s1001:
4132 : 18 __ __ CLC
4133 : a5 23 __ LDA SP + 0 
4135 : 69 0a __ ADC #$0a
4137 : 85 23 __ STA SP + 0 
4139 : 90 02 __ BCC $413d ; (printstatusbar.s1001 + 11)
413b : e6 24 __ INC SP + 1 
413d : ad d3 ab LDA $abd3 ; (buff + 46)
4140 : 85 53 __ STA T7 + 0 
4142 : 60 __ __ RTS
--------------------------------------------------------------------
4143 : __ __ __ BYT 25 2d 31 30 53 00                               : %-10S.
--------------------------------------------------------------------
4149 : __ __ __ BYT 25 33 55 2c 25 33 55 00                         : %3U,%3U.
--------------------------------------------------------------------
4151 : __ __ __ BYT 25 32 78 00                                     : %2x.
--------------------------------------------------------------------
4155 : __ __ __ BYT 25 32 55 00                                     : %2U.
--------------------------------------------------------------------
4159 : __ __ __ BYT 72 65 76 00                                     : rev.
--------------------------------------------------------------------
415d : __ __ __ BYT 20 20 20 00                                     :    .
--------------------------------------------------------------------
4161 : __ __ __ BYT 75 6e 64 00                                     : und.
--------------------------------------------------------------------
4165 : __ __ __ BYT 62 6c 69 00                                     : bli.
--------------------------------------------------------------------
4169 : __ __ __ BYT 61 6c 74 00                                     : alt.
--------------------------------------------------------------------
plotmove: ; plotmove(u8)->void
.s1000:
416d : a2 06 __ LDX #$06
416f : b5 53 __ LDA T0 + 0,x 
4171 : 9d c0 ab STA $abc0,x ; (projbuffer + 40)
4174 : ca __ __ DEX
4175 : 10 f8 __ BPL $416f ; (plotmove.s1000 + 2)
.s0:
4177 : a9 7f __ LDA #$7f
4179 : 85 0d __ STA P0 
417b : ad 8c 87 LDA $878c ; (screen_col + 0)
417e : 85 53 __ STA T0 + 0 
4180 : 18 __ __ CLC
4181 : 6d cd 87 ADC $87cd ; (canvas + 7)
4184 : 85 54 __ STA T1 + 0 
4186 : ad ce 87 LDA $87ce ; (canvas + 8)
4189 : 6d 8d 87 ADC $878d ; (screen_col + 1)
418c : 85 55 __ STA T1 + 1 
418e : ad 8e 87 LDA $878e ; (screen_row + 0)
4191 : 85 56 __ STA T2 + 0 
4193 : 18 __ __ CLC
4194 : 6d cf 87 ADC $87cf ; (canvas + 9)
4197 : 85 03 __ STA WORK + 0 
4199 : ad d0 87 LDA $87d0 ; (canvas + 10)
419c : 6d 8f 87 ADC $878f ; (screen_row + 1)
419f : 85 04 __ STA WORK + 1 
41a1 : ad c9 87 LDA $87c9 ; (canvas + 3)
41a4 : 85 57 __ STA T4 + 0 
41a6 : 85 1b __ STA ACCU + 0 
41a8 : ad ca 87 LDA $87ca ; (canvas + 4)
41ab : 85 58 __ STA T4 + 1 
41ad : 85 1c __ STA ACCU + 1 
41af : 20 87 7c JSR $7c87 ; (mul16 + 0)
41b2 : 18 __ __ CLC
41b3 : a5 06 __ LDA WORK + 3 
41b5 : 69 58 __ ADC #$58
41b7 : aa __ __ TAX
41b8 : 18 __ __ CLC
41b9 : a5 05 __ LDA WORK + 2 
41bb : 65 54 __ ADC T1 + 0 
41bd : 85 0e __ STA P1 
41bf : 8a __ __ TXA
41c0 : 65 55 __ ADC T1 + 1 
41c2 : 85 0f __ STA P2 
41c4 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
41c7 : 85 59 __ STA T5 + 0 
41c9 : ad cb 87 LDA $87cb ; (canvas + 5)
41cc : 85 1b __ STA ACCU + 0 
41ce : ad cc 87 LDA $87cc ; (canvas + 6)
41d1 : 85 1c __ STA ACCU + 1 
41d3 : a5 57 __ LDA T4 + 0 
41d5 : 85 03 __ STA WORK + 0 
41d7 : a5 58 __ LDA T4 + 1 
41d9 : 85 04 __ STA WORK + 1 
41db : 20 87 7c JSR $7c87 ; (mul16 + 0)
41de : 18 __ __ CLC
41df : a5 05 __ LDA WORK + 2 
41e1 : 65 0e __ ADC P1 
41e3 : a8 __ __ TAY
41e4 : a5 06 __ LDA WORK + 3 
41e6 : 65 0f __ ADC P2 
41e8 : aa __ __ TAX
41e9 : 98 __ __ TYA
41ea : 18 __ __ CLC
41eb : 69 30 __ ADC #$30
41ed : 85 0e __ STA P1 
41ef : 90 01 __ BCC $41f2 ; (plotmove.s1015 + 0)
.s1014:
41f1 : e8 __ __ INX
.s1015:
41f2 : 86 0f __ STX P2 
41f4 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
41f7 : 85 10 __ STA P3 
41f9 : a5 53 __ LDA T0 + 0 
41fb : 85 0d __ STA P0 
41fd : a5 56 __ LDA T2 + 0 
41ff : 85 0e __ STA P1 
4201 : a5 59 __ LDA T5 + 0 
4203 : 85 0f __ STA P2 
4205 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
4208 : ad fc ab LDA $abfc ; (sstack + 9)
420b : c9 91 __ CMP #$91
420d : d0 12 __ BNE $4221 ; (plotmove.s13 + 0)
.s8:
420f : a9 00 __ LDA #$00
4211 : 8d f8 ab STA $abf8 ; (sstack + 5)
4214 : 8d f9 ab STA $abf9 ; (sstack + 6)
4217 : 8d fb ab STA $abfb ; (sstack + 8)
421a : a9 01 __ LDA #$01
421c : 8d fa ab STA $abfa ; (sstack + 7)
421f : d0 16 __ BNE $4237 ; (plotmove.s1012 + 0)
.s13:
4221 : 90 25 __ BCC $4248 ; (plotmove.s15 + 0)
.s14:
4223 : c9 9d __ CMP #$9d
4225 : d0 13 __ BNE $423a ; (plotmove.s1001 + 0)
.s6:
4227 : a9 01 __ LDA #$01
4229 : 8d f8 ab STA $abf8 ; (sstack + 5)
422c : a9 00 __ LDA #$00
422e : 8d f9 ab STA $abf9 ; (sstack + 6)
4231 : 8d fa ab STA $abfa ; (sstack + 7)
.s1013:
4234 : 8d fb ab STA $abfb ; (sstack + 8)
.s1012:
4237 : 20 71 42 JSR $4271 ; (cursormove.s1000 + 0)
.s1001:
423a : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
423d : a2 06 __ LDX #$06
423f : bd c0 ab LDA $abc0,x ; (projbuffer + 40)
4242 : 95 53 __ STA T0 + 0,x 
4244 : ca __ __ DEX
4245 : 10 f8 __ BPL $423f ; (plotmove.s1001 + 5)
4247 : 60 __ __ RTS
.s15:
4248 : c9 11 __ CMP #$11
424a : d0 0f __ BNE $425b ; (plotmove.s16 + 0)
.s9:
424c : a9 00 __ LDA #$00
424e : 8d f8 ab STA $abf8 ; (sstack + 5)
4251 : 8d f9 ab STA $abf9 ; (sstack + 6)
4254 : 8d fa ab STA $abfa ; (sstack + 7)
4257 : a9 01 __ LDA #$01
4259 : d0 d9 __ BNE $4234 ; (plotmove.s1013 + 0)
.s16:
425b : c9 1d __ CMP #$1d
425d : d0 db __ BNE $423a ; (plotmove.s1001 + 0)
.s7:
425f : a9 00 __ LDA #$00
4261 : 8d f8 ab STA $abf8 ; (sstack + 5)
4264 : 8d fa ab STA $abfa ; (sstack + 7)
4267 : 8d fb ab STA $abfb ; (sstack + 8)
426a : a9 01 __ LDA #$01
426c : 8d f9 ab STA $abf9 ; (sstack + 6)
426f : d0 c6 __ BNE $4237 ; (plotmove.s1012 + 0)
--------------------------------------------------------------------
cursormove: ; cursormove(u8,u8,u8,u8)->void
.s1000:
4271 : a2 03 __ LDX #$03
4273 : b5 53 __ LDA T1 + 0,x 
4275 : 9d c9 ab STA $abc9,x ; (buff + 36)
4278 : ca __ __ DEX
4279 : 10 f8 __ BPL $4273 ; (cursormove.s1000 + 2)
.s0:
427b : ad f8 ab LDA $abf8 ; (sstack + 5)
427e : c9 01 __ CMP #$01
4280 : d0 25 __ BNE $42a7 ; (cursormove.s56 + 0)
.s1:
4282 : ad 8c 87 LDA $878c ; (screen_col + 0)
4285 : 0d 8d 87 ORA $878d ; (screen_col + 1)
4288 : d0 03 __ BNE $428d ; (cursormove.s5 + 0)
428a : 4c 25 44 JMP $4425 ; (cursormove.s4 + 0)
.s5:
428d : ad 8c 87 LDA $878c ; (screen_col + 0)
4290 : 18 __ __ CLC
4291 : 69 ff __ ADC #$ff
4293 : 8d 8c 87 STA $878c ; (screen_col + 0)
4296 : b0 03 __ BCS $429b ; (cursormove.s1025 + 0)
.s1024:
4298 : ce 8d 87 DEC $878d ; (screen_col + 1)
.s1025:
429b : ad 8c 87 LDA $878c ; (screen_col + 0)
429e : 8d d5 87 STA $87d5 ; (canvas + 15)
42a1 : ad 8e 87 LDA $878e ; (screen_row + 0)
42a4 : 8d d6 87 STA $87d6 ; (canvas + 16)
.s56:
42a7 : ad f9 ab LDA $abf9 ; (sstack + 6)
42aa : c9 01 __ CMP #$01
42ac : d0 6e __ BNE $431c ; (cursormove.s59 + 0)
.s12:
42ae : ad 8c 87 LDA $878c ; (screen_col + 0)
42b1 : 85 53 __ STA T1 + 0 
42b3 : ad 8d 87 LDA $878d ; (screen_col + 1)
42b6 : 85 54 __ STA T1 + 1 
42b8 : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
42bb : 85 55 __ STA T2 + 0 
42bd : a5 54 __ LDA T1 + 1 
42bf : d0 06 __ BNE $42c7 ; (cursormove.s16 + 0)
.s1016:
42c1 : a5 53 __ LDA T1 + 0 
42c3 : c5 55 __ CMP T2 + 0 
42c5 : f0 1e __ BEQ $42e5 ; (cursormove.s15 + 0)
.s16:
42c7 : 18 __ __ CLC
42c8 : a5 53 __ LDA T1 + 0 
42ca : 69 01 __ ADC #$01
42cc : 8d 8c 87 STA $878c ; (screen_col + 0)
42cf : a5 54 __ LDA T1 + 1 
42d1 : 69 00 __ ADC #$00
42d3 : 8d 8d 87 STA $878d ; (screen_col + 1)
42d6 : ad 8c 87 LDA $878c ; (screen_col + 0)
42d9 : 8d d5 87 STA $87d5 ; (canvas + 15)
42dc : ad 8e 87 LDA $878e ; (screen_row + 0)
42df : 8d d6 87 STA $87d6 ; (canvas + 16)
42e2 : 4c 1c 43 JMP $431c ; (cursormove.s59 + 0)
.s15:
42e5 : 18 __ __ CLC
42e6 : 6d cd 87 ADC $87cd ; (canvas + 7)
42e9 : aa __ __ TAX
42ea : ad ce 87 LDA $87ce ; (canvas + 8)
42ed : 69 00 __ ADC #$00
42ef : a8 __ __ TAY
42f0 : ad c9 87 LDA $87c9 ; (canvas + 3)
42f3 : 38 __ __ SEC
42f4 : e9 01 __ SBC #$01
42f6 : 85 44 __ STA T3 + 0 
42f8 : ad ca 87 LDA $87ca ; (canvas + 4)
42fb : e9 00 __ SBC #$00
42fd : 85 45 __ STA T3 + 1 
42ff : c4 45 __ CPY T3 + 1 
4301 : d0 02 __ BNE $4305 ; (cursormove.s1015 + 0)
.s1014:
4303 : e4 44 __ CPX T3 + 0 
.s1015:
4305 : b0 15 __ BCS $431c ; (cursormove.s59 + 0)
.s18:
4307 : a5 53 __ LDA T1 + 0 
4309 : 8d d5 87 STA $87d5 ; (canvas + 15)
430c : a9 02 __ LDA #$02
430e : 85 18 __ STA P11 
4310 : ad 8e 87 LDA $878e ; (screen_row + 0)
4313 : 8d d6 87 STA $87d6 ; (canvas + 16)
4316 : 20 48 44 JSR $4448 ; (vdcwin_viewportscroll.s0 + 0)
4319 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s59:
431c : ad fa ab LDA $abfa ; (sstack + 7)
431f : c9 01 __ CMP #$01
4321 : d0 43 __ BNE $4366 ; (cursormove.s62 + 0)
.s23:
4323 : ad 8e 87 LDA $878e ; (screen_row + 0)
4326 : 0d 8f 87 ORA $878f ; (screen_row + 1)
4329 : d0 03 __ BNE $432e ; (cursormove.s27 + 0)
432b : 4c 05 44 JMP $4405 ; (cursormove.s26 + 0)
.s27:
432e : ad 8e 87 LDA $878e ; (screen_row + 0)
4331 : 18 __ __ CLC
4332 : 69 ff __ ADC #$ff
4334 : 8d 8e 87 STA $878e ; (screen_row + 0)
4337 : b0 03 __ BCS $433c ; (cursormove.s1023 + 0)
.s1022:
4339 : ce 8f 87 DEC $878f ; (screen_row + 1)
.s1023:
433c : ad 8e 87 LDA $878e ; (screen_row + 0)
433f : 8d d6 87 STA $87d6 ; (canvas + 16)
4342 : ad 8c 87 LDA $878c ; (screen_col + 0)
4345 : 8d d5 87 STA $87d5 ; (canvas + 15)
4348 : ad ff 87 LDA $87ff ; (showbar + 0)
434b : f0 19 __ BEQ $4366 ; (cursormove.s62 + 0)
.s37:
434d : ad b2 87 LDA $87b2 ; (vdc_state + 5)
4350 : 38 __ __ SEC
4351 : e9 02 __ SBC #$02
4353 : a8 __ __ TAY
4354 : ad b3 87 LDA $87b3 ; (vdc_state + 6)
4357 : e9 00 __ SBC #$00
4359 : cd 8f 87 CMP $878f ; (screen_row + 1)
435c : d0 08 __ BNE $4366 ; (cursormove.s62 + 0)
.s1010:
435e : cc 8e 87 CPY $878e ; (screen_row + 0)
4361 : d0 03 __ BNE $4366 ; (cursormove.s62 + 0)
.s75:
4363 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s62:
4366 : ad fb ab LDA $abfb ; (sstack + 8)
4369 : c9 01 __ CMP #$01
436b : f0 03 __ BEQ $4370 ; (cursormove.s38 + 0)
436d : 4c fa 43 JMP $43fa ; (cursormove.s1001 + 0)
.s38:
4370 : ad b2 87 LDA $87b2 ; (vdc_state + 5)
4373 : 38 __ __ SEC
4374 : e9 02 __ SBC #$02
4376 : 85 53 __ STA T1 + 0 
4378 : ad b3 87 LDA $87b3 ; (vdc_state + 6)
437b : e9 00 __ SBC #$00
437d : 85 54 __ STA T1 + 1 
437f : ad 8e 87 LDA $878e ; (screen_row + 0)
4382 : 85 55 __ STA T2 + 0 
4384 : ad 8f 87 LDA $878f ; (screen_row + 1)
4387 : 85 56 __ STA T2 + 1 
4389 : c5 54 __ CMP T1 + 1 
438b : d0 09 __ BNE $4396 ; (cursormove.s64 + 0)
.s1006:
438d : a5 55 __ LDA T2 + 0 
438f : c5 53 __ CMP T1 + 0 
4391 : d0 03 __ BNE $4396 ; (cursormove.s64 + 0)
.s41:
4393 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
.s64:
4396 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
4399 : 85 53 __ STA T1 + 0 
439b : a5 56 __ LDA T2 + 1 
439d : d0 06 __ BNE $43a5 ; (cursormove.s46 + 0)
.s1004:
439f : a5 55 __ LDA T2 + 0 
43a1 : c5 53 __ CMP T1 + 0 
43a3 : f0 1e __ BEQ $43c3 ; (cursormove.s45 + 0)
.s46:
43a5 : 18 __ __ CLC
43a6 : a5 55 __ LDA T2 + 0 
43a8 : 69 01 __ ADC #$01
43aa : 8d 8e 87 STA $878e ; (screen_row + 0)
43ad : a5 56 __ LDA T2 + 1 
43af : 69 00 __ ADC #$00
43b1 : 8d 8f 87 STA $878f ; (screen_row + 1)
43b4 : ad 8e 87 LDA $878e ; (screen_row + 0)
43b7 : 8d d6 87 STA $87d6 ; (canvas + 16)
43ba : ad 8c 87 LDA $878c ; (screen_col + 0)
43bd : 8d d5 87 STA $87d5 ; (canvas + 15)
43c0 : 4c fa 43 JMP $43fa ; (cursormove.s1001 + 0)
.s45:
43c3 : 18 __ __ CLC
43c4 : 6d cf 87 ADC $87cf ; (canvas + 9)
43c7 : aa __ __ TAX
43c8 : ad d0 87 LDA $87d0 ; (canvas + 10)
43cb : 69 00 __ ADC #$00
43cd : a8 __ __ TAY
43ce : ad cb 87 LDA $87cb ; (canvas + 5)
43d1 : 38 __ __ SEC
43d2 : e9 01 __ SBC #$01
43d4 : 85 44 __ STA T3 + 0 
43d6 : ad cc 87 LDA $87cc ; (canvas + 6)
43d9 : e9 00 __ SBC #$00
43db : 85 45 __ STA T3 + 1 
43dd : c4 45 __ CPY T3 + 1 
43df : d0 02 __ BNE $43e3 ; (cursormove.s1003 + 0)
.s1002:
43e1 : e4 44 __ CPX T3 + 0 
.s1003:
43e3 : b0 15 __ BCS $43fa ; (cursormove.s1001 + 0)
.s48:
43e5 : a5 55 __ LDA T2 + 0 
43e7 : 8d d6 87 STA $87d6 ; (canvas + 16)
43ea : a9 04 __ LDA #$04
43ec : 85 18 __ STA P11 
43ee : ad 8c 87 LDA $878c ; (screen_col + 0)
43f1 : 8d d5 87 STA $87d5 ; (canvas + 15)
43f4 : 20 48 44 JSR $4448 ; (vdcwin_viewportscroll.s0 + 0)
43f7 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s1001:
43fa : a2 03 __ LDX #$03
43fc : bd c9 ab LDA $abc9,x ; (buff + 36)
43ff : 95 53 __ STA T1 + 0,x 
4401 : ca __ __ DEX
4402 : 10 f8 __ BPL $43fc ; (cursormove.s1001 + 2)
4404 : 60 __ __ RTS
.s26:
4405 : ad cf 87 LDA $87cf ; (canvas + 9)
4408 : 0d d0 87 ORA $87d0 ; (canvas + 10)
440b : d0 03 __ BNE $4410 ; (cursormove.s29 + 0)
440d : 4c 66 43 JMP $4366 ; (cursormove.s62 + 0)
.s29:
4410 : a9 00 __ LDA #$00
4412 : 8d d6 87 STA $87d6 ; (canvas + 16)
4415 : a9 08 __ LDA #$08
4417 : 85 18 __ STA P11 
4419 : ad 8c 87 LDA $878c ; (screen_col + 0)
441c : 8d d5 87 STA $87d5 ; (canvas + 15)
441f : 20 48 44 JSR $4448 ; (vdcwin_viewportscroll.s0 + 0)
4422 : 4c 63 43 JMP $4363 ; (cursormove.s75 + 0)
.s4:
4425 : ad cd 87 LDA $87cd ; (canvas + 7)
4428 : 0d ce 87 ORA $87ce ; (canvas + 8)
442b : d0 03 __ BNE $4430 ; (cursormove.s7 + 0)
442d : 4c a7 42 JMP $42a7 ; (cursormove.s56 + 0)
.s7:
4430 : a9 00 __ LDA #$00
4432 : 8d d5 87 STA $87d5 ; (canvas + 15)
4435 : a9 01 __ LDA #$01
4437 : 85 18 __ STA P11 
4439 : ad 8e 87 LDA $878e ; (screen_row + 0)
443c : 8d d6 87 STA $87d6 ; (canvas + 16)
443f : 20 48 44 JSR $4448 ; (vdcwin_viewportscroll.s0 + 0)
4442 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
4445 : 4c a7 42 JMP $42a7 ; (cursormove.s56 + 0)
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s0:
4448 : a2 15 __ LDX #$15
.l1002:
444a : bd c5 87 LDA $87c5,x ; (vdc_state + 24)
444d : 9d cc ab STA $abcc,x ; (buff + 39)
4450 : ca __ __ DEX
4451 : d0 f7 __ BNE $444a ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
4453 : a5 18 __ LDA P11 ; (direction + 0)
4455 : 4a __ __ LSR
4456 : 90 2b __ BCC $4483 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
4458 : 20 91 46 JSR $4691 ; (vdcwin_scroll_right@proxy + 0)
445b : a9 01 __ LDA #$01
445d : 85 11 __ STA P4 
445f : ad d4 ab LDA $abd4 ; (buff + 47)
4462 : 18 __ __ CLC
4463 : 69 ff __ ADC #$ff
4465 : 8d d4 ab STA $abd4 ; (buff + 47)
4468 : b0 03 __ BCS $446d ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
446a : ce d5 ab DEC $abd5 ; (buff + 48)
.s1005:
446d : ad cd 87 LDA $87cd ; (canvas + 7)
4470 : 18 __ __ CLC
4471 : 69 ff __ ADC #$ff
4473 : 8d cd 87 STA $87cd ; (canvas + 7)
4476 : b0 03 __ BCS $447b ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
4478 : ce ce 87 DEC $87ce ; (canvas + 8)
.s1007:
447b : ad d4 87 LDA $87d4 ; (canvas + 14)
447e : 85 12 __ STA P5 
4480 : 20 00 31 JSR $3100 ; (vdcwin_init@proxy + 0)
.s14:
4483 : a5 18 __ LDA P11 ; (direction + 0)
4485 : 29 02 __ AND #$02
4487 : f0 3f __ BEQ $44c8 ; (vdcwin_viewportscroll.s15 + 0)
.s4:
4489 : 20 60 48 JSR $4860 ; (vdcwin_scroll_left@proxy + 0)
448c : a9 01 __ LDA #$01
448e : 85 11 __ STA P4 
4490 : ad d4 ab LDA $abd4 ; (buff + 47)
4493 : 18 __ __ CLC
4494 : 6d d3 87 ADC $87d3 ; (canvas + 13)
4497 : 8d d4 ab STA $abd4 ; (buff + 47)
449a : 90 03 __ BCC $449f ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
449c : ee d5 ab INC $abd5 ; (buff + 48)
.s1009:
449f : ee cd 87 INC $87cd ; (canvas + 7)
44a2 : d0 03 __ BNE $44a7 ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
44a4 : ee ce 87 INC $87ce ; (canvas + 8)
.s1011:
44a7 : a9 d8 __ LDA #$d8
44a9 : 85 0d __ STA P0 
44ab : a9 ab __ LDA #$ab
44ad : 85 0e __ STA P1 
44af : ad d1 87 LDA $87d1 ; (canvas + 11)
44b2 : 18 __ __ CLC
44b3 : 6d d3 87 ADC $87d3 ; (canvas + 13)
44b6 : 38 __ __ SEC
44b7 : e9 01 __ SBC #$01
44b9 : 85 0f __ STA P2 
44bb : ad d2 87 LDA $87d2 ; (canvas + 12)
44be : 85 10 __ STA P3 
44c0 : ad d4 87 LDA $87d4 ; (canvas + 14)
44c3 : 85 12 __ STA P5 
44c5 : 20 12 31 JSR $3112 ; (vdcwin_init.s0 + 0)
.s15:
44c8 : a5 18 __ LDA P11 ; (direction + 0)
44ca : 29 08 __ AND #$08
44cc : f0 2b __ BEQ $44f9 ; (vdcwin_viewportscroll.s16 + 0)
.s7:
44ce : 20 5a 49 JSR $495a ; (vdcwin_scroll_down@proxy + 0)
44d1 : a9 01 __ LDA #$01
44d3 : 85 12 __ STA P5 
44d5 : ad d6 ab LDA $abd6 ; (buff + 49)
44d8 : 18 __ __ CLC
44d9 : 69 ff __ ADC #$ff
44db : 8d d6 ab STA $abd6 ; (buff + 49)
44de : b0 03 __ BCS $44e3 ; (vdcwin_viewportscroll.s1013 + 0)
.s1012:
44e0 : ce d7 ab DEC $abd7 ; (vp_fill + 10)
.s1013:
44e3 : ad cf 87 LDA $87cf ; (canvas + 9)
44e6 : 18 __ __ CLC
44e7 : 69 ff __ ADC #$ff
44e9 : 8d cf 87 STA $87cf ; (canvas + 9)
44ec : b0 03 __ BCS $44f1 ; (vdcwin_viewportscroll.s1015 + 0)
.s1014:
44ee : ce d0 87 DEC $87d0 ; (canvas + 10)
.s1015:
44f1 : ad d3 87 LDA $87d3 ; (canvas + 13)
44f4 : 85 11 __ STA P4 
44f6 : 20 00 31 JSR $3100 ; (vdcwin_init@proxy + 0)
.s16:
44f9 : a5 18 __ LDA P11 ; (direction + 0)
44fb : 29 04 __ AND #$04
44fd : f0 3f __ BEQ $453e ; (vdcwin_viewportscroll.s12 + 0)
.s10:
44ff : 20 06 4a JSR $4a06 ; (vdcwin_scroll_up@proxy + 0)
4502 : a9 01 __ LDA #$01
4504 : 85 12 __ STA P5 
4506 : ad d6 ab LDA $abd6 ; (buff + 49)
4509 : 18 __ __ CLC
450a : 6d d4 87 ADC $87d4 ; (canvas + 14)
450d : 8d d6 ab STA $abd6 ; (buff + 49)
4510 : 90 03 __ BCC $4515 ; (vdcwin_viewportscroll.s1017 + 0)
.s1016:
4512 : ee d7 ab INC $abd7 ; (vp_fill + 10)
.s1017:
4515 : ee cf 87 INC $87cf ; (canvas + 9)
4518 : d0 03 __ BNE $451d ; (vdcwin_viewportscroll.s1019 + 0)
.s1018:
451a : ee d0 87 INC $87d0 ; (canvas + 10)
.s1019:
451d : a9 d8 __ LDA #$d8
451f : 85 0d __ STA P0 
4521 : a9 ab __ LDA #$ab
4523 : 85 0e __ STA P1 
4525 : ad d1 87 LDA $87d1 ; (canvas + 11)
4528 : 85 0f __ STA P2 
452a : ad d2 87 LDA $87d2 ; (canvas + 12)
452d : 18 __ __ CLC
452e : 6d d4 87 ADC $87d4 ; (canvas + 14)
4531 : 38 __ __ SEC
4532 : e9 01 __ SBC #$01
4534 : 85 10 __ STA P3 
4536 : ad d3 87 LDA $87d3 ; (canvas + 13)
4539 : 85 11 __ STA P4 
453b : 20 12 31 JSR $3112 ; (vdcwin_init.s0 + 0)
.s12:
453e : a9 cd __ LDA #$cd
4540 : 85 16 __ STA P9 
4542 : a9 ab __ LDA #$ab
4544 : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
4546 : a5 16 __ LDA P9 ; (viewport + 0)
4548 : 85 44 __ STA T0 + 0 
454a : a5 17 __ LDA P10 ; (viewport + 1)
454c : 85 45 __ STA T0 + 1 
454e : a0 09 __ LDY #$09
4550 : b1 16 __ LDA (P9),y ; (viewport + 0)
4552 : 85 1b __ STA ACCU + 0 
4554 : c8 __ __ INY
4555 : b1 16 __ LDA (P9),y ; (viewport + 0)
4557 : 85 1c __ STA ACCU + 1 
4559 : a0 03 __ LDY #$03
455b : b1 16 __ LDA (P9),y ; (viewport + 0)
455d : 85 03 __ STA WORK + 0 
455f : c8 __ __ INY
4560 : b1 16 __ LDA (P9),y ; (viewport + 0)
4562 : 85 04 __ STA WORK + 1 
4564 : 20 87 7c JSR $7c87 ; (mul16 + 0)
4567 : a0 01 __ LDY #$01
4569 : b1 16 __ LDA (P9),y ; (viewport + 0)
456b : 18 __ __ CLC
456c : 65 05 __ ADC WORK + 2 
456e : aa __ __ TAX
456f : c8 __ __ INY
4570 : b1 16 __ LDA (P9),y ; (viewport + 0)
4572 : 65 06 __ ADC WORK + 3 
4574 : 85 47 __ STA T1 + 1 
4576 : 8a __ __ TXA
4577 : 18 __ __ CLC
4578 : a0 07 __ LDY #$07
457a : 71 16 __ ADC (P9),y ; (viewport + 0)
457c : 85 46 __ STA T1 + 0 
457e : a5 47 __ LDA T1 + 1 
4580 : c8 __ __ INY
4581 : 71 16 __ ADC (P9),y ; (viewport + 0)
4583 : 85 47 __ STA T1 + 1 
4585 : a9 00 __ LDA #$00
4587 : 85 4a __ STA T3 + 0 
4589 : a0 11 __ LDY #$11
458b : b1 16 __ LDA (P9),y ; (viewport + 0)
458d : aa __ __ TAX
458e : c8 __ __ INY
458f : b1 16 __ LDA (P9),y ; (viewport + 0)
4591 : 4c cd 45 JMP $45cd ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
4594 : 86 0f __ STX P2 
4596 : a5 46 __ LDA T1 + 0 
4598 : 85 12 __ STA P5 
459a : a5 47 __ LDA T1 + 1 
459c : 85 13 __ STA P6 
459e : a0 00 __ LDY #$00
45a0 : 84 15 __ STY P8 
45a2 : b1 44 __ LDA (T0 + 0),y 
45a4 : 85 11 __ STA P4 
45a6 : a0 0d __ LDY #$0d
45a8 : b1 44 __ LDA (T0 + 0),y 
45aa : 85 14 __ STA P7 
45ac : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
45af : a5 46 __ LDA T1 + 0 
45b1 : 18 __ __ CLC
45b2 : a0 03 __ LDY #$03
45b4 : 71 44 __ ADC (T0 + 0),y 
45b6 : 85 46 __ STA T1 + 0 
45b8 : a5 47 __ LDA T1 + 1 
45ba : c8 __ __ INY
45bb : 71 44 __ ADC (T0 + 0),y 
45bd : 85 47 __ STA T1 + 1 
45bf : ad b0 87 LDA $87b0 ; (vdc_state + 3)
45c2 : 18 __ __ CLC
45c3 : 65 0f __ ADC P2 
45c5 : aa __ __ TAX
45c6 : ad b1 87 LDA $87b1 ; (vdc_state + 4)
45c9 : 65 10 __ ADC P3 
45cb : e6 4a __ INC T3 + 0 
.l1:
45cd : 85 10 __ STA P3 
45cf : a5 4a __ LDA T3 + 0 
45d1 : a0 0e __ LDY #$0e
45d3 : d1 44 __ CMP (T0 + 0),y 
45d5 : 90 bd __ BCC $4594 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
45d7 : a0 03 __ LDY #$03
45d9 : b1 44 __ LDA (T0 + 0),y 
45db : 85 46 __ STA T1 + 0 
45dd : 85 03 __ STA WORK + 0 
45df : c8 __ __ INY
45e0 : b1 44 __ LDA (T0 + 0),y 
45e2 : 85 47 __ STA T1 + 1 
45e4 : 85 04 __ STA WORK + 1 
45e6 : a0 09 __ LDY #$09
45e8 : b1 44 __ LDA (T0 + 0),y 
45ea : 85 1b __ STA ACCU + 0 
45ec : c8 __ __ INY
45ed : b1 44 __ LDA (T0 + 0),y 
45ef : 85 1c __ STA ACCU + 1 
45f1 : 20 87 7c JSR $7c87 ; (mul16 + 0)
45f4 : a0 01 __ LDY #$01
45f6 : b1 44 __ LDA (T0 + 0),y 
45f8 : 18 __ __ CLC
45f9 : 65 05 __ ADC WORK + 2 
45fb : aa __ __ TAX
45fc : c8 __ __ INY
45fd : b1 44 __ LDA (T0 + 0),y 
45ff : 65 06 __ ADC WORK + 3 
4601 : 85 49 __ STA T2 + 1 
4603 : 8a __ __ TXA
4604 : 18 __ __ CLC
4605 : a0 07 __ LDY #$07
4607 : 71 44 __ ADC (T0 + 0),y 
4609 : 85 48 __ STA T2 + 0 
460b : a5 49 __ LDA T2 + 1 
460d : c8 __ __ INY
460e : 71 44 __ ADC (T0 + 0),y 
4610 : 85 49 __ STA T2 + 1 
4612 : a0 05 __ LDY #$05
4614 : b1 44 __ LDA (T0 + 0),y 
4616 : 85 1b __ STA ACCU + 0 
4618 : c8 __ __ INY
4619 : b1 44 __ LDA (T0 + 0),y 
461b : 85 1c __ STA ACCU + 1 
461d : a5 46 __ LDA T1 + 0 
461f : 85 03 __ STA WORK + 0 
4621 : a5 47 __ LDA T1 + 1 
4623 : 85 04 __ STA WORK + 1 
4625 : 20 87 7c JSR $7c87 ; (mul16 + 0)
4628 : 18 __ __ CLC
4629 : a5 48 __ LDA T2 + 0 
462b : 65 05 __ ADC WORK + 2 
462d : aa __ __ TAX
462e : a5 49 __ LDA T2 + 1 
4630 : 65 06 __ ADC WORK + 3 
4632 : a8 __ __ TAY
4633 : 8a __ __ TXA
4634 : 18 __ __ CLC
4635 : 69 30 __ ADC #$30
4637 : 85 46 __ STA T1 + 0 
4639 : 90 01 __ BCC $463c ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
463b : c8 __ __ INY
.s1007:
463c : 84 47 __ STY T1 + 1 
463e : a9 00 __ LDA #$00
4640 : 85 4a __ STA T3 + 0 
4642 : a0 13 __ LDY #$13
4644 : b1 44 __ LDA (T0 + 0),y 
4646 : aa __ __ TAX
4647 : c8 __ __ INY
4648 : b1 44 __ LDA (T0 + 0),y 
464a : 4c 86 46 JMP $4686 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
464d : 86 0f __ STX P2 
464f : a5 46 __ LDA T1 + 0 
4651 : 85 12 __ STA P5 
4653 : a5 47 __ LDA T1 + 1 
4655 : 85 13 __ STA P6 
4657 : a0 00 __ LDY #$00
4659 : 84 15 __ STY P8 
465b : b1 16 __ LDA (P9),y ; (viewport + 0)
465d : 85 11 __ STA P4 
465f : a0 0d __ LDY #$0d
4661 : b1 16 __ LDA (P9),y ; (viewport + 0)
4663 : 85 14 __ STA P7 
4665 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
4668 : a5 46 __ LDA T1 + 0 
466a : 18 __ __ CLC
466b : a0 03 __ LDY #$03
466d : 71 16 __ ADC (P9),y ; (viewport + 0)
466f : 85 46 __ STA T1 + 0 
4671 : a5 47 __ LDA T1 + 1 
4673 : c8 __ __ INY
4674 : 71 16 __ ADC (P9),y ; (viewport + 0)
4676 : 85 47 __ STA T1 + 1 
4678 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
467b : 18 __ __ CLC
467c : 65 0f __ ADC P2 
467e : aa __ __ TAX
467f : ad b1 87 LDA $87b1 ; (vdc_state + 4)
4682 : 65 10 __ ADC P3 
4684 : e6 4a __ INC T3 + 0 
.l5:
4686 : 85 10 __ STA P3 
4688 : a5 4a __ LDA T3 + 0 
468a : a0 0e __ LDY #$0e
468c : d1 16 __ CMP (P9),y ; (viewport + 0)
468e : 90 bd __ BCC $464d ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
4690 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right@proxy: ; vdcwin_scroll_right@proxy
4691 : a9 d1 __ LDA #$d1
4693 : 85 16 __ STA P9 
4695 : a9 87 __ LDA #$87
4697 : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
4699 : a5 53 __ LDA T8 + 0 
469b : 8d ed ab STA $abed ; (palette_draw@stack + 14)
469e : a5 54 __ LDA T8 + 1 
46a0 : 8d ee ab STA $abee ; (palette_draw@stack + 15)
.s0:
46a3 : a0 02 __ LDY #$02
46a5 : b1 16 __ LDA (P9),y ; (win + 0)
46a7 : 38 __ __ SEC
46a8 : e9 01 __ SBC #$01
46aa : 85 47 __ STA T2 + 0 
46ac : a9 00 __ LDA #$00
46ae : 85 46 __ STA T1 + 0 
46b0 : a0 06 __ LDY #$06
46b2 : b1 16 __ LDA (P9),y ; (win + 0)
46b4 : 85 48 __ STA T3 + 0 
46b6 : c8 __ __ INY
46b7 : b1 16 __ LDA (P9),y ; (win + 0)
46b9 : 85 49 __ STA T3 + 1 
46bb : c8 __ __ INY
46bc : b1 16 __ LDA (P9),y ; (win + 0)
46be : 85 4a __ STA T4 + 0 
46c0 : c8 __ __ INY
46c1 : b1 16 __ LDA (P9),y ; (win + 0)
.l1:
46c3 : 85 4b __ STA T4 + 1 
46c5 : a5 46 __ LDA T1 + 0 
46c7 : a0 03 __ LDY #$03
46c9 : d1 16 __ CMP (P9),y ; (win + 0)
46cb : 90 0b __ BCC $46d8 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
46cd : ad ed ab LDA $abed ; (palette_draw@stack + 14)
46d0 : 85 53 __ STA T8 + 0 
46d2 : ad ee ab LDA $abee ; (palette_draw@stack + 15)
46d5 : 85 54 __ STA T8 + 1 
46d7 : 60 __ __ RTS
.s2:
46d8 : a5 48 __ LDA T3 + 0 
46da : 69 01 __ ADC #$01
46dc : 85 4c __ STA T6 + 0 
46de : a5 49 __ LDA T3 + 1 
46e0 : 69 00 __ ADC #$00
46e2 : 85 4d __ STA T6 + 1 
46e4 : 18 __ __ CLC
46e5 : a5 4a __ LDA T4 + 0 
46e7 : 69 01 __ ADC #$01
46e9 : 85 4e __ STA T7 + 0 
46eb : a5 4b __ LDA T4 + 1 
46ed : 69 00 __ ADC #$00
46ef : 85 4f __ STA T7 + 1 
46f1 : ad ae 87 LDA $87ae ; (vdc_state + 1)
46f4 : d0 0c __ BNE $4702 ; (vdcwin_scroll_right.s7 + 0)
.s9:
46f6 : cc ba 87 CPY $87ba ; (vdc_state + 13)
46f9 : d0 05 __ BNE $4700 ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
46fb : a9 ff __ LDA #$ff
46fd : cd b9 87 CMP $87b9 ; (vdc_state + 12)
.s1003:
4700 : 90 45 __ BCC $4747 ; (vdcwin_scroll_right.s6 + 0)
.s7:
4702 : a5 48 __ LDA T3 + 0 
4704 : 85 11 __ STA P4 
4706 : a5 49 __ LDA T3 + 1 
4708 : 85 12 __ STA P5 
470a : ad b9 87 LDA $87b9 ; (vdc_state + 12)
470d : 85 53 __ STA T8 + 0 
470f : 85 0f __ STA P2 
4711 : ad ba 87 LDA $87ba ; (vdc_state + 13)
4714 : 85 54 __ STA T8 + 1 
4716 : 85 10 __ STA P3 
4718 : 20 94 47 JSR $4794 ; (vdc_block_copy@proxy + 0)
471b : a5 4c __ LDA T6 + 0 
471d : 85 0f __ STA P2 
471f : a5 4d __ LDA T6 + 1 
4721 : 85 10 __ STA P3 
4723 : 20 c8 80 JSR $80c8 ; (vdc_block_copy@proxy + 0)
4726 : a5 11 __ LDA P4 
4728 : 85 0f __ STA P2 
472a : a5 54 __ LDA T8 + 1 
472c : 85 10 __ STA P3 
472e : a5 4a __ LDA T4 + 0 
4730 : 85 11 __ STA P4 
4732 : a5 4b __ LDA T4 + 1 
4734 : 85 12 __ STA P5 
4736 : 20 9c 47 JSR $479c ; (vdc_block_copy.s0 + 0)
4739 : a5 4e __ LDA T7 + 0 
473b : 85 0f __ STA P2 
473d : a5 4f __ LDA T7 + 1 
473f : 85 10 __ STA P3 
4741 : 20 c8 80 JSR $80c8 ; (vdc_block_copy@proxy + 0)
4744 : 4c 73 47 JMP $4773 ; (vdcwin_scroll_right.s5 + 0)
.s6:
4747 : a5 48 __ LDA T3 + 0 
4749 : 85 10 __ STA P3 
474b : a5 49 __ LDA T3 + 1 
474d : 85 11 __ STA P4 
474f : 20 fc 13 JSR $13fc ; (bnk_cpyfromvdc@proxy + 0)
4752 : a5 4c __ LDA T6 + 0 
4754 : 85 0f __ STA P2 
4756 : a5 4d __ LDA T6 + 1 
4758 : 85 10 __ STA P3 
475a : 20 a1 13 JSR $13a1 ; (bnk_cpytovdc@proxy + 0)
475d : a5 4a __ LDA T4 + 0 
475f : 85 10 __ STA P3 
4761 : a5 4b __ LDA T4 + 1 
4763 : 85 11 __ STA P4 
4765 : 20 52 1a JSR $1a52 ; (bnk_cpyfromvdc@proxy + 0)
4768 : a5 4e __ LDA T7 + 0 
476a : 85 0f __ STA P2 
476c : a5 4f __ LDA T7 + 1 
476e : 85 10 __ STA P3 
4770 : 20 38 1a JSR $1a38 ; (bnk_cpytovdc@proxy + 0)
.s5:
4773 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
4776 : 18 __ __ CLC
4777 : 65 48 __ ADC T3 + 0 
4779 : 85 48 __ STA T3 + 0 
477b : ad b1 87 LDA $87b1 ; (vdc_state + 4)
477e : 65 49 __ ADC T3 + 1 
4780 : 85 49 __ STA T3 + 1 
4782 : 18 __ __ CLC
4783 : a5 4a __ LDA T4 + 0 
4785 : 6d b0 87 ADC $87b0 ; (vdc_state + 3)
4788 : 85 4a __ STA T4 + 0 
478a : a5 4b __ LDA T4 + 1 
478c : 6d b1 87 ADC $87b1 ; (vdc_state + 4)
478f : e6 46 __ INC T1 + 0 
4791 : 4c c3 46 JMP $46c3 ; (vdcwin_scroll_right.l1 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
4794 : a5 47 __ LDA $47 
4796 : 85 13 __ STA P6 
4798 : a9 00 __ LDA #$00
479a : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
479c : a5 14 __ LDA P7 ; (length + 1)
479e : d0 52 __ BNE $47f2 ; (vdc_block_copy.s73 + 0)
.s4:
47a0 : 20 79 2d JSR $2d79 ; (vdc_mem_addr@proxy + 0)
47a3 : a9 18 __ LDA #$18
47a5 : 8d 00 d6 STA $d600 
.l332:
47a8 : 2c 00 d6 BIT $d600 
47ab : 10 fb __ BPL $47a8 ; (vdc_block_copy.l332 + 0)
.s40:
47ad : ad 01 d6 LDA $d601 
47b0 : 09 80 __ ORA #$80
47b2 : a2 18 __ LDX #$18
47b4 : 8e 00 d6 STX $d600 
.l334:
47b7 : 2c 00 d6 BIT $d600 
47ba : 10 fb __ BPL $47b7 ; (vdc_block_copy.l334 + 0)
.s46:
47bc : 8d 01 d6 STA $d601 
47bf : a9 20 __ LDA #$20
47c1 : 8d 00 d6 STA $d600 
.l336:
47c4 : 2c 00 d6 BIT $d600 
47c7 : 10 fb __ BPL $47c4 ; (vdc_block_copy.l336 + 0)
.s51:
47c9 : a5 12 __ LDA P5 ; (src + 1)
47cb : 8d 01 d6 STA $d601 
47ce : a9 21 __ LDA #$21
47d0 : 8d 00 d6 STA $d600 
.l338:
47d3 : 2c 00 d6 BIT $d600 
47d6 : 10 fb __ BPL $47d3 ; (vdc_block_copy.l338 + 0)
.s56:
47d8 : a5 11 __ LDA P4 ; (src + 0)
47da : 8d 01 d6 STA $d601 
47dd : a9 1f __ LDA #$1f
47df : 8d 00 d6 STA $d600 
47e2 : a9 1e __ LDA #$1e
47e4 : 8d 00 d6 STA $d600 
.l340:
47e7 : 2c 00 d6 BIT $d600 
47ea : 10 fb __ BPL $47e7 ; (vdc_block_copy.l340 + 0)
.s62:
47ec : a5 13 __ LDA P6 ; (length + 0)
47ee : 8d 01 d6 STA $d601 
.s1001:
47f1 : 60 __ __ RTS
.s73:
47f2 : 85 45 __ STA T2 + 0 
47f4 : a5 10 __ LDA P3 ; (dest + 1)
47f6 : 85 44 __ STA T0 + 1 
47f8 : a5 0f __ LDA P2 ; (dest + 0)
47fa : 85 0d __ STA P0 
.l2:
47fc : 20 09 82 JSR $8209 ; (vdc_mem_addr@proxy + 0)
47ff : a9 18 __ LDA #$18
4801 : 8d 00 d6 STA $d600 
.l321:
4804 : 2c 00 d6 BIT $d600 
4807 : 10 fb __ BPL $4804 ; (vdc_block_copy.l321 + 0)
.s11:
4809 : ad 01 d6 LDA $d601 
480c : 09 80 __ ORA #$80
480e : a2 18 __ LDX #$18
4810 : 8e 00 d6 STX $d600 
.l323:
4813 : 2c 00 d6 BIT $d600 
4816 : 10 fb __ BPL $4813 ; (vdc_block_copy.l323 + 0)
.s17:
4818 : 8d 01 d6 STA $d601 
481b : a9 20 __ LDA #$20
481d : 8d 00 d6 STA $d600 
.l325:
4820 : 2c 00 d6 BIT $d600 
4823 : 10 fb __ BPL $4820 ; (vdc_block_copy.l325 + 0)
.s22:
4825 : a5 12 __ LDA P5 ; (src + 1)
4827 : 8d 01 d6 STA $d601 
482a : a9 21 __ LDA #$21
482c : 8d 00 d6 STA $d600 
.l327:
482f : 2c 00 d6 BIT $d600 
4832 : 10 fb __ BPL $482f ; (vdc_block_copy.l327 + 0)
.s27:
4834 : a5 11 __ LDA P4 ; (src + 0)
4836 : 8d 01 d6 STA $d601 
4839 : a9 1f __ LDA #$1f
483b : 8d 00 d6 STA $d600 
483e : a9 1e __ LDA #$1e
4840 : 8d 00 d6 STA $d600 
.l329:
4843 : 2c 00 d6 BIT $d600 
4846 : 10 fb __ BPL $4843 ; (vdc_block_copy.l329 + 0)
.s33:
4848 : a9 ff __ LDA #$ff
484a : 8d 01 d6 STA $d601 
484d : e6 12 __ INC P5 ; (src + 1)
484f : e6 44 __ INC T0 + 1 
4851 : c6 45 __ DEC T2 + 0 
4853 : d0 a7 __ BNE $47fc ; (vdc_block_copy.l2 + 0)
.s145:
4855 : a5 0d __ LDA P0 
4857 : 85 0f __ STA P2 ; (dest + 0)
4859 : a5 44 __ LDA T0 + 1 
485b : 85 10 __ STA P3 ; (dest + 1)
485d : 4c a0 47 JMP $47a0 ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left@proxy: ; vdcwin_scroll_left@proxy
4860 : a9 d1 __ LDA #$d1
4862 : 85 16 __ STA P9 
4864 : a9 87 __ LDA #$87
4866 : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
4868 : a0 02 __ LDY #$02
486a : b1 16 __ LDA (P9),y ; (win + 0)
486c : 38 __ __ SEC
486d : e9 01 __ SBC #$01
486f : 85 47 __ STA T2 + 0 
4871 : a0 06 __ LDY #$06
4873 : b1 16 __ LDA (P9),y ; (win + 0)
4875 : 85 48 __ STA T3 + 0 
4877 : c8 __ __ INY
4878 : b1 16 __ LDA (P9),y ; (win + 0)
487a : 85 49 __ STA T3 + 1 
487c : c8 __ __ INY
487d : b1 16 __ LDA (P9),y ; (win + 0)
487f : 85 4a __ STA T4 + 0 
4881 : c8 __ __ INY
4882 : b1 16 __ LDA (P9),y ; (win + 0)
4884 : 85 4b __ STA T4 + 1 
.l62:
4886 : ad 00 d6 LDA $d600 
4889 : 29 20 __ AND #$20
488b : f0 f9 __ BEQ $4886 ; (vdcwin_scroll_left.l62 + 0)
.s1:
488d : a9 00 __ LDA #$00
488f : 85 46 __ STA T1 + 0 
.l4:
4891 : a0 03 __ LDY #$03
4893 : d1 16 __ CMP (P9),y ; (win + 0)
4895 : 90 08 __ BCC $489f ; (vdcwin_scroll_left.s5 + 0)
.l14:
4897 : ad 00 d6 LDA $d600 
489a : 29 20 __ AND #$20
489c : d0 f9 __ BNE $4897 ; (vdcwin_scroll_left.l14 + 0)
.s1001:
489e : 60 __ __ RTS
.s5:
489f : a5 48 __ LDA T3 + 0 
48a1 : 69 01 __ ADC #$01
48a3 : aa __ __ TAX
48a4 : a5 49 __ LDA T3 + 1 
48a6 : 69 00 __ ADC #$00
48a8 : 85 4d __ STA T5 + 1 
48aa : 18 __ __ CLC
48ab : a5 4a __ LDA T4 + 0 
48ad : 69 01 __ ADC #$01
48af : 85 4e __ STA T7 + 0 
48b1 : a5 4b __ LDA T4 + 1 
48b3 : 69 00 __ ADC #$00
48b5 : 85 4f __ STA T7 + 1 
48b7 : ad ae 87 LDA $87ae ; (vdc_state + 1)
48ba : d0 0c __ BNE $48c8 ; (vdcwin_scroll_left.s10 + 0)
.s12:
48bc : cc ba 87 CPY $87ba ; (vdc_state + 13)
48bf : d0 05 __ BNE $48c6 ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
48c1 : a9 ff __ LDA #$ff
48c3 : cd b9 87 CMP $87b9 ; (vdc_state + 12)
.s1003:
48c6 : 90 43 __ BCC $490b ; (vdcwin_scroll_left.s9 + 0)
.s10:
48c8 : 86 11 __ STX P4 
48ca : a5 4d __ LDA T5 + 1 
48cc : 85 12 __ STA P5 
48ce : ad b9 87 LDA $87b9 ; (vdc_state + 12)
48d1 : 85 4c __ STA T5 + 0 
48d3 : 85 0f __ STA P2 
48d5 : ad ba 87 LDA $87ba ; (vdc_state + 13)
48d8 : 85 4d __ STA T5 + 1 
48da : 85 10 __ STA P3 
48dc : 20 94 47 JSR $4794 ; (vdc_block_copy@proxy + 0)
48df : a5 48 __ LDA T3 + 0 
48e1 : 85 0f __ STA P2 
48e3 : a5 49 __ LDA T3 + 1 
48e5 : 85 10 __ STA P3 
48e7 : 20 bd 80 JSR $80bd ; (vdc_block_copy@proxy + 0)
48ea : a5 11 __ LDA P4 
48ec : 85 0f __ STA P2 
48ee : a5 4d __ LDA T5 + 1 
48f0 : 85 10 __ STA P3 
48f2 : a5 4e __ LDA T7 + 0 
48f4 : 85 11 __ STA P4 
48f6 : a5 4f __ LDA T7 + 1 
48f8 : 85 12 __ STA P5 
48fa : 20 9c 47 JSR $479c ; (vdc_block_copy.s0 + 0)
48fd : a5 4a __ LDA T4 + 0 
48ff : 85 0f __ STA P2 
4901 : a5 4b __ LDA T4 + 1 
4903 : 85 10 __ STA P3 
4905 : 20 bd 80 JSR $80bd ; (vdc_block_copy@proxy + 0)
4908 : 4c 35 49 JMP $4935 ; (vdcwin_scroll_left.s8 + 0)
.s9:
490b : 86 10 __ STX P3 
490d : a5 4d __ LDA T5 + 1 
490f : 85 11 __ STA P4 
4911 : 20 fc 13 JSR $13fc ; (bnk_cpyfromvdc@proxy + 0)
4914 : a5 48 __ LDA T3 + 0 
4916 : 85 0f __ STA P2 
4918 : a5 49 __ LDA T3 + 1 
491a : 85 10 __ STA P3 
491c : 20 a1 13 JSR $13a1 ; (bnk_cpytovdc@proxy + 0)
491f : a5 4e __ LDA T7 + 0 
4921 : 85 10 __ STA P3 
4923 : a5 4f __ LDA T7 + 1 
4925 : 85 11 __ STA P4 
4927 : 20 52 1a JSR $1a52 ; (bnk_cpyfromvdc@proxy + 0)
492a : a5 4a __ LDA T4 + 0 
492c : 85 0f __ STA P2 
492e : a5 4b __ LDA T4 + 1 
4930 : 85 10 __ STA P3 
4932 : 20 38 1a JSR $1a38 ; (bnk_cpytovdc@proxy + 0)
.s8:
4935 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
4938 : 18 __ __ CLC
4939 : 65 48 __ ADC T3 + 0 
493b : 85 48 __ STA T3 + 0 
493d : ad b1 87 LDA $87b1 ; (vdc_state + 4)
4940 : 65 49 __ ADC T3 + 1 
4942 : 85 49 __ STA T3 + 1 
4944 : 18 __ __ CLC
4945 : a5 4a __ LDA T4 + 0 
4947 : 6d b0 87 ADC $87b0 ; (vdc_state + 3)
494a : 85 4a __ STA T4 + 0 
494c : a5 4b __ LDA T4 + 1 
494e : 6d b1 87 ADC $87b1 ; (vdc_state + 4)
4951 : 85 4b __ STA T4 + 1 
4953 : e6 46 __ INC T1 + 0 
4955 : a5 46 __ LDA T1 + 0 
4957 : 4c 91 48 JMP $4891 ; (vdcwin_scroll_left.l4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down@proxy: ; vdcwin_scroll_down@proxy
495a : a9 d1 __ LDA #$d1
495c : 85 15 __ STA P8 
495e : a9 87 __ LDA #$87
4960 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
4962 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
4965 : 85 49 __ STA T3 + 0 
4967 : 85 1b __ STA ACCU + 0 
4969 : ad b1 87 LDA $87b1 ; (vdc_state + 4)
496c : 85 4a __ STA T3 + 1 
496e : 85 1c __ STA ACCU + 1 
4970 : a0 03 __ LDY #$03
4972 : b1 15 __ LDA (P8),y ; (win + 0)
4974 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
4977 : a0 06 __ LDY #$06
4979 : b1 15 __ LDA (P8),y ; (win + 0)
497b : 18 __ __ CLC
497c : 65 05 __ ADC WORK + 2 
497e : 85 4b __ STA T4 + 0 
4980 : c8 __ __ INY
4981 : b1 15 __ LDA (P8),y ; (win + 0)
4983 : 65 06 __ ADC WORK + 3 
4985 : 85 4c __ STA T4 + 1 
4987 : c8 __ __ INY
4988 : b1 15 __ LDA (P8),y ; (win + 0)
498a : 18 __ __ CLC
498b : 65 05 __ ADC WORK + 2 
498d : 85 47 __ STA T2 + 0 
498f : c8 __ __ INY
4990 : b1 15 __ LDA (P8),y ; (win + 0)
4992 : 65 06 __ ADC WORK + 3 
4994 : 85 48 __ STA T2 + 1 
4996 : a0 02 __ LDY #$02
4998 : b1 15 __ LDA (P8),y ; (win + 0)
499a : 85 4f __ STA T6 + 0 
499c : a9 00 __ LDA #$00
499e : 85 46 __ STA T1 + 0 
49a0 : 85 14 __ STA P7 
49a2 : f0 52 __ BEQ $49f6 ; (vdcwin_scroll_down.l1 + 0)
.s2:
49a4 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
49a7 : 85 4d __ STA T5 + 0 
49a9 : ad b1 87 LDA $87b1 ; (vdc_state + 4)
49ac : 85 4e __ STA T5 + 1 
49ae : 38 __ __ SEC
49af : a5 4b __ LDA T4 + 0 
49b1 : e5 4d __ SBC T5 + 0 
49b3 : 85 0f __ STA P2 
49b5 : 85 4b __ STA T4 + 0 
49b7 : a5 4c __ LDA T4 + 1 
49b9 : e5 4e __ SBC T5 + 1 
49bb : 85 10 __ STA P3 
49bd : 85 4c __ STA T4 + 1 
49bf : 38 __ __ SEC
49c0 : a5 0f __ LDA P2 
49c2 : e5 49 __ SBC T3 + 0 
49c4 : 85 11 __ STA P4 
49c6 : a5 10 __ LDA P3 
49c8 : e5 4a __ SBC T3 + 1 
49ca : 85 12 __ STA P5 
49cc : a5 4f __ LDA T6 + 0 
49ce : 85 13 __ STA P6 
49d0 : 20 9c 47 JSR $479c ; (vdc_block_copy.s0 + 0)
49d3 : 38 __ __ SEC
49d4 : a5 47 __ LDA T2 + 0 
49d6 : e5 4d __ SBC T5 + 0 
49d8 : 85 47 __ STA T2 + 0 
49da : 85 0f __ STA P2 
49dc : a5 48 __ LDA T2 + 1 
49de : e5 4e __ SBC T5 + 1 
49e0 : 85 48 __ STA T2 + 1 
49e2 : 85 10 __ STA P3 
49e4 : 38 __ __ SEC
49e5 : a5 0f __ LDA P2 
49e7 : e5 49 __ SBC T3 + 0 
49e9 : 85 11 __ STA P4 
49eb : a5 10 __ LDA P3 
49ed : e5 4a __ SBC T3 + 1 
49ef : 85 12 __ STA P5 
49f1 : 20 9c 47 JSR $479c ; (vdc_block_copy.s0 + 0)
49f4 : e6 46 __ INC T1 + 0 
.l1:
49f6 : a0 03 __ LDY #$03
49f8 : b1 15 __ LDA (P8),y ; (win + 0)
49fa : 38 __ __ SEC
49fb : e9 01 __ SBC #$01
49fd : 90 a5 __ BCC $49a4 ; (vdcwin_scroll_down.s2 + 0)
.s1002:
49ff : c5 46 __ CMP T1 + 0 
4a01 : 90 02 __ BCC $4a05 ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
4a03 : d0 9f __ BNE $49a4 ; (vdcwin_scroll_down.s2 + 0)
.s1001:
4a05 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up@proxy: ; vdcwin_scroll_up@proxy
4a06 : a9 d1 __ LDA #$d1
4a08 : 85 15 __ STA P8 
4a0a : a9 87 __ LDA #$87
4a0c : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
4a0e : a0 02 __ LDY #$02
4a10 : b1 15 __ LDA (P8),y ; (win + 0)
4a12 : 85 47 __ STA T2 + 0 
4a14 : a0 06 __ LDY #$06
4a16 : b1 15 __ LDA (P8),y ; (win + 0)
4a18 : 85 48 __ STA T3 + 0 
4a1a : c8 __ __ INY
4a1b : b1 15 __ LDA (P8),y ; (win + 0)
4a1d : 85 49 __ STA T3 + 1 
4a1f : c8 __ __ INY
4a20 : b1 15 __ LDA (P8),y ; (win + 0)
4a22 : 85 4a __ STA T4 + 0 
4a24 : c8 __ __ INY
4a25 : b1 15 __ LDA (P8),y ; (win + 0)
4a27 : 85 4b __ STA T4 + 1 
4a29 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
4a2c : 85 4c __ STA T5 + 0 
4a2e : ad b1 87 LDA $87b1 ; (vdc_state + 4)
4a31 : 85 4d __ STA T5 + 1 
4a33 : a9 00 __ LDA #$00
4a35 : 85 46 __ STA T0 + 0 
4a37 : 85 14 __ STA P7 
4a39 : f0 4c __ BEQ $4a87 ; (vdcwin_scroll_up.l1 + 0)
.s2:
4a3b : a5 48 __ LDA T3 + 0 
4a3d : 85 0f __ STA P2 
4a3f : 18 __ __ CLC
4a40 : 65 4c __ ADC T5 + 0 
4a42 : 85 11 __ STA P4 
4a44 : a5 49 __ LDA T3 + 1 
4a46 : 85 10 __ STA P3 
4a48 : 65 4d __ ADC T5 + 1 
4a4a : 85 12 __ STA P5 
4a4c : a5 47 __ LDA T2 + 0 
4a4e : 85 13 __ STA P6 
4a50 : 20 9c 47 JSR $479c ; (vdc_block_copy.s0 + 0)
4a53 : a5 4a __ LDA T4 + 0 
4a55 : 85 0f __ STA P2 
4a57 : 18 __ __ CLC
4a58 : 65 4c __ ADC T5 + 0 
4a5a : 85 11 __ STA P4 
4a5c : a5 4b __ LDA T4 + 1 
4a5e : 85 10 __ STA P3 
4a60 : 65 4d __ ADC T5 + 1 
4a62 : 85 12 __ STA P5 
4a64 : 20 9c 47 JSR $479c ; (vdc_block_copy.s0 + 0)
4a67 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
4a6a : 18 __ __ CLC
4a6b : 65 48 __ ADC T3 + 0 
4a6d : 85 48 __ STA T3 + 0 
4a6f : ad b1 87 LDA $87b1 ; (vdc_state + 4)
4a72 : 65 49 __ ADC T3 + 1 
4a74 : 85 49 __ STA T3 + 1 
4a76 : 18 __ __ CLC
4a77 : a5 4a __ LDA T4 + 0 
4a79 : 6d b0 87 ADC $87b0 ; (vdc_state + 3)
4a7c : 85 4a __ STA T4 + 0 
4a7e : a5 4b __ LDA T4 + 1 
4a80 : 6d b1 87 ADC $87b1 ; (vdc_state + 4)
4a83 : 85 4b __ STA T4 + 1 
4a85 : e6 46 __ INC T0 + 0 
.l1:
4a87 : a0 03 __ LDY #$03
4a89 : b1 15 __ LDA (P8),y ; (win + 0)
4a8b : 38 __ __ SEC
4a8c : e9 01 __ SBC #$01
4a8e : 90 ab __ BCC $4a3b ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4a90 : c5 46 __ CMP T0 + 0 
4a92 : 90 02 __ BCC $4a96 ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
4a94 : d0 a5 __ BNE $4a3b ; (vdcwin_scroll_up.s2 + 0)
.s1001:
4a96 : 60 __ __ RTS
--------------------------------------------------------------------
loadoverlay: ; loadoverlay(u8)->void
.s1000:
4a97 : 38 __ __ SEC
4a98 : a5 23 __ LDA SP + 0 
4a9a : e9 08 __ SBC #$08
4a9c : 85 23 __ STA SP + 0 
4a9e : b0 02 __ BCS $4aa2 ; (loadoverlay.s0 + 0)
4aa0 : c6 24 __ DEC SP + 1 
.s0:
4aa2 : ad fa ab LDA $abfa ; (sstack + 7)
4aa5 : cd b7 88 CMP $88b7 ; (overlay_active + 0)
4aa8 : f0 65 __ BEQ $4b0f ; (loadoverlay.s1001 + 0)
.s1:
4aaa : 8d b7 88 STA $88b7 ; (overlay_active + 0)
4aad : 85 4e __ STA T2 + 0 
4aaf : aa __ __ TAX
4ab0 : bc 65 80 LDY $8065,x ; (__multab3L + 0)
4ab3 : b9 df 87 LDA $87df,y ; (undonumber + 0)
4ab6 : d0 33 __ BNE $4aeb ; (loadoverlay.s4 + 0)
.s5:
4ab8 : a5 4e __ LDA T2 + 0 
4aba : a0 06 __ LDY #$06
4abc : 91 23 __ STA (SP + 0),y 
4abe : a9 00 __ LDA #$00
4ac0 : c8 __ __ INY
4ac1 : 91 23 __ STA (SP + 0),y 
4ac3 : a9 51 __ LDA #$51
4ac5 : a0 02 __ LDY #$02
4ac7 : 91 23 __ STA (SP + 0),y 
4ac9 : a9 89 __ LDA #$89
4acb : c8 __ __ INY
4acc : 91 23 __ STA (SP + 0),y 
4ace : a9 a2 __ LDA #$a2
4ad0 : c8 __ __ INY
4ad1 : 91 23 __ STA (SP + 0),y 
4ad3 : a9 3c __ LDA #$3c
4ad5 : c8 __ __ INY
4ad6 : 91 23 __ STA (SP + 0),y 
4ad8 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
4adb : a9 51 __ LDA #$51
4add : 8d f8 ab STA $abf8 ; (sstack + 5)
4ae0 : a9 89 __ LDA #$89
4ae2 : 8d f9 ab STA $abf9 ; (sstack + 6)
4ae5 : 20 49 2a JSR $2a49 ; (load_overlay.s1000 + 0)
4ae8 : 4c 0f 4b JMP $4b0f ; (loadoverlay.s1001 + 0)
.s4:
4aeb : a9 0e __ LDA #$0e
4aed : 85 0d __ STA P0 
4aef : b9 df 87 LDA $87df,y ; (undonumber + 0)
4af2 : 85 10 __ STA P3 
4af4 : a9 14 __ LDA #$14
4af6 : 85 14 __ STA P7 
4af8 : b9 e0 87 LDA $87e0,y ; (undo_undopossible + 0)
4afb : 85 11 __ STA P4 
4afd : b9 e1 87 LDA $87e1,y ; (undo_redopossible + 0)
4b00 : 85 12 __ STA P5 
4b02 : a9 00 __ LDA #$00
4b04 : 85 13 __ STA P6 
4b06 : 85 0e __ STA P1 
4b08 : a9 ac __ LDA #$ac
4b0a : 85 0f __ STA P2 
4b0c : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
.s1001:
4b0f : 18 __ __ CLC
4b10 : a5 23 __ LDA SP + 0 
4b12 : 69 08 __ ADC #$08
4b14 : 85 23 __ STA SP + 0 
4b16 : 90 02 __ BCC $4b1a ; (loadoverlay.s1001 + 11)
4b18 : e6 24 __ INC SP + 1 
4b1a : 60 __ __ RTS
--------------------------------------------------------------------
hidecursor: ; hidecursor()->void
.s0:
4b1b : a9 7f __ LDA #$7f
4b1d : 85 0d __ STA P0 
4b1f : ad 8c 87 LDA $878c ; (screen_col + 0)
4b22 : 85 43 __ STA T0 + 0 
4b24 : 18 __ __ CLC
4b25 : 6d cd 87 ADC $87cd ; (canvas + 7)
4b28 : 85 44 __ STA T1 + 0 
4b2a : ad ce 87 LDA $87ce ; (canvas + 8)
4b2d : 6d 8d 87 ADC $878d ; (screen_col + 1)
4b30 : 85 45 __ STA T1 + 1 
4b32 : ad 8e 87 LDA $878e ; (screen_row + 0)
4b35 : 85 46 __ STA T2 + 0 
4b37 : 18 __ __ CLC
4b38 : 6d cf 87 ADC $87cf ; (canvas + 9)
4b3b : 85 03 __ STA WORK + 0 
4b3d : ad d0 87 LDA $87d0 ; (canvas + 10)
4b40 : 6d 8f 87 ADC $878f ; (screen_row + 1)
4b43 : 85 04 __ STA WORK + 1 
4b45 : ad c9 87 LDA $87c9 ; (canvas + 3)
4b48 : 85 47 __ STA T4 + 0 
4b4a : 85 1b __ STA ACCU + 0 
4b4c : ad ca 87 LDA $87ca ; (canvas + 4)
4b4f : 85 48 __ STA T4 + 1 
4b51 : 85 1c __ STA ACCU + 1 
4b53 : 20 87 7c JSR $7c87 ; (mul16 + 0)
4b56 : 18 __ __ CLC
4b57 : a5 06 __ LDA WORK + 3 
4b59 : 69 58 __ ADC #$58
4b5b : aa __ __ TAX
4b5c : 18 __ __ CLC
4b5d : a5 05 __ LDA WORK + 2 
4b5f : 65 44 __ ADC T1 + 0 
4b61 : 85 0e __ STA P1 
4b63 : 8a __ __ TXA
4b64 : 65 45 __ ADC T1 + 1 
4b66 : 85 0f __ STA P2 
4b68 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
4b6b : 85 49 __ STA T5 + 0 
4b6d : ad cb 87 LDA $87cb ; (canvas + 5)
4b70 : 85 1b __ STA ACCU + 0 
4b72 : ad cc 87 LDA $87cc ; (canvas + 6)
4b75 : 85 1c __ STA ACCU + 1 
4b77 : a5 47 __ LDA T4 + 0 
4b79 : 85 03 __ STA WORK + 0 
4b7b : a5 48 __ LDA T4 + 1 
4b7d : 85 04 __ STA WORK + 1 
4b7f : 20 87 7c JSR $7c87 ; (mul16 + 0)
4b82 : 18 __ __ CLC
4b83 : a5 05 __ LDA WORK + 2 
4b85 : 65 0e __ ADC P1 
4b87 : a8 __ __ TAY
4b88 : a5 06 __ LDA WORK + 3 
4b8a : 65 0f __ ADC P2 
4b8c : aa __ __ TAX
4b8d : 98 __ __ TYA
4b8e : 18 __ __ CLC
4b8f : 69 30 __ ADC #$30
4b91 : 85 0e __ STA P1 
4b93 : 90 01 __ BCC $4b96 ; (hidecursor.s1003 + 0)
.s1002:
4b95 : e8 __ __ INX
.s1003:
4b96 : 86 0f __ STX P2 
4b98 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
4b9b : 85 10 __ STA P3 
4b9d : a5 43 __ LDA T0 + 0 
4b9f : 85 0d __ STA P0 
4ba1 : a5 46 __ LDA T2 + 0 
4ba3 : 85 0e __ STA P1 
4ba5 : a5 49 __ LDA T5 + 0 
4ba7 : 85 0f __ STA P2 
4ba9 : 4c fc 34 JMP $34fc ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
chooseidandfilename: ; chooseidandfilename(const u8*,u8)->i16
.s0:
4bac : a9 00 __ LDA #$00
4bae : 85 17 __ STA P10 
4bb0 : a9 14 __ LDA #$14
4bb2 : 85 18 __ STA P11 
4bb4 : a9 05 __ LDA #$05
4bb6 : 8d f3 ab STA $abf3 ; (sstack + 0)
4bb9 : a9 28 __ LDA #$28
4bbb : 8d f4 ab STA $abf4 ; (sstack + 1)
4bbe : a9 0c __ LDA #$0c
4bc0 : 8d f5 ab STA $abf5 ; (sstack + 2)
4bc3 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
4bc6 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
4bc9 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
4bcc : a9 01 __ LDA #$01
4bce : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
4bd1 : ad f8 ab LDA $abf8 ; (sstack + 5)
4bd4 : 85 13 __ STA P6 
4bd6 : ad f9 ab LDA $abf9 ; (sstack + 6)
4bd9 : 85 14 __ STA P7 
4bdb : 20 33 81 JSR $8133 ; (vdc_prints_attr@proxy + 0)
4bde : a9 00 __ LDA #$00
4be0 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
4be3 : 20 02 61 JSR $6102 ; (choosedeviceid.s1000 + 0)
4be6 : a5 1b __ LDA ACCU + 0 
4be8 : d0 07 __ BNE $4bf1 ; (chooseidandfilename.s4 + 0)
.s2:
4bea : a9 ff __ LDA #$ff
4bec : c6 1b __ DEC ACCU + 0 
4bee : 85 1c __ STA ACCU + 1 
.s1001:
4bf0 : 60 __ __ RTS
.s4:
4bf1 : a9 0a __ LDA #$0a
4bf3 : 85 12 __ STA P5 
4bf5 : a9 37 __ LDA #$37
4bf7 : 85 13 __ STA P6 
4bf9 : a9 62 __ LDA #$62
4bfb : 85 14 __ STA P7 
4bfd : 20 de 80 JSR $80de ; (vdc_prints_attr@proxy + 0)
4c00 : a9 15 __ LDA #$15
4c02 : 85 16 __ STA P9 
4c04 : a9 0b __ LDA #$0b
4c06 : 85 17 __ STA P10 
4c08 : a9 97 __ LDA #$97
4c0a : 8d f3 ab STA $abf3 ; (sstack + 0)
4c0d : a9 87 __ LDA #$87
4c0f : 8d f4 ab STA $abf4 ; (sstack + 1)
4c12 : ad fa ab LDA $abfa ; (sstack + 7)
4c15 : 8d f5 ab STA $abf5 ; (sstack + 2)
--------------------------------------------------------------------
textInput: ; textInput(u8,u8,u8*,u8)->i16
.s1000:
4c18 : a5 53 __ LDA T6 + 0 
4c1a : 8d ee ab STA $abee ; (palette_draw@stack + 15)
4c1d : a5 54 __ LDA T6 + 1 
4c1f : 8d ef ab STA $abef ; (buffer + 12)
4c22 : a5 55 __ LDA T8 + 0 
4c24 : 8d f0 ab STA $abf0 ; (buffer + 13)
.s0:
4c27 : ad f3 ab LDA $abf3 ; (sstack + 0)
4c2a : 85 49 __ STA T0 + 0 
4c2c : 85 0d __ STA P0 
4c2e : ad f4 ab LDA $abf4 ; (sstack + 1)
4c31 : 85 4a __ STA T0 + 1 
4c33 : 85 0e __ STA P1 
4c35 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
4c38 : a5 1b __ LDA ACCU + 0 ; (size + 0)
4c3a : 85 4b __ STA T1 + 0 
4c3c : f0 13 __ BEQ $4c51 ; (textInput.s3 + 0)
.s1:
4c3e : a5 49 __ LDA T0 + 0 
4c40 : 85 13 __ STA P6 
4c42 : a5 4a __ LDA T0 + 1 
4c44 : 85 14 __ STA P7 
4c46 : a5 16 __ LDA P9 ; (xpos + 0)
4c48 : 85 11 __ STA P4 
4c4a : a5 17 __ LDA P10 ; (ypos + 0)
4c4c : 85 12 __ STA P5 
4c4e : 20 85 33 JSR $3385 ; (vdc_prints_attr@proxy + 0)
.s3:
4c51 : a5 16 __ LDA P9 ; (xpos + 0)
4c53 : 85 49 __ STA T0 + 0 
4c55 : 18 __ __ CLC
4c56 : 65 4b __ ADC T1 + 0 
4c58 : 8d d5 87 STA $87d5 ; (canvas + 15)
4c5b : a5 17 __ LDA P10 ; (ypos + 0)
4c5d : 8d d6 87 STA $87d6 ; (canvas + 16)
.l147:
4c60 : a9 d1 __ LDA #$d1
4c62 : 85 0d __ STA P0 
4c64 : a9 87 __ LDA #$87
4c66 : 85 0e __ STA P1 
.l146:
4c68 : 20 51 3e JSR $3e51 ; (vdcwin_cursor_toggle.s0 + 0)
.l7:
4c6b : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
4c6e : a5 1b __ LDA ACCU + 0 ; (size + 0)
4c70 : c9 1b __ CMP #$1b
4c72 : d0 03 __ BNE $4c77 ; (textInput.s72 + 0)
4c74 : 4c 05 4e JMP $4e05 ; (textInput.s10 + 0)
.s72:
4c77 : 85 4d __ STA T3 + 0 
4c79 : c9 1b __ CMP #$1b
4c7b : b0 03 __ BCS $4c80 ; (textInput.s73 + 0)
4c7d : 4c d4 4d JMP $4dd4 ; (textInput.s74 + 0)
.s73:
4c80 : c9 94 __ CMP #$94
4c82 : d0 72 __ BNE $4cf6 ; (textInput.s80 + 0)
.s28:
4c84 : ad f3 ab LDA $abf3 ; (sstack + 0)
4c87 : 85 4d __ STA T3 + 0 
4c89 : 85 0d __ STA P0 
4c8b : ad f4 ab LDA $abf4 ; (sstack + 1)
4c8e : 85 4e __ STA T3 + 1 
4c90 : 85 0e __ STA P1 
4c92 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
4c95 : a5 1b __ LDA ACCU + 0 ; (size + 0)
4c97 : cd f5 ab CMP $abf5 ; (sstack + 2)
4c9a : b0 cf __ BCS $4c6b ; (textInput.l7 + 0)
.s33:
4c9c : 85 4f __ STA T4 + 0 
4c9e : 09 00 __ ORA #$00
4ca0 : f0 c9 __ BEQ $4c6b ; (textInput.l7 + 0)
.s32:
4ca2 : a5 4b __ LDA T1 + 0 
4ca4 : c5 1b __ CMP ACCU + 0 ; (size + 0)
4ca6 : b0 c3 __ BCS $4c6b ; (textInput.l7 + 0)
.s29:
4ca8 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
4cab : a5 4d __ LDA T3 + 0 
4cad : 85 13 __ STA P6 
4caf : a5 4e __ LDA T3 + 1 
4cb1 : 85 14 __ STA P7 
4cb3 : a5 16 __ LDA P9 ; (xpos + 0)
4cb5 : 85 11 __ STA P4 
4cb7 : a5 17 __ LDA P10 ; (ypos + 0)
4cb9 : 85 12 __ STA P5 
4cbb : ad b4 87 LDA $87b4 ; (vdc_state + 7)
4cbe : 85 15 __ STA P8 
4cc0 : 18 __ __ CLC
4cc1 : a5 4f __ LDA T4 + 0 
4cc3 : 69 01 __ ADC #$01
4cc5 : c5 4b __ CMP T1 + 0 
4cc7 : 90 14 __ BCC $4cdd ; (textInput.s36 + 0)
.s1038:
4cc9 : 85 52 __ STA T7 + 0 
4ccb : a8 __ __ TAY
.l35:
4ccc : b1 13 __ LDA (P6),y 
4cce : c8 __ __ INY
4ccf : 91 13 __ STA (P6),y 
4cd1 : a5 52 __ LDA T7 + 0 
4cd3 : f0 08 __ BEQ $4cdd ; (textInput.s36 + 0)
.s39:
4cd5 : c6 52 __ DEC T7 + 0 
4cd7 : a4 52 __ LDY T7 + 0 
4cd9 : c4 4b __ CPY T1 + 0 
4cdb : b0 ef __ BCS $4ccc ; (textInput.l35 + 0)
.s36:
4cdd : a9 20 __ LDA #$20
4cdf : a4 4b __ LDY T1 + 0 
4ce1 : 91 13 __ STA (P6),y 
4ce3 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
4ce6 : a5 17 __ LDA P10 ; (ypos + 0)
4ce8 : 8d d6 87 STA $87d6 ; (canvas + 16)
4ceb : 18 __ __ CLC
4cec : a5 49 __ LDA T0 + 0 
4cee : 65 4b __ ADC T1 + 0 
.s149:
4cf0 : 8d d5 87 STA $87d5 ; (canvas + 15)
4cf3 : 4c 60 4c JMP $4c60 ; (textInput.l147 + 0)
.s80:
4cf6 : b0 03 __ BCS $4cfb ; (textInput.s81 + 0)
4cf8 : 4c 99 4d JMP $4d99 ; (textInput.s82 + 0)
.s81:
4cfb : c9 9d __ CMP #$9d
4cfd : d0 1c __ BNE $4d1b ; (textInput.s55 + 0)
.s43:
4cff : a5 4b __ LDA T1 + 0 
4d01 : d0 03 __ BNE $4d06 ; (textInput.s44 + 0)
4d03 : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s44:
4d06 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
4d09 : c6 4b __ DEC T1 + 0 
.s148:
4d0b : 18 __ __ CLC
4d0c : a5 4b __ LDA T1 + 0 
4d0e : 65 49 __ ADC T0 + 0 
4d10 : 8d d5 87 STA $87d5 ; (canvas + 15)
4d13 : a5 17 __ LDA P10 ; (ypos + 0)
4d15 : 8d d6 87 STA $87d6 ; (canvas + 16)
4d18 : 4c 68 4c JMP $4c68 ; (textInput.l146 + 0)
.s55:
4d1b : 09 00 __ ORA #$00
4d1d : 10 03 __ BPL $4d22 ; (textInput.s64 + 0)
4d1f : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s64:
4d22 : aa __ __ TAX
4d23 : bd 6f 82 LDA $826f,x ; (_cinfo + 0)
4d26 : d0 03 __ BNE $4d2b ; (textInput.s61 + 0)
4d28 : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s61:
4d2b : a5 4b __ LDA T1 + 0 
4d2d : cd f5 ab CMP $abf5 ; (sstack + 2)
4d30 : 90 03 __ BCC $4d35 ; (textInput.s56 + 0)
4d32 : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s56:
4d35 : ad f3 ab LDA $abf3 ; (sstack + 0)
4d38 : 85 50 __ STA T5 + 0 
4d3a : 65 4b __ ADC T1 + 0 
4d3c : 85 53 __ STA T6 + 0 
4d3e : ad f4 ab LDA $abf4 ; (sstack + 1)
4d41 : 85 51 __ STA T5 + 1 
4d43 : 69 00 __ ADC #$00
4d45 : 85 54 __ STA T6 + 1 
4d47 : a0 00 __ LDY #$00
4d49 : b1 53 __ LDA (T6 + 0),y 
4d4b : 85 4c __ STA T2 + 0 
4d4d : 8a __ __ TXA
4d4e : 91 53 __ STA (T6 + 0),y 
4d50 : a9 d1 __ LDA #$d1
4d52 : 85 0d __ STA P0 
4d54 : a9 87 __ LDA #$87
4d56 : 85 0e __ STA P1 
4d58 : 20 51 3e JSR $3e51 ; (vdcwin_cursor_toggle.s0 + 0)
4d5b : a5 4d __ LDA T3 + 0 
4d5d : 20 7a 35 JSR $357a ; (pet2screen.s0 + 0)
4d60 : 85 0f __ STA P2 
4d62 : 18 __ __ CLC
4d63 : a5 49 __ LDA T0 + 0 
4d65 : 65 4b __ ADC T1 + 0 
4d67 : 85 0d __ STA P0 
4d69 : a5 17 __ LDA P10 ; (ypos + 0)
4d6b : 85 0e __ STA P1 
4d6d : 20 01 82 JSR $8201 ; (vdc_printc@proxy + 0)
4d70 : a5 17 __ LDA P10 ; (ypos + 0)
4d72 : 8d d6 87 STA $87d6 ; (canvas + 16)
4d75 : a9 d1 __ LDA #$d1
4d77 : 85 0d __ STA P0 
4d79 : a9 87 __ LDA #$87
4d7b : 85 0e __ STA P1 
4d7d : e6 4b __ INC T1 + 0 
4d7f : 18 __ __ CLC
4d80 : a5 4b __ LDA T1 + 0 
4d82 : 65 49 __ ADC T0 + 0 
4d84 : 8d d5 87 STA $87d5 ; (canvas + 15)
4d87 : 20 51 3e JSR $3e51 ; (vdcwin_cursor_toggle.s0 + 0)
4d8a : a5 4c __ LDA T2 + 0 
4d8c : f0 03 __ BEQ $4d91 ; (textInput.s67 + 0)
4d8e : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s67:
4d91 : a4 4b __ LDY T1 + 0 
4d93 : c8 __ __ INY
4d94 : 91 50 __ STA (T5 + 0),y 
4d96 : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s82:
4d99 : c9 1d __ CMP #$1d
4d9b : f0 03 __ BEQ $4da0 ; (textInput.s48 + 0)
4d9d : 4c 1b 4d JMP $4d1b ; (textInput.s55 + 0)
.s48:
4da0 : ad f3 ab LDA $abf3 ; (sstack + 0)
4da3 : 85 0d __ STA P0 
4da5 : ad f4 ab LDA $abf4 ; (sstack + 1)
4da8 : 85 0e __ STA P1 
4daa : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
4dad : a5 1c __ LDA ACCU + 1 
4daf : 10 03 __ BPL $4db4 ; (textInput.s1012 + 0)
4db1 : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s1012:
4db4 : d0 19 __ BNE $4dcf ; (textInput.s1037 + 0)
.s1010:
4db6 : a5 4b __ LDA T1 + 0 
4db8 : c5 1b __ CMP ACCU + 0 ; (size + 0)
4dba : 90 03 __ BCC $4dbf ; (textInput.s52 + 0)
4dbc : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s52:
4dbf : cd f5 ab CMP $abf5 ; (sstack + 2)
4dc2 : 90 03 __ BCC $4dc7 ; (textInput.s49 + 0)
4dc4 : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s49:
4dc7 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
4dca : e6 4b __ INC T1 + 0 
4dcc : 4c 0b 4d JMP $4d0b ; (textInput.s148 + 0)
.s1037:
4dcf : a5 4b __ LDA T1 + 0 
4dd1 : 4c bf 4d JMP $4dbf ; (textInput.s52 + 0)
.s74:
4dd4 : c9 0d __ CMP #$0d
4dd6 : d0 24 __ BNE $4dfc ; (textInput.s75 + 0)
.s11:
4dd8 : ad f3 ab LDA $abf3 ; (sstack + 0)
4ddb : 85 49 __ STA T0 + 0 
4ddd : 85 0d __ STA P0 
4ddf : ad f4 ab LDA $abf4 ; (sstack + 1)
4de2 : 85 4a __ STA T0 + 1 
4de4 : 85 0e __ STA P1 
4de6 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
4de9 : a9 00 __ LDA #$00
4deb : a4 1b __ LDY ACCU + 0 ; (size + 0)
4ded : 84 4b __ STY T1 + 0 
4def : 91 49 __ STA (T0 + 0),y 
4df1 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
4df4 : a5 4b __ LDA T1 + 0 
4df6 : 85 1b __ STA ACCU + 0 ; (size + 0)
4df8 : a9 00 __ LDA #$00
4dfa : f0 10 __ BEQ $4e0c ; (textInput.s1001 + 0)
.s75:
4dfc : b0 20 __ BCS $4e1e ; (textInput.s76 + 0)
.s77:
4dfe : c9 03 __ CMP #$03
4e00 : f0 03 __ BEQ $4e05 ; (textInput.s10 + 0)
4e02 : 4c 1b 4d JMP $4d1b ; (textInput.s55 + 0)
.s10:
4e05 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
4e08 : a9 ff __ LDA #$ff
4e0a : 85 1b __ STA ACCU + 0 ; (size + 0)
.s1001:
4e0c : 85 1c __ STA ACCU + 1 
4e0e : ad ee ab LDA $abee ; (palette_draw@stack + 15)
4e11 : 85 53 __ STA T6 + 0 
4e13 : ad ef ab LDA $abef ; (buffer + 12)
4e16 : 85 54 __ STA T6 + 1 
4e18 : ad f0 ab LDA $abf0 ; (buffer + 13)
4e1b : 85 55 __ STA T8 + 0 
4e1d : 60 __ __ RTS
.s76:
4e1e : c9 14 __ CMP #$14
4e20 : f0 03 __ BEQ $4e25 ; (textInput.s12 + 0)
4e22 : 4c 1b 4d JMP $4d1b ; (textInput.s55 + 0)
.s12:
4e25 : a5 4b __ LDA T1 + 0 
4e27 : d0 03 __ BNE $4e2c ; (textInput.s13 + 0)
4e29 : 4c 6b 4c JMP $4c6b ; (textInput.l7 + 0)
.s13:
4e2c : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
4e2f : a9 20 __ LDA #$20
4e31 : 85 0f __ STA P2 
4e33 : c6 4b __ DEC T1 + 0 
4e35 : 18 __ __ CLC
4e36 : a5 4b __ LDA T1 + 0 
4e38 : 65 49 __ ADC T0 + 0 
4e3a : 85 0d __ STA P0 
4e3c : a5 17 __ LDA P10 ; (ypos + 0)
4e3e : 85 4c __ STA T2 + 0 
4e40 : 85 0e __ STA P1 
4e42 : 20 01 82 JSR $8201 ; (vdc_printc@proxy + 0)
4e45 : a5 4b __ LDA T1 + 0 
4e47 : 85 52 __ STA T7 + 0 
4e49 : ad f3 ab LDA $abf3 ; (sstack + 0)
4e4c : 85 4d __ STA T3 + 0 
4e4e : ad f4 ab LDA $abf4 ; (sstack + 1)
4e51 : 85 4e __ STA T3 + 1 
.l17:
4e53 : a4 52 __ LDY T7 + 0 
4e55 : c8 __ __ INY
4e56 : b1 4d __ LDA (T3 + 0),y 
4e58 : 85 55 __ STA T8 + 0 
4e5a : 88 __ __ DEY
4e5b : 91 4d __ STA (T3 + 0),y 
4e5d : 09 00 __ ORA #$00
4e5f : d0 04 __ BNE $4e65 ; (textInput.s20 + 0)
.s21:
4e61 : a9 20 __ LDA #$20
4e63 : d0 03 __ BNE $4e68 ; (textInput.s22 + 0)
.s20:
4e65 : 20 7a 35 JSR $357a ; (pet2screen.s0 + 0)
.s22:
4e68 : 85 0f __ STA P2 
4e6a : a5 4c __ LDA T2 + 0 
4e6c : 85 0e __ STA P1 
4e6e : 18 __ __ CLC
4e6f : a5 49 __ LDA T0 + 0 
4e71 : 65 52 __ ADC T7 + 0 
4e73 : 85 0d __ STA P0 
4e75 : 20 01 82 JSR $8201 ; (vdc_printc@proxy + 0)
4e78 : a5 55 __ LDA T8 + 0 
4e7a : d0 0d __ BNE $4e89 ; (textInput.s18 + 0)
.s19:
4e7c : a5 0e __ LDA P1 
4e7e : 8d d6 87 STA $87d6 ; (canvas + 16)
4e81 : 18 __ __ CLC
4e82 : a5 4b __ LDA T1 + 0 
4e84 : 65 49 __ ADC T0 + 0 
4e86 : 4c f0 4c JMP $4cf0 ; (textInput.s149 + 0)
.s18:
4e89 : e6 52 __ INC T7 + 0 
4e8b : 4c 53 4e JMP $4e53 ; (textInput.l17 + 0)
--------------------------------------------------------------------
strtol@proxy: ; strtol@proxy
4e8e : a9 51 __ LDA #$51
4e90 : 85 0d __ STA P0 
4e92 : a9 89 __ LDA #$89
4e94 : 85 0e __ STA P1 
4e96 : a9 c6 __ LDA #$c6
4e98 : 85 0f __ STA P2 
4e9a : a9 ab __ LDA #$ab
4e9c : 85 10 __ STA P3 
4e9e : a9 0a __ LDA #$0a
4ea0 : 85 11 __ STA P4 
--------------------------------------------------------------------
strtol: ; strtol(const u8*,const u8**,u8)->i32
.l1:
4ea2 : a0 00 __ LDY #$00
4ea4 : b1 0d __ LDA (P0),y ; (s + 0)
4ea6 : aa __ __ TAX
4ea7 : a5 0d __ LDA P0 ; (s + 0)
4ea9 : 85 1b __ STA ACCU + 0 
4eab : 18 __ __ CLC
4eac : 69 01 __ ADC #$01
4eae : 85 0d __ STA P0 ; (s + 0)
4eb0 : a5 0e __ LDA P1 ; (s + 1)
4eb2 : 85 1c __ STA ACCU + 1 
4eb4 : 69 00 __ ADC #$00
4eb6 : 85 0e __ STA P1 ; (s + 1)
4eb8 : 8a __ __ TXA
4eb9 : e0 21 __ CPX #$21
4ebb : b0 0d __ BCS $4eca ; (strtol.s3 + 0)
.s2:
4ebd : 09 00 __ ORA #$00
4ebf : d0 e1 __ BNE $4ea2 ; (strtol.l1 + 0)
.s4:
4ec1 : 85 1b __ STA ACCU + 0 
4ec3 : 85 1c __ STA ACCU + 1 
4ec5 : 85 1d __ STA ACCU + 2 
.s1001:
4ec7 : 85 1e __ STA ACCU + 3 
4ec9 : 60 __ __ RTS
.s3:
4eca : e0 2d __ CPX #$2d
4ecc : d0 06 __ BNE $4ed4 ; (strtol.s9 + 0)
.s8:
4ece : a9 01 __ LDA #$01
4ed0 : 85 46 __ STA T3 + 0 
4ed2 : d0 09 __ BNE $4edd ; (strtol.s107 + 0)
.s9:
4ed4 : 84 46 __ STY T3 + 0 
4ed6 : 85 45 __ STA T2 + 0 
4ed8 : 8a __ __ TXA
4ed9 : e0 2b __ CPX #$2b
4edb : d0 13 __ BNE $4ef0 ; (strtol.s92 + 0)
.s107:
4edd : 18 __ __ CLC
4ede : a5 1b __ LDA ACCU + 0 
4ee0 : 69 02 __ ADC #$02
4ee2 : 85 0d __ STA P0 ; (s + 0)
4ee4 : a5 1c __ LDA ACCU + 1 
4ee6 : 69 00 __ ADC #$00
4ee8 : 85 0e __ STA P1 ; (s + 1)
4eea : a0 01 __ LDY #$01
4eec : b1 1b __ LDA (ACCU + 0),y 
4eee : 85 45 __ STA T2 + 0 
.s92:
4ef0 : c9 30 __ CMP #$30
4ef2 : d0 03 __ BNE $4ef7 ; (strtol.s15 + 0)
4ef4 : 4c f7 4f JMP $4ff7 ; (strtol.s14 + 0)
.s15:
4ef7 : a5 11 __ LDA P4 ; (base + 0)
4ef9 : d0 04 __ BNE $4eff ; (strtol.s120 + 0)
.s24:
4efb : a9 0a __ LDA #$0a
4efd : 85 11 __ STA P4 ; (base + 0)
.s120:
4eff : a9 00 __ LDA #$00
4f01 : 85 47 __ STA T5 + 0 
4f03 : 85 48 __ STA T5 + 1 
4f05 : 85 49 __ STA T5 + 2 
.l75:
4f07 : 85 4a __ STA T5 + 3 
4f09 : a5 45 __ LDA T2 + 0 
4f0b : c9 30 __ CMP #$30
4f0d : 90 59 __ BCC $4f68 ; (strtol.s32 + 0)
.s34:
4f0f : a5 45 __ LDA T2 + 0 
4f11 : c9 3a __ CMP #$3a
4f13 : b0 53 __ BCS $4f68 ; (strtol.s32 + 0)
.s31:
4f15 : a0 00 __ LDY #$00
4f17 : b1 0d __ LDA (P0),y ; (s + 0)
4f19 : a8 __ __ TAY
4f1a : e6 0d __ INC P0 ; (s + 0)
4f1c : d0 02 __ BNE $4f20 ; (strtol.s1029 + 0)
.s1028:
4f1e : e6 0e __ INC P1 ; (s + 1)
.s1029:
4f20 : a5 45 __ LDA T2 + 0 
4f22 : 84 45 __ STY T2 + 0 
4f24 : 38 __ __ SEC
4f25 : e9 30 __ SBC #$30
4f27 : 85 43 __ STA T1 + 0 
4f29 : a9 00 __ LDA #$00
4f2b : e9 00 __ SBC #$00
4f2d : 85 44 __ STA T1 + 1 
.s119:
4f2f : a5 11 __ LDA P4 ; (base + 0)
4f31 : 85 1b __ STA ACCU + 0 
4f33 : a9 00 __ LDA #$00
4f35 : 85 1c __ STA ACCU + 1 
4f37 : 85 1d __ STA ACCU + 2 
4f39 : 85 1e __ STA ACCU + 3 
4f3b : a5 47 __ LDA T5 + 0 
4f3d : 85 03 __ STA WORK + 0 
4f3f : a5 48 __ LDA T5 + 1 
4f41 : 85 04 __ STA WORK + 1 
4f43 : a5 49 __ LDA T5 + 2 
4f45 : 85 05 __ STA WORK + 2 
4f47 : a5 4a __ LDA T5 + 3 
4f49 : 85 06 __ STA WORK + 3 
4f4b : 20 4e 7d JSR $7d4e ; (mul32 + 0)
4f4e : 18 __ __ CLC
4f4f : a5 43 __ LDA T1 + 0 
4f51 : 65 07 __ ADC WORK + 4 
4f53 : 85 47 __ STA T5 + 0 
4f55 : a5 44 __ LDA T1 + 1 
4f57 : 65 08 __ ADC WORK + 5 
4f59 : 85 48 __ STA T5 + 1 
4f5b : a9 00 __ LDA #$00
4f5d : 65 09 __ ADC WORK + 6 
4f5f : 85 49 __ STA T5 + 2 
4f61 : a9 00 __ LDA #$00
4f63 : 65 0a __ ADC WORK + 7 
4f65 : 4c 07 4f JMP $4f07 ; (strtol.l75 + 0)
.s32:
4f68 : a5 45 __ LDA T2 + 0 
4f6a : c9 61 __ CMP #$61
4f6c : 90 1c __ BCC $4f8a ; (strtol.s36 + 0)
.s38:
4f6e : c9 67 __ CMP #$67
4f70 : b0 18 __ BCS $4f8a ; (strtol.s36 + 0)
.s35:
4f72 : a5 0d __ LDA P0 ; (s + 0)
4f74 : 85 1b __ STA ACCU + 0 
4f76 : 69 01 __ ADC #$01
4f78 : 85 0d __ STA P0 ; (s + 0)
4f7a : a5 0e __ LDA P1 ; (s + 1)
4f7c : 85 1c __ STA ACCU + 1 
4f7e : 69 00 __ ADC #$00
4f80 : 85 0e __ STA P1 ; (s + 1)
4f82 : 18 __ __ CLC
4f83 : a5 45 __ LDA T2 + 0 
4f85 : 69 a9 __ ADC #$a9
4f87 : 4c a7 4f JMP $4fa7 ; (strtol.s106 + 0)
.s36:
4f8a : c9 41 __ CMP #$41
4f8c : 90 2a __ BCC $4fb8 ; (strtol.s30 + 0)
.s42:
4f8e : c9 47 __ CMP #$47
4f90 : b0 26 __ BCS $4fb8 ; (strtol.s30 + 0)
.s39:
4f92 : a5 0d __ LDA P0 ; (s + 0)
4f94 : 85 1b __ STA ACCU + 0 
4f96 : 69 01 __ ADC #$01
4f98 : 85 0d __ STA P0 ; (s + 0)
4f9a : a5 0e __ LDA P1 ; (s + 1)
4f9c : 85 1c __ STA ACCU + 1 
4f9e : 69 00 __ ADC #$00
4fa0 : 85 0e __ STA P1 ; (s + 1)
4fa2 : 18 __ __ CLC
4fa3 : a5 45 __ LDA T2 + 0 
4fa5 : 69 c9 __ ADC #$c9
.s106:
4fa7 : 85 43 __ STA T1 + 0 
4fa9 : a9 00 __ LDA #$00
4fab : 69 ff __ ADC #$ff
4fad : 85 44 __ STA T1 + 1 
4faf : a0 00 __ LDY #$00
4fb1 : b1 1b __ LDA (ACCU + 0),y 
4fb3 : 85 45 __ STA T2 + 0 
4fb5 : 4c 2f 4f JMP $4f2f ; (strtol.s119 + 0)
.s30:
4fb8 : a5 46 __ LDA T3 + 0 
4fba : f0 19 __ BEQ $4fd5 ; (strtol.s97 + 0)
.s44:
4fbc : 38 __ __ SEC
4fbd : a9 00 __ LDA #$00
4fbf : e5 47 __ SBC T5 + 0 
4fc1 : 85 47 __ STA T5 + 0 
4fc3 : a9 00 __ LDA #$00
4fc5 : e5 48 __ SBC T5 + 1 
4fc7 : 85 48 __ STA T5 + 1 
4fc9 : a9 00 __ LDA #$00
4fcb : e5 49 __ SBC T5 + 2 
4fcd : 85 49 __ STA T5 + 2 
4fcf : a9 00 __ LDA #$00
4fd1 : e5 4a __ SBC T5 + 3 
4fd3 : 85 4a __ STA T5 + 3 
.s97:
4fd5 : a5 10 __ LDA P3 ; (endp + 1)
4fd7 : 05 0f __ ORA P2 ; (endp + 0)
4fd9 : f0 0b __ BEQ $4fe6 ; (strtol.s49 + 0)
.s47:
4fdb : a5 0d __ LDA P0 ; (s + 0)
4fdd : a0 00 __ LDY #$00
4fdf : 91 0f __ STA (P2),y ; (endp + 0)
4fe1 : a5 0e __ LDA P1 ; (s + 1)
4fe3 : c8 __ __ INY
4fe4 : 91 0f __ STA (P2),y ; (endp + 0)
.s49:
4fe6 : a5 47 __ LDA T5 + 0 
4fe8 : 85 1b __ STA ACCU + 0 
4fea : a5 48 __ LDA T5 + 1 
4fec : 85 1c __ STA ACCU + 1 
4fee : a5 49 __ LDA T5 + 2 
4ff0 : 85 1d __ STA ACCU + 2 
4ff2 : a5 4a __ LDA T5 + 3 
4ff4 : 4c c7 4e JMP $4ec7 ; (strtol.s1001 + 0)
.s14:
4ff7 : a5 0d __ LDA P0 ; (s + 0)
4ff9 : 85 1b __ STA ACCU + 0 
4ffb : 18 __ __ CLC
4ffc : 69 01 __ ADC #$01
4ffe : 85 0d __ STA P0 ; (s + 0)
5000 : a5 0e __ LDA P1 ; (s + 1)
5002 : 85 1c __ STA ACCU + 1 
5004 : 69 00 __ ADC #$00
5006 : 85 0e __ STA P1 ; (s + 1)
5008 : a0 00 __ LDY #$00
500a : b1 1b __ LDA (ACCU + 0),y 
500c : c9 78 __ CMP #$78
500e : f0 04 __ BEQ $5014 ; (strtol.s17 + 0)
.s20:
5010 : c9 58 __ CMP #$58
5012 : d0 1a __ BNE $502e ; (strtol.s18 + 0)
.s17:
5014 : a9 10 __ LDA #$10
5016 : 85 11 __ STA P4 ; (base + 0)
5018 : 18 __ __ CLC
5019 : a5 1b __ LDA ACCU + 0 
501b : 69 02 __ ADC #$02
501d : 85 0d __ STA P0 ; (s + 0)
501f : a5 1c __ LDA ACCU + 1 
5021 : 69 00 __ ADC #$00
5023 : 85 0e __ STA P1 ; (s + 1)
5025 : a0 01 __ LDY #$01
5027 : b1 1b __ LDA (ACCU + 0),y 
5029 : 85 45 __ STA T2 + 0 
502b : 4c ff 4e JMP $4eff ; (strtol.s120 + 0)
.s18:
502e : 85 45 __ STA T2 + 0 
5030 : a5 11 __ LDA P4 ; (base + 0)
5032 : f0 03 __ BEQ $5037 ; (strtol.s21 + 0)
5034 : 4c ff 4e JMP $4eff ; (strtol.s120 + 0)
.s21:
5037 : 85 47 __ STA T5 + 0 
5039 : 85 48 __ STA T5 + 1 
503b : 85 49 __ STA T5 + 2 
503d : 85 4a __ STA T5 + 3 
503f : a9 08 __ LDA #$08
5041 : 85 11 __ STA P4 ; (base + 0)
5043 : b1 1b __ LDA (ACCU + 0),y 
5045 : c9 30 __ CMP #$30
5047 : b0 03 __ BCS $504c ; (strtol.s21 + 21)
5049 : 4c 68 4f JMP $4f68 ; (strtol.s32 + 0)
504c : 4c 0f 4f JMP $4f0f ; (strtol.s34 + 0)
--------------------------------------------------------------------
togglestatusbar: ; togglestatusbar()->void
.s0:
504f : ac b2 87 LDY $87b2 ; (vdc_state + 5)
5052 : 88 __ __ DEY
5053 : ad 8f 87 LDA $878f ; (screen_row + 1)
5056 : d0 05 __ BNE $505d ; (togglestatusbar.s3 + 0)
.s1002:
5058 : cc 8e 87 CPY $878e ; (screen_row + 0)
505b : f0 15 __ BEQ $5072 ; (togglestatusbar.s1001 + 0)
.s3:
505d : ad ff 87 LDA $87ff ; (showbar + 0)
5060 : d0 08 __ BNE $506a ; (togglestatusbar.s5 + 0)
.s6:
5062 : a9 01 __ LDA #$01
5064 : 8d ff 87 STA $87ff ; (showbar + 0)
5067 : 4c d4 3e JMP $3ed4 ; (initstatusbar.s1000 + 0)
.s5:
506a : a9 00 __ LDA #$00
506c : 8d ff 87 STA $87ff ; (showbar + 0)
506f : 4c b2 80 JMP $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
.s1001:
5072 : 60 __ __ RTS
--------------------------------------------------------------------
helpscreen_load: ; helpscreen_load(u8)->void
.s1000:
5073 : a5 53 __ LDA T0 + 0 
5075 : 8d cc ab STA $abcc ; (buff + 39)
5078 : a5 54 __ LDA T1 + 0 
507a : 8d cd ab STA $abcd ; (buff + 40)
507d : 38 __ __ SEC
507e : a5 23 __ LDA SP + 0 
5080 : e9 08 __ SBC #$08
5082 : 85 23 __ STA SP + 0 
5084 : b0 02 __ BCS $5088 ; (helpscreen_load.s0 + 0)
5086 : c6 24 __ DEC SP + 1 
.s0:
5088 : ad af 87 LDA $87af ; (vdc_state + 2)
508b : 85 53 __ STA T0 + 0 
508d : 20 1b 4b JSR $4b1b ; (hidecursor.s0 + 0)
5090 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
5093 : c9 01 __ CMP #$01
5095 : d0 1b __ BNE $50b2 ; (helpscreen_load.s3 + 0)
.s1:
5097 : a9 7f __ LDA #$7f
5099 : 85 11 __ STA P4 
509b : a9 01 __ LDA #$01
509d : 85 15 __ STA P8 
509f : ad bf 87 LDA $87bf ; (vdc_state + 18)
50a2 : 85 0f __ STA P2 
50a4 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
50a7 : 85 10 __ STA P3 
50a9 : a9 00 __ LDA #$00
50ab : 85 14 __ STA P7 
50ad : 85 12 __ STA P5 
50af : 20 b7 1a JSR $1ab7 ; (bnk_redef_charset@proxy + 0)
.s3:
50b2 : a9 1a __ LDA #$1a
50b4 : 8d 00 d6 STA $d600 
.l139:
50b7 : 2c 00 d6 BIT $d600 
50ba : 10 fb __ BPL $50b7 ; (helpscreen_load.l139 + 0)
.s10:
50bc : ad 01 d6 LDA $d601 
50bf : 29 f0 __ AND #$f0
50c1 : a2 1a __ LDX #$1a
50c3 : 8e 00 d6 STX $d600 
.l141:
50c6 : 2c 00 d6 BIT $d600 
50c9 : 10 fb __ BPL $50c6 ; (helpscreen_load.l141 + 0)
.s16:
50cb : 8d 01 d6 STA $d601 
50ce : a5 53 __ LDA T0 + 0 
50d0 : f0 03 __ BEQ $50d5 ; (helpscreen_load.s19 + 0)
.s17:
50d2 : 20 37 2e JSR $2e37 ; (vdc_set_mode@proxy + 0)
.s19:
50d5 : a9 51 __ LDA #$51
50d7 : a0 02 __ LDY #$02
50d9 : 91 23 __ STA (SP + 0),y 
50db : a9 89 __ LDA #$89
50dd : c8 __ __ INY
50de : 91 23 __ STA (SP + 0),y 
50e0 : a9 b5 __ LDA #$b5
50e2 : c8 __ __ INY
50e3 : 91 23 __ STA (SP + 0),y 
50e5 : a9 51 __ LDA #$51
50e7 : c8 __ __ INY
50e8 : 91 23 __ STA (SP + 0),y 
50ea : ad f8 ab LDA $abf8 ; (sstack + 5)
50ed : 85 54 __ STA T1 + 0 
50ef : c8 __ __ INY
50f0 : 91 23 __ STA (SP + 0),y 
50f2 : a9 00 __ LDA #$00
50f4 : c8 __ __ INY
50f5 : 91 23 __ STA (SP + 0),y 
50f7 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
50fa : a9 01 __ LDA #$01
50fc : 85 10 __ STA P3 
50fe : a9 51 __ LDA #$51
5100 : 85 13 __ STA P6 
5102 : a9 89 __ LDA #$89
5104 : 85 14 __ STA P7 
5106 : ad fe 86 LDA $86fe ; (bootdevice + 0)
5109 : 85 0f __ STA P2 
510b : a9 00 __ LDA #$00
510d : 85 11 __ STA P4 
510f : a9 20 __ LDA #$20
5111 : 85 12 __ STA P5 
5113 : 20 6c 13 JSR $136c ; (bnk_load.s0 + 0)
5116 : a5 1b __ LDA ACCU + 0 
5118 : d0 10 __ BNE $512a ; (helpscreen_load.s20 + 0)
.s21:
511a : a9 0f __ LDA #$0f
511c : 8d f6 ab STA $abf6 ; (sstack + 3)
511f : a9 52 __ LDA #$52
5121 : 8d f7 ab STA $abf7 ; (sstack + 4)
5124 : 20 c0 51 JSR $51c0 ; (menu_messagepopup.s1000 + 0)
5127 : 4c 31 51 JMP $5131 ; (helpscreen_load.s145 + 0)
.s20:
512a : a9 20 __ LDA #$20
512c : 85 13 __ STA P6 
512e : 20 1b 1a JSR $1a1b ; (bnk_cpytovdc@proxy + 0)
.s145:
5131 : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
5134 : a5 53 __ LDA T0 + 0 
5136 : f0 05 __ BEQ $513d ; (helpscreen_load.s25 + 0)
.s23:
5138 : 85 16 __ STA P9 
513a : 20 3b 2e JSR $2e3b ; (vdc_set_mode.s0 + 0)
.s25:
513d : a9 1a __ LDA #$1a
513f : 8d 00 d6 STA $d600 
.l146:
5142 : 2c 00 d6 BIT $d600 
5145 : 10 fb __ BPL $5142 ; (helpscreen_load.l146 + 0)
.s32:
5147 : ad 01 d6 LDA $d601 
514a : 29 f0 __ AND #$f0
514c : 18 __ __ CLC
514d : 6d 90 87 ADC $8790 ; (screenbackground + 0)
5150 : a2 1a __ LDX #$1a
5152 : 8e 00 d6 STX $d600 
.l148:
5155 : 2c 00 d6 BIT $d600 
5158 : 10 fb __ BPL $5155 ; (helpscreen_load.l148 + 0)
.s38:
515a : 8d 01 d6 STA $d601 
515d : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
5160 : ad ff 87 LDA $87ff ; (showbar + 0)
5163 : f0 03 __ BEQ $5168 ; (helpscreen_load.s41 + 0)
.s39:
5165 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s41:
5168 : a5 54 __ LDA T1 + 0 
516a : c9 02 __ CMP #$02
516c : f0 0f __ BEQ $517d ; (helpscreen_load.s44 + 0)
.s42:
516e : ad 8c 87 LDA $878c ; (screen_col + 0)
5171 : 8d d5 87 STA $87d5 ; (canvas + 15)
5174 : ad 8e 87 LDA $878e ; (screen_row + 0)
5177 : 8d d6 87 STA $87d6 ; (canvas + 16)
517a : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
.s44:
517d : ad 8b 87 LDA $878b ; (charsetchanged + 1)
5180 : c9 01 __ CMP #$01
5182 : d0 1b __ BNE $519f ; (helpscreen_load.s1001 + 0)
.s47:
5184 : a9 7f __ LDA #$7f
5186 : 85 11 __ STA P4 
5188 : a9 01 __ LDA #$01
518a : 85 15 __ STA P8 
518c : ad bf 87 LDA $87bf ; (vdc_state + 18)
518f : 85 0f __ STA P2 
5191 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
5194 : 85 10 __ STA P3 
5196 : a9 00 __ LDA #$00
5198 : 85 14 __ STA P7 
519a : 85 12 __ STA P5 
519c : 20 b0 1a JSR $1ab0 ; (bnk_redef_charset@proxy + 0)
.s1001:
519f : 18 __ __ CLC
51a0 : a5 23 __ LDA SP + 0 
51a2 : 69 08 __ ADC #$08
51a4 : 85 23 __ STA SP + 0 
51a6 : 90 02 __ BCC $51aa ; (helpscreen_load.s1001 + 11)
51a8 : e6 24 __ INC SP + 1 
51aa : ad cc ab LDA $abcc ; (buff + 39)
51ad : 85 53 __ STA T0 + 0 
51af : ad cd ab LDA $abcd ; (buff + 40)
51b2 : 85 54 __ STA T1 + 0 
51b4 : 60 __ __ RTS
--------------------------------------------------------------------
51b5 : __ __ __ BYT 56 44 43 53 45 48 53 43 25 55 00                : VDCSEHSC%U.
--------------------------------------------------------------------
menu_messagepopup: ; menu_messagepopup(const u8*)->void
.s1000:
51c0 : a5 53 __ LDA T1 + 0 
51c2 : 8d ee ab STA $abee ; (palette_draw@stack + 15)
.s0:
51c5 : a9 00 __ LDA #$00
51c7 : 85 17 __ STA P10 
51c9 : a9 08 __ LDA #$08
51cb : 85 18 __ STA P11 
51cd : 8d f3 ab STA $abf3 ; (sstack + 0)
51d0 : a9 1e __ LDA #$1e
51d2 : 8d f4 ab STA $abf4 ; (sstack + 1)
51d5 : a9 06 __ LDA #$06
51d7 : 8d f5 ab STA $abf5 ; (sstack + 2)
51da : ad b4 87 LDA $87b4 ; (vdc_state + 7)
51dd : 85 53 __ STA T1 + 0 
51df : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
51e2 : 85 52 __ STA T0 + 0 
51e4 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
51e7 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
51ea : ad f6 ab LDA $abf6 ; (sstack + 3)
51ed : 85 13 __ STA P6 
51ef : ad f7 ab LDA $abf7 ; (sstack + 4)
51f2 : 85 14 __ STA P7 
51f4 : 20 df 81 JSR $81df ; (vdc_prints_attr@proxy + 0)
51f7 : a9 0b __ LDA #$0b
51f9 : 85 12 __ STA P5 
51fb : 20 d4 81 JSR $81d4 ; (vdc_prints_attr@proxy + 0)
51fe : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
5201 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
5204 : a5 53 __ LDA T1 + 0 
5206 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
.s1001:
5209 : ad ee ab LDA $abee ; (palette_draw@stack + 15)
520c : 85 53 __ STA T1 + 0 
520e : 60 __ __ RTS
--------------------------------------------------------------------
520f : __ __ __ BYT 69 4e 53 45 52 54 20 41 50 50 4c 49 43 41 54 49 : iNSERT APPLICATI
521f : __ __ __ BYT 4f 4e 20 44 49 53 4b 20 54 4f 20 56 49 45 57 20 : ON DISK TO VIEW 
522f : __ __ __ BYT 48 45 4c 50 2e 00                               : HELP..
--------------------------------------------------------------------
undo_new: ; undo_new(u8,u8,u8,u8)->void
.s1000:
5235 : a2 03 __ LDX #$03
5237 : b5 53 __ LDA T11 + 0,x 
5239 : 9d ec ab STA $abec,x ; (vp_fill + 31)
523c : ca __ __ DEX
523d : 10 f8 __ BPL $5237 ; (undo_new.s1000 + 2)
.s0:
523f : ee df 87 INC $87df ; (undonumber + 0)
5242 : ad e1 87 LDA $87e1 ; (undo_redopossible + 0)
5245 : f0 0c __ BEQ $5253 ; (undo_new.s2 + 0)
.s1:
5247 : a9 01 __ LDA #$01
5249 : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
524c : a9 00 __ LDA #$00
524e : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
5251 : f0 03 __ BEQ $5256 ; (undo_new.s3 + 0)
.s2:
5253 : ee e0 87 INC $87e0 ; (undo_undopossible + 0)
.s3:
5256 : a9 01 __ LDA #$01
5258 : 85 44 __ STA T1 + 0 
525a : a9 28 __ LDA #$28
525c : cd df 87 CMP $87df ; (undonumber + 0)
525f : b0 05 __ BCS $5266 ; (undo_new.s6 + 0)
.s4:
5261 : a9 01 __ LDA #$01
5263 : 8d df 87 STA $87df ; (undonumber + 0)
.s6:
5266 : ad f3 ab LDA $abf3 ; (sstack + 0)
5269 : 85 49 __ STA T4 + 0 
526b : 85 1b __ STA ACCU + 0 
526d : a9 00 __ LDA #$00
526f : 85 1c __ STA ACCU + 1 
5271 : a5 18 __ LDA P11 ; (width + 0)
5273 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
5276 : a5 05 __ LDA WORK + 2 
5278 : 85 4a __ STA T5 + 0 
527a : 0a __ __ ASL
527b : 85 4c __ STA T6 + 0 
527d : a5 06 __ LDA WORK + 3 
527f : 85 4b __ STA T5 + 1 
5281 : 2a __ __ ROL
5282 : 06 4c __ ASL T6 + 0 
5284 : 2a __ __ ROL
5285 : 85 4d __ STA T6 + 1 
5287 : ad dd 87 LDA $87dd ; (undoaddress + 0)
528a : 18 __ __ CLC
528b : 65 4c __ ADC T6 + 0 
528d : aa __ __ TAX
528e : ad de 87 LDA $87de ; (undoaddress + 1)
5291 : 65 4d __ ADC T6 + 1 
5293 : cd de 87 CMP $87de ; (undoaddress + 1)
5296 : d0 03 __ BNE $529b ; (undo_new.s1009 + 0)
.s1008:
5298 : ec dd 87 CPX $87dd ; (undoaddress + 0)
.s1009:
529b : b0 11 __ BCS $52ae ; (undo_new.s9 + 0)
.s7:
529d : a9 01 __ LDA #$01
529f : 8d df 87 STA $87df ; (undonumber + 0)
52a2 : ad c1 87 LDA $87c1 ; (vdc_state + 20)
52a5 : 8d dd 87 STA $87dd ; (undoaddress + 0)
52a8 : ad c2 87 LDA $87c2 ; (vdc_state + 21)
52ab : 8d de 87 STA $87de ; (undoaddress + 1)
.s9:
52ae : a9 00 __ LDA #$00
52b0 : 85 52 __ STA T9 + 0 
52b2 : ad dd 87 LDA $87dd ; (undoaddress + 0)
52b5 : 18 __ __ CLC
52b6 : 65 4c __ ADC T6 + 0 
52b8 : 85 4c __ STA T6 + 0 
52ba : ad de 87 LDA $87de ; (undoaddress + 1)
52bd : 65 4d __ ADC T6 + 1 
52bf : 85 4d __ STA T6 + 1 
52c1 : a9 ff __ LDA #$ff
52c3 : 4d c1 87 EOR $87c1 ; (vdc_state + 20)
52c6 : aa __ __ TAX
52c7 : a9 ff __ LDA #$ff
52c9 : 4d c2 87 EOR $87c2 ; (vdc_state + 21)
52cc : c5 4d __ CMP T6 + 1 
52ce : d0 02 __ BNE $52d2 ; (undo_new.s1007 + 0)
.s1006:
52d0 : e4 4c __ CPX T6 + 0 
.s1007:
52d2 : b0 02 __ BCS $52d6 ; (undo_new.s12 + 0)
.s10:
52d4 : c6 44 __ DEC T1 + 0 
.s12:
52d6 : a5 49 __ LDA T4 + 0 
52d8 : f0 16 __ BEQ $52f0 ; (undo_new.s16 + 0)
.s24:
52da : a5 17 __ LDA P10 ; (col + 0)
52dc : 85 45 __ STA T2 + 0 
52de : a5 16 __ LDA P9 ; (row + 0)
52e0 : 85 4c __ STA T6 + 0 
52e2 : a9 7f __ LDA #$7f
52e4 : 85 11 __ STA P4 
52e6 : a5 18 __ LDA P11 ; (width + 0)
52e8 : 85 14 __ STA P7 
52ea : a9 00 __ LDA #$00
52ec : 18 __ __ CLC
52ed : 4c 7d 53 JMP $537d ; (undo_new.l1016 + 0)
.s16:
52f0 : ad df 87 LDA $87df ; (undonumber + 0)
52f3 : 85 52 __ STA T9 + 0 
52f5 : 0a __ __ ASL
52f6 : 0a __ __ ASL
52f7 : 0a __ __ ASL
52f8 : a2 00 __ LDX #$00
52fa : 90 01 __ BCC $52fd ; (undo_new.s1021 + 0)
.s1020:
52fc : e8 __ __ INX
.s1021:
52fd : 38 __ __ SEC
52fe : e5 52 __ SBC T9 + 0 
5300 : b0 01 __ BCS $5303 ; (undo_new.s1023 + 0)
.s1022:
5302 : ca __ __ DEX
.s1023:
5303 : 18 __ __ CLC
5304 : 69 9b __ ADC #$9b
5306 : 85 45 __ STA T2 + 0 
5308 : 8a __ __ TXA
5309 : 69 89 __ ADC #$89
530b : 85 46 __ STA T2 + 1 
530d : ad de 87 LDA $87de ; (undoaddress + 1)
5310 : 85 48 __ STA T3 + 1 
5312 : ad dd 87 LDA $87dd ; (undoaddress + 0)
5315 : 85 47 __ STA T3 + 0 
5317 : a0 00 __ LDY #$00
5319 : 91 45 __ STA (T2 + 0),y 
531b : a5 48 __ LDA T3 + 1 
531d : c8 __ __ INY
531e : 91 45 __ STA (T2 + 0),y 
5320 : a5 4a __ LDA T5 + 0 
5322 : 85 1b __ STA ACCU + 0 
5324 : a5 4b __ LDA T5 + 1 
5326 : 85 1c __ STA ACCU + 1 
5328 : a5 44 __ LDA T1 + 0 
532a : 0a __ __ ASL
532b : 18 __ __ CLC
532c : 69 02 __ ADC #$02
532e : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
5331 : 18 __ __ CLC
5332 : a5 05 __ LDA WORK + 2 
5334 : 65 47 __ ADC T3 + 0 
5336 : 8d dd 87 STA $87dd ; (undoaddress + 0)
5339 : a5 06 __ LDA WORK + 3 
533b : 65 48 __ ADC T3 + 1 
533d : 8d de 87 STA $87de ; (undoaddress + 1)
5340 : a5 52 __ LDA T9 + 0 
5342 : c9 28 __ CMP #$28
5344 : a9 00 __ LDA #$00
5346 : b0 09 __ BCS $5351 ; (undo_new.s22 + 0)
.s21:
5348 : a0 07 __ LDY #$07
534a : 91 45 __ STA (T2 + 0),y 
534c : c8 __ __ INY
534d : 91 45 __ STA (T2 + 0),y 
534f : 90 06 __ BCC $5357 ; (undo_new.s23 + 0)
.s22:
5351 : 8d a2 89 STA $89a2 ; (Undo + 0)
5354 : 8d a3 89 STA $89a3 ; (Undo + 1)
.s23:
5357 : a5 49 __ LDA T4 + 0 
5359 : a0 04 __ LDY #$04
535b : 91 45 __ STA (T2 + 0),y 
535d : a5 18 __ LDA P11 ; (width + 0)
535f : c8 __ __ INY
5360 : 91 45 __ STA (T2 + 0),y 
5362 : a5 44 __ LDA T1 + 0 
5364 : c8 __ __ INY
5365 : 91 45 __ STA (T2 + 0),y 
5367 : a5 17 __ LDA P10 ; (col + 0)
5369 : a0 03 __ LDY #$03
536b : 91 45 __ STA (T2 + 0),y 
536d : a5 16 __ LDA P9 ; (row + 0)
536f : 88 __ __ DEY
5370 : 91 45 __ STA (T2 + 0),y 
.s1001:
5372 : a2 03 __ LDX #$03
5374 : bd ec ab LDA $abec,x ; (vp_fill + 31)
5377 : 95 53 __ STA T11 + 0,x 
5379 : ca __ __ DEX
537a : 10 f8 __ BPL $5374 ; (undo_new.s1001 + 2)
537c : 60 __ __ RTS
.l1016:
537d : 65 4c __ ADC T6 + 0 
537f : 85 03 __ STA WORK + 0 
5381 : a9 00 __ LDA #$00
5383 : 85 15 __ STA P8 
5385 : 2a __ __ ROL
5386 : 85 04 __ STA WORK + 1 
5388 : ad c9 87 LDA $87c9 ; (canvas + 3)
538b : 85 53 __ STA T11 + 0 
538d : 85 1b __ STA ACCU + 0 
538f : ad ca 87 LDA $87ca ; (canvas + 4)
5392 : 85 54 __ STA T11 + 1 
5394 : 85 1c __ STA ACCU + 1 
5396 : 20 87 7c JSR $7c87 ; (mul16 + 0)
5399 : 18 __ __ CLC
539a : a5 05 __ LDA WORK + 2 
539c : 65 45 __ ADC T2 + 0 
539e : 85 50 __ STA T8 + 0 
53a0 : 85 12 __ STA P5 
53a2 : a5 06 __ LDA WORK + 3 
53a4 : 69 58 __ ADC #$58
53a6 : 85 51 __ STA T8 + 1 
53a8 : 85 13 __ STA P6 
53aa : a5 52 __ LDA T9 + 0 
53ac : 85 1b __ STA ACCU + 0 
53ae : a9 00 __ LDA #$00
53b0 : 85 1c __ STA ACCU + 1 
53b2 : a5 14 __ LDA P7 
53b4 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
53b7 : a5 05 __ LDA WORK + 2 
53b9 : 85 4e __ STA T7 + 0 
53bb : a5 06 __ LDA WORK + 3 
53bd : 85 4f __ STA T7 + 1 
53bf : ad dd 87 LDA $87dd ; (undoaddress + 0)
53c2 : 85 55 __ STA T12 + 0 
53c4 : 18 __ __ CLC
53c5 : 65 05 __ ADC WORK + 2 
53c7 : 85 0f __ STA P2 
53c9 : ad de 87 LDA $87de ; (undoaddress + 1)
53cc : 85 56 __ STA T12 + 1 
53ce : 65 06 __ ADC WORK + 3 
53d0 : 85 10 __ STA P3 
53d2 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
53d5 : a9 00 __ LDA #$00
53d7 : 85 15 __ STA P8 
53d9 : ad cb 87 LDA $87cb ; (canvas + 5)
53dc : 85 1b __ STA ACCU + 0 
53de : ad cc 87 LDA $87cc ; (canvas + 6)
53e1 : 85 1c __ STA ACCU + 1 
53e3 : a5 53 __ LDA T11 + 0 
53e5 : 85 03 __ STA WORK + 0 
53e7 : a5 54 __ LDA T11 + 1 
53e9 : 85 04 __ STA WORK + 1 
53eb : 20 87 7c JSR $7c87 ; (mul16 + 0)
53ee : 18 __ __ CLC
53ef : a5 05 __ LDA WORK + 2 
53f1 : 65 50 __ ADC T8 + 0 
53f3 : aa __ __ TAX
53f4 : a5 06 __ LDA WORK + 3 
53f6 : 65 51 __ ADC T8 + 1 
53f8 : a8 __ __ TAY
53f9 : 8a __ __ TXA
53fa : 18 __ __ CLC
53fb : 69 30 __ ADC #$30
53fd : 85 12 __ STA P5 
53ff : 90 01 __ BCC $5402 ; (undo_new.s1019 + 0)
.s1018:
5401 : c8 __ __ INY
.s1019:
5402 : 84 13 __ STY P6 
5404 : 18 __ __ CLC
5405 : a5 4a __ LDA T5 + 0 
5407 : 65 55 __ ADC T12 + 0 
5409 : a8 __ __ TAY
540a : a5 4b __ LDA T5 + 1 
540c : 65 56 __ ADC T12 + 1 
540e : aa __ __ TAX
540f : 98 __ __ TYA
5410 : 18 __ __ CLC
5411 : 65 4e __ ADC T7 + 0 
5413 : 85 0f __ STA P2 
5415 : 8a __ __ TXA
5416 : 65 4f __ ADC T7 + 1 
5418 : 85 10 __ STA P3 
541a : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
541d : e6 52 __ INC T9 + 0 
541f : a5 52 __ LDA T9 + 0 
5421 : c5 49 __ CMP T4 + 0 
5423 : b0 03 __ BCS $5428 ; (undo_new.s1019 + 38)
5425 : 4c 7d 53 JMP $537d ; (undo_new.l1016 + 0)
5428 : 4c f0 52 JMP $52f0 ; (undo_new.s16 + 0)
--------------------------------------------------------------------
screenmapplot: ; screenmapplot(u8,u8,u8,u8)->void
.s0:
542b : ad c9 87 LDA $87c9 ; (canvas + 3)
542e : 85 1b __ STA ACCU + 0 
5430 : ad ca 87 LDA $87ca ; (canvas + 4)
5433 : 85 1c __ STA ACCU + 1 
5435 : a5 10 __ LDA P3 ; (row + 0)
5437 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
543a : 18 __ __ CLC
543b : a5 05 __ LDA WORK + 2 
543d : 65 11 __ ADC P4 ; (col + 0)
543f : 85 0d __ STA P0 
5441 : a5 06 __ LDA WORK + 3 
5443 : 69 58 __ ADC #$58
5445 : 85 0e __ STA P1 
5447 : a5 12 __ LDA P5 ; (screencode + 0)
5449 : 85 0f __ STA P2 
544b : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
544e : ad c9 87 LDA $87c9 ; (canvas + 3)
5451 : 85 1b __ STA ACCU + 0 
5453 : ad ca 87 LDA $87ca ; (canvas + 4)
5456 : 85 1c __ STA ACCU + 1 
5458 : a5 10 __ LDA P3 ; (row + 0)
545a : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
545d : 18 __ __ CLC
545e : a5 05 __ LDA WORK + 2 
5460 : 65 11 __ ADC P4 ; (col + 0)
5462 : 85 43 __ STA T1 + 0 
5464 : a5 06 __ LDA WORK + 3 
5466 : 69 58 __ ADC #$58
5468 : 85 44 __ STA T1 + 1 
546a : ad cb 87 LDA $87cb ; (canvas + 5)
546d : 85 1b __ STA ACCU + 0 
546f : ad cc 87 LDA $87cc ; (canvas + 6)
5472 : 85 1c __ STA ACCU + 1 
5474 : ad c9 87 LDA $87c9 ; (canvas + 3)
5477 : 85 03 __ STA WORK + 0 
5479 : ad ca 87 LDA $87ca ; (canvas + 4)
547c : 85 04 __ STA WORK + 1 
547e : 20 87 7c JSR $7c87 ; (mul16 + 0)
5481 : 18 __ __ CLC
5482 : a5 05 __ LDA WORK + 2 
5484 : 65 43 __ ADC T1 + 0 
5486 : a8 __ __ TAY
5487 : a5 06 __ LDA WORK + 3 
5489 : 65 44 __ ADC T1 + 1 
548b : aa __ __ TAX
548c : 98 __ __ TYA
548d : 18 __ __ CLC
548e : 69 30 __ ADC #$30
5490 : 85 0d __ STA P0 
5492 : 90 01 __ BCC $5495 ; (screenmapplot.s1003 + 0)
.s1002:
5494 : e8 __ __ INX
.s1003:
5495 : 86 0e __ STX P1 
5497 : a5 13 __ LDA P6 ; (attribute + 0)
5499 : 85 0f __ STA P2 
549b : 4c 14 15 JMP $1514 ; (bnk_writeb.s0 + 0)
--------------------------------------------------------------------
undo_performundo: ; undo_performundo()->void
.s1000:
549e : a2 15 __ LDX #$15
54a0 : b5 53 __ LDA T0 + 0,x 
54a2 : 9d b5 ab STA $abb5,x ; (projbuffer + 29)
54a5 : ca __ __ DEX
54a6 : 10 f8 __ BPL $54a0 ; (undo_performundo.s1000 + 2)
.s0:
54a8 : ad e0 87 LDA $87e0 ; (undo_undopossible + 0)
54ab : d0 0e __ BNE $54bb ; (undo_performundo.s1 + 0)
.s1001:
54ad : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
54b0 : a2 15 __ LDX #$15
54b2 : bd b5 ab LDA $abb5,x ; (projbuffer + 29)
54b5 : 95 53 __ STA T0 + 0,x 
54b7 : ca __ __ DEX
54b8 : 10 f8 __ BPL $54b2 ; (undo_performundo.s1001 + 5)
54ba : 60 __ __ RTS
.s1:
54bb : ad df 87 LDA $87df ; (undonumber + 0)
54be : 0a __ __ ASL
54bf : 0a __ __ ASL
54c0 : 0a __ __ ASL
54c1 : a2 00 __ LDX #$00
54c3 : 90 01 __ BCC $54c6 ; (undo_performundo.s1006 + 0)
.s1005:
54c5 : e8 __ __ INX
.s1006:
54c6 : 38 __ __ SEC
54c7 : ed df 87 SBC $87df ; (undonumber + 0)
54ca : b0 01 __ BCS $54cd ; (undo_performundo.s1008 + 0)
.s1007:
54cc : ca __ __ DEX
.s1008:
54cd : 18 __ __ CLC
54ce : 69 9b __ ADC #$9b
54d0 : 85 54 __ STA T1 + 0 
54d2 : 8a __ __ TXA
54d3 : 69 89 __ ADC #$89
54d5 : 85 55 __ STA T1 + 1 
54d7 : a0 04 __ LDY #$04
54d9 : b1 54 __ LDA (T1 + 0),y 
54db : f0 2c __ BEQ $5509 ; (undo_performundo.s7 + 0)
.s39:
54dd : 85 53 __ STA T0 + 0 
54df : 85 1b __ STA ACCU + 0 
54e1 : c8 __ __ INY
54e2 : b1 54 __ LDA (T1 + 0),y 
54e4 : 85 56 __ STA T2 + 0 
54e6 : 85 57 __ STA T3 + 0 
54e8 : a9 00 __ LDA #$00
54ea : 85 5a __ STA T5 + 0 
54ec : 85 1c __ STA ACCU + 1 
54ee : a5 56 __ LDA T2 + 0 
54f0 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
54f3 : a5 05 __ LDA WORK + 2 
54f5 : 85 58 __ STA T4 + 0 
54f7 : a5 06 __ LDA WORK + 3 
54f9 : 85 59 __ STA T4 + 1 
54fb : a0 03 __ LDY #$03
54fd : b1 54 __ LDA (T1 + 0),y 
54ff : 85 5b __ STA T6 + 0 
5501 : 88 __ __ DEY
5502 : b1 54 __ LDA (T1 + 0),y 
5504 : 85 5c __ STA T7 + 0 
5506 : 4c a6 55 JMP $55a6 ; (undo_performundo.l5 + 0)
.s7:
5509 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
550c : ad ff 87 LDA $87ff ; (showbar + 0)
550f : f0 03 __ BEQ $5514 ; (undo_performundo.s21 + 0)
.s19:
5511 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s21:
5514 : ad df 87 LDA $87df ; (undonumber + 0)
5517 : 85 53 __ STA T0 + 0 
5519 : 0a __ __ ASL
551a : 0a __ __ ASL
551b : 0a __ __ ASL
551c : a2 00 __ LDX #$00
551e : 90 01 __ BCC $5521 ; (undo_performundo.s1014 + 0)
.s1013:
5520 : e8 __ __ INX
.s1014:
5521 : 38 __ __ SEC
5522 : e5 53 __ SBC T0 + 0 
5524 : b0 01 __ BCS $5527 ; (undo_performundo.s1016 + 0)
.s1015:
5526 : ca __ __ DEX
.s1016:
5527 : 18 __ __ CLC
5528 : 69 9b __ ADC #$9b
552a : 85 54 __ STA T1 + 0 
552c : 8a __ __ TXA
552d : 69 89 __ ADC #$89
552f : 85 55 __ STA T1 + 1 
5531 : a0 00 __ LDY #$00
5533 : b1 54 __ LDA (T1 + 0),y 
5535 : 8d dd 87 STA $87dd ; (undoaddress + 0)
5538 : c8 __ __ INY
5539 : b1 54 __ LDA (T1 + 0),y 
553b : 8d de 87 STA $87de ; (undoaddress + 1)
553e : c6 53 __ DEC T0 + 0 
5540 : a5 53 __ LDA T0 + 0 
5542 : 8d df 87 STA $87df ; (undonumber + 0)
5545 : a0 06 __ LDY #$06
5547 : b1 54 __ LDA (T1 + 0),y 
5549 : f0 07 __ BEQ $5552 ; (undo_performundo.s24 + 0)
.s22:
554b : a9 02 __ LDA #$02
554d : 91 54 __ STA (T1 + 0),y 
554f : ee e1 87 INC $87e1 ; (undo_redopossible + 0)
.s24:
5552 : ce e0 87 DEC $87e0 ; (undo_undopossible + 0)
5555 : a5 53 __ LDA T0 + 0 
5557 : d0 0d __ BNE $5566 ; (undo_performundo.s27 + 0)
.s25:
5559 : ad b3 8a LDA $8ab3 ; (Undo + 273)
555c : 0d b4 8a ORA $8ab4 ; (Undo + 274)
555f : f0 05 __ BEQ $5566 ; (undo_performundo.s27 + 0)
.s28:
5561 : a9 28 __ LDA #$28
5563 : 8d df 87 STA $87df ; (undonumber + 0)
.s27:
5566 : ad df 87 LDA $87df ; (undonumber + 0)
5569 : f0 2a __ BEQ $5595 ; (undo_performundo.s38 + 0)
.s34:
556b : 0a __ __ ASL
556c : 0a __ __ ASL
556d : 0a __ __ ASL
556e : a2 00 __ LDX #$00
5570 : 90 01 __ BCC $5573 ; (undo_performundo.s1018 + 0)
.s1017:
5572 : e8 __ __ INX
.s1018:
5573 : 38 __ __ SEC
5574 : ed df 87 SBC $87df ; (undonumber + 0)
5577 : b0 01 __ BCS $557a ; (undo_performundo.s1020 + 0)
.s1019:
5579 : ca __ __ DEX
.s1020:
557a : 18 __ __ CLC
557b : 69 9b __ ADC #$9b
557d : 85 54 __ STA T1 + 0 
557f : 8a __ __ TXA
5580 : 69 89 __ ADC #$89
5582 : 85 55 __ STA T1 + 1 
5584 : a0 00 __ LDY #$00
5586 : b1 54 __ LDA (T1 + 0),y 
5588 : c8 __ __ INY
5589 : 11 54 __ ORA (T1 + 0),y 
558b : f0 13 __ BEQ $55a0 ; (undo_performundo.s1004 + 0)
.s33:
558d : ad df 87 LDA $87df ; (undonumber + 0)
5590 : f0 03 __ BEQ $5595 ; (undo_performundo.s38 + 0)
5592 : 4c ad 54 JMP $54ad ; (undo_performundo.s1001 + 0)
.s38:
5595 : ad b3 8a LDA $8ab3 ; (Undo + 273)
5598 : 0d b4 8a ORA $8ab4 ; (Undo + 274)
559b : f0 03 __ BEQ $55a0 ; (undo_performundo.s1004 + 0)
559d : 4c ad 54 JMP $54ad ; (undo_performundo.s1001 + 0)
.s1004:
55a0 : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
55a3 : 4c ad 54 JMP $54ad ; (undo_performundo.s1001 + 0)
.l5:
55a6 : a0 06 __ LDY #$06
55a8 : b1 54 __ LDA (T1 + 0),y 
55aa : f0 03 __ BEQ $55af ; (undo_performundo.s10 + 0)
55ac : 4c 84 56 JMP $5684 ; (undo_performundo.s8 + 0)
.s10:
55af : a9 7f __ LDA #$7f
55b1 : 85 0d __ STA P0 
55b3 : 18 __ __ CLC
55b4 : a5 5a __ LDA T5 + 0 
55b6 : 65 5c __ ADC T7 + 0 
55b8 : 85 5f __ STA T10 + 0 
55ba : 85 03 __ STA WORK + 0 
55bc : a9 00 __ LDA #$00
55be : 85 13 __ STA P6 
55c0 : 2a __ __ ROL
55c1 : 85 60 __ STA T10 + 1 
55c3 : 85 04 __ STA WORK + 1 
55c5 : ad c9 87 LDA $87c9 ; (canvas + 3)
55c8 : 85 1b __ STA ACCU + 0 
55ca : ad ca 87 LDA $87ca ; (canvas + 4)
55cd : 85 1c __ STA ACCU + 1 
55cf : 20 87 7c JSR $7c87 ; (mul16 + 0)
55d2 : 18 __ __ CLC
55d3 : a5 05 __ LDA WORK + 2 
55d5 : 65 5b __ ADC T6 + 0 
55d7 : 85 0e __ STA P1 
55d9 : a5 06 __ LDA WORK + 3 
55db : 69 58 __ ADC #$58
55dd : 85 0f __ STA P2 
55df : a5 5a __ LDA T5 + 0 
55e1 : 85 1b __ STA ACCU + 0 
55e3 : a9 00 __ LDA #$00
55e5 : 85 1c __ STA ACCU + 1 
55e7 : a5 57 __ LDA T3 + 0 
55e9 : 85 12 __ STA P5 
55eb : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
55ee : a5 05 __ LDA WORK + 2 
55f0 : 85 5d __ STA T8 + 0 
55f2 : a5 06 __ LDA WORK + 3 
55f4 : 85 5e __ STA T8 + 1 
55f6 : 18 __ __ CLC
55f7 : a0 00 __ LDY #$00
55f9 : b1 54 __ LDA (T1 + 0),y 
55fb : 65 05 __ ADC WORK + 2 
55fd : 85 10 __ STA P3 
55ff : c8 __ __ INY
5600 : b1 54 __ LDA (T1 + 0),y 
5602 : 65 06 __ ADC WORK + 3 
5604 : 85 11 __ STA P4 
5606 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
5609 : ad c9 87 LDA $87c9 ; (canvas + 3)
560c : 85 1b __ STA ACCU + 0 
560e : ad ca 87 LDA $87ca ; (canvas + 4)
5611 : 85 1c __ STA ACCU + 1 
5613 : a5 5f __ LDA T10 + 0 
5615 : 85 03 __ STA WORK + 0 
5617 : a5 60 __ LDA T10 + 1 
5619 : 85 04 __ STA WORK + 1 
561b : 20 87 7c JSR $7c87 ; (mul16 + 0)
561e : 18 __ __ CLC
561f : a5 05 __ LDA WORK + 2 
5621 : 65 5b __ ADC T6 + 0 
5623 : 85 5f __ STA T10 + 0 
5625 : a5 06 __ LDA WORK + 3 
5627 : 69 58 __ ADC #$58
5629 : 85 60 __ STA T10 + 1 
562b : ad cb 87 LDA $87cb ; (canvas + 5)
562e : 85 1b __ STA ACCU + 0 
5630 : ad cc 87 LDA $87cc ; (canvas + 6)
5633 : 85 1c __ STA ACCU + 1 
5635 : ad c9 87 LDA $87c9 ; (canvas + 3)
5638 : 85 03 __ STA WORK + 0 
563a : ad ca 87 LDA $87ca ; (canvas + 4)
563d : 85 04 __ STA WORK + 1 
563f : 20 87 7c JSR $7c87 ; (mul16 + 0)
5642 : 18 __ __ CLC
5643 : a5 05 __ LDA WORK + 2 
5645 : 65 5f __ ADC T10 + 0 
5647 : aa __ __ TAX
5648 : a5 06 __ LDA WORK + 3 
564a : 65 60 __ ADC T10 + 1 
564c : a8 __ __ TAY
564d : 8a __ __ TXA
564e : 18 __ __ CLC
564f : 69 30 __ ADC #$30
5651 : 85 0e __ STA P1 
5653 : 90 01 __ BCC $5656 ; (undo_performundo.s1012 + 0)
.s1011:
5655 : c8 __ __ INY
.s1012:
5656 : 84 0f __ STY P2 
5658 : a0 00 __ LDY #$00
565a : 84 13 __ STY P6 
565c : b1 54 __ LDA (T1 + 0),y 
565e : 18 __ __ CLC
565f : 65 58 __ ADC T4 + 0 
5661 : aa __ __ TAX
5662 : c8 __ __ INY
5663 : b1 54 __ LDA (T1 + 0),y 
5665 : 65 59 __ ADC T4 + 1 
5667 : a8 __ __ TAY
5668 : 8a __ __ TXA
5669 : 18 __ __ CLC
566a : 65 5d __ ADC T8 + 0 
566c : 85 10 __ STA P3 
566e : 98 __ __ TYA
566f : 65 5e __ ADC T8 + 1 
5671 : 85 11 __ STA P4 
5673 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
5676 : e6 5a __ INC T5 + 0 
5678 : a5 5a __ LDA T5 + 0 
567a : c5 53 __ CMP T0 + 0 
567c : b0 03 __ BCS $5681 ; (undo_performundo.s1012 + 43)
567e : 4c a6 55 JMP $55a6 ; (undo_performundo.l5 + 0)
5681 : 4c 09 55 JMP $5509 ; (undo_performundo.s7 + 0)
.s8:
5684 : a9 7f __ LDA #$7f
5686 : 85 11 __ STA P4 
5688 : 18 __ __ CLC
5689 : a5 5c __ LDA T7 + 0 
568b : 65 5a __ ADC T5 + 0 
568d : 85 03 __ STA WORK + 0 
568f : a9 00 __ LDA #$00
5691 : 2a __ __ ROL
5692 : 85 04 __ STA WORK + 1 
5694 : ad c9 87 LDA $87c9 ; (canvas + 3)
5697 : 85 61 __ STA T11 + 0 
5699 : 85 1b __ STA ACCU + 0 
569b : ad ca 87 LDA $87ca ; (canvas + 4)
569e : 85 62 __ STA T11 + 1 
56a0 : 85 1c __ STA ACCU + 1 
56a2 : 20 87 7c JSR $7c87 ; (mul16 + 0)
56a5 : 18 __ __ CLC
56a6 : a5 05 __ LDA WORK + 2 
56a8 : 65 5b __ ADC T6 + 0 
56aa : 85 5f __ STA T10 + 0 
56ac : 85 12 __ STA P5 
56ae : a5 06 __ LDA WORK + 3 
56b0 : 69 58 __ ADC #$58
56b2 : 85 60 __ STA T10 + 1 
56b4 : 85 13 __ STA P6 
56b6 : a9 00 __ LDA #$00
56b8 : 85 15 __ STA P8 
56ba : 85 1c __ STA ACCU + 1 
56bc : a5 53 __ LDA T0 + 0 
56be : 85 1b __ STA ACCU + 0 
56c0 : a5 56 __ LDA T2 + 0 
56c2 : 85 14 __ STA P7 
56c4 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
56c7 : a5 05 __ LDA WORK + 2 
56c9 : 85 63 __ STA T13 + 0 
56cb : 0a __ __ ASL
56cc : 85 44 __ STA T14 + 0 
56ce : a5 06 __ LDA WORK + 3 
56d0 : 85 64 __ STA T13 + 1 
56d2 : 2a __ __ ROL
56d3 : 85 45 __ STA T14 + 1 
56d5 : a0 00 __ LDY #$00
56d7 : 84 1c __ STY ACCU + 1 
56d9 : b1 54 __ LDA (T1 + 0),y 
56db : 85 65 __ STA T15 + 0 
56dd : 18 __ __ CLC
56de : 65 44 __ ADC T14 + 0 
56e0 : 85 44 __ STA T14 + 0 
56e2 : c8 __ __ INY
56e3 : b1 54 __ LDA (T1 + 0),y 
56e5 : 85 66 __ STA T15 + 1 
56e7 : 65 45 __ ADC T14 + 1 
56e9 : 85 45 __ STA T14 + 1 
56eb : a5 5a __ LDA T5 + 0 
56ed : 85 1b __ STA ACCU + 0 
56ef : a5 14 __ LDA P7 
56f1 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
56f4 : a5 05 __ LDA WORK + 2 
56f6 : 85 67 __ STA T16 + 0 
56f8 : 18 __ __ CLC
56f9 : 65 44 __ ADC T14 + 0 
56fb : 85 0f __ STA P2 
56fd : a5 06 __ LDA WORK + 3 
56ff : 85 68 __ STA T16 + 1 
5701 : 65 45 __ ADC T14 + 1 
5703 : 85 10 __ STA P3 
5705 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
5708 : a9 00 __ LDA #$00
570a : 85 15 __ STA P8 
570c : ad cb 87 LDA $87cb ; (canvas + 5)
570f : 85 1b __ STA ACCU + 0 
5711 : ad cc 87 LDA $87cc ; (canvas + 6)
5714 : 85 1c __ STA ACCU + 1 
5716 : a5 61 __ LDA T11 + 0 
5718 : 85 03 __ STA WORK + 0 
571a : a5 62 __ LDA T11 + 1 
571c : 85 04 __ STA WORK + 1 
571e : 20 87 7c JSR $7c87 ; (mul16 + 0)
5721 : 18 __ __ CLC
5722 : a5 05 __ LDA WORK + 2 
5724 : 65 5f __ ADC T10 + 0 
5726 : aa __ __ TAX
5727 : a5 06 __ LDA WORK + 3 
5729 : 65 60 __ ADC T10 + 1 
572b : a8 __ __ TAY
572c : 8a __ __ TXA
572d : 18 __ __ CLC
572e : 69 30 __ ADC #$30
5730 : 85 12 __ STA P5 
5732 : 90 01 __ BCC $5735 ; (undo_performundo.s1010 + 0)
.s1009:
5734 : c8 __ __ INY
.s1010:
5735 : 84 13 __ STY P6 
5737 : a5 63 __ LDA T13 + 0 
5739 : 0a __ __ ASL
573a : a8 __ __ TAY
573b : a5 64 __ LDA T13 + 1 
573d : 2a __ __ ROL
573e : aa __ __ TAX
573f : 98 __ __ TYA
5740 : 18 __ __ CLC
5741 : 65 63 __ ADC T13 + 0 
5743 : a8 __ __ TAY
5744 : 8a __ __ TXA
5745 : 65 64 __ ADC T13 + 1 
5747 : aa __ __ TAX
5748 : 98 __ __ TYA
5749 : 18 __ __ CLC
574a : 65 65 __ ADC T15 + 0 
574c : a8 __ __ TAY
574d : 8a __ __ TXA
574e : 65 66 __ ADC T15 + 1 
5750 : aa __ __ TAX
5751 : 98 __ __ TYA
5752 : 18 __ __ CLC
5753 : 65 67 __ ADC T16 + 0 
5755 : 85 0f __ STA P2 
5757 : 8a __ __ TXA
5758 : 65 68 __ ADC T16 + 1 
575a : 85 10 __ STA P3 
575c : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
575f : 4c af 55 JMP $55af ; (undo_performundo.s10 + 0)
--------------------------------------------------------------------
undo_performredo: ; undo_performredo()->void
.s1000:
5762 : a2 0f __ LDX #$0f
5764 : b5 53 __ LDA T0 + 0,x 
5766 : 9d bd ab STA $abbd,x ; (projbuffer + 37)
5769 : ca __ __ DEX
576a : 10 f8 __ BPL $5764 ; (undo_performredo.s1000 + 2)
.s0:
576c : ad e1 87 LDA $87e1 ; (undo_redopossible + 0)
576f : d0 0e __ BNE $577f ; (undo_performredo.s1 + 0)
.s1001:
5771 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
5774 : a2 0f __ LDX #$0f
5776 : bd bd ab LDA $abbd,x ; (projbuffer + 37)
5779 : 95 53 __ STA T0 + 0,x 
577b : ca __ __ DEX
577c : 10 f8 __ BPL $5776 ; (undo_performredo.s1001 + 5)
577e : 60 __ __ RTS
.s1:
577f : 85 53 __ STA T0 + 0 
5781 : ad df 87 LDA $87df ; (undonumber + 0)
5784 : c9 27 __ CMP #$27
5786 : 90 04 __ BCC $578c ; (undo_performredo.s4 + 0)
.s5:
5788 : a9 01 __ LDA #$01
578a : b0 02 __ BCS $578e ; (undo_performredo.s6 + 0)
.s4:
578c : 69 01 __ ADC #$01
.s6:
578e : 8d df 87 STA $87df ; (undonumber + 0)
5791 : 0a __ __ ASL
5792 : 0a __ __ ASL
5793 : 0a __ __ ASL
5794 : a2 00 __ LDX #$00
5796 : 90 01 __ BCC $5799 ; (undo_performredo.s1018 + 0)
.s1017:
5798 : e8 __ __ INX
.s1018:
5799 : 38 __ __ SEC
579a : ed df 87 SBC $87df ; (undonumber + 0)
579d : b0 01 __ BCS $57a0 ; (undo_performredo.s1020 + 0)
.s1019:
579f : ca __ __ DEX
.s1020:
57a0 : 18 __ __ CLC
57a1 : 69 9b __ ADC #$9b
57a3 : 85 56 __ STA T3 + 0 
57a5 : 8a __ __ TXA
57a6 : 69 89 __ ADC #$89
57a8 : 85 57 __ STA T3 + 1 
57aa : a0 04 __ LDY #$04
57ac : b1 56 __ LDA (T3 + 0),y 
57ae : f0 41 __ BEQ $57f1 ; (undo_performredo.s10 + 0)
.s26:
57b0 : 85 54 __ STA T1 + 0 
57b2 : 85 1b __ STA ACCU + 0 
57b4 : a9 00 __ LDA #$00
57b6 : 85 55 __ STA T2 + 0 
57b8 : 85 1c __ STA ACCU + 1 
57ba : c8 __ __ INY
57bb : b1 56 __ LDA (T3 + 0),y 
57bd : 85 12 __ STA P5 
57bf : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
57c2 : a5 05 __ LDA WORK + 2 
57c4 : 85 58 __ STA T5 + 0 
57c6 : 0a __ __ ASL
57c7 : a8 __ __ TAY
57c8 : a5 06 __ LDA WORK + 3 
57ca : 85 59 __ STA T5 + 1 
57cc : 2a __ __ ROL
57cd : aa __ __ TAX
57ce : 98 __ __ TYA
57cf : 18 __ __ CLC
57d0 : 65 05 __ ADC WORK + 2 
57d2 : 85 5a __ STA T6 + 0 
57d4 : 8a __ __ TXA
57d5 : 65 06 __ ADC WORK + 3 
57d7 : 85 5b __ STA T6 + 1 
57d9 : 06 58 __ ASL T5 + 0 
57db : 26 59 __ ROL T5 + 1 
57dd : a0 02 __ LDY #$02
57df : b1 56 __ LDA (T3 + 0),y 
57e1 : 85 5c __ STA T7 + 0 
57e3 : c8 __ __ INY
57e4 : b1 56 __ LDA (T3 + 0),y 
57e6 : 85 56 __ STA T3 + 0 
57e8 : a9 7f __ LDA #$7f
57ea : 85 0d __ STA P0 
57ec : a9 00 __ LDA #$00
57ee : 18 __ __ CLC
57ef : 90 62 __ BCC $5853 ; (undo_performredo.l1015 + 0)
.s10:
57f1 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
57f4 : ad ff 87 LDA $87ff ; (showbar + 0)
57f7 : f0 03 __ BEQ $57fc ; (undo_performredo.s17 + 0)
.s15:
57f9 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s17:
57fc : ad df 87 LDA $87df ; (undonumber + 0)
57ff : 0a __ __ ASL
5800 : 0a __ __ ASL
5801 : 0a __ __ ASL
5802 : a2 00 __ LDX #$00
5804 : 90 01 __ BCC $5807 ; (undo_performredo.s1028 + 0)
.s1027:
5806 : e8 __ __ INX
.s1028:
5807 : 38 __ __ SEC
5808 : ed df 87 SBC $87df ; (undonumber + 0)
580b : b0 01 __ BCS $580e ; (undo_performredo.s1030 + 0)
.s1029:
580d : ca __ __ DEX
.s1030:
580e : 18 __ __ CLC
580f : 69 9b __ ADC #$9b
5811 : 85 56 __ STA T3 + 0 
5813 : 8a __ __ TXA
5814 : 69 89 __ ADC #$89
5816 : 85 57 __ STA T3 + 1 
5818 : a0 00 __ LDY #$00
581a : b1 56 __ LDA (T3 + 0),y 
581c : 8d dd 87 STA $87dd ; (undoaddress + 0)
581f : c8 __ __ INY
5820 : b1 56 __ LDA (T3 + 0),y 
5822 : 8d de 87 STA $87de ; (undoaddress + 1)
5825 : ee e0 87 INC $87e0 ; (undo_undopossible + 0)
5828 : a6 53 __ LDX T0 + 0 
582a : ca __ __ DEX
582b : 8e e1 87 STX $87e1 ; (undo_redopossible + 0)
582e : ad df 87 LDA $87df ; (undonumber + 0)
5831 : c9 27 __ CMP #$27
5833 : b0 06 __ BCS $583b ; (undo_performredo.s20 + 0)
.s21:
5835 : a0 0d __ LDY #$0d
5837 : b1 56 __ LDA (T3 + 0),y 
5839 : f0 12 __ BEQ $584d ; (undo_performredo.s1012 + 0)
.s20:
583b : ad df 87 LDA $87df ; (undonumber + 0)
583e : c9 27 __ CMP #$27
5840 : f0 03 __ BEQ $5845 ; (undo_performredo.s25 + 0)
5842 : 4c 71 57 JMP $5771 ; (undo_performredo.s1001 + 0)
.s25:
5845 : ad a8 89 LDA $89a8 ; (Undo + 6)
5848 : f0 03 __ BEQ $584d ; (undo_performredo.s1012 + 0)
584a : 4c 71 57 JMP $5771 ; (undo_performredo.s1001 + 0)
.s1012:
584d : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
5850 : 4c 71 57 JMP $5771 ; (undo_performredo.s1001 + 0)
.l1015:
5853 : 65 5c __ ADC T7 + 0 
5855 : 85 5f __ STA T9 + 0 
5857 : 85 03 __ STA WORK + 0 
5859 : a9 00 __ LDA #$00
585b : 85 13 __ STA P6 
585d : 2a __ __ ROL
585e : 85 60 __ STA T9 + 1 
5860 : 85 04 __ STA WORK + 1 
5862 : ad c9 87 LDA $87c9 ; (canvas + 3)
5865 : 85 1b __ STA ACCU + 0 
5867 : ad ca 87 LDA $87ca ; (canvas + 4)
586a : 85 1c __ STA ACCU + 1 
586c : 20 87 7c JSR $7c87 ; (mul16 + 0)
586f : 18 __ __ CLC
5870 : a5 05 __ LDA WORK + 2 
5872 : 65 56 __ ADC T3 + 0 
5874 : 85 0e __ STA P1 
5876 : a5 06 __ LDA WORK + 3 
5878 : 69 58 __ ADC #$58
587a : 85 0f __ STA P2 
587c : ad df 87 LDA $87df ; (undonumber + 0)
587f : 0a __ __ ASL
5880 : 0a __ __ ASL
5881 : 0a __ __ ASL
5882 : a2 00 __ LDX #$00
5884 : 90 01 __ BCC $5887 ; (undo_performredo.s1022 + 0)
.s1021:
5886 : e8 __ __ INX
.s1022:
5887 : 38 __ __ SEC
5888 : ed df 87 SBC $87df ; (undonumber + 0)
588b : b0 01 __ BCS $588e ; (undo_performredo.s1024 + 0)
.s1023:
588d : ca __ __ DEX
.s1024:
588e : 18 __ __ CLC
588f : 69 9b __ ADC #$9b
5891 : 85 61 __ STA T10 + 0 
5893 : 8a __ __ TXA
5894 : 69 89 __ ADC #$89
5896 : 85 62 __ STA T10 + 1 
5898 : a0 00 __ LDY #$00
589a : 84 1c __ STY ACCU + 1 
589c : b1 61 __ LDA (T10 + 0),y 
589e : 18 __ __ CLC
589f : 65 58 __ ADC T5 + 0 
58a1 : 85 44 __ STA T12 + 0 
58a3 : c8 __ __ INY
58a4 : b1 61 __ LDA (T10 + 0),y 
58a6 : 65 59 __ ADC T5 + 1 
58a8 : 85 45 __ STA T12 + 1 
58aa : a5 55 __ LDA T2 + 0 
58ac : 85 1b __ STA ACCU + 0 
58ae : a5 12 __ LDA P5 
58b0 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
58b3 : a5 05 __ LDA WORK + 2 
58b5 : 85 5d __ STA T8 + 0 
58b7 : 18 __ __ CLC
58b8 : 65 44 __ ADC T12 + 0 
58ba : 85 10 __ STA P3 
58bc : a5 06 __ LDA WORK + 3 
58be : 85 5e __ STA T8 + 1 
58c0 : 65 45 __ ADC T12 + 1 
58c2 : 85 11 __ STA P4 
58c4 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
58c7 : ad c9 87 LDA $87c9 ; (canvas + 3)
58ca : 85 1b __ STA ACCU + 0 
58cc : ad ca 87 LDA $87ca ; (canvas + 4)
58cf : 85 1c __ STA ACCU + 1 
58d1 : a5 5f __ LDA T9 + 0 
58d3 : 85 03 __ STA WORK + 0 
58d5 : a5 60 __ LDA T9 + 1 
58d7 : 85 04 __ STA WORK + 1 
58d9 : 20 87 7c JSR $7c87 ; (mul16 + 0)
58dc : 18 __ __ CLC
58dd : a5 05 __ LDA WORK + 2 
58df : 65 56 __ ADC T3 + 0 
58e1 : 85 5f __ STA T9 + 0 
58e3 : a5 06 __ LDA WORK + 3 
58e5 : 69 58 __ ADC #$58
58e7 : 85 60 __ STA T9 + 1 
58e9 : ad cb 87 LDA $87cb ; (canvas + 5)
58ec : 85 1b __ STA ACCU + 0 
58ee : ad cc 87 LDA $87cc ; (canvas + 6)
58f1 : 85 1c __ STA ACCU + 1 
58f3 : ad c9 87 LDA $87c9 ; (canvas + 3)
58f6 : 85 03 __ STA WORK + 0 
58f8 : ad ca 87 LDA $87ca ; (canvas + 4)
58fb : 85 04 __ STA WORK + 1 
58fd : 20 87 7c JSR $7c87 ; (mul16 + 0)
5900 : 18 __ __ CLC
5901 : a5 05 __ LDA WORK + 2 
5903 : 65 5f __ ADC T9 + 0 
5905 : aa __ __ TAX
5906 : a5 06 __ LDA WORK + 3 
5908 : 65 60 __ ADC T9 + 1 
590a : a8 __ __ TAY
590b : 8a __ __ TXA
590c : 18 __ __ CLC
590d : 69 30 __ ADC #$30
590f : 85 0e __ STA P1 
5911 : 90 01 __ BCC $5914 ; (undo_performredo.s1026 + 0)
.s1025:
5913 : c8 __ __ INY
.s1026:
5914 : 84 0f __ STY P2 
5916 : a0 00 __ LDY #$00
5918 : 84 13 __ STY P6 
591a : b1 61 __ LDA (T10 + 0),y 
591c : 18 __ __ CLC
591d : 65 5a __ ADC T6 + 0 
591f : aa __ __ TAX
5920 : c8 __ __ INY
5921 : b1 61 __ LDA (T10 + 0),y 
5923 : 65 5b __ ADC T6 + 1 
5925 : a8 __ __ TAY
5926 : 8a __ __ TXA
5927 : 18 __ __ CLC
5928 : 65 5d __ ADC T8 + 0 
592a : 85 10 __ STA P3 
592c : 98 __ __ TYA
592d : 65 5e __ ADC T8 + 1 
592f : 85 11 __ STA P4 
5931 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
5934 : e6 55 __ INC T2 + 0 
5936 : a5 55 __ LDA T2 + 0 
5938 : c5 54 __ CMP T1 + 0 
593a : b0 03 __ BCS $593f ; (undo_performredo.s1026 + 43)
593c : 4c 53 58 JMP $5853 ; (undo_performredo.l1015 + 0)
593f : 4c f1 57 JMP $57f1 ; (undo_performredo.s10 + 0)
--------------------------------------------------------------------
undo_escapeundo: ; undo_escapeundo()->void
.s0:
5942 : ad df 87 LDA $87df ; (undonumber + 0)
5945 : aa __ __ TAX
5946 : 0a __ __ ASL
5947 : 0a __ __ ASL
5948 : 0a __ __ ASL
5949 : a8 __ __ TAY
594a : a9 00 __ LDA #$00
594c : 2a __ __ ROL
594d : 85 1c __ STA ACCU + 1 
594f : 98 __ __ TYA
5950 : 38 __ __ SEC
5951 : ed df 87 SBC $87df ; (undonumber + 0)
5954 : a8 __ __ TAY
5955 : b0 02 __ BCS $5959 ; (undo_escapeundo.s0 + 23)
5957 : c6 1c __ DEC ACCU + 1 
5959 : 98 __ __ TYA
595a : 18 __ __ CLC
595b : 69 a2 __ ADC #$a2
595d : 85 1b __ STA ACCU + 0 
595f : a9 89 __ LDA #$89
5961 : 65 1c __ ADC ACCU + 1 
5963 : 85 1c __ STA ACCU + 1 
5965 : a9 00 __ LDA #$00
5967 : a8 __ __ TAY
5968 : 91 1b __ STA (ACCU + 0),y 
596a : a0 01 __ LDY #$01
596c : ca __ __ DEX
596d : 8e df 87 STX $87df ; (undonumber + 0)
5970 : 91 1b __ STA (ACCU + 0),y 
5972 : d0 0d __ BNE $5981 ; (undo_escapeundo.s3 + 0)
.s1:
5974 : ad b3 8a LDA $8ab3 ; (Undo + 273)
5977 : 0d b4 8a ORA $8ab4 ; (Undo + 274)
597a : f0 05 __ BEQ $5981 ; (undo_escapeundo.s3 + 0)
.s4:
597c : a9 28 __ LDA #$28
597e : 8d df 87 STA $87df ; (undonumber + 0)
.s3:
5981 : 4c 06 3e JMP $3e06 ; (plotcursor.s0 + 0)
--------------------------------------------------------------------
loadsyscharset: ; loadsyscharset()->void
.s0:
5984 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
5987 : c9 01 __ CMP #$01
5989 : f0 01 __ BEQ $598c ; (loadsyscharset.s1 + 0)
.s1001:
598b : 60 __ __ RTS
.s1:
598c : a9 7f __ LDA #$7f
598e : 85 11 __ STA P4 
5990 : a9 01 __ LDA #$01
5992 : 85 15 __ STA P8 
5994 : ad bf 87 LDA $87bf ; (vdc_state + 18)
5997 : 85 0f __ STA P2 
5999 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
599c : 85 10 __ STA P3 
599e : a9 00 __ LDA #$00
59a0 : 85 14 __ STA P7 
59a2 : 85 12 __ STA P5 
59a4 : 4c b7 1a JMP $1ab7 ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
restorealtcharset: ; restorealtcharset()->void
.s0:
59a7 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
59aa : c9 01 __ CMP #$01
59ac : f0 01 __ BEQ $59af ; (restorealtcharset.s1 + 0)
.s1001:
59ae : 60 __ __ RTS
.s1:
59af : a9 7f __ LDA #$7f
59b1 : 85 11 __ STA P4 
59b3 : a9 01 __ LDA #$01
59b5 : 85 15 __ STA P8 
59b7 : ad bf 87 LDA $87bf ; (vdc_state + 18)
59ba : 85 0f __ STA P2 
59bc : ad c0 87 LDA $87c0 ; (vdc_state + 19)
59bf : 85 10 __ STA P3 
59c1 : a9 00 __ LDA #$00
59c3 : 85 14 __ STA P7 
59c5 : 85 12 __ STA P5 
59c7 : 4c b0 1a JMP $1ab0 ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
mainmenuloop: ; mainmenuloop()->void
.s1000:
59ca : a5 53 __ LDA T1 + 0 
59cc : 8d 79 ab STA $ab79 ; (mainmenuloop@stack + 0)
59cf : 38 __ __ SEC
59d0 : a5 23 __ LDA SP + 0 
59d2 : e9 08 __ SBC #$08
59d4 : 85 23 __ STA SP + 0 
59d6 : b0 02 __ BCS $59da ; (mainmenuloop.s0 + 0)
59d8 : c6 24 __ DEC SP + 1 
.s0:
59da : 20 1b 4b JSR $4b1b ; (hidecursor.s0 + 0)
59dd : a9 00 __ LDA #$00
59df : 85 17 __ STA P10 
59e1 : 85 18 __ STA P11 
59e3 : 8d f3 ab STA $abf3 ; (sstack + 0)
59e6 : a9 01 __ LDA #$01
59e8 : 8d f5 ab STA $abf5 ; (sstack + 2)
59eb : ad b0 87 LDA $87b0 ; (vdc_state + 3)
59ee : 8d f4 ab STA $abf4 ; (sstack + 1)
59f1 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
59f4 : 20 84 59 JSR $5984 ; (loadsyscharset.s0 + 0)
.l1:
59f7 : 20 ef 5c JSR $5cef ; (menu_main.s1000 + 0)
59fa : a5 1b __ LDA ACCU + 0 
59fc : c9 1f __ CMP #$1f
59fe : d0 0d __ BNE $5a0d ; (mainmenuloop.s48 + 0)
.s34:
5a00 : a9 03 __ LDA #$03
5a02 : 8d fa ab STA $abfa ; (sstack + 7)
5a05 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5a08 : a9 00 __ LDA #$00
5a0a : 4c 51 5b JMP $5b51 ; (mainmenuloop.s112 + 0)
.s48:
5a0d : 85 53 __ STA T1 + 0 
5a0f : c9 1f __ CMP #$1f
5a11 : b0 03 __ BCS $5a16 ; (mainmenuloop.s49 + 0)
5a13 : 4c 5a 5b JMP $5b5a ; (mainmenuloop.s50 + 0)
.s49:
5a16 : c9 2a __ CMP #$2a
5a18 : d0 0e __ BNE $5a28 ; (mainmenuloop.s66 + 0)
.s40:
5a1a : a9 06 __ LDA #$06
5a1c : 8d fa ab STA $abfa ; (sstack + 7)
5a1f : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5a22 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
5a25 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s66:
5a28 : b0 03 __ BCS $5a2d ; (mainmenuloop.s67 + 0)
5a2a : 4c e7 5a JMP $5ae7 ; (mainmenuloop.s68 + 0)
.s67:
5a2d : c9 34 __ CMP #$34
5a2f : d0 07 __ BNE $5a38 ; (mainmenuloop.s75 + 0)
.s43:
5a31 : a9 01 __ LDA #$01
5a33 : 8d ff 86 STA $86ff ; (appexit + 0)
5a36 : d0 0f __ BNE $5a47 ; (mainmenuloop.s2 + 0)
.s75:
5a38 : b0 03 __ BCS $5a3d ; (mainmenuloop.s76 + 0)
5a3a : 4c c0 5a JMP $5ac0 ; (mainmenuloop.s77 + 0)
.s76:
5a3d : c9 35 __ CMP #$35
5a3f : f0 2c __ BEQ $5a6d ; (mainmenuloop.s44 + 0)
.s3:
5a41 : a5 53 __ LDA T1 + 0 
5a43 : c9 63 __ CMP #$63
5a45 : 90 b0 __ BCC $59f7 ; (mainmenuloop.l1 + 0)
.s2:
5a47 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
5a4a : 20 a7 59 JSR $59a7 ; (restorealtcharset.s0 + 0)
5a4d : ad 8c 87 LDA $878c ; (screen_col + 0)
5a50 : 8d d5 87 STA $87d5 ; (canvas + 15)
5a53 : ad 8e 87 LDA $878e ; (screen_row + 0)
5a56 : 8d d6 87 STA $87d6 ; (canvas + 16)
5a59 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
.s1001:
5a5c : 18 __ __ CLC
5a5d : a5 23 __ LDA SP + 0 
5a5f : 69 08 __ ADC #$08
5a61 : 85 23 __ STA SP + 0 
5a63 : 90 02 __ BCC $5a67 ; (mainmenuloop.s1001 + 11)
5a65 : e6 24 __ INC SP + 1 
5a67 : ad 79 ab LDA $ab79 ; (mainmenuloop@stack + 0)
5a6a : 85 53 __ STA T1 + 0 
5a6c : 60 __ __ RTS
.s44:
5a6d : a9 78 __ LDA #$78
5a6f : a0 02 __ LDY #$02
5a71 : 91 23 __ STA (SP + 0),y 
5a73 : a9 85 __ LDA #$85
5a75 : c8 __ __ INY
5a76 : 91 23 __ STA (SP + 0),y 
5a78 : a9 4a __ LDA #$4a
5a7a : c8 __ __ INY
5a7b : 91 23 __ STA (SP + 0),y 
5a7d : a9 7c __ LDA #$7c
5a7f : c8 __ __ INY
5a80 : 91 23 __ STA (SP + 0),y 
5a82 : a9 00 __ LDA #$00
5a84 : cd fe 69 CMP $69fe ; (undoenabled + 0)
5a87 : 2a __ __ ROL
5a88 : 8d fe 69 STA $69fe ; (undoenabled + 0)
5a8b : f0 06 __ BEQ $5a93 ; (mainmenuloop.s91 + 0)
.s90:
5a8d : a9 7c __ LDA #$7c
5a8f : a2 53 __ LDX #$53
5a91 : 90 04 __ BCC $5a97 ; (mainmenuloop.s92 + 0)
.s91:
5a93 : a9 7c __ LDA #$7c
5a95 : a2 5d __ LDX #$5d
.s92:
5a97 : 85 44 __ STA T0 + 1 
5a99 : 8a __ __ TXA
5a9a : a0 06 __ LDY #$06
5a9c : 91 23 __ STA (SP + 0),y 
5a9e : a5 44 __ LDA T0 + 1 
5aa0 : c8 __ __ INY
5aa1 : 91 23 __ STA (SP + 0),y 
5aa3 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
5aa6 : a9 00 __ LDA #$00
5aa8 : 8d df 87 STA $87df ; (undonumber + 0)
5aab : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
5aae : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
5ab1 : ad c1 87 LDA $87c1 ; (vdc_state + 20)
5ab4 : 8d dd 87 STA $87dd ; (undoaddress + 0)
5ab7 : ad c2 87 LDA $87c2 ; (vdc_state + 21)
5aba : 8d de 87 STA $87de ; (undoaddress + 1)
5abd : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s77:
5ac0 : c9 2b __ CMP #$2b
5ac2 : d0 0e __ BNE $5ad2 ; (mainmenuloop.s78 + 0)
.s41:
5ac4 : a9 06 __ LDA #$06
5ac6 : 8d fa ab STA $abfa ; (sstack + 7)
5ac9 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5acc : 20 c3 b4 JSR $b4c3 ; (colorwrite.s27 + 0)
5acf : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s78:
5ad2 : c9 33 __ CMP #$33
5ad4 : f0 03 __ BEQ $5ad9 ; (mainmenuloop.s42 + 0)
5ad6 : 4c 41 5a JMP $5a41 ; (mainmenuloop.s3 + 0)
.s42:
5ad9 : a9 04 __ LDA #$04
5adb : 8d fa ab STA $abfa ; (sstack + 7)
5ade : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5ae1 : 20 e9 b8 JSR $b8e9 ; (resizewidth.l42 + 12)
5ae4 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s68:
5ae7 : c9 22 __ CMP #$22
5ae9 : d0 0c __ BNE $5af7 ; (mainmenuloop.s69 + 0)
.s37:
5aeb : a9 03 __ LDA #$03
5aed : 8d fa ab STA $abfa ; (sstack + 7)
5af0 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5af3 : a9 01 __ LDA #$01
5af5 : d0 4c __ BNE $5b43 ; (mainmenuloop.s113 + 0)
.s69:
5af7 : 90 3a __ BCC $5b33 ; (mainmenuloop.s71 + 0)
.s70:
5af9 : c9 23 __ CMP #$23
5afb : d0 21 __ BNE $5b1e ; (mainmenuloop.s73 + 0)
.s38:
5afd : 20 0b 30 JSR $300b ; (vdc_restore_charsets.s0 + 0)
5b00 : a9 7f __ LDA #$7f
5b02 : 85 0d __ STA P0 
5b04 : a9 01 __ LDA #$01
5b06 : 85 10 __ STA P3 
5b08 : a9 00 __ LDA #$00
5b0a : 85 13 __ STA P6 
5b0c : 85 0e __ STA P1 
5b0e : 85 11 __ STA P4 
5b10 : 20 8a 14 JSR $148a ; (bnk_memcpy@proxy + 0)
5b13 : a9 00 __ LDA #$00
5b15 : 8d 8a 87 STA $878a ; (charsetchanged + 0)
5b18 : 8d 8b 87 STA $878b ; (charsetchanged + 1)
5b1b : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s73:
5b1e : c9 29 __ CMP #$29
5b20 : f0 03 __ BEQ $5b25 ; (mainmenuloop.s39 + 0)
5b22 : 4c 41 5a JMP $5a41 ; (mainmenuloop.s3 + 0)
.s39:
5b25 : a9 05 __ LDA #$05
5b27 : 8d fa ab STA $abfa ; (sstack + 7)
5b2a : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5b2d : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
5b30 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s71:
5b33 : a9 03 __ LDA #$03
5b35 : 8d fa ab STA $abfa ; (sstack + 7)
5b38 : a5 1b __ LDA ACCU + 0 
5b3a : c9 20 __ CMP #$20
5b3c : f0 0e __ BEQ $5b4c ; (mainmenuloop.s35 + 0)
.s36:
5b3e : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5b41 : a9 00 __ LDA #$00
.s113:
5b43 : 8d ff ab STA $abff ; (sstack + 12)
5b46 : 20 75 b5 JSR $b575 ; (colorwrite.s17 + 0)
5b49 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s35:
5b4c : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5b4f : a9 01 __ LDA #$01
.s112:
5b51 : 8d fd ab STA $abfd ; (sstack + 10)
5b54 : 20 0e b5 JSR $b50e ; (colorwrite.s55 + 4)
5b57 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s50:
5b5a : c9 10 __ CMP #$10
5b5c : d0 03 __ BNE $5b61 ; (mainmenuloop.s51 + 0)
5b5e : 4c 9c 5c JMP $5c9c ; (mainmenuloop.s21 + 0)
.s51:
5b61 : 90 50 __ BCC $5bb3 ; (mainmenuloop.s53 + 0)
.s52:
5b63 : c9 17 __ CMP #$17
5b65 : d0 0e __ BNE $5b75 ; (mainmenuloop.s60 + 0)
.s32:
5b67 : a9 03 __ LDA #$03
5b69 : 8d fa ab STA $abfa ; (sstack + 7)
5b6c : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5b6f : 20 21 af JSR $af21 ; (palette.s56 + 5)
5b72 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s60:
5b75 : 90 15 __ BCC $5b8c ; (mainmenuloop.s62 + 0)
.s61:
5b77 : c9 18 __ CMP #$18
5b79 : f0 03 __ BEQ $5b7e ; (mainmenuloop.s33 + 0)
5b7b : 4c 41 5a JMP $5a41 ; (mainmenuloop.s3 + 0)
.s33:
5b7e : a9 03 __ LDA #$03
5b80 : 8d fa ab STA $abfa ; (sstack + 7)
5b83 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5b86 : 20 8d b2 JSR $b28d ; (writemode.s43 + 0)
5b89 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s62:
5b8c : c9 15 __ CMP #$15
5b8e : d0 0e __ BNE $5b9e ; (mainmenuloop.s63 + 0)
.s30:
5b90 : a9 03 __ LDA #$03
5b92 : 8d fa ab STA $abfa ; (sstack + 7)
5b95 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5b98 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
5b9b : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s63:
5b9e : c9 16 __ CMP #$16
5ba0 : f0 03 __ BEQ $5ba5 ; (mainmenuloop.s31 + 0)
5ba2 : 4c 41 5a JMP $5a41 ; (mainmenuloop.s3 + 0)
.s31:
5ba5 : a9 03 __ LDA #$03
5ba7 : 8d fa ab STA $abfa ; (sstack + 7)
5baa : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5bad : 20 eb ac JSR $aceb ; (palette.s1001 + 8)
5bb0 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s53:
5bb3 : c9 0d __ CMP #$0d
5bb5 : d0 0e __ BNE $5bc5 ; (mainmenuloop.s54 + 0)
.s6:
5bb7 : a9 02 __ LDA #$02
5bb9 : 8d fa ab STA $abfa ; (sstack + 7)
5bbc : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5bbf : 20 50 bb JSR $bb50 ; (resizewidth.l20 + 35)
5bc2 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s54:
5bc5 : b0 03 __ BCS $5bca ; (mainmenuloop.s55 + 0)
5bc7 : 4c 75 5c JMP $5c75 ; (mainmenuloop.s56 + 0)
.s55:
5bca : c9 0e __ CMP #$0e
5bcc : f0 56 __ BEQ $5c24 ; (mainmenuloop.s7 + 0)
.s14:
5bce : ad fe 69 LDA $69fe ; (undoenabled + 0)
5bd1 : c9 01 __ CMP #$01
5bd3 : d0 14 __ BNE $5be9 ; (mainmenuloop.s17 + 0)
.s15:
5bd5 : a9 00 __ LDA #$00
5bd7 : 85 16 __ STA P9 
5bd9 : 85 17 __ STA P10 
5bdb : ad c9 87 LDA $87c9 ; (canvas + 3)
5bde : 85 18 __ STA P11 
5be0 : ad cb 87 LDA $87cb ; (canvas + 5)
5be3 : 8d f3 ab STA $abf3 ; (sstack + 0)
5be6 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s17:
5be9 : a9 20 __ LDA #$20
5beb : 8d f8 ab STA $abf8 ; (sstack + 5)
5bee : a9 0f __ LDA #$0f
.s103:
5bf0 : 8d f9 ab STA $abf9 ; (sstack + 6)
5bf3 : 20 d9 3c JSR $3cd9 ; (screenmapfill.s0 + 0)
5bf6 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
5bf9 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
5bfc : a9 00 __ LDA #$00
5bfe : 85 17 __ STA P10 
5c00 : 85 18 __ STA P11 
5c02 : 8d f3 ab STA $abf3 ; (sstack + 0)
5c05 : a9 01 __ LDA #$01
5c07 : 8d f5 ab STA $abf5 ; (sstack + 2)
5c0a : ad b0 87 LDA $87b0 ; (vdc_state + 3)
5c0d : 8d f4 ab STA $abf4 ; (sstack + 1)
5c10 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
5c13 : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
5c16 : ad ff 87 LDA $87ff ; (showbar + 0)
5c19 : d0 03 __ BNE $5c1e ; (mainmenuloop.s18 + 0)
5c1b : 4c 41 5a JMP $5a41 ; (mainmenuloop.s3 + 0)
.s18:
5c1e : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
5c21 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s7:
5c24 : a9 02 __ LDA #$02
5c26 : 8d fa ab STA $abfa ; (sstack + 7)
5c29 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5c2c : 20 f4 bd JSR $bdf4 ; (resizeheight.s32 + 36)
5c2f : ad 8a 87 LDA $878a ; (charsetchanged + 0)
5c32 : f0 1b __ BEQ $5c4f ; (mainmenuloop.s105 + 0)
.s8:
5c34 : a9 7f __ LDA #$7f
5c36 : 85 11 __ STA P4 
5c38 : a9 01 __ LDA #$01
5c3a : 85 15 __ STA P8 
5c3c : ad bd 87 LDA $87bd ; (vdc_state + 16)
5c3f : 85 0f __ STA P2 
5c41 : ad be 87 LDA $87be ; (vdc_state + 17)
5c44 : 85 10 __ STA P3 
5c46 : a9 00 __ LDA #$00
5c48 : 85 14 __ STA P7 
5c4a : 85 12 __ STA P5 
5c4c : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
.s105:
5c4f : ad 8b 87 LDA $878b ; (charsetchanged + 1)
5c52 : d0 03 __ BNE $5c57 ; (mainmenuloop.s11 + 0)
5c54 : 4c 41 5a JMP $5a41 ; (mainmenuloop.s3 + 0)
.s11:
5c57 : a9 7f __ LDA #$7f
5c59 : 85 11 __ STA P4 
5c5b : a9 01 __ LDA #$01
5c5d : 85 15 __ STA P8 
5c5f : ad bf 87 LDA $87bf ; (vdc_state + 18)
5c62 : 85 0f __ STA P2 
5c64 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
5c67 : 85 10 __ STA P3 
5c69 : a9 00 __ LDA #$00
5c6b : 85 14 __ STA P7 
5c6d : 85 12 __ STA P5 
5c6f : 20 b0 1a JSR $1ab0 ; (bnk_redef_charset@proxy + 0)
5c72 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s56:
5c75 : c9 0b __ CMP #$0b
5c77 : d0 0e __ BNE $5c87 ; (mainmenuloop.s57 + 0)
.s4:
5c79 : a9 01 __ LDA #$01
5c7b : 8d fa ab STA $abfa ; (sstack + 7)
5c7e : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5c81 : 20 e0 b5 JSR $b5e0 ; (resizewidth.s1000 + 0)
5c84 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s57:
5c87 : c9 0c __ CMP #$0c
5c89 : f0 03 __ BEQ $5c8e ; (mainmenuloop.s5 + 0)
5c8b : 4c 41 5a JMP $5a41 ; (mainmenuloop.s3 + 0)
.s5:
5c8e : a9 01 __ LDA #$01
5c90 : 8d fa ab STA $abfa ; (sstack + 7)
5c93 : 20 97 4a JSR $4a97 ; (loadoverlay.s1000 + 0)
5c96 : 20 1d bc JSR $bc1d ; (resizeheight.s1000 + 0)
5c99 : 4c f7 59 JMP $59f7 ; (mainmenuloop.l1 + 0)
.s21:
5c9c : ad fe 69 LDA $69fe ; (undoenabled + 0)
5c9f : c9 01 __ CMP #$01
5ca1 : d0 14 __ BNE $5cb7 ; (mainmenuloop.s24 + 0)
.s22:
5ca3 : a9 00 __ LDA #$00
5ca5 : 85 16 __ STA P9 
5ca7 : 85 17 __ STA P10 
5ca9 : ad c9 87 LDA $87c9 ; (canvas + 3)
5cac : 85 18 __ STA P11 
5cae : ad cb 87 LDA $87cb ; (canvas + 5)
5cb1 : 8d f3 ab STA $abf3 ; (sstack + 0)
5cb4 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s24:
5cb7 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
5cba : 8d f8 ab STA $abf8 ; (sstack + 5)
5cbd : ad 95 87 LDA $8795 ; (plotblink + 0)
5cc0 : 0a __ __ ASL
5cc1 : 0a __ __ ASL
5cc2 : 0a __ __ ASL
5cc3 : 0a __ __ ASL
5cc4 : 18 __ __ CLC
5cc5 : 6d 92 87 ADC $8792 ; (plotcolor + 0)
5cc8 : 85 43 __ STA T0 + 0 
5cca : ad 94 87 LDA $8794 ; (plotunderline + 0)
5ccd : 4a __ __ LSR
5cce : 6a __ __ ROR
5ccf : 6a __ __ ROR
5cd0 : 29 c0 __ AND #$c0
5cd2 : 6a __ __ ROR
5cd3 : 65 43 __ ADC T0 + 0 
5cd5 : 85 43 __ STA T0 + 0 
5cd7 : ad 93 87 LDA $8793 ; (plotreverse + 0)
5cda : 4a __ __ LSR
5cdb : 6a __ __ ROR
5cdc : 29 80 __ AND #$80
5cde : 6a __ __ ROR
5cdf : 65 43 __ ADC T0 + 0 
5ce1 : 85 43 __ STA T0 + 0 
5ce3 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
5ce6 : 4a __ __ LSR
5ce7 : a9 00 __ LDA #$00
5ce9 : 6a __ __ ROR
5cea : 65 43 __ ADC T0 + 0 
5cec : 4c f0 5b JMP $5bf0 ; (mainmenuloop.s103 + 0)
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
5cef : a2 03 __ LDX #$03
5cf1 : b5 53 __ LDA T0 + 0,x 
5cf3 : 9d c3 ab STA $abc3,x ; (projbuffer + 43)
5cf6 : ca __ __ DEX
5cf7 : 10 f8 __ BPL $5cf1 ; (menu_main.s1000 + 2)
.s0:
5cf9 : ad 41 87 LDA $8741 ; (menubar + 65)
5cfc : 85 16 __ STA P9 
5cfe : 20 1d 5e JSR $5e1d ; (menu_placebar.s0 + 0)
.l84:
5d01 : a9 01 __ LDA #$01
5d03 : 85 53 __ STA T0 + 0 
.l3:
5d05 : a6 53 __ LDX T0 + 0 
5d07 : bd 3b 87 LDA $873b,x ; (menubar + 59)
5d0a : 85 11 __ STA P4 
5d0c : ad 41 87 LDA $8741 ; (menubar + 65)
5d0f : 85 12 __ STA P5 
5d11 : bd 76 80 LDA $8076,x ; (__multab12L + 0)
5d14 : 18 __ __ CLC
5d15 : 69 f4 __ ADC #$f4
5d17 : 85 13 __ STA P6 
5d19 : a9 86 __ LDA #$86
5d1b : 69 00 __ ADC #$00
5d1d : 85 14 __ STA P7 
5d1f : ad f3 82 LDA $82f3 ; (mc_mb_select + 0)
5d22 : 85 15 __ STA P8 
5d24 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
.l5:
5d27 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
5d2a : a5 1b __ LDA ACCU + 0 
5d2c : 85 54 __ STA T1 + 0 
5d2e : c9 0d __ CMP #$0d
5d30 : d0 06 __ BNE $5d38 ; (menu_main.s1002 + 0)
.s1003:
5d32 : a9 00 __ LDA #$00
5d34 : 85 55 __ STA T3 + 0 
5d36 : f0 16 __ BEQ $5d4e ; (menu_main.s6 + 0)
.s1002:
5d38 : a9 01 __ LDA #$01
5d3a : 85 55 __ STA T3 + 0 
5d3c : a5 1b __ LDA ACCU + 0 
5d3e : c9 9d __ CMP #$9d
5d40 : f0 0c __ BEQ $5d4e ; (menu_main.s6 + 0)
.s9:
5d42 : c9 1d __ CMP #$1d
5d44 : f0 08 __ BEQ $5d4e ; (menu_main.s6 + 0)
.s8:
5d46 : c9 1b __ CMP #$1b
5d48 : f0 04 __ BEQ $5d4e ; (menu_main.s6 + 0)
.s7:
5d4a : c9 03 __ CMP #$03
5d4c : d0 d9 __ BNE $5d27 ; (menu_main.l5 + 0)
.s6:
5d4e : a6 53 __ LDX T0 + 0 
5d50 : bd 3b 87 LDA $873b,x ; (menubar + 59)
5d53 : 85 11 __ STA P4 
5d55 : ad 41 87 LDA $8741 ; (menubar + 65)
5d58 : 85 56 __ STA T4 + 0 
5d5a : 85 12 __ STA P5 
5d5c : bd 76 80 LDA $8076,x ; (__multab12L + 0)
5d5f : 18 __ __ CLC
5d60 : 69 f4 __ ADC #$f4
5d62 : 85 13 __ STA P6 
5d64 : a9 86 __ LDA #$86
5d66 : 69 00 __ ADC #$00
5d68 : 85 14 __ STA P7 
5d6a : ad ff 7b LDA $7bff ; (mc_mb_normal + 0)
5d6d : 85 15 __ STA P8 
5d6f : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
5d72 : a5 54 __ LDA T1 + 0 
5d74 : c9 9d __ CMP #$9d
5d76 : d0 03 __ BNE $5d7b ; (menu_main.s12 + 0)
5d78 : 4c 0d 5e JMP $5e0d ; (menu_main.s11 + 0)
.s12:
5d7b : c9 1d __ CMP #$1d
5d7d : d0 0c __ BNE $5d8b ; (menu_main.s13 + 0)
.s17:
5d7f : e6 53 __ INC T0 + 0 
5d81 : a5 53 __ LDA T0 + 0 
5d83 : c9 06 __ CMP #$06
5d85 : 90 04 __ BCC $5d8b ; (menu_main.s13 + 0)
.s20:
5d87 : a9 01 __ LDA #$01
.s1039:
5d89 : 85 53 __ STA T0 + 0 
.s13:
5d8b : a5 55 __ LDA T3 + 0 
5d8d : f0 0d __ BEQ $5d9c ; (menu_main.s4 + 0)
.s24:
5d8f : a5 54 __ LDA T1 + 0 
5d91 : c9 1b __ CMP #$1b
5d93 : f0 11 __ BEQ $5da6 ; (menu_main.s26 + 0)
.s23:
5d95 : c9 03 __ CMP #$03
5d97 : f0 03 __ BEQ $5d9c ; (menu_main.s4 + 0)
5d99 : 4c 05 5d JMP $5d05 ; (menu_main.l3 + 0)
.s4:
5d9c : a5 54 __ LDA T1 + 0 
5d9e : c9 1b __ CMP #$1b
5da0 : f0 04 __ BEQ $5da6 ; (menu_main.s26 + 0)
.s28:
5da2 : c9 03 __ CMP #$03
5da4 : d0 06 __ BNE $5dac ; (menu_main.s25 + 0)
.s26:
5da6 : a9 63 __ LDA #$63
5da8 : 85 55 __ STA T3 + 0 
5daa : d0 49 __ BNE $5df5 ; (menu_main.s2 + 0)
.s25:
5dac : a9 01 __ LDA #$01
5dae : 8d fb ab STA $abfb ; (sstack + 8)
5db1 : a6 53 __ LDX T0 + 0 
5db3 : ca __ __ DEX
5db4 : 8e fa ab STX $abfa ; (sstack + 7)
5db7 : bd 3c 87 LDA $873c,x ; (menubar + 60)
5dba : 8d f8 ab STA $abf8 ; (sstack + 5)
5dbd : a6 56 __ LDX T4 + 0 
5dbf : e8 __ __ INX
5dc0 : 8e f9 ab STX $abf9 ; (sstack + 6)
5dc3 : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
5dc6 : a5 1b __ LDA ACCU + 0 
5dc8 : 85 55 __ STA T3 + 0 
5dca : c9 12 __ CMP #$12
5dcc : d0 0e __ BNE $5ddc ; (menu_main.s31 + 0)
.s29:
5dce : a9 00 __ LDA #$00
5dd0 : 85 55 __ STA T3 + 0 
5dd2 : c6 53 __ DEC T0 + 0 
5dd4 : d0 06 __ BNE $5ddc ; (menu_main.s31 + 0)
.s32:
5dd6 : a9 05 __ LDA #$05
5dd8 : 85 53 __ STA T0 + 0 
5dda : d0 12 __ BNE $5dee ; (menu_main.s27 + 0)
.s31:
5ddc : c9 13 __ CMP #$13
5dde : d0 0e __ BNE $5dee ; (menu_main.s27 + 0)
.s35:
5de0 : e6 53 __ INC T0 + 0 
5de2 : a5 53 __ LDA T0 + 0 
5de4 : c9 06 __ CMP #$06
5de6 : b0 03 __ BCS $5deb ; (menu_main.s35 + 11)
5de8 : 4c 05 5d JMP $5d05 ; (menu_main.l3 + 0)
5deb : 4c 01 5d JMP $5d01 ; (menu_main.l84 + 0)
.s27:
5dee : a5 55 __ LDA T3 + 0 
5df0 : d0 03 __ BNE $5df5 ; (menu_main.s2 + 0)
5df2 : 4c 05 5d JMP $5d05 ; (menu_main.l3 + 0)
.s2:
5df5 : a5 53 __ LDA T0 + 0 
5df7 : 0a __ __ ASL
5df8 : 0a __ __ ASL
5df9 : 18 __ __ CLC
5dfa : 65 53 __ ADC T0 + 0 
5dfc : 0a __ __ ASL
5dfd : 18 __ __ CLC
5dfe : 65 55 __ ADC T3 + 0 
5e00 : 85 1b __ STA ACCU + 0 
.s1001:
5e02 : a2 03 __ LDX #$03
5e04 : bd c3 ab LDA $abc3,x ; (projbuffer + 43)
5e07 : 95 53 __ STA T0 + 0,x 
5e09 : ca __ __ DEX
5e0a : 10 f8 __ BPL $5e04 ; (menu_main.s1001 + 2)
5e0c : 60 __ __ RTS
.s11:
5e0d : c6 53 __ DEC T0 + 0 
5e0f : f0 03 __ BEQ $5e14 ; (menu_main.s14 + 0)
5e11 : 4c 8b 5d JMP $5d8b ; (menu_main.s13 + 0)
.s14:
5e14 : a9 05 __ LDA #$05
5e16 : 4c 89 5d JMP $5d89 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_placebar@proxy: ; menu_placebar@proxy
5e19 : a9 00 __ LDA #$00
5e1b : 85 16 __ STA P9 
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
5e1d : a9 00 __ LDA #$00
5e1f : 85 0f __ STA P2 
5e21 : a9 20 __ LDA #$20
5e23 : 85 11 __ STA P4 
5e25 : a9 50 __ LDA #$50
5e27 : 85 13 __ STA P6 
5e29 : a5 16 __ LDA P9 ; (y + 0)
5e2b : 8d 41 87 STA $8741 ; (menubar + 65)
5e2e : 85 10 __ STA P3 
5e30 : ad ff 7b LDA $7bff ; (mc_mb_normal + 0)
5e33 : 85 12 __ STA P5 
5e35 : 20 d2 2c JSR $2cd2 ; (vdc_hchar.s0 + 0)
5e38 : a9 01 __ LDA #$01
5e3a : 85 4a __ STA T2 + 0 
5e3c : a0 00 __ LDY #$00
5e3e : 84 49 __ STY T1 + 0 
.l2:
5e40 : b9 76 80 LDA $8076,y ; (__multab12L + 0)
5e43 : 18 __ __ CLC
5e44 : 69 00 __ ADC #$00
5e46 : 85 0d __ STA P0 
5e48 : a9 87 __ LDA #$87
5e4a : 69 00 __ ADC #$00
5e4c : 85 0e __ STA P1 
5e4e : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
5e51 : a5 16 __ LDA P9 ; (y + 0)
5e53 : 85 12 __ STA P5 
5e55 : a5 0d __ LDA P0 
5e57 : 85 13 __ STA P6 
5e59 : a5 0e __ LDA P1 
5e5b : 85 14 __ STA P7 
5e5d : ad ff 7b LDA $7bff ; (mc_mb_normal + 0)
5e60 : 85 15 __ STA P8 
5e62 : a5 1b __ LDA ACCU + 0 
5e64 : 85 4b __ STA T4 + 0 
5e66 : 18 __ __ CLC
5e67 : 65 4a __ ADC T2 + 0 
5e69 : 85 43 __ STA T5 + 0 
5e6b : a9 00 __ LDA #$00
5e6d : 2a __ __ ROL
5e6e : 85 44 __ STA T5 + 1 
5e70 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
5e73 : 38 __ __ SEC
5e74 : e9 01 __ SBC #$01
5e76 : a8 __ __ TAY
5e77 : ad b1 87 LDA $87b1 ; (vdc_state + 4)
5e7a : e9 00 __ SBC #$00
5e7c : c5 44 __ CMP T5 + 1 
5e7e : d0 02 __ BNE $5e82 ; (menu_placebar.s1005 + 0)
.s1004:
5e80 : c4 43 __ CPY T5 + 0 
.s1005:
5e82 : 90 04 __ BCC $5e88 ; (menu_placebar.s5 + 0)
.s7:
5e84 : a5 4a __ LDA T2 + 0 
5e86 : b0 04 __ BCS $5e8c ; (menu_placebar.s1006 + 0)
.s5:
5e88 : 98 __ __ TYA
5e89 : 38 __ __ SEC
5e8a : e5 1b __ SBC ACCU + 0 
.s1006:
5e8c : 85 11 __ STA P4 
5e8e : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
5e91 : a5 11 __ LDA P4 
5e93 : a4 49 __ LDY T1 + 0 
5e95 : c8 __ __ INY
5e96 : 84 49 __ STY T1 + 0 
5e98 : 99 3b 87 STA $873b,y ; (menubar + 59)
5e9b : a5 4b __ LDA T4 + 0 
5e9d : 38 __ __ SEC
5e9e : 65 11 __ ADC P4 
5ea0 : 85 4a __ STA T2 + 0 
5ea2 : c0 05 __ CPY #$05
5ea4 : 90 9a __ BCC $5e40 ; (menu_placebar.l2 + 0)
.s1001:
5ea6 : 60 __ __ RTS
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
5ea7 : a2 08 __ LDX #$08
5ea9 : b5 53 __ LDA T1 + 0,x 
5eab : 9d c8 ab STA $abc8,x ; (buff + 35)
5eae : ca __ __ DEX
5eaf : 10 f8 __ BPL $5ea9 ; (menu_pulldown.s1000 + 2)
5eb1 : 38 __ __ SEC
5eb2 : a5 23 __ LDA SP + 0 
5eb4 : e9 0a __ SBC #$0a
5eb6 : 85 23 __ STA SP + 0 
5eb8 : b0 02 __ BCS $5ebc ; (menu_pulldown.s0 + 0)
5eba : c6 24 __ DEC SP + 1 
.s0:
5ebc : a9 d8 __ LDA #$d8
5ebe : ae fa ab LDX $abfa ; (sstack + 7)
5ec1 : 86 52 __ STX T0 + 0 
5ec3 : 18 __ __ CLC
5ec4 : 7d 7c 80 ADC $807c,x ; (__multab96L + 0)
5ec7 : 85 54 __ STA T2 + 0 
5ec9 : 85 0d __ STA P0 
5ecb : a9 83 __ LDA #$83
5ecd : 7d 84 80 ADC $8084,x ; (__multab96H + 0)
5ed0 : 85 55 __ STA T2 + 1 
5ed2 : 85 0e __ STA P1 
5ed4 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
5ed7 : a6 52 __ LDX T0 + 0 
5ed9 : bd 55 82 LDA $8255,x ; (pulldown_options + 0)
5edc : 85 57 __ STA T4 + 0 
5ede : 8d f5 ab STA $abf5 ; (sstack + 2)
5ee1 : e0 05 __ CPX #$05
5ee3 : a9 00 __ LDA #$00
5ee5 : 85 17 __ STA P10 
5ee7 : 2a __ __ ROL
5ee8 : 49 01 __ EOR #$01
5eea : 85 53 __ STA T1 + 0 
5eec : ad f8 ab LDA $abf8 ; (sstack + 5)
5eef : 85 52 __ STA T0 + 0 
5ef1 : 85 18 __ STA P11 
5ef3 : ad f9 ab LDA $abf9 ; (sstack + 6)
5ef6 : 85 56 __ STA T3 + 0 
5ef8 : 8d f3 ab STA $abf3 ; (sstack + 0)
5efb : a5 1b __ LDA ACCU + 0 
5efd : 69 02 __ ADC #$02
5eff : 8d f4 ab STA $abf4 ; (sstack + 1)
5f02 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
5f05 : a9 01 __ LDA #$01
5f07 : 85 59 __ STA T6 + 0 
5f09 : a5 57 __ LDA T4 + 0 
5f0b : f0 58 __ BEQ $5f65 ; (menu_pulldown.l5 + 0)
.s58:
5f0d : a9 00 __ LDA #$00
5f0f : 85 58 __ STA T5 + 0 
5f11 : 85 5a __ STA T8 + 0 
5f13 : 85 5b __ STA T8 + 1 
5f15 : 18 __ __ CLC
.l1050:
5f16 : a9 00 __ LDA #$00
5f18 : a0 02 __ LDY #$02
5f1a : 91 23 __ STA (SP + 0),y 
5f1c : a9 89 __ LDA #$89
5f1e : c8 __ __ INY
5f1f : 91 23 __ STA (SP + 0),y 
5f21 : a9 e2 __ LDA #$e2
5f23 : c8 __ __ INY
5f24 : 91 23 __ STA (SP + 0),y 
5f26 : a9 60 __ LDA #$60
5f28 : c8 __ __ INY
5f29 : 91 23 __ STA (SP + 0),y 
5f2b : a5 54 __ LDA T2 + 0 
5f2d : 65 5a __ ADC T8 + 0 
5f2f : c8 __ __ INY
5f30 : 91 23 __ STA (SP + 0),y 
5f32 : a5 55 __ LDA T2 + 1 
5f34 : 65 5b __ ADC T8 + 1 
5f36 : c8 __ __ INY
5f37 : 91 23 __ STA (SP + 0),y 
5f39 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
5f3c : a5 52 __ LDA T0 + 0 
5f3e : 85 11 __ STA P4 
5f40 : a9 00 __ LDA #$00
5f42 : 85 13 __ STA P6 
5f44 : a9 89 __ LDA #$89
5f46 : 85 14 __ STA P7 
5f48 : 18 __ __ CLC
5f49 : a5 58 __ LDA T5 + 0 
5f4b : 65 56 __ ADC T3 + 0 
5f4d : 85 12 __ STA P5 
5f4f : 20 cc 81 JSR $81cc ; (vdc_prints_attr@proxy + 0)
5f52 : 18 __ __ CLC
5f53 : a5 5a __ LDA T8 + 0 
5f55 : 69 10 __ ADC #$10
5f57 : 85 5a __ STA T8 + 0 
5f59 : 90 02 __ BCC $5f5d ; (menu_pulldown.s1053 + 0)
.s1052:
5f5b : e6 5b __ INC T8 + 1 
.s1053:
5f5d : e6 58 __ INC T5 + 0 
5f5f : a5 58 __ LDA T5 + 0 
5f61 : c5 57 __ CMP T4 + 0 
5f63 : 90 b1 __ BCC $5f16 ; (menu_pulldown.l1050 + 0)
.l5:
5f65 : a9 2d __ LDA #$2d
5f67 : a0 06 __ LDY #$06
5f69 : 91 23 __ STA (SP + 0),y 
5f6b : a9 00 __ LDA #$00
5f6d : c8 __ __ INY
5f6e : 91 23 __ STA (SP + 0),y 
5f70 : a9 00 __ LDA #$00
5f72 : a0 02 __ LDY #$02
5f74 : 91 23 __ STA (SP + 0),y 
5f76 : a9 89 __ LDA #$89
5f78 : c8 __ __ INY
5f79 : 91 23 __ STA (SP + 0),y 
5f7b : a9 e7 __ LDA #$e7
5f7d : c8 __ __ INY
5f7e : 91 23 __ STA (SP + 0),y 
5f80 : a9 60 __ LDA #$60
5f82 : c8 __ __ INY
5f83 : 91 23 __ STA (SP + 0),y 
5f85 : a5 59 __ LDA T6 + 0 
5f87 : 0a __ __ ASL
5f88 : 2a __ __ ROL
5f89 : 2a __ __ ROL
5f8a : 2a __ __ ROL
5f8b : a8 __ __ TAY
5f8c : 29 07 __ AND #$07
5f8e : 2a __ __ ROL
5f8f : aa __ __ TAX
5f90 : 98 __ __ TYA
5f91 : 29 f0 __ AND #$f0
5f93 : 38 __ __ SEC
5f94 : e9 10 __ SBC #$10
5f96 : b0 01 __ BCS $5f99 ; (menu_pulldown.s1055 + 0)
.s1054:
5f98 : ca __ __ DEX
.s1055:
5f99 : 18 __ __ CLC
5f9a : 65 54 __ ADC T2 + 0 
5f9c : a0 08 __ LDY #$08
5f9e : 91 23 __ STA (SP + 0),y 
5fa0 : 8a __ __ TXA
5fa1 : 65 55 __ ADC T2 + 1 
5fa3 : c8 __ __ INY
5fa4 : 91 23 __ STA (SP + 0),y 
5fa6 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
5fa9 : a9 00 __ LDA #$00
5fab : 85 13 __ STA P6 
5fad : a9 89 __ LDA #$89
5faf : 85 14 __ STA P7 
5fb1 : ad f8 ab LDA $abf8 ; (sstack + 5)
5fb4 : 85 11 __ STA P4 
5fb6 : ad f9 ab LDA $abf9 ; (sstack + 6)
5fb9 : 85 56 __ STA T3 + 0 
5fbb : 18 __ __ CLC
5fbc : 65 59 __ ADC T6 + 0 
5fbe : 38 __ __ SEC
5fbf : e9 01 __ SBC #$01
5fc1 : 85 12 __ STA P5 
5fc3 : ad f5 82 LDA $82f5 ; (mc_pd_select + 0)
5fc6 : 85 15 __ STA P8 
5fc8 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
.l7:
5fcb : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
5fce : a5 1b __ LDA ACCU + 0 
5fd0 : 85 5a __ STA T8 + 0 
5fd2 : c9 0d __ CMP #$0d
5fd4 : f0 18 __ BEQ $5fee ; (menu_pulldown.s8 + 0)
.s14:
5fd6 : c9 9d __ CMP #$9d
5fd8 : f0 14 __ BEQ $5fee ; (menu_pulldown.s8 + 0)
.s13:
5fda : c9 1d __ CMP #$1d
5fdc : f0 10 __ BEQ $5fee ; (menu_pulldown.s8 + 0)
.s12:
5fde : c9 91 __ CMP #$91
5fe0 : f0 0c __ BEQ $5fee ; (menu_pulldown.s8 + 0)
.s11:
5fe2 : c9 11 __ CMP #$11
5fe4 : f0 08 __ BEQ $5fee ; (menu_pulldown.s8 + 0)
.s10:
5fe6 : c9 1b __ CMP #$1b
5fe8 : f0 04 __ BEQ $5fee ; (menu_pulldown.s8 + 0)
.s9:
5fea : c9 03 __ CMP #$03
5fec : d0 dd __ BNE $5fcb ; (menu_pulldown.l7 + 0)
.s8:
5fee : a5 1b __ LDA ACCU + 0 
5ff0 : c9 1b __ CMP #$1b
5ff2 : d0 03 __ BNE $5ff7 ; (menu_pulldown.s42 + 0)
5ff4 : 4c c9 60 JMP $60c9 ; (menu_pulldown.s16 + 0)
.s42:
5ff7 : b0 03 __ BCS $5ffc ; (menu_pulldown.s43 + 0)
5ff9 : 4c b9 60 JMP $60b9 ; (menu_pulldown.s44 + 0)
.s43:
5ffc : c9 91 __ CMP #$91
5ffe : f0 43 __ BEQ $6043 ; (menu_pulldown.s29 + 0)
.s50:
6000 : b0 2f __ BCS $6031 ; (menu_pulldown.s51 + 0)
.s52:
6002 : c9 1d __ CMP #$1d
6004 : f0 03 __ BEQ $6009 ; (menu_pulldown.s25 + 0)
6006 : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s25:
6009 : a5 53 __ LDA T1 + 0 
600b : d0 03 __ BNE $6010 ; (menu_pulldown.s26 + 0)
600d : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s26:
6010 : a9 13 __ LDA #$13
.s1049:
6012 : 85 59 __ STA T6 + 0 
.s6:
6014 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
6017 : a5 59 __ LDA T6 + 0 
6019 : 85 1b __ STA ACCU + 0 
.s1001:
601b : 18 __ __ CLC
601c : a5 23 __ LDA SP + 0 
601e : 69 0a __ ADC #$0a
6020 : 85 23 __ STA SP + 0 
6022 : 90 02 __ BCC $6026 ; (menu_pulldown.s1001 + 11)
6024 : e6 24 __ INC SP + 1 
6026 : a2 08 __ LDX #$08
6028 : bd c8 ab LDA $abc8,x ; (buff + 35)
602b : 95 53 __ STA T1 + 0,x 
602d : ca __ __ DEX
602e : 10 f8 __ BPL $6028 ; (menu_pulldown.s1001 + 13)
6030 : 60 __ __ RTS
.s51:
6031 : c9 9d __ CMP #$9d
6033 : f0 03 __ BEQ $6038 ; (menu_pulldown.s21 + 0)
6035 : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s21:
6038 : a5 53 __ LDA T1 + 0 
603a : d0 03 __ BNE $603f ; (menu_pulldown.s22 + 0)
603c : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s22:
603f : a9 12 __ LDA #$12
6041 : d0 cf __ BNE $6012 ; (menu_pulldown.s1049 + 0)
.s29:
6043 : a9 00 __ LDA #$00
6045 : a0 02 __ LDY #$02
6047 : 91 23 __ STA (SP + 0),y 
6049 : a9 89 __ LDA #$89
604b : c8 __ __ INY
604c : 91 23 __ STA (SP + 0),y 
604e : a9 e2 __ LDA #$e2
6050 : c8 __ __ INY
6051 : 91 23 __ STA (SP + 0),y 
6053 : a9 60 __ LDA #$60
6055 : c8 __ __ INY
6056 : 91 23 __ STA (SP + 0),y 
6058 : a5 59 __ LDA T6 + 0 
605a : 0a __ __ ASL
605b : 2a __ __ ROL
605c : 2a __ __ ROL
605d : 2a __ __ ROL
605e : a8 __ __ TAY
605f : 29 07 __ AND #$07
6061 : 2a __ __ ROL
6062 : aa __ __ TAX
6063 : 98 __ __ TYA
6064 : 29 f0 __ AND #$f0
6066 : 38 __ __ SEC
6067 : e9 10 __ SBC #$10
6069 : b0 01 __ BCS $606c ; (menu_pulldown.s1057 + 0)
.s1056:
606b : ca __ __ DEX
.s1057:
606c : 18 __ __ CLC
606d : 65 54 __ ADC T2 + 0 
606f : a0 06 __ LDY #$06
6071 : 91 23 __ STA (SP + 0),y 
6073 : 8a __ __ TXA
6074 : 65 55 __ ADC T2 + 1 
6076 : c8 __ __ INY
6077 : 91 23 __ STA (SP + 0),y 
6079 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
607c : a9 00 __ LDA #$00
607e : 85 13 __ STA P6 
6080 : a9 89 __ LDA #$89
6082 : 85 14 __ STA P7 
6084 : ad f8 ab LDA $abf8 ; (sstack + 5)
6087 : 85 11 __ STA P4 
6089 : 18 __ __ CLC
608a : a5 59 __ LDA T6 + 0 
608c : 65 56 __ ADC T3 + 0 
608e : 38 __ __ SEC
608f : e9 01 __ SBC #$01
6091 : 85 12 __ STA P5 
6093 : 20 cc 81 JSR $81cc ; (vdc_prints_attr@proxy + 0)
6096 : a5 5a __ LDA T8 + 0 
6098 : c9 91 __ CMP #$91
609a : d0 0e __ BNE $60aa ; (menu_pulldown.s31 + 0)
.s30:
609c : c6 59 __ DEC T6 + 0 
609e : f0 03 __ BEQ $60a3 ; (menu_pulldown.s33 + 0)
60a0 : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s33:
60a3 : a5 57 __ LDA T4 + 0 
.s1048:
60a5 : 85 59 __ STA T6 + 0 
60a7 : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s31:
60aa : e6 59 __ INC T6 + 0 
60ac : a5 57 __ LDA T4 + 0 
60ae : c5 59 __ CMP T6 + 0 
60b0 : 90 03 __ BCC $60b5 ; (menu_pulldown.s36 + 0)
60b2 : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s36:
60b5 : a9 01 __ LDA #$01
60b7 : 90 ec __ BCC $60a5 ; (menu_pulldown.s1048 + 0)
.s44:
60b9 : c9 0d __ CMP #$0d
60bb : d0 03 __ BNE $60c0 ; (menu_pulldown.s45 + 0)
60bd : 4c 14 60 JMP $6014 ; (menu_pulldown.s6 + 0)
.s45:
60c0 : b0 16 __ BCS $60d8 ; (menu_pulldown.s46 + 0)
.s47:
60c2 : c9 03 __ CMP #$03
60c4 : f0 03 __ BEQ $60c9 ; (menu_pulldown.s16 + 0)
60c6 : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s16:
60c9 : ad fb ab LDA $abfb ; (sstack + 8)
60cc : c9 01 __ CMP #$01
60ce : f0 03 __ BEQ $60d3 ; (menu_pulldown.s17 + 0)
60d0 : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
.s17:
60d3 : a9 00 __ LDA #$00
60d5 : 4c 12 60 JMP $6012 ; (menu_pulldown.s1049 + 0)
.s46:
60d8 : c9 11 __ CMP #$11
60da : d0 03 __ BNE $60df ; (menu_pulldown.s46 + 7)
60dc : 4c 43 60 JMP $6043 ; (menu_pulldown.s29 + 0)
60df : 4c 65 5f JMP $5f65 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
60e2 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
60e7 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
vdc_underline: ; vdc_underline(u8)->void
.s0:
60ed : 09 00 __ ORA #$00
60ef : d0 08 __ BNE $60f9 ; (vdc_underline.s1 + 0)
.s2:
60f1 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
60f4 : 29 df __ AND #$df
60f6 : 4c fe 60 JMP $60fe ; (vdc_underline.s3 + 0)
.s1:
60f9 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
60fc : 09 20 __ ORA #$20
.s3:
60fe : 8d b4 87 STA $87b4 ; (vdc_state + 7)
.s1001:
6101 : 60 __ __ RTS
--------------------------------------------------------------------
choosedeviceid: ; choosedeviceid(u8)->u8
.s1000:
6102 : 38 __ __ SEC
6103 : a5 23 __ LDA SP + 0 
6105 : e9 08 __ SBC #$08
6107 : 85 23 __ STA SP + 0 
6109 : b0 02 __ BCS $610d ; (choosedeviceid.s0 + 0)
610b : c6 24 __ DEC SP + 1 
.s0:
610d : a9 00 __ LDA #$00
610f : 85 13 __ STA P6 
6111 : a9 62 __ LDA #$62
6113 : 85 14 __ STA P7 
6115 : 20 02 81 JSR $8102 ; (vdc_prints_attr@proxy + 0)
6118 : a9 11 __ LDA #$11
611a : 85 13 __ STA P6 
611c : a9 62 __ LDA #$62
611e : 85 14 __ STA P7 
6120 : 20 74 81 JSR $8174 ; (vdc_prints_attr@proxy + 0)
6123 : ad f5 82 LDA $82f5 ; (mc_pd_select + 0)
6126 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
.l3:
6129 : a9 00 __ LDA #$00
612b : a0 02 __ LDY #$02
612d : 91 23 __ STA (SP + 0),y 
612f : a9 89 __ LDA #$89
6131 : c8 __ __ INY
6132 : 91 23 __ STA (SP + 0),y 
6134 : a9 55 __ LDA #$55
6136 : c8 __ __ INY
6137 : 91 23 __ STA (SP + 0),y 
6139 : a9 41 __ LDA #$41
613b : c8 __ __ INY
613c : 91 23 __ STA (SP + 0),y 
613e : ad ac 87 LDA $87ac ; (targetdevice + 0)
6141 : 85 4f __ STA T1 + 0 
6143 : c8 __ __ INY
6144 : 91 23 __ STA (SP + 0),y 
6146 : a9 00 __ LDA #$00
6148 : c8 __ __ INY
6149 : 91 23 __ STA (SP + 0),y 
614b : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
614e : a9 09 __ LDA #$09
6150 : 85 12 __ STA P5 
6152 : a9 00 __ LDA #$00
6154 : 85 13 __ STA P6 
6156 : a9 89 __ LDA #$89
6158 : 85 14 __ STA P7 
615a : 20 de 80 JSR $80de ; (vdc_prints_attr@proxy + 0)
615d : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
6160 : a5 1b __ LDA ACCU + 0 
6162 : 85 4e __ STA T0 + 0 
6164 : c9 2b __ CMP #$2b
6166 : f0 71 __ BEQ $61d9 ; (choosedeviceid.l88 + 0)
.s30:
6168 : c9 2d __ CMP #$2d
616a : d0 1f __ BNE $618b ; (choosedeviceid.s6 + 0)
.l94:
616c : c6 4f __ DEC T1 + 0 
616e : a5 4f __ LDA T1 + 0 
6170 : 8d ac 87 STA $87ac ; (targetdevice + 0)
6173 : c9 08 __ CMP #$08
6175 : b0 05 __ BCS $617c ; (choosedeviceid.s1022 + 0)
.s18:
6177 : a9 1e __ LDA #$1e
6179 : 8d ac 87 STA $87ac ; (targetdevice + 0)
.s1022:
617c : 20 36 15 JSR $1536 ; (bnk_iec_active.s1000 + 0)
617f : 09 00 __ ORA #$00
6181 : d0 08 __ BNE $618b ; (choosedeviceid.s6 + 0)
.s22:
6183 : ad ac 87 LDA $87ac ; (targetdevice + 0)
6186 : 85 4f __ STA T1 + 0 
6188 : 4c 6c 61 JMP $616c ; (choosedeviceid.l94 + 0)
.s6:
618b : a5 4e __ LDA T0 + 0 
618d : c9 0d __ CMP #$0d
618f : f0 08 __ BEQ $6199 ; (choosedeviceid.s4 + 0)
.s33:
6191 : c9 03 __ CMP #$03
6193 : f0 04 __ BEQ $6199 ; (choosedeviceid.s4 + 0)
.s32:
6195 : c9 1b __ CMP #$1b
6197 : d0 90 __ BNE $6129 ; (choosedeviceid.l3 + 0)
.s4:
6199 : a9 15 __ LDA #$15
619b : 85 11 __ STA P4 
619d : a9 09 __ LDA #$09
619f : 85 12 __ STA P5 
61a1 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
61a4 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
61a7 : 85 15 __ STA P8 
61a9 : 20 69 81 JSR $8169 ; (vdc_prints_attr@proxy + 0)
61ac : a9 14 __ LDA #$14
61ae : 85 0f __ STA P2 
61b0 : a9 28 __ LDA #$28
61b2 : 85 13 __ STA P6 
61b4 : a9 0a __ LDA #$0a
61b6 : 85 14 __ STA P7 
61b8 : 20 36 82 JSR $8236 ; (vdc_clear@proxy + 0)
61bb : a5 4e __ LDA T0 + 0 
61bd : c9 1b __ CMP #$1b
61bf : f0 04 __ BEQ $61c5 ; (choosedeviceid.s35 + 0)
.s38:
61c1 : c9 03 __ CMP #$03
61c3 : d0 04 __ BNE $61c9 ; (choosedeviceid.s37 + 0)
.s35:
61c5 : a9 00 __ LDA #$00
61c7 : f0 02 __ BEQ $61cb ; (choosedeviceid.s1001 + 0)
.s37:
61c9 : a9 01 __ LDA #$01
.s1001:
61cb : 85 1b __ STA ACCU + 0 
61cd : 18 __ __ CLC
61ce : a5 23 __ LDA SP + 0 
61d0 : 69 08 __ ADC #$08
61d2 : 85 23 __ STA SP + 0 
61d4 : 90 02 __ BCC $61d8 ; (choosedeviceid.s1001 + 13)
61d6 : e6 24 __ INC SP + 1 
61d8 : 60 __ __ RTS
.l88:
61d9 : a6 4f __ LDX T1 + 0 
61db : e8 __ __ INX
61dc : 8e ac 87 STX $87ac ; (targetdevice + 0)
61df : 8a __ __ TXA
61e0 : e0 1f __ CPX #$1f
61e2 : 90 05 __ BCC $61e9 ; (choosedeviceid.s1020 + 0)
.s8:
61e4 : a9 08 __ LDA #$08
61e6 : 8d ac 87 STA $87ac ; (targetdevice + 0)
.s1020:
61e9 : 20 36 15 JSR $1536 ; (bnk_iec_active.s1000 + 0)
61ec : 09 00 __ ORA #$00
61ee : d0 9b __ BNE $618b ; (choosedeviceid.s6 + 0)
.s12:
61f0 : ad ac 87 LDA $87ac ; (targetdevice + 0)
61f3 : 85 4f __ STA T1 + 0 
61f5 : 4c d9 61 JMP $61d9 ; (choosedeviceid.l88 + 0)
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s0:
61f8 : 4c c3 ff JMP $ffc3 
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
61fb : 4c b7 ff JMP $ffb7 
--------------------------------------------------------------------
spentry:
61fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
61ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
6200 : __ __ __ BYT 63 48 4f 4f 53 45 20 44 52 49 56 45 20 69 64 3a : cHOOSE DRIVE id:
6210 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
6211 : __ __ __ BYT 63 48 41 4e 47 45 20 57 49 54 48 20 2b 20 2f 20 : cHANGE WITH + / 
6221 : __ __ __ BYT 2d 20 4b 45 59 2c 20 72 65 74 20 54 4f 20 53 45 : - KEY, ret TO SE
6231 : __ __ __ BYT 4c 45 43 54 2e 00                               : LECT..
--------------------------------------------------------------------
6237 : __ __ __ BYT 63 48 4f 4f 53 45 20 46 49 4c 45 4e 41 4d 45 3a : cHOOSE FILENAME:
6247 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
checkiffileexists: ; checkiffileexists(u8*,u8)->u8
.s1000:
6248 : 38 __ __ SEC
6249 : a5 23 __ LDA SP + 0 ; (filetocheck + 1)
624b : e9 0a __ SBC #$0a
624d : 85 23 __ STA SP + 0 ; (filetocheck + 1)
624f : b0 02 __ BCS $6253 ; (checkiffileexists.s0 + 0)
6251 : c6 24 __ DEC SP + 1 ; (id + 0)
.s0:
6253 : a9 51 __ LDA #$51
6255 : a0 02 __ LDY #$02
6257 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6259 : a9 89 __ LDA #$89
625b : c8 __ __ INY
625c : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
625e : a9 c5 __ LDA #$c5
6260 : c8 __ __ INY
6261 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6263 : a9 62 __ LDA #$62
6265 : c8 __ __ INY
6266 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6268 : ad fc ab LDA $abfc ; (sstack + 9)
626b : c8 __ __ INY
626c : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
626e : ad fd ab LDA $abfd ; (sstack + 10)
6271 : c8 __ __ INY
6272 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6274 : ad fc ab LDA $abfc ; (sstack + 9)
6277 : c8 __ __ INY
6278 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
627a : ad fd ab LDA $abfd ; (sstack + 10)
627d : c8 __ __ INY
627e : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6280 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
6283 : a9 51 __ LDA #$51
6285 : 85 14 __ STA P7 
6287 : a9 89 __ LDA #$89
6289 : 85 15 __ STA P8 
628b : ad fe ab LDA $abfe ; (sstack + 11)
628e : 85 13 __ STA P6 
6290 : 20 da 62 JSR $62da ; (cmd.s0 + 0)
6293 : a5 1b __ LDA ACCU + 0 
6295 : c9 3f __ CMP #$3f
6297 : f0 1f __ BEQ $62b8 ; (checkiffileexists.s1 + 0)
.s2:
6299 : 09 00 __ ORA #$00
629b : f0 04 __ BEQ $62a1 ; (checkiffileexists.s3 + 0)
.s10:
629d : c9 3e __ CMP #$3e
629f : d0 04 __ BNE $62a5 ; (checkiffileexists.s7 + 0)
.s3:
62a1 : a9 01 __ LDA #$01
62a3 : d0 05 __ BNE $62aa ; (checkiffileexists.s1001 + 0)
.s7:
62a5 : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s1008:
62a8 : a9 00 __ LDA #$00
.s1001:
62aa : 85 1b __ STA ACCU + 0 
62ac : 18 __ __ CLC
62ad : a5 23 __ LDA SP + 0 ; (filetocheck + 1)
62af : 69 0a __ ADC #$0a
62b1 : 85 23 __ STA SP + 0 ; (filetocheck + 1)
62b3 : 90 02 __ BCC $62b7 ; (checkiffileexists.s1001 + 13)
62b5 : e6 24 __ INC SP + 1 ; (id + 0)
62b7 : 60 __ __ RTS
.s1:
62b8 : 20 20 64 JSR $6420 ; (menu_areyousure.s1000 + 0)
62bb : a5 1b __ LDA ACCU + 0 
62bd : c9 02 __ CMP #$02
62bf : f0 e7 __ BEQ $62a8 ; (checkiffileexists.s1008 + 0)
.s5:
62c1 : a9 02 __ LDA #$02
62c3 : d0 e5 __ BNE $62aa ; (checkiffileexists.s1001 + 0)
--------------------------------------------------------------------
62c5 : __ __ __ BYT 52 30 3a 25 53 3d 25 53 00                      : R0:%S=%S.
--------------------------------------------------------------------
cmd@proxy: ; cmd@proxy
62ce : a5 55 __ LDA $55 
62d0 : 85 13 __ STA P6 
62d2 : a9 51 __ LDA #$51
62d4 : 85 14 __ STA P7 
62d6 : a9 89 __ LDA #$89
62d8 : 85 15 __ STA P8 
--------------------------------------------------------------------
cmd: ; cmd(const u8,const u8*)->u16
.s0:
62da : a9 00 __ LDA #$00
62dc : 85 0d __ STA P0 
62de : 85 0e __ STA P1 
62e0 : 20 b6 2a JSR $2ab6 ; (krnio_setbnk.s0 + 0)
62e3 : a5 14 __ LDA P7 ; (cmd + 0)
62e5 : 85 0d __ STA P0 
62e7 : a5 15 __ LDA P8 ; (cmd + 1)
62e9 : 85 0e __ STA P1 
62eb : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
62ee : a9 0f __ LDA #$0f
62f0 : 85 0d __ STA P0 
62f2 : 85 0f __ STA P2 
62f4 : a5 13 __ LDA P6 ; (device + 0)
62f6 : 85 0e __ STA P1 
62f8 : 20 5d 63 JSR $635d ; (krnio_open.s0 + 0)
62fb : 09 00 __ ORA #$00
62fd : d0 08 __ BNE $6307 ; (cmd.s4 + 0)
.s2:
62ff : a9 0f __ LDA #$0f
6301 : 20 c3 ff JSR $ffc3 
6304 : 4c 34 63 JMP $6334 ; (cmd.s1002 + 0)
.s4:
6307 : a9 0f __ LDA #$0f
6309 : 85 0e __ STA P1 
630b : a9 28 __ LDA #$28
630d : 85 11 __ STA P4 
630f : a9 00 __ LDA #$00
6311 : 8d c1 8a STA $8ac1 ; (DOSstatus + 0)
6314 : 85 12 __ STA P5 
6316 : a9 c1 __ LDA #$c1
6318 : 85 0f __ STA P2 
631a : a9 8a __ LDA #$8a
631c : 85 10 __ STA P3 
631e : 20 87 63 JSR $6387 ; (krnio_read.s0 + 0)
6321 : a5 1b __ LDA ACCU + 0 
6323 : 85 47 __ STA T0 + 0 
6325 : a5 1c __ LDA ACCU + 1 
6327 : 85 48 __ STA T0 + 1 
6329 : a9 0f __ LDA #$0f
632b : 20 c3 ff JSR $ffc3 
632e : a5 47 __ LDA T0 + 0 
6330 : 05 48 __ ORA T0 + 1 
6332 : d0 06 __ BNE $633a ; (cmd.s18 + 0)
.s1002:
6334 : 20 b7 ff JSR $ffb7 
6337 : 4c 4e 63 JMP $634e ; (cmd.s1001 + 0)
.s18:
633a : ad c1 8a LDA $8ac1 ; (DOSstatus + 0)
633d : 0a __ __ ASL
633e : 0a __ __ ASL
633f : 18 __ __ CLC
6340 : 6d c1 8a ADC $8ac1 ; (DOSstatus + 0)
6343 : 0a __ __ ASL
6344 : 38 __ __ SEC
6345 : e9 e0 __ SBC #$e0
6347 : 18 __ __ CLC
6348 : 6d c2 8a ADC $8ac2 ; (DOSstatus + 1)
634b : 38 __ __ SEC
634c : e9 30 __ SBC #$30
.s1001:
634e : 85 1b __ STA ACCU + 0 
6350 : a9 00 __ LDA #$00
6352 : 85 1c __ STA ACCU + 1 
6354 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open@proxy: ; krnio_open@proxy
6355 : a9 01 __ LDA #$01
6357 : 85 0d __ STA P0 
6359 : a9 02 __ LDA #$02
635b : 85 0f __ STA P2 
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
635d : a9 00 __ LDA #$00
635f : a6 0d __ LDX P0 ; (fnum + 0)
6361 : 9d 7a 87 STA $877a,x ; (krnio_pstatus + 0)
6364 : a9 00 __ LDA #$00
6366 : 85 1b __ STA ACCU + 0 
6368 : 85 1c __ STA ACCU + 1 
636a : a5 0d __ LDA P0 ; (fnum + 0)
636c : a6 0e __ LDX P1 
636e : a4 0f __ LDY P2 
6370 : 20 ba ff JSR $ffba 
6373 : 20 c0 ff JSR $ffc0 
6376 : 90 08 __ BCC $6380 ; (krnio_open.s0 + 35)
6378 : a5 0d __ LDA P0 ; (fnum + 0)
637a : 20 c3 ff JSR $ffc3 
637d : 4c 84 63 JMP $6384 ; (krnio_open.s1001 + 0)
6380 : a9 01 __ LDA #$01
6382 : 85 1b __ STA ACCU + 0 
.s1001:
6384 : a5 1b __ LDA ACCU + 0 
6386 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
.s0:
6387 : a6 0e __ LDX P1 ; (fnum + 0)
6389 : bd 7a 87 LDA $877a,x ; (krnio_pstatus + 0)
638c : c9 40 __ CMP #$40
638e : d0 04 __ BNE $6394 ; (krnio_read.s3 + 0)
.s1:
6390 : a9 00 __ LDA #$00
6392 : f0 0c __ BEQ $63a0 ; (krnio_read.s1010 + 0)
.s3:
6394 : 86 43 __ STX T1 + 0 
6396 : 8a __ __ TXA
6397 : 20 ff 63 JSR $63ff ; (krnio_chkin.s1000 + 0)
639a : 09 00 __ ORA #$00
639c : d0 07 __ BNE $63a5 ; (krnio_read.s5 + 0)
.s6:
639e : a9 ff __ LDA #$ff
.s1010:
63a0 : 85 1b __ STA ACCU + 0 
.s1001:
63a2 : 85 1c __ STA ACCU + 1 
63a4 : 60 __ __ RTS
.s5:
63a5 : a9 00 __ LDA #$00
63a7 : 85 44 __ STA T3 + 0 
63a9 : 85 45 __ STA T3 + 1 
63ab : a5 12 __ LDA P5 ; (num + 1)
63ad : 30 44 __ BMI $63f3 ; (krnio_read.s10 + 0)
.s1007:
63af : 05 11 __ ORA P4 ; (num + 0)
63b1 : f0 40 __ BEQ $63f3 ; (krnio_read.s10 + 0)
.l9:
63b3 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
63b6 : a5 1b __ LDA ACCU + 0 
63b8 : 85 46 __ STA T4 + 0 
63ba : 20 b7 ff JSR $ffb7 
63bd : a6 43 __ LDX T1 + 0 
63bf : 9d 7a 87 STA $877a,x ; (krnio_pstatus + 0)
63c2 : aa __ __ TAX
63c3 : f0 04 __ BEQ $63c9 ; (krnio_read.s13 + 0)
.s14:
63c5 : c9 40 __ CMP #$40
63c7 : d0 2a __ BNE $63f3 ; (krnio_read.s10 + 0)
.s13:
63c9 : a5 44 __ LDA T3 + 0 
63cb : 85 1b __ STA ACCU + 0 
63cd : 18 __ __ CLC
63ce : a5 10 __ LDA P3 ; (data + 1)
63d0 : 65 45 __ ADC T3 + 1 
63d2 : 85 1c __ STA ACCU + 1 
63d4 : a5 46 __ LDA T4 + 0 
63d6 : a4 0f __ LDY P2 ; (data + 0)
63d8 : 91 1b __ STA (ACCU + 0),y 
63da : e6 44 __ INC T3 + 0 
63dc : d0 02 __ BNE $63e0 ; (krnio_read.s1012 + 0)
.s1011:
63de : e6 45 __ INC T3 + 1 
.s1012:
63e0 : 8a __ __ TXA
63e1 : d0 10 __ BNE $63f3 ; (krnio_read.s10 + 0)
.s8:
63e3 : 24 12 __ BIT P5 ; (num + 1)
63e5 : 30 0c __ BMI $63f3 ; (krnio_read.s10 + 0)
.s1004:
63e7 : a5 45 __ LDA T3 + 1 
63e9 : c5 12 __ CMP P5 ; (num + 1)
63eb : d0 04 __ BNE $63f1 ; (krnio_read.s1003 + 0)
.s1002:
63ed : a5 44 __ LDA T3 + 0 
63ef : c5 11 __ CMP P4 ; (num + 0)
.s1003:
63f1 : 90 c0 __ BCC $63b3 ; (krnio_read.l9 + 0)
.s10:
63f3 : 20 cc ff JSR $ffcc 
63f6 : a5 44 __ LDA T3 + 0 
63f8 : 85 1b __ STA ACCU + 0 
63fa : a5 45 __ LDA T3 + 1 
63fc : 4c a2 63 JMP $63a2 ; (krnio_read.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
63ff : 85 0d __ STA P0 
.s0:
6401 : a6 0d __ LDX P0 
6403 : 20 c6 ff JSR $ffc6 
6406 : a9 00 __ LDA #$00
6408 : 85 1c __ STA ACCU + 1 
640a : b0 02 __ BCS $640e ; (krnio_chkin.s0 + 13)
640c : a9 01 __ LDA #$01
640e : 85 1b __ STA ACCU + 0 
.s1001:
6410 : a5 1b __ LDA ACCU + 0 
6412 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
6413 : 20 cf ff JSR $ffcf 
6416 : 85 1b __ STA ACCU + 0 
6418 : a9 00 __ LDA #$00
641a : 85 1c __ STA ACCU + 1 
.s1001:
641c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
641d : 4c cc ff JMP $ffcc 
--------------------------------------------------------------------
menu_areyousure: ; menu_areyousure(const u8*)->u8
.s1000:
6420 : a5 53 __ LDA T0 + 0 
6422 : 8d c6 ab STA $abc6 ; (buff + 33)
6425 : a5 54 __ LDA T1 + 0 
6427 : 8d c7 ab STA $abc7 ; (buff + 34)
.s0:
642a : a9 00 __ LDA #$00
642c : 85 17 __ STA P10 
642e : a9 08 __ LDA #$08
6430 : 85 18 __ STA P11 
6432 : 8d f3 ab STA $abf3 ; (sstack + 0)
6435 : a9 1e __ LDA #$1e
6437 : 8d f4 ab STA $abf4 ; (sstack + 1)
643a : a9 06 __ LDA #$06
643c : 8d f5 ab STA $abf5 ; (sstack + 2)
643f : ad b4 87 LDA $87b4 ; (vdc_state + 7)
6442 : 85 54 __ STA T1 + 0 
6444 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
6447 : 85 53 __ STA T0 + 0 
6449 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
644c : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
644f : a9 0a __ LDA #$0a
6451 : 85 11 __ STA P4 
6453 : a9 09 __ LDA #$09
6455 : 85 12 __ STA P5 
6457 : a5 53 __ LDA T0 + 0 
6459 : 85 15 __ STA P8 
645b : a9 a5 __ LDA #$a5
645d : 85 13 __ STA P6 
645f : a9 64 __ LDA #$64
6461 : 85 14 __ STA P7 
6463 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
6466 : e6 12 __ INC P5 
6468 : a9 b2 __ LDA #$b2
646a : 85 13 __ STA P6 
646c : a9 64 __ LDA #$64
646e : 85 14 __ STA P7 
6470 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
6473 : a9 19 __ LDA #$19
6475 : 8d f8 ab STA $abf8 ; (sstack + 5)
6478 : a9 0b __ LDA #$0b
647a : 8d f9 ab STA $abf9 ; (sstack + 6)
647d : a9 07 __ LDA #$07
647f : 8d fa ab STA $abfa ; (sstack + 7)
6482 : a9 00 __ LDA #$00
6484 : 8d fb ab STA $abfb ; (sstack + 8)
6487 : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
648a : a5 1b __ LDA ACCU + 0 
648c : 85 53 __ STA T0 + 0 
648e : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
6491 : a5 54 __ LDA T1 + 0 
6493 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
6496 : a5 53 __ LDA T0 + 0 
6498 : 85 1b __ STA ACCU + 0 
.s1001:
649a : ad c6 ab LDA $abc6 ; (buff + 33)
649d : 85 53 __ STA T0 + 0 
649f : ad c7 ab LDA $abc7 ; (buff + 34)
64a2 : 85 54 __ STA T1 + 0 
64a4 : 60 __ __ RTS
--------------------------------------------------------------------
64a5 : __ __ __ BYT 66 49 4c 45 20 45 58 49 53 54 53 2e 00          : fILE EXISTS..
--------------------------------------------------------------------
64b2 : __ __ __ BYT 61 52 45 20 59 4f 55 20 53 55 52 45 3f 00       : aRE YOU SURE?.
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
64c0 : a9 00 __ LDA #$00
64c2 : a6 0d __ LDX P0 
64c4 : a0 00 __ LDY #$00
64c6 : 20 ba ff JSR $ffba 
64c9 : a9 0e __ LDA #$0e
64cb : a6 10 __ LDX P3 
64cd : a4 11 __ LDY P4 
64cf : 20 d8 ff JSR $ffd8 
64d2 : a9 00 __ LDA #$00
64d4 : b0 02 __ BCS $64d8 ; (krnio_save.s0 + 24)
64d6 : a9 01 __ LDA #$01
64d8 : 85 1b __ STA ACCU + 0 
.s1001:
64da : a5 1b __ LDA ACCU + 0 
64dc : 60 __ __ RTS
--------------------------------------------------------------------
filepicker: ; filepicker(u8)->u8
.s1000:
64dd : a2 05 __ LDX #$05
64df : b5 53 __ LDA T0 + 0,x 
64e1 : 9d c8 ab STA $abc8,x ; (buff + 35)
64e4 : ca __ __ DEX
64e5 : 10 f8 __ BPL $64df ; (filepicker.s1000 + 2)
.s0:
64e7 : a9 0a __ LDA #$0a
64e9 : 85 18 __ STA P11 
64eb : a9 02 __ LDA #$02
64ed : 8d f3 ab STA $abf3 ; (sstack + 0)
64f0 : a9 3c __ LDA #$3c
64f2 : 8d f4 ab STA $abf4 ; (sstack + 1)
64f5 : a9 14 __ LDA #$14
64f7 : 8d f5 ab STA $abf5 ; (sstack + 2)
64fa : a9 00 __ LDA #$00
64fc : 85 17 __ STA P10 
64fe : a2 21 __ LDX #$21
.l1002:
6500 : ca __ __ DEX
6501 : 9d db 88 STA $88db,x ; (cwd + 0)
6504 : d0 fa __ BNE $6500 ; (filepicker.l1002 + 0)
.s1003:
6506 : 8d e9 8a STA $8ae9 ; (disk_id_buf + 0)
6509 : 8d ea 8a STA $8aea ; (disk_id_buf + 1)
650c : 8d eb 8a STA $8aeb ; (disk_id_buf + 2)
650f : 8d ec 8a STA $8aec ; (disk_id_buf + 3)
6512 : 8d ed 8a STA $8aed ; (disk_id_buf + 4)
6515 : a2 15 __ LDX #$15
.l1004:
6517 : ca __ __ DEX
6518 : 9d 97 87 STA $8797,x ; (filename + 0)
651b : d0 fa __ BNE $6517 ; (filepicker.l1004 + 0)
.s1005:
651d : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
6520 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
6523 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
6526 : a9 01 __ LDA #$01
6528 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
652b : a9 03 __ LDA #$03
652d : 85 12 __ STA P5 
652f : a9 00 __ LDA #$00
6531 : 85 13 __ STA P6 
6533 : a9 6a __ LDA #$6a
6535 : 85 14 __ STA P7 
6537 : 20 4e 81 JSR $814e ; (vdc_prints_attr@proxy + 0)
653a : a9 00 __ LDA #$00
653c : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
653f : ad ac 87 LDA $87ac ; (targetdevice + 0)
6542 : 8d fa ab STA $abfa ; (sstack + 7)
6545 : ad fc ab LDA $abfc ; (sstack + 9)
6548 : 8d fb ab STA $abfb ; (sstack + 8)
654b : 20 18 6a JSR $6a18 ; (refreshDir.s0 + 0)
654e : 20 b1 33 JSR $33b1 ; (updateMenu.s0 + 0)
.l2:
6551 : ad f4 88 LDA $88f4 ; (cwd + 25)
6554 : 85 54 __ STA T1 + 0 
6556 : 8d fe 88 STA $88fe ; (current + 0)
6559 : ad f5 88 LDA $88f5 ; (cwd + 26)
655c : 85 55 __ STA T1 + 1 
655e : 8d ff 88 STA $88ff ; (current + 1)
6561 : ad f8 88 LDA $88f8 ; (cwd + 29)
6564 : 85 56 __ STA T2 + 0 
6566 : ad f9 88 LDA $88f9 ; (cwd + 30)
6569 : 85 57 __ STA T2 + 1 
656b : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
656e : a5 1b __ LDA ACCU + 0 
6570 : 85 43 __ STA T3 + 0 
6572 : a5 1c __ LDA ACCU + 1 
6574 : 85 44 __ STA T3 + 1 
6576 : d0 09 __ BNE $6581 ; (filepicker.s88 + 0)
.s1060:
6578 : a5 1b __ LDA ACCU + 0 
657a : c9 32 __ CMP #$32
657c : d0 03 __ BNE $6581 ; (filepicker.s88 + 0)
657e : 4c 46 67 JMP $6746 ; (filepicker.s6 + 0)
.s88:
6581 : a5 56 __ LDA T2 + 0 
6583 : 85 1b __ STA ACCU + 0 
6585 : a5 57 __ LDA T2 + 1 
6587 : 85 1c __ STA ACCU + 1 
6589 : a9 0e __ LDA #$0e
658b : 85 03 __ STA WORK + 0 
658d : a9 00 __ LDA #$00
658f : 85 04 __ STA WORK + 1 
6591 : 20 c9 7c JSR $7cc9 ; (divmod + 0)
6594 : a5 1b __ LDA ACCU + 0 
6596 : 85 46 __ STA T5 + 0 
6598 : 0a __ __ ASL
6599 : 0a __ __ ASL
659a : 0a __ __ ASL
659b : 38 __ __ SEC
659c : e5 1b __ SBC ACCU + 0 
659e : 0a __ __ ASL
659f : 49 ff __ EOR #$ff
65a1 : 38 __ __ SEC
65a2 : 65 56 __ ADC T2 + 0 
65a4 : 85 58 __ STA T6 + 0 
65a6 : 18 __ __ CLC
65a7 : 69 06 __ ADC #$06
65a9 : 85 48 __ STA T7 + 0 
65ab : a5 44 __ LDA T3 + 1 
65ad : 10 03 __ BPL $65b2 ; (filepicker.s1059 + 0)
65af : 4c a8 68 JMP $68a8 ; (filepicker.s90 + 0)
.s1059:
65b2 : d0 09 __ BNE $65bd ; (filepicker.s89 + 0)
.s1058:
65b4 : a5 43 __ LDA T3 + 0 
65b6 : c9 32 __ CMP #$32
65b8 : b0 03 __ BCS $65bd ; (filepicker.s89 + 0)
65ba : 4c a8 68 JMP $68a8 ; (filepicker.s90 + 0)
.s89:
65bd : a5 44 __ LDA T3 + 1 
65bf : d0 90 __ BNE $6551 ; (filepicker.l2 + 0)
.s1032:
65c1 : a5 43 __ LDA T3 + 0 
65c3 : c9 55 __ CMP #$55
65c5 : d0 6f __ BNE $6636 ; (filepicker.s1031 + 0)
.s75:
65c7 : ad f2 88 LDA $88f2 ; (cwd + 23)
65ca : 0d f3 88 ORA $88f3 ; (cwd + 24)
65cd : f0 82 __ BEQ $6551 ; (filepicker.l2 + 0)
.s79:
65cf : a0 17 __ LDY #$17
65d1 : b1 54 __ LDA (T1 + 0),y 
65d3 : c8 __ __ INY
65d4 : 11 54 __ ORA (T1 + 0),y 
65d6 : d0 03 __ BNE $65db ; (filepicker.s76 + 0)
65d8 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s76:
65db : a5 48 __ LDA T7 + 0 
65dd : 8d f8 ab STA $abf8 ; (sstack + 5)
65e0 : a9 00 __ LDA #$00
65e2 : 8d f4 88 STA $88f4 ; (cwd + 25)
65e5 : 8d f5 88 STA $88f5 ; (cwd + 26)
65e8 : 20 4f 70 JSR $704f ; (printElementPriv.s1000 + 0)
65eb : a2 0e __ LDX #$0e
.l81:
65ed : ad fe 88 LDA $88fe ; (current + 0)
65f0 : 85 54 __ STA T1 + 0 
65f2 : ad ff 88 LDA $88ff ; (current + 1)
65f5 : 85 55 __ STA T1 + 1 
65f7 : a0 17 __ LDY #$17
65f9 : b1 54 __ LDA (T1 + 0),y 
65fb : 85 02 __ STA $02 
65fd : c8 __ __ INY
65fe : b1 54 __ LDA (T1 + 0),y 
6600 : a8 __ __ TAY
6601 : 05 02 __ ORA $02 
6603 : f0 22 __ BEQ $6627 ; (filepicker.s165 + 0)
.s84:
6605 : 8c ff 88 STY $88ff ; (current + 1)
6608 : 8c f5 88 STY $88f5 ; (cwd + 26)
660b : 8c f7 88 STY $88f7 ; (cwd + 28)
660e : a5 02 __ LDA $02 
6610 : 8d fe 88 STA $88fe ; (current + 0)
6613 : 8d f4 88 STA $88f4 ; (cwd + 25)
6616 : 8d f6 88 STA $88f6 ; (cwd + 27)
6619 : ad f8 88 LDA $88f8 ; (cwd + 29)
661c : 18 __ __ CLC
661d : 69 ff __ ADC #$ff
661f : 8d f8 88 STA $88f8 ; (cwd + 29)
6622 : b0 03 __ BCS $6627 ; (filepicker.s165 + 0)
.s1065:
6624 : ce f9 88 DEC $88f9 ; (cwd + 30)
.s165:
6627 : ca __ __ DEX
6628 : d0 c3 __ BNE $65ed ; (filepicker.l81 + 0)
.s222:
662a : ad ac 87 LDA $87ac ; (targetdevice + 0)
662d : 8d f9 ab STA $abf9 ; (sstack + 6)
6630 : 20 55 6a JSR $6a55 ; (printDir.s1000 + 0)
6633 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s1031:
6636 : b0 03 __ BCS $663b ; (filepicker.s1018 + 0)
6638 : 4c 68 67 JMP $6768 ; (filepicker.s106 + 0)
.s1018:
663b : c9 89 __ CMP #$89
663d : d0 03 __ BNE $6642 ; (filepicker.s1013 + 0)
663f : 4c 46 67 JMP $6746 ; (filepicker.s6 + 0)
.s1013:
6642 : b0 19 __ BCS $665d ; (filepicker.s1010 + 0)
.s114:
6644 : c9 85 __ CMP #$85
6646 : f0 03 __ BEQ $664b ; (filepicker.s5 + 0)
6648 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s5:
664b : ad fc ab LDA $abfc ; (sstack + 9)
664e : 8d fb ab STA $abfb ; (sstack + 8)
.s221:
6651 : ad ac 87 LDA $87ac ; (targetdevice + 0)
6654 : 8d fa ab STA $abfa ; (sstack + 7)
6657 : 20 18 6a JSR $6a18 ; (refreshDir.s0 + 0)
665a : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s1010:
665d : c9 91 __ CMP #$91
665f : f0 03 __ BEQ $6664 ; (filepicker.s42 + 0)
6661 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s42:
6664 : ad f2 88 LDA $88f2 ; (cwd + 23)
6667 : 0d f3 88 ORA $88f3 ; (cwd + 24)
666a : d0 03 __ BNE $666f ; (filepicker.s47 + 0)
666c : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s47:
666f : a5 54 __ LDA T1 + 0 
6671 : 05 55 __ ORA T1 + 1 
6673 : d0 03 __ BNE $6678 ; (filepicker.s46 + 0)
6675 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s46:
6678 : a0 17 __ LDY #$17
667a : b1 54 __ LDA (T1 + 0),y 
667c : 85 02 __ STA $02 
667e : c8 __ __ INY
667f : b1 54 __ LDA (T1 + 0),y 
6681 : 85 55 __ STA T1 + 1 
6683 : 05 02 __ ORA $02 
6685 : d0 03 __ BNE $668a ; (filepicker.s43 + 0)
6687 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s43:
668a : a5 02 __ LDA $02 
668c : 8d fe 88 STA $88fe ; (current + 0)
668f : 8d f4 88 STA $88f4 ; (cwd + 25)
6692 : a5 55 __ LDA T1 + 1 
6694 : 8d ff 88 STA $88ff ; (current + 1)
6697 : 8d f5 88 STA $88f5 ; (cwd + 26)
669a : 18 __ __ CLC
669b : a5 56 __ LDA T2 + 0 
669d : 69 ff __ ADC #$ff
669f : 8d f8 88 STA $88f8 ; (cwd + 29)
66a2 : a5 57 __ LDA T2 + 1 
66a4 : 69 ff __ ADC #$ff
66a6 : 8d f9 88 STA $88f9 ; (cwd + 30)
66a9 : 38 __ __ SEC
66aa : a5 56 __ LDA T2 + 0 
66ac : e9 01 __ SBC #$01
66ae : 85 1b __ STA ACCU + 0 
66b0 : a5 57 __ LDA T2 + 1 
66b2 : e9 00 __ SBC #$00
66b4 : 85 1c __ STA ACCU + 1 
66b6 : a9 0e __ LDA #$0e
66b8 : 85 03 __ STA WORK + 0 
66ba : a9 00 __ LDA #$00
66bc : 85 04 __ STA WORK + 1 
66be : 20 c9 7c JSR $7cc9 ; (divmod + 0)
66c1 : a5 46 __ LDA T5 + 0 
66c3 : c5 1b __ CMP ACCU + 0 
66c5 : f0 41 __ BEQ $6708 ; (filepicker.s49 + 0)
.s48:
66c7 : a2 0d __ LDX #$0d
.l52:
66c9 : ad fe 88 LDA $88fe ; (current + 0)
66cc : 85 56 __ STA T2 + 0 
66ce : ad ff 88 LDA $88ff ; (current + 1)
66d1 : 85 57 __ STA T2 + 1 
66d3 : a0 17 __ LDY #$17
66d5 : b1 56 __ LDA (T2 + 0),y 
66d7 : 85 02 __ STA $02 
66d9 : c8 __ __ INY
66da : b1 56 __ LDA (T2 + 0),y 
66dc : 85 57 __ STA T2 + 1 
66de : d0 04 __ BNE $66e4 ; (filepicker.s55 + 0)
.s1006:
66e0 : a5 02 __ LDA $02 
66e2 : f0 0a __ BEQ $66ee ; (filepicker.s167 + 0)
.s55:
66e4 : a5 02 __ LDA $02 
66e6 : 8d fe 88 STA $88fe ; (current + 0)
66e9 : a5 57 __ LDA T2 + 1 
66eb : 8d ff 88 STA $88ff ; (current + 1)
.s167:
66ee : ca __ __ DEX
66ef : d0 d8 __ BNE $66c9 ; (filepicker.l52 + 0)
.s54:
66f1 : ad fe 88 LDA $88fe ; (current + 0)
66f4 : 85 54 __ STA T1 + 0 
66f6 : ad ff 88 LDA $88ff ; (current + 1)
66f9 : 85 55 __ STA T1 + 1 
.s224:
66fb : a5 54 __ LDA T1 + 0 
66fd : 8d f6 88 STA $88f6 ; (cwd + 27)
6700 : a5 55 __ LDA T1 + 1 
6702 : 8d f7 88 STA $88f7 ; (cwd + 28)
6705 : 4c 2a 66 JMP $662a ; (filepicker.s222 + 0)
.s49:
6708 : a5 02 __ LDA $02 
670a : 85 54 __ STA T1 + 0 
670c : a5 48 __ LDA T7 + 0 
670e : 8d f8 ab STA $abf8 ; (sstack + 5)
6711 : a0 15 __ LDY #$15
6713 : b1 54 __ LDA (T1 + 0),y 
6715 : 8d fe 88 STA $88fe ; (current + 0)
6718 : c8 __ __ INY
6719 : b1 54 __ LDA (T1 + 0),y 
671b : 8d ff 88 STA $88ff ; (current + 1)
671e : 20 4f 70 JSR $704f ; (printElementPriv.s1000 + 0)
6721 : ad fe 88 LDA $88fe ; (current + 0)
6724 : 85 54 __ STA T1 + 0 
6726 : ad ff 88 LDA $88ff ; (current + 1)
6729 : 85 55 __ STA T1 + 1 
672b : a0 17 __ LDY #$17
672d : b1 54 __ LDA (T1 + 0),y 
672f : 8d fe 88 STA $88fe ; (current + 0)
6732 : c8 __ __ INY
6733 : b1 54 __ LDA (T1 + 0),y 
6735 : 8d ff 88 STA $88ff ; (current + 1)
6738 : 18 __ __ CLC
6739 : a5 58 __ LDA T6 + 0 
673b : 69 05 __ ADC #$05
.s223:
673d : 8d f8 ab STA $abf8 ; (sstack + 5)
6740 : 20 4f 70 JSR $704f ; (printElementPriv.s1000 + 0)
6743 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s6:
6746 : ee ac 87 INC $87ac ; (targetdevice + 0)
6749 : ad fc ab LDA $abfc ; (sstack + 9)
674c : 8d fb ab STA $abfb ; (sstack + 8)
674f : a9 1e __ LDA #$1e
6751 : cd ac 87 CMP $87ac ; (targetdevice + 0)
6754 : b0 05 __ BCS $675b ; (filepicker.s9 + 0)
.s7:
6756 : a9 08 __ LDA #$08
.s1061:
6758 : 8d ac 87 STA $87ac ; (targetdevice + 0)
.s9:
675b : a9 00 __ LDA #$00
675d : a2 21 __ LDX #$21
.l1014:
675f : ca __ __ DEX
6760 : 9d db 88 STA $88db,x ; (cwd + 0)
6763 : d0 fa __ BNE $675f ; (filepicker.l1014 + 0)
6765 : 4c 51 66 JMP $6651 ; (filepicker.s221 + 0)
.s106:
6768 : c9 50 __ CMP #$50
676a : d0 63 __ BNE $67cf ; (filepicker.s107 + 0)
.s63:
676c : ad f2 88 LDA $88f2 ; (cwd + 23)
676f : 0d f3 88 ORA $88f3 ; (cwd + 24)
6772 : d0 03 __ BNE $6777 ; (filepicker.s67 + 0)
6774 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s67:
6777 : a0 15 __ LDY #$15
6779 : b1 54 __ LDA (T1 + 0),y 
677b : c8 __ __ INY
677c : 11 54 __ ORA (T1 + 0),y 
677e : d0 03 __ BNE $6783 ; (filepicker.s64 + 0)
6780 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s64:
6783 : a5 48 __ LDA T7 + 0 
6785 : 8d f8 ab STA $abf8 ; (sstack + 5)
6788 : a9 00 __ LDA #$00
678a : 8d f4 88 STA $88f4 ; (cwd + 25)
678d : 8d f5 88 STA $88f5 ; (cwd + 26)
6790 : 20 4f 70 JSR $704f ; (printElementPriv.s1000 + 0)
6793 : a2 0e __ LDX #$0e
.l69:
6795 : ad fe 88 LDA $88fe ; (current + 0)
6798 : 85 54 __ STA T1 + 0 
679a : ad ff 88 LDA $88ff ; (current + 1)
679d : 85 55 __ STA T1 + 1 
679f : a0 15 __ LDY #$15
67a1 : b1 54 __ LDA (T1 + 0),y 
67a3 : 85 02 __ STA $02 
67a5 : c8 __ __ INY
67a6 : b1 54 __ LDA (T1 + 0),y 
67a8 : a8 __ __ TAY
67a9 : 05 02 __ ORA $02 
67ab : f0 1c __ BEQ $67c9 ; (filepicker.s166 + 0)
.s72:
67ad : 8c ff 88 STY $88ff ; (current + 1)
67b0 : 8c f5 88 STY $88f5 ; (cwd + 26)
67b3 : 8c f7 88 STY $88f7 ; (cwd + 28)
67b6 : a5 02 __ LDA $02 
67b8 : 8d fe 88 STA $88fe ; (current + 0)
67bb : 8d f4 88 STA $88f4 ; (cwd + 25)
67be : 8d f6 88 STA $88f6 ; (cwd + 27)
67c1 : ee f8 88 INC $88f8 ; (cwd + 29)
67c4 : d0 03 __ BNE $67c9 ; (filepicker.s166 + 0)
.s1067:
67c6 : ee f9 88 INC $88f9 ; (cwd + 30)
.s166:
67c9 : ca __ __ DEX
67ca : d0 c9 __ BNE $6795 ; (filepicker.l69 + 0)
67cc : 4c 2a 66 JMP $662a ; (filepicker.s222 + 0)
.s107:
67cf : 90 03 __ BCC $67d4 ; (filepicker.s109 + 0)
67d1 : 4c 7d 68 JMP $687d ; (filepicker.s108 + 0)
.s109:
67d4 : c9 45 __ CMP #$45
67d6 : f0 03 __ BEQ $67db ; (filepicker.s18 + 0)
67d8 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s18:
67db : ad f2 88 LDA $88f2 ; (cwd + 23)
67de : 0d f3 88 ORA $88f3 ; (cwd + 24)
67e1 : d0 03 __ BNE $67e6 ; (filepicker.s19 + 0)
67e3 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s19:
67e6 : ad f2 88 LDA $88f2 ; (cwd + 23)
67e9 : 8d fe 88 STA $88fe ; (current + 0)
67ec : ad f3 88 LDA $88f3 ; (cwd + 24)
67ef : 8d ff 88 STA $88ff ; (current + 1)
67f2 : a9 00 __ LDA #$00
67f4 : 85 54 __ STA T1 + 0 
67f6 : 85 55 __ STA T1 + 1 
.l23:
67f8 : ad fe 88 LDA $88fe ; (current + 0)
67fb : 85 43 __ STA T3 + 0 
67fd : ad ff 88 LDA $88ff ; (current + 1)
6800 : 85 44 __ STA T3 + 1 
6802 : a0 15 __ LDY #$15
6804 : b1 43 __ LDA (T3 + 0),y 
6806 : 85 46 __ STA T5 + 0 
6808 : c8 __ __ INY
6809 : b1 43 __ LDA (T3 + 0),y 
680b : 85 47 __ STA T5 + 1 
680d : d0 18 __ BNE $6827 ; (filepicker.s25 + 0)
.s1023:
680f : a5 46 __ LDA T5 + 0 
6811 : d0 14 __ BNE $6827 ; (filepicker.s25 + 0)
.s24:
6813 : a5 43 __ LDA T3 + 0 
6815 : 8d f4 88 STA $88f4 ; (cwd + 25)
6818 : a5 44 __ LDA T3 + 1 
681a : 8d f5 88 STA $88f5 ; (cwd + 26)
681d : a5 54 __ LDA T1 + 0 
681f : 8d f8 88 STA $88f8 ; (cwd + 29)
6822 : a5 55 __ LDA T1 + 1 
6824 : 4c 77 68 JMP $6877 ; (filepicker.s1062 + 0)
.s25:
6827 : a5 46 __ LDA T5 + 0 
6829 : 8d fe 88 STA $88fe ; (current + 0)
682c : a5 47 __ LDA T5 + 1 
682e : 8d ff 88 STA $88ff ; (current + 1)
6831 : a5 54 __ LDA T1 + 0 
6833 : 85 1b __ STA ACCU + 0 
6835 : a5 55 __ LDA T1 + 1 
6837 : 85 1c __ STA ACCU + 1 
6839 : a9 0e __ LDA #$0e
683b : 85 03 __ STA WORK + 0 
683d : a9 00 __ LDA #$00
683f : 85 04 __ STA WORK + 1 
6841 : 20 c9 7c JSR $7cc9 ; (divmod + 0)
6844 : a5 1b __ LDA ACCU + 0 
6846 : 85 56 __ STA T2 + 0 
6848 : 18 __ __ CLC
6849 : a5 54 __ LDA T1 + 0 
684b : 69 01 __ ADC #$01
684d : 85 54 __ STA T1 + 0 
684f : 85 1b __ STA ACCU + 0 
6851 : a5 55 __ LDA T1 + 1 
6853 : 69 00 __ ADC #$00
6855 : 85 55 __ STA T1 + 1 
6857 : 85 1c __ STA ACCU + 1 
6859 : a9 0e __ LDA #$0e
685b : 85 03 __ STA WORK + 0 
685d : a9 00 __ LDA #$00
685f : 85 04 __ STA WORK + 1 
6861 : 20 c9 7c JSR $7cc9 ; (divmod + 0)
6864 : a5 56 __ LDA T2 + 0 
6866 : c5 1b __ CMP ACCU + 0 
6868 : f0 8e __ BEQ $67f8 ; (filepicker.l23 + 0)
.s28:
686a : a5 46 __ LDA T5 + 0 
686c : 8d f6 88 STA $88f6 ; (cwd + 27)
686f : a5 47 __ LDA T5 + 1 
6871 : 8d f7 88 STA $88f7 ; (cwd + 28)
6874 : 4c f8 67 JMP $67f8 ; (filepicker.l23 + 0)
.s1062:
6877 : 8d f9 88 STA $88f9 ; (cwd + 30)
687a : 4c 2a 66 JMP $662a ; (filepicker.s222 + 0)
.s108:
687d : c9 54 __ CMP #$54
687f : f0 03 __ BEQ $6884 ; (filepicker.s14 + 0)
6881 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s14:
6884 : ad f2 88 LDA $88f2 ; (cwd + 23)
6887 : 0d f3 88 ORA $88f3 ; (cwd + 24)
688a : d0 03 __ BNE $688f ; (filepicker.s15 + 0)
688c : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s15:
688f : ad f2 88 LDA $88f2 ; (cwd + 23)
6892 : 8d f4 88 STA $88f4 ; (cwd + 25)
6895 : 8d f6 88 STA $88f6 ; (cwd + 27)
6898 : ad f3 88 LDA $88f3 ; (cwd + 24)
689b : 8d f5 88 STA $88f5 ; (cwd + 26)
689e : 8d f7 88 STA $88f7 ; (cwd + 28)
68a1 : a9 00 __ LDA #$00
68a3 : 8d f8 88 STA $88f8 ; (cwd + 29)
68a6 : f0 cf __ BEQ $6877 ; (filepicker.s1062 + 0)
.s90:
68a8 : a5 44 __ LDA T3 + 1 
68aa : d0 06 __ BNE $68b2 ; (filepicker.s91 + 0)
.s1057:
68ac : a5 43 __ LDA T3 + 0 
68ae : c9 13 __ CMP #$13
68b0 : f0 d2 __ BEQ $6884 ; (filepicker.s14 + 0)
.s91:
68b2 : a5 44 __ LDA T3 + 1 
68b4 : 30 5d __ BMI $6913 ; (filepicker.s93 + 0)
.s1056:
68b6 : d0 06 __ BNE $68be ; (filepicker.s92 + 0)
.s1055:
68b8 : a5 43 __ LDA T3 + 0 
68ba : c9 13 __ CMP #$13
68bc : 90 55 __ BCC $6913 ; (filepicker.s93 + 0)
.s92:
68be : a5 43 __ LDA T3 + 0 
68c0 : c9 2b __ CMP #$2b
68c2 : d0 03 __ BNE $68c7 ; (filepicker.s99 + 0)
68c4 : 4c 46 67 JMP $6746 ; (filepicker.s6 + 0)
.s99:
68c7 : b0 2b __ BCS $68f4 ; (filepicker.s100 + 0)
.s101:
68c9 : c9 1b __ CMP #$1b
68cb : f0 03 __ BEQ $68d0 ; (filepicker.s32 + 0)
68cd : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s32:
68d0 : a9 02 __ LDA #$02
.s3:
68d2 : 85 53 __ STA T0 + 0 
68d4 : ad db 88 LDA $88db ; (cwd + 0)
68d7 : f0 03 __ BEQ $68dc ; (filepicker.s199 + 0)
.s117:
68d9 : 20 97 15 JSR $1597 ; (freeDir.s0 + 0)
.s199:
68dc : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
68df : a5 53 __ LDA T0 + 0 
68e1 : c9 01 __ CMP #$01
68e3 : f0 02 __ BEQ $68e7 ; (filepicker.s120 + 0)
.s121:
68e5 : a9 00 __ LDA #$00
.s120:
68e7 : 85 1b __ STA ACCU + 0 
.s1001:
68e9 : a2 05 __ LDX #$05
68eb : bd c8 ab LDA $abc8,x ; (buff + 35)
68ee : 95 53 __ STA T0 + 0,x 
68f0 : ca __ __ DEX
68f1 : 10 f8 __ BPL $68eb ; (filepicker.s1001 + 2)
68f3 : 60 __ __ RTS
.s100:
68f4 : c9 2d __ CMP #$2d
68f6 : f0 03 __ BEQ $68fb ; (filepicker.s10 + 0)
68f8 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s10:
68fb : ce ac 87 DEC $87ac ; (targetdevice + 0)
68fe : ad fc ab LDA $abfc ; (sstack + 9)
6901 : 8d fb ab STA $abfb ; (sstack + 8)
6904 : ad ac 87 LDA $87ac ; (targetdevice + 0)
6907 : c9 08 __ CMP #$08
6909 : 90 03 __ BCC $690e ; (filepicker.s11 + 0)
690b : 4c 5b 67 JMP $675b ; (filepicker.s9 + 0)
.s11:
690e : a9 1e __ LDA #$1e
6910 : 4c 58 67 JMP $6758 ; (filepicker.s1061 + 0)
.s93:
6913 : a5 44 __ LDA T3 + 1 
6915 : d0 28 __ BNE $693f ; (filepicker.s94 + 0)
.s1054:
6917 : a5 43 __ LDA T3 + 0 
6919 : c9 0d __ CMP #$0d
691b : d0 22 __ BNE $693f ; (filepicker.s94 + 0)
.s58:
691d : ad f2 88 LDA $88f2 ; (cwd + 23)
6920 : 0d f3 88 ORA $88f3 ; (cwd + 24)
6923 : d0 03 __ BNE $6928 ; (filepicker.s62 + 0)
6925 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s62:
6928 : a5 54 __ LDA T1 + 0 
692a : 05 55 __ ORA T1 + 1 
692c : d0 03 __ BNE $6931 ; (filepicker.s59 + 0)
692e : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s59:
6931 : a0 ff __ LDY #$ff
.l1052:
6933 : c8 __ __ INY
6934 : b1 54 __ LDA (T1 + 0),y 
6936 : 99 97 87 STA $8797,y ; (filename + 0)
6939 : d0 f8 __ BNE $6933 ; (filepicker.l1052 + 0)
.s1053:
693b : a9 01 __ LDA #$01
693d : d0 93 __ BNE $68d2 ; (filepicker.s3 + 0)
.s94:
693f : a5 44 __ LDA T3 + 1 
6941 : 30 08 __ BMI $694b ; (filepicker.s96 + 0)
.s1051:
6943 : d0 19 __ BNE $695e ; (filepicker.s95 + 0)
.s1050:
6945 : a5 43 __ LDA T3 + 0 
6947 : c9 0d __ CMP #$0d
6949 : b0 13 __ BCS $695e ; (filepicker.s95 + 0)
.s96:
694b : a5 44 __ LDA T3 + 1 
694d : f0 03 __ BEQ $6952 ; (filepicker.s1049 + 0)
694f : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s1049:
6952 : a5 43 __ LDA T3 + 0 
6954 : c9 03 __ CMP #$03
6956 : d0 03 __ BNE $695b ; (filepicker.s1049 + 9)
6958 : 4c d0 68 JMP $68d0 ; (filepicker.s32 + 0)
695b : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s95:
695e : a5 43 __ LDA T3 + 0 
6960 : c9 11 __ CMP #$11
6962 : f0 03 __ BEQ $6967 ; (filepicker.s33 + 0)
6964 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s33:
6967 : ad f2 88 LDA $88f2 ; (cwd + 23)
696a : 0d f3 88 ORA $88f3 ; (cwd + 24)
696d : d0 03 __ BNE $6972 ; (filepicker.s38 + 0)
696f : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s38:
6972 : a5 54 __ LDA T1 + 0 
6974 : 05 55 __ ORA T1 + 1 
6976 : d0 03 __ BNE $697b ; (filepicker.s37 + 0)
6978 : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s37:
697b : a0 15 __ LDY #$15
697d : b1 54 __ LDA (T1 + 0),y 
697f : 85 02 __ STA $02 
6981 : c8 __ __ INY
6982 : b1 54 __ LDA (T1 + 0),y 
6984 : 85 55 __ STA T1 + 1 
6986 : 05 02 __ ORA $02 
6988 : d0 03 __ BNE $698d ; (filepicker.s34 + 0)
698a : 4c 51 65 JMP $6551 ; (filepicker.l2 + 0)
.s34:
698d : a5 02 __ LDA $02 
698f : 85 54 __ STA T1 + 0 
6991 : 8d fe 88 STA $88fe ; (current + 0)
6994 : 8d f4 88 STA $88f4 ; (cwd + 25)
6997 : a5 55 __ LDA T1 + 1 
6999 : 8d ff 88 STA $88ff ; (current + 1)
699c : 8d f5 88 STA $88f5 ; (cwd + 26)
699f : 18 __ __ CLC
69a0 : a5 56 __ LDA T2 + 0 
69a2 : 69 01 __ ADC #$01
69a4 : 8d f8 88 STA $88f8 ; (cwd + 29)
69a7 : 85 1b __ STA ACCU + 0 
69a9 : a5 57 __ LDA T2 + 1 
69ab : 69 00 __ ADC #$00
69ad : 8d f9 88 STA $88f9 ; (cwd + 30)
69b0 : 85 1c __ STA ACCU + 1 
69b2 : a9 0e __ LDA #$0e
69b4 : 85 03 __ STA WORK + 0 
69b6 : a9 00 __ LDA #$00
69b8 : 85 04 __ STA WORK + 1 
69ba : 20 c9 7c JSR $7cc9 ; (divmod + 0)
69bd : a5 46 __ LDA T5 + 0 
69bf : c5 1b __ CMP ACCU + 0 
69c1 : f0 03 __ BEQ $69c6 ; (filepicker.s40 + 0)
69c3 : 4c fb 66 JMP $66fb ; (filepicker.s224 + 0)
.s40:
69c6 : a5 48 __ LDA T7 + 0 
69c8 : 8d f8 ab STA $abf8 ; (sstack + 5)
69cb : a0 17 __ LDY #$17
69cd : b1 54 __ LDA (T1 + 0),y 
69cf : 8d fe 88 STA $88fe ; (current + 0)
69d2 : c8 __ __ INY
69d3 : b1 54 __ LDA (T1 + 0),y 
69d5 : 8d ff 88 STA $88ff ; (current + 1)
69d8 : 20 4f 70 JSR $704f ; (printElementPriv.s1000 + 0)
69db : ad fe 88 LDA $88fe ; (current + 0)
69de : 85 54 __ STA T1 + 0 
69e0 : ad ff 88 LDA $88ff ; (current + 1)
69e3 : 85 55 __ STA T1 + 1 
69e5 : a0 15 __ LDY #$15
69e7 : b1 54 __ LDA (T1 + 0),y 
69e9 : 8d fe 88 STA $88fe ; (current + 0)
69ec : c8 __ __ INY
69ed : b1 54 __ LDA (T1 + 0),y 
69ef : 8d ff 88 STA $88ff ; (current + 1)
69f2 : 18 __ __ CLC
69f3 : a5 58 __ LDA T6 + 0 
69f5 : 69 07 __ ADC #$07
69f7 : 4c 3d 67 JMP $673d ; (filepicker.s223 + 0)
--------------------------------------------------------------------
69fa : __ __ __ BYT 73 65 71 00                                     : seq.
--------------------------------------------------------------------
undoenabled:
69fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
mc_menupopup:
69ff : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
6a00 : __ __ __ BYT 73 45 4c 45 43 54 20 54 48 45 20 46 49 4c 45 20 : sELECT THE FILE 
6a10 : __ __ __ BYT 54 4f 20 4c 4f 41 44 00                         : TO LOAD.
--------------------------------------------------------------------
refreshDir: ; refreshDir(u8,u8)->void
.s0:
6a18 : ad fa ab LDA $abfa ; (sstack + 7)
6a1b : 8d f8 ab STA $abf8 ; (sstack + 5)
6a1e : ad fb ab LDA $abfb ; (sstack + 8)
6a21 : 8d f9 ab STA $abf9 ; (sstack + 6)
6a24 : 20 ee 6a JSR $6aee ; (readDir.s1000 + 0)
6a27 : a5 1b __ LDA ACCU + 0 
6a29 : d0 18 __ BNE $6a43 ; (refreshDir.s1 + 0)
.s2:
6a2b : ad fa ab LDA $abfa ; (sstack + 7)
6a2e : 8d f8 ab STA $abf8 ; (sstack + 5)
6a31 : 20 9b 6f JSR $6f9b ; (drawDirFrame.s1000 + 0)
6a34 : a9 06 __ LDA #$06
6a36 : 85 12 __ STA P5 
6a38 : a9 d0 __ LDA #$d0
6a3a : 85 13 __ STA P6 
6a3c : a9 71 __ LDA #$71
6a3e : 85 14 __ STA P7 
6a40 : 4c 4e 81 JMP $814e ; (vdc_prints_attr@proxy + 0)
.s1:
6a43 : ad fa ab LDA $abfa ; (sstack + 7)
6a46 : 8d f9 ab STA $abf9 ; (sstack + 6)
6a49 : ad f2 88 LDA $88f2 ; (cwd + 23)
6a4c : 8d f4 88 STA $88f4 ; (cwd + 25)
6a4f : ad f3 88 LDA $88f3 ; (cwd + 24)
6a52 : 8d f5 88 STA $88f5 ; (cwd + 26)
--------------------------------------------------------------------
printDir: ; printDir(u8)->void
.s1000:
6a55 : a5 53 __ LDA T0 + 0 
6a57 : 8d cf ab STA $abcf ; (buff + 42)
.s0:
6a5a : ad f2 88 LDA $88f2 ; (cwd + 23)
6a5d : 0d f3 88 ORA $88f3 ; (cwd + 24)
6a60 : d0 1a __ BNE $6a7c ; (printDir.s3 + 0)
.s1:
6a62 : ad d1 87 LDA $87d1 ; (canvas + 11)
6a65 : 85 0f __ STA P2 
6a67 : ad d2 87 LDA $87d2 ; (canvas + 12)
6a6a : 85 14 __ STA P7 
6a6c : ad d3 87 LDA $87d3 ; (canvas + 13)
6a6f : 85 13 __ STA P6 
6a71 : ad d4 87 LDA $87d4 ; (canvas + 14)
6a74 : 85 15 __ STA P8 
6a76 : 20 a8 2c JSR $2ca8 ; (vdc_clear@proxy + 0)
6a79 : 4c c4 6a JMP $6ac4 ; (printDir.s1001 + 0)
.s3:
6a7c : ad f9 ab LDA $abf9 ; (sstack + 6)
6a7f : 8d f8 ab STA $abf8 ; (sstack + 5)
6a82 : 20 9b 6f JSR $6f9b ; (drawDirFrame.s1000 + 0)
6a85 : a9 00 __ LDA #$00
6a87 : 85 53 __ STA T0 + 0 
6a89 : ad f6 88 LDA $88f6 ; (cwd + 27)
6a8c : ac f7 88 LDY $88f7 ; (cwd + 28)
.l68:
6a8f : 8c ff 88 STY $88ff ; (current + 1)
6a92 : 8d fe 88 STA $88fe ; (current + 0)
6a95 : 98 __ __ TYA
6a96 : d0 05 __ BNE $6a9d ; (printDir.s11 + 0)
.s1006:
6a98 : ad fe 88 LDA $88fe ; (current + 0)
6a9b : f0 2d __ BEQ $6aca ; (printDir.l12 + 0)
.s11:
6a9d : a5 53 __ LDA T0 + 0 
6a9f : c9 0e __ CMP #$0e
6aa1 : b0 21 __ BCS $6ac4 ; (printDir.s1001 + 0)
.s8:
6aa3 : 69 06 __ ADC #$06
6aa5 : 8d f8 ab STA $abf8 ; (sstack + 5)
6aa8 : 20 4f 70 JSR $704f ; (printElementPriv.s1000 + 0)
6aab : e6 53 __ INC T0 + 0 
6aad : ad fe 88 LDA $88fe ; (current + 0)
6ab0 : 85 44 __ STA T2 + 0 
6ab2 : ad ff 88 LDA $88ff ; (current + 1)
6ab5 : 85 45 __ STA T2 + 1 
6ab7 : a0 15 __ LDY #$15
6ab9 : b1 44 __ LDA (T2 + 0),y 
6abb : aa __ __ TAX
6abc : c8 __ __ INY
6abd : b1 44 __ LDA (T2 + 0),y 
6abf : a8 __ __ TAY
6ac0 : 8a __ __ TXA
6ac1 : 4c 8f 6a JMP $6a8f ; (printDir.l68 + 0)
.s1001:
6ac4 : ad cf ab LDA $abcf ; (buff + 42)
6ac7 : 85 53 __ STA T0 + 0 
6ac9 : 60 __ __ RTS
.l12:
6aca : a5 53 __ LDA T0 + 0 
6acc : c9 0e __ CMP #$0e
6ace : b0 f4 __ BCS $6ac4 ; (printDir.s1001 + 0)
.s13:
6ad0 : a9 0a __ LDA #$0a
6ad2 : 85 0f __ STA P2 
6ad4 : a9 20 __ LDA #$20
6ad6 : 85 11 __ STA P4 
6ad8 : a9 28 __ LDA #$28
6ada : 85 13 __ STA P6 
6adc : a9 01 __ LDA #$01
6ade : 85 15 __ STA P8 
6ae0 : a5 53 __ LDA T0 + 0 
6ae2 : 69 06 __ ADC #$06
6ae4 : 85 14 __ STA P7 
6ae6 : 20 ac 2c JSR $2cac ; (vdc_clear.s0 + 0)
6ae9 : e6 53 __ INC T0 + 0 
6aeb : 4c ca 6a JMP $6aca ; (printDir.l12 + 0)
--------------------------------------------------------------------
readDir: ; readDir(u8,u8)->u8
.s1000:
6aee : a2 04 __ LDX #$04
6af0 : b5 53 __ LDA T0 + 0,x 
6af2 : 9d d0 ab STA $abd0,x ; (buff + 43)
6af5 : ca __ __ DEX
6af6 : 10 f8 __ BPL $6af0 ; (readDir.s1000 + 2)
6af8 : 38 __ __ SEC
6af9 : a5 23 __ LDA SP + 0 
6afb : e9 08 __ SBC #$08
6afd : 85 23 __ STA SP + 0 
6aff : b0 02 __ BCS $6b03 ; (readDir.s0 + 0)
6b01 : c6 24 __ DEC SP + 1 
.s0:
6b03 : a9 00 __ LDA #$00
6b05 : 8d fc 88 STA $88fc ; (previous + 0)
6b08 : 8d fd 88 STA $88fd ; (previous + 1)
6b0b : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
6b0e : 8d b4 87 STA $87b4 ; (vdc_state + 7)
6b11 : a9 ff __ LDA #$ff
6b13 : 85 55 __ STA T1 + 0 
6b15 : ad db 88 LDA $88db ; (cwd + 0)
6b18 : f0 03 __ BEQ $6b1d ; (readDir.s3 + 0)
.s1:
6b1a : 20 97 15 JSR $1597 ; (freeDir.s0 + 0)
.s3:
6b1d : a9 00 __ LDA #$00
6b1f : a2 21 __ LDX #$21
.l1002:
6b21 : ca __ __ DEX
6b22 : 9d db 88 STA $88db,x ; (cwd + 0)
6b25 : d0 fa __ BNE $6b21 ; (readDir.l1002 + 0)
.s1003:
6b27 : 8d e9 8a STA $8ae9 ; (disk_id_buf + 0)
6b2a : 8d ea 8a STA $8aea ; (disk_id_buf + 1)
6b2d : 8d eb 8a STA $8aeb ; (disk_id_buf + 2)
6b30 : 8d ec 8a STA $8aec ; (disk_id_buf + 3)
6b33 : 8d ed 8a STA $8aed ; (disk_id_buf + 4)
6b36 : ad f8 ab LDA $abf8 ; (sstack + 5)
6b39 : 85 10 __ STA P3 
6b3b : 20 de 15 JSR $15de ; (dir_open.s0 + 0)
6b3e : a5 1b __ LDA ACCU + 0 
6b40 : f0 03 __ BEQ $6b45 ; (readDir.l9 + 0)
6b42 : 4c ff 6c JMP $6cff ; (readDir.s1016 + 0)
.l9:
6b45 : 20 19 6d JSR $6d19 ; (calloc.s0 + 0)
6b48 : a5 1b __ LDA ACCU + 0 
6b4a : 8d fe 88 STA $88fe ; (current + 0)
6b4d : a5 1c __ LDA ACCU + 1 
6b4f : 8d ff 88 STA $88ff ; (current + 1)
6b52 : 05 1b __ ORA ACCU + 0 
6b54 : d0 0e __ BNE $6b64 ; (readDir.s13 + 0)
.s11:
6b56 : 20 4c 16 JSR $164c ; (dir_close@proxy + 0)
6b59 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
6b5c : 09 40 __ ORA #$40
6b5e : 8d b4 87 STA $87b4 ; (vdc_state + 7)
6b61 : 4c ff 6c JMP $6cff ; (readDir.s1016 + 0)
.s13:
6b64 : a5 1c __ LDA ACCU + 1 
6b66 : 85 14 __ STA P7 
6b68 : 85 54 __ STA T0 + 1 
6b6a : a5 1b __ LDA ACCU + 0 
6b6c : 85 53 __ STA T0 + 0 
6b6e : 85 13 __ STA P6 
6b70 : 20 58 16 JSR $1658 ; (dir_readentry.s0 + 0)
6b73 : a5 1b __ LDA ACCU + 0 
6b75 : f0 03 __ BEQ $6b7a ; (readDir.s18 + 0)
6b77 : 4c cb 6c JMP $6ccb ; (readDir.s16 + 0)
.s18:
6b7a : ad b4 87 LDA $87b4 ; (vdc_state + 7)
6b7d : 09 40 __ ORA #$40
6b7f : 85 56 __ STA T3 + 0 
6b81 : a5 55 __ LDA T1 + 0 
6b83 : 4a __ __ LSR
6b84 : 4a __ __ LSR
6b85 : c9 24 __ CMP #$24
6b87 : 90 44 __ BCC $6bcd ; (readDir.s21 + 0)
.s20:
6b89 : a5 56 __ LDA T3 + 0 
6b8b : 8d b4 87 STA $87b4 ; (vdc_state + 7)
6b8e : a9 3c __ LDA #$3c
6b90 : 85 13 __ STA P6 
6b92 : a9 01 __ LDA #$01
6b94 : 85 15 __ STA P8 
6b96 : 20 27 82 JSR $8227 ; (vdc_clear@proxy + 0)
6b99 : a9 00 __ LDA #$00
6b9b : a0 02 __ LDY #$02
6b9d : 91 23 __ STA (SP + 0),y 
6b9f : a9 89 __ LDA #$89
6ba1 : c8 __ __ INY
6ba2 : 91 23 __ STA (SP + 0),y 
6ba4 : a9 6b __ LDA #$6b
6ba6 : c8 __ __ INY
6ba7 : 91 23 __ STA (SP + 0),y 
6ba9 : a9 6d __ LDA #$6d
6bab : c8 __ __ INY
6bac : 91 23 __ STA (SP + 0),y 
6bae : ad f8 ab LDA $abf8 ; (sstack + 5)
6bb1 : c8 __ __ INY
6bb2 : 91 23 __ STA (SP + 0),y 
6bb4 : a9 00 __ LDA #$00
6bb6 : c8 __ __ INY
6bb7 : 91 23 __ STA (SP + 0),y 
6bb9 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
6bbc : a9 05 __ LDA #$05
6bbe : 85 12 __ STA P5 
6bc0 : a5 56 __ LDA T3 + 0 
6bc2 : 85 15 __ STA P8 
6bc4 : 20 5a 81 JSR $815a ; (vdc_prints_attr@proxy + 0)
6bc7 : a9 00 __ LDA #$00
6bc9 : 85 55 __ STA T1 + 0 
6bcb : f0 2b __ BEQ $6bf8 ; (readDir.s94 + 0)
.s21:
6bcd : 69 0e __ ADC #$0e
6bcf : 8d d5 87 STA $87d5 ; (canvas + 15)
6bd2 : a9 05 __ LDA #$05
6bd4 : 8d d6 87 STA $87d6 ; (canvas + 16)
6bd7 : a5 55 __ LDA T1 + 0 
6bd9 : 29 03 __ AND #$03
6bdb : aa __ __ TAX
6bdc : bd f6 82 LDA $82f6,x ; (progressRev + 0)
6bdf : f0 08 __ BEQ $6be9 ; (readDir.s66 + 0)
.s67:
6be1 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
6be4 : 29 bf __ AND #$bf
6be6 : 4c eb 6b JMP $6beb ; (readDir.s1014 + 0)
.s66:
6be9 : a5 56 __ LDA T3 + 0 
.s1014:
6beb : 8d b4 87 STA $87b4 ; (vdc_state + 7)
6bee : bd fa 82 LDA $82fa,x ; (progressBar + 0)
6bf1 : 85 17 __ STA P10 
6bf3 : 20 72 6d JSR $6d72 ; (vdcwin_put_char.s1000 + 0)
6bf6 : e6 55 __ INC T1 + 0 
.s94:
6bf8 : ad fe 88 LDA $88fe ; (current + 0)
6bfb : 85 53 __ STA T0 + 0 
6bfd : ad ff 88 LDA $88ff ; (current + 1)
6c00 : 85 54 __ STA T0 + 1 
6c02 : a0 13 __ LDY #$13
6c04 : ad db 88 LDA $88db ; (cwd + 0)
6c07 : d0 5f __ BNE $6c68 ; (readDir.s28 + 0)
.s27:
6c09 : b1 53 __ LDA (T0 + 0),y 
6c0b : c9 05 __ CMP #$05
6c0d : f0 19 __ BEQ $6c28 ; (readDir.s30 + 0)
.s31:
6c0f : a2 ff __ LDX #$ff
.l1004:
6c11 : e8 __ __ INX
6c12 : bd 5f 6f LDA $6f5f,x 
6c15 : 9d db 88 STA $88db,x ; (cwd + 0)
6c18 : d0 f7 __ BNE $6c11 ; (readDir.l1004 + 0)
.s102:
6c1a : a5 54 __ LDA T0 + 1 
6c1c : a6 53 __ LDX T0 + 0 
.s1017:
6c1e : 86 1b __ STX ACCU + 0 
6c20 : 85 1c __ STA ACCU + 1 
6c22 : 20 61 7f JSR $7f61 ; (free + 0)
6c25 : 4c 45 6b JMP $6b45 ; (readDir.l9 + 0)
.s30:
6c28 : a0 00 __ LDY #$00
6c2a : f0 04 __ BEQ $6c30 ; (readDir.l33 + 0)
.s34:
6c2c : 99 db 88 STA $88db,y ; (cwd + 0)
6c2f : c8 __ __ INY
.l33:
6c30 : ad fe 88 LDA $88fe ; (current + 0)
6c33 : 85 1b __ STA ACCU + 0 
6c35 : ad ff 88 LDA $88ff ; (current + 1)
6c38 : 85 1c __ STA ACCU + 1 
6c3a : b1 1b __ LDA (ACCU + 0),y 
6c3c : d0 ee __ BNE $6c2c ; (readDir.s34 + 0)
.s36:
6c3e : a9 2c __ LDA #$2c
6c40 : 99 db 88 STA $88db,y ; (cwd + 0)
6c43 : ad e9 8a LDA $8ae9 ; (disk_id_buf + 0)
6c46 : 99 dc 88 STA $88dc,y ; (cwd + 1)
6c49 : ad ea 8a LDA $8aea ; (disk_id_buf + 1)
6c4c : 99 dd 88 STA $88dd,y ; (cwd + 2)
6c4f : ad eb 8a LDA $8aeb ; (disk_id_buf + 2)
6c52 : 99 de 88 STA $88de,y ; (cwd + 3)
6c55 : ad ec 8a LDA $8aec ; (disk_id_buf + 3)
6c58 : 99 df 88 STA $88df,y ; (cwd + 4)
6c5b : ad ed 8a LDA $8aed ; (disk_id_buf + 4)
6c5e : 99 e0 88 STA $88e0,y ; (cwd + 5)
6c61 : a5 1c __ LDA ACCU + 1 
6c63 : a6 1b __ LDX ACCU + 0 
6c65 : 4c 1e 6c JMP $6c1e ; (readDir.s1017 + 0)
.s28:
6c68 : b1 53 __ LDA (T0 + 0),y 
6c6a : c9 64 __ CMP #$64
6c6c : d0 10 __ BNE $6c7e ; (readDir.s38 + 0)
.s37:
6c6e : a0 11 __ LDY #$11
6c70 : b1 53 __ LDA (T0 + 0),y 
6c72 : 8d fa 88 STA $88fa ; (cwd + 31)
6c75 : c8 __ __ INY
6c76 : b1 53 __ LDA (T0 + 0),y 
6c78 : 8d fb 88 STA $88fb ; (cwd + 32)
6c7b : 4c 1a 6c JMP $6c1a ; (readDir.s102 + 0)
.s38:
6c7e : ad f9 ab LDA $abf9 ; (sstack + 6)
6c81 : 85 13 __ STA P6 
6c83 : 20 96 18 JSR $1896 ; (dir_validentry.s0 + 0)
6c86 : a5 1b __ LDA ACCU + 0 
6c88 : f0 90 __ BEQ $6c1a ; (readDir.s102 + 0)
.s40:
6c8a : ad f3 88 LDA $88f3 ; (cwd + 24)
6c8d : d0 05 __ BNE $6c94 ; (readDir.s44 + 0)
.s1008:
6c8f : ad f2 88 LDA $88f2 ; (cwd + 23)
6c92 : f0 20 __ BEQ $6cb4 ; (readDir.s43 + 0)
.s44:
6c94 : ad fd 88 LDA $88fd ; (previous + 1)
6c97 : 85 57 __ STA T3 + 1 
6c99 : ad fc 88 LDA $88fc ; (previous + 0)
6c9c : 85 56 __ STA T3 + 0 
6c9e : a0 17 __ LDY #$17
6ca0 : 91 53 __ STA (T0 + 0),y 
6ca2 : a5 57 __ LDA T3 + 1 
6ca4 : c8 __ __ INY
6ca5 : 91 53 __ STA (T0 + 0),y 
6ca7 : a5 53 __ LDA T0 + 0 
6ca9 : a0 15 __ LDY #$15
6cab : 91 56 __ STA (T3 + 0),y 
6cad : a5 54 __ LDA T0 + 1 
6caf : c8 __ __ INY
6cb0 : 91 56 __ STA (T3 + 0),y 
6cb2 : d0 0a __ BNE $6cbe ; (readDir.s116 + 0)
.s43:
6cb4 : a5 53 __ LDA T0 + 0 
6cb6 : 8d f2 88 STA $88f2 ; (cwd + 23)
6cb9 : a5 54 __ LDA T0 + 1 
6cbb : 8d f3 88 STA $88f3 ; (cwd + 24)
.s116:
6cbe : a5 53 __ LDA T0 + 0 
6cc0 : 8d fc 88 STA $88fc ; (previous + 0)
6cc3 : a5 54 __ LDA T0 + 1 
6cc5 : 8d fd 88 STA $88fd ; (previous + 1)
6cc8 : 4c 45 6b JMP $6b45 ; (readDir.l9 + 0)
.s16:
6ccb : a5 53 __ LDA T0 + 0 
6ccd : 85 1b __ STA ACCU + 0 
6ccf : a5 54 __ LDA T0 + 1 
6cd1 : 85 1c __ STA ACCU + 1 
6cd3 : 20 61 7f JSR $7f61 ; (free + 0)
6cd6 : 20 4c 16 JSR $164c ; (dir_close@proxy + 0)
6cd9 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
6cdc : 09 40 __ ORA #$40
6cde : 8d b4 87 STA $87b4 ; (vdc_state + 7)
6ce1 : ad f2 88 LDA $88f2 ; (cwd + 23)
6ce4 : 0d f3 88 ORA $88f3 ; (cwd + 24)
6ce7 : f0 16 __ BEQ $6cff ; (readDir.s1016 + 0)
.s47:
6ce9 : ad f2 88 LDA $88f2 ; (cwd + 23)
6cec : 8d f4 88 STA $88f4 ; (cwd + 25)
6cef : 8d f6 88 STA $88f6 ; (cwd + 27)
6cf2 : ad f3 88 LDA $88f3 ; (cwd + 24)
6cf5 : 8d f5 88 STA $88f5 ; (cwd + 26)
6cf8 : 8d f7 88 STA $88f7 ; (cwd + 28)
6cfb : a9 01 __ LDA #$01
6cfd : d0 02 __ BNE $6d01 ; (readDir.s1001 + 0)
.s1016:
6cff : a9 00 __ LDA #$00
.s1001:
6d01 : 85 1b __ STA ACCU + 0 
6d03 : 18 __ __ CLC
6d04 : a5 23 __ LDA SP + 0 
6d06 : 69 08 __ ADC #$08
6d08 : 85 23 __ STA SP + 0 
6d0a : 90 02 __ BCC $6d0e ; (readDir.s1001 + 13)
6d0c : e6 24 __ INC SP + 1 
6d0e : a2 04 __ LDX #$04
6d10 : bd d0 ab LDA $abd0,x ; (buff + 43)
6d13 : 95 53 __ STA T0 + 0,x 
6d15 : ca __ __ DEX
6d16 : 10 f8 __ BPL $6d10 ; (readDir.s1001 + 15)
6d18 : 60 __ __ RTS
--------------------------------------------------------------------
calloc: ; calloc(i16,i16)->void*
.s0:
6d19 : a9 19 __ LDA #$19
6d1b : 85 1b __ STA ACCU + 0 
6d1d : a9 00 __ LDA #$00
6d1f : 85 1c __ STA ACCU + 1 
6d21 : 20 84 7e JSR $7e84 ; (malloc + 0)
6d24 : a5 1c __ LDA ACCU + 1 
6d26 : 05 1b __ ORA ACCU + 0 
6d28 : f0 1d __ BEQ $6d47 ; (calloc.s1001 + 0)
.s1:
6d2a : a5 1c __ LDA ACCU + 1 
6d2c : 85 0e __ STA P1 
6d2e : 85 44 __ STA T0 + 1 
6d30 : a5 1b __ LDA ACCU + 0 
6d32 : 85 0d __ STA P0 
6d34 : a9 19 __ LDA #$19
6d36 : 85 0f __ STA P2 
6d38 : a9 00 __ LDA #$00
6d3a : 85 10 __ STA P3 
6d3c : 20 48 6d JSR $6d48 ; (memclr.s0 + 0)
6d3f : a5 0d __ LDA P0 
6d41 : 85 1b __ STA ACCU + 0 
6d43 : a5 44 __ LDA T0 + 1 
6d45 : 85 1c __ STA ACCU + 1 
.s1001:
6d47 : 60 __ __ RTS
--------------------------------------------------------------------
memclr: ; memclr(void*,i16)->void
.s0:
6d48 : a5 10 __ LDA P3 ; (size + 1)
6d4a : 05 0f __ ORA P2 ; (size + 0)
6d4c : f0 1c __ BEQ $6d6a ; (memclr.s1001 + 0)
.s5:
6d4e : a0 00 __ LDY #$00
6d50 : a5 0f __ LDA P2 ; (size + 0)
6d52 : f0 02 __ BEQ $6d56 ; (memclr.l1002 + 0)
.s1005:
6d54 : e6 10 __ INC P3 ; (size + 1)
.l1002:
6d56 : a6 0f __ LDX P2 ; (size + 0)
.l1006:
6d58 : a9 00 __ LDA #$00
6d5a : 91 0d __ STA (P0),y ; (dst + 0)
6d5c : c8 __ __ INY
6d5d : d0 02 __ BNE $6d61 ; (memclr.s1009 + 0)
.s1008:
6d5f : e6 0e __ INC P1 ; (dst + 1)
.s1009:
6d61 : ca __ __ DEX
6d62 : d0 f4 __ BNE $6d58 ; (memclr.l1006 + 0)
.s1007:
6d64 : 85 0f __ STA P2 ; (size + 0)
6d66 : c6 10 __ DEC P3 ; (size + 1)
6d68 : d0 ec __ BNE $6d56 ; (memclr.l1002 + 0)
.s1001:
6d6a : 60 __ __ RTS
--------------------------------------------------------------------
6d6b : __ __ __ BYT 5b 25 30 32 55 5d 00                            : [%02U].
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
6d72 : a5 53 __ LDA T1 + 0 
6d74 : 8d ed ab STA $abed ; (palette_draw@stack + 14)
6d77 : 38 __ __ SEC
6d78 : a5 23 __ LDA SP + 0 
6d7a : e9 06 __ SBC #$06
6d7c : 85 23 __ STA SP + 0 
6d7e : b0 02 __ BCS $6d82 ; (vdcwin_put_char.s0 + 0)
6d80 : c6 24 __ DEC SP + 1 
.s0:
6d82 : ad d5 87 LDA $87d5 ; (canvas + 15)
6d85 : 85 11 __ STA P4 
6d87 : ad d6 87 LDA $87d6 ; (canvas + 16)
6d8a : 85 53 __ STA T1 + 0 
6d8c : 85 12 __ STA P5 
6d8e : a5 17 __ LDA P10 ; (ch + 0)
6d90 : 85 13 __ STA P6 
6d92 : 20 e0 6d JSR $6de0 ; (vdcwin_putat_char.s0 + 0)
6d95 : a6 11 __ LDX P4 
6d97 : e8 __ __ INX
6d98 : 8e d5 87 STX $87d5 ; (canvas + 15)
6d9b : ec d3 87 CPX $87d3 ; (canvas + 13)
6d9e : d0 2f __ BNE $6dcf ; (vdcwin_put_char.s1001 + 0)
.s1:
6da0 : a9 00 __ LDA #$00
6da2 : 8d d5 87 STA $87d5 ; (canvas + 15)
6da5 : 18 __ __ CLC
6da6 : a5 53 __ LDA T1 + 0 
6da8 : 69 01 __ ADC #$01
6daa : 8d d6 87 STA $87d6 ; (canvas + 16)
6dad : cd d4 87 CMP $87d4 ; (canvas + 14)
6db0 : d0 1d __ BNE $6dcf ; (vdcwin_put_char.s1001 + 0)
.s4:
6db2 : a5 53 __ LDA T1 + 0 
6db4 : 8d d6 87 STA $87d6 ; (canvas + 16)
6db7 : a9 d1 __ LDA #$d1
6db9 : a0 02 __ LDY #$02
6dbb : 91 23 __ STA (SP + 0),y 
6dbd : a9 87 __ LDA #$87
6dbf : c8 __ __ INY
6dc0 : 91 23 __ STA (SP + 0),y 
6dc2 : a9 ff __ LDA #$ff
6dc4 : c8 __ __ INY
6dc5 : 91 23 __ STA (SP + 0),y 
6dc7 : a9 39 __ LDA #$39
6dc9 : c8 __ __ INY
6dca : 91 23 __ STA (SP + 0),y 
6dcc : 20 07 6e JSR $6e07 ; (vdcwin_printline.s1000 + 0)
.s1001:
6dcf : 18 __ __ CLC
6dd0 : a5 23 __ LDA SP + 0 
6dd2 : 69 06 __ ADC #$06
6dd4 : 85 23 __ STA SP + 0 
6dd6 : 90 02 __ BCC $6dda ; (vdcwin_put_char.s1001 + 11)
6dd8 : e6 24 __ INC SP + 1 
6dda : ad ed ab LDA $abed ; (palette_draw@stack + 14)
6ddd : 85 53 __ STA T1 + 0 
6ddf : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
6de0 : a5 13 __ LDA P6 ; (ch + 0)
6de2 : 4a __ __ LSR
6de3 : 4a __ __ LSR
6de4 : 4a __ __ LSR
6de5 : 4a __ __ LSR
6de6 : 4a __ __ LSR
6de7 : aa __ __ TAX
6de8 : bd d8 86 LDA $86d8,x ; (p2smap + 0)
6deb : 45 13 __ EOR P6 ; (ch + 0)
6ded : 85 0f __ STA P2 
6def : 18 __ __ CLC
6df0 : a5 11 __ LDA P4 ; (x + 0)
6df2 : 6d d1 87 ADC $87d1 ; (canvas + 11)
6df5 : 85 0d __ STA P0 
6df7 : 18 __ __ CLC
6df8 : a5 12 __ LDA P5 ; (y + 0)
6dfa : 6d d2 87 ADC $87d2 ; (canvas + 12)
6dfd : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
6dff : ad b4 87 LDA $87b4 ; (vdc_state + 7)
6e02 : 85 10 __ STA P3 
6e04 : 4c fc 34 JMP $34fc ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
6e07 : a5 53 __ LDA T0 + 0 
6e09 : 8d ef ab STA $abef ; (buffer + 12)
6e0c : a5 54 __ LDA T0 + 1 
6e0e : 8d f0 ab STA $abf0 ; (buffer + 13)
6e11 : a5 55 __ LDA T1 + 0 
6e13 : 8d f1 ab STA $abf1 ; (buffer + 14)
6e16 : 38 __ __ SEC
6e17 : a5 23 __ LDA SP + 0 
6e19 : e9 06 __ SBC #$06
6e1b : 85 23 __ STA SP + 0 
6e1d : b0 02 __ BCS $6e21 ; (vdcwin_printline.s0 + 0)
6e1f : c6 24 __ DEC SP + 1 
.s0:
6e21 : a0 08 __ LDY #$08
6e23 : b1 23 __ LDA (SP + 0),y 
6e25 : 85 53 __ STA T0 + 0 
6e27 : a0 02 __ LDY #$02
6e29 : 91 23 __ STA (SP + 0),y 
6e2b : a0 09 __ LDY #$09
6e2d : b1 23 __ LDA (SP + 0),y 
6e2f : 85 54 __ STA T0 + 1 
6e31 : a0 03 __ LDY #$03
6e33 : 91 23 __ STA (SP + 0),y 
6e35 : a0 0a __ LDY #$0a
6e37 : b1 23 __ LDA (SP + 0),y 
6e39 : a0 04 __ LDY #$04
6e3b : 91 23 __ STA (SP + 0),y 
6e3d : a0 0b __ LDY #$0b
6e3f : b1 23 __ LDA (SP + 0),y 
6e41 : a0 05 __ LDY #$05
6e43 : 91 23 __ STA (SP + 0),y 
6e45 : 20 af 6e JSR $6eaf ; (vdcwin_put_string.s1000 + 0)
6e48 : a9 00 __ LDA #$00
6e4a : a0 04 __ LDY #$04
6e4c : 91 53 __ STA (T0 + 0),y 
6e4e : 88 __ __ DEY
6e4f : b1 53 __ LDA (T0 + 0),y 
6e51 : 85 55 __ STA T1 + 0 
6e53 : 38 __ __ SEC
6e54 : e9 01 __ SBC #$01
6e56 : 85 44 __ STA T3 + 0 
6e58 : a0 05 __ LDY #$05
6e5a : b1 53 __ LDA (T0 + 0),y 
6e5c : 90 0b __ BCC $6e69 ; (vdcwin_printline.s2 + 0)
.s1002:
6e5e : aa __ __ TAX
6e5f : e4 44 __ CPX T3 + 0 
6e61 : b0 06 __ BCS $6e69 ; (vdcwin_printline.s2 + 0)
.s1:
6e63 : e8 __ __ INX
6e64 : 8a __ __ TXA
6e65 : 91 53 __ STA (T0 + 0),y 
6e67 : 90 2b __ BCC $6e94 ; (vdcwin_printline.s1001 + 0)
.s2:
6e69 : a5 53 __ LDA T0 + 0 
6e6b : 85 15 __ STA P8 
6e6d : a5 54 __ LDA T0 + 1 
6e6f : 85 16 __ STA P9 
6e71 : 20 0e 4a JSR $4a0e ; (vdcwin_scroll_up.s0 + 0)
6e74 : a9 20 __ LDA #$20
6e76 : 85 11 __ STA P4 
6e78 : a0 00 __ LDY #$00
6e7a : b1 15 __ LDA (P8),y 
6e7c : 85 0f __ STA P2 ; (str + 0)
6e7e : a0 02 __ LDY #$02
6e80 : b1 15 __ LDA (P8),y 
6e82 : 85 13 __ STA P6 
6e84 : 88 __ __ DEY
6e85 : 84 15 __ STY P8 
6e87 : b1 53 __ LDA (T0 + 0),y 
6e89 : 18 __ __ CLC
6e8a : 65 55 __ ADC T1 + 0 
6e8c : 38 __ __ SEC
6e8d : e9 01 __ SBC #$01
6e8f : 85 14 __ STA P7 
6e91 : 20 ac 2c JSR $2cac ; (vdc_clear.s0 + 0)
.s1001:
6e94 : 18 __ __ CLC
6e95 : a5 23 __ LDA SP + 0 
6e97 : 69 06 __ ADC #$06
6e99 : 85 23 __ STA SP + 0 
6e9b : 90 02 __ BCC $6e9f ; (vdcwin_printline.s1001 + 11)
6e9d : e6 24 __ INC SP + 1 
6e9f : ad ef ab LDA $abef ; (buffer + 12)
6ea2 : 85 53 __ STA T0 + 0 
6ea4 : ad f0 ab LDA $abf0 ; (buffer + 13)
6ea7 : 85 54 __ STA T0 + 1 
6ea9 : ad f1 ab LDA $abf1 ; (buffer + 14)
6eac : 85 55 __ STA T1 + 0 
6eae : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
6eaf : 38 __ __ SEC
6eb0 : a5 23 __ LDA SP + 0 
6eb2 : e9 0b __ SBC #$0b
6eb4 : 85 23 __ STA SP + 0 
6eb6 : b0 02 __ BCS $6eba ; (vdcwin_put_string.s0 + 0)
6eb8 : c6 24 __ DEC SP + 1 
.s0:
6eba : a0 0d __ LDY #$0d
6ebc : b1 23 __ LDA (SP + 0),y 
6ebe : 85 11 __ STA P4 
6ec0 : c8 __ __ INY
6ec1 : b1 23 __ LDA (SP + 0),y 
6ec3 : 85 12 __ STA P5 
6ec5 : a0 04 __ LDY #$04
6ec7 : b1 11 __ LDA (P4),y 
6ec9 : 85 13 __ STA P6 
6ecb : c8 __ __ INY
6ecc : b1 11 __ LDA (P4),y 
6ece : 85 14 __ STA P7 
6ed0 : a0 0f __ LDY #$0f
6ed2 : b1 23 __ LDA (SP + 0),y 
6ed4 : 85 15 __ STA P8 
6ed6 : c8 __ __ INY
6ed7 : b1 23 __ LDA (SP + 0),y 
6ed9 : 85 16 __ STA P9 
6edb : 20 2a 6f JSR $6f2a ; (vdcwin_putat_string.s0 + 0)
6ede : 18 __ __ CLC
6edf : a5 1b __ LDA ACCU + 0 
6ee1 : 65 13 __ ADC P6 
6ee3 : a0 04 __ LDY #$04
6ee5 : 91 11 __ STA (P4),y 
6ee7 : a0 02 __ LDY #$02
6ee9 : d1 11 __ CMP (P4),y 
6eeb : 90 31 __ BCC $6f1e ; (vdcwin_put_string.s1001 + 0)
.s1:
6eed : a9 00 __ LDA #$00
6eef : a0 04 __ LDY #$04
6ef1 : 91 11 __ STA (P4),y 
6ef3 : a5 14 __ LDA P7 
6ef5 : 69 00 __ ADC #$00
6ef7 : c8 __ __ INY
6ef8 : 91 11 __ STA (P4),y 
6efa : a0 03 __ LDY #$03
6efc : d1 11 __ CMP (P4),y 
6efe : d0 1e __ BNE $6f1e ; (vdcwin_put_string.s1001 + 0)
.s4:
6f00 : a5 14 __ LDA P7 
6f02 : a0 05 __ LDY #$05
6f04 : 91 11 __ STA (P4),y 
6f06 : a5 11 __ LDA P4 
6f08 : a0 02 __ LDY #$02
6f0a : 91 23 __ STA (SP + 0),y 
6f0c : a5 12 __ LDA P5 
6f0e : c8 __ __ INY
6f0f : 91 23 __ STA (SP + 0),y 
6f11 : a9 ff __ LDA #$ff
6f13 : c8 __ __ INY
6f14 : 91 23 __ STA (SP + 0),y 
6f16 : a9 39 __ LDA #$39
6f18 : c8 __ __ INY
6f19 : 91 23 __ STA (SP + 0),y 
6f1b : 20 07 6e JSR $6e07 ; (vdcwin_printline.s1000 + 0)
.s1001:
6f1e : 18 __ __ CLC
6f1f : a5 23 __ LDA SP + 0 
6f21 : 69 0b __ ADC #$0b
6f23 : 85 23 __ STA SP + 0 
6f25 : 90 02 __ BCC $6f29 ; (vdcwin_put_string.s1001 + 11)
6f27 : e6 24 __ INC SP + 1 
6f29 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
6f2a : a9 00 __ LDA #$00
6f2c : 85 43 __ STA T0 + 0 
6f2e : f0 26 __ BEQ $6f56 ; (vdcwin_putat_string.l1 + 0)
.s2:
6f30 : 4a __ __ LSR
6f31 : 4a __ __ LSR
6f32 : 4a __ __ LSR
6f33 : 4a __ __ LSR
6f34 : 4a __ __ LSR
6f35 : aa __ __ TAX
6f36 : bd d8 86 LDA $86d8,x ; (p2smap + 0)
6f39 : 51 15 __ EOR (P8),y ; (str + 0)
6f3b : 85 0f __ STA P2 
6f3d : a5 13 __ LDA P6 ; (x + 0)
6f3f : 18 __ __ CLC
6f40 : a0 00 __ LDY #$00
6f42 : 71 11 __ ADC (P4),y ; (win + 0)
6f44 : 18 __ __ CLC
6f45 : 65 43 __ ADC T0 + 0 
6f47 : 85 0d __ STA P0 
6f49 : a5 14 __ LDA P7 ; (y + 0)
6f4b : 18 __ __ CLC
6f4c : c8 __ __ INY
6f4d : 71 11 __ ADC (P4),y ; (win + 0)
6f4f : 85 0e __ STA P1 
6f51 : 20 ff 6d JSR $6dff ; (vdc_printc@proxy + 0)
6f54 : e6 43 __ INC T0 + 0 
.l1:
6f56 : a4 43 __ LDY T0 + 0 
6f58 : b1 15 __ LDA (P8),y ; (str + 0)
6f5a : d0 d4 __ BNE $6f30 ; (vdcwin_putat_string.s2 + 0)
.s3:
6f5c : 84 1b __ STY ACCU + 0 
.s1001:
6f5e : 60 __ __ RTS
--------------------------------------------------------------------
6f5f : __ __ __ BYT 75 4e 4b 4e 4f 57 4e 20 54 59 50 45 00          : uNKNOWN TYPE.
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i16
.s0:
6f6c : a0 00 __ LDY #$00
6f6e : 84 1c __ STY ACCU + 1 
6f70 : b1 0d __ LDA (P0),y 
6f72 : f0 16 __ BEQ $6f8a ; (strcmp.s0 + 30)
6f74 : d1 0f __ CMP (P2),y 
6f76 : d0 16 __ BNE $6f8e ; (strcmp.s0 + 34)
6f78 : c8 __ __ INY
6f79 : b1 0d __ LDA (P0),y 
6f7b : f0 0d __ BEQ $6f8a ; (strcmp.s0 + 30)
6f7d : d1 0f __ CMP (P2),y 
6f7f : d0 0d __ BNE $6f8e ; (strcmp.s0 + 34)
6f81 : c8 __ __ INY
6f82 : d0 ec __ BNE $6f70 ; (strcmp.s0 + 4)
6f84 : e6 0e __ INC P1 
6f86 : e6 10 __ INC P3 
6f88 : d0 e6 __ BNE $6f70 ; (strcmp.s0 + 4)
6f8a : d1 0f __ CMP (P2),y 
6f8c : f0 0a __ BEQ $6f98 ; (strcmp.s0 + 44)
6f8e : b0 06 __ BCS $6f96 ; (strcmp.s0 + 42)
6f90 : a9 ff __ LDA #$ff
6f92 : 85 1c __ STA ACCU + 1 
6f94 : 30 02 __ BMI $6f98 ; (strcmp.s0 + 44)
6f96 : a9 01 __ LDA #$01
6f98 : 85 1b __ STA ACCU + 0 
.s1001:
6f9a : 60 __ __ RTS
--------------------------------------------------------------------
drawDirFrame: ; drawDirFrame(u8)->void
.s1000:
6f9b : 38 __ __ SEC
6f9c : a5 23 __ LDA SP + 0 
6f9e : e9 0a __ SBC #$0a
6fa0 : 85 23 __ STA SP + 0 
6fa2 : b0 02 __ BCS $6fa6 ; (drawDirFrame.s0 + 0)
6fa4 : c6 24 __ DEC SP + 1 
.s0:
6fa6 : a9 28 __ LDA #$28
6fa8 : 85 13 __ STA P6 
6faa : a9 10 __ LDA #$10
6fac : 85 15 __ STA P8 
6fae : 20 27 82 JSR $8227 ; (vdc_clear@proxy + 0)
6fb1 : a9 00 __ LDA #$00
6fb3 : a0 02 __ LDY #$02
6fb5 : 91 23 __ STA (SP + 0),y 
6fb7 : a9 89 __ LDA #$89
6fb9 : c8 __ __ INY
6fba : 91 23 __ STA (SP + 0),y 
6fbc : a9 33 __ LDA #$33
6fbe : c8 __ __ INY
6fbf : 91 23 __ STA (SP + 0),y 
6fc1 : a9 70 __ LDA #$70
6fc3 : c8 __ __ INY
6fc4 : 91 23 __ STA (SP + 0),y 
6fc6 : ad f8 ab LDA $abf8 ; (sstack + 5)
6fc9 : c8 __ __ INY
6fca : 91 23 __ STA (SP + 0),y 
6fcc : a9 00 __ LDA #$00
6fce : c8 __ __ INY
6fcf : 91 23 __ STA (SP + 0),y 
6fd1 : a9 db __ LDA #$db
6fd3 : c8 __ __ INY
6fd4 : 91 23 __ STA (SP + 0),y 
6fd6 : a9 88 __ LDA #$88
6fd8 : c8 __ __ INY
6fd9 : 91 23 __ STA (SP + 0),y 
6fdb : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
6fde : a9 0b __ LDA #$0b
6fe0 : 85 11 __ STA P4 
6fe2 : a9 05 __ LDA #$05
6fe4 : 85 12 __ STA P5 
6fe6 : a9 00 __ LDA #$00
6fe8 : 85 13 __ STA P6 
6fea : a9 89 __ LDA #$89
6fec : 85 14 __ STA P7 
6fee : ad b4 87 LDA $87b4 ; (vdc_state + 7)
6ff1 : 85 4e __ STA T2 + 0 
6ff3 : 85 15 __ STA P8 
6ff5 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
6ff8 : a9 00 __ LDA #$00
6ffa : a0 02 __ LDY #$02
6ffc : 91 23 __ STA (SP + 0),y 
6ffe : a9 89 __ LDA #$89
7000 : c8 __ __ INY
7001 : 91 23 __ STA (SP + 0),y 
7003 : a9 40 __ LDA #$40
7005 : c8 __ __ INY
7006 : 91 23 __ STA (SP + 0),y 
7008 : a9 70 __ LDA #$70
700a : c8 __ __ INY
700b : 91 23 __ STA (SP + 0),y 
700d : ad fa 88 LDA $88fa ; (cwd + 31)
7010 : c8 __ __ INY
7011 : 91 23 __ STA (SP + 0),y 
7013 : ad fb 88 LDA $88fb ; (cwd + 32)
7016 : c8 __ __ INY
7017 : 91 23 __ STA (SP + 0),y 
7019 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
701c : a9 14 __ LDA #$14
701e : 85 12 __ STA P5 
7020 : a5 4e __ LDA T2 + 0 
7022 : 85 15 __ STA P8 
7024 : 20 5a 81 JSR $815a ; (vdc_prints_attr@proxy + 0)
.s1001:
7027 : 18 __ __ CLC
7028 : a5 23 __ LDA SP + 0 
702a : 69 0a __ ADC #$0a
702c : 85 23 __ STA SP + 0 
702e : 90 02 __ BCC $7032 ; (drawDirFrame.s1001 + 11)
7030 : e6 24 __ INC SP + 1 
7032 : 60 __ __ RTS
--------------------------------------------------------------------
7033 : __ __ __ BYT 5b 25 30 32 55 5d 20 25 2e 32 30 53 00          : [%02U] %.20S.
--------------------------------------------------------------------
7040 : __ __ __ BYT 25 55 20 42 4c 4f 43 4b 53 20 46 52 45 45 00    : %U BLOCKS FREE.
--------------------------------------------------------------------
printElementPriv: ; printElementPriv(const u8)->void
.s1000:
704f : a2 03 __ LDX #$03
7051 : b5 53 __ LDA T1 + 0,x 
7053 : 9d d1 ab STA $abd1,x ; (buff + 44)
7056 : ca __ __ DEX
7057 : 10 f8 __ BPL $7051 ; (printElementPriv.s1000 + 2)
7059 : 38 __ __ SEC
705a : a5 23 __ LDA SP + 0 
705c : e9 0a __ SBC #$0a
705e : 85 23 __ STA SP + 0 
7060 : b0 02 __ BCS $7064 ; (printElementPriv.s0 + 0)
7062 : c6 24 __ DEC SP + 1 
.s0:
7064 : a9 0c __ LDA #$0c
7066 : 8d d5 87 STA $87d5 ; (canvas + 15)
7069 : ad f4 82 LDA $82f4 ; (mc_pd_normal + 0)
706c : 8d b4 87 STA $87b4 ; (vdc_state + 7)
706f : ad f8 ab LDA $abf8 ; (sstack + 5)
7072 : 8d d6 87 STA $87d6 ; (canvas + 16)
7075 : ad fe 88 LDA $88fe ; (current + 0)
7078 : 85 53 __ STA T1 + 0 
707a : ad ff 88 LDA $88ff ; (current + 1)
707d : 85 54 __ STA T1 + 1 
707f : cd f5 88 CMP $88f5 ; (cwd + 26)
7082 : d0 0d __ BNE $7091 ; (printElementPriv.s3 + 0)
.s1011:
7084 : a5 53 __ LDA T1 + 0 
7086 : cd f4 88 CMP $88f4 ; (cwd + 25)
7089 : d0 06 __ BNE $7091 ; (printElementPriv.s3 + 0)
.s1:
708b : ad f5 82 LDA $82f5 ; (mc_pd_select + 0)
708e : 8d b4 87 STA $87b4 ; (vdc_state + 7)
.s3:
7091 : a0 ff __ LDY #$ff
.l1002:
7093 : c8 __ __ INY
7094 : b1 53 __ LDA (T1 + 0),y 
7096 : 99 00 89 STA $8900,y ; (linebuffer + 0)
7099 : d0 f8 __ BNE $7093 ; (printElementPriv.l1002 + 0)
.s1003:
709b : a9 00 __ LDA #$00
709d : a0 08 __ LDY #$08
709f : 91 23 __ STA (SP + 0),y 
70a1 : a9 89 __ LDA #$89
70a3 : c8 __ __ INY
70a4 : 91 23 __ STA (SP + 0),y 
70a6 : a9 00 __ LDA #$00
70a8 : a0 02 __ LDY #$02
70aa : 91 23 __ STA (SP + 0),y 
70ac : a9 8b __ LDA #$8b
70ae : c8 __ __ INY
70af : 91 23 __ STA (SP + 0),y 
70b1 : a0 11 __ LDY #$11
70b3 : b1 53 __ LDA (T1 + 0),y 
70b5 : 85 1b __ STA ACCU + 0 
70b7 : c8 __ __ INY
70b8 : b1 53 __ LDA (T1 + 0),y 
70ba : a0 07 __ LDY #$07
70bc : 91 23 __ STA (SP + 0),y 
70be : aa __ __ TAX
70bf : a5 1b __ LDA ACCU + 0 
70c1 : 88 __ __ DEY
70c2 : 91 23 __ STA (SP + 0),y 
70c4 : e0 27 __ CPX #$27
70c6 : d0 02 __ BNE $70ca ; (printElementPriv.s1010 + 0)
.s1009:
70c8 : c9 10 __ CMP #$10
.s1010:
70ca : b0 06 __ BCS $70d2 ; (printElementPriv.s10 + 0)
.s9:
70cc : a9 71 __ LDA #$71
70ce : a2 82 __ LDX #$82
70d0 : 90 04 __ BCC $70d6 ; (printElementPriv.s11 + 0)
.s10:
70d2 : a9 71 __ LDA #$71
70d4 : a2 8d __ LDX #$8d
.s11:
70d6 : 85 54 __ STA T1 + 1 
70d8 : 8a __ __ TXA
70d9 : a0 04 __ LDY #$04
70db : 91 23 __ STA (SP + 0),y 
70dd : a5 54 __ LDA T1 + 1 
70df : c8 __ __ INY
70e0 : 91 23 __ STA (SP + 0),y 
70e2 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
70e5 : a9 00 __ LDA #$00
70e7 : a0 04 __ LDY #$04
70e9 : 91 23 __ STA (SP + 0),y 
70eb : a9 8b __ LDA #$8b
70ed : c8 __ __ INY
70ee : 91 23 __ STA (SP + 0),y 
70f0 : a9 d1 __ LDA #$d1
70f2 : a0 02 __ LDY #$02
70f4 : 91 23 __ STA (SP + 0),y 
70f6 : a9 87 __ LDA #$87
70f8 : c8 __ __ INY
70f9 : 91 23 __ STA (SP + 0),y 
70fb : 20 af 6e JSR $6eaf ; (vdcwin_put_string.s1000 + 0)
70fe : ad fe 88 LDA $88fe ; (current + 0)
7101 : 85 55 __ STA T3 + 0 
7103 : ad ff 88 LDA $88ff ; (current + 1)
7106 : 85 56 __ STA T3 + 1 
7108 : a0 13 __ LDY #$13
710a : b1 55 __ LDA (T3 + 0),y 
710c : 20 25 19 JSR $1925 ; (fileTypeToStr.s1000 + 0)
710f : a0 ff __ LDY #$ff
.l1004:
7111 : c8 __ __ INY
7112 : b1 1b __ LDA (ACCU + 0),y 
7114 : 99 00 8b STA $8b00,y ; (linebuffer2 + 0)
7117 : d0 f8 __ BNE $7111 ; (printElementPriv.l1004 + 0)
.s1005:
7119 : a0 12 __ LDY #$12
711b : b1 55 __ LDA (T3 + 0),y 
711d : c9 27 __ CMP #$27
711f : d0 05 __ BNE $7126 ; (printElementPriv.s1008 + 0)
.s1007:
7121 : 88 __ __ DEY
7122 : b1 55 __ LDA (T3 + 0),y 
7124 : c9 10 __ CMP #$10
.s1008:
7126 : 90 26 __ BCC $714e ; (printElementPriv.s7 + 0)
.s8:
7128 : a5 55 __ LDA T3 + 0 
712a : 85 0d __ STA P0 
712c : a5 56 __ LDA T3 + 1 
712e : 85 0e __ STA P1 
7130 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
7133 : a5 1c __ LDA ACCU + 1 
7135 : d0 17 __ BNE $714e ; (printElementPriv.s7 + 0)
.s1006:
7137 : a5 1b __ LDA ACCU + 0 
7139 : c9 10 __ CMP #$10
713b : d0 11 __ BNE $714e ; (printElementPriv.s7 + 0)
.s5:
713d : ad 01 8b LDA $8b01 ; (linebuffer2 + 1)
7140 : 8d 00 8b STA $8b00 ; (linebuffer2 + 0)
7143 : ad 02 8b LDA $8b02 ; (linebuffer2 + 2)
7146 : 8d 01 8b STA $8b01 ; (linebuffer2 + 1)
7149 : a9 00 __ LDA #$00
714b : 8d 02 8b STA $8b02 ; (linebuffer2 + 2)
.s7:
714e : a9 d1 __ LDA #$d1
7150 : a0 02 __ LDY #$02
7152 : 91 23 __ STA (SP + 0),y 
7154 : a9 87 __ LDA #$87
7156 : c8 __ __ INY
7157 : 91 23 __ STA (SP + 0),y 
7159 : a9 00 __ LDA #$00
715b : c8 __ __ INY
715c : 91 23 __ STA (SP + 0),y 
715e : a9 8b __ LDA #$8b
7160 : c8 __ __ INY
7161 : 91 23 __ STA (SP + 0),y 
7163 : 20 af 6e JSR $6eaf ; (vdcwin_put_string.s1000 + 0)
7166 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
7169 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
.s1001:
716c : 18 __ __ CLC
716d : a5 23 __ LDA SP + 0 
716f : 69 0a __ ADC #$0a
7171 : 85 23 __ STA SP + 0 
7173 : 90 02 __ BCC $7177 ; (printElementPriv.s1001 + 11)
7175 : e6 24 __ INC SP + 1 
7177 : a2 03 __ LDX #$03
7179 : bd d1 ab LDA $abd1,x ; (buff + 44)
717c : 95 53 __ STA T1 + 0,x 
717e : ca __ __ DEX
717f : 10 f8 __ BPL $7179 ; (printElementPriv.s1001 + 13)
7181 : 60 __ __ RTS
--------------------------------------------------------------------
7182 : __ __ __ BYT 25 34 55 20 25 2d 31 36 53 20 00                : %4U %-16S .
--------------------------------------------------------------------
718d : __ __ __ BYT 25 55 20 25 2d 31 35 53 20 00                   : %U %-15S .
--------------------------------------------------------------------
7197 : __ __ __ BYT 70 72 67 00                                     : prg.
--------------------------------------------------------------------
719b : __ __ __ BYT 75 72 73 00                                     : urs.
--------------------------------------------------------------------
719f : __ __ __ BYT 72 65 6c 00                                     : rel.
--------------------------------------------------------------------
71a3 : __ __ __ BYT 76 72 70 00                                     : vrp.
--------------------------------------------------------------------
71a7 : __ __ __ BYT 64 65 6c 00                                     : del.
--------------------------------------------------------------------
71ab : __ __ __ BYT 63 62 6d 00                                     : cbm.
--------------------------------------------------------------------
71af : __ __ __ BYT 64 69 72 00                                     : dir.
--------------------------------------------------------------------
71b3 : __ __ __ BYT 6c 6e 6b 00                                     : lnk.
--------------------------------------------------------------------
71b7 : __ __ __ BYT 6f 74 68 00                                     : oth.
--------------------------------------------------------------------
71bb : __ __ __ BYT 68 64 72 00                                     : hdr.
--------------------------------------------------------------------
71bf : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 : 0123456789ABCDEF
71cf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
71d0 : __ __ __ BYT 6e 4f 20 56 41 4c 49 44 20 44 49 52 45 43 54 4f : nO VALID DIRECTO
71e0 : __ __ __ BYT 52 59 20 45 4e 54 52 49 45 53 20 46 4f 55 4e 44 : RY ENTRIES FOUND
71f0 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
71f2 : __ __ __ BYT 20 66 31 20 64 49 52 20 52 45 46 52 2e 00       :  f1 dIR REFR..
--------------------------------------------------------------------
7200 : __ __ __ BYT 2b 2f 2d 20 64 45 56 49 43 45 00                : +/- dEVICE.
--------------------------------------------------------------------
720b : __ __ __ BYT 72 65 74 20 73 45 4c 45 43 54 00                : ret sELECT.
--------------------------------------------------------------------
7216 : __ __ __ BYT 20 20 74 20 74 4f 50 00                         :   t tOP.
--------------------------------------------------------------------
721e : __ __ __ BYT 20 20 65 20 65 4e 44 00                         :   e eND.
--------------------------------------------------------------------
7226 : __ __ __ BYT 70 2f 75 20 70 41 47 45 20 55 50 2f 44 4f 00    : p/u pAGE UP/DO.
--------------------------------------------------------------------
7235 : __ __ __ BYT 63 55 52 20 6e 41 56 49 47 41 54 45 00          : cUR nAVIGATE.
--------------------------------------------------------------------
7242 : __ __ __ BYT 65 73 63 20 63 41 4e 43 45 4c 00                : esc cANCEL.
--------------------------------------------------------------------
import_dialogue: ; import_dialogue(u8,const u8*)->u8
.s1000:
724d : a2 11 __ LDX #$11
724f : b5 53 __ LDA T0 + 0,x 
7251 : 9d b4 ab STA $abb4,x ; (projbuffer + 28)
7254 : ca __ __ DEX
7255 : 10 f8 __ BPL $724f ; (import_dialogue.s1000 + 2)
7257 : 38 __ __ SEC
7258 : a5 23 __ LDA SP + 0 ; (mode + 0)
725a : e9 08 __ SBC #$08
725c : 85 23 __ STA SP + 0 ; (mode + 0)
725e : b0 02 __ BCS $7262 ; (import_dialogue.s0 + 0)
7260 : c6 24 __ DEC SP + 1 ; (message + 0)
.s0:
7262 : a9 00 __ LDA #$00
7264 : a2 13 __ LDX #$13
.l1002:
7266 : ca __ __ DEX
7267 : 9d 51 8b STA $8b51,x ; (importvars + 0)
726a : d0 fa __ BNE $7266 ; (import_dialogue.l1002 + 0)
.s1003:
726c : a9 30 __ LDA #$30
726e : 8d 61 8b STA $8b61 ; (importvars + 16)
7271 : a9 00 __ LDA #$00
7273 : 8d 62 8b STA $8b62 ; (importvars + 17)
7276 : ad cd 87 LDA $87cd ; (canvas + 7)
7279 : 18 __ __ CLC
727a : 6d 8c 87 ADC $878c ; (screen_col + 0)
727d : 8d 51 8b STA $8b51 ; (importvars + 0)
7280 : ad ce 87 LDA $87ce ; (canvas + 8)
7283 : 6d 8d 87 ADC $878d ; (screen_col + 1)
7286 : 8d 52 8b STA $8b52 ; (importvars + 1)
7289 : ad cf 87 LDA $87cf ; (canvas + 9)
728c : 18 __ __ CLC
728d : 6d 8e 87 ADC $878e ; (screen_row + 0)
7290 : 8d 53 8b STA $8b53 ; (importvars + 2)
7293 : ad d0 87 LDA $87d0 ; (canvas + 10)
7296 : 6d 8f 87 ADC $878f ; (screen_row + 1)
7299 : 8d 54 8b STA $8b54 ; (importvars + 3)
729c : ad fd ab LDA $abfd ; (sstack + 10)
729f : 8d fc ab STA $abfc ; (sstack + 9)
72a2 : 20 dd 64 JSR $64dd ; (filepicker.s1000 + 0)
72a5 : a5 1b __ LDA ACCU + 0 
72a7 : d0 16 __ BNE $72bf ; (import_dialogue.s3 + 0)
.s1001:
72a9 : 18 __ __ CLC
72aa : a5 23 __ LDA SP + 0 ; (mode + 0)
72ac : 69 08 __ ADC #$08
72ae : 85 23 __ STA SP + 0 ; (mode + 0)
72b0 : 90 02 __ BCC $72b4 ; (import_dialogue.s1001 + 11)
72b2 : e6 24 __ INC SP + 1 ; (message + 0)
72b4 : a2 11 __ LDX #$11
72b6 : bd b4 ab LDA $abb4,x ; (projbuffer + 28)
72b9 : 95 53 __ STA T0 + 0,x 
72bb : ca __ __ DEX
72bc : 10 f8 __ BPL $72b6 ; (import_dialogue.s1001 + 13)
72be : 60 __ __ RTS
.s3:
72bf : a9 00 __ LDA #$00
72c1 : 85 17 __ STA P10 
72c3 : a9 14 __ LDA #$14
72c5 : 85 18 __ STA P11 
72c7 : a9 05 __ LDA #$05
72c9 : 8d f3 ab STA $abf3 ; (sstack + 0)
72cc : a9 28 __ LDA #$28
72ce : 8d f4 ab STA $abf4 ; (sstack + 1)
72d1 : a9 0e __ LDA #$0e
72d3 : 8d f5 ab STA $abf5 ; (sstack + 2)
72d6 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
72d9 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
72dc : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
72df : a9 01 __ LDA #$01
72e1 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
72e4 : ad fe ab LDA $abfe ; (sstack + 11)
72e7 : 85 13 __ STA P6 
72e9 : ad ff ab LDA $abff ; (sstack + 12)
72ec : 85 14 __ STA P7 
72ee : 20 33 81 JSR $8133 ; (vdc_prints_attr@proxy + 0)
72f1 : a9 00 __ LDA #$00
72f3 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
72f6 : a9 08 __ LDA #$08
72f8 : 85 12 __ STA P5 
72fa : a9 1b __ LDA #$1b
72fc : 85 13 __ STA P6 
72fe : a9 7b __ LDA #$7b
7300 : 85 14 __ STA P7 
7302 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
7305 : 85 57 __ STA T2 + 0 
7307 : 85 15 __ STA P8 
7309 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
730c : a9 51 __ LDA #$51
730e : a0 02 __ LDY #$02
7310 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7312 : a9 89 __ LDA #$89
7314 : c8 __ __ INY
7315 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7317 : a9 2f __ LDA #$2f
7319 : c8 __ __ INY
731a : 91 23 __ STA (SP + 0),y ; (mode + 0)
731c : a9 7b __ LDA #$7b
731e : c8 __ __ INY
731f : 91 23 __ STA (SP + 0),y ; (mode + 0)
7321 : ad c9 87 LDA $87c9 ; (canvas + 3)
7324 : c8 __ __ INY
7325 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7327 : ad ca 87 LDA $87ca ; (canvas + 4)
732a : c8 __ __ INY
732b : 91 23 __ STA (SP + 0),y ; (mode + 0)
732d : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
7330 : a9 15 __ LDA #$15
7332 : 85 16 __ STA P9 
7334 : a9 09 __ LDA #$09
7336 : 85 17 __ STA P10 
7338 : a9 51 __ LDA #$51
733a : 8d f3 ab STA $abf3 ; (sstack + 0)
733d : a9 89 __ LDA #$89
733f : 8d f4 ab STA $abf4 ; (sstack + 1)
7342 : a9 03 __ LDA #$03
7344 : 8d f5 ab STA $abf5 ; (sstack + 2)
7347 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
734a : 20 8e 4e JSR $4e8e ; (strtol@proxy + 0)
734d : a5 1b __ LDA ACCU + 0 
734f : 8d 55 8b STA $8b55 ; (importvars + 4)
7352 : a5 1c __ LDA ACCU + 1 
7354 : 8d 56 8b STA $8b56 ; (importvars + 5)
7357 : a9 0a __ LDA #$0a
7359 : 85 12 __ STA P5 
735b : a9 32 __ LDA #$32
735d : 85 13 __ STA P6 
735f : a9 7b __ LDA #$7b
7361 : 85 14 __ STA P7 
7363 : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
7366 : a9 51 __ LDA #$51
7368 : a0 02 __ LDY #$02
736a : 91 23 __ STA (SP + 0),y ; (mode + 0)
736c : a9 89 __ LDA #$89
736e : c8 __ __ INY
736f : 91 23 __ STA (SP + 0),y ; (mode + 0)
7371 : a9 2f __ LDA #$2f
7373 : c8 __ __ INY
7374 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7376 : a9 7b __ LDA #$7b
7378 : c8 __ __ INY
7379 : 91 23 __ STA (SP + 0),y ; (mode + 0)
737b : ad cb 87 LDA $87cb ; (canvas + 5)
737e : c8 __ __ INY
737f : 91 23 __ STA (SP + 0),y ; (mode + 0)
7381 : ad cc 87 LDA $87cc ; (canvas + 6)
7384 : c8 __ __ INY
7385 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7387 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
738a : a9 15 __ LDA #$15
738c : 85 16 __ STA P9 
738e : a9 0b __ LDA #$0b
7390 : 85 17 __ STA P10 
7392 : a9 51 __ LDA #$51
7394 : 8d f3 ab STA $abf3 ; (sstack + 0)
7397 : a9 89 __ LDA #$89
7399 : 8d f4 ab STA $abf4 ; (sstack + 1)
739c : a9 03 __ LDA #$03
739e : 8d f5 ab STA $abf5 ; (sstack + 2)
73a1 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
73a4 : 20 8e 4e JSR $4e8e ; (strtol@proxy + 0)
73a7 : a5 1b __ LDA ACCU + 0 
73a9 : 8d 57 8b STA $8b57 ; (importvars + 6)
73ac : a5 1c __ LDA ACCU + 1 
73ae : 8d 58 8b STA $8b58 ; (importvars + 7)
73b1 : a9 0c __ LDA #$0c
73b3 : 85 12 __ STA P5 
73b5 : a9 47 __ LDA #$47
73b7 : 85 13 __ STA P6 
73b9 : a9 7b __ LDA #$7b
73bb : 85 14 __ STA P7 
73bd : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
73c0 : a9 51 __ LDA #$51
73c2 : a0 02 __ LDY #$02
73c4 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73c6 : a9 89 __ LDA #$89
73c8 : c8 __ __ INY
73c9 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73cb : a9 2f __ LDA #$2f
73cd : c8 __ __ INY
73ce : 91 23 __ STA (SP + 0),y ; (mode + 0)
73d0 : a9 7b __ LDA #$7b
73d2 : c8 __ __ INY
73d3 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73d5 : ad 51 8b LDA $8b51 ; (importvars + 0)
73d8 : c8 __ __ INY
73d9 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73db : ad 52 8b LDA $8b52 ; (importvars + 1)
73de : c8 __ __ INY
73df : 91 23 __ STA (SP + 0),y ; (mode + 0)
73e1 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
73e4 : a9 15 __ LDA #$15
73e6 : 85 16 __ STA P9 
73e8 : a9 0d __ LDA #$0d
73ea : 85 17 __ STA P10 
73ec : a9 51 __ LDA #$51
73ee : 8d f3 ab STA $abf3 ; (sstack + 0)
73f1 : a9 89 __ LDA #$89
73f3 : 8d f4 ab STA $abf4 ; (sstack + 1)
73f6 : a9 03 __ LDA #$03
73f8 : 8d f5 ab STA $abf5 ; (sstack + 2)
73fb : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
73fe : 20 8e 4e JSR $4e8e ; (strtol@proxy + 0)
7401 : a5 1b __ LDA ACCU + 0 
7403 : 8d 51 8b STA $8b51 ; (importvars + 0)
7406 : a5 1c __ LDA ACCU + 1 
7408 : 8d 52 8b STA $8b52 ; (importvars + 1)
740b : a9 0e __ LDA #$0e
740d : 85 12 __ STA P5 
740f : a9 5d __ LDA #$5d
7411 : 85 13 __ STA P6 
7413 : a9 7b __ LDA #$7b
7415 : 85 14 __ STA P7 
7417 : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
741a : a9 51 __ LDA #$51
741c : a0 02 __ LDY #$02
741e : 91 23 __ STA (SP + 0),y ; (mode + 0)
7420 : a9 89 __ LDA #$89
7422 : c8 __ __ INY
7423 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7425 : a9 2f __ LDA #$2f
7427 : c8 __ __ INY
7428 : 91 23 __ STA (SP + 0),y ; (mode + 0)
742a : a9 7b __ LDA #$7b
742c : c8 __ __ INY
742d : 91 23 __ STA (SP + 0),y ; (mode + 0)
742f : ad 53 8b LDA $8b53 ; (importvars + 2)
7432 : c8 __ __ INY
7433 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7435 : ad 54 8b LDA $8b54 ; (importvars + 3)
7438 : c8 __ __ INY
7439 : 91 23 __ STA (SP + 0),y ; (mode + 0)
743b : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
743e : a9 15 __ LDA #$15
7440 : 85 16 __ STA P9 
7442 : a9 0f __ LDA #$0f
7444 : 85 17 __ STA P10 
7446 : a9 51 __ LDA #$51
7448 : 8d f3 ab STA $abf3 ; (sstack + 0)
744b : a9 89 __ LDA #$89
744d : 8d f4 ab STA $abf4 ; (sstack + 1)
7450 : a9 03 __ LDA #$03
7452 : 8d f5 ab STA $abf5 ; (sstack + 2)
7455 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
7458 : 20 8e 4e JSR $4e8e ; (strtol@proxy + 0)
745b : a5 1b __ LDA ACCU + 0 
745d : 8d 53 8b STA $8b53 ; (importvars + 2)
7460 : a5 1c __ LDA ACCU + 1 
7462 : 8d 54 8b STA $8b54 ; (importvars + 3)
7465 : ad 55 8b LDA $8b55 ; (importvars + 4)
7468 : 18 __ __ CLC
7469 : 6d 51 8b ADC $8b51 ; (importvars + 0)
746c : 85 53 __ STA T0 + 0 
746e : 85 03 __ STA WORK + 0 
7470 : ad 56 8b LDA $8b56 ; (importvars + 5)
7473 : 6d 52 8b ADC $8b52 ; (importvars + 1)
7476 : 85 54 __ STA T0 + 1 
7478 : 85 04 __ STA WORK + 1 
747a : ad 57 8b LDA $8b57 ; (importvars + 6)
747d : 18 __ __ CLC
747e : 65 1b __ ADC ACCU + 0 
7480 : 85 55 __ STA T1 + 0 
7482 : 85 1b __ STA ACCU + 0 
7484 : ad 58 8b LDA $8b58 ; (importvars + 7)
7487 : 65 1c __ ADC ACCU + 1 
7489 : 85 56 __ STA T1 + 1 
748b : 85 1c __ STA ACCU + 1 
748d : 20 87 7c JSR $7c87 ; (mul16 + 0)
7490 : a5 05 __ LDA WORK + 2 
7492 : 0a __ __ ASL
7493 : aa __ __ TAX
7494 : a5 06 __ LDA WORK + 3 
7496 : 2a __ __ ROL
7497 : a8 __ __ TAY
7498 : 8a __ __ TXA
7499 : 18 __ __ CLC
749a : 69 30 __ ADC #$30
749c : 85 58 __ STA T4 + 0 
749e : 90 01 __ BCC $74a1 ; (import_dialogue.s1035 + 0)
.s1034:
74a0 : c8 __ __ INY
.s1035:
74a1 : 84 59 __ STY T4 + 1 
74a3 : a9 77 __ LDA #$77
74a5 : c5 59 __ CMP T4 + 1 
74a7 : d0 04 __ BNE $74ad ; (import_dialogue.s1031 + 0)
.s1030:
74a9 : a9 ff __ LDA #$ff
74ab : c5 58 __ CMP T4 + 0 
.s1031:
74ad : b0 1a __ BCS $74c9 ; (import_dialogue.s11 + 0)
.s10:
74af : a9 10 __ LDA #$10
74b1 : 85 12 __ STA P5 
74b3 : a9 73 __ LDA #$73
74b5 : 85 13 __ STA P6 
74b7 : a9 7b __ LDA #$7b
74b9 : 85 14 __ STA P7 
74bb : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
74be : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
74c1 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
74c4 : a9 00 __ LDA #$00
74c6 : 4c 12 77 JMP $7712 ; (import_dialogue.s1032 + 0)
.s11:
74c9 : ad ca 87 LDA $87ca ; (canvas + 4)
74cc : c5 54 __ CMP T0 + 1 
74ce : d0 05 __ BNE $74d5 ; (import_dialogue.s1029 + 0)
.s1028:
74d0 : ad c9 87 LDA $87c9 ; (canvas + 3)
74d3 : c5 53 __ CMP T0 + 0 
.s1029:
74d5 : b0 31 __ BCS $7508 ; (import_dialogue.s17 + 0)
.s15:
74d7 : ad cb 87 LDA $87cb ; (canvas + 5)
74da : 0d cc 87 ORA $87cc ; (canvas + 6)
74dd : f0 09 __ BEQ $74e8 ; (import_dialogue.s21 + 0)
.s84:
74df : a9 00 __ LDA #$00
74e1 : 85 58 __ STA T4 + 0 
74e3 : 85 59 __ STA T4 + 1 
74e5 : 4c ab 79 JMP $79ab ; (import_dialogue.l19 + 0)
.s21:
74e8 : ad cb 87 LDA $87cb ; (canvas + 5)
74eb : 0d cc 87 ORA $87cc ; (canvas + 6)
74ee : f0 03 __ BEQ $74f3 ; (import_dialogue.s31 + 0)
74f0 : 4c be 78 JMP $78be ; (import_dialogue.s83 + 0)
.s31:
74f3 : a5 53 __ LDA T0 + 0 
74f5 : 8d c9 87 STA $87c9 ; (canvas + 3)
74f8 : a5 54 __ LDA T0 + 1 
74fa : 8d ca 87 STA $87ca ; (canvas + 4)
74fd : a9 00 __ LDA #$00
74ff : 8d cd 87 STA $87cd ; (canvas + 7)
7502 : 8d ce 87 STA $87ce ; (canvas + 8)
7505 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
.s17:
7508 : ad cc 87 LDA $87cc ; (canvas + 6)
750b : c5 56 __ CMP T1 + 1 
750d : d0 05 __ BNE $7514 ; (import_dialogue.s1023 + 0)
.s1022:
750f : ad cb 87 LDA $87cb ; (canvas + 5)
7512 : c5 55 __ CMP T1 + 0 
.s1023:
7514 : b0 03 __ BCS $7519 ; (import_dialogue.s40 + 0)
7516 : 4c 29 77 JMP $7729 ; (import_dialogue.s38 + 0)
.s40:
7519 : 20 10 82 JSR $8210 ; (vdc_clear@proxy + 0)
751c : ad fd ab LDA $abfd ; (sstack + 10)
751f : 85 5a __ STA T5 + 0 
7521 : f0 03 __ BEQ $7526 ; (import_dialogue.s53 + 0)
7523 : 4c 17 77 JMP $7717 ; (import_dialogue.s55 + 0)
.s53:
7526 : a9 08 __ LDA #$08
7528 : 85 12 __ STA P5 
752a : a9 94 __ LDA #$94
752c : 85 13 __ STA P6 
752e : a9 7b __ LDA #$7b
7530 : 85 14 __ STA P7 
7532 : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
7535 : a9 19 __ LDA #$19
7537 : 8d f8 ab STA $abf8 ; (sstack + 5)
753a : a9 09 __ LDA #$09
753c : 8d f9 ab STA $abf9 ; (sstack + 6)
753f : a9 07 __ LDA #$07
7541 : 8d fa ab STA $abfa ; (sstack + 7)
7544 : a9 00 __ LDA #$00
7546 : 8d fb ab STA $abfb ; (sstack + 8)
7549 : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
754c : a5 1b __ LDA ACCU + 0 
754e : 8d 5f 8b STA $8b5f ; (importvars + 14)
7551 : 0a __ __ ASL
7552 : 0a __ __ ASL
7553 : 0a __ __ ASL
7554 : 0a __ __ ASL
7555 : 18 __ __ CLC
7556 : 69 68 __ ADC #$68
7558 : 85 13 __ STA P6 
755a : a9 86 __ LDA #$86
755c : 69 00 __ ADC #$00
755e : 85 14 __ STA P7 
7560 : a9 09 __ LDA #$09
7562 : 85 12 __ STA P5 
7564 : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
7567 : e6 12 __ INC P5 
7569 : a9 bb __ LDA #$bb
756b : 85 13 __ STA P6 
756d : a9 7b __ LDA #$7b
756f : 85 14 __ STA P7 
7571 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
7574 : a9 19 __ LDA #$19
7576 : 8d f8 ab STA $abf8 ; (sstack + 5)
7579 : a9 0b __ LDA #$0b
757b : 8d f9 ab STA $abf9 ; (sstack + 6)
757e : a9 06 __ LDA #$06
7580 : 8d fa ab STA $abfa ; (sstack + 7)
7583 : a9 00 __ LDA #$00
7585 : 8d fb ab STA $abfb ; (sstack + 8)
7588 : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
758b : a5 1b __ LDA ACCU + 0 
758d : 8d 5d 8b STA $8b5d ; (importvars + 12)
7590 : 0a __ __ ASL
7591 : 0a __ __ ASL
7592 : 0a __ __ ASL
7593 : 0a __ __ ASL
7594 : 18 __ __ CLC
7595 : 69 08 __ ADC #$08
7597 : 85 13 __ STA P6 
7599 : a9 86 __ LDA #$86
759b : 69 00 __ ADC #$00
759d : 85 14 __ STA P7 
759f : a9 0b __ LDA #$0b
75a1 : 85 12 __ STA P5 
75a3 : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
75a6 : a9 0c __ LDA #$0c
75a8 : 85 63 __ STA T11 + 0 
75aa : a5 5a __ LDA T5 + 0 
75ac : c9 02 __ CMP #$02
75ae : d0 4d __ BNE $75fd ; (import_dialogue.s161 + 0)
.s125:
75b0 : a9 0d __ LDA #$0d
.s60:
75b2 : 85 64 __ STA T12 + 0 
75b4 : a9 15 __ LDA #$15
75b6 : 85 11 __ STA P4 
75b8 : a5 63 __ LDA T11 + 0 
75ba : 85 12 __ STA P5 
75bc : 09 02 __ ORA #$02
75be : 85 63 __ STA T11 + 0 
75c0 : a9 d8 __ LDA #$d8
75c2 : 85 13 __ STA P6 
75c4 : a9 7b __ LDA #$7b
75c6 : 85 14 __ STA P7 
75c8 : 20 1d 81 JSR $811d ; (vdc_prints_attr@proxy + 0)
75cb : a9 19 __ LDA #$19
75cd : 8d f8 ab STA $abf8 ; (sstack + 5)
75d0 : a5 64 __ LDA T12 + 0 
75d2 : 8d f9 ab STA $abf9 ; (sstack + 6)
75d5 : a9 07 __ LDA #$07
75d7 : 8d fa ab STA $abfa ; (sstack + 7)
75da : a9 00 __ LDA #$00
75dc : 8d fb ab STA $abfb ; (sstack + 8)
75df : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
75e2 : a5 1b __ LDA ACCU + 0 
75e4 : 8d 63 8b STA $8b63 ; (importvars + 18)
75e7 : 0a __ __ ASL
75e8 : 0a __ __ ASL
75e9 : 0a __ __ ASL
75ea : 0a __ __ ASL
75eb : 18 __ __ CLC
75ec : 69 68 __ ADC #$68
75ee : 85 13 __ STA P6 
75f0 : a9 86 __ LDA #$86
75f2 : 69 00 __ ADC #$00
75f4 : 85 14 __ STA P7 
75f6 : a5 64 __ LDA T12 + 0 
75f8 : 85 12 __ STA P5 
75fa : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
.s161:
75fd : ad 5d 8b LDA $8b5d ; (importvars + 12)
7600 : c9 02 __ CMP #$02
7602 : d0 06 __ BNE $760a ; (import_dialogue.s65 + 0)
.s68:
7604 : a5 5a __ LDA T5 + 0 
7606 : c9 02 __ CMP #$02
7608 : d0 4b __ BNE $7655 ; (import_dialogue.s162 + 0)
.s65:
760a : a9 15 __ LDA #$15
760c : 85 11 __ STA P4 
760e : a5 63 __ LDA T11 + 0 
7610 : 85 12 __ STA P5 
7612 : 18 __ __ CLC
7613 : 69 02 __ ADC #$02
7615 : 85 63 __ STA T11 + 0 
7617 : a9 00 __ LDA #$00
7619 : 85 13 __ STA P6 
761b : a9 7c __ LDA #$7c
761d : 85 14 __ STA P7 
761f : 20 1d 81 JSR $811d ; (vdc_prints_attr@proxy + 0)
7622 : a9 19 __ LDA #$19
7624 : 8d f8 ab STA $abf8 ; (sstack + 5)
7627 : a9 07 __ LDA #$07
7629 : 8d fa ab STA $abfa ; (sstack + 7)
762c : a9 00 __ LDA #$00
762e : 8d fb ab STA $abfb ; (sstack + 8)
7631 : 18 __ __ CLC
7632 : a5 12 __ LDA P5 
7634 : 69 01 __ ADC #$01
7636 : 85 5a __ STA T5 + 0 
7638 : 8d f9 ab STA $abf9 ; (sstack + 6)
763b : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
763e : a5 1b __ LDA ACCU + 0 
7640 : 8d 5e 8b STA $8b5e ; (importvars + 13)
7643 : 0a __ __ ASL
7644 : 0a __ __ ASL
7645 : 0a __ __ ASL
7646 : 0a __ __ ASL
7647 : 18 __ __ CLC
7648 : 69 68 __ ADC #$68
764a : 85 13 __ STA P6 
764c : a9 86 __ LDA #$86
764e : 69 00 __ ADC #$00
7650 : 85 14 __ STA P7 
7652 : 20 24 81 JSR $8124 ; (vdc_prints_attr@proxy + 0)
.s162:
7655 : ad 5d 8b LDA $8b5d ; (importvars + 12)
7658 : c9 02 __ CMP #$02
765a : f0 07 __ BEQ $7663 ; (import_dialogue.s71 + 0)
.s74:
765c : ad 5e 8b LDA $8b5e ; (importvars + 13)
765f : c9 01 __ CMP #$01
7661 : d0 4b __ BNE $76ae ; (import_dialogue.s163 + 0)
.s71:
7663 : a9 15 __ LDA #$15
7665 : 85 11 __ STA P4 
7667 : a5 63 __ LDA T11 + 0 
7669 : 85 12 __ STA P5 
766b : 18 __ __ CLC
766c : 69 02 __ ADC #$02
766e : 85 63 __ STA T11 + 0 
7670 : a9 15 __ LDA #$15
7672 : 85 13 __ STA P6 
7674 : a9 7c __ LDA #$7c
7676 : 85 14 __ STA P7 
7678 : 20 1d 81 JSR $811d ; (vdc_prints_attr@proxy + 0)
767b : a9 19 __ LDA #$19
767d : 8d f8 ab STA $abf8 ; (sstack + 5)
7680 : a9 07 __ LDA #$07
7682 : 8d fa ab STA $abfa ; (sstack + 7)
7685 : a9 00 __ LDA #$00
7687 : 8d fb ab STA $abfb ; (sstack + 8)
768a : 18 __ __ CLC
768b : a5 12 __ LDA P5 
768d : 69 01 __ ADC #$01
768f : 85 5a __ STA T5 + 0 
7691 : 8d f9 ab STA $abf9 ; (sstack + 6)
7694 : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
7697 : a5 1b __ LDA ACCU + 0 
7699 : 8d 60 8b STA $8b60 ; (importvars + 15)
769c : 0a __ __ ASL
769d : 0a __ __ ASL
769e : 0a __ __ ASL
769f : 0a __ __ ASL
76a0 : 18 __ __ CLC
76a1 : 69 68 __ ADC #$68
76a3 : 85 13 __ STA P6 
76a5 : a9 86 __ LDA #$86
76a7 : 69 00 __ ADC #$00
76a9 : 85 14 __ STA P7 
76ab : 20 24 81 JSR $8124 ; (vdc_prints_attr@proxy + 0)
.s163:
76ae : ad 5d 8b LDA $8b5d ; (importvars + 12)
76b1 : c9 01 __ CMP #$01
76b3 : d0 5b __ BNE $7710 ; (import_dialogue.s1033 + 0)
.s77:
76b5 : a5 63 __ LDA T11 + 0 
76b7 : 85 12 __ STA P5 
76b9 : a9 2b __ LDA #$2b
76bb : 85 13 __ STA P6 
76bd : a9 7c __ LDA #$7c
76bf : 85 14 __ STA P7 
76c1 : 20 12 81 JSR $8112 ; (vdc_prints_attr@proxy + 0)
76c4 : a9 51 __ LDA #$51
76c6 : a0 02 __ LDY #$02
76c8 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76ca : a9 89 __ LDA #$89
76cc : c8 __ __ INY
76cd : 91 23 __ STA (SP + 0),y ; (mode + 0)
76cf : a9 2f __ LDA #$2f
76d1 : c8 __ __ INY
76d2 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76d4 : a9 7b __ LDA #$7b
76d6 : c8 __ __ INY
76d7 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76d9 : ad 61 8b LDA $8b61 ; (importvars + 16)
76dc : c8 __ __ INY
76dd : 91 23 __ STA (SP + 0),y ; (mode + 0)
76df : ad 62 8b LDA $8b62 ; (importvars + 17)
76e2 : c8 __ __ INY
76e3 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76e5 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
76e8 : a9 15 __ LDA #$15
76ea : 85 16 __ STA P9 
76ec : a9 51 __ LDA #$51
76ee : 8d f3 ab STA $abf3 ; (sstack + 0)
76f1 : a9 89 __ LDA #$89
76f3 : 8d f4 ab STA $abf4 ; (sstack + 1)
76f6 : a9 06 __ LDA #$06
76f8 : 8d f5 ab STA $abf5 ; (sstack + 2)
76fb : a6 63 __ LDX T11 + 0 
76fd : e8 __ __ INX
76fe : 86 17 __ STX P10 
7700 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
7703 : 20 8e 4e JSR $4e8e ; (strtol@proxy + 0)
7706 : a5 1b __ LDA ACCU + 0 
7708 : 8d 61 8b STA $8b61 ; (importvars + 16)
770b : a5 1c __ LDA ACCU + 1 
770d : 8d 62 8b STA $8b62 ; (importvars + 17)
.s1033:
7710 : a9 01 __ LDA #$01
.s1032:
7712 : 85 1b __ STA ACCU + 0 
7714 : 4c a9 72 JMP $72a9 ; (import_dialogue.s1001 + 0)
.s55:
7717 : a9 08 __ LDA #$08
7719 : 85 63 __ STA T11 + 0 
771b : a5 5a __ LDA T5 + 0 
771d : c9 02 __ CMP #$02
771f : f0 03 __ BEQ $7724 ; (import_dialogue.s124 + 0)
7721 : 4c fd 75 JMP $75fd ; (import_dialogue.s161 + 0)
.s124:
7724 : a9 09 __ LDA #$09
7726 : 4c b2 75 JMP $75b2 ; (import_dialogue.s60 + 0)
.s38:
7729 : ad cb 87 LDA $87cb ; (canvas + 5)
772c : 0d cc 87 ORA $87cc ; (canvas + 6)
772f : f0 0f __ BEQ $7740 ; (import_dialogue.s44 + 0)
.s82:
7731 : a9 00 __ LDA #$00
7733 : 85 53 __ STA T0 + 0 
7735 : 85 54 __ STA T0 + 1 
7737 : a9 7f __ LDA #$7f
7739 : 85 0d __ STA P0 
773b : 85 10 __ STA P3 
773d : 4c 0f 78 JMP $780f ; (import_dialogue.l42 + 0)
.s44:
7740 : a9 0f __ LDA #$0f
7742 : 85 0f __ STA P2 
7744 : ad c9 87 LDA $87c9 ; (canvas + 3)
7747 : 85 1b __ STA ACCU + 0 
7749 : ad ca 87 LDA $87ca ; (canvas + 4)
774c : 85 1c __ STA ACCU + 1 
774e : a5 55 __ LDA T1 + 0 
7750 : 85 03 __ STA WORK + 0 
7752 : a5 56 __ LDA T1 + 1 
7754 : 85 04 __ STA WORK + 1 
7756 : 20 87 7c JSR $7c87 ; (mul16 + 0)
7759 : a5 05 __ LDA WORK + 2 
775b : 85 58 __ STA T4 + 0 
775d : a5 06 __ LDA WORK + 3 
775f : 85 59 __ STA T4 + 1 
7761 : ad cb 87 LDA $87cb ; (canvas + 5)
7764 : 85 1b __ STA ACCU + 0 
7766 : ad cc 87 LDA $87cc ; (canvas + 6)
7769 : 85 1c __ STA ACCU + 1 
776b : ad c9 87 LDA $87c9 ; (canvas + 3)
776e : 85 03 __ STA WORK + 0 
7770 : ad ca 87 LDA $87ca ; (canvas + 4)
7773 : 85 04 __ STA WORK + 1 
7775 : 20 87 7c JSR $7c87 ; (mul16 + 0)
7778 : 18 __ __ CLC
7779 : a5 06 __ LDA WORK + 3 
777b : 69 58 __ ADC #$58
777d : aa __ __ TAX
777e : 18 __ __ CLC
777f : a5 05 __ LDA WORK + 2 
7781 : 65 58 __ ADC T4 + 0 
7783 : a8 __ __ TAY
7784 : 8a __ __ TXA
7785 : 65 59 __ ADC T4 + 1 
7787 : aa __ __ TAX
7788 : 98 __ __ TYA
7789 : 18 __ __ CLC
778a : 69 30 __ ADC #$30
778c : 85 0d __ STA P0 
778e : 90 01 __ BCC $7791 ; (import_dialogue.s1053 + 0)
.s1052:
7790 : e8 __ __ INX
.s1053:
7791 : 86 0e __ STX P1 
7793 : 38 __ __ SEC
7794 : a5 55 __ LDA T1 + 0 
7796 : ed cb 87 SBC $87cb ; (canvas + 5)
7799 : 85 1b __ STA ACCU + 0 
779b : a5 56 __ LDA T1 + 1 
779d : ed cc 87 SBC $87cc ; (canvas + 6)
77a0 : 85 1c __ STA ACCU + 1 
77a2 : ad c9 87 LDA $87c9 ; (canvas + 3)
77a5 : 85 03 __ STA WORK + 0 
77a7 : ad ca 87 LDA $87ca ; (canvas + 4)
77aa : 85 04 __ STA WORK + 1 
77ac : 20 87 7c JSR $7c87 ; (mul16 + 0)
77af : 20 69 1a JSR $1a69 ; (bnk_memset@proxy + 0)
77b2 : a9 20 __ LDA #$20
77b4 : 85 0f __ STA P2 
77b6 : ad c9 87 LDA $87c9 ; (canvas + 3)
77b9 : 85 03 __ STA WORK + 0 
77bb : ad ca 87 LDA $87ca ; (canvas + 4)
77be : 85 04 __ STA WORK + 1 
77c0 : ad cb 87 LDA $87cb ; (canvas + 5)
77c3 : 85 1b __ STA ACCU + 0 
77c5 : ad cc 87 LDA $87cc ; (canvas + 6)
77c8 : 85 1c __ STA ACCU + 1 
77ca : 20 87 7c JSR $7c87 ; (mul16 + 0)
77cd : 18 __ __ CLC
77ce : a5 06 __ LDA WORK + 3 
77d0 : 69 58 __ ADC #$58
77d2 : 85 0e __ STA P1 
77d4 : a5 05 __ LDA WORK + 2 
77d6 : 85 0d __ STA P0 
77d8 : 38 __ __ SEC
77d9 : a5 55 __ LDA T1 + 0 
77db : ed cb 87 SBC $87cb ; (canvas + 5)
77de : 85 1b __ STA ACCU + 0 
77e0 : a5 56 __ LDA T1 + 1 
77e2 : ed cc 87 SBC $87cc ; (canvas + 6)
77e5 : 85 1c __ STA ACCU + 1 
77e7 : ad c9 87 LDA $87c9 ; (canvas + 3)
77ea : 85 03 __ STA WORK + 0 
77ec : ad ca 87 LDA $87ca ; (canvas + 4)
77ef : 85 04 __ STA WORK + 1 
77f1 : 20 87 7c JSR $7c87 ; (mul16 + 0)
77f4 : 20 69 1a JSR $1a69 ; (bnk_memset@proxy + 0)
77f7 : a5 55 __ LDA T1 + 0 
77f9 : 8d cb 87 STA $87cb ; (canvas + 5)
77fc : a5 56 __ LDA T1 + 1 
77fe : 8d cc 87 STA $87cc ; (canvas + 6)
7801 : a9 00 __ LDA #$00
7803 : 8d cf 87 STA $87cf ; (canvas + 9)
7806 : 8d d0 87 STA $87d0 ; (canvas + 10)
7809 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
780c : 4c 19 75 JMP $7519 ; (import_dialogue.s40 + 0)
.l42:
780f : ad c9 87 LDA $87c9 ; (canvas + 3)
7812 : 85 1b __ STA ACCU + 0 
7814 : 85 13 __ STA P6 
7816 : ad ca 87 LDA $87ca ; (canvas + 4)
7819 : 85 1c __ STA ACCU + 1 
781b : 85 14 __ STA P7 
781d : a5 55 __ LDA T1 + 0 
781f : 85 03 __ STA WORK + 0 
7821 : a5 56 __ LDA T1 + 1 
7823 : 85 04 __ STA WORK + 1 
7825 : 20 87 7c JSR $7c87 ; (mul16 + 0)
7828 : a5 05 __ LDA WORK + 2 
782a : 85 5b __ STA T6 + 0 
782c : a5 06 __ LDA WORK + 3 
782e : 85 5c __ STA T6 + 1 
7830 : ad cb 87 LDA $87cb ; (canvas + 5)
7833 : 38 __ __ SEC
7834 : e5 53 __ SBC T0 + 0 
7836 : a8 __ __ TAY
7837 : ad cc 87 LDA $87cc ; (canvas + 6)
783a : e5 54 __ SBC T0 + 1 
783c : aa __ __ TAX
783d : 98 __ __ TYA
783e : 38 __ __ SEC
783f : e9 01 __ SBC #$01
7841 : 85 1b __ STA ACCU + 0 
7843 : 8a __ __ TXA
7844 : e9 00 __ SBC #$00
7846 : 85 1c __ STA ACCU + 1 
7848 : ad c9 87 LDA $87c9 ; (canvas + 3)
784b : 85 03 __ STA WORK + 0 
784d : ad ca 87 LDA $87ca ; (canvas + 4)
7850 : 85 04 __ STA WORK + 1 
7852 : 20 87 7c JSR $7c87 ; (mul16 + 0)
7855 : 18 __ __ CLC
7856 : a5 06 __ LDA WORK + 3 
7858 : 69 58 __ ADC #$58
785a : 85 60 __ STA T8 + 1 
785c : a5 05 __ LDA WORK + 2 
785e : 85 5f __ STA T8 + 0 
7860 : 18 __ __ CLC
7861 : 65 5b __ ADC T6 + 0 
7863 : aa __ __ TAX
7864 : a5 60 __ LDA T8 + 1 
7866 : 65 5c __ ADC T6 + 1 
7868 : a8 __ __ TAY
7869 : 8a __ __ TXA
786a : 18 __ __ CLC
786b : 69 30 __ ADC #$30
786d : 85 0e __ STA P1 
786f : 90 01 __ BCC $7872 ; (import_dialogue.s1047 + 0)
.s1046:
7871 : c8 __ __ INY
.s1047:
7872 : 84 0f __ STY P2 
7874 : ad cb 87 LDA $87cb ; (canvas + 5)
7877 : 85 1b __ STA ACCU + 0 
7879 : ad cc 87 LDA $87cc ; (canvas + 6)
787c : 85 1c __ STA ACCU + 1 
787e : ad c9 87 LDA $87c9 ; (canvas + 3)
7881 : 85 03 __ STA WORK + 0 
7883 : ad ca 87 LDA $87ca ; (canvas + 4)
7886 : 85 04 __ STA WORK + 1 
7888 : 20 87 7c JSR $7c87 ; (mul16 + 0)
788b : 18 __ __ CLC
788c : a5 05 __ LDA WORK + 2 
788e : 65 5f __ ADC T8 + 0 
7890 : aa __ __ TAX
7891 : a5 06 __ LDA WORK + 3 
7893 : 65 60 __ ADC T8 + 1 
7895 : a8 __ __ TAY
7896 : 8a __ __ TXA
7897 : 18 __ __ CLC
7898 : 69 30 __ ADC #$30
789a : 85 11 __ STA P4 
789c : 90 01 __ BCC $789f ; (import_dialogue.s1049 + 0)
.s1048:
789e : c8 __ __ INY
.s1049:
789f : 84 12 __ STY P5 
78a1 : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
78a4 : e6 53 __ INC T0 + 0 
78a6 : d0 02 __ BNE $78aa ; (import_dialogue.s1051 + 0)
.s1050:
78a8 : e6 54 __ INC T0 + 1 
.s1051:
78aa : a5 54 __ LDA T0 + 1 
78ac : cd cc 87 CMP $87cc ; (canvas + 6)
78af : d0 05 __ BNE $78b6 ; (import_dialogue.s1019 + 0)
.s1018:
78b1 : a5 53 __ LDA T0 + 0 
78b3 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1019:
78b6 : b0 03 __ BCS $78bb ; (import_dialogue.s1019 + 5)
78b8 : 4c 0f 78 JMP $780f ; (import_dialogue.l42 + 0)
78bb : 4c 40 77 JMP $7740 ; (import_dialogue.s44 + 0)
.s83:
78be : a9 00 __ LDA #$00
78c0 : 85 58 __ STA T4 + 0 
78c2 : 85 59 __ STA T4 + 1 
.l29:
78c4 : a9 7f __ LDA #$7f
78c6 : 85 11 __ STA P4 
78c8 : ad c9 87 LDA $87c9 ; (canvas + 3)
78cb : 85 5b __ STA T6 + 0 
78cd : 85 03 __ STA WORK + 0 
78cf : 85 14 __ STA P7 
78d1 : ad ca 87 LDA $87ca ; (canvas + 4)
78d4 : 85 5c __ STA T6 + 1 
78d6 : 85 04 __ STA WORK + 1 
78d8 : 85 15 __ STA P8 
78da : ad cb 87 LDA $87cb ; (canvas + 5)
78dd : 38 __ __ SEC
78de : e5 58 __ SBC T4 + 0 
78e0 : a8 __ __ TAY
78e1 : ad cc 87 LDA $87cc ; (canvas + 6)
78e4 : e5 59 __ SBC T4 + 1 
78e6 : aa __ __ TAX
78e7 : 98 __ __ TYA
78e8 : 38 __ __ SEC
78e9 : e9 01 __ SBC #$01
78eb : 85 5d __ STA T7 + 0 
78ed : 85 1b __ STA ACCU + 0 
78ef : 8a __ __ TXA
78f0 : e9 00 __ SBC #$00
78f2 : 85 5e __ STA T7 + 1 
78f4 : 85 1c __ STA ACCU + 1 
78f6 : 20 87 7c JSR $7c87 ; (mul16 + 0)
78f9 : 18 __ __ CLC
78fa : a5 06 __ LDA WORK + 3 
78fc : 69 58 __ ADC #$58
78fe : 85 13 __ STA P6 
7900 : a5 05 __ LDA WORK + 2 
7902 : 85 12 __ STA P5 
7904 : ad b9 87 LDA $87b9 ; (vdc_state + 12)
7907 : 85 0f __ STA P2 
7909 : ad ba 87 LDA $87ba ; (vdc_state + 13)
790c : 85 60 __ STA T8 + 1 
790e : 85 10 __ STA P3 
7910 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
7913 : a9 7f __ LDA #$7f
7915 : 85 0d __ STA P0 
7917 : a5 0f __ LDA P2 
7919 : 85 10 __ STA P3 
791b : a5 60 __ LDA T8 + 1 
791d : 85 11 __ STA P4 
791f : a5 5b __ LDA T6 + 0 
7921 : 85 12 __ STA P5 
7923 : a5 5c __ LDA T6 + 1 
7925 : 85 13 __ STA P6 
7927 : a5 5d __ LDA T7 + 0 
7929 : 85 1b __ STA ACCU + 0 
792b : a5 5e __ LDA T7 + 1 
792d : 85 1c __ STA ACCU + 1 
792f : a5 53 __ LDA T0 + 0 
7931 : 85 03 __ STA WORK + 0 
7933 : a5 54 __ LDA T0 + 1 
7935 : 85 04 __ STA WORK + 1 
7937 : 20 87 7c JSR $7c87 ; (mul16 + 0)
793a : 18 __ __ CLC
793b : a5 06 __ LDA WORK + 3 
793d : 69 58 __ ADC #$58
793f : 85 0f __ STA P2 
7941 : 20 4b 1a JSR $1a4b ; (bnk_cpyfromvdc@proxy + 0)
7944 : a9 20 __ LDA #$20
7946 : 85 0f __ STA P2 
7948 : ad cb 87 LDA $87cb ; (canvas + 5)
794b : 38 __ __ SEC
794c : e5 58 __ SBC T4 + 0 
794e : a8 __ __ TAY
794f : ad cc 87 LDA $87cc ; (canvas + 6)
7952 : e5 59 __ SBC T4 + 1 
7954 : aa __ __ TAX
7955 : 98 __ __ TYA
7956 : 38 __ __ SEC
7957 : e9 01 __ SBC #$01
7959 : 85 1b __ STA ACCU + 0 
795b : 8a __ __ TXA
795c : e9 00 __ SBC #$00
795e : 85 1c __ STA ACCU + 1 
7960 : a5 53 __ LDA T0 + 0 
7962 : 85 03 __ STA WORK + 0 
7964 : a5 54 __ LDA T0 + 1 
7966 : 85 04 __ STA WORK + 1 
7968 : 20 87 7c JSR $7c87 ; (mul16 + 0)
796b : 18 __ __ CLC
796c : a5 06 __ LDA WORK + 3 
796e : 69 58 __ ADC #$58
7970 : aa __ __ TAX
7971 : ad c9 87 LDA $87c9 ; (canvas + 3)
7974 : 18 __ __ CLC
7975 : 65 05 __ ADC WORK + 2 
7977 : 85 0d __ STA P0 
7979 : 8a __ __ TXA
797a : 6d ca 87 ADC $87ca ; (canvas + 4)
797d : 85 0e __ STA P1 
797f : 38 __ __ SEC
7980 : a5 53 __ LDA T0 + 0 
7982 : ed c9 87 SBC $87c9 ; (canvas + 3)
7985 : 85 10 __ STA P3 
7987 : a5 54 __ LDA T0 + 1 
7989 : ed ca 87 SBC $87ca ; (canvas + 4)
798c : 85 11 __ STA P4 
798e : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
7991 : e6 58 __ INC T4 + 0 
7993 : d0 02 __ BNE $7997 ; (import_dialogue.s1045 + 0)
.s1044:
7995 : e6 59 __ INC T4 + 1 
.s1045:
7997 : a5 59 __ LDA T4 + 1 
7999 : cd cc 87 CMP $87cc ; (canvas + 6)
799c : d0 05 __ BNE $79a3 ; (import_dialogue.s1025 + 0)
.s1024:
799e : a5 58 __ LDA T4 + 0 
79a0 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1025:
79a3 : b0 03 __ BCS $79a8 ; (import_dialogue.s1025 + 5)
79a5 : 4c c4 78 JMP $78c4 ; (import_dialogue.l29 + 0)
79a8 : 4c f3 74 JMP $74f3 ; (import_dialogue.s31 + 0)
.l19:
79ab : a9 7f __ LDA #$7f
79ad : 85 11 __ STA P4 
79af : ad c9 87 LDA $87c9 ; (canvas + 3)
79b2 : 85 5b __ STA T6 + 0 
79b4 : 85 03 __ STA WORK + 0 
79b6 : 85 14 __ STA P7 
79b8 : ad ca 87 LDA $87ca ; (canvas + 4)
79bb : 85 5c __ STA T6 + 1 
79bd : 85 04 __ STA WORK + 1 
79bf : 85 15 __ STA P8 
79c1 : ad cb 87 LDA $87cb ; (canvas + 5)
79c4 : 85 5d __ STA T7 + 0 
79c6 : 85 1b __ STA ACCU + 0 
79c8 : ad cc 87 LDA $87cc ; (canvas + 6)
79cb : 85 5e __ STA T7 + 1 
79cd : 85 1c __ STA ACCU + 1 
79cf : 20 87 7c JSR $7c87 ; (mul16 + 0)
79d2 : a5 05 __ LDA WORK + 2 
79d4 : 85 5f __ STA T8 + 0 
79d6 : a5 06 __ LDA WORK + 3 
79d8 : 85 60 __ STA T8 + 1 
79da : 38 __ __ SEC
79db : a5 5d __ LDA T7 + 0 
79dd : e5 58 __ SBC T4 + 0 
79df : a8 __ __ TAY
79e0 : a5 5e __ LDA T7 + 1 
79e2 : e5 59 __ SBC T4 + 1 
79e4 : aa __ __ TAX
79e5 : 98 __ __ TYA
79e6 : 38 __ __ SEC
79e7 : e9 01 __ SBC #$01
79e9 : 85 61 __ STA T9 + 0 
79eb : 85 1b __ STA ACCU + 0 
79ed : 8a __ __ TXA
79ee : e9 00 __ SBC #$00
79f0 : 85 62 __ STA T9 + 1 
79f2 : 85 1c __ STA ACCU + 1 
79f4 : a5 5b __ LDA T6 + 0 
79f6 : 85 03 __ STA WORK + 0 
79f8 : a5 5c __ LDA T6 + 1 
79fa : 85 04 __ STA WORK + 1 
79fc : 20 87 7c JSR $7c87 ; (mul16 + 0)
79ff : 18 __ __ CLC
7a00 : a5 06 __ LDA WORK + 3 
7a02 : 69 58 __ ADC #$58
7a04 : aa __ __ TAX
7a05 : 18 __ __ CLC
7a06 : a5 05 __ LDA WORK + 2 
7a08 : 65 5f __ ADC T8 + 0 
7a0a : a8 __ __ TAY
7a0b : 8a __ __ TXA
7a0c : 65 60 __ ADC T8 + 1 
7a0e : aa __ __ TAX
7a0f : 98 __ __ TYA
7a10 : 18 __ __ CLC
7a11 : 69 30 __ ADC #$30
7a13 : 85 12 __ STA P5 
7a15 : 90 01 __ BCC $7a18 ; (import_dialogue.s1037 + 0)
.s1036:
7a17 : e8 __ __ INX
.s1037:
7a18 : 86 13 __ STX P6 
7a1a : ad b9 87 LDA $87b9 ; (vdc_state + 12)
7a1d : 85 0f __ STA P2 
7a1f : ad ba 87 LDA $87ba ; (vdc_state + 13)
7a22 : 85 60 __ STA T8 + 1 
7a24 : 85 10 __ STA P3 
7a26 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
7a29 : a9 7f __ LDA #$7f
7a2b : 85 0d __ STA P0 
7a2d : a5 0f __ LDA P2 
7a2f : 85 10 __ STA P3 
7a31 : a5 60 __ LDA T8 + 1 
7a33 : 85 11 __ STA P4 
7a35 : a5 5b __ LDA T6 + 0 
7a37 : 85 12 __ STA P5 
7a39 : a5 5c __ LDA T6 + 1 
7a3b : 85 13 __ STA P6 
7a3d : a5 53 __ LDA T0 + 0 
7a3f : 85 1b __ STA ACCU + 0 
7a41 : a5 54 __ LDA T0 + 1 
7a43 : 85 1c __ STA ACCU + 1 
7a45 : a5 5d __ LDA T7 + 0 
7a47 : 85 03 __ STA WORK + 0 
7a49 : a5 5e __ LDA T7 + 1 
7a4b : 85 04 __ STA WORK + 1 
7a4d : 20 87 7c JSR $7c87 ; (mul16 + 0)
7a50 : a5 05 __ LDA WORK + 2 
7a52 : 85 5b __ STA T6 + 0 
7a54 : a5 06 __ LDA WORK + 3 
7a56 : 85 5c __ STA T6 + 1 
7a58 : a5 61 __ LDA T9 + 0 
7a5a : 85 1b __ STA ACCU + 0 
7a5c : a5 62 __ LDA T9 + 1 
7a5e : 85 1c __ STA ACCU + 1 
7a60 : a5 53 __ LDA T0 + 0 
7a62 : 85 03 __ STA WORK + 0 
7a64 : a5 54 __ LDA T0 + 1 
7a66 : 85 04 __ STA WORK + 1 
7a68 : 20 87 7c JSR $7c87 ; (mul16 + 0)
7a6b : 18 __ __ CLC
7a6c : a5 06 __ LDA WORK + 3 
7a6e : 69 58 __ ADC #$58
7a70 : aa __ __ TAX
7a71 : 18 __ __ CLC
7a72 : a5 05 __ LDA WORK + 2 
7a74 : 65 5b __ ADC T6 + 0 
7a76 : a8 __ __ TAY
7a77 : 8a __ __ TXA
7a78 : 65 5c __ ADC T6 + 1 
7a7a : aa __ __ TAX
7a7b : 98 __ __ TYA
7a7c : 18 __ __ CLC
7a7d : 69 30 __ ADC #$30
7a7f : 85 0e __ STA P1 
7a81 : 90 01 __ BCC $7a84 ; (import_dialogue.s1039 + 0)
.s1038:
7a83 : e8 __ __ INX
.s1039:
7a84 : 86 0f __ STX P2 
7a86 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
7a89 : a9 0f __ LDA #$0f
7a8b : 85 0f __ STA P2 
7a8d : ad cb 87 LDA $87cb ; (canvas + 5)
7a90 : 38 __ __ SEC
7a91 : e5 58 __ SBC T4 + 0 
7a93 : a8 __ __ TAY
7a94 : ad cc 87 LDA $87cc ; (canvas + 6)
7a97 : e5 59 __ SBC T4 + 1 
7a99 : aa __ __ TAX
7a9a : 98 __ __ TYA
7a9b : 38 __ __ SEC
7a9c : e9 01 __ SBC #$01
7a9e : 85 1b __ STA ACCU + 0 
7aa0 : 8a __ __ TXA
7aa1 : e9 00 __ SBC #$00
7aa3 : 85 1c __ STA ACCU + 1 
7aa5 : a5 53 __ LDA T0 + 0 
7aa7 : 85 03 __ STA WORK + 0 
7aa9 : a5 54 __ LDA T0 + 1 
7aab : 85 04 __ STA WORK + 1 
7aad : 20 87 7c JSR $7c87 ; (mul16 + 0)
7ab0 : 18 __ __ CLC
7ab1 : a5 06 __ LDA WORK + 3 
7ab3 : 69 58 __ ADC #$58
7ab5 : aa __ __ TAX
7ab6 : ad c9 87 LDA $87c9 ; (canvas + 3)
7ab9 : 18 __ __ CLC
7aba : 65 05 __ ADC WORK + 2 
7abc : 85 5d __ STA T7 + 0 
7abe : 8a __ __ TXA
7abf : 6d ca 87 ADC $87ca ; (canvas + 4)
7ac2 : 85 5e __ STA T7 + 1 
7ac4 : ad cb 87 LDA $87cb ; (canvas + 5)
7ac7 : 85 1b __ STA ACCU + 0 
7ac9 : ad cc 87 LDA $87cc ; (canvas + 6)
7acc : 85 1c __ STA ACCU + 1 
7ace : a5 53 __ LDA T0 + 0 
7ad0 : 85 03 __ STA WORK + 0 
7ad2 : a5 54 __ LDA T0 + 1 
7ad4 : 85 04 __ STA WORK + 1 
7ad6 : 20 87 7c JSR $7c87 ; (mul16 + 0)
7ad9 : 18 __ __ CLC
7ada : a5 05 __ LDA WORK + 2 
7adc : 65 5d __ ADC T7 + 0 
7ade : aa __ __ TAX
7adf : a5 06 __ LDA WORK + 3 
7ae1 : 65 5e __ ADC T7 + 1 
7ae3 : a8 __ __ TAY
7ae4 : 8a __ __ TXA
7ae5 : 18 __ __ CLC
7ae6 : 69 30 __ ADC #$30
7ae8 : 85 0d __ STA P0 
7aea : 90 01 __ BCC $7aed ; (import_dialogue.s1041 + 0)
.s1040:
7aec : c8 __ __ INY
.s1041:
7aed : 84 0e __ STY P1 
7aef : 38 __ __ SEC
7af0 : a5 53 __ LDA T0 + 0 
7af2 : ed c9 87 SBC $87c9 ; (canvas + 3)
7af5 : 85 10 __ STA P3 
7af7 : a5 54 __ LDA T0 + 1 
7af9 : ed ca 87 SBC $87ca ; (canvas + 4)
7afc : 85 11 __ STA P4 
7afe : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
7b01 : e6 58 __ INC T4 + 0 
7b03 : d0 02 __ BNE $7b07 ; (import_dialogue.s1043 + 0)
.s1042:
7b05 : e6 59 __ INC T4 + 1 
.s1043:
7b07 : a5 59 __ LDA T4 + 1 
7b09 : cd cc 87 CMP $87cc ; (canvas + 6)
7b0c : d0 05 __ BNE $7b13 ; (import_dialogue.s1027 + 0)
.s1026:
7b0e : a5 58 __ LDA T4 + 0 
7b10 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1027:
7b13 : b0 03 __ BCS $7b18 ; (import_dialogue.s1027 + 5)
7b15 : 4c ab 79 JMP $79ab ; (import_dialogue.l19 + 0)
7b18 : 4c e8 74 JMP $74e8 ; (import_dialogue.s21 + 0)
--------------------------------------------------------------------
7b1b : __ __ __ BYT 65 4e 54 45 52 20 49 4d 50 4f 52 54 20 57 49 44 : eNTER IMPORT WID
7b2b : __ __ __ BYT 54 48 3a 00                                     : TH:.
--------------------------------------------------------------------
7b2f : __ __ __ BYT 25 55 00                                        : %U.
--------------------------------------------------------------------
7b32 : __ __ __ BYT 65 4e 54 45 52 20 49 4d 50 4f 52 54 20 48 45 49 : eNTER IMPORT HEI
7b42 : __ __ __ BYT 47 48 54 3a 00                                  : GHT:.
--------------------------------------------------------------------
7b47 : __ __ __ BYT 65 4e 54 45 52 20 54 41 52 47 45 54 20 78 20 43 : eNTER TARGET x C
7b57 : __ __ __ BYT 4f 4f 52 44 3a 00                               : OORD:.
--------------------------------------------------------------------
7b5d : __ __ __ BYT 65 4e 54 45 52 20 54 41 52 47 45 54 20 79 20 43 : eNTER TARGET y C
7b6d : __ __ __ BYT 4f 4f 52 44 3a 00                               : OORD:.
--------------------------------------------------------------------
7b73 : __ __ __ BYT 6e 45 57 20 53 49 5a 45 20 55 4e 53 55 50 50 4f : nEW SIZE UNSUPPO
7b83 : __ __ __ BYT 52 54 45 44 2e 20 70 52 45 53 53 20 4b 45 59 2e : RTED. pRESS KEY.
7b93 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
7b94 : __ __ __ BYT 69 4e 43 4c 55 44 45 53 20 4c 4f 41 44 20 41 44 : iNCLUDES LOAD AD
7ba4 : __ __ __ BYT 44 52 45 53 20 41 54 20 46 49 52 53 54 20 32 20 : DRES AT FIRST 2 
7bb4 : __ __ __ BYT 42 59 54 45 53 3f 00                            : BYTES?.
--------------------------------------------------------------------
7bbb : __ __ __ BYT 69 4d 50 4f 52 54 20 43 48 41 52 53 2c 20 43 4f : iMPORT CHARS, CO
7bcb : __ __ __ BYT 4c 4f 52 20 4f 52 20 42 4f 54 48 3f 00          : LOR OR BOTH?.
--------------------------------------------------------------------
7bd8 : __ __ __ BYT 69 47 4e 4f 52 45 20 63 6c 73 20 2f 20 63 4c 45 : iGNORE cls / cLE
7be8 : __ __ __ BYT 41 52 3f 00                                     : AR?.
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s1000:
7bec : 85 0d __ STA P0 
.s0:
7bee : a6 0d __ LDX P0 
7bf0 : 20 c9 ff JSR $ffc9 
7bf3 : a9 00 __ LDA #$00
7bf5 : b0 02 __ BCS $7bf9 ; (krnio_chkout.s0 + 11)
7bf7 : a9 01 __ LDA #$01
7bf9 : 85 1b __ STA ACCU + 0 
.s1001:
7bfb : a5 1b __ LDA ACCU + 0 
7bfd : 60 __ __ RTS
--------------------------------------------------------------------
visualmap:
7bfe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
mc_mb_normal:
7bff : __ __ __ BYT c5                                              : .
--------------------------------------------------------------------
7c00 : __ __ __ BYT 63 4f 4e 56 45 52 54 20 76 69 63 20 43 4f 4c 4f : cONVERT vic COLO
7c10 : __ __ __ BYT 55 52 53 3f 00                                  : URS?.
--------------------------------------------------------------------
7c15 : __ __ __ BYT 75 50 50 45 52 43 41 53 45 20 43 48 41 52 53 45 : uPPERCASE CHARSE
7c25 : __ __ __ BYT 54 3f 20 20 20 00                               : T?   .
--------------------------------------------------------------------
7c2b : __ __ __ BYT 65 4e 54 45 52 20 4f 46 46 53 45 54 20 43 48 41 : eNTER OFFSET CHA
7c3b : __ __ __ BYT 52 20 54 4f 20 43 4f 4c 4f 52 3a 00             : R TO COLOR:.
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->void
.s0:
7c47 : 4c d2 ff JMP $ffd2 
--------------------------------------------------------------------
7c4a : __ __ __ BYT 75 4e 44 4f 3a 20 25 53 00                      : uNDO: %S.
--------------------------------------------------------------------
7c53 : __ __ __ BYT 65 4e 41 42 4c 45 44 20 20 00                   : eNABLED  .
--------------------------------------------------------------------
7c5d : __ __ __ BYT 64 49 53 41 42 4c 45 44 20 00                   : dISABLED .
--------------------------------------------------------------------
mul16by8: ; mul16by8
7c67 : a0 00 __ LDY #$00
7c69 : 84 06 __ STY WORK + 3 
7c6b : 4a __ __ LSR
7c6c : 90 0d __ BCC $7c7b ; (mul16by8 + 20)
7c6e : aa __ __ TAX
7c6f : 18 __ __ CLC
7c70 : 98 __ __ TYA
7c71 : 65 1b __ ADC ACCU + 0 
7c73 : a8 __ __ TAY
7c74 : a5 06 __ LDA WORK + 3 
7c76 : 65 1c __ ADC ACCU + 1 
7c78 : 85 06 __ STA WORK + 3 
7c7a : 8a __ __ TXA
7c7b : 06 1b __ ASL ACCU + 0 
7c7d : 26 1c __ ROL ACCU + 1 
7c7f : 4a __ __ LSR
7c80 : b0 ec __ BCS $7c6e ; (mul16by8 + 7)
7c82 : d0 f7 __ BNE $7c7b ; (mul16by8 + 20)
7c84 : 84 05 __ STY WORK + 2 
7c86 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
7c87 : a0 00 __ LDY #$00
7c89 : 84 06 __ STY WORK + 3 
7c8b : a5 03 __ LDA WORK + 0 
7c8d : a6 04 __ LDX WORK + 1 
7c8f : f0 1c __ BEQ $7cad ; (mul16 + 38)
7c91 : 38 __ __ SEC
7c92 : 6a __ __ ROR
7c93 : 90 0d __ BCC $7ca2 ; (mul16 + 27)
7c95 : aa __ __ TAX
7c96 : 18 __ __ CLC
7c97 : 98 __ __ TYA
7c98 : 65 1b __ ADC ACCU + 0 
7c9a : a8 __ __ TAY
7c9b : a5 06 __ LDA WORK + 3 
7c9d : 65 1c __ ADC ACCU + 1 
7c9f : 85 06 __ STA WORK + 3 
7ca1 : 8a __ __ TXA
7ca2 : 06 1b __ ASL ACCU + 0 
7ca4 : 26 1c __ ROL ACCU + 1 
7ca6 : 4a __ __ LSR
7ca7 : 90 f9 __ BCC $7ca2 ; (mul16 + 27)
7ca9 : d0 ea __ BNE $7c95 ; (mul16 + 14)
7cab : a5 04 __ LDA WORK + 1 
7cad : 4a __ __ LSR
7cae : 90 0d __ BCC $7cbd ; (mul16 + 54)
7cb0 : aa __ __ TAX
7cb1 : 18 __ __ CLC
7cb2 : 98 __ __ TYA
7cb3 : 65 1b __ ADC ACCU + 0 
7cb5 : a8 __ __ TAY
7cb6 : a5 06 __ LDA WORK + 3 
7cb8 : 65 1c __ ADC ACCU + 1 
7cba : 85 06 __ STA WORK + 3 
7cbc : 8a __ __ TXA
7cbd : 06 1b __ ASL ACCU + 0 
7cbf : 26 1c __ ROL ACCU + 1 
7cc1 : 4a __ __ LSR
7cc2 : b0 ec __ BCS $7cb0 ; (mul16 + 41)
7cc4 : d0 f7 __ BNE $7cbd ; (mul16 + 54)
7cc6 : 84 05 __ STY WORK + 2 
7cc8 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
7cc9 : a5 1c __ LDA ACCU + 1 
7ccb : d0 31 __ BNE $7cfe ; (divmod + 53)
7ccd : a5 04 __ LDA WORK + 1 
7ccf : d0 1e __ BNE $7cef ; (divmod + 38)
7cd1 : 85 06 __ STA WORK + 3 
7cd3 : a2 04 __ LDX #$04
7cd5 : 06 1b __ ASL ACCU + 0 
7cd7 : 2a __ __ ROL
7cd8 : c5 03 __ CMP WORK + 0 
7cda : 90 02 __ BCC $7cde ; (divmod + 21)
7cdc : e5 03 __ SBC WORK + 0 
7cde : 26 1b __ ROL ACCU + 0 
7ce0 : 2a __ __ ROL
7ce1 : c5 03 __ CMP WORK + 0 
7ce3 : 90 02 __ BCC $7ce7 ; (divmod + 30)
7ce5 : e5 03 __ SBC WORK + 0 
7ce7 : 26 1b __ ROL ACCU + 0 
7ce9 : ca __ __ DEX
7cea : d0 eb __ BNE $7cd7 ; (divmod + 14)
7cec : 85 05 __ STA WORK + 2 
7cee : 60 __ __ RTS
7cef : a5 1b __ LDA ACCU + 0 
7cf1 : 85 05 __ STA WORK + 2 
7cf3 : a5 1c __ LDA ACCU + 1 
7cf5 : 85 06 __ STA WORK + 3 
7cf7 : a9 00 __ LDA #$00
7cf9 : 85 1b __ STA ACCU + 0 
7cfb : 85 1c __ STA ACCU + 1 
7cfd : 60 __ __ RTS
7cfe : a5 04 __ LDA WORK + 1 
7d00 : d0 1f __ BNE $7d21 ; (divmod + 88)
7d02 : a5 03 __ LDA WORK + 0 
7d04 : 30 1b __ BMI $7d21 ; (divmod + 88)
7d06 : a9 00 __ LDA #$00
7d08 : 85 06 __ STA WORK + 3 
7d0a : a2 10 __ LDX #$10
7d0c : 06 1b __ ASL ACCU + 0 
7d0e : 26 1c __ ROL ACCU + 1 
7d10 : 2a __ __ ROL
7d11 : c5 03 __ CMP WORK + 0 
7d13 : 90 02 __ BCC $7d17 ; (divmod + 78)
7d15 : e5 03 __ SBC WORK + 0 
7d17 : 26 1b __ ROL ACCU + 0 
7d19 : 26 1c __ ROL ACCU + 1 
7d1b : ca __ __ DEX
7d1c : d0 f2 __ BNE $7d10 ; (divmod + 71)
7d1e : 85 05 __ STA WORK + 2 
7d20 : 60 __ __ RTS
7d21 : a9 00 __ LDA #$00
7d23 : 85 05 __ STA WORK + 2 
7d25 : 85 06 __ STA WORK + 3 
7d27 : 84 02 __ STY $02 
7d29 : a0 10 __ LDY #$10
7d2b : 18 __ __ CLC
7d2c : 26 1b __ ROL ACCU + 0 
7d2e : 26 1c __ ROL ACCU + 1 
7d30 : 26 05 __ ROL WORK + 2 
7d32 : 26 06 __ ROL WORK + 3 
7d34 : 38 __ __ SEC
7d35 : a5 05 __ LDA WORK + 2 
7d37 : e5 03 __ SBC WORK + 0 
7d39 : aa __ __ TAX
7d3a : a5 06 __ LDA WORK + 3 
7d3c : e5 04 __ SBC WORK + 1 
7d3e : 90 04 __ BCC $7d44 ; (divmod + 123)
7d40 : 86 05 __ STX WORK + 2 
7d42 : 85 06 __ STA WORK + 3 
7d44 : 88 __ __ DEY
7d45 : d0 e5 __ BNE $7d2c ; (divmod + 99)
7d47 : 26 1b __ ROL ACCU + 0 
7d49 : 26 1c __ ROL ACCU + 1 
7d4b : a4 02 __ LDY $02 
7d4d : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
7d4e : a9 00 __ LDA #$00
7d50 : 85 07 __ STA WORK + 4 
7d52 : 85 08 __ STA WORK + 5 
7d54 : 85 09 __ STA WORK + 6 
7d56 : 85 0a __ STA WORK + 7 
7d58 : a5 03 __ LDA WORK + 0 
7d5a : 20 69 7d JSR $7d69 ; (mul32 + 27)
7d5d : a5 04 __ LDA WORK + 1 
7d5f : 20 69 7d JSR $7d69 ; (mul32 + 27)
7d62 : a5 05 __ LDA WORK + 2 
7d64 : 20 69 7d JSR $7d69 ; (mul32 + 27)
7d67 : a5 06 __ LDA WORK + 3 
7d69 : d0 0f __ BNE $7d7a ; (mul32 + 44)
7d6b : a6 1d __ LDX ACCU + 2 
7d6d : 86 1e __ STX ACCU + 3 
7d6f : a6 1c __ LDX ACCU + 1 
7d71 : 86 1d __ STX ACCU + 2 
7d73 : a6 1b __ LDX ACCU + 0 
7d75 : 86 1c __ STX ACCU + 1 
7d77 : 85 1b __ STA ACCU + 0 
7d79 : 60 __ __ RTS
7d7a : 38 __ __ SEC
7d7b : 6a __ __ ROR
7d7c : 90 1b __ BCC $7d99 ; (mul32 + 75)
7d7e : aa __ __ TAX
7d7f : 18 __ __ CLC
7d80 : a5 07 __ LDA WORK + 4 
7d82 : 65 1b __ ADC ACCU + 0 
7d84 : 85 07 __ STA WORK + 4 
7d86 : a5 08 __ LDA WORK + 5 
7d88 : 65 1c __ ADC ACCU + 1 
7d8a : 85 08 __ STA WORK + 5 
7d8c : a5 09 __ LDA WORK + 6 
7d8e : 65 1d __ ADC ACCU + 2 
7d90 : 85 09 __ STA WORK + 6 
7d92 : a5 0a __ LDA WORK + 7 
7d94 : 65 1e __ ADC ACCU + 3 
7d96 : 85 0a __ STA WORK + 7 
7d98 : 8a __ __ TXA
7d99 : 06 1b __ ASL ACCU + 0 
7d9b : 26 1c __ ROL ACCU + 1 
7d9d : 26 1d __ ROL ACCU + 2 
7d9f : 26 1e __ ROL ACCU + 3 
7da1 : 4a __ __ LSR
7da2 : 90 f5 __ BCC $7d99 ; (mul32 + 75)
7da4 : d0 d8 __ BNE $7d7e ; (mul32 + 48)
7da6 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
7da7 : 84 02 __ STY $02 
7da9 : a0 20 __ LDY #$20
7dab : a9 00 __ LDA #$00
7dad : 85 07 __ STA WORK + 4 
7daf : 85 08 __ STA WORK + 5 
7db1 : 85 09 __ STA WORK + 6 
7db3 : 85 0a __ STA WORK + 7 
7db5 : a5 05 __ LDA WORK + 2 
7db7 : 05 06 __ ORA WORK + 3 
7db9 : d0 78 __ BNE $7e33 ; (divmod32 + 140)
7dbb : a5 04 __ LDA WORK + 1 
7dbd : d0 27 __ BNE $7de6 ; (divmod32 + 63)
7dbf : 18 __ __ CLC
7dc0 : 26 1b __ ROL ACCU + 0 
7dc2 : 26 1c __ ROL ACCU + 1 
7dc4 : 26 1d __ ROL ACCU + 2 
7dc6 : 26 1e __ ROL ACCU + 3 
7dc8 : 2a __ __ ROL
7dc9 : 90 05 __ BCC $7dd0 ; (divmod32 + 41)
7dcb : e5 03 __ SBC WORK + 0 
7dcd : 38 __ __ SEC
7dce : b0 06 __ BCS $7dd6 ; (divmod32 + 47)
7dd0 : c5 03 __ CMP WORK + 0 
7dd2 : 90 02 __ BCC $7dd6 ; (divmod32 + 47)
7dd4 : e5 03 __ SBC WORK + 0 
7dd6 : 88 __ __ DEY
7dd7 : d0 e7 __ BNE $7dc0 ; (divmod32 + 25)
7dd9 : 85 07 __ STA WORK + 4 
7ddb : 26 1b __ ROL ACCU + 0 
7ddd : 26 1c __ ROL ACCU + 1 
7ddf : 26 1d __ ROL ACCU + 2 
7de1 : 26 1e __ ROL ACCU + 3 
7de3 : a4 02 __ LDY $02 
7de5 : 60 __ __ RTS
7de6 : a5 1e __ LDA ACCU + 3 
7de8 : d0 10 __ BNE $7dfa ; (divmod32 + 83)
7dea : a6 1d __ LDX ACCU + 2 
7dec : 86 1e __ STX ACCU + 3 
7dee : a6 1c __ LDX ACCU + 1 
7df0 : 86 1d __ STX ACCU + 2 
7df2 : a6 1b __ LDX ACCU + 0 
7df4 : 86 1c __ STX ACCU + 1 
7df6 : 85 1b __ STA ACCU + 0 
7df8 : a0 18 __ LDY #$18
7dfa : 18 __ __ CLC
7dfb : 26 1b __ ROL ACCU + 0 
7dfd : 26 1c __ ROL ACCU + 1 
7dff : 26 1d __ ROL ACCU + 2 
7e01 : 26 1e __ ROL ACCU + 3 
7e03 : 26 07 __ ROL WORK + 4 
7e05 : 26 08 __ ROL WORK + 5 
7e07 : 90 0c __ BCC $7e15 ; (divmod32 + 110)
7e09 : a5 07 __ LDA WORK + 4 
7e0b : e5 03 __ SBC WORK + 0 
7e0d : aa __ __ TAX
7e0e : a5 08 __ LDA WORK + 5 
7e10 : e5 04 __ SBC WORK + 1 
7e12 : 38 __ __ SEC
7e13 : b0 0c __ BCS $7e21 ; (divmod32 + 122)
7e15 : 38 __ __ SEC
7e16 : a5 07 __ LDA WORK + 4 
7e18 : e5 03 __ SBC WORK + 0 
7e1a : aa __ __ TAX
7e1b : a5 08 __ LDA WORK + 5 
7e1d : e5 04 __ SBC WORK + 1 
7e1f : 90 04 __ BCC $7e25 ; (divmod32 + 126)
7e21 : 86 07 __ STX WORK + 4 
7e23 : 85 08 __ STA WORK + 5 
7e25 : 88 __ __ DEY
7e26 : d0 d3 __ BNE $7dfb ; (divmod32 + 84)
7e28 : 26 1b __ ROL ACCU + 0 
7e2a : 26 1c __ ROL ACCU + 1 
7e2c : 26 1d __ ROL ACCU + 2 
7e2e : 26 1e __ ROL ACCU + 3 
7e30 : a4 02 __ LDY $02 
7e32 : 60 __ __ RTS
7e33 : a0 10 __ LDY #$10
7e35 : a5 1e __ LDA ACCU + 3 
7e37 : 85 08 __ STA WORK + 5 
7e39 : a5 1d __ LDA ACCU + 2 
7e3b : 85 07 __ STA WORK + 4 
7e3d : a9 00 __ LDA #$00
7e3f : 85 1d __ STA ACCU + 2 
7e41 : 85 1e __ STA ACCU + 3 
7e43 : 18 __ __ CLC
7e44 : 26 1b __ ROL ACCU + 0 
7e46 : 26 1c __ ROL ACCU + 1 
7e48 : 26 07 __ ROL WORK + 4 
7e4a : 26 08 __ ROL WORK + 5 
7e4c : 26 09 __ ROL WORK + 6 
7e4e : 26 0a __ ROL WORK + 7 
7e50 : a5 07 __ LDA WORK + 4 
7e52 : c5 03 __ CMP WORK + 0 
7e54 : a5 08 __ LDA WORK + 5 
7e56 : e5 04 __ SBC WORK + 1 
7e58 : a5 09 __ LDA WORK + 6 
7e5a : e5 05 __ SBC WORK + 2 
7e5c : a5 0a __ LDA WORK + 7 
7e5e : e5 06 __ SBC WORK + 3 
7e60 : 90 18 __ BCC $7e7a ; (divmod32 + 211)
7e62 : a5 07 __ LDA WORK + 4 
7e64 : e5 03 __ SBC WORK + 0 
7e66 : 85 07 __ STA WORK + 4 
7e68 : a5 08 __ LDA WORK + 5 
7e6a : e5 04 __ SBC WORK + 1 
7e6c : 85 08 __ STA WORK + 5 
7e6e : a5 09 __ LDA WORK + 6 
7e70 : e5 05 __ SBC WORK + 2 
7e72 : 85 09 __ STA WORK + 6 
7e74 : a5 0a __ LDA WORK + 7 
7e76 : e5 06 __ SBC WORK + 3 
7e78 : 85 0a __ STA WORK + 7 
7e7a : 88 __ __ DEY
7e7b : d0 c7 __ BNE $7e44 ; (divmod32 + 157)
7e7d : 26 1b __ ROL ACCU + 0 
7e7f : 26 1c __ ROL ACCU + 1 
7e81 : a4 02 __ LDY $02 
7e83 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
7e84 : 18 __ __ CLC
7e85 : a5 1b __ LDA ACCU + 0 
7e87 : 69 06 __ ADC #$06
7e89 : 85 03 __ STA WORK + 0 
7e8b : a5 1c __ LDA ACCU + 1 
7e8d : 69 00 __ ADC #$00
7e8f : 85 04 __ STA WORK + 1 
7e91 : ad f4 8a LDA $8af4 ; (HeapNode + 2)
7e94 : d0 1f __ BNE $7eb5 ; (malloc + 49)
7e96 : a9 00 __ LDA #$00
7e98 : 8d 68 8b STA $8b68 
7e9b : 8d 69 8b STA $8b69 
7e9e : ee f4 8a INC $8af4 ; (HeapNode + 2)
7ea1 : a9 68 __ LDA #$68
7ea3 : 8d f2 8a STA $8af2 ; (HeapNode + 0)
7ea6 : a9 8b __ LDA #$8b
7ea8 : 8d f3 8a STA $8af3 ; (HeapNode + 1)
7eab : a9 00 __ LDA #$00
7ead : 8d 6a 8b STA $8b6a 
7eb0 : a9 9c __ LDA #$9c
7eb2 : 8d 6b 8b STA $8b6b 
7eb5 : a9 f2 __ LDA #$f2
7eb7 : a2 8a __ LDX #$8a
7eb9 : 85 1d __ STA ACCU + 2 
7ebb : 86 1e __ STX ACCU + 3 
7ebd : 18 __ __ CLC
7ebe : a0 00 __ LDY #$00
7ec0 : b1 1d __ LDA (ACCU + 2),y 
7ec2 : 85 1b __ STA ACCU + 0 
7ec4 : 65 03 __ ADC WORK + 0 
7ec6 : 85 05 __ STA WORK + 2 
7ec8 : c8 __ __ INY
7ec9 : b1 1d __ LDA (ACCU + 2),y 
7ecb : 85 1c __ STA ACCU + 1 
7ecd : f0 18 __ BEQ $7ee7 ; (malloc + 99)
7ecf : 65 04 __ ADC WORK + 1 
7ed1 : 85 06 __ STA WORK + 3 
7ed3 : a0 02 __ LDY #$02
7ed5 : b1 1b __ LDA (ACCU + 0),y 
7ed7 : c5 05 __ CMP WORK + 2 
7ed9 : c8 __ __ INY
7eda : b1 1b __ LDA (ACCU + 0),y 
7edc : e5 06 __ SBC WORK + 3 
7ede : b0 09 __ BCS $7ee9 ; (malloc + 101)
7ee0 : a5 1b __ LDA ACCU + 0 
7ee2 : a6 1c __ LDX ACCU + 1 
7ee4 : 4c b9 7e JMP $7eb9 ; (malloc + 53)
7ee7 : 02 __ __ INV
7ee8 : 60 __ __ RTS
7ee9 : 18 __ __ CLC
7eea : a5 05 __ LDA WORK + 2 
7eec : 69 07 __ ADC #$07
7eee : 29 f8 __ AND #$f8
7ef0 : 85 07 __ STA WORK + 4 
7ef2 : a5 06 __ LDA WORK + 3 
7ef4 : 69 00 __ ADC #$00
7ef6 : 85 08 __ STA WORK + 5 
7ef8 : a0 02 __ LDY #$02
7efa : a5 07 __ LDA WORK + 4 
7efc : d1 1b __ CMP (ACCU + 0),y 
7efe : d0 15 __ BNE $7f15 ; (malloc + 145)
7f00 : c8 __ __ INY
7f01 : a5 08 __ LDA WORK + 5 
7f03 : d1 1b __ CMP (ACCU + 0),y 
7f05 : d0 0e __ BNE $7f15 ; (malloc + 145)
7f07 : a0 00 __ LDY #$00
7f09 : b1 1b __ LDA (ACCU + 0),y 
7f0b : 91 1d __ STA (ACCU + 2),y 
7f0d : c8 __ __ INY
7f0e : b1 1b __ LDA (ACCU + 0),y 
7f10 : 91 1d __ STA (ACCU + 2),y 
7f12 : 4c 32 7f JMP $7f32 ; (malloc + 174)
7f15 : a0 00 __ LDY #$00
7f17 : b1 1b __ LDA (ACCU + 0),y 
7f19 : 91 07 __ STA (WORK + 4),y 
7f1b : a5 07 __ LDA WORK + 4 
7f1d : 91 1d __ STA (ACCU + 2),y 
7f1f : c8 __ __ INY
7f20 : b1 1b __ LDA (ACCU + 0),y 
7f22 : 91 07 __ STA (WORK + 4),y 
7f24 : a5 08 __ LDA WORK + 5 
7f26 : 91 1d __ STA (ACCU + 2),y 
7f28 : c8 __ __ INY
7f29 : b1 1b __ LDA (ACCU + 0),y 
7f2b : 91 07 __ STA (WORK + 4),y 
7f2d : c8 __ __ INY
7f2e : b1 1b __ LDA (ACCU + 0),y 
7f30 : 91 07 __ STA (WORK + 4),y 
7f32 : a0 00 __ LDY #$00
7f34 : a5 05 __ LDA WORK + 2 
7f36 : 91 1b __ STA (ACCU + 0),y 
7f38 : c8 __ __ INY
7f39 : a5 06 __ LDA WORK + 3 
7f3b : 91 1b __ STA (ACCU + 0),y 
7f3d : a0 02 __ LDY #$02
7f3f : a9 bd __ LDA #$bd
7f41 : 91 1b __ STA (ACCU + 0),y 
7f43 : c8 __ __ INY
7f44 : 91 1b __ STA (ACCU + 0),y 
7f46 : 38 __ __ SEC
7f47 : a5 05 __ LDA WORK + 2 
7f49 : e9 02 __ SBC #$02
7f4b : 85 05 __ STA WORK + 2 
7f4d : b0 02 __ BCS $7f51 ; (malloc + 205)
7f4f : c6 06 __ DEC WORK + 3 
7f51 : a9 be __ LDA #$be
7f53 : a0 00 __ LDY #$00
7f55 : 91 05 __ STA (WORK + 2),y 
7f57 : c8 __ __ INY
7f58 : 91 05 __ STA (WORK + 2),y 
7f5a : a5 1b __ LDA ACCU + 0 
7f5c : 09 04 __ ORA #$04
7f5e : 85 1b __ STA ACCU + 0 
7f60 : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
7f61 : a5 1b __ LDA ACCU + 0 
7f63 : 05 1c __ ORA ACCU + 1 
7f65 : d0 01 __ BNE $7f68 ; (free + 7)
7f67 : 60 __ __ RTS
7f68 : a5 1b __ LDA ACCU + 0 
7f6a : 29 07 __ AND #$07
7f6c : c9 04 __ CMP #$04
7f6e : d0 49 __ BNE $7fb9 ; (free + 88)
7f70 : a5 1b __ LDA ACCU + 0 
7f72 : 29 f8 __ AND #$f8
7f74 : 85 1b __ STA ACCU + 0 
7f76 : a0 02 __ LDY #$02
7f78 : b1 1b __ LDA (ACCU + 0),y 
7f7a : c9 bd __ CMP #$bd
7f7c : d0 3b __ BNE $7fb9 ; (free + 88)
7f7e : c8 __ __ INY
7f7f : b1 1b __ LDA (ACCU + 0),y 
7f81 : c9 bd __ CMP #$bd
7f83 : d0 34 __ BNE $7fb9 ; (free + 88)
7f85 : a0 00 __ LDY #$00
7f87 : 38 __ __ SEC
7f88 : b1 1b __ LDA (ACCU + 0),y 
7f8a : e9 02 __ SBC #$02
7f8c : 85 03 __ STA WORK + 0 
7f8e : c8 __ __ INY
7f8f : b1 1b __ LDA (ACCU + 0),y 
7f91 : e9 00 __ SBC #$00
7f93 : 85 04 __ STA WORK + 1 
7f95 : a0 00 __ LDY #$00
7f97 : b1 03 __ LDA (WORK + 0),y 
7f99 : c9 be __ CMP #$be
7f9b : d0 1c __ BNE $7fb9 ; (free + 88)
7f9d : c8 __ __ INY
7f9e : b1 03 __ LDA (WORK + 0),y 
7fa0 : c9 be __ CMP #$be
7fa2 : d0 15 __ BNE $7fb9 ; (free + 88)
7fa4 : a5 1b __ LDA ACCU + 0 
7fa6 : 05 1c __ ORA ACCU + 1 
7fa8 : d0 01 __ BNE $7fab ; (free + 74)
7faa : 60 __ __ RTS
7fab : a5 1c __ LDA ACCU + 1 
7fad : a6 1b __ LDX ACCU + 0 
7faf : c9 8b __ CMP #$8b
7fb1 : 90 06 __ BCC $7fb9 ; (free + 88)
7fb3 : d0 05 __ BNE $7fba ; (free + 89)
7fb5 : e0 68 __ CPX #$68
7fb7 : b0 01 __ BCS $7fba ; (free + 89)
7fb9 : 02 __ __ INV
7fba : c9 9c __ CMP #$9c
7fbc : 90 06 __ BCC $7fc4 ; (free + 99)
7fbe : d0 f9 __ BNE $7fb9 ; (free + 88)
7fc0 : e0 00 __ CPX #$00
7fc2 : b0 f5 __ BCS $7fb9 ; (free + 88)
7fc4 : a0 02 __ LDY #$02
7fc6 : a9 bf __ LDA #$bf
7fc8 : 91 1b __ STA (ACCU + 0),y 
7fca : c8 __ __ INY
7fcb : 91 1b __ STA (ACCU + 0),y 
7fcd : 18 __ __ CLC
7fce : a0 00 __ LDY #$00
7fd0 : b1 1b __ LDA (ACCU + 0),y 
7fd2 : 69 07 __ ADC #$07
7fd4 : 29 f8 __ AND #$f8
7fd6 : 85 1d __ STA ACCU + 2 
7fd8 : c8 __ __ INY
7fd9 : b1 1b __ LDA (ACCU + 0),y 
7fdb : 69 00 __ ADC #$00
7fdd : 85 1e __ STA ACCU + 3 
7fdf : a9 f2 __ LDA #$f2
7fe1 : a2 8a __ LDX #$8a
7fe3 : 85 05 __ STA WORK + 2 
7fe5 : 86 06 __ STX WORK + 3 
7fe7 : a0 01 __ LDY #$01
7fe9 : b1 05 __ LDA (WORK + 2),y 
7feb : f0 28 __ BEQ $8015 ; (free + 180)
7fed : aa __ __ TAX
7fee : 88 __ __ DEY
7fef : b1 05 __ LDA (WORK + 2),y 
7ff1 : e4 1e __ CPX ACCU + 3 
7ff3 : 90 ee __ BCC $7fe3 ; (free + 130)
7ff5 : d0 1e __ BNE $8015 ; (free + 180)
7ff7 : c5 1d __ CMP ACCU + 2 
7ff9 : 90 e8 __ BCC $7fe3 ; (free + 130)
7ffb : d0 18 __ BNE $8015 ; (free + 180)
7ffd : a0 00 __ LDY #$00
7fff : b1 1d __ LDA (ACCU + 2),y 
8001 : 91 1b __ STA (ACCU + 0),y 
8003 : c8 __ __ INY
8004 : b1 1d __ LDA (ACCU + 2),y 
8006 : 91 1b __ STA (ACCU + 0),y 
8008 : c8 __ __ INY
8009 : b1 1d __ LDA (ACCU + 2),y 
800b : 91 1b __ STA (ACCU + 0),y 
800d : c8 __ __ INY
800e : b1 1d __ LDA (ACCU + 2),y 
8010 : 91 1b __ STA (ACCU + 0),y 
8012 : 4c 2a 80 JMP $802a ; (free + 201)
8015 : a0 00 __ LDY #$00
8017 : b1 05 __ LDA (WORK + 2),y 
8019 : 91 1b __ STA (ACCU + 0),y 
801b : c8 __ __ INY
801c : b1 05 __ LDA (WORK + 2),y 
801e : 91 1b __ STA (ACCU + 0),y 
8020 : c8 __ __ INY
8021 : a5 1d __ LDA ACCU + 2 
8023 : 91 1b __ STA (ACCU + 0),y 
8025 : c8 __ __ INY
8026 : a5 1e __ LDA ACCU + 3 
8028 : 91 1b __ STA (ACCU + 0),y 
802a : a0 02 __ LDY #$02
802c : b1 05 __ LDA (WORK + 2),y 
802e : c5 1b __ CMP ACCU + 0 
8030 : d0 1d __ BNE $804f ; (free + 238)
8032 : c8 __ __ INY
8033 : b1 05 __ LDA (WORK + 2),y 
8035 : c5 1c __ CMP ACCU + 1 
8037 : d0 16 __ BNE $804f ; (free + 238)
8039 : a0 00 __ LDY #$00
803b : b1 1b __ LDA (ACCU + 0),y 
803d : 91 05 __ STA (WORK + 2),y 
803f : c8 __ __ INY
8040 : b1 1b __ LDA (ACCU + 0),y 
8042 : 91 05 __ STA (WORK + 2),y 
8044 : c8 __ __ INY
8045 : b1 1b __ LDA (ACCU + 0),y 
8047 : 91 05 __ STA (WORK + 2),y 
8049 : c8 __ __ INY
804a : b1 1b __ LDA (ACCU + 0),y 
804c : 91 05 __ STA (WORK + 2),y 
804e : 60 __ __ RTS
804f : a0 00 __ LDY #$00
8051 : a5 1b __ LDA ACCU + 0 
8053 : 91 05 __ STA (WORK + 2),y 
8055 : c8 __ __ INY
8056 : a5 1c __ LDA ACCU + 1 
8058 : 91 05 __ STA (WORK + 2),y 
805a : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
805b : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab13L:
8061 : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab3L:
8065 : __ __ __ BYT 00 03 06 09 0c 0f 12                            : .......
--------------------------------------------------------------------
__multab32L:
806c : __ __ __ BYT 00 20 40 60 80 a0 c0 e0 00 20                   : . @`..... 
--------------------------------------------------------------------
__multab12L:
8076 : __ __ __ BYT 00 0c 18 24 30 3c                               : ...$0<
--------------------------------------------------------------------
__multab96L:
807c : __ __ __ BYT 00 60 c0 20 80 e0 40 a0                         : .`. ..@.
--------------------------------------------------------------------
__multab96H:
8084 : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
strtol@proxy: ; strtol@proxy
808c : a9 51 __ LDA #$51
808e : 85 0d __ STA P0 
8090 : a9 89 __ LDA #$89
8092 : 85 0e __ STA P1 
8094 : a9 a4 __ LDA #$a4
8096 : 85 0f __ STA P2 
8098 : a9 ab __ LDA #$ab
809a : 85 10 __ STA P3 
809c : a9 0a __ LDA #$0a
809e : 85 11 __ STA P4 
80a0 : 4c a2 4e JMP $4ea2 ; (strtol.l1 + 0)
--------------------------------------------------------------------
strtol@proxy: ; strtol@proxy
80a3 : a9 51 __ LDA #$51
80a5 : 85 0d __ STA P0 
80a7 : a9 89 __ LDA #$89
80a9 : 85 0e __ STA P1 
80ab : a9 0a __ LDA #$0a
80ad : 85 11 __ STA P4 
80af : 4c a2 4e JMP $4ea2 ; (strtol.l1 + 0)
--------------------------------------------------------------------
vdcwin_cpy_viewport@proxy: ; vdcwin_cpy_viewport@proxy
80b2 : a9 c6 __ LDA #$c6
80b4 : 85 16 __ STA P9 
80b6 : a9 87 __ LDA #$87
80b8 : 85 17 __ STA P10 
80ba : 4c 46 45 JMP $4546 ; (vdcwin_cpy_viewport.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
80bd : a5 4c __ LDA $4c 
80bf : 85 11 __ STA P4 
80c1 : a5 4d __ LDA $4d 
80c3 : 85 12 __ STA P5 
80c5 : 4c 9c 47 JMP $479c ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
80c8 : a5 53 __ LDA $53 
80ca : 85 11 __ STA P4 
80cc : a5 54 __ LDA $54 
80ce : 85 12 __ STA P5 
80d0 : 4c 9c 47 JMP $479c ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80d3 : a9 51 __ LDA #$51
80d5 : 85 13 __ STA P6 
80d7 : a9 89 __ LDA #$89
80d9 : 85 14 __ STA P7 
80db : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80de : a9 15 __ LDA #$15
80e0 : 85 11 __ STA P4 
80e2 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
80e5 : 85 15 __ STA P8 
80e7 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80ea : a9 15 __ LDA #$15
80ec : 85 11 __ STA P4 
80ee : a5 51 __ LDA $51 
80f0 : 85 12 __ STA P5 
80f2 : a9 00 __ LDA #$00
80f4 : 85 13 __ STA P6 
80f6 : a9 89 __ LDA #$89
80f8 : 85 14 __ STA P7 
80fa : ad b4 87 LDA $87b4 ; (vdc_state + 7)
80fd : 85 15 __ STA P8 
80ff : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8102 : a9 15 __ LDA #$15
8104 : 85 11 __ STA P4 
8106 : a9 08 __ LDA #$08
8108 : 85 12 __ STA P5 
810a : ad b4 87 LDA $87b4 ; (vdc_state + 7)
810d : 85 15 __ STA P8 
810f : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8112 : a9 15 __ LDA #$15
8114 : 85 11 __ STA P4 
8116 : a5 57 __ LDA $57 
8118 : 85 15 __ STA P8 
811a : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
811d : a5 57 __ LDA $57 
811f : 85 15 __ STA P8 
8121 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8124 : a9 15 __ LDA #$15
8126 : 85 11 __ STA P4 
8128 : a5 5a __ LDA $5a 
812a : 85 12 __ STA P5 
812c : a5 57 __ LDA $57 
812e : 85 15 __ STA P8 
8130 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8133 : a9 15 __ LDA #$15
8135 : 85 11 __ STA P4 
8137 : a9 06 __ LDA #$06
8139 : 85 12 __ STA P5 
813b : ad b4 87 LDA $87b4 ; (vdc_state + 7)
813e : 85 15 __ STA P8 
8140 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8143 : a9 15 __ LDA #$15
8145 : 85 11 __ STA P4 
8147 : a5 53 __ LDA $53 
8149 : 85 15 __ STA P8 
814b : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
814e : a9 0b __ LDA #$0b
8150 : 85 11 __ STA P4 
8152 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
8155 : 85 15 __ STA P8 
8157 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
815a : a9 0b __ LDA #$0b
815c : 85 11 __ STA P4 
815e : a9 00 __ LDA #$00
8160 : 85 13 __ STA P6 
8162 : a9 89 __ LDA #$89
8164 : 85 14 __ STA P7 
8166 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8169 : a9 00 __ LDA #$00
816b : 85 13 __ STA P6 
816d : a9 89 __ LDA #$89
816f : 85 14 __ STA P7 
8171 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8174 : a9 0a __ LDA #$0a
8176 : 85 12 __ STA P5 
8178 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
817b : a9 15 __ LDA #$15
817d : 85 11 __ STA P4 
817f : a9 08 __ LDA #$08
8181 : 85 12 __ STA P5 
8183 : a9 51 __ LDA #$51
8185 : 85 13 __ STA P6 
8187 : a9 89 __ LDA #$89
8189 : 85 14 __ STA P7 
818b : ad b4 87 LDA $87b4 ; (vdc_state + 7)
818e : 85 15 __ STA P8 
8190 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8193 : a9 f1 __ LDA #$f1
8195 : 85 13 __ STA P6 
8197 : a9 bb __ LDA #$bb
8199 : 85 14 __ STA P7 
819b : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
819e : a9 15 __ LDA #$15
81a0 : 85 11 __ STA P4 
81a2 : a9 0b __ LDA #$0b
81a4 : 85 12 __ STA P5 
81a6 : a9 00 __ LDA #$00
81a8 : 85 13 __ STA P6 
81aa : a9 bc __ LDA #$bc
81ac : 85 14 __ STA P7 
81ae : a5 53 __ LDA $53 
81b0 : 85 15 __ STA P8 
81b2 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81b5 : a9 15 __ LDA #$15
81b7 : 85 11 __ STA P4 
81b9 : a9 0b __ LDA #$0b
81bb : 85 12 __ STA P5 
81bd : a9 d0 __ LDA #$d0
81bf : 85 13 __ STA P6 
81c1 : a9 bb __ LDA #$bb
81c3 : 85 14 __ STA P7 
81c5 : a5 53 __ LDA $53 
81c7 : 85 15 __ STA P8 
81c9 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81cc : ad f4 82 LDA $82f4 ; (mc_pd_normal + 0)
81cf : 85 15 __ STA P8 
81d1 : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81d4 : a9 f4 __ LDA #$f4
81d6 : 85 13 __ STA P6 
81d8 : a9 39 __ LDA #$39
81da : 85 14 __ STA P7 
81dc : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81df : a9 0a __ LDA #$0a
81e1 : 85 11 __ STA P4 
81e3 : a9 09 __ LDA #$09
81e5 : 85 12 __ STA P5 
81e7 : a5 52 __ LDA $52 
81e9 : 85 15 __ STA P8 
81eb : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81ee : a5 4e __ LDA $4e 
81f0 : 85 12 __ STA P5 
81f2 : a9 51 __ LDA #$51
81f4 : 85 13 __ STA P6 
81f6 : a9 89 __ LDA #$89
81f8 : 85 14 __ STA P7 
81fa : a5 51 __ LDA $51 
81fc : 85 15 __ STA P8 
81fe : 4c 3f 34 JMP $343f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
8201 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
8204 : 85 10 __ STA P3 
8206 : 4c fc 34 JMP $34fc ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
8209 : a5 44 __ LDA $44 
820b : 85 0e __ STA P1 
820d : 4c 81 2d JMP $2d81 ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
8210 : a9 14 __ LDA #$14
8212 : 85 0f __ STA P2 
8214 : a9 20 __ LDA #$20
8216 : 85 11 __ STA P4 
8218 : a9 28 __ LDA #$28
821a : 85 13 __ STA P6 
821c : a9 08 __ LDA #$08
821e : 85 14 __ STA P7 
8220 : a9 0a __ LDA #$0a
8222 : 85 15 __ STA P8 
8224 : 4c ac 2c JMP $2cac ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
8227 : a9 0a __ LDA #$0a
8229 : 85 0f __ STA P2 
822b : a9 20 __ LDA #$20
822d : 85 11 __ STA P4 
822f : a9 05 __ LDA #$05
8231 : 85 14 __ STA P7 
8233 : 4c ac 2c JMP $2cac ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
8236 : a9 20 __ LDA #$20
8238 : 85 11 __ STA P4 
823a : a9 01 __ LDA #$01
823c : 85 15 __ STA P8 
823e : 4c ac 2c JMP $2cac ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
8241 : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 85 89 86 8a 87 8b : ................
8251 : __ __ __ BYT 88 8c 0a 8c                                     : ....
--------------------------------------------------------------------
pulldown_options:
8255 : __ __ __ BYT 06 04 05 03 02 06 03 02                         : ........
--------------------------------------------------------------------
winStyles:
825d : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
826d : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
_cinfo:
826f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 02 01 01 01 01 00 00 : ................
827f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
828f : __ __ __ BYT 02 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 : .@@@@@@@@@@@@@@@
829f : __ __ __ BYT 04 04 04 04 04 04 04 04 04 04 40 40 40 40 40 40 : ..........@@@@@@
82af : __ __ __ BYT 40 30 30 30 30 30 30 10 10 10 10 10 10 10 10 10 : @000000.........
82bf : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 10 40 40 40 40 40 : ...........@@@@@
82cf : __ __ __ BYT 40 28 28 28 28 28 28 08 08 08 08 08 08 08 08 08 : @((((((.........
82df : __ __ __ BYT 08 08 08 08 08 08 08 08 08 08 08 40 40 40 40 00 : ...........@@@@.
--------------------------------------------------------------------
rowsel:
82ef : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
colsel:
82f1 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
mc_mb_select:
82f3 : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
mc_pd_normal:
82f4 : __ __ __ BYT c6                                              : .
--------------------------------------------------------------------
mc_pd_select:
82f5 : __ __ __ BYT cd                                              : .
--------------------------------------------------------------------
progressRev:
82f6 : __ __ __ BYT 00 00 01 01                                     : ....
--------------------------------------------------------------------
progressBar:
82fa : __ __ __ BYT a5 a1 a7 20                                     : ... 
--------------------------------------------------------------------
value2hex:
82fe : __ __ __ BYT bf 71                                           : .q
--------------------------------------------------------------------
vdc_modes:
8300 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
8310 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
8320 : __ __ __ BYT e7 24 7e ff 50 00 32 00 01 00 00 00 10 00 40 00 : .$~.P.2.......@.
8330 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
8340 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
8350 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
8360 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
8370 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
8380 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
8390 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
83a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
83b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
83c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
83d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
pulldown_titles:
83d8 : __ __ __ BYT 77 49 44 54 48 3a 20 20 20 20 20 20 38 30 20 00 : wIDTH:      80 .
83e8 : __ __ __ BYT 68 45 49 47 48 54 3a 20 20 20 20 20 32 35 20 00 : hEIGHT:     25 .
83f8 : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 3a 20 20 30 20 00 : bACKGROUND:  0 .
8408 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 20 30 20 00 : sCREENMODE:  0 .
8418 : __ __ __ BYT 63 4c 45 41 52 20 20 20 20 20 20 20 20 20 20 00 : cLEAR          .
8428 : __ __ __ BYT 66 49 4c 4c 20 20 20 20 20 20 20 20 20 20 20 00 : fILL           .
8438 : __ __ __ BYT 73 41 56 45 20 53 43 52 45 45 4e 20 20 20 20 00 : sAVE SCREEN    .
8448 : __ __ __ BYT 6c 4f 41 44 20 53 43 52 45 45 4e 20 20 20 20 00 : lOAD SCREEN    .
8458 : __ __ __ BYT 73 41 56 45 20 50 52 4f 4a 45 43 54 20 20 20 00 : sAVE PROJECT   .
8468 : __ __ __ BYT 6c 4f 41 44 20 50 52 4f 4a 45 43 54 20 20 20 00 : lOAD PROJECT   .
8478 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8488 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8498 : __ __ __ BYT 6c 4f 41 44 20 53 54 41 4e 44 41 52 44 20 20 00 : lOAD STANDARD  .
84a8 : __ __ __ BYT 6c 4f 41 44 20 41 4c 54 45 52 4e 41 54 45 20 00 : lOAD ALTERNATE .
84b8 : __ __ __ BYT 73 41 56 45 20 53 54 41 4e 44 41 52 44 20 20 00 : sAVE STANDARD  .
84c8 : __ __ __ BYT 73 41 56 45 20 41 4c 54 45 52 4e 41 54 45 20 00 : sAVE ALTERNATE .
84d8 : __ __ __ BYT 72 45 53 45 54 20 43 48 41 52 53 45 54 53 20 00 : rESET CHARSETS .
84e8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
84f8 : __ __ __ BYT 69 4d 50 4f 52 54 20 70 72 67 20 20 20 20 20 00 : iMPORT prg     .
8508 : __ __ __ BYT 69 4d 50 4f 52 54 20 73 65 71 20 20 20 20 20 00 : iMPORT seq     .
8518 : __ __ __ BYT 65 58 50 4f 52 54 20 73 65 71 20 20 20 20 20 00 : eXPORT seq     .
8528 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8538 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8548 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8558 : __ __ __ BYT 76 45 52 53 49 4f 4e 2f 43 52 45 44 49 54 53 00 : vERSION/CREDITS.
8568 : __ __ __ BYT 65 58 49 54 20 50 52 4f 47 52 41 4d 20 20 20 00 : eXIT PROGRAM   .
8578 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8588 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8598 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
85a8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
85b8 : __ __ __ BYT 70 61 6c 20 20 38 30 58 32 35 00 00 00 00 00 00 : pal  80X25......
85c8 : __ __ __ BYT 70 61 6c 20 20 38 30 58 35 30 00 00 00 00 00 00 : pal  80X50......
85d8 : __ __ __ BYT 70 61 6c 20 20 38 30 58 37 30 00 00 00 00 00 00 : pal  80X70......
85e8 : __ __ __ BYT 6e 74 73 63 20 38 30 58 32 35 00 00 00 00 00 00 : ntsc 80X25......
85f8 : __ __ __ BYT 6e 74 73 63 20 38 30 58 35 30 00 00 00 00 00 00 : ntsc 80X50......
8608 : __ __ __ BYT 6e 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 : ntsc 80X60......
8618 : __ __ __ BYT 62 4f 54 48 20 20 20 20 20 20 00 00 00 00 00 00 : bOTH      ......
8628 : __ __ __ BYT 6f 4e 4c 59 20 43 48 41 52 53 00 00 00 00 00 00 : oNLY CHARS......
8638 : __ __ __ BYT 6f 4e 4c 59 20 43 4f 4c 4f 52 00 00 00 00 00 00 : oNLY COLOR......
8648 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8658 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8668 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8678 : __ __ __ BYT 79 45 53 00 00 00 00 00 00 00 00 00 00 00 00 00 : yES.............
8688 : __ __ __ BYT 6e 4f 20 00 00 00 00 00 00 00 00 00 00 00 00 00 : nO .............
8698 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
86a8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
86b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
86c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
p2smap:
86d8 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
reg_types:
86e0 : __ __ __ BYT fa 69 97 71 9b 71 9f 71 a3 71                   : .i.q.q.q.q
--------------------------------------------------------------------
oth_types:
86ea : __ __ __ BYT a7 71 ab 71 af 71 b3 71 b7 71 bb 71             : .q.q.q.q.q.q
--------------------------------------------------------------------
winCfg:
86f6 : __ __ __ BSS	8
--------------------------------------------------------------------
bootdevice:
86fe : __ __ __ BSS	1
--------------------------------------------------------------------
appexit:
86ff : __ __ __ BSS	1
--------------------------------------------------------------------
menubar:
8700 : __ __ __ BYT 73 43 52 45 45 4e 00 00 00 00 00 00 66 49 4c 45 : sCREEN......fILE
8710 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 00 : ........cHARSET.
8720 : __ __ __ BYT 00 00 00 00 69 4d 50 2f 65 58 50 4f 52 54 00 00 : ....iMP/eXPORT..
8730 : __ __ __ BYT 69 4e 46 4f 52 4d 41 54 49 4f 4e 00 00 00 00 00 : iNFORMATION.....
8740 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
bitshift:
8742 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
8752 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8762 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
8772 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
krnio_pstatus:
877a : __ __ __ BSS	16
--------------------------------------------------------------------
charsetchanged:
878a : __ __ __ BSS	2
--------------------------------------------------------------------
screen_col:
878c : __ __ __ BSS	2
--------------------------------------------------------------------
screen_row:
878e : __ __ __ BSS	2
--------------------------------------------------------------------
screenbackground:
8790 : __ __ __ BSS	1
--------------------------------------------------------------------
plotscreencode:
8791 : __ __ __ BSS	1
--------------------------------------------------------------------
plotcolor:
8792 : __ __ __ BSS	1
--------------------------------------------------------------------
plotreverse:
8793 : __ __ __ BSS	1
--------------------------------------------------------------------
plotunderline:
8794 : __ __ __ BSS	1
--------------------------------------------------------------------
plotblink:
8795 : __ __ __ BSS	1
--------------------------------------------------------------------
plotaltchar:
8796 : __ __ __ BSS	1
--------------------------------------------------------------------
filename:
8797 : __ __ __ BSS	21
--------------------------------------------------------------------
targetdevice:
87ac : __ __ __ BSS	1
--------------------------------------------------------------------
vdc_state:
87ad : __ __ __ BSS	25
--------------------------------------------------------------------
canvas:
87c6 : __ __ __ BSS	21
--------------------------------------------------------------------
screentotal:
87db : __ __ __ BSS	2
--------------------------------------------------------------------
undoaddress:
87dd : __ __ __ BSS	2
--------------------------------------------------------------------
undonumber:
87df : __ __ __ BSS	1
--------------------------------------------------------------------
undo_undopossible:
87e0 : __ __ __ BSS	1
--------------------------------------------------------------------
undo_redopossible:
87e1 : __ __ __ BSS	1
--------------------------------------------------------------------
overlaydata:
87e2 : __ __ __ BSS	18
--------------------------------------------------------------------
programmode:
87f4 : __ __ __ BSS	11
--------------------------------------------------------------------
showbar:
87ff : __ __ __ BSS	1
--------------------------------------------------------------------
multab:
8800 : __ __ __ BSS	144
--------------------------------------------------------------------
windows:
8890 : __ __ __ BSS	39
--------------------------------------------------------------------
overlay_active:
88b7 : __ __ __ BSS	1
--------------------------------------------------------------------
favourites:
88b8 : __ __ __ BSS	20
--------------------------------------------------------------------
palettechar:
88cc : __ __ __ BSS	1
--------------------------------------------------------------------
select_startx:
88cd : __ __ __ BSS	2
--------------------------------------------------------------------
select_starty:
88cf : __ __ __ BSS	2
--------------------------------------------------------------------
select_endx:
88d1 : __ __ __ BSS	2
--------------------------------------------------------------------
select_endy:
88d3 : __ __ __ BSS	2
--------------------------------------------------------------------
select_accept:
88d5 : __ __ __ BSS	2
--------------------------------------------------------------------
select_width:
88d7 : __ __ __ BSS	2
--------------------------------------------------------------------
select_height:
88d9 : __ __ __ BSS	2
--------------------------------------------------------------------
cwd:
88db : __ __ __ BSS	33
--------------------------------------------------------------------
previous:
88fc : __ __ __ BSS	2
--------------------------------------------------------------------
current:
88fe : __ __ __ BSS	2
--------------------------------------------------------------------
linebuffer:
8900 : __ __ __ BSS	81
--------------------------------------------------------------------
buffer:
8951 : __ __ __ BSS	81
--------------------------------------------------------------------
Undo:
89a2 : __ __ __ BSS	287
--------------------------------------------------------------------
DOSstatus:
8ac1 : __ __ __ BSS	40
--------------------------------------------------------------------
disk_id_buf:
8ae9 : __ __ __ BSS	5
--------------------------------------------------------------------
bad_type:
8aee : __ __ __ BSS	4
--------------------------------------------------------------------
HeapNode:
8af2 : __ __ __ BSS	4
--------------------------------------------------------------------
linebuffer2:
8b00 : __ __ __ BSS	81
--------------------------------------------------------------------
importvars:
8b51 : __ __ __ BSS	19
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1300 : a9 48 __ LDA #$48
01:1302 : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:1304 : ad 00 ff LDA $ff00 
01:1307 : 85 43 __ STA T0 + 0 
01:1309 : a9 0e __ LDA #$0e
01:130b : 8d 00 ff STA $ff00 
01:130e : 20 79 2d JSR $2d79 ; (vdc_mem_addr@proxy + 0)
01:1311 : a5 14 __ LDA P7 ; (size + 0)
01:1313 : 05 15 __ ORA P8 ; (size + 1)
01:1315 : d0 06 __ BNE $131d ; (bnk_redef_charset.l2 + 0)
.s3:
01:1317 : a5 43 __ LDA T0 + 0 
01:1319 : 8d 00 ff STA $ff00 
.s1001:
01:131c : 60 __ __ RTS
.l2:
01:131d : a2 08 __ LDX #$08
.l5:
01:131f : a5 11 __ LDA P4 ; (scr + 0)
01:1321 : 8d 00 ff STA $ff00 
01:1324 : a0 00 __ LDY #$00
01:1326 : b1 12 __ LDA (P5),y ; (sp + 0)
01:1328 : a8 __ __ TAY
01:1329 : e6 12 __ INC P5 ; (sp + 0)
01:132b : d0 02 __ BNE $132f ; (bnk_redef_charset.s1012 + 0)
.s1011:
01:132d : e6 13 __ INC P6 ; (sp + 1)
.s1012:
01:132f : a9 0e __ LDA #$0e
01:1331 : 8d 00 ff STA $ff00 
.l117:
01:1334 : 2c 00 d6 BIT $d600 
01:1337 : 10 fb __ BPL $1334 ; (bnk_redef_charset.l117 + 0)
.s10:
01:1339 : 8c 01 d6 STY $d601 
01:133c : ca __ __ DEX
01:133d : d0 e0 __ BNE $131f ; (bnk_redef_charset.l5 + 0)
.s7:
01:133f : a2 08 __ LDX #$08
.l12:
01:1341 : 2c 00 d6 BIT $d600 
01:1344 : 10 fb __ BPL $1341 ; (bnk_redef_charset.l12 + 0)
.s17:
01:1346 : a9 00 __ LDA #$00
01:1348 : 8d 01 d6 STA $d601 
01:134b : ca __ __ DEX
01:134c : d0 f3 __ BNE $1341 ; (bnk_redef_charset.l12 + 0)
.s14:
01:134e : a5 14 __ LDA P7 ; (size + 0)
01:1350 : d0 02 __ BNE $1354 ; (bnk_redef_charset.s1007 + 0)
.s1006:
01:1352 : c6 15 __ DEC P8 ; (size + 1)
.s1007:
01:1354 : c6 14 __ DEC P7 ; (size + 0)
01:1356 : d0 c5 __ BNE $131d ; (bnk_redef_charset.l2 + 0)
.s1008:
01:1358 : a5 15 __ LDA P8 ; (size + 1)
01:135a : d0 c1 __ BNE $131d ; (bnk_redef_charset.l2 + 0)
01:135c : 4c 17 13 JMP $1317 ; (bnk_redef_charset.s3 + 0)
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:135f : ad ac 87 LDA $87ac ; (targetdevice + 0)
01:1362 : 85 0f __ STA P2 
01:1364 : a9 97 __ LDA #$97
01:1366 : 85 13 __ STA P6 
01:1368 : a9 87 __ LDA #$87
01:136a : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:136c : a5 10 __ LDA P3 ; (bank + 0)
01:136e : 85 0d __ STA P0 
01:1370 : 20 b2 2a JSR $2ab2 ; (krnio_setbnk@proxy + 0)
01:1373 : a5 13 __ LDA P6 ; (fname + 0)
01:1375 : 85 0d __ STA P0 
01:1377 : a5 14 __ LDA P7 ; (fname + 1)
01:1379 : 85 0e __ STA P1 
01:137b : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
01:137e : a9 01 __ LDA #$01
01:1380 : a6 0f __ LDX P2 
01:1382 : a0 00 __ LDY #$00
01:1384 : 20 ba ff JSR $ffba 
01:1387 : a9 00 __ LDA #$00
01:1389 : a6 11 __ LDX P4 
01:138b : a4 12 __ LDY P5 
01:138d : 20 d5 ff JSR $ffd5 
01:1390 : a9 00 __ LDA #$00
01:1392 : b0 02 __ BCS $1396 ; (bnk_load.s0 + 42)
01:1394 : a9 01 __ LDA #$01
01:1396 : 85 1b __ STA ACCU + 0 
01:1398 : a9 00 __ LDA #$00
01:139a : 85 0d __ STA P0 
01:139c : 85 0e __ STA P1 
01:139e : 4c b6 2a JMP $2ab6 ; (krnio_setbnk.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:13a1 : a9 0e __ LDA #$0e
01:13a3 : 85 11 __ STA P4 
01:13a5 : a9 00 __ LDA #$00
01:13a7 : 85 12 __ STA P5 
01:13a9 : a9 89 __ LDA #$89
01:13ab : 85 13 __ STA P6 
01:13ad : a5 47 __ LDA $47 
01:13af : 85 14 __ STA P7 
01:13b1 : a9 00 __ LDA #$00
01:13b3 : 85 15 __ STA P8 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:13b5 : ad 00 ff LDA $ff00 
01:13b8 : 85 43 __ STA T0 + 0 
01:13ba : a9 0e __ LDA #$0e
01:13bc : 8d 00 ff STA $ff00 
01:13bf : 20 79 2d JSR $2d79 ; (vdc_mem_addr@proxy + 0)
01:13c2 : a5 14 __ LDA P7 ; (size + 0)
01:13c4 : 05 15 __ ORA P8 ; (size + 1)
01:13c6 : d0 06 __ BNE $13ce ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:13c8 : a5 43 __ LDA T0 + 0 
01:13ca : 8d 00 ff STA $ff00 
.s1001:
01:13cd : 60 __ __ RTS
.s1008:
01:13ce : a6 14 __ LDX P7 ; (size + 0)
.l2:
01:13d0 : a5 11 __ LDA P4 ; (scr + 0)
01:13d2 : 8d 00 ff STA $ff00 
01:13d5 : a0 00 __ LDY #$00
01:13d7 : b1 12 __ LDA (P5),y ; (sp + 0)
01:13d9 : a8 __ __ TAY
01:13da : e6 12 __ INC P5 ; (sp + 0)
01:13dc : d0 02 __ BNE $13e0 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:13de : e6 13 __ INC P6 ; (sp + 1)
.s1010:
01:13e0 : a9 0e __ LDA #$0e
01:13e2 : 8d 00 ff STA $ff00 
.l52:
01:13e5 : 2c 00 d6 BIT $d600 
01:13e8 : 10 fb __ BPL $13e5 ; (bnk_cpytovdc.l52 + 0)
.s6:
01:13ea : 8c 01 d6 STY $d601 
01:13ed : 8a __ __ TXA
01:13ee : d0 02 __ BNE $13f2 ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:13f0 : c6 15 __ DEC P8 ; (size + 1)
.s1005:
01:13f2 : ca __ __ DEX
01:13f3 : d0 db __ BNE $13d0 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:13f5 : a5 15 __ LDA P8 ; (size + 1)
01:13f7 : d0 d7 __ BNE $13d0 ; (bnk_cpytovdc.l2 + 0)
01:13f9 : 4c c8 13 JMP $13c8 ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:13fc : a9 0e __ LDA #$0e
01:13fe : 85 0d __ STA P0 
01:1400 : a9 00 __ LDA #$00
01:1402 : 85 0e __ STA P1 
01:1404 : a9 89 __ LDA #$89
01:1406 : 85 0f __ STA P2 
01:1408 : a5 47 __ LDA $47 
01:140a : 85 12 __ STA P5 
01:140c : a9 00 __ LDA #$00
01:140e : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:1410 : ad 00 ff LDA $ff00 
01:1413 : 85 1d __ STA ACCU + 2 
01:1415 : a6 12 __ LDX P5 ; (size + 0)
.l110:
01:1417 : 8a __ __ TXA
01:1418 : 05 13 __ ORA P6 ; (size + 1)
01:141a : d0 06 __ BNE $1422 ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:141c : a5 1d __ LDA ACCU + 2 
01:141e : 8d 00 ff STA $ff00 
.s1001:
01:1421 : 60 __ __ RTS
.s2:
01:1422 : a9 0e __ LDA #$0e
01:1424 : 8d 00 ff STA $ff00 
01:1427 : a5 10 __ LDA P3 ; (vdcsrc + 0)
01:1429 : a8 __ __ TAY
01:142a : 18 __ __ CLC
01:142b : 69 01 __ ADC #$01
01:142d : 85 10 __ STA P3 ; (vdcsrc + 0)
01:142f : a5 11 __ LDA P4 ; (vdcsrc + 1)
01:1431 : 85 1b __ STA ACCU + 0 
01:1433 : 69 00 __ ADC #$00
01:1435 : 85 11 __ STA P4 ; (vdcsrc + 1)
01:1437 : a9 12 __ LDA #$12
01:1439 : 8d 00 d6 STA $d600 
.l111:
01:143c : 2c 00 d6 BIT $d600 
01:143f : 10 fb __ BPL $143c ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:1441 : a5 1b __ LDA ACCU + 0 
01:1443 : 8d 01 d6 STA $d601 
01:1446 : a9 13 __ LDA #$13
01:1448 : 8d 00 d6 STA $d600 
.l113:
01:144b : 2c 00 d6 BIT $d600 
01:144e : 10 fb __ BPL $144b ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:1450 : 8c 01 d6 STY $d601 
01:1453 : a9 1f __ LDA #$1f
01:1455 : 8d 00 d6 STA $d600 
.l115:
01:1458 : 2c 00 d6 BIT $d600 
01:145b : 10 fb __ BPL $1458 ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:145d : a5 0d __ LDA P0 ; (dcr + 0)
01:145f : ac 01 d6 LDY $d601 
01:1462 : 8d 00 ff STA $ff00 
01:1465 : a5 0e __ LDA P1 ; (dp + 0)
01:1467 : 85 1b __ STA ACCU + 0 
01:1469 : 18 __ __ CLC
01:146a : 69 01 __ ADC #$01
01:146c : 85 0e __ STA P1 ; (dp + 0)
01:146e : a5 0f __ LDA P2 ; (dp + 1)
01:1470 : 85 1c __ STA ACCU + 1 
01:1472 : 69 00 __ ADC #$00
01:1474 : 85 0f __ STA P2 ; (dp + 1)
01:1476 : 98 __ __ TYA
01:1477 : a0 00 __ LDY #$00
01:1479 : 91 1b __ STA (ACCU + 0),y 
01:147b : a9 0e __ LDA #$0e
01:147d : 8d 00 ff STA $ff00 
01:1480 : ca __ __ DEX
01:1481 : e0 ff __ CPX #$ff
01:1483 : d0 92 __ BNE $1417 ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:1485 : c6 13 __ DEC P6 ; (size + 1)
01:1487 : 4c 17 14 JMP $1417 ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_memcpy@proxy: ; bnk_memcpy@proxy
01:148a : a9 48 __ LDA #$48
01:148c : 85 0f __ STA P2 
01:148e : a9 d0 __ LDA #$d0
01:1490 : 85 12 __ STA P5 
01:1492 : a9 10 __ LDA #$10
01:1494 : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_memcpy: ; bnk_memcpy(u8,u8*,u8,u8*,u16)->void
.s0:
01:1496 : ad 00 ff LDA $ff00 
01:1499 : 85 1b __ STA ACCU + 0 
01:149b : a5 13 __ LDA P6 ; (size + 0)
01:149d : 05 14 __ ORA P7 ; (size + 1)
01:149f : f0 31 __ BEQ $14d2 ; (bnk_memcpy.s3 + 0)
.s4:
01:14a1 : a0 00 __ LDY #$00
01:14a3 : a5 13 __ LDA P6 ; (size + 0)
01:14a5 : f0 02 __ BEQ $14a9 ; (bnk_memcpy.l1002 + 0)
.s1005:
01:14a7 : e6 14 __ INC P7 ; (size + 1)
.l1002:
01:14a9 : a6 13 __ LDX P6 ; (size + 0)
.l1006:
01:14ab : a5 10 __ LDA P3 ; (scr + 0)
01:14ad : 8d 00 ff STA $ff00 
01:14b0 : b1 11 __ LDA (P4),y ; (sp + 0)
01:14b2 : 85 1c __ STA ACCU + 1 
01:14b4 : a5 0d __ LDA P0 ; (dcr + 0)
01:14b6 : 8d 00 ff STA $ff00 
01:14b9 : a5 1c __ LDA ACCU + 1 
01:14bb : 91 0e __ STA (P1),y ; (dp + 0)
01:14bd : e6 11 __ INC P4 ; (sp + 0)
01:14bf : d0 02 __ BNE $14c3 ; (bnk_memcpy.s1009 + 0)
.s1008:
01:14c1 : e6 12 __ INC P5 ; (sp + 1)
.s1009:
01:14c3 : e6 0e __ INC P1 ; (dp + 0)
01:14c5 : d0 02 __ BNE $14c9 ; (bnk_memcpy.s1011 + 0)
.s1010:
01:14c7 : e6 0f __ INC P2 ; (dp + 1)
.s1011:
01:14c9 : ca __ __ DEX
01:14ca : d0 df __ BNE $14ab ; (bnk_memcpy.l1006 + 0)
.s1007:
01:14cc : 86 13 __ STX P6 ; (size + 0)
01:14ce : c6 14 __ DEC P7 ; (size + 1)
01:14d0 : d0 d7 __ BNE $14a9 ; (bnk_memcpy.l1002 + 0)
.s3:
01:14d2 : a5 1b __ LDA ACCU + 0 
01:14d4 : 8d 00 ff STA $ff00 
.s1001:
01:14d7 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_memset@proxy: ; bnk_memset@proxy
01:14d8 : ad 55 8b LDA $8b55 ; (importvars + 4)
01:14db : 85 10 __ STA P3 
01:14dd : ad 56 8b LDA $8b56 ; (importvars + 5)
01:14e0 : 85 11 __ STA P4 
--------------------------------------------------------------------
bnk_memset: ; bnk_memset(u8,u8*,u8,u16)->void
.s0:
01:14e2 : ad 00 ff LDA $ff00 
01:14e5 : 85 1b __ STA ACCU + 0 
01:14e7 : a9 7f __ LDA #$7f
01:14e9 : 8d 00 ff STA $ff00 
01:14ec : a5 11 __ LDA P4 ; (size + 1)
01:14ee : 05 10 __ ORA P3 ; (size + 0)
01:14f0 : f0 1c __ BEQ $150e ; (bnk_memset.s3 + 0)
.s4:
01:14f2 : a0 00 __ LDY #$00
01:14f4 : a5 10 __ LDA P3 ; (size + 0)
01:14f6 : f0 02 __ BEQ $14fa ; (bnk_memset.l1002 + 0)
.s1005:
01:14f8 : e6 11 __ INC P4 ; (size + 1)
.l1002:
01:14fa : a6 10 __ LDX P3 ; (size + 0)
.l1006:
01:14fc : a5 0f __ LDA P2 ; (val + 0)
01:14fe : 91 0d __ STA (P0),y ; (p + 0)
01:1500 : c8 __ __ INY
01:1501 : d0 02 __ BNE $1505 ; (bnk_memset.s1009 + 0)
.s1008:
01:1503 : e6 0e __ INC P1 ; (p + 1)
.s1009:
01:1505 : ca __ __ DEX
01:1506 : d0 f4 __ BNE $14fc ; (bnk_memset.l1006 + 0)
.s1007:
01:1508 : 86 10 __ STX P3 ; (size + 0)
01:150a : c6 11 __ DEC P4 ; (size + 1)
01:150c : d0 ec __ BNE $14fa ; (bnk_memset.l1002 + 0)
.s3:
01:150e : a5 1b __ LDA ACCU + 0 
01:1510 : 8d 00 ff STA $ff00 
.s1001:
01:1513 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,u8*,u8)->void
.s0:
01:1514 : a9 7f __ LDA #$7f
01:1516 : ae 00 ff LDX $ff00 
01:1519 : 8d 00 ff STA $ff00 
01:151c : a5 0f __ LDA P2 ; (b + 0)
01:151e : a0 00 __ LDY #$00
01:1520 : 91 0d __ STA (P0),y ; (p + 0)
01:1522 : 8e 00 ff STX $ff00 
.s1001:
01:1525 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,u8*)->u8
.s0:
01:1526 : a5 0d __ LDA P0 ; (cr + 0)
01:1528 : ae 00 ff LDX $ff00 
01:152b : 8d 00 ff STA $ff00 
01:152e : a0 00 __ LDY #$00
01:1530 : b1 0e __ LDA (P1),y ; (p + 0)
01:1532 : 8e 00 ff STX $ff00 
.s1001:
01:1535 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_iec_active: ; bnk_iec_active(u8)->bool
.s1000:
01:1536 : 85 0d __ STA P0 
.s0:
01:1538 : a5 0d __ LDA P0 
01:153a : a0 00 __ LDY #$00
01:153c : 84 90 __ STY $90 
01:153e : 20 b1 ff JSR $ffb1 
01:1541 : a9 ff __ LDA #$ff
01:1543 : 20 93 ff JSR $ff93 
01:1546 : a5 90 __ LDA $90 
01:1548 : 10 08 __ BPL $1552 ; (bnk_iec_active.s0 + 26)
01:154a : 20 ae ff JSR $ffae 
01:154d : a9 00 __ LDA #$00
01:154f : 85 1b __ STA ACCU + 0 
01:1551 : 60 __ __ RTS
01:1552 : 20 ae ff JSR $ffae 
01:1555 : a9 01 __ LDA #$01
01:1557 : 85 1b __ STA ACCU + 0 
.s1001:
01:1559 : a5 1b __ LDA ACCU + 0 
01:155b : 60 __ __ RTS
--------------------------------------------------------------------
bnk_save: ; bnk_save(u8,u8,const u8*,const u8*,const u8*)->bool
.s0:
01:155c : a5 13 __ LDA P6 ; (bank + 0)
01:155e : 85 0d __ STA P0 
01:1560 : 20 b2 2a JSR $2ab2 ; (krnio_setbnk@proxy + 0)
01:1563 : ad f3 ab LDA $abf3 ; (sstack + 0)
01:1566 : 85 0d __ STA P0 
01:1568 : ad f4 ab LDA $abf4 ; (sstack + 1)
01:156b : 85 0e __ STA P1 
01:156d : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
01:1570 : a5 12 __ LDA P5 ; (device + 0)
01:1572 : 85 0d __ STA P0 
01:1574 : a5 14 __ LDA P7 ; (start + 0)
01:1576 : 85 0e __ STA P1 
01:1578 : a5 15 __ LDA P8 ; (start + 1)
01:157a : 85 0f __ STA P2 
01:157c : a5 16 __ LDA P9 ; (end + 0)
01:157e : 85 10 __ STA P3 
01:1580 : a5 17 __ LDA P10 ; (end + 1)
01:1582 : 85 11 __ STA P4 
01:1584 : 20 c0 64 JSR $64c0 ; (krnio_save.s0 + 0)
01:1587 : 85 43 __ STA T0 + 0 
01:1589 : a9 00 __ LDA #$00
01:158b : 85 0d __ STA P0 
01:158d : 85 0e __ STA P1 
01:158f : 20 b6 2a JSR $2ab6 ; (krnio_setbnk.s0 + 0)
01:1592 : a5 43 __ LDA T0 + 0 
01:1594 : 85 1b __ STA ACCU + 0 
.s1001:
01:1596 : 60 __ __ RTS
--------------------------------------------------------------------
freeDir: ; freeDir()->void
.s0:
01:1597 : ad db 88 LDA $88db ; (cwd + 0)
01:159a : f0 41 __ BEQ $15dd ; (freeDir.s1001 + 0)
.s3:
01:159c : ad f2 88 LDA $88f2 ; (cwd + 23)
01:159f : 85 43 __ STA T1 + 0 
01:15a1 : 8d fe 88 STA $88fe ; (current + 0)
01:15a4 : ad f3 88 LDA $88f3 ; (cwd + 24)
01:15a7 : 85 44 __ STA T1 + 1 
01:15a9 : 8d ff 88 STA $88ff ; (current + 1)
01:15ac : 05 43 __ ORA T1 + 0 
01:15ae : f0 28 __ BEQ $15d8 ; (freeDir.s7 + 0)
.l6:
01:15b0 : a5 43 __ LDA T1 + 0 
01:15b2 : 85 1b __ STA ACCU + 0 
01:15b4 : a5 44 __ LDA T1 + 1 
01:15b6 : 85 1c __ STA ACCU + 1 
01:15b8 : a0 15 __ LDY #$15
01:15ba : b1 43 __ LDA (T1 + 0),y 
01:15bc : 85 02 __ STA $02 
01:15be : c8 __ __ INY
01:15bf : b1 43 __ LDA (T1 + 0),y 
01:15c1 : 85 44 __ STA T1 + 1 
01:15c3 : 20 61 7f JSR $7f61 ; (free + 0)
01:15c6 : a5 02 __ LDA $02 
01:15c8 : 85 43 __ STA T1 + 0 
01:15ca : 05 44 __ ORA T1 + 1 
01:15cc : d0 e2 __ BNE $15b0 ; (freeDir.l6 + 0)
.s9:
01:15ce : a5 02 __ LDA $02 
01:15d0 : 8d fe 88 STA $88fe ; (current + 0)
01:15d3 : a5 44 __ LDA T1 + 1 
01:15d5 : 8d ff 88 STA $88ff ; (current + 1)
.s7:
01:15d8 : a9 00 __ LDA #$00
01:15da : 8d db 88 STA $88db ; (cwd + 0)
.s1001:
01:15dd : 60 __ __ RTS
--------------------------------------------------------------------
dir_open: ; dir_open(u8,u8)->u8
.s0:
01:15de : a9 00 __ LDA #$00
01:15e0 : 85 0d __ STA P0 
01:15e2 : 85 0e __ STA P1 
01:15e4 : 20 b6 2a JSR $2ab6 ; (krnio_setbnk.s0 + 0)
01:15e7 : a9 4a __ LDA #$4a
01:15e9 : 85 0d __ STA P0 
01:15eb : a9 16 __ LDA #$16
01:15ed : 85 0e __ STA P1 
01:15ef : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
01:15f2 : a9 02 __ LDA #$02
01:15f4 : 85 0d __ STA P0 
01:15f6 : a9 00 __ LDA #$00
01:15f8 : 85 0f __ STA P2 
01:15fa : a5 10 __ LDA P3 ; (device + 0)
01:15fc : 85 0e __ STA P1 
01:15fe : 20 5d 63 JSR $635d ; (krnio_open.s0 + 0)
01:1601 : 85 43 __ STA T1 + 0 
01:1603 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
01:1606 : 85 44 __ STA T2 + 0 
01:1608 : 85 1b __ STA ACCU + 0 
01:160a : a5 43 __ LDA T1 + 0 
01:160c : f0 3b __ BEQ $1649 ; (dir_open.s1001 + 0)
.s4:
01:160e : a5 44 __ LDA T2 + 0 
01:1610 : f0 03 __ BEQ $1615 ; (dir_open.s3 + 0)
.s1:
01:1612 : 20 4c 16 JSR $164c ; (dir_close@proxy + 0)
.s3:
01:1615 : a5 43 __ LDA T1 + 0 
01:1617 : f0 2c __ BEQ $1645 ; (dir_open.s1002 + 0)
.s8:
01:1619 : a5 44 __ LDA T2 + 0 
01:161b : d0 28 __ BNE $1645 ; (dir_open.s1002 + 0)
.s5:
01:161d : a9 02 __ LDA #$02
01:161f : 20 ff 63 JSR $63ff ; (krnio_chkin.s1000 + 0)
01:1622 : 85 43 __ STA T1 + 0 
01:1624 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
01:1627 : 85 44 __ STA T2 + 0 
01:1629 : a5 43 __ LDA T1 + 0 
01:162b : f0 15 __ BEQ $1642 ; (dir_open.s10 + 0)
.s12:
01:162d : a5 44 __ LDA T2 + 0 
01:162f : d0 11 __ BNE $1642 ; (dir_open.s10 + 0)
.s9:
01:1631 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:1634 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:1637 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
01:163a : 85 44 __ STA T2 + 0 
01:163c : 85 1b __ STA ACCU + 0 
01:163e : 09 00 __ ORA #$00
01:1640 : f0 07 __ BEQ $1649 ; (dir_open.s1001 + 0)
.s10:
01:1642 : 20 4c 16 JSR $164c ; (dir_close@proxy + 0)
.s1002:
01:1645 : a5 44 __ LDA T2 + 0 
01:1647 : 85 1b __ STA ACCU + 0 
.s1001:
01:1649 : 60 __ __ RTS
--------------------------------------------------------------------
01:164a : __ __ __ BYT 24 00                                           : $.
--------------------------------------------------------------------
dir_close@proxy: ; dir_close@proxy
01:164c : a9 02 __ LDA #$02
01:164e : 85 0e __ STA P1 
--------------------------------------------------------------------
dir_close: ; dir_close(u8)->void
.s0:
01:1650 : 20 1d 64 JSR $641d ; (krnio_clrchn.s0 + 0)
01:1653 : a5 0e __ LDA P1 ; (lfn + 0)
01:1655 : 4c c3 ff JMP $ffc3 
--------------------------------------------------------------------
dir_readentry: ; dir_readentry(const u8,struct DirEntry*)->u8
.s0:
01:1658 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:165b : a5 1b __ LDA ACCU + 0 
01:165d : d0 04 __ BNE $1663 ; (dir_readentry.s3 + 0)
.s1:
01:165f : a9 01 __ LDA #$01
01:1661 : d0 59 __ BNE $16bc ; (dir_readentry.s1095 + 0)
.s3:
01:1663 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
01:1666 : 09 00 __ ORA #$00
01:1668 : f0 03 __ BEQ $166d ; (dir_readentry.s7 + 0)
01:166a : 4c 91 18 JMP $1891 ; (dir_readentry.s5 + 0)
.s7:
01:166d : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:1670 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:1673 : a5 1b __ LDA ACCU + 0 
01:1675 : 85 43 __ STA T0 + 0 
01:1677 : a0 11 __ LDY #$11
01:1679 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:167b : a5 1c __ LDA ACCU + 1 
01:167d : 85 44 __ STA T0 + 1 
01:167f : c8 __ __ INY
01:1680 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1682 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:1685 : a5 1b __ LDA ACCU + 0 
01:1687 : 05 44 __ ORA T0 + 1 
01:1689 : a0 12 __ LDY #$12
01:168b : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:168d : a5 43 __ LDA T0 + 0 
01:168f : 88 __ __ DEY
01:1690 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1692 : a9 00 __ LDA #$00
01:1694 : a2 51 __ LDX #$51
.l1002:
01:1696 : ca __ __ DEX
01:1697 : 9d 00 89 STA $8900,x ; (linebuffer + 0)
01:169a : d0 fa __ BNE $1696 ; (dir_readentry.l1002 + 0)
.s1003:
01:169c : 85 45 __ STA T1 + 0 
.l10:
01:169e : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:16a1 : a5 1b __ LDA ACCU + 0 
01:16a3 : f0 1a __ BEQ $16bf ; (dir_readentry.s11 + 0)
.s14:
01:16a5 : a6 45 __ LDX T1 + 0 
01:16a7 : e0 51 __ CPX #$51
01:16a9 : b0 05 __ BCS $16b0 ; (dir_readentry.s281 + 0)
.s16:
01:16ab : 9d 00 89 STA $8900,x ; (linebuffer + 0)
01:16ae : e6 45 __ INC T1 + 0 
.s281:
01:16b0 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
01:16b3 : 09 00 __ ORA #$00
01:16b5 : f0 e7 __ BEQ $169e ; (dir_readentry.l10 + 0)
.s19:
01:16b7 : 20 1d 64 JSR $641d ; (krnio_clrchn.s0 + 0)
01:16ba : a9 02 __ LDA #$02
.s1095:
01:16bc : 85 1b __ STA ACCU + 0 
.s1001:
01:16be : 60 __ __ RTS
.s11:
01:16bf : ad 00 89 LDA $8900 ; (linebuffer + 0)
01:16c2 : c9 42 __ CMP #$42
01:16c4 : d0 07 __ BNE $16cd ; (dir_readentry.s25 + 0)
.s23:
01:16c6 : a9 64 __ LDA #$64
01:16c8 : a0 13 __ LDY #$13
01:16ca : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:16cc : 60 __ __ RTS
.s25:
01:16cd : a6 45 __ LDX T1 + 0 
01:16cf : e0 05 __ CPX #$05
01:16d1 : b0 04 __ BCS $16d7 ; (dir_readentry.l1098 + 0)
.s27:
01:16d3 : a9 03 __ LDA #$03
01:16d5 : 90 e5 __ BCC $16bc ; (dir_readentry.s1095 + 0)
.l1098:
01:16d7 : bd 00 89 LDA $8900,x ; (linebuffer + 0)
01:16da : f0 0b __ BEQ $16e7 ; (dir_readentry.s35 + 0)
.s39:
01:16dc : c9 20 __ CMP #$20
01:16de : f0 07 __ BEQ $16e7 ; (dir_readentry.s35 + 0)
.s38:
01:16e0 : c9 a0 __ CMP #$a0
01:16e2 : f0 03 __ BEQ $16e7 ; (dir_readentry.s35 + 0)
01:16e4 : 4c 8b 18 JMP $188b ; (dir_readentry.s37 + 0)
.s35:
01:16e7 : a9 00 __ LDA #$00
01:16e9 : 9d 00 89 STA $8900,x ; (linebuffer + 0)
01:16ec : ca __ __ DEX
01:16ed : d0 e8 __ BNE $16d7 ; (dir_readentry.l1098 + 0)
.s1097:
01:16ef : 85 45 __ STA T1 + 0 
.s127:
01:16f1 : a2 00 __ LDX #$00
.l46:
01:16f3 : bd 00 89 LDA $8900,x ; (linebuffer + 0)
01:16f6 : c9 22 __ CMP #$22
01:16f8 : f0 05 __ BEQ $16ff ; (dir_readentry.s1100 + 0)
.s44:
01:16fa : e8 __ __ INX
01:16fb : e0 51 __ CPX #$51
01:16fd : 90 f4 __ BCC $16f3 ; (dir_readentry.l46 + 0)
.s1100:
01:16ff : e8 __ __ INX
01:1700 : 86 1b __ STX ACCU + 0 
01:1702 : e0 51 __ CPX #$51
01:1704 : b0 17 __ BCS $171d ; (dir_readentry.s50 + 0)
.s126:
01:1706 : a0 00 __ LDY #$00
.l52:
01:1708 : bd 00 89 LDA $8900,x ; (linebuffer + 0)
01:170b : c9 22 __ CMP #$22
01:170d : f0 0c __ BEQ $171b ; (dir_readentry.s1103 + 0)
.s51:
01:170f : c0 10 __ CPY #$10
01:1711 : b0 08 __ BCS $171b ; (dir_readentry.s1103 + 0)
.s48:
01:1713 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1715 : e8 __ __ INX
01:1716 : e0 51 __ CPX #$51
01:1718 : c8 __ __ INY
01:1719 : 90 ed __ BCC $1708 ; (dir_readentry.l52 + 0)
.s1103:
01:171b : 86 1b __ STX ACCU + 0 
.s50:
01:171d : a6 45 __ LDX T1 + 0 
01:171f : 86 43 __ STX T0 + 0 
01:1721 : bd fd 88 LDA $88fd,x ; (previous + 1)
01:1724 : 85 45 __ STA T1 + 0 
01:1726 : c9 50 __ CMP #$50
01:1728 : d0 13 __ BNE $173d ; (dir_readentry.s54 + 0)
.s57:
01:172a : bd fe 88 LDA $88fe,x ; (current + 0)
01:172d : c9 52 __ CMP #$52
01:172f : d0 0c __ BNE $173d ; (dir_readentry.s54 + 0)
.s56:
01:1731 : bd ff 88 LDA $88ff,x ; (current + 1)
01:1734 : c9 47 __ CMP #$47
01:1736 : d0 05 __ BNE $173d ; (dir_readentry.s54 + 0)
.s53:
01:1738 : a9 11 __ LDA #$11
01:173a : 4c 72 18 JMP $1872 ; (dir_readentry.s55 + 0)
.s54:
01:173d : a5 45 __ LDA T1 + 0 
01:173f : c9 53 __ CMP #$53
01:1741 : d0 15 __ BNE $1758 ; (dir_readentry.s59 + 0)
.s62:
01:1743 : a6 43 __ LDX T0 + 0 
01:1745 : bd fe 88 LDA $88fe,x ; (current + 0)
01:1748 : c9 45 __ CMP #$45
01:174a : d0 0c __ BNE $1758 ; (dir_readentry.s59 + 0)
.s61:
01:174c : bd ff 88 LDA $88ff,x ; (current + 1)
01:174f : c9 51 __ CMP #$51
01:1751 : d0 05 __ BNE $1758 ; (dir_readentry.s59 + 0)
.s58:
01:1753 : a9 10 __ LDA #$10
01:1755 : 4c 72 18 JMP $1872 ; (dir_readentry.s55 + 0)
.s59:
01:1758 : a5 45 __ LDA T1 + 0 
01:175a : c9 55 __ CMP #$55
01:175c : d0 15 __ BNE $1773 ; (dir_readentry.s64 + 0)
.s67:
01:175e : a6 43 __ LDX T0 + 0 
01:1760 : bd fe 88 LDA $88fe,x ; (current + 0)
01:1763 : c9 53 __ CMP #$53
01:1765 : d0 0c __ BNE $1773 ; (dir_readentry.s64 + 0)
.s66:
01:1767 : bd ff 88 LDA $88ff,x ; (current + 1)
01:176a : c9 52 __ CMP #$52
01:176c : d0 05 __ BNE $1773 ; (dir_readentry.s64 + 0)
.s63:
01:176e : a9 12 __ LDA #$12
01:1770 : 4c 72 18 JMP $1872 ; (dir_readentry.s55 + 0)
.s64:
01:1773 : a5 45 __ LDA T1 + 0 
01:1775 : c9 44 __ CMP #$44
01:1777 : f0 04 __ BEQ $177d ; (dir_readentry.s1006 + 0)
.s1007:
01:1779 : a2 00 __ LDX #$00
01:177b : f0 17 __ BEQ $1794 ; (dir_readentry.s69 + 0)
.s1006:
01:177d : a4 43 __ LDY T0 + 0 
01:177f : b9 fe 88 LDA $88fe,y ; (current + 0)
01:1782 : a2 01 __ LDX #$01
01:1784 : c9 45 __ CMP #$45
01:1786 : d0 0c __ BNE $1794 ; (dir_readentry.s69 + 0)
.s71:
01:1788 : b9 ff 88 LDA $88ff,y ; (current + 1)
01:178b : c9 4c __ CMP #$4c
01:178d : d0 05 __ BNE $1794 ; (dir_readentry.s69 + 0)
.s68:
01:178f : a9 00 __ LDA #$00
01:1791 : 4c 72 18 JMP $1872 ; (dir_readentry.s55 + 0)
.s69:
01:1794 : a5 45 __ LDA T1 + 0 
01:1796 : c9 52 __ CMP #$52
01:1798 : d0 15 __ BNE $17af ; (dir_readentry.s74 + 0)
.s77:
01:179a : a4 43 __ LDY T0 + 0 
01:179c : b9 fe 88 LDA $88fe,y ; (current + 0)
01:179f : c9 45 __ CMP #$45
01:17a1 : d0 0c __ BNE $17af ; (dir_readentry.s74 + 0)
.s76:
01:17a3 : b9 ff 88 LDA $88ff,y ; (current + 1)
01:17a6 : c9 4c __ CMP #$4c
01:17a8 : d0 05 __ BNE $17af ; (dir_readentry.s74 + 0)
.s73:
01:17aa : a9 13 __ LDA #$13
01:17ac : 4c 72 18 JMP $1872 ; (dir_readentry.s55 + 0)
.s74:
01:17af : a5 45 __ LDA T1 + 0 
01:17b1 : c9 43 __ CMP #$43
01:17b3 : d0 15 __ BNE $17ca ; (dir_readentry.s79 + 0)
.s82:
01:17b5 : a4 43 __ LDY T0 + 0 
01:17b7 : b9 fe 88 LDA $88fe,y ; (current + 0)
01:17ba : c9 42 __ CMP #$42
01:17bc : d0 0c __ BNE $17ca ; (dir_readentry.s79 + 0)
.s81:
01:17be : b9 ff 88 LDA $88ff,y ; (current + 1)
01:17c1 : c9 4d __ CMP #$4d
01:17c3 : d0 05 __ BNE $17ca ; (dir_readentry.s79 + 0)
.s78:
01:17c5 : a9 01 __ LDA #$01
01:17c7 : 4c 72 18 JMP $1872 ; (dir_readentry.s55 + 0)
.s79:
01:17ca : 8a __ __ TXA
01:17cb : f0 15 __ BEQ $17e2 ; (dir_readentry.s84 + 0)
.s87:
01:17cd : a6 43 __ LDX T0 + 0 
01:17cf : bd fe 88 LDA $88fe,x ; (current + 0)
01:17d2 : c9 49 __ CMP #$49
01:17d4 : d0 0c __ BNE $17e2 ; (dir_readentry.s84 + 0)
.s86:
01:17d6 : bd ff 88 LDA $88ff,x ; (current + 1)
01:17d9 : c9 52 __ CMP #$52
01:17db : d0 05 __ BNE $17e2 ; (dir_readentry.s84 + 0)
.s83:
01:17dd : a9 02 __ LDA #$02
01:17df : 4c 72 18 JMP $1872 ; (dir_readentry.s55 + 0)
.s84:
01:17e2 : a5 45 __ LDA T1 + 0 
01:17e4 : c9 56 __ CMP #$56
01:17e6 : d0 14 __ BNE $17fc ; (dir_readentry.s89 + 0)
.s92:
01:17e8 : a6 43 __ LDX T0 + 0 
01:17ea : bd fe 88 LDA $88fe,x ; (current + 0)
01:17ed : c9 52 __ CMP #$52
01:17ef : d0 0b __ BNE $17fc ; (dir_readentry.s89 + 0)
.s91:
01:17f1 : bd ff 88 LDA $88ff,x ; (current + 1)
01:17f4 : c9 50 __ CMP #$50
01:17f6 : d0 04 __ BNE $17fc ; (dir_readentry.s89 + 0)
.s88:
01:17f8 : a9 14 __ LDA #$14
01:17fa : d0 76 __ BNE $1872 ; (dir_readentry.s55 + 0)
.s89:
01:17fc : a5 45 __ LDA T1 + 0 
01:17fe : c9 4c __ CMP #$4c
01:1800 : d0 14 __ BNE $1816 ; (dir_readentry.s94 + 0)
.s97:
01:1802 : a6 43 __ LDX T0 + 0 
01:1804 : bd fe 88 LDA $88fe,x ; (current + 0)
01:1807 : c9 4e __ CMP #$4e
01:1809 : d0 0b __ BNE $1816 ; (dir_readentry.s94 + 0)
.s96:
01:180b : bd ff 88 LDA $88ff,x ; (current + 1)
01:180e : c9 4b __ CMP #$4b
01:1810 : d0 04 __ BNE $1816 ; (dir_readentry.s94 + 0)
.s93:
01:1812 : a9 03 __ LDA #$03
01:1814 : d0 5c __ BNE $1872 ; (dir_readentry.s55 + 0)
.s94:
01:1816 : a9 05 __ LDA #$05
01:1818 : a0 13 __ LDY #$13
01:181a : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:181c : a6 1b __ LDX ACCU + 0 
01:181e : bd 00 89 LDA $8900,x ; (linebuffer + 0)
01:1821 : c9 22 __ CMP #$22
01:1823 : d0 02 __ BNE $1827 ; (dir_readentry.s100 + 0)
.s98:
01:1825 : e6 1b __ INC ACCU + 0 
.s100:
01:1827 : a9 00 __ LDA #$00
01:1829 : 85 45 __ STA T1 + 0 
01:182b : a6 1b __ LDX ACCU + 0 
01:182d : bd 00 89 LDA $8900,x ; (linebuffer + 0)
01:1830 : c9 20 __ CMP #$20
01:1832 : d0 02 __ BNE $1836 ; (dir_readentry.l105 + 0)
.s101:
01:1834 : e6 1b __ INC ACCU + 0 
.l105:
01:1836 : a6 1b __ LDX ACCU + 0 
01:1838 : bd 00 89 LDA $8900,x ; (linebuffer + 0)
01:183b : f0 05 __ BEQ $1842 ; (dir_readentry.s207 + 0)
.s108:
01:183d : a6 45 __ LDX T1 + 0 
01:183f : 9d e9 8a STA $8ae9,x ; (disk_id_buf + 0)
.s207:
01:1842 : e6 1b __ INC ACCU + 0 
01:1844 : e6 45 __ INC T1 + 0 
01:1846 : a6 45 __ LDX T1 + 0 
01:1848 : e0 05 __ CPX #$05
01:184a : 90 ea __ BCC $1836 ; (dir_readentry.l105 + 0)
.s107:
01:184c : a9 00 __ LDA #$00
01:184e : 9d e9 8a STA $8ae9,x ; (disk_id_buf + 0)
01:1851 : a0 0f __ LDY #$0f
01:1853 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
01:1855 : f0 08 __ BEQ $185f ; (dir_readentry.l115 + 0)
.s119:
01:1857 : c9 20 __ CMP #$20
01:1859 : f0 04 __ BEQ $185f ; (dir_readentry.l115 + 0)
.s118:
01:185b : c9 a0 __ CMP #$a0
01:185d : d0 0e __ BNE $186d ; (dir_readentry.s1096 + 0)
.l115:
01:185f : a9 00 __ LDA #$00
01:1861 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1863 : 88 __ __ DEY
01:1864 : f0 07 __ BEQ $186d ; (dir_readentry.s1096 + 0)
.s112:
01:1866 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
01:1868 : f0 f5 __ BEQ $185f ; (dir_readentry.l115 + 0)
01:186a : 4c 57 18 JMP $1857 ; (dir_readentry.s119 + 0)
.s1096:
01:186d : a9 00 __ LDA #$00
01:186f : 4c bc 16 JMP $16bc ; (dir_readentry.s1095 + 0)
.s55:
01:1872 : a0 13 __ LDY #$13
01:1874 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1876 : a6 1b __ LDX ACCU + 0 
01:1878 : bd fc 88 LDA $88fc,x ; (previous + 0)
01:187b : c9 3c __ CMP #$3c
01:187d : d0 04 __ BNE $1883 ; (dir_readentry.s165 + 0)
.s164:
01:187f : a9 01 __ LDA #$01
01:1881 : d0 02 __ BNE $1885 ; (dir_readentry.s1093 + 0)
.s165:
01:1883 : a9 03 __ LDA #$03
.s1093:
01:1885 : a0 14 __ LDY #$14
01:1887 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1889 : d0 e2 __ BNE $186d ; (dir_readentry.s1096 + 0)
.s37:
01:188b : e8 __ __ INX
01:188c : 86 45 __ STX T1 + 0 
01:188e : 4c f1 16 JMP $16f1 ; (dir_readentry.s127 + 0)
.s5:
01:1891 : a9 07 __ LDA #$07
01:1893 : 4c bc 16 JMP $16bc ; (dir_readentry.s1095 + 0)
--------------------------------------------------------------------
dir_validentry: ; dir_validentry(u8)->u8
.s0:
01:1896 : ad fe 88 LDA $88fe ; (current + 0)
01:1899 : 85 43 __ STA T0 + 0 
01:189b : 85 0d __ STA P0 
01:189d : ad ff 88 LDA $88ff ; (current + 1)
01:18a0 : 85 44 __ STA T0 + 1 
01:18a2 : 85 0e __ STA P1 
01:18a4 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
01:18a7 : a0 13 __ LDY #$13
01:18a9 : b1 43 __ LDA (T0 + 0),y 
01:18ab : c9 11 __ CMP #$11
01:18ad : f0 06 __ BEQ $18b5 ; (dir_validentry.s3 + 0)
.s4:
01:18af : a5 13 __ LDA P6 ; (filter + 0)
01:18b1 : c9 02 __ CMP #$02
01:18b3 : 90 61 __ BCC $1916 ; (dir_validentry.s1024 + 0)
.s3:
01:18b5 : b1 43 __ LDA (T0 + 0),y 
01:18b7 : c9 10 __ CMP #$10
01:18b9 : d0 05 __ BNE $18c0 ; (dir_validentry.s9 + 0)
.s1018:
01:18bb : a5 13 __ LDA P6 ; (filter + 0)
01:18bd : 4c c6 18 JMP $18c6 ; (dir_validentry.s8 + 0)
.s9:
01:18c0 : a5 13 __ LDA P6 ; (filter + 0)
01:18c2 : c9 02 __ CMP #$02
01:18c4 : f0 50 __ BEQ $1916 ; (dir_validentry.s1024 + 0)
.s8:
01:18c6 : c9 01 __ CMP #$01
01:18c8 : d0 50 __ BNE $191a ; (dir_validentry.s1021 + 0)
.s11:
01:18ca : a5 1b __ LDA ACCU + 0 
01:18cc : c9 06 __ CMP #$06
01:18ce : 90 46 __ BCC $1916 ; (dir_validentry.s1024 + 0)
.s14:
01:18d0 : a9 00 __ LDA #$00
01:18d2 : 8d ed ab STA $abed ; (palette_draw@stack + 14)
01:18d5 : 8d ee ab STA $abee ; (palette_draw@stack + 15)
01:18d8 : 8d ef ab STA $abef ; (buffer + 12)
01:18db : 8d f0 ab STA $abf0 ; (buffer + 13)
01:18de : 8d f1 ab STA $abf1 ; (buffer + 14)
01:18e1 : 8d f2 ab STA $abf2 ; (buffer + 15)
01:18e4 : a5 1b __ LDA ACCU + 0 
01:18e6 : e9 05 __ SBC #$05
01:18e8 : 18 __ __ CLC
01:18e9 : 65 43 __ ADC T0 + 0 
01:18eb : 85 43 __ STA T0 + 0 
01:18ed : 90 02 __ BCC $18f1 ; (dir_validentry.s1020 + 0)
.s1019:
01:18ef : e6 44 __ INC T0 + 1 
.s1020:
01:18f1 : a0 00 __ LDY #$00
.l1016:
01:18f3 : b1 43 __ LDA (T0 + 0),y 
01:18f5 : 99 ed ab STA $abed,y ; (palette_draw@stack + 14)
01:18f8 : c8 __ __ INY
01:18f9 : c0 05 __ CPY #$05
01:18fb : 90 f6 __ BCC $18f3 ; (dir_validentry.l1016 + 0)
.s1017:
01:18fd : a9 ed __ LDA #$ed
01:18ff : 85 0d __ STA P0 
01:1901 : a9 ab __ LDA #$ab
01:1903 : 85 0e __ STA P1 
01:1905 : a9 1f __ LDA #$1f
01:1907 : 85 0f __ STA P2 
01:1909 : a9 19 __ LDA #$19
01:190b : 85 10 __ STA P3 
01:190d : 20 6c 6f JSR $6f6c ; (strcmp.s0 + 0)
01:1910 : a5 1b __ LDA ACCU + 0 
01:1912 : 05 1c __ ORA ACCU + 1 
01:1914 : f0 04 __ BEQ $191a ; (dir_validentry.s1021 + 0)
.s1024:
01:1916 : a9 00 __ LDA #$00
01:1918 : f0 02 __ BEQ $191c ; (dir_validentry.s1001 + 0)
.s1021:
01:191a : a9 01 __ LDA #$01
.s1001:
01:191c : 85 1b __ STA ACCU + 0 
01:191e : 60 __ __ RTS
--------------------------------------------------------------------
01:191f : __ __ __ BYT 2e 50 52 4f 4a 00                               : .PROJ.
--------------------------------------------------------------------
fileTypeToStr: ; fileTypeToStr(u8)->const u8*
.s1000:
01:1925 : aa __ __ TAX
.s0:
01:1926 : a8 __ __ TAY
01:1927 : 29 10 __ AND #$10
01:1929 : d0 43 __ BNE $196e ; (fileTypeToStr.s1 + 0)
.s2:
01:192b : e0 06 __ CPX #$06
01:192d : b0 0e __ BCS $193d ; (fileTypeToStr.s3 + 0)
.s8:
01:192f : 98 __ __ TYA
01:1930 : 0a __ __ ASL
01:1931 : aa __ __ TAX
01:1932 : bd ea 86 LDA $86ea,x ; (oth_types + 0)
01:1935 : 85 1b __ STA ACCU + 0 
01:1937 : bd eb 86 LDA $86eb,x ; (oth_types + 1)
01:193a : 4c 6b 19 JMP $196b ; (fileTypeToStr.s1001 + 0)
.s3:
01:193d : a9 3f __ LDA #$3f
01:193f : 8d ee 8a STA $8aee ; (bad_type + 0)
01:1942 : ad fe 82 LDA $82fe ; (value2hex + 0)
01:1945 : 85 1b __ STA ACCU + 0 
01:1947 : ad ff 82 LDA $82ff ; (value2hex + 1)
01:194a : 85 1c __ STA ACCU + 1 
01:194c : 8a __ __ TXA
01:194d : 4a __ __ LSR
01:194e : 4a __ __ LSR
01:194f : 4a __ __ LSR
01:1950 : 4a __ __ LSR
01:1951 : a8 __ __ TAY
01:1952 : b1 1b __ LDA (ACCU + 0),y 
01:1954 : 8d ef 8a STA $8aef ; (bad_type + 1)
01:1957 : 8a __ __ TXA
01:1958 : 29 0f __ AND #$0f
01:195a : a8 __ __ TAY
01:195b : b1 1b __ LDA (ACCU + 0),y 
01:195d : 8d f0 8a STA $8af0 ; (bad_type + 2)
01:1960 : a9 00 __ LDA #$00
01:1962 : 8d f1 8a STA $8af1 ; (bad_type + 3)
01:1965 : a9 ee __ LDA #$ee
01:1967 : 85 1b __ STA ACCU + 0 
01:1969 : a9 8a __ LDA #$8a
.s1001:
01:196b : 85 1c __ STA ACCU + 1 
01:196d : 60 __ __ RTS
.s1:
01:196e : 8a __ __ TXA
01:196f : 29 ef __ AND #$ef
01:1971 : c9 05 __ CMP #$05
01:1973 : aa __ __ TAX
01:1974 : b0 c7 __ BCS $193d ; (fileTypeToStr.s3 + 0)
.s4:
01:1976 : 0a __ __ ASL
01:1977 : aa __ __ TAX
01:1978 : bd e0 86 LDA $86e0,x ; (reg_types + 0)
01:197b : 85 1b __ STA ACCU + 0 
01:197d : bd e1 86 LDA $86e1,x ; (reg_types + 1)
01:1980 : 4c 6b 19 JMP $196b ; (fileTypeToStr.s1001 + 0)
--------------------------------------------------------------------
bnk_io_read@proxy: ; bnk_io_read@proxy
01:1983 : a5 4e __ LDA $4e 
01:1985 : 85 0e __ STA P1 
01:1987 : a5 4f __ LDA $4f 
01:1989 : 85 0f __ STA P2 
01:198b : ad 55 8b LDA $8b55 ; (importvars + 4)
01:198e : 85 10 __ STA P3 
01:1990 : ad 56 8b LDA $8b56 ; (importvars + 5)
01:1993 : 85 11 __ STA P4 
--------------------------------------------------------------------
bnk_io_read: ; bnk_io_read(u8,u8,u8*,i16)->void
.s0:
01:1995 : ad 7b 87 LDA $877b ; (krnio_pstatus + 1)
01:1998 : c9 40 __ CMP #$40
01:199a : f0 0e __ BEQ $19aa ; (bnk_io_read.s1001 + 0)
.s3:
01:199c : ad 00 ff LDA $ff00 
01:199f : 85 43 __ STA T0 + 0 
01:19a1 : a9 01 __ LDA #$01
01:19a3 : 20 ff 63 JSR $63ff ; (krnio_chkin.s1000 + 0)
01:19a6 : 09 00 __ ORA #$00
01:19a8 : d0 01 __ BNE $19ab ; (bnk_io_read.s5 + 0)
.s1001:
01:19aa : 60 __ __ RTS
.s5:
01:19ab : a5 11 __ LDA P4 ; (num + 1)
01:19ad : 30 52 __ BMI $1a01 ; (bnk_io_read.s10 + 0)
.s1007:
01:19af : 05 10 __ ORA P3 ; (num + 0)
01:19b1 : f0 4e __ BEQ $1a01 ; (bnk_io_read.s10 + 0)
.s22:
01:19b3 : a9 00 __ LDA #$00
01:19b5 : 85 44 __ STA T2 + 0 
01:19b7 : 85 45 __ STA T2 + 1 
.l9:
01:19b9 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
01:19bc : a5 1b __ LDA ACCU + 0 
01:19be : 85 46 __ STA T3 + 0 
01:19c0 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
01:19c3 : 8d 7b 87 STA $877b ; (krnio_pstatus + 1)
01:19c6 : aa __ __ TAX
01:19c7 : f0 04 __ BEQ $19cd ; (bnk_io_read.s13 + 0)
.s14:
01:19c9 : c9 40 __ CMP #$40
01:19cb : d0 34 __ BNE $1a01 ; (bnk_io_read.s10 + 0)
.s13:
01:19cd : a9 7f __ LDA #$7f
01:19cf : 8d 00 ff STA $ff00 
01:19d2 : a5 44 __ LDA T2 + 0 
01:19d4 : 85 1b __ STA ACCU + 0 
01:19d6 : 18 __ __ CLC
01:19d7 : a5 0f __ LDA P2 ; (data + 1)
01:19d9 : 65 45 __ ADC T2 + 1 
01:19db : 85 1c __ STA ACCU + 1 
01:19dd : a5 46 __ LDA T3 + 0 
01:19df : a4 0e __ LDY P1 ; (data + 0)
01:19e1 : 91 1b __ STA (ACCU + 0),y 
01:19e3 : a5 43 __ LDA T0 + 0 
01:19e5 : 8d 00 ff STA $ff00 
01:19e8 : 8a __ __ TXA
01:19e9 : d0 16 __ BNE $1a01 ; (bnk_io_read.s10 + 0)
.s8:
01:19eb : 24 11 __ BIT P4 ; (num + 1)
01:19ed : 30 12 __ BMI $1a01 ; (bnk_io_read.s10 + 0)
.s1004:
01:19ef : e6 44 __ INC T2 + 0 
01:19f1 : d0 02 __ BNE $19f5 ; (bnk_io_read.s1011 + 0)
.s1010:
01:19f3 : e6 45 __ INC T2 + 1 
.s1011:
01:19f5 : a5 45 __ LDA T2 + 1 
01:19f7 : c5 11 __ CMP P4 ; (num + 1)
01:19f9 : d0 04 __ BNE $19ff ; (bnk_io_read.s1003 + 0)
.s1002:
01:19fb : a5 44 __ LDA T2 + 0 
01:19fd : c5 10 __ CMP P3 ; (num + 0)
.s1003:
01:19ff : 90 b8 __ BCC $19b9 ; (bnk_io_read.l9 + 0)
.s10:
01:1a01 : 4c cc ff JMP $ffcc 
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1a04 : a5 53 __ LDA $53 
01:1a06 : 85 0f __ STA P2 
01:1a08 : a9 01 __ LDA #$01
01:1a0a : 85 10 __ STA P3 
01:1a0c : a9 00 __ LDA #$00
01:1a0e : 85 11 __ STA P4 
01:1a10 : a9 51 __ LDA #$51
01:1a12 : 85 13 __ STA P6 
01:1a14 : a9 89 __ LDA #$89
01:1a16 : 85 14 __ STA P7 
01:1a18 : 4c 6c 13 JMP $136c ; (bnk_load.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1a1b : ad b5 87 LDA $87b5 ; (vdc_state + 8)
01:1a1e : 85 0f __ STA P2 
01:1a20 : ad b6 87 LDA $87b6 ; (vdc_state + 9)
01:1a23 : 85 10 __ STA P3 
01:1a25 : a9 7f __ LDA #$7f
01:1a27 : 85 11 __ STA P4 
01:1a29 : a9 00 __ LDA #$00
01:1a2b : 85 12 __ STA P5 
01:1a2d : a9 d0 __ LDA #$d0
01:1a2f : 85 14 __ STA P7 
01:1a31 : a9 0f __ LDA #$0f
01:1a33 : 85 15 __ STA P8 
01:1a35 : 4c b5 13 JMP $13b5 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1a38 : a9 0e __ LDA #$0e
01:1a3a : 85 11 __ STA P4 
01:1a3c : a9 00 __ LDA #$00
01:1a3e : 85 12 __ STA P5 
01:1a40 : a9 89 __ LDA #$89
01:1a42 : 85 13 __ STA P6 
01:1a44 : a9 00 __ LDA #$00
01:1a46 : 85 15 __ STA P8 
01:1a48 : 4c b5 13 JMP $13b5 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1a4b : a5 05 __ LDA WORK + 2 
01:1a4d : 85 0e __ STA P1 
01:1a4f : 4c 10 14 JMP $1410 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1a52 : a9 0e __ LDA #$0e
01:1a54 : 85 0d __ STA P0 
01:1a56 : a9 00 __ LDA #$00
01:1a58 : 85 0e __ STA P1 
01:1a5a : a9 89 __ LDA #$89
01:1a5c : 85 0f __ STA P2 
01:1a5e : a5 14 __ LDA P7 
01:1a60 : 85 12 __ STA P5 
01:1a62 : a9 00 __ LDA #$00
01:1a64 : 85 13 __ STA P6 
01:1a66 : 4c 10 14 JMP $1410 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_memset@proxy: ; bnk_memset@proxy
01:1a69 : a5 05 __ LDA WORK + 2 
01:1a6b : 85 10 __ STA P3 
01:1a6d : a5 06 __ LDA WORK + 3 
01:1a6f : 85 11 __ STA P4 
01:1a71 : 4c e2 14 JMP $14e2 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
bnk_memset@proxy: ; bnk_memset@proxy
01:1a74 : a9 20 __ LDA #$20
01:1a76 : 85 0f __ STA P2 
01:1a78 : a5 14 __ LDA P7 
01:1a7a : 85 10 __ STA P3 
01:1a7c : a5 59 __ LDA $59 
01:1a7e : 85 11 __ STA P4 
01:1a80 : 4c e2 14 JMP $14e2 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1a83 : ad bd 87 LDA $87bd ; (vdc_state + 16)
01:1a86 : 85 0f __ STA P2 
01:1a88 : ad be 87 LDA $87be ; (vdc_state + 17)
01:1a8b : 85 10 __ STA P3 
01:1a8d : a9 01 __ LDA #$01
01:1a8f : 85 15 __ STA P8 
01:1a91 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1a94 : ad bf 87 LDA $87bf ; (vdc_state + 18)
01:1a97 : 85 0f __ STA P2 
01:1a99 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
01:1a9c : 85 10 __ STA P3 
01:1a9e : a9 50 __ LDA #$50
01:1aa0 : 85 13 __ STA P6 
01:1aa2 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1aa5 : a9 40 __ LDA #$40
01:1aa7 : 85 13 __ STA P6 
01:1aa9 : a9 01 __ LDA #$01
01:1aab : 85 15 __ STA P8 
01:1aad : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1ab0 : a9 50 __ LDA #$50
01:1ab2 : 85 13 __ STA P6 
01:1ab4 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1ab7 : a9 40 __ LDA #$40
01:1ab9 : 85 13 __ STA P6 
01:1abb : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
palette: ; palette()->void
.s1000:
02:ac00 : a2 06 __ LDX #$06
02:ac02 : b5 53 __ LDA T0 + 0,x 
02:ac04 : 9d c3 ab STA $abc3,x ; (projbuffer + 43)
02:ac07 : ca __ __ DEX
02:ac08 : 10 f8 __ BPL $ac02 ; (palette.s1000 + 2)
.s0:
02:ac0a : ad 91 87 LDA $8791 ; (plotscreencode + 0)
02:ac0d : 8d cc 88 STA $88cc ; (palettechar + 0)
02:ac10 : a2 ff __ LDX #$ff
.l1002:
02:ac12 : e8 __ __ INX
02:ac13 : bd 36 af LDA $af36,x 
02:ac16 : 9d f4 87 STA $87f4,x ; (programmode + 0)
02:ac19 : d0 f7 __ BNE $ac12 ; (palette.l1002 + 0)
.s1003:
02:ac1b : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
02:ac1e : 85 53 __ STA T0 + 0 
02:ac20 : 20 1b 4b JSR $4b1b ; (hidecursor.s0 + 0)
02:ac23 : 20 3e af JSR $af3e ; (palette_draw.s1000 + 0)
02:ac26 : ad f1 82 LDA $82f1 ; (colsel + 0)
02:ac29 : 18 __ __ CLC
02:ac2a : 69 2d __ ADC #$2d
02:ac2c : 8d d5 87 STA $87d5 ; (canvas + 15)
02:ac2f : ae ef 82 LDX $82ef ; (rowsel + 0)
02:ac32 : e8 __ __ INX
02:ac33 : e8 __ __ INX
02:ac34 : 8e d6 87 STX $87d6 ; (canvas + 16)
02:ac37 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
02:ac3a : a5 53 __ LDA T0 + 0 
02:ac3c : 38 __ __ SEC
02:ac3d : e9 80 __ SBC #$80
02:ac3f : 85 54 __ STA T1 + 0 
02:ac41 : ad ff 87 LDA $87ff ; (showbar + 0)
02:ac44 : f0 03 __ BEQ $ac49 ; (palette.l6 + 0)
.l4:
02:ac46 : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.l6:
02:ac49 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
02:ac4c : a5 1b __ LDA ACCU + 0 
02:ac4e : 85 55 __ STA T2 + 0 
02:ac50 : c9 56 __ CMP #$56
02:ac52 : d0 2e __ BNE $ac82 ; (palette.s73 + 0)
.s57:
02:ac54 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:ac57 : 20 ce b0 JSR $b0ce ; (palette_returnscreencode.s0 + 0)
02:ac5a : a9 00 __ LDA #$00
02:ac5c : cd fe 7b CMP $7bfe ; (visualmap + 0)
02:ac5f : 2a __ __ ROL
02:ac60 : 8d fe 7b STA $7bfe ; (visualmap + 0)
02:ac63 : 20 3e af JSR $af3e ; (palette_draw.s1000 + 0)
02:ac66 : ad f1 82 LDA $82f1 ; (colsel + 0)
02:ac69 : 18 __ __ CLC
02:ac6a : 69 2d __ ADC #$2d
02:ac6c : 8d d5 87 STA $87d5 ; (canvas + 15)
02:ac6f : ae ef 82 LDX $82ef ; (rowsel + 0)
02:ac72 : e8 __ __ INX
02:ac73 : e8 __ __ INX
02:ac74 : 8e d6 87 STX $87d6 ; (canvas + 16)
02:ac77 : a9 d1 __ LDA #$d1
02:ac79 : 85 0d __ STA P0 
02:ac7b : a9 87 __ LDA #$87
02:ac7d : 85 0e __ STA P1 
02:ac7f : 4c 09 af JMP $af09 ; (palette.s151 + 0)
.s73:
02:ac82 : 85 56 __ STA T3 + 0 
02:ac84 : c9 56 __ CMP #$56
02:ac86 : b0 03 __ BCS $ac8b ; (palette.s74 + 0)
02:ac88 : 4c 0f af JMP $af0f ; (palette.s75 + 0)
.s74:
02:ac8b : c9 91 __ CMP #$91
02:ac8d : d0 03 __ BNE $ac92 ; (palette.s82 + 0)
02:ac8f : 4c 2a ad JMP $ad2a ; (palette.s8 + 0)
.s82:
02:ac92 : b0 03 __ BCS $ac97 ; (palette.s83 + 0)
02:ac94 : 4c ce ae JMP $aece ; (palette.s84 + 0)
.s83:
02:ac97 : c9 9d __ CMP #$9d
02:ac99 : d0 03 __ BNE $ac9e ; (palette.s63 + 0)
02:ac9b : 4c 2a ad JMP $ad2a ; (palette.s8 + 0)
.s63:
02:ac9e : c9 30 __ CMP #$30
02:aca0 : 90 12 __ BCC $acb4 ; (palette.s7 + 0)
.s68:
02:aca2 : c9 3a __ CMP #$3a
02:aca4 : b0 0e __ BCS $acb4 ; (palette.s7 + 0)
.s67:
02:aca6 : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:aca9 : 85 59 __ STA T4 + 1 
02:acab : ad ef 82 LDA $82ef ; (rowsel + 0)
02:acae : 85 58 __ STA T4 + 0 
02:acb0 : 05 59 __ ORA T4 + 1 
02:acb2 : d0 3a __ BNE $acee ; (palette.s64 + 0)
.s7:
02:acb4 : a5 55 __ LDA T2 + 0 
02:acb6 : c9 1b __ CMP #$1b
02:acb8 : f0 0c __ BEQ $acc6 ; (palette.s3 + 0)
.s88:
02:acba : c9 03 __ CMP #$03
02:acbc : f0 08 __ BEQ $acc6 ; (palette.s3 + 0)
.s128:
02:acbe : ad ff 87 LDA $87ff ; (showbar + 0)
02:acc1 : f0 86 __ BEQ $ac49 ; (palette.l6 + 0)
02:acc3 : 4c 46 ac JMP $ac46 ; (palette.l4 + 0)
.s3:
02:acc6 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:acc9 : ad 8c 87 LDA $878c ; (screen_col + 0)
02:accc : 8d d5 87 STA $87d5 ; (canvas + 15)
02:accf : ad 8e 87 LDA $878e ; (screen_row + 0)
02:acd2 : 8d d6 87 STA $87d6 ; (canvas + 16)
02:acd5 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
02:acd8 : a2 ff __ LDX #$ff
.l1004:
02:acda : e8 __ __ INX
02:acdb : bd 69 b1 LDA $b169,x 
02:acde : 9d f4 87 STA $87f4,x ; (programmode + 0)
02:ace1 : d0 f7 __ BNE $acda ; (palette.l1004 + 0)
.s1001:
02:ace3 : a2 06 __ LDX #$06
02:ace5 : bd c3 ab LDA $abc3,x ; (projbuffer + 43)
02:ace8 : 95 53 __ STA T0 + 0,x 
02:acea : ca __ __ DEX
02:aceb : 10 f8 __ BPL $ace5 ; (palette.s1001 + 2)
02:aced : 60 __ __ RTS
.s64:
02:acee : 20 ce b0 JSR $b0ce ; (palette_returnscreencode.s0 + 0)
02:acf1 : a9 02 __ LDA #$02
02:acf3 : 85 0e __ STA P1 
02:acf5 : a5 56 __ LDA T3 + 0 
02:acf7 : 0a __ __ ASL
02:acf8 : aa __ __ TAX
02:acf9 : ad cc 88 LDA $88cc ; (palettechar + 0)
02:acfc : 85 0f __ STA P2 
02:acfe : 9d 58 88 STA $8858,x ; (multab + 88)
02:ad01 : 38 __ __ SEC
02:ad02 : a5 56 __ LDA T3 + 0 
02:ad04 : e9 03 __ SBC #$03
02:ad06 : 85 0d __ STA P0 
02:ad08 : a5 59 __ LDA T4 + 1 
02:ad0a : d0 09 __ BNE $ad15 ; (palette.s70 + 0)
.s1010:
02:ad0c : a5 58 __ LDA T4 + 0 
02:ad0e : c9 0a __ CMP #$0a
02:ad10 : a9 00 __ LDA #$00
02:ad12 : 2a __ __ ROL
02:ad13 : 90 02 __ BCC $ad17 ; (palette.s71 + 0)
.s70:
02:ad15 : a9 01 __ LDA #$01
.s71:
02:ad17 : 9d 59 88 STA $8859,x ; (multab + 89)
02:ad1a : 4a __ __ LSR
02:ad1b : a9 00 __ LDA #$00
02:ad1d : 6a __ __ ROR
02:ad1e : 65 54 __ ADC T1 + 0 
02:ad20 : 85 10 __ STA P3 
02:ad22 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s1060:
02:ad25 : a5 55 __ LDA T2 + 0 
02:ad27 : 4c ba ac JMP $acba ; (palette.s88 + 0)
.s8:
02:ad2a : a5 1b __ LDA ACCU + 0 
02:ad2c : c9 1d __ CMP #$1d
02:ad2e : d0 03 __ BNE $ad33 ; (palette.s11 + 0)
02:ad30 : 4c c0 ae JMP $aec0 ; (palette.s9 + 0)
.s11:
02:ad33 : c9 9d __ CMP #$9d
02:ad35 : d0 71 __ BNE $ada8 ; (palette.s14 + 0)
.s12:
02:ad37 : ad f1 82 LDA $82f1 ; (colsel + 0)
02:ad3a : 0d f2 82 ORA $82f2 ; (colsel + 1)
02:ad3d : f0 11 __ BEQ $ad50 ; (palette.s16 + 0)
.s15:
02:ad3f : ad f1 82 LDA $82f1 ; (colsel + 0)
02:ad42 : 18 __ __ CLC
02:ad43 : 69 ff __ ADC #$ff
02:ad45 : 8d f1 82 STA $82f1 ; (colsel + 0)
02:ad48 : ad f2 82 LDA $82f2 ; (colsel + 1)
02:ad4b : 69 ff __ ADC #$ff
02:ad4d : 4c 9f ae JMP $ae9f ; (palette.s1059 + 0)
.s16:
02:ad50 : a9 1f __ LDA #$1f
02:ad52 : 8d f1 82 STA $82f1 ; (colsel + 0)
02:ad55 : a9 00 __ LDA #$00
02:ad57 : 8d f2 82 STA $82f2 ; (colsel + 1)
02:ad5a : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:ad5d : 85 57 __ STA T3 + 1 
02:ad5f : ad ef 82 LDA $82ef ; (rowsel + 0)
02:ad62 : a8 __ __ TAY
02:ad63 : 05 57 __ ORA T3 + 1 
02:ad65 : d0 0d __ BNE $ad74 ; (palette.s18 + 0)
.s19:
02:ad67 : a9 12 __ LDA #$12
02:ad69 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:ad6c : a9 00 __ LDA #$00
02:ad6e : 8d f0 82 STA $82f0 ; (rowsel + 1)
02:ad71 : 4c a2 ae JMP $aea2 ; (palette.s1061 + 0)
.s18:
02:ad74 : 98 __ __ TYA
02:ad75 : 18 __ __ CLC
02:ad76 : 69 ff __ ADC #$ff
02:ad78 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:ad7b : aa __ __ TAX
02:ad7c : a5 57 __ LDA T3 + 1 
02:ad7e : 69 ff __ ADC #$ff
02:ad80 : 8d f0 82 STA $82f0 ; (rowsel + 1)
02:ad83 : d0 13 __ BNE $ad98 ; (palette.s23 + 0)
.s1028:
02:ad85 : e0 01 __ CPX #$01
02:ad87 : d0 03 __ BNE $ad8c ; (palette.s24 + 0)
02:ad89 : 4c a7 ae JMP $aea7 ; (palette.s21 + 0)
.s24:
02:ad8c : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:ad8f : d0 07 __ BNE $ad98 ; (palette.s23 + 0)
.s1027:
02:ad91 : e0 0a __ CPX #$0a
02:ad93 : d0 03 __ BNE $ad98 ; (palette.s23 + 0)
02:ad95 : 4c a7 ae JMP $aea7 ; (palette.s21 + 0)
.s23:
02:ad98 : 8a __ __ TXA
02:ad99 : 0d f0 82 ORA $82f0 ; (rowsel + 1)
02:ad9c : d0 0a __ BNE $ada8 ; (palette.s14 + 0)
.s25:
02:ad9e : a9 09 __ LDA #$09
02:ada0 : 8d f1 82 STA $82f1 ; (colsel + 0)
02:ada3 : a9 00 __ LDA #$00
02:ada5 : 4c 9f ae JMP $ae9f ; (palette.s1059 + 0)
.s14:
02:ada8 : a5 1b __ LDA ACCU + 0 
02:adaa : c9 11 __ CMP #$11
02:adac : d0 0f __ BNE $adbd ; (palette.s30 + 0)
.s28:
02:adae : ad ef 82 LDA $82ef ; (rowsel + 0)
02:adb1 : 18 __ __ CLC
02:adb2 : 69 01 __ ADC #$01
02:adb4 : a8 __ __ TAY
02:adb5 : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:adb8 : 69 00 __ ADC #$00
02:adba : 4c 03 ae JMP $ae03 ; (palette.s169 + 0)
.s30:
02:adbd : c9 91 __ CMP #$91
02:adbf : d0 48 __ BNE $ae09 ; (palette.s133 + 0)
.s31:
02:adc1 : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:adc4 : 85 57 __ STA T3 + 1 
02:adc6 : ad ef 82 LDA $82ef ; (rowsel + 0)
02:adc9 : a8 __ __ TAY
02:adca : 05 57 __ ORA T3 + 1 
02:adcc : d0 09 __ BNE $add7 ; (palette.s34 + 0)
.s35:
02:adce : a9 12 __ LDA #$12
02:add0 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:add3 : a9 00 __ LDA #$00
02:add5 : f0 2f __ BEQ $ae06 ; (palette.s1058 + 0)
.s34:
02:add7 : 98 __ __ TYA
02:add8 : 18 __ __ CLC
02:add9 : 69 ff __ ADC #$ff
02:addb : 8d ef 82 STA $82ef ; (rowsel + 0)
02:adde : a5 57 __ LDA T3 + 1 
02:ade0 : 69 ff __ ADC #$ff
02:ade2 : 8d f0 82 STA $82f0 ; (rowsel + 1)
02:ade5 : d0 22 __ BNE $ae09 ; (palette.s133 + 0)
.s1022:
02:ade7 : ad ef 82 LDA $82ef ; (rowsel + 0)
02:adea : c9 01 __ CMP #$01
02:adec : f0 0c __ BEQ $adfa ; (palette.s37 + 0)
.s40:
02:adee : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:adf1 : d0 16 __ BNE $ae09 ; (palette.s133 + 0)
.s1021:
02:adf3 : ad ef 82 LDA $82ef ; (rowsel + 0)
02:adf6 : c9 0a __ CMP #$0a
02:adf8 : d0 0f __ BNE $ae09 ; (palette.s133 + 0)
.s37:
02:adfa : 98 __ __ TYA
02:adfb : 18 __ __ CLC
02:adfc : 69 fe __ ADC #$fe
02:adfe : a8 __ __ TAY
02:adff : a5 57 __ LDA T3 + 1 
02:ae01 : 69 ff __ ADC #$ff
.s169:
02:ae03 : 8c ef 82 STY $82ef ; (rowsel + 0)
.s1058:
02:ae06 : 8d f0 82 STA $82f0 ; (rowsel + 1)
.s133:
02:ae09 : ad f2 82 LDA $82f2 ; (colsel + 1)
02:ae0c : d0 07 __ BNE $ae15 ; (palette.s44 + 0)
.s1020:
02:ae0e : a9 09 __ LDA #$09
02:ae10 : cd f1 82 CMP $82f1 ; (colsel + 0)
02:ae13 : b0 18 __ BCS $ae2d ; (palette.s43 + 0)
.s44:
02:ae15 : ad ef 82 LDA $82ef ; (rowsel + 0)
02:ae18 : 0d f0 82 ORA $82f0 ; (rowsel + 1)
02:ae1b : d0 10 __ BNE $ae2d ; (palette.s43 + 0)
.s41:
02:ae1d : 8d f1 82 STA $82f1 ; (colsel + 0)
02:ae20 : 8d f2 82 STA $82f2 ; (colsel + 1)
02:ae23 : 8d f0 82 STA $82f0 ; (rowsel + 1)
02:ae26 : a9 02 __ LDA #$02
02:ae28 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:ae2b : d0 0c __ BNE $ae39 ; (palette.s47 + 0)
.s43:
02:ae2d : ad f2 82 LDA $82f2 ; (colsel + 1)
02:ae30 : d0 10 __ BNE $ae42 ; (palette.s45 + 0)
.s1019:
02:ae32 : a9 1f __ LDA #$1f
02:ae34 : cd f1 82 CMP $82f1 ; (colsel + 0)
02:ae37 : 90 09 __ BCC $ae42 ; (palette.s45 + 0)
.s47:
02:ae39 : ac ef 82 LDY $82ef ; (rowsel + 0)
02:ae3c : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:ae3f : 4c 5c ae JMP $ae5c ; (palette.s1057 + 0)
.s45:
02:ae42 : a9 00 __ LDA #$00
02:ae44 : 8d f1 82 STA $82f1 ; (colsel + 0)
02:ae47 : 8d f2 82 STA $82f2 ; (colsel + 1)
02:ae4a : ad ef 82 LDA $82ef ; (rowsel + 0)
02:ae4d : 18 __ __ CLC
02:ae4e : 69 01 __ ADC #$01
02:ae50 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:ae53 : a8 __ __ TAY
02:ae54 : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:ae57 : 69 00 __ ADC #$00
02:ae59 : 8d f0 82 STA $82f0 ; (rowsel + 1)
.s1057:
02:ae5c : d0 05 __ BNE $ae63 ; (palette.s48 + 0)
.s1018:
02:ae5e : 98 __ __ TYA
02:ae5f : c0 13 __ CPY #$13
02:ae61 : 90 0a __ BCC $ae6d ; (palette.s50 + 0)
.s48:
02:ae63 : a9 00 __ LDA #$00
02:ae65 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:ae68 : 8d f0 82 STA $82f0 ; (rowsel + 1)
02:ae6b : f0 04 __ BEQ $ae71 ; (palette.s54 + 0)
.s50:
02:ae6d : c9 01 __ CMP #$01
02:ae6f : f0 0c __ BEQ $ae7d ; (palette.s51 + 0)
.s54:
02:ae71 : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:ae74 : d0 0f __ BNE $ae85 ; (palette.s53 + 0)
.s1015:
02:ae76 : ad ef 82 LDA $82ef ; (rowsel + 0)
02:ae79 : c9 0a __ CMP #$0a
02:ae7b : d0 08 __ BNE $ae85 ; (palette.s53 + 0)
.s51:
02:ae7d : ee ef 82 INC $82ef ; (rowsel + 0)
02:ae80 : d0 03 __ BNE $ae85 ; (palette.s53 + 0)
.s1064:
02:ae82 : ee f0 82 INC $82f0 ; (rowsel + 1)
.s53:
02:ae85 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
02:ae88 : ad f1 82 LDA $82f1 ; (colsel + 0)
02:ae8b : 18 __ __ CLC
02:ae8c : 69 2d __ ADC #$2d
02:ae8e : 8d d5 87 STA $87d5 ; (canvas + 15)
02:ae91 : ae ef 82 LDX $82ef ; (rowsel + 0)
02:ae94 : e8 __ __ INX
02:ae95 : e8 __ __ INX
02:ae96 : 8e d6 87 STX $87d6 ; (canvas + 16)
02:ae99 : 20 51 3e JSR $3e51 ; (vdcwin_cursor_toggle.s0 + 0)
02:ae9c : 4c b4 ac JMP $acb4 ; (palette.s7 + 0)
.s1059:
02:ae9f : 8d f2 82 STA $82f2 ; (colsel + 1)
.s1061:
02:aea2 : a5 1b __ LDA ACCU + 0 
02:aea4 : 4c bd ad JMP $adbd ; (palette.s30 + 0)
.s21:
02:aea7 : 98 __ __ TYA
02:aea8 : 18 __ __ CLC
02:aea9 : 69 fe __ ADC #$fe
02:aeab : 8d ef 82 STA $82ef ; (rowsel + 0)
02:aeae : a5 57 __ LDA T3 + 1 
02:aeb0 : 69 ff __ ADC #$ff
02:aeb2 : 8d f0 82 STA $82f0 ; (rowsel + 1)
02:aeb5 : 0d ef 82 ORA $82ef ; (rowsel + 0)
02:aeb8 : f0 03 __ BEQ $aebd ; (palette.s21 + 22)
02:aeba : 4c a8 ad JMP $ada8 ; (palette.s14 + 0)
02:aebd : 4c 9e ad JMP $ad9e ; (palette.s25 + 0)
.s9:
02:aec0 : ee f1 82 INC $82f1 ; (colsel + 0)
02:aec3 : f0 03 __ BEQ $aec8 ; (palette.s1062 + 0)
02:aec5 : 4c a8 ad JMP $ada8 ; (palette.s14 + 0)
.s1062:
02:aec8 : ee f2 82 INC $82f2 ; (colsel + 1)
02:aecb : 4c a8 ad JMP $ada8 ; (palette.s14 + 0)
.s84:
02:aece : c9 8b __ CMP #$8b
02:aed0 : d0 06 __ BNE $aed8 ; (palette.s85 + 0)
.s59:
02:aed2 : 20 4f 50 JSR $504f ; (togglestatusbar.s0 + 0)
02:aed5 : 4c 25 ad JMP $ad25 ; (palette.s1060 + 0)
.s85:
02:aed8 : c9 8c __ CMP #$8c
02:aeda : f0 03 __ BEQ $aedf ; (palette.s60 + 0)
02:aedc : 4c 9e ac JMP $ac9e ; (palette.s63 + 0)
.s60:
02:aedf : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
02:aee2 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:aee5 : a9 02 __ LDA #$02
02:aee7 : 8d f8 ab STA $abf8 ; (sstack + 5)
02:aeea : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
02:aeed : 20 3e af JSR $af3e ; (palette_draw.s1000 + 0)
02:aef0 : a9 d1 __ LDA #$d1
02:aef2 : 85 0d __ STA P0 
02:aef4 : a9 87 __ LDA #$87
02:aef6 : 85 0e __ STA P1 
02:aef8 : ad f1 82 LDA $82f1 ; (colsel + 0)
02:aefb : 18 __ __ CLC
02:aefc : 69 2d __ ADC #$2d
02:aefe : 8d d5 87 STA $87d5 ; (canvas + 15)
02:af01 : ae ef 82 LDX $82ef ; (rowsel + 0)
02:af04 : e8 __ __ INX
02:af05 : e8 __ __ INX
02:af06 : 8e d6 87 STX $87d6 ; (canvas + 16)
.s151:
02:af09 : 20 51 3e JSR $3e51 ; (vdcwin_cursor_toggle.s0 + 0)
02:af0c : 4c 25 ad JMP $ad25 ; (palette.s1060 + 0)
.s75:
02:af0f : c9 1d __ CMP #$1d
02:af11 : f0 ad __ BEQ $aec0 ; (palette.s9 + 0)
.s76:
02:af13 : 90 13 __ BCC $af28 ; (palette.s78 + 0)
.s77:
02:af15 : c9 20 __ CMP #$20
02:af17 : f0 03 __ BEQ $af1c ; (palette.s56 + 0)
02:af19 : 4c 9e ac JMP $ac9e ; (palette.s63 + 0)
.s56:
02:af1c : 20 ce b0 JSR $b0ce ; (palette_returnscreencode.s0 + 0)
02:af1f : ad cc 88 LDA $88cc ; (palettechar + 0)
02:af22 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
02:af25 : 4c c6 ac JMP $acc6 ; (palette.s3 + 0)
.s78:
02:af28 : c9 0d __ CMP #$0d
02:af2a : f0 f0 __ BEQ $af1c ; (palette.s56 + 0)
.s79:
02:af2c : c9 11 __ CMP #$11
02:af2e : d0 03 __ BNE $af33 ; (palette.s79 + 7)
02:af30 : 4c 2a ad JMP $ad2a ; (palette.s8 + 0)
02:af33 : 4c 9e ac JMP $ac9e ; (palette.s63 + 0)
--------------------------------------------------------------------
02:af36 : __ __ __ BYT 70 41 4c 45 54 54 45 00                         : pALETTE.
--------------------------------------------------------------------
palette_draw: ; palette_draw()->void
.s1000:
02:af3e : a2 09 __ LDX #$09
02:af40 : b5 53 __ LDA T1 + 0,x 
02:af42 : 9d df ab STA $abdf,x ; (vp_fill + 18)
02:af45 : ca __ __ DEX
02:af46 : 10 f8 __ BPL $af40 ; (palette_draw.s1000 + 2)
.s0:
02:af48 : a9 00 __ LDA #$00
02:af4a : 85 52 __ STA T0 + 0 
02:af4c : 85 17 __ STA P10 
02:af4e : a9 2c __ LDA #$2c
02:af50 : 85 18 __ STA P11 
02:af52 : a9 01 __ LDA #$01
02:af54 : 8d f3 ab STA $abf3 ; (sstack + 0)
02:af57 : a9 22 __ LDA #$22
02:af59 : 8d f4 ab STA $abf4 ; (sstack + 1)
02:af5c : a9 15 __ LDA #$15
02:af5e : 8d f5 ab STA $abf5 ; (sstack + 2)
02:af61 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
02:af64 : 38 __ __ SEC
02:af65 : e9 80 __ SBC #$80
02:af67 : 85 53 __ STA T1 + 0 
02:af69 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
02:af6c : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
02:af6f : ad fe 7b LDA $7bfe ; (visualmap + 0)
02:af72 : 85 54 __ STA T2 + 0 
02:af74 : d0 41 __ BNE $afb7 ; (palette_draw.s24 + 0)
.s1:
02:af76 : ad cc 88 LDA $88cc ; (palettechar + 0)
02:af79 : 4a __ __ LSR
02:af7a : 4a __ __ LSR
02:af7b : 4a __ __ LSR
02:af7c : 4a __ __ LSR
02:af7d : 4a __ __ LSR
02:af7e : a8 __ __ TAY
02:af7f : ad 96 87 LDA $8796 ; (plotaltchar + 0)
02:af82 : 0a __ __ ASL
02:af83 : 85 1b __ STA ACCU + 0 
02:af85 : a9 00 __ LDA #$00
02:af87 : 8d f2 82 STA $82f2 ; (colsel + 1)
02:af8a : 2a __ __ ROL
02:af8b : 06 1b __ ASL ACCU + 0 
02:af8d : 2a __ __ ROL
02:af8e : 06 1b __ ASL ACCU + 0 
02:af90 : 2a __ __ ROL
02:af91 : aa __ __ TAX
02:af92 : a5 1b __ LDA ACCU + 0 
02:af94 : 6d 96 87 ADC $8796 ; (plotaltchar + 0)
02:af97 : 85 58 __ STA T6 + 0 
02:af99 : 90 01 __ BCC $af9c ; (palette_draw.s1019 + 0)
.s1018:
02:af9b : e8 __ __ INX
.s1019:
02:af9c : 98 __ __ TYA
02:af9d : 18 __ __ CLC
02:af9e : 65 58 __ ADC T6 + 0 
02:afa0 : 90 01 __ BCC $afa3 ; (palette_draw.s1021 + 0)
.s1020:
02:afa2 : e8 __ __ INX
.s1021:
02:afa3 : 18 __ __ CLC
02:afa4 : 69 02 __ ADC #$02
02:afa6 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:afa9 : 90 01 __ BCC $afac ; (palette_draw.s1023 + 0)
.s1022:
02:afab : e8 __ __ INX
.s1023:
02:afac : 8e f0 82 STX $82f0 ; (rowsel + 1)
02:afaf : ad cc 88 LDA $88cc ; (palettechar + 0)
02:afb2 : 29 1f __ AND #$1f
02:afb4 : 8d f1 82 STA $82f1 ; (colsel + 0)
.s24:
02:afb7 : a9 00 __ LDA #$00
02:afb9 : 85 55 __ STA T3 + 0 
02:afbb : 85 56 __ STA T5 + 0 
02:afbd : 85 58 __ STA T6 + 0 
02:afbf : a9 0c __ LDA #$0c
02:afc1 : 85 57 __ STA T5 + 1 
02:afc3 : a9 02 __ LDA #$02
02:afc5 : 85 0e __ STA P1 
02:afc7 : 18 __ __ CLC
.l1014:
02:afc8 : a6 58 __ LDX T6 + 0 
02:afca : bd b8 88 LDA $88b8,x ; (favourites + 0)
02:afcd : 85 0f __ STA P2 
02:afcf : a5 52 __ LDA T0 + 0 
02:afd1 : 69 2d __ ADC #$2d
02:afd3 : 85 0d __ STA P0 
02:afd5 : bd b9 88 LDA $88b9,x ; (favourites + 1)
02:afd8 : 4a __ __ LSR
02:afd9 : a9 00 __ LDA #$00
02:afdb : 6a __ __ ROR
02:afdc : 65 53 __ ADC T1 + 0 
02:afde : 85 10 __ STA P3 
02:afe0 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
02:afe3 : e6 58 __ INC T6 + 0 
02:afe5 : e6 58 __ INC T6 + 0 
02:afe7 : e6 52 __ INC T0 + 0 
02:afe9 : a5 52 __ LDA T0 + 0 
02:afeb : c9 0a __ CMP #$0a
02:afed : 90 d9 __ BCC $afc8 ; (palette_draw.l1014 + 0)
.s7:
02:afef : a5 53 __ LDA T1 + 0 
02:aff1 : 69 7f __ ADC #$7f
02:aff3 : 85 52 __ STA T0 + 0 
02:aff5 : a9 00 __ LDA #$00
02:aff7 : 85 59 __ STA T8 + 0 
02:aff9 : 18 __ __ CLC
02:affa : a9 00 __ LDA #$00
.l9:
02:affc : 69 0d __ ADC #$0d
02:affe : 85 5a __ STA T9 + 0 
02:b000 : 18 __ __ CLC
02:b001 : 69 f7 __ ADC #$f7
02:b003 : 85 5b __ STA T10 + 0 
02:b005 : a9 00 __ LDA #$00
02:b007 : 85 5c __ STA T11 + 0 
02:b009 : a5 54 __ LDA T2 + 0 
02:b00b : d0 3e __ BNE $b04b ; (palette_draw.l13 + 0)
.s62:
02:b00d : 18 __ __ CLC
.l1016:
02:b00e : a5 5b __ LDA T10 + 0 
02:b010 : 85 0e __ STA P1 
02:b012 : a5 55 __ LDA T3 + 0 
02:b014 : 85 0f __ STA P2 
02:b016 : a5 53 __ LDA T1 + 0 
02:b018 : 85 10 __ STA P3 
02:b01a : a5 5c __ LDA T11 + 0 
02:b01c : 69 2d __ ADC #$2d
02:b01e : 85 0d __ STA P0 
02:b020 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
02:b023 : a5 5a __ LDA T9 + 0 
02:b025 : 85 0e __ STA P1 
02:b027 : a5 52 __ LDA T0 + 0 
02:b029 : 85 10 __ STA P3 
02:b02b : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
02:b02e : e6 55 __ INC T3 + 0 
02:b030 : e6 5c __ INC T11 + 0 
02:b032 : a5 5c __ LDA T11 + 0 
02:b034 : c9 20 __ CMP #$20
02:b036 : 90 d6 __ BCC $b00e ; (palette_draw.l1016 + 0)
.s191:
02:b038 : e6 59 __ INC T8 + 0 
02:b03a : a5 59 __ LDA T8 + 0 
02:b03c : c9 08 __ CMP #$08
02:b03e : 90 bc __ BCC $affc ; (palette_draw.l9 + 0)
.s1001:
02:b040 : a2 09 __ LDX #$09
02:b042 : bd df ab LDA $abdf,x ; (vp_fill + 18)
02:b045 : 95 53 __ STA T1 + 0,x 
02:b047 : ca __ __ DEX
02:b048 : 10 f8 __ BPL $b042 ; (palette_draw.s1001 + 2)
02:b04a : 60 __ __ RTS
.l13:
02:b04b : a5 5b __ LDA T10 + 0 
02:b04d : 85 0e __ STA P1 
02:b04f : a5 53 __ LDA T1 + 0 
02:b051 : 85 10 __ STA P3 
02:b053 : 18 __ __ CLC
02:b054 : a5 5c __ LDA T11 + 0 
02:b056 : 69 2d __ ADC #$2d
02:b058 : 85 0d __ STA P0 
02:b05a : a0 00 __ LDY #$00
02:b05c : b1 56 __ LDA (T5 + 0),y 
02:b05e : 85 0f __ STA P2 
02:b060 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
02:b063 : a5 5a __ LDA T9 + 0 
02:b065 : 85 0e __ STA P1 
02:b067 : a5 52 __ LDA T0 + 0 
02:b069 : 85 10 __ STA P3 
02:b06b : a0 00 __ LDY #$00
02:b06d : b1 56 __ LDA (T5 + 0),y 
02:b06f : 85 0f __ STA P2 
02:b071 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
02:b074 : a5 56 __ LDA T5 + 0 
02:b076 : 85 1b __ STA ACCU + 0 
02:b078 : 18 __ __ CLC
02:b079 : 69 01 __ ADC #$01
02:b07b : 85 56 __ STA T5 + 0 
02:b07d : a5 57 __ LDA T5 + 1 
02:b07f : 85 1c __ STA ACCU + 1 
02:b081 : 69 00 __ ADC #$00
02:b083 : 85 57 __ STA T5 + 1 
02:b085 : a0 00 __ LDY #$00
02:b087 : b1 1b __ LDA (ACCU + 0),y 
02:b089 : cd cc 88 CMP $88cc ; (palettechar + 0)
02:b08c : d0 33 __ BNE $b0c1 ; (palette_draw.s49 + 0)
.s19:
02:b08e : 8c f2 82 STY $82f2 ; (colsel + 1)
02:b091 : a5 5c __ LDA T11 + 0 
02:b093 : 8d f1 82 STA $82f1 ; (colsel + 0)
02:b096 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
02:b099 : 0a __ __ ASL
02:b09a : 85 1b __ STA ACCU + 0 
02:b09c : 98 __ __ TYA
02:b09d : 2a __ __ ROL
02:b09e : 06 1b __ ASL ACCU + 0 
02:b0a0 : 2a __ __ ROL
02:b0a1 : 06 1b __ ASL ACCU + 0 
02:b0a3 : 2a __ __ ROL
02:b0a4 : aa __ __ TAX
02:b0a5 : 18 __ __ CLC
02:b0a6 : a5 1b __ LDA ACCU + 0 
02:b0a8 : 6d 96 87 ADC $8796 ; (plotaltchar + 0)
02:b0ab : 85 58 __ STA T6 + 0 
02:b0ad : 90 01 __ BCC $b0b0 ; (palette_draw.s1025 + 0)
.s1024:
02:b0af : e8 __ __ INX
.s1025:
02:b0b0 : a4 59 __ LDY T8 + 0 
02:b0b2 : c8 __ __ INY
02:b0b3 : c8 __ __ INY
02:b0b4 : 98 __ __ TYA
02:b0b5 : 18 __ __ CLC
02:b0b6 : 65 58 __ ADC T6 + 0 
02:b0b8 : 8d ef 82 STA $82ef ; (rowsel + 0)
02:b0bb : 90 01 __ BCC $b0be ; (palette_draw.s1027 + 0)
.s1026:
02:b0bd : e8 __ __ INX
.s1027:
02:b0be : 8e f0 82 STX $82f0 ; (rowsel + 1)
.s49:
02:b0c1 : e6 55 __ INC T3 + 0 
02:b0c3 : e6 5c __ INC T11 + 0 
02:b0c5 : a5 5c __ LDA T11 + 0 
02:b0c7 : c9 20 __ CMP #$20
02:b0c9 : 90 80 __ BCC $b04b ; (palette_draw.l13 + 0)
02:b0cb : 4c 38 b0 JMP $b038 ; (palette_draw.s191 + 0)
--------------------------------------------------------------------
palette_returnscreencode: ; palette_returnscreencode()->void
.s0:
02:b0ce : ad ef 82 LDA $82ef ; (rowsel + 0)
02:b0d1 : 0d f0 82 ORA $82f0 ; (rowsel + 1)
02:b0d4 : d0 14 __ BNE $b0ea ; (palette_returnscreencode.s3 + 0)
.s1:
02:b0d6 : ad f1 82 LDA $82f1 ; (colsel + 0)
02:b0d9 : 0a __ __ ASL
02:b0da : aa __ __ TAX
02:b0db : bd b8 88 LDA $88b8,x ; (favourites + 0)
02:b0de : 8d cc 88 STA $88cc ; (palettechar + 0)
02:b0e1 : bd b9 88 LDA $88b9,x ; (favourites + 1)
02:b0e4 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
02:b0e7 : 4c 17 b1 JMP $b117 ; (palette_returnscreencode.s6 + 0)
.s3:
02:b0ea : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:b0ed : d0 34 __ BNE $b123 ; (palette_returnscreencode.s11 + 0)
.s1004:
02:b0ef : a9 01 __ LDA #$01
02:b0f1 : cd ef 82 CMP $82ef ; (rowsel + 0)
02:b0f4 : b0 21 __ BCS $b117 ; (palette_returnscreencode.s6 + 0)
.s7:
02:b0f6 : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:b0f9 : d0 28 __ BNE $b123 ; (palette_returnscreencode.s11 + 0)
.s1003:
02:b0fb : ad ef 82 LDA $82ef ; (rowsel + 0)
02:b0fe : c9 0a __ CMP #$0a
02:b100 : b0 15 __ BCS $b117 ; (palette_returnscreencode.s6 + 0)
.s4:
02:b102 : a9 00 __ LDA #$00
02:b104 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
02:b107 : 85 1c __ STA ACCU + 1 
02:b109 : ae ef 82 LDX $82ef ; (rowsel + 0)
02:b10c : bd 6c 80 LDA $806c,x ; (__multab32L + 0)
02:b10f : 38 __ __ SEC
02:b110 : e9 40 __ SBC #$40
02:b112 : 85 1b __ STA ACCU + 0 
02:b114 : 4c 47 b1 JMP $b147 ; (palette_returnscreencode.s18 + 0)
.s6:
02:b117 : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:b11a : d0 07 __ BNE $b123 ; (palette_returnscreencode.s11 + 0)
.s1002:
02:b11c : a9 0a __ LDA #$0a
02:b11e : cd ef 82 CMP $82ef ; (rowsel + 0)
02:b121 : b0 45 __ BCS $b168 ; (palette_returnscreencode.s1001 + 0)
.s11:
02:b123 : a9 01 __ LDA #$01
02:b125 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
02:b128 : ad ef 82 LDA $82ef ; (rowsel + 0)
02:b12b : 85 1c __ STA ACCU + 1 
02:b12d : ad f0 82 LDA $82f0 ; (rowsel + 1)
02:b130 : 4a __ __ LSR
02:b131 : 66 1c __ ROR ACCU + 1 
02:b133 : 6a __ __ ROR
02:b134 : 66 1c __ ROR ACCU + 1 
02:b136 : 6a __ __ ROR
02:b137 : 66 1c __ ROR ACCU + 1 
02:b139 : 29 c0 __ AND #$c0
02:b13b : 6a __ __ ROR
02:b13c : 38 __ __ SEC
02:b13d : e9 60 __ SBC #$60
02:b13f : 85 1b __ STA ACCU + 0 
02:b141 : a5 1c __ LDA ACCU + 1 
02:b143 : e9 01 __ SBC #$01
02:b145 : 85 1c __ STA ACCU + 1 
.s18:
02:b147 : ad fe 7b LDA $7bfe ; (visualmap + 0)
02:b14a : d0 09 __ BNE $b155 ; (palette_returnscreencode.s8 + 0)
.s9:
02:b14c : ad f1 82 LDA $82f1 ; (colsel + 0)
02:b14f : 18 __ __ CLC
02:b150 : 65 1b __ ADC ACCU + 0 
02:b152 : 4c 65 b1 JMP $b165 ; (palette_returnscreencode.s20 + 0)
.s8:
02:b155 : ad f2 82 LDA $82f2 ; (colsel + 1)
02:b158 : 18 __ __ CLC
02:b159 : 69 0c __ ADC #$0c
02:b15b : 18 __ __ CLC
02:b15c : 65 1c __ ADC ACCU + 1 
02:b15e : 85 1c __ STA ACCU + 1 
02:b160 : ac f1 82 LDY $82f1 ; (colsel + 0)
02:b163 : b1 1b __ LDA (ACCU + 0),y 
.s20:
02:b165 : 8d cc 88 STA $88cc ; (palettechar + 0)
.s1001:
02:b168 : 60 __ __ RTS
--------------------------------------------------------------------
02:b169 : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
writemode: ; writemode()->void
.s1000:
02:b16e : a5 53 __ LDA T2 + 0 
02:b170 : 8d b4 ab STA $abb4 ; (projbuffer + 28)
.s0:
02:b173 : a2 ff __ LDX #$ff
.l1002:
02:b175 : e8 __ __ INX
02:b176 : bd e4 b3 LDA $b3e4,x 
02:b179 : 9d f4 87 STA $87f4,x ; (programmode + 0)
02:b17c : d0 f7 __ BNE $b175 ; (writemode.l1002 + 0)
.l161:
02:b17e : ad ff 87 LDA $87ff ; (showbar + 0)
02:b181 : f0 03 __ BEQ $b186 ; (writemode.s5 + 0)
.s3:
02:b183 : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s5:
02:b186 : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
02:b189 : 85 53 __ STA T2 + 0 
02:b18b : c9 8b __ CMP #$8b
02:b18d : d0 06 __ BNE $b195 ; (writemode.s62 + 0)
.s26:
02:b18f : 20 4f 50 JSR $504f ; (togglestatusbar.s0 + 0)
02:b192 : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s62:
02:b195 : b0 03 __ BCS $b19a ; (writemode.s63 + 0)
02:b197 : 4c d9 b2 JMP $b2d9 ; (writemode.s64 + 0)
.s63:
02:b19a : c9 98 __ CMP #$98
02:b19c : d0 05 __ BNE $b1a3 ; (writemode.s90 + 0)
.s42:
02:b19e : a9 01 __ LDA #$01
02:b1a0 : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s90:
02:b1a3 : b0 03 __ BCS $b1a8 ; (writemode.s91 + 0)
02:b1a5 : 4c 9b b2 JMP $b29b ; (writemode.s92 + 0)
.s91:
02:b1a8 : c9 9c __ CMP #$9c
02:b1aa : d0 05 __ BNE $b1b1 ; (writemode.s104 + 0)
.s34:
02:b1ac : a9 0b __ LDA #$0b
02:b1ae : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s104:
02:b1b1 : b0 03 __ BCS $b1b6 ; (writemode.s105 + 0)
02:b1b3 : 4c 83 b2 JMP $b283 ; (writemode.s106 + 0)
.s105:
02:b1b6 : c9 9e __ CMP #$9e
02:b1b8 : d0 05 __ BNE $b1bf ; (writemode.s110 + 0)
.s37:
02:b1ba : a9 0d __ LDA #$0d
02:b1bc : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s110:
02:b1bf : b0 09 __ BCS $b1ca ; (writemode.s111 + 0)
.s7:
02:b1c1 : 8d fc ab STA $abfc ; (sstack + 9)
02:b1c4 : 20 6d 41 JSR $416d ; (plotmove.s1000 + 0)
02:b1c7 : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s111:
02:b1ca : c9 9f __ CMP #$9f
02:b1cc : d0 05 __ BNE $b1d3 ; (writemode.s47 + 0)
.s33:
02:b1ce : a9 07 __ LDA #$07
02:b1d0 : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s47:
02:b1d3 : c9 20 __ CMP #$20
02:b1d5 : b0 03 __ BCS $b1da ; (writemode.s52 + 0)
02:b1d7 : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s52:
02:b1da : 09 00 __ ORA #$00
02:b1dc : 10 04 __ BPL $b1e2 ; (writemode.s48 + 0)
.s51:
02:b1de : c9 a0 __ CMP #$a0
02:b1e0 : 90 79 __ BCC $b25b ; (writemode.s6 + 0)
.s48:
02:b1e2 : ad fe 69 LDA $69fe ; (undoenabled + 0)
02:b1e5 : c9 01 __ CMP #$01
02:b1e7 : d0 1a __ BNE $b203 ; (writemode.s58 + 0)
.s53:
02:b1e9 : 85 18 __ STA P11 
02:b1eb : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b1ee : ad cf 87 LDA $87cf ; (canvas + 9)
02:b1f1 : 18 __ __ CLC
02:b1f2 : 6d 8e 87 ADC $878e ; (screen_row + 0)
02:b1f5 : 85 16 __ STA P9 
02:b1f7 : ad cd 87 LDA $87cd ; (canvas + 7)
02:b1fa : 18 __ __ CLC
02:b1fb : 6d 8c 87 ADC $878c ; (screen_col + 0)
02:b1fe : 85 17 __ STA P10 
02:b200 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s58:
02:b203 : a5 53 __ LDA T2 + 0 
02:b205 : 20 7a 35 JSR $357a ; (pet2screen.s0 + 0)
02:b208 : 85 12 __ STA P5 
02:b20a : ad cf 87 LDA $87cf ; (canvas + 9)
02:b20d : 18 __ __ CLC
02:b20e : 6d 8e 87 ADC $878e ; (screen_row + 0)
02:b211 : 85 10 __ STA P3 
02:b213 : ad cd 87 LDA $87cd ; (canvas + 7)
02:b216 : 18 __ __ CLC
02:b217 : 6d 8c 87 ADC $878c ; (screen_col + 0)
02:b21a : 85 11 __ STA P4 
02:b21c : ad 95 87 LDA $8795 ; (plotblink + 0)
02:b21f : 0a __ __ ASL
02:b220 : 0a __ __ ASL
02:b221 : 0a __ __ ASL
02:b222 : 0a __ __ ASL
02:b223 : 18 __ __ CLC
02:b224 : 6d 92 87 ADC $8792 ; (plotcolor + 0)
02:b227 : 85 43 __ STA T0 + 0 
02:b229 : ad 94 87 LDA $8794 ; (plotunderline + 0)
02:b22c : 4a __ __ LSR
02:b22d : 6a __ __ ROR
02:b22e : 6a __ __ ROR
02:b22f : 29 c0 __ AND #$c0
02:b231 : 6a __ __ ROR
02:b232 : 65 43 __ ADC T0 + 0 
02:b234 : 85 43 __ STA T0 + 0 
02:b236 : ad 93 87 LDA $8793 ; (plotreverse + 0)
02:b239 : 4a __ __ LSR
02:b23a : 6a __ __ ROR
02:b23b : 29 80 __ AND #$80
02:b23d : 6a __ __ ROR
02:b23e : 65 43 __ ADC T0 + 0 
02:b240 : 85 43 __ STA T0 + 0 
02:b242 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
02:b245 : 4a __ __ LSR
02:b246 : a9 00 __ LDA #$00
02:b248 : 6a __ __ ROR
02:b249 : 65 43 __ ADC T0 + 0 
02:b24b : 85 13 __ STA P6 
02:b24d : 20 2b 54 JSR $542b ; (screenmapplot.s0 + 0)
02:b250 : a9 1d __ LDA #$1d
02:b252 : 8d fc ab STA $abfc ; (sstack + 9)
02:b255 : 20 6d 41 JSR $416d ; (plotmove.s1000 + 0)
02:b258 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
.s6:
02:b25b : a5 53 __ LDA T2 + 0 
02:b25d : c9 1b __ CMP #$1b
02:b25f : f0 07 __ BEQ $b268 ; (writemode.s2 + 0)
.s114:
02:b261 : c9 03 __ CMP #$03
02:b263 : f0 03 __ BEQ $b268 ; (writemode.s2 + 0)
02:b265 : 4c 7e b1 JMP $b17e ; (writemode.l161 + 0)
.s2:
02:b268 : a2 ff __ LDX #$ff
.l1004:
02:b26a : e8 __ __ INX
02:b26b : bd 69 b1 LDA $b169,x 
02:b26e : 9d f4 87 STA $87f4,x ; (programmode + 0)
02:b271 : d0 f7 __ BNE $b26a ; (writemode.l1004 + 0)
.s1001:
02:b273 : ad b4 ab LDA $abb4 ; (projbuffer + 28)
02:b276 : 85 53 __ STA T2 + 0 
02:b278 : 60 __ __ RTS
.s178:
02:b279 : 85 11 __ STA P4 
02:b27b : 20 f6 3d JSR $3df6 ; (change_plotcolor.s0 + 0)
.s1099:
02:b27e : a5 53 __ LDA T2 + 0 
02:b280 : 4c 61 b2 JMP $b261 ; (writemode.s114 + 0)
.s106:
02:b283 : c9 9a __ CMP #$9a
02:b285 : d0 04 __ BNE $b28b ; (writemode.s107 + 0)
.s44:
02:b287 : a9 03 __ LDA #$03
02:b289 : d0 ee __ BNE $b279 ; (writemode.s178 + 0)
.s107:
02:b28b : b0 0a __ BCS $b297 ; (writemode.s45 + 0)
.s43:
02:b28d : a9 05 __ LDA #$05
02:b28f : 85 11 __ STA P4 
02:b291 : 20 f6 3d JSR $3df6 ; (change_plotcolor.s0 + 0)
02:b294 : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s45:
02:b297 : a9 0e __ LDA #$0e
02:b299 : b0 de __ BCS $b279 ; (writemode.s178 + 0)
.s92:
02:b29b : c9 92 __ CMP #$92
02:b29d : f0 c2 __ BEQ $b261 ; (writemode.s114 + 0)
.s93:
02:b29f : 90 19 __ BCC $b2ba ; (writemode.s95 + 0)
.s94:
02:b2a1 : c9 96 __ CMP #$96
02:b2a3 : d0 04 __ BNE $b2a9 ; (writemode.s100 + 0)
.s40:
02:b2a5 : a9 09 __ LDA #$09
02:b2a7 : d0 d0 __ BNE $b279 ; (writemode.s178 + 0)
.s100:
02:b2a9 : b0 0b __ BCS $b2b6 ; (writemode.s41 + 0)
.s102:
02:b2ab : c9 95 __ CMP #$95
02:b2ad : f0 03 __ BEQ $b2b2 ; (writemode.s39 + 0)
02:b2af : 4c d3 b1 JMP $b1d3 ; (writemode.s47 + 0)
.s39:
02:b2b2 : a9 0c __ LDA #$0c
02:b2b4 : d0 c3 __ BNE $b279 ; (writemode.s178 + 0)
.s41:
02:b2b6 : a9 06 __ LDA #$06
02:b2b8 : b0 bf __ BCS $b279 ; (writemode.s178 + 0)
.s95:
02:b2ba : c9 90 __ CMP #$90
02:b2bc : d0 04 __ BNE $b2c2 ; (writemode.s96 + 0)
.s30:
02:b2be : a9 00 __ LDA #$00
02:b2c0 : f0 b7 __ BEQ $b279 ; (writemode.s178 + 0)
.s96:
02:b2c2 : 90 03 __ BCC $b2c7 ; (writemode.s98 + 0)
02:b2c4 : 4c c1 b1 JMP $b1c1 ; (writemode.s7 + 0)
.s98:
02:b2c7 : c9 8c __ CMP #$8c
02:b2c9 : f0 03 __ BEQ $b2ce ; (writemode.s27 + 0)
02:b2cb : 4c d3 b1 JMP $b1d3 ; (writemode.s47 + 0)
.s27:
02:b2ce : a9 04 __ LDA #$04
02:b2d0 : 8d f8 ab STA $abf8 ; (sstack + 5)
02:b2d3 : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
02:b2d6 : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s64:
02:b2d9 : c9 1f __ CMP #$1f
02:b2db : d0 04 __ BNE $b2e1 ; (writemode.s65 + 0)
.s36:
02:b2dd : a9 02 __ LDA #$02
02:b2df : d0 98 __ BNE $b279 ; (writemode.s178 + 0)
.s65:
02:b2e1 : b0 03 __ BCS $b2e6 ; (writemode.s66 + 0)
02:b2e3 : 4c 64 b3 JMP $b364 ; (writemode.s67 + 0)
.s66:
02:b2e6 : c9 87 __ CMP #$87
02:b2e8 : d0 0b __ BNE $b2f5 ; (writemode.s80 + 0)
.s10:
02:b2ea : a9 00 __ LDA #$00
02:b2ec : cd 93 87 CMP $8793 ; (plotreverse + 0)
02:b2ef : 2a __ __ ROL
02:b2f0 : 8d 93 87 STA $8793 ; (plotreverse + 0)
02:b2f3 : 90 41 __ BCC $b336 ; (writemode.s177 + 0)
.s80:
02:b2f5 : 90 45 __ BCC $b33c ; (writemode.s82 + 0)
.s81:
02:b2f7 : c9 89 __ CMP #$89
02:b2f9 : d0 18 __ BNE $b313 ; (writemode.s87 + 0)
.s16:
02:b2fb : ad fe 69 LDA $69fe ; (undoenabled + 0)
02:b2fe : c9 01 __ CMP #$01
02:b300 : f0 03 __ BEQ $b305 ; (writemode.s20 + 0)
02:b302 : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s20:
02:b305 : ad e0 87 LDA $87e0 ; (undo_undopossible + 0)
02:b308 : d0 03 __ BNE $b30d ; (writemode.s17 + 0)
02:b30a : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s17:
02:b30d : 20 9e 54 JSR $549e ; (undo_performundo.s1000 + 0)
02:b310 : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s87:
02:b313 : 90 18 __ BCC $b32d ; (writemode.s11 + 0)
.s21:
02:b315 : ad fe 69 LDA $69fe ; (undoenabled + 0)
02:b318 : c9 01 __ CMP #$01
02:b31a : f0 03 __ BEQ $b31f ; (writemode.s25 + 0)
02:b31c : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s25:
02:b31f : ad e1 87 LDA $87e1 ; (undo_redopossible + 0)
02:b322 : d0 03 __ BNE $b327 ; (writemode.s22 + 0)
02:b324 : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s22:
02:b327 : 20 62 57 JSR $5762 ; (undo_performredo.s1000 + 0)
02:b32a : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s11:
02:b32d : a9 00 __ LDA #$00
02:b32f : cd 96 87 CMP $8796 ; (plotaltchar + 0)
02:b332 : 2a __ __ ROL
02:b333 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
.s177:
02:b336 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
02:b339 : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s82:
02:b33c : c9 85 __ CMP #$85
02:b33e : d0 0b __ BNE $b34b ; (writemode.s83 + 0)
.s8:
02:b340 : a9 00 __ LDA #$00
02:b342 : cd 95 87 CMP $8795 ; (plotblink + 0)
02:b345 : 2a __ __ ROL
02:b346 : 8d 95 87 STA $8795 ; (plotblink + 0)
02:b349 : 90 eb __ BCC $b336 ; (writemode.s177 + 0)
.s83:
02:b34b : b0 0c __ BCS $b359 ; (writemode.s9 + 0)
.s85:
02:b34d : c9 81 __ CMP #$81
02:b34f : f0 03 __ BEQ $b354 ; (writemode.s38 + 0)
02:b351 : 4c d3 b1 JMP $b1d3 ; (writemode.s47 + 0)
.s38:
02:b354 : a9 0a __ LDA #$0a
02:b356 : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s9:
02:b359 : a9 00 __ LDA #$00
02:b35b : cd 94 87 CMP $8794 ; (plotunderline + 0)
02:b35e : 2a __ __ ROL
02:b35f : 8d 94 87 STA $8794 ; (plotunderline + 0)
02:b362 : 90 d2 __ BCC $b336 ; (writemode.s177 + 0)
.s67:
02:b364 : c9 14 __ CMP #$14
02:b366 : f0 3b __ BEQ $b3a3 ; (writemode.s12 + 0)
.s68:
02:b368 : b0 1f __ BCS $b389 ; (writemode.s69 + 0)
.s70:
02:b36a : c9 11 __ CMP #$11
02:b36c : d0 03 __ BNE $b371 ; (writemode.s71 + 0)
02:b36e : 4c c1 b1 JMP $b1c1 ; (writemode.s7 + 0)
.s71:
02:b371 : b0 0c __ BCS $b37f ; (writemode.s72 + 0)
.s73:
02:b373 : c9 05 __ CMP #$05
02:b375 : f0 03 __ BEQ $b37a ; (writemode.s31 + 0)
02:b377 : 4c d3 b1 JMP $b1d3 ; (writemode.s47 + 0)
.s31:
02:b37a : a9 0f __ LDA #$0f
02:b37c : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s72:
02:b37f : c9 12 __ CMP #$12
02:b381 : d0 03 __ BNE $b386 ; (writemode.s72 + 7)
02:b383 : 4c 61 b2 JMP $b261 ; (writemode.s114 + 0)
02:b386 : 4c d3 b1 JMP $b1d3 ; (writemode.s47 + 0)
.s69:
02:b389 : c9 1d __ CMP #$1d
02:b38b : d0 03 __ BNE $b390 ; (writemode.s76 + 0)
02:b38d : 4c c1 b1 JMP $b1c1 ; (writemode.s7 + 0)
.s76:
02:b390 : b0 0c __ BCS $b39e ; (writemode.s35 + 0)
.s78:
02:b392 : c9 1c __ CMP #$1c
02:b394 : f0 03 __ BEQ $b399 ; (writemode.s32 + 0)
02:b396 : 4c d3 b1 JMP $b1d3 ; (writemode.s47 + 0)
.s32:
02:b399 : a9 08 __ LDA #$08
02:b39b : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s35:
02:b39e : a9 04 __ LDA #$04
02:b3a0 : 4c 79 b2 JMP $b279 ; (writemode.s178 + 0)
.s12:
02:b3a3 : ad fe 69 LDA $69fe ; (undoenabled + 0)
02:b3a6 : c9 01 __ CMP #$01
02:b3a8 : d0 1a __ BNE $b3c4 ; (writemode.s15 + 0)
.s13:
02:b3aa : 85 18 __ STA P11 
02:b3ac : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b3af : ad cf 87 LDA $87cf ; (canvas + 9)
02:b3b2 : 18 __ __ CLC
02:b3b3 : 6d 8e 87 ADC $878e ; (screen_row + 0)
02:b3b6 : 85 16 __ STA P9 
02:b3b8 : ad cd 87 LDA $87cd ; (canvas + 7)
02:b3bb : 18 __ __ CLC
02:b3bc : 6d 8c 87 ADC $878c ; (screen_col + 0)
02:b3bf : 85 17 __ STA P10 
02:b3c1 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s15:
02:b3c4 : a9 20 __ LDA #$20
02:b3c6 : 85 12 __ STA P5 
02:b3c8 : a9 0f __ LDA #$0f
02:b3ca : 85 13 __ STA P6 
02:b3cc : ad cf 87 LDA $87cf ; (canvas + 9)
02:b3cf : 18 __ __ CLC
02:b3d0 : 6d 8e 87 ADC $878e ; (screen_row + 0)
02:b3d3 : 85 10 __ STA P3 
02:b3d5 : ad cd 87 LDA $87cd ; (canvas + 7)
02:b3d8 : 18 __ __ CLC
02:b3d9 : 6d 8c 87 ADC $878c ; (screen_col + 0)
02:b3dc : 85 11 __ STA P4 
02:b3de : 20 2b 54 JSR $542b ; (screenmapplot.s0 + 0)
02:b3e1 : 4c 36 b3 JMP $b336 ; (writemode.s177 + 0)
--------------------------------------------------------------------
02:b3e4 : __ __ __ BYT 77 52 49 54 45 00                               : wRITE.
--------------------------------------------------------------------
colorwrite: ; colorwrite()->void
.s1000:
02:b3ea : a2 09 __ LDX #$09
02:b3ec : b5 53 __ LDA T0 + 0,x 
02:b3ee : 9d a9 ab STA $aba9,x ; (chareditor@stack + 25)
02:b3f1 : ca __ __ DEX
02:b3f2 : 10 f8 __ BPL $b3ec ; (colorwrite.s1000 + 2)
.s0:
02:b3f4 : a2 ff __ LDX #$ff
.l1002:
02:b3f6 : e8 __ __ INX
02:b3f7 : bd d5 b5 LDA $b5d5,x 
02:b3fa : 9d f4 87 STA $87f4,x ; (programmode + 0)
02:b3fd : d0 f7 __ BNE $b3f6 ; (colorwrite.l1002 + 0)
.l98:
02:b3ff : ad ff 87 LDA $87ff ; (showbar + 0)
02:b402 : f0 03 __ BEQ $b407 ; (colorwrite.s5 + 0)
.s3:
02:b404 : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s5:
02:b407 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
02:b40a : a5 1b __ LDA ACCU + 0 
02:b40c : 85 53 __ STA T0 + 0 
02:b40e : a9 7f __ LDA #$7f
02:b410 : 85 0d __ STA P0 
02:b412 : ad 8c 87 LDA $878c ; (screen_col + 0)
02:b415 : 85 54 __ STA T1 + 0 
02:b417 : ad 8d 87 LDA $878d ; (screen_col + 1)
02:b41a : 85 55 __ STA T1 + 1 
02:b41c : ad c9 87 LDA $87c9 ; (canvas + 3)
02:b41f : 85 03 __ STA WORK + 0 
02:b421 : 18 __ __ CLC
02:b422 : 65 54 __ ADC T1 + 0 
02:b424 : 85 58 __ STA T4 + 0 
02:b426 : ad ca 87 LDA $87ca ; (canvas + 4)
02:b429 : 85 04 __ STA WORK + 1 
02:b42b : 65 55 __ ADC T1 + 1 
02:b42d : 85 59 __ STA T4 + 1 
02:b42f : ad cf 87 LDA $87cf ; (canvas + 9)
02:b432 : 18 __ __ CLC
02:b433 : 6d 8e 87 ADC $878e ; (screen_row + 0)
02:b436 : 85 5a __ STA T5 + 0 
02:b438 : 85 1b __ STA ACCU + 0 
02:b43a : ad d0 87 LDA $87d0 ; (canvas + 10)
02:b43d : 6d 8f 87 ADC $878f ; (screen_row + 1)
02:b440 : 85 1c __ STA ACCU + 1 
02:b442 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b445 : 18 __ __ CLC
02:b446 : a5 06 __ LDA WORK + 3 
02:b448 : 69 58 __ ADC #$58
02:b44a : 85 5c __ STA T6 + 1 
02:b44c : a5 05 __ LDA WORK + 2 
02:b44e : 85 5b __ STA T6 + 0 
02:b450 : 18 __ __ CLC
02:b451 : 65 58 __ ADC T4 + 0 
02:b453 : 85 58 __ STA T4 + 0 
02:b455 : a5 5c __ LDA T6 + 1 
02:b457 : 65 59 __ ADC T4 + 1 
02:b459 : 85 59 __ STA T4 + 1 
02:b45b : ad cb 87 LDA $87cb ; (canvas + 5)
02:b45e : 85 1b __ STA ACCU + 0 
02:b460 : ad cc 87 LDA $87cc ; (canvas + 6)
02:b463 : 85 1c __ STA ACCU + 1 
02:b465 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:b468 : 85 03 __ STA WORK + 0 
02:b46a : ad ca 87 LDA $87ca ; (canvas + 4)
02:b46d : 85 04 __ STA WORK + 1 
02:b46f : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b472 : a5 05 __ LDA WORK + 2 
02:b474 : 85 56 __ STA T3 + 0 
02:b476 : 18 __ __ CLC
02:b477 : 65 58 __ ADC T4 + 0 
02:b479 : a8 __ __ TAY
02:b47a : a5 06 __ LDA WORK + 3 
02:b47c : 85 57 __ STA T3 + 1 
02:b47e : 65 59 __ ADC T4 + 1 
02:b480 : aa __ __ TAX
02:b481 : 98 __ __ TYA
02:b482 : 18 __ __ CLC
02:b483 : 69 30 __ ADC #$30
02:b485 : 85 0e __ STA P1 
02:b487 : 90 01 __ BCC $b48a ; (colorwrite.s1054 + 0)
.s1053:
02:b489 : e8 __ __ INX
.s1054:
02:b48a : 86 0f __ STX P2 
02:b48c : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
02:b48f : a8 __ __ TAY
02:b490 : a5 53 __ LDA T0 + 0 
02:b492 : c9 89 __ CMP #$89
02:b494 : d0 03 __ BNE $b499 ; (colorwrite.s37 + 0)
02:b496 : 4c bd b5 JMP $b5bd ; (colorwrite.s11 + 0)
.s37:
02:b499 : b0 03 __ BCS $b49e ; (colorwrite.s38 + 0)
02:b49b : 4c 81 b5 JMP $b581 ; (colorwrite.s39 + 0)
.s38:
02:b49e : c9 8c __ CMP #$8c
02:b4a0 : d0 0b __ BNE $b4ad ; (colorwrite.s49 + 0)
.s25:
02:b4a2 : a9 04 __ LDA #$04
02:b4a4 : 8d f8 ab STA $abf8 ; (sstack + 5)
02:b4a7 : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
02:b4aa : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s49:
02:b4ad : b0 03 __ BCS $b4b2 ; (colorwrite.s50 + 0)
02:b4af : 4c 5f b5 JMP $b55f ; (colorwrite.s51 + 0)
.s50:
02:b4b2 : c9 91 __ CMP #$91
02:b4b4 : f0 04 __ BEQ $b4ba ; (colorwrite.s109 + 0)
.s53:
02:b4b6 : c9 9d __ CMP #$9d
02:b4b8 : d0 09 __ BNE $b4c3 ; (colorwrite.s27 + 0)
.s109:
02:b4ba : 8d fc ab STA $abfc ; (sstack + 9)
02:b4bd : 20 6d 41 JSR $416d ; (plotmove.s1000 + 0)
02:b4c0 : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s27:
02:b4c3 : c9 30 __ CMP #$30
02:b4c5 : 90 18 __ BCC $b4df ; (colorwrite.s57 + 0)
.s31:
02:b4c7 : c9 3a __ CMP #$3a
02:b4c9 : b0 06 __ BCS $b4d1 ; (colorwrite.s30 + 0)
.s28:
02:b4cb : 38 __ __ SEC
02:b4cc : e9 30 __ SBC #$30
02:b4ce : 4c 02 b5 JMP $b502 ; (colorwrite.s1052 + 0)
.s30:
02:b4d1 : c9 41 __ CMP #$41
02:b4d3 : 90 0a __ BCC $b4df ; (colorwrite.s57 + 0)
.s35:
02:b4d5 : c9 47 __ CMP #$47
02:b4d7 : b0 06 __ BCS $b4df ; (colorwrite.s57 + 0)
.s32:
02:b4d9 : 38 __ __ SEC
02:b4da : e9 37 __ SBC #$37
02:b4dc : 4c 02 b5 JMP $b502 ; (colorwrite.s1052 + 0)
.s57:
02:b4df : a5 53 __ LDA T0 + 0 
02:b4e1 : c9 1b __ CMP #$1b
02:b4e3 : f0 07 __ BEQ $b4ec ; (colorwrite.s2 + 0)
.s63:
02:b4e5 : c9 03 __ CMP #$03
02:b4e7 : f0 03 __ BEQ $b4ec ; (colorwrite.s2 + 0)
02:b4e9 : 4c ff b3 JMP $b3ff ; (colorwrite.l98 + 0)
.s2:
02:b4ec : a2 ff __ LDX #$ff
.l1004:
02:b4ee : e8 __ __ INX
02:b4ef : bd 69 b1 LDA $b169,x 
02:b4f2 : 9d f4 87 STA $87f4,x ; (programmode + 0)
02:b4f5 : d0 f7 __ BNE $b4ee ; (colorwrite.l1004 + 0)
.s1001:
02:b4f7 : a2 09 __ LDX #$09
02:b4f9 : bd a9 ab LDA $aba9,x ; (chareditor@stack + 25)
02:b4fc : 95 53 __ STA T0 + 0,x 
02:b4fe : ca __ __ DEX
02:b4ff : 10 f8 __ BPL $b4f9 ; (colorwrite.s1001 + 2)
02:b501 : 60 __ __ RTS
.s1052:
02:b502 : 85 58 __ STA T4 + 0 
02:b504 : 98 __ __ TYA
02:b505 : 29 f0 __ AND #$f0
02:b507 : 18 __ __ CLC
02:b508 : 65 58 __ ADC T4 + 0 
.s55:
02:b50a : 85 58 __ STA T4 + 0 
02:b50c : ad fe 69 LDA $69fe ; (undoenabled + 0)
02:b50f : c9 01 __ CMP #$01
02:b511 : d0 16 __ BNE $b529 ; (colorwrite.s60 + 0)
.s58:
02:b513 : a5 5a __ LDA T5 + 0 
02:b515 : 85 16 __ STA P9 
02:b517 : a9 01 __ LDA #$01
02:b519 : 85 18 __ STA P11 
02:b51b : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b51e : ad cd 87 LDA $87cd ; (canvas + 7)
02:b521 : 18 __ __ CLC
02:b522 : 65 54 __ ADC T1 + 0 
02:b524 : 85 17 __ STA P10 
02:b526 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s60:
02:b529 : a5 58 __ LDA T4 + 0 
02:b52b : 85 0f __ STA P2 
02:b52d : ad cd 87 LDA $87cd ; (canvas + 7)
02:b530 : 18 __ __ CLC
02:b531 : 65 54 __ ADC T1 + 0 
02:b533 : a8 __ __ TAY
02:b534 : ad ce 87 LDA $87ce ; (canvas + 8)
02:b537 : 65 55 __ ADC T1 + 1 
02:b539 : aa __ __ TAX
02:b53a : 98 __ __ TYA
02:b53b : 18 __ __ CLC
02:b53c : 65 5b __ ADC T6 + 0 
02:b53e : a8 __ __ TAY
02:b53f : 8a __ __ TXA
02:b540 : 65 5c __ ADC T6 + 1 
02:b542 : aa __ __ TAX
02:b543 : 98 __ __ TYA
02:b544 : 18 __ __ CLC
02:b545 : 65 56 __ ADC T3 + 0 
02:b547 : a8 __ __ TAY
02:b548 : 8a __ __ TXA
02:b549 : 65 57 __ ADC T3 + 1 
02:b54b : aa __ __ TAX
02:b54c : 98 __ __ TYA
02:b54d : 18 __ __ CLC
02:b54e : 69 30 __ ADC #$30
02:b550 : 85 0d __ STA P0 
02:b552 : 90 01 __ BCC $b555 ; (colorwrite.s1056 + 0)
.s1055:
02:b554 : e8 __ __ INX
.s1056:
02:b555 : 86 0e __ STX P1 
02:b557 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
02:b55a : a9 1d __ LDA #$1d
02:b55c : 4c ba b4 JMP $b4ba ; (colorwrite.s109 + 0)
.s51:
02:b55f : c9 8a __ CMP #$8a
02:b561 : d0 18 __ BNE $b57b ; (colorwrite.s24 + 0)
.s16:
02:b563 : ad fe 69 LDA $69fe ; (undoenabled + 0)
02:b566 : c9 01 __ CMP #$01
02:b568 : f0 03 __ BEQ $b56d ; (colorwrite.s20 + 0)
02:b56a : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s20:
02:b56d : ad e1 87 LDA $87e1 ; (undo_redopossible + 0)
02:b570 : d0 03 __ BNE $b575 ; (colorwrite.s17 + 0)
02:b572 : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s17:
02:b575 : 20 62 57 JSR $5762 ; (undo_performredo.s1000 + 0)
02:b578 : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s24:
02:b57b : 20 4f 50 JSR $504f ; (togglestatusbar.s0 + 0)
02:b57e : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s39:
02:b581 : c9 86 __ CMP #$86
02:b583 : d0 06 __ BNE $b58b ; (colorwrite.s40 + 0)
.s21:
02:b585 : 98 __ __ TYA
02:b586 : 49 20 __ EOR #$20
02:b588 : 4c 0a b5 JMP $b50a ; (colorwrite.s55 + 0)
.s40:
02:b58b : b0 20 __ BCS $b5ad ; (colorwrite.s41 + 0)
.s42:
02:b58d : c9 1d __ CMP #$1d
02:b58f : d0 03 __ BNE $b594 ; (colorwrite.s43 + 0)
02:b591 : 4c ba b4 JMP $b4ba ; (colorwrite.s109 + 0)
.s43:
02:b594 : b0 0a __ BCS $b5a0 ; (colorwrite.s44 + 0)
.s45:
02:b596 : c9 11 __ CMP #$11
02:b598 : f0 03 __ BEQ $b59d ; (colorwrite.s45 + 7)
02:b59a : 4c c3 b4 JMP $b4c3 ; (colorwrite.s27 + 0)
02:b59d : 4c ba b4 JMP $b4ba ; (colorwrite.s109 + 0)
.s44:
02:b5a0 : c9 85 __ CMP #$85
02:b5a2 : f0 03 __ BEQ $b5a7 ; (colorwrite.s10 + 0)
02:b5a4 : 4c c3 b4 JMP $b4c3 ; (colorwrite.s27 + 0)
.s10:
02:b5a7 : 98 __ __ TYA
02:b5a8 : 49 10 __ EOR #$10
02:b5aa : 4c 0a b5 JMP $b50a ; (colorwrite.s55 + 0)
.s41:
02:b5ad : c9 87 __ CMP #$87
02:b5af : f0 06 __ BEQ $b5b7 ; (colorwrite.s22 + 0)
.s23:
02:b5b1 : 98 __ __ TYA
02:b5b2 : 49 80 __ EOR #$80
02:b5b4 : 4c 0a b5 JMP $b50a ; (colorwrite.s55 + 0)
.s22:
02:b5b7 : 98 __ __ TYA
02:b5b8 : 49 40 __ EOR #$40
02:b5ba : 4c 0a b5 JMP $b50a ; (colorwrite.s55 + 0)
.s11:
02:b5bd : ad fe 69 LDA $69fe ; (undoenabled + 0)
02:b5c0 : c9 01 __ CMP #$01
02:b5c2 : f0 03 __ BEQ $b5c7 ; (colorwrite.s15 + 0)
02:b5c4 : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s15:
02:b5c7 : ad e0 87 LDA $87e0 ; (undo_undopossible + 0)
02:b5ca : d0 03 __ BNE $b5cf ; (colorwrite.s12 + 0)
02:b5cc : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
.s12:
02:b5cf : 20 9e 54 JSR $549e ; (undo_performundo.s1000 + 0)
02:b5d2 : 4c df b4 JMP $b4df ; (colorwrite.s57 + 0)
--------------------------------------------------------------------
02:b5d5 : __ __ __ BYT 63 4f 4c 4f 52 57 52 49 54 45 00                : cOLORWRITE.
--------------------------------------------------------------------
resizewidth: ; resizewidth()->void
.s1000:
02:b5e0 : a2 0d __ LDX #$0d
02:b5e2 : b5 53 __ LDA T0 + 0,x 
02:b5e4 : 9d 94 ab STA $ab94,x ; (tempfilename + 17)
02:b5e7 : ca __ __ DEX
02:b5e8 : 10 f8 __ BPL $b5e2 ; (resizewidth.s1000 + 2)
02:b5ea : 38 __ __ SEC
02:b5eb : a5 23 __ LDA SP + 0 
02:b5ed : e9 08 __ SBC #$08
02:b5ef : 85 23 __ STA SP + 0 
02:b5f1 : b0 02 __ BCS $b5f5 ; (resizewidth.s0 + 0)
02:b5f3 : c6 24 __ DEC SP + 1 
.s0:
02:b5f5 : a9 00 __ LDA #$00
02:b5f7 : 85 17 __ STA P10 
02:b5f9 : a9 14 __ LDA #$14
02:b5fb : 85 18 __ STA P11 
02:b5fd : a9 05 __ LDA #$05
02:b5ff : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b602 : a9 28 __ LDA #$28
02:b604 : 8d f4 ab STA $abf4 ; (sstack + 1)
02:b607 : a9 0c __ LDA #$0c
02:b609 : 8d f5 ab STA $abf5 ; (sstack + 2)
02:b60c : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
02:b60f : 8d b4 87 STA $87b4 ; (vdc_state + 7)
02:b612 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
02:b615 : a9 01 __ LDA #$01
02:b617 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
02:b61a : a9 a8 __ LDA #$a8
02:b61c : 85 13 __ STA P6 
02:b61e : a9 bb __ LDA #$bb
02:b620 : 85 14 __ STA P7 
02:b622 : 20 33 81 JSR $8133 ; (vdc_prints_attr@proxy + 0)
02:b625 : a9 00 __ LDA #$00
02:b627 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
02:b62a : a9 08 __ LDA #$08
02:b62c : 85 12 __ STA P5 
02:b62e : a9 bc __ LDA #$bc
02:b630 : 85 13 __ STA P6 
02:b632 : a9 bb __ LDA #$bb
02:b634 : 85 14 __ STA P7 
02:b636 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
02:b639 : 85 53 __ STA T0 + 0 
02:b63b : 85 15 __ STA P8 
02:b63d : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
02:b640 : a9 51 __ LDA #$51
02:b642 : a0 02 __ LDY #$02
02:b644 : 91 23 __ STA (SP + 0),y 
02:b646 : a9 89 __ LDA #$89
02:b648 : c8 __ __ INY
02:b649 : 91 23 __ STA (SP + 0),y 
02:b64b : a9 cd __ LDA #$cd
02:b64d : c8 __ __ INY
02:b64e : 91 23 __ STA (SP + 0),y 
02:b650 : a9 bb __ LDA #$bb
02:b652 : c8 __ __ INY
02:b653 : 91 23 __ STA (SP + 0),y 
02:b655 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:b658 : c8 __ __ INY
02:b659 : 91 23 __ STA (SP + 0),y 
02:b65b : ad ca 87 LDA $87ca ; (canvas + 4)
02:b65e : c8 __ __ INY
02:b65f : 91 23 __ STA (SP + 0),y 
02:b661 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
02:b664 : a9 15 __ LDA #$15
02:b666 : 85 16 __ STA P9 
02:b668 : a9 09 __ LDA #$09
02:b66a : 85 17 __ STA P10 
02:b66c : a9 51 __ LDA #$51
02:b66e : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b671 : a9 89 __ LDA #$89
02:b673 : 8d f4 ab STA $abf4 ; (sstack + 1)
02:b676 : a9 03 __ LDA #$03
02:b678 : 8d f5 ab STA $abf5 ; (sstack + 2)
02:b67b : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
02:b67e : a5 1c __ LDA ACCU + 1 
02:b680 : 30 04 __ BMI $b686 ; (resizewidth.s123 + 0)
.s1023:
02:b682 : 05 1b __ ORA ACCU + 0 
02:b684 : d0 06 __ BNE $b68c ; (resizewidth.s3 + 0)
.s123:
02:b686 : a9 00 __ LDA #$00
02:b688 : 85 59 __ STA T4 + 0 
02:b68a : f0 11 __ BEQ $b69d ; (resizewidth.s5 + 0)
.s3:
02:b68c : a9 a4 __ LDA #$a4
02:b68e : 85 0f __ STA P2 
02:b690 : a9 ab __ LDA #$ab
02:b692 : 85 10 __ STA P3 
02:b694 : 20 a3 80 JSR $80a3 ; (strtol@proxy + 0)
02:b697 : a5 1b __ LDA ACCU + 0 
02:b699 : 85 59 __ STA T4 + 0 
02:b69b : a5 1c __ LDA ACCU + 1 
.s5:
02:b69d : 85 5a __ STA T4 + 1 
02:b69f : 85 04 __ STA WORK + 1 
02:b6a1 : ad cb 87 LDA $87cb ; (canvas + 5)
02:b6a4 : 85 1b __ STA ACCU + 0 
02:b6a6 : ad cc 87 LDA $87cc ; (canvas + 6)
02:b6a9 : 85 1c __ STA ACCU + 1 
02:b6ab : a5 59 __ LDA T4 + 0 
02:b6ad : 85 03 __ STA WORK + 0 
02:b6af : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b6b2 : a5 05 __ LDA WORK + 2 
02:b6b4 : 0a __ __ ASL
02:b6b5 : aa __ __ TAX
02:b6b6 : a5 06 __ LDA WORK + 3 
02:b6b8 : 2a __ __ ROL
02:b6b9 : a8 __ __ TAY
02:b6ba : 8a __ __ TXA
02:b6bb : 18 __ __ CLC
02:b6bc : 69 30 __ ADC #$30
02:b6be : 85 54 __ STA T1 + 0 
02:b6c0 : 90 01 __ BCC $b6c3 ; (resizewidth.s1026 + 0)
.s1025:
02:b6c2 : c8 __ __ INY
.s1026:
02:b6c3 : 84 55 __ STY T1 + 1 
02:b6c5 : a9 77 __ LDA #$77
02:b6c7 : c5 55 __ CMP T1 + 1 
02:b6c9 : d0 04 __ BNE $b6cf ; (resizewidth.s1022 + 0)
.s1021:
02:b6cb : a9 ff __ LDA #$ff
02:b6cd : c5 54 __ CMP T1 + 0 
.s1022:
02:b6cf : 90 06 __ BCC $b6d7 ; (resizewidth.s6 + 0)
.s9:
02:b6d1 : a5 59 __ LDA T4 + 0 
02:b6d3 : 05 5a __ ORA T4 + 1 
02:b6d5 : d0 0c __ BNE $b6e3 ; (resizewidth.s7 + 0)
.s6:
02:b6d7 : 20 b5 81 JSR $81b5 ; (vdc_prints_attr@proxy + 0)
02:b6da : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
02:b6dd : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:b6e0 : 4c bb b7 JMP $b7bb ; (resizewidth.s1001 + 0)
.s7:
02:b6e3 : a9 00 __ LDA #$00
02:b6e5 : 85 58 __ STA T3 + 0 
02:b6e7 : a5 5a __ LDA T4 + 1 
02:b6e9 : cd ca 87 CMP $87ca ; (canvas + 4)
02:b6ec : d0 05 __ BNE $b6f3 ; (resizewidth.s1020 + 0)
.s1019:
02:b6ee : a5 59 __ LDA T4 + 0 
02:b6f0 : cd c9 87 CMP $87c9 ; (canvas + 3)
.s1020:
02:b6f3 : b0 25 __ BCS $b71a ; (resizewidth.s13 + 0)
.s11:
02:b6f5 : 20 9e 81 JSR $819e ; (vdc_prints_attr@proxy + 0)
02:b6f8 : e6 12 __ INC P5 
02:b6fa : 20 93 81 JSR $8193 ; (vdc_prints_attr@proxy + 0)
02:b6fd : a9 19 __ LDA #$19
02:b6ff : 8d f8 ab STA $abf8 ; (sstack + 5)
02:b702 : a9 0d __ LDA #$0d
02:b704 : 8d f9 ab STA $abf9 ; (sstack + 6)
02:b707 : a9 07 __ LDA #$07
02:b709 : 8d fa ab STA $abfa ; (sstack + 7)
02:b70c : a9 00 __ LDA #$00
02:b70e : 8d fb ab STA $abfb ; (sstack + 8)
02:b711 : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
02:b714 : a5 1b __ LDA ACCU + 0 
02:b716 : c9 01 __ CMP #$01
02:b718 : f0 06 __ BEQ $b720 ; (resizewidth.s16 + 0)
.s13:
02:b71a : ac c9 87 LDY $87c9 ; (canvas + 3)
02:b71d : 4c 71 b7 JMP $b771 ; (resizewidth.s1024 + 0)
.s16:
02:b720 : ad cc 87 LDA $87cc ; (canvas + 6)
02:b723 : d0 07 __ BNE $b72c ; (resizewidth.s70 + 0)
.s1016:
02:b725 : a9 01 __ LDA #$01
02:b727 : cd cb 87 CMP $87cb ; (canvas + 5)
02:b72a : b0 0f __ BCS $b73b ; (resizewidth.s22 + 0)
.s70:
02:b72c : a9 01 __ LDA #$01
02:b72e : 85 54 __ STA T1 + 0 
02:b730 : a9 00 __ LDA #$00
02:b732 : 85 55 __ STA T1 + 1 
02:b734 : a5 59 __ LDA T4 + 0 
02:b736 : 85 14 __ STA P7 
02:b738 : 4c 2d bb JMP $bb2d ; (resizewidth.l20 + 0)
.s22:
02:b73b : ad cb 87 LDA $87cb ; (canvas + 5)
02:b73e : 0d cc 87 ORA $87cc ; (canvas + 6)
02:b741 : f0 0d __ BEQ $b750 ; (resizewidth.s30 + 0)
.s69:
02:b743 : a9 00 __ LDA #$00
02:b745 : 85 54 __ STA T1 + 0 
02:b747 : 85 55 __ STA T1 + 1 
02:b749 : a5 59 __ LDA T4 + 0 
02:b74b : 85 14 __ STA P7 
02:b74d : 4c 4d ba JMP $ba4d ; (resizewidth.l28 + 0)
.s30:
02:b750 : a9 01 __ LDA #$01
02:b752 : 85 58 __ STA T3 + 0 
02:b754 : 38 __ __ SEC
02:b755 : a5 59 __ LDA T4 + 0 
02:b757 : e9 01 __ SBC #$01
02:b759 : aa __ __ TAX
02:b75a : a5 5a __ LDA T4 + 1 
02:b75c : e9 00 __ SBC #$00
02:b75e : ac c9 87 LDY $87c9 ; (canvas + 3)
02:b761 : cd 8d 87 CMP $878d ; (screen_col + 1)
02:b764 : d0 03 __ BNE $b769 ; (resizewidth.s1011 + 0)
.s1010:
02:b766 : ec 8c 87 CPX $878c ; (screen_col + 0)
.s1011:
02:b769 : b0 06 __ BCS $b771 ; (resizewidth.s1024 + 0)
.s35:
02:b76b : 8e 8c 87 STX $878c ; (screen_col + 0)
02:b76e : 8d 8d 87 STA $878d ; (screen_col + 1)
.s1024:
02:b771 : ad ca 87 LDA $87ca ; (canvas + 4)
02:b774 : c5 5a __ CMP T4 + 1 
02:b776 : d0 02 __ BNE $b77a ; (resizewidth.s1009 + 0)
.s1008:
02:b778 : c4 59 __ CPY T4 + 0 
.s1009:
02:b77a : 90 55 __ BCC $b7d1 ; (resizewidth.s38 + 0)
.s8:
02:b77c : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:b77f : a5 58 __ LDA T3 + 0 
02:b781 : c9 01 __ CMP #$01
02:b783 : d0 36 __ BNE $b7bb ; (resizewidth.s1001 + 0)
.s61:
02:b785 : a5 59 __ LDA T4 + 0 
02:b787 : 8d c9 87 STA $87c9 ; (canvas + 3)
02:b78a : a5 5a __ LDA T4 + 1 
02:b78c : 8d ca 87 STA $87ca ; (canvas + 4)
02:b78f : a9 00 __ LDA #$00
02:b791 : 8d cd 87 STA $87cd ; (canvas + 7)
02:b794 : 8d ce 87 STA $87ce ; (canvas + 8)
02:b797 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
02:b79a : 20 18 3d JSR $3d18 ; (placesignature.s1000 + 0)
02:b79d : a9 0f __ LDA #$0f
02:b79f : 8d b4 87 STA $87b4 ; (vdc_state + 7)
02:b7a2 : 20 98 2c JSR $2c98 ; (vdc_cls.s0 + 0)
02:b7a5 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
02:b7a8 : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
02:b7ab : ad ff 87 LDA $87ff ; (showbar + 0)
02:b7ae : f0 03 __ BEQ $b7b3 ; (resizewidth.s173 + 0)
.s64:
02:b7b0 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s173:
02:b7b3 : a9 00 __ LDA #$00
02:b7b5 : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
02:b7b8 : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
.s1001:
02:b7bb : 18 __ __ CLC
02:b7bc : a5 23 __ LDA SP + 0 
02:b7be : 69 08 __ ADC #$08
02:b7c0 : 85 23 __ STA SP + 0 
02:b7c2 : 90 02 __ BCC $b7c6 ; (resizewidth.s1001 + 11)
02:b7c4 : e6 24 __ INC SP + 1 
02:b7c6 : a2 0d __ LDX #$0d
02:b7c8 : bd 94 ab LDA $ab94,x ; (tempfilename + 17)
02:b7cb : 95 53 __ STA T0 + 0,x 
02:b7cd : ca __ __ DEX
02:b7ce : 10 f8 __ BPL $b7c8 ; (resizewidth.s1001 + 13)
02:b7d0 : 60 __ __ RTS
.s38:
02:b7d1 : ad cb 87 LDA $87cb ; (canvas + 5)
02:b7d4 : 0d cc 87 ORA $87cc ; (canvas + 6)
02:b7d7 : f0 09 __ BEQ $b7e2 ; (resizewidth.s44 + 0)
.s68:
02:b7d9 : a9 00 __ LDA #$00
02:b7db : 85 54 __ STA T1 + 0 
02:b7dd : 85 55 __ STA T1 + 1 
02:b7df : 4c dd b8 JMP $b8dd ; (resizewidth.l42 + 0)
.s44:
02:b7e2 : ad cb 87 LDA $87cb ; (canvas + 5)
02:b7e5 : 0d cc 87 ORA $87cc ; (canvas + 6)
02:b7e8 : d0 06 __ BNE $b7f0 ; (resizewidth.s67 + 0)
.s54:
02:b7ea : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:b7ed : 4c 85 b7 JMP $b785 ; (resizewidth.s61 + 0)
.s67:
02:b7f0 : a9 00 __ LDA #$00
02:b7f2 : 85 54 __ STA T1 + 0 
02:b7f4 : 85 55 __ STA T1 + 1 
.l52:
02:b7f6 : a9 7f __ LDA #$7f
02:b7f8 : 85 11 __ STA P4 
02:b7fa : ad c9 87 LDA $87c9 ; (canvas + 3)
02:b7fd : 85 56 __ STA T2 + 0 
02:b7ff : 85 03 __ STA WORK + 0 
02:b801 : 85 14 __ STA P7 
02:b803 : ad ca 87 LDA $87ca ; (canvas + 4)
02:b806 : 85 57 __ STA T2 + 1 
02:b808 : 85 04 __ STA WORK + 1 
02:b80a : 85 15 __ STA P8 
02:b80c : ad cb 87 LDA $87cb ; (canvas + 5)
02:b80f : 38 __ __ SEC
02:b810 : e5 54 __ SBC T1 + 0 
02:b812 : a8 __ __ TAY
02:b813 : ad cc 87 LDA $87cc ; (canvas + 6)
02:b816 : e5 55 __ SBC T1 + 1 
02:b818 : aa __ __ TAX
02:b819 : 98 __ __ TYA
02:b81a : 38 __ __ SEC
02:b81b : e9 01 __ SBC #$01
02:b81d : 85 5b __ STA T6 + 0 
02:b81f : 85 1b __ STA ACCU + 0 
02:b821 : 8a __ __ TXA
02:b822 : e9 00 __ SBC #$00
02:b824 : 85 5c __ STA T6 + 1 
02:b826 : 85 1c __ STA ACCU + 1 
02:b828 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b82b : 18 __ __ CLC
02:b82c : a5 06 __ LDA WORK + 3 
02:b82e : 69 58 __ ADC #$58
02:b830 : 85 13 __ STA P6 
02:b832 : a5 05 __ LDA WORK + 2 
02:b834 : 85 12 __ STA P5 
02:b836 : ad b9 87 LDA $87b9 ; (vdc_state + 12)
02:b839 : 85 0f __ STA P2 
02:b83b : ad ba 87 LDA $87ba ; (vdc_state + 13)
02:b83e : 85 5e __ STA T7 + 1 
02:b840 : 85 10 __ STA P3 
02:b842 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:b845 : a9 7f __ LDA #$7f
02:b847 : 85 0d __ STA P0 
02:b849 : a5 0f __ LDA P2 
02:b84b : 85 10 __ STA P3 
02:b84d : a5 5e __ LDA T7 + 1 
02:b84f : 85 11 __ STA P4 
02:b851 : a5 56 __ LDA T2 + 0 
02:b853 : 85 12 __ STA P5 
02:b855 : a5 57 __ LDA T2 + 1 
02:b857 : 85 13 __ STA P6 
02:b859 : a5 5b __ LDA T6 + 0 
02:b85b : 85 1b __ STA ACCU + 0 
02:b85d : a5 5c __ LDA T6 + 1 
02:b85f : 85 1c __ STA ACCU + 1 
02:b861 : a5 59 __ LDA T4 + 0 
02:b863 : 85 03 __ STA WORK + 0 
02:b865 : a5 5a __ LDA T4 + 1 
02:b867 : 85 04 __ STA WORK + 1 
02:b869 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b86c : 18 __ __ CLC
02:b86d : a5 06 __ LDA WORK + 3 
02:b86f : 69 58 __ ADC #$58
02:b871 : 85 0f __ STA P2 
02:b873 : 20 4b 1a JSR $1a4b ; (bnk_cpyfromvdc@proxy + 0)
02:b876 : a9 20 __ LDA #$20
02:b878 : 85 0f __ STA P2 
02:b87a : ad cb 87 LDA $87cb ; (canvas + 5)
02:b87d : 38 __ __ SEC
02:b87e : e5 54 __ SBC T1 + 0 
02:b880 : a8 __ __ TAY
02:b881 : ad cc 87 LDA $87cc ; (canvas + 6)
02:b884 : e5 55 __ SBC T1 + 1 
02:b886 : aa __ __ TAX
02:b887 : 98 __ __ TYA
02:b888 : 38 __ __ SEC
02:b889 : e9 01 __ SBC #$01
02:b88b : 85 1b __ STA ACCU + 0 
02:b88d : 8a __ __ TXA
02:b88e : e9 00 __ SBC #$00
02:b890 : 85 1c __ STA ACCU + 1 
02:b892 : a5 59 __ LDA T4 + 0 
02:b894 : 85 03 __ STA WORK + 0 
02:b896 : a5 5a __ LDA T4 + 1 
02:b898 : 85 04 __ STA WORK + 1 
02:b89a : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b89d : 18 __ __ CLC
02:b89e : a5 06 __ LDA WORK + 3 
02:b8a0 : 69 58 __ ADC #$58
02:b8a2 : aa __ __ TAX
02:b8a3 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:b8a6 : 18 __ __ CLC
02:b8a7 : 65 05 __ ADC WORK + 2 
02:b8a9 : 85 0d __ STA P0 
02:b8ab : 8a __ __ TXA
02:b8ac : 6d ca 87 ADC $87ca ; (canvas + 4)
02:b8af : 85 0e __ STA P1 
02:b8b1 : 38 __ __ SEC
02:b8b2 : a5 59 __ LDA T4 + 0 
02:b8b4 : ed c9 87 SBC $87c9 ; (canvas + 3)
02:b8b7 : 85 10 __ STA P3 
02:b8b9 : a5 5a __ LDA T4 + 1 
02:b8bb : ed ca 87 SBC $87ca ; (canvas + 4)
02:b8be : 85 11 __ STA P4 
02:b8c0 : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
02:b8c3 : e6 54 __ INC T1 + 0 
02:b8c5 : d0 02 __ BNE $b8c9 ; (resizewidth.s1044 + 0)
.s1043:
02:b8c7 : e6 55 __ INC T1 + 1 
.s1044:
02:b8c9 : a5 55 __ LDA T1 + 1 
02:b8cb : cd cc 87 CMP $87cc ; (canvas + 6)
02:b8ce : d0 05 __ BNE $b8d5 ; (resizewidth.s1005 + 0)
.s1004:
02:b8d0 : a5 54 __ LDA T1 + 0 
02:b8d2 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1005:
02:b8d5 : b0 03 __ BCS $b8da ; (resizewidth.s1005 + 5)
02:b8d7 : 4c f6 b7 JMP $b7f6 ; (resizewidth.l52 + 0)
02:b8da : 4c ea b7 JMP $b7ea ; (resizewidth.s54 + 0)
.l42:
02:b8dd : a9 7f __ LDA #$7f
02:b8df : 85 11 __ STA P4 
02:b8e1 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:b8e4 : 85 56 __ STA T2 + 0 
02:b8e6 : 85 03 __ STA WORK + 0 
02:b8e8 : 85 14 __ STA P7 
02:b8ea : ad ca 87 LDA $87ca ; (canvas + 4)
02:b8ed : 85 57 __ STA T2 + 1 
02:b8ef : 85 04 __ STA WORK + 1 
02:b8f1 : 85 15 __ STA P8 
02:b8f3 : ad cb 87 LDA $87cb ; (canvas + 5)
02:b8f6 : 85 5b __ STA T6 + 0 
02:b8f8 : 85 1b __ STA ACCU + 0 
02:b8fa : ad cc 87 LDA $87cc ; (canvas + 6)
02:b8fd : 85 5c __ STA T6 + 1 
02:b8ff : 85 1c __ STA ACCU + 1 
02:b901 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b904 : a5 05 __ LDA WORK + 2 
02:b906 : 85 5d __ STA T7 + 0 
02:b908 : a5 06 __ LDA WORK + 3 
02:b90a : 85 5e __ STA T7 + 1 
02:b90c : 38 __ __ SEC
02:b90d : a5 5b __ LDA T6 + 0 
02:b90f : e5 54 __ SBC T1 + 0 
02:b911 : a8 __ __ TAY
02:b912 : a5 5c __ LDA T6 + 1 
02:b914 : e5 55 __ SBC T1 + 1 
02:b916 : aa __ __ TAX
02:b917 : 98 __ __ TYA
02:b918 : 38 __ __ SEC
02:b919 : e9 01 __ SBC #$01
02:b91b : 85 5f __ STA T8 + 0 
02:b91d : 85 1b __ STA ACCU + 0 
02:b91f : 8a __ __ TXA
02:b920 : e9 00 __ SBC #$00
02:b922 : 85 60 __ STA T8 + 1 
02:b924 : 85 1c __ STA ACCU + 1 
02:b926 : a5 56 __ LDA T2 + 0 
02:b928 : 85 03 __ STA WORK + 0 
02:b92a : a5 57 __ LDA T2 + 1 
02:b92c : 85 04 __ STA WORK + 1 
02:b92e : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b931 : 18 __ __ CLC
02:b932 : a5 06 __ LDA WORK + 3 
02:b934 : 69 58 __ ADC #$58
02:b936 : aa __ __ TAX
02:b937 : 18 __ __ CLC
02:b938 : a5 05 __ LDA WORK + 2 
02:b93a : 65 5d __ ADC T7 + 0 
02:b93c : a8 __ __ TAY
02:b93d : 8a __ __ TXA
02:b93e : 65 5e __ ADC T7 + 1 
02:b940 : aa __ __ TAX
02:b941 : 98 __ __ TYA
02:b942 : 18 __ __ CLC
02:b943 : 69 30 __ ADC #$30
02:b945 : 85 12 __ STA P5 
02:b947 : 90 01 __ BCC $b94a ; (resizewidth.s1036 + 0)
.s1035:
02:b949 : e8 __ __ INX
.s1036:
02:b94a : 86 13 __ STX P6 
02:b94c : ad b9 87 LDA $87b9 ; (vdc_state + 12)
02:b94f : 85 0f __ STA P2 
02:b951 : ad ba 87 LDA $87ba ; (vdc_state + 13)
02:b954 : 85 5e __ STA T7 + 1 
02:b956 : 85 10 __ STA P3 
02:b958 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:b95b : a9 7f __ LDA #$7f
02:b95d : 85 0d __ STA P0 
02:b95f : a5 0f __ LDA P2 
02:b961 : 85 10 __ STA P3 
02:b963 : a5 5e __ LDA T7 + 1 
02:b965 : 85 11 __ STA P4 
02:b967 : a5 56 __ LDA T2 + 0 
02:b969 : 85 12 __ STA P5 
02:b96b : a5 57 __ LDA T2 + 1 
02:b96d : 85 13 __ STA P6 
02:b96f : a5 59 __ LDA T4 + 0 
02:b971 : 85 1b __ STA ACCU + 0 
02:b973 : a5 5a __ LDA T4 + 1 
02:b975 : 85 1c __ STA ACCU + 1 
02:b977 : a5 5b __ LDA T6 + 0 
02:b979 : 85 03 __ STA WORK + 0 
02:b97b : a5 5c __ LDA T6 + 1 
02:b97d : 85 04 __ STA WORK + 1 
02:b97f : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b982 : a5 05 __ LDA WORK + 2 
02:b984 : 85 56 __ STA T2 + 0 
02:b986 : a5 06 __ LDA WORK + 3 
02:b988 : 85 57 __ STA T2 + 1 
02:b98a : a5 5f __ LDA T8 + 0 
02:b98c : 85 1b __ STA ACCU + 0 
02:b98e : a5 60 __ LDA T8 + 1 
02:b990 : 85 1c __ STA ACCU + 1 
02:b992 : a5 59 __ LDA T4 + 0 
02:b994 : 85 03 __ STA WORK + 0 
02:b996 : a5 5a __ LDA T4 + 1 
02:b998 : 85 04 __ STA WORK + 1 
02:b99a : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b99d : 18 __ __ CLC
02:b99e : a5 06 __ LDA WORK + 3 
02:b9a0 : 69 58 __ ADC #$58
02:b9a2 : aa __ __ TAX
02:b9a3 : 18 __ __ CLC
02:b9a4 : a5 05 __ LDA WORK + 2 
02:b9a6 : 65 56 __ ADC T2 + 0 
02:b9a8 : a8 __ __ TAY
02:b9a9 : 8a __ __ TXA
02:b9aa : 65 57 __ ADC T2 + 1 
02:b9ac : aa __ __ TAX
02:b9ad : 98 __ __ TYA
02:b9ae : 18 __ __ CLC
02:b9af : 69 30 __ ADC #$30
02:b9b1 : 85 0e __ STA P1 
02:b9b3 : 90 01 __ BCC $b9b6 ; (resizewidth.s1038 + 0)
.s1037:
02:b9b5 : e8 __ __ INX
.s1038:
02:b9b6 : 86 0f __ STX P2 
02:b9b8 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
02:b9bb : a9 0f __ LDA #$0f
02:b9bd : 85 0f __ STA P2 
02:b9bf : ad cb 87 LDA $87cb ; (canvas + 5)
02:b9c2 : 38 __ __ SEC
02:b9c3 : e5 54 __ SBC T1 + 0 
02:b9c5 : a8 __ __ TAY
02:b9c6 : ad cc 87 LDA $87cc ; (canvas + 6)
02:b9c9 : e5 55 __ SBC T1 + 1 
02:b9cb : aa __ __ TAX
02:b9cc : 98 __ __ TYA
02:b9cd : 38 __ __ SEC
02:b9ce : e9 01 __ SBC #$01
02:b9d0 : 85 1b __ STA ACCU + 0 
02:b9d2 : 8a __ __ TXA
02:b9d3 : e9 00 __ SBC #$00
02:b9d5 : 85 1c __ STA ACCU + 1 
02:b9d7 : a5 59 __ LDA T4 + 0 
02:b9d9 : 85 03 __ STA WORK + 0 
02:b9db : a5 5a __ LDA T4 + 1 
02:b9dd : 85 04 __ STA WORK + 1 
02:b9df : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:b9e2 : 18 __ __ CLC
02:b9e3 : a5 06 __ LDA WORK + 3 
02:b9e5 : 69 58 __ ADC #$58
02:b9e7 : aa __ __ TAX
02:b9e8 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:b9eb : 18 __ __ CLC
02:b9ec : 65 05 __ ADC WORK + 2 
02:b9ee : 85 5b __ STA T6 + 0 
02:b9f0 : 8a __ __ TXA
02:b9f1 : 6d ca 87 ADC $87ca ; (canvas + 4)
02:b9f4 : 85 5c __ STA T6 + 1 
02:b9f6 : ad cb 87 LDA $87cb ; (canvas + 5)
02:b9f9 : 85 1b __ STA ACCU + 0 
02:b9fb : ad cc 87 LDA $87cc ; (canvas + 6)
02:b9fe : 85 1c __ STA ACCU + 1 
02:ba00 : a5 59 __ LDA T4 + 0 
02:ba02 : 85 03 __ STA WORK + 0 
02:ba04 : a5 5a __ LDA T4 + 1 
02:ba06 : 85 04 __ STA WORK + 1 
02:ba08 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:ba0b : 18 __ __ CLC
02:ba0c : a5 05 __ LDA WORK + 2 
02:ba0e : 65 5b __ ADC T6 + 0 
02:ba10 : aa __ __ TAX
02:ba11 : a5 06 __ LDA WORK + 3 
02:ba13 : 65 5c __ ADC T6 + 1 
02:ba15 : a8 __ __ TAY
02:ba16 : 8a __ __ TXA
02:ba17 : 18 __ __ CLC
02:ba18 : 69 30 __ ADC #$30
02:ba1a : 85 0d __ STA P0 
02:ba1c : 90 01 __ BCC $ba1f ; (resizewidth.s1040 + 0)
.s1039:
02:ba1e : c8 __ __ INY
.s1040:
02:ba1f : 84 0e __ STY P1 
02:ba21 : 38 __ __ SEC
02:ba22 : a5 59 __ LDA T4 + 0 
02:ba24 : ed c9 87 SBC $87c9 ; (canvas + 3)
02:ba27 : 85 10 __ STA P3 
02:ba29 : a5 5a __ LDA T4 + 1 
02:ba2b : ed ca 87 SBC $87ca ; (canvas + 4)
02:ba2e : 85 11 __ STA P4 
02:ba30 : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
02:ba33 : e6 54 __ INC T1 + 0 
02:ba35 : d0 02 __ BNE $ba39 ; (resizewidth.s1042 + 0)
.s1041:
02:ba37 : e6 55 __ INC T1 + 1 
.s1042:
02:ba39 : a5 55 __ LDA T1 + 1 
02:ba3b : cd cc 87 CMP $87cc ; (canvas + 6)
02:ba3e : d0 05 __ BNE $ba45 ; (resizewidth.s1007 + 0)
.s1006:
02:ba40 : a5 54 __ LDA T1 + 0 
02:ba42 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1007:
02:ba45 : b0 03 __ BCS $ba4a ; (resizewidth.s1007 + 5)
02:ba47 : 4c dd b8 JMP $b8dd ; (resizewidth.l42 + 0)
02:ba4a : 4c e2 b7 JMP $b7e2 ; (resizewidth.s44 + 0)
.l28:
02:ba4d : a9 7f __ LDA #$7f
02:ba4f : 85 11 __ STA P4 
02:ba51 : a5 5a __ LDA T4 + 1 
02:ba53 : 85 15 __ STA P8 
02:ba55 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:ba58 : 85 03 __ STA WORK + 0 
02:ba5a : ad ca 87 LDA $87ca ; (canvas + 4)
02:ba5d : 85 04 __ STA WORK + 1 
02:ba5f : ad cb 87 LDA $87cb ; (canvas + 5)
02:ba62 : 85 5b __ STA T6 + 0 
02:ba64 : 85 1b __ STA ACCU + 0 
02:ba66 : ad cc 87 LDA $87cc ; (canvas + 6)
02:ba69 : 85 5c __ STA T6 + 1 
02:ba6b : 85 1c __ STA ACCU + 1 
02:ba6d : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:ba70 : a5 05 __ LDA WORK + 2 
02:ba72 : 85 5d __ STA T7 + 0 
02:ba74 : a5 06 __ LDA WORK + 3 
02:ba76 : 85 5e __ STA T7 + 1 
02:ba78 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:ba7b : 85 1b __ STA ACCU + 0 
02:ba7d : ad ca 87 LDA $87ca ; (canvas + 4)
02:ba80 : 85 1c __ STA ACCU + 1 
02:ba82 : a5 54 __ LDA T1 + 0 
02:ba84 : 85 03 __ STA WORK + 0 
02:ba86 : a5 55 __ LDA T1 + 1 
02:ba88 : 85 04 __ STA WORK + 1 
02:ba8a : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:ba8d : 18 __ __ CLC
02:ba8e : a5 06 __ LDA WORK + 3 
02:ba90 : 69 58 __ ADC #$58
02:ba92 : aa __ __ TAX
02:ba93 : 18 __ __ CLC
02:ba94 : a5 05 __ LDA WORK + 2 
02:ba96 : 65 5d __ ADC T7 + 0 
02:ba98 : a8 __ __ TAY
02:ba99 : 8a __ __ TXA
02:ba9a : 65 5e __ ADC T7 + 1 
02:ba9c : aa __ __ TAX
02:ba9d : 98 __ __ TYA
02:ba9e : 18 __ __ CLC
02:ba9f : 69 30 __ ADC #$30
02:baa1 : 85 12 __ STA P5 
02:baa3 : 90 01 __ BCC $baa6 ; (resizewidth.s1030 + 0)
.s1029:
02:baa5 : e8 __ __ INX
.s1030:
02:baa6 : 86 13 __ STX P6 
02:baa8 : ad b9 87 LDA $87b9 ; (vdc_state + 12)
02:baab : 85 0f __ STA P2 
02:baad : ad ba 87 LDA $87ba ; (vdc_state + 13)
02:bab0 : 85 57 __ STA T2 + 1 
02:bab2 : 85 10 __ STA P3 
02:bab4 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:bab7 : a9 7f __ LDA #$7f
02:bab9 : 85 0d __ STA P0 
02:babb : a5 0f __ LDA P2 
02:babd : 85 10 __ STA P3 
02:babf : a5 57 __ LDA T2 + 1 
02:bac1 : 85 11 __ STA P4 
02:bac3 : a5 14 __ LDA P7 
02:bac5 : 85 1b __ STA ACCU + 0 
02:bac7 : 85 12 __ STA P5 
02:bac9 : a5 5a __ LDA T4 + 1 
02:bacb : 85 13 __ STA P6 
02:bacd : 85 1c __ STA ACCU + 1 
02:bacf : a5 5b __ LDA T6 + 0 
02:bad1 : 85 03 __ STA WORK + 0 
02:bad3 : a5 5c __ LDA T6 + 1 
02:bad5 : 85 04 __ STA WORK + 1 
02:bad7 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bada : a5 05 __ LDA WORK + 2 
02:badc : 85 56 __ STA T2 + 0 
02:bade : a5 06 __ LDA WORK + 3 
02:bae0 : 85 57 __ STA T2 + 1 
02:bae2 : a5 54 __ LDA T1 + 0 
02:bae4 : 85 1b __ STA ACCU + 0 
02:bae6 : a5 55 __ LDA T1 + 1 
02:bae8 : 85 1c __ STA ACCU + 1 
02:baea : a5 14 __ LDA P7 
02:baec : 85 03 __ STA WORK + 0 
02:baee : a5 13 __ LDA P6 
02:baf0 : 85 04 __ STA WORK + 1 
02:baf2 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:baf5 : 18 __ __ CLC
02:baf6 : a5 06 __ LDA WORK + 3 
02:baf8 : 69 58 __ ADC #$58
02:bafa : aa __ __ TAX
02:bafb : 18 __ __ CLC
02:bafc : a5 05 __ LDA WORK + 2 
02:bafe : 65 56 __ ADC T2 + 0 
02:bb00 : a8 __ __ TAY
02:bb01 : 8a __ __ TXA
02:bb02 : 65 57 __ ADC T2 + 1 
02:bb04 : aa __ __ TAX
02:bb05 : 98 __ __ TYA
02:bb06 : 18 __ __ CLC
02:bb07 : 69 30 __ ADC #$30
02:bb09 : 85 0e __ STA P1 
02:bb0b : 90 01 __ BCC $bb0e ; (resizewidth.s1032 + 0)
.s1031:
02:bb0d : e8 __ __ INX
.s1032:
02:bb0e : 86 0f __ STX P2 
02:bb10 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
02:bb13 : e6 54 __ INC T1 + 0 
02:bb15 : d0 02 __ BNE $bb19 ; (resizewidth.s1034 + 0)
.s1033:
02:bb17 : e6 55 __ INC T1 + 1 
.s1034:
02:bb19 : a5 55 __ LDA T1 + 1 
02:bb1b : cd cc 87 CMP $87cc ; (canvas + 6)
02:bb1e : d0 05 __ BNE $bb25 ; (resizewidth.s1013 + 0)
.s1012:
02:bb20 : a5 54 __ LDA T1 + 0 
02:bb22 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1013:
02:bb25 : b0 03 __ BCS $bb2a ; (resizewidth.s1013 + 5)
02:bb27 : 4c 4d ba JMP $ba4d ; (resizewidth.l28 + 0)
02:bb2a : 4c 50 b7 JMP $b750 ; (resizewidth.s30 + 0)
.l20:
02:bb2d : a9 7f __ LDA #$7f
02:bb2f : 85 11 __ STA P4 
02:bb31 : a5 5a __ LDA T4 + 1 
02:bb33 : 85 15 __ STA P8 
02:bb35 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:bb38 : 85 1b __ STA ACCU + 0 
02:bb3a : ad ca 87 LDA $87ca ; (canvas + 4)
02:bb3d : 85 1c __ STA ACCU + 1 
02:bb3f : a5 54 __ LDA T1 + 0 
02:bb41 : 85 03 __ STA WORK + 0 
02:bb43 : a5 55 __ LDA T1 + 1 
02:bb45 : 85 04 __ STA WORK + 1 
02:bb47 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bb4a : 18 __ __ CLC
02:bb4b : a5 06 __ LDA WORK + 3 
02:bb4d : 69 58 __ ADC #$58
02:bb4f : 85 13 __ STA P6 
02:bb51 : a5 05 __ LDA WORK + 2 
02:bb53 : 85 12 __ STA P5 
02:bb55 : ad b9 87 LDA $87b9 ; (vdc_state + 12)
02:bb58 : 85 0f __ STA P2 
02:bb5a : ad ba 87 LDA $87ba ; (vdc_state + 13)
02:bb5d : 85 57 __ STA T2 + 1 
02:bb5f : 85 10 __ STA P3 
02:bb61 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:bb64 : a9 7f __ LDA #$7f
02:bb66 : 85 0d __ STA P0 
02:bb68 : a5 0f __ LDA P2 
02:bb6a : 85 10 __ STA P3 
02:bb6c : a5 57 __ LDA T2 + 1 
02:bb6e : 85 11 __ STA P4 
02:bb70 : a5 14 __ LDA P7 
02:bb72 : 85 03 __ STA WORK + 0 
02:bb74 : 85 12 __ STA P5 
02:bb76 : a5 5a __ LDA T4 + 1 
02:bb78 : 85 13 __ STA P6 
02:bb7a : 85 04 __ STA WORK + 1 
02:bb7c : a5 54 __ LDA T1 + 0 
02:bb7e : 85 1b __ STA ACCU + 0 
02:bb80 : a5 55 __ LDA T1 + 1 
02:bb82 : 85 1c __ STA ACCU + 1 
02:bb84 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bb87 : 18 __ __ CLC
02:bb88 : a5 06 __ LDA WORK + 3 
02:bb8a : 69 58 __ ADC #$58
02:bb8c : 85 0f __ STA P2 
02:bb8e : 20 4b 1a JSR $1a4b ; (bnk_cpyfromvdc@proxy + 0)
02:bb91 : e6 54 __ INC T1 + 0 
02:bb93 : d0 02 __ BNE $bb97 ; (resizewidth.s1028 + 0)
.s1027:
02:bb95 : e6 55 __ INC T1 + 1 
.s1028:
02:bb97 : a5 55 __ LDA T1 + 1 
02:bb99 : cd cc 87 CMP $87cc ; (canvas + 6)
02:bb9c : d0 05 __ BNE $bba3 ; (resizewidth.s1015 + 0)
.s1014:
02:bb9e : a5 54 __ LDA T1 + 0 
02:bba0 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1015:
02:bba3 : 90 88 __ BCC $bb2d ; (resizewidth.l20 + 0)
02:bba5 : 4c 3b b7 JMP $b73b ; (resizewidth.s22 + 0)
--------------------------------------------------------------------
02:bba8 : __ __ __ BYT 72 45 53 49 5a 45 20 43 41 4e 56 41 53 20 57 49 : rESIZE CANVAS WI
02:bbb8 : __ __ __ BYT 44 54 48 00                                     : DTH.
--------------------------------------------------------------------
02:bbbc : __ __ __ BYT 65 4e 54 45 52 20 4e 45 57 20 57 49 44 54 48 3a : eNTER NEW WIDTH:
02:bbcc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
02:bbcd : __ __ __ BYT 25 55 00                                        : %U.
--------------------------------------------------------------------
02:bbd0 : __ __ __ BYT 6e 45 57 20 53 49 5a 45 20 55 4e 53 55 50 50 4f : nEW SIZE UNSUPPO
02:bbe0 : __ __ __ BYT 52 54 45 44 2e 20 70 52 45 53 53 20 4b 45 59 2e : RTED. pRESS KEY.
02:bbf0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
02:bbf1 : __ __ __ BYT 61 52 45 20 59 4f 55 20 53 55 52 45 3f 00       : aRE YOU SURE?.
--------------------------------------------------------------------
02:bc00 : __ __ __ BYT 73 48 52 49 4e 4b 49 4e 47 20 4d 49 47 48 54 20 : sHRINKING MIGHT 
02:bc10 : __ __ __ BYT 44 45 4c 45 54 45 20 44 41 54 41 2e 00          : DELETE DATA..
--------------------------------------------------------------------
resizeheight: ; resizeheight()->void
.s1000:
02:bc1d : a2 03 __ LDX #$03
02:bc1f : b5 53 __ LDA T0 + 0,x 
02:bc21 : 9d 9c ab STA $ab9c,x ; (projbuffer + 13)
02:bc24 : ca __ __ DEX
02:bc25 : 10 f8 __ BPL $bc1f ; (resizeheight.s1000 + 2)
02:bc27 : 38 __ __ SEC
02:bc28 : a5 23 __ LDA SP + 0 
02:bc2a : e9 08 __ SBC #$08
02:bc2c : 85 23 __ STA SP + 0 
02:bc2e : b0 02 __ BCS $bc32 ; (resizeheight.s0 + 0)
02:bc30 : c6 24 __ DEC SP + 1 
.s0:
02:bc32 : a9 00 __ LDA #$00
02:bc34 : 85 17 __ STA P10 
02:bc36 : a9 14 __ LDA #$14
02:bc38 : 85 18 __ STA P11 
02:bc3a : a9 05 __ LDA #$05
02:bc3c : 8d f3 ab STA $abf3 ; (sstack + 0)
02:bc3f : a9 28 __ LDA #$28
02:bc41 : 8d f4 ab STA $abf4 ; (sstack + 1)
02:bc44 : a9 0c __ LDA #$0c
02:bc46 : 8d f5 ab STA $abf5 ; (sstack + 2)
02:bc49 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
02:bc4c : 8d b4 87 STA $87b4 ; (vdc_state + 7)
02:bc4f : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
02:bc52 : a9 01 __ LDA #$01
02:bc54 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
02:bc57 : a9 b8 __ LDA #$b8
02:bc59 : 85 13 __ STA P6 
02:bc5b : a9 bf __ LDA #$bf
02:bc5d : 85 14 __ STA P7 
02:bc5f : 20 33 81 JSR $8133 ; (vdc_prints_attr@proxy + 0)
02:bc62 : a9 00 __ LDA #$00
02:bc64 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
02:bc67 : a9 08 __ LDA #$08
02:bc69 : 85 12 __ STA P5 
02:bc6b : a9 cd __ LDA #$cd
02:bc6d : 85 13 __ STA P6 
02:bc6f : a9 bf __ LDA #$bf
02:bc71 : 85 14 __ STA P7 
02:bc73 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
02:bc76 : 85 53 __ STA T0 + 0 
02:bc78 : 85 15 __ STA P8 
02:bc7a : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
02:bc7d : a9 51 __ LDA #$51
02:bc7f : a0 02 __ LDY #$02
02:bc81 : 91 23 __ STA (SP + 0),y 
02:bc83 : a9 89 __ LDA #$89
02:bc85 : c8 __ __ INY
02:bc86 : 91 23 __ STA (SP + 0),y 
02:bc88 : a9 cd __ LDA #$cd
02:bc8a : c8 __ __ INY
02:bc8b : 91 23 __ STA (SP + 0),y 
02:bc8d : a9 bb __ LDA #$bb
02:bc8f : c8 __ __ INY
02:bc90 : 91 23 __ STA (SP + 0),y 
02:bc92 : ad cb 87 LDA $87cb ; (canvas + 5)
02:bc95 : c8 __ __ INY
02:bc96 : 91 23 __ STA (SP + 0),y 
02:bc98 : ad cc 87 LDA $87cc ; (canvas + 6)
02:bc9b : c8 __ __ INY
02:bc9c : 91 23 __ STA (SP + 0),y 
02:bc9e : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
02:bca1 : a9 15 __ LDA #$15
02:bca3 : 85 16 __ STA P9 
02:bca5 : a9 09 __ LDA #$09
02:bca7 : 85 17 __ STA P10 
02:bca9 : a9 51 __ LDA #$51
02:bcab : 8d f3 ab STA $abf3 ; (sstack + 0)
02:bcae : a9 89 __ LDA #$89
02:bcb0 : 8d f4 ab STA $abf4 ; (sstack + 1)
02:bcb3 : a9 03 __ LDA #$03
02:bcb5 : 8d f5 ab STA $abf5 ; (sstack + 2)
02:bcb8 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
02:bcbb : a5 1c __ LDA ACCU + 1 
02:bcbd : 30 04 __ BMI $bcc3 ; (resizeheight.s61 + 0)
.s1016:
02:bcbf : 05 1b __ ORA ACCU + 0 
02:bcc1 : d0 06 __ BNE $bcc9 ; (resizeheight.s3 + 0)
.s61:
02:bcc3 : a9 00 __ LDA #$00
02:bcc5 : 85 55 __ STA T4 + 0 
02:bcc7 : f0 11 __ BEQ $bcda ; (resizeheight.s5 + 0)
.s3:
02:bcc9 : a9 a4 __ LDA #$a4
02:bccb : 85 0f __ STA P2 
02:bccd : a9 ab __ LDA #$ab
02:bccf : 85 10 __ STA P3 
02:bcd1 : 20 a3 80 JSR $80a3 ; (strtol@proxy + 0)
02:bcd4 : a5 1b __ LDA ACCU + 0 
02:bcd6 : 85 55 __ STA T4 + 0 
02:bcd8 : a5 1c __ LDA ACCU + 1 
.s5:
02:bcda : 85 56 __ STA T4 + 1 
02:bcdc : 85 04 __ STA WORK + 1 
02:bcde : ad c9 87 LDA $87c9 ; (canvas + 3)
02:bce1 : 85 1b __ STA ACCU + 0 
02:bce3 : ad ca 87 LDA $87ca ; (canvas + 4)
02:bce6 : 85 1c __ STA ACCU + 1 
02:bce8 : a5 55 __ LDA T4 + 0 
02:bcea : 85 03 __ STA WORK + 0 
02:bcec : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bcef : a5 05 __ LDA WORK + 2 
02:bcf1 : 0a __ __ ASL
02:bcf2 : aa __ __ TAX
02:bcf3 : a5 06 __ LDA WORK + 3 
02:bcf5 : 2a __ __ ROL
02:bcf6 : a8 __ __ TAY
02:bcf7 : 8a __ __ TXA
02:bcf8 : 18 __ __ CLC
02:bcf9 : 69 30 __ ADC #$30
02:bcfb : 85 1b __ STA ACCU + 0 
02:bcfd : 90 01 __ BCC $bd00 ; (resizeheight.s1023 + 0)
.s1022:
02:bcff : c8 __ __ INY
.s1023:
02:bd00 : 84 1c __ STY ACCU + 1 
02:bd02 : a9 77 __ LDA #$77
02:bd04 : c5 1c __ CMP ACCU + 1 
02:bd06 : d0 04 __ BNE $bd0c ; (resizeheight.s1015 + 0)
.s1014:
02:bd08 : a9 ff __ LDA #$ff
02:bd0a : c5 1b __ CMP ACCU + 0 
.s1015:
02:bd0c : 90 06 __ BCC $bd14 ; (resizeheight.s6 + 0)
.s9:
02:bd0e : a5 55 __ LDA T4 + 0 
02:bd10 : 05 56 __ ORA T4 + 1 
02:bd12 : d0 0c __ BNE $bd20 ; (resizeheight.s7 + 0)
.s6:
02:bd14 : 20 b5 81 JSR $81b5 ; (vdc_prints_attr@proxy + 0)
02:bd17 : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
02:bd1a : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:bd1d : 4c a7 bd JMP $bda7 ; (resizeheight.s1001 + 0)
.s7:
02:bd20 : a9 00 __ LDA #$00
02:bd22 : 85 54 __ STA T3 + 0 
02:bd24 : a5 56 __ LDA T4 + 1 
02:bd26 : cd cc 87 CMP $87cc ; (canvas + 6)
02:bd29 : d0 05 __ BNE $bd30 ; (resizeheight.s1013 + 0)
.s1012:
02:bd2b : a5 55 __ LDA T4 + 0 
02:bd2d : cd cb 87 CMP $87cb ; (canvas + 5)
.s1013:
02:bd30 : b0 28 __ BCS $bd5a ; (resizeheight.s13 + 0)
.s11:
02:bd32 : 20 9e 81 JSR $819e ; (vdc_prints_attr@proxy + 0)
02:bd35 : e6 12 __ INC P5 
02:bd37 : 20 93 81 JSR $8193 ; (vdc_prints_attr@proxy + 0)
02:bd3a : a9 19 __ LDA #$19
02:bd3c : 8d f8 ab STA $abf8 ; (sstack + 5)
02:bd3f : a9 0d __ LDA #$0d
02:bd41 : 8d f9 ab STA $abf9 ; (sstack + 6)
02:bd44 : a9 07 __ LDA #$07
02:bd46 : 8d fa ab STA $abfa ; (sstack + 7)
02:bd49 : a9 00 __ LDA #$00
02:bd4b : 8d fb ab STA $abfb ; (sstack + 8)
02:bd4e : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
02:bd51 : a5 1b __ LDA ACCU + 0 
02:bd53 : c9 01 __ CMP #$01
02:bd55 : d0 03 __ BNE $bd5a ; (resizeheight.s13 + 0)
02:bd57 : 4c 39 bf JMP $bf39 ; (resizeheight.s16 + 0)
.s13:
02:bd5a : ae cb 87 LDX $87cb ; (canvas + 5)
.s1021:
02:bd5d : ad cc 87 LDA $87cc ; (canvas + 6)
02:bd60 : c5 56 __ CMP T4 + 1 
02:bd62 : d0 02 __ BNE $bd66 ; (resizeheight.s1007 + 0)
.s1006:
02:bd64 : e4 55 __ CPX T4 + 0 
.s1007:
02:bd66 : 90 55 __ BCC $bdbd ; (resizeheight.s26 + 0)
.s8:
02:bd68 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:bd6b : a5 54 __ LDA T3 + 0 
02:bd6d : c9 01 __ CMP #$01
02:bd6f : d0 36 __ BNE $bda7 ; (resizeheight.s1001 + 0)
.s41:
02:bd71 : a5 55 __ LDA T4 + 0 
02:bd73 : 8d cb 87 STA $87cb ; (canvas + 5)
02:bd76 : a5 56 __ LDA T4 + 1 
02:bd78 : 8d cc 87 STA $87cc ; (canvas + 6)
02:bd7b : a9 00 __ LDA #$00
02:bd7d : 8d cf 87 STA $87cf ; (canvas + 9)
02:bd80 : 8d d0 87 STA $87d0 ; (canvas + 10)
02:bd83 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
02:bd86 : 20 18 3d JSR $3d18 ; (placesignature.s1000 + 0)
02:bd89 : a9 0f __ LDA #$0f
02:bd8b : 8d b4 87 STA $87b4 ; (vdc_state + 7)
02:bd8e : 20 98 2c JSR $2c98 ; (vdc_cls.s0 + 0)
02:bd91 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
02:bd94 : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
02:bd97 : ad ff 87 LDA $87ff ; (showbar + 0)
02:bd9a : f0 03 __ BEQ $bd9f ; (resizeheight.s81 + 0)
.s44:
02:bd9c : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s81:
02:bd9f : a9 00 __ LDA #$00
02:bda1 : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
02:bda4 : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
.s1001:
02:bda7 : 18 __ __ CLC
02:bda8 : a5 23 __ LDA SP + 0 
02:bdaa : 69 08 __ ADC #$08
02:bdac : 85 23 __ STA SP + 0 
02:bdae : 90 02 __ BCC $bdb2 ; (resizeheight.s1001 + 11)
02:bdb0 : e6 24 __ INC SP + 1 
02:bdb2 : a2 03 __ LDX #$03
02:bdb4 : bd 9c ab LDA $ab9c,x ; (projbuffer + 13)
02:bdb7 : 95 53 __ STA T0 + 0,x 
02:bdb9 : ca __ __ DEX
02:bdba : 10 f8 __ BPL $bdb4 ; (resizeheight.s1001 + 13)
02:bdbc : 60 __ __ RTS
.s26:
02:bdbd : 8a __ __ TXA
02:bdbe : 0d cc 87 ORA $87cc ; (canvas + 6)
02:bdc1 : f0 0d __ BEQ $bdd0 ; (resizeheight.s32 + 0)
.s47:
02:bdc3 : a9 00 __ LDA #$00
02:bdc5 : 85 53 __ STA T0 + 0 
02:bdc7 : a9 7f __ LDA #$7f
02:bdc9 : 85 0d __ STA P0 
02:bdcb : 85 10 __ STA P3 
02:bdcd : 4c 8d be JMP $be8d ; (resizeheight.l1019 + 0)
.s32:
02:bdd0 : a9 0f __ LDA #$0f
02:bdd2 : 85 0f __ STA P2 
02:bdd4 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:bdd7 : 85 1b __ STA ACCU + 0 
02:bdd9 : ad ca 87 LDA $87ca ; (canvas + 4)
02:bddc : 85 1c __ STA ACCU + 1 
02:bdde : a5 55 __ LDA T4 + 0 
02:bde0 : 85 03 __ STA WORK + 0 
02:bde2 : a5 56 __ LDA T4 + 1 
02:bde4 : 85 04 __ STA WORK + 1 
02:bde6 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bde9 : a5 05 __ LDA WORK + 2 
02:bdeb : 85 43 __ STA T2 + 0 
02:bded : a5 06 __ LDA WORK + 3 
02:bdef : 85 44 __ STA T2 + 1 
02:bdf1 : ad cb 87 LDA $87cb ; (canvas + 5)
02:bdf4 : 85 1b __ STA ACCU + 0 
02:bdf6 : ad cc 87 LDA $87cc ; (canvas + 6)
02:bdf9 : 85 1c __ STA ACCU + 1 
02:bdfb : ad c9 87 LDA $87c9 ; (canvas + 3)
02:bdfe : 85 03 __ STA WORK + 0 
02:be00 : ad ca 87 LDA $87ca ; (canvas + 4)
02:be03 : 85 04 __ STA WORK + 1 
02:be05 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:be08 : 18 __ __ CLC
02:be09 : a5 06 __ LDA WORK + 3 
02:be0b : 69 58 __ ADC #$58
02:be0d : aa __ __ TAX
02:be0e : 18 __ __ CLC
02:be0f : a5 05 __ LDA WORK + 2 
02:be11 : 65 43 __ ADC T2 + 0 
02:be13 : a8 __ __ TAY
02:be14 : 8a __ __ TXA
02:be15 : 65 44 __ ADC T2 + 1 
02:be17 : aa __ __ TAX
02:be18 : 98 __ __ TYA
02:be19 : 18 __ __ CLC
02:be1a : 69 30 __ ADC #$30
02:be1c : 85 0d __ STA P0 
02:be1e : 90 01 __ BCC $be21 ; (resizeheight.s1029 + 0)
.s1028:
02:be20 : e8 __ __ INX
.s1029:
02:be21 : 86 0e __ STX P1 
02:be23 : 38 __ __ SEC
02:be24 : a5 55 __ LDA T4 + 0 
02:be26 : ed cb 87 SBC $87cb ; (canvas + 5)
02:be29 : 85 1b __ STA ACCU + 0 
02:be2b : a5 56 __ LDA T4 + 1 
02:be2d : ed cc 87 SBC $87cc ; (canvas + 6)
02:be30 : 85 1c __ STA ACCU + 1 
02:be32 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:be35 : 85 03 __ STA WORK + 0 
02:be37 : ad ca 87 LDA $87ca ; (canvas + 4)
02:be3a : 85 04 __ STA WORK + 1 
02:be3c : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:be3f : 20 69 1a JSR $1a69 ; (bnk_memset@proxy + 0)
02:be42 : a9 20 __ LDA #$20
02:be44 : 85 0f __ STA P2 
02:be46 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:be49 : 85 03 __ STA WORK + 0 
02:be4b : ad ca 87 LDA $87ca ; (canvas + 4)
02:be4e : 85 04 __ STA WORK + 1 
02:be50 : ad cb 87 LDA $87cb ; (canvas + 5)
02:be53 : 85 1b __ STA ACCU + 0 
02:be55 : ad cc 87 LDA $87cc ; (canvas + 6)
02:be58 : 85 1c __ STA ACCU + 1 
02:be5a : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:be5d : 18 __ __ CLC
02:be5e : a5 06 __ LDA WORK + 3 
02:be60 : 69 58 __ ADC #$58
02:be62 : 85 0e __ STA P1 
02:be64 : a5 05 __ LDA WORK + 2 
02:be66 : 85 0d __ STA P0 
02:be68 : 38 __ __ SEC
02:be69 : a5 55 __ LDA T4 + 0 
02:be6b : ed cb 87 SBC $87cb ; (canvas + 5)
02:be6e : 85 1b __ STA ACCU + 0 
02:be70 : a5 56 __ LDA T4 + 1 
02:be72 : ed cc 87 SBC $87cc ; (canvas + 6)
02:be75 : 85 1c __ STA ACCU + 1 
02:be77 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:be7a : 85 03 __ STA WORK + 0 
02:be7c : ad ca 87 LDA $87ca ; (canvas + 4)
02:be7f : 85 04 __ STA WORK + 1 
02:be81 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:be84 : 20 69 1a JSR $1a69 ; (bnk_memset@proxy + 0)
02:be87 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
02:be8a : 4c 71 bd JMP $bd71 ; (resizeheight.s41 + 0)
.l1019:
02:be8d : ad c9 87 LDA $87c9 ; (canvas + 3)
02:be90 : 85 1b __ STA ACCU + 0 
02:be92 : 85 13 __ STA P6 
02:be94 : ad ca 87 LDA $87ca ; (canvas + 4)
02:be97 : 85 1c __ STA ACCU + 1 
02:be99 : 85 14 __ STA P7 
02:be9b : a5 55 __ LDA T4 + 0 
02:be9d : 85 03 __ STA WORK + 0 
02:be9f : a5 56 __ LDA T4 + 1 
02:bea1 : 85 04 __ STA WORK + 1 
02:bea3 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bea6 : a5 05 __ LDA WORK + 2 
02:bea8 : 85 43 __ STA T2 + 0 
02:beaa : a5 06 __ LDA WORK + 3 
02:beac : 85 44 __ STA T2 + 1 
02:beae : ad cb 87 LDA $87cb ; (canvas + 5)
02:beb1 : 38 __ __ SEC
02:beb2 : e5 53 __ SBC T0 + 0 
02:beb4 : a8 __ __ TAY
02:beb5 : ad cc 87 LDA $87cc ; (canvas + 6)
02:beb8 : e9 00 __ SBC #$00
02:beba : aa __ __ TAX
02:bebb : 98 __ __ TYA
02:bebc : 38 __ __ SEC
02:bebd : e9 01 __ SBC #$01
02:bebf : 85 1b __ STA ACCU + 0 
02:bec1 : 8a __ __ TXA
02:bec2 : e9 00 __ SBC #$00
02:bec4 : 85 1c __ STA ACCU + 1 
02:bec6 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:bec9 : 85 03 __ STA WORK + 0 
02:becb : ad ca 87 LDA $87ca ; (canvas + 4)
02:bece : 85 04 __ STA WORK + 1 
02:bed0 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bed3 : 18 __ __ CLC
02:bed4 : a5 06 __ LDA WORK + 3 
02:bed6 : 69 58 __ ADC #$58
02:bed8 : 85 47 __ STA T6 + 1 
02:beda : a5 05 __ LDA WORK + 2 
02:bedc : 85 46 __ STA T6 + 0 
02:bede : 18 __ __ CLC
02:bedf : 65 43 __ ADC T2 + 0 
02:bee1 : aa __ __ TAX
02:bee2 : a5 47 __ LDA T6 + 1 
02:bee4 : 65 44 __ ADC T2 + 1 
02:bee6 : a8 __ __ TAY
02:bee7 : 8a __ __ TXA
02:bee8 : 18 __ __ CLC
02:bee9 : 69 30 __ ADC #$30
02:beeb : 85 0e __ STA P1 
02:beed : 90 01 __ BCC $bef0 ; (resizeheight.s1025 + 0)
.s1024:
02:beef : c8 __ __ INY
.s1025:
02:bef0 : 84 0f __ STY P2 
02:bef2 : ad cb 87 LDA $87cb ; (canvas + 5)
02:bef5 : 85 1b __ STA ACCU + 0 
02:bef7 : ad cc 87 LDA $87cc ; (canvas + 6)
02:befa : 85 1c __ STA ACCU + 1 
02:befc : ad c9 87 LDA $87c9 ; (canvas + 3)
02:beff : 85 03 __ STA WORK + 0 
02:bf01 : ad ca 87 LDA $87ca ; (canvas + 4)
02:bf04 : 85 04 __ STA WORK + 1 
02:bf06 : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bf09 : 18 __ __ CLC
02:bf0a : a5 05 __ LDA WORK + 2 
02:bf0c : 65 46 __ ADC T6 + 0 
02:bf0e : aa __ __ TAX
02:bf0f : a5 06 __ LDA WORK + 3 
02:bf11 : 65 47 __ ADC T6 + 1 
02:bf13 : a8 __ __ TAY
02:bf14 : 8a __ __ TXA
02:bf15 : 18 __ __ CLC
02:bf16 : 69 30 __ ADC #$30
02:bf18 : 85 11 __ STA P4 
02:bf1a : 90 01 __ BCC $bf1d ; (resizeheight.s1027 + 0)
.s1026:
02:bf1c : c8 __ __ INY
.s1027:
02:bf1d : 84 12 __ STY P5 
02:bf1f : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
02:bf22 : e6 53 __ INC T0 + 0 
02:bf24 : ad cc 87 LDA $87cc ; (canvas + 6)
02:bf27 : f0 03 __ BEQ $bf2c ; (resizeheight.s1004 + 0)
02:bf29 : 4c 8d be JMP $be8d ; (resizeheight.l1019 + 0)
.s1004:
02:bf2c : a5 53 __ LDA T0 + 0 
02:bf2e : cd cb 87 CMP $87cb ; (canvas + 5)
02:bf31 : b0 03 __ BCS $bf36 ; (resizeheight.s1004 + 10)
02:bf33 : 4c 8d be JMP $be8d ; (resizeheight.l1019 + 0)
02:bf36 : 4c d0 bd JMP $bdd0 ; (resizeheight.s32 + 0)
.s16:
02:bf39 : a9 7f __ LDA #$7f
02:bf3b : 85 0d __ STA P0 
02:bf3d : 85 10 __ STA P3 
02:bf3f : ad c9 87 LDA $87c9 ; (canvas + 3)
02:bf42 : 85 1b __ STA ACCU + 0 
02:bf44 : ad ca 87 LDA $87ca ; (canvas + 4)
02:bf47 : 85 1c __ STA ACCU + 1 
02:bf49 : a5 55 __ LDA T4 + 0 
02:bf4b : 85 03 __ STA WORK + 0 
02:bf4d : 38 __ __ SEC
02:bf4e : e9 01 __ SBC #$01
02:bf50 : 85 43 __ STA T2 + 0 
02:bf52 : a5 56 __ LDA T4 + 1 
02:bf54 : e9 00 __ SBC #$00
02:bf56 : 85 44 __ STA T2 + 1 
02:bf58 : 85 04 __ STA WORK + 1 
02:bf5a : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bf5d : 18 __ __ CLC
02:bf5e : a5 05 __ LDA WORK + 2 
02:bf60 : 69 30 __ ADC #$30
02:bf62 : 85 0e __ STA P1 
02:bf64 : a5 06 __ LDA WORK + 3 
02:bf66 : 69 58 __ ADC #$58
02:bf68 : 85 0f __ STA P2 
02:bf6a : ad cb 87 LDA $87cb ; (canvas + 5)
02:bf6d : 85 1b __ STA ACCU + 0 
02:bf6f : ad cc 87 LDA $87cc ; (canvas + 6)
02:bf72 : 85 1c __ STA ACCU + 1 
02:bf74 : ad c9 87 LDA $87c9 ; (canvas + 3)
02:bf77 : 85 03 __ STA WORK + 0 
02:bf79 : ad ca 87 LDA $87ca ; (canvas + 4)
02:bf7c : 85 04 __ STA WORK + 1 
02:bf7e : 20 87 7c JSR $7c87 ; (mul16 + 0)
02:bf81 : a5 05 __ LDA WORK + 2 
02:bf83 : 85 13 __ STA P6 
02:bf85 : 18 __ __ CLC
02:bf86 : 69 30 __ ADC #$30
02:bf88 : 85 11 __ STA P4 
02:bf8a : a5 06 __ LDA WORK + 3 
02:bf8c : 85 14 __ STA P7 
02:bf8e : 69 58 __ ADC #$58
02:bf90 : 85 12 __ STA P5 
02:bf92 : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
02:bf95 : e6 54 __ INC T3 + 0 
02:bf97 : a5 44 __ LDA T2 + 1 
02:bf99 : ae cb 87 LDX $87cb ; (canvas + 5)
02:bf9c : cd 8f 87 CMP $878f ; (screen_row + 1)
02:bf9f : d0 05 __ BNE $bfa6 ; (resizeheight.s1009 + 0)
.s1008:
02:bfa1 : a5 43 __ LDA T2 + 0 
02:bfa3 : cd 8e 87 CMP $878e ; (screen_row + 0)
.s1009:
02:bfa6 : 90 03 __ BCC $bfab ; (resizeheight.s23 + 0)
02:bfa8 : 4c 5d bd JMP $bd5d ; (resizeheight.s1021 + 0)
.s23:
02:bfab : a5 43 __ LDA T2 + 0 
02:bfad : 8d 8e 87 STA $878e ; (screen_row + 0)
02:bfb0 : a5 44 __ LDA T2 + 1 
02:bfb2 : 8d 8f 87 STA $878f ; (screen_row + 1)
02:bfb5 : 4c 5d bd JMP $bd5d ; (resizeheight.s1021 + 0)
--------------------------------------------------------------------
02:bfb8 : __ __ __ BYT 72 45 53 49 5a 45 20 43 41 4e 56 41 53 20 48 45 : rESIZE CANVAS HE
02:bfc8 : __ __ __ BYT 49 47 48 54 00                                  : IGHT.
--------------------------------------------------------------------
02:bfcd : __ __ __ BYT 65 4e 54 45 52 20 4e 45 57 20 48 45 49 47 48 54 : eNTER NEW HEIGHT
02:bfdd : __ __ __ BYT 3a 00                                           : :.
--------------------------------------------------------------------
lineandbox: ; lineandbox(u8)->void
.s1000:
03:ac00 : a2 07 __ LDX #$07
03:ac02 : b5 53 __ LDA T0 + 0,x 
03:ac04 : 9d c0 ab STA $abc0,x ; (projbuffer + 40)
03:ac07 : ca __ __ DEX
03:ac08 : 10 f8 __ BPL $ac02 ; (lineandbox.s1000 + 2)
.s0:
03:ac0a : a9 00 __ LDA #$00
03:ac0c : 8d d5 88 STA $88d5 ; (select_accept + 0)
03:ac0f : 8d d6 88 STA $88d6 ; (select_accept + 1)
03:ac12 : ad cd 87 LDA $87cd ; (canvas + 7)
03:ac15 : 18 __ __ CLC
03:ac16 : 6d 8c 87 ADC $878c ; (screen_col + 0)
03:ac19 : 8d cd 88 STA $88cd ; (select_startx + 0)
03:ac1c : ad ce 87 LDA $87ce ; (canvas + 8)
03:ac1f : 6d 8d 87 ADC $878d ; (screen_col + 1)
03:ac22 : 8d ce 88 STA $88ce ; (select_startx + 1)
03:ac25 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:ac28 : 8d d1 88 STA $88d1 ; (select_endx + 0)
03:ac2b : ad ce 88 LDA $88ce ; (select_startx + 1)
03:ac2e : 8d d2 88 STA $88d2 ; (select_endx + 1)
03:ac31 : ad cf 87 LDA $87cf ; (canvas + 9)
03:ac34 : 18 __ __ CLC
03:ac35 : 6d 8e 87 ADC $878e ; (screen_row + 0)
03:ac38 : 8d cf 88 STA $88cf ; (select_starty + 0)
03:ac3b : ad d0 87 LDA $87d0 ; (canvas + 10)
03:ac3e : 6d 8f 87 ADC $878f ; (screen_row + 1)
03:ac41 : 8d d0 88 STA $88d0 ; (select_starty + 1)
03:ac44 : ad cf 88 LDA $88cf ; (select_starty + 0)
03:ac47 : 8d d3 88 STA $88d3 ; (select_endy + 0)
03:ac4a : ad d0 88 LDA $88d0 ; (select_starty + 1)
03:ac4d : 8d d4 88 STA $88d4 ; (select_endy + 1)
03:ac50 : ad fc ab LDA $abfc ; (sstack + 9)
03:ac53 : f0 0b __ BEQ $ac60 ; (lineandbox.l229 + 0)
.s1:
03:ac55 : a2 ff __ LDX #$ff
.l1051:
03:ac57 : e8 __ __ INX
03:ac58 : bd 00 b0 LDA $b000,x 
03:ac5b : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:ac5e : d0 f7 __ BNE $ac57 ; (lineandbox.l1051 + 0)
.l229:
03:ac60 : ad ff 87 LDA $87ff ; (showbar + 0)
03:ac63 : f0 03 __ BEQ $ac68 ; (lineandbox.s8 + 0)
.s6:
03:ac65 : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s8:
03:ac68 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
03:ac6b : a5 1b __ LDA ACCU + 0 
03:ac6d : 85 53 __ STA T0 + 0 
03:ac6f : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
03:ac72 : a5 53 __ LDA T0 + 0 
03:ac74 : c9 8c __ CMP #$8c
03:ac76 : d0 03 __ BNE $ac7b ; (lineandbox.s45 + 0)
03:ac78 : 4c c7 af JMP $afc7 ; (lineandbox.s37 + 0)
.s45:
03:ac7b : b0 03 __ BCS $ac80 ; (lineandbox.s46 + 0)
03:ac7d : 4c ff ae JMP $aeff ; (lineandbox.s47 + 0)
.s46:
03:ac80 : c9 91 __ CMP #$91
03:ac82 : d0 03 __ BNE $ac87 ; (lineandbox.s53 + 0)
03:ac84 : 4c 96 ae JMP $ae96 ; (lineandbox.s23 + 0)
.s53:
03:ac87 : c9 9d __ CMP #$9d
03:ac89 : d0 63 __ BNE $acee ; (lineandbox.s9 + 0)
.s15:
03:ac8b : ad ce 88 LDA $88ce ; (select_startx + 1)
03:ac8e : cd d2 88 CMP $88d2 ; (select_endx + 1)
03:ac91 : d0 06 __ BNE $ac99 ; (lineandbox.s1022 + 0)
.s1021:
03:ac93 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:ac96 : cd d1 88 CMP $88d1 ; (select_endx + 0)
.s1022:
03:ac99 : b0 53 __ BCS $acee ; (lineandbox.s9 + 0)
.s16:
03:ac9b : a9 01 __ LDA #$01
03:ac9d : 8d f8 ab STA $abf8 ; (sstack + 5)
03:aca0 : a9 00 __ LDA #$00
03:aca2 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:aca5 : 8d fa ab STA $abfa ; (sstack + 7)
03:aca8 : 8d fb ab STA $abfb ; (sstack + 8)
03:acab : 20 71 42 JSR $4271 ; (cursormove.s1000 + 0)
03:acae : ad cf 88 LDA $88cf ; (select_starty + 0)
03:acb1 : 85 54 __ STA T1 + 0 
03:acb3 : a9 00 __ LDA #$00
03:acb5 : 85 13 __ STA P6 
.l249:
03:acb7 : ad d3 88 LDA $88d3 ; (select_endy + 0)
03:acba : 18 __ __ CLC
03:acbb : 69 01 __ ADC #$01
03:acbd : 85 57 __ STA T3 + 0 
03:acbf : ad d4 88 LDA $88d4 ; (select_endy + 1)
03:acc2 : 69 00 __ ADC #$00
03:acc4 : f0 05 __ BEQ $accb ; (lineandbox.s1019 + 0)
.s1056:
03:acc6 : a5 54 __ LDA T1 + 0 
03:acc8 : 4c d1 ac JMP $acd1 ; (lineandbox.s20 + 0)
.s1019:
03:accb : a5 54 __ LDA T1 + 0 
03:accd : c5 57 __ CMP T3 + 0 
03:accf : b0 0a __ BCS $acdb ; (lineandbox.s22 + 0)
.s20:
03:acd1 : 85 11 __ STA P4 
03:acd3 : 20 09 b0 JSR $b009 ; (plotvisible@proxy + 0)
03:acd6 : e6 54 __ INC T1 + 0 
03:acd8 : 4c b7 ac JMP $acb7 ; (lineandbox.l249 + 0)
.s22:
03:acdb : ad cd 87 LDA $87cd ; (canvas + 7)
03:acde : 18 __ __ CLC
03:acdf : 6d 8c 87 ADC $878c ; (screen_col + 0)
03:ace2 : 8d d1 88 STA $88d1 ; (select_endx + 0)
03:ace5 : ad ce 87 LDA $87ce ; (canvas + 8)
03:ace8 : 6d 8d 87 ADC $878d ; (screen_col + 1)
03:aceb : 8d d2 88 STA $88d2 ; (select_endx + 1)
.s9:
03:acee : ad 8c 87 LDA $878c ; (screen_col + 0)
03:acf1 : 8d d5 87 STA $87d5 ; (canvas + 15)
03:acf4 : ad 8e 87 LDA $878e ; (screen_row + 0)
03:acf7 : 8d d6 87 STA $87d6 ; (canvas + 16)
03:acfa : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
03:acfd : a5 53 __ LDA T0 + 0 
03:acff : c9 1b __ CMP #$1b
03:ad01 : f0 0b __ BEQ $ad0e ; (lineandbox.s5 + 0)
.s57:
03:ad03 : c9 03 __ CMP #$03
03:ad05 : f0 07 __ BEQ $ad0e ; (lineandbox.s5 + 0)
.s56:
03:ad07 : c9 0d __ CMP #$0d
03:ad09 : f0 03 __ BEQ $ad0e ; (lineandbox.s5 + 0)
03:ad0b : 4c 60 ac JMP $ac60 ; (lineandbox.l229 + 0)
.s5:
03:ad0e : c9 0d __ CMP #$0d
03:ad10 : f0 06 __ BEQ $ad18 ; (lineandbox.s1002 + 0)
.s1003:
03:ad12 : a9 00 __ LDA #$00
03:ad14 : 85 56 __ STA T2 + 0 
03:ad16 : f0 5c __ BEQ $ad74 ; (lineandbox.s62 + 0)
.s1002:
03:ad18 : a9 01 __ LDA #$01
03:ad1a : 85 56 __ STA T2 + 0 
03:ad1c : ad cd 88 LDA $88cd ; (select_startx + 0)
03:ad1f : 85 17 __ STA P10 
03:ad21 : 49 ff __ EOR #$ff
03:ad23 : 38 __ __ SEC
03:ad24 : 6d d1 88 ADC $88d1 ; (select_endx + 0)
03:ad27 : a8 __ __ TAY
03:ad28 : ad d2 88 LDA $88d2 ; (select_endx + 1)
03:ad2b : ed ce 88 SBC $88ce ; (select_startx + 1)
03:ad2e : aa __ __ TAX
03:ad2f : 98 __ __ TYA
03:ad30 : 18 __ __ CLC
03:ad31 : 69 01 __ ADC #$01
03:ad33 : 85 18 __ STA P11 
03:ad35 : 8d d7 88 STA $88d7 ; (select_width + 0)
03:ad38 : 90 01 __ BCC $ad3b ; (lineandbox.s1058 + 0)
.s1057:
03:ad3a : e8 __ __ INX
.s1058:
03:ad3b : 8e d8 88 STX $88d8 ; (select_width + 1)
03:ad3e : ad cf 88 LDA $88cf ; (select_starty + 0)
03:ad41 : 85 53 __ STA T0 + 0 
03:ad43 : 85 16 __ STA P9 
03:ad45 : ad d3 88 LDA $88d3 ; (select_endy + 0)
03:ad48 : 85 54 __ STA T1 + 0 
03:ad4a : 38 __ __ SEC
03:ad4b : e5 16 __ SBC P9 
03:ad4d : a8 __ __ TAY
03:ad4e : ad d4 88 LDA $88d4 ; (select_endy + 1)
03:ad51 : 85 55 __ STA T1 + 1 
03:ad53 : ed d0 88 SBC $88d0 ; (select_starty + 1)
03:ad56 : aa __ __ TAX
03:ad57 : 98 __ __ TYA
03:ad58 : 18 __ __ CLC
03:ad59 : 69 01 __ ADC #$01
03:ad5b : 8d d9 88 STA $88d9 ; (select_height + 0)
03:ad5e : 90 01 __ BCC $ad61 ; (lineandbox.s1060 + 0)
.s1059:
03:ad60 : e8 __ __ INX
.s1060:
03:ad61 : 8e da 88 STX $88da ; (select_height + 1)
03:ad64 : ad d9 88 LDA $88d9 ; (select_height + 0)
03:ad67 : 8d f3 ab STA $abf3 ; (sstack + 0)
03:ad6a : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
03:ad6d : ad fc ab LDA $abfc ; (sstack + 9)
03:ad70 : c9 01 __ CMP #$01
03:ad72 : f0 37 __ BEQ $adab ; (lineandbox.l291 + 0)
.s62:
03:ad74 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
03:ad77 : ad ff 87 LDA $87ff ; (showbar + 0)
03:ad7a : f0 03 __ BEQ $ad7f ; (lineandbox.s77 + 0)
.s75:
03:ad7c : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s77:
03:ad7f : a5 56 __ LDA T2 + 0 
03:ad81 : f0 0a __ BEQ $ad8d ; (lineandbox.s238 + 0)
.s78:
03:ad83 : a9 01 __ LDA #$01
03:ad85 : 8d d5 88 STA $88d5 ; (select_accept + 0)
03:ad88 : a9 00 __ LDA #$00
03:ad8a : 8d d6 88 STA $88d6 ; (select_accept + 1)
.s238:
03:ad8d : ad fc ab LDA $abfc ; (sstack + 9)
03:ad90 : f0 0b __ BEQ $ad9d ; (lineandbox.s1001 + 0)
.s81:
03:ad92 : a2 ff __ LDX #$ff
.l1007:
03:ad94 : e8 __ __ INX
03:ad95 : bd f8 b0 LDA $b0f8,x 
03:ad98 : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:ad9b : d0 f7 __ BNE $ad94 ; (lineandbox.l1007 + 0)
.s1001:
03:ad9d : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
03:ada0 : a2 07 __ LDX #$07
03:ada2 : bd c0 ab LDA $abc0,x ; (projbuffer + 40)
03:ada5 : 95 53 __ STA T0 + 0,x 
03:ada7 : ca __ __ DEX
03:ada8 : 10 f8 __ BPL $ada2 ; (lineandbox.s1001 + 5)
03:adaa : 60 __ __ RTS
.l291:
03:adab : 18 __ __ CLC
03:adac : a5 54 __ LDA T1 + 0 
03:adae : 69 01 __ ADC #$01
03:adb0 : 85 54 __ STA T1 + 0 
03:adb2 : a5 55 __ LDA T1 + 1 
03:adb4 : 69 00 __ ADC #$00
03:adb6 : d0 06 __ BNE $adbe ; (lineandbox.s66 + 0)
.s1009:
03:adb8 : a5 53 __ LDA T0 + 0 
03:adba : c5 54 __ CMP T1 + 0 
03:adbc : b0 cf __ BCS $ad8d ; (lineandbox.s238 + 0)
.s66:
03:adbe : ad c9 87 LDA $87c9 ; (canvas + 3)
03:adc1 : 85 1b __ STA ACCU + 0 
03:adc3 : ad ca 87 LDA $87ca ; (canvas + 4)
03:adc6 : 85 1c __ STA ACCU + 1 
03:adc8 : a5 53 __ LDA T0 + 0 
03:adca : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
03:adcd : 18 __ __ CLC
03:adce : a5 06 __ LDA WORK + 3 
03:add0 : 69 58 __ ADC #$58
03:add2 : 85 55 __ STA T1 + 1 
03:add4 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:add7 : 85 59 __ STA T5 + 0 
03:add9 : 18 __ __ CLC
03:adda : 65 05 __ ADC WORK + 2 
03:addc : 85 0d __ STA P0 
03:adde : ad ce 88 LDA $88ce ; (select_startx + 1)
03:ade1 : 85 5a __ STA T5 + 1 
03:ade3 : 65 55 __ ADC T1 + 1 
03:ade5 : 85 0e __ STA P1 
03:ade7 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
03:adea : 85 0f __ STA P2 
03:adec : ad d7 88 LDA $88d7 ; (select_width + 0)
03:adef : 85 54 __ STA T1 + 0 
03:adf1 : 85 10 __ STA P3 
03:adf3 : ad d8 88 LDA $88d8 ; (select_width + 1)
03:adf6 : 85 55 __ STA T1 + 1 
03:adf8 : 85 11 __ STA P4 
03:adfa : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
03:adfd : a5 54 __ LDA T1 + 0 
03:adff : 85 10 __ STA P3 
03:ae01 : a5 55 __ LDA T1 + 1 
03:ae03 : 85 11 __ STA P4 
03:ae05 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:ae08 : 85 1b __ STA ACCU + 0 
03:ae0a : ad ca 87 LDA $87ca ; (canvas + 4)
03:ae0d : 85 1c __ STA ACCU + 1 
03:ae0f : a5 53 __ LDA T0 + 0 
03:ae11 : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
03:ae14 : 18 __ __ CLC
03:ae15 : a5 06 __ LDA WORK + 3 
03:ae17 : 69 58 __ ADC #$58
03:ae19 : aa __ __ TAX
03:ae1a : 18 __ __ CLC
03:ae1b : a5 05 __ LDA WORK + 2 
03:ae1d : 65 59 __ ADC T5 + 0 
03:ae1f : 85 57 __ STA T3 + 0 
03:ae21 : 8a __ __ TXA
03:ae22 : 65 5a __ ADC T5 + 1 
03:ae24 : 85 58 __ STA T3 + 1 
03:ae26 : ad cb 87 LDA $87cb ; (canvas + 5)
03:ae29 : 85 1b __ STA ACCU + 0 
03:ae2b : ad cc 87 LDA $87cc ; (canvas + 6)
03:ae2e : 85 1c __ STA ACCU + 1 
03:ae30 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:ae33 : 85 03 __ STA WORK + 0 
03:ae35 : ad ca 87 LDA $87ca ; (canvas + 4)
03:ae38 : 85 04 __ STA WORK + 1 
03:ae3a : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:ae3d : 18 __ __ CLC
03:ae3e : a5 05 __ LDA WORK + 2 
03:ae40 : 65 57 __ ADC T3 + 0 
03:ae42 : a8 __ __ TAY
03:ae43 : a5 06 __ LDA WORK + 3 
03:ae45 : 65 58 __ ADC T3 + 1 
03:ae47 : aa __ __ TAX
03:ae48 : 98 __ __ TYA
03:ae49 : 18 __ __ CLC
03:ae4a : 69 30 __ ADC #$30
03:ae4c : 85 0d __ STA P0 
03:ae4e : 90 01 __ BCC $ae51 ; (lineandbox.s1062 + 0)
.s1061:
03:ae50 : e8 __ __ INX
.s1062:
03:ae51 : 86 0e __ STX P1 
03:ae53 : ad 95 87 LDA $8795 ; (plotblink + 0)
03:ae56 : 0a __ __ ASL
03:ae57 : 0a __ __ ASL
03:ae58 : 0a __ __ ASL
03:ae59 : 0a __ __ ASL
03:ae5a : 18 __ __ CLC
03:ae5b : 6d 92 87 ADC $8792 ; (plotcolor + 0)
03:ae5e : 85 54 __ STA T1 + 0 
03:ae60 : ad 94 87 LDA $8794 ; (plotunderline + 0)
03:ae63 : 4a __ __ LSR
03:ae64 : 6a __ __ ROR
03:ae65 : 6a __ __ ROR
03:ae66 : 29 c0 __ AND #$c0
03:ae68 : 6a __ __ ROR
03:ae69 : 65 54 __ ADC T1 + 0 
03:ae6b : 85 54 __ STA T1 + 0 
03:ae6d : ad 93 87 LDA $8793 ; (plotreverse + 0)
03:ae70 : 4a __ __ LSR
03:ae71 : 6a __ __ ROR
03:ae72 : 29 80 __ AND #$80
03:ae74 : 6a __ __ ROR
03:ae75 : 65 54 __ ADC T1 + 0 
03:ae77 : 85 54 __ STA T1 + 0 
03:ae79 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
03:ae7c : 4a __ __ LSR
03:ae7d : a9 00 __ LDA #$00
03:ae7f : 6a __ __ ROR
03:ae80 : 65 54 __ ADC T1 + 0 
03:ae82 : 85 0f __ STA P2 
03:ae84 : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
03:ae87 : e6 53 __ INC T0 + 0 
03:ae89 : ad d3 88 LDA $88d3 ; (select_endy + 0)
03:ae8c : 85 54 __ STA T1 + 0 
03:ae8e : ad d4 88 LDA $88d4 ; (select_endy + 1)
03:ae91 : 85 55 __ STA T1 + 1 
03:ae93 : 4c ab ad JMP $adab ; (lineandbox.l291 + 0)
.s23:
03:ae96 : ad d0 88 LDA $88d0 ; (select_starty + 1)
03:ae99 : cd d4 88 CMP $88d4 ; (select_endy + 1)
03:ae9c : d0 06 __ BNE $aea4 ; (lineandbox.s1028 + 0)
.s1027:
03:ae9e : ad cf 88 LDA $88cf ; (select_starty + 0)
03:aea1 : cd d3 88 CMP $88d3 ; (select_endy + 0)
.s1028:
03:aea4 : 90 03 __ BCC $aea9 ; (lineandbox.s24 + 0)
03:aea6 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s24:
03:aea9 : a9 00 __ LDA #$00
03:aeab : 8d f8 ab STA $abf8 ; (sstack + 5)
03:aeae : 8d f9 ab STA $abf9 ; (sstack + 6)
03:aeb1 : 8d fb ab STA $abfb ; (sstack + 8)
03:aeb4 : a9 01 __ LDA #$01
03:aeb6 : 8d fa ab STA $abfa ; (sstack + 7)
03:aeb9 : 20 71 42 JSR $4271 ; (cursormove.s1000 + 0)
03:aebc : ad cd 88 LDA $88cd ; (select_startx + 0)
03:aebf : 85 54 __ STA T1 + 0 
03:aec1 : a9 00 __ LDA #$00
03:aec3 : 85 13 __ STA P6 
.l246:
03:aec5 : ad d1 88 LDA $88d1 ; (select_endx + 0)
03:aec8 : 18 __ __ CLC
03:aec9 : 69 01 __ ADC #$01
03:aecb : 85 57 __ STA T3 + 0 
03:aecd : ad d2 88 LDA $88d2 ; (select_endx + 1)
03:aed0 : 69 00 __ ADC #$00
03:aed2 : f0 05 __ BEQ $aed9 ; (lineandbox.s1025 + 0)
.s1055:
03:aed4 : a5 54 __ LDA T1 + 0 
03:aed6 : 4c df ae JMP $aedf ; (lineandbox.s28 + 0)
.s1025:
03:aed9 : a5 54 __ LDA T1 + 0 
03:aedb : c5 57 __ CMP T3 + 0 
03:aedd : b0 0a __ BCS $aee9 ; (lineandbox.s30 + 0)
.s28:
03:aedf : 85 12 __ STA P5 
03:aee1 : 20 b2 be JSR $beb2 ; (plotvisible@proxy + 0)
03:aee4 : e6 54 __ INC T1 + 0 
03:aee6 : 4c c5 ae JMP $aec5 ; (lineandbox.l246 + 0)
.s30:
03:aee9 : ad cf 87 LDA $87cf ; (canvas + 9)
03:aeec : 18 __ __ CLC
03:aeed : 6d 8e 87 ADC $878e ; (screen_row + 0)
03:aef0 : 8d d3 88 STA $88d3 ; (select_endy + 0)
03:aef3 : ad d0 87 LDA $87d0 ; (canvas + 10)
03:aef6 : 6d 8f 87 ADC $878f ; (screen_row + 1)
03:aef9 : 8d d4 88 STA $88d4 ; (select_endy + 1)
03:aefc : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s47:
03:aeff : c9 1d __ CMP #$1d
03:af01 : d0 31 __ BNE $af34 ; (lineandbox.s48 + 0)
.s10:
03:af03 : a9 00 __ LDA #$00
03:af05 : 8d f8 ab STA $abf8 ; (sstack + 5)
03:af08 : 8d fa ab STA $abfa ; (sstack + 7)
03:af0b : 8d fb ab STA $abfb ; (sstack + 8)
03:af0e : a9 01 __ LDA #$01
03:af10 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:af13 : 20 71 42 JSR $4271 ; (cursormove.s1000 + 0)
03:af16 : ad cd 87 LDA $87cd ; (canvas + 7)
03:af19 : 18 __ __ CLC
03:af1a : 6d 8c 87 ADC $878c ; (screen_col + 0)
03:af1d : 8d d1 88 STA $88d1 ; (select_endx + 0)
03:af20 : ad ce 87 LDA $87ce ; (canvas + 8)
03:af23 : 6d 8d 87 ADC $878d ; (screen_col + 1)
03:af26 : 8d d2 88 STA $88d2 ; (select_endx + 1)
03:af29 : ad cf 88 LDA $88cf ; (select_starty + 0)
03:af2c : 85 54 __ STA T1 + 0 
03:af2e : a9 01 __ LDA #$01
03:af30 : 85 13 __ STA P6 
03:af32 : d0 6c __ BNE $afa0 ; (lineandbox.l241 + 0)
.s48:
03:af34 : b0 5d __ BCS $af93 ; (lineandbox.s49 + 0)
.s50:
03:af36 : c9 11 __ CMP #$11
03:af38 : f0 03 __ BEQ $af3d ; (lineandbox.s31 + 0)
03:af3a : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s31:
03:af3d : a9 00 __ LDA #$00
03:af3f : 8d f8 ab STA $abf8 ; (sstack + 5)
03:af42 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:af45 : 8d fa ab STA $abfa ; (sstack + 7)
03:af48 : a9 01 __ LDA #$01
03:af4a : 8d fb ab STA $abfb ; (sstack + 8)
03:af4d : 20 71 42 JSR $4271 ; (cursormove.s1000 + 0)
03:af50 : ad cf 87 LDA $87cf ; (canvas + 9)
03:af53 : 18 __ __ CLC
03:af54 : 6d 8e 87 ADC $878e ; (screen_row + 0)
03:af57 : 8d d3 88 STA $88d3 ; (select_endy + 0)
03:af5a : ad d0 87 LDA $87d0 ; (canvas + 10)
03:af5d : 6d 8f 87 ADC $878f ; (screen_row + 1)
03:af60 : 8d d4 88 STA $88d4 ; (select_endy + 1)
03:af63 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:af66 : 85 54 __ STA T1 + 0 
03:af68 : a9 01 __ LDA #$01
03:af6a : 85 13 __ STA P6 
.l243:
03:af6c : ad d1 88 LDA $88d1 ; (select_endx + 0)
03:af6f : 18 __ __ CLC
03:af70 : 69 01 __ ADC #$01
03:af72 : 85 57 __ STA T3 + 0 
03:af74 : ad d2 88 LDA $88d2 ; (select_endx + 1)
03:af77 : 69 00 __ ADC #$00
03:af79 : d0 13 __ BNE $af8e ; (lineandbox.s1054 + 0)
.s1033:
03:af7b : a5 54 __ LDA T1 + 0 
03:af7d : c5 57 __ CMP T3 + 0 
03:af7f : 90 03 __ BCC $af84 ; (lineandbox.s33 + 0)
03:af81 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s33:
03:af84 : 85 12 __ STA P5 
03:af86 : 20 b2 be JSR $beb2 ; (plotvisible@proxy + 0)
03:af89 : e6 54 __ INC T1 + 0 
03:af8b : 4c 6c af JMP $af6c ; (lineandbox.l243 + 0)
.s1054:
03:af8e : a5 54 __ LDA T1 + 0 
03:af90 : 4c 84 af JMP $af84 ; (lineandbox.s33 + 0)
.s49:
03:af93 : c9 8b __ CMP #$8b
03:af95 : f0 03 __ BEQ $af9a ; (lineandbox.s36 + 0)
03:af97 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s36:
03:af9a : 20 4f 50 JSR $504f ; (togglestatusbar.s0 + 0)
03:af9d : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.l241:
03:afa0 : ad d3 88 LDA $88d3 ; (select_endy + 0)
03:afa3 : 18 __ __ CLC
03:afa4 : 69 01 __ ADC #$01
03:afa6 : 85 57 __ STA T3 + 0 
03:afa8 : ad d4 88 LDA $88d4 ; (select_endy + 1)
03:afab : 69 00 __ ADC #$00
03:afad : d0 13 __ BNE $afc2 ; (lineandbox.s1053 + 0)
.s1039:
03:afaf : a5 54 __ LDA T1 + 0 
03:afb1 : c5 57 __ CMP T3 + 0 
03:afb3 : 90 03 __ BCC $afb8 ; (lineandbox.s12 + 0)
03:afb5 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s12:
03:afb8 : 85 11 __ STA P4 
03:afba : 20 09 b0 JSR $b009 ; (plotvisible@proxy + 0)
03:afbd : e6 54 __ INC T1 + 0 
03:afbf : 4c a0 af JMP $afa0 ; (lineandbox.l241 + 0)
.s1053:
03:afc2 : a5 54 __ LDA T1 + 0 
03:afc4 : 4c b8 af JMP $afb8 ; (lineandbox.s12 + 0)
.s37:
03:afc7 : ad ce 88 LDA $88ce ; (select_startx + 1)
03:afca : cd d2 88 CMP $88d2 ; (select_endx + 1)
03:afcd : f0 03 __ BEQ $afd2 ; (lineandbox.s1047 + 0)
03:afcf : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s1047:
03:afd2 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:afd5 : cd d1 88 CMP $88d1 ; (select_endx + 0)
03:afd8 : f0 03 __ BEQ $afdd ; (lineandbox.s41 + 0)
03:afda : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s41:
03:afdd : ad d0 88 LDA $88d0 ; (select_starty + 1)
03:afe0 : cd d4 88 CMP $88d4 ; (select_endy + 1)
03:afe3 : f0 03 __ BEQ $afe8 ; (lineandbox.s1045 + 0)
03:afe5 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s1045:
03:afe8 : ad cf 88 LDA $88cf ; (select_starty + 0)
03:afeb : cd d3 88 CMP $88d3 ; (select_endy + 0)
03:afee : f0 03 __ BEQ $aff3 ; (lineandbox.s38 + 0)
03:aff0 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s38:
03:aff3 : a9 03 __ LDA #$03
03:aff5 : 8d f8 ab STA $abf8 ; (sstack + 5)
03:aff8 : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
03:affb : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
--------------------------------------------------------------------
03:b000 : __ __ __ BYT 6c 49 4e 45 2f 62 4f 58 00                      : lINE/bOX.
--------------------------------------------------------------------
plotvisible@proxy: ; plotvisible@proxy
03:b009 : ad d1 88 LDA $88d1 ; (select_endx + 0)
03:b00c : 85 12 __ STA P5 
--------------------------------------------------------------------
plotvisible: ; plotvisible(u8,u8,u8)->void
.s0:
03:b00e : ad cf 87 LDA $87cf ; (canvas + 9)
03:b011 : 85 44 __ STA T2 + 0 
03:b013 : ad d0 87 LDA $87d0 ; (canvas + 10)
03:b016 : f0 01 __ BEQ $b019 ; (plotvisible.s1010 + 0)
03:b018 : 60 __ __ RTS
.s1010:
03:b019 : a5 11 __ LDA P4 ; (row + 0)
03:b01b : c5 44 __ CMP T2 + 0 
03:b01d : b0 01 __ BCS $b020 ; (plotvisible.s6 + 0)
03:b01f : 60 __ __ RTS
.s6:
03:b020 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
03:b023 : 18 __ __ CLC
03:b024 : 65 44 __ ADC T2 + 0 
03:b026 : b0 05 __ BCS $b02d ; (plotvisible.s5 + 0)
.s1008:
03:b028 : c5 11 __ CMP P4 ; (row + 0)
03:b02a : b0 01 __ BCS $b02d ; (plotvisible.s5 + 0)
03:b02c : 60 __ __ RTS
.s5:
03:b02d : ad cd 87 LDA $87cd ; (canvas + 7)
03:b030 : 85 45 __ STA T4 + 0 
03:b032 : ad ce 87 LDA $87ce ; (canvas + 8)
03:b035 : f0 01 __ BEQ $b038 ; (plotvisible.s1006 + 0)
03:b037 : 60 __ __ RTS
.s1006:
03:b038 : a5 12 __ LDA P5 ; (col + 0)
03:b03a : c5 45 __ CMP T4 + 0 
03:b03c : b0 01 __ BCS $b03f ; (plotvisible.s4 + 0)
03:b03e : 60 __ __ RTS
.s4:
03:b03f : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
03:b042 : 18 __ __ CLC
03:b043 : 65 45 __ ADC T4 + 0 
03:b045 : b0 05 __ BCS $b04c ; (plotvisible.s1 + 0)
.s1004:
03:b047 : c5 12 __ CMP P5 ; (col + 0)
03:b049 : b0 01 __ BCS $b04c ; (plotvisible.s1 + 0)
03:b04b : 60 __ __ RTS
.s1:
03:b04c : a5 13 __ LDA P6 ; (setorrestore + 0)
03:b04e : c9 01 __ CMP #$01
03:b050 : d0 37 __ BNE $b089 ; (plotvisible.s8 + 0)
.s7:
03:b052 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
03:b055 : 85 0f __ STA P2 
03:b057 : ad 95 87 LDA $8795 ; (plotblink + 0)
03:b05a : 0a __ __ ASL
03:b05b : 0a __ __ ASL
03:b05c : 0a __ __ ASL
03:b05d : 0a __ __ ASL
03:b05e : 18 __ __ CLC
03:b05f : 6d 92 87 ADC $8792 ; (plotcolor + 0)
03:b062 : 85 46 __ STA T5 + 0 
03:b064 : ad 94 87 LDA $8794 ; (plotunderline + 0)
03:b067 : 4a __ __ LSR
03:b068 : 6a __ __ ROR
03:b069 : 6a __ __ ROR
03:b06a : 29 c0 __ AND #$c0
03:b06c : 6a __ __ ROR
03:b06d : 65 46 __ ADC T5 + 0 
03:b06f : 85 46 __ STA T5 + 0 
03:b071 : ad 93 87 LDA $8793 ; (plotreverse + 0)
03:b074 : 4a __ __ LSR
03:b075 : 6a __ __ ROR
03:b076 : 29 80 __ AND #$80
03:b078 : 6a __ __ ROR
03:b079 : 65 46 __ ADC T5 + 0 
03:b07b : 85 46 __ STA T5 + 0 
03:b07d : ad 96 87 LDA $8796 ; (plotaltchar + 0)
03:b080 : 4a __ __ LSR
03:b081 : a9 00 __ LDA #$00
03:b083 : 6a __ __ ROR
03:b084 : 65 46 __ ADC T5 + 0 
03:b086 : 4c e4 b0 JMP $b0e4 ; (plotvisible.s1012 + 0)
.s8:
03:b089 : a9 7f __ LDA #$7f
03:b08b : 85 0d __ STA P0 
03:b08d : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b090 : 85 46 __ STA T5 + 0 
03:b092 : 85 1b __ STA ACCU + 0 
03:b094 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b097 : 85 47 __ STA T5 + 1 
03:b099 : 85 1c __ STA ACCU + 1 
03:b09b : a5 11 __ LDA P4 ; (row + 0)
03:b09d : 20 67 7c JSR $7c67 ; (mul16by8 + 0)
03:b0a0 : 18 __ __ CLC
03:b0a1 : a5 05 __ LDA WORK + 2 
03:b0a3 : 65 12 __ ADC P5 ; (col + 0)
03:b0a5 : 85 0e __ STA P1 
03:b0a7 : a5 06 __ LDA WORK + 3 
03:b0a9 : 69 58 __ ADC #$58
03:b0ab : 85 0f __ STA P2 
03:b0ad : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
03:b0b0 : 85 43 __ STA T0 + 0 
03:b0b2 : ad cb 87 LDA $87cb ; (canvas + 5)
03:b0b5 : 85 1b __ STA ACCU + 0 
03:b0b7 : ad cc 87 LDA $87cc ; (canvas + 6)
03:b0ba : 85 1c __ STA ACCU + 1 
03:b0bc : a5 46 __ LDA T5 + 0 
03:b0be : 85 03 __ STA WORK + 0 
03:b0c0 : a5 47 __ LDA T5 + 1 
03:b0c2 : 85 04 __ STA WORK + 1 
03:b0c4 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b0c7 : 18 __ __ CLC
03:b0c8 : a5 05 __ LDA WORK + 2 
03:b0ca : 65 0e __ ADC P1 
03:b0cc : a8 __ __ TAY
03:b0cd : a5 06 __ LDA WORK + 3 
03:b0cf : 65 0f __ ADC P2 
03:b0d1 : aa __ __ TAX
03:b0d2 : 98 __ __ TYA
03:b0d3 : 18 __ __ CLC
03:b0d4 : 69 30 __ ADC #$30
03:b0d6 : 85 0e __ STA P1 
03:b0d8 : 90 01 __ BCC $b0db ; (plotvisible.s1014 + 0)
.s1013:
03:b0da : e8 __ __ INX
.s1014:
03:b0db : 86 0f __ STX P2 
03:b0dd : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
03:b0e0 : a6 43 __ LDX T0 + 0 
03:b0e2 : 86 0f __ STX P2 
.s1012:
03:b0e4 : 85 10 __ STA P3 
03:b0e6 : 38 __ __ SEC
03:b0e7 : a5 11 __ LDA P4 ; (row + 0)
03:b0e9 : e5 44 __ SBC T2 + 0 
03:b0eb : 85 0e __ STA P1 
03:b0ed : 38 __ __ SEC
03:b0ee : a5 12 __ LDA P5 ; (col + 0)
03:b0f0 : e5 45 __ SBC T4 + 0 
03:b0f2 : 85 0d __ STA P0 
03:b0f4 : 4c fc 34 JMP $34fc ; (vdc_printc.s0 + 0)
.s1001:
03:b0f7 : 60 __ __ RTS
--------------------------------------------------------------------
03:b0f8 : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
movemode: ; movemode()->void
.s1000:
03:b0fd : a2 0d __ LDX #$0d
03:b0ff : b5 53 __ LDA T0 + 0,x 
03:b101 : 9d bc ab STA $abbc,x ; (projbuffer + 36)
03:b104 : ca __ __ DEX
03:b105 : 10 f8 __ BPL $b0ff ; (movemode.s1000 + 2)
.s0:
03:b107 : a2 ff __ LDX #$ff
.l1002:
03:b109 : e8 __ __ INX
03:b10a : bd ac b3 LDA $b3ac,x 
03:b10d : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:b110 : d0 f7 __ BNE $b109 ; (movemode.l1002 + 0)
.s1003:
03:b112 : 20 49 3e JSR $3e49 ; (vdcwin_cursor_toggle@proxy + 0)
03:b115 : ad fe 69 LDA $69fe ; (undoenabled + 0)
03:b118 : c9 01 __ CMP #$01
03:b11a : d0 1c __ BNE $b138 ; (movemode.s138 + 0)
.s1:
03:b11c : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
03:b11f : 85 56 __ STA T2 + 0 
03:b121 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
03:b124 : 18 __ __ CLC
03:b125 : 69 01 __ ADC #$01
03:b127 : 8d f3 ab STA $abf3 ; (sstack + 0)
03:b12a : a9 00 __ LDA #$00
03:b12c : 85 16 __ STA P9 
03:b12e : 85 17 __ STA P10 
03:b130 : a6 56 __ LDX T2 + 0 
03:b132 : e8 __ __ INX
03:b133 : 86 18 __ STX P11 
03:b135 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s138:
03:b138 : a9 00 __ LDA #$00
03:b13a : 85 56 __ STA T2 + 0 
03:b13c : ad ff 87 LDA $87ff ; (showbar + 0)
03:b13f : f0 03 __ BEQ $b144 ; (movemode.l8 + 0)
.s4:
03:b141 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
.l8:
03:b144 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
03:b147 : a5 1b __ LDA ACCU + 0 
03:b149 : 85 53 __ STA T0 + 0 
03:b14b : c9 8c __ CMP #$8c
03:b14d : d0 0b __ BNE $b15a ; (movemode.s29 + 0)
.s25:
03:b14f : a9 03 __ LDA #$03
03:b151 : 8d f8 ab STA $abf8 ; (sstack + 5)
03:b154 : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
03:b157 : 4c 81 b1 JMP $b181 ; (movemode.s37 + 0)
.s29:
03:b15a : b0 03 __ BCS $b15f ; (movemode.s30 + 0)
03:b15c : 4c 77 b3 JMP $b377 ; (movemode.s31 + 0)
.s30:
03:b15f : c9 91 __ CMP #$91
03:b161 : d0 13 __ BNE $b176 ; (movemode.s34 + 0)
.s23:
03:b163 : 20 06 4a JSR $4a06 ; (vdcwin_scroll_up@proxy + 0)
03:b166 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
03:b169 : 85 56 __ STA T2 + 0 
03:b16b : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
03:b16e : a6 56 __ LDX T2 + 0 
03:b170 : 86 10 __ STX P3 
03:b172 : a8 __ __ TAY
03:b173 : 4c 62 b3 JMP $b362 ; (movemode.s153 + 0)
.s34:
03:b176 : c9 9d __ CMP #$9d
03:b178 : d0 03 __ BNE $b17d ; (movemode.s10 + 0)
03:b17a : 4c 2e b3 JMP $b32e ; (movemode.s17 + 0)
.s10:
03:b17d : c9 0d __ CMP #$0d
03:b17f : f0 0a __ BEQ $b18b ; (movemode.s9 + 0)
.s37:
03:b181 : a5 53 __ LDA T0 + 0 
03:b183 : c9 1b __ CMP #$1b
03:b185 : f0 04 __ BEQ $b18b ; (movemode.s9 + 0)
.s36:
03:b187 : c9 03 __ CMP #$03
03:b189 : d0 b9 __ BNE $b144 ; (movemode.l8 + 0)
.s9:
03:b18b : a5 56 __ LDA T2 + 0 
03:b18d : c9 01 __ CMP #$01
03:b18f : f0 2b __ BEQ $b1bc ; (movemode.s38 + 0)
.s39:
03:b191 : ad fe 69 LDA $69fe ; (undoenabled + 0)
03:b194 : c9 01 __ CMP #$01
03:b196 : d0 03 __ BNE $b19b ; (movemode.s152 + 0)
.s55:
03:b198 : 20 42 59 JSR $5942 ; (undo_escapeundo.s0 + 0)
.s152:
03:b19b : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
03:b19e : a2 ff __ LDX #$ff
.l1004:
03:b1a0 : e8 __ __ INX
03:b1a1 : bd f8 b0 LDA $b0f8,x 
03:b1a4 : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:b1a7 : d0 f7 __ BNE $b1a0 ; (movemode.l1004 + 0)
.s1005:
03:b1a9 : ad ff 87 LDA $87ff ; (showbar + 0)
03:b1ac : f0 03 __ BEQ $b1b1 ; (movemode.s1001 + 0)
.s58:
03:b1ae : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s1001:
03:b1b1 : a2 0d __ LDX #$0d
03:b1b3 : bd bc ab LDA $abbc,x ; (projbuffer + 36)
03:b1b6 : 95 53 __ STA T0 + 0,x 
03:b1b8 : ca __ __ DEX
03:b1b9 : 10 f8 __ BPL $b1b3 ; (movemode.s1001 + 2)
03:b1bb : 60 __ __ RTS
.s38:
03:b1bc : a5 53 __ LDA T0 + 0 
03:b1be : c9 0d __ CMP #$0d
03:b1c0 : d0 18 __ BNE $b1da ; (movemode.s43 + 0)
.s41:
03:b1c2 : a9 00 __ LDA #$00
03:b1c4 : 85 56 __ STA T2 + 0 
.l44:
03:b1c6 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
03:b1c9 : 18 __ __ CLC
03:b1ca : 69 01 __ ADC #$01
03:b1cc : 90 04 __ BCC $b1d2 ; (movemode.s1010 + 0)
.s1052:
03:b1ce : a5 56 __ LDA T2 + 0 
03:b1d0 : b0 2a __ BCS $b1fc ; (movemode.s45 + 0)
.s1010:
03:b1d2 : 85 53 __ STA T0 + 0 
03:b1d4 : a5 56 __ LDA T2 + 0 
03:b1d6 : c5 53 __ CMP T0 + 0 
03:b1d8 : 90 22 __ BCC $b1fc ; (movemode.s45 + 0)
.s43:
03:b1da : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
03:b1dd : ad ff 87 LDA $87ff ; (showbar + 0)
03:b1e0 : f0 b9 __ BEQ $b19b ; (movemode.s152 + 0)
.s52:
03:b1e2 : 85 56 __ STA T2 + 0 
03:b1e4 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
03:b1e7 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
03:b1ea : a2 ff __ LDX #$ff
.l1008:
03:b1ec : e8 __ __ INX
03:b1ed : bd f8 b0 LDA $b0f8,x 
03:b1f0 : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:b1f3 : d0 f7 __ BNE $b1ec ; (movemode.l1008 + 0)
.s1009:
03:b1f5 : a5 56 __ LDA T2 + 0 
03:b1f7 : f0 b8 __ BEQ $b1b1 ; (movemode.s1001 + 0)
03:b1f9 : 4c ae b1 JMP $b1ae ; (movemode.s58 + 0)
.s45:
03:b1fc : 0a __ __ ASL
03:b1fd : 85 53 __ STA T0 + 0 
03:b1ff : aa __ __ TAX
03:b200 : bd 00 88 LDA $8800,x ; (multab + 0)
03:b203 : 85 57 __ STA T4 + 0 
03:b205 : bd 01 88 LDA $8801,x ; (multab + 1)
03:b208 : 85 58 __ STA T4 + 1 
03:b20a : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b20d : 85 59 __ STA T5 + 0 
03:b20f : ad ca 87 LDA $87ca ; (canvas + 4)
03:b212 : 85 5a __ STA T5 + 1 
03:b214 : ad cd 87 LDA $87cd ; (canvas + 7)
03:b217 : 85 5b __ STA T6 + 0 
03:b219 : ad ce 87 LDA $87ce ; (canvas + 8)
03:b21c : 85 5c __ STA T6 + 1 
03:b21e : ad b5 87 LDA $87b5 ; (vdc_state + 8)
03:b221 : 85 5d __ STA T7 + 0 
03:b223 : ad b6 87 LDA $87b6 ; (vdc_state + 9)
03:b226 : 85 5e __ STA T7 + 1 
03:b228 : ad cf 87 LDA $87cf ; (canvas + 9)
03:b22b : 85 5f __ STA T8 + 0 
03:b22d : ad d0 87 LDA $87d0 ; (canvas + 10)
03:b230 : 85 60 __ STA T8 + 1 
03:b232 : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
03:b235 : 18 __ __ CLC
03:b236 : 69 01 __ ADC #$01
03:b238 : 85 12 __ STA P5 
03:b23a : a9 00 __ LDA #$00
03:b23c : 2a __ __ ROL
03:b23d : 85 13 __ STA P6 
03:b23f : a5 5d __ LDA T7 + 0 
03:b241 : 65 57 __ ADC T4 + 0 
03:b243 : 85 10 __ STA P3 
03:b245 : a5 5e __ LDA T7 + 1 
03:b247 : 65 58 __ ADC T4 + 1 
03:b249 : 85 11 __ STA P4 
03:b24b : a9 7f __ LDA #$7f
03:b24d : 85 0d __ STA P0 
03:b24f : 18 __ __ CLC
03:b250 : a5 5f __ LDA T8 + 0 
03:b252 : 65 56 __ ADC T2 + 0 
03:b254 : 85 1b __ STA ACCU + 0 
03:b256 : a5 60 __ LDA T8 + 1 
03:b258 : 69 00 __ ADC #$00
03:b25a : 85 1c __ STA ACCU + 1 
03:b25c : a5 59 __ LDA T5 + 0 
03:b25e : 85 03 __ STA WORK + 0 
03:b260 : a5 5a __ LDA T5 + 1 
03:b262 : 85 04 __ STA WORK + 1 
03:b264 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b267 : 18 __ __ CLC
03:b268 : a5 06 __ LDA WORK + 3 
03:b26a : 69 58 __ ADC #$58
03:b26c : aa __ __ TAX
03:b26d : 18 __ __ CLC
03:b26e : a5 05 __ LDA WORK + 2 
03:b270 : 65 5b __ ADC T6 + 0 
03:b272 : 85 0e __ STA P1 
03:b274 : 8a __ __ TXA
03:b275 : 65 5c __ ADC T6 + 1 
03:b277 : 85 0f __ STA P2 
03:b279 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:b27c : ad b7 87 LDA $87b7 ; (vdc_state + 10)
03:b27f : 85 57 __ STA T4 + 0 
03:b281 : ad b8 87 LDA $87b8 ; (vdc_state + 11)
03:b284 : 85 58 __ STA T4 + 1 
03:b286 : a6 53 __ LDX T0 + 0 
03:b288 : bd 00 88 LDA $8800,x ; (multab + 0)
03:b28b : 85 53 __ STA T0 + 0 
03:b28d : bd 01 88 LDA $8801,x ; (multab + 1)
03:b290 : 85 54 __ STA T0 + 1 
03:b292 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b295 : 85 59 __ STA T5 + 0 
03:b297 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b29a : 85 5a __ STA T5 + 1 
03:b29c : ad cb 87 LDA $87cb ; (canvas + 5)
03:b29f : 85 5b __ STA T6 + 0 
03:b2a1 : ad cc 87 LDA $87cc ; (canvas + 6)
03:b2a4 : 85 5c __ STA T6 + 1 
03:b2a6 : ad cd 87 LDA $87cd ; (canvas + 7)
03:b2a9 : 85 5d __ STA T7 + 0 
03:b2ab : ad ce 87 LDA $87ce ; (canvas + 8)
03:b2ae : 85 5e __ STA T7 + 1 
03:b2b0 : ad cf 87 LDA $87cf ; (canvas + 9)
03:b2b3 : 85 5f __ STA T8 + 0 
03:b2b5 : ad d0 87 LDA $87d0 ; (canvas + 10)
03:b2b8 : 85 60 __ STA T8 + 1 
03:b2ba : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
03:b2bd : 18 __ __ CLC
03:b2be : 69 01 __ ADC #$01
03:b2c0 : 85 12 __ STA P5 
03:b2c2 : a9 00 __ LDA #$00
03:b2c4 : 2a __ __ ROL
03:b2c5 : 85 13 __ STA P6 
03:b2c7 : a5 53 __ LDA T0 + 0 
03:b2c9 : 65 57 __ ADC T4 + 0 
03:b2cb : 85 10 __ STA P3 
03:b2cd : a5 54 __ LDA T0 + 1 
03:b2cf : 65 58 __ ADC T4 + 1 
03:b2d1 : 85 11 __ STA P4 
03:b2d3 : 18 __ __ CLC
03:b2d4 : a5 5f __ LDA T8 + 0 
03:b2d6 : 65 56 __ ADC T2 + 0 
03:b2d8 : 85 1b __ STA ACCU + 0 
03:b2da : a5 60 __ LDA T8 + 1 
03:b2dc : 69 00 __ ADC #$00
03:b2de : 85 1c __ STA ACCU + 1 
03:b2e0 : a5 59 __ LDA T5 + 0 
03:b2e2 : 85 03 __ STA WORK + 0 
03:b2e4 : a5 5a __ LDA T5 + 1 
03:b2e6 : 85 04 __ STA WORK + 1 
03:b2e8 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b2eb : 18 __ __ CLC
03:b2ec : a5 06 __ LDA WORK + 3 
03:b2ee : 69 58 __ ADC #$58
03:b2f0 : aa __ __ TAX
03:b2f1 : 18 __ __ CLC
03:b2f2 : a5 05 __ LDA WORK + 2 
03:b2f4 : 65 5d __ ADC T7 + 0 
03:b2f6 : 85 53 __ STA T0 + 0 
03:b2f8 : 8a __ __ TXA
03:b2f9 : 65 5e __ ADC T7 + 1 
03:b2fb : 85 54 __ STA T0 + 1 
03:b2fd : a5 5b __ LDA T6 + 0 
03:b2ff : 85 1b __ STA ACCU + 0 
03:b301 : a5 5c __ LDA T6 + 1 
03:b303 : 85 1c __ STA ACCU + 1 
03:b305 : a5 59 __ LDA T5 + 0 
03:b307 : 85 03 __ STA WORK + 0 
03:b309 : a5 5a __ LDA T5 + 1 
03:b30b : 85 04 __ STA WORK + 1 
03:b30d : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b310 : 18 __ __ CLC
03:b311 : a5 05 __ LDA WORK + 2 
03:b313 : 65 53 __ ADC T0 + 0 
03:b315 : a8 __ __ TAY
03:b316 : a5 06 __ LDA WORK + 3 
03:b318 : 65 54 __ ADC T0 + 1 
03:b31a : aa __ __ TAX
03:b31b : 98 __ __ TYA
03:b31c : 18 __ __ CLC
03:b31d : 69 30 __ ADC #$30
03:b31f : 85 0e __ STA P1 
03:b321 : 90 01 __ BCC $b324 ; (movemode.s1054 + 0)
.s1053:
03:b323 : e8 __ __ INX
.s1054:
03:b324 : 86 0f __ STX P2 
03:b326 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:b329 : e6 56 __ INC T2 + 0 
03:b32b : 4c c6 b1 JMP $b1c6 ; (movemode.l44 + 0)
.s17:
03:b32e : 20 60 48 JSR $4860 ; (vdcwin_scroll_left@proxy + 0)
03:b331 : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
03:b334 : 85 56 __ STA T2 + 0 
03:b336 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
03:b339 : 18 __ __ CLC
03:b33a : 69 01 __ ADC #$01
03:b33c : f0 1d __ BEQ $b35b ; (movemode.s151 + 0)
.s107:
03:b33e : 85 55 __ STA T1 + 0 
03:b340 : a9 20 __ LDA #$20
03:b342 : 85 0f __ STA P2 
03:b344 : a9 0f __ LDA #$0f
03:b346 : 85 10 __ STA P3 
03:b348 : a5 56 __ LDA T2 + 0 
03:b34a : 85 0d __ STA P0 
03:b34c : a9 00 __ LDA #$00
03:b34e : 85 0e __ STA P1 
.l1048:
03:b350 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
03:b353 : e6 0e __ INC P1 
03:b355 : a5 0e __ LDA P1 
03:b357 : c5 55 __ CMP T1 + 0 
03:b359 : 90 f5 __ BCC $b350 ; (movemode.l1048 + 0)
.s151:
03:b35b : a9 01 __ LDA #$01
03:b35d : 85 56 __ STA T2 + 0 
03:b35f : 4c 81 b1 JMP $b181 ; (movemode.s37 + 0)
.s153:
03:b362 : c8 __ __ INY
03:b363 : 84 13 __ STY P6 
03:b365 : a9 00 __ LDA #$00
03:b367 : 85 0f __ STA P2 
03:b369 : a9 20 __ LDA #$20
03:b36b : 85 11 __ STA P4 
03:b36d : a9 0f __ LDA #$0f
03:b36f : 85 12 __ STA P5 
03:b371 : 20 d2 2c JSR $2cd2 ; (vdc_hchar.s0 + 0)
03:b374 : 4c 5b b3 JMP $b35b ; (movemode.s151 + 0)
.s31:
03:b377 : c9 11 __ CMP #$11
03:b379 : d0 0d __ BNE $b388 ; (movemode.s32 + 0)
.s24:
03:b37b : 20 5a 49 JSR $495a ; (vdcwin_scroll_down@proxy + 0)
03:b37e : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
03:b381 : a8 __ __ TAY
03:b382 : a9 00 __ LDA #$00
03:b384 : 85 10 __ STA P3 
03:b386 : f0 da __ BEQ $b362 ; (movemode.s153 + 0)
.s32:
03:b388 : c9 1d __ CMP #$1d
03:b38a : f0 03 __ BEQ $b38f ; (movemode.s11 + 0)
03:b38c : 4c 7d b1 JMP $b17d ; (movemode.s10 + 0)
.s11:
03:b38f : 20 91 46 JSR $4691 ; (vdcwin_scroll_right@proxy + 0)
03:b392 : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
03:b395 : 18 __ __ CLC
03:b396 : 69 01 __ ADC #$01
03:b398 : f0 c1 __ BEQ $b35b ; (movemode.s151 + 0)
.s106:
03:b39a : 85 55 __ STA T1 + 0 
03:b39c : a9 00 __ LDA #$00
03:b39e : 85 0d __ STA P0 
03:b3a0 : 85 0e __ STA P1 
03:b3a2 : a9 20 __ LDA #$20
03:b3a4 : 85 0f __ STA P2 
03:b3a6 : a9 0f __ LDA #$0f
03:b3a8 : 85 10 __ STA P3 
03:b3aa : d0 a4 __ BNE $b350 ; (movemode.l1048 + 0)
--------------------------------------------------------------------
03:b3ac : __ __ __ BYT 6d 4f 56 45 00                                  : mOVE.
--------------------------------------------------------------------
selectmode: ; selectmode()->void
.s1000:
03:b3b1 : a2 15 __ LDX #$15
03:b3b3 : b5 53 __ LDA T0 + 0,x 
03:b3b5 : 9d a9 ab STA $aba9,x ; (chareditor@stack + 25)
03:b3b8 : ca __ __ DEX
03:b3b9 : 10 f8 __ BPL $b3b3 ; (selectmode.s1000 + 2)
.s0:
03:b3bb : a9 00 __ LDA #$00
03:b3bd : 8d fc ab STA $abfc ; (sstack + 9)
03:b3c0 : a2 ff __ LDX #$ff
.l1002:
03:b3c2 : e8 __ __ INX
03:b3c3 : bd 61 ba LDA $ba61,x 
03:b3c6 : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:b3c9 : d0 f7 __ BNE $b3c2 ; (selectmode.l1002 + 0)
.s1003:
03:b3cb : 20 00 ac JSR $ac00 ; (lineandbox.s1000 + 0)
03:b3ce : ad d5 88 LDA $88d5 ; (select_accept + 0)
03:b3d1 : 0d d6 88 ORA $88d6 ; (select_accept + 1)
03:b3d4 : d0 03 __ BNE $b3d9 ; (selectmode.s3 + 0)
03:b3d6 : 4c ac b5 JMP $b5ac ; (selectmode.s1001 + 0)
.s3:
03:b3d9 : a2 ff __ LDX #$ff
.l1004:
03:b3db : e8 __ __ INX
03:b3dc : bd 68 ba LDA $ba68,x 
03:b3df : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:b3e2 : d0 f7 __ BNE $b3db ; (selectmode.l1004 + 0)
.l330:
03:b3e4 : ad ff 87 LDA $87ff ; (showbar + 0)
03:b3e7 : f0 03 __ BEQ $b3ec ; (selectmode.s9 + 0)
.s7:
03:b3e9 : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s9:
03:b3ec : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
03:b3ef : a5 1b __ LDA ACCU + 0 
03:b3f1 : 85 53 __ STA T0 + 0 
03:b3f3 : c9 8b __ CMP #$8b
03:b3f5 : d0 08 __ BNE $b3ff ; (selectmode.s12 + 0)
.s10:
03:b3f7 : 20 4f 50 JSR $504f ; (togglestatusbar.s0 + 0)
03:b3fa : a5 53 __ LDA T0 + 0 
03:b3fc : 4c 0e b4 JMP $b40e ; (selectmode.s15 + 0)
.s12:
03:b3ff : c9 8c __ CMP #$8c
03:b401 : d0 0b __ BNE $b40e ; (selectmode.s15 + 0)
.s13:
03:b403 : a9 03 __ LDA #$03
03:b405 : 8d f8 ab STA $abf8 ; (sstack + 5)
03:b408 : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
03:b40b : 4c 12 b4 JMP $b412 ; (selectmode.s21 + 0)
.s15:
03:b40e : c9 44 __ CMP #$44
03:b410 : f0 1a __ BEQ $b42c ; (selectmode.s6 + 0)
.s21:
03:b412 : a5 53 __ LDA T0 + 0 
03:b414 : c9 58 __ CMP #$58
03:b416 : f0 14 __ BEQ $b42c ; (selectmode.s6 + 0)
.s20:
03:b418 : c9 43 __ CMP #$43
03:b41a : f0 10 __ BEQ $b42c ; (selectmode.s6 + 0)
.s19:
03:b41c : c9 50 __ CMP #$50
03:b41e : f0 0c __ BEQ $b42c ; (selectmode.s6 + 0)
.s18:
03:b420 : c9 41 __ CMP #$41
03:b422 : f0 08 __ BEQ $b42c ; (selectmode.s6 + 0)
.s17:
03:b424 : c9 1b __ CMP #$1b
03:b426 : f0 0e __ BEQ $b436 ; (selectmode.s23 + 0)
.s16:
03:b428 : c9 03 __ CMP #$03
03:b42a : d0 b8 __ BNE $b3e4 ; (selectmode.l330 + 0)
.s6:
03:b42c : a5 53 __ LDA T0 + 0 
03:b42e : c9 1b __ CMP #$1b
03:b430 : f0 04 __ BEQ $b436 ; (selectmode.s23 + 0)
.s25:
03:b432 : c9 03 __ CMP #$03
03:b434 : d0 06 __ BNE $b43c ; (selectmode.s22 + 0)
.s23:
03:b436 : 20 42 59 JSR $5942 ; (undo_escapeundo.s0 + 0)
03:b439 : 4c a1 b5 JMP $b5a1 ; (selectmode.s1105 + 0)
.s22:
03:b43c : c9 58 __ CMP #$58
03:b43e : d0 04 __ BNE $b444 ; (selectmode.s1009 + 0)
.s1008:
03:b440 : a2 01 __ LDX #$01
03:b442 : d0 06 __ BNE $b44a ; (selectmode.s29 + 0)
.s1009:
03:b444 : a2 00 __ LDX #$00
03:b446 : c9 43 __ CMP #$43
03:b448 : d0 1b __ BNE $b465 ; (selectmode.s28 + 0)
.s29:
03:b44a : a9 10 __ LDA #$10
03:b44c : cd d8 88 CMP $88d8 ; (select_width + 1)
03:b44f : d0 05 __ BNE $b456 ; (selectmode.s1078 + 0)
.s1077:
03:b451 : a9 00 __ LDA #$00
03:b453 : cd d7 88 CMP $88d7 ; (select_width + 0)
.s1078:
03:b456 : b0 0d __ BCS $b465 ; (selectmode.s28 + 0)
.s26:
03:b458 : 20 84 59 JSR $5984 ; (loadsyscharset.s0 + 0)
03:b45b : a9 73 __ LDA #$73
03:b45d : 8d f6 ab STA $abf6 ; (sstack + 3)
03:b460 : a9 ba __ LDA #$ba
03:b462 : 4c 44 ba JMP $ba44 ; (selectmode.s1106 + 0)
.s28:
03:b465 : 8a __ __ TXA
03:b466 : f0 07 __ BEQ $b46f ; (selectmode.s35 + 0)
.s36:
03:b468 : a9 ba __ LDA #$ba
03:b46a : a2 86 __ LDX #$86
03:b46c : 4c 2a b7 JMP $b72a ; (selectmode.s355 + 0)
.s35:
03:b46f : a5 53 __ LDA T0 + 0 
03:b471 : c9 43 __ CMP #$43
03:b473 : d0 07 __ BNE $b47c ; (selectmode.s34 + 0)
.s32:
03:b475 : a9 ba __ LDA #$ba
03:b477 : a2 8a __ LDX #$8a
03:b479 : 4c 2a b7 JMP $b72a ; (selectmode.s355 + 0)
.s34:
03:b47c : a5 53 __ LDA T0 + 0 
03:b47e : c9 44 __ CMP #$44
03:b480 : d0 13 __ BNE $b495 ; (selectmode.s94 + 0)
.s92:
03:b482 : ad d9 88 LDA $88d9 ; (select_height + 0)
03:b485 : 0d da 88 ORA $88da ; (select_height + 1)
03:b488 : f0 0b __ BEQ $b495 ; (selectmode.s94 + 0)
.s135:
03:b48a : a9 00 __ LDA #$00
03:b48c : 85 56 __ STA T2 + 0 
03:b48e : a9 20 __ LDA #$20
03:b490 : 85 0f __ STA P2 
03:b492 : 4c 69 b6 JMP $b669 ; (selectmode.l1103 + 0)
.s94:
03:b495 : a5 53 __ LDA T0 + 0 
03:b497 : c9 41 __ CMP #$41
03:b499 : d0 0f __ BNE $b4aa ; (selectmode.s105 + 0)
.s103:
03:b49b : ad d9 88 LDA $88d9 ; (select_height + 0)
03:b49e : 0d da 88 ORA $88da ; (select_height + 1)
03:b4a1 : f0 07 __ BEQ $b4aa ; (selectmode.s105 + 0)
.s134:
03:b4a3 : a9 00 __ LDA #$00
03:b4a5 : 85 56 __ STA T2 + 0 
03:b4a7 : 4c b7 b5 JMP $b5b7 ; (selectmode.l107 + 0)
.s105:
03:b4aa : a5 53 __ LDA T0 + 0 
03:b4ac : c9 50 __ CMP #$50
03:b4ae : f0 03 __ BEQ $b4b3 ; (selectmode.s114 + 0)
03:b4b0 : 4c 93 b5 JMP $b593 ; (selectmode.s116 + 0)
.s114:
03:b4b3 : ad d9 88 LDA $88d9 ; (select_height + 0)
03:b4b6 : 0d da 88 ORA $88da ; (select_height + 1)
03:b4b9 : d0 03 __ BNE $b4be ; (selectmode.s133 + 0)
03:b4bb : 4c 93 b5 JMP $b593 ; (selectmode.s116 + 0)
.s133:
03:b4be : ad d7 88 LDA $88d7 ; (select_width + 0)
03:b4c1 : 0d d8 88 ORA $88d8 ; (select_width + 1)
03:b4c4 : c9 01 __ CMP #$01
03:b4c6 : a9 00 __ LDA #$00
03:b4c8 : 85 57 __ STA T3 + 0 
03:b4ca : 2a __ __ ROL
03:b4cb : 85 56 __ STA T2 + 0 
03:b4cd : d0 19 __ BNE $b4e8 ; (selectmode.l132 + 0)
.s1110:
03:b4cf : a2 00 __ LDX #$00
03:b4d1 : a0 00 __ LDY #$00
.l119:
03:b4d3 : e8 __ __ INX
03:b4d4 : ad da 88 LDA $88da ; (select_height + 1)
03:b4d7 : d0 08 __ BNE $b4e1 ; (selectmode.s118 + 0)
.s1022:
03:b4d9 : ec d9 88 CPX $88d9 ; (select_height + 0)
03:b4dc : 90 03 __ BCC $b4e1 ; (selectmode.s118 + 0)
03:b4de : 4c 93 b5 JMP $b593 ; (selectmode.s116 + 0)
.s118:
03:b4e1 : 98 __ __ TYA
03:b4e2 : f0 ef __ BEQ $b4d3 ; (selectmode.l119 + 0)
.s1107:
03:b4e4 : 86 57 __ STX T3 + 0 
03:b4e6 : 85 56 __ STA T2 + 0 
.l132:
03:b4e8 : a5 57 __ LDA T3 + 0 
03:b4ea : 85 53 __ STA T0 + 0 
03:b4ec : a9 00 __ LDA #$00
03:b4ee : 85 66 __ STA T11 + 0 
.l122:
03:b4f0 : a9 7f __ LDA #$7f
03:b4f2 : 85 0d __ STA P0 
03:b4f4 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:b4f7 : 18 __ __ CLC
03:b4f8 : 65 66 __ ADC T11 + 0 
03:b4fa : 85 54 __ STA T1 + 0 
03:b4fc : ad ce 88 LDA $88ce ; (select_startx + 1)
03:b4ff : 69 00 __ ADC #$00
03:b501 : 85 55 __ STA T1 + 1 
03:b503 : ad cf 88 LDA $88cf ; (select_starty + 0)
03:b506 : 18 __ __ CLC
03:b507 : 65 53 __ ADC T0 + 0 
03:b509 : 85 03 __ STA WORK + 0 
03:b50b : ad d0 88 LDA $88d0 ; (select_starty + 1)
03:b50e : 69 00 __ ADC #$00
03:b510 : 85 04 __ STA WORK + 1 
03:b512 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b515 : 85 1b __ STA ACCU + 0 
03:b517 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b51a : 85 1c __ STA ACCU + 1 
03:b51c : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b51f : 18 __ __ CLC
03:b520 : a5 06 __ LDA WORK + 3 
03:b522 : 69 58 __ ADC #$58
03:b524 : aa __ __ TAX
03:b525 : 18 __ __ CLC
03:b526 : a5 05 __ LDA WORK + 2 
03:b528 : 65 54 __ ADC T1 + 0 
03:b52a : 85 54 __ STA T1 + 0 
03:b52c : 8a __ __ TXA
03:b52d : 65 55 __ ADC T1 + 1 
03:b52f : 85 55 __ STA T1 + 1 
03:b531 : ad cb 87 LDA $87cb ; (canvas + 5)
03:b534 : 85 1b __ STA ACCU + 0 
03:b536 : ad cc 87 LDA $87cc ; (canvas + 6)
03:b539 : 85 1c __ STA ACCU + 1 
03:b53b : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b53e : 85 03 __ STA WORK + 0 
03:b540 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b543 : 85 04 __ STA WORK + 1 
03:b545 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b548 : 18 __ __ CLC
03:b549 : a5 05 __ LDA WORK + 2 
03:b54b : 65 54 __ ADC T1 + 0 
03:b54d : aa __ __ TAX
03:b54e : a5 06 __ LDA WORK + 3 
03:b550 : 65 55 __ ADC T1 + 1 
03:b552 : a8 __ __ TAY
03:b553 : 8a __ __ TXA
03:b554 : 18 __ __ CLC
03:b555 : 69 30 __ ADC #$30
03:b557 : 85 0e __ STA P1 
03:b559 : 90 01 __ BCC $b55c ; (selectmode.s1122 + 0)
.s1121:
03:b55b : c8 __ __ INY
.s1122:
03:b55c : 84 0f __ STY P2 
03:b55e : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
03:b561 : 29 f0 __ AND #$f0
03:b563 : 85 54 __ STA T1 + 0 
03:b565 : a5 0e __ LDA P1 
03:b567 : 85 0d __ STA P0 
03:b569 : a5 0f __ LDA P2 
03:b56b : 85 0e __ STA P1 
03:b56d : ad 92 87 LDA $8792 ; (plotcolor + 0)
03:b570 : 18 __ __ CLC
03:b571 : 65 54 __ ADC T1 + 0 
03:b573 : 85 0f __ STA P2 
03:b575 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
03:b578 : e6 66 __ INC T11 + 0 
03:b57a : ad d8 88 LDA $88d8 ; (select_width + 1)
03:b57d : f0 03 __ BEQ $b582 ; (selectmode.s1020 + 0)
03:b57f : 4c f0 b4 JMP $b4f0 ; (selectmode.l122 + 0)
.s1020:
03:b582 : a5 66 __ LDA T11 + 0 
03:b584 : cd d7 88 CMP $88d7 ; (select_width + 0)
03:b587 : b0 03 __ BCS $b58c ; (selectmode.s1109 + 0)
03:b589 : 4c f0 b4 JMP $b4f0 ; (selectmode.l122 + 0)
.s1109:
03:b58c : a6 57 __ LDX T3 + 0 
03:b58e : a4 56 __ LDY T2 + 0 
03:b590 : 4c d3 b4 JMP $b4d3 ; (selectmode.l119 + 0)
.s116:
03:b593 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
03:b596 : ad ff 87 LDA $87ff ; (showbar + 0)
03:b599 : f0 03 __ BEQ $b59e ; (selectmode.s131 + 0)
.s129:
03:b59b : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s131:
03:b59e : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
.s1105:
03:b5a1 : a2 ff __ LDX #$ff
.l1006:
03:b5a3 : e8 __ __ INX
03:b5a4 : bd f8 b0 LDA $b0f8,x 
03:b5a7 : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:b5aa : d0 f7 __ BNE $b5a3 ; (selectmode.l1006 + 0)
.s1001:
03:b5ac : a2 15 __ LDX #$15
03:b5ae : bd a9 ab LDA $aba9,x ; (chareditor@stack + 25)
03:b5b1 : 95 53 __ STA T0 + 0,x 
03:b5b3 : ca __ __ DEX
03:b5b4 : 10 f8 __ BPL $b5ae ; (selectmode.s1001 + 2)
03:b5b6 : 60 __ __ RTS
.l107:
03:b5b7 : ad cf 88 LDA $88cf ; (select_starty + 0)
03:b5ba : 18 __ __ CLC
03:b5bb : 65 56 __ ADC T2 + 0 
03:b5bd : 85 03 __ STA WORK + 0 
03:b5bf : ad d0 88 LDA $88d0 ; (select_starty + 1)
03:b5c2 : 69 00 __ ADC #$00
03:b5c4 : 85 04 __ STA WORK + 1 
03:b5c6 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b5c9 : 85 1b __ STA ACCU + 0 
03:b5cb : ad ca 87 LDA $87ca ; (canvas + 4)
03:b5ce : 85 1c __ STA ACCU + 1 
03:b5d0 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b5d3 : 18 __ __ CLC
03:b5d4 : a5 06 __ LDA WORK + 3 
03:b5d6 : 69 58 __ ADC #$58
03:b5d8 : aa __ __ TAX
03:b5d9 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:b5dc : 18 __ __ CLC
03:b5dd : 65 05 __ ADC WORK + 2 
03:b5df : 85 54 __ STA T1 + 0 
03:b5e1 : 8a __ __ TXA
03:b5e2 : 6d ce 88 ADC $88ce ; (select_startx + 1)
03:b5e5 : 85 55 __ STA T1 + 1 
03:b5e7 : ad cb 87 LDA $87cb ; (canvas + 5)
03:b5ea : 85 1b __ STA ACCU + 0 
03:b5ec : ad cc 87 LDA $87cc ; (canvas + 6)
03:b5ef : 85 1c __ STA ACCU + 1 
03:b5f1 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b5f4 : 85 03 __ STA WORK + 0 
03:b5f6 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b5f9 : 85 04 __ STA WORK + 1 
03:b5fb : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b5fe : 18 __ __ CLC
03:b5ff : a5 05 __ LDA WORK + 2 
03:b601 : 65 54 __ ADC T1 + 0 
03:b603 : aa __ __ TAX
03:b604 : a5 06 __ LDA WORK + 3 
03:b606 : 65 55 __ ADC T1 + 1 
03:b608 : a8 __ __ TAY
03:b609 : 8a __ __ TXA
03:b60a : 18 __ __ CLC
03:b60b : 69 30 __ ADC #$30
03:b60d : 85 0d __ STA P0 
03:b60f : 90 01 __ BCC $b612 ; (selectmode.s1120 + 0)
.s1119:
03:b611 : c8 __ __ INY
.s1120:
03:b612 : 84 0e __ STY P1 
03:b614 : ad 95 87 LDA $8795 ; (plotblink + 0)
03:b617 : 0a __ __ ASL
03:b618 : 0a __ __ ASL
03:b619 : 0a __ __ ASL
03:b61a : 0a __ __ ASL
03:b61b : 18 __ __ CLC
03:b61c : 6d 92 87 ADC $8792 ; (plotcolor + 0)
03:b61f : 85 54 __ STA T1 + 0 
03:b621 : ad 94 87 LDA $8794 ; (plotunderline + 0)
03:b624 : 4a __ __ LSR
03:b625 : 6a __ __ ROR
03:b626 : 6a __ __ ROR
03:b627 : 29 c0 __ AND #$c0
03:b629 : 6a __ __ ROR
03:b62a : 65 54 __ ADC T1 + 0 
03:b62c : 85 54 __ STA T1 + 0 
03:b62e : ad 93 87 LDA $8793 ; (plotreverse + 0)
03:b631 : 4a __ __ LSR
03:b632 : 6a __ __ ROR
03:b633 : 29 80 __ AND #$80
03:b635 : 6a __ __ ROR
03:b636 : 65 54 __ ADC T1 + 0 
03:b638 : 85 54 __ STA T1 + 0 
03:b63a : ad 96 87 LDA $8796 ; (plotaltchar + 0)
03:b63d : 4a __ __ LSR
03:b63e : a9 00 __ LDA #$00
03:b640 : 6a __ __ ROR
03:b641 : 65 54 __ ADC T1 + 0 
03:b643 : 85 0f __ STA P2 
03:b645 : ad d7 88 LDA $88d7 ; (select_width + 0)
03:b648 : 85 10 __ STA P3 
03:b64a : ad d8 88 LDA $88d8 ; (select_width + 1)
03:b64d : 85 11 __ STA P4 
03:b64f : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
03:b652 : e6 56 __ INC T2 + 0 
03:b654 : ad da 88 LDA $88da ; (select_height + 1)
03:b657 : f0 03 __ BEQ $b65c ; (selectmode.s1026 + 0)
03:b659 : 4c b7 b5 JMP $b5b7 ; (selectmode.l107 + 0)
.s1026:
03:b65c : a5 56 __ LDA T2 + 0 
03:b65e : cd d9 88 CMP $88d9 ; (select_height + 0)
03:b661 : b0 03 __ BCS $b666 ; (selectmode.s1026 + 10)
03:b663 : 4c b7 b5 JMP $b5b7 ; (selectmode.l107 + 0)
03:b666 : 4c aa b4 JMP $b4aa ; (selectmode.s105 + 0)
.l1103:
03:b669 : ad cf 88 LDA $88cf ; (select_starty + 0)
03:b66c : 18 __ __ CLC
03:b66d : 65 56 __ ADC T2 + 0 
03:b66f : 85 54 __ STA T1 + 0 
03:b671 : 85 03 __ STA WORK + 0 
03:b673 : ad d0 88 LDA $88d0 ; (select_starty + 1)
03:b676 : 69 00 __ ADC #$00
03:b678 : 85 55 __ STA T1 + 1 
03:b67a : 85 04 __ STA WORK + 1 
03:b67c : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b67f : 85 1b __ STA ACCU + 0 
03:b681 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b684 : 85 1c __ STA ACCU + 1 
03:b686 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b689 : 18 __ __ CLC
03:b68a : a5 06 __ LDA WORK + 3 
03:b68c : 69 58 __ ADC #$58
03:b68e : 85 59 __ STA T4 + 1 
03:b690 : ad cd 88 LDA $88cd ; (select_startx + 0)
03:b693 : 85 5a __ STA T5 + 0 
03:b695 : 18 __ __ CLC
03:b696 : 65 05 __ ADC WORK + 2 
03:b698 : 85 0d __ STA P0 
03:b69a : ad ce 88 LDA $88ce ; (select_startx + 1)
03:b69d : 85 5b __ STA T5 + 1 
03:b69f : 65 59 __ ADC T4 + 1 
03:b6a1 : 85 0e __ STA P1 
03:b6a3 : ad d7 88 LDA $88d7 ; (select_width + 0)
03:b6a6 : 85 58 __ STA T4 + 0 
03:b6a8 : 85 10 __ STA P3 
03:b6aa : ad d8 88 LDA $88d8 ; (select_width + 1)
03:b6ad : 85 59 __ STA T4 + 1 
03:b6af : 85 11 __ STA P4 
03:b6b1 : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
03:b6b4 : a5 58 __ LDA T4 + 0 
03:b6b6 : 85 10 __ STA P3 
03:b6b8 : a5 59 __ LDA T4 + 1 
03:b6ba : 85 11 __ STA P4 
03:b6bc : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b6bf : 85 1b __ STA ACCU + 0 
03:b6c1 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b6c4 : 85 1c __ STA ACCU + 1 
03:b6c6 : a5 54 __ LDA T1 + 0 
03:b6c8 : 85 03 __ STA WORK + 0 
03:b6ca : a5 55 __ LDA T1 + 1 
03:b6cc : 85 04 __ STA WORK + 1 
03:b6ce : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b6d1 : 18 __ __ CLC
03:b6d2 : a5 06 __ LDA WORK + 3 
03:b6d4 : 69 58 __ ADC #$58
03:b6d6 : aa __ __ TAX
03:b6d7 : 18 __ __ CLC
03:b6d8 : a5 05 __ LDA WORK + 2 
03:b6da : 65 5a __ ADC T5 + 0 
03:b6dc : 85 54 __ STA T1 + 0 
03:b6de : 8a __ __ TXA
03:b6df : 65 5b __ ADC T5 + 1 
03:b6e1 : 85 55 __ STA T1 + 1 
03:b6e3 : ad cb 87 LDA $87cb ; (canvas + 5)
03:b6e6 : 85 1b __ STA ACCU + 0 
03:b6e8 : ad cc 87 LDA $87cc ; (canvas + 6)
03:b6eb : 85 1c __ STA ACCU + 1 
03:b6ed : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b6f0 : 85 03 __ STA WORK + 0 
03:b6f2 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b6f5 : 85 04 __ STA WORK + 1 
03:b6f7 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b6fa : 18 __ __ CLC
03:b6fb : a5 05 __ LDA WORK + 2 
03:b6fd : 65 54 __ ADC T1 + 0 
03:b6ff : aa __ __ TAX
03:b700 : a5 06 __ LDA WORK + 3 
03:b702 : 65 55 __ ADC T1 + 1 
03:b704 : a8 __ __ TAY
03:b705 : 8a __ __ TXA
03:b706 : 18 __ __ CLC
03:b707 : 69 30 __ ADC #$30
03:b709 : 85 0d __ STA P0 
03:b70b : 90 01 __ BCC $b70e ; (selectmode.s1118 + 0)
.s1117:
03:b70d : c8 __ __ INY
.s1118:
03:b70e : 84 0e __ STY P1 
03:b710 : 20 e2 14 JSR $14e2 ; (bnk_memset.s0 + 0)
03:b713 : e6 56 __ INC T2 + 0 
03:b715 : ad da 88 LDA $88da ; (select_height + 1)
03:b718 : f0 03 __ BEQ $b71d ; (selectmode.s1030 + 0)
03:b71a : 4c 69 b6 JMP $b669 ; (selectmode.l1103 + 0)
.s1030:
03:b71d : a5 56 __ LDA T2 + 0 
03:b71f : cd d9 88 CMP $88d9 ; (select_height + 0)
03:b722 : b0 03 __ BCS $b727 ; (selectmode.s1030 + 10)
03:b724 : 4c 69 b6 JMP $b669 ; (selectmode.l1103 + 0)
03:b727 : 4c 95 b4 JMP $b495 ; (selectmode.s94 + 0)
.s355:
03:b72a : 86 54 __ STX T1 + 0 
03:b72c : 85 55 __ STA T1 + 1 
03:b72e : a0 ff __ LDY #$ff
.l1034:
03:b730 : c8 __ __ INY
03:b731 : b1 54 __ LDA (T1 + 0),y 
03:b733 : 99 f4 87 STA $87f4,y ; (programmode + 0)
03:b736 : d0 f8 __ BNE $b730 ; (selectmode.l1034 + 0)
.l335:
03:b738 : ad ff 87 LDA $87ff ; (showbar + 0)
03:b73b : f0 03 __ BEQ $b740 ; (selectmode.s43 + 0)
.s41:
03:b73d : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s43:
03:b740 : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
03:b743 : a5 1b __ LDA ACCU + 0 
03:b745 : 85 54 __ STA T1 + 0 
03:b747 : c9 8c __ CMP #$8c
03:b749 : d0 0d __ BNE $b758 ; (selectmode.s50 + 0)
.s46:
03:b74b : a9 03 __ LDA #$03
03:b74d : 8d f8 ab STA $abf8 ; (sstack + 5)
03:b750 : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
03:b753 : a5 54 __ LDA T1 + 0 
03:b755 : 4c 73 b7 JMP $b773 ; (selectmode.s58 + 0)
.s50:
03:b758 : b0 03 __ BCS $b75d ; (selectmode.s51 + 0)
03:b75a : 4c 50 ba JMP $ba50 ; (selectmode.s52 + 0)
.s51:
03:b75d : c9 91 __ CMP #$91
03:b75f : f0 04 __ BEQ $b765 ; (selectmode.s45 + 0)
.s55:
03:b761 : c9 9d __ CMP #$9d
03:b763 : d0 0a __ BNE $b76f ; (selectmode.s44 + 0)
.s45:
03:b765 : a5 1b __ LDA ACCU + 0 
03:b767 : 8d fc ab STA $abfc ; (sstack + 9)
03:b76a : 20 6d 41 JSR $416d ; (plotmove.s1000 + 0)
03:b76d : a5 54 __ LDA T1 + 0 
.s44:
03:b76f : c9 1b __ CMP #$1b
03:b771 : f0 08 __ BEQ $b77b ; (selectmode.s40 + 0)
.s58:
03:b773 : c9 03 __ CMP #$03
03:b775 : f0 04 __ BEQ $b77b ; (selectmode.s40 + 0)
.s57:
03:b777 : c9 0d __ CMP #$0d
03:b779 : d0 bd __ BNE $b738 ; (selectmode.l335 + 0)
.s40:
03:b77b : a5 54 __ LDA T1 + 0 
03:b77d : c9 0d __ CMP #$0d
03:b77f : f0 03 __ BEQ $b784 ; (selectmode.s59 + 0)
03:b781 : 4c 7c b4 JMP $b47c ; (selectmode.s34 + 0)
.s59:
03:b784 : ad cd 87 LDA $87cd ; (canvas + 7)
03:b787 : 18 __ __ CLC
03:b788 : 6d 8c 87 ADC $878c ; (screen_col + 0)
03:b78b : 85 54 __ STA T1 + 0 
03:b78d : ad ce 87 LDA $87ce ; (canvas + 8)
03:b790 : 6d 8d 87 ADC $878d ; (screen_col + 1)
03:b793 : 85 55 __ STA T1 + 1 
03:b795 : ad d7 88 LDA $88d7 ; (select_width + 0)
03:b798 : 85 58 __ STA T4 + 0 
03:b79a : 18 __ __ CLC
03:b79b : 65 54 __ ADC T1 + 0 
03:b79d : 85 5a __ STA T5 + 0 
03:b79f : ad d8 88 LDA $88d8 ; (select_width + 1)
03:b7a2 : 85 59 __ STA T4 + 1 
03:b7a4 : 65 55 __ ADC T1 + 1 
03:b7a6 : 85 5b __ STA T5 + 1 
03:b7a8 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b7ab : c5 5b __ CMP T5 + 1 
03:b7ad : d0 05 __ BNE $b7b4 ; (selectmode.s1052 + 0)
.s1051:
03:b7af : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b7b2 : c5 5a __ CMP T5 + 0 
.s1052:
03:b7b4 : 90 36 __ BCC $b7ec ; (selectmode.s62 + 0)
.s65:
03:b7b6 : ad 8e 87 LDA $878e ; (screen_row + 0)
03:b7b9 : 85 5a __ STA T5 + 0 
03:b7bb : 18 __ __ CLC
03:b7bc : 6d cf 87 ADC $87cf ; (canvas + 9)
03:b7bf : 85 5c __ STA T6 + 0 
03:b7c1 : ad 8f 87 LDA $878f ; (screen_row + 1)
03:b7c4 : 85 5b __ STA T5 + 1 
03:b7c6 : 6d d0 87 ADC $87d0 ; (canvas + 10)
03:b7c9 : 85 5d __ STA T6 + 1 
03:b7cb : ad d9 88 LDA $88d9 ; (select_height + 0)
03:b7ce : 85 5e __ STA T7 + 0 
03:b7d0 : 18 __ __ CLC
03:b7d1 : 65 5c __ ADC T6 + 0 
03:b7d3 : 85 60 __ STA T8 + 0 
03:b7d5 : ad da 88 LDA $88da ; (select_height + 1)
03:b7d8 : 85 5f __ STA T7 + 1 
03:b7da : 65 5d __ ADC T6 + 1 
03:b7dc : 85 61 __ STA T8 + 1 
03:b7de : ad cc 87 LDA $87cc ; (canvas + 6)
03:b7e1 : c5 61 __ CMP T8 + 1 
03:b7e3 : d0 05 __ BNE $b7ea ; (selectmode.s1050 + 0)
.s1049:
03:b7e5 : ad cb 87 LDA $87cb ; (canvas + 5)
03:b7e8 : c5 60 __ CMP T8 + 0 
.s1050:
03:b7ea : b0 0d __ BCS $b7f9 ; (selectmode.s64 + 0)
.s62:
03:b7ec : 20 84 59 JSR $5984 ; (loadsyscharset.s0 + 0)
03:b7ef : a9 8f __ LDA #$8f
03:b7f1 : 8d f6 ab STA $abf6 ; (sstack + 3)
03:b7f4 : a9 ba __ LDA #$ba
03:b7f6 : 4c 44 ba JMP $ba44 ; (selectmode.s1106 + 0)
.s64:
03:b7f9 : a5 53 __ LDA T0 + 0 
03:b7fb : c9 43 __ CMP #$43
03:b7fd : d0 03 __ BNE $b802 ; (selectmode.s69 + 0)
.s67:
03:b7ff : 20 42 59 JSR $5942 ; (undo_escapeundo.s0 + 0)
.s69:
03:b802 : a5 5c __ LDA T6 + 0 
03:b804 : 85 16 __ STA P9 
03:b806 : a5 54 __ LDA T1 + 0 
03:b808 : 85 17 __ STA P10 
03:b80a : a5 58 __ LDA T4 + 0 
03:b80c : 85 18 __ STA P11 
03:b80e : a5 5e __ LDA T7 + 0 
03:b810 : 8d f3 ab STA $abf3 ; (sstack + 0)
03:b813 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
03:b816 : a5 5e __ LDA T7 + 0 
03:b818 : 05 5f __ ORA T7 + 1 
03:b81a : d0 03 __ BNE $b81f ; (selectmode.s136 + 0)
03:b81c : 4c 7c b4 JMP $b47c ; (selectmode.s34 + 0)
.s136:
03:b81f : a5 53 __ LDA T0 + 0 
03:b821 : c9 58 __ CMP #$58
03:b823 : d0 04 __ BNE $b829 ; (selectmode.s1037 + 0)
.s1036:
03:b825 : a9 01 __ LDA #$01
03:b827 : d0 02 __ BNE $b82b ; (selectmode.s1038 + 0)
.s1037:
03:b829 : a9 00 __ LDA #$00
.s1038:
03:b82b : 85 56 __ STA T2 + 0 
03:b82d : a9 00 __ LDA #$00
03:b82f : 85 57 __ STA T3 + 0 
03:b831 : ad cf 88 LDA $88cf ; (select_starty + 0)
03:b834 : 85 54 __ STA T1 + 0 
03:b836 : ad d0 88 LDA $88d0 ; (select_starty + 1)
03:b839 : 85 55 __ STA T1 + 1 
03:b83b : ad cd 88 LDA $88cd ; (select_startx + 0)
03:b83e : 85 5c __ STA T6 + 0 
03:b840 : ad ce 88 LDA $88ce ; (select_startx + 1)
03:b843 : 85 5d __ STA T6 + 1 
03:b845 : ad b9 87 LDA $87b9 ; (vdc_state + 12)
03:b848 : 85 60 __ STA T8 + 0 
03:b84a : ad ba 87 LDA $87ba ; (vdc_state + 13)
03:b84d : 85 61 __ STA T8 + 1 
.l71:
03:b84f : a9 7f __ LDA #$7f
03:b851 : 85 11 __ STA P4 
03:b853 : a5 57 __ LDA T3 + 0 
03:b855 : 85 62 __ STA T9 + 0 
03:b857 : ad cf 87 LDA $87cf ; (canvas + 9)
03:b85a : 18 __ __ CLC
03:b85b : 65 5a __ ADC T5 + 0 
03:b85d : aa __ __ TAX
03:b85e : ad d0 87 LDA $87d0 ; (canvas + 10)
03:b861 : 65 5b __ ADC T5 + 1 
03:b863 : c5 55 __ CMP T1 + 1 
03:b865 : d0 02 __ BNE $b869 ; (selectmode.s1044 + 0)
.s1043:
03:b867 : e4 54 __ CPX T1 + 0 
.s1044:
03:b869 : 90 07 __ BCC $b872 ; (selectmode.s214 + 0)
.s212:
03:b86b : 18 __ __ CLC
03:b86c : a5 5e __ LDA T7 + 0 
03:b86e : e5 57 __ SBC T3 + 0 
03:b870 : 85 62 __ STA T9 + 0 
.s214:
03:b872 : a5 60 __ LDA T8 + 0 
03:b874 : 85 0f __ STA P2 
03:b876 : a5 61 __ LDA T8 + 1 
03:b878 : 85 10 __ STA P3 
03:b87a : a5 58 __ LDA T4 + 0 
03:b87c : 85 14 __ STA P7 
03:b87e : a5 59 __ LDA T4 + 1 
03:b880 : 85 15 __ STA P8 
03:b882 : 18 __ __ CLC
03:b883 : a5 62 __ LDA T9 + 0 
03:b885 : 65 54 __ ADC T1 + 0 
03:b887 : 85 64 __ STA T10 + 0 
03:b889 : 85 03 __ STA WORK + 0 
03:b88b : a9 00 __ LDA #$00
03:b88d : 65 55 __ ADC T1 + 1 
03:b88f : 85 65 __ STA T10 + 1 
03:b891 : 85 04 __ STA WORK + 1 
03:b893 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b896 : 85 1b __ STA ACCU + 0 
03:b898 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b89b : 85 1c __ STA ACCU + 1 
03:b89d : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b8a0 : 18 __ __ CLC
03:b8a1 : a5 06 __ LDA WORK + 3 
03:b8a3 : 69 58 __ ADC #$58
03:b8a5 : aa __ __ TAX
03:b8a6 : 18 __ __ CLC
03:b8a7 : a5 05 __ LDA WORK + 2 
03:b8a9 : 65 5c __ ADC T6 + 0 
03:b8ab : 85 67 __ STA T12 + 0 
03:b8ad : 85 12 __ STA P5 
03:b8af : 8a __ __ TXA
03:b8b0 : 65 5d __ ADC T6 + 1 
03:b8b2 : 85 68 __ STA T12 + 1 
03:b8b4 : 85 13 __ STA P6 
03:b8b6 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
03:b8b9 : a5 56 __ LDA T2 + 0 
03:b8bb : f0 0b __ BEQ $b8c8 ; (selectmode.s78 + 0)
.s76:
03:b8bd : a5 67 __ LDA T12 + 0 
03:b8bf : 85 0d __ STA P0 
03:b8c1 : a5 68 __ LDA T12 + 1 
03:b8c3 : 85 0e __ STA P1 
03:b8c5 : 20 74 1a JSR $1a74 ; (bnk_memset@proxy + 0)
.s78:
03:b8c8 : a9 7f __ LDA #$7f
03:b8ca : 85 0d __ STA P0 
03:b8cc : a5 60 __ LDA T8 + 0 
03:b8ce : 85 10 __ STA P3 
03:b8d0 : a5 61 __ LDA T8 + 1 
03:b8d2 : 85 11 __ STA P4 
03:b8d4 : a5 14 __ LDA P7 
03:b8d6 : 85 12 __ STA P5 
03:b8d8 : a5 59 __ LDA T4 + 1 
03:b8da : 85 13 __ STA P6 
03:b8dc : ad 8c 87 LDA $878c ; (screen_col + 0)
03:b8df : 85 67 __ STA T12 + 0 
03:b8e1 : 18 __ __ CLC
03:b8e2 : 6d cd 87 ADC $87cd ; (canvas + 7)
03:b8e5 : 85 43 __ STA T13 + 0 
03:b8e7 : ad 8d 87 LDA $878d ; (screen_col + 1)
03:b8ea : 85 68 __ STA T12 + 1 
03:b8ec : 6d ce 87 ADC $87ce ; (canvas + 8)
03:b8ef : 85 44 __ STA T13 + 1 
03:b8f1 : ad cf 87 LDA $87cf ; (canvas + 9)
03:b8f4 : 18 __ __ CLC
03:b8f5 : 65 5a __ ADC T5 + 0 
03:b8f7 : aa __ __ TAX
03:b8f8 : ad d0 87 LDA $87d0 ; (canvas + 10)
03:b8fb : 65 5b __ ADC T5 + 1 
03:b8fd : a8 __ __ TAY
03:b8fe : 8a __ __ TXA
03:b8ff : 18 __ __ CLC
03:b900 : 65 62 __ ADC T9 + 0 
03:b902 : 85 03 __ STA WORK + 0 
03:b904 : 90 01 __ BCC $b907 ; (selectmode.s1112 + 0)
.s1111:
03:b906 : c8 __ __ INY
.s1112:
03:b907 : 84 04 __ STY WORK + 1 
03:b909 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b90c : 85 1b __ STA ACCU + 0 
03:b90e : ad ca 87 LDA $87ca ; (canvas + 4)
03:b911 : 85 1c __ STA ACCU + 1 
03:b913 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b916 : 18 __ __ CLC
03:b917 : a5 06 __ LDA WORK + 3 
03:b919 : 69 58 __ ADC #$58
03:b91b : aa __ __ TAX
03:b91c : 18 __ __ CLC
03:b91d : a5 05 __ LDA WORK + 2 
03:b91f : 65 43 __ ADC T13 + 0 
03:b921 : 85 0e __ STA P1 
03:b923 : 8a __ __ TXA
03:b924 : 65 44 __ ADC T13 + 1 
03:b926 : 85 0f __ STA P2 
03:b928 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:b92b : a5 60 __ LDA T8 + 0 
03:b92d : 85 0f __ STA P2 
03:b92f : a5 61 __ LDA T8 + 1 
03:b931 : 85 10 __ STA P3 
03:b933 : a9 7f __ LDA #$7f
03:b935 : 85 11 __ STA P4 
03:b937 : a5 59 __ LDA T4 + 1 
03:b939 : 85 15 __ STA P8 
03:b93b : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b93e : 85 1b __ STA ACCU + 0 
03:b940 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b943 : 85 1c __ STA ACCU + 1 
03:b945 : a5 64 __ LDA T10 + 0 
03:b947 : 85 03 __ STA WORK + 0 
03:b949 : a5 65 __ LDA T10 + 1 
03:b94b : 85 04 __ STA WORK + 1 
03:b94d : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b950 : 18 __ __ CLC
03:b951 : a5 06 __ LDA WORK + 3 
03:b953 : 69 58 __ ADC #$58
03:b955 : aa __ __ TAX
03:b956 : 18 __ __ CLC
03:b957 : a5 05 __ LDA WORK + 2 
03:b959 : 65 5c __ ADC T6 + 0 
03:b95b : 85 64 __ STA T10 + 0 
03:b95d : 8a __ __ TXA
03:b95e : 65 5d __ ADC T6 + 1 
03:b960 : 85 65 __ STA T10 + 1 
03:b962 : ad cb 87 LDA $87cb ; (canvas + 5)
03:b965 : 85 1b __ STA ACCU + 0 
03:b967 : ad cc 87 LDA $87cc ; (canvas + 6)
03:b96a : 85 1c __ STA ACCU + 1 
03:b96c : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b96f : 85 03 __ STA WORK + 0 
03:b971 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b974 : 85 04 __ STA WORK + 1 
03:b976 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b979 : 18 __ __ CLC
03:b97a : a5 05 __ LDA WORK + 2 
03:b97c : 65 64 __ ADC T10 + 0 
03:b97e : a8 __ __ TAY
03:b97f : a5 06 __ LDA WORK + 3 
03:b981 : 65 65 __ ADC T10 + 1 
03:b983 : aa __ __ TAX
03:b984 : 98 __ __ TYA
03:b985 : 18 __ __ CLC
03:b986 : 69 30 __ ADC #$30
03:b988 : 85 64 __ STA T10 + 0 
03:b98a : 85 12 __ STA P5 
03:b98c : 8a __ __ TXA
03:b98d : 69 00 __ ADC #$00
03:b98f : 85 65 __ STA T10 + 1 
03:b991 : 85 13 __ STA P6 
03:b993 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
03:b996 : a5 56 __ LDA T2 + 0 
03:b998 : f0 0b __ BEQ $b9a5 ; (selectmode.s87 + 0)
.s85:
03:b99a : a5 64 __ LDA T10 + 0 
03:b99c : 85 0d __ STA P0 
03:b99e : a5 65 __ LDA T10 + 1 
03:b9a0 : 85 0e __ STA P1 
03:b9a2 : 20 74 1a JSR $1a74 ; (bnk_memset@proxy + 0)
.s87:
03:b9a5 : a9 7f __ LDA #$7f
03:b9a7 : 85 0d __ STA P0 
03:b9a9 : a5 60 __ LDA T8 + 0 
03:b9ab : 85 10 __ STA P3 
03:b9ad : a5 61 __ LDA T8 + 1 
03:b9af : 85 11 __ STA P4 
03:b9b1 : a5 14 __ LDA P7 
03:b9b3 : 85 12 __ STA P5 
03:b9b5 : a5 59 __ LDA T4 + 1 
03:b9b7 : 85 13 __ STA P6 
03:b9b9 : ad cd 87 LDA $87cd ; (canvas + 7)
03:b9bc : 18 __ __ CLC
03:b9bd : 65 67 __ ADC T12 + 0 
03:b9bf : 85 64 __ STA T10 + 0 
03:b9c1 : ad ce 87 LDA $87ce ; (canvas + 8)
03:b9c4 : 65 68 __ ADC T12 + 1 
03:b9c6 : 85 65 __ STA T10 + 1 
03:b9c8 : ad cf 87 LDA $87cf ; (canvas + 9)
03:b9cb : 18 __ __ CLC
03:b9cc : 65 5a __ ADC T5 + 0 
03:b9ce : aa __ __ TAX
03:b9cf : ad d0 87 LDA $87d0 ; (canvas + 10)
03:b9d2 : 65 5b __ ADC T5 + 1 
03:b9d4 : a8 __ __ TAY
03:b9d5 : 8a __ __ TXA
03:b9d6 : 18 __ __ CLC
03:b9d7 : 65 62 __ ADC T9 + 0 
03:b9d9 : 85 03 __ STA WORK + 0 
03:b9db : 90 01 __ BCC $b9de ; (selectmode.s1114 + 0)
.s1113:
03:b9dd : c8 __ __ INY
.s1114:
03:b9de : 84 04 __ STY WORK + 1 
03:b9e0 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:b9e3 : 85 1b __ STA ACCU + 0 
03:b9e5 : ad ca 87 LDA $87ca ; (canvas + 4)
03:b9e8 : 85 1c __ STA ACCU + 1 
03:b9ea : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:b9ed : 18 __ __ CLC
03:b9ee : a5 06 __ LDA WORK + 3 
03:b9f0 : 69 58 __ ADC #$58
03:b9f2 : aa __ __ TAX
03:b9f3 : 18 __ __ CLC
03:b9f4 : a5 05 __ LDA WORK + 2 
03:b9f6 : 65 64 __ ADC T10 + 0 
03:b9f8 : 85 62 __ STA T9 + 0 
03:b9fa : 8a __ __ TXA
03:b9fb : 65 65 __ ADC T10 + 1 
03:b9fd : 85 63 __ STA T9 + 1 
03:b9ff : ad cb 87 LDA $87cb ; (canvas + 5)
03:ba02 : 85 1b __ STA ACCU + 0 
03:ba04 : ad cc 87 LDA $87cc ; (canvas + 6)
03:ba07 : 85 1c __ STA ACCU + 1 
03:ba09 : ad c9 87 LDA $87c9 ; (canvas + 3)
03:ba0c : 85 03 __ STA WORK + 0 
03:ba0e : ad ca 87 LDA $87ca ; (canvas + 4)
03:ba11 : 85 04 __ STA WORK + 1 
03:ba13 : 20 87 7c JSR $7c87 ; (mul16 + 0)
03:ba16 : 18 __ __ CLC
03:ba17 : a5 05 __ LDA WORK + 2 
03:ba19 : 65 62 __ ADC T9 + 0 
03:ba1b : aa __ __ TAX
03:ba1c : a5 06 __ LDA WORK + 3 
03:ba1e : 65 63 __ ADC T9 + 1 
03:ba20 : a8 __ __ TAY
03:ba21 : 8a __ __ TXA
03:ba22 : 18 __ __ CLC
03:ba23 : 69 30 __ ADC #$30
03:ba25 : 85 0e __ STA P1 
03:ba27 : 90 01 __ BCC $ba2a ; (selectmode.s1116 + 0)
.s1115:
03:ba29 : c8 __ __ INY
.s1116:
03:ba2a : 84 0f __ STY P2 
03:ba2c : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:ba2f : e6 57 __ INC T3 + 0 
03:ba31 : a5 5f __ LDA T7 + 1 
03:ba33 : f0 03 __ BEQ $ba38 ; (selectmode.s1041 + 0)
03:ba35 : 4c 4f b8 JMP $b84f ; (selectmode.l71 + 0)
.s1041:
03:ba38 : a5 57 __ LDA T3 + 0 
03:ba3a : c5 5e __ CMP T7 + 0 
03:ba3c : b0 03 __ BCS $ba41 ; (selectmode.s1041 + 9)
03:ba3e : 4c 4f b8 JMP $b84f ; (selectmode.l71 + 0)
03:ba41 : 4c 7c b4 JMP $b47c ; (selectmode.s34 + 0)
.s1106:
03:ba44 : 8d f7 ab STA $abf7 ; (sstack + 4)
03:ba47 : 20 c0 51 JSR $51c0 ; (menu_messagepopup.s1000 + 0)
03:ba4a : 20 a7 59 JSR $59a7 ; (restorealtcharset.s0 + 0)
03:ba4d : 4c a1 b5 JMP $b5a1 ; (selectmode.s1105 + 0)
.s52:
03:ba50 : c9 11 __ CMP #$11
03:ba52 : d0 03 __ BNE $ba57 ; (selectmode.s53 + 0)
03:ba54 : 4c 65 b7 JMP $b765 ; (selectmode.s45 + 0)
.s53:
03:ba57 : c9 1d __ CMP #$1d
03:ba59 : f0 03 __ BEQ $ba5e ; (selectmode.s53 + 7)
03:ba5b : 4c 6f b7 JMP $b76f ; (selectmode.s44 + 0)
03:ba5e : 4c 65 b7 JMP $b765 ; (selectmode.s45 + 0)
--------------------------------------------------------------------
03:ba61 : __ __ __ BYT 73 45 4c 45 43 54 00                            : sELECT.
--------------------------------------------------------------------
03:ba68 : __ __ __ BYT 78 2f 63 2f 64 2f 61 2f 70 3f 00                : x/c/d/a/p?.
--------------------------------------------------------------------
03:ba73 : __ __ __ BYT 73 45 4c 45 43 54 49 4f 4e 20 54 4f 4f 20 42 49 : sELECTION TOO BI
03:ba83 : __ __ __ BYT 47 2e 00                                        : G..
--------------------------------------------------------------------
03:ba86 : __ __ __ BYT 63 55 54 00                                     : cUT.
--------------------------------------------------------------------
03:ba8a : __ __ __ BYT 63 4f 50 59 00                                  : cOPY.
--------------------------------------------------------------------
03:ba8f : __ __ __ BYT 73 45 4c 45 43 54 49 4f 4e 20 44 4f 45 53 20 4e : sELECTION DOES N
03:ba9f : __ __ __ BYT 4f 54 20 46 49 54 2e 00                         : OT FIT..
--------------------------------------------------------------------
plot_try: ; plot_try()->void
.s0:
03:baa7 : 20 1b 4b JSR $4b1b ; (hidecursor.s0 + 0)
03:baaa : a2 ff __ LDX #$ff
.l1002:
03:baac : e8 __ __ INX
03:baad : bd 4c bb LDA $bb4c,x 
03:bab0 : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:bab3 : d0 f7 __ BNE $baac ; (plot_try.l1002 + 0)
.s1003:
03:bab5 : ad ff 87 LDA $87ff ; (showbar + 0)
03:bab8 : f0 03 __ BEQ $babd ; (plot_try.s3 + 0)
.s1:
03:baba : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s3:
03:babd : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
03:bac0 : a5 1b __ LDA ACCU + 0 
03:bac2 : c9 20 __ CMP #$20
03:bac4 : d0 6c __ BNE $bb32 ; (plot_try.s6 + 0)
.s4:
03:bac6 : ad fe 69 LDA $69fe ; (undoenabled + 0)
03:bac9 : c9 01 __ CMP #$01
03:bacb : d0 1a __ BNE $bae7 ; (plot_try.s9 + 0)
.s7:
03:bacd : 85 18 __ STA P11 
03:bacf : 8d f3 ab STA $abf3 ; (sstack + 0)
03:bad2 : ad cf 87 LDA $87cf ; (canvas + 9)
03:bad5 : 18 __ __ CLC
03:bad6 : 6d 8e 87 ADC $878e ; (screen_row + 0)
03:bad9 : 85 16 __ STA P9 
03:badb : ad cd 87 LDA $87cd ; (canvas + 7)
03:bade : 18 __ __ CLC
03:badf : 6d 8c 87 ADC $878c ; (screen_col + 0)
03:bae2 : 85 17 __ STA P10 
03:bae4 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s9:
03:bae7 : ad cf 87 LDA $87cf ; (canvas + 9)
03:baea : 18 __ __ CLC
03:baeb : 6d 8e 87 ADC $878e ; (screen_row + 0)
03:baee : 85 10 __ STA P3 
03:baf0 : ad cd 87 LDA $87cd ; (canvas + 7)
03:baf3 : 18 __ __ CLC
03:baf4 : 6d 8c 87 ADC $878c ; (screen_col + 0)
03:baf7 : 85 11 __ STA P4 
03:baf9 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
03:bafc : 85 12 __ STA P5 
03:bafe : ad 95 87 LDA $8795 ; (plotblink + 0)
03:bb01 : 0a __ __ ASL
03:bb02 : 0a __ __ ASL
03:bb03 : 0a __ __ ASL
03:bb04 : 0a __ __ ASL
03:bb05 : 18 __ __ CLC
03:bb06 : 6d 92 87 ADC $8792 ; (plotcolor + 0)
03:bb09 : 85 43 __ STA T1 + 0 
03:bb0b : ad 94 87 LDA $8794 ; (plotunderline + 0)
03:bb0e : 4a __ __ LSR
03:bb0f : 6a __ __ ROR
03:bb10 : 6a __ __ ROR
03:bb11 : 29 c0 __ AND #$c0
03:bb13 : 6a __ __ ROR
03:bb14 : 65 43 __ ADC T1 + 0 
03:bb16 : 85 43 __ STA T1 + 0 
03:bb18 : ad 93 87 LDA $8793 ; (plotreverse + 0)
03:bb1b : 4a __ __ LSR
03:bb1c : 6a __ __ ROR
03:bb1d : 29 80 __ AND #$80
03:bb1f : 6a __ __ ROR
03:bb20 : 65 43 __ ADC T1 + 0 
03:bb22 : 85 43 __ STA T1 + 0 
03:bb24 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
03:bb27 : 4a __ __ LSR
03:bb28 : a9 00 __ LDA #$00
03:bb2a : 6a __ __ ROR
03:bb2b : 65 43 __ ADC T1 + 0 
03:bb2d : 85 13 __ STA P6 
03:bb2f : 20 2b 54 JSR $542b ; (screenmapplot.s0 + 0)
.s6:
03:bb32 : a2 ff __ LDX #$ff
.l1004:
03:bb34 : e8 __ __ INX
03:bb35 : bd f8 b0 LDA $b0f8,x 
03:bb38 : 9d f4 87 STA $87f4,x ; (programmode + 0)
03:bb3b : d0 f7 __ BNE $bb34 ; (plot_try.l1004 + 0)
.s1005:
03:bb3d : ad 8c 87 LDA $878c ; (screen_col + 0)
03:bb40 : 8d d5 87 STA $87d5 ; (canvas + 15)
03:bb43 : ad 8e 87 LDA $878e ; (screen_row + 0)
03:bb46 : 8d d6 87 STA $87d6 ; (canvas + 16)
03:bb49 : 4c 06 3e JMP $3e06 ; (plotcursor.s0 + 0)
--------------------------------------------------------------------
03:bb4c : __ __ __ BYT 74 52 59 00                                     : tRY.
--------------------------------------------------------------------
changebackgroundcolor: ; changebackgroundcolor()->void
.s1000:
03:bb50 : a5 53 __ LDA T1 + 0 
03:bb52 : 8d d1 ab STA $abd1 ; (buff + 44)
03:bb55 : a5 54 __ LDA T2 + 0 
03:bb57 : 8d d2 ab STA $abd2 ; (buff + 45)
03:bb5a : a5 55 __ LDA T4 + 0 
03:bb5c : 8d d3 ab STA $abd3 ; (buff + 46)
03:bb5f : 38 __ __ SEC
03:bb60 : a5 23 __ LDA SP + 0 
03:bb62 : e9 08 __ SBC #$08
03:bb64 : 85 23 __ STA SP + 0 
03:bb66 : b0 02 __ BCS $bb6a ; (changebackgroundcolor.s0 + 0)
03:bb68 : c6 24 __ DEC SP + 1 
.s0:
03:bb6a : a9 00 __ LDA #$00
03:bb6c : 85 17 __ STA P10 
03:bb6e : a9 14 __ LDA #$14
03:bb70 : 85 18 __ STA P11 
03:bb72 : a9 05 __ LDA #$05
03:bb74 : 8d f3 ab STA $abf3 ; (sstack + 0)
03:bb77 : a9 28 __ LDA #$28
03:bb79 : 8d f4 ab STA $abf4 ; (sstack + 1)
03:bb7c : a9 0c __ LDA #$0c
03:bb7e : 8d f5 ab STA $abf5 ; (sstack + 2)
03:bb81 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
03:bb84 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
03:bb87 : ad 90 87 LDA $8790 ; (screenbackground + 0)
03:bb8a : 85 52 __ STA T0 + 0 
03:bb8c : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
03:bb8f : a9 01 __ LDA #$01
03:bb91 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
03:bb94 : a9 6e __ LDA #$6e
03:bb96 : 85 13 __ STA P6 
03:bb98 : a9 bd __ LDA #$bd
03:bb9a : 85 14 __ STA P7 
03:bb9c : 20 33 81 JSR $8133 ; (vdc_prints_attr@proxy + 0)
03:bb9f : a9 00 __ LDA #$00
03:bba1 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
03:bba4 : a9 51 __ LDA #$51
03:bba6 : a0 02 __ LDY #$02
03:bba8 : 91 23 __ STA (SP + 0),y 
03:bbaa : a9 89 __ LDA #$89
03:bbac : c8 __ __ INY
03:bbad : 91 23 __ STA (SP + 0),y 
03:bbaf : a9 86 __ LDA #$86
03:bbb1 : c8 __ __ INY
03:bbb2 : 91 23 __ STA (SP + 0),y 
03:bbb4 : a9 bd __ LDA #$bd
03:bbb6 : c8 __ __ INY
03:bbb7 : 91 23 __ STA (SP + 0),y 
03:bbb9 : a5 52 __ LDA T0 + 0 
03:bbbb : c8 __ __ INY
03:bbbc : 91 23 __ STA (SP + 0),y 
03:bbbe : a9 00 __ LDA #$00
03:bbc0 : c8 __ __ INY
03:bbc1 : 91 23 __ STA (SP + 0),y 
03:bbc3 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
03:bbc6 : 20 7b 81 JSR $817b ; (vdc_prints_attr@proxy + 0)
03:bbc9 : a9 91 __ LDA #$91
03:bbcb : 85 13 __ STA P6 
03:bbcd : a9 bd __ LDA #$bd
03:bbcf : 85 14 __ STA P7 
03:bbd1 : 20 74 81 JSR $8174 ; (vdc_prints_attr@proxy + 0)
03:bbd4 : e6 12 __ INC P5 
03:bbd6 : a9 98 __ LDA #$98
03:bbd8 : 85 13 __ STA P6 
03:bbda : a9 bd __ LDA #$bd
03:bbdc : 85 14 __ STA P7 
03:bbde : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
03:bbe1 : e6 12 __ INC P5 
03:bbe3 : a9 b5 __ LDA #$b5
03:bbe5 : 85 13 __ STA P6 
03:bbe7 : a9 bd __ LDA #$bd
03:bbe9 : 85 14 __ STA P7 
03:bbeb : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
03:bbee : e6 12 __ INC P5 
03:bbf0 : a9 d2 __ LDA #$d2
03:bbf2 : 85 13 __ STA P6 
03:bbf4 : a9 bd __ LDA #$bd
03:bbf6 : 85 14 __ STA P7 
03:bbf8 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
03:bbfb : e6 12 __ INC P5 
03:bbfd : a9 e6 __ LDA #$e6
03:bbff : 85 13 __ STA P6 
03:bc01 : a9 bd __ LDA #$bd
03:bc03 : 85 14 __ STA P7 
03:bc05 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
03:bc08 : a9 00 __ LDA #$00
03:bc0a : 85 54 __ STA T2 + 0 
.l10:
03:bc0c : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
03:bc0f : a5 1b __ LDA ACCU + 0 
03:bc11 : 85 53 __ STA T1 + 0 
03:bc13 : c9 0d __ CMP #$0d
03:bc15 : d0 09 __ BNE $bc20 ; (changebackgroundcolor.s1002 + 0)
.s1003:
03:bc17 : a9 00 __ LDA #$00
03:bc19 : 85 55 __ STA T4 + 0 
03:bc1b : a5 1b __ LDA ACCU + 0 
03:bc1d : 4c 36 bc JMP $bc36 ; (changebackgroundcolor.s11 + 0)
.s1002:
03:bc20 : a9 01 __ LDA #$01
03:bc22 : 85 55 __ STA T4 + 0 
03:bc24 : a5 1b __ LDA ACCU + 0 
03:bc26 : c9 1b __ CMP #$1b
03:bc28 : f0 0c __ BEQ $bc36 ; (changebackgroundcolor.s11 + 0)
.s14:
03:bc2a : c9 03 __ CMP #$03
03:bc2c : f0 08 __ BEQ $bc36 ; (changebackgroundcolor.s11 + 0)
.s13:
03:bc2e : c9 2b __ CMP #$2b
03:bc30 : f0 04 __ BEQ $bc36 ; (changebackgroundcolor.s11 + 0)
.s12:
03:bc32 : c9 2d __ CMP #$2d
03:bc34 : d0 d6 __ BNE $bc0c ; (changebackgroundcolor.l10 + 0)
.s11:
03:bc36 : c9 2b __ CMP #$2b
03:bc38 : d0 03 __ BNE $bc3d ; (changebackgroundcolor.s42 + 0)
03:bc3a : 4c 5b bd JMP $bd5b ; (changebackgroundcolor.s17 + 0)
.s42:
03:bc3d : b0 03 __ BCS $bc42 ; (changebackgroundcolor.s43 + 0)
03:bc3f : 4c 29 bd JMP $bd29 ; (changebackgroundcolor.s44 + 0)
.s43:
03:bc42 : c9 2d __ CMP #$2d
03:bc44 : d0 03 __ BNE $bc49 ; (changebackgroundcolor.s16 + 0)
03:bc46 : 4c 15 bd JMP $bd15 ; (changebackgroundcolor.s21 + 0)
.s16:
03:bc49 : a5 54 __ LDA T2 + 0 
03:bc4b : c9 01 __ CMP #$01
03:bc4d : d0 45 __ BNE $bc94 ; (changebackgroundcolor.s50 + 0)
.s48:
03:bc4f : a9 1a __ LDA #$1a
03:bc51 : 8d 00 d6 STA $d600 
.l179:
03:bc54 : 2c 00 d6 BIT $d600 
03:bc57 : 10 fb __ BPL $bc54 ; (changebackgroundcolor.l179 + 0)
.s57:
03:bc59 : ad 01 d6 LDA $d601 
03:bc5c : 29 f0 __ AND #$f0
03:bc5e : 18 __ __ CLC
03:bc5f : 65 52 __ ADC T0 + 0 
03:bc61 : a2 1a __ LDX #$1a
03:bc63 : 8e 00 d6 STX $d600 
.l181:
03:bc66 : 2c 00 d6 BIT $d600 
03:bc69 : 10 fb __ BPL $bc66 ; (changebackgroundcolor.l181 + 0)
.s63:
03:bc6b : 8d 01 d6 STA $d601 
03:bc6e : a5 52 __ LDA T0 + 0 
03:bc70 : a0 06 __ LDY #$06
03:bc72 : 91 23 __ STA (SP + 0),y 
03:bc74 : a9 00 __ LDA #$00
03:bc76 : c8 __ __ INY
03:bc77 : 91 23 __ STA (SP + 0),y 
03:bc79 : a9 51 __ LDA #$51
03:bc7b : a0 02 __ LDY #$02
03:bc7d : 91 23 __ STA (SP + 0),y 
03:bc7f : a9 89 __ LDA #$89
03:bc81 : c8 __ __ INY
03:bc82 : 91 23 __ STA (SP + 0),y 
03:bc84 : a9 86 __ LDA #$86
03:bc86 : c8 __ __ INY
03:bc87 : 91 23 __ STA (SP + 0),y 
03:bc89 : a9 bd __ LDA #$bd
03:bc8b : c8 __ __ INY
03:bc8c : 91 23 __ STA (SP + 0),y 
03:bc8e : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
03:bc91 : 20 7b 81 JSR $817b ; (vdc_prints_attr@proxy + 0)
.s50:
03:bc94 : a5 55 __ LDA T4 + 0 
03:bc96 : f0 0d __ BEQ $bca5 ; (changebackgroundcolor.s9 + 0)
.s66:
03:bc98 : a5 53 __ LDA T1 + 0 
03:bc9a : c9 1b __ CMP #$1b
03:bc9c : f0 07 __ BEQ $bca5 ; (changebackgroundcolor.s9 + 0)
.s65:
03:bc9e : c9 03 __ CMP #$03
03:bca0 : f0 03 __ BEQ $bca5 ; (changebackgroundcolor.s9 + 0)
03:bca2 : 4c 0c bc JMP $bc0c ; (changebackgroundcolor.l10 + 0)
.s9:
03:bca5 : a5 52 __ LDA T0 + 0 
03:bca7 : 8d 90 87 STA $8790 ; (screenbackground + 0)
03:bcaa : f0 04 __ BEQ $bcb0 ; (changebackgroundcolor.s70 + 0)
.s73:
03:bcac : c9 01 __ CMP #$01
03:bcae : d0 19 __ BNE $bcc9 ; (changebackgroundcolor.s71 + 0)
.s70:
03:bcb0 : a9 c5 __ LDA #$c5
03:bcb2 : 8d ff 7b STA $7bff ; (mc_mb_normal + 0)
03:bcb5 : a9 cf __ LDA #$cf
03:bcb7 : 8d f3 82 STA $82f3 ; (mc_mb_select + 0)
03:bcba : 8d ff 69 STA $69ff ; (mc_menupopup + 0)
03:bcbd : 8d b4 87 STA $87b4 ; (vdc_state + 7)
03:bcc0 : a9 c6 __ LDA #$c6
03:bcc2 : 8d f4 82 STA $82f4 ; (mc_pd_normal + 0)
03:bcc5 : a9 cd __ LDA #$cd
03:bcc7 : d0 28 __ BNE $bcf1 ; (changebackgroundcolor.s1001 + 0)
.s71:
03:bcc9 : 4a __ __ LSR
03:bcca : 90 12 __ BCC $bcde ; (changebackgroundcolor.s75 + 0)
.s74:
03:bccc : a9 c0 __ LDA #$c0
03:bcce : 8d ff 7b STA $7bff ; (mc_mb_normal + 0)
03:bcd1 : 8d f4 82 STA $82f4 ; (mc_pd_normal + 0)
03:bcd4 : 8d ff 69 STA $69ff ; (mc_menupopup + 0)
03:bcd7 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
03:bcda : a9 80 __ LDA #$80
03:bcdc : b0 10 __ BCS $bcee ; (changebackgroundcolor.s1044 + 0)
.s75:
03:bcde : a9 cf __ LDA #$cf
03:bce0 : 8d ff 7b STA $7bff ; (mc_mb_normal + 0)
03:bce3 : 8d f4 82 STA $82f4 ; (mc_pd_normal + 0)
03:bce6 : 8d ff 69 STA $69ff ; (mc_menupopup + 0)
03:bce9 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
03:bcec : a9 8f __ LDA #$8f
.s1044:
03:bcee : 8d f3 82 STA $82f3 ; (mc_mb_select + 0)
.s1001:
03:bcf1 : 8d f5 82 STA $82f5 ; (mc_pd_select + 0)
03:bcf4 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
03:bcf7 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
03:bcfa : 18 __ __ CLC
03:bcfb : a5 23 __ LDA SP + 0 
03:bcfd : 69 08 __ ADC #$08
03:bcff : 85 23 __ STA SP + 0 
03:bd01 : 90 02 __ BCC $bd05 ; (changebackgroundcolor.s1001 + 20)
03:bd03 : e6 24 __ INC SP + 1 
03:bd05 : ad d1 ab LDA $abd1 ; (buff + 44)
03:bd08 : 85 53 __ STA T1 + 0 
03:bd0a : ad d2 ab LDA $abd2 ; (buff + 45)
03:bd0d : 85 54 __ STA T2 + 0 
03:bd0f : ad d3 ab LDA $abd3 ; (buff + 46)
03:bd12 : 85 55 __ STA T4 + 0 
03:bd14 : 60 __ __ RTS
.s21:
03:bd15 : a9 01 __ LDA #$01
03:bd17 : 85 54 __ STA T2 + 0 
03:bd19 : a5 52 __ LDA T0 + 0 
03:bd1b : f0 05 __ BEQ $bd22 ; (changebackgroundcolor.s22 + 0)
.s23:
03:bd1d : c6 52 __ DEC T0 + 0 
03:bd1f : 4c 4f bc JMP $bc4f ; (changebackgroundcolor.s48 + 0)
.s22:
03:bd22 : a9 0f __ LDA #$0f
.s1043:
03:bd24 : 85 52 __ STA T0 + 0 
03:bd26 : 4c 4f bc JMP $bc4f ; (changebackgroundcolor.s48 + 0)
.s44:
03:bd29 : c9 03 __ CMP #$03
03:bd2b : f0 07 __ BEQ $bd34 ; (changebackgroundcolor.s25 + 0)
.s45:
03:bd2d : c9 1b __ CMP #$1b
03:bd2f : f0 03 __ BEQ $bd34 ; (changebackgroundcolor.s25 + 0)
03:bd31 : 4c 49 bc JMP $bc49 ; (changebackgroundcolor.s16 + 0)
.s25:
03:bd34 : a9 1a __ LDA #$1a
03:bd36 : 8d 00 d6 STA $d600 
03:bd39 : a9 00 __ LDA #$00
03:bd3b : 85 54 __ STA T2 + 0 
.l186:
03:bd3d : 2c 00 d6 BIT $d600 
03:bd40 : 10 fb __ BPL $bd3d ; (changebackgroundcolor.l186 + 0)
.s32:
03:bd42 : ad 01 d6 LDA $d601 
03:bd45 : 29 f0 __ AND #$f0
03:bd47 : 18 __ __ CLC
03:bd48 : 6d 90 87 ADC $8790 ; (screenbackground + 0)
03:bd4b : a2 1a __ LDX #$1a
03:bd4d : 8e 00 d6 STX $d600 
.l188:
03:bd50 : 2c 00 d6 BIT $d600 
03:bd53 : 10 fb __ BPL $bd50 ; (changebackgroundcolor.l188 + 0)
.s38:
03:bd55 : 8d 01 d6 STA $d601 
03:bd58 : 4c 94 bc JMP $bc94 ; (changebackgroundcolor.s50 + 0)
.s17:
03:bd5b : a9 01 __ LDA #$01
03:bd5d : 85 54 __ STA T2 + 0 
03:bd5f : e6 52 __ INC T0 + 0 
03:bd61 : a5 52 __ LDA T0 + 0 
03:bd63 : c9 10 __ CMP #$10
03:bd65 : b0 03 __ BCS $bd6a ; (changebackgroundcolor.s18 + 0)
03:bd67 : 4c 4f bc JMP $bc4f ; (changebackgroundcolor.s48 + 0)
.s18:
03:bd6a : a9 00 __ LDA #$00
03:bd6c : b0 b6 __ BCS $bd24 ; (changebackgroundcolor.s1043 + 0)
--------------------------------------------------------------------
03:bd6e : __ __ __ BYT 63 48 41 4e 47 45 20 42 41 43 4b 47 52 4f 55 4e : cHANGE BACKGROUN
03:bd7e : __ __ __ BYT 44 20 43 4f 4c 4f 52 00                         : D COLOR.
--------------------------------------------------------------------
03:bd86 : __ __ __ BYT 63 4f 4c 4f 52 3a 20 25 32 55 00                : cOLOR: %2U.
--------------------------------------------------------------------
03:bd91 : __ __ __ BYT 70 52 45 53 53 3a 00                            : pRESS:.
--------------------------------------------------------------------
03:bd98 : __ __ __ BYT 2b 3a 20 20 20 20 20 69 4e 43 52 45 41 53 45 20 : +:     iNCREASE 
03:bda8 : __ __ __ BYT 43 4f 4c 4f 52 20 4e 55 4d 42 45 52 00          : COLOR NUMBER.
--------------------------------------------------------------------
03:bdb5 : __ __ __ BYT 2d 3a 20 20 20 20 20 64 45 43 52 45 41 53 45 20 : -:     dECREASE 
03:bdc5 : __ __ __ BYT 43 4f 4c 4f 52 20 4e 55 4d 42 45 52 00          : COLOR NUMBER.
--------------------------------------------------------------------
03:bdd2 : __ __ __ BYT 65 6e 74 65 72 3a 20 61 43 43 45 50 54 20 43 4f : enter: aCCEPT CO
03:bde2 : __ __ __ BYT 4c 4f 52 00                                     : LOR.
--------------------------------------------------------------------
03:bde6 : __ __ __ BYT 65 73 63 3a 20 20 20 63 41 4e 43 45 4c 00       : esc:   cANCEL.
--------------------------------------------------------------------
selectscreenmode: ; selectscreenmode()->void
.s1000:
03:bdf4 : a5 53 __ LDA T0 + 0 
03:bdf6 : 8d c7 ab STA $abc7 ; (buff + 34)
.s0:
03:bdf9 : a9 00 __ LDA #$00
03:bdfb : 85 17 __ STA P10 
03:bdfd : a9 14 __ LDA #$14
03:bdff : 85 18 __ STA P11 
03:be01 : a9 05 __ LDA #$05
03:be03 : 8d f3 ab STA $abf3 ; (sstack + 0)
03:be06 : a9 28 __ LDA #$28
03:be08 : 8d f4 ab STA $abf4 ; (sstack + 1)
03:be0b : a9 0c __ LDA #$0c
03:be0d : 8d f5 ab STA $abf5 ; (sstack + 2)
03:be10 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
03:be13 : 8d b4 87 STA $87b4 ; (vdc_state + 7)
03:be16 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
03:be19 : a9 01 __ LDA #$01
03:be1b : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
03:be1e : a9 8a __ LDA #$8a
03:be20 : 85 13 __ STA P6 
03:be22 : a9 be __ LDA #$be
03:be24 : 85 14 __ STA P7 
03:be26 : 20 33 81 JSR $8133 ; (vdc_prints_attr@proxy + 0)
03:be29 : a9 00 __ LDA #$00
03:be2b : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
03:be2e : a9 08 __ LDA #$08
03:be30 : 85 12 __ STA P5 
03:be32 : a9 9d __ LDA #$9d
03:be34 : 85 13 __ STA P6 
03:be36 : a9 be __ LDA #$be
03:be38 : 85 14 __ STA P7 
03:be3a : 20 85 33 JSR $3385 ; (vdc_prints_attr@proxy + 0)
03:be3d : a9 19 __ LDA #$19
03:be3f : 8d f8 ab STA $abf8 ; (sstack + 5)
03:be42 : a9 09 __ LDA #$09
03:be44 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:be47 : a9 05 __ LDA #$05
03:be49 : 8d fa ab STA $abfa ; (sstack + 7)
03:be4c : a9 01 __ LDA #$01
03:be4e : 8d fb ab STA $abfb ; (sstack + 8)
03:be51 : 20 a7 5e JSR $5ea7 ; (menu_pulldown.s1000 + 0)
03:be54 : a5 1b __ LDA ACCU + 0 
03:be56 : 85 53 __ STA T0 + 0 
03:be58 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
03:be5b : a9 0f __ LDA #$0f
03:be5d : 8d b4 87 STA $87b4 ; (vdc_state + 7)
03:be60 : a5 53 __ LDA T0 + 0 
03:be62 : f0 20 __ BEQ $be84 ; (selectscreenmode.s1001 + 0)
.s3:
03:be64 : 38 __ __ SEC
03:be65 : e9 01 __ SBC #$01
03:be67 : 90 05 __ BCC $be6e ; (selectscreenmode.s6 + 0)
.s1002:
03:be69 : cd af 87 CMP $87af ; (vdc_state + 2)
03:be6c : f0 16 __ BEQ $be84 ; (selectscreenmode.s1001 + 0)
.s6:
03:be6e : 85 16 __ STA P9 
03:be70 : 20 3b 2e JSR $2e3b ; (vdc_set_mode.s0 + 0)
03:be73 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
03:be76 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
03:be79 : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
03:be7c : ad ff 87 LDA $87ff ; (showbar + 0)
03:be7f : f0 03 __ BEQ $be84 ; (selectscreenmode.s1001 + 0)
.s9:
03:be81 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s1001:
03:be84 : ad c7 ab LDA $abc7 ; (buff + 34)
03:be87 : 85 53 __ STA T0 + 0 
03:be89 : 60 __ __ RTS
--------------------------------------------------------------------
03:be8a : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
03:be9a : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
03:be9d : __ __ __ BYT 63 48 4f 4f 53 45 20 44 45 53 49 52 45 44 20 4d : cHOOSE DESIRED M
03:bead : __ __ __ BYT 4f 44 45 3a 00                                  : ODE:.
--------------------------------------------------------------------
plotvisible@proxy: ; plotvisible@proxy
03:beb2 : ad d3 88 LDA $88d3 ; (select_endy + 0)
03:beb5 : 85 11 __ STA P4 
03:beb7 : 4c 0e b0 JMP $b00e ; (plotvisible.s0 + 0)
--------------------------------------------------------------------
savescreenmap: ; savescreenmap()->void
.s1000:
04:ac00 : a5 53 __ LDA T0 + 0 
04:ac02 : 8d c1 ab STA $abc1 ; (projbuffer + 41)
04:ac05 : a5 54 __ LDA T0 + 1 
04:ac07 : 8d c2 ab STA $abc2 ; (projbuffer + 42)
04:ac0a : a5 55 __ LDA T1 + 0 
04:ac0c : 8d c3 ab STA $abc3 ; (projbuffer + 43)
04:ac0f : 38 __ __ SEC
04:ac10 : a5 23 __ LDA SP + 0 
04:ac12 : e9 08 __ SBC #$08
04:ac14 : 85 23 __ STA SP + 0 
04:ac16 : b0 02 __ BCS $ac1a ; (savescreenmap.s0 + 0)
04:ac18 : c6 24 __ DEC SP + 1 
.s0:
04:ac1a : a9 0f __ LDA #$0f
04:ac1c : 8d fa ab STA $abfa ; (sstack + 7)
04:ac1f : a9 da __ LDA #$da
04:ac21 : 8d f8 ab STA $abf8 ; (sstack + 5)
04:ac24 : a9 ac __ LDA #$ac
04:ac26 : 8d f9 ab STA $abf9 ; (sstack + 6)
04:ac29 : 20 ac 4b JSR $4bac ; (chooseidandfilename.s0 + 0)
04:ac2c : a5 1b __ LDA ACCU + 0 
04:ac2e : 85 53 __ STA T0 + 0 
04:ac30 : a5 1c __ LDA ACCU + 1 
04:ac32 : 85 54 __ STA T0 + 1 
04:ac34 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
04:ac37 : a5 54 __ LDA T0 + 1 
04:ac39 : c9 ff __ CMP #$ff
04:ac3b : d0 06 __ BNE $ac43 ; (savescreenmap.s3 + 0)
.s1004:
04:ac3d : a5 53 __ LDA T0 + 0 
04:ac3f : c9 ff __ CMP #$ff
04:ac41 : f0 7c __ BEQ $acbf ; (savescreenmap.s1001 + 0)
.s3:
04:ac43 : a9 97 __ LDA #$97
04:ac45 : 8d fc ab STA $abfc ; (sstack + 9)
04:ac48 : a9 87 __ LDA #$87
04:ac4a : 8d fd ab STA $abfd ; (sstack + 10)
04:ac4d : ad ac 87 LDA $87ac ; (targetdevice + 0)
04:ac50 : 85 55 __ STA T1 + 0 
04:ac52 : 8d fe ab STA $abfe ; (sstack + 11)
04:ac55 : 20 48 62 JSR $6248 ; (checkiffileexists.s1000 + 0)
04:ac58 : a5 1b __ LDA ACCU + 0 
04:ac5a : f0 63 __ BEQ $acbf ; (savescreenmap.s1001 + 0)
.s5:
04:ac5c : c9 02 __ CMP #$02
04:ac5e : d0 26 __ BNE $ac86 ; (savescreenmap.s10 + 0)
.s8:
04:ac60 : a9 97 __ LDA #$97
04:ac62 : a0 06 __ LDY #$06
04:ac64 : 91 23 __ STA (SP + 0),y 
04:ac66 : a9 87 __ LDA #$87
04:ac68 : c8 __ __ INY
04:ac69 : 91 23 __ STA (SP + 0),y 
04:ac6b : a9 51 __ LDA #$51
04:ac6d : a0 02 __ LDY #$02
04:ac6f : 91 23 __ STA (SP + 0),y 
04:ac71 : a9 89 __ LDA #$89
04:ac73 : c8 __ __ INY
04:ac74 : 91 23 __ STA (SP + 0),y 
04:ac76 : a9 e6 __ LDA #$e6
04:ac78 : c8 __ __ INY
04:ac79 : 91 23 __ STA (SP + 0),y 
04:ac7b : a9 ac __ LDA #$ac
04:ac7d : c8 __ __ INY
04:ac7e : 91 23 __ STA (SP + 0),y 
04:ac80 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:ac83 : 20 ce 62 JSR $62ce ; (cmd@proxy + 0)
.s10:
04:ac86 : a5 55 __ LDA T1 + 0 
04:ac88 : 85 12 __ STA P5 
04:ac8a : a9 01 __ LDA #$01
04:ac8c : 85 13 __ STA P6 
04:ac8e : a9 97 __ LDA #$97
04:ac90 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:ac93 : a9 87 __ LDA #$87
04:ac95 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:ac98 : a9 00 __ LDA #$00
04:ac9a : 85 14 __ STA P7 
04:ac9c : ad db 87 LDA $87db ; (screentotal + 0)
04:ac9f : 0a __ __ ASL
04:aca0 : aa __ __ TAX
04:aca1 : ad dc 87 LDA $87dc ; (screentotal + 1)
04:aca4 : 2a __ __ ROL
04:aca5 : 85 54 __ STA T0 + 1 
04:aca7 : 8a __ __ TXA
04:aca8 : 18 __ __ CLC
04:aca9 : 69 30 __ ADC #$30
04:acab : 85 16 __ STA P9 
04:acad : a9 58 __ LDA #$58
04:acaf : 85 15 __ STA P8 
04:acb1 : 65 54 __ ADC T0 + 1 
04:acb3 : 85 17 __ STA P10 
04:acb5 : 20 5c 15 JSR $155c ; (bnk_save.s0 + 0)
04:acb8 : a5 1b __ LDA ACCU + 0 
04:acba : d0 03 __ BNE $acbf ; (savescreenmap.s1001 + 0)
.s11:
04:acbc : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s1001:
04:acbf : 18 __ __ CLC
04:acc0 : a5 23 __ LDA SP + 0 
04:acc2 : 69 08 __ ADC #$08
04:acc4 : 85 23 __ STA SP + 0 
04:acc6 : 90 02 __ BCC $acca ; (savescreenmap.s1001 + 11)
04:acc8 : e6 24 __ INC SP + 1 
04:acca : ad c1 ab LDA $abc1 ; (projbuffer + 41)
04:accd : 85 53 __ STA T0 + 0 
04:accf : ad c2 ab LDA $abc2 ; (projbuffer + 42)
04:acd2 : 85 54 __ STA T0 + 1 
04:acd4 : ad c3 ab LDA $abc3 ; (projbuffer + 43)
04:acd7 : 85 55 __ STA T1 + 0 
04:acd9 : 60 __ __ RTS
--------------------------------------------------------------------
04:acda : __ __ __ BYT 73 41 56 45 20 53 43 52 45 45 4e 00             : sAVE SCREEN.
--------------------------------------------------------------------
04:ace6 : __ __ __ BYT 53 3a 25 53 00                                  : S:%S.
--------------------------------------------------------------------
loadscreenmap: ; loadscreenmap()->void
.s1000:
04:aceb : a2 04 __ LDX #$04
04:aced : b5 53 __ LDA T0 + 0,x 
04:acef : 9d 97 ab STA $ab97,x ; (tempfilename + 20)
04:acf2 : ca __ __ DEX
04:acf3 : 10 f8 __ BPL $aced ; (loadscreenmap.s1000 + 2)
04:acf5 : 38 __ __ SEC
04:acf6 : a5 23 __ LDA SP + 0 
04:acf8 : e9 08 __ SBC #$08
04:acfa : 85 23 __ STA SP + 0 
04:acfc : b0 02 __ BCS $ad00 ; (loadscreenmap.s0 + 0)
04:acfe : c6 24 __ DEC SP + 1 
.s0:
04:ad00 : a9 00 __ LDA #$00
04:ad02 : 8d fc ab STA $abfc ; (sstack + 9)
04:ad05 : 20 dd 64 JSR $64dd ; (filepicker.s1000 + 0)
04:ad08 : a5 1b __ LDA ACCU + 0 
04:ad0a : d0 16 __ BNE $ad22 ; (loadscreenmap.s3 + 0)
.s1001:
04:ad0c : 18 __ __ CLC
04:ad0d : a5 23 __ LDA SP + 0 
04:ad0f : 69 08 __ ADC #$08
04:ad11 : 85 23 __ STA SP + 0 
04:ad13 : 90 02 __ BCC $ad17 ; (loadscreenmap.s1001 + 11)
04:ad15 : e6 24 __ INC SP + 1 
04:ad17 : a2 04 __ LDX #$04
04:ad19 : bd 97 ab LDA $ab97,x ; (tempfilename + 20)
04:ad1c : 95 53 __ STA T0 + 0,x 
04:ad1e : ca __ __ DEX
04:ad1f : 10 f8 __ BPL $ad19 ; (loadscreenmap.s1001 + 13)
04:ad21 : 60 __ __ RTS
.s3:
04:ad22 : a9 00 __ LDA #$00
04:ad24 : 85 17 __ STA P10 
04:ad26 : a9 14 __ LDA #$14
04:ad28 : 85 18 __ STA P11 
04:ad2a : a9 05 __ LDA #$05
04:ad2c : 8d f3 ab STA $abf3 ; (sstack + 0)
04:ad2f : a9 28 __ LDA #$28
04:ad31 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:ad34 : a9 0c __ LDA #$0c
04:ad36 : 8d f5 ab STA $abf5 ; (sstack + 2)
04:ad39 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
04:ad3c : 8d b4 87 STA $87b4 ; (vdc_state + 7)
04:ad3f : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
04:ad42 : a9 01 __ LDA #$01
04:ad44 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
04:ad47 : a9 b6 __ LDA #$b6
04:ad49 : 85 13 __ STA P6 
04:ad4b : a9 ae __ LDA #$ae
04:ad4d : 85 14 __ STA P7 
04:ad4f : 20 33 81 JSR $8133 ; (vdc_prints_attr@proxy + 0)
04:ad52 : a9 00 __ LDA #$00
04:ad54 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
04:ad57 : a9 08 __ LDA #$08
04:ad59 : 85 12 __ STA P5 
04:ad5b : a9 c2 __ LDA #$c2
04:ad5d : 85 13 __ STA P6 
04:ad5f : a9 ae __ LDA #$ae
04:ad61 : 85 14 __ STA P7 
04:ad63 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
04:ad66 : 85 53 __ STA T0 + 0 
04:ad68 : 85 15 __ STA P8 
04:ad6a : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
04:ad6d : a9 51 __ LDA #$51
04:ad6f : a0 02 __ LDY #$02
04:ad71 : 91 23 __ STA (SP + 0),y 
04:ad73 : a9 89 __ LDA #$89
04:ad75 : c8 __ __ INY
04:ad76 : 91 23 __ STA (SP + 0),y 
04:ad78 : a9 d6 __ LDA #$d6
04:ad7a : c8 __ __ INY
04:ad7b : 91 23 __ STA (SP + 0),y 
04:ad7d : a9 ae __ LDA #$ae
04:ad7f : c8 __ __ INY
04:ad80 : 91 23 __ STA (SP + 0),y 
04:ad82 : ad c9 87 LDA $87c9 ; (canvas + 3)
04:ad85 : c8 __ __ INY
04:ad86 : 91 23 __ STA (SP + 0),y 
04:ad88 : ad ca 87 LDA $87ca ; (canvas + 4)
04:ad8b : c8 __ __ INY
04:ad8c : 91 23 __ STA (SP + 0),y 
04:ad8e : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:ad91 : a9 15 __ LDA #$15
04:ad93 : 85 16 __ STA P9 
04:ad95 : a9 09 __ LDA #$09
04:ad97 : 85 17 __ STA P10 
04:ad99 : a9 51 __ LDA #$51
04:ad9b : 8d f3 ab STA $abf3 ; (sstack + 0)
04:ad9e : a9 89 __ LDA #$89
04:ada0 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:ada3 : a9 03 __ LDA #$03
04:ada5 : 8d f5 ab STA $abf5 ; (sstack + 2)
04:ada8 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
04:adab : 20 8c 80 JSR $808c ; (strtol@proxy + 0)
04:adae : a5 1b __ LDA ACCU + 0 
04:adb0 : 85 54 __ STA T3 + 0 
04:adb2 : a5 1c __ LDA ACCU + 1 
04:adb4 : 85 55 __ STA T3 + 1 
04:adb6 : a9 0a __ LDA #$0a
04:adb8 : 85 12 __ STA P5 
04:adba : a9 d9 __ LDA #$d9
04:adbc : 85 13 __ STA P6 
04:adbe : a9 ae __ LDA #$ae
04:adc0 : 85 14 __ STA P7 
04:adc2 : 20 43 81 JSR $8143 ; (vdc_prints_attr@proxy + 0)
04:adc5 : a9 51 __ LDA #$51
04:adc7 : a0 02 __ LDY #$02
04:adc9 : 91 23 __ STA (SP + 0),y 
04:adcb : a9 89 __ LDA #$89
04:adcd : c8 __ __ INY
04:adce : 91 23 __ STA (SP + 0),y 
04:add0 : a9 d6 __ LDA #$d6
04:add2 : c8 __ __ INY
04:add3 : 91 23 __ STA (SP + 0),y 
04:add5 : a9 ae __ LDA #$ae
04:add7 : c8 __ __ INY
04:add8 : 91 23 __ STA (SP + 0),y 
04:adda : ad cb 87 LDA $87cb ; (canvas + 5)
04:addd : c8 __ __ INY
04:adde : 91 23 __ STA (SP + 0),y 
04:ade0 : ad cc 87 LDA $87cc ; (canvas + 6)
04:ade3 : c8 __ __ INY
04:ade4 : 91 23 __ STA (SP + 0),y 
04:ade6 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:ade9 : a9 15 __ LDA #$15
04:adeb : 85 16 __ STA P9 
04:aded : a9 0b __ LDA #$0b
04:adef : 85 17 __ STA P10 
04:adf1 : a9 51 __ LDA #$51
04:adf3 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:adf6 : a9 89 __ LDA #$89
04:adf8 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:adfb : a9 03 __ LDA #$03
04:adfd : 8d f5 ab STA $abf5 ; (sstack + 2)
04:ae00 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
04:ae03 : 20 8c 80 JSR $808c ; (strtol@proxy + 0)
04:ae06 : a5 1b __ LDA ACCU + 0 
04:ae08 : 85 56 __ STA T5 + 0 
04:ae0a : a5 1c __ LDA ACCU + 1 
04:ae0c : 85 57 __ STA T5 + 1 
04:ae0e : a5 54 __ LDA T3 + 0 
04:ae10 : 85 03 __ STA WORK + 0 
04:ae12 : a5 55 __ LDA T3 + 1 
04:ae14 : 85 04 __ STA WORK + 1 
04:ae16 : 20 87 7c JSR $7c87 ; (mul16 + 0)
04:ae19 : a5 05 __ LDA WORK + 2 
04:ae1b : 0a __ __ ASL
04:ae1c : aa __ __ TAX
04:ae1d : a5 06 __ LDA WORK + 3 
04:ae1f : 2a __ __ ROL
04:ae20 : a8 __ __ TAY
04:ae21 : 8a __ __ TXA
04:ae22 : 18 __ __ CLC
04:ae23 : 69 30 __ ADC #$30
04:ae25 : 85 1b __ STA ACCU + 0 
04:ae27 : 90 01 __ BCC $ae2a ; (loadscreenmap.s1005 + 0)
.s1004:
04:ae29 : c8 __ __ INY
.s1005:
04:ae2a : 84 1c __ STY ACCU + 1 
04:ae2c : a9 77 __ LDA #$77
04:ae2e : c5 1c __ CMP ACCU + 1 
04:ae30 : d0 04 __ BNE $ae36 ; (loadscreenmap.s1003 + 0)
.s1002:
04:ae32 : a9 ff __ LDA #$ff
04:ae34 : c5 1b __ CMP ACCU + 0 
.s1003:
04:ae36 : b0 18 __ BCS $ae50 ; (loadscreenmap.s9 + 0)
.s8:
04:ae38 : a9 0c __ LDA #$0c
04:ae3a : 85 12 __ STA P5 
04:ae3c : a9 00 __ LDA #$00
04:ae3e : 85 13 __ STA P6 
04:ae40 : a9 af __ LDA #$af
04:ae42 : 85 14 __ STA P7 
04:ae44 : 20 43 81 JSR $8143 ; (vdc_prints_attr@proxy + 0)
04:ae47 : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
04:ae4a : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
04:ae4d : 4c 0c ad JMP $ad0c ; (loadscreenmap.s1001 + 0)
.s9:
04:ae50 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
04:ae53 : a9 01 __ LDA #$01
04:ae55 : 85 10 __ STA P3 
04:ae57 : a9 00 __ LDA #$00
04:ae59 : 85 11 __ STA P4 
04:ae5b : a9 58 __ LDA #$58
04:ae5d : 85 12 __ STA P5 
04:ae5f : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
04:ae62 : a5 1b __ LDA ACCU + 0 
04:ae64 : d0 03 __ BNE $ae69 ; (loadscreenmap.s12 + 0)
04:ae66 : 4c 0c ad JMP $ad0c ; (loadscreenmap.s1001 + 0)
.s12:
04:ae69 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
04:ae6c : a5 54 __ LDA T3 + 0 
04:ae6e : 8d c9 87 STA $87c9 ; (canvas + 3)
04:ae71 : a5 55 __ LDA T3 + 1 
04:ae73 : 8d ca 87 STA $87ca ; (canvas + 4)
04:ae76 : a5 56 __ LDA T5 + 0 
04:ae78 : 8d cb 87 STA $87cb ; (canvas + 5)
04:ae7b : a5 57 __ LDA T5 + 1 
04:ae7d : 8d cc 87 STA $87cc ; (canvas + 6)
04:ae80 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
04:ae83 : 20 18 3d JSR $3d18 ; (placesignature.s1000 + 0)
04:ae86 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
04:ae89 : a9 00 __ LDA #$00
04:ae8b : 85 17 __ STA P10 
04:ae8d : 85 18 __ STA P11 
04:ae8f : 8d f3 ab STA $abf3 ; (sstack + 0)
04:ae92 : a9 01 __ LDA #$01
04:ae94 : 8d f5 ab STA $abf5 ; (sstack + 2)
04:ae97 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
04:ae9a : 8d f4 ab STA $abf4 ; (sstack + 1)
04:ae9d : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
04:aea0 : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
04:aea3 : ad ff 87 LDA $87ff ; (showbar + 0)
04:aea6 : f0 03 __ BEQ $aeab ; (loadscreenmap.s22 + 0)
.s15:
04:aea8 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s22:
04:aeab : a9 00 __ LDA #$00
04:aead : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
04:aeb0 : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
04:aeb3 : 4c 0c ad JMP $ad0c ; (loadscreenmap.s1001 + 0)
--------------------------------------------------------------------
04:aeb6 : __ __ __ BYT 6c 4f 41 44 20 53 43 52 45 45 4e 00             : lOAD SCREEN.
--------------------------------------------------------------------
04:aec2 : __ __ __ BYT 65 4e 54 45 52 20 53 43 52 45 45 4e 20 57 49 44 : eNTER SCREEN WID
04:aed2 : __ __ __ BYT 54 48 3a 00                                     : TH:.
--------------------------------------------------------------------
04:aed6 : __ __ __ BYT 25 55 00                                        : %U.
--------------------------------------------------------------------
04:aed9 : __ __ __ BYT 65 4e 54 45 52 20 53 43 52 45 45 4e 20 48 45 49 : eNTER SCREEN HEI
04:aee9 : __ __ __ BYT 47 48 54 3a 00                                  : GHT:.
--------------------------------------------------------------------
04:aeee : __ __ __ BYT 73 41 56 45 20 50 52 4f 4a 45 43 54 00          : sAVE PROJECT.
--------------------------------------------------------------------
04:af00 : __ __ __ BYT 6e 45 57 20 53 49 5a 45 20 55 4e 53 55 50 50 4f : nEW SIZE UNSUPPO
04:af10 : __ __ __ BYT 52 54 45 44 2e 20 70 52 45 53 53 20 4b 45 59 2e : RTED. pRESS KEY.
04:af20 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
saveproject: ; saveproject()->void
.s1000:
04:af21 : a2 04 __ LDX #$04
04:af23 : b5 53 __ LDA T0 + 0,x 
04:af25 : 9d 7a ab STA $ab7a,x ; (saveproject@stack + 0)
04:af28 : ca __ __ DEX
04:af29 : 10 f8 __ BPL $af23 ; (saveproject.s1000 + 2)
04:af2b : 38 __ __ SEC
04:af2c : a5 23 __ LDA SP + 0 
04:af2e : e9 08 __ SBC #$08
04:af30 : 85 23 __ STA SP + 0 
04:af32 : b0 02 __ BCS $af36 ; (saveproject.s0 + 0)
04:af34 : c6 24 __ DEC SP + 1 
.s0:
04:af36 : a9 0a __ LDA #$0a
04:af38 : 8d fa ab STA $abfa ; (sstack + 7)
04:af3b : a9 ee __ LDA #$ee
04:af3d : 8d f8 ab STA $abf8 ; (sstack + 5)
04:af40 : a9 ae __ LDA #$ae
04:af42 : 8d f9 ab STA $abf9 ; (sstack + 6)
04:af45 : 20 ac 4b JSR $4bac ; (chooseidandfilename.s0 + 0)
04:af48 : a5 1b __ LDA ACCU + 0 
04:af4a : 85 53 __ STA T0 + 0 
04:af4c : a5 1c __ LDA ACCU + 1 
04:af4e : 85 54 __ STA T0 + 1 
04:af50 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
04:af53 : a9 00 __ LDA #$00
04:af55 : a2 17 __ LDX #$17
.l1002:
04:af57 : ca __ __ DEX
04:af58 : 9d 98 ab STA $ab98,x ; (projbuffer + 9)
04:af5b : d0 fa __ BNE $af57 ; (saveproject.l1002 + 0)
.s1003:
04:af5d : a5 54 __ LDA T0 + 1 
04:af5f : c9 ff __ CMP #$ff
04:af61 : d0 06 __ BNE $af69 ; (saveproject.s3 + 0)
.s1010:
04:af63 : a5 53 __ LDA T0 + 0 
04:af65 : c9 ff __ CMP #$ff
04:af67 : f0 3b __ BEQ $afa4 ; (saveproject.s1001 + 0)
.s3:
04:af69 : a9 83 __ LDA #$83
04:af6b : a0 02 __ LDY #$02
04:af6d : 91 23 __ STA (SP + 0),y 
04:af6f : a9 ab __ LDA #$ab
04:af71 : c8 __ __ INY
04:af72 : 91 23 __ STA (SP + 0),y 
04:af74 : a9 45 __ LDA #$45
04:af76 : c8 __ __ INY
04:af77 : 91 23 __ STA (SP + 0),y 
04:af79 : a9 b2 __ LDA #$b2
04:af7b : c8 __ __ INY
04:af7c : 91 23 __ STA (SP + 0),y 
04:af7e : a9 97 __ LDA #$97
04:af80 : c8 __ __ INY
04:af81 : 91 23 __ STA (SP + 0),y 
04:af83 : a9 87 __ LDA #$87
04:af85 : c8 __ __ INY
04:af86 : 91 23 __ STA (SP + 0),y 
04:af88 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:af8b : a9 83 __ LDA #$83
04:af8d : 8d fc ab STA $abfc ; (sstack + 9)
04:af90 : a9 ab __ LDA #$ab
04:af92 : 8d fd ab STA $abfd ; (sstack + 10)
04:af95 : ad ac 87 LDA $87ac ; (targetdevice + 0)
04:af98 : 85 55 __ STA T1 + 0 
04:af9a : 8d fe ab STA $abfe ; (sstack + 11)
04:af9d : 20 48 62 JSR $6248 ; (checkiffileexists.s1000 + 0)
04:afa0 : a5 1b __ LDA ACCU + 0 
04:afa2 : d0 16 __ BNE $afba ; (saveproject.s5 + 0)
.s1001:
04:afa4 : 18 __ __ CLC
04:afa5 : a5 23 __ LDA SP + 0 
04:afa7 : 69 08 __ ADC #$08
04:afa9 : 85 23 __ STA SP + 0 
04:afab : 90 02 __ BCC $afaf ; (saveproject.s1001 + 11)
04:afad : e6 24 __ INC SP + 1 
04:afaf : a2 04 __ LDX #$04
04:afb1 : bd 7a ab LDA $ab7a,x ; (saveproject@stack + 0)
04:afb4 : 95 53 __ STA T0 + 0,x 
04:afb6 : ca __ __ DEX
04:afb7 : 10 f8 __ BPL $afb1 ; (saveproject.s1001 + 13)
04:afb9 : 60 __ __ RTS
.s5:
04:afba : c9 02 __ CMP #$02
04:afbc : f0 03 __ BEQ $afc1 ; (saveproject.s8 + 0)
04:afbe : 4c 5d b0 JMP $b05d ; (saveproject.s10 + 0)
.s8:
04:afc1 : a9 51 __ LDA #$51
04:afc3 : a0 02 __ LDY #$02
04:afc5 : 91 23 __ STA (SP + 0),y 
04:afc7 : a9 89 __ LDA #$89
04:afc9 : c8 __ __ INY
04:afca : 91 23 __ STA (SP + 0),y 
04:afcc : a9 97 __ LDA #$97
04:afce : a0 06 __ LDY #$06
04:afd0 : 91 23 __ STA (SP + 0),y 
04:afd2 : a9 87 __ LDA #$87
04:afd4 : c8 __ __ INY
04:afd5 : 91 23 __ STA (SP + 0),y 
04:afd7 : a9 4d __ LDA #$4d
04:afd9 : a0 04 __ LDY #$04
04:afdb : 91 23 __ STA (SP + 0),y 
04:afdd : a9 b2 __ LDA #$b2
04:afdf : c8 __ __ INY
04:afe0 : 91 23 __ STA (SP + 0),y 
04:afe2 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:afe5 : 20 ce 62 JSR $62ce ; (cmd@proxy + 0)
04:afe8 : a9 51 __ LDA #$51
04:afea : a0 02 __ LDY #$02
04:afec : 91 23 __ STA (SP + 0),y 
04:afee : a9 89 __ LDA #$89
04:aff0 : c8 __ __ INY
04:aff1 : 91 23 __ STA (SP + 0),y 
04:aff3 : a9 97 __ LDA #$97
04:aff5 : a0 06 __ LDY #$06
04:aff7 : 91 23 __ STA (SP + 0),y 
04:aff9 : a9 87 __ LDA #$87
04:affb : c8 __ __ INY
04:affc : 91 23 __ STA (SP + 0),y 
04:affe : a9 57 __ LDA #$57
04:b000 : a0 04 __ LDY #$04
04:b002 : 91 23 __ STA (SP + 0),y 
04:b004 : a9 b2 __ LDA #$b2
04:b006 : c8 __ __ INY
04:b007 : 91 23 __ STA (SP + 0),y 
04:b009 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b00c : 20 ce 62 JSR $62ce ; (cmd@proxy + 0)
04:b00f : a9 51 __ LDA #$51
04:b011 : a0 02 __ LDY #$02
04:b013 : 91 23 __ STA (SP + 0),y 
04:b015 : a9 89 __ LDA #$89
04:b017 : c8 __ __ INY
04:b018 : 91 23 __ STA (SP + 0),y 
04:b01a : a9 97 __ LDA #$97
04:b01c : a0 06 __ LDY #$06
04:b01e : 91 23 __ STA (SP + 0),y 
04:b020 : a9 87 __ LDA #$87
04:b022 : c8 __ __ INY
04:b023 : 91 23 __ STA (SP + 0),y 
04:b025 : a9 61 __ LDA #$61
04:b027 : a0 04 __ LDY #$04
04:b029 : 91 23 __ STA (SP + 0),y 
04:b02b : a9 b2 __ LDA #$b2
04:b02d : c8 __ __ INY
04:b02e : 91 23 __ STA (SP + 0),y 
04:b030 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b033 : 20 ce 62 JSR $62ce ; (cmd@proxy + 0)
04:b036 : a9 51 __ LDA #$51
04:b038 : a0 02 __ LDY #$02
04:b03a : 91 23 __ STA (SP + 0),y 
04:b03c : a9 89 __ LDA #$89
04:b03e : c8 __ __ INY
04:b03f : 91 23 __ STA (SP + 0),y 
04:b041 : a9 97 __ LDA #$97
04:b043 : a0 06 __ LDY #$06
04:b045 : 91 23 __ STA (SP + 0),y 
04:b047 : a9 87 __ LDA #$87
04:b049 : c8 __ __ INY
04:b04a : 91 23 __ STA (SP + 0),y 
04:b04c : a9 6b __ LDA #$6b
04:b04e : a0 04 __ LDY #$04
04:b050 : 91 23 __ STA (SP + 0),y 
04:b052 : a9 b2 __ LDA #$b2
04:b054 : c8 __ __ INY
04:b055 : 91 23 __ STA (SP + 0),y 
04:b057 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b05a : 20 ce 62 JSR $62ce ; (cmd@proxy + 0)
.s10:
04:b05d : a9 51 __ LDA #$51
04:b05f : a0 02 __ LDY #$02
04:b061 : 91 23 __ STA (SP + 0),y 
04:b063 : a9 89 __ LDA #$89
04:b065 : c8 __ __ INY
04:b066 : 91 23 __ STA (SP + 0),y 
04:b068 : a9 97 __ LDA #$97
04:b06a : a0 06 __ LDY #$06
04:b06c : 91 23 __ STA (SP + 0),y 
04:b06e : a9 87 __ LDA #$87
04:b070 : c8 __ __ INY
04:b071 : 91 23 __ STA (SP + 0),y 
04:b073 : ad 8a 87 LDA $878a ; (charsetchanged + 0)
04:b076 : 8d 98 ab STA $ab98 ; (projbuffer + 9)
04:b079 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
04:b07c : 8d 99 ab STA $ab99 ; (projbuffer + 10)
04:b07f : ad 8c 87 LDA $878c ; (screen_col + 0)
04:b082 : 8d 9a ab STA $ab9a ; (projbuffer + 11)
04:b085 : ad 8e 87 LDA $878e ; (screen_row + 0)
04:b088 : 8d 9b ab STA $ab9b ; (projbuffer + 12)
04:b08b : ad c9 87 LDA $87c9 ; (canvas + 3)
04:b08e : 8d 9d ab STA $ab9d ; (projbuffer + 14)
04:b091 : ad ca 87 LDA $87ca ; (canvas + 4)
04:b094 : 8d 9c ab STA $ab9c ; (projbuffer + 13)
04:b097 : ad cb 87 LDA $87cb ; (canvas + 5)
04:b09a : 8d 9f ab STA $ab9f ; (projbuffer + 16)
04:b09d : ad cc 87 LDA $87cc ; (canvas + 6)
04:b0a0 : 8d 9e ab STA $ab9e ; (projbuffer + 15)
04:b0a3 : ad db 87 LDA $87db ; (screentotal + 0)
04:b0a6 : 85 56 __ STA T4 + 0 
04:b0a8 : 8d a1 ab STA $aba1 ; (projbuffer + 18)
04:b0ab : ad dc 87 LDA $87dc ; (screentotal + 1)
04:b0ae : 85 57 __ STA T4 + 1 
04:b0b0 : 8d a0 ab STA $aba0 ; (projbuffer + 17)
04:b0b3 : ad 90 87 LDA $8790 ; (screenbackground + 0)
04:b0b6 : 8d a2 ab STA $aba2 ; (projbuffer + 19)
04:b0b9 : ad ff 7b LDA $7bff ; (mc_mb_normal + 0)
04:b0bc : 8d a3 ab STA $aba3 ; (projbuffer + 20)
04:b0bf : ad f3 82 LDA $82f3 ; (mc_mb_select + 0)
04:b0c2 : 8d a4 ab STA $aba4 ; (projbuffer + 21)
04:b0c5 : ad f4 82 LDA $82f4 ; (mc_pd_normal + 0)
04:b0c8 : 8d a5 ab STA $aba5 ; (projbuffer + 22)
04:b0cb : ad f5 82 LDA $82f5 ; (mc_pd_select + 0)
04:b0ce : 8d a6 ab STA $aba6 ; (chareditor@stack + 22)
04:b0d1 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
04:b0d4 : 8d a7 ab STA $aba7 ; (chareditor@stack + 23)
04:b0d7 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
04:b0da : 8d a8 ab STA $aba8 ; (chareditor@stack + 24)
04:b0dd : ad 92 87 LDA $8792 ; (plotcolor + 0)
04:b0e0 : 8d a9 ab STA $aba9 ; (chareditor@stack + 25)
04:b0e3 : ad 93 87 LDA $8793 ; (plotreverse + 0)
04:b0e6 : 8d aa ab STA $abaa ; (projbuffer + 18)
04:b0e9 : ad 94 87 LDA $8794 ; (plotunderline + 0)
04:b0ec : 8d ab ab STA $abab ; (projbuffer + 19)
04:b0ef : ad 95 87 LDA $8795 ; (plotblink + 0)
04:b0f2 : 8d ac ab STA $abac ; (projbuffer + 20)
04:b0f5 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
04:b0f8 : 8d ad ab STA $abad ; (projbuffer + 21)
04:b0fb : ad af 87 LDA $87af ; (vdc_state + 2)
04:b0fe : 8d ae ab STA $abae ; (projbuffer + 22)
04:b101 : a9 45 __ LDA #$45
04:b103 : a0 04 __ LDY #$04
04:b105 : 91 23 __ STA (SP + 0),y 
04:b107 : a9 b2 __ LDA #$b2
04:b109 : c8 __ __ INY
04:b10a : 91 23 __ STA (SP + 0),y 
04:b10c : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b10f : a5 55 __ LDA T1 + 0 
04:b111 : 85 12 __ STA P5 
04:b113 : a9 00 __ LDA #$00
04:b115 : 85 13 __ STA P6 
04:b117 : a9 51 __ LDA #$51
04:b119 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b11c : a9 89 __ LDA #$89
04:b11e : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b121 : a9 98 __ LDA #$98
04:b123 : 85 14 __ STA P7 
04:b125 : a9 ab __ LDA #$ab
04:b127 : 85 15 __ STA P8 
04:b129 : a9 af __ LDA #$af
04:b12b : 85 16 __ STA P9 
04:b12d : a9 ab __ LDA #$ab
04:b12f : 85 17 __ STA P10 
04:b131 : 20 5c 15 JSR $155c ; (bnk_save.s0 + 0)
04:b134 : a5 1b __ LDA ACCU + 0 
04:b136 : d0 03 __ BNE $b13b ; (saveproject.s13 + 0)
.s11:
04:b138 : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s13:
04:b13b : a9 51 __ LDA #$51
04:b13d : a0 02 __ LDY #$02
04:b13f : 91 23 __ STA (SP + 0),y 
04:b141 : a9 89 __ LDA #$89
04:b143 : c8 __ __ INY
04:b144 : 91 23 __ STA (SP + 0),y 
04:b146 : a9 97 __ LDA #$97
04:b148 : a0 06 __ LDY #$06
04:b14a : 91 23 __ STA (SP + 0),y 
04:b14c : a9 87 __ LDA #$87
04:b14e : c8 __ __ INY
04:b14f : 91 23 __ STA (SP + 0),y 
04:b151 : a9 75 __ LDA #$75
04:b153 : a0 04 __ LDY #$04
04:b155 : 91 23 __ STA (SP + 0),y 
04:b157 : a9 b2 __ LDA #$b2
04:b159 : c8 __ __ INY
04:b15a : 91 23 __ STA (SP + 0),y 
04:b15c : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b15f : a5 55 __ LDA T1 + 0 
04:b161 : 85 12 __ STA P5 
04:b163 : a9 01 __ LDA #$01
04:b165 : 85 13 __ STA P6 
04:b167 : a9 51 __ LDA #$51
04:b169 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b16c : a9 89 __ LDA #$89
04:b16e : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b171 : a9 00 __ LDA #$00
04:b173 : 85 14 __ STA P7 
04:b175 : 06 56 __ ASL T4 + 0 
04:b177 : 26 57 __ ROL T4 + 1 
04:b179 : 18 __ __ CLC
04:b17a : a9 30 __ LDA #$30
04:b17c : 65 56 __ ADC T4 + 0 
04:b17e : 85 16 __ STA P9 
04:b180 : a9 58 __ LDA #$58
04:b182 : 85 15 __ STA P8 
04:b184 : 65 57 __ ADC T4 + 1 
04:b186 : 85 17 __ STA P10 
04:b188 : 20 5c 15 JSR $155c ; (bnk_save.s0 + 0)
04:b18b : a5 1b __ LDA ACCU + 0 
04:b18d : d0 03 __ BNE $b192 ; (saveproject.s16 + 0)
.s14:
04:b18f : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s16:
04:b192 : ad 8a 87 LDA $878a ; (charsetchanged + 0)
04:b195 : c9 01 __ CMP #$01
04:b197 : d0 4e __ BNE $b1e7 ; (saveproject.s19 + 0)
.s17:
04:b199 : a9 51 __ LDA #$51
04:b19b : a0 02 __ LDY #$02
04:b19d : 91 23 __ STA (SP + 0),y 
04:b19f : a9 89 __ LDA #$89
04:b1a1 : c8 __ __ INY
04:b1a2 : 91 23 __ STA (SP + 0),y 
04:b1a4 : a9 97 __ LDA #$97
04:b1a6 : a0 06 __ LDY #$06
04:b1a8 : 91 23 __ STA (SP + 0),y 
04:b1aa : a9 87 __ LDA #$87
04:b1ac : c8 __ __ INY
04:b1ad : 91 23 __ STA (SP + 0),y 
04:b1af : a9 7d __ LDA #$7d
04:b1b1 : a0 04 __ LDY #$04
04:b1b3 : 91 23 __ STA (SP + 0),y 
04:b1b5 : a9 b2 __ LDA #$b2
04:b1b7 : c8 __ __ INY
04:b1b8 : 91 23 __ STA (SP + 0),y 
04:b1ba : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b1bd : a5 55 __ LDA T1 + 0 
04:b1bf : 85 12 __ STA P5 
04:b1c1 : a9 01 __ LDA #$01
04:b1c3 : 85 13 __ STA P6 
04:b1c5 : a9 51 __ LDA #$51
04:b1c7 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b1ca : a9 89 __ LDA #$89
04:b1cc : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b1cf : a9 00 __ LDA #$00
04:b1d1 : 85 14 __ STA P7 
04:b1d3 : 85 16 __ STA P9 
04:b1d5 : a9 48 __ LDA #$48
04:b1d7 : 85 15 __ STA P8 
04:b1d9 : a9 50 __ LDA #$50
04:b1db : 85 17 __ STA P10 
04:b1dd : 20 5c 15 JSR $155c ; (bnk_save.s0 + 0)
04:b1e0 : a5 1b __ LDA ACCU + 0 
04:b1e2 : d0 03 __ BNE $b1e7 ; (saveproject.s19 + 0)
.s20:
04:b1e4 : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s19:
04:b1e7 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
04:b1ea : c9 01 __ CMP #$01
04:b1ec : f0 03 __ BEQ $b1f1 ; (saveproject.s23 + 0)
04:b1ee : 4c a4 af JMP $afa4 ; (saveproject.s1001 + 0)
.s23:
04:b1f1 : a9 51 __ LDA #$51
04:b1f3 : a0 02 __ LDY #$02
04:b1f5 : 91 23 __ STA (SP + 0),y 
04:b1f7 : a9 89 __ LDA #$89
04:b1f9 : c8 __ __ INY
04:b1fa : 91 23 __ STA (SP + 0),y 
04:b1fc : a9 97 __ LDA #$97
04:b1fe : a0 06 __ LDY #$06
04:b200 : 91 23 __ STA (SP + 0),y 
04:b202 : a9 87 __ LDA #$87
04:b204 : c8 __ __ INY
04:b205 : 91 23 __ STA (SP + 0),y 
04:b207 : a9 85 __ LDA #$85
04:b209 : a0 04 __ LDY #$04
04:b20b : 91 23 __ STA (SP + 0),y 
04:b20d : a9 b2 __ LDA #$b2
04:b20f : c8 __ __ INY
04:b210 : 91 23 __ STA (SP + 0),y 
04:b212 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b215 : a5 55 __ LDA T1 + 0 
04:b217 : 85 12 __ STA P5 
04:b219 : a9 01 __ LDA #$01
04:b21b : 85 13 __ STA P6 
04:b21d : a9 58 __ LDA #$58
04:b21f : 85 17 __ STA P10 
04:b221 : a9 51 __ LDA #$51
04:b223 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b226 : a9 89 __ LDA #$89
04:b228 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b22b : a9 00 __ LDA #$00
04:b22d : 85 16 __ STA P9 
04:b22f : 85 14 __ STA P7 
04:b231 : a9 50 __ LDA #$50
04:b233 : 85 15 __ STA P8 
04:b235 : 20 5c 15 JSR $155c ; (bnk_save.s0 + 0)
04:b238 : a5 1b __ LDA ACCU + 0 
04:b23a : f0 03 __ BEQ $b23f ; (saveproject.s26 + 0)
04:b23c : 4c a4 af JMP $afa4 ; (saveproject.s1001 + 0)
.s26:
04:b23f : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
04:b242 : 4c a4 af JMP $afa4 ; (saveproject.s1001 + 0)
--------------------------------------------------------------------
04:b245 : __ __ __ BYT 25 53 2e 50 52 4f 4a 00                         : %S.PROJ.
--------------------------------------------------------------------
04:b24d : __ __ __ BYT 53 3a 25 53 2e 50 52 4f 4a 00                   : S:%S.PROJ.
--------------------------------------------------------------------
04:b257 : __ __ __ BYT 53 3a 25 53 2e 53 43 52 4e 00                   : S:%S.SCRN.
--------------------------------------------------------------------
04:b261 : __ __ __ BYT 53 3a 25 53 2e 43 48 52 53 00                   : S:%S.CHRS.
--------------------------------------------------------------------
04:b26b : __ __ __ BYT 53 3a 25 53 2e 43 48 52 41 00                   : S:%S.CHRA.
--------------------------------------------------------------------
04:b275 : __ __ __ BYT 25 53 2e 53 43 52 4e 00                         : %S.SCRN.
--------------------------------------------------------------------
04:b27d : __ __ __ BYT 25 53 2e 43 48 52 53 00                         : %S.CHRS.
--------------------------------------------------------------------
04:b285 : __ __ __ BYT 25 53 2e 43 48 52 41 00                         : %S.CHRA.
--------------------------------------------------------------------
loadproject: ; loadproject()->void
.s1000:
04:b28d : a5 53 __ LDA T0 + 0 
04:b28f : 8d 86 ab STA $ab86 ; (tempfilename + 3)
04:b292 : a5 54 __ LDA T3 + 0 
04:b294 : 8d 87 ab STA $ab87 ; (tempfilename + 4)
04:b297 : a5 55 __ LDA T4 + 0 
04:b299 : 8d 88 ab STA $ab88 ; (tempfilename + 5)
04:b29c : 38 __ __ SEC
04:b29d : a5 23 __ LDA SP + 0 
04:b29f : e9 08 __ SBC #$08
04:b2a1 : 85 23 __ STA SP + 0 
04:b2a3 : b0 02 __ BCS $b2a7 ; (loadproject.s0 + 0)
04:b2a5 : c6 24 __ DEC SP + 1 
.s0:
04:b2a7 : a9 01 __ LDA #$01
04:b2a9 : 8d fc ab STA $abfc ; (sstack + 9)
04:b2ac : a9 00 __ LDA #$00
04:b2ae : a2 17 __ LDX #$17
.l1002:
04:b2b0 : ca __ __ DEX
04:b2b1 : 9d 8f ab STA $ab8f,x ; (tempfilename + 12)
04:b2b4 : d0 fa __ BNE $b2b0 ; (loadproject.l1002 + 0)
.s1003:
04:b2b6 : 20 dd 64 JSR $64dd ; (filepicker.s1000 + 0)
04:b2b9 : a5 1b __ LDA ACCU + 0 
04:b2bb : f0 57 __ BEQ $b314 ; (loadproject.s1001 + 0)
.s3:
04:b2bd : a9 97 __ LDA #$97
04:b2bf : 85 0d __ STA P0 
04:b2c1 : a9 87 __ LDA #$87
04:b2c3 : 85 0e __ STA P1 
04:b2c5 : 20 8d 33 JSR $338d ; (strlen.s0 + 0)
04:b2c8 : a9 97 __ LDA #$97
04:b2ca : a0 06 __ LDY #$06
04:b2cc : 91 23 __ STA (SP + 0),y 
04:b2ce : a9 87 __ LDA #$87
04:b2d0 : c8 __ __ INY
04:b2d1 : 91 23 __ STA (SP + 0),y 
04:b2d3 : a9 00 __ LDA #$00
04:b2d5 : a6 1b __ LDX ACCU + 0 
04:b2d7 : 9d 92 87 STA $8792,x ; (plotcolor + 0)
04:b2da : a9 51 __ LDA #$51
04:b2dc : a0 02 __ LDY #$02
04:b2de : 91 23 __ STA (SP + 0),y 
04:b2e0 : a9 89 __ LDA #$89
04:b2e2 : c8 __ __ INY
04:b2e3 : 91 23 __ STA (SP + 0),y 
04:b2e5 : a9 45 __ LDA #$45
04:b2e7 : c8 __ __ INY
04:b2e8 : 91 23 __ STA (SP + 0),y 
04:b2ea : a9 b2 __ LDA #$b2
04:b2ec : c8 __ __ INY
04:b2ed : 91 23 __ STA (SP + 0),y 
04:b2ef : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b2f2 : a9 00 __ LDA #$00
04:b2f4 : 85 10 __ STA P3 
04:b2f6 : a9 51 __ LDA #$51
04:b2f8 : 85 13 __ STA P6 
04:b2fa : a9 89 __ LDA #$89
04:b2fc : 85 14 __ STA P7 
04:b2fe : a9 8f __ LDA #$8f
04:b300 : 85 11 __ STA P4 
04:b302 : a9 ab __ LDA #$ab
04:b304 : 85 12 __ STA P5 
04:b306 : ad ac 87 LDA $87ac ; (targetdevice + 0)
04:b309 : 85 53 __ STA T0 + 0 
04:b30b : 85 0f __ STA P2 
04:b30d : 20 6c 13 JSR $136c ; (bnk_load.s0 + 0)
04:b310 : a5 1b __ LDA ACCU + 0 
04:b312 : d0 1b __ BNE $b32f ; (loadproject.s7 + 0)
.s1001:
04:b314 : 18 __ __ CLC
04:b315 : a5 23 __ LDA SP + 0 
04:b317 : 69 08 __ ADC #$08
04:b319 : 85 23 __ STA SP + 0 
04:b31b : 90 02 __ BCC $b31f ; (loadproject.s1001 + 11)
04:b31d : e6 24 __ INC SP + 1 
04:b31f : ad 86 ab LDA $ab86 ; (tempfilename + 3)
04:b322 : 85 53 __ STA T0 + 0 
04:b324 : ad 87 ab LDA $ab87 ; (tempfilename + 4)
04:b327 : 85 54 __ STA T3 + 0 
04:b329 : ad 88 ab LDA $ab88 ; (tempfilename + 5)
04:b32c : 85 55 __ STA T4 + 0 
04:b32e : 60 __ __ RTS
.s7:
04:b32f : ad 8a 87 LDA $878a ; (charsetchanged + 0)
04:b332 : 85 54 __ STA T3 + 0 
04:b334 : ad 8f ab LDA $ab8f ; (tempfilename + 12)
04:b337 : 8d 8a 87 STA $878a ; (charsetchanged + 0)
04:b33a : ad 8b 87 LDA $878b ; (charsetchanged + 1)
04:b33d : 85 55 __ STA T4 + 0 
04:b33f : ad 90 ab LDA $ab90 ; (tempfilename + 13)
04:b342 : 8d 8b 87 STA $878b ; (charsetchanged + 1)
04:b345 : ad 91 ab LDA $ab91 ; (tempfilename + 14)
04:b348 : 8d 8c 87 STA $878c ; (screen_col + 0)
04:b34b : ad 92 ab LDA $ab92 ; (tempfilename + 15)
04:b34e : 8d 8e 87 STA $878e ; (screen_row + 0)
04:b351 : a9 00 __ LDA #$00
04:b353 : 8d 8d 87 STA $878d ; (screen_col + 1)
04:b356 : 8d 8f 87 STA $878f ; (screen_row + 1)
04:b359 : ad 94 ab LDA $ab94 ; (tempfilename + 17)
04:b35c : 8d c9 87 STA $87c9 ; (canvas + 3)
04:b35f : ad 93 ab LDA $ab93 ; (tempfilename + 16)
04:b362 : 8d ca 87 STA $87ca ; (canvas + 4)
04:b365 : ad 96 ab LDA $ab96 ; (tempfilename + 19)
04:b368 : 8d cb 87 STA $87cb ; (canvas + 5)
04:b36b : ad 95 ab LDA $ab95 ; (tempfilename + 18)
04:b36e : 8d cc 87 STA $87cc ; (canvas + 6)
04:b371 : ad 98 ab LDA $ab98 ; (projbuffer + 9)
04:b374 : 8d db 87 STA $87db ; (screentotal + 0)
04:b377 : ad 97 ab LDA $ab97 ; (tempfilename + 20)
04:b37a : 8d dc 87 STA $87dc ; (screentotal + 1)
04:b37d : ad 99 ab LDA $ab99 ; (projbuffer + 10)
04:b380 : 8d 90 87 STA $8790 ; (screenbackground + 0)
04:b383 : a9 1a __ LDA #$1a
04:b385 : 8d 00 d6 STA $d600 
.l89:
04:b388 : 2c 00 d6 BIT $d600 
04:b38b : 10 fb __ BPL $b388 ; (loadproject.l89 + 0)
.s15:
04:b38d : ad 01 d6 LDA $d601 
04:b390 : 29 f0 __ AND #$f0
04:b392 : 18 __ __ CLC
04:b393 : 6d 99 ab ADC $ab99 ; (projbuffer + 10)
04:b396 : a2 1a __ LDX #$1a
04:b398 : 8e 00 d6 STX $d600 
.l91:
04:b39b : 2c 00 d6 BIT $d600 
04:b39e : 10 fb __ BPL $b39b ; (loadproject.l91 + 0)
.s21:
04:b3a0 : 8d 01 d6 STA $d601 
04:b3a3 : ad 9a ab LDA $ab9a ; (projbuffer + 11)
04:b3a6 : 8d ff 7b STA $7bff ; (mc_mb_normal + 0)
04:b3a9 : ad 9b ab LDA $ab9b ; (projbuffer + 12)
04:b3ac : 8d f3 82 STA $82f3 ; (mc_mb_select + 0)
04:b3af : ad 9c ab LDA $ab9c ; (projbuffer + 13)
04:b3b2 : 8d f4 82 STA $82f4 ; (mc_pd_normal + 0)
04:b3b5 : ad 9d ab LDA $ab9d ; (projbuffer + 14)
04:b3b8 : 8d f5 82 STA $82f5 ; (mc_pd_select + 0)
04:b3bb : ad 9e ab LDA $ab9e ; (projbuffer + 15)
04:b3be : 8d ff 69 STA $69ff ; (mc_menupopup + 0)
04:b3c1 : ad 9f ab LDA $ab9f ; (projbuffer + 16)
04:b3c4 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
04:b3c7 : ad a0 ab LDA $aba0 ; (projbuffer + 17)
04:b3ca : 8d 92 87 STA $8792 ; (plotcolor + 0)
04:b3cd : ad a1 ab LDA $aba1 ; (projbuffer + 18)
04:b3d0 : 8d 93 87 STA $8793 ; (plotreverse + 0)
04:b3d3 : ad a2 ab LDA $aba2 ; (projbuffer + 19)
04:b3d6 : 8d 94 87 STA $8794 ; (plotunderline + 0)
04:b3d9 : ad a3 ab LDA $aba3 ; (projbuffer + 20)
04:b3dc : 8d 95 87 STA $8795 ; (plotblink + 0)
04:b3df : ad a4 ab LDA $aba4 ; (projbuffer + 21)
04:b3e2 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
04:b3e5 : ad a5 ab LDA $aba5 ; (projbuffer + 22)
04:b3e8 : cd af 87 CMP $87af ; (vdc_state + 2)
04:b3eb : f0 05 __ BEQ $b3f2 ; (loadproject.s24 + 0)
.s22:
04:b3ed : 85 16 __ STA P9 
04:b3ef : 20 3b 2e JSR $2e3b ; (vdc_set_mode.s0 + 0)
.s24:
04:b3f2 : 20 7b 31 JSR $317b ; (updatecanvas.s1000 + 0)
04:b3f5 : a9 51 __ LDA #$51
04:b3f7 : a0 02 __ LDY #$02
04:b3f9 : 91 23 __ STA (SP + 0),y 
04:b3fb : a9 89 __ LDA #$89
04:b3fd : c8 __ __ INY
04:b3fe : 91 23 __ STA (SP + 0),y 
04:b400 : a9 75 __ LDA #$75
04:b402 : c8 __ __ INY
04:b403 : 91 23 __ STA (SP + 0),y 
04:b405 : a9 b2 __ LDA #$b2
04:b407 : c8 __ __ INY
04:b408 : 91 23 __ STA (SP + 0),y 
04:b40a : a9 97 __ LDA #$97
04:b40c : c8 __ __ INY
04:b40d : 91 23 __ STA (SP + 0),y 
04:b40f : a9 87 __ LDA #$87
04:b411 : c8 __ __ INY
04:b412 : 91 23 __ STA (SP + 0),y 
04:b414 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b417 : a9 58 __ LDA #$58
04:b419 : 85 12 __ STA P5 
04:b41b : 20 04 1a JSR $1a04 ; (bnk_load@proxy + 0)
04:b41e : a5 1b __ LDA ACCU + 0 
04:b420 : f0 33 __ BEQ $b455 ; (loadproject.s96 + 0)
.s25:
04:b422 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
04:b425 : 20 18 3d JSR $3d18 ; (placesignature.s1000 + 0)
04:b428 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
04:b42b : a9 00 __ LDA #$00
04:b42d : 85 17 __ STA P10 
04:b42f : 85 18 __ STA P11 
04:b431 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b434 : a9 01 __ LDA #$01
04:b436 : 8d f5 ab STA $abf5 ; (sstack + 2)
04:b439 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
04:b43c : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b43f : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
04:b442 : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
04:b445 : ad ff 87 LDA $87ff ; (showbar + 0)
04:b448 : f0 03 __ BEQ $b44d ; (loadproject.s102 + 0)
.s28:
04:b44a : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
.s102:
04:b44d : a9 00 __ LDA #$00
04:b44f : 8d e0 87 STA $87e0 ; (undo_undopossible + 0)
04:b452 : 8d e1 87 STA $87e1 ; (undo_redopossible + 0)
.s96:
04:b455 : ad 8a 87 LDA $878a ; (charsetchanged + 0)
04:b458 : d0 04 __ BNE $b45e ; (loadproject.s34 + 0)
.s35:
04:b45a : a5 54 __ LDA T3 + 0 
04:b45c : d0 09 __ BNE $b467 ; (loadproject.s31 + 0)
.s34:
04:b45e : ad 8b 87 LDA $878b ; (charsetchanged + 1)
04:b461 : d0 1f __ BNE $b482 ; (loadproject.s33 + 0)
.s36:
04:b463 : a5 55 __ LDA T4 + 0 
04:b465 : f0 1b __ BEQ $b482 ; (loadproject.s33 + 0)
.s31:
04:b467 : 20 0b 30 JSR $300b ; (vdc_restore_charsets.s0 + 0)
04:b46a : a9 7f __ LDA #$7f
04:b46c : 85 0d __ STA P0 
04:b46e : a9 01 __ LDA #$01
04:b470 : 85 10 __ STA P3 
04:b472 : a9 00 __ LDA #$00
04:b474 : 85 13 __ STA P6 
04:b476 : 85 0e __ STA P1 
04:b478 : 85 11 __ STA P4 
04:b47a : 20 8a 14 JSR $148a ; (bnk_memcpy@proxy + 0)
04:b47d : a9 01 __ LDA #$01
04:b47f : 8d 8a 87 STA $878a ; (charsetchanged + 0)
.s33:
04:b482 : ad 8a 87 LDA $878a ; (charsetchanged + 0)
04:b485 : c9 01 __ CMP #$01
04:b487 : d0 3c __ BNE $b4c5 ; (loadproject.s39 + 0)
.s37:
04:b489 : a9 51 __ LDA #$51
04:b48b : a0 02 __ LDY #$02
04:b48d : 91 23 __ STA (SP + 0),y 
04:b48f : a9 89 __ LDA #$89
04:b491 : c8 __ __ INY
04:b492 : 91 23 __ STA (SP + 0),y 
04:b494 : a9 97 __ LDA #$97
04:b496 : a0 06 __ LDY #$06
04:b498 : 91 23 __ STA (SP + 0),y 
04:b49a : a9 87 __ LDA #$87
04:b49c : c8 __ __ INY
04:b49d : 91 23 __ STA (SP + 0),y 
04:b49f : a9 7d __ LDA #$7d
04:b4a1 : a0 04 __ LDY #$04
04:b4a3 : 91 23 __ STA (SP + 0),y 
04:b4a5 : a9 b2 __ LDA #$b2
04:b4a7 : c8 __ __ INY
04:b4a8 : 91 23 __ STA (SP + 0),y 
04:b4aa : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b4ad : a9 48 __ LDA #$48
04:b4af : 85 12 __ STA P5 
04:b4b1 : 20 04 1a JSR $1a04 ; (bnk_load@proxy + 0)
04:b4b4 : a9 7f __ LDA #$7f
04:b4b6 : 85 11 __ STA P4 
04:b4b8 : a9 00 __ LDA #$00
04:b4ba : 85 12 __ STA P5 
04:b4bc : 85 14 __ STA P7 
04:b4be : a9 48 __ LDA #$48
04:b4c0 : 85 13 __ STA P6 
04:b4c2 : 20 83 1a JSR $1a83 ; (bnk_redef_charset@proxy + 0)
.s39:
04:b4c5 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
04:b4c8 : c9 01 __ CMP #$01
04:b4ca : f0 03 __ BEQ $b4cf ; (loadproject.s40 + 0)
04:b4cc : 4c 14 b3 JMP $b314 ; (loadproject.s1001 + 0)
.s40:
04:b4cf : a9 51 __ LDA #$51
04:b4d1 : a0 02 __ LDY #$02
04:b4d3 : 91 23 __ STA (SP + 0),y 
04:b4d5 : a9 89 __ LDA #$89
04:b4d7 : c8 __ __ INY
04:b4d8 : 91 23 __ STA (SP + 0),y 
04:b4da : a9 97 __ LDA #$97
04:b4dc : a0 06 __ LDY #$06
04:b4de : 91 23 __ STA (SP + 0),y 
04:b4e0 : a9 87 __ LDA #$87
04:b4e2 : c8 __ __ INY
04:b4e3 : 91 23 __ STA (SP + 0),y 
04:b4e5 : a9 85 __ LDA #$85
04:b4e7 : a0 04 __ LDY #$04
04:b4e9 : 91 23 __ STA (SP + 0),y 
04:b4eb : a9 b2 __ LDA #$b2
04:b4ed : c8 __ __ INY
04:b4ee : 91 23 __ STA (SP + 0),y 
04:b4f0 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b4f3 : a9 50 __ LDA #$50
04:b4f5 : 85 12 __ STA P5 
04:b4f7 : 20 04 1a JSR $1a04 ; (bnk_load@proxy + 0)
04:b4fa : a9 7f __ LDA #$7f
04:b4fc : 85 11 __ STA P4 
04:b4fe : a9 00 __ LDA #$00
04:b500 : 85 12 __ STA P5 
04:b502 : 85 14 __ STA P7 
04:b504 : a9 01 __ LDA #$01
04:b506 : 85 15 __ STA P8 
04:b508 : 20 94 1a JSR $1a94 ; (bnk_redef_charset@proxy + 0)
04:b50b : 4c 14 b3 JMP $b314 ; (loadproject.s1001 + 0)
--------------------------------------------------------------------
loadcharset: ; loadcharset(u8)->void
.s1000:
04:b50e : a2 03 __ LDX #$03
04:b510 : b5 53 __ LDA T0 + 0,x 
04:b512 : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
04:b515 : ca __ __ DEX
04:b516 : 10 f8 __ BPL $b510 ; (loadcharset.s1000 + 2)
.s0:
04:b518 : a9 00 __ LDA #$00
04:b51a : 8d fc ab STA $abfc ; (sstack + 9)
04:b51d : 20 dd 64 JSR $64dd ; (filepicker.s1000 + 0)
04:b520 : a5 1b __ LDA ACCU + 0 
04:b522 : f0 46 __ BEQ $b56a ; (loadcharset.s1001 + 0)
.s3:
04:b524 : a9 01 __ LDA #$01
04:b526 : 85 10 __ STA P3 
04:b528 : ad fd ab LDA $abfd ; (sstack + 10)
04:b52b : 85 53 __ STA T0 + 0 
04:b52d : d0 04 __ BNE $b533 ; (loadcharset.s1003 + 0)
.s1002:
04:b52f : a9 01 __ LDA #$01
04:b531 : d0 02 __ BNE $b535 ; (loadcharset.s1004 + 0)
.s1003:
04:b533 : a9 00 __ LDA #$00
.s1004:
04:b535 : 85 54 __ STA T1 + 0 
04:b537 : c9 01 __ CMP #$01
04:b539 : a9 00 __ LDA #$00
04:b53b : 85 11 __ STA P4 
04:b53d : 69 ff __ ADC #$ff
04:b53f : 29 18 __ AND #$18
04:b541 : 49 48 __ EOR #$48
04:b543 : 85 56 __ STA T2 + 1 
04:b545 : 85 12 __ STA P5 
04:b547 : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
04:b54a : a5 1b __ LDA ACCU + 0 
04:b54c : f0 1c __ BEQ $b56a ; (loadcharset.s1001 + 0)
.s5:
04:b54e : a5 54 __ LDA T1 + 0 
04:b550 : f0 11 __ BEQ $b563 ; (loadcharset.s10 + 0)
.s8:
04:b552 : a9 7f __ LDA #$7f
04:b554 : 85 11 __ STA P4 
04:b556 : a9 00 __ LDA #$00
04:b558 : 85 12 __ STA P5 
04:b55a : 85 14 __ STA P7 
04:b55c : a5 56 __ LDA T2 + 1 
04:b55e : 85 13 __ STA P6 
04:b560 : 20 83 1a JSR $1a83 ; (bnk_redef_charset@proxy + 0)
.s10:
04:b563 : a9 01 __ LDA #$01
04:b565 : a6 53 __ LDX T0 + 0 
04:b567 : 9d 8a 87 STA $878a,x ; (charsetchanged + 0)
.s1001:
04:b56a : a2 03 __ LDX #$03
04:b56c : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
04:b56f : 95 53 __ STA T0 + 0,x 
04:b571 : ca __ __ DEX
04:b572 : 10 f8 __ BPL $b56c ; (loadcharset.s1001 + 2)
04:b574 : 60 __ __ RTS
--------------------------------------------------------------------
savecharset: ; savecharset(u8)->void
.s1000:
04:b575 : a2 04 __ LDX #$04
04:b577 : b5 53 __ LDA T0 + 0,x 
04:b579 : 9d bf ab STA $abbf,x ; (projbuffer + 39)
04:b57c : ca __ __ DEX
04:b57d : 10 f8 __ BPL $b577 ; (savecharset.s1000 + 2)
04:b57f : 38 __ __ SEC
04:b580 : a5 23 __ LDA SP + 0 
04:b582 : e9 08 __ SBC #$08
04:b584 : 85 23 __ STA SP + 0 
04:b586 : b0 02 __ BCS $b58a ; (savecharset.s0 + 0)
04:b588 : c6 24 __ DEC SP + 1 
.s0:
04:b58a : a9 0f __ LDA #$0f
04:b58c : 8d fa ab STA $abfa ; (sstack + 7)
04:b58f : a9 49 __ LDA #$49
04:b591 : 8d f8 ab STA $abf8 ; (sstack + 5)
04:b594 : a9 b6 __ LDA #$b6
04:b596 : 8d f9 ab STA $abf9 ; (sstack + 6)
04:b599 : 20 ac 4b JSR $4bac ; (chooseidandfilename.s0 + 0)
04:b59c : a5 1b __ LDA ACCU + 0 
04:b59e : 85 53 __ STA T0 + 0 
04:b5a0 : a5 1c __ LDA ACCU + 1 
04:b5a2 : 85 54 __ STA T0 + 1 
04:b5a4 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
04:b5a7 : a5 54 __ LDA T0 + 1 
04:b5a9 : c9 ff __ CMP #$ff
04:b5ab : d0 09 __ BNE $b5b6 ; (savecharset.s3 + 0)
.s1004:
04:b5ad : a5 53 __ LDA T0 + 0 
04:b5af : c9 ff __ CMP #$ff
04:b5b1 : d0 03 __ BNE $b5b6 ; (savecharset.s3 + 0)
04:b5b3 : 4c 33 b6 JMP $b633 ; (savecharset.s1001 + 0)
.s3:
04:b5b6 : a9 97 __ LDA #$97
04:b5b8 : 8d fc ab STA $abfc ; (sstack + 9)
04:b5bb : a9 87 __ LDA #$87
04:b5bd : 8d fd ab STA $abfd ; (sstack + 10)
04:b5c0 : ad ac 87 LDA $87ac ; (targetdevice + 0)
04:b5c3 : 85 55 __ STA T1 + 0 
04:b5c5 : 8d fe ab STA $abfe ; (sstack + 11)
04:b5c8 : 20 48 62 JSR $6248 ; (checkiffileexists.s1000 + 0)
04:b5cb : a5 1b __ LDA ACCU + 0 
04:b5cd : f0 64 __ BEQ $b633 ; (savecharset.s1001 + 0)
.s5:
04:b5cf : ad ff ab LDA $abff ; (sstack + 12)
04:b5d2 : f0 04 __ BEQ $b5d8 ; (savecharset.s1006 + 0)
.s1007:
04:b5d4 : a9 50 __ LDA #$50
04:b5d6 : d0 02 __ BNE $b5da ; (savecharset.s1008 + 0)
.s1006:
04:b5d8 : a9 48 __ LDA #$48
.s1008:
04:b5da : 85 57 __ STA T4 + 1 
04:b5dc : a5 1b __ LDA ACCU + 0 
04:b5de : c9 02 __ CMP #$02
04:b5e0 : d0 26 __ BNE $b608 ; (savecharset.s10 + 0)
.s8:
04:b5e2 : a9 97 __ LDA #$97
04:b5e4 : a0 06 __ LDY #$06
04:b5e6 : 91 23 __ STA (SP + 0),y 
04:b5e8 : a9 87 __ LDA #$87
04:b5ea : c8 __ __ INY
04:b5eb : 91 23 __ STA (SP + 0),y 
04:b5ed : a9 51 __ LDA #$51
04:b5ef : a0 02 __ LDY #$02
04:b5f1 : 91 23 __ STA (SP + 0),y 
04:b5f3 : a9 89 __ LDA #$89
04:b5f5 : c8 __ __ INY
04:b5f6 : 91 23 __ STA (SP + 0),y 
04:b5f8 : a9 e6 __ LDA #$e6
04:b5fa : c8 __ __ INY
04:b5fb : 91 23 __ STA (SP + 0),y 
04:b5fd : a9 ac __ LDA #$ac
04:b5ff : c8 __ __ INY
04:b600 : 91 23 __ STA (SP + 0),y 
04:b602 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
04:b605 : 20 ce 62 JSR $62ce ; (cmd@proxy + 0)
.s10:
04:b608 : a5 55 __ LDA T1 + 0 
04:b60a : 85 12 __ STA P5 
04:b60c : a9 01 __ LDA #$01
04:b60e : 85 13 __ STA P6 
04:b610 : a9 00 __ LDA #$00
04:b612 : 85 14 __ STA P7 
04:b614 : 85 16 __ STA P9 
04:b616 : a5 57 __ LDA T4 + 1 
04:b618 : 85 15 __ STA P8 
04:b61a : 18 __ __ CLC
04:b61b : 69 08 __ ADC #$08
04:b61d : 85 17 __ STA P10 
04:b61f : a9 97 __ LDA #$97
04:b621 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b624 : a9 87 __ LDA #$87
04:b626 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b629 : 20 5c 15 JSR $155c ; (bnk_save.s0 + 0)
04:b62c : a5 1b __ LDA ACCU + 0 
04:b62e : d0 03 __ BNE $b633 ; (savecharset.s1001 + 0)
.s11:
04:b630 : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s1001:
04:b633 : 18 __ __ CLC
04:b634 : a5 23 __ LDA SP + 0 
04:b636 : 69 08 __ ADC #$08
04:b638 : 85 23 __ STA SP + 0 
04:b63a : 90 02 __ BCC $b63e ; (savecharset.s1001 + 11)
04:b63c : e6 24 __ INC SP + 1 
04:b63e : a2 04 __ LDX #$04
04:b640 : bd bf ab LDA $abbf,x ; (projbuffer + 39)
04:b643 : 95 53 __ STA T0 + 0,x 
04:b645 : ca __ __ DEX
04:b646 : 10 f8 __ BPL $b640 ; (savecharset.s1001 + 13)
04:b648 : 60 __ __ RTS
--------------------------------------------------------------------
04:b649 : __ __ __ BYT 73 41 56 45 20 43 48 41 52 53 45 54 00          : sAVE CHARSET.
--------------------------------------------------------------------
chareditor: ; chareditor()->void
.s1000:
05:ac00 : a2 12 __ LDX #$12
05:ac02 : b5 53 __ LDA T0 + 0,x 
05:ac04 : 9d 90 ab STA $ab90,x ; (tempfilename + 13)
05:ac07 : ca __ __ DEX
05:ac08 : 10 f8 __ BPL $ac02 ; (chareditor.s1000 + 2)
05:ac0a : 38 __ __ SEC
05:ac0b : a5 23 __ LDA SP + 0 
05:ac0d : e9 08 __ SBC #$08
05:ac0f : 85 23 __ STA SP + 0 
05:ac11 : b0 02 __ BCS $ac15 ; (chareditor.s0 + 0)
05:ac13 : c6 24 __ DEC SP + 1 
.s0:
05:ac15 : a9 00 __ LDA #$00
05:ac17 : 85 0f __ STA P2 
05:ac19 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
05:ac1c : 85 0e __ STA P1 
05:ac1e : 85 53 __ STA T0 + 0 
05:ac20 : 85 54 __ STA T1 + 0 
05:ac22 : ad 91 87 LDA $8791 ; (plotscreencode + 0)
05:ac25 : 85 55 __ STA T2 + 0 
05:ac27 : 85 0d __ STA P0 
05:ac29 : 20 ea b6 JSR $b6ea ; (charaddress.s0 + 0)
05:ac2c : a5 1b __ LDA ACCU + 0 
05:ac2e : 85 56 __ STA T3 + 0 
05:ac30 : a5 1c __ LDA ACCU + 1 
05:ac32 : 85 57 __ STA T3 + 1 
05:ac34 : a5 55 __ LDA T2 + 0 
05:ac36 : 85 58 __ STA T4 + 0 
05:ac38 : a9 01 __ LDA #$01
05:ac3a : a6 0e __ LDX P1 
05:ac3c : 9d 8a 87 STA $878a,x ; (charsetchanged + 0)
05:ac3f : a0 ff __ LDY #$ff
.l1002:
05:ac41 : c8 __ __ INY
05:ac42 : b9 40 b7 LDA $b740,y 
05:ac45 : 99 f4 87 STA $87f4,y ; (programmode + 0)
05:ac48 : d0 f7 __ BNE $ac41 ; (chareditor.l1002 + 0)
.s1003:
05:ac4a : a9 00 __ LDA #$00
05:ac4c : 85 5c __ STA T7 + 0 
05:ac4e : 85 5d __ STA T8 + 0 
05:ac50 : 85 5e __ STA T9 + 0 
05:ac52 : 85 5f __ STA T10 + 0 
05:ac54 : 8a __ __ TXA
05:ac55 : d0 0a __ BNE $ac61 ; (chareditor.s3 + 0)
.s4:
05:ac57 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
05:ac5a : c9 01 __ CMP #$01
05:ac5c : d0 03 __ BNE $ac61 ; (chareditor.s3 + 0)
05:ac5e : 4c bc b6 JMP $b6bc ; (chareditor.s1 + 0)
.s3:
05:ac61 : a5 53 __ LDA T0 + 0 
05:ac63 : c9 01 __ CMP #$01
05:ac65 : d0 22 __ BNE $ac89 ; (chareditor.s10 + 0)
.s8:
05:ac67 : ad 8a 87 LDA $878a ; (charsetchanged + 0)
05:ac6a : c9 01 __ CMP #$01
05:ac6c : d0 1b __ BNE $ac89 ; (chareditor.s10 + 0)
.s5:
05:ac6e : a9 7f __ LDA #$7f
05:ac70 : 85 11 __ STA P4 
05:ac72 : a9 01 __ LDA #$01
05:ac74 : 85 15 __ STA P8 
05:ac76 : ad bd 87 LDA $87bd ; (vdc_state + 16)
05:ac79 : 85 0f __ STA P2 
05:ac7b : ad be 87 LDA $87be ; (vdc_state + 17)
05:ac7e : 85 10 __ STA P3 
05:ac80 : a9 00 __ LDA #$00
05:ac82 : 85 14 __ STA P7 
05:ac84 : 85 12 __ STA P5 
05:ac86 : 20 b7 1a JSR $1ab7 ; (bnk_redef_charset@proxy + 0)
.s10:
05:ac89 : a0 00 __ LDY #$00
.l1253:
05:ac8b : a9 12 __ LDA #$12
05:ac8d : 8d 00 d6 STA $d600 
05:ac90 : 98 __ __ TYA
05:ac91 : 18 __ __ CLC
05:ac92 : 65 56 __ ADC T3 + 0 
05:ac94 : aa __ __ TAX
05:ac95 : a9 00 __ LDA #$00
05:ac97 : 65 57 __ ADC T3 + 1 
.l2126:
05:ac99 : 2c 00 d6 BIT $d600 
05:ac9c : 10 fb __ BPL $ac99 ; (chareditor.l2126 + 0)
.s19:
05:ac9e : 8d 01 d6 STA $d601 
05:aca1 : a9 13 __ LDA #$13
05:aca3 : 8d 00 d6 STA $d600 
.l2128:
05:aca6 : 2c 00 d6 BIT $d600 
05:aca9 : 10 fb __ BPL $aca6 ; (chareditor.l2128 + 0)
.s24:
05:acab : 8e 01 d6 STX $d601 
05:acae : a9 1f __ LDA #$1f
05:acb0 : 8d 00 d6 STA $d600 
.l2130:
05:acb3 : 2c 00 d6 BIT $d600 
05:acb6 : 10 fb __ BPL $acb3 ; (chareditor.l2130 + 0)
.s28:
05:acb8 : ad 01 d6 LDA $d601 
05:acbb : 99 c4 ab STA $abc4,y ; (projbuffer + 44)
05:acbe : 99 b4 ab STA $abb4,y ; (projbuffer + 28)
05:acc1 : c8 __ __ INY
05:acc2 : c0 08 __ CPY #$08
05:acc4 : 90 c5 __ BCC $ac8b ; (chareditor.l1253 + 0)
.s12:
05:acc6 : 20 1b 4b JSR $4b1b ; (hidecursor.s0 + 0)
05:acc9 : a5 53 __ LDA T0 + 0 
05:accb : 8d f6 ab STA $abf6 ; (sstack + 3)
05:acce : 20 49 b7 JSR $b749 ; (showchareditfield.s0 + 0)
05:acd1 : a5 53 __ LDA T0 + 0 
05:acd3 : 8d fa ab STA $abfa ; (sstack + 7)
05:acd6 : a5 55 __ LDA T2 + 0 
05:acd8 : 8d f8 ab STA $abf8 ; (sstack + 5)
05:acdb : a9 00 __ LDA #$00
05:acdd : 8d f9 ab STA $abf9 ; (sstack + 6)
05:ace0 : 20 71 b7 JSR $b771 ; (showchareditgrid.s1000 + 0)
.l31:
05:ace3 : 18 __ __ CLC
05:ace4 : a5 5c __ LDA T7 + 0 
05:ace6 : 69 47 __ ADC #$47
05:ace8 : 85 5b __ STA T6 + 0 
05:acea : 85 0d __ STA P0 
05:acec : 18 __ __ CLC
05:aced : a5 5d __ LDA T8 + 0 
05:acef : 69 03 __ ADC #$03
05:acf1 : 85 62 __ STA T14 + 0 
05:acf3 : 85 0e __ STA P1 
05:acf5 : 38 __ __ SEC
05:acf6 : a9 07 __ LDA #$07
05:acf8 : e5 5c __ SBC T7 + 0 
05:acfa : aa __ __ TAX
05:acfb : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:acfe : 85 59 __ STA T5 + 0 
05:ad00 : a6 5d __ LDX T8 + 0 
05:ad02 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:ad05 : 85 63 __ STA T16 + 0 
05:ad07 : 25 59 __ AND T5 + 0 
05:ad09 : f0 08 __ BEQ $ad13 ; (chareditor.s1016 + 0)
.s1015:
05:ad0b : a9 00 __ LDA #$00
05:ad0d : 85 64 __ STA T17 + 0 
05:ad0f : a9 2a __ LDA #$2a
05:ad11 : d0 06 __ BNE $ad19 ; (chareditor.s1251 + 0)
.s1016:
05:ad13 : a9 80 __ LDA #$80
05:ad15 : 85 64 __ STA T17 + 0 
05:ad17 : a9 aa __ LDA #$aa
.s1251:
05:ad19 : 85 0f __ STA P2 
05:ad1b : ad b4 87 LDA $87b4 ; (vdc_state + 7)
05:ad1e : 49 10 __ EOR #$10
05:ad20 : 85 10 __ STA P3 
05:ad22 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
05:ad25 : ad ff 87 LDA $87ff ; (showbar + 0)
05:ad28 : f0 03 __ BEQ $ad2d ; (chareditor.s35 + 0)
.s33:
05:ad2a : 20 90 3f JSR $3f90 ; (printstatusbar.s1000 + 0)
.s35:
05:ad2d : 20 0f 3a JSR $3a0f ; (vdcwin_getch.s0 + 0)
05:ad30 : a5 1b __ LDA ACCU + 0 
05:ad32 : 85 65 __ STA T18 + 0 
05:ad34 : a5 5b __ LDA T6 + 0 
05:ad36 : 85 0d __ STA P0 
05:ad38 : a5 62 __ LDA T14 + 0 
05:ad3a : 85 0e __ STA P1 
05:ad3c : a5 64 __ LDA T17 + 0 
05:ad3e : 09 20 __ ORA #$20
05:ad40 : 85 0f __ STA P2 
05:ad42 : 20 ff 6d JSR $6dff ; (vdc_printc@proxy + 0)
05:ad45 : a5 65 __ LDA T18 + 0 
05:ad47 : c9 4f __ CMP #$4f
05:ad49 : d0 05 __ BNE $ad50 ; (chareditor.s421 + 0)
.s249:
05:ad4b : a2 00 __ LDX #$00
05:ad4d : 4c 1a b6 JMP $b61a ; (chareditor.l251 + 0)
.s421:
05:ad50 : b0 03 __ BCS $ad55 ; (chareditor.s422 + 0)
05:ad52 : 4c 1f b3 JMP $b31f ; (chareditor.s423 + 0)
.s422:
05:ad55 : c9 59 __ CMP #$59
05:ad57 : d0 07 __ BNE $ad60 ; (chareditor.s444 + 0)
.s185:
05:ad59 : a9 00 __ LDA #$00
05:ad5b : 85 53 __ STA T0 + 0 
05:ad5d : 4c 84 b2 JMP $b284 ; (chareditor.l187 + 0)
.s444:
05:ad60 : b0 03 __ BCS $ad65 ; (chareditor.s445 + 0)
05:ad62 : 4c df af JMP $afdf ; (chareditor.s446 + 0)
.s445:
05:ad65 : c9 8c __ CMP #$8c
05:ad67 : d0 03 __ BNE $ad6c ; (chareditor.s454 + 0)
05:ad69 : 4c a4 af JMP $afa4 ; (chareditor.s405 + 0)
.s454:
05:ad6c : b0 03 __ BCS $ad71 ; (chareditor.s455 + 0)
05:ad6e : 4c 16 af JMP $af16 ; (chareditor.s456 + 0)
.s455:
05:ad71 : c9 91 __ CMP #$91
05:ad73 : d0 03 __ BNE $ad78 ; (chareditor.s459 + 0)
05:ad75 : 4c 0a af JMP $af0a ; (chareditor.s49 + 0)
.s459:
05:ad78 : c9 9d __ CMP #$9d
05:ad7a : d0 03 __ BNE $ad7f ; (chareditor.s411 + 0)
05:ad7c : 4c fe ae JMP $aefe ; (chareditor.s41 + 0)
.s411:
05:ad7f : c9 30 __ CMP #$30
05:ad81 : 90 19 __ BCC $ad9c ; (chareditor.s414 + 0)
.s415:
05:ad83 : c9 3a __ CMP #$3a
05:ad85 : b0 15 __ BCS $ad9c ; (chareditor.s414 + 0)
.s412:
05:ad87 : 0a __ __ ASL
05:ad88 : aa __ __ TAX
05:ad89 : a9 01 __ LDA #$01
05:ad8b : 85 5e __ STA T9 + 0 
05:ad8d : 85 5f __ STA T10 + 0 
05:ad8f : bd 59 88 LDA $8859,x ; (multab + 89)
05:ad92 : 85 54 __ STA T1 + 0 
05:ad94 : bd 58 88 LDA $8858,x ; (multab + 88)
05:ad97 : 85 58 __ STA T4 + 0 
05:ad99 : 4c a0 ad JMP $ada0 ; (chareditor.s419 + 0)
.s414:
05:ad9c : c9 21 __ CMP #$21
05:ad9e : 90 12 __ BCC $adb2 ; (chareditor.s36 + 0)
.s419:
05:ada0 : a5 65 __ LDA T18 + 0 
05:ada2 : c9 2b __ CMP #$2b
05:ada4 : b0 0c __ BCS $adb2 ; (chareditor.s36 + 0)
.s416:
05:ada6 : 0a __ __ ASL
05:ada7 : aa __ __ TAX
05:ada8 : a5 58 __ LDA T4 + 0 
05:adaa : 9d 76 88 STA $8876,x ; (multab + 118)
05:adad : a5 54 __ LDA T1 + 0 
05:adaf : 9d 77 88 STA $8877,x ; (multab + 119)
.s36:
05:adb2 : a5 5e __ LDA T9 + 0 
05:adb4 : f0 1e __ BEQ $add4 ; (chareditor.s464 + 0)
.s465:
05:adb6 : a5 58 __ LDA T4 + 0 
05:adb8 : 85 0d __ STA P0 
05:adba : a5 54 __ LDA T1 + 0 
05:adbc : 85 0e __ STA P1 
05:adbe : a9 00 __ LDA #$00
05:adc0 : 85 0f __ STA P2 
05:adc2 : 20 ea b6 JSR $b6ea ; (charaddress.s0 + 0)
05:adc5 : a5 1b __ LDA ACCU + 0 
05:adc7 : 85 56 __ STA T3 + 0 
05:adc9 : a5 1c __ LDA ACCU + 1 
05:adcb : 85 57 __ STA T3 + 1 
05:adcd : a0 00 __ LDY #$00
05:adcf : 84 5e __ STY T9 + 0 
05:add1 : 4c b9 ae JMP $aeb9 ; (chareditor.l1255 + 0)
.s464:
05:add4 : a5 5f __ LDA T10 + 0 
05:add6 : f0 64 __ BEQ $ae3c ; (chareditor.s463 + 0)
.s490:
05:add8 : a9 7f __ LDA #$7f
05:adda : 85 11 __ STA P4 
05:addc : a9 00 __ LDA #$00
05:adde : 85 14 __ STA P7 
05:ade0 : 85 12 __ STA P5 
05:ade2 : a9 01 __ LDA #$01
05:ade4 : 85 15 __ STA P8 
05:ade6 : a5 54 __ LDA T1 + 0 
05:ade8 : f0 0c __ BEQ $adf6 ; (chareditor.s493 + 0)
.s494:
05:adea : 20 94 1a JSR $1a94 ; (bnk_redef_charset@proxy + 0)
05:aded : ad be 87 LDA $87be ; (vdc_state + 17)
05:adf0 : ae bd 87 LDX $87bd ; (vdc_state + 16)
05:adf3 : 4c 09 ae JMP $ae09 ; (chareditor.s495 + 0)
.s493:
05:adf6 : ad bd 87 LDA $87bd ; (vdc_state + 16)
05:adf9 : 85 0f __ STA P2 
05:adfb : ad be 87 LDA $87be ; (vdc_state + 17)
05:adfe : 85 10 __ STA P3 
05:ae00 : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
05:ae03 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
05:ae06 : ae bf 87 LDX $87bf ; (vdc_state + 18)
.s495:
05:ae09 : 86 0f __ STX P2 
05:ae0b : 85 10 __ STA P3 
05:ae0d : a9 00 __ LDA #$00
05:ae0f : 85 5f __ STA T10 + 0 
05:ae11 : 85 14 __ STA P7 
05:ae13 : 85 12 __ STA P5 
05:ae15 : 20 a5 1a JSR $1aa5 ; (bnk_redef_charset@proxy + 0)
05:ae18 : a9 01 __ LDA #$01
05:ae1a : a6 54 __ LDX T1 + 0 
05:ae1c : 9d 8a 87 STA $878a,x ; (charsetchanged + 0)
05:ae1f : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
05:ae22 : a5 54 __ LDA T1 + 0 
05:ae24 : 8d f6 ab STA $abf6 ; (sstack + 3)
05:ae27 : 20 49 b7 JSR $b749 ; (showchareditfield.s0 + 0)
.s492:
05:ae2a : a5 54 __ LDA T1 + 0 
05:ae2c : 8d fa ab STA $abfa ; (sstack + 7)
05:ae2f : a5 58 __ LDA T4 + 0 
05:ae31 : 8d f8 ab STA $abf8 ; (sstack + 5)
05:ae34 : a9 00 __ LDA #$00
05:ae36 : 8d f9 ab STA $abf9 ; (sstack + 6)
05:ae39 : 20 71 b7 JSR $b771 ; (showchareditgrid.s1000 + 0)
.s463:
05:ae3c : a5 65 __ LDA T18 + 0 
05:ae3e : c9 1b __ CMP #$1b
05:ae40 : f0 07 __ BEQ $ae49 ; (chareditor.s32 + 0)
.s496:
05:ae42 : c9 03 __ CMP #$03
05:ae44 : f0 03 __ BEQ $ae49 ; (chareditor.s32 + 0)
05:ae46 : 4c e3 ac JMP $ace3 ; (chareditor.l31 + 0)
.s32:
05:ae49 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
05:ae4c : a9 7f __ LDA #$7f
05:ae4e : 85 11 __ STA P4 
05:ae50 : a9 00 __ LDA #$00
05:ae52 : 85 14 __ STA P7 
05:ae54 : a9 01 __ LDA #$01
05:ae56 : 85 15 __ STA P8 
05:ae58 : a5 54 __ LDA T1 + 0 
05:ae5a : d0 0e __ BNE $ae6a ; (chareditor.s498 + 0)
.s497:
05:ae5c : ad bf 87 LDA $87bf ; (vdc_state + 18)
05:ae5f : 85 0f __ STA P2 
05:ae61 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
05:ae64 : 85 10 __ STA P3 
05:ae66 : a9 50 __ LDA #$50
05:ae68 : d0 0c __ BNE $ae76 ; (chareditor.s499 + 0)
.s498:
05:ae6a : ad bd 87 LDA $87bd ; (vdc_state + 16)
05:ae6d : 85 0f __ STA P2 
05:ae6f : ad be 87 LDA $87be ; (vdc_state + 17)
05:ae72 : 85 10 __ STA P3 
05:ae74 : a9 48 __ LDA #$48
.s499:
05:ae76 : 85 13 __ STA P6 
05:ae78 : a9 00 __ LDA #$00
05:ae7a : 85 12 __ STA P5 
05:ae7c : 20 04 13 JSR $1304 ; (bnk_redef_charset.s0 + 0)
05:ae7f : a5 58 __ LDA T4 + 0 
05:ae81 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
05:ae84 : a5 54 __ LDA T1 + 0 
05:ae86 : 8d 96 87 STA $8796 ; (plotaltchar + 0)
05:ae89 : ad 8c 87 LDA $878c ; (screen_col + 0)
05:ae8c : 8d d5 87 STA $87d5 ; (canvas + 15)
05:ae8f : ad 8e 87 LDA $878e ; (screen_row + 0)
05:ae92 : 8d d6 87 STA $87d6 ; (canvas + 16)
05:ae95 : 20 06 3e JSR $3e06 ; (plotcursor.s0 + 0)
05:ae98 : a2 ff __ LDX #$ff
.l1004:
05:ae9a : e8 __ __ INX
05:ae9b : bd e4 b8 LDA $b8e4,x 
05:ae9e : 9d f4 87 STA $87f4,x ; (programmode + 0)
05:aea1 : d0 f7 __ BNE $ae9a ; (chareditor.l1004 + 0)
.s1001:
05:aea3 : 18 __ __ CLC
05:aea4 : a5 23 __ LDA SP + 0 
05:aea6 : 69 08 __ ADC #$08
05:aea8 : 85 23 __ STA SP + 0 
05:aeaa : 90 02 __ BCC $aeae ; (chareditor.s1001 + 11)
05:aeac : e6 24 __ INC SP + 1 
05:aeae : a2 12 __ LDX #$12
05:aeb0 : bd 90 ab LDA $ab90,x ; (tempfilename + 13)
05:aeb3 : 95 53 __ STA T0 + 0,x 
05:aeb5 : ca __ __ DEX
05:aeb6 : 10 f8 __ BPL $aeb0 ; (chareditor.s1001 + 13)
05:aeb8 : 60 __ __ RTS
.l1255:
05:aeb9 : a9 12 __ LDA #$12
05:aebb : 8d 00 d6 STA $d600 
05:aebe : 98 __ __ TYA
05:aebf : 18 __ __ CLC
05:aec0 : 65 56 __ ADC T3 + 0 
05:aec2 : aa __ __ TAX
05:aec3 : a9 00 __ LDA #$00
05:aec5 : 65 57 __ ADC T3 + 1 
.l2147:
05:aec7 : 2c 00 d6 BIT $d600 
05:aeca : 10 fb __ BPL $aec7 ; (chareditor.l2147 + 0)
.s478:
05:aecc : 8d 01 d6 STA $d601 
05:aecf : a9 13 __ LDA #$13
05:aed1 : 8d 00 d6 STA $d600 
.l2149:
05:aed4 : 2c 00 d6 BIT $d600 
05:aed7 : 10 fb __ BPL $aed4 ; (chareditor.l2149 + 0)
.s483:
05:aed9 : 8e 01 d6 STX $d601 
05:aedc : a9 1f __ LDA #$1f
05:aede : 8d 00 d6 STA $d600 
.l2151:
05:aee1 : 2c 00 d6 BIT $d600 
05:aee4 : 10 fb __ BPL $aee1 ; (chareditor.l2151 + 0)
.s487:
05:aee6 : ad 01 d6 LDA $d601 
05:aee9 : 99 c4 ab STA $abc4,y ; (projbuffer + 44)
05:aeec : 99 b4 ab STA $abb4,y ; (projbuffer + 28)
05:aeef : c8 __ __ INY
05:aef0 : c0 08 __ CPY #$08
05:aef2 : 90 c5 __ BCC $aeb9 ; (chareditor.l1255 + 0)
.s467:
05:aef4 : a5 5f __ LDA T10 + 0 
05:aef6 : d0 03 __ BNE $aefb ; (chareditor.s467 + 7)
05:aef8 : 4c 2a ae JMP $ae2a ; (chareditor.s492 + 0)
05:aefb : 4c d8 ad JMP $add8 ; (chareditor.s490 + 0)
.s41:
05:aefe : a5 5c __ LDA T7 + 0 
05:af00 : d0 03 __ BNE $af05 ; (chareditor.s42 + 0)
05:af02 : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s42:
05:af05 : c6 5c __ DEC T7 + 0 
05:af07 : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s49:
05:af0a : a5 5d __ LDA T8 + 0 
05:af0c : d0 03 __ BNE $af11 ; (chareditor.s50 + 0)
05:af0e : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s50:
05:af11 : c6 5d __ DEC T8 + 0 
05:af13 : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s456:
05:af16 : c9 5a __ CMP #$5a
05:af18 : f0 2a __ BEQ $af44 ; (chareditor.s116 + 0)
.s457:
05:af1a : c9 8b __ CMP #$8b
05:af1c : f0 03 __ BEQ $af21 ; (chareditor.s404 + 0)
05:af1e : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s404:
05:af21 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
05:af24 : 20 4f 50 JSR $504f ; (togglestatusbar.s0 + 0)
.s2281:
05:af27 : a5 54 __ LDA T1 + 0 
05:af29 : 8d f6 ab STA $abf6 ; (sstack + 3)
05:af2c : 20 49 b7 JSR $b749 ; (showchareditfield.s0 + 0)
.s2280:
05:af2f : a5 58 __ LDA T4 + 0 
.s2278:
05:af31 : 8d f8 ab STA $abf8 ; (sstack + 5)
05:af34 : a9 00 __ LDA #$00
05:af36 : 8d f9 ab STA $abf9 ; (sstack + 6)
05:af39 : a5 54 __ LDA T1 + 0 
05:af3b : 8d fa ab STA $abfa ; (sstack + 7)
05:af3e : 20 71 b7 JSR $b771 ; (showchareditgrid.s1000 + 0)
05:af41 : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s116:
05:af44 : a2 00 __ LDX #$00
.l118:
05:af46 : 86 53 __ STX T0 + 0 
05:af48 : bd b4 ab LDA $abb4,x ; (projbuffer + 28)
05:af4b : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:af4e : a8 __ __ TAY
05:af4f : a9 12 __ LDA #$12
05:af51 : 8d 00 d6 STA $d600 
05:af54 : 18 __ __ CLC
05:af55 : a5 56 __ LDA T3 + 0 
05:af57 : 65 53 __ ADC T0 + 0 
05:af59 : aa __ __ TAX
05:af5a : a5 57 __ LDA T3 + 1 
05:af5c : 69 00 __ ADC #$00
.l2269:
05:af5e : 2c 00 d6 BIT $d600 
05:af61 : 10 fb __ BPL $af5e ; (chareditor.l2269 + 0)
.s127:
05:af63 : 8d 01 d6 STA $d601 
05:af66 : a9 13 __ LDA #$13
05:af68 : 8d 00 d6 STA $d600 
.l2271:
05:af6b : 2c 00 d6 BIT $d600 
05:af6e : 10 fb __ BPL $af6b ; (chareditor.l2271 + 0)
.s132:
05:af70 : 8e 01 d6 STX $d601 
05:af73 : a9 1f __ LDA #$1f
05:af75 : 8d 00 d6 STA $d600 
.l2273:
05:af78 : 2c 00 d6 BIT $d600 
05:af7b : 10 fb __ BPL $af78 ; (chareditor.l2273 + 0)
.s136:
05:af7d : 8c 01 d6 STY $d601 
05:af80 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:af83 : a6 53 __ LDX T0 + 0 
05:af85 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:af88 : 85 0f __ STA P2 
05:af8a : 18 __ __ CLC
05:af8b : a5 1b __ LDA ACCU + 0 
05:af8d : 65 53 __ ADC T0 + 0 
05:af8f : 85 0d __ STA P0 
05:af91 : a5 1c __ LDA ACCU + 1 
05:af93 : 69 00 __ ADC #$00
05:af95 : 85 0e __ STA P1 
05:af97 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:af9a : a6 53 __ LDX T0 + 0 
05:af9c : e8 __ __ INX
05:af9d : e0 08 __ CPX #$08
05:af9f : 90 a5 __ BCC $af46 ; (chareditor.l118 + 0)
05:afa1 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s405:
05:afa4 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
05:afa7 : a9 02 __ LDA #$02
05:afa9 : 8d f8 ab STA $abf8 ; (sstack + 5)
05:afac : 20 73 50 JSR $5073 ; (helpscreen_load.s1000 + 0)
05:afaf : ad 96 87 LDA $8796 ; (plotaltchar + 0)
05:afb2 : f0 03 __ BEQ $afb7 ; (chareditor.s409 + 0)
05:afb4 : 4c 27 af JMP $af27 ; (chareditor.s2281 + 0)
.s409:
05:afb7 : ad 8b 87 LDA $878b ; (charsetchanged + 1)
05:afba : c9 01 __ CMP #$01
05:afbc : f0 03 __ BEQ $afc1 ; (chareditor.s406 + 0)
05:afbe : 4c 27 af JMP $af27 ; (chareditor.s2281 + 0)
.s406:
05:afc1 : a9 7f __ LDA #$7f
05:afc3 : 85 11 __ STA P4 
05:afc5 : a9 01 __ LDA #$01
05:afc7 : 85 15 __ STA P8 
05:afc9 : ad bf 87 LDA $87bf ; (vdc_state + 18)
05:afcc : 85 0f __ STA P2 
05:afce : ad c0 87 LDA $87c0 ; (vdc_state + 19)
05:afd1 : 85 10 __ STA P3 
05:afd3 : a9 00 __ LDA #$00
05:afd5 : 85 14 __ STA P7 
05:afd7 : 85 12 __ STA P5 
05:afd9 : 20 b0 1a JSR $1ab0 ; (bnk_redef_charset@proxy + 0)
05:afdc : 4c 27 af JMP $af27 ; (chareditor.s2281 + 0)
.s446:
05:afdf : c9 55 __ CMP #$55
05:afe1 : d0 03 __ BNE $afe6 ; (chareditor.s447 + 0)
05:afe3 : 4c 03 b2 JMP $b203 ; (chareditor.s281 + 0)
.s447:
05:afe6 : b0 03 __ BCS $afeb ; (chareditor.s448 + 0)
05:afe8 : 4c e8 b0 JMP $b0e8 ; (chareditor.s449 + 0)
.s448:
05:afeb : c9 56 __ CMP #$56
05:afed : d0 03 __ BNE $aff2 ; (chareditor.s452 + 0)
05:afef : 4c 88 b0 JMP $b088 ; (chareditor.s163 + 0)
.s452:
05:aff2 : c9 58 __ CMP #$58
05:aff4 : f0 03 __ BEQ $aff9 ; (chareditor.s228 + 0)
05:aff6 : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s228:
05:aff9 : a2 00 __ LDX #$00
.l230:
05:affb : 86 53 __ STX T0 + 0 
05:affd : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b000 : 29 f0 __ AND #$f0
05:b002 : 4a __ __ LSR
05:b003 : 4a __ __ LSR
05:b004 : 4a __ __ LSR
05:b005 : 4a __ __ LSR
05:b006 : 85 62 __ STA T14 + 0 
05:b008 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b00b : 29 0f __ AND #$0f
05:b00d : 0a __ __ ASL
05:b00e : 0a __ __ ASL
05:b00f : 0a __ __ ASL
05:b010 : 0a __ __ ASL
05:b011 : 05 62 __ ORA T14 + 0 
05:b013 : a8 __ __ TAY
05:b014 : 29 cc __ AND #$cc
05:b016 : 4a __ __ LSR
05:b017 : 4a __ __ LSR
05:b018 : 85 62 __ STA T14 + 0 
05:b01a : 98 __ __ TYA
05:b01b : 29 33 __ AND #$33
05:b01d : 0a __ __ ASL
05:b01e : 0a __ __ ASL
05:b01f : 05 62 __ ORA T14 + 0 
05:b021 : a8 __ __ TAY
05:b022 : 29 aa __ AND #$aa
05:b024 : 4a __ __ LSR
05:b025 : 85 62 __ STA T14 + 0 
05:b027 : 98 __ __ TYA
05:b028 : 29 55 __ AND #$55
05:b02a : 0a __ __ ASL
05:b02b : 05 62 __ ORA T14 + 0 
05:b02d : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b030 : a8 __ __ TAY
05:b031 : a9 12 __ LDA #$12
05:b033 : 8d 00 d6 STA $d600 
05:b036 : a5 56 __ LDA T3 + 0 
05:b038 : 65 53 __ ADC T0 + 0 
05:b03a : aa __ __ TAX
05:b03b : a5 57 __ LDA T3 + 1 
05:b03d : 69 00 __ ADC #$00
.l2258:
05:b03f : 2c 00 d6 BIT $d600 
05:b042 : 10 fb __ BPL $b03f ; (chareditor.l2258 + 0)
.s239:
05:b044 : 8d 01 d6 STA $d601 
05:b047 : a9 13 __ LDA #$13
05:b049 : 8d 00 d6 STA $d600 
.l2260:
05:b04c : 2c 00 d6 BIT $d600 
05:b04f : 10 fb __ BPL $b04c ; (chareditor.l2260 + 0)
.s244:
05:b051 : 8e 01 d6 STX $d601 
05:b054 : a9 1f __ LDA #$1f
05:b056 : 8d 00 d6 STA $d600 
.l2262:
05:b059 : 2c 00 d6 BIT $d600 
05:b05c : 10 fb __ BPL $b059 ; (chareditor.l2262 + 0)
.s248:
05:b05e : 8c 01 d6 STY $d601 
05:b061 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b064 : a6 53 __ LDX T0 + 0 
05:b066 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b069 : 85 0f __ STA P2 
05:b06b : 18 __ __ CLC
05:b06c : a5 1b __ LDA ACCU + 0 
05:b06e : 65 53 __ ADC T0 + 0 
05:b070 : 85 0d __ STA P0 
05:b072 : a5 1c __ LDA ACCU + 1 
05:b074 : 69 00 __ ADC #$00
05:b076 : 85 0e __ STA P1 
05:b078 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b07b : a6 53 __ LDX T0 + 0 
05:b07d : e8 __ __ INX
05:b07e : e0 08 __ CPX #$08
05:b080 : b0 03 __ BCS $b085 ; (chareditor.s248 + 39)
05:b082 : 4c fb af JMP $affb ; (chareditor.l230 + 0)
05:b085 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s163:
05:b088 : a2 00 __ LDX #$00
.l165:
05:b08a : 86 53 __ STX T0 + 0 
05:b08c : bd bc ab LDA $abbc,x ; (projbuffer + 36)
05:b08f : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b092 : a8 __ __ TAY
05:b093 : a9 12 __ LDA #$12
05:b095 : 8d 00 d6 STA $d600 
05:b098 : 18 __ __ CLC
05:b099 : a5 56 __ LDA T3 + 0 
05:b09b : 65 53 __ ADC T0 + 0 
05:b09d : aa __ __ TAX
05:b09e : a5 57 __ LDA T3 + 1 
05:b0a0 : 69 00 __ ADC #$00
.l2250:
05:b0a2 : 2c 00 d6 BIT $d600 
05:b0a5 : 10 fb __ BPL $b0a2 ; (chareditor.l2250 + 0)
.s174:
05:b0a7 : 8d 01 d6 STA $d601 
05:b0aa : a9 13 __ LDA #$13
05:b0ac : 8d 00 d6 STA $d600 
.l2252:
05:b0af : 2c 00 d6 BIT $d600 
05:b0b2 : 10 fb __ BPL $b0af ; (chareditor.l2252 + 0)
.s179:
05:b0b4 : 8e 01 d6 STX $d601 
05:b0b7 : a9 1f __ LDA #$1f
05:b0b9 : 8d 00 d6 STA $d600 
.l2254:
05:b0bc : 2c 00 d6 BIT $d600 
05:b0bf : 10 fb __ BPL $b0bc ; (chareditor.l2254 + 0)
.s183:
05:b0c1 : 8c 01 d6 STY $d601 
05:b0c4 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b0c7 : a6 53 __ LDX T0 + 0 
05:b0c9 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b0cc : 85 0f __ STA P2 
05:b0ce : 18 __ __ CLC
05:b0cf : a5 1b __ LDA ACCU + 0 
05:b0d1 : 65 53 __ ADC T0 + 0 
05:b0d3 : 85 0d __ STA P0 
05:b0d5 : a5 1c __ LDA ACCU + 1 
05:b0d7 : 69 00 __ ADC #$00
05:b0d9 : 85 0e __ STA P1 
05:b0db : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b0de : a6 53 __ LDX T0 + 0 
05:b0e0 : e8 __ __ INX
05:b0e1 : e0 08 __ CPX #$08
05:b0e3 : 90 a5 __ BCC $b08a ; (chareditor.l165 + 0)
05:b0e5 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s449:
05:b0e8 : c9 52 __ CMP #$52
05:b0ea : d0 03 __ BNE $b0ef ; (chareditor.s450 + 0)
05:b0ec : 4c 88 b1 JMP $b188 ; (chareditor.s331 + 0)
.s450:
05:b0ef : c9 53 __ CMP #$53
05:b0f1 : f0 03 __ BEQ $b0f6 ; (chareditor.s137 + 0)
05:b0f3 : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s137:
05:b0f6 : a5 54 __ LDA T1 + 0 
05:b0f8 : f0 04 __ BEQ $b0fe ; (chareditor.s1273 + 0)
.s1274:
05:b0fa : a9 d8 __ LDA #$d8
05:b0fc : d0 02 __ BNE $b100 ; (chareditor.s1275 + 0)
.s1273:
05:b0fe : a9 d0 __ LDA #$d0
.s1275:
05:b100 : 85 5a __ STA T5 + 1 
05:b102 : a5 58 __ LDA T4 + 0 
05:b104 : 85 5b __ STA T6 + 0 
05:b106 : 0a __ __ ASL
05:b107 : 85 60 __ STA T12 + 0 
05:b109 : a9 00 __ LDA #$00
05:b10b : 85 53 __ STA T0 + 0 
05:b10d : 2a __ __ ROL
05:b10e : 06 60 __ ASL T12 + 0 
05:b110 : 2a __ __ ROL
05:b111 : 06 60 __ ASL T12 + 0 
05:b113 : 2a __ __ ROL
05:b114 : 85 61 __ STA T12 + 1 
.l139:
05:b116 : a9 01 __ LDA #$01
05:b118 : 85 0d __ STA P0 
05:b11a : 18 __ __ CLC
05:b11b : a5 53 __ LDA T0 + 0 
05:b11d : 65 60 __ ADC T12 + 0 
05:b11f : 85 0e __ STA P1 
05:b121 : a5 5a __ LDA T5 + 1 
05:b123 : 65 61 __ ADC T12 + 1 
05:b125 : 85 0f __ STA P2 
05:b127 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
05:b12a : a6 53 __ LDX T0 + 0 
05:b12c : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b12f : a2 12 __ LDX #$12
05:b131 : 8e 00 d6 STX $d600 
05:b134 : aa __ __ TAX
05:b135 : 18 __ __ CLC
05:b136 : a5 56 __ LDA T3 + 0 
05:b138 : 65 53 __ ADC T0 + 0 
05:b13a : a8 __ __ TAY
05:b13b : a5 57 __ LDA T3 + 1 
05:b13d : 69 00 __ ADC #$00
.l2242:
05:b13f : 2c 00 d6 BIT $d600 
05:b142 : 10 fb __ BPL $b13f ; (chareditor.l2242 + 0)
.s148:
05:b144 : 8d 01 d6 STA $d601 
05:b147 : a9 13 __ LDA #$13
05:b149 : 8d 00 d6 STA $d600 
.l2244:
05:b14c : 2c 00 d6 BIT $d600 
05:b14f : 10 fb __ BPL $b14c ; (chareditor.l2244 + 0)
.s153:
05:b151 : 8c 01 d6 STY $d601 
05:b154 : a9 1f __ LDA #$1f
05:b156 : 8d 00 d6 STA $d600 
.l2246:
05:b159 : 2c 00 d6 BIT $d600 
05:b15c : 10 fb __ BPL $b159 ; (chareditor.l2246 + 0)
.s157:
05:b15e : 8e 01 d6 STX $d601 
05:b161 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b164 : a6 53 __ LDX T0 + 0 
05:b166 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b169 : 85 0f __ STA P2 
05:b16b : 18 __ __ CLC
05:b16c : a5 1b __ LDA ACCU + 0 
05:b16e : 65 53 __ ADC T0 + 0 
05:b170 : 85 0d __ STA P0 
05:b172 : a5 1c __ LDA ACCU + 1 
05:b174 : 69 00 __ ADC #$00
05:b176 : 85 0e __ STA P1 
05:b178 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b17b : e6 53 __ INC T0 + 0 
05:b17d : a5 53 __ LDA T0 + 0 
05:b17f : c9 08 __ CMP #$08
05:b181 : 90 93 __ BCC $b116 ; (chareditor.l139 + 0)
.s141:
05:b183 : a5 5b __ LDA T6 + 0 
05:b185 : 4c 31 af JMP $af31 ; (chareditor.s2278 + 0)
.s331:
05:b188 : a0 00 __ LDY #$00
.l333:
05:b18a : b9 c4 ab LDA $abc4,y ; (projbuffer + 44)
05:b18d : 4a __ __ LSR
05:b18e : 99 ac ab STA $abac,y ; (projbuffer + 20)
05:b191 : aa __ __ TAX
05:b192 : b9 c4 ab LDA $abc4,y ; (projbuffer + 44)
05:b195 : 4a __ __ LSR
05:b196 : 90 06 __ BCC $b19e ; (chareditor.s1535 + 0)
.s336:
05:b198 : 8a __ __ TXA
05:b199 : 09 80 __ ORA #$80
05:b19b : 99 ac ab STA $abac,y ; (projbuffer + 20)
.s1535:
05:b19e : c8 __ __ INY
05:b19f : c0 08 __ CPY #$08
05:b1a1 : 90 e7 __ BCC $b18a ; (chareditor.l333 + 0)
.s335:
05:b1a3 : a2 00 __ LDX #$00
.l340:
05:b1a5 : 86 53 __ STX T0 + 0 
05:b1a7 : bd ac ab LDA $abac,x ; (projbuffer + 20)
05:b1aa : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b1ad : a8 __ __ TAY
05:b1ae : a9 12 __ LDA #$12
05:b1b0 : 8d 00 d6 STA $d600 
05:b1b3 : 18 __ __ CLC
05:b1b4 : a5 56 __ LDA T3 + 0 
05:b1b6 : 65 53 __ ADC T0 + 0 
05:b1b8 : aa __ __ TAX
05:b1b9 : a5 57 __ LDA T3 + 1 
05:b1bb : 69 00 __ ADC #$00
.l2234:
05:b1bd : 2c 00 d6 BIT $d600 
05:b1c0 : 10 fb __ BPL $b1bd ; (chareditor.l2234 + 0)
.s349:
05:b1c2 : 8d 01 d6 STA $d601 
05:b1c5 : a9 13 __ LDA #$13
05:b1c7 : 8d 00 d6 STA $d600 
.l2236:
05:b1ca : 2c 00 d6 BIT $d600 
05:b1cd : 10 fb __ BPL $b1ca ; (chareditor.l2236 + 0)
.s354:
05:b1cf : 8e 01 d6 STX $d601 
05:b1d2 : a9 1f __ LDA #$1f
05:b1d4 : 8d 00 d6 STA $d600 
.l2238:
05:b1d7 : 2c 00 d6 BIT $d600 
05:b1da : 10 fb __ BPL $b1d7 ; (chareditor.l2238 + 0)
.s358:
05:b1dc : 8c 01 d6 STY $d601 
05:b1df : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b1e2 : a6 53 __ LDX T0 + 0 
05:b1e4 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b1e7 : 85 0f __ STA P2 
05:b1e9 : 18 __ __ CLC
05:b1ea : a5 1b __ LDA ACCU + 0 
05:b1ec : 65 53 __ ADC T0 + 0 
05:b1ee : 85 0d __ STA P0 
05:b1f0 : a5 1c __ LDA ACCU + 1 
05:b1f2 : 69 00 __ ADC #$00
05:b1f4 : 85 0e __ STA P1 
05:b1f6 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b1f9 : a6 53 __ LDX T0 + 0 
05:b1fb : e8 __ __ INX
05:b1fc : e0 08 __ CPX #$08
05:b1fe : 90 a5 __ BCC $b1a5 ; (chareditor.l340 + 0)
05:b200 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s281:
05:b203 : a9 01 __ LDA #$01
05:b205 : 85 53 __ STA T0 + 0 
.l1247:
05:b207 : 38 __ __ SEC
05:b208 : e9 01 __ SBC #$01
05:b20a : 85 59 __ STA T5 + 0 
05:b20c : a6 53 __ LDX T0 + 0 
05:b20e : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b211 : a6 59 __ LDX T5 + 0 
05:b213 : 9d ac ab STA $abac,x ; (projbuffer + 20)
05:b216 : e6 53 __ INC T0 + 0 
05:b218 : a5 53 __ LDA T0 + 0 
05:b21a : c9 08 __ CMP #$08
05:b21c : 90 e9 __ BCC $b207 ; (chareditor.l1247 + 0)
.s285:
05:b21e : ad c4 ab LDA $abc4 ; (projbuffer + 44)
05:b221 : 8d b3 ab STA $abb3 ; (projbuffer + 27)
05:b224 : a2 00 __ LDX #$00
.l287:
05:b226 : 86 53 __ STX T0 + 0 
05:b228 : bd ac ab LDA $abac,x ; (projbuffer + 20)
05:b22b : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b22e : a8 __ __ TAY
05:b22f : a9 12 __ LDA #$12
05:b231 : 8d 00 d6 STA $d600 
05:b234 : 18 __ __ CLC
05:b235 : a5 56 __ LDA T3 + 0 
05:b237 : 65 53 __ ADC T0 + 0 
05:b239 : aa __ __ TAX
05:b23a : a5 57 __ LDA T3 + 1 
05:b23c : 69 00 __ ADC #$00
.l2224:
05:b23e : 2c 00 d6 BIT $d600 
05:b241 : 10 fb __ BPL $b23e ; (chareditor.l2224 + 0)
.s296:
05:b243 : 8d 01 d6 STA $d601 
05:b246 : a9 13 __ LDA #$13
05:b248 : 8d 00 d6 STA $d600 
.l2226:
05:b24b : 2c 00 d6 BIT $d600 
05:b24e : 10 fb __ BPL $b24b ; (chareditor.l2226 + 0)
.s301:
05:b250 : 8e 01 d6 STX $d601 
05:b253 : a9 1f __ LDA #$1f
05:b255 : 8d 00 d6 STA $d600 
.l2228:
05:b258 : 2c 00 d6 BIT $d600 
05:b25b : 10 fb __ BPL $b258 ; (chareditor.l2228 + 0)
.s305:
05:b25d : 8c 01 d6 STY $d601 
05:b260 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b263 : a6 53 __ LDX T0 + 0 
05:b265 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b268 : 85 0f __ STA P2 
05:b26a : 18 __ __ CLC
05:b26b : a5 1b __ LDA ACCU + 0 
05:b26d : 65 53 __ ADC T0 + 0 
05:b26f : 85 0d __ STA P0 
05:b271 : a5 1c __ LDA ACCU + 1 
05:b273 : 69 00 __ ADC #$00
05:b275 : 85 0e __ STA P1 
05:b277 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b27a : a6 53 __ LDX T0 + 0 
05:b27c : e8 __ __ INX
05:b27d : e0 08 __ CPX #$08
05:b27f : 90 a5 __ BCC $b226 ; (chareditor.l287 + 0)
05:b281 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.l187:
05:b284 : 38 __ __ SEC
05:b285 : a9 07 __ LDA #$07
05:b287 : e5 53 __ SBC T0 + 0 
05:b289 : 85 5b __ STA T6 + 0 
05:b28b : a8 __ __ TAY
05:b28c : a9 12 __ LDA #$12
05:b28e : 8d 00 d6 STA $d600 
05:b291 : 18 __ __ CLC
05:b292 : a5 56 __ LDA T3 + 0 
05:b294 : 65 53 __ ADC T0 + 0 
05:b296 : be c4 ab LDX $abc4,y ; (projbuffer + 44)
05:b299 : a8 __ __ TAY
05:b29a : a5 57 __ LDA T3 + 1 
05:b29c : 69 00 __ ADC #$00
.l2208:
05:b29e : 2c 00 d6 BIT $d600 
05:b2a1 : 10 fb __ BPL $b29e ; (chareditor.l2208 + 0)
.s196:
05:b2a3 : 8d 01 d6 STA $d601 
05:b2a6 : a9 13 __ LDA #$13
05:b2a8 : 8d 00 d6 STA $d600 
.l2210:
05:b2ab : 2c 00 d6 BIT $d600 
05:b2ae : 10 fb __ BPL $b2ab ; (chareditor.l2210 + 0)
.s201:
05:b2b0 : 8c 01 d6 STY $d601 
05:b2b3 : a9 1f __ LDA #$1f
05:b2b5 : 8d 00 d6 STA $d600 
.l2212:
05:b2b8 : 2c 00 d6 BIT $d600 
05:b2bb : 10 fb __ BPL $b2b8 ; (chareditor.l2212 + 0)
.s205:
05:b2bd : 8e 01 d6 STX $d601 
05:b2c0 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b2c3 : a6 5b __ LDX T6 + 0 
05:b2c5 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b2c8 : 85 0f __ STA P2 
05:b2ca : 18 __ __ CLC
05:b2cb : a5 1b __ LDA ACCU + 0 
05:b2cd : 65 53 __ ADC T0 + 0 
05:b2cf : 85 0d __ STA P0 
05:b2d1 : a5 1c __ LDA ACCU + 1 
05:b2d3 : 69 00 __ ADC #$00
05:b2d5 : 85 0e __ STA P1 
05:b2d7 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b2da : e6 53 __ INC T0 + 0 
05:b2dc : a5 53 __ LDA T0 + 0 
05:b2de : c9 08 __ CMP #$08
05:b2e0 : 90 a2 __ BCC $b284 ; (chareditor.l187 + 0)
.s207:
05:b2e2 : a0 00 __ LDY #$00
.l1257:
05:b2e4 : a9 12 __ LDA #$12
05:b2e6 : 8d 00 d6 STA $d600 
05:b2e9 : 98 __ __ TYA
05:b2ea : 18 __ __ CLC
05:b2eb : 65 56 __ ADC T3 + 0 
05:b2ed : aa __ __ TAX
05:b2ee : a9 00 __ LDA #$00
05:b2f0 : 65 57 __ ADC T3 + 1 
.l2215:
05:b2f2 : 2c 00 d6 BIT $d600 
05:b2f5 : 10 fb __ BPL $b2f2 ; (chareditor.l2215 + 0)
.s216:
05:b2f7 : 8d 01 d6 STA $d601 
05:b2fa : a9 13 __ LDA #$13
05:b2fc : 8d 00 d6 STA $d600 
.l2217:
05:b2ff : 2c 00 d6 BIT $d600 
05:b302 : 10 fb __ BPL $b2ff ; (chareditor.l2217 + 0)
.s221:
05:b304 : 8e 01 d6 STX $d601 
05:b307 : a9 1f __ LDA #$1f
05:b309 : 8d 00 d6 STA $d600 
.l2219:
05:b30c : 2c 00 d6 BIT $d600 
05:b30f : 10 fb __ BPL $b30c ; (chareditor.l2219 + 0)
.s225:
05:b311 : ad 01 d6 LDA $d601 
05:b314 : 99 c4 ab STA $abc4,y ; (projbuffer + 44)
05:b317 : c8 __ __ INY
05:b318 : c0 08 __ CPY #$08
05:b31a : 90 c8 __ BCC $b2e4 ; (chareditor.l1257 + 0)
05:b31c : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s423:
05:b31f : c9 41 __ CMP #$41
05:b321 : d0 0e __ BNE $b331 ; (chareditor.s424 + 0)
.s184:
05:b323 : a9 00 __ LDA #$00
05:b325 : c5 54 __ CMP T1 + 0 
05:b327 : 2a __ __ ROL
05:b328 : 85 54 __ STA T1 + 0 
05:b32a : a9 01 __ LDA #$01
05:b32c : 85 5f __ STA T10 + 0 
05:b32e : 4c b6 ad JMP $adb6 ; (chareditor.s465 + 0)
.s424:
05:b331 : b0 03 __ BCS $b336 ; (chareditor.s425 + 0)
05:b333 : 4c 63 b5 JMP $b563 ; (chareditor.s426 + 0)
.s425:
05:b336 : c9 48 __ CMP #$48
05:b338 : d0 59 __ BNE $b393 ; (chareditor.s437 + 0)
.s387:
05:b33a : a5 63 __ LDA T16 + 0 
05:b33c : a0 06 __ LDY #$06
05:b33e : 91 23 __ STA (SP + 0),y 
05:b340 : a9 00 __ LDA #$00
05:b342 : c8 __ __ INY
05:b343 : 91 23 __ STA (SP + 0),y 
05:b345 : a9 51 __ LDA #$51
05:b347 : a0 02 __ LDY #$02
05:b349 : 91 23 __ STA (SP + 0),y 
05:b34b : a9 89 __ LDA #$89
05:b34d : c8 __ __ INY
05:b34e : 91 23 __ STA (SP + 0),y 
05:b350 : a9 e0 __ LDA #$e0
05:b352 : c8 __ __ INY
05:b353 : 91 23 __ STA (SP + 0),y 
05:b355 : a9 b8 __ LDA #$b8
05:b357 : c8 __ __ INY
05:b358 : 91 23 __ STA (SP + 0),y 
05:b35a : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
05:b35d : a9 44 __ LDA #$44
05:b35f : 85 16 __ STA P9 
05:b361 : a5 62 __ LDA T14 + 0 
05:b363 : 85 17 __ STA P10 
05:b365 : a9 51 __ LDA #$51
05:b367 : 8d f3 ab STA $abf3 ; (sstack + 0)
05:b36a : a9 89 __ LDA #$89
05:b36c : 8d f4 ab STA $abf4 ; (sstack + 1)
05:b36f : a9 02 __ LDA #$02
05:b371 : 8d f5 ab STA $abf5 ; (sstack + 2)
05:b374 : 20 18 4c JSR $4c18 ; (textInput.s1000 + 0)
05:b377 : a9 51 __ LDA #$51
05:b379 : 85 0d __ STA P0 
05:b37b : a9 89 __ LDA #$89
05:b37d : 85 0e __ STA P1 
05:b37f : a9 10 __ LDA #$10
05:b381 : 85 11 __ STA P4 
05:b383 : a9 aa __ LDA #$aa
05:b385 : 85 0f __ STA P2 
05:b387 : a9 ab __ LDA #$ab
05:b389 : 85 10 __ STA P3 
05:b38b : 20 a2 4e JSR $4ea2 ; (strtol.l1 + 0)
05:b38e : a5 1b __ LDA ACCU + 0 
05:b390 : 4c 0f b5 JMP $b50f ; (chareditor.s1260 + 0)
.s437:
05:b393 : b0 03 __ BCS $b398 ; (chareditor.s438 + 0)
05:b395 : 4c 81 b4 JMP $b481 ; (chareditor.s439 + 0)
.s438:
05:b398 : c9 49 __ CMP #$49
05:b39a : d0 03 __ BNE $b39f ; (chareditor.s442 + 0)
05:b39c : 4c 1f b4 JMP $b41f ; (chareditor.s74 + 0)
.s442:
05:b39f : c9 4c __ CMP #$4c
05:b3a1 : f0 03 __ BEQ $b3a6 ; (chareditor.s359 + 0)
05:b3a3 : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s359:
05:b3a6 : a0 00 __ LDY #$00
.l361:
05:b3a8 : b9 c4 ab LDA $abc4,y ; (projbuffer + 44)
05:b3ab : 0a __ __ ASL
05:b3ac : 99 ac ab STA $abac,y ; (projbuffer + 20)
05:b3af : aa __ __ TAX
05:b3b0 : b9 c4 ab LDA $abc4,y ; (projbuffer + 44)
05:b3b3 : 10 05 __ BPL $b3ba ; (chareditor.s1534 + 0)
.s364:
05:b3b5 : e8 __ __ INX
05:b3b6 : 8a __ __ TXA
05:b3b7 : 99 ac ab STA $abac,y ; (projbuffer + 20)
.s1534:
05:b3ba : c8 __ __ INY
05:b3bb : c0 08 __ CPY #$08
05:b3bd : 90 e9 __ BCC $b3a8 ; (chareditor.l361 + 0)
.s363:
05:b3bf : a2 00 __ LDX #$00
.l368:
05:b3c1 : 86 53 __ STX T0 + 0 
05:b3c3 : bd ac ab LDA $abac,x ; (projbuffer + 20)
05:b3c6 : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b3c9 : a8 __ __ TAY
05:b3ca : a9 12 __ LDA #$12
05:b3cc : 8d 00 d6 STA $d600 
05:b3cf : 18 __ __ CLC
05:b3d0 : a5 56 __ LDA T3 + 0 
05:b3d2 : 65 53 __ ADC T0 + 0 
05:b3d4 : aa __ __ TAX
05:b3d5 : a5 57 __ LDA T3 + 1 
05:b3d7 : 69 00 __ ADC #$00
.l2200:
05:b3d9 : 2c 00 d6 BIT $d600 
05:b3dc : 10 fb __ BPL $b3d9 ; (chareditor.l2200 + 0)
.s377:
05:b3de : 8d 01 d6 STA $d601 
05:b3e1 : a9 13 __ LDA #$13
05:b3e3 : 8d 00 d6 STA $d600 
.l2202:
05:b3e6 : 2c 00 d6 BIT $d600 
05:b3e9 : 10 fb __ BPL $b3e6 ; (chareditor.l2202 + 0)
.s382:
05:b3eb : 8e 01 d6 STX $d601 
05:b3ee : a9 1f __ LDA #$1f
05:b3f0 : 8d 00 d6 STA $d600 
.l2204:
05:b3f3 : 2c 00 d6 BIT $d600 
05:b3f6 : 10 fb __ BPL $b3f3 ; (chareditor.l2204 + 0)
.s386:
05:b3f8 : 8c 01 d6 STY $d601 
05:b3fb : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b3fe : a6 53 __ LDX T0 + 0 
05:b400 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b403 : 85 0f __ STA P2 
05:b405 : 18 __ __ CLC
05:b406 : a5 1b __ LDA ACCU + 0 
05:b408 : 65 53 __ ADC T0 + 0 
05:b40a : 85 0d __ STA P0 
05:b40c : a5 1c __ LDA ACCU + 1 
05:b40e : 69 00 __ ADC #$00
05:b410 : 85 0e __ STA P1 
05:b412 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b415 : a6 53 __ LDX T0 + 0 
05:b417 : e8 __ __ INX
05:b418 : e0 08 __ CPX #$08
05:b41a : 90 a5 __ BCC $b3c1 ; (chareditor.l368 + 0)
05:b41c : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s74:
05:b41f : a2 00 __ LDX #$00
.l76:
05:b421 : 86 53 __ STX T0 + 0 
05:b423 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b426 : 49 ff __ EOR #$ff
05:b428 : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b42b : a8 __ __ TAY
05:b42c : a9 12 __ LDA #$12
05:b42e : 8d 00 d6 STA $d600 
05:b431 : 18 __ __ CLC
05:b432 : a5 56 __ LDA T3 + 0 
05:b434 : 65 53 __ ADC T0 + 0 
05:b436 : aa __ __ TAX
05:b437 : a5 57 __ LDA T3 + 1 
05:b439 : 69 00 __ ADC #$00
.l2190:
05:b43b : 2c 00 d6 BIT $d600 
05:b43e : 10 fb __ BPL $b43b ; (chareditor.l2190 + 0)
.s85:
05:b440 : 8d 01 d6 STA $d601 
05:b443 : a9 13 __ LDA #$13
05:b445 : 8d 00 d6 STA $d600 
.l2192:
05:b448 : 2c 00 d6 BIT $d600 
05:b44b : 10 fb __ BPL $b448 ; (chareditor.l2192 + 0)
.s90:
05:b44d : 8e 01 d6 STX $d601 
05:b450 : a9 1f __ LDA #$1f
05:b452 : 8d 00 d6 STA $d600 
.l2194:
05:b455 : 2c 00 d6 BIT $d600 
05:b458 : 10 fb __ BPL $b455 ; (chareditor.l2194 + 0)
.s94:
05:b45a : 8c 01 d6 STY $d601 
05:b45d : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b460 : a6 53 __ LDX T0 + 0 
05:b462 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b465 : 85 0f __ STA P2 
05:b467 : 18 __ __ CLC
05:b468 : a5 1b __ LDA ACCU + 0 
05:b46a : 65 53 __ ADC T0 + 0 
05:b46c : 85 0d __ STA P0 
05:b46e : a5 1c __ LDA ACCU + 1 
05:b470 : 69 00 __ ADC #$00
05:b472 : 85 0e __ STA P1 
05:b474 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b477 : a6 53 __ LDX T0 + 0 
05:b479 : e8 __ __ INX
05:b47a : e0 08 __ CPX #$08
05:b47c : 90 a3 __ BCC $b421 ; (chareditor.l76 + 0)
05:b47e : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s439:
05:b481 : c9 43 __ CMP #$43
05:b483 : f0 7a __ BEQ $b4ff ; (chareditor.s160 + 0)
.s440:
05:b485 : c9 44 __ CMP #$44
05:b487 : f0 03 __ BEQ $b48c ; (chareditor.s308 + 0)
05:b489 : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s308:
05:b48c : a2 01 __ LDX #$01
.l1249:
05:b48e : bd c3 ab LDA $abc3,x ; (projbuffer + 43)
05:b491 : 9d ac ab STA $abac,x ; (projbuffer + 20)
05:b494 : e8 __ __ INX
05:b495 : e0 08 __ CPX #$08
05:b497 : 90 f5 __ BCC $b48e ; (chareditor.l1249 + 0)
.s1250:
05:b499 : ad cb ab LDA $abcb ; (buff + 38)
05:b49c : 8d ac ab STA $abac ; (projbuffer + 20)
05:b49f : a2 00 __ LDX #$00
.l312:
05:b4a1 : 86 53 __ STX T0 + 0 
05:b4a3 : bd ac ab LDA $abac,x ; (projbuffer + 20)
05:b4a6 : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b4a9 : a8 __ __ TAY
05:b4aa : a9 12 __ LDA #$12
05:b4ac : 8d 00 d6 STA $d600 
05:b4af : 18 __ __ CLC
05:b4b0 : a5 56 __ LDA T3 + 0 
05:b4b2 : 65 53 __ ADC T0 + 0 
05:b4b4 : aa __ __ TAX
05:b4b5 : a5 57 __ LDA T3 + 1 
05:b4b7 : 69 00 __ ADC #$00
.l2182:
05:b4b9 : 2c 00 d6 BIT $d600 
05:b4bc : 10 fb __ BPL $b4b9 ; (chareditor.l2182 + 0)
.s321:
05:b4be : 8d 01 d6 STA $d601 
05:b4c1 : a9 13 __ LDA #$13
05:b4c3 : 8d 00 d6 STA $d600 
.l2184:
05:b4c6 : 2c 00 d6 BIT $d600 
05:b4c9 : 10 fb __ BPL $b4c6 ; (chareditor.l2184 + 0)
.s326:
05:b4cb : 8e 01 d6 STX $d601 
05:b4ce : a9 1f __ LDA #$1f
05:b4d0 : 8d 00 d6 STA $d600 
.l2186:
05:b4d3 : 2c 00 d6 BIT $d600 
05:b4d6 : 10 fb __ BPL $b4d3 ; (chareditor.l2186 + 0)
.s330:
05:b4d8 : 8c 01 d6 STY $d601 
05:b4db : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b4de : a6 53 __ LDX T0 + 0 
05:b4e0 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b4e3 : 85 0f __ STA P2 
05:b4e5 : 18 __ __ CLC
05:b4e6 : a5 1b __ LDA ACCU + 0 
05:b4e8 : 65 53 __ ADC T0 + 0 
05:b4ea : 85 0d __ STA P0 
05:b4ec : a5 1c __ LDA ACCU + 1 
05:b4ee : 69 00 __ ADC #$00
05:b4f0 : 85 0e __ STA P1 
05:b4f2 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b4f5 : a6 53 __ LDX T0 + 0 
05:b4f7 : e8 __ __ INX
05:b4f8 : e0 08 __ CPX #$08
05:b4fa : 90 a5 __ BCC $b4a1 ; (chareditor.l312 + 0)
05:b4fc : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s160:
05:b4ff : a2 00 __ LDX #$00
.l1245:
05:b501 : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b504 : 9d bc ab STA $abbc,x ; (projbuffer + 36)
05:b507 : e8 __ __ INX
05:b508 : e0 08 __ CPX #$08
05:b50a : 90 f5 __ BCC $b501 ; (chareditor.l1245 + 0)
05:b50c : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s1260:
05:b50f : a6 5d __ LDX T8 + 0 
05:b511 : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b514 : a2 12 __ LDX #$12
05:b516 : 8e 00 d6 STX $d600 
05:b519 : aa __ __ TAX
05:b51a : 18 __ __ CLC
05:b51b : a5 56 __ LDA T3 + 0 
05:b51d : 65 5d __ ADC T8 + 0 
05:b51f : a8 __ __ TAY
05:b520 : a5 57 __ LDA T3 + 1 
05:b522 : 69 00 __ ADC #$00
.l2158:
05:b524 : 2c 00 d6 BIT $d600 
05:b527 : 10 fb __ BPL $b524 ; (chareditor.l2158 + 0)
.s64:
05:b529 : 8d 01 d6 STA $d601 
05:b52c : a9 13 __ LDA #$13
05:b52e : 8d 00 d6 STA $d600 
.l2160:
05:b531 : 2c 00 d6 BIT $d600 
05:b534 : 10 fb __ BPL $b531 ; (chareditor.l2160 + 0)
.s69:
05:b536 : 8c 01 d6 STY $d601 
05:b539 : a9 1f __ LDA #$1f
05:b53b : 8d 00 d6 STA $d600 
.l2162:
05:b53e : 2c 00 d6 BIT $d600 
05:b541 : 10 fb __ BPL $b53e ; (chareditor.l2162 + 0)
.s3693:
05:b543 : 8e 01 d6 STX $d601 
05:b546 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b549 : a6 5d __ LDX T8 + 0 
05:b54b : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b54e : 85 0f __ STA P2 
05:b550 : 18 __ __ CLC
05:b551 : a5 1b __ LDA ACCU + 0 
05:b553 : 65 5d __ ADC T8 + 0 
05:b555 : 85 0d __ STA P0 
05:b557 : a5 1c __ LDA ACCU + 1 
05:b559 : 69 00 __ ADC #$00
05:b55b : 85 0e __ STA P1 
05:b55d : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b560 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s426:
05:b563 : c9 20 __ CMP #$20
05:b565 : d0 07 __ BNE $b56e ; (chareditor.s427 + 0)
.s57:
05:b567 : a5 63 __ LDA T16 + 0 
05:b569 : 45 59 __ EOR T5 + 0 
05:b56b : 4c 0f b5 JMP $b50f ; (chareditor.s1260 + 0)
.s427:
05:b56e : 90 15 __ BCC $b585 ; (chareditor.s429 + 0)
.s428:
05:b570 : c9 2b __ CMP #$2b
05:b572 : d0 05 __ BNE $b579 ; (chareditor.s435 + 0)
.s630:
05:b574 : e6 58 __ INC T4 + 0 
05:b576 : 4c b6 ad JMP $adb6 ; (chareditor.s465 + 0)
.s435:
05:b579 : c9 2d __ CMP #$2d
05:b57b : f0 03 __ BEQ $b580 ; (chareditor.s53 + 0)
05:b57d : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s53:
05:b580 : c6 58 __ DEC T4 + 0 
05:b582 : 4c b6 ad JMP $adb6 ; (chareditor.s465 + 0)
.s429:
05:b585 : c9 14 __ CMP #$14
05:b587 : d0 06 __ BNE $b58f ; (chareditor.s430 + 0)
.s95:
05:b589 : a9 00 __ LDA #$00
05:b58b : 85 53 __ STA T0 + 0 
05:b58d : f0 2c __ BEQ $b5bb ; (chareditor.l97 + 0)
.s430:
05:b58f : b0 15 __ BCS $b5a6 ; (chareditor.s431 + 0)
.s432:
05:b591 : c9 11 __ CMP #$11
05:b593 : f0 03 __ BEQ $b598 ; (chareditor.s45 + 0)
05:b595 : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s45:
05:b598 : a5 5d __ LDA T8 + 0 
05:b59a : c9 07 __ CMP #$07
05:b59c : 90 03 __ BCC $b5a1 ; (chareditor.s46 + 0)
05:b59e : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s46:
05:b5a1 : e6 5d __ INC T8 + 0 
05:b5a3 : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s431:
05:b5a6 : c9 1d __ CMP #$1d
05:b5a8 : f0 03 __ BEQ $b5ad ; (chareditor.s37 + 0)
05:b5aa : 4c 7f ad JMP $ad7f ; (chareditor.s411 + 0)
.s37:
05:b5ad : a5 5c __ LDA T7 + 0 
05:b5af : c9 07 __ CMP #$07
05:b5b1 : 90 03 __ BCC $b5b6 ; (chareditor.s38 + 0)
05:b5b3 : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.s38:
05:b5b6 : e6 5c __ INC T7 + 0 
05:b5b8 : 4c b2 ad JMP $adb2 ; (chareditor.s36 + 0)
.l97:
05:b5bb : a9 00 __ LDA #$00
05:b5bd : a6 53 __ LDX T0 + 0 
05:b5bf : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b5c2 : a9 12 __ LDA #$12
05:b5c4 : 8d 00 d6 STA $d600 
05:b5c7 : 18 __ __ CLC
05:b5c8 : a5 56 __ LDA T3 + 0 
05:b5ca : 65 53 __ ADC T0 + 0 
05:b5cc : aa __ __ TAX
05:b5cd : a5 57 __ LDA T3 + 1 
05:b5cf : 69 00 __ ADC #$00
.l2165:
05:b5d1 : 2c 00 d6 BIT $d600 
05:b5d4 : 10 fb __ BPL $b5d1 ; (chareditor.l2165 + 0)
.s106:
05:b5d6 : 8d 01 d6 STA $d601 
05:b5d9 : a9 13 __ LDA #$13
05:b5db : 8d 00 d6 STA $d600 
.l2167:
05:b5de : 2c 00 d6 BIT $d600 
05:b5e1 : 10 fb __ BPL $b5de ; (chareditor.l2167 + 0)
.s111:
05:b5e3 : 8e 01 d6 STX $d601 
05:b5e6 : a9 1f __ LDA #$1f
05:b5e8 : 8d 00 d6 STA $d600 
.l2169:
05:b5eb : 2c 00 d6 BIT $d600 
05:b5ee : 10 fb __ BPL $b5eb ; (chareditor.l2169 + 0)
.s115:
05:b5f0 : a9 00 __ LDA #$00
05:b5f2 : 8d 01 d6 STA $d601 
05:b5f5 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b5f8 : a6 53 __ LDX T0 + 0 
05:b5fa : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b5fd : 85 0f __ STA P2 
05:b5ff : 18 __ __ CLC
05:b600 : a5 1b __ LDA ACCU + 0 
05:b602 : 65 53 __ ADC T0 + 0 
05:b604 : 85 0d __ STA P0 
05:b606 : a5 1c __ LDA ACCU + 1 
05:b608 : 69 00 __ ADC #$00
05:b60a : 85 0e __ STA P1 
05:b60c : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b60f : e6 53 __ INC T0 + 0 
05:b611 : a5 53 __ LDA T0 + 0 
05:b613 : c9 08 __ CMP #$08
05:b615 : 90 a4 __ BCC $b5bb ; (chareditor.l97 + 0)
05:b617 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.l251:
05:b61a : 86 53 __ STX T0 + 0 
05:b61c : 86 5b __ STX T6 + 0 
05:b61e : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:b621 : 85 59 __ STA T5 + 0 
05:b623 : 49 ff __ EOR #$ff
05:b625 : 85 60 __ STA T12 + 0 
05:b627 : a9 00 __ LDA #$00
05:b629 : 85 55 __ STA T2 + 0 
.l255:
05:b62b : 38 __ __ SEC
05:b62c : a9 07 __ LDA #$07
05:b62e : e5 55 __ SBC T2 + 0 
05:b630 : a6 55 __ LDX T2 + 0 
05:b632 : bc ac ab LDY $abac,x ; (projbuffer + 20)
05:b635 : aa __ __ TAX
05:b636 : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:b639 : a6 5b __ LDX T6 + 0 
05:b63b : 3d c4 ab AND $abc4,x ; (projbuffer + 44)
05:b63e : d0 06 __ BNE $b646 ; (chareditor.s258 + 0)
.s259:
05:b640 : 98 __ __ TYA
05:b641 : 25 60 __ AND T12 + 0 
05:b643 : 4c 49 b6 JMP $b649 ; (chareditor.s1533 + 0)
.s258:
05:b646 : 98 __ __ TYA
05:b647 : 05 59 __ ORA T5 + 0 
.s1533:
05:b649 : a6 55 __ LDX T2 + 0 
05:b64b : e8 __ __ INX
05:b64c : 86 55 __ STX T2 + 0 
05:b64e : 9d ab ab STA $abab,x ; (projbuffer + 19)
05:b651 : e0 08 __ CPX #$08
05:b653 : 90 d6 __ BCC $b62b ; (chareditor.l255 + 0)
.s252:
05:b655 : a6 53 __ LDX T0 + 0 
05:b657 : e8 __ __ INX
05:b658 : e0 08 __ CPX #$08
05:b65a : 90 be __ BCC $b61a ; (chareditor.l251 + 0)
.s253:
05:b65c : a2 00 __ LDX #$00
.l262:
05:b65e : 86 53 __ STX T0 + 0 
05:b660 : bd ac ab LDA $abac,x ; (projbuffer + 20)
05:b663 : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
05:b666 : a8 __ __ TAY
05:b667 : a9 12 __ LDA #$12
05:b669 : 8d 00 d6 STA $d600 
05:b66c : 18 __ __ CLC
05:b66d : a5 56 __ LDA T3 + 0 
05:b66f : 65 53 __ ADC T0 + 0 
05:b671 : aa __ __ TAX
05:b672 : a5 57 __ LDA T3 + 1 
05:b674 : 69 00 __ ADC #$00
.l2139:
05:b676 : 2c 00 d6 BIT $d600 
05:b679 : 10 fb __ BPL $b676 ; (chareditor.l2139 + 0)
.s271:
05:b67b : 8d 01 d6 STA $d601 
05:b67e : a9 13 __ LDA #$13
05:b680 : 8d 00 d6 STA $d600 
.l2141:
05:b683 : 2c 00 d6 BIT $d600 
05:b686 : 10 fb __ BPL $b683 ; (chareditor.l2141 + 0)
.s276:
05:b688 : 8e 01 d6 STX $d601 
05:b68b : a9 1f __ LDA #$1f
05:b68d : 8d 00 d6 STA $d600 
.l2143:
05:b690 : 2c 00 d6 BIT $d600 
05:b693 : 10 fb __ BPL $b690 ; (chareditor.l2143 + 0)
.s280:
05:b695 : 8c 01 d6 STY $d601 
05:b698 : 20 de b6 JSR $b6de ; (charaddress@proxy + 0)
05:b69b : a6 53 __ LDX T0 + 0 
05:b69d : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
05:b6a0 : 85 0f __ STA P2 
05:b6a2 : 18 __ __ CLC
05:b6a3 : a5 1b __ LDA ACCU + 0 
05:b6a5 : 65 53 __ ADC T0 + 0 
05:b6a7 : 85 0d __ STA P0 
05:b6a9 : a5 1c __ LDA ACCU + 1 
05:b6ab : 69 00 __ ADC #$00
05:b6ad : 85 0e __ STA P1 
05:b6af : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
05:b6b2 : a6 53 __ LDX T0 + 0 
05:b6b4 : e8 __ __ INX
05:b6b5 : e0 08 __ CPX #$08
05:b6b7 : 90 a5 __ BCC $b65e ; (chareditor.l262 + 0)
05:b6b9 : 4c 2f af JMP $af2f ; (chareditor.s2280 + 0)
.s1:
05:b6bc : 86 14 __ STX P7 
05:b6be : 86 12 __ STX P5 
05:b6c0 : a9 7f __ LDA #$7f
05:b6c2 : 85 11 __ STA P4 
05:b6c4 : ad bf 87 LDA $87bf ; (vdc_state + 18)
05:b6c7 : 85 0f __ STA P2 
05:b6c9 : ad c0 87 LDA $87c0 ; (vdc_state + 19)
05:b6cc : 85 10 __ STA P3 
05:b6ce : 20 a5 1a JSR $1aa5 ; (bnk_redef_charset@proxy + 0)
05:b6d1 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
05:b6d4 : c9 01 __ CMP #$01
05:b6d6 : f0 03 __ BEQ $b6db ; (chareditor.s1 + 31)
05:b6d8 : 4c 89 ac JMP $ac89 ; (chareditor.s10 + 0)
05:b6db : 4c 67 ac JMP $ac67 ; (chareditor.s8 + 0)
--------------------------------------------------------------------
charaddress@proxy: ; charaddress@proxy
05:b6de : a5 58 __ LDA $58 
05:b6e0 : 85 0d __ STA P0 
05:b6e2 : a5 54 __ LDA $54 
05:b6e4 : 85 0e __ STA P1 
05:b6e6 : a9 01 __ LDA #$01
05:b6e8 : 85 0f __ STA P2 
--------------------------------------------------------------------
charaddress: ; charaddress(u8,u8,u8)->u16
.s0:
05:b6ea : a9 00 __ LDA #$00
05:b6ec : c5 0e __ CMP P1 ; (stdoralt + 0)
05:b6ee : 2a __ __ ROL
05:b6ef : a8 __ __ TAY
05:b6f0 : a5 0f __ LDA P2 ; (vdcormem + 0)
05:b6f2 : f0 1f __ BEQ $b713 ; (charaddress.s1 + 0)
.s2:
05:b6f4 : 98 __ __ TYA
05:b6f5 : f0 04 __ BEQ $b6fb ; (charaddress.s1005 + 0)
.s1006:
05:b6f7 : a9 48 __ LDA #$48
05:b6f9 : 90 02 __ BCC $b6fd ; (charaddress.s1007 + 0)
.s1005:
05:b6fb : a9 50 __ LDA #$50
.s1007:
05:b6fd : 85 1c __ STA ACCU + 1 
05:b6ff : a9 00 __ LDA #$00
05:b701 : 06 0d __ ASL P0 ; (screencode + 0)
05:b703 : 2a __ __ ROL
05:b704 : 06 0d __ ASL P0 ; (screencode + 0)
05:b706 : 2a __ __ ROL
05:b707 : 06 0d __ ASL P0 ; (screencode + 0)
05:b709 : 2a __ __ ROL
05:b70a : 05 1c __ ORA ACCU + 1 
05:b70c : 85 1c __ STA ACCU + 1 
05:b70e : a5 0d __ LDA P0 ; (screencode + 0)
05:b710 : 85 1b __ STA ACCU + 0 
.s1001:
05:b712 : 60 __ __ RTS
.s1:
05:b713 : 98 __ __ TYA
05:b714 : f0 08 __ BEQ $b71e ; (charaddress.s6 + 0)
.s5:
05:b716 : ad be 87 LDA $87be ; (vdc_state + 17)
05:b719 : ac bd 87 LDY $87bd ; (vdc_state + 16)
05:b71c : 90 06 __ BCC $b724 ; (charaddress.s7 + 0)
.s6:
05:b71e : ad c0 87 LDA $87c0 ; (vdc_state + 19)
05:b721 : ac bf 87 LDY $87bf ; (vdc_state + 18)
.s7:
05:b724 : 84 1b __ STY ACCU + 0 
05:b726 : 85 1c __ STA ACCU + 1 
05:b728 : a5 0d __ LDA P0 ; (screencode + 0)
05:b72a : 0a __ __ ASL
05:b72b : 2a __ __ ROL
05:b72c : 2a __ __ ROL
05:b72d : 2a __ __ ROL
05:b72e : a8 __ __ TAY
05:b72f : 29 07 __ AND #$07
05:b731 : 2a __ __ ROL
05:b732 : aa __ __ TAX
05:b733 : 98 __ __ TYA
05:b734 : 29 f0 __ AND #$f0
05:b736 : 65 1b __ ADC ACCU + 0 
05:b738 : 85 1b __ STA ACCU + 0 
05:b73a : 8a __ __ TXA
05:b73b : 65 1c __ ADC ACCU + 1 
05:b73d : 85 1c __ STA ACCU + 1 
05:b73f : 60 __ __ RTS
--------------------------------------------------------------------
05:b740 : __ __ __ BYT 63 48 41 52 45 44 49 54 00                      : cHAREDIT.
--------------------------------------------------------------------
showchareditfield: ; showchareditfield(u8)->void
.s0:
05:b749 : a9 43 __ LDA #$43
05:b74b : 85 18 __ STA P11 
05:b74d : a9 00 __ LDA #$00
05:b74f : 85 17 __ STA P10 
05:b751 : 8d f3 ab STA $abf3 ; (sstack + 0)
05:b754 : a9 0d __ LDA #$0d
05:b756 : 8d f4 ab STA $abf4 ; (sstack + 1)
05:b759 : a9 0c __ LDA #$0c
05:b75b : 8d f5 ab STA $abf5 ; (sstack + 2)
05:b75e : ad f6 ab LDA $abf6 ; (sstack + 3)
05:b761 : 4a __ __ LSR
05:b762 : a9 00 __ LDA #$00
05:b764 : 6a __ __ ROR
05:b765 : 49 ff __ EOR #$ff
05:b767 : 38 __ __ SEC
05:b768 : 6d ff 69 ADC $69ff ; (mc_menupopup + 0)
05:b76b : 8d b4 87 STA $87b4 ; (vdc_state + 7)
05:b76e : 4c 64 36 JMP $3664 ; (vdcwin_win_new.s1000 + 0)
--------------------------------------------------------------------
showchareditgrid: ; showchareditgrid(u16,u8)->void
.s1000:
05:b771 : a2 03 __ LDX #$03
05:b773 : b5 53 __ LDA T5 + 0,x 
05:b775 : 9d cf ab STA $abcf,x ; (buff + 42)
05:b778 : ca __ __ DEX
05:b779 : 10 f8 __ BPL $b773 ; (showchareditgrid.s1000 + 2)
05:b77b : 38 __ __ SEC
05:b77c : a5 23 __ LDA SP + 0 
05:b77e : e9 0a __ SBC #$0a
05:b780 : 85 23 __ STA SP + 0 
05:b782 : b0 02 __ BCS $b786 ; (showchareditgrid.s0 + 0)
05:b784 : c6 24 __ DEC SP + 1 
.s0:
05:b786 : a9 00 __ LDA #$00
05:b788 : 85 0f __ STA P2 
05:b78a : ad f8 ab LDA $abf8 ; (sstack + 5)
05:b78d : 85 4e __ STA T0 + 0 
05:b78f : 85 0d __ STA P0 
05:b791 : ad f9 ab LDA $abf9 ; (sstack + 6)
05:b794 : 85 4f __ STA T0 + 1 
05:b796 : ad fa ab LDA $abfa ; (sstack + 7)
05:b799 : 85 0e __ STA P1 
05:b79b : 20 ea b6 JSR $b6ea ; (charaddress.s0 + 0)
05:b79e : a5 1b __ LDA ACCU + 0 
05:b7a0 : 85 51 __ STA T2 + 0 
05:b7a2 : a5 1c __ LDA ACCU + 1 
05:b7a4 : 85 52 __ STA T2 + 1 
05:b7a6 : a5 4e __ LDA T0 + 0 
05:b7a8 : a0 06 __ LDY #$06
05:b7aa : 91 23 __ STA (SP + 0),y 
05:b7ac : a5 4f __ LDA T0 + 1 
05:b7ae : c8 __ __ INY
05:b7af : 91 23 __ STA (SP + 0),y 
05:b7b1 : a5 0e __ LDA P1 
05:b7b3 : 4a __ __ LSR
05:b7b4 : a9 00 __ LDA #$00
05:b7b6 : 6a __ __ ROR
05:b7b7 : 49 ff __ EOR #$ff
05:b7b9 : 38 __ __ SEC
05:b7ba : 6d ff 69 ADC $69ff ; (mc_menupopup + 0)
05:b7bd : 85 4e __ STA T0 + 0 
05:b7bf : 8d b4 87 STA $87b4 ; (vdc_state + 7)
05:b7c2 : a9 51 __ LDA #$51
05:b7c4 : a0 02 __ LDY #$02
05:b7c6 : 91 23 __ STA (SP + 0),y 
05:b7c8 : a9 89 __ LDA #$89
05:b7ca : c8 __ __ INY
05:b7cb : 91 23 __ STA (SP + 0),y 
05:b7cd : a9 cc __ LDA #$cc
05:b7cf : c8 __ __ INY
05:b7d0 : 91 23 __ STA (SP + 0),y 
05:b7d2 : a9 b8 __ LDA #$b8
05:b7d4 : c8 __ __ INY
05:b7d5 : 91 23 __ STA (SP + 0),y 
05:b7d7 : a5 0e __ LDA P1 
05:b7d9 : f0 07 __ BEQ $b7e2 ; (showchareditgrid.s72 + 0)
.s73:
05:b7db : a9 b8 __ LDA #$b8
05:b7dd : a2 dc __ LDX #$dc
05:b7df : 4c e6 b7 JMP $b7e6 ; (showchareditgrid.s74 + 0)
.s72:
05:b7e2 : a9 b8 __ LDA #$b8
05:b7e4 : a2 d8 __ LDX #$d8
.s74:
05:b7e6 : 85 54 __ STA T5 + 1 
05:b7e8 : 8a __ __ TXA
05:b7e9 : a0 08 __ LDY #$08
05:b7eb : 91 23 __ STA (SP + 0),y 
05:b7ed : a5 54 __ LDA T5 + 1 
05:b7ef : c8 __ __ INY
05:b7f0 : 91 23 __ STA (SP + 0),y 
05:b7f2 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
05:b7f5 : a9 44 __ LDA #$44
05:b7f7 : 85 11 __ STA P4 
05:b7f9 : a9 01 __ LDA #$01
05:b7fb : 85 12 __ STA P5 
05:b7fd : a5 4e __ LDA T0 + 0 
05:b7ff : 85 15 __ STA P8 
05:b801 : 20 d3 80 JSR $80d3 ; (vdc_prints_attr@proxy + 0)
05:b804 : a9 00 __ LDA #$00
05:b806 : 85 50 __ STA T1 + 0 
.l3:
05:b808 : a9 12 __ LDA #$12
05:b80a : 8d 00 d6 STA $d600 
05:b80d : 18 __ __ CLC
05:b80e : a5 50 __ LDA T1 + 0 
05:b810 : 65 51 __ ADC T2 + 0 
05:b812 : aa __ __ TAX
05:b813 : a9 00 __ LDA #$00
05:b815 : 65 52 __ ADC T2 + 1 
.l134:
05:b817 : 2c 00 d6 BIT $d600 
05:b81a : 10 fb __ BPL $b817 ; (showchareditgrid.l134 + 0)
.s12:
05:b81c : 8d 01 d6 STA $d601 
05:b81f : a9 13 __ LDA #$13
05:b821 : 8d 00 d6 STA $d600 
.l136:
05:b824 : 2c 00 d6 BIT $d600 
05:b827 : 10 fb __ BPL $b824 ; (showchareditgrid.l136 + 0)
.s17:
05:b829 : 8e 01 d6 STX $d601 
05:b82c : a9 1f __ LDA #$1f
05:b82e : 8d 00 d6 STA $d600 
.l138:
05:b831 : 2c 00 d6 BIT $d600 
05:b834 : 10 fb __ BPL $b831 ; (showchareditgrid.l138 + 0)
.s21:
05:b836 : ad 01 d6 LDA $d601 
05:b839 : a0 06 __ LDY #$06
05:b83b : 91 23 __ STA (SP + 0),y 
05:b83d : 85 55 __ STA T6 + 0 
05:b83f : a9 51 __ LDA #$51
05:b841 : a0 02 __ LDY #$02
05:b843 : 91 23 __ STA (SP + 0),y 
05:b845 : a9 89 __ LDA #$89
05:b847 : c8 __ __ INY
05:b848 : 91 23 __ STA (SP + 0),y 
05:b84a : a9 e0 __ LDA #$e0
05:b84c : c8 __ __ INY
05:b84d : 91 23 __ STA (SP + 0),y 
05:b84f : a9 b8 __ LDA #$b8
05:b851 : c8 __ __ INY
05:b852 : 91 23 __ STA (SP + 0),y 
05:b854 : a9 00 __ LDA #$00
05:b856 : 85 56 __ STA T7 + 0 
05:b858 : a0 07 __ LDY #$07
05:b85a : 91 23 __ STA (SP + 0),y 
05:b85c : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
05:b85f : a9 44 __ LDA #$44
05:b861 : 85 11 __ STA P4 
05:b863 : a9 51 __ LDA #$51
05:b865 : 85 13 __ STA P6 
05:b867 : a9 89 __ LDA #$89
05:b869 : 85 14 __ STA P7 
05:b86b : 18 __ __ CLC
05:b86c : a5 50 __ LDA T1 + 0 
05:b86e : 69 03 __ ADC #$03
05:b870 : 85 12 __ STA P5 
05:b872 : 20 85 33 JSR $3385 ; (vdc_prints_attr@proxy + 0)
05:b875 : 18 __ __ CLC
05:b876 : a5 50 __ LDA T1 + 0 
05:b878 : 69 03 __ ADC #$03
05:b87a : 85 0e __ STA P1 
05:b87c : a9 20 __ LDA #$20
05:b87e : 85 0f __ STA P2 
05:b880 : 18 __ __ CLC
05:b881 : a9 00 __ LDA #$00
.l26:
05:b883 : 69 47 __ ADC #$47
05:b885 : 85 0d __ STA P0 
05:b887 : 38 __ __ SEC
05:b888 : a9 07 __ LDA #$07
05:b88a : e5 56 __ SBC T7 + 0 
05:b88c : aa __ __ TAX
05:b88d : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:b890 : 25 55 __ AND T6 + 0 
05:b892 : d0 08 __ BNE $b89c ; (showchareditgrid.s29 + 0)
.s30:
05:b894 : a5 4e __ LDA T0 + 0 
05:b896 : 38 __ __ SEC
05:b897 : e9 40 __ SBC #$40
05:b899 : 4c 9e b8 JMP $b89e ; (showchareditgrid.s1012 + 0)
.s29:
05:b89c : a5 4e __ LDA T0 + 0 
.s1012:
05:b89e : 85 10 __ STA P3 
05:b8a0 : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
05:b8a3 : e6 56 __ INC T7 + 0 
05:b8a5 : a5 56 __ LDA T7 + 0 
05:b8a7 : c9 08 __ CMP #$08
05:b8a9 : 90 d8 __ BCC $b883 ; (showchareditgrid.l26 + 0)
.s4:
05:b8ab : e6 50 __ INC T1 + 0 
05:b8ad : a5 50 __ LDA T1 + 0 
05:b8af : c9 08 __ CMP #$08
05:b8b1 : b0 03 __ BCS $b8b6 ; (showchareditgrid.s1001 + 0)
05:b8b3 : 4c 08 b8 JMP $b808 ; (showchareditgrid.l3 + 0)
.s1001:
05:b8b6 : 18 __ __ CLC
05:b8b7 : a5 23 __ LDA SP + 0 
05:b8b9 : 69 0a __ ADC #$0a
05:b8bb : 85 23 __ STA SP + 0 
05:b8bd : 90 02 __ BCC $b8c1 ; (showchareditgrid.s1001 + 11)
05:b8bf : e6 24 __ INC SP + 1 
05:b8c1 : a2 03 __ LDX #$03
05:b8c3 : bd cf ab LDA $abcf,x ; (buff + 42)
05:b8c6 : 95 53 __ STA T5 + 0,x 
05:b8c8 : ca __ __ DEX
05:b8c9 : 10 f8 __ BPL $b8c3 ; (showchareditgrid.s1001 + 13)
05:b8cb : 60 __ __ RTS
--------------------------------------------------------------------
05:b8cc : __ __ __ BYT 63 48 41 52 20 25 32 78 20 25 53 00             : cHAR %2x %S.
--------------------------------------------------------------------
05:b8d8 : __ __ __ BYT 73 54 44 00                                     : sTD.
--------------------------------------------------------------------
05:b8dc : __ __ __ BYT 61 4c 54 00                                     : aLT.
--------------------------------------------------------------------
05:b8e0 : __ __ __ BYT 25 32 78 00                                     : %2x.
--------------------------------------------------------------------
05:b8e4 : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
versioninfo: ; versioninfo()->void
.s1000:
05:b8e9 : 38 __ __ SEC
05:b8ea : a5 23 __ LDA SP + 0 
05:b8ec : e9 08 __ SBC #$08
05:b8ee : 85 23 __ STA SP + 0 
05:b8f0 : b0 02 __ BCS $b8f4 ; (versioninfo.s0 + 0)
05:b8f2 : c6 24 __ DEC SP + 1 
.s0:
05:b8f4 : a9 00 __ LDA #$00
05:b8f6 : 85 17 __ STA P10 
05:b8f8 : a9 05 __ LDA #$05
05:b8fa : 85 18 __ STA P11 
05:b8fc : 8d f3 ab STA $abf3 ; (sstack + 0)
05:b8ff : a9 3c __ LDA #$3c
05:b901 : 8d f4 ab STA $abf4 ; (sstack + 1)
05:b904 : a9 0f __ LDA #$0f
05:b906 : 8d f5 ab STA $abf5 ; (sstack + 2)
05:b909 : ad ff 69 LDA $69ff ; (mc_menupopup + 0)
05:b90c : 8d b4 87 STA $87b4 ; (vdc_state + 7)
05:b90f : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
05:b912 : a9 01 __ LDA #$01
05:b914 : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
05:b917 : a9 06 __ LDA #$06
05:b919 : 85 11 __ STA P4 
05:b91b : 85 12 __ STA P5 
05:b91d : a9 cd __ LDA #$cd
05:b91f : 85 13 __ STA P6 
05:b921 : a9 b9 __ LDA #$b9
05:b923 : 85 14 __ STA P7 
05:b925 : 20 85 33 JSR $3385 ; (vdc_prints_attr@proxy + 0)
05:b928 : a9 00 __ LDA #$00
05:b92a : 20 ed 60 JSR $60ed ; (vdc_underline.s0 + 0)
05:b92d : a9 08 __ LDA #$08
05:b92f : 85 12 __ STA P5 
05:b931 : a9 ed __ LDA #$ed
05:b933 : 85 13 __ STA P6 
05:b935 : a9 b9 __ LDA #$b9
05:b937 : 85 14 __ STA P7 
05:b939 : ad b4 87 LDA $87b4 ; (vdc_state + 7)
05:b93c : 85 15 __ STA P8 
05:b93e : 85 52 __ STA T0 + 0 
05:b940 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
05:b943 : e6 12 __ INC P5 
05:b945 : a9 00 __ LDA #$00
05:b947 : 85 13 __ STA P6 
05:b949 : a9 ba __ LDA #$ba
05:b94b : 85 14 __ STA P7 
05:b94d : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
05:b950 : a9 51 __ LDA #$51
05:b952 : a0 02 __ LDY #$02
05:b954 : 91 23 __ STA (SP + 0),y 
05:b956 : a9 89 __ LDA #$89
05:b958 : c8 __ __ INY
05:b959 : 91 23 __ STA (SP + 0),y 
05:b95b : a9 1e __ LDA #$1e
05:b95d : c8 __ __ INY
05:b95e : 91 23 __ STA (SP + 0),y 
05:b960 : a9 ba __ LDA #$ba
05:b962 : c8 __ __ INY
05:b963 : 91 23 __ STA (SP + 0),y 
05:b965 : a9 2a __ LDA #$2a
05:b967 : c8 __ __ INY
05:b968 : 91 23 __ STA (SP + 0),y 
05:b96a : a9 ba __ LDA #$ba
05:b96c : c8 __ __ INY
05:b96d : 91 23 __ STA (SP + 0),y 
05:b96f : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
05:b972 : a9 06 __ LDA #$06
05:b974 : 85 11 __ STA P4 
05:b976 : a9 0b __ LDA #$0b
05:b978 : 85 12 __ STA P5 
05:b97a : a5 52 __ LDA T0 + 0 
05:b97c : 85 15 __ STA P8 
05:b97e : 20 d3 80 JSR $80d3 ; (vdc_prints_attr@proxy + 0)
05:b981 : a9 0d __ LDA #$0d
05:b983 : 85 12 __ STA P5 
05:b985 : a9 3c __ LDA #$3c
05:b987 : 85 13 __ STA P6 
05:b989 : a9 ba __ LDA #$ba
05:b98b : 85 14 __ STA P7 
05:b98d : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
05:b990 : e6 12 __ INC P5 
05:b992 : a9 6c __ LDA #$6c
05:b994 : 85 13 __ STA P6 
05:b996 : a9 ba __ LDA #$ba
05:b998 : 85 14 __ STA P7 
05:b99a : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
05:b99d : a9 10 __ LDA #$10
05:b99f : 85 12 __ STA P5 
05:b9a1 : a9 97 __ LDA #$97
05:b9a3 : 85 13 __ STA P6 
05:b9a5 : a9 ba __ LDA #$ba
05:b9a7 : 85 14 __ STA P7 
05:b9a9 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
05:b9ac : a9 12 __ LDA #$12
05:b9ae : 85 12 __ STA P5 
05:b9b0 : a9 b4 __ LDA #$b4
05:b9b2 : 85 13 __ STA P6 
05:b9b4 : a9 ba __ LDA #$ba
05:b9b6 : 85 14 __ STA P7 
05:b9b8 : 20 3f 34 JSR $343f ; (vdc_prints_attr.s0 + 0)
05:b9bb : 20 d0 2d JSR $2dd0 ; (getch.s0 + 0)
05:b9be : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
.s1001:
05:b9c1 : 18 __ __ CLC
05:b9c2 : a5 23 __ LDA SP + 0 
05:b9c4 : 69 08 __ ADC #$08
05:b9c6 : 85 23 __ STA SP + 0 
05:b9c8 : 90 02 __ BCC $b9cc ; (versioninfo.s1001 + 11)
05:b9ca : e6 24 __ INC SP + 1 
05:b9cc : 60 __ __ RTS
--------------------------------------------------------------------
05:b9cd : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
05:b9dd : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
05:b9ed : __ __ __ BYT 76 64 63 20 73 43 52 45 45 4e 20 65 44 49 54 4f : vdc sCREEN eDITO
05:b9fd : __ __ __ BYT 52 00                                           : R.
--------------------------------------------------------------------
05:ba00 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
05:ba10 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
05:ba1e : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
05:ba2a : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 30 39 2d 31 38 32 : V20-20240409-182
05:ba3a : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
05:ba3c : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
05:ba4c : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
05:ba5c : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
05:ba6c : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
05:ba7c : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 76 64 63 73 43 52 : OM/XAHMOL/vdcsCR
05:ba8c : __ __ __ BYT 45 45 4e 65 44 49 54 4f 52 32 00                : EENeDITOR2.
--------------------------------------------------------------------
05:ba97 : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
05:baa7 : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
05:bab4 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
05:bac4 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
import_prg: ; import_prg()->void
.s0:
06:ac00 : a9 00 __ LDA #$00
06:ac02 : 8d fd ab STA $abfd ; (sstack + 10)
06:ac05 : a9 81 __ LDA #$81
06:ac07 : 8d fe ab STA $abfe ; (sstack + 11)
06:ac0a : a9 ac __ LDA #$ac
06:ac0c : 8d ff ab STA $abff ; (sstack + 12)
06:ac0f : 20 4d 72 JSR $724d ; (import_dialogue.s1000 + 0)
06:ac12 : a5 1b __ LDA ACCU + 0 
06:ac14 : f0 67 __ BEQ $ac7d ; (import_prg.s1001 + 0)
.s1:
06:ac16 : ad fe 69 LDA $69fe ; (undoenabled + 0)
06:ac19 : c9 01 __ CMP #$01
06:ac1b : d0 18 __ BNE $ac35 ; (import_prg.s6 + 0)
.s4:
06:ac1d : ad 53 8b LDA $8b53 ; (importvars + 2)
06:ac20 : 85 16 __ STA P9 
06:ac22 : ad 51 8b LDA $8b51 ; (importvars + 0)
06:ac25 : 85 17 __ STA P10 
06:ac27 : ad 55 8b LDA $8b55 ; (importvars + 4)
06:ac2a : 85 18 __ STA P11 
06:ac2c : ad 57 8b LDA $8b57 ; (importvars + 6)
06:ac2f : 8d f3 ab STA $abf3 ; (sstack + 0)
06:ac32 : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s6:
06:ac35 : 20 10 82 JSR $8210 ; (vdc_clear@proxy + 0)
06:ac38 : ad ac 87 LDA $87ac ; (targetdevice + 0)
06:ac3b : 8d f8 ab STA $abf8 ; (sstack + 5)
06:ac3e : a9 97 __ LDA #$97
06:ac40 : 8d f9 ab STA $abf9 ; (sstack + 6)
06:ac43 : a9 87 __ LDA #$87
06:ac45 : 8d fa ab STA $abfa ; (sstack + 7)
06:ac48 : 20 8c ac JSR $ac8c ; (importread.s1000 + 0)
06:ac4b : a5 1b __ LDA ACCU + 0 
06:ac4d : f0 03 __ BEQ $ac52 ; (import_prg.s9 + 0)
.s7:
06:ac4f : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s9:
06:ac52 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
06:ac55 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
06:ac58 : 20 18 3d JSR $3d18 ; (placesignature.s1000 + 0)
06:ac5b : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
06:ac5e : a9 00 __ LDA #$00
06:ac60 : 85 17 __ STA P10 
06:ac62 : 85 18 __ STA P11 
06:ac64 : 8d f3 ab STA $abf3 ; (sstack + 0)
06:ac67 : a9 01 __ LDA #$01
06:ac69 : 8d f5 ab STA $abf5 ; (sstack + 2)
06:ac6c : ad b0 87 LDA $87b0 ; (vdc_state + 3)
06:ac6f : 8d f4 ab STA $abf4 ; (sstack + 1)
06:ac72 : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
06:ac75 : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
06:ac78 : ad ff 87 LDA $87ff ; (showbar + 0)
06:ac7b : d0 01 __ BNE $ac7e ; (import_prg.s10 + 0)
.s1001:
06:ac7d : 60 __ __ RTS
.s10:
06:ac7e : 4c d4 3e JMP $3ed4 ; (initstatusbar.s1000 + 0)
--------------------------------------------------------------------
06:ac81 : __ __ __ BYT 69 4d 50 4f 52 54 20 70 72 67 00                : iMPORT prg.
--------------------------------------------------------------------
importread: ; importread(u8,const u8*)->u8
.s1000:
06:ac8c : a2 05 __ LDX #$05
06:ac8e : b5 53 __ LDA T5 + 0,x 
06:ac90 : 9d bf ab STA $abbf,x ; (projbuffer + 39)
06:ac93 : ca __ __ DEX
06:ac94 : 10 f8 __ BPL $ac8e ; (importread.s1000 + 2)
06:ac96 : 38 __ __ SEC
06:ac97 : a5 23 __ LDA SP + 0 
06:ac99 : e9 0c __ SBC #$0c
06:ac9b : 85 23 __ STA SP + 0 
06:ac9d : b0 02 __ BCS $aca1 ; (importread.s0 + 0)
06:ac9f : c6 24 __ DEC SP + 1 
.s0:
06:aca1 : a2 10 __ LDX #$10
.l1002:
06:aca3 : bd 88 b1 LDA $b188,x 
06:aca6 : 9d c5 ab STA $abc5,x ; (projbuffer + 45)
06:aca9 : ca __ __ DEX
06:acaa : d0 f7 __ BNE $aca3 ; (importread.l1002 + 0)
.s1003:
06:acac : a9 00 __ LDA #$00
06:acae : a0 02 __ LDY #$02
06:acb0 : 91 23 __ STA (SP + 0),y 
06:acb2 : a9 89 __ LDA #$89
06:acb4 : c8 __ __ INY
06:acb5 : 91 23 __ STA (SP + 0),y 
06:acb7 : a9 df __ LDA #$df
06:acb9 : c8 __ __ INY
06:acba : 91 23 __ STA (SP + 0),y 
06:acbc : a9 b0 __ LDA #$b0
06:acbe : c8 __ __ INY
06:acbf : 91 23 __ STA (SP + 0),y 
06:acc1 : ad f9 ab LDA $abf9 ; (sstack + 6)
06:acc4 : c8 __ __ INY
06:acc5 : 91 23 __ STA (SP + 0),y 
06:acc7 : ad fa ab LDA $abfa ; (sstack + 7)
06:acca : c8 __ __ INY
06:accb : 91 23 __ STA (SP + 0),y 
06:accd : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
06:acd0 : a9 00 __ LDA #$00
06:acd2 : 85 0d __ STA P0 
06:acd4 : 85 0e __ STA P1 
06:acd6 : 20 b6 2a JSR $2ab6 ; (krnio_setbnk.s0 + 0)
06:acd9 : 20 bd 2a JSR $2abd ; (krnio_setnam@proxy + 0)
06:acdc : ad f8 ab LDA $abf8 ; (sstack + 5)
06:acdf : 85 0e __ STA P1 
06:ace1 : 20 55 63 JSR $6355 ; (krnio_open@proxy + 0)
06:ace4 : 09 00 __ ORA #$00
06:ace6 : d0 05 __ BNE $aced ; (importread.s1 + 0)
.s3:
06:ace8 : a9 00 __ LDA #$00
06:acea : 4c 18 b0 JMP $b018 ; (importread.s1001 + 0)
.s1:
06:aced : ad 5f 8b LDA $8b5f ; (importvars + 14)
06:acf0 : c9 01 __ CMP #$01
06:acf2 : f0 04 __ BEQ $acf8 ; (importread.s4 + 0)
.s169:
06:acf4 : a9 08 __ LDA #$08
06:acf6 : d0 37 __ BNE $ad2f ; (importread.s6 + 0)
.s4:
06:acf8 : a9 e6 __ LDA #$e6
06:acfa : 85 13 __ STA P6 
06:acfc : a9 b0 __ LDA #$b0
06:acfe : 85 14 __ STA P7 
06:ad00 : 20 02 81 JSR $8102 ; (vdc_prints_attr@proxy + 0)
06:ad03 : a9 01 __ LDA #$01
06:ad05 : 85 0e __ STA P1 
06:ad07 : a9 02 __ LDA #$02
06:ad09 : 85 11 __ STA P4 
06:ad0b : a9 00 __ LDA #$00
06:ad0d : 85 12 __ STA P5 
06:ad0f : a9 d6 __ LDA #$d6
06:ad11 : 85 0f __ STA P2 
06:ad13 : a9 ab __ LDA #$ab
06:ad15 : 85 10 __ STA P3 
06:ad17 : 20 87 63 JSR $6387 ; (krnio_read.s0 + 0)
06:ad1a : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
06:ad1d : 85 51 __ STA T2 + 0 
06:ad1f : 09 00 __ ORA #$00
06:ad21 : f0 0a __ BEQ $ad2d ; (importread.s170 + 0)
.s8:
06:ad23 : a9 01 __ LDA #$01
06:ad25 : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
06:ad28 : a5 51 __ LDA T2 + 0 
06:ad2a : 4c 18 b0 JMP $b018 ; (importread.s1001 + 0)
.s170:
06:ad2d : a9 09 __ LDA #$09
.s6:
06:ad2f : 85 51 __ STA T2 + 0 
06:ad31 : ad 5d 8b LDA $8b5d ; (importvars + 12)
06:ad34 : c9 03 __ CMP #$03
06:ad36 : b0 10 __ BCS $ad48 ; (importread.s14 + 0)
.s12:
06:ad38 : ad 57 8b LDA $8b57 ; (importvars + 6)
06:ad3b : 0d 58 8b ORA $8b58 ; (importvars + 7)
06:ad3e : f0 03 __ BEQ $ad43 ; (importread.s20 + 0)
06:ad40 : 4c 30 b0 JMP $b030 ; (importread.s93 + 0)
.s20:
06:ad43 : e6 51 __ INC T2 + 0 
06:ad45 : ad 5d 8b LDA $8b5d ; (importvars + 12)
.s14:
06:ad48 : c9 01 __ CMP #$01
06:ad4a : f0 03 __ BEQ $ad4f ; (importread.s32 + 0)
06:ad4c : 4c e5 ad JMP $ade5 ; (importread.s223 + 0)
.s32:
06:ad4f : ad 62 8b LDA $8b62 ; (importvars + 17)
06:ad52 : 85 4f __ STA T0 + 1 
06:ad54 : ad 61 8b LDA $8b61 ; (importvars + 16)
06:ad57 : 85 4e __ STA T0 + 0 
06:ad59 : 05 4f __ ORA T0 + 1 
06:ad5b : d0 03 __ BNE $ad60 ; (importread.s29 + 0)
06:ad5d : 4c e5 ad JMP $ade5 ; (importread.s223 + 0)
.s29:
06:ad60 : a9 01 __ LDA #$01
06:ad62 : 20 ff 63 JSR $63ff ; (krnio_chkin.s1000 + 0)
06:ad65 : 09 00 __ ORA #$00
06:ad67 : d0 0a __ BNE $ad73 ; (importread.s33 + 0)
.s34:
06:ad69 : a9 01 __ LDA #$01
06:ad6b : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
06:ad6e : a9 01 __ LDA #$01
06:ad70 : 4c 18 b0 JMP $b018 ; (importread.s1001 + 0)
.s33:
06:ad73 : a5 4e __ LDA T0 + 0 
06:ad75 : 05 4f __ ORA T0 + 1 
06:ad77 : f0 67 __ BEQ $ade0 ; (importread.s39 + 0)
.s92:
06:ad79 : a2 00 __ LDX #$00
06:ad7b : 86 4f __ STX T0 + 1 
.l37:
06:ad7d : a9 00 __ LDA #$00
06:ad7f : a0 02 __ LDY #$02
06:ad81 : 91 23 __ STA (SP + 0),y 
06:ad83 : a9 89 __ LDA #$89
06:ad85 : c8 __ __ INY
06:ad86 : 91 23 __ STA (SP + 0),y 
06:ad88 : a9 24 __ LDA #$24
06:ad8a : c8 __ __ INY
06:ad8b : 91 23 __ STA (SP + 0),y 
06:ad8d : a9 b1 __ LDA #$b1
06:ad8f : c8 __ __ INY
06:ad90 : 91 23 __ STA (SP + 0),y 
06:ad92 : 8a __ __ TXA
06:ad93 : 18 __ __ CLC
06:ad94 : 69 01 __ ADC #$01
06:ad96 : 85 53 __ STA T5 + 0 
06:ad98 : c8 __ __ INY
06:ad99 : 91 23 __ STA (SP + 0),y 
06:ad9b : a5 4f __ LDA T0 + 1 
06:ad9d : 69 00 __ ADC #$00
06:ad9f : 85 54 __ STA T5 + 1 
06:ada1 : c8 __ __ INY
06:ada2 : 91 23 __ STA (SP + 0),y 
06:ada4 : ad 61 8b LDA $8b61 ; (importvars + 16)
06:ada7 : c8 __ __ INY
06:ada8 : 91 23 __ STA (SP + 0),y 
06:adaa : ad 62 8b LDA $8b62 ; (importvars + 17)
06:adad : c8 __ __ INY
06:adae : 91 23 __ STA (SP + 0),y 
06:adb0 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
06:adb3 : 20 ea 80 JSR $80ea ; (vdc_prints_attr@proxy + 0)
06:adb6 : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
06:adb9 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
06:adbc : c9 40 __ CMP #$40
06:adbe : f0 10 __ BEQ $add0 ; (importread.s38 + 0)
.s43:
06:adc0 : 85 52 __ STA T3 + 0 
06:adc2 : 09 00 __ ORA #$00
06:adc4 : f0 0a __ BEQ $add0 ; (importread.s38 + 0)
.s25:
06:adc6 : a9 01 __ LDA #$01
06:adc8 : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
06:adcb : a5 52 __ LDA T3 + 0 
06:adcd : 4c 18 b0 JMP $b018 ; (importread.s1001 + 0)
.s38:
06:add0 : a5 54 __ LDA T5 + 1 
06:add2 : 85 4f __ STA T0 + 1 
06:add4 : a6 53 __ LDX T5 + 0 
06:add6 : cd 62 8b CMP $8b62 ; (importvars + 17)
06:add9 : d0 03 __ BNE $adde ; (importread.s1025 + 0)
.s1024:
06:addb : ec 61 8b CPX $8b61 ; (importvars + 16)
.s1025:
06:adde : 90 9d __ BCC $ad7d ; (importread.l37 + 0)
.s39:
06:ade0 : 20 1d 64 JSR $641d ; (krnio_clrchn.s0 + 0)
06:ade3 : e6 51 __ INC T2 + 0 
.s223:
06:ade5 : ad 5d 8b LDA $8b5d ; (importvars + 12)
06:ade8 : c9 01 __ CMP #$01
06:adea : f0 04 __ BEQ $adf0 ; (importread.s49 + 0)
.s52:
06:adec : c9 03 __ CMP #$03
06:adee : d0 0b __ BNE $adfb ; (importread.s51 + 0)
.s49:
06:adf0 : ad 57 8b LDA $8b57 ; (importvars + 6)
06:adf3 : 0d 58 8b ORA $8b58 ; (importvars + 7)
06:adf6 : f0 03 __ BEQ $adfb ; (importread.s51 + 0)
06:adf8 : 4c 41 af JMP $af41 ; (importread.s91 + 0)
.s51:
06:adfb : a9 01 __ LDA #$01
06:adfd : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
06:ae00 : e6 51 __ INC T2 + 0 
06:ae02 : ad 5e 8b LDA $8b5e ; (importvars + 13)
06:ae05 : c9 01 __ CMP #$01
06:ae07 : f0 0a __ BEQ $ae13 ; (importread.s67 + 0)
.s70:
06:ae09 : ad 60 8b LDA $8b60 ; (importvars + 15)
06:ae0c : c9 02 __ CMP #$02
06:ae0e : f0 03 __ BEQ $ae13 ; (importread.s67 + 0)
06:ae10 : 4c e8 ac JMP $ace8 ; (importread.s3 + 0)
.s67:
06:ae13 : ad 57 8b LDA $8b57 ; (importvars + 6)
06:ae16 : 0d 58 8b ORA $8b58 ; (importvars + 7)
06:ae19 : d0 03 __ BNE $ae1e ; (importread.s90 + 0)
06:ae1b : 4c e8 ac JMP $ace8 ; (importread.s3 + 0)
.s90:
06:ae1e : a9 00 __ LDA #$00
06:ae20 : 85 4e __ STA T0 + 0 
06:ae22 : 85 4f __ STA T0 + 1 
.l72:
06:ae24 : a9 00 __ LDA #$00
06:ae26 : a0 02 __ LDY #$02
06:ae28 : 91 23 __ STA (SP + 0),y 
06:ae2a : a9 89 __ LDA #$89
06:ae2c : c8 __ __ INY
06:ae2d : 91 23 __ STA (SP + 0),y 
06:ae2f : a9 67 __ LDA #$67
06:ae31 : c8 __ __ INY
06:ae32 : 91 23 __ STA (SP + 0),y 
06:ae34 : a9 b1 __ LDA #$b1
06:ae36 : c8 __ __ INY
06:ae37 : 91 23 __ STA (SP + 0),y 
06:ae39 : ad 53 8b LDA $8b53 ; (importvars + 2)
06:ae3c : 18 __ __ CLC
06:ae3d : 65 4e __ ADC T0 + 0 
06:ae3f : 85 03 __ STA WORK + 0 
06:ae41 : ad 54 8b LDA $8b54 ; (importvars + 3)
06:ae44 : 65 4f __ ADC T0 + 1 
06:ae46 : 85 04 __ STA WORK + 1 
06:ae48 : ad c9 87 LDA $87c9 ; (canvas + 3)
06:ae4b : 85 1b __ STA ACCU + 0 
06:ae4d : ad ca 87 LDA $87ca ; (canvas + 4)
06:ae50 : 85 1c __ STA ACCU + 1 
06:ae52 : 20 87 7c JSR $7c87 ; (mul16 + 0)
06:ae55 : 18 __ __ CLC
06:ae56 : a5 06 __ LDA WORK + 3 
06:ae58 : 69 58 __ ADC #$58
06:ae5a : aa __ __ TAX
06:ae5b : ad 51 8b LDA $8b51 ; (importvars + 0)
06:ae5e : 18 __ __ CLC
06:ae5f : 65 05 __ ADC WORK + 2 
06:ae61 : 85 55 __ STA T6 + 0 
06:ae63 : 8a __ __ TXA
06:ae64 : 6d 52 8b ADC $8b52 ; (importvars + 1)
06:ae67 : 85 56 __ STA T6 + 1 
06:ae69 : ad cb 87 LDA $87cb ; (canvas + 5)
06:ae6c : 85 1b __ STA ACCU + 0 
06:ae6e : ad cc 87 LDA $87cc ; (canvas + 6)
06:ae71 : 85 1c __ STA ACCU + 1 
06:ae73 : ad c9 87 LDA $87c9 ; (canvas + 3)
06:ae76 : 85 03 __ STA WORK + 0 
06:ae78 : ad ca 87 LDA $87ca ; (canvas + 4)
06:ae7b : 85 04 __ STA WORK + 1 
06:ae7d : 20 87 7c JSR $7c87 ; (mul16 + 0)
06:ae80 : 18 __ __ CLC
06:ae81 : a5 05 __ LDA WORK + 2 
06:ae83 : 65 55 __ ADC T6 + 0 
06:ae85 : aa __ __ TAX
06:ae86 : a5 06 __ LDA WORK + 3 
06:ae88 : 65 56 __ ADC T6 + 1 
06:ae8a : 85 56 __ STA T6 + 1 
06:ae8c : 8a __ __ TXA
06:ae8d : 18 __ __ CLC
06:ae8e : 69 30 __ ADC #$30
06:ae90 : 85 55 __ STA T6 + 0 
06:ae92 : a0 0a __ LDY #$0a
06:ae94 : 91 23 __ STA (SP + 0),y 
06:ae96 : a5 56 __ LDA T6 + 1 
06:ae98 : 69 00 __ ADC #$00
06:ae9a : 85 56 __ STA T6 + 1 
06:ae9c : c8 __ __ INY
06:ae9d : 91 23 __ STA (SP + 0),y 
06:ae9f : 18 __ __ CLC
06:aea0 : a5 4e __ LDA T0 + 0 
06:aea2 : 69 01 __ ADC #$01
06:aea4 : a0 06 __ LDY #$06
06:aea6 : 91 23 __ STA (SP + 0),y 
06:aea8 : a5 4f __ LDA T0 + 1 
06:aeaa : 69 00 __ ADC #$00
06:aeac : c8 __ __ INY
06:aead : 91 23 __ STA (SP + 0),y 
06:aeaf : ad 57 8b LDA $8b57 ; (importvars + 6)
06:aeb2 : c8 __ __ INY
06:aeb3 : 91 23 __ STA (SP + 0),y 
06:aeb5 : ad 58 8b LDA $8b58 ; (importvars + 7)
06:aeb8 : c8 __ __ INY
06:aeb9 : 91 23 __ STA (SP + 0),y 
06:aebb : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
06:aebe : 20 ea 80 JSR $80ea ; (vdc_prints_attr@proxy + 0)
06:aec1 : ad 55 8b LDA $8b55 ; (importvars + 4)
06:aec4 : 0d 56 8b ORA $8b56 ; (importvars + 5)
06:aec7 : f0 08 __ BEQ $aed1 ; (importread.s73 + 0)
.s89:
06:aec9 : a9 00 __ LDA #$00
06:aecb : 85 57 __ STA T7 + 0 
06:aecd : 85 58 __ STA T7 + 1 
06:aecf : f0 1a __ BEQ $aeeb ; (importread.l79 + 0)
.s73:
06:aed1 : e6 4e __ INC T0 + 0 
06:aed3 : d0 02 __ BNE $aed7 ; (importread.s1046 + 0)
.s1045:
06:aed5 : e6 4f __ INC T0 + 1 
.s1046:
06:aed7 : a5 4f __ LDA T0 + 1 
06:aed9 : cd 58 8b CMP $8b58 ; (importvars + 7)
06:aedc : d0 05 __ BNE $aee3 ; (importread.s1005 + 0)
.s1004:
06:aede : a5 4e __ LDA T0 + 0 
06:aee0 : cd 57 8b CMP $8b57 ; (importvars + 6)
.s1005:
06:aee3 : b0 03 __ BCS $aee8 ; (importread.s1005 + 5)
06:aee5 : 4c 24 ae JMP $ae24 ; (importread.l72 + 0)
06:aee8 : 4c e8 ac JMP $ace8 ; (importread.s3 + 0)
.l79:
06:aeeb : a9 7f __ LDA #$7f
06:aeed : 85 0d __ STA P0 
06:aeef : a5 55 __ LDA T6 + 0 
06:aef1 : 85 0e __ STA P1 
06:aef3 : a5 56 __ LDA T6 + 1 
06:aef5 : 85 0f __ STA P2 
06:aef7 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
06:aefa : aa __ __ TAX
06:aefb : a5 0e __ LDA P1 
06:aefd : 85 0d __ STA P0 
06:aeff : a5 0f __ LDA P2 
06:af01 : 85 0e __ STA P1 
06:af03 : ad 5e 8b LDA $8b5e ; (importvars + 13)
06:af06 : c9 01 __ CMP #$01
06:af08 : d0 07 __ BNE $af11 ; (importread.s231 + 0)
.s82:
06:af0a : 8a __ __ TXA
06:af0b : 29 0f __ AND #$0f
06:af0d : a8 __ __ TAY
06:af0e : be c6 ab LDX $abc6,y ; (buff + 33)
.s231:
06:af11 : ad 60 8b LDA $8b60 ; (importvars + 15)
06:af14 : c9 02 __ CMP #$02
06:af16 : f0 04 __ BEQ $af1c ; (importread.s85 + 0)
.s87:
06:af18 : 8a __ __ TXA
06:af19 : 4c 1f af JMP $af1f ; (importread.s1038 + 0)
.s85:
06:af1c : 8a __ __ TXA
06:af1d : 09 80 __ ORA #$80
.s1038:
06:af1f : 85 0f __ STA P2 
06:af21 : 20 14 15 JSR $1514 ; (bnk_writeb.s0 + 0)
06:af24 : e6 55 __ INC T6 + 0 
06:af26 : d0 02 __ BNE $af2a ; (importread.s1042 + 0)
.s1041:
06:af28 : e6 56 __ INC T6 + 1 
.s1042:
06:af2a : e6 57 __ INC T7 + 0 
06:af2c : d0 02 __ BNE $af30 ; (importread.s1044 + 0)
.s1043:
06:af2e : e6 58 __ INC T7 + 1 
.s1044:
06:af30 : a5 58 __ LDA T7 + 1 
06:af32 : cd 56 8b CMP $8b56 ; (importvars + 5)
06:af35 : d0 05 __ BNE $af3c ; (importread.s1007 + 0)
.s1006:
06:af37 : a5 57 __ LDA T7 + 0 
06:af39 : cd 55 8b CMP $8b55 ; (importvars + 4)
.s1007:
06:af3c : 90 ad __ BCC $aeeb ; (importread.l79 + 0)
06:af3e : 4c d1 ae JMP $aed1 ; (importread.s73 + 0)
.s91:
06:af41 : ad 53 8b LDA $8b53 ; (importvars + 2)
06:af44 : 85 03 __ STA WORK + 0 
06:af46 : ad 54 8b LDA $8b54 ; (importvars + 3)
06:af49 : 85 04 __ STA WORK + 1 
06:af4b : ad c9 87 LDA $87c9 ; (canvas + 3)
06:af4e : 85 1b __ STA ACCU + 0 
06:af50 : ad ca 87 LDA $87ca ; (canvas + 4)
06:af53 : 85 1c __ STA ACCU + 1 
06:af55 : 20 87 7c JSR $7c87 ; (mul16 + 0)
06:af58 : 18 __ __ CLC
06:af59 : a5 06 __ LDA WORK + 3 
06:af5b : 69 58 __ ADC #$58
06:af5d : aa __ __ TAX
06:af5e : ad 51 8b LDA $8b51 ; (importvars + 0)
06:af61 : 18 __ __ CLC
06:af62 : 65 05 __ ADC WORK + 2 
06:af64 : 85 4e __ STA T0 + 0 
06:af66 : 8a __ __ TXA
06:af67 : 6d 52 8b ADC $8b52 ; (importvars + 1)
06:af6a : 85 4f __ STA T0 + 1 
06:af6c : ad cb 87 LDA $87cb ; (canvas + 5)
06:af6f : 85 1b __ STA ACCU + 0 
06:af71 : ad cc 87 LDA $87cc ; (canvas + 6)
06:af74 : 85 1c __ STA ACCU + 1 
06:af76 : ad c9 87 LDA $87c9 ; (canvas + 3)
06:af79 : 85 03 __ STA WORK + 0 
06:af7b : ad ca 87 LDA $87ca ; (canvas + 4)
06:af7e : 85 04 __ STA WORK + 1 
06:af80 : 20 87 7c JSR $7c87 ; (mul16 + 0)
06:af83 : 18 __ __ CLC
06:af84 : a5 05 __ LDA WORK + 2 
06:af86 : 65 4e __ ADC T0 + 0 
06:af88 : aa __ __ TAX
06:af89 : a5 06 __ LDA WORK + 3 
06:af8b : 65 4f __ ADC T0 + 1 
06:af8d : a8 __ __ TAY
06:af8e : 8a __ __ TXA
06:af8f : 18 __ __ CLC
06:af90 : 69 30 __ ADC #$30
06:af92 : 85 4e __ STA T0 + 0 
06:af94 : 90 01 __ BCC $af97 ; (importread.s1040 + 0)
.s1039:
06:af96 : c8 __ __ INY
.s1040:
06:af97 : 84 4f __ STY T0 + 1 
06:af99 : a9 00 __ LDA #$00
06:af9b : 85 50 __ STA T1 + 0 
.l56:
06:af9d : a5 4e __ LDA T0 + 0 
06:af9f : a0 0a __ LDY #$0a
06:afa1 : 91 23 __ STA (SP + 0),y 
06:afa3 : a5 4f __ LDA T0 + 1 
06:afa5 : c8 __ __ INY
06:afa6 : 91 23 __ STA (SP + 0),y 
06:afa8 : a9 00 __ LDA #$00
06:afaa : a0 02 __ LDY #$02
06:afac : 91 23 __ STA (SP + 0),y 
06:afae : a9 89 __ LDA #$89
06:afb0 : c8 __ __ INY
06:afb1 : 91 23 __ STA (SP + 0),y 
06:afb3 : a9 42 __ LDA #$42
06:afb5 : c8 __ __ INY
06:afb6 : 91 23 __ STA (SP + 0),y 
06:afb8 : a9 b1 __ LDA #$b1
06:afba : c8 __ __ INY
06:afbb : 91 23 __ STA (SP + 0),y 
06:afbd : 18 __ __ CLC
06:afbe : a5 50 __ LDA T1 + 0 
06:afc0 : 69 01 __ ADC #$01
06:afc2 : c8 __ __ INY
06:afc3 : 91 23 __ STA (SP + 0),y 
06:afc5 : a9 00 __ LDA #$00
06:afc7 : 2a __ __ ROL
06:afc8 : c8 __ __ INY
06:afc9 : 91 23 __ STA (SP + 0),y 
06:afcb : ad 57 8b LDA $8b57 ; (importvars + 6)
06:afce : c8 __ __ INY
06:afcf : 91 23 __ STA (SP + 0),y 
06:afd1 : ad 58 8b LDA $8b58 ; (importvars + 7)
06:afd4 : c8 __ __ INY
06:afd5 : 91 23 __ STA (SP + 0),y 
06:afd7 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
06:afda : 20 ea 80 JSR $80ea ; (vdc_prints_attr@proxy + 0)
06:afdd : 20 83 19 JSR $1983 ; (bnk_io_read@proxy + 0)
06:afe0 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
06:afe3 : c9 40 __ CMP #$40
06:afe5 : f0 29 __ BEQ $b010 ; (importread.s60 + 0)
.s62:
06:afe7 : 85 52 __ STA T3 + 0 
06:afe9 : 09 00 __ ORA #$00
06:afeb : f0 03 __ BEQ $aff0 ; (importread.s65 + 0)
06:afed : 4c c6 ad JMP $adc6 ; (importread.s25 + 0)
.s65:
06:aff0 : 18 __ __ CLC
06:aff1 : a5 4e __ LDA T0 + 0 
06:aff3 : 6d c9 87 ADC $87c9 ; (canvas + 3)
06:aff6 : 85 4e __ STA T0 + 0 
06:aff8 : a5 0f __ LDA P2 
06:affa : 6d ca 87 ADC $87ca ; (canvas + 4)
06:affd : 85 4f __ STA T0 + 1 
06:afff : e6 50 __ INC T1 + 0 
06:b001 : ad 58 8b LDA $8b58 ; (importvars + 7)
06:b004 : d0 97 __ BNE $af9d ; (importread.l56 + 0)
.s1016:
06:b006 : a5 50 __ LDA T1 + 0 
06:b008 : cd 57 8b CMP $8b57 ; (importvars + 6)
06:b00b : 90 90 __ BCC $af9d ; (importread.l56 + 0)
06:b00d : 4c fb ad JMP $adfb ; (importread.s51 + 0)
.s60:
06:b010 : ad 57 8b LDA $8b57 ; (importvars + 6)
06:b013 : 85 50 __ STA T1 + 0 
06:b015 : 4c f0 af JMP $aff0 ; (importread.s65 + 0)
.s1001:
06:b018 : 85 1b __ STA ACCU + 0 
06:b01a : 18 __ __ CLC
06:b01b : a5 23 __ LDA SP + 0 
06:b01d : 69 0c __ ADC #$0c
06:b01f : 85 23 __ STA SP + 0 
06:b021 : 90 02 __ BCC $b025 ; (importread.s1001 + 13)
06:b023 : e6 24 __ INC SP + 1 
06:b025 : a2 05 __ LDX #$05
06:b027 : bd bf ab LDA $abbf,x ; (projbuffer + 39)
06:b02a : 95 53 __ STA T5 + 0,x 
06:b02c : ca __ __ DEX
06:b02d : 10 f8 __ BPL $b027 ; (importread.s1001 + 15)
06:b02f : 60 __ __ RTS
.s93:
06:b030 : ad c9 87 LDA $87c9 ; (canvas + 3)
06:b033 : 85 1b __ STA ACCU + 0 
06:b035 : ad ca 87 LDA $87ca ; (canvas + 4)
06:b038 : 85 1c __ STA ACCU + 1 
06:b03a : ad 53 8b LDA $8b53 ; (importvars + 2)
06:b03d : 85 03 __ STA WORK + 0 
06:b03f : ad 54 8b LDA $8b54 ; (importvars + 3)
06:b042 : 85 04 __ STA WORK + 1 
06:b044 : 20 87 7c JSR $7c87 ; (mul16 + 0)
06:b047 : 18 __ __ CLC
06:b048 : a5 06 __ LDA WORK + 3 
06:b04a : 69 58 __ ADC #$58
06:b04c : aa __ __ TAX
06:b04d : ad 51 8b LDA $8b51 ; (importvars + 0)
06:b050 : 18 __ __ CLC
06:b051 : 65 05 __ ADC WORK + 2 
06:b053 : 85 4e __ STA T0 + 0 
06:b055 : 8a __ __ TXA
06:b056 : 6d 52 8b ADC $8b52 ; (importvars + 1)
06:b059 : 85 4f __ STA T0 + 1 
06:b05b : a9 00 __ LDA #$00
06:b05d : 85 50 __ STA T1 + 0 
.l18:
06:b05f : a5 4e __ LDA T0 + 0 
06:b061 : a0 0a __ LDY #$0a
06:b063 : 91 23 __ STA (SP + 0),y 
06:b065 : a5 4f __ LDA T0 + 1 
06:b067 : c8 __ __ INY
06:b068 : 91 23 __ STA (SP + 0),y 
06:b06a : a9 00 __ LDA #$00
06:b06c : a0 02 __ LDY #$02
06:b06e : 91 23 __ STA (SP + 0),y 
06:b070 : a9 89 __ LDA #$89
06:b072 : c8 __ __ INY
06:b073 : 91 23 __ STA (SP + 0),y 
06:b075 : a9 00 __ LDA #$00
06:b077 : c8 __ __ INY
06:b078 : 91 23 __ STA (SP + 0),y 
06:b07a : a9 b1 __ LDA #$b1
06:b07c : c8 __ __ INY
06:b07d : 91 23 __ STA (SP + 0),y 
06:b07f : 18 __ __ CLC
06:b080 : a5 50 __ LDA T1 + 0 
06:b082 : 69 01 __ ADC #$01
06:b084 : c8 __ __ INY
06:b085 : 91 23 __ STA (SP + 0),y 
06:b087 : a9 00 __ LDA #$00
06:b089 : 2a __ __ ROL
06:b08a : c8 __ __ INY
06:b08b : 91 23 __ STA (SP + 0),y 
06:b08d : ad 57 8b LDA $8b57 ; (importvars + 6)
06:b090 : c8 __ __ INY
06:b091 : 91 23 __ STA (SP + 0),y 
06:b093 : ad 58 8b LDA $8b58 ; (importvars + 7)
06:b096 : c8 __ __ INY
06:b097 : 91 23 __ STA (SP + 0),y 
06:b099 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
06:b09c : 20 ea 80 JSR $80ea ; (vdc_prints_attr@proxy + 0)
06:b09f : 20 83 19 JSR $1983 ; (bnk_io_read@proxy + 0)
06:b0a2 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
06:b0a5 : c9 40 __ CMP #$40
06:b0a7 : f0 29 __ BEQ $b0d2 ; (importread.s22 + 0)
.s24:
06:b0a9 : 85 52 __ STA T3 + 0 
06:b0ab : 09 00 __ ORA #$00
06:b0ad : f0 03 __ BEQ $b0b2 ; (importread.s27 + 0)
06:b0af : 4c c6 ad JMP $adc6 ; (importread.s25 + 0)
.s27:
06:b0b2 : 18 __ __ CLC
06:b0b3 : a5 4e __ LDA T0 + 0 
06:b0b5 : 6d c9 87 ADC $87c9 ; (canvas + 3)
06:b0b8 : 85 4e __ STA T0 + 0 
06:b0ba : a5 0f __ LDA P2 
06:b0bc : 6d ca 87 ADC $87ca ; (canvas + 4)
06:b0bf : 85 4f __ STA T0 + 1 
06:b0c1 : e6 50 __ INC T1 + 0 
06:b0c3 : ad 58 8b LDA $8b58 ; (importvars + 7)
06:b0c6 : d0 97 __ BNE $b05f ; (importread.l18 + 0)
.s1030:
06:b0c8 : a5 50 __ LDA T1 + 0 
06:b0ca : cd 57 8b CMP $8b57 ; (importvars + 6)
06:b0cd : 90 90 __ BCC $b05f ; (importread.l18 + 0)
06:b0cf : 4c 43 ad JMP $ad43 ; (importread.s20 + 0)
.s22:
06:b0d2 : a9 02 __ LDA #$02
06:b0d4 : 8d 5d 8b STA $8b5d ; (importvars + 12)
06:b0d7 : ad 57 8b LDA $8b57 ; (importvars + 6)
06:b0da : 85 50 __ STA T1 + 0 
06:b0dc : 4c b2 b0 JMP $b0b2 ; (importread.s27 + 0)
--------------------------------------------------------------------
06:b0df : __ __ __ BYT 25 53 2c 50 2c 52 00                            : %S,P,R.
--------------------------------------------------------------------
06:b0e6 : __ __ __ BYT 73 4b 49 50 50 49 4e 47 20 4c 4f 41 44 20 41 44 : sKIPPING LOAD AD
06:b0f6 : __ __ __ BYT 44 52 45 53 53 2e 00                            : DRESS..
--------------------------------------------------------------------
06:b100 : __ __ __ BYT 63 48 41 52 20 4c 49 4e 45 20 25 33 55 20 4f 46 : cHAR LINE %3U OF
06:b110 : __ __ __ BYT 20 25 33 55 20 41 54 20 41 44 44 52 45 53 53 20 :  %3U AT ADDRESS 
06:b120 : __ __ __ BYT 25 34 58 00                                     : %4X.
--------------------------------------------------------------------
06:b124 : __ __ __ BYT 73 4b 49 50 50 49 4e 47 20 4f 46 46 53 45 54 20 : sKIPPING OFFSET 
06:b134 : __ __ __ BYT 42 59 54 45 20 25 55 20 4f 46 20 25 55 00       : BYTE %U OF %U.
--------------------------------------------------------------------
06:b142 : __ __ __ BYT 63 4f 4c 4f 52 20 4c 49 4e 45 20 25 33 55 20 4f : cOLOR LINE %3U O
06:b152 : __ __ __ BYT 46 20 25 33 55 20 41 54 20 41 44 44 52 45 53 53 : F %3U AT ADDRESS
06:b162 : __ __ __ BYT 20 25 34 58 00                                  :  %4X.
--------------------------------------------------------------------
06:b167 : __ __ __ BYT 63 4f 4e 56 45 52 54 20 76 69 63 20 43 4f 4c 4f : cONVERT vic COLO
06:b177 : __ __ __ BYT 52 20 4c 49 4e 45 20 25 33 55 20 4f 46 20 25 33 : R LINE %3U OF %3
06:b187 : __ __ __ BYT 55 00                                           : U.
--------------------------------------------------------------------
06:b189 : __ __ __ BYT 00 0f 08 07 0a 04 02 0d 0c 0c 09 01 0e 05 03 0e : ................
--------------------------------------------------------------------
import_seq: ; import_seq()->void
.s1000:
07:ac00 : a2 0b __ LDX #$0b
07:ac02 : b5 53 __ LDA T0 + 0,x 
07:ac04 : 9d 96 ab STA $ab96,x ; (tempfilename + 19)
07:ac07 : ca __ __ DEX
07:ac08 : 10 f8 __ BPL $ac02 ; (import_seq.s1000 + 2)
07:ac0a : 38 __ __ SEC
07:ac0b : a5 23 __ LDA SP + 0 
07:ac0d : e9 08 __ SBC #$08
07:ac0f : 85 23 __ STA SP + 0 
07:ac11 : b0 02 __ BCS $ac15 ; (import_seq.s0 + 0)
07:ac13 : c6 24 __ DEC SP + 1 
.s0:
07:ac15 : a9 02 __ LDA #$02
07:ac17 : 8d fd ab STA $abfd ; (sstack + 10)
07:ac1a : ad ff 87 LDA $87ff ; (showbar + 0)
07:ac1d : 85 53 __ STA T0 + 0 
07:ac1f : a9 00 __ LDA #$00
07:ac21 : 8d ff 87 STA $87ff ; (showbar + 0)
07:ac24 : a9 ae __ LDA #$ae
07:ac26 : 8d fe ab STA $abfe ; (sstack + 11)
07:ac29 : a9 ad __ LDA #$ad
07:ac2b : 8d ff ab STA $abff ; (sstack + 12)
07:ac2e : ad 91 87 LDA $8791 ; (plotscreencode + 0)
07:ac31 : 85 55 __ STA T2 + 0 
07:ac33 : ad 92 87 LDA $8792 ; (plotcolor + 0)
07:ac36 : 85 56 __ STA T3 + 0 
07:ac38 : ad 95 87 LDA $8795 ; (plotblink + 0)
07:ac3b : 85 57 __ STA T4 + 0 
07:ac3d : ad 94 87 LDA $8794 ; (plotunderline + 0)
07:ac40 : 85 58 __ STA T5 + 0 
07:ac42 : ad 93 87 LDA $8793 ; (plotreverse + 0)
07:ac45 : 85 59 __ STA T6 + 0 
07:ac47 : ad 8c 87 LDA $878c ; (screen_col + 0)
07:ac4a : 85 54 __ STA T1 + 0 
07:ac4c : ad 8e 87 LDA $878e ; (screen_row + 0)
07:ac4f : 85 5a __ STA T7 + 0 
07:ac51 : ad cd 87 LDA $87cd ; (canvas + 7)
07:ac54 : 85 5b __ STA T8 + 0 
07:ac56 : 20 4d 72 JSR $724d ; (import_dialogue.s1000 + 0)
07:ac59 : a5 1b __ LDA ACCU + 0 
07:ac5b : d0 16 __ BNE $ac73 ; (import_seq.s1 + 0)
.s1001:
07:ac5d : 18 __ __ CLC
07:ac5e : a5 23 __ LDA SP + 0 
07:ac60 : 69 08 __ ADC #$08
07:ac62 : 85 23 __ STA SP + 0 
07:ac64 : 90 02 __ BCC $ac68 ; (import_seq.s1001 + 11)
07:ac66 : e6 24 __ INC SP + 1 
07:ac68 : a2 0b __ LDX #$0b
07:ac6a : bd 96 ab LDA $ab96,x ; (tempfilename + 19)
07:ac6d : 95 53 __ STA T0 + 0,x 
07:ac6f : ca __ __ DEX
07:ac70 : 10 f8 __ BPL $ac6a ; (import_seq.s1001 + 13)
07:ac72 : 60 __ __ RTS
.s1:
07:ac73 : ad fe 69 LDA $69fe ; (undoenabled + 0)
07:ac76 : c9 01 __ CMP #$01
07:ac78 : d0 18 __ BNE $ac92 ; (import_seq.s6 + 0)
.s4:
07:ac7a : ad 53 8b LDA $8b53 ; (importvars + 2)
07:ac7d : 85 16 __ STA P9 
07:ac7f : ad 51 8b LDA $8b51 ; (importvars + 0)
07:ac82 : 85 17 __ STA P10 
07:ac84 : ad 55 8b LDA $8b55 ; (importvars + 4)
07:ac87 : 85 18 __ STA P11 
07:ac89 : ad 57 8b LDA $8b57 ; (importvars + 6)
07:ac8c : 8d f3 ab STA $abf3 ; (sstack + 0)
07:ac8f : 20 35 52 JSR $5235 ; (undo_new.s1000 + 0)
.s6:
07:ac92 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
07:ac95 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
07:ac98 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
07:ac9b : a9 20 __ LDA #$20
07:ac9d : 8d 91 87 STA $8791 ; (plotscreencode + 0)
07:aca0 : a9 00 __ LDA #$00
07:aca2 : 8d 93 87 STA $8793 ; (plotreverse + 0)
07:aca5 : 8d 95 87 STA $8795 ; (plotblink + 0)
07:aca8 : 8d 94 87 STA $8794 ; (plotunderline + 0)
07:acab : a9 0f __ LDA #$0f
07:acad : 8d 92 87 STA $8792 ; (plotcolor + 0)
07:acb0 : ad 60 8b LDA $8b60 ; (importvars + 15)
07:acb3 : c9 01 __ CMP #$01
07:acb5 : d0 04 __ BNE $acbb ; (import_seq.s34 + 0)
.s33:
07:acb7 : a9 00 __ LDA #$00
07:acb9 : f0 02 __ BEQ $acbd ; (import_seq.s35 + 0)
.s34:
07:acbb : a9 01 __ LDA #$01
.s35:
07:acbd : 8d 96 87 STA $8796 ; (plotaltchar + 0)
07:acc0 : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
07:acc3 : a9 00 __ LDA #$00
07:acc5 : a0 02 __ LDY #$02
07:acc7 : 91 23 __ STA (SP + 0),y 
07:acc9 : a9 89 __ LDA #$89
07:accb : c8 __ __ INY
07:accc : 91 23 __ STA (SP + 0),y 
07:acce : a9 a7 __ LDA #$a7
07:acd0 : c8 __ __ INY
07:acd1 : 91 23 __ STA (SP + 0),y 
07:acd3 : a9 ae __ LDA #$ae
07:acd5 : c8 __ __ INY
07:acd6 : 91 23 __ STA (SP + 0),y 
07:acd8 : a9 97 __ LDA #$97
07:acda : c8 __ __ INY
07:acdb : 91 23 __ STA (SP + 0),y 
07:acdd : a9 87 __ LDA #$87
07:acdf : c8 __ __ INY
07:ace0 : 91 23 __ STA (SP + 0),y 
07:ace2 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
07:ace5 : a9 00 __ LDA #$00
07:ace7 : 85 0d __ STA P0 
07:ace9 : 85 0e __ STA P1 
07:aceb : 20 b6 2a JSR $2ab6 ; (krnio_setbnk.s0 + 0)
07:acee : 20 bd 2a JSR $2abd ; (krnio_setnam@proxy + 0)
07:acf1 : ad ac 87 LDA $87ac ; (targetdevice + 0)
07:acf4 : 85 0e __ STA P1 
07:acf6 : 20 55 63 JSR $6355 ; (krnio_open@proxy + 0)
07:acf9 : 09 00 __ ORA #$00
07:acfb : f0 4c __ BEQ $ad49 ; (import_seq.s10 + 0)
.s8:
07:acfd : a9 01 __ LDA #$01
07:acff : 20 ff 63 JSR $63ff ; (krnio_chkin.s1000 + 0)
07:ad02 : 09 00 __ ORA #$00
07:ad04 : d0 08 __ BNE $ad0e ; (import_seq.l14 + 0)
.s12:
07:ad06 : a9 01 __ LDA #$01
07:ad08 : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
07:ad0b : 4c 46 ad JMP $ad46 ; (import_seq.s59 + 0)
.l14:
07:ad0e : 20 13 64 JSR $6413 ; (krnio_chrin.s0 + 0)
07:ad11 : a5 1b __ LDA ACCU + 0 
07:ad13 : 85 5d __ STA T10 + 0 
07:ad15 : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
07:ad18 : 85 5c __ STA T9 + 0 
07:ad1a : c9 01 __ CMP #$01
07:ad1c : a9 00 __ LDA #$00
07:ad1e : 69 ff __ ADC #$ff
07:ad20 : 29 01 __ AND #$01
07:ad22 : 85 5e __ STA T12 + 0 
07:ad24 : d0 06 __ BNE $ad2c ; (import_seq.s16 + 0)
.s19:
07:ad26 : a5 5c __ LDA T9 + 0 
07:ad28 : c9 40 __ CMP #$40
07:ad2a : d0 0c __ BNE $ad38 ; (import_seq.s15 + 0)
.s16:
07:ad2c : a5 5d __ LDA T10 + 0 
07:ad2e : 8d f7 ab STA $abf7 ; (sstack + 4)
07:ad31 : 20 ae ae JSR $aeae ; (decode_controlcode.s1000 + 0)
07:ad34 : a5 5e __ LDA T12 + 0 
07:ad36 : d0 d6 __ BNE $ad0e ; (import_seq.l14 + 0)
.s15:
07:ad38 : 20 1d 64 JSR $641d ; (krnio_clrchn.s0 + 0)
07:ad3b : a9 01 __ LDA #$01
07:ad3d : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
07:ad40 : a5 5c __ LDA T9 + 0 
07:ad42 : c9 40 __ CMP #$40
07:ad44 : f0 03 __ BEQ $ad49 ; (import_seq.s10 + 0)
.s59:
07:ad46 : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s10:
07:ad49 : a5 53 __ LDA T0 + 0 
07:ad4b : 8d ff 87 STA $87ff ; (showbar + 0)
07:ad4e : a5 55 __ LDA T2 + 0 
07:ad50 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
07:ad53 : a5 56 __ LDA T3 + 0 
07:ad55 : 8d 92 87 STA $8792 ; (plotcolor + 0)
07:ad58 : a5 57 __ LDA T4 + 0 
07:ad5a : 8d 95 87 STA $8795 ; (plotblink + 0)
07:ad5d : a5 58 __ LDA T5 + 0 
07:ad5f : 8d 94 87 STA $8794 ; (plotunderline + 0)
07:ad62 : a5 59 __ LDA T6 + 0 
07:ad64 : 8d 93 87 STA $8793 ; (plotreverse + 0)
07:ad67 : a5 54 __ LDA T1 + 0 
07:ad69 : 8d 8c 87 STA $878c ; (screen_col + 0)
07:ad6c : a9 00 __ LDA #$00
07:ad6e : 8d 8d 87 STA $878d ; (screen_col + 1)
07:ad71 : 8d 8f 87 STA $878f ; (screen_row + 1)
07:ad74 : 8d ce 87 STA $87ce ; (canvas + 8)
07:ad77 : a5 5a __ LDA T7 + 0 
07:ad79 : 8d 8e 87 STA $878e ; (screen_row + 0)
07:ad7c : a5 5b __ LDA T8 + 0 
07:ad7e : 8d cd 87 STA $87cd ; (canvas + 7)
07:ad81 : 20 18 3d JSR $3d18 ; (placesignature.s1000 + 0)
07:ad84 : 20 b2 80 JSR $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
07:ad87 : a9 00 __ LDA #$00
07:ad89 : 85 17 __ STA P10 
07:ad8b : 85 18 __ STA P11 
07:ad8d : 8d f3 ab STA $abf3 ; (sstack + 0)
07:ad90 : a9 01 __ LDA #$01
07:ad92 : 8d f5 ab STA $abf5 ; (sstack + 2)
07:ad95 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
07:ad98 : 8d f4 ab STA $abf4 ; (sstack + 1)
07:ad9b : 20 64 36 JSR $3664 ; (vdcwin_win_new.s1000 + 0)
07:ad9e : 20 19 5e JSR $5e19 ; (menu_placebar@proxy + 0)
07:ada1 : a5 53 __ LDA T0 + 0 
07:ada3 : d0 03 __ BNE $ada8 ; (import_seq.s23 + 0)
07:ada5 : 4c 5d ac JMP $ac5d ; (import_seq.s1001 + 0)
.s23:
07:ada8 : 20 d4 3e JSR $3ed4 ; (initstatusbar.s1000 + 0)
07:adab : 4c 5d ac JMP $ac5d ; (import_seq.s1001 + 0)
--------------------------------------------------------------------
07:adae : __ __ __ BYT 69 4d 50 4f 52 54 20 73 65 71 00                : iMPORT seq.
--------------------------------------------------------------------
rebase: ; rebase()->void
.s0:
07:adb9 : ad 59 8b LDA $8b59 ; (importvars + 8)
07:adbc : 18 __ __ CLC
07:adbd : 6d 51 8b ADC $8b51 ; (importvars + 0)
07:adc0 : 85 43 __ STA T0 + 0 
07:adc2 : 8d 8c 87 STA $878c ; (screen_col + 0)
07:adc5 : ad 5a 8b LDA $8b5a ; (importvars + 9)
07:adc8 : 6d 52 8b ADC $8b52 ; (importvars + 1)
07:adcb : 85 44 __ STA T0 + 1 
07:adcd : 8d 8d 87 STA $878d ; (screen_col + 1)
07:add0 : ad cd 87 LDA $87cd ; (canvas + 7)
07:add3 : 85 45 __ STA T1 + 0 
07:add5 : a9 00 __ LDA #$00
07:add7 : 8d cd 87 STA $87cd ; (canvas + 7)
07:adda : 8d ce 87 STA $87ce ; (canvas + 8)
07:addd : ad cf 87 LDA $87cf ; (canvas + 9)
07:ade0 : 85 47 __ STA T2 + 0 
07:ade2 : a9 00 __ LDA #$00
07:ade4 : 8d cf 87 STA $87cf ; (canvas + 9)
07:ade7 : 8d d0 87 STA $87d0 ; (canvas + 10)
07:adea : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:aded : 18 __ __ CLC
07:adee : 6d 53 8b ADC $8b53 ; (importvars + 2)
07:adf1 : 85 49 __ STA T3 + 0 
07:adf3 : 8d 8e 87 STA $878e ; (screen_row + 0)
07:adf6 : ad 5c 8b LDA $8b5c ; (importvars + 11)
07:adf9 : 6d 54 8b ADC $8b54 ; (importvars + 3)
07:adfc : 85 4a __ STA T3 + 1 
07:adfe : 8d 8f 87 STA $878f ; (screen_row + 1)
07:ae01 : ad b0 87 LDA $87b0 ; (vdc_state + 3)
07:ae04 : 38 __ __ SEC
07:ae05 : e9 01 __ SBC #$01
07:ae07 : 85 1b __ STA ACCU + 0 
07:ae09 : ad b1 87 LDA $87b1 ; (vdc_state + 4)
07:ae0c : e9 00 __ SBC #$00
07:ae0e : 85 1c __ STA ACCU + 1 
07:ae10 : c5 44 __ CMP T0 + 1 
07:ae12 : d0 04 __ BNE $ae18 ; (rebase.s1013 + 0)
.s1012:
07:ae14 : a5 1b __ LDA ACCU + 0 
07:ae16 : c5 43 __ CMP T0 + 0 
.s1013:
07:ae18 : b0 2c __ BCS $ae46 ; (rebase.s3 + 0)
.s12:
07:ae1a : a0 00 __ LDY #$00
07:ae1c : a2 00 __ LDX #$00
.l2:
07:ae1e : e8 __ __ INX
07:ae1f : d0 01 __ BNE $ae22 ; (rebase.s1015 + 0)
.s1014:
07:ae21 : c8 __ __ INY
.s1015:
07:ae22 : a5 43 __ LDA T0 + 0 
07:ae24 : d0 02 __ BNE $ae28 ; (rebase.s1017 + 0)
.s1016:
07:ae26 : c6 44 __ DEC T0 + 1 
.s1017:
07:ae28 : c6 43 __ DEC T0 + 0 
07:ae2a : a5 1c __ LDA ACCU + 1 
07:ae2c : c5 44 __ CMP T0 + 1 
07:ae2e : d0 04 __ BNE $ae34 ; (rebase.s1011 + 0)
.s1010:
07:ae30 : a5 1b __ LDA ACCU + 0 
07:ae32 : c5 43 __ CMP T0 + 0 
.s1011:
07:ae34 : 90 e8 __ BCC $ae1e ; (rebase.l2 + 0)
.s13:
07:ae36 : 8e cd 87 STX $87cd ; (canvas + 7)
07:ae39 : 8c ce 87 STY $87ce ; (canvas + 8)
07:ae3c : a5 43 __ LDA T0 + 0 
07:ae3e : 8d 8c 87 STA $878c ; (screen_col + 0)
07:ae41 : a5 44 __ LDA T0 + 1 
07:ae43 : 8d 8d 87 STA $878d ; (screen_col + 1)
.s3:
07:ae46 : ad b2 87 LDA $87b2 ; (vdc_state + 5)
07:ae49 : 38 __ __ SEC
07:ae4a : e9 01 __ SBC #$01
07:ae4c : 85 43 __ STA T0 + 0 
07:ae4e : ad b3 87 LDA $87b3 ; (vdc_state + 6)
07:ae51 : e9 00 __ SBC #$00
07:ae53 : 85 44 __ STA T0 + 1 
07:ae55 : c5 4a __ CMP T3 + 1 
07:ae57 : d0 04 __ BNE $ae5d ; (rebase.s1009 + 0)
.s1008:
07:ae59 : a5 43 __ LDA T0 + 0 
07:ae5b : c5 49 __ CMP T3 + 0 
.s1009:
07:ae5d : b0 2c __ BCS $ae8b ; (rebase.s6 + 0)
.s11:
07:ae5f : a0 00 __ LDY #$00
07:ae61 : a2 00 __ LDX #$00
.l5:
07:ae63 : e8 __ __ INX
07:ae64 : d0 01 __ BNE $ae67 ; (rebase.s1019 + 0)
.s1018:
07:ae66 : c8 __ __ INY
.s1019:
07:ae67 : a5 49 __ LDA T3 + 0 
07:ae69 : d0 02 __ BNE $ae6d ; (rebase.s1021 + 0)
.s1020:
07:ae6b : c6 4a __ DEC T3 + 1 
.s1021:
07:ae6d : c6 49 __ DEC T3 + 0 
07:ae6f : a5 44 __ LDA T0 + 1 
07:ae71 : c5 4a __ CMP T3 + 1 
07:ae73 : d0 04 __ BNE $ae79 ; (rebase.s1007 + 0)
.s1006:
07:ae75 : a5 43 __ LDA T0 + 0 
07:ae77 : c5 49 __ CMP T3 + 0 
.s1007:
07:ae79 : 90 e8 __ BCC $ae63 ; (rebase.l5 + 0)
.s14:
07:ae7b : 8e cf 87 STX $87cf ; (canvas + 9)
07:ae7e : 8c d0 87 STY $87d0 ; (canvas + 10)
07:ae81 : a5 49 __ LDA T3 + 0 
07:ae83 : 8d 8e 87 STA $878e ; (screen_row + 0)
07:ae86 : a5 4a __ LDA T3 + 1 
07:ae88 : 8d 8f 87 STA $878f ; (screen_row + 1)
.s6:
07:ae8b : ad ce 87 LDA $87ce ; (canvas + 8)
07:ae8e : d0 13 __ BNE $aea3 ; (rebase.s7 + 0)
.s1004:
07:ae90 : a5 45 __ LDA T1 + 0 
07:ae92 : cd cd 87 CMP $87cd ; (canvas + 7)
07:ae95 : d0 0c __ BNE $aea3 ; (rebase.s7 + 0)
.s10:
07:ae97 : ad d0 87 LDA $87d0 ; (canvas + 10)
07:ae9a : d0 07 __ BNE $aea3 ; (rebase.s7 + 0)
.s1002:
07:ae9c : a5 47 __ LDA T2 + 0 
07:ae9e : cd cf 87 CMP $87cf ; (canvas + 9)
07:aea1 : f0 03 __ BEQ $aea6 ; (rebase.s1001 + 0)
.s7:
07:aea3 : 4c b2 80 JMP $80b2 ; (vdcwin_cpy_viewport@proxy + 0)
.s1001:
07:aea6 : 60 __ __ RTS
--------------------------------------------------------------------
07:aea7 : __ __ __ BYT 25 53 2c 53 2c 52 00                            : %S,S,R.
--------------------------------------------------------------------
decode_controlcode: ; decode_controlcode(u8)->void
.s1000:
07:aeae : a2 07 __ LDX #$07
07:aeb0 : b5 53 __ LDA T2 + 0,x 
07:aeb2 : 9d c5 ab STA $abc5,x ; (projbuffer + 45)
07:aeb5 : ca __ __ DEX
07:aeb6 : 10 f8 __ BPL $aeb0 ; (decode_controlcode.s1000 + 2)
.s0:
07:aeb8 : ad f7 ab LDA $abf7 ; (sstack + 4)
07:aebb : c9 8e __ CMP #$8e
07:aebd : d0 05 __ BNE $aec4 ; (decode_controlcode.s80 + 0)
.s20:
07:aebf : a9 00 __ LDA #$00
07:aec1 : 4c bd b2 JMP $b2bd ; (decode_controlcode.s1122 + 0)
.s80:
07:aec4 : a8 __ __ TAY
07:aec5 : b0 03 __ BCS $aeca ; (decode_controlcode.s81 + 0)
07:aec7 : 4c ad b1 JMP $b1ad ; (decode_controlcode.s82 + 0)
.s81:
07:aeca : c9 98 __ CMP #$98
07:aecc : d0 03 __ BNE $aed1 ; (decode_controlcode.s112 + 0)
07:aece : 4c a0 b1 JMP $b1a0 ; (decode_controlcode.s40 + 0)
.s112:
07:aed1 : b0 03 __ BCS $aed6 ; (decode_controlcode.s113 + 0)
07:aed3 : 4c 78 b0 JMP $b078 ; (decode_controlcode.s114 + 0)
.s113:
07:aed6 : c9 9c __ CMP #$9c
07:aed8 : d0 03 __ BNE $aedd ; (decode_controlcode.s126 + 0)
07:aeda : 4c 69 b0 JMP $b069 ; (decode_controlcode.s44 + 0)
.s126:
07:aedd : b0 03 __ BCS $aee2 ; (decode_controlcode.s127 + 0)
07:aedf : 4c 57 b0 JMP $b057 ; (decode_controlcode.s128 + 0)
.s127:
07:aee2 : c9 9e __ CMP #$9e
07:aee4 : d0 05 __ BNE $aeeb ; (decode_controlcode.s132 + 0)
.s46:
07:aee6 : a9 0d __ LDA #$0d
07:aee8 : 4c 51 b0 JMP $b051 ; (decode_controlcode.s1126 + 0)
.s132:
07:aeeb : b0 0a __ BCS $aef7 ; (decode_controlcode.s133 + 0)
.s45:
07:aeed : a9 01 __ LDA #$01
07:aeef : 8d f3 ab STA $abf3 ; (sstack + 0)
07:aef2 : a9 00 __ LDA #$00
07:aef4 : 4c 36 b0 JMP $b036 ; (decode_controlcode.s187 + 0)
.s133:
07:aef7 : c9 9f __ CMP #$9f
07:aef9 : d0 05 __ BNE $af00 ; (decode_controlcode.s49 + 0)
.s47:
07:aefb : a9 07 __ LDA #$07
07:aefd : 4c 51 b0 JMP $b051 ; (decode_controlcode.s1126 + 0)
.s49:
07:af00 : ad 8f 87 LDA $878f ; (screen_row + 1)
07:af03 : 85 56 __ STA T3 + 1 
07:af05 : ad 8e 87 LDA $878e ; (screen_row + 0)
07:af08 : 85 55 __ STA T3 + 0 
07:af0a : 18 __ __ CLC
07:af0b : 6d cf 87 ADC $87cf ; (canvas + 9)
07:af0e : 85 10 __ STA P3 
07:af10 : ad 8d 87 LDA $878d ; (screen_col + 1)
07:af13 : 85 58 __ STA T4 + 1 
07:af15 : ad 8c 87 LDA $878c ; (screen_col + 0)
07:af18 : 85 57 __ STA T4 + 0 
07:af1a : 18 __ __ CLC
07:af1b : 6d cd 87 ADC $87cd ; (canvas + 7)
07:af1e : 85 11 __ STA P4 
07:af20 : ad 95 87 LDA $8795 ; (plotblink + 0)
07:af23 : 0a __ __ ASL
07:af24 : 0a __ __ ASL
07:af25 : 0a __ __ ASL
07:af26 : 0a __ __ ASL
07:af27 : 18 __ __ CLC
07:af28 : 6d 92 87 ADC $8792 ; (plotcolor + 0)
07:af2b : 85 44 __ STA T5 + 0 
07:af2d : ad 94 87 LDA $8794 ; (plotunderline + 0)
07:af30 : 4a __ __ LSR
07:af31 : 6a __ __ ROR
07:af32 : 6a __ __ ROR
07:af33 : 29 c0 __ AND #$c0
07:af35 : 6a __ __ ROR
07:af36 : 65 44 __ ADC T5 + 0 
07:af38 : 85 44 __ STA T5 + 0 
07:af3a : ad 93 87 LDA $8793 ; (plotreverse + 0)
07:af3d : 4a __ __ LSR
07:af3e : 6a __ __ ROR
07:af3f : 29 80 __ AND #$80
07:af41 : 6a __ __ ROR
07:af42 : 65 44 __ ADC T5 + 0 
07:af44 : 85 44 __ STA T5 + 0 
07:af46 : ad 96 87 LDA $8796 ; (plotaltchar + 0)
07:af49 : 4a __ __ LSR
07:af4a : a9 00 __ LDA #$00
07:af4c : 6a __ __ ROR
07:af4d : 65 44 __ ADC T5 + 0 
07:af4f : 85 13 __ STA P6 
07:af51 : 98 __ __ TYA
07:af52 : c0 20 __ CPY #$20
07:af54 : 90 13 __ BCC $af69 ; (decode_controlcode.s56 + 0)
.s53:
07:af56 : c9 40 __ CMP #$40
07:af58 : b0 05 __ BCS $af5f ; (decode_controlcode.s57 + 0)
.s50:
07:af5a : 8d 91 87 STA $8791 ; (plotscreencode + 0)
07:af5d : 90 0a __ BCC $af69 ; (decode_controlcode.s56 + 0)
.s57:
07:af5f : c9 60 __ CMP #$60
07:af61 : b0 06 __ BCS $af69 ; (decode_controlcode.s56 + 0)
.s54:
07:af63 : 38 __ __ SEC
07:af64 : e9 40 __ SBC #$40
07:af66 : 4c 74 af JMP $af74 ; (decode_controlcode.s185 + 0)
.s56:
07:af69 : c9 60 __ CMP #$60
07:af6b : 90 0a __ BCC $af77 ; (decode_controlcode.s60 + 0)
.s61:
07:af6d : c9 80 __ CMP #$80
07:af6f : b0 06 __ BCS $af77 ; (decode_controlcode.s60 + 0)
.s58:
07:af71 : 38 __ __ SEC
07:af72 : e9 20 __ SBC #$20
.s185:
07:af74 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
.s60:
07:af77 : 98 __ __ TYA
07:af78 : c0 a0 __ CPY #$a0
07:af7a : 90 0a __ BCC $af86 ; (decode_controlcode.s64 + 0)
.s65:
07:af7c : c9 c0 __ CMP #$c0
07:af7e : b0 06 __ BCS $af86 ; (decode_controlcode.s64 + 0)
.s62:
07:af80 : 38 __ __ SEC
07:af81 : e9 40 __ SBC #$40
07:af83 : 8d 91 87 STA $8791 ; (plotscreencode + 0)
.s64:
07:af86 : 98 __ __ TYA
07:af87 : c0 c0 __ CPY #$c0
07:af89 : 90 0a __ BCC $af95 ; (decode_controlcode.s68 + 0)
.s69:
07:af8b : c9 ff __ CMP #$ff
07:af8d : b0 06 __ BCS $af95 ; (decode_controlcode.s68 + 0)
.s66:
07:af8f : 38 __ __ SEC
07:af90 : e9 80 __ SBC #$80
07:af92 : 4c 9b af JMP $af9b ; (decode_controlcode.s1124 + 0)
.s68:
07:af95 : c9 ff __ CMP #$ff
07:af97 : d0 05 __ BNE $af9e ; (decode_controlcode.s72 + 0)
.s70:
07:af99 : a9 5e __ LDA #$5e
.s1124:
07:af9b : 8d 91 87 STA $8791 ; (plotscreencode + 0)
.s72:
07:af9e : ad 91 87 LDA $8791 ; (plotscreencode + 0)
07:afa1 : 85 12 __ STA P5 
07:afa3 : 20 2b 54 JSR $542b ; (screenmapplot.s0 + 0)
07:afa6 : a9 7f __ LDA #$7f
07:afa8 : 85 0d __ STA P0 
07:afaa : ad cd 87 LDA $87cd ; (canvas + 7)
07:afad : 18 __ __ CLC
07:afae : 65 57 __ ADC T4 + 0 
07:afb0 : 85 53 __ STA T2 + 0 
07:afb2 : ad ce 87 LDA $87ce ; (canvas + 8)
07:afb5 : 65 58 __ ADC T4 + 1 
07:afb7 : 85 54 __ STA T2 + 1 
07:afb9 : ad cf 87 LDA $87cf ; (canvas + 9)
07:afbc : 18 __ __ CLC
07:afbd : 65 55 __ ADC T3 + 0 
07:afbf : 85 03 __ STA WORK + 0 
07:afc1 : ad d0 87 LDA $87d0 ; (canvas + 10)
07:afc4 : 65 56 __ ADC T3 + 1 
07:afc6 : 85 04 __ STA WORK + 1 
07:afc8 : ad c9 87 LDA $87c9 ; (canvas + 3)
07:afcb : 85 59 __ STA T6 + 0 
07:afcd : 85 1b __ STA ACCU + 0 
07:afcf : ad ca 87 LDA $87ca ; (canvas + 4)
07:afd2 : 85 5a __ STA T6 + 1 
07:afd4 : 85 1c __ STA ACCU + 1 
07:afd6 : 20 87 7c JSR $7c87 ; (mul16 + 0)
07:afd9 : 18 __ __ CLC
07:afda : a5 06 __ LDA WORK + 3 
07:afdc : 69 58 __ ADC #$58
07:afde : aa __ __ TAX
07:afdf : 18 __ __ CLC
07:afe0 : a5 05 __ LDA WORK + 2 
07:afe2 : 65 53 __ ADC T2 + 0 
07:afe4 : 85 0e __ STA P1 
07:afe6 : 8a __ __ TXA
07:afe7 : 65 54 __ ADC T2 + 1 
07:afe9 : 85 0f __ STA P2 
07:afeb : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
07:afee : 85 52 __ STA T0 + 0 
07:aff0 : ad cb 87 LDA $87cb ; (canvas + 5)
07:aff3 : 85 1b __ STA ACCU + 0 
07:aff5 : ad cc 87 LDA $87cc ; (canvas + 6)
07:aff8 : 85 1c __ STA ACCU + 1 
07:affa : a5 59 __ LDA T6 + 0 
07:affc : 85 03 __ STA WORK + 0 
07:affe : a5 5a __ LDA T6 + 1 
07:b000 : 85 04 __ STA WORK + 1 
07:b002 : 20 87 7c JSR $7c87 ; (mul16 + 0)
07:b005 : 18 __ __ CLC
07:b006 : a5 05 __ LDA WORK + 2 
07:b008 : 65 0e __ ADC P1 
07:b00a : a8 __ __ TAY
07:b00b : a5 06 __ LDA WORK + 3 
07:b00d : 65 0f __ ADC P2 
07:b00f : aa __ __ TAX
07:b010 : 98 __ __ TYA
07:b011 : 18 __ __ CLC
07:b012 : 69 30 __ ADC #$30
07:b014 : 85 0e __ STA P1 
07:b016 : 90 01 __ BCC $b019 ; (decode_controlcode.s1130 + 0)
.s1129:
07:b018 : e8 __ __ INX
.s1130:
07:b019 : 86 0f __ STX P2 
07:b01b : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
07:b01e : 85 10 __ STA P3 
07:b020 : a5 57 __ LDA T4 + 0 
07:b022 : 85 0d __ STA P0 
07:b024 : a5 55 __ LDA T3 + 0 
07:b026 : 85 0e __ STA P1 
07:b028 : a5 52 __ LDA T0 + 0 
07:b02a : 85 0f __ STA P2 
07:b02c : 20 fc 34 JSR $34fc ; (vdc_printc.s0 + 0)
.s188:
07:b02f : a9 00 __ LDA #$00
07:b031 : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b034 : a9 01 __ LDA #$01
.s187:
07:b036 : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b039 : a9 00 __ LDA #$00
.s186:
07:b03b : 8d f5 ab STA $abf5 ; (sstack + 2)
07:b03e : a9 00 __ LDA #$00
.s184:
07:b040 : 8d f6 ab STA $abf6 ; (sstack + 3)
07:b043 : 20 c3 b2 JSR $b2c3 ; (seqimport_move.s0 + 0)
.s1001:
07:b046 : a2 07 __ LDX #$07
07:b048 : bd c5 ab LDA $abc5,x ; (projbuffer + 45)
07:b04b : 95 53 __ STA T2 + 0,x 
07:b04d : ca __ __ DEX
07:b04e : 10 f8 __ BPL $b048 ; (decode_controlcode.s1001 + 2)
07:b050 : 60 __ __ RTS
.s1126:
07:b051 : 8d 92 87 STA $8792 ; (plotcolor + 0)
07:b054 : 4c 46 b0 JMP $b046 ; (decode_controlcode.s1001 + 0)
.s128:
07:b057 : c9 9a __ CMP #$9a
07:b059 : d0 04 __ BNE $b05f ; (decode_controlcode.s129 + 0)
.s42:
07:b05b : a9 03 __ LDA #$03
07:b05d : d0 f2 __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s129:
07:b05f : b0 04 __ BCS $b065 ; (decode_controlcode.s43 + 0)
.s41:
07:b061 : a9 05 __ LDA #$05
07:b063 : 90 ec __ BCC $b051 ; (decode_controlcode.s1126 + 0)
.s43:
07:b065 : a9 0e __ LDA #$0e
07:b067 : d0 e8 __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s44:
07:b069 : ad 5e 8b LDA $8b5e ; (importvars + 13)
07:b06c : c9 01 __ CMP #$01
07:b06e : d0 04 __ BNE $b074 ; (decode_controlcode.s153 + 0)
.s144:
07:b070 : a9 0a __ LDA #$0a
07:b072 : d0 dd __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s153:
07:b074 : a9 0b __ LDA #$0b
07:b076 : d0 d9 __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s114:
07:b078 : c9 93 __ CMP #$93
07:b07a : f0 4f __ BEQ $b0cb ; (decode_controlcode.s25 + 0)
.s115:
07:b07c : 90 24 __ BCC $b0a2 ; (decode_controlcode.s117 + 0)
.s116:
07:b07e : c9 96 __ CMP #$96
07:b080 : d0 04 __ BNE $b086 ; (decode_controlcode.s122 + 0)
.s38:
07:b082 : a9 09 __ LDA #$09
07:b084 : d0 cb __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s122:
07:b086 : b0 0b __ BCS $b093 ; (decode_controlcode.s39 + 0)
.s124:
07:b088 : c9 95 __ CMP #$95
07:b08a : f0 03 __ BEQ $b08f ; (decode_controlcode.s37 + 0)
07:b08c : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s37:
07:b08f : a9 0c __ LDA #$0c
07:b091 : d0 be __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s39:
07:b093 : ad 5e 8b LDA $8b5e ; (importvars + 13)
07:b096 : c9 01 __ CMP #$01
07:b098 : d0 04 __ BNE $b09e ; (decode_controlcode.s150 + 0)
.s147:
07:b09a : a9 01 __ LDA #$01
07:b09c : d0 b3 __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s150:
07:b09e : a9 06 __ LDA #$06
07:b0a0 : d0 af __ BNE $b051 ; (decode_controlcode.s1126 + 0)
.s117:
07:b0a2 : c9 91 __ CMP #$91
07:b0a4 : d0 0c __ BNE $b0b2 ; (decode_controlcode.s118 + 0)
.s23:
07:b0a6 : a9 00 __ LDA #$00
07:b0a8 : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b0ab : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b0ae : a9 01 __ LDA #$01
07:b0b0 : d0 89 __ BNE $b03b ; (decode_controlcode.s186 + 0)
.s118:
07:b0b2 : 90 07 __ BCC $b0bb ; (decode_controlcode.s120 + 0)
.s24:
07:b0b4 : a9 00 __ LDA #$00
.s1128:
07:b0b6 : 8d 93 87 STA $8793 ; (plotreverse + 0)
07:b0b9 : b0 8b __ BCS $b046 ; (decode_controlcode.s1001 + 0)
.s120:
07:b0bb : c9 8f __ CMP #$8f
07:b0bd : f0 04 __ BEQ $b0c3 ; (decode_controlcode.s21 + 0)
.s22:
07:b0bf : a9 00 __ LDA #$00
07:b0c1 : f0 8e __ BEQ $b051 ; (decode_controlcode.s1126 + 0)
.s21:
07:b0c3 : a9 00 __ LDA #$00
.s1127:
07:b0c5 : 8d 95 87 STA $8795 ; (plotblink + 0)
07:b0c8 : 4c 46 b0 JMP $b046 ; (decode_controlcode.s1001 + 0)
.s25:
07:b0cb : ad 63 8b LDA $8b63 ; (importvars + 18)
07:b0ce : c9 01 __ CMP #$01
07:b0d0 : f0 08 __ BEQ $b0da ; (decode_controlcode.s12 + 0)
.s26:
07:b0d2 : ad 55 8b LDA $8b55 ; (importvars + 4)
07:b0d5 : 0d 56 8b ORA $8b56 ; (importvars + 5)
07:b0d8 : d0 14 __ BNE $b0ee ; (decode_controlcode.s136 + 0)
.s12:
07:b0da : a9 00 __ LDA #$00
07:b0dc : 8d 59 8b STA $8b59 ; (importvars + 8)
07:b0df : 8d 5a 8b STA $8b5a ; (importvars + 9)
07:b0e2 : 8d 5b 8b STA $8b5b ; (importvars + 10)
.s1123:
07:b0e5 : 8d 5c 8b STA $8b5c ; (importvars + 11)
.s183:
07:b0e8 : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
07:b0eb : 4c 46 b0 JMP $b046 ; (decode_controlcode.s1001 + 0)
.s136:
07:b0ee : a9 00 __ LDA #$00
07:b0f0 : 85 52 __ STA T0 + 0 
07:b0f2 : a9 20 __ LDA #$20
07:b0f4 : 85 0f __ STA P2 
.l1120:
07:b0f6 : ad 53 8b LDA $8b53 ; (importvars + 2)
07:b0f9 : 18 __ __ CLC
07:b0fa : 65 52 __ ADC T0 + 0 
07:b0fc : 85 03 __ STA WORK + 0 
07:b0fe : ad 54 8b LDA $8b54 ; (importvars + 3)
07:b101 : 69 00 __ ADC #$00
07:b103 : 85 04 __ STA WORK + 1 
07:b105 : ad c9 87 LDA $87c9 ; (canvas + 3)
07:b108 : 85 1b __ STA ACCU + 0 
07:b10a : ad ca 87 LDA $87ca ; (canvas + 4)
07:b10d : 85 1c __ STA ACCU + 1 
07:b10f : 20 87 7c JSR $7c87 ; (mul16 + 0)
07:b112 : 18 __ __ CLC
07:b113 : a5 06 __ LDA WORK + 3 
07:b115 : 69 58 __ ADC #$58
07:b117 : aa __ __ TAX
07:b118 : ad 51 8b LDA $8b51 ; (importvars + 0)
07:b11b : 18 __ __ CLC
07:b11c : 65 05 __ ADC WORK + 2 
07:b11e : 85 0d __ STA P0 
07:b120 : 8a __ __ TXA
07:b121 : 6d 52 8b ADC $8b52 ; (importvars + 1)
07:b124 : 85 0e __ STA P1 
07:b126 : 20 d8 14 JSR $14d8 ; (bnk_memset@proxy + 0)
07:b129 : ad 53 8b LDA $8b53 ; (importvars + 2)
07:b12c : 18 __ __ CLC
07:b12d : 65 52 __ ADC T0 + 0 
07:b12f : 85 03 __ STA WORK + 0 
07:b131 : ad 54 8b LDA $8b54 ; (importvars + 3)
07:b134 : 69 00 __ ADC #$00
07:b136 : 85 04 __ STA WORK + 1 
07:b138 : ad c9 87 LDA $87c9 ; (canvas + 3)
07:b13b : 85 1b __ STA ACCU + 0 
07:b13d : ad ca 87 LDA $87ca ; (canvas + 4)
07:b140 : 85 1c __ STA ACCU + 1 
07:b142 : 20 87 7c JSR $7c87 ; (mul16 + 0)
07:b145 : 18 __ __ CLC
07:b146 : a5 06 __ LDA WORK + 3 
07:b148 : 69 58 __ ADC #$58
07:b14a : aa __ __ TAX
07:b14b : ad 51 8b LDA $8b51 ; (importvars + 0)
07:b14e : 18 __ __ CLC
07:b14f : 65 05 __ ADC WORK + 2 
07:b151 : 85 53 __ STA T2 + 0 
07:b153 : 8a __ __ TXA
07:b154 : 6d 52 8b ADC $8b52 ; (importvars + 1)
07:b157 : 85 54 __ STA T2 + 1 
07:b159 : ad cb 87 LDA $87cb ; (canvas + 5)
07:b15c : 85 1b __ STA ACCU + 0 
07:b15e : ad cc 87 LDA $87cc ; (canvas + 6)
07:b161 : 85 1c __ STA ACCU + 1 
07:b163 : ad c9 87 LDA $87c9 ; (canvas + 3)
07:b166 : 85 03 __ STA WORK + 0 
07:b168 : ad ca 87 LDA $87ca ; (canvas + 4)
07:b16b : 85 04 __ STA WORK + 1 
07:b16d : 20 87 7c JSR $7c87 ; (mul16 + 0)
07:b170 : 18 __ __ CLC
07:b171 : a5 05 __ LDA WORK + 2 
07:b173 : 65 53 __ ADC T2 + 0 
07:b175 : a8 __ __ TAY
07:b176 : a5 06 __ LDA WORK + 3 
07:b178 : 65 54 __ ADC T2 + 1 
07:b17a : aa __ __ TAX
07:b17b : 98 __ __ TYA
07:b17c : 18 __ __ CLC
07:b17d : 69 30 __ ADC #$30
07:b17f : 85 0d __ STA P0 
07:b181 : 90 01 __ BCC $b184 ; (decode_controlcode.s1132 + 0)
.s1131:
07:b183 : e8 __ __ INX
.s1132:
07:b184 : 86 0e __ STX P1 
07:b186 : 20 d8 14 JSR $14d8 ; (bnk_memset@proxy + 0)
07:b189 : e6 52 __ INC T0 + 0 
07:b18b : ad 56 8b LDA $8b56 ; (importvars + 5)
07:b18e : f0 03 __ BEQ $b193 ; (decode_controlcode.s1056 + 0)
07:b190 : 4c f6 b0 JMP $b0f6 ; (decode_controlcode.l1120 + 0)
.s1056:
07:b193 : a5 52 __ LDA T0 + 0 
07:b195 : cd 55 8b CMP $8b55 ; (importvars + 4)
07:b198 : b0 03 __ BCS $b19d ; (decode_controlcode.s1056 + 10)
07:b19a : 4c f6 b0 JMP $b0f6 ; (decode_controlcode.l1120 + 0)
07:b19d : 4c da b0 JMP $b0da ; (decode_controlcode.s12 + 0)
.s40:
07:b1a0 : ad 5e 8b LDA $8b5e ; (importvars + 13)
07:b1a3 : c9 01 __ CMP #$01
07:b1a5 : f0 03 __ BEQ $b1aa ; (decode_controlcode.s40 + 10)
07:b1a7 : 4c 9a b0 JMP $b09a ; (decode_controlcode.s147 + 0)
07:b1aa : 4c 65 b0 JMP $b065 ; (decode_controlcode.s43 + 0)
.s82:
07:b1ad : c9 13 __ CMP #$13
07:b1af : d0 03 __ BNE $b1b4 ; (decode_controlcode.s83 + 0)
07:b1b1 : 4c da b0 JMP $b0da ; (decode_controlcode.s12 + 0)
.s83:
07:b1b4 : b0 03 __ BCS $b1b9 ; (decode_controlcode.s84 + 0)
07:b1b6 : 4c 6b b2 JMP $b26b ; (decode_controlcode.s85 + 0)
.s84:
07:b1b9 : c9 1f __ CMP #$1f
07:b1bb : d0 05 __ BNE $b1c2 ; (decode_controlcode.s99 + 0)
.s17:
07:b1bd : a9 02 __ LDA #$02
07:b1bf : 4c 51 b0 JMP $b051 ; (decode_controlcode.s1126 + 0)
.s99:
07:b1c2 : b0 51 __ BCS $b215 ; (decode_controlcode.s100 + 0)
.s101:
07:b1c4 : c9 1d __ CMP #$1d
07:b1c6 : d0 03 __ BNE $b1cb ; (decode_controlcode.s102 + 0)
07:b1c8 : 4c 2f b0 JMP $b02f ; (decode_controlcode.s188 + 0)
.s102:
07:b1cb : 90 05 __ BCC $b1d2 ; (decode_controlcode.s104 + 0)
.s16:
07:b1cd : a9 04 __ LDA #$04
07:b1cf : 4c 51 b0 JMP $b051 ; (decode_controlcode.s1126 + 0)
.s104:
07:b1d2 : c9 14 __ CMP #$14
07:b1d4 : f0 0c __ BEQ $b1e2 ; (decode_controlcode.s13 + 0)
.s105:
07:b1d6 : c9 1c __ CMP #$1c
07:b1d8 : f0 03 __ BEQ $b1dd ; (decode_controlcode.s14 + 0)
07:b1da : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s14:
07:b1dd : a9 08 __ LDA #$08
07:b1df : 4c 51 b0 JMP $b051 ; (decode_controlcode.s1126 + 0)
.s13:
07:b1e2 : a9 01 __ LDA #$01
07:b1e4 : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b1e7 : a9 00 __ LDA #$00
07:b1e9 : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b1ec : 8d f5 ab STA $abf5 ; (sstack + 2)
07:b1ef : 8d f6 ab STA $abf6 ; (sstack + 3)
07:b1f2 : 20 c3 b2 JSR $b2c3 ; (seqimport_move.s0 + 0)
07:b1f5 : a9 20 __ LDA #$20
07:b1f7 : 85 12 __ STA P5 
07:b1f9 : a9 0f __ LDA #$0f
07:b1fb : 85 13 __ STA P6 
07:b1fd : ad cf 87 LDA $87cf ; (canvas + 9)
07:b200 : 18 __ __ CLC
07:b201 : 6d 8e 87 ADC $878e ; (screen_row + 0)
07:b204 : 85 10 __ STA P3 
07:b206 : ad cd 87 LDA $87cd ; (canvas + 7)
07:b209 : 18 __ __ CLC
07:b20a : 6d 8c 87 ADC $878c ; (screen_col + 0)
07:b20d : 85 11 __ STA P4 
07:b20f : 20 2b 54 JSR $542b ; (screenmapplot.s0 + 0)
07:b212 : 4c 46 b0 JMP $b046 ; (decode_controlcode.s1001 + 0)
.s100:
07:b215 : c9 82 __ CMP #$82
07:b217 : d0 04 __ BNE $b21d ; (decode_controlcode.s107 + 0)
.s19:
07:b219 : a9 00 __ LDA #$00
07:b21b : f0 48 __ BEQ $b265 ; (decode_controlcode.s1125 + 0)
.s107:
07:b21d : b0 14 __ BCS $b233 ; (decode_controlcode.s108 + 0)
.s109:
07:b21f : c9 81 __ CMP #$81
07:b221 : f0 03 __ BEQ $b226 ; (decode_controlcode.s18 + 0)
07:b223 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s18:
07:b226 : ad 5e 8b LDA $8b5e ; (importvars + 13)
07:b229 : c9 01 __ CMP #$01
07:b22b : d0 03 __ BNE $b230 ; (decode_controlcode.s18 + 10)
07:b22d : 4c 8f b0 JMP $b08f ; (decode_controlcode.s37 + 0)
07:b230 : 4c 70 b0 JMP $b070 ; (decode_controlcode.s144 + 0)
.s108:
07:b233 : c9 8d __ CMP #$8d
07:b235 : f0 03 __ BEQ $b23a ; (decode_controlcode.s4 + 0)
07:b237 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s4:
07:b23a : a9 00 __ LDA #$00
07:b23c : 8d 59 8b STA $8b59 ; (importvars + 8)
07:b23f : 8d 5a 8b STA $8b5a ; (importvars + 9)
07:b242 : ad 5c 8b LDA $8b5c ; (importvars + 11)
07:b245 : cd 58 8b CMP $8b58 ; (importvars + 7)
07:b248 : d0 06 __ BNE $b250 ; (decode_controlcode.s1069 + 0)
.s1068:
07:b24a : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b24d : cd 57 8b CMP $8b57 ; (importvars + 6)
.s1069:
07:b250 : 90 03 __ BCC $b255 ; (decode_controlcode.s5 + 0)
07:b252 : 4c e8 b0 JMP $b0e8 ; (decode_controlcode.s183 + 0)
.s5:
07:b255 : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b258 : 69 01 __ ADC #$01
07:b25a : 8d 5b 8b STA $8b5b ; (importvars + 10)
07:b25d : ad 5c 8b LDA $8b5c ; (importvars + 11)
07:b260 : 69 00 __ ADC #$00
07:b262 : 4c e5 b0 JMP $b0e5 ; (decode_controlcode.s1123 + 0)
.s1125:
07:b265 : 8d 94 87 STA $8794 ; (plotunderline + 0)
07:b268 : 4c 46 b0 JMP $b046 ; (decode_controlcode.s1001 + 0)
.s85:
07:b26b : c9 0e __ CMP #$0e
07:b26d : d0 04 __ BNE $b273 ; (decode_controlcode.s86 + 0)
.s8:
07:b26f : a9 01 __ LDA #$01
07:b271 : d0 4a __ BNE $b2bd ; (decode_controlcode.s1122 + 0)
.s86:
07:b273 : b0 21 __ BCS $b296 ; (decode_controlcode.s87 + 0)
.s88:
07:b275 : c9 0a __ CMP #$0a
07:b277 : f0 c1 __ BEQ $b23a ; (decode_controlcode.s4 + 0)
.s89:
07:b279 : 90 07 __ BCC $b282 ; (decode_controlcode.s91 + 0)
.s90:
07:b27b : c9 0d __ CMP #$0d
07:b27d : f0 bb __ BEQ $b23a ; (decode_controlcode.s4 + 0)
07:b27f : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s91:
07:b282 : c9 02 __ CMP #$02
07:b284 : d0 04 __ BNE $b28a ; (decode_controlcode.s92 + 0)
.s2:
07:b286 : a9 01 __ LDA #$01
07:b288 : d0 db __ BNE $b265 ; (decode_controlcode.s1125 + 0)
.s92:
07:b28a : c9 05 __ CMP #$05
07:b28c : f0 03 __ BEQ $b291 ; (decode_controlcode.s3 + 0)
07:b28e : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s3:
07:b291 : a9 0f __ LDA #$0f
07:b293 : 4c 51 b0 JMP $b051 ; (decode_controlcode.s1126 + 0)
.s87:
07:b296 : c9 11 __ CMP #$11
07:b298 : d0 10 __ BNE $b2aa ; (decode_controlcode.s95 + 0)
.s10:
07:b29a : a9 00 __ LDA #$00
07:b29c : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b29f : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b2a2 : 8d f5 ab STA $abf5 ; (sstack + 2)
07:b2a5 : a9 01 __ LDA #$01
07:b2a7 : 4c 40 b0 JMP $b040 ; (decode_controlcode.s184 + 0)
.s95:
07:b2aa : b0 0c __ BCS $b2b8 ; (decode_controlcode.s11 + 0)
.s97:
07:b2ac : c9 0f __ CMP #$0f
07:b2ae : f0 03 __ BEQ $b2b3 ; (decode_controlcode.s9 + 0)
07:b2b0 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s9:
07:b2b3 : a9 01 __ LDA #$01
07:b2b5 : 4c c5 b0 JMP $b0c5 ; (decode_controlcode.s1127 + 0)
.s11:
07:b2b8 : a9 01 __ LDA #$01
07:b2ba : 4c b6 b0 JMP $b0b6 ; (decode_controlcode.s1128 + 0)
.s1122:
07:b2bd : 8d 96 87 STA $8796 ; (plotaltchar + 0)
07:b2c0 : 4c 46 b0 JMP $b046 ; (decode_controlcode.s1001 + 0)
--------------------------------------------------------------------
seqimport_move: ; seqimport_move(u8,u8,u8,u8)->void
.s0:
07:b2c3 : ad f3 ab LDA $abf3 ; (sstack + 0)
07:b2c6 : c9 01 __ CMP #$01
07:b2c8 : d0 32 __ BNE $b2fc ; (seqimport_move.s58 + 0)
.s1:
07:b2ca : ad 59 8b LDA $8b59 ; (importvars + 8)
07:b2cd : 0d 5a 8b ORA $8b5a ; (importvars + 9)
07:b2d0 : d0 03 __ BNE $b2d5 ; (seqimport_move.s5 + 0)
07:b2d2 : 4c 93 b4 JMP $b493 ; (seqimport_move.s4 + 0)
.s5:
07:b2d5 : ad 59 8b LDA $8b59 ; (importvars + 8)
07:b2d8 : 18 __ __ CLC
07:b2d9 : 69 ff __ ADC #$ff
07:b2db : 8d 59 8b STA $8b59 ; (importvars + 8)
07:b2de : b0 03 __ BCS $b2e3 ; (seqimport_move.s1037 + 0)
.s1036:
07:b2e0 : ce 5a 8b DEC $8b5a ; (importvars + 9)
.s1037:
07:b2e3 : ad 8c 87 LDA $878c ; (screen_col + 0)
07:b2e6 : 0d 8d 87 ORA $878d ; (screen_col + 1)
07:b2e9 : d0 03 __ BNE $b2ee ; (seqimport_move.s11 + 0)
07:b2eb : 4c 7e b4 JMP $b47e ; (seqimport_move.s10 + 0)
.s11:
07:b2ee : ad 8c 87 LDA $878c ; (screen_col + 0)
07:b2f1 : 18 __ __ CLC
07:b2f2 : 69 ff __ ADC #$ff
07:b2f4 : 8d 8c 87 STA $878c ; (screen_col + 0)
07:b2f7 : b0 03 __ BCS $b2fc ; (seqimport_move.s58 + 0)
.s1038:
07:b2f9 : ce 8d 87 DEC $878d ; (screen_col + 1)
.s58:
07:b2fc : ad f4 ab LDA $abf4 ; (sstack + 1)
07:b2ff : c9 01 __ CMP #$01
07:b301 : d0 4f __ BNE $b352 ; (seqimport_move.s62 + 0)
.s16:
07:b303 : ad 55 8b LDA $8b55 ; (importvars + 4)
07:b306 : 38 __ __ SEC
07:b307 : e9 01 __ SBC #$01
07:b309 : 85 50 __ STA T1 + 0 
07:b30b : ad 56 8b LDA $8b56 ; (importvars + 5)
07:b30e : e9 00 __ SBC #$00
07:b310 : 85 51 __ STA T1 + 1 
07:b312 : ad 5a 8b LDA $8b5a ; (importvars + 9)
07:b315 : c5 51 __ CMP T1 + 1 
07:b317 : d0 05 __ BNE $b31e ; (seqimport_move.s1019 + 0)
.s1018:
07:b319 : ad 59 8b LDA $8b59 ; (importvars + 8)
07:b31c : c5 50 __ CMP T1 + 0 
.s1019:
07:b31e : b0 03 __ BCS $b323 ; (seqimport_move.s20 + 0)
07:b320 : 4c 1c b4 JMP $b41c ; (seqimport_move.s19 + 0)
.s20:
07:b323 : ad 57 8b LDA $8b57 ; (importvars + 6)
07:b326 : e9 01 __ SBC #$01
07:b328 : 85 50 __ STA T1 + 0 
07:b32a : ad 58 8b LDA $8b58 ; (importvars + 7)
07:b32d : e9 00 __ SBC #$00
07:b32f : 85 51 __ STA T1 + 1 
07:b331 : ad 5c 8b LDA $8b5c ; (importvars + 11)
07:b334 : c5 51 __ CMP T1 + 1 
07:b336 : d0 05 __ BNE $b33d ; (seqimport_move.s1013 + 0)
.s1012:
07:b338 : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b33b : c5 50 __ CMP T1 + 0 
.s1013:
07:b33d : b0 13 __ BCS $b352 ; (seqimport_move.s62 + 0)
.s28:
07:b33f : a9 00 __ LDA #$00
07:b341 : 8d 59 8b STA $8b59 ; (importvars + 8)
07:b344 : 8d 5a 8b STA $8b5a ; (importvars + 9)
07:b347 : ee 5b 8b INC $8b5b ; (importvars + 10)
07:b34a : d0 03 __ BNE $b34f ; (seqimport_move.s1035 + 0)
.s1034:
07:b34c : ee 5c 8b INC $8b5c ; (importvars + 11)
.s1035:
07:b34f : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
.s62:
07:b352 : ad f5 ab LDA $abf5 ; (sstack + 2)
07:b355 : c9 01 __ CMP #$01
07:b357 : d0 2f __ BNE $b388 ; (seqimport_move.s66 + 0)
.s31:
07:b359 : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b35c : 0d 5c 8b ORA $8b5c ; (importvars + 11)
07:b35f : f0 27 __ BEQ $b388 ; (seqimport_move.s66 + 0)
.s34:
07:b361 : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b364 : 18 __ __ CLC
07:b365 : 69 ff __ ADC #$ff
07:b367 : 8d 5b 8b STA $8b5b ; (importvars + 10)
07:b36a : b0 03 __ BCS $b36f ; (seqimport_move.s1029 + 0)
.s1028:
07:b36c : ce 5c 8b DEC $8b5c ; (importvars + 11)
.s1029:
07:b36f : ad 8e 87 LDA $878e ; (screen_row + 0)
07:b372 : 0d 8f 87 ORA $878f ; (screen_row + 1)
07:b375 : d0 03 __ BNE $b37a ; (seqimport_move.s38 + 0)
07:b377 : 4c 07 b4 JMP $b407 ; (seqimport_move.s37 + 0)
.s38:
07:b37a : ad 8e 87 LDA $878e ; (screen_row + 0)
07:b37d : 18 __ __ CLC
07:b37e : 69 ff __ ADC #$ff
07:b380 : 8d 8e 87 STA $878e ; (screen_row + 0)
07:b383 : b0 03 __ BCS $b388 ; (seqimport_move.s66 + 0)
.s1032:
07:b385 : ce 8f 87 DEC $878f ; (screen_row + 1)
.s66:
07:b388 : ad f6 ab LDA $abf6 ; (sstack + 3)
07:b38b : c9 01 __ CMP #$01
07:b38d : d0 70 __ BNE $b3ff ; (seqimport_move.s1001 + 0)
.s43:
07:b38f : ad 57 8b LDA $8b57 ; (importvars + 6)
07:b392 : 38 __ __ SEC
07:b393 : e9 01 __ SBC #$01
07:b395 : 85 50 __ STA T1 + 0 
07:b397 : ad 58 8b LDA $8b58 ; (importvars + 7)
07:b39a : e9 00 __ SBC #$00
07:b39c : 85 51 __ STA T1 + 1 
07:b39e : ad 5c 8b LDA $8b5c ; (importvars + 11)
07:b3a1 : c5 51 __ CMP T1 + 1 
07:b3a3 : d0 05 __ BNE $b3aa ; (seqimport_move.s1007 + 0)
.s1006:
07:b3a5 : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b3a8 : c5 50 __ CMP T1 + 0 
.s1007:
07:b3aa : b0 53 __ BCS $b3ff ; (seqimport_move.s1001 + 0)
.s46:
07:b3ac : ee 5b 8b INC $8b5b ; (importvars + 10)
07:b3af : d0 03 __ BNE $b3b4 ; (seqimport_move.s1031 + 0)
.s1030:
07:b3b1 : ee 5c 8b INC $8b5c ; (importvars + 11)
.s1031:
07:b3b4 : ad 8e 87 LDA $878e ; (screen_row + 0)
07:b3b7 : 85 50 __ STA T1 + 0 
07:b3b9 : ad 8f 87 LDA $878f ; (screen_row + 1)
07:b3bc : 85 51 __ STA T1 + 1 
07:b3be : 20 05 33 JSR $3305 ; (getmaxy.s0 + 0)
07:b3c1 : 85 44 __ STA T2 + 0 
07:b3c3 : a5 51 __ LDA T1 + 1 
07:b3c5 : d0 06 __ BNE $b3cd ; (seqimport_move.s50 + 0)
.s1004:
07:b3c7 : a5 50 __ LDA T1 + 0 
07:b3c9 : c5 44 __ CMP T2 + 0 
07:b3cb : f0 10 __ BEQ $b3dd ; (seqimport_move.s49 + 0)
.s50:
07:b3cd : 18 __ __ CLC
07:b3ce : a5 50 __ LDA T1 + 0 
07:b3d0 : 69 01 __ ADC #$01
07:b3d2 : 8d 8e 87 STA $878e ; (screen_row + 0)
07:b3d5 : a5 51 __ LDA T1 + 1 
07:b3d7 : 69 00 __ ADC #$00
07:b3d9 : 8d 8f 87 STA $878f ; (screen_row + 1)
07:b3dc : 60 __ __ RTS
.s49:
07:b3dd : 18 __ __ CLC
07:b3de : 6d cf 87 ADC $87cf ; (canvas + 9)
07:b3e1 : aa __ __ TAX
07:b3e2 : ad d0 87 LDA $87d0 ; (canvas + 10)
07:b3e5 : 69 00 __ ADC #$00
07:b3e7 : a8 __ __ TAY
07:b3e8 : ad cb 87 LDA $87cb ; (canvas + 5)
07:b3eb : 38 __ __ SEC
07:b3ec : e9 01 __ SBC #$01
07:b3ee : 85 44 __ STA T2 + 0 
07:b3f0 : ad cc 87 LDA $87cc ; (canvas + 6)
07:b3f3 : e9 00 __ SBC #$00
07:b3f5 : 85 45 __ STA T2 + 1 
07:b3f7 : c4 45 __ CPY T2 + 1 
07:b3f9 : d0 02 __ BNE $b3fd ; (seqimport_move.s1003 + 0)
.s1002:
07:b3fb : e4 44 __ CPX T2 + 0 
.s1003:
07:b3fd : 90 01 __ BCC $b400 ; (seqimport_move.s52 + 0)
.s1001:
07:b3ff : 60 __ __ RTS
.s52:
07:b400 : a9 04 __ LDA #$04
07:b402 : 85 18 __ STA P11 
07:b404 : 4c 48 44 JMP $4448 ; (vdcwin_viewportscroll.s0 + 0)
.s37:
07:b407 : ad cf 87 LDA $87cf ; (canvas + 9)
07:b40a : 0d d0 87 ORA $87d0 ; (canvas + 10)
07:b40d : d0 03 __ BNE $b412 ; (seqimport_move.s40 + 0)
07:b40f : 4c 88 b3 JMP $b388 ; (seqimport_move.s66 + 0)
.s40:
07:b412 : a9 08 __ LDA #$08
07:b414 : 85 18 __ STA P11 
07:b416 : 20 48 44 JSR $4448 ; (vdcwin_viewportscroll.s0 + 0)
07:b419 : 4c 88 b3 JMP $b388 ; (seqimport_move.s66 + 0)
.s19:
07:b41c : ee 59 8b INC $8b59 ; (importvars + 8)
07:b41f : d0 03 __ BNE $b424 ; (seqimport_move.s1027 + 0)
.s1026:
07:b421 : ee 5a 8b INC $8b5a ; (importvars + 9)
.s1027:
07:b424 : ad 8c 87 LDA $878c ; (screen_col + 0)
07:b427 : 85 50 __ STA T1 + 0 
07:b429 : ad 8d 87 LDA $878d ; (screen_col + 1)
07:b42c : 85 51 __ STA T1 + 1 
07:b42e : 20 e9 32 JSR $32e9 ; (getmaxx.s0 + 0)
07:b431 : 85 44 __ STA T2 + 0 
07:b433 : a5 51 __ LDA T1 + 1 
07:b435 : d0 06 __ BNE $b43d ; (seqimport_move.s23 + 0)
.s1016:
07:b437 : a5 50 __ LDA T1 + 0 
07:b439 : c5 44 __ CMP T2 + 0 
07:b43b : f0 12 __ BEQ $b44f ; (seqimport_move.s22 + 0)
.s23:
07:b43d : 18 __ __ CLC
07:b43e : a5 50 __ LDA T1 + 0 
07:b440 : 69 01 __ ADC #$01
07:b442 : 8d 8c 87 STA $878c ; (screen_col + 0)
07:b445 : a5 51 __ LDA T1 + 1 
07:b447 : 69 00 __ ADC #$00
07:b449 : 8d 8d 87 STA $878d ; (screen_col + 1)
07:b44c : 4c 52 b3 JMP $b352 ; (seqimport_move.s62 + 0)
.s22:
07:b44f : 18 __ __ CLC
07:b450 : 6d cd 87 ADC $87cd ; (canvas + 7)
07:b453 : aa __ __ TAX
07:b454 : ad ce 87 LDA $87ce ; (canvas + 8)
07:b457 : 69 00 __ ADC #$00
07:b459 : a8 __ __ TAY
07:b45a : ad c9 87 LDA $87c9 ; (canvas + 3)
07:b45d : 38 __ __ SEC
07:b45e : e9 01 __ SBC #$01
07:b460 : 85 44 __ STA T2 + 0 
07:b462 : ad ca 87 LDA $87ca ; (canvas + 4)
07:b465 : e9 00 __ SBC #$00
07:b467 : 85 45 __ STA T2 + 1 
07:b469 : c4 45 __ CPY T2 + 1 
07:b46b : d0 02 __ BNE $b46f ; (seqimport_move.s1015 + 0)
.s1014:
07:b46d : e4 44 __ CPX T2 + 0 
.s1015:
07:b46f : 90 03 __ BCC $b474 ; (seqimport_move.s25 + 0)
07:b471 : 4c 52 b3 JMP $b352 ; (seqimport_move.s62 + 0)
.s25:
07:b474 : a9 02 __ LDA #$02
07:b476 : 85 18 __ STA P11 
07:b478 : 20 48 44 JSR $4448 ; (vdcwin_viewportscroll.s0 + 0)
07:b47b : 4c 52 b3 JMP $b352 ; (seqimport_move.s62 + 0)
.s10:
07:b47e : ad cd 87 LDA $87cd ; (canvas + 7)
07:b481 : 0d ce 87 ORA $87ce ; (canvas + 8)
07:b484 : d0 03 __ BNE $b489 ; (seqimport_move.s13 + 0)
07:b486 : 4c fc b2 JMP $b2fc ; (seqimport_move.s58 + 0)
.s13:
07:b489 : a9 01 __ LDA #$01
07:b48b : 85 18 __ STA P11 
07:b48d : 20 48 44 JSR $4448 ; (vdcwin_viewportscroll.s0 + 0)
07:b490 : 4c fc b2 JMP $b2fc ; (seqimport_move.s58 + 0)
.s4:
07:b493 : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b496 : 0d 5c 8b ORA $8b5c ; (importvars + 11)
07:b499 : d0 03 __ BNE $b49e ; (seqimport_move.s7 + 0)
07:b49b : 4c fc b2 JMP $b2fc ; (seqimport_move.s58 + 0)
.s7:
07:b49e : ad 5b 8b LDA $8b5b ; (importvars + 10)
07:b4a1 : 18 __ __ CLC
07:b4a2 : 69 ff __ ADC #$ff
07:b4a4 : 8d 5b 8b STA $8b5b ; (importvars + 10)
07:b4a7 : b0 03 __ BCS $b4ac ; (seqimport_move.s1025 + 0)
.s1024:
07:b4a9 : ce 5c 8b DEC $8b5c ; (importvars + 11)
.s1025:
07:b4ac : ad 55 8b LDA $8b55 ; (importvars + 4)
07:b4af : 38 __ __ SEC
07:b4b0 : e9 01 __ SBC #$01
07:b4b2 : 8d 59 8b STA $8b59 ; (importvars + 8)
07:b4b5 : ad 56 8b LDA $8b56 ; (importvars + 5)
07:b4b8 : e9 00 __ SBC #$00
07:b4ba : 8d 5a 8b STA $8b5a ; (importvars + 9)
07:b4bd : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
07:b4c0 : 4c fc b2 JMP $b2fc ; (seqimport_move.s58 + 0)
--------------------------------------------------------------------
export_seq: ; export_seq()->void
.s1000:
07:b4c3 : a2 0d __ LDX #$0d
07:b4c5 : b5 53 __ LDA T0 + 0,x 
07:b4c7 : 9d ad ab STA $abad,x ; (projbuffer + 21)
07:b4ca : ca __ __ DEX
07:b4cb : 10 f8 __ BPL $b4c5 ; (export_seq.s1000 + 2)
07:b4cd : 38 __ __ SEC
07:b4ce : a5 23 __ LDA SP + 0 
07:b4d0 : e9 08 __ SBC #$08
07:b4d2 : 85 23 __ STA SP + 0 
07:b4d4 : b0 02 __ BCS $b4d8 ; (export_seq.s0 + 0)
07:b4d6 : c6 24 __ DEC SP + 1 
.s0:
07:b4d8 : a9 0f __ LDA #$0f
07:b4da : 8d fa ab STA $abfa ; (sstack + 7)
07:b4dd : a9 e0 __ LDA #$e0
07:b4df : 8d f8 ab STA $abf8 ; (sstack + 5)
07:b4e2 : a9 b7 __ LDA #$b7
07:b4e4 : 8d f9 ab STA $abf9 ; (sstack + 6)
07:b4e7 : 20 ac 4b JSR $4bac ; (chooseidandfilename.s0 + 0)
07:b4ea : a5 1c __ LDA ACCU + 1 
07:b4ec : c9 ff __ CMP #$ff
07:b4ee : d0 09 __ BNE $b4f9 ; (export_seq.s3 + 0)
.s1038:
07:b4f0 : a5 1b __ LDA ACCU + 0 
07:b4f2 : c9 ff __ CMP #$ff
07:b4f4 : d0 03 __ BNE $b4f9 ; (export_seq.s3 + 0)
07:b4f6 : 4c e4 b5 JMP $b5e4 ; (export_seq.s1055 + 0)
.s3:
07:b4f9 : a9 97 __ LDA #$97
07:b4fb : 8d fc ab STA $abfc ; (sstack + 9)
07:b4fe : a9 87 __ LDA #$87
07:b500 : 8d fd ab STA $abfd ; (sstack + 10)
07:b503 : ad ac 87 LDA $87ac ; (targetdevice + 0)
07:b506 : 85 55 __ STA T1 + 0 
07:b508 : 8d fe ab STA $abfe ; (sstack + 11)
07:b50b : 20 48 62 JSR $6248 ; (checkiffileexists.s1000 + 0)
07:b50e : a5 1b __ LDA ACCU + 0 
07:b510 : d0 03 __ BNE $b515 ; (export_seq.s5 + 0)
07:b512 : 4c e4 b5 JMP $b5e4 ; (export_seq.s1055 + 0)
.s5:
07:b515 : a9 00 __ LDA #$00
07:b517 : 85 56 __ STA T3 + 0 
07:b519 : a5 1b __ LDA ACCU + 0 
07:b51b : c9 02 __ CMP #$02
07:b51d : d0 26 __ BNE $b545 ; (export_seq.s10 + 0)
.s8:
07:b51f : a9 97 __ LDA #$97
07:b521 : a0 06 __ LDY #$06
07:b523 : 91 23 __ STA (SP + 0),y 
07:b525 : a9 87 __ LDA #$87
07:b527 : c8 __ __ INY
07:b528 : 91 23 __ STA (SP + 0),y 
07:b52a : a9 51 __ LDA #$51
07:b52c : a0 02 __ LDY #$02
07:b52e : 91 23 __ STA (SP + 0),y 
07:b530 : a9 89 __ LDA #$89
07:b532 : c8 __ __ INY
07:b533 : 91 23 __ STA (SP + 0),y 
07:b535 : a9 ec __ LDA #$ec
07:b537 : c8 __ __ INY
07:b538 : 91 23 __ STA (SP + 0),y 
07:b53a : a9 b7 __ LDA #$b7
07:b53c : c8 __ __ INY
07:b53d : 91 23 __ STA (SP + 0),y 
07:b53f : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
07:b542 : 20 ce 62 JSR $62ce ; (cmd@proxy + 0)
.s10:
07:b545 : a9 97 __ LDA #$97
07:b547 : a0 06 __ LDY #$06
07:b549 : 91 23 __ STA (SP + 0),y 
07:b54b : a9 87 __ LDA #$87
07:b54d : c8 __ __ INY
07:b54e : 91 23 __ STA (SP + 0),y 
07:b550 : a9 00 __ LDA #$00
07:b552 : a0 02 __ LDY #$02
07:b554 : 91 23 __ STA (SP + 0),y 
07:b556 : a9 89 __ LDA #$89
07:b558 : c8 __ __ INY
07:b559 : 91 23 __ STA (SP + 0),y 
07:b55b : a9 f1 __ LDA #$f1
07:b55d : c8 __ __ INY
07:b55e : 91 23 __ STA (SP + 0),y 
07:b560 : a9 b7 __ LDA #$b7
07:b562 : c8 __ __ INY
07:b563 : 91 23 __ STA (SP + 0),y 
07:b565 : 20 7d 32 JSR $327d ; (sprintf.s0 + 0)
07:b568 : a9 00 __ LDA #$00
07:b56a : 85 0d __ STA P0 
07:b56c : 85 0e __ STA P1 
07:b56e : 20 b6 2a JSR $2ab6 ; (krnio_setbnk.s0 + 0)
07:b571 : 20 bd 2a JSR $2abd ; (krnio_setnam@proxy + 0)
07:b574 : a5 55 __ LDA T1 + 0 
07:b576 : 85 0e __ STA P1 
07:b578 : 20 55 63 JSR $6355 ; (krnio_open@proxy + 0)
07:b57b : 09 00 __ ORA #$00
07:b57d : f0 65 __ BEQ $b5e4 ; (export_seq.s1055 + 0)
.s11:
07:b57f : a9 0d __ LDA #$0d
07:b581 : 85 12 __ STA P5 
07:b583 : a9 00 __ LDA #$00
07:b585 : 85 13 __ STA P6 
07:b587 : a9 b8 __ LDA #$b8
07:b589 : 85 14 __ STA P7 
07:b58b : 20 de 80 JSR $80de ; (vdc_prints_attr@proxy + 0)
07:b58e : a9 01 __ LDA #$01
07:b590 : 20 ec 7b JSR $7bec ; (krnio_chkout.s1000 + 0)
07:b593 : 09 00 __ ORA #$00
07:b595 : d0 08 __ BNE $b59f ; (export_seq.s15 + 0)
.s16:
07:b597 : a9 01 __ LDA #$01
07:b599 : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
07:b59c : 4c e1 b5 JMP $b5e1 ; (export_seq.s1056 + 0)
.s15:
07:b59f : ad cb 87 LDA $87cb ; (canvas + 5)
07:b5a2 : 0d cc 87 ORA $87cc ; (canvas + 6)
07:b5a5 : f0 2e __ BEQ $b5d5 ; (export_seq.s21 + 0)
.s81:
07:b5a7 : a9 00 __ LDA #$00
07:b5a9 : 85 53 __ STA T0 + 0 
07:b5ab : 85 54 __ STA T0 + 1 
.l19:
07:b5ad : ad c9 87 LDA $87c9 ; (canvas + 3)
07:b5b0 : 0d ca 87 ORA $87ca ; (canvas + 4)
07:b5b3 : f0 0c __ BEQ $b5c1 ; (export_seq.s20 + 0)
.s80:
07:b5b5 : a9 00 __ LDA #$00
07:b5b7 : 85 57 __ STA T4 + 0 
07:b5b9 : 85 58 __ STA T4 + 1 
07:b5bb : a9 7f __ LDA #$7f
07:b5bd : 85 0d __ STA P0 
07:b5bf : d0 3c __ BNE $b5fd ; (export_seq.l23 + 0)
.s20:
07:b5c1 : e6 53 __ INC T0 + 0 
07:b5c3 : d0 02 __ BNE $b5c7 ; (export_seq.s1074 + 0)
.s1073:
07:b5c5 : e6 54 __ INC T0 + 1 
.s1074:
07:b5c7 : a5 54 __ LDA T0 + 1 
07:b5c9 : cd cc 87 CMP $87cc ; (canvas + 6)
07:b5cc : d0 05 __ BNE $b5d3 ; (export_seq.s1003 + 0)
.s1002:
07:b5ce : a5 53 __ LDA T0 + 0 
07:b5d0 : cd cb 87 CMP $87cb ; (canvas + 5)
.s1003:
07:b5d3 : 90 d8 __ BCC $b5ad ; (export_seq.l19 + 0)
.s21:
07:b5d5 : 20 1d 64 JSR $641d ; (krnio_clrchn.s0 + 0)
07:b5d8 : a9 01 __ LDA #$01
07:b5da : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
07:b5dd : a5 56 __ LDA T3 + 0 
07:b5df : f0 03 __ BEQ $b5e4 ; (export_seq.s1055 + 0)
.s1056:
07:b5e1 : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
.s1055:
07:b5e4 : 20 1d 3a JSR $3a1d ; (vdcwin_win_free.s0 + 0)
.s1001:
07:b5e7 : 18 __ __ CLC
07:b5e8 : a5 23 __ LDA SP + 0 
07:b5ea : 69 08 __ ADC #$08
07:b5ec : 85 23 __ STA SP + 0 
07:b5ee : 90 02 __ BCC $b5f2 ; (export_seq.s1001 + 11)
07:b5f0 : e6 24 __ INC SP + 1 
07:b5f2 : a2 0d __ LDX #$0d
07:b5f4 : bd ad ab LDA $abad,x ; (projbuffer + 21)
07:b5f7 : 95 53 __ STA T0 + 0,x 
07:b5f9 : ca __ __ DEX
07:b5fa : 10 f8 __ BPL $b5f4 ; (export_seq.s1001 + 13)
07:b5fc : 60 __ __ RTS
.l23:
07:b5fd : ad c9 87 LDA $87c9 ; (canvas + 3)
07:b600 : 85 59 __ STA T5 + 0 
07:b602 : 85 1b __ STA ACCU + 0 
07:b604 : ad ca 87 LDA $87ca ; (canvas + 4)
07:b607 : 85 5a __ STA T5 + 1 
07:b609 : 85 1c __ STA ACCU + 1 
07:b60b : a5 53 __ LDA T0 + 0 
07:b60d : 85 03 __ STA WORK + 0 
07:b60f : a5 54 __ LDA T0 + 1 
07:b611 : 85 04 __ STA WORK + 1 
07:b613 : 20 87 7c JSR $7c87 ; (mul16 + 0)
07:b616 : 18 __ __ CLC
07:b617 : a5 06 __ LDA WORK + 3 
07:b619 : 69 58 __ ADC #$58
07:b61b : aa __ __ TAX
07:b61c : 18 __ __ CLC
07:b61d : a5 05 __ LDA WORK + 2 
07:b61f : 65 57 __ ADC T4 + 0 
07:b621 : 85 0e __ STA P1 
07:b623 : 8a __ __ TXA
07:b624 : 65 58 __ ADC T4 + 1 
07:b626 : 85 0f __ STA P2 
07:b628 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
07:b62b : 85 55 __ STA T1 + 0 
07:b62d : ad cb 87 LDA $87cb ; (canvas + 5)
07:b630 : 85 1b __ STA ACCU + 0 
07:b632 : ad cc 87 LDA $87cc ; (canvas + 6)
07:b635 : 85 1c __ STA ACCU + 1 
07:b637 : a5 59 __ LDA T5 + 0 
07:b639 : 85 03 __ STA WORK + 0 
07:b63b : a5 5a __ LDA T5 + 1 
07:b63d : 85 04 __ STA WORK + 1 
07:b63f : 20 87 7c JSR $7c87 ; (mul16 + 0)
07:b642 : 18 __ __ CLC
07:b643 : a5 05 __ LDA WORK + 2 
07:b645 : 65 0e __ ADC P1 
07:b647 : aa __ __ TAX
07:b648 : a5 06 __ LDA WORK + 3 
07:b64a : 65 0f __ ADC P2 
07:b64c : a8 __ __ TAY
07:b64d : 8a __ __ TXA
07:b64e : 18 __ __ CLC
07:b64f : 69 30 __ ADC #$30
07:b651 : 85 0e __ STA P1 
07:b653 : 90 01 __ BCC $b656 ; (export_seq.s1058 + 0)
.s1057:
07:b655 : c8 __ __ INY
.s1058:
07:b656 : 84 0f __ STY P2 
07:b658 : 20 26 15 JSR $1526 ; (bnk_readb.s0 + 0)
07:b65b : a8 __ __ TAY
07:b65c : 24 55 __ BIT T1 + 0 
07:b65e : 10 0a __ BPL $b66a ; (export_seq.s191 + 0)
.s30:
07:b660 : 49 40 __ EOR #$40
07:b662 : a8 __ __ TAY
07:b663 : 38 __ __ SEC
07:b664 : a5 55 __ LDA T1 + 0 
07:b666 : e9 80 __ SBC #$80
07:b668 : 85 55 __ STA T1 + 0 
.s191:
07:b66a : a9 20 __ LDA #$20
07:b66c : 85 5c __ STA T7 + 0 
07:b66e : a5 55 __ LDA T1 + 0 
07:b670 : c9 20 __ CMP #$20
07:b672 : b0 06 __ BCS $b67a ; (export_seq.s35 + 0)
.s33:
07:b674 : 69 40 __ ADC #$40
07:b676 : 85 5c __ STA T7 + 0 
07:b678 : a5 55 __ LDA T1 + 0 
.s35:
07:b67a : c9 20 __ CMP #$20
07:b67c : 90 15 __ BCC $b693 ; (export_seq.s42 + 0)
.s39:
07:b67e : c9 40 __ CMP #$40
07:b680 : b0 04 __ BCS $b686 ; (export_seq.s43 + 0)
.s36:
07:b682 : 85 5c __ STA T7 + 0 
07:b684 : 90 0d __ BCC $b693 ; (export_seq.s42 + 0)
.s43:
07:b686 : c9 5e __ CMP #$5e
07:b688 : b0 09 __ BCS $b693 ; (export_seq.s42 + 0)
.s40:
07:b68a : 69 80 __ ADC #$80
07:b68c : 85 5c __ STA T7 + 0 
07:b68e : a5 55 __ LDA T1 + 0 
07:b690 : 4c a0 b6 JMP $b6a0 ; (export_seq.s46 + 0)
.s42:
07:b693 : c9 5e __ CMP #$5e
07:b695 : d0 09 __ BNE $b6a0 ; (export_seq.s46 + 0)
.s44:
07:b697 : a9 ff __ LDA #$ff
07:b699 : 85 5c __ STA T7 + 0 
07:b69b : a5 55 __ LDA T1 + 0 
07:b69d : 4c a8 b6 JMP $b6a8 ; (export_seq.s49 + 0)
.s46:
07:b6a0 : c9 5f __ CMP #$5f
07:b6a2 : d0 04 __ BNE $b6a8 ; (export_seq.s49 + 0)
.s47:
07:b6a4 : a9 df __ LDA #$df
07:b6a6 : d0 0b __ BNE $b6b3 ; (export_seq.s1054 + 0)
.s49:
07:b6a8 : c9 60 __ CMP #$60
07:b6aa : 90 09 __ BCC $b6b5 ; (export_seq.s52 + 0)
.s53:
07:b6ac : 09 00 __ ORA #$00
07:b6ae : 30 05 __ BMI $b6b5 ; (export_seq.s52 + 0)
.s50:
07:b6b0 : 18 __ __ CLC
07:b6b1 : 69 40 __ ADC #$40
.s1054:
07:b6b3 : 85 5c __ STA T7 + 0 
.s52:
07:b6b5 : a5 57 __ LDA T4 + 0 
07:b6b7 : 05 58 __ ORA T4 + 1 
07:b6b9 : d0 09 __ BNE $b6c4 ; (export_seq.s55 + 0)
.s57:
07:b6bb : a5 53 __ LDA T0 + 0 
07:b6bd : 05 54 __ ORA T0 + 1 
07:b6bf : d0 03 __ BNE $b6c4 ; (export_seq.s55 + 0)
07:b6c1 : 4c 7a b7 JMP $b77a ; (export_seq.s54 + 0)
.s55:
07:b6c4 : 98 __ __ TYA
07:b6c5 : 29 0f __ AND #$0f
07:b6c7 : aa __ __ TAX
07:b6c8 : 98 __ __ TYA
07:b6c9 : 29 80 __ AND #$80
07:b6cb : 85 5e __ STA T9 + 0 
07:b6cd : 98 __ __ TYA
07:b6ce : 29 10 __ AND #$10
07:b6d0 : 85 5f __ STA T10 + 0 
07:b6d2 : 98 __ __ TYA
07:b6d3 : 29 40 __ AND #$40
07:b6d5 : 85 60 __ STA T11 + 0 
07:b6d7 : 98 __ __ TYA
07:b6d8 : 29 20 __ AND #$20
07:b6da : 85 5b __ STA T6 + 0 
07:b6dc : ec c1 ab CPX $abc1 ; (projbuffer + 41)
07:b6df : f0 09 __ BEQ $b6ea ; (export_seq.s60 + 0)
.s58:
07:b6e1 : 8e c1 ab STX $abc1 ; (projbuffer + 41)
07:b6e4 : bd 18 b8 LDA $b818,x ; (seqcolor + 0)
07:b6e7 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
.s60:
07:b6ea : a5 5e __ LDA T9 + 0 
07:b6ec : cd c5 ab CMP $abc5 ; (projbuffer + 45)
07:b6ef : f0 10 __ BEQ $b701 ; (export_seq.s63 + 0)
.s61:
07:b6f1 : 09 00 __ ORA #$00
07:b6f3 : 8d c5 ab STA $abc5 ; (projbuffer + 45)
07:b6f6 : f0 04 __ BEQ $b6fc ; (export_seq.s109 + 0)
.s108:
07:b6f8 : a9 0e __ LDA #$0e
07:b6fa : d0 02 __ BNE $b6fe ; (export_seq.s1052 + 0)
.s109:
07:b6fc : a9 8e __ LDA #$8e
.s1052:
07:b6fe : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
.s63:
07:b701 : a5 5b __ LDA T6 + 0 
07:b703 : cd c2 ab CMP $abc2 ; (projbuffer + 42)
07:b706 : f0 10 __ BEQ $b718 ; (export_seq.s66 + 0)
.s64:
07:b708 : 09 00 __ ORA #$00
07:b70a : 8d c2 ab STA $abc2 ; (projbuffer + 42)
07:b70d : f0 04 __ BEQ $b713 ; (export_seq.s112 + 0)
.s111:
07:b70f : a9 02 __ LDA #$02
07:b711 : d0 02 __ BNE $b715 ; (export_seq.s1050 + 0)
.s112:
07:b713 : a9 82 __ LDA #$82
.s1050:
07:b715 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
.s66:
07:b718 : a5 60 __ LDA T11 + 0 
07:b71a : cd c4 ab CMP $abc4 ; (projbuffer + 44)
07:b71d : f0 10 __ BEQ $b72f ; (export_seq.s69 + 0)
.s67:
07:b71f : 09 00 __ ORA #$00
07:b721 : 8d c4 ab STA $abc4 ; (projbuffer + 44)
07:b724 : f0 04 __ BEQ $b72a ; (export_seq.s115 + 0)
.s114:
07:b726 : a9 12 __ LDA #$12
07:b728 : d0 02 __ BNE $b72c ; (export_seq.s1048 + 0)
.s115:
07:b72a : a9 92 __ LDA #$92
.s1048:
07:b72c : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
.s69:
07:b72f : a5 5f __ LDA T10 + 0 
07:b731 : cd c3 ab CMP $abc3 ; (projbuffer + 43)
07:b734 : f0 10 __ BEQ $b746 ; (export_seq.s56 + 0)
.s70:
07:b736 : 09 00 __ ORA #$00
07:b738 : 8d c3 ab STA $abc3 ; (projbuffer + 43)
07:b73b : f0 04 __ BEQ $b741 ; (export_seq.s1068 + 0)
.s1069:
07:b73d : a9 0f __ LDA #$0f
07:b73f : d0 02 __ BNE $b743 ; (export_seq.s1043 + 0)
.s1068:
07:b741 : a9 8f __ LDA #$8f
.s1043:
07:b743 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
.s56:
07:b746 : a5 5c __ LDA T7 + 0 
07:b748 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
07:b74b : 20 fb 61 JSR $61fb ; (krnio_status.s0 + 0)
07:b74e : 85 56 __ STA T3 + 0 
07:b750 : 09 00 __ ORA #$00
07:b752 : f0 0e __ BEQ $b762 ; (export_seq.s24 + 0)
.s73:
07:b754 : 20 1d 64 JSR $641d ; (krnio_clrchn.s0 + 0)
07:b757 : a9 01 __ LDA #$01
07:b759 : 20 f8 61 JSR $61f8 ; (krnio_close.s0 + 0)
07:b75c : 20 cf 35 JSR $35cf ; (menu_fileerrormessage.s1000 + 0)
07:b75f : 4c e7 b5 JMP $b5e7 ; (export_seq.s1001 + 0)
.s24:
07:b762 : e6 57 __ INC T4 + 0 
07:b764 : d0 02 __ BNE $b768 ; (export_seq.s1072 + 0)
.s1071:
07:b766 : e6 58 __ INC T4 + 1 
.s1072:
07:b768 : a5 58 __ LDA T4 + 1 
07:b76a : c5 5a __ CMP T5 + 1 
07:b76c : d0 04 __ BNE $b772 ; (export_seq.s1005 + 0)
.s1004:
07:b76e : a5 57 __ LDA T4 + 0 
07:b770 : c5 59 __ CMP T5 + 0 
.s1005:
07:b772 : b0 03 __ BCS $b777 ; (export_seq.s1005 + 5)
07:b774 : 4c fd b5 JMP $b5fd ; (export_seq.l23 + 0)
07:b777 : 4c c1 b5 JMP $b5c1 ; (export_seq.s20 + 0)
.s54:
07:b77a : 98 __ __ TYA
07:b77b : 29 0f __ AND #$0f
07:b77d : 85 5d __ STA T8 + 0 
07:b77f : 8d c1 ab STA $abc1 ; (projbuffer + 41)
07:b782 : 98 __ __ TYA
07:b783 : 29 80 __ AND #$80
07:b785 : 85 5e __ STA T9 + 0 
07:b787 : 8d c5 ab STA $abc5 ; (projbuffer + 45)
07:b78a : 98 __ __ TYA
07:b78b : 29 10 __ AND #$10
07:b78d : 85 5f __ STA T10 + 0 
07:b78f : 8d c3 ab STA $abc3 ; (projbuffer + 43)
07:b792 : 98 __ __ TYA
07:b793 : 29 40 __ AND #$40
07:b795 : 85 60 __ STA T11 + 0 
07:b797 : 8d c4 ab STA $abc4 ; (projbuffer + 44)
07:b79a : 98 __ __ TYA
07:b79b : 29 20 __ AND #$20
07:b79d : 85 5b __ STA T6 + 0 
07:b79f : 8d c2 ab STA $abc2 ; (projbuffer + 42)
07:b7a2 : a9 93 __ LDA #$93
07:b7a4 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
07:b7a7 : a6 5d __ LDX T8 + 0 
07:b7a9 : bd 18 b8 LDA $b818,x ; (seqcolor + 0)
07:b7ac : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
07:b7af : a5 5e __ LDA T9 + 0 
07:b7b1 : f0 04 __ BEQ $b7b7 ; (export_seq.s1059 + 0)
.s1060:
07:b7b3 : a9 0e __ LDA #$0e
07:b7b5 : d0 02 __ BNE $b7b9 ; (export_seq.s1061 + 0)
.s1059:
07:b7b7 : a9 8e __ LDA #$8e
.s1061:
07:b7b9 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
07:b7bc : a5 5b __ LDA T6 + 0 
07:b7be : f0 04 __ BEQ $b7c4 ; (export_seq.s1062 + 0)
.s1063:
07:b7c0 : a9 02 __ LDA #$02
07:b7c2 : d0 02 __ BNE $b7c6 ; (export_seq.s1064 + 0)
.s1062:
07:b7c4 : a9 82 __ LDA #$82
.s1064:
07:b7c6 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
07:b7c9 : a5 60 __ LDA T11 + 0 
07:b7cb : f0 04 __ BEQ $b7d1 ; (export_seq.s1065 + 0)
.s1066:
07:b7cd : a9 12 __ LDA #$12
07:b7cf : d0 02 __ BNE $b7d3 ; (export_seq.s1067 + 0)
.s1065:
07:b7d1 : a9 92 __ LDA #$92
.s1067:
07:b7d3 : 20 47 7c JSR $7c47 ; (krnio_chrout.s0 + 0)
07:b7d6 : a5 5f __ LDA T10 + 0 
07:b7d8 : d0 03 __ BNE $b7dd ; (export_seq.s1067 + 10)
07:b7da : 4c 41 b7 JMP $b741 ; (export_seq.s1068 + 0)
07:b7dd : 4c 3d b7 JMP $b73d ; (export_seq.s1069 + 0)
--------------------------------------------------------------------
07:b7e0 : __ __ __ BYT 73 41 56 45 20 53 43 52 45 45 4e 00             : sAVE SCREEN.
--------------------------------------------------------------------
07:b7ec : __ __ __ BYT 53 3a 25 53 00                                  : S:%S.
--------------------------------------------------------------------
07:b7f1 : __ __ __ BYT 25 53 2c 53 2c 57 00                            : %S,S,W.
--------------------------------------------------------------------
07:b800 : __ __ __ BYT 65 58 50 4f 52 54 49 4e 47 20 44 41 54 41 20 54 : eXPORTING DATA T
07:b810 : __ __ __ BYT 4f 20 44 49 53 4b 2e 00                         : O DISK..
--------------------------------------------------------------------
seqcolor:
07:b818 : __ __ __ BYT 90 98 1f 9a 1e 99 97 9f 1c 96 9c 9c 95 9e 9b 05 : ................
