; Compiled with 1.27.242
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
1c13 : 8e ff 39 STX $39ff ; (spentry + 0)
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
1c35 : a9 51 __ LDA #$51
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
1c65 : a9 1b __ LDA #$1b
1c67 : 85 18 __ STA P11 
1c69 : a9 19 __ LDA #$19
1c6b : 85 16 __ STA P9 
1c6d : 60 __ __ RTS
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
1c8c : 8d f7 82 STA $82f7 ; (winCfg + 0)
1c8f : a9 00 __ LDA #$00
1c91 : 8d fa 82 STA $82fa ; (winCfg + 3)
1c94 : 8d fc 82 STA $82fc ; (winCfg + 5)
1c97 : 8d f8 82 STA $82f8 ; (winCfg + 1)
1c9a : 8d fd 82 STA $82fd ; (winCfg + 6)
1c9d : a9 20 __ LDA #$20
1c9f : 8d fb 82 STA $82fb ; (winCfg + 4)
1ca2 : 8d f9 82 STA $82f9 ; (winCfg + 2)
1ca5 : 8d fe 82 STA $82fe ; (winCfg + 7)
1ca8 : 20 9f 22 JSR $229f ; (bnk_init.s1000 + 0)
1cab : a9 00 __ LDA #$00
1cad : 8d e8 86 STA $86e8 ; (charsetchanged + 0)
1cb0 : 8d e9 86 STA $86e9 ; (charsetchanged + 1)
1cb3 : 8d ea 86 STA $86ea ; (appexit + 0)
1cb6 : 8d eb 86 STA $86eb ; (screen_col + 0)
1cb9 : 8d ec 86 STA $86ec ; (screen_col + 1)
1cbc : 8d ed 86 STA $86ed ; (screen_row + 0)
1cbf : 8d ee 86 STA $86ee ; (screen_row + 1)
1cc2 : 8d ef 86 STA $86ef ; (screenbackground + 0)
1cc5 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
1cc8 : 8d f2 86 STA $86f2 ; (plotreverse + 0)
1ccb : 8d f3 86 STA $86f3 ; (plotunderline + 0)
1cce : 8d f4 86 STA $86f4 ; (plotblink + 0)
1cd1 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
1cd4 : a9 0f __ LDA #$0f
1cd6 : 8d f1 86 STA $86f1 ; (plotcolor + 0)
1cd9 : a9 00 __ LDA #$00
1cdb : a2 15 __ LDX #$15
.l1002:
1cdd : ca __ __ DEX
1cde : 9d 7a 87 STA $877a,x ; (filename + 0)
1ce1 : d0 fa __ BNE $1cdd ; (main.l1002 + 0)
.s1003:
1ce3 : a5 ba __ LDA $ba 
1ce5 : d0 02 __ BNE $1ce9 ; (main.s1128 + 0)
.s4:
1ce7 : a9 08 __ LDA #$08
.s1128:
1ce9 : 8d ff 82 STA $82ff ; (bootdevice + 0)
1cec : 8d f6 86 STA $86f6 ; (targetdevice + 0)
1cef : 20 47 2b JSR $2b47 ; (vdc_init.s1000 + 0)
1cf2 : a9 7f __ LDA #$7f
1cf4 : 8d a8 87 STA $87a8 ; (canvas + 0)
1cf7 : a9 00 __ LDA #$00
1cf9 : 8d ac 87 STA $87ac ; (canvas + 4)
1cfc : 8d ae 87 STA $87ae ; (canvas + 6)
1cff : 8d af 87 STA $87af ; (canvas + 7)
1d02 : 8d b0 87 STA $87b0 ; (canvas + 8)
1d05 : 8d b1 87 STA $87b1 ; (canvas + 9)
1d08 : 8d b2 87 STA $87b2 ; (canvas + 10)
1d0b : 8d a9 87 STA $87a9 ; (canvas + 1)
1d0e : 85 0f __ STA P2 
1d10 : 85 10 __ STA P3 
1d12 : a9 50 __ LDA #$50
1d14 : 8d ab 87 STA $87ab ; (canvas + 3)
1d17 : 85 11 __ STA P4 
1d19 : a9 19 __ LDA #$19
1d1b : 8d ad 87 STA $87ad ; (canvas + 5)
1d1e : 85 12 __ STA P5 
1d20 : a9 58 __ LDA #$58
1d22 : 8d aa 87 STA $87aa ; (canvas + 2)
1d25 : a9 b3 __ LDA #$b3
1d27 : 85 0d __ STA P0 
1d29 : a9 87 __ LDA #$87
1d2b : 85 0e __ STA P1 
1d2d : 20 0e 31 JSR $310e ; (vdcwin_init.s0 + 0)
1d30 : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
1d33 : a9 af __ LDA #$af
1d35 : 85 16 __ STA P9 
1d37 : a9 35 __ LDA #$35
1d39 : 85 17 __ STA P10 
1d3b : ad 8f 87 LDA $878f ; (vdc_state + 0)
1d3e : c9 40 __ CMP #$40
1d40 : d0 2c __ BNE $1d6e ; (main.s11 + 0)
.s9:
1d42 : a9 03 __ LDA #$03
1d44 : 8d 31 82 STA $8231 ; (pulldown_options + 4)
1d47 : a9 01 __ LDA #$01
1d49 : 8d fe 7a STA $7afe ; (undoenabled + 0)
1d4c : a9 00 __ LDA #$00
1d4e : 8d fb 86 STA $86fb ; (undonumber + 0)
1d51 : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
1d54 : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
1d57 : a2 ff __ LDX #$ff
.l1122:
1d59 : e8 __ __ INX
1d5a : bd 1d 33 LDA $331d,x 
1d5d : 9d 78 85 STA $8578,x ; (pulldown_titles + 416)
1d60 : d0 f7 __ BNE $1d59 ; (main.l1122 + 0)
.s1123:
1d62 : ad a3 87 LDA $87a3 ; (vdc_state + 20)
1d65 : 8d f9 86 STA $86f9 ; (undoaddress + 0)
1d68 : ad a4 87 LDA $87a4 ; (vdc_state + 21)
1d6b : 8d fa 86 STA $86fa ; (undoaddress + 1)
.s11:
1d6e : 20 2d 33 JSR $332d ; (printcentered.s0 + 0)
1d71 : a9 01 __ LDA #$01
1d73 : 85 10 __ STA P3 
1d75 : a9 00 __ LDA #$00
1d77 : 85 11 __ STA P4 
1d79 : a9 58 __ LDA #$58
1d7b : 85 12 __ STA P5 
1d7d : ad ff 82 LDA $82ff ; (bootdevice + 0)
1d80 : 85 55 __ STA T1 + 0 
1d82 : 85 0f __ STA P2 
1d84 : a9 c1 __ LDA #$c1
1d86 : 85 13 __ STA P6 
1d88 : a9 35 __ LDA #$35
1d8a : 85 14 __ STA P7 
1d8c : 20 6c 13 JSR $136c ; (bnk_load.s0 + 0)
1d8f : a5 1b __ LDA ACCU + 0 
1d91 : d0 09 __ BNE $1d9c ; (main.s12 + 0)
.s13:
1d93 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
1d96 : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
1d99 : 4c a3 1d JMP $1da3 ; (main.s14 + 0)
.s12:
1d9c : a9 58 __ LDA #$58
1d9e : 85 13 __ STA P6 
1da0 : 20 17 1a JSR $1a17 ; (bnk_cpytovdc@proxy + 0)
.s14:
1da3 : 20 5a 3b JSR $3b5a ; (initoverlay.s1000 + 0)
1da6 : a9 a9 __ LDA #$a9
1da8 : 85 16 __ STA P9 
1daa : a9 3c __ LDA #$3c
1dac : 85 17 __ STA P10 
1dae : 20 2d 33 JSR $332d ; (printcentered.s0 + 0)
1db1 : a5 55 __ LDA T1 + 0 
1db3 : 85 0f __ STA P2 
1db5 : a9 00 __ LDA #$00
1db7 : 85 10 __ STA P3 
1db9 : 85 11 __ STA P4 
1dbb : a9 0c __ LDA #$0c
1dbd : 85 12 __ STA P5 
1dbf : a9 bd __ LDA #$bd
1dc1 : 85 13 __ STA P6 
1dc3 : a9 3c __ LDA #$3c
1dc5 : 85 14 __ STA P7 
1dc7 : 20 6c 13 JSR $136c ; (bnk_load.s0 + 0)
1dca : a5 1b __ LDA ACCU + 0 
1dcc : d0 06 __ BNE $1dd4 ; (main.s17 + 0)
.s15:
1dce : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
1dd1 : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
.s17:
1dd4 : a9 c7 __ LDA #$c7
1dd6 : 85 16 __ STA P9 
1dd8 : a9 3c __ LDA #$3c
1dda : 85 17 __ STA P10 
1ddc : 20 2d 33 JSR $332d ; (printcentered.s0 + 0)
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
1df6 : a9 08 __ LDA #$08
1df8 : 85 14 __ STA P7 
1dfa : a9 00 __ LDA #$00
1dfc : 85 0e __ STA P1 
1dfe : 85 11 __ STA P4 
1e00 : a9 40 __ LDA #$40
1e02 : 85 0f __ STA P2 
1e04 : a9 50 __ LDA #$50
1e06 : 85 12 __ STA P5 
1e08 : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
1e0b : a9 20 __ LDA #$20
1e0d : 8d f8 ab STA $abf8 ; (sstack + 5)
1e10 : a9 0f __ LDA #$0f
1e12 : 8d f9 ab STA $abf9 ; (sstack + 6)
1e15 : 20 d5 3c JSR $3cd5 ; (screenmapfill.s0 + 0)
1e18 : a9 de __ LDA #$de
1e1a : 85 16 __ STA P9 
1e1c : a9 3d __ LDA #$3d
1e1e : 85 17 __ STA P10 
1e20 : 20 2d 33 JSR $332d ; (printcentered.s0 + 0)
1e23 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
1e26 : 20 8f 2c JSR $2c8f ; (vdc_cls.s0 + 0)
1e29 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
1e2c : a9 01 __ LDA #$01
1e2e : 8d fe 86 STA $86fe ; (showbar + 0)
1e31 : a2 ff __ LDX #$ff
.l1004:
1e33 : e8 __ __ INX
1e34 : bd cb 3e LDA $3ecb,x 
1e37 : 9d e1 88 STA $88e1,x ; (programmode + 0)
1e3a : d0 f7 __ BNE $1e33 ; (main.l1004 + 0)
.s1005:
1e3c : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.l20:
1e3f : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.l22:
1e42 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
1e45 : a5 1b __ LDA ACCU + 0 
1e47 : c9 4c __ CMP #$4c
1e49 : d0 13 __ BNE $1e5e ; (main.s116 + 0)
.s72:
1e4b : a9 02 __ LDA #$02
1e4d : 8d fa ab STA $abfa ; (sstack + 7)
1e50 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
1e53 : a9 01 __ LDA #$01
1e55 : 8d fc ab STA $abfc ; (sstack + 9)
1e58 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
1e5b : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s116:
1e5e : 85 53 __ STA T0 + 0 
1e60 : 85 56 __ STA T2 + 0 
1e62 : c9 4c __ CMP #$4c
1e64 : b0 03 __ BCS $1e69 ; (main.s117 + 0)
1e66 : 4c df 1f JMP $1fdf ; (main.s118 + 0)
.s117:
1e69 : c9 59 __ CMP #$59
1e6b : d0 03 __ BNE $1e70 ; (main.s146 + 0)
1e6d : 4c c7 1f JMP $1fc7 ; (main.s80 + 0)
.s146:
1e70 : b0 03 __ BCS $1e75 ; (main.s147 + 0)
1e72 : 4c 43 1f JMP $1f43 ; (main.s148 + 0)
.s147:
1e75 : c9 8c __ CMP #$8c
1e77 : d0 0b __ BNE $1e84 ; (main.s161 + 0)
.s104:
1e79 : a9 01 __ LDA #$01
1e7b : 8d f8 ab STA $abf8 ; (sstack + 5)
1e7e : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
1e81 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s161:
1e84 : 90 7c __ BCC $1f02 ; (main.s163 + 0)
.s162:
1e86 : c9 91 __ CMP #$91
1e88 : f0 04 __ BEQ $1e8e ; (main.s24 + 0)
.s169:
1e8a : c9 9d __ CMP #$9d
1e8c : d0 0b __ BNE $1e99 ; (main.s106 + 0)
.s24:
1e8e : a5 1b __ LDA ACCU + 0 
1e90 : 8d fc ab STA $abfc ; (sstack + 9)
1e93 : 20 4d 41 JSR $414d ; (plotmove.s1000 + 0)
1e96 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s106:
1e99 : c9 30 __ CMP #$30
1e9b : 90 18 __ BCC $1eb5 ; (main.s109 + 0)
.s110:
1e9d : c9 3a __ CMP #$3a
1e9f : b0 14 __ BCS $1eb5 ; (main.s109 + 0)
.s107:
1ea1 : 0a __ __ ASL
1ea2 : aa __ __ TAX
1ea3 : bd 8c 88 LDA $888c,x ; (multab + 140)
1ea6 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
1ea9 : bd 8d 88 LDA $888d,x ; (multab + 141)
1eac : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
1eaf : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
1eb2 : 4c bb 1e JMP $1ebb ; (main.s114 + 0)
.s109:
1eb5 : a9 20 __ LDA #$20
1eb7 : c5 1b __ CMP ACCU + 0 
1eb9 : b0 16 __ BCS $1ed1 ; (main.s225 + 0)
.s114:
1ebb : a5 53 __ LDA T0 + 0 
1ebd : c9 2b __ CMP #$2b
1ebf : b0 10 __ BCS $1ed1 ; (main.s225 + 0)
.s111:
1ec1 : a5 56 __ LDA T2 + 0 
1ec3 : 0a __ __ ASL
1ec4 : aa __ __ TAX
1ec5 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
1ec8 : 9d aa 88 STA $88aa,x ; (linebuffer + 26)
1ecb : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
1ece : 9d ab 88 STA $88ab,x ; (linebuffer + 27)
.s225:
1ed1 : ad ea 86 LDA $86ea ; (appexit + 0)
1ed4 : d0 0b __ BNE $1ee1 ; (main.s19 + 0)
.s18:
1ed6 : ad fe 86 LDA $86fe ; (showbar + 0)
1ed9 : d0 03 __ BNE $1ede ; (main.s18 + 8)
1edb : 4c 42 1e JMP $1e42 ; (main.l22 + 0)
1ede : 4c 3f 1e JMP $1e3f ; (main.l20 + 0)
.s19:
1ee1 : a9 00 __ LDA #$00
1ee3 : 20 14 2e JSR $2e14 ; (fastmode.s0 + 0)
1ee6 : 20 33 2e JSR $2e33 ; (vdc_set_mode@proxy + 0)
1ee9 : 20 8f 2c JSR $2c8f ; (vdc_cls.s0 + 0)
1eec : a9 04 __ LDA #$04
1eee : 8d 06 d5 STA $d506 
1ef1 : a9 00 __ LDA #$00
1ef3 : 85 1b __ STA ACCU + 0 
1ef5 : 85 1c __ STA ACCU + 1 
.s1001:
1ef7 : a2 05 __ LDX #$05
1ef9 : bd 72 ab LDA $ab72,x ; (main@stack + 0)
1efc : 95 53 __ STA T0 + 0,x 
1efe : ca __ __ DEX
1eff : 10 f8 __ BPL $1ef9 ; (main.s1001 + 2)
1f01 : 60 __ __ RTS
.s163:
1f02 : c9 85 __ CMP #$85
1f04 : d0 12 __ BNE $1f18 ; (main.s164 + 0)
.s102:
1f06 : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
1f09 : 20 b9 59 JSR $59b9 ; (mainmenuloop.s1000 + 0)
1f0c : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
1f0f : ad f1 86 LDA $86f1 ; (plotcolor + 0)
1f12 : 8d 96 87 STA $8796 ; (vdc_state + 7)
1f15 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s164:
1f18 : b0 19 __ BCS $1f33 ; (main.s165 + 0)
.s166:
1f1a : c9 5a __ CMP #$5a
1f1c : f0 03 __ BEQ $1f21 ; (main.s75 + 0)
1f1e : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s75:
1f21 : ad fe 7a LDA $7afe ; (undoenabled + 0)
1f24 : c9 01 __ CMP #$01
1f26 : d0 a9 __ BNE $1ed1 ; (main.s225 + 0)
.s79:
1f28 : ad fc 86 LDA $86fc ; (undo_undopossible + 0)
1f2b : f0 a4 __ BEQ $1ed1 ; (main.s225 + 0)
.s76:
1f2d : 20 8d 54 JSR $548d ; (undo_performundo.s1000 + 0)
1f30 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s165:
1f33 : c9 8b __ CMP #$8b
1f35 : f0 03 __ BEQ $1f3a ; (main.s103 + 0)
1f37 : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s103:
1f3a : 20 27 50 JSR $5027 ; (togglestatusbar.s0 + 0)
.s284:
1f3d : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
1f40 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s148:
1f43 : c9 53 __ CMP #$53
1f45 : d0 0e __ BNE $1f55 ; (main.s149 + 0)
.s74:
1f47 : a9 02 __ LDA #$02
1f49 : 8d fa ab STA $abfa ; (sstack + 7)
1f4c : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
1f4f : 20 aa b3 JSR $b3aa ; (writemode.s13 + 0)
1f52 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s149:
1f55 : 90 34 __ BCC $1f8b ; (main.s151 + 0)
.s150:
1f57 : c9 55 __ CMP #$55
1f59 : d0 0b __ BNE $1f66 ; (main.s157 + 0)
.s47:
1f5b : a9 00 __ LDA #$00
1f5d : cd f3 86 CMP $86f3 ; (plotunderline + 0)
1f60 : 2a __ __ ROL
1f61 : 8d f3 86 STA $86f3 ; (plotunderline + 0)
1f64 : 90 d7 __ BCC $1f3d ; (main.s284 + 0)
.s157:
1f66 : b0 0e __ BCS $1f76 ; (main.s158 + 0)
.s85:
1f68 : a9 02 __ LDA #$02
1f6a : 8d fa ab STA $abfa ; (sstack + 7)
1f6d : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
1f70 : 20 92 ba JSR $ba92 ; (resizewidth.l28 + 74)
1f73 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s158:
1f76 : c9 57 __ CMP #$57
1f78 : f0 03 __ BEQ $1f7d ; (main.s70 + 0)
1f7a : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s70:
1f7d : a9 01 __ LDA #$01
1f7f : 8d fa ab STA $abfa ; (sstack + 7)
1f82 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
1f85 : 20 6e b1 JSR $b16e ; (writemode.s1000 + 0)
1f88 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s151:
1f8b : c9 50 __ CMP #$50
1f8d : d0 0e __ BNE $1f9d ; (main.s152 + 0)
.s52:
1f8f : a9 01 __ LDA #$01
1f91 : 8d fa ab STA $abfa ; (sstack + 7)
1f94 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
1f97 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
1f9a : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s152:
1f9d : b0 15 __ BCS $1fb4 ; (main.s153 + 0)
.s154:
1f9f : c9 4d __ CMP #$4d
1fa1 : f0 03 __ BEQ $1fa6 ; (main.s73 + 0)
1fa3 : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s73:
1fa6 : a9 02 __ LDA #$02
1fa8 : 8d fa ab STA $abfa ; (sstack + 7)
1fab : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
1fae : 20 fe b0 JSR $b0fe ; (palette_returnscreencode.s1003 + 3)
1fb1 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s153:
1fb4 : c9 52 __ CMP #$52
1fb6 : f0 03 __ BEQ $1fbb ; (main.s49 + 0)
1fb8 : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s49:
1fbb : a9 00 __ LDA #$00
1fbd : cd f2 86 CMP $86f2 ; (plotreverse + 0)
1fc0 : 2a __ __ ROL
1fc1 : 8d f2 86 STA $86f2 ; (plotreverse + 0)
1fc4 : 4c 3d 1f JMP $1f3d ; (main.s284 + 0)
.s80:
1fc7 : ad fe 7a LDA $7afe ; (undoenabled + 0)
1fca : c9 01 __ CMP #$01
1fcc : f0 03 __ BEQ $1fd1 ; (main.s84 + 0)
1fce : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s84:
1fd1 : ad fd 86 LDA $86fd ; (undo_redopossible + 0)
1fd4 : d0 03 __ BNE $1fd9 ; (main.s81 + 0)
1fd6 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s81:
1fd9 : 20 51 57 JSR $5751 ; (undo_performredo.s1000 + 0)
1fdc : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s118:
1fdf : c9 2d __ CMP #$2d
1fe1 : d0 07 __ BNE $1fea ; (main.s119 + 0)
.s26:
1fe3 : ac f0 86 LDY $86f0 ; (plotscreencode + 0)
1fe6 : 88 __ __ DEY
1fe7 : 4c a8 20 JMP $20a8 ; (main.s287 + 0)
.s119:
1fea : 90 03 __ BCC $1fef ; (main.s121 + 0)
1fec : 4c 34 21 JMP $2134 ; (main.s120 + 0)
.s121:
1fef : c9 1d __ CMP #$1d
1ff1 : d0 03 __ BNE $1ff6 ; (main.s122 + 0)
1ff3 : 4c 8e 1e JMP $1e8e ; (main.s24 + 0)
.s122:
1ff6 : b0 03 __ BCS $1ffb ; (main.s123 + 0)
1ff8 : 4c af 20 JMP $20af ; (main.s124 + 0)
.s123:
1ffb : c9 2b __ CMP #$2b
1ffd : d0 07 __ BNE $2006 ; (main.s130 + 0)
.s25:
1fff : ac f0 86 LDY $86f0 ; (plotscreencode + 0)
2002 : c8 __ __ INY
2003 : 4c a8 20 JMP $20a8 ; (main.s287 + 0)
.s130:
2006 : b0 76 __ BCS $207e ; (main.s27 + 0)
.s132:
2008 : c9 20 __ CMP #$20
200a : f0 03 __ BEQ $200f ; (main.s87 + 0)
200c : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s87:
200f : ad fe 7a LDA $7afe ; (undoenabled + 0)
2012 : c9 01 __ CMP #$01
2014 : d0 1a __ BNE $2030 ; (main.s90 + 0)
.s88:
2016 : 85 18 __ STA P11 
2018 : 8d f3 ab STA $abf3 ; (sstack + 0)
201b : ad b1 87 LDA $87b1 ; (canvas + 9)
201e : 18 __ __ CLC
201f : 6d ed 86 ADC $86ed ; (screen_row + 0)
2022 : 85 16 __ STA P9 
2024 : ad af 87 LDA $87af ; (canvas + 7)
2027 : 18 __ __ CLC
2028 : 6d eb 86 ADC $86eb ; (screen_col + 0)
202b : 85 17 __ STA P10 
202d : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s90:
2030 : ad b1 87 LDA $87b1 ; (canvas + 9)
2033 : 18 __ __ CLC
2034 : 6d ed 86 ADC $86ed ; (screen_row + 0)
2037 : 85 10 __ STA P3 
2039 : ad af 87 LDA $87af ; (canvas + 7)
203c : 18 __ __ CLC
203d : 6d eb 86 ADC $86eb ; (screen_col + 0)
2040 : 85 11 __ STA P4 
2042 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
2045 : 85 12 __ STA P5 
2047 : ad f4 86 LDA $86f4 ; (plotblink + 0)
204a : 0a __ __ ASL
204b : 0a __ __ ASL
204c : 0a __ __ ASL
204d : 0a __ __ ASL
204e : 18 __ __ CLC
204f : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
2052 : 85 53 __ STA T0 + 0 
2054 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
2057 : 4a __ __ LSR
2058 : 6a __ __ ROR
2059 : 6a __ __ ROR
205a : 29 c0 __ AND #$c0
205c : 6a __ __ ROR
205d : 65 53 __ ADC T0 + 0 
205f : 85 53 __ STA T0 + 0 
2061 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
2064 : 4a __ __ LSR
2065 : 6a __ __ ROR
2066 : 29 80 __ AND #$80
2068 : 6a __ __ ROR
2069 : 65 53 __ ADC T0 + 0 
206b : 85 53 __ STA T0 + 0 
206d : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
2070 : 4a __ __ LSR
2071 : a9 00 __ LDA #$00
2073 : 6a __ __ ROR
2074 : 65 53 __ ADC T0 + 0 
2076 : 85 13 __ STA P6 
.s286:
2078 : 20 1a 54 JSR $541a ; (screenmapplot.s0 + 0)
207b : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s27:
207e : ad f1 86 LDA $86f1 ; (plotcolor + 0)
2081 : f0 1a __ BEQ $209d ; (main.s28 + 0)
.s29:
2083 : 38 __ __ SEC
2084 : e9 01 __ SBC #$01
2086 : a8 __ __ TAY
2087 : cd ef 86 CMP $86ef ; (screenbackground + 0)
208a : d0 08 __ BNE $2094 ; (main.s288 + 0)
.s31:
208c : 98 __ __ TYA
208d : d0 04 __ BNE $2093 ; (main.s35 + 0)
.s34:
208f : a9 0f __ LDA #$0f
2091 : d0 02 __ BNE $2095 ; (main.s285 + 0)
.s35:
2093 : 88 __ __ DEY
.s288:
2094 : 98 __ __ TYA
.s285:
2095 : 85 11 __ STA P4 
2097 : 20 f2 3d JSR $3df2 ; (change_plotcolor.s0 + 0)
209a : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s28:
209d : a9 0f __ LDA #$0f
209f : a8 __ __ TAY
20a0 : cd ef 86 CMP $86ef ; (screenbackground + 0)
20a3 : d0 ef __ BNE $2094 ; (main.s288 + 0)
20a5 : 4c 8c 20 JMP $208c ; (main.s31 + 0)
.s287:
20a8 : 98 __ __ TYA
.s1127:
20a9 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
20ac : 4c 3d 1f JMP $1f3d ; (main.s284 + 0)
.s124:
20af : c9 13 __ CMP #$13
20b1 : f0 51 __ BEQ $2104 ; (main.s97 + 0)
.s125:
20b3 : b0 0a __ BCS $20bf ; (main.s126 + 0)
.s127:
20b5 : c9 11 __ CMP #$11
20b7 : f0 03 __ BEQ $20bc ; (main.s127 + 7)
20b9 : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
20bc : 4c 8e 1e JMP $1e8e ; (main.s24 + 0)
.s126:
20bf : c9 14 __ CMP #$14
20c1 : f0 03 __ BEQ $20c6 ; (main.s93 + 0)
20c3 : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s93:
20c6 : ad fe 7a LDA $7afe ; (undoenabled + 0)
20c9 : c9 01 __ CMP #$01
20cb : d0 1a __ BNE $20e7 ; (main.s96 + 0)
.s94:
20cd : 85 18 __ STA P11 
20cf : 8d f3 ab STA $abf3 ; (sstack + 0)
20d2 : ad b1 87 LDA $87b1 ; (canvas + 9)
20d5 : 18 __ __ CLC
20d6 : 6d ed 86 ADC $86ed ; (screen_row + 0)
20d9 : 85 16 __ STA P9 
20db : ad af 87 LDA $87af ; (canvas + 7)
20de : 18 __ __ CLC
20df : 6d eb 86 ADC $86eb ; (screen_col + 0)
20e2 : 85 17 __ STA P10 
20e4 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s96:
20e7 : a9 20 __ LDA #$20
20e9 : 85 12 __ STA P5 
20eb : a9 0f __ LDA #$0f
20ed : 85 13 __ STA P6 
20ef : ad b1 87 LDA $87b1 ; (canvas + 9)
20f2 : 18 __ __ CLC
20f3 : 6d ed 86 ADC $86ed ; (screen_row + 0)
20f6 : 85 10 __ STA P3 
20f8 : ad af 87 LDA $87af ; (canvas + 7)
20fb : 18 __ __ CLC
20fc : 6d eb 86 ADC $86eb ; (screen_col + 0)
20ff : 85 11 __ STA P4 
2101 : 4c 78 20 JMP $2078 ; (main.s286 + 0)
.s97:
2104 : a9 00 __ LDA #$00
2106 : 8d ed 86 STA $86ed ; (screen_row + 0)
2109 : 8d ee 86 STA $86ee ; (screen_row + 1)
210c : 8d eb 86 STA $86eb ; (screen_col + 0)
210f : 8d ec 86 STA $86ec ; (screen_col + 1)
2112 : 8d af 87 STA $87af ; (canvas + 7)
2115 : 8d b0 87 STA $87b0 ; (canvas + 8)
2118 : 8d b1 87 STA $87b1 ; (canvas + 9)
211b : 8d b2 87 STA $87b2 ; (canvas + 10)
211e : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
2121 : ad fe 86 LDA $86fe ; (showbar + 0)
2124 : f0 03 __ BEQ $2129 ; (main.s100 + 0)
.s98:
2126 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s100:
2129 : a9 00 __ LDA #$00
212b : 8d b7 87 STA $87b7 ; (canvas + 15)
212e : 8d b8 87 STA $87b8 ; (canvas + 16)
2131 : 4c 3d 1f JMP $1f3d ; (main.s284 + 0)
.s120:
2134 : c9 43 __ CMP #$43
2136 : d0 0e __ BNE $2146 ; (main.s134 + 0)
.s71:
2138 : a9 01 __ LDA #$01
213a : 8d fa ab STA $abfa ; (sstack + 7)
213d : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
2140 : 20 ea b3 JSR $b3ea ; (colorwrite.s1000 + 0)
2143 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s134:
2146 : b0 03 __ BCS $214b ; (main.s135 + 0)
2148 : 4c 50 22 JMP $2250 ; (main.s136 + 0)
.s135:
214b : c9 47 __ CMP #$47
214d : f0 27 __ BEQ $2176 ; (main.s53 + 0)
.s141:
214f : b0 15 __ BCS $2166 ; (main.s142 + 0)
.s143:
2151 : c9 45 __ CMP #$45
2153 : f0 03 __ BEQ $2158 ; (main.s51 + 0)
2155 : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s51:
2158 : a9 04 __ LDA #$04
215a : 8d fa ab STA $abfa ; (sstack + 7)
215d : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
2160 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
2163 : 4c d1 1e JMP $1ed1 ; (main.s225 + 0)
.s142:
2166 : c9 49 __ CMP #$49
2168 : f0 03 __ BEQ $216d ; (main.s86 + 0)
216a : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s86:
216d : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
2170 : 18 __ __ CLC
2171 : 69 80 __ ADC #$80
2173 : 4c a9 20 JMP $20a9 ; (main.s1127 + 0)
.s53:
2176 : a9 7f __ LDA #$7f
2178 : 85 0d __ STA P0 
217a : ad af 87 LDA $87af ; (canvas + 7)
217d : 18 __ __ CLC
217e : 6d eb 86 ADC $86eb ; (screen_col + 0)
2181 : 85 53 __ STA T0 + 0 
2183 : ad b0 87 LDA $87b0 ; (canvas + 8)
2186 : 6d ec 86 ADC $86ec ; (screen_col + 1)
2189 : 85 54 __ STA T0 + 1 
218b : ad b1 87 LDA $87b1 ; (canvas + 9)
218e : 18 __ __ CLC
218f : 6d ed 86 ADC $86ed ; (screen_row + 0)
2192 : 85 03 __ STA WORK + 0 
2194 : ad b2 87 LDA $87b2 ; (canvas + 10)
2197 : 6d ee 86 ADC $86ee ; (screen_row + 1)
219a : 85 04 __ STA WORK + 1 
219c : ad ab 87 LDA $87ab ; (canvas + 3)
219f : 85 57 __ STA T3 + 0 
21a1 : 85 1b __ STA ACCU + 0 
21a3 : ad ac 87 LDA $87ac ; (canvas + 4)
21a6 : 85 58 __ STA T3 + 1 
21a8 : 85 1c __ STA ACCU + 1 
21aa : 20 62 7c JSR $7c62 ; (mul16 + 0)
21ad : 18 __ __ CLC
21ae : a5 06 __ LDA WORK + 3 
21b0 : 69 58 __ ADC #$58
21b2 : aa __ __ TAX
21b3 : 18 __ __ CLC
21b4 : a5 05 __ LDA WORK + 2 
21b6 : 65 53 __ ADC T0 + 0 
21b8 : 85 0e __ STA P1 
21ba : 8a __ __ TXA
21bb : 65 54 __ ADC T0 + 1 
21bd : 85 0f __ STA P2 
21bf : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
21c2 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
21c5 : ad ad 87 LDA $87ad ; (canvas + 5)
21c8 : 85 1b __ STA ACCU + 0 
21ca : ad ae 87 LDA $87ae ; (canvas + 6)
21cd : 85 1c __ STA ACCU + 1 
21cf : a5 57 __ LDA T3 + 0 
21d1 : 85 03 __ STA WORK + 0 
21d3 : a5 58 __ LDA T3 + 1 
21d5 : 85 04 __ STA WORK + 1 
21d7 : 20 62 7c JSR $7c62 ; (mul16 + 0)
21da : 18 __ __ CLC
21db : a5 05 __ LDA WORK + 2 
21dd : 65 0e __ ADC P1 
21df : a8 __ __ TAY
21e0 : a5 06 __ LDA WORK + 3 
21e2 : 65 0f __ ADC P2 
21e4 : aa __ __ TAX
21e5 : 98 __ __ TYA
21e6 : 18 __ __ CLC
21e7 : 69 30 __ ADC #$30
21e9 : 85 0e __ STA P1 
21eb : 90 01 __ BCC $21ee ; (main.s1134 + 0)
.s1133:
21ed : e8 __ __ INX
.s1134:
21ee : 86 0f __ STX P2 
21f0 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
21f3 : c9 81 __ CMP #$81
21f5 : a8 __ __ TAY
21f6 : b0 08 __ BCS $2200 ; (main.s58 + 0)
.s59:
21f8 : a9 00 __ LDA #$00
21fa : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
21fd : 98 __ __ TYA
21fe : 90 09 __ BCC $2209 ; (main.s257 + 0)
.s58:
2200 : a9 01 __ LDA #$01
2202 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
2205 : 98 __ __ TYA
2206 : e9 80 __ SBC #$80
2208 : a8 __ __ TAY
.s257:
2209 : c9 41 __ CMP #$41
220b : b0 08 __ BCS $2215 ; (main.s61 + 0)
.s62:
220d : a9 00 __ LDA #$00
220f : 8d f2 86 STA $86f2 ; (plotreverse + 0)
2212 : 98 __ __ TYA
2213 : 90 09 __ BCC $221e ; (main.s258 + 0)
.s61:
2215 : a9 01 __ LDA #$01
2217 : 8d f2 86 STA $86f2 ; (plotreverse + 0)
221a : 98 __ __ TYA
221b : e9 40 __ SBC #$40
221d : a8 __ __ TAY
.s258:
221e : c9 21 __ CMP #$21
2220 : b0 08 __ BCS $222a ; (main.s64 + 0)
.s65:
2222 : a9 00 __ LDA #$00
2224 : 8d f3 86 STA $86f3 ; (plotunderline + 0)
2227 : 98 __ __ TYA
2228 : 90 09 __ BCC $2233 ; (main.s259 + 0)
.s64:
222a : a9 01 __ LDA #$01
222c : 8d f3 86 STA $86f3 ; (plotunderline + 0)
222f : 98 __ __ TYA
2230 : e9 20 __ SBC #$20
2232 : a8 __ __ TAY
.s259:
2233 : c9 11 __ CMP #$11
2235 : b0 08 __ BCS $223f ; (main.s67 + 0)
.s68:
2237 : a9 00 __ LDA #$00
2239 : 8d f4 86 STA $86f4 ; (plotblink + 0)
223c : 98 __ __ TYA
223d : 90 08 __ BCC $2247 ; (main.s1126 + 0)
.s67:
223f : a9 01 __ LDA #$01
2241 : 8d f4 86 STA $86f4 ; (plotblink + 0)
2244 : 98 __ __ TYA
2245 : e9 10 __ SBC #$10
.s1126:
2247 : 8d f1 86 STA $86f1 ; (plotcolor + 0)
224a : 8d 96 87 STA $8796 ; (vdc_state + 7)
224d : 4c 3d 1f JMP $1f3d ; (main.s284 + 0)
.s136:
2250 : c9 41 __ CMP #$41
2252 : d0 0c __ BNE $2260 ; (main.s137 + 0)
.s50:
2254 : a9 00 __ LDA #$00
2256 : cd f5 86 CMP $86f5 ; (plotaltchar + 0)
2259 : 2a __ __ ROL
225a : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
225d : 4c 3d 1f JMP $1f3d ; (main.s284 + 0)
.s137:
2260 : b0 31 __ BCS $2293 ; (main.s48 + 0)
.s139:
2262 : c9 2e __ CMP #$2e
2264 : f0 03 __ BEQ $2269 ; (main.s37 + 0)
2266 : 4c 99 1e JMP $1e99 ; (main.s106 + 0)
.s37:
2269 : ad f1 86 LDA $86f1 ; (plotcolor + 0)
226c : c9 0f __ CMP #$0f
226e : d0 17 __ BNE $2287 ; (main.s39 + 0)
.s38:
2270 : a0 00 __ LDY #$00
2272 : ad ef 86 LDA $86ef ; (screenbackground + 0)
2275 : f0 03 __ BEQ $227a ; (main.s41 + 0)
2277 : 4c 94 20 JMP $2094 ; (main.s288 + 0)
.s41:
227a : c0 0f __ CPY #$0f
227c : d0 05 __ BNE $2283 ; (main.s45 + 0)
.s44:
227e : a9 00 __ LDA #$00
2280 : 4c 95 20 JMP $2095 ; (main.s285 + 0)
.s45:
2283 : c8 __ __ INY
2284 : 4c 94 20 JMP $2094 ; (main.s288 + 0)
.s39:
2287 : 18 __ __ CLC
2288 : 69 01 __ ADC #$01
228a : a8 __ __ TAY
228b : cd ef 86 CMP $86ef ; (screenbackground + 0)
228e : f0 ea __ BEQ $227a ; (main.s41 + 0)
2290 : 4c 94 20 JMP $2094 ; (main.s288 + 0)
.s48:
2293 : a9 00 __ LDA #$00
2295 : cd f4 86 CMP $86f4 ; (plotblink + 0)
2298 : 2a __ __ ROL
2299 : 8d f4 86 STA $86f4 ; (plotblink + 0)
229c : 4c 3d 1f JMP $1f3d ; (main.s284 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
229f : 38 __ __ SEC
22a0 : a5 23 __ LDA SP + 0 
22a2 : e9 06 __ SBC #$06
22a4 : 85 23 __ STA SP + 0 
22a6 : b0 02 __ BCS $22aa ; (bnk_init.s0 + 0)
22a8 : c6 24 __ DEC SP + 1 
.s0:
22aa : a9 1d __ LDA #$1d
22ac : a0 02 __ LDY #$02
22ae : 91 23 __ STA (SP + 0),y 
22b0 : a9 2a __ LDA #$2a
22b2 : c8 __ __ INY
22b3 : 91 23 __ STA (SP + 0),y 
22b5 : a5 ba __ LDA $ba 
22b7 : d0 02 __ BNE $22bb ; (bnk_init.s1002 + 0)
.s2:
22b9 : a9 08 __ LDA #$08
.s1002:
22bb : 8d ff 82 STA $82ff ; (bootdevice + 0)
22be : a0 04 __ LDY #$04
22c0 : 91 23 __ STA (SP + 0),y 
22c2 : a9 00 __ LDA #$00
22c4 : c8 __ __ INY
22c5 : 91 23 __ STA (SP + 0),y 
22c7 : 20 f6 22 JSR $22f6 ; (printf.s0 + 0)
22ca : a9 06 __ LDA #$06
22cc : 8d 06 d5 STA $d506 
22cf : a9 2d __ LDA #$2d
22d1 : a0 02 __ LDY #$02
22d3 : 91 23 __ STA (SP + 0),y 
22d5 : a9 2a __ LDA #$2a
22d7 : c8 __ __ INY
22d8 : 91 23 __ STA (SP + 0),y 
22da : 20 f6 22 JSR $22f6 ; (printf.s0 + 0)
22dd : a9 f6 __ LDA #$f6
22df : 8d f8 ab STA $abf8 ; (sstack + 5)
22e2 : a9 2a __ LDA #$2a
22e4 : 8d f9 ab STA $abf9 ; (sstack + 6)
22e7 : 20 47 2a JSR $2a47 ; (load_overlay.s1000 + 0)
.s1001:
22ea : 18 __ __ CLC
22eb : a5 23 __ LDA SP + 0 
22ed : 69 06 __ ADC #$06
22ef : 85 23 __ STA SP + 0 
22f1 : 90 02 __ BCC $22f5 ; (bnk_init.s1001 + 11)
22f3 : e6 24 __ INC SP + 1 
22f5 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22f6 : a9 01 __ LDA #$01
22f8 : 8d f7 ab STA $abf7 ; (sstack + 4)
22fb : a9 a5 __ LDA #$a5
22fd : 85 16 __ STA P9 
22ff : a9 ab __ LDA #$ab
2301 : 85 17 __ STA P10 
2303 : a0 02 __ LDY #$02
2305 : b1 23 __ LDA (SP + 0),y 
2307 : 8d f3 ab STA $abf3 ; (sstack + 0)
230a : c8 __ __ INY
230b : b1 23 __ LDA (SP + 0),y 
230d : 8d f4 ab STA $abf4 ; (sstack + 1)
2310 : 18 __ __ CLC
2311 : a5 23 __ LDA SP + 0 
2313 : 69 04 __ ADC #$04
2315 : 8d f5 ab STA $abf5 ; (sstack + 2)
2318 : a5 24 __ LDA SP + 1 
231a : 69 00 __ ADC #$00
231c : 8d f6 ab STA $abf6 ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
231f : a5 53 __ LDA T7 + 0 
2321 : 8d d7 ab STA $abd7 ; (vp_fill + 10)
2324 : a5 54 __ LDA T7 + 1 
2326 : 8d d8 ab STA $abd8 ; (vp_fill + 11)
2329 : a5 55 __ LDA T7 + 2 
232b : 8d d9 ab STA $abd9 ; (vp_fill + 12)
.s0:
232e : a9 00 __ LDA #$00
2330 : 85 47 __ STA T0 + 0 
2332 : ad f3 ab LDA $abf3 ; (sstack + 0)
2335 : 85 49 __ STA T1 + 0 
2337 : ad f4 ab LDA $abf4 ; (sstack + 1)
233a : 85 4a __ STA T1 + 1 
.l1:
233c : a0 00 __ LDY #$00
233e : b1 49 __ LDA (T1 + 0),y 
2340 : d0 3c __ BNE $237e ; (sformat.s2 + 0)
.s3:
2342 : a4 47 __ LDY T0 + 0 
2344 : 91 16 __ STA (P9),y ; (buff + 0)
2346 : 98 __ __ TYA
2347 : f0 1d __ BEQ $2366 ; (sformat.s1070 + 0)
.s116:
2349 : ad f7 ab LDA $abf7 ; (sstack + 4)
234c : d0 0d __ BNE $235b ; (sformat.s119 + 0)
.s120:
234e : 18 __ __ CLC
234f : a5 16 __ LDA P9 ; (buff + 0)
2351 : 65 47 __ ADC T0 + 0 
2353 : aa __ __ TAX
2354 : a5 17 __ LDA P10 ; (buff + 1)
2356 : 69 00 __ ADC #$00
2358 : 4c 6a 23 JMP $236a ; (sformat.s1001 + 0)
.s119:
235b : a5 16 __ LDA P9 ; (buff + 0)
235d : 85 0d __ STA P0 
235f : a5 17 __ LDA P10 ; (buff + 1)
2361 : 85 0e __ STA P1 
2363 : 20 20 27 JSR $2720 ; (puts.s0 + 0)
.s1070:
2366 : a5 17 __ LDA P10 ; (buff + 1)
2368 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
236a : 86 1b __ STX ACCU + 0 ; (fps + 0)
236c : 85 1c __ STA ACCU + 1 ; (fps + 1)
236e : ad d7 ab LDA $abd7 ; (vp_fill + 10)
2371 : 85 53 __ STA T7 + 0 
2373 : ad d8 ab LDA $abd8 ; (vp_fill + 11)
2376 : 85 54 __ STA T7 + 1 
2378 : ad d9 ab LDA $abd9 ; (vp_fill + 12)
237b : 85 55 __ STA T7 + 2 
237d : 60 __ __ RTS
.s2:
237e : c9 25 __ CMP #$25
2380 : f0 3f __ BEQ $23c1 ; (sformat.s4 + 0)
.s5:
2382 : a4 47 __ LDY T0 + 0 
2384 : 91 16 __ STA (P9),y ; (buff + 0)
2386 : e6 49 __ INC T1 + 0 
2388 : d0 02 __ BNE $238c ; (sformat.s1098 + 0)
.s1097:
238a : e6 4a __ INC T1 + 1 
.s1098:
238c : c8 __ __ INY
238d : 84 47 __ STY T0 + 0 
238f : 98 __ __ TYA
2390 : c0 28 __ CPY #$28
2392 : 90 a8 __ BCC $233c ; (sformat.l1 + 0)
.s110:
2394 : 85 4c __ STA T5 + 0 
2396 : a9 00 __ LDA #$00
2398 : 85 47 __ STA T0 + 0 
239a : ad f7 ab LDA $abf7 ; (sstack + 4)
239d : f0 14 __ BEQ $23b3 ; (sformat.s114 + 0)
.s113:
239f : a5 16 __ LDA P9 ; (buff + 0)
23a1 : 85 0d __ STA P0 
23a3 : a5 17 __ LDA P10 ; (buff + 1)
23a5 : 85 0e __ STA P1 
23a7 : a9 00 __ LDA #$00
23a9 : a4 4c __ LDY T5 + 0 
23ab : 91 16 __ STA (P9),y ; (buff + 0)
23ad : 20 20 27 JSR $2720 ; (puts.s0 + 0)
23b0 : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s114:
23b3 : 18 __ __ CLC
23b4 : a5 16 __ LDA P9 ; (buff + 0)
23b6 : 65 4c __ ADC T5 + 0 
23b8 : 85 16 __ STA P9 ; (buff + 0)
23ba : 90 80 __ BCC $233c ; (sformat.l1 + 0)
.s1099:
23bc : e6 17 __ INC P10 ; (buff + 1)
23be : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s4:
23c1 : a5 47 __ LDA T0 + 0 
23c3 : f0 27 __ BEQ $23ec ; (sformat.s9 + 0)
.s7:
23c5 : 84 47 __ STY T0 + 0 
23c7 : 85 4c __ STA T5 + 0 
23c9 : ad f7 ab LDA $abf7 ; (sstack + 4)
23cc : f0 13 __ BEQ $23e1 ; (sformat.s11 + 0)
.s10:
23ce : a5 16 __ LDA P9 ; (buff + 0)
23d0 : 85 0d __ STA P0 
23d2 : a5 17 __ LDA P10 ; (buff + 1)
23d4 : 85 0e __ STA P1 
23d6 : 98 __ __ TYA
23d7 : a4 4c __ LDY T5 + 0 
23d9 : 91 16 __ STA (P9),y ; (buff + 0)
23db : 20 20 27 JSR $2720 ; (puts.s0 + 0)
23de : 4c ec 23 JMP $23ec ; (sformat.s9 + 0)
.s11:
23e1 : 18 __ __ CLC
23e2 : a5 16 __ LDA P9 ; (buff + 0)
23e4 : 65 4c __ ADC T5 + 0 
23e6 : 85 16 __ STA P9 ; (buff + 0)
23e8 : 90 02 __ BCC $23ec ; (sformat.s9 + 0)
.s1095:
23ea : e6 17 __ INC P10 ; (buff + 1)
.s9:
23ec : a9 0a __ LDA #$0a
23ee : 8d de ab STA $abde ; (vp_fill + 17)
23f1 : a9 00 __ LDA #$00
23f3 : 8d df ab STA $abdf ; (vp_fill + 18)
23f6 : 8d e0 ab STA $abe0 ; (vp_fill + 19)
23f9 : 8d e1 ab STA $abe1 ; (vp_fill + 20)
23fc : 8d e2 ab STA $abe2 ; (vp_fill + 21)
23ff : a0 01 __ LDY #$01
2401 : b1 49 __ LDA (T1 + 0),y 
2403 : a2 20 __ LDX #$20
2405 : 8e db ab STX $abdb ; (vp_fill + 14)
2408 : a2 00 __ LDX #$00
240a : 8e dc ab STX $abdc ; (vp_fill + 15)
240d : ca __ __ DEX
240e : 8e dd ab STX $abdd ; (vp_fill + 16)
2411 : aa __ __ TAX
2412 : 18 __ __ CLC
2413 : a5 49 __ LDA T1 + 0 
2415 : 69 02 __ ADC #$02
.l14:
2417 : 85 49 __ STA T1 + 0 
2419 : 90 02 __ BCC $241d ; (sformat.s1082 + 0)
.s1081:
241b : e6 4a __ INC T1 + 1 
.s1082:
241d : 8a __ __ TXA
241e : e0 2b __ CPX #$2b
2420 : d0 08 __ BNE $242a ; (sformat.s17 + 0)
.s16:
2422 : a9 01 __ LDA #$01
2424 : 8d e0 ab STA $abe0 ; (vp_fill + 19)
2427 : 4c 0b 27 JMP $270b ; (sformat.s264 + 0)
.s17:
242a : c9 30 __ CMP #$30
242c : d0 06 __ BNE $2434 ; (sformat.s20 + 0)
.s19:
242e : 8d db ab STA $abdb ; (vp_fill + 14)
2431 : 4c 0b 27 JMP $270b ; (sformat.s264 + 0)
.s20:
2434 : c9 23 __ CMP #$23
2436 : d0 08 __ BNE $2440 ; (sformat.s23 + 0)
.s22:
2438 : a9 01 __ LDA #$01
243a : 8d e2 ab STA $abe2 ; (vp_fill + 21)
243d : 4c 0b 27 JMP $270b ; (sformat.s264 + 0)
.s23:
2440 : c9 2d __ CMP #$2d
2442 : d0 08 __ BNE $244c ; (sformat.s15 + 0)
.s25:
2444 : a9 01 __ LDA #$01
2446 : 8d e1 ab STA $abe1 ; (vp_fill + 20)
2449 : 4c 0b 27 JMP $270b ; (sformat.s264 + 0)
.s15:
244c : 85 4c __ STA T5 + 0 
244e : c9 30 __ CMP #$30
2450 : 90 55 __ BCC $24a7 ; (sformat.s31 + 0)
.s32:
2452 : c9 3a __ CMP #$3a
2454 : b0 51 __ BCS $24a7 ; (sformat.s31 + 0)
.s29:
2456 : a9 00 __ LDA #$00
2458 : 85 44 __ STA T6 + 0 
245a : 85 45 __ STA T6 + 1 
245c : e0 3a __ CPX #$3a
245e : b0 40 __ BCS $24a0 ; (sformat.s35 + 0)
.l34:
2460 : a5 44 __ LDA T6 + 0 
2462 : 0a __ __ ASL
2463 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2465 : a5 45 __ LDA T6 + 1 
2467 : 2a __ __ ROL
2468 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
246a : 2a __ __ ROL
246b : aa __ __ TAX
246c : 18 __ __ CLC
246d : a5 1b __ LDA ACCU + 0 ; (fps + 0)
246f : 65 44 __ ADC T6 + 0 
2471 : 85 44 __ STA T6 + 0 
2473 : 8a __ __ TXA
2474 : 65 45 __ ADC T6 + 1 
2476 : 06 44 __ ASL T6 + 0 
2478 : 2a __ __ ROL
2479 : aa __ __ TAX
247a : 18 __ __ CLC
247b : a5 44 __ LDA T6 + 0 
247d : 65 4c __ ADC T5 + 0 
247f : 90 01 __ BCC $2482 ; (sformat.s1092 + 0)
.s1091:
2481 : e8 __ __ INX
.s1092:
2482 : 38 __ __ SEC
2483 : e9 30 __ SBC #$30
2485 : 85 44 __ STA T6 + 0 
2487 : 8a __ __ TXA
2488 : e9 00 __ SBC #$00
248a : 85 45 __ STA T6 + 1 
248c : a0 00 __ LDY #$00
248e : b1 49 __ LDA (T1 + 0),y 
2490 : 85 4c __ STA T5 + 0 
2492 : e6 49 __ INC T1 + 0 
2494 : d0 02 __ BNE $2498 ; (sformat.s1094 + 0)
.s1093:
2496 : e6 4a __ INC T1 + 1 
.s1094:
2498 : c9 30 __ CMP #$30
249a : 90 04 __ BCC $24a0 ; (sformat.s35 + 0)
.s36:
249c : c9 3a __ CMP #$3a
249e : 90 c0 __ BCC $2460 ; (sformat.l34 + 0)
.s35:
24a0 : a5 44 __ LDA T6 + 0 
24a2 : 8d dc ab STA $abdc ; (vp_fill + 15)
24a5 : a5 4c __ LDA T5 + 0 
.s31:
24a7 : c9 2e __ CMP #$2e
24a9 : d0 51 __ BNE $24fc ; (sformat.s39 + 0)
.s37:
24ab : a9 00 __ LDA #$00
24ad : 85 44 __ STA T6 + 0 
.l243:
24af : 85 45 __ STA T6 + 1 
24b1 : a0 00 __ LDY #$00
24b3 : b1 49 __ LDA (T1 + 0),y 
24b5 : 85 4c __ STA T5 + 0 
24b7 : e6 49 __ INC T1 + 0 
24b9 : d0 02 __ BNE $24bd ; (sformat.s1084 + 0)
.s1083:
24bb : e6 4a __ INC T1 + 1 
.s1084:
24bd : c9 30 __ CMP #$30
24bf : 90 04 __ BCC $24c5 ; (sformat.s42 + 0)
.s43:
24c1 : c9 3a __ CMP #$3a
24c3 : 90 0a __ BCC $24cf ; (sformat.s41 + 0)
.s42:
24c5 : a5 44 __ LDA T6 + 0 
24c7 : 8d dd ab STA $abdd ; (vp_fill + 16)
24ca : a5 4c __ LDA T5 + 0 
24cc : 4c fc 24 JMP $24fc ; (sformat.s39 + 0)
.s41:
24cf : a5 44 __ LDA T6 + 0 
24d1 : 0a __ __ ASL
24d2 : 85 1b __ STA ACCU + 0 ; (fps + 0)
24d4 : a5 45 __ LDA T6 + 1 
24d6 : 2a __ __ ROL
24d7 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24d9 : 2a __ __ ROL
24da : aa __ __ TAX
24db : 18 __ __ CLC
24dc : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24de : 65 44 __ ADC T6 + 0 
24e0 : 85 44 __ STA T6 + 0 
24e2 : 8a __ __ TXA
24e3 : 65 45 __ ADC T6 + 1 
24e5 : 06 44 __ ASL T6 + 0 
24e7 : 2a __ __ ROL
24e8 : aa __ __ TAX
24e9 : 18 __ __ CLC
24ea : a5 44 __ LDA T6 + 0 
24ec : 65 4c __ ADC T5 + 0 
24ee : 90 01 __ BCC $24f1 ; (sformat.s1090 + 0)
.s1089:
24f0 : e8 __ __ INX
.s1090:
24f1 : 38 __ __ SEC
24f2 : e9 30 __ SBC #$30
24f4 : 85 44 __ STA T6 + 0 
24f6 : 8a __ __ TXA
24f7 : e9 00 __ SBC #$00
24f9 : 4c af 24 JMP $24af ; (sformat.l243 + 0)
.s39:
24fc : c9 64 __ CMP #$64
24fe : f0 04 __ BEQ $2504 ; (sformat.s44 + 0)
.s47:
2500 : c9 44 __ CMP #$44
2502 : d0 05 __ BNE $2509 ; (sformat.s45 + 0)
.s44:
2504 : a9 01 __ LDA #$01
2506 : 4c cf 26 JMP $26cf ; (sformat.s261 + 0)
.s45:
2509 : c9 75 __ CMP #$75
250b : d0 03 __ BNE $2510 ; (sformat.s51 + 0)
250d : 4c cd 26 JMP $26cd ; (sformat.s291 + 0)
.s51:
2510 : c9 55 __ CMP #$55
2512 : d0 03 __ BNE $2517 ; (sformat.s49 + 0)
2514 : 4c cd 26 JMP $26cd ; (sformat.s291 + 0)
.s49:
2517 : c9 78 __ CMP #$78
2519 : f0 04 __ BEQ $251f ; (sformat.s52 + 0)
.s55:
251b : c9 58 __ CMP #$58
251d : d0 0d __ BNE $252c ; (sformat.s53 + 0)
.s52:
251f : a9 10 __ LDA #$10
2521 : 8d de ab STA $abde ; (vp_fill + 17)
2524 : a9 00 __ LDA #$00
2526 : 8d df ab STA $abdf ; (vp_fill + 18)
2529 : 4c cd 26 JMP $26cd ; (sformat.s291 + 0)
.s53:
252c : c9 6c __ CMP #$6c
252e : d0 03 __ BNE $2533 ; (sformat.s59 + 0)
2530 : 4c 44 26 JMP $2644 ; (sformat.s56 + 0)
.s59:
2533 : c9 4c __ CMP #$4c
2535 : d0 03 __ BNE $253a ; (sformat.s57 + 0)
2537 : 4c 44 26 JMP $2644 ; (sformat.s56 + 0)
.s57:
253a : c9 73 __ CMP #$73
253c : f0 54 __ BEQ $2592 ; (sformat.s72 + 0)
.s75:
253e : c9 53 __ CMP #$53
2540 : f0 50 __ BEQ $2592 ; (sformat.s72 + 0)
.s73:
2542 : c9 63 __ CMP #$63
2544 : f0 23 __ BEQ $2569 ; (sformat.s103 + 0)
.s106:
2546 : c9 43 __ CMP #$43
2548 : f0 1f __ BEQ $2569 ; (sformat.s103 + 0)
.s104:
254a : 09 00 __ ORA #$00
254c : d0 03 __ BNE $2551 ; (sformat.s107 + 0)
254e : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s107:
2551 : 18 __ __ CLC
2552 : a5 16 __ LDA P9 ; (buff + 0)
2554 : 65 47 __ ADC T0 + 0 
2556 : 85 44 __ STA T6 + 0 
2558 : a5 17 __ LDA P10 ; (buff + 1)
255a : 69 00 __ ADC #$00
255c : 85 45 __ STA T6 + 1 
255e : a5 4c __ LDA T5 + 0 
.s1068:
2560 : a0 00 __ LDY #$00
2562 : 91 44 __ STA (T6 + 0),y 
2564 : e6 47 __ INC T0 + 0 
2566 : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s103:
2569 : ad f5 ab LDA $abf5 ; (sstack + 2)
256c : 85 4c __ STA T5 + 0 
256e : 18 __ __ CLC
256f : 69 02 __ ADC #$02
2571 : 8d f5 ab STA $abf5 ; (sstack + 2)
2574 : ad f6 ab LDA $abf6 ; (sstack + 3)
2577 : 85 4d __ STA T5 + 1 
2579 : 69 00 __ ADC #$00
257b : 8d f6 ab STA $abf6 ; (sstack + 3)
257e : 18 __ __ CLC
257f : a5 16 __ LDA P9 ; (buff + 0)
2581 : 65 47 __ ADC T0 + 0 
2583 : 85 44 __ STA T6 + 0 
2585 : a5 17 __ LDA P10 ; (buff + 1)
2587 : 69 00 __ ADC #$00
2589 : 85 45 __ STA T6 + 1 
258b : a0 00 __ LDY #$00
258d : b1 4c __ LDA (T5 + 0),y 
258f : 4c 60 25 JMP $2560 ; (sformat.s1068 + 0)
.s72:
2592 : ad f5 ab LDA $abf5 ; (sstack + 2)
2595 : 85 4c __ STA T5 + 0 
2597 : 18 __ __ CLC
2598 : 69 02 __ ADC #$02
259a : 8d f5 ab STA $abf5 ; (sstack + 2)
259d : ad f6 ab LDA $abf6 ; (sstack + 3)
25a0 : 85 4d __ STA T5 + 1 
25a2 : 69 00 __ ADC #$00
25a4 : 8d f6 ab STA $abf6 ; (sstack + 3)
25a7 : a0 00 __ LDY #$00
25a9 : 84 4b __ STY T3 + 0 
25ab : b1 4c __ LDA (T5 + 0),y 
25ad : aa __ __ TAX
25ae : c8 __ __ INY
25af : b1 4c __ LDA (T5 + 0),y 
25b1 : 86 4c __ STX T5 + 0 
25b3 : 85 4d __ STA T5 + 1 
25b5 : ad dc ab LDA $abdc ; (vp_fill + 15)
25b8 : f0 0c __ BEQ $25c6 ; (sformat.s78 + 0)
.s1073:
25ba : 88 __ __ DEY
25bb : b1 4c __ LDA (T5 + 0),y 
25bd : f0 05 __ BEQ $25c4 ; (sformat.s1074 + 0)
.l80:
25bf : c8 __ __ INY
25c0 : b1 4c __ LDA (T5 + 0),y 
25c2 : d0 fb __ BNE $25bf ; (sformat.l80 + 0)
.s1074:
25c4 : 84 4b __ STY T3 + 0 
.s78:
25c6 : ad e1 ab LDA $abe1 ; (vp_fill + 20)
25c9 : d0 19 __ BNE $25e4 ; (sformat.s84 + 0)
.s1077:
25cb : a6 4b __ LDX T3 + 0 
25cd : ec dc ab CPX $abdc ; (vp_fill + 15)
25d0 : a4 47 __ LDY T0 + 0 
25d2 : b0 0c __ BCS $25e0 ; (sformat.s1078 + 0)
.l86:
25d4 : ad db ab LDA $abdb ; (vp_fill + 14)
25d7 : 91 16 __ STA (P9),y ; (buff + 0)
25d9 : e8 __ __ INX
25da : ec dc ab CPX $abdc ; (vp_fill + 15)
25dd : c8 __ __ INY
25de : 90 f4 __ BCC $25d4 ; (sformat.l86 + 0)
.s1078:
25e0 : 86 4b __ STX T3 + 0 
25e2 : 84 47 __ STY T0 + 0 
.s84:
25e4 : ad f7 ab LDA $abf7 ; (sstack + 4)
25e7 : d0 37 __ BNE $2620 ; (sformat.s88 + 0)
.l94:
25e9 : a0 00 __ LDY #$00
25eb : b1 4c __ LDA (T5 + 0),y 
25ed : f0 0f __ BEQ $25fe ; (sformat.s251 + 0)
.s95:
25ef : a4 47 __ LDY T0 + 0 
25f1 : 91 16 __ STA (P9),y ; (buff + 0)
25f3 : e6 47 __ INC T0 + 0 
25f5 : e6 4c __ INC T5 + 0 
25f7 : d0 f0 __ BNE $25e9 ; (sformat.l94 + 0)
.s1087:
25f9 : e6 4d __ INC T5 + 1 
25fb : 4c e9 25 JMP $25e9 ; (sformat.l94 + 0)
.s251:
25fe : ad e1 ab LDA $abe1 ; (vp_fill + 20)
2601 : d0 03 __ BNE $2606 ; (sformat.s1075 + 0)
2603 : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s1075:
2606 : a6 4b __ LDX T3 + 0 
2608 : ec dc ab CPX $abdc ; (vp_fill + 15)
260b : a4 47 __ LDY T0 + 0 
260d : b0 0c __ BCS $261b ; (sformat.s1076 + 0)
.l101:
260f : ad db ab LDA $abdb ; (vp_fill + 14)
2612 : 91 16 __ STA (P9),y ; (buff + 0)
2614 : e8 __ __ INX
2615 : ec dc ab CPX $abdc ; (vp_fill + 15)
2618 : c8 __ __ INY
2619 : 90 f4 __ BCC $260f ; (sformat.l101 + 0)
.s1076:
261b : 84 47 __ STY T0 + 0 
261d : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s88:
2620 : a5 47 __ LDA T0 + 0 
2622 : f0 1a __ BEQ $263e ; (sformat.s93 + 0)
.s91:
2624 : a5 16 __ LDA P9 ; (buff + 0)
2626 : 85 0d __ STA P0 
2628 : a5 17 __ LDA P10 ; (buff + 1)
262a : 85 0e __ STA P1 
262c : a9 00 __ LDA #$00
262e : a4 47 __ LDY T0 + 0 
2630 : 91 16 __ STA (P9),y ; (buff + 0)
2632 : 20 20 27 JSR $2720 ; (puts.s0 + 0)
2635 : 20 18 27 JSR $2718 ; (puts@proxy + 0)
2638 : a9 00 __ LDA #$00
263a : 85 47 __ STA T0 + 0 
263c : f0 c0 __ BEQ $25fe ; (sformat.s251 + 0)
.s93:
263e : 20 18 27 JSR $2718 ; (puts@proxy + 0)
2641 : 4c fe 25 JMP $25fe ; (sformat.s251 + 0)
.s56:
2644 : ad f5 ab LDA $abf5 ; (sstack + 2)
2647 : 85 4c __ STA T5 + 0 
2649 : 18 __ __ CLC
264a : 69 04 __ ADC #$04
264c : 8d f5 ab STA $abf5 ; (sstack + 2)
264f : ad f6 ab LDA $abf6 ; (sstack + 3)
2652 : 85 4d __ STA T5 + 1 
2654 : 69 00 __ ADC #$00
2656 : 8d f6 ab STA $abf6 ; (sstack + 3)
2659 : a0 00 __ LDY #$00
265b : b1 49 __ LDA (T1 + 0),y 
265d : aa __ __ TAX
265e : e6 49 __ INC T1 + 0 
2660 : d0 02 __ BNE $2664 ; (sformat.s1086 + 0)
.s1085:
2662 : e6 4a __ INC T1 + 1 
.s1086:
2664 : b1 4c __ LDA (T5 + 0),y 
2666 : 85 53 __ STA T7 + 0 
2668 : a0 01 __ LDY #$01
266a : b1 4c __ LDA (T5 + 0),y 
266c : 85 54 __ STA T7 + 1 
266e : c8 __ __ INY
266f : b1 4c __ LDA (T5 + 0),y 
2671 : 85 55 __ STA T7 + 2 
2673 : c8 __ __ INY
2674 : b1 4c __ LDA (T5 + 0),y 
2676 : a8 __ __ TAY
2677 : 8a __ __ TXA
2678 : e0 64 __ CPX #$64
267a : f0 04 __ BEQ $2680 ; (sformat.s60 + 0)
.s63:
267c : c9 44 __ CMP #$44
267e : d0 04 __ BNE $2684 ; (sformat.s61 + 0)
.s60:
2680 : a9 01 __ LDA #$01
2682 : d0 1f __ BNE $26a3 ; (sformat.s262 + 0)
.s61:
2684 : c9 75 __ CMP #$75
2686 : f0 19 __ BEQ $26a1 ; (sformat.s292 + 0)
.s67:
2688 : c9 55 __ CMP #$55
268a : f0 15 __ BEQ $26a1 ; (sformat.s292 + 0)
.s65:
268c : c9 78 __ CMP #$78
268e : f0 07 __ BEQ $2697 ; (sformat.s68 + 0)
.s71:
2690 : c9 58 __ CMP #$58
2692 : f0 03 __ BEQ $2697 ; (sformat.s68 + 0)
2694 : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s68:
2697 : a9 10 __ LDA #$10
2699 : 8d de ab STA $abde ; (vp_fill + 17)
269c : a9 00 __ LDA #$00
269e : 8d df ab STA $abdf ; (vp_fill + 18)
.s292:
26a1 : a9 00 __ LDA #$00
.s262:
26a3 : 84 14 __ STY P7 
26a5 : 85 15 __ STA P8 
26a7 : a5 16 __ LDA P9 ; (buff + 0)
26a9 : 85 0f __ STA P2 
26ab : a5 17 __ LDA P10 ; (buff + 1)
26ad : 85 10 __ STA P3 
26af : a5 53 __ LDA T7 + 0 
26b1 : 85 11 __ STA P4 
26b3 : a5 54 __ LDA T7 + 1 
26b5 : 85 12 __ STA P5 
26b7 : a5 55 __ LDA T7 + 2 
26b9 : 85 13 __ STA P6 
26bb : a9 db __ LDA #$db
26bd : 85 0d __ STA P0 
26bf : a9 ab __ LDA #$ab
26c1 : 85 0e __ STA P1 
26c3 : 20 aa 28 JSR $28aa ; (nforml.s0 + 0)
.s1069:
26c6 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26c8 : 85 47 __ STA T0 + 0 
26ca : 4c 3c 23 JMP $233c ; (sformat.l1 + 0)
.s291:
26cd : a9 00 __ LDA #$00
.s261:
26cf : 85 13 __ STA P6 
26d1 : a5 16 __ LDA P9 ; (buff + 0)
26d3 : 85 0f __ STA P2 
26d5 : a5 17 __ LDA P10 ; (buff + 1)
26d7 : 85 10 __ STA P3 
26d9 : ad f5 ab LDA $abf5 ; (sstack + 2)
26dc : 85 47 __ STA T0 + 0 
26de : ad f6 ab LDA $abf6 ; (sstack + 3)
26e1 : 85 48 __ STA T0 + 1 
26e3 : a0 00 __ LDY #$00
26e5 : b1 47 __ LDA (T0 + 0),y 
26e7 : 85 11 __ STA P4 
26e9 : c8 __ __ INY
26ea : b1 47 __ LDA (T0 + 0),y 
26ec : 85 12 __ STA P5 
26ee : 18 __ __ CLC
26ef : a5 47 __ LDA T0 + 0 
26f1 : 69 02 __ ADC #$02
26f3 : 8d f5 ab STA $abf5 ; (sstack + 2)
26f6 : a5 48 __ LDA T0 + 1 
26f8 : 69 00 __ ADC #$00
26fa : 8d f6 ab STA $abf6 ; (sstack + 3)
26fd : a9 db __ LDA #$db
26ff : 85 0d __ STA P0 
2701 : a9 ab __ LDA #$ab
2703 : 85 0e __ STA P1 
2705 : 20 75 27 JSR $2775 ; (nformi.s0 + 0)
2708 : 4c c6 26 JMP $26c6 ; (sformat.s1069 + 0)
.s264:
270b : a0 00 __ LDY #$00
270d : b1 49 __ LDA (T1 + 0),y 
270f : aa __ __ TAX
2710 : 18 __ __ CLC
2711 : a5 49 __ LDA T1 + 0 
2713 : 69 01 __ ADC #$01
2715 : 4c 17 24 JMP $2417 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
2718 : a5 4c __ LDA $4c 
271a : 85 0d __ STA P0 
271c : a5 4d __ LDA $4d 
271e : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2720 : a0 00 __ LDY #$00
2722 : b1 0d __ LDA (P0),y 
2724 : f0 0b __ BEQ $2731 ; (puts.s1001 + 0)
2726 : 20 32 27 JSR $2732 ; (putpch + 0)
2729 : e6 0d __ INC P0 
272b : d0 f3 __ BNE $2720 ; (puts.s0 + 0)
272d : e6 0e __ INC P1 
272f : d0 ef __ BNE $2720 ; (puts.s0 + 0)
.s1001:
2731 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2732 : ae ff 51 LDX $51ff ; (giocharmap + 0)
2735 : e0 01 __ CPX #$01
2737 : 90 26 __ BCC $275f ; (putpch + 45)
2739 : c9 0a __ CMP #$0a
273b : d0 02 __ BNE $273f ; (putpch + 13)
273d : a9 0d __ LDA #$0d
273f : c9 09 __ CMP #$09
2741 : f0 1f __ BEQ $2762 ; (putpch + 48)
2743 : e0 02 __ CPX #$02
2745 : 90 18 __ BCC $275f ; (putpch + 45)
2747 : c9 41 __ CMP #$41
2749 : 90 14 __ BCC $275f ; (putpch + 45)
274b : c9 7b __ CMP #$7b
274d : b0 10 __ BCS $275f ; (putpch + 45)
274f : c9 61 __ CMP #$61
2751 : b0 04 __ BCS $2757 ; (putpch + 37)
2753 : c9 5b __ CMP #$5b
2755 : b0 08 __ BCS $275f ; (putpch + 45)
2757 : 49 20 __ EOR #$20
2759 : e0 03 __ CPX #$03
275b : f0 02 __ BEQ $275f ; (putpch + 45)
275d : 29 df __ AND #$df
275f : 4c d2 ff JMP $ffd2 
2762 : 38 __ __ SEC
2763 : 20 f0 ff JSR $fff0 
2766 : 98 __ __ TYA
2767 : 29 03 __ AND #$03
2769 : 49 03 __ EOR #$03
276b : aa __ __ TAX
276c : a9 20 __ LDA #$20
276e : 20 d2 ff JSR $ffd2 
2771 : ca __ __ DEX
2772 : 10 fa __ BPL $276e ; (putpch + 60)
2774 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2775 : a9 00 __ LDA #$00
2777 : 85 43 __ STA T0 + 0 
2779 : a5 13 __ LDA P6 ; (s + 0)
277b : f0 13 __ BEQ $2790 ; (nformi.s182 + 0)
.s4:
277d : 24 12 __ BIT P5 ; (v + 1)
277f : 10 0f __ BPL $2790 ; (nformi.s182 + 0)
.s1:
2781 : 38 __ __ SEC
2782 : a9 00 __ LDA #$00
2784 : e5 11 __ SBC P4 ; (v + 0)
2786 : 85 11 __ STA P4 ; (v + 0)
2788 : a9 00 __ LDA #$00
278a : e5 12 __ SBC P5 ; (v + 1)
278c : 85 12 __ STA P5 ; (v + 1)
278e : e6 43 __ INC T0 + 0 
.s182:
2790 : a9 10 __ LDA #$10
2792 : 85 44 __ STA T2 + 0 
2794 : a5 11 __ LDA P4 ; (v + 0)
2796 : 05 12 __ ORA P5 ; (v + 1)
2798 : f0 46 __ BEQ $27e0 ; (nformi.s7 + 0)
.s42:
279a : a0 03 __ LDY #$03
279c : b1 0d __ LDA (P0),y ; (si + 0)
279e : 85 45 __ STA T4 + 0 
27a0 : c8 __ __ INY
27a1 : b1 0d __ LDA (P0),y ; (si + 0)
27a3 : 85 46 __ STA T4 + 1 
.l6:
27a5 : a5 11 __ LDA P4 ; (v + 0)
27a7 : 85 1b __ STA ACCU + 0 
27a9 : a5 12 __ LDA P5 ; (v + 1)
27ab : 85 1c __ STA ACCU + 1 
27ad : a5 45 __ LDA T4 + 0 
27af : 85 03 __ STA WORK + 0 
27b1 : a5 46 __ LDA T4 + 1 
27b3 : 85 04 __ STA WORK + 1 
27b5 : 20 a4 7c JSR $7ca4 ; (divmod + 0)
27b8 : a5 06 __ LDA WORK + 3 
27ba : 30 08 __ BMI $27c4 ; (nformi.s78 + 0)
.s1019:
27bc : d0 0a __ BNE $27c8 ; (nformi.s77 + 0)
.s1018:
27be : a5 05 __ LDA WORK + 2 
27c0 : c9 0a __ CMP #$0a
27c2 : b0 04 __ BCS $27c8 ; (nformi.s77 + 0)
.s78:
27c4 : a9 30 __ LDA #$30
27c6 : d0 02 __ BNE $27ca ; (nformi.s79 + 0)
.s77:
27c8 : a9 37 __ LDA #$37
.s79:
27ca : 18 __ __ CLC
27cb : 65 05 __ ADC WORK + 2 
27cd : c6 44 __ DEC T2 + 0 
27cf : a6 44 __ LDX T2 + 0 
27d1 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
27d4 : a5 1b __ LDA ACCU + 0 
27d6 : 85 11 __ STA P4 ; (v + 0)
27d8 : a5 1c __ LDA ACCU + 1 
27da : 85 12 __ STA P5 ; (v + 1)
27dc : 05 11 __ ORA P4 ; (v + 0)
27de : d0 c5 __ BNE $27a5 ; (nformi.l6 + 0)
.s7:
27e0 : a0 02 __ LDY #$02
27e2 : b1 0d __ LDA (P0),y ; (si + 0)
27e4 : c9 ff __ CMP #$ff
27e6 : d0 04 __ BNE $27ec ; (nformi.s80 + 0)
.s81:
27e8 : a9 0f __ LDA #$0f
27ea : d0 05 __ BNE $27f1 ; (nformi.s1026 + 0)
.s80:
27ec : 38 __ __ SEC
27ed : a9 10 __ LDA #$10
27ef : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27f1 : a8 __ __ TAY
27f2 : c4 44 __ CPY T2 + 0 
27f4 : b0 0d __ BCS $2803 ; (nformi.s10 + 0)
.s9:
27f6 : a9 30 __ LDA #$30
.l1027:
27f8 : c6 44 __ DEC T2 + 0 
27fa : a6 44 __ LDX T2 + 0 
27fc : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
27ff : c4 44 __ CPY T2 + 0 
2801 : 90 f5 __ BCC $27f8 ; (nformi.l1027 + 0)
.s10:
2803 : a0 07 __ LDY #$07
2805 : b1 0d __ LDA (P0),y ; (si + 0)
2807 : f0 20 __ BEQ $2829 ; (nformi.s13 + 0)
.s14:
2809 : a0 04 __ LDY #$04
280b : b1 0d __ LDA (P0),y ; (si + 0)
280d : d0 1a __ BNE $2829 ; (nformi.s13 + 0)
.s1013:
280f : 88 __ __ DEY
2810 : b1 0d __ LDA (P0),y ; (si + 0)
2812 : c9 10 __ CMP #$10
2814 : d0 13 __ BNE $2829 ; (nformi.s13 + 0)
.s11:
2816 : a9 58 __ LDA #$58
2818 : a6 44 __ LDX T2 + 0 
281a : 9d e2 ab STA $abe2,x ; (vp_fill + 21)
281d : 8a __ __ TXA
281e : 18 __ __ CLC
281f : 69 fe __ ADC #$fe
2821 : 85 44 __ STA T2 + 0 
2823 : aa __ __ TAX
2824 : a9 30 __ LDA #$30
2826 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s13:
2829 : a9 00 __ LDA #$00
282b : 85 1b __ STA ACCU + 0 
282d : a5 43 __ LDA T0 + 0 
282f : f0 06 __ BEQ $2837 ; (nformi.s16 + 0)
.s15:
2831 : c6 44 __ DEC T2 + 0 
2833 : a9 2d __ LDA #$2d
2835 : d0 0a __ BNE $2841 ; (nformi.s1025 + 0)
.s16:
2837 : a0 05 __ LDY #$05
2839 : b1 0d __ LDA (P0),y ; (si + 0)
283b : f0 09 __ BEQ $2846 ; (nformi.s163 + 0)
.s18:
283d : c6 44 __ DEC T2 + 0 
283f : a9 2b __ LDA #$2b
.s1025:
2841 : a6 44 __ LDX T2 + 0 
2843 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s163:
2846 : a0 06 __ LDY #$06
2848 : b1 0d __ LDA (P0),y ; (si + 0)
284a : d0 33 __ BNE $287f ; (nformi.s24 + 0)
.l30:
284c : a0 01 __ LDY #$01
284e : b1 0d __ LDA (P0),y ; (si + 0)
2850 : 18 __ __ CLC
2851 : 65 44 __ ADC T2 + 0 
2853 : b0 04 __ BCS $2859 ; (nformi.s31 + 0)
.s1006:
2855 : c9 11 __ CMP #$11
2857 : 90 0d __ BCC $2866 ; (nformi.s33 + 0)
.s31:
2859 : c6 44 __ DEC T2 + 0 
285b : a0 00 __ LDY #$00
285d : b1 0d __ LDA (P0),y ; (si + 0)
285f : a6 44 __ LDX T2 + 0 
2861 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
2864 : b0 e6 __ BCS $284c ; (nformi.l30 + 0)
.s33:
2866 : a6 44 __ LDX T2 + 0 
2868 : e0 10 __ CPX #$10
286a : b0 0e __ BCS $287a ; (nformi.s23 + 0)
.s34:
286c : 88 __ __ DEY
.l1022:
286d : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
2870 : 91 0f __ STA (P2),y ; (str + 0)
2872 : e8 __ __ INX
2873 : e0 10 __ CPX #$10
2875 : c8 __ __ INY
2876 : 90 f5 __ BCC $286d ; (nformi.l1022 + 0)
.s1023:
2878 : 84 1b __ STY ACCU + 0 
.s23:
287a : a9 00 __ LDA #$00
287c : 85 1c __ STA ACCU + 1 
.s1001:
287e : 60 __ __ RTS
.s24:
287f : a6 44 __ LDX T2 + 0 
2881 : e0 10 __ CPX #$10
2883 : b0 1a __ BCS $289f ; (nformi.l27 + 0)
.s25:
2885 : a0 00 __ LDY #$00
.l1020:
2887 : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
288a : 91 0f __ STA (P2),y ; (str + 0)
288c : e8 __ __ INX
288d : e0 10 __ CPX #$10
288f : c8 __ __ INY
2890 : 90 f5 __ BCC $2887 ; (nformi.l1020 + 0)
.s1021:
2892 : 84 1b __ STY ACCU + 0 
2894 : b0 09 __ BCS $289f ; (nformi.l27 + 0)
.s28:
2896 : 88 __ __ DEY
2897 : b1 0d __ LDA (P0),y ; (si + 0)
2899 : a4 1b __ LDY ACCU + 0 
289b : 91 0f __ STA (P2),y ; (str + 0)
289d : e6 1b __ INC ACCU + 0 
.l27:
289f : a5 1b __ LDA ACCU + 0 
28a1 : a0 01 __ LDY #$01
28a3 : d1 0d __ CMP (P0),y ; (si + 0)
28a5 : 90 ef __ BCC $2896 ; (nformi.s28 + 0)
28a7 : 4c 7a 28 JMP $287a ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
28aa : a9 00 __ LDA #$00
28ac : 85 43 __ STA T0 + 0 
28ae : a5 15 __ LDA P8 ; (s + 0)
28b0 : f0 21 __ BEQ $28d3 ; (nforml.s182 + 0)
.s4:
28b2 : a5 14 __ LDA P7 ; (v + 3)
28b4 : f0 1d __ BEQ $28d3 ; (nforml.s182 + 0)
.s1032:
28b6 : 10 1b __ BPL $28d3 ; (nforml.s182 + 0)
.s1:
28b8 : 38 __ __ SEC
28b9 : a9 00 __ LDA #$00
28bb : e5 11 __ SBC P4 ; (v + 0)
28bd : 85 11 __ STA P4 ; (v + 0)
28bf : a9 00 __ LDA #$00
28c1 : e5 12 __ SBC P5 ; (v + 1)
28c3 : 85 12 __ STA P5 ; (v + 1)
28c5 : a9 00 __ LDA #$00
28c7 : e5 13 __ SBC P6 ; (v + 2)
28c9 : 85 13 __ STA P6 ; (v + 2)
28cb : a9 00 __ LDA #$00
28cd : e5 14 __ SBC P7 ; (v + 3)
28cf : 85 14 __ STA P7 ; (v + 3)
28d1 : e6 43 __ INC T0 + 0 
.s182:
28d3 : a9 10 __ LDA #$10
28d5 : 85 44 __ STA T2 + 0 
28d7 : a5 14 __ LDA P7 ; (v + 3)
28d9 : d0 0c __ BNE $28e7 ; (nforml.s42 + 0)
.s1024:
28db : a5 13 __ LDA P6 ; (v + 2)
28dd : d0 08 __ BNE $28e7 ; (nforml.s42 + 0)
.s1025:
28df : a5 12 __ LDA P5 ; (v + 1)
28e1 : d0 04 __ BNE $28e7 ; (nforml.s42 + 0)
.s1026:
28e3 : c5 11 __ CMP P4 ; (v + 0)
28e5 : b0 0e __ BCS $28f5 ; (nforml.s7 + 0)
.s42:
28e7 : a0 03 __ LDY #$03
28e9 : b1 0d __ LDA (P0),y ; (si + 0)
28eb : 85 45 __ STA T5 + 0 
28ed : c8 __ __ INY
28ee : b1 0d __ LDA (P0),y ; (si + 0)
28f0 : 85 46 __ STA T5 + 1 
28f2 : 4c bf 29 JMP $29bf ; (nforml.l6 + 0)
.s7:
28f5 : a0 02 __ LDY #$02
28f7 : b1 0d __ LDA (P0),y ; (si + 0)
28f9 : c9 ff __ CMP #$ff
28fb : d0 04 __ BNE $2901 ; (nforml.s80 + 0)
.s81:
28fd : a9 0f __ LDA #$0f
28ff : d0 05 __ BNE $2906 ; (nforml.s1039 + 0)
.s80:
2901 : 38 __ __ SEC
2902 : a9 10 __ LDA #$10
2904 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2906 : a8 __ __ TAY
2907 : c4 44 __ CPY T2 + 0 
2909 : b0 0d __ BCS $2918 ; (nforml.s10 + 0)
.s9:
290b : a9 30 __ LDA #$30
.l1040:
290d : c6 44 __ DEC T2 + 0 
290f : a6 44 __ LDX T2 + 0 
2911 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
2914 : c4 44 __ CPY T2 + 0 
2916 : 90 f5 __ BCC $290d ; (nforml.l1040 + 0)
.s10:
2918 : a0 07 __ LDY #$07
291a : b1 0d __ LDA (P0),y ; (si + 0)
291c : f0 20 __ BEQ $293e ; (nforml.s13 + 0)
.s14:
291e : a0 04 __ LDY #$04
2920 : b1 0d __ LDA (P0),y ; (si + 0)
2922 : d0 1a __ BNE $293e ; (nforml.s13 + 0)
.s1013:
2924 : 88 __ __ DEY
2925 : b1 0d __ LDA (P0),y ; (si + 0)
2927 : c9 10 __ CMP #$10
2929 : d0 13 __ BNE $293e ; (nforml.s13 + 0)
.s11:
292b : a9 58 __ LDA #$58
292d : a6 44 __ LDX T2 + 0 
292f : 9d e2 ab STA $abe2,x ; (vp_fill + 21)
2932 : 8a __ __ TXA
2933 : 18 __ __ CLC
2934 : 69 fe __ ADC #$fe
2936 : 85 44 __ STA T2 + 0 
2938 : aa __ __ TAX
2939 : a9 30 __ LDA #$30
293b : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s13:
293e : a9 00 __ LDA #$00
2940 : 85 1b __ STA ACCU + 0 
2942 : a5 43 __ LDA T0 + 0 
2944 : f0 06 __ BEQ $294c ; (nforml.s16 + 0)
.s15:
2946 : c6 44 __ DEC T2 + 0 
2948 : a9 2d __ LDA #$2d
294a : d0 0a __ BNE $2956 ; (nforml.s1038 + 0)
.s16:
294c : a0 05 __ LDY #$05
294e : b1 0d __ LDA (P0),y ; (si + 0)
2950 : f0 09 __ BEQ $295b ; (nforml.s163 + 0)
.s18:
2952 : c6 44 __ DEC T2 + 0 
2954 : a9 2b __ LDA #$2b
.s1038:
2956 : a6 44 __ LDX T2 + 0 
2958 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
.s163:
295b : a0 06 __ LDY #$06
295d : b1 0d __ LDA (P0),y ; (si + 0)
295f : d0 33 __ BNE $2994 ; (nforml.s24 + 0)
.l30:
2961 : a0 01 __ LDY #$01
2963 : b1 0d __ LDA (P0),y ; (si + 0)
2965 : 18 __ __ CLC
2966 : 65 44 __ ADC T2 + 0 
2968 : b0 04 __ BCS $296e ; (nforml.s31 + 0)
.s1006:
296a : c9 11 __ CMP #$11
296c : 90 0d __ BCC $297b ; (nforml.s33 + 0)
.s31:
296e : c6 44 __ DEC T2 + 0 
2970 : a0 00 __ LDY #$00
2972 : b1 0d __ LDA (P0),y ; (si + 0)
2974 : a6 44 __ LDX T2 + 0 
2976 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
2979 : b0 e6 __ BCS $2961 ; (nforml.l30 + 0)
.s33:
297b : a6 44 __ LDX T2 + 0 
297d : e0 10 __ CPX #$10
297f : b0 0e __ BCS $298f ; (nforml.s23 + 0)
.s34:
2981 : 88 __ __ DEY
.l1035:
2982 : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
2985 : 91 0f __ STA (P2),y ; (str + 0)
2987 : e8 __ __ INX
2988 : e0 10 __ CPX #$10
298a : c8 __ __ INY
298b : 90 f5 __ BCC $2982 ; (nforml.l1035 + 0)
.s1036:
298d : 84 1b __ STY ACCU + 0 
.s23:
298f : a9 00 __ LDA #$00
2991 : 85 1c __ STA ACCU + 1 
.s1001:
2993 : 60 __ __ RTS
.s24:
2994 : a6 44 __ LDX T2 + 0 
2996 : e0 10 __ CPX #$10
2998 : b0 1a __ BCS $29b4 ; (nforml.l27 + 0)
.s25:
299a : a0 00 __ LDY #$00
.l1033:
299c : bd e3 ab LDA $abe3,x ; (vp_fill + 22)
299f : 91 0f __ STA (P2),y ; (str + 0)
29a1 : e8 __ __ INX
29a2 : e0 10 __ CPX #$10
29a4 : c8 __ __ INY
29a5 : 90 f5 __ BCC $299c ; (nforml.l1033 + 0)
.s1034:
29a7 : 84 1b __ STY ACCU + 0 
29a9 : b0 09 __ BCS $29b4 ; (nforml.l27 + 0)
.s28:
29ab : 88 __ __ DEY
29ac : b1 0d __ LDA (P0),y ; (si + 0)
29ae : a4 1b __ LDY ACCU + 0 
29b0 : 91 0f __ STA (P2),y ; (str + 0)
29b2 : e6 1b __ INC ACCU + 0 
.l27:
29b4 : a5 1b __ LDA ACCU + 0 
29b6 : a0 01 __ LDY #$01
29b8 : d1 0d __ CMP (P0),y ; (si + 0)
29ba : 90 ef __ BCC $29ab ; (nforml.s28 + 0)
29bc : 4c 8f 29 JMP $298f ; (nforml.s23 + 0)
.l6:
29bf : a5 11 __ LDA P4 ; (v + 0)
29c1 : 85 1b __ STA ACCU + 0 
29c3 : a5 12 __ LDA P5 ; (v + 1)
29c5 : 85 1c __ STA ACCU + 1 
29c7 : a5 13 __ LDA P6 ; (v + 2)
29c9 : 85 1d __ STA ACCU + 2 
29cb : a5 14 __ LDA P7 ; (v + 3)
29cd : 85 1e __ STA ACCU + 3 
29cf : a5 45 __ LDA T5 + 0 
29d1 : 85 03 __ STA WORK + 0 
29d3 : a5 46 __ LDA T5 + 1 
29d5 : 85 04 __ STA WORK + 1 
29d7 : a9 00 __ LDA #$00
29d9 : 85 05 __ STA WORK + 2 
29db : 85 06 __ STA WORK + 3 
29dd : 20 82 7d JSR $7d82 ; (divmod32 + 0)
29e0 : a5 08 __ LDA WORK + 5 
29e2 : 30 08 __ BMI $29ec ; (nforml.s78 + 0)
.s1023:
29e4 : d0 0a __ BNE $29f0 ; (nforml.s77 + 0)
.s1022:
29e6 : a5 07 __ LDA WORK + 4 
29e8 : c9 0a __ CMP #$0a
29ea : b0 04 __ BCS $29f0 ; (nforml.s77 + 0)
.s78:
29ec : a9 30 __ LDA #$30
29ee : d0 02 __ BNE $29f2 ; (nforml.s79 + 0)
.s77:
29f0 : a9 37 __ LDA #$37
.s79:
29f2 : 18 __ __ CLC
29f3 : 65 07 __ ADC WORK + 4 
29f5 : c6 44 __ DEC T2 + 0 
29f7 : a6 44 __ LDX T2 + 0 
29f9 : 9d e3 ab STA $abe3,x ; (vp_fill + 22)
29fc : a5 1b __ LDA ACCU + 0 
29fe : 85 11 __ STA P4 ; (v + 0)
2a00 : a5 1c __ LDA ACCU + 1 
2a02 : 85 12 __ STA P5 ; (v + 1)
2a04 : a5 1d __ LDA ACCU + 2 
2a06 : 85 13 __ STA P6 ; (v + 2)
2a08 : a5 1e __ LDA ACCU + 3 
2a0a : 85 14 __ STA P7 ; (v + 3)
2a0c : d0 b1 __ BNE $29bf ; (nforml.l6 + 0)
.s1018:
2a0e : a5 13 __ LDA P6 ; (v + 2)
2a10 : d0 ad __ BNE $29bf ; (nforml.l6 + 0)
.s1019:
2a12 : a5 12 __ LDA P5 ; (v + 1)
2a14 : d0 a9 __ BNE $29bf ; (nforml.l6 + 0)
.s1020:
2a16 : c5 11 __ CMP P4 ; (v + 0)
2a18 : 90 a5 __ BCC $29bf ; (nforml.l6 + 0)
2a1a : 4c f5 28 JMP $28f5 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2a1d : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2a2d : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2a3d : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2a47 : 38 __ __ SEC
2a48 : a5 23 __ LDA SP + 0 
2a4a : e9 06 __ SBC #$06
2a4c : 85 23 __ STA SP + 0 
2a4e : b0 02 __ BCS $2a52 ; (load_overlay.s0 + 0)
2a50 : c6 24 __ DEC SP + 1 
.s0:
2a52 : a9 00 __ LDA #$00
2a54 : 85 0d __ STA P0 
2a56 : 85 0e __ STA P1 
2a58 : 20 b4 2a JSR $2ab4 ; (krnio_setbnk.s0 + 0)
2a5b : ad f8 ab LDA $abf8 ; (sstack + 5)
2a5e : 85 0d __ STA P0 
2a60 : ad f9 ab LDA $abf9 ; (sstack + 6)
2a63 : 85 0e __ STA P1 
2a65 : 20 c3 2a JSR $2ac3 ; (krnio_setnam.s0 + 0)
2a68 : a9 01 __ LDA #$01
2a6a : 85 0d __ STA P0 
2a6c : 85 0f __ STA P2 
2a6e : ad ff 82 LDA $82ff ; (bootdevice + 0)
2a71 : 85 0e __ STA P1 
2a73 : 20 d9 2a JSR $2ad9 ; (krnio_load.s0 + 0)
2a76 : 09 00 __ ORA #$00
2a78 : d0 2a __ BNE $2aa4 ; (load_overlay.s1001 + 0)
.s1:
2a7a : a9 00 __ LDA #$00
2a7c : a0 02 __ LDY #$02
2a7e : 91 23 __ STA (SP + 0),y 
2a80 : a9 2b __ LDA #$2b
2a82 : c8 __ __ INY
2a83 : 91 23 __ STA (SP + 0),y 
2a85 : 20 f6 22 JSR $22f6 ; (printf.s0 + 0)
2a88 : a9 1e __ LDA #$1e
2a8a : a0 02 __ LDY #$02
2a8c : 91 23 __ STA (SP + 0),y 
2a8e : a9 2b __ LDA #$2b
2a90 : c8 __ __ INY
2a91 : 91 23 __ STA (SP + 0),y 
2a93 : ad d9 86 LDA $86d9 ; (krnio_pstatus + 1)
2a96 : c8 __ __ INY
2a97 : 91 23 __ STA (SP + 0),y 
2a99 : a9 00 __ LDA #$00
2a9b : c8 __ __ INY
2a9c : 91 23 __ STA (SP + 0),y 
2a9e : 20 f6 22 JSR $22f6 ; (printf.s0 + 0)
2aa1 : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
.s1001:
2aa4 : 18 __ __ CLC
2aa5 : a5 23 __ LDA SP + 0 
2aa7 : 69 06 __ ADC #$06
2aa9 : 85 23 __ STA SP + 0 
2aab : 90 02 __ BCC $2aaf ; (load_overlay.s1001 + 11)
2aad : e6 24 __ INC SP + 1 
2aaf : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setbnk@proxy: ; krnio_setbnk@proxy
2ab0 : a9 00 __ LDA #$00
2ab2 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2ab4 : a5 0d __ LDA P0 
2ab6 : a6 0e __ LDX P1 
2ab8 : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam@proxy: ; krnio_setnam@proxy
2abb : a9 90 __ LDA #$90
2abd : 85 0d __ STA P0 
2abf : a9 88 __ LDA #$88
2ac1 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2ac3 : a5 0d __ LDA P0 
2ac5 : 05 0e __ ORA P1 
2ac7 : f0 08 __ BEQ $2ad1 ; (krnio_setnam.s0 + 14)
2ac9 : a0 ff __ LDY #$ff
2acb : c8 __ __ INY
2acc : b1 0d __ LDA (P0),y 
2ace : d0 fb __ BNE $2acb ; (krnio_setnam.s0 + 8)
2ad0 : 98 __ __ TYA
2ad1 : a6 0d __ LDX P0 
2ad3 : a4 0e __ LDY P1 
2ad5 : 20 bd ff JSR $ffbd 
.s1001:
2ad8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2ad9 : a5 0d __ LDA P0 
2adb : a6 0e __ LDX P1 
2add : a4 0f __ LDY P2 
2adf : 20 ba ff JSR $ffba 
2ae2 : a9 00 __ LDA #$00
2ae4 : a2 00 __ LDX #$00
2ae6 : a0 00 __ LDY #$00
2ae8 : 20 d5 ff JSR $ffd5 
2aeb : a9 00 __ LDA #$00
2aed : b0 02 __ BCS $2af1 ; (krnio_load.s0 + 24)
2aef : a9 01 __ LDA #$01
2af1 : 85 1b __ STA ACCU + 0 
.s1001:
2af3 : a5 1b __ LDA ACCU + 0 
2af5 : 60 __ __ RTS
--------------------------------------------------------------------
2af6 : __ __ __ BYT 56 44 43 53 45 4c 4d 43 00                      : VDCSELMC.
--------------------------------------------------------------------
2aff : __ __ __ BYT 00                                              : .
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
2b3a : ae ff 39 LDX $39ff ; (spentry + 0)
2b3d : 9a __ __ TXS
2b3e : a9 4c __ LDA #$4c
2b40 : 85 54 __ STA $54 
2b42 : a9 00 __ LDA #$00
2b44 : 85 13 __ STA P6 
.s1001:
2b46 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2b47 : 38 __ __ SEC
2b48 : a5 23 __ LDA SP + 0 
2b4a : e9 04 __ SBC #$04
2b4c : 85 23 __ STA SP + 0 
2b4e : b0 02 __ BCS $2b52 ; (vdc_init.s0 + 0)
2b50 : c6 24 __ DEC SP + 1 
.s0:
2b52 : a2 14 __ LDX #$14
.l1002:
2b54 : bd 18 82 LDA $8218,x ; (vdc_clear@proxy + 10)
2b57 : 9d ff 0f STA $0fff,x 
2b5a : ca __ __ DEX
2b5b : d0 f7 __ BNE $2b54 ; (vdc_init.l1002 + 0)
.s1003:
2b5d : a9 1a __ LDA #$1a
2b5f : 8d 00 d6 STA $d600 
.l128:
2b62 : 2c 00 d6 BIT $d600 
2b65 : 10 fb __ BPL $2b62 ; (vdc_init.l128 + 0)
.s7:
2b67 : ad 01 d6 LDA $d601 
2b6a : 29 f0 __ AND #$f0
2b6c : aa __ __ TAX
2b6d : a9 1a __ LDA #$1a
2b6f : 8d 00 d6 STA $d600 
.l130:
2b72 : 2c 00 d6 BIT $d600 
2b75 : 10 fb __ BPL $2b72 ; (vdc_init.l130 + 0)
.s13:
2b77 : 8e 01 d6 STX $d601 
2b7a : 8d 00 d6 STA $d600 
.l132:
2b7d : 2c 00 d6 BIT $d600 
2b80 : 10 fb __ BPL $2b7d ; (vdc_init.l132 + 0)
.s20:
2b82 : ad 01 d6 LDA $d601 
2b85 : 29 0f __ AND #$0f
2b87 : 09 d0 __ ORA #$d0
2b89 : a2 1a __ LDX #$1a
2b8b : 8e 00 d6 STX $d600 
.l134:
2b8e : 2c 00 d6 BIT $d600 
2b91 : 10 fb __ BPL $2b8e ; (vdc_init.l134 + 0)
.s26:
2b93 : 8d 01 d6 STA $d601 
2b96 : a9 8d __ LDA #$8d
2b98 : 8d 96 87 STA $8796 ; (vdc_state + 7)
2b9b : 20 d7 2b JSR $2bd7 ; (vdc_detect_mem_size.s0 + 0)
2b9e : 24 d7 __ BIT $d7 
2ba0 : 30 17 __ BMI $2bb9 ; (vdc_init.s29 + 0)
.s32:
2ba2 : a9 a1 __ LDA #$a1
2ba4 : a0 02 __ LDY #$02
2ba6 : 91 23 __ STA (SP + 0),y 
2ba8 : a9 2d __ LDA #$2d
2baa : c8 __ __ INY
2bab : 91 23 __ STA (SP + 0),y 
2bad : 20 f6 22 JSR $22f6 ; (printf.s0 + 0)
2bb0 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
2bb3 : 20 81 ff JSR $ff81 
2bb6 : 20 0c 2e JSR $2e0c ; (screen_setmode.s0 + 0)
.s29:
2bb9 : a9 01 __ LDA #$01
2bbb : 20 14 2e JSR $2e14 ; (fastmode.s0 + 0)
2bbe : 20 33 2e JSR $2e33 ; (vdc_set_mode@proxy + 0)
2bc1 : ad 8f 87 LDA $878f ; (vdc_state + 0)
2bc4 : c9 40 __ CMP #$40
2bc6 : d0 03 __ BNE $2bcb ; (vdc_init.s1001 + 0)
.s39:
2bc8 : 20 26 30 JSR $3026 ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
2bcb : 18 __ __ CLC
2bcc : a5 23 __ LDA SP + 0 
2bce : 69 04 __ ADC #$04
2bd0 : 85 23 __ STA SP + 0 
2bd2 : 90 02 __ BCC $2bd6 ; (vdc_init.s1001 + 11)
2bd4 : e6 24 __ INC SP + 1 
2bd6 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2bd7 : a9 1c __ LDA #$1c
2bd9 : 8d 00 d6 STA $d600 
.l335:
2bdc : 2c 00 d6 BIT $d600 
2bdf : 10 fb __ BPL $2bdc ; (vdc_detect_mem_size.l335 + 0)
.s5:
2be1 : ad 01 d6 LDA $d601 
2be4 : a8 __ __ TAY
2be5 : 09 10 __ ORA #$10
2be7 : a2 1c __ LDX #$1c
2be9 : 8e 00 d6 STX $d600 
.l337:
2bec : 2c 00 d6 BIT $d600 
2bef : 10 fb __ BPL $2bec ; (vdc_detect_mem_size.l337 + 0)
.s12:
2bf1 : 8d 01 d6 STA $d601 
2bf4 : a9 12 __ LDA #$12
2bf6 : 8d 00 d6 STA $d600 
.l339:
2bf9 : 2c 00 d6 BIT $d600 
2bfc : 10 fb __ BPL $2bf9 ; (vdc_detect_mem_size.l339 + 0)
.s19:
2bfe : a9 1f __ LDA #$1f
2c00 : 8d 01 d6 STA $d601 
2c03 : a9 13 __ LDA #$13
2c05 : 8d 00 d6 STA $d600 
.l341:
2c08 : 2c 00 d6 BIT $d600 
2c0b : 10 fb __ BPL $2c08 ; (vdc_detect_mem_size.l341 + 0)
.s24:
2c0d : a9 ff __ LDA #$ff
2c0f : 8d 01 d6 STA $d601 
2c12 : a9 1f __ LDA #$1f
2c14 : 8d 00 d6 STA $d600 
.l343:
2c17 : 2c 00 d6 BIT $d600 
2c1a : 10 fb __ BPL $2c17 ; (vdc_detect_mem_size.l343 + 0)
.s28:
2c1c : a9 00 __ LDA #$00
2c1e : 8d 01 d6 STA $d601 
2c21 : a9 12 __ LDA #$12
2c23 : 8d 00 d6 STA $d600 
.l345:
2c26 : 2c 00 d6 BIT $d600 
2c29 : 10 fb __ BPL $2c26 ; (vdc_detect_mem_size.l345 + 0)
.s35:
2c2b : a9 9f __ LDA #$9f
2c2d : 8d 01 d6 STA $d601 
2c30 : a9 13 __ LDA #$13
2c32 : 8d 00 d6 STA $d600 
.l347:
2c35 : 2c 00 d6 BIT $d600 
2c38 : 10 fb __ BPL $2c35 ; (vdc_detect_mem_size.l347 + 0)
.s40:
2c3a : a9 ff __ LDA #$ff
2c3c : 8d 01 d6 STA $d601 
2c3f : a9 1f __ LDA #$1f
2c41 : 8d 00 d6 STA $d600 
.l349:
2c44 : 2c 00 d6 BIT $d600 
2c47 : 10 fb __ BPL $2c44 ; (vdc_detect_mem_size.l349 + 0)
.s44:
2c49 : a9 ff __ LDA #$ff
2c4b : 8d 01 d6 STA $d601 
2c4e : a9 12 __ LDA #$12
2c50 : 8d 00 d6 STA $d600 
.l351:
2c53 : 2c 00 d6 BIT $d600 
2c56 : 10 fb __ BPL $2c53 ; (vdc_detect_mem_size.l351 + 0)
.s51:
2c58 : a9 1f __ LDA #$1f
2c5a : 8d 01 d6 STA $d601 
2c5d : a9 13 __ LDA #$13
2c5f : 8d 00 d6 STA $d600 
.l353:
2c62 : 2c 00 d6 BIT $d600 
2c65 : 10 fb __ BPL $2c62 ; (vdc_detect_mem_size.l353 + 0)
.s56:
2c67 : a9 ff __ LDA #$ff
2c69 : 8d 01 d6 STA $d601 
2c6c : a9 1f __ LDA #$1f
2c6e : 8d 00 d6 STA $d600 
.l355:
2c71 : 2c 00 d6 BIT $d600 
2c74 : 10 fb __ BPL $2c71 ; (vdc_detect_mem_size.l355 + 0)
.s60:
2c76 : ad 01 d6 LDA $d601 
2c79 : f0 04 __ BEQ $2c7f ; (vdc_detect_mem_size.s1026 + 0)
.s1027:
2c7b : a9 10 __ LDA #$10
2c7d : d0 02 __ BNE $2c81 ; (vdc_detect_mem_size.s1028 + 0)
.s1026:
2c7f : a9 40 __ LDA #$40
.s1028:
2c81 : 8d 8f 87 STA $878f ; (vdc_state + 0)
2c84 : 8e 00 d6 STX $d600 
.l358:
2c87 : 2c 00 d6 BIT $d600 
2c8a : 10 fb __ BPL $2c87 ; (vdc_detect_mem_size.l358 + 0)
.s67:
2c8c : 8c 01 d6 STY $d601 
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2c8f : a9 00 __ LDA #$00
2c91 : 85 0f __ STA P2 
2c93 : 85 14 __ STA P7 
2c95 : ad 92 87 LDA $8792 ; (vdc_state + 3)
2c98 : 85 13 __ STA P6 
2c9a : ad 94 87 LDA $8794 ; (vdc_state + 5)
2c9d : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
2c9f : a9 20 __ LDA #$20
2ca1 : 85 11 __ STA P4 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2ca3 : 18 __ __ CLC
2ca4 : a5 14 __ LDA P7 ; (y + 0)
2ca6 : 65 15 __ ADC P8 ; (lines + 0)
2ca8 : 85 46 __ STA T1 + 0 
2caa : a9 00 __ LDA #$00
2cac : 2a __ __ ROL
2cad : 85 47 __ STA T1 + 1 
.l1:
2caf : f0 05 __ BEQ $2cb6 ; (vdc_clear.s1002 + 0)
.s1004:
2cb1 : a5 14 __ LDA P7 ; (y + 0)
2cb3 : 4c bc 2c JMP $2cbc ; (vdc_clear.s2 + 0)
.s1002:
2cb6 : a5 14 __ LDA P7 ; (y + 0)
2cb8 : c5 46 __ CMP T1 + 0 
2cba : b0 0c __ BCS $2cc8 ; (vdc_clear.s1001 + 0)
.s2:
2cbc : 85 10 __ STA P3 
2cbe : 20 c9 2c JSR $2cc9 ; (vdc_hchar@proxy + 0)
2cc1 : e6 14 __ INC P7 ; (y + 0)
2cc3 : a5 47 __ LDA T1 + 1 
2cc5 : 4c af 2c JMP $2caf ; (vdc_clear.l1 + 0)
.s1001:
2cc8 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
2cc9 : ad 96 87 LDA $8796 ; (vdc_state + 7)
2ccc : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
2cce : a5 10 __ LDA P3 ; (y + 0)
2cd0 : 0a __ __ ASL
2cd1 : aa __ __ TAX
2cd2 : bd 00 88 LDA $8800,x ; (multab + 0)
2cd5 : 18 __ __ CLC
2cd6 : 65 0f __ ADC P2 ; (x + 0)
2cd8 : 85 43 __ STA T1 + 0 
2cda : bd 01 88 LDA $8801,x ; (multab + 1)
2cdd : 69 00 __ ADC #$00
2cdf : 85 44 __ STA T1 + 1 
2ce1 : ad 97 87 LDA $8797 ; (vdc_state + 8)
2ce4 : 18 __ __ CLC
2ce5 : 65 43 __ ADC T1 + 0 
2ce7 : 85 0d __ STA P0 
2ce9 : ad 98 87 LDA $8798 ; (vdc_state + 9)
2cec : 65 44 __ ADC T1 + 1 
2cee : 85 0e __ STA P1 
2cf0 : 20 7d 2d JSR $2d7d ; (vdc_mem_addr.s0 + 0)
2cf3 : a6 13 __ LDX P6 ; (length + 0)
2cf5 : ca __ __ DEX
2cf6 : 86 45 __ STX T2 + 0 
.l221:
2cf8 : 2c 00 d6 BIT $d600 
2cfb : 10 fb __ BPL $2cf8 ; (vdc_hchar.l221 + 0)
.s6:
2cfd : a5 11 __ LDA P4 ; (val + 0)
2cff : 8d 01 d6 STA $d601 
2d02 : a9 18 __ LDA #$18
2d04 : 8d 00 d6 STA $d600 
.l223:
2d07 : 2c 00 d6 BIT $d600 
2d0a : 10 fb __ BPL $2d07 ; (vdc_hchar.l223 + 0)
.s12:
2d0c : ad 01 d6 LDA $d601 
2d0f : 29 7f __ AND #$7f
2d11 : a2 18 __ LDX #$18
2d13 : 8e 00 d6 STX $d600 
.l225:
2d16 : 2c 00 d6 BIT $d600 
2d19 : 10 fb __ BPL $2d16 ; (vdc_hchar.l225 + 0)
.s18:
2d1b : 8d 01 d6 STA $d601 
2d1e : a9 1e __ LDA #$1e
2d20 : 8d 00 d6 STA $d600 
.l227:
2d23 : 2c 00 d6 BIT $d600 
2d26 : 10 fb __ BPL $2d23 ; (vdc_hchar.l227 + 0)
.s23:
2d28 : a5 45 __ LDA T2 + 0 
2d2a : 8d 01 d6 STA $d601 
2d2d : ad 99 87 LDA $8799 ; (vdc_state + 10)
2d30 : 18 __ __ CLC
2d31 : 65 43 __ ADC T1 + 0 
2d33 : 85 0d __ STA P0 
2d35 : ad 9a 87 LDA $879a ; (vdc_state + 11)
2d38 : 65 44 __ ADC T1 + 1 
2d3a : 85 0e __ STA P1 
2d3c : 20 7d 2d JSR $2d7d ; (vdc_mem_addr.s0 + 0)
.l229:
2d3f : 2c 00 d6 BIT $d600 
2d42 : 10 fb __ BPL $2d3f ; (vdc_hchar.l229 + 0)
.s27:
2d44 : a5 12 __ LDA P5 ; (attr + 0)
2d46 : 8d 01 d6 STA $d601 
2d49 : a9 18 __ LDA #$18
2d4b : 8d 00 d6 STA $d600 
.l231:
2d4e : 2c 00 d6 BIT $d600 
2d51 : 10 fb __ BPL $2d4e ; (vdc_hchar.l231 + 0)
.s33:
2d53 : ad 01 d6 LDA $d601 
2d56 : 29 7f __ AND #$7f
2d58 : a2 18 __ LDX #$18
2d5a : 8e 00 d6 STX $d600 
.l233:
2d5d : 2c 00 d6 BIT $d600 
2d60 : 10 fb __ BPL $2d5d ; (vdc_hchar.l233 + 0)
.s39:
2d62 : 8d 01 d6 STA $d601 
2d65 : a9 1e __ LDA #$1e
2d67 : 8d 00 d6 STA $d600 
.l235:
2d6a : 2c 00 d6 BIT $d600 
2d6d : 10 fb __ BPL $2d6a ; (vdc_hchar.l235 + 0)
.s44:
2d6f : a5 45 __ LDA T2 + 0 
2d71 : 8d 01 d6 STA $d601 
.s1001:
2d74 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2d75 : a5 0f __ LDA P2 
2d77 : 85 0d __ STA P0 
2d79 : a5 10 __ LDA P3 
2d7b : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2d7d : a9 12 __ LDA #$12
2d7f : 8d 00 d6 STA $d600 
.l56:
2d82 : 2c 00 d6 BIT $d600 
2d85 : 10 fb __ BPL $2d82 ; (vdc_mem_addr.l56 + 0)
.s5:
2d87 : a5 0e __ LDA P1 ; (addr + 1)
2d89 : 8d 01 d6 STA $d601 
2d8c : a9 13 __ LDA #$13
2d8e : 8d 00 d6 STA $d600 
.l58:
2d91 : 2c 00 d6 BIT $d600 
2d94 : 10 fb __ BPL $2d91 ; (vdc_mem_addr.l58 + 0)
.s10:
2d96 : a5 0d __ LDA P0 ; (addr + 0)
2d98 : 8d 01 d6 STA $d601 
2d9b : a9 1f __ LDA #$1f
2d9d : 8d 00 d6 STA $d600 
.s1001:
2da0 : 60 __ __ RTS
--------------------------------------------------------------------
2da1 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2db1 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2dc1 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->u8
.s0:
2dcc : 20 d8 2d JSR $2dd8 ; (getpch + 0)
2dcf : c9 00 __ CMP #$00
2dd1 : f0 f9 __ BEQ $2dcc ; (getch.s0 + 0)
2dd3 : 85 1b __ STA ACCU + 0 
.s1001:
2dd5 : a5 1b __ LDA ACCU + 0 
2dd7 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2dd8 : 20 e4 ff JSR $ffe4 
2ddb : ae ff 51 LDX $51ff ; (giocharmap + 0)
2dde : e0 01 __ CPX #$01
2de0 : 90 26 __ BCC $2e08 ; (getpch + 48)
2de2 : c9 0d __ CMP #$0d
2de4 : d0 02 __ BNE $2de8 ; (getpch + 16)
2de6 : a9 0a __ LDA #$0a
2de8 : e0 02 __ CPX #$02
2dea : 90 1c __ BCC $2e08 ; (getpch + 48)
2dec : c9 db __ CMP #$db
2dee : b0 18 __ BCS $2e08 ; (getpch + 48)
2df0 : c9 41 __ CMP #$41
2df2 : 90 14 __ BCC $2e08 ; (getpch + 48)
2df4 : c9 c1 __ CMP #$c1
2df6 : 90 02 __ BCC $2dfa ; (getpch + 34)
2df8 : 49 a0 __ EOR #$a0
2dfa : c9 7b __ CMP #$7b
2dfc : b0 0a __ BCS $2e08 ; (getpch + 48)
2dfe : c9 61 __ CMP #$61
2e00 : b0 04 __ BCS $2e06 ; (getpch + 46)
2e02 : c9 5b __ CMP #$5b
2e04 : b0 02 __ BCS $2e08 ; (getpch + 48)
2e06 : 49 20 __ EOR #$20
2e08 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2e09 : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2e0c : 24 d7 __ BIT $d7 
2e0e : 10 01 __ BPL $2e11 ; (screen_setmode.s6 + 0)
.s1001:
2e10 : 60 __ __ RTS
.s6:
2e11 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2e14 : 09 00 __ ORA #$00
2e16 : d0 0d __ BNE $2e25 ; (fastmode.s1 + 0)
.s2:
2e18 : 8d 30 d0 STA $d030 
2e1b : ad 11 d0 LDA $d011 
2e1e : 29 7f __ AND #$7f
2e20 : 09 10 __ ORA #$10
2e22 : 4c 2f 2e JMP $2e2f ; (fastmode.s3 + 0)
.s1:
2e25 : a9 01 __ LDA #$01
2e27 : 8d 30 d0 STA $d030 
2e2a : ad 11 d0 LDA $d011 
2e2d : 29 6f __ AND #$6f
.s3:
2e2f : 8d 11 d0 STA $d011 
.s1001:
2e32 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2e33 : a9 00 __ LDA #$00
2e35 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2e37 : a4 16 __ LDY P9 ; (mode + 0)
2e39 : be f9 7b LDX $7bf9,y ; (__multab36L + 0)
2e3c : 86 49 __ STX T1 + 0 
2e3e : 86 4b __ STX T2 + 0 
2e40 : bd 04 83 LDA $8304,x ; (vdc_modes + 4)
2e43 : f0 08 __ BEQ $2e4d ; (vdc_set_mode.s3 + 0)
.s4:
2e45 : ad 8f 87 LDA $878f ; (vdc_state + 0)
2e48 : c9 10 __ CMP #$10
2e4a : d0 01 __ BNE $2e4d ; (vdc_set_mode.s3 + 0)
2e4c : 60 __ __ RTS
.s3:
2e4d : 8c 91 87 STY $8791 ; (vdc_state + 2)
2e50 : a9 8d __ LDA #$8d
2e52 : 8d 96 87 STA $8796 ; (vdc_state + 7)
2e55 : a9 00 __ LDA #$00
2e57 : 8d a5 87 STA $87a5 ; (vdc_state + 22)
2e5a : 8d a6 87 STA $87a6 ; (vdc_state + 23)
2e5d : 8d a7 87 STA $87a7 ; (vdc_state + 24)
2e60 : bd 00 83 LDA $8300,x ; (vdc_modes + 0)
2e63 : 8d 92 87 STA $8792 ; (vdc_state + 3)
2e66 : bd 01 83 LDA $8301,x ; (vdc_modes + 1)
2e69 : 8d 93 87 STA $8793 ; (vdc_state + 4)
2e6c : bd 02 83 LDA $8302,x ; (vdc_modes + 2)
2e6f : 8d 94 87 STA $8794 ; (vdc_state + 5)
2e72 : bd 03 83 LDA $8303,x ; (vdc_modes + 3)
2e75 : 8d 95 87 STA $8795 ; (vdc_state + 6)
2e78 : bd 09 83 LDA $8309,x ; (vdc_modes + 9)
2e7b : 8d 9b 87 STA $879b ; (vdc_state + 12)
2e7e : bd 0a 83 LDA $830a,x ; (vdc_modes + 10)
2e81 : 8d 9c 87 STA $879c ; (vdc_state + 13)
2e84 : bd 0b 83 LDA $830b,x ; (vdc_modes + 11)
2e87 : 8d 9d 87 STA $879d ; (vdc_state + 14)
2e8a : bd 0c 83 LDA $830c,x ; (vdc_modes + 12)
2e8d : 8d 9e 87 STA $879e ; (vdc_state + 15)
2e90 : bd 0d 83 LDA $830d,x ; (vdc_modes + 13)
2e93 : 8d 9f 87 STA $879f ; (vdc_state + 16)
2e96 : bd 0e 83 LDA $830e,x ; (vdc_modes + 14)
2e99 : 8d a0 87 STA $87a0 ; (vdc_state + 17)
2e9c : bd 0f 83 LDA $830f,x ; (vdc_modes + 15)
2e9f : 8d a1 87 STA $87a1 ; (vdc_state + 18)
2ea2 : bd 10 83 LDA $8310,x ; (vdc_modes + 16)
2ea5 : 8d a2 87 STA $87a2 ; (vdc_state + 19)
2ea8 : bd 11 83 LDA $8311,x ; (vdc_modes + 17)
2eab : 8d a3 87 STA $87a3 ; (vdc_state + 20)
2eae : bd 12 83 LDA $8312,x ; (vdc_modes + 18)
2eb1 : 8d a4 87 STA $87a4 ; (vdc_state + 21)
2eb4 : bd 05 83 LDA $8305,x ; (vdc_modes + 5)
2eb7 : 85 4c __ STA T3 + 0 
2eb9 : 8d 97 87 STA $8797 ; (vdc_state + 8)
2ebc : bd 06 83 LDA $8306,x ; (vdc_modes + 6)
2ebf : 85 4d __ STA T3 + 1 
2ec1 : 8d 98 87 STA $8798 ; (vdc_state + 9)
2ec4 : bd 07 83 LDA $8307,x ; (vdc_modes + 7)
2ec7 : 85 4e __ STA T5 + 0 
2ec9 : 8d 99 87 STA $8799 ; (vdc_state + 10)
2ecc : bd 08 83 LDA $8308,x ; (vdc_modes + 8)
2ecf : 85 4f __ STA T5 + 1 
2ed1 : 8d 9a 87 STA $879a ; (vdc_state + 11)
2ed4 : 20 ac 2f JSR $2fac ; (vdc_set_multab.s0 + 0)
2ed7 : a9 22 __ LDA #$22
2ed9 : 8d 00 d6 STA $d600 
.l295:
2edc : 2c 00 d6 BIT $d600 
2edf : 10 fb __ BPL $2edc ; (vdc_set_mode.l295 + 0)
.s11:
2ee1 : a9 80 __ LDA #$80
2ee3 : 8d 01 d6 STA $d601 
2ee6 : a9 0c __ LDA #$0c
2ee8 : 8d 00 d6 STA $d600 
.l297:
2eeb : 2c 00 d6 BIT $d600 
2eee : 10 fb __ BPL $2eeb ; (vdc_set_mode.l297 + 0)
.s17:
2ef0 : a5 4d __ LDA T3 + 1 
2ef2 : 8d 01 d6 STA $d601 
2ef5 : a9 0d __ LDA #$0d
2ef7 : 8d 00 d6 STA $d600 
.l299:
2efa : 2c 00 d6 BIT $d600 
2efd : 10 fb __ BPL $2efa ; (vdc_set_mode.l299 + 0)
.s22:
2eff : a5 4c __ LDA T3 + 0 
2f01 : 8d 01 d6 STA $d601 
2f04 : a9 14 __ LDA #$14
2f06 : 8d 00 d6 STA $d600 
.l301:
2f09 : 2c 00 d6 BIT $d600 
2f0c : 10 fb __ BPL $2f09 ; (vdc_set_mode.l301 + 0)
.s27:
2f0e : a5 4f __ LDA T5 + 1 
2f10 : 8d 01 d6 STA $d601 
2f13 : a9 15 __ LDA #$15
2f15 : 8d 00 d6 STA $d600 
.l303:
2f18 : 2c 00 d6 BIT $d600 
2f1b : 10 fb __ BPL $2f18 ; (vdc_set_mode.l303 + 0)
.s32:
2f1d : a5 4e __ LDA T5 + 0 
2f1f : 8d 01 d6 STA $d601 
2f22 : a6 49 __ LDX T1 + 0 
2f24 : bd 0e 83 LDA $830e,x ; (vdc_modes + 14)
2f27 : a2 1c __ LDX #$1c
2f29 : 8e 00 d6 STX $d600 
.l305:
2f2c : 2c 00 d6 BIT $d600 
2f2f : 10 fb __ BPL $2f2c ; (vdc_set_mode.l305 + 0)
.s39:
2f31 : aa __ __ TAX
2f32 : ad 01 d6 LDA $d601 
2f35 : 29 10 __ AND #$10
2f37 : 85 4e __ STA T5 + 0 
2f39 : a9 1c __ LDA #$1c
2f3b : 8d 00 d6 STA $d600 
2f3e : 8a __ __ TXA
2f3f : 29 e0 __ AND #$e0
2f41 : 05 4e __ ORA T5 + 0 
.l307:
2f43 : 2c 00 d6 BIT $d600 
2f46 : 10 fb __ BPL $2f43 ; (vdc_set_mode.l307 + 0)
.s45:
2f48 : 8d 01 d6 STA $d601 
2f4b : 20 07 30 JSR $3007 ; (vdc_restore_charsets.s0 + 0)
2f4e : 18 __ __ CLC
2f4f : a9 13 __ LDA #$13
2f51 : 65 49 __ ADC T1 + 0 
2f53 : 85 49 __ STA T1 + 0 
2f55 : a9 83 __ LDA #$83
2f57 : 69 00 __ ADC #$00
2f59 : 85 4a __ STA T1 + 1 
2f5b : 18 __ __ CLC
2f5c : a5 4b __ LDA T2 + 0 
2f5e : 69 13 __ ADC #$13
2f60 : 85 4c __ STA T3 + 0 
2f62 : a9 00 __ LDA #$00
2f64 : 85 43 __ STA T0 + 0 
2f66 : 69 83 __ ADC #$83
2f68 : 85 4d __ STA T3 + 1 
.l46:
2f6a : a4 43 __ LDY T0 + 0 
2f6c : b1 49 __ LDA (T1 + 0),y 
2f6e : 85 47 __ STA T7 + 0 
2f70 : c8 __ __ INY
2f71 : b1 49 __ LDA (T1 + 0),y 
2f73 : aa __ __ TAX
2f74 : a5 47 __ LDA T7 + 0 
2f76 : 8d 00 d6 STA $d600 
2f79 : c8 __ __ INY
2f7a : 84 43 __ STY T0 + 0 
.l309:
2f7c : 2c 00 d6 BIT $d600 
2f7f : 10 fb __ BPL $2f7c ; (vdc_set_mode.l309 + 0)
.s52:
2f81 : 8e 01 d6 STX $d601 
2f84 : b1 4c __ LDA (T3 + 0),y 
2f86 : c9 ff __ CMP #$ff
2f88 : d0 e0 __ BNE $2f6a ; (vdc_set_mode.l46 + 0)
.s47:
2f8a : a6 4b __ LDX T2 + 0 
2f8c : bd 04 83 LDA $8304,x ; (vdc_modes + 4)
2f8f : f0 08 __ BEQ $2f99 ; (vdc_set_mode.s55 + 0)
.s56:
2f91 : ad 90 87 LDA $8790 ; (vdc_state + 1)
2f94 : d0 03 __ BNE $2f99 ; (vdc_set_mode.s55 + 0)
.s53:
2f96 : 20 26 30 JSR $3026 ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2f99 : 20 8f 2c JSR $2c8f ; (vdc_cls.s0 + 0)
2f9c : a9 22 __ LDA #$22
2f9e : 8d 00 d6 STA $d600 
.l314:
2fa1 : 2c 00 d6 BIT $d600 
2fa4 : 10 fb __ BPL $2fa1 ; (vdc_set_mode.l314 + 0)
.s62:
2fa6 : a9 7d __ LDA #$7d
2fa8 : 8d 01 d6 STA $d601 
.s1001:
2fab : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2fac : ad 95 87 LDA $8795 ; (vdc_state + 6)
2faf : 85 1c __ STA ACCU + 1 
2fb1 : ad 94 87 LDA $8794 ; (vdc_state + 5)
2fb4 : 85 1b __ STA ACCU + 0 
2fb6 : 05 1c __ ORA ACCU + 1 
2fb8 : f0 4c __ BEQ $3006 ; (vdc_set_multab.s1001 + 0)
.s5:
2fba : ad 92 87 LDA $8792 ; (vdc_state + 3)
2fbd : 18 __ __ CLC
2fbe : 6d a7 87 ADC $87a7 ; (vdc_state + 24)
2fc1 : 85 43 __ STA T2 + 0 
2fc3 : ad 93 87 LDA $8793 ; (vdc_state + 4)
2fc6 : 69 00 __ ADC #$00
2fc8 : 85 44 __ STA T2 + 1 
2fca : a9 00 __ LDA #$00
2fcc : 85 45 __ STA T3 + 0 
2fce : 85 46 __ STA T3 + 1 
2fd0 : a9 00 __ LDA #$00
2fd2 : 85 47 __ STA T4 + 0 
2fd4 : a9 88 __ LDA #$88
2fd6 : 85 48 __ STA T4 + 1 
2fd8 : a2 00 __ LDX #$00
.l2:
2fda : a5 45 __ LDA T3 + 0 
2fdc : a0 00 __ LDY #$00
2fde : 91 47 __ STA (T4 + 0),y 
2fe0 : a5 46 __ LDA T3 + 1 
2fe2 : c8 __ __ INY
2fe3 : 91 47 __ STA (T4 + 0),y 
2fe5 : 18 __ __ CLC
2fe6 : a5 43 __ LDA T2 + 0 
2fe8 : 65 45 __ ADC T3 + 0 
2fea : 85 45 __ STA T3 + 0 
2fec : a5 44 __ LDA T2 + 1 
2fee : 65 46 __ ADC T3 + 1 
2ff0 : 85 46 __ STA T3 + 1 
2ff2 : 18 __ __ CLC
2ff3 : a5 47 __ LDA T4 + 0 
2ff5 : 69 02 __ ADC #$02
2ff7 : 85 47 __ STA T4 + 0 
2ff9 : 90 02 __ BCC $2ffd ; (vdc_set_multab.s1006 + 0)
.s1005:
2ffb : e6 48 __ INC T4 + 1 
.s1006:
2ffd : e8 __ __ INX
2ffe : a5 1c __ LDA ACCU + 1 
3000 : d0 d8 __ BNE $2fda ; (vdc_set_multab.l2 + 0)
.s1002:
3002 : e4 1b __ CPX ACCU + 0 
3004 : 90 d4 __ BCC $2fda ; (vdc_set_multab.l2 + 0)
.s1001:
3006 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
3007 : a9 01 __ LDA #$01
3009 : 85 11 __ STA P4 
300b : a9 02 __ LDA #$02
300d : 85 15 __ STA P8 
300f : ad 9f 87 LDA $879f ; (vdc_state + 16)
3012 : 85 0f __ STA P2 
3014 : ad a0 87 LDA $87a0 ; (vdc_state + 17)
3017 : 85 10 __ STA P3 
3019 : a9 00 __ LDA #$00
301b : 85 14 __ STA P7 
301d : 85 12 __ STA P5 
301f : a9 d0 __ LDA #$d0
3021 : 85 13 __ STA P6 
3023 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
3026 : ad 8f 87 LDA $878f ; (vdc_state + 0)
3029 : c9 10 __ CMP #$10
302b : f0 4d __ BEQ $307a ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
302d : ad 90 87 LDA $8790 ; (vdc_state + 1)
3030 : d0 48 __ BNE $307a ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
3032 : a9 22 __ LDA #$22
3034 : 8d 00 d6 STA $d600 
.l120:
3037 : 2c 00 d6 BIT $d600 
303a : 10 fb __ BPL $3037 ; (vdc_set_extended_memsize.l120 + 0)
.s11:
303c : a9 80 __ LDA #$80
303e : 8d 01 d6 STA $d601 
3041 : 20 7b 30 JSR $307b ; (vdc_wipe_mem.s0 + 0)
3044 : a9 1c __ LDA #$1c
3046 : 8d 00 d6 STA $d600 
.l122:
3049 : 2c 00 d6 BIT $d600 
304c : 10 fb __ BPL $3049 ; (vdc_set_extended_memsize.l122 + 0)
.s17:
304e : ad 01 d6 LDA $d601 
3051 : 09 10 __ ORA #$10
3053 : a2 1c __ LDX #$1c
3055 : 8e 00 d6 STX $d600 
.l124:
3058 : 2c 00 d6 BIT $d600 
305b : 10 fb __ BPL $3058 ; (vdc_set_extended_memsize.l124 + 0)
.s23:
305d : 8d 01 d6 STA $d601 
3060 : 20 07 30 JSR $3007 ; (vdc_restore_charsets.s0 + 0)
3063 : 20 8f 2c JSR $2c8f ; (vdc_cls.s0 + 0)
3066 : a9 22 __ LDA #$22
3068 : 8d 00 d6 STA $d600 
.l126:
306b : 2c 00 d6 BIT $d600 
306e : 10 fb __ BPL $306b ; (vdc_set_extended_memsize.l126 + 0)
.s29:
3070 : a9 7d __ LDA #$7d
3072 : 8d 01 d6 STA $d601 
3075 : a9 01 __ LDA #$01
3077 : 8d 90 87 STA $8790 ; (vdc_state + 1)
.s1001:
307a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
307b : a9 00 __ LDA #$00
307d : 85 44 __ STA T0 + 1 
307f : 85 0d __ STA P0 
3081 : a9 ff __ LDA #$ff
3083 : 85 45 __ STA T1 + 0 
.l2:
3085 : 20 e1 81 JSR $81e1 ; (vdc_mem_addr@proxy + 0)
.l252:
3088 : 2c 00 d6 BIT $d600 
308b : 10 fb __ BPL $3088 ; (vdc_wipe_mem.l252 + 0)
.s8:
308d : a9 00 __ LDA #$00
308f : 8d 01 d6 STA $d601 
3092 : a9 18 __ LDA #$18
3094 : 8d 00 d6 STA $d600 
.l254:
3097 : 2c 00 d6 BIT $d600 
309a : 10 fb __ BPL $3097 ; (vdc_wipe_mem.l254 + 0)
.s14:
309c : ad 01 d6 LDA $d601 
309f : 29 7f __ AND #$7f
30a1 : a2 18 __ LDX #$18
30a3 : 8e 00 d6 STX $d600 
.l256:
30a6 : 2c 00 d6 BIT $d600 
30a9 : 10 fb __ BPL $30a6 ; (vdc_wipe_mem.l256 + 0)
.s20:
30ab : 8d 01 d6 STA $d601 
30ae : a9 1e __ LDA #$1e
30b0 : 8d 00 d6 STA $d600 
.l258:
30b3 : 2c 00 d6 BIT $d600 
30b6 : 10 fb __ BPL $30b3 ; (vdc_wipe_mem.l258 + 0)
.s25:
30b8 : e6 44 __ INC T0 + 1 
30ba : a9 ff __ LDA #$ff
30bc : 8d 01 d6 STA $d601 
30bf : c6 45 __ DEC T1 + 0 
30c1 : d0 c2 __ BNE $3085 ; (vdc_wipe_mem.l2 + 0)
.s4:
30c3 : 20 e1 81 JSR $81e1 ; (vdc_mem_addr@proxy + 0)
.l261:
30c6 : 2c 00 d6 BIT $d600 
30c9 : 10 fb __ BPL $30c6 ; (vdc_wipe_mem.l261 + 0)
.s29:
30cb : a9 00 __ LDA #$00
30cd : 8d 01 d6 STA $d601 
30d0 : a9 18 __ LDA #$18
30d2 : 8d 00 d6 STA $d600 
.l263:
30d5 : 2c 00 d6 BIT $d600 
30d8 : 10 fb __ BPL $30d5 ; (vdc_wipe_mem.l263 + 0)
.s35:
30da : ad 01 d6 LDA $d601 
30dd : 29 7f __ AND #$7f
30df : a2 18 __ LDX #$18
30e1 : 8e 00 d6 STX $d600 
.l265:
30e4 : 2c 00 d6 BIT $d600 
30e7 : 10 fb __ BPL $30e4 ; (vdc_wipe_mem.l265 + 0)
.s41:
30e9 : 8d 01 d6 STA $d601 
30ec : a9 1e __ LDA #$1e
30ee : 8d 00 d6 STA $d600 
.l267:
30f1 : 2c 00 d6 BIT $d600 
30f4 : 10 fb __ BPL $30f1 ; (vdc_wipe_mem.l267 + 0)
.s46:
30f6 : a9 ff __ LDA #$ff
30f8 : 8d 01 d6 STA $d601 
.s1001:
30fb : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
30fc : a9 d8 __ LDA #$d8
30fe : 85 0d __ STA P0 
3100 : a9 ab __ LDA #$ab
3102 : 85 0e __ STA P1 
3104 : ad b3 87 LDA $87b3 ; (canvas + 11)
3107 : 85 0f __ STA P2 
3109 : ad b4 87 LDA $87b4 ; (canvas + 12)
310c : 85 10 __ STA P3 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
310e : a9 00 __ LDA #$00
3110 : a0 04 __ LDY #$04
3112 : 91 0d __ STA (P0),y ; (win + 0)
3114 : c8 __ __ INY
3115 : 91 0d __ STA (P0),y ; (win + 0)
3117 : a5 0f __ LDA P2 ; (sx + 0)
3119 : a0 00 __ LDY #$00
311b : 91 0d __ STA (P0),y ; (win + 0)
311d : a5 10 __ LDA P3 ; (sy + 0)
311f : c8 __ __ INY
3120 : 91 0d __ STA (P0),y ; (win + 0)
3122 : a5 11 __ LDA P4 ; (wx + 0)
3124 : c8 __ __ INY
3125 : 91 0d __ STA (P0),y ; (win + 0)
3127 : a5 12 __ LDA P5 ; (wy + 0)
3129 : c8 __ __ INY
312a : 91 0d __ STA (P0),y ; (win + 0)
312c : 06 10 __ ASL P3 ; (sy + 0)
312e : a6 10 __ LDX P3 ; (sy + 0)
3130 : bd 00 88 LDA $8800,x ; (multab + 0)
3133 : 18 __ __ CLC
3134 : 65 0f __ ADC P2 ; (sx + 0)
3136 : 85 1b __ STA ACCU + 0 
3138 : bd 01 88 LDA $8801,x ; (multab + 1)
313b : 69 00 __ ADC #$00
313d : a8 __ __ TAY
313e : ad 97 87 LDA $8797 ; (vdc_state + 8)
3141 : 18 __ __ CLC
3142 : 65 1b __ ADC ACCU + 0 
3144 : 85 1b __ STA ACCU + 0 
3146 : 98 __ __ TYA
3147 : 6d 98 87 ADC $8798 ; (vdc_state + 9)
314a : a0 07 __ LDY #$07
314c : 91 0d __ STA (P0),y ; (win + 0)
314e : a5 1b __ LDA ACCU + 0 
3150 : 88 __ __ DEY
3151 : 91 0d __ STA (P0),y ; (win + 0)
3153 : bd 00 88 LDA $8800,x ; (multab + 0)
3156 : 18 __ __ CLC
3157 : 65 0f __ ADC P2 ; (sx + 0)
3159 : 85 1b __ STA ACCU + 0 
315b : bd 01 88 LDA $8801,x ; (multab + 1)
315e : 69 00 __ ADC #$00
3160 : aa __ __ TAX
3161 : ad 99 87 LDA $8799 ; (vdc_state + 10)
3164 : 18 __ __ CLC
3165 : 65 1b __ ADC ACCU + 0 
3167 : 85 1b __ STA ACCU + 0 
3169 : 8a __ __ TXA
316a : 6d 9a 87 ADC $879a ; (vdc_state + 11)
316d : a0 09 __ LDY #$09
316f : 91 0d __ STA (P0),y ; (win + 0)
3171 : a5 1b __ LDA ACCU + 0 
3173 : 88 __ __ DEY
3174 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
3176 : 60 __ __ RTS
--------------------------------------------------------------------
updatecanvas: ; updatecanvas()->void
.s1000:
3177 : 38 __ __ SEC
3178 : a5 23 __ LDA SP + 0 
317a : e9 08 __ SBC #$08
317c : 85 23 __ STA SP + 0 
317e : b0 02 __ BCS $3182 ; (updatecanvas.s0 + 0)
3180 : c6 24 __ DEC SP + 1 
.s0:
3182 : a9 d8 __ LDA #$d8
3184 : a0 02 __ LDY #$02
3186 : 91 23 __ STA (SP + 0),y 
3188 : a9 83 __ LDA #$83
318a : c8 __ __ INY
318b : 91 23 __ STA (SP + 0),y 
318d : a9 a7 __ LDA #$a7
318f : c8 __ __ INY
3190 : 91 23 __ STA (SP + 0),y 
3192 : a9 32 __ LDA #$32
3194 : c8 __ __ INY
3195 : 91 23 __ STA (SP + 0),y 
3197 : ad ab 87 LDA $87ab ; (canvas + 3)
319a : c8 __ __ INY
319b : 91 23 __ STA (SP + 0),y 
319d : ad ac 87 LDA $87ac ; (canvas + 4)
31a0 : c8 __ __ INY
31a1 : 91 23 __ STA (SP + 0),y 
31a3 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
31a6 : a9 e8 __ LDA #$e8
31a8 : a0 02 __ LDY #$02
31aa : 91 23 __ STA (SP + 0),y 
31ac : a9 83 __ LDA #$83
31ae : c8 __ __ INY
31af : 91 23 __ STA (SP + 0),y 
31b1 : a9 b5 __ LDA #$b5
31b3 : c8 __ __ INY
31b4 : 91 23 __ STA (SP + 0),y 
31b6 : a9 32 __ LDA #$32
31b8 : c8 __ __ INY
31b9 : 91 23 __ STA (SP + 0),y 
31bb : ad ad 87 LDA $87ad ; (canvas + 5)
31be : c8 __ __ INY
31bf : 91 23 __ STA (SP + 0),y 
31c1 : ad ae 87 LDA $87ae ; (canvas + 6)
31c4 : c8 __ __ INY
31c5 : 91 23 __ STA (SP + 0),y 
31c7 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
31ca : a9 f8 __ LDA #$f8
31cc : a0 02 __ LDY #$02
31ce : 91 23 __ STA (SP + 0),y 
31d0 : a9 83 __ LDA #$83
31d2 : c8 __ __ INY
31d3 : 91 23 __ STA (SP + 0),y 
31d5 : a9 c3 __ LDA #$c3
31d7 : c8 __ __ INY
31d8 : 91 23 __ STA (SP + 0),y 
31da : a9 32 __ LDA #$32
31dc : c8 __ __ INY
31dd : 91 23 __ STA (SP + 0),y 
31df : ad ef 86 LDA $86ef ; (screenbackground + 0)
31e2 : c8 __ __ INY
31e3 : 91 23 __ STA (SP + 0),y 
31e5 : a9 00 __ LDA #$00
31e7 : c8 __ __ INY
31e8 : 91 23 __ STA (SP + 0),y 
31ea : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
31ed : a9 08 __ LDA #$08
31ef : a0 02 __ LDY #$02
31f1 : 91 23 __ STA (SP + 0),y 
31f3 : a9 84 __ LDA #$84
31f5 : c8 __ __ INY
31f6 : 91 23 __ STA (SP + 0),y 
31f8 : a9 d4 __ LDA #$d4
31fa : c8 __ __ INY
31fb : 91 23 __ STA (SP + 0),y 
31fd : a9 32 __ LDA #$32
31ff : c8 __ __ INY
3200 : 91 23 __ STA (SP + 0),y 
3202 : ad 91 87 LDA $8791 ; (vdc_state + 2)
3205 : c8 __ __ INY
3206 : 91 23 __ STA (SP + 0),y 
3208 : a9 00 __ LDA #$00
320a : c8 __ __ INY
320b : 91 23 __ STA (SP + 0),y 
320d : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
3210 : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
3213 : 85 4e __ STA T1 + 0 
3215 : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
3218 : 18 __ __ CLC
3219 : 69 01 __ ADC #$01
321b : 85 12 __ STA P5 
321d : a9 7f __ LDA #$7f
321f : 8d a8 87 STA $87a8 ; (canvas + 0)
3222 : a9 00 __ LDA #$00
3224 : 8d af 87 STA $87af ; (canvas + 7)
3227 : 8d b0 87 STA $87b0 ; (canvas + 8)
322a : 8d b1 87 STA $87b1 ; (canvas + 9)
322d : 8d b2 87 STA $87b2 ; (canvas + 10)
3230 : 85 0f __ STA P2 
3232 : 85 10 __ STA P3 
3234 : 8d a9 87 STA $87a9 ; (canvas + 1)
3237 : a9 58 __ LDA #$58
3239 : 8d aa 87 STA $87aa ; (canvas + 2)
323c : a9 b3 __ LDA #$b3
323e : 85 0d __ STA P0 
3240 : a9 87 __ LDA #$87
3242 : 85 0e __ STA P1 
3244 : a6 4e __ LDX T1 + 0 
3246 : e8 __ __ INX
3247 : 86 11 __ STX P4 
3249 : 20 0e 31 JSR $310e ; (vdcwin_init.s0 + 0)
324c : ad ad 87 LDA $87ad ; (canvas + 5)
324f : 85 1b __ STA ACCU + 0 
3251 : ad ae 87 LDA $87ae ; (canvas + 6)
3254 : 85 1c __ STA ACCU + 1 
3256 : ad ab 87 LDA $87ab ; (canvas + 3)
3259 : 85 03 __ STA WORK + 0 
325b : ad ac 87 LDA $87ac ; (canvas + 4)
325e : 85 04 __ STA WORK + 1 
3260 : 20 62 7c JSR $7c62 ; (mul16 + 0)
3263 : a5 05 __ LDA WORK + 2 
3265 : 8d f7 86 STA $86f7 ; (screentotal + 0)
3268 : a5 06 __ LDA WORK + 3 
326a : 8d f8 86 STA $86f8 ; (screentotal + 1)
.s1001:
326d : 18 __ __ CLC
326e : a5 23 __ LDA SP + 0 
3270 : 69 08 __ ADC #$08
3272 : 85 23 __ STA SP + 0 
3274 : 90 02 __ BCC $3278 ; (updatecanvas.s1001 + 11)
3276 : e6 24 __ INC SP + 1 
3278 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
3279 : a9 00 __ LDA #$00
327b : 8d f7 ab STA $abf7 ; (sstack + 4)
327e : a0 02 __ LDY #$02
3280 : b1 23 __ LDA (SP + 0),y 
3282 : 85 16 __ STA P9 
3284 : c8 __ __ INY
3285 : b1 23 __ LDA (SP + 0),y 
3287 : 85 17 __ STA P10 
3289 : c8 __ __ INY
328a : b1 23 __ LDA (SP + 0),y 
328c : 8d f3 ab STA $abf3 ; (sstack + 0)
328f : c8 __ __ INY
3290 : b1 23 __ LDA (SP + 0),y 
3292 : 8d f4 ab STA $abf4 ; (sstack + 1)
3295 : 18 __ __ CLC
3296 : a5 23 __ LDA SP + 0 
3298 : 69 06 __ ADC #$06
329a : 8d f5 ab STA $abf5 ; (sstack + 2)
329d : a5 24 __ LDA SP + 1 
329f : 69 00 __ ADC #$00
32a1 : 8d f6 ab STA $abf6 ; (sstack + 3)
32a4 : 4c 1f 23 JMP $231f ; (sformat.s1000 + 0)
--------------------------------------------------------------------
32a7 : __ __ __ BYT 77 49 44 54 48 3a 20 20 20 25 35 55 20 00       : wIDTH:   %5U .
--------------------------------------------------------------------
32b5 : __ __ __ BYT 68 45 49 47 48 54 3a 20 20 25 35 55 20 00       : hEIGHT:  %5U .
--------------------------------------------------------------------
32c3 : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 3a 20 25 32 55 20 : bACKGROUND: %2U 
32d3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
32d4 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 3a 20 25 32 55 20 : sCREENMODE: %2U 
32e4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
getmaxx: ; getmaxx()->u8
.s0:
32e5 : ad ac 87 LDA $87ac ; (canvas + 4)
32e8 : cd 93 87 CMP $8793 ; (vdc_state + 4)
32eb : d0 06 __ BNE $32f3 ; (getmaxx.s1003 + 0)
.s1002:
32ed : ad ab 87 LDA $87ab ; (canvas + 3)
32f0 : cd 92 87 CMP $8792 ; (vdc_state + 3)
.s1003:
32f3 : b0 05 __ BCS $32fa ; (getmaxx.s2 + 0)
.s1:
32f5 : ad ab 87 LDA $87ab ; (canvas + 3)
32f8 : 90 03 __ BCC $32fd ; (getmaxx.s1001 + 0)
.s2:
32fa : ad 92 87 LDA $8792 ; (vdc_state + 3)
.s1001:
32fd : 38 __ __ SEC
32fe : e9 01 __ SBC #$01
3300 : 60 __ __ RTS
--------------------------------------------------------------------
getmaxy: ; getmaxy()->u8
.s0:
3301 : ad ae 87 LDA $87ae ; (canvas + 6)
3304 : cd 95 87 CMP $8795 ; (vdc_state + 6)
3307 : d0 06 __ BNE $330f ; (getmaxy.s1003 + 0)
.s1002:
3309 : ad ad 87 LDA $87ad ; (canvas + 5)
330c : cd 94 87 CMP $8794 ; (vdc_state + 5)
.s1003:
330f : b0 05 __ BCS $3316 ; (getmaxy.s2 + 0)
.s1:
3311 : ad ad 87 LDA $87ad ; (canvas + 5)
3314 : 90 03 __ BCC $3319 ; (getmaxy.s1001 + 0)
.s2:
3316 : ad 94 87 LDA $8794 ; (vdc_state + 5)
.s1001:
3319 : 38 __ __ SEC
331a : e9 01 __ SBC #$01
331c : 60 __ __ RTS
--------------------------------------------------------------------
331d : __ __ __ BYT 75 4e 44 4f 3a 20 65 4e 41 42 4c 45 44 20 20 00 : uNDO: eNABLED  .
--------------------------------------------------------------------
printcentered: ; printcentered(const u8*,u8,u8,u8)->void
.s0:
332d : a9 1d __ LDA #$1d
332f : 85 0f __ STA P2 
3331 : a9 16 __ LDA #$16
3333 : 85 13 __ STA P6 
3335 : a9 18 __ LDA #$18
3337 : 85 14 __ STA P7 
3339 : 20 0e 82 JSR $820e ; (vdc_clear@proxy + 0)
333c : a5 16 __ LDA P9 ; (text + 0)
333e : 85 0d __ STA P0 
3340 : a5 17 __ LDA P10 ; (text + 1)
3342 : 85 0e __ STA P1 
3344 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
3347 : a5 1c __ LDA ACCU + 1 
3349 : 30 0c __ BMI $3357 ; (printcentered.s1 + 0)
.s1003:
334b : d0 06 __ BNE $3353 ; (printcentered.s5 + 0)
.s1002:
334d : a5 1b __ LDA ACCU + 0 
334f : c9 16 __ CMP #$16
3351 : 90 04 __ BCC $3357 ; (printcentered.s1 + 0)
.s5:
3353 : a9 1d __ LDA #$1d
3355 : d0 1c __ BNE $3373 ; (printcentered.s1004 + 0)
.s1:
3357 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
335a : 38 __ __ SEC
335b : a9 16 __ LDA #$16
335d : e5 1b __ SBC ACCU + 0 
335f : aa __ __ TAX
3360 : a9 00 __ LDA #$00
3362 : e5 1c __ SBC ACCU + 1 
3364 : a8 __ __ TAY
3365 : 0a __ __ ASL
3366 : 8a __ __ TXA
3367 : 69 00 __ ADC #$00
3369 : aa __ __ TAX
336a : 98 __ __ TYA
336b : 69 00 __ ADC #$00
336d : 4a __ __ LSR
336e : 8a __ __ TXA
336f : 6a __ __ ROR
3370 : 18 __ __ CLC
3371 : 69 1c __ ADC #$1c
.s1004:
3373 : 85 11 __ STA P4 
3375 : a9 18 __ LDA #$18
3377 : 85 12 __ STA P5 
3379 : a5 16 __ LDA P9 ; (text + 0)
337b : 85 13 __ STA P6 
337d : a5 17 __ LDA P10 ; (text + 1)
337f : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
3381 : ad 96 87 LDA $8796 ; (vdc_state + 7)
3384 : 85 15 __ STA P8 
3386 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
3389 : a9 00 __ LDA #$00
338b : 85 1b __ STA ACCU + 0 
338d : 85 1c __ STA ACCU + 1 
338f : a8 __ __ TAY
3390 : b1 0d __ LDA (P0),y ; (str + 0)
3392 : f0 18 __ BEQ $33ac ; (strlen.s1001 + 0)
.s2:
3394 : a5 0d __ LDA P0 ; (str + 0)
3396 : 85 1b __ STA ACCU + 0 
3398 : a2 00 __ LDX #$00
.l1002:
339a : c8 __ __ INY
339b : d0 01 __ BNE $339e ; (strlen.s1005 + 0)
.s1004:
339d : e8 __ __ INX
.s1005:
339e : 8a __ __ TXA
339f : 18 __ __ CLC
33a0 : 65 0e __ ADC P1 ; (str + 1)
33a2 : 85 1c __ STA ACCU + 1 
33a4 : b1 1b __ LDA (ACCU + 0),y 
33a6 : d0 f2 __ BNE $339a ; (strlen.l1002 + 0)
.s1003:
33a8 : 86 1c __ STX ACCU + 1 
33aa : 84 1b __ STY ACCU + 0 
.s1001:
33ac : 60 __ __ RTS
--------------------------------------------------------------------
updateMenu: ; updateMenu()->void
.s0:
33ad : a9 37 __ LDA #$37
33af : 85 0f __ STA P2 
33b1 : a9 20 __ LDA #$20
33b3 : 85 11 __ STA P4 
33b5 : a9 0e __ LDA #$0e
33b7 : 85 13 __ STA P6 
33b9 : a9 04 __ LDA #$04
33bb : 85 14 __ STA P7 
33bd : a9 0a __ LDA #$0a
33bf : 85 15 __ STA P8 
33c1 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
33c4 : 85 49 __ STA T0 + 0 
33c6 : 8d 96 87 STA $8796 ; (vdc_state + 7)
33c9 : 20 a3 2c JSR $2ca3 ; (vdc_clear.s0 + 0)
33cc : a9 37 __ LDA #$37
33ce : 85 11 __ STA P4 
33d0 : a9 05 __ LDA #$05
33d2 : 85 12 __ STA P5 
33d4 : a5 49 __ LDA T0 + 0 
33d6 : 85 15 __ STA P8 
33d8 : a9 c5 __ LDA #$c5
33da : 85 13 __ STA P6 
33dc : a9 71 __ LDA #$71
33de : 85 14 __ STA P7 
33e0 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
33e3 : e6 12 __ INC P5 
33e5 : a9 d3 __ LDA #$d3
33e7 : 85 13 __ STA P6 
33e9 : a9 71 __ LDA #$71
33eb : 85 14 __ STA P7 
33ed : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
33f0 : e6 12 __ INC P5 
33f2 : a9 de __ LDA #$de
33f4 : 85 13 __ STA P6 
33f6 : a9 71 __ LDA #$71
33f8 : 85 14 __ STA P7 
33fa : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
33fd : e6 12 __ INC P5 
33ff : a9 e9 __ LDA #$e9
3401 : 85 13 __ STA P6 
3403 : a9 71 __ LDA #$71
3405 : 85 14 __ STA P7 
3407 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
340a : e6 12 __ INC P5 
340c : a9 f1 __ LDA #$f1
340e : 85 13 __ STA P6 
3410 : a9 71 __ LDA #$71
3412 : 85 14 __ STA P7 
3414 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
3417 : e6 12 __ INC P5 
3419 : a9 00 __ LDA #$00
341b : 85 13 __ STA P6 
341d : a9 72 __ LDA #$72
341f : 85 14 __ STA P7 
3421 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
3424 : e6 12 __ INC P5 
3426 : a9 0f __ LDA #$0f
3428 : 85 13 __ STA P6 
342a : a9 72 __ LDA #$72
342c : 85 14 __ STA P7 
342e : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
3431 : e6 12 __ INC P5 
3433 : a9 1c __ LDA #$1c
3435 : 85 13 __ STA P6 
3437 : a9 72 __ LDA #$72
3439 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
343b : a5 13 __ LDA P6 ; (string + 0)
343d : 85 0d __ STA P0 
343f : 85 43 __ STA T0 + 0 
3441 : a5 14 __ LDA P7 ; (string + 1)
3443 : 85 0e __ STA P1 
3445 : 85 44 __ STA T0 + 1 
3447 : a5 12 __ LDA P5 ; (y + 0)
3449 : 0a __ __ ASL
344a : aa __ __ TAX
344b : bd 00 88 LDA $8800,x ; (multab + 0)
344e : 85 46 __ STA T2 + 0 
3450 : bd 01 88 LDA $8801,x ; (multab + 1)
3453 : 85 47 __ STA T2 + 1 
3455 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
3458 : a5 1b __ LDA ACCU + 0 
345a : d0 01 __ BNE $345d ; (vdc_prints_attr.s5 + 0)
.s1001:
345c : 60 __ __ RTS
.s5:
345d : c9 01 __ CMP #$01
345f : d0 03 __ BNE $3464 ; (vdc_prints_attr.s9 + 0)
3461 : 4c e6 34 JMP $34e6 ; (vdc_prints_attr.s7 + 0)
.s9:
3464 : 85 48 __ STA T3 + 0 
3466 : 18 __ __ CLC
3467 : a5 11 __ LDA P4 ; (x + 0)
3469 : 65 46 __ ADC T2 + 0 
346b : 85 46 __ STA T2 + 0 
346d : 90 02 __ BCC $3471 ; (vdc_prints_attr.s1021 + 0)
.s1020:
346f : e6 47 __ INC T2 + 1 
.s1021:
3471 : 18 __ __ CLC
3472 : 6d 97 87 ADC $8797 ; (vdc_state + 8)
3475 : 85 0d __ STA P0 
3477 : ad 98 87 LDA $8798 ; (vdc_state + 9)
347a : 65 47 __ ADC T2 + 1 
347c : 85 0e __ STA P1 
347e : 20 7d 2d JSR $2d7d ; (vdc_mem_addr.s0 + 0)
3481 : a5 48 __ LDA T3 + 0 
3483 : f0 18 __ BEQ $349d ; (vdc_prints_attr.s14 + 0)
.s44:
3485 : a0 00 __ LDY #$00
.l12:
3487 : 84 45 __ STY T1 + 0 
3489 : b1 43 __ LDA (T0 + 0),y 
348b : 20 76 35 JSR $3576 ; (pet2screen.s0 + 0)
.l174:
348e : 2c 00 d6 BIT $d600 
3491 : 10 fb __ BPL $348e ; (vdc_prints_attr.l174 + 0)
.s17:
3493 : 8d 01 d6 STA $d601 
3496 : a4 45 __ LDY T1 + 0 
3498 : c8 __ __ INY
3499 : c4 48 __ CPY T3 + 0 
349b : 90 ea __ BCC $3487 ; (vdc_prints_attr.l12 + 0)
.s14:
349d : ad 99 87 LDA $8799 ; (vdc_state + 10)
34a0 : 18 __ __ CLC
34a1 : 65 46 __ ADC T2 + 0 
34a3 : 85 0d __ STA P0 
34a5 : ad 9a 87 LDA $879a ; (vdc_state + 11)
34a8 : 65 47 __ ADC T2 + 1 
34aa : 85 0e __ STA P1 
34ac : 20 7d 2d JSR $2d7d ; (vdc_mem_addr.s0 + 0)
34af : a6 48 __ LDX T3 + 0 
34b1 : ca __ __ DEX
.l177:
34b2 : 2c 00 d6 BIT $d600 
34b5 : 10 fb __ BPL $34b2 ; (vdc_prints_attr.l177 + 0)
.s21:
34b7 : a5 15 __ LDA P8 ; (attr + 0)
34b9 : 8d 01 d6 STA $d601 
34bc : a9 18 __ LDA #$18
34be : 8d 00 d6 STA $d600 
.l179:
34c1 : 2c 00 d6 BIT $d600 
34c4 : 10 fb __ BPL $34c1 ; (vdc_prints_attr.l179 + 0)
.s27:
34c6 : ad 01 d6 LDA $d601 
34c9 : 29 7f __ AND #$7f
34cb : a0 18 __ LDY #$18
34cd : 8c 00 d6 STY $d600 
.l181:
34d0 : 2c 00 d6 BIT $d600 
34d3 : 10 fb __ BPL $34d0 ; (vdc_prints_attr.l181 + 0)
.s33:
34d5 : 8d 01 d6 STA $d601 
34d8 : a9 1e __ LDA #$1e
34da : 8d 00 d6 STA $d600 
.l183:
34dd : 2c 00 d6 BIT $d600 
34e0 : 10 fb __ BPL $34dd ; (vdc_prints_attr.l183 + 0)
.s38:
34e2 : 8e 01 d6 STX $d601 
34e5 : 60 __ __ RTS
.s7:
34e6 : a5 11 __ LDA P4 ; (x + 0)
34e8 : 85 0d __ STA P0 
34ea : a5 12 __ LDA P5 ; (y + 0)
34ec : 85 0e __ STA P1 
34ee : a0 00 __ LDY #$00
34f0 : b1 13 __ LDA (P6),y ; (string + 0)
34f2 : 85 0f __ STA P2 
34f4 : a5 15 __ LDA P8 ; (attr + 0)
34f6 : 85 10 __ STA P3 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
34f8 : a5 0e __ LDA P1 ; (y + 0)
34fa : 0a __ __ ASL
34fb : a2 12 __ LDX #$12
34fd : 8e 00 d6 STX $d600 
3500 : aa __ __ TAX
3501 : 18 __ __ CLC
3502 : a5 0d __ LDA P0 ; (x + 0)
3504 : 7d 00 88 ADC $8800,x ; (multab + 0)
3507 : 85 1b __ STA ACCU + 0 
3509 : a9 00 __ LDA #$00
350b : 7d 01 88 ADC $8801,x ; (multab + 1)
350e : 85 1c __ STA ACCU + 1 
3510 : 18 __ __ CLC
3511 : a5 1b __ LDA ACCU + 0 
3513 : 6d 97 87 ADC $8797 ; (vdc_state + 8)
3516 : aa __ __ TAX
3517 : a5 1c __ LDA ACCU + 1 
3519 : 6d 98 87 ADC $8798 ; (vdc_state + 9)
.l167:
351c : 2c 00 d6 BIT $d600 
351f : 10 fb __ BPL $351c ; (vdc_printc.l167 + 0)
.s9:
3521 : 8d 01 d6 STA $d601 
3524 : a9 13 __ LDA #$13
3526 : 8d 00 d6 STA $d600 
.l169:
3529 : 2c 00 d6 BIT $d600 
352c : 10 fb __ BPL $3529 ; (vdc_printc.l169 + 0)
.s14:
352e : 8e 01 d6 STX $d601 
3531 : a9 1f __ LDA #$1f
3533 : 8d 00 d6 STA $d600 
.l171:
3536 : 2c 00 d6 BIT $d600 
3539 : 10 fb __ BPL $3536 ; (vdc_printc.l171 + 0)
.s18:
353b : a5 0f __ LDA P2 ; (val + 0)
353d : 8d 01 d6 STA $d601 
3540 : ad 99 87 LDA $8799 ; (vdc_state + 10)
3543 : 18 __ __ CLC
3544 : 65 1b __ ADC ACCU + 0 
3546 : a8 __ __ TAY
3547 : a9 12 __ LDA #$12
3549 : 8d 00 d6 STA $d600 
354c : ad 9a 87 LDA $879a ; (vdc_state + 11)
354f : 65 1c __ ADC ACCU + 1 
.l173:
3551 : 2c 00 d6 BIT $d600 
3554 : 10 fb __ BPL $3551 ; (vdc_printc.l173 + 0)
.s25:
3556 : 8d 01 d6 STA $d601 
3559 : a9 13 __ LDA #$13
355b : 8d 00 d6 STA $d600 
.l175:
355e : 2c 00 d6 BIT $d600 
3561 : 10 fb __ BPL $355e ; (vdc_printc.l175 + 0)
.s30:
3563 : 8c 01 d6 STY $d601 
3566 : a9 1f __ LDA #$1f
3568 : 8d 00 d6 STA $d600 
.l177:
356b : 2c 00 d6 BIT $d600 
356e : 10 fb __ BPL $356b ; (vdc_printc.l177 + 0)
.s34:
3570 : a5 10 __ LDA P3 ; (attr + 0)
3572 : 8d 01 d6 STA $d601 
.s1001:
3575 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
3576 : c9 20 __ CMP #$20
3578 : b0 03 __ BCS $357d ; (pet2screen.s2 + 0)
.s1:
357a : 69 80 __ ADC #$80
357c : 60 __ __ RTS
.s2:
357d : c9 40 __ CMP #$40
357f : 90 27 __ BCC $35a8 ; (pet2screen.s21 + 0)
.s7:
3581 : c9 60 __ CMP #$60
3583 : 90 17 __ BCC $359c ; (pet2screen.s4 + 0)
.s11:
3585 : 09 00 __ ORA #$00
3587 : 30 04 __ BMI $358d ; (pet2screen.s9 + 0)
.s8:
3589 : 38 __ __ SEC
358a : e9 20 __ SBC #$20
358c : 60 __ __ RTS
.s9:
358d : c9 80 __ CMP #$80
358f : 90 17 __ BCC $35a8 ; (pet2screen.s21 + 0)
.s15:
3591 : c9 a0 __ CMP #$a0
3593 : b0 03 __ BCS $3598 ; (pet2screen.s19 + 0)
.s12:
3595 : 69 40 __ ADC #$40
3597 : 60 __ __ RTS
.s19:
3598 : c9 c0 __ CMP #$c0
359a : b0 04 __ BCS $35a0 ; (pet2screen.s23 + 0)
.s4:
359c : 38 __ __ SEC
359d : e9 40 __ SBC #$40
359f : 60 __ __ RTS
.s23:
35a0 : c9 ff __ CMP #$ff
35a2 : b0 04 __ BCS $35a8 ; (pet2screen.s21 + 0)
.s20:
35a4 : 38 __ __ SEC
35a5 : e9 80 __ SBC #$80
35a7 : 60 __ __ RTS
.s21:
35a8 : c9 ff __ CMP #$ff
35aa : d0 02 __ BNE $35ae ; (pet2screen.s1001 + 0)
.s24:
35ac : a9 5e __ LDA #$5e
.s1001:
35ae : 60 __ __ RTS
--------------------------------------------------------------------
35af : __ __ __ BYT 6c 4f 41 44 20 54 49 54 4c 45 20 53 43 52 45 45 : lOAD TITLE SCREE
35bf : __ __ __ BYT 4e 00                                           : N.
--------------------------------------------------------------------
35c1 : __ __ __ BYT 56 44 43 53 45 54 53 43 52 00                   : VDCSETSCR.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
35cb : a5 53 __ LDA T1 + 0 
35cd : 8d d4 ab STA $abd4 ; (buff + 47)
35d0 : 38 __ __ SEC
35d1 : a5 23 __ LDA SP + 0 
35d3 : e9 08 __ SBC #$08
35d5 : 85 23 __ STA SP + 0 
35d7 : b0 02 __ BCS $35db ; (menu_fileerrormessage.s0 + 0)
35d9 : c6 24 __ DEC SP + 1 
.s0:
35db : a9 00 __ LDA #$00
35dd : 85 17 __ STA P10 
35df : a9 08 __ LDA #$08
35e1 : 85 18 __ STA P11 
35e3 : 8d f3 ab STA $abf3 ; (sstack + 0)
35e6 : a9 1e __ LDA #$1e
35e8 : 8d f4 ab STA $abf4 ; (sstack + 1)
35eb : a9 06 __ LDA #$06
35ed : 8d f5 ab STA $abf5 ; (sstack + 2)
35f0 : ad 96 87 LDA $8796 ; (vdc_state + 7)
35f3 : 85 53 __ STA T1 + 0 
35f5 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
35f8 : 85 52 __ STA T0 + 0 
35fa : 8d 96 87 STA $8796 ; (vdc_state + 7)
35fd : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
3600 : a9 e4 __ LDA #$e4
3602 : 85 13 __ STA P6 
3604 : a9 39 __ LDA #$39
3606 : 85 14 __ STA P7 
3608 : 20 b7 81 JSR $81b7 ; (vdc_prints_attr@proxy + 0)
360b : a9 90 __ LDA #$90
360d : a0 02 __ LDY #$02
360f : 91 23 __ STA (SP + 0),y 
3611 : a9 88 __ LDA #$88
3613 : c8 __ __ INY
3614 : 91 23 __ STA (SP + 0),y 
3616 : a9 f0 __ LDA #$f0
3618 : c8 __ __ INY
3619 : 91 23 __ STA (SP + 0),y 
361b : a9 39 __ LDA #$39
361d : c8 __ __ INY
361e : 91 23 __ STA (SP + 0),y 
3620 : ad d9 86 LDA $86d9 ; (krnio_pstatus + 1)
3623 : c8 __ __ INY
3624 : 91 23 __ STA (SP + 0),y 
3626 : a9 00 __ LDA #$00
3628 : c8 __ __ INY
3629 : 91 23 __ STA (SP + 0),y 
362b : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
362e : a9 0a __ LDA #$0a
3630 : 85 11 __ STA P4 
3632 : a9 0b __ LDA #$0b
3634 : 85 12 __ STA P5 
3636 : a5 52 __ LDA T0 + 0 
3638 : 85 15 __ STA P8 
363a : 20 41 81 JSR $8141 ; (vdc_prints_attr@proxy + 0)
363d : a9 0d __ LDA #$0d
363f : 85 12 __ STA P5 
3641 : 20 ac 81 JSR $81ac ; (vdc_prints_attr@proxy + 0)
3644 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
3647 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
364a : a5 53 __ LDA T1 + 0 
364c : 8d 96 87 STA $8796 ; (vdc_state + 7)
.s1001:
364f : 18 __ __ CLC
3650 : a5 23 __ LDA SP + 0 
3652 : 69 08 __ ADC #$08
3654 : 85 23 __ STA SP + 0 
3656 : 90 02 __ BCC $365a ; (menu_fileerrormessage.s1001 + 11)
3658 : e6 24 __ INC SP + 1 
365a : ad d4 ab LDA $abd4 ; (buff + 47)
365d : 85 53 __ STA T1 + 0 
365f : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
3660 : a2 03 __ LDX #$03
3662 : b5 53 __ LDA T8 + 0,x 
3664 : 9d ef ab STA $abef,x ; (buffer + 12)
3667 : ca __ __ DEX
3668 : 10 f8 __ BPL $3662 ; (vdcwin_win_new.s1000 + 2)
.s0:
366a : ad f4 ab LDA $abf4 ; (sstack + 1)
366d : 85 4b __ STA T0 + 0 
366f : 85 4c __ STA T1 + 0 
3671 : ad f5 ab LDA $abf5 ; (sstack + 2)
3674 : 85 43 __ STA T2 + 0 
3676 : 85 4d __ STA T3 + 0 
3678 : ad f3 ab LDA $abf3 ; (sstack + 0)
367b : 0a __ __ ASL
367c : aa __ __ TAX
367d : bd 00 88 LDA $8800,x ; (multab + 0)
3680 : 18 __ __ CLC
3681 : 65 18 __ ADC P11 ; (xpos + 0)
3683 : 85 53 __ STA T8 + 0 
3685 : bd 01 88 LDA $8801,x ; (multab + 1)
3688 : 69 00 __ ADC #$00
368a : 85 54 __ STA T8 + 1 
368c : a5 17 __ LDA P10 ; (border + 0)
368e : 0a __ __ ASL
368f : 10 0e __ BPL $369f ; (vdcwin_win_new.s57 + 0)
.s6:
3691 : a5 18 __ LDA P11 ; (xpos + 0)
3693 : f0 0a __ BEQ $369f ; (vdcwin_win_new.s57 + 0)
.s3:
3695 : e6 4c __ INC T1 + 0 
3697 : a5 53 __ LDA T8 + 0 
3699 : d0 02 __ BNE $369d ; (vdcwin_win_new.s1013 + 0)
.s1012:
369b : c6 54 __ DEC T8 + 1 
.s1013:
369d : c6 53 __ DEC T8 + 0 
.s57:
369f : a5 17 __ LDA P10 ; (border + 0)
36a1 : 29 20 __ AND #$20
36a3 : f0 15 __ BEQ $36ba ; (vdcwin_win_new.s59 + 0)
.s10:
36a5 : 18 __ __ CLC
36a6 : a5 4b __ LDA T0 + 0 
36a8 : 65 18 __ ADC P11 ; (xpos + 0)
36aa : a8 __ __ TAY
36ab : a9 00 __ LDA #$00
36ad : 2a __ __ ROL
36ae : cd 93 87 CMP $8793 ; (vdc_state + 4)
36b1 : d0 03 __ BNE $36b6 ; (vdcwin_win_new.s1009 + 0)
.s1008:
36b3 : cc 92 87 CPY $8792 ; (vdc_state + 3)
.s1009:
36b6 : b0 02 __ BCS $36ba ; (vdcwin_win_new.s59 + 0)
.s7:
36b8 : e6 4c __ INC T1 + 0 
.s59:
36ba : 24 17 __ BIT P10 ; (border + 0)
36bc : 10 1e __ BPL $36dc ; (vdcwin_win_new.s60 + 0)
.s14:
36be : ad f3 ab LDA $abf3 ; (sstack + 0)
36c1 : f0 19 __ BEQ $36dc ; (vdcwin_win_new.s60 + 0)
.s11:
36c3 : e6 4d __ INC T3 + 0 
36c5 : ad 92 87 LDA $8792 ; (vdc_state + 3)
36c8 : 85 03 __ STA WORK + 0 
36ca : ad 93 87 LDA $8793 ; (vdc_state + 4)
36cd : 85 04 __ STA WORK + 1 
36cf : 38 __ __ SEC
36d0 : a5 53 __ LDA T8 + 0 
36d2 : e5 03 __ SBC WORK + 0 
36d4 : 85 53 __ STA T8 + 0 
36d6 : a5 54 __ LDA T8 + 1 
36d8 : e5 04 __ SBC WORK + 1 
36da : 85 54 __ STA T8 + 1 
.s60:
36dc : a5 17 __ LDA P10 ; (border + 0)
36de : 29 10 __ AND #$10
36e0 : f0 16 __ BEQ $36f8 ; (vdcwin_win_new.s17 + 0)
.s18:
36e2 : 18 __ __ CLC
36e3 : a5 43 __ LDA T2 + 0 
36e5 : 6d f3 ab ADC $abf3 ; (sstack + 0)
36e8 : a8 __ __ TAY
36e9 : a9 00 __ LDA #$00
36eb : 2a __ __ ROL
36ec : cd 95 87 CMP $8795 ; (vdc_state + 6)
36ef : d0 03 __ BNE $36f4 ; (vdcwin_win_new.s1007 + 0)
.s1006:
36f1 : cc 94 87 CPY $8794 ; (vdc_state + 5)
.s1007:
36f4 : b0 02 __ BCS $36f8 ; (vdcwin_win_new.s17 + 0)
.s15:
36f6 : e6 4d __ INC T3 + 0 
.s17:
36f8 : a5 43 __ LDA T2 + 0 
36fa : 85 1b __ STA ACCU + 0 ; (height + 0)
36fc : a9 00 __ LDA #$00
36fe : 85 1c __ STA ACCU + 1 
3700 : a5 4b __ LDA T0 + 0 
3702 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
3705 : a5 05 __ LDA WORK + 2 
3707 : 0a __ __ ASL
3708 : 85 4e __ STA T5 + 0 
370a : a5 06 __ LDA WORK + 3 
370c : 2a __ __ ROL
370d : 85 4f __ STA T5 + 1 
370f : ad fd 82 LDA $82fd ; (winCfg + 6)
3712 : 85 50 __ STA T7 + 0 
3714 : 18 __ __ CLC
3715 : 65 4e __ ADC T5 + 0 
3717 : 85 4e __ STA T5 + 0 
3719 : ad fe 82 LDA $82fe ; (winCfg + 7)
371c : 85 51 __ STA T7 + 1 
371e : 65 4f __ ADC T5 + 1 
3720 : 85 4f __ STA T5 + 1 
3722 : ad f8 82 LDA $82f8 ; (winCfg + 1)
3725 : 18 __ __ CLC
3726 : 6d fa 82 ADC $82fa ; (winCfg + 3)
3729 : a8 __ __ TAY
372a : ad f9 82 LDA $82f9 ; (winCfg + 2)
372d : 6d fb 82 ADC $82fb ; (winCfg + 4)
3730 : aa __ __ TAX
3731 : 98 __ __ TYA
3732 : 18 __ __ CLC
3733 : 69 fe __ ADC #$fe
3735 : a8 __ __ TAY
3736 : 8a __ __ TXA
3737 : 69 ff __ ADC #$ff
3739 : c5 4f __ CMP T5 + 1 
373b : d0 02 __ BNE $373f ; (vdcwin_win_new.s1005 + 0)
.s1004:
373d : c4 4e __ CPY T5 + 0 
.s1005:
373f : 90 59 __ BCC $379a ; (vdcwin_win_new.s1001 + 0)
.s21:
3741 : ad fc 82 LDA $82fc ; (winCfg + 5)
3744 : c9 03 __ CMP #$03
3746 : f0 52 __ BEQ $379a ; (vdcwin_win_new.s1001 + 0)
.s25:
3748 : a5 18 __ LDA P11 ; (xpos + 0)
374a : 85 0f __ STA P2 
374c : ad f3 ab LDA $abf3 ; (sstack + 0)
374f : 85 10 __ STA P3 
3751 : a5 4b __ LDA T0 + 0 
3753 : 85 11 __ STA P4 
3755 : a5 43 __ LDA T2 + 0 
3757 : 85 12 __ STA P5 
3759 : ee fc 82 INC $82fc ; (winCfg + 5)
375c : ae fc 82 LDX $82fc ; (winCfg + 5)
375f : bd fc 71 LDA $71fc,x ; (__multab13L + 0)
3762 : 85 4e __ STA T5 + 0 
3764 : 18 __ __ CLC
3765 : 69 b3 __ ADC #$b3
3767 : 85 55 __ STA T10 + 0 
3769 : 85 0d __ STA P0 
376b : a9 87 __ LDA #$87
376d : 69 00 __ ADC #$00
376f : 85 56 __ STA T10 + 1 
3771 : 85 0e __ STA P1 
3773 : 20 0e 31 JSR $310e ; (vdcwin_init.s0 + 0)
3776 : a5 50 __ LDA T7 + 0 
3778 : a6 4e __ LDX T5 + 0 
377a : 9d b0 87 STA $87b0,x ; (canvas + 8)
377d : a5 51 __ LDA T7 + 1 
377f : 9d b1 87 STA $87b1,x ; (canvas + 9)
3782 : a5 17 __ LDA P10 ; (border + 0)
3784 : 9d b2 87 STA $87b2,x ; (canvas + 10)
3787 : a5 4d __ LDA T3 + 0 
3789 : d0 1a __ BNE $37a5 ; (vdcwin_win_new.s32 + 0)
.s30:
378b : a5 55 __ LDA T10 + 0 
378d : 85 14 __ STA P7 
378f : a5 56 __ LDA T10 + 1 
3791 : 85 15 __ STA P8 
3793 : a5 17 __ LDA P10 ; (border + 0)
3795 : 85 16 __ STA P9 
3797 : 20 26 38 JSR $3826 ; (vdcwin_border_clear.s0 + 0)
.s1001:
379a : a2 03 __ LDX #$03
379c : bd ef ab LDA $abef,x ; (buffer + 12)
379f : 95 53 __ STA T8 + 0,x 
37a1 : ca __ __ DEX
37a2 : 10 f8 __ BPL $379c ; (vdcwin_win_new.s1001 + 2)
37a4 : 60 __ __ RTS
.s32:
37a5 : 85 4b __ STA T0 + 0 
37a7 : a5 4c __ LDA T1 + 0 
37a9 : 85 12 __ STA P5 
.l1010:
37ab : a9 00 __ LDA #$00
37ad : 85 13 __ STA P6 
37af : ad f7 82 LDA $82f7 ; (winCfg + 0)
37b2 : 85 0d __ STA P0 
37b4 : ad fd 82 LDA $82fd ; (winCfg + 6)
37b7 : 85 50 __ STA T7 + 0 
37b9 : 85 0e __ STA P1 
37bb : ad fe 82 LDA $82fe ; (winCfg + 7)
37be : 85 51 __ STA T7 + 1 
37c0 : 85 0f __ STA P2 
37c2 : ad 97 87 LDA $8797 ; (vdc_state + 8)
37c5 : 18 __ __ CLC
37c6 : 65 53 __ ADC T8 + 0 
37c8 : 85 10 __ STA P3 
37ca : ad 98 87 LDA $8798 ; (vdc_state + 9)
37cd : 65 54 __ ADC T8 + 1 
37cf : 85 11 __ STA P4 
37d1 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
37d4 : a9 00 __ LDA #$00
37d6 : 85 13 __ STA P6 
37d8 : 18 __ __ CLC
37d9 : a5 50 __ LDA T7 + 0 
37db : 65 12 __ ADC P5 
37dd : 85 50 __ STA T7 + 0 
37df : 85 0e __ STA P1 
37e1 : 8d fd 82 STA $82fd ; (winCfg + 6)
37e4 : a5 51 __ LDA T7 + 1 
37e6 : 69 00 __ ADC #$00
37e8 : 85 51 __ STA T7 + 1 
37ea : 85 0f __ STA P2 
37ec : 8d fe 82 STA $82fe ; (winCfg + 7)
37ef : ad 99 87 LDA $8799 ; (vdc_state + 10)
37f2 : 18 __ __ CLC
37f3 : 65 53 __ ADC T8 + 0 
37f5 : 85 10 __ STA P3 
37f7 : ad 9a 87 LDA $879a ; (vdc_state + 11)
37fa : 65 54 __ ADC T8 + 1 
37fc : 85 11 __ STA P4 
37fe : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
3801 : 18 __ __ CLC
3802 : a5 50 __ LDA T7 + 0 
3804 : 65 12 __ ADC P5 
3806 : 8d fd 82 STA $82fd ; (winCfg + 6)
3809 : a5 51 __ LDA T7 + 1 
380b : 69 00 __ ADC #$00
380d : 8d fe 82 STA $82fe ; (winCfg + 7)
3810 : ad 92 87 LDA $8792 ; (vdc_state + 3)
3813 : 18 __ __ CLC
3814 : 65 53 __ ADC T8 + 0 
3816 : 85 53 __ STA T8 + 0 
3818 : ad 93 87 LDA $8793 ; (vdc_state + 4)
381b : 65 54 __ ADC T8 + 1 
381d : 85 54 __ STA T8 + 1 
381f : c6 4b __ DEC T0 + 0 
3821 : d0 88 __ BNE $37ab ; (vdcwin_win_new.l1010 + 0)
3823 : 4c 8b 37 JMP $378b ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
3826 : a5 16 __ LDA P9 ; (border + 0)
3828 : 29 0f __ AND #$0f
382a : 85 47 __ STA T2 + 0 
382c : 49 ff __ EOR #$ff
382e : 18 __ __ CLC
382f : 69 01 __ ADC #$01
3831 : 29 09 __ AND #$09
3833 : 85 48 __ STA T3 + 0 
3835 : aa __ __ TAX
3836 : bd 35 82 LDA $8235,x ; (winStyles + 0)
3839 : 85 49 __ STA T4 + 0 
383b : a5 16 __ LDA P9 ; (border + 0)
383d : 0a __ __ ASL
383e : 10 0c __ BPL $384c ; (vdcwin_border_clear.s53 + 0)
.s4:
3840 : a0 00 __ LDY #$00
3842 : b1 14 __ LDA (P7),y ; (win + 0)
3844 : d0 06 __ BNE $384c ; (vdcwin_border_clear.s53 + 0)
.s1:
3846 : a5 16 __ LDA P9 ; (border + 0)
3848 : 29 bf __ AND #$bf
384a : 85 16 __ STA P9 ; (border + 0)
.s53:
384c : a5 16 __ LDA P9 ; (border + 0)
384e : 29 20 __ AND #$20
3850 : f0 2c __ BEQ $387e ; (vdcwin_border_clear.s55 + 0)
.s8:
3852 : a0 00 __ LDY #$00
3854 : b1 14 __ LDA (P7),y ; (win + 0)
3856 : 18 __ __ CLC
3857 : a0 02 __ LDY #$02
3859 : 71 14 __ ADC (P7),y ; (win + 0)
385b : a8 __ __ TAY
385c : a9 00 __ LDA #$00
385e : 2a __ __ ROL
385f : 85 1c __ STA ACCU + 1 
3861 : 98 __ __ TYA
3862 : 69 01 __ ADC #$01
3864 : 85 1b __ STA ACCU + 0 
3866 : 90 02 __ BCC $386a ; (vdcwin_border_clear.s8 + 24)
3868 : e6 1c __ INC ACCU + 1 
386a : ad 93 87 LDA $8793 ; (vdc_state + 4)
386d : c5 1c __ CMP ACCU + 1 
386f : d0 05 __ BNE $3876 ; (vdcwin_border_clear.s1007 + 0)
.s1006:
3871 : ad 92 87 LDA $8792 ; (vdc_state + 3)
3874 : c5 1b __ CMP ACCU + 0 
.s1007:
3876 : b0 06 __ BCS $387e ; (vdcwin_border_clear.s55 + 0)
.s5:
3878 : a5 16 __ LDA P9 ; (border + 0)
387a : 29 df __ AND #$df
387c : 85 16 __ STA P9 ; (border + 0)
.s55:
387e : 24 16 __ BIT P9 ; (border + 0)
3880 : 10 67 __ BPL $38e9 ; (vdcwin_border_clear.s59 + 0)
.s12:
3882 : a0 01 __ LDY #$01
3884 : b1 14 __ LDA (P7),y ; (win + 0)
3886 : f0 61 __ BEQ $38e9 ; (vdcwin_border_clear.s59 + 0)
.s9:
3888 : 38 __ __ SEC
3889 : e9 01 __ SBC #$01
388b : 85 4a __ STA T7 + 0 
388d : a5 16 __ LDA P9 ; (border + 0)
388f : 0a __ __ ASL
3890 : 10 18 __ BPL $38aa ; (vdcwin_border_clear.s15 + 0)
.s13:
3892 : a5 4a __ LDA T7 + 0 
3894 : 85 0e __ STA P1 
3896 : a5 49 __ LDA T4 + 0 
3898 : 85 10 __ STA P3 
389a : bd 36 82 LDA $8236,x ; (winStyles + 1)
389d : 85 0f __ STA P2 
389f : 38 __ __ SEC
38a0 : 88 __ __ DEY
38a1 : b1 14 __ LDA (P7),y ; (win + 0)
38a3 : e9 01 __ SBC #$01
38a5 : 85 0d __ STA P0 
38a7 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
.s15:
38aa : a0 00 __ LDY #$00
38ac : b1 14 __ LDA (P7),y ; (win + 0)
38ae : 85 46 __ STA T0 + 0 
38b0 : 85 0f __ STA P2 
38b2 : a5 4a __ LDA T7 + 0 
38b4 : 85 10 __ STA P3 
38b6 : a5 49 __ LDA T4 + 0 
38b8 : 85 12 __ STA P5 
38ba : a6 48 __ LDX T3 + 0 
38bc : bd 3a 82 LDA $823a,x ; (winStyles + 5)
38bf : 85 11 __ STA P4 
38c1 : a0 02 __ LDY #$02
38c3 : b1 14 __ LDA (P7),y ; (win + 0)
38c5 : 85 13 __ STA P6 
38c7 : 20 ce 2c JSR $2cce ; (vdc_hchar.s0 + 0)
38ca : a5 16 __ LDA P9 ; (border + 0)
38cc : 29 20 __ AND #$20
38ce : f0 19 __ BEQ $38e9 ; (vdcwin_border_clear.s59 + 0)
.s16:
38d0 : a5 10 __ LDA P3 
38d2 : 85 0e __ STA P1 
38d4 : a5 12 __ LDA P5 
38d6 : 85 10 __ STA P3 
38d8 : a6 48 __ LDX T3 + 0 
38da : bd 37 82 LDA $8237,x ; (winStyles + 2)
38dd : 85 0f __ STA P2 
38df : 18 __ __ CLC
38e0 : a5 13 __ LDA P6 
38e2 : 65 46 __ ADC T0 + 0 
38e4 : 85 0d __ STA P0 
38e6 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
.s59:
38e9 : a5 16 __ LDA P9 ; (border + 0)
38eb : 29 10 __ AND #$10
38ed : f0 79 __ BEQ $3968 ; (vdcwin_border_clear.s39 + 0)
.s22:
38ef : a0 01 __ LDY #$01
38f1 : b1 14 __ LDA (P7),y ; (win + 0)
38f3 : 18 __ __ CLC
38f4 : a0 03 __ LDY #$03
38f6 : 71 14 __ ADC (P7),y ; (win + 0)
38f8 : 85 4a __ STA T7 + 0 
38fa : a9 00 __ LDA #$00
38fc : 2a __ __ ROL
38fd : cd 95 87 CMP $8795 ; (vdc_state + 6)
3900 : d0 05 __ BNE $3907 ; (vdcwin_border_clear.s1005 + 0)
.s1004:
3902 : a5 4a __ LDA T7 + 0 
3904 : cd 94 87 CMP $8794 ; (vdc_state + 5)
.s1005:
3907 : b0 5f __ BCS $3968 ; (vdcwin_border_clear.s39 + 0)
.s19:
3909 : a5 16 __ LDA P9 ; (border + 0)
390b : 0a __ __ ASL
390c : 10 1b __ BPL $3929 ; (vdcwin_border_clear.s25 + 0)
.s23:
390e : a5 4a __ LDA T7 + 0 
3910 : 85 0e __ STA P1 
3912 : a5 49 __ LDA T4 + 0 
3914 : 85 10 __ STA P3 
3916 : a6 48 __ LDX T3 + 0 
3918 : bd 38 82 LDA $8238,x ; (winStyles + 3)
391b : 85 0f __ STA P2 
391d : 38 __ __ SEC
391e : a0 00 __ LDY #$00
3920 : b1 14 __ LDA (P7),y ; (win + 0)
3922 : e9 01 __ SBC #$01
3924 : 85 0d __ STA P0 
3926 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
.s25:
3929 : a0 00 __ LDY #$00
392b : b1 14 __ LDA (P7),y ; (win + 0)
392d : 85 46 __ STA T0 + 0 
392f : 85 0f __ STA P2 
3931 : a5 4a __ LDA T7 + 0 
3933 : 85 10 __ STA P3 
3935 : a5 49 __ LDA T4 + 0 
3937 : 85 12 __ STA P5 
3939 : a6 48 __ LDX T3 + 0 
393b : bd 3b 82 LDA $823b,x ; (winStyles + 6)
393e : 85 11 __ STA P4 
3940 : a0 02 __ LDY #$02
3942 : b1 14 __ LDA (P7),y ; (win + 0)
3944 : 85 13 __ STA P6 
3946 : 20 ce 2c JSR $2cce ; (vdc_hchar.s0 + 0)
3949 : a5 16 __ LDA P9 ; (border + 0)
394b : 29 20 __ AND #$20
394d : f0 19 __ BEQ $3968 ; (vdcwin_border_clear.s39 + 0)
.s26:
394f : a5 10 __ LDA P3 
3951 : 85 0e __ STA P1 
3953 : a5 12 __ LDA P5 
3955 : 85 10 __ STA P3 
3957 : a6 48 __ LDX T3 + 0 
3959 : bd 39 82 LDA $8239,x ; (winStyles + 4)
395c : 85 0f __ STA P2 
395e : 18 __ __ CLC
395f : a5 13 __ LDA P6 
3961 : 65 46 __ ADC T0 + 0 
3963 : 85 0d __ STA P0 
3965 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
.s39:
3968 : a9 00 __ LDA #$00
396a : 85 46 __ STA T0 + 0 
.l29:
396c : a0 03 __ LDY #$03
396e : d1 14 __ CMP (P7),y ; (win + 0)
3970 : 90 01 __ BCC $3973 ; (vdcwin_border_clear.s30 + 0)
.s1001:
3972 : 60 __ __ RTS
.s30:
3973 : a5 16 __ LDA P9 ; (border + 0)
3975 : 0a __ __ ASL
3976 : 10 25 __ BPL $399d ; (vdcwin_border_clear.s35 + 0)
.s33:
3978 : a5 49 __ LDA T4 + 0 
397a : 85 10 __ STA P3 
397c : 38 __ __ SEC
397d : a0 00 __ LDY #$00
397f : b1 14 __ LDA (P7),y ; (win + 0)
3981 : e9 01 __ SBC #$01
3983 : 85 0d __ STA P0 
3985 : c8 __ __ INY
3986 : b1 14 __ LDA (P7),y ; (win + 0)
3988 : 18 __ __ CLC
3989 : 65 46 __ ADC T0 + 0 
398b : 85 0e __ STA P1 
398d : 38 __ __ SEC
398e : a9 00 __ LDA #$00
3990 : e5 47 __ SBC T2 + 0 
3992 : 29 09 __ AND #$09
3994 : aa __ __ TAX
3995 : bd 3c 82 LDA $823c,x ; (winStyles + 7)
3998 : 85 0f __ STA P2 
399a : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
.s35:
399d : a9 20 __ LDA #$20
399f : 85 11 __ STA P4 
39a1 : a0 02 __ LDY #$02
39a3 : b1 14 __ LDA (P7),y ; (win + 0)
39a5 : 85 13 __ STA P6 
39a7 : a0 00 __ LDY #$00
39a9 : b1 14 __ LDA (P7),y ; (win + 0)
39ab : 85 0f __ STA P2 
39ad : c8 __ __ INY
39ae : b1 14 __ LDA (P7),y ; (win + 0)
39b0 : 18 __ __ CLC
39b1 : 65 46 __ ADC T0 + 0 
39b3 : 85 10 __ STA P3 
39b5 : 20 c9 2c JSR $2cc9 ; (vdc_hchar@proxy + 0)
39b8 : a5 16 __ LDA P9 ; (border + 0)
39ba : 29 20 __ AND #$20
39bc : f0 1f __ BEQ $39dd ; (vdcwin_border_clear.s69 + 0)
.s36:
39be : a5 10 __ LDA P3 
39c0 : 85 0e __ STA P1 
39c2 : a5 49 __ LDA T4 + 0 
39c4 : 85 10 __ STA P3 
39c6 : 18 __ __ CLC
39c7 : a5 13 __ LDA P6 
39c9 : 65 0f __ ADC P2 
39cb : 85 0d __ STA P0 
39cd : 38 __ __ SEC
39ce : a9 00 __ LDA #$00
39d0 : e5 47 __ SBC T2 + 0 
39d2 : 29 09 __ AND #$09
39d4 : aa __ __ TAX
39d5 : bd 3d 82 LDA $823d,x ; (winStyles + 8)
39d8 : 85 0f __ STA P2 
39da : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
.s69:
39dd : e6 46 __ INC T0 + 0 
39df : a5 46 __ LDA T0 + 0 
39e1 : 4c 6c 39 JMP $396c ; (vdcwin_border_clear.l29 + 0)
--------------------------------------------------------------------
39e4 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
39f0 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
spentry:
39ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3a00 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
3a0b : 20 e4 ff JSR $ffe4 
3a0e : c9 00 __ CMP #$00
3a10 : f0 f9 __ BEQ $3a0b ; (vdcwin_getch.s0 + 0)
3a12 : 85 1b __ STA ACCU + 0 
3a14 : a9 00 __ LDA #$00
3a16 : 85 1c __ STA ACCU + 1 
.s1001:
3a18 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
3a19 : ad fc 82 LDA $82fc ; (winCfg + 5)
3a1c : d0 01 __ BNE $3a1f ; (vdcwin_win_free.s3 + 0)
3a1e : 60 __ __ RTS
.s3:
3a1f : 85 44 __ STA T0 + 0 
3a21 : a8 __ __ TAY
3a22 : be fc 71 LDX $71fc,y ; (__multab13L + 0)
3a25 : 86 1b __ STX ACCU + 0 
3a27 : bc b5 87 LDY $87b5,x ; (canvas + 13)
3a2a : 84 1c __ STY ACCU + 1 
3a2c : bd b6 87 LDA $87b6,x ; (canvas + 14)
3a2f : 85 43 __ STA T5 + 0 
3a31 : 85 1d __ STA ACCU + 2 
3a33 : bd b0 87 LDA $87b0,x ; (canvas + 8)
3a36 : 85 45 __ STA T2 + 0 
3a38 : 8d fd 82 STA $82fd ; (winCfg + 6)
3a3b : bd b1 87 LDA $87b1,x ; (canvas + 9)
3a3e : 85 46 __ STA T2 + 1 
3a40 : 8d fe 82 STA $82fe ; (winCfg + 7)
3a43 : bd b3 87 LDA $87b3,x ; (canvas + 11)
3a46 : 85 1e __ STA ACCU + 3 
3a48 : bd b4 87 LDA $87b4,x ; (canvas + 12)
3a4b : 85 4a __ STA T10 + 0 
3a4d : 0a __ __ ASL
3a4e : aa __ __ TAX
3a4f : bd 00 88 LDA $8800,x ; (multab + 0)
3a52 : 18 __ __ CLC
3a53 : 65 1e __ ADC ACCU + 3 
3a55 : 85 4b __ STA T11 + 0 
3a57 : bd 01 88 LDA $8801,x ; (multab + 1)
3a5a : 69 00 __ ADC #$00
3a5c : 85 4c __ STA T11 + 1 
3a5e : a6 1b __ LDX ACCU + 0 
3a60 : bd b2 87 LDA $87b2,x ; (canvas + 10)
3a63 : 85 1b __ STA ACCU + 0 
3a65 : 0a __ __ ASL
3a66 : 10 0e __ BPL $3a76 ; (vdcwin_win_free.s53 + 0)
.s10:
3a68 : a5 1e __ LDA ACCU + 3 
3a6a : f0 0a __ BEQ $3a76 ; (vdcwin_win_free.s53 + 0)
.s7:
3a6c : e6 1c __ INC ACCU + 1 
3a6e : a5 4b __ LDA T11 + 0 
3a70 : d0 02 __ BNE $3a74 ; (vdcwin_win_free.s1009 + 0)
.s1008:
3a72 : c6 4c __ DEC T11 + 1 
.s1009:
3a74 : c6 4b __ DEC T11 + 0 
.s53:
3a76 : a5 1b __ LDA ACCU + 0 
3a78 : 29 20 __ AND #$20
3a7a : f0 14 __ BEQ $3a90 ; (vdcwin_win_free.s55 + 0)
.s14:
3a7c : 98 __ __ TYA
3a7d : 18 __ __ CLC
3a7e : 65 1e __ ADC ACCU + 3 
3a80 : a8 __ __ TAY
3a81 : a9 00 __ LDA #$00
3a83 : 2a __ __ ROL
3a84 : cd 93 87 CMP $8793 ; (vdc_state + 4)
3a87 : d0 03 __ BNE $3a8c ; (vdcwin_win_free.s1005 + 0)
.s1004:
3a89 : cc 92 87 CPY $8792 ; (vdc_state + 3)
.s1005:
3a8c : b0 02 __ BCS $3a90 ; (vdcwin_win_free.s55 + 0)
.s11:
3a8e : e6 1c __ INC ACCU + 1 
.s55:
3a90 : 24 1b __ BIT ACCU + 0 
3a92 : 10 15 __ BPL $3aa9 ; (vdcwin_win_free.s56 + 0)
.s18:
3a94 : a5 4a __ LDA T10 + 0 
3a96 : f0 11 __ BEQ $3aa9 ; (vdcwin_win_free.s56 + 0)
.s15:
3a98 : e6 1d __ INC ACCU + 2 
3a9a : 38 __ __ SEC
3a9b : a5 4b __ LDA T11 + 0 
3a9d : ed 92 87 SBC $8792 ; (vdc_state + 3)
3aa0 : 85 4b __ STA T11 + 0 
3aa2 : a5 4c __ LDA T11 + 1 
3aa4 : ed 93 87 SBC $8793 ; (vdc_state + 4)
3aa7 : 85 4c __ STA T11 + 1 
.s56:
3aa9 : a5 1b __ LDA ACCU + 0 
3aab : 29 10 __ AND #$10
3aad : f0 15 __ BEQ $3ac4 ; (vdcwin_win_free.s21 + 0)
.s22:
3aaf : 18 __ __ CLC
3ab0 : a5 43 __ LDA T5 + 0 
3ab2 : 65 4a __ ADC T10 + 0 
3ab4 : a8 __ __ TAY
3ab5 : a9 00 __ LDA #$00
3ab7 : 2a __ __ ROL
3ab8 : cd 95 87 CMP $8795 ; (vdc_state + 6)
3abb : d0 03 __ BNE $3ac0 ; (vdcwin_win_free.s1003 + 0)
.s1002:
3abd : cc 94 87 CPY $8794 ; (vdc_state + 5)
.s1003:
3ac0 : b0 02 __ BCS $3ac4 ; (vdcwin_win_free.s21 + 0)
.s19:
3ac2 : e6 1d __ INC ACCU + 2 
.s21:
3ac4 : a5 1d __ LDA ACCU + 2 
3ac6 : d0 11 __ BNE $3ad9 ; (vdcwin_win_free.s27 + 0)
.s26:
3ac8 : a5 45 __ LDA T2 + 0 
3aca : 8d fd 82 STA $82fd ; (winCfg + 6)
3acd : a5 46 __ LDA T2 + 1 
3acf : 8d fe 82 STA $82fe ; (winCfg + 7)
3ad2 : a6 44 __ LDX T0 + 0 
3ad4 : ca __ __ DEX
3ad5 : 8e fc 82 STX $82fc ; (winCfg + 5)
.s1001:
3ad8 : 60 __ __ RTS
.s27:
3ad9 : 85 47 __ STA T3 + 0 
3adb : a5 1c __ LDA ACCU + 1 
3add : 85 14 __ STA P7 
.l1006:
3adf : a9 00 __ LDA #$00
3ae1 : 85 15 __ STA P8 
3ae3 : ad 97 87 LDA $8797 ; (vdc_state + 8)
3ae6 : 18 __ __ CLC
3ae7 : 65 4b __ ADC T11 + 0 
3ae9 : 85 0f __ STA P2 
3aeb : ad 98 87 LDA $8798 ; (vdc_state + 9)
3aee : 65 4c __ ADC T11 + 1 
3af0 : 85 10 __ STA P3 
3af2 : ad f7 82 LDA $82f7 ; (winCfg + 0)
3af5 : 85 11 __ STA P4 
3af7 : ad fd 82 LDA $82fd ; (winCfg + 6)
3afa : 85 48 __ STA T7 + 0 
3afc : 85 12 __ STA P5 
3afe : ad fe 82 LDA $82fe ; (winCfg + 7)
3b01 : 85 49 __ STA T7 + 1 
3b03 : 85 13 __ STA P6 
3b05 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
3b08 : a9 00 __ LDA #$00
3b0a : 85 15 __ STA P8 
3b0c : 18 __ __ CLC
3b0d : a5 48 __ LDA T7 + 0 
3b0f : 65 14 __ ADC P7 
3b11 : 85 48 __ STA T7 + 0 
3b13 : 85 12 __ STA P5 
3b15 : 8d fd 82 STA $82fd ; (winCfg + 6)
3b18 : a5 49 __ LDA T7 + 1 
3b1a : 69 00 __ ADC #$00
3b1c : 85 49 __ STA T7 + 1 
3b1e : 85 13 __ STA P6 
3b20 : 8d fe 82 STA $82fe ; (winCfg + 7)
3b23 : ad 99 87 LDA $8799 ; (vdc_state + 10)
3b26 : 18 __ __ CLC
3b27 : 65 4b __ ADC T11 + 0 
3b29 : 85 0f __ STA P2 
3b2b : ad 9a 87 LDA $879a ; (vdc_state + 11)
3b2e : 65 4c __ ADC T11 + 1 
3b30 : 85 10 __ STA P3 
3b32 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
3b35 : 18 __ __ CLC
3b36 : a5 48 __ LDA T7 + 0 
3b38 : 65 14 __ ADC P7 
3b3a : 8d fd 82 STA $82fd ; (winCfg + 6)
3b3d : a5 49 __ LDA T7 + 1 
3b3f : 69 00 __ ADC #$00
3b41 : 8d fe 82 STA $82fe ; (winCfg + 7)
3b44 : ad 92 87 LDA $8792 ; (vdc_state + 3)
3b47 : 18 __ __ CLC
3b48 : 65 4b __ ADC T11 + 0 
3b4a : 85 4b __ STA T11 + 0 
3b4c : ad 93 87 LDA $8793 ; (vdc_state + 4)
3b4f : 65 4c __ ADC T11 + 1 
3b51 : 85 4c __ STA T11 + 1 
3b53 : c6 47 __ DEC T3 + 0 
3b55 : d0 88 __ BNE $3adf ; (vdcwin_win_free.l1006 + 0)
3b57 : 4c c8 3a JMP $3ac8 ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
initoverlay: ; initoverlay()->void
.s1000:
3b5a : a5 53 __ LDA T4 + 0 
3b5c : 8d 9f ab STA $ab9f ; (projbuffer + 16)
3b5f : a5 54 __ LDA T4 + 1 
3b61 : 8d a0 ab STA $aba0 ; (projbuffer + 17)
3b64 : a5 55 __ LDA T5 + 0 
3b66 : 8d a1 ab STA $aba1 ; (projbuffer + 18)
3b69 : 38 __ __ SEC
3b6a : a5 23 __ LDA SP + 0 
3b6c : e9 08 __ SBC #$08
3b6e : 85 23 __ STA SP + 0 
3b70 : b0 02 __ BCS $3b74 ; (initoverlay.s0 + 0)
3b72 : c6 24 __ DEC SP + 1 
.s0:
3b74 : a9 00 __ LDA #$00
3b76 : 85 51 __ STA T2 + 0 
3b78 : a9 c0 __ LDA #$c0
3b7a : 85 4f __ STA T0 + 1 
3b7c : a9 3f __ LDA #$3f
3b7e : 85 50 __ STA T1 + 0 
.l2:
3b80 : a9 00 __ LDA #$00
3b82 : a0 02 __ LDY #$02
3b84 : 91 23 __ STA (SP + 0),y 
3b86 : a9 89 __ LDA #$89
3b88 : c8 __ __ INY
3b89 : 91 23 __ STA (SP + 0),y 
3b8b : a9 8c __ LDA #$8c
3b8d : c8 __ __ INY
3b8e : 91 23 __ STA (SP + 0),y 
3b90 : a9 3c __ LDA #$3c
3b92 : c8 __ __ INY
3b93 : 91 23 __ STA (SP + 0),y 
3b95 : 18 __ __ CLC
3b96 : a5 51 __ LDA T2 + 0 
3b98 : 69 01 __ ADC #$01
3b9a : 85 55 __ STA T5 + 0 
3b9c : c8 __ __ INY
3b9d : 91 23 __ STA (SP + 0),y 
3b9f : a9 00 __ LDA #$00
3ba1 : c8 __ __ INY
3ba2 : 91 23 __ STA (SP + 0),y 
3ba4 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
3ba7 : a9 00 __ LDA #$00
3ba9 : 85 16 __ STA P9 
3bab : a9 89 __ LDA #$89
3bad : 85 17 __ STA P10 
3baf : 20 2d 33 JSR $332d ; (printcentered.s0 + 0)
3bb2 : a9 00 __ LDA #$00
3bb4 : a0 02 __ LDY #$02
3bb6 : 91 23 __ STA (SP + 0),y 
3bb8 : a9 89 __ LDA #$89
3bba : c8 __ __ INY
3bbb : 91 23 __ STA (SP + 0),y 
3bbd : a5 55 __ LDA T5 + 0 
3bbf : a0 06 __ LDY #$06
3bc1 : 91 23 __ STA (SP + 0),y 
3bc3 : a9 00 __ LDA #$00
3bc5 : c8 __ __ INY
3bc6 : 91 23 __ STA (SP + 0),y 
3bc8 : a9 9e __ LDA #$9e
3bca : a0 04 __ LDY #$04
3bcc : 91 23 __ STA (SP + 0),y 
3bce : a9 3c __ LDA #$3c
3bd0 : c8 __ __ INY
3bd1 : 91 23 __ STA (SP + 0),y 
3bd3 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
3bd6 : a6 51 __ LDX T2 + 0 
3bd8 : bd 36 80 LDA $8036,x ; (__multab3L + 0)
3bdb : aa __ __ TAX
3bdc : 18 __ __ CLC
3bdd : 69 e4 __ ADC #$e4
3bdf : 85 53 __ STA T4 + 0 
3be1 : a9 87 __ LDA #$87
3be3 : 69 00 __ ADC #$00
3be5 : 85 54 __ STA T4 + 1 
3be7 : a5 50 __ LDA T1 + 0 
3be9 : 9d e4 87 STA $87e4,x ; (overlaydata + 0)
3bec : f0 59 __ BEQ $3c47 ; (initoverlay.s3 + 0)
.s5:
3bee : a9 00 __ LDA #$00
3bf0 : 8d f8 ab STA $abf8 ; (sstack + 5)
3bf3 : a9 89 __ LDA #$89
3bf5 : 8d f9 ab STA $abf9 ; (sstack + 6)
3bf8 : 20 47 2a JSR $2a47 ; (load_overlay.s1000 + 0)
3bfb : a5 50 __ LDA T1 + 0 
3bfd : a0 00 __ LDY #$00
3bff : 84 13 __ STY P6 
3c01 : 84 11 __ STY P4 
3c03 : 84 0e __ STY P1 
3c05 : 91 53 __ STA (T4 + 0),y 
3c07 : 85 0d __ STA P0 
3c09 : a9 3f __ LDA #$3f
3c0b : 85 10 __ STA P3 
3c0d : a9 14 __ LDA #$14
3c0f : 85 14 __ STA P7 
3c11 : a5 4f __ LDA T0 + 1 
3c13 : 85 0f __ STA P2 
3c15 : a9 ac __ LDA #$ac
3c17 : 85 12 __ STA P5 
3c19 : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
3c1c : a9 00 __ LDA #$00
3c1e : a0 01 __ LDY #$01
3c20 : 91 53 __ STA (T4 + 0),y 
3c22 : a5 4f __ LDA T0 + 1 
3c24 : c8 __ __ INY
3c25 : 91 53 __ STA (T4 + 0),y 
3c27 : 18 __ __ CLC
3c28 : 69 28 __ ADC #$28
3c2a : 85 1c __ STA ACCU + 1 
3c2c : 18 __ __ CLC
3c2d : 69 ec __ ADC #$ec
3c2f : 85 4f __ STA T0 + 1 
3c31 : a5 0d __ LDA P0 
3c33 : c9 3f __ CMP #$3f
3c35 : f0 36 __ BEQ $3c6d ; (initoverlay.s8 + 0)
.s9:
3c37 : a5 1c __ LDA ACCU + 1 
3c39 : c9 d0 __ CMP #$d0
3c3b : 90 06 __ BCC $3c43 ; (initoverlay.s15 + 0)
.s18:
3c3d : a9 ef __ LDA #$ef
3c3f : c5 1c __ CMP ACCU + 1 
3c41 : b0 04 __ BCS $3c47 ; (initoverlay.s3 + 0)
.s15:
3c43 : a9 00 __ LDA #$00
3c45 : 85 50 __ STA T1 + 0 
.s3:
3c47 : e6 51 __ INC T2 + 0 
3c49 : a5 51 __ LDA T2 + 0 
3c4b : c9 06 __ CMP #$06
3c4d : b0 03 __ BCS $3c52 ; (initoverlay.s1001 + 0)
3c4f : 4c 80 3b JMP $3b80 ; (initoverlay.l2 + 0)
.s1001:
3c52 : 18 __ __ CLC
3c53 : a5 23 __ LDA SP + 0 
3c55 : 69 08 __ ADC #$08
3c57 : 85 23 __ STA SP + 0 
3c59 : 90 02 __ BCC $3c5d ; (initoverlay.s1001 + 11)
3c5b : e6 24 __ INC SP + 1 
3c5d : ad 9f ab LDA $ab9f ; (projbuffer + 16)
3c60 : 85 53 __ STA T4 + 0 
3c62 : ad a0 ab LDA $aba0 ; (projbuffer + 17)
3c65 : 85 54 __ STA T4 + 1 
3c67 : ad a1 ab LDA $aba1 ; (projbuffer + 18)
3c6a : 85 55 __ STA T5 + 0 
3c6c : 60 __ __ RTS
.s8:
3c6d : a5 1c __ LDA ACCU + 1 
3c6f : c9 c0 __ CMP #$c0
3c71 : 90 06 __ BCC $3c79 ; (initoverlay.s11 + 0)
.s14:
3c73 : a9 ef __ LDA #$ef
3c75 : c5 1c __ CMP ACCU + 1 
3c77 : b0 ce __ BCS $3c47 ; (initoverlay.s3 + 0)
.s11:
3c79 : e6 51 __ INC T2 + 0 
3c7b : a5 51 __ LDA T2 + 0 
3c7d : c9 06 __ CMP #$06
3c7f : b0 d1 __ BCS $3c52 ; (initoverlay.s1001 + 0)
.s26:
3c81 : a9 7f __ LDA #$7f
3c83 : 85 50 __ STA T1 + 0 
3c85 : a9 d0 __ LDA #$d0
3c87 : 85 4f __ STA T0 + 1 
3c89 : 4c 80 3b JMP $3b80 ; (initoverlay.l2 + 0)
--------------------------------------------------------------------
3c8c : __ __ __ BYT 6d 45 4d 4f 52 59 20 4f 56 45 52 4c 41 59 20 25 : mEMORY OVERLAY %
3c9c : __ __ __ BYT 55 00                                           : U.
--------------------------------------------------------------------
3c9e : __ __ __ BYT 56 44 43 53 45 4f 56 4c 25 55 00                : VDCSEOVL%U.
--------------------------------------------------------------------
3ca9 : __ __ __ BYT 6c 4f 41 44 20 56 49 53 55 41 4c 20 70 65 74 73 : lOAD VISUAL pets
3cb9 : __ __ __ BYT 63 69 69 00                                     : cii.
--------------------------------------------------------------------
3cbd : __ __ __ BYT 56 44 43 53 45 50 45 54 56 00                   : VDCSEPETV.
--------------------------------------------------------------------
3cc7 : __ __ __ BYT 63 4f 50 59 20 43 48 41 52 53 45 54 53 00       : cOPY CHARSETS.
--------------------------------------------------------------------
screenmapfill: ; screenmapfill(u8,u8)->void
.s0:
3cd5 : a9 00 __ LDA #$00
3cd7 : 85 0d __ STA P0 
3cd9 : a9 58 __ LDA #$58
3cdb : 85 0e __ STA P1 
3cdd : ad f8 ab LDA $abf8 ; (sstack + 5)
3ce0 : 85 0f __ STA P2 
3ce2 : ad f7 86 LDA $86f7 ; (screentotal + 0)
3ce5 : 85 51 __ STA T0 + 0 
3ce7 : 18 __ __ CLC
3ce8 : 69 30 __ ADC #$30
3cea : 85 10 __ STA P3 
3cec : ad f8 86 LDA $86f8 ; (screentotal + 1)
3cef : 85 52 __ STA T0 + 1 
3cf1 : 69 00 __ ADC #$00
3cf3 : 85 11 __ STA P4 
3cf5 : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
3cf8 : 20 14 3d JSR $3d14 ; (placesignature.s1000 + 0)
3cfb : a5 51 __ LDA T0 + 0 
3cfd : 85 10 __ STA P3 
3cff : 18 __ __ CLC
3d00 : 69 30 __ ADC #$30
3d02 : 85 0d __ STA P0 
3d04 : a5 52 __ LDA T0 + 1 
3d06 : 85 11 __ STA P4 
3d08 : 69 58 __ ADC #$58
3d0a : 85 0e __ STA P1 
3d0c : ad f9 ab LDA $abf9 ; (sstack + 6)
3d0f : 85 0f __ STA P2 
3d11 : 4c e0 14 JMP $14e0 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
placesignature: ; placesignature()->void
.s1000:
3d14 : 38 __ __ SEC
3d15 : a5 23 __ LDA SP + 0 
3d17 : e9 08 __ SBC #$08
3d19 : 85 23 __ STA SP + 0 
3d1b : b0 02 __ BCS $3d1f ; (placesignature.s0 + 0)
3d1d : c6 24 __ DEC SP + 1 
.s0:
3d1f : a9 00 __ LDA #$00
3d21 : a2 31 __ LDX #$31
.l1007:
3d23 : 9d a5 ab STA $aba5,x ; (projbuffer + 22)
3d26 : ca __ __ DEX
3d27 : d0 fa __ BNE $3d23 ; (placesignature.l1007 + 0)
.s1003:
3d29 : ad ad 87 LDA $87ad ; (canvas + 5)
3d2c : 85 1b __ STA ACCU + 0 
3d2e : ad ae 87 LDA $87ae ; (canvas + 6)
3d31 : 85 1c __ STA ACCU + 1 
3d33 : ad ab 87 LDA $87ab ; (canvas + 3)
3d36 : 85 03 __ STA WORK + 0 
3d38 : ad ac 87 LDA $87ac ; (canvas + 4)
3d3b : 85 04 __ STA WORK + 1 
3d3d : 20 62 7c JSR $7c62 ; (mul16 + 0)
3d40 : a5 05 __ LDA WORK + 2 
3d42 : 85 4e __ STA T0 + 0 
3d44 : 18 __ __ CLC
3d45 : a5 06 __ LDA WORK + 3 
3d47 : 69 58 __ ADC #$58
3d49 : 85 4f __ STA T0 + 1 
3d4b : a9 a6 __ LDA #$a6
3d4d : a0 02 __ LDY #$02
3d4f : 91 23 __ STA (SP + 0),y 
3d51 : a9 ab __ LDA #$ab
3d53 : c8 __ __ INY
3d54 : 91 23 __ STA (SP + 0),y 
3d56 : a9 b0 __ LDA #$b0
3d58 : c8 __ __ INY
3d59 : 91 23 __ STA (SP + 0),y 
3d5b : a9 3d __ LDA #$3d
3d5d : c8 __ __ INY
3d5e : 91 23 __ STA (SP + 0),y 
3d60 : a9 cc __ LDA #$cc
3d62 : c8 __ __ INY
3d63 : 91 23 __ STA (SP + 0),y 
3d65 : a9 3d __ LDA #$3d
3d67 : c8 __ __ INY
3d68 : 91 23 __ STA (SP + 0),y 
3d6a : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
3d6d : a9 00 __ LDA #$00
3d6f : 85 50 __ STA T2 + 0 
.l1:
3d71 : a9 a6 __ LDA #$a6
3d73 : 85 0d __ STA P0 
3d75 : a9 ab __ LDA #$ab
3d77 : 85 0e __ STA P1 
3d79 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
3d7c : a5 1c __ LDA ACCU + 1 
3d7e : 30 24 __ BMI $3da4 ; (placesignature.s1001 + 0)
.s1006:
3d80 : d0 06 __ BNE $3d88 ; (placesignature.s2 + 0)
.s1004:
3d82 : a5 50 __ LDA T2 + 0 
3d84 : c5 1b __ CMP ACCU + 0 
3d86 : b0 1c __ BCS $3da4 ; (placesignature.s1001 + 0)
.s2:
3d88 : 18 __ __ CLC
3d89 : a5 4e __ LDA T0 + 0 
3d8b : 65 50 __ ADC T2 + 0 
3d8d : 85 0d __ STA P0 
3d8f : a5 4f __ LDA T0 + 1 
3d91 : 69 00 __ ADC #$00
3d93 : 85 0e __ STA P1 
3d95 : a6 50 __ LDX T2 + 0 
3d97 : bd a6 ab LDA $aba6,x ; (chareditor@stack + 19)
3d9a : 85 0f __ STA P2 
3d9c : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
3d9f : e6 50 __ INC T2 + 0 
3da1 : 4c 71 3d JMP $3d71 ; (placesignature.l1 + 0)
.s1001:
3da4 : 18 __ __ CLC
3da5 : a5 23 __ LDA SP + 0 
3da7 : 69 08 __ ADC #$08
3da9 : 85 23 __ STA SP + 0 
3dab : 90 02 __ BCC $3daf ; (placesignature.s1001 + 11)
3dad : e6 24 __ INC SP + 1 
3daf : 60 __ __ RTS
--------------------------------------------------------------------
3db0 : __ __ __ BYT 76 64 63 20 73 43 52 45 45 4e 20 65 44 49 54 4f : vdc sCREEN eDITO
3dc0 : __ __ __ BYT 52 20 25 53 20 78 2e 6d 4f 4c 20 00             : R %S x.mOL .
--------------------------------------------------------------------
3dcc : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 31 35 2d 31 33 32 : V20-20240415-132
3ddc : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
3dde : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 53 54 41 : pRESS KEY TO STA
3dee : __ __ __ BYT 52 54 2e 00                                     : RT..
--------------------------------------------------------------------
change_plotcolor: ; change_plotcolor(u8)->void
.s0:
3df2 : a5 11 __ LDA P4 ; (newval + 0)
3df4 : 8d f1 86 STA $86f1 ; (plotcolor + 0)
3df7 : ad 96 87 LDA $8796 ; (vdc_state + 7)
3dfa : 29 f0 __ AND #$f0
3dfc : 18 __ __ CLC
3dfd : 65 11 __ ADC P4 ; (newval + 0)
3dff : 8d 96 87 STA $8796 ; (vdc_state + 7)
--------------------------------------------------------------------
plotcursor: ; plotcursor()->void
.s0:
3e02 : ad eb 86 LDA $86eb ; (screen_col + 0)
3e05 : 85 0d __ STA P0 
3e07 : ad ed 86 LDA $86ed ; (screen_row + 0)
3e0a : 85 0e __ STA P1 
3e0c : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
3e0f : 85 0f __ STA P2 
3e11 : ad f4 86 LDA $86f4 ; (plotblink + 0)
3e14 : 0a __ __ ASL
3e15 : 0a __ __ ASL
3e16 : 0a __ __ ASL
3e17 : 0a __ __ ASL
3e18 : 18 __ __ CLC
3e19 : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
3e1c : 85 43 __ STA T0 + 0 
3e1e : ad f3 86 LDA $86f3 ; (plotunderline + 0)
3e21 : 4a __ __ LSR
3e22 : 6a __ __ ROR
3e23 : 6a __ __ ROR
3e24 : 29 c0 __ AND #$c0
3e26 : 6a __ __ ROR
3e27 : 65 43 __ ADC T0 + 0 
3e29 : 85 43 __ STA T0 + 0 
3e2b : ad f2 86 LDA $86f2 ; (plotreverse + 0)
3e2e : 4a __ __ LSR
3e2f : 6a __ __ ROR
3e30 : 29 80 __ AND #$80
3e32 : 6a __ __ ROR
3e33 : 65 43 __ ADC T0 + 0 
3e35 : 85 43 __ STA T0 + 0 
3e37 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
3e3a : 4a __ __ LSR
3e3b : a9 00 __ LDA #$00
3e3d : 6a __ __ ROR
3e3e : 65 43 __ ADC T0 + 0 
3e40 : 85 10 __ STA P3 
3e42 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_cursor_toggle@proxy: ; vdcwin_cursor_toggle@proxy
3e45 : a9 b3 __ LDA #$b3
3e47 : 85 0d __ STA P0 
3e49 : a9 87 __ LDA #$87
3e4b : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_cursor_toggle: ; vdcwin_cursor_toggle(struct VDCWin*)->void
.s0:
3e4d : a0 01 __ LDY #$01
3e4f : b1 0d __ LDA (P0),y ; (win + 0)
3e51 : 18 __ __ CLC
3e52 : a0 05 __ LDY #$05
3e54 : 71 0d __ ADC (P0),y ; (win + 0)
3e56 : 0a __ __ ASL
3e57 : aa __ __ TAX
3e58 : 18 __ __ CLC
3e59 : 88 __ __ DEY
3e5a : b1 0d __ LDA (P0),y ; (win + 0)
3e5c : a0 00 __ LDY #$00
3e5e : 71 0d __ ADC (P0),y ; (win + 0)
3e60 : 18 __ __ CLC
3e61 : 7d 00 88 ADC $8800,x ; (multab + 0)
3e64 : a8 __ __ TAY
3e65 : a9 00 __ LDA #$00
3e67 : 7d 01 88 ADC $8801,x ; (multab + 1)
3e6a : a2 12 __ LDX #$12
3e6c : 8e 00 d6 STX $d600 
3e6f : aa __ __ TAX
3e70 : 98 __ __ TYA
3e71 : 18 __ __ CLC
3e72 : 6d 99 87 ADC $8799 ; (vdc_state + 10)
3e75 : a8 __ __ TAY
3e76 : 8a __ __ TXA
3e77 : 6d 9a 87 ADC $879a ; (vdc_state + 11)
.l169:
3e7a : 2c 00 d6 BIT $d600 
3e7d : 10 fb __ BPL $3e7a ; (vdcwin_cursor_toggle.l169 + 0)
.s9:
3e7f : 8d 01 d6 STA $d601 
3e82 : a2 13 __ LDX #$13
3e84 : 8e 00 d6 STX $d600 
.l171:
3e87 : 2c 00 d6 BIT $d600 
3e8a : 10 fb __ BPL $3e87 ; (vdcwin_cursor_toggle.l171 + 0)
.s14:
3e8c : 8c 01 d6 STY $d601 
3e8f : a2 1f __ LDX #$1f
3e91 : 8e 00 d6 STX $d600 
.l173:
3e94 : 2c 00 d6 BIT $d600 
3e97 : 10 fb __ BPL $3e94 ; (vdcwin_cursor_toggle.l173 + 0)
.s18:
3e99 : aa __ __ TAX
3e9a : ad 01 d6 LDA $d601 
3e9d : 49 50 __ EOR #$50
3e9f : 85 1b __ STA ACCU + 0 
3ea1 : a9 12 __ LDA #$12
3ea3 : 8d 00 d6 STA $d600 
.l175:
3ea6 : 2c 00 d6 BIT $d600 
3ea9 : 10 fb __ BPL $3ea6 ; (vdcwin_cursor_toggle.l175 + 0)
.s27:
3eab : 8e 01 d6 STX $d601 
3eae : a9 13 __ LDA #$13
3eb0 : 8d 00 d6 STA $d600 
.l177:
3eb3 : 2c 00 d6 BIT $d600 
3eb6 : 10 fb __ BPL $3eb3 ; (vdcwin_cursor_toggle.l177 + 0)
.s32:
3eb8 : 8c 01 d6 STY $d601 
3ebb : a9 1f __ LDA #$1f
3ebd : 8d 00 d6 STA $d600 
.l179:
3ec0 : 2c 00 d6 BIT $d600 
3ec3 : 10 fb __ BPL $3ec0 ; (vdcwin_cursor_toggle.l179 + 0)
.s36:
3ec5 : a5 1b __ LDA ACCU + 0 
3ec7 : 8d 01 d6 STA $d601 
.s1001:
3eca : 60 __ __ RTS
--------------------------------------------------------------------
3ecb : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
initstatusbar: ; initstatusbar()->void
.s1000:
3ed0 : a5 53 __ LDA T3 + 0 
3ed2 : 8d d5 ab STA $abd5 ; (buff + 48)
.s0:
3ed5 : ae 94 87 LDX $8794 ; (vdc_state + 5)
3ed8 : ca __ __ DEX
3ed9 : 86 52 __ STX T0 + 0 
3edb : ad ee 86 LDA $86ee ; (screen_row + 1)
3ede : d0 07 __ BNE $3ee7 ; (initstatusbar.s3 + 0)
.s1002:
3ee0 : a5 52 __ LDA T0 + 0 
3ee2 : cd ed 86 CMP $86ed ; (screen_row + 0)
3ee5 : f0 71 __ BEQ $3f58 ; (initstatusbar.s1001 + 0)
.s3:
3ee7 : a9 00 __ LDA #$00
3ee9 : 85 0f __ STA P2 
3eeb : a9 20 __ LDA #$20
3eed : 85 11 __ STA P4 
3eef : a9 50 __ LDA #$50
3ef1 : 85 13 __ STA P6 
3ef3 : a5 52 __ LDA T0 + 0 
3ef5 : 85 14 __ STA P7 
3ef7 : a9 01 __ LDA #$01
3ef9 : 85 15 __ STA P8 
3efb : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
3efe : 85 53 __ STA T3 + 0 
3f00 : 8d 96 87 STA $8796 ; (vdc_state + 7)
3f03 : 20 a3 2c JSR $2ca3 ; (vdc_clear.s0 + 0)
3f06 : a9 00 __ LDA #$00
3f08 : 85 11 __ STA P4 
3f0a : a5 52 __ LDA T0 + 0 
3f0c : 85 12 __ STA P5 
3f0e : a9 5e __ LDA #$5e
3f10 : 85 13 __ STA P6 
3f12 : a9 3f __ LDA #$3f
3f14 : 85 14 __ STA P7 
3f16 : 20 3a 81 JSR $813a ; (vdc_prints_attr@proxy + 0)
3f19 : a9 11 __ LDA #$11
3f1b : 85 11 __ STA P4 
3f1d : a9 64 __ LDA #$64
3f1f : 85 13 __ STA P6 
3f21 : a9 3f __ LDA #$3f
3f23 : 85 14 __ STA P7 
3f25 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
3f28 : a9 1f __ LDA #$1f
3f2a : 85 11 __ STA P4 
3f2c : a9 69 __ LDA #$69
3f2e : 85 13 __ STA P6 
3f30 : a9 3f __ LDA #$3f
3f32 : 85 14 __ STA P7 
3f34 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
3f37 : a9 29 __ LDA #$29
3f39 : 85 11 __ STA P4 
3f3b : a9 6f __ LDA #$6f
3f3d : 85 13 __ STA P6 
3f3f : a9 3f __ LDA #$3f
3f41 : 85 14 __ STA P7 
3f43 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
3f46 : a9 49 __ LDA #$49
3f48 : 85 11 __ STA P4 
3f4a : a9 76 __ LDA #$76
3f4c : 85 13 __ STA P6 
3f4e : a9 3f __ LDA #$3f
3f50 : 85 14 __ STA P7 
3f52 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
3f55 : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s1001:
3f58 : ad d5 ab LDA $abd5 ; (buff + 48)
3f5b : 85 53 __ STA T3 + 0 
3f5d : 60 __ __ RTS
--------------------------------------------------------------------
3f5e : __ __ __ BYT 6d 4f 44 45 3a 00                               : mODE:.
--------------------------------------------------------------------
3f64 : __ __ __ BYT 78 2c 79 3a 00                                  : x,y:.
--------------------------------------------------------------------
3f69 : __ __ __ BYT 63 48 41 52 3a 00                               : cHAR:.
--------------------------------------------------------------------
3f6f : __ __ __ BYT 63 4f 4c 4f 52 3a 00                            : cOLOR:.
--------------------------------------------------------------------
3f76 : __ __ __ BYT 66 38 3d 68 45 4c 50 00                         : f8=hELP.
--------------------------------------------------------------------
printstatusbar: ; printstatusbar()->void
.s1000:
3f7e : 38 __ __ SEC
3f7f : a5 23 __ LDA SP + 0 
3f81 : e9 0a __ SBC #$0a
3f83 : 85 23 __ STA SP + 0 
3f85 : b0 02 __ BCS $3f89 ; (printstatusbar.s0 + 0)
3f87 : c6 24 __ DEC SP + 1 
.s0:
3f89 : ae 94 87 LDX $8794 ; (vdc_state + 5)
3f8c : ca __ __ DEX
3f8d : 86 4e __ STX T0 + 0 
3f8f : ad ee 86 LDA $86ee ; (screen_row + 1)
3f92 : d0 0a __ BNE $3f9e ; (printstatusbar.s3 + 0)
.s1002:
3f94 : a5 4e __ LDA T0 + 0 
3f96 : cd ed 86 CMP $86ed ; (screen_row + 0)
3f99 : d0 03 __ BNE $3f9e ; (printstatusbar.s3 + 0)
3f9b : 4c 17 41 JMP $4117 ; (printstatusbar.s1001 + 0)
.s3:
3f9e : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
3fa1 : 85 4f __ STA T3 + 0 
3fa3 : 8d 96 87 STA $8796 ; (vdc_state + 7)
3fa6 : a9 00 __ LDA #$00
3fa8 : a0 02 __ LDY #$02
3faa : 91 23 __ STA (SP + 0),y 
3fac : a9 89 __ LDA #$89
3fae : c8 __ __ INY
3faf : 91 23 __ STA (SP + 0),y 
3fb1 : a9 23 __ LDA #$23
3fb3 : c8 __ __ INY
3fb4 : 91 23 __ STA (SP + 0),y 
3fb6 : a9 41 __ LDA #$41
3fb8 : c8 __ __ INY
3fb9 : 91 23 __ STA (SP + 0),y 
3fbb : a9 e1 __ LDA #$e1
3fbd : c8 __ __ INY
3fbe : 91 23 __ STA (SP + 0),y 
3fc0 : a9 88 __ LDA #$88
3fc2 : c8 __ __ INY
3fc3 : 91 23 __ STA (SP + 0),y 
3fc5 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
3fc8 : a9 06 __ LDA #$06
3fca : 85 11 __ STA P4 
3fcc : 20 c6 81 JSR $81c6 ; (vdc_prints_attr@proxy + 0)
3fcf : a9 00 __ LDA #$00
3fd1 : a0 02 __ LDY #$02
3fd3 : 91 23 __ STA (SP + 0),y 
3fd5 : a9 89 __ LDA #$89
3fd7 : c8 __ __ INY
3fd8 : 91 23 __ STA (SP + 0),y 
3fda : a9 29 __ LDA #$29
3fdc : c8 __ __ INY
3fdd : 91 23 __ STA (SP + 0),y 
3fdf : a9 41 __ LDA #$41
3fe1 : c8 __ __ INY
3fe2 : 91 23 __ STA (SP + 0),y 
3fe4 : ad af 87 LDA $87af ; (canvas + 7)
3fe7 : 18 __ __ CLC
3fe8 : 6d eb 86 ADC $86eb ; (screen_col + 0)
3feb : aa __ __ TAX
3fec : ad b0 87 LDA $87b0 ; (canvas + 8)
3fef : 6d ec 86 ADC $86ec ; (screen_col + 1)
3ff2 : a0 07 __ LDY #$07
3ff4 : 91 23 __ STA (SP + 0),y 
3ff6 : 8a __ __ TXA
3ff7 : 88 __ __ DEY
3ff8 : 91 23 __ STA (SP + 0),y 
3ffa : ad b1 87 LDA $87b1 ; (canvas + 9)
3ffd : 18 __ __ CLC
3ffe : 6d ed 86 ADC $86ed ; (screen_row + 0)
4001 : aa __ __ TAX
4002 : ad b2 87 LDA $87b2 ; (canvas + 10)
4005 : 6d ee 86 ADC $86ee ; (screen_row + 1)
4008 : a0 09 __ LDY #$09
400a : 91 23 __ STA (SP + 0),y 
400c : 8a __ __ TXA
400d : 88 __ __ DEY
400e : 91 23 __ STA (SP + 0),y 
4010 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
4013 : a9 16 __ LDA #$16
4015 : 85 11 __ STA P4 
4017 : 20 c6 81 JSR $81c6 ; (vdc_prints_attr@proxy + 0)
401a : a9 24 __ LDA #$24
401c : 85 0d __ STA P0 
401e : a5 12 __ LDA P5 
4020 : 85 0e __ STA P1 
4022 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
4025 : 85 50 __ STA T6 + 0 
4027 : 85 0f __ STA P2 
4029 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
402c : 85 51 __ STA T7 + 0 
402e : d0 08 __ BNE $4038 ; (printstatusbar.s7 + 0)
.s8:
4030 : 38 __ __ SEC
4031 : a5 4f __ LDA T3 + 0 
4033 : e9 80 __ SBC #$80
4035 : 4c 3a 40 JMP $403a ; (printstatusbar.s9 + 0)
.s7:
4038 : a5 4f __ LDA T3 + 0 
.s9:
403a : 85 10 __ STA P3 
403c : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
403f : a9 00 __ LDA #$00
4041 : a0 02 __ LDY #$02
4043 : 91 23 __ STA (SP + 0),y 
4045 : a9 89 __ LDA #$89
4047 : c8 __ __ INY
4048 : 91 23 __ STA (SP + 0),y 
404a : a9 31 __ LDA #$31
404c : c8 __ __ INY
404d : 91 23 __ STA (SP + 0),y 
404f : a9 41 __ LDA #$41
4051 : c8 __ __ INY
4052 : 91 23 __ STA (SP + 0),y 
4054 : a5 50 __ LDA T6 + 0 
4056 : c8 __ __ INY
4057 : 91 23 __ STA (SP + 0),y 
4059 : a9 00 __ LDA #$00
405b : c8 __ __ INY
405c : 91 23 __ STA (SP + 0),y 
405e : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
4061 : a9 26 __ LDA #$26
4063 : 85 11 __ STA P4 
4065 : 20 c6 81 JSR $81c6 ; (vdc_prints_attr@proxy + 0)
4068 : a9 30 __ LDA #$30
406a : 85 0d __ STA P0 
406c : a5 12 __ LDA P5 
406e : 85 0e __ STA P1 
4070 : a9 20 __ LDA #$20
4072 : 85 0f __ STA P2 
4074 : ad f1 86 LDA $86f1 ; (plotcolor + 0)
4077 : 85 50 __ STA T6 + 0 
4079 : 18 __ __ CLC
407a : 69 40 __ ADC #$40
407c : 85 10 __ STA P3 
407e : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
4081 : a9 00 __ LDA #$00
4083 : a0 02 __ LDY #$02
4085 : 91 23 __ STA (SP + 0),y 
4087 : a9 89 __ LDA #$89
4089 : c8 __ __ INY
408a : 91 23 __ STA (SP + 0),y 
408c : a5 50 __ LDA T6 + 0 
408e : a0 06 __ LDY #$06
4090 : 91 23 __ STA (SP + 0),y 
4092 : a9 00 __ LDA #$00
4094 : c8 __ __ INY
4095 : 91 23 __ STA (SP + 0),y 
4097 : a9 35 __ LDA #$35
4099 : a0 04 __ LDY #$04
409b : 91 23 __ STA (SP + 0),y 
409d : a9 41 __ LDA #$41
409f : c8 __ __ INY
40a0 : 91 23 __ STA (SP + 0),y 
40a2 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
40a5 : a9 32 __ LDA #$32
40a7 : 85 11 __ STA P4 
40a9 : 20 c6 81 JSR $81c6 ; (vdc_prints_attr@proxy + 0)
40ac : a9 36 __ LDA #$36
40ae : 85 11 __ STA P4 
40b0 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
40b3 : d0 07 __ BNE $40bc ; (printstatusbar.s12 + 0)
.s13:
40b5 : a9 41 __ LDA #$41
40b7 : a2 3d __ LDX #$3d
40b9 : 4c c0 40 JMP $40c0 ; (printstatusbar.s35 + 0)
.s12:
40bc : a9 41 __ LDA #$41
40be : a2 39 __ LDX #$39
.s35:
40c0 : 86 13 __ STX P6 
40c2 : 85 14 __ STA P7 
40c4 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
40c7 : a9 3a __ LDA #$3a
40c9 : 85 11 __ STA P4 
40cb : ad f3 86 LDA $86f3 ; (plotunderline + 0)
40ce : d0 07 __ BNE $40d7 ; (printstatusbar.s17 + 0)
.s18:
40d0 : a9 41 __ LDA #$41
40d2 : a2 3d __ LDX #$3d
40d4 : 4c db 40 JMP $40db ; (printstatusbar.s36 + 0)
.s17:
40d7 : a9 41 __ LDA #$41
40d9 : a2 41 __ LDX #$41
.s36:
40db : 86 13 __ STX P6 
40dd : 85 14 __ STA P7 
40df : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
40e2 : a9 3e __ LDA #$3e
40e4 : 85 11 __ STA P4 
40e6 : ad f4 86 LDA $86f4 ; (plotblink + 0)
40e9 : d0 07 __ BNE $40f2 ; (printstatusbar.s22 + 0)
.s23:
40eb : a9 41 __ LDA #$41
40ed : a2 3d __ LDX #$3d
40ef : 4c f6 40 JMP $40f6 ; (printstatusbar.s37 + 0)
.s22:
40f2 : a9 41 __ LDA #$41
40f4 : a2 45 __ LDX #$45
.s37:
40f6 : 86 13 __ STX P6 
40f8 : 85 14 __ STA P7 
40fa : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
40fd : a5 51 __ LDA T7 + 0 
40ff : d0 07 __ BNE $4108 ; (printstatusbar.s27 + 0)
.s28:
4101 : a9 41 __ LDA #$41
4103 : a2 3d __ LDX #$3d
4105 : 4c 0c 41 JMP $410c ; (printstatusbar.s29 + 0)
.s27:
4108 : a9 41 __ LDA #$41
410a : a2 49 __ LDX #$49
.s29:
410c : 86 13 __ STX P6 
410e : 85 14 __ STA P7 
4110 : a9 42 __ LDA #$42
4112 : 85 11 __ STA P4 
4114 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
.s1001:
4117 : 18 __ __ CLC
4118 : a5 23 __ LDA SP + 0 
411a : 69 0a __ ADC #$0a
411c : 85 23 __ STA SP + 0 
411e : 90 02 __ BCC $4122 ; (printstatusbar.s1001 + 11)
4120 : e6 24 __ INC SP + 1 
4122 : 60 __ __ RTS
--------------------------------------------------------------------
4123 : __ __ __ BYT 25 2d 31 30 53 00                               : %-10S.
--------------------------------------------------------------------
4129 : __ __ __ BYT 25 33 55 2c 25 33 55 00                         : %3U,%3U.
--------------------------------------------------------------------
4131 : __ __ __ BYT 25 32 78 00                                     : %2x.
--------------------------------------------------------------------
4135 : __ __ __ BYT 25 32 55 00                                     : %2U.
--------------------------------------------------------------------
4139 : __ __ __ BYT 72 65 76 00                                     : rev.
--------------------------------------------------------------------
413d : __ __ __ BYT 20 20 20 00                                     :    .
--------------------------------------------------------------------
4141 : __ __ __ BYT 75 6e 64 00                                     : und.
--------------------------------------------------------------------
4145 : __ __ __ BYT 62 6c 69 00                                     : bli.
--------------------------------------------------------------------
4149 : __ __ __ BYT 61 6c 74 00                                     : alt.
--------------------------------------------------------------------
plotmove: ; plotmove(u8)->void
.s1000:
414d : a2 06 __ LDX #$06
414f : b5 53 __ LDA T0 + 0,x 
4151 : 9d c0 ab STA $abc0,x ; (projbuffer + 40)
4154 : ca __ __ DEX
4155 : 10 f8 __ BPL $414f ; (plotmove.s1000 + 2)
.s0:
4157 : a9 7f __ LDA #$7f
4159 : 85 0d __ STA P0 
415b : ad eb 86 LDA $86eb ; (screen_col + 0)
415e : 85 53 __ STA T0 + 0 
4160 : 18 __ __ CLC
4161 : 6d af 87 ADC $87af ; (canvas + 7)
4164 : 85 54 __ STA T1 + 0 
4166 : ad b0 87 LDA $87b0 ; (canvas + 8)
4169 : 6d ec 86 ADC $86ec ; (screen_col + 1)
416c : 85 55 __ STA T1 + 1 
416e : ad ed 86 LDA $86ed ; (screen_row + 0)
4171 : 85 56 __ STA T2 + 0 
4173 : 18 __ __ CLC
4174 : 6d b1 87 ADC $87b1 ; (canvas + 9)
4177 : 85 03 __ STA WORK + 0 
4179 : ad b2 87 LDA $87b2 ; (canvas + 10)
417c : 6d ee 86 ADC $86ee ; (screen_row + 1)
417f : 85 04 __ STA WORK + 1 
4181 : ad ab 87 LDA $87ab ; (canvas + 3)
4184 : 85 57 __ STA T4 + 0 
4186 : 85 1b __ STA ACCU + 0 
4188 : ad ac 87 LDA $87ac ; (canvas + 4)
418b : 85 58 __ STA T4 + 1 
418d : 85 1c __ STA ACCU + 1 
418f : 20 62 7c JSR $7c62 ; (mul16 + 0)
4192 : 18 __ __ CLC
4193 : a5 06 __ LDA WORK + 3 
4195 : 69 58 __ ADC #$58
4197 : aa __ __ TAX
4198 : 18 __ __ CLC
4199 : a5 05 __ LDA WORK + 2 
419b : 65 54 __ ADC T1 + 0 
419d : 85 0e __ STA P1 
419f : 8a __ __ TXA
41a0 : 65 55 __ ADC T1 + 1 
41a2 : 85 0f __ STA P2 
41a4 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
41a7 : 85 59 __ STA T5 + 0 
41a9 : ad ad 87 LDA $87ad ; (canvas + 5)
41ac : 85 1b __ STA ACCU + 0 
41ae : ad ae 87 LDA $87ae ; (canvas + 6)
41b1 : 85 1c __ STA ACCU + 1 
41b3 : a5 57 __ LDA T4 + 0 
41b5 : 85 03 __ STA WORK + 0 
41b7 : a5 58 __ LDA T4 + 1 
41b9 : 85 04 __ STA WORK + 1 
41bb : 20 62 7c JSR $7c62 ; (mul16 + 0)
41be : 18 __ __ CLC
41bf : a5 05 __ LDA WORK + 2 
41c1 : 65 0e __ ADC P1 
41c3 : a8 __ __ TAY
41c4 : a5 06 __ LDA WORK + 3 
41c6 : 65 0f __ ADC P2 
41c8 : aa __ __ TAX
41c9 : 98 __ __ TYA
41ca : 18 __ __ CLC
41cb : 69 30 __ ADC #$30
41cd : 85 0e __ STA P1 
41cf : 90 01 __ BCC $41d2 ; (plotmove.s1015 + 0)
.s1014:
41d1 : e8 __ __ INX
.s1015:
41d2 : 86 0f __ STX P2 
41d4 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
41d7 : 85 10 __ STA P3 
41d9 : a5 53 __ LDA T0 + 0 
41db : 85 0d __ STA P0 
41dd : a5 56 __ LDA T2 + 0 
41df : 85 0e __ STA P1 
41e1 : a5 59 __ LDA T5 + 0 
41e3 : 85 0f __ STA P2 
41e5 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
41e8 : ad fc ab LDA $abfc ; (sstack + 9)
41eb : c9 91 __ CMP #$91
41ed : d0 12 __ BNE $4201 ; (plotmove.s13 + 0)
.s8:
41ef : a9 00 __ LDA #$00
41f1 : 8d f8 ab STA $abf8 ; (sstack + 5)
41f4 : 8d f9 ab STA $abf9 ; (sstack + 6)
41f7 : 8d fb ab STA $abfb ; (sstack + 8)
41fa : a9 01 __ LDA #$01
41fc : 8d fa ab STA $abfa ; (sstack + 7)
41ff : d0 16 __ BNE $4217 ; (plotmove.s1012 + 0)
.s13:
4201 : 90 25 __ BCC $4228 ; (plotmove.s15 + 0)
.s14:
4203 : c9 9d __ CMP #$9d
4205 : d0 13 __ BNE $421a ; (plotmove.s1001 + 0)
.s6:
4207 : a9 01 __ LDA #$01
4209 : 8d f8 ab STA $abf8 ; (sstack + 5)
420c : a9 00 __ LDA #$00
420e : 8d f9 ab STA $abf9 ; (sstack + 6)
4211 : 8d fa ab STA $abfa ; (sstack + 7)
.s1013:
4214 : 8d fb ab STA $abfb ; (sstack + 8)
.s1012:
4217 : 20 51 42 JSR $4251 ; (cursormove.s1000 + 0)
.s1001:
421a : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
421d : a2 06 __ LDX #$06
421f : bd c0 ab LDA $abc0,x ; (projbuffer + 40)
4222 : 95 53 __ STA T0 + 0,x 
4224 : ca __ __ DEX
4225 : 10 f8 __ BPL $421f ; (plotmove.s1001 + 5)
4227 : 60 __ __ RTS
.s15:
4228 : c9 11 __ CMP #$11
422a : d0 0f __ BNE $423b ; (plotmove.s16 + 0)
.s9:
422c : a9 00 __ LDA #$00
422e : 8d f8 ab STA $abf8 ; (sstack + 5)
4231 : 8d f9 ab STA $abf9 ; (sstack + 6)
4234 : 8d fa ab STA $abfa ; (sstack + 7)
4237 : a9 01 __ LDA #$01
4239 : d0 d9 __ BNE $4214 ; (plotmove.s1013 + 0)
.s16:
423b : c9 1d __ CMP #$1d
423d : d0 db __ BNE $421a ; (plotmove.s1001 + 0)
.s7:
423f : a9 00 __ LDA #$00
4241 : 8d f8 ab STA $abf8 ; (sstack + 5)
4244 : 8d fa ab STA $abfa ; (sstack + 7)
4247 : 8d fb ab STA $abfb ; (sstack + 8)
424a : a9 01 __ LDA #$01
424c : 8d f9 ab STA $abf9 ; (sstack + 6)
424f : d0 c6 __ BNE $4217 ; (plotmove.s1012 + 0)
--------------------------------------------------------------------
cursormove: ; cursormove(u8,u8,u8,u8)->void
.s1000:
4251 : a2 03 __ LDX #$03
4253 : b5 53 __ LDA T1 + 0,x 
4255 : 9d c9 ab STA $abc9,x ; (buff + 36)
4258 : ca __ __ DEX
4259 : 10 f8 __ BPL $4253 ; (cursormove.s1000 + 2)
.s0:
425b : ad f8 ab LDA $abf8 ; (sstack + 5)
425e : c9 01 __ CMP #$01
4260 : d0 25 __ BNE $4287 ; (cursormove.s56 + 0)
.s1:
4262 : ad eb 86 LDA $86eb ; (screen_col + 0)
4265 : 0d ec 86 ORA $86ec ; (screen_col + 1)
4268 : d0 03 __ BNE $426d ; (cursormove.s5 + 0)
426a : 4c 05 44 JMP $4405 ; (cursormove.s4 + 0)
.s5:
426d : ad eb 86 LDA $86eb ; (screen_col + 0)
4270 : 18 __ __ CLC
4271 : 69 ff __ ADC #$ff
4273 : 8d eb 86 STA $86eb ; (screen_col + 0)
4276 : b0 03 __ BCS $427b ; (cursormove.s1025 + 0)
.s1024:
4278 : ce ec 86 DEC $86ec ; (screen_col + 1)
.s1025:
427b : ad eb 86 LDA $86eb ; (screen_col + 0)
427e : 8d b7 87 STA $87b7 ; (canvas + 15)
4281 : ad ed 86 LDA $86ed ; (screen_row + 0)
4284 : 8d b8 87 STA $87b8 ; (canvas + 16)
.s56:
4287 : ad f9 ab LDA $abf9 ; (sstack + 6)
428a : c9 01 __ CMP #$01
428c : d0 6e __ BNE $42fc ; (cursormove.s59 + 0)
.s12:
428e : ad eb 86 LDA $86eb ; (screen_col + 0)
4291 : 85 53 __ STA T1 + 0 
4293 : ad ec 86 LDA $86ec ; (screen_col + 1)
4296 : 85 54 __ STA T1 + 1 
4298 : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
429b : 85 55 __ STA T2 + 0 
429d : a5 54 __ LDA T1 + 1 
429f : d0 06 __ BNE $42a7 ; (cursormove.s16 + 0)
.s1016:
42a1 : a5 53 __ LDA T1 + 0 
42a3 : c5 55 __ CMP T2 + 0 
42a5 : f0 1e __ BEQ $42c5 ; (cursormove.s15 + 0)
.s16:
42a7 : 18 __ __ CLC
42a8 : a5 53 __ LDA T1 + 0 
42aa : 69 01 __ ADC #$01
42ac : 8d eb 86 STA $86eb ; (screen_col + 0)
42af : a5 54 __ LDA T1 + 1 
42b1 : 69 00 __ ADC #$00
42b3 : 8d ec 86 STA $86ec ; (screen_col + 1)
42b6 : ad eb 86 LDA $86eb ; (screen_col + 0)
42b9 : 8d b7 87 STA $87b7 ; (canvas + 15)
42bc : ad ed 86 LDA $86ed ; (screen_row + 0)
42bf : 8d b8 87 STA $87b8 ; (canvas + 16)
42c2 : 4c fc 42 JMP $42fc ; (cursormove.s59 + 0)
.s15:
42c5 : 18 __ __ CLC
42c6 : 6d af 87 ADC $87af ; (canvas + 7)
42c9 : aa __ __ TAX
42ca : ad b0 87 LDA $87b0 ; (canvas + 8)
42cd : 69 00 __ ADC #$00
42cf : a8 __ __ TAY
42d0 : ad ab 87 LDA $87ab ; (canvas + 3)
42d3 : 38 __ __ SEC
42d4 : e9 01 __ SBC #$01
42d6 : 85 44 __ STA T3 + 0 
42d8 : ad ac 87 LDA $87ac ; (canvas + 4)
42db : e9 00 __ SBC #$00
42dd : 85 45 __ STA T3 + 1 
42df : c4 45 __ CPY T3 + 1 
42e1 : d0 02 __ BNE $42e5 ; (cursormove.s1015 + 0)
.s1014:
42e3 : e4 44 __ CPX T3 + 0 
.s1015:
42e5 : b0 15 __ BCS $42fc ; (cursormove.s59 + 0)
.s18:
42e7 : a5 53 __ LDA T1 + 0 
42e9 : 8d b7 87 STA $87b7 ; (canvas + 15)
42ec : a9 02 __ LDA #$02
42ee : 85 18 __ STA P11 
42f0 : ad ed 86 LDA $86ed ; (screen_row + 0)
42f3 : 8d b8 87 STA $87b8 ; (canvas + 16)
42f6 : 20 28 44 JSR $4428 ; (vdcwin_viewportscroll.s0 + 0)
42f9 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s59:
42fc : ad fa ab LDA $abfa ; (sstack + 7)
42ff : c9 01 __ CMP #$01
4301 : d0 43 __ BNE $4346 ; (cursormove.s62 + 0)
.s23:
4303 : ad ed 86 LDA $86ed ; (screen_row + 0)
4306 : 0d ee 86 ORA $86ee ; (screen_row + 1)
4309 : d0 03 __ BNE $430e ; (cursormove.s27 + 0)
430b : 4c e5 43 JMP $43e5 ; (cursormove.s26 + 0)
.s27:
430e : ad ed 86 LDA $86ed ; (screen_row + 0)
4311 : 18 __ __ CLC
4312 : 69 ff __ ADC #$ff
4314 : 8d ed 86 STA $86ed ; (screen_row + 0)
4317 : b0 03 __ BCS $431c ; (cursormove.s1023 + 0)
.s1022:
4319 : ce ee 86 DEC $86ee ; (screen_row + 1)
.s1023:
431c : ad ed 86 LDA $86ed ; (screen_row + 0)
431f : 8d b8 87 STA $87b8 ; (canvas + 16)
4322 : ad eb 86 LDA $86eb ; (screen_col + 0)
4325 : 8d b7 87 STA $87b7 ; (canvas + 15)
4328 : ad fe 86 LDA $86fe ; (showbar + 0)
432b : f0 19 __ BEQ $4346 ; (cursormove.s62 + 0)
.s37:
432d : ad 94 87 LDA $8794 ; (vdc_state + 5)
4330 : 38 __ __ SEC
4331 : e9 02 __ SBC #$02
4333 : a8 __ __ TAY
4334 : ad 95 87 LDA $8795 ; (vdc_state + 6)
4337 : e9 00 __ SBC #$00
4339 : cd ee 86 CMP $86ee ; (screen_row + 1)
433c : d0 08 __ BNE $4346 ; (cursormove.s62 + 0)
.s1010:
433e : cc ed 86 CPY $86ed ; (screen_row + 0)
4341 : d0 03 __ BNE $4346 ; (cursormove.s62 + 0)
.s75:
4343 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s62:
4346 : ad fb ab LDA $abfb ; (sstack + 8)
4349 : c9 01 __ CMP #$01
434b : f0 03 __ BEQ $4350 ; (cursormove.s38 + 0)
434d : 4c da 43 JMP $43da ; (cursormove.s1001 + 0)
.s38:
4350 : ad 94 87 LDA $8794 ; (vdc_state + 5)
4353 : 38 __ __ SEC
4354 : e9 02 __ SBC #$02
4356 : 85 53 __ STA T1 + 0 
4358 : ad 95 87 LDA $8795 ; (vdc_state + 6)
435b : e9 00 __ SBC #$00
435d : 85 54 __ STA T1 + 1 
435f : ad ed 86 LDA $86ed ; (screen_row + 0)
4362 : 85 55 __ STA T2 + 0 
4364 : ad ee 86 LDA $86ee ; (screen_row + 1)
4367 : 85 56 __ STA T2 + 1 
4369 : c5 54 __ CMP T1 + 1 
436b : d0 09 __ BNE $4376 ; (cursormove.s64 + 0)
.s1006:
436d : a5 55 __ LDA T2 + 0 
436f : c5 53 __ CMP T1 + 0 
4371 : d0 03 __ BNE $4376 ; (cursormove.s64 + 0)
.s41:
4373 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
.s64:
4376 : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
4379 : 85 53 __ STA T1 + 0 
437b : a5 56 __ LDA T2 + 1 
437d : d0 06 __ BNE $4385 ; (cursormove.s46 + 0)
.s1004:
437f : a5 55 __ LDA T2 + 0 
4381 : c5 53 __ CMP T1 + 0 
4383 : f0 1e __ BEQ $43a3 ; (cursormove.s45 + 0)
.s46:
4385 : 18 __ __ CLC
4386 : a5 55 __ LDA T2 + 0 
4388 : 69 01 __ ADC #$01
438a : 8d ed 86 STA $86ed ; (screen_row + 0)
438d : a5 56 __ LDA T2 + 1 
438f : 69 00 __ ADC #$00
4391 : 8d ee 86 STA $86ee ; (screen_row + 1)
4394 : ad ed 86 LDA $86ed ; (screen_row + 0)
4397 : 8d b8 87 STA $87b8 ; (canvas + 16)
439a : ad eb 86 LDA $86eb ; (screen_col + 0)
439d : 8d b7 87 STA $87b7 ; (canvas + 15)
43a0 : 4c da 43 JMP $43da ; (cursormove.s1001 + 0)
.s45:
43a3 : 18 __ __ CLC
43a4 : 6d b1 87 ADC $87b1 ; (canvas + 9)
43a7 : aa __ __ TAX
43a8 : ad b2 87 LDA $87b2 ; (canvas + 10)
43ab : 69 00 __ ADC #$00
43ad : a8 __ __ TAY
43ae : ad ad 87 LDA $87ad ; (canvas + 5)
43b1 : 38 __ __ SEC
43b2 : e9 01 __ SBC #$01
43b4 : 85 44 __ STA T3 + 0 
43b6 : ad ae 87 LDA $87ae ; (canvas + 6)
43b9 : e9 00 __ SBC #$00
43bb : 85 45 __ STA T3 + 1 
43bd : c4 45 __ CPY T3 + 1 
43bf : d0 02 __ BNE $43c3 ; (cursormove.s1003 + 0)
.s1002:
43c1 : e4 44 __ CPX T3 + 0 
.s1003:
43c3 : b0 15 __ BCS $43da ; (cursormove.s1001 + 0)
.s48:
43c5 : a5 55 __ LDA T2 + 0 
43c7 : 8d b8 87 STA $87b8 ; (canvas + 16)
43ca : a9 04 __ LDA #$04
43cc : 85 18 __ STA P11 
43ce : ad eb 86 LDA $86eb ; (screen_col + 0)
43d1 : 8d b7 87 STA $87b7 ; (canvas + 15)
43d4 : 20 28 44 JSR $4428 ; (vdcwin_viewportscroll.s0 + 0)
43d7 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s1001:
43da : a2 03 __ LDX #$03
43dc : bd c9 ab LDA $abc9,x ; (buff + 36)
43df : 95 53 __ STA T1 + 0,x 
43e1 : ca __ __ DEX
43e2 : 10 f8 __ BPL $43dc ; (cursormove.s1001 + 2)
43e4 : 60 __ __ RTS
.s26:
43e5 : ad b1 87 LDA $87b1 ; (canvas + 9)
43e8 : 0d b2 87 ORA $87b2 ; (canvas + 10)
43eb : d0 03 __ BNE $43f0 ; (cursormove.s29 + 0)
43ed : 4c 46 43 JMP $4346 ; (cursormove.s62 + 0)
.s29:
43f0 : a9 00 __ LDA #$00
43f2 : 8d b8 87 STA $87b8 ; (canvas + 16)
43f5 : a9 08 __ LDA #$08
43f7 : 85 18 __ STA P11 
43f9 : ad eb 86 LDA $86eb ; (screen_col + 0)
43fc : 8d b7 87 STA $87b7 ; (canvas + 15)
43ff : 20 28 44 JSR $4428 ; (vdcwin_viewportscroll.s0 + 0)
4402 : 4c 43 43 JMP $4343 ; (cursormove.s75 + 0)
.s4:
4405 : ad af 87 LDA $87af ; (canvas + 7)
4408 : 0d b0 87 ORA $87b0 ; (canvas + 8)
440b : d0 03 __ BNE $4410 ; (cursormove.s7 + 0)
440d : 4c 87 42 JMP $4287 ; (cursormove.s56 + 0)
.s7:
4410 : a9 00 __ LDA #$00
4412 : 8d b7 87 STA $87b7 ; (canvas + 15)
4415 : a9 01 __ LDA #$01
4417 : 85 18 __ STA P11 
4419 : ad ed 86 LDA $86ed ; (screen_row + 0)
441c : 8d b8 87 STA $87b8 ; (canvas + 16)
441f : 20 28 44 JSR $4428 ; (vdcwin_viewportscroll.s0 + 0)
4422 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
4425 : 4c 87 42 JMP $4287 ; (cursormove.s56 + 0)
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s0:
4428 : a2 15 __ LDX #$15
.l1002:
442a : bd a7 87 LDA $87a7,x ; (vdc_state + 24)
442d : 9d cc ab STA $abcc,x ; (buff + 39)
4430 : ca __ __ DEX
4431 : d0 f7 __ BNE $442a ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
4433 : a5 18 __ LDA P11 ; (direction + 0)
4435 : 4a __ __ LSR
4436 : 90 2b __ BCC $4463 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
4438 : 20 71 46 JSR $4671 ; (vdcwin_scroll_right@proxy + 0)
443b : a9 01 __ LDA #$01
443d : 85 11 __ STA P4 
443f : ad d4 ab LDA $abd4 ; (buff + 47)
4442 : 18 __ __ CLC
4443 : 69 ff __ ADC #$ff
4445 : 8d d4 ab STA $abd4 ; (buff + 47)
4448 : b0 03 __ BCS $444d ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
444a : ce d5 ab DEC $abd5 ; (buff + 48)
.s1005:
444d : ad af 87 LDA $87af ; (canvas + 7)
4450 : 18 __ __ CLC
4451 : 69 ff __ ADC #$ff
4453 : 8d af 87 STA $87af ; (canvas + 7)
4456 : b0 03 __ BCS $445b ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
4458 : ce b0 87 DEC $87b0 ; (canvas + 8)
.s1007:
445b : ad b6 87 LDA $87b6 ; (canvas + 14)
445e : 85 12 __ STA P5 
4460 : 20 fc 30 JSR $30fc ; (vdcwin_init@proxy + 0)
.s14:
4463 : a5 18 __ LDA P11 ; (direction + 0)
4465 : 29 02 __ AND #$02
4467 : f0 3f __ BEQ $44a8 ; (vdcwin_viewportscroll.s15 + 0)
.s4:
4469 : 20 48 48 JSR $4848 ; (vdcwin_scroll_left@proxy + 0)
446c : a9 01 __ LDA #$01
446e : 85 11 __ STA P4 
4470 : ad d4 ab LDA $abd4 ; (buff + 47)
4473 : 18 __ __ CLC
4474 : 6d b5 87 ADC $87b5 ; (canvas + 13)
4477 : 8d d4 ab STA $abd4 ; (buff + 47)
447a : 90 03 __ BCC $447f ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
447c : ee d5 ab INC $abd5 ; (buff + 48)
.s1009:
447f : ee af 87 INC $87af ; (canvas + 7)
4482 : d0 03 __ BNE $4487 ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
4484 : ee b0 87 INC $87b0 ; (canvas + 8)
.s1011:
4487 : a9 d8 __ LDA #$d8
4489 : 85 0d __ STA P0 
448b : a9 ab __ LDA #$ab
448d : 85 0e __ STA P1 
448f : ad b3 87 LDA $87b3 ; (canvas + 11)
4492 : 18 __ __ CLC
4493 : 6d b5 87 ADC $87b5 ; (canvas + 13)
4496 : 38 __ __ SEC
4497 : e9 01 __ SBC #$01
4499 : 85 0f __ STA P2 
449b : ad b4 87 LDA $87b4 ; (canvas + 12)
449e : 85 10 __ STA P3 
44a0 : ad b6 87 LDA $87b6 ; (canvas + 14)
44a3 : 85 12 __ STA P5 
44a5 : 20 0e 31 JSR $310e ; (vdcwin_init.s0 + 0)
.s15:
44a8 : a5 18 __ LDA P11 ; (direction + 0)
44aa : 29 08 __ AND #$08
44ac : f0 2b __ BEQ $44d9 ; (vdcwin_viewportscroll.s16 + 0)
.s7:
44ae : 20 3a 49 JSR $493a ; (vdcwin_scroll_down@proxy + 0)
44b1 : a9 01 __ LDA #$01
44b3 : 85 12 __ STA P5 
44b5 : ad d6 ab LDA $abd6 ; (buff + 49)
44b8 : 18 __ __ CLC
44b9 : 69 ff __ ADC #$ff
44bb : 8d d6 ab STA $abd6 ; (buff + 49)
44be : b0 03 __ BCS $44c3 ; (vdcwin_viewportscroll.s1013 + 0)
.s1012:
44c0 : ce d7 ab DEC $abd7 ; (vp_fill + 10)
.s1013:
44c3 : ad b1 87 LDA $87b1 ; (canvas + 9)
44c6 : 18 __ __ CLC
44c7 : 69 ff __ ADC #$ff
44c9 : 8d b1 87 STA $87b1 ; (canvas + 9)
44cc : b0 03 __ BCS $44d1 ; (vdcwin_viewportscroll.s1015 + 0)
.s1014:
44ce : ce b2 87 DEC $87b2 ; (canvas + 10)
.s1015:
44d1 : ad b5 87 LDA $87b5 ; (canvas + 13)
44d4 : 85 11 __ STA P4 
44d6 : 20 fc 30 JSR $30fc ; (vdcwin_init@proxy + 0)
.s16:
44d9 : a5 18 __ LDA P11 ; (direction + 0)
44db : 29 04 __ AND #$04
44dd : f0 3f __ BEQ $451e ; (vdcwin_viewportscroll.s12 + 0)
.s10:
44df : 20 e3 49 JSR $49e3 ; (vdcwin_scroll_up@proxy + 0)
44e2 : a9 01 __ LDA #$01
44e4 : 85 12 __ STA P5 
44e6 : ad d6 ab LDA $abd6 ; (buff + 49)
44e9 : 18 __ __ CLC
44ea : 6d b6 87 ADC $87b6 ; (canvas + 14)
44ed : 8d d6 ab STA $abd6 ; (buff + 49)
44f0 : 90 03 __ BCC $44f5 ; (vdcwin_viewportscroll.s1017 + 0)
.s1016:
44f2 : ee d7 ab INC $abd7 ; (vp_fill + 10)
.s1017:
44f5 : ee b1 87 INC $87b1 ; (canvas + 9)
44f8 : d0 03 __ BNE $44fd ; (vdcwin_viewportscroll.s1019 + 0)
.s1018:
44fa : ee b2 87 INC $87b2 ; (canvas + 10)
.s1019:
44fd : a9 d8 __ LDA #$d8
44ff : 85 0d __ STA P0 
4501 : a9 ab __ LDA #$ab
4503 : 85 0e __ STA P1 
4505 : ad b3 87 LDA $87b3 ; (canvas + 11)
4508 : 85 0f __ STA P2 
450a : ad b4 87 LDA $87b4 ; (canvas + 12)
450d : 18 __ __ CLC
450e : 6d b6 87 ADC $87b6 ; (canvas + 14)
4511 : 38 __ __ SEC
4512 : e9 01 __ SBC #$01
4514 : 85 10 __ STA P3 
4516 : ad b5 87 LDA $87b5 ; (canvas + 13)
4519 : 85 11 __ STA P4 
451b : 20 0e 31 JSR $310e ; (vdcwin_init.s0 + 0)
.s12:
451e : a9 cd __ LDA #$cd
4520 : 85 16 __ STA P9 
4522 : a9 ab __ LDA #$ab
4524 : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
4526 : a5 16 __ LDA P9 ; (viewport + 0)
4528 : 85 44 __ STA T0 + 0 
452a : a5 17 __ LDA P10 ; (viewport + 1)
452c : 85 45 __ STA T0 + 1 
452e : a0 09 __ LDY #$09
4530 : b1 16 __ LDA (P9),y ; (viewport + 0)
4532 : 85 1b __ STA ACCU + 0 
4534 : c8 __ __ INY
4535 : b1 16 __ LDA (P9),y ; (viewport + 0)
4537 : 85 1c __ STA ACCU + 1 
4539 : a0 03 __ LDY #$03
453b : b1 16 __ LDA (P9),y ; (viewport + 0)
453d : 85 03 __ STA WORK + 0 
453f : c8 __ __ INY
4540 : b1 16 __ LDA (P9),y ; (viewport + 0)
4542 : 85 04 __ STA WORK + 1 
4544 : 20 62 7c JSR $7c62 ; (mul16 + 0)
4547 : a0 01 __ LDY #$01
4549 : b1 16 __ LDA (P9),y ; (viewport + 0)
454b : 18 __ __ CLC
454c : 65 05 __ ADC WORK + 2 
454e : aa __ __ TAX
454f : c8 __ __ INY
4550 : b1 16 __ LDA (P9),y ; (viewport + 0)
4552 : 65 06 __ ADC WORK + 3 
4554 : 85 47 __ STA T1 + 1 
4556 : 8a __ __ TXA
4557 : 18 __ __ CLC
4558 : a0 07 __ LDY #$07
455a : 71 16 __ ADC (P9),y ; (viewport + 0)
455c : 85 46 __ STA T1 + 0 
455e : a5 47 __ LDA T1 + 1 
4560 : c8 __ __ INY
4561 : 71 16 __ ADC (P9),y ; (viewport + 0)
4563 : 85 47 __ STA T1 + 1 
4565 : a9 00 __ LDA #$00
4567 : 85 4a __ STA T3 + 0 
4569 : a0 11 __ LDY #$11
456b : b1 16 __ LDA (P9),y ; (viewport + 0)
456d : aa __ __ TAX
456e : c8 __ __ INY
456f : b1 16 __ LDA (P9),y ; (viewport + 0)
4571 : 4c ad 45 JMP $45ad ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
4574 : 86 0f __ STX P2 
4576 : a5 46 __ LDA T1 + 0 
4578 : 85 12 __ STA P5 
457a : a5 47 __ LDA T1 + 1 
457c : 85 13 __ STA P6 
457e : a0 00 __ LDY #$00
4580 : 84 15 __ STY P8 
4582 : b1 44 __ LDA (T0 + 0),y 
4584 : 85 11 __ STA P4 
4586 : a0 0d __ LDY #$0d
4588 : b1 44 __ LDA (T0 + 0),y 
458a : 85 14 __ STA P7 
458c : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
458f : a5 46 __ LDA T1 + 0 
4591 : 18 __ __ CLC
4592 : a0 03 __ LDY #$03
4594 : 71 44 __ ADC (T0 + 0),y 
4596 : 85 46 __ STA T1 + 0 
4598 : a5 47 __ LDA T1 + 1 
459a : c8 __ __ INY
459b : 71 44 __ ADC (T0 + 0),y 
459d : 85 47 __ STA T1 + 1 
459f : ad 92 87 LDA $8792 ; (vdc_state + 3)
45a2 : 18 __ __ CLC
45a3 : 65 0f __ ADC P2 
45a5 : aa __ __ TAX
45a6 : ad 93 87 LDA $8793 ; (vdc_state + 4)
45a9 : 65 10 __ ADC P3 
45ab : e6 4a __ INC T3 + 0 
.l1:
45ad : 85 10 __ STA P3 
45af : a5 4a __ LDA T3 + 0 
45b1 : a0 0e __ LDY #$0e
45b3 : d1 44 __ CMP (T0 + 0),y 
45b5 : 90 bd __ BCC $4574 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
45b7 : a0 03 __ LDY #$03
45b9 : b1 44 __ LDA (T0 + 0),y 
45bb : 85 46 __ STA T1 + 0 
45bd : 85 03 __ STA WORK + 0 
45bf : c8 __ __ INY
45c0 : b1 44 __ LDA (T0 + 0),y 
45c2 : 85 47 __ STA T1 + 1 
45c4 : 85 04 __ STA WORK + 1 
45c6 : a0 09 __ LDY #$09
45c8 : b1 44 __ LDA (T0 + 0),y 
45ca : 85 1b __ STA ACCU + 0 
45cc : c8 __ __ INY
45cd : b1 44 __ LDA (T0 + 0),y 
45cf : 85 1c __ STA ACCU + 1 
45d1 : 20 62 7c JSR $7c62 ; (mul16 + 0)
45d4 : a0 01 __ LDY #$01
45d6 : b1 44 __ LDA (T0 + 0),y 
45d8 : 18 __ __ CLC
45d9 : 65 05 __ ADC WORK + 2 
45db : aa __ __ TAX
45dc : c8 __ __ INY
45dd : b1 44 __ LDA (T0 + 0),y 
45df : 65 06 __ ADC WORK + 3 
45e1 : 85 49 __ STA T2 + 1 
45e3 : 8a __ __ TXA
45e4 : 18 __ __ CLC
45e5 : a0 07 __ LDY #$07
45e7 : 71 44 __ ADC (T0 + 0),y 
45e9 : 85 48 __ STA T2 + 0 
45eb : a5 49 __ LDA T2 + 1 
45ed : c8 __ __ INY
45ee : 71 44 __ ADC (T0 + 0),y 
45f0 : 85 49 __ STA T2 + 1 
45f2 : a0 05 __ LDY #$05
45f4 : b1 44 __ LDA (T0 + 0),y 
45f6 : 85 1b __ STA ACCU + 0 
45f8 : c8 __ __ INY
45f9 : b1 44 __ LDA (T0 + 0),y 
45fb : 85 1c __ STA ACCU + 1 
45fd : a5 46 __ LDA T1 + 0 
45ff : 85 03 __ STA WORK + 0 
4601 : a5 47 __ LDA T1 + 1 
4603 : 85 04 __ STA WORK + 1 
4605 : 20 62 7c JSR $7c62 ; (mul16 + 0)
4608 : 18 __ __ CLC
4609 : a5 48 __ LDA T2 + 0 
460b : 65 05 __ ADC WORK + 2 
460d : aa __ __ TAX
460e : a5 49 __ LDA T2 + 1 
4610 : 65 06 __ ADC WORK + 3 
4612 : a8 __ __ TAY
4613 : 8a __ __ TXA
4614 : 18 __ __ CLC
4615 : 69 30 __ ADC #$30
4617 : 85 46 __ STA T1 + 0 
4619 : 90 01 __ BCC $461c ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
461b : c8 __ __ INY
.s1007:
461c : 84 47 __ STY T1 + 1 
461e : a9 00 __ LDA #$00
4620 : 85 4a __ STA T3 + 0 
4622 : a0 13 __ LDY #$13
4624 : b1 44 __ LDA (T0 + 0),y 
4626 : aa __ __ TAX
4627 : c8 __ __ INY
4628 : b1 44 __ LDA (T0 + 0),y 
462a : 4c 66 46 JMP $4666 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
462d : 86 0f __ STX P2 
462f : a5 46 __ LDA T1 + 0 
4631 : 85 12 __ STA P5 
4633 : a5 47 __ LDA T1 + 1 
4635 : 85 13 __ STA P6 
4637 : a0 00 __ LDY #$00
4639 : 84 15 __ STY P8 
463b : b1 16 __ LDA (P9),y ; (viewport + 0)
463d : 85 11 __ STA P4 
463f : a0 0d __ LDY #$0d
4641 : b1 16 __ LDA (P9),y ; (viewport + 0)
4643 : 85 14 __ STA P7 
4645 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
4648 : a5 46 __ LDA T1 + 0 
464a : 18 __ __ CLC
464b : a0 03 __ LDY #$03
464d : 71 16 __ ADC (P9),y ; (viewport + 0)
464f : 85 46 __ STA T1 + 0 
4651 : a5 47 __ LDA T1 + 1 
4653 : c8 __ __ INY
4654 : 71 16 __ ADC (P9),y ; (viewport + 0)
4656 : 85 47 __ STA T1 + 1 
4658 : ad 92 87 LDA $8792 ; (vdc_state + 3)
465b : 18 __ __ CLC
465c : 65 0f __ ADC P2 
465e : aa __ __ TAX
465f : ad 93 87 LDA $8793 ; (vdc_state + 4)
4662 : 65 10 __ ADC P3 
4664 : e6 4a __ INC T3 + 0 
.l5:
4666 : 85 10 __ STA P3 
4668 : a5 4a __ LDA T3 + 0 
466a : a0 0e __ LDY #$0e
466c : d1 16 __ CMP (P9),y ; (viewport + 0)
466e : 90 bd __ BCC $462d ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
4670 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right@proxy: ; vdcwin_scroll_right@proxy
4671 : a9 b3 __ LDA #$b3
4673 : 85 16 __ STA P9 
4675 : a9 87 __ LDA #$87
4677 : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
4679 : a5 53 __ LDA T8 + 0 
467b : 8d ed ab STA $abed ; (palette_draw@stack + 14)
467e : a5 54 __ LDA T8 + 1 
4680 : 8d ee ab STA $abee ; (palette_draw@stack + 15)
.s0:
4683 : a0 02 __ LDY #$02
4685 : b1 16 __ LDA (P9),y ; (win + 0)
4687 : 38 __ __ SEC
4688 : e9 01 __ SBC #$01
468a : 85 47 __ STA T2 + 0 
468c : a9 00 __ LDA #$00
468e : 85 46 __ STA T1 + 0 
4690 : a0 06 __ LDY #$06
4692 : b1 16 __ LDA (P9),y ; (win + 0)
4694 : 85 48 __ STA T3 + 0 
4696 : c8 __ __ INY
4697 : b1 16 __ LDA (P9),y ; (win + 0)
4699 : 85 49 __ STA T3 + 1 
469b : c8 __ __ INY
469c : b1 16 __ LDA (P9),y ; (win + 0)
469e : 85 4a __ STA T4 + 0 
46a0 : c8 __ __ INY
46a1 : b1 16 __ LDA (P9),y ; (win + 0)
.l1:
46a3 : 85 4b __ STA T4 + 1 
46a5 : a5 46 __ LDA T1 + 0 
46a7 : a0 03 __ LDY #$03
46a9 : d1 16 __ CMP (P9),y ; (win + 0)
46ab : 90 0b __ BCC $46b8 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
46ad : ad ed ab LDA $abed ; (palette_draw@stack + 14)
46b0 : 85 53 __ STA T8 + 0 
46b2 : ad ee ab LDA $abee ; (palette_draw@stack + 15)
46b5 : 85 54 __ STA T8 + 1 
46b7 : 60 __ __ RTS
.s2:
46b8 : a5 48 __ LDA T3 + 0 
46ba : 69 01 __ ADC #$01
46bc : 85 4c __ STA T6 + 0 
46be : a5 49 __ LDA T3 + 1 
46c0 : 69 00 __ ADC #$00
46c2 : 85 4d __ STA T6 + 1 
46c4 : 18 __ __ CLC
46c5 : a5 4a __ LDA T4 + 0 
46c7 : 69 01 __ ADC #$01
46c9 : 85 4e __ STA T7 + 0 
46cb : a5 4b __ LDA T4 + 1 
46cd : 69 00 __ ADC #$00
46cf : 85 4f __ STA T7 + 1 
46d1 : ad 90 87 LDA $8790 ; (vdc_state + 1)
46d4 : d0 0c __ BNE $46e2 ; (vdcwin_scroll_right.s7 + 0)
.s9:
46d6 : cc 9c 87 CPY $879c ; (vdc_state + 13)
46d9 : d0 05 __ BNE $46e0 ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
46db : a9 ff __ LDA #$ff
46dd : cd 9b 87 CMP $879b ; (vdc_state + 12)
.s1003:
46e0 : 90 4d __ BCC $472f ; (vdcwin_scroll_right.s6 + 0)
.s7:
46e2 : a5 48 __ LDA T3 + 0 
46e4 : 85 11 __ STA P4 
46e6 : a5 49 __ LDA T3 + 1 
46e8 : 85 12 __ STA P5 
46ea : ad 9b 87 LDA $879b ; (vdc_state + 12)
46ed : 85 53 __ STA T8 + 0 
46ef : 85 0f __ STA P2 
46f1 : ad 9c 87 LDA $879c ; (vdc_state + 13)
46f4 : 85 54 __ STA T8 + 1 
46f6 : 85 10 __ STA P3 
46f8 : 20 7c 47 JSR $477c ; (vdc_block_copy@proxy + 0)
46fb : a5 53 __ LDA T8 + 0 
46fd : 85 11 __ STA P4 
46ff : a5 54 __ LDA T8 + 1 
4701 : 85 12 __ STA P5 
4703 : 20 99 80 JSR $8099 ; (vdc_block_copy@proxy + 0)
4706 : a5 53 __ LDA T8 + 0 
4708 : 85 0f __ STA P2 
470a : a5 54 __ LDA T8 + 1 
470c : 85 10 __ STA P3 
470e : a5 4a __ LDA T4 + 0 
4710 : 85 11 __ STA P4 
4712 : a5 4b __ LDA T4 + 1 
4714 : 85 12 __ STA P5 
4716 : 20 84 47 JSR $4784 ; (vdc_block_copy.s0 + 0)
4719 : a5 4e __ LDA T7 + 0 
471b : 85 0f __ STA P2 
471d : a5 4f __ LDA T7 + 1 
471f : 85 10 __ STA P3 
4721 : a5 53 __ LDA T8 + 0 
4723 : 85 11 __ STA P4 
4725 : a5 54 __ LDA T8 + 1 
4727 : 85 12 __ STA P5 
4729 : 20 84 47 JSR $4784 ; (vdc_block_copy.s0 + 0)
472c : 4c 5b 47 JMP $475b ; (vdcwin_scroll_right.s5 + 0)
.s6:
472f : a5 48 __ LDA T3 + 0 
4731 : 85 10 __ STA P3 
4733 : a5 49 __ LDA T3 + 1 
4735 : 85 11 __ STA P4 
4737 : 20 fc 13 JSR $13fc ; (bnk_cpyfromvdc@proxy + 0)
473a : a5 4c __ LDA T6 + 0 
473c : 85 0f __ STA P2 
473e : a5 4d __ LDA T6 + 1 
4740 : 85 10 __ STA P3 
4742 : 20 a1 13 JSR $13a1 ; (bnk_cpytovdc@proxy + 0)
4745 : a5 4a __ LDA T4 + 0 
4747 : 85 10 __ STA P3 
4749 : a5 4b __ LDA T4 + 1 
474b : 85 11 __ STA P4 
474d : 20 4e 1a JSR $1a4e ; (bnk_cpyfromvdc@proxy + 0)
4750 : a5 4e __ LDA T7 + 0 
4752 : 85 0f __ STA P2 
4754 : a5 4f __ LDA T7 + 1 
4756 : 85 10 __ STA P3 
4758 : 20 34 1a JSR $1a34 ; (bnk_cpytovdc@proxy + 0)
.s5:
475b : ad 92 87 LDA $8792 ; (vdc_state + 3)
475e : 18 __ __ CLC
475f : 65 48 __ ADC T3 + 0 
4761 : 85 48 __ STA T3 + 0 
4763 : ad 93 87 LDA $8793 ; (vdc_state + 4)
4766 : 65 49 __ ADC T3 + 1 
4768 : 85 49 __ STA T3 + 1 
476a : 18 __ __ CLC
476b : a5 4a __ LDA T4 + 0 
476d : 6d 92 87 ADC $8792 ; (vdc_state + 3)
4770 : 85 4a __ STA T4 + 0 
4772 : a5 4b __ LDA T4 + 1 
4774 : 6d 93 87 ADC $8793 ; (vdc_state + 4)
4777 : e6 46 __ INC T1 + 0 
4779 : 4c a3 46 JMP $46a3 ; (vdcwin_scroll_right.l1 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
477c : a5 47 __ LDA $47 
477e : 85 13 __ STA P6 
4780 : a9 00 __ LDA #$00
4782 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
4784 : a5 14 __ LDA P7 ; (length + 1)
4786 : d0 52 __ BNE $47da ; (vdc_block_copy.s73 + 0)
.s4:
4788 : 20 75 2d JSR $2d75 ; (vdc_mem_addr@proxy + 0)
478b : a9 18 __ LDA #$18
478d : 8d 00 d6 STA $d600 
.l332:
4790 : 2c 00 d6 BIT $d600 
4793 : 10 fb __ BPL $4790 ; (vdc_block_copy.l332 + 0)
.s40:
4795 : ad 01 d6 LDA $d601 
4798 : 09 80 __ ORA #$80
479a : a2 18 __ LDX #$18
479c : 8e 00 d6 STX $d600 
.l334:
479f : 2c 00 d6 BIT $d600 
47a2 : 10 fb __ BPL $479f ; (vdc_block_copy.l334 + 0)
.s46:
47a4 : 8d 01 d6 STA $d601 
47a7 : a9 20 __ LDA #$20
47a9 : 8d 00 d6 STA $d600 
.l336:
47ac : 2c 00 d6 BIT $d600 
47af : 10 fb __ BPL $47ac ; (vdc_block_copy.l336 + 0)
.s51:
47b1 : a5 12 __ LDA P5 ; (src + 1)
47b3 : 8d 01 d6 STA $d601 
47b6 : a9 21 __ LDA #$21
47b8 : 8d 00 d6 STA $d600 
.l338:
47bb : 2c 00 d6 BIT $d600 
47be : 10 fb __ BPL $47bb ; (vdc_block_copy.l338 + 0)
.s56:
47c0 : a5 11 __ LDA P4 ; (src + 0)
47c2 : 8d 01 d6 STA $d601 
47c5 : a9 1f __ LDA #$1f
47c7 : 8d 00 d6 STA $d600 
47ca : a9 1e __ LDA #$1e
47cc : 8d 00 d6 STA $d600 
.l340:
47cf : 2c 00 d6 BIT $d600 
47d2 : 10 fb __ BPL $47cf ; (vdc_block_copy.l340 + 0)
.s62:
47d4 : a5 13 __ LDA P6 ; (length + 0)
47d6 : 8d 01 d6 STA $d601 
.s1001:
47d9 : 60 __ __ RTS
.s73:
47da : 85 45 __ STA T2 + 0 
47dc : a5 10 __ LDA P3 ; (dest + 1)
47de : 85 44 __ STA T0 + 1 
47e0 : a5 0f __ LDA P2 ; (dest + 0)
47e2 : 85 0d __ STA P0 
.l2:
47e4 : 20 e1 81 JSR $81e1 ; (vdc_mem_addr@proxy + 0)
47e7 : a9 18 __ LDA #$18
47e9 : 8d 00 d6 STA $d600 
.l321:
47ec : 2c 00 d6 BIT $d600 
47ef : 10 fb __ BPL $47ec ; (vdc_block_copy.l321 + 0)
.s11:
47f1 : ad 01 d6 LDA $d601 
47f4 : 09 80 __ ORA #$80
47f6 : a2 18 __ LDX #$18
47f8 : 8e 00 d6 STX $d600 
.l323:
47fb : 2c 00 d6 BIT $d600 
47fe : 10 fb __ BPL $47fb ; (vdc_block_copy.l323 + 0)
.s17:
4800 : 8d 01 d6 STA $d601 
4803 : a9 20 __ LDA #$20
4805 : 8d 00 d6 STA $d600 
.l325:
4808 : 2c 00 d6 BIT $d600 
480b : 10 fb __ BPL $4808 ; (vdc_block_copy.l325 + 0)
.s22:
480d : a5 12 __ LDA P5 ; (src + 1)
480f : 8d 01 d6 STA $d601 
4812 : a9 21 __ LDA #$21
4814 : 8d 00 d6 STA $d600 
.l327:
4817 : 2c 00 d6 BIT $d600 
481a : 10 fb __ BPL $4817 ; (vdc_block_copy.l327 + 0)
.s27:
481c : a5 11 __ LDA P4 ; (src + 0)
481e : 8d 01 d6 STA $d601 
4821 : a9 1f __ LDA #$1f
4823 : 8d 00 d6 STA $d600 
4826 : a9 1e __ LDA #$1e
4828 : 8d 00 d6 STA $d600 
.l329:
482b : 2c 00 d6 BIT $d600 
482e : 10 fb __ BPL $482b ; (vdc_block_copy.l329 + 0)
.s33:
4830 : a9 ff __ LDA #$ff
4832 : 8d 01 d6 STA $d601 
4835 : e6 12 __ INC P5 ; (src + 1)
4837 : e6 44 __ INC T0 + 1 
4839 : c6 45 __ DEC T2 + 0 
483b : d0 a7 __ BNE $47e4 ; (vdc_block_copy.l2 + 0)
.s145:
483d : a5 0d __ LDA P0 
483f : 85 0f __ STA P2 ; (dest + 0)
4841 : a5 44 __ LDA T0 + 1 
4843 : 85 10 __ STA P3 ; (dest + 1)
4845 : 4c 88 47 JMP $4788 ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left@proxy: ; vdcwin_scroll_left@proxy
4848 : a9 b3 __ LDA #$b3
484a : 85 16 __ STA P9 
484c : a9 87 __ LDA #$87
484e : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
4850 : a0 02 __ LDY #$02
4852 : b1 16 __ LDA (P9),y ; (win + 0)
4854 : 38 __ __ SEC
4855 : e9 01 __ SBC #$01
4857 : 85 47 __ STA T2 + 0 
4859 : a0 06 __ LDY #$06
485b : b1 16 __ LDA (P9),y ; (win + 0)
485d : 85 48 __ STA T3 + 0 
485f : c8 __ __ INY
4860 : b1 16 __ LDA (P9),y ; (win + 0)
4862 : 85 49 __ STA T3 + 1 
4864 : c8 __ __ INY
4865 : b1 16 __ LDA (P9),y ; (win + 0)
4867 : 85 4a __ STA T4 + 0 
4869 : c8 __ __ INY
486a : b1 16 __ LDA (P9),y ; (win + 0)
486c : 85 4b __ STA T4 + 1 
.l62:
486e : ad 00 d6 LDA $d600 
4871 : 29 20 __ AND #$20
4873 : f0 f9 __ BEQ $486e ; (vdcwin_scroll_left.l62 + 0)
.s1:
4875 : a9 00 __ LDA #$00
4877 : 85 46 __ STA T1 + 0 
.l4:
4879 : a0 03 __ LDY #$03
487b : d1 16 __ CMP (P9),y ; (win + 0)
487d : 90 08 __ BCC $4887 ; (vdcwin_scroll_left.s5 + 0)
.l14:
487f : ad 00 d6 LDA $d600 
4882 : 29 20 __ AND #$20
4884 : d0 f9 __ BNE $487f ; (vdcwin_scroll_left.l14 + 0)
.s1001:
4886 : 60 __ __ RTS
.s5:
4887 : a5 48 __ LDA T3 + 0 
4889 : 69 01 __ ADC #$01
488b : aa __ __ TAX
488c : a5 49 __ LDA T3 + 1 
488e : 69 00 __ ADC #$00
4890 : 85 4d __ STA T5 + 1 
4892 : 18 __ __ CLC
4893 : a5 4a __ LDA T4 + 0 
4895 : 69 01 __ ADC #$01
4897 : 85 4e __ STA T7 + 0 
4899 : a5 4b __ LDA T4 + 1 
489b : 69 00 __ ADC #$00
489d : 85 4f __ STA T7 + 1 
489f : ad 90 87 LDA $8790 ; (vdc_state + 1)
48a2 : d0 0c __ BNE $48b0 ; (vdcwin_scroll_left.s10 + 0)
.s12:
48a4 : cc 9c 87 CPY $879c ; (vdc_state + 13)
48a7 : d0 05 __ BNE $48ae ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
48a9 : a9 ff __ LDA #$ff
48ab : cd 9b 87 CMP $879b ; (vdc_state + 12)
.s1003:
48ae : 90 3b __ BCC $48eb ; (vdcwin_scroll_left.s9 + 0)
.s10:
48b0 : 86 11 __ STX P4 
48b2 : a5 4d __ LDA T5 + 1 
48b4 : 85 12 __ STA P5 
48b6 : ad 9b 87 LDA $879b ; (vdc_state + 12)
48b9 : 85 4c __ STA T5 + 0 
48bb : 85 0f __ STA P2 
48bd : ad 9c 87 LDA $879c ; (vdc_state + 13)
48c0 : 85 4d __ STA T5 + 1 
48c2 : 85 10 __ STA P3 
48c4 : 20 7c 47 JSR $477c ; (vdc_block_copy@proxy + 0)
48c7 : a5 48 __ LDA T3 + 0 
48c9 : 85 0f __ STA P2 
48cb : a5 49 __ LDA T3 + 1 
48cd : 85 10 __ STA P3 
48cf : 20 8e 80 JSR $808e ; (vdc_block_copy@proxy + 0)
48d2 : a5 4e __ LDA T7 + 0 
48d4 : 85 11 __ STA P4 
48d6 : a5 4f __ LDA T7 + 1 
48d8 : 85 12 __ STA P5 
48da : 20 99 80 JSR $8099 ; (vdc_block_copy@proxy + 0)
48dd : a5 4a __ LDA T4 + 0 
48df : 85 0f __ STA P2 
48e1 : a5 4b __ LDA T4 + 1 
48e3 : 85 10 __ STA P3 
48e5 : 20 8e 80 JSR $808e ; (vdc_block_copy@proxy + 0)
48e8 : 4c 15 49 JMP $4915 ; (vdcwin_scroll_left.s8 + 0)
.s9:
48eb : 86 10 __ STX P3 
48ed : a5 4d __ LDA T5 + 1 
48ef : 85 11 __ STA P4 
48f1 : 20 fc 13 JSR $13fc ; (bnk_cpyfromvdc@proxy + 0)
48f4 : a5 48 __ LDA T3 + 0 
48f6 : 85 0f __ STA P2 
48f8 : a5 49 __ LDA T3 + 1 
48fa : 85 10 __ STA P3 
48fc : 20 a1 13 JSR $13a1 ; (bnk_cpytovdc@proxy + 0)
48ff : a5 4e __ LDA T7 + 0 
4901 : 85 10 __ STA P3 
4903 : a5 4f __ LDA T7 + 1 
4905 : 85 11 __ STA P4 
4907 : 20 4e 1a JSR $1a4e ; (bnk_cpyfromvdc@proxy + 0)
490a : a5 4a __ LDA T4 + 0 
490c : 85 0f __ STA P2 
490e : a5 4b __ LDA T4 + 1 
4910 : 85 10 __ STA P3 
4912 : 20 34 1a JSR $1a34 ; (bnk_cpytovdc@proxy + 0)
.s8:
4915 : ad 92 87 LDA $8792 ; (vdc_state + 3)
4918 : 18 __ __ CLC
4919 : 65 48 __ ADC T3 + 0 
491b : 85 48 __ STA T3 + 0 
491d : ad 93 87 LDA $8793 ; (vdc_state + 4)
4920 : 65 49 __ ADC T3 + 1 
4922 : 85 49 __ STA T3 + 1 
4924 : 18 __ __ CLC
4925 : a5 4a __ LDA T4 + 0 
4927 : 6d 92 87 ADC $8792 ; (vdc_state + 3)
492a : 85 4a __ STA T4 + 0 
492c : a5 4b __ LDA T4 + 1 
492e : 6d 93 87 ADC $8793 ; (vdc_state + 4)
4931 : 85 4b __ STA T4 + 1 
4933 : e6 46 __ INC T1 + 0 
4935 : a5 46 __ LDA T1 + 0 
4937 : 4c 79 48 JMP $4879 ; (vdcwin_scroll_left.l4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down@proxy: ; vdcwin_scroll_down@proxy
493a : a9 b3 __ LDA #$b3
493c : 85 15 __ STA P8 
493e : a9 87 __ LDA #$87
4940 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
4942 : ad 92 87 LDA $8792 ; (vdc_state + 3)
4945 : 85 49 __ STA T3 + 0 
4947 : 85 1b __ STA ACCU + 0 
4949 : ad 93 87 LDA $8793 ; (vdc_state + 4)
494c : 85 4a __ STA T3 + 1 
494e : 85 1c __ STA ACCU + 1 
4950 : a0 03 __ LDY #$03
4952 : b1 15 __ LDA (P8),y ; (win + 0)
4954 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
4957 : a0 06 __ LDY #$06
4959 : b1 15 __ LDA (P8),y ; (win + 0)
495b : 18 __ __ CLC
495c : 65 05 __ ADC WORK + 2 
495e : 85 4b __ STA T4 + 0 
4960 : c8 __ __ INY
4961 : b1 15 __ LDA (P8),y ; (win + 0)
4963 : 65 06 __ ADC WORK + 3 
4965 : 85 4c __ STA T4 + 1 
4967 : c8 __ __ INY
4968 : b1 15 __ LDA (P8),y ; (win + 0)
496a : 18 __ __ CLC
496b : 65 05 __ ADC WORK + 2 
496d : 85 47 __ STA T2 + 0 
496f : c8 __ __ INY
4970 : b1 15 __ LDA (P8),y ; (win + 0)
4972 : 65 06 __ ADC WORK + 3 
4974 : 85 48 __ STA T2 + 1 
4976 : a9 00 __ LDA #$00
4978 : 85 46 __ STA T1 + 0 
497a : a0 02 __ LDY #$02
497c : b1 15 __ LDA (P8),y ; (win + 0)
497e : 85 4d __ STA T6 + 0 
4980 : 4c d3 49 JMP $49d3 ; (vdcwin_scroll_down.l1 + 0)
.s2:
4983 : 38 __ __ SEC
4984 : a5 4b __ LDA T4 + 0 
4986 : ed 92 87 SBC $8792 ; (vdc_state + 3)
4989 : 85 0f __ STA P2 
498b : 85 4b __ STA T4 + 0 
498d : a5 4c __ LDA T4 + 1 
498f : ed 93 87 SBC $8793 ; (vdc_state + 4)
4992 : 85 10 __ STA P3 
4994 : 85 4c __ STA T4 + 1 
4996 : 38 __ __ SEC
4997 : a5 0f __ LDA P2 
4999 : e5 49 __ SBC T3 + 0 
499b : 85 11 __ STA P4 
499d : a5 10 __ LDA P3 
499f : e5 4a __ SBC T3 + 1 
49a1 : 85 12 __ STA P5 
49a3 : a5 4d __ LDA T6 + 0 
49a5 : 85 13 __ STA P6 
49a7 : a9 00 __ LDA #$00
49a9 : 85 14 __ STA P7 
49ab : 20 84 47 JSR $4784 ; (vdc_block_copy.s0 + 0)
49ae : 38 __ __ SEC
49af : a5 47 __ LDA T2 + 0 
49b1 : ed 92 87 SBC $8792 ; (vdc_state + 3)
49b4 : 85 47 __ STA T2 + 0 
49b6 : 85 0f __ STA P2 
49b8 : a5 48 __ LDA T2 + 1 
49ba : ed 93 87 SBC $8793 ; (vdc_state + 4)
49bd : 85 48 __ STA T2 + 1 
49bf : 85 10 __ STA P3 
49c1 : 38 __ __ SEC
49c2 : a5 0f __ LDA P2 
49c4 : e5 49 __ SBC T3 + 0 
49c6 : 85 11 __ STA P4 
49c8 : a5 10 __ LDA P3 
49ca : e5 4a __ SBC T3 + 1 
49cc : 85 12 __ STA P5 
49ce : 20 84 47 JSR $4784 ; (vdc_block_copy.s0 + 0)
49d1 : e6 46 __ INC T1 + 0 
.l1:
49d3 : a0 03 __ LDY #$03
49d5 : b1 15 __ LDA (P8),y ; (win + 0)
49d7 : 38 __ __ SEC
49d8 : e9 01 __ SBC #$01
49da : 90 a7 __ BCC $4983 ; (vdcwin_scroll_down.s2 + 0)
.s1002:
49dc : c5 46 __ CMP T1 + 0 
49de : 90 02 __ BCC $49e2 ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
49e0 : d0 a1 __ BNE $4983 ; (vdcwin_scroll_down.s2 + 0)
.s1001:
49e2 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up@proxy: ; vdcwin_scroll_up@proxy
49e3 : a9 b3 __ LDA #$b3
49e5 : 85 15 __ STA P8 
49e7 : a9 87 __ LDA #$87
49e9 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
49eb : a9 00 __ LDA #$00
49ed : 85 46 __ STA T0 + 0 
49ef : a0 02 __ LDY #$02
49f1 : b1 15 __ LDA (P8),y ; (win + 0)
49f3 : 85 47 __ STA T2 + 0 
49f5 : a0 06 __ LDY #$06
49f7 : b1 15 __ LDA (P8),y ; (win + 0)
49f9 : 85 48 __ STA T3 + 0 
49fb : c8 __ __ INY
49fc : b1 15 __ LDA (P8),y ; (win + 0)
49fe : 85 49 __ STA T3 + 1 
4a00 : c8 __ __ INY
4a01 : b1 15 __ LDA (P8),y ; (win + 0)
4a03 : 85 4a __ STA T4 + 0 
4a05 : c8 __ __ INY
4a06 : b1 15 __ LDA (P8),y ; (win + 0)
4a08 : 85 4b __ STA T4 + 1 
4a0a : ad 92 87 LDA $8792 ; (vdc_state + 3)
4a0d : 85 4c __ STA T5 + 0 
4a0f : ad 93 87 LDA $8793 ; (vdc_state + 4)
4a12 : 85 4d __ STA T5 + 1 
4a14 : 4c 5f 4a JMP $4a5f ; (vdcwin_scroll_up.l1 + 0)
.s2:
4a17 : a5 48 __ LDA T3 + 0 
4a19 : 85 0f __ STA P2 
4a1b : 18 __ __ CLC
4a1c : 65 4c __ ADC T5 + 0 
4a1e : 85 11 __ STA P4 
4a20 : a5 49 __ LDA T3 + 1 
4a22 : 85 10 __ STA P3 
4a24 : 65 4d __ ADC T5 + 1 
4a26 : 85 12 __ STA P5 
4a28 : 20 7c 47 JSR $477c ; (vdc_block_copy@proxy + 0)
4a2b : a5 4a __ LDA T4 + 0 
4a2d : 85 0f __ STA P2 
4a2f : 18 __ __ CLC
4a30 : 65 4c __ ADC T5 + 0 
4a32 : 85 11 __ STA P4 
4a34 : a5 4b __ LDA T4 + 1 
4a36 : 85 10 __ STA P3 
4a38 : 65 4d __ ADC T5 + 1 
4a3a : 85 12 __ STA P5 
4a3c : 20 84 47 JSR $4784 ; (vdc_block_copy.s0 + 0)
4a3f : ad 92 87 LDA $8792 ; (vdc_state + 3)
4a42 : 18 __ __ CLC
4a43 : 65 48 __ ADC T3 + 0 
4a45 : 85 48 __ STA T3 + 0 
4a47 : ad 93 87 LDA $8793 ; (vdc_state + 4)
4a4a : 65 49 __ ADC T3 + 1 
4a4c : 85 49 __ STA T3 + 1 
4a4e : 18 __ __ CLC
4a4f : a5 4a __ LDA T4 + 0 
4a51 : 6d 92 87 ADC $8792 ; (vdc_state + 3)
4a54 : 85 4a __ STA T4 + 0 
4a56 : a5 4b __ LDA T4 + 1 
4a58 : 6d 93 87 ADC $8793 ; (vdc_state + 4)
4a5b : 85 4b __ STA T4 + 1 
4a5d : e6 46 __ INC T0 + 0 
.l1:
4a5f : a0 03 __ LDY #$03
4a61 : b1 15 __ LDA (P8),y ; (win + 0)
4a63 : 38 __ __ SEC
4a64 : e9 01 __ SBC #$01
4a66 : 90 af __ BCC $4a17 ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4a68 : c5 46 __ CMP T0 + 0 
4a6a : 90 02 __ BCC $4a6e ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
4a6c : d0 a9 __ BNE $4a17 ; (vdcwin_scroll_up.s2 + 0)
.s1001:
4a6e : 60 __ __ RTS
--------------------------------------------------------------------
loadoverlay: ; loadoverlay(u8)->void
.s1000:
4a6f : 38 __ __ SEC
4a70 : a5 23 __ LDA SP + 0 
4a72 : e9 08 __ SBC #$08
4a74 : 85 23 __ STA SP + 0 
4a76 : b0 02 __ BCS $4a7a ; (loadoverlay.s0 + 0)
4a78 : c6 24 __ DEC SP + 1 
.s0:
4a7a : ad fa ab LDA $abfa ; (sstack + 7)
4a7d : cd ff 86 CMP $86ff ; (overlay_active + 0)
4a80 : f0 65 __ BEQ $4ae7 ; (loadoverlay.s1001 + 0)
.s1:
4a82 : 8d ff 86 STA $86ff ; (overlay_active + 0)
4a85 : 85 4e __ STA T2 + 0 
4a87 : aa __ __ TAX
4a88 : bc 36 80 LDY $8036,x ; (__multab3L + 0)
4a8b : b9 e1 87 LDA $87e1,y ; (windows + 36)
4a8e : d0 33 __ BNE $4ac3 ; (loadoverlay.s4 + 0)
.s5:
4a90 : a5 4e __ LDA T2 + 0 
4a92 : a0 06 __ LDY #$06
4a94 : 91 23 __ STA (SP + 0),y 
4a96 : a9 00 __ LDA #$00
4a98 : c8 __ __ INY
4a99 : 91 23 __ STA (SP + 0),y 
4a9b : a9 00 __ LDA #$00
4a9d : a0 02 __ LDY #$02
4a9f : 91 23 __ STA (SP + 0),y 
4aa1 : a9 89 __ LDA #$89
4aa3 : c8 __ __ INY
4aa4 : 91 23 __ STA (SP + 0),y 
4aa6 : a9 9e __ LDA #$9e
4aa8 : c8 __ __ INY
4aa9 : 91 23 __ STA (SP + 0),y 
4aab : a9 3c __ LDA #$3c
4aad : c8 __ __ INY
4aae : 91 23 __ STA (SP + 0),y 
4ab0 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
4ab3 : a9 00 __ LDA #$00
4ab5 : 8d f8 ab STA $abf8 ; (sstack + 5)
4ab8 : a9 89 __ LDA #$89
4aba : 8d f9 ab STA $abf9 ; (sstack + 6)
4abd : 20 47 2a JSR $2a47 ; (load_overlay.s1000 + 0)
4ac0 : 4c e7 4a JMP $4ae7 ; (loadoverlay.s1001 + 0)
.s4:
4ac3 : a9 0e __ LDA #$0e
4ac5 : 85 0d __ STA P0 
4ac7 : b9 e1 87 LDA $87e1,y ; (windows + 36)
4aca : 85 10 __ STA P3 
4acc : a9 14 __ LDA #$14
4ace : 85 14 __ STA P7 
4ad0 : b9 e2 87 LDA $87e2,y ; (windows + 37)
4ad3 : 85 11 __ STA P4 
4ad5 : b9 e3 87 LDA $87e3,y ; (windows + 38)
4ad8 : 85 12 __ STA P5 
4ada : a9 00 __ LDA #$00
4adc : 85 13 __ STA P6 
4ade : 85 0e __ STA P1 
4ae0 : a9 ac __ LDA #$ac
4ae2 : 85 0f __ STA P2 
4ae4 : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
.s1001:
4ae7 : 18 __ __ CLC
4ae8 : a5 23 __ LDA SP + 0 
4aea : 69 08 __ ADC #$08
4aec : 85 23 __ STA SP + 0 
4aee : 90 02 __ BCC $4af2 ; (loadoverlay.s1001 + 11)
4af0 : e6 24 __ INC SP + 1 
4af2 : 60 __ __ RTS
--------------------------------------------------------------------
hidecursor: ; hidecursor()->void
.s0:
4af3 : a9 7f __ LDA #$7f
4af5 : 85 0d __ STA P0 
4af7 : ad eb 86 LDA $86eb ; (screen_col + 0)
4afa : 85 43 __ STA T0 + 0 
4afc : 18 __ __ CLC
4afd : 6d af 87 ADC $87af ; (canvas + 7)
4b00 : 85 44 __ STA T1 + 0 
4b02 : ad b0 87 LDA $87b0 ; (canvas + 8)
4b05 : 6d ec 86 ADC $86ec ; (screen_col + 1)
4b08 : 85 45 __ STA T1 + 1 
4b0a : ad ed 86 LDA $86ed ; (screen_row + 0)
4b0d : 85 46 __ STA T2 + 0 
4b0f : 18 __ __ CLC
4b10 : 6d b1 87 ADC $87b1 ; (canvas + 9)
4b13 : 85 03 __ STA WORK + 0 
4b15 : ad b2 87 LDA $87b2 ; (canvas + 10)
4b18 : 6d ee 86 ADC $86ee ; (screen_row + 1)
4b1b : 85 04 __ STA WORK + 1 
4b1d : ad ab 87 LDA $87ab ; (canvas + 3)
4b20 : 85 47 __ STA T4 + 0 
4b22 : 85 1b __ STA ACCU + 0 
4b24 : ad ac 87 LDA $87ac ; (canvas + 4)
4b27 : 85 48 __ STA T4 + 1 
4b29 : 85 1c __ STA ACCU + 1 
4b2b : 20 62 7c JSR $7c62 ; (mul16 + 0)
4b2e : 18 __ __ CLC
4b2f : a5 06 __ LDA WORK + 3 
4b31 : 69 58 __ ADC #$58
4b33 : aa __ __ TAX
4b34 : 18 __ __ CLC
4b35 : a5 05 __ LDA WORK + 2 
4b37 : 65 44 __ ADC T1 + 0 
4b39 : 85 0e __ STA P1 
4b3b : 8a __ __ TXA
4b3c : 65 45 __ ADC T1 + 1 
4b3e : 85 0f __ STA P2 
4b40 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
4b43 : 85 49 __ STA T5 + 0 
4b45 : ad ad 87 LDA $87ad ; (canvas + 5)
4b48 : 85 1b __ STA ACCU + 0 
4b4a : ad ae 87 LDA $87ae ; (canvas + 6)
4b4d : 85 1c __ STA ACCU + 1 
4b4f : a5 47 __ LDA T4 + 0 
4b51 : 85 03 __ STA WORK + 0 
4b53 : a5 48 __ LDA T4 + 1 
4b55 : 85 04 __ STA WORK + 1 
4b57 : 20 62 7c JSR $7c62 ; (mul16 + 0)
4b5a : 18 __ __ CLC
4b5b : a5 05 __ LDA WORK + 2 
4b5d : 65 0e __ ADC P1 
4b5f : a8 __ __ TAY
4b60 : a5 06 __ LDA WORK + 3 
4b62 : 65 0f __ ADC P2 
4b64 : aa __ __ TAX
4b65 : 98 __ __ TYA
4b66 : 18 __ __ CLC
4b67 : 69 30 __ ADC #$30
4b69 : 85 0e __ STA P1 
4b6b : 90 01 __ BCC $4b6e ; (hidecursor.s1003 + 0)
.s1002:
4b6d : e8 __ __ INX
.s1003:
4b6e : 86 0f __ STX P2 
4b70 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
4b73 : 85 10 __ STA P3 
4b75 : a5 43 __ LDA T0 + 0 
4b77 : 85 0d __ STA P0 
4b79 : a5 46 __ LDA T2 + 0 
4b7b : 85 0e __ STA P1 
4b7d : a5 49 __ LDA T5 + 0 
4b7f : 85 0f __ STA P2 
4b81 : 4c f8 34 JMP $34f8 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
chooseidandfilename: ; chooseidandfilename(const u8*,u8)->i16
.s0:
4b84 : a9 00 __ LDA #$00
4b86 : 85 17 __ STA P10 
4b88 : a9 14 __ LDA #$14
4b8a : 85 18 __ STA P11 
4b8c : a9 05 __ LDA #$05
4b8e : 8d f3 ab STA $abf3 ; (sstack + 0)
4b91 : a9 28 __ LDA #$28
4b93 : 8d f4 ab STA $abf4 ; (sstack + 1)
4b96 : a9 0c __ LDA #$0c
4b98 : 8d f5 ab STA $abf5 ; (sstack + 2)
4b9b : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
4b9e : 8d 96 87 STA $8796 ; (vdc_state + 7)
4ba1 : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
4ba4 : a9 01 __ LDA #$01
4ba6 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
4ba9 : ad f8 ab LDA $abf8 ; (sstack + 5)
4bac : 85 13 __ STA P6 
4bae : ad f9 ab LDA $abf9 ; (sstack + 6)
4bb1 : 85 14 __ STA P7 
4bb3 : 20 04 81 JSR $8104 ; (vdc_prints_attr@proxy + 0)
4bb6 : a9 00 __ LDA #$00
4bb8 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
4bbb : 20 e2 60 JSR $60e2 ; (choosedeviceid.s1000 + 0)
4bbe : a5 1b __ LDA ACCU + 0 
4bc0 : d0 07 __ BNE $4bc9 ; (chooseidandfilename.s4 + 0)
.s2:
4bc2 : a9 ff __ LDA #$ff
4bc4 : c6 1b __ DEC ACCU + 0 
4bc6 : 85 1c __ STA ACCU + 1 
.s1001:
4bc8 : 60 __ __ RTS
.s4:
4bc9 : a9 0a __ LDA #$0a
4bcb : 85 12 __ STA P5 
4bcd : a9 e9 __ LDA #$e9
4bcf : 85 13 __ STA P6 
4bd1 : a9 61 __ LDA #$61
4bd3 : 85 14 __ STA P7 
4bd5 : 20 af 80 JSR $80af ; (vdc_prints_attr@proxy + 0)
4bd8 : a9 15 __ LDA #$15
4bda : 85 16 __ STA P9 
4bdc : a9 0b __ LDA #$0b
4bde : 85 17 __ STA P10 
4be0 : a9 7a __ LDA #$7a
4be2 : 8d f3 ab STA $abf3 ; (sstack + 0)
4be5 : a9 87 __ LDA #$87
4be7 : 8d f4 ab STA $abf4 ; (sstack + 1)
4bea : ad fa ab LDA $abfa ; (sstack + 7)
4bed : 8d f5 ab STA $abf5 ; (sstack + 2)
--------------------------------------------------------------------
textInput: ; textInput(u8,u8,u8*,u8)->i16
.s1000:
4bf0 : a5 53 __ LDA T6 + 0 
4bf2 : 8d ee ab STA $abee ; (palette_draw@stack + 15)
4bf5 : a5 54 __ LDA T6 + 1 
4bf7 : 8d ef ab STA $abef ; (buffer + 12)
4bfa : a5 55 __ LDA T8 + 0 
4bfc : 8d f0 ab STA $abf0 ; (buffer + 13)
.s0:
4bff : ad f3 ab LDA $abf3 ; (sstack + 0)
4c02 : 85 49 __ STA T0 + 0 
4c04 : 85 0d __ STA P0 
4c06 : ad f4 ab LDA $abf4 ; (sstack + 1)
4c09 : 85 4a __ STA T0 + 1 
4c0b : 85 0e __ STA P1 
4c0d : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
4c10 : a5 1b __ LDA ACCU + 0 ; (size + 0)
4c12 : 85 4b __ STA T1 + 0 
4c14 : f0 13 __ BEQ $4c29 ; (textInput.s3 + 0)
.s1:
4c16 : a5 49 __ LDA T0 + 0 
4c18 : 85 13 __ STA P6 
4c1a : a5 4a __ LDA T0 + 1 
4c1c : 85 14 __ STA P7 
4c1e : a5 16 __ LDA P9 ; (xpos + 0)
4c20 : 85 11 __ STA P4 
4c22 : a5 17 __ LDA P10 ; (ypos + 0)
4c24 : 85 12 __ STA P5 
4c26 : 20 81 33 JSR $3381 ; (vdc_prints_attr@proxy + 0)
.s3:
4c29 : a5 16 __ LDA P9 ; (xpos + 0)
4c2b : 85 49 __ STA T0 + 0 
4c2d : 18 __ __ CLC
4c2e : 65 4b __ ADC T1 + 0 
4c30 : 8d b7 87 STA $87b7 ; (canvas + 15)
4c33 : a5 17 __ LDA P10 ; (ypos + 0)
4c35 : 8d b8 87 STA $87b8 ; (canvas + 16)
.l147:
4c38 : a9 b3 __ LDA #$b3
4c3a : 85 0d __ STA P0 
4c3c : a9 87 __ LDA #$87
4c3e : 85 0e __ STA P1 
.l146:
4c40 : 20 4d 3e JSR $3e4d ; (vdcwin_cursor_toggle.s0 + 0)
.l7:
4c43 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
4c46 : a5 1b __ LDA ACCU + 0 ; (size + 0)
4c48 : c9 1b __ CMP #$1b
4c4a : d0 03 __ BNE $4c4f ; (textInput.s72 + 0)
4c4c : 4c dd 4d JMP $4ddd ; (textInput.s10 + 0)
.s72:
4c4f : 85 4d __ STA T3 + 0 
4c51 : c9 1b __ CMP #$1b
4c53 : b0 03 __ BCS $4c58 ; (textInput.s73 + 0)
4c55 : 4c ac 4d JMP $4dac ; (textInput.s74 + 0)
.s73:
4c58 : c9 94 __ CMP #$94
4c5a : d0 72 __ BNE $4cce ; (textInput.s80 + 0)
.s28:
4c5c : ad f3 ab LDA $abf3 ; (sstack + 0)
4c5f : 85 4d __ STA T3 + 0 
4c61 : 85 0d __ STA P0 
4c63 : ad f4 ab LDA $abf4 ; (sstack + 1)
4c66 : 85 4e __ STA T3 + 1 
4c68 : 85 0e __ STA P1 
4c6a : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
4c6d : a5 1b __ LDA ACCU + 0 ; (size + 0)
4c6f : cd f5 ab CMP $abf5 ; (sstack + 2)
4c72 : b0 cf __ BCS $4c43 ; (textInput.l7 + 0)
.s33:
4c74 : 85 4f __ STA T4 + 0 
4c76 : 09 00 __ ORA #$00
4c78 : f0 c9 __ BEQ $4c43 ; (textInput.l7 + 0)
.s32:
4c7a : a5 4b __ LDA T1 + 0 
4c7c : c5 1b __ CMP ACCU + 0 ; (size + 0)
4c7e : b0 c3 __ BCS $4c43 ; (textInput.l7 + 0)
.s29:
4c80 : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
4c83 : a5 4d __ LDA T3 + 0 
4c85 : 85 13 __ STA P6 
4c87 : a5 4e __ LDA T3 + 1 
4c89 : 85 14 __ STA P7 
4c8b : a5 16 __ LDA P9 ; (xpos + 0)
4c8d : 85 11 __ STA P4 
4c8f : a5 17 __ LDA P10 ; (ypos + 0)
4c91 : 85 12 __ STA P5 
4c93 : ad 96 87 LDA $8796 ; (vdc_state + 7)
4c96 : 85 15 __ STA P8 
4c98 : 18 __ __ CLC
4c99 : a5 4f __ LDA T4 + 0 
4c9b : 69 01 __ ADC #$01
4c9d : c5 4b __ CMP T1 + 0 
4c9f : 90 14 __ BCC $4cb5 ; (textInput.s36 + 0)
.s1038:
4ca1 : 85 52 __ STA T7 + 0 
4ca3 : a8 __ __ TAY
.l35:
4ca4 : b1 13 __ LDA (P6),y 
4ca6 : c8 __ __ INY
4ca7 : 91 13 __ STA (P6),y 
4ca9 : a5 52 __ LDA T7 + 0 
4cab : f0 08 __ BEQ $4cb5 ; (textInput.s36 + 0)
.s39:
4cad : c6 52 __ DEC T7 + 0 
4caf : a4 52 __ LDY T7 + 0 
4cb1 : c4 4b __ CPY T1 + 0 
4cb3 : b0 ef __ BCS $4ca4 ; (textInput.l35 + 0)
.s36:
4cb5 : a9 20 __ LDA #$20
4cb7 : a4 4b __ LDY T1 + 0 
4cb9 : 91 13 __ STA (P6),y 
4cbb : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
4cbe : a5 17 __ LDA P10 ; (ypos + 0)
4cc0 : 8d b8 87 STA $87b8 ; (canvas + 16)
4cc3 : 18 __ __ CLC
4cc4 : a5 49 __ LDA T0 + 0 
4cc6 : 65 4b __ ADC T1 + 0 
.s149:
4cc8 : 8d b7 87 STA $87b7 ; (canvas + 15)
4ccb : 4c 38 4c JMP $4c38 ; (textInput.l147 + 0)
.s80:
4cce : b0 03 __ BCS $4cd3 ; (textInput.s81 + 0)
4cd0 : 4c 71 4d JMP $4d71 ; (textInput.s82 + 0)
.s81:
4cd3 : c9 9d __ CMP #$9d
4cd5 : d0 1c __ BNE $4cf3 ; (textInput.s55 + 0)
.s43:
4cd7 : a5 4b __ LDA T1 + 0 
4cd9 : d0 03 __ BNE $4cde ; (textInput.s44 + 0)
4cdb : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s44:
4cde : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
4ce1 : c6 4b __ DEC T1 + 0 
.s148:
4ce3 : 18 __ __ CLC
4ce4 : a5 4b __ LDA T1 + 0 
4ce6 : 65 49 __ ADC T0 + 0 
4ce8 : 8d b7 87 STA $87b7 ; (canvas + 15)
4ceb : a5 17 __ LDA P10 ; (ypos + 0)
4ced : 8d b8 87 STA $87b8 ; (canvas + 16)
4cf0 : 4c 40 4c JMP $4c40 ; (textInput.l146 + 0)
.s55:
4cf3 : 09 00 __ ORA #$00
4cf5 : 10 03 __ BPL $4cfa ; (textInput.s64 + 0)
4cf7 : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s64:
4cfa : aa __ __ TAX
4cfb : bd 47 82 LDA $8247,x ; (_cinfo + 0)
4cfe : d0 03 __ BNE $4d03 ; (textInput.s61 + 0)
4d00 : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s61:
4d03 : a5 4b __ LDA T1 + 0 
4d05 : cd f5 ab CMP $abf5 ; (sstack + 2)
4d08 : 90 03 __ BCC $4d0d ; (textInput.s56 + 0)
4d0a : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s56:
4d0d : ad f3 ab LDA $abf3 ; (sstack + 0)
4d10 : 85 50 __ STA T5 + 0 
4d12 : 65 4b __ ADC T1 + 0 
4d14 : 85 53 __ STA T6 + 0 
4d16 : ad f4 ab LDA $abf4 ; (sstack + 1)
4d19 : 85 51 __ STA T5 + 1 
4d1b : 69 00 __ ADC #$00
4d1d : 85 54 __ STA T6 + 1 
4d1f : a0 00 __ LDY #$00
4d21 : b1 53 __ LDA (T6 + 0),y 
4d23 : 85 4c __ STA T2 + 0 
4d25 : 8a __ __ TXA
4d26 : 91 53 __ STA (T6 + 0),y 
4d28 : a9 b3 __ LDA #$b3
4d2a : 85 0d __ STA P0 
4d2c : a9 87 __ LDA #$87
4d2e : 85 0e __ STA P1 
4d30 : 20 4d 3e JSR $3e4d ; (vdcwin_cursor_toggle.s0 + 0)
4d33 : a5 4d __ LDA T3 + 0 
4d35 : 20 76 35 JSR $3576 ; (pet2screen.s0 + 0)
4d38 : 85 0f __ STA P2 
4d3a : 18 __ __ CLC
4d3b : a5 49 __ LDA T0 + 0 
4d3d : 65 4b __ ADC T1 + 0 
4d3f : 85 0d __ STA P0 
4d41 : a5 17 __ LDA P10 ; (ypos + 0)
4d43 : 85 0e __ STA P1 
4d45 : 20 d9 81 JSR $81d9 ; (vdc_printc@proxy + 0)
4d48 : a5 17 __ LDA P10 ; (ypos + 0)
4d4a : 8d b8 87 STA $87b8 ; (canvas + 16)
4d4d : a9 b3 __ LDA #$b3
4d4f : 85 0d __ STA P0 
4d51 : a9 87 __ LDA #$87
4d53 : 85 0e __ STA P1 
4d55 : e6 4b __ INC T1 + 0 
4d57 : 18 __ __ CLC
4d58 : a5 4b __ LDA T1 + 0 
4d5a : 65 49 __ ADC T0 + 0 
4d5c : 8d b7 87 STA $87b7 ; (canvas + 15)
4d5f : 20 4d 3e JSR $3e4d ; (vdcwin_cursor_toggle.s0 + 0)
4d62 : a5 4c __ LDA T2 + 0 
4d64 : f0 03 __ BEQ $4d69 ; (textInput.s67 + 0)
4d66 : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s67:
4d69 : a4 4b __ LDY T1 + 0 
4d6b : c8 __ __ INY
4d6c : 91 50 __ STA (T5 + 0),y 
4d6e : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s82:
4d71 : c9 1d __ CMP #$1d
4d73 : f0 03 __ BEQ $4d78 ; (textInput.s48 + 0)
4d75 : 4c f3 4c JMP $4cf3 ; (textInput.s55 + 0)
.s48:
4d78 : ad f3 ab LDA $abf3 ; (sstack + 0)
4d7b : 85 0d __ STA P0 
4d7d : ad f4 ab LDA $abf4 ; (sstack + 1)
4d80 : 85 0e __ STA P1 
4d82 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
4d85 : a5 1c __ LDA ACCU + 1 
4d87 : 10 03 __ BPL $4d8c ; (textInput.s1012 + 0)
4d89 : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s1012:
4d8c : d0 19 __ BNE $4da7 ; (textInput.s1037 + 0)
.s1010:
4d8e : a5 4b __ LDA T1 + 0 
4d90 : c5 1b __ CMP ACCU + 0 ; (size + 0)
4d92 : 90 03 __ BCC $4d97 ; (textInput.s52 + 0)
4d94 : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s52:
4d97 : cd f5 ab CMP $abf5 ; (sstack + 2)
4d9a : 90 03 __ BCC $4d9f ; (textInput.s49 + 0)
4d9c : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s49:
4d9f : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
4da2 : e6 4b __ INC T1 + 0 
4da4 : 4c e3 4c JMP $4ce3 ; (textInput.s148 + 0)
.s1037:
4da7 : a5 4b __ LDA T1 + 0 
4da9 : 4c 97 4d JMP $4d97 ; (textInput.s52 + 0)
.s74:
4dac : c9 0d __ CMP #$0d
4dae : d0 24 __ BNE $4dd4 ; (textInput.s75 + 0)
.s11:
4db0 : ad f3 ab LDA $abf3 ; (sstack + 0)
4db3 : 85 49 __ STA T0 + 0 
4db5 : 85 0d __ STA P0 
4db7 : ad f4 ab LDA $abf4 ; (sstack + 1)
4dba : 85 4a __ STA T0 + 1 
4dbc : 85 0e __ STA P1 
4dbe : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
4dc1 : a9 00 __ LDA #$00
4dc3 : a4 1b __ LDY ACCU + 0 ; (size + 0)
4dc5 : 84 4b __ STY T1 + 0 
4dc7 : 91 49 __ STA (T0 + 0),y 
4dc9 : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
4dcc : a5 4b __ LDA T1 + 0 
4dce : 85 1b __ STA ACCU + 0 ; (size + 0)
4dd0 : a9 00 __ LDA #$00
4dd2 : f0 10 __ BEQ $4de4 ; (textInput.s1001 + 0)
.s75:
4dd4 : b0 20 __ BCS $4df6 ; (textInput.s76 + 0)
.s77:
4dd6 : c9 03 __ CMP #$03
4dd8 : f0 03 __ BEQ $4ddd ; (textInput.s10 + 0)
4dda : 4c f3 4c JMP $4cf3 ; (textInput.s55 + 0)
.s10:
4ddd : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
4de0 : a9 ff __ LDA #$ff
4de2 : 85 1b __ STA ACCU + 0 ; (size + 0)
.s1001:
4de4 : 85 1c __ STA ACCU + 1 
4de6 : ad ee ab LDA $abee ; (palette_draw@stack + 15)
4de9 : 85 53 __ STA T6 + 0 
4deb : ad ef ab LDA $abef ; (buffer + 12)
4dee : 85 54 __ STA T6 + 1 
4df0 : ad f0 ab LDA $abf0 ; (buffer + 13)
4df3 : 85 55 __ STA T8 + 0 
4df5 : 60 __ __ RTS
.s76:
4df6 : c9 14 __ CMP #$14
4df8 : f0 03 __ BEQ $4dfd ; (textInput.s12 + 0)
4dfa : 4c f3 4c JMP $4cf3 ; (textInput.s55 + 0)
.s12:
4dfd : a5 4b __ LDA T1 + 0 
4dff : d0 03 __ BNE $4e04 ; (textInput.s13 + 0)
4e01 : 4c 43 4c JMP $4c43 ; (textInput.l7 + 0)
.s13:
4e04 : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
4e07 : a9 20 __ LDA #$20
4e09 : 85 0f __ STA P2 
4e0b : c6 4b __ DEC T1 + 0 
4e0d : 18 __ __ CLC
4e0e : a5 4b __ LDA T1 + 0 
4e10 : 65 49 __ ADC T0 + 0 
4e12 : 85 0d __ STA P0 
4e14 : a5 17 __ LDA P10 ; (ypos + 0)
4e16 : 85 4c __ STA T2 + 0 
4e18 : 85 0e __ STA P1 
4e1a : 20 d9 81 JSR $81d9 ; (vdc_printc@proxy + 0)
4e1d : a5 4b __ LDA T1 + 0 
4e1f : 85 52 __ STA T7 + 0 
4e21 : ad f3 ab LDA $abf3 ; (sstack + 0)
4e24 : 85 4d __ STA T3 + 0 
4e26 : ad f4 ab LDA $abf4 ; (sstack + 1)
4e29 : 85 4e __ STA T3 + 1 
.l17:
4e2b : a4 52 __ LDY T7 + 0 
4e2d : c8 __ __ INY
4e2e : b1 4d __ LDA (T3 + 0),y 
4e30 : 85 55 __ STA T8 + 0 
4e32 : 88 __ __ DEY
4e33 : 91 4d __ STA (T3 + 0),y 
4e35 : 09 00 __ ORA #$00
4e37 : d0 04 __ BNE $4e3d ; (textInput.s20 + 0)
.s21:
4e39 : a9 20 __ LDA #$20
4e3b : d0 03 __ BNE $4e40 ; (textInput.s22 + 0)
.s20:
4e3d : 20 76 35 JSR $3576 ; (pet2screen.s0 + 0)
.s22:
4e40 : 85 0f __ STA P2 
4e42 : a5 4c __ LDA T2 + 0 
4e44 : 85 0e __ STA P1 
4e46 : 18 __ __ CLC
4e47 : a5 49 __ LDA T0 + 0 
4e49 : 65 52 __ ADC T7 + 0 
4e4b : 85 0d __ STA P0 
4e4d : 20 d9 81 JSR $81d9 ; (vdc_printc@proxy + 0)
4e50 : a5 55 __ LDA T8 + 0 
4e52 : d0 0d __ BNE $4e61 ; (textInput.s18 + 0)
.s19:
4e54 : a5 0e __ LDA P1 
4e56 : 8d b8 87 STA $87b8 ; (canvas + 16)
4e59 : 18 __ __ CLC
4e5a : a5 4b __ LDA T1 + 0 
4e5c : 65 49 __ ADC T0 + 0 
4e5e : 4c c8 4c JMP $4cc8 ; (textInput.s149 + 0)
.s18:
4e61 : e6 52 __ INC T7 + 0 
4e63 : 4c 2b 4e JMP $4e2b ; (textInput.l17 + 0)
--------------------------------------------------------------------
strtol@proxy: ; strtol@proxy
4e66 : a9 00 __ LDA #$00
4e68 : 85 0d __ STA P0 
4e6a : a9 89 __ LDA #$89
4e6c : 85 0e __ STA P1 
4e6e : a9 c6 __ LDA #$c6
4e70 : 85 0f __ STA P2 
4e72 : a9 ab __ LDA #$ab
4e74 : 85 10 __ STA P3 
4e76 : a9 0a __ LDA #$0a
4e78 : 85 11 __ STA P4 
--------------------------------------------------------------------
strtol: ; strtol(const u8*,const u8**,u8)->i32
.s0:
4e7a : a0 00 __ LDY #$00
.l1:
4e7c : b1 0d __ LDA (P0),y ; (s + 0)
4e7e : aa __ __ TAX
4e7f : a5 0d __ LDA P0 ; (s + 0)
4e81 : 85 1b __ STA ACCU + 0 
4e83 : 18 __ __ CLC
4e84 : 69 01 __ ADC #$01
4e86 : 85 0d __ STA P0 ; (s + 0)
4e88 : a5 0e __ LDA P1 ; (s + 1)
4e8a : 85 1c __ STA ACCU + 1 
4e8c : 69 00 __ ADC #$00
4e8e : 85 0e __ STA P1 ; (s + 1)
4e90 : 8a __ __ TXA
4e91 : e0 21 __ CPX #$21
4e93 : b0 0d __ BCS $4ea2 ; (strtol.s3 + 0)
.s2:
4e95 : 09 00 __ ORA #$00
4e97 : d0 e3 __ BNE $4e7c ; (strtol.l1 + 0)
.s4:
4e99 : 85 1b __ STA ACCU + 0 
4e9b : 85 1c __ STA ACCU + 1 
4e9d : 85 1d __ STA ACCU + 2 
.s1001:
4e9f : 85 1e __ STA ACCU + 3 
4ea1 : 60 __ __ RTS
.s3:
4ea2 : e0 2d __ CPX #$2d
4ea4 : d0 06 __ BNE $4eac ; (strtol.s9 + 0)
.s8:
4ea6 : a9 01 __ LDA #$01
4ea8 : 85 46 __ STA T3 + 0 
4eaa : d0 09 __ BNE $4eb5 ; (strtol.s107 + 0)
.s9:
4eac : 84 46 __ STY T3 + 0 
4eae : 85 45 __ STA T2 + 0 
4eb0 : 8a __ __ TXA
4eb1 : e0 2b __ CPX #$2b
4eb3 : d0 13 __ BNE $4ec8 ; (strtol.s92 + 0)
.s107:
4eb5 : 18 __ __ CLC
4eb6 : a5 1b __ LDA ACCU + 0 
4eb8 : 69 02 __ ADC #$02
4eba : 85 0d __ STA P0 ; (s + 0)
4ebc : a5 1c __ LDA ACCU + 1 
4ebe : 69 00 __ ADC #$00
4ec0 : 85 0e __ STA P1 ; (s + 1)
4ec2 : a0 01 __ LDY #$01
4ec4 : b1 1b __ LDA (ACCU + 0),y 
4ec6 : 85 45 __ STA T2 + 0 
.s92:
4ec8 : c9 30 __ CMP #$30
4eca : d0 03 __ BNE $4ecf ; (strtol.s15 + 0)
4ecc : 4c cf 4f JMP $4fcf ; (strtol.s14 + 0)
.s15:
4ecf : a5 11 __ LDA P4 ; (base + 0)
4ed1 : d0 04 __ BNE $4ed7 ; (strtol.s120 + 0)
.s24:
4ed3 : a9 0a __ LDA #$0a
4ed5 : 85 11 __ STA P4 ; (base + 0)
.s120:
4ed7 : a9 00 __ LDA #$00
4ed9 : 85 47 __ STA T5 + 0 
4edb : 85 48 __ STA T5 + 1 
4edd : 85 49 __ STA T5 + 2 
.l75:
4edf : 85 4a __ STA T5 + 3 
4ee1 : a5 45 __ LDA T2 + 0 
4ee3 : c9 30 __ CMP #$30
4ee5 : 90 59 __ BCC $4f40 ; (strtol.s32 + 0)
.s34:
4ee7 : a5 45 __ LDA T2 + 0 
4ee9 : c9 3a __ CMP #$3a
4eeb : b0 53 __ BCS $4f40 ; (strtol.s32 + 0)
.s31:
4eed : a0 00 __ LDY #$00
4eef : b1 0d __ LDA (P0),y ; (s + 0)
4ef1 : a8 __ __ TAY
4ef2 : e6 0d __ INC P0 ; (s + 0)
4ef4 : d0 02 __ BNE $4ef8 ; (strtol.s1029 + 0)
.s1028:
4ef6 : e6 0e __ INC P1 ; (s + 1)
.s1029:
4ef8 : a5 45 __ LDA T2 + 0 
4efa : 84 45 __ STY T2 + 0 
4efc : 38 __ __ SEC
4efd : e9 30 __ SBC #$30
4eff : 85 43 __ STA T1 + 0 
4f01 : a9 00 __ LDA #$00
4f03 : e9 00 __ SBC #$00
4f05 : 85 44 __ STA T1 + 1 
.s119:
4f07 : a5 11 __ LDA P4 ; (base + 0)
4f09 : 85 1b __ STA ACCU + 0 
4f0b : a9 00 __ LDA #$00
4f0d : 85 1c __ STA ACCU + 1 
4f0f : 85 1d __ STA ACCU + 2 
4f11 : 85 1e __ STA ACCU + 3 
4f13 : a5 47 __ LDA T5 + 0 
4f15 : 85 03 __ STA WORK + 0 
4f17 : a5 48 __ LDA T5 + 1 
4f19 : 85 04 __ STA WORK + 1 
4f1b : a5 49 __ LDA T5 + 2 
4f1d : 85 05 __ STA WORK + 2 
4f1f : a5 4a __ LDA T5 + 3 
4f21 : 85 06 __ STA WORK + 3 
4f23 : 20 29 7d JSR $7d29 ; (mul32 + 0)
4f26 : 18 __ __ CLC
4f27 : a5 43 __ LDA T1 + 0 
4f29 : 65 07 __ ADC WORK + 4 
4f2b : 85 47 __ STA T5 + 0 
4f2d : a5 44 __ LDA T1 + 1 
4f2f : 65 08 __ ADC WORK + 5 
4f31 : 85 48 __ STA T5 + 1 
4f33 : a9 00 __ LDA #$00
4f35 : 65 09 __ ADC WORK + 6 
4f37 : 85 49 __ STA T5 + 2 
4f39 : a9 00 __ LDA #$00
4f3b : 65 0a __ ADC WORK + 7 
4f3d : 4c df 4e JMP $4edf ; (strtol.l75 + 0)
.s32:
4f40 : a5 45 __ LDA T2 + 0 
4f42 : c9 61 __ CMP #$61
4f44 : 90 1c __ BCC $4f62 ; (strtol.s36 + 0)
.s38:
4f46 : c9 67 __ CMP #$67
4f48 : b0 18 __ BCS $4f62 ; (strtol.s36 + 0)
.s35:
4f4a : a5 0d __ LDA P0 ; (s + 0)
4f4c : 85 1b __ STA ACCU + 0 
4f4e : 69 01 __ ADC #$01
4f50 : 85 0d __ STA P0 ; (s + 0)
4f52 : a5 0e __ LDA P1 ; (s + 1)
4f54 : 85 1c __ STA ACCU + 1 
4f56 : 69 00 __ ADC #$00
4f58 : 85 0e __ STA P1 ; (s + 1)
4f5a : 18 __ __ CLC
4f5b : a5 45 __ LDA T2 + 0 
4f5d : 69 a9 __ ADC #$a9
4f5f : 4c 7f 4f JMP $4f7f ; (strtol.s106 + 0)
.s36:
4f62 : c9 41 __ CMP #$41
4f64 : 90 2a __ BCC $4f90 ; (strtol.s30 + 0)
.s42:
4f66 : c9 47 __ CMP #$47
4f68 : b0 26 __ BCS $4f90 ; (strtol.s30 + 0)
.s39:
4f6a : a5 0d __ LDA P0 ; (s + 0)
4f6c : 85 1b __ STA ACCU + 0 
4f6e : 69 01 __ ADC #$01
4f70 : 85 0d __ STA P0 ; (s + 0)
4f72 : a5 0e __ LDA P1 ; (s + 1)
4f74 : 85 1c __ STA ACCU + 1 
4f76 : 69 00 __ ADC #$00
4f78 : 85 0e __ STA P1 ; (s + 1)
4f7a : 18 __ __ CLC
4f7b : a5 45 __ LDA T2 + 0 
4f7d : 69 c9 __ ADC #$c9
.s106:
4f7f : 85 43 __ STA T1 + 0 
4f81 : a9 00 __ LDA #$00
4f83 : 69 ff __ ADC #$ff
4f85 : 85 44 __ STA T1 + 1 
4f87 : a0 00 __ LDY #$00
4f89 : b1 1b __ LDA (ACCU + 0),y 
4f8b : 85 45 __ STA T2 + 0 
4f8d : 4c 07 4f JMP $4f07 ; (strtol.s119 + 0)
.s30:
4f90 : a5 46 __ LDA T3 + 0 
4f92 : f0 19 __ BEQ $4fad ; (strtol.s97 + 0)
.s44:
4f94 : 38 __ __ SEC
4f95 : a9 00 __ LDA #$00
4f97 : e5 47 __ SBC T5 + 0 
4f99 : 85 47 __ STA T5 + 0 
4f9b : a9 00 __ LDA #$00
4f9d : e5 48 __ SBC T5 + 1 
4f9f : 85 48 __ STA T5 + 1 
4fa1 : a9 00 __ LDA #$00
4fa3 : e5 49 __ SBC T5 + 2 
4fa5 : 85 49 __ STA T5 + 2 
4fa7 : a9 00 __ LDA #$00
4fa9 : e5 4a __ SBC T5 + 3 
4fab : 85 4a __ STA T5 + 3 
.s97:
4fad : a5 10 __ LDA P3 ; (endp + 1)
4faf : 05 0f __ ORA P2 ; (endp + 0)
4fb1 : f0 0b __ BEQ $4fbe ; (strtol.s49 + 0)
.s47:
4fb3 : a5 0d __ LDA P0 ; (s + 0)
4fb5 : a0 00 __ LDY #$00
4fb7 : 91 0f __ STA (P2),y ; (endp + 0)
4fb9 : a5 0e __ LDA P1 ; (s + 1)
4fbb : c8 __ __ INY
4fbc : 91 0f __ STA (P2),y ; (endp + 0)
.s49:
4fbe : a5 47 __ LDA T5 + 0 
4fc0 : 85 1b __ STA ACCU + 0 
4fc2 : a5 48 __ LDA T5 + 1 
4fc4 : 85 1c __ STA ACCU + 1 
4fc6 : a5 49 __ LDA T5 + 2 
4fc8 : 85 1d __ STA ACCU + 2 
4fca : a5 4a __ LDA T5 + 3 
4fcc : 4c 9f 4e JMP $4e9f ; (strtol.s1001 + 0)
.s14:
4fcf : a5 0d __ LDA P0 ; (s + 0)
4fd1 : 85 1b __ STA ACCU + 0 
4fd3 : 18 __ __ CLC
4fd4 : 69 01 __ ADC #$01
4fd6 : 85 0d __ STA P0 ; (s + 0)
4fd8 : a5 0e __ LDA P1 ; (s + 1)
4fda : 85 1c __ STA ACCU + 1 
4fdc : 69 00 __ ADC #$00
4fde : 85 0e __ STA P1 ; (s + 1)
4fe0 : a0 00 __ LDY #$00
4fe2 : b1 1b __ LDA (ACCU + 0),y 
4fe4 : c9 78 __ CMP #$78
4fe6 : f0 04 __ BEQ $4fec ; (strtol.s17 + 0)
.s20:
4fe8 : c9 58 __ CMP #$58
4fea : d0 1a __ BNE $5006 ; (strtol.s18 + 0)
.s17:
4fec : a9 10 __ LDA #$10
4fee : 85 11 __ STA P4 ; (base + 0)
4ff0 : 18 __ __ CLC
4ff1 : a5 1b __ LDA ACCU + 0 
4ff3 : 69 02 __ ADC #$02
4ff5 : 85 0d __ STA P0 ; (s + 0)
4ff7 : a5 1c __ LDA ACCU + 1 
4ff9 : 69 00 __ ADC #$00
4ffb : 85 0e __ STA P1 ; (s + 1)
4ffd : a0 01 __ LDY #$01
4fff : b1 1b __ LDA (ACCU + 0),y 
5001 : 85 45 __ STA T2 + 0 
5003 : 4c d7 4e JMP $4ed7 ; (strtol.s120 + 0)
.s18:
5006 : 85 45 __ STA T2 + 0 
5008 : a5 11 __ LDA P4 ; (base + 0)
500a : f0 03 __ BEQ $500f ; (strtol.s21 + 0)
500c : 4c d7 4e JMP $4ed7 ; (strtol.s120 + 0)
.s21:
500f : 85 47 __ STA T5 + 0 
5011 : 85 48 __ STA T5 + 1 
5013 : 85 49 __ STA T5 + 2 
5015 : 85 4a __ STA T5 + 3 
5017 : a9 08 __ LDA #$08
5019 : 85 11 __ STA P4 ; (base + 0)
501b : b1 1b __ LDA (ACCU + 0),y 
501d : c9 30 __ CMP #$30
501f : b0 03 __ BCS $5024 ; (strtol.s21 + 21)
5021 : 4c 40 4f JMP $4f40 ; (strtol.s32 + 0)
5024 : 4c e7 4e JMP $4ee7 ; (strtol.s34 + 0)
--------------------------------------------------------------------
togglestatusbar: ; togglestatusbar()->void
.s0:
5027 : ac 94 87 LDY $8794 ; (vdc_state + 5)
502a : 88 __ __ DEY
502b : ad ee 86 LDA $86ee ; (screen_row + 1)
502e : d0 05 __ BNE $5035 ; (togglestatusbar.s3 + 0)
.s1002:
5030 : cc ed 86 CPY $86ed ; (screen_row + 0)
5033 : f0 15 __ BEQ $504a ; (togglestatusbar.s1001 + 0)
.s3:
5035 : ad fe 86 LDA $86fe ; (showbar + 0)
5038 : d0 08 __ BNE $5042 ; (togglestatusbar.s5 + 0)
.s6:
503a : a9 01 __ LDA #$01
503c : 8d fe 86 STA $86fe ; (showbar + 0)
503f : 4c d0 3e JMP $3ed0 ; (initstatusbar.s1000 + 0)
.s5:
5042 : a9 00 __ LDA #$00
5044 : 8d fe 86 STA $86fe ; (showbar + 0)
5047 : 4c 83 80 JMP $8083 ; (vdcwin_cpy_viewport@proxy + 0)
.s1001:
504a : 60 __ __ RTS
--------------------------------------------------------------------
helpscreen_load: ; helpscreen_load(u8)->void
.s1000:
504b : a5 53 __ LDA T0 + 0 
504d : 8d d1 ab STA $abd1 ; (buff + 44)
5050 : a5 54 __ LDA T1 + 0 
5052 : 8d d2 ab STA $abd2 ; (buff + 45)
5055 : 38 __ __ SEC
5056 : a5 23 __ LDA SP + 0 
5058 : e9 08 __ SBC #$08
505a : 85 23 __ STA SP + 0 
505c : b0 02 __ BCS $5060 ; (helpscreen_load.s0 + 0)
505e : c6 24 __ DEC SP + 1 
.s0:
5060 : ad 91 87 LDA $8791 ; (vdc_state + 2)
5063 : 85 53 __ STA T0 + 0 
5065 : 20 f3 4a JSR $4af3 ; (hidecursor.s0 + 0)
5068 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
506b : c9 01 __ CMP #$01
506d : d0 1b __ BNE $508a ; (helpscreen_load.s3 + 0)
.s1:
506f : a9 7f __ LDA #$7f
5071 : 85 11 __ STA P4 
5073 : a9 01 __ LDA #$01
5075 : 85 15 __ STA P8 
5077 : ad a1 87 LDA $87a1 ; (vdc_state + 18)
507a : 85 0f __ STA P2 
507c : ad a2 87 LDA $87a2 ; (vdc_state + 19)
507f : 85 10 __ STA P3 
5081 : a9 00 __ LDA #$00
5083 : 85 14 __ STA P7 
5085 : 85 12 __ STA P5 
5087 : 20 b3 1a JSR $1ab3 ; (bnk_redef_charset@proxy + 0)
.s3:
508a : a9 1a __ LDA #$1a
508c : 8d 00 d6 STA $d600 
.l139:
508f : 2c 00 d6 BIT $d600 
5092 : 10 fb __ BPL $508f ; (helpscreen_load.l139 + 0)
.s10:
5094 : ad 01 d6 LDA $d601 
5097 : 29 f0 __ AND #$f0
5099 : a2 1a __ LDX #$1a
509b : 8e 00 d6 STX $d600 
.l141:
509e : 2c 00 d6 BIT $d600 
50a1 : 10 fb __ BPL $509e ; (helpscreen_load.l141 + 0)
.s16:
50a3 : 8d 01 d6 STA $d601 
50a6 : a5 53 __ LDA T0 + 0 
50a8 : f0 03 __ BEQ $50ad ; (helpscreen_load.s19 + 0)
.s17:
50aa : 20 33 2e JSR $2e33 ; (vdc_set_mode@proxy + 0)
.s19:
50ad : a9 00 __ LDA #$00
50af : a0 02 __ LDY #$02
50b1 : 91 23 __ STA (SP + 0),y 
50b3 : a9 89 __ LDA #$89
50b5 : c8 __ __ INY
50b6 : 91 23 __ STA (SP + 0),y 
50b8 : a9 8d __ LDA #$8d
50ba : c8 __ __ INY
50bb : 91 23 __ STA (SP + 0),y 
50bd : a9 51 __ LDA #$51
50bf : c8 __ __ INY
50c0 : 91 23 __ STA (SP + 0),y 
50c2 : ad f8 ab LDA $abf8 ; (sstack + 5)
50c5 : 85 54 __ STA T1 + 0 
50c7 : c8 __ __ INY
50c8 : 91 23 __ STA (SP + 0),y 
50ca : a9 00 __ LDA #$00
50cc : c8 __ __ INY
50cd : 91 23 __ STA (SP + 0),y 
50cf : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
50d2 : a9 01 __ LDA #$01
50d4 : 85 10 __ STA P3 
50d6 : a9 00 __ LDA #$00
50d8 : 85 13 __ STA P6 
50da : a9 89 __ LDA #$89
50dc : 85 14 __ STA P7 
50de : ad ff 82 LDA $82ff ; (bootdevice + 0)
50e1 : 85 0f __ STA P2 
50e3 : a9 00 __ LDA #$00
50e5 : 85 11 __ STA P4 
50e7 : a9 20 __ LDA #$20
50e9 : 85 12 __ STA P5 
50eb : 20 6c 13 JSR $136c ; (bnk_load.s0 + 0)
50ee : a5 1b __ LDA ACCU + 0 
50f0 : d0 10 __ BNE $5102 ; (helpscreen_load.s20 + 0)
.s21:
50f2 : a9 00 __ LDA #$00
50f4 : 8d f6 ab STA $abf6 ; (sstack + 3)
50f7 : a9 52 __ LDA #$52
50f9 : 8d f7 ab STA $abf7 ; (sstack + 4)
50fc : 20 98 51 JSR $5198 ; (menu_messagepopup.s1000 + 0)
50ff : 4c 09 51 JMP $5109 ; (helpscreen_load.s145 + 0)
.s20:
5102 : a9 20 __ LDA #$20
5104 : 85 13 __ STA P6 
5106 : 20 17 1a JSR $1a17 ; (bnk_cpytovdc@proxy + 0)
.s145:
5109 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
510c : a5 53 __ LDA T0 + 0 
510e : f0 05 __ BEQ $5115 ; (helpscreen_load.s25 + 0)
.s23:
5110 : 85 16 __ STA P9 
5112 : 20 37 2e JSR $2e37 ; (vdc_set_mode.s0 + 0)
.s25:
5115 : a9 1a __ LDA #$1a
5117 : 8d 00 d6 STA $d600 
.l146:
511a : 2c 00 d6 BIT $d600 
511d : 10 fb __ BPL $511a ; (helpscreen_load.l146 + 0)
.s32:
511f : ad 01 d6 LDA $d601 
5122 : 29 f0 __ AND #$f0
5124 : 18 __ __ CLC
5125 : 6d ef 86 ADC $86ef ; (screenbackground + 0)
5128 : a2 1a __ LDX #$1a
512a : 8e 00 d6 STX $d600 
.l148:
512d : 2c 00 d6 BIT $d600 
5130 : 10 fb __ BPL $512d ; (helpscreen_load.l148 + 0)
.s38:
5132 : 8d 01 d6 STA $d601 
5135 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
5138 : ad fe 86 LDA $86fe ; (showbar + 0)
513b : f0 03 __ BEQ $5140 ; (helpscreen_load.s41 + 0)
.s39:
513d : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s41:
5140 : a5 54 __ LDA T1 + 0 
5142 : c9 02 __ CMP #$02
5144 : f0 0f __ BEQ $5155 ; (helpscreen_load.s152 + 0)
.s42:
5146 : ad eb 86 LDA $86eb ; (screen_col + 0)
5149 : 8d b7 87 STA $87b7 ; (canvas + 15)
514c : ad ed 86 LDA $86ed ; (screen_row + 0)
514f : 8d b8 87 STA $87b8 ; (canvas + 16)
5152 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
.s152:
5155 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
5158 : c9 01 __ CMP #$01
515a : d0 1b __ BNE $5177 ; (helpscreen_load.s1001 + 0)
.s47:
515c : a9 7f __ LDA #$7f
515e : 85 11 __ STA P4 
5160 : a9 01 __ LDA #$01
5162 : 85 15 __ STA P8 
5164 : ad a1 87 LDA $87a1 ; (vdc_state + 18)
5167 : 85 0f __ STA P2 
5169 : ad a2 87 LDA $87a2 ; (vdc_state + 19)
516c : 85 10 __ STA P3 
516e : a9 00 __ LDA #$00
5170 : 85 14 __ STA P7 
5172 : 85 12 __ STA P5 
5174 : 20 ac 1a JSR $1aac ; (bnk_redef_charset@proxy + 0)
.s1001:
5177 : 18 __ __ CLC
5178 : a5 23 __ LDA SP + 0 
517a : 69 08 __ ADC #$08
517c : 85 23 __ STA SP + 0 
517e : 90 02 __ BCC $5182 ; (helpscreen_load.s1001 + 11)
5180 : e6 24 __ INC SP + 1 
5182 : ad d1 ab LDA $abd1 ; (buff + 44)
5185 : 85 53 __ STA T0 + 0 
5187 : ad d2 ab LDA $abd2 ; (buff + 45)
518a : 85 54 __ STA T1 + 0 
518c : 60 __ __ RTS
--------------------------------------------------------------------
518d : __ __ __ BYT 56 44 43 53 45 48 53 43 25 55 00                : VDCSEHSC%U.
--------------------------------------------------------------------
menu_messagepopup: ; menu_messagepopup(const u8*)->void
.s1000:
5198 : a5 53 __ LDA T1 + 0 
519a : 8d ee ab STA $abee ; (palette_draw@stack + 15)
.s0:
519d : a9 00 __ LDA #$00
519f : 85 17 __ STA P10 
51a1 : a9 08 __ LDA #$08
51a3 : 85 18 __ STA P11 
51a5 : 8d f3 ab STA $abf3 ; (sstack + 0)
51a8 : a9 1e __ LDA #$1e
51aa : 8d f4 ab STA $abf4 ; (sstack + 1)
51ad : a9 06 __ LDA #$06
51af : 8d f5 ab STA $abf5 ; (sstack + 2)
51b2 : ad 96 87 LDA $8796 ; (vdc_state + 7)
51b5 : 85 53 __ STA T1 + 0 
51b7 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
51ba : 85 52 __ STA T0 + 0 
51bc : 8d 96 87 STA $8796 ; (vdc_state + 7)
51bf : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
51c2 : ad f6 ab LDA $abf6 ; (sstack + 3)
51c5 : 85 13 __ STA P6 
51c7 : ad f7 ab LDA $abf7 ; (sstack + 4)
51ca : 85 14 __ STA P7 
51cc : 20 b7 81 JSR $81b7 ; (vdc_prints_attr@proxy + 0)
51cf : a9 0b __ LDA #$0b
51d1 : 85 12 __ STA P5 
51d3 : 20 ac 81 JSR $81ac ; (vdc_prints_attr@proxy + 0)
51d6 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
51d9 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
51dc : a5 53 __ LDA T1 + 0 
51de : 8d 96 87 STA $8796 ; (vdc_state + 7)
.s1001:
51e1 : ad ee ab LDA $abee ; (palette_draw@stack + 15)
51e4 : 85 53 __ STA T1 + 0 
51e6 : 60 __ __ RTS
--------------------------------------------------------------------
menu_placebar@proxy: ; menu_placebar@proxy
51e7 : a9 00 __ LDA #$00
51e9 : 85 16 __ STA P9 
51eb : 4c 08 5e JMP $5e08 ; (menu_placebar.s0 + 0)
--------------------------------------------------------------------
51ee : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
51f3 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s0:
51f9 : 4c c3 ff JMP $ffc3 
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
51fc : 4c b7 ff JMP $ffb7 
--------------------------------------------------------------------
giocharmap:
51ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
5200 : __ __ __ BYT 69 4e 53 45 52 54 20 41 50 50 4c 49 43 41 54 49 : iNSERT APPLICATI
5210 : __ __ __ BYT 4f 4e 20 44 49 53 4b 20 54 4f 20 56 49 45 57 20 : ON DISK TO VIEW 
5220 : __ __ __ BYT 48 45 4c 50 2e 00                               : HELP..
--------------------------------------------------------------------
undo_new: ; undo_new(u8,u8,u8,u8)->void
.s1000:
5226 : a5 53 __ LDA T11 + 0 
5228 : 8d ec ab STA $abec ; (vp_fill + 31)
522b : a5 54 __ LDA T11 + 1 
522d : 8d ed ab STA $abed ; (palette_draw@stack + 14)
.s0:
5230 : ee fb 86 INC $86fb ; (undonumber + 0)
5233 : ad fd 86 LDA $86fd ; (undo_redopossible + 0)
5236 : f0 0c __ BEQ $5244 ; (undo_new.s2 + 0)
.s1:
5238 : a9 01 __ LDA #$01
523a : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
523d : a9 00 __ LDA #$00
523f : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
5242 : f0 03 __ BEQ $5247 ; (undo_new.s3 + 0)
.s2:
5244 : ee fc 86 INC $86fc ; (undo_undopossible + 0)
.s3:
5247 : a9 01 __ LDA #$01
5249 : 85 44 __ STA T1 + 0 
524b : a9 28 __ LDA #$28
524d : cd fb 86 CMP $86fb ; (undonumber + 0)
5250 : b0 05 __ BCS $5257 ; (undo_new.s6 + 0)
.s4:
5252 : a9 01 __ LDA #$01
5254 : 8d fb 86 STA $86fb ; (undonumber + 0)
.s6:
5257 : ad f3 ab LDA $abf3 ; (sstack + 0)
525a : 85 49 __ STA T4 + 0 
525c : 85 1b __ STA ACCU + 0 
525e : a9 00 __ LDA #$00
5260 : 85 1c __ STA ACCU + 1 
5262 : a5 18 __ LDA P11 ; (width + 0)
5264 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
5267 : a5 05 __ LDA WORK + 2 
5269 : 85 4a __ STA T5 + 0 
526b : 0a __ __ ASL
526c : 85 4c __ STA T6 + 0 
526e : a5 06 __ LDA WORK + 3 
5270 : 85 4b __ STA T5 + 1 
5272 : 2a __ __ ROL
5273 : 06 4c __ ASL T6 + 0 
5275 : 2a __ __ ROL
5276 : 85 4d __ STA T6 + 1 
5278 : ad f9 86 LDA $86f9 ; (undoaddress + 0)
527b : 18 __ __ CLC
527c : 65 4c __ ADC T6 + 0 
527e : aa __ __ TAX
527f : ad fa 86 LDA $86fa ; (undoaddress + 1)
5282 : 65 4d __ ADC T6 + 1 
5284 : cd fa 86 CMP $86fa ; (undoaddress + 1)
5287 : d0 03 __ BNE $528c ; (undo_new.s1009 + 0)
.s1008:
5289 : ec f9 86 CPX $86f9 ; (undoaddress + 0)
.s1009:
528c : b0 11 __ BCS $529f ; (undo_new.s9 + 0)
.s7:
528e : a9 01 __ LDA #$01
5290 : 8d fb 86 STA $86fb ; (undonumber + 0)
5293 : ad a3 87 LDA $87a3 ; (vdc_state + 20)
5296 : 8d f9 86 STA $86f9 ; (undoaddress + 0)
5299 : ad a4 87 LDA $87a4 ; (vdc_state + 21)
529c : 8d fa 86 STA $86fa ; (undoaddress + 1)
.s9:
529f : a9 00 __ LDA #$00
52a1 : 85 52 __ STA T9 + 0 
52a3 : ad f9 86 LDA $86f9 ; (undoaddress + 0)
52a6 : 18 __ __ CLC
52a7 : 65 4c __ ADC T6 + 0 
52a9 : 85 4c __ STA T6 + 0 
52ab : ad fa 86 LDA $86fa ; (undoaddress + 1)
52ae : 65 4d __ ADC T6 + 1 
52b0 : 85 4d __ STA T6 + 1 
52b2 : a9 ff __ LDA #$ff
52b4 : 4d a3 87 EOR $87a3 ; (vdc_state + 20)
52b7 : aa __ __ TAX
52b8 : a9 ff __ LDA #$ff
52ba : 4d a4 87 EOR $87a4 ; (vdc_state + 21)
52bd : c5 4d __ CMP T6 + 1 
52bf : d0 02 __ BNE $52c3 ; (undo_new.s1007 + 0)
.s1006:
52c1 : e4 4c __ CPX T6 + 0 
.s1007:
52c3 : b0 02 __ BCS $52c7 ; (undo_new.s12 + 0)
.s10:
52c5 : c6 44 __ DEC T1 + 0 
.s12:
52c7 : a5 49 __ LDA T4 + 0 
52c9 : f0 16 __ BEQ $52e1 ; (undo_new.s16 + 0)
.s24:
52cb : a5 17 __ LDA P10 ; (col + 0)
52cd : 85 45 __ STA T2 + 0 
52cf : a5 16 __ LDA P9 ; (row + 0)
52d1 : 85 4c __ STA T6 + 0 
52d3 : a9 7f __ LDA #$7f
52d5 : 85 11 __ STA P4 
52d7 : a5 18 __ LDA P11 ; (width + 0)
52d9 : 85 14 __ STA P7 
52db : a9 00 __ LDA #$00
52dd : 18 __ __ CLC
52de : 4c 6e 53 JMP $536e ; (undo_new.l1016 + 0)
.s16:
52e1 : ad fb 86 LDA $86fb ; (undonumber + 0)
52e4 : 85 52 __ STA T9 + 0 
52e6 : 0a __ __ ASL
52e7 : 0a __ __ ASL
52e8 : 0a __ __ ASL
52e9 : a2 00 __ LDX #$00
52eb : 90 01 __ BCC $52ee ; (undo_new.s1021 + 0)
.s1020:
52ed : e8 __ __ INX
.s1021:
52ee : 38 __ __ SEC
52ef : e5 52 __ SBC T9 + 0 
52f1 : b0 01 __ BCS $52f4 ; (undo_new.s1023 + 0)
.s1022:
52f3 : ca __ __ DEX
.s1023:
52f4 : 18 __ __ CLC
52f5 : 69 4b __ ADC #$4b
52f7 : 85 45 __ STA T2 + 0 
52f9 : 8a __ __ TXA
52fa : 69 89 __ ADC #$89
52fc : 85 46 __ STA T2 + 1 
52fe : ad fa 86 LDA $86fa ; (undoaddress + 1)
5301 : 85 48 __ STA T3 + 1 
5303 : ad f9 86 LDA $86f9 ; (undoaddress + 0)
5306 : 85 47 __ STA T3 + 0 
5308 : a0 00 __ LDY #$00
530a : 91 45 __ STA (T2 + 0),y 
530c : a5 48 __ LDA T3 + 1 
530e : c8 __ __ INY
530f : 91 45 __ STA (T2 + 0),y 
5311 : a5 4a __ LDA T5 + 0 
5313 : 85 1b __ STA ACCU + 0 
5315 : a5 4b __ LDA T5 + 1 
5317 : 85 1c __ STA ACCU + 1 
5319 : a5 44 __ LDA T1 + 0 
531b : 0a __ __ ASL
531c : 18 __ __ CLC
531d : 69 02 __ ADC #$02
531f : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
5322 : 18 __ __ CLC
5323 : a5 05 __ LDA WORK + 2 
5325 : 65 47 __ ADC T3 + 0 
5327 : 8d f9 86 STA $86f9 ; (undoaddress + 0)
532a : a5 06 __ LDA WORK + 3 
532c : 65 48 __ ADC T3 + 1 
532e : 8d fa 86 STA $86fa ; (undoaddress + 1)
5331 : a5 52 __ LDA T9 + 0 
5333 : c9 28 __ CMP #$28
5335 : a9 00 __ LDA #$00
5337 : b0 09 __ BCS $5342 ; (undo_new.s22 + 0)
.s21:
5339 : a0 07 __ LDY #$07
533b : 91 45 __ STA (T2 + 0),y 
533d : c8 __ __ INY
533e : 91 45 __ STA (T2 + 0),y 
5340 : 90 06 __ BCC $5348 ; (undo_new.s23 + 0)
.s22:
5342 : 8d 52 89 STA $8952 ; (Undo + 0)
5345 : 8d 53 89 STA $8953 ; (Undo + 1)
.s23:
5348 : a5 49 __ LDA T4 + 0 
534a : a0 04 __ LDY #$04
534c : 91 45 __ STA (T2 + 0),y 
534e : a5 18 __ LDA P11 ; (width + 0)
5350 : c8 __ __ INY
5351 : 91 45 __ STA (T2 + 0),y 
5353 : a5 44 __ LDA T1 + 0 
5355 : c8 __ __ INY
5356 : 91 45 __ STA (T2 + 0),y 
5358 : a5 17 __ LDA P10 ; (col + 0)
535a : a0 03 __ LDY #$03
535c : 91 45 __ STA (T2 + 0),y 
535e : a5 16 __ LDA P9 ; (row + 0)
5360 : 88 __ __ DEY
5361 : 91 45 __ STA (T2 + 0),y 
.s1001:
5363 : ad ec ab LDA $abec ; (vp_fill + 31)
5366 : 85 53 __ STA T11 + 0 
5368 : ad ed ab LDA $abed ; (palette_draw@stack + 14)
536b : 85 54 __ STA T11 + 1 
536d : 60 __ __ RTS
.l1016:
536e : 65 4c __ ADC T6 + 0 
5370 : 85 03 __ STA WORK + 0 
5372 : a9 00 __ LDA #$00
5374 : 85 15 __ STA P8 
5376 : 2a __ __ ROL
5377 : 85 04 __ STA WORK + 1 
5379 : ad ab 87 LDA $87ab ; (canvas + 3)
537c : 85 53 __ STA T11 + 0 
537e : 85 1b __ STA ACCU + 0 
5380 : ad ac 87 LDA $87ac ; (canvas + 4)
5383 : 85 54 __ STA T11 + 1 
5385 : 85 1c __ STA ACCU + 1 
5387 : 20 62 7c JSR $7c62 ; (mul16 + 0)
538a : 18 __ __ CLC
538b : a5 05 __ LDA WORK + 2 
538d : 65 45 __ ADC T2 + 0 
538f : 85 50 __ STA T8 + 0 
5391 : 85 12 __ STA P5 
5393 : a5 06 __ LDA WORK + 3 
5395 : 69 58 __ ADC #$58
5397 : 85 51 __ STA T8 + 1 
5399 : 85 13 __ STA P6 
539b : a5 52 __ LDA T9 + 0 
539d : 85 1b __ STA ACCU + 0 
539f : a9 00 __ LDA #$00
53a1 : 85 1c __ STA ACCU + 1 
53a3 : a5 14 __ LDA P7 
53a5 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
53a8 : a5 05 __ LDA WORK + 2 
53aa : 85 4e __ STA T7 + 0 
53ac : a5 06 __ LDA WORK + 3 
53ae : 85 4f __ STA T7 + 1 
53b0 : ad f9 86 LDA $86f9 ; (undoaddress + 0)
53b3 : 18 __ __ CLC
53b4 : 65 05 __ ADC WORK + 2 
53b6 : 85 0f __ STA P2 
53b8 : ad fa 86 LDA $86fa ; (undoaddress + 1)
53bb : 65 06 __ ADC WORK + 3 
53bd : 85 10 __ STA P3 
53bf : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
53c2 : a9 00 __ LDA #$00
53c4 : 85 15 __ STA P8 
53c6 : ad ad 87 LDA $87ad ; (canvas + 5)
53c9 : 85 1b __ STA ACCU + 0 
53cb : ad ae 87 LDA $87ae ; (canvas + 6)
53ce : 85 1c __ STA ACCU + 1 
53d0 : a5 53 __ LDA T11 + 0 
53d2 : 85 03 __ STA WORK + 0 
53d4 : a5 54 __ LDA T11 + 1 
53d6 : 85 04 __ STA WORK + 1 
53d8 : 20 62 7c JSR $7c62 ; (mul16 + 0)
53db : 18 __ __ CLC
53dc : a5 05 __ LDA WORK + 2 
53de : 65 50 __ ADC T8 + 0 
53e0 : aa __ __ TAX
53e1 : a5 06 __ LDA WORK + 3 
53e3 : 65 51 __ ADC T8 + 1 
53e5 : a8 __ __ TAY
53e6 : 8a __ __ TXA
53e7 : 18 __ __ CLC
53e8 : 69 30 __ ADC #$30
53ea : 85 12 __ STA P5 
53ec : 90 01 __ BCC $53ef ; (undo_new.s1019 + 0)
.s1018:
53ee : c8 __ __ INY
.s1019:
53ef : 84 13 __ STY P6 
53f1 : 18 __ __ CLC
53f2 : a5 4a __ LDA T5 + 0 
53f4 : 6d f9 86 ADC $86f9 ; (undoaddress + 0)
53f7 : a8 __ __ TAY
53f8 : a5 4b __ LDA T5 + 1 
53fa : 6d fa 86 ADC $86fa ; (undoaddress + 1)
53fd : aa __ __ TAX
53fe : 98 __ __ TYA
53ff : 18 __ __ CLC
5400 : 65 4e __ ADC T7 + 0 
5402 : 85 0f __ STA P2 
5404 : 8a __ __ TXA
5405 : 65 4f __ ADC T7 + 1 
5407 : 85 10 __ STA P3 
5409 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
540c : e6 52 __ INC T9 + 0 
540e : a5 52 __ LDA T9 + 0 
5410 : c5 49 __ CMP T4 + 0 
5412 : b0 03 __ BCS $5417 ; (undo_new.s1019 + 40)
5414 : 4c 6e 53 JMP $536e ; (undo_new.l1016 + 0)
5417 : 4c e1 52 JMP $52e1 ; (undo_new.s16 + 0)
--------------------------------------------------------------------
screenmapplot: ; screenmapplot(u8,u8,u8,u8)->void
.s0:
541a : ad ab 87 LDA $87ab ; (canvas + 3)
541d : 85 1b __ STA ACCU + 0 
541f : ad ac 87 LDA $87ac ; (canvas + 4)
5422 : 85 1c __ STA ACCU + 1 
5424 : a5 10 __ LDA P3 ; (row + 0)
5426 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
5429 : 18 __ __ CLC
542a : a5 05 __ LDA WORK + 2 
542c : 65 11 __ ADC P4 ; (col + 0)
542e : 85 0d __ STA P0 
5430 : a5 06 __ LDA WORK + 3 
5432 : 69 58 __ ADC #$58
5434 : 85 0e __ STA P1 
5436 : a5 12 __ LDA P5 ; (screencode + 0)
5438 : 85 0f __ STA P2 
543a : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
543d : ad ab 87 LDA $87ab ; (canvas + 3)
5440 : 85 1b __ STA ACCU + 0 
5442 : ad ac 87 LDA $87ac ; (canvas + 4)
5445 : 85 1c __ STA ACCU + 1 
5447 : a5 10 __ LDA P3 ; (row + 0)
5449 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
544c : 18 __ __ CLC
544d : a5 05 __ LDA WORK + 2 
544f : 65 11 __ ADC P4 ; (col + 0)
5451 : 85 43 __ STA T1 + 0 
5453 : a5 06 __ LDA WORK + 3 
5455 : 69 58 __ ADC #$58
5457 : 85 44 __ STA T1 + 1 
5459 : ad ad 87 LDA $87ad ; (canvas + 5)
545c : 85 1b __ STA ACCU + 0 
545e : ad ae 87 LDA $87ae ; (canvas + 6)
5461 : 85 1c __ STA ACCU + 1 
5463 : ad ab 87 LDA $87ab ; (canvas + 3)
5466 : 85 03 __ STA WORK + 0 
5468 : ad ac 87 LDA $87ac ; (canvas + 4)
546b : 85 04 __ STA WORK + 1 
546d : 20 62 7c JSR $7c62 ; (mul16 + 0)
5470 : 18 __ __ CLC
5471 : a5 05 __ LDA WORK + 2 
5473 : 65 43 __ ADC T1 + 0 
5475 : a8 __ __ TAY
5476 : a5 06 __ LDA WORK + 3 
5478 : 65 44 __ ADC T1 + 1 
547a : aa __ __ TAX
547b : 98 __ __ TYA
547c : 18 __ __ CLC
547d : 69 30 __ ADC #$30
547f : 85 0d __ STA P0 
5481 : 90 01 __ BCC $5484 ; (screenmapplot.s1003 + 0)
.s1002:
5483 : e8 __ __ INX
.s1003:
5484 : 86 0e __ STX P1 
5486 : a5 13 __ LDA P6 ; (attribute + 0)
5488 : 85 0f __ STA P2 
548a : 4c 10 15 JMP $1510 ; (bnk_writeb.s0 + 0)
--------------------------------------------------------------------
undo_performundo: ; undo_performundo()->void
.s1000:
548d : a2 15 __ LDX #$15
548f : b5 53 __ LDA T0 + 0,x 
5491 : 9d ba ab STA $abba,x ; (projbuffer + 34)
5494 : ca __ __ DEX
5495 : 10 f8 __ BPL $548f ; (undo_performundo.s1000 + 2)
.s0:
5497 : ad fc 86 LDA $86fc ; (undo_undopossible + 0)
549a : d0 0e __ BNE $54aa ; (undo_performundo.s1 + 0)
.s1001:
549c : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
549f : a2 15 __ LDX #$15
54a1 : bd ba ab LDA $abba,x ; (projbuffer + 34)
54a4 : 95 53 __ STA T0 + 0,x 
54a6 : ca __ __ DEX
54a7 : 10 f8 __ BPL $54a1 ; (undo_performundo.s1001 + 5)
54a9 : 60 __ __ RTS
.s1:
54aa : ad fb 86 LDA $86fb ; (undonumber + 0)
54ad : 0a __ __ ASL
54ae : 0a __ __ ASL
54af : 0a __ __ ASL
54b0 : a2 00 __ LDX #$00
54b2 : 90 01 __ BCC $54b5 ; (undo_performundo.s1006 + 0)
.s1005:
54b4 : e8 __ __ INX
.s1006:
54b5 : 38 __ __ SEC
54b6 : ed fb 86 SBC $86fb ; (undonumber + 0)
54b9 : b0 01 __ BCS $54bc ; (undo_performundo.s1008 + 0)
.s1007:
54bb : ca __ __ DEX
.s1008:
54bc : 18 __ __ CLC
54bd : 69 4b __ ADC #$4b
54bf : 85 54 __ STA T1 + 0 
54c1 : 8a __ __ TXA
54c2 : 69 89 __ ADC #$89
54c4 : 85 55 __ STA T1 + 1 
54c6 : a0 04 __ LDY #$04
54c8 : b1 54 __ LDA (T1 + 0),y 
54ca : f0 2c __ BEQ $54f8 ; (undo_performundo.s7 + 0)
.s39:
54cc : 85 53 __ STA T0 + 0 
54ce : 85 1b __ STA ACCU + 0 
54d0 : c8 __ __ INY
54d1 : b1 54 __ LDA (T1 + 0),y 
54d3 : 85 56 __ STA T2 + 0 
54d5 : 85 57 __ STA T3 + 0 
54d7 : a9 00 __ LDA #$00
54d9 : 85 5a __ STA T5 + 0 
54db : 85 1c __ STA ACCU + 1 
54dd : a5 56 __ LDA T2 + 0 
54df : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
54e2 : a5 05 __ LDA WORK + 2 
54e4 : 85 58 __ STA T4 + 0 
54e6 : a5 06 __ LDA WORK + 3 
54e8 : 85 59 __ STA T4 + 1 
54ea : a0 03 __ LDY #$03
54ec : b1 54 __ LDA (T1 + 0),y 
54ee : 85 5b __ STA T6 + 0 
54f0 : 88 __ __ DEY
54f1 : b1 54 __ LDA (T1 + 0),y 
54f3 : 85 5c __ STA T7 + 0 
54f5 : 4c 95 55 JMP $5595 ; (undo_performundo.l5 + 0)
.s7:
54f8 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
54fb : ad fe 86 LDA $86fe ; (showbar + 0)
54fe : f0 03 __ BEQ $5503 ; (undo_performundo.s21 + 0)
.s19:
5500 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s21:
5503 : ad fb 86 LDA $86fb ; (undonumber + 0)
5506 : 85 53 __ STA T0 + 0 
5508 : 0a __ __ ASL
5509 : 0a __ __ ASL
550a : 0a __ __ ASL
550b : a2 00 __ LDX #$00
550d : 90 01 __ BCC $5510 ; (undo_performundo.s1014 + 0)
.s1013:
550f : e8 __ __ INX
.s1014:
5510 : 38 __ __ SEC
5511 : e5 53 __ SBC T0 + 0 
5513 : b0 01 __ BCS $5516 ; (undo_performundo.s1016 + 0)
.s1015:
5515 : ca __ __ DEX
.s1016:
5516 : 18 __ __ CLC
5517 : 69 4b __ ADC #$4b
5519 : 85 54 __ STA T1 + 0 
551b : 8a __ __ TXA
551c : 69 89 __ ADC #$89
551e : 85 55 __ STA T1 + 1 
5520 : a0 00 __ LDY #$00
5522 : b1 54 __ LDA (T1 + 0),y 
5524 : 8d f9 86 STA $86f9 ; (undoaddress + 0)
5527 : c8 __ __ INY
5528 : b1 54 __ LDA (T1 + 0),y 
552a : 8d fa 86 STA $86fa ; (undoaddress + 1)
552d : c6 53 __ DEC T0 + 0 
552f : a5 53 __ LDA T0 + 0 
5531 : 8d fb 86 STA $86fb ; (undonumber + 0)
5534 : a0 06 __ LDY #$06
5536 : b1 54 __ LDA (T1 + 0),y 
5538 : f0 07 __ BEQ $5541 ; (undo_performundo.s24 + 0)
.s22:
553a : a9 02 __ LDA #$02
553c : 91 54 __ STA (T1 + 0),y 
553e : ee fd 86 INC $86fd ; (undo_redopossible + 0)
.s24:
5541 : ce fc 86 DEC $86fc ; (undo_undopossible + 0)
5544 : a5 53 __ LDA T0 + 0 
5546 : d0 0d __ BNE $5555 ; (undo_performundo.s27 + 0)
.s25:
5548 : ad 63 8a LDA $8a63 ; (Undo + 273)
554b : 0d 64 8a ORA $8a64 ; (Undo + 274)
554e : f0 05 __ BEQ $5555 ; (undo_performundo.s27 + 0)
.s28:
5550 : a9 28 __ LDA #$28
5552 : 8d fb 86 STA $86fb ; (undonumber + 0)
.s27:
5555 : ad fb 86 LDA $86fb ; (undonumber + 0)
5558 : f0 2a __ BEQ $5584 ; (undo_performundo.s38 + 0)
.s34:
555a : 0a __ __ ASL
555b : 0a __ __ ASL
555c : 0a __ __ ASL
555d : a2 00 __ LDX #$00
555f : 90 01 __ BCC $5562 ; (undo_performundo.s1018 + 0)
.s1017:
5561 : e8 __ __ INX
.s1018:
5562 : 38 __ __ SEC
5563 : ed fb 86 SBC $86fb ; (undonumber + 0)
5566 : b0 01 __ BCS $5569 ; (undo_performundo.s1020 + 0)
.s1019:
5568 : ca __ __ DEX
.s1020:
5569 : 18 __ __ CLC
556a : 69 4b __ ADC #$4b
556c : 85 54 __ STA T1 + 0 
556e : 8a __ __ TXA
556f : 69 89 __ ADC #$89
5571 : 85 55 __ STA T1 + 1 
5573 : a0 00 __ LDY #$00
5575 : b1 54 __ LDA (T1 + 0),y 
5577 : c8 __ __ INY
5578 : 11 54 __ ORA (T1 + 0),y 
557a : f0 13 __ BEQ $558f ; (undo_performundo.s1004 + 0)
.s33:
557c : ad fb 86 LDA $86fb ; (undonumber + 0)
557f : f0 03 __ BEQ $5584 ; (undo_performundo.s38 + 0)
5581 : 4c 9c 54 JMP $549c ; (undo_performundo.s1001 + 0)
.s38:
5584 : ad 63 8a LDA $8a63 ; (Undo + 273)
5587 : 0d 64 8a ORA $8a64 ; (Undo + 274)
558a : f0 03 __ BEQ $558f ; (undo_performundo.s1004 + 0)
558c : 4c 9c 54 JMP $549c ; (undo_performundo.s1001 + 0)
.s1004:
558f : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
5592 : 4c 9c 54 JMP $549c ; (undo_performundo.s1001 + 0)
.l5:
5595 : a0 06 __ LDY #$06
5597 : b1 54 __ LDA (T1 + 0),y 
5599 : f0 03 __ BEQ $559e ; (undo_performundo.s10 + 0)
559b : 4c 73 56 JMP $5673 ; (undo_performundo.s8 + 0)
.s10:
559e : a9 7f __ LDA #$7f
55a0 : 85 0d __ STA P0 
55a2 : 18 __ __ CLC
55a3 : a5 5a __ LDA T5 + 0 
55a5 : 65 5c __ ADC T7 + 0 
55a7 : 85 5f __ STA T10 + 0 
55a9 : 85 03 __ STA WORK + 0 
55ab : a9 00 __ LDA #$00
55ad : 85 13 __ STA P6 
55af : 2a __ __ ROL
55b0 : 85 60 __ STA T10 + 1 
55b2 : 85 04 __ STA WORK + 1 
55b4 : ad ab 87 LDA $87ab ; (canvas + 3)
55b7 : 85 1b __ STA ACCU + 0 
55b9 : ad ac 87 LDA $87ac ; (canvas + 4)
55bc : 85 1c __ STA ACCU + 1 
55be : 20 62 7c JSR $7c62 ; (mul16 + 0)
55c1 : 18 __ __ CLC
55c2 : a5 05 __ LDA WORK + 2 
55c4 : 65 5b __ ADC T6 + 0 
55c6 : 85 0e __ STA P1 
55c8 : a5 06 __ LDA WORK + 3 
55ca : 69 58 __ ADC #$58
55cc : 85 0f __ STA P2 
55ce : a5 5a __ LDA T5 + 0 
55d0 : 85 1b __ STA ACCU + 0 
55d2 : a9 00 __ LDA #$00
55d4 : 85 1c __ STA ACCU + 1 
55d6 : a5 57 __ LDA T3 + 0 
55d8 : 85 12 __ STA P5 
55da : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
55dd : a5 05 __ LDA WORK + 2 
55df : 85 5d __ STA T8 + 0 
55e1 : a5 06 __ LDA WORK + 3 
55e3 : 85 5e __ STA T8 + 1 
55e5 : 18 __ __ CLC
55e6 : a0 00 __ LDY #$00
55e8 : b1 54 __ LDA (T1 + 0),y 
55ea : 65 05 __ ADC WORK + 2 
55ec : 85 10 __ STA P3 
55ee : c8 __ __ INY
55ef : b1 54 __ LDA (T1 + 0),y 
55f1 : 65 06 __ ADC WORK + 3 
55f3 : 85 11 __ STA P4 
55f5 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
55f8 : ad ab 87 LDA $87ab ; (canvas + 3)
55fb : 85 1b __ STA ACCU + 0 
55fd : ad ac 87 LDA $87ac ; (canvas + 4)
5600 : 85 1c __ STA ACCU + 1 
5602 : a5 5f __ LDA T10 + 0 
5604 : 85 03 __ STA WORK + 0 
5606 : a5 60 __ LDA T10 + 1 
5608 : 85 04 __ STA WORK + 1 
560a : 20 62 7c JSR $7c62 ; (mul16 + 0)
560d : 18 __ __ CLC
560e : a5 05 __ LDA WORK + 2 
5610 : 65 5b __ ADC T6 + 0 
5612 : 85 5f __ STA T10 + 0 
5614 : a5 06 __ LDA WORK + 3 
5616 : 69 58 __ ADC #$58
5618 : 85 60 __ STA T10 + 1 
561a : ad ad 87 LDA $87ad ; (canvas + 5)
561d : 85 1b __ STA ACCU + 0 
561f : ad ae 87 LDA $87ae ; (canvas + 6)
5622 : 85 1c __ STA ACCU + 1 
5624 : ad ab 87 LDA $87ab ; (canvas + 3)
5627 : 85 03 __ STA WORK + 0 
5629 : ad ac 87 LDA $87ac ; (canvas + 4)
562c : 85 04 __ STA WORK + 1 
562e : 20 62 7c JSR $7c62 ; (mul16 + 0)
5631 : 18 __ __ CLC
5632 : a5 05 __ LDA WORK + 2 
5634 : 65 5f __ ADC T10 + 0 
5636 : aa __ __ TAX
5637 : a5 06 __ LDA WORK + 3 
5639 : 65 60 __ ADC T10 + 1 
563b : a8 __ __ TAY
563c : 8a __ __ TXA
563d : 18 __ __ CLC
563e : 69 30 __ ADC #$30
5640 : 85 0e __ STA P1 
5642 : 90 01 __ BCC $5645 ; (undo_performundo.s1012 + 0)
.s1011:
5644 : c8 __ __ INY
.s1012:
5645 : 84 0f __ STY P2 
5647 : a0 00 __ LDY #$00
5649 : 84 13 __ STY P6 
564b : b1 54 __ LDA (T1 + 0),y 
564d : 18 __ __ CLC
564e : 65 58 __ ADC T4 + 0 
5650 : aa __ __ TAX
5651 : c8 __ __ INY
5652 : b1 54 __ LDA (T1 + 0),y 
5654 : 65 59 __ ADC T4 + 1 
5656 : a8 __ __ TAY
5657 : 8a __ __ TXA
5658 : 18 __ __ CLC
5659 : 65 5d __ ADC T8 + 0 
565b : 85 10 __ STA P3 
565d : 98 __ __ TYA
565e : 65 5e __ ADC T8 + 1 
5660 : 85 11 __ STA P4 
5662 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
5665 : e6 5a __ INC T5 + 0 
5667 : a5 5a __ LDA T5 + 0 
5669 : c5 53 __ CMP T0 + 0 
566b : b0 03 __ BCS $5670 ; (undo_performundo.s1012 + 43)
566d : 4c 95 55 JMP $5595 ; (undo_performundo.l5 + 0)
5670 : 4c f8 54 JMP $54f8 ; (undo_performundo.s7 + 0)
.s8:
5673 : a9 7f __ LDA #$7f
5675 : 85 11 __ STA P4 
5677 : 18 __ __ CLC
5678 : a5 5c __ LDA T7 + 0 
567a : 65 5a __ ADC T5 + 0 
567c : 85 03 __ STA WORK + 0 
567e : a9 00 __ LDA #$00
5680 : 2a __ __ ROL
5681 : 85 04 __ STA WORK + 1 
5683 : ad ab 87 LDA $87ab ; (canvas + 3)
5686 : 85 61 __ STA T11 + 0 
5688 : 85 1b __ STA ACCU + 0 
568a : ad ac 87 LDA $87ac ; (canvas + 4)
568d : 85 62 __ STA T11 + 1 
568f : 85 1c __ STA ACCU + 1 
5691 : 20 62 7c JSR $7c62 ; (mul16 + 0)
5694 : 18 __ __ CLC
5695 : a5 05 __ LDA WORK + 2 
5697 : 65 5b __ ADC T6 + 0 
5699 : 85 5f __ STA T10 + 0 
569b : 85 12 __ STA P5 
569d : a5 06 __ LDA WORK + 3 
569f : 69 58 __ ADC #$58
56a1 : 85 60 __ STA T10 + 1 
56a3 : 85 13 __ STA P6 
56a5 : a9 00 __ LDA #$00
56a7 : 85 15 __ STA P8 
56a9 : 85 1c __ STA ACCU + 1 
56ab : a5 53 __ LDA T0 + 0 
56ad : 85 1b __ STA ACCU + 0 
56af : a5 56 __ LDA T2 + 0 
56b1 : 85 14 __ STA P7 
56b3 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
56b6 : a5 05 __ LDA WORK + 2 
56b8 : 85 63 __ STA T13 + 0 
56ba : 0a __ __ ASL
56bb : 85 44 __ STA T14 + 0 
56bd : a5 06 __ LDA WORK + 3 
56bf : 85 64 __ STA T13 + 1 
56c1 : 2a __ __ ROL
56c2 : 85 45 __ STA T14 + 1 
56c4 : a0 00 __ LDY #$00
56c6 : 84 1c __ STY ACCU + 1 
56c8 : b1 54 __ LDA (T1 + 0),y 
56ca : 85 65 __ STA T15 + 0 
56cc : 18 __ __ CLC
56cd : 65 44 __ ADC T14 + 0 
56cf : 85 44 __ STA T14 + 0 
56d1 : c8 __ __ INY
56d2 : b1 54 __ LDA (T1 + 0),y 
56d4 : 85 66 __ STA T15 + 1 
56d6 : 65 45 __ ADC T14 + 1 
56d8 : 85 45 __ STA T14 + 1 
56da : a5 5a __ LDA T5 + 0 
56dc : 85 1b __ STA ACCU + 0 
56de : a5 14 __ LDA P7 
56e0 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
56e3 : a5 05 __ LDA WORK + 2 
56e5 : 85 67 __ STA T16 + 0 
56e7 : 18 __ __ CLC
56e8 : 65 44 __ ADC T14 + 0 
56ea : 85 0f __ STA P2 
56ec : a5 06 __ LDA WORK + 3 
56ee : 85 68 __ STA T16 + 1 
56f0 : 65 45 __ ADC T14 + 1 
56f2 : 85 10 __ STA P3 
56f4 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
56f7 : a9 00 __ LDA #$00
56f9 : 85 15 __ STA P8 
56fb : ad ad 87 LDA $87ad ; (canvas + 5)
56fe : 85 1b __ STA ACCU + 0 
5700 : ad ae 87 LDA $87ae ; (canvas + 6)
5703 : 85 1c __ STA ACCU + 1 
5705 : a5 61 __ LDA T11 + 0 
5707 : 85 03 __ STA WORK + 0 
5709 : a5 62 __ LDA T11 + 1 
570b : 85 04 __ STA WORK + 1 
570d : 20 62 7c JSR $7c62 ; (mul16 + 0)
5710 : 18 __ __ CLC
5711 : a5 05 __ LDA WORK + 2 
5713 : 65 5f __ ADC T10 + 0 
5715 : aa __ __ TAX
5716 : a5 06 __ LDA WORK + 3 
5718 : 65 60 __ ADC T10 + 1 
571a : a8 __ __ TAY
571b : 8a __ __ TXA
571c : 18 __ __ CLC
571d : 69 30 __ ADC #$30
571f : 85 12 __ STA P5 
5721 : 90 01 __ BCC $5724 ; (undo_performundo.s1010 + 0)
.s1009:
5723 : c8 __ __ INY
.s1010:
5724 : 84 13 __ STY P6 
5726 : a5 63 __ LDA T13 + 0 
5728 : 0a __ __ ASL
5729 : a8 __ __ TAY
572a : a5 64 __ LDA T13 + 1 
572c : 2a __ __ ROL
572d : aa __ __ TAX
572e : 98 __ __ TYA
572f : 18 __ __ CLC
5730 : 65 63 __ ADC T13 + 0 
5732 : a8 __ __ TAY
5733 : 8a __ __ TXA
5734 : 65 64 __ ADC T13 + 1 
5736 : aa __ __ TAX
5737 : 98 __ __ TYA
5738 : 18 __ __ CLC
5739 : 65 65 __ ADC T15 + 0 
573b : a8 __ __ TAY
573c : 8a __ __ TXA
573d : 65 66 __ ADC T15 + 1 
573f : aa __ __ TAX
5740 : 98 __ __ TYA
5741 : 18 __ __ CLC
5742 : 65 67 __ ADC T16 + 0 
5744 : 85 0f __ STA P2 
5746 : 8a __ __ TXA
5747 : 65 68 __ ADC T16 + 1 
5749 : 85 10 __ STA P3 
574b : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
574e : 4c 9e 55 JMP $559e ; (undo_performundo.s10 + 0)
--------------------------------------------------------------------
undo_performredo: ; undo_performredo()->void
.s1000:
5751 : a2 0f __ LDX #$0f
5753 : b5 53 __ LDA T0 + 0,x 
5755 : 9d c2 ab STA $abc2,x ; (projbuffer + 42)
5758 : ca __ __ DEX
5759 : 10 f8 __ BPL $5753 ; (undo_performredo.s1000 + 2)
.s0:
575b : ad fd 86 LDA $86fd ; (undo_redopossible + 0)
575e : d0 0e __ BNE $576e ; (undo_performredo.s1 + 0)
.s1001:
5760 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
5763 : a2 0f __ LDX #$0f
5765 : bd c2 ab LDA $abc2,x ; (projbuffer + 42)
5768 : 95 53 __ STA T0 + 0,x 
576a : ca __ __ DEX
576b : 10 f8 __ BPL $5765 ; (undo_performredo.s1001 + 5)
576d : 60 __ __ RTS
.s1:
576e : 85 53 __ STA T0 + 0 
5770 : ad fb 86 LDA $86fb ; (undonumber + 0)
5773 : c9 27 __ CMP #$27
5775 : 90 04 __ BCC $577b ; (undo_performredo.s4 + 0)
.s5:
5777 : a9 01 __ LDA #$01
5779 : b0 02 __ BCS $577d ; (undo_performredo.s6 + 0)
.s4:
577b : 69 01 __ ADC #$01
.s6:
577d : 8d fb 86 STA $86fb ; (undonumber + 0)
5780 : 0a __ __ ASL
5781 : 0a __ __ ASL
5782 : 0a __ __ ASL
5783 : a2 00 __ LDX #$00
5785 : 90 01 __ BCC $5788 ; (undo_performredo.s1018 + 0)
.s1017:
5787 : e8 __ __ INX
.s1018:
5788 : 38 __ __ SEC
5789 : ed fb 86 SBC $86fb ; (undonumber + 0)
578c : b0 01 __ BCS $578f ; (undo_performredo.s1020 + 0)
.s1019:
578e : ca __ __ DEX
.s1020:
578f : 18 __ __ CLC
5790 : 69 4b __ ADC #$4b
5792 : 85 56 __ STA T3 + 0 
5794 : 8a __ __ TXA
5795 : 69 89 __ ADC #$89
5797 : 85 57 __ STA T3 + 1 
5799 : a0 04 __ LDY #$04
579b : b1 56 __ LDA (T3 + 0),y 
579d : f0 41 __ BEQ $57e0 ; (undo_performredo.s10 + 0)
.s26:
579f : 85 54 __ STA T1 + 0 
57a1 : 85 1b __ STA ACCU + 0 
57a3 : a9 00 __ LDA #$00
57a5 : 85 55 __ STA T2 + 0 
57a7 : 85 1c __ STA ACCU + 1 
57a9 : c8 __ __ INY
57aa : b1 56 __ LDA (T3 + 0),y 
57ac : 85 12 __ STA P5 
57ae : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
57b1 : a5 05 __ LDA WORK + 2 
57b3 : 85 58 __ STA T5 + 0 
57b5 : 0a __ __ ASL
57b6 : a8 __ __ TAY
57b7 : a5 06 __ LDA WORK + 3 
57b9 : 85 59 __ STA T5 + 1 
57bb : 2a __ __ ROL
57bc : aa __ __ TAX
57bd : 98 __ __ TYA
57be : 18 __ __ CLC
57bf : 65 05 __ ADC WORK + 2 
57c1 : 85 5a __ STA T6 + 0 
57c3 : 8a __ __ TXA
57c4 : 65 06 __ ADC WORK + 3 
57c6 : 85 5b __ STA T6 + 1 
57c8 : 06 58 __ ASL T5 + 0 
57ca : 26 59 __ ROL T5 + 1 
57cc : a0 02 __ LDY #$02
57ce : b1 56 __ LDA (T3 + 0),y 
57d0 : 85 5c __ STA T7 + 0 
57d2 : c8 __ __ INY
57d3 : b1 56 __ LDA (T3 + 0),y 
57d5 : 85 56 __ STA T3 + 0 
57d7 : a9 7f __ LDA #$7f
57d9 : 85 0d __ STA P0 
57db : a9 00 __ LDA #$00
57dd : 18 __ __ CLC
57de : 90 62 __ BCC $5842 ; (undo_performredo.l1015 + 0)
.s10:
57e0 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
57e3 : ad fe 86 LDA $86fe ; (showbar + 0)
57e6 : f0 03 __ BEQ $57eb ; (undo_performredo.s17 + 0)
.s15:
57e8 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s17:
57eb : ad fb 86 LDA $86fb ; (undonumber + 0)
57ee : 0a __ __ ASL
57ef : 0a __ __ ASL
57f0 : 0a __ __ ASL
57f1 : a2 00 __ LDX #$00
57f3 : 90 01 __ BCC $57f6 ; (undo_performredo.s1028 + 0)
.s1027:
57f5 : e8 __ __ INX
.s1028:
57f6 : 38 __ __ SEC
57f7 : ed fb 86 SBC $86fb ; (undonumber + 0)
57fa : b0 01 __ BCS $57fd ; (undo_performredo.s1030 + 0)
.s1029:
57fc : ca __ __ DEX
.s1030:
57fd : 18 __ __ CLC
57fe : 69 4b __ ADC #$4b
5800 : 85 56 __ STA T3 + 0 
5802 : 8a __ __ TXA
5803 : 69 89 __ ADC #$89
5805 : 85 57 __ STA T3 + 1 
5807 : a0 00 __ LDY #$00
5809 : b1 56 __ LDA (T3 + 0),y 
580b : 8d f9 86 STA $86f9 ; (undoaddress + 0)
580e : c8 __ __ INY
580f : b1 56 __ LDA (T3 + 0),y 
5811 : 8d fa 86 STA $86fa ; (undoaddress + 1)
5814 : ee fc 86 INC $86fc ; (undo_undopossible + 0)
5817 : a6 53 __ LDX T0 + 0 
5819 : ca __ __ DEX
581a : 8e fd 86 STX $86fd ; (undo_redopossible + 0)
581d : ad fb 86 LDA $86fb ; (undonumber + 0)
5820 : c9 27 __ CMP #$27
5822 : b0 06 __ BCS $582a ; (undo_performredo.s20 + 0)
.s21:
5824 : a0 0d __ LDY #$0d
5826 : b1 56 __ LDA (T3 + 0),y 
5828 : f0 12 __ BEQ $583c ; (undo_performredo.s1012 + 0)
.s20:
582a : ad fb 86 LDA $86fb ; (undonumber + 0)
582d : c9 27 __ CMP #$27
582f : f0 03 __ BEQ $5834 ; (undo_performredo.s25 + 0)
5831 : 4c 60 57 JMP $5760 ; (undo_performredo.s1001 + 0)
.s25:
5834 : ad 58 89 LDA $8958 ; (Undo + 6)
5837 : f0 03 __ BEQ $583c ; (undo_performredo.s1012 + 0)
5839 : 4c 60 57 JMP $5760 ; (undo_performredo.s1001 + 0)
.s1012:
583c : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
583f : 4c 60 57 JMP $5760 ; (undo_performredo.s1001 + 0)
.l1015:
5842 : 65 5c __ ADC T7 + 0 
5844 : 85 5f __ STA T9 + 0 
5846 : 85 03 __ STA WORK + 0 
5848 : a9 00 __ LDA #$00
584a : 85 13 __ STA P6 
584c : 2a __ __ ROL
584d : 85 60 __ STA T9 + 1 
584f : 85 04 __ STA WORK + 1 
5851 : ad ab 87 LDA $87ab ; (canvas + 3)
5854 : 85 1b __ STA ACCU + 0 
5856 : ad ac 87 LDA $87ac ; (canvas + 4)
5859 : 85 1c __ STA ACCU + 1 
585b : 20 62 7c JSR $7c62 ; (mul16 + 0)
585e : 18 __ __ CLC
585f : a5 05 __ LDA WORK + 2 
5861 : 65 56 __ ADC T3 + 0 
5863 : 85 0e __ STA P1 
5865 : a5 06 __ LDA WORK + 3 
5867 : 69 58 __ ADC #$58
5869 : 85 0f __ STA P2 
586b : ad fb 86 LDA $86fb ; (undonumber + 0)
586e : 0a __ __ ASL
586f : 0a __ __ ASL
5870 : 0a __ __ ASL
5871 : a2 00 __ LDX #$00
5873 : 90 01 __ BCC $5876 ; (undo_performredo.s1022 + 0)
.s1021:
5875 : e8 __ __ INX
.s1022:
5876 : 38 __ __ SEC
5877 : ed fb 86 SBC $86fb ; (undonumber + 0)
587a : b0 01 __ BCS $587d ; (undo_performredo.s1024 + 0)
.s1023:
587c : ca __ __ DEX
.s1024:
587d : 18 __ __ CLC
587e : 69 4b __ ADC #$4b
5880 : 85 61 __ STA T10 + 0 
5882 : 8a __ __ TXA
5883 : 69 89 __ ADC #$89
5885 : 85 62 __ STA T10 + 1 
5887 : a0 00 __ LDY #$00
5889 : 84 1c __ STY ACCU + 1 
588b : b1 61 __ LDA (T10 + 0),y 
588d : 18 __ __ CLC
588e : 65 58 __ ADC T5 + 0 
5890 : 85 44 __ STA T12 + 0 
5892 : c8 __ __ INY
5893 : b1 61 __ LDA (T10 + 0),y 
5895 : 65 59 __ ADC T5 + 1 
5897 : 85 45 __ STA T12 + 1 
5899 : a5 55 __ LDA T2 + 0 
589b : 85 1b __ STA ACCU + 0 
589d : a5 12 __ LDA P5 
589f : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
58a2 : a5 05 __ LDA WORK + 2 
58a4 : 85 5d __ STA T8 + 0 
58a6 : 18 __ __ CLC
58a7 : 65 44 __ ADC T12 + 0 
58a9 : 85 10 __ STA P3 
58ab : a5 06 __ LDA WORK + 3 
58ad : 85 5e __ STA T8 + 1 
58af : 65 45 __ ADC T12 + 1 
58b1 : 85 11 __ STA P4 
58b3 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
58b6 : ad ab 87 LDA $87ab ; (canvas + 3)
58b9 : 85 1b __ STA ACCU + 0 
58bb : ad ac 87 LDA $87ac ; (canvas + 4)
58be : 85 1c __ STA ACCU + 1 
58c0 : a5 5f __ LDA T9 + 0 
58c2 : 85 03 __ STA WORK + 0 
58c4 : a5 60 __ LDA T9 + 1 
58c6 : 85 04 __ STA WORK + 1 
58c8 : 20 62 7c JSR $7c62 ; (mul16 + 0)
58cb : 18 __ __ CLC
58cc : a5 05 __ LDA WORK + 2 
58ce : 65 56 __ ADC T3 + 0 
58d0 : 85 5f __ STA T9 + 0 
58d2 : a5 06 __ LDA WORK + 3 
58d4 : 69 58 __ ADC #$58
58d6 : 85 60 __ STA T9 + 1 
58d8 : ad ad 87 LDA $87ad ; (canvas + 5)
58db : 85 1b __ STA ACCU + 0 
58dd : ad ae 87 LDA $87ae ; (canvas + 6)
58e0 : 85 1c __ STA ACCU + 1 
58e2 : ad ab 87 LDA $87ab ; (canvas + 3)
58e5 : 85 03 __ STA WORK + 0 
58e7 : ad ac 87 LDA $87ac ; (canvas + 4)
58ea : 85 04 __ STA WORK + 1 
58ec : 20 62 7c JSR $7c62 ; (mul16 + 0)
58ef : 18 __ __ CLC
58f0 : a5 05 __ LDA WORK + 2 
58f2 : 65 5f __ ADC T9 + 0 
58f4 : aa __ __ TAX
58f5 : a5 06 __ LDA WORK + 3 
58f7 : 65 60 __ ADC T9 + 1 
58f9 : a8 __ __ TAY
58fa : 8a __ __ TXA
58fb : 18 __ __ CLC
58fc : 69 30 __ ADC #$30
58fe : 85 0e __ STA P1 
5900 : 90 01 __ BCC $5903 ; (undo_performredo.s1026 + 0)
.s1025:
5902 : c8 __ __ INY
.s1026:
5903 : 84 0f __ STY P2 
5905 : a0 00 __ LDY #$00
5907 : 84 13 __ STY P6 
5909 : b1 61 __ LDA (T10 + 0),y 
590b : 18 __ __ CLC
590c : 65 5a __ ADC T6 + 0 
590e : aa __ __ TAX
590f : c8 __ __ INY
5910 : b1 61 __ LDA (T10 + 0),y 
5912 : 65 5b __ ADC T6 + 1 
5914 : a8 __ __ TAY
5915 : 8a __ __ TXA
5916 : 18 __ __ CLC
5917 : 65 5d __ ADC T8 + 0 
5919 : 85 10 __ STA P3 
591b : 98 __ __ TYA
591c : 65 5e __ ADC T8 + 1 
591e : 85 11 __ STA P4 
5920 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
5923 : e6 55 __ INC T2 + 0 
5925 : a5 55 __ LDA T2 + 0 
5927 : c5 54 __ CMP T1 + 0 
5929 : b0 03 __ BCS $592e ; (undo_performredo.s1026 + 43)
592b : 4c 42 58 JMP $5842 ; (undo_performredo.l1015 + 0)
592e : 4c e0 57 JMP $57e0 ; (undo_performredo.s10 + 0)
--------------------------------------------------------------------
undo_escapeundo: ; undo_escapeundo()->void
.s0:
5931 : ad fb 86 LDA $86fb ; (undonumber + 0)
5934 : aa __ __ TAX
5935 : 0a __ __ ASL
5936 : 0a __ __ ASL
5937 : 0a __ __ ASL
5938 : a8 __ __ TAY
5939 : a9 00 __ LDA #$00
593b : 2a __ __ ROL
593c : 85 1c __ STA ACCU + 1 
593e : 98 __ __ TYA
593f : 38 __ __ SEC
5940 : ed fb 86 SBC $86fb ; (undonumber + 0)
5943 : a8 __ __ TAY
5944 : b0 02 __ BCS $5948 ; (undo_escapeundo.s0 + 23)
5946 : c6 1c __ DEC ACCU + 1 
5948 : 98 __ __ TYA
5949 : 18 __ __ CLC
594a : 69 52 __ ADC #$52
594c : 85 1b __ STA ACCU + 0 
594e : a9 89 __ LDA #$89
5950 : 65 1c __ ADC ACCU + 1 
5952 : 85 1c __ STA ACCU + 1 
5954 : a9 00 __ LDA #$00
5956 : a8 __ __ TAY
5957 : 91 1b __ STA (ACCU + 0),y 
5959 : a0 01 __ LDY #$01
595b : ca __ __ DEX
595c : 8e fb 86 STX $86fb ; (undonumber + 0)
595f : 91 1b __ STA (ACCU + 0),y 
5961 : d0 0d __ BNE $5970 ; (undo_escapeundo.s3 + 0)
.s1:
5963 : ad 63 8a LDA $8a63 ; (Undo + 273)
5966 : 0d 64 8a ORA $8a64 ; (Undo + 274)
5969 : f0 05 __ BEQ $5970 ; (undo_escapeundo.s3 + 0)
.s4:
596b : a9 28 __ LDA #$28
596d : 8d fb 86 STA $86fb ; (undonumber + 0)
.s3:
5970 : 4c 02 3e JMP $3e02 ; (plotcursor.s0 + 0)
--------------------------------------------------------------------
loadsyscharset: ; loadsyscharset()->void
.s0:
5973 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
5976 : c9 01 __ CMP #$01
5978 : f0 01 __ BEQ $597b ; (loadsyscharset.s1 + 0)
.s1001:
597a : 60 __ __ RTS
.s1:
597b : a9 7f __ LDA #$7f
597d : 85 11 __ STA P4 
597f : a9 01 __ LDA #$01
5981 : 85 15 __ STA P8 
5983 : ad a1 87 LDA $87a1 ; (vdc_state + 18)
5986 : 85 0f __ STA P2 
5988 : ad a2 87 LDA $87a2 ; (vdc_state + 19)
598b : 85 10 __ STA P3 
598d : a9 00 __ LDA #$00
598f : 85 14 __ STA P7 
5991 : 85 12 __ STA P5 
5993 : 4c b3 1a JMP $1ab3 ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
restorealtcharset: ; restorealtcharset()->void
.s0:
5996 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
5999 : c9 01 __ CMP #$01
599b : f0 01 __ BEQ $599e ; (restorealtcharset.s1 + 0)
.s1001:
599d : 60 __ __ RTS
.s1:
599e : a9 7f __ LDA #$7f
59a0 : 85 11 __ STA P4 
59a2 : a9 01 __ LDA #$01
59a4 : 85 15 __ STA P8 
59a6 : ad a1 87 LDA $87a1 ; (vdc_state + 18)
59a9 : 85 0f __ STA P2 
59ab : ad a2 87 LDA $87a2 ; (vdc_state + 19)
59ae : 85 10 __ STA P3 
59b0 : a9 00 __ LDA #$00
59b2 : 85 14 __ STA P7 
59b4 : 85 12 __ STA P5 
59b6 : 4c ac 1a JMP $1aac ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
mainmenuloop: ; mainmenuloop()->void
.s1000:
59b9 : a5 53 __ LDA T1 + 0 
59bb : 8d 79 ab STA $ab79 ; (mainmenuloop@stack + 0)
59be : 38 __ __ SEC
59bf : a5 23 __ LDA SP + 0 
59c1 : e9 08 __ SBC #$08
59c3 : 85 23 __ STA SP + 0 
59c5 : b0 02 __ BCS $59c9 ; (mainmenuloop.s0 + 0)
59c7 : c6 24 __ DEC SP + 1 
.s0:
59c9 : 20 f3 4a JSR $4af3 ; (hidecursor.s0 + 0)
59cc : a9 00 __ LDA #$00
59ce : 85 17 __ STA P10 
59d0 : 85 18 __ STA P11 
59d2 : 8d f3 ab STA $abf3 ; (sstack + 0)
59d5 : a9 01 __ LDA #$01
59d7 : 8d f5 ab STA $abf5 ; (sstack + 2)
59da : ad 92 87 LDA $8792 ; (vdc_state + 3)
59dd : 8d f4 ab STA $abf4 ; (sstack + 1)
59e0 : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
59e3 : 20 73 59 JSR $5973 ; (loadsyscharset.s0 + 0)
.l1:
59e6 : 20 de 5c JSR $5cde ; (menu_main.s1000 + 0)
59e9 : a5 1b __ LDA ACCU + 0 
59eb : c9 1f __ CMP #$1f
59ed : d0 0d __ BNE $59fc ; (mainmenuloop.s48 + 0)
.s34:
59ef : a9 03 __ LDA #$03
59f1 : 8d fa ab STA $abfa ; (sstack + 7)
59f4 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
59f7 : a9 00 __ LDA #$00
59f9 : 4c 40 5b JMP $5b40 ; (mainmenuloop.s112 + 0)
.s48:
59fc : 85 53 __ STA T1 + 0 
59fe : c9 1f __ CMP #$1f
5a00 : b0 03 __ BCS $5a05 ; (mainmenuloop.s49 + 0)
5a02 : 4c 49 5b JMP $5b49 ; (mainmenuloop.s50 + 0)
.s49:
5a05 : c9 2a __ CMP #$2a
5a07 : d0 0e __ BNE $5a17 ; (mainmenuloop.s66 + 0)
.s40:
5a09 : a9 06 __ LDA #$06
5a0b : 8d fa ab STA $abfa ; (sstack + 7)
5a0e : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5a11 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
5a14 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s66:
5a17 : b0 03 __ BCS $5a1c ; (mainmenuloop.s67 + 0)
5a19 : 4c d6 5a JMP $5ad6 ; (mainmenuloop.s68 + 0)
.s67:
5a1c : c9 34 __ CMP #$34
5a1e : d0 07 __ BNE $5a27 ; (mainmenuloop.s75 + 0)
.s43:
5a20 : a9 01 __ LDA #$01
5a22 : 8d ea 86 STA $86ea ; (appexit + 0)
5a25 : d0 0f __ BNE $5a36 ; (mainmenuloop.s2 + 0)
.s75:
5a27 : b0 03 __ BCS $5a2c ; (mainmenuloop.s76 + 0)
5a29 : 4c af 5a JMP $5aaf ; (mainmenuloop.s77 + 0)
.s76:
5a2c : c9 35 __ CMP #$35
5a2e : f0 2c __ BEQ $5a5c ; (mainmenuloop.s44 + 0)
.s3:
5a30 : a5 53 __ LDA T1 + 0 
5a32 : c9 63 __ CMP #$63
5a34 : 90 b0 __ BCC $59e6 ; (mainmenuloop.l1 + 0)
.s2:
5a36 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
5a39 : 20 96 59 JSR $5996 ; (restorealtcharset.s0 + 0)
5a3c : ad eb 86 LDA $86eb ; (screen_col + 0)
5a3f : 8d b7 87 STA $87b7 ; (canvas + 15)
5a42 : ad ed 86 LDA $86ed ; (screen_row + 0)
5a45 : 8d b8 87 STA $87b8 ; (canvas + 16)
5a48 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
.s1001:
5a4b : 18 __ __ CLC
5a4c : a5 23 __ LDA SP + 0 
5a4e : 69 08 __ ADC #$08
5a50 : 85 23 __ STA SP + 0 
5a52 : 90 02 __ BCC $5a56 ; (mainmenuloop.s1001 + 11)
5a54 : e6 24 __ INC SP + 1 
5a56 : ad 79 ab LDA $ab79 ; (mainmenuloop@stack + 0)
5a59 : 85 53 __ STA T1 + 0 
5a5b : 60 __ __ RTS
.s44:
5a5c : a9 78 __ LDA #$78
5a5e : a0 02 __ LDY #$02
5a60 : 91 23 __ STA (SP + 0),y 
5a62 : a9 85 __ LDA #$85
5a64 : c8 __ __ INY
5a65 : 91 23 __ STA (SP + 0),y 
5a67 : a9 f5 __ LDA #$f5
5a69 : c8 __ __ INY
5a6a : 91 23 __ STA (SP + 0),y 
5a6c : a9 7a __ LDA #$7a
5a6e : c8 __ __ INY
5a6f : 91 23 __ STA (SP + 0),y 
5a71 : a9 00 __ LDA #$00
5a73 : cd fe 7a CMP $7afe ; (undoenabled + 0)
5a76 : 2a __ __ ROL
5a77 : 8d fe 7a STA $7afe ; (undoenabled + 0)
5a7a : f0 06 __ BEQ $5a82 ; (mainmenuloop.s91 + 0)
.s90:
5a7c : a9 7c __ LDA #$7c
5a7e : a2 2e __ LDX #$2e
5a80 : 90 04 __ BCC $5a86 ; (mainmenuloop.s92 + 0)
.s91:
5a82 : a9 7c __ LDA #$7c
5a84 : a2 38 __ LDX #$38
.s92:
5a86 : 85 44 __ STA T0 + 1 
5a88 : 8a __ __ TXA
5a89 : a0 06 __ LDY #$06
5a8b : 91 23 __ STA (SP + 0),y 
5a8d : a5 44 __ LDA T0 + 1 
5a8f : c8 __ __ INY
5a90 : 91 23 __ STA (SP + 0),y 
5a92 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
5a95 : a9 00 __ LDA #$00
5a97 : 8d fb 86 STA $86fb ; (undonumber + 0)
5a9a : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
5a9d : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
5aa0 : ad a3 87 LDA $87a3 ; (vdc_state + 20)
5aa3 : 8d f9 86 STA $86f9 ; (undoaddress + 0)
5aa6 : ad a4 87 LDA $87a4 ; (vdc_state + 21)
5aa9 : 8d fa 86 STA $86fa ; (undoaddress + 1)
5aac : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s77:
5aaf : c9 2b __ CMP #$2b
5ab1 : d0 0e __ BNE $5ac1 ; (mainmenuloop.s78 + 0)
.s41:
5ab3 : a9 06 __ LDA #$06
5ab5 : 8d fa ab STA $abfa ; (sstack + 7)
5ab8 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5abb : 20 bb b4 JSR $b4bb ; (colorwrite.s27 + 0)
5abe : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s78:
5ac1 : c9 33 __ CMP #$33
5ac3 : f0 03 __ BEQ $5ac8 ; (mainmenuloop.s42 + 0)
5ac5 : 4c 30 5a JMP $5a30 ; (mainmenuloop.s3 + 0)
.s42:
5ac8 : a9 04 __ LDA #$04
5aca : 8d fa ab STA $abfa ; (sstack + 7)
5acd : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5ad0 : 20 d9 b8 JSR $b8d9 ; (resizewidth.l42 + 1)
5ad3 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s68:
5ad6 : c9 22 __ CMP #$22
5ad8 : d0 0c __ BNE $5ae6 ; (mainmenuloop.s69 + 0)
.s37:
5ada : a9 03 __ LDA #$03
5adc : 8d fa ab STA $abfa ; (sstack + 7)
5adf : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5ae2 : a9 01 __ LDA #$01
5ae4 : d0 4c __ BNE $5b32 ; (mainmenuloop.s113 + 0)
.s69:
5ae6 : 90 3a __ BCC $5b22 ; (mainmenuloop.s71 + 0)
.s70:
5ae8 : c9 23 __ CMP #$23
5aea : d0 21 __ BNE $5b0d ; (mainmenuloop.s73 + 0)
.s38:
5aec : 20 07 30 JSR $3007 ; (vdc_restore_charsets.s0 + 0)
5aef : a9 7f __ LDA #$7f
5af1 : 85 0d __ STA P0 
5af3 : a9 01 __ LDA #$01
5af5 : 85 10 __ STA P3 
5af7 : a9 00 __ LDA #$00
5af9 : 85 13 __ STA P6 
5afb : 85 0e __ STA P1 
5afd : 85 11 __ STA P4 
5aff : 20 8a 14 JSR $148a ; (bnk_memcpy@proxy + 0)
5b02 : a9 00 __ LDA #$00
5b04 : 8d e8 86 STA $86e8 ; (charsetchanged + 0)
5b07 : 8d e9 86 STA $86e9 ; (charsetchanged + 1)
5b0a : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s73:
5b0d : c9 29 __ CMP #$29
5b0f : f0 03 __ BEQ $5b14 ; (mainmenuloop.s39 + 0)
5b11 : 4c 30 5a JMP $5a30 ; (mainmenuloop.s3 + 0)
.s39:
5b14 : a9 05 __ LDA #$05
5b16 : 8d fa ab STA $abfa ; (sstack + 7)
5b19 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5b1c : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
5b1f : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s71:
5b22 : a9 03 __ LDA #$03
5b24 : 8d fa ab STA $abfa ; (sstack + 7)
5b27 : a5 1b __ LDA ACCU + 0 
5b29 : c9 20 __ CMP #$20
5b2b : f0 0e __ BEQ $5b3b ; (mainmenuloop.s35 + 0)
.s36:
5b2d : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5b30 : a9 00 __ LDA #$00
.s113:
5b32 : 8d ff ab STA $abff ; (sstack + 12)
5b35 : 20 77 b5 JSR $b577 ; (colorwrite.s24 + 1)
5b38 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s35:
5b3b : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5b3e : a9 01 __ LDA #$01
.s112:
5b40 : 8d fd ab STA $abfd ; (sstack + 10)
5b43 : 20 10 b5 JSR $b510 ; (colorwrite.s58 + 5)
5b46 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s50:
5b49 : c9 10 __ CMP #$10
5b4b : d0 03 __ BNE $5b50 ; (mainmenuloop.s51 + 0)
5b4d : 4c 8b 5c JMP $5c8b ; (mainmenuloop.s21 + 0)
.s51:
5b50 : 90 50 __ BCC $5ba2 ; (mainmenuloop.s53 + 0)
.s52:
5b52 : c9 17 __ CMP #$17
5b54 : d0 0e __ BNE $5b64 ; (mainmenuloop.s60 + 0)
.s32:
5b56 : a9 03 __ LDA #$03
5b58 : 8d fa ab STA $abfa ; (sstack + 7)
5b5b : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5b5e : 20 21 af JSR $af21 ; (palette.s56 + 5)
5b61 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s60:
5b64 : 90 15 __ BCC $5b7b ; (mainmenuloop.s62 + 0)
.s61:
5b66 : c9 18 __ CMP #$18
5b68 : f0 03 __ BEQ $5b6d ; (mainmenuloop.s33 + 0)
5b6a : 4c 30 5a JMP $5a30 ; (mainmenuloop.s3 + 0)
.s33:
5b6d : a9 03 __ LDA #$03
5b6f : 8d fa ab STA $abfa ; (sstack + 7)
5b72 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5b75 : 20 8d b2 JSR $b28d ; (writemode.s43 + 0)
5b78 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s62:
5b7b : c9 15 __ CMP #$15
5b7d : d0 0e __ BNE $5b8d ; (mainmenuloop.s63 + 0)
.s30:
5b7f : a9 03 __ LDA #$03
5b81 : 8d fa ab STA $abfa ; (sstack + 7)
5b84 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5b87 : 20 00 ac JSR $ac00 ; (palette.s1000 + 0)
5b8a : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s63:
5b8d : c9 16 __ CMP #$16
5b8f : f0 03 __ BEQ $5b94 ; (mainmenuloop.s31 + 0)
5b91 : 4c 30 5a JMP $5a30 ; (mainmenuloop.s3 + 0)
.s31:
5b94 : a9 03 __ LDA #$03
5b96 : 8d fa ab STA $abfa ; (sstack + 7)
5b99 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5b9c : 20 eb ac JSR $aceb ; (palette.s1001 + 8)
5b9f : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s53:
5ba2 : c9 0d __ CMP #$0d
5ba4 : d0 0e __ BNE $5bb4 ; (mainmenuloop.s54 + 0)
.s6:
5ba6 : a9 02 __ LDA #$02
5ba8 : 8d fa ab STA $abfa ; (sstack + 7)
5bab : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5bae : 20 3b bb JSR $bb3b ; (resizewidth.l20 + 19)
5bb1 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s54:
5bb4 : b0 03 __ BCS $5bb9 ; (mainmenuloop.s55 + 0)
5bb6 : 4c 64 5c JMP $5c64 ; (mainmenuloop.s56 + 0)
.s55:
5bb9 : c9 0e __ CMP #$0e
5bbb : f0 56 __ BEQ $5c13 ; (mainmenuloop.s7 + 0)
.s14:
5bbd : ad fe 7a LDA $7afe ; (undoenabled + 0)
5bc0 : c9 01 __ CMP #$01
5bc2 : d0 14 __ BNE $5bd8 ; (mainmenuloop.s17 + 0)
.s15:
5bc4 : a9 00 __ LDA #$00
5bc6 : 85 16 __ STA P9 
5bc8 : 85 17 __ STA P10 
5bca : ad ab 87 LDA $87ab ; (canvas + 3)
5bcd : 85 18 __ STA P11 
5bcf : ad ad 87 LDA $87ad ; (canvas + 5)
5bd2 : 8d f3 ab STA $abf3 ; (sstack + 0)
5bd5 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s17:
5bd8 : a9 20 __ LDA #$20
5bda : 8d f8 ab STA $abf8 ; (sstack + 5)
5bdd : a9 0f __ LDA #$0f
.s103:
5bdf : 8d f9 ab STA $abf9 ; (sstack + 6)
5be2 : 20 d5 3c JSR $3cd5 ; (screenmapfill.s0 + 0)
5be5 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
5be8 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
5beb : a9 00 __ LDA #$00
5bed : 85 17 __ STA P10 
5bef : 85 18 __ STA P11 
5bf1 : 8d f3 ab STA $abf3 ; (sstack + 0)
5bf4 : a9 01 __ LDA #$01
5bf6 : 8d f5 ab STA $abf5 ; (sstack + 2)
5bf9 : ad 92 87 LDA $8792 ; (vdc_state + 3)
5bfc : 8d f4 ab STA $abf4 ; (sstack + 1)
5bff : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
5c02 : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
5c05 : ad fe 86 LDA $86fe ; (showbar + 0)
5c08 : d0 03 __ BNE $5c0d ; (mainmenuloop.s18 + 0)
5c0a : 4c 30 5a JMP $5a30 ; (mainmenuloop.s3 + 0)
.s18:
5c0d : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
5c10 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s7:
5c13 : a9 02 __ LDA #$02
5c15 : 8d fa ab STA $abfa ; (sstack + 7)
5c18 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5c1b : 20 df bd JSR $bddf ; (resizeheight.s32 + 15)
5c1e : ad e8 86 LDA $86e8 ; (charsetchanged + 0)
5c21 : f0 1b __ BEQ $5c3e ; (mainmenuloop.s105 + 0)
.s8:
5c23 : a9 7f __ LDA #$7f
5c25 : 85 11 __ STA P4 
5c27 : a9 01 __ LDA #$01
5c29 : 85 15 __ STA P8 
5c2b : ad 9f 87 LDA $879f ; (vdc_state + 16)
5c2e : 85 0f __ STA P2 
5c30 : ad a0 87 LDA $87a0 ; (vdc_state + 17)
5c33 : 85 10 __ STA P3 
5c35 : a9 00 __ LDA #$00
5c37 : 85 14 __ STA P7 
5c39 : 85 12 __ STA P5 
5c3b : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
.s105:
5c3e : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
5c41 : d0 03 __ BNE $5c46 ; (mainmenuloop.s11 + 0)
5c43 : 4c 30 5a JMP $5a30 ; (mainmenuloop.s3 + 0)
.s11:
5c46 : a9 7f __ LDA #$7f
5c48 : 85 11 __ STA P4 
5c4a : a9 01 __ LDA #$01
5c4c : 85 15 __ STA P8 
5c4e : ad a1 87 LDA $87a1 ; (vdc_state + 18)
5c51 : 85 0f __ STA P2 
5c53 : ad a2 87 LDA $87a2 ; (vdc_state + 19)
5c56 : 85 10 __ STA P3 
5c58 : a9 00 __ LDA #$00
5c5a : 85 14 __ STA P7 
5c5c : 85 12 __ STA P5 
5c5e : 20 ac 1a JSR $1aac ; (bnk_redef_charset@proxy + 0)
5c61 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s56:
5c64 : c9 0b __ CMP #$0b
5c66 : d0 0e __ BNE $5c76 ; (mainmenuloop.s57 + 0)
.s4:
5c68 : a9 01 __ LDA #$01
5c6a : 8d fa ab STA $abfa ; (sstack + 7)
5c6d : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5c70 : 20 db b5 JSR $b5db ; (resizewidth.s1000 + 0)
5c73 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s57:
5c76 : c9 0c __ CMP #$0c
5c78 : f0 03 __ BEQ $5c7d ; (mainmenuloop.s5 + 0)
5c7a : 4c 30 5a JMP $5a30 ; (mainmenuloop.s3 + 0)
.s5:
5c7d : a9 01 __ LDA #$01
5c7f : 8d fa ab STA $abfa ; (sstack + 7)
5c82 : 20 6f 4a JSR $4a6f ; (loadoverlay.s1000 + 0)
5c85 : 20 1d bc JSR $bc1d ; (resizeheight.s1000 + 0)
5c88 : 4c e6 59 JMP $59e6 ; (mainmenuloop.l1 + 0)
.s21:
5c8b : ad fe 7a LDA $7afe ; (undoenabled + 0)
5c8e : c9 01 __ CMP #$01
5c90 : d0 14 __ BNE $5ca6 ; (mainmenuloop.s24 + 0)
.s22:
5c92 : a9 00 __ LDA #$00
5c94 : 85 16 __ STA P9 
5c96 : 85 17 __ STA P10 
5c98 : ad ab 87 LDA $87ab ; (canvas + 3)
5c9b : 85 18 __ STA P11 
5c9d : ad ad 87 LDA $87ad ; (canvas + 5)
5ca0 : 8d f3 ab STA $abf3 ; (sstack + 0)
5ca3 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s24:
5ca6 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
5ca9 : 8d f8 ab STA $abf8 ; (sstack + 5)
5cac : ad f4 86 LDA $86f4 ; (plotblink + 0)
5caf : 0a __ __ ASL
5cb0 : 0a __ __ ASL
5cb1 : 0a __ __ ASL
5cb2 : 0a __ __ ASL
5cb3 : 18 __ __ CLC
5cb4 : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
5cb7 : 85 43 __ STA T0 + 0 
5cb9 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
5cbc : 4a __ __ LSR
5cbd : 6a __ __ ROR
5cbe : 6a __ __ ROR
5cbf : 29 c0 __ AND #$c0
5cc1 : 6a __ __ ROR
5cc2 : 65 43 __ ADC T0 + 0 
5cc4 : 85 43 __ STA T0 + 0 
5cc6 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
5cc9 : 4a __ __ LSR
5cca : 6a __ __ ROR
5ccb : 29 80 __ AND #$80
5ccd : 6a __ __ ROR
5cce : 65 43 __ ADC T0 + 0 
5cd0 : 85 43 __ STA T0 + 0 
5cd2 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
5cd5 : 4a __ __ LSR
5cd6 : a9 00 __ LDA #$00
5cd8 : 6a __ __ ROR
5cd9 : 65 43 __ ADC T0 + 0 
5cdb : 4c df 5b JMP $5bdf ; (mainmenuloop.s103 + 0)
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
5cde : a2 03 __ LDX #$03
5ce0 : b5 53 __ LDA T0 + 0,x 
5ce2 : 9d c3 ab STA $abc3,x ; (projbuffer + 43)
5ce5 : ca __ __ DEX
5ce6 : 10 f8 __ BPL $5ce0 ; (menu_main.s1000 + 2)
.s0:
5ce8 : ad 41 87 LDA $8741 ; (menubar + 65)
5ceb : 85 16 __ STA P9 
5ced : 20 08 5e JSR $5e08 ; (menu_placebar.s0 + 0)
.l84:
5cf0 : a9 01 __ LDA #$01
5cf2 : 85 53 __ STA T0 + 0 
.l3:
5cf4 : a6 53 __ LDX T0 + 0 
5cf6 : bd 3b 87 LDA $873b,x ; (menubar + 59)
5cf9 : 85 11 __ STA P4 
5cfb : ad 41 87 LDA $8741 ; (menubar + 65)
5cfe : 85 12 __ STA P5 
5d00 : bd 47 80 LDA $8047,x ; (__multab12L + 0)
5d03 : 18 __ __ CLC
5d04 : 69 f4 __ ADC #$f4
5d06 : 85 13 __ STA P6 
5d08 : a9 86 __ LDA #$86
5d0a : 69 00 __ ADC #$00
5d0c : 85 14 __ STA P7 
5d0e : ad cc 82 LDA $82cc ; (mc_mb_select + 0)
5d11 : 85 15 __ STA P8 
5d13 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
.l5:
5d16 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
5d19 : a5 1b __ LDA ACCU + 0 
5d1b : 85 54 __ STA T1 + 0 
5d1d : c9 0d __ CMP #$0d
5d1f : d0 06 __ BNE $5d27 ; (menu_main.s1002 + 0)
.s1003:
5d21 : a9 00 __ LDA #$00
5d23 : 85 55 __ STA T3 + 0 
5d25 : f0 16 __ BEQ $5d3d ; (menu_main.s6 + 0)
.s1002:
5d27 : a9 01 __ LDA #$01
5d29 : 85 55 __ STA T3 + 0 
5d2b : a5 1b __ LDA ACCU + 0 
5d2d : c9 9d __ CMP #$9d
5d2f : f0 0c __ BEQ $5d3d ; (menu_main.s6 + 0)
.s9:
5d31 : c9 1d __ CMP #$1d
5d33 : f0 08 __ BEQ $5d3d ; (menu_main.s6 + 0)
.s8:
5d35 : c9 1b __ CMP #$1b
5d37 : f0 04 __ BEQ $5d3d ; (menu_main.s6 + 0)
.s7:
5d39 : c9 03 __ CMP #$03
5d3b : d0 d9 __ BNE $5d16 ; (menu_main.l5 + 0)
.s6:
5d3d : a6 53 __ LDX T0 + 0 
5d3f : bd 3b 87 LDA $873b,x ; (menubar + 59)
5d42 : 85 11 __ STA P4 
5d44 : ad 41 87 LDA $8741 ; (menubar + 65)
5d47 : 85 56 __ STA T4 + 0 
5d49 : 85 12 __ STA P5 
5d4b : bd 47 80 LDA $8047,x ; (__multab12L + 0)
5d4e : 18 __ __ CLC
5d4f : 69 f4 __ ADC #$f4
5d51 : 85 13 __ STA P6 
5d53 : a9 86 __ LDA #$86
5d55 : 69 00 __ ADC #$00
5d57 : 85 14 __ STA P7 
5d59 : ad cb 82 LDA $82cb ; (mc_mb_normal + 0)
5d5c : 85 15 __ STA P8 
5d5e : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
5d61 : a5 54 __ LDA T1 + 0 
5d63 : c9 9d __ CMP #$9d
5d65 : d0 03 __ BNE $5d6a ; (menu_main.s12 + 0)
5d67 : 4c fc 5d JMP $5dfc ; (menu_main.s11 + 0)
.s12:
5d6a : c9 1d __ CMP #$1d
5d6c : d0 0c __ BNE $5d7a ; (menu_main.s13 + 0)
.s17:
5d6e : e6 53 __ INC T0 + 0 
5d70 : a5 53 __ LDA T0 + 0 
5d72 : c9 06 __ CMP #$06
5d74 : 90 04 __ BCC $5d7a ; (menu_main.s13 + 0)
.s20:
5d76 : a9 01 __ LDA #$01
.s1039:
5d78 : 85 53 __ STA T0 + 0 
.s13:
5d7a : a5 55 __ LDA T3 + 0 
5d7c : f0 0d __ BEQ $5d8b ; (menu_main.s4 + 0)
.s24:
5d7e : a5 54 __ LDA T1 + 0 
5d80 : c9 1b __ CMP #$1b
5d82 : f0 11 __ BEQ $5d95 ; (menu_main.s26 + 0)
.s23:
5d84 : c9 03 __ CMP #$03
5d86 : f0 03 __ BEQ $5d8b ; (menu_main.s4 + 0)
5d88 : 4c f4 5c JMP $5cf4 ; (menu_main.l3 + 0)
.s4:
5d8b : a5 54 __ LDA T1 + 0 
5d8d : c9 1b __ CMP #$1b
5d8f : f0 04 __ BEQ $5d95 ; (menu_main.s26 + 0)
.s28:
5d91 : c9 03 __ CMP #$03
5d93 : d0 06 __ BNE $5d9b ; (menu_main.s25 + 0)
.s26:
5d95 : a9 63 __ LDA #$63
5d97 : 85 55 __ STA T3 + 0 
5d99 : d0 49 __ BNE $5de4 ; (menu_main.s2 + 0)
.s25:
5d9b : a9 01 __ LDA #$01
5d9d : 8d fb ab STA $abfb ; (sstack + 8)
5da0 : a6 53 __ LDX T0 + 0 
5da2 : ca __ __ DEX
5da3 : 8e fa ab STX $abfa ; (sstack + 7)
5da6 : bd 3c 87 LDA $873c,x ; (menubar + 60)
5da9 : 8d f8 ab STA $abf8 ; (sstack + 5)
5dac : a6 56 __ LDX T4 + 0 
5dae : e8 __ __ INX
5daf : 8e f9 ab STX $abf9 ; (sstack + 6)
5db2 : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
5db5 : a5 1b __ LDA ACCU + 0 
5db7 : 85 55 __ STA T3 + 0 
5db9 : c9 12 __ CMP #$12
5dbb : d0 0e __ BNE $5dcb ; (menu_main.s31 + 0)
.s29:
5dbd : a9 00 __ LDA #$00
5dbf : 85 55 __ STA T3 + 0 
5dc1 : c6 53 __ DEC T0 + 0 
5dc3 : d0 06 __ BNE $5dcb ; (menu_main.s31 + 0)
.s32:
5dc5 : a9 05 __ LDA #$05
5dc7 : 85 53 __ STA T0 + 0 
5dc9 : d0 12 __ BNE $5ddd ; (menu_main.s27 + 0)
.s31:
5dcb : c9 13 __ CMP #$13
5dcd : d0 0e __ BNE $5ddd ; (menu_main.s27 + 0)
.s35:
5dcf : e6 53 __ INC T0 + 0 
5dd1 : a5 53 __ LDA T0 + 0 
5dd3 : c9 06 __ CMP #$06
5dd5 : b0 03 __ BCS $5dda ; (menu_main.s35 + 11)
5dd7 : 4c f4 5c JMP $5cf4 ; (menu_main.l3 + 0)
5dda : 4c f0 5c JMP $5cf0 ; (menu_main.l84 + 0)
.s27:
5ddd : a5 55 __ LDA T3 + 0 
5ddf : d0 03 __ BNE $5de4 ; (menu_main.s2 + 0)
5de1 : 4c f4 5c JMP $5cf4 ; (menu_main.l3 + 0)
.s2:
5de4 : a5 53 __ LDA T0 + 0 
5de6 : 0a __ __ ASL
5de7 : 0a __ __ ASL
5de8 : 18 __ __ CLC
5de9 : 65 53 __ ADC T0 + 0 
5deb : 0a __ __ ASL
5dec : 18 __ __ CLC
5ded : 65 55 __ ADC T3 + 0 
5def : 85 1b __ STA ACCU + 0 
.s1001:
5df1 : a2 03 __ LDX #$03
5df3 : bd c3 ab LDA $abc3,x ; (projbuffer + 43)
5df6 : 95 53 __ STA T0 + 0,x 
5df8 : ca __ __ DEX
5df9 : 10 f8 __ BPL $5df3 ; (menu_main.s1001 + 2)
5dfb : 60 __ __ RTS
.s11:
5dfc : c6 53 __ DEC T0 + 0 
5dfe : f0 03 __ BEQ $5e03 ; (menu_main.s14 + 0)
5e00 : 4c 7a 5d JMP $5d7a ; (menu_main.s13 + 0)
.s14:
5e03 : a9 05 __ LDA #$05
5e05 : 4c 78 5d JMP $5d78 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
5e08 : a9 00 __ LDA #$00
5e0a : 85 0f __ STA P2 
5e0c : a9 20 __ LDA #$20
5e0e : 85 11 __ STA P4 
5e10 : a9 50 __ LDA #$50
5e12 : 85 13 __ STA P6 
5e14 : a5 16 __ LDA P9 ; (y + 0)
5e16 : 8d 41 87 STA $8741 ; (menubar + 65)
5e19 : 85 10 __ STA P3 
5e1b : ad cb 82 LDA $82cb ; (mc_mb_normal + 0)
5e1e : 85 12 __ STA P5 
5e20 : 20 ce 2c JSR $2cce ; (vdc_hchar.s0 + 0)
5e23 : a9 01 __ LDA #$01
5e25 : 85 4a __ STA T2 + 0 
5e27 : a0 00 __ LDY #$00
5e29 : 84 49 __ STY T1 + 0 
.l2:
5e2b : b9 47 80 LDA $8047,y ; (__multab12L + 0)
5e2e : 18 __ __ CLC
5e2f : 69 00 __ ADC #$00
5e31 : 85 0d __ STA P0 
5e33 : a9 87 __ LDA #$87
5e35 : 69 00 __ ADC #$00
5e37 : 85 0e __ STA P1 
5e39 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
5e3c : a5 16 __ LDA P9 ; (y + 0)
5e3e : 85 12 __ STA P5 
5e40 : a5 0d __ LDA P0 
5e42 : 85 13 __ STA P6 
5e44 : a5 0e __ LDA P1 
5e46 : 85 14 __ STA P7 
5e48 : ad cb 82 LDA $82cb ; (mc_mb_normal + 0)
5e4b : 85 15 __ STA P8 
5e4d : a5 1b __ LDA ACCU + 0 
5e4f : 85 4b __ STA T4 + 0 
5e51 : 18 __ __ CLC
5e52 : 65 4a __ ADC T2 + 0 
5e54 : 85 43 __ STA T5 + 0 
5e56 : a9 00 __ LDA #$00
5e58 : 2a __ __ ROL
5e59 : 85 44 __ STA T5 + 1 
5e5b : ad 92 87 LDA $8792 ; (vdc_state + 3)
5e5e : 38 __ __ SEC
5e5f : e9 01 __ SBC #$01
5e61 : a8 __ __ TAY
5e62 : ad 93 87 LDA $8793 ; (vdc_state + 4)
5e65 : e9 00 __ SBC #$00
5e67 : c5 44 __ CMP T5 + 1 
5e69 : d0 02 __ BNE $5e6d ; (menu_placebar.s1005 + 0)
.s1004:
5e6b : c4 43 __ CPY T5 + 0 
.s1005:
5e6d : 90 04 __ BCC $5e73 ; (menu_placebar.s5 + 0)
.s7:
5e6f : a5 4a __ LDA T2 + 0 
5e71 : b0 04 __ BCS $5e77 ; (menu_placebar.s1006 + 0)
.s5:
5e73 : 98 __ __ TYA
5e74 : 38 __ __ SEC
5e75 : e5 1b __ SBC ACCU + 0 
.s1006:
5e77 : 85 11 __ STA P4 
5e79 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
5e7c : a5 11 __ LDA P4 
5e7e : a4 49 __ LDY T1 + 0 
5e80 : c8 __ __ INY
5e81 : 84 49 __ STY T1 + 0 
5e83 : 99 3b 87 STA $873b,y ; (menubar + 59)
5e86 : a5 4b __ LDA T4 + 0 
5e88 : 38 __ __ SEC
5e89 : 65 11 __ ADC P4 
5e8b : 85 4a __ STA T2 + 0 
5e8d : c0 05 __ CPY #$05
5e8f : 90 9a __ BCC $5e2b ; (menu_placebar.l2 + 0)
.s1001:
5e91 : 60 __ __ RTS
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
5e92 : a2 08 __ LDX #$08
5e94 : b5 53 __ LDA T1 + 0,x 
5e96 : 9d c8 ab STA $abc8,x ; (buff + 35)
5e99 : ca __ __ DEX
5e9a : 10 f8 __ BPL $5e94 ; (menu_pulldown.s1000 + 2)
5e9c : 38 __ __ SEC
5e9d : a5 23 __ LDA SP + 0 
5e9f : e9 0a __ SBC #$0a
5ea1 : 85 23 __ STA SP + 0 
5ea3 : b0 02 __ BCS $5ea7 ; (menu_pulldown.s0 + 0)
5ea5 : c6 24 __ DEC SP + 1 
.s0:
5ea7 : a9 d8 __ LDA #$d8
5ea9 : ae fa ab LDX $abfa ; (sstack + 7)
5eac : 86 52 __ STX T0 + 0 
5eae : 18 __ __ CLC
5eaf : 7d 4d 80 ADC $804d,x ; (__multab96L + 0)
5eb2 : 85 54 __ STA T2 + 0 
5eb4 : 85 0d __ STA P0 
5eb6 : a9 83 __ LDA #$83
5eb8 : 7d 55 80 ADC $8055,x ; (__multab96H + 0)
5ebb : 85 55 __ STA T2 + 1 
5ebd : 85 0e __ STA P1 
5ebf : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
5ec2 : a6 52 __ LDX T0 + 0 
5ec4 : bd 2d 82 LDA $822d,x ; (pulldown_options + 0)
5ec7 : 85 57 __ STA T4 + 0 
5ec9 : 8d f5 ab STA $abf5 ; (sstack + 2)
5ecc : e0 05 __ CPX #$05
5ece : a9 00 __ LDA #$00
5ed0 : 85 17 __ STA P10 
5ed2 : 2a __ __ ROL
5ed3 : 49 01 __ EOR #$01
5ed5 : 85 53 __ STA T1 + 0 
5ed7 : ad f8 ab LDA $abf8 ; (sstack + 5)
5eda : 85 52 __ STA T0 + 0 
5edc : 85 18 __ STA P11 
5ede : ad f9 ab LDA $abf9 ; (sstack + 6)
5ee1 : 85 56 __ STA T3 + 0 
5ee3 : 8d f3 ab STA $abf3 ; (sstack + 0)
5ee6 : a5 1b __ LDA ACCU + 0 
5ee8 : 69 02 __ ADC #$02
5eea : 8d f4 ab STA $abf4 ; (sstack + 1)
5eed : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
5ef0 : a9 01 __ LDA #$01
5ef2 : 85 59 __ STA T6 + 0 
5ef4 : a5 57 __ LDA T4 + 0 
5ef6 : f0 58 __ BEQ $5f50 ; (menu_pulldown.l5 + 0)
.s58:
5ef8 : a9 00 __ LDA #$00
5efa : 85 58 __ STA T5 + 0 
5efc : 85 5a __ STA T8 + 0 
5efe : 85 5b __ STA T8 + 1 
5f00 : 18 __ __ CLC
.l1050:
5f01 : a9 90 __ LDA #$90
5f03 : a0 02 __ LDY #$02
5f05 : 91 23 __ STA (SP + 0),y 
5f07 : a9 88 __ LDA #$88
5f09 : c8 __ __ INY
5f0a : 91 23 __ STA (SP + 0),y 
5f0c : a9 ee __ LDA #$ee
5f0e : c8 __ __ INY
5f0f : 91 23 __ STA (SP + 0),y 
5f11 : a9 51 __ LDA #$51
5f13 : c8 __ __ INY
5f14 : 91 23 __ STA (SP + 0),y 
5f16 : a5 54 __ LDA T2 + 0 
5f18 : 65 5a __ ADC T8 + 0 
5f1a : c8 __ __ INY
5f1b : 91 23 __ STA (SP + 0),y 
5f1d : a5 55 __ LDA T2 + 1 
5f1f : 65 5b __ ADC T8 + 1 
5f21 : c8 __ __ INY
5f22 : 91 23 __ STA (SP + 0),y 
5f24 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
5f27 : a5 52 __ LDA T0 + 0 
5f29 : 85 11 __ STA P4 
5f2b : a9 90 __ LDA #$90
5f2d : 85 13 __ STA P6 
5f2f : a9 88 __ LDA #$88
5f31 : 85 14 __ STA P7 
5f33 : 18 __ __ CLC
5f34 : a5 58 __ LDA T5 + 0 
5f36 : 65 56 __ ADC T3 + 0 
5f38 : 85 12 __ STA P5 
5f3a : 20 a4 81 JSR $81a4 ; (vdc_prints_attr@proxy + 0)
5f3d : 18 __ __ CLC
5f3e : a5 5a __ LDA T8 + 0 
5f40 : 69 10 __ ADC #$10
5f42 : 85 5a __ STA T8 + 0 
5f44 : 90 02 __ BCC $5f48 ; (menu_pulldown.s1053 + 0)
.s1052:
5f46 : e6 5b __ INC T8 + 1 
.s1053:
5f48 : e6 58 __ INC T5 + 0 
5f4a : a5 58 __ LDA T5 + 0 
5f4c : c5 57 __ CMP T4 + 0 
5f4e : 90 b1 __ BCC $5f01 ; (menu_pulldown.l1050 + 0)
.l5:
5f50 : a9 2d __ LDA #$2d
5f52 : a0 06 __ LDY #$06
5f54 : 91 23 __ STA (SP + 0),y 
5f56 : a9 00 __ LDA #$00
5f58 : c8 __ __ INY
5f59 : 91 23 __ STA (SP + 0),y 
5f5b : a9 90 __ LDA #$90
5f5d : a0 02 __ LDY #$02
5f5f : 91 23 __ STA (SP + 0),y 
5f61 : a9 88 __ LDA #$88
5f63 : c8 __ __ INY
5f64 : 91 23 __ STA (SP + 0),y 
5f66 : a9 f3 __ LDA #$f3
5f68 : c8 __ __ INY
5f69 : 91 23 __ STA (SP + 0),y 
5f6b : a9 51 __ LDA #$51
5f6d : c8 __ __ INY
5f6e : 91 23 __ STA (SP + 0),y 
5f70 : a5 59 __ LDA T6 + 0 
5f72 : 0a __ __ ASL
5f73 : 2a __ __ ROL
5f74 : 2a __ __ ROL
5f75 : 2a __ __ ROL
5f76 : a8 __ __ TAY
5f77 : 29 07 __ AND #$07
5f79 : 2a __ __ ROL
5f7a : aa __ __ TAX
5f7b : 98 __ __ TYA
5f7c : 29 f0 __ AND #$f0
5f7e : 38 __ __ SEC
5f7f : e9 10 __ SBC #$10
5f81 : b0 01 __ BCS $5f84 ; (menu_pulldown.s1055 + 0)
.s1054:
5f83 : ca __ __ DEX
.s1055:
5f84 : 18 __ __ CLC
5f85 : 65 54 __ ADC T2 + 0 
5f87 : a0 08 __ LDY #$08
5f89 : 91 23 __ STA (SP + 0),y 
5f8b : 8a __ __ TXA
5f8c : 65 55 __ ADC T2 + 1 
5f8e : c8 __ __ INY
5f8f : 91 23 __ STA (SP + 0),y 
5f91 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
5f94 : a9 90 __ LDA #$90
5f96 : 85 13 __ STA P6 
5f98 : a9 88 __ LDA #$88
5f9a : 85 14 __ STA P7 
5f9c : ad f8 ab LDA $abf8 ; (sstack + 5)
5f9f : 85 11 __ STA P4 
5fa1 : ad f9 ab LDA $abf9 ; (sstack + 6)
5fa4 : 85 56 __ STA T3 + 0 
5fa6 : 18 __ __ CLC
5fa7 : 65 59 __ ADC T6 + 0 
5fa9 : 38 __ __ SEC
5faa : e9 01 __ SBC #$01
5fac : 85 12 __ STA P5 
5fae : ad ce 82 LDA $82ce ; (mc_pd_select + 0)
5fb1 : 85 15 __ STA P8 
5fb3 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
.l7:
5fb6 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
5fb9 : a5 1b __ LDA ACCU + 0 
5fbb : 85 5a __ STA T8 + 0 
5fbd : c9 0d __ CMP #$0d
5fbf : f0 18 __ BEQ $5fd9 ; (menu_pulldown.s8 + 0)
.s14:
5fc1 : c9 9d __ CMP #$9d
5fc3 : f0 14 __ BEQ $5fd9 ; (menu_pulldown.s8 + 0)
.s13:
5fc5 : c9 1d __ CMP #$1d
5fc7 : f0 10 __ BEQ $5fd9 ; (menu_pulldown.s8 + 0)
.s12:
5fc9 : c9 91 __ CMP #$91
5fcb : f0 0c __ BEQ $5fd9 ; (menu_pulldown.s8 + 0)
.s11:
5fcd : c9 11 __ CMP #$11
5fcf : f0 08 __ BEQ $5fd9 ; (menu_pulldown.s8 + 0)
.s10:
5fd1 : c9 1b __ CMP #$1b
5fd3 : f0 04 __ BEQ $5fd9 ; (menu_pulldown.s8 + 0)
.s9:
5fd5 : c9 03 __ CMP #$03
5fd7 : d0 dd __ BNE $5fb6 ; (menu_pulldown.l7 + 0)
.s8:
5fd9 : a5 1b __ LDA ACCU + 0 
5fdb : c9 1b __ CMP #$1b
5fdd : d0 03 __ BNE $5fe2 ; (menu_pulldown.s42 + 0)
5fdf : 4c b4 60 JMP $60b4 ; (menu_pulldown.s16 + 0)
.s42:
5fe2 : b0 03 __ BCS $5fe7 ; (menu_pulldown.s43 + 0)
5fe4 : 4c a4 60 JMP $60a4 ; (menu_pulldown.s44 + 0)
.s43:
5fe7 : c9 91 __ CMP #$91
5fe9 : f0 43 __ BEQ $602e ; (menu_pulldown.s29 + 0)
.s50:
5feb : b0 2f __ BCS $601c ; (menu_pulldown.s51 + 0)
.s52:
5fed : c9 1d __ CMP #$1d
5fef : f0 03 __ BEQ $5ff4 ; (menu_pulldown.s25 + 0)
5ff1 : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s25:
5ff4 : a5 53 __ LDA T1 + 0 
5ff6 : d0 03 __ BNE $5ffb ; (menu_pulldown.s26 + 0)
5ff8 : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s26:
5ffb : a9 13 __ LDA #$13
.s1049:
5ffd : 85 59 __ STA T6 + 0 
.s6:
5fff : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
6002 : a5 59 __ LDA T6 + 0 
6004 : 85 1b __ STA ACCU + 0 
.s1001:
6006 : 18 __ __ CLC
6007 : a5 23 __ LDA SP + 0 
6009 : 69 0a __ ADC #$0a
600b : 85 23 __ STA SP + 0 
600d : 90 02 __ BCC $6011 ; (menu_pulldown.s1001 + 11)
600f : e6 24 __ INC SP + 1 
6011 : a2 08 __ LDX #$08
6013 : bd c8 ab LDA $abc8,x ; (buff + 35)
6016 : 95 53 __ STA T1 + 0,x 
6018 : ca __ __ DEX
6019 : 10 f8 __ BPL $6013 ; (menu_pulldown.s1001 + 13)
601b : 60 __ __ RTS
.s51:
601c : c9 9d __ CMP #$9d
601e : f0 03 __ BEQ $6023 ; (menu_pulldown.s21 + 0)
6020 : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s21:
6023 : a5 53 __ LDA T1 + 0 
6025 : d0 03 __ BNE $602a ; (menu_pulldown.s22 + 0)
6027 : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s22:
602a : a9 12 __ LDA #$12
602c : d0 cf __ BNE $5ffd ; (menu_pulldown.s1049 + 0)
.s29:
602e : a9 90 __ LDA #$90
6030 : a0 02 __ LDY #$02
6032 : 91 23 __ STA (SP + 0),y 
6034 : a9 88 __ LDA #$88
6036 : c8 __ __ INY
6037 : 91 23 __ STA (SP + 0),y 
6039 : a9 ee __ LDA #$ee
603b : c8 __ __ INY
603c : 91 23 __ STA (SP + 0),y 
603e : a9 51 __ LDA #$51
6040 : c8 __ __ INY
6041 : 91 23 __ STA (SP + 0),y 
6043 : a5 59 __ LDA T6 + 0 
6045 : 0a __ __ ASL
6046 : 2a __ __ ROL
6047 : 2a __ __ ROL
6048 : 2a __ __ ROL
6049 : a8 __ __ TAY
604a : 29 07 __ AND #$07
604c : 2a __ __ ROL
604d : aa __ __ TAX
604e : 98 __ __ TYA
604f : 29 f0 __ AND #$f0
6051 : 38 __ __ SEC
6052 : e9 10 __ SBC #$10
6054 : b0 01 __ BCS $6057 ; (menu_pulldown.s1057 + 0)
.s1056:
6056 : ca __ __ DEX
.s1057:
6057 : 18 __ __ CLC
6058 : 65 54 __ ADC T2 + 0 
605a : a0 06 __ LDY #$06
605c : 91 23 __ STA (SP + 0),y 
605e : 8a __ __ TXA
605f : 65 55 __ ADC T2 + 1 
6061 : c8 __ __ INY
6062 : 91 23 __ STA (SP + 0),y 
6064 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
6067 : a9 90 __ LDA #$90
6069 : 85 13 __ STA P6 
606b : a9 88 __ LDA #$88
606d : 85 14 __ STA P7 
606f : ad f8 ab LDA $abf8 ; (sstack + 5)
6072 : 85 11 __ STA P4 
6074 : 18 __ __ CLC
6075 : a5 59 __ LDA T6 + 0 
6077 : 65 56 __ ADC T3 + 0 
6079 : 38 __ __ SEC
607a : e9 01 __ SBC #$01
607c : 85 12 __ STA P5 
607e : 20 a4 81 JSR $81a4 ; (vdc_prints_attr@proxy + 0)
6081 : a5 5a __ LDA T8 + 0 
6083 : c9 91 __ CMP #$91
6085 : d0 0e __ BNE $6095 ; (menu_pulldown.s31 + 0)
.s30:
6087 : c6 59 __ DEC T6 + 0 
6089 : f0 03 __ BEQ $608e ; (menu_pulldown.s33 + 0)
608b : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s33:
608e : a5 57 __ LDA T4 + 0 
.s1048:
6090 : 85 59 __ STA T6 + 0 
6092 : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s31:
6095 : e6 59 __ INC T6 + 0 
6097 : a5 57 __ LDA T4 + 0 
6099 : c5 59 __ CMP T6 + 0 
609b : 90 03 __ BCC $60a0 ; (menu_pulldown.s36 + 0)
609d : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s36:
60a0 : a9 01 __ LDA #$01
60a2 : 90 ec __ BCC $6090 ; (menu_pulldown.s1048 + 0)
.s44:
60a4 : c9 0d __ CMP #$0d
60a6 : d0 03 __ BNE $60ab ; (menu_pulldown.s45 + 0)
60a8 : 4c ff 5f JMP $5fff ; (menu_pulldown.s6 + 0)
.s45:
60ab : b0 16 __ BCS $60c3 ; (menu_pulldown.s46 + 0)
.s47:
60ad : c9 03 __ CMP #$03
60af : f0 03 __ BEQ $60b4 ; (menu_pulldown.s16 + 0)
60b1 : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s16:
60b4 : ad fb ab LDA $abfb ; (sstack + 8)
60b7 : c9 01 __ CMP #$01
60b9 : f0 03 __ BEQ $60be ; (menu_pulldown.s17 + 0)
60bb : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
.s17:
60be : a9 00 __ LDA #$00
60c0 : 4c fd 5f JMP $5ffd ; (menu_pulldown.s1049 + 0)
.s46:
60c3 : c9 11 __ CMP #$11
60c5 : d0 03 __ BNE $60ca ; (menu_pulldown.s46 + 7)
60c7 : 4c 2e 60 JMP $602e ; (menu_pulldown.s29 + 0)
60ca : 4c 50 5f JMP $5f50 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
vdc_underline: ; vdc_underline(u8)->void
.s0:
60cd : 09 00 __ ORA #$00
60cf : d0 08 __ BNE $60d9 ; (vdc_underline.s1 + 0)
.s2:
60d1 : ad 96 87 LDA $8796 ; (vdc_state + 7)
60d4 : 29 df __ AND #$df
60d6 : 4c de 60 JMP $60de ; (vdc_underline.s3 + 0)
.s1:
60d9 : ad 96 87 LDA $8796 ; (vdc_state + 7)
60dc : 09 20 __ ORA #$20
.s3:
60de : 8d 96 87 STA $8796 ; (vdc_state + 7)
.s1001:
60e1 : 60 __ __ RTS
--------------------------------------------------------------------
choosedeviceid: ; choosedeviceid(u8)->u8
.s1000:
60e2 : 38 __ __ SEC
60e3 : a5 23 __ LDA SP + 0 
60e5 : e9 08 __ SBC #$08
60e7 : 85 23 __ STA SP + 0 
60e9 : b0 02 __ BCS $60ed ; (choosedeviceid.s0 + 0)
60eb : c6 24 __ DEC SP + 1 
.s0:
60ed : a9 d8 __ LDA #$d8
60ef : 85 13 __ STA P6 
60f1 : a9 61 __ LDA #$61
60f3 : 85 14 __ STA P7 
60f5 : 20 d3 80 JSR $80d3 ; (vdc_prints_attr@proxy + 0)
60f8 : a9 00 __ LDA #$00
60fa : 85 13 __ STA P6 
60fc : a9 62 __ LDA #$62
60fe : 85 14 __ STA P7 
6100 : 20 4c 81 JSR $814c ; (vdc_prints_attr@proxy + 0)
6103 : ad ce 82 LDA $82ce ; (mc_pd_select + 0)
6106 : 8d 96 87 STA $8796 ; (vdc_state + 7)
.l3:
6109 : a9 90 __ LDA #$90
610b : a0 02 __ LDY #$02
610d : 91 23 __ STA (SP + 0),y 
610f : a9 88 __ LDA #$88
6111 : c8 __ __ INY
6112 : 91 23 __ STA (SP + 0),y 
6114 : a9 35 __ LDA #$35
6116 : c8 __ __ INY
6117 : 91 23 __ STA (SP + 0),y 
6119 : a9 41 __ LDA #$41
611b : c8 __ __ INY
611c : 91 23 __ STA (SP + 0),y 
611e : ad f6 86 LDA $86f6 ; (targetdevice + 0)
6121 : 85 4f __ STA T1 + 0 
6123 : c8 __ __ INY
6124 : 91 23 __ STA (SP + 0),y 
6126 : a9 00 __ LDA #$00
6128 : c8 __ __ INY
6129 : 91 23 __ STA (SP + 0),y 
612b : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
612e : a9 09 __ LDA #$09
6130 : 85 12 __ STA P5 
6132 : a9 90 __ LDA #$90
6134 : 85 13 __ STA P6 
6136 : a9 88 __ LDA #$88
6138 : 85 14 __ STA P7 
613a : 20 af 80 JSR $80af ; (vdc_prints_attr@proxy + 0)
613d : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
6140 : a5 1b __ LDA ACCU + 0 
6142 : 85 4e __ STA T0 + 0 
6144 : c9 2b __ CMP #$2b
6146 : f0 71 __ BEQ $61b9 ; (choosedeviceid.l88 + 0)
.s30:
6148 : c9 2d __ CMP #$2d
614a : d0 1f __ BNE $616b ; (choosedeviceid.s6 + 0)
.l94:
614c : c6 4f __ DEC T1 + 0 
614e : a5 4f __ LDA T1 + 0 
6150 : 8d f6 86 STA $86f6 ; (targetdevice + 0)
6153 : c9 08 __ CMP #$08
6155 : b0 05 __ BCS $615c ; (choosedeviceid.s1022 + 0)
.s18:
6157 : a9 1e __ LDA #$1e
6159 : 8d f6 86 STA $86f6 ; (targetdevice + 0)
.s1022:
615c : 20 32 15 JSR $1532 ; (bnk_iec_active.s1000 + 0)
615f : 09 00 __ ORA #$00
6161 : d0 08 __ BNE $616b ; (choosedeviceid.s6 + 0)
.s22:
6163 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
6166 : 85 4f __ STA T1 + 0 
6168 : 4c 4c 61 JMP $614c ; (choosedeviceid.l94 + 0)
.s6:
616b : a5 4e __ LDA T0 + 0 
616d : c9 0d __ CMP #$0d
616f : f0 08 __ BEQ $6179 ; (choosedeviceid.s4 + 0)
.s33:
6171 : c9 03 __ CMP #$03
6173 : f0 04 __ BEQ $6179 ; (choosedeviceid.s4 + 0)
.s32:
6175 : c9 1b __ CMP #$1b
6177 : d0 90 __ BNE $6109 ; (choosedeviceid.l3 + 0)
.s4:
6179 : a9 15 __ LDA #$15
617b : 85 11 __ STA P4 
617d : a9 09 __ LDA #$09
617f : 85 12 __ STA P5 
6181 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
6184 : 8d 96 87 STA $8796 ; (vdc_state + 7)
6187 : 85 15 __ STA P8 
6189 : 20 41 81 JSR $8141 ; (vdc_prints_attr@proxy + 0)
618c : a9 14 __ LDA #$14
618e : 85 0f __ STA P2 
6190 : a9 28 __ LDA #$28
6192 : 85 13 __ STA P6 
6194 : a9 0a __ LDA #$0a
6196 : 85 14 __ STA P7 
6198 : 20 0e 82 JSR $820e ; (vdc_clear@proxy + 0)
619b : a5 4e __ LDA T0 + 0 
619d : c9 1b __ CMP #$1b
619f : f0 04 __ BEQ $61a5 ; (choosedeviceid.s35 + 0)
.s38:
61a1 : c9 03 __ CMP #$03
61a3 : d0 04 __ BNE $61a9 ; (choosedeviceid.s37 + 0)
.s35:
61a5 : a9 00 __ LDA #$00
61a7 : f0 02 __ BEQ $61ab ; (choosedeviceid.s1001 + 0)
.s37:
61a9 : a9 01 __ LDA #$01
.s1001:
61ab : 85 1b __ STA ACCU + 0 
61ad : 18 __ __ CLC
61ae : a5 23 __ LDA SP + 0 
61b0 : 69 08 __ ADC #$08
61b2 : 85 23 __ STA SP + 0 
61b4 : 90 02 __ BCC $61b8 ; (choosedeviceid.s1001 + 13)
61b6 : e6 24 __ INC SP + 1 
61b8 : 60 __ __ RTS
.l88:
61b9 : a6 4f __ LDX T1 + 0 
61bb : e8 __ __ INX
61bc : 8e f6 86 STX $86f6 ; (targetdevice + 0)
61bf : 8a __ __ TXA
61c0 : e0 1f __ CPX #$1f
61c2 : 90 05 __ BCC $61c9 ; (choosedeviceid.s1020 + 0)
.s8:
61c4 : a9 08 __ LDA #$08
61c6 : 8d f6 86 STA $86f6 ; (targetdevice + 0)
.s1020:
61c9 : 20 32 15 JSR $1532 ; (bnk_iec_active.s1000 + 0)
61cc : 09 00 __ ORA #$00
61ce : d0 9b __ BNE $616b ; (choosedeviceid.s6 + 0)
.s12:
61d0 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
61d3 : 85 4f __ STA T1 + 0 
61d5 : 4c b9 61 JMP $61b9 ; (choosedeviceid.l88 + 0)
--------------------------------------------------------------------
61d8 : __ __ __ BYT 63 48 4f 4f 53 45 20 44 52 49 56 45 20 69 64 3a : cHOOSE DRIVE id:
61e8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
61e9 : __ __ __ BYT 63 48 4f 4f 53 45 20 46 49 4c 45 4e 41 4d 45 3a : cHOOSE FILENAME:
61f9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
61fa : 4c cc ff JMP $ffcc 
--------------------------------------------------------------------
61fd : __ __ __ BYT 25 55 00                                        : %U.
--------------------------------------------------------------------
6200 : __ __ __ BYT 63 48 41 4e 47 45 20 57 49 54 48 20 2b 20 2f 20 : cHANGE WITH + / 
6210 : __ __ __ BYT 2d 20 4b 45 59 2c 20 72 65 74 20 54 4f 20 53 45 : - KEY, ret TO SE
6220 : __ __ __ BYT 4c 45 43 54 2e 00                               : LECT..
--------------------------------------------------------------------
checkiffileexists: ; checkiffileexists(u8*,u8)->u8
.s1000:
6226 : 38 __ __ SEC
6227 : a5 23 __ LDA SP + 0 ; (filetocheck + 1)
6229 : e9 0a __ SBC #$0a
622b : 85 23 __ STA SP + 0 ; (filetocheck + 1)
622d : b0 02 __ BCS $6231 ; (checkiffileexists.s0 + 0)
622f : c6 24 __ DEC SP + 1 ; (id + 0)
.s0:
6231 : a9 00 __ LDA #$00
6233 : a0 02 __ LDY #$02
6235 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6237 : a9 89 __ LDA #$89
6239 : c8 __ __ INY
623a : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
623c : a9 a3 __ LDA #$a3
623e : c8 __ __ INY
623f : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6241 : a9 62 __ LDA #$62
6243 : c8 __ __ INY
6244 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6246 : ad fc ab LDA $abfc ; (sstack + 9)
6249 : c8 __ __ INY
624a : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
624c : ad fd ab LDA $abfd ; (sstack + 10)
624f : c8 __ __ INY
6250 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6252 : ad fc ab LDA $abfc ; (sstack + 9)
6255 : c8 __ __ INY
6256 : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
6258 : ad fd ab LDA $abfd ; (sstack + 10)
625b : c8 __ __ INY
625c : 91 23 __ STA (SP + 0),y ; (filetocheck + 1)
625e : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
6261 : a9 00 __ LDA #$00
6263 : 85 14 __ STA P7 
6265 : a9 89 __ LDA #$89
6267 : 85 15 __ STA P8 
6269 : ad fe ab LDA $abfe ; (sstack + 11)
626c : 85 13 __ STA P6 
626e : 20 b8 62 JSR $62b8 ; (cmd.s0 + 0)
6271 : a5 1b __ LDA ACCU + 0 
6273 : c9 3f __ CMP #$3f
6275 : f0 1f __ BEQ $6296 ; (checkiffileexists.s1 + 0)
.s2:
6277 : 09 00 __ ORA #$00
6279 : f0 04 __ BEQ $627f ; (checkiffileexists.s3 + 0)
.s10:
627b : c9 3e __ CMP #$3e
627d : d0 04 __ BNE $6283 ; (checkiffileexists.s7 + 0)
.s3:
627f : a9 01 __ LDA #$01
6281 : d0 05 __ BNE $6288 ; (checkiffileexists.s1001 + 0)
.s7:
6283 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s1008:
6286 : a9 00 __ LDA #$00
.s1001:
6288 : 85 1b __ STA ACCU + 0 
628a : 18 __ __ CLC
628b : a5 23 __ LDA SP + 0 ; (filetocheck + 1)
628d : 69 0a __ ADC #$0a
628f : 85 23 __ STA SP + 0 ; (filetocheck + 1)
6291 : 90 02 __ BCC $6295 ; (checkiffileexists.s1001 + 13)
6293 : e6 24 __ INC SP + 1 ; (id + 0)
6295 : 60 __ __ RTS
.s1:
6296 : 20 fb 63 JSR $63fb ; (menu_areyousure.s1000 + 0)
6299 : a5 1b __ LDA ACCU + 0 
629b : c9 02 __ CMP #$02
629d : f0 e7 __ BEQ $6286 ; (checkiffileexists.s1008 + 0)
.s5:
629f : a9 02 __ LDA #$02
62a1 : d0 e5 __ BNE $6288 ; (checkiffileexists.s1001 + 0)
--------------------------------------------------------------------
62a3 : __ __ __ BYT 52 30 3a 25 53 3d 25 53 00                      : R0:%S=%S.
--------------------------------------------------------------------
cmd@proxy: ; cmd@proxy
62ac : a5 55 __ LDA $55 
62ae : 85 13 __ STA P6 
62b0 : a9 00 __ LDA #$00
62b2 : 85 14 __ STA P7 
62b4 : a9 89 __ LDA #$89
62b6 : 85 15 __ STA P8 
--------------------------------------------------------------------
cmd: ; cmd(const u8,const u8*)->u16
.s0:
62b8 : a9 00 __ LDA #$00
62ba : 85 0d __ STA P0 
62bc : 85 0e __ STA P1 
62be : 20 b4 2a JSR $2ab4 ; (krnio_setbnk.s0 + 0)
62c1 : a5 14 __ LDA P7 ; (cmd + 0)
62c3 : 85 0d __ STA P0 
62c5 : a5 15 __ LDA P8 ; (cmd + 1)
62c7 : 85 0e __ STA P1 
62c9 : 20 c3 2a JSR $2ac3 ; (krnio_setnam.s0 + 0)
62cc : a9 0f __ LDA #$0f
62ce : 85 0d __ STA P0 
62d0 : 85 0f __ STA P2 
62d2 : a5 13 __ LDA P6 ; (device + 0)
62d4 : 85 0e __ STA P1 
62d6 : 20 3b 63 JSR $633b ; (krnio_open.s0 + 0)
62d9 : 09 00 __ ORA #$00
62db : d0 08 __ BNE $62e5 ; (cmd.s4 + 0)
.s2:
62dd : a9 0f __ LDA #$0f
62df : 20 c3 ff JSR $ffc3 
62e2 : 4c 12 63 JMP $6312 ; (cmd.s1002 + 0)
.s4:
62e5 : a9 0f __ LDA #$0f
62e7 : 85 0e __ STA P1 
62e9 : a9 28 __ LDA #$28
62eb : 85 11 __ STA P4 
62ed : a9 00 __ LDA #$00
62ef : 8d 77 8a STA $8a77 ; (DOSstatus + 0)
62f2 : 85 12 __ STA P5 
62f4 : a9 77 __ LDA #$77
62f6 : 85 0f __ STA P2 
62f8 : a9 8a __ LDA #$8a
62fa : 85 10 __ STA P3 
62fc : 20 65 63 JSR $6365 ; (krnio_read.s0 + 0)
62ff : a5 1b __ LDA ACCU + 0 
6301 : 85 47 __ STA T0 + 0 
6303 : a5 1c __ LDA ACCU + 1 
6305 : 85 48 __ STA T0 + 1 
6307 : a9 0f __ LDA #$0f
6309 : 20 c3 ff JSR $ffc3 
630c : a5 47 __ LDA T0 + 0 
630e : 05 48 __ ORA T0 + 1 
6310 : d0 06 __ BNE $6318 ; (cmd.s18 + 0)
.s1002:
6312 : 20 b7 ff JSR $ffb7 
6315 : 4c 2c 63 JMP $632c ; (cmd.s1001 + 0)
.s18:
6318 : ad 77 8a LDA $8a77 ; (DOSstatus + 0)
631b : 0a __ __ ASL
631c : 0a __ __ ASL
631d : 18 __ __ CLC
631e : 6d 77 8a ADC $8a77 ; (DOSstatus + 0)
6321 : 0a __ __ ASL
6322 : 38 __ __ SEC
6323 : e9 e0 __ SBC #$e0
6325 : 18 __ __ CLC
6326 : 6d 78 8a ADC $8a78 ; (DOSstatus + 1)
6329 : 38 __ __ SEC
632a : e9 30 __ SBC #$30
.s1001:
632c : 85 1b __ STA ACCU + 0 
632e : a9 00 __ LDA #$00
6330 : 85 1c __ STA ACCU + 1 
6332 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open@proxy: ; krnio_open@proxy
6333 : a9 01 __ LDA #$01
6335 : 85 0d __ STA P0 
6337 : a9 02 __ LDA #$02
6339 : 85 0f __ STA P2 
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
633b : a9 00 __ LDA #$00
633d : a6 0d __ LDX P0 ; (fnum + 0)
633f : 9d d8 86 STA $86d8,x ; (krnio_pstatus + 0)
6342 : a9 00 __ LDA #$00
6344 : 85 1b __ STA ACCU + 0 
6346 : 85 1c __ STA ACCU + 1 
6348 : a5 0d __ LDA P0 ; (fnum + 0)
634a : a6 0e __ LDX P1 
634c : a4 0f __ LDY P2 
634e : 20 ba ff JSR $ffba 
6351 : 20 c0 ff JSR $ffc0 
6354 : 90 08 __ BCC $635e ; (krnio_open.s0 + 35)
6356 : a5 0d __ LDA P0 ; (fnum + 0)
6358 : 20 c3 ff JSR $ffc3 
635b : 4c 62 63 JMP $6362 ; (krnio_open.s1001 + 0)
635e : a9 01 __ LDA #$01
6360 : 85 1b __ STA ACCU + 0 
.s1001:
6362 : a5 1b __ LDA ACCU + 0 
6364 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
.s0:
6365 : a6 0e __ LDX P1 ; (fnum + 0)
6367 : bd d8 86 LDA $86d8,x ; (krnio_pstatus + 0)
636a : c9 40 __ CMP #$40
636c : d0 04 __ BNE $6372 ; (krnio_read.s3 + 0)
.s1:
636e : a9 00 __ LDA #$00
6370 : f0 0c __ BEQ $637e ; (krnio_read.s1010 + 0)
.s3:
6372 : 86 43 __ STX T1 + 0 
6374 : 8a __ __ TXA
6375 : 20 dd 63 JSR $63dd ; (krnio_chkin.s1000 + 0)
6378 : 09 00 __ ORA #$00
637a : d0 07 __ BNE $6383 ; (krnio_read.s5 + 0)
.s6:
637c : a9 ff __ LDA #$ff
.s1010:
637e : 85 1b __ STA ACCU + 0 
.s1001:
6380 : 85 1c __ STA ACCU + 1 
6382 : 60 __ __ RTS
.s5:
6383 : a9 00 __ LDA #$00
6385 : 85 44 __ STA T3 + 0 
6387 : 85 45 __ STA T3 + 1 
6389 : a5 12 __ LDA P5 ; (num + 1)
638b : 30 44 __ BMI $63d1 ; (krnio_read.s10 + 0)
.s1007:
638d : 05 11 __ ORA P4 ; (num + 0)
638f : f0 40 __ BEQ $63d1 ; (krnio_read.s10 + 0)
.l9:
6391 : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
6394 : a5 1b __ LDA ACCU + 0 
6396 : 85 46 __ STA T4 + 0 
6398 : 20 b7 ff JSR $ffb7 
639b : a6 43 __ LDX T1 + 0 
639d : 9d d8 86 STA $86d8,x ; (krnio_pstatus + 0)
63a0 : aa __ __ TAX
63a1 : f0 04 __ BEQ $63a7 ; (krnio_read.s13 + 0)
.s14:
63a3 : c9 40 __ CMP #$40
63a5 : d0 2a __ BNE $63d1 ; (krnio_read.s10 + 0)
.s13:
63a7 : a5 44 __ LDA T3 + 0 
63a9 : 85 1b __ STA ACCU + 0 
63ab : 18 __ __ CLC
63ac : a5 10 __ LDA P3 ; (data + 1)
63ae : 65 45 __ ADC T3 + 1 
63b0 : 85 1c __ STA ACCU + 1 
63b2 : a5 46 __ LDA T4 + 0 
63b4 : a4 0f __ LDY P2 ; (data + 0)
63b6 : 91 1b __ STA (ACCU + 0),y 
63b8 : e6 44 __ INC T3 + 0 
63ba : d0 02 __ BNE $63be ; (krnio_read.s1012 + 0)
.s1011:
63bc : e6 45 __ INC T3 + 1 
.s1012:
63be : 8a __ __ TXA
63bf : d0 10 __ BNE $63d1 ; (krnio_read.s10 + 0)
.s8:
63c1 : 24 12 __ BIT P5 ; (num + 1)
63c3 : 30 0c __ BMI $63d1 ; (krnio_read.s10 + 0)
.s1004:
63c5 : a5 45 __ LDA T3 + 1 
63c7 : c5 12 __ CMP P5 ; (num + 1)
63c9 : d0 04 __ BNE $63cf ; (krnio_read.s1003 + 0)
.s1002:
63cb : a5 44 __ LDA T3 + 0 
63cd : c5 11 __ CMP P4 ; (num + 0)
.s1003:
63cf : 90 c0 __ BCC $6391 ; (krnio_read.l9 + 0)
.s10:
63d1 : 20 cc ff JSR $ffcc 
63d4 : a5 44 __ LDA T3 + 0 
63d6 : 85 1b __ STA ACCU + 0 
63d8 : a5 45 __ LDA T3 + 1 
63da : 4c 80 63 JMP $6380 ; (krnio_read.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
63dd : 85 0d __ STA P0 
.s0:
63df : a6 0d __ LDX P0 
63e1 : 20 c6 ff JSR $ffc6 
63e4 : a9 00 __ LDA #$00
63e6 : 85 1c __ STA ACCU + 1 
63e8 : b0 02 __ BCS $63ec ; (krnio_chkin.s0 + 13)
63ea : a9 01 __ LDA #$01
63ec : 85 1b __ STA ACCU + 0 
.s1001:
63ee : a5 1b __ LDA ACCU + 0 
63f0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
63f1 : 20 cf ff JSR $ffcf 
63f4 : 85 1b __ STA ACCU + 0 
63f6 : a9 00 __ LDA #$00
63f8 : 85 1c __ STA ACCU + 1 
.s1001:
63fa : 60 __ __ RTS
--------------------------------------------------------------------
menu_areyousure: ; menu_areyousure(const u8*)->u8
.s1000:
63fb : a5 53 __ LDA T0 + 0 
63fd : 8d c6 ab STA $abc6 ; (buff + 33)
6400 : a5 54 __ LDA T1 + 0 
6402 : 8d c7 ab STA $abc7 ; (buff + 34)
.s0:
6405 : a9 00 __ LDA #$00
6407 : 85 17 __ STA P10 
6409 : a9 08 __ LDA #$08
640b : 85 18 __ STA P11 
640d : 8d f3 ab STA $abf3 ; (sstack + 0)
6410 : a9 1e __ LDA #$1e
6412 : 8d f4 ab STA $abf4 ; (sstack + 1)
6415 : a9 06 __ LDA #$06
6417 : 8d f5 ab STA $abf5 ; (sstack + 2)
641a : ad 96 87 LDA $8796 ; (vdc_state + 7)
641d : 85 54 __ STA T1 + 0 
641f : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
6422 : 85 53 __ STA T0 + 0 
6424 : 8d 96 87 STA $8796 ; (vdc_state + 7)
6427 : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
642a : a9 0a __ LDA #$0a
642c : 85 11 __ STA P4 
642e : a9 09 __ LDA #$09
6430 : 85 12 __ STA P5 
6432 : a9 7c __ LDA #$7c
6434 : 85 13 __ STA P6 
6436 : a9 64 __ LDA #$64
6438 : 85 14 __ STA P7 
643a : 20 3a 81 JSR $813a ; (vdc_prints_attr@proxy + 0)
643d : e6 12 __ INC P5 
643f : a9 89 __ LDA #$89
6441 : 85 13 __ STA P6 
6443 : a9 64 __ LDA #$64
6445 : 85 14 __ STA P7 
6447 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
644a : a9 19 __ LDA #$19
644c : 8d f8 ab STA $abf8 ; (sstack + 5)
644f : a9 0b __ LDA #$0b
6451 : 8d f9 ab STA $abf9 ; (sstack + 6)
6454 : a9 07 __ LDA #$07
6456 : 8d fa ab STA $abfa ; (sstack + 7)
6459 : a9 00 __ LDA #$00
645b : 8d fb ab STA $abfb ; (sstack + 8)
645e : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
6461 : a5 1b __ LDA ACCU + 0 
6463 : 85 53 __ STA T0 + 0 
6465 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
6468 : a5 54 __ LDA T1 + 0 
646a : 8d 96 87 STA $8796 ; (vdc_state + 7)
646d : a5 53 __ LDA T0 + 0 
646f : 85 1b __ STA ACCU + 0 
.s1001:
6471 : ad c6 ab LDA $abc6 ; (buff + 33)
6474 : 85 53 __ STA T0 + 0 
6476 : ad c7 ab LDA $abc7 ; (buff + 34)
6479 : 85 54 __ STA T1 + 0 
647b : 60 __ __ RTS
--------------------------------------------------------------------
647c : __ __ __ BYT 66 49 4c 45 20 45 58 49 53 54 53 2e 00          : fILE EXISTS..
--------------------------------------------------------------------
6489 : __ __ __ BYT 61 52 45 20 59 4f 55 20 53 55 52 45 3f 00       : aRE YOU SURE?.
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
6497 : a9 00 __ LDA #$00
6499 : a6 0d __ LDX P0 
649b : a0 00 __ LDY #$00
649d : 20 ba ff JSR $ffba 
64a0 : a9 0e __ LDA #$0e
64a2 : a6 10 __ LDX P3 
64a4 : a4 11 __ LDY P4 
64a6 : 20 d8 ff JSR $ffd8 
64a9 : a9 00 __ LDA #$00
64ab : b0 02 __ BCS $64af ; (krnio_save.s0 + 24)
64ad : a9 01 __ LDA #$01
64af : 85 1b __ STA ACCU + 0 
.s1001:
64b1 : a5 1b __ LDA ACCU + 0 
64b3 : 60 __ __ RTS
--------------------------------------------------------------------
filepicker: ; filepicker(u8)->u8
.s1000:
64b4 : a2 05 __ LDX #$05
64b6 : b5 53 __ LDA T0 + 0,x 
64b8 : 9d c8 ab STA $abc8,x ; (buff + 35)
64bb : ca __ __ DEX
64bc : 10 f8 __ BPL $64b6 ; (filepicker.s1000 + 2)
.s0:
64be : a9 0a __ LDA #$0a
64c0 : 85 18 __ STA P11 
64c2 : a9 02 __ LDA #$02
64c4 : 8d f3 ab STA $abf3 ; (sstack + 0)
64c7 : a9 3c __ LDA #$3c
64c9 : 8d f4 ab STA $abf4 ; (sstack + 1)
64cc : a9 14 __ LDA #$14
64ce : 8d f5 ab STA $abf5 ; (sstack + 2)
64d1 : a9 00 __ LDA #$00
64d3 : 85 17 __ STA P10 
64d5 : a2 21 __ LDX #$21
.l1002:
64d7 : ca __ __ DEX
64d8 : 9d 9f 8a STA $8a9f,x ; (cwd + 0)
64db : d0 fa __ BNE $64d7 ; (filepicker.l1002 + 0)
.s1003:
64dd : 8d c0 8a STA $8ac0 ; (disk_id_buf + 0)
64e0 : 8d c1 8a STA $8ac1 ; (disk_id_buf + 1)
64e3 : 8d c2 8a STA $8ac2 ; (disk_id_buf + 2)
64e6 : 8d c3 8a STA $8ac3 ; (disk_id_buf + 3)
64e9 : 8d c4 8a STA $8ac4 ; (disk_id_buf + 4)
64ec : a2 15 __ LDX #$15
.l1004:
64ee : ca __ __ DEX
64ef : 9d 7a 87 STA $877a,x ; (filename + 0)
64f2 : d0 fa __ BNE $64ee ; (filepicker.l1004 + 0)
.s1005:
64f4 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
64f7 : 8d 96 87 STA $8796 ; (vdc_state + 7)
64fa : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
64fd : a9 01 __ LDA #$01
64ff : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
6502 : a9 03 __ LDA #$03
6504 : 85 12 __ STA P5 
6506 : a9 d0 __ LDA #$d0
6508 : 85 13 __ STA P6 
650a : a9 69 __ LDA #$69
650c : 85 14 __ STA P7 
650e : 20 1f 81 JSR $811f ; (vdc_prints_attr@proxy + 0)
6511 : a9 00 __ LDA #$00
6513 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
6516 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
6519 : 8d fa ab STA $abfa ; (sstack + 7)
651c : ad fc ab LDA $abfc ; (sstack + 9)
651f : 8d fb ab STA $abfb ; (sstack + 8)
6522 : 20 e8 69 JSR $69e8 ; (refreshDir.s0 + 0)
6525 : 20 ad 33 JSR $33ad ; (updateMenu.s0 + 0)
.l2:
6528 : ad b8 8a LDA $8ab8 ; (cwd + 25)
652b : 85 54 __ STA T1 + 0 
652d : 8d c7 8a STA $8ac7 ; (current + 0)
6530 : ad b9 8a LDA $8ab9 ; (cwd + 26)
6533 : 85 55 __ STA T1 + 1 
6535 : 8d c8 8a STA $8ac8 ; (current + 1)
6538 : ad bc 8a LDA $8abc ; (cwd + 29)
653b : 85 56 __ STA T2 + 0 
653d : ad bd 8a LDA $8abd ; (cwd + 30)
6540 : 85 57 __ STA T2 + 1 
6542 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
6545 : a5 1b __ LDA ACCU + 0 
6547 : 85 43 __ STA T3 + 0 
6549 : a5 1c __ LDA ACCU + 1 
654b : 85 44 __ STA T3 + 1 
654d : d0 09 __ BNE $6558 ; (filepicker.s88 + 0)
.s1060:
654f : a5 1b __ LDA ACCU + 0 
6551 : c9 32 __ CMP #$32
6553 : d0 03 __ BNE $6558 ; (filepicker.s88 + 0)
6555 : 4c 1c 67 JMP $671c ; (filepicker.s6 + 0)
.s88:
6558 : a5 56 __ LDA T2 + 0 
655a : 85 1b __ STA ACCU + 0 
655c : a5 57 __ LDA T2 + 1 
655e : 85 1c __ STA ACCU + 1 
6560 : a9 0e __ LDA #$0e
6562 : 85 03 __ STA WORK + 0 
6564 : a9 00 __ LDA #$00
6566 : 85 04 __ STA WORK + 1 
6568 : 20 a4 7c JSR $7ca4 ; (divmod + 0)
656b : a5 1b __ LDA ACCU + 0 
656d : 85 46 __ STA T5 + 0 
656f : 0a __ __ ASL
6570 : 0a __ __ ASL
6571 : 0a __ __ ASL
6572 : 38 __ __ SEC
6573 : e5 1b __ SBC ACCU + 0 
6575 : 0a __ __ ASL
6576 : 49 ff __ EOR #$ff
6578 : 38 __ __ SEC
6579 : 65 56 __ ADC T2 + 0 
657b : 85 58 __ STA T6 + 0 
657d : 18 __ __ CLC
657e : 69 06 __ ADC #$06
6580 : 85 48 __ STA T7 + 0 
6582 : a5 44 __ LDA T3 + 1 
6584 : 10 03 __ BPL $6589 ; (filepicker.s1059 + 0)
6586 : 4c 7e 68 JMP $687e ; (filepicker.s90 + 0)
.s1059:
6589 : d0 09 __ BNE $6594 ; (filepicker.s89 + 0)
.s1058:
658b : a5 43 __ LDA T3 + 0 
658d : c9 32 __ CMP #$32
658f : b0 03 __ BCS $6594 ; (filepicker.s89 + 0)
6591 : 4c 7e 68 JMP $687e ; (filepicker.s90 + 0)
.s89:
6594 : a5 44 __ LDA T3 + 1 
6596 : d0 90 __ BNE $6528 ; (filepicker.l2 + 0)
.s1032:
6598 : a5 43 __ LDA T3 + 0 
659a : c9 55 __ CMP #$55
659c : d0 6f __ BNE $660d ; (filepicker.s1031 + 0)
.s75:
659e : ad b6 8a LDA $8ab6 ; (cwd + 23)
65a1 : 0d b7 8a ORA $8ab7 ; (cwd + 24)
65a4 : f0 82 __ BEQ $6528 ; (filepicker.l2 + 0)
.s79:
65a6 : a0 17 __ LDY #$17
65a8 : b1 54 __ LDA (T1 + 0),y 
65aa : c8 __ __ INY
65ab : 11 54 __ ORA (T1 + 0),y 
65ad : d0 03 __ BNE $65b2 ; (filepicker.s76 + 0)
65af : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s76:
65b2 : a5 48 __ LDA T7 + 0 
65b4 : 8d f8 ab STA $abf8 ; (sstack + 5)
65b7 : a9 00 __ LDA #$00
65b9 : 8d b8 8a STA $8ab8 ; (cwd + 25)
65bc : 8d b9 8a STA $8ab9 ; (cwd + 26)
65bf : 20 1e 70 JSR $701e ; (printElementPriv.s1000 + 0)
65c2 : a2 0e __ LDX #$0e
.l81:
65c4 : ad c7 8a LDA $8ac7 ; (current + 0)
65c7 : 85 54 __ STA T1 + 0 
65c9 : ad c8 8a LDA $8ac8 ; (current + 1)
65cc : 85 55 __ STA T1 + 1 
65ce : a0 17 __ LDY #$17
65d0 : b1 54 __ LDA (T1 + 0),y 
65d2 : 85 02 __ STA $02 
65d4 : c8 __ __ INY
65d5 : b1 54 __ LDA (T1 + 0),y 
65d7 : a8 __ __ TAY
65d8 : 05 02 __ ORA $02 
65da : f0 22 __ BEQ $65fe ; (filepicker.s165 + 0)
.s84:
65dc : 8c c8 8a STY $8ac8 ; (current + 1)
65df : 8c b9 8a STY $8ab9 ; (cwd + 26)
65e2 : 8c bb 8a STY $8abb ; (cwd + 28)
65e5 : a5 02 __ LDA $02 
65e7 : 8d c7 8a STA $8ac7 ; (current + 0)
65ea : 8d b8 8a STA $8ab8 ; (cwd + 25)
65ed : 8d ba 8a STA $8aba ; (cwd + 27)
65f0 : ad bc 8a LDA $8abc ; (cwd + 29)
65f3 : 18 __ __ CLC
65f4 : 69 ff __ ADC #$ff
65f6 : 8d bc 8a STA $8abc ; (cwd + 29)
65f9 : b0 03 __ BCS $65fe ; (filepicker.s165 + 0)
.s1065:
65fb : ce bd 8a DEC $8abd ; (cwd + 30)
.s165:
65fe : ca __ __ DEX
65ff : d0 c3 __ BNE $65c4 ; (filepicker.l81 + 0)
.s222:
6601 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
6604 : 8d f9 ab STA $abf9 ; (sstack + 6)
6607 : 20 25 6a JSR $6a25 ; (printDir.s1000 + 0)
660a : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s1031:
660d : b0 03 __ BCS $6612 ; (filepicker.s1018 + 0)
660f : 4c 3e 67 JMP $673e ; (filepicker.s106 + 0)
.s1018:
6612 : c9 89 __ CMP #$89
6614 : d0 03 __ BNE $6619 ; (filepicker.s1013 + 0)
6616 : 4c 1c 67 JMP $671c ; (filepicker.s6 + 0)
.s1013:
6619 : b0 19 __ BCS $6634 ; (filepicker.s1010 + 0)
.s114:
661b : c9 85 __ CMP #$85
661d : f0 03 __ BEQ $6622 ; (filepicker.s5 + 0)
661f : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s5:
6622 : ad fc ab LDA $abfc ; (sstack + 9)
6625 : 8d fb ab STA $abfb ; (sstack + 8)
.s221:
6628 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
662b : 8d fa ab STA $abfa ; (sstack + 7)
662e : 20 e8 69 JSR $69e8 ; (refreshDir.s0 + 0)
6631 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s1010:
6634 : c9 91 __ CMP #$91
6636 : f0 03 __ BEQ $663b ; (filepicker.s42 + 0)
6638 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s42:
663b : ad b6 8a LDA $8ab6 ; (cwd + 23)
663e : 0d b7 8a ORA $8ab7 ; (cwd + 24)
6641 : d0 03 __ BNE $6646 ; (filepicker.s47 + 0)
6643 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s47:
6646 : a5 54 __ LDA T1 + 0 
6648 : 05 55 __ ORA T1 + 1 
664a : d0 03 __ BNE $664f ; (filepicker.s46 + 0)
664c : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s46:
664f : a0 17 __ LDY #$17
6651 : b1 54 __ LDA (T1 + 0),y 
6653 : 85 02 __ STA $02 
6655 : c8 __ __ INY
6656 : b1 54 __ LDA (T1 + 0),y 
6658 : 85 55 __ STA T1 + 1 
665a : 05 02 __ ORA $02 
665c : d0 03 __ BNE $6661 ; (filepicker.s43 + 0)
665e : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s43:
6661 : a5 02 __ LDA $02 
6663 : 8d c7 8a STA $8ac7 ; (current + 0)
6666 : 8d b8 8a STA $8ab8 ; (cwd + 25)
6669 : a5 55 __ LDA T1 + 1 
666b : 8d c8 8a STA $8ac8 ; (current + 1)
666e : 8d b9 8a STA $8ab9 ; (cwd + 26)
6671 : 18 __ __ CLC
6672 : a5 56 __ LDA T2 + 0 
6674 : 69 ff __ ADC #$ff
6676 : 8d bc 8a STA $8abc ; (cwd + 29)
6679 : a5 57 __ LDA T2 + 1 
667b : 69 ff __ ADC #$ff
667d : 8d bd 8a STA $8abd ; (cwd + 30)
6680 : 38 __ __ SEC
6681 : a5 56 __ LDA T2 + 0 
6683 : e9 01 __ SBC #$01
6685 : 85 1b __ STA ACCU + 0 
6687 : a5 57 __ LDA T2 + 1 
6689 : e9 00 __ SBC #$00
668b : 85 1c __ STA ACCU + 1 
668d : a9 0e __ LDA #$0e
668f : 85 03 __ STA WORK + 0 
6691 : a9 00 __ LDA #$00
6693 : 85 04 __ STA WORK + 1 
6695 : 20 a4 7c JSR $7ca4 ; (divmod + 0)
6698 : a5 46 __ LDA T5 + 0 
669a : c5 1b __ CMP ACCU + 0 
669c : f0 40 __ BEQ $66de ; (filepicker.s49 + 0)
.s48:
669e : a9 0d __ LDA #$0d
66a0 : 85 53 __ STA T0 + 0 
.l52:
66a2 : ad c7 8a LDA $8ac7 ; (current + 0)
66a5 : 85 56 __ STA T2 + 0 
66a7 : ad c8 8a LDA $8ac8 ; (current + 1)
66aa : 85 57 __ STA T2 + 1 
66ac : a0 17 __ LDY #$17
66ae : b1 56 __ LDA (T2 + 0),y 
66b0 : aa __ __ TAX
66b1 : c8 __ __ INY
66b2 : b1 56 __ LDA (T2 + 0),y 
66b4 : 85 57 __ STA T2 + 1 
66b6 : d0 03 __ BNE $66bb ; (filepicker.s55 + 0)
.s1006:
66b8 : 8a __ __ TXA
66b9 : f0 08 __ BEQ $66c3 ; (filepicker.s167 + 0)
.s55:
66bb : 8e c7 8a STX $8ac7 ; (current + 0)
66be : a5 57 __ LDA T2 + 1 
66c0 : 8d c8 8a STA $8ac8 ; (current + 1)
.s167:
66c3 : c6 53 __ DEC T0 + 0 
66c5 : d0 db __ BNE $66a2 ; (filepicker.l52 + 0)
.s54:
66c7 : ad c7 8a LDA $8ac7 ; (current + 0)
66ca : 85 54 __ STA T1 + 0 
66cc : ad c8 8a LDA $8ac8 ; (current + 1)
66cf : 85 55 __ STA T1 + 1 
.s224:
66d1 : a5 54 __ LDA T1 + 0 
66d3 : 8d ba 8a STA $8aba ; (cwd + 27)
66d6 : a5 55 __ LDA T1 + 1 
66d8 : 8d bb 8a STA $8abb ; (cwd + 28)
66db : 4c 01 66 JMP $6601 ; (filepicker.s222 + 0)
.s49:
66de : a5 02 __ LDA $02 
66e0 : 85 54 __ STA T1 + 0 
66e2 : a5 48 __ LDA T7 + 0 
66e4 : 8d f8 ab STA $abf8 ; (sstack + 5)
66e7 : a0 15 __ LDY #$15
66e9 : b1 54 __ LDA (T1 + 0),y 
66eb : 8d c7 8a STA $8ac7 ; (current + 0)
66ee : c8 __ __ INY
66ef : b1 54 __ LDA (T1 + 0),y 
66f1 : 8d c8 8a STA $8ac8 ; (current + 1)
66f4 : 20 1e 70 JSR $701e ; (printElementPriv.s1000 + 0)
66f7 : ad c7 8a LDA $8ac7 ; (current + 0)
66fa : 85 54 __ STA T1 + 0 
66fc : ad c8 8a LDA $8ac8 ; (current + 1)
66ff : 85 55 __ STA T1 + 1 
6701 : a0 17 __ LDY #$17
6703 : b1 54 __ LDA (T1 + 0),y 
6705 : 8d c7 8a STA $8ac7 ; (current + 0)
6708 : c8 __ __ INY
6709 : b1 54 __ LDA (T1 + 0),y 
670b : 8d c8 8a STA $8ac8 ; (current + 1)
670e : 18 __ __ CLC
670f : a5 58 __ LDA T6 + 0 
6711 : 69 05 __ ADC #$05
.s223:
6713 : 8d f8 ab STA $abf8 ; (sstack + 5)
6716 : 20 1e 70 JSR $701e ; (printElementPriv.s1000 + 0)
6719 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s6:
671c : ee f6 86 INC $86f6 ; (targetdevice + 0)
671f : ad fc ab LDA $abfc ; (sstack + 9)
6722 : 8d fb ab STA $abfb ; (sstack + 8)
6725 : a9 1e __ LDA #$1e
6727 : cd f6 86 CMP $86f6 ; (targetdevice + 0)
672a : b0 05 __ BCS $6731 ; (filepicker.s9 + 0)
.s7:
672c : a9 08 __ LDA #$08
.s1061:
672e : 8d f6 86 STA $86f6 ; (targetdevice + 0)
.s9:
6731 : a9 00 __ LDA #$00
6733 : a2 21 __ LDX #$21
.l1014:
6735 : ca __ __ DEX
6736 : 9d 9f 8a STA $8a9f,x ; (cwd + 0)
6739 : d0 fa __ BNE $6735 ; (filepicker.l1014 + 0)
673b : 4c 28 66 JMP $6628 ; (filepicker.s221 + 0)
.s106:
673e : c9 50 __ CMP #$50
6740 : d0 63 __ BNE $67a5 ; (filepicker.s107 + 0)
.s63:
6742 : ad b6 8a LDA $8ab6 ; (cwd + 23)
6745 : 0d b7 8a ORA $8ab7 ; (cwd + 24)
6748 : d0 03 __ BNE $674d ; (filepicker.s67 + 0)
674a : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s67:
674d : a0 15 __ LDY #$15
674f : b1 54 __ LDA (T1 + 0),y 
6751 : c8 __ __ INY
6752 : 11 54 __ ORA (T1 + 0),y 
6754 : d0 03 __ BNE $6759 ; (filepicker.s64 + 0)
6756 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s64:
6759 : a5 48 __ LDA T7 + 0 
675b : 8d f8 ab STA $abf8 ; (sstack + 5)
675e : a9 00 __ LDA #$00
6760 : 8d b8 8a STA $8ab8 ; (cwd + 25)
6763 : 8d b9 8a STA $8ab9 ; (cwd + 26)
6766 : 20 1e 70 JSR $701e ; (printElementPriv.s1000 + 0)
6769 : a2 0e __ LDX #$0e
.l69:
676b : ad c7 8a LDA $8ac7 ; (current + 0)
676e : 85 54 __ STA T1 + 0 
6770 : ad c8 8a LDA $8ac8 ; (current + 1)
6773 : 85 55 __ STA T1 + 1 
6775 : a0 15 __ LDY #$15
6777 : b1 54 __ LDA (T1 + 0),y 
6779 : 85 02 __ STA $02 
677b : c8 __ __ INY
677c : b1 54 __ LDA (T1 + 0),y 
677e : a8 __ __ TAY
677f : 05 02 __ ORA $02 
6781 : f0 1c __ BEQ $679f ; (filepicker.s166 + 0)
.s72:
6783 : 8c c8 8a STY $8ac8 ; (current + 1)
6786 : 8c b9 8a STY $8ab9 ; (cwd + 26)
6789 : 8c bb 8a STY $8abb ; (cwd + 28)
678c : a5 02 __ LDA $02 
678e : 8d c7 8a STA $8ac7 ; (current + 0)
6791 : 8d b8 8a STA $8ab8 ; (cwd + 25)
6794 : 8d ba 8a STA $8aba ; (cwd + 27)
6797 : ee bc 8a INC $8abc ; (cwd + 29)
679a : d0 03 __ BNE $679f ; (filepicker.s166 + 0)
.s1067:
679c : ee bd 8a INC $8abd ; (cwd + 30)
.s166:
679f : ca __ __ DEX
67a0 : d0 c9 __ BNE $676b ; (filepicker.l69 + 0)
67a2 : 4c 01 66 JMP $6601 ; (filepicker.s222 + 0)
.s107:
67a5 : 90 03 __ BCC $67aa ; (filepicker.s109 + 0)
67a7 : 4c 53 68 JMP $6853 ; (filepicker.s108 + 0)
.s109:
67aa : c9 45 __ CMP #$45
67ac : f0 03 __ BEQ $67b1 ; (filepicker.s18 + 0)
67ae : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s18:
67b1 : ad b6 8a LDA $8ab6 ; (cwd + 23)
67b4 : 0d b7 8a ORA $8ab7 ; (cwd + 24)
67b7 : d0 03 __ BNE $67bc ; (filepicker.s19 + 0)
67b9 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s19:
67bc : ad b6 8a LDA $8ab6 ; (cwd + 23)
67bf : 8d c7 8a STA $8ac7 ; (current + 0)
67c2 : ad b7 8a LDA $8ab7 ; (cwd + 24)
67c5 : 8d c8 8a STA $8ac8 ; (current + 1)
67c8 : a9 00 __ LDA #$00
67ca : 85 54 __ STA T1 + 0 
67cc : 85 55 __ STA T1 + 1 
.l23:
67ce : ad c7 8a LDA $8ac7 ; (current + 0)
67d1 : 85 43 __ STA T3 + 0 
67d3 : ad c8 8a LDA $8ac8 ; (current + 1)
67d6 : 85 44 __ STA T3 + 1 
67d8 : a0 15 __ LDY #$15
67da : b1 43 __ LDA (T3 + 0),y 
67dc : 85 46 __ STA T5 + 0 
67de : c8 __ __ INY
67df : b1 43 __ LDA (T3 + 0),y 
67e1 : 85 47 __ STA T5 + 1 
67e3 : d0 18 __ BNE $67fd ; (filepicker.s25 + 0)
.s1023:
67e5 : a5 46 __ LDA T5 + 0 
67e7 : d0 14 __ BNE $67fd ; (filepicker.s25 + 0)
.s24:
67e9 : a5 43 __ LDA T3 + 0 
67eb : 8d b8 8a STA $8ab8 ; (cwd + 25)
67ee : a5 44 __ LDA T3 + 1 
67f0 : 8d b9 8a STA $8ab9 ; (cwd + 26)
67f3 : a5 54 __ LDA T1 + 0 
67f5 : 8d bc 8a STA $8abc ; (cwd + 29)
67f8 : a5 55 __ LDA T1 + 1 
67fa : 4c 4d 68 JMP $684d ; (filepicker.s1062 + 0)
.s25:
67fd : a5 46 __ LDA T5 + 0 
67ff : 8d c7 8a STA $8ac7 ; (current + 0)
6802 : a5 47 __ LDA T5 + 1 
6804 : 8d c8 8a STA $8ac8 ; (current + 1)
6807 : a5 54 __ LDA T1 + 0 
6809 : 85 1b __ STA ACCU + 0 
680b : a5 55 __ LDA T1 + 1 
680d : 85 1c __ STA ACCU + 1 
680f : a9 0e __ LDA #$0e
6811 : 85 03 __ STA WORK + 0 
6813 : a9 00 __ LDA #$00
6815 : 85 04 __ STA WORK + 1 
6817 : 20 a4 7c JSR $7ca4 ; (divmod + 0)
681a : a5 1b __ LDA ACCU + 0 
681c : 85 56 __ STA T2 + 0 
681e : 18 __ __ CLC
681f : a5 54 __ LDA T1 + 0 
6821 : 69 01 __ ADC #$01
6823 : 85 54 __ STA T1 + 0 
6825 : 85 1b __ STA ACCU + 0 
6827 : a5 55 __ LDA T1 + 1 
6829 : 69 00 __ ADC #$00
682b : 85 55 __ STA T1 + 1 
682d : 85 1c __ STA ACCU + 1 
682f : a9 0e __ LDA #$0e
6831 : 85 03 __ STA WORK + 0 
6833 : a9 00 __ LDA #$00
6835 : 85 04 __ STA WORK + 1 
6837 : 20 a4 7c JSR $7ca4 ; (divmod + 0)
683a : a5 56 __ LDA T2 + 0 
683c : c5 1b __ CMP ACCU + 0 
683e : f0 8e __ BEQ $67ce ; (filepicker.l23 + 0)
.s28:
6840 : a5 46 __ LDA T5 + 0 
6842 : 8d ba 8a STA $8aba ; (cwd + 27)
6845 : a5 47 __ LDA T5 + 1 
6847 : 8d bb 8a STA $8abb ; (cwd + 28)
684a : 4c ce 67 JMP $67ce ; (filepicker.l23 + 0)
.s1062:
684d : 8d bd 8a STA $8abd ; (cwd + 30)
6850 : 4c 01 66 JMP $6601 ; (filepicker.s222 + 0)
.s108:
6853 : c9 54 __ CMP #$54
6855 : f0 03 __ BEQ $685a ; (filepicker.s14 + 0)
6857 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s14:
685a : ad b6 8a LDA $8ab6 ; (cwd + 23)
685d : 0d b7 8a ORA $8ab7 ; (cwd + 24)
6860 : d0 03 __ BNE $6865 ; (filepicker.s15 + 0)
6862 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s15:
6865 : ad b6 8a LDA $8ab6 ; (cwd + 23)
6868 : 8d b8 8a STA $8ab8 ; (cwd + 25)
686b : 8d ba 8a STA $8aba ; (cwd + 27)
686e : ad b7 8a LDA $8ab7 ; (cwd + 24)
6871 : 8d b9 8a STA $8ab9 ; (cwd + 26)
6874 : 8d bb 8a STA $8abb ; (cwd + 28)
6877 : a9 00 __ LDA #$00
6879 : 8d bc 8a STA $8abc ; (cwd + 29)
687c : f0 cf __ BEQ $684d ; (filepicker.s1062 + 0)
.s90:
687e : a5 44 __ LDA T3 + 1 
6880 : d0 06 __ BNE $6888 ; (filepicker.s91 + 0)
.s1057:
6882 : a5 43 __ LDA T3 + 0 
6884 : c9 13 __ CMP #$13
6886 : f0 d2 __ BEQ $685a ; (filepicker.s14 + 0)
.s91:
6888 : a5 44 __ LDA T3 + 1 
688a : 30 5d __ BMI $68e9 ; (filepicker.s93 + 0)
.s1056:
688c : d0 06 __ BNE $6894 ; (filepicker.s92 + 0)
.s1055:
688e : a5 43 __ LDA T3 + 0 
6890 : c9 13 __ CMP #$13
6892 : 90 55 __ BCC $68e9 ; (filepicker.s93 + 0)
.s92:
6894 : a5 43 __ LDA T3 + 0 
6896 : c9 2b __ CMP #$2b
6898 : d0 03 __ BNE $689d ; (filepicker.s99 + 0)
689a : 4c 1c 67 JMP $671c ; (filepicker.s6 + 0)
.s99:
689d : b0 2b __ BCS $68ca ; (filepicker.s100 + 0)
.s101:
689f : c9 1b __ CMP #$1b
68a1 : f0 03 __ BEQ $68a6 ; (filepicker.s32 + 0)
68a3 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s32:
68a6 : a9 02 __ LDA #$02
.s3:
68a8 : 85 53 __ STA T0 + 0 
68aa : ad 9f 8a LDA $8a9f ; (cwd + 0)
68ad : f0 03 __ BEQ $68b2 ; (filepicker.s199 + 0)
.s117:
68af : 20 93 15 JSR $1593 ; (freeDir.s0 + 0)
.s199:
68b2 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
68b5 : a5 53 __ LDA T0 + 0 
68b7 : c9 01 __ CMP #$01
68b9 : f0 02 __ BEQ $68bd ; (filepicker.s120 + 0)
.s121:
68bb : a9 00 __ LDA #$00
.s120:
68bd : 85 1b __ STA ACCU + 0 
.s1001:
68bf : a2 05 __ LDX #$05
68c1 : bd c8 ab LDA $abc8,x ; (buff + 35)
68c4 : 95 53 __ STA T0 + 0,x 
68c6 : ca __ __ DEX
68c7 : 10 f8 __ BPL $68c1 ; (filepicker.s1001 + 2)
68c9 : 60 __ __ RTS
.s100:
68ca : c9 2d __ CMP #$2d
68cc : f0 03 __ BEQ $68d1 ; (filepicker.s10 + 0)
68ce : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s10:
68d1 : ce f6 86 DEC $86f6 ; (targetdevice + 0)
68d4 : ad fc ab LDA $abfc ; (sstack + 9)
68d7 : 8d fb ab STA $abfb ; (sstack + 8)
68da : ad f6 86 LDA $86f6 ; (targetdevice + 0)
68dd : c9 08 __ CMP #$08
68df : 90 03 __ BCC $68e4 ; (filepicker.s11 + 0)
68e1 : 4c 31 67 JMP $6731 ; (filepicker.s9 + 0)
.s11:
68e4 : a9 1e __ LDA #$1e
68e6 : 4c 2e 67 JMP $672e ; (filepicker.s1061 + 0)
.s93:
68e9 : a5 44 __ LDA T3 + 1 
68eb : d0 28 __ BNE $6915 ; (filepicker.s94 + 0)
.s1054:
68ed : a5 43 __ LDA T3 + 0 
68ef : c9 0d __ CMP #$0d
68f1 : d0 22 __ BNE $6915 ; (filepicker.s94 + 0)
.s58:
68f3 : ad b6 8a LDA $8ab6 ; (cwd + 23)
68f6 : 0d b7 8a ORA $8ab7 ; (cwd + 24)
68f9 : d0 03 __ BNE $68fe ; (filepicker.s62 + 0)
68fb : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s62:
68fe : a5 54 __ LDA T1 + 0 
6900 : 05 55 __ ORA T1 + 1 
6902 : d0 03 __ BNE $6907 ; (filepicker.s59 + 0)
6904 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s59:
6907 : a0 ff __ LDY #$ff
.l1052:
6909 : c8 __ __ INY
690a : b1 54 __ LDA (T1 + 0),y 
690c : 99 7a 87 STA $877a,y ; (filename + 0)
690f : d0 f8 __ BNE $6909 ; (filepicker.l1052 + 0)
.s1053:
6911 : a9 01 __ LDA #$01
6913 : d0 93 __ BNE $68a8 ; (filepicker.s3 + 0)
.s94:
6915 : a5 44 __ LDA T3 + 1 
6917 : 30 08 __ BMI $6921 ; (filepicker.s96 + 0)
.s1051:
6919 : d0 19 __ BNE $6934 ; (filepicker.s95 + 0)
.s1050:
691b : a5 43 __ LDA T3 + 0 
691d : c9 0d __ CMP #$0d
691f : b0 13 __ BCS $6934 ; (filepicker.s95 + 0)
.s96:
6921 : a5 44 __ LDA T3 + 1 
6923 : f0 03 __ BEQ $6928 ; (filepicker.s1049 + 0)
6925 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s1049:
6928 : a5 43 __ LDA T3 + 0 
692a : c9 03 __ CMP #$03
692c : d0 03 __ BNE $6931 ; (filepicker.s1049 + 9)
692e : 4c a6 68 JMP $68a6 ; (filepicker.s32 + 0)
6931 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s95:
6934 : a5 43 __ LDA T3 + 0 
6936 : c9 11 __ CMP #$11
6938 : f0 03 __ BEQ $693d ; (filepicker.s33 + 0)
693a : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s33:
693d : ad b6 8a LDA $8ab6 ; (cwd + 23)
6940 : 0d b7 8a ORA $8ab7 ; (cwd + 24)
6943 : d0 03 __ BNE $6948 ; (filepicker.s38 + 0)
6945 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s38:
6948 : a5 54 __ LDA T1 + 0 
694a : 05 55 __ ORA T1 + 1 
694c : d0 03 __ BNE $6951 ; (filepicker.s37 + 0)
694e : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s37:
6951 : a0 15 __ LDY #$15
6953 : b1 54 __ LDA (T1 + 0),y 
6955 : 85 02 __ STA $02 
6957 : c8 __ __ INY
6958 : b1 54 __ LDA (T1 + 0),y 
695a : 85 55 __ STA T1 + 1 
695c : 05 02 __ ORA $02 
695e : d0 03 __ BNE $6963 ; (filepicker.s34 + 0)
6960 : 4c 28 65 JMP $6528 ; (filepicker.l2 + 0)
.s34:
6963 : a5 02 __ LDA $02 
6965 : 85 54 __ STA T1 + 0 
6967 : 8d c7 8a STA $8ac7 ; (current + 0)
696a : 8d b8 8a STA $8ab8 ; (cwd + 25)
696d : a5 55 __ LDA T1 + 1 
696f : 8d c8 8a STA $8ac8 ; (current + 1)
6972 : 8d b9 8a STA $8ab9 ; (cwd + 26)
6975 : 18 __ __ CLC
6976 : a5 56 __ LDA T2 + 0 
6978 : 69 01 __ ADC #$01
697a : 8d bc 8a STA $8abc ; (cwd + 29)
697d : 85 1b __ STA ACCU + 0 
697f : a5 57 __ LDA T2 + 1 
6981 : 69 00 __ ADC #$00
6983 : 8d bd 8a STA $8abd ; (cwd + 30)
6986 : 85 1c __ STA ACCU + 1 
6988 : a9 0e __ LDA #$0e
698a : 85 03 __ STA WORK + 0 
698c : a9 00 __ LDA #$00
698e : 85 04 __ STA WORK + 1 
6990 : 20 a4 7c JSR $7ca4 ; (divmod + 0)
6993 : a5 46 __ LDA T5 + 0 
6995 : c5 1b __ CMP ACCU + 0 
6997 : f0 03 __ BEQ $699c ; (filepicker.s40 + 0)
6999 : 4c d1 66 JMP $66d1 ; (filepicker.s224 + 0)
.s40:
699c : a5 48 __ LDA T7 + 0 
699e : 8d f8 ab STA $abf8 ; (sstack + 5)
69a1 : a0 17 __ LDY #$17
69a3 : b1 54 __ LDA (T1 + 0),y 
69a5 : 8d c7 8a STA $8ac7 ; (current + 0)
69a8 : c8 __ __ INY
69a9 : b1 54 __ LDA (T1 + 0),y 
69ab : 8d c8 8a STA $8ac8 ; (current + 1)
69ae : 20 1e 70 JSR $701e ; (printElementPriv.s1000 + 0)
69b1 : ad c7 8a LDA $8ac7 ; (current + 0)
69b4 : 85 54 __ STA T1 + 0 
69b6 : ad c8 8a LDA $8ac8 ; (current + 1)
69b9 : 85 55 __ STA T1 + 1 
69bb : a0 15 __ LDY #$15
69bd : b1 54 __ LDA (T1 + 0),y 
69bf : 8d c7 8a STA $8ac7 ; (current + 0)
69c2 : c8 __ __ INY
69c3 : b1 54 __ LDA (T1 + 0),y 
69c5 : 8d c8 8a STA $8ac8 ; (current + 1)
69c8 : 18 __ __ CLC
69c9 : a5 58 __ LDA T6 + 0 
69cb : 69 07 __ ADC #$07
69cd : 4c 13 67 JMP $6713 ; (filepicker.s223 + 0)
--------------------------------------------------------------------
69d0 : __ __ __ BYT 73 45 4c 45 43 54 20 54 48 45 20 46 49 4c 45 20 : sELECT THE FILE 
69e0 : __ __ __ BYT 54 4f 20 4c 4f 41 44 00                         : TO LOAD.
--------------------------------------------------------------------
refreshDir: ; refreshDir(u8,u8)->void
.s0:
69e8 : ad fa ab LDA $abfa ; (sstack + 7)
69eb : 8d f8 ab STA $abf8 ; (sstack + 5)
69ee : ad fb ab LDA $abfb ; (sstack + 8)
69f1 : 8d f9 ab STA $abf9 ; (sstack + 6)
69f4 : 20 be 6a JSR $6abe ; (readDir.s1000 + 0)
69f7 : a5 1b __ LDA ACCU + 0 
69f9 : d0 18 __ BNE $6a13 ; (refreshDir.s1 + 0)
.s2:
69fb : ad fa ab LDA $abfa ; (sstack + 7)
69fe : 8d f8 ab STA $abf8 ; (sstack + 5)
6a01 : 20 6a 6f JSR $6f6a ; (drawDirFrame.s1000 + 0)
6a04 : a9 06 __ LDA #$06
6a06 : 85 12 __ STA P5 
6a08 : a9 a3 __ LDA #$a3
6a0a : 85 13 __ STA P6 
6a0c : a9 71 __ LDA #$71
6a0e : 85 14 __ STA P7 
6a10 : 4c 1f 81 JMP $811f ; (vdc_prints_attr@proxy + 0)
.s1:
6a13 : ad fa ab LDA $abfa ; (sstack + 7)
6a16 : 8d f9 ab STA $abf9 ; (sstack + 6)
6a19 : ad b6 8a LDA $8ab6 ; (cwd + 23)
6a1c : 8d b8 8a STA $8ab8 ; (cwd + 25)
6a1f : ad b7 8a LDA $8ab7 ; (cwd + 24)
6a22 : 8d b9 8a STA $8ab9 ; (cwd + 26)
--------------------------------------------------------------------
printDir: ; printDir(u8)->void
.s1000:
6a25 : a5 53 __ LDA T0 + 0 
6a27 : 8d cf ab STA $abcf ; (buff + 42)
.s0:
6a2a : ad b6 8a LDA $8ab6 ; (cwd + 23)
6a2d : 0d b7 8a ORA $8ab7 ; (cwd + 24)
6a30 : d0 1a __ BNE $6a4c ; (printDir.s3 + 0)
.s1:
6a32 : ad b3 87 LDA $87b3 ; (canvas + 11)
6a35 : 85 0f __ STA P2 
6a37 : ad b4 87 LDA $87b4 ; (canvas + 12)
6a3a : 85 14 __ STA P7 
6a3c : ad b5 87 LDA $87b5 ; (canvas + 13)
6a3f : 85 13 __ STA P6 
6a41 : ad b6 87 LDA $87b6 ; (canvas + 14)
6a44 : 85 15 __ STA P8 
6a46 : 20 9f 2c JSR $2c9f ; (vdc_clear@proxy + 0)
6a49 : 4c 94 6a JMP $6a94 ; (printDir.s1001 + 0)
.s3:
6a4c : ad f9 ab LDA $abf9 ; (sstack + 6)
6a4f : 8d f8 ab STA $abf8 ; (sstack + 5)
6a52 : 20 6a 6f JSR $6f6a ; (drawDirFrame.s1000 + 0)
6a55 : a9 00 __ LDA #$00
6a57 : 85 53 __ STA T0 + 0 
6a59 : ad ba 8a LDA $8aba ; (cwd + 27)
6a5c : ac bb 8a LDY $8abb ; (cwd + 28)
.l68:
6a5f : 8c c8 8a STY $8ac8 ; (current + 1)
6a62 : 8d c7 8a STA $8ac7 ; (current + 0)
6a65 : 98 __ __ TYA
6a66 : d0 05 __ BNE $6a6d ; (printDir.s11 + 0)
.s1006:
6a68 : ad c7 8a LDA $8ac7 ; (current + 0)
6a6b : f0 2d __ BEQ $6a9a ; (printDir.l12 + 0)
.s11:
6a6d : a5 53 __ LDA T0 + 0 
6a6f : c9 0e __ CMP #$0e
6a71 : b0 21 __ BCS $6a94 ; (printDir.s1001 + 0)
.s8:
6a73 : 69 06 __ ADC #$06
6a75 : 8d f8 ab STA $abf8 ; (sstack + 5)
6a78 : 20 1e 70 JSR $701e ; (printElementPriv.s1000 + 0)
6a7b : e6 53 __ INC T0 + 0 
6a7d : ad c7 8a LDA $8ac7 ; (current + 0)
6a80 : 85 44 __ STA T2 + 0 
6a82 : ad c8 8a LDA $8ac8 ; (current + 1)
6a85 : 85 45 __ STA T2 + 1 
6a87 : a0 15 __ LDY #$15
6a89 : b1 44 __ LDA (T2 + 0),y 
6a8b : aa __ __ TAX
6a8c : c8 __ __ INY
6a8d : b1 44 __ LDA (T2 + 0),y 
6a8f : a8 __ __ TAY
6a90 : 8a __ __ TXA
6a91 : 4c 5f 6a JMP $6a5f ; (printDir.l68 + 0)
.s1001:
6a94 : ad cf ab LDA $abcf ; (buff + 42)
6a97 : 85 53 __ STA T0 + 0 
6a99 : 60 __ __ RTS
.l12:
6a9a : a5 53 __ LDA T0 + 0 
6a9c : c9 0e __ CMP #$0e
6a9e : b0 f4 __ BCS $6a94 ; (printDir.s1001 + 0)
.s13:
6aa0 : a9 0a __ LDA #$0a
6aa2 : 85 0f __ STA P2 
6aa4 : a9 20 __ LDA #$20
6aa6 : 85 11 __ STA P4 
6aa8 : a9 28 __ LDA #$28
6aaa : 85 13 __ STA P6 
6aac : a9 01 __ LDA #$01
6aae : 85 15 __ STA P8 
6ab0 : a5 53 __ LDA T0 + 0 
6ab2 : 69 06 __ ADC #$06
6ab4 : 85 14 __ STA P7 
6ab6 : 20 a3 2c JSR $2ca3 ; (vdc_clear.s0 + 0)
6ab9 : e6 53 __ INC T0 + 0 
6abb : 4c 9a 6a JMP $6a9a ; (printDir.l12 + 0)
--------------------------------------------------------------------
readDir: ; readDir(u8,u8)->u8
.s1000:
6abe : a2 04 __ LDX #$04
6ac0 : b5 53 __ LDA T0 + 0,x 
6ac2 : 9d d0 ab STA $abd0,x ; (buff + 43)
6ac5 : ca __ __ DEX
6ac6 : 10 f8 __ BPL $6ac0 ; (readDir.s1000 + 2)
6ac8 : 38 __ __ SEC
6ac9 : a5 23 __ LDA SP + 0 
6acb : e9 08 __ SBC #$08
6acd : 85 23 __ STA SP + 0 
6acf : b0 02 __ BCS $6ad3 ; (readDir.s0 + 0)
6ad1 : c6 24 __ DEC SP + 1 
.s0:
6ad3 : a9 00 __ LDA #$00
6ad5 : 8d c5 8a STA $8ac5 ; (previous + 0)
6ad8 : 8d c6 8a STA $8ac6 ; (previous + 1)
6adb : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
6ade : 8d 96 87 STA $8796 ; (vdc_state + 7)
6ae1 : a9 ff __ LDA #$ff
6ae3 : 85 55 __ STA T1 + 0 
6ae5 : ad 9f 8a LDA $8a9f ; (cwd + 0)
6ae8 : f0 03 __ BEQ $6aed ; (readDir.s3 + 0)
.s1:
6aea : 20 93 15 JSR $1593 ; (freeDir.s0 + 0)
.s3:
6aed : a9 00 __ LDA #$00
6aef : a2 21 __ LDX #$21
.l1002:
6af1 : ca __ __ DEX
6af2 : 9d 9f 8a STA $8a9f,x ; (cwd + 0)
6af5 : d0 fa __ BNE $6af1 ; (readDir.l1002 + 0)
.s1003:
6af7 : 8d c0 8a STA $8ac0 ; (disk_id_buf + 0)
6afa : 8d c1 8a STA $8ac1 ; (disk_id_buf + 1)
6afd : 8d c2 8a STA $8ac2 ; (disk_id_buf + 2)
6b00 : 8d c3 8a STA $8ac3 ; (disk_id_buf + 3)
6b03 : 8d c4 8a STA $8ac4 ; (disk_id_buf + 4)
6b06 : ad f8 ab LDA $abf8 ; (sstack + 5)
6b09 : 85 10 __ STA P3 
6b0b : 20 da 15 JSR $15da ; (dir_open.s0 + 0)
6b0e : a5 1b __ LDA ACCU + 0 
6b10 : f0 03 __ BEQ $6b15 ; (readDir.l9 + 0)
6b12 : 4c cf 6c JMP $6ccf ; (readDir.s1016 + 0)
.l9:
6b15 : 20 e9 6c JSR $6ce9 ; (calloc.s0 + 0)
6b18 : a5 1b __ LDA ACCU + 0 
6b1a : 8d c7 8a STA $8ac7 ; (current + 0)
6b1d : a5 1c __ LDA ACCU + 1 
6b1f : 8d c8 8a STA $8ac8 ; (current + 1)
6b22 : 05 1b __ ORA ACCU + 0 
6b24 : d0 0e __ BNE $6b34 ; (readDir.s13 + 0)
.s11:
6b26 : 20 48 16 JSR $1648 ; (dir_close@proxy + 0)
6b29 : ad 96 87 LDA $8796 ; (vdc_state + 7)
6b2c : 09 40 __ ORA #$40
6b2e : 8d 96 87 STA $8796 ; (vdc_state + 7)
6b31 : 4c cf 6c JMP $6ccf ; (readDir.s1016 + 0)
.s13:
6b34 : a5 1c __ LDA ACCU + 1 
6b36 : 85 14 __ STA P7 
6b38 : 85 54 __ STA T0 + 1 
6b3a : a5 1b __ LDA ACCU + 0 
6b3c : 85 53 __ STA T0 + 0 
6b3e : 85 13 __ STA P6 
6b40 : 20 54 16 JSR $1654 ; (dir_readentry.s0 + 0)
6b43 : a5 1b __ LDA ACCU + 0 
6b45 : f0 03 __ BEQ $6b4a ; (readDir.s18 + 0)
6b47 : 4c 9b 6c JMP $6c9b ; (readDir.s16 + 0)
.s18:
6b4a : ad 96 87 LDA $8796 ; (vdc_state + 7)
6b4d : 09 40 __ ORA #$40
6b4f : 85 56 __ STA T3 + 0 
6b51 : a5 55 __ LDA T1 + 0 
6b53 : 4a __ __ LSR
6b54 : 4a __ __ LSR
6b55 : c9 24 __ CMP #$24
6b57 : 90 44 __ BCC $6b9d ; (readDir.s21 + 0)
.s20:
6b59 : a5 56 __ LDA T3 + 0 
6b5b : 8d 96 87 STA $8796 ; (vdc_state + 7)
6b5e : a9 3c __ LDA #$3c
6b60 : 85 13 __ STA P6 
6b62 : a9 01 __ LDA #$01
6b64 : 85 15 __ STA P8 
6b66 : 20 ff 81 JSR $81ff ; (vdc_clear@proxy + 0)
6b69 : a9 90 __ LDA #$90
6b6b : a0 02 __ LDY #$02
6b6d : 91 23 __ STA (SP + 0),y 
6b6f : a9 88 __ LDA #$88
6b71 : c8 __ __ INY
6b72 : 91 23 __ STA (SP + 0),y 
6b74 : a9 3a __ LDA #$3a
6b76 : c8 __ __ INY
6b77 : 91 23 __ STA (SP + 0),y 
6b79 : a9 6d __ LDA #$6d
6b7b : c8 __ __ INY
6b7c : 91 23 __ STA (SP + 0),y 
6b7e : ad f8 ab LDA $abf8 ; (sstack + 5)
6b81 : c8 __ __ INY
6b82 : 91 23 __ STA (SP + 0),y 
6b84 : a9 00 __ LDA #$00
6b86 : c8 __ __ INY
6b87 : 91 23 __ STA (SP + 0),y 
6b89 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
6b8c : a9 05 __ LDA #$05
6b8e : 85 12 __ STA P5 
6b90 : a5 56 __ LDA T3 + 0 
6b92 : 85 15 __ STA P8 
6b94 : 20 2b 81 JSR $812b ; (vdc_prints_attr@proxy + 0)
6b97 : a9 00 __ LDA #$00
6b99 : 85 55 __ STA T1 + 0 
6b9b : f0 2b __ BEQ $6bc8 ; (readDir.s94 + 0)
.s21:
6b9d : 69 0e __ ADC #$0e
6b9f : 8d b7 87 STA $87b7 ; (canvas + 15)
6ba2 : a9 05 __ LDA #$05
6ba4 : 8d b8 87 STA $87b8 ; (canvas + 16)
6ba7 : a5 55 __ LDA T1 + 0 
6ba9 : 29 03 __ AND #$03
6bab : aa __ __ TAX
6bac : bd cf 82 LDA $82cf,x ; (progressRev + 0)
6baf : f0 08 __ BEQ $6bb9 ; (readDir.s66 + 0)
.s67:
6bb1 : ad 96 87 LDA $8796 ; (vdc_state + 7)
6bb4 : 29 bf __ AND #$bf
6bb6 : 4c bb 6b JMP $6bbb ; (readDir.s1014 + 0)
.s66:
6bb9 : a5 56 __ LDA T3 + 0 
.s1014:
6bbb : 8d 96 87 STA $8796 ; (vdc_state + 7)
6bbe : bd db 82 LDA $82db,x ; (progressBar + 0)
6bc1 : 85 17 __ STA P10 
6bc3 : 20 41 6d JSR $6d41 ; (vdcwin_put_char.s1000 + 0)
6bc6 : e6 55 __ INC T1 + 0 
.s94:
6bc8 : ad c7 8a LDA $8ac7 ; (current + 0)
6bcb : 85 53 __ STA T0 + 0 
6bcd : ad c8 8a LDA $8ac8 ; (current + 1)
6bd0 : 85 54 __ STA T0 + 1 
6bd2 : a0 13 __ LDY #$13
6bd4 : ad 9f 8a LDA $8a9f ; (cwd + 0)
6bd7 : d0 5f __ BNE $6c38 ; (readDir.s28 + 0)
.s27:
6bd9 : b1 53 __ LDA (T0 + 0),y 
6bdb : c9 05 __ CMP #$05
6bdd : f0 19 __ BEQ $6bf8 ; (readDir.s30 + 0)
.s31:
6bdf : a2 ff __ LDX #$ff
.l1004:
6be1 : e8 __ __ INX
6be2 : bd 2e 6f LDA $6f2e,x 
6be5 : 9d 9f 8a STA $8a9f,x ; (cwd + 0)
6be8 : d0 f7 __ BNE $6be1 ; (readDir.l1004 + 0)
.s102:
6bea : a5 54 __ LDA T0 + 1 
6bec : a6 53 __ LDX T0 + 0 
.s1017:
6bee : 86 1b __ STX ACCU + 0 
6bf0 : 85 1c __ STA ACCU + 1 
6bf2 : 20 3c 7f JSR $7f3c ; (free + 0)
6bf5 : 4c 15 6b JMP $6b15 ; (readDir.l9 + 0)
.s30:
6bf8 : a0 00 __ LDY #$00
6bfa : f0 04 __ BEQ $6c00 ; (readDir.l33 + 0)
.s34:
6bfc : 99 9f 8a STA $8a9f,y ; (cwd + 0)
6bff : c8 __ __ INY
.l33:
6c00 : ad c7 8a LDA $8ac7 ; (current + 0)
6c03 : 85 1b __ STA ACCU + 0 
6c05 : ad c8 8a LDA $8ac8 ; (current + 1)
6c08 : 85 1c __ STA ACCU + 1 
6c0a : b1 1b __ LDA (ACCU + 0),y 
6c0c : d0 ee __ BNE $6bfc ; (readDir.s34 + 0)
.s36:
6c0e : a9 2c __ LDA #$2c
6c10 : 99 9f 8a STA $8a9f,y ; (cwd + 0)
6c13 : ad c0 8a LDA $8ac0 ; (disk_id_buf + 0)
6c16 : 99 a0 8a STA $8aa0,y ; (cwd + 1)
6c19 : ad c1 8a LDA $8ac1 ; (disk_id_buf + 1)
6c1c : 99 a1 8a STA $8aa1,y ; (cwd + 2)
6c1f : ad c2 8a LDA $8ac2 ; (disk_id_buf + 2)
6c22 : 99 a2 8a STA $8aa2,y ; (cwd + 3)
6c25 : ad c3 8a LDA $8ac3 ; (disk_id_buf + 3)
6c28 : 99 a3 8a STA $8aa3,y ; (cwd + 4)
6c2b : ad c4 8a LDA $8ac4 ; (disk_id_buf + 4)
6c2e : 99 a4 8a STA $8aa4,y ; (cwd + 5)
6c31 : a5 1c __ LDA ACCU + 1 
6c33 : a6 1b __ LDX ACCU + 0 
6c35 : 4c ee 6b JMP $6bee ; (readDir.s1017 + 0)
.s28:
6c38 : b1 53 __ LDA (T0 + 0),y 
6c3a : c9 64 __ CMP #$64
6c3c : d0 10 __ BNE $6c4e ; (readDir.s38 + 0)
.s37:
6c3e : a0 11 __ LDY #$11
6c40 : b1 53 __ LDA (T0 + 0),y 
6c42 : 8d be 8a STA $8abe ; (cwd + 31)
6c45 : c8 __ __ INY
6c46 : b1 53 __ LDA (T0 + 0),y 
6c48 : 8d bf 8a STA $8abf ; (cwd + 32)
6c4b : 4c ea 6b JMP $6bea ; (readDir.s102 + 0)
.s38:
6c4e : ad f9 ab LDA $abf9 ; (sstack + 6)
6c51 : 85 13 __ STA P6 
6c53 : 20 92 18 JSR $1892 ; (dir_validentry.s0 + 0)
6c56 : a5 1b __ LDA ACCU + 0 
6c58 : f0 90 __ BEQ $6bea ; (readDir.s102 + 0)
.s40:
6c5a : ad b7 8a LDA $8ab7 ; (cwd + 24)
6c5d : d0 05 __ BNE $6c64 ; (readDir.s44 + 0)
.s1008:
6c5f : ad b6 8a LDA $8ab6 ; (cwd + 23)
6c62 : f0 20 __ BEQ $6c84 ; (readDir.s43 + 0)
.s44:
6c64 : ad c6 8a LDA $8ac6 ; (previous + 1)
6c67 : 85 57 __ STA T3 + 1 
6c69 : ad c5 8a LDA $8ac5 ; (previous + 0)
6c6c : 85 56 __ STA T3 + 0 
6c6e : a0 17 __ LDY #$17
6c70 : 91 53 __ STA (T0 + 0),y 
6c72 : a5 57 __ LDA T3 + 1 
6c74 : c8 __ __ INY
6c75 : 91 53 __ STA (T0 + 0),y 
6c77 : a5 53 __ LDA T0 + 0 
6c79 : a0 15 __ LDY #$15
6c7b : 91 56 __ STA (T3 + 0),y 
6c7d : a5 54 __ LDA T0 + 1 
6c7f : c8 __ __ INY
6c80 : 91 56 __ STA (T3 + 0),y 
6c82 : d0 0a __ BNE $6c8e ; (readDir.s116 + 0)
.s43:
6c84 : a5 53 __ LDA T0 + 0 
6c86 : 8d b6 8a STA $8ab6 ; (cwd + 23)
6c89 : a5 54 __ LDA T0 + 1 
6c8b : 8d b7 8a STA $8ab7 ; (cwd + 24)
.s116:
6c8e : a5 53 __ LDA T0 + 0 
6c90 : 8d c5 8a STA $8ac5 ; (previous + 0)
6c93 : a5 54 __ LDA T0 + 1 
6c95 : 8d c6 8a STA $8ac6 ; (previous + 1)
6c98 : 4c 15 6b JMP $6b15 ; (readDir.l9 + 0)
.s16:
6c9b : a5 53 __ LDA T0 + 0 
6c9d : 85 1b __ STA ACCU + 0 
6c9f : a5 54 __ LDA T0 + 1 
6ca1 : 85 1c __ STA ACCU + 1 
6ca3 : 20 3c 7f JSR $7f3c ; (free + 0)
6ca6 : 20 48 16 JSR $1648 ; (dir_close@proxy + 0)
6ca9 : ad 96 87 LDA $8796 ; (vdc_state + 7)
6cac : 09 40 __ ORA #$40
6cae : 8d 96 87 STA $8796 ; (vdc_state + 7)
6cb1 : ad b6 8a LDA $8ab6 ; (cwd + 23)
6cb4 : 0d b7 8a ORA $8ab7 ; (cwd + 24)
6cb7 : f0 16 __ BEQ $6ccf ; (readDir.s1016 + 0)
.s47:
6cb9 : ad b6 8a LDA $8ab6 ; (cwd + 23)
6cbc : 8d b8 8a STA $8ab8 ; (cwd + 25)
6cbf : 8d ba 8a STA $8aba ; (cwd + 27)
6cc2 : ad b7 8a LDA $8ab7 ; (cwd + 24)
6cc5 : 8d b9 8a STA $8ab9 ; (cwd + 26)
6cc8 : 8d bb 8a STA $8abb ; (cwd + 28)
6ccb : a9 01 __ LDA #$01
6ccd : d0 02 __ BNE $6cd1 ; (readDir.s1001 + 0)
.s1016:
6ccf : a9 00 __ LDA #$00
.s1001:
6cd1 : 85 1b __ STA ACCU + 0 
6cd3 : 18 __ __ CLC
6cd4 : a5 23 __ LDA SP + 0 
6cd6 : 69 08 __ ADC #$08
6cd8 : 85 23 __ STA SP + 0 
6cda : 90 02 __ BCC $6cde ; (readDir.s1001 + 13)
6cdc : e6 24 __ INC SP + 1 
6cde : a2 04 __ LDX #$04
6ce0 : bd d0 ab LDA $abd0,x ; (buff + 43)
6ce3 : 95 53 __ STA T0 + 0,x 
6ce5 : ca __ __ DEX
6ce6 : 10 f8 __ BPL $6ce0 ; (readDir.s1001 + 15)
6ce8 : 60 __ __ RTS
--------------------------------------------------------------------
calloc: ; calloc(i16,i16)->void*
.s0:
6ce9 : a9 19 __ LDA #$19
6ceb : 85 1b __ STA ACCU + 0 
6ced : a9 00 __ LDA #$00
6cef : 85 1c __ STA ACCU + 1 
6cf1 : 20 5f 7e JSR $7e5f ; (malloc + 0)
6cf4 : a5 1c __ LDA ACCU + 1 
6cf6 : 05 1b __ ORA ACCU + 0 
6cf8 : f0 1d __ BEQ $6d17 ; (calloc.s1001 + 0)
.s1:
6cfa : a5 1c __ LDA ACCU + 1 
6cfc : 85 0e __ STA P1 
6cfe : 85 44 __ STA T0 + 1 
6d00 : a5 1b __ LDA ACCU + 0 
6d02 : 85 0d __ STA P0 
6d04 : a9 19 __ LDA #$19
6d06 : 85 0f __ STA P2 
6d08 : a9 00 __ LDA #$00
6d0a : 85 10 __ STA P3 
6d0c : 20 18 6d JSR $6d18 ; (memclr.s0 + 0)
6d0f : a5 0d __ LDA P0 
6d11 : 85 1b __ STA ACCU + 0 
6d13 : a5 44 __ LDA T0 + 1 
6d15 : 85 1c __ STA ACCU + 1 
.s1001:
6d17 : 60 __ __ RTS
--------------------------------------------------------------------
memclr: ; memclr(void*,i16)->void
.s0:
6d18 : a5 10 __ LDA P3 ; (size + 1)
6d1a : 05 0f __ ORA P2 ; (size + 0)
6d1c : f0 1b __ BEQ $6d39 ; (memclr.s1001 + 0)
.s5:
6d1e : a0 00 __ LDY #$00
6d20 : a5 0f __ LDA P2 ; (size + 0)
6d22 : f0 02 __ BEQ $6d26 ; (memclr.s1011 + 0)
.s1005:
6d24 : e6 10 __ INC P3 ; (size + 1)
.s1011:
6d26 : 98 __ __ TYA
.l1002:
6d27 : a6 0f __ LDX P2 ; (size + 0)
.l1006:
6d29 : 91 0d __ STA (P0),y ; (dst + 0)
6d2b : c8 __ __ INY
6d2c : d0 02 __ BNE $6d30 ; (memclr.s1009 + 0)
.s1008:
6d2e : e6 0e __ INC P1 ; (dst + 1)
.s1009:
6d30 : ca __ __ DEX
6d31 : d0 f6 __ BNE $6d29 ; (memclr.l1006 + 0)
.s1007:
6d33 : 85 0f __ STA P2 ; (size + 0)
6d35 : c6 10 __ DEC P3 ; (size + 1)
6d37 : d0 ee __ BNE $6d27 ; (memclr.l1002 + 0)
.s1001:
6d39 : 60 __ __ RTS
--------------------------------------------------------------------
6d3a : __ __ __ BYT 5b 25 30 32 55 5d 00                            : [%02U].
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
6d41 : a5 53 __ LDA T1 + 0 
6d43 : 8d ed ab STA $abed ; (palette_draw@stack + 14)
6d46 : 38 __ __ SEC
6d47 : a5 23 __ LDA SP + 0 
6d49 : e9 06 __ SBC #$06
6d4b : 85 23 __ STA SP + 0 
6d4d : b0 02 __ BCS $6d51 ; (vdcwin_put_char.s0 + 0)
6d4f : c6 24 __ DEC SP + 1 
.s0:
6d51 : ad b7 87 LDA $87b7 ; (canvas + 15)
6d54 : 85 11 __ STA P4 
6d56 : ad b8 87 LDA $87b8 ; (canvas + 16)
6d59 : 85 53 __ STA T1 + 0 
6d5b : 85 12 __ STA P5 
6d5d : a5 17 __ LDA P10 ; (ch + 0)
6d5f : 85 13 __ STA P6 
6d61 : 20 af 6d JSR $6daf ; (vdcwin_putat_char.s0 + 0)
6d64 : a6 11 __ LDX P4 
6d66 : e8 __ __ INX
6d67 : 8e b7 87 STX $87b7 ; (canvas + 15)
6d6a : ec b5 87 CPX $87b5 ; (canvas + 13)
6d6d : d0 2f __ BNE $6d9e ; (vdcwin_put_char.s1001 + 0)
.s1:
6d6f : a9 00 __ LDA #$00
6d71 : 8d b7 87 STA $87b7 ; (canvas + 15)
6d74 : 18 __ __ CLC
6d75 : a5 53 __ LDA T1 + 0 
6d77 : 69 01 __ ADC #$01
6d79 : 8d b8 87 STA $87b8 ; (canvas + 16)
6d7c : cd b6 87 CMP $87b6 ; (canvas + 14)
6d7f : d0 1d __ BNE $6d9e ; (vdcwin_put_char.s1001 + 0)
.s4:
6d81 : a5 53 __ LDA T1 + 0 
6d83 : 8d b8 87 STA $87b8 ; (canvas + 16)
6d86 : a9 b3 __ LDA #$b3
6d88 : a0 02 __ LDY #$02
6d8a : 91 23 __ STA (SP + 0),y 
6d8c : a9 87 __ LDA #$87
6d8e : c8 __ __ INY
6d8f : 91 23 __ STA (SP + 0),y 
6d91 : a9 ff __ LDA #$ff
6d93 : c8 __ __ INY
6d94 : 91 23 __ STA (SP + 0),y 
6d96 : a9 2a __ LDA #$2a
6d98 : c8 __ __ INY
6d99 : 91 23 __ STA (SP + 0),y 
6d9b : 20 d6 6d JSR $6dd6 ; (vdcwin_printline.s1000 + 0)
.s1001:
6d9e : 18 __ __ CLC
6d9f : a5 23 __ LDA SP + 0 
6da1 : 69 06 __ ADC #$06
6da3 : 85 23 __ STA SP + 0 
6da5 : 90 02 __ BCC $6da9 ; (vdcwin_put_char.s1001 + 11)
6da7 : e6 24 __ INC SP + 1 
6da9 : ad ed ab LDA $abed ; (palette_draw@stack + 14)
6dac : 85 53 __ STA T1 + 0 
6dae : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
6daf : a5 13 __ LDA P6 ; (ch + 0)
6db1 : 4a __ __ LSR
6db2 : 4a __ __ LSR
6db3 : 4a __ __ LSR
6db4 : 4a __ __ LSR
6db5 : 4a __ __ LSR
6db6 : aa __ __ TAX
6db7 : bd d3 82 LDA $82d3,x ; (p2smap + 0)
6dba : 45 13 __ EOR P6 ; (ch + 0)
6dbc : 85 0f __ STA P2 
6dbe : 18 __ __ CLC
6dbf : a5 11 __ LDA P4 ; (x + 0)
6dc1 : 6d b3 87 ADC $87b3 ; (canvas + 11)
6dc4 : 85 0d __ STA P0 
6dc6 : 18 __ __ CLC
6dc7 : a5 12 __ LDA P5 ; (y + 0)
6dc9 : 6d b4 87 ADC $87b4 ; (canvas + 12)
6dcc : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
6dce : ad 96 87 LDA $8796 ; (vdc_state + 7)
6dd1 : 85 10 __ STA P3 
6dd3 : 4c f8 34 JMP $34f8 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
6dd6 : a5 53 __ LDA T0 + 0 
6dd8 : 8d ef ab STA $abef ; (buffer + 12)
6ddb : a5 54 __ LDA T0 + 1 
6ddd : 8d f0 ab STA $abf0 ; (buffer + 13)
6de0 : a5 55 __ LDA T1 + 0 
6de2 : 8d f1 ab STA $abf1 ; (buffer + 14)
6de5 : 38 __ __ SEC
6de6 : a5 23 __ LDA SP + 0 
6de8 : e9 06 __ SBC #$06
6dea : 85 23 __ STA SP + 0 
6dec : b0 02 __ BCS $6df0 ; (vdcwin_printline.s0 + 0)
6dee : c6 24 __ DEC SP + 1 
.s0:
6df0 : a0 08 __ LDY #$08
6df2 : b1 23 __ LDA (SP + 0),y 
6df4 : 85 53 __ STA T0 + 0 
6df6 : a0 02 __ LDY #$02
6df8 : 91 23 __ STA (SP + 0),y 
6dfa : a0 09 __ LDY #$09
6dfc : b1 23 __ LDA (SP + 0),y 
6dfe : 85 54 __ STA T0 + 1 
6e00 : a0 03 __ LDY #$03
6e02 : 91 23 __ STA (SP + 0),y 
6e04 : a0 0a __ LDY #$0a
6e06 : b1 23 __ LDA (SP + 0),y 
6e08 : a0 04 __ LDY #$04
6e0a : 91 23 __ STA (SP + 0),y 
6e0c : a0 0b __ LDY #$0b
6e0e : b1 23 __ LDA (SP + 0),y 
6e10 : a0 05 __ LDY #$05
6e12 : 91 23 __ STA (SP + 0),y 
6e14 : 20 7e 6e JSR $6e7e ; (vdcwin_put_string.s1000 + 0)
6e17 : a9 00 __ LDA #$00
6e19 : a0 04 __ LDY #$04
6e1b : 91 53 __ STA (T0 + 0),y 
6e1d : 88 __ __ DEY
6e1e : b1 53 __ LDA (T0 + 0),y 
6e20 : 85 55 __ STA T1 + 0 
6e22 : 38 __ __ SEC
6e23 : e9 01 __ SBC #$01
6e25 : 85 44 __ STA T3 + 0 
6e27 : a0 05 __ LDY #$05
6e29 : b1 53 __ LDA (T0 + 0),y 
6e2b : 90 0b __ BCC $6e38 ; (vdcwin_printline.s2 + 0)
.s1002:
6e2d : aa __ __ TAX
6e2e : e4 44 __ CPX T3 + 0 
6e30 : b0 06 __ BCS $6e38 ; (vdcwin_printline.s2 + 0)
.s1:
6e32 : e8 __ __ INX
6e33 : 8a __ __ TXA
6e34 : 91 53 __ STA (T0 + 0),y 
6e36 : 90 2b __ BCC $6e63 ; (vdcwin_printline.s1001 + 0)
.s2:
6e38 : a5 53 __ LDA T0 + 0 
6e3a : 85 15 __ STA P8 
6e3c : a5 54 __ LDA T0 + 1 
6e3e : 85 16 __ STA P9 
6e40 : 20 eb 49 JSR $49eb ; (vdcwin_scroll_up.s0 + 0)
6e43 : a9 20 __ LDA #$20
6e45 : 85 11 __ STA P4 
6e47 : a0 00 __ LDY #$00
6e49 : b1 15 __ LDA (P8),y 
6e4b : 85 0f __ STA P2 ; (str + 0)
6e4d : a0 02 __ LDY #$02
6e4f : b1 15 __ LDA (P8),y 
6e51 : 85 13 __ STA P6 
6e53 : 88 __ __ DEY
6e54 : 84 15 __ STY P8 
6e56 : b1 53 __ LDA (T0 + 0),y 
6e58 : 18 __ __ CLC
6e59 : 65 55 __ ADC T1 + 0 
6e5b : 38 __ __ SEC
6e5c : e9 01 __ SBC #$01
6e5e : 85 14 __ STA P7 
6e60 : 20 a3 2c JSR $2ca3 ; (vdc_clear.s0 + 0)
.s1001:
6e63 : 18 __ __ CLC
6e64 : a5 23 __ LDA SP + 0 
6e66 : 69 06 __ ADC #$06
6e68 : 85 23 __ STA SP + 0 
6e6a : 90 02 __ BCC $6e6e ; (vdcwin_printline.s1001 + 11)
6e6c : e6 24 __ INC SP + 1 
6e6e : ad ef ab LDA $abef ; (buffer + 12)
6e71 : 85 53 __ STA T0 + 0 
6e73 : ad f0 ab LDA $abf0 ; (buffer + 13)
6e76 : 85 54 __ STA T0 + 1 
6e78 : ad f1 ab LDA $abf1 ; (buffer + 14)
6e7b : 85 55 __ STA T1 + 0 
6e7d : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
6e7e : 38 __ __ SEC
6e7f : a5 23 __ LDA SP + 0 
6e81 : e9 0b __ SBC #$0b
6e83 : 85 23 __ STA SP + 0 
6e85 : b0 02 __ BCS $6e89 ; (vdcwin_put_string.s0 + 0)
6e87 : c6 24 __ DEC SP + 1 
.s0:
6e89 : a0 0d __ LDY #$0d
6e8b : b1 23 __ LDA (SP + 0),y 
6e8d : 85 11 __ STA P4 
6e8f : c8 __ __ INY
6e90 : b1 23 __ LDA (SP + 0),y 
6e92 : 85 12 __ STA P5 
6e94 : a0 04 __ LDY #$04
6e96 : b1 11 __ LDA (P4),y 
6e98 : 85 13 __ STA P6 
6e9a : c8 __ __ INY
6e9b : b1 11 __ LDA (P4),y 
6e9d : 85 14 __ STA P7 
6e9f : a0 0f __ LDY #$0f
6ea1 : b1 23 __ LDA (SP + 0),y 
6ea3 : 85 15 __ STA P8 
6ea5 : c8 __ __ INY
6ea6 : b1 23 __ LDA (SP + 0),y 
6ea8 : 85 16 __ STA P9 
6eaa : 20 f9 6e JSR $6ef9 ; (vdcwin_putat_string.s0 + 0)
6ead : 18 __ __ CLC
6eae : a5 1b __ LDA ACCU + 0 
6eb0 : 65 13 __ ADC P6 
6eb2 : a0 04 __ LDY #$04
6eb4 : 91 11 __ STA (P4),y 
6eb6 : a0 02 __ LDY #$02
6eb8 : d1 11 __ CMP (P4),y 
6eba : 90 31 __ BCC $6eed ; (vdcwin_put_string.s1001 + 0)
.s1:
6ebc : a9 00 __ LDA #$00
6ebe : a0 04 __ LDY #$04
6ec0 : 91 11 __ STA (P4),y 
6ec2 : a5 14 __ LDA P7 
6ec4 : 69 00 __ ADC #$00
6ec6 : c8 __ __ INY
6ec7 : 91 11 __ STA (P4),y 
6ec9 : a0 03 __ LDY #$03
6ecb : d1 11 __ CMP (P4),y 
6ecd : d0 1e __ BNE $6eed ; (vdcwin_put_string.s1001 + 0)
.s4:
6ecf : a5 14 __ LDA P7 
6ed1 : a0 05 __ LDY #$05
6ed3 : 91 11 __ STA (P4),y 
6ed5 : a5 11 __ LDA P4 
6ed7 : a0 02 __ LDY #$02
6ed9 : 91 23 __ STA (SP + 0),y 
6edb : a5 12 __ LDA P5 
6edd : c8 __ __ INY
6ede : 91 23 __ STA (SP + 0),y 
6ee0 : a9 ff __ LDA #$ff
6ee2 : c8 __ __ INY
6ee3 : 91 23 __ STA (SP + 0),y 
6ee5 : a9 2a __ LDA #$2a
6ee7 : c8 __ __ INY
6ee8 : 91 23 __ STA (SP + 0),y 
6eea : 20 d6 6d JSR $6dd6 ; (vdcwin_printline.s1000 + 0)
.s1001:
6eed : 18 __ __ CLC
6eee : a5 23 __ LDA SP + 0 
6ef0 : 69 0b __ ADC #$0b
6ef2 : 85 23 __ STA SP + 0 
6ef4 : 90 02 __ BCC $6ef8 ; (vdcwin_put_string.s1001 + 11)
6ef6 : e6 24 __ INC SP + 1 
6ef8 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
6ef9 : a9 00 __ LDA #$00
6efb : 85 43 __ STA T0 + 0 
6efd : f0 26 __ BEQ $6f25 ; (vdcwin_putat_string.l1 + 0)
.s2:
6eff : 4a __ __ LSR
6f00 : 4a __ __ LSR
6f01 : 4a __ __ LSR
6f02 : 4a __ __ LSR
6f03 : 4a __ __ LSR
6f04 : aa __ __ TAX
6f05 : bd d3 82 LDA $82d3,x ; (p2smap + 0)
6f08 : 51 15 __ EOR (P8),y ; (str + 0)
6f0a : 85 0f __ STA P2 
6f0c : a5 13 __ LDA P6 ; (x + 0)
6f0e : 18 __ __ CLC
6f0f : a0 00 __ LDY #$00
6f11 : 71 11 __ ADC (P4),y ; (win + 0)
6f13 : 18 __ __ CLC
6f14 : 65 43 __ ADC T0 + 0 
6f16 : 85 0d __ STA P0 
6f18 : a5 14 __ LDA P7 ; (y + 0)
6f1a : 18 __ __ CLC
6f1b : c8 __ __ INY
6f1c : 71 11 __ ADC (P4),y ; (win + 0)
6f1e : 85 0e __ STA P1 
6f20 : 20 ce 6d JSR $6dce ; (vdc_printc@proxy + 0)
6f23 : e6 43 __ INC T0 + 0 
.l1:
6f25 : a4 43 __ LDY T0 + 0 
6f27 : b1 15 __ LDA (P8),y ; (str + 0)
6f29 : d0 d4 __ BNE $6eff ; (vdcwin_putat_string.s2 + 0)
.s3:
6f2b : 84 1b __ STY ACCU + 0 
.s1001:
6f2d : 60 __ __ RTS
--------------------------------------------------------------------
6f2e : __ __ __ BYT 75 4e 4b 4e 4f 57 4e 20 54 59 50 45 00          : uNKNOWN TYPE.
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i16
.s0:
6f3b : a0 00 __ LDY #$00
6f3d : 84 1c __ STY ACCU + 1 
6f3f : b1 0d __ LDA (P0),y 
6f41 : f0 16 __ BEQ $6f59 ; (strcmp.s0 + 30)
6f43 : d1 0f __ CMP (P2),y 
6f45 : d0 16 __ BNE $6f5d ; (strcmp.s0 + 34)
6f47 : c8 __ __ INY
6f48 : b1 0d __ LDA (P0),y 
6f4a : f0 0d __ BEQ $6f59 ; (strcmp.s0 + 30)
6f4c : d1 0f __ CMP (P2),y 
6f4e : d0 0d __ BNE $6f5d ; (strcmp.s0 + 34)
6f50 : c8 __ __ INY
6f51 : d0 ec __ BNE $6f3f ; (strcmp.s0 + 4)
6f53 : e6 0e __ INC P1 
6f55 : e6 10 __ INC P3 
6f57 : d0 e6 __ BNE $6f3f ; (strcmp.s0 + 4)
6f59 : d1 0f __ CMP (P2),y 
6f5b : f0 0a __ BEQ $6f67 ; (strcmp.s0 + 44)
6f5d : b0 06 __ BCS $6f65 ; (strcmp.s0 + 42)
6f5f : a9 ff __ LDA #$ff
6f61 : 85 1c __ STA ACCU + 1 
6f63 : 30 02 __ BMI $6f67 ; (strcmp.s0 + 44)
6f65 : a9 01 __ LDA #$01
6f67 : 85 1b __ STA ACCU + 0 
.s1001:
6f69 : 60 __ __ RTS
--------------------------------------------------------------------
drawDirFrame: ; drawDirFrame(u8)->void
.s1000:
6f6a : 38 __ __ SEC
6f6b : a5 23 __ LDA SP + 0 
6f6d : e9 0a __ SBC #$0a
6f6f : 85 23 __ STA SP + 0 
6f71 : b0 02 __ BCS $6f75 ; (drawDirFrame.s0 + 0)
6f73 : c6 24 __ DEC SP + 1 
.s0:
6f75 : a9 28 __ LDA #$28
6f77 : 85 13 __ STA P6 
6f79 : a9 10 __ LDA #$10
6f7b : 85 15 __ STA P8 
6f7d : 20 ff 81 JSR $81ff ; (vdc_clear@proxy + 0)
6f80 : a9 90 __ LDA #$90
6f82 : a0 02 __ LDY #$02
6f84 : 91 23 __ STA (SP + 0),y 
6f86 : a9 88 __ LDA #$88
6f88 : c8 __ __ INY
6f89 : 91 23 __ STA (SP + 0),y 
6f8b : a9 02 __ LDA #$02
6f8d : c8 __ __ INY
6f8e : 91 23 __ STA (SP + 0),y 
6f90 : a9 70 __ LDA #$70
6f92 : c8 __ __ INY
6f93 : 91 23 __ STA (SP + 0),y 
6f95 : ad f8 ab LDA $abf8 ; (sstack + 5)
6f98 : c8 __ __ INY
6f99 : 91 23 __ STA (SP + 0),y 
6f9b : a9 00 __ LDA #$00
6f9d : c8 __ __ INY
6f9e : 91 23 __ STA (SP + 0),y 
6fa0 : a9 9f __ LDA #$9f
6fa2 : c8 __ __ INY
6fa3 : 91 23 __ STA (SP + 0),y 
6fa5 : a9 8a __ LDA #$8a
6fa7 : c8 __ __ INY
6fa8 : 91 23 __ STA (SP + 0),y 
6faa : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
6fad : a9 0b __ LDA #$0b
6faf : 85 11 __ STA P4 
6fb1 : a9 05 __ LDA #$05
6fb3 : 85 12 __ STA P5 
6fb5 : a9 90 __ LDA #$90
6fb7 : 85 13 __ STA P6 
6fb9 : a9 88 __ LDA #$88
6fbb : 85 14 __ STA P7 
6fbd : ad 96 87 LDA $8796 ; (vdc_state + 7)
6fc0 : 85 4e __ STA T2 + 0 
6fc2 : 85 15 __ STA P8 
6fc4 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
6fc7 : a9 90 __ LDA #$90
6fc9 : a0 02 __ LDY #$02
6fcb : 91 23 __ STA (SP + 0),y 
6fcd : a9 88 __ LDA #$88
6fcf : c8 __ __ INY
6fd0 : 91 23 __ STA (SP + 0),y 
6fd2 : a9 0f __ LDA #$0f
6fd4 : c8 __ __ INY
6fd5 : 91 23 __ STA (SP + 0),y 
6fd7 : a9 70 __ LDA #$70
6fd9 : c8 __ __ INY
6fda : 91 23 __ STA (SP + 0),y 
6fdc : ad be 8a LDA $8abe ; (cwd + 31)
6fdf : c8 __ __ INY
6fe0 : 91 23 __ STA (SP + 0),y 
6fe2 : ad bf 8a LDA $8abf ; (cwd + 32)
6fe5 : c8 __ __ INY
6fe6 : 91 23 __ STA (SP + 0),y 
6fe8 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
6feb : a9 14 __ LDA #$14
6fed : 85 12 __ STA P5 
6fef : a5 4e __ LDA T2 + 0 
6ff1 : 85 15 __ STA P8 
6ff3 : 20 2b 81 JSR $812b ; (vdc_prints_attr@proxy + 0)
.s1001:
6ff6 : 18 __ __ CLC
6ff7 : a5 23 __ LDA SP + 0 
6ff9 : 69 0a __ ADC #$0a
6ffb : 85 23 __ STA SP + 0 
6ffd : 90 02 __ BCC $7001 ; (drawDirFrame.s1001 + 11)
6fff : e6 24 __ INC SP + 1 
7001 : 60 __ __ RTS
--------------------------------------------------------------------
7002 : __ __ __ BYT 5b 25 30 32 55 5d 20 25 2e 32 30 53 00          : [%02U] %.20S.
--------------------------------------------------------------------
700f : __ __ __ BYT 25 55 20 42 4c 4f 43 4b 53 20 46 52 45 45 00    : %U BLOCKS FREE.
--------------------------------------------------------------------
printElementPriv: ; printElementPriv(const u8)->void
.s1000:
701e : a2 03 __ LDX #$03
7020 : b5 53 __ LDA T1 + 0,x 
7022 : 9d d1 ab STA $abd1,x ; (buff + 44)
7025 : ca __ __ DEX
7026 : 10 f8 __ BPL $7020 ; (printElementPriv.s1000 + 2)
7028 : 38 __ __ SEC
7029 : a5 23 __ LDA SP + 0 
702b : e9 0a __ SBC #$0a
702d : 85 23 __ STA SP + 0 
702f : b0 02 __ BCS $7033 ; (printElementPriv.s0 + 0)
7031 : c6 24 __ DEC SP + 1 
.s0:
7033 : a9 0c __ LDA #$0c
7035 : 8d b7 87 STA $87b7 ; (canvas + 15)
7038 : ad cd 82 LDA $82cd ; (mc_pd_normal + 0)
703b : 8d 96 87 STA $8796 ; (vdc_state + 7)
703e : ad f8 ab LDA $abf8 ; (sstack + 5)
7041 : 8d b8 87 STA $87b8 ; (canvas + 16)
7044 : ad c7 8a LDA $8ac7 ; (current + 0)
7047 : 85 53 __ STA T1 + 0 
7049 : ad c8 8a LDA $8ac8 ; (current + 1)
704c : 85 54 __ STA T1 + 1 
704e : cd b9 8a CMP $8ab9 ; (cwd + 26)
7051 : d0 0d __ BNE $7060 ; (printElementPriv.s3 + 0)
.s1011:
7053 : a5 53 __ LDA T1 + 0 
7055 : cd b8 8a CMP $8ab8 ; (cwd + 25)
7058 : d0 06 __ BNE $7060 ; (printElementPriv.s3 + 0)
.s1:
705a : ad ce 82 LDA $82ce ; (mc_pd_select + 0)
705d : 8d 96 87 STA $8796 ; (vdc_state + 7)
.s3:
7060 : a0 ff __ LDY #$ff
.l1002:
7062 : c8 __ __ INY
7063 : b1 53 __ LDA (T1 + 0),y 
7065 : 99 90 88 STA $8890,y ; (linebuffer + 0)
7068 : d0 f8 __ BNE $7062 ; (printElementPriv.l1002 + 0)
.s1003:
706a : a9 90 __ LDA #$90
706c : a0 08 __ LDY #$08
706e : 91 23 __ STA (SP + 0),y 
7070 : a9 88 __ LDA #$88
7072 : c8 __ __ INY
7073 : 91 23 __ STA (SP + 0),y 
7075 : a9 00 __ LDA #$00
7077 : a0 02 __ LDY #$02
7079 : 91 23 __ STA (SP + 0),y 
707b : a9 8b __ LDA #$8b
707d : c8 __ __ INY
707e : 91 23 __ STA (SP + 0),y 
7080 : a0 11 __ LDY #$11
7082 : b1 53 __ LDA (T1 + 0),y 
7084 : 85 1b __ STA ACCU + 0 
7086 : c8 __ __ INY
7087 : b1 53 __ LDA (T1 + 0),y 
7089 : a0 07 __ LDY #$07
708b : 91 23 __ STA (SP + 0),y 
708d : aa __ __ TAX
708e : a5 1b __ LDA ACCU + 0 
7090 : 88 __ __ DEY
7091 : 91 23 __ STA (SP + 0),y 
7093 : e0 27 __ CPX #$27
7095 : d0 02 __ BNE $7099 ; (printElementPriv.s1010 + 0)
.s1009:
7097 : c9 10 __ CMP #$10
.s1010:
7099 : b0 06 __ BCS $70a1 ; (printElementPriv.s10 + 0)
.s9:
709b : a9 71 __ LDA #$71
709d : a2 51 __ LDX #$51
709f : 90 04 __ BCC $70a5 ; (printElementPriv.s11 + 0)
.s10:
70a1 : a9 71 __ LDA #$71
70a3 : a2 5c __ LDX #$5c
.s11:
70a5 : 85 54 __ STA T1 + 1 
70a7 : 8a __ __ TXA
70a8 : a0 04 __ LDY #$04
70aa : 91 23 __ STA (SP + 0),y 
70ac : a5 54 __ LDA T1 + 1 
70ae : c8 __ __ INY
70af : 91 23 __ STA (SP + 0),y 
70b1 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
70b4 : a9 00 __ LDA #$00
70b6 : a0 04 __ LDY #$04
70b8 : 91 23 __ STA (SP + 0),y 
70ba : a9 8b __ LDA #$8b
70bc : c8 __ __ INY
70bd : 91 23 __ STA (SP + 0),y 
70bf : a9 b3 __ LDA #$b3
70c1 : a0 02 __ LDY #$02
70c3 : 91 23 __ STA (SP + 0),y 
70c5 : a9 87 __ LDA #$87
70c7 : c8 __ __ INY
70c8 : 91 23 __ STA (SP + 0),y 
70ca : 20 7e 6e JSR $6e7e ; (vdcwin_put_string.s1000 + 0)
70cd : ad c7 8a LDA $8ac7 ; (current + 0)
70d0 : 85 55 __ STA T3 + 0 
70d2 : ad c8 8a LDA $8ac8 ; (current + 1)
70d5 : 85 56 __ STA T3 + 1 
70d7 : a0 13 __ LDY #$13
70d9 : b1 55 __ LDA (T3 + 0),y 
70db : 20 21 19 JSR $1921 ; (fileTypeToStr.s1000 + 0)
70de : a0 ff __ LDY #$ff
.l1004:
70e0 : c8 __ __ INY
70e1 : b1 1b __ LDA (ACCU + 0),y 
70e3 : 99 00 8b STA $8b00,y ; (linebuffer2 + 0)
70e6 : d0 f8 __ BNE $70e0 ; (printElementPriv.l1004 + 0)
.s1005:
70e8 : a0 12 __ LDY #$12
70ea : b1 55 __ LDA (T3 + 0),y 
70ec : c9 27 __ CMP #$27
70ee : d0 05 __ BNE $70f5 ; (printElementPriv.s1008 + 0)
.s1007:
70f0 : 88 __ __ DEY
70f1 : b1 55 __ LDA (T3 + 0),y 
70f3 : c9 10 __ CMP #$10
.s1008:
70f5 : 90 26 __ BCC $711d ; (printElementPriv.s7 + 0)
.s8:
70f7 : a5 55 __ LDA T3 + 0 
70f9 : 85 0d __ STA P0 
70fb : a5 56 __ LDA T3 + 1 
70fd : 85 0e __ STA P1 
70ff : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
7102 : a5 1c __ LDA ACCU + 1 
7104 : d0 17 __ BNE $711d ; (printElementPriv.s7 + 0)
.s1006:
7106 : a5 1b __ LDA ACCU + 0 
7108 : c9 10 __ CMP #$10
710a : d0 11 __ BNE $711d ; (printElementPriv.s7 + 0)
.s5:
710c : ad 01 8b LDA $8b01 ; (linebuffer2 + 1)
710f : 8d 00 8b STA $8b00 ; (linebuffer2 + 0)
7112 : ad 02 8b LDA $8b02 ; (linebuffer2 + 2)
7115 : 8d 01 8b STA $8b01 ; (linebuffer2 + 1)
7118 : a9 00 __ LDA #$00
711a : 8d 02 8b STA $8b02 ; (linebuffer2 + 2)
.s7:
711d : a9 b3 __ LDA #$b3
711f : a0 02 __ LDY #$02
7121 : 91 23 __ STA (SP + 0),y 
7123 : a9 87 __ LDA #$87
7125 : c8 __ __ INY
7126 : 91 23 __ STA (SP + 0),y 
7128 : a9 00 __ LDA #$00
712a : c8 __ __ INY
712b : 91 23 __ STA (SP + 0),y 
712d : a9 8b __ LDA #$8b
712f : c8 __ __ INY
7130 : 91 23 __ STA (SP + 0),y 
7132 : 20 7e 6e JSR $6e7e ; (vdcwin_put_string.s1000 + 0)
7135 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
7138 : 8d 96 87 STA $8796 ; (vdc_state + 7)
.s1001:
713b : 18 __ __ CLC
713c : a5 23 __ LDA SP + 0 
713e : 69 0a __ ADC #$0a
7140 : 85 23 __ STA SP + 0 
7142 : 90 02 __ BCC $7146 ; (printElementPriv.s1001 + 11)
7144 : e6 24 __ INC SP + 1 
7146 : a2 03 __ LDX #$03
7148 : bd d1 ab LDA $abd1,x ; (buff + 44)
714b : 95 53 __ STA T1 + 0,x 
714d : ca __ __ DEX
714e : 10 f8 __ BPL $7148 ; (printElementPriv.s1001 + 13)
7150 : 60 __ __ RTS
--------------------------------------------------------------------
7151 : __ __ __ BYT 25 34 55 20 25 2d 31 36 53 20 00                : %4U %-16S .
--------------------------------------------------------------------
715c : __ __ __ BYT 25 55 20 25 2d 31 35 53 20 00                   : %U %-15S .
--------------------------------------------------------------------
7166 : __ __ __ BYT 73 65 71 00                                     : seq.
--------------------------------------------------------------------
716a : __ __ __ BYT 70 72 67 00                                     : prg.
--------------------------------------------------------------------
716e : __ __ __ BYT 75 72 73 00                                     : urs.
--------------------------------------------------------------------
7172 : __ __ __ BYT 72 65 6c 00                                     : rel.
--------------------------------------------------------------------
7176 : __ __ __ BYT 76 72 70 00                                     : vrp.
--------------------------------------------------------------------
717a : __ __ __ BYT 64 65 6c 00                                     : del.
--------------------------------------------------------------------
717e : __ __ __ BYT 63 62 6d 00                                     : cbm.
--------------------------------------------------------------------
7182 : __ __ __ BYT 64 69 72 00                                     : dir.
--------------------------------------------------------------------
7186 : __ __ __ BYT 6c 6e 6b 00                                     : lnk.
--------------------------------------------------------------------
718a : __ __ __ BYT 6f 74 68 00                                     : oth.
--------------------------------------------------------------------
718e : __ __ __ BYT 68 64 72 00                                     : hdr.
--------------------------------------------------------------------
7192 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 : 0123456789ABCDEF
71a2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
71a3 : __ __ __ BYT 6e 4f 20 56 41 4c 49 44 20 44 49 52 45 43 54 4f : nO VALID DIRECTO
71b3 : __ __ __ BYT 52 59 20 45 4e 54 52 49 45 53 20 46 4f 55 4e 44 : RY ENTRIES FOUND
71c3 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
71c5 : __ __ __ BYT 20 66 31 20 64 49 52 20 52 45 46 52 2e 00       :  f1 dIR REFR..
--------------------------------------------------------------------
71d3 : __ __ __ BYT 2b 2f 2d 20 64 45 56 49 43 45 00                : +/- dEVICE.
--------------------------------------------------------------------
71de : __ __ __ BYT 72 65 74 20 73 45 4c 45 43 54 00                : ret sELECT.
--------------------------------------------------------------------
71e9 : __ __ __ BYT 20 20 74 20 74 4f 50 00                         :   t tOP.
--------------------------------------------------------------------
71f1 : __ __ __ BYT 20 20 65 20 65 4e 44 00                         :   e eND.
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->void
.s0:
71f9 : 4c d2 ff JMP $ffd2 
--------------------------------------------------------------------
__multab13L:
71fc : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
7200 : __ __ __ BYT 70 2f 75 20 70 41 47 45 20 55 50 2f 44 4f 00    : p/u pAGE UP/DO.
--------------------------------------------------------------------
720f : __ __ __ BYT 63 55 52 20 6e 41 56 49 47 41 54 45 00          : cUR nAVIGATE.
--------------------------------------------------------------------
721c : __ __ __ BYT 65 73 63 20 63 41 4e 43 45 4c 00                : esc cANCEL.
--------------------------------------------------------------------
import_dialogue: ; import_dialogue(u8,const u8*)->u8
.s1000:
7227 : a2 11 __ LDX #$11
7229 : b5 53 __ LDA T0 + 0,x 
722b : 9d b4 ab STA $abb4,x ; (projbuffer + 28)
722e : ca __ __ DEX
722f : 10 f8 __ BPL $7229 ; (import_dialogue.s1000 + 2)
7231 : 38 __ __ SEC
7232 : a5 23 __ LDA SP + 0 ; (mode + 0)
7234 : e9 08 __ SBC #$08
7236 : 85 23 __ STA SP + 0 ; (mode + 0)
7238 : b0 02 __ BCS $723c ; (import_dialogue.s0 + 0)
723a : c6 24 __ DEC SP + 1 ; (message + 0)
.s0:
723c : a9 00 __ LDA #$00
723e : a2 13 __ LDX #$13
.l1002:
7240 : ca __ __ DEX
7241 : 9d cd 8a STA $8acd,x ; (importvars + 0)
7244 : d0 fa __ BNE $7240 ; (import_dialogue.l1002 + 0)
.s1003:
7246 : a9 30 __ LDA #$30
7248 : 8d dd 8a STA $8add ; (importvars + 16)
724b : a9 00 __ LDA #$00
724d : 8d de 8a STA $8ade ; (importvars + 17)
7250 : ad af 87 LDA $87af ; (canvas + 7)
7253 : 18 __ __ CLC
7254 : 6d eb 86 ADC $86eb ; (screen_col + 0)
7257 : 8d cd 8a STA $8acd ; (importvars + 0)
725a : ad b0 87 LDA $87b0 ; (canvas + 8)
725d : 6d ec 86 ADC $86ec ; (screen_col + 1)
7260 : 8d ce 8a STA $8ace ; (importvars + 1)
7263 : ad b1 87 LDA $87b1 ; (canvas + 9)
7266 : 18 __ __ CLC
7267 : 6d ed 86 ADC $86ed ; (screen_row + 0)
726a : 8d cf 8a STA $8acf ; (importvars + 2)
726d : ad b2 87 LDA $87b2 ; (canvas + 10)
7270 : 6d ee 86 ADC $86ee ; (screen_row + 1)
7273 : 8d d0 8a STA $8ad0 ; (importvars + 3)
7276 : ad fd ab LDA $abfd ; (sstack + 10)
7279 : 8d fc ab STA $abfc ; (sstack + 9)
727c : 20 b4 64 JSR $64b4 ; (filepicker.s1000 + 0)
727f : a5 1b __ LDA ACCU + 0 
7281 : d0 16 __ BNE $7299 ; (import_dialogue.s3 + 0)
.s1001:
7283 : 18 __ __ CLC
7284 : a5 23 __ LDA SP + 0 ; (mode + 0)
7286 : 69 08 __ ADC #$08
7288 : 85 23 __ STA SP + 0 ; (mode + 0)
728a : 90 02 __ BCC $728e ; (import_dialogue.s1001 + 11)
728c : e6 24 __ INC SP + 1 ; (message + 0)
728e : a2 11 __ LDX #$11
7290 : bd b4 ab LDA $abb4,x ; (projbuffer + 28)
7293 : 95 53 __ STA T0 + 0,x 
7295 : ca __ __ DEX
7296 : 10 f8 __ BPL $7290 ; (import_dialogue.s1001 + 13)
7298 : 60 __ __ RTS
.s3:
7299 : a9 00 __ LDA #$00
729b : 85 17 __ STA P10 
729d : a9 14 __ LDA #$14
729f : 85 18 __ STA P11 
72a1 : a9 05 __ LDA #$05
72a3 : 8d f3 ab STA $abf3 ; (sstack + 0)
72a6 : a9 28 __ LDA #$28
72a8 : 8d f4 ab STA $abf4 ; (sstack + 1)
72ab : a9 0e __ LDA #$0e
72ad : 8d f5 ab STA $abf5 ; (sstack + 2)
72b0 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
72b3 : 8d 96 87 STA $8796 ; (vdc_state + 7)
72b6 : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
72b9 : a9 01 __ LDA #$01
72bb : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
72be : ad fe ab LDA $abfe ; (sstack + 11)
72c1 : 85 13 __ STA P6 
72c3 : ad ff ab LDA $abff ; (sstack + 12)
72c6 : 85 14 __ STA P7 
72c8 : 20 04 81 JSR $8104 ; (vdc_prints_attr@proxy + 0)
72cb : a9 00 __ LDA #$00
72cd : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
72d0 : a9 08 __ LDA #$08
72d2 : 85 12 __ STA P5 
72d4 : a9 00 __ LDA #$00
72d6 : 85 13 __ STA P6 
72d8 : a9 7b __ LDA #$7b
72da : 85 14 __ STA P7 
72dc : ad 96 87 LDA $8796 ; (vdc_state + 7)
72df : 85 57 __ STA T2 + 0 
72e1 : 85 15 __ STA P8 
72e3 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
72e6 : a9 00 __ LDA #$00
72e8 : a0 02 __ LDY #$02
72ea : 91 23 __ STA (SP + 0),y ; (mode + 0)
72ec : a9 89 __ LDA #$89
72ee : c8 __ __ INY
72ef : 91 23 __ STA (SP + 0),y ; (mode + 0)
72f1 : a9 fd __ LDA #$fd
72f3 : c8 __ __ INY
72f4 : 91 23 __ STA (SP + 0),y ; (mode + 0)
72f6 : a9 61 __ LDA #$61
72f8 : c8 __ __ INY
72f9 : 91 23 __ STA (SP + 0),y ; (mode + 0)
72fb : ad ab 87 LDA $87ab ; (canvas + 3)
72fe : c8 __ __ INY
72ff : 91 23 __ STA (SP + 0),y ; (mode + 0)
7301 : ad ac 87 LDA $87ac ; (canvas + 4)
7304 : c8 __ __ INY
7305 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7307 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
730a : a9 15 __ LDA #$15
730c : 85 16 __ STA P9 
730e : a9 09 __ LDA #$09
7310 : 85 17 __ STA P10 
7312 : a9 00 __ LDA #$00
7314 : 8d f3 ab STA $abf3 ; (sstack + 0)
7317 : a9 89 __ LDA #$89
7319 : 8d f4 ab STA $abf4 ; (sstack + 1)
731c : a9 03 __ LDA #$03
731e : 8d f5 ab STA $abf5 ; (sstack + 2)
7321 : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
7324 : 20 66 4e JSR $4e66 ; (strtol@proxy + 0)
7327 : a5 1b __ LDA ACCU + 0 
7329 : 8d d1 8a STA $8ad1 ; (importvars + 4)
732c : a5 1c __ LDA ACCU + 1 
732e : 8d d2 8a STA $8ad2 ; (importvars + 5)
7331 : a9 0a __ LDA #$0a
7333 : 85 12 __ STA P5 
7335 : a9 14 __ LDA #$14
7337 : 85 13 __ STA P6 
7339 : a9 7b __ LDA #$7b
733b : 85 14 __ STA P7 
733d : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
7340 : a9 00 __ LDA #$00
7342 : a0 02 __ LDY #$02
7344 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7346 : a9 89 __ LDA #$89
7348 : c8 __ __ INY
7349 : 91 23 __ STA (SP + 0),y ; (mode + 0)
734b : a9 fd __ LDA #$fd
734d : c8 __ __ INY
734e : 91 23 __ STA (SP + 0),y ; (mode + 0)
7350 : a9 61 __ LDA #$61
7352 : c8 __ __ INY
7353 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7355 : ad ad 87 LDA $87ad ; (canvas + 5)
7358 : c8 __ __ INY
7359 : 91 23 __ STA (SP + 0),y ; (mode + 0)
735b : ad ae 87 LDA $87ae ; (canvas + 6)
735e : c8 __ __ INY
735f : 91 23 __ STA (SP + 0),y ; (mode + 0)
7361 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
7364 : a9 15 __ LDA #$15
7366 : 85 16 __ STA P9 
7368 : a9 0b __ LDA #$0b
736a : 85 17 __ STA P10 
736c : a9 00 __ LDA #$00
736e : 8d f3 ab STA $abf3 ; (sstack + 0)
7371 : a9 89 __ LDA #$89
7373 : 8d f4 ab STA $abf4 ; (sstack + 1)
7376 : a9 03 __ LDA #$03
7378 : 8d f5 ab STA $abf5 ; (sstack + 2)
737b : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
737e : 20 66 4e JSR $4e66 ; (strtol@proxy + 0)
7381 : a5 1b __ LDA ACCU + 0 
7383 : 8d d3 8a STA $8ad3 ; (importvars + 6)
7386 : a5 1c __ LDA ACCU + 1 
7388 : 8d d4 8a STA $8ad4 ; (importvars + 7)
738b : a9 0c __ LDA #$0c
738d : 85 12 __ STA P5 
738f : a9 29 __ LDA #$29
7391 : 85 13 __ STA P6 
7393 : a9 7b __ LDA #$7b
7395 : 85 14 __ STA P7 
7397 : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
739a : a9 00 __ LDA #$00
739c : a0 02 __ LDY #$02
739e : 91 23 __ STA (SP + 0),y ; (mode + 0)
73a0 : a9 89 __ LDA #$89
73a2 : c8 __ __ INY
73a3 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73a5 : a9 fd __ LDA #$fd
73a7 : c8 __ __ INY
73a8 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73aa : a9 61 __ LDA #$61
73ac : c8 __ __ INY
73ad : 91 23 __ STA (SP + 0),y ; (mode + 0)
73af : ad cd 8a LDA $8acd ; (importvars + 0)
73b2 : c8 __ __ INY
73b3 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73b5 : ad ce 8a LDA $8ace ; (importvars + 1)
73b8 : c8 __ __ INY
73b9 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73bb : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
73be : a9 15 __ LDA #$15
73c0 : 85 16 __ STA P9 
73c2 : a9 0d __ LDA #$0d
73c4 : 85 17 __ STA P10 
73c6 : a9 00 __ LDA #$00
73c8 : 8d f3 ab STA $abf3 ; (sstack + 0)
73cb : a9 89 __ LDA #$89
73cd : 8d f4 ab STA $abf4 ; (sstack + 1)
73d0 : a9 03 __ LDA #$03
73d2 : 8d f5 ab STA $abf5 ; (sstack + 2)
73d5 : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
73d8 : 20 66 4e JSR $4e66 ; (strtol@proxy + 0)
73db : a5 1b __ LDA ACCU + 0 
73dd : 8d cd 8a STA $8acd ; (importvars + 0)
73e0 : a5 1c __ LDA ACCU + 1 
73e2 : 8d ce 8a STA $8ace ; (importvars + 1)
73e5 : a9 0e __ LDA #$0e
73e7 : 85 12 __ STA P5 
73e9 : a9 3f __ LDA #$3f
73eb : 85 13 __ STA P6 
73ed : a9 7b __ LDA #$7b
73ef : 85 14 __ STA P7 
73f1 : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
73f4 : a9 00 __ LDA #$00
73f6 : a0 02 __ LDY #$02
73f8 : 91 23 __ STA (SP + 0),y ; (mode + 0)
73fa : a9 89 __ LDA #$89
73fc : c8 __ __ INY
73fd : 91 23 __ STA (SP + 0),y ; (mode + 0)
73ff : a9 fd __ LDA #$fd
7401 : c8 __ __ INY
7402 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7404 : a9 61 __ LDA #$61
7406 : c8 __ __ INY
7407 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7409 : ad cf 8a LDA $8acf ; (importvars + 2)
740c : c8 __ __ INY
740d : 91 23 __ STA (SP + 0),y ; (mode + 0)
740f : ad d0 8a LDA $8ad0 ; (importvars + 3)
7412 : c8 __ __ INY
7413 : 91 23 __ STA (SP + 0),y ; (mode + 0)
7415 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
7418 : a9 15 __ LDA #$15
741a : 85 16 __ STA P9 
741c : a9 0f __ LDA #$0f
741e : 85 17 __ STA P10 
7420 : a9 00 __ LDA #$00
7422 : 8d f3 ab STA $abf3 ; (sstack + 0)
7425 : a9 89 __ LDA #$89
7427 : 8d f4 ab STA $abf4 ; (sstack + 1)
742a : a9 03 __ LDA #$03
742c : 8d f5 ab STA $abf5 ; (sstack + 2)
742f : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
7432 : 20 66 4e JSR $4e66 ; (strtol@proxy + 0)
7435 : a5 1b __ LDA ACCU + 0 
7437 : 8d cf 8a STA $8acf ; (importvars + 2)
743a : a5 1c __ LDA ACCU + 1 
743c : 8d d0 8a STA $8ad0 ; (importvars + 3)
743f : ad d1 8a LDA $8ad1 ; (importvars + 4)
7442 : 18 __ __ CLC
7443 : 6d cd 8a ADC $8acd ; (importvars + 0)
7446 : 85 53 __ STA T0 + 0 
7448 : 85 03 __ STA WORK + 0 
744a : ad d2 8a LDA $8ad2 ; (importvars + 5)
744d : 6d ce 8a ADC $8ace ; (importvars + 1)
7450 : 85 54 __ STA T0 + 1 
7452 : 85 04 __ STA WORK + 1 
7454 : ad d3 8a LDA $8ad3 ; (importvars + 6)
7457 : 18 __ __ CLC
7458 : 65 1b __ ADC ACCU + 0 
745a : 85 55 __ STA T1 + 0 
745c : 85 1b __ STA ACCU + 0 
745e : ad d4 8a LDA $8ad4 ; (importvars + 7)
7461 : 65 1c __ ADC ACCU + 1 
7463 : 85 56 __ STA T1 + 1 
7465 : 85 1c __ STA ACCU + 1 
7467 : 20 62 7c JSR $7c62 ; (mul16 + 0)
746a : a5 05 __ LDA WORK + 2 
746c : 0a __ __ ASL
746d : aa __ __ TAX
746e : a5 06 __ LDA WORK + 3 
7470 : 2a __ __ ROL
7471 : a8 __ __ TAY
7472 : 8a __ __ TXA
7473 : 18 __ __ CLC
7474 : 69 30 __ ADC #$30
7476 : 85 58 __ STA T4 + 0 
7478 : 90 01 __ BCC $747b ; (import_dialogue.s1035 + 0)
.s1034:
747a : c8 __ __ INY
.s1035:
747b : 84 59 __ STY T4 + 1 
747d : a9 77 __ LDA #$77
747f : c5 59 __ CMP T4 + 1 
7481 : d0 04 __ BNE $7487 ; (import_dialogue.s1031 + 0)
.s1030:
7483 : a9 ff __ LDA #$ff
7485 : c5 58 __ CMP T4 + 0 
.s1031:
7487 : b0 1a __ BCS $74a3 ; (import_dialogue.s11 + 0)
.s10:
7489 : a9 10 __ LDA #$10
748b : 85 12 __ STA P5 
748d : a9 55 __ LDA #$55
748f : 85 13 __ STA P6 
7491 : a9 7b __ LDA #$7b
7493 : 85 14 __ STA P7 
7495 : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
7498 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
749b : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
749e : a9 00 __ LDA #$00
74a0 : 4c ec 76 JMP $76ec ; (import_dialogue.s1032 + 0)
.s11:
74a3 : ad ac 87 LDA $87ac ; (canvas + 4)
74a6 : c5 54 __ CMP T0 + 1 
74a8 : d0 05 __ BNE $74af ; (import_dialogue.s1029 + 0)
.s1028:
74aa : ad ab 87 LDA $87ab ; (canvas + 3)
74ad : c5 53 __ CMP T0 + 0 
.s1029:
74af : b0 31 __ BCS $74e2 ; (import_dialogue.s17 + 0)
.s15:
74b1 : ad ad 87 LDA $87ad ; (canvas + 5)
74b4 : 0d ae 87 ORA $87ae ; (canvas + 6)
74b7 : f0 09 __ BEQ $74c2 ; (import_dialogue.s21 + 0)
.s84:
74b9 : a9 00 __ LDA #$00
74bb : 85 58 __ STA T4 + 0 
74bd : 85 59 __ STA T4 + 1 
74bf : 4c 85 79 JMP $7985 ; (import_dialogue.l19 + 0)
.s21:
74c2 : ad ad 87 LDA $87ad ; (canvas + 5)
74c5 : 0d ae 87 ORA $87ae ; (canvas + 6)
74c8 : f0 03 __ BEQ $74cd ; (import_dialogue.s31 + 0)
74ca : 4c 98 78 JMP $7898 ; (import_dialogue.s83 + 0)
.s31:
74cd : a5 53 __ LDA T0 + 0 
74cf : 8d ab 87 STA $87ab ; (canvas + 3)
74d2 : a5 54 __ LDA T0 + 1 
74d4 : 8d ac 87 STA $87ac ; (canvas + 4)
74d7 : a9 00 __ LDA #$00
74d9 : 8d af 87 STA $87af ; (canvas + 7)
74dc : 8d b0 87 STA $87b0 ; (canvas + 8)
74df : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
.s17:
74e2 : ad ae 87 LDA $87ae ; (canvas + 6)
74e5 : c5 56 __ CMP T1 + 1 
74e7 : d0 05 __ BNE $74ee ; (import_dialogue.s1023 + 0)
.s1022:
74e9 : ad ad 87 LDA $87ad ; (canvas + 5)
74ec : c5 55 __ CMP T1 + 0 
.s1023:
74ee : b0 03 __ BCS $74f3 ; (import_dialogue.s40 + 0)
74f0 : 4c 03 77 JMP $7703 ; (import_dialogue.s38 + 0)
.s40:
74f3 : 20 e8 81 JSR $81e8 ; (vdc_clear@proxy + 0)
74f6 : ad fd ab LDA $abfd ; (sstack + 10)
74f9 : 85 5a __ STA T5 + 0 
74fb : f0 03 __ BEQ $7500 ; (import_dialogue.s53 + 0)
74fd : 4c f1 76 JMP $76f1 ; (import_dialogue.s55 + 0)
.s53:
7500 : a9 08 __ LDA #$08
7502 : 85 12 __ STA P5 
7504 : a9 76 __ LDA #$76
7506 : 85 13 __ STA P6 
7508 : a9 7b __ LDA #$7b
750a : 85 14 __ STA P7 
750c : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
750f : a9 19 __ LDA #$19
7511 : 8d f8 ab STA $abf8 ; (sstack + 5)
7514 : a9 09 __ LDA #$09
7516 : 8d f9 ab STA $abf9 ; (sstack + 6)
7519 : a9 07 __ LDA #$07
751b : 8d fa ab STA $abfa ; (sstack + 7)
751e : a9 00 __ LDA #$00
7520 : 8d fb ab STA $abfb ; (sstack + 8)
7523 : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
7526 : a5 1b __ LDA ACCU + 0 
7528 : 8d db 8a STA $8adb ; (importvars + 14)
752b : 0a __ __ ASL
752c : 0a __ __ ASL
752d : 0a __ __ ASL
752e : 0a __ __ ASL
752f : 18 __ __ CLC
7530 : 69 68 __ ADC #$68
7532 : 85 13 __ STA P6 
7534 : a9 86 __ LDA #$86
7536 : 69 00 __ ADC #$00
7538 : 85 14 __ STA P7 
753a : a9 09 __ LDA #$09
753c : 85 12 __ STA P5 
753e : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
7541 : e6 12 __ INC P5 
7543 : a9 9d __ LDA #$9d
7545 : 85 13 __ STA P6 
7547 : a9 7b __ LDA #$7b
7549 : 85 14 __ STA P7 
754b : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
754e : a9 19 __ LDA #$19
7550 : 8d f8 ab STA $abf8 ; (sstack + 5)
7553 : a9 0b __ LDA #$0b
7555 : 8d f9 ab STA $abf9 ; (sstack + 6)
7558 : a9 06 __ LDA #$06
755a : 8d fa ab STA $abfa ; (sstack + 7)
755d : a9 00 __ LDA #$00
755f : 8d fb ab STA $abfb ; (sstack + 8)
7562 : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
7565 : a5 1b __ LDA ACCU + 0 
7567 : 8d d9 8a STA $8ad9 ; (importvars + 12)
756a : 0a __ __ ASL
756b : 0a __ __ ASL
756c : 0a __ __ ASL
756d : 0a __ __ ASL
756e : 18 __ __ CLC
756f : 69 08 __ ADC #$08
7571 : 85 13 __ STA P6 
7573 : a9 86 __ LDA #$86
7575 : 69 00 __ ADC #$00
7577 : 85 14 __ STA P7 
7579 : a9 0b __ LDA #$0b
757b : 85 12 __ STA P5 
757d : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
7580 : a9 0c __ LDA #$0c
7582 : 85 63 __ STA T11 + 0 
7584 : a5 5a __ LDA T5 + 0 
7586 : c9 02 __ CMP #$02
7588 : d0 4d __ BNE $75d7 ; (import_dialogue.s161 + 0)
.s125:
758a : a9 0d __ LDA #$0d
.s60:
758c : 85 64 __ STA T12 + 0 
758e : a9 15 __ LDA #$15
7590 : 85 11 __ STA P4 
7592 : a5 63 __ LDA T11 + 0 
7594 : 85 12 __ STA P5 
7596 : 09 02 __ ORA #$02
7598 : 85 63 __ STA T11 + 0 
759a : a9 ba __ LDA #$ba
759c : 85 13 __ STA P6 
759e : a9 7b __ LDA #$7b
75a0 : 85 14 __ STA P7 
75a2 : 20 ee 80 JSR $80ee ; (vdc_prints_attr@proxy + 0)
75a5 : a9 19 __ LDA #$19
75a7 : 8d f8 ab STA $abf8 ; (sstack + 5)
75aa : a5 64 __ LDA T12 + 0 
75ac : 8d f9 ab STA $abf9 ; (sstack + 6)
75af : a9 07 __ LDA #$07
75b1 : 8d fa ab STA $abfa ; (sstack + 7)
75b4 : a9 00 __ LDA #$00
75b6 : 8d fb ab STA $abfb ; (sstack + 8)
75b9 : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
75bc : a5 1b __ LDA ACCU + 0 
75be : 8d df 8a STA $8adf ; (importvars + 18)
75c1 : 0a __ __ ASL
75c2 : 0a __ __ ASL
75c3 : 0a __ __ ASL
75c4 : 0a __ __ ASL
75c5 : 18 __ __ CLC
75c6 : 69 68 __ ADC #$68
75c8 : 85 13 __ STA P6 
75ca : a9 86 __ LDA #$86
75cc : 69 00 __ ADC #$00
75ce : 85 14 __ STA P7 
75d0 : a5 64 __ LDA T12 + 0 
75d2 : 85 12 __ STA P5 
75d4 : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
.s161:
75d7 : ad d9 8a LDA $8ad9 ; (importvars + 12)
75da : c9 02 __ CMP #$02
75dc : d0 06 __ BNE $75e4 ; (import_dialogue.s65 + 0)
.s68:
75de : a5 5a __ LDA T5 + 0 
75e0 : c9 02 __ CMP #$02
75e2 : d0 4b __ BNE $762f ; (import_dialogue.s162 + 0)
.s65:
75e4 : a9 15 __ LDA #$15
75e6 : 85 11 __ STA P4 
75e8 : a5 63 __ LDA T11 + 0 
75ea : 85 12 __ STA P5 
75ec : 18 __ __ CLC
75ed : 69 02 __ ADC #$02
75ef : 85 63 __ STA T11 + 0 
75f1 : a9 ce __ LDA #$ce
75f3 : 85 13 __ STA P6 
75f5 : a9 7b __ LDA #$7b
75f7 : 85 14 __ STA P7 
75f9 : 20 ee 80 JSR $80ee ; (vdc_prints_attr@proxy + 0)
75fc : a9 19 __ LDA #$19
75fe : 8d f8 ab STA $abf8 ; (sstack + 5)
7601 : a9 07 __ LDA #$07
7603 : 8d fa ab STA $abfa ; (sstack + 7)
7606 : a9 00 __ LDA #$00
7608 : 8d fb ab STA $abfb ; (sstack + 8)
760b : 18 __ __ CLC
760c : a5 12 __ LDA P5 
760e : 69 01 __ ADC #$01
7610 : 85 5a __ STA T5 + 0 
7612 : 8d f9 ab STA $abf9 ; (sstack + 6)
7615 : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
7618 : a5 1b __ LDA ACCU + 0 
761a : 8d da 8a STA $8ada ; (importvars + 13)
761d : 0a __ __ ASL
761e : 0a __ __ ASL
761f : 0a __ __ ASL
7620 : 0a __ __ ASL
7621 : 18 __ __ CLC
7622 : 69 68 __ ADC #$68
7624 : 85 13 __ STA P6 
7626 : a9 86 __ LDA #$86
7628 : 69 00 __ ADC #$00
762a : 85 14 __ STA P7 
762c : 20 f5 80 JSR $80f5 ; (vdc_prints_attr@proxy + 0)
.s162:
762f : ad d9 8a LDA $8ad9 ; (importvars + 12)
7632 : c9 02 __ CMP #$02
7634 : f0 07 __ BEQ $763d ; (import_dialogue.s71 + 0)
.s74:
7636 : ad da 8a LDA $8ada ; (importvars + 13)
7639 : c9 01 __ CMP #$01
763b : d0 4b __ BNE $7688 ; (import_dialogue.s163 + 0)
.s71:
763d : a9 15 __ LDA #$15
763f : 85 11 __ STA P4 
7641 : a5 63 __ LDA T11 + 0 
7643 : 85 12 __ STA P5 
7645 : 18 __ __ CLC
7646 : 69 02 __ ADC #$02
7648 : 85 63 __ STA T11 + 0 
764a : a9 e3 __ LDA #$e3
764c : 85 13 __ STA P6 
764e : a9 7b __ LDA #$7b
7650 : 85 14 __ STA P7 
7652 : 20 ee 80 JSR $80ee ; (vdc_prints_attr@proxy + 0)
7655 : a9 19 __ LDA #$19
7657 : 8d f8 ab STA $abf8 ; (sstack + 5)
765a : a9 07 __ LDA #$07
765c : 8d fa ab STA $abfa ; (sstack + 7)
765f : a9 00 __ LDA #$00
7661 : 8d fb ab STA $abfb ; (sstack + 8)
7664 : 18 __ __ CLC
7665 : a5 12 __ LDA P5 
7667 : 69 01 __ ADC #$01
7669 : 85 5a __ STA T5 + 0 
766b : 8d f9 ab STA $abf9 ; (sstack + 6)
766e : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
7671 : a5 1b __ LDA ACCU + 0 
7673 : 8d dc 8a STA $8adc ; (importvars + 15)
7676 : 0a __ __ ASL
7677 : 0a __ __ ASL
7678 : 0a __ __ ASL
7679 : 0a __ __ ASL
767a : 18 __ __ CLC
767b : 69 68 __ ADC #$68
767d : 85 13 __ STA P6 
767f : a9 86 __ LDA #$86
7681 : 69 00 __ ADC #$00
7683 : 85 14 __ STA P7 
7685 : 20 f5 80 JSR $80f5 ; (vdc_prints_attr@proxy + 0)
.s163:
7688 : ad d9 8a LDA $8ad9 ; (importvars + 12)
768b : c9 01 __ CMP #$01
768d : d0 5b __ BNE $76ea ; (import_dialogue.s1033 + 0)
.s77:
768f : a5 63 __ LDA T11 + 0 
7691 : 85 12 __ STA P5 
7693 : a9 00 __ LDA #$00
7695 : 85 13 __ STA P6 
7697 : a9 7c __ LDA #$7c
7699 : 85 14 __ STA P7 
769b : 20 e3 80 JSR $80e3 ; (vdc_prints_attr@proxy + 0)
769e : a9 00 __ LDA #$00
76a0 : a0 02 __ LDY #$02
76a2 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76a4 : a9 89 __ LDA #$89
76a6 : c8 __ __ INY
76a7 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76a9 : a9 fd __ LDA #$fd
76ab : c8 __ __ INY
76ac : 91 23 __ STA (SP + 0),y ; (mode + 0)
76ae : a9 61 __ LDA #$61
76b0 : c8 __ __ INY
76b1 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76b3 : ad dd 8a LDA $8add ; (importvars + 16)
76b6 : c8 __ __ INY
76b7 : 91 23 __ STA (SP + 0),y ; (mode + 0)
76b9 : ad de 8a LDA $8ade ; (importvars + 17)
76bc : c8 __ __ INY
76bd : 91 23 __ STA (SP + 0),y ; (mode + 0)
76bf : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
76c2 : a9 15 __ LDA #$15
76c4 : 85 16 __ STA P9 
76c6 : a9 00 __ LDA #$00
76c8 : 8d f3 ab STA $abf3 ; (sstack + 0)
76cb : a9 89 __ LDA #$89
76cd : 8d f4 ab STA $abf4 ; (sstack + 1)
76d0 : a9 06 __ LDA #$06
76d2 : 8d f5 ab STA $abf5 ; (sstack + 2)
76d5 : a6 63 __ LDX T11 + 0 
76d7 : e8 __ __ INX
76d8 : 86 17 __ STX P10 
76da : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
76dd : 20 66 4e JSR $4e66 ; (strtol@proxy + 0)
76e0 : a5 1b __ LDA ACCU + 0 
76e2 : 8d dd 8a STA $8add ; (importvars + 16)
76e5 : a5 1c __ LDA ACCU + 1 
76e7 : 8d de 8a STA $8ade ; (importvars + 17)
.s1033:
76ea : a9 01 __ LDA #$01
.s1032:
76ec : 85 1b __ STA ACCU + 0 
76ee : 4c 83 72 JMP $7283 ; (import_dialogue.s1001 + 0)
.s55:
76f1 : a9 08 __ LDA #$08
76f3 : 85 63 __ STA T11 + 0 
76f5 : a5 5a __ LDA T5 + 0 
76f7 : c9 02 __ CMP #$02
76f9 : f0 03 __ BEQ $76fe ; (import_dialogue.s124 + 0)
76fb : 4c d7 75 JMP $75d7 ; (import_dialogue.s161 + 0)
.s124:
76fe : a9 09 __ LDA #$09
7700 : 4c 8c 75 JMP $758c ; (import_dialogue.s60 + 0)
.s38:
7703 : ad ad 87 LDA $87ad ; (canvas + 5)
7706 : 0d ae 87 ORA $87ae ; (canvas + 6)
7709 : f0 0f __ BEQ $771a ; (import_dialogue.s44 + 0)
.s82:
770b : a9 00 __ LDA #$00
770d : 85 53 __ STA T0 + 0 
770f : 85 54 __ STA T0 + 1 
7711 : a9 7f __ LDA #$7f
7713 : 85 0d __ STA P0 
7715 : 85 10 __ STA P3 
7717 : 4c e9 77 JMP $77e9 ; (import_dialogue.l42 + 0)
.s44:
771a : a9 0f __ LDA #$0f
771c : 85 0f __ STA P2 
771e : ad ab 87 LDA $87ab ; (canvas + 3)
7721 : 85 1b __ STA ACCU + 0 
7723 : ad ac 87 LDA $87ac ; (canvas + 4)
7726 : 85 1c __ STA ACCU + 1 
7728 : a5 55 __ LDA T1 + 0 
772a : 85 03 __ STA WORK + 0 
772c : a5 56 __ LDA T1 + 1 
772e : 85 04 __ STA WORK + 1 
7730 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7733 : a5 05 __ LDA WORK + 2 
7735 : 85 58 __ STA T4 + 0 
7737 : a5 06 __ LDA WORK + 3 
7739 : 85 59 __ STA T4 + 1 
773b : ad ad 87 LDA $87ad ; (canvas + 5)
773e : 85 1b __ STA ACCU + 0 
7740 : ad ae 87 LDA $87ae ; (canvas + 6)
7743 : 85 1c __ STA ACCU + 1 
7745 : ad ab 87 LDA $87ab ; (canvas + 3)
7748 : 85 03 __ STA WORK + 0 
774a : ad ac 87 LDA $87ac ; (canvas + 4)
774d : 85 04 __ STA WORK + 1 
774f : 20 62 7c JSR $7c62 ; (mul16 + 0)
7752 : 18 __ __ CLC
7753 : a5 06 __ LDA WORK + 3 
7755 : 69 58 __ ADC #$58
7757 : aa __ __ TAX
7758 : 18 __ __ CLC
7759 : a5 05 __ LDA WORK + 2 
775b : 65 58 __ ADC T4 + 0 
775d : a8 __ __ TAY
775e : 8a __ __ TXA
775f : 65 59 __ ADC T4 + 1 
7761 : aa __ __ TAX
7762 : 98 __ __ TYA
7763 : 18 __ __ CLC
7764 : 69 30 __ ADC #$30
7766 : 85 0d __ STA P0 
7768 : 90 01 __ BCC $776b ; (import_dialogue.s1053 + 0)
.s1052:
776a : e8 __ __ INX
.s1053:
776b : 86 0e __ STX P1 
776d : 38 __ __ SEC
776e : a5 55 __ LDA T1 + 0 
7770 : ed ad 87 SBC $87ad ; (canvas + 5)
7773 : 85 1b __ STA ACCU + 0 
7775 : a5 56 __ LDA T1 + 1 
7777 : ed ae 87 SBC $87ae ; (canvas + 6)
777a : 85 1c __ STA ACCU + 1 
777c : ad ab 87 LDA $87ab ; (canvas + 3)
777f : 85 03 __ STA WORK + 0 
7781 : ad ac 87 LDA $87ac ; (canvas + 4)
7784 : 85 04 __ STA WORK + 1 
7786 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7789 : 20 65 1a JSR $1a65 ; (bnk_memset@proxy + 0)
778c : a9 20 __ LDA #$20
778e : 85 0f __ STA P2 
7790 : ad ab 87 LDA $87ab ; (canvas + 3)
7793 : 85 03 __ STA WORK + 0 
7795 : ad ac 87 LDA $87ac ; (canvas + 4)
7798 : 85 04 __ STA WORK + 1 
779a : ad ad 87 LDA $87ad ; (canvas + 5)
779d : 85 1b __ STA ACCU + 0 
779f : ad ae 87 LDA $87ae ; (canvas + 6)
77a2 : 85 1c __ STA ACCU + 1 
77a4 : 20 62 7c JSR $7c62 ; (mul16 + 0)
77a7 : 18 __ __ CLC
77a8 : a5 06 __ LDA WORK + 3 
77aa : 69 58 __ ADC #$58
77ac : 85 0e __ STA P1 
77ae : a5 05 __ LDA WORK + 2 
77b0 : 85 0d __ STA P0 
77b2 : 38 __ __ SEC
77b3 : a5 55 __ LDA T1 + 0 
77b5 : ed ad 87 SBC $87ad ; (canvas + 5)
77b8 : 85 1b __ STA ACCU + 0 
77ba : a5 56 __ LDA T1 + 1 
77bc : ed ae 87 SBC $87ae ; (canvas + 6)
77bf : 85 1c __ STA ACCU + 1 
77c1 : ad ab 87 LDA $87ab ; (canvas + 3)
77c4 : 85 03 __ STA WORK + 0 
77c6 : ad ac 87 LDA $87ac ; (canvas + 4)
77c9 : 85 04 __ STA WORK + 1 
77cb : 20 62 7c JSR $7c62 ; (mul16 + 0)
77ce : 20 65 1a JSR $1a65 ; (bnk_memset@proxy + 0)
77d1 : a5 55 __ LDA T1 + 0 
77d3 : 8d ad 87 STA $87ad ; (canvas + 5)
77d6 : a5 56 __ LDA T1 + 1 
77d8 : 8d ae 87 STA $87ae ; (canvas + 6)
77db : a9 00 __ LDA #$00
77dd : 8d b1 87 STA $87b1 ; (canvas + 9)
77e0 : 8d b2 87 STA $87b2 ; (canvas + 10)
77e3 : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
77e6 : 4c f3 74 JMP $74f3 ; (import_dialogue.s40 + 0)
.l42:
77e9 : ad ab 87 LDA $87ab ; (canvas + 3)
77ec : 85 1b __ STA ACCU + 0 
77ee : 85 13 __ STA P6 
77f0 : ad ac 87 LDA $87ac ; (canvas + 4)
77f3 : 85 1c __ STA ACCU + 1 
77f5 : 85 14 __ STA P7 
77f7 : a5 55 __ LDA T1 + 0 
77f9 : 85 03 __ STA WORK + 0 
77fb : a5 56 __ LDA T1 + 1 
77fd : 85 04 __ STA WORK + 1 
77ff : 20 62 7c JSR $7c62 ; (mul16 + 0)
7802 : a5 05 __ LDA WORK + 2 
7804 : 85 5b __ STA T6 + 0 
7806 : a5 06 __ LDA WORK + 3 
7808 : 85 5c __ STA T6 + 1 
780a : ad ad 87 LDA $87ad ; (canvas + 5)
780d : 38 __ __ SEC
780e : e5 53 __ SBC T0 + 0 
7810 : a8 __ __ TAY
7811 : ad ae 87 LDA $87ae ; (canvas + 6)
7814 : e5 54 __ SBC T0 + 1 
7816 : aa __ __ TAX
7817 : 98 __ __ TYA
7818 : 38 __ __ SEC
7819 : e9 01 __ SBC #$01
781b : 85 1b __ STA ACCU + 0 
781d : 8a __ __ TXA
781e : e9 00 __ SBC #$00
7820 : 85 1c __ STA ACCU + 1 
7822 : ad ab 87 LDA $87ab ; (canvas + 3)
7825 : 85 03 __ STA WORK + 0 
7827 : ad ac 87 LDA $87ac ; (canvas + 4)
782a : 85 04 __ STA WORK + 1 
782c : 20 62 7c JSR $7c62 ; (mul16 + 0)
782f : 18 __ __ CLC
7830 : a5 06 __ LDA WORK + 3 
7832 : 69 58 __ ADC #$58
7834 : 85 60 __ STA T8 + 1 
7836 : a5 05 __ LDA WORK + 2 
7838 : 85 5f __ STA T8 + 0 
783a : 18 __ __ CLC
783b : 65 5b __ ADC T6 + 0 
783d : aa __ __ TAX
783e : a5 60 __ LDA T8 + 1 
7840 : 65 5c __ ADC T6 + 1 
7842 : a8 __ __ TAY
7843 : 8a __ __ TXA
7844 : 18 __ __ CLC
7845 : 69 30 __ ADC #$30
7847 : 85 0e __ STA P1 
7849 : 90 01 __ BCC $784c ; (import_dialogue.s1047 + 0)
.s1046:
784b : c8 __ __ INY
.s1047:
784c : 84 0f __ STY P2 
784e : ad ad 87 LDA $87ad ; (canvas + 5)
7851 : 85 1b __ STA ACCU + 0 
7853 : ad ae 87 LDA $87ae ; (canvas + 6)
7856 : 85 1c __ STA ACCU + 1 
7858 : ad ab 87 LDA $87ab ; (canvas + 3)
785b : 85 03 __ STA WORK + 0 
785d : ad ac 87 LDA $87ac ; (canvas + 4)
7860 : 85 04 __ STA WORK + 1 
7862 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7865 : 18 __ __ CLC
7866 : a5 05 __ LDA WORK + 2 
7868 : 65 5f __ ADC T8 + 0 
786a : aa __ __ TAX
786b : a5 06 __ LDA WORK + 3 
786d : 65 60 __ ADC T8 + 1 
786f : a8 __ __ TAY
7870 : 8a __ __ TXA
7871 : 18 __ __ CLC
7872 : 69 30 __ ADC #$30
7874 : 85 11 __ STA P4 
7876 : 90 01 __ BCC $7879 ; (import_dialogue.s1049 + 0)
.s1048:
7878 : c8 __ __ INY
.s1049:
7879 : 84 12 __ STY P5 
787b : 20 96 14 JSR $1496 ; (bnk_memcpy.s0 + 0)
787e : e6 53 __ INC T0 + 0 
7880 : d0 02 __ BNE $7884 ; (import_dialogue.s1051 + 0)
.s1050:
7882 : e6 54 __ INC T0 + 1 
.s1051:
7884 : a5 54 __ LDA T0 + 1 
7886 : cd ae 87 CMP $87ae ; (canvas + 6)
7889 : d0 05 __ BNE $7890 ; (import_dialogue.s1019 + 0)
.s1018:
788b : a5 53 __ LDA T0 + 0 
788d : cd ad 87 CMP $87ad ; (canvas + 5)
.s1019:
7890 : b0 03 __ BCS $7895 ; (import_dialogue.s1019 + 5)
7892 : 4c e9 77 JMP $77e9 ; (import_dialogue.l42 + 0)
7895 : 4c 1a 77 JMP $771a ; (import_dialogue.s44 + 0)
.s83:
7898 : a9 00 __ LDA #$00
789a : 85 58 __ STA T4 + 0 
789c : 85 59 __ STA T4 + 1 
.l29:
789e : a9 7f __ LDA #$7f
78a0 : 85 11 __ STA P4 
78a2 : ad ab 87 LDA $87ab ; (canvas + 3)
78a5 : 85 5b __ STA T6 + 0 
78a7 : 85 03 __ STA WORK + 0 
78a9 : 85 14 __ STA P7 
78ab : ad ac 87 LDA $87ac ; (canvas + 4)
78ae : 85 5c __ STA T6 + 1 
78b0 : 85 04 __ STA WORK + 1 
78b2 : 85 15 __ STA P8 
78b4 : ad ad 87 LDA $87ad ; (canvas + 5)
78b7 : 38 __ __ SEC
78b8 : e5 58 __ SBC T4 + 0 
78ba : a8 __ __ TAY
78bb : ad ae 87 LDA $87ae ; (canvas + 6)
78be : e5 59 __ SBC T4 + 1 
78c0 : aa __ __ TAX
78c1 : 98 __ __ TYA
78c2 : 38 __ __ SEC
78c3 : e9 01 __ SBC #$01
78c5 : 85 5d __ STA T7 + 0 
78c7 : 85 1b __ STA ACCU + 0 
78c9 : 8a __ __ TXA
78ca : e9 00 __ SBC #$00
78cc : 85 5e __ STA T7 + 1 
78ce : 85 1c __ STA ACCU + 1 
78d0 : 20 62 7c JSR $7c62 ; (mul16 + 0)
78d3 : 18 __ __ CLC
78d4 : a5 06 __ LDA WORK + 3 
78d6 : 69 58 __ ADC #$58
78d8 : 85 13 __ STA P6 
78da : a5 05 __ LDA WORK + 2 
78dc : 85 12 __ STA P5 
78de : ad 9b 87 LDA $879b ; (vdc_state + 12)
78e1 : 85 0f __ STA P2 
78e3 : ad 9c 87 LDA $879c ; (vdc_state + 13)
78e6 : 85 60 __ STA T8 + 1 
78e8 : 85 10 __ STA P3 
78ea : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
78ed : a9 7f __ LDA #$7f
78ef : 85 0d __ STA P0 
78f1 : a5 0f __ LDA P2 
78f3 : 85 10 __ STA P3 
78f5 : a5 60 __ LDA T8 + 1 
78f7 : 85 11 __ STA P4 
78f9 : a5 5b __ LDA T6 + 0 
78fb : 85 12 __ STA P5 
78fd : a5 5c __ LDA T6 + 1 
78ff : 85 13 __ STA P6 
7901 : a5 5d __ LDA T7 + 0 
7903 : 85 1b __ STA ACCU + 0 
7905 : a5 5e __ LDA T7 + 1 
7907 : 85 1c __ STA ACCU + 1 
7909 : a5 53 __ LDA T0 + 0 
790b : 85 03 __ STA WORK + 0 
790d : a5 54 __ LDA T0 + 1 
790f : 85 04 __ STA WORK + 1 
7911 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7914 : 18 __ __ CLC
7915 : a5 06 __ LDA WORK + 3 
7917 : 69 58 __ ADC #$58
7919 : 85 0f __ STA P2 
791b : 20 47 1a JSR $1a47 ; (bnk_cpyfromvdc@proxy + 0)
791e : a9 20 __ LDA #$20
7920 : 85 0f __ STA P2 
7922 : ad ad 87 LDA $87ad ; (canvas + 5)
7925 : 38 __ __ SEC
7926 : e5 58 __ SBC T4 + 0 
7928 : a8 __ __ TAY
7929 : ad ae 87 LDA $87ae ; (canvas + 6)
792c : e5 59 __ SBC T4 + 1 
792e : aa __ __ TAX
792f : 98 __ __ TYA
7930 : 38 __ __ SEC
7931 : e9 01 __ SBC #$01
7933 : 85 1b __ STA ACCU + 0 
7935 : 8a __ __ TXA
7936 : e9 00 __ SBC #$00
7938 : 85 1c __ STA ACCU + 1 
793a : a5 53 __ LDA T0 + 0 
793c : 85 03 __ STA WORK + 0 
793e : a5 54 __ LDA T0 + 1 
7940 : 85 04 __ STA WORK + 1 
7942 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7945 : 18 __ __ CLC
7946 : a5 06 __ LDA WORK + 3 
7948 : 69 58 __ ADC #$58
794a : aa __ __ TAX
794b : ad ab 87 LDA $87ab ; (canvas + 3)
794e : 18 __ __ CLC
794f : 65 05 __ ADC WORK + 2 
7951 : 85 0d __ STA P0 
7953 : 8a __ __ TXA
7954 : 6d ac 87 ADC $87ac ; (canvas + 4)
7957 : 85 0e __ STA P1 
7959 : 38 __ __ SEC
795a : a5 53 __ LDA T0 + 0 
795c : ed ab 87 SBC $87ab ; (canvas + 3)
795f : 85 10 __ STA P3 
7961 : a5 54 __ LDA T0 + 1 
7963 : ed ac 87 SBC $87ac ; (canvas + 4)
7966 : 85 11 __ STA P4 
7968 : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
796b : e6 58 __ INC T4 + 0 
796d : d0 02 __ BNE $7971 ; (import_dialogue.s1045 + 0)
.s1044:
796f : e6 59 __ INC T4 + 1 
.s1045:
7971 : a5 59 __ LDA T4 + 1 
7973 : cd ae 87 CMP $87ae ; (canvas + 6)
7976 : d0 05 __ BNE $797d ; (import_dialogue.s1025 + 0)
.s1024:
7978 : a5 58 __ LDA T4 + 0 
797a : cd ad 87 CMP $87ad ; (canvas + 5)
.s1025:
797d : b0 03 __ BCS $7982 ; (import_dialogue.s1025 + 5)
797f : 4c 9e 78 JMP $789e ; (import_dialogue.l29 + 0)
7982 : 4c cd 74 JMP $74cd ; (import_dialogue.s31 + 0)
.l19:
7985 : a9 7f __ LDA #$7f
7987 : 85 11 __ STA P4 
7989 : ad ab 87 LDA $87ab ; (canvas + 3)
798c : 85 5b __ STA T6 + 0 
798e : 85 03 __ STA WORK + 0 
7990 : 85 14 __ STA P7 
7992 : ad ac 87 LDA $87ac ; (canvas + 4)
7995 : 85 5c __ STA T6 + 1 
7997 : 85 04 __ STA WORK + 1 
7999 : 85 15 __ STA P8 
799b : ad ad 87 LDA $87ad ; (canvas + 5)
799e : 85 5d __ STA T7 + 0 
79a0 : 85 1b __ STA ACCU + 0 
79a2 : ad ae 87 LDA $87ae ; (canvas + 6)
79a5 : 85 5e __ STA T7 + 1 
79a7 : 85 1c __ STA ACCU + 1 
79a9 : 20 62 7c JSR $7c62 ; (mul16 + 0)
79ac : a5 05 __ LDA WORK + 2 
79ae : 85 5f __ STA T8 + 0 
79b0 : a5 06 __ LDA WORK + 3 
79b2 : 85 60 __ STA T8 + 1 
79b4 : 38 __ __ SEC
79b5 : a5 5d __ LDA T7 + 0 
79b7 : e5 58 __ SBC T4 + 0 
79b9 : a8 __ __ TAY
79ba : a5 5e __ LDA T7 + 1 
79bc : e5 59 __ SBC T4 + 1 
79be : aa __ __ TAX
79bf : 98 __ __ TYA
79c0 : 38 __ __ SEC
79c1 : e9 01 __ SBC #$01
79c3 : 85 61 __ STA T9 + 0 
79c5 : 85 1b __ STA ACCU + 0 
79c7 : 8a __ __ TXA
79c8 : e9 00 __ SBC #$00
79ca : 85 62 __ STA T9 + 1 
79cc : 85 1c __ STA ACCU + 1 
79ce : a5 5b __ LDA T6 + 0 
79d0 : 85 03 __ STA WORK + 0 
79d2 : a5 5c __ LDA T6 + 1 
79d4 : 85 04 __ STA WORK + 1 
79d6 : 20 62 7c JSR $7c62 ; (mul16 + 0)
79d9 : 18 __ __ CLC
79da : a5 06 __ LDA WORK + 3 
79dc : 69 58 __ ADC #$58
79de : aa __ __ TAX
79df : 18 __ __ CLC
79e0 : a5 05 __ LDA WORK + 2 
79e2 : 65 5f __ ADC T8 + 0 
79e4 : a8 __ __ TAY
79e5 : 8a __ __ TXA
79e6 : 65 60 __ ADC T8 + 1 
79e8 : aa __ __ TAX
79e9 : 98 __ __ TYA
79ea : 18 __ __ CLC
79eb : 69 30 __ ADC #$30
79ed : 85 12 __ STA P5 
79ef : 90 01 __ BCC $79f2 ; (import_dialogue.s1037 + 0)
.s1036:
79f1 : e8 __ __ INX
.s1037:
79f2 : 86 13 __ STX P6 
79f4 : ad 9b 87 LDA $879b ; (vdc_state + 12)
79f7 : 85 0f __ STA P2 
79f9 : ad 9c 87 LDA $879c ; (vdc_state + 13)
79fc : 85 60 __ STA T8 + 1 
79fe : 85 10 __ STA P3 
7a00 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
7a03 : a9 7f __ LDA #$7f
7a05 : 85 0d __ STA P0 
7a07 : a5 0f __ LDA P2 
7a09 : 85 10 __ STA P3 
7a0b : a5 60 __ LDA T8 + 1 
7a0d : 85 11 __ STA P4 
7a0f : a5 5b __ LDA T6 + 0 
7a11 : 85 12 __ STA P5 
7a13 : a5 5c __ LDA T6 + 1 
7a15 : 85 13 __ STA P6 
7a17 : a5 53 __ LDA T0 + 0 
7a19 : 85 1b __ STA ACCU + 0 
7a1b : a5 54 __ LDA T0 + 1 
7a1d : 85 1c __ STA ACCU + 1 
7a1f : a5 5d __ LDA T7 + 0 
7a21 : 85 03 __ STA WORK + 0 
7a23 : a5 5e __ LDA T7 + 1 
7a25 : 85 04 __ STA WORK + 1 
7a27 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7a2a : a5 05 __ LDA WORK + 2 
7a2c : 85 5b __ STA T6 + 0 
7a2e : a5 06 __ LDA WORK + 3 
7a30 : 85 5c __ STA T6 + 1 
7a32 : a5 61 __ LDA T9 + 0 
7a34 : 85 1b __ STA ACCU + 0 
7a36 : a5 62 __ LDA T9 + 1 
7a38 : 85 1c __ STA ACCU + 1 
7a3a : a5 53 __ LDA T0 + 0 
7a3c : 85 03 __ STA WORK + 0 
7a3e : a5 54 __ LDA T0 + 1 
7a40 : 85 04 __ STA WORK + 1 
7a42 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7a45 : 18 __ __ CLC
7a46 : a5 06 __ LDA WORK + 3 
7a48 : 69 58 __ ADC #$58
7a4a : aa __ __ TAX
7a4b : 18 __ __ CLC
7a4c : a5 05 __ LDA WORK + 2 
7a4e : 65 5b __ ADC T6 + 0 
7a50 : a8 __ __ TAY
7a51 : 8a __ __ TXA
7a52 : 65 5c __ ADC T6 + 1 
7a54 : aa __ __ TAX
7a55 : 98 __ __ TYA
7a56 : 18 __ __ CLC
7a57 : 69 30 __ ADC #$30
7a59 : 85 0e __ STA P1 
7a5b : 90 01 __ BCC $7a5e ; (import_dialogue.s1039 + 0)
.s1038:
7a5d : e8 __ __ INX
.s1039:
7a5e : 86 0f __ STX P2 
7a60 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
7a63 : a9 0f __ LDA #$0f
7a65 : 85 0f __ STA P2 
7a67 : ad ad 87 LDA $87ad ; (canvas + 5)
7a6a : 38 __ __ SEC
7a6b : e5 58 __ SBC T4 + 0 
7a6d : a8 __ __ TAY
7a6e : ad ae 87 LDA $87ae ; (canvas + 6)
7a71 : e5 59 __ SBC T4 + 1 
7a73 : aa __ __ TAX
7a74 : 98 __ __ TYA
7a75 : 38 __ __ SEC
7a76 : e9 01 __ SBC #$01
7a78 : 85 1b __ STA ACCU + 0 
7a7a : 8a __ __ TXA
7a7b : e9 00 __ SBC #$00
7a7d : 85 1c __ STA ACCU + 1 
7a7f : a5 53 __ LDA T0 + 0 
7a81 : 85 03 __ STA WORK + 0 
7a83 : a5 54 __ LDA T0 + 1 
7a85 : 85 04 __ STA WORK + 1 
7a87 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7a8a : 18 __ __ CLC
7a8b : a5 06 __ LDA WORK + 3 
7a8d : 69 58 __ ADC #$58
7a8f : aa __ __ TAX
7a90 : ad ab 87 LDA $87ab ; (canvas + 3)
7a93 : 18 __ __ CLC
7a94 : 65 05 __ ADC WORK + 2 
7a96 : 85 5d __ STA T7 + 0 
7a98 : 8a __ __ TXA
7a99 : 6d ac 87 ADC $87ac ; (canvas + 4)
7a9c : 85 5e __ STA T7 + 1 
7a9e : ad ad 87 LDA $87ad ; (canvas + 5)
7aa1 : 85 1b __ STA ACCU + 0 
7aa3 : ad ae 87 LDA $87ae ; (canvas + 6)
7aa6 : 85 1c __ STA ACCU + 1 
7aa8 : a5 53 __ LDA T0 + 0 
7aaa : 85 03 __ STA WORK + 0 
7aac : a5 54 __ LDA T0 + 1 
7aae : 85 04 __ STA WORK + 1 
7ab0 : 20 62 7c JSR $7c62 ; (mul16 + 0)
7ab3 : 18 __ __ CLC
7ab4 : a5 05 __ LDA WORK + 2 
7ab6 : 65 5d __ ADC T7 + 0 
7ab8 : aa __ __ TAX
7ab9 : a5 06 __ LDA WORK + 3 
7abb : 65 5e __ ADC T7 + 1 
7abd : a8 __ __ TAY
7abe : 8a __ __ TXA
7abf : 18 __ __ CLC
7ac0 : 69 30 __ ADC #$30
7ac2 : 85 0d __ STA P0 
7ac4 : 90 01 __ BCC $7ac7 ; (import_dialogue.s1041 + 0)
.s1040:
7ac6 : c8 __ __ INY
.s1041:
7ac7 : 84 0e __ STY P1 
7ac9 : 38 __ __ SEC
7aca : a5 53 __ LDA T0 + 0 
7acc : ed ab 87 SBC $87ab ; (canvas + 3)
7acf : 85 10 __ STA P3 
7ad1 : a5 54 __ LDA T0 + 1 
7ad3 : ed ac 87 SBC $87ac ; (canvas + 4)
7ad6 : 85 11 __ STA P4 
7ad8 : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
7adb : e6 58 __ INC T4 + 0 
7add : d0 02 __ BNE $7ae1 ; (import_dialogue.s1043 + 0)
.s1042:
7adf : e6 59 __ INC T4 + 1 
.s1043:
7ae1 : a5 59 __ LDA T4 + 1 
7ae3 : cd ae 87 CMP $87ae ; (canvas + 6)
7ae6 : d0 05 __ BNE $7aed ; (import_dialogue.s1027 + 0)
.s1026:
7ae8 : a5 58 __ LDA T4 + 0 
7aea : cd ad 87 CMP $87ad ; (canvas + 5)
.s1027:
7aed : b0 03 __ BCS $7af2 ; (import_dialogue.s1027 + 5)
7aef : 4c 85 79 JMP $7985 ; (import_dialogue.l19 + 0)
7af2 : 4c c2 74 JMP $74c2 ; (import_dialogue.s21 + 0)
--------------------------------------------------------------------
7af5 : __ __ __ BYT 75 4e 44 4f 3a 20 25 53 00                      : uNDO: %S.
--------------------------------------------------------------------
undoenabled:
7afe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
mc_menupopup:
7aff : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
7b00 : __ __ __ BYT 65 4e 54 45 52 20 49 4d 50 4f 52 54 20 57 49 44 : eNTER IMPORT WID
7b10 : __ __ __ BYT 54 48 3a 00                                     : TH:.
--------------------------------------------------------------------
7b14 : __ __ __ BYT 65 4e 54 45 52 20 49 4d 50 4f 52 54 20 48 45 49 : eNTER IMPORT HEI
7b24 : __ __ __ BYT 47 48 54 3a 00                                  : GHT:.
--------------------------------------------------------------------
7b29 : __ __ __ BYT 65 4e 54 45 52 20 54 41 52 47 45 54 20 78 20 43 : eNTER TARGET x C
7b39 : __ __ __ BYT 4f 4f 52 44 3a 00                               : OORD:.
--------------------------------------------------------------------
7b3f : __ __ __ BYT 65 4e 54 45 52 20 54 41 52 47 45 54 20 79 20 43 : eNTER TARGET y C
7b4f : __ __ __ BYT 4f 4f 52 44 3a 00                               : OORD:.
--------------------------------------------------------------------
7b55 : __ __ __ BYT 6e 45 57 20 53 49 5a 45 20 55 4e 53 55 50 50 4f : nEW SIZE UNSUPPO
7b65 : __ __ __ BYT 52 54 45 44 2e 20 70 52 45 53 53 20 4b 45 59 2e : RTED. pRESS KEY.
7b75 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
7b76 : __ __ __ BYT 69 4e 43 4c 55 44 45 53 20 4c 4f 41 44 20 41 44 : iNCLUDES LOAD AD
7b86 : __ __ __ BYT 44 52 45 53 20 41 54 20 46 49 52 53 54 20 32 20 : DRES AT FIRST 2 
7b96 : __ __ __ BYT 42 59 54 45 53 3f 00                            : BYTES?.
--------------------------------------------------------------------
7b9d : __ __ __ BYT 69 4d 50 4f 52 54 20 43 48 41 52 53 2c 20 43 4f : iMPORT CHARS, CO
7bad : __ __ __ BYT 4c 4f 52 20 4f 52 20 42 4f 54 48 3f 00          : LOR OR BOTH?.
--------------------------------------------------------------------
7bba : __ __ __ BYT 69 47 4e 4f 52 45 20 63 6c 73 20 2f 20 63 4c 45 : iGNORE cls / cLE
7bca : __ __ __ BYT 41 52 3f 00                                     : AR?.
--------------------------------------------------------------------
7bce : __ __ __ BYT 63 4f 4e 56 45 52 54 20 76 69 63 20 43 4f 4c 4f : cONVERT vic COLO
7bde : __ __ __ BYT 55 52 53 3f 00                                  : URS?.
--------------------------------------------------------------------
7be3 : __ __ __ BYT 75 50 50 45 52 43 41 53 45 20 43 48 41 52 53 45 : uPPERCASE CHARSE
7bf3 : __ __ __ BYT 54 3f 20 20 20 00                               : T?   .
--------------------------------------------------------------------
__multab36L:
7bf9 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
visualmap:
7bff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
7c00 : __ __ __ BYT 65 4e 54 45 52 20 4f 46 46 53 45 54 20 43 48 41 : eNTER OFFSET CHA
7c10 : __ __ __ BYT 52 20 54 4f 20 43 4f 4c 4f 52 3a 00             : R TO COLOR:.
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s1000:
7c1c : 85 0d __ STA P0 
.s0:
7c1e : a6 0d __ LDX P0 
7c20 : 20 c9 ff JSR $ffc9 
7c23 : a9 00 __ LDA #$00
7c25 : b0 02 __ BCS $7c29 ; (krnio_chkout.s0 + 11)
7c27 : a9 01 __ LDA #$01
7c29 : 85 1b __ STA ACCU + 0 
.s1001:
7c2b : a5 1b __ LDA ACCU + 0 
7c2d : 60 __ __ RTS
--------------------------------------------------------------------
7c2e : __ __ __ BYT 65 4e 41 42 4c 45 44 20 20 00                   : eNABLED  .
--------------------------------------------------------------------
7c38 : __ __ __ BYT 64 49 53 41 42 4c 45 44 20 00                   : dISABLED .
--------------------------------------------------------------------
mul16by8: ; mul16by8
7c42 : a0 00 __ LDY #$00
7c44 : 84 06 __ STY WORK + 3 
7c46 : 4a __ __ LSR
7c47 : 90 0d __ BCC $7c56 ; (mul16by8 + 20)
7c49 : aa __ __ TAX
7c4a : 18 __ __ CLC
7c4b : 98 __ __ TYA
7c4c : 65 1b __ ADC ACCU + 0 
7c4e : a8 __ __ TAY
7c4f : a5 06 __ LDA WORK + 3 
7c51 : 65 1c __ ADC ACCU + 1 
7c53 : 85 06 __ STA WORK + 3 
7c55 : 8a __ __ TXA
7c56 : 06 1b __ ASL ACCU + 0 
7c58 : 26 1c __ ROL ACCU + 1 
7c5a : 4a __ __ LSR
7c5b : b0 ec __ BCS $7c49 ; (mul16by8 + 7)
7c5d : d0 f7 __ BNE $7c56 ; (mul16by8 + 20)
7c5f : 84 05 __ STY WORK + 2 
7c61 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
7c62 : a0 00 __ LDY #$00
7c64 : 84 06 __ STY WORK + 3 
7c66 : a5 03 __ LDA WORK + 0 
7c68 : a6 04 __ LDX WORK + 1 
7c6a : f0 1c __ BEQ $7c88 ; (mul16 + 38)
7c6c : 38 __ __ SEC
7c6d : 6a __ __ ROR
7c6e : 90 0d __ BCC $7c7d ; (mul16 + 27)
7c70 : aa __ __ TAX
7c71 : 18 __ __ CLC
7c72 : 98 __ __ TYA
7c73 : 65 1b __ ADC ACCU + 0 
7c75 : a8 __ __ TAY
7c76 : a5 06 __ LDA WORK + 3 
7c78 : 65 1c __ ADC ACCU + 1 
7c7a : 85 06 __ STA WORK + 3 
7c7c : 8a __ __ TXA
7c7d : 06 1b __ ASL ACCU + 0 
7c7f : 26 1c __ ROL ACCU + 1 
7c81 : 4a __ __ LSR
7c82 : 90 f9 __ BCC $7c7d ; (mul16 + 27)
7c84 : d0 ea __ BNE $7c70 ; (mul16 + 14)
7c86 : a5 04 __ LDA WORK + 1 
7c88 : 4a __ __ LSR
7c89 : 90 0d __ BCC $7c98 ; (mul16 + 54)
7c8b : aa __ __ TAX
7c8c : 18 __ __ CLC
7c8d : 98 __ __ TYA
7c8e : 65 1b __ ADC ACCU + 0 
7c90 : a8 __ __ TAY
7c91 : a5 06 __ LDA WORK + 3 
7c93 : 65 1c __ ADC ACCU + 1 
7c95 : 85 06 __ STA WORK + 3 
7c97 : 8a __ __ TXA
7c98 : 06 1b __ ASL ACCU + 0 
7c9a : 26 1c __ ROL ACCU + 1 
7c9c : 4a __ __ LSR
7c9d : b0 ec __ BCS $7c8b ; (mul16 + 41)
7c9f : d0 f7 __ BNE $7c98 ; (mul16 + 54)
7ca1 : 84 05 __ STY WORK + 2 
7ca3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
7ca4 : a5 1c __ LDA ACCU + 1 
7ca6 : d0 31 __ BNE $7cd9 ; (divmod + 53)
7ca8 : a5 04 __ LDA WORK + 1 
7caa : d0 1e __ BNE $7cca ; (divmod + 38)
7cac : 85 06 __ STA WORK + 3 
7cae : a2 04 __ LDX #$04
7cb0 : 06 1b __ ASL ACCU + 0 
7cb2 : 2a __ __ ROL
7cb3 : c5 03 __ CMP WORK + 0 
7cb5 : 90 02 __ BCC $7cb9 ; (divmod + 21)
7cb7 : e5 03 __ SBC WORK + 0 
7cb9 : 26 1b __ ROL ACCU + 0 
7cbb : 2a __ __ ROL
7cbc : c5 03 __ CMP WORK + 0 
7cbe : 90 02 __ BCC $7cc2 ; (divmod + 30)
7cc0 : e5 03 __ SBC WORK + 0 
7cc2 : 26 1b __ ROL ACCU + 0 
7cc4 : ca __ __ DEX
7cc5 : d0 eb __ BNE $7cb2 ; (divmod + 14)
7cc7 : 85 05 __ STA WORK + 2 
7cc9 : 60 __ __ RTS
7cca : a5 1b __ LDA ACCU + 0 
7ccc : 85 05 __ STA WORK + 2 
7cce : a5 1c __ LDA ACCU + 1 
7cd0 : 85 06 __ STA WORK + 3 
7cd2 : a9 00 __ LDA #$00
7cd4 : 85 1b __ STA ACCU + 0 
7cd6 : 85 1c __ STA ACCU + 1 
7cd8 : 60 __ __ RTS
7cd9 : a5 04 __ LDA WORK + 1 
7cdb : d0 1f __ BNE $7cfc ; (divmod + 88)
7cdd : a5 03 __ LDA WORK + 0 
7cdf : 30 1b __ BMI $7cfc ; (divmod + 88)
7ce1 : a9 00 __ LDA #$00
7ce3 : 85 06 __ STA WORK + 3 
7ce5 : a2 10 __ LDX #$10
7ce7 : 06 1b __ ASL ACCU + 0 
7ce9 : 26 1c __ ROL ACCU + 1 
7ceb : 2a __ __ ROL
7cec : c5 03 __ CMP WORK + 0 
7cee : 90 02 __ BCC $7cf2 ; (divmod + 78)
7cf0 : e5 03 __ SBC WORK + 0 
7cf2 : 26 1b __ ROL ACCU + 0 
7cf4 : 26 1c __ ROL ACCU + 1 
7cf6 : ca __ __ DEX
7cf7 : d0 f2 __ BNE $7ceb ; (divmod + 71)
7cf9 : 85 05 __ STA WORK + 2 
7cfb : 60 __ __ RTS
7cfc : a9 00 __ LDA #$00
7cfe : 85 05 __ STA WORK + 2 
7d00 : 85 06 __ STA WORK + 3 
7d02 : 84 02 __ STY $02 
7d04 : a0 10 __ LDY #$10
7d06 : 18 __ __ CLC
7d07 : 26 1b __ ROL ACCU + 0 
7d09 : 26 1c __ ROL ACCU + 1 
7d0b : 26 05 __ ROL WORK + 2 
7d0d : 26 06 __ ROL WORK + 3 
7d0f : 38 __ __ SEC
7d10 : a5 05 __ LDA WORK + 2 
7d12 : e5 03 __ SBC WORK + 0 
7d14 : aa __ __ TAX
7d15 : a5 06 __ LDA WORK + 3 
7d17 : e5 04 __ SBC WORK + 1 
7d19 : 90 04 __ BCC $7d1f ; (divmod + 123)
7d1b : 86 05 __ STX WORK + 2 
7d1d : 85 06 __ STA WORK + 3 
7d1f : 88 __ __ DEY
7d20 : d0 e5 __ BNE $7d07 ; (divmod + 99)
7d22 : 26 1b __ ROL ACCU + 0 
7d24 : 26 1c __ ROL ACCU + 1 
7d26 : a4 02 __ LDY $02 
7d28 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
7d29 : a9 00 __ LDA #$00
7d2b : 85 07 __ STA WORK + 4 
7d2d : 85 08 __ STA WORK + 5 
7d2f : 85 09 __ STA WORK + 6 
7d31 : 85 0a __ STA WORK + 7 
7d33 : a5 03 __ LDA WORK + 0 
7d35 : 20 44 7d JSR $7d44 ; (mul32 + 27)
7d38 : a5 04 __ LDA WORK + 1 
7d3a : 20 44 7d JSR $7d44 ; (mul32 + 27)
7d3d : a5 05 __ LDA WORK + 2 
7d3f : 20 44 7d JSR $7d44 ; (mul32 + 27)
7d42 : a5 06 __ LDA WORK + 3 
7d44 : d0 0f __ BNE $7d55 ; (mul32 + 44)
7d46 : a6 1d __ LDX ACCU + 2 
7d48 : 86 1e __ STX ACCU + 3 
7d4a : a6 1c __ LDX ACCU + 1 
7d4c : 86 1d __ STX ACCU + 2 
7d4e : a6 1b __ LDX ACCU + 0 
7d50 : 86 1c __ STX ACCU + 1 
7d52 : 85 1b __ STA ACCU + 0 
7d54 : 60 __ __ RTS
7d55 : 38 __ __ SEC
7d56 : 6a __ __ ROR
7d57 : 90 1b __ BCC $7d74 ; (mul32 + 75)
7d59 : aa __ __ TAX
7d5a : 18 __ __ CLC
7d5b : a5 07 __ LDA WORK + 4 
7d5d : 65 1b __ ADC ACCU + 0 
7d5f : 85 07 __ STA WORK + 4 
7d61 : a5 08 __ LDA WORK + 5 
7d63 : 65 1c __ ADC ACCU + 1 
7d65 : 85 08 __ STA WORK + 5 
7d67 : a5 09 __ LDA WORK + 6 
7d69 : 65 1d __ ADC ACCU + 2 
7d6b : 85 09 __ STA WORK + 6 
7d6d : a5 0a __ LDA WORK + 7 
7d6f : 65 1e __ ADC ACCU + 3 
7d71 : 85 0a __ STA WORK + 7 
7d73 : 8a __ __ TXA
7d74 : 06 1b __ ASL ACCU + 0 
7d76 : 26 1c __ ROL ACCU + 1 
7d78 : 26 1d __ ROL ACCU + 2 
7d7a : 26 1e __ ROL ACCU + 3 
7d7c : 4a __ __ LSR
7d7d : 90 f5 __ BCC $7d74 ; (mul32 + 75)
7d7f : d0 d8 __ BNE $7d59 ; (mul32 + 48)
7d81 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
7d82 : 84 02 __ STY $02 
7d84 : a0 20 __ LDY #$20
7d86 : a9 00 __ LDA #$00
7d88 : 85 07 __ STA WORK + 4 
7d8a : 85 08 __ STA WORK + 5 
7d8c : 85 09 __ STA WORK + 6 
7d8e : 85 0a __ STA WORK + 7 
7d90 : a5 05 __ LDA WORK + 2 
7d92 : 05 06 __ ORA WORK + 3 
7d94 : d0 78 __ BNE $7e0e ; (divmod32 + 140)
7d96 : a5 04 __ LDA WORK + 1 
7d98 : d0 27 __ BNE $7dc1 ; (divmod32 + 63)
7d9a : 18 __ __ CLC
7d9b : 26 1b __ ROL ACCU + 0 
7d9d : 26 1c __ ROL ACCU + 1 
7d9f : 26 1d __ ROL ACCU + 2 
7da1 : 26 1e __ ROL ACCU + 3 
7da3 : 2a __ __ ROL
7da4 : 90 05 __ BCC $7dab ; (divmod32 + 41)
7da6 : e5 03 __ SBC WORK + 0 
7da8 : 38 __ __ SEC
7da9 : b0 06 __ BCS $7db1 ; (divmod32 + 47)
7dab : c5 03 __ CMP WORK + 0 
7dad : 90 02 __ BCC $7db1 ; (divmod32 + 47)
7daf : e5 03 __ SBC WORK + 0 
7db1 : 88 __ __ DEY
7db2 : d0 e7 __ BNE $7d9b ; (divmod32 + 25)
7db4 : 85 07 __ STA WORK + 4 
7db6 : 26 1b __ ROL ACCU + 0 
7db8 : 26 1c __ ROL ACCU + 1 
7dba : 26 1d __ ROL ACCU + 2 
7dbc : 26 1e __ ROL ACCU + 3 
7dbe : a4 02 __ LDY $02 
7dc0 : 60 __ __ RTS
7dc1 : a5 1e __ LDA ACCU + 3 
7dc3 : d0 10 __ BNE $7dd5 ; (divmod32 + 83)
7dc5 : a6 1d __ LDX ACCU + 2 
7dc7 : 86 1e __ STX ACCU + 3 
7dc9 : a6 1c __ LDX ACCU + 1 
7dcb : 86 1d __ STX ACCU + 2 
7dcd : a6 1b __ LDX ACCU + 0 
7dcf : 86 1c __ STX ACCU + 1 
7dd1 : 85 1b __ STA ACCU + 0 
7dd3 : a0 18 __ LDY #$18
7dd5 : 18 __ __ CLC
7dd6 : 26 1b __ ROL ACCU + 0 
7dd8 : 26 1c __ ROL ACCU + 1 
7dda : 26 1d __ ROL ACCU + 2 
7ddc : 26 1e __ ROL ACCU + 3 
7dde : 26 07 __ ROL WORK + 4 
7de0 : 26 08 __ ROL WORK + 5 
7de2 : 90 0c __ BCC $7df0 ; (divmod32 + 110)
7de4 : a5 07 __ LDA WORK + 4 
7de6 : e5 03 __ SBC WORK + 0 
7de8 : aa __ __ TAX
7de9 : a5 08 __ LDA WORK + 5 
7deb : e5 04 __ SBC WORK + 1 
7ded : 38 __ __ SEC
7dee : b0 0c __ BCS $7dfc ; (divmod32 + 122)
7df0 : 38 __ __ SEC
7df1 : a5 07 __ LDA WORK + 4 
7df3 : e5 03 __ SBC WORK + 0 
7df5 : aa __ __ TAX
7df6 : a5 08 __ LDA WORK + 5 
7df8 : e5 04 __ SBC WORK + 1 
7dfa : 90 04 __ BCC $7e00 ; (divmod32 + 126)
7dfc : 86 07 __ STX WORK + 4 
7dfe : 85 08 __ STA WORK + 5 
7e00 : 88 __ __ DEY
7e01 : d0 d3 __ BNE $7dd6 ; (divmod32 + 84)
7e03 : 26 1b __ ROL ACCU + 0 
7e05 : 26 1c __ ROL ACCU + 1 
7e07 : 26 1d __ ROL ACCU + 2 
7e09 : 26 1e __ ROL ACCU + 3 
7e0b : a4 02 __ LDY $02 
7e0d : 60 __ __ RTS
7e0e : a0 10 __ LDY #$10
7e10 : a5 1e __ LDA ACCU + 3 
7e12 : 85 08 __ STA WORK + 5 
7e14 : a5 1d __ LDA ACCU + 2 
7e16 : 85 07 __ STA WORK + 4 
7e18 : a9 00 __ LDA #$00
7e1a : 85 1d __ STA ACCU + 2 
7e1c : 85 1e __ STA ACCU + 3 
7e1e : 18 __ __ CLC
7e1f : 26 1b __ ROL ACCU + 0 
7e21 : 26 1c __ ROL ACCU + 1 
7e23 : 26 07 __ ROL WORK + 4 
7e25 : 26 08 __ ROL WORK + 5 
7e27 : 26 09 __ ROL WORK + 6 
7e29 : 26 0a __ ROL WORK + 7 
7e2b : a5 07 __ LDA WORK + 4 
7e2d : c5 03 __ CMP WORK + 0 
7e2f : a5 08 __ LDA WORK + 5 
7e31 : e5 04 __ SBC WORK + 1 
7e33 : a5 09 __ LDA WORK + 6 
7e35 : e5 05 __ SBC WORK + 2 
7e37 : a5 0a __ LDA WORK + 7 
7e39 : e5 06 __ SBC WORK + 3 
7e3b : 90 18 __ BCC $7e55 ; (divmod32 + 211)
7e3d : a5 07 __ LDA WORK + 4 
7e3f : e5 03 __ SBC WORK + 0 
7e41 : 85 07 __ STA WORK + 4 
7e43 : a5 08 __ LDA WORK + 5 
7e45 : e5 04 __ SBC WORK + 1 
7e47 : 85 08 __ STA WORK + 5 
7e49 : a5 09 __ LDA WORK + 6 
7e4b : e5 05 __ SBC WORK + 2 
7e4d : 85 09 __ STA WORK + 6 
7e4f : a5 0a __ LDA WORK + 7 
7e51 : e5 06 __ SBC WORK + 3 
7e53 : 85 0a __ STA WORK + 7 
7e55 : 88 __ __ DEY
7e56 : d0 c7 __ BNE $7e1f ; (divmod32 + 157)
7e58 : 26 1b __ ROL ACCU + 0 
7e5a : 26 1c __ ROL ACCU + 1 
7e5c : a4 02 __ LDY $02 
7e5e : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
7e5f : 18 __ __ CLC
7e60 : a5 1b __ LDA ACCU + 0 
7e62 : 69 06 __ ADC #$06
7e64 : 85 03 __ STA WORK + 0 
7e66 : a5 1c __ LDA ACCU + 1 
7e68 : 69 00 __ ADC #$00
7e6a : 85 04 __ STA WORK + 1 
7e6c : ad e2 8a LDA $8ae2 ; (HeapNode + 2)
7e6f : d0 1f __ BNE $7e90 ; (malloc + 49)
7e71 : a9 00 __ LDA #$00
7e73 : 8d 58 8b STA $8b58 
7e76 : 8d 59 8b STA $8b59 
7e79 : ee e2 8a INC $8ae2 ; (HeapNode + 2)
7e7c : a9 58 __ LDA #$58
7e7e : 8d e0 8a STA $8ae0 ; (HeapNode + 0)
7e81 : a9 8b __ LDA #$8b
7e83 : 8d e1 8a STA $8ae1 ; (HeapNode + 1)
7e86 : a9 00 __ LDA #$00
7e88 : 8d 5a 8b STA $8b5a 
7e8b : a9 9c __ LDA #$9c
7e8d : 8d 5b 8b STA $8b5b 
7e90 : a9 e0 __ LDA #$e0
7e92 : a2 8a __ LDX #$8a
7e94 : 85 1d __ STA ACCU + 2 
7e96 : 86 1e __ STX ACCU + 3 
7e98 : 18 __ __ CLC
7e99 : a0 00 __ LDY #$00
7e9b : b1 1d __ LDA (ACCU + 2),y 
7e9d : 85 1b __ STA ACCU + 0 
7e9f : 65 03 __ ADC WORK + 0 
7ea1 : 85 05 __ STA WORK + 2 
7ea3 : c8 __ __ INY
7ea4 : b1 1d __ LDA (ACCU + 2),y 
7ea6 : 85 1c __ STA ACCU + 1 
7ea8 : f0 18 __ BEQ $7ec2 ; (malloc + 99)
7eaa : 65 04 __ ADC WORK + 1 
7eac : 85 06 __ STA WORK + 3 
7eae : a0 02 __ LDY #$02
7eb0 : b1 1b __ LDA (ACCU + 0),y 
7eb2 : c5 05 __ CMP WORK + 2 
7eb4 : c8 __ __ INY
7eb5 : b1 1b __ LDA (ACCU + 0),y 
7eb7 : e5 06 __ SBC WORK + 3 
7eb9 : b0 09 __ BCS $7ec4 ; (malloc + 101)
7ebb : a5 1b __ LDA ACCU + 0 
7ebd : a6 1c __ LDX ACCU + 1 
7ebf : 4c 94 7e JMP $7e94 ; (malloc + 53)
7ec2 : 02 __ __ INV
7ec3 : 60 __ __ RTS
7ec4 : 18 __ __ CLC
7ec5 : a5 05 __ LDA WORK + 2 
7ec7 : 69 07 __ ADC #$07
7ec9 : 29 f8 __ AND #$f8
7ecb : 85 07 __ STA WORK + 4 
7ecd : a5 06 __ LDA WORK + 3 
7ecf : 69 00 __ ADC #$00
7ed1 : 85 08 __ STA WORK + 5 
7ed3 : a0 02 __ LDY #$02
7ed5 : a5 07 __ LDA WORK + 4 
7ed7 : d1 1b __ CMP (ACCU + 0),y 
7ed9 : d0 15 __ BNE $7ef0 ; (malloc + 145)
7edb : c8 __ __ INY
7edc : a5 08 __ LDA WORK + 5 
7ede : d1 1b __ CMP (ACCU + 0),y 
7ee0 : d0 0e __ BNE $7ef0 ; (malloc + 145)
7ee2 : a0 00 __ LDY #$00
7ee4 : b1 1b __ LDA (ACCU + 0),y 
7ee6 : 91 1d __ STA (ACCU + 2),y 
7ee8 : c8 __ __ INY
7ee9 : b1 1b __ LDA (ACCU + 0),y 
7eeb : 91 1d __ STA (ACCU + 2),y 
7eed : 4c 0d 7f JMP $7f0d ; (malloc + 174)
7ef0 : a0 00 __ LDY #$00
7ef2 : b1 1b __ LDA (ACCU + 0),y 
7ef4 : 91 07 __ STA (WORK + 4),y 
7ef6 : a5 07 __ LDA WORK + 4 
7ef8 : 91 1d __ STA (ACCU + 2),y 
7efa : c8 __ __ INY
7efb : b1 1b __ LDA (ACCU + 0),y 
7efd : 91 07 __ STA (WORK + 4),y 
7eff : a5 08 __ LDA WORK + 5 
7f01 : 91 1d __ STA (ACCU + 2),y 
7f03 : c8 __ __ INY
7f04 : b1 1b __ LDA (ACCU + 0),y 
7f06 : 91 07 __ STA (WORK + 4),y 
7f08 : c8 __ __ INY
7f09 : b1 1b __ LDA (ACCU + 0),y 
7f0b : 91 07 __ STA (WORK + 4),y 
7f0d : a0 00 __ LDY #$00
7f0f : a5 05 __ LDA WORK + 2 
7f11 : 91 1b __ STA (ACCU + 0),y 
7f13 : c8 __ __ INY
7f14 : a5 06 __ LDA WORK + 3 
7f16 : 91 1b __ STA (ACCU + 0),y 
7f18 : a0 02 __ LDY #$02
7f1a : a9 bd __ LDA #$bd
7f1c : 91 1b __ STA (ACCU + 0),y 
7f1e : c8 __ __ INY
7f1f : 91 1b __ STA (ACCU + 0),y 
7f21 : 38 __ __ SEC
7f22 : a5 05 __ LDA WORK + 2 
7f24 : e9 02 __ SBC #$02
7f26 : 85 05 __ STA WORK + 2 
7f28 : b0 02 __ BCS $7f2c ; (malloc + 205)
7f2a : c6 06 __ DEC WORK + 3 
7f2c : a9 be __ LDA #$be
7f2e : a0 00 __ LDY #$00
7f30 : 91 05 __ STA (WORK + 2),y 
7f32 : c8 __ __ INY
7f33 : 91 05 __ STA (WORK + 2),y 
7f35 : a5 1b __ LDA ACCU + 0 
7f37 : 09 04 __ ORA #$04
7f39 : 85 1b __ STA ACCU + 0 
7f3b : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
7f3c : a5 1b __ LDA ACCU + 0 
7f3e : 05 1c __ ORA ACCU + 1 
7f40 : d0 01 __ BNE $7f43 ; (free + 7)
7f42 : 60 __ __ RTS
7f43 : a5 1b __ LDA ACCU + 0 
7f45 : 29 07 __ AND #$07
7f47 : c9 04 __ CMP #$04
7f49 : d0 49 __ BNE $7f94 ; (free + 88)
7f4b : a5 1b __ LDA ACCU + 0 
7f4d : 29 f8 __ AND #$f8
7f4f : 85 1b __ STA ACCU + 0 
7f51 : a0 02 __ LDY #$02
7f53 : b1 1b __ LDA (ACCU + 0),y 
7f55 : c9 bd __ CMP #$bd
7f57 : d0 3b __ BNE $7f94 ; (free + 88)
7f59 : c8 __ __ INY
7f5a : b1 1b __ LDA (ACCU + 0),y 
7f5c : c9 bd __ CMP #$bd
7f5e : d0 34 __ BNE $7f94 ; (free + 88)
7f60 : a0 00 __ LDY #$00
7f62 : 38 __ __ SEC
7f63 : b1 1b __ LDA (ACCU + 0),y 
7f65 : e9 02 __ SBC #$02
7f67 : 85 03 __ STA WORK + 0 
7f69 : c8 __ __ INY
7f6a : b1 1b __ LDA (ACCU + 0),y 
7f6c : e9 00 __ SBC #$00
7f6e : 85 04 __ STA WORK + 1 
7f70 : a0 00 __ LDY #$00
7f72 : b1 03 __ LDA (WORK + 0),y 
7f74 : c9 be __ CMP #$be
7f76 : d0 1c __ BNE $7f94 ; (free + 88)
7f78 : c8 __ __ INY
7f79 : b1 03 __ LDA (WORK + 0),y 
7f7b : c9 be __ CMP #$be
7f7d : d0 15 __ BNE $7f94 ; (free + 88)
7f7f : a5 1b __ LDA ACCU + 0 
7f81 : 05 1c __ ORA ACCU + 1 
7f83 : d0 01 __ BNE $7f86 ; (free + 74)
7f85 : 60 __ __ RTS
7f86 : a5 1c __ LDA ACCU + 1 
7f88 : a6 1b __ LDX ACCU + 0 
7f8a : c9 8b __ CMP #$8b
7f8c : 90 06 __ BCC $7f94 ; (free + 88)
7f8e : d0 05 __ BNE $7f95 ; (free + 89)
7f90 : e0 58 __ CPX #$58
7f92 : b0 01 __ BCS $7f95 ; (free + 89)
7f94 : 02 __ __ INV
7f95 : c9 9c __ CMP #$9c
7f97 : 90 06 __ BCC $7f9f ; (free + 99)
7f99 : d0 f9 __ BNE $7f94 ; (free + 88)
7f9b : e0 00 __ CPX #$00
7f9d : b0 f5 __ BCS $7f94 ; (free + 88)
7f9f : a0 02 __ LDY #$02
7fa1 : a9 bf __ LDA #$bf
7fa3 : 91 1b __ STA (ACCU + 0),y 
7fa5 : c8 __ __ INY
7fa6 : 91 1b __ STA (ACCU + 0),y 
7fa8 : 18 __ __ CLC
7fa9 : a0 00 __ LDY #$00
7fab : b1 1b __ LDA (ACCU + 0),y 
7fad : 69 07 __ ADC #$07
7faf : 29 f8 __ AND #$f8
7fb1 : 85 1d __ STA ACCU + 2 
7fb3 : c8 __ __ INY
7fb4 : b1 1b __ LDA (ACCU + 0),y 
7fb6 : 69 00 __ ADC #$00
7fb8 : 85 1e __ STA ACCU + 3 
7fba : a9 e0 __ LDA #$e0
7fbc : a2 8a __ LDX #$8a
7fbe : 85 05 __ STA WORK + 2 
7fc0 : 86 06 __ STX WORK + 3 
7fc2 : a0 01 __ LDY #$01
7fc4 : b1 05 __ LDA (WORK + 2),y 
7fc6 : f0 28 __ BEQ $7ff0 ; (free + 180)
7fc8 : aa __ __ TAX
7fc9 : 88 __ __ DEY
7fca : b1 05 __ LDA (WORK + 2),y 
7fcc : e4 1e __ CPX ACCU + 3 
7fce : 90 ee __ BCC $7fbe ; (free + 130)
7fd0 : d0 1e __ BNE $7ff0 ; (free + 180)
7fd2 : c5 1d __ CMP ACCU + 2 
7fd4 : 90 e8 __ BCC $7fbe ; (free + 130)
7fd6 : d0 18 __ BNE $7ff0 ; (free + 180)
7fd8 : a0 00 __ LDY #$00
7fda : b1 1d __ LDA (ACCU + 2),y 
7fdc : 91 1b __ STA (ACCU + 0),y 
7fde : c8 __ __ INY
7fdf : b1 1d __ LDA (ACCU + 2),y 
7fe1 : 91 1b __ STA (ACCU + 0),y 
7fe3 : c8 __ __ INY
7fe4 : b1 1d __ LDA (ACCU + 2),y 
7fe6 : 91 1b __ STA (ACCU + 0),y 
7fe8 : c8 __ __ INY
7fe9 : b1 1d __ LDA (ACCU + 2),y 
7feb : 91 1b __ STA (ACCU + 0),y 
7fed : 4c 05 80 JMP $8005 ; (free + 201)
7ff0 : a0 00 __ LDY #$00
7ff2 : b1 05 __ LDA (WORK + 2),y 
7ff4 : 91 1b __ STA (ACCU + 0),y 
7ff6 : c8 __ __ INY
7ff7 : b1 05 __ LDA (WORK + 2),y 
7ff9 : 91 1b __ STA (ACCU + 0),y 
7ffb : c8 __ __ INY
7ffc : a5 1d __ LDA ACCU + 2 
7ffe : 91 1b __ STA (ACCU + 0),y 
8000 : c8 __ __ INY
8001 : a5 1e __ LDA ACCU + 3 
8003 : 91 1b __ STA (ACCU + 0),y 
8005 : a0 02 __ LDY #$02
8007 : b1 05 __ LDA (WORK + 2),y 
8009 : c5 1b __ CMP ACCU + 0 
800b : d0 1d __ BNE $802a ; (free + 238)
800d : c8 __ __ INY
800e : b1 05 __ LDA (WORK + 2),y 
8010 : c5 1c __ CMP ACCU + 1 
8012 : d0 16 __ BNE $802a ; (free + 238)
8014 : a0 00 __ LDY #$00
8016 : b1 1b __ LDA (ACCU + 0),y 
8018 : 91 05 __ STA (WORK + 2),y 
801a : c8 __ __ INY
801b : b1 1b __ LDA (ACCU + 0),y 
801d : 91 05 __ STA (WORK + 2),y 
801f : c8 __ __ INY
8020 : b1 1b __ LDA (ACCU + 0),y 
8022 : 91 05 __ STA (WORK + 2),y 
8024 : c8 __ __ INY
8025 : b1 1b __ LDA (ACCU + 0),y 
8027 : 91 05 __ STA (WORK + 2),y 
8029 : 60 __ __ RTS
802a : a0 00 __ LDY #$00
802c : a5 1b __ LDA ACCU + 0 
802e : 91 05 __ STA (WORK + 2),y 
8030 : c8 __ __ INY
8031 : a5 1c __ LDA ACCU + 1 
8033 : 91 05 __ STA (WORK + 2),y 
8035 : 60 __ __ RTS
--------------------------------------------------------------------
__multab3L:
8036 : __ __ __ BYT 00 03 06 09 0c 0f 12                            : .......
--------------------------------------------------------------------
__multab32L:
803d : __ __ __ BYT 00 20 40 60 80 a0 c0 e0 00 20                   : . @`..... 
--------------------------------------------------------------------
__multab12L:
8047 : __ __ __ BYT 00 0c 18 24 30 3c                               : ...$0<
--------------------------------------------------------------------
__multab96L:
804d : __ __ __ BYT 00 60 c0 20 80 e0 40 a0                         : .`. ..@.
--------------------------------------------------------------------
__multab96H:
8055 : __ __ __ BYT 00 00 00 01 01 01 02 02                         : ........
--------------------------------------------------------------------
strtol@proxy: ; strtol@proxy
805d : a9 00 __ LDA #$00
805f : 85 0d __ STA P0 
8061 : a9 89 __ LDA #$89
8063 : 85 0e __ STA P1 
8065 : a9 a4 __ LDA #$a4
8067 : 85 0f __ STA P2 
8069 : a9 ab __ LDA #$ab
806b : 85 10 __ STA P3 
806d : a9 0a __ LDA #$0a
806f : 85 11 __ STA P4 
8071 : 4c 7a 4e JMP $4e7a ; (strtol.s0 + 0)
--------------------------------------------------------------------
strtol@proxy: ; strtol@proxy
8074 : a9 00 __ LDA #$00
8076 : 85 0d __ STA P0 
8078 : a9 89 __ LDA #$89
807a : 85 0e __ STA P1 
807c : a9 0a __ LDA #$0a
807e : 85 11 __ STA P4 
8080 : 4c 7a 4e JMP $4e7a ; (strtol.s0 + 0)
--------------------------------------------------------------------
vdcwin_cpy_viewport@proxy: ; vdcwin_cpy_viewport@proxy
8083 : a9 a8 __ LDA #$a8
8085 : 85 16 __ STA P9 
8087 : a9 87 __ LDA #$87
8089 : 85 17 __ STA P10 
808b : 4c 26 45 JMP $4526 ; (vdcwin_cpy_viewport.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
808e : a5 4c __ LDA $4c 
8090 : 85 11 __ STA P4 
8092 : a5 4d __ LDA $4d 
8094 : 85 12 __ STA P5 
8096 : 4c 84 47 JMP $4784 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
8099 : a5 4c __ LDA $4c 
809b : 85 0f __ STA P2 
809d : a5 4d __ LDA $4d 
809f : 85 10 __ STA P3 
80a1 : 4c 84 47 JMP $4784 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80a4 : a9 00 __ LDA #$00
80a6 : 85 13 __ STA P6 
80a8 : a9 89 __ LDA #$89
80aa : 85 14 __ STA P7 
80ac : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80af : a9 15 __ LDA #$15
80b1 : 85 11 __ STA P4 
80b3 : ad 96 87 LDA $8796 ; (vdc_state + 7)
80b6 : 85 15 __ STA P8 
80b8 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80bb : a9 15 __ LDA #$15
80bd : 85 11 __ STA P4 
80bf : a5 51 __ LDA $51 
80c1 : 85 12 __ STA P5 
80c3 : a9 90 __ LDA #$90
80c5 : 85 13 __ STA P6 
80c7 : a9 88 __ LDA #$88
80c9 : 85 14 __ STA P7 
80cb : ad 96 87 LDA $8796 ; (vdc_state + 7)
80ce : 85 15 __ STA P8 
80d0 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80d3 : a9 15 __ LDA #$15
80d5 : 85 11 __ STA P4 
80d7 : a9 08 __ LDA #$08
80d9 : 85 12 __ STA P5 
80db : ad 96 87 LDA $8796 ; (vdc_state + 7)
80de : 85 15 __ STA P8 
80e0 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80e3 : a9 15 __ LDA #$15
80e5 : 85 11 __ STA P4 
80e7 : a5 57 __ LDA $57 
80e9 : 85 15 __ STA P8 
80eb : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80ee : a5 57 __ LDA $57 
80f0 : 85 15 __ STA P8 
80f2 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
80f5 : a9 15 __ LDA #$15
80f7 : 85 11 __ STA P4 
80f9 : a5 5a __ LDA $5a 
80fb : 85 12 __ STA P5 
80fd : a5 57 __ LDA $57 
80ff : 85 15 __ STA P8 
8101 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8104 : a9 15 __ LDA #$15
8106 : 85 11 __ STA P4 
8108 : a9 06 __ LDA #$06
810a : 85 12 __ STA P5 
810c : ad 96 87 LDA $8796 ; (vdc_state + 7)
810f : 85 15 __ STA P8 
8111 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8114 : a9 15 __ LDA #$15
8116 : 85 11 __ STA P4 
8118 : a5 53 __ LDA $53 
811a : 85 15 __ STA P8 
811c : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
811f : a9 0b __ LDA #$0b
8121 : 85 11 __ STA P4 
8123 : ad 96 87 LDA $8796 ; (vdc_state + 7)
8126 : 85 15 __ STA P8 
8128 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
812b : a9 0b __ LDA #$0b
812d : 85 11 __ STA P4 
812f : a9 90 __ LDA #$90
8131 : 85 13 __ STA P6 
8133 : a9 88 __ LDA #$88
8135 : 85 14 __ STA P7 
8137 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
813a : a5 53 __ LDA $53 
813c : 85 15 __ STA P8 
813e : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8141 : a9 90 __ LDA #$90
8143 : 85 13 __ STA P6 
8145 : a9 88 __ LDA #$88
8147 : 85 14 __ STA P7 
8149 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
814c : a9 0a __ LDA #$0a
814e : 85 12 __ STA P5 
8150 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8153 : a9 15 __ LDA #$15
8155 : 85 11 __ STA P4 
8157 : a9 08 __ LDA #$08
8159 : 85 12 __ STA P5 
815b : a9 00 __ LDA #$00
815d : 85 13 __ STA P6 
815f : a9 89 __ LDA #$89
8161 : 85 14 __ STA P7 
8163 : ad 96 87 LDA $8796 ; (vdc_state + 7)
8166 : 85 15 __ STA P8 
8168 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
816b : a9 ec __ LDA #$ec
816d : 85 13 __ STA P6 
816f : a9 bb __ LDA #$bb
8171 : 85 14 __ STA P7 
8173 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
8176 : a9 15 __ LDA #$15
8178 : 85 11 __ STA P4 
817a : a9 0b __ LDA #$0b
817c : 85 12 __ STA P5 
817e : a9 00 __ LDA #$00
8180 : 85 13 __ STA P6 
8182 : a9 bc __ LDA #$bc
8184 : 85 14 __ STA P7 
8186 : a5 53 __ LDA $53 
8188 : 85 15 __ STA P8 
818a : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
818d : a9 15 __ LDA #$15
818f : 85 11 __ STA P4 
8191 : a9 0b __ LDA #$0b
8193 : 85 12 __ STA P5 
8195 : a9 cb __ LDA #$cb
8197 : 85 13 __ STA P6 
8199 : a9 bb __ LDA #$bb
819b : 85 14 __ STA P7 
819d : a5 53 __ LDA $53 
819f : 85 15 __ STA P8 
81a1 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81a4 : ad cd 82 LDA $82cd ; (mc_pd_normal + 0)
81a7 : 85 15 __ STA P8 
81a9 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81ac : a9 00 __ LDA #$00
81ae : 85 13 __ STA P6 
81b0 : a9 3a __ LDA #$3a
81b2 : 85 14 __ STA P7 
81b4 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81b7 : a9 0a __ LDA #$0a
81b9 : 85 11 __ STA P4 
81bb : a9 09 __ LDA #$09
81bd : 85 12 __ STA P5 
81bf : a5 52 __ LDA $52 
81c1 : 85 15 __ STA P8 
81c3 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
81c6 : a5 4e __ LDA $4e 
81c8 : 85 12 __ STA P5 
81ca : a9 00 __ LDA #$00
81cc : 85 13 __ STA P6 
81ce : a9 89 __ LDA #$89
81d0 : 85 14 __ STA P7 
81d2 : a5 4f __ LDA $4f 
81d4 : 85 15 __ STA P8 
81d6 : 4c 3b 34 JMP $343b ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
81d9 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
81dc : 85 10 __ STA P3 
81de : 4c f8 34 JMP $34f8 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
81e1 : a5 44 __ LDA $44 
81e3 : 85 0e __ STA P1 
81e5 : 4c 7d 2d JMP $2d7d ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
81e8 : a9 14 __ LDA #$14
81ea : 85 0f __ STA P2 
81ec : a9 20 __ LDA #$20
81ee : 85 11 __ STA P4 
81f0 : a9 28 __ LDA #$28
81f2 : 85 13 __ STA P6 
81f4 : a9 08 __ LDA #$08
81f6 : 85 14 __ STA P7 
81f8 : a9 0a __ LDA #$0a
81fa : 85 15 __ STA P8 
81fc : 4c a3 2c JMP $2ca3 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
81ff : a9 0a __ LDA #$0a
8201 : 85 0f __ STA P2 
8203 : a9 20 __ LDA #$20
8205 : 85 11 __ STA P4 
8207 : a9 05 __ LDA #$05
8209 : 85 14 __ STA P7 
820b : 4c a3 2c JMP $2ca3 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
820e : a9 20 __ LDA #$20
8210 : 85 11 __ STA P4 
8212 : a9 01 __ LDA #$01
8214 : 85 15 __ STA P8 
8216 : 4c a3 2c JMP $2ca3 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
8219 : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 85 89 86 8a 87 8b : ................
8229 : __ __ __ BYT 88 8c 0a 8c                                     : ....
--------------------------------------------------------------------
pulldown_options:
822d : __ __ __ BYT 06 04 05 03 02 06 03 02                         : ........
--------------------------------------------------------------------
winStyles:
8235 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
8245 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
_cinfo:
8247 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 02 01 01 01 01 00 00 : ................
8257 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
8267 : __ __ __ BYT 02 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 : .@@@@@@@@@@@@@@@
8277 : __ __ __ BYT 04 04 04 04 04 04 04 04 04 04 40 40 40 40 40 40 : ..........@@@@@@
8287 : __ __ __ BYT 40 30 30 30 30 30 30 10 10 10 10 10 10 10 10 10 : @000000.........
8297 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 10 40 40 40 40 40 : ...........@@@@@
82a7 : __ __ __ BYT 40 28 28 28 28 28 28 08 08 08 08 08 08 08 08 08 : @((((((.........
82b7 : __ __ __ BYT 08 08 08 08 08 08 08 08 08 08 08 40 40 40 40 00 : ...........@@@@.
--------------------------------------------------------------------
rowsel:
82c7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
colsel:
82c9 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
mc_mb_normal:
82cb : __ __ __ BYT c5                                              : .
--------------------------------------------------------------------
mc_mb_select:
82cc : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
mc_pd_normal:
82cd : __ __ __ BYT c6                                              : .
--------------------------------------------------------------------
mc_pd_select:
82ce : __ __ __ BYT cd                                              : .
--------------------------------------------------------------------
progressRev:
82cf : __ __ __ BYT 00 00 01 01                                     : ....
--------------------------------------------------------------------
p2smap:
82d3 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
progressBar:
82db : __ __ __ BYT a5 a1 a7 20                                     : ... 
--------------------------------------------------------------------
reg_types:
82df : __ __ __ BYT 66 71 6a 71 6e 71 72 71 76 71                   : fqjqnqrqvq
--------------------------------------------------------------------
oth_types:
82e9 : __ __ __ BYT 7a 71 7e 71 82 71 86 71 8a 71 8e 71             : zq~q.q.q.q.q
--------------------------------------------------------------------
value2hex:
82f5 : __ __ __ BYT 92 71                                           : .q
--------------------------------------------------------------------
winCfg:
82f7 : __ __ __ BSS	8
--------------------------------------------------------------------
bootdevice:
82ff : __ __ __ BSS	1
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
krnio_pstatus:
86d8 : __ __ __ BSS	16
--------------------------------------------------------------------
charsetchanged:
86e8 : __ __ __ BSS	2
--------------------------------------------------------------------
appexit:
86ea : __ __ __ BSS	1
--------------------------------------------------------------------
screen_col:
86eb : __ __ __ BSS	2
--------------------------------------------------------------------
screen_row:
86ed : __ __ __ BSS	2
--------------------------------------------------------------------
screenbackground:
86ef : __ __ __ BSS	1
--------------------------------------------------------------------
plotscreencode:
86f0 : __ __ __ BSS	1
--------------------------------------------------------------------
plotcolor:
86f1 : __ __ __ BSS	1
--------------------------------------------------------------------
plotreverse:
86f2 : __ __ __ BSS	1
--------------------------------------------------------------------
plotunderline:
86f3 : __ __ __ BSS	1
--------------------------------------------------------------------
plotblink:
86f4 : __ __ __ BSS	1
--------------------------------------------------------------------
plotaltchar:
86f5 : __ __ __ BSS	1
--------------------------------------------------------------------
targetdevice:
86f6 : __ __ __ BSS	1
--------------------------------------------------------------------
screentotal:
86f7 : __ __ __ BSS	2
--------------------------------------------------------------------
undoaddress:
86f9 : __ __ __ BSS	2
--------------------------------------------------------------------
undonumber:
86fb : __ __ __ BSS	1
--------------------------------------------------------------------
undo_undopossible:
86fc : __ __ __ BSS	1
--------------------------------------------------------------------
undo_redopossible:
86fd : __ __ __ BSS	1
--------------------------------------------------------------------
showbar:
86fe : __ __ __ BSS	1
--------------------------------------------------------------------
overlay_active:
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
filename:
877a : __ __ __ BSS	21
--------------------------------------------------------------------
vdc_state:
878f : __ __ __ BSS	25
--------------------------------------------------------------------
canvas:
87a8 : __ __ __ BSS	21
--------------------------------------------------------------------
windows:
87bd : __ __ __ BSS	39
--------------------------------------------------------------------
overlaydata:
87e4 : __ __ __ BSS	18
--------------------------------------------------------------------
palettechar:
87f6 : __ __ __ BSS	1
--------------------------------------------------------------------
select_startx:
87f7 : __ __ __ BSS	2
--------------------------------------------------------------------
select_starty:
87f9 : __ __ __ BSS	2
--------------------------------------------------------------------
select_endx:
87fb : __ __ __ BSS	2
--------------------------------------------------------------------
select_endy:
87fd : __ __ __ BSS	2
--------------------------------------------------------------------
multab:
8800 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer:
8890 : __ __ __ BSS	81
--------------------------------------------------------------------
programmode:
88e1 : __ __ __ BSS	11
--------------------------------------------------------------------
favourites:
88ec : __ __ __ BSS	20
--------------------------------------------------------------------
buffer:
8900 : __ __ __ BSS	81
--------------------------------------------------------------------
Undo:
8952 : __ __ __ BSS	287
--------------------------------------------------------------------
select_accept:
8a71 : __ __ __ BSS	2
--------------------------------------------------------------------
select_width:
8a73 : __ __ __ BSS	2
--------------------------------------------------------------------
select_height:
8a75 : __ __ __ BSS	2
--------------------------------------------------------------------
DOSstatus:
8a77 : __ __ __ BSS	40
--------------------------------------------------------------------
cwd:
8a9f : __ __ __ BSS	33
--------------------------------------------------------------------
disk_id_buf:
8ac0 : __ __ __ BSS	5
--------------------------------------------------------------------
previous:
8ac5 : __ __ __ BSS	2
--------------------------------------------------------------------
current:
8ac7 : __ __ __ BSS	2
--------------------------------------------------------------------
bad_type:
8ac9 : __ __ __ BSS	4
--------------------------------------------------------------------
importvars:
8acd : __ __ __ BSS	19
--------------------------------------------------------------------
HeapNode:
8ae0 : __ __ __ BSS	4
--------------------------------------------------------------------
linebuffer2:
8b00 : __ __ __ BSS	81
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
01:130e : 20 75 2d JSR $2d75 ; (vdc_mem_addr@proxy + 0)
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
01:135f : ad f6 86 LDA $86f6 ; (targetdevice + 0)
01:1362 : 85 0f __ STA P2 
01:1364 : a9 7a __ LDA #$7a
01:1366 : 85 13 __ STA P6 
01:1368 : a9 87 __ LDA #$87
01:136a : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:136c : a5 10 __ LDA P3 ; (bank + 0)
01:136e : 85 0d __ STA P0 
01:1370 : 20 b0 2a JSR $2ab0 ; (krnio_setbnk@proxy + 0)
01:1373 : a5 13 __ LDA P6 ; (fname + 0)
01:1375 : 85 0d __ STA P0 
01:1377 : a5 14 __ LDA P7 ; (fname + 1)
01:1379 : 85 0e __ STA P1 
01:137b : 20 c3 2a JSR $2ac3 ; (krnio_setnam.s0 + 0)
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
01:139e : 4c b4 2a JMP $2ab4 ; (krnio_setbnk.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:13a1 : a9 0e __ LDA #$0e
01:13a3 : 85 11 __ STA P4 
01:13a5 : a9 90 __ LDA #$90
01:13a7 : 85 12 __ STA P5 
01:13a9 : a9 88 __ LDA #$88
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
01:13bf : 20 75 2d JSR $2d75 ; (vdc_mem_addr@proxy + 0)
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
01:1400 : a9 90 __ LDA #$90
01:1402 : 85 0e __ STA P1 
01:1404 : a9 88 __ LDA #$88
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
01:149f : f0 2f __ BEQ $14d0 ; (bnk_memcpy.s3 + 0)
.s4:
01:14a1 : a0 00 __ LDY #$00
01:14a3 : a5 13 __ LDA P6 ; (size + 0)
01:14a5 : f0 02 __ BEQ $14a9 ; (bnk_memcpy.s1012 + 0)
.s1005:
01:14a7 : e6 14 __ INC P7 ; (size + 1)
.s1012:
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
01:14cc : c6 14 __ DEC P7 ; (size + 1)
01:14ce : d0 db __ BNE $14ab ; (bnk_memcpy.l1006 + 0)
.s3:
01:14d0 : a5 1b __ LDA ACCU + 0 
01:14d2 : 8d 00 ff STA $ff00 
.s1001:
01:14d5 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_memset@proxy: ; bnk_memset@proxy
01:14d6 : ad d1 8a LDA $8ad1 ; (importvars + 4)
01:14d9 : 85 10 __ STA P3 
01:14db : ad d2 8a LDA $8ad2 ; (importvars + 5)
01:14de : 85 11 __ STA P4 
--------------------------------------------------------------------
bnk_memset: ; bnk_memset(u8,u8*,u8,u16)->void
.s0:
01:14e0 : ad 00 ff LDA $ff00 
01:14e3 : 85 1b __ STA ACCU + 0 
01:14e5 : a9 7f __ LDA #$7f
01:14e7 : 8d 00 ff STA $ff00 
01:14ea : a5 11 __ LDA P4 ; (size + 1)
01:14ec : 05 10 __ ORA P3 ; (size + 0)
01:14ee : f0 1a __ BEQ $150a ; (bnk_memset.s3 + 0)
.s4:
01:14f0 : a0 00 __ LDY #$00
01:14f2 : a5 10 __ LDA P3 ; (size + 0)
01:14f4 : f0 02 __ BEQ $14f8 ; (bnk_memset.s1010 + 0)
.s1005:
01:14f6 : e6 11 __ INC P4 ; (size + 1)
.s1010:
01:14f8 : a6 10 __ LDX P3 ; (size + 0)
.l1006:
01:14fa : a5 0f __ LDA P2 ; (val + 0)
01:14fc : 91 0d __ STA (P0),y ; (p + 0)
01:14fe : c8 __ __ INY
01:14ff : d0 02 __ BNE $1503 ; (bnk_memset.s1009 + 0)
.s1008:
01:1501 : e6 0e __ INC P1 ; (p + 1)
.s1009:
01:1503 : ca __ __ DEX
01:1504 : d0 f4 __ BNE $14fa ; (bnk_memset.l1006 + 0)
.s1007:
01:1506 : c6 11 __ DEC P4 ; (size + 1)
01:1508 : d0 f0 __ BNE $14fa ; (bnk_memset.l1006 + 0)
.s3:
01:150a : a5 1b __ LDA ACCU + 0 
01:150c : 8d 00 ff STA $ff00 
.s1001:
01:150f : 60 __ __ RTS
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,u8*,u8)->void
.s0:
01:1510 : a9 7f __ LDA #$7f
01:1512 : ae 00 ff LDX $ff00 
01:1515 : 8d 00 ff STA $ff00 
01:1518 : a5 0f __ LDA P2 ; (b + 0)
01:151a : a0 00 __ LDY #$00
01:151c : 91 0d __ STA (P0),y ; (p + 0)
01:151e : 8e 00 ff STX $ff00 
.s1001:
01:1521 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,u8*)->u8
.s0:
01:1522 : a5 0d __ LDA P0 ; (cr + 0)
01:1524 : ae 00 ff LDX $ff00 
01:1527 : 8d 00 ff STA $ff00 
01:152a : a0 00 __ LDY #$00
01:152c : b1 0e __ LDA (P1),y ; (p + 0)
01:152e : 8e 00 ff STX $ff00 
.s1001:
01:1531 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_iec_active: ; bnk_iec_active(u8)->bool
.s1000:
01:1532 : 85 0d __ STA P0 
.s0:
01:1534 : a5 0d __ LDA P0 
01:1536 : a0 00 __ LDY #$00
01:1538 : 84 90 __ STY $90 
01:153a : 20 b1 ff JSR $ffb1 
01:153d : a9 ff __ LDA #$ff
01:153f : 20 93 ff JSR $ff93 
01:1542 : a5 90 __ LDA $90 
01:1544 : 10 08 __ BPL $154e ; (bnk_iec_active.s0 + 26)
01:1546 : 20 ae ff JSR $ffae 
01:1549 : a9 00 __ LDA #$00
01:154b : 85 1b __ STA ACCU + 0 
01:154d : 60 __ __ RTS
01:154e : 20 ae ff JSR $ffae 
01:1551 : a9 01 __ LDA #$01
01:1553 : 85 1b __ STA ACCU + 0 
.s1001:
01:1555 : a5 1b __ LDA ACCU + 0 
01:1557 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_save: ; bnk_save(u8,u8,const u8*,const u8*,const u8*)->bool
.s0:
01:1558 : a5 13 __ LDA P6 ; (bank + 0)
01:155a : 85 0d __ STA P0 
01:155c : 20 b0 2a JSR $2ab0 ; (krnio_setbnk@proxy + 0)
01:155f : ad f3 ab LDA $abf3 ; (sstack + 0)
01:1562 : 85 0d __ STA P0 
01:1564 : ad f4 ab LDA $abf4 ; (sstack + 1)
01:1567 : 85 0e __ STA P1 
01:1569 : 20 c3 2a JSR $2ac3 ; (krnio_setnam.s0 + 0)
01:156c : a5 12 __ LDA P5 ; (device + 0)
01:156e : 85 0d __ STA P0 
01:1570 : a5 14 __ LDA P7 ; (start + 0)
01:1572 : 85 0e __ STA P1 
01:1574 : a5 15 __ LDA P8 ; (start + 1)
01:1576 : 85 0f __ STA P2 
01:1578 : a5 16 __ LDA P9 ; (end + 0)
01:157a : 85 10 __ STA P3 
01:157c : a5 17 __ LDA P10 ; (end + 1)
01:157e : 85 11 __ STA P4 
01:1580 : 20 97 64 JSR $6497 ; (krnio_save.s0 + 0)
01:1583 : 85 43 __ STA T0 + 0 
01:1585 : a9 00 __ LDA #$00
01:1587 : 85 0d __ STA P0 
01:1589 : 85 0e __ STA P1 
01:158b : 20 b4 2a JSR $2ab4 ; (krnio_setbnk.s0 + 0)
01:158e : a5 43 __ LDA T0 + 0 
01:1590 : 85 1b __ STA ACCU + 0 
.s1001:
01:1592 : 60 __ __ RTS
--------------------------------------------------------------------
freeDir: ; freeDir()->void
.s0:
01:1593 : ad 9f 8a LDA $8a9f ; (cwd + 0)
01:1596 : f0 41 __ BEQ $15d9 ; (freeDir.s1001 + 0)
.s3:
01:1598 : ad b6 8a LDA $8ab6 ; (cwd + 23)
01:159b : 85 43 __ STA T1 + 0 
01:159d : 8d c7 8a STA $8ac7 ; (current + 0)
01:15a0 : ad b7 8a LDA $8ab7 ; (cwd + 24)
01:15a3 : 85 44 __ STA T1 + 1 
01:15a5 : 8d c8 8a STA $8ac8 ; (current + 1)
01:15a8 : 05 43 __ ORA T1 + 0 
01:15aa : f0 28 __ BEQ $15d4 ; (freeDir.s7 + 0)
.l6:
01:15ac : a5 43 __ LDA T1 + 0 
01:15ae : 85 1b __ STA ACCU + 0 
01:15b0 : a5 44 __ LDA T1 + 1 
01:15b2 : 85 1c __ STA ACCU + 1 
01:15b4 : a0 15 __ LDY #$15
01:15b6 : b1 43 __ LDA (T1 + 0),y 
01:15b8 : 85 02 __ STA $02 
01:15ba : c8 __ __ INY
01:15bb : b1 43 __ LDA (T1 + 0),y 
01:15bd : 85 44 __ STA T1 + 1 
01:15bf : 20 3c 7f JSR $7f3c ; (free + 0)
01:15c2 : a5 02 __ LDA $02 
01:15c4 : 85 43 __ STA T1 + 0 
01:15c6 : 05 44 __ ORA T1 + 1 
01:15c8 : d0 e2 __ BNE $15ac ; (freeDir.l6 + 0)
.s9:
01:15ca : a5 02 __ LDA $02 
01:15cc : 8d c7 8a STA $8ac7 ; (current + 0)
01:15cf : a5 44 __ LDA T1 + 1 
01:15d1 : 8d c8 8a STA $8ac8 ; (current + 1)
.s7:
01:15d4 : a9 00 __ LDA #$00
01:15d6 : 8d 9f 8a STA $8a9f ; (cwd + 0)
.s1001:
01:15d9 : 60 __ __ RTS
--------------------------------------------------------------------
dir_open: ; dir_open(u8,u8)->u8
.s0:
01:15da : a9 00 __ LDA #$00
01:15dc : 85 0d __ STA P0 
01:15de : 85 0e __ STA P1 
01:15e0 : 20 b4 2a JSR $2ab4 ; (krnio_setbnk.s0 + 0)
01:15e3 : a9 46 __ LDA #$46
01:15e5 : 85 0d __ STA P0 
01:15e7 : a9 16 __ LDA #$16
01:15e9 : 85 0e __ STA P1 
01:15eb : 20 c3 2a JSR $2ac3 ; (krnio_setnam.s0 + 0)
01:15ee : a9 02 __ LDA #$02
01:15f0 : 85 0d __ STA P0 
01:15f2 : a9 00 __ LDA #$00
01:15f4 : 85 0f __ STA P2 
01:15f6 : a5 10 __ LDA P3 ; (device + 0)
01:15f8 : 85 0e __ STA P1 
01:15fa : 20 3b 63 JSR $633b ; (krnio_open.s0 + 0)
01:15fd : 85 43 __ STA T1 + 0 
01:15ff : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
01:1602 : 85 44 __ STA T2 + 0 
01:1604 : 85 1b __ STA ACCU + 0 
01:1606 : a5 43 __ LDA T1 + 0 
01:1608 : f0 3b __ BEQ $1645 ; (dir_open.s1001 + 0)
.s4:
01:160a : a5 44 __ LDA T2 + 0 
01:160c : f0 03 __ BEQ $1611 ; (dir_open.s3 + 0)
.s1:
01:160e : 20 48 16 JSR $1648 ; (dir_close@proxy + 0)
.s3:
01:1611 : a5 43 __ LDA T1 + 0 
01:1613 : f0 2c __ BEQ $1641 ; (dir_open.s1002 + 0)
.s8:
01:1615 : a5 44 __ LDA T2 + 0 
01:1617 : d0 28 __ BNE $1641 ; (dir_open.s1002 + 0)
.s5:
01:1619 : a9 02 __ LDA #$02
01:161b : 20 dd 63 JSR $63dd ; (krnio_chkin.s1000 + 0)
01:161e : 85 43 __ STA T1 + 0 
01:1620 : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
01:1623 : 85 44 __ STA T2 + 0 
01:1625 : a5 43 __ LDA T1 + 0 
01:1627 : f0 15 __ BEQ $163e ; (dir_open.s10 + 0)
.s12:
01:1629 : a5 44 __ LDA T2 + 0 
01:162b : d0 11 __ BNE $163e ; (dir_open.s10 + 0)
.s9:
01:162d : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:1630 : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:1633 : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
01:1636 : 85 44 __ STA T2 + 0 
01:1638 : 85 1b __ STA ACCU + 0 
01:163a : 09 00 __ ORA #$00
01:163c : f0 07 __ BEQ $1645 ; (dir_open.s1001 + 0)
.s10:
01:163e : 20 48 16 JSR $1648 ; (dir_close@proxy + 0)
.s1002:
01:1641 : a5 44 __ LDA T2 + 0 
01:1643 : 85 1b __ STA ACCU + 0 
.s1001:
01:1645 : 60 __ __ RTS
--------------------------------------------------------------------
01:1646 : __ __ __ BYT 24 00                                           : $.
--------------------------------------------------------------------
dir_close@proxy: ; dir_close@proxy
01:1648 : a9 02 __ LDA #$02
01:164a : 85 0e __ STA P1 
--------------------------------------------------------------------
dir_close: ; dir_close(u8)->void
.s0:
01:164c : 20 fa 61 JSR $61fa ; (krnio_clrchn.s0 + 0)
01:164f : a5 0e __ LDA P1 ; (lfn + 0)
01:1651 : 4c c3 ff JMP $ffc3 
--------------------------------------------------------------------
dir_readentry: ; dir_readentry(const u8,struct DirEntry*)->u8
.s0:
01:1654 : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:1657 : a5 1b __ LDA ACCU + 0 
01:1659 : d0 04 __ BNE $165f ; (dir_readentry.s3 + 0)
.s1:
01:165b : a9 01 __ LDA #$01
01:165d : d0 59 __ BNE $16b8 ; (dir_readentry.s1095 + 0)
.s3:
01:165f : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
01:1662 : 09 00 __ ORA #$00
01:1664 : f0 03 __ BEQ $1669 ; (dir_readentry.s7 + 0)
01:1666 : 4c 8d 18 JMP $188d ; (dir_readentry.s5 + 0)
.s7:
01:1669 : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:166c : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:166f : a5 1b __ LDA ACCU + 0 
01:1671 : 85 43 __ STA T0 + 0 
01:1673 : a0 11 __ LDY #$11
01:1675 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1677 : a5 1c __ LDA ACCU + 1 
01:1679 : 85 44 __ STA T0 + 1 
01:167b : c8 __ __ INY
01:167c : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:167e : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:1681 : a5 1b __ LDA ACCU + 0 
01:1683 : 05 44 __ ORA T0 + 1 
01:1685 : a0 12 __ LDY #$12
01:1687 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1689 : a5 43 __ LDA T0 + 0 
01:168b : 88 __ __ DEY
01:168c : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:168e : a9 00 __ LDA #$00
01:1690 : a2 51 __ LDX #$51
.l1002:
01:1692 : ca __ __ DEX
01:1693 : 9d 90 88 STA $8890,x ; (linebuffer + 0)
01:1696 : d0 fa __ BNE $1692 ; (dir_readentry.l1002 + 0)
.s1003:
01:1698 : 85 45 __ STA T1 + 0 
.l10:
01:169a : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:169d : a5 1b __ LDA ACCU + 0 
01:169f : f0 1a __ BEQ $16bb ; (dir_readentry.s11 + 0)
.s14:
01:16a1 : a6 45 __ LDX T1 + 0 
01:16a3 : e0 51 __ CPX #$51
01:16a5 : b0 05 __ BCS $16ac ; (dir_readentry.s281 + 0)
.s16:
01:16a7 : 9d 90 88 STA $8890,x ; (linebuffer + 0)
01:16aa : e6 45 __ INC T1 + 0 
.s281:
01:16ac : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
01:16af : 09 00 __ ORA #$00
01:16b1 : f0 e7 __ BEQ $169a ; (dir_readentry.l10 + 0)
.s19:
01:16b3 : 20 fa 61 JSR $61fa ; (krnio_clrchn.s0 + 0)
01:16b6 : a9 02 __ LDA #$02
.s1095:
01:16b8 : 85 1b __ STA ACCU + 0 
.s1001:
01:16ba : 60 __ __ RTS
.s11:
01:16bb : ad 90 88 LDA $8890 ; (linebuffer + 0)
01:16be : c9 42 __ CMP #$42
01:16c0 : d0 07 __ BNE $16c9 ; (dir_readentry.s25 + 0)
.s23:
01:16c2 : a9 64 __ LDA #$64
01:16c4 : a0 13 __ LDY #$13
01:16c6 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:16c8 : 60 __ __ RTS
.s25:
01:16c9 : a6 45 __ LDX T1 + 0 
01:16cb : e0 05 __ CPX #$05
01:16cd : b0 04 __ BCS $16d3 ; (dir_readentry.l1098 + 0)
.s27:
01:16cf : a9 03 __ LDA #$03
01:16d1 : 90 e5 __ BCC $16b8 ; (dir_readentry.s1095 + 0)
.l1098:
01:16d3 : bd 90 88 LDA $8890,x ; (linebuffer + 0)
01:16d6 : f0 0b __ BEQ $16e3 ; (dir_readentry.s35 + 0)
.s39:
01:16d8 : c9 20 __ CMP #$20
01:16da : f0 07 __ BEQ $16e3 ; (dir_readentry.s35 + 0)
.s38:
01:16dc : c9 a0 __ CMP #$a0
01:16de : f0 03 __ BEQ $16e3 ; (dir_readentry.s35 + 0)
01:16e0 : 4c 87 18 JMP $1887 ; (dir_readentry.s37 + 0)
.s35:
01:16e3 : a9 00 __ LDA #$00
01:16e5 : 9d 90 88 STA $8890,x ; (linebuffer + 0)
01:16e8 : ca __ __ DEX
01:16e9 : d0 e8 __ BNE $16d3 ; (dir_readentry.l1098 + 0)
.s1097:
01:16eb : 85 45 __ STA T1 + 0 
.s127:
01:16ed : a2 00 __ LDX #$00
.l46:
01:16ef : bd 90 88 LDA $8890,x ; (linebuffer + 0)
01:16f2 : c9 22 __ CMP #$22
01:16f4 : f0 05 __ BEQ $16fb ; (dir_readentry.s1100 + 0)
.s44:
01:16f6 : e8 __ __ INX
01:16f7 : e0 51 __ CPX #$51
01:16f9 : 90 f4 __ BCC $16ef ; (dir_readentry.l46 + 0)
.s1100:
01:16fb : e8 __ __ INX
01:16fc : 86 1b __ STX ACCU + 0 
01:16fe : e0 51 __ CPX #$51
01:1700 : b0 17 __ BCS $1719 ; (dir_readentry.s50 + 0)
.s126:
01:1702 : a0 00 __ LDY #$00
.l52:
01:1704 : bd 90 88 LDA $8890,x ; (linebuffer + 0)
01:1707 : c9 22 __ CMP #$22
01:1709 : f0 0c __ BEQ $1717 ; (dir_readentry.s1103 + 0)
.s51:
01:170b : c0 10 __ CPY #$10
01:170d : b0 08 __ BCS $1717 ; (dir_readentry.s1103 + 0)
.s48:
01:170f : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1711 : e8 __ __ INX
01:1712 : e0 51 __ CPX #$51
01:1714 : c8 __ __ INY
01:1715 : 90 ed __ BCC $1704 ; (dir_readentry.l52 + 0)
.s1103:
01:1717 : 86 1b __ STX ACCU + 0 
.s50:
01:1719 : a6 45 __ LDX T1 + 0 
01:171b : 86 43 __ STX T0 + 0 
01:171d : bd 8d 88 LDA $888d,x ; (multab + 141)
01:1720 : 85 45 __ STA T1 + 0 
01:1722 : c9 50 __ CMP #$50
01:1724 : d0 13 __ BNE $1739 ; (dir_readentry.s54 + 0)
.s57:
01:1726 : bd 8e 88 LDA $888e,x ; (multab + 142)
01:1729 : c9 52 __ CMP #$52
01:172b : d0 0c __ BNE $1739 ; (dir_readentry.s54 + 0)
.s56:
01:172d : bd 8f 88 LDA $888f,x ; (multab + 143)
01:1730 : c9 47 __ CMP #$47
01:1732 : d0 05 __ BNE $1739 ; (dir_readentry.s54 + 0)
.s53:
01:1734 : a9 11 __ LDA #$11
01:1736 : 4c 6e 18 JMP $186e ; (dir_readentry.s55 + 0)
.s54:
01:1739 : a5 45 __ LDA T1 + 0 
01:173b : c9 53 __ CMP #$53
01:173d : d0 15 __ BNE $1754 ; (dir_readentry.s59 + 0)
.s62:
01:173f : a6 43 __ LDX T0 + 0 
01:1741 : bd 8e 88 LDA $888e,x ; (multab + 142)
01:1744 : c9 45 __ CMP #$45
01:1746 : d0 0c __ BNE $1754 ; (dir_readentry.s59 + 0)
.s61:
01:1748 : bd 8f 88 LDA $888f,x ; (multab + 143)
01:174b : c9 51 __ CMP #$51
01:174d : d0 05 __ BNE $1754 ; (dir_readentry.s59 + 0)
.s58:
01:174f : a9 10 __ LDA #$10
01:1751 : 4c 6e 18 JMP $186e ; (dir_readentry.s55 + 0)
.s59:
01:1754 : a5 45 __ LDA T1 + 0 
01:1756 : c9 55 __ CMP #$55
01:1758 : d0 15 __ BNE $176f ; (dir_readentry.s64 + 0)
.s67:
01:175a : a6 43 __ LDX T0 + 0 
01:175c : bd 8e 88 LDA $888e,x ; (multab + 142)
01:175f : c9 53 __ CMP #$53
01:1761 : d0 0c __ BNE $176f ; (dir_readentry.s64 + 0)
.s66:
01:1763 : bd 8f 88 LDA $888f,x ; (multab + 143)
01:1766 : c9 52 __ CMP #$52
01:1768 : d0 05 __ BNE $176f ; (dir_readentry.s64 + 0)
.s63:
01:176a : a9 12 __ LDA #$12
01:176c : 4c 6e 18 JMP $186e ; (dir_readentry.s55 + 0)
.s64:
01:176f : a5 45 __ LDA T1 + 0 
01:1771 : c9 44 __ CMP #$44
01:1773 : f0 04 __ BEQ $1779 ; (dir_readentry.s1006 + 0)
.s1007:
01:1775 : a2 00 __ LDX #$00
01:1777 : f0 17 __ BEQ $1790 ; (dir_readentry.s69 + 0)
.s1006:
01:1779 : a4 43 __ LDY T0 + 0 
01:177b : b9 8e 88 LDA $888e,y ; (multab + 142)
01:177e : a2 01 __ LDX #$01
01:1780 : c9 45 __ CMP #$45
01:1782 : d0 0c __ BNE $1790 ; (dir_readentry.s69 + 0)
.s71:
01:1784 : b9 8f 88 LDA $888f,y ; (multab + 143)
01:1787 : c9 4c __ CMP #$4c
01:1789 : d0 05 __ BNE $1790 ; (dir_readentry.s69 + 0)
.s68:
01:178b : a9 00 __ LDA #$00
01:178d : 4c 6e 18 JMP $186e ; (dir_readentry.s55 + 0)
.s69:
01:1790 : a5 45 __ LDA T1 + 0 
01:1792 : c9 52 __ CMP #$52
01:1794 : d0 15 __ BNE $17ab ; (dir_readentry.s74 + 0)
.s77:
01:1796 : a4 43 __ LDY T0 + 0 
01:1798 : b9 8e 88 LDA $888e,y ; (multab + 142)
01:179b : c9 45 __ CMP #$45
01:179d : d0 0c __ BNE $17ab ; (dir_readentry.s74 + 0)
.s76:
01:179f : b9 8f 88 LDA $888f,y ; (multab + 143)
01:17a2 : c9 4c __ CMP #$4c
01:17a4 : d0 05 __ BNE $17ab ; (dir_readentry.s74 + 0)
.s73:
01:17a6 : a9 13 __ LDA #$13
01:17a8 : 4c 6e 18 JMP $186e ; (dir_readentry.s55 + 0)
.s74:
01:17ab : a5 45 __ LDA T1 + 0 
01:17ad : c9 43 __ CMP #$43
01:17af : d0 15 __ BNE $17c6 ; (dir_readentry.s79 + 0)
.s82:
01:17b1 : a4 43 __ LDY T0 + 0 
01:17b3 : b9 8e 88 LDA $888e,y ; (multab + 142)
01:17b6 : c9 42 __ CMP #$42
01:17b8 : d0 0c __ BNE $17c6 ; (dir_readentry.s79 + 0)
.s81:
01:17ba : b9 8f 88 LDA $888f,y ; (multab + 143)
01:17bd : c9 4d __ CMP #$4d
01:17bf : d0 05 __ BNE $17c6 ; (dir_readentry.s79 + 0)
.s78:
01:17c1 : a9 01 __ LDA #$01
01:17c3 : 4c 6e 18 JMP $186e ; (dir_readentry.s55 + 0)
.s79:
01:17c6 : 8a __ __ TXA
01:17c7 : f0 15 __ BEQ $17de ; (dir_readentry.s84 + 0)
.s87:
01:17c9 : a6 43 __ LDX T0 + 0 
01:17cb : bd 8e 88 LDA $888e,x ; (multab + 142)
01:17ce : c9 49 __ CMP #$49
01:17d0 : d0 0c __ BNE $17de ; (dir_readentry.s84 + 0)
.s86:
01:17d2 : bd 8f 88 LDA $888f,x ; (multab + 143)
01:17d5 : c9 52 __ CMP #$52
01:17d7 : d0 05 __ BNE $17de ; (dir_readentry.s84 + 0)
.s83:
01:17d9 : a9 02 __ LDA #$02
01:17db : 4c 6e 18 JMP $186e ; (dir_readentry.s55 + 0)
.s84:
01:17de : a5 45 __ LDA T1 + 0 
01:17e0 : c9 56 __ CMP #$56
01:17e2 : d0 14 __ BNE $17f8 ; (dir_readentry.s89 + 0)
.s92:
01:17e4 : a6 43 __ LDX T0 + 0 
01:17e6 : bd 8e 88 LDA $888e,x ; (multab + 142)
01:17e9 : c9 52 __ CMP #$52
01:17eb : d0 0b __ BNE $17f8 ; (dir_readentry.s89 + 0)
.s91:
01:17ed : bd 8f 88 LDA $888f,x ; (multab + 143)
01:17f0 : c9 50 __ CMP #$50
01:17f2 : d0 04 __ BNE $17f8 ; (dir_readentry.s89 + 0)
.s88:
01:17f4 : a9 14 __ LDA #$14
01:17f6 : d0 76 __ BNE $186e ; (dir_readentry.s55 + 0)
.s89:
01:17f8 : a5 45 __ LDA T1 + 0 
01:17fa : c9 4c __ CMP #$4c
01:17fc : d0 14 __ BNE $1812 ; (dir_readentry.s94 + 0)
.s97:
01:17fe : a6 43 __ LDX T0 + 0 
01:1800 : bd 8e 88 LDA $888e,x ; (multab + 142)
01:1803 : c9 4e __ CMP #$4e
01:1805 : d0 0b __ BNE $1812 ; (dir_readentry.s94 + 0)
.s96:
01:1807 : bd 8f 88 LDA $888f,x ; (multab + 143)
01:180a : c9 4b __ CMP #$4b
01:180c : d0 04 __ BNE $1812 ; (dir_readentry.s94 + 0)
.s93:
01:180e : a9 03 __ LDA #$03
01:1810 : d0 5c __ BNE $186e ; (dir_readentry.s55 + 0)
.s94:
01:1812 : a9 05 __ LDA #$05
01:1814 : a0 13 __ LDY #$13
01:1816 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1818 : a6 1b __ LDX ACCU + 0 
01:181a : bd 90 88 LDA $8890,x ; (linebuffer + 0)
01:181d : c9 22 __ CMP #$22
01:181f : d0 02 __ BNE $1823 ; (dir_readentry.s100 + 0)
.s98:
01:1821 : e6 1b __ INC ACCU + 0 
.s100:
01:1823 : a9 00 __ LDA #$00
01:1825 : 85 45 __ STA T1 + 0 
01:1827 : a6 1b __ LDX ACCU + 0 
01:1829 : bd 90 88 LDA $8890,x ; (linebuffer + 0)
01:182c : c9 20 __ CMP #$20
01:182e : d0 02 __ BNE $1832 ; (dir_readentry.l105 + 0)
.s101:
01:1830 : e6 1b __ INC ACCU + 0 
.l105:
01:1832 : a6 1b __ LDX ACCU + 0 
01:1834 : bd 90 88 LDA $8890,x ; (linebuffer + 0)
01:1837 : f0 05 __ BEQ $183e ; (dir_readentry.s207 + 0)
.s108:
01:1839 : a6 45 __ LDX T1 + 0 
01:183b : 9d c0 8a STA $8ac0,x ; (disk_id_buf + 0)
.s207:
01:183e : e6 1b __ INC ACCU + 0 
01:1840 : e6 45 __ INC T1 + 0 
01:1842 : a6 45 __ LDX T1 + 0 
01:1844 : e0 05 __ CPX #$05
01:1846 : 90 ea __ BCC $1832 ; (dir_readentry.l105 + 0)
.s107:
01:1848 : a9 00 __ LDA #$00
01:184a : 9d c0 8a STA $8ac0,x ; (disk_id_buf + 0)
01:184d : a0 0f __ LDY #$0f
01:184f : b1 13 __ LDA (P6),y ; (l_dirent + 0)
01:1851 : f0 08 __ BEQ $185b ; (dir_readentry.l115 + 0)
.s119:
01:1853 : c9 20 __ CMP #$20
01:1855 : f0 04 __ BEQ $185b ; (dir_readentry.l115 + 0)
.s118:
01:1857 : c9 a0 __ CMP #$a0
01:1859 : d0 0e __ BNE $1869 ; (dir_readentry.s1096 + 0)
.l115:
01:185b : a9 00 __ LDA #$00
01:185d : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:185f : 88 __ __ DEY
01:1860 : f0 07 __ BEQ $1869 ; (dir_readentry.s1096 + 0)
.s112:
01:1862 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
01:1864 : f0 f5 __ BEQ $185b ; (dir_readentry.l115 + 0)
01:1866 : 4c 53 18 JMP $1853 ; (dir_readentry.s119 + 0)
.s1096:
01:1869 : a9 00 __ LDA #$00
01:186b : 4c b8 16 JMP $16b8 ; (dir_readentry.s1095 + 0)
.s55:
01:186e : a0 13 __ LDY #$13
01:1870 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1872 : a6 1b __ LDX ACCU + 0 
01:1874 : bd 8c 88 LDA $888c,x ; (multab + 140)
01:1877 : c9 3c __ CMP #$3c
01:1879 : d0 04 __ BNE $187f ; (dir_readentry.s165 + 0)
.s164:
01:187b : a9 01 __ LDA #$01
01:187d : d0 02 __ BNE $1881 ; (dir_readentry.s1093 + 0)
.s165:
01:187f : a9 03 __ LDA #$03
.s1093:
01:1881 : a0 14 __ LDY #$14
01:1883 : 91 13 __ STA (P6),y ; (l_dirent + 0)
01:1885 : d0 e2 __ BNE $1869 ; (dir_readentry.s1096 + 0)
.s37:
01:1887 : e8 __ __ INX
01:1888 : 86 45 __ STX T1 + 0 
01:188a : 4c ed 16 JMP $16ed ; (dir_readentry.s127 + 0)
.s5:
01:188d : a9 07 __ LDA #$07
01:188f : 4c b8 16 JMP $16b8 ; (dir_readentry.s1095 + 0)
--------------------------------------------------------------------
dir_validentry: ; dir_validentry(u8)->u8
.s0:
01:1892 : ad c7 8a LDA $8ac7 ; (current + 0)
01:1895 : 85 43 __ STA T0 + 0 
01:1897 : 85 0d __ STA P0 
01:1899 : ad c8 8a LDA $8ac8 ; (current + 1)
01:189c : 85 44 __ STA T0 + 1 
01:189e : 85 0e __ STA P1 
01:18a0 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
01:18a3 : a0 13 __ LDY #$13
01:18a5 : b1 43 __ LDA (T0 + 0),y 
01:18a7 : c9 11 __ CMP #$11
01:18a9 : f0 06 __ BEQ $18b1 ; (dir_validentry.s3 + 0)
.s4:
01:18ab : a5 13 __ LDA P6 ; (filter + 0)
01:18ad : c9 02 __ CMP #$02
01:18af : 90 61 __ BCC $1912 ; (dir_validentry.s1024 + 0)
.s3:
01:18b1 : b1 43 __ LDA (T0 + 0),y 
01:18b3 : c9 10 __ CMP #$10
01:18b5 : d0 05 __ BNE $18bc ; (dir_validentry.s9 + 0)
.s1018:
01:18b7 : a5 13 __ LDA P6 ; (filter + 0)
01:18b9 : 4c c2 18 JMP $18c2 ; (dir_validentry.s8 + 0)
.s9:
01:18bc : a5 13 __ LDA P6 ; (filter + 0)
01:18be : c9 02 __ CMP #$02
01:18c0 : f0 50 __ BEQ $1912 ; (dir_validentry.s1024 + 0)
.s8:
01:18c2 : c9 01 __ CMP #$01
01:18c4 : d0 50 __ BNE $1916 ; (dir_validentry.s1021 + 0)
.s11:
01:18c6 : a5 1b __ LDA ACCU + 0 
01:18c8 : c9 06 __ CMP #$06
01:18ca : 90 46 __ BCC $1912 ; (dir_validentry.s1024 + 0)
.s14:
01:18cc : a9 00 __ LDA #$00
01:18ce : 8d ed ab STA $abed ; (palette_draw@stack + 14)
01:18d1 : 8d ee ab STA $abee ; (palette_draw@stack + 15)
01:18d4 : 8d ef ab STA $abef ; (buffer + 12)
01:18d7 : 8d f0 ab STA $abf0 ; (buffer + 13)
01:18da : 8d f1 ab STA $abf1 ; (buffer + 14)
01:18dd : 8d f2 ab STA $abf2 ; (buffer + 15)
01:18e0 : a5 1b __ LDA ACCU + 0 
01:18e2 : e9 05 __ SBC #$05
01:18e4 : 18 __ __ CLC
01:18e5 : 65 0d __ ADC P0 
01:18e7 : 85 43 __ STA T0 + 0 
01:18e9 : 90 02 __ BCC $18ed ; (dir_validentry.s1020 + 0)
.s1019:
01:18eb : e6 44 __ INC T0 + 1 
.s1020:
01:18ed : a0 00 __ LDY #$00
.l1016:
01:18ef : b1 43 __ LDA (T0 + 0),y 
01:18f1 : 99 ed ab STA $abed,y ; (palette_draw@stack + 14)
01:18f4 : c8 __ __ INY
01:18f5 : c0 05 __ CPY #$05
01:18f7 : 90 f6 __ BCC $18ef ; (dir_validentry.l1016 + 0)
.s1017:
01:18f9 : a9 ed __ LDA #$ed
01:18fb : 85 0d __ STA P0 
01:18fd : a9 ab __ LDA #$ab
01:18ff : 85 0e __ STA P1 
01:1901 : a9 1b __ LDA #$1b
01:1903 : 85 0f __ STA P2 
01:1905 : a9 19 __ LDA #$19
01:1907 : 85 10 __ STA P3 
01:1909 : 20 3b 6f JSR $6f3b ; (strcmp.s0 + 0)
01:190c : a5 1b __ LDA ACCU + 0 
01:190e : 05 1c __ ORA ACCU + 1 
01:1910 : f0 04 __ BEQ $1916 ; (dir_validentry.s1021 + 0)
.s1024:
01:1912 : a9 00 __ LDA #$00
01:1914 : f0 02 __ BEQ $1918 ; (dir_validentry.s1001 + 0)
.s1021:
01:1916 : a9 01 __ LDA #$01
.s1001:
01:1918 : 85 1b __ STA ACCU + 0 
01:191a : 60 __ __ RTS
--------------------------------------------------------------------
01:191b : __ __ __ BYT 2e 50 52 4f 4a 00                               : .PROJ.
--------------------------------------------------------------------
fileTypeToStr: ; fileTypeToStr(u8)->const u8*
.s1000:
01:1921 : aa __ __ TAX
.s0:
01:1922 : a8 __ __ TAY
01:1923 : 29 10 __ AND #$10
01:1925 : d0 43 __ BNE $196a ; (fileTypeToStr.s1 + 0)
.s2:
01:1927 : e0 06 __ CPX #$06
01:1929 : b0 0e __ BCS $1939 ; (fileTypeToStr.s3 + 0)
.s8:
01:192b : 98 __ __ TYA
01:192c : 0a __ __ ASL
01:192d : aa __ __ TAX
01:192e : bd e9 82 LDA $82e9,x ; (oth_types + 0)
01:1931 : 85 1b __ STA ACCU + 0 
01:1933 : bd ea 82 LDA $82ea,x ; (oth_types + 1)
01:1936 : 4c 67 19 JMP $1967 ; (fileTypeToStr.s1001 + 0)
.s3:
01:1939 : a9 3f __ LDA #$3f
01:193b : 8d c9 8a STA $8ac9 ; (bad_type + 0)
01:193e : ad f5 82 LDA $82f5 ; (value2hex + 0)
01:1941 : 85 1b __ STA ACCU + 0 
01:1943 : ad f6 82 LDA $82f6 ; (value2hex + 1)
01:1946 : 85 1c __ STA ACCU + 1 
01:1948 : 8a __ __ TXA
01:1949 : 4a __ __ LSR
01:194a : 4a __ __ LSR
01:194b : 4a __ __ LSR
01:194c : 4a __ __ LSR
01:194d : a8 __ __ TAY
01:194e : b1 1b __ LDA (ACCU + 0),y 
01:1950 : 8d ca 8a STA $8aca ; (bad_type + 1)
01:1953 : 8a __ __ TXA
01:1954 : 29 0f __ AND #$0f
01:1956 : a8 __ __ TAY
01:1957 : b1 1b __ LDA (ACCU + 0),y 
01:1959 : 8d cb 8a STA $8acb ; (bad_type + 2)
01:195c : a9 00 __ LDA #$00
01:195e : 8d cc 8a STA $8acc ; (bad_type + 3)
01:1961 : a9 c9 __ LDA #$c9
01:1963 : 85 1b __ STA ACCU + 0 
01:1965 : a9 8a __ LDA #$8a
.s1001:
01:1967 : 85 1c __ STA ACCU + 1 
01:1969 : 60 __ __ RTS
.s1:
01:196a : 8a __ __ TXA
01:196b : 29 ef __ AND #$ef
01:196d : c9 05 __ CMP #$05
01:196f : aa __ __ TAX
01:1970 : b0 c7 __ BCS $1939 ; (fileTypeToStr.s3 + 0)
.s4:
01:1972 : 0a __ __ ASL
01:1973 : aa __ __ TAX
01:1974 : bd df 82 LDA $82df,x ; (reg_types + 0)
01:1977 : 85 1b __ STA ACCU + 0 
01:1979 : bd e0 82 LDA $82e0,x ; (reg_types + 1)
01:197c : 4c 67 19 JMP $1967 ; (fileTypeToStr.s1001 + 0)
--------------------------------------------------------------------
bnk_io_read@proxy: ; bnk_io_read@proxy
01:197f : a5 4e __ LDA $4e 
01:1981 : 85 0e __ STA P1 
01:1983 : a5 4f __ LDA $4f 
01:1985 : 85 0f __ STA P2 
01:1987 : ad d1 8a LDA $8ad1 ; (importvars + 4)
01:198a : 85 10 __ STA P3 
01:198c : ad d2 8a LDA $8ad2 ; (importvars + 5)
01:198f : 85 11 __ STA P4 
--------------------------------------------------------------------
bnk_io_read: ; bnk_io_read(u8,u8,u8*,i16)->void
.s0:
01:1991 : ad d9 86 LDA $86d9 ; (krnio_pstatus + 1)
01:1994 : c9 40 __ CMP #$40
01:1996 : f0 0e __ BEQ $19a6 ; (bnk_io_read.s1001 + 0)
.s3:
01:1998 : ad 00 ff LDA $ff00 
01:199b : 85 43 __ STA T0 + 0 
01:199d : a9 01 __ LDA #$01
01:199f : 20 dd 63 JSR $63dd ; (krnio_chkin.s1000 + 0)
01:19a2 : 09 00 __ ORA #$00
01:19a4 : d0 01 __ BNE $19a7 ; (bnk_io_read.s5 + 0)
.s1001:
01:19a6 : 60 __ __ RTS
.s5:
01:19a7 : a5 11 __ LDA P4 ; (num + 1)
01:19a9 : 30 52 __ BMI $19fd ; (bnk_io_read.s10 + 0)
.s1007:
01:19ab : 05 10 __ ORA P3 ; (num + 0)
01:19ad : f0 4e __ BEQ $19fd ; (bnk_io_read.s10 + 0)
.s22:
01:19af : a9 00 __ LDA #$00
01:19b1 : 85 44 __ STA T2 + 0 
01:19b3 : 85 45 __ STA T2 + 1 
.l9:
01:19b5 : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
01:19b8 : a5 1b __ LDA ACCU + 0 
01:19ba : 85 46 __ STA T3 + 0 
01:19bc : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
01:19bf : 8d d9 86 STA $86d9 ; (krnio_pstatus + 1)
01:19c2 : aa __ __ TAX
01:19c3 : f0 04 __ BEQ $19c9 ; (bnk_io_read.s13 + 0)
.s14:
01:19c5 : c9 40 __ CMP #$40
01:19c7 : d0 34 __ BNE $19fd ; (bnk_io_read.s10 + 0)
.s13:
01:19c9 : a9 7f __ LDA #$7f
01:19cb : 8d 00 ff STA $ff00 
01:19ce : a5 44 __ LDA T2 + 0 
01:19d0 : 85 1b __ STA ACCU + 0 
01:19d2 : 18 __ __ CLC
01:19d3 : a5 0f __ LDA P2 ; (data + 1)
01:19d5 : 65 45 __ ADC T2 + 1 
01:19d7 : 85 1c __ STA ACCU + 1 
01:19d9 : a5 46 __ LDA T3 + 0 
01:19db : a4 0e __ LDY P1 ; (data + 0)
01:19dd : 91 1b __ STA (ACCU + 0),y 
01:19df : a5 43 __ LDA T0 + 0 
01:19e1 : 8d 00 ff STA $ff00 
01:19e4 : 8a __ __ TXA
01:19e5 : d0 16 __ BNE $19fd ; (bnk_io_read.s10 + 0)
.s8:
01:19e7 : 24 11 __ BIT P4 ; (num + 1)
01:19e9 : 30 12 __ BMI $19fd ; (bnk_io_read.s10 + 0)
.s1004:
01:19eb : e6 44 __ INC T2 + 0 
01:19ed : d0 02 __ BNE $19f1 ; (bnk_io_read.s1011 + 0)
.s1010:
01:19ef : e6 45 __ INC T2 + 1 
.s1011:
01:19f1 : a5 45 __ LDA T2 + 1 
01:19f3 : c5 11 __ CMP P4 ; (num + 1)
01:19f5 : d0 04 __ BNE $19fb ; (bnk_io_read.s1003 + 0)
.s1002:
01:19f7 : a5 44 __ LDA T2 + 0 
01:19f9 : c5 10 __ CMP P3 ; (num + 0)
.s1003:
01:19fb : 90 b8 __ BCC $19b5 ; (bnk_io_read.l9 + 0)
.s10:
01:19fd : 4c cc ff JMP $ffcc 
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1a00 : a5 53 __ LDA $53 
01:1a02 : 85 0f __ STA P2 
01:1a04 : a9 01 __ LDA #$01
01:1a06 : 85 10 __ STA P3 
01:1a08 : a9 00 __ LDA #$00
01:1a0a : 85 11 __ STA P4 
01:1a0c : a9 00 __ LDA #$00
01:1a0e : 85 13 __ STA P6 
01:1a10 : a9 89 __ LDA #$89
01:1a12 : 85 14 __ STA P7 
01:1a14 : 4c 6c 13 JMP $136c ; (bnk_load.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1a17 : ad 97 87 LDA $8797 ; (vdc_state + 8)
01:1a1a : 85 0f __ STA P2 
01:1a1c : ad 98 87 LDA $8798 ; (vdc_state + 9)
01:1a1f : 85 10 __ STA P3 
01:1a21 : a9 7f __ LDA #$7f
01:1a23 : 85 11 __ STA P4 
01:1a25 : a9 00 __ LDA #$00
01:1a27 : 85 12 __ STA P5 
01:1a29 : a9 d0 __ LDA #$d0
01:1a2b : 85 14 __ STA P7 
01:1a2d : a9 0f __ LDA #$0f
01:1a2f : 85 15 __ STA P8 
01:1a31 : 4c b5 13 JMP $13b5 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1a34 : a9 0e __ LDA #$0e
01:1a36 : 85 11 __ STA P4 
01:1a38 : a9 90 __ LDA #$90
01:1a3a : 85 12 __ STA P5 
01:1a3c : a9 88 __ LDA #$88
01:1a3e : 85 13 __ STA P6 
01:1a40 : a9 00 __ LDA #$00
01:1a42 : 85 15 __ STA P8 
01:1a44 : 4c b5 13 JMP $13b5 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1a47 : a5 05 __ LDA WORK + 2 
01:1a49 : 85 0e __ STA P1 
01:1a4b : 4c 10 14 JMP $1410 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1a4e : a9 0e __ LDA #$0e
01:1a50 : 85 0d __ STA P0 
01:1a52 : a9 90 __ LDA #$90
01:1a54 : 85 0e __ STA P1 
01:1a56 : a9 88 __ LDA #$88
01:1a58 : 85 0f __ STA P2 
01:1a5a : a5 14 __ LDA P7 
01:1a5c : 85 12 __ STA P5 
01:1a5e : a9 00 __ LDA #$00
01:1a60 : 85 13 __ STA P6 
01:1a62 : 4c 10 14 JMP $1410 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_memset@proxy: ; bnk_memset@proxy
01:1a65 : a5 05 __ LDA WORK + 2 
01:1a67 : 85 10 __ STA P3 
01:1a69 : a5 06 __ LDA WORK + 3 
01:1a6b : 85 11 __ STA P4 
01:1a6d : 4c e0 14 JMP $14e0 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
bnk_memset@proxy: ; bnk_memset@proxy
01:1a70 : a9 20 __ LDA #$20
01:1a72 : 85 0f __ STA P2 
01:1a74 : a5 14 __ LDA P7 
01:1a76 : 85 10 __ STA P3 
01:1a78 : a5 59 __ LDA $59 
01:1a7a : 85 11 __ STA P4 
01:1a7c : 4c e0 14 JMP $14e0 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1a7f : ad 9f 87 LDA $879f ; (vdc_state + 16)
01:1a82 : 85 0f __ STA P2 
01:1a84 : ad a0 87 LDA $87a0 ; (vdc_state + 17)
01:1a87 : 85 10 __ STA P3 
01:1a89 : a9 01 __ LDA #$01
01:1a8b : 85 15 __ STA P8 
01:1a8d : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1a90 : ad a1 87 LDA $87a1 ; (vdc_state + 18)
01:1a93 : 85 0f __ STA P2 
01:1a95 : ad a2 87 LDA $87a2 ; (vdc_state + 19)
01:1a98 : 85 10 __ STA P3 
01:1a9a : a9 50 __ LDA #$50
01:1a9c : 85 13 __ STA P6 
01:1a9e : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1aa1 : a9 40 __ LDA #$40
01:1aa3 : 85 13 __ STA P6 
01:1aa5 : a9 01 __ LDA #$01
01:1aa7 : 85 15 __ STA P8 
01:1aa9 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1aac : a9 50 __ LDA #$50
01:1aae : 85 13 __ STA P6 
01:1ab0 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1ab3 : a9 40 __ LDA #$40
01:1ab5 : 85 13 __ STA P6 
01:1ab7 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
palette: ; palette()->void
.s1000:
02:ac00 : a2 06 __ LDX #$06
02:ac02 : b5 53 __ LDA T0 + 0,x 
02:ac04 : 9d c8 ab STA $abc8,x ; (buff + 35)
02:ac07 : ca __ __ DEX
02:ac08 : 10 f8 __ BPL $ac02 ; (palette.s1000 + 2)
.s0:
02:ac0a : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
02:ac0d : 8d f6 87 STA $87f6 ; (palettechar + 0)
02:ac10 : a2 ff __ LDX #$ff
.l1002:
02:ac12 : e8 __ __ INX
02:ac13 : bd 36 af LDA $af36,x 
02:ac16 : 9d e1 88 STA $88e1,x ; (programmode + 0)
02:ac19 : d0 f7 __ BNE $ac12 ; (palette.l1002 + 0)
.s1003:
02:ac1b : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
02:ac1e : 85 53 __ STA T0 + 0 
02:ac20 : 20 f3 4a JSR $4af3 ; (hidecursor.s0 + 0)
02:ac23 : 20 3e af JSR $af3e ; (palette_draw.s1000 + 0)
02:ac26 : ad c9 82 LDA $82c9 ; (colsel + 0)
02:ac29 : 18 __ __ CLC
02:ac2a : 69 2d __ ADC #$2d
02:ac2c : 8d b7 87 STA $87b7 ; (canvas + 15)
02:ac2f : ae c7 82 LDX $82c7 ; (rowsel + 0)
02:ac32 : e8 __ __ INX
02:ac33 : e8 __ __ INX
02:ac34 : 8e b8 87 STX $87b8 ; (canvas + 16)
02:ac37 : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
02:ac3a : a5 53 __ LDA T0 + 0 
02:ac3c : 38 __ __ SEC
02:ac3d : e9 80 __ SBC #$80
02:ac3f : 85 54 __ STA T1 + 0 
02:ac41 : ad fe 86 LDA $86fe ; (showbar + 0)
02:ac44 : f0 03 __ BEQ $ac49 ; (palette.l6 + 0)
.l4:
02:ac46 : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.l6:
02:ac49 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
02:ac4c : a5 1b __ LDA ACCU + 0 
02:ac4e : 85 55 __ STA T2 + 0 
02:ac50 : c9 56 __ CMP #$56
02:ac52 : d0 2e __ BNE $ac82 ; (palette.s73 + 0)
.s57:
02:ac54 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:ac57 : 20 ce b0 JSR $b0ce ; (palette_returnscreencode.s0 + 0)
02:ac5a : a9 00 __ LDA #$00
02:ac5c : cd ff 7b CMP $7bff ; (visualmap + 0)
02:ac5f : 2a __ __ ROL
02:ac60 : 8d ff 7b STA $7bff ; (visualmap + 0)
02:ac63 : 20 3e af JSR $af3e ; (palette_draw.s1000 + 0)
02:ac66 : ad c9 82 LDA $82c9 ; (colsel + 0)
02:ac69 : 18 __ __ CLC
02:ac6a : 69 2d __ ADC #$2d
02:ac6c : 8d b7 87 STA $87b7 ; (canvas + 15)
02:ac6f : ae c7 82 LDX $82c7 ; (rowsel + 0)
02:ac72 : e8 __ __ INX
02:ac73 : e8 __ __ INX
02:ac74 : 8e b8 87 STX $87b8 ; (canvas + 16)
02:ac77 : a9 b3 __ LDA #$b3
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
02:aca6 : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:aca9 : 85 59 __ STA T4 + 1 
02:acab : ad c7 82 LDA $82c7 ; (rowsel + 0)
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
02:acbe : ad fe 86 LDA $86fe ; (showbar + 0)
02:acc1 : f0 86 __ BEQ $ac49 ; (palette.l6 + 0)
02:acc3 : 4c 46 ac JMP $ac46 ; (palette.l4 + 0)
.s3:
02:acc6 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:acc9 : ad eb 86 LDA $86eb ; (screen_col + 0)
02:accc : 8d b7 87 STA $87b7 ; (canvas + 15)
02:accf : ad ed 86 LDA $86ed ; (screen_row + 0)
02:acd2 : 8d b8 87 STA $87b8 ; (canvas + 16)
02:acd5 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
02:acd8 : a2 ff __ LDX #$ff
.l1004:
02:acda : e8 __ __ INX
02:acdb : bd 69 b1 LDA $b169,x 
02:acde : 9d e1 88 STA $88e1,x ; (programmode + 0)
02:ace1 : d0 f7 __ BNE $acda ; (palette.l1004 + 0)
.s1001:
02:ace3 : a2 06 __ LDX #$06
02:ace5 : bd c8 ab LDA $abc8,x ; (buff + 35)
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
02:acf9 : ad f6 87 LDA $87f6 ; (palettechar + 0)
02:acfc : 85 0f __ STA P2 
02:acfe : 9d 8c 88 STA $888c,x ; (multab + 140)
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
02:ad17 : 9d 8d 88 STA $888d,x ; (multab + 141)
02:ad1a : 4a __ __ LSR
02:ad1b : a9 00 __ LDA #$00
02:ad1d : 6a __ __ ROR
02:ad1e : 65 54 __ ADC T1 + 0 
02:ad20 : 85 10 __ STA P3 
02:ad22 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
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
02:ad37 : ad c9 82 LDA $82c9 ; (colsel + 0)
02:ad3a : 0d ca 82 ORA $82ca ; (colsel + 1)
02:ad3d : f0 11 __ BEQ $ad50 ; (palette.s16 + 0)
.s15:
02:ad3f : ad c9 82 LDA $82c9 ; (colsel + 0)
02:ad42 : 18 __ __ CLC
02:ad43 : 69 ff __ ADC #$ff
02:ad45 : 8d c9 82 STA $82c9 ; (colsel + 0)
02:ad48 : ad ca 82 LDA $82ca ; (colsel + 1)
02:ad4b : 69 ff __ ADC #$ff
02:ad4d : 4c 9f ae JMP $ae9f ; (palette.s1059 + 0)
.s16:
02:ad50 : a9 1f __ LDA #$1f
02:ad52 : 8d c9 82 STA $82c9 ; (colsel + 0)
02:ad55 : a9 00 __ LDA #$00
02:ad57 : 8d ca 82 STA $82ca ; (colsel + 1)
02:ad5a : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:ad5d : 85 57 __ STA T3 + 1 
02:ad5f : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:ad62 : a8 __ __ TAY
02:ad63 : 05 57 __ ORA T3 + 1 
02:ad65 : d0 0d __ BNE $ad74 ; (palette.s18 + 0)
.s19:
02:ad67 : a9 12 __ LDA #$12
02:ad69 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:ad6c : a9 00 __ LDA #$00
02:ad6e : 8d c8 82 STA $82c8 ; (rowsel + 1)
02:ad71 : 4c a2 ae JMP $aea2 ; (palette.s1061 + 0)
.s18:
02:ad74 : 98 __ __ TYA
02:ad75 : 18 __ __ CLC
02:ad76 : 69 ff __ ADC #$ff
02:ad78 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:ad7b : aa __ __ TAX
02:ad7c : a5 57 __ LDA T3 + 1 
02:ad7e : 69 ff __ ADC #$ff
02:ad80 : 8d c8 82 STA $82c8 ; (rowsel + 1)
02:ad83 : d0 13 __ BNE $ad98 ; (palette.s23 + 0)
.s1028:
02:ad85 : e0 01 __ CPX #$01
02:ad87 : d0 03 __ BNE $ad8c ; (palette.s24 + 0)
02:ad89 : 4c a7 ae JMP $aea7 ; (palette.s21 + 0)
.s24:
02:ad8c : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:ad8f : d0 07 __ BNE $ad98 ; (palette.s23 + 0)
.s1027:
02:ad91 : e0 0a __ CPX #$0a
02:ad93 : d0 03 __ BNE $ad98 ; (palette.s23 + 0)
02:ad95 : 4c a7 ae JMP $aea7 ; (palette.s21 + 0)
.s23:
02:ad98 : 8a __ __ TXA
02:ad99 : 0d c8 82 ORA $82c8 ; (rowsel + 1)
02:ad9c : d0 0a __ BNE $ada8 ; (palette.s14 + 0)
.s25:
02:ad9e : a9 09 __ LDA #$09
02:ada0 : 8d c9 82 STA $82c9 ; (colsel + 0)
02:ada3 : a9 00 __ LDA #$00
02:ada5 : 4c 9f ae JMP $ae9f ; (palette.s1059 + 0)
.s14:
02:ada8 : a5 1b __ LDA ACCU + 0 
02:adaa : c9 11 __ CMP #$11
02:adac : d0 0f __ BNE $adbd ; (palette.s30 + 0)
.s28:
02:adae : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:adb1 : 18 __ __ CLC
02:adb2 : 69 01 __ ADC #$01
02:adb4 : a8 __ __ TAY
02:adb5 : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:adb8 : 69 00 __ ADC #$00
02:adba : 4c 03 ae JMP $ae03 ; (palette.s169 + 0)
.s30:
02:adbd : c9 91 __ CMP #$91
02:adbf : d0 48 __ BNE $ae09 ; (palette.s133 + 0)
.s31:
02:adc1 : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:adc4 : 85 57 __ STA T3 + 1 
02:adc6 : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:adc9 : a8 __ __ TAY
02:adca : 05 57 __ ORA T3 + 1 
02:adcc : d0 09 __ BNE $add7 ; (palette.s34 + 0)
.s35:
02:adce : a9 12 __ LDA #$12
02:add0 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:add3 : a9 00 __ LDA #$00
02:add5 : f0 2f __ BEQ $ae06 ; (palette.s1058 + 0)
.s34:
02:add7 : 98 __ __ TYA
02:add8 : 18 __ __ CLC
02:add9 : 69 ff __ ADC #$ff
02:addb : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:adde : a5 57 __ LDA T3 + 1 
02:ade0 : 69 ff __ ADC #$ff
02:ade2 : 8d c8 82 STA $82c8 ; (rowsel + 1)
02:ade5 : d0 22 __ BNE $ae09 ; (palette.s133 + 0)
.s1022:
02:ade7 : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:adea : c9 01 __ CMP #$01
02:adec : f0 0c __ BEQ $adfa ; (palette.s37 + 0)
.s40:
02:adee : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:adf1 : d0 16 __ BNE $ae09 ; (palette.s133 + 0)
.s1021:
02:adf3 : ad c7 82 LDA $82c7 ; (rowsel + 0)
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
02:ae03 : 8c c7 82 STY $82c7 ; (rowsel + 0)
.s1058:
02:ae06 : 8d c8 82 STA $82c8 ; (rowsel + 1)
.s133:
02:ae09 : ad ca 82 LDA $82ca ; (colsel + 1)
02:ae0c : d0 07 __ BNE $ae15 ; (palette.s44 + 0)
.s1020:
02:ae0e : a9 09 __ LDA #$09
02:ae10 : cd c9 82 CMP $82c9 ; (colsel + 0)
02:ae13 : b0 18 __ BCS $ae2d ; (palette.s43 + 0)
.s44:
02:ae15 : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:ae18 : 0d c8 82 ORA $82c8 ; (rowsel + 1)
02:ae1b : d0 10 __ BNE $ae2d ; (palette.s43 + 0)
.s41:
02:ae1d : 8d c9 82 STA $82c9 ; (colsel + 0)
02:ae20 : 8d ca 82 STA $82ca ; (colsel + 1)
02:ae23 : 8d c8 82 STA $82c8 ; (rowsel + 1)
02:ae26 : a9 02 __ LDA #$02
02:ae28 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:ae2b : d0 0c __ BNE $ae39 ; (palette.s47 + 0)
.s43:
02:ae2d : ad ca 82 LDA $82ca ; (colsel + 1)
02:ae30 : d0 10 __ BNE $ae42 ; (palette.s45 + 0)
.s1019:
02:ae32 : a9 1f __ LDA #$1f
02:ae34 : cd c9 82 CMP $82c9 ; (colsel + 0)
02:ae37 : 90 09 __ BCC $ae42 ; (palette.s45 + 0)
.s47:
02:ae39 : ac c7 82 LDY $82c7 ; (rowsel + 0)
02:ae3c : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:ae3f : 4c 5c ae JMP $ae5c ; (palette.s1057 + 0)
.s45:
02:ae42 : a9 00 __ LDA #$00
02:ae44 : 8d c9 82 STA $82c9 ; (colsel + 0)
02:ae47 : 8d ca 82 STA $82ca ; (colsel + 1)
02:ae4a : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:ae4d : 18 __ __ CLC
02:ae4e : 69 01 __ ADC #$01
02:ae50 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:ae53 : a8 __ __ TAY
02:ae54 : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:ae57 : 69 00 __ ADC #$00
02:ae59 : 8d c8 82 STA $82c8 ; (rowsel + 1)
.s1057:
02:ae5c : d0 05 __ BNE $ae63 ; (palette.s48 + 0)
.s1018:
02:ae5e : 98 __ __ TYA
02:ae5f : c0 13 __ CPY #$13
02:ae61 : 90 0a __ BCC $ae6d ; (palette.s50 + 0)
.s48:
02:ae63 : a9 00 __ LDA #$00
02:ae65 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:ae68 : 8d c8 82 STA $82c8 ; (rowsel + 1)
02:ae6b : f0 04 __ BEQ $ae71 ; (palette.s54 + 0)
.s50:
02:ae6d : c9 01 __ CMP #$01
02:ae6f : f0 0c __ BEQ $ae7d ; (palette.s51 + 0)
.s54:
02:ae71 : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:ae74 : d0 0f __ BNE $ae85 ; (palette.s53 + 0)
.s1015:
02:ae76 : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:ae79 : c9 0a __ CMP #$0a
02:ae7b : d0 08 __ BNE $ae85 ; (palette.s53 + 0)
.s51:
02:ae7d : ee c7 82 INC $82c7 ; (rowsel + 0)
02:ae80 : d0 03 __ BNE $ae85 ; (palette.s53 + 0)
.s1064:
02:ae82 : ee c8 82 INC $82c8 ; (rowsel + 1)
.s53:
02:ae85 : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
02:ae88 : ad c9 82 LDA $82c9 ; (colsel + 0)
02:ae8b : 18 __ __ CLC
02:ae8c : 69 2d __ ADC #$2d
02:ae8e : 8d b7 87 STA $87b7 ; (canvas + 15)
02:ae91 : ae c7 82 LDX $82c7 ; (rowsel + 0)
02:ae94 : e8 __ __ INX
02:ae95 : e8 __ __ INX
02:ae96 : 8e b8 87 STX $87b8 ; (canvas + 16)
02:ae99 : 20 4d 3e JSR $3e4d ; (vdcwin_cursor_toggle.s0 + 0)
02:ae9c : 4c b4 ac JMP $acb4 ; (palette.s7 + 0)
.s1059:
02:ae9f : 8d ca 82 STA $82ca ; (colsel + 1)
.s1061:
02:aea2 : a5 1b __ LDA ACCU + 0 
02:aea4 : 4c bd ad JMP $adbd ; (palette.s30 + 0)
.s21:
02:aea7 : 98 __ __ TYA
02:aea8 : 18 __ __ CLC
02:aea9 : 69 fe __ ADC #$fe
02:aeab : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:aeae : a5 57 __ LDA T3 + 1 
02:aeb0 : 69 ff __ ADC #$ff
02:aeb2 : 8d c8 82 STA $82c8 ; (rowsel + 1)
02:aeb5 : 0d c7 82 ORA $82c7 ; (rowsel + 0)
02:aeb8 : f0 03 __ BEQ $aebd ; (palette.s21 + 22)
02:aeba : 4c a8 ad JMP $ada8 ; (palette.s14 + 0)
02:aebd : 4c 9e ad JMP $ad9e ; (palette.s25 + 0)
.s9:
02:aec0 : ee c9 82 INC $82c9 ; (colsel + 0)
02:aec3 : f0 03 __ BEQ $aec8 ; (palette.s1062 + 0)
02:aec5 : 4c a8 ad JMP $ada8 ; (palette.s14 + 0)
.s1062:
02:aec8 : ee ca 82 INC $82ca ; (colsel + 1)
02:aecb : 4c a8 ad JMP $ada8 ; (palette.s14 + 0)
.s84:
02:aece : c9 8b __ CMP #$8b
02:aed0 : d0 06 __ BNE $aed8 ; (palette.s85 + 0)
.s59:
02:aed2 : 20 27 50 JSR $5027 ; (togglestatusbar.s0 + 0)
02:aed5 : 4c 25 ad JMP $ad25 ; (palette.s1060 + 0)
.s85:
02:aed8 : c9 8c __ CMP #$8c
02:aeda : f0 03 __ BEQ $aedf ; (palette.s60 + 0)
02:aedc : 4c 9e ac JMP $ac9e ; (palette.s63 + 0)
.s60:
02:aedf : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
02:aee2 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:aee5 : a9 02 __ LDA #$02
02:aee7 : 8d f8 ab STA $abf8 ; (sstack + 5)
02:aeea : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
02:aeed : 20 3e af JSR $af3e ; (palette_draw.s1000 + 0)
02:aef0 : a9 b3 __ LDA #$b3
02:aef2 : 85 0d __ STA P0 
02:aef4 : a9 87 __ LDA #$87
02:aef6 : 85 0e __ STA P1 
02:aef8 : ad c9 82 LDA $82c9 ; (colsel + 0)
02:aefb : 18 __ __ CLC
02:aefc : 69 2d __ ADC #$2d
02:aefe : 8d b7 87 STA $87b7 ; (canvas + 15)
02:af01 : ae c7 82 LDX $82c7 ; (rowsel + 0)
02:af04 : e8 __ __ INX
02:af05 : e8 __ __ INX
02:af06 : 8e b8 87 STX $87b8 ; (canvas + 16)
.s151:
02:af09 : 20 4d 3e JSR $3e4d ; (vdcwin_cursor_toggle.s0 + 0)
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
02:af1f : ad f6 87 LDA $87f6 ; (palettechar + 0)
02:af22 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
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
02:af61 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
02:af64 : 38 __ __ SEC
02:af65 : e9 80 __ SBC #$80
02:af67 : 85 53 __ STA T1 + 0 
02:af69 : 8d 96 87 STA $8796 ; (vdc_state + 7)
02:af6c : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
02:af6f : ad ff 7b LDA $7bff ; (visualmap + 0)
02:af72 : 85 54 __ STA T2 + 0 
02:af74 : d0 41 __ BNE $afb7 ; (palette_draw.s24 + 0)
.s1:
02:af76 : ad f6 87 LDA $87f6 ; (palettechar + 0)
02:af79 : 4a __ __ LSR
02:af7a : 4a __ __ LSR
02:af7b : 4a __ __ LSR
02:af7c : 4a __ __ LSR
02:af7d : 4a __ __ LSR
02:af7e : a8 __ __ TAY
02:af7f : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
02:af82 : 0a __ __ ASL
02:af83 : 85 1b __ STA ACCU + 0 
02:af85 : a9 00 __ LDA #$00
02:af87 : 8d ca 82 STA $82ca ; (colsel + 1)
02:af8a : 2a __ __ ROL
02:af8b : 06 1b __ ASL ACCU + 0 
02:af8d : 2a __ __ ROL
02:af8e : 06 1b __ ASL ACCU + 0 
02:af90 : 2a __ __ ROL
02:af91 : aa __ __ TAX
02:af92 : a5 1b __ LDA ACCU + 0 
02:af94 : 6d f5 86 ADC $86f5 ; (plotaltchar + 0)
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
02:afa6 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:afa9 : 90 01 __ BCC $afac ; (palette_draw.s1023 + 0)
.s1022:
02:afab : e8 __ __ INX
.s1023:
02:afac : 8e c8 82 STX $82c8 ; (rowsel + 1)
02:afaf : ad f6 87 LDA $87f6 ; (palettechar + 0)
02:afb2 : 29 1f __ AND #$1f
02:afb4 : 8d c9 82 STA $82c9 ; (colsel + 0)
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
02:afca : bd ec 88 LDA $88ec,x ; (favourites + 0)
02:afcd : 85 0f __ STA P2 
02:afcf : a5 52 __ LDA T0 + 0 
02:afd1 : 69 2d __ ADC #$2d
02:afd3 : 85 0d __ STA P0 
02:afd5 : bd ed 88 LDA $88ed,x ; (favourites + 1)
02:afd8 : 4a __ __ LSR
02:afd9 : a9 00 __ LDA #$00
02:afdb : 6a __ __ ROR
02:afdc : 65 53 __ ADC T1 + 0 
02:afde : 85 10 __ STA P3 
02:afe0 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
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
02:b020 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
02:b023 : a5 5a __ LDA T9 + 0 
02:b025 : 85 0e __ STA P1 
02:b027 : a5 52 __ LDA T0 + 0 
02:b029 : 85 10 __ STA P3 
02:b02b : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
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
02:b060 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
02:b063 : a5 5a __ LDA T9 + 0 
02:b065 : 85 0e __ STA P1 
02:b067 : a5 52 __ LDA T0 + 0 
02:b069 : 85 10 __ STA P3 
02:b06b : a0 00 __ LDY #$00
02:b06d : b1 56 __ LDA (T5 + 0),y 
02:b06f : 85 0f __ STA P2 
02:b071 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
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
02:b089 : cd f6 87 CMP $87f6 ; (palettechar + 0)
02:b08c : d0 33 __ BNE $b0c1 ; (palette_draw.s49 + 0)
.s19:
02:b08e : 8c ca 82 STY $82ca ; (colsel + 1)
02:b091 : a5 5c __ LDA T11 + 0 
02:b093 : 8d c9 82 STA $82c9 ; (colsel + 0)
02:b096 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
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
02:b0a8 : 6d f5 86 ADC $86f5 ; (plotaltchar + 0)
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
02:b0b8 : 8d c7 82 STA $82c7 ; (rowsel + 0)
02:b0bb : 90 01 __ BCC $b0be ; (palette_draw.s1027 + 0)
.s1026:
02:b0bd : e8 __ __ INX
.s1027:
02:b0be : 8e c8 82 STX $82c8 ; (rowsel + 1)
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
02:b0ce : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:b0d1 : 0d c8 82 ORA $82c8 ; (rowsel + 1)
02:b0d4 : d0 14 __ BNE $b0ea ; (palette_returnscreencode.s3 + 0)
.s1:
02:b0d6 : ad c9 82 LDA $82c9 ; (colsel + 0)
02:b0d9 : 0a __ __ ASL
02:b0da : aa __ __ TAX
02:b0db : bd ec 88 LDA $88ec,x ; (favourites + 0)
02:b0de : 8d f6 87 STA $87f6 ; (palettechar + 0)
02:b0e1 : bd ed 88 LDA $88ed,x ; (favourites + 1)
02:b0e4 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
02:b0e7 : 4c 17 b1 JMP $b117 ; (palette_returnscreencode.s6 + 0)
.s3:
02:b0ea : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:b0ed : d0 34 __ BNE $b123 ; (palette_returnscreencode.s11 + 0)
.s1004:
02:b0ef : a9 01 __ LDA #$01
02:b0f1 : cd c7 82 CMP $82c7 ; (rowsel + 0)
02:b0f4 : b0 21 __ BCS $b117 ; (palette_returnscreencode.s6 + 0)
.s7:
02:b0f6 : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:b0f9 : d0 28 __ BNE $b123 ; (palette_returnscreencode.s11 + 0)
.s1003:
02:b0fb : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:b0fe : c9 0a __ CMP #$0a
02:b100 : b0 15 __ BCS $b117 ; (palette_returnscreencode.s6 + 0)
.s4:
02:b102 : a9 00 __ LDA #$00
02:b104 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
02:b107 : 85 1c __ STA ACCU + 1 
02:b109 : ae c7 82 LDX $82c7 ; (rowsel + 0)
02:b10c : bd 3d 80 LDA $803d,x ; (__multab32L + 0)
02:b10f : 38 __ __ SEC
02:b110 : e9 40 __ SBC #$40
02:b112 : 85 1b __ STA ACCU + 0 
02:b114 : 4c 47 b1 JMP $b147 ; (palette_returnscreencode.s18 + 0)
.s6:
02:b117 : ad c8 82 LDA $82c8 ; (rowsel + 1)
02:b11a : d0 07 __ BNE $b123 ; (palette_returnscreencode.s11 + 0)
.s1002:
02:b11c : a9 0a __ LDA #$0a
02:b11e : cd c7 82 CMP $82c7 ; (rowsel + 0)
02:b121 : b0 45 __ BCS $b168 ; (palette_returnscreencode.s1001 + 0)
.s11:
02:b123 : a9 01 __ LDA #$01
02:b125 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
02:b128 : ad c7 82 LDA $82c7 ; (rowsel + 0)
02:b12b : 85 1c __ STA ACCU + 1 
02:b12d : ad c8 82 LDA $82c8 ; (rowsel + 1)
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
02:b147 : ad ff 7b LDA $7bff ; (visualmap + 0)
02:b14a : d0 09 __ BNE $b155 ; (palette_returnscreencode.s8 + 0)
.s9:
02:b14c : ad c9 82 LDA $82c9 ; (colsel + 0)
02:b14f : 18 __ __ CLC
02:b150 : 65 1b __ ADC ACCU + 0 
02:b152 : 4c 65 b1 JMP $b165 ; (palette_returnscreencode.s20 + 0)
.s8:
02:b155 : ad ca 82 LDA $82ca ; (colsel + 1)
02:b158 : 18 __ __ CLC
02:b159 : 69 0c __ ADC #$0c
02:b15b : 18 __ __ CLC
02:b15c : 65 1c __ ADC ACCU + 1 
02:b15e : 85 1c __ STA ACCU + 1 
02:b160 : ac c9 82 LDY $82c9 ; (colsel + 0)
02:b163 : b1 1b __ LDA (ACCU + 0),y 
.s20:
02:b165 : 8d f6 87 STA $87f6 ; (palettechar + 0)
.s1001:
02:b168 : 60 __ __ RTS
--------------------------------------------------------------------
02:b169 : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
writemode: ; writemode()->void
.s1000:
02:b16e : a5 53 __ LDA T2 + 0 
02:b170 : 8d b9 ab STA $abb9 ; (projbuffer + 33)
.s0:
02:b173 : a2 ff __ LDX #$ff
.l1002:
02:b175 : e8 __ __ INX
02:b176 : bd e4 b3 LDA $b3e4,x 
02:b179 : 9d e1 88 STA $88e1,x ; (programmode + 0)
02:b17c : d0 f7 __ BNE $b175 ; (writemode.l1002 + 0)
.l161:
02:b17e : ad fe 86 LDA $86fe ; (showbar + 0)
02:b181 : f0 03 __ BEQ $b186 ; (writemode.s5 + 0)
.s3:
02:b183 : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s5:
02:b186 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
02:b189 : 85 53 __ STA T2 + 0 
02:b18b : c9 8b __ CMP #$8b
02:b18d : d0 06 __ BNE $b195 ; (writemode.s62 + 0)
.s26:
02:b18f : 20 27 50 JSR $5027 ; (togglestatusbar.s0 + 0)
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
02:b1c4 : 20 4d 41 JSR $414d ; (plotmove.s1000 + 0)
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
02:b1e2 : ad fe 7a LDA $7afe ; (undoenabled + 0)
02:b1e5 : c9 01 __ CMP #$01
02:b1e7 : d0 1a __ BNE $b203 ; (writemode.s58 + 0)
.s53:
02:b1e9 : 85 18 __ STA P11 
02:b1eb : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b1ee : ad b1 87 LDA $87b1 ; (canvas + 9)
02:b1f1 : 18 __ __ CLC
02:b1f2 : 6d ed 86 ADC $86ed ; (screen_row + 0)
02:b1f5 : 85 16 __ STA P9 
02:b1f7 : ad af 87 LDA $87af ; (canvas + 7)
02:b1fa : 18 __ __ CLC
02:b1fb : 6d eb 86 ADC $86eb ; (screen_col + 0)
02:b1fe : 85 17 __ STA P10 
02:b200 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s58:
02:b203 : a5 53 __ LDA T2 + 0 
02:b205 : 20 76 35 JSR $3576 ; (pet2screen.s0 + 0)
02:b208 : 85 12 __ STA P5 
02:b20a : ad b1 87 LDA $87b1 ; (canvas + 9)
02:b20d : 18 __ __ CLC
02:b20e : 6d ed 86 ADC $86ed ; (screen_row + 0)
02:b211 : 85 10 __ STA P3 
02:b213 : ad af 87 LDA $87af ; (canvas + 7)
02:b216 : 18 __ __ CLC
02:b217 : 6d eb 86 ADC $86eb ; (screen_col + 0)
02:b21a : 85 11 __ STA P4 
02:b21c : ad f4 86 LDA $86f4 ; (plotblink + 0)
02:b21f : 0a __ __ ASL
02:b220 : 0a __ __ ASL
02:b221 : 0a __ __ ASL
02:b222 : 0a __ __ ASL
02:b223 : 18 __ __ CLC
02:b224 : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
02:b227 : 85 43 __ STA T0 + 0 
02:b229 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
02:b22c : 4a __ __ LSR
02:b22d : 6a __ __ ROR
02:b22e : 6a __ __ ROR
02:b22f : 29 c0 __ AND #$c0
02:b231 : 6a __ __ ROR
02:b232 : 65 43 __ ADC T0 + 0 
02:b234 : 85 43 __ STA T0 + 0 
02:b236 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
02:b239 : 4a __ __ LSR
02:b23a : 6a __ __ ROR
02:b23b : 29 80 __ AND #$80
02:b23d : 6a __ __ ROR
02:b23e : 65 43 __ ADC T0 + 0 
02:b240 : 85 43 __ STA T0 + 0 
02:b242 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
02:b245 : 4a __ __ LSR
02:b246 : a9 00 __ LDA #$00
02:b248 : 6a __ __ ROR
02:b249 : 65 43 __ ADC T0 + 0 
02:b24b : 85 13 __ STA P6 
02:b24d : 20 1a 54 JSR $541a ; (screenmapplot.s0 + 0)
02:b250 : a9 1d __ LDA #$1d
02:b252 : 8d fc ab STA $abfc ; (sstack + 9)
02:b255 : 20 4d 41 JSR $414d ; (plotmove.s1000 + 0)
02:b258 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
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
02:b26e : 9d e1 88 STA $88e1,x ; (programmode + 0)
02:b271 : d0 f7 __ BNE $b26a ; (writemode.l1004 + 0)
.s1001:
02:b273 : ad b9 ab LDA $abb9 ; (projbuffer + 33)
02:b276 : 85 53 __ STA T2 + 0 
02:b278 : 60 __ __ RTS
.s178:
02:b279 : 85 11 __ STA P4 
02:b27b : 20 f2 3d JSR $3df2 ; (change_plotcolor.s0 + 0)
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
02:b291 : 20 f2 3d JSR $3df2 ; (change_plotcolor.s0 + 0)
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
02:b2d3 : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
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
02:b2ec : cd f2 86 CMP $86f2 ; (plotreverse + 0)
02:b2ef : 2a __ __ ROL
02:b2f0 : 8d f2 86 STA $86f2 ; (plotreverse + 0)
02:b2f3 : 90 41 __ BCC $b336 ; (writemode.s177 + 0)
.s80:
02:b2f5 : 90 45 __ BCC $b33c ; (writemode.s82 + 0)
.s81:
02:b2f7 : c9 89 __ CMP #$89
02:b2f9 : d0 18 __ BNE $b313 ; (writemode.s87 + 0)
.s16:
02:b2fb : ad fe 7a LDA $7afe ; (undoenabled + 0)
02:b2fe : c9 01 __ CMP #$01
02:b300 : f0 03 __ BEQ $b305 ; (writemode.s20 + 0)
02:b302 : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s20:
02:b305 : ad fc 86 LDA $86fc ; (undo_undopossible + 0)
02:b308 : d0 03 __ BNE $b30d ; (writemode.s17 + 0)
02:b30a : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s17:
02:b30d : 20 8d 54 JSR $548d ; (undo_performundo.s1000 + 0)
02:b310 : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s87:
02:b313 : 90 18 __ BCC $b32d ; (writemode.s11 + 0)
.s21:
02:b315 : ad fe 7a LDA $7afe ; (undoenabled + 0)
02:b318 : c9 01 __ CMP #$01
02:b31a : f0 03 __ BEQ $b31f ; (writemode.s25 + 0)
02:b31c : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s25:
02:b31f : ad fd 86 LDA $86fd ; (undo_redopossible + 0)
02:b322 : d0 03 __ BNE $b327 ; (writemode.s22 + 0)
02:b324 : 4c 5b b2 JMP $b25b ; (writemode.s6 + 0)
.s22:
02:b327 : 20 51 57 JSR $5751 ; (undo_performredo.s1000 + 0)
02:b32a : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s11:
02:b32d : a9 00 __ LDA #$00
02:b32f : cd f5 86 CMP $86f5 ; (plotaltchar + 0)
02:b332 : 2a __ __ ROL
02:b333 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
.s177:
02:b336 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
02:b339 : 4c 7e b2 JMP $b27e ; (writemode.s1099 + 0)
.s82:
02:b33c : c9 85 __ CMP #$85
02:b33e : d0 0b __ BNE $b34b ; (writemode.s83 + 0)
.s8:
02:b340 : a9 00 __ LDA #$00
02:b342 : cd f4 86 CMP $86f4 ; (plotblink + 0)
02:b345 : 2a __ __ ROL
02:b346 : 8d f4 86 STA $86f4 ; (plotblink + 0)
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
02:b35b : cd f3 86 CMP $86f3 ; (plotunderline + 0)
02:b35e : 2a __ __ ROL
02:b35f : 8d f3 86 STA $86f3 ; (plotunderline + 0)
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
02:b3a3 : ad fe 7a LDA $7afe ; (undoenabled + 0)
02:b3a6 : c9 01 __ CMP #$01
02:b3a8 : d0 1a __ BNE $b3c4 ; (writemode.s15 + 0)
.s13:
02:b3aa : 85 18 __ STA P11 
02:b3ac : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b3af : ad b1 87 LDA $87b1 ; (canvas + 9)
02:b3b2 : 18 __ __ CLC
02:b3b3 : 6d ed 86 ADC $86ed ; (screen_row + 0)
02:b3b6 : 85 16 __ STA P9 
02:b3b8 : ad af 87 LDA $87af ; (canvas + 7)
02:b3bb : 18 __ __ CLC
02:b3bc : 6d eb 86 ADC $86eb ; (screen_col + 0)
02:b3bf : 85 17 __ STA P10 
02:b3c1 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s15:
02:b3c4 : a9 20 __ LDA #$20
02:b3c6 : 85 12 __ STA P5 
02:b3c8 : a9 0f __ LDA #$0f
02:b3ca : 85 13 __ STA P6 
02:b3cc : ad b1 87 LDA $87b1 ; (canvas + 9)
02:b3cf : 18 __ __ CLC
02:b3d0 : 6d ed 86 ADC $86ed ; (screen_row + 0)
02:b3d3 : 85 10 __ STA P3 
02:b3d5 : ad af 87 LDA $87af ; (canvas + 7)
02:b3d8 : 18 __ __ CLC
02:b3d9 : 6d eb 86 ADC $86eb ; (screen_col + 0)
02:b3dc : 85 11 __ STA P4 
02:b3de : 20 1a 54 JSR $541a ; (screenmapplot.s0 + 0)
02:b3e1 : 4c 36 b3 JMP $b336 ; (writemode.s177 + 0)
--------------------------------------------------------------------
02:b3e4 : __ __ __ BYT 77 52 49 54 45 00                               : wRITE.
--------------------------------------------------------------------
colorwrite: ; colorwrite()->void
.s1000:
02:b3ea : a2 07 __ LDX #$07
02:b3ec : b5 53 __ LDA T0 + 0,x 
02:b3ee : 9d ae ab STA $abae,x ; (projbuffer + 22)
02:b3f1 : ca __ __ DEX
02:b3f2 : 10 f8 __ BPL $b3ec ; (colorwrite.s1000 + 2)
.s0:
02:b3f4 : a2 ff __ LDX #$ff
.l1002:
02:b3f6 : e8 __ __ INX
02:b3f7 : bd d0 b5 LDA $b5d0,x 
02:b3fa : 9d e1 88 STA $88e1,x ; (programmode + 0)
02:b3fd : d0 f7 __ BNE $b3f6 ; (colorwrite.l1002 + 0)
.l98:
02:b3ff : ad fe 86 LDA $86fe ; (showbar + 0)
02:b402 : f0 03 __ BEQ $b407 ; (colorwrite.s5 + 0)
.s3:
02:b404 : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s5:
02:b407 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
02:b40a : a5 1b __ LDA ACCU + 0 
02:b40c : 85 53 __ STA T0 + 0 
02:b40e : a9 7f __ LDA #$7f
02:b410 : 85 0d __ STA P0 
02:b412 : ad ab 87 LDA $87ab ; (canvas + 3)
02:b415 : 85 03 __ STA WORK + 0 
02:b417 : 18 __ __ CLC
02:b418 : 6d eb 86 ADC $86eb ; (screen_col + 0)
02:b41b : 85 56 __ STA T4 + 0 
02:b41d : ad ac 87 LDA $87ac ; (canvas + 4)
02:b420 : 85 04 __ STA WORK + 1 
02:b422 : 6d ec 86 ADC $86ec ; (screen_col + 1)
02:b425 : 85 57 __ STA T4 + 1 
02:b427 : ad b1 87 LDA $87b1 ; (canvas + 9)
02:b42a : 18 __ __ CLC
02:b42b : 6d ed 86 ADC $86ed ; (screen_row + 0)
02:b42e : 85 58 __ STA T5 + 0 
02:b430 : 85 1b __ STA ACCU + 0 
02:b432 : ad b2 87 LDA $87b2 ; (canvas + 10)
02:b435 : 6d ee 86 ADC $86ee ; (screen_row + 1)
02:b438 : 85 1c __ STA ACCU + 1 
02:b43a : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b43d : 18 __ __ CLC
02:b43e : a5 06 __ LDA WORK + 3 
02:b440 : 69 58 __ ADC #$58
02:b442 : 85 5a __ STA T6 + 1 
02:b444 : a5 05 __ LDA WORK + 2 
02:b446 : 85 59 __ STA T6 + 0 
02:b448 : 18 __ __ CLC
02:b449 : 65 56 __ ADC T4 + 0 
02:b44b : 85 56 __ STA T4 + 0 
02:b44d : a5 5a __ LDA T6 + 1 
02:b44f : 65 57 __ ADC T4 + 1 
02:b451 : 85 57 __ STA T4 + 1 
02:b453 : ad ad 87 LDA $87ad ; (canvas + 5)
02:b456 : 85 1b __ STA ACCU + 0 
02:b458 : ad ae 87 LDA $87ae ; (canvas + 6)
02:b45b : 85 1c __ STA ACCU + 1 
02:b45d : ad ab 87 LDA $87ab ; (canvas + 3)
02:b460 : 85 03 __ STA WORK + 0 
02:b462 : ad ac 87 LDA $87ac ; (canvas + 4)
02:b465 : 85 04 __ STA WORK + 1 
02:b467 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b46a : a5 05 __ LDA WORK + 2 
02:b46c : 85 54 __ STA T3 + 0 
02:b46e : 18 __ __ CLC
02:b46f : 65 56 __ ADC T4 + 0 
02:b471 : a8 __ __ TAY
02:b472 : a5 06 __ LDA WORK + 3 
02:b474 : 85 55 __ STA T3 + 1 
02:b476 : 65 57 __ ADC T4 + 1 
02:b478 : aa __ __ TAX
02:b479 : 98 __ __ TYA
02:b47a : 18 __ __ CLC
02:b47b : 69 30 __ ADC #$30
02:b47d : 85 0e __ STA P1 
02:b47f : 90 01 __ BCC $b482 ; (colorwrite.s1054 + 0)
.s1053:
02:b481 : e8 __ __ INX
.s1054:
02:b482 : 86 0f __ STX P2 
02:b484 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
02:b487 : a8 __ __ TAY
02:b488 : a5 53 __ LDA T0 + 0 
02:b48a : c9 89 __ CMP #$89
02:b48c : d0 03 __ BNE $b491 ; (colorwrite.s37 + 0)
02:b48e : 4c b8 b5 JMP $b5b8 ; (colorwrite.s11 + 0)
.s37:
02:b491 : b0 03 __ BCS $b496 ; (colorwrite.s38 + 0)
02:b493 : 4c 7c b5 JMP $b57c ; (colorwrite.s39 + 0)
.s38:
02:b496 : c9 8c __ CMP #$8c
02:b498 : d0 0b __ BNE $b4a5 ; (colorwrite.s49 + 0)
.s25:
02:b49a : a9 04 __ LDA #$04
02:b49c : 8d f8 ab STA $abf8 ; (sstack + 5)
02:b49f : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
02:b4a2 : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s49:
02:b4a5 : b0 03 __ BCS $b4aa ; (colorwrite.s50 + 0)
02:b4a7 : 4c 5a b5 JMP $b55a ; (colorwrite.s51 + 0)
.s50:
02:b4aa : c9 91 __ CMP #$91
02:b4ac : f0 04 __ BEQ $b4b2 ; (colorwrite.s109 + 0)
.s53:
02:b4ae : c9 9d __ CMP #$9d
02:b4b0 : d0 09 __ BNE $b4bb ; (colorwrite.s27 + 0)
.s109:
02:b4b2 : 8d fc ab STA $abfc ; (sstack + 9)
02:b4b5 : 20 4d 41 JSR $414d ; (plotmove.s1000 + 0)
02:b4b8 : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s27:
02:b4bb : c9 30 __ CMP #$30
02:b4bd : 90 18 __ BCC $b4d7 ; (colorwrite.s57 + 0)
.s31:
02:b4bf : c9 3a __ CMP #$3a
02:b4c1 : b0 06 __ BCS $b4c9 ; (colorwrite.s30 + 0)
.s28:
02:b4c3 : 38 __ __ SEC
02:b4c4 : e9 30 __ SBC #$30
02:b4c6 : 4c fa b4 JMP $b4fa ; (colorwrite.s1052 + 0)
.s30:
02:b4c9 : c9 41 __ CMP #$41
02:b4cb : 90 0a __ BCC $b4d7 ; (colorwrite.s57 + 0)
.s35:
02:b4cd : c9 47 __ CMP #$47
02:b4cf : b0 06 __ BCS $b4d7 ; (colorwrite.s57 + 0)
.s32:
02:b4d1 : 38 __ __ SEC
02:b4d2 : e9 37 __ SBC #$37
02:b4d4 : 4c fa b4 JMP $b4fa ; (colorwrite.s1052 + 0)
.s57:
02:b4d7 : a5 53 __ LDA T0 + 0 
02:b4d9 : c9 1b __ CMP #$1b
02:b4db : f0 07 __ BEQ $b4e4 ; (colorwrite.s2 + 0)
.s63:
02:b4dd : c9 03 __ CMP #$03
02:b4df : f0 03 __ BEQ $b4e4 ; (colorwrite.s2 + 0)
02:b4e1 : 4c ff b3 JMP $b3ff ; (colorwrite.l98 + 0)
.s2:
02:b4e4 : a2 ff __ LDX #$ff
.l1004:
02:b4e6 : e8 __ __ INX
02:b4e7 : bd 69 b1 LDA $b169,x 
02:b4ea : 9d e1 88 STA $88e1,x ; (programmode + 0)
02:b4ed : d0 f7 __ BNE $b4e6 ; (colorwrite.l1004 + 0)
.s1001:
02:b4ef : a2 07 __ LDX #$07
02:b4f1 : bd ae ab LDA $abae,x ; (projbuffer + 22)
02:b4f4 : 95 53 __ STA T0 + 0,x 
02:b4f6 : ca __ __ DEX
02:b4f7 : 10 f8 __ BPL $b4f1 ; (colorwrite.s1001 + 2)
02:b4f9 : 60 __ __ RTS
.s1052:
02:b4fa : 85 56 __ STA T4 + 0 
02:b4fc : 98 __ __ TYA
02:b4fd : 29 f0 __ AND #$f0
02:b4ff : 18 __ __ CLC
02:b500 : 65 56 __ ADC T4 + 0 
.s55:
02:b502 : 85 56 __ STA T4 + 0 
02:b504 : ad fe 7a LDA $7afe ; (undoenabled + 0)
02:b507 : c9 01 __ CMP #$01
02:b509 : d0 17 __ BNE $b522 ; (colorwrite.s60 + 0)
.s58:
02:b50b : a5 58 __ LDA T5 + 0 
02:b50d : 85 16 __ STA P9 
02:b50f : a9 01 __ LDA #$01
02:b511 : 85 18 __ STA P11 
02:b513 : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b516 : ad af 87 LDA $87af ; (canvas + 7)
02:b519 : 18 __ __ CLC
02:b51a : 6d eb 86 ADC $86eb ; (screen_col + 0)
02:b51d : 85 17 __ STA P10 
02:b51f : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s60:
02:b522 : a5 56 __ LDA T4 + 0 
02:b524 : 85 0f __ STA P2 
02:b526 : ad af 87 LDA $87af ; (canvas + 7)
02:b529 : 18 __ __ CLC
02:b52a : 6d eb 86 ADC $86eb ; (screen_col + 0)
02:b52d : a8 __ __ TAY
02:b52e : ad b0 87 LDA $87b0 ; (canvas + 8)
02:b531 : 6d ec 86 ADC $86ec ; (screen_col + 1)
02:b534 : aa __ __ TAX
02:b535 : 98 __ __ TYA
02:b536 : 18 __ __ CLC
02:b537 : 65 59 __ ADC T6 + 0 
02:b539 : a8 __ __ TAY
02:b53a : 8a __ __ TXA
02:b53b : 65 5a __ ADC T6 + 1 
02:b53d : aa __ __ TAX
02:b53e : 98 __ __ TYA
02:b53f : 18 __ __ CLC
02:b540 : 65 54 __ ADC T3 + 0 
02:b542 : a8 __ __ TAY
02:b543 : 8a __ __ TXA
02:b544 : 65 55 __ ADC T3 + 1 
02:b546 : aa __ __ TAX
02:b547 : 98 __ __ TYA
02:b548 : 18 __ __ CLC
02:b549 : 69 30 __ ADC #$30
02:b54b : 85 0d __ STA P0 
02:b54d : 90 01 __ BCC $b550 ; (colorwrite.s1056 + 0)
.s1055:
02:b54f : e8 __ __ INX
.s1056:
02:b550 : 86 0e __ STX P1 
02:b552 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
02:b555 : a9 1d __ LDA #$1d
02:b557 : 4c b2 b4 JMP $b4b2 ; (colorwrite.s109 + 0)
.s51:
02:b55a : c9 8a __ CMP #$8a
02:b55c : d0 18 __ BNE $b576 ; (colorwrite.s24 + 0)
.s16:
02:b55e : ad fe 7a LDA $7afe ; (undoenabled + 0)
02:b561 : c9 01 __ CMP #$01
02:b563 : f0 03 __ BEQ $b568 ; (colorwrite.s20 + 0)
02:b565 : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s20:
02:b568 : ad fd 86 LDA $86fd ; (undo_redopossible + 0)
02:b56b : d0 03 __ BNE $b570 ; (colorwrite.s17 + 0)
02:b56d : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s17:
02:b570 : 20 51 57 JSR $5751 ; (undo_performredo.s1000 + 0)
02:b573 : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s24:
02:b576 : 20 27 50 JSR $5027 ; (togglestatusbar.s0 + 0)
02:b579 : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s39:
02:b57c : c9 86 __ CMP #$86
02:b57e : d0 06 __ BNE $b586 ; (colorwrite.s40 + 0)
.s21:
02:b580 : 98 __ __ TYA
02:b581 : 49 20 __ EOR #$20
02:b583 : 4c 02 b5 JMP $b502 ; (colorwrite.s55 + 0)
.s40:
02:b586 : b0 20 __ BCS $b5a8 ; (colorwrite.s41 + 0)
.s42:
02:b588 : c9 1d __ CMP #$1d
02:b58a : d0 03 __ BNE $b58f ; (colorwrite.s43 + 0)
02:b58c : 4c b2 b4 JMP $b4b2 ; (colorwrite.s109 + 0)
.s43:
02:b58f : b0 0a __ BCS $b59b ; (colorwrite.s44 + 0)
.s45:
02:b591 : c9 11 __ CMP #$11
02:b593 : f0 03 __ BEQ $b598 ; (colorwrite.s45 + 7)
02:b595 : 4c bb b4 JMP $b4bb ; (colorwrite.s27 + 0)
02:b598 : 4c b2 b4 JMP $b4b2 ; (colorwrite.s109 + 0)
.s44:
02:b59b : c9 85 __ CMP #$85
02:b59d : f0 03 __ BEQ $b5a2 ; (colorwrite.s10 + 0)
02:b59f : 4c bb b4 JMP $b4bb ; (colorwrite.s27 + 0)
.s10:
02:b5a2 : 98 __ __ TYA
02:b5a3 : 49 10 __ EOR #$10
02:b5a5 : 4c 02 b5 JMP $b502 ; (colorwrite.s55 + 0)
.s41:
02:b5a8 : c9 87 __ CMP #$87
02:b5aa : f0 06 __ BEQ $b5b2 ; (colorwrite.s22 + 0)
.s23:
02:b5ac : 98 __ __ TYA
02:b5ad : 49 80 __ EOR #$80
02:b5af : 4c 02 b5 JMP $b502 ; (colorwrite.s55 + 0)
.s22:
02:b5b2 : 98 __ __ TYA
02:b5b3 : 49 40 __ EOR #$40
02:b5b5 : 4c 02 b5 JMP $b502 ; (colorwrite.s55 + 0)
.s11:
02:b5b8 : ad fe 7a LDA $7afe ; (undoenabled + 0)
02:b5bb : c9 01 __ CMP #$01
02:b5bd : f0 03 __ BEQ $b5c2 ; (colorwrite.s15 + 0)
02:b5bf : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s15:
02:b5c2 : ad fc 86 LDA $86fc ; (undo_undopossible + 0)
02:b5c5 : d0 03 __ BNE $b5ca ; (colorwrite.s12 + 0)
02:b5c7 : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
.s12:
02:b5ca : 20 8d 54 JSR $548d ; (undo_performundo.s1000 + 0)
02:b5cd : 4c d7 b4 JMP $b4d7 ; (colorwrite.s57 + 0)
--------------------------------------------------------------------
02:b5d0 : __ __ __ BYT 63 4f 4c 4f 52 57 52 49 54 45 00                : cOLORWRITE.
--------------------------------------------------------------------
resizewidth: ; resizewidth()->void
.s1000:
02:b5db : a2 0d __ LDX #$0d
02:b5dd : b5 53 __ LDA T0 + 0,x 
02:b5df : 9d 94 ab STA $ab94,x ; (tempfilename + 17)
02:b5e2 : ca __ __ DEX
02:b5e3 : 10 f8 __ BPL $b5dd ; (resizewidth.s1000 + 2)
02:b5e5 : 38 __ __ SEC
02:b5e6 : a5 23 __ LDA SP + 0 
02:b5e8 : e9 08 __ SBC #$08
02:b5ea : 85 23 __ STA SP + 0 
02:b5ec : b0 02 __ BCS $b5f0 ; (resizewidth.s0 + 0)
02:b5ee : c6 24 __ DEC SP + 1 
.s0:
02:b5f0 : a9 00 __ LDA #$00
02:b5f2 : 85 17 __ STA P10 
02:b5f4 : a9 14 __ LDA #$14
02:b5f6 : 85 18 __ STA P11 
02:b5f8 : a9 05 __ LDA #$05
02:b5fa : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b5fd : a9 28 __ LDA #$28
02:b5ff : 8d f4 ab STA $abf4 ; (sstack + 1)
02:b602 : a9 0c __ LDA #$0c
02:b604 : 8d f5 ab STA $abf5 ; (sstack + 2)
02:b607 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
02:b60a : 8d 96 87 STA $8796 ; (vdc_state + 7)
02:b60d : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
02:b610 : a9 01 __ LDA #$01
02:b612 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
02:b615 : a9 a3 __ LDA #$a3
02:b617 : 85 13 __ STA P6 
02:b619 : a9 bb __ LDA #$bb
02:b61b : 85 14 __ STA P7 
02:b61d : 20 04 81 JSR $8104 ; (vdc_prints_attr@proxy + 0)
02:b620 : a9 00 __ LDA #$00
02:b622 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
02:b625 : a9 08 __ LDA #$08
02:b627 : 85 12 __ STA P5 
02:b629 : a9 b7 __ LDA #$b7
02:b62b : 85 13 __ STA P6 
02:b62d : a9 bb __ LDA #$bb
02:b62f : 85 14 __ STA P7 
02:b631 : ad 96 87 LDA $8796 ; (vdc_state + 7)
02:b634 : 85 53 __ STA T0 + 0 
02:b636 : 85 15 __ STA P8 
02:b638 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
02:b63b : a9 00 __ LDA #$00
02:b63d : a0 02 __ LDY #$02
02:b63f : 91 23 __ STA (SP + 0),y 
02:b641 : a9 89 __ LDA #$89
02:b643 : c8 __ __ INY
02:b644 : 91 23 __ STA (SP + 0),y 
02:b646 : a9 c8 __ LDA #$c8
02:b648 : c8 __ __ INY
02:b649 : 91 23 __ STA (SP + 0),y 
02:b64b : a9 bb __ LDA #$bb
02:b64d : c8 __ __ INY
02:b64e : 91 23 __ STA (SP + 0),y 
02:b650 : ad ab 87 LDA $87ab ; (canvas + 3)
02:b653 : c8 __ __ INY
02:b654 : 91 23 __ STA (SP + 0),y 
02:b656 : ad ac 87 LDA $87ac ; (canvas + 4)
02:b659 : c8 __ __ INY
02:b65a : 91 23 __ STA (SP + 0),y 
02:b65c : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
02:b65f : a9 15 __ LDA #$15
02:b661 : 85 16 __ STA P9 
02:b663 : a9 09 __ LDA #$09
02:b665 : 85 17 __ STA P10 
02:b667 : a9 00 __ LDA #$00
02:b669 : 8d f3 ab STA $abf3 ; (sstack + 0)
02:b66c : a9 89 __ LDA #$89
02:b66e : 8d f4 ab STA $abf4 ; (sstack + 1)
02:b671 : a9 03 __ LDA #$03
02:b673 : 8d f5 ab STA $abf5 ; (sstack + 2)
02:b676 : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
02:b679 : a5 1c __ LDA ACCU + 1 
02:b67b : 30 04 __ BMI $b681 ; (resizewidth.s123 + 0)
.s1023:
02:b67d : 05 1b __ ORA ACCU + 0 
02:b67f : d0 06 __ BNE $b687 ; (resizewidth.s3 + 0)
.s123:
02:b681 : a9 00 __ LDA #$00
02:b683 : 85 59 __ STA T4 + 0 
02:b685 : f0 11 __ BEQ $b698 ; (resizewidth.s5 + 0)
.s3:
02:b687 : a9 a4 __ LDA #$a4
02:b689 : 85 0f __ STA P2 
02:b68b : a9 ab __ LDA #$ab
02:b68d : 85 10 __ STA P3 
02:b68f : 20 74 80 JSR $8074 ; (strtol@proxy + 0)
02:b692 : a5 1b __ LDA ACCU + 0 
02:b694 : 85 59 __ STA T4 + 0 
02:b696 : a5 1c __ LDA ACCU + 1 
.s5:
02:b698 : 85 5a __ STA T4 + 1 
02:b69a : 85 04 __ STA WORK + 1 
02:b69c : ad ad 87 LDA $87ad ; (canvas + 5)
02:b69f : 85 1b __ STA ACCU + 0 
02:b6a1 : ad ae 87 LDA $87ae ; (canvas + 6)
02:b6a4 : 85 1c __ STA ACCU + 1 
02:b6a6 : a5 59 __ LDA T4 + 0 
02:b6a8 : 85 03 __ STA WORK + 0 
02:b6aa : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b6ad : a5 05 __ LDA WORK + 2 
02:b6af : 0a __ __ ASL
02:b6b0 : aa __ __ TAX
02:b6b1 : a5 06 __ LDA WORK + 3 
02:b6b3 : 2a __ __ ROL
02:b6b4 : a8 __ __ TAY
02:b6b5 : 8a __ __ TXA
02:b6b6 : 18 __ __ CLC
02:b6b7 : 69 30 __ ADC #$30
02:b6b9 : 85 54 __ STA T1 + 0 
02:b6bb : 90 01 __ BCC $b6be ; (resizewidth.s1026 + 0)
.s1025:
02:b6bd : c8 __ __ INY
.s1026:
02:b6be : 84 55 __ STY T1 + 1 
02:b6c0 : a9 77 __ LDA #$77
02:b6c2 : c5 55 __ CMP T1 + 1 
02:b6c4 : d0 04 __ BNE $b6ca ; (resizewidth.s1022 + 0)
.s1021:
02:b6c6 : a9 ff __ LDA #$ff
02:b6c8 : c5 54 __ CMP T1 + 0 
.s1022:
02:b6ca : 90 06 __ BCC $b6d2 ; (resizewidth.s6 + 0)
.s9:
02:b6cc : a5 59 __ LDA T4 + 0 
02:b6ce : 05 5a __ ORA T4 + 1 
02:b6d0 : d0 0c __ BNE $b6de ; (resizewidth.s7 + 0)
.s6:
02:b6d2 : 20 8d 81 JSR $818d ; (vdc_prints_attr@proxy + 0)
02:b6d5 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
02:b6d8 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:b6db : 4c b6 b7 JMP $b7b6 ; (resizewidth.s1001 + 0)
.s7:
02:b6de : a9 00 __ LDA #$00
02:b6e0 : 85 58 __ STA T3 + 0 
02:b6e2 : a5 5a __ LDA T4 + 1 
02:b6e4 : cd ac 87 CMP $87ac ; (canvas + 4)
02:b6e7 : d0 05 __ BNE $b6ee ; (resizewidth.s1020 + 0)
.s1019:
02:b6e9 : a5 59 __ LDA T4 + 0 
02:b6eb : cd ab 87 CMP $87ab ; (canvas + 3)
.s1020:
02:b6ee : b0 25 __ BCS $b715 ; (resizewidth.s13 + 0)
.s11:
02:b6f0 : 20 76 81 JSR $8176 ; (vdc_prints_attr@proxy + 0)
02:b6f3 : e6 12 __ INC P5 
02:b6f5 : 20 6b 81 JSR $816b ; (vdc_prints_attr@proxy + 0)
02:b6f8 : a9 19 __ LDA #$19
02:b6fa : 8d f8 ab STA $abf8 ; (sstack + 5)
02:b6fd : a9 0d __ LDA #$0d
02:b6ff : 8d f9 ab STA $abf9 ; (sstack + 6)
02:b702 : a9 07 __ LDA #$07
02:b704 : 8d fa ab STA $abfa ; (sstack + 7)
02:b707 : a9 00 __ LDA #$00
02:b709 : 8d fb ab STA $abfb ; (sstack + 8)
02:b70c : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
02:b70f : a5 1b __ LDA ACCU + 0 
02:b711 : c9 01 __ CMP #$01
02:b713 : f0 06 __ BEQ $b71b ; (resizewidth.s16 + 0)
.s13:
02:b715 : ac ab 87 LDY $87ab ; (canvas + 3)
02:b718 : 4c 6c b7 JMP $b76c ; (resizewidth.s1024 + 0)
.s16:
02:b71b : ad ae 87 LDA $87ae ; (canvas + 6)
02:b71e : d0 07 __ BNE $b727 ; (resizewidth.s70 + 0)
.s1016:
02:b720 : a9 01 __ LDA #$01
02:b722 : cd ad 87 CMP $87ad ; (canvas + 5)
02:b725 : b0 0f __ BCS $b736 ; (resizewidth.s22 + 0)
.s70:
02:b727 : a9 01 __ LDA #$01
02:b729 : 85 54 __ STA T1 + 0 
02:b72b : a9 00 __ LDA #$00
02:b72d : 85 55 __ STA T1 + 1 
02:b72f : a5 59 __ LDA T4 + 0 
02:b731 : 85 14 __ STA P7 
02:b733 : 4c 28 bb JMP $bb28 ; (resizewidth.l20 + 0)
.s22:
02:b736 : ad ad 87 LDA $87ad ; (canvas + 5)
02:b739 : 0d ae 87 ORA $87ae ; (canvas + 6)
02:b73c : f0 0d __ BEQ $b74b ; (resizewidth.s30 + 0)
.s69:
02:b73e : a9 00 __ LDA #$00
02:b740 : 85 54 __ STA T1 + 0 
02:b742 : 85 55 __ STA T1 + 1 
02:b744 : a5 59 __ LDA T4 + 0 
02:b746 : 85 14 __ STA P7 
02:b748 : 4c 48 ba JMP $ba48 ; (resizewidth.l28 + 0)
.s30:
02:b74b : a9 01 __ LDA #$01
02:b74d : 85 58 __ STA T3 + 0 
02:b74f : 38 __ __ SEC
02:b750 : a5 59 __ LDA T4 + 0 
02:b752 : e9 01 __ SBC #$01
02:b754 : aa __ __ TAX
02:b755 : a5 5a __ LDA T4 + 1 
02:b757 : e9 00 __ SBC #$00
02:b759 : ac ab 87 LDY $87ab ; (canvas + 3)
02:b75c : cd ec 86 CMP $86ec ; (screen_col + 1)
02:b75f : d0 03 __ BNE $b764 ; (resizewidth.s1011 + 0)
.s1010:
02:b761 : ec eb 86 CPX $86eb ; (screen_col + 0)
.s1011:
02:b764 : b0 06 __ BCS $b76c ; (resizewidth.s1024 + 0)
.s35:
02:b766 : 8e eb 86 STX $86eb ; (screen_col + 0)
02:b769 : 8d ec 86 STA $86ec ; (screen_col + 1)
.s1024:
02:b76c : ad ac 87 LDA $87ac ; (canvas + 4)
02:b76f : c5 5a __ CMP T4 + 1 
02:b771 : d0 02 __ BNE $b775 ; (resizewidth.s1009 + 0)
.s1008:
02:b773 : c4 59 __ CPY T4 + 0 
.s1009:
02:b775 : 90 55 __ BCC $b7cc ; (resizewidth.s38 + 0)
.s8:
02:b777 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:b77a : a5 58 __ LDA T3 + 0 
02:b77c : c9 01 __ CMP #$01
02:b77e : d0 36 __ BNE $b7b6 ; (resizewidth.s1001 + 0)
.s61:
02:b780 : a5 59 __ LDA T4 + 0 
02:b782 : 8d ab 87 STA $87ab ; (canvas + 3)
02:b785 : a5 5a __ LDA T4 + 1 
02:b787 : 8d ac 87 STA $87ac ; (canvas + 4)
02:b78a : a9 00 __ LDA #$00
02:b78c : 8d af 87 STA $87af ; (canvas + 7)
02:b78f : 8d b0 87 STA $87b0 ; (canvas + 8)
02:b792 : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
02:b795 : 20 14 3d JSR $3d14 ; (placesignature.s1000 + 0)
02:b798 : a9 0f __ LDA #$0f
02:b79a : 8d 96 87 STA $8796 ; (vdc_state + 7)
02:b79d : 20 8f 2c JSR $2c8f ; (vdc_cls.s0 + 0)
02:b7a0 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
02:b7a3 : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
02:b7a6 : ad fe 86 LDA $86fe ; (showbar + 0)
02:b7a9 : f0 03 __ BEQ $b7ae ; (resizewidth.s173 + 0)
.s64:
02:b7ab : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s173:
02:b7ae : a9 00 __ LDA #$00
02:b7b0 : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
02:b7b3 : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
.s1001:
02:b7b6 : 18 __ __ CLC
02:b7b7 : a5 23 __ LDA SP + 0 
02:b7b9 : 69 08 __ ADC #$08
02:b7bb : 85 23 __ STA SP + 0 
02:b7bd : 90 02 __ BCC $b7c1 ; (resizewidth.s1001 + 11)
02:b7bf : e6 24 __ INC SP + 1 
02:b7c1 : a2 0d __ LDX #$0d
02:b7c3 : bd 94 ab LDA $ab94,x ; (tempfilename + 17)
02:b7c6 : 95 53 __ STA T0 + 0,x 
02:b7c8 : ca __ __ DEX
02:b7c9 : 10 f8 __ BPL $b7c3 ; (resizewidth.s1001 + 13)
02:b7cb : 60 __ __ RTS
.s38:
02:b7cc : ad ad 87 LDA $87ad ; (canvas + 5)
02:b7cf : 0d ae 87 ORA $87ae ; (canvas + 6)
02:b7d2 : f0 09 __ BEQ $b7dd ; (resizewidth.s44 + 0)
.s68:
02:b7d4 : a9 00 __ LDA #$00
02:b7d6 : 85 54 __ STA T1 + 0 
02:b7d8 : 85 55 __ STA T1 + 1 
02:b7da : 4c d8 b8 JMP $b8d8 ; (resizewidth.l42 + 0)
.s44:
02:b7dd : ad ad 87 LDA $87ad ; (canvas + 5)
02:b7e0 : 0d ae 87 ORA $87ae ; (canvas + 6)
02:b7e3 : d0 06 __ BNE $b7eb ; (resizewidth.s67 + 0)
.s54:
02:b7e5 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:b7e8 : 4c 80 b7 JMP $b780 ; (resizewidth.s61 + 0)
.s67:
02:b7eb : a9 00 __ LDA #$00
02:b7ed : 85 54 __ STA T1 + 0 
02:b7ef : 85 55 __ STA T1 + 1 
.l52:
02:b7f1 : a9 7f __ LDA #$7f
02:b7f3 : 85 11 __ STA P4 
02:b7f5 : ad ab 87 LDA $87ab ; (canvas + 3)
02:b7f8 : 85 56 __ STA T2 + 0 
02:b7fa : 85 03 __ STA WORK + 0 
02:b7fc : 85 14 __ STA P7 
02:b7fe : ad ac 87 LDA $87ac ; (canvas + 4)
02:b801 : 85 57 __ STA T2 + 1 
02:b803 : 85 04 __ STA WORK + 1 
02:b805 : 85 15 __ STA P8 
02:b807 : ad ad 87 LDA $87ad ; (canvas + 5)
02:b80a : 38 __ __ SEC
02:b80b : e5 54 __ SBC T1 + 0 
02:b80d : a8 __ __ TAY
02:b80e : ad ae 87 LDA $87ae ; (canvas + 6)
02:b811 : e5 55 __ SBC T1 + 1 
02:b813 : aa __ __ TAX
02:b814 : 98 __ __ TYA
02:b815 : 38 __ __ SEC
02:b816 : e9 01 __ SBC #$01
02:b818 : 85 5b __ STA T6 + 0 
02:b81a : 85 1b __ STA ACCU + 0 
02:b81c : 8a __ __ TXA
02:b81d : e9 00 __ SBC #$00
02:b81f : 85 5c __ STA T6 + 1 
02:b821 : 85 1c __ STA ACCU + 1 
02:b823 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b826 : 18 __ __ CLC
02:b827 : a5 06 __ LDA WORK + 3 
02:b829 : 69 58 __ ADC #$58
02:b82b : 85 13 __ STA P6 
02:b82d : a5 05 __ LDA WORK + 2 
02:b82f : 85 12 __ STA P5 
02:b831 : ad 9b 87 LDA $879b ; (vdc_state + 12)
02:b834 : 85 0f __ STA P2 
02:b836 : ad 9c 87 LDA $879c ; (vdc_state + 13)
02:b839 : 85 5e __ STA T7 + 1 
02:b83b : 85 10 __ STA P3 
02:b83d : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:b840 : a9 7f __ LDA #$7f
02:b842 : 85 0d __ STA P0 
02:b844 : a5 0f __ LDA P2 
02:b846 : 85 10 __ STA P3 
02:b848 : a5 5e __ LDA T7 + 1 
02:b84a : 85 11 __ STA P4 
02:b84c : a5 56 __ LDA T2 + 0 
02:b84e : 85 12 __ STA P5 
02:b850 : a5 57 __ LDA T2 + 1 
02:b852 : 85 13 __ STA P6 
02:b854 : a5 5b __ LDA T6 + 0 
02:b856 : 85 1b __ STA ACCU + 0 
02:b858 : a5 5c __ LDA T6 + 1 
02:b85a : 85 1c __ STA ACCU + 1 
02:b85c : a5 59 __ LDA T4 + 0 
02:b85e : 85 03 __ STA WORK + 0 
02:b860 : a5 5a __ LDA T4 + 1 
02:b862 : 85 04 __ STA WORK + 1 
02:b864 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b867 : 18 __ __ CLC
02:b868 : a5 06 __ LDA WORK + 3 
02:b86a : 69 58 __ ADC #$58
02:b86c : 85 0f __ STA P2 
02:b86e : 20 47 1a JSR $1a47 ; (bnk_cpyfromvdc@proxy + 0)
02:b871 : a9 20 __ LDA #$20
02:b873 : 85 0f __ STA P2 
02:b875 : ad ad 87 LDA $87ad ; (canvas + 5)
02:b878 : 38 __ __ SEC
02:b879 : e5 54 __ SBC T1 + 0 
02:b87b : a8 __ __ TAY
02:b87c : ad ae 87 LDA $87ae ; (canvas + 6)
02:b87f : e5 55 __ SBC T1 + 1 
02:b881 : aa __ __ TAX
02:b882 : 98 __ __ TYA
02:b883 : 38 __ __ SEC
02:b884 : e9 01 __ SBC #$01
02:b886 : 85 1b __ STA ACCU + 0 
02:b888 : 8a __ __ TXA
02:b889 : e9 00 __ SBC #$00
02:b88b : 85 1c __ STA ACCU + 1 
02:b88d : a5 59 __ LDA T4 + 0 
02:b88f : 85 03 __ STA WORK + 0 
02:b891 : a5 5a __ LDA T4 + 1 
02:b893 : 85 04 __ STA WORK + 1 
02:b895 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b898 : 18 __ __ CLC
02:b899 : a5 06 __ LDA WORK + 3 
02:b89b : 69 58 __ ADC #$58
02:b89d : aa __ __ TAX
02:b89e : ad ab 87 LDA $87ab ; (canvas + 3)
02:b8a1 : 18 __ __ CLC
02:b8a2 : 65 05 __ ADC WORK + 2 
02:b8a4 : 85 0d __ STA P0 
02:b8a6 : 8a __ __ TXA
02:b8a7 : 6d ac 87 ADC $87ac ; (canvas + 4)
02:b8aa : 85 0e __ STA P1 
02:b8ac : 38 __ __ SEC
02:b8ad : a5 59 __ LDA T4 + 0 
02:b8af : ed ab 87 SBC $87ab ; (canvas + 3)
02:b8b2 : 85 10 __ STA P3 
02:b8b4 : a5 5a __ LDA T4 + 1 
02:b8b6 : ed ac 87 SBC $87ac ; (canvas + 4)
02:b8b9 : 85 11 __ STA P4 
02:b8bb : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
02:b8be : e6 54 __ INC T1 + 0 
02:b8c0 : d0 02 __ BNE $b8c4 ; (resizewidth.s1044 + 0)
.s1043:
02:b8c2 : e6 55 __ INC T1 + 1 
.s1044:
02:b8c4 : a5 55 __ LDA T1 + 1 
02:b8c6 : cd ae 87 CMP $87ae ; (canvas + 6)
02:b8c9 : d0 05 __ BNE $b8d0 ; (resizewidth.s1005 + 0)
.s1004:
02:b8cb : a5 54 __ LDA T1 + 0 
02:b8cd : cd ad 87 CMP $87ad ; (canvas + 5)
.s1005:
02:b8d0 : b0 03 __ BCS $b8d5 ; (resizewidth.s1005 + 5)
02:b8d2 : 4c f1 b7 JMP $b7f1 ; (resizewidth.l52 + 0)
02:b8d5 : 4c e5 b7 JMP $b7e5 ; (resizewidth.s54 + 0)
.l42:
02:b8d8 : a9 7f __ LDA #$7f
02:b8da : 85 11 __ STA P4 
02:b8dc : ad ab 87 LDA $87ab ; (canvas + 3)
02:b8df : 85 56 __ STA T2 + 0 
02:b8e1 : 85 03 __ STA WORK + 0 
02:b8e3 : 85 14 __ STA P7 
02:b8e5 : ad ac 87 LDA $87ac ; (canvas + 4)
02:b8e8 : 85 57 __ STA T2 + 1 
02:b8ea : 85 04 __ STA WORK + 1 
02:b8ec : 85 15 __ STA P8 
02:b8ee : ad ad 87 LDA $87ad ; (canvas + 5)
02:b8f1 : 85 5b __ STA T6 + 0 
02:b8f3 : 85 1b __ STA ACCU + 0 
02:b8f5 : ad ae 87 LDA $87ae ; (canvas + 6)
02:b8f8 : 85 5c __ STA T6 + 1 
02:b8fa : 85 1c __ STA ACCU + 1 
02:b8fc : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b8ff : a5 05 __ LDA WORK + 2 
02:b901 : 85 5d __ STA T7 + 0 
02:b903 : a5 06 __ LDA WORK + 3 
02:b905 : 85 5e __ STA T7 + 1 
02:b907 : 38 __ __ SEC
02:b908 : a5 5b __ LDA T6 + 0 
02:b90a : e5 54 __ SBC T1 + 0 
02:b90c : a8 __ __ TAY
02:b90d : a5 5c __ LDA T6 + 1 
02:b90f : e5 55 __ SBC T1 + 1 
02:b911 : aa __ __ TAX
02:b912 : 98 __ __ TYA
02:b913 : 38 __ __ SEC
02:b914 : e9 01 __ SBC #$01
02:b916 : 85 5f __ STA T8 + 0 
02:b918 : 85 1b __ STA ACCU + 0 
02:b91a : 8a __ __ TXA
02:b91b : e9 00 __ SBC #$00
02:b91d : 85 60 __ STA T8 + 1 
02:b91f : 85 1c __ STA ACCU + 1 
02:b921 : a5 56 __ LDA T2 + 0 
02:b923 : 85 03 __ STA WORK + 0 
02:b925 : a5 57 __ LDA T2 + 1 
02:b927 : 85 04 __ STA WORK + 1 
02:b929 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b92c : 18 __ __ CLC
02:b92d : a5 06 __ LDA WORK + 3 
02:b92f : 69 58 __ ADC #$58
02:b931 : aa __ __ TAX
02:b932 : 18 __ __ CLC
02:b933 : a5 05 __ LDA WORK + 2 
02:b935 : 65 5d __ ADC T7 + 0 
02:b937 : a8 __ __ TAY
02:b938 : 8a __ __ TXA
02:b939 : 65 5e __ ADC T7 + 1 
02:b93b : aa __ __ TAX
02:b93c : 98 __ __ TYA
02:b93d : 18 __ __ CLC
02:b93e : 69 30 __ ADC #$30
02:b940 : 85 12 __ STA P5 
02:b942 : 90 01 __ BCC $b945 ; (resizewidth.s1036 + 0)
.s1035:
02:b944 : e8 __ __ INX
.s1036:
02:b945 : 86 13 __ STX P6 
02:b947 : ad 9b 87 LDA $879b ; (vdc_state + 12)
02:b94a : 85 0f __ STA P2 
02:b94c : ad 9c 87 LDA $879c ; (vdc_state + 13)
02:b94f : 85 5e __ STA T7 + 1 
02:b951 : 85 10 __ STA P3 
02:b953 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:b956 : a9 7f __ LDA #$7f
02:b958 : 85 0d __ STA P0 
02:b95a : a5 0f __ LDA P2 
02:b95c : 85 10 __ STA P3 
02:b95e : a5 5e __ LDA T7 + 1 
02:b960 : 85 11 __ STA P4 
02:b962 : a5 56 __ LDA T2 + 0 
02:b964 : 85 12 __ STA P5 
02:b966 : a5 57 __ LDA T2 + 1 
02:b968 : 85 13 __ STA P6 
02:b96a : a5 59 __ LDA T4 + 0 
02:b96c : 85 1b __ STA ACCU + 0 
02:b96e : a5 5a __ LDA T4 + 1 
02:b970 : 85 1c __ STA ACCU + 1 
02:b972 : a5 5b __ LDA T6 + 0 
02:b974 : 85 03 __ STA WORK + 0 
02:b976 : a5 5c __ LDA T6 + 1 
02:b978 : 85 04 __ STA WORK + 1 
02:b97a : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b97d : a5 05 __ LDA WORK + 2 
02:b97f : 85 56 __ STA T2 + 0 
02:b981 : a5 06 __ LDA WORK + 3 
02:b983 : 85 57 __ STA T2 + 1 
02:b985 : a5 5f __ LDA T8 + 0 
02:b987 : 85 1b __ STA ACCU + 0 
02:b989 : a5 60 __ LDA T8 + 1 
02:b98b : 85 1c __ STA ACCU + 1 
02:b98d : a5 59 __ LDA T4 + 0 
02:b98f : 85 03 __ STA WORK + 0 
02:b991 : a5 5a __ LDA T4 + 1 
02:b993 : 85 04 __ STA WORK + 1 
02:b995 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b998 : 18 __ __ CLC
02:b999 : a5 06 __ LDA WORK + 3 
02:b99b : 69 58 __ ADC #$58
02:b99d : aa __ __ TAX
02:b99e : 18 __ __ CLC
02:b99f : a5 05 __ LDA WORK + 2 
02:b9a1 : 65 56 __ ADC T2 + 0 
02:b9a3 : a8 __ __ TAY
02:b9a4 : 8a __ __ TXA
02:b9a5 : 65 57 __ ADC T2 + 1 
02:b9a7 : aa __ __ TAX
02:b9a8 : 98 __ __ TYA
02:b9a9 : 18 __ __ CLC
02:b9aa : 69 30 __ ADC #$30
02:b9ac : 85 0e __ STA P1 
02:b9ae : 90 01 __ BCC $b9b1 ; (resizewidth.s1038 + 0)
.s1037:
02:b9b0 : e8 __ __ INX
.s1038:
02:b9b1 : 86 0f __ STX P2 
02:b9b3 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
02:b9b6 : a9 0f __ LDA #$0f
02:b9b8 : 85 0f __ STA P2 
02:b9ba : ad ad 87 LDA $87ad ; (canvas + 5)
02:b9bd : 38 __ __ SEC
02:b9be : e5 54 __ SBC T1 + 0 
02:b9c0 : a8 __ __ TAY
02:b9c1 : ad ae 87 LDA $87ae ; (canvas + 6)
02:b9c4 : e5 55 __ SBC T1 + 1 
02:b9c6 : aa __ __ TAX
02:b9c7 : 98 __ __ TYA
02:b9c8 : 38 __ __ SEC
02:b9c9 : e9 01 __ SBC #$01
02:b9cb : 85 1b __ STA ACCU + 0 
02:b9cd : 8a __ __ TXA
02:b9ce : e9 00 __ SBC #$00
02:b9d0 : 85 1c __ STA ACCU + 1 
02:b9d2 : a5 59 __ LDA T4 + 0 
02:b9d4 : 85 03 __ STA WORK + 0 
02:b9d6 : a5 5a __ LDA T4 + 1 
02:b9d8 : 85 04 __ STA WORK + 1 
02:b9da : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:b9dd : 18 __ __ CLC
02:b9de : a5 06 __ LDA WORK + 3 
02:b9e0 : 69 58 __ ADC #$58
02:b9e2 : aa __ __ TAX
02:b9e3 : ad ab 87 LDA $87ab ; (canvas + 3)
02:b9e6 : 18 __ __ CLC
02:b9e7 : 65 05 __ ADC WORK + 2 
02:b9e9 : 85 5b __ STA T6 + 0 
02:b9eb : 8a __ __ TXA
02:b9ec : 6d ac 87 ADC $87ac ; (canvas + 4)
02:b9ef : 85 5c __ STA T6 + 1 
02:b9f1 : ad ad 87 LDA $87ad ; (canvas + 5)
02:b9f4 : 85 1b __ STA ACCU + 0 
02:b9f6 : ad ae 87 LDA $87ae ; (canvas + 6)
02:b9f9 : 85 1c __ STA ACCU + 1 
02:b9fb : a5 59 __ LDA T4 + 0 
02:b9fd : 85 03 __ STA WORK + 0 
02:b9ff : a5 5a __ LDA T4 + 1 
02:ba01 : 85 04 __ STA WORK + 1 
02:ba03 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:ba06 : 18 __ __ CLC
02:ba07 : a5 05 __ LDA WORK + 2 
02:ba09 : 65 5b __ ADC T6 + 0 
02:ba0b : aa __ __ TAX
02:ba0c : a5 06 __ LDA WORK + 3 
02:ba0e : 65 5c __ ADC T6 + 1 
02:ba10 : a8 __ __ TAY
02:ba11 : 8a __ __ TXA
02:ba12 : 18 __ __ CLC
02:ba13 : 69 30 __ ADC #$30
02:ba15 : 85 0d __ STA P0 
02:ba17 : 90 01 __ BCC $ba1a ; (resizewidth.s1040 + 0)
.s1039:
02:ba19 : c8 __ __ INY
.s1040:
02:ba1a : 84 0e __ STY P1 
02:ba1c : 38 __ __ SEC
02:ba1d : a5 59 __ LDA T4 + 0 
02:ba1f : ed ab 87 SBC $87ab ; (canvas + 3)
02:ba22 : 85 10 __ STA P3 
02:ba24 : a5 5a __ LDA T4 + 1 
02:ba26 : ed ac 87 SBC $87ac ; (canvas + 4)
02:ba29 : 85 11 __ STA P4 
02:ba2b : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
02:ba2e : e6 54 __ INC T1 + 0 
02:ba30 : d0 02 __ BNE $ba34 ; (resizewidth.s1042 + 0)
.s1041:
02:ba32 : e6 55 __ INC T1 + 1 
.s1042:
02:ba34 : a5 55 __ LDA T1 + 1 
02:ba36 : cd ae 87 CMP $87ae ; (canvas + 6)
02:ba39 : d0 05 __ BNE $ba40 ; (resizewidth.s1007 + 0)
.s1006:
02:ba3b : a5 54 __ LDA T1 + 0 
02:ba3d : cd ad 87 CMP $87ad ; (canvas + 5)
.s1007:
02:ba40 : b0 03 __ BCS $ba45 ; (resizewidth.s1007 + 5)
02:ba42 : 4c d8 b8 JMP $b8d8 ; (resizewidth.l42 + 0)
02:ba45 : 4c dd b7 JMP $b7dd ; (resizewidth.s44 + 0)
.l28:
02:ba48 : a9 7f __ LDA #$7f
02:ba4a : 85 11 __ STA P4 
02:ba4c : a5 5a __ LDA T4 + 1 
02:ba4e : 85 15 __ STA P8 
02:ba50 : ad ab 87 LDA $87ab ; (canvas + 3)
02:ba53 : 85 03 __ STA WORK + 0 
02:ba55 : ad ac 87 LDA $87ac ; (canvas + 4)
02:ba58 : 85 04 __ STA WORK + 1 
02:ba5a : ad ad 87 LDA $87ad ; (canvas + 5)
02:ba5d : 85 5b __ STA T6 + 0 
02:ba5f : 85 1b __ STA ACCU + 0 
02:ba61 : ad ae 87 LDA $87ae ; (canvas + 6)
02:ba64 : 85 5c __ STA T6 + 1 
02:ba66 : 85 1c __ STA ACCU + 1 
02:ba68 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:ba6b : a5 05 __ LDA WORK + 2 
02:ba6d : 85 5d __ STA T7 + 0 
02:ba6f : a5 06 __ LDA WORK + 3 
02:ba71 : 85 5e __ STA T7 + 1 
02:ba73 : ad ab 87 LDA $87ab ; (canvas + 3)
02:ba76 : 85 1b __ STA ACCU + 0 
02:ba78 : ad ac 87 LDA $87ac ; (canvas + 4)
02:ba7b : 85 1c __ STA ACCU + 1 
02:ba7d : a5 54 __ LDA T1 + 0 
02:ba7f : 85 03 __ STA WORK + 0 
02:ba81 : a5 55 __ LDA T1 + 1 
02:ba83 : 85 04 __ STA WORK + 1 
02:ba85 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:ba88 : 18 __ __ CLC
02:ba89 : a5 06 __ LDA WORK + 3 
02:ba8b : 69 58 __ ADC #$58
02:ba8d : aa __ __ TAX
02:ba8e : 18 __ __ CLC
02:ba8f : a5 05 __ LDA WORK + 2 
02:ba91 : 65 5d __ ADC T7 + 0 
02:ba93 : a8 __ __ TAY
02:ba94 : 8a __ __ TXA
02:ba95 : 65 5e __ ADC T7 + 1 
02:ba97 : aa __ __ TAX
02:ba98 : 98 __ __ TYA
02:ba99 : 18 __ __ CLC
02:ba9a : 69 30 __ ADC #$30
02:ba9c : 85 12 __ STA P5 
02:ba9e : 90 01 __ BCC $baa1 ; (resizewidth.s1030 + 0)
.s1029:
02:baa0 : e8 __ __ INX
.s1030:
02:baa1 : 86 13 __ STX P6 
02:baa3 : ad 9b 87 LDA $879b ; (vdc_state + 12)
02:baa6 : 85 0f __ STA P2 
02:baa8 : ad 9c 87 LDA $879c ; (vdc_state + 13)
02:baab : 85 57 __ STA T2 + 1 
02:baad : 85 10 __ STA P3 
02:baaf : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:bab2 : a9 7f __ LDA #$7f
02:bab4 : 85 0d __ STA P0 
02:bab6 : a5 0f __ LDA P2 
02:bab8 : 85 10 __ STA P3 
02:baba : a5 57 __ LDA T2 + 1 
02:babc : 85 11 __ STA P4 
02:babe : a5 14 __ LDA P7 
02:bac0 : 85 1b __ STA ACCU + 0 
02:bac2 : 85 12 __ STA P5 
02:bac4 : a5 5a __ LDA T4 + 1 
02:bac6 : 85 13 __ STA P6 
02:bac8 : 85 1c __ STA ACCU + 1 
02:baca : a5 5b __ LDA T6 + 0 
02:bacc : 85 03 __ STA WORK + 0 
02:bace : a5 5c __ LDA T6 + 1 
02:bad0 : 85 04 __ STA WORK + 1 
02:bad2 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:bad5 : a5 05 __ LDA WORK + 2 
02:bad7 : 85 56 __ STA T2 + 0 
02:bad9 : a5 06 __ LDA WORK + 3 
02:badb : 85 57 __ STA T2 + 1 
02:badd : a5 54 __ LDA T1 + 0 
02:badf : 85 1b __ STA ACCU + 0 
02:bae1 : a5 55 __ LDA T1 + 1 
02:bae3 : 85 1c __ STA ACCU + 1 
02:bae5 : a5 14 __ LDA P7 
02:bae7 : 85 03 __ STA WORK + 0 
02:bae9 : a5 13 __ LDA P6 
02:baeb : 85 04 __ STA WORK + 1 
02:baed : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:baf0 : 18 __ __ CLC
02:baf1 : a5 06 __ LDA WORK + 3 
02:baf3 : 69 58 __ ADC #$58
02:baf5 : aa __ __ TAX
02:baf6 : 18 __ __ CLC
02:baf7 : a5 05 __ LDA WORK + 2 
02:baf9 : 65 56 __ ADC T2 + 0 
02:bafb : a8 __ __ TAY
02:bafc : 8a __ __ TXA
02:bafd : 65 57 __ ADC T2 + 1 
02:baff : aa __ __ TAX
02:bb00 : 98 __ __ TYA
02:bb01 : 18 __ __ CLC
02:bb02 : 69 30 __ ADC #$30
02:bb04 : 85 0e __ STA P1 
02:bb06 : 90 01 __ BCC $bb09 ; (resizewidth.s1032 + 0)
.s1031:
02:bb08 : e8 __ __ INX
.s1032:
02:bb09 : 86 0f __ STX P2 
02:bb0b : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
02:bb0e : e6 54 __ INC T1 + 0 
02:bb10 : d0 02 __ BNE $bb14 ; (resizewidth.s1034 + 0)
.s1033:
02:bb12 : e6 55 __ INC T1 + 1 
.s1034:
02:bb14 : a5 55 __ LDA T1 + 1 
02:bb16 : cd ae 87 CMP $87ae ; (canvas + 6)
02:bb19 : d0 05 __ BNE $bb20 ; (resizewidth.s1013 + 0)
.s1012:
02:bb1b : a5 54 __ LDA T1 + 0 
02:bb1d : cd ad 87 CMP $87ad ; (canvas + 5)
.s1013:
02:bb20 : b0 03 __ BCS $bb25 ; (resizewidth.s1013 + 5)
02:bb22 : 4c 48 ba JMP $ba48 ; (resizewidth.l28 + 0)
02:bb25 : 4c 4b b7 JMP $b74b ; (resizewidth.s30 + 0)
.l20:
02:bb28 : a9 7f __ LDA #$7f
02:bb2a : 85 11 __ STA P4 
02:bb2c : a5 5a __ LDA T4 + 1 
02:bb2e : 85 15 __ STA P8 
02:bb30 : ad ab 87 LDA $87ab ; (canvas + 3)
02:bb33 : 85 1b __ STA ACCU + 0 
02:bb35 : ad ac 87 LDA $87ac ; (canvas + 4)
02:bb38 : 85 1c __ STA ACCU + 1 
02:bb3a : a5 54 __ LDA T1 + 0 
02:bb3c : 85 03 __ STA WORK + 0 
02:bb3e : a5 55 __ LDA T1 + 1 
02:bb40 : 85 04 __ STA WORK + 1 
02:bb42 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:bb45 : 18 __ __ CLC
02:bb46 : a5 06 __ LDA WORK + 3 
02:bb48 : 69 58 __ ADC #$58
02:bb4a : 85 13 __ STA P6 
02:bb4c : a5 05 __ LDA WORK + 2 
02:bb4e : 85 12 __ STA P5 
02:bb50 : ad 9b 87 LDA $879b ; (vdc_state + 12)
02:bb53 : 85 0f __ STA P2 
02:bb55 : ad 9c 87 LDA $879c ; (vdc_state + 13)
02:bb58 : 85 57 __ STA T2 + 1 
02:bb5a : 85 10 __ STA P3 
02:bb5c : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
02:bb5f : a9 7f __ LDA #$7f
02:bb61 : 85 0d __ STA P0 
02:bb63 : a5 0f __ LDA P2 
02:bb65 : 85 10 __ STA P3 
02:bb67 : a5 57 __ LDA T2 + 1 
02:bb69 : 85 11 __ STA P4 
02:bb6b : a5 14 __ LDA P7 
02:bb6d : 85 03 __ STA WORK + 0 
02:bb6f : 85 12 __ STA P5 
02:bb71 : a5 5a __ LDA T4 + 1 
02:bb73 : 85 13 __ STA P6 
02:bb75 : 85 04 __ STA WORK + 1 
02:bb77 : a5 54 __ LDA T1 + 0 
02:bb79 : 85 1b __ STA ACCU + 0 
02:bb7b : a5 55 __ LDA T1 + 1 
02:bb7d : 85 1c __ STA ACCU + 1 
02:bb7f : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:bb82 : 18 __ __ CLC
02:bb83 : a5 06 __ LDA WORK + 3 
02:bb85 : 69 58 __ ADC #$58
02:bb87 : 85 0f __ STA P2 
02:bb89 : 20 47 1a JSR $1a47 ; (bnk_cpyfromvdc@proxy + 0)
02:bb8c : e6 54 __ INC T1 + 0 
02:bb8e : d0 02 __ BNE $bb92 ; (resizewidth.s1028 + 0)
.s1027:
02:bb90 : e6 55 __ INC T1 + 1 
.s1028:
02:bb92 : a5 55 __ LDA T1 + 1 
02:bb94 : cd ae 87 CMP $87ae ; (canvas + 6)
02:bb97 : d0 05 __ BNE $bb9e ; (resizewidth.s1015 + 0)
.s1014:
02:bb99 : a5 54 __ LDA T1 + 0 
02:bb9b : cd ad 87 CMP $87ad ; (canvas + 5)
.s1015:
02:bb9e : 90 88 __ BCC $bb28 ; (resizewidth.l20 + 0)
02:bba0 : 4c 36 b7 JMP $b736 ; (resizewidth.s22 + 0)
--------------------------------------------------------------------
02:bba3 : __ __ __ BYT 72 45 53 49 5a 45 20 43 41 4e 56 41 53 20 57 49 : rESIZE CANVAS WI
02:bbb3 : __ __ __ BYT 44 54 48 00                                     : DTH.
--------------------------------------------------------------------
02:bbb7 : __ __ __ BYT 65 4e 54 45 52 20 4e 45 57 20 57 49 44 54 48 3a : eNTER NEW WIDTH:
02:bbc7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
02:bbc8 : __ __ __ BYT 25 55 00                                        : %U.
--------------------------------------------------------------------
02:bbcb : __ __ __ BYT 6e 45 57 20 53 49 5a 45 20 55 4e 53 55 50 50 4f : nEW SIZE UNSUPPO
02:bbdb : __ __ __ BYT 52 54 45 44 2e 20 70 52 45 53 53 20 4b 45 59 2e : RTED. pRESS KEY.
02:bbeb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
02:bbec : __ __ __ BYT 61 52 45 20 59 4f 55 20 53 55 52 45 3f 00       : aRE YOU SURE?.
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
02:bc49 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
02:bc4c : 8d 96 87 STA $8796 ; (vdc_state + 7)
02:bc4f : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
02:bc52 : a9 01 __ LDA #$01
02:bc54 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
02:bc57 : a9 b8 __ LDA #$b8
02:bc59 : 85 13 __ STA P6 
02:bc5b : a9 bf __ LDA #$bf
02:bc5d : 85 14 __ STA P7 
02:bc5f : 20 04 81 JSR $8104 ; (vdc_prints_attr@proxy + 0)
02:bc62 : a9 00 __ LDA #$00
02:bc64 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
02:bc67 : a9 08 __ LDA #$08
02:bc69 : 85 12 __ STA P5 
02:bc6b : a9 cd __ LDA #$cd
02:bc6d : 85 13 __ STA P6 
02:bc6f : a9 bf __ LDA #$bf
02:bc71 : 85 14 __ STA P7 
02:bc73 : ad 96 87 LDA $8796 ; (vdc_state + 7)
02:bc76 : 85 53 __ STA T0 + 0 
02:bc78 : 85 15 __ STA P8 
02:bc7a : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
02:bc7d : a9 00 __ LDA #$00
02:bc7f : a0 02 __ LDY #$02
02:bc81 : 91 23 __ STA (SP + 0),y 
02:bc83 : a9 89 __ LDA #$89
02:bc85 : c8 __ __ INY
02:bc86 : 91 23 __ STA (SP + 0),y 
02:bc88 : a9 c8 __ LDA #$c8
02:bc8a : c8 __ __ INY
02:bc8b : 91 23 __ STA (SP + 0),y 
02:bc8d : a9 bb __ LDA #$bb
02:bc8f : c8 __ __ INY
02:bc90 : 91 23 __ STA (SP + 0),y 
02:bc92 : ad ad 87 LDA $87ad ; (canvas + 5)
02:bc95 : c8 __ __ INY
02:bc96 : 91 23 __ STA (SP + 0),y 
02:bc98 : ad ae 87 LDA $87ae ; (canvas + 6)
02:bc9b : c8 __ __ INY
02:bc9c : 91 23 __ STA (SP + 0),y 
02:bc9e : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
02:bca1 : a9 15 __ LDA #$15
02:bca3 : 85 16 __ STA P9 
02:bca5 : a9 09 __ LDA #$09
02:bca7 : 85 17 __ STA P10 
02:bca9 : a9 00 __ LDA #$00
02:bcab : 8d f3 ab STA $abf3 ; (sstack + 0)
02:bcae : a9 89 __ LDA #$89
02:bcb0 : 8d f4 ab STA $abf4 ; (sstack + 1)
02:bcb3 : a9 03 __ LDA #$03
02:bcb5 : 8d f5 ab STA $abf5 ; (sstack + 2)
02:bcb8 : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
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
02:bcd1 : 20 74 80 JSR $8074 ; (strtol@proxy + 0)
02:bcd4 : a5 1b __ LDA ACCU + 0 
02:bcd6 : 85 55 __ STA T4 + 0 
02:bcd8 : a5 1c __ LDA ACCU + 1 
.s5:
02:bcda : 85 56 __ STA T4 + 1 
02:bcdc : 85 04 __ STA WORK + 1 
02:bcde : ad ab 87 LDA $87ab ; (canvas + 3)
02:bce1 : 85 1b __ STA ACCU + 0 
02:bce3 : ad ac 87 LDA $87ac ; (canvas + 4)
02:bce6 : 85 1c __ STA ACCU + 1 
02:bce8 : a5 55 __ LDA T4 + 0 
02:bcea : 85 03 __ STA WORK + 0 
02:bcec : 20 62 7c JSR $7c62 ; (mul16 + 0)
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
02:bd14 : 20 8d 81 JSR $818d ; (vdc_prints_attr@proxy + 0)
02:bd17 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
02:bd1a : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:bd1d : 4c a7 bd JMP $bda7 ; (resizeheight.s1001 + 0)
.s7:
02:bd20 : a9 00 __ LDA #$00
02:bd22 : 85 54 __ STA T3 + 0 
02:bd24 : a5 56 __ LDA T4 + 1 
02:bd26 : cd ae 87 CMP $87ae ; (canvas + 6)
02:bd29 : d0 05 __ BNE $bd30 ; (resizeheight.s1013 + 0)
.s1012:
02:bd2b : a5 55 __ LDA T4 + 0 
02:bd2d : cd ad 87 CMP $87ad ; (canvas + 5)
.s1013:
02:bd30 : b0 28 __ BCS $bd5a ; (resizeheight.s13 + 0)
.s11:
02:bd32 : 20 76 81 JSR $8176 ; (vdc_prints_attr@proxy + 0)
02:bd35 : e6 12 __ INC P5 
02:bd37 : 20 6b 81 JSR $816b ; (vdc_prints_attr@proxy + 0)
02:bd3a : a9 19 __ LDA #$19
02:bd3c : 8d f8 ab STA $abf8 ; (sstack + 5)
02:bd3f : a9 0d __ LDA #$0d
02:bd41 : 8d f9 ab STA $abf9 ; (sstack + 6)
02:bd44 : a9 07 __ LDA #$07
02:bd46 : 8d fa ab STA $abfa ; (sstack + 7)
02:bd49 : a9 00 __ LDA #$00
02:bd4b : 8d fb ab STA $abfb ; (sstack + 8)
02:bd4e : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
02:bd51 : a5 1b __ LDA ACCU + 0 
02:bd53 : c9 01 __ CMP #$01
02:bd55 : d0 03 __ BNE $bd5a ; (resizeheight.s13 + 0)
02:bd57 : 4c 39 bf JMP $bf39 ; (resizeheight.s16 + 0)
.s13:
02:bd5a : ae ad 87 LDX $87ad ; (canvas + 5)
.s1021:
02:bd5d : ad ae 87 LDA $87ae ; (canvas + 6)
02:bd60 : c5 56 __ CMP T4 + 1 
02:bd62 : d0 02 __ BNE $bd66 ; (resizeheight.s1007 + 0)
.s1006:
02:bd64 : e4 55 __ CPX T4 + 0 
.s1007:
02:bd66 : 90 55 __ BCC $bdbd ; (resizeheight.s26 + 0)
.s8:
02:bd68 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:bd6b : a5 54 __ LDA T3 + 0 
02:bd6d : c9 01 __ CMP #$01
02:bd6f : d0 36 __ BNE $bda7 ; (resizeheight.s1001 + 0)
.s41:
02:bd71 : a5 55 __ LDA T4 + 0 
02:bd73 : 8d ad 87 STA $87ad ; (canvas + 5)
02:bd76 : a5 56 __ LDA T4 + 1 
02:bd78 : 8d ae 87 STA $87ae ; (canvas + 6)
02:bd7b : a9 00 __ LDA #$00
02:bd7d : 8d b1 87 STA $87b1 ; (canvas + 9)
02:bd80 : 8d b2 87 STA $87b2 ; (canvas + 10)
02:bd83 : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
02:bd86 : 20 14 3d JSR $3d14 ; (placesignature.s1000 + 0)
02:bd89 : a9 0f __ LDA #$0f
02:bd8b : 8d 96 87 STA $8796 ; (vdc_state + 7)
02:bd8e : 20 8f 2c JSR $2c8f ; (vdc_cls.s0 + 0)
02:bd91 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
02:bd94 : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
02:bd97 : ad fe 86 LDA $86fe ; (showbar + 0)
02:bd9a : f0 03 __ BEQ $bd9f ; (resizeheight.s81 + 0)
.s44:
02:bd9c : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s81:
02:bd9f : a9 00 __ LDA #$00
02:bda1 : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
02:bda4 : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
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
02:bdbe : 0d ae 87 ORA $87ae ; (canvas + 6)
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
02:bdd4 : ad ab 87 LDA $87ab ; (canvas + 3)
02:bdd7 : 85 1b __ STA ACCU + 0 
02:bdd9 : ad ac 87 LDA $87ac ; (canvas + 4)
02:bddc : 85 1c __ STA ACCU + 1 
02:bdde : a5 55 __ LDA T4 + 0 
02:bde0 : 85 03 __ STA WORK + 0 
02:bde2 : a5 56 __ LDA T4 + 1 
02:bde4 : 85 04 __ STA WORK + 1 
02:bde6 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:bde9 : a5 05 __ LDA WORK + 2 
02:bdeb : 85 43 __ STA T2 + 0 
02:bded : a5 06 __ LDA WORK + 3 
02:bdef : 85 44 __ STA T2 + 1 
02:bdf1 : ad ad 87 LDA $87ad ; (canvas + 5)
02:bdf4 : 85 1b __ STA ACCU + 0 
02:bdf6 : ad ae 87 LDA $87ae ; (canvas + 6)
02:bdf9 : 85 1c __ STA ACCU + 1 
02:bdfb : ad ab 87 LDA $87ab ; (canvas + 3)
02:bdfe : 85 03 __ STA WORK + 0 
02:be00 : ad ac 87 LDA $87ac ; (canvas + 4)
02:be03 : 85 04 __ STA WORK + 1 
02:be05 : 20 62 7c JSR $7c62 ; (mul16 + 0)
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
02:be26 : ed ad 87 SBC $87ad ; (canvas + 5)
02:be29 : 85 1b __ STA ACCU + 0 
02:be2b : a5 56 __ LDA T4 + 1 
02:be2d : ed ae 87 SBC $87ae ; (canvas + 6)
02:be30 : 85 1c __ STA ACCU + 1 
02:be32 : ad ab 87 LDA $87ab ; (canvas + 3)
02:be35 : 85 03 __ STA WORK + 0 
02:be37 : ad ac 87 LDA $87ac ; (canvas + 4)
02:be3a : 85 04 __ STA WORK + 1 
02:be3c : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:be3f : 20 65 1a JSR $1a65 ; (bnk_memset@proxy + 0)
02:be42 : a9 20 __ LDA #$20
02:be44 : 85 0f __ STA P2 
02:be46 : ad ab 87 LDA $87ab ; (canvas + 3)
02:be49 : 85 03 __ STA WORK + 0 
02:be4b : ad ac 87 LDA $87ac ; (canvas + 4)
02:be4e : 85 04 __ STA WORK + 1 
02:be50 : ad ad 87 LDA $87ad ; (canvas + 5)
02:be53 : 85 1b __ STA ACCU + 0 
02:be55 : ad ae 87 LDA $87ae ; (canvas + 6)
02:be58 : 85 1c __ STA ACCU + 1 
02:be5a : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:be5d : 18 __ __ CLC
02:be5e : a5 06 __ LDA WORK + 3 
02:be60 : 69 58 __ ADC #$58
02:be62 : 85 0e __ STA P1 
02:be64 : a5 05 __ LDA WORK + 2 
02:be66 : 85 0d __ STA P0 
02:be68 : 38 __ __ SEC
02:be69 : a5 55 __ LDA T4 + 0 
02:be6b : ed ad 87 SBC $87ad ; (canvas + 5)
02:be6e : 85 1b __ STA ACCU + 0 
02:be70 : a5 56 __ LDA T4 + 1 
02:be72 : ed ae 87 SBC $87ae ; (canvas + 6)
02:be75 : 85 1c __ STA ACCU + 1 
02:be77 : ad ab 87 LDA $87ab ; (canvas + 3)
02:be7a : 85 03 __ STA WORK + 0 
02:be7c : ad ac 87 LDA $87ac ; (canvas + 4)
02:be7f : 85 04 __ STA WORK + 1 
02:be81 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:be84 : 20 65 1a JSR $1a65 ; (bnk_memset@proxy + 0)
02:be87 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
02:be8a : 4c 71 bd JMP $bd71 ; (resizeheight.s41 + 0)
.l1019:
02:be8d : ad ab 87 LDA $87ab ; (canvas + 3)
02:be90 : 85 1b __ STA ACCU + 0 
02:be92 : 85 13 __ STA P6 
02:be94 : ad ac 87 LDA $87ac ; (canvas + 4)
02:be97 : 85 1c __ STA ACCU + 1 
02:be99 : 85 14 __ STA P7 
02:be9b : a5 55 __ LDA T4 + 0 
02:be9d : 85 03 __ STA WORK + 0 
02:be9f : a5 56 __ LDA T4 + 1 
02:bea1 : 85 04 __ STA WORK + 1 
02:bea3 : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:bea6 : a5 05 __ LDA WORK + 2 
02:bea8 : 85 43 __ STA T2 + 0 
02:beaa : a5 06 __ LDA WORK + 3 
02:beac : 85 44 __ STA T2 + 1 
02:beae : ad ad 87 LDA $87ad ; (canvas + 5)
02:beb1 : 38 __ __ SEC
02:beb2 : e5 53 __ SBC T0 + 0 
02:beb4 : a8 __ __ TAY
02:beb5 : ad ae 87 LDA $87ae ; (canvas + 6)
02:beb8 : e9 00 __ SBC #$00
02:beba : aa __ __ TAX
02:bebb : 98 __ __ TYA
02:bebc : 38 __ __ SEC
02:bebd : e9 01 __ SBC #$01
02:bebf : 85 1b __ STA ACCU + 0 
02:bec1 : 8a __ __ TXA
02:bec2 : e9 00 __ SBC #$00
02:bec4 : 85 1c __ STA ACCU + 1 
02:bec6 : ad ab 87 LDA $87ab ; (canvas + 3)
02:bec9 : 85 03 __ STA WORK + 0 
02:becb : ad ac 87 LDA $87ac ; (canvas + 4)
02:bece : 85 04 __ STA WORK + 1 
02:bed0 : 20 62 7c JSR $7c62 ; (mul16 + 0)
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
02:bef2 : ad ad 87 LDA $87ad ; (canvas + 5)
02:bef5 : 85 1b __ STA ACCU + 0 
02:bef7 : ad ae 87 LDA $87ae ; (canvas + 6)
02:befa : 85 1c __ STA ACCU + 1 
02:befc : ad ab 87 LDA $87ab ; (canvas + 3)
02:beff : 85 03 __ STA WORK + 0 
02:bf01 : ad ac 87 LDA $87ac ; (canvas + 4)
02:bf04 : 85 04 __ STA WORK + 1 
02:bf06 : 20 62 7c JSR $7c62 ; (mul16 + 0)
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
02:bf24 : ad ae 87 LDA $87ae ; (canvas + 6)
02:bf27 : f0 03 __ BEQ $bf2c ; (resizeheight.s1004 + 0)
02:bf29 : 4c 8d be JMP $be8d ; (resizeheight.l1019 + 0)
.s1004:
02:bf2c : a5 53 __ LDA T0 + 0 
02:bf2e : cd ad 87 CMP $87ad ; (canvas + 5)
02:bf31 : b0 03 __ BCS $bf36 ; (resizeheight.s1004 + 10)
02:bf33 : 4c 8d be JMP $be8d ; (resizeheight.l1019 + 0)
02:bf36 : 4c d0 bd JMP $bdd0 ; (resizeheight.s32 + 0)
.s16:
02:bf39 : a9 7f __ LDA #$7f
02:bf3b : 85 0d __ STA P0 
02:bf3d : 85 10 __ STA P3 
02:bf3f : ad ab 87 LDA $87ab ; (canvas + 3)
02:bf42 : 85 1b __ STA ACCU + 0 
02:bf44 : ad ac 87 LDA $87ac ; (canvas + 4)
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
02:bf5a : 20 62 7c JSR $7c62 ; (mul16 + 0)
02:bf5d : 18 __ __ CLC
02:bf5e : a5 05 __ LDA WORK + 2 
02:bf60 : 69 30 __ ADC #$30
02:bf62 : 85 0e __ STA P1 
02:bf64 : a5 06 __ LDA WORK + 3 
02:bf66 : 69 58 __ ADC #$58
02:bf68 : 85 0f __ STA P2 
02:bf6a : ad ad 87 LDA $87ad ; (canvas + 5)
02:bf6d : 85 1b __ STA ACCU + 0 
02:bf6f : ad ae 87 LDA $87ae ; (canvas + 6)
02:bf72 : 85 1c __ STA ACCU + 1 
02:bf74 : ad ab 87 LDA $87ab ; (canvas + 3)
02:bf77 : 85 03 __ STA WORK + 0 
02:bf79 : ad ac 87 LDA $87ac ; (canvas + 4)
02:bf7c : 85 04 __ STA WORK + 1 
02:bf7e : 20 62 7c JSR $7c62 ; (mul16 + 0)
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
02:bf99 : ae ad 87 LDX $87ad ; (canvas + 5)
02:bf9c : cd ee 86 CMP $86ee ; (screen_row + 1)
02:bf9f : d0 05 __ BNE $bfa6 ; (resizeheight.s1009 + 0)
.s1008:
02:bfa1 : a5 43 __ LDA T2 + 0 
02:bfa3 : cd ed 86 CMP $86ed ; (screen_row + 0)
.s1009:
02:bfa6 : 90 03 __ BCC $bfab ; (resizeheight.s23 + 0)
02:bfa8 : 4c 5d bd JMP $bd5d ; (resizeheight.s1021 + 0)
.s23:
02:bfab : a5 43 __ LDA T2 + 0 
02:bfad : 8d ed 86 STA $86ed ; (screen_row + 0)
02:bfb0 : a5 44 __ LDA T2 + 1 
02:bfb2 : 8d ee 86 STA $86ee ; (screen_row + 1)
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
03:ac00 : a2 05 __ LDX #$05
03:ac02 : b5 53 __ LDA T0 + 0,x 
03:ac04 : 9d c0 ab STA $abc0,x ; (projbuffer + 40)
03:ac07 : ca __ __ DEX
03:ac08 : 10 f8 __ BPL $ac02 ; (lineandbox.s1000 + 2)
.s0:
03:ac0a : a9 00 __ LDA #$00
03:ac0c : 8d 71 8a STA $8a71 ; (select_accept + 0)
03:ac0f : 8d 72 8a STA $8a72 ; (select_accept + 1)
03:ac12 : ad af 87 LDA $87af ; (canvas + 7)
03:ac15 : 18 __ __ CLC
03:ac16 : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:ac19 : 8d f7 87 STA $87f7 ; (select_startx + 0)
03:ac1c : ad b0 87 LDA $87b0 ; (canvas + 8)
03:ac1f : 6d ec 86 ADC $86ec ; (screen_col + 1)
03:ac22 : 8d f8 87 STA $87f8 ; (select_startx + 1)
03:ac25 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:ac28 : 8d fb 87 STA $87fb ; (select_endx + 0)
03:ac2b : ad f8 87 LDA $87f8 ; (select_startx + 1)
03:ac2e : 8d fc 87 STA $87fc ; (select_endx + 1)
03:ac31 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:ac34 : 18 __ __ CLC
03:ac35 : 6d ed 86 ADC $86ed ; (screen_row + 0)
03:ac38 : 8d f9 87 STA $87f9 ; (select_starty + 0)
03:ac3b : ad b2 87 LDA $87b2 ; (canvas + 10)
03:ac3e : 6d ee 86 ADC $86ee ; (screen_row + 1)
03:ac41 : 8d fa 87 STA $87fa ; (select_starty + 1)
03:ac44 : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:ac47 : 8d fd 87 STA $87fd ; (select_endy + 0)
03:ac4a : ad fa 87 LDA $87fa ; (select_starty + 1)
03:ac4d : 8d fe 87 STA $87fe ; (select_endy + 1)
03:ac50 : ad fc ab LDA $abfc ; (sstack + 9)
03:ac53 : f0 0b __ BEQ $ac60 ; (lineandbox.l229 + 0)
.s1:
03:ac55 : a2 ff __ LDX #$ff
.l1051:
03:ac57 : e8 __ __ INX
03:ac58 : bd f5 af LDA $aff5,x 
03:ac5b : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:ac5e : d0 f7 __ BNE $ac57 ; (lineandbox.l1051 + 0)
.l229:
03:ac60 : ad fe 86 LDA $86fe ; (showbar + 0)
03:ac63 : f0 03 __ BEQ $ac68 ; (lineandbox.s8 + 0)
.s6:
03:ac65 : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s8:
03:ac68 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
03:ac6b : a5 1b __ LDA ACCU + 0 
03:ac6d : 85 53 __ STA T0 + 0 
03:ac6f : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
03:ac72 : a5 53 __ LDA T0 + 0 
03:ac74 : c9 8c __ CMP #$8c
03:ac76 : d0 03 __ BNE $ac7b ; (lineandbox.s45 + 0)
03:ac78 : 4c be af JMP $afbe ; (lineandbox.s37 + 0)
.s45:
03:ac7b : b0 03 __ BCS $ac80 ; (lineandbox.s46 + 0)
03:ac7d : 4c f5 ae JMP $aef5 ; (lineandbox.s47 + 0)
.s46:
03:ac80 : c9 91 __ CMP #$91
03:ac82 : d0 03 __ BNE $ac87 ; (lineandbox.s53 + 0)
03:ac84 : 4c 8c ae JMP $ae8c ; (lineandbox.s23 + 0)
.s53:
03:ac87 : c9 9d __ CMP #$9d
03:ac89 : d0 63 __ BNE $acee ; (lineandbox.s9 + 0)
.s15:
03:ac8b : ad f8 87 LDA $87f8 ; (select_startx + 1)
03:ac8e : cd fc 87 CMP $87fc ; (select_endx + 1)
03:ac91 : d0 06 __ BNE $ac99 ; (lineandbox.s1022 + 0)
.s1021:
03:ac93 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:ac96 : cd fb 87 CMP $87fb ; (select_endx + 0)
.s1022:
03:ac99 : b0 53 __ BCS $acee ; (lineandbox.s9 + 0)
.s16:
03:ac9b : a9 01 __ LDA #$01
03:ac9d : 8d f8 ab STA $abf8 ; (sstack + 5)
03:aca0 : a9 00 __ LDA #$00
03:aca2 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:aca5 : 8d fa ab STA $abfa ; (sstack + 7)
03:aca8 : 8d fb ab STA $abfb ; (sstack + 8)
03:acab : 20 51 42 JSR $4251 ; (cursormove.s1000 + 0)
03:acae : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:acb1 : 85 54 __ STA T1 + 0 
.l249:
03:acb3 : ad fd 87 LDA $87fd ; (select_endy + 0)
03:acb6 : 18 __ __ CLC
03:acb7 : 69 01 __ ADC #$01
03:acb9 : 85 57 __ STA T3 + 0 
03:acbb : ad fe 87 LDA $87fe ; (select_endy + 1)
03:acbe : 69 00 __ ADC #$00
03:acc0 : f0 05 __ BEQ $acc7 ; (lineandbox.s1019 + 0)
.s1056:
03:acc2 : a5 54 __ LDA T1 + 0 
03:acc4 : 4c cd ac JMP $accd ; (lineandbox.s20 + 0)
.s1019:
03:acc7 : a5 54 __ LDA T1 + 0 
03:acc9 : c5 57 __ CMP T3 + 0 
03:accb : b0 0e __ BCS $acdb ; (lineandbox.s22 + 0)
.s20:
03:accd : 85 11 __ STA P4 
03:accf : a9 00 __ LDA #$00
03:acd1 : 85 13 __ STA P6 
03:acd3 : 20 fe af JSR $affe ; (plotvisible@proxy + 0)
03:acd6 : e6 54 __ INC T1 + 0 
03:acd8 : 4c b3 ac JMP $acb3 ; (lineandbox.l249 + 0)
.s22:
03:acdb : ad af 87 LDA $87af ; (canvas + 7)
03:acde : 18 __ __ CLC
03:acdf : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:ace2 : 8d fb 87 STA $87fb ; (select_endx + 0)
03:ace5 : ad b0 87 LDA $87b0 ; (canvas + 8)
03:ace8 : 6d ec 86 ADC $86ec ; (screen_col + 1)
03:aceb : 8d fc 87 STA $87fc ; (select_endx + 1)
.s9:
03:acee : ad eb 86 LDA $86eb ; (screen_col + 0)
03:acf1 : 8d b7 87 STA $87b7 ; (canvas + 15)
03:acf4 : ad ed 86 LDA $86ed ; (screen_row + 0)
03:acf7 : 8d b8 87 STA $87b8 ; (canvas + 16)
03:acfa : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
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
03:ad1c : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:ad1f : 85 17 __ STA P10 
03:ad21 : 49 ff __ EOR #$ff
03:ad23 : 38 __ __ SEC
03:ad24 : 6d fb 87 ADC $87fb ; (select_endx + 0)
03:ad27 : a8 __ __ TAY
03:ad28 : ad fc 87 LDA $87fc ; (select_endx + 1)
03:ad2b : ed f8 87 SBC $87f8 ; (select_startx + 1)
03:ad2e : aa __ __ TAX
03:ad2f : 98 __ __ TYA
03:ad30 : 18 __ __ CLC
03:ad31 : 69 01 __ ADC #$01
03:ad33 : 85 18 __ STA P11 
03:ad35 : 8d 73 8a STA $8a73 ; (select_width + 0)
03:ad38 : 90 01 __ BCC $ad3b ; (lineandbox.s1058 + 0)
.s1057:
03:ad3a : e8 __ __ INX
.s1058:
03:ad3b : 8e 74 8a STX $8a74 ; (select_width + 1)
03:ad3e : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:ad41 : 85 53 __ STA T0 + 0 
03:ad43 : 85 16 __ STA P9 
03:ad45 : ad fd 87 LDA $87fd ; (select_endy + 0)
03:ad48 : 85 54 __ STA T1 + 0 
03:ad4a : 38 __ __ SEC
03:ad4b : e5 16 __ SBC P9 
03:ad4d : a8 __ __ TAY
03:ad4e : ad fe 87 LDA $87fe ; (select_endy + 1)
03:ad51 : 85 55 __ STA T1 + 1 
03:ad53 : ed fa 87 SBC $87fa ; (select_starty + 1)
03:ad56 : aa __ __ TAX
03:ad57 : 98 __ __ TYA
03:ad58 : 18 __ __ CLC
03:ad59 : 69 01 __ ADC #$01
03:ad5b : 8d 75 8a STA $8a75 ; (select_height + 0)
03:ad5e : 90 01 __ BCC $ad61 ; (lineandbox.s1060 + 0)
.s1059:
03:ad60 : e8 __ __ INX
.s1060:
03:ad61 : 8e 76 8a STX $8a76 ; (select_height + 1)
03:ad64 : ad 75 8a LDA $8a75 ; (select_height + 0)
03:ad67 : 8d f3 ab STA $abf3 ; (sstack + 0)
03:ad6a : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
03:ad6d : ad fc ab LDA $abfc ; (sstack + 9)
03:ad70 : c9 01 __ CMP #$01
03:ad72 : f0 37 __ BEQ $adab ; (lineandbox.l291 + 0)
.s62:
03:ad74 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
03:ad77 : ad fe 86 LDA $86fe ; (showbar + 0)
03:ad7a : f0 03 __ BEQ $ad7f ; (lineandbox.s77 + 0)
.s75:
03:ad7c : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s77:
03:ad7f : a5 56 __ LDA T2 + 0 
03:ad81 : f0 0a __ BEQ $ad8d ; (lineandbox.s238 + 0)
.s78:
03:ad83 : a9 01 __ LDA #$01
03:ad85 : 8d 71 8a STA $8a71 ; (select_accept + 0)
03:ad88 : a9 00 __ LDA #$00
03:ad8a : 8d 72 8a STA $8a72 ; (select_accept + 1)
.s238:
03:ad8d : ad fc ab LDA $abfc ; (sstack + 9)
03:ad90 : f0 0b __ BEQ $ad9d ; (lineandbox.s1001 + 0)
.s81:
03:ad92 : a2 ff __ LDX #$ff
.l1007:
03:ad94 : e8 __ __ INX
03:ad95 : bd f9 b0 LDA $b0f9,x 
03:ad98 : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:ad9b : d0 f7 __ BNE $ad94 ; (lineandbox.l1007 + 0)
.s1001:
03:ad9d : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
03:ada0 : a2 05 __ LDX #$05
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
03:adbe : ad ab 87 LDA $87ab ; (canvas + 3)
03:adc1 : 85 1b __ STA ACCU + 0 
03:adc3 : ad ac 87 LDA $87ac ; (canvas + 4)
03:adc6 : 85 1c __ STA ACCU + 1 
03:adc8 : a5 53 __ LDA T0 + 0 
03:adca : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
03:adcd : 18 __ __ CLC
03:adce : a5 06 __ LDA WORK + 3 
03:add0 : 69 58 __ ADC #$58
03:add2 : aa __ __ TAX
03:add3 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:add6 : 18 __ __ CLC
03:add7 : 65 05 __ ADC WORK + 2 
03:add9 : 85 0d __ STA P0 
03:addb : 8a __ __ TXA
03:addc : 6d f8 87 ADC $87f8 ; (select_startx + 1)
03:addf : 85 0e __ STA P1 
03:ade1 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
03:ade4 : 85 0f __ STA P2 
03:ade6 : ad 73 8a LDA $8a73 ; (select_width + 0)
03:ade9 : 85 10 __ STA P3 
03:adeb : ad 74 8a LDA $8a74 ; (select_width + 1)
03:adee : 85 55 __ STA T1 + 1 
03:adf0 : 85 11 __ STA P4 
03:adf2 : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
03:adf5 : a5 55 __ LDA T1 + 1 
03:adf7 : 85 11 __ STA P4 
03:adf9 : ad ab 87 LDA $87ab ; (canvas + 3)
03:adfc : 85 1b __ STA ACCU + 0 
03:adfe : ad ac 87 LDA $87ac ; (canvas + 4)
03:ae01 : 85 1c __ STA ACCU + 1 
03:ae03 : a5 53 __ LDA T0 + 0 
03:ae05 : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
03:ae08 : 18 __ __ CLC
03:ae09 : a5 06 __ LDA WORK + 3 
03:ae0b : 69 58 __ ADC #$58
03:ae0d : aa __ __ TAX
03:ae0e : 18 __ __ CLC
03:ae0f : a5 05 __ LDA WORK + 2 
03:ae11 : 6d f7 87 ADC $87f7 ; (select_startx + 0)
03:ae14 : 85 57 __ STA T3 + 0 
03:ae16 : 8a __ __ TXA
03:ae17 : 6d f8 87 ADC $87f8 ; (select_startx + 1)
03:ae1a : 85 58 __ STA T3 + 1 
03:ae1c : ad ad 87 LDA $87ad ; (canvas + 5)
03:ae1f : 85 1b __ STA ACCU + 0 
03:ae21 : ad ae 87 LDA $87ae ; (canvas + 6)
03:ae24 : 85 1c __ STA ACCU + 1 
03:ae26 : ad ab 87 LDA $87ab ; (canvas + 3)
03:ae29 : 85 03 __ STA WORK + 0 
03:ae2b : ad ac 87 LDA $87ac ; (canvas + 4)
03:ae2e : 85 04 __ STA WORK + 1 
03:ae30 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:ae33 : 18 __ __ CLC
03:ae34 : a5 05 __ LDA WORK + 2 
03:ae36 : 65 57 __ ADC T3 + 0 
03:ae38 : a8 __ __ TAY
03:ae39 : a5 06 __ LDA WORK + 3 
03:ae3b : 65 58 __ ADC T3 + 1 
03:ae3d : aa __ __ TAX
03:ae3e : 98 __ __ TYA
03:ae3f : 18 __ __ CLC
03:ae40 : 69 30 __ ADC #$30
03:ae42 : 85 0d __ STA P0 
03:ae44 : 90 01 __ BCC $ae47 ; (lineandbox.s1062 + 0)
.s1061:
03:ae46 : e8 __ __ INX
.s1062:
03:ae47 : 86 0e __ STX P1 
03:ae49 : ad f4 86 LDA $86f4 ; (plotblink + 0)
03:ae4c : 0a __ __ ASL
03:ae4d : 0a __ __ ASL
03:ae4e : 0a __ __ ASL
03:ae4f : 0a __ __ ASL
03:ae50 : 18 __ __ CLC
03:ae51 : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
03:ae54 : 85 54 __ STA T1 + 0 
03:ae56 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
03:ae59 : 4a __ __ LSR
03:ae5a : 6a __ __ ROR
03:ae5b : 6a __ __ ROR
03:ae5c : 29 c0 __ AND #$c0
03:ae5e : 6a __ __ ROR
03:ae5f : 65 54 __ ADC T1 + 0 
03:ae61 : 85 54 __ STA T1 + 0 
03:ae63 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
03:ae66 : 4a __ __ LSR
03:ae67 : 6a __ __ ROR
03:ae68 : 29 80 __ AND #$80
03:ae6a : 6a __ __ ROR
03:ae6b : 65 54 __ ADC T1 + 0 
03:ae6d : 85 54 __ STA T1 + 0 
03:ae6f : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
03:ae72 : 4a __ __ LSR
03:ae73 : a9 00 __ LDA #$00
03:ae75 : 6a __ __ ROR
03:ae76 : 65 54 __ ADC T1 + 0 
03:ae78 : 85 0f __ STA P2 
03:ae7a : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
03:ae7d : e6 53 __ INC T0 + 0 
03:ae7f : ad fd 87 LDA $87fd ; (select_endy + 0)
03:ae82 : 85 54 __ STA T1 + 0 
03:ae84 : ad fe 87 LDA $87fe ; (select_endy + 1)
03:ae87 : 85 55 __ STA T1 + 1 
03:ae89 : 4c ab ad JMP $adab ; (lineandbox.l291 + 0)
.s23:
03:ae8c : ad fa 87 LDA $87fa ; (select_starty + 1)
03:ae8f : cd fe 87 CMP $87fe ; (select_endy + 1)
03:ae92 : d0 06 __ BNE $ae9a ; (lineandbox.s1028 + 0)
.s1027:
03:ae94 : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:ae97 : cd fd 87 CMP $87fd ; (select_endy + 0)
.s1028:
03:ae9a : 90 03 __ BCC $ae9f ; (lineandbox.s24 + 0)
03:ae9c : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s24:
03:ae9f : a9 00 __ LDA #$00
03:aea1 : 8d f8 ab STA $abf8 ; (sstack + 5)
03:aea4 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:aea7 : 8d fb ab STA $abfb ; (sstack + 8)
03:aeaa : a9 01 __ LDA #$01
03:aeac : 8d fa ab STA $abfa ; (sstack + 7)
03:aeaf : 20 51 42 JSR $4251 ; (cursormove.s1000 + 0)
03:aeb2 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:aeb5 : 85 54 __ STA T1 + 0 
.l246:
03:aeb7 : ad fb 87 LDA $87fb ; (select_endx + 0)
03:aeba : 18 __ __ CLC
03:aebb : 69 01 __ ADC #$01
03:aebd : 85 57 __ STA T3 + 0 
03:aebf : ad fc 87 LDA $87fc ; (select_endx + 1)
03:aec2 : 69 00 __ ADC #$00
03:aec4 : f0 05 __ BEQ $aecb ; (lineandbox.s1025 + 0)
.s1055:
03:aec6 : a5 54 __ LDA T1 + 0 
03:aec8 : 4c d1 ae JMP $aed1 ; (lineandbox.s28 + 0)
.s1025:
03:aecb : a5 54 __ LDA T1 + 0 
03:aecd : c5 57 __ CMP T3 + 0 
03:aecf : b0 0e __ BCS $aedf ; (lineandbox.s30 + 0)
.s28:
03:aed1 : 85 12 __ STA P5 
03:aed3 : a9 00 __ LDA #$00
03:aed5 : 85 13 __ STA P6 
03:aed7 : 20 9d be JSR $be9d ; (plotvisible@proxy + 0)
03:aeda : e6 54 __ INC T1 + 0 
03:aedc : 4c b7 ae JMP $aeb7 ; (lineandbox.l246 + 0)
.s30:
03:aedf : ad b1 87 LDA $87b1 ; (canvas + 9)
03:aee2 : 18 __ __ CLC
03:aee3 : 6d ed 86 ADC $86ed ; (screen_row + 0)
03:aee6 : 8d fd 87 STA $87fd ; (select_endy + 0)
03:aee9 : ad b2 87 LDA $87b2 ; (canvas + 10)
03:aeec : 6d ee 86 ADC $86ee ; (screen_row + 1)
03:aeef : 8d fe 87 STA $87fe ; (select_endy + 1)
03:aef2 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s47:
03:aef5 : c9 1d __ CMP #$1d
03:aef7 : d0 2e __ BNE $af27 ; (lineandbox.s48 + 0)
.s10:
03:aef9 : a9 00 __ LDA #$00
03:aefb : 8d f8 ab STA $abf8 ; (sstack + 5)
03:aefe : 8d fa ab STA $abfa ; (sstack + 7)
03:af01 : 8d fb ab STA $abfb ; (sstack + 8)
03:af04 : a9 01 __ LDA #$01
03:af06 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:af09 : 20 51 42 JSR $4251 ; (cursormove.s1000 + 0)
03:af0c : ad af 87 LDA $87af ; (canvas + 7)
03:af0f : 18 __ __ CLC
03:af10 : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:af13 : 8d fb 87 STA $87fb ; (select_endx + 0)
03:af16 : ad b0 87 LDA $87b0 ; (canvas + 8)
03:af19 : 6d ec 86 ADC $86ec ; (screen_col + 1)
03:af1c : 8d fc 87 STA $87fc ; (select_endx + 1)
03:af1f : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:af22 : 85 54 __ STA T1 + 0 
03:af24 : 4c 93 af JMP $af93 ; (lineandbox.l241 + 0)
.s48:
03:af27 : b0 5d __ BCS $af86 ; (lineandbox.s49 + 0)
.s50:
03:af29 : c9 11 __ CMP #$11
03:af2b : f0 03 __ BEQ $af30 ; (lineandbox.s31 + 0)
03:af2d : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s31:
03:af30 : a9 00 __ LDA #$00
03:af32 : 8d f8 ab STA $abf8 ; (sstack + 5)
03:af35 : 8d f9 ab STA $abf9 ; (sstack + 6)
03:af38 : 8d fa ab STA $abfa ; (sstack + 7)
03:af3b : a9 01 __ LDA #$01
03:af3d : 8d fb ab STA $abfb ; (sstack + 8)
03:af40 : 20 51 42 JSR $4251 ; (cursormove.s1000 + 0)
03:af43 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:af46 : 18 __ __ CLC
03:af47 : 6d ed 86 ADC $86ed ; (screen_row + 0)
03:af4a : 8d fd 87 STA $87fd ; (select_endy + 0)
03:af4d : ad b2 87 LDA $87b2 ; (canvas + 10)
03:af50 : 6d ee 86 ADC $86ee ; (screen_row + 1)
03:af53 : 8d fe 87 STA $87fe ; (select_endy + 1)
03:af56 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:af59 : 85 54 __ STA T1 + 0 
.l243:
03:af5b : ad fb 87 LDA $87fb ; (select_endx + 0)
03:af5e : 18 __ __ CLC
03:af5f : 69 01 __ ADC #$01
03:af61 : 85 57 __ STA T3 + 0 
03:af63 : ad fc 87 LDA $87fc ; (select_endx + 1)
03:af66 : 69 00 __ ADC #$00
03:af68 : d0 17 __ BNE $af81 ; (lineandbox.s1054 + 0)
.s1033:
03:af6a : a5 54 __ LDA T1 + 0 
03:af6c : c5 57 __ CMP T3 + 0 
03:af6e : 90 03 __ BCC $af73 ; (lineandbox.s33 + 0)
03:af70 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s33:
03:af73 : 85 12 __ STA P5 
03:af75 : a9 01 __ LDA #$01
03:af77 : 85 13 __ STA P6 
03:af79 : 20 9d be JSR $be9d ; (plotvisible@proxy + 0)
03:af7c : e6 54 __ INC T1 + 0 
03:af7e : 4c 5b af JMP $af5b ; (lineandbox.l243 + 0)
.s1054:
03:af81 : a5 54 __ LDA T1 + 0 
03:af83 : 4c 73 af JMP $af73 ; (lineandbox.s33 + 0)
.s49:
03:af86 : c9 8b __ CMP #$8b
03:af88 : f0 03 __ BEQ $af8d ; (lineandbox.s36 + 0)
03:af8a : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s36:
03:af8d : 20 27 50 JSR $5027 ; (togglestatusbar.s0 + 0)
03:af90 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.l241:
03:af93 : ad fd 87 LDA $87fd ; (select_endy + 0)
03:af96 : 18 __ __ CLC
03:af97 : 69 01 __ ADC #$01
03:af99 : 85 57 __ STA T3 + 0 
03:af9b : ad fe 87 LDA $87fe ; (select_endy + 1)
03:af9e : 69 00 __ ADC #$00
03:afa0 : d0 17 __ BNE $afb9 ; (lineandbox.s1053 + 0)
.s1039:
03:afa2 : a5 54 __ LDA T1 + 0 
03:afa4 : c5 57 __ CMP T3 + 0 
03:afa6 : 90 03 __ BCC $afab ; (lineandbox.s12 + 0)
03:afa8 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s12:
03:afab : 85 11 __ STA P4 
03:afad : a9 01 __ LDA #$01
03:afaf : 85 13 __ STA P6 
03:afb1 : 20 fe af JSR $affe ; (plotvisible@proxy + 0)
03:afb4 : e6 54 __ INC T1 + 0 
03:afb6 : 4c 93 af JMP $af93 ; (lineandbox.l241 + 0)
.s1053:
03:afb9 : a5 54 __ LDA T1 + 0 
03:afbb : 4c ab af JMP $afab ; (lineandbox.s12 + 0)
.s37:
03:afbe : ad f8 87 LDA $87f8 ; (select_startx + 1)
03:afc1 : cd fc 87 CMP $87fc ; (select_endx + 1)
03:afc4 : f0 03 __ BEQ $afc9 ; (lineandbox.s1047 + 0)
03:afc6 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s1047:
03:afc9 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:afcc : cd fb 87 CMP $87fb ; (select_endx + 0)
03:afcf : f0 03 __ BEQ $afd4 ; (lineandbox.s41 + 0)
03:afd1 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s41:
03:afd4 : ad fa 87 LDA $87fa ; (select_starty + 1)
03:afd7 : cd fe 87 CMP $87fe ; (select_endy + 1)
03:afda : f0 03 __ BEQ $afdf ; (lineandbox.s1045 + 0)
03:afdc : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s1045:
03:afdf : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:afe2 : cd fd 87 CMP $87fd ; (select_endy + 0)
03:afe5 : f0 03 __ BEQ $afea ; (lineandbox.s38 + 0)
03:afe7 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
.s38:
03:afea : a9 03 __ LDA #$03
03:afec : 8d f8 ab STA $abf8 ; (sstack + 5)
03:afef : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
03:aff2 : 4c ee ac JMP $acee ; (lineandbox.s9 + 0)
--------------------------------------------------------------------
03:aff5 : __ __ __ BYT 6c 49 4e 45 2f 62 4f 58 00                      : lINE/bOX.
--------------------------------------------------------------------
plotvisible@proxy: ; plotvisible@proxy
03:affe : ad fb 87 LDA $87fb ; (select_endx + 0)
03:b001 : 85 12 __ STA P5 
--------------------------------------------------------------------
plotvisible: ; plotvisible(u8,u8,u8)->void
.s0:
03:b003 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:b006 : 85 44 __ STA T2 + 0 
03:b008 : ad b2 87 LDA $87b2 ; (canvas + 10)
03:b00b : f0 01 __ BEQ $b00e ; (plotvisible.s1010 + 0)
03:b00d : 60 __ __ RTS
.s1010:
03:b00e : a5 11 __ LDA P4 ; (row + 0)
03:b010 : c5 44 __ CMP T2 + 0 
03:b012 : b0 01 __ BCS $b015 ; (plotvisible.s6 + 0)
03:b014 : 60 __ __ RTS
.s6:
03:b015 : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
03:b018 : 18 __ __ CLC
03:b019 : 65 44 __ ADC T2 + 0 
03:b01b : a8 __ __ TAY
03:b01c : a9 00 __ LDA #$00
03:b01e : 6d b2 87 ADC $87b2 ; (canvas + 10)
03:b021 : d0 05 __ BNE $b028 ; (plotvisible.s5 + 0)
.s1008:
03:b023 : c4 11 __ CPY P4 ; (row + 0)
03:b025 : b0 01 __ BCS $b028 ; (plotvisible.s5 + 0)
03:b027 : 60 __ __ RTS
.s5:
03:b028 : ad af 87 LDA $87af ; (canvas + 7)
03:b02b : 85 45 __ STA T4 + 0 
03:b02d : ad b0 87 LDA $87b0 ; (canvas + 8)
03:b030 : f0 01 __ BEQ $b033 ; (plotvisible.s1006 + 0)
03:b032 : 60 __ __ RTS
.s1006:
03:b033 : a5 12 __ LDA P5 ; (col + 0)
03:b035 : c5 45 __ CMP T4 + 0 
03:b037 : b0 01 __ BCS $b03a ; (plotvisible.s4 + 0)
03:b039 : 60 __ __ RTS
.s4:
03:b03a : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
03:b03d : 18 __ __ CLC
03:b03e : 65 45 __ ADC T4 + 0 
03:b040 : a8 __ __ TAY
03:b041 : a9 00 __ LDA #$00
03:b043 : 6d b0 87 ADC $87b0 ; (canvas + 8)
03:b046 : d0 05 __ BNE $b04d ; (plotvisible.s1 + 0)
.s1004:
03:b048 : c4 12 __ CPY P5 ; (col + 0)
03:b04a : b0 01 __ BCS $b04d ; (plotvisible.s1 + 0)
03:b04c : 60 __ __ RTS
.s1:
03:b04d : a5 13 __ LDA P6 ; (setorrestore + 0)
03:b04f : c9 01 __ CMP #$01
03:b051 : d0 37 __ BNE $b08a ; (plotvisible.s8 + 0)
.s7:
03:b053 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
03:b056 : 85 0f __ STA P2 
03:b058 : ad f4 86 LDA $86f4 ; (plotblink + 0)
03:b05b : 0a __ __ ASL
03:b05c : 0a __ __ ASL
03:b05d : 0a __ __ ASL
03:b05e : 0a __ __ ASL
03:b05f : 18 __ __ CLC
03:b060 : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
03:b063 : 85 46 __ STA T5 + 0 
03:b065 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
03:b068 : 4a __ __ LSR
03:b069 : 6a __ __ ROR
03:b06a : 6a __ __ ROR
03:b06b : 29 c0 __ AND #$c0
03:b06d : 6a __ __ ROR
03:b06e : 65 46 __ ADC T5 + 0 
03:b070 : 85 46 __ STA T5 + 0 
03:b072 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
03:b075 : 4a __ __ LSR
03:b076 : 6a __ __ ROR
03:b077 : 29 80 __ AND #$80
03:b079 : 6a __ __ ROR
03:b07a : 65 46 __ ADC T5 + 0 
03:b07c : 85 46 __ STA T5 + 0 
03:b07e : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
03:b081 : 4a __ __ LSR
03:b082 : a9 00 __ LDA #$00
03:b084 : 6a __ __ ROR
03:b085 : 65 46 __ ADC T5 + 0 
03:b087 : 4c e5 b0 JMP $b0e5 ; (plotvisible.s1012 + 0)
.s8:
03:b08a : a9 7f __ LDA #$7f
03:b08c : 85 0d __ STA P0 
03:b08e : ad ab 87 LDA $87ab ; (canvas + 3)
03:b091 : 85 46 __ STA T5 + 0 
03:b093 : 85 1b __ STA ACCU + 0 
03:b095 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b098 : 85 47 __ STA T5 + 1 
03:b09a : 85 1c __ STA ACCU + 1 
03:b09c : a5 11 __ LDA P4 ; (row + 0)
03:b09e : 20 42 7c JSR $7c42 ; (mul16by8 + 0)
03:b0a1 : 18 __ __ CLC
03:b0a2 : a5 05 __ LDA WORK + 2 
03:b0a4 : 65 12 __ ADC P5 ; (col + 0)
03:b0a6 : 85 0e __ STA P1 
03:b0a8 : a5 06 __ LDA WORK + 3 
03:b0aa : 69 58 __ ADC #$58
03:b0ac : 85 0f __ STA P2 
03:b0ae : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
03:b0b1 : 85 43 __ STA T0 + 0 
03:b0b3 : ad ad 87 LDA $87ad ; (canvas + 5)
03:b0b6 : 85 1b __ STA ACCU + 0 
03:b0b8 : ad ae 87 LDA $87ae ; (canvas + 6)
03:b0bb : 85 1c __ STA ACCU + 1 
03:b0bd : a5 46 __ LDA T5 + 0 
03:b0bf : 85 03 __ STA WORK + 0 
03:b0c1 : a5 47 __ LDA T5 + 1 
03:b0c3 : 85 04 __ STA WORK + 1 
03:b0c5 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b0c8 : 18 __ __ CLC
03:b0c9 : a5 05 __ LDA WORK + 2 
03:b0cb : 65 0e __ ADC P1 
03:b0cd : a8 __ __ TAY
03:b0ce : a5 06 __ LDA WORK + 3 
03:b0d0 : 65 0f __ ADC P2 
03:b0d2 : aa __ __ TAX
03:b0d3 : 98 __ __ TYA
03:b0d4 : 18 __ __ CLC
03:b0d5 : 69 30 __ ADC #$30
03:b0d7 : 85 0e __ STA P1 
03:b0d9 : 90 01 __ BCC $b0dc ; (plotvisible.s1014 + 0)
.s1013:
03:b0db : e8 __ __ INX
.s1014:
03:b0dc : 86 0f __ STX P2 
03:b0de : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
03:b0e1 : a6 43 __ LDX T0 + 0 
03:b0e3 : 86 0f __ STX P2 
.s1012:
03:b0e5 : 85 10 __ STA P3 
03:b0e7 : 38 __ __ SEC
03:b0e8 : a5 11 __ LDA P4 ; (row + 0)
03:b0ea : e5 44 __ SBC T2 + 0 
03:b0ec : 85 0e __ STA P1 
03:b0ee : 38 __ __ SEC
03:b0ef : a5 12 __ LDA P5 ; (col + 0)
03:b0f1 : e5 45 __ SBC T4 + 0 
03:b0f3 : 85 0d __ STA P0 
03:b0f5 : 4c f8 34 JMP $34f8 ; (vdc_printc.s0 + 0)
.s1001:
03:b0f8 : 60 __ __ RTS
--------------------------------------------------------------------
03:b0f9 : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
movemode: ; movemode()->void
.s1000:
03:b0fe : a2 0d __ LDX #$0d
03:b100 : b5 53 __ LDA T0 + 0,x 
03:b102 : 9d c1 ab STA $abc1,x ; (projbuffer + 41)
03:b105 : ca __ __ DEX
03:b106 : 10 f8 __ BPL $b100 ; (movemode.s1000 + 2)
.s0:
03:b108 : a2 ff __ LDX #$ff
.l1002:
03:b10a : e8 __ __ INX
03:b10b : bd a5 b3 LDA $b3a5,x 
03:b10e : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:b111 : d0 f7 __ BNE $b10a ; (movemode.l1002 + 0)
.s1003:
03:b113 : 20 45 3e JSR $3e45 ; (vdcwin_cursor_toggle@proxy + 0)
03:b116 : ad fe 7a LDA $7afe ; (undoenabled + 0)
03:b119 : c9 01 __ CMP #$01
03:b11b : d0 1c __ BNE $b139 ; (movemode.s138 + 0)
.s1:
03:b11d : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
03:b120 : 85 56 __ STA T2 + 0 
03:b122 : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
03:b125 : 18 __ __ CLC
03:b126 : 69 01 __ ADC #$01
03:b128 : 8d f3 ab STA $abf3 ; (sstack + 0)
03:b12b : a9 00 __ LDA #$00
03:b12d : 85 16 __ STA P9 
03:b12f : 85 17 __ STA P10 
03:b131 : a6 56 __ LDX T2 + 0 
03:b133 : e8 __ __ INX
03:b134 : 86 18 __ STX P11 
03:b136 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s138:
03:b139 : a9 00 __ LDA #$00
03:b13b : 85 56 __ STA T2 + 0 
03:b13d : ad fe 86 LDA $86fe ; (showbar + 0)
03:b140 : f0 03 __ BEQ $b145 ; (movemode.l8 + 0)
.s4:
03:b142 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
.l8:
03:b145 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
03:b148 : a5 1b __ LDA ACCU + 0 
03:b14a : 85 53 __ STA T0 + 0 
03:b14c : c9 8c __ CMP #$8c
03:b14e : d0 0b __ BNE $b15b ; (movemode.s29 + 0)
.s25:
03:b150 : a9 03 __ LDA #$03
03:b152 : 8d f8 ab STA $abf8 ; (sstack + 5)
03:b155 : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
03:b158 : 4c 82 b1 JMP $b182 ; (movemode.s37 + 0)
.s29:
03:b15b : b0 03 __ BCS $b160 ; (movemode.s30 + 0)
03:b15d : 4c 70 b3 JMP $b370 ; (movemode.s31 + 0)
.s30:
03:b160 : c9 91 __ CMP #$91
03:b162 : d0 13 __ BNE $b177 ; (movemode.s34 + 0)
.s23:
03:b164 : 20 e3 49 JSR $49e3 ; (vdcwin_scroll_up@proxy + 0)
03:b167 : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
03:b16a : 85 56 __ STA T2 + 0 
03:b16c : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
03:b16f : a6 56 __ LDX T2 + 0 
03:b171 : 86 10 __ STX P3 
03:b173 : a8 __ __ TAY
03:b174 : 4c 5b b3 JMP $b35b ; (movemode.s153 + 0)
.s34:
03:b177 : c9 9d __ CMP #$9d
03:b179 : d0 03 __ BNE $b17e ; (movemode.s10 + 0)
03:b17b : 4c 27 b3 JMP $b327 ; (movemode.s17 + 0)
.s10:
03:b17e : c9 0d __ CMP #$0d
03:b180 : f0 0a __ BEQ $b18c ; (movemode.s9 + 0)
.s37:
03:b182 : a5 53 __ LDA T0 + 0 
03:b184 : c9 1b __ CMP #$1b
03:b186 : f0 04 __ BEQ $b18c ; (movemode.s9 + 0)
.s36:
03:b188 : c9 03 __ CMP #$03
03:b18a : d0 b9 __ BNE $b145 ; (movemode.l8 + 0)
.s9:
03:b18c : a5 56 __ LDA T2 + 0 
03:b18e : c9 01 __ CMP #$01
03:b190 : f0 2b __ BEQ $b1bd ; (movemode.s38 + 0)
.s39:
03:b192 : ad fe 7a LDA $7afe ; (undoenabled + 0)
03:b195 : c9 01 __ CMP #$01
03:b197 : d0 03 __ BNE $b19c ; (movemode.s152 + 0)
.s55:
03:b199 : 20 31 59 JSR $5931 ; (undo_escapeundo.s0 + 0)
.s152:
03:b19c : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
03:b19f : a2 ff __ LDX #$ff
.l1004:
03:b1a1 : e8 __ __ INX
03:b1a2 : bd f9 b0 LDA $b0f9,x 
03:b1a5 : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:b1a8 : d0 f7 __ BNE $b1a1 ; (movemode.l1004 + 0)
.s1005:
03:b1aa : ad fe 86 LDA $86fe ; (showbar + 0)
03:b1ad : f0 03 __ BEQ $b1b2 ; (movemode.s1001 + 0)
.s58:
03:b1af : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s1001:
03:b1b2 : a2 0d __ LDX #$0d
03:b1b4 : bd c1 ab LDA $abc1,x ; (projbuffer + 41)
03:b1b7 : 95 53 __ STA T0 + 0,x 
03:b1b9 : ca __ __ DEX
03:b1ba : 10 f8 __ BPL $b1b4 ; (movemode.s1001 + 2)
03:b1bc : 60 __ __ RTS
.s38:
03:b1bd : a5 53 __ LDA T0 + 0 
03:b1bf : c9 0d __ CMP #$0d
03:b1c1 : d0 18 __ BNE $b1db ; (movemode.s43 + 0)
.s41:
03:b1c3 : a9 00 __ LDA #$00
03:b1c5 : 85 56 __ STA T2 + 0 
.l44:
03:b1c7 : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
03:b1ca : 18 __ __ CLC
03:b1cb : 69 01 __ ADC #$01
03:b1cd : 90 04 __ BCC $b1d3 ; (movemode.s1010 + 0)
.s1052:
03:b1cf : a5 56 __ LDA T2 + 0 
03:b1d1 : b0 2a __ BCS $b1fd ; (movemode.s45 + 0)
.s1010:
03:b1d3 : 85 53 __ STA T0 + 0 
03:b1d5 : a5 56 __ LDA T2 + 0 
03:b1d7 : c5 53 __ CMP T0 + 0 
03:b1d9 : 90 22 __ BCC $b1fd ; (movemode.s45 + 0)
.s43:
03:b1db : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
03:b1de : ad fe 86 LDA $86fe ; (showbar + 0)
03:b1e1 : f0 b9 __ BEQ $b19c ; (movemode.s152 + 0)
.s52:
03:b1e3 : 85 56 __ STA T2 + 0 
03:b1e5 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
03:b1e8 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
03:b1eb : a2 ff __ LDX #$ff
.l1008:
03:b1ed : e8 __ __ INX
03:b1ee : bd f9 b0 LDA $b0f9,x 
03:b1f1 : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:b1f4 : d0 f7 __ BNE $b1ed ; (movemode.l1008 + 0)
.s1009:
03:b1f6 : a5 56 __ LDA T2 + 0 
03:b1f8 : f0 b8 __ BEQ $b1b2 ; (movemode.s1001 + 0)
03:b1fa : 4c af b1 JMP $b1af ; (movemode.s58 + 0)
.s45:
03:b1fd : 0a __ __ ASL
03:b1fe : 85 53 __ STA T0 + 0 
03:b200 : aa __ __ TAX
03:b201 : bd 00 88 LDA $8800,x ; (multab + 0)
03:b204 : 85 57 __ STA T4 + 0 
03:b206 : bd 01 88 LDA $8801,x ; (multab + 1)
03:b209 : 85 58 __ STA T4 + 1 
03:b20b : ad ab 87 LDA $87ab ; (canvas + 3)
03:b20e : 85 59 __ STA T5 + 0 
03:b210 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b213 : 85 5a __ STA T5 + 1 
03:b215 : ad af 87 LDA $87af ; (canvas + 7)
03:b218 : 85 5b __ STA T6 + 0 
03:b21a : ad b0 87 LDA $87b0 ; (canvas + 8)
03:b21d : 85 5c __ STA T6 + 1 
03:b21f : ad 97 87 LDA $8797 ; (vdc_state + 8)
03:b222 : 85 5d __ STA T7 + 0 
03:b224 : ad 98 87 LDA $8798 ; (vdc_state + 9)
03:b227 : 85 5e __ STA T7 + 1 
03:b229 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:b22c : 85 5f __ STA T8 + 0 
03:b22e : ad b2 87 LDA $87b2 ; (canvas + 10)
03:b231 : 85 60 __ STA T8 + 1 
03:b233 : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
03:b236 : 18 __ __ CLC
03:b237 : 69 01 __ ADC #$01
03:b239 : 85 12 __ STA P5 
03:b23b : a9 00 __ LDA #$00
03:b23d : 2a __ __ ROL
03:b23e : 85 13 __ STA P6 
03:b240 : a5 5d __ LDA T7 + 0 
03:b242 : 65 57 __ ADC T4 + 0 
03:b244 : 85 10 __ STA P3 
03:b246 : a5 5e __ LDA T7 + 1 
03:b248 : 65 58 __ ADC T4 + 1 
03:b24a : 85 11 __ STA P4 
03:b24c : a9 7f __ LDA #$7f
03:b24e : 85 0d __ STA P0 
03:b250 : 18 __ __ CLC
03:b251 : a5 5f __ LDA T8 + 0 
03:b253 : 65 56 __ ADC T2 + 0 
03:b255 : 85 1b __ STA ACCU + 0 
03:b257 : a5 60 __ LDA T8 + 1 
03:b259 : 69 00 __ ADC #$00
03:b25b : 85 1c __ STA ACCU + 1 
03:b25d : a5 59 __ LDA T5 + 0 
03:b25f : 85 03 __ STA WORK + 0 
03:b261 : a5 5a __ LDA T5 + 1 
03:b263 : 85 04 __ STA WORK + 1 
03:b265 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b268 : 18 __ __ CLC
03:b269 : a5 06 __ LDA WORK + 3 
03:b26b : 69 58 __ ADC #$58
03:b26d : aa __ __ TAX
03:b26e : 18 __ __ CLC
03:b26f : a5 05 __ LDA WORK + 2 
03:b271 : 65 5b __ ADC T6 + 0 
03:b273 : 85 0e __ STA P1 
03:b275 : 8a __ __ TXA
03:b276 : 65 5c __ ADC T6 + 1 
03:b278 : 85 0f __ STA P2 
03:b27a : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:b27d : a6 53 __ LDX T0 + 0 
03:b27f : bd 00 88 LDA $8800,x ; (multab + 0)
03:b282 : 85 53 __ STA T0 + 0 
03:b284 : bd 01 88 LDA $8801,x ; (multab + 1)
03:b287 : 85 54 __ STA T0 + 1 
03:b289 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b28c : 85 59 __ STA T5 + 0 
03:b28e : ad ac 87 LDA $87ac ; (canvas + 4)
03:b291 : 85 5a __ STA T5 + 1 
03:b293 : ad ad 87 LDA $87ad ; (canvas + 5)
03:b296 : 85 5b __ STA T6 + 0 
03:b298 : ad ae 87 LDA $87ae ; (canvas + 6)
03:b29b : 85 5c __ STA T6 + 1 
03:b29d : ad af 87 LDA $87af ; (canvas + 7)
03:b2a0 : 85 5d __ STA T7 + 0 
03:b2a2 : ad b0 87 LDA $87b0 ; (canvas + 8)
03:b2a5 : 85 5e __ STA T7 + 1 
03:b2a7 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:b2aa : 85 5f __ STA T8 + 0 
03:b2ac : ad b2 87 LDA $87b2 ; (canvas + 10)
03:b2af : 85 60 __ STA T8 + 1 
03:b2b1 : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
03:b2b4 : 18 __ __ CLC
03:b2b5 : 69 01 __ ADC #$01
03:b2b7 : 85 12 __ STA P5 
03:b2b9 : a9 00 __ LDA #$00
03:b2bb : 2a __ __ ROL
03:b2bc : 85 13 __ STA P6 
03:b2be : a5 53 __ LDA T0 + 0 
03:b2c0 : 6d 99 87 ADC $8799 ; (vdc_state + 10)
03:b2c3 : 85 10 __ STA P3 
03:b2c5 : a5 54 __ LDA T0 + 1 
03:b2c7 : 6d 9a 87 ADC $879a ; (vdc_state + 11)
03:b2ca : 85 11 __ STA P4 
03:b2cc : 18 __ __ CLC
03:b2cd : a5 5f __ LDA T8 + 0 
03:b2cf : 65 56 __ ADC T2 + 0 
03:b2d1 : 85 1b __ STA ACCU + 0 
03:b2d3 : a5 60 __ LDA T8 + 1 
03:b2d5 : 69 00 __ ADC #$00
03:b2d7 : 85 1c __ STA ACCU + 1 
03:b2d9 : a5 59 __ LDA T5 + 0 
03:b2db : 85 03 __ STA WORK + 0 
03:b2dd : a5 5a __ LDA T5 + 1 
03:b2df : 85 04 __ STA WORK + 1 
03:b2e1 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b2e4 : 18 __ __ CLC
03:b2e5 : a5 06 __ LDA WORK + 3 
03:b2e7 : 69 58 __ ADC #$58
03:b2e9 : aa __ __ TAX
03:b2ea : 18 __ __ CLC
03:b2eb : a5 05 __ LDA WORK + 2 
03:b2ed : 65 5d __ ADC T7 + 0 
03:b2ef : 85 53 __ STA T0 + 0 
03:b2f1 : 8a __ __ TXA
03:b2f2 : 65 5e __ ADC T7 + 1 
03:b2f4 : 85 54 __ STA T0 + 1 
03:b2f6 : a5 5b __ LDA T6 + 0 
03:b2f8 : 85 1b __ STA ACCU + 0 
03:b2fa : a5 5c __ LDA T6 + 1 
03:b2fc : 85 1c __ STA ACCU + 1 
03:b2fe : a5 59 __ LDA T5 + 0 
03:b300 : 85 03 __ STA WORK + 0 
03:b302 : a5 5a __ LDA T5 + 1 
03:b304 : 85 04 __ STA WORK + 1 
03:b306 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b309 : 18 __ __ CLC
03:b30a : a5 05 __ LDA WORK + 2 
03:b30c : 65 53 __ ADC T0 + 0 
03:b30e : a8 __ __ TAY
03:b30f : a5 06 __ LDA WORK + 3 
03:b311 : 65 54 __ ADC T0 + 1 
03:b313 : aa __ __ TAX
03:b314 : 98 __ __ TYA
03:b315 : 18 __ __ CLC
03:b316 : 69 30 __ ADC #$30
03:b318 : 85 0e __ STA P1 
03:b31a : 90 01 __ BCC $b31d ; (movemode.s1054 + 0)
.s1053:
03:b31c : e8 __ __ INX
.s1054:
03:b31d : 86 0f __ STX P2 
03:b31f : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:b322 : e6 56 __ INC T2 + 0 
03:b324 : 4c c7 b1 JMP $b1c7 ; (movemode.l44 + 0)
.s17:
03:b327 : 20 48 48 JSR $4848 ; (vdcwin_scroll_left@proxy + 0)
03:b32a : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
03:b32d : 85 56 __ STA T2 + 0 
03:b32f : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
03:b332 : 18 __ __ CLC
03:b333 : 69 01 __ ADC #$01
03:b335 : f0 1d __ BEQ $b354 ; (movemode.s151 + 0)
.s107:
03:b337 : 85 55 __ STA T1 + 0 
03:b339 : a9 20 __ LDA #$20
03:b33b : 85 0f __ STA P2 
03:b33d : a9 0f __ LDA #$0f
03:b33f : 85 10 __ STA P3 
03:b341 : a5 56 __ LDA T2 + 0 
03:b343 : 85 0d __ STA P0 
03:b345 : a9 00 __ LDA #$00
03:b347 : 85 0e __ STA P1 
.l1048:
03:b349 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
03:b34c : e6 0e __ INC P1 
03:b34e : a5 0e __ LDA P1 
03:b350 : c5 55 __ CMP T1 + 0 
03:b352 : 90 f5 __ BCC $b349 ; (movemode.l1048 + 0)
.s151:
03:b354 : a9 01 __ LDA #$01
03:b356 : 85 56 __ STA T2 + 0 
03:b358 : 4c 82 b1 JMP $b182 ; (movemode.s37 + 0)
.s153:
03:b35b : c8 __ __ INY
03:b35c : 84 13 __ STY P6 
03:b35e : a9 00 __ LDA #$00
03:b360 : 85 0f __ STA P2 
03:b362 : a9 20 __ LDA #$20
03:b364 : 85 11 __ STA P4 
03:b366 : a9 0f __ LDA #$0f
03:b368 : 85 12 __ STA P5 
03:b36a : 20 ce 2c JSR $2cce ; (vdc_hchar.s0 + 0)
03:b36d : 4c 54 b3 JMP $b354 ; (movemode.s151 + 0)
.s31:
03:b370 : c9 11 __ CMP #$11
03:b372 : d0 0d __ BNE $b381 ; (movemode.s32 + 0)
.s24:
03:b374 : 20 3a 49 JSR $493a ; (vdcwin_scroll_down@proxy + 0)
03:b377 : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
03:b37a : a8 __ __ TAY
03:b37b : a9 00 __ LDA #$00
03:b37d : 85 10 __ STA P3 
03:b37f : f0 da __ BEQ $b35b ; (movemode.s153 + 0)
.s32:
03:b381 : c9 1d __ CMP #$1d
03:b383 : f0 03 __ BEQ $b388 ; (movemode.s11 + 0)
03:b385 : 4c 7e b1 JMP $b17e ; (movemode.s10 + 0)
.s11:
03:b388 : 20 71 46 JSR $4671 ; (vdcwin_scroll_right@proxy + 0)
03:b38b : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
03:b38e : 18 __ __ CLC
03:b38f : 69 01 __ ADC #$01
03:b391 : f0 c1 __ BEQ $b354 ; (movemode.s151 + 0)
.s106:
03:b393 : 85 55 __ STA T1 + 0 
03:b395 : a9 00 __ LDA #$00
03:b397 : 85 0d __ STA P0 
03:b399 : 85 0e __ STA P1 
03:b39b : a9 20 __ LDA #$20
03:b39d : 85 0f __ STA P2 
03:b39f : a9 0f __ LDA #$0f
03:b3a1 : 85 10 __ STA P3 
03:b3a3 : d0 a4 __ BNE $b349 ; (movemode.l1048 + 0)
--------------------------------------------------------------------
03:b3a5 : __ __ __ BYT 6d 4f 56 45 00                                  : mOVE.
--------------------------------------------------------------------
selectmode: ; selectmode()->void
.s1000:
03:b3aa : a2 15 __ LDX #$15
03:b3ac : b5 53 __ LDA T0 + 0,x 
03:b3ae : 9d a9 ab STA $aba9,x ; (chareditor@stack + 22)
03:b3b1 : ca __ __ DEX
03:b3b2 : 10 f8 __ BPL $b3ac ; (selectmode.s1000 + 2)
.s0:
03:b3b4 : a9 00 __ LDA #$00
03:b3b6 : 8d fc ab STA $abfc ; (sstack + 9)
03:b3b9 : a2 ff __ LDX #$ff
.l1002:
03:b3bb : e8 __ __ INX
03:b3bc : bd 4c ba LDA $ba4c,x 
03:b3bf : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:b3c2 : d0 f7 __ BNE $b3bb ; (selectmode.l1002 + 0)
.s1003:
03:b3c4 : 20 00 ac JSR $ac00 ; (lineandbox.s1000 + 0)
03:b3c7 : ad 71 8a LDA $8a71 ; (select_accept + 0)
03:b3ca : 0d 72 8a ORA $8a72 ; (select_accept + 1)
03:b3cd : d0 03 __ BNE $b3d2 ; (selectmode.s3 + 0)
03:b3cf : 4c a3 b5 JMP $b5a3 ; (selectmode.s1001 + 0)
.s3:
03:b3d2 : a2 ff __ LDX #$ff
.l1004:
03:b3d4 : e8 __ __ INX
03:b3d5 : bd 53 ba LDA $ba53,x 
03:b3d8 : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:b3db : d0 f7 __ BNE $b3d4 ; (selectmode.l1004 + 0)
.l330:
03:b3dd : ad fe 86 LDA $86fe ; (showbar + 0)
03:b3e0 : f0 03 __ BEQ $b3e5 ; (selectmode.s9 + 0)
.s7:
03:b3e2 : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s9:
03:b3e5 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
03:b3e8 : a5 1b __ LDA ACCU + 0 
03:b3ea : 85 53 __ STA T0 + 0 
03:b3ec : c9 8b __ CMP #$8b
03:b3ee : d0 08 __ BNE $b3f8 ; (selectmode.s12 + 0)
.s10:
03:b3f0 : 20 27 50 JSR $5027 ; (togglestatusbar.s0 + 0)
03:b3f3 : a5 53 __ LDA T0 + 0 
03:b3f5 : 4c 07 b4 JMP $b407 ; (selectmode.s15 + 0)
.s12:
03:b3f8 : c9 8c __ CMP #$8c
03:b3fa : d0 0b __ BNE $b407 ; (selectmode.s15 + 0)
.s13:
03:b3fc : a9 03 __ LDA #$03
03:b3fe : 8d f8 ab STA $abf8 ; (sstack + 5)
03:b401 : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
03:b404 : 4c 0b b4 JMP $b40b ; (selectmode.s21 + 0)
.s15:
03:b407 : c9 44 __ CMP #$44
03:b409 : f0 1a __ BEQ $b425 ; (selectmode.s6 + 0)
.s21:
03:b40b : a5 53 __ LDA T0 + 0 
03:b40d : c9 58 __ CMP #$58
03:b40f : f0 14 __ BEQ $b425 ; (selectmode.s6 + 0)
.s20:
03:b411 : c9 43 __ CMP #$43
03:b413 : f0 10 __ BEQ $b425 ; (selectmode.s6 + 0)
.s19:
03:b415 : c9 50 __ CMP #$50
03:b417 : f0 0c __ BEQ $b425 ; (selectmode.s6 + 0)
.s18:
03:b419 : c9 41 __ CMP #$41
03:b41b : f0 08 __ BEQ $b425 ; (selectmode.s6 + 0)
.s17:
03:b41d : c9 1b __ CMP #$1b
03:b41f : f0 0e __ BEQ $b42f ; (selectmode.s23 + 0)
.s16:
03:b421 : c9 03 __ CMP #$03
03:b423 : d0 b8 __ BNE $b3dd ; (selectmode.l330 + 0)
.s6:
03:b425 : a5 53 __ LDA T0 + 0 
03:b427 : c9 1b __ CMP #$1b
03:b429 : f0 04 __ BEQ $b42f ; (selectmode.s23 + 0)
.s25:
03:b42b : c9 03 __ CMP #$03
03:b42d : d0 06 __ BNE $b435 ; (selectmode.s22 + 0)
.s23:
03:b42f : 20 31 59 JSR $5931 ; (undo_escapeundo.s0 + 0)
03:b432 : 4c 98 b5 JMP $b598 ; (selectmode.s1105 + 0)
.s22:
03:b435 : c9 58 __ CMP #$58
03:b437 : d0 04 __ BNE $b43d ; (selectmode.s1009 + 0)
.s1008:
03:b439 : a2 01 __ LDX #$01
03:b43b : d0 06 __ BNE $b443 ; (selectmode.s29 + 0)
.s1009:
03:b43d : a2 00 __ LDX #$00
03:b43f : c9 43 __ CMP #$43
03:b441 : d0 1b __ BNE $b45e ; (selectmode.s28 + 0)
.s29:
03:b443 : a9 10 __ LDA #$10
03:b445 : cd 74 8a CMP $8a74 ; (select_width + 1)
03:b448 : d0 05 __ BNE $b44f ; (selectmode.s1078 + 0)
.s1077:
03:b44a : a9 00 __ LDA #$00
03:b44c : cd 73 8a CMP $8a73 ; (select_width + 0)
.s1078:
03:b44f : b0 0d __ BCS $b45e ; (selectmode.s28 + 0)
.s26:
03:b451 : 20 73 59 JSR $5973 ; (loadsyscharset.s0 + 0)
03:b454 : a9 5e __ LDA #$5e
03:b456 : 8d f6 ab STA $abf6 ; (sstack + 3)
03:b459 : a9 ba __ LDA #$ba
03:b45b : 4c 2f ba JMP $ba2f ; (selectmode.s1106 + 0)
.s28:
03:b45e : 8a __ __ TXA
03:b45f : f0 07 __ BEQ $b468 ; (selectmode.s35 + 0)
.s36:
03:b461 : a9 ba __ LDA #$ba
03:b463 : a2 71 __ LDX #$71
03:b465 : 4c 17 b7 JMP $b717 ; (selectmode.s355 + 0)
.s35:
03:b468 : a5 53 __ LDA T0 + 0 
03:b46a : c9 43 __ CMP #$43
03:b46c : d0 07 __ BNE $b475 ; (selectmode.s34 + 0)
.s32:
03:b46e : a9 ba __ LDA #$ba
03:b470 : a2 75 __ LDX #$75
03:b472 : 4c 17 b7 JMP $b717 ; (selectmode.s355 + 0)
.s34:
03:b475 : a5 53 __ LDA T0 + 0 
03:b477 : c9 44 __ CMP #$44
03:b479 : d0 13 __ BNE $b48e ; (selectmode.s94 + 0)
.s92:
03:b47b : ad 75 8a LDA $8a75 ; (select_height + 0)
03:b47e : 0d 76 8a ORA $8a76 ; (select_height + 1)
03:b481 : f0 0b __ BEQ $b48e ; (selectmode.s94 + 0)
.s135:
03:b483 : a9 00 __ LDA #$00
03:b485 : 85 56 __ STA T2 + 0 
03:b487 : a9 20 __ LDA #$20
03:b489 : 85 0f __ STA P2 
03:b48b : 4c 60 b6 JMP $b660 ; (selectmode.l1103 + 0)
.s94:
03:b48e : a5 53 __ LDA T0 + 0 
03:b490 : c9 41 __ CMP #$41
03:b492 : d0 0f __ BNE $b4a3 ; (selectmode.s105 + 0)
.s103:
03:b494 : ad 75 8a LDA $8a75 ; (select_height + 0)
03:b497 : 0d 76 8a ORA $8a76 ; (select_height + 1)
03:b49a : f0 07 __ BEQ $b4a3 ; (selectmode.s105 + 0)
.s134:
03:b49c : a9 00 __ LDA #$00
03:b49e : 85 56 __ STA T2 + 0 
03:b4a0 : 4c ae b5 JMP $b5ae ; (selectmode.l107 + 0)
.s105:
03:b4a3 : a5 53 __ LDA T0 + 0 
03:b4a5 : c9 50 __ CMP #$50
03:b4a7 : f0 03 __ BEQ $b4ac ; (selectmode.s114 + 0)
03:b4a9 : 4c 8a b5 JMP $b58a ; (selectmode.s116 + 0)
.s114:
03:b4ac : ad 75 8a LDA $8a75 ; (select_height + 0)
03:b4af : 0d 76 8a ORA $8a76 ; (select_height + 1)
03:b4b2 : d0 03 __ BNE $b4b7 ; (selectmode.s133 + 0)
03:b4b4 : 4c 8a b5 JMP $b58a ; (selectmode.s116 + 0)
.s133:
03:b4b7 : ad 73 8a LDA $8a73 ; (select_width + 0)
03:b4ba : 0d 74 8a ORA $8a74 ; (select_width + 1)
03:b4bd : c9 01 __ CMP #$01
03:b4bf : a9 00 __ LDA #$00
03:b4c1 : 85 57 __ STA T3 + 0 
03:b4c3 : 2a __ __ ROL
03:b4c4 : d0 17 __ BNE $b4dd ; (selectmode.l132 + 0)
.s1110:
03:b4c6 : a2 00 __ LDX #$00
03:b4c8 : a0 00 __ LDY #$00
.l119:
03:b4ca : e8 __ __ INX
03:b4cb : ad 76 8a LDA $8a76 ; (select_height + 1)
03:b4ce : d0 08 __ BNE $b4d8 ; (selectmode.s118 + 0)
.s1022:
03:b4d0 : ec 75 8a CPX $8a75 ; (select_height + 0)
03:b4d3 : 90 03 __ BCC $b4d8 ; (selectmode.s118 + 0)
03:b4d5 : 4c 8a b5 JMP $b58a ; (selectmode.s116 + 0)
.s118:
03:b4d8 : 98 __ __ TYA
03:b4d9 : f0 ef __ BEQ $b4ca ; (selectmode.l119 + 0)
.s1107:
03:b4db : 86 57 __ STX T3 + 0 
.l132:
03:b4dd : 85 56 __ STA T2 + 0 
03:b4df : a5 57 __ LDA T3 + 0 
03:b4e1 : 85 53 __ STA T0 + 0 
03:b4e3 : a9 00 __ LDA #$00
03:b4e5 : 85 66 __ STA T11 + 0 
.l122:
03:b4e7 : a9 7f __ LDA #$7f
03:b4e9 : 85 0d __ STA P0 
03:b4eb : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:b4ee : 18 __ __ CLC
03:b4ef : 65 66 __ ADC T11 + 0 
03:b4f1 : 85 54 __ STA T1 + 0 
03:b4f3 : ad f8 87 LDA $87f8 ; (select_startx + 1)
03:b4f6 : 69 00 __ ADC #$00
03:b4f8 : 85 55 __ STA T1 + 1 
03:b4fa : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:b4fd : 18 __ __ CLC
03:b4fe : 65 53 __ ADC T0 + 0 
03:b500 : 85 03 __ STA WORK + 0 
03:b502 : ad fa 87 LDA $87fa ; (select_starty + 1)
03:b505 : 69 00 __ ADC #$00
03:b507 : 85 04 __ STA WORK + 1 
03:b509 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b50c : 85 1b __ STA ACCU + 0 
03:b50e : ad ac 87 LDA $87ac ; (canvas + 4)
03:b511 : 85 1c __ STA ACCU + 1 
03:b513 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b516 : 18 __ __ CLC
03:b517 : a5 06 __ LDA WORK + 3 
03:b519 : 69 58 __ ADC #$58
03:b51b : aa __ __ TAX
03:b51c : 18 __ __ CLC
03:b51d : a5 05 __ LDA WORK + 2 
03:b51f : 65 54 __ ADC T1 + 0 
03:b521 : 85 54 __ STA T1 + 0 
03:b523 : 8a __ __ TXA
03:b524 : 65 55 __ ADC T1 + 1 
03:b526 : 85 55 __ STA T1 + 1 
03:b528 : ad ad 87 LDA $87ad ; (canvas + 5)
03:b52b : 85 1b __ STA ACCU + 0 
03:b52d : ad ae 87 LDA $87ae ; (canvas + 6)
03:b530 : 85 1c __ STA ACCU + 1 
03:b532 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b535 : 85 03 __ STA WORK + 0 
03:b537 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b53a : 85 04 __ STA WORK + 1 
03:b53c : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b53f : 18 __ __ CLC
03:b540 : a5 05 __ LDA WORK + 2 
03:b542 : 65 54 __ ADC T1 + 0 
03:b544 : aa __ __ TAX
03:b545 : a5 06 __ LDA WORK + 3 
03:b547 : 65 55 __ ADC T1 + 1 
03:b549 : a8 __ __ TAY
03:b54a : 8a __ __ TXA
03:b54b : 18 __ __ CLC
03:b54c : 69 30 __ ADC #$30
03:b54e : 85 0e __ STA P1 
03:b550 : 90 01 __ BCC $b553 ; (selectmode.s1122 + 0)
.s1121:
03:b552 : c8 __ __ INY
.s1122:
03:b553 : 84 0f __ STY P2 
03:b555 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
03:b558 : 29 f0 __ AND #$f0
03:b55a : 85 54 __ STA T1 + 0 
03:b55c : a5 0e __ LDA P1 
03:b55e : 85 0d __ STA P0 
03:b560 : a5 0f __ LDA P2 
03:b562 : 85 0e __ STA P1 
03:b564 : ad f1 86 LDA $86f1 ; (plotcolor + 0)
03:b567 : 18 __ __ CLC
03:b568 : 65 54 __ ADC T1 + 0 
03:b56a : 85 0f __ STA P2 
03:b56c : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
03:b56f : e6 66 __ INC T11 + 0 
03:b571 : ad 74 8a LDA $8a74 ; (select_width + 1)
03:b574 : f0 03 __ BEQ $b579 ; (selectmode.s1020 + 0)
03:b576 : 4c e7 b4 JMP $b4e7 ; (selectmode.l122 + 0)
.s1020:
03:b579 : a5 66 __ LDA T11 + 0 
03:b57b : cd 73 8a CMP $8a73 ; (select_width + 0)
03:b57e : b0 03 __ BCS $b583 ; (selectmode.s1109 + 0)
03:b580 : 4c e7 b4 JMP $b4e7 ; (selectmode.l122 + 0)
.s1109:
03:b583 : a6 57 __ LDX T3 + 0 
03:b585 : a4 56 __ LDY T2 + 0 
03:b587 : 4c ca b4 JMP $b4ca ; (selectmode.l119 + 0)
.s116:
03:b58a : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
03:b58d : ad fe 86 LDA $86fe ; (showbar + 0)
03:b590 : f0 03 __ BEQ $b595 ; (selectmode.s131 + 0)
.s129:
03:b592 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s131:
03:b595 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
.s1105:
03:b598 : a2 ff __ LDX #$ff
.l1006:
03:b59a : e8 __ __ INX
03:b59b : bd f9 b0 LDA $b0f9,x 
03:b59e : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:b5a1 : d0 f7 __ BNE $b59a ; (selectmode.l1006 + 0)
.s1001:
03:b5a3 : a2 15 __ LDX #$15
03:b5a5 : bd a9 ab LDA $aba9,x ; (chareditor@stack + 22)
03:b5a8 : 95 53 __ STA T0 + 0,x 
03:b5aa : ca __ __ DEX
03:b5ab : 10 f8 __ BPL $b5a5 ; (selectmode.s1001 + 2)
03:b5ad : 60 __ __ RTS
.l107:
03:b5ae : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:b5b1 : 18 __ __ CLC
03:b5b2 : 65 56 __ ADC T2 + 0 
03:b5b4 : 85 03 __ STA WORK + 0 
03:b5b6 : ad fa 87 LDA $87fa ; (select_starty + 1)
03:b5b9 : 69 00 __ ADC #$00
03:b5bb : 85 04 __ STA WORK + 1 
03:b5bd : ad ab 87 LDA $87ab ; (canvas + 3)
03:b5c0 : 85 1b __ STA ACCU + 0 
03:b5c2 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b5c5 : 85 1c __ STA ACCU + 1 
03:b5c7 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b5ca : 18 __ __ CLC
03:b5cb : a5 06 __ LDA WORK + 3 
03:b5cd : 69 58 __ ADC #$58
03:b5cf : aa __ __ TAX
03:b5d0 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:b5d3 : 18 __ __ CLC
03:b5d4 : 65 05 __ ADC WORK + 2 
03:b5d6 : 85 54 __ STA T1 + 0 
03:b5d8 : 8a __ __ TXA
03:b5d9 : 6d f8 87 ADC $87f8 ; (select_startx + 1)
03:b5dc : 85 55 __ STA T1 + 1 
03:b5de : ad ad 87 LDA $87ad ; (canvas + 5)
03:b5e1 : 85 1b __ STA ACCU + 0 
03:b5e3 : ad ae 87 LDA $87ae ; (canvas + 6)
03:b5e6 : 85 1c __ STA ACCU + 1 
03:b5e8 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b5eb : 85 03 __ STA WORK + 0 
03:b5ed : ad ac 87 LDA $87ac ; (canvas + 4)
03:b5f0 : 85 04 __ STA WORK + 1 
03:b5f2 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b5f5 : 18 __ __ CLC
03:b5f6 : a5 05 __ LDA WORK + 2 
03:b5f8 : 65 54 __ ADC T1 + 0 
03:b5fa : aa __ __ TAX
03:b5fb : a5 06 __ LDA WORK + 3 
03:b5fd : 65 55 __ ADC T1 + 1 
03:b5ff : a8 __ __ TAY
03:b600 : 8a __ __ TXA
03:b601 : 18 __ __ CLC
03:b602 : 69 30 __ ADC #$30
03:b604 : 85 0d __ STA P0 
03:b606 : 90 01 __ BCC $b609 ; (selectmode.s1120 + 0)
.s1119:
03:b608 : c8 __ __ INY
.s1120:
03:b609 : 84 0e __ STY P1 
03:b60b : ad f4 86 LDA $86f4 ; (plotblink + 0)
03:b60e : 0a __ __ ASL
03:b60f : 0a __ __ ASL
03:b610 : 0a __ __ ASL
03:b611 : 0a __ __ ASL
03:b612 : 18 __ __ CLC
03:b613 : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
03:b616 : 85 54 __ STA T1 + 0 
03:b618 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
03:b61b : 4a __ __ LSR
03:b61c : 6a __ __ ROR
03:b61d : 6a __ __ ROR
03:b61e : 29 c0 __ AND #$c0
03:b620 : 6a __ __ ROR
03:b621 : 65 54 __ ADC T1 + 0 
03:b623 : 85 54 __ STA T1 + 0 
03:b625 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
03:b628 : 4a __ __ LSR
03:b629 : 6a __ __ ROR
03:b62a : 29 80 __ AND #$80
03:b62c : 6a __ __ ROR
03:b62d : 65 54 __ ADC T1 + 0 
03:b62f : 85 54 __ STA T1 + 0 
03:b631 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
03:b634 : 4a __ __ LSR
03:b635 : a9 00 __ LDA #$00
03:b637 : 6a __ __ ROR
03:b638 : 65 54 __ ADC T1 + 0 
03:b63a : 85 0f __ STA P2 
03:b63c : ad 73 8a LDA $8a73 ; (select_width + 0)
03:b63f : 85 10 __ STA P3 
03:b641 : ad 74 8a LDA $8a74 ; (select_width + 1)
03:b644 : 85 11 __ STA P4 
03:b646 : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
03:b649 : e6 56 __ INC T2 + 0 
03:b64b : ad 76 8a LDA $8a76 ; (select_height + 1)
03:b64e : f0 03 __ BEQ $b653 ; (selectmode.s1026 + 0)
03:b650 : 4c ae b5 JMP $b5ae ; (selectmode.l107 + 0)
.s1026:
03:b653 : a5 56 __ LDA T2 + 0 
03:b655 : cd 75 8a CMP $8a75 ; (select_height + 0)
03:b658 : b0 03 __ BCS $b65d ; (selectmode.s1026 + 10)
03:b65a : 4c ae b5 JMP $b5ae ; (selectmode.l107 + 0)
03:b65d : 4c a3 b4 JMP $b4a3 ; (selectmode.s105 + 0)
.l1103:
03:b660 : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:b663 : 18 __ __ CLC
03:b664 : 65 56 __ ADC T2 + 0 
03:b666 : 85 54 __ STA T1 + 0 
03:b668 : 85 03 __ STA WORK + 0 
03:b66a : ad fa 87 LDA $87fa ; (select_starty + 1)
03:b66d : 69 00 __ ADC #$00
03:b66f : 85 55 __ STA T1 + 1 
03:b671 : 85 04 __ STA WORK + 1 
03:b673 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b676 : 85 1b __ STA ACCU + 0 
03:b678 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b67b : 85 1c __ STA ACCU + 1 
03:b67d : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b680 : 18 __ __ CLC
03:b681 : a5 06 __ LDA WORK + 3 
03:b683 : 69 58 __ ADC #$58
03:b685 : aa __ __ TAX
03:b686 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:b689 : 18 __ __ CLC
03:b68a : 65 05 __ ADC WORK + 2 
03:b68c : 85 0d __ STA P0 
03:b68e : 8a __ __ TXA
03:b68f : 6d f8 87 ADC $87f8 ; (select_startx + 1)
03:b692 : 85 0e __ STA P1 
03:b694 : ad 73 8a LDA $8a73 ; (select_width + 0)
03:b697 : 85 10 __ STA P3 
03:b699 : ad 74 8a LDA $8a74 ; (select_width + 1)
03:b69c : 85 59 __ STA T4 + 1 
03:b69e : 85 11 __ STA P4 
03:b6a0 : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
03:b6a3 : a5 59 __ LDA T4 + 1 
03:b6a5 : 85 11 __ STA P4 
03:b6a7 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b6aa : 85 1b __ STA ACCU + 0 
03:b6ac : ad ac 87 LDA $87ac ; (canvas + 4)
03:b6af : 85 1c __ STA ACCU + 1 
03:b6b1 : a5 54 __ LDA T1 + 0 
03:b6b3 : 85 03 __ STA WORK + 0 
03:b6b5 : a5 55 __ LDA T1 + 1 
03:b6b7 : 85 04 __ STA WORK + 1 
03:b6b9 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b6bc : 18 __ __ CLC
03:b6bd : a5 06 __ LDA WORK + 3 
03:b6bf : 69 58 __ ADC #$58
03:b6c1 : aa __ __ TAX
03:b6c2 : 18 __ __ CLC
03:b6c3 : a5 05 __ LDA WORK + 2 
03:b6c5 : 6d f7 87 ADC $87f7 ; (select_startx + 0)
03:b6c8 : 85 54 __ STA T1 + 0 
03:b6ca : 8a __ __ TXA
03:b6cb : 6d f8 87 ADC $87f8 ; (select_startx + 1)
03:b6ce : 85 55 __ STA T1 + 1 
03:b6d0 : ad ad 87 LDA $87ad ; (canvas + 5)
03:b6d3 : 85 1b __ STA ACCU + 0 
03:b6d5 : ad ae 87 LDA $87ae ; (canvas + 6)
03:b6d8 : 85 1c __ STA ACCU + 1 
03:b6da : ad ab 87 LDA $87ab ; (canvas + 3)
03:b6dd : 85 03 __ STA WORK + 0 
03:b6df : ad ac 87 LDA $87ac ; (canvas + 4)
03:b6e2 : 85 04 __ STA WORK + 1 
03:b6e4 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b6e7 : 18 __ __ CLC
03:b6e8 : a5 05 __ LDA WORK + 2 
03:b6ea : 65 54 __ ADC T1 + 0 
03:b6ec : aa __ __ TAX
03:b6ed : a5 06 __ LDA WORK + 3 
03:b6ef : 65 55 __ ADC T1 + 1 
03:b6f1 : a8 __ __ TAY
03:b6f2 : 8a __ __ TXA
03:b6f3 : 18 __ __ CLC
03:b6f4 : 69 30 __ ADC #$30
03:b6f6 : 85 0d __ STA P0 
03:b6f8 : 90 01 __ BCC $b6fb ; (selectmode.s1118 + 0)
.s1117:
03:b6fa : c8 __ __ INY
.s1118:
03:b6fb : 84 0e __ STY P1 
03:b6fd : 20 e0 14 JSR $14e0 ; (bnk_memset.s0 + 0)
03:b700 : e6 56 __ INC T2 + 0 
03:b702 : ad 76 8a LDA $8a76 ; (select_height + 1)
03:b705 : f0 03 __ BEQ $b70a ; (selectmode.s1030 + 0)
03:b707 : 4c 60 b6 JMP $b660 ; (selectmode.l1103 + 0)
.s1030:
03:b70a : a5 56 __ LDA T2 + 0 
03:b70c : cd 75 8a CMP $8a75 ; (select_height + 0)
03:b70f : b0 03 __ BCS $b714 ; (selectmode.s1030 + 10)
03:b711 : 4c 60 b6 JMP $b660 ; (selectmode.l1103 + 0)
03:b714 : 4c 8e b4 JMP $b48e ; (selectmode.s94 + 0)
.s355:
03:b717 : 86 54 __ STX T1 + 0 
03:b719 : 85 55 __ STA T1 + 1 
03:b71b : a0 ff __ LDY #$ff
.l1034:
03:b71d : c8 __ __ INY
03:b71e : b1 54 __ LDA (T1 + 0),y 
03:b720 : 99 e1 88 STA $88e1,y ; (programmode + 0)
03:b723 : d0 f8 __ BNE $b71d ; (selectmode.l1034 + 0)
.l335:
03:b725 : ad fe 86 LDA $86fe ; (showbar + 0)
03:b728 : f0 03 __ BEQ $b72d ; (selectmode.s43 + 0)
.s41:
03:b72a : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s43:
03:b72d : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
03:b730 : a5 1b __ LDA ACCU + 0 
03:b732 : 85 54 __ STA T1 + 0 
03:b734 : c9 8c __ CMP #$8c
03:b736 : d0 0d __ BNE $b745 ; (selectmode.s50 + 0)
.s46:
03:b738 : a9 03 __ LDA #$03
03:b73a : 8d f8 ab STA $abf8 ; (sstack + 5)
03:b73d : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
03:b740 : a5 54 __ LDA T1 + 0 
03:b742 : 4c 60 b7 JMP $b760 ; (selectmode.s58 + 0)
.s50:
03:b745 : b0 03 __ BCS $b74a ; (selectmode.s51 + 0)
03:b747 : 4c 3b ba JMP $ba3b ; (selectmode.s52 + 0)
.s51:
03:b74a : c9 91 __ CMP #$91
03:b74c : f0 04 __ BEQ $b752 ; (selectmode.s45 + 0)
.s55:
03:b74e : c9 9d __ CMP #$9d
03:b750 : d0 0a __ BNE $b75c ; (selectmode.s44 + 0)
.s45:
03:b752 : a5 1b __ LDA ACCU + 0 
03:b754 : 8d fc ab STA $abfc ; (sstack + 9)
03:b757 : 20 4d 41 JSR $414d ; (plotmove.s1000 + 0)
03:b75a : a5 54 __ LDA T1 + 0 
.s44:
03:b75c : c9 1b __ CMP #$1b
03:b75e : f0 08 __ BEQ $b768 ; (selectmode.s40 + 0)
.s58:
03:b760 : c9 03 __ CMP #$03
03:b762 : f0 04 __ BEQ $b768 ; (selectmode.s40 + 0)
.s57:
03:b764 : c9 0d __ CMP #$0d
03:b766 : d0 bd __ BNE $b725 ; (selectmode.l335 + 0)
.s40:
03:b768 : a5 54 __ LDA T1 + 0 
03:b76a : c9 0d __ CMP #$0d
03:b76c : f0 03 __ BEQ $b771 ; (selectmode.s59 + 0)
03:b76e : 4c 75 b4 JMP $b475 ; (selectmode.s34 + 0)
.s59:
03:b771 : ad af 87 LDA $87af ; (canvas + 7)
03:b774 : 18 __ __ CLC
03:b775 : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:b778 : 85 54 __ STA T1 + 0 
03:b77a : ad b0 87 LDA $87b0 ; (canvas + 8)
03:b77d : 6d ec 86 ADC $86ec ; (screen_col + 1)
03:b780 : 85 55 __ STA T1 + 1 
03:b782 : ad 73 8a LDA $8a73 ; (select_width + 0)
03:b785 : 85 58 __ STA T4 + 0 
03:b787 : 18 __ __ CLC
03:b788 : 65 54 __ ADC T1 + 0 
03:b78a : 85 5a __ STA T5 + 0 
03:b78c : ad 74 8a LDA $8a74 ; (select_width + 1)
03:b78f : 85 59 __ STA T4 + 1 
03:b791 : 65 55 __ ADC T1 + 1 
03:b793 : 85 5b __ STA T5 + 1 
03:b795 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b798 : c5 5b __ CMP T5 + 1 
03:b79a : d0 05 __ BNE $b7a1 ; (selectmode.s1052 + 0)
.s1051:
03:b79c : ad ab 87 LDA $87ab ; (canvas + 3)
03:b79f : c5 5a __ CMP T5 + 0 
.s1052:
03:b7a1 : 90 36 __ BCC $b7d9 ; (selectmode.s62 + 0)
.s65:
03:b7a3 : ad ed 86 LDA $86ed ; (screen_row + 0)
03:b7a6 : 85 5a __ STA T5 + 0 
03:b7a8 : 18 __ __ CLC
03:b7a9 : 6d b1 87 ADC $87b1 ; (canvas + 9)
03:b7ac : 85 5c __ STA T6 + 0 
03:b7ae : ad ee 86 LDA $86ee ; (screen_row + 1)
03:b7b1 : 85 5b __ STA T5 + 1 
03:b7b3 : 6d b2 87 ADC $87b2 ; (canvas + 10)
03:b7b6 : 85 5d __ STA T6 + 1 
03:b7b8 : ad 75 8a LDA $8a75 ; (select_height + 0)
03:b7bb : 85 5e __ STA T7 + 0 
03:b7bd : 18 __ __ CLC
03:b7be : 65 5c __ ADC T6 + 0 
03:b7c0 : 85 60 __ STA T8 + 0 
03:b7c2 : ad 76 8a LDA $8a76 ; (select_height + 1)
03:b7c5 : 85 5f __ STA T7 + 1 
03:b7c7 : 65 5d __ ADC T6 + 1 
03:b7c9 : 85 61 __ STA T8 + 1 
03:b7cb : ad ae 87 LDA $87ae ; (canvas + 6)
03:b7ce : c5 61 __ CMP T8 + 1 
03:b7d0 : d0 05 __ BNE $b7d7 ; (selectmode.s1050 + 0)
.s1049:
03:b7d2 : ad ad 87 LDA $87ad ; (canvas + 5)
03:b7d5 : c5 60 __ CMP T8 + 0 
.s1050:
03:b7d7 : b0 0d __ BCS $b7e6 ; (selectmode.s64 + 0)
.s62:
03:b7d9 : 20 73 59 JSR $5973 ; (loadsyscharset.s0 + 0)
03:b7dc : a9 7a __ LDA #$7a
03:b7de : 8d f6 ab STA $abf6 ; (sstack + 3)
03:b7e1 : a9 ba __ LDA #$ba
03:b7e3 : 4c 2f ba JMP $ba2f ; (selectmode.s1106 + 0)
.s64:
03:b7e6 : a5 53 __ LDA T0 + 0 
03:b7e8 : c9 43 __ CMP #$43
03:b7ea : d0 03 __ BNE $b7ef ; (selectmode.s69 + 0)
.s67:
03:b7ec : 20 31 59 JSR $5931 ; (undo_escapeundo.s0 + 0)
.s69:
03:b7ef : a5 5c __ LDA T6 + 0 
03:b7f1 : 85 16 __ STA P9 
03:b7f3 : a5 54 __ LDA T1 + 0 
03:b7f5 : 85 17 __ STA P10 
03:b7f7 : a5 58 __ LDA T4 + 0 
03:b7f9 : 85 18 __ STA P11 
03:b7fb : a5 5e __ LDA T7 + 0 
03:b7fd : 8d f3 ab STA $abf3 ; (sstack + 0)
03:b800 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
03:b803 : a5 5e __ LDA T7 + 0 
03:b805 : 05 5f __ ORA T7 + 1 
03:b807 : d0 03 __ BNE $b80c ; (selectmode.s136 + 0)
03:b809 : 4c 75 b4 JMP $b475 ; (selectmode.s34 + 0)
.s136:
03:b80c : a5 53 __ LDA T0 + 0 
03:b80e : c9 58 __ CMP #$58
03:b810 : d0 04 __ BNE $b816 ; (selectmode.s1037 + 0)
.s1036:
03:b812 : a9 01 __ LDA #$01
03:b814 : d0 02 __ BNE $b818 ; (selectmode.s1038 + 0)
.s1037:
03:b816 : a9 00 __ LDA #$00
.s1038:
03:b818 : 85 56 __ STA T2 + 0 
03:b81a : a9 00 __ LDA #$00
03:b81c : 85 57 __ STA T3 + 0 
03:b81e : ad f9 87 LDA $87f9 ; (select_starty + 0)
03:b821 : 85 54 __ STA T1 + 0 
03:b823 : ad fa 87 LDA $87fa ; (select_starty + 1)
03:b826 : 85 55 __ STA T1 + 1 
03:b828 : ad f7 87 LDA $87f7 ; (select_startx + 0)
03:b82b : 85 5c __ STA T6 + 0 
03:b82d : ad f8 87 LDA $87f8 ; (select_startx + 1)
03:b830 : 85 5d __ STA T6 + 1 
03:b832 : ad 9b 87 LDA $879b ; (vdc_state + 12)
03:b835 : 85 60 __ STA T8 + 0 
03:b837 : ad 9c 87 LDA $879c ; (vdc_state + 13)
03:b83a : 85 61 __ STA T8 + 1 
.l71:
03:b83c : a9 7f __ LDA #$7f
03:b83e : 85 11 __ STA P4 
03:b840 : a5 57 __ LDA T3 + 0 
03:b842 : 85 62 __ STA T9 + 0 
03:b844 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:b847 : 18 __ __ CLC
03:b848 : 65 5a __ ADC T5 + 0 
03:b84a : aa __ __ TAX
03:b84b : ad b2 87 LDA $87b2 ; (canvas + 10)
03:b84e : 65 5b __ ADC T5 + 1 
03:b850 : c5 55 __ CMP T1 + 1 
03:b852 : d0 02 __ BNE $b856 ; (selectmode.s1044 + 0)
.s1043:
03:b854 : e4 54 __ CPX T1 + 0 
.s1044:
03:b856 : 90 07 __ BCC $b85f ; (selectmode.s214 + 0)
.s212:
03:b858 : 18 __ __ CLC
03:b859 : a5 5e __ LDA T7 + 0 
03:b85b : e5 57 __ SBC T3 + 0 
03:b85d : 85 62 __ STA T9 + 0 
.s214:
03:b85f : a5 60 __ LDA T8 + 0 
03:b861 : 85 0f __ STA P2 
03:b863 : a5 61 __ LDA T8 + 1 
03:b865 : 85 10 __ STA P3 
03:b867 : a5 58 __ LDA T4 + 0 
03:b869 : 85 14 __ STA P7 
03:b86b : a5 59 __ LDA T4 + 1 
03:b86d : 85 15 __ STA P8 
03:b86f : 18 __ __ CLC
03:b870 : a5 62 __ LDA T9 + 0 
03:b872 : 65 54 __ ADC T1 + 0 
03:b874 : 85 64 __ STA T10 + 0 
03:b876 : 85 03 __ STA WORK + 0 
03:b878 : a9 00 __ LDA #$00
03:b87a : 65 55 __ ADC T1 + 1 
03:b87c : 85 65 __ STA T10 + 1 
03:b87e : 85 04 __ STA WORK + 1 
03:b880 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b883 : 85 1b __ STA ACCU + 0 
03:b885 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b888 : 85 1c __ STA ACCU + 1 
03:b88a : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b88d : 18 __ __ CLC
03:b88e : a5 06 __ LDA WORK + 3 
03:b890 : 69 58 __ ADC #$58
03:b892 : aa __ __ TAX
03:b893 : 18 __ __ CLC
03:b894 : a5 05 __ LDA WORK + 2 
03:b896 : 65 5c __ ADC T6 + 0 
03:b898 : 85 67 __ STA T12 + 0 
03:b89a : 85 12 __ STA P5 
03:b89c : 8a __ __ TXA
03:b89d : 65 5d __ ADC T6 + 1 
03:b89f : 85 68 __ STA T12 + 1 
03:b8a1 : 85 13 __ STA P6 
03:b8a3 : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
03:b8a6 : a5 56 __ LDA T2 + 0 
03:b8a8 : f0 0b __ BEQ $b8b5 ; (selectmode.s78 + 0)
.s76:
03:b8aa : a5 67 __ LDA T12 + 0 
03:b8ac : 85 0d __ STA P0 
03:b8ae : a5 68 __ LDA T12 + 1 
03:b8b0 : 85 0e __ STA P1 
03:b8b2 : 20 70 1a JSR $1a70 ; (bnk_memset@proxy + 0)
.s78:
03:b8b5 : a9 7f __ LDA #$7f
03:b8b7 : 85 0d __ STA P0 
03:b8b9 : a5 60 __ LDA T8 + 0 
03:b8bb : 85 10 __ STA P3 
03:b8bd : a5 61 __ LDA T8 + 1 
03:b8bf : 85 11 __ STA P4 
03:b8c1 : a5 14 __ LDA P7 
03:b8c3 : 85 12 __ STA P5 
03:b8c5 : a5 59 __ LDA T4 + 1 
03:b8c7 : 85 13 __ STA P6 
03:b8c9 : ad af 87 LDA $87af ; (canvas + 7)
03:b8cc : 18 __ __ CLC
03:b8cd : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:b8d0 : 85 43 __ STA T13 + 0 
03:b8d2 : ad b0 87 LDA $87b0 ; (canvas + 8)
03:b8d5 : 6d ec 86 ADC $86ec ; (screen_col + 1)
03:b8d8 : 85 44 __ STA T13 + 1 
03:b8da : ad b1 87 LDA $87b1 ; (canvas + 9)
03:b8dd : 18 __ __ CLC
03:b8de : 65 5a __ ADC T5 + 0 
03:b8e0 : aa __ __ TAX
03:b8e1 : ad b2 87 LDA $87b2 ; (canvas + 10)
03:b8e4 : 65 5b __ ADC T5 + 1 
03:b8e6 : a8 __ __ TAY
03:b8e7 : 8a __ __ TXA
03:b8e8 : 18 __ __ CLC
03:b8e9 : 65 62 __ ADC T9 + 0 
03:b8eb : 85 03 __ STA WORK + 0 
03:b8ed : 90 01 __ BCC $b8f0 ; (selectmode.s1112 + 0)
.s1111:
03:b8ef : c8 __ __ INY
.s1112:
03:b8f0 : 84 04 __ STY WORK + 1 
03:b8f2 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b8f5 : 85 1b __ STA ACCU + 0 
03:b8f7 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b8fa : 85 1c __ STA ACCU + 1 
03:b8fc : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b8ff : 18 __ __ CLC
03:b900 : a5 06 __ LDA WORK + 3 
03:b902 : 69 58 __ ADC #$58
03:b904 : aa __ __ TAX
03:b905 : 18 __ __ CLC
03:b906 : a5 05 __ LDA WORK + 2 
03:b908 : 65 43 __ ADC T13 + 0 
03:b90a : 85 0e __ STA P1 
03:b90c : 8a __ __ TXA
03:b90d : 65 44 __ ADC T13 + 1 
03:b90f : 85 0f __ STA P2 
03:b911 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:b914 : a5 60 __ LDA T8 + 0 
03:b916 : 85 0f __ STA P2 
03:b918 : a5 61 __ LDA T8 + 1 
03:b91a : 85 10 __ STA P3 
03:b91c : a9 7f __ LDA #$7f
03:b91e : 85 11 __ STA P4 
03:b920 : a5 59 __ LDA T4 + 1 
03:b922 : 85 15 __ STA P8 
03:b924 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b927 : 85 1b __ STA ACCU + 0 
03:b929 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b92c : 85 1c __ STA ACCU + 1 
03:b92e : a5 64 __ LDA T10 + 0 
03:b930 : 85 03 __ STA WORK + 0 
03:b932 : a5 65 __ LDA T10 + 1 
03:b934 : 85 04 __ STA WORK + 1 
03:b936 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b939 : 18 __ __ CLC
03:b93a : a5 06 __ LDA WORK + 3 
03:b93c : 69 58 __ ADC #$58
03:b93e : aa __ __ TAX
03:b93f : 18 __ __ CLC
03:b940 : a5 05 __ LDA WORK + 2 
03:b942 : 65 5c __ ADC T6 + 0 
03:b944 : 85 64 __ STA T10 + 0 
03:b946 : 8a __ __ TXA
03:b947 : 65 5d __ ADC T6 + 1 
03:b949 : 85 65 __ STA T10 + 1 
03:b94b : ad ad 87 LDA $87ad ; (canvas + 5)
03:b94e : 85 1b __ STA ACCU + 0 
03:b950 : ad ae 87 LDA $87ae ; (canvas + 6)
03:b953 : 85 1c __ STA ACCU + 1 
03:b955 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b958 : 85 03 __ STA WORK + 0 
03:b95a : ad ac 87 LDA $87ac ; (canvas + 4)
03:b95d : 85 04 __ STA WORK + 1 
03:b95f : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b962 : 18 __ __ CLC
03:b963 : a5 05 __ LDA WORK + 2 
03:b965 : 65 64 __ ADC T10 + 0 
03:b967 : a8 __ __ TAY
03:b968 : a5 06 __ LDA WORK + 3 
03:b96a : 65 65 __ ADC T10 + 1 
03:b96c : aa __ __ TAX
03:b96d : 98 __ __ TYA
03:b96e : 18 __ __ CLC
03:b96f : 69 30 __ ADC #$30
03:b971 : 85 64 __ STA T10 + 0 
03:b973 : 85 12 __ STA P5 
03:b975 : 8a __ __ TXA
03:b976 : 69 00 __ ADC #$00
03:b978 : 85 65 __ STA T10 + 1 
03:b97a : 85 13 __ STA P6 
03:b97c : 20 b5 13 JSR $13b5 ; (bnk_cpytovdc.s0 + 0)
03:b97f : a5 56 __ LDA T2 + 0 
03:b981 : f0 0b __ BEQ $b98e ; (selectmode.s87 + 0)
.s85:
03:b983 : a5 64 __ LDA T10 + 0 
03:b985 : 85 0d __ STA P0 
03:b987 : a5 65 __ LDA T10 + 1 
03:b989 : 85 0e __ STA P1 
03:b98b : 20 70 1a JSR $1a70 ; (bnk_memset@proxy + 0)
.s87:
03:b98e : a9 7f __ LDA #$7f
03:b990 : 85 0d __ STA P0 
03:b992 : a5 60 __ LDA T8 + 0 
03:b994 : 85 10 __ STA P3 
03:b996 : a5 61 __ LDA T8 + 1 
03:b998 : 85 11 __ STA P4 
03:b99a : a5 14 __ LDA P7 
03:b99c : 85 12 __ STA P5 
03:b99e : a5 59 __ LDA T4 + 1 
03:b9a0 : 85 13 __ STA P6 
03:b9a2 : ad af 87 LDA $87af ; (canvas + 7)
03:b9a5 : 18 __ __ CLC
03:b9a6 : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:b9a9 : 85 64 __ STA T10 + 0 
03:b9ab : ad b0 87 LDA $87b0 ; (canvas + 8)
03:b9ae : 6d ec 86 ADC $86ec ; (screen_col + 1)
03:b9b1 : 85 65 __ STA T10 + 1 
03:b9b3 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:b9b6 : 18 __ __ CLC
03:b9b7 : 65 5a __ ADC T5 + 0 
03:b9b9 : aa __ __ TAX
03:b9ba : ad b2 87 LDA $87b2 ; (canvas + 10)
03:b9bd : 65 5b __ ADC T5 + 1 
03:b9bf : a8 __ __ TAY
03:b9c0 : 8a __ __ TXA
03:b9c1 : 18 __ __ CLC
03:b9c2 : 65 62 __ ADC T9 + 0 
03:b9c4 : 85 03 __ STA WORK + 0 
03:b9c6 : 90 01 __ BCC $b9c9 ; (selectmode.s1114 + 0)
.s1113:
03:b9c8 : c8 __ __ INY
.s1114:
03:b9c9 : 84 04 __ STY WORK + 1 
03:b9cb : ad ab 87 LDA $87ab ; (canvas + 3)
03:b9ce : 85 1b __ STA ACCU + 0 
03:b9d0 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b9d3 : 85 1c __ STA ACCU + 1 
03:b9d5 : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:b9d8 : 18 __ __ CLC
03:b9d9 : a5 06 __ LDA WORK + 3 
03:b9db : 69 58 __ ADC #$58
03:b9dd : aa __ __ TAX
03:b9de : 18 __ __ CLC
03:b9df : a5 05 __ LDA WORK + 2 
03:b9e1 : 65 64 __ ADC T10 + 0 
03:b9e3 : 85 62 __ STA T9 + 0 
03:b9e5 : 8a __ __ TXA
03:b9e6 : 65 65 __ ADC T10 + 1 
03:b9e8 : 85 63 __ STA T9 + 1 
03:b9ea : ad ad 87 LDA $87ad ; (canvas + 5)
03:b9ed : 85 1b __ STA ACCU + 0 
03:b9ef : ad ae 87 LDA $87ae ; (canvas + 6)
03:b9f2 : 85 1c __ STA ACCU + 1 
03:b9f4 : ad ab 87 LDA $87ab ; (canvas + 3)
03:b9f7 : 85 03 __ STA WORK + 0 
03:b9f9 : ad ac 87 LDA $87ac ; (canvas + 4)
03:b9fc : 85 04 __ STA WORK + 1 
03:b9fe : 20 62 7c JSR $7c62 ; (mul16 + 0)
03:ba01 : 18 __ __ CLC
03:ba02 : a5 05 __ LDA WORK + 2 
03:ba04 : 65 62 __ ADC T9 + 0 
03:ba06 : aa __ __ TAX
03:ba07 : a5 06 __ LDA WORK + 3 
03:ba09 : 65 63 __ ADC T9 + 1 
03:ba0b : a8 __ __ TAY
03:ba0c : 8a __ __ TXA
03:ba0d : 18 __ __ CLC
03:ba0e : 69 30 __ ADC #$30
03:ba10 : 85 0e __ STA P1 
03:ba12 : 90 01 __ BCC $ba15 ; (selectmode.s1116 + 0)
.s1115:
03:ba14 : c8 __ __ INY
.s1116:
03:ba15 : 84 0f __ STY P2 
03:ba17 : 20 10 14 JSR $1410 ; (bnk_cpyfromvdc.s0 + 0)
03:ba1a : e6 57 __ INC T3 + 0 
03:ba1c : a5 5f __ LDA T7 + 1 
03:ba1e : f0 03 __ BEQ $ba23 ; (selectmode.s1041 + 0)
03:ba20 : 4c 3c b8 JMP $b83c ; (selectmode.l71 + 0)
.s1041:
03:ba23 : a5 57 __ LDA T3 + 0 
03:ba25 : c5 5e __ CMP T7 + 0 
03:ba27 : b0 03 __ BCS $ba2c ; (selectmode.s1041 + 9)
03:ba29 : 4c 3c b8 JMP $b83c ; (selectmode.l71 + 0)
03:ba2c : 4c 75 b4 JMP $b475 ; (selectmode.s34 + 0)
.s1106:
03:ba2f : 8d f7 ab STA $abf7 ; (sstack + 4)
03:ba32 : 20 98 51 JSR $5198 ; (menu_messagepopup.s1000 + 0)
03:ba35 : 20 96 59 JSR $5996 ; (restorealtcharset.s0 + 0)
03:ba38 : 4c 98 b5 JMP $b598 ; (selectmode.s1105 + 0)
.s52:
03:ba3b : c9 11 __ CMP #$11
03:ba3d : d0 03 __ BNE $ba42 ; (selectmode.s53 + 0)
03:ba3f : 4c 52 b7 JMP $b752 ; (selectmode.s45 + 0)
.s53:
03:ba42 : c9 1d __ CMP #$1d
03:ba44 : f0 03 __ BEQ $ba49 ; (selectmode.s53 + 7)
03:ba46 : 4c 5c b7 JMP $b75c ; (selectmode.s44 + 0)
03:ba49 : 4c 52 b7 JMP $b752 ; (selectmode.s45 + 0)
--------------------------------------------------------------------
03:ba4c : __ __ __ BYT 73 45 4c 45 43 54 00                            : sELECT.
--------------------------------------------------------------------
03:ba53 : __ __ __ BYT 78 2f 63 2f 64 2f 61 2f 70 3f 00                : x/c/d/a/p?.
--------------------------------------------------------------------
03:ba5e : __ __ __ BYT 73 45 4c 45 43 54 49 4f 4e 20 54 4f 4f 20 42 49 : sELECTION TOO BI
03:ba6e : __ __ __ BYT 47 2e 00                                        : G..
--------------------------------------------------------------------
03:ba71 : __ __ __ BYT 63 55 54 00                                     : cUT.
--------------------------------------------------------------------
03:ba75 : __ __ __ BYT 63 4f 50 59 00                                  : cOPY.
--------------------------------------------------------------------
03:ba7a : __ __ __ BYT 73 45 4c 45 43 54 49 4f 4e 20 44 4f 45 53 20 4e : sELECTION DOES N
03:ba8a : __ __ __ BYT 4f 54 20 46 49 54 2e 00                         : OT FIT..
--------------------------------------------------------------------
plot_try: ; plot_try()->void
.s0:
03:ba92 : 20 f3 4a JSR $4af3 ; (hidecursor.s0 + 0)
03:ba95 : a2 ff __ LDX #$ff
.l1002:
03:ba97 : e8 __ __ INX
03:ba98 : bd 37 bb LDA $bb37,x 
03:ba9b : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:ba9e : d0 f7 __ BNE $ba97 ; (plot_try.l1002 + 0)
.s1003:
03:baa0 : ad fe 86 LDA $86fe ; (showbar + 0)
03:baa3 : f0 03 __ BEQ $baa8 ; (plot_try.s3 + 0)
.s1:
03:baa5 : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s3:
03:baa8 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
03:baab : a5 1b __ LDA ACCU + 0 
03:baad : c9 20 __ CMP #$20
03:baaf : d0 6c __ BNE $bb1d ; (plot_try.s6 + 0)
.s4:
03:bab1 : ad fe 7a LDA $7afe ; (undoenabled + 0)
03:bab4 : c9 01 __ CMP #$01
03:bab6 : d0 1a __ BNE $bad2 ; (plot_try.s9 + 0)
.s7:
03:bab8 : 85 18 __ STA P11 
03:baba : 8d f3 ab STA $abf3 ; (sstack + 0)
03:babd : ad b1 87 LDA $87b1 ; (canvas + 9)
03:bac0 : 18 __ __ CLC
03:bac1 : 6d ed 86 ADC $86ed ; (screen_row + 0)
03:bac4 : 85 16 __ STA P9 
03:bac6 : ad af 87 LDA $87af ; (canvas + 7)
03:bac9 : 18 __ __ CLC
03:baca : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:bacd : 85 17 __ STA P10 
03:bacf : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s9:
03:bad2 : ad b1 87 LDA $87b1 ; (canvas + 9)
03:bad5 : 18 __ __ CLC
03:bad6 : 6d ed 86 ADC $86ed ; (screen_row + 0)
03:bad9 : 85 10 __ STA P3 
03:badb : ad af 87 LDA $87af ; (canvas + 7)
03:bade : 18 __ __ CLC
03:badf : 6d eb 86 ADC $86eb ; (screen_col + 0)
03:bae2 : 85 11 __ STA P4 
03:bae4 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
03:bae7 : 85 12 __ STA P5 
03:bae9 : ad f4 86 LDA $86f4 ; (plotblink + 0)
03:baec : 0a __ __ ASL
03:baed : 0a __ __ ASL
03:baee : 0a __ __ ASL
03:baef : 0a __ __ ASL
03:baf0 : 18 __ __ CLC
03:baf1 : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
03:baf4 : 85 43 __ STA T1 + 0 
03:baf6 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
03:baf9 : 4a __ __ LSR
03:bafa : 6a __ __ ROR
03:bafb : 6a __ __ ROR
03:bafc : 29 c0 __ AND #$c0
03:bafe : 6a __ __ ROR
03:baff : 65 43 __ ADC T1 + 0 
03:bb01 : 85 43 __ STA T1 + 0 
03:bb03 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
03:bb06 : 4a __ __ LSR
03:bb07 : 6a __ __ ROR
03:bb08 : 29 80 __ AND #$80
03:bb0a : 6a __ __ ROR
03:bb0b : 65 43 __ ADC T1 + 0 
03:bb0d : 85 43 __ STA T1 + 0 
03:bb0f : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
03:bb12 : 4a __ __ LSR
03:bb13 : a9 00 __ LDA #$00
03:bb15 : 6a __ __ ROR
03:bb16 : 65 43 __ ADC T1 + 0 
03:bb18 : 85 13 __ STA P6 
03:bb1a : 20 1a 54 JSR $541a ; (screenmapplot.s0 + 0)
.s6:
03:bb1d : a2 ff __ LDX #$ff
.l1004:
03:bb1f : e8 __ __ INX
03:bb20 : bd f9 b0 LDA $b0f9,x 
03:bb23 : 9d e1 88 STA $88e1,x ; (programmode + 0)
03:bb26 : d0 f7 __ BNE $bb1f ; (plot_try.l1004 + 0)
.s1005:
03:bb28 : ad eb 86 LDA $86eb ; (screen_col + 0)
03:bb2b : 8d b7 87 STA $87b7 ; (canvas + 15)
03:bb2e : ad ed 86 LDA $86ed ; (screen_row + 0)
03:bb31 : 8d b8 87 STA $87b8 ; (canvas + 16)
03:bb34 : 4c 02 3e JMP $3e02 ; (plotcursor.s0 + 0)
--------------------------------------------------------------------
03:bb37 : __ __ __ BYT 74 52 59 00                                     : tRY.
--------------------------------------------------------------------
changebackgroundcolor: ; changebackgroundcolor()->void
.s1000:
03:bb3b : a5 53 __ LDA T1 + 0 
03:bb3d : 8d d1 ab STA $abd1 ; (buff + 44)
03:bb40 : a5 54 __ LDA T2 + 0 
03:bb42 : 8d d2 ab STA $abd2 ; (buff + 45)
03:bb45 : a5 55 __ LDA T4 + 0 
03:bb47 : 8d d3 ab STA $abd3 ; (buff + 46)
03:bb4a : 38 __ __ SEC
03:bb4b : a5 23 __ LDA SP + 0 
03:bb4d : e9 08 __ SBC #$08
03:bb4f : 85 23 __ STA SP + 0 
03:bb51 : b0 02 __ BCS $bb55 ; (changebackgroundcolor.s0 + 0)
03:bb53 : c6 24 __ DEC SP + 1 
.s0:
03:bb55 : a9 00 __ LDA #$00
03:bb57 : 85 17 __ STA P10 
03:bb59 : a9 14 __ LDA #$14
03:bb5b : 85 18 __ STA P11 
03:bb5d : a9 05 __ LDA #$05
03:bb5f : 8d f3 ab STA $abf3 ; (sstack + 0)
03:bb62 : a9 28 __ LDA #$28
03:bb64 : 8d f4 ab STA $abf4 ; (sstack + 1)
03:bb67 : a9 0c __ LDA #$0c
03:bb69 : 8d f5 ab STA $abf5 ; (sstack + 2)
03:bb6c : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
03:bb6f : 8d 96 87 STA $8796 ; (vdc_state + 7)
03:bb72 : ad ef 86 LDA $86ef ; (screenbackground + 0)
03:bb75 : 85 52 __ STA T0 + 0 
03:bb77 : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
03:bb7a : a9 01 __ LDA #$01
03:bb7c : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
03:bb7f : a9 59 __ LDA #$59
03:bb81 : 85 13 __ STA P6 
03:bb83 : a9 bd __ LDA #$bd
03:bb85 : 85 14 __ STA P7 
03:bb87 : 20 04 81 JSR $8104 ; (vdc_prints_attr@proxy + 0)
03:bb8a : a9 00 __ LDA #$00
03:bb8c : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
03:bb8f : a9 00 __ LDA #$00
03:bb91 : a0 02 __ LDY #$02
03:bb93 : 91 23 __ STA (SP + 0),y 
03:bb95 : a9 89 __ LDA #$89
03:bb97 : c8 __ __ INY
03:bb98 : 91 23 __ STA (SP + 0),y 
03:bb9a : a9 71 __ LDA #$71
03:bb9c : c8 __ __ INY
03:bb9d : 91 23 __ STA (SP + 0),y 
03:bb9f : a9 bd __ LDA #$bd
03:bba1 : c8 __ __ INY
03:bba2 : 91 23 __ STA (SP + 0),y 
03:bba4 : a5 52 __ LDA T0 + 0 
03:bba6 : c8 __ __ INY
03:bba7 : 91 23 __ STA (SP + 0),y 
03:bba9 : a9 00 __ LDA #$00
03:bbab : c8 __ __ INY
03:bbac : 91 23 __ STA (SP + 0),y 
03:bbae : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
03:bbb1 : 20 53 81 JSR $8153 ; (vdc_prints_attr@proxy + 0)
03:bbb4 : a9 7c __ LDA #$7c
03:bbb6 : 85 13 __ STA P6 
03:bbb8 : a9 bd __ LDA #$bd
03:bbba : 85 14 __ STA P7 
03:bbbc : 20 4c 81 JSR $814c ; (vdc_prints_attr@proxy + 0)
03:bbbf : e6 12 __ INC P5 
03:bbc1 : a9 83 __ LDA #$83
03:bbc3 : 85 13 __ STA P6 
03:bbc5 : a9 bd __ LDA #$bd
03:bbc7 : 85 14 __ STA P7 
03:bbc9 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
03:bbcc : e6 12 __ INC P5 
03:bbce : a9 a0 __ LDA #$a0
03:bbd0 : 85 13 __ STA P6 
03:bbd2 : a9 bd __ LDA #$bd
03:bbd4 : 85 14 __ STA P7 
03:bbd6 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
03:bbd9 : e6 12 __ INC P5 
03:bbdb : a9 bd __ LDA #$bd
03:bbdd : 85 13 __ STA P6 
03:bbdf : a9 bd __ LDA #$bd
03:bbe1 : 85 14 __ STA P7 
03:bbe3 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
03:bbe6 : e6 12 __ INC P5 
03:bbe8 : a9 d1 __ LDA #$d1
03:bbea : 85 13 __ STA P6 
03:bbec : a9 bd __ LDA #$bd
03:bbee : 85 14 __ STA P7 
03:bbf0 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
03:bbf3 : a9 00 __ LDA #$00
03:bbf5 : 85 54 __ STA T2 + 0 
.l10:
03:bbf7 : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
03:bbfa : a5 1b __ LDA ACCU + 0 
03:bbfc : 85 53 __ STA T1 + 0 
03:bbfe : c9 0d __ CMP #$0d
03:bc00 : d0 09 __ BNE $bc0b ; (changebackgroundcolor.s1002 + 0)
.s1003:
03:bc02 : a9 00 __ LDA #$00
03:bc04 : 85 55 __ STA T4 + 0 
03:bc06 : a5 1b __ LDA ACCU + 0 
03:bc08 : 4c 21 bc JMP $bc21 ; (changebackgroundcolor.s11 + 0)
.s1002:
03:bc0b : a9 01 __ LDA #$01
03:bc0d : 85 55 __ STA T4 + 0 
03:bc0f : a5 1b __ LDA ACCU + 0 
03:bc11 : c9 1b __ CMP #$1b
03:bc13 : f0 0c __ BEQ $bc21 ; (changebackgroundcolor.s11 + 0)
.s14:
03:bc15 : c9 03 __ CMP #$03
03:bc17 : f0 08 __ BEQ $bc21 ; (changebackgroundcolor.s11 + 0)
.s13:
03:bc19 : c9 2b __ CMP #$2b
03:bc1b : f0 04 __ BEQ $bc21 ; (changebackgroundcolor.s11 + 0)
.s12:
03:bc1d : c9 2d __ CMP #$2d
03:bc1f : d0 d6 __ BNE $bbf7 ; (changebackgroundcolor.l10 + 0)
.s11:
03:bc21 : c9 2b __ CMP #$2b
03:bc23 : d0 03 __ BNE $bc28 ; (changebackgroundcolor.s42 + 0)
03:bc25 : 4c 46 bd JMP $bd46 ; (changebackgroundcolor.s17 + 0)
.s42:
03:bc28 : b0 03 __ BCS $bc2d ; (changebackgroundcolor.s43 + 0)
03:bc2a : 4c 14 bd JMP $bd14 ; (changebackgroundcolor.s44 + 0)
.s43:
03:bc2d : c9 2d __ CMP #$2d
03:bc2f : d0 03 __ BNE $bc34 ; (changebackgroundcolor.s16 + 0)
03:bc31 : 4c 00 bd JMP $bd00 ; (changebackgroundcolor.s21 + 0)
.s16:
03:bc34 : a5 54 __ LDA T2 + 0 
03:bc36 : c9 01 __ CMP #$01
03:bc38 : d0 45 __ BNE $bc7f ; (changebackgroundcolor.s50 + 0)
.s48:
03:bc3a : a9 1a __ LDA #$1a
03:bc3c : 8d 00 d6 STA $d600 
.l179:
03:bc3f : 2c 00 d6 BIT $d600 
03:bc42 : 10 fb __ BPL $bc3f ; (changebackgroundcolor.l179 + 0)
.s57:
03:bc44 : ad 01 d6 LDA $d601 
03:bc47 : 29 f0 __ AND #$f0
03:bc49 : 18 __ __ CLC
03:bc4a : 65 52 __ ADC T0 + 0 
03:bc4c : a2 1a __ LDX #$1a
03:bc4e : 8e 00 d6 STX $d600 
.l181:
03:bc51 : 2c 00 d6 BIT $d600 
03:bc54 : 10 fb __ BPL $bc51 ; (changebackgroundcolor.l181 + 0)
.s63:
03:bc56 : 8d 01 d6 STA $d601 
03:bc59 : a5 52 __ LDA T0 + 0 
03:bc5b : a0 06 __ LDY #$06
03:bc5d : 91 23 __ STA (SP + 0),y 
03:bc5f : a9 00 __ LDA #$00
03:bc61 : c8 __ __ INY
03:bc62 : 91 23 __ STA (SP + 0),y 
03:bc64 : a9 00 __ LDA #$00
03:bc66 : a0 02 __ LDY #$02
03:bc68 : 91 23 __ STA (SP + 0),y 
03:bc6a : a9 89 __ LDA #$89
03:bc6c : c8 __ __ INY
03:bc6d : 91 23 __ STA (SP + 0),y 
03:bc6f : a9 71 __ LDA #$71
03:bc71 : c8 __ __ INY
03:bc72 : 91 23 __ STA (SP + 0),y 
03:bc74 : a9 bd __ LDA #$bd
03:bc76 : c8 __ __ INY
03:bc77 : 91 23 __ STA (SP + 0),y 
03:bc79 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
03:bc7c : 20 53 81 JSR $8153 ; (vdc_prints_attr@proxy + 0)
.s50:
03:bc7f : a5 55 __ LDA T4 + 0 
03:bc81 : f0 0d __ BEQ $bc90 ; (changebackgroundcolor.s9 + 0)
.s66:
03:bc83 : a5 53 __ LDA T1 + 0 
03:bc85 : c9 1b __ CMP #$1b
03:bc87 : f0 07 __ BEQ $bc90 ; (changebackgroundcolor.s9 + 0)
.s65:
03:bc89 : c9 03 __ CMP #$03
03:bc8b : f0 03 __ BEQ $bc90 ; (changebackgroundcolor.s9 + 0)
03:bc8d : 4c f7 bb JMP $bbf7 ; (changebackgroundcolor.l10 + 0)
.s9:
03:bc90 : a5 52 __ LDA T0 + 0 
03:bc92 : 8d ef 86 STA $86ef ; (screenbackground + 0)
03:bc95 : f0 04 __ BEQ $bc9b ; (changebackgroundcolor.s70 + 0)
.s73:
03:bc97 : c9 01 __ CMP #$01
03:bc99 : d0 19 __ BNE $bcb4 ; (changebackgroundcolor.s71 + 0)
.s70:
03:bc9b : a9 c5 __ LDA #$c5
03:bc9d : 8d cb 82 STA $82cb ; (mc_mb_normal + 0)
03:bca0 : a9 cf __ LDA #$cf
03:bca2 : 8d cc 82 STA $82cc ; (mc_mb_select + 0)
03:bca5 : 8d ff 7a STA $7aff ; (mc_menupopup + 0)
03:bca8 : 8d 96 87 STA $8796 ; (vdc_state + 7)
03:bcab : a9 c6 __ LDA #$c6
03:bcad : 8d cd 82 STA $82cd ; (mc_pd_normal + 0)
03:bcb0 : a9 cd __ LDA #$cd
03:bcb2 : d0 28 __ BNE $bcdc ; (changebackgroundcolor.s1001 + 0)
.s71:
03:bcb4 : 4a __ __ LSR
03:bcb5 : 90 12 __ BCC $bcc9 ; (changebackgroundcolor.s75 + 0)
.s74:
03:bcb7 : a9 c0 __ LDA #$c0
03:bcb9 : 8d cb 82 STA $82cb ; (mc_mb_normal + 0)
03:bcbc : 8d cd 82 STA $82cd ; (mc_pd_normal + 0)
03:bcbf : 8d ff 7a STA $7aff ; (mc_menupopup + 0)
03:bcc2 : 8d 96 87 STA $8796 ; (vdc_state + 7)
03:bcc5 : a9 80 __ LDA #$80
03:bcc7 : b0 10 __ BCS $bcd9 ; (changebackgroundcolor.s1044 + 0)
.s75:
03:bcc9 : a9 cf __ LDA #$cf
03:bccb : 8d cb 82 STA $82cb ; (mc_mb_normal + 0)
03:bcce : 8d cd 82 STA $82cd ; (mc_pd_normal + 0)
03:bcd1 : 8d ff 7a STA $7aff ; (mc_menupopup + 0)
03:bcd4 : 8d 96 87 STA $8796 ; (vdc_state + 7)
03:bcd7 : a9 8f __ LDA #$8f
.s1044:
03:bcd9 : 8d cc 82 STA $82cc ; (mc_mb_select + 0)
.s1001:
03:bcdc : 8d ce 82 STA $82ce ; (mc_pd_select + 0)
03:bcdf : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
03:bce2 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
03:bce5 : 18 __ __ CLC
03:bce6 : a5 23 __ LDA SP + 0 
03:bce8 : 69 08 __ ADC #$08
03:bcea : 85 23 __ STA SP + 0 
03:bcec : 90 02 __ BCC $bcf0 ; (changebackgroundcolor.s1001 + 20)
03:bcee : e6 24 __ INC SP + 1 
03:bcf0 : ad d1 ab LDA $abd1 ; (buff + 44)
03:bcf3 : 85 53 __ STA T1 + 0 
03:bcf5 : ad d2 ab LDA $abd2 ; (buff + 45)
03:bcf8 : 85 54 __ STA T2 + 0 
03:bcfa : ad d3 ab LDA $abd3 ; (buff + 46)
03:bcfd : 85 55 __ STA T4 + 0 
03:bcff : 60 __ __ RTS
.s21:
03:bd00 : a9 01 __ LDA #$01
03:bd02 : 85 54 __ STA T2 + 0 
03:bd04 : a5 52 __ LDA T0 + 0 
03:bd06 : f0 05 __ BEQ $bd0d ; (changebackgroundcolor.s22 + 0)
.s23:
03:bd08 : c6 52 __ DEC T0 + 0 
03:bd0a : 4c 3a bc JMP $bc3a ; (changebackgroundcolor.s48 + 0)
.s22:
03:bd0d : a9 0f __ LDA #$0f
.s1043:
03:bd0f : 85 52 __ STA T0 + 0 
03:bd11 : 4c 3a bc JMP $bc3a ; (changebackgroundcolor.s48 + 0)
.s44:
03:bd14 : c9 03 __ CMP #$03
03:bd16 : f0 07 __ BEQ $bd1f ; (changebackgroundcolor.s25 + 0)
.s45:
03:bd18 : c9 1b __ CMP #$1b
03:bd1a : f0 03 __ BEQ $bd1f ; (changebackgroundcolor.s25 + 0)
03:bd1c : 4c 34 bc JMP $bc34 ; (changebackgroundcolor.s16 + 0)
.s25:
03:bd1f : a9 1a __ LDA #$1a
03:bd21 : 8d 00 d6 STA $d600 
03:bd24 : a9 00 __ LDA #$00
03:bd26 : 85 54 __ STA T2 + 0 
.l186:
03:bd28 : 2c 00 d6 BIT $d600 
03:bd2b : 10 fb __ BPL $bd28 ; (changebackgroundcolor.l186 + 0)
.s32:
03:bd2d : ad 01 d6 LDA $d601 
03:bd30 : 29 f0 __ AND #$f0
03:bd32 : 18 __ __ CLC
03:bd33 : 6d ef 86 ADC $86ef ; (screenbackground + 0)
03:bd36 : a2 1a __ LDX #$1a
03:bd38 : 8e 00 d6 STX $d600 
.l188:
03:bd3b : 2c 00 d6 BIT $d600 
03:bd3e : 10 fb __ BPL $bd3b ; (changebackgroundcolor.l188 + 0)
.s38:
03:bd40 : 8d 01 d6 STA $d601 
03:bd43 : 4c 7f bc JMP $bc7f ; (changebackgroundcolor.s50 + 0)
.s17:
03:bd46 : a9 01 __ LDA #$01
03:bd48 : 85 54 __ STA T2 + 0 
03:bd4a : e6 52 __ INC T0 + 0 
03:bd4c : a5 52 __ LDA T0 + 0 
03:bd4e : c9 10 __ CMP #$10
03:bd50 : b0 03 __ BCS $bd55 ; (changebackgroundcolor.s18 + 0)
03:bd52 : 4c 3a bc JMP $bc3a ; (changebackgroundcolor.s48 + 0)
.s18:
03:bd55 : a9 00 __ LDA #$00
03:bd57 : b0 b6 __ BCS $bd0f ; (changebackgroundcolor.s1043 + 0)
--------------------------------------------------------------------
03:bd59 : __ __ __ BYT 63 48 41 4e 47 45 20 42 41 43 4b 47 52 4f 55 4e : cHANGE BACKGROUN
03:bd69 : __ __ __ BYT 44 20 43 4f 4c 4f 52 00                         : D COLOR.
--------------------------------------------------------------------
03:bd71 : __ __ __ BYT 63 4f 4c 4f 52 3a 20 25 32 55 00                : cOLOR: %2U.
--------------------------------------------------------------------
03:bd7c : __ __ __ BYT 70 52 45 53 53 3a 00                            : pRESS:.
--------------------------------------------------------------------
03:bd83 : __ __ __ BYT 2b 3a 20 20 20 20 20 69 4e 43 52 45 41 53 45 20 : +:     iNCREASE 
03:bd93 : __ __ __ BYT 43 4f 4c 4f 52 20 4e 55 4d 42 45 52 00          : COLOR NUMBER.
--------------------------------------------------------------------
03:bda0 : __ __ __ BYT 2d 3a 20 20 20 20 20 64 45 43 52 45 41 53 45 20 : -:     dECREASE 
03:bdb0 : __ __ __ BYT 43 4f 4c 4f 52 20 4e 55 4d 42 45 52 00          : COLOR NUMBER.
--------------------------------------------------------------------
03:bdbd : __ __ __ BYT 65 6e 74 65 72 3a 20 61 43 43 45 50 54 20 43 4f : enter: aCCEPT CO
03:bdcd : __ __ __ BYT 4c 4f 52 00                                     : LOR.
--------------------------------------------------------------------
03:bdd1 : __ __ __ BYT 65 73 63 3a 20 20 20 63 41 4e 43 45 4c 00       : esc:   cANCEL.
--------------------------------------------------------------------
selectscreenmode: ; selectscreenmode()->void
.s1000:
03:bddf : a5 53 __ LDA T0 + 0 
03:bde1 : 8d c7 ab STA $abc7 ; (buff + 34)
.s0:
03:bde4 : a9 00 __ LDA #$00
03:bde6 : 85 17 __ STA P10 
03:bde8 : a9 14 __ LDA #$14
03:bdea : 85 18 __ STA P11 
03:bdec : a9 05 __ LDA #$05
03:bdee : 8d f3 ab STA $abf3 ; (sstack + 0)
03:bdf1 : a9 28 __ LDA #$28
03:bdf3 : 8d f4 ab STA $abf4 ; (sstack + 1)
03:bdf6 : a9 0c __ LDA #$0c
03:bdf8 : 8d f5 ab STA $abf5 ; (sstack + 2)
03:bdfb : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
03:bdfe : 8d 96 87 STA $8796 ; (vdc_state + 7)
03:be01 : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
03:be04 : a9 01 __ LDA #$01
03:be06 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
03:be09 : a9 75 __ LDA #$75
03:be0b : 85 13 __ STA P6 
03:be0d : a9 be __ LDA #$be
03:be0f : 85 14 __ STA P7 
03:be11 : 20 04 81 JSR $8104 ; (vdc_prints_attr@proxy + 0)
03:be14 : a9 00 __ LDA #$00
03:be16 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
03:be19 : a9 08 __ LDA #$08
03:be1b : 85 12 __ STA P5 
03:be1d : a9 88 __ LDA #$88
03:be1f : 85 13 __ STA P6 
03:be21 : a9 be __ LDA #$be
03:be23 : 85 14 __ STA P7 
03:be25 : 20 81 33 JSR $3381 ; (vdc_prints_attr@proxy + 0)
03:be28 : a9 19 __ LDA #$19
03:be2a : 8d f8 ab STA $abf8 ; (sstack + 5)
03:be2d : a9 09 __ LDA #$09
03:be2f : 8d f9 ab STA $abf9 ; (sstack + 6)
03:be32 : a9 05 __ LDA #$05
03:be34 : 8d fa ab STA $abfa ; (sstack + 7)
03:be37 : a9 01 __ LDA #$01
03:be39 : 8d fb ab STA $abfb ; (sstack + 8)
03:be3c : 20 92 5e JSR $5e92 ; (menu_pulldown.s1000 + 0)
03:be3f : a5 1b __ LDA ACCU + 0 
03:be41 : 85 53 __ STA T0 + 0 
03:be43 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
03:be46 : a9 0f __ LDA #$0f
03:be48 : 8d 96 87 STA $8796 ; (vdc_state + 7)
03:be4b : a5 53 __ LDA T0 + 0 
03:be4d : f0 20 __ BEQ $be6f ; (selectscreenmode.s1001 + 0)
.s3:
03:be4f : 38 __ __ SEC
03:be50 : e9 01 __ SBC #$01
03:be52 : 90 05 __ BCC $be59 ; (selectscreenmode.s6 + 0)
.s1002:
03:be54 : cd 91 87 CMP $8791 ; (vdc_state + 2)
03:be57 : f0 16 __ BEQ $be6f ; (selectscreenmode.s1001 + 0)
.s6:
03:be59 : 85 16 __ STA P9 
03:be5b : 20 37 2e JSR $2e37 ; (vdc_set_mode.s0 + 0)
03:be5e : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
03:be61 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
03:be64 : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
03:be67 : ad fe 86 LDA $86fe ; (showbar + 0)
03:be6a : f0 03 __ BEQ $be6f ; (selectscreenmode.s1001 + 0)
.s9:
03:be6c : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s1001:
03:be6f : ad c7 ab LDA $abc7 ; (buff + 34)
03:be72 : 85 53 __ STA T0 + 0 
03:be74 : 60 __ __ RTS
--------------------------------------------------------------------
03:be75 : __ __ __ BYT 73 45 4c 45 43 54 20 53 43 52 45 45 4e 20 4d 4f : sELECT SCREEN MO
03:be85 : __ __ __ BYT 44 45 00                                        : DE.
--------------------------------------------------------------------
03:be88 : __ __ __ BYT 63 48 4f 4f 53 45 20 44 45 53 49 52 45 44 20 4d : cHOOSE DESIRED M
03:be98 : __ __ __ BYT 4f 44 45 3a 00                                  : ODE:.
--------------------------------------------------------------------
plotvisible@proxy: ; plotvisible@proxy
03:be9d : ad fd 87 LDA $87fd ; (select_endy + 0)
03:bea0 : 85 11 __ STA P4 
03:bea2 : 4c 03 b0 JMP $b003 ; (plotvisible.s0 + 0)
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
04:ac29 : 20 84 4b JSR $4b84 ; (chooseidandfilename.s0 + 0)
04:ac2c : a5 1b __ LDA ACCU + 0 
04:ac2e : 85 53 __ STA T0 + 0 
04:ac30 : a5 1c __ LDA ACCU + 1 
04:ac32 : 85 54 __ STA T0 + 1 
04:ac34 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
04:ac37 : a5 54 __ LDA T0 + 1 
04:ac39 : c9 ff __ CMP #$ff
04:ac3b : d0 06 __ BNE $ac43 ; (savescreenmap.s3 + 0)
.s1004:
04:ac3d : a5 53 __ LDA T0 + 0 
04:ac3f : c9 ff __ CMP #$ff
04:ac41 : f0 7c __ BEQ $acbf ; (savescreenmap.s1001 + 0)
.s3:
04:ac43 : a9 7a __ LDA #$7a
04:ac45 : 8d fc ab STA $abfc ; (sstack + 9)
04:ac48 : a9 87 __ LDA #$87
04:ac4a : 8d fd ab STA $abfd ; (sstack + 10)
04:ac4d : ad f6 86 LDA $86f6 ; (targetdevice + 0)
04:ac50 : 85 55 __ STA T1 + 0 
04:ac52 : 8d fe ab STA $abfe ; (sstack + 11)
04:ac55 : 20 26 62 JSR $6226 ; (checkiffileexists.s1000 + 0)
04:ac58 : a5 1b __ LDA ACCU + 0 
04:ac5a : f0 63 __ BEQ $acbf ; (savescreenmap.s1001 + 0)
.s5:
04:ac5c : c9 02 __ CMP #$02
04:ac5e : d0 26 __ BNE $ac86 ; (savescreenmap.s10 + 0)
.s8:
04:ac60 : a9 7a __ LDA #$7a
04:ac62 : a0 06 __ LDY #$06
04:ac64 : 91 23 __ STA (SP + 0),y 
04:ac66 : a9 87 __ LDA #$87
04:ac68 : c8 __ __ INY
04:ac69 : 91 23 __ STA (SP + 0),y 
04:ac6b : a9 00 __ LDA #$00
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
04:ac80 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:ac83 : 20 ac 62 JSR $62ac ; (cmd@proxy + 0)
.s10:
04:ac86 : a5 55 __ LDA T1 + 0 
04:ac88 : 85 12 __ STA P5 
04:ac8a : a9 01 __ LDA #$01
04:ac8c : 85 13 __ STA P6 
04:ac8e : a9 7a __ LDA #$7a
04:ac90 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:ac93 : a9 87 __ LDA #$87
04:ac95 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:ac98 : a9 00 __ LDA #$00
04:ac9a : 85 14 __ STA P7 
04:ac9c : ad f7 86 LDA $86f7 ; (screentotal + 0)
04:ac9f : 0a __ __ ASL
04:aca0 : aa __ __ TAX
04:aca1 : ad f8 86 LDA $86f8 ; (screentotal + 1)
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
04:acb5 : 20 58 15 JSR $1558 ; (bnk_save.s0 + 0)
04:acb8 : a5 1b __ LDA ACCU + 0 
04:acba : d0 03 __ BNE $acbf ; (savescreenmap.s1001 + 0)
.s11:
04:acbc : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
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
04:ad05 : 20 b4 64 JSR $64b4 ; (filepicker.s1000 + 0)
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
04:ad39 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
04:ad3c : 8d 96 87 STA $8796 ; (vdc_state + 7)
04:ad3f : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
04:ad42 : a9 01 __ LDA #$01
04:ad44 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
04:ad47 : a9 b6 __ LDA #$b6
04:ad49 : 85 13 __ STA P6 
04:ad4b : a9 ae __ LDA #$ae
04:ad4d : 85 14 __ STA P7 
04:ad4f : 20 04 81 JSR $8104 ; (vdc_prints_attr@proxy + 0)
04:ad52 : a9 00 __ LDA #$00
04:ad54 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
04:ad57 : a9 08 __ LDA #$08
04:ad59 : 85 12 __ STA P5 
04:ad5b : a9 c2 __ LDA #$c2
04:ad5d : 85 13 __ STA P6 
04:ad5f : a9 ae __ LDA #$ae
04:ad61 : 85 14 __ STA P7 
04:ad63 : ad 96 87 LDA $8796 ; (vdc_state + 7)
04:ad66 : 85 53 __ STA T0 + 0 
04:ad68 : 85 15 __ STA P8 
04:ad6a : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
04:ad6d : a9 00 __ LDA #$00
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
04:ad82 : ad ab 87 LDA $87ab ; (canvas + 3)
04:ad85 : c8 __ __ INY
04:ad86 : 91 23 __ STA (SP + 0),y 
04:ad88 : ad ac 87 LDA $87ac ; (canvas + 4)
04:ad8b : c8 __ __ INY
04:ad8c : 91 23 __ STA (SP + 0),y 
04:ad8e : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:ad91 : a9 15 __ LDA #$15
04:ad93 : 85 16 __ STA P9 
04:ad95 : a9 09 __ LDA #$09
04:ad97 : 85 17 __ STA P10 
04:ad99 : a9 00 __ LDA #$00
04:ad9b : 8d f3 ab STA $abf3 ; (sstack + 0)
04:ad9e : a9 89 __ LDA #$89
04:ada0 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:ada3 : a9 03 __ LDA #$03
04:ada5 : 8d f5 ab STA $abf5 ; (sstack + 2)
04:ada8 : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
04:adab : 20 5d 80 JSR $805d ; (strtol@proxy + 0)
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
04:adc2 : 20 14 81 JSR $8114 ; (vdc_prints_attr@proxy + 0)
04:adc5 : a9 00 __ LDA #$00
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
04:adda : ad ad 87 LDA $87ad ; (canvas + 5)
04:addd : c8 __ __ INY
04:adde : 91 23 __ STA (SP + 0),y 
04:ade0 : ad ae 87 LDA $87ae ; (canvas + 6)
04:ade3 : c8 __ __ INY
04:ade4 : 91 23 __ STA (SP + 0),y 
04:ade6 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:ade9 : a9 15 __ LDA #$15
04:adeb : 85 16 __ STA P9 
04:aded : a9 0b __ LDA #$0b
04:adef : 85 17 __ STA P10 
04:adf1 : a9 00 __ LDA #$00
04:adf3 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:adf6 : a9 89 __ LDA #$89
04:adf8 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:adfb : a9 03 __ LDA #$03
04:adfd : 8d f5 ab STA $abf5 ; (sstack + 2)
04:ae00 : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
04:ae03 : 20 5d 80 JSR $805d ; (strtol@proxy + 0)
04:ae06 : a5 1b __ LDA ACCU + 0 
04:ae08 : 85 56 __ STA T5 + 0 
04:ae0a : a5 1c __ LDA ACCU + 1 
04:ae0c : 85 57 __ STA T5 + 1 
04:ae0e : a5 54 __ LDA T3 + 0 
04:ae10 : 85 03 __ STA WORK + 0 
04:ae12 : a5 55 __ LDA T3 + 1 
04:ae14 : 85 04 __ STA WORK + 1 
04:ae16 : 20 62 7c JSR $7c62 ; (mul16 + 0)
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
04:ae44 : 20 14 81 JSR $8114 ; (vdc_prints_attr@proxy + 0)
04:ae47 : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
04:ae4a : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
04:ae4d : 4c 0c ad JMP $ad0c ; (loadscreenmap.s1001 + 0)
.s9:
04:ae50 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
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
04:ae69 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
04:ae6c : a5 54 __ LDA T3 + 0 
04:ae6e : 8d ab 87 STA $87ab ; (canvas + 3)
04:ae71 : a5 55 __ LDA T3 + 1 
04:ae73 : 8d ac 87 STA $87ac ; (canvas + 4)
04:ae76 : a5 56 __ LDA T5 + 0 
04:ae78 : 8d ad 87 STA $87ad ; (canvas + 5)
04:ae7b : a5 57 __ LDA T5 + 1 
04:ae7d : 8d ae 87 STA $87ae ; (canvas + 6)
04:ae80 : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
04:ae83 : 20 14 3d JSR $3d14 ; (placesignature.s1000 + 0)
04:ae86 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
04:ae89 : a9 00 __ LDA #$00
04:ae8b : 85 17 __ STA P10 
04:ae8d : 85 18 __ STA P11 
04:ae8f : 8d f3 ab STA $abf3 ; (sstack + 0)
04:ae92 : a9 01 __ LDA #$01
04:ae94 : 8d f5 ab STA $abf5 ; (sstack + 2)
04:ae97 : ad 92 87 LDA $8792 ; (vdc_state + 3)
04:ae9a : 8d f4 ab STA $abf4 ; (sstack + 1)
04:ae9d : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
04:aea0 : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
04:aea3 : ad fe 86 LDA $86fe ; (showbar + 0)
04:aea6 : f0 03 __ BEQ $aeab ; (loadscreenmap.s22 + 0)
.s15:
04:aea8 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s22:
04:aeab : a9 00 __ LDA #$00
04:aead : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
04:aeb0 : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
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
04:af45 : 20 84 4b JSR $4b84 ; (chooseidandfilename.s0 + 0)
04:af48 : a5 1b __ LDA ACCU + 0 
04:af4a : 85 53 __ STA T0 + 0 
04:af4c : a5 1c __ LDA ACCU + 1 
04:af4e : 85 54 __ STA T0 + 1 
04:af50 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
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
04:af7e : a9 7a __ LDA #$7a
04:af80 : c8 __ __ INY
04:af81 : 91 23 __ STA (SP + 0),y 
04:af83 : a9 87 __ LDA #$87
04:af85 : c8 __ __ INY
04:af86 : 91 23 __ STA (SP + 0),y 
04:af88 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:af8b : a9 83 __ LDA #$83
04:af8d : 8d fc ab STA $abfc ; (sstack + 9)
04:af90 : a9 ab __ LDA #$ab
04:af92 : 8d fd ab STA $abfd ; (sstack + 10)
04:af95 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
04:af98 : 85 55 __ STA T1 + 0 
04:af9a : 8d fe ab STA $abfe ; (sstack + 11)
04:af9d : 20 26 62 JSR $6226 ; (checkiffileexists.s1000 + 0)
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
04:afc1 : a9 00 __ LDA #$00
04:afc3 : a0 02 __ LDY #$02
04:afc5 : 91 23 __ STA (SP + 0),y 
04:afc7 : a9 89 __ LDA #$89
04:afc9 : c8 __ __ INY
04:afca : 91 23 __ STA (SP + 0),y 
04:afcc : a9 7a __ LDA #$7a
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
04:afe2 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:afe5 : 20 ac 62 JSR $62ac ; (cmd@proxy + 0)
04:afe8 : a9 00 __ LDA #$00
04:afea : a0 02 __ LDY #$02
04:afec : 91 23 __ STA (SP + 0),y 
04:afee : a9 89 __ LDA #$89
04:aff0 : c8 __ __ INY
04:aff1 : 91 23 __ STA (SP + 0),y 
04:aff3 : a9 7a __ LDA #$7a
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
04:b009 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b00c : 20 ac 62 JSR $62ac ; (cmd@proxy + 0)
04:b00f : a9 00 __ LDA #$00
04:b011 : a0 02 __ LDY #$02
04:b013 : 91 23 __ STA (SP + 0),y 
04:b015 : a9 89 __ LDA #$89
04:b017 : c8 __ __ INY
04:b018 : 91 23 __ STA (SP + 0),y 
04:b01a : a9 7a __ LDA #$7a
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
04:b030 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b033 : 20 ac 62 JSR $62ac ; (cmd@proxy + 0)
04:b036 : a9 00 __ LDA #$00
04:b038 : a0 02 __ LDY #$02
04:b03a : 91 23 __ STA (SP + 0),y 
04:b03c : a9 89 __ LDA #$89
04:b03e : c8 __ __ INY
04:b03f : 91 23 __ STA (SP + 0),y 
04:b041 : a9 7a __ LDA #$7a
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
04:b057 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b05a : 20 ac 62 JSR $62ac ; (cmd@proxy + 0)
.s10:
04:b05d : a9 00 __ LDA #$00
04:b05f : a0 02 __ LDY #$02
04:b061 : 91 23 __ STA (SP + 0),y 
04:b063 : a9 89 __ LDA #$89
04:b065 : c8 __ __ INY
04:b066 : 91 23 __ STA (SP + 0),y 
04:b068 : a9 7a __ LDA #$7a
04:b06a : a0 06 __ LDY #$06
04:b06c : 91 23 __ STA (SP + 0),y 
04:b06e : a9 87 __ LDA #$87
04:b070 : c8 __ __ INY
04:b071 : 91 23 __ STA (SP + 0),y 
04:b073 : ad e8 86 LDA $86e8 ; (charsetchanged + 0)
04:b076 : 8d 98 ab STA $ab98 ; (projbuffer + 9)
04:b079 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
04:b07c : 8d 99 ab STA $ab99 ; (projbuffer + 10)
04:b07f : ad eb 86 LDA $86eb ; (screen_col + 0)
04:b082 : 8d 9a ab STA $ab9a ; (projbuffer + 11)
04:b085 : ad ed 86 LDA $86ed ; (screen_row + 0)
04:b088 : 8d 9b ab STA $ab9b ; (projbuffer + 12)
04:b08b : ad ab 87 LDA $87ab ; (canvas + 3)
04:b08e : 8d 9d ab STA $ab9d ; (projbuffer + 14)
04:b091 : ad ac 87 LDA $87ac ; (canvas + 4)
04:b094 : 8d 9c ab STA $ab9c ; (projbuffer + 13)
04:b097 : ad ad 87 LDA $87ad ; (canvas + 5)
04:b09a : 8d 9f ab STA $ab9f ; (projbuffer + 16)
04:b09d : ad ae 87 LDA $87ae ; (canvas + 6)
04:b0a0 : 8d 9e ab STA $ab9e ; (projbuffer + 15)
04:b0a3 : ad f7 86 LDA $86f7 ; (screentotal + 0)
04:b0a6 : 85 56 __ STA T4 + 0 
04:b0a8 : 8d a1 ab STA $aba1 ; (projbuffer + 18)
04:b0ab : ad f8 86 LDA $86f8 ; (screentotal + 1)
04:b0ae : 85 57 __ STA T4 + 1 
04:b0b0 : 8d a0 ab STA $aba0 ; (projbuffer + 17)
04:b0b3 : ad ef 86 LDA $86ef ; (screenbackground + 0)
04:b0b6 : 8d a2 ab STA $aba2 ; (projbuffer + 19)
04:b0b9 : ad cb 82 LDA $82cb ; (mc_mb_normal + 0)
04:b0bc : 8d a3 ab STA $aba3 ; (projbuffer + 20)
04:b0bf : ad cc 82 LDA $82cc ; (mc_mb_select + 0)
04:b0c2 : 8d a4 ab STA $aba4 ; (projbuffer + 21)
04:b0c5 : ad cd 82 LDA $82cd ; (mc_pd_normal + 0)
04:b0c8 : 8d a5 ab STA $aba5 ; (projbuffer + 22)
04:b0cb : ad ce 82 LDA $82ce ; (mc_pd_select + 0)
04:b0ce : 8d a6 ab STA $aba6 ; (chareditor@stack + 19)
04:b0d1 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
04:b0d4 : 8d a7 ab STA $aba7 ; (chareditor@stack + 20)
04:b0d7 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
04:b0da : 8d a8 ab STA $aba8 ; (chareditor@stack + 21)
04:b0dd : ad f1 86 LDA $86f1 ; (plotcolor + 0)
04:b0e0 : 8d a9 ab STA $aba9 ; (chareditor@stack + 22)
04:b0e3 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
04:b0e6 : 8d aa ab STA $abaa ; (chareditor@stack + 23)
04:b0e9 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
04:b0ec : 8d ab ab STA $abab ; (chareditor@stack + 24)
04:b0ef : ad f4 86 LDA $86f4 ; (plotblink + 0)
04:b0f2 : 8d ac ab STA $abac ; (chareditor@stack + 25)
04:b0f5 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
04:b0f8 : 8d ad ab STA $abad ; (projbuffer + 21)
04:b0fb : ad 91 87 LDA $8791 ; (vdc_state + 2)
04:b0fe : 8d ae ab STA $abae ; (projbuffer + 22)
04:b101 : a9 45 __ LDA #$45
04:b103 : a0 04 __ LDY #$04
04:b105 : 91 23 __ STA (SP + 0),y 
04:b107 : a9 b2 __ LDA #$b2
04:b109 : c8 __ __ INY
04:b10a : 91 23 __ STA (SP + 0),y 
04:b10c : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b10f : a5 55 __ LDA T1 + 0 
04:b111 : 85 12 __ STA P5 
04:b113 : a9 00 __ LDA #$00
04:b115 : 85 13 __ STA P6 
04:b117 : a9 00 __ LDA #$00
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
04:b131 : 20 58 15 JSR $1558 ; (bnk_save.s0 + 0)
04:b134 : a5 1b __ LDA ACCU + 0 
04:b136 : d0 03 __ BNE $b13b ; (saveproject.s13 + 0)
.s11:
04:b138 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s13:
04:b13b : a9 00 __ LDA #$00
04:b13d : a0 02 __ LDY #$02
04:b13f : 91 23 __ STA (SP + 0),y 
04:b141 : a9 89 __ LDA #$89
04:b143 : c8 __ __ INY
04:b144 : 91 23 __ STA (SP + 0),y 
04:b146 : a9 7a __ LDA #$7a
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
04:b15c : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b15f : a5 55 __ LDA T1 + 0 
04:b161 : 85 12 __ STA P5 
04:b163 : a9 01 __ LDA #$01
04:b165 : 85 13 __ STA P6 
04:b167 : a9 00 __ LDA #$00
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
04:b188 : 20 58 15 JSR $1558 ; (bnk_save.s0 + 0)
04:b18b : a5 1b __ LDA ACCU + 0 
04:b18d : d0 03 __ BNE $b192 ; (saveproject.s34 + 0)
.s14:
04:b18f : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s34:
04:b192 : ad e8 86 LDA $86e8 ; (charsetchanged + 0)
04:b195 : c9 01 __ CMP #$01
04:b197 : d0 4e __ BNE $b1e7 ; (saveproject.s36 + 0)
.s17:
04:b199 : a9 00 __ LDA #$00
04:b19b : a0 02 __ LDY #$02
04:b19d : 91 23 __ STA (SP + 0),y 
04:b19f : a9 89 __ LDA #$89
04:b1a1 : c8 __ __ INY
04:b1a2 : 91 23 __ STA (SP + 0),y 
04:b1a4 : a9 7a __ LDA #$7a
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
04:b1ba : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b1bd : a5 55 __ LDA T1 + 0 
04:b1bf : 85 12 __ STA P5 
04:b1c1 : a9 01 __ LDA #$01
04:b1c3 : 85 13 __ STA P6 
04:b1c5 : a9 00 __ LDA #$00
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
04:b1dd : 20 58 15 JSR $1558 ; (bnk_save.s0 + 0)
04:b1e0 : a5 1b __ LDA ACCU + 0 
04:b1e2 : d0 03 __ BNE $b1e7 ; (saveproject.s36 + 0)
.s20:
04:b1e4 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s36:
04:b1e7 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
04:b1ea : c9 01 __ CMP #$01
04:b1ec : f0 03 __ BEQ $b1f1 ; (saveproject.s23 + 0)
04:b1ee : 4c a4 af JMP $afa4 ; (saveproject.s1001 + 0)
.s23:
04:b1f1 : a9 00 __ LDA #$00
04:b1f3 : a0 02 __ LDY #$02
04:b1f5 : 91 23 __ STA (SP + 0),y 
04:b1f7 : a9 89 __ LDA #$89
04:b1f9 : c8 __ __ INY
04:b1fa : 91 23 __ STA (SP + 0),y 
04:b1fc : a9 7a __ LDA #$7a
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
04:b212 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b215 : a5 55 __ LDA T1 + 0 
04:b217 : 85 12 __ STA P5 
04:b219 : a9 01 __ LDA #$01
04:b21b : 85 13 __ STA P6 
04:b21d : a9 58 __ LDA #$58
04:b21f : 85 17 __ STA P10 
04:b221 : a9 00 __ LDA #$00
04:b223 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b226 : a9 89 __ LDA #$89
04:b228 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b22b : a9 00 __ LDA #$00
04:b22d : 85 16 __ STA P9 
04:b22f : 85 14 __ STA P7 
04:b231 : a9 50 __ LDA #$50
04:b233 : 85 15 __ STA P8 
04:b235 : 20 58 15 JSR $1558 ; (bnk_save.s0 + 0)
04:b238 : a5 1b __ LDA ACCU + 0 
04:b23a : f0 03 __ BEQ $b23f ; (saveproject.s26 + 0)
04:b23c : 4c a4 af JMP $afa4 ; (saveproject.s1001 + 0)
.s26:
04:b23f : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
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
04:b2b6 : 20 b4 64 JSR $64b4 ; (filepicker.s1000 + 0)
04:b2b9 : a5 1b __ LDA ACCU + 0 
04:b2bb : f0 57 __ BEQ $b314 ; (loadproject.s1001 + 0)
.s3:
04:b2bd : a9 7a __ LDA #$7a
04:b2bf : 85 0d __ STA P0 
04:b2c1 : a9 87 __ LDA #$87
04:b2c3 : 85 0e __ STA P1 
04:b2c5 : 20 89 33 JSR $3389 ; (strlen.s0 + 0)
04:b2c8 : a9 7a __ LDA #$7a
04:b2ca : a0 06 __ LDY #$06
04:b2cc : 91 23 __ STA (SP + 0),y 
04:b2ce : a9 87 __ LDA #$87
04:b2d0 : c8 __ __ INY
04:b2d1 : 91 23 __ STA (SP + 0),y 
04:b2d3 : a9 00 __ LDA #$00
04:b2d5 : a6 1b __ LDX ACCU + 0 
04:b2d7 : 9d 75 87 STA $8775,x ; (bitshift + 51)
04:b2da : a9 00 __ LDA #$00
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
04:b2ef : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b2f2 : a9 00 __ LDA #$00
04:b2f4 : 85 10 __ STA P3 
04:b2f6 : a9 00 __ LDA #$00
04:b2f8 : 85 13 __ STA P6 
04:b2fa : a9 89 __ LDA #$89
04:b2fc : 85 14 __ STA P7 
04:b2fe : a9 8f __ LDA #$8f
04:b300 : 85 11 __ STA P4 
04:b302 : a9 ab __ LDA #$ab
04:b304 : 85 12 __ STA P5 
04:b306 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
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
04:b32f : ad e8 86 LDA $86e8 ; (charsetchanged + 0)
04:b332 : 85 54 __ STA T3 + 0 
04:b334 : ad 8f ab LDA $ab8f ; (tempfilename + 12)
04:b337 : 8d e8 86 STA $86e8 ; (charsetchanged + 0)
04:b33a : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
04:b33d : 85 55 __ STA T4 + 0 
04:b33f : ad 90 ab LDA $ab90 ; (tempfilename + 13)
04:b342 : 8d e9 86 STA $86e9 ; (charsetchanged + 1)
04:b345 : ad 91 ab LDA $ab91 ; (tempfilename + 14)
04:b348 : 8d eb 86 STA $86eb ; (screen_col + 0)
04:b34b : ad 92 ab LDA $ab92 ; (tempfilename + 15)
04:b34e : 8d ed 86 STA $86ed ; (screen_row + 0)
04:b351 : a9 00 __ LDA #$00
04:b353 : 8d ec 86 STA $86ec ; (screen_col + 1)
04:b356 : 8d ee 86 STA $86ee ; (screen_row + 1)
04:b359 : ad 94 ab LDA $ab94 ; (tempfilename + 17)
04:b35c : 8d ab 87 STA $87ab ; (canvas + 3)
04:b35f : ad 93 ab LDA $ab93 ; (tempfilename + 16)
04:b362 : 8d ac 87 STA $87ac ; (canvas + 4)
04:b365 : ad 96 ab LDA $ab96 ; (tempfilename + 19)
04:b368 : 8d ad 87 STA $87ad ; (canvas + 5)
04:b36b : ad 95 ab LDA $ab95 ; (tempfilename + 18)
04:b36e : 8d ae 87 STA $87ae ; (canvas + 6)
04:b371 : ad 98 ab LDA $ab98 ; (projbuffer + 9)
04:b374 : 8d f7 86 STA $86f7 ; (screentotal + 0)
04:b377 : ad 97 ab LDA $ab97 ; (tempfilename + 20)
04:b37a : 8d f8 86 STA $86f8 ; (screentotal + 1)
04:b37d : ad 99 ab LDA $ab99 ; (projbuffer + 10)
04:b380 : 8d ef 86 STA $86ef ; (screenbackground + 0)
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
04:b3a6 : 8d cb 82 STA $82cb ; (mc_mb_normal + 0)
04:b3a9 : ad 9b ab LDA $ab9b ; (projbuffer + 12)
04:b3ac : 8d cc 82 STA $82cc ; (mc_mb_select + 0)
04:b3af : ad 9c ab LDA $ab9c ; (projbuffer + 13)
04:b3b2 : 8d cd 82 STA $82cd ; (mc_pd_normal + 0)
04:b3b5 : ad 9d ab LDA $ab9d ; (projbuffer + 14)
04:b3b8 : 8d ce 82 STA $82ce ; (mc_pd_select + 0)
04:b3bb : ad 9e ab LDA $ab9e ; (projbuffer + 15)
04:b3be : 8d ff 7a STA $7aff ; (mc_menupopup + 0)
04:b3c1 : ad 9f ab LDA $ab9f ; (projbuffer + 16)
04:b3c4 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
04:b3c7 : ad a0 ab LDA $aba0 ; (projbuffer + 17)
04:b3ca : 8d f1 86 STA $86f1 ; (plotcolor + 0)
04:b3cd : ad a1 ab LDA $aba1 ; (projbuffer + 18)
04:b3d0 : 8d f2 86 STA $86f2 ; (plotreverse + 0)
04:b3d3 : ad a2 ab LDA $aba2 ; (projbuffer + 19)
04:b3d6 : 8d f3 86 STA $86f3 ; (plotunderline + 0)
04:b3d9 : ad a3 ab LDA $aba3 ; (projbuffer + 20)
04:b3dc : 8d f4 86 STA $86f4 ; (plotblink + 0)
04:b3df : ad a4 ab LDA $aba4 ; (projbuffer + 21)
04:b3e2 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
04:b3e5 : ad a5 ab LDA $aba5 ; (projbuffer + 22)
04:b3e8 : cd 91 87 CMP $8791 ; (vdc_state + 2)
04:b3eb : f0 05 __ BEQ $b3f2 ; (loadproject.s24 + 0)
.s22:
04:b3ed : 85 16 __ STA P9 
04:b3ef : 20 37 2e JSR $2e37 ; (vdc_set_mode.s0 + 0)
.s24:
04:b3f2 : 20 77 31 JSR $3177 ; (updatecanvas.s1000 + 0)
04:b3f5 : a9 00 __ LDA #$00
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
04:b40a : a9 7a __ LDA #$7a
04:b40c : c8 __ __ INY
04:b40d : 91 23 __ STA (SP + 0),y 
04:b40f : a9 87 __ LDA #$87
04:b411 : c8 __ __ INY
04:b412 : 91 23 __ STA (SP + 0),y 
04:b414 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b417 : a9 58 __ LDA #$58
04:b419 : 85 12 __ STA P5 
04:b41b : 20 00 1a JSR $1a00 ; (bnk_load@proxy + 0)
04:b41e : a5 1b __ LDA ACCU + 0 
04:b420 : f0 33 __ BEQ $b455 ; (loadproject.s96 + 0)
.s25:
04:b422 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
04:b425 : 20 14 3d JSR $3d14 ; (placesignature.s1000 + 0)
04:b428 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
04:b42b : a9 00 __ LDA #$00
04:b42d : 85 17 __ STA P10 
04:b42f : 85 18 __ STA P11 
04:b431 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b434 : a9 01 __ LDA #$01
04:b436 : 8d f5 ab STA $abf5 ; (sstack + 2)
04:b439 : ad 92 87 LDA $8792 ; (vdc_state + 3)
04:b43c : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b43f : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
04:b442 : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
04:b445 : ad fe 86 LDA $86fe ; (showbar + 0)
04:b448 : f0 03 __ BEQ $b44d ; (loadproject.s102 + 0)
.s28:
04:b44a : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
.s102:
04:b44d : a9 00 __ LDA #$00
04:b44f : 8d fc 86 STA $86fc ; (undo_undopossible + 0)
04:b452 : 8d fd 86 STA $86fd ; (undo_redopossible + 0)
.s96:
04:b455 : ad e8 86 LDA $86e8 ; (charsetchanged + 0)
04:b458 : d0 04 __ BNE $b45e ; (loadproject.s34 + 0)
.s35:
04:b45a : a5 54 __ LDA T3 + 0 
04:b45c : d0 09 __ BNE $b467 ; (loadproject.s31 + 0)
.s34:
04:b45e : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
04:b461 : d0 21 __ BNE $b484 ; (loadproject.s33 + 0)
.s36:
04:b463 : a5 55 __ LDA T4 + 0 
04:b465 : f0 1d __ BEQ $b484 ; (loadproject.s33 + 0)
.s31:
04:b467 : 20 07 30 JSR $3007 ; (vdc_restore_charsets.s0 + 0)
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
04:b47f : 8d e8 86 STA $86e8 ; (charsetchanged + 0)
04:b482 : d0 07 __ BNE $b48b ; (loadproject.s37 + 0)
.s33:
04:b484 : ad e8 86 LDA $86e8 ; (charsetchanged + 0)
04:b487 : c9 01 __ CMP #$01
04:b489 : d0 3c __ BNE $b4c7 ; (loadproject.s39 + 0)
.s37:
04:b48b : a9 00 __ LDA #$00
04:b48d : a0 02 __ LDY #$02
04:b48f : 91 23 __ STA (SP + 0),y 
04:b491 : a9 89 __ LDA #$89
04:b493 : c8 __ __ INY
04:b494 : 91 23 __ STA (SP + 0),y 
04:b496 : a9 7a __ LDA #$7a
04:b498 : a0 06 __ LDY #$06
04:b49a : 91 23 __ STA (SP + 0),y 
04:b49c : a9 87 __ LDA #$87
04:b49e : c8 __ __ INY
04:b49f : 91 23 __ STA (SP + 0),y 
04:b4a1 : a9 7d __ LDA #$7d
04:b4a3 : a0 04 __ LDY #$04
04:b4a5 : 91 23 __ STA (SP + 0),y 
04:b4a7 : a9 b2 __ LDA #$b2
04:b4a9 : c8 __ __ INY
04:b4aa : 91 23 __ STA (SP + 0),y 
04:b4ac : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b4af : a9 48 __ LDA #$48
04:b4b1 : 85 12 __ STA P5 
04:b4b3 : 20 00 1a JSR $1a00 ; (bnk_load@proxy + 0)
04:b4b6 : a9 7f __ LDA #$7f
04:b4b8 : 85 11 __ STA P4 
04:b4ba : a9 00 __ LDA #$00
04:b4bc : 85 12 __ STA P5 
04:b4be : 85 14 __ STA P7 
04:b4c0 : a9 48 __ LDA #$48
04:b4c2 : 85 13 __ STA P6 
04:b4c4 : 20 7f 1a JSR $1a7f ; (bnk_redef_charset@proxy + 0)
.s39:
04:b4c7 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
04:b4ca : c9 01 __ CMP #$01
04:b4cc : f0 03 __ BEQ $b4d1 ; (loadproject.s40 + 0)
04:b4ce : 4c 14 b3 JMP $b314 ; (loadproject.s1001 + 0)
.s40:
04:b4d1 : a9 00 __ LDA #$00
04:b4d3 : a0 02 __ LDY #$02
04:b4d5 : 91 23 __ STA (SP + 0),y 
04:b4d7 : a9 89 __ LDA #$89
04:b4d9 : c8 __ __ INY
04:b4da : 91 23 __ STA (SP + 0),y 
04:b4dc : a9 7a __ LDA #$7a
04:b4de : a0 06 __ LDY #$06
04:b4e0 : 91 23 __ STA (SP + 0),y 
04:b4e2 : a9 87 __ LDA #$87
04:b4e4 : c8 __ __ INY
04:b4e5 : 91 23 __ STA (SP + 0),y 
04:b4e7 : a9 85 __ LDA #$85
04:b4e9 : a0 04 __ LDY #$04
04:b4eb : 91 23 __ STA (SP + 0),y 
04:b4ed : a9 b2 __ LDA #$b2
04:b4ef : c8 __ __ INY
04:b4f0 : 91 23 __ STA (SP + 0),y 
04:b4f2 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b4f5 : a9 50 __ LDA #$50
04:b4f7 : 85 12 __ STA P5 
04:b4f9 : 20 00 1a JSR $1a00 ; (bnk_load@proxy + 0)
04:b4fc : a9 7f __ LDA #$7f
04:b4fe : 85 11 __ STA P4 
04:b500 : a9 00 __ LDA #$00
04:b502 : 85 12 __ STA P5 
04:b504 : 85 14 __ STA P7 
04:b506 : a9 01 __ LDA #$01
04:b508 : 85 15 __ STA P8 
04:b50a : 20 90 1a JSR $1a90 ; (bnk_redef_charset@proxy + 0)
04:b50d : 4c 14 b3 JMP $b314 ; (loadproject.s1001 + 0)
--------------------------------------------------------------------
loadcharset: ; loadcharset(u8)->void
.s1000:
04:b510 : a2 03 __ LDX #$03
04:b512 : b5 53 __ LDA T0 + 0,x 
04:b514 : 9d c4 ab STA $abc4,x ; (projbuffer + 44)
04:b517 : ca __ __ DEX
04:b518 : 10 f8 __ BPL $b512 ; (loadcharset.s1000 + 2)
.s0:
04:b51a : a9 00 __ LDA #$00
04:b51c : 8d fc ab STA $abfc ; (sstack + 9)
04:b51f : 20 b4 64 JSR $64b4 ; (filepicker.s1000 + 0)
04:b522 : a5 1b __ LDA ACCU + 0 
04:b524 : f0 46 __ BEQ $b56c ; (loadcharset.s1001 + 0)
.s3:
04:b526 : a9 01 __ LDA #$01
04:b528 : 85 10 __ STA P3 
04:b52a : ad fd ab LDA $abfd ; (sstack + 10)
04:b52d : 85 53 __ STA T0 + 0 
04:b52f : d0 04 __ BNE $b535 ; (loadcharset.s1003 + 0)
.s1002:
04:b531 : a9 01 __ LDA #$01
04:b533 : d0 02 __ BNE $b537 ; (loadcharset.s1004 + 0)
.s1003:
04:b535 : a9 00 __ LDA #$00
.s1004:
04:b537 : 85 54 __ STA T1 + 0 
04:b539 : c9 01 __ CMP #$01
04:b53b : a9 00 __ LDA #$00
04:b53d : 85 11 __ STA P4 
04:b53f : 69 ff __ ADC #$ff
04:b541 : 29 18 __ AND #$18
04:b543 : 49 48 __ EOR #$48
04:b545 : 85 56 __ STA T2 + 1 
04:b547 : 85 12 __ STA P5 
04:b549 : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
04:b54c : a5 1b __ LDA ACCU + 0 
04:b54e : f0 1c __ BEQ $b56c ; (loadcharset.s1001 + 0)
.s5:
04:b550 : a5 54 __ LDA T1 + 0 
04:b552 : f0 11 __ BEQ $b565 ; (loadcharset.s10 + 0)
.s8:
04:b554 : a9 7f __ LDA #$7f
04:b556 : 85 11 __ STA P4 
04:b558 : a9 00 __ LDA #$00
04:b55a : 85 12 __ STA P5 
04:b55c : 85 14 __ STA P7 
04:b55e : a5 56 __ LDA T2 + 1 
04:b560 : 85 13 __ STA P6 
04:b562 : 20 7f 1a JSR $1a7f ; (bnk_redef_charset@proxy + 0)
.s10:
04:b565 : a9 01 __ LDA #$01
04:b567 : a6 53 __ LDX T0 + 0 
04:b569 : 9d e8 86 STA $86e8,x ; (charsetchanged + 0)
.s1001:
04:b56c : a2 03 __ LDX #$03
04:b56e : bd c4 ab LDA $abc4,x ; (projbuffer + 44)
04:b571 : 95 53 __ STA T0 + 0,x 
04:b573 : ca __ __ DEX
04:b574 : 10 f8 __ BPL $b56e ; (loadcharset.s1001 + 2)
04:b576 : 60 __ __ RTS
--------------------------------------------------------------------
savecharset: ; savecharset(u8)->void
.s1000:
04:b577 : a2 04 __ LDX #$04
04:b579 : b5 53 __ LDA T0 + 0,x 
04:b57b : 9d bf ab STA $abbf,x ; (projbuffer + 39)
04:b57e : ca __ __ DEX
04:b57f : 10 f8 __ BPL $b579 ; (savecharset.s1000 + 2)
04:b581 : 38 __ __ SEC
04:b582 : a5 23 __ LDA SP + 0 
04:b584 : e9 08 __ SBC #$08
04:b586 : 85 23 __ STA SP + 0 
04:b588 : b0 02 __ BCS $b58c ; (savecharset.s0 + 0)
04:b58a : c6 24 __ DEC SP + 1 
.s0:
04:b58c : a9 0f __ LDA #$0f
04:b58e : 8d fa ab STA $abfa ; (sstack + 7)
04:b591 : a9 4b __ LDA #$4b
04:b593 : 8d f8 ab STA $abf8 ; (sstack + 5)
04:b596 : a9 b6 __ LDA #$b6
04:b598 : 8d f9 ab STA $abf9 ; (sstack + 6)
04:b59b : 20 84 4b JSR $4b84 ; (chooseidandfilename.s0 + 0)
04:b59e : a5 1b __ LDA ACCU + 0 
04:b5a0 : 85 53 __ STA T0 + 0 
04:b5a2 : a5 1c __ LDA ACCU + 1 
04:b5a4 : 85 54 __ STA T0 + 1 
04:b5a6 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
04:b5a9 : a5 54 __ LDA T0 + 1 
04:b5ab : c9 ff __ CMP #$ff
04:b5ad : d0 09 __ BNE $b5b8 ; (savecharset.s3 + 0)
.s1004:
04:b5af : a5 53 __ LDA T0 + 0 
04:b5b1 : c9 ff __ CMP #$ff
04:b5b3 : d0 03 __ BNE $b5b8 ; (savecharset.s3 + 0)
04:b5b5 : 4c 35 b6 JMP $b635 ; (savecharset.s1001 + 0)
.s3:
04:b5b8 : a9 7a __ LDA #$7a
04:b5ba : 8d fc ab STA $abfc ; (sstack + 9)
04:b5bd : a9 87 __ LDA #$87
04:b5bf : 8d fd ab STA $abfd ; (sstack + 10)
04:b5c2 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
04:b5c5 : 85 55 __ STA T1 + 0 
04:b5c7 : 8d fe ab STA $abfe ; (sstack + 11)
04:b5ca : 20 26 62 JSR $6226 ; (checkiffileexists.s1000 + 0)
04:b5cd : a5 1b __ LDA ACCU + 0 
04:b5cf : f0 64 __ BEQ $b635 ; (savecharset.s1001 + 0)
.s5:
04:b5d1 : ad ff ab LDA $abff ; (sstack + 12)
04:b5d4 : f0 04 __ BEQ $b5da ; (savecharset.s1006 + 0)
.s1007:
04:b5d6 : a9 50 __ LDA #$50
04:b5d8 : d0 02 __ BNE $b5dc ; (savecharset.s1008 + 0)
.s1006:
04:b5da : a9 48 __ LDA #$48
.s1008:
04:b5dc : 85 57 __ STA T4 + 1 
04:b5de : a5 1b __ LDA ACCU + 0 
04:b5e0 : c9 02 __ CMP #$02
04:b5e2 : d0 26 __ BNE $b60a ; (savecharset.s10 + 0)
.s8:
04:b5e4 : a9 7a __ LDA #$7a
04:b5e6 : a0 06 __ LDY #$06
04:b5e8 : 91 23 __ STA (SP + 0),y 
04:b5ea : a9 87 __ LDA #$87
04:b5ec : c8 __ __ INY
04:b5ed : 91 23 __ STA (SP + 0),y 
04:b5ef : a9 00 __ LDA #$00
04:b5f1 : a0 02 __ LDY #$02
04:b5f3 : 91 23 __ STA (SP + 0),y 
04:b5f5 : a9 89 __ LDA #$89
04:b5f7 : c8 __ __ INY
04:b5f8 : 91 23 __ STA (SP + 0),y 
04:b5fa : a9 e6 __ LDA #$e6
04:b5fc : c8 __ __ INY
04:b5fd : 91 23 __ STA (SP + 0),y 
04:b5ff : a9 ac __ LDA #$ac
04:b601 : c8 __ __ INY
04:b602 : 91 23 __ STA (SP + 0),y 
04:b604 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
04:b607 : 20 ac 62 JSR $62ac ; (cmd@proxy + 0)
.s10:
04:b60a : a5 55 __ LDA T1 + 0 
04:b60c : 85 12 __ STA P5 
04:b60e : a9 01 __ LDA #$01
04:b610 : 85 13 __ STA P6 
04:b612 : a9 00 __ LDA #$00
04:b614 : 85 14 __ STA P7 
04:b616 : 85 16 __ STA P9 
04:b618 : a5 57 __ LDA T4 + 1 
04:b61a : 85 15 __ STA P8 
04:b61c : 18 __ __ CLC
04:b61d : 69 08 __ ADC #$08
04:b61f : 85 17 __ STA P10 
04:b621 : a9 7a __ LDA #$7a
04:b623 : 8d f3 ab STA $abf3 ; (sstack + 0)
04:b626 : a9 87 __ LDA #$87
04:b628 : 8d f4 ab STA $abf4 ; (sstack + 1)
04:b62b : 20 58 15 JSR $1558 ; (bnk_save.s0 + 0)
04:b62e : a5 1b __ LDA ACCU + 0 
04:b630 : d0 03 __ BNE $b635 ; (savecharset.s1001 + 0)
.s11:
04:b632 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s1001:
04:b635 : 18 __ __ CLC
04:b636 : a5 23 __ LDA SP + 0 
04:b638 : 69 08 __ ADC #$08
04:b63a : 85 23 __ STA SP + 0 
04:b63c : 90 02 __ BCC $b640 ; (savecharset.s1001 + 11)
04:b63e : e6 24 __ INC SP + 1 
04:b640 : a2 04 __ LDX #$04
04:b642 : bd bf ab LDA $abbf,x ; (projbuffer + 39)
04:b645 : 95 53 __ STA T0 + 0,x 
04:b647 : ca __ __ DEX
04:b648 : 10 f8 __ BPL $b642 ; (savecharset.s1001 + 13)
04:b64a : 60 __ __ RTS
--------------------------------------------------------------------
04:b64b : __ __ __ BYT 73 41 56 45 20 43 48 41 52 53 45 54 00          : sAVE CHARSET.
--------------------------------------------------------------------
chareditor: ; chareditor()->void
.s1000:
05:ac00 : a2 12 __ LDX #$12
05:ac02 : b5 53 __ LDA T0 + 0,x 
05:ac04 : 9d 93 ab STA $ab93,x ; (tempfilename + 16)
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
05:ac19 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
05:ac1c : 85 0e __ STA P1 
05:ac1e : 85 53 __ STA T0 + 0 
05:ac20 : 85 54 __ STA T1 + 0 
05:ac22 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
05:ac25 : 85 55 __ STA T2 + 0 
05:ac27 : 85 0d __ STA P0 
05:ac29 : 20 da b6 JSR $b6da ; (charaddress.s0 + 0)
05:ac2c : a5 1b __ LDA ACCU + 0 
05:ac2e : 85 56 __ STA T3 + 0 
05:ac30 : a5 1c __ LDA ACCU + 1 
05:ac32 : 85 57 __ STA T3 + 1 
05:ac34 : a5 55 __ LDA T2 + 0 
05:ac36 : 85 58 __ STA T4 + 0 
05:ac38 : a9 01 __ LDA #$01
05:ac3a : a6 0e __ LDX P1 
05:ac3c : 9d e8 86 STA $86e8,x ; (charsetchanged + 0)
05:ac3f : a0 ff __ LDY #$ff
.l1002:
05:ac41 : c8 __ __ INY
05:ac42 : b9 30 b7 LDA $b730,y 
05:ac45 : 99 e1 88 STA $88e1,y ; (programmode + 0)
05:ac48 : d0 f7 __ BNE $ac41 ; (chareditor.l1002 + 0)
.s1003:
05:ac4a : a9 00 __ LDA #$00
05:ac4c : 85 5c __ STA T7 + 0 
05:ac4e : 85 5d __ STA T8 + 0 
05:ac50 : 85 5e __ STA T9 + 0 
05:ac52 : 85 5f __ STA T10 + 0 
05:ac54 : 8a __ __ TXA
05:ac55 : d0 1c __ BNE $ac73 ; (chareditor.s3 + 0)
.s4:
05:ac57 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
05:ac5a : c9 01 __ CMP #$01
05:ac5c : d0 15 __ BNE $ac73 ; (chareditor.s3 + 0)
.s1:
05:ac5e : 86 14 __ STX P7 
05:ac60 : 86 12 __ STX P5 
05:ac62 : a9 7f __ LDA #$7f
05:ac64 : 85 11 __ STA P4 
05:ac66 : ad a1 87 LDA $87a1 ; (vdc_state + 18)
05:ac69 : 85 0f __ STA P2 
05:ac6b : ad a2 87 LDA $87a2 ; (vdc_state + 19)
05:ac6e : 85 10 __ STA P3 
05:ac70 : 20 a1 1a JSR $1aa1 ; (bnk_redef_charset@proxy + 0)
.s3:
05:ac73 : a5 53 __ LDA T0 + 0 
05:ac75 : c9 01 __ CMP #$01
05:ac77 : d0 22 __ BNE $ac9b ; (chareditor.s10 + 0)
.s8:
05:ac79 : ad e8 86 LDA $86e8 ; (charsetchanged + 0)
05:ac7c : c9 01 __ CMP #$01
05:ac7e : d0 1b __ BNE $ac9b ; (chareditor.s10 + 0)
.s5:
05:ac80 : a9 7f __ LDA #$7f
05:ac82 : 85 11 __ STA P4 
05:ac84 : a9 01 __ LDA #$01
05:ac86 : 85 15 __ STA P8 
05:ac88 : ad 9f 87 LDA $879f ; (vdc_state + 16)
05:ac8b : 85 0f __ STA P2 
05:ac8d : ad a0 87 LDA $87a0 ; (vdc_state + 17)
05:ac90 : 85 10 __ STA P3 
05:ac92 : a9 00 __ LDA #$00
05:ac94 : 85 14 __ STA P7 
05:ac96 : 85 12 __ STA P5 
05:ac98 : 20 b3 1a JSR $1ab3 ; (bnk_redef_charset@proxy + 0)
.s10:
05:ac9b : a0 00 __ LDY #$00
.l1253:
05:ac9d : a9 12 __ LDA #$12
05:ac9f : 8d 00 d6 STA $d600 
05:aca2 : 98 __ __ TYA
05:aca3 : 18 __ __ CLC
05:aca4 : 65 56 __ ADC T3 + 0 
05:aca6 : aa __ __ TAX
05:aca7 : a9 00 __ LDA #$00
05:aca9 : 65 57 __ ADC T3 + 1 
.l2126:
05:acab : 2c 00 d6 BIT $d600 
05:acae : 10 fb __ BPL $acab ; (chareditor.l2126 + 0)
.s19:
05:acb0 : 8d 01 d6 STA $d601 
05:acb3 : a9 13 __ LDA #$13
05:acb5 : 8d 00 d6 STA $d600 
.l2128:
05:acb8 : 2c 00 d6 BIT $d600 
05:acbb : 10 fb __ BPL $acb8 ; (chareditor.l2128 + 0)
.s24:
05:acbd : 8e 01 d6 STX $d601 
05:acc0 : a9 1f __ LDA #$1f
05:acc2 : 8d 00 d6 STA $d600 
.l2130:
05:acc5 : 2c 00 d6 BIT $d600 
05:acc8 : 10 fb __ BPL $acc5 ; (chareditor.l2130 + 0)
.s28:
05:acca : ad 01 d6 LDA $d601 
05:accd : 99 c7 ab STA $abc7,y ; (buff + 34)
05:acd0 : 99 b7 ab STA $abb7,y ; (projbuffer + 31)
05:acd3 : c8 __ __ INY
05:acd4 : c0 08 __ CPY #$08
05:acd6 : 90 c5 __ BCC $ac9d ; (chareditor.l1253 + 0)
.s12:
05:acd8 : 20 f3 4a JSR $4af3 ; (hidecursor.s0 + 0)
05:acdb : a5 53 __ LDA T0 + 0 
05:acdd : 8d f6 ab STA $abf6 ; (sstack + 3)
05:ace0 : 20 39 b7 JSR $b739 ; (showchareditfield.s0 + 0)
05:ace3 : a5 53 __ LDA T0 + 0 
05:ace5 : 8d fa ab STA $abfa ; (sstack + 7)
05:ace8 : a5 55 __ LDA T2 + 0 
05:acea : 8d f8 ab STA $abf8 ; (sstack + 5)
05:aced : a9 00 __ LDA #$00
05:acef : 8d f9 ab STA $abf9 ; (sstack + 6)
05:acf2 : 20 61 b7 JSR $b761 ; (showchareditgrid.s1000 + 0)
.l31:
05:acf5 : 18 __ __ CLC
05:acf6 : a5 5c __ LDA T7 + 0 
05:acf8 : 69 47 __ ADC #$47
05:acfa : 85 5b __ STA T6 + 0 
05:acfc : 85 0d __ STA P0 
05:acfe : 18 __ __ CLC
05:acff : a5 5d __ LDA T8 + 0 
05:ad01 : 69 03 __ ADC #$03
05:ad03 : 85 62 __ STA T14 + 0 
05:ad05 : 85 0e __ STA P1 
05:ad07 : 38 __ __ SEC
05:ad08 : a9 07 __ LDA #$07
05:ad0a : e5 5c __ SBC T7 + 0 
05:ad0c : aa __ __ TAX
05:ad0d : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:ad10 : 85 59 __ STA T5 + 0 
05:ad12 : a6 5d __ LDX T8 + 0 
05:ad14 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:ad17 : 85 63 __ STA T16 + 0 
05:ad19 : 25 59 __ AND T5 + 0 
05:ad1b : f0 08 __ BEQ $ad25 ; (chareditor.s1016 + 0)
.s1015:
05:ad1d : a9 00 __ LDA #$00
05:ad1f : 85 64 __ STA T17 + 0 
05:ad21 : a9 2a __ LDA #$2a
05:ad23 : d0 06 __ BNE $ad2b ; (chareditor.s1251 + 0)
.s1016:
05:ad25 : a9 80 __ LDA #$80
05:ad27 : 85 64 __ STA T17 + 0 
05:ad29 : a9 aa __ LDA #$aa
.s1251:
05:ad2b : 85 0f __ STA P2 
05:ad2d : ad 96 87 LDA $8796 ; (vdc_state + 7)
05:ad30 : 49 10 __ EOR #$10
05:ad32 : 85 10 __ STA P3 
05:ad34 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
05:ad37 : ad fe 86 LDA $86fe ; (showbar + 0)
05:ad3a : f0 03 __ BEQ $ad3f ; (chareditor.s35 + 0)
.s33:
05:ad3c : 20 7e 3f JSR $3f7e ; (printstatusbar.s1000 + 0)
.s35:
05:ad3f : 20 0b 3a JSR $3a0b ; (vdcwin_getch.s0 + 0)
05:ad42 : a5 1b __ LDA ACCU + 0 
05:ad44 : 85 65 __ STA T18 + 0 
05:ad46 : a5 5b __ LDA T6 + 0 
05:ad48 : 85 0d __ STA P0 
05:ad4a : a5 62 __ LDA T14 + 0 
05:ad4c : 85 0e __ STA P1 
05:ad4e : a5 64 __ LDA T17 + 0 
05:ad50 : 09 20 __ ORA #$20
05:ad52 : 85 0f __ STA P2 
05:ad54 : 20 ce 6d JSR $6dce ; (vdc_printc@proxy + 0)
05:ad57 : a5 65 __ LDA T18 + 0 
05:ad59 : c9 4f __ CMP #$4f
05:ad5b : d0 05 __ BNE $ad62 ; (chareditor.s421 + 0)
.s249:
05:ad5d : a2 00 __ LDX #$00
05:ad5f : 4c 2c b6 JMP $b62c ; (chareditor.l251 + 0)
.s421:
05:ad62 : b0 03 __ BCS $ad67 ; (chareditor.s422 + 0)
05:ad64 : 4c 31 b3 JMP $b331 ; (chareditor.s423 + 0)
.s422:
05:ad67 : c9 59 __ CMP #$59
05:ad69 : d0 07 __ BNE $ad72 ; (chareditor.s444 + 0)
.s185:
05:ad6b : a9 00 __ LDA #$00
05:ad6d : 85 53 __ STA T0 + 0 
05:ad6f : 4c 96 b2 JMP $b296 ; (chareditor.l187 + 0)
.s444:
05:ad72 : b0 03 __ BCS $ad77 ; (chareditor.s445 + 0)
05:ad74 : 4c f1 af JMP $aff1 ; (chareditor.s446 + 0)
.s445:
05:ad77 : c9 8c __ CMP #$8c
05:ad79 : d0 03 __ BNE $ad7e ; (chareditor.s454 + 0)
05:ad7b : 4c b6 af JMP $afb6 ; (chareditor.s405 + 0)
.s454:
05:ad7e : b0 03 __ BCS $ad83 ; (chareditor.s455 + 0)
05:ad80 : 4c 28 af JMP $af28 ; (chareditor.s456 + 0)
.s455:
05:ad83 : c9 91 __ CMP #$91
05:ad85 : d0 03 __ BNE $ad8a ; (chareditor.s459 + 0)
05:ad87 : 4c 1c af JMP $af1c ; (chareditor.s49 + 0)
.s459:
05:ad8a : c9 9d __ CMP #$9d
05:ad8c : d0 03 __ BNE $ad91 ; (chareditor.s411 + 0)
05:ad8e : 4c 10 af JMP $af10 ; (chareditor.s41 + 0)
.s411:
05:ad91 : c9 30 __ CMP #$30
05:ad93 : 90 19 __ BCC $adae ; (chareditor.s414 + 0)
.s415:
05:ad95 : c9 3a __ CMP #$3a
05:ad97 : b0 15 __ BCS $adae ; (chareditor.s414 + 0)
.s412:
05:ad99 : 0a __ __ ASL
05:ad9a : aa __ __ TAX
05:ad9b : a9 01 __ LDA #$01
05:ad9d : 85 5e __ STA T9 + 0 
05:ad9f : 85 5f __ STA T10 + 0 
05:ada1 : bd 8d 88 LDA $888d,x ; (multab + 141)
05:ada4 : 85 54 __ STA T1 + 0 
05:ada6 : bd 8c 88 LDA $888c,x ; (multab + 140)
05:ada9 : 85 58 __ STA T4 + 0 
05:adab : 4c b2 ad JMP $adb2 ; (chareditor.s419 + 0)
.s414:
05:adae : c9 21 __ CMP #$21
05:adb0 : 90 12 __ BCC $adc4 ; (chareditor.s36 + 0)
.s419:
05:adb2 : a5 65 __ LDA T18 + 0 
05:adb4 : c9 2b __ CMP #$2b
05:adb6 : b0 0c __ BCS $adc4 ; (chareditor.s36 + 0)
.s416:
05:adb8 : 0a __ __ ASL
05:adb9 : aa __ __ TAX
05:adba : a5 58 __ LDA T4 + 0 
05:adbc : 9d aa 88 STA $88aa,x ; (linebuffer + 26)
05:adbf : a5 54 __ LDA T1 + 0 
05:adc1 : 9d ab 88 STA $88ab,x ; (linebuffer + 27)
.s36:
05:adc4 : a5 5e __ LDA T9 + 0 
05:adc6 : f0 1e __ BEQ $ade6 ; (chareditor.s464 + 0)
.s465:
05:adc8 : a5 58 __ LDA T4 + 0 
05:adca : 85 0d __ STA P0 
05:adcc : a5 54 __ LDA T1 + 0 
05:adce : 85 0e __ STA P1 
05:add0 : a9 00 __ LDA #$00
05:add2 : 85 0f __ STA P2 
05:add4 : 20 da b6 JSR $b6da ; (charaddress.s0 + 0)
05:add7 : a5 1b __ LDA ACCU + 0 
05:add9 : 85 56 __ STA T3 + 0 
05:addb : a5 1c __ LDA ACCU + 1 
05:addd : 85 57 __ STA T3 + 1 
05:addf : a0 00 __ LDY #$00
05:ade1 : 84 5e __ STY T9 + 0 
05:ade3 : 4c cb ae JMP $aecb ; (chareditor.l1255 + 0)
.s464:
05:ade6 : a5 5f __ LDA T10 + 0 
05:ade8 : f0 64 __ BEQ $ae4e ; (chareditor.s463 + 0)
.s490:
05:adea : a9 7f __ LDA #$7f
05:adec : 85 11 __ STA P4 
05:adee : a9 00 __ LDA #$00
05:adf0 : 85 14 __ STA P7 
05:adf2 : 85 12 __ STA P5 
05:adf4 : a9 01 __ LDA #$01
05:adf6 : 85 15 __ STA P8 
05:adf8 : a5 54 __ LDA T1 + 0 
05:adfa : f0 0c __ BEQ $ae08 ; (chareditor.s493 + 0)
.s494:
05:adfc : 20 90 1a JSR $1a90 ; (bnk_redef_charset@proxy + 0)
05:adff : ad a0 87 LDA $87a0 ; (vdc_state + 17)
05:ae02 : ae 9f 87 LDX $879f ; (vdc_state + 16)
05:ae05 : 4c 1b ae JMP $ae1b ; (chareditor.s495 + 0)
.s493:
05:ae08 : ad 9f 87 LDA $879f ; (vdc_state + 16)
05:ae0b : 85 0f __ STA P2 
05:ae0d : ad a0 87 LDA $87a0 ; (vdc_state + 17)
05:ae10 : 85 10 __ STA P3 
05:ae12 : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
05:ae15 : ad a2 87 LDA $87a2 ; (vdc_state + 19)
05:ae18 : ae a1 87 LDX $87a1 ; (vdc_state + 18)
.s495:
05:ae1b : 86 0f __ STX P2 
05:ae1d : 85 10 __ STA P3 
05:ae1f : a9 00 __ LDA #$00
05:ae21 : 85 5f __ STA T10 + 0 
05:ae23 : 85 14 __ STA P7 
05:ae25 : 85 12 __ STA P5 
05:ae27 : 20 a1 1a JSR $1aa1 ; (bnk_redef_charset@proxy + 0)
05:ae2a : a9 01 __ LDA #$01
05:ae2c : a6 54 __ LDX T1 + 0 
05:ae2e : 9d e8 86 STA $86e8,x ; (charsetchanged + 0)
05:ae31 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
05:ae34 : a5 54 __ LDA T1 + 0 
05:ae36 : 8d f6 ab STA $abf6 ; (sstack + 3)
05:ae39 : 20 39 b7 JSR $b739 ; (showchareditfield.s0 + 0)
.s492:
05:ae3c : a5 54 __ LDA T1 + 0 
05:ae3e : 8d fa ab STA $abfa ; (sstack + 7)
05:ae41 : a5 58 __ LDA T4 + 0 
05:ae43 : 8d f8 ab STA $abf8 ; (sstack + 5)
05:ae46 : a9 00 __ LDA #$00
05:ae48 : 8d f9 ab STA $abf9 ; (sstack + 6)
05:ae4b : 20 61 b7 JSR $b761 ; (showchareditgrid.s1000 + 0)
.s463:
05:ae4e : a5 65 __ LDA T18 + 0 
05:ae50 : c9 1b __ CMP #$1b
05:ae52 : f0 07 __ BEQ $ae5b ; (chareditor.s32 + 0)
.s496:
05:ae54 : c9 03 __ CMP #$03
05:ae56 : f0 03 __ BEQ $ae5b ; (chareditor.s32 + 0)
05:ae58 : 4c f5 ac JMP $acf5 ; (chareditor.l31 + 0)
.s32:
05:ae5b : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
05:ae5e : a9 7f __ LDA #$7f
05:ae60 : 85 11 __ STA P4 
05:ae62 : a9 00 __ LDA #$00
05:ae64 : 85 14 __ STA P7 
05:ae66 : a9 01 __ LDA #$01
05:ae68 : 85 15 __ STA P8 
05:ae6a : a5 54 __ LDA T1 + 0 
05:ae6c : d0 0e __ BNE $ae7c ; (chareditor.s498 + 0)
.s497:
05:ae6e : ad a1 87 LDA $87a1 ; (vdc_state + 18)
05:ae71 : 85 0f __ STA P2 
05:ae73 : ad a2 87 LDA $87a2 ; (vdc_state + 19)
05:ae76 : 85 10 __ STA P3 
05:ae78 : a9 50 __ LDA #$50
05:ae7a : d0 0c __ BNE $ae88 ; (chareditor.s499 + 0)
.s498:
05:ae7c : ad 9f 87 LDA $879f ; (vdc_state + 16)
05:ae7f : 85 0f __ STA P2 
05:ae81 : ad a0 87 LDA $87a0 ; (vdc_state + 17)
05:ae84 : 85 10 __ STA P3 
05:ae86 : a9 48 __ LDA #$48
.s499:
05:ae88 : 85 13 __ STA P6 
05:ae8a : a9 00 __ LDA #$00
05:ae8c : 85 12 __ STA P5 
05:ae8e : 20 04 13 JSR $1304 ; (bnk_redef_charset.s0 + 0)
05:ae91 : a5 58 __ LDA T4 + 0 
05:ae93 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
05:ae96 : a5 54 __ LDA T1 + 0 
05:ae98 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
05:ae9b : ad eb 86 LDA $86eb ; (screen_col + 0)
05:ae9e : 8d b7 87 STA $87b7 ; (canvas + 15)
05:aea1 : ad ed 86 LDA $86ed ; (screen_row + 0)
05:aea4 : 8d b8 87 STA $87b8 ; (canvas + 16)
05:aea7 : 20 02 3e JSR $3e02 ; (plotcursor.s0 + 0)
05:aeaa : a2 ff __ LDX #$ff
.l1004:
05:aeac : e8 __ __ INX
05:aead : bd d4 b8 LDA $b8d4,x 
05:aeb0 : 9d e1 88 STA $88e1,x ; (programmode + 0)
05:aeb3 : d0 f7 __ BNE $aeac ; (chareditor.l1004 + 0)
.s1001:
05:aeb5 : 18 __ __ CLC
05:aeb6 : a5 23 __ LDA SP + 0 
05:aeb8 : 69 08 __ ADC #$08
05:aeba : 85 23 __ STA SP + 0 
05:aebc : 90 02 __ BCC $aec0 ; (chareditor.s1001 + 11)
05:aebe : e6 24 __ INC SP + 1 
05:aec0 : a2 12 __ LDX #$12
05:aec2 : bd 93 ab LDA $ab93,x ; (tempfilename + 16)
05:aec5 : 95 53 __ STA T0 + 0,x 
05:aec7 : ca __ __ DEX
05:aec8 : 10 f8 __ BPL $aec2 ; (chareditor.s1001 + 13)
05:aeca : 60 __ __ RTS
.l1255:
05:aecb : a9 12 __ LDA #$12
05:aecd : 8d 00 d6 STA $d600 
05:aed0 : 98 __ __ TYA
05:aed1 : 18 __ __ CLC
05:aed2 : 65 56 __ ADC T3 + 0 
05:aed4 : aa __ __ TAX
05:aed5 : a9 00 __ LDA #$00
05:aed7 : 65 57 __ ADC T3 + 1 
.l2147:
05:aed9 : 2c 00 d6 BIT $d600 
05:aedc : 10 fb __ BPL $aed9 ; (chareditor.l2147 + 0)
.s478:
05:aede : 8d 01 d6 STA $d601 
05:aee1 : a9 13 __ LDA #$13
05:aee3 : 8d 00 d6 STA $d600 
.l2149:
05:aee6 : 2c 00 d6 BIT $d600 
05:aee9 : 10 fb __ BPL $aee6 ; (chareditor.l2149 + 0)
.s483:
05:aeeb : 8e 01 d6 STX $d601 
05:aeee : a9 1f __ LDA #$1f
05:aef0 : 8d 00 d6 STA $d600 
.l2151:
05:aef3 : 2c 00 d6 BIT $d600 
05:aef6 : 10 fb __ BPL $aef3 ; (chareditor.l2151 + 0)
.s487:
05:aef8 : ad 01 d6 LDA $d601 
05:aefb : 99 c7 ab STA $abc7,y ; (buff + 34)
05:aefe : 99 b7 ab STA $abb7,y ; (projbuffer + 31)
05:af01 : c8 __ __ INY
05:af02 : c0 08 __ CPY #$08
05:af04 : 90 c5 __ BCC $aecb ; (chareditor.l1255 + 0)
.s467:
05:af06 : a5 5f __ LDA T10 + 0 
05:af08 : d0 03 __ BNE $af0d ; (chareditor.s467 + 7)
05:af0a : 4c 3c ae JMP $ae3c ; (chareditor.s492 + 0)
05:af0d : 4c ea ad JMP $adea ; (chareditor.s490 + 0)
.s41:
05:af10 : a5 5c __ LDA T7 + 0 
05:af12 : d0 03 __ BNE $af17 ; (chareditor.s42 + 0)
05:af14 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s42:
05:af17 : c6 5c __ DEC T7 + 0 
05:af19 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s49:
05:af1c : a5 5d __ LDA T8 + 0 
05:af1e : d0 03 __ BNE $af23 ; (chareditor.s50 + 0)
05:af20 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s50:
05:af23 : c6 5d __ DEC T8 + 0 
05:af25 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s456:
05:af28 : c9 5a __ CMP #$5a
05:af2a : f0 2a __ BEQ $af56 ; (chareditor.s116 + 0)
.s457:
05:af2c : c9 8b __ CMP #$8b
05:af2e : f0 03 __ BEQ $af33 ; (chareditor.s404 + 0)
05:af30 : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s404:
05:af33 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
05:af36 : 20 27 50 JSR $5027 ; (togglestatusbar.s0 + 0)
.s2281:
05:af39 : a5 54 __ LDA T1 + 0 
05:af3b : 8d f6 ab STA $abf6 ; (sstack + 3)
05:af3e : 20 39 b7 JSR $b739 ; (showchareditfield.s0 + 0)
.s2280:
05:af41 : a5 58 __ LDA T4 + 0 
.s2278:
05:af43 : 8d f8 ab STA $abf8 ; (sstack + 5)
05:af46 : a9 00 __ LDA #$00
05:af48 : 8d f9 ab STA $abf9 ; (sstack + 6)
05:af4b : a5 54 __ LDA T1 + 0 
05:af4d : 8d fa ab STA $abfa ; (sstack + 7)
05:af50 : 20 61 b7 JSR $b761 ; (showchareditgrid.s1000 + 0)
05:af53 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s116:
05:af56 : a2 00 __ LDX #$00
.l118:
05:af58 : 86 53 __ STX T0 + 0 
05:af5a : bd b7 ab LDA $abb7,x ; (projbuffer + 31)
05:af5d : 9d c7 ab STA $abc7,x ; (buff + 34)
05:af60 : a8 __ __ TAY
05:af61 : a9 12 __ LDA #$12
05:af63 : 8d 00 d6 STA $d600 
05:af66 : 18 __ __ CLC
05:af67 : a5 56 __ LDA T3 + 0 
05:af69 : 65 53 __ ADC T0 + 0 
05:af6b : aa __ __ TAX
05:af6c : a5 57 __ LDA T3 + 1 
05:af6e : 69 00 __ ADC #$00
.l2269:
05:af70 : 2c 00 d6 BIT $d600 
05:af73 : 10 fb __ BPL $af70 ; (chareditor.l2269 + 0)
.s127:
05:af75 : 8d 01 d6 STA $d601 
05:af78 : a9 13 __ LDA #$13
05:af7a : 8d 00 d6 STA $d600 
.l2271:
05:af7d : 2c 00 d6 BIT $d600 
05:af80 : 10 fb __ BPL $af7d ; (chareditor.l2271 + 0)
.s132:
05:af82 : 8e 01 d6 STX $d601 
05:af85 : a9 1f __ LDA #$1f
05:af87 : 8d 00 d6 STA $d600 
.l2273:
05:af8a : 2c 00 d6 BIT $d600 
05:af8d : 10 fb __ BPL $af8a ; (chareditor.l2273 + 0)
.s136:
05:af8f : 8c 01 d6 STY $d601 
05:af92 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:af95 : a6 53 __ LDX T0 + 0 
05:af97 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:af9a : 85 0f __ STA P2 
05:af9c : 18 __ __ CLC
05:af9d : a5 1b __ LDA ACCU + 0 
05:af9f : 65 53 __ ADC T0 + 0 
05:afa1 : 85 0d __ STA P0 
05:afa3 : a5 1c __ LDA ACCU + 1 
05:afa5 : 69 00 __ ADC #$00
05:afa7 : 85 0e __ STA P1 
05:afa9 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:afac : a6 53 __ LDX T0 + 0 
05:afae : e8 __ __ INX
05:afaf : e0 08 __ CPX #$08
05:afb1 : 90 a5 __ BCC $af58 ; (chareditor.l118 + 0)
05:afb3 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s405:
05:afb6 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
05:afb9 : a9 02 __ LDA #$02
05:afbb : 8d f8 ab STA $abf8 ; (sstack + 5)
05:afbe : 20 4b 50 JSR $504b ; (helpscreen_load.s1000 + 0)
05:afc1 : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
05:afc4 : f0 03 __ BEQ $afc9 ; (chareditor.s409 + 0)
05:afc6 : 4c 39 af JMP $af39 ; (chareditor.s2281 + 0)
.s409:
05:afc9 : ad e9 86 LDA $86e9 ; (charsetchanged + 1)
05:afcc : c9 01 __ CMP #$01
05:afce : f0 03 __ BEQ $afd3 ; (chareditor.s406 + 0)
05:afd0 : 4c 39 af JMP $af39 ; (chareditor.s2281 + 0)
.s406:
05:afd3 : a9 7f __ LDA #$7f
05:afd5 : 85 11 __ STA P4 
05:afd7 : a9 01 __ LDA #$01
05:afd9 : 85 15 __ STA P8 
05:afdb : ad a1 87 LDA $87a1 ; (vdc_state + 18)
05:afde : 85 0f __ STA P2 
05:afe0 : ad a2 87 LDA $87a2 ; (vdc_state + 19)
05:afe3 : 85 10 __ STA P3 
05:afe5 : a9 00 __ LDA #$00
05:afe7 : 85 14 __ STA P7 
05:afe9 : 85 12 __ STA P5 
05:afeb : 20 ac 1a JSR $1aac ; (bnk_redef_charset@proxy + 0)
05:afee : 4c 39 af JMP $af39 ; (chareditor.s2281 + 0)
.s446:
05:aff1 : c9 55 __ CMP #$55
05:aff3 : d0 03 __ BNE $aff8 ; (chareditor.s447 + 0)
05:aff5 : 4c 15 b2 JMP $b215 ; (chareditor.s281 + 0)
.s447:
05:aff8 : b0 03 __ BCS $affd ; (chareditor.s448 + 0)
05:affa : 4c fa b0 JMP $b0fa ; (chareditor.s449 + 0)
.s448:
05:affd : c9 56 __ CMP #$56
05:afff : d0 03 __ BNE $b004 ; (chareditor.s452 + 0)
05:b001 : 4c 9a b0 JMP $b09a ; (chareditor.s163 + 0)
.s452:
05:b004 : c9 58 __ CMP #$58
05:b006 : f0 03 __ BEQ $b00b ; (chareditor.s228 + 0)
05:b008 : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s228:
05:b00b : a2 00 __ LDX #$00
.l230:
05:b00d : 86 53 __ STX T0 + 0 
05:b00f : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b012 : 29 f0 __ AND #$f0
05:b014 : 4a __ __ LSR
05:b015 : 4a __ __ LSR
05:b016 : 4a __ __ LSR
05:b017 : 4a __ __ LSR
05:b018 : 85 62 __ STA T14 + 0 
05:b01a : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b01d : 29 0f __ AND #$0f
05:b01f : 0a __ __ ASL
05:b020 : 0a __ __ ASL
05:b021 : 0a __ __ ASL
05:b022 : 0a __ __ ASL
05:b023 : 05 62 __ ORA T14 + 0 
05:b025 : a8 __ __ TAY
05:b026 : 29 cc __ AND #$cc
05:b028 : 4a __ __ LSR
05:b029 : 4a __ __ LSR
05:b02a : 85 62 __ STA T14 + 0 
05:b02c : 98 __ __ TYA
05:b02d : 29 33 __ AND #$33
05:b02f : 0a __ __ ASL
05:b030 : 0a __ __ ASL
05:b031 : 05 62 __ ORA T14 + 0 
05:b033 : a8 __ __ TAY
05:b034 : 29 aa __ AND #$aa
05:b036 : 4a __ __ LSR
05:b037 : 85 62 __ STA T14 + 0 
05:b039 : 98 __ __ TYA
05:b03a : 29 55 __ AND #$55
05:b03c : 0a __ __ ASL
05:b03d : 05 62 __ ORA T14 + 0 
05:b03f : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b042 : a8 __ __ TAY
05:b043 : a9 12 __ LDA #$12
05:b045 : 8d 00 d6 STA $d600 
05:b048 : a5 56 __ LDA T3 + 0 
05:b04a : 65 53 __ ADC T0 + 0 
05:b04c : aa __ __ TAX
05:b04d : a5 57 __ LDA T3 + 1 
05:b04f : 69 00 __ ADC #$00
.l2258:
05:b051 : 2c 00 d6 BIT $d600 
05:b054 : 10 fb __ BPL $b051 ; (chareditor.l2258 + 0)
.s239:
05:b056 : 8d 01 d6 STA $d601 
05:b059 : a9 13 __ LDA #$13
05:b05b : 8d 00 d6 STA $d600 
.l2260:
05:b05e : 2c 00 d6 BIT $d600 
05:b061 : 10 fb __ BPL $b05e ; (chareditor.l2260 + 0)
.s244:
05:b063 : 8e 01 d6 STX $d601 
05:b066 : a9 1f __ LDA #$1f
05:b068 : 8d 00 d6 STA $d600 
.l2262:
05:b06b : 2c 00 d6 BIT $d600 
05:b06e : 10 fb __ BPL $b06b ; (chareditor.l2262 + 0)
.s248:
05:b070 : 8c 01 d6 STY $d601 
05:b073 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b076 : a6 53 __ LDX T0 + 0 
05:b078 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b07b : 85 0f __ STA P2 
05:b07d : 18 __ __ CLC
05:b07e : a5 1b __ LDA ACCU + 0 
05:b080 : 65 53 __ ADC T0 + 0 
05:b082 : 85 0d __ STA P0 
05:b084 : a5 1c __ LDA ACCU + 1 
05:b086 : 69 00 __ ADC #$00
05:b088 : 85 0e __ STA P1 
05:b08a : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b08d : a6 53 __ LDX T0 + 0 
05:b08f : e8 __ __ INX
05:b090 : e0 08 __ CPX #$08
05:b092 : b0 03 __ BCS $b097 ; (chareditor.s248 + 39)
05:b094 : 4c 0d b0 JMP $b00d ; (chareditor.l230 + 0)
05:b097 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s163:
05:b09a : a2 00 __ LDX #$00
.l165:
05:b09c : 86 53 __ STX T0 + 0 
05:b09e : bd bf ab LDA $abbf,x ; (projbuffer + 39)
05:b0a1 : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b0a4 : a8 __ __ TAY
05:b0a5 : a9 12 __ LDA #$12
05:b0a7 : 8d 00 d6 STA $d600 
05:b0aa : 18 __ __ CLC
05:b0ab : a5 56 __ LDA T3 + 0 
05:b0ad : 65 53 __ ADC T0 + 0 
05:b0af : aa __ __ TAX
05:b0b0 : a5 57 __ LDA T3 + 1 
05:b0b2 : 69 00 __ ADC #$00
.l2250:
05:b0b4 : 2c 00 d6 BIT $d600 
05:b0b7 : 10 fb __ BPL $b0b4 ; (chareditor.l2250 + 0)
.s174:
05:b0b9 : 8d 01 d6 STA $d601 
05:b0bc : a9 13 __ LDA #$13
05:b0be : 8d 00 d6 STA $d600 
.l2252:
05:b0c1 : 2c 00 d6 BIT $d600 
05:b0c4 : 10 fb __ BPL $b0c1 ; (chareditor.l2252 + 0)
.s179:
05:b0c6 : 8e 01 d6 STX $d601 
05:b0c9 : a9 1f __ LDA #$1f
05:b0cb : 8d 00 d6 STA $d600 
.l2254:
05:b0ce : 2c 00 d6 BIT $d600 
05:b0d1 : 10 fb __ BPL $b0ce ; (chareditor.l2254 + 0)
.s183:
05:b0d3 : 8c 01 d6 STY $d601 
05:b0d6 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b0d9 : a6 53 __ LDX T0 + 0 
05:b0db : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b0de : 85 0f __ STA P2 
05:b0e0 : 18 __ __ CLC
05:b0e1 : a5 1b __ LDA ACCU + 0 
05:b0e3 : 65 53 __ ADC T0 + 0 
05:b0e5 : 85 0d __ STA P0 
05:b0e7 : a5 1c __ LDA ACCU + 1 
05:b0e9 : 69 00 __ ADC #$00
05:b0eb : 85 0e __ STA P1 
05:b0ed : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b0f0 : a6 53 __ LDX T0 + 0 
05:b0f2 : e8 __ __ INX
05:b0f3 : e0 08 __ CPX #$08
05:b0f5 : 90 a5 __ BCC $b09c ; (chareditor.l165 + 0)
05:b0f7 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s449:
05:b0fa : c9 52 __ CMP #$52
05:b0fc : d0 03 __ BNE $b101 ; (chareditor.s450 + 0)
05:b0fe : 4c 9a b1 JMP $b19a ; (chareditor.s331 + 0)
.s450:
05:b101 : c9 53 __ CMP #$53
05:b103 : f0 03 __ BEQ $b108 ; (chareditor.s137 + 0)
05:b105 : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s137:
05:b108 : a5 54 __ LDA T1 + 0 
05:b10a : f0 04 __ BEQ $b110 ; (chareditor.s1273 + 0)
.s1274:
05:b10c : a9 d8 __ LDA #$d8
05:b10e : d0 02 __ BNE $b112 ; (chareditor.s1275 + 0)
.s1273:
05:b110 : a9 d0 __ LDA #$d0
.s1275:
05:b112 : 85 5a __ STA T5 + 1 
05:b114 : a5 58 __ LDA T4 + 0 
05:b116 : 85 5b __ STA T6 + 0 
05:b118 : 0a __ __ ASL
05:b119 : 85 60 __ STA T12 + 0 
05:b11b : a9 00 __ LDA #$00
05:b11d : 85 53 __ STA T0 + 0 
05:b11f : 2a __ __ ROL
05:b120 : 06 60 __ ASL T12 + 0 
05:b122 : 2a __ __ ROL
05:b123 : 06 60 __ ASL T12 + 0 
05:b125 : 2a __ __ ROL
05:b126 : 85 61 __ STA T12 + 1 
.l139:
05:b128 : a9 01 __ LDA #$01
05:b12a : 85 0d __ STA P0 
05:b12c : 18 __ __ CLC
05:b12d : a5 53 __ LDA T0 + 0 
05:b12f : 65 60 __ ADC T12 + 0 
05:b131 : 85 0e __ STA P1 
05:b133 : a5 5a __ LDA T5 + 1 
05:b135 : 65 61 __ ADC T12 + 1 
05:b137 : 85 0f __ STA P2 
05:b139 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
05:b13c : a6 53 __ LDX T0 + 0 
05:b13e : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b141 : a2 12 __ LDX #$12
05:b143 : 8e 00 d6 STX $d600 
05:b146 : aa __ __ TAX
05:b147 : 18 __ __ CLC
05:b148 : a5 56 __ LDA T3 + 0 
05:b14a : 65 53 __ ADC T0 + 0 
05:b14c : a8 __ __ TAY
05:b14d : a5 57 __ LDA T3 + 1 
05:b14f : 69 00 __ ADC #$00
.l2242:
05:b151 : 2c 00 d6 BIT $d600 
05:b154 : 10 fb __ BPL $b151 ; (chareditor.l2242 + 0)
.s148:
05:b156 : 8d 01 d6 STA $d601 
05:b159 : a9 13 __ LDA #$13
05:b15b : 8d 00 d6 STA $d600 
.l2244:
05:b15e : 2c 00 d6 BIT $d600 
05:b161 : 10 fb __ BPL $b15e ; (chareditor.l2244 + 0)
.s153:
05:b163 : 8c 01 d6 STY $d601 
05:b166 : a9 1f __ LDA #$1f
05:b168 : 8d 00 d6 STA $d600 
.l2246:
05:b16b : 2c 00 d6 BIT $d600 
05:b16e : 10 fb __ BPL $b16b ; (chareditor.l2246 + 0)
.s157:
05:b170 : 8e 01 d6 STX $d601 
05:b173 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b176 : a6 53 __ LDX T0 + 0 
05:b178 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b17b : 85 0f __ STA P2 
05:b17d : 18 __ __ CLC
05:b17e : a5 1b __ LDA ACCU + 0 
05:b180 : 65 53 __ ADC T0 + 0 
05:b182 : 85 0d __ STA P0 
05:b184 : a5 1c __ LDA ACCU + 1 
05:b186 : 69 00 __ ADC #$00
05:b188 : 85 0e __ STA P1 
05:b18a : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b18d : e6 53 __ INC T0 + 0 
05:b18f : a5 53 __ LDA T0 + 0 
05:b191 : c9 08 __ CMP #$08
05:b193 : 90 93 __ BCC $b128 ; (chareditor.l139 + 0)
.s141:
05:b195 : a5 5b __ LDA T6 + 0 
05:b197 : 4c 43 af JMP $af43 ; (chareditor.s2278 + 0)
.s331:
05:b19a : a0 00 __ LDY #$00
.l333:
05:b19c : b9 c7 ab LDA $abc7,y ; (buff + 34)
05:b19f : 4a __ __ LSR
05:b1a0 : 99 af ab STA $abaf,y ; (projbuffer + 23)
05:b1a3 : aa __ __ TAX
05:b1a4 : b9 c7 ab LDA $abc7,y ; (buff + 34)
05:b1a7 : 4a __ __ LSR
05:b1a8 : 90 06 __ BCC $b1b0 ; (chareditor.s1535 + 0)
.s336:
05:b1aa : 8a __ __ TXA
05:b1ab : 09 80 __ ORA #$80
05:b1ad : 99 af ab STA $abaf,y ; (projbuffer + 23)
.s1535:
05:b1b0 : c8 __ __ INY
05:b1b1 : c0 08 __ CPY #$08
05:b1b3 : 90 e7 __ BCC $b19c ; (chareditor.l333 + 0)
.s335:
05:b1b5 : a2 00 __ LDX #$00
.l340:
05:b1b7 : 86 53 __ STX T0 + 0 
05:b1b9 : bd af ab LDA $abaf,x ; (projbuffer + 23)
05:b1bc : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b1bf : a8 __ __ TAY
05:b1c0 : a9 12 __ LDA #$12
05:b1c2 : 8d 00 d6 STA $d600 
05:b1c5 : 18 __ __ CLC
05:b1c6 : a5 56 __ LDA T3 + 0 
05:b1c8 : 65 53 __ ADC T0 + 0 
05:b1ca : aa __ __ TAX
05:b1cb : a5 57 __ LDA T3 + 1 
05:b1cd : 69 00 __ ADC #$00
.l2234:
05:b1cf : 2c 00 d6 BIT $d600 
05:b1d2 : 10 fb __ BPL $b1cf ; (chareditor.l2234 + 0)
.s349:
05:b1d4 : 8d 01 d6 STA $d601 
05:b1d7 : a9 13 __ LDA #$13
05:b1d9 : 8d 00 d6 STA $d600 
.l2236:
05:b1dc : 2c 00 d6 BIT $d600 
05:b1df : 10 fb __ BPL $b1dc ; (chareditor.l2236 + 0)
.s354:
05:b1e1 : 8e 01 d6 STX $d601 
05:b1e4 : a9 1f __ LDA #$1f
05:b1e6 : 8d 00 d6 STA $d600 
.l2238:
05:b1e9 : 2c 00 d6 BIT $d600 
05:b1ec : 10 fb __ BPL $b1e9 ; (chareditor.l2238 + 0)
.s358:
05:b1ee : 8c 01 d6 STY $d601 
05:b1f1 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b1f4 : a6 53 __ LDX T0 + 0 
05:b1f6 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b1f9 : 85 0f __ STA P2 
05:b1fb : 18 __ __ CLC
05:b1fc : a5 1b __ LDA ACCU + 0 
05:b1fe : 65 53 __ ADC T0 + 0 
05:b200 : 85 0d __ STA P0 
05:b202 : a5 1c __ LDA ACCU + 1 
05:b204 : 69 00 __ ADC #$00
05:b206 : 85 0e __ STA P1 
05:b208 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b20b : a6 53 __ LDX T0 + 0 
05:b20d : e8 __ __ INX
05:b20e : e0 08 __ CPX #$08
05:b210 : 90 a5 __ BCC $b1b7 ; (chareditor.l340 + 0)
05:b212 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s281:
05:b215 : a9 01 __ LDA #$01
05:b217 : 85 53 __ STA T0 + 0 
.l1247:
05:b219 : 38 __ __ SEC
05:b21a : e9 01 __ SBC #$01
05:b21c : 85 59 __ STA T5 + 0 
05:b21e : a6 53 __ LDX T0 + 0 
05:b220 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b223 : a6 59 __ LDX T5 + 0 
05:b225 : 9d af ab STA $abaf,x ; (projbuffer + 23)
05:b228 : e6 53 __ INC T0 + 0 
05:b22a : a5 53 __ LDA T0 + 0 
05:b22c : c9 08 __ CMP #$08
05:b22e : 90 e9 __ BCC $b219 ; (chareditor.l1247 + 0)
.s285:
05:b230 : ad c7 ab LDA $abc7 ; (buff + 34)
05:b233 : 8d b6 ab STA $abb6 ; (projbuffer + 30)
05:b236 : a2 00 __ LDX #$00
.l287:
05:b238 : 86 53 __ STX T0 + 0 
05:b23a : bd af ab LDA $abaf,x ; (projbuffer + 23)
05:b23d : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b240 : a8 __ __ TAY
05:b241 : a9 12 __ LDA #$12
05:b243 : 8d 00 d6 STA $d600 
05:b246 : 18 __ __ CLC
05:b247 : a5 56 __ LDA T3 + 0 
05:b249 : 65 53 __ ADC T0 + 0 
05:b24b : aa __ __ TAX
05:b24c : a5 57 __ LDA T3 + 1 
05:b24e : 69 00 __ ADC #$00
.l2224:
05:b250 : 2c 00 d6 BIT $d600 
05:b253 : 10 fb __ BPL $b250 ; (chareditor.l2224 + 0)
.s296:
05:b255 : 8d 01 d6 STA $d601 
05:b258 : a9 13 __ LDA #$13
05:b25a : 8d 00 d6 STA $d600 
.l2226:
05:b25d : 2c 00 d6 BIT $d600 
05:b260 : 10 fb __ BPL $b25d ; (chareditor.l2226 + 0)
.s301:
05:b262 : 8e 01 d6 STX $d601 
05:b265 : a9 1f __ LDA #$1f
05:b267 : 8d 00 d6 STA $d600 
.l2228:
05:b26a : 2c 00 d6 BIT $d600 
05:b26d : 10 fb __ BPL $b26a ; (chareditor.l2228 + 0)
.s305:
05:b26f : 8c 01 d6 STY $d601 
05:b272 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b275 : a6 53 __ LDX T0 + 0 
05:b277 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b27a : 85 0f __ STA P2 
05:b27c : 18 __ __ CLC
05:b27d : a5 1b __ LDA ACCU + 0 
05:b27f : 65 53 __ ADC T0 + 0 
05:b281 : 85 0d __ STA P0 
05:b283 : a5 1c __ LDA ACCU + 1 
05:b285 : 69 00 __ ADC #$00
05:b287 : 85 0e __ STA P1 
05:b289 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b28c : a6 53 __ LDX T0 + 0 
05:b28e : e8 __ __ INX
05:b28f : e0 08 __ CPX #$08
05:b291 : 90 a5 __ BCC $b238 ; (chareditor.l287 + 0)
05:b293 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.l187:
05:b296 : 38 __ __ SEC
05:b297 : a9 07 __ LDA #$07
05:b299 : e5 53 __ SBC T0 + 0 
05:b29b : 85 5b __ STA T6 + 0 
05:b29d : a8 __ __ TAY
05:b29e : a9 12 __ LDA #$12
05:b2a0 : 8d 00 d6 STA $d600 
05:b2a3 : 18 __ __ CLC
05:b2a4 : a5 56 __ LDA T3 + 0 
05:b2a6 : 65 53 __ ADC T0 + 0 
05:b2a8 : be c7 ab LDX $abc7,y ; (buff + 34)
05:b2ab : a8 __ __ TAY
05:b2ac : a5 57 __ LDA T3 + 1 
05:b2ae : 69 00 __ ADC #$00
.l2208:
05:b2b0 : 2c 00 d6 BIT $d600 
05:b2b3 : 10 fb __ BPL $b2b0 ; (chareditor.l2208 + 0)
.s196:
05:b2b5 : 8d 01 d6 STA $d601 
05:b2b8 : a9 13 __ LDA #$13
05:b2ba : 8d 00 d6 STA $d600 
.l2210:
05:b2bd : 2c 00 d6 BIT $d600 
05:b2c0 : 10 fb __ BPL $b2bd ; (chareditor.l2210 + 0)
.s201:
05:b2c2 : 8c 01 d6 STY $d601 
05:b2c5 : a9 1f __ LDA #$1f
05:b2c7 : 8d 00 d6 STA $d600 
.l2212:
05:b2ca : 2c 00 d6 BIT $d600 
05:b2cd : 10 fb __ BPL $b2ca ; (chareditor.l2212 + 0)
.s205:
05:b2cf : 8e 01 d6 STX $d601 
05:b2d2 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b2d5 : a6 5b __ LDX T6 + 0 
05:b2d7 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b2da : 85 0f __ STA P2 
05:b2dc : 18 __ __ CLC
05:b2dd : a5 1b __ LDA ACCU + 0 
05:b2df : 65 53 __ ADC T0 + 0 
05:b2e1 : 85 0d __ STA P0 
05:b2e3 : a5 1c __ LDA ACCU + 1 
05:b2e5 : 69 00 __ ADC #$00
05:b2e7 : 85 0e __ STA P1 
05:b2e9 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b2ec : e6 53 __ INC T0 + 0 
05:b2ee : a5 53 __ LDA T0 + 0 
05:b2f0 : c9 08 __ CMP #$08
05:b2f2 : 90 a2 __ BCC $b296 ; (chareditor.l187 + 0)
.s207:
05:b2f4 : a0 00 __ LDY #$00
.l1257:
05:b2f6 : a9 12 __ LDA #$12
05:b2f8 : 8d 00 d6 STA $d600 
05:b2fb : 98 __ __ TYA
05:b2fc : 18 __ __ CLC
05:b2fd : 65 56 __ ADC T3 + 0 
05:b2ff : aa __ __ TAX
05:b300 : a9 00 __ LDA #$00
05:b302 : 65 57 __ ADC T3 + 1 
.l2215:
05:b304 : 2c 00 d6 BIT $d600 
05:b307 : 10 fb __ BPL $b304 ; (chareditor.l2215 + 0)
.s216:
05:b309 : 8d 01 d6 STA $d601 
05:b30c : a9 13 __ LDA #$13
05:b30e : 8d 00 d6 STA $d600 
.l2217:
05:b311 : 2c 00 d6 BIT $d600 
05:b314 : 10 fb __ BPL $b311 ; (chareditor.l2217 + 0)
.s221:
05:b316 : 8e 01 d6 STX $d601 
05:b319 : a9 1f __ LDA #$1f
05:b31b : 8d 00 d6 STA $d600 
.l2219:
05:b31e : 2c 00 d6 BIT $d600 
05:b321 : 10 fb __ BPL $b31e ; (chareditor.l2219 + 0)
.s225:
05:b323 : ad 01 d6 LDA $d601 
05:b326 : 99 c7 ab STA $abc7,y ; (buff + 34)
05:b329 : c8 __ __ INY
05:b32a : c0 08 __ CPY #$08
05:b32c : 90 c8 __ BCC $b2f6 ; (chareditor.l1257 + 0)
05:b32e : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s423:
05:b331 : c9 41 __ CMP #$41
05:b333 : d0 0e __ BNE $b343 ; (chareditor.s424 + 0)
.s184:
05:b335 : a9 00 __ LDA #$00
05:b337 : c5 54 __ CMP T1 + 0 
05:b339 : 2a __ __ ROL
05:b33a : 85 54 __ STA T1 + 0 
05:b33c : a9 01 __ LDA #$01
05:b33e : 85 5f __ STA T10 + 0 
05:b340 : 4c c8 ad JMP $adc8 ; (chareditor.s465 + 0)
.s424:
05:b343 : b0 03 __ BCS $b348 ; (chareditor.s425 + 0)
05:b345 : 4c 75 b5 JMP $b575 ; (chareditor.s426 + 0)
.s425:
05:b348 : c9 48 __ CMP #$48
05:b34a : d0 59 __ BNE $b3a5 ; (chareditor.s437 + 0)
.s387:
05:b34c : a5 63 __ LDA T16 + 0 
05:b34e : a0 06 __ LDY #$06
05:b350 : 91 23 __ STA (SP + 0),y 
05:b352 : a9 00 __ LDA #$00
05:b354 : c8 __ __ INY
05:b355 : 91 23 __ STA (SP + 0),y 
05:b357 : a9 00 __ LDA #$00
05:b359 : a0 02 __ LDY #$02
05:b35b : 91 23 __ STA (SP + 0),y 
05:b35d : a9 89 __ LDA #$89
05:b35f : c8 __ __ INY
05:b360 : 91 23 __ STA (SP + 0),y 
05:b362 : a9 d0 __ LDA #$d0
05:b364 : c8 __ __ INY
05:b365 : 91 23 __ STA (SP + 0),y 
05:b367 : a9 b8 __ LDA #$b8
05:b369 : c8 __ __ INY
05:b36a : 91 23 __ STA (SP + 0),y 
05:b36c : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
05:b36f : a9 44 __ LDA #$44
05:b371 : 85 16 __ STA P9 
05:b373 : a5 62 __ LDA T14 + 0 
05:b375 : 85 17 __ STA P10 
05:b377 : a9 00 __ LDA #$00
05:b379 : 8d f3 ab STA $abf3 ; (sstack + 0)
05:b37c : a9 89 __ LDA #$89
05:b37e : 8d f4 ab STA $abf4 ; (sstack + 1)
05:b381 : a9 02 __ LDA #$02
05:b383 : 8d f5 ab STA $abf5 ; (sstack + 2)
05:b386 : 20 f0 4b JSR $4bf0 ; (textInput.s1000 + 0)
05:b389 : a9 00 __ LDA #$00
05:b38b : 85 0d __ STA P0 
05:b38d : a9 89 __ LDA #$89
05:b38f : 85 0e __ STA P1 
05:b391 : a9 10 __ LDA #$10
05:b393 : 85 11 __ STA P4 
05:b395 : a9 ad __ LDA #$ad
05:b397 : 85 0f __ STA P2 
05:b399 : a9 ab __ LDA #$ab
05:b39b : 85 10 __ STA P3 
05:b39d : 20 7a 4e JSR $4e7a ; (strtol.s0 + 0)
05:b3a0 : a5 1b __ LDA ACCU + 0 
05:b3a2 : 4c 21 b5 JMP $b521 ; (chareditor.s1260 + 0)
.s437:
05:b3a5 : b0 03 __ BCS $b3aa ; (chareditor.s438 + 0)
05:b3a7 : 4c 93 b4 JMP $b493 ; (chareditor.s439 + 0)
.s438:
05:b3aa : c9 49 __ CMP #$49
05:b3ac : d0 03 __ BNE $b3b1 ; (chareditor.s442 + 0)
05:b3ae : 4c 31 b4 JMP $b431 ; (chareditor.s74 + 0)
.s442:
05:b3b1 : c9 4c __ CMP #$4c
05:b3b3 : f0 03 __ BEQ $b3b8 ; (chareditor.s359 + 0)
05:b3b5 : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s359:
05:b3b8 : a0 00 __ LDY #$00
.l361:
05:b3ba : b9 c7 ab LDA $abc7,y ; (buff + 34)
05:b3bd : 0a __ __ ASL
05:b3be : 99 af ab STA $abaf,y ; (projbuffer + 23)
05:b3c1 : aa __ __ TAX
05:b3c2 : b9 c7 ab LDA $abc7,y ; (buff + 34)
05:b3c5 : 10 05 __ BPL $b3cc ; (chareditor.s1534 + 0)
.s364:
05:b3c7 : e8 __ __ INX
05:b3c8 : 8a __ __ TXA
05:b3c9 : 99 af ab STA $abaf,y ; (projbuffer + 23)
.s1534:
05:b3cc : c8 __ __ INY
05:b3cd : c0 08 __ CPY #$08
05:b3cf : 90 e9 __ BCC $b3ba ; (chareditor.l361 + 0)
.s363:
05:b3d1 : a2 00 __ LDX #$00
.l368:
05:b3d3 : 86 53 __ STX T0 + 0 
05:b3d5 : bd af ab LDA $abaf,x ; (projbuffer + 23)
05:b3d8 : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b3db : a8 __ __ TAY
05:b3dc : a9 12 __ LDA #$12
05:b3de : 8d 00 d6 STA $d600 
05:b3e1 : 18 __ __ CLC
05:b3e2 : a5 56 __ LDA T3 + 0 
05:b3e4 : 65 53 __ ADC T0 + 0 
05:b3e6 : aa __ __ TAX
05:b3e7 : a5 57 __ LDA T3 + 1 
05:b3e9 : 69 00 __ ADC #$00
.l2200:
05:b3eb : 2c 00 d6 BIT $d600 
05:b3ee : 10 fb __ BPL $b3eb ; (chareditor.l2200 + 0)
.s377:
05:b3f0 : 8d 01 d6 STA $d601 
05:b3f3 : a9 13 __ LDA #$13
05:b3f5 : 8d 00 d6 STA $d600 
.l2202:
05:b3f8 : 2c 00 d6 BIT $d600 
05:b3fb : 10 fb __ BPL $b3f8 ; (chareditor.l2202 + 0)
.s382:
05:b3fd : 8e 01 d6 STX $d601 
05:b400 : a9 1f __ LDA #$1f
05:b402 : 8d 00 d6 STA $d600 
.l2204:
05:b405 : 2c 00 d6 BIT $d600 
05:b408 : 10 fb __ BPL $b405 ; (chareditor.l2204 + 0)
.s386:
05:b40a : 8c 01 d6 STY $d601 
05:b40d : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b410 : a6 53 __ LDX T0 + 0 
05:b412 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b415 : 85 0f __ STA P2 
05:b417 : 18 __ __ CLC
05:b418 : a5 1b __ LDA ACCU + 0 
05:b41a : 65 53 __ ADC T0 + 0 
05:b41c : 85 0d __ STA P0 
05:b41e : a5 1c __ LDA ACCU + 1 
05:b420 : 69 00 __ ADC #$00
05:b422 : 85 0e __ STA P1 
05:b424 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b427 : a6 53 __ LDX T0 + 0 
05:b429 : e8 __ __ INX
05:b42a : e0 08 __ CPX #$08
05:b42c : 90 a5 __ BCC $b3d3 ; (chareditor.l368 + 0)
05:b42e : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s74:
05:b431 : a2 00 __ LDX #$00
.l76:
05:b433 : 86 53 __ STX T0 + 0 
05:b435 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b438 : 49 ff __ EOR #$ff
05:b43a : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b43d : a8 __ __ TAY
05:b43e : a9 12 __ LDA #$12
05:b440 : 8d 00 d6 STA $d600 
05:b443 : 18 __ __ CLC
05:b444 : a5 56 __ LDA T3 + 0 
05:b446 : 65 53 __ ADC T0 + 0 
05:b448 : aa __ __ TAX
05:b449 : a5 57 __ LDA T3 + 1 
05:b44b : 69 00 __ ADC #$00
.l2190:
05:b44d : 2c 00 d6 BIT $d600 
05:b450 : 10 fb __ BPL $b44d ; (chareditor.l2190 + 0)
.s85:
05:b452 : 8d 01 d6 STA $d601 
05:b455 : a9 13 __ LDA #$13
05:b457 : 8d 00 d6 STA $d600 
.l2192:
05:b45a : 2c 00 d6 BIT $d600 
05:b45d : 10 fb __ BPL $b45a ; (chareditor.l2192 + 0)
.s90:
05:b45f : 8e 01 d6 STX $d601 
05:b462 : a9 1f __ LDA #$1f
05:b464 : 8d 00 d6 STA $d600 
.l2194:
05:b467 : 2c 00 d6 BIT $d600 
05:b46a : 10 fb __ BPL $b467 ; (chareditor.l2194 + 0)
.s94:
05:b46c : 8c 01 d6 STY $d601 
05:b46f : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b472 : a6 53 __ LDX T0 + 0 
05:b474 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b477 : 85 0f __ STA P2 
05:b479 : 18 __ __ CLC
05:b47a : a5 1b __ LDA ACCU + 0 
05:b47c : 65 53 __ ADC T0 + 0 
05:b47e : 85 0d __ STA P0 
05:b480 : a5 1c __ LDA ACCU + 1 
05:b482 : 69 00 __ ADC #$00
05:b484 : 85 0e __ STA P1 
05:b486 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b489 : a6 53 __ LDX T0 + 0 
05:b48b : e8 __ __ INX
05:b48c : e0 08 __ CPX #$08
05:b48e : 90 a3 __ BCC $b433 ; (chareditor.l76 + 0)
05:b490 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s439:
05:b493 : c9 43 __ CMP #$43
05:b495 : f0 7a __ BEQ $b511 ; (chareditor.s160 + 0)
.s440:
05:b497 : c9 44 __ CMP #$44
05:b499 : f0 03 __ BEQ $b49e ; (chareditor.s308 + 0)
05:b49b : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s308:
05:b49e : a2 01 __ LDX #$01
.l1249:
05:b4a0 : bd c6 ab LDA $abc6,x ; (buff + 33)
05:b4a3 : 9d af ab STA $abaf,x ; (projbuffer + 23)
05:b4a6 : e8 __ __ INX
05:b4a7 : e0 08 __ CPX #$08
05:b4a9 : 90 f5 __ BCC $b4a0 ; (chareditor.l1249 + 0)
.s1250:
05:b4ab : ad ce ab LDA $abce ; (buff + 41)
05:b4ae : 8d af ab STA $abaf ; (projbuffer + 23)
05:b4b1 : a2 00 __ LDX #$00
.l312:
05:b4b3 : 86 53 __ STX T0 + 0 
05:b4b5 : bd af ab LDA $abaf,x ; (projbuffer + 23)
05:b4b8 : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b4bb : a8 __ __ TAY
05:b4bc : a9 12 __ LDA #$12
05:b4be : 8d 00 d6 STA $d600 
05:b4c1 : 18 __ __ CLC
05:b4c2 : a5 56 __ LDA T3 + 0 
05:b4c4 : 65 53 __ ADC T0 + 0 
05:b4c6 : aa __ __ TAX
05:b4c7 : a5 57 __ LDA T3 + 1 
05:b4c9 : 69 00 __ ADC #$00
.l2182:
05:b4cb : 2c 00 d6 BIT $d600 
05:b4ce : 10 fb __ BPL $b4cb ; (chareditor.l2182 + 0)
.s321:
05:b4d0 : 8d 01 d6 STA $d601 
05:b4d3 : a9 13 __ LDA #$13
05:b4d5 : 8d 00 d6 STA $d600 
.l2184:
05:b4d8 : 2c 00 d6 BIT $d600 
05:b4db : 10 fb __ BPL $b4d8 ; (chareditor.l2184 + 0)
.s326:
05:b4dd : 8e 01 d6 STX $d601 
05:b4e0 : a9 1f __ LDA #$1f
05:b4e2 : 8d 00 d6 STA $d600 
.l2186:
05:b4e5 : 2c 00 d6 BIT $d600 
05:b4e8 : 10 fb __ BPL $b4e5 ; (chareditor.l2186 + 0)
.s330:
05:b4ea : 8c 01 d6 STY $d601 
05:b4ed : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b4f0 : a6 53 __ LDX T0 + 0 
05:b4f2 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b4f5 : 85 0f __ STA P2 
05:b4f7 : 18 __ __ CLC
05:b4f8 : a5 1b __ LDA ACCU + 0 
05:b4fa : 65 53 __ ADC T0 + 0 
05:b4fc : 85 0d __ STA P0 
05:b4fe : a5 1c __ LDA ACCU + 1 
05:b500 : 69 00 __ ADC #$00
05:b502 : 85 0e __ STA P1 
05:b504 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b507 : a6 53 __ LDX T0 + 0 
05:b509 : e8 __ __ INX
05:b50a : e0 08 __ CPX #$08
05:b50c : 90 a5 __ BCC $b4b3 ; (chareditor.l312 + 0)
05:b50e : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s160:
05:b511 : a2 00 __ LDX #$00
.l1245:
05:b513 : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b516 : 9d bf ab STA $abbf,x ; (projbuffer + 39)
05:b519 : e8 __ __ INX
05:b51a : e0 08 __ CPX #$08
05:b51c : 90 f5 __ BCC $b513 ; (chareditor.l1245 + 0)
05:b51e : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s1260:
05:b521 : a6 5d __ LDX T8 + 0 
05:b523 : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b526 : a2 12 __ LDX #$12
05:b528 : 8e 00 d6 STX $d600 
05:b52b : aa __ __ TAX
05:b52c : 18 __ __ CLC
05:b52d : a5 56 __ LDA T3 + 0 
05:b52f : 65 5d __ ADC T8 + 0 
05:b531 : a8 __ __ TAY
05:b532 : a5 57 __ LDA T3 + 1 
05:b534 : 69 00 __ ADC #$00
.l2158:
05:b536 : 2c 00 d6 BIT $d600 
05:b539 : 10 fb __ BPL $b536 ; (chareditor.l2158 + 0)
.s64:
05:b53b : 8d 01 d6 STA $d601 
05:b53e : a9 13 __ LDA #$13
05:b540 : 8d 00 d6 STA $d600 
.l2160:
05:b543 : 2c 00 d6 BIT $d600 
05:b546 : 10 fb __ BPL $b543 ; (chareditor.l2160 + 0)
.s69:
05:b548 : 8c 01 d6 STY $d601 
05:b54b : a9 1f __ LDA #$1f
05:b54d : 8d 00 d6 STA $d600 
.l2162:
05:b550 : 2c 00 d6 BIT $d600 
05:b553 : 10 fb __ BPL $b550 ; (chareditor.l2162 + 0)
.s3693:
05:b555 : 8e 01 d6 STX $d601 
05:b558 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b55b : a6 5d __ LDX T8 + 0 
05:b55d : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b560 : 85 0f __ STA P2 
05:b562 : 18 __ __ CLC
05:b563 : a5 1b __ LDA ACCU + 0 
05:b565 : 65 5d __ ADC T8 + 0 
05:b567 : 85 0d __ STA P0 
05:b569 : a5 1c __ LDA ACCU + 1 
05:b56b : 69 00 __ ADC #$00
05:b56d : 85 0e __ STA P1 
05:b56f : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b572 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.s426:
05:b575 : c9 20 __ CMP #$20
05:b577 : d0 07 __ BNE $b580 ; (chareditor.s427 + 0)
.s57:
05:b579 : a5 63 __ LDA T16 + 0 
05:b57b : 45 59 __ EOR T5 + 0 
05:b57d : 4c 21 b5 JMP $b521 ; (chareditor.s1260 + 0)
.s427:
05:b580 : 90 15 __ BCC $b597 ; (chareditor.s429 + 0)
.s428:
05:b582 : c9 2b __ CMP #$2b
05:b584 : d0 05 __ BNE $b58b ; (chareditor.s435 + 0)
.s630:
05:b586 : e6 58 __ INC T4 + 0 
05:b588 : 4c c8 ad JMP $adc8 ; (chareditor.s465 + 0)
.s435:
05:b58b : c9 2d __ CMP #$2d
05:b58d : f0 03 __ BEQ $b592 ; (chareditor.s53 + 0)
05:b58f : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s53:
05:b592 : c6 58 __ DEC T4 + 0 
05:b594 : 4c c8 ad JMP $adc8 ; (chareditor.s465 + 0)
.s429:
05:b597 : c9 14 __ CMP #$14
05:b599 : d0 06 __ BNE $b5a1 ; (chareditor.s430 + 0)
.s95:
05:b59b : a9 00 __ LDA #$00
05:b59d : 85 53 __ STA T0 + 0 
05:b59f : f0 2c __ BEQ $b5cd ; (chareditor.l97 + 0)
.s430:
05:b5a1 : b0 15 __ BCS $b5b8 ; (chareditor.s431 + 0)
.s432:
05:b5a3 : c9 11 __ CMP #$11
05:b5a5 : f0 03 __ BEQ $b5aa ; (chareditor.s45 + 0)
05:b5a7 : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s45:
05:b5aa : a5 5d __ LDA T8 + 0 
05:b5ac : c9 07 __ CMP #$07
05:b5ae : 90 03 __ BCC $b5b3 ; (chareditor.s46 + 0)
05:b5b0 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s46:
05:b5b3 : e6 5d __ INC T8 + 0 
05:b5b5 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s431:
05:b5b8 : c9 1d __ CMP #$1d
05:b5ba : f0 03 __ BEQ $b5bf ; (chareditor.s37 + 0)
05:b5bc : 4c 91 ad JMP $ad91 ; (chareditor.s411 + 0)
.s37:
05:b5bf : a5 5c __ LDA T7 + 0 
05:b5c1 : c9 07 __ CMP #$07
05:b5c3 : 90 03 __ BCC $b5c8 ; (chareditor.s38 + 0)
05:b5c5 : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.s38:
05:b5c8 : e6 5c __ INC T7 + 0 
05:b5ca : 4c c4 ad JMP $adc4 ; (chareditor.s36 + 0)
.l97:
05:b5cd : a9 00 __ LDA #$00
05:b5cf : a6 53 __ LDX T0 + 0 
05:b5d1 : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b5d4 : a9 12 __ LDA #$12
05:b5d6 : 8d 00 d6 STA $d600 
05:b5d9 : 18 __ __ CLC
05:b5da : a5 56 __ LDA T3 + 0 
05:b5dc : 65 53 __ ADC T0 + 0 
05:b5de : aa __ __ TAX
05:b5df : a5 57 __ LDA T3 + 1 
05:b5e1 : 69 00 __ ADC #$00
.l2165:
05:b5e3 : 2c 00 d6 BIT $d600 
05:b5e6 : 10 fb __ BPL $b5e3 ; (chareditor.l2165 + 0)
.s106:
05:b5e8 : 8d 01 d6 STA $d601 
05:b5eb : a9 13 __ LDA #$13
05:b5ed : 8d 00 d6 STA $d600 
.l2167:
05:b5f0 : 2c 00 d6 BIT $d600 
05:b5f3 : 10 fb __ BPL $b5f0 ; (chareditor.l2167 + 0)
.s111:
05:b5f5 : 8e 01 d6 STX $d601 
05:b5f8 : a9 1f __ LDA #$1f
05:b5fa : 8d 00 d6 STA $d600 
.l2169:
05:b5fd : 2c 00 d6 BIT $d600 
05:b600 : 10 fb __ BPL $b5fd ; (chareditor.l2169 + 0)
.s115:
05:b602 : a9 00 __ LDA #$00
05:b604 : 8d 01 d6 STA $d601 
05:b607 : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b60a : a6 53 __ LDX T0 + 0 
05:b60c : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b60f : 85 0f __ STA P2 
05:b611 : 18 __ __ CLC
05:b612 : a5 1b __ LDA ACCU + 0 
05:b614 : 65 53 __ ADC T0 + 0 
05:b616 : 85 0d __ STA P0 
05:b618 : a5 1c __ LDA ACCU + 1 
05:b61a : 69 00 __ ADC #$00
05:b61c : 85 0e __ STA P1 
05:b61e : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b621 : e6 53 __ INC T0 + 0 
05:b623 : a5 53 __ LDA T0 + 0 
05:b625 : c9 08 __ CMP #$08
05:b627 : 90 a4 __ BCC $b5cd ; (chareditor.l97 + 0)
05:b629 : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
.l251:
05:b62c : 86 53 __ STX T0 + 0 
05:b62e : 86 5b __ STX T6 + 0 
05:b630 : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:b633 : 85 59 __ STA T5 + 0 
05:b635 : 49 ff __ EOR #$ff
05:b637 : 85 60 __ STA T12 + 0 
05:b639 : a9 00 __ LDA #$00
05:b63b : 85 55 __ STA T2 + 0 
.l255:
05:b63d : 38 __ __ SEC
05:b63e : a9 07 __ LDA #$07
05:b640 : e5 55 __ SBC T2 + 0 
05:b642 : a6 55 __ LDX T2 + 0 
05:b644 : bc af ab LDY $abaf,x ; (projbuffer + 23)
05:b647 : aa __ __ TAX
05:b648 : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:b64b : a6 5b __ LDX T6 + 0 
05:b64d : 3d c7 ab AND $abc7,x ; (buff + 34)
05:b650 : d0 06 __ BNE $b658 ; (chareditor.s258 + 0)
.s259:
05:b652 : 98 __ __ TYA
05:b653 : 25 60 __ AND T12 + 0 
05:b655 : 4c 5b b6 JMP $b65b ; (chareditor.s1533 + 0)
.s258:
05:b658 : 98 __ __ TYA
05:b659 : 05 59 __ ORA T5 + 0 
.s1533:
05:b65b : a6 55 __ LDX T2 + 0 
05:b65d : e8 __ __ INX
05:b65e : 86 55 __ STX T2 + 0 
05:b660 : 9d ae ab STA $abae,x ; (projbuffer + 22)
05:b663 : e0 08 __ CPX #$08
05:b665 : 90 d6 __ BCC $b63d ; (chareditor.l255 + 0)
.s252:
05:b667 : a6 53 __ LDX T0 + 0 
05:b669 : e8 __ __ INX
05:b66a : e0 08 __ CPX #$08
05:b66c : 90 be __ BCC $b62c ; (chareditor.l251 + 0)
.s253:
05:b66e : a2 00 __ LDX #$00
.l262:
05:b670 : 86 53 __ STX T0 + 0 
05:b672 : bd af ab LDA $abaf,x ; (projbuffer + 23)
05:b675 : 9d c7 ab STA $abc7,x ; (buff + 34)
05:b678 : a8 __ __ TAY
05:b679 : a9 12 __ LDA #$12
05:b67b : 8d 00 d6 STA $d600 
05:b67e : 18 __ __ CLC
05:b67f : a5 56 __ LDA T3 + 0 
05:b681 : 65 53 __ ADC T0 + 0 
05:b683 : aa __ __ TAX
05:b684 : a5 57 __ LDA T3 + 1 
05:b686 : 69 00 __ ADC #$00
.l2139:
05:b688 : 2c 00 d6 BIT $d600 
05:b68b : 10 fb __ BPL $b688 ; (chareditor.l2139 + 0)
.s271:
05:b68d : 8d 01 d6 STA $d601 
05:b690 : a9 13 __ LDA #$13
05:b692 : 8d 00 d6 STA $d600 
.l2141:
05:b695 : 2c 00 d6 BIT $d600 
05:b698 : 10 fb __ BPL $b695 ; (chareditor.l2141 + 0)
.s276:
05:b69a : 8e 01 d6 STX $d601 
05:b69d : a9 1f __ LDA #$1f
05:b69f : 8d 00 d6 STA $d600 
.l2143:
05:b6a2 : 2c 00 d6 BIT $d600 
05:b6a5 : 10 fb __ BPL $b6a2 ; (chareditor.l2143 + 0)
.s280:
05:b6a7 : 8c 01 d6 STY $d601 
05:b6aa : 20 ce b6 JSR $b6ce ; (charaddress@proxy + 0)
05:b6ad : a6 53 __ LDX T0 + 0 
05:b6af : bd c7 ab LDA $abc7,x ; (buff + 34)
05:b6b2 : 85 0f __ STA P2 
05:b6b4 : 18 __ __ CLC
05:b6b5 : a5 1b __ LDA ACCU + 0 
05:b6b7 : 65 53 __ ADC T0 + 0 
05:b6b9 : 85 0d __ STA P0 
05:b6bb : a5 1c __ LDA ACCU + 1 
05:b6bd : 69 00 __ ADC #$00
05:b6bf : 85 0e __ STA P1 
05:b6c1 : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
05:b6c4 : a6 53 __ LDX T0 + 0 
05:b6c6 : e8 __ __ INX
05:b6c7 : e0 08 __ CPX #$08
05:b6c9 : 90 a5 __ BCC $b670 ; (chareditor.l262 + 0)
05:b6cb : 4c 41 af JMP $af41 ; (chareditor.s2280 + 0)
--------------------------------------------------------------------
charaddress@proxy: ; charaddress@proxy
05:b6ce : a5 58 __ LDA $58 
05:b6d0 : 85 0d __ STA P0 
05:b6d2 : a5 54 __ LDA $54 
05:b6d4 : 85 0e __ STA P1 
05:b6d6 : a9 01 __ LDA #$01
05:b6d8 : 85 0f __ STA P2 
--------------------------------------------------------------------
charaddress: ; charaddress(u8,u8,u8)->u16
.s0:
05:b6da : a9 00 __ LDA #$00
05:b6dc : c5 0e __ CMP P1 ; (stdoralt + 0)
05:b6de : 2a __ __ ROL
05:b6df : a8 __ __ TAY
05:b6e0 : a5 0f __ LDA P2 ; (vdcormem + 0)
05:b6e2 : f0 1f __ BEQ $b703 ; (charaddress.s1 + 0)
.s2:
05:b6e4 : 98 __ __ TYA
05:b6e5 : f0 04 __ BEQ $b6eb ; (charaddress.s1005 + 0)
.s1006:
05:b6e7 : a9 48 __ LDA #$48
05:b6e9 : 90 02 __ BCC $b6ed ; (charaddress.s1007 + 0)
.s1005:
05:b6eb : a9 50 __ LDA #$50
.s1007:
05:b6ed : 85 1c __ STA ACCU + 1 
05:b6ef : a9 00 __ LDA #$00
05:b6f1 : 06 0d __ ASL P0 ; (screencode + 0)
05:b6f3 : 2a __ __ ROL
05:b6f4 : 06 0d __ ASL P0 ; (screencode + 0)
05:b6f6 : 2a __ __ ROL
05:b6f7 : 06 0d __ ASL P0 ; (screencode + 0)
05:b6f9 : 2a __ __ ROL
05:b6fa : 05 1c __ ORA ACCU + 1 
05:b6fc : 85 1c __ STA ACCU + 1 
05:b6fe : a5 0d __ LDA P0 ; (screencode + 0)
05:b700 : 85 1b __ STA ACCU + 0 
.s1001:
05:b702 : 60 __ __ RTS
.s1:
05:b703 : 98 __ __ TYA
05:b704 : f0 08 __ BEQ $b70e ; (charaddress.s6 + 0)
.s5:
05:b706 : ad a0 87 LDA $87a0 ; (vdc_state + 17)
05:b709 : ac 9f 87 LDY $879f ; (vdc_state + 16)
05:b70c : 90 06 __ BCC $b714 ; (charaddress.s7 + 0)
.s6:
05:b70e : ad a2 87 LDA $87a2 ; (vdc_state + 19)
05:b711 : ac a1 87 LDY $87a1 ; (vdc_state + 18)
.s7:
05:b714 : 84 1b __ STY ACCU + 0 
05:b716 : 85 1c __ STA ACCU + 1 
05:b718 : a5 0d __ LDA P0 ; (screencode + 0)
05:b71a : 0a __ __ ASL
05:b71b : 2a __ __ ROL
05:b71c : 2a __ __ ROL
05:b71d : 2a __ __ ROL
05:b71e : a8 __ __ TAY
05:b71f : 29 07 __ AND #$07
05:b721 : 2a __ __ ROL
05:b722 : aa __ __ TAX
05:b723 : 98 __ __ TYA
05:b724 : 29 f0 __ AND #$f0
05:b726 : 65 1b __ ADC ACCU + 0 
05:b728 : 85 1b __ STA ACCU + 0 
05:b72a : 8a __ __ TXA
05:b72b : 65 1c __ ADC ACCU + 1 
05:b72d : 85 1c __ STA ACCU + 1 
05:b72f : 60 __ __ RTS
--------------------------------------------------------------------
05:b730 : __ __ __ BYT 63 48 41 52 45 44 49 54 00                      : cHAREDIT.
--------------------------------------------------------------------
showchareditfield: ; showchareditfield(u8)->void
.s0:
05:b739 : a9 43 __ LDA #$43
05:b73b : 85 18 __ STA P11 
05:b73d : a9 00 __ LDA #$00
05:b73f : 85 17 __ STA P10 
05:b741 : 8d f3 ab STA $abf3 ; (sstack + 0)
05:b744 : a9 0d __ LDA #$0d
05:b746 : 8d f4 ab STA $abf4 ; (sstack + 1)
05:b749 : a9 0c __ LDA #$0c
05:b74b : 8d f5 ab STA $abf5 ; (sstack + 2)
05:b74e : ad f6 ab LDA $abf6 ; (sstack + 3)
05:b751 : 4a __ __ LSR
05:b752 : a9 00 __ LDA #$00
05:b754 : 6a __ __ ROR
05:b755 : 49 ff __ EOR #$ff
05:b757 : 38 __ __ SEC
05:b758 : 6d ff 7a ADC $7aff ; (mc_menupopup + 0)
05:b75b : 8d 96 87 STA $8796 ; (vdc_state + 7)
05:b75e : 4c 60 36 JMP $3660 ; (vdcwin_win_new.s1000 + 0)
--------------------------------------------------------------------
showchareditgrid: ; showchareditgrid(u16,u8)->void
.s1000:
05:b761 : a2 03 __ LDX #$03
05:b763 : b5 53 __ LDA T5 + 0,x 
05:b765 : 9d cf ab STA $abcf,x ; (buff + 42)
05:b768 : ca __ __ DEX
05:b769 : 10 f8 __ BPL $b763 ; (showchareditgrid.s1000 + 2)
05:b76b : 38 __ __ SEC
05:b76c : a5 23 __ LDA SP + 0 
05:b76e : e9 0a __ SBC #$0a
05:b770 : 85 23 __ STA SP + 0 
05:b772 : b0 02 __ BCS $b776 ; (showchareditgrid.s0 + 0)
05:b774 : c6 24 __ DEC SP + 1 
.s0:
05:b776 : a9 00 __ LDA #$00
05:b778 : 85 0f __ STA P2 
05:b77a : ad f8 ab LDA $abf8 ; (sstack + 5)
05:b77d : 85 4e __ STA T0 + 0 
05:b77f : 85 0d __ STA P0 
05:b781 : ad f9 ab LDA $abf9 ; (sstack + 6)
05:b784 : 85 4f __ STA T0 + 1 
05:b786 : ad fa ab LDA $abfa ; (sstack + 7)
05:b789 : 85 0e __ STA P1 
05:b78b : 20 da b6 JSR $b6da ; (charaddress.s0 + 0)
05:b78e : a5 1b __ LDA ACCU + 0 
05:b790 : 85 51 __ STA T2 + 0 
05:b792 : a5 1c __ LDA ACCU + 1 
05:b794 : 85 52 __ STA T2 + 1 
05:b796 : a5 4e __ LDA T0 + 0 
05:b798 : a0 06 __ LDY #$06
05:b79a : 91 23 __ STA (SP + 0),y 
05:b79c : a5 4f __ LDA T0 + 1 
05:b79e : c8 __ __ INY
05:b79f : 91 23 __ STA (SP + 0),y 
05:b7a1 : a5 0e __ LDA P1 
05:b7a3 : 4a __ __ LSR
05:b7a4 : a9 00 __ LDA #$00
05:b7a6 : 6a __ __ ROR
05:b7a7 : 49 ff __ EOR #$ff
05:b7a9 : 38 __ __ SEC
05:b7aa : 6d ff 7a ADC $7aff ; (mc_menupopup + 0)
05:b7ad : 85 4e __ STA T0 + 0 
05:b7af : 8d 96 87 STA $8796 ; (vdc_state + 7)
05:b7b2 : a9 00 __ LDA #$00
05:b7b4 : a0 02 __ LDY #$02
05:b7b6 : 91 23 __ STA (SP + 0),y 
05:b7b8 : a9 89 __ LDA #$89
05:b7ba : c8 __ __ INY
05:b7bb : 91 23 __ STA (SP + 0),y 
05:b7bd : a9 bc __ LDA #$bc
05:b7bf : c8 __ __ INY
05:b7c0 : 91 23 __ STA (SP + 0),y 
05:b7c2 : a9 b8 __ LDA #$b8
05:b7c4 : c8 __ __ INY
05:b7c5 : 91 23 __ STA (SP + 0),y 
05:b7c7 : a5 0e __ LDA P1 
05:b7c9 : f0 07 __ BEQ $b7d2 ; (showchareditgrid.s72 + 0)
.s73:
05:b7cb : a9 b8 __ LDA #$b8
05:b7cd : a2 cc __ LDX #$cc
05:b7cf : 4c d6 b7 JMP $b7d6 ; (showchareditgrid.s74 + 0)
.s72:
05:b7d2 : a9 b8 __ LDA #$b8
05:b7d4 : a2 c8 __ LDX #$c8
.s74:
05:b7d6 : 85 54 __ STA T5 + 1 
05:b7d8 : 8a __ __ TXA
05:b7d9 : a0 08 __ LDY #$08
05:b7db : 91 23 __ STA (SP + 0),y 
05:b7dd : a5 54 __ LDA T5 + 1 
05:b7df : c8 __ __ INY
05:b7e0 : 91 23 __ STA (SP + 0),y 
05:b7e2 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
05:b7e5 : a9 44 __ LDA #$44
05:b7e7 : 85 11 __ STA P4 
05:b7e9 : a9 01 __ LDA #$01
05:b7eb : 85 12 __ STA P5 
05:b7ed : a5 4e __ LDA T0 + 0 
05:b7ef : 85 15 __ STA P8 
05:b7f1 : 20 a4 80 JSR $80a4 ; (vdc_prints_attr@proxy + 0)
05:b7f4 : a9 00 __ LDA #$00
05:b7f6 : 85 50 __ STA T1 + 0 
.l3:
05:b7f8 : a9 12 __ LDA #$12
05:b7fa : 8d 00 d6 STA $d600 
05:b7fd : 18 __ __ CLC
05:b7fe : a5 50 __ LDA T1 + 0 
05:b800 : 65 51 __ ADC T2 + 0 
05:b802 : aa __ __ TAX
05:b803 : a9 00 __ LDA #$00
05:b805 : 65 52 __ ADC T2 + 1 
.l134:
05:b807 : 2c 00 d6 BIT $d600 
05:b80a : 10 fb __ BPL $b807 ; (showchareditgrid.l134 + 0)
.s12:
05:b80c : 8d 01 d6 STA $d601 
05:b80f : a9 13 __ LDA #$13
05:b811 : 8d 00 d6 STA $d600 
.l136:
05:b814 : 2c 00 d6 BIT $d600 
05:b817 : 10 fb __ BPL $b814 ; (showchareditgrid.l136 + 0)
.s17:
05:b819 : 8e 01 d6 STX $d601 
05:b81c : a9 1f __ LDA #$1f
05:b81e : 8d 00 d6 STA $d600 
.l138:
05:b821 : 2c 00 d6 BIT $d600 
05:b824 : 10 fb __ BPL $b821 ; (showchareditgrid.l138 + 0)
.s21:
05:b826 : ad 01 d6 LDA $d601 
05:b829 : a0 06 __ LDY #$06
05:b82b : 91 23 __ STA (SP + 0),y 
05:b82d : 85 55 __ STA T6 + 0 
05:b82f : a9 00 __ LDA #$00
05:b831 : a0 02 __ LDY #$02
05:b833 : 91 23 __ STA (SP + 0),y 
05:b835 : a9 89 __ LDA #$89
05:b837 : c8 __ __ INY
05:b838 : 91 23 __ STA (SP + 0),y 
05:b83a : a9 d0 __ LDA #$d0
05:b83c : c8 __ __ INY
05:b83d : 91 23 __ STA (SP + 0),y 
05:b83f : a9 b8 __ LDA #$b8
05:b841 : c8 __ __ INY
05:b842 : 91 23 __ STA (SP + 0),y 
05:b844 : a9 00 __ LDA #$00
05:b846 : 85 56 __ STA T7 + 0 
05:b848 : a0 07 __ LDY #$07
05:b84a : 91 23 __ STA (SP + 0),y 
05:b84c : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
05:b84f : a9 44 __ LDA #$44
05:b851 : 85 11 __ STA P4 
05:b853 : a9 00 __ LDA #$00
05:b855 : 85 13 __ STA P6 
05:b857 : a9 89 __ LDA #$89
05:b859 : 85 14 __ STA P7 
05:b85b : 18 __ __ CLC
05:b85c : a5 50 __ LDA T1 + 0 
05:b85e : 69 03 __ ADC #$03
05:b860 : 85 12 __ STA P5 
05:b862 : 20 81 33 JSR $3381 ; (vdc_prints_attr@proxy + 0)
05:b865 : 18 __ __ CLC
05:b866 : a5 50 __ LDA T1 + 0 
05:b868 : 69 03 __ ADC #$03
05:b86a : 85 0e __ STA P1 
05:b86c : a9 20 __ LDA #$20
05:b86e : 85 0f __ STA P2 
05:b870 : 18 __ __ CLC
05:b871 : a9 00 __ LDA #$00
.l26:
05:b873 : 69 47 __ ADC #$47
05:b875 : 85 0d __ STA P0 
05:b877 : 38 __ __ SEC
05:b878 : a9 07 __ LDA #$07
05:b87a : e5 56 __ SBC T7 + 0 
05:b87c : aa __ __ TAX
05:b87d : bd 4a 87 LDA $874a,x ; (bitshift + 8)
05:b880 : 25 55 __ AND T6 + 0 
05:b882 : d0 08 __ BNE $b88c ; (showchareditgrid.s29 + 0)
.s30:
05:b884 : a5 4e __ LDA T0 + 0 
05:b886 : 38 __ __ SEC
05:b887 : e9 40 __ SBC #$40
05:b889 : 4c 8e b8 JMP $b88e ; (showchareditgrid.s1012 + 0)
.s29:
05:b88c : a5 4e __ LDA T0 + 0 
.s1012:
05:b88e : 85 10 __ STA P3 
05:b890 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
05:b893 : e6 56 __ INC T7 + 0 
05:b895 : a5 56 __ LDA T7 + 0 
05:b897 : c9 08 __ CMP #$08
05:b899 : 90 d8 __ BCC $b873 ; (showchareditgrid.l26 + 0)
.s4:
05:b89b : e6 50 __ INC T1 + 0 
05:b89d : a5 50 __ LDA T1 + 0 
05:b89f : c9 08 __ CMP #$08
05:b8a1 : b0 03 __ BCS $b8a6 ; (showchareditgrid.s1001 + 0)
05:b8a3 : 4c f8 b7 JMP $b7f8 ; (showchareditgrid.l3 + 0)
.s1001:
05:b8a6 : 18 __ __ CLC
05:b8a7 : a5 23 __ LDA SP + 0 
05:b8a9 : 69 0a __ ADC #$0a
05:b8ab : 85 23 __ STA SP + 0 
05:b8ad : 90 02 __ BCC $b8b1 ; (showchareditgrid.s1001 + 11)
05:b8af : e6 24 __ INC SP + 1 
05:b8b1 : a2 03 __ LDX #$03
05:b8b3 : bd cf ab LDA $abcf,x ; (buff + 42)
05:b8b6 : 95 53 __ STA T5 + 0,x 
05:b8b8 : ca __ __ DEX
05:b8b9 : 10 f8 __ BPL $b8b3 ; (showchareditgrid.s1001 + 13)
05:b8bb : 60 __ __ RTS
--------------------------------------------------------------------
05:b8bc : __ __ __ BYT 63 48 41 52 20 25 32 78 20 25 53 00             : cHAR %2x %S.
--------------------------------------------------------------------
05:b8c8 : __ __ __ BYT 73 54 44 00                                     : sTD.
--------------------------------------------------------------------
05:b8cc : __ __ __ BYT 61 4c 54 00                                     : aLT.
--------------------------------------------------------------------
05:b8d0 : __ __ __ BYT 25 32 78 00                                     : %2x.
--------------------------------------------------------------------
05:b8d4 : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
versioninfo: ; versioninfo()->void
.s1000:
05:b8d9 : 38 __ __ SEC
05:b8da : a5 23 __ LDA SP + 0 
05:b8dc : e9 08 __ SBC #$08
05:b8de : 85 23 __ STA SP + 0 
05:b8e0 : b0 02 __ BCS $b8e4 ; (versioninfo.s0 + 0)
05:b8e2 : c6 24 __ DEC SP + 1 
.s0:
05:b8e4 : a9 00 __ LDA #$00
05:b8e6 : 85 17 __ STA P10 
05:b8e8 : a9 05 __ LDA #$05
05:b8ea : 85 18 __ STA P11 
05:b8ec : 8d f3 ab STA $abf3 ; (sstack + 0)
05:b8ef : a9 3c __ LDA #$3c
05:b8f1 : 8d f4 ab STA $abf4 ; (sstack + 1)
05:b8f4 : a9 0f __ LDA #$0f
05:b8f6 : 8d f5 ab STA $abf5 ; (sstack + 2)
05:b8f9 : ad ff 7a LDA $7aff ; (mc_menupopup + 0)
05:b8fc : 8d 96 87 STA $8796 ; (vdc_state + 7)
05:b8ff : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
05:b902 : a9 01 __ LDA #$01
05:b904 : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
05:b907 : a9 06 __ LDA #$06
05:b909 : 85 11 __ STA P4 
05:b90b : 85 12 __ STA P5 
05:b90d : a9 bd __ LDA #$bd
05:b90f : 85 13 __ STA P6 
05:b911 : a9 b9 __ LDA #$b9
05:b913 : 85 14 __ STA P7 
05:b915 : 20 81 33 JSR $3381 ; (vdc_prints_attr@proxy + 0)
05:b918 : a9 00 __ LDA #$00
05:b91a : 20 cd 60 JSR $60cd ; (vdc_underline.s0 + 0)
05:b91d : a9 08 __ LDA #$08
05:b91f : 85 12 __ STA P5 
05:b921 : a9 dd __ LDA #$dd
05:b923 : 85 13 __ STA P6 
05:b925 : a9 b9 __ LDA #$b9
05:b927 : 85 14 __ STA P7 
05:b929 : ad 96 87 LDA $8796 ; (vdc_state + 7)
05:b92c : 85 15 __ STA P8 
05:b92e : 85 52 __ STA T0 + 0 
05:b930 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
05:b933 : e6 12 __ INC P5 
05:b935 : a9 00 __ LDA #$00
05:b937 : 85 13 __ STA P6 
05:b939 : a9 ba __ LDA #$ba
05:b93b : 85 14 __ STA P7 
05:b93d : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
05:b940 : a9 00 __ LDA #$00
05:b942 : a0 02 __ LDY #$02
05:b944 : 91 23 __ STA (SP + 0),y 
05:b946 : a9 89 __ LDA #$89
05:b948 : c8 __ __ INY
05:b949 : 91 23 __ STA (SP + 0),y 
05:b94b : a9 ef __ LDA #$ef
05:b94d : c8 __ __ INY
05:b94e : 91 23 __ STA (SP + 0),y 
05:b950 : a9 b9 __ LDA #$b9
05:b952 : c8 __ __ INY
05:b953 : 91 23 __ STA (SP + 0),y 
05:b955 : a9 1e __ LDA #$1e
05:b957 : c8 __ __ INY
05:b958 : 91 23 __ STA (SP + 0),y 
05:b95a : a9 ba __ LDA #$ba
05:b95c : c8 __ __ INY
05:b95d : 91 23 __ STA (SP + 0),y 
05:b95f : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
05:b962 : a9 06 __ LDA #$06
05:b964 : 85 11 __ STA P4 
05:b966 : a9 0b __ LDA #$0b
05:b968 : 85 12 __ STA P5 
05:b96a : a5 52 __ LDA T0 + 0 
05:b96c : 85 15 __ STA P8 
05:b96e : 20 a4 80 JSR $80a4 ; (vdc_prints_attr@proxy + 0)
05:b971 : a9 0d __ LDA #$0d
05:b973 : 85 12 __ STA P5 
05:b975 : a9 30 __ LDA #$30
05:b977 : 85 13 __ STA P6 
05:b979 : a9 ba __ LDA #$ba
05:b97b : 85 14 __ STA P7 
05:b97d : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
05:b980 : e6 12 __ INC P5 
05:b982 : a9 60 __ LDA #$60
05:b984 : 85 13 __ STA P6 
05:b986 : a9 ba __ LDA #$ba
05:b988 : 85 14 __ STA P7 
05:b98a : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
05:b98d : a9 10 __ LDA #$10
05:b98f : 85 12 __ STA P5 
05:b991 : a9 8b __ LDA #$8b
05:b993 : 85 13 __ STA P6 
05:b995 : a9 ba __ LDA #$ba
05:b997 : 85 14 __ STA P7 
05:b999 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
05:b99c : a9 12 __ LDA #$12
05:b99e : 85 12 __ STA P5 
05:b9a0 : a9 a8 __ LDA #$a8
05:b9a2 : 85 13 __ STA P6 
05:b9a4 : a9 ba __ LDA #$ba
05:b9a6 : 85 14 __ STA P7 
05:b9a8 : 20 3b 34 JSR $343b ; (vdc_prints_attr.s0 + 0)
05:b9ab : 20 cc 2d JSR $2dcc ; (getch.s0 + 0)
05:b9ae : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
.s1001:
05:b9b1 : 18 __ __ CLC
05:b9b2 : a5 23 __ LDA SP + 0 
05:b9b4 : 69 08 __ ADC #$08
05:b9b6 : 85 23 __ STA SP + 0 
05:b9b8 : 90 02 __ BCC $b9bc ; (versioninfo.s1001 + 11)
05:b9ba : e6 24 __ INC SP + 1 
05:b9bc : 60 __ __ RTS
--------------------------------------------------------------------
05:b9bd : __ __ __ BYT 76 45 52 53 49 4f 4e 20 49 4e 46 4f 52 4d 41 54 : vERSION INFORMAT
05:b9cd : __ __ __ BYT 49 4f 4e 20 41 4e 44 20 43 52 45 44 49 54 53 00 : ION AND CREDITS.
--------------------------------------------------------------------
05:b9dd : __ __ __ BYT 76 64 63 20 73 43 52 45 45 4e 20 65 44 49 54 4f : vdc sCREEN eDITO
05:b9ed : __ __ __ BYT 52 00                                           : R.
--------------------------------------------------------------------
05:b9ef : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 00             : vERSION: %S.
--------------------------------------------------------------------
05:ba00 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
05:ba10 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 00       : BY xANDER mOL.
--------------------------------------------------------------------
05:ba1e : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 31 35 2d 31 33 32 : V20-20240415-132
05:ba2e : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
05:ba30 : __ __ __ BYT 66 55 4c 4c 20 53 4f 55 52 43 45 20 43 4f 44 45 : fULL SOURCE CODE
05:ba40 : __ __ __ BYT 2c 20 44 4f 43 55 4d 45 4e 54 41 54 49 4f 4e 20 : , DOCUMENTATION 
05:ba50 : __ __ __ BYT 41 4e 44 20 43 52 45 44 49 54 53 20 41 54 3a 00 : AND CREDITS AT:.
--------------------------------------------------------------------
05:ba60 : __ __ __ BYT 48 54 54 50 53 3a 2f 2f 47 49 54 48 55 42 2e 43 : HTTPS://GITHUB.C
05:ba70 : __ __ __ BYT 4f 4d 2f 58 41 48 4d 4f 4c 2f 76 64 63 73 43 52 : OM/XAHMOL/vdcsCR
05:ba80 : __ __ __ BYT 45 45 4e 65 44 49 54 4f 52 32 00                : EENeDITOR2.
--------------------------------------------------------------------
05:ba8b : __ __ __ BYT 28 63 29 20 32 30 32 34 2c 20 69 64 52 45 41 4d : (c) 2024, idREAM
05:ba9b : __ __ __ BYT 54 69 4e 38 62 49 54 53 2e 43 4f 4d 00          : TiN8bITS.COM.
--------------------------------------------------------------------
05:baa8 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
05:bab8 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
import_prg: ; import_prg()->void
.s0:
06:ac00 : a9 00 __ LDA #$00
06:ac02 : 8d fd ab STA $abfd ; (sstack + 10)
06:ac05 : a9 81 __ LDA #$81
06:ac07 : 8d fe ab STA $abfe ; (sstack + 11)
06:ac0a : a9 ac __ LDA #$ac
06:ac0c : 8d ff ab STA $abff ; (sstack + 12)
06:ac0f : 20 27 72 JSR $7227 ; (import_dialogue.s1000 + 0)
06:ac12 : a5 1b __ LDA ACCU + 0 
06:ac14 : f0 67 __ BEQ $ac7d ; (import_prg.s1001 + 0)
.s1:
06:ac16 : ad fe 7a LDA $7afe ; (undoenabled + 0)
06:ac19 : c9 01 __ CMP #$01
06:ac1b : d0 18 __ BNE $ac35 ; (import_prg.s6 + 0)
.s4:
06:ac1d : ad cf 8a LDA $8acf ; (importvars + 2)
06:ac20 : 85 16 __ STA P9 
06:ac22 : ad cd 8a LDA $8acd ; (importvars + 0)
06:ac25 : 85 17 __ STA P10 
06:ac27 : ad d1 8a LDA $8ad1 ; (importvars + 4)
06:ac2a : 85 18 __ STA P11 
06:ac2c : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:ac2f : 8d f3 ab STA $abf3 ; (sstack + 0)
06:ac32 : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s6:
06:ac35 : 20 e8 81 JSR $81e8 ; (vdc_clear@proxy + 0)
06:ac38 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
06:ac3b : 8d f8 ab STA $abf8 ; (sstack + 5)
06:ac3e : a9 7a __ LDA #$7a
06:ac40 : 8d f9 ab STA $abf9 ; (sstack + 6)
06:ac43 : a9 87 __ LDA #$87
06:ac45 : 8d fa ab STA $abfa ; (sstack + 7)
06:ac48 : 20 8c ac JSR $ac8c ; (importread.s1000 + 0)
06:ac4b : a5 1b __ LDA ACCU + 0 
06:ac4d : f0 03 __ BEQ $ac52 ; (import_prg.s9 + 0)
.s7:
06:ac4f : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s9:
06:ac52 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
06:ac55 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
06:ac58 : 20 14 3d JSR $3d14 ; (placesignature.s1000 + 0)
06:ac5b : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
06:ac5e : a9 00 __ LDA #$00
06:ac60 : 85 17 __ STA P10 
06:ac62 : 85 18 __ STA P11 
06:ac64 : 8d f3 ab STA $abf3 ; (sstack + 0)
06:ac67 : a9 01 __ LDA #$01
06:ac69 : 8d f5 ab STA $abf5 ; (sstack + 2)
06:ac6c : ad 92 87 LDA $8792 ; (vdc_state + 3)
06:ac6f : 8d f4 ab STA $abf4 ; (sstack + 1)
06:ac72 : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
06:ac75 : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
06:ac78 : ad fe 86 LDA $86fe ; (showbar + 0)
06:ac7b : d0 01 __ BNE $ac7e ; (import_prg.s10 + 0)
.s1001:
06:ac7d : 60 __ __ RTS
.s10:
06:ac7e : 4c d0 3e JMP $3ed0 ; (initstatusbar.s1000 + 0)
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
06:acac : a9 90 __ LDA #$90
06:acae : a0 02 __ LDY #$02
06:acb0 : 91 23 __ STA (SP + 0),y 
06:acb2 : a9 88 __ LDA #$88
06:acb4 : c8 __ __ INY
06:acb5 : 91 23 __ STA (SP + 0),y 
06:acb7 : a9 dc __ LDA #$dc
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
06:accd : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
06:acd0 : a9 00 __ LDA #$00
06:acd2 : 85 0d __ STA P0 
06:acd4 : 85 0e __ STA P1 
06:acd6 : 20 b4 2a JSR $2ab4 ; (krnio_setbnk.s0 + 0)
06:acd9 : 20 bb 2a JSR $2abb ; (krnio_setnam@proxy + 0)
06:acdc : ad f8 ab LDA $abf8 ; (sstack + 5)
06:acdf : 85 0e __ STA P1 
06:ace1 : 20 33 63 JSR $6333 ; (krnio_open@proxy + 0)
06:ace4 : 09 00 __ ORA #$00
06:ace6 : d0 05 __ BNE $aced ; (importread.s1 + 0)
.s3:
06:ace8 : a9 00 __ LDA #$00
06:acea : 4c 15 b0 JMP $b015 ; (importread.s1001 + 0)
.s1:
06:aced : ad db 8a LDA $8adb ; (importvars + 14)
06:acf0 : c9 01 __ CMP #$01
06:acf2 : f0 04 __ BEQ $acf8 ; (importread.s4 + 0)
.s169:
06:acf4 : a9 08 __ LDA #$08
06:acf6 : d0 37 __ BNE $ad2f ; (importread.s6 + 0)
.s4:
06:acf8 : a9 e3 __ LDA #$e3
06:acfa : 85 13 __ STA P6 
06:acfc : a9 b0 __ LDA #$b0
06:acfe : 85 14 __ STA P7 
06:ad00 : 20 d3 80 JSR $80d3 ; (vdc_prints_attr@proxy + 0)
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
06:ad17 : 20 65 63 JSR $6365 ; (krnio_read.s0 + 0)
06:ad1a : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
06:ad1d : 85 51 __ STA T2 + 0 
06:ad1f : 09 00 __ ORA #$00
06:ad21 : f0 0a __ BEQ $ad2d ; (importread.s170 + 0)
.s8:
06:ad23 : a9 01 __ LDA #$01
06:ad25 : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
06:ad28 : a5 51 __ LDA T2 + 0 
06:ad2a : 4c 15 b0 JMP $b015 ; (importread.s1001 + 0)
.s170:
06:ad2d : a9 09 __ LDA #$09
.s6:
06:ad2f : 85 51 __ STA T2 + 0 
06:ad31 : ad d9 8a LDA $8ad9 ; (importvars + 12)
06:ad34 : c9 03 __ CMP #$03
06:ad36 : b0 10 __ BCS $ad48 ; (importread.s14 + 0)
.s12:
06:ad38 : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:ad3b : 0d d4 8a ORA $8ad4 ; (importvars + 7)
06:ad3e : f0 03 __ BEQ $ad43 ; (importread.s20 + 0)
06:ad40 : 4c 2d b0 JMP $b02d ; (importread.s93 + 0)
.s20:
06:ad43 : e6 51 __ INC T2 + 0 
06:ad45 : ad d9 8a LDA $8ad9 ; (importvars + 12)
.s14:
06:ad48 : c9 01 __ CMP #$01
06:ad4a : f0 03 __ BEQ $ad4f ; (importread.s32 + 0)
06:ad4c : 4c e2 ad JMP $ade2 ; (importread.s223 + 0)
.s32:
06:ad4f : ad dd 8a LDA $8add ; (importvars + 16)
06:ad52 : 85 4e __ STA T0 + 0 
06:ad54 : 0d de 8a ORA $8ade ; (importvars + 17)
06:ad57 : d0 03 __ BNE $ad5c ; (importread.s29 + 0)
06:ad59 : 4c e2 ad JMP $ade2 ; (importread.s223 + 0)
.s29:
06:ad5c : a9 01 __ LDA #$01
06:ad5e : 20 dd 63 JSR $63dd ; (krnio_chkin.s1000 + 0)
06:ad61 : 09 00 __ ORA #$00
06:ad63 : d0 0a __ BNE $ad6f ; (importread.s33 + 0)
.s34:
06:ad65 : a9 01 __ LDA #$01
06:ad67 : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
06:ad6a : a9 01 __ LDA #$01
06:ad6c : 4c 15 b0 JMP $b015 ; (importread.s1001 + 0)
.s33:
06:ad6f : a5 4e __ LDA T0 + 0 
06:ad71 : 0d de 8a ORA $8ade ; (importvars + 17)
06:ad74 : f0 67 __ BEQ $addd ; (importread.s39 + 0)
.s92:
06:ad76 : a2 00 __ LDX #$00
06:ad78 : 86 4f __ STX T0 + 1 
.l37:
06:ad7a : a9 90 __ LDA #$90
06:ad7c : a0 02 __ LDY #$02
06:ad7e : 91 23 __ STA (SP + 0),y 
06:ad80 : a9 88 __ LDA #$88
06:ad82 : c8 __ __ INY
06:ad83 : 91 23 __ STA (SP + 0),y 
06:ad85 : a9 24 __ LDA #$24
06:ad87 : c8 __ __ INY
06:ad88 : 91 23 __ STA (SP + 0),y 
06:ad8a : a9 b1 __ LDA #$b1
06:ad8c : c8 __ __ INY
06:ad8d : 91 23 __ STA (SP + 0),y 
06:ad8f : 8a __ __ TXA
06:ad90 : 18 __ __ CLC
06:ad91 : 69 01 __ ADC #$01
06:ad93 : 85 53 __ STA T5 + 0 
06:ad95 : c8 __ __ INY
06:ad96 : 91 23 __ STA (SP + 0),y 
06:ad98 : a5 4f __ LDA T0 + 1 
06:ad9a : 69 00 __ ADC #$00
06:ad9c : 85 54 __ STA T5 + 1 
06:ad9e : c8 __ __ INY
06:ad9f : 91 23 __ STA (SP + 0),y 
06:ada1 : ad dd 8a LDA $8add ; (importvars + 16)
06:ada4 : c8 __ __ INY
06:ada5 : 91 23 __ STA (SP + 0),y 
06:ada7 : ad de 8a LDA $8ade ; (importvars + 17)
06:adaa : c8 __ __ INY
06:adab : 91 23 __ STA (SP + 0),y 
06:adad : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
06:adb0 : 20 bb 80 JSR $80bb ; (vdc_prints_attr@proxy + 0)
06:adb3 : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
06:adb6 : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
06:adb9 : c9 40 __ CMP #$40
06:adbb : f0 10 __ BEQ $adcd ; (importread.s38 + 0)
.s43:
06:adbd : 85 52 __ STA T3 + 0 
06:adbf : 09 00 __ ORA #$00
06:adc1 : f0 0a __ BEQ $adcd ; (importread.s38 + 0)
.s25:
06:adc3 : a9 01 __ LDA #$01
06:adc5 : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
06:adc8 : a5 52 __ LDA T3 + 0 
06:adca : 4c 15 b0 JMP $b015 ; (importread.s1001 + 0)
.s38:
06:adcd : a5 54 __ LDA T5 + 1 
06:adcf : 85 4f __ STA T0 + 1 
06:add1 : a6 53 __ LDX T5 + 0 
06:add3 : cd de 8a CMP $8ade ; (importvars + 17)
06:add6 : d0 03 __ BNE $addb ; (importread.s1025 + 0)
.s1024:
06:add8 : ec dd 8a CPX $8add ; (importvars + 16)
.s1025:
06:addb : 90 9d __ BCC $ad7a ; (importread.l37 + 0)
.s39:
06:addd : 20 fa 61 JSR $61fa ; (krnio_clrchn.s0 + 0)
06:ade0 : e6 51 __ INC T2 + 0 
.s223:
06:ade2 : ad d9 8a LDA $8ad9 ; (importvars + 12)
06:ade5 : c9 01 __ CMP #$01
06:ade7 : f0 04 __ BEQ $aded ; (importread.s49 + 0)
.s52:
06:ade9 : c9 03 __ CMP #$03
06:adeb : d0 0b __ BNE $adf8 ; (importread.s51 + 0)
.s49:
06:aded : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:adf0 : 0d d4 8a ORA $8ad4 ; (importvars + 7)
06:adf3 : f0 03 __ BEQ $adf8 ; (importread.s51 + 0)
06:adf5 : 4c 3e af JMP $af3e ; (importread.s91 + 0)
.s51:
06:adf8 : a9 01 __ LDA #$01
06:adfa : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
06:adfd : e6 51 __ INC T2 + 0 
06:adff : ad da 8a LDA $8ada ; (importvars + 13)
06:ae02 : c9 01 __ CMP #$01
06:ae04 : f0 0a __ BEQ $ae10 ; (importread.s67 + 0)
.s70:
06:ae06 : ad dc 8a LDA $8adc ; (importvars + 15)
06:ae09 : c9 02 __ CMP #$02
06:ae0b : f0 03 __ BEQ $ae10 ; (importread.s67 + 0)
06:ae0d : 4c e8 ac JMP $ace8 ; (importread.s3 + 0)
.s67:
06:ae10 : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:ae13 : 0d d4 8a ORA $8ad4 ; (importvars + 7)
06:ae16 : d0 03 __ BNE $ae1b ; (importread.s90 + 0)
06:ae18 : 4c e8 ac JMP $ace8 ; (importread.s3 + 0)
.s90:
06:ae1b : a9 00 __ LDA #$00
06:ae1d : 85 4e __ STA T0 + 0 
06:ae1f : 85 4f __ STA T0 + 1 
.l72:
06:ae21 : a9 90 __ LDA #$90
06:ae23 : a0 02 __ LDY #$02
06:ae25 : 91 23 __ STA (SP + 0),y 
06:ae27 : a9 88 __ LDA #$88
06:ae29 : c8 __ __ INY
06:ae2a : 91 23 __ STA (SP + 0),y 
06:ae2c : a9 67 __ LDA #$67
06:ae2e : c8 __ __ INY
06:ae2f : 91 23 __ STA (SP + 0),y 
06:ae31 : a9 b1 __ LDA #$b1
06:ae33 : c8 __ __ INY
06:ae34 : 91 23 __ STA (SP + 0),y 
06:ae36 : ad cf 8a LDA $8acf ; (importvars + 2)
06:ae39 : 18 __ __ CLC
06:ae3a : 65 4e __ ADC T0 + 0 
06:ae3c : 85 03 __ STA WORK + 0 
06:ae3e : ad d0 8a LDA $8ad0 ; (importvars + 3)
06:ae41 : 65 4f __ ADC T0 + 1 
06:ae43 : 85 04 __ STA WORK + 1 
06:ae45 : ad ab 87 LDA $87ab ; (canvas + 3)
06:ae48 : 85 1b __ STA ACCU + 0 
06:ae4a : ad ac 87 LDA $87ac ; (canvas + 4)
06:ae4d : 85 1c __ STA ACCU + 1 
06:ae4f : 20 62 7c JSR $7c62 ; (mul16 + 0)
06:ae52 : 18 __ __ CLC
06:ae53 : a5 06 __ LDA WORK + 3 
06:ae55 : 69 58 __ ADC #$58
06:ae57 : aa __ __ TAX
06:ae58 : ad cd 8a LDA $8acd ; (importvars + 0)
06:ae5b : 18 __ __ CLC
06:ae5c : 65 05 __ ADC WORK + 2 
06:ae5e : 85 55 __ STA T6 + 0 
06:ae60 : 8a __ __ TXA
06:ae61 : 6d ce 8a ADC $8ace ; (importvars + 1)
06:ae64 : 85 56 __ STA T6 + 1 
06:ae66 : ad ad 87 LDA $87ad ; (canvas + 5)
06:ae69 : 85 1b __ STA ACCU + 0 
06:ae6b : ad ae 87 LDA $87ae ; (canvas + 6)
06:ae6e : 85 1c __ STA ACCU + 1 
06:ae70 : ad ab 87 LDA $87ab ; (canvas + 3)
06:ae73 : 85 03 __ STA WORK + 0 
06:ae75 : ad ac 87 LDA $87ac ; (canvas + 4)
06:ae78 : 85 04 __ STA WORK + 1 
06:ae7a : 20 62 7c JSR $7c62 ; (mul16 + 0)
06:ae7d : 18 __ __ CLC
06:ae7e : a5 05 __ LDA WORK + 2 
06:ae80 : 65 55 __ ADC T6 + 0 
06:ae82 : aa __ __ TAX
06:ae83 : a5 06 __ LDA WORK + 3 
06:ae85 : 65 56 __ ADC T6 + 1 
06:ae87 : 85 56 __ STA T6 + 1 
06:ae89 : 8a __ __ TXA
06:ae8a : 18 __ __ CLC
06:ae8b : 69 30 __ ADC #$30
06:ae8d : 85 55 __ STA T6 + 0 
06:ae8f : a0 0a __ LDY #$0a
06:ae91 : 91 23 __ STA (SP + 0),y 
06:ae93 : a5 56 __ LDA T6 + 1 
06:ae95 : 69 00 __ ADC #$00
06:ae97 : 85 56 __ STA T6 + 1 
06:ae99 : c8 __ __ INY
06:ae9a : 91 23 __ STA (SP + 0),y 
06:ae9c : 18 __ __ CLC
06:ae9d : a5 4e __ LDA T0 + 0 
06:ae9f : 69 01 __ ADC #$01
06:aea1 : a0 06 __ LDY #$06
06:aea3 : 91 23 __ STA (SP + 0),y 
06:aea5 : a5 4f __ LDA T0 + 1 
06:aea7 : 69 00 __ ADC #$00
06:aea9 : c8 __ __ INY
06:aeaa : 91 23 __ STA (SP + 0),y 
06:aeac : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:aeaf : c8 __ __ INY
06:aeb0 : 91 23 __ STA (SP + 0),y 
06:aeb2 : ad d4 8a LDA $8ad4 ; (importvars + 7)
06:aeb5 : c8 __ __ INY
06:aeb6 : 91 23 __ STA (SP + 0),y 
06:aeb8 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
06:aebb : 20 bb 80 JSR $80bb ; (vdc_prints_attr@proxy + 0)
06:aebe : ad d1 8a LDA $8ad1 ; (importvars + 4)
06:aec1 : 0d d2 8a ORA $8ad2 ; (importvars + 5)
06:aec4 : f0 08 __ BEQ $aece ; (importread.s73 + 0)
.s89:
06:aec6 : a9 00 __ LDA #$00
06:aec8 : 85 57 __ STA T7 + 0 
06:aeca : 85 58 __ STA T7 + 1 
06:aecc : f0 1a __ BEQ $aee8 ; (importread.l79 + 0)
.s73:
06:aece : e6 4e __ INC T0 + 0 
06:aed0 : d0 02 __ BNE $aed4 ; (importread.s1046 + 0)
.s1045:
06:aed2 : e6 4f __ INC T0 + 1 
.s1046:
06:aed4 : a5 4f __ LDA T0 + 1 
06:aed6 : cd d4 8a CMP $8ad4 ; (importvars + 7)
06:aed9 : d0 05 __ BNE $aee0 ; (importread.s1005 + 0)
.s1004:
06:aedb : a5 4e __ LDA T0 + 0 
06:aedd : cd d3 8a CMP $8ad3 ; (importvars + 6)
.s1005:
06:aee0 : b0 03 __ BCS $aee5 ; (importread.s1005 + 5)
06:aee2 : 4c 21 ae JMP $ae21 ; (importread.l72 + 0)
06:aee5 : 4c e8 ac JMP $ace8 ; (importread.s3 + 0)
.l79:
06:aee8 : a9 7f __ LDA #$7f
06:aeea : 85 0d __ STA P0 
06:aeec : a5 55 __ LDA T6 + 0 
06:aeee : 85 0e __ STA P1 
06:aef0 : a5 56 __ LDA T6 + 1 
06:aef2 : 85 0f __ STA P2 
06:aef4 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
06:aef7 : aa __ __ TAX
06:aef8 : a5 0e __ LDA P1 
06:aefa : 85 0d __ STA P0 
06:aefc : a5 0f __ LDA P2 
06:aefe : 85 0e __ STA P1 
06:af00 : ad da 8a LDA $8ada ; (importvars + 13)
06:af03 : c9 01 __ CMP #$01
06:af05 : d0 07 __ BNE $af0e ; (importread.s231 + 0)
.s82:
06:af07 : 8a __ __ TXA
06:af08 : 29 0f __ AND #$0f
06:af0a : a8 __ __ TAY
06:af0b : be c6 ab LDX $abc6,y ; (buff + 33)
.s231:
06:af0e : ad dc 8a LDA $8adc ; (importvars + 15)
06:af11 : c9 02 __ CMP #$02
06:af13 : f0 04 __ BEQ $af19 ; (importread.s85 + 0)
.s87:
06:af15 : 8a __ __ TXA
06:af16 : 4c 1c af JMP $af1c ; (importread.s1038 + 0)
.s85:
06:af19 : 8a __ __ TXA
06:af1a : 09 80 __ ORA #$80
.s1038:
06:af1c : 85 0f __ STA P2 
06:af1e : 20 10 15 JSR $1510 ; (bnk_writeb.s0 + 0)
06:af21 : e6 55 __ INC T6 + 0 
06:af23 : d0 02 __ BNE $af27 ; (importread.s1042 + 0)
.s1041:
06:af25 : e6 56 __ INC T6 + 1 
.s1042:
06:af27 : e6 57 __ INC T7 + 0 
06:af29 : d0 02 __ BNE $af2d ; (importread.s1044 + 0)
.s1043:
06:af2b : e6 58 __ INC T7 + 1 
.s1044:
06:af2d : a5 58 __ LDA T7 + 1 
06:af2f : cd d2 8a CMP $8ad2 ; (importvars + 5)
06:af32 : d0 05 __ BNE $af39 ; (importread.s1007 + 0)
.s1006:
06:af34 : a5 57 __ LDA T7 + 0 
06:af36 : cd d1 8a CMP $8ad1 ; (importvars + 4)
.s1007:
06:af39 : 90 ad __ BCC $aee8 ; (importread.l79 + 0)
06:af3b : 4c ce ae JMP $aece ; (importread.s73 + 0)
.s91:
06:af3e : ad cf 8a LDA $8acf ; (importvars + 2)
06:af41 : 85 03 __ STA WORK + 0 
06:af43 : ad d0 8a LDA $8ad0 ; (importvars + 3)
06:af46 : 85 04 __ STA WORK + 1 
06:af48 : ad ab 87 LDA $87ab ; (canvas + 3)
06:af4b : 85 1b __ STA ACCU + 0 
06:af4d : ad ac 87 LDA $87ac ; (canvas + 4)
06:af50 : 85 1c __ STA ACCU + 1 
06:af52 : 20 62 7c JSR $7c62 ; (mul16 + 0)
06:af55 : 18 __ __ CLC
06:af56 : a5 06 __ LDA WORK + 3 
06:af58 : 69 58 __ ADC #$58
06:af5a : aa __ __ TAX
06:af5b : ad cd 8a LDA $8acd ; (importvars + 0)
06:af5e : 18 __ __ CLC
06:af5f : 65 05 __ ADC WORK + 2 
06:af61 : 85 4e __ STA T0 + 0 
06:af63 : 8a __ __ TXA
06:af64 : 6d ce 8a ADC $8ace ; (importvars + 1)
06:af67 : 85 4f __ STA T0 + 1 
06:af69 : ad ad 87 LDA $87ad ; (canvas + 5)
06:af6c : 85 1b __ STA ACCU + 0 
06:af6e : ad ae 87 LDA $87ae ; (canvas + 6)
06:af71 : 85 1c __ STA ACCU + 1 
06:af73 : ad ab 87 LDA $87ab ; (canvas + 3)
06:af76 : 85 03 __ STA WORK + 0 
06:af78 : ad ac 87 LDA $87ac ; (canvas + 4)
06:af7b : 85 04 __ STA WORK + 1 
06:af7d : 20 62 7c JSR $7c62 ; (mul16 + 0)
06:af80 : 18 __ __ CLC
06:af81 : a5 05 __ LDA WORK + 2 
06:af83 : 65 4e __ ADC T0 + 0 
06:af85 : aa __ __ TAX
06:af86 : a5 06 __ LDA WORK + 3 
06:af88 : 65 4f __ ADC T0 + 1 
06:af8a : a8 __ __ TAY
06:af8b : 8a __ __ TXA
06:af8c : 18 __ __ CLC
06:af8d : 69 30 __ ADC #$30
06:af8f : 85 4e __ STA T0 + 0 
06:af91 : 90 01 __ BCC $af94 ; (importread.s1040 + 0)
.s1039:
06:af93 : c8 __ __ INY
.s1040:
06:af94 : 84 4f __ STY T0 + 1 
06:af96 : a9 00 __ LDA #$00
06:af98 : 85 50 __ STA T1 + 0 
.l56:
06:af9a : a5 4e __ LDA T0 + 0 
06:af9c : a0 0a __ LDY #$0a
06:af9e : 91 23 __ STA (SP + 0),y 
06:afa0 : a5 4f __ LDA T0 + 1 
06:afa2 : c8 __ __ INY
06:afa3 : 91 23 __ STA (SP + 0),y 
06:afa5 : a9 90 __ LDA #$90
06:afa7 : a0 02 __ LDY #$02
06:afa9 : 91 23 __ STA (SP + 0),y 
06:afab : a9 88 __ LDA #$88
06:afad : c8 __ __ INY
06:afae : 91 23 __ STA (SP + 0),y 
06:afb0 : a9 42 __ LDA #$42
06:afb2 : c8 __ __ INY
06:afb3 : 91 23 __ STA (SP + 0),y 
06:afb5 : a9 b1 __ LDA #$b1
06:afb7 : c8 __ __ INY
06:afb8 : 91 23 __ STA (SP + 0),y 
06:afba : 18 __ __ CLC
06:afbb : a5 50 __ LDA T1 + 0 
06:afbd : 69 01 __ ADC #$01
06:afbf : c8 __ __ INY
06:afc0 : 91 23 __ STA (SP + 0),y 
06:afc2 : a9 00 __ LDA #$00
06:afc4 : 2a __ __ ROL
06:afc5 : c8 __ __ INY
06:afc6 : 91 23 __ STA (SP + 0),y 
06:afc8 : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:afcb : c8 __ __ INY
06:afcc : 91 23 __ STA (SP + 0),y 
06:afce : ad d4 8a LDA $8ad4 ; (importvars + 7)
06:afd1 : c8 __ __ INY
06:afd2 : 91 23 __ STA (SP + 0),y 
06:afd4 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
06:afd7 : 20 bb 80 JSR $80bb ; (vdc_prints_attr@proxy + 0)
06:afda : 20 7f 19 JSR $197f ; (bnk_io_read@proxy + 0)
06:afdd : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
06:afe0 : c9 40 __ CMP #$40
06:afe2 : f0 29 __ BEQ $b00d ; (importread.s60 + 0)
.s62:
06:afe4 : 85 52 __ STA T3 + 0 
06:afe6 : 09 00 __ ORA #$00
06:afe8 : f0 03 __ BEQ $afed ; (importread.s65 + 0)
06:afea : 4c c3 ad JMP $adc3 ; (importread.s25 + 0)
.s65:
06:afed : 18 __ __ CLC
06:afee : a5 4e __ LDA T0 + 0 
06:aff0 : 6d ab 87 ADC $87ab ; (canvas + 3)
06:aff3 : 85 4e __ STA T0 + 0 
06:aff5 : a5 0f __ LDA P2 
06:aff7 : 6d ac 87 ADC $87ac ; (canvas + 4)
06:affa : 85 4f __ STA T0 + 1 
06:affc : e6 50 __ INC T1 + 0 
06:affe : ad d4 8a LDA $8ad4 ; (importvars + 7)
06:b001 : d0 97 __ BNE $af9a ; (importread.l56 + 0)
.s1016:
06:b003 : a5 50 __ LDA T1 + 0 
06:b005 : cd d3 8a CMP $8ad3 ; (importvars + 6)
06:b008 : 90 90 __ BCC $af9a ; (importread.l56 + 0)
06:b00a : 4c f8 ad JMP $adf8 ; (importread.s51 + 0)
.s60:
06:b00d : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:b010 : 85 50 __ STA T1 + 0 
06:b012 : 4c ed af JMP $afed ; (importread.s65 + 0)
.s1001:
06:b015 : 85 1b __ STA ACCU + 0 
06:b017 : 18 __ __ CLC
06:b018 : a5 23 __ LDA SP + 0 
06:b01a : 69 0c __ ADC #$0c
06:b01c : 85 23 __ STA SP + 0 
06:b01e : 90 02 __ BCC $b022 ; (importread.s1001 + 13)
06:b020 : e6 24 __ INC SP + 1 
06:b022 : a2 05 __ LDX #$05
06:b024 : bd bf ab LDA $abbf,x ; (projbuffer + 39)
06:b027 : 95 53 __ STA T5 + 0,x 
06:b029 : ca __ __ DEX
06:b02a : 10 f8 __ BPL $b024 ; (importread.s1001 + 15)
06:b02c : 60 __ __ RTS
.s93:
06:b02d : ad ab 87 LDA $87ab ; (canvas + 3)
06:b030 : 85 1b __ STA ACCU + 0 
06:b032 : ad ac 87 LDA $87ac ; (canvas + 4)
06:b035 : 85 1c __ STA ACCU + 1 
06:b037 : ad cf 8a LDA $8acf ; (importvars + 2)
06:b03a : 85 03 __ STA WORK + 0 
06:b03c : ad d0 8a LDA $8ad0 ; (importvars + 3)
06:b03f : 85 04 __ STA WORK + 1 
06:b041 : 20 62 7c JSR $7c62 ; (mul16 + 0)
06:b044 : 18 __ __ CLC
06:b045 : a5 06 __ LDA WORK + 3 
06:b047 : 69 58 __ ADC #$58
06:b049 : aa __ __ TAX
06:b04a : ad cd 8a LDA $8acd ; (importvars + 0)
06:b04d : 18 __ __ CLC
06:b04e : 65 05 __ ADC WORK + 2 
06:b050 : 85 4e __ STA T0 + 0 
06:b052 : 8a __ __ TXA
06:b053 : 6d ce 8a ADC $8ace ; (importvars + 1)
06:b056 : 85 4f __ STA T0 + 1 
06:b058 : a9 00 __ LDA #$00
06:b05a : 85 50 __ STA T1 + 0 
.l18:
06:b05c : a5 4e __ LDA T0 + 0 
06:b05e : a0 0a __ LDY #$0a
06:b060 : 91 23 __ STA (SP + 0),y 
06:b062 : a5 4f __ LDA T0 + 1 
06:b064 : c8 __ __ INY
06:b065 : 91 23 __ STA (SP + 0),y 
06:b067 : a9 90 __ LDA #$90
06:b069 : a0 02 __ LDY #$02
06:b06b : 91 23 __ STA (SP + 0),y 
06:b06d : a9 88 __ LDA #$88
06:b06f : c8 __ __ INY
06:b070 : 91 23 __ STA (SP + 0),y 
06:b072 : a9 00 __ LDA #$00
06:b074 : c8 __ __ INY
06:b075 : 91 23 __ STA (SP + 0),y 
06:b077 : a9 b1 __ LDA #$b1
06:b079 : c8 __ __ INY
06:b07a : 91 23 __ STA (SP + 0),y 
06:b07c : 18 __ __ CLC
06:b07d : a5 50 __ LDA T1 + 0 
06:b07f : 69 01 __ ADC #$01
06:b081 : c8 __ __ INY
06:b082 : 91 23 __ STA (SP + 0),y 
06:b084 : a9 00 __ LDA #$00
06:b086 : 2a __ __ ROL
06:b087 : c8 __ __ INY
06:b088 : 91 23 __ STA (SP + 0),y 
06:b08a : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:b08d : c8 __ __ INY
06:b08e : 91 23 __ STA (SP + 0),y 
06:b090 : ad d4 8a LDA $8ad4 ; (importvars + 7)
06:b093 : c8 __ __ INY
06:b094 : 91 23 __ STA (SP + 0),y 
06:b096 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
06:b099 : 20 bb 80 JSR $80bb ; (vdc_prints_attr@proxy + 0)
06:b09c : 20 7f 19 JSR $197f ; (bnk_io_read@proxy + 0)
06:b09f : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
06:b0a2 : c9 40 __ CMP #$40
06:b0a4 : f0 29 __ BEQ $b0cf ; (importread.s22 + 0)
.s24:
06:b0a6 : 85 52 __ STA T3 + 0 
06:b0a8 : 09 00 __ ORA #$00
06:b0aa : f0 03 __ BEQ $b0af ; (importread.s27 + 0)
06:b0ac : 4c c3 ad JMP $adc3 ; (importread.s25 + 0)
.s27:
06:b0af : 18 __ __ CLC
06:b0b0 : a5 4e __ LDA T0 + 0 
06:b0b2 : 6d ab 87 ADC $87ab ; (canvas + 3)
06:b0b5 : 85 4e __ STA T0 + 0 
06:b0b7 : a5 0f __ LDA P2 
06:b0b9 : 6d ac 87 ADC $87ac ; (canvas + 4)
06:b0bc : 85 4f __ STA T0 + 1 
06:b0be : e6 50 __ INC T1 + 0 
06:b0c0 : ad d4 8a LDA $8ad4 ; (importvars + 7)
06:b0c3 : d0 97 __ BNE $b05c ; (importread.l18 + 0)
.s1030:
06:b0c5 : a5 50 __ LDA T1 + 0 
06:b0c7 : cd d3 8a CMP $8ad3 ; (importvars + 6)
06:b0ca : 90 90 __ BCC $b05c ; (importread.l18 + 0)
06:b0cc : 4c 43 ad JMP $ad43 ; (importread.s20 + 0)
.s22:
06:b0cf : a9 02 __ LDA #$02
06:b0d1 : 8d d9 8a STA $8ad9 ; (importvars + 12)
06:b0d4 : ad d3 8a LDA $8ad3 ; (importvars + 6)
06:b0d7 : 85 50 __ STA T1 + 0 
06:b0d9 : 4c af b0 JMP $b0af ; (importread.s27 + 0)
--------------------------------------------------------------------
06:b0dc : __ __ __ BYT 25 53 2c 50 2c 52 00                            : %S,P,R.
--------------------------------------------------------------------
06:b0e3 : __ __ __ BYT 73 4b 49 50 50 49 4e 47 20 4c 4f 41 44 20 41 44 : sKIPPING LOAD AD
06:b0f3 : __ __ __ BYT 44 52 45 53 53 2e 00                            : DRESS..
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
07:ac1a : ad fe 86 LDA $86fe ; (showbar + 0)
07:ac1d : 85 53 __ STA T0 + 0 
07:ac1f : a9 00 __ LDA #$00
07:ac21 : 8d fe 86 STA $86fe ; (showbar + 0)
07:ac24 : a9 ae __ LDA #$ae
07:ac26 : 8d fe ab STA $abfe ; (sstack + 11)
07:ac29 : a9 ad __ LDA #$ad
07:ac2b : 8d ff ab STA $abff ; (sstack + 12)
07:ac2e : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
07:ac31 : 85 55 __ STA T2 + 0 
07:ac33 : ad f1 86 LDA $86f1 ; (plotcolor + 0)
07:ac36 : 85 56 __ STA T3 + 0 
07:ac38 : ad f4 86 LDA $86f4 ; (plotblink + 0)
07:ac3b : 85 57 __ STA T4 + 0 
07:ac3d : ad f3 86 LDA $86f3 ; (plotunderline + 0)
07:ac40 : 85 58 __ STA T5 + 0 
07:ac42 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
07:ac45 : 85 59 __ STA T6 + 0 
07:ac47 : ad eb 86 LDA $86eb ; (screen_col + 0)
07:ac4a : 85 54 __ STA T1 + 0 
07:ac4c : ad ed 86 LDA $86ed ; (screen_row + 0)
07:ac4f : 85 5a __ STA T7 + 0 
07:ac51 : ad af 87 LDA $87af ; (canvas + 7)
07:ac54 : 85 5b __ STA T8 + 0 
07:ac56 : 20 27 72 JSR $7227 ; (import_dialogue.s1000 + 0)
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
07:ac73 : ad fe 7a LDA $7afe ; (undoenabled + 0)
07:ac76 : c9 01 __ CMP #$01
07:ac78 : d0 18 __ BNE $ac92 ; (import_seq.s6 + 0)
.s4:
07:ac7a : ad cf 8a LDA $8acf ; (importvars + 2)
07:ac7d : 85 16 __ STA P9 
07:ac7f : ad cd 8a LDA $8acd ; (importvars + 0)
07:ac82 : 85 17 __ STA P10 
07:ac84 : ad d1 8a LDA $8ad1 ; (importvars + 4)
07:ac87 : 85 18 __ STA P11 
07:ac89 : ad d3 8a LDA $8ad3 ; (importvars + 6)
07:ac8c : 8d f3 ab STA $abf3 ; (sstack + 0)
07:ac8f : 20 26 52 JSR $5226 ; (undo_new.s1000 + 0)
.s6:
07:ac92 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
07:ac95 : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
07:ac98 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
07:ac9b : a9 20 __ LDA #$20
07:ac9d : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
07:aca0 : a9 00 __ LDA #$00
07:aca2 : 8d f2 86 STA $86f2 ; (plotreverse + 0)
07:aca5 : 8d f4 86 STA $86f4 ; (plotblink + 0)
07:aca8 : 8d f3 86 STA $86f3 ; (plotunderline + 0)
07:acab : a9 0f __ LDA #$0f
07:acad : 8d f1 86 STA $86f1 ; (plotcolor + 0)
07:acb0 : ad dc 8a LDA $8adc ; (importvars + 15)
07:acb3 : c9 01 __ CMP #$01
07:acb5 : d0 04 __ BNE $acbb ; (import_seq.s34 + 0)
.s33:
07:acb7 : a9 00 __ LDA #$00
07:acb9 : f0 02 __ BEQ $acbd ; (import_seq.s35 + 0)
.s34:
07:acbb : a9 01 __ LDA #$01
.s35:
07:acbd : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
07:acc0 : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
07:acc3 : a9 90 __ LDA #$90
07:acc5 : a0 02 __ LDY #$02
07:acc7 : 91 23 __ STA (SP + 0),y 
07:acc9 : a9 88 __ LDA #$88
07:accb : c8 __ __ INY
07:accc : 91 23 __ STA (SP + 0),y 
07:acce : a9 a7 __ LDA #$a7
07:acd0 : c8 __ __ INY
07:acd1 : 91 23 __ STA (SP + 0),y 
07:acd3 : a9 ae __ LDA #$ae
07:acd5 : c8 __ __ INY
07:acd6 : 91 23 __ STA (SP + 0),y 
07:acd8 : a9 7a __ LDA #$7a
07:acda : c8 __ __ INY
07:acdb : 91 23 __ STA (SP + 0),y 
07:acdd : a9 87 __ LDA #$87
07:acdf : c8 __ __ INY
07:ace0 : 91 23 __ STA (SP + 0),y 
07:ace2 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
07:ace5 : a9 00 __ LDA #$00
07:ace7 : 85 0d __ STA P0 
07:ace9 : 85 0e __ STA P1 
07:aceb : 20 b4 2a JSR $2ab4 ; (krnio_setbnk.s0 + 0)
07:acee : 20 bb 2a JSR $2abb ; (krnio_setnam@proxy + 0)
07:acf1 : ad f6 86 LDA $86f6 ; (targetdevice + 0)
07:acf4 : 85 0e __ STA P1 
07:acf6 : 20 33 63 JSR $6333 ; (krnio_open@proxy + 0)
07:acf9 : 09 00 __ ORA #$00
07:acfb : f0 4c __ BEQ $ad49 ; (import_seq.s10 + 0)
.s8:
07:acfd : a9 01 __ LDA #$01
07:acff : 20 dd 63 JSR $63dd ; (krnio_chkin.s1000 + 0)
07:ad02 : 09 00 __ ORA #$00
07:ad04 : d0 08 __ BNE $ad0e ; (import_seq.l14 + 0)
.s12:
07:ad06 : a9 01 __ LDA #$01
07:ad08 : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
07:ad0b : 4c 46 ad JMP $ad46 ; (import_seq.s59 + 0)
.l14:
07:ad0e : 20 f1 63 JSR $63f1 ; (krnio_chrin.s0 + 0)
07:ad11 : a5 1b __ LDA ACCU + 0 
07:ad13 : 85 5d __ STA T10 + 0 
07:ad15 : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
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
07:ad38 : 20 fa 61 JSR $61fa ; (krnio_clrchn.s0 + 0)
07:ad3b : a9 01 __ LDA #$01
07:ad3d : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
07:ad40 : a5 5c __ LDA T9 + 0 
07:ad42 : c9 40 __ CMP #$40
07:ad44 : f0 03 __ BEQ $ad49 ; (import_seq.s10 + 0)
.s59:
07:ad46 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s10:
07:ad49 : a5 53 __ LDA T0 + 0 
07:ad4b : 8d fe 86 STA $86fe ; (showbar + 0)
07:ad4e : a5 55 __ LDA T2 + 0 
07:ad50 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
07:ad53 : a5 56 __ LDA T3 + 0 
07:ad55 : 8d f1 86 STA $86f1 ; (plotcolor + 0)
07:ad58 : a5 57 __ LDA T4 + 0 
07:ad5a : 8d f4 86 STA $86f4 ; (plotblink + 0)
07:ad5d : a5 58 __ LDA T5 + 0 
07:ad5f : 8d f3 86 STA $86f3 ; (plotunderline + 0)
07:ad62 : a5 59 __ LDA T6 + 0 
07:ad64 : 8d f2 86 STA $86f2 ; (plotreverse + 0)
07:ad67 : a5 54 __ LDA T1 + 0 
07:ad69 : 8d eb 86 STA $86eb ; (screen_col + 0)
07:ad6c : a9 00 __ LDA #$00
07:ad6e : 8d ec 86 STA $86ec ; (screen_col + 1)
07:ad71 : 8d ee 86 STA $86ee ; (screen_row + 1)
07:ad74 : 8d b0 87 STA $87b0 ; (canvas + 8)
07:ad77 : a5 5a __ LDA T7 + 0 
07:ad79 : 8d ed 86 STA $86ed ; (screen_row + 0)
07:ad7c : a5 5b __ LDA T8 + 0 
07:ad7e : 8d af 87 STA $87af ; (canvas + 7)
07:ad81 : 20 14 3d JSR $3d14 ; (placesignature.s1000 + 0)
07:ad84 : 20 83 80 JSR $8083 ; (vdcwin_cpy_viewport@proxy + 0)
07:ad87 : a9 00 __ LDA #$00
07:ad89 : 85 17 __ STA P10 
07:ad8b : 85 18 __ STA P11 
07:ad8d : 8d f3 ab STA $abf3 ; (sstack + 0)
07:ad90 : a9 01 __ LDA #$01
07:ad92 : 8d f5 ab STA $abf5 ; (sstack + 2)
07:ad95 : ad 92 87 LDA $8792 ; (vdc_state + 3)
07:ad98 : 8d f4 ab STA $abf4 ; (sstack + 1)
07:ad9b : 20 60 36 JSR $3660 ; (vdcwin_win_new.s1000 + 0)
07:ad9e : 20 e7 51 JSR $51e7 ; (menu_placebar@proxy + 0)
07:ada1 : a5 53 __ LDA T0 + 0 
07:ada3 : d0 03 __ BNE $ada8 ; (import_seq.s23 + 0)
07:ada5 : 4c 5d ac JMP $ac5d ; (import_seq.s1001 + 0)
.s23:
07:ada8 : 20 d0 3e JSR $3ed0 ; (initstatusbar.s1000 + 0)
07:adab : 4c 5d ac JMP $ac5d ; (import_seq.s1001 + 0)
--------------------------------------------------------------------
07:adae : __ __ __ BYT 69 4d 50 4f 52 54 20 73 65 71 00                : iMPORT seq.
--------------------------------------------------------------------
rebase: ; rebase()->void
.s0:
07:adb9 : ad d5 8a LDA $8ad5 ; (importvars + 8)
07:adbc : 18 __ __ CLC
07:adbd : 6d cd 8a ADC $8acd ; (importvars + 0)
07:adc0 : 85 43 __ STA T0 + 0 
07:adc2 : 8d eb 86 STA $86eb ; (screen_col + 0)
07:adc5 : ad d6 8a LDA $8ad6 ; (importvars + 9)
07:adc8 : 6d ce 8a ADC $8ace ; (importvars + 1)
07:adcb : 85 44 __ STA T0 + 1 
07:adcd : 8d ec 86 STA $86ec ; (screen_col + 1)
07:add0 : ad af 87 LDA $87af ; (canvas + 7)
07:add3 : 85 45 __ STA T1 + 0 
07:add5 : a9 00 __ LDA #$00
07:add7 : 8d af 87 STA $87af ; (canvas + 7)
07:adda : 8d b0 87 STA $87b0 ; (canvas + 8)
07:addd : ad b1 87 LDA $87b1 ; (canvas + 9)
07:ade0 : 85 47 __ STA T2 + 0 
07:ade2 : a9 00 __ LDA #$00
07:ade4 : 8d b1 87 STA $87b1 ; (canvas + 9)
07:ade7 : 8d b2 87 STA $87b2 ; (canvas + 10)
07:adea : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:aded : 18 __ __ CLC
07:adee : 6d cf 8a ADC $8acf ; (importvars + 2)
07:adf1 : 85 49 __ STA T3 + 0 
07:adf3 : 8d ed 86 STA $86ed ; (screen_row + 0)
07:adf6 : ad d8 8a LDA $8ad8 ; (importvars + 11)
07:adf9 : 6d d0 8a ADC $8ad0 ; (importvars + 3)
07:adfc : 85 4a __ STA T3 + 1 
07:adfe : 8d ee 86 STA $86ee ; (screen_row + 1)
07:ae01 : ad 92 87 LDA $8792 ; (vdc_state + 3)
07:ae04 : 38 __ __ SEC
07:ae05 : e9 01 __ SBC #$01
07:ae07 : 85 1b __ STA ACCU + 0 
07:ae09 : ad 93 87 LDA $8793 ; (vdc_state + 4)
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
07:ae36 : 8e af 87 STX $87af ; (canvas + 7)
07:ae39 : 8c b0 87 STY $87b0 ; (canvas + 8)
07:ae3c : a5 43 __ LDA T0 + 0 
07:ae3e : 8d eb 86 STA $86eb ; (screen_col + 0)
07:ae41 : a5 44 __ LDA T0 + 1 
07:ae43 : 8d ec 86 STA $86ec ; (screen_col + 1)
.s3:
07:ae46 : ad 94 87 LDA $8794 ; (vdc_state + 5)
07:ae49 : 38 __ __ SEC
07:ae4a : e9 01 __ SBC #$01
07:ae4c : 85 43 __ STA T0 + 0 
07:ae4e : ad 95 87 LDA $8795 ; (vdc_state + 6)
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
07:ae7b : 8e b1 87 STX $87b1 ; (canvas + 9)
07:ae7e : 8c b2 87 STY $87b2 ; (canvas + 10)
07:ae81 : a5 49 __ LDA T3 + 0 
07:ae83 : 8d ed 86 STA $86ed ; (screen_row + 0)
07:ae86 : a5 4a __ LDA T3 + 1 
07:ae88 : 8d ee 86 STA $86ee ; (screen_row + 1)
.s6:
07:ae8b : ad b0 87 LDA $87b0 ; (canvas + 8)
07:ae8e : d0 13 __ BNE $aea3 ; (rebase.s7 + 0)
.s1004:
07:ae90 : a5 45 __ LDA T1 + 0 
07:ae92 : cd af 87 CMP $87af ; (canvas + 7)
07:ae95 : d0 0c __ BNE $aea3 ; (rebase.s7 + 0)
.s10:
07:ae97 : ad b2 87 LDA $87b2 ; (canvas + 10)
07:ae9a : d0 07 __ BNE $aea3 ; (rebase.s7 + 0)
.s1002:
07:ae9c : a5 47 __ LDA T2 + 0 
07:ae9e : cd b1 87 CMP $87b1 ; (canvas + 9)
07:aea1 : f0 03 __ BEQ $aea6 ; (rebase.s1001 + 0)
.s7:
07:aea3 : 4c 83 80 JMP $8083 ; (vdcwin_cpy_viewport@proxy + 0)
.s1001:
07:aea6 : 60 __ __ RTS
--------------------------------------------------------------------
07:aea7 : __ __ __ BYT 25 53 2c 53 2c 52 00                            : %S,S,R.
--------------------------------------------------------------------
decode_controlcode: ; decode_controlcode(u8)->void
.s1000:
07:aeae : a2 05 __ LDX #$05
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
07:aec1 : 4c b5 b2 JMP $b2b5 ; (decode_controlcode.s1122 + 0)
.s80:
07:aec4 : aa __ __ TAX
07:aec5 : b0 03 __ BCS $aeca ; (decode_controlcode.s81 + 0)
07:aec7 : 4c a5 b1 JMP $b1a5 ; (decode_controlcode.s82 + 0)
.s81:
07:aeca : c9 98 __ CMP #$98
07:aecc : d0 03 __ BNE $aed1 ; (decode_controlcode.s112 + 0)
07:aece : 4c 98 b1 JMP $b198 ; (decode_controlcode.s40 + 0)
.s112:
07:aed1 : b0 03 __ BCS $aed6 ; (decode_controlcode.s113 + 0)
07:aed3 : 4c 70 b0 JMP $b070 ; (decode_controlcode.s114 + 0)
.s113:
07:aed6 : c9 9c __ CMP #$9c
07:aed8 : d0 03 __ BNE $aedd ; (decode_controlcode.s126 + 0)
07:aeda : 4c 61 b0 JMP $b061 ; (decode_controlcode.s44 + 0)
.s126:
07:aedd : b0 03 __ BCS $aee2 ; (decode_controlcode.s127 + 0)
07:aedf : 4c 4f b0 JMP $b04f ; (decode_controlcode.s128 + 0)
.s127:
07:aee2 : c9 9e __ CMP #$9e
07:aee4 : d0 05 __ BNE $aeeb ; (decode_controlcode.s132 + 0)
.s46:
07:aee6 : a9 0d __ LDA #$0d
07:aee8 : 4c 49 b0 JMP $b049 ; (decode_controlcode.s1126 + 0)
.s132:
07:aeeb : b0 0a __ BCS $aef7 ; (decode_controlcode.s133 + 0)
.s45:
07:aeed : a9 01 __ LDA #$01
07:aeef : 8d f3 ab STA $abf3 ; (sstack + 0)
07:aef2 : a9 00 __ LDA #$00
07:aef4 : 4c 2e b0 JMP $b02e ; (decode_controlcode.s187 + 0)
.s133:
07:aef7 : c9 9f __ CMP #$9f
07:aef9 : d0 05 __ BNE $af00 ; (decode_controlcode.s49 + 0)
.s47:
07:aefb : a9 07 __ LDA #$07
07:aefd : 4c 49 b0 JMP $b049 ; (decode_controlcode.s1126 + 0)
.s49:
07:af00 : ad ed 86 LDA $86ed ; (screen_row + 0)
07:af03 : 85 55 __ STA T3 + 0 
07:af05 : 18 __ __ CLC
07:af06 : 6d b1 87 ADC $87b1 ; (canvas + 9)
07:af09 : 85 10 __ STA P3 
07:af0b : ad eb 86 LDA $86eb ; (screen_col + 0)
07:af0e : 85 56 __ STA T4 + 0 
07:af10 : 18 __ __ CLC
07:af11 : 6d af 87 ADC $87af ; (canvas + 7)
07:af14 : 85 11 __ STA P4 
07:af16 : ad f4 86 LDA $86f4 ; (plotblink + 0)
07:af19 : 0a __ __ ASL
07:af1a : 0a __ __ ASL
07:af1b : 0a __ __ ASL
07:af1c : 0a __ __ ASL
07:af1d : 18 __ __ CLC
07:af1e : 6d f1 86 ADC $86f1 ; (plotcolor + 0)
07:af21 : 85 44 __ STA T5 + 0 
07:af23 : ad f3 86 LDA $86f3 ; (plotunderline + 0)
07:af26 : 4a __ __ LSR
07:af27 : 6a __ __ ROR
07:af28 : 6a __ __ ROR
07:af29 : 29 c0 __ AND #$c0
07:af2b : 6a __ __ ROR
07:af2c : 65 44 __ ADC T5 + 0 
07:af2e : 85 44 __ STA T5 + 0 
07:af30 : ad f2 86 LDA $86f2 ; (plotreverse + 0)
07:af33 : 4a __ __ LSR
07:af34 : 6a __ __ ROR
07:af35 : 29 80 __ AND #$80
07:af37 : 6a __ __ ROR
07:af38 : 65 44 __ ADC T5 + 0 
07:af3a : 85 44 __ STA T5 + 0 
07:af3c : ad f5 86 LDA $86f5 ; (plotaltchar + 0)
07:af3f : 4a __ __ LSR
07:af40 : a9 00 __ LDA #$00
07:af42 : 6a __ __ ROR
07:af43 : 65 44 __ ADC T5 + 0 
07:af45 : 85 13 __ STA P6 
07:af47 : 8a __ __ TXA
07:af48 : e0 20 __ CPX #$20
07:af4a : 90 13 __ BCC $af5f ; (decode_controlcode.s56 + 0)
.s53:
07:af4c : c9 40 __ CMP #$40
07:af4e : b0 05 __ BCS $af55 ; (decode_controlcode.s57 + 0)
.s50:
07:af50 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
07:af53 : 90 0a __ BCC $af5f ; (decode_controlcode.s56 + 0)
.s57:
07:af55 : c9 60 __ CMP #$60
07:af57 : b0 06 __ BCS $af5f ; (decode_controlcode.s56 + 0)
.s54:
07:af59 : 38 __ __ SEC
07:af5a : e9 40 __ SBC #$40
07:af5c : 4c 6a af JMP $af6a ; (decode_controlcode.s185 + 0)
.s56:
07:af5f : c9 60 __ CMP #$60
07:af61 : 90 0a __ BCC $af6d ; (decode_controlcode.s60 + 0)
.s61:
07:af63 : c9 80 __ CMP #$80
07:af65 : b0 06 __ BCS $af6d ; (decode_controlcode.s60 + 0)
.s58:
07:af67 : 38 __ __ SEC
07:af68 : e9 20 __ SBC #$20
.s185:
07:af6a : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
.s60:
07:af6d : 8a __ __ TXA
07:af6e : e0 a0 __ CPX #$a0
07:af70 : 90 0a __ BCC $af7c ; (decode_controlcode.s64 + 0)
.s65:
07:af72 : c9 c0 __ CMP #$c0
07:af74 : b0 06 __ BCS $af7c ; (decode_controlcode.s64 + 0)
.s62:
07:af76 : 38 __ __ SEC
07:af77 : e9 40 __ SBC #$40
07:af79 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
.s64:
07:af7c : 8a __ __ TXA
07:af7d : e0 c0 __ CPX #$c0
07:af7f : 90 0a __ BCC $af8b ; (decode_controlcode.s68 + 0)
.s69:
07:af81 : c9 ff __ CMP #$ff
07:af83 : b0 06 __ BCS $af8b ; (decode_controlcode.s68 + 0)
.s66:
07:af85 : 38 __ __ SEC
07:af86 : e9 80 __ SBC #$80
07:af88 : 4c 91 af JMP $af91 ; (decode_controlcode.s1124 + 0)
.s68:
07:af8b : c9 ff __ CMP #$ff
07:af8d : d0 05 __ BNE $af94 ; (decode_controlcode.s72 + 0)
.s70:
07:af8f : a9 5e __ LDA #$5e
.s1124:
07:af91 : 8d f0 86 STA $86f0 ; (plotscreencode + 0)
.s72:
07:af94 : ad f0 86 LDA $86f0 ; (plotscreencode + 0)
07:af97 : 85 12 __ STA P5 
07:af99 : 20 1a 54 JSR $541a ; (screenmapplot.s0 + 0)
07:af9c : a9 7f __ LDA #$7f
07:af9e : 85 0d __ STA P0 
07:afa0 : ad af 87 LDA $87af ; (canvas + 7)
07:afa3 : 18 __ __ CLC
07:afa4 : 65 56 __ ADC T4 + 0 
07:afa6 : 85 53 __ STA T2 + 0 
07:afa8 : ad b0 87 LDA $87b0 ; (canvas + 8)
07:afab : 6d ec 86 ADC $86ec ; (screen_col + 1)
07:afae : 85 54 __ STA T2 + 1 
07:afb0 : ad b1 87 LDA $87b1 ; (canvas + 9)
07:afb3 : 18 __ __ CLC
07:afb4 : 65 55 __ ADC T3 + 0 
07:afb6 : 85 03 __ STA WORK + 0 
07:afb8 : ad b2 87 LDA $87b2 ; (canvas + 10)
07:afbb : 6d ee 86 ADC $86ee ; (screen_row + 1)
07:afbe : 85 04 __ STA WORK + 1 
07:afc0 : ad ab 87 LDA $87ab ; (canvas + 3)
07:afc3 : 85 57 __ STA T6 + 0 
07:afc5 : 85 1b __ STA ACCU + 0 
07:afc7 : ad ac 87 LDA $87ac ; (canvas + 4)
07:afca : 85 58 __ STA T6 + 1 
07:afcc : 85 1c __ STA ACCU + 1 
07:afce : 20 62 7c JSR $7c62 ; (mul16 + 0)
07:afd1 : 18 __ __ CLC
07:afd2 : a5 06 __ LDA WORK + 3 
07:afd4 : 69 58 __ ADC #$58
07:afd6 : aa __ __ TAX
07:afd7 : 18 __ __ CLC
07:afd8 : a5 05 __ LDA WORK + 2 
07:afda : 65 53 __ ADC T2 + 0 
07:afdc : 85 0e __ STA P1 
07:afde : 8a __ __ TXA
07:afdf : 65 54 __ ADC T2 + 1 
07:afe1 : 85 0f __ STA P2 
07:afe3 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
07:afe6 : 85 52 __ STA T0 + 0 
07:afe8 : ad ad 87 LDA $87ad ; (canvas + 5)
07:afeb : 85 1b __ STA ACCU + 0 
07:afed : ad ae 87 LDA $87ae ; (canvas + 6)
07:aff0 : 85 1c __ STA ACCU + 1 
07:aff2 : a5 57 __ LDA T6 + 0 
07:aff4 : 85 03 __ STA WORK + 0 
07:aff6 : a5 58 __ LDA T6 + 1 
07:aff8 : 85 04 __ STA WORK + 1 
07:affa : 20 62 7c JSR $7c62 ; (mul16 + 0)
07:affd : 18 __ __ CLC
07:affe : a5 05 __ LDA WORK + 2 
07:b000 : 65 0e __ ADC P1 
07:b002 : a8 __ __ TAY
07:b003 : a5 06 __ LDA WORK + 3 
07:b005 : 65 0f __ ADC P2 
07:b007 : aa __ __ TAX
07:b008 : 98 __ __ TYA
07:b009 : 18 __ __ CLC
07:b00a : 69 30 __ ADC #$30
07:b00c : 85 0e __ STA P1 
07:b00e : 90 01 __ BCC $b011 ; (decode_controlcode.s1130 + 0)
.s1129:
07:b010 : e8 __ __ INX
.s1130:
07:b011 : 86 0f __ STX P2 
07:b013 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
07:b016 : 85 10 __ STA P3 
07:b018 : a5 56 __ LDA T4 + 0 
07:b01a : 85 0d __ STA P0 
07:b01c : a5 55 __ LDA T3 + 0 
07:b01e : 85 0e __ STA P1 
07:b020 : a5 52 __ LDA T0 + 0 
07:b022 : 85 0f __ STA P2 
07:b024 : 20 f8 34 JSR $34f8 ; (vdc_printc.s0 + 0)
.s188:
07:b027 : a9 00 __ LDA #$00
07:b029 : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b02c : a9 01 __ LDA #$01
.s187:
07:b02e : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b031 : a9 00 __ LDA #$00
.s186:
07:b033 : 8d f5 ab STA $abf5 ; (sstack + 2)
07:b036 : a9 00 __ LDA #$00
.s184:
07:b038 : 8d f6 ab STA $abf6 ; (sstack + 3)
07:b03b : 20 bb b2 JSR $b2bb ; (seqimport_move.s0 + 0)
.s1001:
07:b03e : a2 05 __ LDX #$05
07:b040 : bd c5 ab LDA $abc5,x ; (projbuffer + 45)
07:b043 : 95 53 __ STA T2 + 0,x 
07:b045 : ca __ __ DEX
07:b046 : 10 f8 __ BPL $b040 ; (decode_controlcode.s1001 + 2)
07:b048 : 60 __ __ RTS
.s1126:
07:b049 : 8d f1 86 STA $86f1 ; (plotcolor + 0)
07:b04c : 4c 3e b0 JMP $b03e ; (decode_controlcode.s1001 + 0)
.s128:
07:b04f : c9 9a __ CMP #$9a
07:b051 : d0 04 __ BNE $b057 ; (decode_controlcode.s129 + 0)
.s42:
07:b053 : a9 03 __ LDA #$03
07:b055 : d0 f2 __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s129:
07:b057 : b0 04 __ BCS $b05d ; (decode_controlcode.s43 + 0)
.s41:
07:b059 : a9 05 __ LDA #$05
07:b05b : 90 ec __ BCC $b049 ; (decode_controlcode.s1126 + 0)
.s43:
07:b05d : a9 0e __ LDA #$0e
07:b05f : d0 e8 __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s44:
07:b061 : ad da 8a LDA $8ada ; (importvars + 13)
07:b064 : c9 01 __ CMP #$01
07:b066 : d0 04 __ BNE $b06c ; (decode_controlcode.s153 + 0)
.s144:
07:b068 : a9 0a __ LDA #$0a
07:b06a : d0 dd __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s153:
07:b06c : a9 0b __ LDA #$0b
07:b06e : d0 d9 __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s114:
07:b070 : c9 93 __ CMP #$93
07:b072 : f0 4f __ BEQ $b0c3 ; (decode_controlcode.s25 + 0)
.s115:
07:b074 : 90 24 __ BCC $b09a ; (decode_controlcode.s117 + 0)
.s116:
07:b076 : c9 96 __ CMP #$96
07:b078 : d0 04 __ BNE $b07e ; (decode_controlcode.s122 + 0)
.s38:
07:b07a : a9 09 __ LDA #$09
07:b07c : d0 cb __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s122:
07:b07e : b0 0b __ BCS $b08b ; (decode_controlcode.s39 + 0)
.s124:
07:b080 : c9 95 __ CMP #$95
07:b082 : f0 03 __ BEQ $b087 ; (decode_controlcode.s37 + 0)
07:b084 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s37:
07:b087 : a9 0c __ LDA #$0c
07:b089 : d0 be __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s39:
07:b08b : ad da 8a LDA $8ada ; (importvars + 13)
07:b08e : c9 01 __ CMP #$01
07:b090 : d0 04 __ BNE $b096 ; (decode_controlcode.s150 + 0)
.s147:
07:b092 : a9 01 __ LDA #$01
07:b094 : d0 b3 __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s150:
07:b096 : a9 06 __ LDA #$06
07:b098 : d0 af __ BNE $b049 ; (decode_controlcode.s1126 + 0)
.s117:
07:b09a : c9 91 __ CMP #$91
07:b09c : d0 0c __ BNE $b0aa ; (decode_controlcode.s118 + 0)
.s23:
07:b09e : a9 00 __ LDA #$00
07:b0a0 : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b0a3 : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b0a6 : a9 01 __ LDA #$01
07:b0a8 : d0 89 __ BNE $b033 ; (decode_controlcode.s186 + 0)
.s118:
07:b0aa : 90 07 __ BCC $b0b3 ; (decode_controlcode.s120 + 0)
.s24:
07:b0ac : a9 00 __ LDA #$00
.s1128:
07:b0ae : 8d f2 86 STA $86f2 ; (plotreverse + 0)
07:b0b1 : b0 8b __ BCS $b03e ; (decode_controlcode.s1001 + 0)
.s120:
07:b0b3 : c9 8f __ CMP #$8f
07:b0b5 : f0 04 __ BEQ $b0bb ; (decode_controlcode.s21 + 0)
.s22:
07:b0b7 : a9 00 __ LDA #$00
07:b0b9 : f0 8e __ BEQ $b049 ; (decode_controlcode.s1126 + 0)
.s21:
07:b0bb : a9 00 __ LDA #$00
.s1127:
07:b0bd : 8d f4 86 STA $86f4 ; (plotblink + 0)
07:b0c0 : 4c 3e b0 JMP $b03e ; (decode_controlcode.s1001 + 0)
.s25:
07:b0c3 : ad df 8a LDA $8adf ; (importvars + 18)
07:b0c6 : c9 01 __ CMP #$01
07:b0c8 : f0 08 __ BEQ $b0d2 ; (decode_controlcode.s12 + 0)
.s26:
07:b0ca : ad d1 8a LDA $8ad1 ; (importvars + 4)
07:b0cd : 0d d2 8a ORA $8ad2 ; (importvars + 5)
07:b0d0 : d0 14 __ BNE $b0e6 ; (decode_controlcode.s136 + 0)
.s12:
07:b0d2 : a9 00 __ LDA #$00
07:b0d4 : 8d d5 8a STA $8ad5 ; (importvars + 8)
07:b0d7 : 8d d6 8a STA $8ad6 ; (importvars + 9)
07:b0da : 8d d7 8a STA $8ad7 ; (importvars + 10)
.s1123:
07:b0dd : 8d d8 8a STA $8ad8 ; (importvars + 11)
.s183:
07:b0e0 : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
07:b0e3 : 4c 3e b0 JMP $b03e ; (decode_controlcode.s1001 + 0)
.s136:
07:b0e6 : a9 00 __ LDA #$00
07:b0e8 : 85 52 __ STA T0 + 0 
07:b0ea : a9 20 __ LDA #$20
07:b0ec : 85 0f __ STA P2 
.l1120:
07:b0ee : ad cf 8a LDA $8acf ; (importvars + 2)
07:b0f1 : 18 __ __ CLC
07:b0f2 : 65 52 __ ADC T0 + 0 
07:b0f4 : 85 03 __ STA WORK + 0 
07:b0f6 : ad d0 8a LDA $8ad0 ; (importvars + 3)
07:b0f9 : 69 00 __ ADC #$00
07:b0fb : 85 04 __ STA WORK + 1 
07:b0fd : ad ab 87 LDA $87ab ; (canvas + 3)
07:b100 : 85 1b __ STA ACCU + 0 
07:b102 : ad ac 87 LDA $87ac ; (canvas + 4)
07:b105 : 85 1c __ STA ACCU + 1 
07:b107 : 20 62 7c JSR $7c62 ; (mul16 + 0)
07:b10a : 18 __ __ CLC
07:b10b : a5 06 __ LDA WORK + 3 
07:b10d : 69 58 __ ADC #$58
07:b10f : aa __ __ TAX
07:b110 : ad cd 8a LDA $8acd ; (importvars + 0)
07:b113 : 18 __ __ CLC
07:b114 : 65 05 __ ADC WORK + 2 
07:b116 : 85 0d __ STA P0 
07:b118 : 8a __ __ TXA
07:b119 : 6d ce 8a ADC $8ace ; (importvars + 1)
07:b11c : 85 0e __ STA P1 
07:b11e : 20 d6 14 JSR $14d6 ; (bnk_memset@proxy + 0)
07:b121 : ad cf 8a LDA $8acf ; (importvars + 2)
07:b124 : 18 __ __ CLC
07:b125 : 65 52 __ ADC T0 + 0 
07:b127 : 85 03 __ STA WORK + 0 
07:b129 : ad d0 8a LDA $8ad0 ; (importvars + 3)
07:b12c : 69 00 __ ADC #$00
07:b12e : 85 04 __ STA WORK + 1 
07:b130 : ad ab 87 LDA $87ab ; (canvas + 3)
07:b133 : 85 1b __ STA ACCU + 0 
07:b135 : ad ac 87 LDA $87ac ; (canvas + 4)
07:b138 : 85 1c __ STA ACCU + 1 
07:b13a : 20 62 7c JSR $7c62 ; (mul16 + 0)
07:b13d : 18 __ __ CLC
07:b13e : a5 06 __ LDA WORK + 3 
07:b140 : 69 58 __ ADC #$58
07:b142 : aa __ __ TAX
07:b143 : ad cd 8a LDA $8acd ; (importvars + 0)
07:b146 : 18 __ __ CLC
07:b147 : 65 05 __ ADC WORK + 2 
07:b149 : 85 53 __ STA T2 + 0 
07:b14b : 8a __ __ TXA
07:b14c : 6d ce 8a ADC $8ace ; (importvars + 1)
07:b14f : 85 54 __ STA T2 + 1 
07:b151 : ad ad 87 LDA $87ad ; (canvas + 5)
07:b154 : 85 1b __ STA ACCU + 0 
07:b156 : ad ae 87 LDA $87ae ; (canvas + 6)
07:b159 : 85 1c __ STA ACCU + 1 
07:b15b : ad ab 87 LDA $87ab ; (canvas + 3)
07:b15e : 85 03 __ STA WORK + 0 
07:b160 : ad ac 87 LDA $87ac ; (canvas + 4)
07:b163 : 85 04 __ STA WORK + 1 
07:b165 : 20 62 7c JSR $7c62 ; (mul16 + 0)
07:b168 : 18 __ __ CLC
07:b169 : a5 05 __ LDA WORK + 2 
07:b16b : 65 53 __ ADC T2 + 0 
07:b16d : a8 __ __ TAY
07:b16e : a5 06 __ LDA WORK + 3 
07:b170 : 65 54 __ ADC T2 + 1 
07:b172 : aa __ __ TAX
07:b173 : 98 __ __ TYA
07:b174 : 18 __ __ CLC
07:b175 : 69 30 __ ADC #$30
07:b177 : 85 0d __ STA P0 
07:b179 : 90 01 __ BCC $b17c ; (decode_controlcode.s1132 + 0)
.s1131:
07:b17b : e8 __ __ INX
.s1132:
07:b17c : 86 0e __ STX P1 
07:b17e : 20 d6 14 JSR $14d6 ; (bnk_memset@proxy + 0)
07:b181 : e6 52 __ INC T0 + 0 
07:b183 : ad d2 8a LDA $8ad2 ; (importvars + 5)
07:b186 : f0 03 __ BEQ $b18b ; (decode_controlcode.s1056 + 0)
07:b188 : 4c ee b0 JMP $b0ee ; (decode_controlcode.l1120 + 0)
.s1056:
07:b18b : a5 52 __ LDA T0 + 0 
07:b18d : cd d1 8a CMP $8ad1 ; (importvars + 4)
07:b190 : b0 03 __ BCS $b195 ; (decode_controlcode.s1056 + 10)
07:b192 : 4c ee b0 JMP $b0ee ; (decode_controlcode.l1120 + 0)
07:b195 : 4c d2 b0 JMP $b0d2 ; (decode_controlcode.s12 + 0)
.s40:
07:b198 : ad da 8a LDA $8ada ; (importvars + 13)
07:b19b : c9 01 __ CMP #$01
07:b19d : f0 03 __ BEQ $b1a2 ; (decode_controlcode.s40 + 10)
07:b19f : 4c 92 b0 JMP $b092 ; (decode_controlcode.s147 + 0)
07:b1a2 : 4c 5d b0 JMP $b05d ; (decode_controlcode.s43 + 0)
.s82:
07:b1a5 : c9 13 __ CMP #$13
07:b1a7 : d0 03 __ BNE $b1ac ; (decode_controlcode.s83 + 0)
07:b1a9 : 4c d2 b0 JMP $b0d2 ; (decode_controlcode.s12 + 0)
.s83:
07:b1ac : b0 03 __ BCS $b1b1 ; (decode_controlcode.s84 + 0)
07:b1ae : 4c 63 b2 JMP $b263 ; (decode_controlcode.s85 + 0)
.s84:
07:b1b1 : c9 1f __ CMP #$1f
07:b1b3 : d0 05 __ BNE $b1ba ; (decode_controlcode.s99 + 0)
.s17:
07:b1b5 : a9 02 __ LDA #$02
07:b1b7 : 4c 49 b0 JMP $b049 ; (decode_controlcode.s1126 + 0)
.s99:
07:b1ba : b0 51 __ BCS $b20d ; (decode_controlcode.s100 + 0)
.s101:
07:b1bc : c9 1d __ CMP #$1d
07:b1be : d0 03 __ BNE $b1c3 ; (decode_controlcode.s102 + 0)
07:b1c0 : 4c 27 b0 JMP $b027 ; (decode_controlcode.s188 + 0)
.s102:
07:b1c3 : 90 05 __ BCC $b1ca ; (decode_controlcode.s104 + 0)
.s16:
07:b1c5 : a9 04 __ LDA #$04
07:b1c7 : 4c 49 b0 JMP $b049 ; (decode_controlcode.s1126 + 0)
.s104:
07:b1ca : c9 14 __ CMP #$14
07:b1cc : f0 0c __ BEQ $b1da ; (decode_controlcode.s13 + 0)
.s105:
07:b1ce : c9 1c __ CMP #$1c
07:b1d0 : f0 03 __ BEQ $b1d5 ; (decode_controlcode.s14 + 0)
07:b1d2 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s14:
07:b1d5 : a9 08 __ LDA #$08
07:b1d7 : 4c 49 b0 JMP $b049 ; (decode_controlcode.s1126 + 0)
.s13:
07:b1da : a9 01 __ LDA #$01
07:b1dc : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b1df : a9 00 __ LDA #$00
07:b1e1 : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b1e4 : 8d f5 ab STA $abf5 ; (sstack + 2)
07:b1e7 : 8d f6 ab STA $abf6 ; (sstack + 3)
07:b1ea : 20 bb b2 JSR $b2bb ; (seqimport_move.s0 + 0)
07:b1ed : a9 20 __ LDA #$20
07:b1ef : 85 12 __ STA P5 
07:b1f1 : a9 0f __ LDA #$0f
07:b1f3 : 85 13 __ STA P6 
07:b1f5 : ad b1 87 LDA $87b1 ; (canvas + 9)
07:b1f8 : 18 __ __ CLC
07:b1f9 : 6d ed 86 ADC $86ed ; (screen_row + 0)
07:b1fc : 85 10 __ STA P3 
07:b1fe : ad af 87 LDA $87af ; (canvas + 7)
07:b201 : 18 __ __ CLC
07:b202 : 6d eb 86 ADC $86eb ; (screen_col + 0)
07:b205 : 85 11 __ STA P4 
07:b207 : 20 1a 54 JSR $541a ; (screenmapplot.s0 + 0)
07:b20a : 4c 3e b0 JMP $b03e ; (decode_controlcode.s1001 + 0)
.s100:
07:b20d : c9 82 __ CMP #$82
07:b20f : d0 04 __ BNE $b215 ; (decode_controlcode.s107 + 0)
.s19:
07:b211 : a9 00 __ LDA #$00
07:b213 : f0 48 __ BEQ $b25d ; (decode_controlcode.s1125 + 0)
.s107:
07:b215 : b0 14 __ BCS $b22b ; (decode_controlcode.s108 + 0)
.s109:
07:b217 : c9 81 __ CMP #$81
07:b219 : f0 03 __ BEQ $b21e ; (decode_controlcode.s18 + 0)
07:b21b : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s18:
07:b21e : ad da 8a LDA $8ada ; (importvars + 13)
07:b221 : c9 01 __ CMP #$01
07:b223 : d0 03 __ BNE $b228 ; (decode_controlcode.s18 + 10)
07:b225 : 4c 87 b0 JMP $b087 ; (decode_controlcode.s37 + 0)
07:b228 : 4c 68 b0 JMP $b068 ; (decode_controlcode.s144 + 0)
.s108:
07:b22b : c9 8d __ CMP #$8d
07:b22d : f0 03 __ BEQ $b232 ; (decode_controlcode.s4 + 0)
07:b22f : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s4:
07:b232 : a9 00 __ LDA #$00
07:b234 : 8d d5 8a STA $8ad5 ; (importvars + 8)
07:b237 : 8d d6 8a STA $8ad6 ; (importvars + 9)
07:b23a : ad d8 8a LDA $8ad8 ; (importvars + 11)
07:b23d : cd d4 8a CMP $8ad4 ; (importvars + 7)
07:b240 : d0 06 __ BNE $b248 ; (decode_controlcode.s1069 + 0)
.s1068:
07:b242 : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b245 : cd d3 8a CMP $8ad3 ; (importvars + 6)
.s1069:
07:b248 : 90 03 __ BCC $b24d ; (decode_controlcode.s5 + 0)
07:b24a : 4c e0 b0 JMP $b0e0 ; (decode_controlcode.s183 + 0)
.s5:
07:b24d : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b250 : 69 01 __ ADC #$01
07:b252 : 8d d7 8a STA $8ad7 ; (importvars + 10)
07:b255 : ad d8 8a LDA $8ad8 ; (importvars + 11)
07:b258 : 69 00 __ ADC #$00
07:b25a : 4c dd b0 JMP $b0dd ; (decode_controlcode.s1123 + 0)
.s1125:
07:b25d : 8d f3 86 STA $86f3 ; (plotunderline + 0)
07:b260 : 4c 3e b0 JMP $b03e ; (decode_controlcode.s1001 + 0)
.s85:
07:b263 : c9 0e __ CMP #$0e
07:b265 : d0 04 __ BNE $b26b ; (decode_controlcode.s86 + 0)
.s8:
07:b267 : a9 01 __ LDA #$01
07:b269 : d0 4a __ BNE $b2b5 ; (decode_controlcode.s1122 + 0)
.s86:
07:b26b : b0 21 __ BCS $b28e ; (decode_controlcode.s87 + 0)
.s88:
07:b26d : c9 0a __ CMP #$0a
07:b26f : f0 c1 __ BEQ $b232 ; (decode_controlcode.s4 + 0)
.s89:
07:b271 : 90 07 __ BCC $b27a ; (decode_controlcode.s91 + 0)
.s90:
07:b273 : c9 0d __ CMP #$0d
07:b275 : f0 bb __ BEQ $b232 ; (decode_controlcode.s4 + 0)
07:b277 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s91:
07:b27a : c9 02 __ CMP #$02
07:b27c : d0 04 __ BNE $b282 ; (decode_controlcode.s92 + 0)
.s2:
07:b27e : a9 01 __ LDA #$01
07:b280 : d0 db __ BNE $b25d ; (decode_controlcode.s1125 + 0)
.s92:
07:b282 : c9 05 __ CMP #$05
07:b284 : f0 03 __ BEQ $b289 ; (decode_controlcode.s3 + 0)
07:b286 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s3:
07:b289 : a9 0f __ LDA #$0f
07:b28b : 4c 49 b0 JMP $b049 ; (decode_controlcode.s1126 + 0)
.s87:
07:b28e : c9 11 __ CMP #$11
07:b290 : d0 10 __ BNE $b2a2 ; (decode_controlcode.s95 + 0)
.s10:
07:b292 : a9 00 __ LDA #$00
07:b294 : 8d f3 ab STA $abf3 ; (sstack + 0)
07:b297 : 8d f4 ab STA $abf4 ; (sstack + 1)
07:b29a : 8d f5 ab STA $abf5 ; (sstack + 2)
07:b29d : a9 01 __ LDA #$01
07:b29f : 4c 38 b0 JMP $b038 ; (decode_controlcode.s184 + 0)
.s95:
07:b2a2 : b0 0c __ BCS $b2b0 ; (decode_controlcode.s11 + 0)
.s97:
07:b2a4 : c9 0f __ CMP #$0f
07:b2a6 : f0 03 __ BEQ $b2ab ; (decode_controlcode.s9 + 0)
07:b2a8 : 4c 00 af JMP $af00 ; (decode_controlcode.s49 + 0)
.s9:
07:b2ab : a9 01 __ LDA #$01
07:b2ad : 4c bd b0 JMP $b0bd ; (decode_controlcode.s1127 + 0)
.s11:
07:b2b0 : a9 01 __ LDA #$01
07:b2b2 : 4c ae b0 JMP $b0ae ; (decode_controlcode.s1128 + 0)
.s1122:
07:b2b5 : 8d f5 86 STA $86f5 ; (plotaltchar + 0)
07:b2b8 : 4c 3e b0 JMP $b03e ; (decode_controlcode.s1001 + 0)
--------------------------------------------------------------------
seqimport_move: ; seqimport_move(u8,u8,u8,u8)->void
.s0:
07:b2bb : ad f3 ab LDA $abf3 ; (sstack + 0)
07:b2be : c9 01 __ CMP #$01
07:b2c0 : d0 32 __ BNE $b2f4 ; (seqimport_move.s58 + 0)
.s1:
07:b2c2 : ad d5 8a LDA $8ad5 ; (importvars + 8)
07:b2c5 : 0d d6 8a ORA $8ad6 ; (importvars + 9)
07:b2c8 : d0 03 __ BNE $b2cd ; (seqimport_move.s5 + 0)
07:b2ca : 4c 8b b4 JMP $b48b ; (seqimport_move.s4 + 0)
.s5:
07:b2cd : ad d5 8a LDA $8ad5 ; (importvars + 8)
07:b2d0 : 18 __ __ CLC
07:b2d1 : 69 ff __ ADC #$ff
07:b2d3 : 8d d5 8a STA $8ad5 ; (importvars + 8)
07:b2d6 : b0 03 __ BCS $b2db ; (seqimport_move.s1037 + 0)
.s1036:
07:b2d8 : ce d6 8a DEC $8ad6 ; (importvars + 9)
.s1037:
07:b2db : ad eb 86 LDA $86eb ; (screen_col + 0)
07:b2de : 0d ec 86 ORA $86ec ; (screen_col + 1)
07:b2e1 : d0 03 __ BNE $b2e6 ; (seqimport_move.s11 + 0)
07:b2e3 : 4c 76 b4 JMP $b476 ; (seqimport_move.s10 + 0)
.s11:
07:b2e6 : ad eb 86 LDA $86eb ; (screen_col + 0)
07:b2e9 : 18 __ __ CLC
07:b2ea : 69 ff __ ADC #$ff
07:b2ec : 8d eb 86 STA $86eb ; (screen_col + 0)
07:b2ef : b0 03 __ BCS $b2f4 ; (seqimport_move.s58 + 0)
.s1038:
07:b2f1 : ce ec 86 DEC $86ec ; (screen_col + 1)
.s58:
07:b2f4 : ad f4 ab LDA $abf4 ; (sstack + 1)
07:b2f7 : c9 01 __ CMP #$01
07:b2f9 : d0 4f __ BNE $b34a ; (seqimport_move.s62 + 0)
.s16:
07:b2fb : ad d1 8a LDA $8ad1 ; (importvars + 4)
07:b2fe : 38 __ __ SEC
07:b2ff : e9 01 __ SBC #$01
07:b301 : 85 50 __ STA T1 + 0 
07:b303 : ad d2 8a LDA $8ad2 ; (importvars + 5)
07:b306 : e9 00 __ SBC #$00
07:b308 : 85 51 __ STA T1 + 1 
07:b30a : ad d6 8a LDA $8ad6 ; (importvars + 9)
07:b30d : c5 51 __ CMP T1 + 1 
07:b30f : d0 05 __ BNE $b316 ; (seqimport_move.s1019 + 0)
.s1018:
07:b311 : ad d5 8a LDA $8ad5 ; (importvars + 8)
07:b314 : c5 50 __ CMP T1 + 0 
.s1019:
07:b316 : b0 03 __ BCS $b31b ; (seqimport_move.s20 + 0)
07:b318 : 4c 14 b4 JMP $b414 ; (seqimport_move.s19 + 0)
.s20:
07:b31b : ad d3 8a LDA $8ad3 ; (importvars + 6)
07:b31e : e9 01 __ SBC #$01
07:b320 : 85 50 __ STA T1 + 0 
07:b322 : ad d4 8a LDA $8ad4 ; (importvars + 7)
07:b325 : e9 00 __ SBC #$00
07:b327 : 85 51 __ STA T1 + 1 
07:b329 : ad d8 8a LDA $8ad8 ; (importvars + 11)
07:b32c : c5 51 __ CMP T1 + 1 
07:b32e : d0 05 __ BNE $b335 ; (seqimport_move.s1013 + 0)
.s1012:
07:b330 : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b333 : c5 50 __ CMP T1 + 0 
.s1013:
07:b335 : b0 13 __ BCS $b34a ; (seqimport_move.s62 + 0)
.s28:
07:b337 : a9 00 __ LDA #$00
07:b339 : 8d d5 8a STA $8ad5 ; (importvars + 8)
07:b33c : 8d d6 8a STA $8ad6 ; (importvars + 9)
07:b33f : ee d7 8a INC $8ad7 ; (importvars + 10)
07:b342 : d0 03 __ BNE $b347 ; (seqimport_move.s1035 + 0)
.s1034:
07:b344 : ee d8 8a INC $8ad8 ; (importvars + 11)
.s1035:
07:b347 : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
.s62:
07:b34a : ad f5 ab LDA $abf5 ; (sstack + 2)
07:b34d : c9 01 __ CMP #$01
07:b34f : d0 2f __ BNE $b380 ; (seqimport_move.s66 + 0)
.s31:
07:b351 : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b354 : 0d d8 8a ORA $8ad8 ; (importvars + 11)
07:b357 : f0 27 __ BEQ $b380 ; (seqimport_move.s66 + 0)
.s34:
07:b359 : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b35c : 18 __ __ CLC
07:b35d : 69 ff __ ADC #$ff
07:b35f : 8d d7 8a STA $8ad7 ; (importvars + 10)
07:b362 : b0 03 __ BCS $b367 ; (seqimport_move.s1029 + 0)
.s1028:
07:b364 : ce d8 8a DEC $8ad8 ; (importvars + 11)
.s1029:
07:b367 : ad ed 86 LDA $86ed ; (screen_row + 0)
07:b36a : 0d ee 86 ORA $86ee ; (screen_row + 1)
07:b36d : d0 03 __ BNE $b372 ; (seqimport_move.s38 + 0)
07:b36f : 4c ff b3 JMP $b3ff ; (seqimport_move.s37 + 0)
.s38:
07:b372 : ad ed 86 LDA $86ed ; (screen_row + 0)
07:b375 : 18 __ __ CLC
07:b376 : 69 ff __ ADC #$ff
07:b378 : 8d ed 86 STA $86ed ; (screen_row + 0)
07:b37b : b0 03 __ BCS $b380 ; (seqimport_move.s66 + 0)
.s1032:
07:b37d : ce ee 86 DEC $86ee ; (screen_row + 1)
.s66:
07:b380 : ad f6 ab LDA $abf6 ; (sstack + 3)
07:b383 : c9 01 __ CMP #$01
07:b385 : d0 70 __ BNE $b3f7 ; (seqimport_move.s1001 + 0)
.s43:
07:b387 : ad d3 8a LDA $8ad3 ; (importvars + 6)
07:b38a : 38 __ __ SEC
07:b38b : e9 01 __ SBC #$01
07:b38d : 85 50 __ STA T1 + 0 
07:b38f : ad d4 8a LDA $8ad4 ; (importvars + 7)
07:b392 : e9 00 __ SBC #$00
07:b394 : 85 51 __ STA T1 + 1 
07:b396 : ad d8 8a LDA $8ad8 ; (importvars + 11)
07:b399 : c5 51 __ CMP T1 + 1 
07:b39b : d0 05 __ BNE $b3a2 ; (seqimport_move.s1007 + 0)
.s1006:
07:b39d : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b3a0 : c5 50 __ CMP T1 + 0 
.s1007:
07:b3a2 : b0 53 __ BCS $b3f7 ; (seqimport_move.s1001 + 0)
.s46:
07:b3a4 : ee d7 8a INC $8ad7 ; (importvars + 10)
07:b3a7 : d0 03 __ BNE $b3ac ; (seqimport_move.s1031 + 0)
.s1030:
07:b3a9 : ee d8 8a INC $8ad8 ; (importvars + 11)
.s1031:
07:b3ac : ad ed 86 LDA $86ed ; (screen_row + 0)
07:b3af : 85 50 __ STA T1 + 0 
07:b3b1 : ad ee 86 LDA $86ee ; (screen_row + 1)
07:b3b4 : 85 51 __ STA T1 + 1 
07:b3b6 : 20 01 33 JSR $3301 ; (getmaxy.s0 + 0)
07:b3b9 : 85 44 __ STA T2 + 0 
07:b3bb : a5 51 __ LDA T1 + 1 
07:b3bd : d0 06 __ BNE $b3c5 ; (seqimport_move.s50 + 0)
.s1004:
07:b3bf : a5 50 __ LDA T1 + 0 
07:b3c1 : c5 44 __ CMP T2 + 0 
07:b3c3 : f0 10 __ BEQ $b3d5 ; (seqimport_move.s49 + 0)
.s50:
07:b3c5 : 18 __ __ CLC
07:b3c6 : a5 50 __ LDA T1 + 0 
07:b3c8 : 69 01 __ ADC #$01
07:b3ca : 8d ed 86 STA $86ed ; (screen_row + 0)
07:b3cd : a5 51 __ LDA T1 + 1 
07:b3cf : 69 00 __ ADC #$00
07:b3d1 : 8d ee 86 STA $86ee ; (screen_row + 1)
07:b3d4 : 60 __ __ RTS
.s49:
07:b3d5 : 18 __ __ CLC
07:b3d6 : 6d b1 87 ADC $87b1 ; (canvas + 9)
07:b3d9 : aa __ __ TAX
07:b3da : ad b2 87 LDA $87b2 ; (canvas + 10)
07:b3dd : 69 00 __ ADC #$00
07:b3df : a8 __ __ TAY
07:b3e0 : ad ad 87 LDA $87ad ; (canvas + 5)
07:b3e3 : 38 __ __ SEC
07:b3e4 : e9 01 __ SBC #$01
07:b3e6 : 85 44 __ STA T2 + 0 
07:b3e8 : ad ae 87 LDA $87ae ; (canvas + 6)
07:b3eb : e9 00 __ SBC #$00
07:b3ed : 85 45 __ STA T2 + 1 
07:b3ef : c4 45 __ CPY T2 + 1 
07:b3f1 : d0 02 __ BNE $b3f5 ; (seqimport_move.s1003 + 0)
.s1002:
07:b3f3 : e4 44 __ CPX T2 + 0 
.s1003:
07:b3f5 : 90 01 __ BCC $b3f8 ; (seqimport_move.s52 + 0)
.s1001:
07:b3f7 : 60 __ __ RTS
.s52:
07:b3f8 : a9 04 __ LDA #$04
07:b3fa : 85 18 __ STA P11 
07:b3fc : 4c 28 44 JMP $4428 ; (vdcwin_viewportscroll.s0 + 0)
.s37:
07:b3ff : ad b1 87 LDA $87b1 ; (canvas + 9)
07:b402 : 0d b2 87 ORA $87b2 ; (canvas + 10)
07:b405 : d0 03 __ BNE $b40a ; (seqimport_move.s40 + 0)
07:b407 : 4c 80 b3 JMP $b380 ; (seqimport_move.s66 + 0)
.s40:
07:b40a : a9 08 __ LDA #$08
07:b40c : 85 18 __ STA P11 
07:b40e : 20 28 44 JSR $4428 ; (vdcwin_viewportscroll.s0 + 0)
07:b411 : 4c 80 b3 JMP $b380 ; (seqimport_move.s66 + 0)
.s19:
07:b414 : ee d5 8a INC $8ad5 ; (importvars + 8)
07:b417 : d0 03 __ BNE $b41c ; (seqimport_move.s1027 + 0)
.s1026:
07:b419 : ee d6 8a INC $8ad6 ; (importvars + 9)
.s1027:
07:b41c : ad eb 86 LDA $86eb ; (screen_col + 0)
07:b41f : 85 50 __ STA T1 + 0 
07:b421 : ad ec 86 LDA $86ec ; (screen_col + 1)
07:b424 : 85 51 __ STA T1 + 1 
07:b426 : 20 e5 32 JSR $32e5 ; (getmaxx.s0 + 0)
07:b429 : 85 44 __ STA T2 + 0 
07:b42b : a5 51 __ LDA T1 + 1 
07:b42d : d0 06 __ BNE $b435 ; (seqimport_move.s23 + 0)
.s1016:
07:b42f : a5 50 __ LDA T1 + 0 
07:b431 : c5 44 __ CMP T2 + 0 
07:b433 : f0 12 __ BEQ $b447 ; (seqimport_move.s22 + 0)
.s23:
07:b435 : 18 __ __ CLC
07:b436 : a5 50 __ LDA T1 + 0 
07:b438 : 69 01 __ ADC #$01
07:b43a : 8d eb 86 STA $86eb ; (screen_col + 0)
07:b43d : a5 51 __ LDA T1 + 1 
07:b43f : 69 00 __ ADC #$00
07:b441 : 8d ec 86 STA $86ec ; (screen_col + 1)
07:b444 : 4c 4a b3 JMP $b34a ; (seqimport_move.s62 + 0)
.s22:
07:b447 : 18 __ __ CLC
07:b448 : 6d af 87 ADC $87af ; (canvas + 7)
07:b44b : aa __ __ TAX
07:b44c : ad b0 87 LDA $87b0 ; (canvas + 8)
07:b44f : 69 00 __ ADC #$00
07:b451 : a8 __ __ TAY
07:b452 : ad ab 87 LDA $87ab ; (canvas + 3)
07:b455 : 38 __ __ SEC
07:b456 : e9 01 __ SBC #$01
07:b458 : 85 44 __ STA T2 + 0 
07:b45a : ad ac 87 LDA $87ac ; (canvas + 4)
07:b45d : e9 00 __ SBC #$00
07:b45f : 85 45 __ STA T2 + 1 
07:b461 : c4 45 __ CPY T2 + 1 
07:b463 : d0 02 __ BNE $b467 ; (seqimport_move.s1015 + 0)
.s1014:
07:b465 : e4 44 __ CPX T2 + 0 
.s1015:
07:b467 : 90 03 __ BCC $b46c ; (seqimport_move.s25 + 0)
07:b469 : 4c 4a b3 JMP $b34a ; (seqimport_move.s62 + 0)
.s25:
07:b46c : a9 02 __ LDA #$02
07:b46e : 85 18 __ STA P11 
07:b470 : 20 28 44 JSR $4428 ; (vdcwin_viewportscroll.s0 + 0)
07:b473 : 4c 4a b3 JMP $b34a ; (seqimport_move.s62 + 0)
.s10:
07:b476 : ad af 87 LDA $87af ; (canvas + 7)
07:b479 : 0d b0 87 ORA $87b0 ; (canvas + 8)
07:b47c : d0 03 __ BNE $b481 ; (seqimport_move.s13 + 0)
07:b47e : 4c f4 b2 JMP $b2f4 ; (seqimport_move.s58 + 0)
.s13:
07:b481 : a9 01 __ LDA #$01
07:b483 : 85 18 __ STA P11 
07:b485 : 20 28 44 JSR $4428 ; (vdcwin_viewportscroll.s0 + 0)
07:b488 : 4c f4 b2 JMP $b2f4 ; (seqimport_move.s58 + 0)
.s4:
07:b48b : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b48e : 0d d8 8a ORA $8ad8 ; (importvars + 11)
07:b491 : d0 03 __ BNE $b496 ; (seqimport_move.s7 + 0)
07:b493 : 4c f4 b2 JMP $b2f4 ; (seqimport_move.s58 + 0)
.s7:
07:b496 : ad d7 8a LDA $8ad7 ; (importvars + 10)
07:b499 : 18 __ __ CLC
07:b49a : 69 ff __ ADC #$ff
07:b49c : 8d d7 8a STA $8ad7 ; (importvars + 10)
07:b49f : b0 03 __ BCS $b4a4 ; (seqimport_move.s1025 + 0)
.s1024:
07:b4a1 : ce d8 8a DEC $8ad8 ; (importvars + 11)
.s1025:
07:b4a4 : ad d1 8a LDA $8ad1 ; (importvars + 4)
07:b4a7 : 38 __ __ SEC
07:b4a8 : e9 01 __ SBC #$01
07:b4aa : 8d d5 8a STA $8ad5 ; (importvars + 8)
07:b4ad : ad d2 8a LDA $8ad2 ; (importvars + 5)
07:b4b0 : e9 00 __ SBC #$00
07:b4b2 : 8d d6 8a STA $8ad6 ; (importvars + 9)
07:b4b5 : 20 b9 ad JSR $adb9 ; (rebase.s0 + 0)
07:b4b8 : 4c f4 b2 JMP $b2f4 ; (seqimport_move.s58 + 0)
--------------------------------------------------------------------
export_seq: ; export_seq()->void
.s1000:
07:b4bb : a2 0d __ LDX #$0d
07:b4bd : b5 53 __ LDA T0 + 0,x 
07:b4bf : 9d ad ab STA $abad,x ; (projbuffer + 21)
07:b4c2 : ca __ __ DEX
07:b4c3 : 10 f8 __ BPL $b4bd ; (export_seq.s1000 + 2)
07:b4c5 : 38 __ __ SEC
07:b4c6 : a5 23 __ LDA SP + 0 
07:b4c8 : e9 08 __ SBC #$08
07:b4ca : 85 23 __ STA SP + 0 
07:b4cc : b0 02 __ BCS $b4d0 ; (export_seq.s0 + 0)
07:b4ce : c6 24 __ DEC SP + 1 
.s0:
07:b4d0 : a9 0f __ LDA #$0f
07:b4d2 : 8d fa ab STA $abfa ; (sstack + 7)
07:b4d5 : a9 d8 __ LDA #$d8
07:b4d7 : 8d f8 ab STA $abf8 ; (sstack + 5)
07:b4da : a9 b7 __ LDA #$b7
07:b4dc : 8d f9 ab STA $abf9 ; (sstack + 6)
07:b4df : 20 84 4b JSR $4b84 ; (chooseidandfilename.s0 + 0)
07:b4e2 : a5 1c __ LDA ACCU + 1 
07:b4e4 : c9 ff __ CMP #$ff
07:b4e6 : d0 09 __ BNE $b4f1 ; (export_seq.s3 + 0)
.s1038:
07:b4e8 : a5 1b __ LDA ACCU + 0 
07:b4ea : c9 ff __ CMP #$ff
07:b4ec : d0 03 __ BNE $b4f1 ; (export_seq.s3 + 0)
07:b4ee : 4c dc b5 JMP $b5dc ; (export_seq.s1055 + 0)
.s3:
07:b4f1 : a9 7a __ LDA #$7a
07:b4f3 : 8d fc ab STA $abfc ; (sstack + 9)
07:b4f6 : a9 87 __ LDA #$87
07:b4f8 : 8d fd ab STA $abfd ; (sstack + 10)
07:b4fb : ad f6 86 LDA $86f6 ; (targetdevice + 0)
07:b4fe : 85 55 __ STA T1 + 0 
07:b500 : 8d fe ab STA $abfe ; (sstack + 11)
07:b503 : 20 26 62 JSR $6226 ; (checkiffileexists.s1000 + 0)
07:b506 : a5 1b __ LDA ACCU + 0 
07:b508 : d0 03 __ BNE $b50d ; (export_seq.s5 + 0)
07:b50a : 4c dc b5 JMP $b5dc ; (export_seq.s1055 + 0)
.s5:
07:b50d : a9 00 __ LDA #$00
07:b50f : 85 56 __ STA T3 + 0 
07:b511 : a5 1b __ LDA ACCU + 0 
07:b513 : c9 02 __ CMP #$02
07:b515 : d0 26 __ BNE $b53d ; (export_seq.s10 + 0)
.s8:
07:b517 : a9 7a __ LDA #$7a
07:b519 : a0 06 __ LDY #$06
07:b51b : 91 23 __ STA (SP + 0),y 
07:b51d : a9 87 __ LDA #$87
07:b51f : c8 __ __ INY
07:b520 : 91 23 __ STA (SP + 0),y 
07:b522 : a9 00 __ LDA #$00
07:b524 : a0 02 __ LDY #$02
07:b526 : 91 23 __ STA (SP + 0),y 
07:b528 : a9 89 __ LDA #$89
07:b52a : c8 __ __ INY
07:b52b : 91 23 __ STA (SP + 0),y 
07:b52d : a9 e4 __ LDA #$e4
07:b52f : c8 __ __ INY
07:b530 : 91 23 __ STA (SP + 0),y 
07:b532 : a9 b7 __ LDA #$b7
07:b534 : c8 __ __ INY
07:b535 : 91 23 __ STA (SP + 0),y 
07:b537 : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
07:b53a : 20 ac 62 JSR $62ac ; (cmd@proxy + 0)
.s10:
07:b53d : a9 7a __ LDA #$7a
07:b53f : a0 06 __ LDY #$06
07:b541 : 91 23 __ STA (SP + 0),y 
07:b543 : a9 87 __ LDA #$87
07:b545 : c8 __ __ INY
07:b546 : 91 23 __ STA (SP + 0),y 
07:b548 : a9 90 __ LDA #$90
07:b54a : a0 02 __ LDY #$02
07:b54c : 91 23 __ STA (SP + 0),y 
07:b54e : a9 88 __ LDA #$88
07:b550 : c8 __ __ INY
07:b551 : 91 23 __ STA (SP + 0),y 
07:b553 : a9 e9 __ LDA #$e9
07:b555 : c8 __ __ INY
07:b556 : 91 23 __ STA (SP + 0),y 
07:b558 : a9 b7 __ LDA #$b7
07:b55a : c8 __ __ INY
07:b55b : 91 23 __ STA (SP + 0),y 
07:b55d : 20 79 32 JSR $3279 ; (sprintf.s0 + 0)
07:b560 : a9 00 __ LDA #$00
07:b562 : 85 0d __ STA P0 
07:b564 : 85 0e __ STA P1 
07:b566 : 20 b4 2a JSR $2ab4 ; (krnio_setbnk.s0 + 0)
07:b569 : 20 bb 2a JSR $2abb ; (krnio_setnam@proxy + 0)
07:b56c : a5 55 __ LDA T1 + 0 
07:b56e : 85 0e __ STA P1 
07:b570 : 20 33 63 JSR $6333 ; (krnio_open@proxy + 0)
07:b573 : 09 00 __ ORA #$00
07:b575 : f0 65 __ BEQ $b5dc ; (export_seq.s1055 + 0)
.s11:
07:b577 : a9 0d __ LDA #$0d
07:b579 : 85 12 __ STA P5 
07:b57b : a9 00 __ LDA #$00
07:b57d : 85 13 __ STA P6 
07:b57f : a9 b8 __ LDA #$b8
07:b581 : 85 14 __ STA P7 
07:b583 : 20 af 80 JSR $80af ; (vdc_prints_attr@proxy + 0)
07:b586 : a9 01 __ LDA #$01
07:b588 : 20 1c 7c JSR $7c1c ; (krnio_chkout.s1000 + 0)
07:b58b : 09 00 __ ORA #$00
07:b58d : d0 08 __ BNE $b597 ; (export_seq.s15 + 0)
.s16:
07:b58f : a9 01 __ LDA #$01
07:b591 : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
07:b594 : 4c d9 b5 JMP $b5d9 ; (export_seq.s1056 + 0)
.s15:
07:b597 : ad ad 87 LDA $87ad ; (canvas + 5)
07:b59a : 0d ae 87 ORA $87ae ; (canvas + 6)
07:b59d : f0 2e __ BEQ $b5cd ; (export_seq.s21 + 0)
.s81:
07:b59f : a9 00 __ LDA #$00
07:b5a1 : 85 53 __ STA T0 + 0 
07:b5a3 : 85 54 __ STA T0 + 1 
.l19:
07:b5a5 : ad ab 87 LDA $87ab ; (canvas + 3)
07:b5a8 : 0d ac 87 ORA $87ac ; (canvas + 4)
07:b5ab : f0 0c __ BEQ $b5b9 ; (export_seq.s20 + 0)
.s80:
07:b5ad : a9 00 __ LDA #$00
07:b5af : 85 57 __ STA T4 + 0 
07:b5b1 : 85 58 __ STA T4 + 1 
07:b5b3 : a9 7f __ LDA #$7f
07:b5b5 : 85 0d __ STA P0 
07:b5b7 : d0 3c __ BNE $b5f5 ; (export_seq.l23 + 0)
.s20:
07:b5b9 : e6 53 __ INC T0 + 0 
07:b5bb : d0 02 __ BNE $b5bf ; (export_seq.s1074 + 0)
.s1073:
07:b5bd : e6 54 __ INC T0 + 1 
.s1074:
07:b5bf : a5 54 __ LDA T0 + 1 
07:b5c1 : cd ae 87 CMP $87ae ; (canvas + 6)
07:b5c4 : d0 05 __ BNE $b5cb ; (export_seq.s1003 + 0)
.s1002:
07:b5c6 : a5 53 __ LDA T0 + 0 
07:b5c8 : cd ad 87 CMP $87ad ; (canvas + 5)
.s1003:
07:b5cb : 90 d8 __ BCC $b5a5 ; (export_seq.l19 + 0)
.s21:
07:b5cd : 20 fa 61 JSR $61fa ; (krnio_clrchn.s0 + 0)
07:b5d0 : a9 01 __ LDA #$01
07:b5d2 : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
07:b5d5 : a5 56 __ LDA T3 + 0 
07:b5d7 : f0 03 __ BEQ $b5dc ; (export_seq.s1055 + 0)
.s1056:
07:b5d9 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
.s1055:
07:b5dc : 20 19 3a JSR $3a19 ; (vdcwin_win_free.s0 + 0)
.s1001:
07:b5df : 18 __ __ CLC
07:b5e0 : a5 23 __ LDA SP + 0 
07:b5e2 : 69 08 __ ADC #$08
07:b5e4 : 85 23 __ STA SP + 0 
07:b5e6 : 90 02 __ BCC $b5ea ; (export_seq.s1001 + 11)
07:b5e8 : e6 24 __ INC SP + 1 
07:b5ea : a2 0d __ LDX #$0d
07:b5ec : bd ad ab LDA $abad,x ; (projbuffer + 21)
07:b5ef : 95 53 __ STA T0 + 0,x 
07:b5f1 : ca __ __ DEX
07:b5f2 : 10 f8 __ BPL $b5ec ; (export_seq.s1001 + 13)
07:b5f4 : 60 __ __ RTS
.l23:
07:b5f5 : ad ab 87 LDA $87ab ; (canvas + 3)
07:b5f8 : 85 59 __ STA T5 + 0 
07:b5fa : 85 1b __ STA ACCU + 0 
07:b5fc : ad ac 87 LDA $87ac ; (canvas + 4)
07:b5ff : 85 5a __ STA T5 + 1 
07:b601 : 85 1c __ STA ACCU + 1 
07:b603 : a5 53 __ LDA T0 + 0 
07:b605 : 85 03 __ STA WORK + 0 
07:b607 : a5 54 __ LDA T0 + 1 
07:b609 : 85 04 __ STA WORK + 1 
07:b60b : 20 62 7c JSR $7c62 ; (mul16 + 0)
07:b60e : 18 __ __ CLC
07:b60f : a5 06 __ LDA WORK + 3 
07:b611 : 69 58 __ ADC #$58
07:b613 : aa __ __ TAX
07:b614 : 18 __ __ CLC
07:b615 : a5 05 __ LDA WORK + 2 
07:b617 : 65 57 __ ADC T4 + 0 
07:b619 : 85 0e __ STA P1 
07:b61b : 8a __ __ TXA
07:b61c : 65 58 __ ADC T4 + 1 
07:b61e : 85 0f __ STA P2 
07:b620 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
07:b623 : 85 55 __ STA T1 + 0 
07:b625 : ad ad 87 LDA $87ad ; (canvas + 5)
07:b628 : 85 1b __ STA ACCU + 0 
07:b62a : ad ae 87 LDA $87ae ; (canvas + 6)
07:b62d : 85 1c __ STA ACCU + 1 
07:b62f : a5 59 __ LDA T5 + 0 
07:b631 : 85 03 __ STA WORK + 0 
07:b633 : a5 5a __ LDA T5 + 1 
07:b635 : 85 04 __ STA WORK + 1 
07:b637 : 20 62 7c JSR $7c62 ; (mul16 + 0)
07:b63a : 18 __ __ CLC
07:b63b : a5 05 __ LDA WORK + 2 
07:b63d : 65 0e __ ADC P1 
07:b63f : aa __ __ TAX
07:b640 : a5 06 __ LDA WORK + 3 
07:b642 : 65 0f __ ADC P2 
07:b644 : a8 __ __ TAY
07:b645 : 8a __ __ TXA
07:b646 : 18 __ __ CLC
07:b647 : 69 30 __ ADC #$30
07:b649 : 85 0e __ STA P1 
07:b64b : 90 01 __ BCC $b64e ; (export_seq.s1058 + 0)
.s1057:
07:b64d : c8 __ __ INY
.s1058:
07:b64e : 84 0f __ STY P2 
07:b650 : 20 22 15 JSR $1522 ; (bnk_readb.s0 + 0)
07:b653 : a8 __ __ TAY
07:b654 : 24 55 __ BIT T1 + 0 
07:b656 : 10 0a __ BPL $b662 ; (export_seq.s191 + 0)
.s30:
07:b658 : 49 40 __ EOR #$40
07:b65a : a8 __ __ TAY
07:b65b : 38 __ __ SEC
07:b65c : a5 55 __ LDA T1 + 0 
07:b65e : e9 80 __ SBC #$80
07:b660 : 85 55 __ STA T1 + 0 
.s191:
07:b662 : a9 20 __ LDA #$20
07:b664 : 85 5c __ STA T7 + 0 
07:b666 : a5 55 __ LDA T1 + 0 
07:b668 : c9 20 __ CMP #$20
07:b66a : b0 06 __ BCS $b672 ; (export_seq.s35 + 0)
.s33:
07:b66c : 69 40 __ ADC #$40
07:b66e : 85 5c __ STA T7 + 0 
07:b670 : a5 55 __ LDA T1 + 0 
.s35:
07:b672 : c9 20 __ CMP #$20
07:b674 : 90 15 __ BCC $b68b ; (export_seq.s42 + 0)
.s39:
07:b676 : c9 40 __ CMP #$40
07:b678 : b0 04 __ BCS $b67e ; (export_seq.s43 + 0)
.s36:
07:b67a : 85 5c __ STA T7 + 0 
07:b67c : 90 0d __ BCC $b68b ; (export_seq.s42 + 0)
.s43:
07:b67e : c9 5e __ CMP #$5e
07:b680 : b0 09 __ BCS $b68b ; (export_seq.s42 + 0)
.s40:
07:b682 : 69 80 __ ADC #$80
07:b684 : 85 5c __ STA T7 + 0 
07:b686 : a5 55 __ LDA T1 + 0 
07:b688 : 4c 98 b6 JMP $b698 ; (export_seq.s46 + 0)
.s42:
07:b68b : c9 5e __ CMP #$5e
07:b68d : d0 09 __ BNE $b698 ; (export_seq.s46 + 0)
.s44:
07:b68f : a9 ff __ LDA #$ff
07:b691 : 85 5c __ STA T7 + 0 
07:b693 : a5 55 __ LDA T1 + 0 
07:b695 : 4c a0 b6 JMP $b6a0 ; (export_seq.s49 + 0)
.s46:
07:b698 : c9 5f __ CMP #$5f
07:b69a : d0 04 __ BNE $b6a0 ; (export_seq.s49 + 0)
.s47:
07:b69c : a9 df __ LDA #$df
07:b69e : d0 0b __ BNE $b6ab ; (export_seq.s1054 + 0)
.s49:
07:b6a0 : c9 60 __ CMP #$60
07:b6a2 : 90 09 __ BCC $b6ad ; (export_seq.s52 + 0)
.s53:
07:b6a4 : 09 00 __ ORA #$00
07:b6a6 : 30 05 __ BMI $b6ad ; (export_seq.s52 + 0)
.s50:
07:b6a8 : 18 __ __ CLC
07:b6a9 : 69 40 __ ADC #$40
.s1054:
07:b6ab : 85 5c __ STA T7 + 0 
.s52:
07:b6ad : a5 57 __ LDA T4 + 0 
07:b6af : 05 58 __ ORA T4 + 1 
07:b6b1 : d0 09 __ BNE $b6bc ; (export_seq.s55 + 0)
.s57:
07:b6b3 : a5 53 __ LDA T0 + 0 
07:b6b5 : 05 54 __ ORA T0 + 1 
07:b6b7 : d0 03 __ BNE $b6bc ; (export_seq.s55 + 0)
07:b6b9 : 4c 72 b7 JMP $b772 ; (export_seq.s54 + 0)
.s55:
07:b6bc : 98 __ __ TYA
07:b6bd : 29 0f __ AND #$0f
07:b6bf : aa __ __ TAX
07:b6c0 : 98 __ __ TYA
07:b6c1 : 29 80 __ AND #$80
07:b6c3 : 85 5e __ STA T9 + 0 
07:b6c5 : 98 __ __ TYA
07:b6c6 : 29 10 __ AND #$10
07:b6c8 : 85 5f __ STA T10 + 0 
07:b6ca : 98 __ __ TYA
07:b6cb : 29 40 __ AND #$40
07:b6cd : 85 60 __ STA T11 + 0 
07:b6cf : 98 __ __ TYA
07:b6d0 : 29 20 __ AND #$20
07:b6d2 : 85 5b __ STA T6 + 0 
07:b6d4 : ec c1 ab CPX $abc1 ; (projbuffer + 41)
07:b6d7 : f0 09 __ BEQ $b6e2 ; (export_seq.s60 + 0)
.s58:
07:b6d9 : 8e c1 ab STX $abc1 ; (projbuffer + 41)
07:b6dc : bd f0 b7 LDA $b7f0,x ; (seqcolor + 0)
07:b6df : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
.s60:
07:b6e2 : a5 5e __ LDA T9 + 0 
07:b6e4 : cd c5 ab CMP $abc5 ; (projbuffer + 45)
07:b6e7 : f0 10 __ BEQ $b6f9 ; (export_seq.s63 + 0)
.s61:
07:b6e9 : 09 00 __ ORA #$00
07:b6eb : 8d c5 ab STA $abc5 ; (projbuffer + 45)
07:b6ee : f0 04 __ BEQ $b6f4 ; (export_seq.s109 + 0)
.s108:
07:b6f0 : a9 0e __ LDA #$0e
07:b6f2 : d0 02 __ BNE $b6f6 ; (export_seq.s1052 + 0)
.s109:
07:b6f4 : a9 8e __ LDA #$8e
.s1052:
07:b6f6 : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
.s63:
07:b6f9 : a5 5b __ LDA T6 + 0 
07:b6fb : cd c2 ab CMP $abc2 ; (projbuffer + 42)
07:b6fe : f0 10 __ BEQ $b710 ; (export_seq.s66 + 0)
.s64:
07:b700 : 09 00 __ ORA #$00
07:b702 : 8d c2 ab STA $abc2 ; (projbuffer + 42)
07:b705 : f0 04 __ BEQ $b70b ; (export_seq.s112 + 0)
.s111:
07:b707 : a9 02 __ LDA #$02
07:b709 : d0 02 __ BNE $b70d ; (export_seq.s1050 + 0)
.s112:
07:b70b : a9 82 __ LDA #$82
.s1050:
07:b70d : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
.s66:
07:b710 : a5 60 __ LDA T11 + 0 
07:b712 : cd c4 ab CMP $abc4 ; (projbuffer + 44)
07:b715 : f0 10 __ BEQ $b727 ; (export_seq.s69 + 0)
.s67:
07:b717 : 09 00 __ ORA #$00
07:b719 : 8d c4 ab STA $abc4 ; (projbuffer + 44)
07:b71c : f0 04 __ BEQ $b722 ; (export_seq.s115 + 0)
.s114:
07:b71e : a9 12 __ LDA #$12
07:b720 : d0 02 __ BNE $b724 ; (export_seq.s1048 + 0)
.s115:
07:b722 : a9 92 __ LDA #$92
.s1048:
07:b724 : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
.s69:
07:b727 : a5 5f __ LDA T10 + 0 
07:b729 : cd c3 ab CMP $abc3 ; (projbuffer + 43)
07:b72c : f0 10 __ BEQ $b73e ; (export_seq.s56 + 0)
.s70:
07:b72e : 09 00 __ ORA #$00
07:b730 : 8d c3 ab STA $abc3 ; (projbuffer + 43)
07:b733 : f0 04 __ BEQ $b739 ; (export_seq.s1068 + 0)
.s1069:
07:b735 : a9 0f __ LDA #$0f
07:b737 : d0 02 __ BNE $b73b ; (export_seq.s1043 + 0)
.s1068:
07:b739 : a9 8f __ LDA #$8f
.s1043:
07:b73b : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
.s56:
07:b73e : a5 5c __ LDA T7 + 0 
07:b740 : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
07:b743 : 20 fc 51 JSR $51fc ; (krnio_status.s0 + 0)
07:b746 : 85 56 __ STA T3 + 0 
07:b748 : 09 00 __ ORA #$00
07:b74a : f0 0e __ BEQ $b75a ; (export_seq.s24 + 0)
.s73:
07:b74c : 20 fa 61 JSR $61fa ; (krnio_clrchn.s0 + 0)
07:b74f : a9 01 __ LDA #$01
07:b751 : 20 f9 51 JSR $51f9 ; (krnio_close.s0 + 0)
07:b754 : 20 cb 35 JSR $35cb ; (menu_fileerrormessage.s1000 + 0)
07:b757 : 4c df b5 JMP $b5df ; (export_seq.s1001 + 0)
.s24:
07:b75a : e6 57 __ INC T4 + 0 
07:b75c : d0 02 __ BNE $b760 ; (export_seq.s1072 + 0)
.s1071:
07:b75e : e6 58 __ INC T4 + 1 
.s1072:
07:b760 : a5 58 __ LDA T4 + 1 
07:b762 : c5 5a __ CMP T5 + 1 
07:b764 : d0 04 __ BNE $b76a ; (export_seq.s1005 + 0)
.s1004:
07:b766 : a5 57 __ LDA T4 + 0 
07:b768 : c5 59 __ CMP T5 + 0 
.s1005:
07:b76a : b0 03 __ BCS $b76f ; (export_seq.s1005 + 5)
07:b76c : 4c f5 b5 JMP $b5f5 ; (export_seq.l23 + 0)
07:b76f : 4c b9 b5 JMP $b5b9 ; (export_seq.s20 + 0)
.s54:
07:b772 : 98 __ __ TYA
07:b773 : 29 0f __ AND #$0f
07:b775 : 85 5d __ STA T8 + 0 
07:b777 : 8d c1 ab STA $abc1 ; (projbuffer + 41)
07:b77a : 98 __ __ TYA
07:b77b : 29 80 __ AND #$80
07:b77d : 85 5e __ STA T9 + 0 
07:b77f : 8d c5 ab STA $abc5 ; (projbuffer + 45)
07:b782 : 98 __ __ TYA
07:b783 : 29 10 __ AND #$10
07:b785 : 85 5f __ STA T10 + 0 
07:b787 : 8d c3 ab STA $abc3 ; (projbuffer + 43)
07:b78a : 98 __ __ TYA
07:b78b : 29 40 __ AND #$40
07:b78d : 85 60 __ STA T11 + 0 
07:b78f : 8d c4 ab STA $abc4 ; (projbuffer + 44)
07:b792 : 98 __ __ TYA
07:b793 : 29 20 __ AND #$20
07:b795 : 85 5b __ STA T6 + 0 
07:b797 : 8d c2 ab STA $abc2 ; (projbuffer + 42)
07:b79a : a9 93 __ LDA #$93
07:b79c : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
07:b79f : a6 5d __ LDX T8 + 0 
07:b7a1 : bd f0 b7 LDA $b7f0,x ; (seqcolor + 0)
07:b7a4 : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
07:b7a7 : a5 5e __ LDA T9 + 0 
07:b7a9 : f0 04 __ BEQ $b7af ; (export_seq.s1059 + 0)
.s1060:
07:b7ab : a9 0e __ LDA #$0e
07:b7ad : d0 02 __ BNE $b7b1 ; (export_seq.s1061 + 0)
.s1059:
07:b7af : a9 8e __ LDA #$8e
.s1061:
07:b7b1 : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
07:b7b4 : a5 5b __ LDA T6 + 0 
07:b7b6 : f0 04 __ BEQ $b7bc ; (export_seq.s1062 + 0)
.s1063:
07:b7b8 : a9 02 __ LDA #$02
07:b7ba : d0 02 __ BNE $b7be ; (export_seq.s1064 + 0)
.s1062:
07:b7bc : a9 82 __ LDA #$82
.s1064:
07:b7be : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
07:b7c1 : a5 60 __ LDA T11 + 0 
07:b7c3 : f0 04 __ BEQ $b7c9 ; (export_seq.s1065 + 0)
.s1066:
07:b7c5 : a9 12 __ LDA #$12
07:b7c7 : d0 02 __ BNE $b7cb ; (export_seq.s1067 + 0)
.s1065:
07:b7c9 : a9 92 __ LDA #$92
.s1067:
07:b7cb : 20 f9 71 JSR $71f9 ; (krnio_chrout.s0 + 0)
07:b7ce : a5 5f __ LDA T10 + 0 
07:b7d0 : d0 03 __ BNE $b7d5 ; (export_seq.s1067 + 10)
07:b7d2 : 4c 39 b7 JMP $b739 ; (export_seq.s1068 + 0)
07:b7d5 : 4c 35 b7 JMP $b735 ; (export_seq.s1069 + 0)
--------------------------------------------------------------------
07:b7d8 : __ __ __ BYT 73 41 56 45 20 53 43 52 45 45 4e 00             : sAVE SCREEN.
--------------------------------------------------------------------
07:b7e4 : __ __ __ BYT 53 3a 25 53 00                                  : S:%S.
--------------------------------------------------------------------
07:b7e9 : __ __ __ BYT 25 53 2c 53 2c 57 00                            : %S,S,W.
--------------------------------------------------------------------
seqcolor:
07:b7f0 : __ __ __ BYT 90 98 1f 9a 1e 99 97 9f 1c 96 9c 9c 95 9e 9b 05 : ................
--------------------------------------------------------------------
07:b800 : __ __ __ BYT 65 58 50 4f 52 54 49 4e 47 20 44 41 54 41 20 54 : eXPORTING DATA T
07:b810 : __ __ __ BYT 4f 20 44 49 53 4b 2e 00                         : O DISK..
