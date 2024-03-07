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
1c13 : 8e fd 2a STX $2afd ; (spentry + 0)
1c16 : a9 d8 __ LDA #$d8
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 5b __ LDA #$5b
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 5e __ LDA #$5e
1c21 : e9 5b __ SBC #$5b
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
1c35 : a9 d5 __ LDA #$d5
1c37 : e9 d8 __ SBC #$d8
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
1c50 : a9 9f __ LDA #$9f
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
1c84 : 9d a1 ab STA $aba1,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 08 __ SBC #$08
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a9 7f __ LDA #$7f
1c97 : 8d d8 5b STA $5bd8 ; (winCfg + 0)
1c9a : a9 00 __ LDA #$00
1c9c : 8d db 5b STA $5bdb ; (winCfg + 3)
1c9f : 8d dd 5b STA $5bdd ; (winCfg + 5)
1ca2 : 8d d9 5b STA $5bd9 ; (winCfg + 1)
1ca5 : 8d de 5b STA $5bde ; (winCfg + 6)
1ca8 : a9 20 __ LDA #$20
1caa : 8d dc 5b STA $5bdc ; (winCfg + 4)
1cad : 8d da 5b STA $5bda ; (winCfg + 2)
1cb0 : 8d df 5b STA $5bdf ; (winCfg + 7)
1cb3 : 20 9b 22 JSR $229b ; (bnk_init.s1000 + 0)
1cb6 : 20 33 2b JSR $2b33 ; (vdcwin_viewport_init.s0 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 8d fc 57 STA $57fc ; (charsetchanged + 0)
1cbe : 8d fd 57 STA $57fd ; (charsetchanged + 1)
1cc1 : 8d fe 57 STA $57fe ; (appexit + 0)
1cc4 : 8d fd 5a STA $5afd ; (screen_col + 0)
1cc7 : 8d fe 5a STA $5afe ; (screen_col + 1)
1cca : 8d f0 5b STA $5bf0 ; (screen_row + 0)
1ccd : 8d f1 5b STA $5bf1 ; (screen_row + 1)
1cd0 : 8d ff 57 STA $57ff ; (screenbackground + 0)
1cd3 : 8d ff 5a STA $5aff ; (plotscreencode + 0)
1cd6 : 8d f5 5b STA $5bf5 ; (plotreverse + 0)
1cd9 : 8d f6 5b STA $5bf6 ; (plotunderline + 0)
1cdc : 8d f7 5b STA $5bf7 ; (plotblink + 0)
1cdf : 8d f8 5b STA $5bf8 ; (plotaltchar + 0)
1ce2 : a9 0f __ LDA #$0f
1ce4 : 8d f4 5b STA $5bf4 ; (plotcolor + 0)
1ce7 : ad 03 5c LDA $5c03 ; (canvas + 3)
1cea : 85 03 __ STA WORK + 0 
1cec : a0 06 __ LDY #$06
1cee : 91 23 __ STA (SP + 0),y 
1cf0 : ad 04 5c LDA $5c04 ; (canvas + 4)
1cf3 : 85 04 __ STA WORK + 1 
1cf5 : c8 __ __ INY
1cf6 : 91 23 __ STA (SP + 0),y 
1cf8 : ad 05 5c LDA $5c05 ; (canvas + 5)
1cfb : 85 1b __ STA ACCU + 0 
1cfd : ad 06 5c LDA $5c06 ; (canvas + 6)
1d00 : 85 1c __ STA ACCU + 1 
1d02 : 20 46 56 JSR $5646 ; (mul16 + 0)
1d05 : a5 05 __ LDA WORK + 2 
1d07 : 8d f2 5b STA $5bf2 ; (screentotal + 0)
1d0a : a5 06 __ LDA WORK + 3 
1d0c : 8d f3 5b STA $5bf3 ; (screentotal + 1)
1d0f : a9 70 __ LDA #$70
1d11 : a0 02 __ LDY #$02
1d13 : 91 23 __ STA (SP + 0),y 
1d15 : a9 58 __ LDA #$58
1d17 : c8 __ __ INY
1d18 : 91 23 __ STA (SP + 0),y 
1d1a : a9 05 __ LDA #$05
1d1c : c8 __ __ INY
1d1d : 91 23 __ STA (SP + 0),y 
1d1f : a9 2c __ LDA #$2c
1d21 : c8 __ __ INY
1d22 : 91 23 __ STA (SP + 0),y 
1d24 : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
1d27 : a9 80 __ LDA #$80
1d29 : a0 02 __ LDY #$02
1d2b : 91 23 __ STA (SP + 0),y 
1d2d : a9 58 __ LDA #$58
1d2f : c8 __ __ INY
1d30 : 91 23 __ STA (SP + 0),y 
1d32 : a9 13 __ LDA #$13
1d34 : c8 __ __ INY
1d35 : 91 23 __ STA (SP + 0),y 
1d37 : a9 2c __ LDA #$2c
1d39 : c8 __ __ INY
1d3a : 91 23 __ STA (SP + 0),y 
1d3c : ad 05 5c LDA $5c05 ; (canvas + 5)
1d3f : c8 __ __ INY
1d40 : 91 23 __ STA (SP + 0),y 
1d42 : ad 06 5c LDA $5c06 ; (canvas + 6)
1d45 : c8 __ __ INY
1d46 : 91 23 __ STA (SP + 0),y 
1d48 : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
1d4b : a9 00 __ LDA #$00
1d4d : a0 06 __ LDY #$06
1d4f : 91 23 __ STA (SP + 0),y 
1d51 : c8 __ __ INY
1d52 : 91 23 __ STA (SP + 0),y 
1d54 : a9 90 __ LDA #$90
1d56 : a0 02 __ LDY #$02
1d58 : 91 23 __ STA (SP + 0),y 
1d5a : a9 58 __ LDA #$58
1d5c : c8 __ __ INY
1d5d : 91 23 __ STA (SP + 0),y 
1d5f : a9 21 __ LDA #$21
1d61 : c8 __ __ INY
1d62 : 91 23 __ STA (SP + 0),y 
1d64 : a9 2c __ LDA #$2c
1d66 : c8 __ __ INY
1d67 : 91 23 __ STA (SP + 0),y 
1d69 : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
1d6c : a5 ba __ LDA $ba 
1d6e : d0 02 __ BNE $1d72 ; (main.s1126 + 0)
.s4:
1d70 : a9 08 __ LDA #$08
.s1126:
1d72 : 8d fb 57 STA $57fb ; (bootdevice + 0)
1d75 : 20 32 2c JSR $2c32 ; (vdc_init.s1000 + 0)
1d78 : a9 3d __ LDA #$3d
1d7a : 85 16 __ STA P9 
1d7c : a9 33 __ LDA #$33
1d7e : 85 17 __ STA P10 
1d80 : ad 15 5c LDA $5c15 ; (vdc_state + 0)
1d83 : c9 40 __ CMP #$40
1d85 : d0 2c __ BNE $1db3 ; (main.s10 + 0)
.s8:
1d87 : a9 03 __ LDA #$03
1d89 : 8d b3 5a STA $5ab3 ; (pulldown_options + 3)
1d8c : a9 01 __ LDA #$01
1d8e : 8d ff 2a STA $2aff ; (undoenabled + 0)
1d91 : a9 00 __ LDA #$00
1d93 : 8d fb 5b STA $5bfb ; (undonumber + 0)
1d96 : 8d fc 5b STA $5bfc ; (undo_undopossible + 0)
1d99 : 8d fd 5b STA $5bfd ; (undo_redopossible + 0)
1d9c : a2 ff __ LDX #$ff
.l1120:
1d9e : e8 __ __ INX
1d9f : bd d2 31 LDA $31d2,x 
1da2 : 9d b0 59 STA $59b0,x ; (pulldown_titles + 320)
1da5 : d0 f7 __ BNE $1d9e ; (main.l1120 + 0)
.s1121:
1da7 : ad 29 5c LDA $5c29 ; (vdc_state + 20)
1daa : 8d f9 5b STA $5bf9 ; (undoaddress + 0)
1dad : ad 2a 5c LDA $5c2a ; (vdc_state + 21)
1db0 : 8d fa 5b STA $5bfa ; (undoaddress + 1)
.s10:
1db3 : 20 e2 31 JSR $31e2 ; (printcentered.s0 + 0)
1db6 : a9 01 __ LDA #$01
1db8 : 85 10 __ STA P3 
1dba : ad fb 57 LDA $57fb ; (bootdevice + 0)
1dbd : 85 56 __ STA T2 + 0 
1dbf : 85 0f __ STA P2 
1dc1 : a9 58 __ LDA #$58
1dc3 : 85 12 __ STA P5 
1dc5 : a9 4f __ LDA #$4f
1dc7 : 85 13 __ STA P6 
1dc9 : a9 33 __ LDA #$33
1dcb : 85 14 __ STA P7 
1dcd : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
1dd0 : a5 1b __ LDA ACCU + 0 
1dd2 : d0 09 __ BNE $1ddd ; (main.s11 + 0)
.s12:
1dd4 : 20 59 33 JSR $3359 ; (menu_fileerrormessage.s1000 + 0)
1dd7 : 20 ef 2a JSR $2aef ; (exit@proxy + 0)
1dda : 4c e4 1d JMP $1de4 ; (main.s13 + 0)
.s11:
1ddd : a9 58 __ LDA #$58
1ddf : 85 13 __ STA P6 
1de1 : 20 26 15 JSR $1526 ; (bnk_cpytovdc@proxy + 0)
.s13:
1de4 : a9 69 __ LDA #$69
1de6 : 85 16 __ STA P9 
1de8 : a9 39 __ LDA #$39
1dea : 85 17 __ STA P10 
1dec : 20 e2 31 JSR $31e2 ; (printcentered.s0 + 0)
1def : a5 56 __ LDA T2 + 0 
1df1 : 85 0f __ STA P2 
1df3 : a9 0e __ LDA #$0e
1df5 : 85 10 __ STA P3 
1df7 : a9 0c __ LDA #$0c
1df9 : 85 12 __ STA P5 
1dfb : a9 7d __ LDA #$7d
1dfd : 85 13 __ STA P6 
1dff : a9 39 __ LDA #$39
1e01 : 85 14 __ STA P7 
1e03 : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
1e06 : a5 1b __ LDA ACCU + 0 
1e08 : d0 06 __ BNE $1e10 ; (main.s16 + 0)
.s14:
1e0a : 20 59 33 JSR $3359 ; (menu_fileerrormessage.s1000 + 0)
1e0d : 20 ef 2a JSR $2aef ; (exit@proxy + 0)
.s16:
1e10 : a9 87 __ LDA #$87
1e12 : 85 16 __ STA P9 
1e14 : a9 39 __ LDA #$39
1e16 : 85 17 __ STA P10 
1e18 : 20 e2 31 JSR $31e2 ; (printcentered.s0 + 0)
1e1b : a9 40 __ LDA #$40
1e1d : 85 12 __ STA P5 
1e1f : a9 95 __ LDA #$95
1e21 : 85 13 __ STA P6 
1e23 : a9 39 __ LDA #$39
1e25 : 85 14 __ STA P7 
1e27 : 20 17 15 JSR $1517 ; (bnk_load@proxy + 0)
1e2a : a5 1b __ LDA ACCU + 0 
1e2c : d0 06 __ BNE $1e34 ; (main.s19 + 0)
.s17:
1e2e : 20 59 33 JSR $3359 ; (menu_fileerrormessage.s1000 + 0)
1e31 : 20 ef 2a JSR $2aef ; (exit@proxy + 0)
.s19:
1e34 : a9 48 __ LDA #$48
1e36 : 85 12 __ STA P5 
1e38 : a9 9f __ LDA #$9f
1e3a : 85 13 __ STA P6 
1e3c : a9 39 __ LDA #$39
1e3e : 85 14 __ STA P7 
1e40 : 20 17 15 JSR $1517 ; (bnk_load@proxy + 0)
1e43 : a5 1b __ LDA ACCU + 0 
1e45 : d0 06 __ BNE $1e4d ; (main.s22 + 0)
.s20:
1e47 : 20 59 33 JSR $3359 ; (menu_fileerrormessage.s1000 + 0)
1e4a : 20 ef 2a JSR $2aef ; (exit@proxy + 0)
.s22:
1e4d : 20 7d 14 JSR $147d ; (bnk_memcpy.s0 + 0)
1e50 : a9 20 __ LDA #$20
1e52 : 8d fb ab STA $abfb ; (sstack + 5)
1e55 : a9 0f __ LDA #$0f
1e57 : 8d fc ab STA $abfc ; (sstack + 6)
1e5a : 20 a9 39 JSR $39a9 ; (screenmapfill.s0 + 0)
1e5d : a9 b2 __ LDA #$b2
1e5f : 85 16 __ STA P9 
1e61 : a9 3a __ LDA #$3a
1e63 : 85 17 __ STA P10 
1e65 : 20 e2 31 JSR $31e2 ; (printcentered.s0 + 0)
1e68 : 20 ac 2e JSR $2eac ; (getch.s0 + 0)
1e6b : 20 6f 2d JSR $2d6f ; (vdc_cls.s0 + 0)
1e6e : 20 c6 3a JSR $3ac6 ; (plotcursor.s0 + 0)
1e71 : a9 01 __ LDA #$01
1e73 : 8d fe 5b STA $5bfe ; (showbar + 0)
1e76 : a2 ff __ LDX #$ff
.l1002:
1e78 : e8 __ __ INX
1e79 : bd f7 37 LDA $37f7,x 
1e7c : 9d e5 5c STA $5ce5,x ; (programmode + 0)
1e7f : d0 f7 __ BNE $1e78 ; (main.l1002 + 0)
.s1003:
1e81 : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
.l25:
1e84 : 20 43 3c JSR $3c43 ; (printstatusbar.s1000 + 0)
.l27:
1e87 : 20 1a 38 JSR $381a ; (vdcwin_getch.s0 + 0)
1e8a : a5 1b __ LDA ACCU + 0 
1e8c : c9 4c __ CMP #$4c
1e8e : f0 71 __ BEQ $1f01 ; (main.s235 + 0)
.s124:
1e90 : 85 53 __ STA T0 + 0 
1e92 : 85 55 __ STA T1 + 0 
1e94 : c9 4c __ CMP #$4c
1e96 : b0 03 __ BCS $1e9b ; (main.s125 + 0)
1e98 : 4c e0 1f JMP $1fe0 ; (main.s126 + 0)
.s125:
1e9b : c9 59 __ CMP #$59
1e9d : d0 03 __ BNE $1ea2 ; (main.s154 + 0)
1e9f : 4c c8 1f JMP $1fc8 ; (main.s89 + 0)
.s154:
1ea2 : b0 03 __ BCS $1ea7 ; (main.s155 + 0)
1ea4 : 4c 7b 1f JMP $1f7b ; (main.s156 + 0)
.s155:
1ea7 : c9 8c __ CMP #$8c
1ea9 : d0 06 __ BNE $1eb1 ; (main.s169 + 0)
.s112:
1eab : 20 80 54 JSR $5480 ; (helpscreen_load.s1000 + 0)
1eae : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s169:
1eb1 : b0 03 __ BCS $1eb6 ; (main.s170 + 0)
1eb3 : 4c 3d 1f JMP $1f3d ; (main.s171 + 0)
.s170:
1eb6 : c9 91 __ CMP #$91
1eb8 : f0 04 __ BEQ $1ebe ; (main.s29 + 0)
.s177:
1eba : c9 9d __ CMP #$9d
1ebc : d0 0b __ BNE $1ec9 ; (main.s114 + 0)
.s29:
1ebe : a5 1b __ LDA ACCU + 0 
1ec0 : 8d ff ab STA $abff ; (sstack + 9)
1ec3 : 20 20 3e JSR $3e20 ; (plotmove.s1000 + 0)
1ec6 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s114:
1ec9 : c9 30 __ CMP #$30
1ecb : 90 18 __ BCC $1ee5 ; (main.s117 + 0)
.s118:
1ecd : c9 3a __ CMP #$3a
1ecf : b0 14 __ BCS $1ee5 ; (main.s117 + 0)
.s115:
1ed1 : 0a __ __ ASL
1ed2 : aa __ __ TAX
1ed3 : bd 61 5e LDA $5e61,x ; (Undo + 191)
1ed6 : 8d ff 5a STA $5aff ; (plotscreencode + 0)
1ed9 : bd 62 5e LDA $5e62,x ; (Undo + 192)
1edc : 8d f8 5b STA $5bf8 ; (plotaltchar + 0)
1edf : 20 c6 3a JSR $3ac6 ; (plotcursor.s0 + 0)
1ee2 : 4c eb 1e JMP $1eeb ; (main.s122 + 0)
.s117:
1ee5 : a9 20 __ LDA #$20
1ee7 : c5 1b __ CMP ACCU + 0 
1ee9 : b0 16 __ BCS $1f01 ; (main.s235 + 0)
.s122:
1eeb : a5 53 __ LDA T0 + 0 
1eed : c9 2b __ CMP #$2b
1eef : b0 10 __ BCS $1f01 ; (main.s235 + 0)
.s119:
1ef1 : a5 55 __ LDA T1 + 0 
1ef3 : 0a __ __ ASL
1ef4 : aa __ __ TAX
1ef5 : ad ff 5a LDA $5aff ; (plotscreencode + 0)
1ef8 : 9d 7f 5e STA $5e7f,x ; (Undo + 221)
1efb : ad f8 5b LDA $5bf8 ; (plotaltchar + 0)
1efe : 9d 80 5e STA $5e80,x ; (Undo + 222)
.s235:
1f01 : ad fe 57 LDA $57fe ; (appexit + 0)
1f04 : d0 0b __ BNE $1f11 ; (main.s24 + 0)
.s23:
1f06 : ad fe 5b LDA $5bfe ; (showbar + 0)
1f09 : d0 03 __ BNE $1f0e ; (main.s23 + 8)
1f0b : 4c 87 1e JMP $1e87 ; (main.l27 + 0)
1f0e : 4c 84 1e JMP $1e84 ; (main.l25 + 0)
.s24:
1f11 : a9 00 __ LDA #$00
1f13 : 20 ef 2e JSR $2eef ; (fastmode.s0 + 0)
1f16 : 20 0e 2f JSR $2f0e ; (vdc_set_mode@proxy + 0)
1f19 : 20 6f 2d JSR $2d6f ; (vdc_cls.s0 + 0)
1f1c : a9 04 __ LDA #$04
1f1e : 8d 06 d5 STA $d506 
1f21 : a9 00 __ LDA #$00
1f23 : 85 1b __ STA ACCU + 0 
1f25 : 85 1c __ STA ACCU + 1 
.s1001:
1f27 : 18 __ __ CLC
1f28 : a5 23 __ LDA SP + 0 
1f2a : 69 08 __ ADC #$08
1f2c : 85 23 __ STA SP + 0 
1f2e : 90 02 __ BCC $1f32 ; (main.s1001 + 11)
1f30 : e6 24 __ INC SP + 1 
1f32 : a2 05 __ LDX #$05
1f34 : bd a1 ab LDA $aba1,x ; (main@stack + 0)
1f37 : 95 53 __ STA T0 + 0,x 
1f39 : ca __ __ DEX
1f3a : 10 f8 __ BPL $1f34 ; (main.s1001 + 13)
1f3c : 60 __ __ RTS
.s171:
1f3d : c9 85 __ CMP #$85
1f3f : d0 12 __ BNE $1f53 ; (main.s172 + 0)
.s110:
1f41 : 20 09 3b JSR $3b09 ; (vdcwin_cursor_show@proxy + 0)
1f44 : 20 53 4e JSR $4e53 ; (mainmenuloop.s1000 + 0)
1f47 : 20 c6 3a JSR $3ac6 ; (plotcursor.s0 + 0)
1f4a : ad f4 5b LDA $5bf4 ; (plotcolor + 0)
1f4d : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
1f50 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s172:
1f53 : b0 19 __ BCS $1f6e ; (main.s173 + 0)
.s174:
1f55 : c9 5a __ CMP #$5a
1f57 : f0 03 __ BEQ $1f5c ; (main.s84 + 0)
1f59 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s84:
1f5c : ad ff 2a LDA $2aff ; (undoenabled + 0)
1f5f : c9 01 __ CMP #$01
1f61 : d0 9e __ BNE $1f01 ; (main.s235 + 0)
.s88:
1f63 : ad fc 5b LDA $5bfc ; (undo_undopossible + 0)
1f66 : f0 99 __ BEQ $1f01 ; (main.s235 + 0)
.s85:
1f68 : 20 45 47 JSR $4745 ; (undo_performundo.s1000 + 0)
1f6b : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s173:
1f6e : c9 8b __ CMP #$8b
1f70 : f0 03 __ BEQ $1f75 ; (main.s111 + 0)
1f72 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s111:
1f75 : 20 5c 54 JSR $545c ; (togglestatusbar.s0 + 0)
1f78 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s156:
1f7b : c9 53 __ CMP #$53
1f7d : f0 82 __ BEQ $1f01 ; (main.s235 + 0)
.s157:
1f7f : b0 29 __ BCS $1faa ; (main.s158 + 0)
.s159:
1f81 : c9 50 __ CMP #$50
1f83 : d0 03 __ BNE $1f88 ; (main.s160 + 0)
1f85 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s160:
1f88 : b0 0a __ BCS $1f94 ; (main.s161 + 0)
.s162:
1f8a : c9 4d __ CMP #$4d
1f8c : d0 03 __ BNE $1f91 ; (main.s162 + 7)
1f8e : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
1f91 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s161:
1f94 : c9 52 __ CMP #$52
1f96 : f0 03 __ BEQ $1f9b ; (main.s58 + 0)
1f98 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s58:
1f9b : a9 00 __ LDA #$00
1f9d : cd f5 5b CMP $5bf5 ; (plotreverse + 0)
1fa0 : 2a __ __ ROL
1fa1 : 8d f5 5b STA $5bf5 ; (plotreverse + 0)
.s282:
1fa4 : 20 c6 3a JSR $3ac6 ; (plotcursor.s0 + 0)
1fa7 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s158:
1faa : c9 55 __ CMP #$55
1fac : d0 0b __ BNE $1fb9 ; (main.s165 + 0)
.s56:
1fae : a9 00 __ LDA #$00
1fb0 : cd f6 5b CMP $5bf6 ; (plotunderline + 0)
1fb3 : 2a __ __ ROL
1fb4 : 8d f6 5b STA $5bf6 ; (plotunderline + 0)
1fb7 : 90 eb __ BCC $1fa4 ; (main.s282 + 0)
.s165:
1fb9 : b0 03 __ BCS $1fbe ; (main.s166 + 0)
1fbb : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s166:
1fbe : c9 57 __ CMP #$57
1fc0 : d0 03 __ BNE $1fc5 ; (main.s166 + 7)
1fc2 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
1fc5 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s89:
1fc8 : ad ff 2a LDA $2aff ; (undoenabled + 0)
1fcb : c9 01 __ CMP #$01
1fcd : f0 03 __ BEQ $1fd2 ; (main.s93 + 0)
1fcf : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s93:
1fd2 : ad fd 5b LDA $5bfd ; (undo_redopossible + 0)
1fd5 : d0 03 __ BNE $1fda ; (main.s90 + 0)
1fd7 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s90:
1fda : 20 06 4a JSR $4a06 ; (undo_performredo.s1000 + 0)
1fdd : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s126:
1fe0 : c9 2d __ CMP #$2d
1fe2 : d0 07 __ BNE $1feb ; (main.s127 + 0)
.s31:
1fe4 : ae ff 5a LDX $5aff ; (plotscreencode + 0)
1fe7 : ca __ __ DEX
1fe8 : 4c ba 20 JMP $20ba ; (main.s284 + 0)
.s127:
1feb : 90 03 __ BCC $1ff0 ; (main.s129 + 0)
1fed : 4c 47 21 JMP $2147 ; (main.s128 + 0)
.s129:
1ff0 : c9 1d __ CMP #$1d
1ff2 : d0 03 __ BNE $1ff7 ; (main.s130 + 0)
1ff4 : 4c be 1e JMP $1ebe ; (main.s29 + 0)
.s130:
1ff7 : b0 03 __ BCS $1ffc ; (main.s131 + 0)
1ff9 : 4c c1 20 JMP $20c1 ; (main.s132 + 0)
.s131:
1ffc : c9 2b __ CMP #$2b
1ffe : d0 07 __ BNE $2007 ; (main.s138 + 0)
.s30:
2000 : ae ff 5a LDX $5aff ; (plotscreencode + 0)
2003 : e8 __ __ INX
2004 : 4c ba 20 JMP $20ba ; (main.s284 + 0)
.s138:
2007 : b0 76 __ BCS $207f ; (main.s32 + 0)
.s140:
2009 : c9 20 __ CMP #$20
200b : f0 03 __ BEQ $2010 ; (main.s96 + 0)
200d : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s96:
2010 : ad ff 2a LDA $2aff ; (undoenabled + 0)
2013 : c9 01 __ CMP #$01
2015 : d0 1a __ BNE $2031 ; (main.s99 + 0)
.s97:
2017 : 85 18 __ STA P11 
2019 : 8d f6 ab STA $abf6 ; (sstack + 0)
201c : ad 09 5c LDA $5c09 ; (canvas + 9)
201f : 18 __ __ CLC
2020 : 6d f0 5b ADC $5bf0 ; (screen_row + 0)
2023 : 85 16 __ STA P9 
2025 : ad 07 5c LDA $5c07 ; (canvas + 7)
2028 : 18 __ __ CLC
2029 : 6d fd 5a ADC $5afd ; (screen_col + 0)
202c : 85 17 __ STA P10 
202e : 20 e3 4b JSR $4be3 ; (undo_new.s1000 + 0)
.s99:
2031 : ad 09 5c LDA $5c09 ; (canvas + 9)
2034 : 18 __ __ CLC
2035 : 6d f0 5b ADC $5bf0 ; (screen_row + 0)
2038 : 85 10 __ STA P3 
203a : ad 07 5c LDA $5c07 ; (canvas + 7)
203d : 18 __ __ CLC
203e : 6d fd 5a ADC $5afd ; (screen_col + 0)
2041 : 85 11 __ STA P4 
2043 : ad ff 5a LDA $5aff ; (plotscreencode + 0)
2046 : 85 12 __ STA P5 
2048 : ad f7 5b LDA $5bf7 ; (plotblink + 0)
204b : 0a __ __ ASL
204c : 0a __ __ ASL
204d : 0a __ __ ASL
204e : 0a __ __ ASL
204f : 18 __ __ CLC
2050 : 6d f4 5b ADC $5bf4 ; (plotcolor + 0)
2053 : 85 53 __ STA T0 + 0 
2055 : ad f6 5b LDA $5bf6 ; (plotunderline + 0)
2058 : 4a __ __ LSR
2059 : 6a __ __ ROR
205a : 6a __ __ ROR
205b : 29 c0 __ AND #$c0
205d : 6a __ __ ROR
205e : 65 53 __ ADC T0 + 0 
2060 : 85 53 __ STA T0 + 0 
2062 : ad f5 5b LDA $5bf5 ; (plotreverse + 0)
2065 : 4a __ __ LSR
2066 : 6a __ __ ROR
2067 : 29 80 __ AND #$80
2069 : 6a __ __ ROR
206a : 65 53 __ ADC T0 + 0 
206c : 85 53 __ STA T0 + 0 
206e : ad f8 5b LDA $5bf8 ; (plotaltchar + 0)
2071 : 4a __ __ LSR
2072 : a9 00 __ LDA #$00
2074 : 6a __ __ ROR
2075 : 65 53 __ ADC T0 + 0 
2077 : 85 13 __ STA P6 
.s283:
2079 : 20 d9 4d JSR $4dd9 ; (screenmapplot.s0 + 0)
207c : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s32:
207f : ad f4 5b LDA $5bf4 ; (plotcolor + 0)
2082 : f0 2a __ BEQ $20ae ; (main.s33 + 0)
.s34:
2084 : 38 __ __ SEC
2085 : e9 01 __ SBC #$01
2087 : 85 53 __ STA T0 + 0 
2089 : cd ff 57 CMP $57ff ; (screenbackground + 0)
208c : d0 0d __ BNE $209b ; (main.s38 + 0)
.s36:
208e : a5 53 __ LDA T0 + 0 
2090 : f0 05 __ BEQ $2097 ; (main.s39 + 0)
.s40:
2092 : c6 53 __ DEC T0 + 0 
2094 : 4c 9b 20 JMP $209b ; (main.s38 + 0)
.s39:
2097 : a9 0f __ LDA #$0f
.s1128:
2099 : 85 53 __ STA T0 + 0 
.s38:
209b : a5 53 __ LDA T0 + 0 
209d : 8d f4 5b STA $5bf4 ; (plotcolor + 0)
20a0 : ad 1c 5c LDA $5c1c ; (vdc_state + 7)
20a3 : 29 f0 __ AND #$f0
20a5 : 18 __ __ CLC
20a6 : 65 53 __ ADC T0 + 0 
.s1127:
20a8 : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
20ab : 4c a4 1f JMP $1fa4 ; (main.s282 + 0)
.s33:
20ae : a9 0f __ LDA #$0f
20b0 : 85 53 __ STA T0 + 0 
20b2 : cd ff 57 CMP $57ff ; (screenbackground + 0)
20b5 : d0 e4 __ BNE $209b ; (main.s38 + 0)
20b7 : 4c 8e 20 JMP $208e ; (main.s36 + 0)
.s284:
20ba : 8a __ __ TXA
.s1125:
20bb : 8d ff 5a STA $5aff ; (plotscreencode + 0)
20be : 4c a4 1f JMP $1fa4 ; (main.s282 + 0)
.s132:
20c1 : c9 13 __ CMP #$13
20c3 : f0 51 __ BEQ $2116 ; (main.s106 + 0)
.s133:
20c5 : b0 0a __ BCS $20d1 ; (main.s134 + 0)
.s135:
20c7 : c9 11 __ CMP #$11
20c9 : f0 03 __ BEQ $20ce ; (main.s135 + 7)
20cb : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
20ce : 4c be 1e JMP $1ebe ; (main.s29 + 0)
.s134:
20d1 : c9 14 __ CMP #$14
20d3 : f0 03 __ BEQ $20d8 ; (main.s102 + 0)
20d5 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s102:
20d8 : ad ff 2a LDA $2aff ; (undoenabled + 0)
20db : c9 01 __ CMP #$01
20dd : d0 1a __ BNE $20f9 ; (main.s105 + 0)
.s103:
20df : 85 18 __ STA P11 
20e1 : 8d f6 ab STA $abf6 ; (sstack + 0)
20e4 : ad 09 5c LDA $5c09 ; (canvas + 9)
20e7 : 18 __ __ CLC
20e8 : 6d f0 5b ADC $5bf0 ; (screen_row + 0)
20eb : 85 16 __ STA P9 
20ed : ad 07 5c LDA $5c07 ; (canvas + 7)
20f0 : 18 __ __ CLC
20f1 : 6d fd 5a ADC $5afd ; (screen_col + 0)
20f4 : 85 17 __ STA P10 
20f6 : 20 e3 4b JSR $4be3 ; (undo_new.s1000 + 0)
.s105:
20f9 : a9 20 __ LDA #$20
20fb : 85 12 __ STA P5 
20fd : a9 0f __ LDA #$0f
20ff : 85 13 __ STA P6 
2101 : ad 09 5c LDA $5c09 ; (canvas + 9)
2104 : 18 __ __ CLC
2105 : 6d f0 5b ADC $5bf0 ; (screen_row + 0)
2108 : 85 10 __ STA P3 
210a : ad 07 5c LDA $5c07 ; (canvas + 7)
210d : 18 __ __ CLC
210e : 6d fd 5a ADC $5afd ; (screen_col + 0)
2111 : 85 11 __ STA P4 
2113 : 4c 79 20 JMP $2079 ; (main.s283 + 0)
.s106:
2116 : a9 00 __ LDA #$00
2118 : 8d f0 5b STA $5bf0 ; (screen_row + 0)
211b : 8d f1 5b STA $5bf1 ; (screen_row + 1)
211e : 8d fd 5a STA $5afd ; (screen_col + 0)
2121 : 8d fe 5a STA $5afe ; (screen_col + 1)
2124 : 8d 07 5c STA $5c07 ; (canvas + 7)
2127 : 8d 08 5c STA $5c08 ; (canvas + 8)
212a : 8d 09 5c STA $5c09 ; (canvas + 9)
212d : 8d 0a 5c STA $5c0a ; (canvas + 10)
2130 : 20 06 58 JSR $5806 ; (vdcwin_cpy_viewport@proxy + 0)
2133 : ad fe 5b LDA $5bfe ; (showbar + 0)
2136 : f0 03 __ BEQ $213b ; (main.s109 + 0)
.s107:
2138 : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
.s109:
213b : a9 00 __ LDA #$00
213d : 85 0d __ STA P0 
213f : 85 0e __ STA P1 
2141 : 20 4c 4e JSR $4e4c ; (gotoxy.s0 + 0)
2144 : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s128:
2147 : c9 43 __ CMP #$43
2149 : d0 03 __ BNE $214e ; (main.s142 + 0)
214b : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
.s142:
214e : b0 03 __ BCS $2153 ; (main.s143 + 0)
2150 : 4c 46 22 JMP $2246 ; (main.s144 + 0)
.s143:
2153 : c9 47 __ CMP #$47
2155 : f0 1c __ BEQ $2173 ; (main.s62 + 0)
.s149:
2157 : b0 0a __ BCS $2163 ; (main.s150 + 0)
.s151:
2159 : c9 45 __ CMP #$45
215b : d0 03 __ BNE $2160 ; (main.s151 + 7)
215d : 4c 01 1f JMP $1f01 ; (main.s235 + 0)
2160 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s150:
2163 : c9 49 __ CMP #$49
2165 : f0 03 __ BEQ $216a ; (main.s95 + 0)
2167 : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s95:
216a : ad ff 5a LDA $5aff ; (plotscreencode + 0)
216d : 18 __ __ CLC
216e : 69 80 __ ADC #$80
2170 : 4c bb 20 JMP $20bb ; (main.s1125 + 0)
.s62:
2173 : ad 07 5c LDA $5c07 ; (canvas + 7)
2176 : 18 __ __ CLC
2177 : 6d fd 5a ADC $5afd ; (screen_col + 0)
217a : 85 53 __ STA T0 + 0 
217c : ad 08 5c LDA $5c08 ; (canvas + 8)
217f : 6d fe 5a ADC $5afe ; (screen_col + 1)
2182 : 85 54 __ STA T0 + 1 
2184 : ad 09 5c LDA $5c09 ; (canvas + 9)
2187 : 18 __ __ CLC
2188 : 6d f0 5b ADC $5bf0 ; (screen_row + 0)
218b : 85 03 __ STA WORK + 0 
218d : ad 0a 5c LDA $5c0a ; (canvas + 10)
2190 : 6d f1 5b ADC $5bf1 ; (screen_row + 1)
2193 : 85 04 __ STA WORK + 1 
2195 : ad 03 5c LDA $5c03 ; (canvas + 3)
2198 : 85 57 __ STA T4 + 0 
219a : 85 1b __ STA ACCU + 0 
219c : ad 04 5c LDA $5c04 ; (canvas + 4)
219f : 85 58 __ STA T4 + 1 
21a1 : 85 1c __ STA ACCU + 1 
21a3 : 20 46 56 JSR $5646 ; (mul16 + 0)
21a6 : 18 __ __ CLC
21a7 : a5 06 __ LDA WORK + 3 
21a9 : 69 58 __ ADC #$58
21ab : aa __ __ TAX
21ac : 18 __ __ CLC
21ad : a5 05 __ LDA WORK + 2 
21af : 65 53 __ ADC T0 + 0 
21b1 : 85 0d __ STA P0 
21b3 : 8a __ __ TXA
21b4 : 65 54 __ ADC T0 + 1 
21b6 : 85 0e __ STA P1 
21b8 : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
21bb : 8d ff 5a STA $5aff ; (plotscreencode + 0)
21be : ad 05 5c LDA $5c05 ; (canvas + 5)
21c1 : 85 1b __ STA ACCU + 0 
21c3 : ad 06 5c LDA $5c06 ; (canvas + 6)
21c6 : 85 1c __ STA ACCU + 1 
21c8 : a5 57 __ LDA T4 + 0 
21ca : 85 03 __ STA WORK + 0 
21cc : a5 58 __ LDA T4 + 1 
21ce : 85 04 __ STA WORK + 1 
21d0 : 20 46 56 JSR $5646 ; (mul16 + 0)
21d3 : 18 __ __ CLC
21d4 : a5 05 __ LDA WORK + 2 
21d6 : 65 0d __ ADC P0 
21d8 : aa __ __ TAX
21d9 : a5 06 __ LDA WORK + 3 
21db : 65 0e __ ADC P1 
21dd : a8 __ __ TAY
21de : 8a __ __ TXA
21df : 18 __ __ CLC
21e0 : 69 30 __ ADC #$30
21e2 : 85 0d __ STA P0 
21e4 : 90 01 __ BCC $21e7 ; (main.s1134 + 0)
.s1133:
21e6 : c8 __ __ INY
.s1134:
21e7 : 84 0e __ STY P1 
21e9 : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
21ec : c9 81 __ CMP #$81
21ee : aa __ __ TAX
21ef : b0 08 __ BCS $21f9 ; (main.s67 + 0)
.s68:
21f1 : a9 00 __ LDA #$00
21f3 : 8d f8 5b STA $5bf8 ; (plotaltchar + 0)
21f6 : 8a __ __ TXA
21f7 : 90 09 __ BCC $2202 ; (main.s261 + 0)
.s67:
21f9 : a9 01 __ LDA #$01
21fb : 8d f8 5b STA $5bf8 ; (plotaltchar + 0)
21fe : 8a __ __ TXA
21ff : e9 80 __ SBC #$80
2201 : aa __ __ TAX
.s261:
2202 : c9 41 __ CMP #$41
2204 : b0 08 __ BCS $220e ; (main.s70 + 0)
.s71:
2206 : a9 00 __ LDA #$00
2208 : 8d f5 5b STA $5bf5 ; (plotreverse + 0)
220b : 8a __ __ TXA
220c : 90 09 __ BCC $2217 ; (main.s262 + 0)
.s70:
220e : a9 01 __ LDA #$01
2210 : 8d f5 5b STA $5bf5 ; (plotreverse + 0)
2213 : 8a __ __ TXA
2214 : e9 40 __ SBC #$40
2216 : aa __ __ TAX
.s262:
2217 : c9 21 __ CMP #$21
2219 : b0 08 __ BCS $2223 ; (main.s73 + 0)
.s74:
221b : a9 00 __ LDA #$00
221d : 8d f6 5b STA $5bf6 ; (plotunderline + 0)
2220 : 8a __ __ TXA
2221 : 90 09 __ BCC $222c ; (main.s263 + 0)
.s73:
2223 : a9 01 __ LDA #$01
2225 : 8d f6 5b STA $5bf6 ; (plotunderline + 0)
2228 : 8a __ __ TXA
2229 : e9 20 __ SBC #$20
222b : aa __ __ TAX
.s263:
222c : c9 11 __ CMP #$11
222e : b0 08 __ BCS $2238 ; (main.s76 + 0)
.s77:
2230 : a9 00 __ LDA #$00
2232 : 8d f7 5b STA $5bf7 ; (plotblink + 0)
2235 : 8a __ __ TXA
2236 : 90 08 __ BCC $2240 ; (main.s1124 + 0)
.s76:
2238 : a9 01 __ LDA #$01
223a : 8d f7 5b STA $5bf7 ; (plotblink + 0)
223d : 8a __ __ TXA
223e : e9 10 __ SBC #$10
.s1124:
2240 : 8d f4 5b STA $5bf4 ; (plotcolor + 0)
2243 : 4c a8 20 JMP $20a8 ; (main.s1127 + 0)
.s144:
2246 : c9 41 __ CMP #$41
2248 : d0 0c __ BNE $2256 ; (main.s145 + 0)
.s59:
224a : a9 00 __ LDA #$00
224c : cd f8 5b CMP $5bf8 ; (plotaltchar + 0)
224f : 2a __ __ ROL
2250 : 8d f8 5b STA $5bf8 ; (plotaltchar + 0)
2253 : 4c a4 1f JMP $1fa4 ; (main.s282 + 0)
.s145:
2256 : b0 37 __ BCS $228f ; (main.s57 + 0)
.s147:
2258 : c9 2e __ CMP #$2e
225a : f0 03 __ BEQ $225f ; (main.s44 + 0)
225c : 4c c9 1e JMP $1ec9 ; (main.s114 + 0)
.s44:
225f : ad f4 5b LDA $5bf4 ; (plotcolor + 0)
2262 : c9 0f __ CMP #$0f
2264 : d0 1c __ BNE $2282 ; (main.s46 + 0)
.s45:
2266 : a9 00 __ LDA #$00
2268 : 85 53 __ STA T0 + 0 
226a : ad ff 57 LDA $57ff ; (screenbackground + 0)
226d : f0 03 __ BEQ $2272 ; (main.s48 + 0)
226f : 4c 9b 20 JMP $209b ; (main.s38 + 0)
.s48:
2272 : a5 53 __ LDA T0 + 0 
2274 : c9 0f __ CMP #$0f
2276 : d0 05 __ BNE $227d ; (main.s52 + 0)
.s51:
2278 : a9 00 __ LDA #$00
227a : 4c 99 20 JMP $2099 ; (main.s1128 + 0)
.s52:
227d : e6 53 __ INC T0 + 0 
227f : 4c 9b 20 JMP $209b ; (main.s38 + 0)
.s46:
2282 : 18 __ __ CLC
2283 : 69 01 __ ADC #$01
2285 : 85 53 __ STA T0 + 0 
2287 : cd ff 57 CMP $57ff ; (screenbackground + 0)
228a : f0 e6 __ BEQ $2272 ; (main.s48 + 0)
228c : 4c 9b 20 JMP $209b ; (main.s38 + 0)
.s57:
228f : a9 00 __ LDA #$00
2291 : cd f7 5b CMP $5bf7 ; (plotblink + 0)
2294 : 2a __ __ ROL
2295 : 8d f7 5b STA $5bf7 ; (plotblink + 0)
2298 : 4c a4 1f JMP $1fa4 ; (main.s282 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
229b : 38 __ __ SEC
229c : a5 23 __ LDA SP + 0 
229e : e9 06 __ SBC #$06
22a0 : 85 23 __ STA SP + 0 
22a2 : b0 02 __ BCS $22a6 ; (bnk_init.s0 + 0)
22a4 : c6 24 __ DEC SP + 1 
.s0:
22a6 : a9 0f __ LDA #$0f
22a8 : a0 02 __ LDY #$02
22aa : 91 23 __ STA (SP + 0),y 
22ac : a9 2a __ LDA #$2a
22ae : c8 __ __ INY
22af : 91 23 __ STA (SP + 0),y 
22b1 : a5 ba __ LDA $ba 
22b3 : d0 02 __ BNE $22b7 ; (bnk_init.s1002 + 0)
.s2:
22b5 : a9 08 __ LDA #$08
.s1002:
22b7 : 8d fb 57 STA $57fb ; (bootdevice + 0)
22ba : a0 04 __ LDY #$04
22bc : 91 23 __ STA (SP + 0),y 
22be : a9 00 __ LDA #$00
22c0 : c8 __ __ INY
22c1 : 91 23 __ STA (SP + 0),y 
22c3 : 20 e8 22 JSR $22e8 ; (printf.s0 + 0)
22c6 : a9 06 __ LDA #$06
22c8 : 8d 06 d5 STA $d506 
22cb : a9 1f __ LDA #$1f
22cd : a0 02 __ LDY #$02
22cf : 91 23 __ STA (SP + 0),y 
22d1 : a9 2a __ LDA #$2a
22d3 : c8 __ __ INY
22d4 : 91 23 __ STA (SP + 0),y 
22d6 : 20 e8 22 JSR $22e8 ; (printf.s0 + 0)
22d9 : 20 39 2a JSR $2a39 ; (load_overlay.s1000 + 0)
.s1001:
22dc : 18 __ __ CLC
22dd : a5 23 __ LDA SP + 0 
22df : 69 06 __ ADC #$06
22e1 : 85 23 __ STA SP + 0 
22e3 : 90 02 __ BCC $22e7 ; (bnk_init.s1001 + 11)
22e5 : e6 24 __ INC SP + 1 
22e7 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22e8 : a9 01 __ LDA #$01
22ea : 8d fa ab STA $abfa ; (sstack + 4)
22ed : a9 a8 __ LDA #$a8
22ef : 85 16 __ STA P9 
22f1 : a9 ab __ LDA #$ab
22f3 : 85 17 __ STA P10 
22f5 : a0 02 __ LDY #$02
22f7 : b1 23 __ LDA (SP + 0),y 
22f9 : 8d f6 ab STA $abf6 ; (sstack + 0)
22fc : c8 __ __ INY
22fd : b1 23 __ LDA (SP + 0),y 
22ff : 8d f7 ab STA $abf7 ; (sstack + 1)
2302 : 18 __ __ CLC
2303 : a5 23 __ LDA SP + 0 
2305 : 69 04 __ ADC #$04
2307 : 8d f8 ab STA $abf8 ; (sstack + 2)
230a : a5 24 __ LDA SP + 1 
230c : 69 00 __ ADC #$00
230e : 8d f9 ab STA $abf9 ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
2311 : a5 53 __ LDA T7 + 0 
2313 : 8d da ab STA $abda ; (vp_fill + 10)
2316 : a5 54 __ LDA T7 + 1 
2318 : 8d db ab STA $abdb ; (vp_fill + 11)
231b : a5 55 __ LDA T7 + 2 
231d : 8d dc ab STA $abdc ; (vp_fill + 12)
.s0:
2320 : a9 00 __ LDA #$00
2322 : 85 47 __ STA T0 + 0 
2324 : ad f6 ab LDA $abf6 ; (sstack + 0)
2327 : 85 49 __ STA T1 + 0 
2329 : ad f7 ab LDA $abf7 ; (sstack + 1)
232c : 85 4a __ STA T1 + 1 
.l1:
232e : a0 00 __ LDY #$00
2330 : b1 49 __ LDA (T1 + 0),y 
2332 : d0 3c __ BNE $2370 ; (sformat.s2 + 0)
.s3:
2334 : a4 47 __ LDY T0 + 0 
2336 : 91 16 __ STA (P9),y ; (buff + 0)
2338 : 98 __ __ TYA
2339 : f0 1d __ BEQ $2358 ; (sformat.s1070 + 0)
.s116:
233b : ad fa ab LDA $abfa ; (sstack + 4)
233e : d0 0d __ BNE $234d ; (sformat.s119 + 0)
.s120:
2340 : 18 __ __ CLC
2341 : a5 16 __ LDA P9 ; (buff + 0)
2343 : 65 47 __ ADC T0 + 0 
2345 : aa __ __ TAX
2346 : a5 17 __ LDA P10 ; (buff + 1)
2348 : 69 00 __ ADC #$00
234a : 4c 5c 23 JMP $235c ; (sformat.s1001 + 0)
.s119:
234d : a5 16 __ LDA P9 ; (buff + 0)
234f : 85 0d __ STA P0 
2351 : a5 17 __ LDA P10 ; (buff + 1)
2353 : 85 0e __ STA P1 
2355 : 20 12 27 JSR $2712 ; (puts.s0 + 0)
.s1070:
2358 : a5 17 __ LDA P10 ; (buff + 1)
235a : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
235c : 86 1b __ STX ACCU + 0 ; (fps + 0)
235e : 85 1c __ STA ACCU + 1 ; (fps + 1)
2360 : ad da ab LDA $abda ; (vp_fill + 10)
2363 : 85 53 __ STA T7 + 0 
2365 : ad db ab LDA $abdb ; (vp_fill + 11)
2368 : 85 54 __ STA T7 + 1 
236a : ad dc ab LDA $abdc ; (vp_fill + 12)
236d : 85 55 __ STA T7 + 2 
236f : 60 __ __ RTS
.s2:
2370 : c9 25 __ CMP #$25
2372 : f0 3f __ BEQ $23b3 ; (sformat.s4 + 0)
.s5:
2374 : a4 47 __ LDY T0 + 0 
2376 : 91 16 __ STA (P9),y ; (buff + 0)
2378 : e6 49 __ INC T1 + 0 
237a : d0 02 __ BNE $237e ; (sformat.s1098 + 0)
.s1097:
237c : e6 4a __ INC T1 + 1 
.s1098:
237e : c8 __ __ INY
237f : 84 47 __ STY T0 + 0 
2381 : 98 __ __ TYA
2382 : c0 28 __ CPY #$28
2384 : 90 a8 __ BCC $232e ; (sformat.l1 + 0)
.s110:
2386 : 85 4c __ STA T5 + 0 
2388 : a9 00 __ LDA #$00
238a : 85 47 __ STA T0 + 0 
238c : ad fa ab LDA $abfa ; (sstack + 4)
238f : f0 14 __ BEQ $23a5 ; (sformat.s114 + 0)
.s113:
2391 : a5 16 __ LDA P9 ; (buff + 0)
2393 : 85 0d __ STA P0 
2395 : a5 17 __ LDA P10 ; (buff + 1)
2397 : 85 0e __ STA P1 
2399 : a9 00 __ LDA #$00
239b : a4 4c __ LDY T5 + 0 
239d : 91 16 __ STA (P9),y ; (buff + 0)
239f : 20 12 27 JSR $2712 ; (puts.s0 + 0)
23a2 : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s114:
23a5 : 18 __ __ CLC
23a6 : a5 16 __ LDA P9 ; (buff + 0)
23a8 : 65 4c __ ADC T5 + 0 
23aa : 85 16 __ STA P9 ; (buff + 0)
23ac : 90 80 __ BCC $232e ; (sformat.l1 + 0)
.s1099:
23ae : e6 17 __ INC P10 ; (buff + 1)
23b0 : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s4:
23b3 : a5 47 __ LDA T0 + 0 
23b5 : f0 27 __ BEQ $23de ; (sformat.s9 + 0)
.s7:
23b7 : 84 47 __ STY T0 + 0 
23b9 : 85 4c __ STA T5 + 0 
23bb : ad fa ab LDA $abfa ; (sstack + 4)
23be : f0 13 __ BEQ $23d3 ; (sformat.s11 + 0)
.s10:
23c0 : a5 16 __ LDA P9 ; (buff + 0)
23c2 : 85 0d __ STA P0 
23c4 : a5 17 __ LDA P10 ; (buff + 1)
23c6 : 85 0e __ STA P1 
23c8 : 98 __ __ TYA
23c9 : a4 4c __ LDY T5 + 0 
23cb : 91 16 __ STA (P9),y ; (buff + 0)
23cd : 20 12 27 JSR $2712 ; (puts.s0 + 0)
23d0 : 4c de 23 JMP $23de ; (sformat.s9 + 0)
.s11:
23d3 : 18 __ __ CLC
23d4 : a5 16 __ LDA P9 ; (buff + 0)
23d6 : 65 4c __ ADC T5 + 0 
23d8 : 85 16 __ STA P9 ; (buff + 0)
23da : 90 02 __ BCC $23de ; (sformat.s9 + 0)
.s1095:
23dc : e6 17 __ INC P10 ; (buff + 1)
.s9:
23de : a9 0a __ LDA #$0a
23e0 : 8d e1 ab STA $abe1 ; (vp_fill + 17)
23e3 : a9 00 __ LDA #$00
23e5 : 8d e2 ab STA $abe2 ; (vp_fill + 18)
23e8 : 8d e3 ab STA $abe3 ; (vp_fill + 19)
23eb : 8d e4 ab STA $abe4 ; (vp_fill + 20)
23ee : 8d e5 ab STA $abe5 ; (vp_fill + 21)
23f1 : a0 01 __ LDY #$01
23f3 : b1 49 __ LDA (T1 + 0),y 
23f5 : a2 20 __ LDX #$20
23f7 : 8e de ab STX $abde ; (vp_fill + 14)
23fa : a2 00 __ LDX #$00
23fc : 8e df ab STX $abdf ; (vp_fill + 15)
23ff : ca __ __ DEX
2400 : 8e e0 ab STX $abe0 ; (vp_fill + 16)
2403 : aa __ __ TAX
2404 : 18 __ __ CLC
2405 : a5 49 __ LDA T1 + 0 
2407 : 69 02 __ ADC #$02
.l14:
2409 : 85 49 __ STA T1 + 0 
240b : 90 02 __ BCC $240f ; (sformat.s1082 + 0)
.s1081:
240d : e6 4a __ INC T1 + 1 
.s1082:
240f : 8a __ __ TXA
2410 : e0 2b __ CPX #$2b
2412 : d0 08 __ BNE $241c ; (sformat.s17 + 0)
.s16:
2414 : a9 01 __ LDA #$01
2416 : 8d e3 ab STA $abe3 ; (vp_fill + 19)
2419 : 4c fd 26 JMP $26fd ; (sformat.s264 + 0)
.s17:
241c : c9 30 __ CMP #$30
241e : d0 06 __ BNE $2426 ; (sformat.s20 + 0)
.s19:
2420 : 8d de ab STA $abde ; (vp_fill + 14)
2423 : 4c fd 26 JMP $26fd ; (sformat.s264 + 0)
.s20:
2426 : c9 23 __ CMP #$23
2428 : d0 08 __ BNE $2432 ; (sformat.s23 + 0)
.s22:
242a : a9 01 __ LDA #$01
242c : 8d e5 ab STA $abe5 ; (vp_fill + 21)
242f : 4c fd 26 JMP $26fd ; (sformat.s264 + 0)
.s23:
2432 : c9 2d __ CMP #$2d
2434 : d0 08 __ BNE $243e ; (sformat.s15 + 0)
.s25:
2436 : a9 01 __ LDA #$01
2438 : 8d e4 ab STA $abe4 ; (vp_fill + 20)
243b : 4c fd 26 JMP $26fd ; (sformat.s264 + 0)
.s15:
243e : 85 4c __ STA T5 + 0 
2440 : c9 30 __ CMP #$30
2442 : 90 55 __ BCC $2499 ; (sformat.s31 + 0)
.s32:
2444 : c9 3a __ CMP #$3a
2446 : b0 51 __ BCS $2499 ; (sformat.s31 + 0)
.s29:
2448 : a9 00 __ LDA #$00
244a : 85 44 __ STA T6 + 0 
244c : 85 45 __ STA T6 + 1 
244e : e0 3a __ CPX #$3a
2450 : b0 40 __ BCS $2492 ; (sformat.s35 + 0)
.l34:
2452 : a5 44 __ LDA T6 + 0 
2454 : 0a __ __ ASL
2455 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2457 : a5 45 __ LDA T6 + 1 
2459 : 2a __ __ ROL
245a : 06 1b __ ASL ACCU + 0 ; (fps + 0)
245c : 2a __ __ ROL
245d : aa __ __ TAX
245e : 18 __ __ CLC
245f : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2461 : 65 44 __ ADC T6 + 0 
2463 : 85 44 __ STA T6 + 0 
2465 : 8a __ __ TXA
2466 : 65 45 __ ADC T6 + 1 
2468 : 06 44 __ ASL T6 + 0 
246a : 2a __ __ ROL
246b : aa __ __ TAX
246c : 18 __ __ CLC
246d : a5 44 __ LDA T6 + 0 
246f : 65 4c __ ADC T5 + 0 
2471 : 90 01 __ BCC $2474 ; (sformat.s1092 + 0)
.s1091:
2473 : e8 __ __ INX
.s1092:
2474 : 38 __ __ SEC
2475 : e9 30 __ SBC #$30
2477 : 85 44 __ STA T6 + 0 
2479 : 8a __ __ TXA
247a : e9 00 __ SBC #$00
247c : 85 45 __ STA T6 + 1 
247e : a0 00 __ LDY #$00
2480 : b1 49 __ LDA (T1 + 0),y 
2482 : 85 4c __ STA T5 + 0 
2484 : e6 49 __ INC T1 + 0 
2486 : d0 02 __ BNE $248a ; (sformat.s1094 + 0)
.s1093:
2488 : e6 4a __ INC T1 + 1 
.s1094:
248a : c9 30 __ CMP #$30
248c : 90 04 __ BCC $2492 ; (sformat.s35 + 0)
.s36:
248e : c9 3a __ CMP #$3a
2490 : 90 c0 __ BCC $2452 ; (sformat.l34 + 0)
.s35:
2492 : a5 44 __ LDA T6 + 0 
2494 : 8d df ab STA $abdf ; (vp_fill + 15)
2497 : a5 4c __ LDA T5 + 0 
.s31:
2499 : c9 2e __ CMP #$2e
249b : d0 51 __ BNE $24ee ; (sformat.s39 + 0)
.s37:
249d : a9 00 __ LDA #$00
249f : 85 44 __ STA T6 + 0 
.l243:
24a1 : 85 45 __ STA T6 + 1 
24a3 : a0 00 __ LDY #$00
24a5 : b1 49 __ LDA (T1 + 0),y 
24a7 : 85 4c __ STA T5 + 0 
24a9 : e6 49 __ INC T1 + 0 
24ab : d0 02 __ BNE $24af ; (sformat.s1084 + 0)
.s1083:
24ad : e6 4a __ INC T1 + 1 
.s1084:
24af : c9 30 __ CMP #$30
24b1 : 90 04 __ BCC $24b7 ; (sformat.s42 + 0)
.s43:
24b3 : c9 3a __ CMP #$3a
24b5 : 90 0a __ BCC $24c1 ; (sformat.s41 + 0)
.s42:
24b7 : a5 44 __ LDA T6 + 0 
24b9 : 8d e0 ab STA $abe0 ; (vp_fill + 16)
24bc : a5 4c __ LDA T5 + 0 
24be : 4c ee 24 JMP $24ee ; (sformat.s39 + 0)
.s41:
24c1 : a5 44 __ LDA T6 + 0 
24c3 : 0a __ __ ASL
24c4 : 85 1b __ STA ACCU + 0 ; (fps + 0)
24c6 : a5 45 __ LDA T6 + 1 
24c8 : 2a __ __ ROL
24c9 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24cb : 2a __ __ ROL
24cc : aa __ __ TAX
24cd : 18 __ __ CLC
24ce : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24d0 : 65 44 __ ADC T6 + 0 
24d2 : 85 44 __ STA T6 + 0 
24d4 : 8a __ __ TXA
24d5 : 65 45 __ ADC T6 + 1 
24d7 : 06 44 __ ASL T6 + 0 
24d9 : 2a __ __ ROL
24da : aa __ __ TAX
24db : 18 __ __ CLC
24dc : a5 44 __ LDA T6 + 0 
24de : 65 4c __ ADC T5 + 0 
24e0 : 90 01 __ BCC $24e3 ; (sformat.s1090 + 0)
.s1089:
24e2 : e8 __ __ INX
.s1090:
24e3 : 38 __ __ SEC
24e4 : e9 30 __ SBC #$30
24e6 : 85 44 __ STA T6 + 0 
24e8 : 8a __ __ TXA
24e9 : e9 00 __ SBC #$00
24eb : 4c a1 24 JMP $24a1 ; (sformat.l243 + 0)
.s39:
24ee : c9 64 __ CMP #$64
24f0 : f0 04 __ BEQ $24f6 ; (sformat.s44 + 0)
.s47:
24f2 : c9 44 __ CMP #$44
24f4 : d0 05 __ BNE $24fb ; (sformat.s45 + 0)
.s44:
24f6 : a9 01 __ LDA #$01
24f8 : 4c c1 26 JMP $26c1 ; (sformat.s261 + 0)
.s45:
24fb : c9 75 __ CMP #$75
24fd : d0 03 __ BNE $2502 ; (sformat.s51 + 0)
24ff : 4c bf 26 JMP $26bf ; (sformat.s291 + 0)
.s51:
2502 : c9 55 __ CMP #$55
2504 : d0 03 __ BNE $2509 ; (sformat.s49 + 0)
2506 : 4c bf 26 JMP $26bf ; (sformat.s291 + 0)
.s49:
2509 : c9 78 __ CMP #$78
250b : f0 04 __ BEQ $2511 ; (sformat.s52 + 0)
.s55:
250d : c9 58 __ CMP #$58
250f : d0 0d __ BNE $251e ; (sformat.s53 + 0)
.s52:
2511 : a9 10 __ LDA #$10
2513 : 8d e1 ab STA $abe1 ; (vp_fill + 17)
2516 : a9 00 __ LDA #$00
2518 : 8d e2 ab STA $abe2 ; (vp_fill + 18)
251b : 4c bf 26 JMP $26bf ; (sformat.s291 + 0)
.s53:
251e : c9 6c __ CMP #$6c
2520 : d0 03 __ BNE $2525 ; (sformat.s59 + 0)
2522 : 4c 36 26 JMP $2636 ; (sformat.s56 + 0)
.s59:
2525 : c9 4c __ CMP #$4c
2527 : d0 03 __ BNE $252c ; (sformat.s57 + 0)
2529 : 4c 36 26 JMP $2636 ; (sformat.s56 + 0)
.s57:
252c : c9 73 __ CMP #$73
252e : f0 54 __ BEQ $2584 ; (sformat.s72 + 0)
.s75:
2530 : c9 53 __ CMP #$53
2532 : f0 50 __ BEQ $2584 ; (sformat.s72 + 0)
.s73:
2534 : c9 63 __ CMP #$63
2536 : f0 23 __ BEQ $255b ; (sformat.s103 + 0)
.s106:
2538 : c9 43 __ CMP #$43
253a : f0 1f __ BEQ $255b ; (sformat.s103 + 0)
.s104:
253c : 09 00 __ ORA #$00
253e : d0 03 __ BNE $2543 ; (sformat.s107 + 0)
2540 : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s107:
2543 : 18 __ __ CLC
2544 : a5 16 __ LDA P9 ; (buff + 0)
2546 : 65 47 __ ADC T0 + 0 
2548 : 85 44 __ STA T6 + 0 
254a : a5 17 __ LDA P10 ; (buff + 1)
254c : 69 00 __ ADC #$00
254e : 85 45 __ STA T6 + 1 
2550 : a5 4c __ LDA T5 + 0 
.s1068:
2552 : a0 00 __ LDY #$00
2554 : 91 44 __ STA (T6 + 0),y 
2556 : e6 47 __ INC T0 + 0 
2558 : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s103:
255b : ad f8 ab LDA $abf8 ; (sstack + 2)
255e : 85 4c __ STA T5 + 0 
2560 : 18 __ __ CLC
2561 : 69 02 __ ADC #$02
2563 : 8d f8 ab STA $abf8 ; (sstack + 2)
2566 : ad f9 ab LDA $abf9 ; (sstack + 3)
2569 : 85 4d __ STA T5 + 1 
256b : 69 00 __ ADC #$00
256d : 8d f9 ab STA $abf9 ; (sstack + 3)
2570 : 18 __ __ CLC
2571 : a5 16 __ LDA P9 ; (buff + 0)
2573 : 65 47 __ ADC T0 + 0 
2575 : 85 44 __ STA T6 + 0 
2577 : a5 17 __ LDA P10 ; (buff + 1)
2579 : 69 00 __ ADC #$00
257b : 85 45 __ STA T6 + 1 
257d : a0 00 __ LDY #$00
257f : b1 4c __ LDA (T5 + 0),y 
2581 : 4c 52 25 JMP $2552 ; (sformat.s1068 + 0)
.s72:
2584 : ad f8 ab LDA $abf8 ; (sstack + 2)
2587 : 85 4c __ STA T5 + 0 
2589 : 18 __ __ CLC
258a : 69 02 __ ADC #$02
258c : 8d f8 ab STA $abf8 ; (sstack + 2)
258f : ad f9 ab LDA $abf9 ; (sstack + 3)
2592 : 85 4d __ STA T5 + 1 
2594 : 69 00 __ ADC #$00
2596 : 8d f9 ab STA $abf9 ; (sstack + 3)
2599 : a0 00 __ LDY #$00
259b : 84 4b __ STY T3 + 0 
259d : b1 4c __ LDA (T5 + 0),y 
259f : aa __ __ TAX
25a0 : c8 __ __ INY
25a1 : b1 4c __ LDA (T5 + 0),y 
25a3 : 86 4c __ STX T5 + 0 
25a5 : 85 4d __ STA T5 + 1 
25a7 : ad df ab LDA $abdf ; (vp_fill + 15)
25aa : f0 0c __ BEQ $25b8 ; (sformat.s78 + 0)
.s1073:
25ac : 88 __ __ DEY
25ad : b1 4c __ LDA (T5 + 0),y 
25af : f0 05 __ BEQ $25b6 ; (sformat.s1074 + 0)
.l80:
25b1 : c8 __ __ INY
25b2 : b1 4c __ LDA (T5 + 0),y 
25b4 : d0 fb __ BNE $25b1 ; (sformat.l80 + 0)
.s1074:
25b6 : 84 4b __ STY T3 + 0 
.s78:
25b8 : ad e4 ab LDA $abe4 ; (vp_fill + 20)
25bb : d0 19 __ BNE $25d6 ; (sformat.s84 + 0)
.s1077:
25bd : a6 4b __ LDX T3 + 0 
25bf : ec df ab CPX $abdf ; (vp_fill + 15)
25c2 : a4 47 __ LDY T0 + 0 
25c4 : b0 0c __ BCS $25d2 ; (sformat.s1078 + 0)
.l86:
25c6 : ad de ab LDA $abde ; (vp_fill + 14)
25c9 : 91 16 __ STA (P9),y ; (buff + 0)
25cb : e8 __ __ INX
25cc : ec df ab CPX $abdf ; (vp_fill + 15)
25cf : c8 __ __ INY
25d0 : 90 f4 __ BCC $25c6 ; (sformat.l86 + 0)
.s1078:
25d2 : 86 4b __ STX T3 + 0 
25d4 : 84 47 __ STY T0 + 0 
.s84:
25d6 : ad fa ab LDA $abfa ; (sstack + 4)
25d9 : d0 37 __ BNE $2612 ; (sformat.s88 + 0)
.l94:
25db : a0 00 __ LDY #$00
25dd : b1 4c __ LDA (T5 + 0),y 
25df : f0 0f __ BEQ $25f0 ; (sformat.s251 + 0)
.s95:
25e1 : a4 47 __ LDY T0 + 0 
25e3 : 91 16 __ STA (P9),y ; (buff + 0)
25e5 : e6 47 __ INC T0 + 0 
25e7 : e6 4c __ INC T5 + 0 
25e9 : d0 f0 __ BNE $25db ; (sformat.l94 + 0)
.s1087:
25eb : e6 4d __ INC T5 + 1 
25ed : 4c db 25 JMP $25db ; (sformat.l94 + 0)
.s251:
25f0 : ad e4 ab LDA $abe4 ; (vp_fill + 20)
25f3 : d0 03 __ BNE $25f8 ; (sformat.s1075 + 0)
25f5 : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s1075:
25f8 : a6 4b __ LDX T3 + 0 
25fa : ec df ab CPX $abdf ; (vp_fill + 15)
25fd : a4 47 __ LDY T0 + 0 
25ff : b0 0c __ BCS $260d ; (sformat.s1076 + 0)
.l101:
2601 : ad de ab LDA $abde ; (vp_fill + 14)
2604 : 91 16 __ STA (P9),y ; (buff + 0)
2606 : e8 __ __ INX
2607 : ec df ab CPX $abdf ; (vp_fill + 15)
260a : c8 __ __ INY
260b : 90 f4 __ BCC $2601 ; (sformat.l101 + 0)
.s1076:
260d : 84 47 __ STY T0 + 0 
260f : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s88:
2612 : a5 47 __ LDA T0 + 0 
2614 : f0 1a __ BEQ $2630 ; (sformat.s93 + 0)
.s91:
2616 : a5 16 __ LDA P9 ; (buff + 0)
2618 : 85 0d __ STA P0 
261a : a5 17 __ LDA P10 ; (buff + 1)
261c : 85 0e __ STA P1 
261e : a9 00 __ LDA #$00
2620 : a4 47 __ LDY T0 + 0 
2622 : 91 16 __ STA (P9),y ; (buff + 0)
2624 : 20 12 27 JSR $2712 ; (puts.s0 + 0)
2627 : 20 0a 27 JSR $270a ; (puts@proxy + 0)
262a : a9 00 __ LDA #$00
262c : 85 47 __ STA T0 + 0 
262e : f0 c0 __ BEQ $25f0 ; (sformat.s251 + 0)
.s93:
2630 : 20 0a 27 JSR $270a ; (puts@proxy + 0)
2633 : 4c f0 25 JMP $25f0 ; (sformat.s251 + 0)
.s56:
2636 : ad f8 ab LDA $abf8 ; (sstack + 2)
2639 : 85 4c __ STA T5 + 0 
263b : 18 __ __ CLC
263c : 69 04 __ ADC #$04
263e : 8d f8 ab STA $abf8 ; (sstack + 2)
2641 : ad f9 ab LDA $abf9 ; (sstack + 3)
2644 : 85 4d __ STA T5 + 1 
2646 : 69 00 __ ADC #$00
2648 : 8d f9 ab STA $abf9 ; (sstack + 3)
264b : a0 00 __ LDY #$00
264d : b1 49 __ LDA (T1 + 0),y 
264f : aa __ __ TAX
2650 : e6 49 __ INC T1 + 0 
2652 : d0 02 __ BNE $2656 ; (sformat.s1086 + 0)
.s1085:
2654 : e6 4a __ INC T1 + 1 
.s1086:
2656 : b1 4c __ LDA (T5 + 0),y 
2658 : 85 53 __ STA T7 + 0 
265a : a0 01 __ LDY #$01
265c : b1 4c __ LDA (T5 + 0),y 
265e : 85 54 __ STA T7 + 1 
2660 : c8 __ __ INY
2661 : b1 4c __ LDA (T5 + 0),y 
2663 : 85 55 __ STA T7 + 2 
2665 : c8 __ __ INY
2666 : b1 4c __ LDA (T5 + 0),y 
2668 : a8 __ __ TAY
2669 : 8a __ __ TXA
266a : e0 64 __ CPX #$64
266c : f0 04 __ BEQ $2672 ; (sformat.s60 + 0)
.s63:
266e : c9 44 __ CMP #$44
2670 : d0 04 __ BNE $2676 ; (sformat.s61 + 0)
.s60:
2672 : a9 01 __ LDA #$01
2674 : d0 1f __ BNE $2695 ; (sformat.s262 + 0)
.s61:
2676 : c9 75 __ CMP #$75
2678 : f0 19 __ BEQ $2693 ; (sformat.s292 + 0)
.s67:
267a : c9 55 __ CMP #$55
267c : f0 15 __ BEQ $2693 ; (sformat.s292 + 0)
.s65:
267e : c9 78 __ CMP #$78
2680 : f0 07 __ BEQ $2689 ; (sformat.s68 + 0)
.s71:
2682 : c9 58 __ CMP #$58
2684 : f0 03 __ BEQ $2689 ; (sformat.s68 + 0)
2686 : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s68:
2689 : a9 10 __ LDA #$10
268b : 8d e1 ab STA $abe1 ; (vp_fill + 17)
268e : a9 00 __ LDA #$00
2690 : 8d e2 ab STA $abe2 ; (vp_fill + 18)
.s292:
2693 : a9 00 __ LDA #$00
.s262:
2695 : 84 14 __ STY P7 
2697 : 85 15 __ STA P8 
2699 : a5 16 __ LDA P9 ; (buff + 0)
269b : 85 0f __ STA P2 
269d : a5 17 __ LDA P10 ; (buff + 1)
269f : 85 10 __ STA P3 
26a1 : a5 53 __ LDA T7 + 0 
26a3 : 85 11 __ STA P4 
26a5 : a5 54 __ LDA T7 + 1 
26a7 : 85 12 __ STA P5 
26a9 : a5 55 __ LDA T7 + 2 
26ab : 85 13 __ STA P6 
26ad : a9 de __ LDA #$de
26af : 85 0d __ STA P0 
26b1 : a9 ab __ LDA #$ab
26b3 : 85 0e __ STA P1 
26b5 : 20 9c 28 JSR $289c ; (nforml.s0 + 0)
.s1069:
26b8 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26ba : 85 47 __ STA T0 + 0 
26bc : 4c 2e 23 JMP $232e ; (sformat.l1 + 0)
.s291:
26bf : a9 00 __ LDA #$00
.s261:
26c1 : 85 13 __ STA P6 
26c3 : a5 16 __ LDA P9 ; (buff + 0)
26c5 : 85 0f __ STA P2 
26c7 : a5 17 __ LDA P10 ; (buff + 1)
26c9 : 85 10 __ STA P3 
26cb : ad f8 ab LDA $abf8 ; (sstack + 2)
26ce : 85 47 __ STA T0 + 0 
26d0 : ad f9 ab LDA $abf9 ; (sstack + 3)
26d3 : 85 48 __ STA T0 + 1 
26d5 : a0 00 __ LDY #$00
26d7 : b1 47 __ LDA (T0 + 0),y 
26d9 : 85 11 __ STA P4 
26db : c8 __ __ INY
26dc : b1 47 __ LDA (T0 + 0),y 
26de : 85 12 __ STA P5 
26e0 : 18 __ __ CLC
26e1 : a5 47 __ LDA T0 + 0 
26e3 : 69 02 __ ADC #$02
26e5 : 8d f8 ab STA $abf8 ; (sstack + 2)
26e8 : a5 48 __ LDA T0 + 1 
26ea : 69 00 __ ADC #$00
26ec : 8d f9 ab STA $abf9 ; (sstack + 3)
26ef : a9 de __ LDA #$de
26f1 : 85 0d __ STA P0 
26f3 : a9 ab __ LDA #$ab
26f5 : 85 0e __ STA P1 
26f7 : 20 67 27 JSR $2767 ; (nformi.s0 + 0)
26fa : 4c b8 26 JMP $26b8 ; (sformat.s1069 + 0)
.s264:
26fd : a0 00 __ LDY #$00
26ff : b1 49 __ LDA (T1 + 0),y 
2701 : aa __ __ TAX
2702 : 18 __ __ CLC
2703 : a5 49 __ LDA T1 + 0 
2705 : 69 01 __ ADC #$01
2707 : 4c 09 24 JMP $2409 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
270a : a5 4c __ LDA $4c 
270c : 85 0d __ STA P0 
270e : a5 4d __ LDA $4d 
2710 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2712 : a0 00 __ LDY #$00
2714 : b1 0d __ LDA (P0),y 
2716 : f0 0b __ BEQ $2723 ; (puts.s1001 + 0)
2718 : 20 24 27 JSR $2724 ; (putpch + 0)
271b : e6 0d __ INC P0 
271d : d0 f3 __ BNE $2712 ; (puts.s0 + 0)
271f : e6 0e __ INC P1 
2721 : d0 ef __ BNE $2712 ; (puts.s0 + 0)
.s1001:
2723 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2724 : ae fe 2a LDX $2afe ; (giocharmap + 0)
2727 : e0 01 __ CPX #$01
2729 : 90 26 __ BCC $2751 ; (putpch + 45)
272b : c9 0a __ CMP #$0a
272d : d0 02 __ BNE $2731 ; (putpch + 13)
272f : a9 0d __ LDA #$0d
2731 : c9 09 __ CMP #$09
2733 : f0 1f __ BEQ $2754 ; (putpch + 48)
2735 : e0 02 __ CPX #$02
2737 : 90 18 __ BCC $2751 ; (putpch + 45)
2739 : c9 41 __ CMP #$41
273b : 90 14 __ BCC $2751 ; (putpch + 45)
273d : c9 7b __ CMP #$7b
273f : b0 10 __ BCS $2751 ; (putpch + 45)
2741 : c9 61 __ CMP #$61
2743 : b0 04 __ BCS $2749 ; (putpch + 37)
2745 : c9 5b __ CMP #$5b
2747 : b0 08 __ BCS $2751 ; (putpch + 45)
2749 : 49 20 __ EOR #$20
274b : e0 03 __ CPX #$03
274d : f0 02 __ BEQ $2751 ; (putpch + 45)
274f : 29 df __ AND #$df
2751 : 4c d2 ff JMP $ffd2 
2754 : 38 __ __ SEC
2755 : 20 f0 ff JSR $fff0 
2758 : 98 __ __ TYA
2759 : 29 03 __ AND #$03
275b : 49 03 __ EOR #$03
275d : aa __ __ TAX
275e : a9 20 __ LDA #$20
2760 : 20 d2 ff JSR $ffd2 
2763 : ca __ __ DEX
2764 : 10 fa __ BPL $2760 ; (putpch + 60)
2766 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2767 : a9 00 __ LDA #$00
2769 : 85 43 __ STA T0 + 0 
276b : a5 13 __ LDA P6 ; (s + 0)
276d : f0 13 __ BEQ $2782 ; (nformi.s182 + 0)
.s4:
276f : 24 12 __ BIT P5 ; (v + 1)
2771 : 10 0f __ BPL $2782 ; (nformi.s182 + 0)
.s1:
2773 : 38 __ __ SEC
2774 : a9 00 __ LDA #$00
2776 : e5 11 __ SBC P4 ; (v + 0)
2778 : 85 11 __ STA P4 ; (v + 0)
277a : a9 00 __ LDA #$00
277c : e5 12 __ SBC P5 ; (v + 1)
277e : 85 12 __ STA P5 ; (v + 1)
2780 : e6 43 __ INC T0 + 0 
.s182:
2782 : a9 10 __ LDA #$10
2784 : 85 44 __ STA T2 + 0 
2786 : a5 11 __ LDA P4 ; (v + 0)
2788 : 05 12 __ ORA P5 ; (v + 1)
278a : f0 46 __ BEQ $27d2 ; (nformi.s7 + 0)
.s42:
278c : a0 03 __ LDY #$03
278e : b1 0d __ LDA (P0),y ; (si + 0)
2790 : 85 45 __ STA T4 + 0 
2792 : c8 __ __ INY
2793 : b1 0d __ LDA (P0),y ; (si + 0)
2795 : 85 46 __ STA T4 + 1 
.l6:
2797 : a5 11 __ LDA P4 ; (v + 0)
2799 : 85 1b __ STA ACCU + 0 
279b : a5 12 __ LDA P5 ; (v + 1)
279d : 85 1c __ STA ACCU + 1 
279f : a5 45 __ LDA T4 + 0 
27a1 : 85 03 __ STA WORK + 0 
27a3 : a5 46 __ LDA T4 + 1 
27a5 : 85 04 __ STA WORK + 1 
27a7 : 20 88 56 JSR $5688 ; (divmod + 0)
27aa : a5 06 __ LDA WORK + 3 
27ac : 30 08 __ BMI $27b6 ; (nformi.s78 + 0)
.s1019:
27ae : d0 0a __ BNE $27ba ; (nformi.s77 + 0)
.s1018:
27b0 : a5 05 __ LDA WORK + 2 
27b2 : c9 0a __ CMP #$0a
27b4 : b0 04 __ BCS $27ba ; (nformi.s77 + 0)
.s78:
27b6 : a9 30 __ LDA #$30
27b8 : d0 02 __ BNE $27bc ; (nformi.s79 + 0)
.s77:
27ba : a9 37 __ LDA #$37
.s79:
27bc : 18 __ __ CLC
27bd : 65 05 __ ADC WORK + 2 
27bf : c6 44 __ DEC T2 + 0 
27c1 : a6 44 __ LDX T2 + 0 
27c3 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
27c6 : a5 1b __ LDA ACCU + 0 
27c8 : 85 11 __ STA P4 ; (v + 0)
27ca : a5 1c __ LDA ACCU + 1 
27cc : 85 12 __ STA P5 ; (v + 1)
27ce : 05 11 __ ORA P4 ; (v + 0)
27d0 : d0 c5 __ BNE $2797 ; (nformi.l6 + 0)
.s7:
27d2 : a0 02 __ LDY #$02
27d4 : b1 0d __ LDA (P0),y ; (si + 0)
27d6 : c9 ff __ CMP #$ff
27d8 : d0 04 __ BNE $27de ; (nformi.s80 + 0)
.s81:
27da : a9 0f __ LDA #$0f
27dc : d0 05 __ BNE $27e3 ; (nformi.s1026 + 0)
.s80:
27de : 38 __ __ SEC
27df : a9 10 __ LDA #$10
27e1 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27e3 : a8 __ __ TAY
27e4 : c4 44 __ CPY T2 + 0 
27e6 : b0 0d __ BCS $27f5 ; (nformi.s10 + 0)
.s9:
27e8 : a9 30 __ LDA #$30
.l1027:
27ea : c6 44 __ DEC T2 + 0 
27ec : a6 44 __ LDX T2 + 0 
27ee : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
27f1 : c4 44 __ CPY T2 + 0 
27f3 : 90 f5 __ BCC $27ea ; (nformi.l1027 + 0)
.s10:
27f5 : a0 07 __ LDY #$07
27f7 : b1 0d __ LDA (P0),y ; (si + 0)
27f9 : f0 20 __ BEQ $281b ; (nformi.s13 + 0)
.s14:
27fb : a0 04 __ LDY #$04
27fd : b1 0d __ LDA (P0),y ; (si + 0)
27ff : d0 1a __ BNE $281b ; (nformi.s13 + 0)
.s1013:
2801 : 88 __ __ DEY
2802 : b1 0d __ LDA (P0),y ; (si + 0)
2804 : c9 10 __ CMP #$10
2806 : d0 13 __ BNE $281b ; (nformi.s13 + 0)
.s11:
2808 : a9 58 __ LDA #$58
280a : a6 44 __ LDX T2 + 0 
280c : 9d e5 ab STA $abe5,x ; (vp_fill + 21)
280f : 8a __ __ TXA
2810 : 18 __ __ CLC
2811 : 69 fe __ ADC #$fe
2813 : 85 44 __ STA T2 + 0 
2815 : aa __ __ TAX
2816 : a9 30 __ LDA #$30
2818 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s13:
281b : a9 00 __ LDA #$00
281d : 85 1b __ STA ACCU + 0 
281f : a5 43 __ LDA T0 + 0 
2821 : f0 06 __ BEQ $2829 ; (nformi.s16 + 0)
.s15:
2823 : c6 44 __ DEC T2 + 0 
2825 : a9 2d __ LDA #$2d
2827 : d0 0a __ BNE $2833 ; (nformi.s1025 + 0)
.s16:
2829 : a0 05 __ LDY #$05
282b : b1 0d __ LDA (P0),y ; (si + 0)
282d : f0 09 __ BEQ $2838 ; (nformi.s163 + 0)
.s18:
282f : c6 44 __ DEC T2 + 0 
2831 : a9 2b __ LDA #$2b
.s1025:
2833 : a6 44 __ LDX T2 + 0 
2835 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s163:
2838 : a0 06 __ LDY #$06
283a : b1 0d __ LDA (P0),y ; (si + 0)
283c : d0 33 __ BNE $2871 ; (nformi.s24 + 0)
.l30:
283e : a0 01 __ LDY #$01
2840 : b1 0d __ LDA (P0),y ; (si + 0)
2842 : 18 __ __ CLC
2843 : 65 44 __ ADC T2 + 0 
2845 : b0 04 __ BCS $284b ; (nformi.s31 + 0)
.s1006:
2847 : c9 11 __ CMP #$11
2849 : 90 0d __ BCC $2858 ; (nformi.s33 + 0)
.s31:
284b : c6 44 __ DEC T2 + 0 
284d : a0 00 __ LDY #$00
284f : b1 0d __ LDA (P0),y ; (si + 0)
2851 : a6 44 __ LDX T2 + 0 
2853 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
2856 : b0 e6 __ BCS $283e ; (nformi.l30 + 0)
.s33:
2858 : a6 44 __ LDX T2 + 0 
285a : e0 10 __ CPX #$10
285c : b0 0e __ BCS $286c ; (nformi.s23 + 0)
.s34:
285e : 88 __ __ DEY
.l1022:
285f : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
2862 : 91 0f __ STA (P2),y ; (str + 0)
2864 : e8 __ __ INX
2865 : e0 10 __ CPX #$10
2867 : c8 __ __ INY
2868 : 90 f5 __ BCC $285f ; (nformi.l1022 + 0)
.s1023:
286a : 84 1b __ STY ACCU + 0 
.s23:
286c : a9 00 __ LDA #$00
286e : 85 1c __ STA ACCU + 1 
.s1001:
2870 : 60 __ __ RTS
.s24:
2871 : a6 44 __ LDX T2 + 0 
2873 : e0 10 __ CPX #$10
2875 : b0 1a __ BCS $2891 ; (nformi.l27 + 0)
.s25:
2877 : a0 00 __ LDY #$00
.l1020:
2879 : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
287c : 91 0f __ STA (P2),y ; (str + 0)
287e : e8 __ __ INX
287f : e0 10 __ CPX #$10
2881 : c8 __ __ INY
2882 : 90 f5 __ BCC $2879 ; (nformi.l1020 + 0)
.s1021:
2884 : 84 1b __ STY ACCU + 0 
2886 : b0 09 __ BCS $2891 ; (nformi.l27 + 0)
.s28:
2888 : 88 __ __ DEY
2889 : b1 0d __ LDA (P0),y ; (si + 0)
288b : a4 1b __ LDY ACCU + 0 
288d : 91 0f __ STA (P2),y ; (str + 0)
288f : e6 1b __ INC ACCU + 0 
.l27:
2891 : a5 1b __ LDA ACCU + 0 
2893 : a0 01 __ LDY #$01
2895 : d1 0d __ CMP (P0),y ; (si + 0)
2897 : 90 ef __ BCC $2888 ; (nformi.s28 + 0)
2899 : 4c 6c 28 JMP $286c ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
289c : a9 00 __ LDA #$00
289e : 85 43 __ STA T0 + 0 
28a0 : a5 15 __ LDA P8 ; (s + 0)
28a2 : f0 21 __ BEQ $28c5 ; (nforml.s182 + 0)
.s4:
28a4 : a5 14 __ LDA P7 ; (v + 3)
28a6 : f0 1d __ BEQ $28c5 ; (nforml.s182 + 0)
.s1032:
28a8 : 10 1b __ BPL $28c5 ; (nforml.s182 + 0)
.s1:
28aa : 38 __ __ SEC
28ab : a9 00 __ LDA #$00
28ad : e5 11 __ SBC P4 ; (v + 0)
28af : 85 11 __ STA P4 ; (v + 0)
28b1 : a9 00 __ LDA #$00
28b3 : e5 12 __ SBC P5 ; (v + 1)
28b5 : 85 12 __ STA P5 ; (v + 1)
28b7 : a9 00 __ LDA #$00
28b9 : e5 13 __ SBC P6 ; (v + 2)
28bb : 85 13 __ STA P6 ; (v + 2)
28bd : a9 00 __ LDA #$00
28bf : e5 14 __ SBC P7 ; (v + 3)
28c1 : 85 14 __ STA P7 ; (v + 3)
28c3 : e6 43 __ INC T0 + 0 
.s182:
28c5 : a9 10 __ LDA #$10
28c7 : 85 44 __ STA T2 + 0 
28c9 : a5 14 __ LDA P7 ; (v + 3)
28cb : d0 0c __ BNE $28d9 ; (nforml.s42 + 0)
.s1024:
28cd : a5 13 __ LDA P6 ; (v + 2)
28cf : d0 08 __ BNE $28d9 ; (nforml.s42 + 0)
.s1025:
28d1 : a5 12 __ LDA P5 ; (v + 1)
28d3 : d0 04 __ BNE $28d9 ; (nforml.s42 + 0)
.s1026:
28d5 : c5 11 __ CMP P4 ; (v + 0)
28d7 : b0 0e __ BCS $28e7 ; (nforml.s7 + 0)
.s42:
28d9 : a0 03 __ LDY #$03
28db : b1 0d __ LDA (P0),y ; (si + 0)
28dd : 85 45 __ STA T5 + 0 
28df : c8 __ __ INY
28e0 : b1 0d __ LDA (P0),y ; (si + 0)
28e2 : 85 46 __ STA T5 + 1 
28e4 : 4c b1 29 JMP $29b1 ; (nforml.l6 + 0)
.s7:
28e7 : a0 02 __ LDY #$02
28e9 : b1 0d __ LDA (P0),y ; (si + 0)
28eb : c9 ff __ CMP #$ff
28ed : d0 04 __ BNE $28f3 ; (nforml.s80 + 0)
.s81:
28ef : a9 0f __ LDA #$0f
28f1 : d0 05 __ BNE $28f8 ; (nforml.s1039 + 0)
.s80:
28f3 : 38 __ __ SEC
28f4 : a9 10 __ LDA #$10
28f6 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
28f8 : a8 __ __ TAY
28f9 : c4 44 __ CPY T2 + 0 
28fb : b0 0d __ BCS $290a ; (nforml.s10 + 0)
.s9:
28fd : a9 30 __ LDA #$30
.l1040:
28ff : c6 44 __ DEC T2 + 0 
2901 : a6 44 __ LDX T2 + 0 
2903 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
2906 : c4 44 __ CPY T2 + 0 
2908 : 90 f5 __ BCC $28ff ; (nforml.l1040 + 0)
.s10:
290a : a0 07 __ LDY #$07
290c : b1 0d __ LDA (P0),y ; (si + 0)
290e : f0 20 __ BEQ $2930 ; (nforml.s13 + 0)
.s14:
2910 : a0 04 __ LDY #$04
2912 : b1 0d __ LDA (P0),y ; (si + 0)
2914 : d0 1a __ BNE $2930 ; (nforml.s13 + 0)
.s1013:
2916 : 88 __ __ DEY
2917 : b1 0d __ LDA (P0),y ; (si + 0)
2919 : c9 10 __ CMP #$10
291b : d0 13 __ BNE $2930 ; (nforml.s13 + 0)
.s11:
291d : a9 58 __ LDA #$58
291f : a6 44 __ LDX T2 + 0 
2921 : 9d e5 ab STA $abe5,x ; (vp_fill + 21)
2924 : 8a __ __ TXA
2925 : 18 __ __ CLC
2926 : 69 fe __ ADC #$fe
2928 : 85 44 __ STA T2 + 0 
292a : aa __ __ TAX
292b : a9 30 __ LDA #$30
292d : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s13:
2930 : a9 00 __ LDA #$00
2932 : 85 1b __ STA ACCU + 0 
2934 : a5 43 __ LDA T0 + 0 
2936 : f0 06 __ BEQ $293e ; (nforml.s16 + 0)
.s15:
2938 : c6 44 __ DEC T2 + 0 
293a : a9 2d __ LDA #$2d
293c : d0 0a __ BNE $2948 ; (nforml.s1038 + 0)
.s16:
293e : a0 05 __ LDY #$05
2940 : b1 0d __ LDA (P0),y ; (si + 0)
2942 : f0 09 __ BEQ $294d ; (nforml.s163 + 0)
.s18:
2944 : c6 44 __ DEC T2 + 0 
2946 : a9 2b __ LDA #$2b
.s1038:
2948 : a6 44 __ LDX T2 + 0 
294a : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s163:
294d : a0 06 __ LDY #$06
294f : b1 0d __ LDA (P0),y ; (si + 0)
2951 : d0 33 __ BNE $2986 ; (nforml.s24 + 0)
.l30:
2953 : a0 01 __ LDY #$01
2955 : b1 0d __ LDA (P0),y ; (si + 0)
2957 : 18 __ __ CLC
2958 : 65 44 __ ADC T2 + 0 
295a : b0 04 __ BCS $2960 ; (nforml.s31 + 0)
.s1006:
295c : c9 11 __ CMP #$11
295e : 90 0d __ BCC $296d ; (nforml.s33 + 0)
.s31:
2960 : c6 44 __ DEC T2 + 0 
2962 : a0 00 __ LDY #$00
2964 : b1 0d __ LDA (P0),y ; (si + 0)
2966 : a6 44 __ LDX T2 + 0 
2968 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
296b : b0 e6 __ BCS $2953 ; (nforml.l30 + 0)
.s33:
296d : a6 44 __ LDX T2 + 0 
296f : e0 10 __ CPX #$10
2971 : b0 0e __ BCS $2981 ; (nforml.s23 + 0)
.s34:
2973 : 88 __ __ DEY
.l1035:
2974 : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
2977 : 91 0f __ STA (P2),y ; (str + 0)
2979 : e8 __ __ INX
297a : e0 10 __ CPX #$10
297c : c8 __ __ INY
297d : 90 f5 __ BCC $2974 ; (nforml.l1035 + 0)
.s1036:
297f : 84 1b __ STY ACCU + 0 
.s23:
2981 : a9 00 __ LDA #$00
2983 : 85 1c __ STA ACCU + 1 
.s1001:
2985 : 60 __ __ RTS
.s24:
2986 : a6 44 __ LDX T2 + 0 
2988 : e0 10 __ CPX #$10
298a : b0 1a __ BCS $29a6 ; (nforml.l27 + 0)
.s25:
298c : a0 00 __ LDY #$00
.l1033:
298e : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
2991 : 91 0f __ STA (P2),y ; (str + 0)
2993 : e8 __ __ INX
2994 : e0 10 __ CPX #$10
2996 : c8 __ __ INY
2997 : 90 f5 __ BCC $298e ; (nforml.l1033 + 0)
.s1034:
2999 : 84 1b __ STY ACCU + 0 
299b : b0 09 __ BCS $29a6 ; (nforml.l27 + 0)
.s28:
299d : 88 __ __ DEY
299e : b1 0d __ LDA (P0),y ; (si + 0)
29a0 : a4 1b __ LDY ACCU + 0 
29a2 : 91 0f __ STA (P2),y ; (str + 0)
29a4 : e6 1b __ INC ACCU + 0 
.l27:
29a6 : a5 1b __ LDA ACCU + 0 
29a8 : a0 01 __ LDY #$01
29aa : d1 0d __ CMP (P0),y ; (si + 0)
29ac : 90 ef __ BCC $299d ; (nforml.s28 + 0)
29ae : 4c 81 29 JMP $2981 ; (nforml.s23 + 0)
.l6:
29b1 : a5 11 __ LDA P4 ; (v + 0)
29b3 : 85 1b __ STA ACCU + 0 
29b5 : a5 12 __ LDA P5 ; (v + 1)
29b7 : 85 1c __ STA ACCU + 1 
29b9 : a5 13 __ LDA P6 ; (v + 2)
29bb : 85 1d __ STA ACCU + 2 
29bd : a5 14 __ LDA P7 ; (v + 3)
29bf : 85 1e __ STA ACCU + 3 
29c1 : a5 45 __ LDA T5 + 0 
29c3 : 85 03 __ STA WORK + 0 
29c5 : a5 46 __ LDA T5 + 1 
29c7 : 85 04 __ STA WORK + 1 
29c9 : a9 00 __ LDA #$00
29cb : 85 05 __ STA WORK + 2 
29cd : 85 06 __ STA WORK + 3 
29cf : 20 0d 57 JSR $570d ; (divmod32 + 0)
29d2 : a5 08 __ LDA WORK + 5 
29d4 : 30 08 __ BMI $29de ; (nforml.s78 + 0)
.s1023:
29d6 : d0 0a __ BNE $29e2 ; (nforml.s77 + 0)
.s1022:
29d8 : a5 07 __ LDA WORK + 4 
29da : c9 0a __ CMP #$0a
29dc : b0 04 __ BCS $29e2 ; (nforml.s77 + 0)
.s78:
29de : a9 30 __ LDA #$30
29e0 : d0 02 __ BNE $29e4 ; (nforml.s79 + 0)
.s77:
29e2 : a9 37 __ LDA #$37
.s79:
29e4 : 18 __ __ CLC
29e5 : 65 07 __ ADC WORK + 4 
29e7 : c6 44 __ DEC T2 + 0 
29e9 : a6 44 __ LDX T2 + 0 
29eb : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
29ee : a5 1b __ LDA ACCU + 0 
29f0 : 85 11 __ STA P4 ; (v + 0)
29f2 : a5 1c __ LDA ACCU + 1 
29f4 : 85 12 __ STA P5 ; (v + 1)
29f6 : a5 1d __ LDA ACCU + 2 
29f8 : 85 13 __ STA P6 ; (v + 2)
29fa : a5 1e __ LDA ACCU + 3 
29fc : 85 14 __ STA P7 ; (v + 3)
29fe : d0 b1 __ BNE $29b1 ; (nforml.l6 + 0)
.s1018:
2a00 : a5 13 __ LDA P6 ; (v + 2)
2a02 : d0 ad __ BNE $29b1 ; (nforml.l6 + 0)
.s1019:
2a04 : a5 12 __ LDA P5 ; (v + 1)
2a06 : d0 a9 __ BNE $29b1 ; (nforml.l6 + 0)
.s1020:
2a08 : c5 11 __ CMP P4 ; (v + 0)
2a0a : 90 a5 __ BCC $29b1 ; (nforml.l6 + 0)
2a0c : 4c e7 28 JMP $28e7 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2a0f : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2a1f : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2a2f : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2a39 : 38 __ __ SEC
2a3a : a5 23 __ LDA SP + 0 
2a3c : e9 06 __ SBC #$06
2a3e : 85 23 __ STA SP + 0 
2a40 : b0 02 __ BCS $2a44 ; (load_overlay.s0 + 0)
2a42 : c6 24 __ DEC SP + 1 
.s0:
2a44 : a9 00 __ LDA #$00
2a46 : 85 0d __ STA P0 
2a48 : 85 0e __ STA P1 
2a4a : 20 a9 2a JSR $2aa9 ; (krnio_setbnk.s0 + 0)
2a4d : a9 a0 __ LDA #$a0
2a4f : 85 0d __ STA P0 
2a51 : a9 2a __ LDA #$2a
2a53 : 85 0e __ STA P1 
2a55 : 20 b0 2a JSR $2ab0 ; (krnio_setnam.s0 + 0)
2a58 : a9 01 __ LDA #$01
2a5a : 85 0d __ STA P0 
2a5c : 85 0f __ STA P2 
2a5e : ad fb 57 LDA $57fb ; (bootdevice + 0)
2a61 : 85 0e __ STA P1 
2a63 : 20 c6 2a JSR $2ac6 ; (krnio_load.s0 + 0)
2a66 : 09 00 __ ORA #$00
2a68 : d0 2a __ BNE $2a94 ; (load_overlay.s1001 + 0)
.s1:
2a6a : a9 00 __ LDA #$00
2a6c : a0 02 __ LDY #$02
2a6e : 91 23 __ STA (SP + 0),y 
2a70 : a9 2b __ LDA #$2b
2a72 : c8 __ __ INY
2a73 : 91 23 __ STA (SP + 0),y 
2a75 : 20 e8 22 JSR $22e8 ; (printf.s0 + 0)
2a78 : a9 e3 __ LDA #$e3
2a7a : a0 02 __ LDY #$02
2a7c : 91 23 __ STA (SP + 0),y 
2a7e : a9 2a __ LDA #$2a
2a80 : c8 __ __ INY
2a81 : 91 23 __ STA (SP + 0),y 
2a83 : ad e1 5b LDA $5be1 ; (krnio_pstatus + 1)
2a86 : c8 __ __ INY
2a87 : 91 23 __ STA (SP + 0),y 
2a89 : a9 00 __ LDA #$00
2a8b : c8 __ __ INY
2a8c : 91 23 __ STA (SP + 0),y 
2a8e : 20 e8 22 JSR $22e8 ; (printf.s0 + 0)
2a91 : 20 ef 2a JSR $2aef ; (exit@proxy + 0)
.s1001:
2a94 : 18 __ __ CLC
2a95 : a5 23 __ LDA SP + 0 
2a97 : 69 06 __ ADC #$06
2a99 : 85 23 __ STA SP + 0 
2a9b : 90 02 __ BCC $2a9f ; (load_overlay.s1001 + 11)
2a9d : e6 24 __ INC SP + 1 
2a9f : 60 __ __ RTS
--------------------------------------------------------------------
2aa0 : __ __ __ BYT 56 44 43 53 45 4c 4d 43 00                      : VDCSELMC.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2aa9 : a5 0d __ LDA P0 
2aab : a6 0e __ LDX P1 
2aad : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2ab0 : a5 0d __ LDA P0 
2ab2 : 05 0e __ ORA P1 
2ab4 : f0 08 __ BEQ $2abe ; (krnio_setnam.s0 + 14)
2ab6 : a0 ff __ LDY #$ff
2ab8 : c8 __ __ INY
2ab9 : b1 0d __ LDA (P0),y 
2abb : d0 fb __ BNE $2ab8 ; (krnio_setnam.s0 + 8)
2abd : 98 __ __ TYA
2abe : a6 0d __ LDX P0 
2ac0 : a4 0e __ LDY P1 
2ac2 : 20 bd ff JSR $ffbd 
.s1001:
2ac5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2ac6 : a5 0d __ LDA P0 
2ac8 : a6 0e __ LDX P1 
2aca : a4 0f __ LDY P2 
2acc : 20 ba ff JSR $ffba 
2acf : a9 00 __ LDA #$00
2ad1 : a2 00 __ LDX #$00
2ad3 : a0 00 __ LDY #$00
2ad5 : 20 d5 ff JSR $ffd5 
2ad8 : a9 00 __ LDA #$00
2ada : b0 02 __ BCS $2ade ; (krnio_load.s0 + 24)
2adc : a9 01 __ LDA #$01
2ade : 85 1b __ STA ACCU + 0 
.s1001:
2ae0 : a5 1b __ LDA ACCU + 0 
2ae2 : 60 __ __ RTS
--------------------------------------------------------------------
2ae3 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
2aef : a9 01 __ LDA #$01
2af1 : 85 0d __ STA P0 
2af3 : a9 00 __ LDA #$00
2af5 : 85 0e __ STA P1 
2af7 : 4c 1e 2b JMP $2b1e ; (exit.s0 + 0)
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2afa : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
spentry:
2afd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
2afe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
undoenabled:
2aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2b00 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2b10 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2b1e : a5 0d __ LDA P0 
2b20 : 85 1b __ STA ACCU + 0 
2b22 : a5 0e __ LDA P1 
2b24 : 85 1c __ STA ACCU + 1 
2b26 : ae fd 2a LDX $2afd ; (spentry + 0)
2b29 : 9a __ __ TXS
2b2a : a9 4c __ LDA #$4c
2b2c : 85 54 __ STA $54 
2b2e : a9 00 __ LDA #$00
2b30 : 85 13 __ STA P6 
.s1001:
2b32 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_viewport_init: ; vdcwin_viewport_init(struct VDCViewport*,u8,u8*,u16,u16,u16,u16,u8,u8)->void
.s0:
2b33 : a9 7f __ LDA #$7f
2b35 : 8d 00 5c STA $5c00 ; (canvas + 0)
2b38 : a9 00 __ LDA #$00
2b3a : 8d 04 5c STA $5c04 ; (canvas + 4)
2b3d : 8d 06 5c STA $5c06 ; (canvas + 6)
2b40 : 8d 07 5c STA $5c07 ; (canvas + 7)
2b43 : 8d 08 5c STA $5c08 ; (canvas + 8)
2b46 : 8d 09 5c STA $5c09 ; (canvas + 9)
2b49 : 8d 0a 5c STA $5c0a ; (canvas + 10)
2b4c : 8d 01 5c STA $5c01 ; (canvas + 1)
2b4f : 85 0f __ STA P2 
2b51 : 85 10 __ STA P3 
2b53 : a9 50 __ LDA #$50
2b55 : 8d 03 5c STA $5c03 ; (canvas + 3)
2b58 : 85 11 __ STA P4 
2b5a : a9 19 __ LDA #$19
2b5c : 8d 05 5c STA $5c05 ; (canvas + 5)
2b5f : 85 12 __ STA P5 
2b61 : a9 58 __ LDA #$58
2b63 : 8d 02 5c STA $5c02 ; (canvas + 2)
2b66 : a9 0b __ LDA #$0b
2b68 : 85 0d __ STA P0 
2b6a : a9 5c __ LDA #$5c
2b6c : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
2b6e : a9 00 __ LDA #$00
2b70 : a0 04 __ LDY #$04
2b72 : 91 0d __ STA (P0),y ; (win + 0)
2b74 : c8 __ __ INY
2b75 : 91 0d __ STA (P0),y ; (win + 0)
2b77 : a5 0f __ LDA P2 ; (sx + 0)
2b79 : a0 00 __ LDY #$00
2b7b : 91 0d __ STA (P0),y ; (win + 0)
2b7d : a5 10 __ LDA P3 ; (sy + 0)
2b7f : c8 __ __ INY
2b80 : 91 0d __ STA (P0),y ; (win + 0)
2b82 : a5 11 __ LDA P4 ; (wx + 0)
2b84 : c8 __ __ INY
2b85 : 91 0d __ STA (P0),y ; (win + 0)
2b87 : a5 12 __ LDA P5 ; (wy + 0)
2b89 : c8 __ __ INY
2b8a : 91 0d __ STA (P0),y ; (win + 0)
2b8c : 06 10 __ ASL P3 ; (sy + 0)
2b8e : a6 10 __ LDX P3 ; (sy + 0)
2b90 : bd 2e 5c LDA $5c2e,x ; (multab + 0)
2b93 : 18 __ __ CLC
2b94 : 65 0f __ ADC P2 ; (sx + 0)
2b96 : 85 1b __ STA ACCU + 0 
2b98 : bd 2f 5c LDA $5c2f,x ; (multab + 1)
2b9b : 69 00 __ ADC #$00
2b9d : a8 __ __ TAY
2b9e : ad 1d 5c LDA $5c1d ; (vdc_state + 8)
2ba1 : 18 __ __ CLC
2ba2 : 65 1b __ ADC ACCU + 0 
2ba4 : 85 1b __ STA ACCU + 0 
2ba6 : 98 __ __ TYA
2ba7 : 6d 1e 5c ADC $5c1e ; (vdc_state + 9)
2baa : a0 07 __ LDY #$07
2bac : 91 0d __ STA (P0),y ; (win + 0)
2bae : a5 1b __ LDA ACCU + 0 
2bb0 : 88 __ __ DEY
2bb1 : 91 0d __ STA (P0),y ; (win + 0)
2bb3 : bd 2e 5c LDA $5c2e,x ; (multab + 0)
2bb6 : 18 __ __ CLC
2bb7 : 65 0f __ ADC P2 ; (sx + 0)
2bb9 : 85 1b __ STA ACCU + 0 
2bbb : bd 2f 5c LDA $5c2f,x ; (multab + 1)
2bbe : 69 00 __ ADC #$00
2bc0 : aa __ __ TAX
2bc1 : ad 1f 5c LDA $5c1f ; (vdc_state + 10)
2bc4 : 18 __ __ CLC
2bc5 : 65 1b __ ADC ACCU + 0 
2bc7 : 85 1b __ STA ACCU + 0 
2bc9 : 8a __ __ TXA
2bca : 6d 20 5c ADC $5c20 ; (vdc_state + 11)
2bcd : a0 09 __ LDY #$09
2bcf : 91 0d __ STA (P0),y ; (win + 0)
2bd1 : a5 1b __ LDA ACCU + 0 
2bd3 : 88 __ __ DEY
2bd4 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
2bd6 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
2bd7 : a9 00 __ LDA #$00
2bd9 : 8d fa ab STA $abfa ; (sstack + 4)
2bdc : a0 02 __ LDY #$02
2bde : b1 23 __ LDA (SP + 0),y 
2be0 : 85 16 __ STA P9 
2be2 : c8 __ __ INY
2be3 : b1 23 __ LDA (SP + 0),y 
2be5 : 85 17 __ STA P10 
2be7 : c8 __ __ INY
2be8 : b1 23 __ LDA (SP + 0),y 
2bea : 8d f6 ab STA $abf6 ; (sstack + 0)
2bed : c8 __ __ INY
2bee : b1 23 __ LDA (SP + 0),y 
2bf0 : 8d f7 ab STA $abf7 ; (sstack + 1)
2bf3 : 18 __ __ CLC
2bf4 : a5 23 __ LDA SP + 0 
2bf6 : 69 06 __ ADC #$06
2bf8 : 8d f8 ab STA $abf8 ; (sstack + 2)
2bfb : a5 24 __ LDA SP + 1 
2bfd : 69 00 __ ADC #$00
2bff : 8d f9 ab STA $abf9 ; (sstack + 3)
2c02 : 4c 11 23 JMP $2311 ; (sformat.s1000 + 0)
--------------------------------------------------------------------
2c05 : __ __ __ BYT 77 49 44 54 48 3a 20 20 20 25 35 49 20 00       : wIDTH:   %5I .
--------------------------------------------------------------------
2c13 : __ __ __ BYT 68 45 49 47 48 54 3a 20 20 25 35 49 20 00       : hEIGHT:  %5I .
--------------------------------------------------------------------
2c21 : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 3a 20 25 32 49 20 : bACKGROUND: %2I 
2c31 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2c32 : 38 __ __ SEC
2c33 : a5 23 __ LDA SP + 0 
2c35 : e9 04 __ SBC #$04
2c37 : 85 23 __ STA SP + 0 
2c39 : b0 02 __ BCS $2c3d ; (vdc_init.s0 + 0)
2c3b : c6 24 __ DEC SP + 1 
.s0:
2c3d : a9 1a __ LDA #$1a
2c3f : 8d 00 d6 STA $d600 
.l128:
2c42 : 2c 00 d6 BIT $d600 
2c45 : 10 fb __ BPL $2c42 ; (vdc_init.l128 + 0)
.s7:
2c47 : ad 01 d6 LDA $d601 
2c4a : 29 f0 __ AND #$f0
2c4c : aa __ __ TAX
2c4d : a9 1a __ LDA #$1a
2c4f : 8d 00 d6 STA $d600 
.l130:
2c52 : 2c 00 d6 BIT $d600 
2c55 : 10 fb __ BPL $2c52 ; (vdc_init.l130 + 0)
.s13:
2c57 : 8e 01 d6 STX $d601 
2c5a : 8d 00 d6 STA $d600 
.l132:
2c5d : 2c 00 d6 BIT $d600 
2c60 : 10 fb __ BPL $2c5d ; (vdc_init.l132 + 0)
.s20:
2c62 : ad 01 d6 LDA $d601 
2c65 : 29 0f __ AND #$0f
2c67 : 09 d0 __ ORA #$d0
2c69 : a2 1a __ LDX #$1a
2c6b : 8e 00 d6 STX $d600 
.l134:
2c6e : 2c 00 d6 BIT $d600 
2c71 : 10 fb __ BPL $2c6e ; (vdc_init.l134 + 0)
.s26:
2c73 : 8d 01 d6 STA $d601 
2c76 : a9 8d __ LDA #$8d
2c78 : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
2c7b : 20 b7 2c JSR $2cb7 ; (vdc_detect_mem_size.s0 + 0)
2c7e : 24 d7 __ BIT $d7 
2c80 : 30 17 __ BMI $2c99 ; (vdc_init.s29 + 0)
.s32:
2c82 : a9 81 __ LDA #$81
2c84 : a0 02 __ LDY #$02
2c86 : 91 23 __ STA (SP + 0),y 
2c88 : a9 2e __ LDA #$2e
2c8a : c8 __ __ INY
2c8b : 91 23 __ STA (SP + 0),y 
2c8d : 20 e8 22 JSR $22e8 ; (printf.s0 + 0)
2c90 : 20 ac 2e JSR $2eac ; (getch.s0 + 0)
2c93 : 20 81 ff JSR $ff81 
2c96 : 20 e7 2e JSR $2ee7 ; (screen_setmode.s0 + 0)
.s29:
2c99 : a9 01 __ LDA #$01
2c9b : 20 ef 2e JSR $2eef ; (fastmode.s0 + 0)
2c9e : 20 0e 2f JSR $2f0e ; (vdc_set_mode@proxy + 0)
2ca1 : ad 15 5c LDA $5c15 ; (vdc_state + 0)
2ca4 : c9 40 __ CMP #$40
2ca6 : d0 03 __ BNE $2cab ; (vdc_init.s1001 + 0)
.s39:
2ca8 : 20 fc 30 JSR $30fc ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
2cab : 18 __ __ CLC
2cac : a5 23 __ LDA SP + 0 
2cae : 69 04 __ ADC #$04
2cb0 : 85 23 __ STA SP + 0 
2cb2 : 90 02 __ BCC $2cb6 ; (vdc_init.s1001 + 11)
2cb4 : e6 24 __ INC SP + 1 
2cb6 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2cb7 : a9 1c __ LDA #$1c
2cb9 : 8d 00 d6 STA $d600 
.l335:
2cbc : 2c 00 d6 BIT $d600 
2cbf : 10 fb __ BPL $2cbc ; (vdc_detect_mem_size.l335 + 0)
.s5:
2cc1 : ad 01 d6 LDA $d601 
2cc4 : a8 __ __ TAY
2cc5 : 09 10 __ ORA #$10
2cc7 : a2 1c __ LDX #$1c
2cc9 : 8e 00 d6 STX $d600 
.l337:
2ccc : 2c 00 d6 BIT $d600 
2ccf : 10 fb __ BPL $2ccc ; (vdc_detect_mem_size.l337 + 0)
.s12:
2cd1 : 8d 01 d6 STA $d601 
2cd4 : a9 12 __ LDA #$12
2cd6 : 8d 00 d6 STA $d600 
.l339:
2cd9 : 2c 00 d6 BIT $d600 
2cdc : 10 fb __ BPL $2cd9 ; (vdc_detect_mem_size.l339 + 0)
.s19:
2cde : a9 1f __ LDA #$1f
2ce0 : 8d 01 d6 STA $d601 
2ce3 : a9 13 __ LDA #$13
2ce5 : 8d 00 d6 STA $d600 
.l341:
2ce8 : 2c 00 d6 BIT $d600 
2ceb : 10 fb __ BPL $2ce8 ; (vdc_detect_mem_size.l341 + 0)
.s24:
2ced : a9 ff __ LDA #$ff
2cef : 8d 01 d6 STA $d601 
2cf2 : a9 1f __ LDA #$1f
2cf4 : 8d 00 d6 STA $d600 
.l343:
2cf7 : 2c 00 d6 BIT $d600 
2cfa : 10 fb __ BPL $2cf7 ; (vdc_detect_mem_size.l343 + 0)
.s28:
2cfc : a9 00 __ LDA #$00
2cfe : 8d 01 d6 STA $d601 
2d01 : a9 12 __ LDA #$12
2d03 : 8d 00 d6 STA $d600 
.l345:
2d06 : 2c 00 d6 BIT $d600 
2d09 : 10 fb __ BPL $2d06 ; (vdc_detect_mem_size.l345 + 0)
.s35:
2d0b : a9 9f __ LDA #$9f
2d0d : 8d 01 d6 STA $d601 
2d10 : a9 13 __ LDA #$13
2d12 : 8d 00 d6 STA $d600 
.l347:
2d15 : 2c 00 d6 BIT $d600 
2d18 : 10 fb __ BPL $2d15 ; (vdc_detect_mem_size.l347 + 0)
.s40:
2d1a : a9 ff __ LDA #$ff
2d1c : 8d 01 d6 STA $d601 
2d1f : a9 1f __ LDA #$1f
2d21 : 8d 00 d6 STA $d600 
.l349:
2d24 : 2c 00 d6 BIT $d600 
2d27 : 10 fb __ BPL $2d24 ; (vdc_detect_mem_size.l349 + 0)
.s44:
2d29 : a9 ff __ LDA #$ff
2d2b : 8d 01 d6 STA $d601 
2d2e : a9 12 __ LDA #$12
2d30 : 8d 00 d6 STA $d600 
.l351:
2d33 : 2c 00 d6 BIT $d600 
2d36 : 10 fb __ BPL $2d33 ; (vdc_detect_mem_size.l351 + 0)
.s51:
2d38 : a9 1f __ LDA #$1f
2d3a : 8d 01 d6 STA $d601 
2d3d : a9 13 __ LDA #$13
2d3f : 8d 00 d6 STA $d600 
.l353:
2d42 : 2c 00 d6 BIT $d600 
2d45 : 10 fb __ BPL $2d42 ; (vdc_detect_mem_size.l353 + 0)
.s56:
2d47 : a9 ff __ LDA #$ff
2d49 : 8d 01 d6 STA $d601 
2d4c : a9 1f __ LDA #$1f
2d4e : 8d 00 d6 STA $d600 
.l355:
2d51 : 2c 00 d6 BIT $d600 
2d54 : 10 fb __ BPL $2d51 ; (vdc_detect_mem_size.l355 + 0)
.s60:
2d56 : ad 01 d6 LDA $d601 
2d59 : f0 04 __ BEQ $2d5f ; (vdc_detect_mem_size.s1026 + 0)
.s1027:
2d5b : a9 10 __ LDA #$10
2d5d : d0 02 __ BNE $2d61 ; (vdc_detect_mem_size.s1028 + 0)
.s1026:
2d5f : a9 40 __ LDA #$40
.s1028:
2d61 : 8d 15 5c STA $5c15 ; (vdc_state + 0)
2d64 : 8e 00 d6 STX $d600 
.l358:
2d67 : 2c 00 d6 BIT $d600 
2d6a : 10 fb __ BPL $2d67 ; (vdc_detect_mem_size.l358 + 0)
.s67:
2d6c : 8c 01 d6 STY $d601 
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2d6f : a9 00 __ LDA #$00
2d71 : 85 0f __ STA P2 
2d73 : 85 14 __ STA P7 
2d75 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
2d78 : 85 13 __ STA P6 
2d7a : ad 1a 5c LDA $5c1a ; (vdc_state + 5)
2d7d : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2d7f : 18 __ __ CLC
2d80 : a5 14 __ LDA P7 ; (y + 0)
2d82 : 65 15 __ ADC P8 ; (lines + 0)
2d84 : 85 46 __ STA T1 + 0 
2d86 : a9 00 __ LDA #$00
2d88 : 2a __ __ ROL
2d89 : 85 47 __ STA T1 + 1 
.l1:
2d8b : f0 05 __ BEQ $2d92 ; (vdc_clear.s1002 + 0)
.s1004:
2d8d : a5 14 __ LDA P7 ; (y + 0)
2d8f : 4c 98 2d JMP $2d98 ; (vdc_clear.s2 + 0)
.s1002:
2d92 : a5 14 __ LDA P7 ; (y + 0)
2d94 : c5 46 __ CMP T1 + 0 
2d96 : b0 10 __ BCS $2da8 ; (vdc_clear.s1001 + 0)
.s2:
2d98 : 85 10 __ STA P3 
2d9a : a9 20 __ LDA #$20
2d9c : 85 11 __ STA P4 
2d9e : 20 a9 2d JSR $2da9 ; (vdc_hchar@proxy + 0)
2da1 : e6 14 __ INC P7 ; (y + 0)
2da3 : a5 47 __ LDA T1 + 1 
2da5 : 4c 8b 2d JMP $2d8b ; (vdc_clear.l1 + 0)
.s1001:
2da8 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
2da9 : ad 1c 5c LDA $5c1c ; (vdc_state + 7)
2dac : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
2dae : a5 10 __ LDA P3 ; (y + 0)
2db0 : 0a __ __ ASL
2db1 : aa __ __ TAX
2db2 : bd 2e 5c LDA $5c2e,x ; (multab + 0)
2db5 : 18 __ __ CLC
2db6 : 65 0f __ ADC P2 ; (x + 0)
2db8 : 85 43 __ STA T1 + 0 
2dba : bd 2f 5c LDA $5c2f,x ; (multab + 1)
2dbd : 69 00 __ ADC #$00
2dbf : 85 44 __ STA T1 + 1 
2dc1 : ad 1d 5c LDA $5c1d ; (vdc_state + 8)
2dc4 : 18 __ __ CLC
2dc5 : 65 43 __ ADC T1 + 0 
2dc7 : 85 0d __ STA P0 
2dc9 : ad 1e 5c LDA $5c1e ; (vdc_state + 9)
2dcc : 65 44 __ ADC T1 + 1 
2dce : 85 0e __ STA P1 
2dd0 : 20 5d 2e JSR $2e5d ; (vdc_mem_addr.s0 + 0)
2dd3 : a6 13 __ LDX P6 ; (length + 0)
2dd5 : ca __ __ DEX
2dd6 : 86 45 __ STX T2 + 0 
.l221:
2dd8 : 2c 00 d6 BIT $d600 
2ddb : 10 fb __ BPL $2dd8 ; (vdc_hchar.l221 + 0)
.s6:
2ddd : a5 11 __ LDA P4 ; (val + 0)
2ddf : 8d 01 d6 STA $d601 
2de2 : a9 18 __ LDA #$18
2de4 : 8d 00 d6 STA $d600 
.l223:
2de7 : 2c 00 d6 BIT $d600 
2dea : 10 fb __ BPL $2de7 ; (vdc_hchar.l223 + 0)
.s12:
2dec : ad 01 d6 LDA $d601 
2def : 29 7f __ AND #$7f
2df1 : a2 18 __ LDX #$18
2df3 : 8e 00 d6 STX $d600 
.l225:
2df6 : 2c 00 d6 BIT $d600 
2df9 : 10 fb __ BPL $2df6 ; (vdc_hchar.l225 + 0)
.s18:
2dfb : 8d 01 d6 STA $d601 
2dfe : a9 1e __ LDA #$1e
2e00 : 8d 00 d6 STA $d600 
.l227:
2e03 : 2c 00 d6 BIT $d600 
2e06 : 10 fb __ BPL $2e03 ; (vdc_hchar.l227 + 0)
.s23:
2e08 : a5 45 __ LDA T2 + 0 
2e0a : 8d 01 d6 STA $d601 
2e0d : ad 1f 5c LDA $5c1f ; (vdc_state + 10)
2e10 : 18 __ __ CLC
2e11 : 65 43 __ ADC T1 + 0 
2e13 : 85 0d __ STA P0 
2e15 : ad 20 5c LDA $5c20 ; (vdc_state + 11)
2e18 : 65 44 __ ADC T1 + 1 
2e1a : 85 0e __ STA P1 
2e1c : 20 5d 2e JSR $2e5d ; (vdc_mem_addr.s0 + 0)
.l229:
2e1f : 2c 00 d6 BIT $d600 
2e22 : 10 fb __ BPL $2e1f ; (vdc_hchar.l229 + 0)
.s27:
2e24 : a5 12 __ LDA P5 ; (attr + 0)
2e26 : 8d 01 d6 STA $d601 
2e29 : a9 18 __ LDA #$18
2e2b : 8d 00 d6 STA $d600 
.l231:
2e2e : 2c 00 d6 BIT $d600 
2e31 : 10 fb __ BPL $2e2e ; (vdc_hchar.l231 + 0)
.s33:
2e33 : ad 01 d6 LDA $d601 
2e36 : 29 7f __ AND #$7f
2e38 : a2 18 __ LDX #$18
2e3a : 8e 00 d6 STX $d600 
.l233:
2e3d : 2c 00 d6 BIT $d600 
2e40 : 10 fb __ BPL $2e3d ; (vdc_hchar.l233 + 0)
.s39:
2e42 : 8d 01 d6 STA $d601 
2e45 : a9 1e __ LDA #$1e
2e47 : 8d 00 d6 STA $d600 
.l235:
2e4a : 2c 00 d6 BIT $d600 
2e4d : 10 fb __ BPL $2e4a ; (vdc_hchar.l235 + 0)
.s44:
2e4f : a5 45 __ LDA T2 + 0 
2e51 : 8d 01 d6 STA $d601 
.s1001:
2e54 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2e55 : a5 0f __ LDA P2 
2e57 : 85 0d __ STA P0 
2e59 : a5 10 __ LDA P3 
2e5b : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2e5d : a9 12 __ LDA #$12
2e5f : 8d 00 d6 STA $d600 
.l56:
2e62 : 2c 00 d6 BIT $d600 
2e65 : 10 fb __ BPL $2e62 ; (vdc_mem_addr.l56 + 0)
.s5:
2e67 : a5 0e __ LDA P1 ; (addr + 1)
2e69 : 8d 01 d6 STA $d601 
2e6c : a9 13 __ LDA #$13
2e6e : 8d 00 d6 STA $d600 
.l58:
2e71 : 2c 00 d6 BIT $d600 
2e74 : 10 fb __ BPL $2e71 ; (vdc_mem_addr.l58 + 0)
.s10:
2e76 : a5 0d __ LDA P0 ; (addr + 0)
2e78 : 8d 01 d6 STA $d601 
2e7b : a9 1f __ LDA #$1f
2e7d : 8d 00 d6 STA $d600 
.s1001:
2e80 : 60 __ __ RTS
--------------------------------------------------------------------
2e81 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2e91 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2ea1 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
2eac : 20 b6 2e JSR $2eb6 ; (getpch + 0)
2eaf : c9 00 __ CMP #$00
2eb1 : f0 f9 __ BEQ $2eac ; (getch.s0 + 0)
2eb3 : 85 1b __ STA ACCU + 0 
.s1001:
2eb5 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2eb6 : 20 e4 ff JSR $ffe4 
2eb9 : ae fe 2a LDX $2afe ; (giocharmap + 0)
2ebc : e0 01 __ CPX #$01
2ebe : 90 26 __ BCC $2ee6 ; (getpch + 48)
2ec0 : c9 0d __ CMP #$0d
2ec2 : d0 02 __ BNE $2ec6 ; (getpch + 16)
2ec4 : a9 0a __ LDA #$0a
2ec6 : e0 02 __ CPX #$02
2ec8 : 90 1c __ BCC $2ee6 ; (getpch + 48)
2eca : c9 db __ CMP #$db
2ecc : b0 18 __ BCS $2ee6 ; (getpch + 48)
2ece : c9 41 __ CMP #$41
2ed0 : 90 14 __ BCC $2ee6 ; (getpch + 48)
2ed2 : c9 c1 __ CMP #$c1
2ed4 : 90 02 __ BCC $2ed8 ; (getpch + 34)
2ed6 : 49 a0 __ EOR #$a0
2ed8 : c9 7b __ CMP #$7b
2eda : b0 0a __ BCS $2ee6 ; (getpch + 48)
2edc : c9 61 __ CMP #$61
2ede : b0 04 __ BCS $2ee4 ; (getpch + 46)
2ee0 : c9 5b __ CMP #$5b
2ee2 : b0 02 __ BCS $2ee6 ; (getpch + 48)
2ee4 : 49 20 __ EOR #$20
2ee6 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2ee7 : 24 d7 __ BIT $d7 
2ee9 : 10 01 __ BPL $2eec ; (screen_setmode.s6 + 0)
.s1001:
2eeb : 60 __ __ RTS
.s6:
2eec : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2eef : 09 00 __ ORA #$00
2ef1 : d0 0d __ BNE $2f00 ; (fastmode.s1 + 0)
.s2:
2ef3 : 8d 30 d0 STA $d030 
2ef6 : ad 11 d0 LDA $d011 
2ef9 : 29 7f __ AND #$7f
2efb : 09 10 __ ORA #$10
2efd : 4c 0a 2f JMP $2f0a ; (fastmode.s3 + 0)
.s1:
2f00 : a9 01 __ LDA #$01
2f02 : 8d 30 d0 STA $d030 
2f05 : ad 11 d0 LDA $d011 
2f08 : 29 6f __ AND #$6f
.s3:
2f0a : 8d 11 d0 STA $d011 
.s1001:
2f0d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2f0e : a9 00 __ LDA #$00
2f10 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2f12 : a4 16 __ LDY P9 ; (mode + 0)
2f14 : be ea 57 LDX $57ea,y ; (__multab36L + 0)
2f17 : 86 49 __ STX T1 + 0 
2f19 : 86 4b __ STX T2 + 0 
2f1b : bd 04 5b LDA $5b04,x ; (vdc_modes + 4)
2f1e : f0 08 __ BEQ $2f28 ; (vdc_set_mode.s3 + 0)
.s4:
2f20 : ad 15 5c LDA $5c15 ; (vdc_state + 0)
2f23 : c9 10 __ CMP #$10
2f25 : d0 01 __ BNE $2f28 ; (vdc_set_mode.s3 + 0)
2f27 : 60 __ __ RTS
.s3:
2f28 : 8c 17 5c STY $5c17 ; (vdc_state + 2)
2f2b : a9 00 __ LDA #$00
2f2d : 8d 2b 5c STA $5c2b ; (vdc_state + 22)
2f30 : 8d 2c 5c STA $5c2c ; (vdc_state + 23)
2f33 : 8d 2d 5c STA $5c2d ; (vdc_state + 24)
2f36 : bd 00 5b LDA $5b00,x ; (vdc_modes + 0)
2f39 : 8d 18 5c STA $5c18 ; (vdc_state + 3)
2f3c : bd 01 5b LDA $5b01,x ; (vdc_modes + 1)
2f3f : 8d 19 5c STA $5c19 ; (vdc_state + 4)
2f42 : bd 02 5b LDA $5b02,x ; (vdc_modes + 2)
2f45 : 8d 1a 5c STA $5c1a ; (vdc_state + 5)
2f48 : bd 03 5b LDA $5b03,x ; (vdc_modes + 3)
2f4b : 8d 1b 5c STA $5c1b ; (vdc_state + 6)
2f4e : bd 09 5b LDA $5b09,x ; (vdc_modes + 9)
2f51 : 8d 21 5c STA $5c21 ; (vdc_state + 12)
2f54 : bd 0a 5b LDA $5b0a,x ; (vdc_modes + 10)
2f57 : 8d 22 5c STA $5c22 ; (vdc_state + 13)
2f5a : bd 0b 5b LDA $5b0b,x ; (vdc_modes + 11)
2f5d : 8d 23 5c STA $5c23 ; (vdc_state + 14)
2f60 : bd 0c 5b LDA $5b0c,x ; (vdc_modes + 12)
2f63 : 8d 24 5c STA $5c24 ; (vdc_state + 15)
2f66 : bd 0d 5b LDA $5b0d,x ; (vdc_modes + 13)
2f69 : 8d 25 5c STA $5c25 ; (vdc_state + 16)
2f6c : bd 0e 5b LDA $5b0e,x ; (vdc_modes + 14)
2f6f : 8d 26 5c STA $5c26 ; (vdc_state + 17)
2f72 : bd 0f 5b LDA $5b0f,x ; (vdc_modes + 15)
2f75 : 8d 27 5c STA $5c27 ; (vdc_state + 18)
2f78 : bd 10 5b LDA $5b10,x ; (vdc_modes + 16)
2f7b : 8d 28 5c STA $5c28 ; (vdc_state + 19)
2f7e : bd 11 5b LDA $5b11,x ; (vdc_modes + 17)
2f81 : 8d 29 5c STA $5c29 ; (vdc_state + 20)
2f84 : bd 12 5b LDA $5b12,x ; (vdc_modes + 18)
2f87 : 8d 2a 5c STA $5c2a ; (vdc_state + 21)
2f8a : bd 05 5b LDA $5b05,x ; (vdc_modes + 5)
2f8d : 85 4c __ STA T3 + 0 
2f8f : 8d 1d 5c STA $5c1d ; (vdc_state + 8)
2f92 : bd 06 5b LDA $5b06,x ; (vdc_modes + 6)
2f95 : 85 4d __ STA T3 + 1 
2f97 : 8d 1e 5c STA $5c1e ; (vdc_state + 9)
2f9a : bd 07 5b LDA $5b07,x ; (vdc_modes + 7)
2f9d : 85 4e __ STA T5 + 0 
2f9f : 8d 1f 5c STA $5c1f ; (vdc_state + 10)
2fa2 : bd 08 5b LDA $5b08,x ; (vdc_modes + 8)
2fa5 : 85 4f __ STA T5 + 1 
2fa7 : 8d 20 5c STA $5c20 ; (vdc_state + 11)
2faa : 20 82 30 JSR $3082 ; (vdc_set_multab.s0 + 0)
2fad : a9 22 __ LDA #$22
2faf : 8d 00 d6 STA $d600 
.l295:
2fb2 : 2c 00 d6 BIT $d600 
2fb5 : 10 fb __ BPL $2fb2 ; (vdc_set_mode.l295 + 0)
.s11:
2fb7 : a9 80 __ LDA #$80
2fb9 : 8d 01 d6 STA $d601 
2fbc : a9 0c __ LDA #$0c
2fbe : 8d 00 d6 STA $d600 
.l297:
2fc1 : 2c 00 d6 BIT $d600 
2fc4 : 10 fb __ BPL $2fc1 ; (vdc_set_mode.l297 + 0)
.s17:
2fc6 : a5 4d __ LDA T3 + 1 
2fc8 : 8d 01 d6 STA $d601 
2fcb : a9 0d __ LDA #$0d
2fcd : 8d 00 d6 STA $d600 
.l299:
2fd0 : 2c 00 d6 BIT $d600 
2fd3 : 10 fb __ BPL $2fd0 ; (vdc_set_mode.l299 + 0)
.s22:
2fd5 : a5 4c __ LDA T3 + 0 
2fd7 : 8d 01 d6 STA $d601 
2fda : a9 14 __ LDA #$14
2fdc : 8d 00 d6 STA $d600 
.l301:
2fdf : 2c 00 d6 BIT $d600 
2fe2 : 10 fb __ BPL $2fdf ; (vdc_set_mode.l301 + 0)
.s27:
2fe4 : a5 4f __ LDA T5 + 1 
2fe6 : 8d 01 d6 STA $d601 
2fe9 : a9 15 __ LDA #$15
2feb : 8d 00 d6 STA $d600 
.l303:
2fee : 2c 00 d6 BIT $d600 
2ff1 : 10 fb __ BPL $2fee ; (vdc_set_mode.l303 + 0)
.s32:
2ff3 : a5 4e __ LDA T5 + 0 
2ff5 : 8d 01 d6 STA $d601 
2ff8 : a6 49 __ LDX T1 + 0 
2ffa : bd 0e 5b LDA $5b0e,x ; (vdc_modes + 14)
2ffd : a2 1c __ LDX #$1c
2fff : 8e 00 d6 STX $d600 
.l305:
3002 : 2c 00 d6 BIT $d600 
3005 : 10 fb __ BPL $3002 ; (vdc_set_mode.l305 + 0)
.s39:
3007 : aa __ __ TAX
3008 : ad 01 d6 LDA $d601 
300b : 29 10 __ AND #$10
300d : 85 4e __ STA T5 + 0 
300f : a9 1c __ LDA #$1c
3011 : 8d 00 d6 STA $d600 
3014 : 8a __ __ TXA
3015 : 29 e0 __ AND #$e0
3017 : 05 4e __ ORA T5 + 0 
.l307:
3019 : 2c 00 d6 BIT $d600 
301c : 10 fb __ BPL $3019 ; (vdc_set_mode.l307 + 0)
.s45:
301e : 8d 01 d6 STA $d601 
3021 : 20 dd 30 JSR $30dd ; (vdc_restore_charsets.s0 + 0)
3024 : 18 __ __ CLC
3025 : a9 13 __ LDA #$13
3027 : 65 49 __ ADC T1 + 0 
3029 : 85 49 __ STA T1 + 0 
302b : a9 5b __ LDA #$5b
302d : 69 00 __ ADC #$00
302f : 85 4a __ STA T1 + 1 
3031 : 18 __ __ CLC
3032 : a5 4b __ LDA T2 + 0 
3034 : 69 13 __ ADC #$13
3036 : 85 4c __ STA T3 + 0 
3038 : a9 00 __ LDA #$00
303a : 85 43 __ STA T0 + 0 
303c : 69 5b __ ADC #$5b
303e : 85 4d __ STA T3 + 1 
.l46:
3040 : a4 43 __ LDY T0 + 0 
3042 : b1 49 __ LDA (T1 + 0),y 
3044 : 85 47 __ STA T7 + 0 
3046 : c8 __ __ INY
3047 : b1 49 __ LDA (T1 + 0),y 
3049 : aa __ __ TAX
304a : a5 47 __ LDA T7 + 0 
304c : 8d 00 d6 STA $d600 
304f : c8 __ __ INY
3050 : 84 43 __ STY T0 + 0 
.l309:
3052 : 2c 00 d6 BIT $d600 
3055 : 10 fb __ BPL $3052 ; (vdc_set_mode.l309 + 0)
.s52:
3057 : 8e 01 d6 STX $d601 
305a : b1 4c __ LDA (T3 + 0),y 
305c : c9 ff __ CMP #$ff
305e : d0 e0 __ BNE $3040 ; (vdc_set_mode.l46 + 0)
.s47:
3060 : a6 4b __ LDX T2 + 0 
3062 : bd 04 5b LDA $5b04,x ; (vdc_modes + 4)
3065 : f0 08 __ BEQ $306f ; (vdc_set_mode.s55 + 0)
.s56:
3067 : ad 16 5c LDA $5c16 ; (vdc_state + 1)
306a : d0 03 __ BNE $306f ; (vdc_set_mode.s55 + 0)
.s53:
306c : 20 fc 30 JSR $30fc ; (vdc_set_extended_memsize.s0 + 0)
.s55:
306f : 20 6f 2d JSR $2d6f ; (vdc_cls.s0 + 0)
3072 : a9 22 __ LDA #$22
3074 : 8d 00 d6 STA $d600 
.l314:
3077 : 2c 00 d6 BIT $d600 
307a : 10 fb __ BPL $3077 ; (vdc_set_mode.l314 + 0)
.s62:
307c : a9 7d __ LDA #$7d
307e : 8d 01 d6 STA $d601 
.s1001:
3081 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
3082 : ad 1b 5c LDA $5c1b ; (vdc_state + 6)
3085 : 85 1c __ STA ACCU + 1 
3087 : ad 1a 5c LDA $5c1a ; (vdc_state + 5)
308a : 85 1b __ STA ACCU + 0 
308c : 05 1c __ ORA ACCU + 1 
308e : f0 4c __ BEQ $30dc ; (vdc_set_multab.s1001 + 0)
.s5:
3090 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
3093 : 18 __ __ CLC
3094 : 6d 2d 5c ADC $5c2d ; (vdc_state + 24)
3097 : 85 43 __ STA T2 + 0 
3099 : ad 19 5c LDA $5c19 ; (vdc_state + 4)
309c : 69 00 __ ADC #$00
309e : 85 44 __ STA T2 + 1 
30a0 : a9 00 __ LDA #$00
30a2 : 85 45 __ STA T3 + 0 
30a4 : 85 46 __ STA T3 + 1 
30a6 : a9 2e __ LDA #$2e
30a8 : 85 47 __ STA T4 + 0 
30aa : a9 5c __ LDA #$5c
30ac : 85 48 __ STA T4 + 1 
30ae : a2 00 __ LDX #$00
.l2:
30b0 : a5 45 __ LDA T3 + 0 
30b2 : a0 00 __ LDY #$00
30b4 : 91 47 __ STA (T4 + 0),y 
30b6 : a5 46 __ LDA T3 + 1 
30b8 : c8 __ __ INY
30b9 : 91 47 __ STA (T4 + 0),y 
30bb : 18 __ __ CLC
30bc : a5 43 __ LDA T2 + 0 
30be : 65 45 __ ADC T3 + 0 
30c0 : 85 45 __ STA T3 + 0 
30c2 : a5 44 __ LDA T2 + 1 
30c4 : 65 46 __ ADC T3 + 1 
30c6 : 85 46 __ STA T3 + 1 
30c8 : 18 __ __ CLC
30c9 : a5 47 __ LDA T4 + 0 
30cb : 69 02 __ ADC #$02
30cd : 85 47 __ STA T4 + 0 
30cf : 90 02 __ BCC $30d3 ; (vdc_set_multab.s1006 + 0)
.s1005:
30d1 : e6 48 __ INC T4 + 1 
.s1006:
30d3 : e8 __ __ INX
30d4 : a5 1c __ LDA ACCU + 1 
30d6 : d0 d8 __ BNE $30b0 ; (vdc_set_multab.l2 + 0)
.s1002:
30d8 : e4 1b __ CPX ACCU + 0 
30da : 90 d4 __ BCC $30b0 ; (vdc_set_multab.l2 + 0)
.s1001:
30dc : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
30dd : a9 01 __ LDA #$01
30df : 85 11 __ STA P4 
30e1 : a9 02 __ LDA #$02
30e3 : 85 15 __ STA P8 
30e5 : ad 25 5c LDA $5c25 ; (vdc_state + 16)
30e8 : 85 0f __ STA P2 
30ea : ad 26 5c LDA $5c26 ; (vdc_state + 17)
30ed : 85 10 __ STA P3 
30ef : a9 00 __ LDA #$00
30f1 : 85 14 __ STA P7 
30f3 : 85 12 __ STA P5 
30f5 : a9 d0 __ LDA #$d0
30f7 : 85 13 __ STA P6 
30f9 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
30fc : ad 15 5c LDA $5c15 ; (vdc_state + 0)
30ff : c9 10 __ CMP #$10
3101 : f0 4d __ BEQ $3150 ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
3103 : ad 16 5c LDA $5c16 ; (vdc_state + 1)
3106 : d0 48 __ BNE $3150 ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
3108 : a9 22 __ LDA #$22
310a : 8d 00 d6 STA $d600 
.l120:
310d : 2c 00 d6 BIT $d600 
3110 : 10 fb __ BPL $310d ; (vdc_set_extended_memsize.l120 + 0)
.s11:
3112 : a9 80 __ LDA #$80
3114 : 8d 01 d6 STA $d601 
3117 : 20 51 31 JSR $3151 ; (vdc_wipe_mem.s0 + 0)
311a : a9 1c __ LDA #$1c
311c : 8d 00 d6 STA $d600 
.l122:
311f : 2c 00 d6 BIT $d600 
3122 : 10 fb __ BPL $311f ; (vdc_set_extended_memsize.l122 + 0)
.s17:
3124 : ad 01 d6 LDA $d601 
3127 : 09 10 __ ORA #$10
3129 : a2 1c __ LDX #$1c
312b : 8e 00 d6 STX $d600 
.l124:
312e : 2c 00 d6 BIT $d600 
3131 : 10 fb __ BPL $312e ; (vdc_set_extended_memsize.l124 + 0)
.s23:
3133 : 8d 01 d6 STA $d601 
3136 : 20 dd 30 JSR $30dd ; (vdc_restore_charsets.s0 + 0)
3139 : 20 6f 2d JSR $2d6f ; (vdc_cls.s0 + 0)
313c : a9 22 __ LDA #$22
313e : 8d 00 d6 STA $d600 
.l126:
3141 : 2c 00 d6 BIT $d600 
3144 : 10 fb __ BPL $3141 ; (vdc_set_extended_memsize.l126 + 0)
.s29:
3146 : a9 7d __ LDA #$7d
3148 : 8d 01 d6 STA $d601 
314b : a9 01 __ LDA #$01
314d : 8d 16 5c STA $5c16 ; (vdc_state + 1)
.s1001:
3150 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
3151 : a9 00 __ LDA #$00
3153 : 85 44 __ STA T0 + 1 
3155 : 85 0d __ STA P0 
3157 : a9 ff __ LDA #$ff
3159 : 85 45 __ STA T1 + 0 
.l2:
315b : 20 54 58 JSR $5854 ; (vdc_mem_addr@proxy + 0)
.l252:
315e : 2c 00 d6 BIT $d600 
3161 : 10 fb __ BPL $315e ; (vdc_wipe_mem.l252 + 0)
.s8:
3163 : a9 00 __ LDA #$00
3165 : 8d 01 d6 STA $d601 
3168 : a9 18 __ LDA #$18
316a : 8d 00 d6 STA $d600 
.l254:
316d : 2c 00 d6 BIT $d600 
3170 : 10 fb __ BPL $316d ; (vdc_wipe_mem.l254 + 0)
.s14:
3172 : ad 01 d6 LDA $d601 
3175 : 29 7f __ AND #$7f
3177 : a2 18 __ LDX #$18
3179 : 8e 00 d6 STX $d600 
.l256:
317c : 2c 00 d6 BIT $d600 
317f : 10 fb __ BPL $317c ; (vdc_wipe_mem.l256 + 0)
.s20:
3181 : 8d 01 d6 STA $d601 
3184 : a9 1e __ LDA #$1e
3186 : 8d 00 d6 STA $d600 
.l258:
3189 : 2c 00 d6 BIT $d600 
318c : 10 fb __ BPL $3189 ; (vdc_wipe_mem.l258 + 0)
.s25:
318e : e6 44 __ INC T0 + 1 
3190 : a9 ff __ LDA #$ff
3192 : 8d 01 d6 STA $d601 
3195 : c6 45 __ DEC T1 + 0 
3197 : d0 c2 __ BNE $315b ; (vdc_wipe_mem.l2 + 0)
.s4:
3199 : 20 54 58 JSR $5854 ; (vdc_mem_addr@proxy + 0)
.l261:
319c : 2c 00 d6 BIT $d600 
319f : 10 fb __ BPL $319c ; (vdc_wipe_mem.l261 + 0)
.s29:
31a1 : a9 00 __ LDA #$00
31a3 : 8d 01 d6 STA $d601 
31a6 : a9 18 __ LDA #$18
31a8 : 8d 00 d6 STA $d600 
.l263:
31ab : 2c 00 d6 BIT $d600 
31ae : 10 fb __ BPL $31ab ; (vdc_wipe_mem.l263 + 0)
.s35:
31b0 : ad 01 d6 LDA $d601 
31b3 : 29 7f __ AND #$7f
31b5 : a2 18 __ LDX #$18
31b7 : 8e 00 d6 STX $d600 
.l265:
31ba : 2c 00 d6 BIT $d600 
31bd : 10 fb __ BPL $31ba ; (vdc_wipe_mem.l265 + 0)
.s41:
31bf : 8d 01 d6 STA $d601 
31c2 : a9 1e __ LDA #$1e
31c4 : 8d 00 d6 STA $d600 
.l267:
31c7 : 2c 00 d6 BIT $d600 
31ca : 10 fb __ BPL $31c7 ; (vdc_wipe_mem.l267 + 0)
.s46:
31cc : a9 ff __ LDA #$ff
31ce : 8d 01 d6 STA $d601 
.s1001:
31d1 : 60 __ __ RTS
--------------------------------------------------------------------
31d2 : __ __ __ BYT 75 4e 44 4f 3a 20 65 4e 41 42 4c 45 44 20 20 00 : uNDO: eNABLED  .
--------------------------------------------------------------------
printcentered: ; printcentered(const u8*,u8,u8,u8)->void
.s0:
31e2 : a9 1d __ LDA #$1d
31e4 : 85 0f __ STA P2 
31e6 : a9 16 __ LDA #$16
31e8 : 85 13 __ STA P6 
31ea : a9 18 __ LDA #$18
31ec : 85 14 __ STA P7 
31ee : a9 01 __ LDA #$01
31f0 : 85 15 __ STA P8 
31f2 : 20 7f 2d JSR $2d7f ; (vdc_clear.s0 + 0)
31f5 : a5 16 __ LDA P9 ; (text + 0)
31f7 : 85 0d __ STA P0 
31f9 : a5 17 __ LDA P10 ; (text + 1)
31fb : 85 0e __ STA P1 
31fd : 20 e0 32 JSR $32e0 ; (strlen.s0 + 0)
3200 : a5 1c __ LDA ACCU + 1 
3202 : 30 0c __ BMI $3210 ; (printcentered.s1 + 0)
.s1003:
3204 : d0 06 __ BNE $320c ; (printcentered.s5 + 0)
.s1002:
3206 : a5 1b __ LDA ACCU + 0 
3208 : c9 16 __ CMP #$16
320a : 90 04 __ BCC $3210 ; (printcentered.s1 + 0)
.s5:
320c : a9 1d __ LDA #$1d
320e : d0 1c __ BNE $322c ; (printcentered.s1004 + 0)
.s1:
3210 : 20 e0 32 JSR $32e0 ; (strlen.s0 + 0)
3213 : 38 __ __ SEC
3214 : a9 16 __ LDA #$16
3216 : e5 1b __ SBC ACCU + 0 
3218 : aa __ __ TAX
3219 : a9 00 __ LDA #$00
321b : e5 1c __ SBC ACCU + 1 
321d : a8 __ __ TAY
321e : 0a __ __ ASL
321f : 8a __ __ TXA
3220 : 69 00 __ ADC #$00
3222 : aa __ __ TAX
3223 : 98 __ __ TYA
3224 : 69 00 __ ADC #$00
3226 : 4a __ __ LSR
3227 : 8a __ __ TXA
3228 : 6a __ __ ROR
3229 : 18 __ __ CLC
322a : 69 1c __ ADC #$1c
.s1004:
322c : 85 0f __ STA P2 
322e : a9 18 __ LDA #$18
3230 : 85 10 __ STA P3 
3232 : a5 16 __ LDA P9 ; (text + 0)
3234 : 85 11 __ STA P4 
3236 : a5 17 __ LDA P10 ; (text + 1)
3238 : 85 12 __ STA P5 
323a : ad 1c 5c LDA $5c1c ; (vdc_state + 7)
323d : 85 13 __ STA P6 
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
323f : a5 11 __ LDA P4 ; (string + 0)
3241 : 85 0d __ STA P0 
3243 : 85 43 __ STA T0 + 0 
3245 : a5 12 __ LDA P5 ; (string + 1)
3247 : 85 0e __ STA P1 
3249 : 85 44 __ STA T0 + 1 
324b : a5 10 __ LDA P3 ; (y + 0)
324d : 0a __ __ ASL
324e : aa __ __ TAX
324f : bd 2e 5c LDA $5c2e,x ; (multab + 0)
3252 : 85 46 __ STA T2 + 0 
3254 : bd 2f 5c LDA $5c2f,x ; (multab + 1)
3257 : 85 47 __ STA T2 + 1 
3259 : 20 e0 32 JSR $32e0 ; (strlen.s0 + 0)
325c : a5 1b __ LDA ACCU + 0 
325e : 85 48 __ STA T3 + 0 
3260 : 18 __ __ CLC
3261 : a5 0f __ LDA P2 ; (x + 0)
3263 : 65 46 __ ADC T2 + 0 
3265 : 85 46 __ STA T2 + 0 
3267 : 90 02 __ BCC $326b ; (vdc_prints_attr.s1015 + 0)
.s1014:
3269 : e6 47 __ INC T2 + 1 
.s1015:
326b : 18 __ __ CLC
326c : 6d 1d 5c ADC $5c1d ; (vdc_state + 8)
326f : 85 0d __ STA P0 
3271 : ad 1e 5c LDA $5c1e ; (vdc_state + 9)
3274 : 65 47 __ ADC T2 + 1 
3276 : 85 0e __ STA P1 
3278 : 20 5d 2e JSR $2e5d ; (vdc_mem_addr.s0 + 0)
327b : a5 48 __ LDA T3 + 0 
327d : f0 18 __ BEQ $3297 ; (vdc_prints_attr.s6 + 0)
.s36:
327f : a0 00 __ LDY #$00
.l4:
3281 : 84 45 __ STY T1 + 0 
3283 : b1 43 __ LDA (T0 + 0),y 
3285 : 20 04 33 JSR $3304 ; (pet2screen.s0 + 0)
.l164:
3288 : 2c 00 d6 BIT $d600 
328b : 10 fb __ BPL $3288 ; (vdc_prints_attr.l164 + 0)
.s9:
328d : 8d 01 d6 STA $d601 
3290 : a4 45 __ LDY T1 + 0 
3292 : c8 __ __ INY
3293 : c4 48 __ CPY T3 + 0 
3295 : 90 ea __ BCC $3281 ; (vdc_prints_attr.l4 + 0)
.s6:
3297 : ad 1f 5c LDA $5c1f ; (vdc_state + 10)
329a : 18 __ __ CLC
329b : 65 46 __ ADC T2 + 0 
329d : 85 0d __ STA P0 
329f : ad 20 5c LDA $5c20 ; (vdc_state + 11)
32a2 : 65 47 __ ADC T2 + 1 
32a4 : 85 0e __ STA P1 
32a6 : 20 5d 2e JSR $2e5d ; (vdc_mem_addr.s0 + 0)
32a9 : a6 48 __ LDX T3 + 0 
32ab : ca __ __ DEX
.l167:
32ac : 2c 00 d6 BIT $d600 
32af : 10 fb __ BPL $32ac ; (vdc_prints_attr.l167 + 0)
.s13:
32b1 : a5 13 __ LDA P6 ; (attr + 0)
32b3 : 8d 01 d6 STA $d601 
32b6 : a9 18 __ LDA #$18
32b8 : 8d 00 d6 STA $d600 
.l169:
32bb : 2c 00 d6 BIT $d600 
32be : 10 fb __ BPL $32bb ; (vdc_prints_attr.l169 + 0)
.s19:
32c0 : ad 01 d6 LDA $d601 
32c3 : 29 7f __ AND #$7f
32c5 : a0 18 __ LDY #$18
32c7 : 8c 00 d6 STY $d600 
.l171:
32ca : 2c 00 d6 BIT $d600 
32cd : 10 fb __ BPL $32ca ; (vdc_prints_attr.l171 + 0)
.s25:
32cf : 8d 01 d6 STA $d601 
32d2 : a9 1e __ LDA #$1e
32d4 : 8d 00 d6 STA $d600 
.l173:
32d7 : 2c 00 d6 BIT $d600 
32da : 10 fb __ BPL $32d7 ; (vdc_prints_attr.l173 + 0)
.s30:
32dc : 8e 01 d6 STX $d601 
.s1001:
32df : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
32e0 : a9 00 __ LDA #$00
32e2 : 85 1b __ STA ACCU + 0 
32e4 : 85 1c __ STA ACCU + 1 
32e6 : a8 __ __ TAY
32e7 : b1 0d __ LDA (P0),y ; (str + 0)
32e9 : f0 18 __ BEQ $3303 ; (strlen.s1001 + 0)
.s2:
32eb : a5 0d __ LDA P0 ; (str + 0)
32ed : 85 1b __ STA ACCU + 0 
32ef : a2 00 __ LDX #$00
.l1002:
32f1 : c8 __ __ INY
32f2 : d0 01 __ BNE $32f5 ; (strlen.s1005 + 0)
.s1004:
32f4 : e8 __ __ INX
.s1005:
32f5 : 8a __ __ TXA
32f6 : 18 __ __ CLC
32f7 : 65 0e __ ADC P1 ; (str + 1)
32f9 : 85 1c __ STA ACCU + 1 
32fb : b1 1b __ LDA (ACCU + 0),y 
32fd : d0 f2 __ BNE $32f1 ; (strlen.l1002 + 0)
.s1003:
32ff : 86 1c __ STX ACCU + 1 
3301 : 84 1b __ STY ACCU + 0 
.s1001:
3303 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
3304 : c9 20 __ CMP #$20
3306 : b0 03 __ BCS $330b ; (pet2screen.s2 + 0)
.s1:
3308 : 69 80 __ ADC #$80
330a : 60 __ __ RTS
.s2:
330b : c9 40 __ CMP #$40
330d : 90 27 __ BCC $3336 ; (pet2screen.s21 + 0)
.s7:
330f : c9 60 __ CMP #$60
3311 : 90 17 __ BCC $332a ; (pet2screen.s4 + 0)
.s11:
3313 : 09 00 __ ORA #$00
3315 : 30 04 __ BMI $331b ; (pet2screen.s9 + 0)
.s8:
3317 : 38 __ __ SEC
3318 : e9 20 __ SBC #$20
331a : 60 __ __ RTS
.s9:
331b : c9 80 __ CMP #$80
331d : 90 17 __ BCC $3336 ; (pet2screen.s21 + 0)
.s15:
331f : c9 a0 __ CMP #$a0
3321 : b0 03 __ BCS $3326 ; (pet2screen.s19 + 0)
.s12:
3323 : 69 40 __ ADC #$40
3325 : 60 __ __ RTS
.s19:
3326 : c9 c0 __ CMP #$c0
3328 : b0 04 __ BCS $332e ; (pet2screen.s23 + 0)
.s4:
332a : 38 __ __ SEC
332b : e9 40 __ SBC #$40
332d : 60 __ __ RTS
.s23:
332e : c9 ff __ CMP #$ff
3330 : b0 04 __ BCS $3336 ; (pet2screen.s21 + 0)
.s20:
3332 : 38 __ __ SEC
3333 : e9 80 __ SBC #$80
3335 : 60 __ __ RTS
.s21:
3336 : c9 ff __ CMP #$ff
3338 : d0 02 __ BNE $333c ; (pet2screen.s1001 + 0)
.s24:
333a : a9 5e __ LDA #$5e
.s1001:
333c : 60 __ __ RTS
--------------------------------------------------------------------
333d : __ __ __ BYT 6c 4f 41 44 20 54 49 54 4c 45 20 53 43 52 45 45 : lOAD TITLE SCREE
334d : __ __ __ BYT 4e 00                                           : N.
--------------------------------------------------------------------
334f : __ __ __ BYT 56 44 43 53 45 54 53 43 52 00                   : VDCSETSCR.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
3359 : 38 __ __ SEC
335a : a5 23 __ LDA SP + 0 
335c : e9 08 __ SBC #$08
335e : 85 23 __ STA SP + 0 
3360 : b0 02 __ BCS $3364 ; (menu_fileerrormessage.s0 + 0)
3362 : c6 24 __ DEC SP + 1 
.s0:
3364 : a9 f0 __ LDA #$f0
3366 : 85 17 __ STA P10 
3368 : a9 08 __ LDA #$08
336a : 85 18 __ STA P11 
336c : 8d f6 ab STA $abf6 ; (sstack + 0)
336f : a9 1e __ LDA #$1e
3371 : 8d f7 ab STA $abf7 ; (sstack + 1)
3374 : a9 06 __ LDA #$06
3376 : 8d f8 ab STA $abf8 ; (sstack + 2)
3379 : ad 1c 5c LDA $5c1c ; (vdc_state + 7)
337c : 85 52 __ STA T0 + 0 
337e : a9 8d __ LDA #$8d
3380 : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
3383 : 20 e9 33 JSR $33e9 ; (vdcwin_win_new.s1000 + 0)
3386 : a9 eb __ LDA #$eb
3388 : 85 11 __ STA P4 
338a : a9 37 __ LDA #$37
338c : 85 12 __ STA P5 
338e : 20 32 58 JSR $5832 ; (vdc_prints_attr@proxy + 0)
3391 : a9 00 __ LDA #$00
3393 : a0 02 __ LDY #$02
3395 : 91 23 __ STA (SP + 0),y 
3397 : a9 5d __ LDA #$5d
3399 : c8 __ __ INY
339a : 91 23 __ STA (SP + 0),y 
339c : a9 00 __ LDA #$00
339e : c8 __ __ INY
339f : 91 23 __ STA (SP + 0),y 
33a1 : a9 38 __ LDA #$38
33a3 : c8 __ __ INY
33a4 : 91 23 __ STA (SP + 0),y 
33a6 : ad e1 5b LDA $5be1 ; (krnio_pstatus + 1)
33a9 : c8 __ __ INY
33aa : 91 23 __ STA (SP + 0),y 
33ac : a9 00 __ LDA #$00
33ae : c8 __ __ INY
33af : 91 23 __ STA (SP + 0),y 
33b1 : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
33b4 : a9 0a __ LDA #$0a
33b6 : 85 0f __ STA P2 
33b8 : a9 0b __ LDA #$0b
33ba : 85 10 __ STA P3 
33bc : a9 00 __ LDA #$00
33be : 85 11 __ STA P4 
33c0 : a9 5d __ LDA #$5d
33c2 : 85 12 __ STA P5 
33c4 : a9 8d __ LDA #$8d
33c6 : 85 13 __ STA P6 
33c8 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
33cb : a9 0d __ LDA #$0d
33cd : 85 10 __ STA P3 
33cf : 20 27 58 JSR $5827 ; (vdc_prints_attr@proxy + 0)
33d2 : 20 1a 38 JSR $381a ; (vdcwin_getch.s0 + 0)
33d5 : 20 28 38 JSR $3828 ; (vdcwin_win_free.s0 + 0)
33d8 : a5 52 __ LDA T0 + 0 
33da : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
.s1001:
33dd : 18 __ __ CLC
33de : a5 23 __ LDA SP + 0 
33e0 : 69 08 __ ADC #$08
33e2 : 85 23 __ STA SP + 0 
33e4 : 90 02 __ BCC $33e8 ; (menu_fileerrormessage.s1001 + 11)
33e6 : e6 24 __ INC SP + 1 
33e8 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
33e9 : a2 03 __ LDX #$03
33eb : b5 53 __ LDA T8 + 0,x 
33ed : 9d f2 ab STA $abf2,x ; (buffer + 12)
33f0 : ca __ __ DEX
33f1 : 10 f8 __ BPL $33eb ; (vdcwin_win_new.s1000 + 2)
.s0:
33f3 : ad f7 ab LDA $abf7 ; (sstack + 1)
33f6 : 85 4b __ STA T0 + 0 
33f8 : 85 4c __ STA T1 + 0 
33fa : ad f8 ab LDA $abf8 ; (sstack + 2)
33fd : 85 43 __ STA T2 + 0 
33ff : 85 4d __ STA T3 + 0 
3401 : ad f6 ab LDA $abf6 ; (sstack + 0)
3404 : 0a __ __ ASL
3405 : aa __ __ TAX
3406 : bd 2e 5c LDA $5c2e,x ; (multab + 0)
3409 : 18 __ __ CLC
340a : 65 18 __ ADC P11 ; (xpos + 0)
340c : 85 53 __ STA T8 + 0 
340e : bd 2f 5c LDA $5c2f,x ; (multab + 1)
3411 : 69 00 __ ADC #$00
3413 : 85 54 __ STA T8 + 1 
3415 : a5 17 __ LDA P10 ; (border + 0)
3417 : 0a __ __ ASL
3418 : 10 0e __ BPL $3428 ; (vdcwin_win_new.s57 + 0)
.s6:
341a : a5 18 __ LDA P11 ; (xpos + 0)
341c : f0 0a __ BEQ $3428 ; (vdcwin_win_new.s57 + 0)
.s3:
341e : e6 4c __ INC T1 + 0 
3420 : a5 53 __ LDA T8 + 0 
3422 : d0 02 __ BNE $3426 ; (vdcwin_win_new.s1013 + 0)
.s1012:
3424 : c6 54 __ DEC T8 + 1 
.s1013:
3426 : c6 53 __ DEC T8 + 0 
.s57:
3428 : a5 17 __ LDA P10 ; (border + 0)
342a : 29 20 __ AND #$20
342c : f0 15 __ BEQ $3443 ; (vdcwin_win_new.s59 + 0)
.s10:
342e : 18 __ __ CLC
342f : a5 4b __ LDA T0 + 0 
3431 : 65 18 __ ADC P11 ; (xpos + 0)
3433 : a8 __ __ TAY
3434 : a9 00 __ LDA #$00
3436 : 2a __ __ ROL
3437 : cd 19 5c CMP $5c19 ; (vdc_state + 4)
343a : d0 03 __ BNE $343f ; (vdcwin_win_new.s1009 + 0)
.s1008:
343c : cc 18 5c CPY $5c18 ; (vdc_state + 3)
.s1009:
343f : b0 02 __ BCS $3443 ; (vdcwin_win_new.s59 + 0)
.s7:
3441 : e6 4c __ INC T1 + 0 
.s59:
3443 : 24 17 __ BIT P10 ; (border + 0)
3445 : 10 1e __ BPL $3465 ; (vdcwin_win_new.s60 + 0)
.s14:
3447 : ad f6 ab LDA $abf6 ; (sstack + 0)
344a : f0 19 __ BEQ $3465 ; (vdcwin_win_new.s60 + 0)
.s11:
344c : e6 4d __ INC T3 + 0 
344e : ad 18 5c LDA $5c18 ; (vdc_state + 3)
3451 : 85 03 __ STA WORK + 0 
3453 : ad 19 5c LDA $5c19 ; (vdc_state + 4)
3456 : 85 04 __ STA WORK + 1 
3458 : 38 __ __ SEC
3459 : a5 53 __ LDA T8 + 0 
345b : e5 03 __ SBC WORK + 0 
345d : 85 53 __ STA T8 + 0 
345f : a5 54 __ LDA T8 + 1 
3461 : e5 04 __ SBC WORK + 1 
3463 : 85 54 __ STA T8 + 1 
.s60:
3465 : a5 17 __ LDA P10 ; (border + 0)
3467 : 29 10 __ AND #$10
3469 : f0 16 __ BEQ $3481 ; (vdcwin_win_new.s17 + 0)
.s18:
346b : 18 __ __ CLC
346c : a5 43 __ LDA T2 + 0 
346e : 6d f6 ab ADC $abf6 ; (sstack + 0)
3471 : a8 __ __ TAY
3472 : a9 00 __ LDA #$00
3474 : 2a __ __ ROL
3475 : cd 1b 5c CMP $5c1b ; (vdc_state + 6)
3478 : d0 03 __ BNE $347d ; (vdcwin_win_new.s1007 + 0)
.s1006:
347a : cc 1a 5c CPY $5c1a ; (vdc_state + 5)
.s1007:
347d : b0 02 __ BCS $3481 ; (vdcwin_win_new.s17 + 0)
.s15:
347f : e6 4d __ INC T3 + 0 
.s17:
3481 : a5 43 __ LDA T2 + 0 
3483 : 85 1b __ STA ACCU + 0 ; (height + 0)
3485 : a9 00 __ LDA #$00
3487 : 85 1c __ STA ACCU + 1 
3489 : a5 4b __ LDA T0 + 0 
348b : 20 26 56 JSR $5626 ; (mul16by8 + 0)
348e : a5 05 __ LDA WORK + 2 
3490 : 0a __ __ ASL
3491 : 85 4e __ STA T5 + 0 
3493 : a5 06 __ LDA WORK + 3 
3495 : 2a __ __ ROL
3496 : 85 4f __ STA T5 + 1 
3498 : ad de 5b LDA $5bde ; (winCfg + 6)
349b : 85 50 __ STA T7 + 0 
349d : 18 __ __ CLC
349e : 65 4e __ ADC T5 + 0 
34a0 : 85 4e __ STA T5 + 0 
34a2 : ad df 5b LDA $5bdf ; (winCfg + 7)
34a5 : 85 51 __ STA T7 + 1 
34a7 : 65 4f __ ADC T5 + 1 
34a9 : 85 4f __ STA T5 + 1 
34ab : ad d9 5b LDA $5bd9 ; (winCfg + 1)
34ae : 18 __ __ CLC
34af : 6d db 5b ADC $5bdb ; (winCfg + 3)
34b2 : a8 __ __ TAY
34b3 : ad da 5b LDA $5bda ; (winCfg + 2)
34b6 : 6d dc 5b ADC $5bdc ; (winCfg + 4)
34b9 : aa __ __ TAX
34ba : 98 __ __ TYA
34bb : 18 __ __ CLC
34bc : 69 fe __ ADC #$fe
34be : a8 __ __ TAY
34bf : 8a __ __ TXA
34c0 : 69 ff __ ADC #$ff
34c2 : c5 4f __ CMP T5 + 1 
34c4 : d0 02 __ BNE $34c8 ; (vdcwin_win_new.s1005 + 0)
.s1004:
34c6 : c4 4e __ CPY T5 + 0 
.s1005:
34c8 : 90 59 __ BCC $3523 ; (vdcwin_win_new.s1001 + 0)
.s21:
34ca : ad dd 5b LDA $5bdd ; (winCfg + 5)
34cd : c9 03 __ CMP #$03
34cf : f0 52 __ BEQ $3523 ; (vdcwin_win_new.s1001 + 0)
.s25:
34d1 : a5 18 __ LDA P11 ; (xpos + 0)
34d3 : 85 0f __ STA P2 
34d5 : ad f6 ab LDA $abf6 ; (sstack + 0)
34d8 : 85 10 __ STA P3 
34da : a5 4b __ LDA T0 + 0 
34dc : 85 11 __ STA P4 
34de : a5 43 __ LDA T2 + 0 
34e0 : 85 12 __ STA P5 
34e2 : ee dd 5b INC $5bdd ; (winCfg + 5)
34e5 : ae dd 5b LDX $5bdd ; (winCfg + 5)
34e8 : bd fb 55 LDA $55fb,x ; (__multab13L + 0)
34eb : 85 4e __ STA T5 + 0 
34ed : 18 __ __ CLC
34ee : 69 b4 __ ADC #$b4
34f0 : 85 55 __ STA T10 + 0 
34f2 : 85 0d __ STA P0 
34f4 : a9 5c __ LDA #$5c
34f6 : 69 00 __ ADC #$00
34f8 : 85 56 __ STA T10 + 1 
34fa : 85 0e __ STA P1 
34fc : 20 6e 2b JSR $2b6e ; (vdcwin_init.s0 + 0)
34ff : a5 50 __ LDA T7 + 0 
3501 : a6 4e __ LDX T5 + 0 
3503 : 9d b1 5c STA $5cb1,x ; (multab + 131)
3506 : a5 51 __ LDA T7 + 1 
3508 : 9d b2 5c STA $5cb2,x ; (multab + 132)
350b : a5 17 __ LDA P10 ; (border + 0)
350d : 9d b3 5c STA $5cb3,x ; (multab + 133)
3510 : a5 4d __ LDA T3 + 0 
3512 : d0 1a __ BNE $352e ; (vdcwin_win_new.s32 + 0)
.s30:
3514 : a5 55 __ LDA T10 + 0 
3516 : 85 14 __ STA P7 
3518 : a5 56 __ LDA T10 + 1 
351a : 85 15 __ STA P8 
351c : a5 17 __ LDA P10 ; (border + 0)
351e : 85 16 __ STA P9 
3520 : 20 af 35 JSR $35af ; (vdcwin_border_clear.s0 + 0)
.s1001:
3523 : a2 03 __ LDX #$03
3525 : bd f2 ab LDA $abf2,x ; (buffer + 12)
3528 : 95 53 __ STA T8 + 0,x 
352a : ca __ __ DEX
352b : 10 f8 __ BPL $3525 ; (vdcwin_win_new.s1001 + 2)
352d : 60 __ __ RTS
.s32:
352e : 85 4b __ STA T0 + 0 
3530 : a5 4c __ LDA T1 + 0 
3532 : 85 12 __ STA P5 
.l1010:
3534 : a9 00 __ LDA #$00
3536 : 85 13 __ STA P6 
3538 : ad d8 5b LDA $5bd8 ; (winCfg + 0)
353b : 85 0d __ STA P0 
353d : ad de 5b LDA $5bde ; (winCfg + 6)
3540 : 85 50 __ STA T7 + 0 
3542 : 85 0e __ STA P1 
3544 : ad df 5b LDA $5bdf ; (winCfg + 7)
3547 : 85 51 __ STA T7 + 1 
3549 : 85 0f __ STA P2 
354b : ad 1d 5c LDA $5c1d ; (vdc_state + 8)
354e : 18 __ __ CLC
354f : 65 53 __ ADC T8 + 0 
3551 : 85 10 __ STA P3 
3553 : ad 1e 5c LDA $5c1e ; (vdc_state + 9)
3556 : 65 54 __ ADC T8 + 1 
3558 : 85 11 __ STA P4 
355a : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
355d : a9 00 __ LDA #$00
355f : 85 13 __ STA P6 
3561 : 18 __ __ CLC
3562 : a5 50 __ LDA T7 + 0 
3564 : 65 12 __ ADC P5 
3566 : 85 50 __ STA T7 + 0 
3568 : 85 0e __ STA P1 
356a : 8d de 5b STA $5bde ; (winCfg + 6)
356d : a5 51 __ LDA T7 + 1 
356f : 69 00 __ ADC #$00
3571 : 85 51 __ STA T7 + 1 
3573 : 85 0f __ STA P2 
3575 : 8d df 5b STA $5bdf ; (winCfg + 7)
3578 : ad 1f 5c LDA $5c1f ; (vdc_state + 10)
357b : 18 __ __ CLC
357c : 65 53 __ ADC T8 + 0 
357e : 85 10 __ STA P3 
3580 : ad 20 5c LDA $5c20 ; (vdc_state + 11)
3583 : 65 54 __ ADC T8 + 1 
3585 : 85 11 __ STA P4 
3587 : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
358a : 18 __ __ CLC
358b : a5 50 __ LDA T7 + 0 
358d : 65 12 __ ADC P5 
358f : 8d de 5b STA $5bde ; (winCfg + 6)
3592 : a5 51 __ LDA T7 + 1 
3594 : 69 00 __ ADC #$00
3596 : 8d df 5b STA $5bdf ; (winCfg + 7)
3599 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
359c : 18 __ __ CLC
359d : 65 53 __ ADC T8 + 0 
359f : 85 53 __ STA T8 + 0 
35a1 : ad 19 5c LDA $5c19 ; (vdc_state + 4)
35a4 : 65 54 __ ADC T8 + 1 
35a6 : 85 54 __ STA T8 + 1 
35a8 : c6 4b __ DEC T0 + 0 
35aa : d0 88 __ BNE $3534 ; (vdcwin_win_new.l1010 + 0)
35ac : 4c 14 35 JMP $3514 ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
35af : a5 16 __ LDA P9 ; (border + 0)
35b1 : 29 0f __ AND #$0f
35b3 : 85 47 __ STA T2 + 0 
35b5 : 49 ff __ EOR #$ff
35b7 : 18 __ __ CLC
35b8 : 69 01 __ ADC #$01
35ba : 29 09 __ AND #$09
35bc : 85 48 __ STA T3 + 0 
35be : aa __ __ TAX
35bf : bd b6 5a LDA $5ab6,x ; (winStyles + 0)
35c2 : 85 49 __ STA T4 + 0 
35c4 : a5 16 __ LDA P9 ; (border + 0)
35c6 : 0a __ __ ASL
35c7 : 10 0c __ BPL $35d5 ; (vdcwin_border_clear.s53 + 0)
.s4:
35c9 : a0 00 __ LDY #$00
35cb : b1 14 __ LDA (P7),y ; (win + 0)
35cd : d0 06 __ BNE $35d5 ; (vdcwin_border_clear.s53 + 0)
.s1:
35cf : a5 16 __ LDA P9 ; (border + 0)
35d1 : 29 bf __ AND #$bf
35d3 : 85 16 __ STA P9 ; (border + 0)
.s53:
35d5 : a5 16 __ LDA P9 ; (border + 0)
35d7 : 29 20 __ AND #$20
35d9 : f0 2c __ BEQ $3607 ; (vdcwin_border_clear.s55 + 0)
.s8:
35db : a0 00 __ LDY #$00
35dd : b1 14 __ LDA (P7),y ; (win + 0)
35df : 18 __ __ CLC
35e0 : a0 02 __ LDY #$02
35e2 : 71 14 __ ADC (P7),y ; (win + 0)
35e4 : a8 __ __ TAY
35e5 : a9 00 __ LDA #$00
35e7 : 2a __ __ ROL
35e8 : 85 1c __ STA ACCU + 1 
35ea : 98 __ __ TYA
35eb : 69 01 __ ADC #$01
35ed : 85 1b __ STA ACCU + 0 
35ef : 90 02 __ BCC $35f3 ; (vdcwin_border_clear.s8 + 24)
35f1 : e6 1c __ INC ACCU + 1 
35f3 : ad 19 5c LDA $5c19 ; (vdc_state + 4)
35f6 : c5 1c __ CMP ACCU + 1 
35f8 : d0 05 __ BNE $35ff ; (vdcwin_border_clear.s1007 + 0)
.s1006:
35fa : ad 18 5c LDA $5c18 ; (vdc_state + 3)
35fd : c5 1b __ CMP ACCU + 0 
.s1007:
35ff : b0 06 __ BCS $3607 ; (vdcwin_border_clear.s55 + 0)
.s5:
3601 : a5 16 __ LDA P9 ; (border + 0)
3603 : 29 df __ AND #$df
3605 : 85 16 __ STA P9 ; (border + 0)
.s55:
3607 : 24 16 __ BIT P9 ; (border + 0)
3609 : 10 67 __ BPL $3672 ; (vdcwin_border_clear.s59 + 0)
.s12:
360b : a0 01 __ LDY #$01
360d : b1 14 __ LDA (P7),y ; (win + 0)
360f : f0 61 __ BEQ $3672 ; (vdcwin_border_clear.s59 + 0)
.s9:
3611 : 38 __ __ SEC
3612 : e9 01 __ SBC #$01
3614 : 85 4a __ STA T7 + 0 
3616 : a5 16 __ LDA P9 ; (border + 0)
3618 : 0a __ __ ASL
3619 : 10 18 __ BPL $3633 ; (vdcwin_border_clear.s15 + 0)
.s13:
361b : a5 4a __ LDA T7 + 0 
361d : 85 0e __ STA P1 
361f : a5 49 __ LDA T4 + 0 
3621 : 85 10 __ STA P3 
3623 : bd b7 5a LDA $5ab7,x ; (winStyles + 1)
3626 : 85 0f __ STA P2 
3628 : 38 __ __ SEC
3629 : 88 __ __ DEY
362a : b1 14 __ LDA (P7),y ; (win + 0)
362c : e9 01 __ SBC #$01
362e : 85 0d __ STA P0 
3630 : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
.s15:
3633 : a0 00 __ LDY #$00
3635 : b1 14 __ LDA (P7),y ; (win + 0)
3637 : 85 46 __ STA T0 + 0 
3639 : 85 0f __ STA P2 
363b : a5 4a __ LDA T7 + 0 
363d : 85 10 __ STA P3 
363f : a5 49 __ LDA T4 + 0 
3641 : 85 12 __ STA P5 
3643 : a6 48 __ LDX T3 + 0 
3645 : bd bb 5a LDA $5abb,x ; (winStyles + 5)
3648 : 85 11 __ STA P4 
364a : a0 02 __ LDY #$02
364c : b1 14 __ LDA (P7),y ; (win + 0)
364e : 85 13 __ STA P6 
3650 : 20 ae 2d JSR $2dae ; (vdc_hchar.s0 + 0)
3653 : a5 16 __ LDA P9 ; (border + 0)
3655 : 29 20 __ AND #$20
3657 : f0 19 __ BEQ $3672 ; (vdcwin_border_clear.s59 + 0)
.s16:
3659 : a5 10 __ LDA P3 
365b : 85 0e __ STA P1 
365d : a5 12 __ LDA P5 
365f : 85 10 __ STA P3 
3661 : a6 48 __ LDX T3 + 0 
3663 : bd b8 5a LDA $5ab8,x ; (winStyles + 2)
3666 : 85 0f __ STA P2 
3668 : 18 __ __ CLC
3669 : a5 13 __ LDA P6 
366b : 65 46 __ ADC T0 + 0 
366d : 85 0d __ STA P0 
366f : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
.s59:
3672 : a5 16 __ LDA P9 ; (border + 0)
3674 : 29 10 __ AND #$10
3676 : f0 79 __ BEQ $36f1 ; (vdcwin_border_clear.s39 + 0)
.s22:
3678 : a0 01 __ LDY #$01
367a : b1 14 __ LDA (P7),y ; (win + 0)
367c : 18 __ __ CLC
367d : a0 03 __ LDY #$03
367f : 71 14 __ ADC (P7),y ; (win + 0)
3681 : 85 4a __ STA T7 + 0 
3683 : a9 00 __ LDA #$00
3685 : 2a __ __ ROL
3686 : cd 1b 5c CMP $5c1b ; (vdc_state + 6)
3689 : d0 05 __ BNE $3690 ; (vdcwin_border_clear.s1005 + 0)
.s1004:
368b : a5 4a __ LDA T7 + 0 
368d : cd 1a 5c CMP $5c1a ; (vdc_state + 5)
.s1005:
3690 : b0 5f __ BCS $36f1 ; (vdcwin_border_clear.s39 + 0)
.s19:
3692 : a5 16 __ LDA P9 ; (border + 0)
3694 : 0a __ __ ASL
3695 : 10 1b __ BPL $36b2 ; (vdcwin_border_clear.s25 + 0)
.s23:
3697 : a5 4a __ LDA T7 + 0 
3699 : 85 0e __ STA P1 
369b : a5 49 __ LDA T4 + 0 
369d : 85 10 __ STA P3 
369f : a6 48 __ LDX T3 + 0 
36a1 : bd b9 5a LDA $5ab9,x ; (winStyles + 3)
36a4 : 85 0f __ STA P2 
36a6 : 38 __ __ SEC
36a7 : a0 00 __ LDY #$00
36a9 : b1 14 __ LDA (P7),y ; (win + 0)
36ab : e9 01 __ SBC #$01
36ad : 85 0d __ STA P0 
36af : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
.s25:
36b2 : a0 00 __ LDY #$00
36b4 : b1 14 __ LDA (P7),y ; (win + 0)
36b6 : 85 46 __ STA T0 + 0 
36b8 : 85 0f __ STA P2 
36ba : a5 4a __ LDA T7 + 0 
36bc : 85 10 __ STA P3 
36be : a5 49 __ LDA T4 + 0 
36c0 : 85 12 __ STA P5 
36c2 : a6 48 __ LDX T3 + 0 
36c4 : bd bc 5a LDA $5abc,x ; (winStyles + 6)
36c7 : 85 11 __ STA P4 
36c9 : a0 02 __ LDY #$02
36cb : b1 14 __ LDA (P7),y ; (win + 0)
36cd : 85 13 __ STA P6 
36cf : 20 ae 2d JSR $2dae ; (vdc_hchar.s0 + 0)
36d2 : a5 16 __ LDA P9 ; (border + 0)
36d4 : 29 20 __ AND #$20
36d6 : f0 19 __ BEQ $36f1 ; (vdcwin_border_clear.s39 + 0)
.s26:
36d8 : a5 10 __ LDA P3 
36da : 85 0e __ STA P1 
36dc : a5 12 __ LDA P5 
36de : 85 10 __ STA P3 
36e0 : a6 48 __ LDX T3 + 0 
36e2 : bd ba 5a LDA $5aba,x ; (winStyles + 4)
36e5 : 85 0f __ STA P2 
36e7 : 18 __ __ CLC
36e8 : a5 13 __ LDA P6 
36ea : 65 46 __ ADC T0 + 0 
36ec : 85 0d __ STA P0 
36ee : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
.s39:
36f1 : a9 00 __ LDA #$00
36f3 : 85 46 __ STA T0 + 0 
.l29:
36f5 : a0 03 __ LDY #$03
36f7 : d1 14 __ CMP (P7),y ; (win + 0)
36f9 : 90 01 __ BCC $36fc ; (vdcwin_border_clear.s30 + 0)
.s1001:
36fb : 60 __ __ RTS
.s30:
36fc : a5 16 __ LDA P9 ; (border + 0)
36fe : 0a __ __ ASL
36ff : 10 25 __ BPL $3726 ; (vdcwin_border_clear.s35 + 0)
.s33:
3701 : a5 49 __ LDA T4 + 0 
3703 : 85 10 __ STA P3 
3705 : 38 __ __ SEC
3706 : a0 00 __ LDY #$00
3708 : b1 14 __ LDA (P7),y ; (win + 0)
370a : e9 01 __ SBC #$01
370c : 85 0d __ STA P0 
370e : c8 __ __ INY
370f : b1 14 __ LDA (P7),y ; (win + 0)
3711 : 18 __ __ CLC
3712 : 65 46 __ ADC T0 + 0 
3714 : 85 0e __ STA P1 
3716 : 38 __ __ SEC
3717 : a9 00 __ LDA #$00
3719 : e5 47 __ SBC T2 + 0 
371b : 29 09 __ AND #$09
371d : aa __ __ TAX
371e : bd bd 5a LDA $5abd,x ; (winStyles + 7)
3721 : 85 0f __ STA P2 
3723 : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
.s35:
3726 : a9 20 __ LDA #$20
3728 : 85 11 __ STA P4 
372a : a0 02 __ LDY #$02
372c : b1 14 __ LDA (P7),y ; (win + 0)
372e : 85 13 __ STA P6 
3730 : a0 00 __ LDY #$00
3732 : b1 14 __ LDA (P7),y ; (win + 0)
3734 : 85 0f __ STA P2 
3736 : c8 __ __ INY
3737 : b1 14 __ LDA (P7),y ; (win + 0)
3739 : 18 __ __ CLC
373a : 65 46 __ ADC T0 + 0 
373c : 85 10 __ STA P3 
373e : 20 a9 2d JSR $2da9 ; (vdc_hchar@proxy + 0)
3741 : a5 16 __ LDA P9 ; (border + 0)
3743 : 29 20 __ AND #$20
3745 : f0 1f __ BEQ $3766 ; (vdcwin_border_clear.s69 + 0)
.s36:
3747 : a5 10 __ LDA P3 
3749 : 85 0e __ STA P1 
374b : a5 49 __ LDA T4 + 0 
374d : 85 10 __ STA P3 
374f : 18 __ __ CLC
3750 : a5 13 __ LDA P6 
3752 : 65 0f __ ADC P2 
3754 : 85 0d __ STA P0 
3756 : 38 __ __ SEC
3757 : a9 00 __ LDA #$00
3759 : e5 47 __ SBC T2 + 0 
375b : 29 09 __ AND #$09
375d : aa __ __ TAX
375e : bd be 5a LDA $5abe,x ; (winStyles + 8)
3761 : 85 0f __ STA P2 
3763 : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
.s69:
3766 : e6 46 __ INC T0 + 0 
3768 : a5 46 __ LDA T0 + 0 
376a : 4c f5 36 JMP $36f5 ; (vdcwin_border_clear.l29 + 0)
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
376d : a5 0e __ LDA P1 ; (y + 0)
376f : 0a __ __ ASL
3770 : a2 12 __ LDX #$12
3772 : 8e 00 d6 STX $d600 
3775 : aa __ __ TAX
3776 : 18 __ __ CLC
3777 : a5 0d __ LDA P0 ; (x + 0)
3779 : 7d 2e 5c ADC $5c2e,x ; (multab + 0)
377c : 85 1b __ STA ACCU + 0 
377e : a9 00 __ LDA #$00
3780 : 7d 2f 5c ADC $5c2f,x ; (multab + 1)
3783 : 85 1c __ STA ACCU + 1 
3785 : 18 __ __ CLC
3786 : a5 1b __ LDA ACCU + 0 
3788 : 6d 1d 5c ADC $5c1d ; (vdc_state + 8)
378b : aa __ __ TAX
378c : a5 1c __ LDA ACCU + 1 
378e : 6d 1e 5c ADC $5c1e ; (vdc_state + 9)
.l167:
3791 : 2c 00 d6 BIT $d600 
3794 : 10 fb __ BPL $3791 ; (vdc_printc.l167 + 0)
.s9:
3796 : 8d 01 d6 STA $d601 
3799 : a9 13 __ LDA #$13
379b : 8d 00 d6 STA $d600 
.l169:
379e : 2c 00 d6 BIT $d600 
37a1 : 10 fb __ BPL $379e ; (vdc_printc.l169 + 0)
.s14:
37a3 : 8e 01 d6 STX $d601 
37a6 : a9 1f __ LDA #$1f
37a8 : 8d 00 d6 STA $d600 
.l171:
37ab : 2c 00 d6 BIT $d600 
37ae : 10 fb __ BPL $37ab ; (vdc_printc.l171 + 0)
.s18:
37b0 : a5 0f __ LDA P2 ; (val + 0)
37b2 : 8d 01 d6 STA $d601 
37b5 : ad 1f 5c LDA $5c1f ; (vdc_state + 10)
37b8 : 18 __ __ CLC
37b9 : 65 1b __ ADC ACCU + 0 
37bb : a8 __ __ TAY
37bc : a9 12 __ LDA #$12
37be : 8d 00 d6 STA $d600 
37c1 : ad 20 5c LDA $5c20 ; (vdc_state + 11)
37c4 : 65 1c __ ADC ACCU + 1 
.l173:
37c6 : 2c 00 d6 BIT $d600 
37c9 : 10 fb __ BPL $37c6 ; (vdc_printc.l173 + 0)
.s25:
37cb : 8d 01 d6 STA $d601 
37ce : a9 13 __ LDA #$13
37d0 : 8d 00 d6 STA $d600 
.l175:
37d3 : 2c 00 d6 BIT $d600 
37d6 : 10 fb __ BPL $37d3 ; (vdc_printc.l175 + 0)
.s30:
37d8 : 8c 01 d6 STY $d601 
37db : a9 1f __ LDA #$1f
37dd : 8d 00 d6 STA $d600 
.l177:
37e0 : 2c 00 d6 BIT $d600 
37e3 : 10 fb __ BPL $37e0 ; (vdc_printc.l177 + 0)
.s34:
37e5 : a5 10 __ LDA P3 ; (attr + 0)
37e7 : 8d 01 d6 STA $d601 
.s1001:
37ea : 60 __ __ RTS
--------------------------------------------------------------------
37eb : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
37f7 : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
37fc : __ __ __ BYT 25 32 78 00                                     : %2x.
--------------------------------------------------------------------
3800 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
380f : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
381a : 20 e4 ff JSR $ffe4 
381d : c9 00 __ CMP #$00
381f : f0 f9 __ BEQ $381a ; (vdcwin_getch.s0 + 0)
3821 : 85 1b __ STA ACCU + 0 
3823 : a9 00 __ LDA #$00
3825 : 85 1c __ STA ACCU + 1 
.s1001:
3827 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
3828 : ad dd 5b LDA $5bdd ; (winCfg + 5)
382b : d0 01 __ BNE $382e ; (vdcwin_win_free.s3 + 0)
382d : 60 __ __ RTS
.s3:
382e : 85 44 __ STA T0 + 0 
3830 : a8 __ __ TAY
3831 : be fb 55 LDX $55fb,y ; (__multab13L + 0)
3834 : 86 1b __ STX ACCU + 0 
3836 : bc b6 5c LDY $5cb6,x ; (multab + 136)
3839 : 84 1c __ STY ACCU + 1 
383b : bd b7 5c LDA $5cb7,x ; (multab + 137)
383e : 85 43 __ STA T5 + 0 
3840 : 85 1d __ STA ACCU + 2 
3842 : bd b1 5c LDA $5cb1,x ; (multab + 131)
3845 : 85 45 __ STA T2 + 0 
3847 : 8d de 5b STA $5bde ; (winCfg + 6)
384a : bd b2 5c LDA $5cb2,x ; (multab + 132)
384d : 85 46 __ STA T2 + 1 
384f : 8d df 5b STA $5bdf ; (winCfg + 7)
3852 : bd b4 5c LDA $5cb4,x ; (multab + 134)
3855 : 85 1e __ STA ACCU + 3 
3857 : bd b5 5c LDA $5cb5,x ; (multab + 135)
385a : 85 4a __ STA T10 + 0 
385c : 0a __ __ ASL
385d : aa __ __ TAX
385e : bd 2e 5c LDA $5c2e,x ; (multab + 0)
3861 : 18 __ __ CLC
3862 : 65 1e __ ADC ACCU + 3 
3864 : 85 4b __ STA T11 + 0 
3866 : bd 2f 5c LDA $5c2f,x ; (multab + 1)
3869 : 69 00 __ ADC #$00
386b : 85 4c __ STA T11 + 1 
386d : a6 1b __ LDX ACCU + 0 
386f : bd b3 5c LDA $5cb3,x ; (multab + 133)
3872 : 85 1b __ STA ACCU + 0 
3874 : 0a __ __ ASL
3875 : 10 0e __ BPL $3885 ; (vdcwin_win_free.s53 + 0)
.s10:
3877 : a5 1e __ LDA ACCU + 3 
3879 : f0 0a __ BEQ $3885 ; (vdcwin_win_free.s53 + 0)
.s7:
387b : e6 1c __ INC ACCU + 1 
387d : a5 4b __ LDA T11 + 0 
387f : d0 02 __ BNE $3883 ; (vdcwin_win_free.s1009 + 0)
.s1008:
3881 : c6 4c __ DEC T11 + 1 
.s1009:
3883 : c6 4b __ DEC T11 + 0 
.s53:
3885 : a5 1b __ LDA ACCU + 0 
3887 : 29 20 __ AND #$20
3889 : f0 14 __ BEQ $389f ; (vdcwin_win_free.s55 + 0)
.s14:
388b : 98 __ __ TYA
388c : 18 __ __ CLC
388d : 65 1e __ ADC ACCU + 3 
388f : a8 __ __ TAY
3890 : a9 00 __ LDA #$00
3892 : 2a __ __ ROL
3893 : cd 19 5c CMP $5c19 ; (vdc_state + 4)
3896 : d0 03 __ BNE $389b ; (vdcwin_win_free.s1005 + 0)
.s1004:
3898 : cc 18 5c CPY $5c18 ; (vdc_state + 3)
.s1005:
389b : b0 02 __ BCS $389f ; (vdcwin_win_free.s55 + 0)
.s11:
389d : e6 1c __ INC ACCU + 1 
.s55:
389f : 24 1b __ BIT ACCU + 0 
38a1 : 10 15 __ BPL $38b8 ; (vdcwin_win_free.s56 + 0)
.s18:
38a3 : a5 4a __ LDA T10 + 0 
38a5 : f0 11 __ BEQ $38b8 ; (vdcwin_win_free.s56 + 0)
.s15:
38a7 : e6 1d __ INC ACCU + 2 
38a9 : 38 __ __ SEC
38aa : a5 4b __ LDA T11 + 0 
38ac : ed 18 5c SBC $5c18 ; (vdc_state + 3)
38af : 85 4b __ STA T11 + 0 
38b1 : a5 4c __ LDA T11 + 1 
38b3 : ed 19 5c SBC $5c19 ; (vdc_state + 4)
38b6 : 85 4c __ STA T11 + 1 
.s56:
38b8 : a5 1b __ LDA ACCU + 0 
38ba : 29 10 __ AND #$10
38bc : f0 15 __ BEQ $38d3 ; (vdcwin_win_free.s21 + 0)
.s22:
38be : 18 __ __ CLC
38bf : a5 43 __ LDA T5 + 0 
38c1 : 65 4a __ ADC T10 + 0 
38c3 : a8 __ __ TAY
38c4 : a9 00 __ LDA #$00
38c6 : 2a __ __ ROL
38c7 : cd 1b 5c CMP $5c1b ; (vdc_state + 6)
38ca : d0 03 __ BNE $38cf ; (vdcwin_win_free.s1003 + 0)
.s1002:
38cc : cc 1a 5c CPY $5c1a ; (vdc_state + 5)
.s1003:
38cf : b0 02 __ BCS $38d3 ; (vdcwin_win_free.s21 + 0)
.s19:
38d1 : e6 1d __ INC ACCU + 2 
.s21:
38d3 : a5 1d __ LDA ACCU + 2 
38d5 : d0 11 __ BNE $38e8 ; (vdcwin_win_free.s27 + 0)
.s26:
38d7 : a5 45 __ LDA T2 + 0 
38d9 : 8d de 5b STA $5bde ; (winCfg + 6)
38dc : a5 46 __ LDA T2 + 1 
38de : 8d df 5b STA $5bdf ; (winCfg + 7)
38e1 : a6 44 __ LDX T0 + 0 
38e3 : ca __ __ DEX
38e4 : 8e dd 5b STX $5bdd ; (winCfg + 5)
.s1001:
38e7 : 60 __ __ RTS
.s27:
38e8 : 85 47 __ STA T3 + 0 
38ea : a5 1c __ LDA ACCU + 1 
38ec : 85 14 __ STA P7 
.l1006:
38ee : a9 00 __ LDA #$00
38f0 : 85 15 __ STA P8 
38f2 : ad 1d 5c LDA $5c1d ; (vdc_state + 8)
38f5 : 18 __ __ CLC
38f6 : 65 4b __ ADC T11 + 0 
38f8 : 85 0f __ STA P2 
38fa : ad 1e 5c LDA $5c1e ; (vdc_state + 9)
38fd : 65 4c __ ADC T11 + 1 
38ff : 85 10 __ STA P3 
3901 : ad d8 5b LDA $5bd8 ; (winCfg + 0)
3904 : 85 11 __ STA P4 
3906 : ad de 5b LDA $5bde ; (winCfg + 6)
3909 : 85 48 __ STA T7 + 0 
390b : 85 12 __ STA P5 
390d : ad df 5b LDA $5bdf ; (winCfg + 7)
3910 : 85 49 __ STA T7 + 1 
3912 : 85 13 __ STA P6 
3914 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
3917 : a9 00 __ LDA #$00
3919 : 85 15 __ STA P8 
391b : 18 __ __ CLC
391c : a5 48 __ LDA T7 + 0 
391e : 65 14 __ ADC P7 
3920 : 85 48 __ STA T7 + 0 
3922 : 85 12 __ STA P5 
3924 : 8d de 5b STA $5bde ; (winCfg + 6)
3927 : a5 49 __ LDA T7 + 1 
3929 : 69 00 __ ADC #$00
392b : 85 49 __ STA T7 + 1 
392d : 85 13 __ STA P6 
392f : 8d df 5b STA $5bdf ; (winCfg + 7)
3932 : ad 1f 5c LDA $5c1f ; (vdc_state + 10)
3935 : 18 __ __ CLC
3936 : 65 4b __ ADC T11 + 0 
3938 : 85 0f __ STA P2 
393a : ad 20 5c LDA $5c20 ; (vdc_state + 11)
393d : 65 4c __ ADC T11 + 1 
393f : 85 10 __ STA P3 
3941 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
3944 : 18 __ __ CLC
3945 : a5 48 __ LDA T7 + 0 
3947 : 65 14 __ ADC P7 
3949 : 8d de 5b STA $5bde ; (winCfg + 6)
394c : a5 49 __ LDA T7 + 1 
394e : 69 00 __ ADC #$00
3950 : 8d df 5b STA $5bdf ; (winCfg + 7)
3953 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
3956 : 18 __ __ CLC
3957 : 65 4b __ ADC T11 + 0 
3959 : 85 4b __ STA T11 + 0 
395b : ad 19 5c LDA $5c19 ; (vdc_state + 4)
395e : 65 4c __ ADC T11 + 1 
3960 : 85 4c __ STA T11 + 1 
3962 : c6 47 __ DEC T3 + 0 
3964 : d0 88 __ BNE $38ee ; (vdcwin_win_free.l1006 + 0)
3966 : 4c d7 38 JMP $38d7 ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
3969 : __ __ __ BYT 6c 4f 41 44 20 56 49 53 55 41 4c 20 70 65 74 73 : lOAD VISUAL pets
3979 : __ __ __ BYT 63 69 69 00                                     : cii.
--------------------------------------------------------------------
397d : __ __ __ BYT 56 44 43 53 45 50 45 54 56 00                   : VDCSEPETV.
--------------------------------------------------------------------
3987 : __ __ __ BYT 6c 4f 41 44 20 43 48 41 52 53 45 54 53 00       : lOAD CHARSETS.
--------------------------------------------------------------------
3995 : __ __ __ BYT 56 44 43 53 45 46 41 4c 54 00                   : VDCSEFALT.
--------------------------------------------------------------------
399f : __ __ __ BYT 56 44 43 53 45 46 53 54 44 00                   : VDCSEFSTD.
--------------------------------------------------------------------
screenmapfill: ; screenmapfill(u8,u8)->void
.s0:
39a9 : a9 00 __ LDA #$00
39ab : 85 0d __ STA P0 
39ad : a9 58 __ LDA #$58
39af : 85 0e __ STA P1 
39b1 : ad fb ab LDA $abfb ; (sstack + 5)
39b4 : 85 0f __ STA P2 
39b6 : ad f2 5b LDA $5bf2 ; (screentotal + 0)
39b9 : 85 51 __ STA T0 + 0 
39bb : 18 __ __ CLC
39bc : 69 30 __ ADC #$30
39be : 85 10 __ STA P3 
39c0 : ad f3 5b LDA $5bf3 ; (screentotal + 1)
39c3 : 85 52 __ STA T0 + 1 
39c5 : 69 00 __ ADC #$00
39c7 : 85 11 __ STA P4 
39c9 : 20 c3 14 JSR $14c3 ; (bnk_memset.s0 + 0)
39cc : 20 e8 39 JSR $39e8 ; (placesignature.s1000 + 0)
39cf : a5 51 __ LDA T0 + 0 
39d1 : 85 10 __ STA P3 
39d3 : 18 __ __ CLC
39d4 : 69 30 __ ADC #$30
39d6 : 85 0d __ STA P0 
39d8 : a5 52 __ LDA T0 + 1 
39da : 85 11 __ STA P4 
39dc : 69 58 __ ADC #$58
39de : 85 0e __ STA P1 
39e0 : ad fc ab LDA $abfc ; (sstack + 6)
39e3 : 85 0f __ STA P2 
39e5 : 4c c3 14 JMP $14c3 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
placesignature: ; placesignature()->void
.s1000:
39e8 : 38 __ __ SEC
39e9 : a5 23 __ LDA SP + 0 
39eb : e9 08 __ SBC #$08
39ed : 85 23 __ STA SP + 0 
39ef : b0 02 __ BCS $39f3 ; (placesignature.s0 + 0)
39f1 : c6 24 __ DEC SP + 1 
.s0:
39f3 : a9 00 __ LDA #$00
39f5 : a2 31 __ LDX #$31
.l1007:
39f7 : 9d a8 ab STA $aba8,x ; (buff + 0)
39fa : ca __ __ DEX
39fb : d0 fa __ BNE $39f7 ; (placesignature.l1007 + 0)
.s1003:
39fd : ad 05 5c LDA $5c05 ; (canvas + 5)
3a00 : 85 1b __ STA ACCU + 0 
3a02 : ad 06 5c LDA $5c06 ; (canvas + 6)
3a05 : 85 1c __ STA ACCU + 1 
3a07 : ad 03 5c LDA $5c03 ; (canvas + 3)
3a0a : 85 03 __ STA WORK + 0 
3a0c : ad 04 5c LDA $5c04 ; (canvas + 4)
3a0f : 85 04 __ STA WORK + 1 
3a11 : 20 46 56 JSR $5646 ; (mul16 + 0)
3a14 : a5 05 __ LDA WORK + 2 
3a16 : 85 4e __ STA T0 + 0 
3a18 : 18 __ __ CLC
3a19 : a5 06 __ LDA WORK + 3 
3a1b : 69 58 __ ADC #$58
3a1d : 85 4f __ STA T0 + 1 
3a1f : a9 a9 __ LDA #$a9
3a21 : a0 02 __ LDY #$02
3a23 : 91 23 __ STA (SP + 0),y 
3a25 : a9 ab __ LDA #$ab
3a27 : c8 __ __ INY
3a28 : 91 23 __ STA (SP + 0),y 
3a2a : a9 84 __ LDA #$84
3a2c : c8 __ __ INY
3a2d : 91 23 __ STA (SP + 0),y 
3a2f : a9 3a __ LDA #$3a
3a31 : c8 __ __ INY
3a32 : 91 23 __ STA (SP + 0),y 
3a34 : a9 a0 __ LDA #$a0
3a36 : c8 __ __ INY
3a37 : 91 23 __ STA (SP + 0),y 
3a39 : a9 3a __ LDA #$3a
3a3b : c8 __ __ INY
3a3c : 91 23 __ STA (SP + 0),y 
3a3e : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
3a41 : a9 00 __ LDA #$00
3a43 : 85 50 __ STA T2 + 0 
.l1:
3a45 : a9 a9 __ LDA #$a9
3a47 : 85 0d __ STA P0 
3a49 : a9 ab __ LDA #$ab
3a4b : 85 0e __ STA P1 
3a4d : 20 e0 32 JSR $32e0 ; (strlen.s0 + 0)
3a50 : a5 1c __ LDA ACCU + 1 
3a52 : 30 24 __ BMI $3a78 ; (placesignature.s1001 + 0)
.s1006:
3a54 : d0 06 __ BNE $3a5c ; (placesignature.s2 + 0)
.s1004:
3a56 : a5 50 __ LDA T2 + 0 
3a58 : c5 1b __ CMP ACCU + 0 
3a5a : b0 1c __ BCS $3a78 ; (placesignature.s1001 + 0)
.s2:
3a5c : 18 __ __ CLC
3a5d : a5 4e __ LDA T0 + 0 
3a5f : 65 50 __ ADC T2 + 0 
3a61 : 85 0d __ STA P0 
3a63 : a5 4f __ LDA T0 + 1 
3a65 : 69 00 __ ADC #$00
3a67 : 85 0e __ STA P1 
3a69 : a6 50 __ LDX T2 + 0 
3a6b : bd a9 ab LDA $aba9,x ; (buff + 1)
3a6e : 85 0f __ STA P2 
3a70 : 20 f5 14 JSR $14f5 ; (bnk_writeb.s0 + 0)
3a73 : e6 50 __ INC T2 + 0 
3a75 : 4c 45 3a JMP $3a45 ; (placesignature.l1 + 0)
.s1001:
3a78 : 18 __ __ CLC
3a79 : a5 23 __ LDA SP + 0 
3a7b : 69 08 __ ADC #$08
3a7d : 85 23 __ STA SP + 0 
3a7f : 90 02 __ BCC $3a83 ; (placesignature.s1001 + 11)
3a81 : e6 24 __ INC SP + 1 
3a83 : 60 __ __ RTS
--------------------------------------------------------------------
3a84 : __ __ __ BYT 76 64 63 20 73 43 52 45 45 4e 20 65 44 49 54 4f : vdc sCREEN eDITO
3a94 : __ __ __ BYT 52 20 25 53 20 78 2e 6d 4f 4c 20 00             : R %S x.mOL .
--------------------------------------------------------------------
3aa0 : __ __ __ BYT 56 31 31 2d 32 30 32 34 30 33 30 37 2d 32 32 31 : V11-20240307-221
3ab0 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
3ab2 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 53 54 41 : pRESS KEY TO STA
3ac2 : __ __ __ BYT 52 54 2e 00                                     : RT..
--------------------------------------------------------------------
plotcursor: ; plotcursor()->void
.s0:
3ac6 : ad fd 5a LDA $5afd ; (screen_col + 0)
3ac9 : 85 0d __ STA P0 
3acb : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3ace : 85 0e __ STA P1 
3ad0 : ad ff 5a LDA $5aff ; (plotscreencode + 0)
3ad3 : 85 0f __ STA P2 
3ad5 : ad f7 5b LDA $5bf7 ; (plotblink + 0)
3ad8 : 0a __ __ ASL
3ad9 : 0a __ __ ASL
3ada : 0a __ __ ASL
3adb : 0a __ __ ASL
3adc : 18 __ __ CLC
3add : 6d f4 5b ADC $5bf4 ; (plotcolor + 0)
3ae0 : 85 43 __ STA T0 + 0 
3ae2 : ad f6 5b LDA $5bf6 ; (plotunderline + 0)
3ae5 : 4a __ __ LSR
3ae6 : 6a __ __ ROR
3ae7 : 6a __ __ ROR
3ae8 : 29 c0 __ AND #$c0
3aea : 6a __ __ ROR
3aeb : 65 43 __ ADC T0 + 0 
3aed : 85 43 __ STA T0 + 0 
3aef : ad f5 5b LDA $5bf5 ; (plotreverse + 0)
3af2 : 4a __ __ LSR
3af3 : 6a __ __ ROR
3af4 : 29 80 __ AND #$80
3af6 : 6a __ __ ROR
3af7 : 65 43 __ ADC T0 + 0 
3af9 : 85 43 __ STA T0 + 0 
3afb : ad f8 5b LDA $5bf8 ; (plotaltchar + 0)
3afe : 4a __ __ LSR
3aff : a9 00 __ LDA #$00
3b01 : 6a __ __ ROR
3b02 : 65 43 __ ADC T0 + 0 
3b04 : 85 10 __ STA P3 
3b06 : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_cursor_show@proxy: ; vdcwin_cursor_show@proxy
3b09 : a9 0b __ LDA #$0b
3b0b : 85 0d __ STA P0 
3b0d : a9 5c __ LDA #$5c
3b0f : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_cursor_show: ; vdcwin_cursor_show(struct VDCWin*,bool)->void
.s0:
3b11 : a0 01 __ LDY #$01
3b13 : b1 0d __ LDA (P0),y ; (win + 0)
3b15 : 18 __ __ CLC
3b16 : a0 05 __ LDY #$05
3b18 : 71 0d __ ADC (P0),y ; (win + 0)
3b1a : 0a __ __ ASL
3b1b : aa __ __ TAX
3b1c : 18 __ __ CLC
3b1d : 88 __ __ DEY
3b1e : b1 0d __ LDA (P0),y ; (win + 0)
3b20 : a0 00 __ LDY #$00
3b22 : 71 0d __ ADC (P0),y ; (win + 0)
3b24 : 18 __ __ CLC
3b25 : 7d 2e 5c ADC $5c2e,x ; (multab + 0)
3b28 : a8 __ __ TAY
3b29 : a9 00 __ LDA #$00
3b2b : 7d 2f 5c ADC $5c2f,x ; (multab + 1)
3b2e : a2 12 __ LDX #$12
3b30 : 8e 00 d6 STX $d600 
3b33 : aa __ __ TAX
3b34 : 98 __ __ TYA
3b35 : 18 __ __ CLC
3b36 : 6d 1f 5c ADC $5c1f ; (vdc_state + 10)
3b39 : a8 __ __ TAY
3b3a : 8a __ __ TXA
3b3b : 6d 20 5c ADC $5c20 ; (vdc_state + 11)
.l169:
3b3e : 2c 00 d6 BIT $d600 
3b41 : 10 fb __ BPL $3b3e ; (vdcwin_cursor_show.l169 + 0)
.s9:
3b43 : 8d 01 d6 STA $d601 
3b46 : a2 13 __ LDX #$13
3b48 : 8e 00 d6 STX $d600 
.l171:
3b4b : 2c 00 d6 BIT $d600 
3b4e : 10 fb __ BPL $3b4b ; (vdcwin_cursor_show.l171 + 0)
.s14:
3b50 : 8c 01 d6 STY $d601 
3b53 : a2 1f __ LDX #$1f
3b55 : 8e 00 d6 STX $d600 
.l173:
3b58 : 2c 00 d6 BIT $d600 
3b5b : 10 fb __ BPL $3b58 ; (vdcwin_cursor_show.l173 + 0)
.s18:
3b5d : aa __ __ TAX
3b5e : ad 01 d6 LDA $d601 
3b61 : 49 50 __ EOR #$50
3b63 : 85 1b __ STA ACCU + 0 
3b65 : a9 12 __ LDA #$12
3b67 : 8d 00 d6 STA $d600 
.l175:
3b6a : 2c 00 d6 BIT $d600 
3b6d : 10 fb __ BPL $3b6a ; (vdcwin_cursor_show.l175 + 0)
.s27:
3b6f : 8e 01 d6 STX $d601 
3b72 : a9 13 __ LDA #$13
3b74 : 8d 00 d6 STA $d600 
.l177:
3b77 : 2c 00 d6 BIT $d600 
3b7a : 10 fb __ BPL $3b77 ; (vdcwin_cursor_show.l177 + 0)
.s32:
3b7c : 8c 01 d6 STY $d601 
3b7f : a9 1f __ LDA #$1f
3b81 : 8d 00 d6 STA $d600 
.l179:
3b84 : 2c 00 d6 BIT $d600 
3b87 : 10 fb __ BPL $3b84 ; (vdcwin_cursor_show.l179 + 0)
.s36:
3b89 : a5 1b __ LDA ACCU + 0 
3b8b : 8d 01 d6 STA $d601 
.s1001:
3b8e : 60 __ __ RTS
--------------------------------------------------------------------
initstatusbar: ; initstatusbar()->void
.s1000:
3b8f : a5 53 __ LDA T0 + 0 
3b91 : 8d d3 ab STA $abd3 ; (buff + 43)
3b94 : a5 54 __ LDA T3 + 0 
3b96 : 8d d4 ab STA $abd4 ; (buff + 44)
.s0:
3b99 : ae 1a 5c LDX $5c1a ; (vdc_state + 5)
3b9c : ca __ __ DEX
3b9d : 86 53 __ STX T0 + 0 
3b9f : ad f1 5b LDA $5bf1 ; (screen_row + 1)
3ba2 : d0 07 __ BNE $3bab ; (initstatusbar.s3 + 0)
.s1002:
3ba4 : a5 53 __ LDA T0 + 0 
3ba6 : cd f0 5b CMP $5bf0 ; (screen_row + 0)
3ba9 : f0 6d __ BEQ $3c18 ; (initstatusbar.s1001 + 0)
.s3:
3bab : a9 00 __ LDA #$00
3bad : 85 0f __ STA P2 
3baf : a9 50 __ LDA #$50
3bb1 : 85 13 __ STA P6 
3bb3 : a5 53 __ LDA T0 + 0 
3bb5 : 85 14 __ STA P7 
3bb7 : a9 01 __ LDA #$01
3bb9 : 85 15 __ STA P8 
3bbb : ad ff 55 LDA $55ff ; (mc_menupopup + 0)
3bbe : 85 54 __ STA T3 + 0 
3bc0 : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
3bc3 : 20 7f 2d JSR $2d7f ; (vdc_clear.s0 + 0)
3bc6 : a5 53 __ LDA T0 + 0 
3bc8 : 85 10 __ STA P3 
3bca : a5 54 __ LDA T3 + 0 
3bcc : 85 13 __ STA P6 
3bce : a9 23 __ LDA #$23
3bd0 : 85 11 __ STA P4 
3bd2 : a9 3c __ LDA #$3c
3bd4 : 85 12 __ STA P5 
3bd6 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3bd9 : a9 11 __ LDA #$11
3bdb : 85 0f __ STA P2 
3bdd : a9 29 __ LDA #$29
3bdf : 85 11 __ STA P4 
3be1 : a9 3c __ LDA #$3c
3be3 : 85 12 __ STA P5 
3be5 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3be8 : a9 1f __ LDA #$1f
3bea : 85 0f __ STA P2 
3bec : a9 2e __ LDA #$2e
3bee : 85 11 __ STA P4 
3bf0 : a9 3c __ LDA #$3c
3bf2 : 85 12 __ STA P5 
3bf4 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3bf7 : a9 29 __ LDA #$29
3bf9 : 85 0f __ STA P2 
3bfb : a9 34 __ LDA #$34
3bfd : 85 11 __ STA P4 
3bff : a9 3c __ LDA #$3c
3c01 : 85 12 __ STA P5 
3c03 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3c06 : a9 49 __ LDA #$49
3c08 : 85 0f __ STA P2 
3c0a : a9 3b __ LDA #$3b
3c0c : 85 11 __ STA P4 
3c0e : a9 3c __ LDA #$3c
3c10 : 85 12 __ STA P5 
3c12 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3c15 : 20 43 3c JSR $3c43 ; (printstatusbar.s1000 + 0)
.s1001:
3c18 : ad d3 ab LDA $abd3 ; (buff + 43)
3c1b : 85 53 __ STA T0 + 0 
3c1d : ad d4 ab LDA $abd4 ; (buff + 44)
3c20 : 85 54 __ STA T3 + 0 
3c22 : 60 __ __ RTS
--------------------------------------------------------------------
3c23 : __ __ __ BYT 6d 4f 44 45 3a 00                               : mODE:.
--------------------------------------------------------------------
3c29 : __ __ __ BYT 78 2c 79 3a 00                                  : x,y:.
--------------------------------------------------------------------
3c2e : __ __ __ BYT 63 48 41 52 3a 00                               : cHAR:.
--------------------------------------------------------------------
3c34 : __ __ __ BYT 63 4f 4c 4f 52 3a 00                            : cOLOR:.
--------------------------------------------------------------------
3c3b : __ __ __ BYT 66 38 3d 68 45 4c 50 00                         : f8=hELP.
--------------------------------------------------------------------
printstatusbar: ; printstatusbar()->void
.s1000:
3c43 : a5 53 __ LDA T7 + 0 
3c45 : 8d d6 ab STA $abd6 ; (buff + 46)
3c48 : 38 __ __ SEC
3c49 : a5 23 __ LDA SP + 0 
3c4b : e9 0a __ SBC #$0a
3c4d : 85 23 __ STA SP + 0 
3c4f : b0 02 __ BCS $3c53 ; (printstatusbar.s0 + 0)
3c51 : c6 24 __ DEC SP + 1 
.s0:
3c53 : ae 1a 5c LDX $5c1a ; (vdc_state + 5)
3c56 : ca __ __ DEX
3c57 : 86 4e __ STX T0 + 0 
3c59 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3c5c : 85 4f __ STA T2 + 0 
3c5e : ad f1 5b LDA $5bf1 ; (screen_row + 1)
3c61 : 85 50 __ STA T2 + 1 
3c63 : d0 09 __ BNE $3c6e ; (printstatusbar.s3 + 0)
.s1002:
3c65 : a5 4f __ LDA T2 + 0 
3c67 : c5 4e __ CMP T0 + 0 
3c69 : d0 03 __ BNE $3c6e ; (printstatusbar.s3 + 0)
3c6b : 4c e9 3d JMP $3de9 ; (printstatusbar.s1001 + 0)
.s3:
3c6e : ad ff 55 LDA $55ff ; (mc_menupopup + 0)
3c71 : 85 51 __ STA T3 + 0 
3c73 : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
3c76 : a9 51 __ LDA #$51
3c78 : a0 02 __ LDY #$02
3c7a : 91 23 __ STA (SP + 0),y 
3c7c : a9 5d __ LDA #$5d
3c7e : c8 __ __ INY
3c7f : 91 23 __ STA (SP + 0),y 
3c81 : a9 fa __ LDA #$fa
3c83 : c8 __ __ INY
3c84 : 91 23 __ STA (SP + 0),y 
3c86 : a9 3d __ LDA #$3d
3c88 : c8 __ __ INY
3c89 : 91 23 __ STA (SP + 0),y 
3c8b : a9 e5 __ LDA #$e5
3c8d : c8 __ __ INY
3c8e : 91 23 __ STA (SP + 0),y 
3c90 : a9 5c __ LDA #$5c
3c92 : c8 __ __ INY
3c93 : 91 23 __ STA (SP + 0),y 
3c95 : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
3c98 : a9 06 __ LDA #$06
3c9a : 85 0f __ STA P2 
3c9c : 20 41 58 JSR $5841 ; (vdc_prints_attr@proxy + 0)
3c9f : a9 51 __ LDA #$51
3ca1 : a0 02 __ LDY #$02
3ca3 : 91 23 __ STA (SP + 0),y 
3ca5 : a9 5d __ LDA #$5d
3ca7 : c8 __ __ INY
3ca8 : 91 23 __ STA (SP + 0),y 
3caa : a9 00 __ LDA #$00
3cac : c8 __ __ INY
3cad : 91 23 __ STA (SP + 0),y 
3caf : a9 3e __ LDA #$3e
3cb1 : c8 __ __ INY
3cb2 : 91 23 __ STA (SP + 0),y 
3cb4 : ad 07 5c LDA $5c07 ; (canvas + 7)
3cb7 : 18 __ __ CLC
3cb8 : 6d fd 5a ADC $5afd ; (screen_col + 0)
3cbb : aa __ __ TAX
3cbc : ad 08 5c LDA $5c08 ; (canvas + 8)
3cbf : 6d fe 5a ADC $5afe ; (screen_col + 1)
3cc2 : a0 07 __ LDY #$07
3cc4 : 91 23 __ STA (SP + 0),y 
3cc6 : 8a __ __ TXA
3cc7 : 88 __ __ DEY
3cc8 : 91 23 __ STA (SP + 0),y 
3cca : ad 09 5c LDA $5c09 ; (canvas + 9)
3ccd : 18 __ __ CLC
3cce : 65 4f __ ADC T2 + 0 
3cd0 : aa __ __ TAX
3cd1 : ad 0a 5c LDA $5c0a ; (canvas + 10)
3cd4 : 65 50 __ ADC T2 + 1 
3cd6 : a0 09 __ LDY #$09
3cd8 : 91 23 __ STA (SP + 0),y 
3cda : 8a __ __ TXA
3cdb : 88 __ __ DEY
3cdc : 91 23 __ STA (SP + 0),y 
3cde : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
3ce1 : a9 16 __ LDA #$16
3ce3 : 85 0f __ STA P2 
3ce5 : 20 41 58 JSR $5841 ; (vdc_prints_attr@proxy + 0)
3ce8 : a9 24 __ LDA #$24
3cea : 85 0d __ STA P0 
3cec : a5 10 __ LDA P3 
3cee : 85 0e __ STA P1 
3cf0 : ad ff 5a LDA $5aff ; (plotscreencode + 0)
3cf3 : 85 52 __ STA T6 + 0 
3cf5 : 85 0f __ STA P2 
3cf7 : ad f8 5b LDA $5bf8 ; (plotaltchar + 0)
3cfa : 85 53 __ STA T7 + 0 
3cfc : d0 08 __ BNE $3d06 ; (printstatusbar.s7 + 0)
.s8:
3cfe : 38 __ __ SEC
3cff : a5 13 __ LDA P6 
3d01 : e9 80 __ SBC #$80
3d03 : 4c 08 3d JMP $3d08 ; (printstatusbar.s9 + 0)
.s7:
3d06 : a5 13 __ LDA P6 
.s9:
3d08 : 85 10 __ STA P3 
3d0a : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
3d0d : a9 51 __ LDA #$51
3d0f : a0 02 __ LDY #$02
3d11 : 91 23 __ STA (SP + 0),y 
3d13 : a9 5d __ LDA #$5d
3d15 : c8 __ __ INY
3d16 : 91 23 __ STA (SP + 0),y 
3d18 : a9 fc __ LDA #$fc
3d1a : c8 __ __ INY
3d1b : 91 23 __ STA (SP + 0),y 
3d1d : a9 37 __ LDA #$37
3d1f : c8 __ __ INY
3d20 : 91 23 __ STA (SP + 0),y 
3d22 : a5 52 __ LDA T6 + 0 
3d24 : c8 __ __ INY
3d25 : 91 23 __ STA (SP + 0),y 
3d27 : a9 00 __ LDA #$00
3d29 : c8 __ __ INY
3d2a : 91 23 __ STA (SP + 0),y 
3d2c : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
3d2f : a9 26 __ LDA #$26
3d31 : 85 0f __ STA P2 
3d33 : 20 41 58 JSR $5841 ; (vdc_prints_attr@proxy + 0)
3d36 : a9 30 __ LDA #$30
3d38 : 85 0d __ STA P0 
3d3a : a5 10 __ LDA P3 
3d3c : 85 0e __ STA P1 
3d3e : a9 20 __ LDA #$20
3d40 : 85 0f __ STA P2 
3d42 : ad f4 5b LDA $5bf4 ; (plotcolor + 0)
3d45 : 85 52 __ STA T6 + 0 
3d47 : 18 __ __ CLC
3d48 : 69 40 __ ADC #$40
3d4a : 85 10 __ STA P3 
3d4c : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
3d4f : a9 51 __ LDA #$51
3d51 : a0 02 __ LDY #$02
3d53 : 91 23 __ STA (SP + 0),y 
3d55 : a9 5d __ LDA #$5d
3d57 : c8 __ __ INY
3d58 : 91 23 __ STA (SP + 0),y 
3d5a : a5 52 __ LDA T6 + 0 
3d5c : a0 06 __ LDY #$06
3d5e : 91 23 __ STA (SP + 0),y 
3d60 : a9 00 __ LDA #$00
3d62 : c8 __ __ INY
3d63 : 91 23 __ STA (SP + 0),y 
3d65 : a9 08 __ LDA #$08
3d67 : a0 04 __ LDY #$04
3d69 : 91 23 __ STA (SP + 0),y 
3d6b : a9 3e __ LDA #$3e
3d6d : c8 __ __ INY
3d6e : 91 23 __ STA (SP + 0),y 
3d70 : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
3d73 : a9 32 __ LDA #$32
3d75 : 85 0f __ STA P2 
3d77 : 20 41 58 JSR $5841 ; (vdc_prints_attr@proxy + 0)
3d7a : a9 36 __ LDA #$36
3d7c : 85 0f __ STA P2 
3d7e : ad f5 5b LDA $5bf5 ; (plotreverse + 0)
3d81 : d0 07 __ BNE $3d8a ; (printstatusbar.s12 + 0)
.s13:
3d83 : a9 3e __ LDA #$3e
3d85 : a2 10 __ LDX #$10
3d87 : 4c 8e 3d JMP $3d8e ; (printstatusbar.s35 + 0)
.s12:
3d8a : a9 3e __ LDA #$3e
3d8c : a2 0c __ LDX #$0c
.s35:
3d8e : 86 11 __ STX P4 
3d90 : 85 12 __ STA P5 
3d92 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3d95 : a9 3a __ LDA #$3a
3d97 : 85 0f __ STA P2 
3d99 : ad f6 5b LDA $5bf6 ; (plotunderline + 0)
3d9c : d0 07 __ BNE $3da5 ; (printstatusbar.s17 + 0)
.s18:
3d9e : a9 3e __ LDA #$3e
3da0 : a2 10 __ LDX #$10
3da2 : 4c a9 3d JMP $3da9 ; (printstatusbar.s36 + 0)
.s17:
3da5 : a9 3e __ LDA #$3e
3da7 : a2 14 __ LDX #$14
.s36:
3da9 : 86 11 __ STX P4 
3dab : 85 12 __ STA P5 
3dad : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3db0 : ad f7 5b LDA $5bf7 ; (plotblink + 0)
3db3 : d0 0b __ BNE $3dc0 ; (printstatusbar.s22 + 0)
.s23:
3db5 : a9 3d __ LDA #$3d
3db7 : 85 0f __ STA P2 
3db9 : a9 3e __ LDA #$3e
3dbb : a2 10 __ LDX #$10
3dbd : 4c c8 3d JMP $3dc8 ; (printstatusbar.s37 + 0)
.s22:
3dc0 : a9 3e __ LDA #$3e
3dc2 : 85 0f __ STA P2 
3dc4 : a9 3e __ LDA #$3e
3dc6 : a2 18 __ LDX #$18
.s37:
3dc8 : 86 11 __ STX P4 
3dca : 85 12 __ STA P5 
3dcc : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
3dcf : a5 53 __ LDA T7 + 0 
3dd1 : d0 07 __ BNE $3dda ; (printstatusbar.s27 + 0)
.s28:
3dd3 : a9 3e __ LDA #$3e
3dd5 : a2 10 __ LDX #$10
3dd7 : 4c de 3d JMP $3dde ; (printstatusbar.s29 + 0)
.s27:
3dda : a9 3e __ LDA #$3e
3ddc : a2 1c __ LDX #$1c
.s29:
3dde : 86 11 __ STX P4 
3de0 : 85 12 __ STA P5 
3de2 : a9 42 __ LDA #$42
3de4 : 85 0f __ STA P2 
3de6 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
.s1001:
3de9 : 18 __ __ CLC
3dea : a5 23 __ LDA SP + 0 
3dec : 69 0a __ ADC #$0a
3dee : 85 23 __ STA SP + 0 
3df0 : 90 02 __ BCC $3df4 ; (printstatusbar.s1001 + 11)
3df2 : e6 24 __ INC SP + 1 
3df4 : ad d6 ab LDA $abd6 ; (buff + 46)
3df7 : 85 53 __ STA T7 + 0 
3df9 : 60 __ __ RTS
--------------------------------------------------------------------
3dfa : __ __ __ BYT 25 2d 31 30 53 00                               : %-10S.
--------------------------------------------------------------------
3e00 : __ __ __ BYT 25 33 55 2c 25 33 55 00                         : %3U,%3U.
--------------------------------------------------------------------
3e08 : __ __ __ BYT 25 32 55 00                                     : %2U.
--------------------------------------------------------------------
3e0c : __ __ __ BYT 72 65 76 00                                     : rev.
--------------------------------------------------------------------
3e10 : __ __ __ BYT 20 20 20 00                                     :    .
--------------------------------------------------------------------
3e14 : __ __ __ BYT 75 6e 64 00                                     : und.
--------------------------------------------------------------------
3e18 : __ __ __ BYT 62 6c 69 00                                     : bli.
--------------------------------------------------------------------
3e1c : __ __ __ BYT 61 6c 74 00                                     : alt.
--------------------------------------------------------------------
plotmove: ; plotmove(u8)->void
.s1000:
3e20 : a2 06 __ LDX #$06
3e22 : b5 53 __ LDA T0 + 0,x 
3e24 : 9d c3 ab STA $abc3,x ; (buff + 27)
3e27 : ca __ __ DEX
3e28 : 10 f8 __ BPL $3e22 ; (plotmove.s1000 + 2)
.s0:
3e2a : ad fd 5a LDA $5afd ; (screen_col + 0)
3e2d : 85 53 __ STA T0 + 0 
3e2f : 18 __ __ CLC
3e30 : 6d 07 5c ADC $5c07 ; (canvas + 7)
3e33 : 85 54 __ STA T1 + 0 
3e35 : ad 08 5c LDA $5c08 ; (canvas + 8)
3e38 : 6d fe 5a ADC $5afe ; (screen_col + 1)
3e3b : 85 55 __ STA T1 + 1 
3e3d : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3e40 : 85 56 __ STA T2 + 0 
3e42 : 18 __ __ CLC
3e43 : 6d 09 5c ADC $5c09 ; (canvas + 9)
3e46 : 85 03 __ STA WORK + 0 
3e48 : ad 0a 5c LDA $5c0a ; (canvas + 10)
3e4b : 6d f1 5b ADC $5bf1 ; (screen_row + 1)
3e4e : 85 04 __ STA WORK + 1 
3e50 : ad 03 5c LDA $5c03 ; (canvas + 3)
3e53 : 85 57 __ STA T4 + 0 
3e55 : 85 1b __ STA ACCU + 0 
3e57 : ad 04 5c LDA $5c04 ; (canvas + 4)
3e5a : 85 58 __ STA T4 + 1 
3e5c : 85 1c __ STA ACCU + 1 
3e5e : 20 46 56 JSR $5646 ; (mul16 + 0)
3e61 : 18 __ __ CLC
3e62 : a5 06 __ LDA WORK + 3 
3e64 : 69 58 __ ADC #$58
3e66 : aa __ __ TAX
3e67 : 18 __ __ CLC
3e68 : a5 05 __ LDA WORK + 2 
3e6a : 65 54 __ ADC T1 + 0 
3e6c : 85 0d __ STA P0 
3e6e : 8a __ __ TXA
3e6f : 65 55 __ ADC T1 + 1 
3e71 : 85 0e __ STA P1 
3e73 : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
3e76 : 85 59 __ STA T5 + 0 
3e78 : ad 05 5c LDA $5c05 ; (canvas + 5)
3e7b : 85 1b __ STA ACCU + 0 
3e7d : ad 06 5c LDA $5c06 ; (canvas + 6)
3e80 : 85 1c __ STA ACCU + 1 
3e82 : a5 57 __ LDA T4 + 0 
3e84 : 85 03 __ STA WORK + 0 
3e86 : a5 58 __ LDA T4 + 1 
3e88 : 85 04 __ STA WORK + 1 
3e8a : 20 46 56 JSR $5646 ; (mul16 + 0)
3e8d : 18 __ __ CLC
3e8e : a5 05 __ LDA WORK + 2 
3e90 : 65 0d __ ADC P0 
3e92 : a8 __ __ TAY
3e93 : a5 06 __ LDA WORK + 3 
3e95 : 65 0e __ ADC P1 
3e97 : aa __ __ TAX
3e98 : 98 __ __ TYA
3e99 : 18 __ __ CLC
3e9a : 69 30 __ ADC #$30
3e9c : 85 0d __ STA P0 
3e9e : 90 01 __ BCC $3ea1 ; (plotmove.s1015 + 0)
.s1014:
3ea0 : e8 __ __ INX
.s1015:
3ea1 : 86 0e __ STX P1 
3ea3 : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
3ea6 : 85 10 __ STA P3 
3ea8 : a5 53 __ LDA T0 + 0 
3eaa : 85 0d __ STA P0 
3eac : a5 56 __ LDA T2 + 0 
3eae : 85 0e __ STA P1 
3eb0 : a5 59 __ LDA T5 + 0 
3eb2 : 85 0f __ STA P2 
3eb4 : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
3eb7 : ad ff ab LDA $abff ; (sstack + 9)
3eba : c9 91 __ CMP #$91
3ebc : d0 12 __ BNE $3ed0 ; (plotmove.s13 + 0)
.s8:
3ebe : a9 00 __ LDA #$00
3ec0 : 8d fb ab STA $abfb ; (sstack + 5)
3ec3 : 8d fc ab STA $abfc ; (sstack + 6)
3ec6 : 8d fe ab STA $abfe ; (sstack + 8)
3ec9 : a9 01 __ LDA #$01
3ecb : 8d fd ab STA $abfd ; (sstack + 7)
3ece : d0 16 __ BNE $3ee6 ; (plotmove.s1012 + 0)
.s13:
3ed0 : 90 25 __ BCC $3ef7 ; (plotmove.s15 + 0)
.s14:
3ed2 : c9 9d __ CMP #$9d
3ed4 : d0 13 __ BNE $3ee9 ; (plotmove.s1001 + 0)
.s6:
3ed6 : a9 01 __ LDA #$01
3ed8 : 8d fb ab STA $abfb ; (sstack + 5)
3edb : a9 00 __ LDA #$00
3edd : 8d fc ab STA $abfc ; (sstack + 6)
3ee0 : 8d fd ab STA $abfd ; (sstack + 7)
.s1013:
3ee3 : 8d fe ab STA $abfe ; (sstack + 8)
.s1012:
3ee6 : 20 20 3f JSR $3f20 ; (cursormove.s1000 + 0)
.s1001:
3ee9 : 20 c6 3a JSR $3ac6 ; (plotcursor.s0 + 0)
3eec : a2 06 __ LDX #$06
3eee : bd c3 ab LDA $abc3,x ; (buff + 27)
3ef1 : 95 53 __ STA T0 + 0,x 
3ef3 : ca __ __ DEX
3ef4 : 10 f8 __ BPL $3eee ; (plotmove.s1001 + 5)
3ef6 : 60 __ __ RTS
.s15:
3ef7 : c9 11 __ CMP #$11
3ef9 : d0 0f __ BNE $3f0a ; (plotmove.s16 + 0)
.s9:
3efb : a9 00 __ LDA #$00
3efd : 8d fb ab STA $abfb ; (sstack + 5)
3f00 : 8d fc ab STA $abfc ; (sstack + 6)
3f03 : 8d fd ab STA $abfd ; (sstack + 7)
3f06 : a9 01 __ LDA #$01
3f08 : d0 d9 __ BNE $3ee3 ; (plotmove.s1013 + 0)
.s16:
3f0a : c9 1d __ CMP #$1d
3f0c : d0 db __ BNE $3ee9 ; (plotmove.s1001 + 0)
.s7:
3f0e : a9 00 __ LDA #$00
3f10 : 8d fb ab STA $abfb ; (sstack + 5)
3f13 : 8d fd ab STA $abfd ; (sstack + 7)
3f16 : 8d fe ab STA $abfe ; (sstack + 8)
3f19 : a9 01 __ LDA #$01
3f1b : 8d fc ab STA $abfc ; (sstack + 6)
3f1e : d0 c6 __ BNE $3ee6 ; (plotmove.s1012 + 0)
--------------------------------------------------------------------
cursormove: ; cursormove(u8,u8,u8,u8)->void
.s1000:
3f20 : a2 03 __ LDX #$03
3f22 : b5 53 __ LDA T2 + 0,x 
3f24 : 9d cc ab STA $abcc,x ; (buff + 36)
3f27 : ca __ __ DEX
3f28 : 10 f8 __ BPL $3f22 ; (cursormove.s1000 + 2)
.s0:
3f2a : ad fb ab LDA $abfb ; (sstack + 5)
3f2d : c9 01 __ CMP #$01
3f2f : d0 25 __ BNE $3f56 ; (cursormove.s56 + 0)
.s1:
3f31 : ad fd 5a LDA $5afd ; (screen_col + 0)
3f34 : 0d fe 5a ORA $5afe ; (screen_col + 1)
3f37 : d0 03 __ BNE $3f3c ; (cursormove.s5 + 0)
3f39 : 4c d3 40 JMP $40d3 ; (cursormove.s4 + 0)
.s5:
3f3c : ad fd 5a LDA $5afd ; (screen_col + 0)
3f3f : 18 __ __ CLC
3f40 : 69 ff __ ADC #$ff
3f42 : 8d fd 5a STA $5afd ; (screen_col + 0)
3f45 : b0 03 __ BCS $3f4a ; (cursormove.s1026 + 0)
.s1025:
3f47 : ce fe 5a DEC $5afe ; (screen_col + 1)
.s1026:
3f4a : ad fd 5a LDA $5afd ; (screen_col + 0)
3f4d : 8d 0f 5c STA $5c0f ; (canvas + 15)
3f50 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3f53 : 8d 10 5c STA $5c10 ; (canvas + 16)
.s56:
3f56 : ad fc ab LDA $abfc ; (sstack + 6)
3f59 : c9 01 __ CMP #$01
3f5b : d0 23 __ BNE $3f80 ; (cursormove.s59 + 0)
.s12:
3f5d : ad fe 5a LDA $5afe ; (screen_col + 1)
3f60 : d0 0a __ BNE $3f6c ; (cursormove.s16 + 0)
.s1016:
3f62 : ad fd 5a LDA $5afd ; (screen_col + 0)
3f65 : c9 4f __ CMP #$4f
3f67 : d0 03 __ BNE $3f6c ; (cursormove.s16 + 0)
3f69 : 4c 95 40 JMP $4095 ; (cursormove.s15 + 0)
.s16:
3f6c : ee fd 5a INC $5afd ; (screen_col + 0)
3f6f : d0 03 __ BNE $3f74 ; (cursormove.s1024 + 0)
.s1023:
3f71 : ee fe 5a INC $5afe ; (screen_col + 1)
.s1024:
3f74 : ad fd 5a LDA $5afd ; (screen_col + 0)
3f77 : 8d 0f 5c STA $5c0f ; (canvas + 15)
3f7a : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3f7d : 8d 10 5c STA $5c10 ; (canvas + 16)
.s59:
3f80 : ad fd ab LDA $abfd ; (sstack + 7)
3f83 : c9 01 __ CMP #$01
3f85 : d0 43 __ BNE $3fca ; (cursormove.s62 + 0)
.s23:
3f87 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3f8a : 0d f1 5b ORA $5bf1 ; (screen_row + 1)
3f8d : d0 03 __ BNE $3f92 ; (cursormove.s27 + 0)
3f8f : 4c 75 40 JMP $4075 ; (cursormove.s26 + 0)
.s27:
3f92 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3f95 : 18 __ __ CLC
3f96 : 69 ff __ ADC #$ff
3f98 : 8d f0 5b STA $5bf0 ; (screen_row + 0)
3f9b : b0 03 __ BCS $3fa0 ; (cursormove.s1022 + 0)
.s1021:
3f9d : ce f1 5b DEC $5bf1 ; (screen_row + 1)
.s1022:
3fa0 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3fa3 : 8d 10 5c STA $5c10 ; (canvas + 16)
3fa6 : ad fd 5a LDA $5afd ; (screen_col + 0)
3fa9 : 8d 0f 5c STA $5c0f ; (canvas + 15)
3fac : ad fe 5b LDA $5bfe ; (showbar + 0)
3faf : f0 19 __ BEQ $3fca ; (cursormove.s62 + 0)
.s37:
3fb1 : ad 1a 5c LDA $5c1a ; (vdc_state + 5)
3fb4 : 38 __ __ SEC
3fb5 : e9 02 __ SBC #$02
3fb7 : a8 __ __ TAY
3fb8 : ad 1b 5c LDA $5c1b ; (vdc_state + 6)
3fbb : e9 00 __ SBC #$00
3fbd : cd f1 5b CMP $5bf1 ; (screen_row + 1)
3fc0 : d0 08 __ BNE $3fca ; (cursormove.s62 + 0)
.s1010:
3fc2 : cc f0 5b CPY $5bf0 ; (screen_row + 0)
3fc5 : d0 03 __ BNE $3fca ; (cursormove.s62 + 0)
.s74:
3fc7 : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
.s62:
3fca : ad fe ab LDA $abfe ; (sstack + 8)
3fcd : c9 01 __ CMP #$01
3fcf : f0 03 __ BEQ $3fd4 ; (cursormove.s38 + 0)
3fd1 : 4c 6a 40 JMP $406a ; (cursormove.s1001 + 0)
.s38:
3fd4 : ad 1a 5c LDA $5c1a ; (vdc_state + 5)
3fd7 : 38 __ __ SEC
3fd8 : e9 01 __ SBC #$01
3fda : 85 53 __ STA T2 + 0 
3fdc : ad 1b 5c LDA $5c1b ; (vdc_state + 6)
3fdf : e9 00 __ SBC #$00
3fe1 : 85 54 __ STA T2 + 1 
3fe3 : ad 1a 5c LDA $5c1a ; (vdc_state + 5)
3fe6 : 38 __ __ SEC
3fe7 : e9 02 __ SBC #$02
3fe9 : 85 44 __ STA T1 + 0 
3feb : ad 1b 5c LDA $5c1b ; (vdc_state + 6)
3fee : e9 00 __ SBC #$00
3ff0 : 85 45 __ STA T1 + 1 
3ff2 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
3ff5 : 85 55 __ STA T3 + 0 
3ff7 : ad f1 5b LDA $5bf1 ; (screen_row + 1)
3ffa : 85 56 __ STA T3 + 1 
3ffc : c5 45 __ CMP T1 + 1 
3ffe : d0 09 __ BNE $4009 ; (cursormove.s43 + 0)
.s1006:
4000 : a5 55 __ LDA T3 + 0 
4002 : c5 44 __ CMP T1 + 0 
4004 : d0 03 __ BNE $4009 ; (cursormove.s43 + 0)
.s41:
4006 : 20 06 58 JSR $5806 ; (vdcwin_cpy_viewport@proxy + 0)
.s43:
4009 : a5 56 __ LDA T3 + 1 
400b : c5 54 __ CMP T2 + 1 
400d : d0 06 __ BNE $4015 ; (cursormove.s46 + 0)
.s1004:
400f : a5 55 __ LDA T3 + 0 
4011 : c5 53 __ CMP T2 + 0 
4013 : f0 1e __ BEQ $4033 ; (cursormove.s45 + 0)
.s46:
4015 : 18 __ __ CLC
4016 : a5 55 __ LDA T3 + 0 
4018 : 69 01 __ ADC #$01
401a : 8d f0 5b STA $5bf0 ; (screen_row + 0)
401d : a5 56 __ LDA T3 + 1 
401f : 69 00 __ ADC #$00
4021 : 8d f1 5b STA $5bf1 ; (screen_row + 1)
4024 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
4027 : 8d 10 5c STA $5c10 ; (canvas + 16)
402a : ad fd 5a LDA $5afd ; (screen_col + 0)
402d : 8d 0f 5c STA $5c0f ; (canvas + 15)
4030 : 4c 6a 40 JMP $406a ; (cursormove.s1001 + 0)
.s45:
4033 : 18 __ __ CLC
4034 : 6d 09 5c ADC $5c09 ; (canvas + 9)
4037 : aa __ __ TAX
4038 : ad 0a 5c LDA $5c0a ; (canvas + 10)
403b : 65 56 __ ADC T3 + 1 
403d : a8 __ __ TAY
403e : ad 05 5c LDA $5c05 ; (canvas + 5)
4041 : 38 __ __ SEC
4042 : e9 01 __ SBC #$01
4044 : 85 53 __ STA T2 + 0 
4046 : ad 06 5c LDA $5c06 ; (canvas + 6)
4049 : e9 00 __ SBC #$00
404b : 85 54 __ STA T2 + 1 
404d : c4 54 __ CPY T2 + 1 
404f : d0 02 __ BNE $4053 ; (cursormove.s1003 + 0)
.s1002:
4051 : e4 53 __ CPX T2 + 0 
.s1003:
4053 : b0 15 __ BCS $406a ; (cursormove.s1001 + 0)
.s48:
4055 : a5 55 __ LDA T3 + 0 
4057 : 8d 10 5c STA $5c10 ; (canvas + 16)
405a : a9 04 __ LDA #$04
405c : 85 18 __ STA P11 
405e : ad fd 5a LDA $5afd ; (screen_col + 0)
4061 : 8d 0f 5c STA $5c0f ; (canvas + 15)
4064 : 20 f6 40 JSR $40f6 ; (vdcwin_viewportscroll.s0 + 0)
4067 : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
.s1001:
406a : a2 03 __ LDX #$03
406c : bd cc ab LDA $abcc,x ; (buff + 36)
406f : 95 53 __ STA T2 + 0,x 
4071 : ca __ __ DEX
4072 : 10 f8 __ BPL $406c ; (cursormove.s1001 + 2)
4074 : 60 __ __ RTS
.s26:
4075 : ad 09 5c LDA $5c09 ; (canvas + 9)
4078 : 0d 0a 5c ORA $5c0a ; (canvas + 10)
407b : d0 03 __ BNE $4080 ; (cursormove.s29 + 0)
407d : 4c ca 3f JMP $3fca ; (cursormove.s62 + 0)
.s29:
4080 : a9 00 __ LDA #$00
4082 : 8d 10 5c STA $5c10 ; (canvas + 16)
4085 : a9 08 __ LDA #$08
4087 : 85 18 __ STA P11 
4089 : ad fd 5a LDA $5afd ; (screen_col + 0)
408c : 8d 0f 5c STA $5c0f ; (canvas + 15)
408f : 20 f6 40 JSR $40f6 ; (vdcwin_viewportscroll.s0 + 0)
4092 : 4c c7 3f JMP $3fc7 ; (cursormove.s74 + 0)
.s15:
4095 : ad 03 5c LDA $5c03 ; (canvas + 3)
4098 : 38 __ __ SEC
4099 : e9 01 __ SBC #$01
409b : 85 44 __ STA T1 + 0 
409d : ad 04 5c LDA $5c04 ; (canvas + 4)
40a0 : e9 00 __ SBC #$00
40a2 : 85 45 __ STA T1 + 1 
40a4 : ad 07 5c LDA $5c07 ; (canvas + 7)
40a7 : 18 __ __ CLC
40a8 : 69 4f __ ADC #$4f
40aa : a8 __ __ TAY
40ab : ad 08 5c LDA $5c08 ; (canvas + 8)
40ae : 69 00 __ ADC #$00
40b0 : c5 45 __ CMP T1 + 1 
40b2 : d0 02 __ BNE $40b6 ; (cursormove.s1015 + 0)
.s1014:
40b4 : c4 44 __ CPY T1 + 0 
.s1015:
40b6 : 90 03 __ BCC $40bb ; (cursormove.s18 + 0)
40b8 : 4c 80 3f JMP $3f80 ; (cursormove.s59 + 0)
.s18:
40bb : a9 4f __ LDA #$4f
40bd : 8d 0f 5c STA $5c0f ; (canvas + 15)
40c0 : a9 02 __ LDA #$02
40c2 : 85 18 __ STA P11 
40c4 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
40c7 : 8d 10 5c STA $5c10 ; (canvas + 16)
40ca : 20 f6 40 JSR $40f6 ; (vdcwin_viewportscroll.s0 + 0)
40cd : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
40d0 : 4c 80 3f JMP $3f80 ; (cursormove.s59 + 0)
.s4:
40d3 : ad 07 5c LDA $5c07 ; (canvas + 7)
40d6 : 0d 08 5c ORA $5c08 ; (canvas + 8)
40d9 : d0 03 __ BNE $40de ; (cursormove.s7 + 0)
40db : 4c 56 3f JMP $3f56 ; (cursormove.s56 + 0)
.s7:
40de : a9 00 __ LDA #$00
40e0 : 8d 0f 5c STA $5c0f ; (canvas + 15)
40e3 : a9 01 __ LDA #$01
40e5 : 85 18 __ STA P11 
40e7 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
40ea : 8d 10 5c STA $5c10 ; (canvas + 16)
40ed : 20 f6 40 JSR $40f6 ; (vdcwin_viewportscroll.s0 + 0)
40f0 : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
40f3 : 4c 56 3f JMP $3f56 ; (cursormove.s56 + 0)
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s0:
40f6 : a2 15 __ LDX #$15
.l1002:
40f8 : bd ff 5b LDA $5bff,x 
40fb : 9d cf ab STA $abcf,x ; (buff + 39)
40fe : ca __ __ DEX
40ff : d0 f7 __ BNE $40f8 ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
4101 : a5 18 __ LDA P11 ; (direction + 0)
4103 : 4a __ __ LSR
4104 : 90 33 __ BCC $4139 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
4106 : a9 0b __ LDA #$0b
4108 : 85 16 __ STA P9 
410a : a9 5c __ LDA #$5c
410c : 85 17 __ STA P10 
410e : 20 5f 43 JSR $435f ; (vdcwin_scroll_right.s1000 + 0)
4111 : a9 01 __ LDA #$01
4113 : 85 11 __ STA P4 
4115 : ad d7 ab LDA $abd7 ; (buff + 47)
4118 : 18 __ __ CLC
4119 : 69 ff __ ADC #$ff
411b : 8d d7 ab STA $abd7 ; (buff + 47)
411e : b0 03 __ BCS $4123 ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
4120 : ce d8 ab DEC $abd8 ; (buff + 48)
.s1005:
4123 : ad 07 5c LDA $5c07 ; (canvas + 7)
4126 : 18 __ __ CLC
4127 : 69 ff __ ADC #$ff
4129 : 8d 07 5c STA $5c07 ; (canvas + 7)
412c : b0 03 __ BCS $4131 ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
412e : ce 08 5c DEC $5c08 ; (canvas + 8)
.s1007:
4131 : ad 0e 5c LDA $5c0e ; (canvas + 14)
4134 : 85 12 __ STA P5 
4136 : 20 5b 58 JSR $585b ; (vdcwin_init@proxy + 0)
.s14:
4139 : a5 18 __ LDA P11 ; (direction + 0)
413b : 29 02 __ AND #$02
413d : f0 47 __ BEQ $4186 ; (vdcwin_viewportscroll.s15 + 0)
.s4:
413f : a9 0b __ LDA #$0b
4141 : 85 16 __ STA P9 
4143 : a9 5c __ LDA #$5c
4145 : 85 17 __ STA P10 
4147 : 20 26 45 JSR $4526 ; (vdcwin_scroll_left.s0 + 0)
414a : a9 01 __ LDA #$01
414c : 85 11 __ STA P4 
414e : ad d7 ab LDA $abd7 ; (buff + 47)
4151 : 18 __ __ CLC
4152 : 6d 0d 5c ADC $5c0d ; (canvas + 13)
4155 : 8d d7 ab STA $abd7 ; (buff + 47)
4158 : 90 03 __ BCC $415d ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
415a : ee d8 ab INC $abd8 ; (buff + 48)
.s1009:
415d : ee 07 5c INC $5c07 ; (canvas + 7)
4160 : d0 03 __ BNE $4165 ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
4162 : ee 08 5c INC $5c08 ; (canvas + 8)
.s1011:
4165 : a9 db __ LDA #$db
4167 : 85 0d __ STA P0 
4169 : a9 ab __ LDA #$ab
416b : 85 0e __ STA P1 
416d : ad 0b 5c LDA $5c0b ; (canvas + 11)
4170 : 18 __ __ CLC
4171 : 6d 0d 5c ADC $5c0d ; (canvas + 13)
4174 : 38 __ __ SEC
4175 : e9 01 __ SBC #$01
4177 : 85 0f __ STA P2 
4179 : ad 0c 5c LDA $5c0c ; (canvas + 12)
417c : 85 10 __ STA P3 
417e : ad 0e 5c LDA $5c0e ; (canvas + 14)
4181 : 85 12 __ STA P5 
4183 : 20 6e 2b JSR $2b6e ; (vdcwin_init.s0 + 0)
.s15:
4186 : a5 18 __ LDA P11 ; (direction + 0)
4188 : 29 08 __ AND #$08
418a : f0 33 __ BEQ $41bf ; (vdcwin_viewportscroll.s16 + 0)
.s7:
418c : a9 0b __ LDA #$0b
418e : 85 15 __ STA P8 
4190 : a9 5c __ LDA #$5c
4192 : 85 16 __ STA P9 
4194 : 20 18 46 JSR $4618 ; (vdcwin_scroll_down.s0 + 0)
4197 : a9 01 __ LDA #$01
4199 : 85 12 __ STA P5 
419b : ad d9 ab LDA $abd9 ; (buff + 49)
419e : 18 __ __ CLC
419f : 69 ff __ ADC #$ff
41a1 : 8d d9 ab STA $abd9 ; (buff + 49)
41a4 : b0 03 __ BCS $41a9 ; (vdcwin_viewportscroll.s1013 + 0)
.s1012:
41a6 : ce da ab DEC $abda ; (vp_fill + 10)
.s1013:
41a9 : ad 09 5c LDA $5c09 ; (canvas + 9)
41ac : 18 __ __ CLC
41ad : 69 ff __ ADC #$ff
41af : 8d 09 5c STA $5c09 ; (canvas + 9)
41b2 : b0 03 __ BCS $41b7 ; (vdcwin_viewportscroll.s1015 + 0)
.s1014:
41b4 : ce 0a 5c DEC $5c0a ; (canvas + 10)
.s1015:
41b7 : ad 0d 5c LDA $5c0d ; (canvas + 13)
41ba : 85 11 __ STA P4 
41bc : 20 5b 58 JSR $585b ; (vdcwin_init@proxy + 0)
.s16:
41bf : a5 18 __ LDA P11 ; (direction + 0)
41c1 : 29 04 __ AND #$04
41c3 : f0 47 __ BEQ $420c ; (vdcwin_viewportscroll.s12 + 0)
.s10:
41c5 : a9 0b __ LDA #$0b
41c7 : 85 15 __ STA P8 
41c9 : a9 5c __ LDA #$5c
41cb : 85 16 __ STA P9 
41cd : 20 bc 46 JSR $46bc ; (vdcwin_scroll_up.s0 + 0)
41d0 : a9 01 __ LDA #$01
41d2 : 85 12 __ STA P5 
41d4 : ad d9 ab LDA $abd9 ; (buff + 49)
41d7 : 18 __ __ CLC
41d8 : 6d 0e 5c ADC $5c0e ; (canvas + 14)
41db : 8d d9 ab STA $abd9 ; (buff + 49)
41de : 90 03 __ BCC $41e3 ; (vdcwin_viewportscroll.s1017 + 0)
.s1016:
41e0 : ee da ab INC $abda ; (vp_fill + 10)
.s1017:
41e3 : ee 09 5c INC $5c09 ; (canvas + 9)
41e6 : d0 03 __ BNE $41eb ; (vdcwin_viewportscroll.s1019 + 0)
.s1018:
41e8 : ee 0a 5c INC $5c0a ; (canvas + 10)
.s1019:
41eb : a9 db __ LDA #$db
41ed : 85 0d __ STA P0 
41ef : a9 ab __ LDA #$ab
41f1 : 85 0e __ STA P1 
41f3 : ad 0b 5c LDA $5c0b ; (canvas + 11)
41f6 : 85 0f __ STA P2 
41f8 : ad 0c 5c LDA $5c0c ; (canvas + 12)
41fb : 18 __ __ CLC
41fc : 6d 0e 5c ADC $5c0e ; (canvas + 14)
41ff : 38 __ __ SEC
4200 : e9 01 __ SBC #$01
4202 : 85 10 __ STA P3 
4204 : ad 0d 5c LDA $5c0d ; (canvas + 13)
4207 : 85 11 __ STA P4 
4209 : 20 6e 2b JSR $2b6e ; (vdcwin_init.s0 + 0)
.s12:
420c : a9 d0 __ LDA #$d0
420e : 85 16 __ STA P9 
4210 : a9 ab __ LDA #$ab
4212 : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
4214 : a5 16 __ LDA P9 ; (viewport + 0)
4216 : 85 44 __ STA T0 + 0 
4218 : a5 17 __ LDA P10 ; (viewport + 1)
421a : 85 45 __ STA T0 + 1 
421c : a0 09 __ LDY #$09
421e : b1 16 __ LDA (P9),y ; (viewport + 0)
4220 : 85 1b __ STA ACCU + 0 
4222 : c8 __ __ INY
4223 : b1 16 __ LDA (P9),y ; (viewport + 0)
4225 : 85 1c __ STA ACCU + 1 
4227 : a0 03 __ LDY #$03
4229 : b1 16 __ LDA (P9),y ; (viewport + 0)
422b : 85 03 __ STA WORK + 0 
422d : c8 __ __ INY
422e : b1 16 __ LDA (P9),y ; (viewport + 0)
4230 : 85 04 __ STA WORK + 1 
4232 : 20 46 56 JSR $5646 ; (mul16 + 0)
4235 : a0 01 __ LDY #$01
4237 : b1 16 __ LDA (P9),y ; (viewport + 0)
4239 : 18 __ __ CLC
423a : 65 05 __ ADC WORK + 2 
423c : aa __ __ TAX
423d : c8 __ __ INY
423e : b1 16 __ LDA (P9),y ; (viewport + 0)
4240 : 65 06 __ ADC WORK + 3 
4242 : 85 47 __ STA T1 + 1 
4244 : 8a __ __ TXA
4245 : 18 __ __ CLC
4246 : a0 07 __ LDY #$07
4248 : 71 16 __ ADC (P9),y ; (viewport + 0)
424a : 85 46 __ STA T1 + 0 
424c : a5 47 __ LDA T1 + 1 
424e : c8 __ __ INY
424f : 71 16 __ ADC (P9),y ; (viewport + 0)
4251 : 85 47 __ STA T1 + 1 
4253 : a9 00 __ LDA #$00
4255 : 85 4a __ STA T3 + 0 
4257 : a0 11 __ LDY #$11
4259 : b1 16 __ LDA (P9),y ; (viewport + 0)
425b : aa __ __ TAX
425c : c8 __ __ INY
425d : b1 16 __ LDA (P9),y ; (viewport + 0)
425f : 4c 9b 42 JMP $429b ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
4262 : 86 0f __ STX P2 
4264 : a5 46 __ LDA T1 + 0 
4266 : 85 12 __ STA P5 
4268 : a5 47 __ LDA T1 + 1 
426a : 85 13 __ STA P6 
426c : a0 00 __ LDY #$00
426e : 84 15 __ STY P8 
4270 : b1 44 __ LDA (T0 + 0),y 
4272 : 85 11 __ STA P4 
4274 : a0 0d __ LDY #$0d
4276 : b1 44 __ LDA (T0 + 0),y 
4278 : 85 14 __ STA P7 
427a : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
427d : a5 46 __ LDA T1 + 0 
427f : 18 __ __ CLC
4280 : a0 03 __ LDY #$03
4282 : 71 44 __ ADC (T0 + 0),y 
4284 : 85 46 __ STA T1 + 0 
4286 : a5 47 __ LDA T1 + 1 
4288 : c8 __ __ INY
4289 : 71 44 __ ADC (T0 + 0),y 
428b : 85 47 __ STA T1 + 1 
428d : ad 18 5c LDA $5c18 ; (vdc_state + 3)
4290 : 18 __ __ CLC
4291 : 65 0f __ ADC P2 
4293 : aa __ __ TAX
4294 : ad 19 5c LDA $5c19 ; (vdc_state + 4)
4297 : 65 10 __ ADC P3 
4299 : e6 4a __ INC T3 + 0 
.l1:
429b : 85 10 __ STA P3 
429d : a5 4a __ LDA T3 + 0 
429f : a0 0e __ LDY #$0e
42a1 : d1 44 __ CMP (T0 + 0),y 
42a3 : 90 bd __ BCC $4262 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
42a5 : a0 03 __ LDY #$03
42a7 : b1 44 __ LDA (T0 + 0),y 
42a9 : 85 46 __ STA T1 + 0 
42ab : 85 03 __ STA WORK + 0 
42ad : c8 __ __ INY
42ae : b1 44 __ LDA (T0 + 0),y 
42b0 : 85 47 __ STA T1 + 1 
42b2 : 85 04 __ STA WORK + 1 
42b4 : a0 09 __ LDY #$09
42b6 : b1 44 __ LDA (T0 + 0),y 
42b8 : 85 1b __ STA ACCU + 0 
42ba : c8 __ __ INY
42bb : b1 44 __ LDA (T0 + 0),y 
42bd : 85 1c __ STA ACCU + 1 
42bf : 20 46 56 JSR $5646 ; (mul16 + 0)
42c2 : a0 01 __ LDY #$01
42c4 : b1 44 __ LDA (T0 + 0),y 
42c6 : 18 __ __ CLC
42c7 : 65 05 __ ADC WORK + 2 
42c9 : aa __ __ TAX
42ca : c8 __ __ INY
42cb : b1 44 __ LDA (T0 + 0),y 
42cd : 65 06 __ ADC WORK + 3 
42cf : 85 49 __ STA T2 + 1 
42d1 : 8a __ __ TXA
42d2 : 18 __ __ CLC
42d3 : a0 07 __ LDY #$07
42d5 : 71 44 __ ADC (T0 + 0),y 
42d7 : 85 48 __ STA T2 + 0 
42d9 : a5 49 __ LDA T2 + 1 
42db : c8 __ __ INY
42dc : 71 44 __ ADC (T0 + 0),y 
42de : 85 49 __ STA T2 + 1 
42e0 : a0 05 __ LDY #$05
42e2 : b1 44 __ LDA (T0 + 0),y 
42e4 : 85 1b __ STA ACCU + 0 
42e6 : c8 __ __ INY
42e7 : b1 44 __ LDA (T0 + 0),y 
42e9 : 85 1c __ STA ACCU + 1 
42eb : a5 46 __ LDA T1 + 0 
42ed : 85 03 __ STA WORK + 0 
42ef : a5 47 __ LDA T1 + 1 
42f1 : 85 04 __ STA WORK + 1 
42f3 : 20 46 56 JSR $5646 ; (mul16 + 0)
42f6 : 18 __ __ CLC
42f7 : a5 48 __ LDA T2 + 0 
42f9 : 65 05 __ ADC WORK + 2 
42fb : aa __ __ TAX
42fc : a5 49 __ LDA T2 + 1 
42fe : 65 06 __ ADC WORK + 3 
4300 : a8 __ __ TAY
4301 : 8a __ __ TXA
4302 : 18 __ __ CLC
4303 : 69 30 __ ADC #$30
4305 : 85 46 __ STA T1 + 0 
4307 : 90 01 __ BCC $430a ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
4309 : c8 __ __ INY
.s1007:
430a : 84 47 __ STY T1 + 1 
430c : a9 00 __ LDA #$00
430e : 85 4a __ STA T3 + 0 
4310 : a0 13 __ LDY #$13
4312 : b1 44 __ LDA (T0 + 0),y 
4314 : aa __ __ TAX
4315 : c8 __ __ INY
4316 : b1 44 __ LDA (T0 + 0),y 
4318 : 4c 54 43 JMP $4354 ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
431b : 86 0f __ STX P2 
431d : a5 46 __ LDA T1 + 0 
431f : 85 12 __ STA P5 
4321 : a5 47 __ LDA T1 + 1 
4323 : 85 13 __ STA P6 
4325 : a0 00 __ LDY #$00
4327 : 84 15 __ STY P8 
4329 : b1 16 __ LDA (P9),y ; (viewport + 0)
432b : 85 11 __ STA P4 
432d : a0 0d __ LDY #$0d
432f : b1 16 __ LDA (P9),y ; (viewport + 0)
4331 : 85 14 __ STA P7 
4333 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4336 : a5 46 __ LDA T1 + 0 
4338 : 18 __ __ CLC
4339 : a0 03 __ LDY #$03
433b : 71 16 __ ADC (P9),y ; (viewport + 0)
433d : 85 46 __ STA T1 + 0 
433f : a5 47 __ LDA T1 + 1 
4341 : c8 __ __ INY
4342 : 71 16 __ ADC (P9),y ; (viewport + 0)
4344 : 85 47 __ STA T1 + 1 
4346 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
4349 : 18 __ __ CLC
434a : 65 0f __ ADC P2 
434c : aa __ __ TAX
434d : ad 19 5c LDA $5c19 ; (vdc_state + 4)
4350 : 65 10 __ ADC P3 
4352 : e6 4a __ INC T3 + 0 
.l5:
4354 : 85 10 __ STA P3 
4356 : a5 4a __ LDA T3 + 0 
4358 : a0 0e __ LDY #$0e
435a : d1 16 __ CMP (P9),y ; (viewport + 0)
435c : 90 bd __ BCC $431b ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
435e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
435f : a5 53 __ LDA T8 + 0 
4361 : 8d f0 ab STA $abf0 ; (buffer + 10)
4364 : a5 54 __ LDA T8 + 1 
4366 : 8d f1 ab STA $abf1 ; (buffer + 11)
.s0:
4369 : a0 02 __ LDY #$02
436b : b1 16 __ LDA (P9),y ; (win + 0)
436d : 38 __ __ SEC
436e : e9 01 __ SBC #$01
4370 : 85 47 __ STA T2 + 0 
4372 : a9 00 __ LDA #$00
4374 : 85 46 __ STA T1 + 0 
4376 : a0 06 __ LDY #$06
4378 : b1 16 __ LDA (P9),y ; (win + 0)
437a : 85 48 __ STA T3 + 0 
437c : c8 __ __ INY
437d : b1 16 __ LDA (P9),y ; (win + 0)
437f : 85 49 __ STA T3 + 1 
4381 : c8 __ __ INY
4382 : b1 16 __ LDA (P9),y ; (win + 0)
4384 : 85 4a __ STA T4 + 0 
4386 : c8 __ __ INY
4387 : b1 16 __ LDA (P9),y ; (win + 0)
.l1:
4389 : 85 4b __ STA T4 + 1 
438b : a5 46 __ LDA T1 + 0 
438d : a0 03 __ LDY #$03
438f : d1 16 __ CMP (P9),y ; (win + 0)
4391 : 90 0b __ BCC $439e ; (vdcwin_scroll_right.s2 + 0)
.s1001:
4393 : ad f0 ab LDA $abf0 ; (buffer + 10)
4396 : 85 53 __ STA T8 + 0 
4398 : ad f1 ab LDA $abf1 ; (buffer + 11)
439b : 85 54 __ STA T8 + 1 
439d : 60 __ __ RTS
.s2:
439e : a5 48 __ LDA T3 + 0 
43a0 : 69 01 __ ADC #$01
43a2 : 85 4c __ STA T6 + 0 
43a4 : a5 49 __ LDA T3 + 1 
43a6 : 69 00 __ ADC #$00
43a8 : 85 4d __ STA T6 + 1 
43aa : 18 __ __ CLC
43ab : a5 4a __ LDA T4 + 0 
43ad : 69 01 __ ADC #$01
43af : 85 4e __ STA T7 + 0 
43b1 : a5 4b __ LDA T4 + 1 
43b3 : 69 00 __ ADC #$00
43b5 : 85 4f __ STA T7 + 1 
43b7 : ad 16 5c LDA $5c16 ; (vdc_state + 1)
43ba : d0 0c __ BNE $43c8 ; (vdcwin_scroll_right.s7 + 0)
.s9:
43bc : cc 22 5c CPY $5c22 ; (vdc_state + 13)
43bf : d0 05 __ BNE $43c6 ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
43c1 : a9 ff __ LDA #$ff
43c3 : cd 21 5c CMP $5c21 ; (vdc_state + 12)
.s1003:
43c6 : 90 45 __ BCC $440d ; (vdcwin_scroll_right.s6 + 0)
.s7:
43c8 : a5 48 __ LDA T3 + 0 
43ca : 85 11 __ STA P4 
43cc : a5 49 __ LDA T3 + 1 
43ce : 85 12 __ STA P5 
43d0 : ad 21 5c LDA $5c21 ; (vdc_state + 12)
43d3 : 85 53 __ STA T8 + 0 
43d5 : 85 0f __ STA P2 
43d7 : ad 22 5c LDA $5c22 ; (vdc_state + 13)
43da : 85 54 __ STA T8 + 1 
43dc : 85 10 __ STA P3 
43de : 20 5a 44 JSR $445a ; (vdc_block_copy@proxy + 0)
43e1 : a5 4c __ LDA T6 + 0 
43e3 : 85 0f __ STA P2 
43e5 : a5 4d __ LDA T6 + 1 
43e7 : 85 10 __ STA P3 
43e9 : 20 1c 58 JSR $581c ; (vdc_block_copy@proxy + 0)
43ec : a5 11 __ LDA P4 
43ee : 85 0f __ STA P2 
43f0 : a5 54 __ LDA T8 + 1 
43f2 : 85 10 __ STA P3 
43f4 : a5 4a __ LDA T4 + 0 
43f6 : 85 11 __ STA P4 
43f8 : a5 4b __ LDA T4 + 1 
43fa : 85 12 __ STA P5 
43fc : 20 62 44 JSR $4462 ; (vdc_block_copy.s0 + 0)
43ff : a5 4e __ LDA T7 + 0 
4401 : 85 0f __ STA P2 
4403 : a5 4f __ LDA T7 + 1 
4405 : 85 10 __ STA P3 
4407 : 20 1c 58 JSR $581c ; (vdc_block_copy@proxy + 0)
440a : 4c 39 44 JMP $4439 ; (vdcwin_scroll_right.s5 + 0)
.s6:
440d : a5 48 __ LDA T3 + 0 
440f : 85 10 __ STA P3 
4411 : a5 49 __ LDA T3 + 1 
4413 : 85 11 __ STA P4 
4415 : 20 ef 13 JSR $13ef ; (bnk_cpyfromvdc@proxy + 0)
4418 : a5 4c __ LDA T6 + 0 
441a : 85 0f __ STA P2 
441c : a5 4d __ LDA T6 + 1 
441e : 85 10 __ STA P3 
4420 : 20 94 13 JSR $1394 ; (bnk_cpytovdc@proxy + 0)
4423 : a5 4a __ LDA T4 + 0 
4425 : 85 10 __ STA P3 
4427 : a5 4b __ LDA T4 + 1 
4429 : 85 11 __ STA P4 
442b : 20 56 15 JSR $1556 ; (bnk_cpyfromvdc@proxy + 0)
442e : a5 4e __ LDA T7 + 0 
4430 : 85 0f __ STA P2 
4432 : a5 4f __ LDA T7 + 1 
4434 : 85 10 __ STA P3 
4436 : 20 43 15 JSR $1543 ; (bnk_cpytovdc@proxy + 0)
.s5:
4439 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
443c : 18 __ __ CLC
443d : 65 48 __ ADC T3 + 0 
443f : 85 48 __ STA T3 + 0 
4441 : ad 19 5c LDA $5c19 ; (vdc_state + 4)
4444 : 65 49 __ ADC T3 + 1 
4446 : 85 49 __ STA T3 + 1 
4448 : 18 __ __ CLC
4449 : a5 4a __ LDA T4 + 0 
444b : 6d 18 5c ADC $5c18 ; (vdc_state + 3)
444e : 85 4a __ STA T4 + 0 
4450 : a5 4b __ LDA T4 + 1 
4452 : 6d 19 5c ADC $5c19 ; (vdc_state + 4)
4455 : e6 46 __ INC T1 + 0 
4457 : 4c 89 43 JMP $4389 ; (vdcwin_scroll_right.l1 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
445a : a5 47 __ LDA $47 
445c : 85 13 __ STA P6 
445e : a9 00 __ LDA #$00
4460 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
4462 : a5 14 __ LDA P7 ; (length + 1)
4464 : d0 52 __ BNE $44b8 ; (vdc_block_copy.s73 + 0)
.s4:
4466 : 20 55 2e JSR $2e55 ; (vdc_mem_addr@proxy + 0)
4469 : a9 18 __ LDA #$18
446b : 8d 00 d6 STA $d600 
.l332:
446e : 2c 00 d6 BIT $d600 
4471 : 10 fb __ BPL $446e ; (vdc_block_copy.l332 + 0)
.s40:
4473 : ad 01 d6 LDA $d601 
4476 : 09 80 __ ORA #$80
4478 : a2 18 __ LDX #$18
447a : 8e 00 d6 STX $d600 
.l334:
447d : 2c 00 d6 BIT $d600 
4480 : 10 fb __ BPL $447d ; (vdc_block_copy.l334 + 0)
.s46:
4482 : 8d 01 d6 STA $d601 
4485 : a9 20 __ LDA #$20
4487 : 8d 00 d6 STA $d600 
.l336:
448a : 2c 00 d6 BIT $d600 
448d : 10 fb __ BPL $448a ; (vdc_block_copy.l336 + 0)
.s51:
448f : a5 12 __ LDA P5 ; (src + 1)
4491 : 8d 01 d6 STA $d601 
4494 : a9 21 __ LDA #$21
4496 : 8d 00 d6 STA $d600 
.l338:
4499 : 2c 00 d6 BIT $d600 
449c : 10 fb __ BPL $4499 ; (vdc_block_copy.l338 + 0)
.s56:
449e : a5 11 __ LDA P4 ; (src + 0)
44a0 : 8d 01 d6 STA $d601 
44a3 : a9 1f __ LDA #$1f
44a5 : 8d 00 d6 STA $d600 
44a8 : a9 1e __ LDA #$1e
44aa : 8d 00 d6 STA $d600 
.l340:
44ad : 2c 00 d6 BIT $d600 
44b0 : 10 fb __ BPL $44ad ; (vdc_block_copy.l340 + 0)
.s62:
44b2 : a5 13 __ LDA P6 ; (length + 0)
44b4 : 8d 01 d6 STA $d601 
.s1001:
44b7 : 60 __ __ RTS
.s73:
44b8 : 85 45 __ STA T2 + 0 
44ba : a5 10 __ LDA P3 ; (dest + 1)
44bc : 85 44 __ STA T0 + 1 
44be : a5 0f __ LDA P2 ; (dest + 0)
44c0 : 85 0d __ STA P0 
.l2:
44c2 : 20 54 58 JSR $5854 ; (vdc_mem_addr@proxy + 0)
44c5 : a9 18 __ LDA #$18
44c7 : 8d 00 d6 STA $d600 
.l321:
44ca : 2c 00 d6 BIT $d600 
44cd : 10 fb __ BPL $44ca ; (vdc_block_copy.l321 + 0)
.s11:
44cf : ad 01 d6 LDA $d601 
44d2 : 09 80 __ ORA #$80
44d4 : a2 18 __ LDX #$18
44d6 : 8e 00 d6 STX $d600 
.l323:
44d9 : 2c 00 d6 BIT $d600 
44dc : 10 fb __ BPL $44d9 ; (vdc_block_copy.l323 + 0)
.s17:
44de : 8d 01 d6 STA $d601 
44e1 : a9 20 __ LDA #$20
44e3 : 8d 00 d6 STA $d600 
.l325:
44e6 : 2c 00 d6 BIT $d600 
44e9 : 10 fb __ BPL $44e6 ; (vdc_block_copy.l325 + 0)
.s22:
44eb : a5 12 __ LDA P5 ; (src + 1)
44ed : 8d 01 d6 STA $d601 
44f0 : a9 21 __ LDA #$21
44f2 : 8d 00 d6 STA $d600 
.l327:
44f5 : 2c 00 d6 BIT $d600 
44f8 : 10 fb __ BPL $44f5 ; (vdc_block_copy.l327 + 0)
.s27:
44fa : a5 11 __ LDA P4 ; (src + 0)
44fc : 8d 01 d6 STA $d601 
44ff : a9 1f __ LDA #$1f
4501 : 8d 00 d6 STA $d600 
4504 : a9 1e __ LDA #$1e
4506 : 8d 00 d6 STA $d600 
.l329:
4509 : 2c 00 d6 BIT $d600 
450c : 10 fb __ BPL $4509 ; (vdc_block_copy.l329 + 0)
.s33:
450e : a9 ff __ LDA #$ff
4510 : 8d 01 d6 STA $d601 
4513 : e6 12 __ INC P5 ; (src + 1)
4515 : e6 44 __ INC T0 + 1 
4517 : c6 45 __ DEC T2 + 0 
4519 : d0 a7 __ BNE $44c2 ; (vdc_block_copy.l2 + 0)
.s145:
451b : a5 0d __ LDA P0 
451d : 85 0f __ STA P2 ; (dest + 0)
451f : a5 44 __ LDA T0 + 1 
4521 : 85 10 __ STA P3 ; (dest + 1)
4523 : 4c 66 44 JMP $4466 ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
4526 : a0 02 __ LDY #$02
4528 : b1 16 __ LDA (P9),y ; (win + 0)
452a : 38 __ __ SEC
452b : e9 01 __ SBC #$01
452d : 85 47 __ STA T2 + 0 
452f : a0 06 __ LDY #$06
4531 : b1 16 __ LDA (P9),y ; (win + 0)
4533 : 85 48 __ STA T3 + 0 
4535 : c8 __ __ INY
4536 : b1 16 __ LDA (P9),y ; (win + 0)
4538 : 85 49 __ STA T3 + 1 
453a : c8 __ __ INY
453b : b1 16 __ LDA (P9),y ; (win + 0)
453d : 85 4a __ STA T4 + 0 
453f : c8 __ __ INY
4540 : b1 16 __ LDA (P9),y ; (win + 0)
4542 : 85 4b __ STA T4 + 1 
.l62:
4544 : ad 00 d6 LDA $d600 
4547 : 29 20 __ AND #$20
4549 : f0 f9 __ BEQ $4544 ; (vdcwin_scroll_left.l62 + 0)
.s1:
454b : a9 00 __ LDA #$00
454d : 85 46 __ STA T1 + 0 
.l4:
454f : a0 03 __ LDY #$03
4551 : d1 16 __ CMP (P9),y ; (win + 0)
4553 : 90 08 __ BCC $455d ; (vdcwin_scroll_left.s5 + 0)
.l14:
4555 : ad 00 d6 LDA $d600 
4558 : 29 20 __ AND #$20
455a : d0 f9 __ BNE $4555 ; (vdcwin_scroll_left.l14 + 0)
.s1001:
455c : 60 __ __ RTS
.s5:
455d : a5 48 __ LDA T3 + 0 
455f : 69 01 __ ADC #$01
4561 : aa __ __ TAX
4562 : a5 49 __ LDA T3 + 1 
4564 : 69 00 __ ADC #$00
4566 : 85 4d __ STA T5 + 1 
4568 : 18 __ __ CLC
4569 : a5 4a __ LDA T4 + 0 
456b : 69 01 __ ADC #$01
456d : 85 4e __ STA T7 + 0 
456f : a5 4b __ LDA T4 + 1 
4571 : 69 00 __ ADC #$00
4573 : 85 4f __ STA T7 + 1 
4575 : ad 16 5c LDA $5c16 ; (vdc_state + 1)
4578 : d0 0c __ BNE $4586 ; (vdcwin_scroll_left.s10 + 0)
.s12:
457a : cc 22 5c CPY $5c22 ; (vdc_state + 13)
457d : d0 05 __ BNE $4584 ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
457f : a9 ff __ LDA #$ff
4581 : cd 21 5c CMP $5c21 ; (vdc_state + 12)
.s1003:
4584 : 90 43 __ BCC $45c9 ; (vdcwin_scroll_left.s9 + 0)
.s10:
4586 : 86 11 __ STX P4 
4588 : a5 4d __ LDA T5 + 1 
458a : 85 12 __ STA P5 
458c : ad 21 5c LDA $5c21 ; (vdc_state + 12)
458f : 85 4c __ STA T5 + 0 
4591 : 85 0f __ STA P2 
4593 : ad 22 5c LDA $5c22 ; (vdc_state + 13)
4596 : 85 4d __ STA T5 + 1 
4598 : 85 10 __ STA P3 
459a : 20 5a 44 JSR $445a ; (vdc_block_copy@proxy + 0)
459d : a5 48 __ LDA T3 + 0 
459f : 85 0f __ STA P2 
45a1 : a5 49 __ LDA T3 + 1 
45a3 : 85 10 __ STA P3 
45a5 : 20 11 58 JSR $5811 ; (vdc_block_copy@proxy + 0)
45a8 : a5 11 __ LDA P4 
45aa : 85 0f __ STA P2 
45ac : a5 4d __ LDA T5 + 1 
45ae : 85 10 __ STA P3 
45b0 : a5 4e __ LDA T7 + 0 
45b2 : 85 11 __ STA P4 
45b4 : a5 4f __ LDA T7 + 1 
45b6 : 85 12 __ STA P5 
45b8 : 20 62 44 JSR $4462 ; (vdc_block_copy.s0 + 0)
45bb : a5 4a __ LDA T4 + 0 
45bd : 85 0f __ STA P2 
45bf : a5 4b __ LDA T4 + 1 
45c1 : 85 10 __ STA P3 
45c3 : 20 11 58 JSR $5811 ; (vdc_block_copy@proxy + 0)
45c6 : 4c f3 45 JMP $45f3 ; (vdcwin_scroll_left.s8 + 0)
.s9:
45c9 : 86 10 __ STX P3 
45cb : a5 4d __ LDA T5 + 1 
45cd : 85 11 __ STA P4 
45cf : 20 ef 13 JSR $13ef ; (bnk_cpyfromvdc@proxy + 0)
45d2 : a5 48 __ LDA T3 + 0 
45d4 : 85 0f __ STA P2 
45d6 : a5 49 __ LDA T3 + 1 
45d8 : 85 10 __ STA P3 
45da : 20 94 13 JSR $1394 ; (bnk_cpytovdc@proxy + 0)
45dd : a5 4e __ LDA T7 + 0 
45df : 85 10 __ STA P3 
45e1 : a5 4f __ LDA T7 + 1 
45e3 : 85 11 __ STA P4 
45e5 : 20 56 15 JSR $1556 ; (bnk_cpyfromvdc@proxy + 0)
45e8 : a5 4a __ LDA T4 + 0 
45ea : 85 0f __ STA P2 
45ec : a5 4b __ LDA T4 + 1 
45ee : 85 10 __ STA P3 
45f0 : 20 43 15 JSR $1543 ; (bnk_cpytovdc@proxy + 0)
.s8:
45f3 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
45f6 : 18 __ __ CLC
45f7 : 65 48 __ ADC T3 + 0 
45f9 : 85 48 __ STA T3 + 0 
45fb : ad 19 5c LDA $5c19 ; (vdc_state + 4)
45fe : 65 49 __ ADC T3 + 1 
4600 : 85 49 __ STA T3 + 1 
4602 : 18 __ __ CLC
4603 : a5 4a __ LDA T4 + 0 
4605 : 6d 18 5c ADC $5c18 ; (vdc_state + 3)
4608 : 85 4a __ STA T4 + 0 
460a : a5 4b __ LDA T4 + 1 
460c : 6d 19 5c ADC $5c19 ; (vdc_state + 4)
460f : 85 4b __ STA T4 + 1 
4611 : e6 46 __ INC T1 + 0 
4613 : a5 46 __ LDA T1 + 0 
4615 : 4c 4f 45 JMP $454f ; (vdcwin_scroll_left.l4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
4618 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
461b : 85 49 __ STA T3 + 0 
461d : 85 1b __ STA ACCU + 0 
461f : ad 19 5c LDA $5c19 ; (vdc_state + 4)
4622 : 85 4a __ STA T3 + 1 
4624 : 85 1c __ STA ACCU + 1 
4626 : a0 03 __ LDY #$03
4628 : b1 15 __ LDA (P8),y ; (win + 0)
462a : 20 26 56 JSR $5626 ; (mul16by8 + 0)
462d : a0 06 __ LDY #$06
462f : b1 15 __ LDA (P8),y ; (win + 0)
4631 : 18 __ __ CLC
4632 : 65 05 __ ADC WORK + 2 
4634 : 85 4b __ STA T4 + 0 
4636 : c8 __ __ INY
4637 : b1 15 __ LDA (P8),y ; (win + 0)
4639 : 65 06 __ ADC WORK + 3 
463b : 85 4c __ STA T4 + 1 
463d : c8 __ __ INY
463e : b1 15 __ LDA (P8),y ; (win + 0)
4640 : 18 __ __ CLC
4641 : 65 05 __ ADC WORK + 2 
4643 : 85 47 __ STA T2 + 0 
4645 : c8 __ __ INY
4646 : b1 15 __ LDA (P8),y ; (win + 0)
4648 : 65 06 __ ADC WORK + 3 
464a : 85 48 __ STA T2 + 1 
464c : a0 02 __ LDY #$02
464e : b1 15 __ LDA (P8),y ; (win + 0)
4650 : 85 4f __ STA T6 + 0 
4652 : a9 00 __ LDA #$00
4654 : 85 46 __ STA T1 + 0 
4656 : 85 14 __ STA P7 
4658 : f0 52 __ BEQ $46ac ; (vdcwin_scroll_down.l1 + 0)
.s2:
465a : ad 18 5c LDA $5c18 ; (vdc_state + 3)
465d : 85 4d __ STA T5 + 0 
465f : ad 19 5c LDA $5c19 ; (vdc_state + 4)
4662 : 85 4e __ STA T5 + 1 
4664 : 38 __ __ SEC
4665 : a5 4b __ LDA T4 + 0 
4667 : e5 4d __ SBC T5 + 0 
4669 : 85 0f __ STA P2 
466b : 85 4b __ STA T4 + 0 
466d : a5 4c __ LDA T4 + 1 
466f : e5 4e __ SBC T5 + 1 
4671 : 85 10 __ STA P3 
4673 : 85 4c __ STA T4 + 1 
4675 : 38 __ __ SEC
4676 : a5 0f __ LDA P2 
4678 : e5 49 __ SBC T3 + 0 
467a : 85 11 __ STA P4 
467c : a5 10 __ LDA P3 
467e : e5 4a __ SBC T3 + 1 
4680 : 85 12 __ STA P5 
4682 : a5 4f __ LDA T6 + 0 
4684 : 85 13 __ STA P6 
4686 : 20 62 44 JSR $4462 ; (vdc_block_copy.s0 + 0)
4689 : 38 __ __ SEC
468a : a5 47 __ LDA T2 + 0 
468c : e5 4d __ SBC T5 + 0 
468e : 85 47 __ STA T2 + 0 
4690 : 85 0f __ STA P2 
4692 : a5 48 __ LDA T2 + 1 
4694 : e5 4e __ SBC T5 + 1 
4696 : 85 48 __ STA T2 + 1 
4698 : 85 10 __ STA P3 
469a : 38 __ __ SEC
469b : a5 0f __ LDA P2 
469d : e5 49 __ SBC T3 + 0 
469f : 85 11 __ STA P4 
46a1 : a5 10 __ LDA P3 
46a3 : e5 4a __ SBC T3 + 1 
46a5 : 85 12 __ STA P5 
46a7 : 20 62 44 JSR $4462 ; (vdc_block_copy.s0 + 0)
46aa : e6 46 __ INC T1 + 0 
.l1:
46ac : a0 03 __ LDY #$03
46ae : b1 15 __ LDA (P8),y ; (win + 0)
46b0 : 38 __ __ SEC
46b1 : e9 01 __ SBC #$01
46b3 : 90 a5 __ BCC $465a ; (vdcwin_scroll_down.s2 + 0)
.s1002:
46b5 : c5 46 __ CMP T1 + 0 
46b7 : 90 02 __ BCC $46bb ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
46b9 : d0 9f __ BNE $465a ; (vdcwin_scroll_down.s2 + 0)
.s1001:
46bb : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
46bc : a0 02 __ LDY #$02
46be : b1 15 __ LDA (P8),y ; (win + 0)
46c0 : 85 47 __ STA T2 + 0 
46c2 : a0 06 __ LDY #$06
46c4 : b1 15 __ LDA (P8),y ; (win + 0)
46c6 : 85 48 __ STA T3 + 0 
46c8 : c8 __ __ INY
46c9 : b1 15 __ LDA (P8),y ; (win + 0)
46cb : 85 49 __ STA T3 + 1 
46cd : c8 __ __ INY
46ce : b1 15 __ LDA (P8),y ; (win + 0)
46d0 : 85 4a __ STA T4 + 0 
46d2 : c8 __ __ INY
46d3 : b1 15 __ LDA (P8),y ; (win + 0)
46d5 : 85 4b __ STA T4 + 1 
46d7 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
46da : 85 4c __ STA T5 + 0 
46dc : ad 19 5c LDA $5c19 ; (vdc_state + 4)
46df : 85 4d __ STA T5 + 1 
46e1 : a9 00 __ LDA #$00
46e3 : 85 46 __ STA T0 + 0 
46e5 : 85 14 __ STA P7 
46e7 : f0 4c __ BEQ $4735 ; (vdcwin_scroll_up.l1 + 0)
.s2:
46e9 : a5 48 __ LDA T3 + 0 
46eb : 85 0f __ STA P2 
46ed : 18 __ __ CLC
46ee : 65 4c __ ADC T5 + 0 
46f0 : 85 11 __ STA P4 
46f2 : a5 49 __ LDA T3 + 1 
46f4 : 85 10 __ STA P3 
46f6 : 65 4d __ ADC T5 + 1 
46f8 : 85 12 __ STA P5 
46fa : a5 47 __ LDA T2 + 0 
46fc : 85 13 __ STA P6 
46fe : 20 62 44 JSR $4462 ; (vdc_block_copy.s0 + 0)
4701 : a5 4a __ LDA T4 + 0 
4703 : 85 0f __ STA P2 
4705 : 18 __ __ CLC
4706 : 65 4c __ ADC T5 + 0 
4708 : 85 11 __ STA P4 
470a : a5 4b __ LDA T4 + 1 
470c : 85 10 __ STA P3 
470e : 65 4d __ ADC T5 + 1 
4710 : 85 12 __ STA P5 
4712 : 20 62 44 JSR $4462 ; (vdc_block_copy.s0 + 0)
4715 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
4718 : 18 __ __ CLC
4719 : 65 48 __ ADC T3 + 0 
471b : 85 48 __ STA T3 + 0 
471d : ad 19 5c LDA $5c19 ; (vdc_state + 4)
4720 : 65 49 __ ADC T3 + 1 
4722 : 85 49 __ STA T3 + 1 
4724 : 18 __ __ CLC
4725 : a5 4a __ LDA T4 + 0 
4727 : 6d 18 5c ADC $5c18 ; (vdc_state + 3)
472a : 85 4a __ STA T4 + 0 
472c : a5 4b __ LDA T4 + 1 
472e : 6d 19 5c ADC $5c19 ; (vdc_state + 4)
4731 : 85 4b __ STA T4 + 1 
4733 : e6 46 __ INC T0 + 0 
.l1:
4735 : a0 03 __ LDY #$03
4737 : b1 15 __ LDA (P8),y ; (win + 0)
4739 : 38 __ __ SEC
473a : e9 01 __ SBC #$01
473c : 90 ab __ BCC $46e9 ; (vdcwin_scroll_up.s2 + 0)
.s1002:
473e : c5 46 __ CMP T0 + 0 
4740 : 90 02 __ BCC $4744 ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
4742 : d0 a5 __ BNE $46e9 ; (vdcwin_scroll_up.s2 + 0)
.s1001:
4744 : 60 __ __ RTS
--------------------------------------------------------------------
undo_performundo: ; undo_performundo()->void
.s1000:
4745 : a2 15 __ LDX #$15
4747 : b5 53 __ LDA T0 + 0,x 
4749 : 9d b8 ab STA $abb8,x ; (buff + 16)
474c : ca __ __ DEX
474d : 10 f8 __ BPL $4747 ; (undo_performundo.s1000 + 2)
.s0:
474f : ad fc 5b LDA $5bfc ; (undo_undopossible + 0)
4752 : d0 0b __ BNE $475f ; (undo_performundo.s1 + 0)
.s1001:
4754 : a2 15 __ LDX #$15
4756 : bd b8 ab LDA $abb8,x ; (buff + 16)
4759 : 95 53 __ STA T0 + 0,x 
475b : ca __ __ DEX
475c : 10 f8 __ BPL $4756 ; (undo_performundo.s1001 + 2)
475e : 60 __ __ RTS
.s1:
475f : ad fb 5b LDA $5bfb ; (undonumber + 0)
4762 : 0a __ __ ASL
4763 : 0a __ __ ASL
4764 : 0a __ __ ASL
4765 : a2 00 __ LDX #$00
4767 : 90 01 __ BCC $476a ; (undo_performundo.s1005 + 0)
.s1004:
4769 : e8 __ __ INX
.s1005:
476a : 38 __ __ SEC
476b : ed fb 5b SBC $5bfb ; (undonumber + 0)
476e : b0 01 __ BCS $4771 ; (undo_performundo.s1007 + 0)
.s1006:
4770 : ca __ __ DEX
.s1007:
4771 : 18 __ __ CLC
4772 : 69 9b __ ADC #$9b
4774 : 85 54 __ STA T1 + 0 
4776 : 8a __ __ TXA
4777 : 69 5d __ ADC #$5d
4779 : 85 55 __ STA T1 + 1 
477b : a0 04 __ LDY #$04
477d : b1 54 __ LDA (T1 + 0),y 
477f : f0 2c __ BEQ $47ad ; (undo_performundo.s7 + 0)
.s39:
4781 : 85 53 __ STA T0 + 0 
4783 : 85 1b __ STA ACCU + 0 
4785 : c8 __ __ INY
4786 : b1 54 __ LDA (T1 + 0),y 
4788 : 85 56 __ STA T2 + 0 
478a : 85 57 __ STA T3 + 0 
478c : a9 00 __ LDA #$00
478e : 85 5a __ STA T5 + 0 
4790 : 85 1c __ STA ACCU + 1 
4792 : a5 56 __ LDA T2 + 0 
4794 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4797 : a5 05 __ LDA WORK + 2 
4799 : 85 58 __ STA T4 + 0 
479b : a5 06 __ LDA WORK + 3 
479d : 85 59 __ STA T4 + 1 
479f : a0 03 __ LDY #$03
47a1 : b1 54 __ LDA (T1 + 0),y 
47a3 : 85 5b __ STA T6 + 0 
47a5 : 88 __ __ DEY
47a6 : b1 54 __ LDA (T1 + 0),y 
47a8 : 85 5c __ STA T7 + 0 
47aa : 4c 4a 48 JMP $484a ; (undo_performundo.l5 + 0)
.s7:
47ad : 20 06 58 JSR $5806 ; (vdcwin_cpy_viewport@proxy + 0)
47b0 : ad fe 5b LDA $5bfe ; (showbar + 0)
47b3 : f0 03 __ BEQ $47b8 ; (undo_performundo.s21 + 0)
.s19:
47b5 : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
.s21:
47b8 : ad fb 5b LDA $5bfb ; (undonumber + 0)
47bb : 85 53 __ STA T0 + 0 
47bd : 0a __ __ ASL
47be : 0a __ __ ASL
47bf : 0a __ __ ASL
47c0 : a2 00 __ LDX #$00
47c2 : 90 01 __ BCC $47c5 ; (undo_performundo.s1013 + 0)
.s1012:
47c4 : e8 __ __ INX
.s1013:
47c5 : 38 __ __ SEC
47c6 : e5 53 __ SBC T0 + 0 
47c8 : b0 01 __ BCS $47cb ; (undo_performundo.s1015 + 0)
.s1014:
47ca : ca __ __ DEX
.s1015:
47cb : 18 __ __ CLC
47cc : 69 9b __ ADC #$9b
47ce : 85 54 __ STA T1 + 0 
47d0 : 8a __ __ TXA
47d1 : 69 5d __ ADC #$5d
47d3 : 85 55 __ STA T1 + 1 
47d5 : a0 00 __ LDY #$00
47d7 : b1 54 __ LDA (T1 + 0),y 
47d9 : 8d f9 5b STA $5bf9 ; (undoaddress + 0)
47dc : c8 __ __ INY
47dd : b1 54 __ LDA (T1 + 0),y 
47df : 8d fa 5b STA $5bfa ; (undoaddress + 1)
47e2 : c6 53 __ DEC T0 + 0 
47e4 : a5 53 __ LDA T0 + 0 
47e6 : 8d fb 5b STA $5bfb ; (undonumber + 0)
47e9 : a0 06 __ LDY #$06
47eb : b1 54 __ LDA (T1 + 0),y 
47ed : f0 07 __ BEQ $47f6 ; (undo_performundo.s24 + 0)
.s22:
47ef : a9 02 __ LDA #$02
47f1 : 91 54 __ STA (T1 + 0),y 
47f3 : ee fd 5b INC $5bfd ; (undo_redopossible + 0)
.s24:
47f6 : ce fc 5b DEC $5bfc ; (undo_undopossible + 0)
47f9 : a5 53 __ LDA T0 + 0 
47fb : d0 0d __ BNE $480a ; (undo_performundo.s27 + 0)
.s25:
47fd : ad b3 5e LDA $5eb3 ; (Undo + 273)
4800 : 0d b4 5e ORA $5eb4 ; (Undo + 274)
4803 : f0 05 __ BEQ $480a ; (undo_performundo.s27 + 0)
.s28:
4805 : a9 28 __ LDA #$28
4807 : 8d fb 5b STA $5bfb ; (undonumber + 0)
.s27:
480a : ad fb 5b LDA $5bfb ; (undonumber + 0)
480d : f0 2a __ BEQ $4839 ; (undo_performundo.s38 + 0)
.s34:
480f : 0a __ __ ASL
4810 : 0a __ __ ASL
4811 : 0a __ __ ASL
4812 : a2 00 __ LDX #$00
4814 : 90 01 __ BCC $4817 ; (undo_performundo.s1017 + 0)
.s1016:
4816 : e8 __ __ INX
.s1017:
4817 : 38 __ __ SEC
4818 : ed fb 5b SBC $5bfb ; (undonumber + 0)
481b : b0 01 __ BCS $481e ; (undo_performundo.s1019 + 0)
.s1018:
481d : ca __ __ DEX
.s1019:
481e : 18 __ __ CLC
481f : 69 9b __ ADC #$9b
4821 : 85 54 __ STA T1 + 0 
4823 : 8a __ __ TXA
4824 : 69 5d __ ADC #$5d
4826 : 85 55 __ STA T1 + 1 
4828 : a0 00 __ LDY #$00
482a : b1 54 __ LDA (T1 + 0),y 
482c : c8 __ __ INY
482d : 11 54 __ ORA (T1 + 0),y 
482f : f0 13 __ BEQ $4844 ; (undo_performundo.s31 + 0)
.s33:
4831 : ad fb 5b LDA $5bfb ; (undonumber + 0)
4834 : f0 03 __ BEQ $4839 ; (undo_performundo.s38 + 0)
4836 : 4c 54 47 JMP $4754 ; (undo_performundo.s1001 + 0)
.s38:
4839 : ad b3 5e LDA $5eb3 ; (Undo + 273)
483c : 0d b4 5e ORA $5eb4 ; (Undo + 274)
483f : f0 03 __ BEQ $4844 ; (undo_performundo.s31 + 0)
4841 : 4c 54 47 JMP $4754 ; (undo_performundo.s1001 + 0)
.s31:
4844 : 8d fc 5b STA $5bfc ; (undo_undopossible + 0)
4847 : 4c 54 47 JMP $4754 ; (undo_performundo.s1001 + 0)
.l5:
484a : a0 06 __ LDY #$06
484c : b1 54 __ LDA (T1 + 0),y 
484e : f0 03 __ BEQ $4853 ; (undo_performundo.s10 + 0)
4850 : 4c 28 49 JMP $4928 ; (undo_performundo.s8 + 0)
.s10:
4853 : a9 7f __ LDA #$7f
4855 : 85 0d __ STA P0 
4857 : 18 __ __ CLC
4858 : a5 5a __ LDA T5 + 0 
485a : 65 5c __ ADC T7 + 0 
485c : 85 5f __ STA T10 + 0 
485e : 85 03 __ STA WORK + 0 
4860 : a9 00 __ LDA #$00
4862 : 85 13 __ STA P6 
4864 : 2a __ __ ROL
4865 : 85 60 __ STA T10 + 1 
4867 : 85 04 __ STA WORK + 1 
4869 : ad 03 5c LDA $5c03 ; (canvas + 3)
486c : 85 1b __ STA ACCU + 0 
486e : ad 04 5c LDA $5c04 ; (canvas + 4)
4871 : 85 1c __ STA ACCU + 1 
4873 : 20 46 56 JSR $5646 ; (mul16 + 0)
4876 : 18 __ __ CLC
4877 : a5 05 __ LDA WORK + 2 
4879 : 65 5b __ ADC T6 + 0 
487b : 85 0e __ STA P1 
487d : a5 06 __ LDA WORK + 3 
487f : 69 58 __ ADC #$58
4881 : 85 0f __ STA P2 
4883 : a5 5a __ LDA T5 + 0 
4885 : 85 1b __ STA ACCU + 0 
4887 : a9 00 __ LDA #$00
4889 : 85 1c __ STA ACCU + 1 
488b : a5 57 __ LDA T3 + 0 
488d : 85 12 __ STA P5 
488f : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4892 : a5 05 __ LDA WORK + 2 
4894 : 85 5d __ STA T8 + 0 
4896 : a5 06 __ LDA WORK + 3 
4898 : 85 5e __ STA T8 + 1 
489a : 18 __ __ CLC
489b : a0 00 __ LDY #$00
489d : b1 54 __ LDA (T1 + 0),y 
489f : 65 05 __ ADC WORK + 2 
48a1 : 85 10 __ STA P3 
48a3 : c8 __ __ INY
48a4 : b1 54 __ LDA (T1 + 0),y 
48a6 : 65 06 __ ADC WORK + 3 
48a8 : 85 11 __ STA P4 
48aa : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
48ad : ad 03 5c LDA $5c03 ; (canvas + 3)
48b0 : 85 1b __ STA ACCU + 0 
48b2 : ad 04 5c LDA $5c04 ; (canvas + 4)
48b5 : 85 1c __ STA ACCU + 1 
48b7 : a5 5f __ LDA T10 + 0 
48b9 : 85 03 __ STA WORK + 0 
48bb : a5 60 __ LDA T10 + 1 
48bd : 85 04 __ STA WORK + 1 
48bf : 20 46 56 JSR $5646 ; (mul16 + 0)
48c2 : 18 __ __ CLC
48c3 : a5 05 __ LDA WORK + 2 
48c5 : 65 5b __ ADC T6 + 0 
48c7 : 85 5f __ STA T10 + 0 
48c9 : a5 06 __ LDA WORK + 3 
48cb : 69 58 __ ADC #$58
48cd : 85 60 __ STA T10 + 1 
48cf : ad 05 5c LDA $5c05 ; (canvas + 5)
48d2 : 85 1b __ STA ACCU + 0 
48d4 : ad 06 5c LDA $5c06 ; (canvas + 6)
48d7 : 85 1c __ STA ACCU + 1 
48d9 : ad 03 5c LDA $5c03 ; (canvas + 3)
48dc : 85 03 __ STA WORK + 0 
48de : ad 04 5c LDA $5c04 ; (canvas + 4)
48e1 : 85 04 __ STA WORK + 1 
48e3 : 20 46 56 JSR $5646 ; (mul16 + 0)
48e6 : 18 __ __ CLC
48e7 : a5 05 __ LDA WORK + 2 
48e9 : 65 5f __ ADC T10 + 0 
48eb : aa __ __ TAX
48ec : a5 06 __ LDA WORK + 3 
48ee : 65 60 __ ADC T10 + 1 
48f0 : a8 __ __ TAY
48f1 : 8a __ __ TXA
48f2 : 18 __ __ CLC
48f3 : 69 30 __ ADC #$30
48f5 : 85 0e __ STA P1 
48f7 : 90 01 __ BCC $48fa ; (undo_performundo.s1011 + 0)
.s1010:
48f9 : c8 __ __ INY
.s1011:
48fa : 84 0f __ STY P2 
48fc : a0 00 __ LDY #$00
48fe : 84 13 __ STY P6 
4900 : b1 54 __ LDA (T1 + 0),y 
4902 : 18 __ __ CLC
4903 : 65 58 __ ADC T4 + 0 
4905 : aa __ __ TAX
4906 : c8 __ __ INY
4907 : b1 54 __ LDA (T1 + 0),y 
4909 : 65 59 __ ADC T4 + 1 
490b : a8 __ __ TAY
490c : 8a __ __ TXA
490d : 18 __ __ CLC
490e : 65 5d __ ADC T8 + 0 
4910 : 85 10 __ STA P3 
4912 : 98 __ __ TYA
4913 : 65 5e __ ADC T8 + 1 
4915 : 85 11 __ STA P4 
4917 : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
491a : e6 5a __ INC T5 + 0 
491c : a5 5a __ LDA T5 + 0 
491e : c5 53 __ CMP T0 + 0 
4920 : b0 03 __ BCS $4925 ; (undo_performundo.s1011 + 43)
4922 : 4c 4a 48 JMP $484a ; (undo_performundo.l5 + 0)
4925 : 4c ad 47 JMP $47ad ; (undo_performundo.s7 + 0)
.s8:
4928 : a9 7f __ LDA #$7f
492a : 85 11 __ STA P4 
492c : 18 __ __ CLC
492d : a5 5c __ LDA T7 + 0 
492f : 65 5a __ ADC T5 + 0 
4931 : 85 03 __ STA WORK + 0 
4933 : a9 00 __ LDA #$00
4935 : 2a __ __ ROL
4936 : 85 04 __ STA WORK + 1 
4938 : ad 03 5c LDA $5c03 ; (canvas + 3)
493b : 85 61 __ STA T11 + 0 
493d : 85 1b __ STA ACCU + 0 
493f : ad 04 5c LDA $5c04 ; (canvas + 4)
4942 : 85 62 __ STA T11 + 1 
4944 : 85 1c __ STA ACCU + 1 
4946 : 20 46 56 JSR $5646 ; (mul16 + 0)
4949 : 18 __ __ CLC
494a : a5 05 __ LDA WORK + 2 
494c : 65 5b __ ADC T6 + 0 
494e : 85 5f __ STA T10 + 0 
4950 : 85 12 __ STA P5 
4952 : a5 06 __ LDA WORK + 3 
4954 : 69 58 __ ADC #$58
4956 : 85 60 __ STA T10 + 1 
4958 : 85 13 __ STA P6 
495a : a9 00 __ LDA #$00
495c : 85 15 __ STA P8 
495e : 85 1c __ STA ACCU + 1 
4960 : a5 53 __ LDA T0 + 0 
4962 : 85 1b __ STA ACCU + 0 
4964 : a5 56 __ LDA T2 + 0 
4966 : 85 14 __ STA P7 
4968 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
496b : a5 05 __ LDA WORK + 2 
496d : 85 63 __ STA T13 + 0 
496f : 0a __ __ ASL
4970 : 85 44 __ STA T14 + 0 
4972 : a5 06 __ LDA WORK + 3 
4974 : 85 64 __ STA T13 + 1 
4976 : 2a __ __ ROL
4977 : 85 45 __ STA T14 + 1 
4979 : a0 00 __ LDY #$00
497b : 84 1c __ STY ACCU + 1 
497d : b1 54 __ LDA (T1 + 0),y 
497f : 85 65 __ STA T15 + 0 
4981 : 18 __ __ CLC
4982 : 65 44 __ ADC T14 + 0 
4984 : 85 44 __ STA T14 + 0 
4986 : c8 __ __ INY
4987 : b1 54 __ LDA (T1 + 0),y 
4989 : 85 66 __ STA T15 + 1 
498b : 65 45 __ ADC T14 + 1 
498d : 85 45 __ STA T14 + 1 
498f : a5 5a __ LDA T5 + 0 
4991 : 85 1b __ STA ACCU + 0 
4993 : a5 14 __ LDA P7 
4995 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4998 : a5 05 __ LDA WORK + 2 
499a : 85 67 __ STA T16 + 0 
499c : 18 __ __ CLC
499d : 65 44 __ ADC T14 + 0 
499f : 85 0f __ STA P2 
49a1 : a5 06 __ LDA WORK + 3 
49a3 : 85 68 __ STA T16 + 1 
49a5 : 65 45 __ ADC T14 + 1 
49a7 : 85 10 __ STA P3 
49a9 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
49ac : a9 00 __ LDA #$00
49ae : 85 15 __ STA P8 
49b0 : ad 05 5c LDA $5c05 ; (canvas + 5)
49b3 : 85 1b __ STA ACCU + 0 
49b5 : ad 06 5c LDA $5c06 ; (canvas + 6)
49b8 : 85 1c __ STA ACCU + 1 
49ba : a5 61 __ LDA T11 + 0 
49bc : 85 03 __ STA WORK + 0 
49be : a5 62 __ LDA T11 + 1 
49c0 : 85 04 __ STA WORK + 1 
49c2 : 20 46 56 JSR $5646 ; (mul16 + 0)
49c5 : 18 __ __ CLC
49c6 : a5 05 __ LDA WORK + 2 
49c8 : 65 5f __ ADC T10 + 0 
49ca : aa __ __ TAX
49cb : a5 06 __ LDA WORK + 3 
49cd : 65 60 __ ADC T10 + 1 
49cf : a8 __ __ TAY
49d0 : 8a __ __ TXA
49d1 : 18 __ __ CLC
49d2 : 69 30 __ ADC #$30
49d4 : 85 12 __ STA P5 
49d6 : 90 01 __ BCC $49d9 ; (undo_performundo.s1009 + 0)
.s1008:
49d8 : c8 __ __ INY
.s1009:
49d9 : 84 13 __ STY P6 
49db : a5 63 __ LDA T13 + 0 
49dd : 0a __ __ ASL
49de : a8 __ __ TAY
49df : a5 64 __ LDA T13 + 1 
49e1 : 2a __ __ ROL
49e2 : aa __ __ TAX
49e3 : 98 __ __ TYA
49e4 : 18 __ __ CLC
49e5 : 65 63 __ ADC T13 + 0 
49e7 : a8 __ __ TAY
49e8 : 8a __ __ TXA
49e9 : 65 64 __ ADC T13 + 1 
49eb : aa __ __ TAX
49ec : 98 __ __ TYA
49ed : 18 __ __ CLC
49ee : 65 65 __ ADC T15 + 0 
49f0 : a8 __ __ TAY
49f1 : 8a __ __ TXA
49f2 : 65 66 __ ADC T15 + 1 
49f4 : aa __ __ TAX
49f5 : 98 __ __ TYA
49f6 : 18 __ __ CLC
49f7 : 65 67 __ ADC T16 + 0 
49f9 : 85 0f __ STA P2 
49fb : 8a __ __ TXA
49fc : 65 68 __ ADC T16 + 1 
49fe : 85 10 __ STA P3 
4a00 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4a03 : 4c 53 48 JMP $4853 ; (undo_performundo.s10 + 0)
--------------------------------------------------------------------
undo_performredo: ; undo_performredo()->void
.s1000:
4a06 : a2 0f __ LDX #$0f
4a08 : b5 53 __ LDA T0 + 0,x 
4a0a : 9d c0 ab STA $abc0,x ; (buff + 24)
4a0d : ca __ __ DEX
4a0e : 10 f8 __ BPL $4a08 ; (undo_performredo.s1000 + 2)
.s0:
4a10 : ad fd 5b LDA $5bfd ; (undo_redopossible + 0)
4a13 : d0 0b __ BNE $4a20 ; (undo_performredo.s1 + 0)
.s1001:
4a15 : a2 0f __ LDX #$0f
4a17 : bd c0 ab LDA $abc0,x ; (buff + 24)
4a1a : 95 53 __ STA T0 + 0,x 
4a1c : ca __ __ DEX
4a1d : 10 f8 __ BPL $4a17 ; (undo_performredo.s1001 + 2)
4a1f : 60 __ __ RTS
.s1:
4a20 : 85 53 __ STA T0 + 0 
4a22 : ad fb 5b LDA $5bfb ; (undonumber + 0)
4a25 : c9 27 __ CMP #$27
4a27 : 90 04 __ BCC $4a2d ; (undo_performredo.s4 + 0)
.s5:
4a29 : a9 01 __ LDA #$01
4a2b : b0 02 __ BCS $4a2f ; (undo_performredo.s6 + 0)
.s4:
4a2d : 69 01 __ ADC #$01
.s6:
4a2f : 8d fb 5b STA $5bfb ; (undonumber + 0)
4a32 : 0a __ __ ASL
4a33 : 0a __ __ ASL
4a34 : 0a __ __ ASL
4a35 : a2 00 __ LDX #$00
4a37 : 90 01 __ BCC $4a3a ; (undo_performredo.s1017 + 0)
.s1016:
4a39 : e8 __ __ INX
.s1017:
4a3a : 38 __ __ SEC
4a3b : ed fb 5b SBC $5bfb ; (undonumber + 0)
4a3e : b0 01 __ BCS $4a41 ; (undo_performredo.s1019 + 0)
.s1018:
4a40 : ca __ __ DEX
.s1019:
4a41 : 18 __ __ CLC
4a42 : 69 9b __ ADC #$9b
4a44 : 85 56 __ STA T3 + 0 
4a46 : 8a __ __ TXA
4a47 : 69 5d __ ADC #$5d
4a49 : 85 57 __ STA T3 + 1 
4a4b : a0 04 __ LDY #$04
4a4d : b1 56 __ LDA (T3 + 0),y 
4a4f : f0 41 __ BEQ $4a92 ; (undo_performredo.s10 + 0)
.s26:
4a51 : 85 54 __ STA T1 + 0 
4a53 : 85 1b __ STA ACCU + 0 
4a55 : a9 00 __ LDA #$00
4a57 : 85 55 __ STA T2 + 0 
4a59 : 85 1c __ STA ACCU + 1 
4a5b : c8 __ __ INY
4a5c : b1 56 __ LDA (T3 + 0),y 
4a5e : 85 12 __ STA P5 
4a60 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4a63 : a5 05 __ LDA WORK + 2 
4a65 : 85 58 __ STA T5 + 0 
4a67 : 0a __ __ ASL
4a68 : a8 __ __ TAY
4a69 : a5 06 __ LDA WORK + 3 
4a6b : 85 59 __ STA T5 + 1 
4a6d : 2a __ __ ROL
4a6e : aa __ __ TAX
4a6f : 98 __ __ TYA
4a70 : 18 __ __ CLC
4a71 : 65 05 __ ADC WORK + 2 
4a73 : 85 5a __ STA T6 + 0 
4a75 : 8a __ __ TXA
4a76 : 65 06 __ ADC WORK + 3 
4a78 : 85 5b __ STA T6 + 1 
4a7a : 06 58 __ ASL T5 + 0 
4a7c : 26 59 __ ROL T5 + 1 
4a7e : a0 02 __ LDY #$02
4a80 : b1 56 __ LDA (T3 + 0),y 
4a82 : 85 5c __ STA T7 + 0 
4a84 : c8 __ __ INY
4a85 : b1 56 __ LDA (T3 + 0),y 
4a87 : 85 56 __ STA T3 + 0 
4a89 : a9 7f __ LDA #$7f
4a8b : 85 0d __ STA P0 
4a8d : a9 00 __ LDA #$00
4a8f : 18 __ __ CLC
4a90 : 90 62 __ BCC $4af4 ; (undo_performredo.l1014 + 0)
.s10:
4a92 : 20 06 58 JSR $5806 ; (vdcwin_cpy_viewport@proxy + 0)
4a95 : ad fe 5b LDA $5bfe ; (showbar + 0)
4a98 : f0 03 __ BEQ $4a9d ; (undo_performredo.s17 + 0)
.s15:
4a9a : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
.s17:
4a9d : ad fb 5b LDA $5bfb ; (undonumber + 0)
4aa0 : 0a __ __ ASL
4aa1 : 0a __ __ ASL
4aa2 : 0a __ __ ASL
4aa3 : a2 00 __ LDX #$00
4aa5 : 90 01 __ BCC $4aa8 ; (undo_performredo.s1027 + 0)
.s1026:
4aa7 : e8 __ __ INX
.s1027:
4aa8 : 38 __ __ SEC
4aa9 : ed fb 5b SBC $5bfb ; (undonumber + 0)
4aac : b0 01 __ BCS $4aaf ; (undo_performredo.s1029 + 0)
.s1028:
4aae : ca __ __ DEX
.s1029:
4aaf : 18 __ __ CLC
4ab0 : 69 9b __ ADC #$9b
4ab2 : 85 56 __ STA T3 + 0 
4ab4 : 8a __ __ TXA
4ab5 : 69 5d __ ADC #$5d
4ab7 : 85 57 __ STA T3 + 1 
4ab9 : a0 00 __ LDY #$00
4abb : b1 56 __ LDA (T3 + 0),y 
4abd : 8d f9 5b STA $5bf9 ; (undoaddress + 0)
4ac0 : c8 __ __ INY
4ac1 : b1 56 __ LDA (T3 + 0),y 
4ac3 : 8d fa 5b STA $5bfa ; (undoaddress + 1)
4ac6 : ee fc 5b INC $5bfc ; (undo_undopossible + 0)
4ac9 : a6 53 __ LDX T0 + 0 
4acb : ca __ __ DEX
4acc : 8e fd 5b STX $5bfd ; (undo_redopossible + 0)
4acf : ad fb 5b LDA $5bfb ; (undonumber + 0)
4ad2 : c9 27 __ CMP #$27
4ad4 : b0 06 __ BCS $4adc ; (undo_performredo.s20 + 0)
.s21:
4ad6 : a0 0d __ LDY #$0d
4ad8 : b1 56 __ LDA (T3 + 0),y 
4ada : f0 12 __ BEQ $4aee ; (undo_performredo.s18 + 0)
.s20:
4adc : ad fb 5b LDA $5bfb ; (undonumber + 0)
4adf : c9 27 __ CMP #$27
4ae1 : f0 03 __ BEQ $4ae6 ; (undo_performredo.s25 + 0)
4ae3 : 4c 15 4a JMP $4a15 ; (undo_performredo.s1001 + 0)
.s25:
4ae6 : ad a8 5d LDA $5da8 ; (Undo + 6)
4ae9 : f0 03 __ BEQ $4aee ; (undo_performredo.s18 + 0)
4aeb : 4c 15 4a JMP $4a15 ; (undo_performredo.s1001 + 0)
.s18:
4aee : 8d fd 5b STA $5bfd ; (undo_redopossible + 0)
4af1 : 4c 15 4a JMP $4a15 ; (undo_performredo.s1001 + 0)
.l1014:
4af4 : 65 5c __ ADC T7 + 0 
4af6 : 85 5f __ STA T9 + 0 
4af8 : 85 03 __ STA WORK + 0 
4afa : a9 00 __ LDA #$00
4afc : 85 13 __ STA P6 
4afe : 2a __ __ ROL
4aff : 85 60 __ STA T9 + 1 
4b01 : 85 04 __ STA WORK + 1 
4b03 : ad 03 5c LDA $5c03 ; (canvas + 3)
4b06 : 85 1b __ STA ACCU + 0 
4b08 : ad 04 5c LDA $5c04 ; (canvas + 4)
4b0b : 85 1c __ STA ACCU + 1 
4b0d : 20 46 56 JSR $5646 ; (mul16 + 0)
4b10 : 18 __ __ CLC
4b11 : a5 05 __ LDA WORK + 2 
4b13 : 65 56 __ ADC T3 + 0 
4b15 : 85 0e __ STA P1 
4b17 : a5 06 __ LDA WORK + 3 
4b19 : 69 58 __ ADC #$58
4b1b : 85 0f __ STA P2 
4b1d : ad fb 5b LDA $5bfb ; (undonumber + 0)
4b20 : 0a __ __ ASL
4b21 : 0a __ __ ASL
4b22 : 0a __ __ ASL
4b23 : a2 00 __ LDX #$00
4b25 : 90 01 __ BCC $4b28 ; (undo_performredo.s1021 + 0)
.s1020:
4b27 : e8 __ __ INX
.s1021:
4b28 : 38 __ __ SEC
4b29 : ed fb 5b SBC $5bfb ; (undonumber + 0)
4b2c : b0 01 __ BCS $4b2f ; (undo_performredo.s1023 + 0)
.s1022:
4b2e : ca __ __ DEX
.s1023:
4b2f : 18 __ __ CLC
4b30 : 69 9b __ ADC #$9b
4b32 : 85 61 __ STA T10 + 0 
4b34 : 8a __ __ TXA
4b35 : 69 5d __ ADC #$5d
4b37 : 85 62 __ STA T10 + 1 
4b39 : a0 00 __ LDY #$00
4b3b : 84 1c __ STY ACCU + 1 
4b3d : b1 61 __ LDA (T10 + 0),y 
4b3f : 18 __ __ CLC
4b40 : 65 58 __ ADC T5 + 0 
4b42 : 85 44 __ STA T12 + 0 
4b44 : c8 __ __ INY
4b45 : b1 61 __ LDA (T10 + 0),y 
4b47 : 65 59 __ ADC T5 + 1 
4b49 : 85 45 __ STA T12 + 1 
4b4b : a5 55 __ LDA T2 + 0 
4b4d : 85 1b __ STA ACCU + 0 
4b4f : a5 12 __ LDA P5 
4b51 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4b54 : a5 05 __ LDA WORK + 2 
4b56 : 85 5d __ STA T8 + 0 
4b58 : 18 __ __ CLC
4b59 : 65 44 __ ADC T12 + 0 
4b5b : 85 10 __ STA P3 
4b5d : a5 06 __ LDA WORK + 3 
4b5f : 85 5e __ STA T8 + 1 
4b61 : 65 45 __ ADC T12 + 1 
4b63 : 85 11 __ STA P4 
4b65 : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
4b68 : ad 03 5c LDA $5c03 ; (canvas + 3)
4b6b : 85 1b __ STA ACCU + 0 
4b6d : ad 04 5c LDA $5c04 ; (canvas + 4)
4b70 : 85 1c __ STA ACCU + 1 
4b72 : a5 5f __ LDA T9 + 0 
4b74 : 85 03 __ STA WORK + 0 
4b76 : a5 60 __ LDA T9 + 1 
4b78 : 85 04 __ STA WORK + 1 
4b7a : 20 46 56 JSR $5646 ; (mul16 + 0)
4b7d : 18 __ __ CLC
4b7e : a5 05 __ LDA WORK + 2 
4b80 : 65 56 __ ADC T3 + 0 
4b82 : 85 5f __ STA T9 + 0 
4b84 : a5 06 __ LDA WORK + 3 
4b86 : 69 58 __ ADC #$58
4b88 : 85 60 __ STA T9 + 1 
4b8a : ad 05 5c LDA $5c05 ; (canvas + 5)
4b8d : 85 1b __ STA ACCU + 0 
4b8f : ad 06 5c LDA $5c06 ; (canvas + 6)
4b92 : 85 1c __ STA ACCU + 1 
4b94 : ad 03 5c LDA $5c03 ; (canvas + 3)
4b97 : 85 03 __ STA WORK + 0 
4b99 : ad 04 5c LDA $5c04 ; (canvas + 4)
4b9c : 85 04 __ STA WORK + 1 
4b9e : 20 46 56 JSR $5646 ; (mul16 + 0)
4ba1 : 18 __ __ CLC
4ba2 : a5 05 __ LDA WORK + 2 
4ba4 : 65 5f __ ADC T9 + 0 
4ba6 : aa __ __ TAX
4ba7 : a5 06 __ LDA WORK + 3 
4ba9 : 65 60 __ ADC T9 + 1 
4bab : a8 __ __ TAY
4bac : 8a __ __ TXA
4bad : 18 __ __ CLC
4bae : 69 30 __ ADC #$30
4bb0 : 85 0e __ STA P1 
4bb2 : 90 01 __ BCC $4bb5 ; (undo_performredo.s1025 + 0)
.s1024:
4bb4 : c8 __ __ INY
.s1025:
4bb5 : 84 0f __ STY P2 
4bb7 : a0 00 __ LDY #$00
4bb9 : 84 13 __ STY P6 
4bbb : b1 61 __ LDA (T10 + 0),y 
4bbd : 18 __ __ CLC
4bbe : 65 5a __ ADC T6 + 0 
4bc0 : aa __ __ TAX
4bc1 : c8 __ __ INY
4bc2 : b1 61 __ LDA (T10 + 0),y 
4bc4 : 65 5b __ ADC T6 + 1 
4bc6 : a8 __ __ TAY
4bc7 : 8a __ __ TXA
4bc8 : 18 __ __ CLC
4bc9 : 65 5d __ ADC T8 + 0 
4bcb : 85 10 __ STA P3 
4bcd : 98 __ __ TYA
4bce : 65 5e __ ADC T8 + 1 
4bd0 : 85 11 __ STA P4 
4bd2 : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
4bd5 : e6 55 __ INC T2 + 0 
4bd7 : a5 55 __ LDA T2 + 0 
4bd9 : c5 54 __ CMP T1 + 0 
4bdb : b0 03 __ BCS $4be0 ; (undo_performredo.s1025 + 43)
4bdd : 4c f4 4a JMP $4af4 ; (undo_performredo.l1014 + 0)
4be0 : 4c 92 4a JMP $4a92 ; (undo_performredo.s10 + 0)
--------------------------------------------------------------------
undo_new: ; undo_new(u8,u8,u8,u8)->void
.s1000:
4be3 : a2 03 __ LDX #$03
4be5 : b5 53 __ LDA T11 + 0,x 
4be7 : 9d ef ab STA $abef,x ; (vp_fill + 31)
4bea : ca __ __ DEX
4beb : 10 f8 __ BPL $4be5 ; (undo_new.s1000 + 2)
.s0:
4bed : ee fb 5b INC $5bfb ; (undonumber + 0)
4bf0 : ad fd 5b LDA $5bfd ; (undo_redopossible + 0)
4bf3 : f0 0c __ BEQ $4c01 ; (undo_new.s2 + 0)
.s1:
4bf5 : a9 01 __ LDA #$01
4bf7 : 8d fc 5b STA $5bfc ; (undo_undopossible + 0)
4bfa : a9 00 __ LDA #$00
4bfc : 8d fd 5b STA $5bfd ; (undo_redopossible + 0)
4bff : f0 03 __ BEQ $4c04 ; (undo_new.s3 + 0)
.s2:
4c01 : ee fc 5b INC $5bfc ; (undo_undopossible + 0)
.s3:
4c04 : a9 01 __ LDA #$01
4c06 : 85 44 __ STA T1 + 0 
4c08 : a9 28 __ LDA #$28
4c0a : cd fb 5b CMP $5bfb ; (undonumber + 0)
4c0d : b0 05 __ BCS $4c14 ; (undo_new.s6 + 0)
.s4:
4c0f : a9 01 __ LDA #$01
4c11 : 8d fb 5b STA $5bfb ; (undonumber + 0)
.s6:
4c14 : ad f6 ab LDA $abf6 ; (sstack + 0)
4c17 : 85 49 __ STA T4 + 0 
4c19 : 85 1b __ STA ACCU + 0 
4c1b : a9 00 __ LDA #$00
4c1d : 85 1c __ STA ACCU + 1 
4c1f : a5 18 __ LDA P11 ; (width + 0)
4c21 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4c24 : a5 05 __ LDA WORK + 2 
4c26 : 85 4a __ STA T5 + 0 
4c28 : 0a __ __ ASL
4c29 : 85 4c __ STA T6 + 0 
4c2b : a5 06 __ LDA WORK + 3 
4c2d : 85 4b __ STA T5 + 1 
4c2f : 2a __ __ ROL
4c30 : 06 4c __ ASL T6 + 0 
4c32 : 2a __ __ ROL
4c33 : 85 4d __ STA T6 + 1 
4c35 : ad f9 5b LDA $5bf9 ; (undoaddress + 0)
4c38 : 18 __ __ CLC
4c39 : 65 4c __ ADC T6 + 0 
4c3b : aa __ __ TAX
4c3c : ad fa 5b LDA $5bfa ; (undoaddress + 1)
4c3f : 65 4d __ ADC T6 + 1 
4c41 : cd fa 5b CMP $5bfa ; (undoaddress + 1)
4c44 : d0 03 __ BNE $4c49 ; (undo_new.s1009 + 0)
.s1008:
4c46 : ec f9 5b CPX $5bf9 ; (undoaddress + 0)
.s1009:
4c49 : b0 11 __ BCS $4c5c ; (undo_new.s9 + 0)
.s7:
4c4b : a9 01 __ LDA #$01
4c4d : 8d fb 5b STA $5bfb ; (undonumber + 0)
4c50 : ad 29 5c LDA $5c29 ; (vdc_state + 20)
4c53 : 8d f9 5b STA $5bf9 ; (undoaddress + 0)
4c56 : ad 2a 5c LDA $5c2a ; (vdc_state + 21)
4c59 : 8d fa 5b STA $5bfa ; (undoaddress + 1)
.s9:
4c5c : a9 00 __ LDA #$00
4c5e : 85 52 __ STA T9 + 0 
4c60 : ad f9 5b LDA $5bf9 ; (undoaddress + 0)
4c63 : 18 __ __ CLC
4c64 : 65 4c __ ADC T6 + 0 
4c66 : 85 4c __ STA T6 + 0 
4c68 : ad fa 5b LDA $5bfa ; (undoaddress + 1)
4c6b : 65 4d __ ADC T6 + 1 
4c6d : 85 4d __ STA T6 + 1 
4c6f : a9 ff __ LDA #$ff
4c71 : 4d 29 5c EOR $5c29 ; (vdc_state + 20)
4c74 : aa __ __ TAX
4c75 : a9 ff __ LDA #$ff
4c77 : 4d 2a 5c EOR $5c2a ; (vdc_state + 21)
4c7a : c5 4d __ CMP T6 + 1 
4c7c : d0 02 __ BNE $4c80 ; (undo_new.s1007 + 0)
.s1006:
4c7e : e4 4c __ CPX T6 + 0 
.s1007:
4c80 : b0 02 __ BCS $4c84 ; (undo_new.s12 + 0)
.s10:
4c82 : c6 44 __ DEC T1 + 0 
.s12:
4c84 : a5 49 __ LDA T4 + 0 
4c86 : f0 16 __ BEQ $4c9e ; (undo_new.s16 + 0)
.s24:
4c88 : a5 17 __ LDA P10 ; (col + 0)
4c8a : 85 45 __ STA T2 + 0 
4c8c : a5 16 __ LDA P9 ; (row + 0)
4c8e : 85 4c __ STA T6 + 0 
4c90 : a9 7f __ LDA #$7f
4c92 : 85 11 __ STA P4 
4c94 : a5 18 __ LDA P11 ; (width + 0)
4c96 : 85 14 __ STA P7 
4c98 : a9 00 __ LDA #$00
4c9a : 18 __ __ CLC
4c9b : 4c 2b 4d JMP $4d2b ; (undo_new.l1016 + 0)
.s16:
4c9e : ad fb 5b LDA $5bfb ; (undonumber + 0)
4ca1 : 85 52 __ STA T9 + 0 
4ca3 : 0a __ __ ASL
4ca4 : 0a __ __ ASL
4ca5 : 0a __ __ ASL
4ca6 : a2 00 __ LDX #$00
4ca8 : 90 01 __ BCC $4cab ; (undo_new.s1021 + 0)
.s1020:
4caa : e8 __ __ INX
.s1021:
4cab : 38 __ __ SEC
4cac : e5 52 __ SBC T9 + 0 
4cae : b0 01 __ BCS $4cb1 ; (undo_new.s1023 + 0)
.s1022:
4cb0 : ca __ __ DEX
.s1023:
4cb1 : 18 __ __ CLC
4cb2 : 69 9b __ ADC #$9b
4cb4 : 85 45 __ STA T2 + 0 
4cb6 : 8a __ __ TXA
4cb7 : 69 5d __ ADC #$5d
4cb9 : 85 46 __ STA T2 + 1 
4cbb : ad fa 5b LDA $5bfa ; (undoaddress + 1)
4cbe : 85 48 __ STA T3 + 1 
4cc0 : ad f9 5b LDA $5bf9 ; (undoaddress + 0)
4cc3 : 85 47 __ STA T3 + 0 
4cc5 : a0 00 __ LDY #$00
4cc7 : 91 45 __ STA (T2 + 0),y 
4cc9 : a5 48 __ LDA T3 + 1 
4ccb : c8 __ __ INY
4ccc : 91 45 __ STA (T2 + 0),y 
4cce : a5 4a __ LDA T5 + 0 
4cd0 : 85 1b __ STA ACCU + 0 
4cd2 : a5 4b __ LDA T5 + 1 
4cd4 : 85 1c __ STA ACCU + 1 
4cd6 : a5 44 __ LDA T1 + 0 
4cd8 : 0a __ __ ASL
4cd9 : 18 __ __ CLC
4cda : 69 02 __ ADC #$02
4cdc : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4cdf : 18 __ __ CLC
4ce0 : a5 05 __ LDA WORK + 2 
4ce2 : 65 47 __ ADC T3 + 0 
4ce4 : 8d f9 5b STA $5bf9 ; (undoaddress + 0)
4ce7 : a5 06 __ LDA WORK + 3 
4ce9 : 65 48 __ ADC T3 + 1 
4ceb : 8d fa 5b STA $5bfa ; (undoaddress + 1)
4cee : a5 52 __ LDA T9 + 0 
4cf0 : c9 28 __ CMP #$28
4cf2 : a9 00 __ LDA #$00
4cf4 : b0 09 __ BCS $4cff ; (undo_new.s22 + 0)
.s21:
4cf6 : a0 07 __ LDY #$07
4cf8 : 91 45 __ STA (T2 + 0),y 
4cfa : c8 __ __ INY
4cfb : 91 45 __ STA (T2 + 0),y 
4cfd : 90 06 __ BCC $4d05 ; (undo_new.s23 + 0)
.s22:
4cff : 8d a2 5d STA $5da2 ; (Undo + 0)
4d02 : 8d a3 5d STA $5da3 ; (Undo + 1)
.s23:
4d05 : a5 49 __ LDA T4 + 0 
4d07 : a0 04 __ LDY #$04
4d09 : 91 45 __ STA (T2 + 0),y 
4d0b : a5 18 __ LDA P11 ; (width + 0)
4d0d : c8 __ __ INY
4d0e : 91 45 __ STA (T2 + 0),y 
4d10 : a5 44 __ LDA T1 + 0 
4d12 : c8 __ __ INY
4d13 : 91 45 __ STA (T2 + 0),y 
4d15 : a5 17 __ LDA P10 ; (col + 0)
4d17 : a0 03 __ LDY #$03
4d19 : 91 45 __ STA (T2 + 0),y 
4d1b : a5 16 __ LDA P9 ; (row + 0)
4d1d : 88 __ __ DEY
4d1e : 91 45 __ STA (T2 + 0),y 
.s1001:
4d20 : a2 03 __ LDX #$03
4d22 : bd ef ab LDA $abef,x ; (vp_fill + 31)
4d25 : 95 53 __ STA T11 + 0,x 
4d27 : ca __ __ DEX
4d28 : 10 f8 __ BPL $4d22 ; (undo_new.s1001 + 2)
4d2a : 60 __ __ RTS
.l1016:
4d2b : 65 4c __ ADC T6 + 0 
4d2d : 85 03 __ STA WORK + 0 
4d2f : a9 00 __ LDA #$00
4d31 : 85 15 __ STA P8 
4d33 : 2a __ __ ROL
4d34 : 85 04 __ STA WORK + 1 
4d36 : ad 03 5c LDA $5c03 ; (canvas + 3)
4d39 : 85 53 __ STA T11 + 0 
4d3b : 85 1b __ STA ACCU + 0 
4d3d : ad 04 5c LDA $5c04 ; (canvas + 4)
4d40 : 85 54 __ STA T11 + 1 
4d42 : 85 1c __ STA ACCU + 1 
4d44 : 20 46 56 JSR $5646 ; (mul16 + 0)
4d47 : 18 __ __ CLC
4d48 : a5 05 __ LDA WORK + 2 
4d4a : 65 45 __ ADC T2 + 0 
4d4c : 85 50 __ STA T8 + 0 
4d4e : 85 12 __ STA P5 
4d50 : a5 06 __ LDA WORK + 3 
4d52 : 69 58 __ ADC #$58
4d54 : 85 51 __ STA T8 + 1 
4d56 : 85 13 __ STA P6 
4d58 : a5 52 __ LDA T9 + 0 
4d5a : 85 1b __ STA ACCU + 0 
4d5c : a9 00 __ LDA #$00
4d5e : 85 1c __ STA ACCU + 1 
4d60 : a5 14 __ LDA P7 
4d62 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4d65 : a5 05 __ LDA WORK + 2 
4d67 : 85 4e __ STA T7 + 0 
4d69 : a5 06 __ LDA WORK + 3 
4d6b : 85 4f __ STA T7 + 1 
4d6d : ad f9 5b LDA $5bf9 ; (undoaddress + 0)
4d70 : 85 55 __ STA T12 + 0 
4d72 : 18 __ __ CLC
4d73 : 65 05 __ ADC WORK + 2 
4d75 : 85 0f __ STA P2 
4d77 : ad fa 5b LDA $5bfa ; (undoaddress + 1)
4d7a : 85 56 __ STA T12 + 1 
4d7c : 65 06 __ ADC WORK + 3 
4d7e : 85 10 __ STA P3 
4d80 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4d83 : a9 00 __ LDA #$00
4d85 : 85 15 __ STA P8 
4d87 : ad 05 5c LDA $5c05 ; (canvas + 5)
4d8a : 85 1b __ STA ACCU + 0 
4d8c : ad 06 5c LDA $5c06 ; (canvas + 6)
4d8f : 85 1c __ STA ACCU + 1 
4d91 : a5 53 __ LDA T11 + 0 
4d93 : 85 03 __ STA WORK + 0 
4d95 : a5 54 __ LDA T11 + 1 
4d97 : 85 04 __ STA WORK + 1 
4d99 : 20 46 56 JSR $5646 ; (mul16 + 0)
4d9c : 18 __ __ CLC
4d9d : a5 05 __ LDA WORK + 2 
4d9f : 65 50 __ ADC T8 + 0 
4da1 : aa __ __ TAX
4da2 : a5 06 __ LDA WORK + 3 
4da4 : 65 51 __ ADC T8 + 1 
4da6 : a8 __ __ TAY
4da7 : 8a __ __ TXA
4da8 : 18 __ __ CLC
4da9 : 69 30 __ ADC #$30
4dab : 85 12 __ STA P5 
4dad : 90 01 __ BCC $4db0 ; (undo_new.s1019 + 0)
.s1018:
4daf : c8 __ __ INY
.s1019:
4db0 : 84 13 __ STY P6 
4db2 : 18 __ __ CLC
4db3 : a5 4a __ LDA T5 + 0 
4db5 : 65 55 __ ADC T12 + 0 
4db7 : a8 __ __ TAY
4db8 : a5 4b __ LDA T5 + 1 
4dba : 65 56 __ ADC T12 + 1 
4dbc : aa __ __ TAX
4dbd : 98 __ __ TYA
4dbe : 18 __ __ CLC
4dbf : 65 4e __ ADC T7 + 0 
4dc1 : 85 0f __ STA P2 
4dc3 : 8a __ __ TXA
4dc4 : 65 4f __ ADC T7 + 1 
4dc6 : 85 10 __ STA P3 
4dc8 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4dcb : e6 52 __ INC T9 + 0 
4dcd : a5 52 __ LDA T9 + 0 
4dcf : c5 49 __ CMP T4 + 0 
4dd1 : b0 03 __ BCS $4dd6 ; (undo_new.s1019 + 38)
4dd3 : 4c 2b 4d JMP $4d2b ; (undo_new.l1016 + 0)
4dd6 : 4c 9e 4c JMP $4c9e ; (undo_new.s16 + 0)
--------------------------------------------------------------------
screenmapplot: ; screenmapplot(u8,u8,u8,u8)->void
.s0:
4dd9 : ad 03 5c LDA $5c03 ; (canvas + 3)
4ddc : 85 1b __ STA ACCU + 0 
4dde : ad 04 5c LDA $5c04 ; (canvas + 4)
4de1 : 85 1c __ STA ACCU + 1 
4de3 : a5 10 __ LDA P3 ; (row + 0)
4de5 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4de8 : 18 __ __ CLC
4de9 : a5 05 __ LDA WORK + 2 
4deb : 65 11 __ ADC P4 ; (col + 0)
4ded : 85 0d __ STA P0 
4def : a5 06 __ LDA WORK + 3 
4df1 : 69 58 __ ADC #$58
4df3 : 85 0e __ STA P1 
4df5 : a5 12 __ LDA P5 ; (screencode + 0)
4df7 : 85 0f __ STA P2 
4df9 : 20 f5 14 JSR $14f5 ; (bnk_writeb.s0 + 0)
4dfc : ad 03 5c LDA $5c03 ; (canvas + 3)
4dff : 85 1b __ STA ACCU + 0 
4e01 : ad 04 5c LDA $5c04 ; (canvas + 4)
4e04 : 85 1c __ STA ACCU + 1 
4e06 : a5 10 __ LDA P3 ; (row + 0)
4e08 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4e0b : 18 __ __ CLC
4e0c : a5 05 __ LDA WORK + 2 
4e0e : 65 11 __ ADC P4 ; (col + 0)
4e10 : 85 43 __ STA T1 + 0 
4e12 : a5 06 __ LDA WORK + 3 
4e14 : 69 58 __ ADC #$58
4e16 : 85 44 __ STA T1 + 1 
4e18 : ad 05 5c LDA $5c05 ; (canvas + 5)
4e1b : 85 1b __ STA ACCU + 0 
4e1d : ad 06 5c LDA $5c06 ; (canvas + 6)
4e20 : 85 1c __ STA ACCU + 1 
4e22 : ad 03 5c LDA $5c03 ; (canvas + 3)
4e25 : 85 03 __ STA WORK + 0 
4e27 : ad 04 5c LDA $5c04 ; (canvas + 4)
4e2a : 85 04 __ STA WORK + 1 
4e2c : 20 46 56 JSR $5646 ; (mul16 + 0)
4e2f : 18 __ __ CLC
4e30 : a5 05 __ LDA WORK + 2 
4e32 : 65 43 __ ADC T1 + 0 
4e34 : a8 __ __ TAY
4e35 : a5 06 __ LDA WORK + 3 
4e37 : 65 44 __ ADC T1 + 1 
4e39 : aa __ __ TAX
4e3a : 98 __ __ TYA
4e3b : 18 __ __ CLC
4e3c : 69 30 __ ADC #$30
4e3e : 85 0d __ STA P0 
4e40 : 90 01 __ BCC $4e43 ; (screenmapplot.s1003 + 0)
.s1002:
4e42 : e8 __ __ INX
.s1003:
4e43 : 86 0e __ STX P1 
4e45 : a5 13 __ LDA P6 ; (attribute + 0)
4e47 : 85 0f __ STA P2 
4e49 : 4c f5 14 JMP $14f5 ; (bnk_writeb.s0 + 0)
--------------------------------------------------------------------
gotoxy: ; gotoxy(u8,u8)->void
.s0:
4e4c : a6 0e __ LDX P1 
4e4e : a4 0d __ LDY P0 
4e50 : 4c f0 ff JMP $fff0 
--------------------------------------------------------------------
mainmenuloop: ; mainmenuloop()->void
.s1000:
4e53 : a5 53 __ LDA T1 + 0 
4e55 : 8d a8 ab STA $aba8 ; (buff + 0)
4e58 : 38 __ __ SEC
4e59 : a5 23 __ LDA SP + 0 
4e5b : e9 08 __ SBC #$08
4e5d : 85 23 __ STA SP + 0 
4e5f : b0 02 __ BCS $4e63 ; (mainmenuloop.s0 + 0)
4e61 : c6 24 __ DEC SP + 1 
.s0:
4e63 : a9 00 __ LDA #$00
4e65 : 85 17 __ STA P10 
4e67 : 85 18 __ STA P11 
4e69 : 8d f6 ab STA $abf6 ; (sstack + 0)
4e6c : a9 01 __ LDA #$01
4e6e : 8d f8 ab STA $abf8 ; (sstack + 2)
4e71 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
4e74 : 8d f7 ab STA $abf7 ; (sstack + 1)
4e77 : 20 e9 33 JSR $33e9 ; (vdcwin_win_new.s1000 + 0)
4e7a : 20 05 50 JSR $5005 ; (loadsyscharset.s0 + 0)
.l1:
4e7d : 20 28 50 JSR $5028 ; (menu_main.s1000 + 0)
4e80 : a5 1b __ LDA ACCU + 0 
4e82 : 85 53 __ STA T1 + 0 
4e84 : c9 18 __ CMP #$18
4e86 : f0 18 __ BEQ $4ea0 ; (mainmenuloop.s3 + 0)
.s39:
4e88 : b0 03 __ BCS $4e8d ; (mainmenuloop.s40 + 0)
4e8a : 4c 27 4f JMP $4f27 ; (mainmenuloop.s41 + 0)
.s40:
4e8d : c9 22 __ CMP #$22
4e8f : f0 0f __ BEQ $4ea0 ; (mainmenuloop.s3 + 0)
.s55:
4e91 : b0 03 __ BCS $4e96 ; (mainmenuloop.s56 + 0)
4e93 : 4c 17 4f JMP $4f17 ; (mainmenuloop.s57 + 0)
.s56:
4e96 : c9 2a __ CMP #$2a
4e98 : f0 76 __ BEQ $4f10 ; (mainmenuloop.s34 + 0)
.s63:
4e9a : 90 e1 __ BCC $4e7d ; (mainmenuloop.l1 + 0)
.s64:
4e9c : c9 2b __ CMP #$2b
4e9e : f0 1d __ BEQ $4ebd ; (mainmenuloop.s35 + 0)
.s3:
4ea0 : a5 53 __ LDA T1 + 0 
4ea2 : c9 63 __ CMP #$63
4ea4 : 90 d7 __ BCC $4e7d ; (mainmenuloop.l1 + 0)
.s2:
4ea6 : 20 28 38 JSR $3828 ; (vdcwin_win_free.s0 + 0)
4ea9 : 20 39 54 JSR $5439 ; (restorealtcharset.s0 + 0)
.s1001:
4eac : 18 __ __ CLC
4ead : a5 23 __ LDA SP + 0 
4eaf : 69 08 __ ADC #$08
4eb1 : 85 23 __ STA SP + 0 
4eb3 : 90 02 __ BCC $4eb7 ; (mainmenuloop.s1001 + 11)
4eb5 : e6 24 __ INC SP + 1 
4eb7 : ad a8 ab LDA $aba8 ; (buff + 0)
4eba : 85 53 __ STA T1 + 0 
4ebc : 60 __ __ RTS
.s35:
4ebd : a9 b0 __ LDA #$b0
4ebf : a0 02 __ LDY #$02
4ec1 : 91 23 __ STA (SP + 0),y 
4ec3 : a9 59 __ LDA #$59
4ec5 : c8 __ __ INY
4ec6 : 91 23 __ STA (SP + 0),y 
4ec8 : a9 1c __ LDA #$1c
4eca : c8 __ __ INY
4ecb : 91 23 __ STA (SP + 0),y 
4ecd : a9 54 __ LDA #$54
4ecf : c8 __ __ INY
4ed0 : 91 23 __ STA (SP + 0),y 
4ed2 : a9 00 __ LDA #$00
4ed4 : cd ff 2a CMP $2aff ; (undoenabled + 0)
4ed7 : 2a __ __ ROL
4ed8 : 8d ff 2a STA $2aff ; (undoenabled + 0)
4edb : f0 06 __ BEQ $4ee3 ; (mainmenuloop.s76 + 0)
.s75:
4edd : a9 54 __ LDA #$54
4edf : a2 25 __ LDX #$25
4ee1 : 90 04 __ BCC $4ee7 ; (mainmenuloop.s77 + 0)
.s76:
4ee3 : a9 54 __ LDA #$54
4ee5 : a2 2f __ LDX #$2f
.s77:
4ee7 : 85 44 __ STA T0 + 1 
4ee9 : 8a __ __ TXA
4eea : a0 06 __ LDY #$06
4eec : 91 23 __ STA (SP + 0),y 
4eee : a5 44 __ LDA T0 + 1 
4ef0 : c8 __ __ INY
4ef1 : 91 23 __ STA (SP + 0),y 
4ef3 : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
4ef6 : a9 00 __ LDA #$00
4ef8 : 8d fb 5b STA $5bfb ; (undonumber + 0)
4efb : 8d fc 5b STA $5bfc ; (undo_undopossible + 0)
4efe : 8d fd 5b STA $5bfd ; (undo_redopossible + 0)
4f01 : ad 29 5c LDA $5c29 ; (vdc_state + 20)
4f04 : 8d f9 5b STA $5bf9 ; (undoaddress + 0)
4f07 : ad 2a 5c LDA $5c2a ; (vdc_state + 21)
4f0a : 8d fa 5b STA $5bfa ; (undoaddress + 1)
4f0d : 4c 7d 4e JMP $4e7d ; (mainmenuloop.l1 + 0)
.s34:
4f10 : a9 01 __ LDA #$01
4f12 : 8d fe 57 STA $57fe ; (appexit + 0)
4f15 : d0 8f __ BNE $4ea6 ; (mainmenuloop.s2 + 0)
.s57:
4f17 : c9 20 __ CMP #$20
4f19 : f0 85 __ BEQ $4ea0 ; (mainmenuloop.s3 + 0)
.s58:
4f1b : b0 83 __ BCS $4ea0 ; (mainmenuloop.s3 + 0)
.s60:
4f1d : c9 19 __ CMP #$19
4f1f : d0 03 __ BNE $4f24 ; (mainmenuloop.s60 + 7)
4f21 : 4c a0 4e JMP $4ea0 ; (mainmenuloop.s3 + 0)
4f24 : 4c 7d 4e JMP $4e7d ; (mainmenuloop.l1 + 0)
.s41:
4f27 : c9 0f __ CMP #$0f
4f29 : d0 03 __ BNE $4f2e ; (mainmenuloop.s42 + 0)
4f2b : 4c e1 4f JMP $4fe1 ; (mainmenuloop.s8 + 0)
.s42:
4f2e : b0 16 __ BCS $4f46 ; (mainmenuloop.s43 + 0)
.s44:
4f30 : c9 0d __ CMP #$0d
4f32 : d0 03 __ BNE $4f37 ; (mainmenuloop.s45 + 0)
4f34 : 4c a0 4e JMP $4ea0 ; (mainmenuloop.s3 + 0)
.s45:
4f37 : 90 03 __ BCC $4f3c ; (mainmenuloop.s47 + 0)
4f39 : 4c a0 4e JMP $4ea0 ; (mainmenuloop.s3 + 0)
.s47:
4f3c : c9 0b __ CMP #$0b
4f3e : d0 03 __ BNE $4f43 ; (mainmenuloop.s47 + 7)
4f40 : 4c a0 4e JMP $4ea0 ; (mainmenuloop.s3 + 0)
4f43 : 4c 7d 4e JMP $4e7d ; (mainmenuloop.l1 + 0)
.s43:
4f46 : c9 16 __ CMP #$16
4f48 : d0 03 __ BNE $4f4d ; (mainmenuloop.s50 + 0)
4f4a : 4c a0 4e JMP $4ea0 ; (mainmenuloop.s3 + 0)
.s50:
4f4d : 90 03 __ BCC $4f52 ; (mainmenuloop.s52 + 0)
4f4f : 4c a0 4e JMP $4ea0 ; (mainmenuloop.s3 + 0)
.s52:
4f52 : c9 10 __ CMP #$10
4f54 : f0 03 __ BEQ $4f59 ; (mainmenuloop.s15 + 0)
4f56 : 4c 7d 4e JMP $4e7d ; (mainmenuloop.l1 + 0)
.s15:
4f59 : ad ff 2a LDA $2aff ; (undoenabled + 0)
4f5c : c9 01 __ CMP #$01
4f5e : d0 14 __ BNE $4f74 ; (mainmenuloop.s18 + 0)
.s16:
4f60 : a9 00 __ LDA #$00
4f62 : 85 16 __ STA P9 
4f64 : 85 17 __ STA P10 
4f66 : ad 03 5c LDA $5c03 ; (canvas + 3)
4f69 : 85 18 __ STA P11 
4f6b : ad 05 5c LDA $5c05 ; (canvas + 5)
4f6e : 8d f6 ab STA $abf6 ; (sstack + 0)
4f71 : 20 e3 4b JSR $4be3 ; (undo_new.s1000 + 0)
.s18:
4f74 : ad ff 5a LDA $5aff ; (plotscreencode + 0)
4f77 : 8d fb ab STA $abfb ; (sstack + 5)
4f7a : ad f7 5b LDA $5bf7 ; (plotblink + 0)
4f7d : 0a __ __ ASL
4f7e : 0a __ __ ASL
4f7f : 0a __ __ ASL
4f80 : 0a __ __ ASL
4f81 : 18 __ __ CLC
4f82 : 6d f4 5b ADC $5bf4 ; (plotcolor + 0)
4f85 : 85 43 __ STA T0 + 0 
4f87 : ad f6 5b LDA $5bf6 ; (plotunderline + 0)
4f8a : 4a __ __ LSR
4f8b : 6a __ __ ROR
4f8c : 6a __ __ ROR
4f8d : 29 c0 __ AND #$c0
4f8f : 6a __ __ ROR
4f90 : 65 43 __ ADC T0 + 0 
4f92 : 85 43 __ STA T0 + 0 
4f94 : ad f5 5b LDA $5bf5 ; (plotreverse + 0)
4f97 : 4a __ __ LSR
4f98 : 6a __ __ ROR
4f99 : 29 80 __ AND #$80
4f9b : 6a __ __ ROR
4f9c : 65 43 __ ADC T0 + 0 
4f9e : 85 43 __ STA T0 + 0 
4fa0 : ad f8 5b LDA $5bf8 ; (plotaltchar + 0)
4fa3 : 4a __ __ LSR
4fa4 : a9 00 __ LDA #$00
4fa6 : 6a __ __ ROR
4fa7 : 65 43 __ ADC T0 + 0 
.s88:
4fa9 : 8d fc ab STA $abfc ; (sstack + 6)
4fac : 20 a9 39 JSR $39a9 ; (screenmapfill.s0 + 0)
4faf : 20 28 38 JSR $3828 ; (vdcwin_win_free.s0 + 0)
4fb2 : 20 06 58 JSR $5806 ; (vdcwin_cpy_viewport@proxy + 0)
4fb5 : a9 00 __ LDA #$00
4fb7 : 85 17 __ STA P10 
4fb9 : 85 18 __ STA P11 
4fbb : 8d f6 ab STA $abf6 ; (sstack + 0)
4fbe : a9 01 __ LDA #$01
4fc0 : 8d f8 ab STA $abf8 ; (sstack + 2)
4fc3 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
4fc6 : 8d f7 ab STA $abf7 ; (sstack + 1)
4fc9 : 20 e9 33 JSR $33e9 ; (vdcwin_win_new.s1000 + 0)
4fcc : a9 00 __ LDA #$00
4fce : 85 14 __ STA P7 
4fd0 : 20 4b 51 JSR $514b ; (menu_placebar.s0 + 0)
4fd3 : ad fe 5b LDA $5bfe ; (showbar + 0)
4fd6 : d0 03 __ BNE $4fdb ; (mainmenuloop.s12 + 0)
4fd8 : 4c a0 4e JMP $4ea0 ; (mainmenuloop.s3 + 0)
.s12:
4fdb : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
4fde : 4c 7d 4e JMP $4e7d ; (mainmenuloop.l1 + 0)
.s8:
4fe1 : ad ff 2a LDA $2aff ; (undoenabled + 0)
4fe4 : c9 01 __ CMP #$01
4fe6 : d0 14 __ BNE $4ffc ; (mainmenuloop.s11 + 0)
.s9:
4fe8 : a9 00 __ LDA #$00
4fea : 85 16 __ STA P9 
4fec : 85 17 __ STA P10 
4fee : ad 03 5c LDA $5c03 ; (canvas + 3)
4ff1 : 85 18 __ STA P11 
4ff3 : ad 05 5c LDA $5c05 ; (canvas + 5)
4ff6 : 8d f6 ab STA $abf6 ; (sstack + 0)
4ff9 : 20 e3 4b JSR $4be3 ; (undo_new.s1000 + 0)
.s11:
4ffc : a9 20 __ LDA #$20
4ffe : 8d fb ab STA $abfb ; (sstack + 5)
5001 : a9 0f __ LDA #$0f
5003 : d0 a4 __ BNE $4fa9 ; (mainmenuloop.s88 + 0)
--------------------------------------------------------------------
loadsyscharset: ; loadsyscharset()->void
.s0:
5005 : ad fd 57 LDA $57fd ; (charsetchanged + 1)
5008 : c9 01 __ CMP #$01
500a : f0 01 __ BEQ $500d ; (loadsyscharset.s1 + 0)
.s1001:
500c : 60 __ __ RTS
.s1:
500d : a9 7f __ LDA #$7f
500f : 85 11 __ STA P4 
5011 : a9 01 __ LDA #$01
5013 : 85 15 __ STA P8 
5015 : ad 27 5c LDA $5c27 ; (vdc_state + 18)
5018 : 85 0f __ STA P2 
501a : ad 28 5c LDA $5c28 ; (vdc_state + 19)
501d : 85 10 __ STA P3 
501f : a9 00 __ LDA #$00
5021 : 85 14 __ STA P7 
5023 : 85 12 __ STA P5 
5025 : 4c 6d 15 JMP $156d ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
5028 : a2 03 __ LDX #$03
502a : b5 53 __ LDA T0 + 0,x 
502c : 9d c6 ab STA $abc6,x ; (buff + 30)
502f : ca __ __ DEX
5030 : 10 f8 __ BPL $502a ; (menu_main.s1000 + 2)
.s0:
5032 : ad fc 5a LDA $5afc ; (menubar + 52)
5035 : 85 14 __ STA P7 
5037 : 20 4b 51 JSR $514b ; (menu_placebar.s0 + 0)
.l84:
503a : a9 01 __ LDA #$01
503c : 85 53 __ STA T0 + 0 
.l3:
503e : a9 cf __ LDA #$cf
5040 : 85 13 __ STA P6 
5042 : a6 53 __ LDX T0 + 0 
5044 : bd f7 5a LDA $5af7,x ; (menubar + 47)
5047 : 85 0f __ STA P2 
5049 : ad fc 5a LDA $5afc ; (menubar + 52)
504c : 85 10 __ STA P3 
504e : bd f0 57 LDA $57f0,x ; (__multab12L + 0)
5051 : 18 __ __ CLC
5052 : 69 bc __ ADC #$bc
5054 : 85 11 __ STA P4 
5056 : a9 5a __ LDA #$5a
5058 : 69 00 __ ADC #$00
505a : 85 12 __ STA P5 
505c : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
.l5:
505f : 20 1a 38 JSR $381a ; (vdcwin_getch.s0 + 0)
5062 : a5 1b __ LDA ACCU + 0 
5064 : 85 54 __ STA T1 + 0 
5066 : c9 0d __ CMP #$0d
5068 : d0 06 __ BNE $5070 ; (menu_main.s1002 + 0)
.s1003:
506a : a9 00 __ LDA #$00
506c : 85 55 __ STA T3 + 0 
506e : f0 16 __ BEQ $5086 ; (menu_main.s6 + 0)
.s1002:
5070 : a9 01 __ LDA #$01
5072 : 85 55 __ STA T3 + 0 
5074 : a5 1b __ LDA ACCU + 0 
5076 : c9 9d __ CMP #$9d
5078 : f0 0c __ BEQ $5086 ; (menu_main.s6 + 0)
.s9:
507a : c9 1d __ CMP #$1d
507c : f0 08 __ BEQ $5086 ; (menu_main.s6 + 0)
.s8:
507e : c9 1b __ CMP #$1b
5080 : f0 04 __ BEQ $5086 ; (menu_main.s6 + 0)
.s7:
5082 : c9 03 __ CMP #$03
5084 : d0 d9 __ BNE $505f ; (menu_main.l5 + 0)
.s6:
5086 : a9 c4 __ LDA #$c4
5088 : 85 13 __ STA P6 
508a : a6 53 __ LDX T0 + 0 
508c : bd f7 5a LDA $5af7,x ; (menubar + 47)
508f : 85 0f __ STA P2 
5091 : ad fc 5a LDA $5afc ; (menubar + 52)
5094 : 85 56 __ STA T4 + 0 
5096 : 85 10 __ STA P3 
5098 : bd f0 57 LDA $57f0,x ; (__multab12L + 0)
509b : 18 __ __ CLC
509c : 69 bc __ ADC #$bc
509e : 85 11 __ STA P4 
50a0 : a9 5a __ LDA #$5a
50a2 : 69 00 __ ADC #$00
50a4 : 85 12 __ STA P5 
50a6 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
50a9 : a5 54 __ LDA T1 + 0 
50ab : c9 9d __ CMP #$9d
50ad : d0 03 __ BNE $50b2 ; (menu_main.s12 + 0)
50af : 4c 3f 51 JMP $513f ; (menu_main.s11 + 0)
.s12:
50b2 : c9 1d __ CMP #$1d
50b4 : d0 0c __ BNE $50c2 ; (menu_main.s13 + 0)
.s17:
50b6 : e6 53 __ INC T0 + 0 
50b8 : a5 53 __ LDA T0 + 0 
50ba : c9 05 __ CMP #$05
50bc : 90 04 __ BCC $50c2 ; (menu_main.s13 + 0)
.s20:
50be : a9 01 __ LDA #$01
.s1039:
50c0 : 85 53 __ STA T0 + 0 
.s13:
50c2 : a5 55 __ LDA T3 + 0 
50c4 : f0 0d __ BEQ $50d3 ; (menu_main.s4 + 0)
.s24:
50c6 : a5 54 __ LDA T1 + 0 
50c8 : c9 1b __ CMP #$1b
50ca : f0 11 __ BEQ $50dd ; (menu_main.s26 + 0)
.s23:
50cc : c9 03 __ CMP #$03
50ce : f0 03 __ BEQ $50d3 ; (menu_main.s4 + 0)
50d0 : 4c 3e 50 JMP $503e ; (menu_main.l3 + 0)
.s4:
50d3 : a5 54 __ LDA T1 + 0 
50d5 : c9 1b __ CMP #$1b
50d7 : f0 04 __ BEQ $50dd ; (menu_main.s26 + 0)
.s28:
50d9 : c9 03 __ CMP #$03
50db : d0 06 __ BNE $50e3 ; (menu_main.s25 + 0)
.s26:
50dd : a9 63 __ LDA #$63
50df : 85 55 __ STA T3 + 0 
50e1 : d0 44 __ BNE $5127 ; (menu_main.s2 + 0)
.s25:
50e3 : a6 53 __ LDX T0 + 0 
50e5 : ca __ __ DEX
50e6 : 8e fd ab STX $abfd ; (sstack + 7)
50e9 : bd f8 5a LDA $5af8,x ; (menubar + 48)
50ec : 8d fb ab STA $abfb ; (sstack + 5)
50ef : a6 56 __ LDX T4 + 0 
50f1 : e8 __ __ INX
50f2 : 8e fc ab STX $abfc ; (sstack + 6)
50f5 : 20 cf 51 JSR $51cf ; (menu_pulldown.s1000 + 0)
50f8 : a5 1b __ LDA ACCU + 0 
50fa : 85 55 __ STA T3 + 0 
50fc : c9 12 __ CMP #$12
50fe : d0 0e __ BNE $510e ; (menu_main.s31 + 0)
.s29:
5100 : a9 00 __ LDA #$00
5102 : 85 55 __ STA T3 + 0 
5104 : c6 53 __ DEC T0 + 0 
5106 : d0 06 __ BNE $510e ; (menu_main.s31 + 0)
.s32:
5108 : a9 04 __ LDA #$04
510a : 85 53 __ STA T0 + 0 
510c : d0 12 __ BNE $5120 ; (menu_main.s27 + 0)
.s31:
510e : c9 13 __ CMP #$13
5110 : d0 0e __ BNE $5120 ; (menu_main.s27 + 0)
.s35:
5112 : e6 53 __ INC T0 + 0 
5114 : a5 53 __ LDA T0 + 0 
5116 : c9 05 __ CMP #$05
5118 : b0 03 __ BCS $511d ; (menu_main.s35 + 11)
511a : 4c 3e 50 JMP $503e ; (menu_main.l3 + 0)
511d : 4c 3a 50 JMP $503a ; (menu_main.l84 + 0)
.s27:
5120 : a5 55 __ LDA T3 + 0 
5122 : d0 03 __ BNE $5127 ; (menu_main.s2 + 0)
5124 : 4c 3e 50 JMP $503e ; (menu_main.l3 + 0)
.s2:
5127 : a5 53 __ LDA T0 + 0 
5129 : 0a __ __ ASL
512a : 0a __ __ ASL
512b : 18 __ __ CLC
512c : 65 53 __ ADC T0 + 0 
512e : 0a __ __ ASL
512f : 18 __ __ CLC
5130 : 65 55 __ ADC T3 + 0 
5132 : 85 1b __ STA ACCU + 0 
.s1001:
5134 : a2 03 __ LDX #$03
5136 : bd c6 ab LDA $abc6,x ; (buff + 30)
5139 : 95 53 __ STA T0 + 0,x 
513b : ca __ __ DEX
513c : 10 f8 __ BPL $5136 ; (menu_main.s1001 + 2)
513e : 60 __ __ RTS
.s11:
513f : c6 53 __ DEC T0 + 0 
5141 : f0 03 __ BEQ $5146 ; (menu_main.s14 + 0)
5143 : 4c c2 50 JMP $50c2 ; (menu_main.s13 + 0)
.s14:
5146 : a9 04 __ LDA #$04
5148 : 4c c0 50 JMP $50c0 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
514b : a9 00 __ LDA #$00
514d : 85 0f __ STA P2 
514f : a9 20 __ LDA #$20
5151 : 85 11 __ STA P4 
5153 : a9 c4 __ LDA #$c4
5155 : 85 12 __ STA P5 
5157 : a9 50 __ LDA #$50
5159 : 85 13 __ STA P6 
515b : a5 14 __ LDA P7 ; (y + 0)
515d : 8d fc 5a STA $5afc ; (menubar + 52)
5160 : 85 10 __ STA P3 
5162 : 20 ae 2d JSR $2dae ; (vdc_hchar.s0 + 0)
5165 : a9 01 __ LDA #$01
5167 : 85 49 __ STA T1 + 0 
5169 : a0 00 __ LDY #$00
516b : 84 4a __ STY T2 + 0 
.l2:
516d : b9 f0 57 LDA $57f0,y ; (__multab12L + 0)
5170 : 18 __ __ CLC
5171 : 69 c8 __ ADC #$c8
5173 : 85 0d __ STA P0 
5175 : a9 5a __ LDA #$5a
5177 : 69 00 __ ADC #$00
5179 : 85 0e __ STA P1 
517b : 20 e0 32 JSR $32e0 ; (strlen.s0 + 0)
517e : a5 0d __ LDA P0 
5180 : 85 11 __ STA P4 
5182 : a5 0e __ LDA P1 
5184 : 85 12 __ STA P5 
5186 : a9 c4 __ LDA #$c4
5188 : 85 13 __ STA P6 
518a : a5 1b __ LDA ACCU + 0 
518c : 85 4b __ STA T4 + 0 
518e : 18 __ __ CLC
518f : 65 49 __ ADC T1 + 0 
5191 : 85 43 __ STA T5 + 0 
5193 : a9 00 __ LDA #$00
5195 : 2a __ __ ROL
5196 : 85 44 __ STA T5 + 1 
5198 : ad 18 5c LDA $5c18 ; (vdc_state + 3)
519b : 38 __ __ SEC
519c : e9 01 __ SBC #$01
519e : a8 __ __ TAY
519f : ad 19 5c LDA $5c19 ; (vdc_state + 4)
51a2 : e9 00 __ SBC #$00
51a4 : c5 44 __ CMP T5 + 1 
51a6 : d0 02 __ BNE $51aa ; (menu_placebar.s1005 + 0)
.s1004:
51a8 : c4 43 __ CPY T5 + 0 
.s1005:
51aa : 90 04 __ BCC $51b0 ; (menu_placebar.s5 + 0)
.s7:
51ac : a5 49 __ LDA T1 + 0 
51ae : b0 04 __ BCS $51b4 ; (menu_placebar.s1006 + 0)
.s5:
51b0 : 98 __ __ TYA
51b1 : 38 __ __ SEC
51b2 : e5 1b __ SBC ACCU + 0 
.s1006:
51b4 : 85 0f __ STA P2 
51b6 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
51b9 : a5 0f __ LDA P2 
51bb : a4 4a __ LDY T2 + 0 
51bd : c8 __ __ INY
51be : 84 4a __ STY T2 + 0 
51c0 : 99 f7 5a STA $5af7,y ; (menubar + 47)
51c3 : a5 4b __ LDA T4 + 0 
51c5 : 38 __ __ SEC
51c6 : 65 0f __ ADC P2 
51c8 : 85 49 __ STA T1 + 0 
51ca : c0 04 __ CPY #$04
51cc : 90 9f __ BCC $516d ; (menu_placebar.l2 + 0)
.s1001:
51ce : 60 __ __ RTS
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
51cf : a2 08 __ LDX #$08
51d1 : b5 53 __ LDA T1 + 0,x 
51d3 : 9d cb ab STA $abcb,x ; (buff + 35)
51d6 : ca __ __ DEX
51d7 : 10 f8 __ BPL $51d1 ; (menu_pulldown.s1000 + 2)
51d9 : 38 __ __ SEC
51da : a5 23 __ LDA SP + 0 
51dc : e9 0a __ SBC #$0a
51de : 85 23 __ STA SP + 0 
51e0 : b0 02 __ BCS $51e4 ; (menu_pulldown.s0 + 0)
51e2 : c6 24 __ DEC SP + 1 
.s0:
51e4 : a9 70 __ LDA #$70
51e6 : ae fd ab LDX $abfd ; (sstack + 7)
51e9 : 86 52 __ STX T0 + 0 
51eb : 18 __ __ CLC
51ec : 7d f5 57 ADC $57f5,x ; (__multab96L + 0)
51ef : 85 54 __ STA T2 + 0 
51f1 : 85 0d __ STA P0 
51f3 : a9 58 __ LDA #$58
51f5 : 7d 00 58 ADC $5800,x ; (__multab96H + 0)
51f8 : 85 55 __ STA T2 + 1 
51fa : 85 0e __ STA P1 
51fc : 20 e0 32 JSR $32e0 ; (strlen.s0 + 0)
51ff : a6 52 __ LDX T0 + 0 
5201 : bd b0 5a LDA $5ab0,x ; (pulldown_options + 0)
5204 : 85 57 __ STA T4 + 0 
5206 : 8d f8 ab STA $abf8 ; (sstack + 2)
5209 : e0 04 __ CPX #$04
520b : 90 08 __ BCC $5215 ; (menu_pulldown.s77 + 0)
.s76:
520d : a9 00 __ LDA #$00
520f : 85 53 __ STA T1 + 0 
5211 : a9 f0 __ LDA #$f0
5213 : b0 06 __ BCS $521b ; (menu_pulldown.s81 + 0)
.s77:
5215 : a9 01 __ LDA #$01
5217 : 85 53 __ STA T1 + 0 
5219 : a9 70 __ LDA #$70
.s81:
521b : 85 17 __ STA P10 
521d : ad fb ab LDA $abfb ; (sstack + 5)
5220 : 85 52 __ STA T0 + 0 
5222 : 85 18 __ STA P11 
5224 : ad fc ab LDA $abfc ; (sstack + 6)
5227 : 85 56 __ STA T3 + 0 
5229 : 8d f6 ab STA $abf6 ; (sstack + 0)
522c : 18 __ __ CLC
522d : a5 1b __ LDA ACCU + 0 
522f : 69 02 __ ADC #$02
5231 : 8d f7 ab STA $abf7 ; (sstack + 1)
5234 : 20 e9 33 JSR $33e9 ; (vdcwin_win_new.s1000 + 0)
5237 : a9 01 __ LDA #$01
5239 : 85 59 __ STA T6 + 0 
523b : a5 57 __ LDA T4 + 0 
523d : f0 5c __ BEQ $529b ; (menu_pulldown.l5 + 0)
.s58:
523f : a9 00 __ LDA #$00
5241 : 85 58 __ STA T5 + 0 
5243 : 85 5a __ STA T8 + 0 
5245 : 85 5b __ STA T8 + 1 
5247 : 18 __ __ CLC
.l1048:
5248 : a9 00 __ LDA #$00
524a : a0 02 __ LDY #$02
524c : 91 23 __ STA (SP + 0),y 
524e : a9 5d __ LDA #$5d
5250 : c8 __ __ INY
5251 : 91 23 __ STA (SP + 0),y 
5253 : a9 11 __ LDA #$11
5255 : c8 __ __ INY
5256 : 91 23 __ STA (SP + 0),y 
5258 : a9 54 __ LDA #$54
525a : c8 __ __ INY
525b : 91 23 __ STA (SP + 0),y 
525d : a5 54 __ LDA T2 + 0 
525f : 65 5a __ ADC T8 + 0 
5261 : c8 __ __ INY
5262 : 91 23 __ STA (SP + 0),y 
5264 : a5 55 __ LDA T2 + 1 
5266 : 65 5b __ ADC T8 + 1 
5268 : c8 __ __ INY
5269 : 91 23 __ STA (SP + 0),y 
526b : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
526e : a5 52 __ LDA T0 + 0 
5270 : 85 0f __ STA P2 
5272 : a9 00 __ LDA #$00
5274 : 85 11 __ STA P4 
5276 : a9 5d __ LDA #$5d
5278 : 85 12 __ STA P5 
527a : a9 c6 __ LDA #$c6
527c : 85 13 __ STA P6 
527e : 18 __ __ CLC
527f : a5 58 __ LDA T5 + 0 
5281 : 65 56 __ ADC T3 + 0 
5283 : 85 10 __ STA P3 
5285 : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
5288 : 18 __ __ CLC
5289 : a5 5a __ LDA T8 + 0 
528b : 69 10 __ ADC #$10
528d : 85 5a __ STA T8 + 0 
528f : 90 02 __ BCC $5293 ; (menu_pulldown.s1051 + 0)
.s1050:
5291 : e6 5b __ INC T8 + 1 
.s1051:
5293 : e6 58 __ INC T5 + 0 
5295 : a5 58 __ LDA T5 + 0 
5297 : c5 57 __ CMP T4 + 0 
5299 : 90 ad __ BCC $5248 ; (menu_pulldown.l1048 + 0)
.l5:
529b : a9 2d __ LDA #$2d
529d : a0 06 __ LDY #$06
529f : 91 23 __ STA (SP + 0),y 
52a1 : a9 00 __ LDA #$00
52a3 : c8 __ __ INY
52a4 : 91 23 __ STA (SP + 0),y 
52a6 : a9 00 __ LDA #$00
52a8 : a0 02 __ LDY #$02
52aa : 91 23 __ STA (SP + 0),y 
52ac : a9 5d __ LDA #$5d
52ae : c8 __ __ INY
52af : 91 23 __ STA (SP + 0),y 
52b1 : a9 16 __ LDA #$16
52b3 : c8 __ __ INY
52b4 : 91 23 __ STA (SP + 0),y 
52b6 : a9 54 __ LDA #$54
52b8 : c8 __ __ INY
52b9 : 91 23 __ STA (SP + 0),y 
52bb : a5 59 __ LDA T6 + 0 
52bd : 0a __ __ ASL
52be : 2a __ __ ROL
52bf : 2a __ __ ROL
52c0 : 2a __ __ ROL
52c1 : a8 __ __ TAY
52c2 : 29 07 __ AND #$07
52c4 : 2a __ __ ROL
52c5 : aa __ __ TAX
52c6 : 98 __ __ TYA
52c7 : 29 f0 __ AND #$f0
52c9 : 38 __ __ SEC
52ca : e9 10 __ SBC #$10
52cc : b0 01 __ BCS $52cf ; (menu_pulldown.s1053 + 0)
.s1052:
52ce : ca __ __ DEX
.s1053:
52cf : 18 __ __ CLC
52d0 : 65 54 __ ADC T2 + 0 
52d2 : a0 08 __ LDY #$08
52d4 : 91 23 __ STA (SP + 0),y 
52d6 : 8a __ __ TXA
52d7 : 65 55 __ ADC T2 + 1 
52d9 : c8 __ __ INY
52da : 91 23 __ STA (SP + 0),y 
52dc : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
52df : a9 00 __ LDA #$00
52e1 : 85 11 __ STA P4 
52e3 : a9 5d __ LDA #$5d
52e5 : 85 12 __ STA P5 
52e7 : a9 cd __ LDA #$cd
52e9 : 85 13 __ STA P6 
52eb : ad fb ab LDA $abfb ; (sstack + 5)
52ee : 85 0f __ STA P2 
52f0 : ad fc ab LDA $abfc ; (sstack + 6)
52f3 : 85 56 __ STA T3 + 0 
52f5 : 18 __ __ CLC
52f6 : 65 59 __ ADC T6 + 0 
52f8 : 38 __ __ SEC
52f9 : e9 01 __ SBC #$01
52fb : 85 10 __ STA P3 
52fd : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
.l7:
5300 : 20 1a 38 JSR $381a ; (vdcwin_getch.s0 + 0)
5303 : a5 1b __ LDA ACCU + 0 
5305 : 85 5a __ STA T8 + 0 
5307 : c9 0d __ CMP #$0d
5309 : f0 18 __ BEQ $5323 ; (menu_pulldown.s8 + 0)
.s14:
530b : c9 9d __ CMP #$9d
530d : f0 14 __ BEQ $5323 ; (menu_pulldown.s8 + 0)
.s13:
530f : c9 1d __ CMP #$1d
5311 : f0 10 __ BEQ $5323 ; (menu_pulldown.s8 + 0)
.s12:
5313 : c9 91 __ CMP #$91
5315 : f0 0c __ BEQ $5323 ; (menu_pulldown.s8 + 0)
.s11:
5317 : c9 11 __ CMP #$11
5319 : f0 08 __ BEQ $5323 ; (menu_pulldown.s8 + 0)
.s10:
531b : c9 1b __ CMP #$1b
531d : f0 04 __ BEQ $5323 ; (menu_pulldown.s8 + 0)
.s9:
531f : c9 03 __ CMP #$03
5321 : d0 dd __ BNE $5300 ; (menu_pulldown.l7 + 0)
.s8:
5323 : a5 1b __ LDA ACCU + 0 
5325 : c9 1b __ CMP #$1b
5327 : d0 03 __ BNE $532c ; (menu_pulldown.s42 + 0)
5329 : 4c 02 54 JMP $5402 ; (menu_pulldown.s16 + 0)
.s42:
532c : b0 03 __ BCS $5331 ; (menu_pulldown.s43 + 0)
532e : 4c f2 53 JMP $53f2 ; (menu_pulldown.s44 + 0)
.s43:
5331 : c9 91 __ CMP #$91
5333 : f0 43 __ BEQ $5378 ; (menu_pulldown.s29 + 0)
.s50:
5335 : b0 2f __ BCS $5366 ; (menu_pulldown.s51 + 0)
.s52:
5337 : c9 1d __ CMP #$1d
5339 : f0 03 __ BEQ $533e ; (menu_pulldown.s25 + 0)
533b : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s25:
533e : a5 53 __ LDA T1 + 0 
5340 : d0 03 __ BNE $5345 ; (menu_pulldown.s26 + 0)
5342 : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s26:
5345 : a9 13 __ LDA #$13
.s1047:
5347 : 85 59 __ STA T6 + 0 
.s6:
5349 : 20 28 38 JSR $3828 ; (vdcwin_win_free.s0 + 0)
534c : a5 59 __ LDA T6 + 0 
534e : 85 1b __ STA ACCU + 0 
.s1001:
5350 : 18 __ __ CLC
5351 : a5 23 __ LDA SP + 0 
5353 : 69 0a __ ADC #$0a
5355 : 85 23 __ STA SP + 0 
5357 : 90 02 __ BCC $535b ; (menu_pulldown.s1001 + 11)
5359 : e6 24 __ INC SP + 1 
535b : a2 08 __ LDX #$08
535d : bd cb ab LDA $abcb,x ; (buff + 35)
5360 : 95 53 __ STA T1 + 0,x 
5362 : ca __ __ DEX
5363 : 10 f8 __ BPL $535d ; (menu_pulldown.s1001 + 13)
5365 : 60 __ __ RTS
.s51:
5366 : c9 9d __ CMP #$9d
5368 : f0 03 __ BEQ $536d ; (menu_pulldown.s21 + 0)
536a : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s21:
536d : a5 53 __ LDA T1 + 0 
536f : d0 03 __ BNE $5374 ; (menu_pulldown.s22 + 0)
5371 : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s22:
5374 : a9 12 __ LDA #$12
5376 : d0 cf __ BNE $5347 ; (menu_pulldown.s1047 + 0)
.s29:
5378 : a9 00 __ LDA #$00
537a : a0 02 __ LDY #$02
537c : 91 23 __ STA (SP + 0),y 
537e : a9 5d __ LDA #$5d
5380 : c8 __ __ INY
5381 : 91 23 __ STA (SP + 0),y 
5383 : a9 11 __ LDA #$11
5385 : c8 __ __ INY
5386 : 91 23 __ STA (SP + 0),y 
5388 : a9 54 __ LDA #$54
538a : c8 __ __ INY
538b : 91 23 __ STA (SP + 0),y 
538d : a5 59 __ LDA T6 + 0 
538f : 0a __ __ ASL
5390 : 2a __ __ ROL
5391 : 2a __ __ ROL
5392 : 2a __ __ ROL
5393 : a8 __ __ TAY
5394 : 29 07 __ AND #$07
5396 : 2a __ __ ROL
5397 : aa __ __ TAX
5398 : 98 __ __ TYA
5399 : 29 f0 __ AND #$f0
539b : 38 __ __ SEC
539c : e9 10 __ SBC #$10
539e : b0 01 __ BCS $53a1 ; (menu_pulldown.s1055 + 0)
.s1054:
53a0 : ca __ __ DEX
.s1055:
53a1 : 18 __ __ CLC
53a2 : 65 54 __ ADC T2 + 0 
53a4 : a0 06 __ LDY #$06
53a6 : 91 23 __ STA (SP + 0),y 
53a8 : 8a __ __ TXA
53a9 : 65 55 __ ADC T2 + 1 
53ab : c8 __ __ INY
53ac : 91 23 __ STA (SP + 0),y 
53ae : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
53b1 : a9 00 __ LDA #$00
53b3 : 85 11 __ STA P4 
53b5 : a9 5d __ LDA #$5d
53b7 : 85 12 __ STA P5 
53b9 : a9 c6 __ LDA #$c6
53bb : 85 13 __ STA P6 
53bd : ad fb ab LDA $abfb ; (sstack + 5)
53c0 : 85 0f __ STA P2 
53c2 : 18 __ __ CLC
53c3 : a5 59 __ LDA T6 + 0 
53c5 : 65 56 __ ADC T3 + 0 
53c7 : 38 __ __ SEC
53c8 : e9 01 __ SBC #$01
53ca : 85 10 __ STA P3 
53cc : 20 3f 32 JSR $323f ; (vdc_prints_attr.s0 + 0)
53cf : a5 5a __ LDA T8 + 0 
53d1 : c9 91 __ CMP #$91
53d3 : d0 0e __ BNE $53e3 ; (menu_pulldown.s31 + 0)
.s30:
53d5 : c6 59 __ DEC T6 + 0 
53d7 : f0 03 __ BEQ $53dc ; (menu_pulldown.s33 + 0)
53d9 : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s33:
53dc : a5 57 __ LDA T4 + 0 
.s1046:
53de : 85 59 __ STA T6 + 0 
53e0 : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s31:
53e3 : e6 59 __ INC T6 + 0 
53e5 : a5 57 __ LDA T4 + 0 
53e7 : c5 59 __ CMP T6 + 0 
53e9 : 90 03 __ BCC $53ee ; (menu_pulldown.s36 + 0)
53eb : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s36:
53ee : a9 01 __ LDA #$01
53f0 : 90 ec __ BCC $53de ; (menu_pulldown.s1046 + 0)
.s44:
53f2 : c9 0d __ CMP #$0d
53f4 : d0 03 __ BNE $53f9 ; (menu_pulldown.s45 + 0)
53f6 : 4c 49 53 JMP $5349 ; (menu_pulldown.s6 + 0)
.s45:
53f9 : b0 0c __ BCS $5407 ; (menu_pulldown.s46 + 0)
.s47:
53fb : c9 03 __ CMP #$03
53fd : f0 03 __ BEQ $5402 ; (menu_pulldown.s16 + 0)
53ff : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
.s16:
5402 : a9 00 __ LDA #$00
5404 : 4c 47 53 JMP $5347 ; (menu_pulldown.s1047 + 0)
.s46:
5407 : c9 11 __ CMP #$11
5409 : d0 03 __ BNE $540e ; (menu_pulldown.s46 + 7)
540b : 4c 78 53 JMP $5378 ; (menu_pulldown.s29 + 0)
540e : 4c 9b 52 JMP $529b ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
5411 : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
5416 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
541c : __ __ __ BYT 75 4e 44 4f 3a 20 25 53 00                      : uNDO: %S.
--------------------------------------------------------------------
5425 : __ __ __ BYT 65 4e 41 42 4c 45 44 20 20 00                   : eNABLED  .
--------------------------------------------------------------------
542f : __ __ __ BYT 64 49 53 41 42 4c 45 44 20 00                   : dISABLED .
--------------------------------------------------------------------
restorealtcharset: ; restorealtcharset()->void
.s0:
5439 : ad fd 57 LDA $57fd ; (charsetchanged + 1)
543c : c9 01 __ CMP #$01
543e : f0 01 __ BEQ $5441 ; (restorealtcharset.s1 + 0)
.s1001:
5440 : 60 __ __ RTS
.s1:
5441 : a9 7f __ LDA #$7f
5443 : 85 11 __ STA P4 
5445 : a9 01 __ LDA #$01
5447 : 85 15 __ STA P8 
5449 : ad 27 5c LDA $5c27 ; (vdc_state + 18)
544c : 85 0f __ STA P2 
544e : ad 28 5c LDA $5c28 ; (vdc_state + 19)
5451 : 85 10 __ STA P3 
5453 : a9 00 __ LDA #$00
5455 : 85 14 __ STA P7 
5457 : 85 12 __ STA P5 
5459 : 4c 00 13 JMP $1300 ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
togglestatusbar: ; togglestatusbar()->void
.s0:
545c : ac 1a 5c LDY $5c1a ; (vdc_state + 5)
545f : 88 __ __ DEY
5460 : ad f1 5b LDA $5bf1 ; (screen_row + 1)
5463 : d0 05 __ BNE $546a ; (togglestatusbar.s3 + 0)
.s1002:
5465 : cc f0 5b CPY $5bf0 ; (screen_row + 0)
5468 : f0 15 __ BEQ $547f ; (togglestatusbar.s1001 + 0)
.s3:
546a : ad fe 5b LDA $5bfe ; (showbar + 0)
546d : d0 08 __ BNE $5477 ; (togglestatusbar.s5 + 0)
.s6:
546f : a9 01 __ LDA #$01
5471 : 8d fe 5b STA $5bfe ; (showbar + 0)
5474 : 4c 8f 3b JMP $3b8f ; (initstatusbar.s1000 + 0)
.s5:
5477 : a9 00 __ LDA #$00
5479 : 8d fe 5b STA $5bfe ; (showbar + 0)
547c : 4c 06 58 JMP $5806 ; (vdcwin_cpy_viewport@proxy + 0)
.s1001:
547f : 60 __ __ RTS
--------------------------------------------------------------------
helpscreen_load: ; helpscreen_load(u8)->void
.s1000:
5480 : a5 53 __ LDA T0 + 0 
5482 : 8d d0 ab STA $abd0 ; (buff + 40)
5485 : 38 __ __ SEC
5486 : a5 23 __ LDA SP + 0 
5488 : e9 08 __ SBC #$08
548a : 85 23 __ STA SP + 0 
548c : b0 02 __ BCS $5490 ; (helpscreen_load.s0 + 0)
548e : c6 24 __ DEC SP + 1 
.s0:
5490 : ad fd 57 LDA $57fd ; (charsetchanged + 1)
5493 : c9 01 __ CMP #$01
5495 : d0 1b __ BNE $54b2 ; (helpscreen_load.s3 + 0)
.s1:
5497 : a9 7f __ LDA #$7f
5499 : 85 11 __ STA P4 
549b : a9 01 __ LDA #$01
549d : 85 15 __ STA P8 
549f : ad 27 5c LDA $5c27 ; (vdc_state + 18)
54a2 : 85 0f __ STA P2 
54a4 : ad 28 5c LDA $5c28 ; (vdc_state + 19)
54a7 : 85 10 __ STA P3 
54a9 : a9 00 __ LDA #$00
54ab : 85 14 __ STA P7 
54ad : 85 12 __ STA P5 
54af : 20 6d 15 JSR $156d ; (bnk_redef_charset@proxy + 0)
.s3:
54b2 : ad 17 5c LDA $5c17 ; (vdc_state + 2)
54b5 : 85 53 __ STA T0 + 0 
54b7 : a9 1a __ LDA #$1a
54b9 : 8d 00 d6 STA $d600 
.l138:
54bc : 2c 00 d6 BIT $d600 
54bf : 10 fb __ BPL $54bc ; (helpscreen_load.l138 + 0)
.s10:
54c1 : ad 01 d6 LDA $d601 
54c4 : 29 f0 __ AND #$f0
54c6 : a2 1a __ LDX #$1a
54c8 : 8e 00 d6 STX $d600 
.l140:
54cb : 2c 00 d6 BIT $d600 
54ce : 10 fb __ BPL $54cb ; (helpscreen_load.l140 + 0)
.s16:
54d0 : 8d 01 d6 STA $d601 
54d3 : a5 53 __ LDA T0 + 0 
54d5 : f0 03 __ BEQ $54da ; (helpscreen_load.s19 + 0)
.s17:
54d7 : 20 0e 2f JSR $2f0e ; (vdc_set_mode@proxy + 0)
.s19:
54da : a9 01 __ LDA #$01
54dc : a0 06 __ LDY #$06
54de : 91 23 __ STA (SP + 0),y 
54e0 : a9 00 __ LDA #$00
54e2 : c8 __ __ INY
54e3 : 91 23 __ STA (SP + 0),y 
54e5 : a9 51 __ LDA #$51
54e7 : a0 02 __ LDY #$02
54e9 : 91 23 __ STA (SP + 0),y 
54eb : a9 5d __ LDA #$5d
54ed : c8 __ __ INY
54ee : 91 23 __ STA (SP + 0),y 
54f0 : a9 b0 __ LDA #$b0
54f2 : c8 __ __ INY
54f3 : 91 23 __ STA (SP + 0),y 
54f5 : a9 55 __ LDA #$55
54f7 : c8 __ __ INY
54f8 : 91 23 __ STA (SP + 0),y 
54fa : 20 d7 2b JSR $2bd7 ; (sprintf.s0 + 0)
54fd : a9 01 __ LDA #$01
54ff : 85 10 __ STA P3 
5501 : a9 51 __ LDA #$51
5503 : 85 13 __ STA P6 
5505 : a9 5d __ LDA #$5d
5507 : 85 14 __ STA P7 
5509 : ad fb 57 LDA $57fb ; (bootdevice + 0)
550c : 85 0f __ STA P2 
550e : a9 20 __ LDA #$20
5510 : 85 12 __ STA P5 
5512 : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
5515 : a5 1b __ LDA ACCU + 0 
5517 : d0 06 __ BNE $551f ; (helpscreen_load.s20 + 0)
.s21:
5519 : 20 bb 55 JSR $55bb ; (menu_messagepopup.s0 + 0)
551c : 4c 26 55 JMP $5526 ; (helpscreen_load.s144 + 0)
.s20:
551f : a9 20 __ LDA #$20
5521 : 85 13 __ STA P6 
5523 : 20 26 15 JSR $1526 ; (bnk_cpytovdc@proxy + 0)
.s144:
5526 : 20 ac 2e JSR $2eac ; (getch.s0 + 0)
5529 : a5 53 __ LDA T0 + 0 
552b : f0 05 __ BEQ $5532 ; (helpscreen_load.s25 + 0)
.s23:
552d : 85 16 __ STA P9 
552f : 20 12 2f JSR $2f12 ; (vdc_set_mode.s0 + 0)
.s25:
5532 : a9 1a __ LDA #$1a
5534 : 8d 00 d6 STA $d600 
.l145:
5537 : 2c 00 d6 BIT $d600 
553a : 10 fb __ BPL $5537 ; (helpscreen_load.l145 + 0)
.s32:
553c : ad 01 d6 LDA $d601 
553f : 29 f0 __ AND #$f0
5541 : 18 __ __ CLC
5542 : 6d ff 57 ADC $57ff ; (screenbackground + 0)
5545 : a2 1a __ LDX #$1a
5547 : 8e 00 d6 STX $d600 
.l147:
554a : 2c 00 d6 BIT $d600 
554d : 10 fb __ BPL $554a ; (helpscreen_load.l147 + 0)
.s38:
554f : 8d 01 d6 STA $d601 
5552 : 20 06 58 JSR $5806 ; (vdcwin_cpy_viewport@proxy + 0)
5555 : ad fe 5b LDA $5bfe ; (showbar + 0)
5558 : f0 03 __ BEQ $555d ; (helpscreen_load.s42 + 0)
.s39:
555a : 20 8f 3b JSR $3b8f ; (initstatusbar.s1000 + 0)
.s42:
555d : ad fd 5a LDA $5afd ; (screen_col + 0)
5560 : 8d 0f 5c STA $5c0f ; (canvas + 15)
5563 : 85 0e __ STA P1 
5565 : ad f0 5b LDA $5bf0 ; (screen_row + 0)
5568 : 8d 10 5c STA $5c10 ; (canvas + 16)
556b : 85 0d __ STA P0 
556d : ad ff 5a LDA $5aff ; (plotscreencode + 0)
5570 : 85 0f __ STA P2 
5572 : ad 1c 5c LDA $5c1c ; (vdc_state + 7)
5575 : 85 10 __ STA P3 
5577 : 20 6d 37 JSR $376d ; (vdc_printc.s0 + 0)
557a : 20 09 3b JSR $3b09 ; (vdcwin_cursor_show@proxy + 0)
557d : ad fd 57 LDA $57fd ; (charsetchanged + 1)
5580 : c9 01 __ CMP #$01
5582 : d0 1b __ BNE $559f ; (helpscreen_load.s1001 + 0)
.s46:
5584 : a9 7f __ LDA #$7f
5586 : 85 11 __ STA P4 
5588 : a9 01 __ LDA #$01
558a : 85 15 __ STA P8 
558c : ad 27 5c LDA $5c27 ; (vdc_state + 18)
558f : 85 0f __ STA P2 
5591 : ad 28 5c LDA $5c28 ; (vdc_state + 19)
5594 : 85 10 __ STA P3 
5596 : a9 00 __ LDA #$00
5598 : 85 14 __ STA P7 
559a : 85 12 __ STA P5 
559c : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
.s1001:
559f : 18 __ __ CLC
55a0 : a5 23 __ LDA SP + 0 
55a2 : 69 08 __ ADC #$08
55a4 : 85 23 __ STA SP + 0 
55a6 : 90 02 __ BCC $55aa ; (helpscreen_load.s1001 + 11)
55a8 : e6 24 __ INC SP + 1 
55aa : ad d0 ab LDA $abd0 ; (buff + 40)
55ad : 85 53 __ STA T0 + 0 
55af : 60 __ __ RTS
--------------------------------------------------------------------
55b0 : __ __ __ BYT 56 44 43 53 45 48 53 43 25 55 00                : VDCSEHSC%U.
--------------------------------------------------------------------
menu_messagepopup: ; menu_messagepopup(const u8*)->void
.s0:
55bb : a9 f0 __ LDA #$f0
55bd : 85 17 __ STA P10 
55bf : a9 08 __ LDA #$08
55c1 : 85 18 __ STA P11 
55c3 : 8d f6 ab STA $abf6 ; (sstack + 0)
55c6 : a9 1e __ LDA #$1e
55c8 : 8d f7 ab STA $abf7 ; (sstack + 1)
55cb : a9 06 __ LDA #$06
55cd : 8d f8 ab STA $abf8 ; (sstack + 2)
55d0 : ad 1c 5c LDA $5c1c ; (vdc_state + 7)
55d3 : 85 52 __ STA T0 + 0 
55d5 : a9 8d __ LDA #$8d
55d7 : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
55da : 20 e9 33 JSR $33e9 ; (vdcwin_win_new.s1000 + 0)
55dd : a9 00 __ LDA #$00
55df : 85 11 __ STA P4 
55e1 : a9 56 __ LDA #$56
55e3 : 85 12 __ STA P5 
55e5 : 20 32 58 JSR $5832 ; (vdc_prints_attr@proxy + 0)
55e8 : a9 0b __ LDA #$0b
55ea : 85 10 __ STA P3 
55ec : 20 27 58 JSR $5827 ; (vdc_prints_attr@proxy + 0)
55ef : 20 1a 38 JSR $381a ; (vdcwin_getch.s0 + 0)
55f2 : 20 28 38 JSR $3828 ; (vdcwin_win_free.s0 + 0)
55f5 : a5 52 __ LDA T0 + 0 
55f7 : 8d 1c 5c STA $5c1c ; (vdc_state + 7)
.s1001:
55fa : 60 __ __ RTS
--------------------------------------------------------------------
__multab13L:
55fb : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
mc_menupopup:
55ff : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
5600 : __ __ __ BYT 69 4e 53 45 52 54 20 41 50 50 4c 49 43 41 54 49 : iNSERT APPLICATI
5610 : __ __ __ BYT 4f 4e 20 44 49 53 4b 20 54 4f 20 56 49 45 57 20 : ON DISK TO VIEW 
5620 : __ __ __ BYT 48 45 4c 50 2e 00                               : HELP..
--------------------------------------------------------------------
mul16by8: ; mul16by8
5626 : a0 00 __ LDY #$00
5628 : 84 06 __ STY WORK + 3 
562a : 4a __ __ LSR
562b : 90 0d __ BCC $563a ; (mul16by8 + 20)
562d : aa __ __ TAX
562e : 18 __ __ CLC
562f : 98 __ __ TYA
5630 : 65 1b __ ADC ACCU + 0 
5632 : a8 __ __ TAY
5633 : a5 06 __ LDA WORK + 3 
5635 : 65 1c __ ADC ACCU + 1 
5637 : 85 06 __ STA WORK + 3 
5639 : 8a __ __ TXA
563a : 06 1b __ ASL ACCU + 0 
563c : 26 1c __ ROL ACCU + 1 
563e : 4a __ __ LSR
563f : b0 ec __ BCS $562d ; (mul16by8 + 7)
5641 : d0 f7 __ BNE $563a ; (mul16by8 + 20)
5643 : 84 05 __ STY WORK + 2 
5645 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
5646 : a0 00 __ LDY #$00
5648 : 84 06 __ STY WORK + 3 
564a : a5 03 __ LDA WORK + 0 
564c : a6 04 __ LDX WORK + 1 
564e : f0 1c __ BEQ $566c ; (mul16 + 38)
5650 : 38 __ __ SEC
5651 : 6a __ __ ROR
5652 : 90 0d __ BCC $5661 ; (mul16 + 27)
5654 : aa __ __ TAX
5655 : 18 __ __ CLC
5656 : 98 __ __ TYA
5657 : 65 1b __ ADC ACCU + 0 
5659 : a8 __ __ TAY
565a : a5 06 __ LDA WORK + 3 
565c : 65 1c __ ADC ACCU + 1 
565e : 85 06 __ STA WORK + 3 
5660 : 8a __ __ TXA
5661 : 06 1b __ ASL ACCU + 0 
5663 : 26 1c __ ROL ACCU + 1 
5665 : 4a __ __ LSR
5666 : 90 f9 __ BCC $5661 ; (mul16 + 27)
5668 : d0 ea __ BNE $5654 ; (mul16 + 14)
566a : a5 04 __ LDA WORK + 1 
566c : 4a __ __ LSR
566d : 90 0d __ BCC $567c ; (mul16 + 54)
566f : aa __ __ TAX
5670 : 18 __ __ CLC
5671 : 98 __ __ TYA
5672 : 65 1b __ ADC ACCU + 0 
5674 : a8 __ __ TAY
5675 : a5 06 __ LDA WORK + 3 
5677 : 65 1c __ ADC ACCU + 1 
5679 : 85 06 __ STA WORK + 3 
567b : 8a __ __ TXA
567c : 06 1b __ ASL ACCU + 0 
567e : 26 1c __ ROL ACCU + 1 
5680 : 4a __ __ LSR
5681 : b0 ec __ BCS $566f ; (mul16 + 41)
5683 : d0 f7 __ BNE $567c ; (mul16 + 54)
5685 : 84 05 __ STY WORK + 2 
5687 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
5688 : a5 1c __ LDA ACCU + 1 
568a : d0 31 __ BNE $56bd ; (divmod + 53)
568c : a5 04 __ LDA WORK + 1 
568e : d0 1e __ BNE $56ae ; (divmod + 38)
5690 : 85 06 __ STA WORK + 3 
5692 : a2 04 __ LDX #$04
5694 : 06 1b __ ASL ACCU + 0 
5696 : 2a __ __ ROL
5697 : c5 03 __ CMP WORK + 0 
5699 : 90 02 __ BCC $569d ; (divmod + 21)
569b : e5 03 __ SBC WORK + 0 
569d : 26 1b __ ROL ACCU + 0 
569f : 2a __ __ ROL
56a0 : c5 03 __ CMP WORK + 0 
56a2 : 90 02 __ BCC $56a6 ; (divmod + 30)
56a4 : e5 03 __ SBC WORK + 0 
56a6 : 26 1b __ ROL ACCU + 0 
56a8 : ca __ __ DEX
56a9 : d0 eb __ BNE $5696 ; (divmod + 14)
56ab : 85 05 __ STA WORK + 2 
56ad : 60 __ __ RTS
56ae : a5 1b __ LDA ACCU + 0 
56b0 : 85 05 __ STA WORK + 2 
56b2 : a5 1c __ LDA ACCU + 1 
56b4 : 85 06 __ STA WORK + 3 
56b6 : a9 00 __ LDA #$00
56b8 : 85 1b __ STA ACCU + 0 
56ba : 85 1c __ STA ACCU + 1 
56bc : 60 __ __ RTS
56bd : a5 04 __ LDA WORK + 1 
56bf : d0 1f __ BNE $56e0 ; (divmod + 88)
56c1 : a5 03 __ LDA WORK + 0 
56c3 : 30 1b __ BMI $56e0 ; (divmod + 88)
56c5 : a9 00 __ LDA #$00
56c7 : 85 06 __ STA WORK + 3 
56c9 : a2 10 __ LDX #$10
56cb : 06 1b __ ASL ACCU + 0 
56cd : 26 1c __ ROL ACCU + 1 
56cf : 2a __ __ ROL
56d0 : c5 03 __ CMP WORK + 0 
56d2 : 90 02 __ BCC $56d6 ; (divmod + 78)
56d4 : e5 03 __ SBC WORK + 0 
56d6 : 26 1b __ ROL ACCU + 0 
56d8 : 26 1c __ ROL ACCU + 1 
56da : ca __ __ DEX
56db : d0 f2 __ BNE $56cf ; (divmod + 71)
56dd : 85 05 __ STA WORK + 2 
56df : 60 __ __ RTS
56e0 : a9 00 __ LDA #$00
56e2 : 85 05 __ STA WORK + 2 
56e4 : 85 06 __ STA WORK + 3 
56e6 : 84 02 __ STY $02 
56e8 : a0 10 __ LDY #$10
56ea : 18 __ __ CLC
56eb : 26 1b __ ROL ACCU + 0 
56ed : 26 1c __ ROL ACCU + 1 
56ef : 26 05 __ ROL WORK + 2 
56f1 : 26 06 __ ROL WORK + 3 
56f3 : 38 __ __ SEC
56f4 : a5 05 __ LDA WORK + 2 
56f6 : e5 03 __ SBC WORK + 0 
56f8 : aa __ __ TAX
56f9 : a5 06 __ LDA WORK + 3 
56fb : e5 04 __ SBC WORK + 1 
56fd : 90 04 __ BCC $5703 ; (divmod + 123)
56ff : 86 05 __ STX WORK + 2 
5701 : 85 06 __ STA WORK + 3 
5703 : 88 __ __ DEY
5704 : d0 e5 __ BNE $56eb ; (divmod + 99)
5706 : 26 1b __ ROL ACCU + 0 
5708 : 26 1c __ ROL ACCU + 1 
570a : a4 02 __ LDY $02 
570c : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
570d : 84 02 __ STY $02 
570f : a0 20 __ LDY #$20
5711 : a9 00 __ LDA #$00
5713 : 85 07 __ STA WORK + 4 
5715 : 85 08 __ STA WORK + 5 
5717 : 85 09 __ STA WORK + 6 
5719 : 85 0a __ STA WORK + 7 
571b : a5 05 __ LDA WORK + 2 
571d : 05 06 __ ORA WORK + 3 
571f : d0 78 __ BNE $5799 ; (divmod32 + 140)
5721 : a5 04 __ LDA WORK + 1 
5723 : d0 27 __ BNE $574c ; (divmod32 + 63)
5725 : 18 __ __ CLC
5726 : 26 1b __ ROL ACCU + 0 
5728 : 26 1c __ ROL ACCU + 1 
572a : 26 1d __ ROL ACCU + 2 
572c : 26 1e __ ROL ACCU + 3 
572e : 2a __ __ ROL
572f : 90 05 __ BCC $5736 ; (divmod32 + 41)
5731 : e5 03 __ SBC WORK + 0 
5733 : 38 __ __ SEC
5734 : b0 06 __ BCS $573c ; (divmod32 + 47)
5736 : c5 03 __ CMP WORK + 0 
5738 : 90 02 __ BCC $573c ; (divmod32 + 47)
573a : e5 03 __ SBC WORK + 0 
573c : 88 __ __ DEY
573d : d0 e7 __ BNE $5726 ; (divmod32 + 25)
573f : 85 07 __ STA WORK + 4 
5741 : 26 1b __ ROL ACCU + 0 
5743 : 26 1c __ ROL ACCU + 1 
5745 : 26 1d __ ROL ACCU + 2 
5747 : 26 1e __ ROL ACCU + 3 
5749 : a4 02 __ LDY $02 
574b : 60 __ __ RTS
574c : a5 1e __ LDA ACCU + 3 
574e : d0 10 __ BNE $5760 ; (divmod32 + 83)
5750 : a6 1d __ LDX ACCU + 2 
5752 : 86 1e __ STX ACCU + 3 
5754 : a6 1c __ LDX ACCU + 1 
5756 : 86 1d __ STX ACCU + 2 
5758 : a6 1b __ LDX ACCU + 0 
575a : 86 1c __ STX ACCU + 1 
575c : 85 1b __ STA ACCU + 0 
575e : a0 18 __ LDY #$18
5760 : 18 __ __ CLC
5761 : 26 1b __ ROL ACCU + 0 
5763 : 26 1c __ ROL ACCU + 1 
5765 : 26 1d __ ROL ACCU + 2 
5767 : 26 1e __ ROL ACCU + 3 
5769 : 26 07 __ ROL WORK + 4 
576b : 26 08 __ ROL WORK + 5 
576d : 90 0c __ BCC $577b ; (divmod32 + 110)
576f : a5 07 __ LDA WORK + 4 
5771 : e5 03 __ SBC WORK + 0 
5773 : aa __ __ TAX
5774 : a5 08 __ LDA WORK + 5 
5776 : e5 04 __ SBC WORK + 1 
5778 : 38 __ __ SEC
5779 : b0 0c __ BCS $5787 ; (divmod32 + 122)
577b : 38 __ __ SEC
577c : a5 07 __ LDA WORK + 4 
577e : e5 03 __ SBC WORK + 0 
5780 : aa __ __ TAX
5781 : a5 08 __ LDA WORK + 5 
5783 : e5 04 __ SBC WORK + 1 
5785 : 90 04 __ BCC $578b ; (divmod32 + 126)
5787 : 86 07 __ STX WORK + 4 
5789 : 85 08 __ STA WORK + 5 
578b : 88 __ __ DEY
578c : d0 d3 __ BNE $5761 ; (divmod32 + 84)
578e : 26 1b __ ROL ACCU + 0 
5790 : 26 1c __ ROL ACCU + 1 
5792 : 26 1d __ ROL ACCU + 2 
5794 : 26 1e __ ROL ACCU + 3 
5796 : a4 02 __ LDY $02 
5798 : 60 __ __ RTS
5799 : a0 10 __ LDY #$10
579b : a5 1e __ LDA ACCU + 3 
579d : 85 08 __ STA WORK + 5 
579f : a5 1d __ LDA ACCU + 2 
57a1 : 85 07 __ STA WORK + 4 
57a3 : a9 00 __ LDA #$00
57a5 : 85 1d __ STA ACCU + 2 
57a7 : 85 1e __ STA ACCU + 3 
57a9 : 18 __ __ CLC
57aa : 26 1b __ ROL ACCU + 0 
57ac : 26 1c __ ROL ACCU + 1 
57ae : 26 07 __ ROL WORK + 4 
57b0 : 26 08 __ ROL WORK + 5 
57b2 : 26 09 __ ROL WORK + 6 
57b4 : 26 0a __ ROL WORK + 7 
57b6 : a5 07 __ LDA WORK + 4 
57b8 : c5 03 __ CMP WORK + 0 
57ba : a5 08 __ LDA WORK + 5 
57bc : e5 04 __ SBC WORK + 1 
57be : a5 09 __ LDA WORK + 6 
57c0 : e5 05 __ SBC WORK + 2 
57c2 : a5 0a __ LDA WORK + 7 
57c4 : e5 06 __ SBC WORK + 3 
57c6 : 90 18 __ BCC $57e0 ; (divmod32 + 211)
57c8 : a5 07 __ LDA WORK + 4 
57ca : e5 03 __ SBC WORK + 0 
57cc : 85 07 __ STA WORK + 4 
57ce : a5 08 __ LDA WORK + 5 
57d0 : e5 04 __ SBC WORK + 1 
57d2 : 85 08 __ STA WORK + 5 
57d4 : a5 09 __ LDA WORK + 6 
57d6 : e5 05 __ SBC WORK + 2 
57d8 : 85 09 __ STA WORK + 6 
57da : a5 0a __ LDA WORK + 7 
57dc : e5 06 __ SBC WORK + 3 
57de : 85 0a __ STA WORK + 7 
57e0 : 88 __ __ DEY
57e1 : d0 c7 __ BNE $57aa ; (divmod32 + 157)
57e3 : 26 1b __ ROL ACCU + 0 
57e5 : 26 1c __ ROL ACCU + 1 
57e7 : a4 02 __ LDY $02 
57e9 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
57ea : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab12L:
57f0 : __ __ __ BYT 00 0c 18 24 30                                  : ...$0
--------------------------------------------------------------------
__multab96L:
57f5 : __ __ __ BYT 00 60 c0 20 80 e0                               : .`. ..
--------------------------------------------------------------------
bootdevice:
57fb : __ __ __ BSS	1
--------------------------------------------------------------------
charsetchanged:
57fc : __ __ __ BSS	2
--------------------------------------------------------------------
appexit:
57fe : __ __ __ BSS	1
--------------------------------------------------------------------
screenbackground:
57ff : __ __ __ BSS	1
--------------------------------------------------------------------
__multab96H:
5800 : __ __ __ BYT 00 00 00 01 01 01                               : ......
--------------------------------------------------------------------
vdcwin_cpy_viewport@proxy: ; vdcwin_cpy_viewport@proxy
5806 : a9 00 __ LDA #$00
5808 : 85 16 __ STA P9 
580a : a9 5c __ LDA #$5c
580c : 85 17 __ STA P10 
580e : 4c 14 42 JMP $4214 ; (vdcwin_cpy_viewport.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
5811 : a5 4c __ LDA $4c 
5813 : 85 11 __ STA P4 
5815 : a5 4d __ LDA $4d 
5817 : 85 12 __ STA P5 
5819 : 4c 62 44 JMP $4462 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
581c : a5 53 __ LDA $53 
581e : 85 11 __ STA P4 
5820 : a5 54 __ LDA $54 
5822 : 85 12 __ STA P5 
5824 : 4c 62 44 JMP $4462 ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
5827 : a9 0f __ LDA #$0f
5829 : 85 11 __ STA P4 
582b : a9 38 __ LDA #$38
582d : 85 12 __ STA P5 
582f : 4c 3f 32 JMP $323f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
5832 : a9 0a __ LDA #$0a
5834 : 85 0f __ STA P2 
5836 : a9 09 __ LDA #$09
5838 : 85 10 __ STA P3 
583a : a9 8d __ LDA #$8d
583c : 85 13 __ STA P6 
583e : 4c 3f 32 JMP $323f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
5841 : a5 4e __ LDA $4e 
5843 : 85 10 __ STA P3 
5845 : a9 51 __ LDA #$51
5847 : 85 11 __ STA P4 
5849 : a9 5d __ LDA #$5d
584b : 85 12 __ STA P5 
584d : a5 51 __ LDA $51 
584f : 85 13 __ STA P6 
5851 : 4c 3f 32 JMP $323f ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
5854 : a5 44 __ LDA $44 
5856 : 85 0e __ STA P1 
5858 : 4c 5d 2e JMP $2e5d ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
585b : a9 db __ LDA #$db
585d : 85 0d __ STA P0 
585f : a9 ab __ LDA #$ab
5861 : 85 0e __ STA P1 
5863 : ad 0b 5c LDA $5c0b ; (canvas + 11)
5866 : 85 0f __ STA P2 
5868 : ad 0c 5c LDA $5c0c ; (canvas + 12)
586b : 85 10 __ STA P3 
586d : 4c 6e 2b JMP $2b6e ; (vdcwin_init.s0 + 0)
--------------------------------------------------------------------
pulldown_titles:
5870 : __ __ __ BYT 77 49 44 54 48 3a 20 20 20 20 20 20 38 30 20 00 : wIDTH:      80 .
5880 : __ __ __ BYT 68 45 49 47 48 54 3a 20 20 20 20 20 32 35 20 00 : hEIGHT:     25 .
5890 : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 3a 20 20 30 20 00 : bACKGROUND:  0 .
58a0 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 20 20 20 20 20 00 : sCREENMODE     .
58b0 : __ __ __ BYT 63 4c 45 41 52 20 20 20 20 20 20 20 20 20 20 00 : cLEAR          .
58c0 : __ __ __ BYT 66 49 4c 4c 20 20 20 20 20 20 20 20 20 20 20 00 : fILL           .
58d0 : __ __ __ BYT 73 41 56 45 20 53 43 52 45 45 4e 20 20 20 20 00 : sAVE SCREEN    .
58e0 : __ __ __ BYT 6c 4f 41 44 20 53 43 52 45 45 4e 20 20 20 20 00 : lOAD SCREEN    .
58f0 : __ __ __ BYT 73 41 56 45 20 50 52 4f 4a 45 43 54 20 20 20 00 : sAVE PROJECT   .
5900 : __ __ __ BYT 6c 4f 41 44 20 50 52 4f 4a 45 43 54 20 20 20 00 : lOAD PROJECT   .
5910 : __ __ __ BYT 69 4d 50 4f 52 54 20 20 20 20 20 20 20 20 20 00 : iMPORT         .
5920 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5930 : __ __ __ BYT 6c 4f 41 44 20 53 54 41 4e 44 41 52 44 20 20 00 : lOAD STANDARD  .
5940 : __ __ __ BYT 6c 4f 41 44 20 41 4c 54 45 52 4e 41 54 45 20 00 : lOAD ALTERNATE .
5950 : __ __ __ BYT 73 41 56 45 20 53 54 41 4e 44 41 52 44 20 20 00 : sAVE STANDARD  .
5960 : __ __ __ BYT 73 41 56 45 20 41 4c 54 45 52 4e 41 54 45 20 00 : sAVE ALTERNATE .
5970 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5980 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5990 : __ __ __ BYT 76 45 52 53 49 4f 4e 2f 43 52 45 44 49 54 53 00 : vERSION/CREDITS.
59a0 : __ __ __ BYT 65 58 49 54 20 50 52 4f 47 52 41 4d 20 20 20 00 : eXIT PROGRAM   .
59b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59f0 : __ __ __ BYT 79 45 53 00 00 00 00 00 00 00 00 00 00 00 00 00 : yES.............
5a00 : __ __ __ BYT 6e 4f 20 00 00 00 00 00 00 00 00 00 00 00 00 00 : nO .............
5a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a50 : __ __ __ BYT 70 61 6c 20 20 38 30 58 32 35 00 00 00 00 00 00 : pal  80X25......
5a60 : __ __ __ BYT 70 61 6c 20 20 38 30 58 35 30 00 00 00 00 00 00 : pal  80X50......
5a70 : __ __ __ BYT 70 61 6c 20 20 38 30 58 37 30 00 00 00 00 00 00 : pal  80X70......
5a80 : __ __ __ BYT 6e 74 73 63 20 38 30 58 32 35 00 00 00 00 00 00 : ntsc 80X25......
5a90 : __ __ __ BYT 6e 74 73 63 20 38 30 58 35 30 00 00 00 00 00 00 : ntsc 80X50......
5aa0 : __ __ __ BYT 6e 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 : ntsc 80X60......
--------------------------------------------------------------------
pulldown_options:
5ab0 : __ __ __ BYT 06 05 04 02 02 00                               : ......
--------------------------------------------------------------------
winStyles:
5ab6 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
5ac6 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
5ac8 : __ __ __ BYT 73 43 52 45 45 4e 00 00 00 00 00 00 66 49 4c 45 : sCREEN......fILE
5ad8 : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 00 : ........cHARSET.
5ae8 : __ __ __ BYT 00 00 00 00 69 4e 46 4f 52 4d 41 54 49 4f 4e 00 : ....iNFORMATION.
5af8 : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
screen_col:
5afd : __ __ __ BSS	2
--------------------------------------------------------------------
plotscreencode:
5aff : __ __ __ BSS	1
--------------------------------------------------------------------
vdc_modes:
5b00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
5b10 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
5b20 : __ __ __ BYT e7 24 7e ff 50 00 32 00 00 00 00 00 10 00 40 00 : .$~.P.2.......@.
5b30 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
5b40 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
5b50 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
5b60 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
5b70 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
5b80 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
5b90 : __ __ __ BYT 50 00 32 00 00 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
5ba0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
5bb0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
5bc0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
5bd0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
winCfg:
5bd8 : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
5be0 : __ __ __ BSS	16
--------------------------------------------------------------------
screen_row:
5bf0 : __ __ __ BSS	2
--------------------------------------------------------------------
screentotal:
5bf2 : __ __ __ BSS	2
--------------------------------------------------------------------
plotcolor:
5bf4 : __ __ __ BSS	1
--------------------------------------------------------------------
plotreverse:
5bf5 : __ __ __ BSS	1
--------------------------------------------------------------------
plotunderline:
5bf6 : __ __ __ BSS	1
--------------------------------------------------------------------
plotblink:
5bf7 : __ __ __ BSS	1
--------------------------------------------------------------------
plotaltchar:
5bf8 : __ __ __ BSS	1
--------------------------------------------------------------------
undoaddress:
5bf9 : __ __ __ BSS	2
--------------------------------------------------------------------
undonumber:
5bfb : __ __ __ BSS	1
--------------------------------------------------------------------
undo_undopossible:
5bfc : __ __ __ BSS	1
--------------------------------------------------------------------
undo_redopossible:
5bfd : __ __ __ BSS	1
--------------------------------------------------------------------
showbar:
5bfe : __ __ __ BSS	1
--------------------------------------------------------------------
canvas:
5c00 : __ __ __ BSS	21
--------------------------------------------------------------------
vdc_state:
5c15 : __ __ __ BSS	25
--------------------------------------------------------------------
multab:
5c2e : __ __ __ BSS	144
--------------------------------------------------------------------
windows:
5cbe : __ __ __ BSS	39
--------------------------------------------------------------------
programmode:
5ce5 : __ __ __ BSS	11
--------------------------------------------------------------------
linebuffer:
5d00 : __ __ __ BSS	81
--------------------------------------------------------------------
buffer:
5d51 : __ __ __ BSS	81
--------------------------------------------------------------------
Undo:
5da2 : __ __ __ BSS	287
--------------------------------------------------------------------
favourites:
5ec1 : __ __ __ BSS	20
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:1300 : a9 50 __ LDA #$50
01:1302 : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,u8*,u16)->void
.s0:
01:1304 : ad 00 ff LDA $ff00 
01:1307 : 85 43 __ STA T0 + 0 
01:1309 : a9 0e __ LDA #$0e
01:130b : 8d 00 ff STA $ff00 
01:130e : 20 55 2e JSR $2e55 ; (vdc_mem_addr@proxy + 0)
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
01:135f : a9 00 __ LDA #$00
01:1361 : 85 11 __ STA P4 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1363 : a9 00 __ LDA #$00
01:1365 : 85 0e __ STA P1 
01:1367 : a5 10 __ LDA P3 ; (bank + 0)
01:1369 : 85 0d __ STA P0 
01:136b : 20 a9 2a JSR $2aa9 ; (krnio_setbnk.s0 + 0)
01:136e : a5 13 __ LDA P6 ; (fname + 0)
01:1370 : 85 0d __ STA P0 
01:1372 : a5 14 __ LDA P7 ; (fname + 1)
01:1374 : 85 0e __ STA P1 
01:1376 : 20 b0 2a JSR $2ab0 ; (krnio_setnam.s0 + 0)
01:1379 : a9 01 __ LDA #$01
01:137b : a6 0f __ LDX P2 
01:137d : a0 00 __ LDY #$00
01:137f : 20 ba ff JSR $ffba 
01:1382 : a9 00 __ LDA #$00
01:1384 : a6 11 __ LDX P4 
01:1386 : a4 12 __ LDY P5 
01:1388 : 20 d5 ff JSR $ffd5 
01:138b : a9 00 __ LDA #$00
01:138d : b0 02 __ BCS $1391 ; (bnk_load.s0 + 46)
01:138f : a9 01 __ LDA #$01
01:1391 : 85 1b __ STA ACCU + 0 
.s1001:
01:1393 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1394 : a9 0e __ LDA #$0e
01:1396 : 85 11 __ STA P4 
01:1398 : a9 00 __ LDA #$00
01:139a : 85 12 __ STA P5 
01:139c : a9 5d __ LDA #$5d
01:139e : 85 13 __ STA P6 
01:13a0 : a5 47 __ LDA $47 
01:13a2 : 85 14 __ STA P7 
01:13a4 : a9 00 __ LDA #$00
01:13a6 : 85 15 __ STA P8 
--------------------------------------------------------------------
bnk_cpytovdc: ; bnk_cpytovdc(u16,u8,u8*,u16)->void
.s0:
01:13a8 : ad 00 ff LDA $ff00 
01:13ab : 85 43 __ STA T0 + 0 
01:13ad : a9 0e __ LDA #$0e
01:13af : 8d 00 ff STA $ff00 
01:13b2 : 20 55 2e JSR $2e55 ; (vdc_mem_addr@proxy + 0)
01:13b5 : a5 14 __ LDA P7 ; (size + 0)
01:13b7 : 05 15 __ ORA P8 ; (size + 1)
01:13b9 : d0 06 __ BNE $13c1 ; (bnk_cpytovdc.s1008 + 0)
.s3:
01:13bb : a5 43 __ LDA T0 + 0 
01:13bd : 8d 00 ff STA $ff00 
.s1001:
01:13c0 : 60 __ __ RTS
.s1008:
01:13c1 : a6 14 __ LDX P7 ; (size + 0)
.l2:
01:13c3 : a5 11 __ LDA P4 ; (scr + 0)
01:13c5 : 8d 00 ff STA $ff00 
01:13c8 : a0 00 __ LDY #$00
01:13ca : b1 12 __ LDA (P5),y ; (sp + 0)
01:13cc : a8 __ __ TAY
01:13cd : e6 12 __ INC P5 ; (sp + 0)
01:13cf : d0 02 __ BNE $13d3 ; (bnk_cpytovdc.s1010 + 0)
.s1009:
01:13d1 : e6 13 __ INC P6 ; (sp + 1)
.s1010:
01:13d3 : a9 0e __ LDA #$0e
01:13d5 : 8d 00 ff STA $ff00 
.l52:
01:13d8 : 2c 00 d6 BIT $d600 
01:13db : 10 fb __ BPL $13d8 ; (bnk_cpytovdc.l52 + 0)
.s6:
01:13dd : 8c 01 d6 STY $d601 
01:13e0 : 8a __ __ TXA
01:13e1 : d0 02 __ BNE $13e5 ; (bnk_cpytovdc.s1005 + 0)
.s1004:
01:13e3 : c6 15 __ DEC P8 ; (size + 1)
.s1005:
01:13e5 : ca __ __ DEX
01:13e6 : d0 db __ BNE $13c3 ; (bnk_cpytovdc.l2 + 0)
.s1006:
01:13e8 : a5 15 __ LDA P8 ; (size + 1)
01:13ea : d0 d7 __ BNE $13c3 ; (bnk_cpytovdc.l2 + 0)
01:13ec : 4c bb 13 JMP $13bb ; (bnk_cpytovdc.s3 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:13ef : a9 0e __ LDA #$0e
01:13f1 : 85 0d __ STA P0 
01:13f3 : a9 00 __ LDA #$00
01:13f5 : 85 0e __ STA P1 
01:13f7 : a9 5d __ LDA #$5d
01:13f9 : 85 0f __ STA P2 
01:13fb : a5 47 __ LDA $47 
01:13fd : 85 12 __ STA P5 
01:13ff : a9 00 __ LDA #$00
01:1401 : 85 13 __ STA P6 
--------------------------------------------------------------------
bnk_cpyfromvdc: ; bnk_cpyfromvdc(u8,u8*,u16,u16)->void
.s0:
01:1403 : ad 00 ff LDA $ff00 
01:1406 : 85 1d __ STA ACCU + 2 
01:1408 : a6 12 __ LDX P5 ; (size + 0)
.l110:
01:140a : 8a __ __ TXA
01:140b : 05 13 __ ORA P6 ; (size + 1)
01:140d : d0 06 __ BNE $1415 ; (bnk_cpyfromvdc.s2 + 0)
.s3:
01:140f : a5 1d __ LDA ACCU + 2 
01:1411 : 8d 00 ff STA $ff00 
.s1001:
01:1414 : 60 __ __ RTS
.s2:
01:1415 : a9 0e __ LDA #$0e
01:1417 : 8d 00 ff STA $ff00 
01:141a : a5 10 __ LDA P3 ; (vdcsrc + 0)
01:141c : a8 __ __ TAY
01:141d : 18 __ __ CLC
01:141e : 69 01 __ ADC #$01
01:1420 : 85 10 __ STA P3 ; (vdcsrc + 0)
01:1422 : a5 11 __ LDA P4 ; (vdcsrc + 1)
01:1424 : 85 1b __ STA ACCU + 0 
01:1426 : 69 00 __ ADC #$00
01:1428 : 85 11 __ STA P4 ; (vdcsrc + 1)
01:142a : a9 12 __ LDA #$12
01:142c : 8d 00 d6 STA $d600 
.l111:
01:142f : 2c 00 d6 BIT $d600 
01:1432 : 10 fb __ BPL $142f ; (bnk_cpyfromvdc.l111 + 0)
.s10:
01:1434 : a5 1b __ LDA ACCU + 0 
01:1436 : 8d 01 d6 STA $d601 
01:1439 : a9 13 __ LDA #$13
01:143b : 8d 00 d6 STA $d600 
.l113:
01:143e : 2c 00 d6 BIT $d600 
01:1441 : 10 fb __ BPL $143e ; (bnk_cpyfromvdc.l113 + 0)
.s15:
01:1443 : 8c 01 d6 STY $d601 
01:1446 : a9 1f __ LDA #$1f
01:1448 : 8d 00 d6 STA $d600 
.l115:
01:144b : 2c 00 d6 BIT $d600 
01:144e : 10 fb __ BPL $144b ; (bnk_cpyfromvdc.l115 + 0)
.s19:
01:1450 : a5 0d __ LDA P0 ; (dcr + 0)
01:1452 : ac 01 d6 LDY $d601 
01:1455 : 8d 00 ff STA $ff00 
01:1458 : a5 0e __ LDA P1 ; (dp + 0)
01:145a : 85 1b __ STA ACCU + 0 
01:145c : 18 __ __ CLC
01:145d : 69 01 __ ADC #$01
01:145f : 85 0e __ STA P1 ; (dp + 0)
01:1461 : a5 0f __ LDA P2 ; (dp + 1)
01:1463 : 85 1c __ STA ACCU + 1 
01:1465 : 69 00 __ ADC #$00
01:1467 : 85 0f __ STA P2 ; (dp + 1)
01:1469 : 98 __ __ TYA
01:146a : a0 00 __ LDY #$00
01:146c : 91 1b __ STA (ACCU + 0),y 
01:146e : a9 0e __ LDA #$0e
01:1470 : 8d 00 ff STA $ff00 
01:1473 : ca __ __ DEX
01:1474 : e0 ff __ CPX #$ff
01:1476 : d0 92 __ BNE $140a ; (bnk_cpyfromvdc.l110 + 0)
.s1008:
01:1478 : c6 13 __ DEC P6 ; (size + 1)
01:147a : 4c 0a 14 JMP $140a ; (bnk_cpyfromvdc.l110 + 0)
--------------------------------------------------------------------
bnk_memcpy: ; bnk_memcpy(u8,u8*,u8,u8*,u16)->void
.s0:
01:147d : a9 00 __ LDA #$00
01:147f : 85 43 __ STA T1 + 0 
01:1481 : 85 45 __ STA T2 + 0 
01:1483 : a9 08 __ LDA #$08
01:1485 : 85 1c __ STA ACCU + 1 
01:1487 : a9 40 __ LDA #$40
01:1489 : 85 44 __ STA T1 + 1 
01:148b : a9 50 __ LDA #$50
01:148d : 85 46 __ STA T2 + 1 
01:148f : ad 00 ff LDA $ff00 
01:1492 : 85 1b __ STA ACCU + 0 
01:1494 : a0 00 __ LDY #$00
.l1002:
01:1496 : a2 00 __ LDX #$00
.l1006:
01:1498 : a9 7f __ LDA #$7f
01:149a : 8d 00 ff STA $ff00 
01:149d : b1 43 __ LDA (T1 + 0),y 
01:149f : 85 1d __ STA ACCU + 2 
01:14a1 : a9 7f __ LDA #$7f
01:14a3 : 8d 00 ff STA $ff00 
01:14a6 : a5 1d __ LDA ACCU + 2 
01:14a8 : 91 45 __ STA (T2 + 0),y 
01:14aa : e6 43 __ INC T1 + 0 
01:14ac : d0 02 __ BNE $14b0 ; (bnk_memcpy.s1009 + 0)
.s1008:
01:14ae : e6 44 __ INC T1 + 1 
.s1009:
01:14b0 : e6 45 __ INC T2 + 0 
01:14b2 : d0 02 __ BNE $14b6 ; (bnk_memcpy.s1011 + 0)
.s1010:
01:14b4 : e6 46 __ INC T2 + 1 
.s1011:
01:14b6 : ca __ __ DEX
01:14b7 : d0 df __ BNE $1498 ; (bnk_memcpy.l1006 + 0)
.s1007:
01:14b9 : c6 1c __ DEC ACCU + 1 
01:14bb : d0 d9 __ BNE $1496 ; (bnk_memcpy.l1002 + 0)
.s3:
01:14bd : a5 1b __ LDA ACCU + 0 
01:14bf : 8d 00 ff STA $ff00 
.s1001:
01:14c2 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_memset: ; bnk_memset(u8,u8*,u8,u16)->void
.s0:
01:14c3 : ad 00 ff LDA $ff00 
01:14c6 : 85 1b __ STA ACCU + 0 
01:14c8 : a9 7f __ LDA #$7f
01:14ca : 8d 00 ff STA $ff00 
01:14cd : a5 11 __ LDA P4 ; (size + 1)
01:14cf : 05 10 __ ORA P3 ; (size + 0)
01:14d1 : f0 1c __ BEQ $14ef ; (bnk_memset.s3 + 0)
.s4:
01:14d3 : a0 00 __ LDY #$00
01:14d5 : a5 10 __ LDA P3 ; (size + 0)
01:14d7 : f0 02 __ BEQ $14db ; (bnk_memset.l1002 + 0)
.s1005:
01:14d9 : e6 11 __ INC P4 ; (size + 1)
.l1002:
01:14db : a6 10 __ LDX P3 ; (size + 0)
.l1006:
01:14dd : a5 0f __ LDA P2 ; (val + 0)
01:14df : 91 0d __ STA (P0),y ; (p + 0)
01:14e1 : c8 __ __ INY
01:14e2 : d0 02 __ BNE $14e6 ; (bnk_memset.s1009 + 0)
.s1008:
01:14e4 : e6 0e __ INC P1 ; (p + 1)
.s1009:
01:14e6 : ca __ __ DEX
01:14e7 : d0 f4 __ BNE $14dd ; (bnk_memset.l1006 + 0)
.s1007:
01:14e9 : 86 10 __ STX P3 ; (size + 0)
01:14eb : c6 11 __ DEC P4 ; (size + 1)
01:14ed : d0 ec __ BNE $14db ; (bnk_memset.l1002 + 0)
.s3:
01:14ef : a5 1b __ LDA ACCU + 0 
01:14f1 : 8d 00 ff STA $ff00 
.s1001:
01:14f4 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_writeb: ; bnk_writeb(u8,u8*,u8)->void
.s0:
01:14f5 : a9 7f __ LDA #$7f
01:14f7 : ae 00 ff LDX $ff00 
01:14fa : 8d 00 ff STA $ff00 
01:14fd : a5 0f __ LDA P2 ; (b + 0)
01:14ff : a0 00 __ LDY #$00
01:1501 : 91 0d __ STA (P0),y ; (p + 0)
01:1503 : 8e 00 ff STX $ff00 
.s1001:
01:1506 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_readb: ; bnk_readb(u8,u8*)->u8
.s0:
01:1507 : a9 7f __ LDA #$7f
01:1509 : ae 00 ff LDX $ff00 
01:150c : 8d 00 ff STA $ff00 
01:150f : a0 00 __ LDY #$00
01:1511 : b1 0d __ LDA (P0),y ; (p + 0)
01:1513 : 8e 00 ff STX $ff00 
.s1001:
01:1516 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1517 : a5 56 __ LDA $56 
01:1519 : 85 0f __ STA P2 
01:151b : a9 01 __ LDA #$01
01:151d : 85 10 __ STA P3 
01:151f : a9 00 __ LDA #$00
01:1521 : 85 11 __ STA P4 
01:1523 : 4c 63 13 JMP $1363 ; (bnk_load.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1526 : ad 1d 5c LDA $5c1d ; (vdc_state + 8)
01:1529 : 85 0f __ STA P2 
01:152b : ad 1e 5c LDA $5c1e ; (vdc_state + 9)
01:152e : 85 10 __ STA P3 
01:1530 : a9 7f __ LDA #$7f
01:1532 : 85 11 __ STA P4 
01:1534 : a9 00 __ LDA #$00
01:1536 : 85 12 __ STA P5 
01:1538 : a9 d0 __ LDA #$d0
01:153a : 85 14 __ STA P7 
01:153c : a9 0f __ LDA #$0f
01:153e : 85 15 __ STA P8 
01:1540 : 4c a8 13 JMP $13a8 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1543 : a9 0e __ LDA #$0e
01:1545 : 85 11 __ STA P4 
01:1547 : a9 00 __ LDA #$00
01:1549 : 85 12 __ STA P5 
01:154b : a9 5d __ LDA #$5d
01:154d : 85 13 __ STA P6 
01:154f : a9 00 __ LDA #$00
01:1551 : 85 15 __ STA P8 
01:1553 : 4c a8 13 JMP $13a8 ; (bnk_cpytovdc.s0 + 0)
--------------------------------------------------------------------
bnk_cpyfromvdc@proxy: ; bnk_cpyfromvdc@proxy
01:1556 : a9 0e __ LDA #$0e
01:1558 : 85 0d __ STA P0 
01:155a : a9 00 __ LDA #$00
01:155c : 85 0e __ STA P1 
01:155e : a9 5d __ LDA #$5d
01:1560 : 85 0f __ STA P2 
01:1562 : a5 14 __ LDA P7 
01:1564 : 85 12 __ STA P5 
01:1566 : a9 00 __ LDA #$00
01:1568 : 85 13 __ STA P6 
01:156a : 4c 03 14 JMP $1403 ; (bnk_cpyfromvdc.s0 + 0)
--------------------------------------------------------------------
bnk_redef_charset@proxy: ; bnk_redef_charset@proxy
01:156d : a9 40 __ LDA #$40
01:156f : 85 13 __ STA P6 
01:1571 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
