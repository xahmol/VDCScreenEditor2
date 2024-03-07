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
1c35 : a9 c1 __ LDA #$c1
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
1c97 : 8d e1 5a STA $5ae1 ; (winCfg + 0)
1c9a : a9 00 __ LDA #$00
1c9c : 8d e4 5a STA $5ae4 ; (winCfg + 3)
1c9f : 8d e6 5a STA $5ae6 ; (winCfg + 5)
1ca2 : 8d e2 5a STA $5ae2 ; (winCfg + 1)
1ca5 : 8d e7 5a STA $5ae7 ; (winCfg + 6)
1ca8 : a9 20 __ LDA #$20
1caa : 8d e5 5a STA $5ae5 ; (winCfg + 4)
1cad : 8d e3 5a STA $5ae3 ; (winCfg + 2)
1cb0 : 8d e8 5a STA $5ae8 ; (winCfg + 7)
1cb3 : 20 92 22 JSR $2292 ; (bnk_init.s1000 + 0)
1cb6 : 20 29 2b JSR $2b29 ; (vdcwin_viewport_init.s0 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 8d f9 5a STA $5af9 ; (charsetchanged + 0)
1cbe : 8d fa 5a STA $5afa ; (charsetchanged + 1)
1cc1 : 8d fb 5a STA $5afb ; (appexit + 0)
1cc4 : 8d fc 5a STA $5afc ; (screen_col + 0)
1cc7 : 8d fd 5a STA $5afd ; (screen_col + 1)
1cca : 8d fe 5a STA $5afe ; (screen_row + 0)
1ccd : 8d ff 5a STA $5aff ; (screen_row + 1)
1cd0 : 8d f3 5b STA $5bf3 ; (screenbackground + 0)
1cd3 : 8d f4 5b STA $5bf4 ; (plotscreencode + 0)
1cd6 : 8d f6 5b STA $5bf6 ; (plotreverse + 0)
1cd9 : 8d f7 5b STA $5bf7 ; (plotunderline + 0)
1cdc : 8d f8 5b STA $5bf8 ; (plotblink + 0)
1cdf : 8d f9 5b STA $5bf9 ; (plotaltchar + 0)
1ce2 : a9 0f __ LDA #$0f
1ce4 : 8d f5 5b STA $5bf5 ; (plotcolor + 0)
1ce7 : ad fc 5a LDA $5afc ; (screen_col + 0)
1cea : 85 03 __ STA WORK + 0 
1cec : a0 06 __ LDY #$06
1cee : 91 23 __ STA (SP + 0),y 
1cf0 : ad fd 5a LDA $5afd ; (screen_col + 1)
1cf3 : 85 04 __ STA WORK + 1 
1cf5 : c8 __ __ INY
1cf6 : 91 23 __ STA (SP + 0),y 
1cf8 : ad fe 5a LDA $5afe ; (screen_row + 0)
1cfb : 85 1b __ STA ACCU + 0 
1cfd : ad ff 5a LDA $5aff ; (screen_row + 1)
1d00 : 85 1c __ STA ACCU + 1 
1d02 : 20 46 56 JSR $5646 ; (mul16 + 0)
1d05 : a5 05 __ LDA WORK + 2 
1d07 : 8d f1 5b STA $5bf1 ; (screentotal + 0)
1d0a : a5 06 __ LDA WORK + 3 
1d0c : 8d f2 5b STA $5bf2 ; (screentotal + 1)
1d0f : a9 54 __ LDA #$54
1d11 : a0 02 __ LDY #$02
1d13 : 91 23 __ STA (SP + 0),y 
1d15 : a9 58 __ LDA #$58
1d17 : c8 __ __ INY
1d18 : 91 23 __ STA (SP + 0),y 
1d1a : a9 00 __ LDA #$00
1d1c : c8 __ __ INY
1d1d : 91 23 __ STA (SP + 0),y 
1d1f : a9 2c __ LDA #$2c
1d21 : c8 __ __ INY
1d22 : 91 23 __ STA (SP + 0),y 
1d24 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
1d27 : a9 64 __ LDA #$64
1d29 : a0 02 __ LDY #$02
1d2b : 91 23 __ STA (SP + 0),y 
1d2d : a9 58 __ LDA #$58
1d2f : c8 __ __ INY
1d30 : 91 23 __ STA (SP + 0),y 
1d32 : a9 0e __ LDA #$0e
1d34 : c8 __ __ INY
1d35 : 91 23 __ STA (SP + 0),y 
1d37 : a9 2c __ LDA #$2c
1d39 : c8 __ __ INY
1d3a : 91 23 __ STA (SP + 0),y 
1d3c : ad fe 5a LDA $5afe ; (screen_row + 0)
1d3f : c8 __ __ INY
1d40 : 91 23 __ STA (SP + 0),y 
1d42 : ad ff 5a LDA $5aff ; (screen_row + 1)
1d45 : c8 __ __ INY
1d46 : 91 23 __ STA (SP + 0),y 
1d48 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
1d4b : a9 00 __ LDA #$00
1d4d : a0 06 __ LDY #$06
1d4f : 91 23 __ STA (SP + 0),y 
1d51 : c8 __ __ INY
1d52 : 91 23 __ STA (SP + 0),y 
1d54 : a9 74 __ LDA #$74
1d56 : a0 02 __ LDY #$02
1d58 : 91 23 __ STA (SP + 0),y 
1d5a : a9 58 __ LDA #$58
1d5c : c8 __ __ INY
1d5d : 91 23 __ STA (SP + 0),y 
1d5f : a9 1c __ LDA #$1c
1d61 : c8 __ __ INY
1d62 : 91 23 __ STA (SP + 0),y 
1d64 : a9 2c __ LDA #$2c
1d66 : c8 __ __ INY
1d67 : 91 23 __ STA (SP + 0),y 
1d69 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
1d6c : a5 ba __ LDA $ba 
1d6e : d0 02 __ BNE $1d72 ; (main.s1126 + 0)
.s4:
1d70 : a9 08 __ LDA #$08
.s1126:
1d72 : 8d ff 53 STA $53ff ; (bootdevice + 0)
1d75 : 20 2d 2c JSR $2c2d ; (vdc_init.s1000 + 0)
1d78 : a9 38 __ LDA #$38
1d7a : 85 16 __ STA P9 
1d7c : a9 33 __ LDA #$33
1d7e : 85 17 __ STA P10 
1d80 : ad d8 5b LDA $5bd8 ; (vdc_state + 0)
1d83 : c9 40 __ CMP #$40
1d85 : d0 2c __ BNE $1db3 ; (main.s10 + 0)
.s8:
1d87 : a9 03 __ LDA #$03
1d89 : 8d 97 5a STA $5a97 ; (pulldown_options + 3)
1d8c : a9 01 __ LDA #$01
1d8e : 8d ff 2a STA $2aff ; (undoenabled + 0)
1d91 : a9 00 __ LDA #$00
1d93 : 8d fc 5b STA $5bfc ; (undonumber + 0)
1d96 : 8d fd 5b STA $5bfd ; (undo_undopossible + 0)
1d99 : 8d fe 5b STA $5bfe ; (undo_redopossible + 0)
1d9c : a2 ff __ LDX #$ff
.l1120:
1d9e : e8 __ __ INX
1d9f : bd cd 31 LDA $31cd,x 
1da2 : 9d 94 59 STA $5994,x ; (pulldown_titles + 320)
1da5 : d0 f7 __ BNE $1d9e ; (main.l1120 + 0)
.s1121:
1da7 : ad ec 5b LDA $5bec ; (vdc_state + 20)
1daa : 8d fa 5b STA $5bfa ; (undoaddress + 0)
1dad : ad ed 5b LDA $5bed ; (vdc_state + 21)
1db0 : 8d fb 5b STA $5bfb ; (undoaddress + 1)
.s10:
1db3 : 20 dd 31 JSR $31dd ; (printcentered.s0 + 0)
1db6 : a9 7f __ LDA #$7f
1db8 : 85 10 __ STA P3 
1dba : ad ff 53 LDA $53ff ; (bootdevice + 0)
1dbd : 85 56 __ STA T2 + 0 
1dbf : 85 0f __ STA P2 
1dc1 : a9 58 __ LDA #$58
1dc3 : 85 12 __ STA P5 
1dc5 : a9 4a __ LDA #$4a
1dc7 : 85 13 __ STA P6 
1dc9 : a9 33 __ LDA #$33
1dcb : 85 14 __ STA P7 
1dcd : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
1dd0 : a5 1b __ LDA ACCU + 0 
1dd2 : f0 07 __ BEQ $1ddb ; (main.s13 + 0)
.s11:
1dd4 : a9 58 __ LDA #$58
1dd6 : 85 13 __ STA P6 
1dd8 : 20 26 15 JSR $1526 ; (bnk_cpytovdc@proxy + 0)
.s13:
1ddb : a9 54 __ LDA #$54
1ddd : 85 16 __ STA P9 
1ddf : a9 33 __ LDA #$33
1de1 : 85 17 __ STA P10 
1de3 : 20 dd 31 JSR $31dd ; (printcentered.s0 + 0)
1de6 : a5 56 __ LDA T2 + 0 
1de8 : 85 0f __ STA P2 
1dea : a9 0e __ LDA #$0e
1dec : 85 10 __ STA P3 
1dee : a9 0c __ LDA #$0c
1df0 : 85 12 __ STA P5 
1df2 : a9 68 __ LDA #$68
1df4 : 85 13 __ STA P6 
1df6 : a9 33 __ LDA #$33
1df8 : 85 14 __ STA P7 
1dfa : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
1dfd : a5 1b __ LDA ACCU + 0 
1dff : d0 06 __ BNE $1e07 ; (main.s16 + 0)
.s14:
1e01 : 20 72 33 JSR $3372 ; (menu_fileerrormessage.s1000 + 0)
1e04 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s16:
1e07 : a9 79 __ LDA #$79
1e09 : 85 16 __ STA P9 
1e0b : a9 39 __ LDA #$39
1e0d : 85 17 __ STA P10 
1e0f : 20 dd 31 JSR $31dd ; (printcentered.s0 + 0)
1e12 : a9 40 __ LDA #$40
1e14 : 85 12 __ STA P5 
1e16 : a9 87 __ LDA #$87
1e18 : 85 13 __ STA P6 
1e1a : a9 39 __ LDA #$39
1e1c : 85 14 __ STA P7 
1e1e : 20 17 15 JSR $1517 ; (bnk_load@proxy + 0)
1e21 : a5 1b __ LDA ACCU + 0 
1e23 : d0 06 __ BNE $1e2b ; (main.s19 + 0)
.s17:
1e25 : 20 72 33 JSR $3372 ; (menu_fileerrormessage.s1000 + 0)
1e28 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s19:
1e2b : a9 48 __ LDA #$48
1e2d : 85 12 __ STA P5 
1e2f : a9 91 __ LDA #$91
1e31 : 85 13 __ STA P6 
1e33 : a9 39 __ LDA #$39
1e35 : 85 14 __ STA P7 
1e37 : 20 17 15 JSR $1517 ; (bnk_load@proxy + 0)
1e3a : a5 1b __ LDA ACCU + 0 
1e3c : d0 06 __ BNE $1e44 ; (main.s22 + 0)
.s20:
1e3e : 20 72 33 JSR $3372 ; (menu_fileerrormessage.s1000 + 0)
1e41 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s22:
1e44 : 20 7d 14 JSR $147d ; (bnk_memcpy.s0 + 0)
1e47 : a9 20 __ LDA #$20
1e49 : 8d fb ab STA $abfb ; (sstack + 5)
1e4c : a9 0f __ LDA #$0f
1e4e : 8d fc ab STA $abfc ; (sstack + 6)
1e51 : 20 9b 39 JSR $399b ; (screenmapfill.s0 + 0)
1e54 : a9 a4 __ LDA #$a4
1e56 : 85 16 __ STA P9 
1e58 : a9 3a __ LDA #$3a
1e5a : 85 17 __ STA P10 
1e5c : 20 dd 31 JSR $31dd ; (printcentered.s0 + 0)
1e5f : 20 a7 2e JSR $2ea7 ; (getch.s0 + 0)
1e62 : 20 6a 2d JSR $2d6a ; (vdc_cls.s0 + 0)
1e65 : 20 b8 3a JSR $3ab8 ; (plotcursor.s0 + 0)
1e68 : a9 01 __ LDA #$01
1e6a : 8d ff 5b STA $5bff ; (showbar + 0)
1e6d : a2 ff __ LDX #$ff
.l1002:
1e6f : e8 __ __ INX
1e70 : bd fb 2b LDA $2bfb,x 
1e73 : 9d b7 5c STA $5cb7,x ; (programmode + 0)
1e76 : d0 f7 __ BNE $1e6f ; (main.l1002 + 0)
.s1003:
1e78 : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
.l25:
1e7b : 20 2a 3c JSR $3c2a ; (printstatusbar.s1000 + 0)
.l27:
1e7e : 20 2a 38 JSR $382a ; (vdcwin_getch.s0 + 0)
1e81 : a5 1b __ LDA ACCU + 0 
1e83 : c9 4c __ CMP #$4c
1e85 : f0 71 __ BEQ $1ef8 ; (main.s235 + 0)
.s124:
1e87 : 85 53 __ STA T0 + 0 
1e89 : 85 55 __ STA T1 + 0 
1e8b : c9 4c __ CMP #$4c
1e8d : b0 03 __ BCS $1e92 ; (main.s125 + 0)
1e8f : 4c d7 1f JMP $1fd7 ; (main.s126 + 0)
.s125:
1e92 : c9 59 __ CMP #$59
1e94 : d0 03 __ BNE $1e99 ; (main.s154 + 0)
1e96 : 4c bf 1f JMP $1fbf ; (main.s89 + 0)
.s154:
1e99 : b0 03 __ BCS $1e9e ; (main.s155 + 0)
1e9b : 4c 72 1f JMP $1f72 ; (main.s156 + 0)
.s155:
1e9e : c9 8c __ CMP #$8c
1ea0 : d0 06 __ BNE $1ea8 ; (main.s169 + 0)
.s112:
1ea2 : 20 6a 54 JSR $546a ; (helpscreen_load.s1000 + 0)
1ea5 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s169:
1ea8 : b0 03 __ BCS $1ead ; (main.s170 + 0)
1eaa : 4c 34 1f JMP $1f34 ; (main.s171 + 0)
.s170:
1ead : c9 91 __ CMP #$91
1eaf : f0 04 __ BEQ $1eb5 ; (main.s29 + 0)
.s177:
1eb1 : c9 9d __ CMP #$9d
1eb3 : d0 0b __ BNE $1ec0 ; (main.s114 + 0)
.s29:
1eb5 : a5 1b __ LDA ACCU + 0 
1eb7 : 8d ff ab STA $abff ; (sstack + 9)
1eba : 20 08 3e JSR $3e08 ; (plotmove.s1000 + 0)
1ebd : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s114:
1ec0 : c9 30 __ CMP #$30
1ec2 : 90 18 __ BCC $1edc ; (main.s117 + 0)
.s118:
1ec4 : c9 3a __ CMP #$3a
1ec6 : b0 14 __ BCS $1edc ; (main.s117 + 0)
.s115:
1ec8 : 0a __ __ ASL
1ec9 : aa __ __ TAX
1eca : bd 62 5c LDA $5c62,x ; (multab + 98)
1ecd : 8d f4 5b STA $5bf4 ; (plotscreencode + 0)
1ed0 : bd 63 5c LDA $5c63,x ; (multab + 99)
1ed3 : 8d f9 5b STA $5bf9 ; (plotaltchar + 0)
1ed6 : 20 b8 3a JSR $3ab8 ; (plotcursor.s0 + 0)
1ed9 : 4c e2 1e JMP $1ee2 ; (main.s122 + 0)
.s117:
1edc : a9 20 __ LDA #$20
1ede : c5 1b __ CMP ACCU + 0 
1ee0 : b0 16 __ BCS $1ef8 ; (main.s235 + 0)
.s122:
1ee2 : a5 53 __ LDA T0 + 0 
1ee4 : c9 2b __ CMP #$2b
1ee6 : b0 10 __ BCS $1ef8 ; (main.s235 + 0)
.s119:
1ee8 : a5 55 __ LDA T1 + 0 
1eea : 0a __ __ ASL
1eeb : aa __ __ TAX
1eec : ad f4 5b LDA $5bf4 ; (plotscreencode + 0)
1eef : 9d 80 5c STA $5c80,x ; (multab + 128)
1ef2 : ad f9 5b LDA $5bf9 ; (plotaltchar + 0)
1ef5 : 9d 81 5c STA $5c81,x ; (multab + 129)
.s235:
1ef8 : ad fb 5a LDA $5afb ; (appexit + 0)
1efb : d0 0b __ BNE $1f08 ; (main.s24 + 0)
.s23:
1efd : ad ff 5b LDA $5bff ; (showbar + 0)
1f00 : d0 03 __ BNE $1f05 ; (main.s23 + 8)
1f02 : 4c 7e 1e JMP $1e7e ; (main.l27 + 0)
1f05 : 4c 7b 1e JMP $1e7b ; (main.l25 + 0)
.s24:
1f08 : a9 00 __ LDA #$00
1f0a : 20 ea 2e JSR $2eea ; (fastmode.s0 + 0)
1f0d : 20 09 2f JSR $2f09 ; (vdc_set_mode@proxy + 0)
1f10 : 20 6a 2d JSR $2d6a ; (vdc_cls.s0 + 0)
1f13 : a9 04 __ LDA #$04
1f15 : 8d 06 d5 STA $d506 
1f18 : a9 00 __ LDA #$00
1f1a : 85 1b __ STA ACCU + 0 
1f1c : 85 1c __ STA ACCU + 1 
.s1001:
1f1e : 18 __ __ CLC
1f1f : a5 23 __ LDA SP + 0 
1f21 : 69 08 __ ADC #$08
1f23 : 85 23 __ STA SP + 0 
1f25 : 90 02 __ BCC $1f29 ; (main.s1001 + 11)
1f27 : e6 24 __ INC SP + 1 
1f29 : a2 05 __ LDX #$05
1f2b : bd a1 ab LDA $aba1,x ; (main@stack + 0)
1f2e : 95 53 __ STA T0 + 0,x 
1f30 : ca __ __ DEX
1f31 : 10 f8 __ BPL $1f2b ; (main.s1001 + 13)
1f33 : 60 __ __ RTS
.s171:
1f34 : c9 85 __ CMP #$85
1f36 : d0 12 __ BNE $1f4a ; (main.s172 + 0)
.s110:
1f38 : 20 fb 3a JSR $3afb ; (vdcwin_cursor_show@proxy + 0)
1f3b : 20 3b 4e JSR $4e3b ; (mainmenuloop.s1000 + 0)
1f3e : 20 b8 3a JSR $3ab8 ; (plotcursor.s0 + 0)
1f41 : ad f5 5b LDA $5bf5 ; (plotcolor + 0)
1f44 : 8d df 5b STA $5bdf ; (vdc_state + 7)
1f47 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s172:
1f4a : b0 19 __ BCS $1f65 ; (main.s173 + 0)
.s174:
1f4c : c9 5a __ CMP #$5a
1f4e : f0 03 __ BEQ $1f53 ; (main.s84 + 0)
1f50 : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s84:
1f53 : ad ff 2a LDA $2aff ; (undoenabled + 0)
1f56 : c9 01 __ CMP #$01
1f58 : d0 9e __ BNE $1ef8 ; (main.s235 + 0)
.s88:
1f5a : ad fd 5b LDA $5bfd ; (undo_undopossible + 0)
1f5d : f0 99 __ BEQ $1ef8 ; (main.s235 + 0)
.s85:
1f5f : 20 2d 47 JSR $472d ; (undo_performundo.s1000 + 0)
1f62 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s173:
1f65 : c9 8b __ CMP #$8b
1f67 : f0 03 __ BEQ $1f6c ; (main.s111 + 0)
1f69 : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s111:
1f6c : 20 46 54 JSR $5446 ; (togglestatusbar.s0 + 0)
1f6f : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s156:
1f72 : c9 53 __ CMP #$53
1f74 : f0 82 __ BEQ $1ef8 ; (main.s235 + 0)
.s157:
1f76 : b0 29 __ BCS $1fa1 ; (main.s158 + 0)
.s159:
1f78 : c9 50 __ CMP #$50
1f7a : d0 03 __ BNE $1f7f ; (main.s160 + 0)
1f7c : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s160:
1f7f : b0 0a __ BCS $1f8b ; (main.s161 + 0)
.s162:
1f81 : c9 4d __ CMP #$4d
1f83 : d0 03 __ BNE $1f88 ; (main.s162 + 7)
1f85 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
1f88 : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s161:
1f8b : c9 52 __ CMP #$52
1f8d : f0 03 __ BEQ $1f92 ; (main.s58 + 0)
1f8f : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s58:
1f92 : a9 00 __ LDA #$00
1f94 : cd f6 5b CMP $5bf6 ; (plotreverse + 0)
1f97 : 2a __ __ ROL
1f98 : 8d f6 5b STA $5bf6 ; (plotreverse + 0)
.s282:
1f9b : 20 b8 3a JSR $3ab8 ; (plotcursor.s0 + 0)
1f9e : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s158:
1fa1 : c9 55 __ CMP #$55
1fa3 : d0 0b __ BNE $1fb0 ; (main.s165 + 0)
.s56:
1fa5 : a9 00 __ LDA #$00
1fa7 : cd f7 5b CMP $5bf7 ; (plotunderline + 0)
1faa : 2a __ __ ROL
1fab : 8d f7 5b STA $5bf7 ; (plotunderline + 0)
1fae : 90 eb __ BCC $1f9b ; (main.s282 + 0)
.s165:
1fb0 : b0 03 __ BCS $1fb5 ; (main.s166 + 0)
1fb2 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s166:
1fb5 : c9 57 __ CMP #$57
1fb7 : d0 03 __ BNE $1fbc ; (main.s166 + 7)
1fb9 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
1fbc : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s89:
1fbf : ad ff 2a LDA $2aff ; (undoenabled + 0)
1fc2 : c9 01 __ CMP #$01
1fc4 : f0 03 __ BEQ $1fc9 ; (main.s93 + 0)
1fc6 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s93:
1fc9 : ad fe 5b LDA $5bfe ; (undo_redopossible + 0)
1fcc : d0 03 __ BNE $1fd1 ; (main.s90 + 0)
1fce : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s90:
1fd1 : 20 ee 49 JSR $49ee ; (undo_performredo.s1000 + 0)
1fd4 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s126:
1fd7 : c9 2d __ CMP #$2d
1fd9 : d0 07 __ BNE $1fe2 ; (main.s127 + 0)
.s31:
1fdb : ae f4 5b LDX $5bf4 ; (plotscreencode + 0)
1fde : ca __ __ DEX
1fdf : 4c b1 20 JMP $20b1 ; (main.s284 + 0)
.s127:
1fe2 : 90 03 __ BCC $1fe7 ; (main.s129 + 0)
1fe4 : 4c 3e 21 JMP $213e ; (main.s128 + 0)
.s129:
1fe7 : c9 1d __ CMP #$1d
1fe9 : d0 03 __ BNE $1fee ; (main.s130 + 0)
1feb : 4c b5 1e JMP $1eb5 ; (main.s29 + 0)
.s130:
1fee : b0 03 __ BCS $1ff3 ; (main.s131 + 0)
1ff0 : 4c b8 20 JMP $20b8 ; (main.s132 + 0)
.s131:
1ff3 : c9 2b __ CMP #$2b
1ff5 : d0 07 __ BNE $1ffe ; (main.s138 + 0)
.s30:
1ff7 : ae f4 5b LDX $5bf4 ; (plotscreencode + 0)
1ffa : e8 __ __ INX
1ffb : 4c b1 20 JMP $20b1 ; (main.s284 + 0)
.s138:
1ffe : b0 76 __ BCS $2076 ; (main.s32 + 0)
.s140:
2000 : c9 20 __ CMP #$20
2002 : f0 03 __ BEQ $2007 ; (main.s96 + 0)
2004 : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s96:
2007 : ad ff 2a LDA $2aff ; (undoenabled + 0)
200a : c9 01 __ CMP #$01
200c : d0 1a __ BNE $2028 ; (main.s99 + 0)
.s97:
200e : 85 18 __ STA P11 
2010 : 8d f6 ab STA $abf6 ; (sstack + 0)
2013 : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
2016 : 18 __ __ CLC
2017 : 6d fe 5a ADC $5afe ; (screen_row + 0)
201a : 85 16 __ STA P9 
201c : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
201f : 18 __ __ CLC
2020 : 6d fc 5a ADC $5afc ; (screen_col + 0)
2023 : 85 17 __ STA P10 
2025 : 20 cb 4b JSR $4bcb ; (undo_new.s1000 + 0)
.s99:
2028 : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
202b : 18 __ __ CLC
202c : 6d fe 5a ADC $5afe ; (screen_row + 0)
202f : 85 10 __ STA P3 
2031 : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
2034 : 18 __ __ CLC
2035 : 6d fc 5a ADC $5afc ; (screen_col + 0)
2038 : 85 11 __ STA P4 
203a : ad f4 5b LDA $5bf4 ; (plotscreencode + 0)
203d : 85 12 __ STA P5 
203f : ad f8 5b LDA $5bf8 ; (plotblink + 0)
2042 : 0a __ __ ASL
2043 : 0a __ __ ASL
2044 : 0a __ __ ASL
2045 : 0a __ __ ASL
2046 : 18 __ __ CLC
2047 : 6d f5 5b ADC $5bf5 ; (plotcolor + 0)
204a : 85 53 __ STA T0 + 0 
204c : ad f7 5b LDA $5bf7 ; (plotunderline + 0)
204f : 4a __ __ LSR
2050 : 6a __ __ ROR
2051 : 6a __ __ ROR
2052 : 29 c0 __ AND #$c0
2054 : 6a __ __ ROR
2055 : 65 53 __ ADC T0 + 0 
2057 : 85 53 __ STA T0 + 0 
2059 : ad f6 5b LDA $5bf6 ; (plotreverse + 0)
205c : 4a __ __ LSR
205d : 6a __ __ ROR
205e : 29 80 __ AND #$80
2060 : 6a __ __ ROR
2061 : 65 53 __ ADC T0 + 0 
2063 : 85 53 __ STA T0 + 0 
2065 : ad f9 5b LDA $5bf9 ; (plotaltchar + 0)
2068 : 4a __ __ LSR
2069 : a9 00 __ LDA #$00
206b : 6a __ __ ROR
206c : 65 53 __ ADC T0 + 0 
206e : 85 13 __ STA P6 
.s283:
2070 : 20 c1 4d JSR $4dc1 ; (screenmapplot.s0 + 0)
2073 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s32:
2076 : ad f5 5b LDA $5bf5 ; (plotcolor + 0)
2079 : f0 2a __ BEQ $20a5 ; (main.s33 + 0)
.s34:
207b : 38 __ __ SEC
207c : e9 01 __ SBC #$01
207e : 85 53 __ STA T0 + 0 
2080 : cd f3 5b CMP $5bf3 ; (screenbackground + 0)
2083 : d0 0d __ BNE $2092 ; (main.s38 + 0)
.s36:
2085 : a5 53 __ LDA T0 + 0 
2087 : f0 05 __ BEQ $208e ; (main.s39 + 0)
.s40:
2089 : c6 53 __ DEC T0 + 0 
208b : 4c 92 20 JMP $2092 ; (main.s38 + 0)
.s39:
208e : a9 0f __ LDA #$0f
.s1128:
2090 : 85 53 __ STA T0 + 0 
.s38:
2092 : a5 53 __ LDA T0 + 0 
2094 : 8d f5 5b STA $5bf5 ; (plotcolor + 0)
2097 : ad df 5b LDA $5bdf ; (vdc_state + 7)
209a : 29 f0 __ AND #$f0
209c : 18 __ __ CLC
209d : 65 53 __ ADC T0 + 0 
.s1127:
209f : 8d df 5b STA $5bdf ; (vdc_state + 7)
20a2 : 4c 9b 1f JMP $1f9b ; (main.s282 + 0)
.s33:
20a5 : a9 0f __ LDA #$0f
20a7 : 85 53 __ STA T0 + 0 
20a9 : cd f3 5b CMP $5bf3 ; (screenbackground + 0)
20ac : d0 e4 __ BNE $2092 ; (main.s38 + 0)
20ae : 4c 85 20 JMP $2085 ; (main.s36 + 0)
.s284:
20b1 : 8a __ __ TXA
.s1125:
20b2 : 8d f4 5b STA $5bf4 ; (plotscreencode + 0)
20b5 : 4c 9b 1f JMP $1f9b ; (main.s282 + 0)
.s132:
20b8 : c9 13 __ CMP #$13
20ba : f0 51 __ BEQ $210d ; (main.s106 + 0)
.s133:
20bc : b0 0a __ BCS $20c8 ; (main.s134 + 0)
.s135:
20be : c9 11 __ CMP #$11
20c0 : f0 03 __ BEQ $20c5 ; (main.s135 + 7)
20c2 : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
20c5 : 4c b5 1e JMP $1eb5 ; (main.s29 + 0)
.s134:
20c8 : c9 14 __ CMP #$14
20ca : f0 03 __ BEQ $20cf ; (main.s102 + 0)
20cc : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s102:
20cf : ad ff 2a LDA $2aff ; (undoenabled + 0)
20d2 : c9 01 __ CMP #$01
20d4 : d0 1a __ BNE $20f0 ; (main.s105 + 0)
.s103:
20d6 : 85 18 __ STA P11 
20d8 : 8d f6 ab STA $abf6 ; (sstack + 0)
20db : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
20de : 18 __ __ CLC
20df : 6d fe 5a ADC $5afe ; (screen_row + 0)
20e2 : 85 16 __ STA P9 
20e4 : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
20e7 : 18 __ __ CLC
20e8 : 6d fc 5a ADC $5afc ; (screen_col + 0)
20eb : 85 17 __ STA P10 
20ed : 20 cb 4b JSR $4bcb ; (undo_new.s1000 + 0)
.s105:
20f0 : a9 20 __ LDA #$20
20f2 : 85 12 __ STA P5 
20f4 : a9 0f __ LDA #$0f
20f6 : 85 13 __ STA P6 
20f8 : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
20fb : 18 __ __ CLC
20fc : 6d fe 5a ADC $5afe ; (screen_row + 0)
20ff : 85 10 __ STA P3 
2101 : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
2104 : 18 __ __ CLC
2105 : 6d fc 5a ADC $5afc ; (screen_col + 0)
2108 : 85 11 __ STA P4 
210a : 4c 70 20 JMP $2070 ; (main.s283 + 0)
.s106:
210d : a9 00 __ LDA #$00
210f : 8d fe 5a STA $5afe ; (screen_row + 0)
2112 : 8d ff 5a STA $5aff ; (screen_row + 1)
2115 : 8d fc 5a STA $5afc ; (screen_col + 0)
2118 : 8d fd 5a STA $5afd ; (screen_col + 1)
211b : 8d 00 5b STA $5b00 ; (vdc_modes + 0)
211e : 8d 01 5b STA $5b01 ; (vdc_modes + 1)
2121 : 8d 02 5b STA $5b02 ; (vdc_modes + 2)
2124 : 8d 03 5b STA $5b03 ; (vdc_modes + 3)
2127 : 20 ea 57 JSR $57ea ; (vdcwin_cpy_viewport@proxy + 0)
212a : ad ff 5b LDA $5bff ; (showbar + 0)
212d : f0 03 __ BEQ $2132 ; (main.s109 + 0)
.s107:
212f : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
.s109:
2132 : a9 00 __ LDA #$00
2134 : 85 0d __ STA P0 
2136 : 85 0e __ STA P1 
2138 : 20 34 4e JSR $4e34 ; (gotoxy.s0 + 0)
213b : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s128:
213e : c9 43 __ CMP #$43
2140 : d0 03 __ BNE $2145 ; (main.s142 + 0)
2142 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
.s142:
2145 : b0 03 __ BCS $214a ; (main.s143 + 0)
2147 : 4c 3d 22 JMP $223d ; (main.s144 + 0)
.s143:
214a : c9 47 __ CMP #$47
214c : f0 1c __ BEQ $216a ; (main.s62 + 0)
.s149:
214e : b0 0a __ BCS $215a ; (main.s150 + 0)
.s151:
2150 : c9 45 __ CMP #$45
2152 : d0 03 __ BNE $2157 ; (main.s151 + 7)
2154 : 4c f8 1e JMP $1ef8 ; (main.s235 + 0)
2157 : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s150:
215a : c9 49 __ CMP #$49
215c : f0 03 __ BEQ $2161 ; (main.s95 + 0)
215e : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s95:
2161 : ad f4 5b LDA $5bf4 ; (plotscreencode + 0)
2164 : 18 __ __ CLC
2165 : 69 80 __ ADC #$80
2167 : 4c b2 20 JMP $20b2 ; (main.s1125 + 0)
.s62:
216a : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
216d : 18 __ __ CLC
216e : 6d fc 5a ADC $5afc ; (screen_col + 0)
2171 : 85 53 __ STA T0 + 0 
2173 : ad 01 5b LDA $5b01 ; (vdc_modes + 1)
2176 : 6d fd 5a ADC $5afd ; (screen_col + 1)
2179 : 85 54 __ STA T0 + 1 
217b : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
217e : 18 __ __ CLC
217f : 6d fe 5a ADC $5afe ; (screen_row + 0)
2182 : 85 03 __ STA WORK + 0 
2184 : ad 03 5b LDA $5b03 ; (vdc_modes + 3)
2187 : 6d ff 5a ADC $5aff ; (screen_row + 1)
218a : 85 04 __ STA WORK + 1 
218c : ad fc 5a LDA $5afc ; (screen_col + 0)
218f : 85 57 __ STA T4 + 0 
2191 : 85 1b __ STA ACCU + 0 
2193 : ad fd 5a LDA $5afd ; (screen_col + 1)
2196 : 85 58 __ STA T4 + 1 
2198 : 85 1c __ STA ACCU + 1 
219a : 20 46 56 JSR $5646 ; (mul16 + 0)
219d : 18 __ __ CLC
219e : a5 06 __ LDA WORK + 3 
21a0 : 69 58 __ ADC #$58
21a2 : aa __ __ TAX
21a3 : 18 __ __ CLC
21a4 : a5 05 __ LDA WORK + 2 
21a6 : 65 53 __ ADC T0 + 0 
21a8 : 85 0d __ STA P0 
21aa : 8a __ __ TXA
21ab : 65 54 __ ADC T0 + 1 
21ad : 85 0e __ STA P1 
21af : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
21b2 : 8d f4 5b STA $5bf4 ; (plotscreencode + 0)
21b5 : ad fe 5a LDA $5afe ; (screen_row + 0)
21b8 : 85 1b __ STA ACCU + 0 
21ba : ad ff 5a LDA $5aff ; (screen_row + 1)
21bd : 85 1c __ STA ACCU + 1 
21bf : a5 57 __ LDA T4 + 0 
21c1 : 85 03 __ STA WORK + 0 
21c3 : a5 58 __ LDA T4 + 1 
21c5 : 85 04 __ STA WORK + 1 
21c7 : 20 46 56 JSR $5646 ; (mul16 + 0)
21ca : 18 __ __ CLC
21cb : a5 05 __ LDA WORK + 2 
21cd : 65 0d __ ADC P0 
21cf : aa __ __ TAX
21d0 : a5 06 __ LDA WORK + 3 
21d2 : 65 0e __ ADC P1 
21d4 : a8 __ __ TAY
21d5 : 8a __ __ TXA
21d6 : 18 __ __ CLC
21d7 : 69 30 __ ADC #$30
21d9 : 85 0d __ STA P0 
21db : 90 01 __ BCC $21de ; (main.s1134 + 0)
.s1133:
21dd : c8 __ __ INY
.s1134:
21de : 84 0e __ STY P1 
21e0 : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
21e3 : c9 81 __ CMP #$81
21e5 : aa __ __ TAX
21e6 : b0 08 __ BCS $21f0 ; (main.s67 + 0)
.s68:
21e8 : a9 00 __ LDA #$00
21ea : 8d f9 5b STA $5bf9 ; (plotaltchar + 0)
21ed : 8a __ __ TXA
21ee : 90 09 __ BCC $21f9 ; (main.s261 + 0)
.s67:
21f0 : a9 01 __ LDA #$01
21f2 : 8d f9 5b STA $5bf9 ; (plotaltchar + 0)
21f5 : 8a __ __ TXA
21f6 : e9 80 __ SBC #$80
21f8 : aa __ __ TAX
.s261:
21f9 : c9 41 __ CMP #$41
21fb : b0 08 __ BCS $2205 ; (main.s70 + 0)
.s71:
21fd : a9 00 __ LDA #$00
21ff : 8d f6 5b STA $5bf6 ; (plotreverse + 0)
2202 : 8a __ __ TXA
2203 : 90 09 __ BCC $220e ; (main.s262 + 0)
.s70:
2205 : a9 01 __ LDA #$01
2207 : 8d f6 5b STA $5bf6 ; (plotreverse + 0)
220a : 8a __ __ TXA
220b : e9 40 __ SBC #$40
220d : aa __ __ TAX
.s262:
220e : c9 21 __ CMP #$21
2210 : b0 08 __ BCS $221a ; (main.s73 + 0)
.s74:
2212 : a9 00 __ LDA #$00
2214 : 8d f7 5b STA $5bf7 ; (plotunderline + 0)
2217 : 8a __ __ TXA
2218 : 90 09 __ BCC $2223 ; (main.s263 + 0)
.s73:
221a : a9 01 __ LDA #$01
221c : 8d f7 5b STA $5bf7 ; (plotunderline + 0)
221f : 8a __ __ TXA
2220 : e9 20 __ SBC #$20
2222 : aa __ __ TAX
.s263:
2223 : c9 11 __ CMP #$11
2225 : b0 08 __ BCS $222f ; (main.s76 + 0)
.s77:
2227 : a9 00 __ LDA #$00
2229 : 8d f8 5b STA $5bf8 ; (plotblink + 0)
222c : 8a __ __ TXA
222d : 90 08 __ BCC $2237 ; (main.s1124 + 0)
.s76:
222f : a9 01 __ LDA #$01
2231 : 8d f8 5b STA $5bf8 ; (plotblink + 0)
2234 : 8a __ __ TXA
2235 : e9 10 __ SBC #$10
.s1124:
2237 : 8d f5 5b STA $5bf5 ; (plotcolor + 0)
223a : 4c 9f 20 JMP $209f ; (main.s1127 + 0)
.s144:
223d : c9 41 __ CMP #$41
223f : d0 0c __ BNE $224d ; (main.s145 + 0)
.s59:
2241 : a9 00 __ LDA #$00
2243 : cd f9 5b CMP $5bf9 ; (plotaltchar + 0)
2246 : 2a __ __ ROL
2247 : 8d f9 5b STA $5bf9 ; (plotaltchar + 0)
224a : 4c 9b 1f JMP $1f9b ; (main.s282 + 0)
.s145:
224d : b0 37 __ BCS $2286 ; (main.s57 + 0)
.s147:
224f : c9 2e __ CMP #$2e
2251 : f0 03 __ BEQ $2256 ; (main.s44 + 0)
2253 : 4c c0 1e JMP $1ec0 ; (main.s114 + 0)
.s44:
2256 : ad f5 5b LDA $5bf5 ; (plotcolor + 0)
2259 : c9 0f __ CMP #$0f
225b : d0 1c __ BNE $2279 ; (main.s46 + 0)
.s45:
225d : a9 00 __ LDA #$00
225f : 85 53 __ STA T0 + 0 
2261 : ad f3 5b LDA $5bf3 ; (screenbackground + 0)
2264 : f0 03 __ BEQ $2269 ; (main.s48 + 0)
2266 : 4c 92 20 JMP $2092 ; (main.s38 + 0)
.s48:
2269 : a5 53 __ LDA T0 + 0 
226b : c9 0f __ CMP #$0f
226d : d0 05 __ BNE $2274 ; (main.s52 + 0)
.s51:
226f : a9 00 __ LDA #$00
2271 : 4c 90 20 JMP $2090 ; (main.s1128 + 0)
.s52:
2274 : e6 53 __ INC T0 + 0 
2276 : 4c 92 20 JMP $2092 ; (main.s38 + 0)
.s46:
2279 : 18 __ __ CLC
227a : 69 01 __ ADC #$01
227c : 85 53 __ STA T0 + 0 
227e : cd f3 5b CMP $5bf3 ; (screenbackground + 0)
2281 : f0 e6 __ BEQ $2269 ; (main.s48 + 0)
2283 : 4c 92 20 JMP $2092 ; (main.s38 + 0)
.s57:
2286 : a9 00 __ LDA #$00
2288 : cd f8 5b CMP $5bf8 ; (plotblink + 0)
228b : 2a __ __ ROL
228c : 8d f8 5b STA $5bf8 ; (plotblink + 0)
228f : 4c 9b 1f JMP $1f9b ; (main.s282 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
2292 : 38 __ __ SEC
2293 : a5 23 __ LDA SP + 0 
2295 : e9 06 __ SBC #$06
2297 : 85 23 __ STA SP + 0 
2299 : b0 02 __ BCS $229d ; (bnk_init.s0 + 0)
229b : c6 24 __ DEC SP + 1 
.s0:
229d : a9 06 __ LDA #$06
229f : a0 02 __ LDY #$02
22a1 : 91 23 __ STA (SP + 0),y 
22a3 : a9 2a __ LDA #$2a
22a5 : c8 __ __ INY
22a6 : 91 23 __ STA (SP + 0),y 
22a8 : a5 ba __ LDA $ba 
22aa : d0 02 __ BNE $22ae ; (bnk_init.s1002 + 0)
.s2:
22ac : a9 08 __ LDA #$08
.s1002:
22ae : 8d ff 53 STA $53ff ; (bootdevice + 0)
22b1 : a0 04 __ LDY #$04
22b3 : 91 23 __ STA (SP + 0),y 
22b5 : a9 00 __ LDA #$00
22b7 : c8 __ __ INY
22b8 : 91 23 __ STA (SP + 0),y 
22ba : 20 df 22 JSR $22df ; (printf.s0 + 0)
22bd : a9 06 __ LDA #$06
22bf : 8d 06 d5 STA $d506 
22c2 : a9 16 __ LDA #$16
22c4 : a0 02 __ LDY #$02
22c6 : 91 23 __ STA (SP + 0),y 
22c8 : a9 2a __ LDA #$2a
22ca : c8 __ __ INY
22cb : 91 23 __ STA (SP + 0),y 
22cd : 20 df 22 JSR $22df ; (printf.s0 + 0)
22d0 : 20 30 2a JSR $2a30 ; (load_overlay.s1000 + 0)
.s1001:
22d3 : 18 __ __ CLC
22d4 : a5 23 __ LDA SP + 0 
22d6 : 69 06 __ ADC #$06
22d8 : 85 23 __ STA SP + 0 
22da : 90 02 __ BCC $22de ; (bnk_init.s1001 + 11)
22dc : e6 24 __ INC SP + 1 
22de : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22df : a9 01 __ LDA #$01
22e1 : 8d fa ab STA $abfa ; (sstack + 4)
22e4 : a9 a8 __ LDA #$a8
22e6 : 85 16 __ STA P9 
22e8 : a9 ab __ LDA #$ab
22ea : 85 17 __ STA P10 
22ec : a0 02 __ LDY #$02
22ee : b1 23 __ LDA (SP + 0),y 
22f0 : 8d f6 ab STA $abf6 ; (sstack + 0)
22f3 : c8 __ __ INY
22f4 : b1 23 __ LDA (SP + 0),y 
22f6 : 8d f7 ab STA $abf7 ; (sstack + 1)
22f9 : 18 __ __ CLC
22fa : a5 23 __ LDA SP + 0 
22fc : 69 04 __ ADC #$04
22fe : 8d f8 ab STA $abf8 ; (sstack + 2)
2301 : a5 24 __ LDA SP + 1 
2303 : 69 00 __ ADC #$00
2305 : 8d f9 ab STA $abf9 ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
2308 : a5 53 __ LDA T7 + 0 
230a : 8d da ab STA $abda ; (vp_fill + 10)
230d : a5 54 __ LDA T7 + 1 
230f : 8d db ab STA $abdb ; (vp_fill + 11)
2312 : a5 55 __ LDA T7 + 2 
2314 : 8d dc ab STA $abdc ; (vp_fill + 12)
.s0:
2317 : a9 00 __ LDA #$00
2319 : 85 47 __ STA T0 + 0 
231b : ad f6 ab LDA $abf6 ; (sstack + 0)
231e : 85 49 __ STA T1 + 0 
2320 : ad f7 ab LDA $abf7 ; (sstack + 1)
2323 : 85 4a __ STA T1 + 1 
.l1:
2325 : a0 00 __ LDY #$00
2327 : b1 49 __ LDA (T1 + 0),y 
2329 : d0 3c __ BNE $2367 ; (sformat.s2 + 0)
.s3:
232b : a4 47 __ LDY T0 + 0 
232d : 91 16 __ STA (P9),y ; (buff + 0)
232f : 98 __ __ TYA
2330 : f0 1d __ BEQ $234f ; (sformat.s1070 + 0)
.s116:
2332 : ad fa ab LDA $abfa ; (sstack + 4)
2335 : d0 0d __ BNE $2344 ; (sformat.s119 + 0)
.s120:
2337 : 18 __ __ CLC
2338 : a5 16 __ LDA P9 ; (buff + 0)
233a : 65 47 __ ADC T0 + 0 
233c : aa __ __ TAX
233d : a5 17 __ LDA P10 ; (buff + 1)
233f : 69 00 __ ADC #$00
2341 : 4c 53 23 JMP $2353 ; (sformat.s1001 + 0)
.s119:
2344 : a5 16 __ LDA P9 ; (buff + 0)
2346 : 85 0d __ STA P0 
2348 : a5 17 __ LDA P10 ; (buff + 1)
234a : 85 0e __ STA P1 
234c : 20 09 27 JSR $2709 ; (puts.s0 + 0)
.s1070:
234f : a5 17 __ LDA P10 ; (buff + 1)
2351 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
2353 : 86 1b __ STX ACCU + 0 ; (fps + 0)
2355 : 85 1c __ STA ACCU + 1 ; (fps + 1)
2357 : ad da ab LDA $abda ; (vp_fill + 10)
235a : 85 53 __ STA T7 + 0 
235c : ad db ab LDA $abdb ; (vp_fill + 11)
235f : 85 54 __ STA T7 + 1 
2361 : ad dc ab LDA $abdc ; (vp_fill + 12)
2364 : 85 55 __ STA T7 + 2 
2366 : 60 __ __ RTS
.s2:
2367 : c9 25 __ CMP #$25
2369 : f0 3f __ BEQ $23aa ; (sformat.s4 + 0)
.s5:
236b : a4 47 __ LDY T0 + 0 
236d : 91 16 __ STA (P9),y ; (buff + 0)
236f : e6 49 __ INC T1 + 0 
2371 : d0 02 __ BNE $2375 ; (sformat.s1098 + 0)
.s1097:
2373 : e6 4a __ INC T1 + 1 
.s1098:
2375 : c8 __ __ INY
2376 : 84 47 __ STY T0 + 0 
2378 : 98 __ __ TYA
2379 : c0 28 __ CPY #$28
237b : 90 a8 __ BCC $2325 ; (sformat.l1 + 0)
.s110:
237d : 85 4c __ STA T5 + 0 
237f : a9 00 __ LDA #$00
2381 : 85 47 __ STA T0 + 0 
2383 : ad fa ab LDA $abfa ; (sstack + 4)
2386 : f0 14 __ BEQ $239c ; (sformat.s114 + 0)
.s113:
2388 : a5 16 __ LDA P9 ; (buff + 0)
238a : 85 0d __ STA P0 
238c : a5 17 __ LDA P10 ; (buff + 1)
238e : 85 0e __ STA P1 
2390 : a9 00 __ LDA #$00
2392 : a4 4c __ LDY T5 + 0 
2394 : 91 16 __ STA (P9),y ; (buff + 0)
2396 : 20 09 27 JSR $2709 ; (puts.s0 + 0)
2399 : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s114:
239c : 18 __ __ CLC
239d : a5 16 __ LDA P9 ; (buff + 0)
239f : 65 4c __ ADC T5 + 0 
23a1 : 85 16 __ STA P9 ; (buff + 0)
23a3 : 90 80 __ BCC $2325 ; (sformat.l1 + 0)
.s1099:
23a5 : e6 17 __ INC P10 ; (buff + 1)
23a7 : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s4:
23aa : a5 47 __ LDA T0 + 0 
23ac : f0 27 __ BEQ $23d5 ; (sformat.s9 + 0)
.s7:
23ae : 84 47 __ STY T0 + 0 
23b0 : 85 4c __ STA T5 + 0 
23b2 : ad fa ab LDA $abfa ; (sstack + 4)
23b5 : f0 13 __ BEQ $23ca ; (sformat.s11 + 0)
.s10:
23b7 : a5 16 __ LDA P9 ; (buff + 0)
23b9 : 85 0d __ STA P0 
23bb : a5 17 __ LDA P10 ; (buff + 1)
23bd : 85 0e __ STA P1 
23bf : 98 __ __ TYA
23c0 : a4 4c __ LDY T5 + 0 
23c2 : 91 16 __ STA (P9),y ; (buff + 0)
23c4 : 20 09 27 JSR $2709 ; (puts.s0 + 0)
23c7 : 4c d5 23 JMP $23d5 ; (sformat.s9 + 0)
.s11:
23ca : 18 __ __ CLC
23cb : a5 16 __ LDA P9 ; (buff + 0)
23cd : 65 4c __ ADC T5 + 0 
23cf : 85 16 __ STA P9 ; (buff + 0)
23d1 : 90 02 __ BCC $23d5 ; (sformat.s9 + 0)
.s1095:
23d3 : e6 17 __ INC P10 ; (buff + 1)
.s9:
23d5 : a9 0a __ LDA #$0a
23d7 : 8d e1 ab STA $abe1 ; (vp_fill + 17)
23da : a9 00 __ LDA #$00
23dc : 8d e2 ab STA $abe2 ; (vp_fill + 18)
23df : 8d e3 ab STA $abe3 ; (vp_fill + 19)
23e2 : 8d e4 ab STA $abe4 ; (vp_fill + 20)
23e5 : 8d e5 ab STA $abe5 ; (vp_fill + 21)
23e8 : a0 01 __ LDY #$01
23ea : b1 49 __ LDA (T1 + 0),y 
23ec : a2 20 __ LDX #$20
23ee : 8e de ab STX $abde ; (vp_fill + 14)
23f1 : a2 00 __ LDX #$00
23f3 : 8e df ab STX $abdf ; (vp_fill + 15)
23f6 : ca __ __ DEX
23f7 : 8e e0 ab STX $abe0 ; (vp_fill + 16)
23fa : aa __ __ TAX
23fb : 18 __ __ CLC
23fc : a5 49 __ LDA T1 + 0 
23fe : 69 02 __ ADC #$02
.l14:
2400 : 85 49 __ STA T1 + 0 
2402 : 90 02 __ BCC $2406 ; (sformat.s1082 + 0)
.s1081:
2404 : e6 4a __ INC T1 + 1 
.s1082:
2406 : 8a __ __ TXA
2407 : e0 2b __ CPX #$2b
2409 : d0 08 __ BNE $2413 ; (sformat.s17 + 0)
.s16:
240b : a9 01 __ LDA #$01
240d : 8d e3 ab STA $abe3 ; (vp_fill + 19)
2410 : 4c f4 26 JMP $26f4 ; (sformat.s264 + 0)
.s17:
2413 : c9 30 __ CMP #$30
2415 : d0 06 __ BNE $241d ; (sformat.s20 + 0)
.s19:
2417 : 8d de ab STA $abde ; (vp_fill + 14)
241a : 4c f4 26 JMP $26f4 ; (sformat.s264 + 0)
.s20:
241d : c9 23 __ CMP #$23
241f : d0 08 __ BNE $2429 ; (sformat.s23 + 0)
.s22:
2421 : a9 01 __ LDA #$01
2423 : 8d e5 ab STA $abe5 ; (vp_fill + 21)
2426 : 4c f4 26 JMP $26f4 ; (sformat.s264 + 0)
.s23:
2429 : c9 2d __ CMP #$2d
242b : d0 08 __ BNE $2435 ; (sformat.s15 + 0)
.s25:
242d : a9 01 __ LDA #$01
242f : 8d e4 ab STA $abe4 ; (vp_fill + 20)
2432 : 4c f4 26 JMP $26f4 ; (sformat.s264 + 0)
.s15:
2435 : 85 4c __ STA T5 + 0 
2437 : c9 30 __ CMP #$30
2439 : 90 55 __ BCC $2490 ; (sformat.s31 + 0)
.s32:
243b : c9 3a __ CMP #$3a
243d : b0 51 __ BCS $2490 ; (sformat.s31 + 0)
.s29:
243f : a9 00 __ LDA #$00
2441 : 85 44 __ STA T6 + 0 
2443 : 85 45 __ STA T6 + 1 
2445 : e0 3a __ CPX #$3a
2447 : b0 40 __ BCS $2489 ; (sformat.s35 + 0)
.l34:
2449 : a5 44 __ LDA T6 + 0 
244b : 0a __ __ ASL
244c : 85 1b __ STA ACCU + 0 ; (fps + 0)
244e : a5 45 __ LDA T6 + 1 
2450 : 2a __ __ ROL
2451 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2453 : 2a __ __ ROL
2454 : aa __ __ TAX
2455 : 18 __ __ CLC
2456 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2458 : 65 44 __ ADC T6 + 0 
245a : 85 44 __ STA T6 + 0 
245c : 8a __ __ TXA
245d : 65 45 __ ADC T6 + 1 
245f : 06 44 __ ASL T6 + 0 
2461 : 2a __ __ ROL
2462 : aa __ __ TAX
2463 : 18 __ __ CLC
2464 : a5 44 __ LDA T6 + 0 
2466 : 65 4c __ ADC T5 + 0 
2468 : 90 01 __ BCC $246b ; (sformat.s1092 + 0)
.s1091:
246a : e8 __ __ INX
.s1092:
246b : 38 __ __ SEC
246c : e9 30 __ SBC #$30
246e : 85 44 __ STA T6 + 0 
2470 : 8a __ __ TXA
2471 : e9 00 __ SBC #$00
2473 : 85 45 __ STA T6 + 1 
2475 : a0 00 __ LDY #$00
2477 : b1 49 __ LDA (T1 + 0),y 
2479 : 85 4c __ STA T5 + 0 
247b : e6 49 __ INC T1 + 0 
247d : d0 02 __ BNE $2481 ; (sformat.s1094 + 0)
.s1093:
247f : e6 4a __ INC T1 + 1 
.s1094:
2481 : c9 30 __ CMP #$30
2483 : 90 04 __ BCC $2489 ; (sformat.s35 + 0)
.s36:
2485 : c9 3a __ CMP #$3a
2487 : 90 c0 __ BCC $2449 ; (sformat.l34 + 0)
.s35:
2489 : a5 44 __ LDA T6 + 0 
248b : 8d df ab STA $abdf ; (vp_fill + 15)
248e : a5 4c __ LDA T5 + 0 
.s31:
2490 : c9 2e __ CMP #$2e
2492 : d0 51 __ BNE $24e5 ; (sformat.s39 + 0)
.s37:
2494 : a9 00 __ LDA #$00
2496 : 85 44 __ STA T6 + 0 
.l243:
2498 : 85 45 __ STA T6 + 1 
249a : a0 00 __ LDY #$00
249c : b1 49 __ LDA (T1 + 0),y 
249e : 85 4c __ STA T5 + 0 
24a0 : e6 49 __ INC T1 + 0 
24a2 : d0 02 __ BNE $24a6 ; (sformat.s1084 + 0)
.s1083:
24a4 : e6 4a __ INC T1 + 1 
.s1084:
24a6 : c9 30 __ CMP #$30
24a8 : 90 04 __ BCC $24ae ; (sformat.s42 + 0)
.s43:
24aa : c9 3a __ CMP #$3a
24ac : 90 0a __ BCC $24b8 ; (sformat.s41 + 0)
.s42:
24ae : a5 44 __ LDA T6 + 0 
24b0 : 8d e0 ab STA $abe0 ; (vp_fill + 16)
24b3 : a5 4c __ LDA T5 + 0 
24b5 : 4c e5 24 JMP $24e5 ; (sformat.s39 + 0)
.s41:
24b8 : a5 44 __ LDA T6 + 0 
24ba : 0a __ __ ASL
24bb : 85 1b __ STA ACCU + 0 ; (fps + 0)
24bd : a5 45 __ LDA T6 + 1 
24bf : 2a __ __ ROL
24c0 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24c2 : 2a __ __ ROL
24c3 : aa __ __ TAX
24c4 : 18 __ __ CLC
24c5 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24c7 : 65 44 __ ADC T6 + 0 
24c9 : 85 44 __ STA T6 + 0 
24cb : 8a __ __ TXA
24cc : 65 45 __ ADC T6 + 1 
24ce : 06 44 __ ASL T6 + 0 
24d0 : 2a __ __ ROL
24d1 : aa __ __ TAX
24d2 : 18 __ __ CLC
24d3 : a5 44 __ LDA T6 + 0 
24d5 : 65 4c __ ADC T5 + 0 
24d7 : 90 01 __ BCC $24da ; (sformat.s1090 + 0)
.s1089:
24d9 : e8 __ __ INX
.s1090:
24da : 38 __ __ SEC
24db : e9 30 __ SBC #$30
24dd : 85 44 __ STA T6 + 0 
24df : 8a __ __ TXA
24e0 : e9 00 __ SBC #$00
24e2 : 4c 98 24 JMP $2498 ; (sformat.l243 + 0)
.s39:
24e5 : c9 64 __ CMP #$64
24e7 : f0 04 __ BEQ $24ed ; (sformat.s44 + 0)
.s47:
24e9 : c9 44 __ CMP #$44
24eb : d0 05 __ BNE $24f2 ; (sformat.s45 + 0)
.s44:
24ed : a9 01 __ LDA #$01
24ef : 4c b8 26 JMP $26b8 ; (sformat.s261 + 0)
.s45:
24f2 : c9 75 __ CMP #$75
24f4 : d0 03 __ BNE $24f9 ; (sformat.s51 + 0)
24f6 : 4c b6 26 JMP $26b6 ; (sformat.s291 + 0)
.s51:
24f9 : c9 55 __ CMP #$55
24fb : d0 03 __ BNE $2500 ; (sformat.s49 + 0)
24fd : 4c b6 26 JMP $26b6 ; (sformat.s291 + 0)
.s49:
2500 : c9 78 __ CMP #$78
2502 : f0 04 __ BEQ $2508 ; (sformat.s52 + 0)
.s55:
2504 : c9 58 __ CMP #$58
2506 : d0 0d __ BNE $2515 ; (sformat.s53 + 0)
.s52:
2508 : a9 10 __ LDA #$10
250a : 8d e1 ab STA $abe1 ; (vp_fill + 17)
250d : a9 00 __ LDA #$00
250f : 8d e2 ab STA $abe2 ; (vp_fill + 18)
2512 : 4c b6 26 JMP $26b6 ; (sformat.s291 + 0)
.s53:
2515 : c9 6c __ CMP #$6c
2517 : d0 03 __ BNE $251c ; (sformat.s59 + 0)
2519 : 4c 2d 26 JMP $262d ; (sformat.s56 + 0)
.s59:
251c : c9 4c __ CMP #$4c
251e : d0 03 __ BNE $2523 ; (sformat.s57 + 0)
2520 : 4c 2d 26 JMP $262d ; (sformat.s56 + 0)
.s57:
2523 : c9 73 __ CMP #$73
2525 : f0 54 __ BEQ $257b ; (sformat.s72 + 0)
.s75:
2527 : c9 53 __ CMP #$53
2529 : f0 50 __ BEQ $257b ; (sformat.s72 + 0)
.s73:
252b : c9 63 __ CMP #$63
252d : f0 23 __ BEQ $2552 ; (sformat.s103 + 0)
.s106:
252f : c9 43 __ CMP #$43
2531 : f0 1f __ BEQ $2552 ; (sformat.s103 + 0)
.s104:
2533 : 09 00 __ ORA #$00
2535 : d0 03 __ BNE $253a ; (sformat.s107 + 0)
2537 : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s107:
253a : 18 __ __ CLC
253b : a5 16 __ LDA P9 ; (buff + 0)
253d : 65 47 __ ADC T0 + 0 
253f : 85 44 __ STA T6 + 0 
2541 : a5 17 __ LDA P10 ; (buff + 1)
2543 : 69 00 __ ADC #$00
2545 : 85 45 __ STA T6 + 1 
2547 : a5 4c __ LDA T5 + 0 
.s1068:
2549 : a0 00 __ LDY #$00
254b : 91 44 __ STA (T6 + 0),y 
254d : e6 47 __ INC T0 + 0 
254f : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s103:
2552 : ad f8 ab LDA $abf8 ; (sstack + 2)
2555 : 85 4c __ STA T5 + 0 
2557 : 18 __ __ CLC
2558 : 69 02 __ ADC #$02
255a : 8d f8 ab STA $abf8 ; (sstack + 2)
255d : ad f9 ab LDA $abf9 ; (sstack + 3)
2560 : 85 4d __ STA T5 + 1 
2562 : 69 00 __ ADC #$00
2564 : 8d f9 ab STA $abf9 ; (sstack + 3)
2567 : 18 __ __ CLC
2568 : a5 16 __ LDA P9 ; (buff + 0)
256a : 65 47 __ ADC T0 + 0 
256c : 85 44 __ STA T6 + 0 
256e : a5 17 __ LDA P10 ; (buff + 1)
2570 : 69 00 __ ADC #$00
2572 : 85 45 __ STA T6 + 1 
2574 : a0 00 __ LDY #$00
2576 : b1 4c __ LDA (T5 + 0),y 
2578 : 4c 49 25 JMP $2549 ; (sformat.s1068 + 0)
.s72:
257b : ad f8 ab LDA $abf8 ; (sstack + 2)
257e : 85 4c __ STA T5 + 0 
2580 : 18 __ __ CLC
2581 : 69 02 __ ADC #$02
2583 : 8d f8 ab STA $abf8 ; (sstack + 2)
2586 : ad f9 ab LDA $abf9 ; (sstack + 3)
2589 : 85 4d __ STA T5 + 1 
258b : 69 00 __ ADC #$00
258d : 8d f9 ab STA $abf9 ; (sstack + 3)
2590 : a0 00 __ LDY #$00
2592 : 84 4b __ STY T3 + 0 
2594 : b1 4c __ LDA (T5 + 0),y 
2596 : aa __ __ TAX
2597 : c8 __ __ INY
2598 : b1 4c __ LDA (T5 + 0),y 
259a : 86 4c __ STX T5 + 0 
259c : 85 4d __ STA T5 + 1 
259e : ad df ab LDA $abdf ; (vp_fill + 15)
25a1 : f0 0c __ BEQ $25af ; (sformat.s78 + 0)
.s1073:
25a3 : 88 __ __ DEY
25a4 : b1 4c __ LDA (T5 + 0),y 
25a6 : f0 05 __ BEQ $25ad ; (sformat.s1074 + 0)
.l80:
25a8 : c8 __ __ INY
25a9 : b1 4c __ LDA (T5 + 0),y 
25ab : d0 fb __ BNE $25a8 ; (sformat.l80 + 0)
.s1074:
25ad : 84 4b __ STY T3 + 0 
.s78:
25af : ad e4 ab LDA $abe4 ; (vp_fill + 20)
25b2 : d0 19 __ BNE $25cd ; (sformat.s84 + 0)
.s1077:
25b4 : a6 4b __ LDX T3 + 0 
25b6 : ec df ab CPX $abdf ; (vp_fill + 15)
25b9 : a4 47 __ LDY T0 + 0 
25bb : b0 0c __ BCS $25c9 ; (sformat.s1078 + 0)
.l86:
25bd : ad de ab LDA $abde ; (vp_fill + 14)
25c0 : 91 16 __ STA (P9),y ; (buff + 0)
25c2 : e8 __ __ INX
25c3 : ec df ab CPX $abdf ; (vp_fill + 15)
25c6 : c8 __ __ INY
25c7 : 90 f4 __ BCC $25bd ; (sformat.l86 + 0)
.s1078:
25c9 : 86 4b __ STX T3 + 0 
25cb : 84 47 __ STY T0 + 0 
.s84:
25cd : ad fa ab LDA $abfa ; (sstack + 4)
25d0 : d0 37 __ BNE $2609 ; (sformat.s88 + 0)
.l94:
25d2 : a0 00 __ LDY #$00
25d4 : b1 4c __ LDA (T5 + 0),y 
25d6 : f0 0f __ BEQ $25e7 ; (sformat.s251 + 0)
.s95:
25d8 : a4 47 __ LDY T0 + 0 
25da : 91 16 __ STA (P9),y ; (buff + 0)
25dc : e6 47 __ INC T0 + 0 
25de : e6 4c __ INC T5 + 0 
25e0 : d0 f0 __ BNE $25d2 ; (sformat.l94 + 0)
.s1087:
25e2 : e6 4d __ INC T5 + 1 
25e4 : 4c d2 25 JMP $25d2 ; (sformat.l94 + 0)
.s251:
25e7 : ad e4 ab LDA $abe4 ; (vp_fill + 20)
25ea : d0 03 __ BNE $25ef ; (sformat.s1075 + 0)
25ec : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s1075:
25ef : a6 4b __ LDX T3 + 0 
25f1 : ec df ab CPX $abdf ; (vp_fill + 15)
25f4 : a4 47 __ LDY T0 + 0 
25f6 : b0 0c __ BCS $2604 ; (sformat.s1076 + 0)
.l101:
25f8 : ad de ab LDA $abde ; (vp_fill + 14)
25fb : 91 16 __ STA (P9),y ; (buff + 0)
25fd : e8 __ __ INX
25fe : ec df ab CPX $abdf ; (vp_fill + 15)
2601 : c8 __ __ INY
2602 : 90 f4 __ BCC $25f8 ; (sformat.l101 + 0)
.s1076:
2604 : 84 47 __ STY T0 + 0 
2606 : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s88:
2609 : a5 47 __ LDA T0 + 0 
260b : f0 1a __ BEQ $2627 ; (sformat.s93 + 0)
.s91:
260d : a5 16 __ LDA P9 ; (buff + 0)
260f : 85 0d __ STA P0 
2611 : a5 17 __ LDA P10 ; (buff + 1)
2613 : 85 0e __ STA P1 
2615 : a9 00 __ LDA #$00
2617 : a4 47 __ LDY T0 + 0 
2619 : 91 16 __ STA (P9),y ; (buff + 0)
261b : 20 09 27 JSR $2709 ; (puts.s0 + 0)
261e : 20 01 27 JSR $2701 ; (puts@proxy + 0)
2621 : a9 00 __ LDA #$00
2623 : 85 47 __ STA T0 + 0 
2625 : f0 c0 __ BEQ $25e7 ; (sformat.s251 + 0)
.s93:
2627 : 20 01 27 JSR $2701 ; (puts@proxy + 0)
262a : 4c e7 25 JMP $25e7 ; (sformat.s251 + 0)
.s56:
262d : ad f8 ab LDA $abf8 ; (sstack + 2)
2630 : 85 4c __ STA T5 + 0 
2632 : 18 __ __ CLC
2633 : 69 04 __ ADC #$04
2635 : 8d f8 ab STA $abf8 ; (sstack + 2)
2638 : ad f9 ab LDA $abf9 ; (sstack + 3)
263b : 85 4d __ STA T5 + 1 
263d : 69 00 __ ADC #$00
263f : 8d f9 ab STA $abf9 ; (sstack + 3)
2642 : a0 00 __ LDY #$00
2644 : b1 49 __ LDA (T1 + 0),y 
2646 : aa __ __ TAX
2647 : e6 49 __ INC T1 + 0 
2649 : d0 02 __ BNE $264d ; (sformat.s1086 + 0)
.s1085:
264b : e6 4a __ INC T1 + 1 
.s1086:
264d : b1 4c __ LDA (T5 + 0),y 
264f : 85 53 __ STA T7 + 0 
2651 : a0 01 __ LDY #$01
2653 : b1 4c __ LDA (T5 + 0),y 
2655 : 85 54 __ STA T7 + 1 
2657 : c8 __ __ INY
2658 : b1 4c __ LDA (T5 + 0),y 
265a : 85 55 __ STA T7 + 2 
265c : c8 __ __ INY
265d : b1 4c __ LDA (T5 + 0),y 
265f : a8 __ __ TAY
2660 : 8a __ __ TXA
2661 : e0 64 __ CPX #$64
2663 : f0 04 __ BEQ $2669 ; (sformat.s60 + 0)
.s63:
2665 : c9 44 __ CMP #$44
2667 : d0 04 __ BNE $266d ; (sformat.s61 + 0)
.s60:
2669 : a9 01 __ LDA #$01
266b : d0 1f __ BNE $268c ; (sformat.s262 + 0)
.s61:
266d : c9 75 __ CMP #$75
266f : f0 19 __ BEQ $268a ; (sformat.s292 + 0)
.s67:
2671 : c9 55 __ CMP #$55
2673 : f0 15 __ BEQ $268a ; (sformat.s292 + 0)
.s65:
2675 : c9 78 __ CMP #$78
2677 : f0 07 __ BEQ $2680 ; (sformat.s68 + 0)
.s71:
2679 : c9 58 __ CMP #$58
267b : f0 03 __ BEQ $2680 ; (sformat.s68 + 0)
267d : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s68:
2680 : a9 10 __ LDA #$10
2682 : 8d e1 ab STA $abe1 ; (vp_fill + 17)
2685 : a9 00 __ LDA #$00
2687 : 8d e2 ab STA $abe2 ; (vp_fill + 18)
.s292:
268a : a9 00 __ LDA #$00
.s262:
268c : 84 14 __ STY P7 
268e : 85 15 __ STA P8 
2690 : a5 16 __ LDA P9 ; (buff + 0)
2692 : 85 0f __ STA P2 
2694 : a5 17 __ LDA P10 ; (buff + 1)
2696 : 85 10 __ STA P3 
2698 : a5 53 __ LDA T7 + 0 
269a : 85 11 __ STA P4 
269c : a5 54 __ LDA T7 + 1 
269e : 85 12 __ STA P5 
26a0 : a5 55 __ LDA T7 + 2 
26a2 : 85 13 __ STA P6 
26a4 : a9 de __ LDA #$de
26a6 : 85 0d __ STA P0 
26a8 : a9 ab __ LDA #$ab
26aa : 85 0e __ STA P1 
26ac : 20 93 28 JSR $2893 ; (nforml.s0 + 0)
.s1069:
26af : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26b1 : 85 47 __ STA T0 + 0 
26b3 : 4c 25 23 JMP $2325 ; (sformat.l1 + 0)
.s291:
26b6 : a9 00 __ LDA #$00
.s261:
26b8 : 85 13 __ STA P6 
26ba : a5 16 __ LDA P9 ; (buff + 0)
26bc : 85 0f __ STA P2 
26be : a5 17 __ LDA P10 ; (buff + 1)
26c0 : 85 10 __ STA P3 
26c2 : ad f8 ab LDA $abf8 ; (sstack + 2)
26c5 : 85 47 __ STA T0 + 0 
26c7 : ad f9 ab LDA $abf9 ; (sstack + 3)
26ca : 85 48 __ STA T0 + 1 
26cc : a0 00 __ LDY #$00
26ce : b1 47 __ LDA (T0 + 0),y 
26d0 : 85 11 __ STA P4 
26d2 : c8 __ __ INY
26d3 : b1 47 __ LDA (T0 + 0),y 
26d5 : 85 12 __ STA P5 
26d7 : 18 __ __ CLC
26d8 : a5 47 __ LDA T0 + 0 
26da : 69 02 __ ADC #$02
26dc : 8d f8 ab STA $abf8 ; (sstack + 2)
26df : a5 48 __ LDA T0 + 1 
26e1 : 69 00 __ ADC #$00
26e3 : 8d f9 ab STA $abf9 ; (sstack + 3)
26e6 : a9 de __ LDA #$de
26e8 : 85 0d __ STA P0 
26ea : a9 ab __ LDA #$ab
26ec : 85 0e __ STA P1 
26ee : 20 5e 27 JSR $275e ; (nformi.s0 + 0)
26f1 : 4c af 26 JMP $26af ; (sformat.s1069 + 0)
.s264:
26f4 : a0 00 __ LDY #$00
26f6 : b1 49 __ LDA (T1 + 0),y 
26f8 : aa __ __ TAX
26f9 : 18 __ __ CLC
26fa : a5 49 __ LDA T1 + 0 
26fc : 69 01 __ ADC #$01
26fe : 4c 00 24 JMP $2400 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
2701 : a5 4c __ LDA $4c 
2703 : 85 0d __ STA P0 
2705 : a5 4d __ LDA $4d 
2707 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2709 : a0 00 __ LDY #$00
270b : b1 0d __ LDA (P0),y 
270d : f0 0b __ BEQ $271a ; (puts.s1001 + 0)
270f : 20 1b 27 JSR $271b ; (putpch + 0)
2712 : e6 0d __ INC P0 
2714 : d0 f3 __ BNE $2709 ; (puts.s0 + 0)
2716 : e6 0e __ INC P1 
2718 : d0 ef __ BNE $2709 ; (puts.s0 + 0)
.s1001:
271a : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
271b : ae fe 2a LDX $2afe ; (giocharmap + 0)
271e : e0 01 __ CPX #$01
2720 : 90 26 __ BCC $2748 ; (putpch + 45)
2722 : c9 0a __ CMP #$0a
2724 : d0 02 __ BNE $2728 ; (putpch + 13)
2726 : a9 0d __ LDA #$0d
2728 : c9 09 __ CMP #$09
272a : f0 1f __ BEQ $274b ; (putpch + 48)
272c : e0 02 __ CPX #$02
272e : 90 18 __ BCC $2748 ; (putpch + 45)
2730 : c9 41 __ CMP #$41
2732 : 90 14 __ BCC $2748 ; (putpch + 45)
2734 : c9 7b __ CMP #$7b
2736 : b0 10 __ BCS $2748 ; (putpch + 45)
2738 : c9 61 __ CMP #$61
273a : b0 04 __ BCS $2740 ; (putpch + 37)
273c : c9 5b __ CMP #$5b
273e : b0 08 __ BCS $2748 ; (putpch + 45)
2740 : 49 20 __ EOR #$20
2742 : e0 03 __ CPX #$03
2744 : f0 02 __ BEQ $2748 ; (putpch + 45)
2746 : 29 df __ AND #$df
2748 : 4c d2 ff JMP $ffd2 
274b : 38 __ __ SEC
274c : 20 f0 ff JSR $fff0 
274f : 98 __ __ TYA
2750 : 29 03 __ AND #$03
2752 : 49 03 __ EOR #$03
2754 : aa __ __ TAX
2755 : a9 20 __ LDA #$20
2757 : 20 d2 ff JSR $ffd2 
275a : ca __ __ DEX
275b : 10 fa __ BPL $2757 ; (putpch + 60)
275d : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
275e : a9 00 __ LDA #$00
2760 : 85 43 __ STA T0 + 0 
2762 : a5 13 __ LDA P6 ; (s + 0)
2764 : f0 13 __ BEQ $2779 ; (nformi.s182 + 0)
.s4:
2766 : 24 12 __ BIT P5 ; (v + 1)
2768 : 10 0f __ BPL $2779 ; (nformi.s182 + 0)
.s1:
276a : 38 __ __ SEC
276b : a9 00 __ LDA #$00
276d : e5 11 __ SBC P4 ; (v + 0)
276f : 85 11 __ STA P4 ; (v + 0)
2771 : a9 00 __ LDA #$00
2773 : e5 12 __ SBC P5 ; (v + 1)
2775 : 85 12 __ STA P5 ; (v + 1)
2777 : e6 43 __ INC T0 + 0 
.s182:
2779 : a9 10 __ LDA #$10
277b : 85 44 __ STA T2 + 0 
277d : a5 11 __ LDA P4 ; (v + 0)
277f : 05 12 __ ORA P5 ; (v + 1)
2781 : f0 46 __ BEQ $27c9 ; (nformi.s7 + 0)
.s42:
2783 : a0 03 __ LDY #$03
2785 : b1 0d __ LDA (P0),y ; (si + 0)
2787 : 85 45 __ STA T4 + 0 
2789 : c8 __ __ INY
278a : b1 0d __ LDA (P0),y ; (si + 0)
278c : 85 46 __ STA T4 + 1 
.l6:
278e : a5 11 __ LDA P4 ; (v + 0)
2790 : 85 1b __ STA ACCU + 0 
2792 : a5 12 __ LDA P5 ; (v + 1)
2794 : 85 1c __ STA ACCU + 1 
2796 : a5 45 __ LDA T4 + 0 
2798 : 85 03 __ STA WORK + 0 
279a : a5 46 __ LDA T4 + 1 
279c : 85 04 __ STA WORK + 1 
279e : 20 88 56 JSR $5688 ; (divmod + 0)
27a1 : a5 06 __ LDA WORK + 3 
27a3 : 30 08 __ BMI $27ad ; (nformi.s78 + 0)
.s1019:
27a5 : d0 0a __ BNE $27b1 ; (nformi.s77 + 0)
.s1018:
27a7 : a5 05 __ LDA WORK + 2 
27a9 : c9 0a __ CMP #$0a
27ab : b0 04 __ BCS $27b1 ; (nformi.s77 + 0)
.s78:
27ad : a9 30 __ LDA #$30
27af : d0 02 __ BNE $27b3 ; (nformi.s79 + 0)
.s77:
27b1 : a9 37 __ LDA #$37
.s79:
27b3 : 18 __ __ CLC
27b4 : 65 05 __ ADC WORK + 2 
27b6 : c6 44 __ DEC T2 + 0 
27b8 : a6 44 __ LDX T2 + 0 
27ba : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
27bd : a5 1b __ LDA ACCU + 0 
27bf : 85 11 __ STA P4 ; (v + 0)
27c1 : a5 1c __ LDA ACCU + 1 
27c3 : 85 12 __ STA P5 ; (v + 1)
27c5 : 05 11 __ ORA P4 ; (v + 0)
27c7 : d0 c5 __ BNE $278e ; (nformi.l6 + 0)
.s7:
27c9 : a0 02 __ LDY #$02
27cb : b1 0d __ LDA (P0),y ; (si + 0)
27cd : c9 ff __ CMP #$ff
27cf : d0 04 __ BNE $27d5 ; (nformi.s80 + 0)
.s81:
27d1 : a9 0f __ LDA #$0f
27d3 : d0 05 __ BNE $27da ; (nformi.s1026 + 0)
.s80:
27d5 : 38 __ __ SEC
27d6 : a9 10 __ LDA #$10
27d8 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27da : a8 __ __ TAY
27db : c4 44 __ CPY T2 + 0 
27dd : b0 0d __ BCS $27ec ; (nformi.s10 + 0)
.s9:
27df : a9 30 __ LDA #$30
.l1027:
27e1 : c6 44 __ DEC T2 + 0 
27e3 : a6 44 __ LDX T2 + 0 
27e5 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
27e8 : c4 44 __ CPY T2 + 0 
27ea : 90 f5 __ BCC $27e1 ; (nformi.l1027 + 0)
.s10:
27ec : a0 07 __ LDY #$07
27ee : b1 0d __ LDA (P0),y ; (si + 0)
27f0 : f0 20 __ BEQ $2812 ; (nformi.s13 + 0)
.s14:
27f2 : a0 04 __ LDY #$04
27f4 : b1 0d __ LDA (P0),y ; (si + 0)
27f6 : d0 1a __ BNE $2812 ; (nformi.s13 + 0)
.s1013:
27f8 : 88 __ __ DEY
27f9 : b1 0d __ LDA (P0),y ; (si + 0)
27fb : c9 10 __ CMP #$10
27fd : d0 13 __ BNE $2812 ; (nformi.s13 + 0)
.s11:
27ff : a9 58 __ LDA #$58
2801 : a6 44 __ LDX T2 + 0 
2803 : 9d e5 ab STA $abe5,x ; (vp_fill + 21)
2806 : 8a __ __ TXA
2807 : 18 __ __ CLC
2808 : 69 fe __ ADC #$fe
280a : 85 44 __ STA T2 + 0 
280c : aa __ __ TAX
280d : a9 30 __ LDA #$30
280f : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s13:
2812 : a9 00 __ LDA #$00
2814 : 85 1b __ STA ACCU + 0 
2816 : a5 43 __ LDA T0 + 0 
2818 : f0 06 __ BEQ $2820 ; (nformi.s16 + 0)
.s15:
281a : c6 44 __ DEC T2 + 0 
281c : a9 2d __ LDA #$2d
281e : d0 0a __ BNE $282a ; (nformi.s1025 + 0)
.s16:
2820 : a0 05 __ LDY #$05
2822 : b1 0d __ LDA (P0),y ; (si + 0)
2824 : f0 09 __ BEQ $282f ; (nformi.s163 + 0)
.s18:
2826 : c6 44 __ DEC T2 + 0 
2828 : a9 2b __ LDA #$2b
.s1025:
282a : a6 44 __ LDX T2 + 0 
282c : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s163:
282f : a0 06 __ LDY #$06
2831 : b1 0d __ LDA (P0),y ; (si + 0)
2833 : d0 33 __ BNE $2868 ; (nformi.s24 + 0)
.l30:
2835 : a0 01 __ LDY #$01
2837 : b1 0d __ LDA (P0),y ; (si + 0)
2839 : 18 __ __ CLC
283a : 65 44 __ ADC T2 + 0 
283c : b0 04 __ BCS $2842 ; (nformi.s31 + 0)
.s1006:
283e : c9 11 __ CMP #$11
2840 : 90 0d __ BCC $284f ; (nformi.s33 + 0)
.s31:
2842 : c6 44 __ DEC T2 + 0 
2844 : a0 00 __ LDY #$00
2846 : b1 0d __ LDA (P0),y ; (si + 0)
2848 : a6 44 __ LDX T2 + 0 
284a : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
284d : b0 e6 __ BCS $2835 ; (nformi.l30 + 0)
.s33:
284f : a6 44 __ LDX T2 + 0 
2851 : e0 10 __ CPX #$10
2853 : b0 0e __ BCS $2863 ; (nformi.s23 + 0)
.s34:
2855 : 88 __ __ DEY
.l1022:
2856 : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
2859 : 91 0f __ STA (P2),y ; (str + 0)
285b : e8 __ __ INX
285c : e0 10 __ CPX #$10
285e : c8 __ __ INY
285f : 90 f5 __ BCC $2856 ; (nformi.l1022 + 0)
.s1023:
2861 : 84 1b __ STY ACCU + 0 
.s23:
2863 : a9 00 __ LDA #$00
2865 : 85 1c __ STA ACCU + 1 
.s1001:
2867 : 60 __ __ RTS
.s24:
2868 : a6 44 __ LDX T2 + 0 
286a : e0 10 __ CPX #$10
286c : b0 1a __ BCS $2888 ; (nformi.l27 + 0)
.s25:
286e : a0 00 __ LDY #$00
.l1020:
2870 : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
2873 : 91 0f __ STA (P2),y ; (str + 0)
2875 : e8 __ __ INX
2876 : e0 10 __ CPX #$10
2878 : c8 __ __ INY
2879 : 90 f5 __ BCC $2870 ; (nformi.l1020 + 0)
.s1021:
287b : 84 1b __ STY ACCU + 0 
287d : b0 09 __ BCS $2888 ; (nformi.l27 + 0)
.s28:
287f : 88 __ __ DEY
2880 : b1 0d __ LDA (P0),y ; (si + 0)
2882 : a4 1b __ LDY ACCU + 0 
2884 : 91 0f __ STA (P2),y ; (str + 0)
2886 : e6 1b __ INC ACCU + 0 
.l27:
2888 : a5 1b __ LDA ACCU + 0 
288a : a0 01 __ LDY #$01
288c : d1 0d __ CMP (P0),y ; (si + 0)
288e : 90 ef __ BCC $287f ; (nformi.s28 + 0)
2890 : 4c 63 28 JMP $2863 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2893 : a9 00 __ LDA #$00
2895 : 85 43 __ STA T0 + 0 
2897 : a5 15 __ LDA P8 ; (s + 0)
2899 : f0 21 __ BEQ $28bc ; (nforml.s182 + 0)
.s4:
289b : a5 14 __ LDA P7 ; (v + 3)
289d : f0 1d __ BEQ $28bc ; (nforml.s182 + 0)
.s1032:
289f : 10 1b __ BPL $28bc ; (nforml.s182 + 0)
.s1:
28a1 : 38 __ __ SEC
28a2 : a9 00 __ LDA #$00
28a4 : e5 11 __ SBC P4 ; (v + 0)
28a6 : 85 11 __ STA P4 ; (v + 0)
28a8 : a9 00 __ LDA #$00
28aa : e5 12 __ SBC P5 ; (v + 1)
28ac : 85 12 __ STA P5 ; (v + 1)
28ae : a9 00 __ LDA #$00
28b0 : e5 13 __ SBC P6 ; (v + 2)
28b2 : 85 13 __ STA P6 ; (v + 2)
28b4 : a9 00 __ LDA #$00
28b6 : e5 14 __ SBC P7 ; (v + 3)
28b8 : 85 14 __ STA P7 ; (v + 3)
28ba : e6 43 __ INC T0 + 0 
.s182:
28bc : a9 10 __ LDA #$10
28be : 85 44 __ STA T2 + 0 
28c0 : a5 14 __ LDA P7 ; (v + 3)
28c2 : d0 0c __ BNE $28d0 ; (nforml.s42 + 0)
.s1024:
28c4 : a5 13 __ LDA P6 ; (v + 2)
28c6 : d0 08 __ BNE $28d0 ; (nforml.s42 + 0)
.s1025:
28c8 : a5 12 __ LDA P5 ; (v + 1)
28ca : d0 04 __ BNE $28d0 ; (nforml.s42 + 0)
.s1026:
28cc : c5 11 __ CMP P4 ; (v + 0)
28ce : b0 0e __ BCS $28de ; (nforml.s7 + 0)
.s42:
28d0 : a0 03 __ LDY #$03
28d2 : b1 0d __ LDA (P0),y ; (si + 0)
28d4 : 85 45 __ STA T5 + 0 
28d6 : c8 __ __ INY
28d7 : b1 0d __ LDA (P0),y ; (si + 0)
28d9 : 85 46 __ STA T5 + 1 
28db : 4c a8 29 JMP $29a8 ; (nforml.l6 + 0)
.s7:
28de : a0 02 __ LDY #$02
28e0 : b1 0d __ LDA (P0),y ; (si + 0)
28e2 : c9 ff __ CMP #$ff
28e4 : d0 04 __ BNE $28ea ; (nforml.s80 + 0)
.s81:
28e6 : a9 0f __ LDA #$0f
28e8 : d0 05 __ BNE $28ef ; (nforml.s1039 + 0)
.s80:
28ea : 38 __ __ SEC
28eb : a9 10 __ LDA #$10
28ed : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
28ef : a8 __ __ TAY
28f0 : c4 44 __ CPY T2 + 0 
28f2 : b0 0d __ BCS $2901 ; (nforml.s10 + 0)
.s9:
28f4 : a9 30 __ LDA #$30
.l1040:
28f6 : c6 44 __ DEC T2 + 0 
28f8 : a6 44 __ LDX T2 + 0 
28fa : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
28fd : c4 44 __ CPY T2 + 0 
28ff : 90 f5 __ BCC $28f6 ; (nforml.l1040 + 0)
.s10:
2901 : a0 07 __ LDY #$07
2903 : b1 0d __ LDA (P0),y ; (si + 0)
2905 : f0 20 __ BEQ $2927 ; (nforml.s13 + 0)
.s14:
2907 : a0 04 __ LDY #$04
2909 : b1 0d __ LDA (P0),y ; (si + 0)
290b : d0 1a __ BNE $2927 ; (nforml.s13 + 0)
.s1013:
290d : 88 __ __ DEY
290e : b1 0d __ LDA (P0),y ; (si + 0)
2910 : c9 10 __ CMP #$10
2912 : d0 13 __ BNE $2927 ; (nforml.s13 + 0)
.s11:
2914 : a9 58 __ LDA #$58
2916 : a6 44 __ LDX T2 + 0 
2918 : 9d e5 ab STA $abe5,x ; (vp_fill + 21)
291b : 8a __ __ TXA
291c : 18 __ __ CLC
291d : 69 fe __ ADC #$fe
291f : 85 44 __ STA T2 + 0 
2921 : aa __ __ TAX
2922 : a9 30 __ LDA #$30
2924 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s13:
2927 : a9 00 __ LDA #$00
2929 : 85 1b __ STA ACCU + 0 
292b : a5 43 __ LDA T0 + 0 
292d : f0 06 __ BEQ $2935 ; (nforml.s16 + 0)
.s15:
292f : c6 44 __ DEC T2 + 0 
2931 : a9 2d __ LDA #$2d
2933 : d0 0a __ BNE $293f ; (nforml.s1038 + 0)
.s16:
2935 : a0 05 __ LDY #$05
2937 : b1 0d __ LDA (P0),y ; (si + 0)
2939 : f0 09 __ BEQ $2944 ; (nforml.s163 + 0)
.s18:
293b : c6 44 __ DEC T2 + 0 
293d : a9 2b __ LDA #$2b
.s1038:
293f : a6 44 __ LDX T2 + 0 
2941 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
.s163:
2944 : a0 06 __ LDY #$06
2946 : b1 0d __ LDA (P0),y ; (si + 0)
2948 : d0 33 __ BNE $297d ; (nforml.s24 + 0)
.l30:
294a : a0 01 __ LDY #$01
294c : b1 0d __ LDA (P0),y ; (si + 0)
294e : 18 __ __ CLC
294f : 65 44 __ ADC T2 + 0 
2951 : b0 04 __ BCS $2957 ; (nforml.s31 + 0)
.s1006:
2953 : c9 11 __ CMP #$11
2955 : 90 0d __ BCC $2964 ; (nforml.s33 + 0)
.s31:
2957 : c6 44 __ DEC T2 + 0 
2959 : a0 00 __ LDY #$00
295b : b1 0d __ LDA (P0),y ; (si + 0)
295d : a6 44 __ LDX T2 + 0 
295f : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
2962 : b0 e6 __ BCS $294a ; (nforml.l30 + 0)
.s33:
2964 : a6 44 __ LDX T2 + 0 
2966 : e0 10 __ CPX #$10
2968 : b0 0e __ BCS $2978 ; (nforml.s23 + 0)
.s34:
296a : 88 __ __ DEY
.l1035:
296b : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
296e : 91 0f __ STA (P2),y ; (str + 0)
2970 : e8 __ __ INX
2971 : e0 10 __ CPX #$10
2973 : c8 __ __ INY
2974 : 90 f5 __ BCC $296b ; (nforml.l1035 + 0)
.s1036:
2976 : 84 1b __ STY ACCU + 0 
.s23:
2978 : a9 00 __ LDA #$00
297a : 85 1c __ STA ACCU + 1 
.s1001:
297c : 60 __ __ RTS
.s24:
297d : a6 44 __ LDX T2 + 0 
297f : e0 10 __ CPX #$10
2981 : b0 1a __ BCS $299d ; (nforml.l27 + 0)
.s25:
2983 : a0 00 __ LDY #$00
.l1033:
2985 : bd e6 ab LDA $abe6,x ; (vp_fill + 22)
2988 : 91 0f __ STA (P2),y ; (str + 0)
298a : e8 __ __ INX
298b : e0 10 __ CPX #$10
298d : c8 __ __ INY
298e : 90 f5 __ BCC $2985 ; (nforml.l1033 + 0)
.s1034:
2990 : 84 1b __ STY ACCU + 0 
2992 : b0 09 __ BCS $299d ; (nforml.l27 + 0)
.s28:
2994 : 88 __ __ DEY
2995 : b1 0d __ LDA (P0),y ; (si + 0)
2997 : a4 1b __ LDY ACCU + 0 
2999 : 91 0f __ STA (P2),y ; (str + 0)
299b : e6 1b __ INC ACCU + 0 
.l27:
299d : a5 1b __ LDA ACCU + 0 
299f : a0 01 __ LDY #$01
29a1 : d1 0d __ CMP (P0),y ; (si + 0)
29a3 : 90 ef __ BCC $2994 ; (nforml.s28 + 0)
29a5 : 4c 78 29 JMP $2978 ; (nforml.s23 + 0)
.l6:
29a8 : a5 11 __ LDA P4 ; (v + 0)
29aa : 85 1b __ STA ACCU + 0 
29ac : a5 12 __ LDA P5 ; (v + 1)
29ae : 85 1c __ STA ACCU + 1 
29b0 : a5 13 __ LDA P6 ; (v + 2)
29b2 : 85 1d __ STA ACCU + 2 
29b4 : a5 14 __ LDA P7 ; (v + 3)
29b6 : 85 1e __ STA ACCU + 3 
29b8 : a5 45 __ LDA T5 + 0 
29ba : 85 03 __ STA WORK + 0 
29bc : a5 46 __ LDA T5 + 1 
29be : 85 04 __ STA WORK + 1 
29c0 : a9 00 __ LDA #$00
29c2 : 85 05 __ STA WORK + 2 
29c4 : 85 06 __ STA WORK + 3 
29c6 : 20 0d 57 JSR $570d ; (divmod32 + 0)
29c9 : a5 08 __ LDA WORK + 5 
29cb : 30 08 __ BMI $29d5 ; (nforml.s78 + 0)
.s1023:
29cd : d0 0a __ BNE $29d9 ; (nforml.s77 + 0)
.s1022:
29cf : a5 07 __ LDA WORK + 4 
29d1 : c9 0a __ CMP #$0a
29d3 : b0 04 __ BCS $29d9 ; (nforml.s77 + 0)
.s78:
29d5 : a9 30 __ LDA #$30
29d7 : d0 02 __ BNE $29db ; (nforml.s79 + 0)
.s77:
29d9 : a9 37 __ LDA #$37
.s79:
29db : 18 __ __ CLC
29dc : 65 07 __ ADC WORK + 4 
29de : c6 44 __ DEC T2 + 0 
29e0 : a6 44 __ LDX T2 + 0 
29e2 : 9d e6 ab STA $abe6,x ; (vp_fill + 22)
29e5 : a5 1b __ LDA ACCU + 0 
29e7 : 85 11 __ STA P4 ; (v + 0)
29e9 : a5 1c __ LDA ACCU + 1 
29eb : 85 12 __ STA P5 ; (v + 1)
29ed : a5 1d __ LDA ACCU + 2 
29ef : 85 13 __ STA P6 ; (v + 2)
29f1 : a5 1e __ LDA ACCU + 3 
29f3 : 85 14 __ STA P7 ; (v + 3)
29f5 : d0 b1 __ BNE $29a8 ; (nforml.l6 + 0)
.s1018:
29f7 : a5 13 __ LDA P6 ; (v + 2)
29f9 : d0 ad __ BNE $29a8 ; (nforml.l6 + 0)
.s1019:
29fb : a5 12 __ LDA P5 ; (v + 1)
29fd : d0 a9 __ BNE $29a8 ; (nforml.l6 + 0)
.s1020:
29ff : c5 11 __ CMP P4 ; (v + 0)
2a01 : 90 a5 __ BCC $29a8 ; (nforml.l6 + 0)
2a03 : 4c de 28 JMP $28de ; (nforml.s7 + 0)
--------------------------------------------------------------------
2a06 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2a16 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2a26 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2a30 : 38 __ __ SEC
2a31 : a5 23 __ LDA SP + 0 
2a33 : e9 06 __ SBC #$06
2a35 : 85 23 __ STA SP + 0 
2a37 : b0 02 __ BCS $2a3b ; (load_overlay.s0 + 0)
2a39 : c6 24 __ DEC SP + 1 
.s0:
2a3b : a9 00 __ LDA #$00
2a3d : 85 0d __ STA P0 
2a3f : 85 0e __ STA P1 
2a41 : 20 a2 2a JSR $2aa2 ; (krnio_setbnk.s0 + 0)
2a44 : a9 97 __ LDA #$97
2a46 : 85 0d __ STA P0 
2a48 : a9 2a __ LDA #$2a
2a4a : 85 0e __ STA P1 
2a4c : 20 a9 2a JSR $2aa9 ; (krnio_setnam.s0 + 0)
2a4f : a9 01 __ LDA #$01
2a51 : 85 0d __ STA P0 
2a53 : 85 0f __ STA P2 
2a55 : ad ff 53 LDA $53ff ; (bootdevice + 0)
2a58 : 85 0e __ STA P1 
2a5a : 20 bf 2a JSR $2abf ; (krnio_load.s0 + 0)
2a5d : 09 00 __ ORA #$00
2a5f : d0 2a __ BNE $2a8b ; (load_overlay.s1001 + 0)
.s1:
2a61 : a9 dc __ LDA #$dc
2a63 : a0 02 __ LDY #$02
2a65 : 91 23 __ STA (SP + 0),y 
2a67 : a9 2a __ LDA #$2a
2a69 : c8 __ __ INY
2a6a : 91 23 __ STA (SP + 0),y 
2a6c : 20 df 22 JSR $22df ; (printf.s0 + 0)
2a6f : a9 00 __ LDA #$00
2a71 : a0 02 __ LDY #$02
2a73 : 91 23 __ STA (SP + 0),y 
2a75 : a9 2b __ LDA #$2b
2a77 : c8 __ __ INY
2a78 : 91 23 __ STA (SP + 0),y 
2a7a : ad ea 5a LDA $5aea ; (krnio_pstatus + 1)
2a7d : c8 __ __ INY
2a7e : 91 23 __ STA (SP + 0),y 
2a80 : a9 00 __ LDA #$00
2a82 : c8 __ __ INY
2a83 : 91 23 __ STA (SP + 0),y 
2a85 : 20 df 22 JSR $22df ; (printf.s0 + 0)
2a88 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s1001:
2a8b : 18 __ __ CLC
2a8c : a5 23 __ LDA SP + 0 
2a8e : 69 06 __ ADC #$06
2a90 : 85 23 __ STA SP + 0 
2a92 : 90 02 __ BCC $2a96 ; (load_overlay.s1001 + 11)
2a94 : e6 24 __ INC SP + 1 
2a96 : 60 __ __ RTS
--------------------------------------------------------------------
2a97 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2aa2 : a5 0d __ LDA P0 
2aa4 : a6 0e __ LDX P1 
2aa6 : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2aa9 : a5 0d __ LDA P0 
2aab : 05 0e __ ORA P1 
2aad : f0 08 __ BEQ $2ab7 ; (krnio_setnam.s0 + 14)
2aaf : a0 ff __ LDY #$ff
2ab1 : c8 __ __ INY
2ab2 : b1 0d __ LDA (P0),y 
2ab4 : d0 fb __ BNE $2ab1 ; (krnio_setnam.s0 + 8)
2ab6 : 98 __ __ TYA
2ab7 : a6 0d __ LDX P0 
2ab9 : a4 0e __ LDY P1 
2abb : 20 bd ff JSR $ffbd 
.s1001:
2abe : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2abf : a5 0d __ LDA P0 
2ac1 : a6 0e __ LDX P1 
2ac3 : a4 0f __ LDY P2 
2ac5 : 20 ba ff JSR $ffba 
2ac8 : a9 00 __ LDA #$00
2aca : a2 00 __ LDX #$00
2acc : a0 00 __ LDY #$00
2ace : 20 d5 ff JSR $ffd5 
2ad1 : a9 00 __ LDA #$00
2ad3 : b0 02 __ BCS $2ad7 ; (krnio_load.s0 + 24)
2ad5 : a9 01 __ LDA #$01
2ad7 : 85 1b __ STA ACCU + 0 
.s1001:
2ad9 : a5 1b __ LDA ACCU + 0 
2adb : 60 __ __ RTS
--------------------------------------------------------------------
2adc : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2aec : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
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
2b00 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
2b0c : a9 01 __ LDA #$01
2b0e : 85 0d __ STA P0 
2b10 : a9 00 __ LDA #$00
2b12 : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
2b14 : a5 0d __ LDA P0 
2b16 : 85 1b __ STA ACCU + 0 
2b18 : a5 0e __ LDA P1 
2b1a : 85 1c __ STA ACCU + 1 
2b1c : ae fd 2a LDX $2afd ; (spentry + 0)
2b1f : 9a __ __ TXS
2b20 : a9 4c __ LDA #$4c
2b22 : 85 54 __ STA $54 
2b24 : a9 00 __ LDA #$00
2b26 : 85 13 __ STA P6 
.s1001:
2b28 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_viewport_init: ; vdcwin_viewport_init(struct VDCViewport*,u8,u8*,u16,u16,u16,u16,u8,u8)->void
.s0:
2b29 : a9 7f __ LDA #$7f
2b2b : 8d f9 5a STA $5af9 ; (charsetchanged + 0)
2b2e : a9 00 __ LDA #$00
2b30 : 8d fd 5a STA $5afd ; (screen_col + 1)
2b33 : 8d ff 5a STA $5aff ; (screen_row + 1)
2b36 : 8d 00 5b STA $5b00 ; (vdc_modes + 0)
2b39 : 8d 01 5b STA $5b01 ; (vdc_modes + 1)
2b3c : 8d 02 5b STA $5b02 ; (vdc_modes + 2)
2b3f : 8d 03 5b STA $5b03 ; (vdc_modes + 3)
2b42 : 8d fa 5a STA $5afa ; (charsetchanged + 1)
2b45 : 85 0f __ STA P2 
2b47 : 85 10 __ STA P3 
2b49 : a9 50 __ LDA #$50
2b4b : 8d fc 5a STA $5afc ; (screen_col + 0)
2b4e : 85 11 __ STA P4 
2b50 : a9 19 __ LDA #$19
2b52 : 8d fe 5a STA $5afe ; (screen_row + 0)
2b55 : 85 12 __ STA P5 
2b57 : a9 58 __ LDA #$58
2b59 : 8d fb 5a STA $5afb ; (appexit + 0)
2b5c : a9 04 __ LDA #$04
2b5e : 85 0d __ STA P0 
2b60 : a9 5b __ LDA #$5b
2b62 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
2b64 : a9 00 __ LDA #$00
2b66 : a0 04 __ LDY #$04
2b68 : 91 0d __ STA (P0),y ; (win + 0)
2b6a : c8 __ __ INY
2b6b : 91 0d __ STA (P0),y ; (win + 0)
2b6d : a5 0f __ LDA P2 ; (sx + 0)
2b6f : a0 00 __ LDY #$00
2b71 : 91 0d __ STA (P0),y ; (win + 0)
2b73 : a5 10 __ LDA P3 ; (sy + 0)
2b75 : c8 __ __ INY
2b76 : 91 0d __ STA (P0),y ; (win + 0)
2b78 : a5 11 __ LDA P4 ; (wx + 0)
2b7a : c8 __ __ INY
2b7b : 91 0d __ STA (P0),y ; (win + 0)
2b7d : a5 12 __ LDA P5 ; (wy + 0)
2b7f : c8 __ __ INY
2b80 : 91 0d __ STA (P0),y ; (win + 0)
2b82 : 06 10 __ ASL P3 ; (sy + 0)
2b84 : a6 10 __ LDX P3 ; (sy + 0)
2b86 : bd 00 5c LDA $5c00,x ; (multab + 0)
2b89 : 18 __ __ CLC
2b8a : 65 0f __ ADC P2 ; (sx + 0)
2b8c : 85 1b __ STA ACCU + 0 
2b8e : bd 01 5c LDA $5c01,x ; (multab + 1)
2b91 : 69 00 __ ADC #$00
2b93 : a8 __ __ TAY
2b94 : ad e0 5b LDA $5be0 ; (vdc_state + 8)
2b97 : 18 __ __ CLC
2b98 : 65 1b __ ADC ACCU + 0 
2b9a : 85 1b __ STA ACCU + 0 
2b9c : 98 __ __ TYA
2b9d : 6d e1 5b ADC $5be1 ; (vdc_state + 9)
2ba0 : a0 07 __ LDY #$07
2ba2 : 91 0d __ STA (P0),y ; (win + 0)
2ba4 : a5 1b __ LDA ACCU + 0 
2ba6 : 88 __ __ DEY
2ba7 : 91 0d __ STA (P0),y ; (win + 0)
2ba9 : bd 00 5c LDA $5c00,x ; (multab + 0)
2bac : 18 __ __ CLC
2bad : 65 0f __ ADC P2 ; (sx + 0)
2baf : 85 1b __ STA ACCU + 0 
2bb1 : bd 01 5c LDA $5c01,x ; (multab + 1)
2bb4 : 69 00 __ ADC #$00
2bb6 : aa __ __ TAX
2bb7 : ad e2 5b LDA $5be2 ; (vdc_state + 10)
2bba : 18 __ __ CLC
2bbb : 65 1b __ ADC ACCU + 0 
2bbd : 85 1b __ STA ACCU + 0 
2bbf : 8a __ __ TXA
2bc0 : 6d e3 5b ADC $5be3 ; (vdc_state + 11)
2bc3 : a0 09 __ LDY #$09
2bc5 : 91 0d __ STA (P0),y ; (win + 0)
2bc7 : a5 1b __ LDA ACCU + 0 
2bc9 : 88 __ __ DEY
2bca : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
2bcc : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
2bcd : a9 00 __ LDA #$00
2bcf : 8d fa ab STA $abfa ; (sstack + 4)
2bd2 : a0 02 __ LDY #$02
2bd4 : b1 23 __ LDA (SP + 0),y 
2bd6 : 85 16 __ STA P9 
2bd8 : c8 __ __ INY
2bd9 : b1 23 __ LDA (SP + 0),y 
2bdb : 85 17 __ STA P10 
2bdd : c8 __ __ INY
2bde : b1 23 __ LDA (SP + 0),y 
2be0 : 8d f6 ab STA $abf6 ; (sstack + 0)
2be3 : c8 __ __ INY
2be4 : b1 23 __ LDA (SP + 0),y 
2be6 : 8d f7 ab STA $abf7 ; (sstack + 1)
2be9 : 18 __ __ CLC
2bea : a5 23 __ LDA SP + 0 
2bec : 69 06 __ ADC #$06
2bee : 8d f8 ab STA $abf8 ; (sstack + 2)
2bf1 : a5 24 __ LDA SP + 1 
2bf3 : 69 00 __ ADC #$00
2bf5 : 8d f9 ab STA $abf9 ; (sstack + 3)
2bf8 : 4c 08 23 JMP $2308 ; (sformat.s1000 + 0)
--------------------------------------------------------------------
2bfb : __ __ __ BYT 6d 41 49 4e 00                                  : mAIN.
--------------------------------------------------------------------
2c00 : __ __ __ BYT 77 49 44 54 48 3a 20 20 20 25 35 49 20 00       : wIDTH:   %5I .
--------------------------------------------------------------------
2c0e : __ __ __ BYT 68 45 49 47 48 54 3a 20 20 25 35 49 20 00       : hEIGHT:  %5I .
--------------------------------------------------------------------
2c1c : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 3a 20 25 32 49 20 : bACKGROUND: %2I 
2c2c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2c2d : 38 __ __ SEC
2c2e : a5 23 __ LDA SP + 0 
2c30 : e9 04 __ SBC #$04
2c32 : 85 23 __ STA SP + 0 
2c34 : b0 02 __ BCS $2c38 ; (vdc_init.s0 + 0)
2c36 : c6 24 __ DEC SP + 1 
.s0:
2c38 : a9 1a __ LDA #$1a
2c3a : 8d 00 d6 STA $d600 
.l128:
2c3d : 2c 00 d6 BIT $d600 
2c40 : 10 fb __ BPL $2c3d ; (vdc_init.l128 + 0)
.s7:
2c42 : ad 01 d6 LDA $d601 
2c45 : 29 f0 __ AND #$f0
2c47 : aa __ __ TAX
2c48 : a9 1a __ LDA #$1a
2c4a : 8d 00 d6 STA $d600 
.l130:
2c4d : 2c 00 d6 BIT $d600 
2c50 : 10 fb __ BPL $2c4d ; (vdc_init.l130 + 0)
.s13:
2c52 : 8e 01 d6 STX $d601 
2c55 : 8d 00 d6 STA $d600 
.l132:
2c58 : 2c 00 d6 BIT $d600 
2c5b : 10 fb __ BPL $2c58 ; (vdc_init.l132 + 0)
.s20:
2c5d : ad 01 d6 LDA $d601 
2c60 : 29 0f __ AND #$0f
2c62 : 09 d0 __ ORA #$d0
2c64 : a2 1a __ LDX #$1a
2c66 : 8e 00 d6 STX $d600 
.l134:
2c69 : 2c 00 d6 BIT $d600 
2c6c : 10 fb __ BPL $2c69 ; (vdc_init.l134 + 0)
.s26:
2c6e : 8d 01 d6 STA $d601 
2c71 : a9 8d __ LDA #$8d
2c73 : 8d df 5b STA $5bdf ; (vdc_state + 7)
2c76 : 20 b2 2c JSR $2cb2 ; (vdc_detect_mem_size.s0 + 0)
2c79 : 24 d7 __ BIT $d7 
2c7b : 30 17 __ BMI $2c94 ; (vdc_init.s29 + 0)
.s32:
2c7d : a9 7c __ LDA #$7c
2c7f : a0 02 __ LDY #$02
2c81 : 91 23 __ STA (SP + 0),y 
2c83 : a9 2e __ LDA #$2e
2c85 : c8 __ __ INY
2c86 : 91 23 __ STA (SP + 0),y 
2c88 : 20 df 22 JSR $22df ; (printf.s0 + 0)
2c8b : 20 a7 2e JSR $2ea7 ; (getch.s0 + 0)
2c8e : 20 81 ff JSR $ff81 
2c91 : 20 e2 2e JSR $2ee2 ; (screen_setmode.s0 + 0)
.s29:
2c94 : a9 01 __ LDA #$01
2c96 : 20 ea 2e JSR $2eea ; (fastmode.s0 + 0)
2c99 : 20 09 2f JSR $2f09 ; (vdc_set_mode@proxy + 0)
2c9c : ad d8 5b LDA $5bd8 ; (vdc_state + 0)
2c9f : c9 40 __ CMP #$40
2ca1 : d0 03 __ BNE $2ca6 ; (vdc_init.s1001 + 0)
.s39:
2ca3 : 20 f7 30 JSR $30f7 ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
2ca6 : 18 __ __ CLC
2ca7 : a5 23 __ LDA SP + 0 
2ca9 : 69 04 __ ADC #$04
2cab : 85 23 __ STA SP + 0 
2cad : 90 02 __ BCC $2cb1 ; (vdc_init.s1001 + 11)
2caf : e6 24 __ INC SP + 1 
2cb1 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2cb2 : a9 1c __ LDA #$1c
2cb4 : 8d 00 d6 STA $d600 
.l335:
2cb7 : 2c 00 d6 BIT $d600 
2cba : 10 fb __ BPL $2cb7 ; (vdc_detect_mem_size.l335 + 0)
.s5:
2cbc : ad 01 d6 LDA $d601 
2cbf : a8 __ __ TAY
2cc0 : 09 10 __ ORA #$10
2cc2 : a2 1c __ LDX #$1c
2cc4 : 8e 00 d6 STX $d600 
.l337:
2cc7 : 2c 00 d6 BIT $d600 
2cca : 10 fb __ BPL $2cc7 ; (vdc_detect_mem_size.l337 + 0)
.s12:
2ccc : 8d 01 d6 STA $d601 
2ccf : a9 12 __ LDA #$12
2cd1 : 8d 00 d6 STA $d600 
.l339:
2cd4 : 2c 00 d6 BIT $d600 
2cd7 : 10 fb __ BPL $2cd4 ; (vdc_detect_mem_size.l339 + 0)
.s19:
2cd9 : a9 1f __ LDA #$1f
2cdb : 8d 01 d6 STA $d601 
2cde : a9 13 __ LDA #$13
2ce0 : 8d 00 d6 STA $d600 
.l341:
2ce3 : 2c 00 d6 BIT $d600 
2ce6 : 10 fb __ BPL $2ce3 ; (vdc_detect_mem_size.l341 + 0)
.s24:
2ce8 : a9 ff __ LDA #$ff
2cea : 8d 01 d6 STA $d601 
2ced : a9 1f __ LDA #$1f
2cef : 8d 00 d6 STA $d600 
.l343:
2cf2 : 2c 00 d6 BIT $d600 
2cf5 : 10 fb __ BPL $2cf2 ; (vdc_detect_mem_size.l343 + 0)
.s28:
2cf7 : a9 00 __ LDA #$00
2cf9 : 8d 01 d6 STA $d601 
2cfc : a9 12 __ LDA #$12
2cfe : 8d 00 d6 STA $d600 
.l345:
2d01 : 2c 00 d6 BIT $d600 
2d04 : 10 fb __ BPL $2d01 ; (vdc_detect_mem_size.l345 + 0)
.s35:
2d06 : a9 9f __ LDA #$9f
2d08 : 8d 01 d6 STA $d601 
2d0b : a9 13 __ LDA #$13
2d0d : 8d 00 d6 STA $d600 
.l347:
2d10 : 2c 00 d6 BIT $d600 
2d13 : 10 fb __ BPL $2d10 ; (vdc_detect_mem_size.l347 + 0)
.s40:
2d15 : a9 ff __ LDA #$ff
2d17 : 8d 01 d6 STA $d601 
2d1a : a9 1f __ LDA #$1f
2d1c : 8d 00 d6 STA $d600 
.l349:
2d1f : 2c 00 d6 BIT $d600 
2d22 : 10 fb __ BPL $2d1f ; (vdc_detect_mem_size.l349 + 0)
.s44:
2d24 : a9 ff __ LDA #$ff
2d26 : 8d 01 d6 STA $d601 
2d29 : a9 12 __ LDA #$12
2d2b : 8d 00 d6 STA $d600 
.l351:
2d2e : 2c 00 d6 BIT $d600 
2d31 : 10 fb __ BPL $2d2e ; (vdc_detect_mem_size.l351 + 0)
.s51:
2d33 : a9 1f __ LDA #$1f
2d35 : 8d 01 d6 STA $d601 
2d38 : a9 13 __ LDA #$13
2d3a : 8d 00 d6 STA $d600 
.l353:
2d3d : 2c 00 d6 BIT $d600 
2d40 : 10 fb __ BPL $2d3d ; (vdc_detect_mem_size.l353 + 0)
.s56:
2d42 : a9 ff __ LDA #$ff
2d44 : 8d 01 d6 STA $d601 
2d47 : a9 1f __ LDA #$1f
2d49 : 8d 00 d6 STA $d600 
.l355:
2d4c : 2c 00 d6 BIT $d600 
2d4f : 10 fb __ BPL $2d4c ; (vdc_detect_mem_size.l355 + 0)
.s60:
2d51 : ad 01 d6 LDA $d601 
2d54 : f0 04 __ BEQ $2d5a ; (vdc_detect_mem_size.s1026 + 0)
.s1027:
2d56 : a9 10 __ LDA #$10
2d58 : d0 02 __ BNE $2d5c ; (vdc_detect_mem_size.s1028 + 0)
.s1026:
2d5a : a9 40 __ LDA #$40
.s1028:
2d5c : 8d d8 5b STA $5bd8 ; (vdc_state + 0)
2d5f : 8e 00 d6 STX $d600 
.l358:
2d62 : 2c 00 d6 BIT $d600 
2d65 : 10 fb __ BPL $2d62 ; (vdc_detect_mem_size.l358 + 0)
.s67:
2d67 : 8c 01 d6 STY $d601 
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2d6a : a9 00 __ LDA #$00
2d6c : 85 0f __ STA P2 
2d6e : 85 14 __ STA P7 
2d70 : ad db 5b LDA $5bdb ; (vdc_state + 3)
2d73 : 85 13 __ STA P6 
2d75 : ad dd 5b LDA $5bdd ; (vdc_state + 5)
2d78 : 85 15 __ STA P8 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2d7a : 18 __ __ CLC
2d7b : a5 14 __ LDA P7 ; (y + 0)
2d7d : 65 15 __ ADC P8 ; (lines + 0)
2d7f : 85 46 __ STA T1 + 0 
2d81 : a9 00 __ LDA #$00
2d83 : 2a __ __ ROL
2d84 : 85 47 __ STA T1 + 1 
.l1:
2d86 : f0 05 __ BEQ $2d8d ; (vdc_clear.s1002 + 0)
.s1004:
2d88 : a5 14 __ LDA P7 ; (y + 0)
2d8a : 4c 93 2d JMP $2d93 ; (vdc_clear.s2 + 0)
.s1002:
2d8d : a5 14 __ LDA P7 ; (y + 0)
2d8f : c5 46 __ CMP T1 + 0 
2d91 : b0 10 __ BCS $2da3 ; (vdc_clear.s1001 + 0)
.s2:
2d93 : 85 10 __ STA P3 
2d95 : a9 20 __ LDA #$20
2d97 : 85 11 __ STA P4 
2d99 : 20 a4 2d JSR $2da4 ; (vdc_hchar@proxy + 0)
2d9c : e6 14 __ INC P7 ; (y + 0)
2d9e : a5 47 __ LDA T1 + 1 
2da0 : 4c 86 2d JMP $2d86 ; (vdc_clear.l1 + 0)
.s1001:
2da3 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
2da4 : ad df 5b LDA $5bdf ; (vdc_state + 7)
2da7 : 85 12 __ STA P5 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u8,u8,u8,u8,u8)->void
.s0:
2da9 : a5 10 __ LDA P3 ; (y + 0)
2dab : 0a __ __ ASL
2dac : aa __ __ TAX
2dad : bd 00 5c LDA $5c00,x ; (multab + 0)
2db0 : 18 __ __ CLC
2db1 : 65 0f __ ADC P2 ; (x + 0)
2db3 : 85 43 __ STA T1 + 0 
2db5 : bd 01 5c LDA $5c01,x ; (multab + 1)
2db8 : 69 00 __ ADC #$00
2dba : 85 44 __ STA T1 + 1 
2dbc : ad e0 5b LDA $5be0 ; (vdc_state + 8)
2dbf : 18 __ __ CLC
2dc0 : 65 43 __ ADC T1 + 0 
2dc2 : 85 0d __ STA P0 
2dc4 : ad e1 5b LDA $5be1 ; (vdc_state + 9)
2dc7 : 65 44 __ ADC T1 + 1 
2dc9 : 85 0e __ STA P1 
2dcb : 20 58 2e JSR $2e58 ; (vdc_mem_addr.s0 + 0)
2dce : a6 13 __ LDX P6 ; (length + 0)
2dd0 : ca __ __ DEX
2dd1 : 86 45 __ STX T2 + 0 
.l221:
2dd3 : 2c 00 d6 BIT $d600 
2dd6 : 10 fb __ BPL $2dd3 ; (vdc_hchar.l221 + 0)
.s6:
2dd8 : a5 11 __ LDA P4 ; (val + 0)
2dda : 8d 01 d6 STA $d601 
2ddd : a9 18 __ LDA #$18
2ddf : 8d 00 d6 STA $d600 
.l223:
2de2 : 2c 00 d6 BIT $d600 
2de5 : 10 fb __ BPL $2de2 ; (vdc_hchar.l223 + 0)
.s12:
2de7 : ad 01 d6 LDA $d601 
2dea : 29 7f __ AND #$7f
2dec : a2 18 __ LDX #$18
2dee : 8e 00 d6 STX $d600 
.l225:
2df1 : 2c 00 d6 BIT $d600 
2df4 : 10 fb __ BPL $2df1 ; (vdc_hchar.l225 + 0)
.s18:
2df6 : 8d 01 d6 STA $d601 
2df9 : a9 1e __ LDA #$1e
2dfb : 8d 00 d6 STA $d600 
.l227:
2dfe : 2c 00 d6 BIT $d600 
2e01 : 10 fb __ BPL $2dfe ; (vdc_hchar.l227 + 0)
.s23:
2e03 : a5 45 __ LDA T2 + 0 
2e05 : 8d 01 d6 STA $d601 
2e08 : ad e2 5b LDA $5be2 ; (vdc_state + 10)
2e0b : 18 __ __ CLC
2e0c : 65 43 __ ADC T1 + 0 
2e0e : 85 0d __ STA P0 
2e10 : ad e3 5b LDA $5be3 ; (vdc_state + 11)
2e13 : 65 44 __ ADC T1 + 1 
2e15 : 85 0e __ STA P1 
2e17 : 20 58 2e JSR $2e58 ; (vdc_mem_addr.s0 + 0)
.l229:
2e1a : 2c 00 d6 BIT $d600 
2e1d : 10 fb __ BPL $2e1a ; (vdc_hchar.l229 + 0)
.s27:
2e1f : a5 12 __ LDA P5 ; (attr + 0)
2e21 : 8d 01 d6 STA $d601 
2e24 : a9 18 __ LDA #$18
2e26 : 8d 00 d6 STA $d600 
.l231:
2e29 : 2c 00 d6 BIT $d600 
2e2c : 10 fb __ BPL $2e29 ; (vdc_hchar.l231 + 0)
.s33:
2e2e : ad 01 d6 LDA $d601 
2e31 : 29 7f __ AND #$7f
2e33 : a2 18 __ LDX #$18
2e35 : 8e 00 d6 STX $d600 
.l233:
2e38 : 2c 00 d6 BIT $d600 
2e3b : 10 fb __ BPL $2e38 ; (vdc_hchar.l233 + 0)
.s39:
2e3d : 8d 01 d6 STA $d601 
2e40 : a9 1e __ LDA #$1e
2e42 : 8d 00 d6 STA $d600 
.l235:
2e45 : 2c 00 d6 BIT $d600 
2e48 : 10 fb __ BPL $2e45 ; (vdc_hchar.l235 + 0)
.s44:
2e4a : a5 45 __ LDA T2 + 0 
2e4c : 8d 01 d6 STA $d601 
.s1001:
2e4f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2e50 : a5 0f __ LDA P2 
2e52 : 85 0d __ STA P0 
2e54 : a5 10 __ LDA P3 
2e56 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2e58 : a9 12 __ LDA #$12
2e5a : 8d 00 d6 STA $d600 
.l56:
2e5d : 2c 00 d6 BIT $d600 
2e60 : 10 fb __ BPL $2e5d ; (vdc_mem_addr.l56 + 0)
.s5:
2e62 : a5 0e __ LDA P1 ; (addr + 1)
2e64 : 8d 01 d6 STA $d601 
2e67 : a9 13 __ LDA #$13
2e69 : 8d 00 d6 STA $d600 
.l58:
2e6c : 2c 00 d6 BIT $d600 
2e6f : 10 fb __ BPL $2e6c ; (vdc_mem_addr.l58 + 0)
.s10:
2e71 : a5 0d __ LDA P0 ; (addr + 0)
2e73 : 8d 01 d6 STA $d601 
2e76 : a9 1f __ LDA #$1f
2e78 : 8d 00 d6 STA $d600 
.s1001:
2e7b : 60 __ __ RTS
--------------------------------------------------------------------
2e7c : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2e8c : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2e9c : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
2ea7 : 20 b1 2e JSR $2eb1 ; (getpch + 0)
2eaa : c9 00 __ CMP #$00
2eac : f0 f9 __ BEQ $2ea7 ; (getch.s0 + 0)
2eae : 85 1b __ STA ACCU + 0 
.s1001:
2eb0 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2eb1 : 20 e4 ff JSR $ffe4 
2eb4 : ae fe 2a LDX $2afe ; (giocharmap + 0)
2eb7 : e0 01 __ CPX #$01
2eb9 : 90 26 __ BCC $2ee1 ; (getpch + 48)
2ebb : c9 0d __ CMP #$0d
2ebd : d0 02 __ BNE $2ec1 ; (getpch + 16)
2ebf : a9 0a __ LDA #$0a
2ec1 : e0 02 __ CPX #$02
2ec3 : 90 1c __ BCC $2ee1 ; (getpch + 48)
2ec5 : c9 db __ CMP #$db
2ec7 : b0 18 __ BCS $2ee1 ; (getpch + 48)
2ec9 : c9 41 __ CMP #$41
2ecb : 90 14 __ BCC $2ee1 ; (getpch + 48)
2ecd : c9 c1 __ CMP #$c1
2ecf : 90 02 __ BCC $2ed3 ; (getpch + 34)
2ed1 : 49 a0 __ EOR #$a0
2ed3 : c9 7b __ CMP #$7b
2ed5 : b0 0a __ BCS $2ee1 ; (getpch + 48)
2ed7 : c9 61 __ CMP #$61
2ed9 : b0 04 __ BCS $2edf ; (getpch + 46)
2edb : c9 5b __ CMP #$5b
2edd : b0 02 __ BCS $2ee1 ; (getpch + 48)
2edf : 49 20 __ EOR #$20
2ee1 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2ee2 : 24 d7 __ BIT $d7 
2ee4 : 10 01 __ BPL $2ee7 ; (screen_setmode.s6 + 0)
.s1001:
2ee6 : 60 __ __ RTS
.s6:
2ee7 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2eea : 09 00 __ ORA #$00
2eec : d0 0d __ BNE $2efb ; (fastmode.s1 + 0)
.s2:
2eee : 8d 30 d0 STA $d030 
2ef1 : ad 11 d0 LDA $d011 
2ef4 : 29 7f __ AND #$7f
2ef6 : 09 10 __ ORA #$10
2ef8 : 4c 05 2f JMP $2f05 ; (fastmode.s3 + 0)
.s1:
2efb : a9 01 __ LDA #$01
2efd : 8d 30 d0 STA $d030 
2f00 : ad 11 d0 LDA $d011 
2f03 : 29 6f __ AND #$6f
.s3:
2f05 : 8d 11 d0 STA $d011 
.s1001:
2f08 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2f09 : a9 00 __ LDA #$00
2f0b : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2f0d : a4 16 __ LDY P9 ; (mode + 0)
2f0f : be e5 55 LDX $55e5,y ; (__multab36L + 0)
2f12 : 86 49 __ STX T1 + 0 
2f14 : 86 4b __ STX T2 + 0 
2f16 : bd 04 5b LDA $5b04,x ; (vdc_modes + 4)
2f19 : f0 08 __ BEQ $2f23 ; (vdc_set_mode.s3 + 0)
.s4:
2f1b : ad d8 5b LDA $5bd8 ; (vdc_state + 0)
2f1e : c9 10 __ CMP #$10
2f20 : d0 01 __ BNE $2f23 ; (vdc_set_mode.s3 + 0)
2f22 : 60 __ __ RTS
.s3:
2f23 : 8c da 5b STY $5bda ; (vdc_state + 2)
2f26 : a9 00 __ LDA #$00
2f28 : 8d ee 5b STA $5bee ; (vdc_state + 22)
2f2b : 8d ef 5b STA $5bef ; (vdc_state + 23)
2f2e : 8d f0 5b STA $5bf0 ; (vdc_state + 24)
2f31 : bd 00 5b LDA $5b00,x ; (vdc_modes + 0)
2f34 : 8d db 5b STA $5bdb ; (vdc_state + 3)
2f37 : bd 01 5b LDA $5b01,x ; (vdc_modes + 1)
2f3a : 8d dc 5b STA $5bdc ; (vdc_state + 4)
2f3d : bd 02 5b LDA $5b02,x ; (vdc_modes + 2)
2f40 : 8d dd 5b STA $5bdd ; (vdc_state + 5)
2f43 : bd 03 5b LDA $5b03,x ; (vdc_modes + 3)
2f46 : 8d de 5b STA $5bde ; (vdc_state + 6)
2f49 : bd 09 5b LDA $5b09,x ; (vdc_modes + 9)
2f4c : 8d e4 5b STA $5be4 ; (vdc_state + 12)
2f4f : bd 0a 5b LDA $5b0a,x ; (vdc_modes + 10)
2f52 : 8d e5 5b STA $5be5 ; (vdc_state + 13)
2f55 : bd 0b 5b LDA $5b0b,x ; (vdc_modes + 11)
2f58 : 8d e6 5b STA $5be6 ; (vdc_state + 14)
2f5b : bd 0c 5b LDA $5b0c,x ; (vdc_modes + 12)
2f5e : 8d e7 5b STA $5be7 ; (vdc_state + 15)
2f61 : bd 0d 5b LDA $5b0d,x ; (vdc_modes + 13)
2f64 : 8d e8 5b STA $5be8 ; (vdc_state + 16)
2f67 : bd 0e 5b LDA $5b0e,x ; (vdc_modes + 14)
2f6a : 8d e9 5b STA $5be9 ; (vdc_state + 17)
2f6d : bd 0f 5b LDA $5b0f,x ; (vdc_modes + 15)
2f70 : 8d ea 5b STA $5bea ; (vdc_state + 18)
2f73 : bd 10 5b LDA $5b10,x ; (vdc_modes + 16)
2f76 : 8d eb 5b STA $5beb ; (vdc_state + 19)
2f79 : bd 11 5b LDA $5b11,x ; (vdc_modes + 17)
2f7c : 8d ec 5b STA $5bec ; (vdc_state + 20)
2f7f : bd 12 5b LDA $5b12,x ; (vdc_modes + 18)
2f82 : 8d ed 5b STA $5bed ; (vdc_state + 21)
2f85 : bd 05 5b LDA $5b05,x ; (vdc_modes + 5)
2f88 : 85 4c __ STA T3 + 0 
2f8a : 8d e0 5b STA $5be0 ; (vdc_state + 8)
2f8d : bd 06 5b LDA $5b06,x ; (vdc_modes + 6)
2f90 : 85 4d __ STA T3 + 1 
2f92 : 8d e1 5b STA $5be1 ; (vdc_state + 9)
2f95 : bd 07 5b LDA $5b07,x ; (vdc_modes + 7)
2f98 : 85 4e __ STA T5 + 0 
2f9a : 8d e2 5b STA $5be2 ; (vdc_state + 10)
2f9d : bd 08 5b LDA $5b08,x ; (vdc_modes + 8)
2fa0 : 85 4f __ STA T5 + 1 
2fa2 : 8d e3 5b STA $5be3 ; (vdc_state + 11)
2fa5 : 20 7d 30 JSR $307d ; (vdc_set_multab.s0 + 0)
2fa8 : a9 22 __ LDA #$22
2faa : 8d 00 d6 STA $d600 
.l295:
2fad : 2c 00 d6 BIT $d600 
2fb0 : 10 fb __ BPL $2fad ; (vdc_set_mode.l295 + 0)
.s11:
2fb2 : a9 80 __ LDA #$80
2fb4 : 8d 01 d6 STA $d601 
2fb7 : a9 0c __ LDA #$0c
2fb9 : 8d 00 d6 STA $d600 
.l297:
2fbc : 2c 00 d6 BIT $d600 
2fbf : 10 fb __ BPL $2fbc ; (vdc_set_mode.l297 + 0)
.s17:
2fc1 : a5 4d __ LDA T3 + 1 
2fc3 : 8d 01 d6 STA $d601 
2fc6 : a9 0d __ LDA #$0d
2fc8 : 8d 00 d6 STA $d600 
.l299:
2fcb : 2c 00 d6 BIT $d600 
2fce : 10 fb __ BPL $2fcb ; (vdc_set_mode.l299 + 0)
.s22:
2fd0 : a5 4c __ LDA T3 + 0 
2fd2 : 8d 01 d6 STA $d601 
2fd5 : a9 14 __ LDA #$14
2fd7 : 8d 00 d6 STA $d600 
.l301:
2fda : 2c 00 d6 BIT $d600 
2fdd : 10 fb __ BPL $2fda ; (vdc_set_mode.l301 + 0)
.s27:
2fdf : a5 4f __ LDA T5 + 1 
2fe1 : 8d 01 d6 STA $d601 
2fe4 : a9 15 __ LDA #$15
2fe6 : 8d 00 d6 STA $d600 
.l303:
2fe9 : 2c 00 d6 BIT $d600 
2fec : 10 fb __ BPL $2fe9 ; (vdc_set_mode.l303 + 0)
.s32:
2fee : a5 4e __ LDA T5 + 0 
2ff0 : 8d 01 d6 STA $d601 
2ff3 : a6 49 __ LDX T1 + 0 
2ff5 : bd 0e 5b LDA $5b0e,x ; (vdc_modes + 14)
2ff8 : a2 1c __ LDX #$1c
2ffa : 8e 00 d6 STX $d600 
.l305:
2ffd : 2c 00 d6 BIT $d600 
3000 : 10 fb __ BPL $2ffd ; (vdc_set_mode.l305 + 0)
.s39:
3002 : aa __ __ TAX
3003 : ad 01 d6 LDA $d601 
3006 : 29 10 __ AND #$10
3008 : 85 4e __ STA T5 + 0 
300a : a9 1c __ LDA #$1c
300c : 8d 00 d6 STA $d600 
300f : 8a __ __ TXA
3010 : 29 e0 __ AND #$e0
3012 : 05 4e __ ORA T5 + 0 
.l307:
3014 : 2c 00 d6 BIT $d600 
3017 : 10 fb __ BPL $3014 ; (vdc_set_mode.l307 + 0)
.s45:
3019 : 8d 01 d6 STA $d601 
301c : 20 d8 30 JSR $30d8 ; (vdc_restore_charsets.s0 + 0)
301f : 18 __ __ CLC
3020 : a9 13 __ LDA #$13
3022 : 65 49 __ ADC T1 + 0 
3024 : 85 49 __ STA T1 + 0 
3026 : a9 5b __ LDA #$5b
3028 : 69 00 __ ADC #$00
302a : 85 4a __ STA T1 + 1 
302c : 18 __ __ CLC
302d : a5 4b __ LDA T2 + 0 
302f : 69 13 __ ADC #$13
3031 : 85 4c __ STA T3 + 0 
3033 : a9 00 __ LDA #$00
3035 : 85 43 __ STA T0 + 0 
3037 : 69 5b __ ADC #$5b
3039 : 85 4d __ STA T3 + 1 
.l46:
303b : a4 43 __ LDY T0 + 0 
303d : b1 49 __ LDA (T1 + 0),y 
303f : 85 47 __ STA T7 + 0 
3041 : c8 __ __ INY
3042 : b1 49 __ LDA (T1 + 0),y 
3044 : aa __ __ TAX
3045 : a5 47 __ LDA T7 + 0 
3047 : 8d 00 d6 STA $d600 
304a : c8 __ __ INY
304b : 84 43 __ STY T0 + 0 
.l309:
304d : 2c 00 d6 BIT $d600 
3050 : 10 fb __ BPL $304d ; (vdc_set_mode.l309 + 0)
.s52:
3052 : 8e 01 d6 STX $d601 
3055 : b1 4c __ LDA (T3 + 0),y 
3057 : c9 ff __ CMP #$ff
3059 : d0 e0 __ BNE $303b ; (vdc_set_mode.l46 + 0)
.s47:
305b : a6 4b __ LDX T2 + 0 
305d : bd 04 5b LDA $5b04,x ; (vdc_modes + 4)
3060 : f0 08 __ BEQ $306a ; (vdc_set_mode.s55 + 0)
.s56:
3062 : ad d9 5b LDA $5bd9 ; (vdc_state + 1)
3065 : d0 03 __ BNE $306a ; (vdc_set_mode.s55 + 0)
.s53:
3067 : 20 f7 30 JSR $30f7 ; (vdc_set_extended_memsize.s0 + 0)
.s55:
306a : 20 6a 2d JSR $2d6a ; (vdc_cls.s0 + 0)
306d : a9 22 __ LDA #$22
306f : 8d 00 d6 STA $d600 
.l314:
3072 : 2c 00 d6 BIT $d600 
3075 : 10 fb __ BPL $3072 ; (vdc_set_mode.l314 + 0)
.s62:
3077 : a9 7d __ LDA #$7d
3079 : 8d 01 d6 STA $d601 
.s1001:
307c : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
307d : ad de 5b LDA $5bde ; (vdc_state + 6)
3080 : 85 1c __ STA ACCU + 1 
3082 : ad dd 5b LDA $5bdd ; (vdc_state + 5)
3085 : 85 1b __ STA ACCU + 0 
3087 : 05 1c __ ORA ACCU + 1 
3089 : f0 4c __ BEQ $30d7 ; (vdc_set_multab.s1001 + 0)
.s5:
308b : ad db 5b LDA $5bdb ; (vdc_state + 3)
308e : 18 __ __ CLC
308f : 6d f0 5b ADC $5bf0 ; (vdc_state + 24)
3092 : 85 43 __ STA T2 + 0 
3094 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
3097 : 69 00 __ ADC #$00
3099 : 85 44 __ STA T2 + 1 
309b : a9 00 __ LDA #$00
309d : 85 45 __ STA T3 + 0 
309f : 85 46 __ STA T3 + 1 
30a1 : a9 00 __ LDA #$00
30a3 : 85 47 __ STA T4 + 0 
30a5 : a9 5c __ LDA #$5c
30a7 : 85 48 __ STA T4 + 1 
30a9 : a2 00 __ LDX #$00
.l2:
30ab : a5 45 __ LDA T3 + 0 
30ad : a0 00 __ LDY #$00
30af : 91 47 __ STA (T4 + 0),y 
30b1 : a5 46 __ LDA T3 + 1 
30b3 : c8 __ __ INY
30b4 : 91 47 __ STA (T4 + 0),y 
30b6 : 18 __ __ CLC
30b7 : a5 43 __ LDA T2 + 0 
30b9 : 65 45 __ ADC T3 + 0 
30bb : 85 45 __ STA T3 + 0 
30bd : a5 44 __ LDA T2 + 1 
30bf : 65 46 __ ADC T3 + 1 
30c1 : 85 46 __ STA T3 + 1 
30c3 : 18 __ __ CLC
30c4 : a5 47 __ LDA T4 + 0 
30c6 : 69 02 __ ADC #$02
30c8 : 85 47 __ STA T4 + 0 
30ca : 90 02 __ BCC $30ce ; (vdc_set_multab.s1006 + 0)
.s1005:
30cc : e6 48 __ INC T4 + 1 
.s1006:
30ce : e8 __ __ INX
30cf : a5 1c __ LDA ACCU + 1 
30d1 : d0 d8 __ BNE $30ab ; (vdc_set_multab.l2 + 0)
.s1002:
30d3 : e4 1b __ CPX ACCU + 0 
30d5 : 90 d4 __ BCC $30ab ; (vdc_set_multab.l2 + 0)
.s1001:
30d7 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
30d8 : a9 01 __ LDA #$01
30da : 85 11 __ STA P4 
30dc : a9 02 __ LDA #$02
30de : 85 15 __ STA P8 
30e0 : ad e8 5b LDA $5be8 ; (vdc_state + 16)
30e3 : 85 0f __ STA P2 
30e5 : ad e9 5b LDA $5be9 ; (vdc_state + 17)
30e8 : 85 10 __ STA P3 
30ea : a9 00 __ LDA #$00
30ec : 85 14 __ STA P7 
30ee : 85 12 __ STA P5 
30f0 : a9 d0 __ LDA #$d0
30f2 : 85 13 __ STA P6 
30f4 : 4c 04 13 JMP $1304 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
30f7 : ad d8 5b LDA $5bd8 ; (vdc_state + 0)
30fa : c9 10 __ CMP #$10
30fc : f0 4d __ BEQ $314b ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
30fe : ad d9 5b LDA $5bd9 ; (vdc_state + 1)
3101 : d0 48 __ BNE $314b ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
3103 : a9 22 __ LDA #$22
3105 : 8d 00 d6 STA $d600 
.l120:
3108 : 2c 00 d6 BIT $d600 
310b : 10 fb __ BPL $3108 ; (vdc_set_extended_memsize.l120 + 0)
.s11:
310d : a9 80 __ LDA #$80
310f : 8d 01 d6 STA $d601 
3112 : 20 4c 31 JSR $314c ; (vdc_wipe_mem.s0 + 0)
3115 : a9 1c __ LDA #$1c
3117 : 8d 00 d6 STA $d600 
.l122:
311a : 2c 00 d6 BIT $d600 
311d : 10 fb __ BPL $311a ; (vdc_set_extended_memsize.l122 + 0)
.s17:
311f : ad 01 d6 LDA $d601 
3122 : 09 10 __ ORA #$10
3124 : a2 1c __ LDX #$1c
3126 : 8e 00 d6 STX $d600 
.l124:
3129 : 2c 00 d6 BIT $d600 
312c : 10 fb __ BPL $3129 ; (vdc_set_extended_memsize.l124 + 0)
.s23:
312e : 8d 01 d6 STA $d601 
3131 : 20 d8 30 JSR $30d8 ; (vdc_restore_charsets.s0 + 0)
3134 : 20 6a 2d JSR $2d6a ; (vdc_cls.s0 + 0)
3137 : a9 22 __ LDA #$22
3139 : 8d 00 d6 STA $d600 
.l126:
313c : 2c 00 d6 BIT $d600 
313f : 10 fb __ BPL $313c ; (vdc_set_extended_memsize.l126 + 0)
.s29:
3141 : a9 7d __ LDA #$7d
3143 : 8d 01 d6 STA $d601 
3146 : a9 01 __ LDA #$01
3148 : 8d d9 5b STA $5bd9 ; (vdc_state + 1)
.s1001:
314b : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
314c : a9 00 __ LDA #$00
314e : 85 44 __ STA T0 + 1 
3150 : 85 0d __ STA P0 
3152 : a9 ff __ LDA #$ff
3154 : 85 45 __ STA T1 + 0 
.l2:
3156 : 20 38 58 JSR $5838 ; (vdc_mem_addr@proxy + 0)
.l252:
3159 : 2c 00 d6 BIT $d600 
315c : 10 fb __ BPL $3159 ; (vdc_wipe_mem.l252 + 0)
.s8:
315e : a9 00 __ LDA #$00
3160 : 8d 01 d6 STA $d601 
3163 : a9 18 __ LDA #$18
3165 : 8d 00 d6 STA $d600 
.l254:
3168 : 2c 00 d6 BIT $d600 
316b : 10 fb __ BPL $3168 ; (vdc_wipe_mem.l254 + 0)
.s14:
316d : ad 01 d6 LDA $d601 
3170 : 29 7f __ AND #$7f
3172 : a2 18 __ LDX #$18
3174 : 8e 00 d6 STX $d600 
.l256:
3177 : 2c 00 d6 BIT $d600 
317a : 10 fb __ BPL $3177 ; (vdc_wipe_mem.l256 + 0)
.s20:
317c : 8d 01 d6 STA $d601 
317f : a9 1e __ LDA #$1e
3181 : 8d 00 d6 STA $d600 
.l258:
3184 : 2c 00 d6 BIT $d600 
3187 : 10 fb __ BPL $3184 ; (vdc_wipe_mem.l258 + 0)
.s25:
3189 : e6 44 __ INC T0 + 1 
318b : a9 ff __ LDA #$ff
318d : 8d 01 d6 STA $d601 
3190 : c6 45 __ DEC T1 + 0 
3192 : d0 c2 __ BNE $3156 ; (vdc_wipe_mem.l2 + 0)
.s4:
3194 : 20 38 58 JSR $5838 ; (vdc_mem_addr@proxy + 0)
.l261:
3197 : 2c 00 d6 BIT $d600 
319a : 10 fb __ BPL $3197 ; (vdc_wipe_mem.l261 + 0)
.s29:
319c : a9 00 __ LDA #$00
319e : 8d 01 d6 STA $d601 
31a1 : a9 18 __ LDA #$18
31a3 : 8d 00 d6 STA $d600 
.l263:
31a6 : 2c 00 d6 BIT $d600 
31a9 : 10 fb __ BPL $31a6 ; (vdc_wipe_mem.l263 + 0)
.s35:
31ab : ad 01 d6 LDA $d601 
31ae : 29 7f __ AND #$7f
31b0 : a2 18 __ LDX #$18
31b2 : 8e 00 d6 STX $d600 
.l265:
31b5 : 2c 00 d6 BIT $d600 
31b8 : 10 fb __ BPL $31b5 ; (vdc_wipe_mem.l265 + 0)
.s41:
31ba : 8d 01 d6 STA $d601 
31bd : a9 1e __ LDA #$1e
31bf : 8d 00 d6 STA $d600 
.l267:
31c2 : 2c 00 d6 BIT $d600 
31c5 : 10 fb __ BPL $31c2 ; (vdc_wipe_mem.l267 + 0)
.s46:
31c7 : a9 ff __ LDA #$ff
31c9 : 8d 01 d6 STA $d601 
.s1001:
31cc : 60 __ __ RTS
--------------------------------------------------------------------
31cd : __ __ __ BYT 75 4e 44 4f 3a 20 65 4e 41 42 4c 45 44 20 20 00 : uNDO: eNABLED  .
--------------------------------------------------------------------
printcentered: ; printcentered(const u8*,u8,u8,u8)->void
.s0:
31dd : a9 1d __ LDA #$1d
31df : 85 0f __ STA P2 
31e1 : a9 16 __ LDA #$16
31e3 : 85 13 __ STA P6 
31e5 : a9 18 __ LDA #$18
31e7 : 85 14 __ STA P7 
31e9 : a9 01 __ LDA #$01
31eb : 85 15 __ STA P8 
31ed : 20 7a 2d JSR $2d7a ; (vdc_clear.s0 + 0)
31f0 : a5 16 __ LDA P9 ; (text + 0)
31f2 : 85 0d __ STA P0 
31f4 : a5 17 __ LDA P10 ; (text + 1)
31f6 : 85 0e __ STA P1 
31f8 : 20 db 32 JSR $32db ; (strlen.s0 + 0)
31fb : a5 1c __ LDA ACCU + 1 
31fd : 30 0c __ BMI $320b ; (printcentered.s1 + 0)
.s1003:
31ff : d0 06 __ BNE $3207 ; (printcentered.s5 + 0)
.s1002:
3201 : a5 1b __ LDA ACCU + 0 
3203 : c9 16 __ CMP #$16
3205 : 90 04 __ BCC $320b ; (printcentered.s1 + 0)
.s5:
3207 : a9 1d __ LDA #$1d
3209 : d0 1c __ BNE $3227 ; (printcentered.s1004 + 0)
.s1:
320b : 20 db 32 JSR $32db ; (strlen.s0 + 0)
320e : 38 __ __ SEC
320f : a9 16 __ LDA #$16
3211 : e5 1b __ SBC ACCU + 0 
3213 : aa __ __ TAX
3214 : a9 00 __ LDA #$00
3216 : e5 1c __ SBC ACCU + 1 
3218 : a8 __ __ TAY
3219 : 0a __ __ ASL
321a : 8a __ __ TXA
321b : 69 00 __ ADC #$00
321d : aa __ __ TAX
321e : 98 __ __ TYA
321f : 69 00 __ ADC #$00
3221 : 4a __ __ LSR
3222 : 8a __ __ TXA
3223 : 6a __ __ ROR
3224 : 18 __ __ CLC
3225 : 69 1c __ ADC #$1c
.s1004:
3227 : 85 0f __ STA P2 
3229 : a9 18 __ LDA #$18
322b : 85 10 __ STA P3 
322d : a5 16 __ LDA P9 ; (text + 0)
322f : 85 11 __ STA P4 
3231 : a5 17 __ LDA P10 ; (text + 1)
3233 : 85 12 __ STA P5 
3235 : ad df 5b LDA $5bdf ; (vdc_state + 7)
3238 : 85 13 __ STA P6 
--------------------------------------------------------------------
vdc_prints_attr: ; vdc_prints_attr(u8,u8,const u8*,u8)->void
.s0:
323a : a5 11 __ LDA P4 ; (string + 0)
323c : 85 0d __ STA P0 
323e : 85 43 __ STA T0 + 0 
3240 : a5 12 __ LDA P5 ; (string + 1)
3242 : 85 0e __ STA P1 
3244 : 85 44 __ STA T0 + 1 
3246 : a5 10 __ LDA P3 ; (y + 0)
3248 : 0a __ __ ASL
3249 : aa __ __ TAX
324a : bd 00 5c LDA $5c00,x ; (multab + 0)
324d : 85 46 __ STA T2 + 0 
324f : bd 01 5c LDA $5c01,x ; (multab + 1)
3252 : 85 47 __ STA T2 + 1 
3254 : 20 db 32 JSR $32db ; (strlen.s0 + 0)
3257 : a5 1b __ LDA ACCU + 0 
3259 : 85 48 __ STA T3 + 0 
325b : 18 __ __ CLC
325c : a5 0f __ LDA P2 ; (x + 0)
325e : 65 46 __ ADC T2 + 0 
3260 : 85 46 __ STA T2 + 0 
3262 : 90 02 __ BCC $3266 ; (vdc_prints_attr.s1015 + 0)
.s1014:
3264 : e6 47 __ INC T2 + 1 
.s1015:
3266 : 18 __ __ CLC
3267 : 6d e0 5b ADC $5be0 ; (vdc_state + 8)
326a : 85 0d __ STA P0 
326c : ad e1 5b LDA $5be1 ; (vdc_state + 9)
326f : 65 47 __ ADC T2 + 1 
3271 : 85 0e __ STA P1 
3273 : 20 58 2e JSR $2e58 ; (vdc_mem_addr.s0 + 0)
3276 : a5 48 __ LDA T3 + 0 
3278 : f0 18 __ BEQ $3292 ; (vdc_prints_attr.s6 + 0)
.s36:
327a : a0 00 __ LDY #$00
.l4:
327c : 84 45 __ STY T1 + 0 
327e : b1 43 __ LDA (T0 + 0),y 
3280 : 20 ff 32 JSR $32ff ; (pet2screen.s0 + 0)
.l164:
3283 : 2c 00 d6 BIT $d600 
3286 : 10 fb __ BPL $3283 ; (vdc_prints_attr.l164 + 0)
.s9:
3288 : 8d 01 d6 STA $d601 
328b : a4 45 __ LDY T1 + 0 
328d : c8 __ __ INY
328e : c4 48 __ CPY T3 + 0 
3290 : 90 ea __ BCC $327c ; (vdc_prints_attr.l4 + 0)
.s6:
3292 : ad e2 5b LDA $5be2 ; (vdc_state + 10)
3295 : 18 __ __ CLC
3296 : 65 46 __ ADC T2 + 0 
3298 : 85 0d __ STA P0 
329a : ad e3 5b LDA $5be3 ; (vdc_state + 11)
329d : 65 47 __ ADC T2 + 1 
329f : 85 0e __ STA P1 
32a1 : 20 58 2e JSR $2e58 ; (vdc_mem_addr.s0 + 0)
32a4 : a6 48 __ LDX T3 + 0 
32a6 : ca __ __ DEX
.l167:
32a7 : 2c 00 d6 BIT $d600 
32aa : 10 fb __ BPL $32a7 ; (vdc_prints_attr.l167 + 0)
.s13:
32ac : a5 13 __ LDA P6 ; (attr + 0)
32ae : 8d 01 d6 STA $d601 
32b1 : a9 18 __ LDA #$18
32b3 : 8d 00 d6 STA $d600 
.l169:
32b6 : 2c 00 d6 BIT $d600 
32b9 : 10 fb __ BPL $32b6 ; (vdc_prints_attr.l169 + 0)
.s19:
32bb : ad 01 d6 LDA $d601 
32be : 29 7f __ AND #$7f
32c0 : a0 18 __ LDY #$18
32c2 : 8c 00 d6 STY $d600 
.l171:
32c5 : 2c 00 d6 BIT $d600 
32c8 : 10 fb __ BPL $32c5 ; (vdc_prints_attr.l171 + 0)
.s25:
32ca : 8d 01 d6 STA $d601 
32cd : a9 1e __ LDA #$1e
32cf : 8d 00 d6 STA $d600 
.l173:
32d2 : 2c 00 d6 BIT $d600 
32d5 : 10 fb __ BPL $32d2 ; (vdc_prints_attr.l173 + 0)
.s30:
32d7 : 8e 01 d6 STX $d601 
.s1001:
32da : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
32db : a9 00 __ LDA #$00
32dd : 85 1b __ STA ACCU + 0 
32df : 85 1c __ STA ACCU + 1 
32e1 : a8 __ __ TAY
32e2 : b1 0d __ LDA (P0),y ; (str + 0)
32e4 : f0 18 __ BEQ $32fe ; (strlen.s1001 + 0)
.s2:
32e6 : a5 0d __ LDA P0 ; (str + 0)
32e8 : 85 1b __ STA ACCU + 0 
32ea : a2 00 __ LDX #$00
.l1002:
32ec : c8 __ __ INY
32ed : d0 01 __ BNE $32f0 ; (strlen.s1005 + 0)
.s1004:
32ef : e8 __ __ INX
.s1005:
32f0 : 8a __ __ TXA
32f1 : 18 __ __ CLC
32f2 : 65 0e __ ADC P1 ; (str + 1)
32f4 : 85 1c __ STA ACCU + 1 
32f6 : b1 1b __ LDA (ACCU + 0),y 
32f8 : d0 f2 __ BNE $32ec ; (strlen.l1002 + 0)
.s1003:
32fa : 86 1c __ STX ACCU + 1 
32fc : 84 1b __ STY ACCU + 0 
.s1001:
32fe : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
32ff : c9 20 __ CMP #$20
3301 : b0 03 __ BCS $3306 ; (pet2screen.s2 + 0)
.s1:
3303 : 69 80 __ ADC #$80
3305 : 60 __ __ RTS
.s2:
3306 : c9 40 __ CMP #$40
3308 : 90 27 __ BCC $3331 ; (pet2screen.s21 + 0)
.s7:
330a : c9 60 __ CMP #$60
330c : 90 17 __ BCC $3325 ; (pet2screen.s4 + 0)
.s11:
330e : 09 00 __ ORA #$00
3310 : 30 04 __ BMI $3316 ; (pet2screen.s9 + 0)
.s8:
3312 : 38 __ __ SEC
3313 : e9 20 __ SBC #$20
3315 : 60 __ __ RTS
.s9:
3316 : c9 80 __ CMP #$80
3318 : 90 17 __ BCC $3331 ; (pet2screen.s21 + 0)
.s15:
331a : c9 a0 __ CMP #$a0
331c : b0 03 __ BCS $3321 ; (pet2screen.s19 + 0)
.s12:
331e : 69 40 __ ADC #$40
3320 : 60 __ __ RTS
.s19:
3321 : c9 c0 __ CMP #$c0
3323 : b0 04 __ BCS $3329 ; (pet2screen.s23 + 0)
.s4:
3325 : 38 __ __ SEC
3326 : e9 40 __ SBC #$40
3328 : 60 __ __ RTS
.s23:
3329 : c9 ff __ CMP #$ff
332b : b0 04 __ BCS $3331 ; (pet2screen.s21 + 0)
.s20:
332d : 38 __ __ SEC
332e : e9 80 __ SBC #$80
3330 : 60 __ __ RTS
.s21:
3331 : c9 ff __ CMP #$ff
3333 : d0 02 __ BNE $3337 ; (pet2screen.s1001 + 0)
.s24:
3335 : a9 5e __ LDA #$5e
.s1001:
3337 : 60 __ __ RTS
--------------------------------------------------------------------
3338 : __ __ __ BYT 6c 4f 41 44 20 54 49 54 4c 45 20 53 43 52 45 45 : lOAD TITLE SCREE
3348 : __ __ __ BYT 4e 00                                           : N.
--------------------------------------------------------------------
334a : __ __ __ BYT 56 44 43 53 45 54 53 43 52 00                   : VDCSETSCR.
--------------------------------------------------------------------
3354 : __ __ __ BYT 6c 4f 41 44 20 56 49 53 55 41 4c 20 70 65 74 73 : lOAD VISUAL pets
3364 : __ __ __ BYT 63 69 69 00                                     : cii.
--------------------------------------------------------------------
3368 : __ __ __ BYT 56 44 43 53 45 50 45 54 56 00                   : VDCSEPETV.
--------------------------------------------------------------------
menu_fileerrormessage: ; menu_fileerrormessage()->void
.s1000:
3372 : 38 __ __ SEC
3373 : a5 23 __ LDA SP + 0 
3375 : e9 08 __ SBC #$08
3377 : 85 23 __ STA SP + 0 
3379 : b0 02 __ BCS $337d ; (menu_fileerrormessage.s0 + 0)
337b : c6 24 __ DEC SP + 1 
.s0:
337d : a9 f0 __ LDA #$f0
337f : 85 17 __ STA P10 
3381 : a9 08 __ LDA #$08
3383 : 85 18 __ STA P11 
3385 : 8d f6 ab STA $abf6 ; (sstack + 0)
3388 : a9 1e __ LDA #$1e
338a : 8d f7 ab STA $abf7 ; (sstack + 1)
338d : a9 06 __ LDA #$06
338f : 8d f8 ab STA $abf8 ; (sstack + 2)
3392 : ad df 5b LDA $5bdf ; (vdc_state + 7)
3395 : 85 52 __ STA T0 + 0 
3397 : a9 8d __ LDA #$8d
3399 : 8d df 5b STA $5bdf ; (vdc_state + 7)
339c : 20 02 34 JSR $3402 ; (vdcwin_win_new.s1000 + 0)
339f : a9 04 __ LDA #$04
33a1 : 85 11 __ STA P4 
33a3 : a9 38 __ LDA #$38
33a5 : 85 12 __ STA P5 
33a7 : 20 16 58 JSR $5816 ; (vdc_prints_attr@proxy + 0)
33aa : a9 00 __ LDA #$00
33ac : a0 02 __ LDY #$02
33ae : 91 23 __ STA (SP + 0),y 
33b0 : a9 5d __ LDA #$5d
33b2 : c8 __ __ INY
33b3 : 91 23 __ STA (SP + 0),y 
33b5 : a9 10 __ LDA #$10
33b7 : c8 __ __ INY
33b8 : 91 23 __ STA (SP + 0),y 
33ba : a9 38 __ LDA #$38
33bc : c8 __ __ INY
33bd : 91 23 __ STA (SP + 0),y 
33bf : ad ea 5a LDA $5aea ; (krnio_pstatus + 1)
33c2 : c8 __ __ INY
33c3 : 91 23 __ STA (SP + 0),y 
33c5 : a9 00 __ LDA #$00
33c7 : c8 __ __ INY
33c8 : 91 23 __ STA (SP + 0),y 
33ca : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
33cd : a9 0a __ LDA #$0a
33cf : 85 0f __ STA P2 
33d1 : a9 0b __ LDA #$0b
33d3 : 85 10 __ STA P3 
33d5 : a9 00 __ LDA #$00
33d7 : 85 11 __ STA P4 
33d9 : a9 5d __ LDA #$5d
33db : 85 12 __ STA P5 
33dd : a9 8d __ LDA #$8d
33df : 85 13 __ STA P6 
33e1 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
33e4 : a9 0d __ LDA #$0d
33e6 : 85 10 __ STA P3 
33e8 : 20 0b 58 JSR $580b ; (vdc_prints_attr@proxy + 0)
33eb : 20 2a 38 JSR $382a ; (vdcwin_getch.s0 + 0)
33ee : 20 38 38 JSR $3838 ; (vdcwin_win_free.s0 + 0)
33f1 : a5 52 __ LDA T0 + 0 
33f3 : 8d df 5b STA $5bdf ; (vdc_state + 7)
.s1001:
33f6 : 18 __ __ CLC
33f7 : a5 23 __ LDA SP + 0 
33f9 : 69 08 __ ADC #$08
33fb : 85 23 __ STA SP + 0 
33fd : 90 02 __ BCC $3401 ; (menu_fileerrormessage.s1001 + 11)
33ff : e6 24 __ INC SP + 1 
3401 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_new: ; vdcwin_win_new(u8,u8,u8,u8,u8)->void
.s1000:
3402 : a2 03 __ LDX #$03
3404 : b5 53 __ LDA T8 + 0,x 
3406 : 9d f2 ab STA $abf2,x ; (buffer + 12)
3409 : ca __ __ DEX
340a : 10 f8 __ BPL $3404 ; (vdcwin_win_new.s1000 + 2)
.s0:
340c : ad f7 ab LDA $abf7 ; (sstack + 1)
340f : 85 4b __ STA T0 + 0 
3411 : 85 4c __ STA T1 + 0 
3413 : ad f8 ab LDA $abf8 ; (sstack + 2)
3416 : 85 43 __ STA T2 + 0 
3418 : 85 4d __ STA T3 + 0 
341a : ad f6 ab LDA $abf6 ; (sstack + 0)
341d : 0a __ __ ASL
341e : aa __ __ TAX
341f : bd 00 5c LDA $5c00,x ; (multab + 0)
3422 : 18 __ __ CLC
3423 : 65 18 __ ADC P11 ; (xpos + 0)
3425 : 85 53 __ STA T8 + 0 
3427 : bd 01 5c LDA $5c01,x ; (multab + 1)
342a : 69 00 __ ADC #$00
342c : 85 54 __ STA T8 + 1 
342e : a5 17 __ LDA P10 ; (border + 0)
3430 : 0a __ __ ASL
3431 : 10 0e __ BPL $3441 ; (vdcwin_win_new.s57 + 0)
.s6:
3433 : a5 18 __ LDA P11 ; (xpos + 0)
3435 : f0 0a __ BEQ $3441 ; (vdcwin_win_new.s57 + 0)
.s3:
3437 : e6 4c __ INC T1 + 0 
3439 : a5 53 __ LDA T8 + 0 
343b : d0 02 __ BNE $343f ; (vdcwin_win_new.s1013 + 0)
.s1012:
343d : c6 54 __ DEC T8 + 1 
.s1013:
343f : c6 53 __ DEC T8 + 0 
.s57:
3441 : a5 17 __ LDA P10 ; (border + 0)
3443 : 29 20 __ AND #$20
3445 : f0 15 __ BEQ $345c ; (vdcwin_win_new.s59 + 0)
.s10:
3447 : 18 __ __ CLC
3448 : a5 4b __ LDA T0 + 0 
344a : 65 18 __ ADC P11 ; (xpos + 0)
344c : a8 __ __ TAY
344d : a9 00 __ LDA #$00
344f : 2a __ __ ROL
3450 : cd dc 5b CMP $5bdc ; (vdc_state + 4)
3453 : d0 03 __ BNE $3458 ; (vdcwin_win_new.s1009 + 0)
.s1008:
3455 : cc db 5b CPY $5bdb ; (vdc_state + 3)
.s1009:
3458 : b0 02 __ BCS $345c ; (vdcwin_win_new.s59 + 0)
.s7:
345a : e6 4c __ INC T1 + 0 
.s59:
345c : 24 17 __ BIT P10 ; (border + 0)
345e : 10 1e __ BPL $347e ; (vdcwin_win_new.s60 + 0)
.s14:
3460 : ad f6 ab LDA $abf6 ; (sstack + 0)
3463 : f0 19 __ BEQ $347e ; (vdcwin_win_new.s60 + 0)
.s11:
3465 : e6 4d __ INC T3 + 0 
3467 : ad db 5b LDA $5bdb ; (vdc_state + 3)
346a : 85 03 __ STA WORK + 0 
346c : ad dc 5b LDA $5bdc ; (vdc_state + 4)
346f : 85 04 __ STA WORK + 1 
3471 : 38 __ __ SEC
3472 : a5 53 __ LDA T8 + 0 
3474 : e5 03 __ SBC WORK + 0 
3476 : 85 53 __ STA T8 + 0 
3478 : a5 54 __ LDA T8 + 1 
347a : e5 04 __ SBC WORK + 1 
347c : 85 54 __ STA T8 + 1 
.s60:
347e : a5 17 __ LDA P10 ; (border + 0)
3480 : 29 10 __ AND #$10
3482 : f0 16 __ BEQ $349a ; (vdcwin_win_new.s17 + 0)
.s18:
3484 : 18 __ __ CLC
3485 : a5 43 __ LDA T2 + 0 
3487 : 6d f6 ab ADC $abf6 ; (sstack + 0)
348a : a8 __ __ TAY
348b : a9 00 __ LDA #$00
348d : 2a __ __ ROL
348e : cd de 5b CMP $5bde ; (vdc_state + 6)
3491 : d0 03 __ BNE $3496 ; (vdcwin_win_new.s1007 + 0)
.s1006:
3493 : cc dd 5b CPY $5bdd ; (vdc_state + 5)
.s1007:
3496 : b0 02 __ BCS $349a ; (vdcwin_win_new.s17 + 0)
.s15:
3498 : e6 4d __ INC T3 + 0 
.s17:
349a : a5 43 __ LDA T2 + 0 
349c : 85 1b __ STA ACCU + 0 ; (height + 0)
349e : a9 00 __ LDA #$00
34a0 : 85 1c __ STA ACCU + 1 
34a2 : a5 4b __ LDA T0 + 0 
34a4 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
34a7 : a5 05 __ LDA WORK + 2 
34a9 : 0a __ __ ASL
34aa : 85 4e __ STA T5 + 0 
34ac : a5 06 __ LDA WORK + 3 
34ae : 2a __ __ ROL
34af : 85 4f __ STA T5 + 1 
34b1 : ad e7 5a LDA $5ae7 ; (winCfg + 6)
34b4 : 85 50 __ STA T7 + 0 
34b6 : 18 __ __ CLC
34b7 : 65 4e __ ADC T5 + 0 
34b9 : 85 4e __ STA T5 + 0 
34bb : ad e8 5a LDA $5ae8 ; (winCfg + 7)
34be : 85 51 __ STA T7 + 1 
34c0 : 65 4f __ ADC T5 + 1 
34c2 : 85 4f __ STA T5 + 1 
34c4 : ad e2 5a LDA $5ae2 ; (winCfg + 1)
34c7 : 18 __ __ CLC
34c8 : 6d e4 5a ADC $5ae4 ; (winCfg + 3)
34cb : a8 __ __ TAY
34cc : ad e3 5a LDA $5ae3 ; (winCfg + 2)
34cf : 6d e5 5a ADC $5ae5 ; (winCfg + 4)
34d2 : aa __ __ TAX
34d3 : 98 __ __ TYA
34d4 : 18 __ __ CLC
34d5 : 69 fe __ ADC #$fe
34d7 : a8 __ __ TAY
34d8 : 8a __ __ TXA
34d9 : 69 ff __ ADC #$ff
34db : c5 4f __ CMP T5 + 1 
34dd : d0 02 __ BNE $34e1 ; (vdcwin_win_new.s1005 + 0)
.s1004:
34df : c4 4e __ CPY T5 + 0 
.s1005:
34e1 : 90 59 __ BCC $353c ; (vdcwin_win_new.s1001 + 0)
.s21:
34e3 : ad e6 5a LDA $5ae6 ; (winCfg + 5)
34e6 : c9 03 __ CMP #$03
34e8 : f0 52 __ BEQ $353c ; (vdcwin_win_new.s1001 + 0)
.s25:
34ea : a5 18 __ LDA P11 ; (xpos + 0)
34ec : 85 0f __ STA P2 
34ee : ad f6 ab LDA $abf6 ; (sstack + 0)
34f1 : 85 10 __ STA P3 
34f3 : a5 4b __ LDA T0 + 0 
34f5 : 85 11 __ STA P4 
34f7 : a5 43 __ LDA T2 + 0 
34f9 : 85 12 __ STA P5 
34fb : ee e6 5a INC $5ae6 ; (winCfg + 5)
34fe : ae e6 5a LDX $5ae6 ; (winCfg + 5)
3501 : bd eb 55 LDA $55eb,x ; (__multab13L + 0)
3504 : 85 4e __ STA T5 + 0 
3506 : 18 __ __ CLC
3507 : 69 86 __ ADC #$86
3509 : 85 55 __ STA T10 + 0 
350b : 85 0d __ STA P0 
350d : a9 5c __ LDA #$5c
350f : 69 00 __ ADC #$00
3511 : 85 56 __ STA T10 + 1 
3513 : 85 0e __ STA P1 
3515 : 20 64 2b JSR $2b64 ; (vdcwin_init.s0 + 0)
3518 : a5 50 __ LDA T7 + 0 
351a : a6 4e __ LDX T5 + 0 
351c : 9d 83 5c STA $5c83,x ; (multab + 131)
351f : a5 51 __ LDA T7 + 1 
3521 : 9d 84 5c STA $5c84,x ; (multab + 132)
3524 : a5 17 __ LDA P10 ; (border + 0)
3526 : 9d 85 5c STA $5c85,x ; (multab + 133)
3529 : a5 4d __ LDA T3 + 0 
352b : d0 1a __ BNE $3547 ; (vdcwin_win_new.s32 + 0)
.s30:
352d : a5 55 __ LDA T10 + 0 
352f : 85 14 __ STA P7 
3531 : a5 56 __ LDA T10 + 1 
3533 : 85 15 __ STA P8 
3535 : a5 17 __ LDA P10 ; (border + 0)
3537 : 85 16 __ STA P9 
3539 : 20 c8 35 JSR $35c8 ; (vdcwin_border_clear.s0 + 0)
.s1001:
353c : a2 03 __ LDX #$03
353e : bd f2 ab LDA $abf2,x ; (buffer + 12)
3541 : 95 53 __ STA T8 + 0,x 
3543 : ca __ __ DEX
3544 : 10 f8 __ BPL $353e ; (vdcwin_win_new.s1001 + 2)
3546 : 60 __ __ RTS
.s32:
3547 : 85 4b __ STA T0 + 0 
3549 : a5 4c __ LDA T1 + 0 
354b : 85 12 __ STA P5 
.l1010:
354d : a9 00 __ LDA #$00
354f : 85 13 __ STA P6 
3551 : ad e1 5a LDA $5ae1 ; (winCfg + 0)
3554 : 85 0d __ STA P0 
3556 : ad e7 5a LDA $5ae7 ; (winCfg + 6)
3559 : 85 50 __ STA T7 + 0 
355b : 85 0e __ STA P1 
355d : ad e8 5a LDA $5ae8 ; (winCfg + 7)
3560 : 85 51 __ STA T7 + 1 
3562 : 85 0f __ STA P2 
3564 : ad e0 5b LDA $5be0 ; (vdc_state + 8)
3567 : 18 __ __ CLC
3568 : 65 53 __ ADC T8 + 0 
356a : 85 10 __ STA P3 
356c : ad e1 5b LDA $5be1 ; (vdc_state + 9)
356f : 65 54 __ ADC T8 + 1 
3571 : 85 11 __ STA P4 
3573 : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
3576 : a9 00 __ LDA #$00
3578 : 85 13 __ STA P6 
357a : 18 __ __ CLC
357b : a5 50 __ LDA T7 + 0 
357d : 65 12 __ ADC P5 
357f : 85 50 __ STA T7 + 0 
3581 : 85 0e __ STA P1 
3583 : 8d e7 5a STA $5ae7 ; (winCfg + 6)
3586 : a5 51 __ LDA T7 + 1 
3588 : 69 00 __ ADC #$00
358a : 85 51 __ STA T7 + 1 
358c : 85 0f __ STA P2 
358e : 8d e8 5a STA $5ae8 ; (winCfg + 7)
3591 : ad e2 5b LDA $5be2 ; (vdc_state + 10)
3594 : 18 __ __ CLC
3595 : 65 53 __ ADC T8 + 0 
3597 : 85 10 __ STA P3 
3599 : ad e3 5b LDA $5be3 ; (vdc_state + 11)
359c : 65 54 __ ADC T8 + 1 
359e : 85 11 __ STA P4 
35a0 : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
35a3 : 18 __ __ CLC
35a4 : a5 50 __ LDA T7 + 0 
35a6 : 65 12 __ ADC P5 
35a8 : 8d e7 5a STA $5ae7 ; (winCfg + 6)
35ab : a5 51 __ LDA T7 + 1 
35ad : 69 00 __ ADC #$00
35af : 8d e8 5a STA $5ae8 ; (winCfg + 7)
35b2 : ad db 5b LDA $5bdb ; (vdc_state + 3)
35b5 : 18 __ __ CLC
35b6 : 65 53 __ ADC T8 + 0 
35b8 : 85 53 __ STA T8 + 0 
35ba : ad dc 5b LDA $5bdc ; (vdc_state + 4)
35bd : 65 54 __ ADC T8 + 1 
35bf : 85 54 __ STA T8 + 1 
35c1 : c6 4b __ DEC T0 + 0 
35c3 : d0 88 __ BNE $354d ; (vdcwin_win_new.l1010 + 0)
35c5 : 4c 2d 35 JMP $352d ; (vdcwin_win_new.s30 + 0)
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
35c8 : a5 16 __ LDA P9 ; (border + 0)
35ca : 29 0f __ AND #$0f
35cc : 85 47 __ STA T2 + 0 
35ce : 49 ff __ EOR #$ff
35d0 : 18 __ __ CLC
35d1 : 69 01 __ ADC #$01
35d3 : 29 09 __ AND #$09
35d5 : 85 48 __ STA T3 + 0 
35d7 : aa __ __ TAX
35d8 : bd 9a 5a LDA $5a9a,x ; (winStyles + 0)
35db : 85 49 __ STA T4 + 0 
35dd : a5 16 __ LDA P9 ; (border + 0)
35df : 0a __ __ ASL
35e0 : 10 0c __ BPL $35ee ; (vdcwin_border_clear.s53 + 0)
.s4:
35e2 : a0 00 __ LDY #$00
35e4 : b1 14 __ LDA (P7),y ; (win + 0)
35e6 : d0 06 __ BNE $35ee ; (vdcwin_border_clear.s53 + 0)
.s1:
35e8 : a5 16 __ LDA P9 ; (border + 0)
35ea : 29 bf __ AND #$bf
35ec : 85 16 __ STA P9 ; (border + 0)
.s53:
35ee : a5 16 __ LDA P9 ; (border + 0)
35f0 : 29 20 __ AND #$20
35f2 : f0 2c __ BEQ $3620 ; (vdcwin_border_clear.s55 + 0)
.s8:
35f4 : a0 00 __ LDY #$00
35f6 : b1 14 __ LDA (P7),y ; (win + 0)
35f8 : 18 __ __ CLC
35f9 : a0 02 __ LDY #$02
35fb : 71 14 __ ADC (P7),y ; (win + 0)
35fd : a8 __ __ TAY
35fe : a9 00 __ LDA #$00
3600 : 2a __ __ ROL
3601 : 85 1c __ STA ACCU + 1 
3603 : 98 __ __ TYA
3604 : 69 01 __ ADC #$01
3606 : 85 1b __ STA ACCU + 0 
3608 : 90 02 __ BCC $360c ; (vdcwin_border_clear.s8 + 24)
360a : e6 1c __ INC ACCU + 1 
360c : ad dc 5b LDA $5bdc ; (vdc_state + 4)
360f : c5 1c __ CMP ACCU + 1 
3611 : d0 05 __ BNE $3618 ; (vdcwin_border_clear.s1007 + 0)
.s1006:
3613 : ad db 5b LDA $5bdb ; (vdc_state + 3)
3616 : c5 1b __ CMP ACCU + 0 
.s1007:
3618 : b0 06 __ BCS $3620 ; (vdcwin_border_clear.s55 + 0)
.s5:
361a : a5 16 __ LDA P9 ; (border + 0)
361c : 29 df __ AND #$df
361e : 85 16 __ STA P9 ; (border + 0)
.s55:
3620 : 24 16 __ BIT P9 ; (border + 0)
3622 : 10 67 __ BPL $368b ; (vdcwin_border_clear.s59 + 0)
.s12:
3624 : a0 01 __ LDY #$01
3626 : b1 14 __ LDA (P7),y ; (win + 0)
3628 : f0 61 __ BEQ $368b ; (vdcwin_border_clear.s59 + 0)
.s9:
362a : 38 __ __ SEC
362b : e9 01 __ SBC #$01
362d : 85 4a __ STA T7 + 0 
362f : a5 16 __ LDA P9 ; (border + 0)
3631 : 0a __ __ ASL
3632 : 10 18 __ BPL $364c ; (vdcwin_border_clear.s15 + 0)
.s13:
3634 : a5 4a __ LDA T7 + 0 
3636 : 85 0e __ STA P1 
3638 : a5 49 __ LDA T4 + 0 
363a : 85 10 __ STA P3 
363c : bd 9b 5a LDA $5a9b,x ; (winStyles + 1)
363f : 85 0f __ STA P2 
3641 : 38 __ __ SEC
3642 : 88 __ __ DEY
3643 : b1 14 __ LDA (P7),y ; (win + 0)
3645 : e9 01 __ SBC #$01
3647 : 85 0d __ STA P0 
3649 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
.s15:
364c : a0 00 __ LDY #$00
364e : b1 14 __ LDA (P7),y ; (win + 0)
3650 : 85 46 __ STA T0 + 0 
3652 : 85 0f __ STA P2 
3654 : a5 4a __ LDA T7 + 0 
3656 : 85 10 __ STA P3 
3658 : a5 49 __ LDA T4 + 0 
365a : 85 12 __ STA P5 
365c : a6 48 __ LDX T3 + 0 
365e : bd 9f 5a LDA $5a9f,x ; (winStyles + 5)
3661 : 85 11 __ STA P4 
3663 : a0 02 __ LDY #$02
3665 : b1 14 __ LDA (P7),y ; (win + 0)
3667 : 85 13 __ STA P6 
3669 : 20 a9 2d JSR $2da9 ; (vdc_hchar.s0 + 0)
366c : a5 16 __ LDA P9 ; (border + 0)
366e : 29 20 __ AND #$20
3670 : f0 19 __ BEQ $368b ; (vdcwin_border_clear.s59 + 0)
.s16:
3672 : a5 10 __ LDA P3 
3674 : 85 0e __ STA P1 
3676 : a5 12 __ LDA P5 
3678 : 85 10 __ STA P3 
367a : a6 48 __ LDX T3 + 0 
367c : bd 9c 5a LDA $5a9c,x ; (winStyles + 2)
367f : 85 0f __ STA P2 
3681 : 18 __ __ CLC
3682 : a5 13 __ LDA P6 
3684 : 65 46 __ ADC T0 + 0 
3686 : 85 0d __ STA P0 
3688 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
.s59:
368b : a5 16 __ LDA P9 ; (border + 0)
368d : 29 10 __ AND #$10
368f : f0 79 __ BEQ $370a ; (vdcwin_border_clear.s39 + 0)
.s22:
3691 : a0 01 __ LDY #$01
3693 : b1 14 __ LDA (P7),y ; (win + 0)
3695 : 18 __ __ CLC
3696 : a0 03 __ LDY #$03
3698 : 71 14 __ ADC (P7),y ; (win + 0)
369a : 85 4a __ STA T7 + 0 
369c : a9 00 __ LDA #$00
369e : 2a __ __ ROL
369f : cd de 5b CMP $5bde ; (vdc_state + 6)
36a2 : d0 05 __ BNE $36a9 ; (vdcwin_border_clear.s1005 + 0)
.s1004:
36a4 : a5 4a __ LDA T7 + 0 
36a6 : cd dd 5b CMP $5bdd ; (vdc_state + 5)
.s1005:
36a9 : b0 5f __ BCS $370a ; (vdcwin_border_clear.s39 + 0)
.s19:
36ab : a5 16 __ LDA P9 ; (border + 0)
36ad : 0a __ __ ASL
36ae : 10 1b __ BPL $36cb ; (vdcwin_border_clear.s25 + 0)
.s23:
36b0 : a5 4a __ LDA T7 + 0 
36b2 : 85 0e __ STA P1 
36b4 : a5 49 __ LDA T4 + 0 
36b6 : 85 10 __ STA P3 
36b8 : a6 48 __ LDX T3 + 0 
36ba : bd 9d 5a LDA $5a9d,x ; (winStyles + 3)
36bd : 85 0f __ STA P2 
36bf : 38 __ __ SEC
36c0 : a0 00 __ LDY #$00
36c2 : b1 14 __ LDA (P7),y ; (win + 0)
36c4 : e9 01 __ SBC #$01
36c6 : 85 0d __ STA P0 
36c8 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
.s25:
36cb : a0 00 __ LDY #$00
36cd : b1 14 __ LDA (P7),y ; (win + 0)
36cf : 85 46 __ STA T0 + 0 
36d1 : 85 0f __ STA P2 
36d3 : a5 4a __ LDA T7 + 0 
36d5 : 85 10 __ STA P3 
36d7 : a5 49 __ LDA T4 + 0 
36d9 : 85 12 __ STA P5 
36db : a6 48 __ LDX T3 + 0 
36dd : bd a0 5a LDA $5aa0,x ; (winStyles + 6)
36e0 : 85 11 __ STA P4 
36e2 : a0 02 __ LDY #$02
36e4 : b1 14 __ LDA (P7),y ; (win + 0)
36e6 : 85 13 __ STA P6 
36e8 : 20 a9 2d JSR $2da9 ; (vdc_hchar.s0 + 0)
36eb : a5 16 __ LDA P9 ; (border + 0)
36ed : 29 20 __ AND #$20
36ef : f0 19 __ BEQ $370a ; (vdcwin_border_clear.s39 + 0)
.s26:
36f1 : a5 10 __ LDA P3 
36f3 : 85 0e __ STA P1 
36f5 : a5 12 __ LDA P5 
36f7 : 85 10 __ STA P3 
36f9 : a6 48 __ LDX T3 + 0 
36fb : bd 9e 5a LDA $5a9e,x ; (winStyles + 4)
36fe : 85 0f __ STA P2 
3700 : 18 __ __ CLC
3701 : a5 13 __ LDA P6 
3703 : 65 46 __ ADC T0 + 0 
3705 : 85 0d __ STA P0 
3707 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
.s39:
370a : a9 00 __ LDA #$00
370c : 85 46 __ STA T0 + 0 
.l29:
370e : a0 03 __ LDY #$03
3710 : d1 14 __ CMP (P7),y ; (win + 0)
3712 : 90 01 __ BCC $3715 ; (vdcwin_border_clear.s30 + 0)
.s1001:
3714 : 60 __ __ RTS
.s30:
3715 : a5 16 __ LDA P9 ; (border + 0)
3717 : 0a __ __ ASL
3718 : 10 25 __ BPL $373f ; (vdcwin_border_clear.s35 + 0)
.s33:
371a : a5 49 __ LDA T4 + 0 
371c : 85 10 __ STA P3 
371e : 38 __ __ SEC
371f : a0 00 __ LDY #$00
3721 : b1 14 __ LDA (P7),y ; (win + 0)
3723 : e9 01 __ SBC #$01
3725 : 85 0d __ STA P0 
3727 : c8 __ __ INY
3728 : b1 14 __ LDA (P7),y ; (win + 0)
372a : 18 __ __ CLC
372b : 65 46 __ ADC T0 + 0 
372d : 85 0e __ STA P1 
372f : 38 __ __ SEC
3730 : a9 00 __ LDA #$00
3732 : e5 47 __ SBC T2 + 0 
3734 : 29 09 __ AND #$09
3736 : aa __ __ TAX
3737 : bd a1 5a LDA $5aa1,x ; (winStyles + 7)
373a : 85 0f __ STA P2 
373c : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
.s35:
373f : a9 20 __ LDA #$20
3741 : 85 11 __ STA P4 
3743 : a0 02 __ LDY #$02
3745 : b1 14 __ LDA (P7),y ; (win + 0)
3747 : 85 13 __ STA P6 
3749 : a0 00 __ LDY #$00
374b : b1 14 __ LDA (P7),y ; (win + 0)
374d : 85 0f __ STA P2 
374f : c8 __ __ INY
3750 : b1 14 __ LDA (P7),y ; (win + 0)
3752 : 18 __ __ CLC
3753 : 65 46 __ ADC T0 + 0 
3755 : 85 10 __ STA P3 
3757 : 20 a4 2d JSR $2da4 ; (vdc_hchar@proxy + 0)
375a : a5 16 __ LDA P9 ; (border + 0)
375c : 29 20 __ AND #$20
375e : f0 1f __ BEQ $377f ; (vdcwin_border_clear.s69 + 0)
.s36:
3760 : a5 10 __ LDA P3 
3762 : 85 0e __ STA P1 
3764 : a5 49 __ LDA T4 + 0 
3766 : 85 10 __ STA P3 
3768 : 18 __ __ CLC
3769 : a5 13 __ LDA P6 
376b : 65 0f __ ADC P2 
376d : 85 0d __ STA P0 
376f : 38 __ __ SEC
3770 : a9 00 __ LDA #$00
3772 : e5 47 __ SBC T2 + 0 
3774 : 29 09 __ AND #$09
3776 : aa __ __ TAX
3777 : bd a2 5a LDA $5aa2,x ; (winStyles + 8)
377a : 85 0f __ STA P2 
377c : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
.s69:
377f : e6 46 __ INC T0 + 0 
3781 : a5 46 __ LDA T0 + 0 
3783 : 4c 0e 37 JMP $370e ; (vdcwin_border_clear.l29 + 0)
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
3786 : a5 0e __ LDA P1 ; (y + 0)
3788 : 0a __ __ ASL
3789 : a2 12 __ LDX #$12
378b : 8e 00 d6 STX $d600 
378e : aa __ __ TAX
378f : 18 __ __ CLC
3790 : a5 0d __ LDA P0 ; (x + 0)
3792 : 7d 00 5c ADC $5c00,x ; (multab + 0)
3795 : 85 1b __ STA ACCU + 0 
3797 : a9 00 __ LDA #$00
3799 : 7d 01 5c ADC $5c01,x ; (multab + 1)
379c : 85 1c __ STA ACCU + 1 
379e : 18 __ __ CLC
379f : a5 1b __ LDA ACCU + 0 
37a1 : 6d e0 5b ADC $5be0 ; (vdc_state + 8)
37a4 : aa __ __ TAX
37a5 : a5 1c __ LDA ACCU + 1 
37a7 : 6d e1 5b ADC $5be1 ; (vdc_state + 9)
.l167:
37aa : 2c 00 d6 BIT $d600 
37ad : 10 fb __ BPL $37aa ; (vdc_printc.l167 + 0)
.s9:
37af : 8d 01 d6 STA $d601 
37b2 : a9 13 __ LDA #$13
37b4 : 8d 00 d6 STA $d600 
.l169:
37b7 : 2c 00 d6 BIT $d600 
37ba : 10 fb __ BPL $37b7 ; (vdc_printc.l169 + 0)
.s14:
37bc : 8e 01 d6 STX $d601 
37bf : a9 1f __ LDA #$1f
37c1 : 8d 00 d6 STA $d600 
.l171:
37c4 : 2c 00 d6 BIT $d600 
37c7 : 10 fb __ BPL $37c4 ; (vdc_printc.l171 + 0)
.s18:
37c9 : a5 0f __ LDA P2 ; (val + 0)
37cb : 8d 01 d6 STA $d601 
37ce : ad e2 5b LDA $5be2 ; (vdc_state + 10)
37d1 : 18 __ __ CLC
37d2 : 65 1b __ ADC ACCU + 0 
37d4 : a8 __ __ TAY
37d5 : a9 12 __ LDA #$12
37d7 : 8d 00 d6 STA $d600 
37da : ad e3 5b LDA $5be3 ; (vdc_state + 11)
37dd : 65 1c __ ADC ACCU + 1 
.l173:
37df : 2c 00 d6 BIT $d600 
37e2 : 10 fb __ BPL $37df ; (vdc_printc.l173 + 0)
.s25:
37e4 : 8d 01 d6 STA $d601 
37e7 : a9 13 __ LDA #$13
37e9 : 8d 00 d6 STA $d600 
.l175:
37ec : 2c 00 d6 BIT $d600 
37ef : 10 fb __ BPL $37ec ; (vdc_printc.l175 + 0)
.s30:
37f1 : 8c 01 d6 STY $d601 
37f4 : a9 1f __ LDA #$1f
37f6 : 8d 00 d6 STA $d600 
.l177:
37f9 : 2c 00 d6 BIT $d600 
37fc : 10 fb __ BPL $37f9 ; (vdc_printc.l177 + 0)
.s34:
37fe : a5 10 __ LDA P3 ; (attr + 0)
3800 : 8d 01 d6 STA $d601 
.s1001:
3803 : 60 __ __ RTS
--------------------------------------------------------------------
3804 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 00             : fILE ERROR!.
--------------------------------------------------------------------
3810 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 00    : eRROR NR.: %2x.
--------------------------------------------------------------------
381f : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
382a : 20 e4 ff JSR $ffe4 
382d : c9 00 __ CMP #$00
382f : f0 f9 __ BEQ $382a ; (vdcwin_getch.s0 + 0)
3831 : 85 1b __ STA ACCU + 0 
3833 : a9 00 __ LDA #$00
3835 : 85 1c __ STA ACCU + 1 
.s1001:
3837 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_win_free: ; vdcwin_win_free()->void
.s0:
3838 : ad e6 5a LDA $5ae6 ; (winCfg + 5)
383b : d0 01 __ BNE $383e ; (vdcwin_win_free.s3 + 0)
383d : 60 __ __ RTS
.s3:
383e : 85 44 __ STA T0 + 0 
3840 : a8 __ __ TAY
3841 : be eb 55 LDX $55eb,y ; (__multab13L + 0)
3844 : 86 1b __ STX ACCU + 0 
3846 : bc 88 5c LDY $5c88,x ; (multab + 136)
3849 : 84 1c __ STY ACCU + 1 
384b : bd 89 5c LDA $5c89,x ; (multab + 137)
384e : 85 43 __ STA T5 + 0 
3850 : 85 1d __ STA ACCU + 2 
3852 : bd 83 5c LDA $5c83,x ; (multab + 131)
3855 : 85 45 __ STA T2 + 0 
3857 : 8d e7 5a STA $5ae7 ; (winCfg + 6)
385a : bd 84 5c LDA $5c84,x ; (multab + 132)
385d : 85 46 __ STA T2 + 1 
385f : 8d e8 5a STA $5ae8 ; (winCfg + 7)
3862 : bd 86 5c LDA $5c86,x ; (multab + 134)
3865 : 85 1e __ STA ACCU + 3 
3867 : bd 87 5c LDA $5c87,x ; (multab + 135)
386a : 85 4a __ STA T10 + 0 
386c : 0a __ __ ASL
386d : aa __ __ TAX
386e : bd 00 5c LDA $5c00,x ; (multab + 0)
3871 : 18 __ __ CLC
3872 : 65 1e __ ADC ACCU + 3 
3874 : 85 4b __ STA T11 + 0 
3876 : bd 01 5c LDA $5c01,x ; (multab + 1)
3879 : 69 00 __ ADC #$00
387b : 85 4c __ STA T11 + 1 
387d : a6 1b __ LDX ACCU + 0 
387f : bd 85 5c LDA $5c85,x ; (multab + 133)
3882 : 85 1b __ STA ACCU + 0 
3884 : 0a __ __ ASL
3885 : 10 0e __ BPL $3895 ; (vdcwin_win_free.s53 + 0)
.s10:
3887 : a5 1e __ LDA ACCU + 3 
3889 : f0 0a __ BEQ $3895 ; (vdcwin_win_free.s53 + 0)
.s7:
388b : e6 1c __ INC ACCU + 1 
388d : a5 4b __ LDA T11 + 0 
388f : d0 02 __ BNE $3893 ; (vdcwin_win_free.s1009 + 0)
.s1008:
3891 : c6 4c __ DEC T11 + 1 
.s1009:
3893 : c6 4b __ DEC T11 + 0 
.s53:
3895 : a5 1b __ LDA ACCU + 0 
3897 : 29 20 __ AND #$20
3899 : f0 14 __ BEQ $38af ; (vdcwin_win_free.s55 + 0)
.s14:
389b : 98 __ __ TYA
389c : 18 __ __ CLC
389d : 65 1e __ ADC ACCU + 3 
389f : a8 __ __ TAY
38a0 : a9 00 __ LDA #$00
38a2 : 2a __ __ ROL
38a3 : cd dc 5b CMP $5bdc ; (vdc_state + 4)
38a6 : d0 03 __ BNE $38ab ; (vdcwin_win_free.s1005 + 0)
.s1004:
38a8 : cc db 5b CPY $5bdb ; (vdc_state + 3)
.s1005:
38ab : b0 02 __ BCS $38af ; (vdcwin_win_free.s55 + 0)
.s11:
38ad : e6 1c __ INC ACCU + 1 
.s55:
38af : 24 1b __ BIT ACCU + 0 
38b1 : 10 15 __ BPL $38c8 ; (vdcwin_win_free.s56 + 0)
.s18:
38b3 : a5 4a __ LDA T10 + 0 
38b5 : f0 11 __ BEQ $38c8 ; (vdcwin_win_free.s56 + 0)
.s15:
38b7 : e6 1d __ INC ACCU + 2 
38b9 : 38 __ __ SEC
38ba : a5 4b __ LDA T11 + 0 
38bc : ed db 5b SBC $5bdb ; (vdc_state + 3)
38bf : 85 4b __ STA T11 + 0 
38c1 : a5 4c __ LDA T11 + 1 
38c3 : ed dc 5b SBC $5bdc ; (vdc_state + 4)
38c6 : 85 4c __ STA T11 + 1 
.s56:
38c8 : a5 1b __ LDA ACCU + 0 
38ca : 29 10 __ AND #$10
38cc : f0 15 __ BEQ $38e3 ; (vdcwin_win_free.s21 + 0)
.s22:
38ce : 18 __ __ CLC
38cf : a5 43 __ LDA T5 + 0 
38d1 : 65 4a __ ADC T10 + 0 
38d3 : a8 __ __ TAY
38d4 : a9 00 __ LDA #$00
38d6 : 2a __ __ ROL
38d7 : cd de 5b CMP $5bde ; (vdc_state + 6)
38da : d0 03 __ BNE $38df ; (vdcwin_win_free.s1003 + 0)
.s1002:
38dc : cc dd 5b CPY $5bdd ; (vdc_state + 5)
.s1003:
38df : b0 02 __ BCS $38e3 ; (vdcwin_win_free.s21 + 0)
.s19:
38e1 : e6 1d __ INC ACCU + 2 
.s21:
38e3 : a5 1d __ LDA ACCU + 2 
38e5 : d0 11 __ BNE $38f8 ; (vdcwin_win_free.s27 + 0)
.s26:
38e7 : a5 45 __ LDA T2 + 0 
38e9 : 8d e7 5a STA $5ae7 ; (winCfg + 6)
38ec : a5 46 __ LDA T2 + 1 
38ee : 8d e8 5a STA $5ae8 ; (winCfg + 7)
38f1 : a6 44 __ LDX T0 + 0 
38f3 : ca __ __ DEX
38f4 : 8e e6 5a STX $5ae6 ; (winCfg + 5)
.s1001:
38f7 : 60 __ __ RTS
.s27:
38f8 : 85 47 __ STA T3 + 0 
38fa : a5 1c __ LDA ACCU + 1 
38fc : 85 14 __ STA P7 
.l1006:
38fe : a9 00 __ LDA #$00
3900 : 85 15 __ STA P8 
3902 : ad e0 5b LDA $5be0 ; (vdc_state + 8)
3905 : 18 __ __ CLC
3906 : 65 4b __ ADC T11 + 0 
3908 : 85 0f __ STA P2 
390a : ad e1 5b LDA $5be1 ; (vdc_state + 9)
390d : 65 4c __ ADC T11 + 1 
390f : 85 10 __ STA P3 
3911 : ad e1 5a LDA $5ae1 ; (winCfg + 0)
3914 : 85 11 __ STA P4 
3916 : ad e7 5a LDA $5ae7 ; (winCfg + 6)
3919 : 85 48 __ STA T7 + 0 
391b : 85 12 __ STA P5 
391d : ad e8 5a LDA $5ae8 ; (winCfg + 7)
3920 : 85 49 __ STA T7 + 1 
3922 : 85 13 __ STA P6 
3924 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
3927 : a9 00 __ LDA #$00
3929 : 85 15 __ STA P8 
392b : 18 __ __ CLC
392c : a5 48 __ LDA T7 + 0 
392e : 65 14 __ ADC P7 
3930 : 85 48 __ STA T7 + 0 
3932 : 85 12 __ STA P5 
3934 : 8d e7 5a STA $5ae7 ; (winCfg + 6)
3937 : a5 49 __ LDA T7 + 1 
3939 : 69 00 __ ADC #$00
393b : 85 49 __ STA T7 + 1 
393d : 85 13 __ STA P6 
393f : 8d e8 5a STA $5ae8 ; (winCfg + 7)
3942 : ad e2 5b LDA $5be2 ; (vdc_state + 10)
3945 : 18 __ __ CLC
3946 : 65 4b __ ADC T11 + 0 
3948 : 85 0f __ STA P2 
394a : ad e3 5b LDA $5be3 ; (vdc_state + 11)
394d : 65 4c __ ADC T11 + 1 
394f : 85 10 __ STA P3 
3951 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
3954 : 18 __ __ CLC
3955 : a5 48 __ LDA T7 + 0 
3957 : 65 14 __ ADC P7 
3959 : 8d e7 5a STA $5ae7 ; (winCfg + 6)
395c : a5 49 __ LDA T7 + 1 
395e : 69 00 __ ADC #$00
3960 : 8d e8 5a STA $5ae8 ; (winCfg + 7)
3963 : ad db 5b LDA $5bdb ; (vdc_state + 3)
3966 : 18 __ __ CLC
3967 : 65 4b __ ADC T11 + 0 
3969 : 85 4b __ STA T11 + 0 
396b : ad dc 5b LDA $5bdc ; (vdc_state + 4)
396e : 65 4c __ ADC T11 + 1 
3970 : 85 4c __ STA T11 + 1 
3972 : c6 47 __ DEC T3 + 0 
3974 : d0 88 __ BNE $38fe ; (vdcwin_win_free.l1006 + 0)
3976 : 4c e7 38 JMP $38e7 ; (vdcwin_win_free.s26 + 0)
--------------------------------------------------------------------
3979 : __ __ __ BYT 6c 4f 41 44 20 43 48 41 52 53 45 54 53 00       : lOAD CHARSETS.
--------------------------------------------------------------------
3987 : __ __ __ BYT 56 44 43 53 45 46 41 4c 54 00                   : VDCSEFALT.
--------------------------------------------------------------------
3991 : __ __ __ BYT 56 44 43 53 45 46 53 54 44 00                   : VDCSEFSTD.
--------------------------------------------------------------------
screenmapfill: ; screenmapfill(u8,u8)->void
.s0:
399b : a9 00 __ LDA #$00
399d : 85 0d __ STA P0 
399f : a9 58 __ LDA #$58
39a1 : 85 0e __ STA P1 
39a3 : ad fb ab LDA $abfb ; (sstack + 5)
39a6 : 85 0f __ STA P2 
39a8 : ad f1 5b LDA $5bf1 ; (screentotal + 0)
39ab : 85 51 __ STA T0 + 0 
39ad : 18 __ __ CLC
39ae : 69 30 __ ADC #$30
39b0 : 85 10 __ STA P3 
39b2 : ad f2 5b LDA $5bf2 ; (screentotal + 1)
39b5 : 85 52 __ STA T0 + 1 
39b7 : 69 00 __ ADC #$00
39b9 : 85 11 __ STA P4 
39bb : 20 c3 14 JSR $14c3 ; (bnk_memset.s0 + 0)
39be : 20 da 39 JSR $39da ; (placesignature.s1000 + 0)
39c1 : a5 51 __ LDA T0 + 0 
39c3 : 85 10 __ STA P3 
39c5 : 18 __ __ CLC
39c6 : 69 30 __ ADC #$30
39c8 : 85 0d __ STA P0 
39ca : a5 52 __ LDA T0 + 1 
39cc : 85 11 __ STA P4 
39ce : 69 58 __ ADC #$58
39d0 : 85 0e __ STA P1 
39d2 : ad fc ab LDA $abfc ; (sstack + 6)
39d5 : 85 0f __ STA P2 
39d7 : 4c c3 14 JMP $14c3 ; (bnk_memset.s0 + 0)
--------------------------------------------------------------------
placesignature: ; placesignature()->void
.s1000:
39da : 38 __ __ SEC
39db : a5 23 __ LDA SP + 0 
39dd : e9 08 __ SBC #$08
39df : 85 23 __ STA SP + 0 
39e1 : b0 02 __ BCS $39e5 ; (placesignature.s0 + 0)
39e3 : c6 24 __ DEC SP + 1 
.s0:
39e5 : a9 00 __ LDA #$00
39e7 : a2 31 __ LDX #$31
.l1007:
39e9 : 9d a8 ab STA $aba8,x ; (buff + 0)
39ec : ca __ __ DEX
39ed : d0 fa __ BNE $39e9 ; (placesignature.l1007 + 0)
.s1003:
39ef : ad fe 5a LDA $5afe ; (screen_row + 0)
39f2 : 85 1b __ STA ACCU + 0 
39f4 : ad ff 5a LDA $5aff ; (screen_row + 1)
39f7 : 85 1c __ STA ACCU + 1 
39f9 : ad fc 5a LDA $5afc ; (screen_col + 0)
39fc : 85 03 __ STA WORK + 0 
39fe : ad fd 5a LDA $5afd ; (screen_col + 1)
3a01 : 85 04 __ STA WORK + 1 
3a03 : 20 46 56 JSR $5646 ; (mul16 + 0)
3a06 : a5 05 __ LDA WORK + 2 
3a08 : 85 4e __ STA T0 + 0 
3a0a : 18 __ __ CLC
3a0b : a5 06 __ LDA WORK + 3 
3a0d : 69 58 __ ADC #$58
3a0f : 85 4f __ STA T0 + 1 
3a11 : a9 a9 __ LDA #$a9
3a13 : a0 02 __ LDY #$02
3a15 : 91 23 __ STA (SP + 0),y 
3a17 : a9 ab __ LDA #$ab
3a19 : c8 __ __ INY
3a1a : 91 23 __ STA (SP + 0),y 
3a1c : a9 76 __ LDA #$76
3a1e : c8 __ __ INY
3a1f : 91 23 __ STA (SP + 0),y 
3a21 : a9 3a __ LDA #$3a
3a23 : c8 __ __ INY
3a24 : 91 23 __ STA (SP + 0),y 
3a26 : a9 92 __ LDA #$92
3a28 : c8 __ __ INY
3a29 : 91 23 __ STA (SP + 0),y 
3a2b : a9 3a __ LDA #$3a
3a2d : c8 __ __ INY
3a2e : 91 23 __ STA (SP + 0),y 
3a30 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
3a33 : a9 00 __ LDA #$00
3a35 : 85 50 __ STA T2 + 0 
.l1:
3a37 : a9 a9 __ LDA #$a9
3a39 : 85 0d __ STA P0 
3a3b : a9 ab __ LDA #$ab
3a3d : 85 0e __ STA P1 
3a3f : 20 db 32 JSR $32db ; (strlen.s0 + 0)
3a42 : a5 1c __ LDA ACCU + 1 
3a44 : 30 24 __ BMI $3a6a ; (placesignature.s1001 + 0)
.s1006:
3a46 : d0 06 __ BNE $3a4e ; (placesignature.s2 + 0)
.s1004:
3a48 : a5 50 __ LDA T2 + 0 
3a4a : c5 1b __ CMP ACCU + 0 
3a4c : b0 1c __ BCS $3a6a ; (placesignature.s1001 + 0)
.s2:
3a4e : 18 __ __ CLC
3a4f : a5 4e __ LDA T0 + 0 
3a51 : 65 50 __ ADC T2 + 0 
3a53 : 85 0d __ STA P0 
3a55 : a5 4f __ LDA T0 + 1 
3a57 : 69 00 __ ADC #$00
3a59 : 85 0e __ STA P1 
3a5b : a6 50 __ LDX T2 + 0 
3a5d : bd a9 ab LDA $aba9,x ; (buff + 1)
3a60 : 85 0f __ STA P2 
3a62 : 20 f5 14 JSR $14f5 ; (bnk_writeb.s0 + 0)
3a65 : e6 50 __ INC T2 + 0 
3a67 : 4c 37 3a JMP $3a37 ; (placesignature.l1 + 0)
.s1001:
3a6a : 18 __ __ CLC
3a6b : a5 23 __ LDA SP + 0 
3a6d : 69 08 __ ADC #$08
3a6f : 85 23 __ STA SP + 0 
3a71 : 90 02 __ BCC $3a75 ; (placesignature.s1001 + 11)
3a73 : e6 24 __ INC SP + 1 
3a75 : 60 __ __ RTS
--------------------------------------------------------------------
3a76 : __ __ __ BYT 76 64 63 20 73 43 52 45 45 4e 20 65 44 49 54 4f : vdc sCREEN eDITO
3a86 : __ __ __ BYT 52 20 25 53 20 78 2e 6d 4f 4c 20 00             : R %S x.mOL .
--------------------------------------------------------------------
3a92 : __ __ __ BYT 56 31 31 2d 32 30 32 34 30 33 30 37 2d 31 37 30 : V11-20240307-170
3aa2 : __ __ __ BYT 35 00                                           : 5.
--------------------------------------------------------------------
3aa4 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 53 54 41 : pRESS KEY TO STA
3ab4 : __ __ __ BYT 52 54 2e 00                                     : RT..
--------------------------------------------------------------------
plotcursor: ; plotcursor()->void
.s0:
3ab8 : ad fe 5a LDA $5afe ; (screen_row + 0)
3abb : 85 0d __ STA P0 
3abd : ad fc 5a LDA $5afc ; (screen_col + 0)
3ac0 : 85 0e __ STA P1 
3ac2 : ad f4 5b LDA $5bf4 ; (plotscreencode + 0)
3ac5 : 85 0f __ STA P2 
3ac7 : ad f8 5b LDA $5bf8 ; (plotblink + 0)
3aca : 0a __ __ ASL
3acb : 0a __ __ ASL
3acc : 0a __ __ ASL
3acd : 0a __ __ ASL
3ace : 18 __ __ CLC
3acf : 6d f5 5b ADC $5bf5 ; (plotcolor + 0)
3ad2 : 85 43 __ STA T0 + 0 
3ad4 : ad f7 5b LDA $5bf7 ; (plotunderline + 0)
3ad7 : 4a __ __ LSR
3ad8 : 6a __ __ ROR
3ad9 : 6a __ __ ROR
3ada : 29 c0 __ AND #$c0
3adc : 6a __ __ ROR
3add : 65 43 __ ADC T0 + 0 
3adf : 85 43 __ STA T0 + 0 
3ae1 : ad f6 5b LDA $5bf6 ; (plotreverse + 0)
3ae4 : 4a __ __ LSR
3ae5 : 6a __ __ ROR
3ae6 : 29 80 __ AND #$80
3ae8 : 6a __ __ ROR
3ae9 : 65 43 __ ADC T0 + 0 
3aeb : 85 43 __ STA T0 + 0 
3aed : ad f9 5b LDA $5bf9 ; (plotaltchar + 0)
3af0 : 4a __ __ LSR
3af1 : a9 00 __ LDA #$00
3af3 : 6a __ __ ROR
3af4 : 65 43 __ ADC T0 + 0 
3af6 : 85 10 __ STA P3 
3af8 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_cursor_show@proxy: ; vdcwin_cursor_show@proxy
3afb : a9 04 __ LDA #$04
3afd : 85 0d __ STA P0 
3aff : a9 5b __ LDA #$5b
3b01 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdcwin_cursor_show: ; vdcwin_cursor_show(struct VDCWin*,bool)->void
.s0:
3b03 : a0 01 __ LDY #$01
3b05 : b1 0d __ LDA (P0),y ; (win + 0)
3b07 : 18 __ __ CLC
3b08 : a0 05 __ LDY #$05
3b0a : 71 0d __ ADC (P0),y ; (win + 0)
3b0c : 0a __ __ ASL
3b0d : aa __ __ TAX
3b0e : 18 __ __ CLC
3b0f : 88 __ __ DEY
3b10 : b1 0d __ LDA (P0),y ; (win + 0)
3b12 : a0 00 __ LDY #$00
3b14 : 71 0d __ ADC (P0),y ; (win + 0)
3b16 : 18 __ __ CLC
3b17 : 7d 00 5c ADC $5c00,x ; (multab + 0)
3b1a : a8 __ __ TAY
3b1b : a9 00 __ LDA #$00
3b1d : 7d 01 5c ADC $5c01,x ; (multab + 1)
3b20 : a2 12 __ LDX #$12
3b22 : 8e 00 d6 STX $d600 
3b25 : aa __ __ TAX
3b26 : 98 __ __ TYA
3b27 : 18 __ __ CLC
3b28 : 6d e2 5b ADC $5be2 ; (vdc_state + 10)
3b2b : a8 __ __ TAY
3b2c : 8a __ __ TXA
3b2d : 6d e3 5b ADC $5be3 ; (vdc_state + 11)
.l169:
3b30 : 2c 00 d6 BIT $d600 
3b33 : 10 fb __ BPL $3b30 ; (vdcwin_cursor_show.l169 + 0)
.s9:
3b35 : 8d 01 d6 STA $d601 
3b38 : a2 13 __ LDX #$13
3b3a : 8e 00 d6 STX $d600 
.l171:
3b3d : 2c 00 d6 BIT $d600 
3b40 : 10 fb __ BPL $3b3d ; (vdcwin_cursor_show.l171 + 0)
.s14:
3b42 : 8c 01 d6 STY $d601 
3b45 : a2 1f __ LDX #$1f
3b47 : 8e 00 d6 STX $d600 
.l173:
3b4a : 2c 00 d6 BIT $d600 
3b4d : 10 fb __ BPL $3b4a ; (vdcwin_cursor_show.l173 + 0)
.s18:
3b4f : aa __ __ TAX
3b50 : ad 01 d6 LDA $d601 
3b53 : 49 50 __ EOR #$50
3b55 : 85 1b __ STA ACCU + 0 
3b57 : a9 12 __ LDA #$12
3b59 : 8d 00 d6 STA $d600 
.l175:
3b5c : 2c 00 d6 BIT $d600 
3b5f : 10 fb __ BPL $3b5c ; (vdcwin_cursor_show.l175 + 0)
.s27:
3b61 : 8e 01 d6 STX $d601 
3b64 : a9 13 __ LDA #$13
3b66 : 8d 00 d6 STA $d600 
.l177:
3b69 : 2c 00 d6 BIT $d600 
3b6c : 10 fb __ BPL $3b69 ; (vdcwin_cursor_show.l177 + 0)
.s32:
3b6e : 8c 01 d6 STY $d601 
3b71 : a9 1f __ LDA #$1f
3b73 : 8d 00 d6 STA $d600 
.l179:
3b76 : 2c 00 d6 BIT $d600 
3b79 : 10 fb __ BPL $3b76 ; (vdcwin_cursor_show.l179 + 0)
.s36:
3b7b : a5 1b __ LDA ACCU + 0 
3b7d : 8d 01 d6 STA $d601 
.s1001:
3b80 : 60 __ __ RTS
--------------------------------------------------------------------
initstatusbar: ; initstatusbar()->void
.s1000:
3b81 : a5 53 __ LDA T3 + 0 
3b83 : 8d d3 ab STA $abd3 ; (buff + 43)
.s0:
3b86 : ac dd 5b LDY $5bdd ; (vdc_state + 5)
3b89 : 88 __ __ DEY
3b8a : ad ff 5a LDA $5aff ; (screen_row + 1)
3b8d : f0 04 __ BEQ $3b93 ; (initstatusbar.s1002 + 0)
.s1004:
3b8f : 98 __ __ TYA
3b90 : 4c 99 3b JMP $3b99 ; (initstatusbar.s3 + 0)
.s1002:
3b93 : 98 __ __ TYA
3b94 : cc fe 5a CPY $5afe ; (screen_row + 0)
3b97 : f0 6b __ BEQ $3c04 ; (initstatusbar.s1001 + 0)
.s3:
3b99 : 85 0f __ STA P2 
3b9b : a9 50 __ LDA #$50
3b9d : 85 13 __ STA P6 
3b9f : a9 00 __ LDA #$00
3ba1 : 85 14 __ STA P7 
3ba3 : a9 01 __ LDA #$01
3ba5 : 85 15 __ STA P8 
3ba7 : ad ff 3d LDA $3dff ; (mc_menupopup + 0)
3baa : 85 53 __ STA T3 + 0 
3bac : 8d df 5b STA $5bdf ; (vdc_state + 7)
3baf : 20 7a 2d JSR $2d7a ; (vdc_clear.s0 + 0)
3bb2 : a9 00 __ LDA #$00
3bb4 : 85 10 __ STA P3 
3bb6 : a5 53 __ LDA T3 + 0 
3bb8 : 85 13 __ STA P6 
3bba : a9 0a __ LDA #$0a
3bbc : 85 11 __ STA P4 
3bbe : a9 3c __ LDA #$3c
3bc0 : 85 12 __ STA P5 
3bc2 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3bc5 : a9 11 __ LDA #$11
3bc7 : 85 10 __ STA P3 
3bc9 : a9 10 __ LDA #$10
3bcb : 85 11 __ STA P4 
3bcd : a9 3c __ LDA #$3c
3bcf : 85 12 __ STA P5 
3bd1 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3bd4 : a9 1f __ LDA #$1f
3bd6 : 85 10 __ STA P3 
3bd8 : a9 15 __ LDA #$15
3bda : 85 11 __ STA P4 
3bdc : a9 3c __ LDA #$3c
3bde : 85 12 __ STA P5 
3be0 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3be3 : a9 29 __ LDA #$29
3be5 : 85 10 __ STA P3 
3be7 : a9 1b __ LDA #$1b
3be9 : 85 11 __ STA P4 
3beb : a9 3c __ LDA #$3c
3bed : 85 12 __ STA P5 
3bef : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3bf2 : a9 49 __ LDA #$49
3bf4 : 85 10 __ STA P3 
3bf6 : a9 22 __ LDA #$22
3bf8 : 85 11 __ STA P4 
3bfa : a9 3c __ LDA #$3c
3bfc : 85 12 __ STA P5 
3bfe : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3c01 : 20 2a 3c JSR $3c2a ; (printstatusbar.s1000 + 0)
.s1001:
3c04 : ad d3 ab LDA $abd3 ; (buff + 43)
3c07 : 85 53 __ STA T3 + 0 
3c09 : 60 __ __ RTS
--------------------------------------------------------------------
3c0a : __ __ __ BYT 6d 4f 44 45 3a 00                               : mODE:.
--------------------------------------------------------------------
3c10 : __ __ __ BYT 78 2c 79 3a 00                                  : x,y:.
--------------------------------------------------------------------
3c15 : __ __ __ BYT 63 48 41 52 3a 00                               : cHAR:.
--------------------------------------------------------------------
3c1b : __ __ __ BYT 63 4f 4c 4f 52 3a 00                            : cOLOR:.
--------------------------------------------------------------------
3c22 : __ __ __ BYT 66 38 3d 68 45 4c 50 00                         : f8=hELP.
--------------------------------------------------------------------
printstatusbar: ; printstatusbar()->void
.s1000:
3c2a : a5 53 __ LDA T7 + 0 
3c2c : 8d d6 ab STA $abd6 ; (buff + 46)
3c2f : 38 __ __ SEC
3c30 : a5 23 __ LDA SP + 0 
3c32 : e9 0a __ SBC #$0a
3c34 : 85 23 __ STA SP + 0 
3c36 : b0 02 __ BCS $3c3a ; (printstatusbar.s0 + 0)
3c38 : c6 24 __ DEC SP + 1 
.s0:
3c3a : ae dd 5b LDX $5bdd ; (vdc_state + 5)
3c3d : ca __ __ DEX
3c3e : 86 4e __ STX T0 + 0 
3c40 : ad fe 5a LDA $5afe ; (screen_row + 0)
3c43 : 85 4f __ STA T2 + 0 
3c45 : ad ff 5a LDA $5aff ; (screen_row + 1)
3c48 : 85 50 __ STA T2 + 1 
3c4a : d0 09 __ BNE $3c55 ; (printstatusbar.s3 + 0)
.s1002:
3c4c : a5 4f __ LDA T2 + 0 
3c4e : c5 4e __ CMP T0 + 0 
3c50 : d0 03 __ BNE $3c55 ; (printstatusbar.s3 + 0)
3c52 : 4c cc 3d JMP $3dcc ; (printstatusbar.s1001 + 0)
.s3:
3c55 : ad ff 3d LDA $3dff ; (mc_menupopup + 0)
3c58 : 85 51 __ STA T3 + 0 
3c5a : 8d df 5b STA $5bdf ; (vdc_state + 7)
3c5d : a9 51 __ LDA #$51
3c5f : a0 02 __ LDY #$02
3c61 : 91 23 __ STA (SP + 0),y 
3c63 : a9 5d __ LDA #$5d
3c65 : c8 __ __ INY
3c66 : 91 23 __ STA (SP + 0),y 
3c68 : a9 dd __ LDA #$dd
3c6a : c8 __ __ INY
3c6b : 91 23 __ STA (SP + 0),y 
3c6d : a9 3d __ LDA #$3d
3c6f : c8 __ __ INY
3c70 : 91 23 __ STA (SP + 0),y 
3c72 : a9 b7 __ LDA #$b7
3c74 : c8 __ __ INY
3c75 : 91 23 __ STA (SP + 0),y 
3c77 : a9 5c __ LDA #$5c
3c79 : c8 __ __ INY
3c7a : 91 23 __ STA (SP + 0),y 
3c7c : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
3c7f : a9 06 __ LDA #$06
3c81 : 85 10 __ STA P3 
3c83 : 20 25 58 JSR $5825 ; (vdc_prints_attr@proxy + 0)
3c86 : a9 51 __ LDA #$51
3c88 : a0 02 __ LDY #$02
3c8a : 91 23 __ STA (SP + 0),y 
3c8c : a9 5d __ LDA #$5d
3c8e : c8 __ __ INY
3c8f : 91 23 __ STA (SP + 0),y 
3c91 : a9 e3 __ LDA #$e3
3c93 : c8 __ __ INY
3c94 : 91 23 __ STA (SP + 0),y 
3c96 : a9 3d __ LDA #$3d
3c98 : c8 __ __ INY
3c99 : 91 23 __ STA (SP + 0),y 
3c9b : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
3c9e : 18 __ __ CLC
3c9f : 6d fc 5a ADC $5afc ; (screen_col + 0)
3ca2 : aa __ __ TAX
3ca3 : ad 01 5b LDA $5b01 ; (vdc_modes + 1)
3ca6 : 6d fd 5a ADC $5afd ; (screen_col + 1)
3ca9 : a0 07 __ LDY #$07
3cab : 91 23 __ STA (SP + 0),y 
3cad : 8a __ __ TXA
3cae : 88 __ __ DEY
3caf : 91 23 __ STA (SP + 0),y 
3cb1 : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
3cb4 : 18 __ __ CLC
3cb5 : 65 4f __ ADC T2 + 0 
3cb7 : aa __ __ TAX
3cb8 : ad 03 5b LDA $5b03 ; (vdc_modes + 3)
3cbb : 65 50 __ ADC T2 + 1 
3cbd : a0 09 __ LDY #$09
3cbf : 91 23 __ STA (SP + 0),y 
3cc1 : 8a __ __ TXA
3cc2 : 88 __ __ DEY
3cc3 : 91 23 __ STA (SP + 0),y 
3cc5 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
3cc8 : a9 16 __ LDA #$16
3cca : 85 10 __ STA P3 
3ccc : 20 25 58 JSR $5825 ; (vdc_prints_attr@proxy + 0)
3ccf : a5 0f __ LDA P2 
3cd1 : 85 0d __ STA P0 
3cd3 : a9 24 __ LDA #$24
3cd5 : 85 0e __ STA P1 
3cd7 : ad f4 5b LDA $5bf4 ; (plotscreencode + 0)
3cda : 85 52 __ STA T6 + 0 
3cdc : 85 0f __ STA P2 
3cde : ad f9 5b LDA $5bf9 ; (plotaltchar + 0)
3ce1 : 85 53 __ STA T7 + 0 
3ce3 : d0 08 __ BNE $3ced ; (printstatusbar.s7 + 0)
.s8:
3ce5 : 38 __ __ SEC
3ce6 : a5 13 __ LDA P6 
3ce8 : e9 80 __ SBC #$80
3cea : 4c ef 3c JMP $3cef ; (printstatusbar.s9 + 0)
.s7:
3ced : a5 13 __ LDA P6 
.s9:
3cef : 85 10 __ STA P3 
3cf1 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
3cf4 : a9 51 __ LDA #$51
3cf6 : a0 02 __ LDY #$02
3cf8 : 91 23 __ STA (SP + 0),y 
3cfa : a9 5d __ LDA #$5d
3cfc : c8 __ __ INY
3cfd : 91 23 __ STA (SP + 0),y 
3cff : a9 eb __ LDA #$eb
3d01 : c8 __ __ INY
3d02 : 91 23 __ STA (SP + 0),y 
3d04 : a9 3d __ LDA #$3d
3d06 : c8 __ __ INY
3d07 : 91 23 __ STA (SP + 0),y 
3d09 : a5 52 __ LDA T6 + 0 
3d0b : c8 __ __ INY
3d0c : 91 23 __ STA (SP + 0),y 
3d0e : a9 00 __ LDA #$00
3d10 : c8 __ __ INY
3d11 : 91 23 __ STA (SP + 0),y 
3d13 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
3d16 : a9 26 __ LDA #$26
3d18 : 85 10 __ STA P3 
3d1a : 20 25 58 JSR $5825 ; (vdc_prints_attr@proxy + 0)
3d1d : a5 0f __ LDA P2 
3d1f : 85 0d __ STA P0 
3d21 : a9 30 __ LDA #$30
3d23 : 85 0e __ STA P1 
3d25 : a9 20 __ LDA #$20
3d27 : 85 0f __ STA P2 
3d29 : ad f5 5b LDA $5bf5 ; (plotcolor + 0)
3d2c : 85 52 __ STA T6 + 0 
3d2e : 18 __ __ CLC
3d2f : 69 40 __ ADC #$40
3d31 : 85 10 __ STA P3 
3d33 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
3d36 : a9 51 __ LDA #$51
3d38 : a0 02 __ LDY #$02
3d3a : 91 23 __ STA (SP + 0),y 
3d3c : a9 5d __ LDA #$5d
3d3e : c8 __ __ INY
3d3f : 91 23 __ STA (SP + 0),y 
3d41 : a5 52 __ LDA T6 + 0 
3d43 : a0 06 __ LDY #$06
3d45 : 91 23 __ STA (SP + 0),y 
3d47 : a9 00 __ LDA #$00
3d49 : c8 __ __ INY
3d4a : 91 23 __ STA (SP + 0),y 
3d4c : a9 ef __ LDA #$ef
3d4e : a0 04 __ LDY #$04
3d50 : 91 23 __ STA (SP + 0),y 
3d52 : a9 3d __ LDA #$3d
3d54 : c8 __ __ INY
3d55 : 91 23 __ STA (SP + 0),y 
3d57 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
3d5a : a9 32 __ LDA #$32
3d5c : 85 10 __ STA P3 
3d5e : 20 25 58 JSR $5825 ; (vdc_prints_attr@proxy + 0)
3d61 : a9 36 __ LDA #$36
3d63 : 85 10 __ STA P3 
3d65 : ad f6 5b LDA $5bf6 ; (plotreverse + 0)
3d68 : d0 07 __ BNE $3d71 ; (printstatusbar.s12 + 0)
.s13:
3d6a : a9 3d __ LDA #$3d
3d6c : a2 f7 __ LDX #$f7
3d6e : 4c 75 3d JMP $3d75 ; (printstatusbar.s35 + 0)
.s12:
3d71 : a9 3d __ LDA #$3d
3d73 : a2 f3 __ LDX #$f3
.s35:
3d75 : 86 11 __ STX P4 
3d77 : 85 12 __ STA P5 
3d79 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3d7c : ad f7 5b LDA $5bf7 ; (plotunderline + 0)
3d7f : d0 07 __ BNE $3d88 ; (printstatusbar.s17 + 0)
.s18:
3d81 : a9 3d __ LDA #$3d
3d83 : a2 f7 __ LDX #$f7
3d85 : 4c 8c 3d JMP $3d8c ; (printstatusbar.s36 + 0)
.s17:
3d88 : a9 3d __ LDA #$3d
3d8a : a2 fb __ LDX #$fb
.s36:
3d8c : 86 11 __ STX P4 
3d8e : 85 12 __ STA P5 
3d90 : a9 3a __ LDA #$3a
3d92 : 85 10 __ STA P3 
3d94 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3d97 : ad f8 5b LDA $5bf8 ; (plotblink + 0)
3d9a : d0 07 __ BNE $3da3 ; (printstatusbar.s22 + 0)
.s23:
3d9c : a9 3d __ LDA #$3d
3d9e : a2 f7 __ LDX #$f7
3da0 : 4c a7 3d JMP $3da7 ; (printstatusbar.s37 + 0)
.s22:
3da3 : a9 3e __ LDA #$3e
3da5 : a2 00 __ LDX #$00
.s37:
3da7 : 86 11 __ STX P4 
3da9 : 85 12 __ STA P5 
3dab : a9 3e __ LDA #$3e
3dad : 85 10 __ STA P3 
3daf : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
3db2 : a5 53 __ LDA T7 + 0 
3db4 : d0 07 __ BNE $3dbd ; (printstatusbar.s27 + 0)
.s28:
3db6 : a9 3d __ LDA #$3d
3db8 : a2 f7 __ LDX #$f7
3dba : 4c c1 3d JMP $3dc1 ; (printstatusbar.s29 + 0)
.s27:
3dbd : a9 3e __ LDA #$3e
3dbf : a2 04 __ LDX #$04
.s29:
3dc1 : 86 11 __ STX P4 
3dc3 : 85 12 __ STA P5 
3dc5 : a9 42 __ LDA #$42
3dc7 : 85 10 __ STA P3 
3dc9 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
.s1001:
3dcc : 18 __ __ CLC
3dcd : a5 23 __ LDA SP + 0 
3dcf : 69 0a __ ADC #$0a
3dd1 : 85 23 __ STA SP + 0 
3dd3 : 90 02 __ BCC $3dd7 ; (printstatusbar.s1001 + 11)
3dd5 : e6 24 __ INC SP + 1 
3dd7 : ad d6 ab LDA $abd6 ; (buff + 46)
3dda : 85 53 __ STA T7 + 0 
3ddc : 60 __ __ RTS
--------------------------------------------------------------------
3ddd : __ __ __ BYT 25 2d 31 30 53 00                               : %-10S.
--------------------------------------------------------------------
3de3 : __ __ __ BYT 25 33 55 2c 25 33 55 00                         : %3U,%3U.
--------------------------------------------------------------------
3deb : __ __ __ BYT 25 32 78 00                                     : %2x.
--------------------------------------------------------------------
3def : __ __ __ BYT 25 32 55 00                                     : %2U.
--------------------------------------------------------------------
3df3 : __ __ __ BYT 72 65 76 00                                     : rev.
--------------------------------------------------------------------
3df7 : __ __ __ BYT 20 20 20 00                                     :    .
--------------------------------------------------------------------
3dfb : __ __ __ BYT 75 6e 64 00                                     : und.
--------------------------------------------------------------------
mc_menupopup:
3dff : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
3e00 : __ __ __ BYT 62 6c 69 00                                     : bli.
--------------------------------------------------------------------
3e04 : __ __ __ BYT 61 6c 74 00                                     : alt.
--------------------------------------------------------------------
plotmove: ; plotmove(u8)->void
.s1000:
3e08 : a2 06 __ LDX #$06
3e0a : b5 53 __ LDA T0 + 0,x 
3e0c : 9d c3 ab STA $abc3,x ; (buff + 27)
3e0f : ca __ __ DEX
3e10 : 10 f8 __ BPL $3e0a ; (plotmove.s1000 + 2)
.s0:
3e12 : ad fc 5a LDA $5afc ; (screen_col + 0)
3e15 : 85 53 __ STA T0 + 0 
3e17 : 18 __ __ CLC
3e18 : 6d 00 5b ADC $5b00 ; (vdc_modes + 0)
3e1b : 85 54 __ STA T1 + 0 
3e1d : ad 01 5b LDA $5b01 ; (vdc_modes + 1)
3e20 : 6d fd 5a ADC $5afd ; (screen_col + 1)
3e23 : 85 55 __ STA T1 + 1 
3e25 : ad fe 5a LDA $5afe ; (screen_row + 0)
3e28 : 85 56 __ STA T2 + 0 
3e2a : 18 __ __ CLC
3e2b : 6d 02 5b ADC $5b02 ; (vdc_modes + 2)
3e2e : 85 03 __ STA WORK + 0 
3e30 : ad 03 5b LDA $5b03 ; (vdc_modes + 3)
3e33 : 6d ff 5a ADC $5aff ; (screen_row + 1)
3e36 : 85 04 __ STA WORK + 1 
3e38 : ad fc 5a LDA $5afc ; (screen_col + 0)
3e3b : 85 57 __ STA T4 + 0 
3e3d : 85 1b __ STA ACCU + 0 
3e3f : ad fd 5a LDA $5afd ; (screen_col + 1)
3e42 : 85 58 __ STA T4 + 1 
3e44 : 85 1c __ STA ACCU + 1 
3e46 : 20 46 56 JSR $5646 ; (mul16 + 0)
3e49 : 18 __ __ CLC
3e4a : a5 06 __ LDA WORK + 3 
3e4c : 69 58 __ ADC #$58
3e4e : aa __ __ TAX
3e4f : 18 __ __ CLC
3e50 : a5 05 __ LDA WORK + 2 
3e52 : 65 54 __ ADC T1 + 0 
3e54 : 85 0d __ STA P0 
3e56 : 8a __ __ TXA
3e57 : 65 55 __ ADC T1 + 1 
3e59 : 85 0e __ STA P1 
3e5b : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
3e5e : 85 59 __ STA T5 + 0 
3e60 : ad fe 5a LDA $5afe ; (screen_row + 0)
3e63 : 85 1b __ STA ACCU + 0 
3e65 : ad ff 5a LDA $5aff ; (screen_row + 1)
3e68 : 85 1c __ STA ACCU + 1 
3e6a : a5 57 __ LDA T4 + 0 
3e6c : 85 03 __ STA WORK + 0 
3e6e : a5 58 __ LDA T4 + 1 
3e70 : 85 04 __ STA WORK + 1 
3e72 : 20 46 56 JSR $5646 ; (mul16 + 0)
3e75 : 18 __ __ CLC
3e76 : a5 05 __ LDA WORK + 2 
3e78 : 65 0d __ ADC P0 
3e7a : a8 __ __ TAY
3e7b : a5 06 __ LDA WORK + 3 
3e7d : 65 0e __ ADC P1 
3e7f : aa __ __ TAX
3e80 : 98 __ __ TYA
3e81 : 18 __ __ CLC
3e82 : 69 30 __ ADC #$30
3e84 : 85 0d __ STA P0 
3e86 : 90 01 __ BCC $3e89 ; (plotmove.s1015 + 0)
.s1014:
3e88 : e8 __ __ INX
.s1015:
3e89 : 86 0e __ STX P1 
3e8b : 20 07 15 JSR $1507 ; (bnk_readb.s0 + 0)
3e8e : 85 10 __ STA P3 
3e90 : a5 56 __ LDA T2 + 0 
3e92 : 85 0d __ STA P0 
3e94 : a5 53 __ LDA T0 + 0 
3e96 : 85 0e __ STA P1 
3e98 : a5 59 __ LDA T5 + 0 
3e9a : 85 0f __ STA P2 
3e9c : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
3e9f : ad ff ab LDA $abff ; (sstack + 9)
3ea2 : c9 91 __ CMP #$91
3ea4 : d0 12 __ BNE $3eb8 ; (plotmove.s13 + 0)
.s8:
3ea6 : a9 00 __ LDA #$00
3ea8 : 8d fb ab STA $abfb ; (sstack + 5)
3eab : 8d fc ab STA $abfc ; (sstack + 6)
3eae : 8d fe ab STA $abfe ; (sstack + 8)
3eb1 : a9 01 __ LDA #$01
3eb3 : 8d fd ab STA $abfd ; (sstack + 7)
3eb6 : d0 16 __ BNE $3ece ; (plotmove.s1012 + 0)
.s13:
3eb8 : 90 25 __ BCC $3edf ; (plotmove.s15 + 0)
.s14:
3eba : c9 9d __ CMP #$9d
3ebc : d0 13 __ BNE $3ed1 ; (plotmove.s1001 + 0)
.s6:
3ebe : a9 01 __ LDA #$01
3ec0 : 8d fb ab STA $abfb ; (sstack + 5)
3ec3 : a9 00 __ LDA #$00
3ec5 : 8d fc ab STA $abfc ; (sstack + 6)
3ec8 : 8d fd ab STA $abfd ; (sstack + 7)
.s1013:
3ecb : 8d fe ab STA $abfe ; (sstack + 8)
.s1012:
3ece : 20 08 3f JSR $3f08 ; (cursormove.s1000 + 0)
.s1001:
3ed1 : 20 b8 3a JSR $3ab8 ; (plotcursor.s0 + 0)
3ed4 : a2 06 __ LDX #$06
3ed6 : bd c3 ab LDA $abc3,x ; (buff + 27)
3ed9 : 95 53 __ STA T0 + 0,x 
3edb : ca __ __ DEX
3edc : 10 f8 __ BPL $3ed6 ; (plotmove.s1001 + 5)
3ede : 60 __ __ RTS
.s15:
3edf : c9 11 __ CMP #$11
3ee1 : d0 0f __ BNE $3ef2 ; (plotmove.s16 + 0)
.s9:
3ee3 : a9 00 __ LDA #$00
3ee5 : 8d fb ab STA $abfb ; (sstack + 5)
3ee8 : 8d fc ab STA $abfc ; (sstack + 6)
3eeb : 8d fd ab STA $abfd ; (sstack + 7)
3eee : a9 01 __ LDA #$01
3ef0 : d0 d9 __ BNE $3ecb ; (plotmove.s1013 + 0)
.s16:
3ef2 : c9 1d __ CMP #$1d
3ef4 : d0 db __ BNE $3ed1 ; (plotmove.s1001 + 0)
.s7:
3ef6 : a9 00 __ LDA #$00
3ef8 : 8d fb ab STA $abfb ; (sstack + 5)
3efb : 8d fd ab STA $abfd ; (sstack + 7)
3efe : 8d fe ab STA $abfe ; (sstack + 8)
3f01 : a9 01 __ LDA #$01
3f03 : 8d fc ab STA $abfc ; (sstack + 6)
3f06 : d0 c6 __ BNE $3ece ; (plotmove.s1012 + 0)
--------------------------------------------------------------------
cursormove: ; cursormove(u8,u8,u8,u8)->void
.s1000:
3f08 : a2 03 __ LDX #$03
3f0a : b5 53 __ LDA T2 + 0,x 
3f0c : 9d cc ab STA $abcc,x ; (buff + 36)
3f0f : ca __ __ DEX
3f10 : 10 f8 __ BPL $3f0a ; (cursormove.s1000 + 2)
.s0:
3f12 : ad fb ab LDA $abfb ; (sstack + 5)
3f15 : c9 01 __ CMP #$01
3f17 : d0 25 __ BNE $3f3e ; (cursormove.s56 + 0)
.s1:
3f19 : ad fc 5a LDA $5afc ; (screen_col + 0)
3f1c : 0d fd 5a ORA $5afd ; (screen_col + 1)
3f1f : d0 03 __ BNE $3f24 ; (cursormove.s5 + 0)
3f21 : 4c bb 40 JMP $40bb ; (cursormove.s4 + 0)
.s5:
3f24 : ad fc 5a LDA $5afc ; (screen_col + 0)
3f27 : 18 __ __ CLC
3f28 : 69 ff __ ADC #$ff
3f2a : 8d fc 5a STA $5afc ; (screen_col + 0)
3f2d : b0 03 __ BCS $3f32 ; (cursormove.s1026 + 0)
.s1025:
3f2f : ce fd 5a DEC $5afd ; (screen_col + 1)
.s1026:
3f32 : ad fc 5a LDA $5afc ; (screen_col + 0)
3f35 : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
3f38 : ad fe 5a LDA $5afe ; (screen_row + 0)
3f3b : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
.s56:
3f3e : ad fc ab LDA $abfc ; (sstack + 6)
3f41 : c9 01 __ CMP #$01
3f43 : d0 23 __ BNE $3f68 ; (cursormove.s59 + 0)
.s12:
3f45 : ad fd 5a LDA $5afd ; (screen_col + 1)
3f48 : d0 0a __ BNE $3f54 ; (cursormove.s16 + 0)
.s1016:
3f4a : ad fc 5a LDA $5afc ; (screen_col + 0)
3f4d : c9 4f __ CMP #$4f
3f4f : d0 03 __ BNE $3f54 ; (cursormove.s16 + 0)
3f51 : 4c 7d 40 JMP $407d ; (cursormove.s15 + 0)
.s16:
3f54 : ee fc 5a INC $5afc ; (screen_col + 0)
3f57 : d0 03 __ BNE $3f5c ; (cursormove.s1024 + 0)
.s1023:
3f59 : ee fd 5a INC $5afd ; (screen_col + 1)
.s1024:
3f5c : ad fc 5a LDA $5afc ; (screen_col + 0)
3f5f : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
3f62 : ad fe 5a LDA $5afe ; (screen_row + 0)
3f65 : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
.s59:
3f68 : ad fd ab LDA $abfd ; (sstack + 7)
3f6b : c9 01 __ CMP #$01
3f6d : d0 43 __ BNE $3fb2 ; (cursormove.s62 + 0)
.s23:
3f6f : ad fe 5a LDA $5afe ; (screen_row + 0)
3f72 : 0d ff 5a ORA $5aff ; (screen_row + 1)
3f75 : d0 03 __ BNE $3f7a ; (cursormove.s27 + 0)
3f77 : 4c 5d 40 JMP $405d ; (cursormove.s26 + 0)
.s27:
3f7a : ad fe 5a LDA $5afe ; (screen_row + 0)
3f7d : 18 __ __ CLC
3f7e : 69 ff __ ADC #$ff
3f80 : 8d fe 5a STA $5afe ; (screen_row + 0)
3f83 : b0 03 __ BCS $3f88 ; (cursormove.s1022 + 0)
.s1021:
3f85 : ce ff 5a DEC $5aff ; (screen_row + 1)
.s1022:
3f88 : ad fe 5a LDA $5afe ; (screen_row + 0)
3f8b : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
3f8e : ad fc 5a LDA $5afc ; (screen_col + 0)
3f91 : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
3f94 : ad ff 5b LDA $5bff ; (showbar + 0)
3f97 : f0 19 __ BEQ $3fb2 ; (cursormove.s62 + 0)
.s37:
3f99 : ad dd 5b LDA $5bdd ; (vdc_state + 5)
3f9c : 38 __ __ SEC
3f9d : e9 02 __ SBC #$02
3f9f : a8 __ __ TAY
3fa0 : ad de 5b LDA $5bde ; (vdc_state + 6)
3fa3 : e9 00 __ SBC #$00
3fa5 : cd ff 5a CMP $5aff ; (screen_row + 1)
3fa8 : d0 08 __ BNE $3fb2 ; (cursormove.s62 + 0)
.s1010:
3faa : cc fe 5a CPY $5afe ; (screen_row + 0)
3fad : d0 03 __ BNE $3fb2 ; (cursormove.s62 + 0)
.s74:
3faf : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
.s62:
3fb2 : ad fe ab LDA $abfe ; (sstack + 8)
3fb5 : c9 01 __ CMP #$01
3fb7 : f0 03 __ BEQ $3fbc ; (cursormove.s38 + 0)
3fb9 : 4c 52 40 JMP $4052 ; (cursormove.s1001 + 0)
.s38:
3fbc : ad dd 5b LDA $5bdd ; (vdc_state + 5)
3fbf : 38 __ __ SEC
3fc0 : e9 01 __ SBC #$01
3fc2 : 85 53 __ STA T2 + 0 
3fc4 : ad de 5b LDA $5bde ; (vdc_state + 6)
3fc7 : e9 00 __ SBC #$00
3fc9 : 85 54 __ STA T2 + 1 
3fcb : ad dd 5b LDA $5bdd ; (vdc_state + 5)
3fce : 38 __ __ SEC
3fcf : e9 02 __ SBC #$02
3fd1 : 85 44 __ STA T1 + 0 
3fd3 : ad de 5b LDA $5bde ; (vdc_state + 6)
3fd6 : e9 00 __ SBC #$00
3fd8 : 85 45 __ STA T1 + 1 
3fda : ad fe 5a LDA $5afe ; (screen_row + 0)
3fdd : 85 55 __ STA T3 + 0 
3fdf : ad ff 5a LDA $5aff ; (screen_row + 1)
3fe2 : 85 56 __ STA T3 + 1 
3fe4 : c5 45 __ CMP T1 + 1 
3fe6 : d0 09 __ BNE $3ff1 ; (cursormove.s43 + 0)
.s1006:
3fe8 : a5 55 __ LDA T3 + 0 
3fea : c5 44 __ CMP T1 + 0 
3fec : d0 03 __ BNE $3ff1 ; (cursormove.s43 + 0)
.s41:
3fee : 20 ea 57 JSR $57ea ; (vdcwin_cpy_viewport@proxy + 0)
.s43:
3ff1 : a5 56 __ LDA T3 + 1 
3ff3 : c5 54 __ CMP T2 + 1 
3ff5 : d0 06 __ BNE $3ffd ; (cursormove.s46 + 0)
.s1004:
3ff7 : a5 55 __ LDA T3 + 0 
3ff9 : c5 53 __ CMP T2 + 0 
3ffb : f0 1e __ BEQ $401b ; (cursormove.s45 + 0)
.s46:
3ffd : 18 __ __ CLC
3ffe : a5 55 __ LDA T3 + 0 
4000 : 69 01 __ ADC #$01
4002 : 8d fe 5a STA $5afe ; (screen_row + 0)
4005 : a5 56 __ LDA T3 + 1 
4007 : 69 00 __ ADC #$00
4009 : 8d ff 5a STA $5aff ; (screen_row + 1)
400c : ad fe 5a LDA $5afe ; (screen_row + 0)
400f : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
4012 : ad fc 5a LDA $5afc ; (screen_col + 0)
4015 : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
4018 : 4c 52 40 JMP $4052 ; (cursormove.s1001 + 0)
.s45:
401b : 18 __ __ CLC
401c : 6d 02 5b ADC $5b02 ; (vdc_modes + 2)
401f : aa __ __ TAX
4020 : ad 03 5b LDA $5b03 ; (vdc_modes + 3)
4023 : 65 56 __ ADC T3 + 1 
4025 : a8 __ __ TAY
4026 : ad fe 5a LDA $5afe ; (screen_row + 0)
4029 : 38 __ __ SEC
402a : e9 01 __ SBC #$01
402c : 85 53 __ STA T2 + 0 
402e : ad ff 5a LDA $5aff ; (screen_row + 1)
4031 : e9 00 __ SBC #$00
4033 : 85 54 __ STA T2 + 1 
4035 : c4 54 __ CPY T2 + 1 
4037 : d0 02 __ BNE $403b ; (cursormove.s1003 + 0)
.s1002:
4039 : e4 53 __ CPX T2 + 0 
.s1003:
403b : b0 15 __ BCS $4052 ; (cursormove.s1001 + 0)
.s48:
403d : a5 55 __ LDA T3 + 0 
403f : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
4042 : a9 04 __ LDA #$04
4044 : 85 18 __ STA P11 
4046 : ad fc 5a LDA $5afc ; (screen_col + 0)
4049 : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
404c : 20 de 40 JSR $40de ; (vdcwin_viewportscroll.s0 + 0)
404f : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
.s1001:
4052 : a2 03 __ LDX #$03
4054 : bd cc ab LDA $abcc,x ; (buff + 36)
4057 : 95 53 __ STA T2 + 0,x 
4059 : ca __ __ DEX
405a : 10 f8 __ BPL $4054 ; (cursormove.s1001 + 2)
405c : 60 __ __ RTS
.s26:
405d : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
4060 : 0d 03 5b ORA $5b03 ; (vdc_modes + 3)
4063 : d0 03 __ BNE $4068 ; (cursormove.s29 + 0)
4065 : 4c b2 3f JMP $3fb2 ; (cursormove.s62 + 0)
.s29:
4068 : a9 00 __ LDA #$00
406a : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
406d : a9 08 __ LDA #$08
406f : 85 18 __ STA P11 
4071 : ad fc 5a LDA $5afc ; (screen_col + 0)
4074 : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
4077 : 20 de 40 JSR $40de ; (vdcwin_viewportscroll.s0 + 0)
407a : 4c af 3f JMP $3faf ; (cursormove.s74 + 0)
.s15:
407d : ad fc 5a LDA $5afc ; (screen_col + 0)
4080 : 38 __ __ SEC
4081 : e9 01 __ SBC #$01
4083 : 85 44 __ STA T1 + 0 
4085 : ad fd 5a LDA $5afd ; (screen_col + 1)
4088 : e9 00 __ SBC #$00
408a : 85 45 __ STA T1 + 1 
408c : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
408f : 18 __ __ CLC
4090 : 69 4f __ ADC #$4f
4092 : a8 __ __ TAY
4093 : ad 01 5b LDA $5b01 ; (vdc_modes + 1)
4096 : 69 00 __ ADC #$00
4098 : c5 45 __ CMP T1 + 1 
409a : d0 02 __ BNE $409e ; (cursormove.s1015 + 0)
.s1014:
409c : c4 44 __ CPY T1 + 0 
.s1015:
409e : 90 03 __ BCC $40a3 ; (cursormove.s18 + 0)
40a0 : 4c 68 3f JMP $3f68 ; (cursormove.s59 + 0)
.s18:
40a3 : a9 4f __ LDA #$4f
40a5 : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
40a8 : a9 02 __ LDA #$02
40aa : 85 18 __ STA P11 
40ac : ad fe 5a LDA $5afe ; (screen_row + 0)
40af : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
40b2 : 20 de 40 JSR $40de ; (vdcwin_viewportscroll.s0 + 0)
40b5 : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
40b8 : 4c 68 3f JMP $3f68 ; (cursormove.s59 + 0)
.s4:
40bb : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
40be : 0d 01 5b ORA $5b01 ; (vdc_modes + 1)
40c1 : d0 03 __ BNE $40c6 ; (cursormove.s7 + 0)
40c3 : 4c 3e 3f JMP $3f3e ; (cursormove.s56 + 0)
.s7:
40c6 : a9 00 __ LDA #$00
40c8 : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
40cb : a9 01 __ LDA #$01
40cd : 85 18 __ STA P11 
40cf : ad fe 5a LDA $5afe ; (screen_row + 0)
40d2 : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
40d5 : 20 de 40 JSR $40de ; (vdcwin_viewportscroll.s0 + 0)
40d8 : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
40db : 4c 3e 3f JMP $3f3e ; (cursormove.s56 + 0)
--------------------------------------------------------------------
vdcwin_viewportscroll: ; vdcwin_viewportscroll(struct VDCViewport*,u8)->void
.s0:
40de : a2 15 __ LDX #$15
.l1002:
40e0 : bd f8 5a LDA $5af8,x ; (krnio_pstatus + 15)
40e3 : 9d cf ab STA $abcf,x ; (buff + 39)
40e6 : ca __ __ DEX
40e7 : d0 f7 __ BNE $40e0 ; (vdcwin_viewportscroll.l1002 + 0)
.s1003:
40e9 : a5 18 __ LDA P11 ; (direction + 0)
40eb : 4a __ __ LSR
40ec : 90 33 __ BCC $4121 ; (vdcwin_viewportscroll.s14 + 0)
.s1:
40ee : a9 04 __ LDA #$04
40f0 : 85 16 __ STA P9 
40f2 : a9 5b __ LDA #$5b
40f4 : 85 17 __ STA P10 
40f6 : 20 47 43 JSR $4347 ; (vdcwin_scroll_right.s1000 + 0)
40f9 : a9 01 __ LDA #$01
40fb : 85 11 __ STA P4 
40fd : ad d7 ab LDA $abd7 ; (buff + 47)
4100 : 18 __ __ CLC
4101 : 69 ff __ ADC #$ff
4103 : 8d d7 ab STA $abd7 ; (buff + 47)
4106 : b0 03 __ BCS $410b ; (vdcwin_viewportscroll.s1005 + 0)
.s1004:
4108 : ce d8 ab DEC $abd8 ; (buff + 48)
.s1005:
410b : ad 00 5b LDA $5b00 ; (vdc_modes + 0)
410e : 18 __ __ CLC
410f : 69 ff __ ADC #$ff
4111 : 8d 00 5b STA $5b00 ; (vdc_modes + 0)
4114 : b0 03 __ BCS $4119 ; (vdcwin_viewportscroll.s1007 + 0)
.s1006:
4116 : ce 01 5b DEC $5b01 ; (vdc_modes + 1)
.s1007:
4119 : ad 07 5b LDA $5b07 ; (vdc_modes + 7)
411c : 85 12 __ STA P5 
411e : 20 3f 58 JSR $583f ; (vdcwin_init@proxy + 0)
.s14:
4121 : a5 18 __ LDA P11 ; (direction + 0)
4123 : 29 02 __ AND #$02
4125 : f0 47 __ BEQ $416e ; (vdcwin_viewportscroll.s15 + 0)
.s4:
4127 : a9 04 __ LDA #$04
4129 : 85 16 __ STA P9 
412b : a9 5b __ LDA #$5b
412d : 85 17 __ STA P10 
412f : 20 0e 45 JSR $450e ; (vdcwin_scroll_left.s0 + 0)
4132 : a9 01 __ LDA #$01
4134 : 85 11 __ STA P4 
4136 : ad d7 ab LDA $abd7 ; (buff + 47)
4139 : 18 __ __ CLC
413a : 6d 06 5b ADC $5b06 ; (vdc_modes + 6)
413d : 8d d7 ab STA $abd7 ; (buff + 47)
4140 : 90 03 __ BCC $4145 ; (vdcwin_viewportscroll.s1009 + 0)
.s1008:
4142 : ee d8 ab INC $abd8 ; (buff + 48)
.s1009:
4145 : ee 00 5b INC $5b00 ; (vdc_modes + 0)
4148 : d0 03 __ BNE $414d ; (vdcwin_viewportscroll.s1011 + 0)
.s1010:
414a : ee 01 5b INC $5b01 ; (vdc_modes + 1)
.s1011:
414d : a9 db __ LDA #$db
414f : 85 0d __ STA P0 
4151 : a9 ab __ LDA #$ab
4153 : 85 0e __ STA P1 
4155 : ad 04 5b LDA $5b04 ; (vdc_modes + 4)
4158 : 18 __ __ CLC
4159 : 6d 06 5b ADC $5b06 ; (vdc_modes + 6)
415c : 38 __ __ SEC
415d : e9 01 __ SBC #$01
415f : 85 0f __ STA P2 
4161 : ad 05 5b LDA $5b05 ; (vdc_modes + 5)
4164 : 85 10 __ STA P3 
4166 : ad 07 5b LDA $5b07 ; (vdc_modes + 7)
4169 : 85 12 __ STA P5 
416b : 20 64 2b JSR $2b64 ; (vdcwin_init.s0 + 0)
.s15:
416e : a5 18 __ LDA P11 ; (direction + 0)
4170 : 29 08 __ AND #$08
4172 : f0 33 __ BEQ $41a7 ; (vdcwin_viewportscroll.s16 + 0)
.s7:
4174 : a9 04 __ LDA #$04
4176 : 85 15 __ STA P8 
4178 : a9 5b __ LDA #$5b
417a : 85 16 __ STA P9 
417c : 20 00 46 JSR $4600 ; (vdcwin_scroll_down.s0 + 0)
417f : a9 01 __ LDA #$01
4181 : 85 12 __ STA P5 
4183 : ad d9 ab LDA $abd9 ; (buff + 49)
4186 : 18 __ __ CLC
4187 : 69 ff __ ADC #$ff
4189 : 8d d9 ab STA $abd9 ; (buff + 49)
418c : b0 03 __ BCS $4191 ; (vdcwin_viewportscroll.s1013 + 0)
.s1012:
418e : ce da ab DEC $abda ; (vp_fill + 10)
.s1013:
4191 : ad 02 5b LDA $5b02 ; (vdc_modes + 2)
4194 : 18 __ __ CLC
4195 : 69 ff __ ADC #$ff
4197 : 8d 02 5b STA $5b02 ; (vdc_modes + 2)
419a : b0 03 __ BCS $419f ; (vdcwin_viewportscroll.s1015 + 0)
.s1014:
419c : ce 03 5b DEC $5b03 ; (vdc_modes + 3)
.s1015:
419f : ad 06 5b LDA $5b06 ; (vdc_modes + 6)
41a2 : 85 11 __ STA P4 
41a4 : 20 3f 58 JSR $583f ; (vdcwin_init@proxy + 0)
.s16:
41a7 : a5 18 __ LDA P11 ; (direction + 0)
41a9 : 29 04 __ AND #$04
41ab : f0 47 __ BEQ $41f4 ; (vdcwin_viewportscroll.s12 + 0)
.s10:
41ad : a9 04 __ LDA #$04
41af : 85 15 __ STA P8 
41b1 : a9 5b __ LDA #$5b
41b3 : 85 16 __ STA P9 
41b5 : 20 a4 46 JSR $46a4 ; (vdcwin_scroll_up.s0 + 0)
41b8 : a9 01 __ LDA #$01
41ba : 85 12 __ STA P5 
41bc : ad d9 ab LDA $abd9 ; (buff + 49)
41bf : 18 __ __ CLC
41c0 : 6d 07 5b ADC $5b07 ; (vdc_modes + 7)
41c3 : 8d d9 ab STA $abd9 ; (buff + 49)
41c6 : 90 03 __ BCC $41cb ; (vdcwin_viewportscroll.s1017 + 0)
.s1016:
41c8 : ee da ab INC $abda ; (vp_fill + 10)
.s1017:
41cb : ee 02 5b INC $5b02 ; (vdc_modes + 2)
41ce : d0 03 __ BNE $41d3 ; (vdcwin_viewportscroll.s1019 + 0)
.s1018:
41d0 : ee 03 5b INC $5b03 ; (vdc_modes + 3)
.s1019:
41d3 : a9 db __ LDA #$db
41d5 : 85 0d __ STA P0 
41d7 : a9 ab __ LDA #$ab
41d9 : 85 0e __ STA P1 
41db : ad 04 5b LDA $5b04 ; (vdc_modes + 4)
41de : 85 0f __ STA P2 
41e0 : ad 05 5b LDA $5b05 ; (vdc_modes + 5)
41e3 : 18 __ __ CLC
41e4 : 6d 07 5b ADC $5b07 ; (vdc_modes + 7)
41e7 : 38 __ __ SEC
41e8 : e9 01 __ SBC #$01
41ea : 85 10 __ STA P3 
41ec : ad 06 5b LDA $5b06 ; (vdc_modes + 6)
41ef : 85 11 __ STA P4 
41f1 : 20 64 2b JSR $2b64 ; (vdcwin_init.s0 + 0)
.s12:
41f4 : a9 d0 __ LDA #$d0
41f6 : 85 16 __ STA P9 
41f8 : a9 ab __ LDA #$ab
41fa : 85 17 __ STA P10 
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
41fc : a5 16 __ LDA P9 ; (viewport + 0)
41fe : 85 44 __ STA T0 + 0 
4200 : a5 17 __ LDA P10 ; (viewport + 1)
4202 : 85 45 __ STA T0 + 1 
4204 : a0 09 __ LDY #$09
4206 : b1 16 __ LDA (P9),y ; (viewport + 0)
4208 : 85 1b __ STA ACCU + 0 
420a : c8 __ __ INY
420b : b1 16 __ LDA (P9),y ; (viewport + 0)
420d : 85 1c __ STA ACCU + 1 
420f : a0 03 __ LDY #$03
4211 : b1 16 __ LDA (P9),y ; (viewport + 0)
4213 : 85 03 __ STA WORK + 0 
4215 : c8 __ __ INY
4216 : b1 16 __ LDA (P9),y ; (viewport + 0)
4218 : 85 04 __ STA WORK + 1 
421a : 20 46 56 JSR $5646 ; (mul16 + 0)
421d : a0 01 __ LDY #$01
421f : b1 16 __ LDA (P9),y ; (viewport + 0)
4221 : 18 __ __ CLC
4222 : 65 05 __ ADC WORK + 2 
4224 : aa __ __ TAX
4225 : c8 __ __ INY
4226 : b1 16 __ LDA (P9),y ; (viewport + 0)
4228 : 65 06 __ ADC WORK + 3 
422a : 85 47 __ STA T1 + 1 
422c : 8a __ __ TXA
422d : 18 __ __ CLC
422e : a0 07 __ LDY #$07
4230 : 71 16 __ ADC (P9),y ; (viewport + 0)
4232 : 85 46 __ STA T1 + 0 
4234 : a5 47 __ LDA T1 + 1 
4236 : c8 __ __ INY
4237 : 71 16 __ ADC (P9),y ; (viewport + 0)
4239 : 85 47 __ STA T1 + 1 
423b : a9 00 __ LDA #$00
423d : 85 4a __ STA T3 + 0 
423f : a0 11 __ LDY #$11
4241 : b1 16 __ LDA (P9),y ; (viewport + 0)
4243 : aa __ __ TAX
4244 : c8 __ __ INY
4245 : b1 16 __ LDA (P9),y ; (viewport + 0)
4247 : 4c 83 42 JMP $4283 ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
424a : 86 0f __ STX P2 
424c : a5 46 __ LDA T1 + 0 
424e : 85 12 __ STA P5 
4250 : a5 47 __ LDA T1 + 1 
4252 : 85 13 __ STA P6 
4254 : a0 00 __ LDY #$00
4256 : 84 15 __ STY P8 
4258 : b1 44 __ LDA (T0 + 0),y 
425a : 85 11 __ STA P4 
425c : a0 0d __ LDY #$0d
425e : b1 44 __ LDA (T0 + 0),y 
4260 : 85 14 __ STA P7 
4262 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4265 : a5 46 __ LDA T1 + 0 
4267 : 18 __ __ CLC
4268 : a0 03 __ LDY #$03
426a : 71 44 __ ADC (T0 + 0),y 
426c : 85 46 __ STA T1 + 0 
426e : a5 47 __ LDA T1 + 1 
4270 : c8 __ __ INY
4271 : 71 44 __ ADC (T0 + 0),y 
4273 : 85 47 __ STA T1 + 1 
4275 : ad db 5b LDA $5bdb ; (vdc_state + 3)
4278 : 18 __ __ CLC
4279 : 65 0f __ ADC P2 
427b : aa __ __ TAX
427c : ad dc 5b LDA $5bdc ; (vdc_state + 4)
427f : 65 10 __ ADC P3 
4281 : e6 4a __ INC T3 + 0 
.l1:
4283 : 85 10 __ STA P3 
4285 : a5 4a __ LDA T3 + 0 
4287 : a0 0e __ LDY #$0e
4289 : d1 44 __ CMP (T0 + 0),y 
428b : 90 bd __ BCC $424a ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
428d : a0 03 __ LDY #$03
428f : b1 44 __ LDA (T0 + 0),y 
4291 : 85 46 __ STA T1 + 0 
4293 : 85 03 __ STA WORK + 0 
4295 : c8 __ __ INY
4296 : b1 44 __ LDA (T0 + 0),y 
4298 : 85 47 __ STA T1 + 1 
429a : 85 04 __ STA WORK + 1 
429c : a0 09 __ LDY #$09
429e : b1 44 __ LDA (T0 + 0),y 
42a0 : 85 1b __ STA ACCU + 0 
42a2 : c8 __ __ INY
42a3 : b1 44 __ LDA (T0 + 0),y 
42a5 : 85 1c __ STA ACCU + 1 
42a7 : 20 46 56 JSR $5646 ; (mul16 + 0)
42aa : a0 01 __ LDY #$01
42ac : b1 44 __ LDA (T0 + 0),y 
42ae : 18 __ __ CLC
42af : 65 05 __ ADC WORK + 2 
42b1 : aa __ __ TAX
42b2 : c8 __ __ INY
42b3 : b1 44 __ LDA (T0 + 0),y 
42b5 : 65 06 __ ADC WORK + 3 
42b7 : 85 49 __ STA T2 + 1 
42b9 : 8a __ __ TXA
42ba : 18 __ __ CLC
42bb : a0 07 __ LDY #$07
42bd : 71 44 __ ADC (T0 + 0),y 
42bf : 85 48 __ STA T2 + 0 
42c1 : a5 49 __ LDA T2 + 1 
42c3 : c8 __ __ INY
42c4 : 71 44 __ ADC (T0 + 0),y 
42c6 : 85 49 __ STA T2 + 1 
42c8 : a0 05 __ LDY #$05
42ca : b1 44 __ LDA (T0 + 0),y 
42cc : 85 1b __ STA ACCU + 0 
42ce : c8 __ __ INY
42cf : b1 44 __ LDA (T0 + 0),y 
42d1 : 85 1c __ STA ACCU + 1 
42d3 : a5 46 __ LDA T1 + 0 
42d5 : 85 03 __ STA WORK + 0 
42d7 : a5 47 __ LDA T1 + 1 
42d9 : 85 04 __ STA WORK + 1 
42db : 20 46 56 JSR $5646 ; (mul16 + 0)
42de : 18 __ __ CLC
42df : a5 48 __ LDA T2 + 0 
42e1 : 65 05 __ ADC WORK + 2 
42e3 : aa __ __ TAX
42e4 : a5 49 __ LDA T2 + 1 
42e6 : 65 06 __ ADC WORK + 3 
42e8 : a8 __ __ TAY
42e9 : 8a __ __ TXA
42ea : 18 __ __ CLC
42eb : 69 30 __ ADC #$30
42ed : 85 46 __ STA T1 + 0 
42ef : 90 01 __ BCC $42f2 ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
42f1 : c8 __ __ INY
.s1007:
42f2 : 84 47 __ STY T1 + 1 
42f4 : a9 00 __ LDA #$00
42f6 : 85 4a __ STA T3 + 0 
42f8 : a0 13 __ LDY #$13
42fa : b1 44 __ LDA (T0 + 0),y 
42fc : aa __ __ TAX
42fd : c8 __ __ INY
42fe : b1 44 __ LDA (T0 + 0),y 
4300 : 4c 3c 43 JMP $433c ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
4303 : 86 0f __ STX P2 
4305 : a5 46 __ LDA T1 + 0 
4307 : 85 12 __ STA P5 
4309 : a5 47 __ LDA T1 + 1 
430b : 85 13 __ STA P6 
430d : a0 00 __ LDY #$00
430f : 84 15 __ STY P8 
4311 : b1 16 __ LDA (P9),y ; (viewport + 0)
4313 : 85 11 __ STA P4 
4315 : a0 0d __ LDY #$0d
4317 : b1 16 __ LDA (P9),y ; (viewport + 0)
4319 : 85 14 __ STA P7 
431b : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
431e : a5 46 __ LDA T1 + 0 
4320 : 18 __ __ CLC
4321 : a0 03 __ LDY #$03
4323 : 71 16 __ ADC (P9),y ; (viewport + 0)
4325 : 85 46 __ STA T1 + 0 
4327 : a5 47 __ LDA T1 + 1 
4329 : c8 __ __ INY
432a : 71 16 __ ADC (P9),y ; (viewport + 0)
432c : 85 47 __ STA T1 + 1 
432e : ad db 5b LDA $5bdb ; (vdc_state + 3)
4331 : 18 __ __ CLC
4332 : 65 0f __ ADC P2 
4334 : aa __ __ TAX
4335 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
4338 : 65 10 __ ADC P3 
433a : e6 4a __ INC T3 + 0 
.l5:
433c : 85 10 __ STA P3 
433e : a5 4a __ LDA T3 + 0 
4340 : a0 0e __ LDY #$0e
4342 : d1 16 __ CMP (P9),y ; (viewport + 0)
4344 : 90 bd __ BCC $4303 ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
4346 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_right: ; vdcwin_scroll_right(struct VDCWin*,u8)->void
.s1000:
4347 : a5 53 __ LDA T8 + 0 
4349 : 8d f0 ab STA $abf0 ; (buffer + 10)
434c : a5 54 __ LDA T8 + 1 
434e : 8d f1 ab STA $abf1 ; (buffer + 11)
.s0:
4351 : a0 02 __ LDY #$02
4353 : b1 16 __ LDA (P9),y ; (win + 0)
4355 : 38 __ __ SEC
4356 : e9 01 __ SBC #$01
4358 : 85 47 __ STA T2 + 0 
435a : a9 00 __ LDA #$00
435c : 85 46 __ STA T1 + 0 
435e : a0 06 __ LDY #$06
4360 : b1 16 __ LDA (P9),y ; (win + 0)
4362 : 85 48 __ STA T3 + 0 
4364 : c8 __ __ INY
4365 : b1 16 __ LDA (P9),y ; (win + 0)
4367 : 85 49 __ STA T3 + 1 
4369 : c8 __ __ INY
436a : b1 16 __ LDA (P9),y ; (win + 0)
436c : 85 4a __ STA T4 + 0 
436e : c8 __ __ INY
436f : b1 16 __ LDA (P9),y ; (win + 0)
.l1:
4371 : 85 4b __ STA T4 + 1 
4373 : a5 46 __ LDA T1 + 0 
4375 : a0 03 __ LDY #$03
4377 : d1 16 __ CMP (P9),y ; (win + 0)
4379 : 90 0b __ BCC $4386 ; (vdcwin_scroll_right.s2 + 0)
.s1001:
437b : ad f0 ab LDA $abf0 ; (buffer + 10)
437e : 85 53 __ STA T8 + 0 
4380 : ad f1 ab LDA $abf1 ; (buffer + 11)
4383 : 85 54 __ STA T8 + 1 
4385 : 60 __ __ RTS
.s2:
4386 : a5 48 __ LDA T3 + 0 
4388 : 69 01 __ ADC #$01
438a : 85 4c __ STA T6 + 0 
438c : a5 49 __ LDA T3 + 1 
438e : 69 00 __ ADC #$00
4390 : 85 4d __ STA T6 + 1 
4392 : 18 __ __ CLC
4393 : a5 4a __ LDA T4 + 0 
4395 : 69 01 __ ADC #$01
4397 : 85 4e __ STA T7 + 0 
4399 : a5 4b __ LDA T4 + 1 
439b : 69 00 __ ADC #$00
439d : 85 4f __ STA T7 + 1 
439f : ad d9 5b LDA $5bd9 ; (vdc_state + 1)
43a2 : d0 0c __ BNE $43b0 ; (vdcwin_scroll_right.s7 + 0)
.s9:
43a4 : cc e5 5b CPY $5be5 ; (vdc_state + 13)
43a7 : d0 05 __ BNE $43ae ; (vdcwin_scroll_right.s1003 + 0)
.s1002:
43a9 : a9 ff __ LDA #$ff
43ab : cd e4 5b CMP $5be4 ; (vdc_state + 12)
.s1003:
43ae : 90 45 __ BCC $43f5 ; (vdcwin_scroll_right.s6 + 0)
.s7:
43b0 : a5 48 __ LDA T3 + 0 
43b2 : 85 11 __ STA P4 
43b4 : a5 49 __ LDA T3 + 1 
43b6 : 85 12 __ STA P5 
43b8 : ad e4 5b LDA $5be4 ; (vdc_state + 12)
43bb : 85 53 __ STA T8 + 0 
43bd : 85 0f __ STA P2 
43bf : ad e5 5b LDA $5be5 ; (vdc_state + 13)
43c2 : 85 54 __ STA T8 + 1 
43c4 : 85 10 __ STA P3 
43c6 : 20 42 44 JSR $4442 ; (vdc_block_copy@proxy + 0)
43c9 : a5 4c __ LDA T6 + 0 
43cb : 85 0f __ STA P2 
43cd : a5 4d __ LDA T6 + 1 
43cf : 85 10 __ STA P3 
43d1 : 20 00 58 JSR $5800 ; (vdc_block_copy@proxy + 0)
43d4 : a5 11 __ LDA P4 
43d6 : 85 0f __ STA P2 
43d8 : a5 54 __ LDA T8 + 1 
43da : 85 10 __ STA P3 
43dc : a5 4a __ LDA T4 + 0 
43de : 85 11 __ STA P4 
43e0 : a5 4b __ LDA T4 + 1 
43e2 : 85 12 __ STA P5 
43e4 : 20 4a 44 JSR $444a ; (vdc_block_copy.s0 + 0)
43e7 : a5 4e __ LDA T7 + 0 
43e9 : 85 0f __ STA P2 
43eb : a5 4f __ LDA T7 + 1 
43ed : 85 10 __ STA P3 
43ef : 20 00 58 JSR $5800 ; (vdc_block_copy@proxy + 0)
43f2 : 4c 21 44 JMP $4421 ; (vdcwin_scroll_right.s5 + 0)
.s6:
43f5 : a5 48 __ LDA T3 + 0 
43f7 : 85 10 __ STA P3 
43f9 : a5 49 __ LDA T3 + 1 
43fb : 85 11 __ STA P4 
43fd : 20 ef 13 JSR $13ef ; (bnk_cpyfromvdc@proxy + 0)
4400 : a5 4c __ LDA T6 + 0 
4402 : 85 0f __ STA P2 
4404 : a5 4d __ LDA T6 + 1 
4406 : 85 10 __ STA P3 
4408 : 20 94 13 JSR $1394 ; (bnk_cpytovdc@proxy + 0)
440b : a5 4a __ LDA T4 + 0 
440d : 85 10 __ STA P3 
440f : a5 4b __ LDA T4 + 1 
4411 : 85 11 __ STA P4 
4413 : 20 56 15 JSR $1556 ; (bnk_cpyfromvdc@proxy + 0)
4416 : a5 4e __ LDA T7 + 0 
4418 : 85 0f __ STA P2 
441a : a5 4f __ LDA T7 + 1 
441c : 85 10 __ STA P3 
441e : 20 43 15 JSR $1543 ; (bnk_cpytovdc@proxy + 0)
.s5:
4421 : ad db 5b LDA $5bdb ; (vdc_state + 3)
4424 : 18 __ __ CLC
4425 : 65 48 __ ADC T3 + 0 
4427 : 85 48 __ STA T3 + 0 
4429 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
442c : 65 49 __ ADC T3 + 1 
442e : 85 49 __ STA T3 + 1 
4430 : 18 __ __ CLC
4431 : a5 4a __ LDA T4 + 0 
4433 : 6d db 5b ADC $5bdb ; (vdc_state + 3)
4436 : 85 4a __ STA T4 + 0 
4438 : a5 4b __ LDA T4 + 1 
443a : 6d dc 5b ADC $5bdc ; (vdc_state + 4)
443d : e6 46 __ INC T1 + 0 
443f : 4c 71 43 JMP $4371 ; (vdcwin_scroll_right.l1 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
4442 : a5 47 __ LDA $47 
4444 : 85 13 __ STA P6 
4446 : a9 00 __ LDA #$00
4448 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
444a : a5 14 __ LDA P7 ; (length + 1)
444c : d0 52 __ BNE $44a0 ; (vdc_block_copy.s73 + 0)
.s4:
444e : 20 50 2e JSR $2e50 ; (vdc_mem_addr@proxy + 0)
4451 : a9 18 __ LDA #$18
4453 : 8d 00 d6 STA $d600 
.l332:
4456 : 2c 00 d6 BIT $d600 
4459 : 10 fb __ BPL $4456 ; (vdc_block_copy.l332 + 0)
.s40:
445b : ad 01 d6 LDA $d601 
445e : 09 80 __ ORA #$80
4460 : a2 18 __ LDX #$18
4462 : 8e 00 d6 STX $d600 
.l334:
4465 : 2c 00 d6 BIT $d600 
4468 : 10 fb __ BPL $4465 ; (vdc_block_copy.l334 + 0)
.s46:
446a : 8d 01 d6 STA $d601 
446d : a9 20 __ LDA #$20
446f : 8d 00 d6 STA $d600 
.l336:
4472 : 2c 00 d6 BIT $d600 
4475 : 10 fb __ BPL $4472 ; (vdc_block_copy.l336 + 0)
.s51:
4477 : a5 12 __ LDA P5 ; (src + 1)
4479 : 8d 01 d6 STA $d601 
447c : a9 21 __ LDA #$21
447e : 8d 00 d6 STA $d600 
.l338:
4481 : 2c 00 d6 BIT $d600 
4484 : 10 fb __ BPL $4481 ; (vdc_block_copy.l338 + 0)
.s56:
4486 : a5 11 __ LDA P4 ; (src + 0)
4488 : 8d 01 d6 STA $d601 
448b : a9 1f __ LDA #$1f
448d : 8d 00 d6 STA $d600 
4490 : a9 1e __ LDA #$1e
4492 : 8d 00 d6 STA $d600 
.l340:
4495 : 2c 00 d6 BIT $d600 
4498 : 10 fb __ BPL $4495 ; (vdc_block_copy.l340 + 0)
.s62:
449a : a5 13 __ LDA P6 ; (length + 0)
449c : 8d 01 d6 STA $d601 
.s1001:
449f : 60 __ __ RTS
.s73:
44a0 : 85 45 __ STA T2 + 0 
44a2 : a5 10 __ LDA P3 ; (dest + 1)
44a4 : 85 44 __ STA T0 + 1 
44a6 : a5 0f __ LDA P2 ; (dest + 0)
44a8 : 85 0d __ STA P0 
.l2:
44aa : 20 38 58 JSR $5838 ; (vdc_mem_addr@proxy + 0)
44ad : a9 18 __ LDA #$18
44af : 8d 00 d6 STA $d600 
.l321:
44b2 : 2c 00 d6 BIT $d600 
44b5 : 10 fb __ BPL $44b2 ; (vdc_block_copy.l321 + 0)
.s11:
44b7 : ad 01 d6 LDA $d601 
44ba : 09 80 __ ORA #$80
44bc : a2 18 __ LDX #$18
44be : 8e 00 d6 STX $d600 
.l323:
44c1 : 2c 00 d6 BIT $d600 
44c4 : 10 fb __ BPL $44c1 ; (vdc_block_copy.l323 + 0)
.s17:
44c6 : 8d 01 d6 STA $d601 
44c9 : a9 20 __ LDA #$20
44cb : 8d 00 d6 STA $d600 
.l325:
44ce : 2c 00 d6 BIT $d600 
44d1 : 10 fb __ BPL $44ce ; (vdc_block_copy.l325 + 0)
.s22:
44d3 : a5 12 __ LDA P5 ; (src + 1)
44d5 : 8d 01 d6 STA $d601 
44d8 : a9 21 __ LDA #$21
44da : 8d 00 d6 STA $d600 
.l327:
44dd : 2c 00 d6 BIT $d600 
44e0 : 10 fb __ BPL $44dd ; (vdc_block_copy.l327 + 0)
.s27:
44e2 : a5 11 __ LDA P4 ; (src + 0)
44e4 : 8d 01 d6 STA $d601 
44e7 : a9 1f __ LDA #$1f
44e9 : 8d 00 d6 STA $d600 
44ec : a9 1e __ LDA #$1e
44ee : 8d 00 d6 STA $d600 
.l329:
44f1 : 2c 00 d6 BIT $d600 
44f4 : 10 fb __ BPL $44f1 ; (vdc_block_copy.l329 + 0)
.s33:
44f6 : a9 ff __ LDA #$ff
44f8 : 8d 01 d6 STA $d601 
44fb : e6 12 __ INC P5 ; (src + 1)
44fd : e6 44 __ INC T0 + 1 
44ff : c6 45 __ DEC T2 + 0 
4501 : d0 a7 __ BNE $44aa ; (vdc_block_copy.l2 + 0)
.s145:
4503 : a5 0d __ LDA P0 
4505 : 85 0f __ STA P2 ; (dest + 0)
4507 : a5 44 __ LDA T0 + 1 
4509 : 85 10 __ STA P3 ; (dest + 1)
450b : 4c 4e 44 JMP $444e ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_left: ; vdcwin_scroll_left(struct VDCWin*,u8)->void
.s0:
450e : a0 02 __ LDY #$02
4510 : b1 16 __ LDA (P9),y ; (win + 0)
4512 : 38 __ __ SEC
4513 : e9 01 __ SBC #$01
4515 : 85 47 __ STA T2 + 0 
4517 : a0 06 __ LDY #$06
4519 : b1 16 __ LDA (P9),y ; (win + 0)
451b : 85 48 __ STA T3 + 0 
451d : c8 __ __ INY
451e : b1 16 __ LDA (P9),y ; (win + 0)
4520 : 85 49 __ STA T3 + 1 
4522 : c8 __ __ INY
4523 : b1 16 __ LDA (P9),y ; (win + 0)
4525 : 85 4a __ STA T4 + 0 
4527 : c8 __ __ INY
4528 : b1 16 __ LDA (P9),y ; (win + 0)
452a : 85 4b __ STA T4 + 1 
.l62:
452c : ad 00 d6 LDA $d600 
452f : 29 20 __ AND #$20
4531 : f0 f9 __ BEQ $452c ; (vdcwin_scroll_left.l62 + 0)
.s1:
4533 : a9 00 __ LDA #$00
4535 : 85 46 __ STA T1 + 0 
.l4:
4537 : a0 03 __ LDY #$03
4539 : d1 16 __ CMP (P9),y ; (win + 0)
453b : 90 08 __ BCC $4545 ; (vdcwin_scroll_left.s5 + 0)
.l14:
453d : ad 00 d6 LDA $d600 
4540 : 29 20 __ AND #$20
4542 : d0 f9 __ BNE $453d ; (vdcwin_scroll_left.l14 + 0)
.s1001:
4544 : 60 __ __ RTS
.s5:
4545 : a5 48 __ LDA T3 + 0 
4547 : 69 01 __ ADC #$01
4549 : aa __ __ TAX
454a : a5 49 __ LDA T3 + 1 
454c : 69 00 __ ADC #$00
454e : 85 4d __ STA T5 + 1 
4550 : 18 __ __ CLC
4551 : a5 4a __ LDA T4 + 0 
4553 : 69 01 __ ADC #$01
4555 : 85 4e __ STA T7 + 0 
4557 : a5 4b __ LDA T4 + 1 
4559 : 69 00 __ ADC #$00
455b : 85 4f __ STA T7 + 1 
455d : ad d9 5b LDA $5bd9 ; (vdc_state + 1)
4560 : d0 0c __ BNE $456e ; (vdcwin_scroll_left.s10 + 0)
.s12:
4562 : cc e5 5b CPY $5be5 ; (vdc_state + 13)
4565 : d0 05 __ BNE $456c ; (vdcwin_scroll_left.s1003 + 0)
.s1002:
4567 : a9 ff __ LDA #$ff
4569 : cd e4 5b CMP $5be4 ; (vdc_state + 12)
.s1003:
456c : 90 43 __ BCC $45b1 ; (vdcwin_scroll_left.s9 + 0)
.s10:
456e : 86 11 __ STX P4 
4570 : a5 4d __ LDA T5 + 1 
4572 : 85 12 __ STA P5 
4574 : ad e4 5b LDA $5be4 ; (vdc_state + 12)
4577 : 85 4c __ STA T5 + 0 
4579 : 85 0f __ STA P2 
457b : ad e5 5b LDA $5be5 ; (vdc_state + 13)
457e : 85 4d __ STA T5 + 1 
4580 : 85 10 __ STA P3 
4582 : 20 42 44 JSR $4442 ; (vdc_block_copy@proxy + 0)
4585 : a5 48 __ LDA T3 + 0 
4587 : 85 0f __ STA P2 
4589 : a5 49 __ LDA T3 + 1 
458b : 85 10 __ STA P3 
458d : 20 f5 57 JSR $57f5 ; (vdc_block_copy@proxy + 0)
4590 : a5 11 __ LDA P4 
4592 : 85 0f __ STA P2 
4594 : a5 4d __ LDA T5 + 1 
4596 : 85 10 __ STA P3 
4598 : a5 4e __ LDA T7 + 0 
459a : 85 11 __ STA P4 
459c : a5 4f __ LDA T7 + 1 
459e : 85 12 __ STA P5 
45a0 : 20 4a 44 JSR $444a ; (vdc_block_copy.s0 + 0)
45a3 : a5 4a __ LDA T4 + 0 
45a5 : 85 0f __ STA P2 
45a7 : a5 4b __ LDA T4 + 1 
45a9 : 85 10 __ STA P3 
45ab : 20 f5 57 JSR $57f5 ; (vdc_block_copy@proxy + 0)
45ae : 4c db 45 JMP $45db ; (vdcwin_scroll_left.s8 + 0)
.s9:
45b1 : 86 10 __ STX P3 
45b3 : a5 4d __ LDA T5 + 1 
45b5 : 85 11 __ STA P4 
45b7 : 20 ef 13 JSR $13ef ; (bnk_cpyfromvdc@proxy + 0)
45ba : a5 48 __ LDA T3 + 0 
45bc : 85 0f __ STA P2 
45be : a5 49 __ LDA T3 + 1 
45c0 : 85 10 __ STA P3 
45c2 : 20 94 13 JSR $1394 ; (bnk_cpytovdc@proxy + 0)
45c5 : a5 4e __ LDA T7 + 0 
45c7 : 85 10 __ STA P3 
45c9 : a5 4f __ LDA T7 + 1 
45cb : 85 11 __ STA P4 
45cd : 20 56 15 JSR $1556 ; (bnk_cpyfromvdc@proxy + 0)
45d0 : a5 4a __ LDA T4 + 0 
45d2 : 85 0f __ STA P2 
45d4 : a5 4b __ LDA T4 + 1 
45d6 : 85 10 __ STA P3 
45d8 : 20 43 15 JSR $1543 ; (bnk_cpytovdc@proxy + 0)
.s8:
45db : ad db 5b LDA $5bdb ; (vdc_state + 3)
45de : 18 __ __ CLC
45df : 65 48 __ ADC T3 + 0 
45e1 : 85 48 __ STA T3 + 0 
45e3 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
45e6 : 65 49 __ ADC T3 + 1 
45e8 : 85 49 __ STA T3 + 1 
45ea : 18 __ __ CLC
45eb : a5 4a __ LDA T4 + 0 
45ed : 6d db 5b ADC $5bdb ; (vdc_state + 3)
45f0 : 85 4a __ STA T4 + 0 
45f2 : a5 4b __ LDA T4 + 1 
45f4 : 6d dc 5b ADC $5bdc ; (vdc_state + 4)
45f7 : 85 4b __ STA T4 + 1 
45f9 : e6 46 __ INC T1 + 0 
45fb : a5 46 __ LDA T1 + 0 
45fd : 4c 37 45 JMP $4537 ; (vdcwin_scroll_left.l4 + 0)
--------------------------------------------------------------------
vdcwin_scroll_down: ; vdcwin_scroll_down(struct VDCWin*,u8)->void
.s0:
4600 : ad db 5b LDA $5bdb ; (vdc_state + 3)
4603 : 85 49 __ STA T3 + 0 
4605 : 85 1b __ STA ACCU + 0 
4607 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
460a : 85 4a __ STA T3 + 1 
460c : 85 1c __ STA ACCU + 1 
460e : a0 03 __ LDY #$03
4610 : b1 15 __ LDA (P8),y ; (win + 0)
4612 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4615 : a0 06 __ LDY #$06
4617 : b1 15 __ LDA (P8),y ; (win + 0)
4619 : 18 __ __ CLC
461a : 65 05 __ ADC WORK + 2 
461c : 85 4b __ STA T4 + 0 
461e : c8 __ __ INY
461f : b1 15 __ LDA (P8),y ; (win + 0)
4621 : 65 06 __ ADC WORK + 3 
4623 : 85 4c __ STA T4 + 1 
4625 : c8 __ __ INY
4626 : b1 15 __ LDA (P8),y ; (win + 0)
4628 : 18 __ __ CLC
4629 : 65 05 __ ADC WORK + 2 
462b : 85 47 __ STA T2 + 0 
462d : c8 __ __ INY
462e : b1 15 __ LDA (P8),y ; (win + 0)
4630 : 65 06 __ ADC WORK + 3 
4632 : 85 48 __ STA T2 + 1 
4634 : a0 02 __ LDY #$02
4636 : b1 15 __ LDA (P8),y ; (win + 0)
4638 : 85 4f __ STA T6 + 0 
463a : a9 00 __ LDA #$00
463c : 85 46 __ STA T1 + 0 
463e : 85 14 __ STA P7 
4640 : f0 52 __ BEQ $4694 ; (vdcwin_scroll_down.l1 + 0)
.s2:
4642 : ad db 5b LDA $5bdb ; (vdc_state + 3)
4645 : 85 4d __ STA T5 + 0 
4647 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
464a : 85 4e __ STA T5 + 1 
464c : 38 __ __ SEC
464d : a5 4b __ LDA T4 + 0 
464f : e5 4d __ SBC T5 + 0 
4651 : 85 0f __ STA P2 
4653 : 85 4b __ STA T4 + 0 
4655 : a5 4c __ LDA T4 + 1 
4657 : e5 4e __ SBC T5 + 1 
4659 : 85 10 __ STA P3 
465b : 85 4c __ STA T4 + 1 
465d : 38 __ __ SEC
465e : a5 0f __ LDA P2 
4660 : e5 49 __ SBC T3 + 0 
4662 : 85 11 __ STA P4 
4664 : a5 10 __ LDA P3 
4666 : e5 4a __ SBC T3 + 1 
4668 : 85 12 __ STA P5 
466a : a5 4f __ LDA T6 + 0 
466c : 85 13 __ STA P6 
466e : 20 4a 44 JSR $444a ; (vdc_block_copy.s0 + 0)
4671 : 38 __ __ SEC
4672 : a5 47 __ LDA T2 + 0 
4674 : e5 4d __ SBC T5 + 0 
4676 : 85 47 __ STA T2 + 0 
4678 : 85 0f __ STA P2 
467a : a5 48 __ LDA T2 + 1 
467c : e5 4e __ SBC T5 + 1 
467e : 85 48 __ STA T2 + 1 
4680 : 85 10 __ STA P3 
4682 : 38 __ __ SEC
4683 : a5 0f __ LDA P2 
4685 : e5 49 __ SBC T3 + 0 
4687 : 85 11 __ STA P4 
4689 : a5 10 __ LDA P3 
468b : e5 4a __ SBC T3 + 1 
468d : 85 12 __ STA P5 
468f : 20 4a 44 JSR $444a ; (vdc_block_copy.s0 + 0)
4692 : e6 46 __ INC T1 + 0 
.l1:
4694 : a0 03 __ LDY #$03
4696 : b1 15 __ LDA (P8),y ; (win + 0)
4698 : 38 __ __ SEC
4699 : e9 01 __ SBC #$01
469b : 90 a5 __ BCC $4642 ; (vdcwin_scroll_down.s2 + 0)
.s1002:
469d : c5 46 __ CMP T1 + 0 
469f : 90 02 __ BCC $46a3 ; (vdcwin_scroll_down.s1001 + 0)
.s1004:
46a1 : d0 9f __ BNE $4642 ; (vdcwin_scroll_down.s2 + 0)
.s1001:
46a3 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
46a4 : a0 02 __ LDY #$02
46a6 : b1 15 __ LDA (P8),y ; (win + 0)
46a8 : 85 47 __ STA T2 + 0 
46aa : a0 06 __ LDY #$06
46ac : b1 15 __ LDA (P8),y ; (win + 0)
46ae : 85 48 __ STA T3 + 0 
46b0 : c8 __ __ INY
46b1 : b1 15 __ LDA (P8),y ; (win + 0)
46b3 : 85 49 __ STA T3 + 1 
46b5 : c8 __ __ INY
46b6 : b1 15 __ LDA (P8),y ; (win + 0)
46b8 : 85 4a __ STA T4 + 0 
46ba : c8 __ __ INY
46bb : b1 15 __ LDA (P8),y ; (win + 0)
46bd : 85 4b __ STA T4 + 1 
46bf : ad db 5b LDA $5bdb ; (vdc_state + 3)
46c2 : 85 4c __ STA T5 + 0 
46c4 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
46c7 : 85 4d __ STA T5 + 1 
46c9 : a9 00 __ LDA #$00
46cb : 85 46 __ STA T0 + 0 
46cd : 85 14 __ STA P7 
46cf : f0 4c __ BEQ $471d ; (vdcwin_scroll_up.l1 + 0)
.s2:
46d1 : a5 48 __ LDA T3 + 0 
46d3 : 85 0f __ STA P2 
46d5 : 18 __ __ CLC
46d6 : 65 4c __ ADC T5 + 0 
46d8 : 85 11 __ STA P4 
46da : a5 49 __ LDA T3 + 1 
46dc : 85 10 __ STA P3 
46de : 65 4d __ ADC T5 + 1 
46e0 : 85 12 __ STA P5 
46e2 : a5 47 __ LDA T2 + 0 
46e4 : 85 13 __ STA P6 
46e6 : 20 4a 44 JSR $444a ; (vdc_block_copy.s0 + 0)
46e9 : a5 4a __ LDA T4 + 0 
46eb : 85 0f __ STA P2 
46ed : 18 __ __ CLC
46ee : 65 4c __ ADC T5 + 0 
46f0 : 85 11 __ STA P4 
46f2 : a5 4b __ LDA T4 + 1 
46f4 : 85 10 __ STA P3 
46f6 : 65 4d __ ADC T5 + 1 
46f8 : 85 12 __ STA P5 
46fa : 20 4a 44 JSR $444a ; (vdc_block_copy.s0 + 0)
46fd : ad db 5b LDA $5bdb ; (vdc_state + 3)
4700 : 18 __ __ CLC
4701 : 65 48 __ ADC T3 + 0 
4703 : 85 48 __ STA T3 + 0 
4705 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
4708 : 65 49 __ ADC T3 + 1 
470a : 85 49 __ STA T3 + 1 
470c : 18 __ __ CLC
470d : a5 4a __ LDA T4 + 0 
470f : 6d db 5b ADC $5bdb ; (vdc_state + 3)
4712 : 85 4a __ STA T4 + 0 
4714 : a5 4b __ LDA T4 + 1 
4716 : 6d dc 5b ADC $5bdc ; (vdc_state + 4)
4719 : 85 4b __ STA T4 + 1 
471b : e6 46 __ INC T0 + 0 
.l1:
471d : a0 03 __ LDY #$03
471f : b1 15 __ LDA (P8),y ; (win + 0)
4721 : 38 __ __ SEC
4722 : e9 01 __ SBC #$01
4724 : 90 ab __ BCC $46d1 ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4726 : c5 46 __ CMP T0 + 0 
4728 : 90 02 __ BCC $472c ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
472a : d0 a5 __ BNE $46d1 ; (vdcwin_scroll_up.s2 + 0)
.s1001:
472c : 60 __ __ RTS
--------------------------------------------------------------------
undo_performundo: ; undo_performundo()->void
.s1000:
472d : a2 15 __ LDX #$15
472f : b5 53 __ LDA T0 + 0,x 
4731 : 9d b8 ab STA $abb8,x ; (buff + 16)
4734 : ca __ __ DEX
4735 : 10 f8 __ BPL $472f ; (undo_performundo.s1000 + 2)
.s0:
4737 : ad fd 5b LDA $5bfd ; (undo_undopossible + 0)
473a : d0 0b __ BNE $4747 ; (undo_performundo.s1 + 0)
.s1001:
473c : a2 15 __ LDX #$15
473e : bd b8 ab LDA $abb8,x ; (buff + 16)
4741 : 95 53 __ STA T0 + 0,x 
4743 : ca __ __ DEX
4744 : 10 f8 __ BPL $473e ; (undo_performundo.s1001 + 2)
4746 : 60 __ __ RTS
.s1:
4747 : ad fc 5b LDA $5bfc ; (undonumber + 0)
474a : 0a __ __ ASL
474b : 0a __ __ ASL
474c : 0a __ __ ASL
474d : a2 00 __ LDX #$00
474f : 90 01 __ BCC $4752 ; (undo_performundo.s1005 + 0)
.s1004:
4751 : e8 __ __ INX
.s1005:
4752 : 38 __ __ SEC
4753 : ed fc 5b SBC $5bfc ; (undonumber + 0)
4756 : b0 01 __ BCS $4759 ; (undo_performundo.s1007 + 0)
.s1006:
4758 : ca __ __ DEX
.s1007:
4759 : 18 __ __ CLC
475a : 69 9b __ ADC #$9b
475c : 85 54 __ STA T1 + 0 
475e : 8a __ __ TXA
475f : 69 5d __ ADC #$5d
4761 : 85 55 __ STA T1 + 1 
4763 : a0 04 __ LDY #$04
4765 : b1 54 __ LDA (T1 + 0),y 
4767 : f0 2c __ BEQ $4795 ; (undo_performundo.s7 + 0)
.s39:
4769 : 85 53 __ STA T0 + 0 
476b : 85 1b __ STA ACCU + 0 
476d : c8 __ __ INY
476e : b1 54 __ LDA (T1 + 0),y 
4770 : 85 56 __ STA T2 + 0 
4772 : 85 57 __ STA T3 + 0 
4774 : a9 00 __ LDA #$00
4776 : 85 5a __ STA T5 + 0 
4778 : 85 1c __ STA ACCU + 1 
477a : a5 56 __ LDA T2 + 0 
477c : 20 26 56 JSR $5626 ; (mul16by8 + 0)
477f : a5 05 __ LDA WORK + 2 
4781 : 85 58 __ STA T4 + 0 
4783 : a5 06 __ LDA WORK + 3 
4785 : 85 59 __ STA T4 + 1 
4787 : a0 03 __ LDY #$03
4789 : b1 54 __ LDA (T1 + 0),y 
478b : 85 5b __ STA T6 + 0 
478d : 88 __ __ DEY
478e : b1 54 __ LDA (T1 + 0),y 
4790 : 85 5c __ STA T7 + 0 
4792 : 4c 32 48 JMP $4832 ; (undo_performundo.l5 + 0)
.s7:
4795 : 20 ea 57 JSR $57ea ; (vdcwin_cpy_viewport@proxy + 0)
4798 : ad ff 5b LDA $5bff ; (showbar + 0)
479b : f0 03 __ BEQ $47a0 ; (undo_performundo.s21 + 0)
.s19:
479d : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
.s21:
47a0 : ad fc 5b LDA $5bfc ; (undonumber + 0)
47a3 : 85 53 __ STA T0 + 0 
47a5 : 0a __ __ ASL
47a6 : 0a __ __ ASL
47a7 : 0a __ __ ASL
47a8 : a2 00 __ LDX #$00
47aa : 90 01 __ BCC $47ad ; (undo_performundo.s1013 + 0)
.s1012:
47ac : e8 __ __ INX
.s1013:
47ad : 38 __ __ SEC
47ae : e5 53 __ SBC T0 + 0 
47b0 : b0 01 __ BCS $47b3 ; (undo_performundo.s1015 + 0)
.s1014:
47b2 : ca __ __ DEX
.s1015:
47b3 : 18 __ __ CLC
47b4 : 69 9b __ ADC #$9b
47b6 : 85 54 __ STA T1 + 0 
47b8 : 8a __ __ TXA
47b9 : 69 5d __ ADC #$5d
47bb : 85 55 __ STA T1 + 1 
47bd : a0 00 __ LDY #$00
47bf : b1 54 __ LDA (T1 + 0),y 
47c1 : 8d fa 5b STA $5bfa ; (undoaddress + 0)
47c4 : c8 __ __ INY
47c5 : b1 54 __ LDA (T1 + 0),y 
47c7 : 8d fb 5b STA $5bfb ; (undoaddress + 1)
47ca : c6 53 __ DEC T0 + 0 
47cc : a5 53 __ LDA T0 + 0 
47ce : 8d fc 5b STA $5bfc ; (undonumber + 0)
47d1 : a0 06 __ LDY #$06
47d3 : b1 54 __ LDA (T1 + 0),y 
47d5 : f0 07 __ BEQ $47de ; (undo_performundo.s24 + 0)
.s22:
47d7 : a9 02 __ LDA #$02
47d9 : 91 54 __ STA (T1 + 0),y 
47db : ee fe 5b INC $5bfe ; (undo_redopossible + 0)
.s24:
47de : ce fd 5b DEC $5bfd ; (undo_undopossible + 0)
47e1 : a5 53 __ LDA T0 + 0 
47e3 : d0 0d __ BNE $47f2 ; (undo_performundo.s27 + 0)
.s25:
47e5 : ad b3 5e LDA $5eb3 ; (Undo + 273)
47e8 : 0d b4 5e ORA $5eb4 ; (Undo + 274)
47eb : f0 05 __ BEQ $47f2 ; (undo_performundo.s27 + 0)
.s28:
47ed : a9 28 __ LDA #$28
47ef : 8d fc 5b STA $5bfc ; (undonumber + 0)
.s27:
47f2 : ad fc 5b LDA $5bfc ; (undonumber + 0)
47f5 : f0 2a __ BEQ $4821 ; (undo_performundo.s38 + 0)
.s34:
47f7 : 0a __ __ ASL
47f8 : 0a __ __ ASL
47f9 : 0a __ __ ASL
47fa : a2 00 __ LDX #$00
47fc : 90 01 __ BCC $47ff ; (undo_performundo.s1017 + 0)
.s1016:
47fe : e8 __ __ INX
.s1017:
47ff : 38 __ __ SEC
4800 : ed fc 5b SBC $5bfc ; (undonumber + 0)
4803 : b0 01 __ BCS $4806 ; (undo_performundo.s1019 + 0)
.s1018:
4805 : ca __ __ DEX
.s1019:
4806 : 18 __ __ CLC
4807 : 69 9b __ ADC #$9b
4809 : 85 54 __ STA T1 + 0 
480b : 8a __ __ TXA
480c : 69 5d __ ADC #$5d
480e : 85 55 __ STA T1 + 1 
4810 : a0 00 __ LDY #$00
4812 : b1 54 __ LDA (T1 + 0),y 
4814 : c8 __ __ INY
4815 : 11 54 __ ORA (T1 + 0),y 
4817 : f0 13 __ BEQ $482c ; (undo_performundo.s31 + 0)
.s33:
4819 : ad fc 5b LDA $5bfc ; (undonumber + 0)
481c : f0 03 __ BEQ $4821 ; (undo_performundo.s38 + 0)
481e : 4c 3c 47 JMP $473c ; (undo_performundo.s1001 + 0)
.s38:
4821 : ad b3 5e LDA $5eb3 ; (Undo + 273)
4824 : 0d b4 5e ORA $5eb4 ; (Undo + 274)
4827 : f0 03 __ BEQ $482c ; (undo_performundo.s31 + 0)
4829 : 4c 3c 47 JMP $473c ; (undo_performundo.s1001 + 0)
.s31:
482c : 8d fd 5b STA $5bfd ; (undo_undopossible + 0)
482f : 4c 3c 47 JMP $473c ; (undo_performundo.s1001 + 0)
.l5:
4832 : a0 06 __ LDY #$06
4834 : b1 54 __ LDA (T1 + 0),y 
4836 : f0 03 __ BEQ $483b ; (undo_performundo.s10 + 0)
4838 : 4c 10 49 JMP $4910 ; (undo_performundo.s8 + 0)
.s10:
483b : a9 7f __ LDA #$7f
483d : 85 0d __ STA P0 
483f : 18 __ __ CLC
4840 : a5 5a __ LDA T5 + 0 
4842 : 65 5c __ ADC T7 + 0 
4844 : 85 5f __ STA T10 + 0 
4846 : 85 03 __ STA WORK + 0 
4848 : a9 00 __ LDA #$00
484a : 85 13 __ STA P6 
484c : 2a __ __ ROL
484d : 85 60 __ STA T10 + 1 
484f : 85 04 __ STA WORK + 1 
4851 : ad fc 5a LDA $5afc ; (screen_col + 0)
4854 : 85 1b __ STA ACCU + 0 
4856 : ad fd 5a LDA $5afd ; (screen_col + 1)
4859 : 85 1c __ STA ACCU + 1 
485b : 20 46 56 JSR $5646 ; (mul16 + 0)
485e : 18 __ __ CLC
485f : a5 05 __ LDA WORK + 2 
4861 : 65 5b __ ADC T6 + 0 
4863 : 85 0e __ STA P1 
4865 : a5 06 __ LDA WORK + 3 
4867 : 69 58 __ ADC #$58
4869 : 85 0f __ STA P2 
486b : a5 5a __ LDA T5 + 0 
486d : 85 1b __ STA ACCU + 0 
486f : a9 00 __ LDA #$00
4871 : 85 1c __ STA ACCU + 1 
4873 : a5 57 __ LDA T3 + 0 
4875 : 85 12 __ STA P5 
4877 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
487a : a5 05 __ LDA WORK + 2 
487c : 85 5d __ STA T8 + 0 
487e : a5 06 __ LDA WORK + 3 
4880 : 85 5e __ STA T8 + 1 
4882 : 18 __ __ CLC
4883 : a0 00 __ LDY #$00
4885 : b1 54 __ LDA (T1 + 0),y 
4887 : 65 05 __ ADC WORK + 2 
4889 : 85 10 __ STA P3 
488b : c8 __ __ INY
488c : b1 54 __ LDA (T1 + 0),y 
488e : 65 06 __ ADC WORK + 3 
4890 : 85 11 __ STA P4 
4892 : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
4895 : ad fc 5a LDA $5afc ; (screen_col + 0)
4898 : 85 1b __ STA ACCU + 0 
489a : ad fd 5a LDA $5afd ; (screen_col + 1)
489d : 85 1c __ STA ACCU + 1 
489f : a5 5f __ LDA T10 + 0 
48a1 : 85 03 __ STA WORK + 0 
48a3 : a5 60 __ LDA T10 + 1 
48a5 : 85 04 __ STA WORK + 1 
48a7 : 20 46 56 JSR $5646 ; (mul16 + 0)
48aa : 18 __ __ CLC
48ab : a5 05 __ LDA WORK + 2 
48ad : 65 5b __ ADC T6 + 0 
48af : 85 5f __ STA T10 + 0 
48b1 : a5 06 __ LDA WORK + 3 
48b3 : 69 58 __ ADC #$58
48b5 : 85 60 __ STA T10 + 1 
48b7 : ad fe 5a LDA $5afe ; (screen_row + 0)
48ba : 85 1b __ STA ACCU + 0 
48bc : ad ff 5a LDA $5aff ; (screen_row + 1)
48bf : 85 1c __ STA ACCU + 1 
48c1 : ad fc 5a LDA $5afc ; (screen_col + 0)
48c4 : 85 03 __ STA WORK + 0 
48c6 : ad fd 5a LDA $5afd ; (screen_col + 1)
48c9 : 85 04 __ STA WORK + 1 
48cb : 20 46 56 JSR $5646 ; (mul16 + 0)
48ce : 18 __ __ CLC
48cf : a5 05 __ LDA WORK + 2 
48d1 : 65 5f __ ADC T10 + 0 
48d3 : aa __ __ TAX
48d4 : a5 06 __ LDA WORK + 3 
48d6 : 65 60 __ ADC T10 + 1 
48d8 : a8 __ __ TAY
48d9 : 8a __ __ TXA
48da : 18 __ __ CLC
48db : 69 30 __ ADC #$30
48dd : 85 0e __ STA P1 
48df : 90 01 __ BCC $48e2 ; (undo_performundo.s1011 + 0)
.s1010:
48e1 : c8 __ __ INY
.s1011:
48e2 : 84 0f __ STY P2 
48e4 : a0 00 __ LDY #$00
48e6 : 84 13 __ STY P6 
48e8 : b1 54 __ LDA (T1 + 0),y 
48ea : 18 __ __ CLC
48eb : 65 58 __ ADC T4 + 0 
48ed : aa __ __ TAX
48ee : c8 __ __ INY
48ef : b1 54 __ LDA (T1 + 0),y 
48f1 : 65 59 __ ADC T4 + 1 
48f3 : a8 __ __ TAY
48f4 : 8a __ __ TXA
48f5 : 18 __ __ CLC
48f6 : 65 5d __ ADC T8 + 0 
48f8 : 85 10 __ STA P3 
48fa : 98 __ __ TYA
48fb : 65 5e __ ADC T8 + 1 
48fd : 85 11 __ STA P4 
48ff : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
4902 : e6 5a __ INC T5 + 0 
4904 : a5 5a __ LDA T5 + 0 
4906 : c5 53 __ CMP T0 + 0 
4908 : b0 03 __ BCS $490d ; (undo_performundo.s1011 + 43)
490a : 4c 32 48 JMP $4832 ; (undo_performundo.l5 + 0)
490d : 4c 95 47 JMP $4795 ; (undo_performundo.s7 + 0)
.s8:
4910 : a9 7f __ LDA #$7f
4912 : 85 11 __ STA P4 
4914 : 18 __ __ CLC
4915 : a5 5c __ LDA T7 + 0 
4917 : 65 5a __ ADC T5 + 0 
4919 : 85 03 __ STA WORK + 0 
491b : a9 00 __ LDA #$00
491d : 2a __ __ ROL
491e : 85 04 __ STA WORK + 1 
4920 : ad fc 5a LDA $5afc ; (screen_col + 0)
4923 : 85 61 __ STA T11 + 0 
4925 : 85 1b __ STA ACCU + 0 
4927 : ad fd 5a LDA $5afd ; (screen_col + 1)
492a : 85 62 __ STA T11 + 1 
492c : 85 1c __ STA ACCU + 1 
492e : 20 46 56 JSR $5646 ; (mul16 + 0)
4931 : 18 __ __ CLC
4932 : a5 05 __ LDA WORK + 2 
4934 : 65 5b __ ADC T6 + 0 
4936 : 85 5f __ STA T10 + 0 
4938 : 85 12 __ STA P5 
493a : a5 06 __ LDA WORK + 3 
493c : 69 58 __ ADC #$58
493e : 85 60 __ STA T10 + 1 
4940 : 85 13 __ STA P6 
4942 : a9 00 __ LDA #$00
4944 : 85 15 __ STA P8 
4946 : 85 1c __ STA ACCU + 1 
4948 : a5 53 __ LDA T0 + 0 
494a : 85 1b __ STA ACCU + 0 
494c : a5 56 __ LDA T2 + 0 
494e : 85 14 __ STA P7 
4950 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4953 : a5 05 __ LDA WORK + 2 
4955 : 85 63 __ STA T13 + 0 
4957 : 0a __ __ ASL
4958 : 85 44 __ STA T14 + 0 
495a : a5 06 __ LDA WORK + 3 
495c : 85 64 __ STA T13 + 1 
495e : 2a __ __ ROL
495f : 85 45 __ STA T14 + 1 
4961 : a0 00 __ LDY #$00
4963 : 84 1c __ STY ACCU + 1 
4965 : b1 54 __ LDA (T1 + 0),y 
4967 : 85 65 __ STA T15 + 0 
4969 : 18 __ __ CLC
496a : 65 44 __ ADC T14 + 0 
496c : 85 44 __ STA T14 + 0 
496e : c8 __ __ INY
496f : b1 54 __ LDA (T1 + 0),y 
4971 : 85 66 __ STA T15 + 1 
4973 : 65 45 __ ADC T14 + 1 
4975 : 85 45 __ STA T14 + 1 
4977 : a5 5a __ LDA T5 + 0 
4979 : 85 1b __ STA ACCU + 0 
497b : a5 14 __ LDA P7 
497d : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4980 : a5 05 __ LDA WORK + 2 
4982 : 85 67 __ STA T16 + 0 
4984 : 18 __ __ CLC
4985 : 65 44 __ ADC T14 + 0 
4987 : 85 0f __ STA P2 
4989 : a5 06 __ LDA WORK + 3 
498b : 85 68 __ STA T16 + 1 
498d : 65 45 __ ADC T14 + 1 
498f : 85 10 __ STA P3 
4991 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4994 : a9 00 __ LDA #$00
4996 : 85 15 __ STA P8 
4998 : ad fe 5a LDA $5afe ; (screen_row + 0)
499b : 85 1b __ STA ACCU + 0 
499d : ad ff 5a LDA $5aff ; (screen_row + 1)
49a0 : 85 1c __ STA ACCU + 1 
49a2 : a5 61 __ LDA T11 + 0 
49a4 : 85 03 __ STA WORK + 0 
49a6 : a5 62 __ LDA T11 + 1 
49a8 : 85 04 __ STA WORK + 1 
49aa : 20 46 56 JSR $5646 ; (mul16 + 0)
49ad : 18 __ __ CLC
49ae : a5 05 __ LDA WORK + 2 
49b0 : 65 5f __ ADC T10 + 0 
49b2 : aa __ __ TAX
49b3 : a5 06 __ LDA WORK + 3 
49b5 : 65 60 __ ADC T10 + 1 
49b7 : a8 __ __ TAY
49b8 : 8a __ __ TXA
49b9 : 18 __ __ CLC
49ba : 69 30 __ ADC #$30
49bc : 85 12 __ STA P5 
49be : 90 01 __ BCC $49c1 ; (undo_performundo.s1009 + 0)
.s1008:
49c0 : c8 __ __ INY
.s1009:
49c1 : 84 13 __ STY P6 
49c3 : a5 63 __ LDA T13 + 0 
49c5 : 0a __ __ ASL
49c6 : a8 __ __ TAY
49c7 : a5 64 __ LDA T13 + 1 
49c9 : 2a __ __ ROL
49ca : aa __ __ TAX
49cb : 98 __ __ TYA
49cc : 18 __ __ CLC
49cd : 65 63 __ ADC T13 + 0 
49cf : a8 __ __ TAY
49d0 : 8a __ __ TXA
49d1 : 65 64 __ ADC T13 + 1 
49d3 : aa __ __ TAX
49d4 : 98 __ __ TYA
49d5 : 18 __ __ CLC
49d6 : 65 65 __ ADC T15 + 0 
49d8 : a8 __ __ TAY
49d9 : 8a __ __ TXA
49da : 65 66 __ ADC T15 + 1 
49dc : aa __ __ TAX
49dd : 98 __ __ TYA
49de : 18 __ __ CLC
49df : 65 67 __ ADC T16 + 0 
49e1 : 85 0f __ STA P2 
49e3 : 8a __ __ TXA
49e4 : 65 68 __ ADC T16 + 1 
49e6 : 85 10 __ STA P3 
49e8 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
49eb : 4c 3b 48 JMP $483b ; (undo_performundo.s10 + 0)
--------------------------------------------------------------------
undo_performredo: ; undo_performredo()->void
.s1000:
49ee : a2 0f __ LDX #$0f
49f0 : b5 53 __ LDA T0 + 0,x 
49f2 : 9d c0 ab STA $abc0,x ; (buff + 24)
49f5 : ca __ __ DEX
49f6 : 10 f8 __ BPL $49f0 ; (undo_performredo.s1000 + 2)
.s0:
49f8 : ad fe 5b LDA $5bfe ; (undo_redopossible + 0)
49fb : d0 0b __ BNE $4a08 ; (undo_performredo.s1 + 0)
.s1001:
49fd : a2 0f __ LDX #$0f
49ff : bd c0 ab LDA $abc0,x ; (buff + 24)
4a02 : 95 53 __ STA T0 + 0,x 
4a04 : ca __ __ DEX
4a05 : 10 f8 __ BPL $49ff ; (undo_performredo.s1001 + 2)
4a07 : 60 __ __ RTS
.s1:
4a08 : 85 53 __ STA T0 + 0 
4a0a : ad fc 5b LDA $5bfc ; (undonumber + 0)
4a0d : c9 27 __ CMP #$27
4a0f : 90 04 __ BCC $4a15 ; (undo_performredo.s4 + 0)
.s5:
4a11 : a9 01 __ LDA #$01
4a13 : b0 02 __ BCS $4a17 ; (undo_performredo.s6 + 0)
.s4:
4a15 : 69 01 __ ADC #$01
.s6:
4a17 : 8d fc 5b STA $5bfc ; (undonumber + 0)
4a1a : 0a __ __ ASL
4a1b : 0a __ __ ASL
4a1c : 0a __ __ ASL
4a1d : a2 00 __ LDX #$00
4a1f : 90 01 __ BCC $4a22 ; (undo_performredo.s1017 + 0)
.s1016:
4a21 : e8 __ __ INX
.s1017:
4a22 : 38 __ __ SEC
4a23 : ed fc 5b SBC $5bfc ; (undonumber + 0)
4a26 : b0 01 __ BCS $4a29 ; (undo_performredo.s1019 + 0)
.s1018:
4a28 : ca __ __ DEX
.s1019:
4a29 : 18 __ __ CLC
4a2a : 69 9b __ ADC #$9b
4a2c : 85 56 __ STA T3 + 0 
4a2e : 8a __ __ TXA
4a2f : 69 5d __ ADC #$5d
4a31 : 85 57 __ STA T3 + 1 
4a33 : a0 04 __ LDY #$04
4a35 : b1 56 __ LDA (T3 + 0),y 
4a37 : f0 41 __ BEQ $4a7a ; (undo_performredo.s10 + 0)
.s26:
4a39 : 85 54 __ STA T1 + 0 
4a3b : 85 1b __ STA ACCU + 0 
4a3d : a9 00 __ LDA #$00
4a3f : 85 55 __ STA T2 + 0 
4a41 : 85 1c __ STA ACCU + 1 
4a43 : c8 __ __ INY
4a44 : b1 56 __ LDA (T3 + 0),y 
4a46 : 85 12 __ STA P5 
4a48 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4a4b : a5 05 __ LDA WORK + 2 
4a4d : 85 58 __ STA T5 + 0 
4a4f : 0a __ __ ASL
4a50 : a8 __ __ TAY
4a51 : a5 06 __ LDA WORK + 3 
4a53 : 85 59 __ STA T5 + 1 
4a55 : 2a __ __ ROL
4a56 : aa __ __ TAX
4a57 : 98 __ __ TYA
4a58 : 18 __ __ CLC
4a59 : 65 05 __ ADC WORK + 2 
4a5b : 85 5a __ STA T6 + 0 
4a5d : 8a __ __ TXA
4a5e : 65 06 __ ADC WORK + 3 
4a60 : 85 5b __ STA T6 + 1 
4a62 : 06 58 __ ASL T5 + 0 
4a64 : 26 59 __ ROL T5 + 1 
4a66 : a0 02 __ LDY #$02
4a68 : b1 56 __ LDA (T3 + 0),y 
4a6a : 85 5c __ STA T7 + 0 
4a6c : c8 __ __ INY
4a6d : b1 56 __ LDA (T3 + 0),y 
4a6f : 85 56 __ STA T3 + 0 
4a71 : a9 7f __ LDA #$7f
4a73 : 85 0d __ STA P0 
4a75 : a9 00 __ LDA #$00
4a77 : 18 __ __ CLC
4a78 : 90 62 __ BCC $4adc ; (undo_performredo.l1014 + 0)
.s10:
4a7a : 20 ea 57 JSR $57ea ; (vdcwin_cpy_viewport@proxy + 0)
4a7d : ad ff 5b LDA $5bff ; (showbar + 0)
4a80 : f0 03 __ BEQ $4a85 ; (undo_performredo.s17 + 0)
.s15:
4a82 : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
.s17:
4a85 : ad fc 5b LDA $5bfc ; (undonumber + 0)
4a88 : 0a __ __ ASL
4a89 : 0a __ __ ASL
4a8a : 0a __ __ ASL
4a8b : a2 00 __ LDX #$00
4a8d : 90 01 __ BCC $4a90 ; (undo_performredo.s1027 + 0)
.s1026:
4a8f : e8 __ __ INX
.s1027:
4a90 : 38 __ __ SEC
4a91 : ed fc 5b SBC $5bfc ; (undonumber + 0)
4a94 : b0 01 __ BCS $4a97 ; (undo_performredo.s1029 + 0)
.s1028:
4a96 : ca __ __ DEX
.s1029:
4a97 : 18 __ __ CLC
4a98 : 69 9b __ ADC #$9b
4a9a : 85 56 __ STA T3 + 0 
4a9c : 8a __ __ TXA
4a9d : 69 5d __ ADC #$5d
4a9f : 85 57 __ STA T3 + 1 
4aa1 : a0 00 __ LDY #$00
4aa3 : b1 56 __ LDA (T3 + 0),y 
4aa5 : 8d fa 5b STA $5bfa ; (undoaddress + 0)
4aa8 : c8 __ __ INY
4aa9 : b1 56 __ LDA (T3 + 0),y 
4aab : 8d fb 5b STA $5bfb ; (undoaddress + 1)
4aae : ee fd 5b INC $5bfd ; (undo_undopossible + 0)
4ab1 : a6 53 __ LDX T0 + 0 
4ab3 : ca __ __ DEX
4ab4 : 8e fe 5b STX $5bfe ; (undo_redopossible + 0)
4ab7 : ad fc 5b LDA $5bfc ; (undonumber + 0)
4aba : c9 27 __ CMP #$27
4abc : b0 06 __ BCS $4ac4 ; (undo_performredo.s20 + 0)
.s21:
4abe : a0 0d __ LDY #$0d
4ac0 : b1 56 __ LDA (T3 + 0),y 
4ac2 : f0 12 __ BEQ $4ad6 ; (undo_performredo.s18 + 0)
.s20:
4ac4 : ad fc 5b LDA $5bfc ; (undonumber + 0)
4ac7 : c9 27 __ CMP #$27
4ac9 : f0 03 __ BEQ $4ace ; (undo_performredo.s25 + 0)
4acb : 4c fd 49 JMP $49fd ; (undo_performredo.s1001 + 0)
.s25:
4ace : ad a8 5d LDA $5da8 ; (Undo + 6)
4ad1 : f0 03 __ BEQ $4ad6 ; (undo_performredo.s18 + 0)
4ad3 : 4c fd 49 JMP $49fd ; (undo_performredo.s1001 + 0)
.s18:
4ad6 : 8d fe 5b STA $5bfe ; (undo_redopossible + 0)
4ad9 : 4c fd 49 JMP $49fd ; (undo_performredo.s1001 + 0)
.l1014:
4adc : 65 5c __ ADC T7 + 0 
4ade : 85 5f __ STA T9 + 0 
4ae0 : 85 03 __ STA WORK + 0 
4ae2 : a9 00 __ LDA #$00
4ae4 : 85 13 __ STA P6 
4ae6 : 2a __ __ ROL
4ae7 : 85 60 __ STA T9 + 1 
4ae9 : 85 04 __ STA WORK + 1 
4aeb : ad fc 5a LDA $5afc ; (screen_col + 0)
4aee : 85 1b __ STA ACCU + 0 
4af0 : ad fd 5a LDA $5afd ; (screen_col + 1)
4af3 : 85 1c __ STA ACCU + 1 
4af5 : 20 46 56 JSR $5646 ; (mul16 + 0)
4af8 : 18 __ __ CLC
4af9 : a5 05 __ LDA WORK + 2 
4afb : 65 56 __ ADC T3 + 0 
4afd : 85 0e __ STA P1 
4aff : a5 06 __ LDA WORK + 3 
4b01 : 69 58 __ ADC #$58
4b03 : 85 0f __ STA P2 
4b05 : ad fc 5b LDA $5bfc ; (undonumber + 0)
4b08 : 0a __ __ ASL
4b09 : 0a __ __ ASL
4b0a : 0a __ __ ASL
4b0b : a2 00 __ LDX #$00
4b0d : 90 01 __ BCC $4b10 ; (undo_performredo.s1021 + 0)
.s1020:
4b0f : e8 __ __ INX
.s1021:
4b10 : 38 __ __ SEC
4b11 : ed fc 5b SBC $5bfc ; (undonumber + 0)
4b14 : b0 01 __ BCS $4b17 ; (undo_performredo.s1023 + 0)
.s1022:
4b16 : ca __ __ DEX
.s1023:
4b17 : 18 __ __ CLC
4b18 : 69 9b __ ADC #$9b
4b1a : 85 61 __ STA T10 + 0 
4b1c : 8a __ __ TXA
4b1d : 69 5d __ ADC #$5d
4b1f : 85 62 __ STA T10 + 1 
4b21 : a0 00 __ LDY #$00
4b23 : 84 1c __ STY ACCU + 1 
4b25 : b1 61 __ LDA (T10 + 0),y 
4b27 : 18 __ __ CLC
4b28 : 65 58 __ ADC T5 + 0 
4b2a : 85 44 __ STA T12 + 0 
4b2c : c8 __ __ INY
4b2d : b1 61 __ LDA (T10 + 0),y 
4b2f : 65 59 __ ADC T5 + 1 
4b31 : 85 45 __ STA T12 + 1 
4b33 : a5 55 __ LDA T2 + 0 
4b35 : 85 1b __ STA ACCU + 0 
4b37 : a5 12 __ LDA P5 
4b39 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4b3c : a5 05 __ LDA WORK + 2 
4b3e : 85 5d __ STA T8 + 0 
4b40 : 18 __ __ CLC
4b41 : 65 44 __ ADC T12 + 0 
4b43 : 85 10 __ STA P3 
4b45 : a5 06 __ LDA WORK + 3 
4b47 : 85 5e __ STA T8 + 1 
4b49 : 65 45 __ ADC T12 + 1 
4b4b : 85 11 __ STA P4 
4b4d : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
4b50 : ad fc 5a LDA $5afc ; (screen_col + 0)
4b53 : 85 1b __ STA ACCU + 0 
4b55 : ad fd 5a LDA $5afd ; (screen_col + 1)
4b58 : 85 1c __ STA ACCU + 1 
4b5a : a5 5f __ LDA T9 + 0 
4b5c : 85 03 __ STA WORK + 0 
4b5e : a5 60 __ LDA T9 + 1 
4b60 : 85 04 __ STA WORK + 1 
4b62 : 20 46 56 JSR $5646 ; (mul16 + 0)
4b65 : 18 __ __ CLC
4b66 : a5 05 __ LDA WORK + 2 
4b68 : 65 56 __ ADC T3 + 0 
4b6a : 85 5f __ STA T9 + 0 
4b6c : a5 06 __ LDA WORK + 3 
4b6e : 69 58 __ ADC #$58
4b70 : 85 60 __ STA T9 + 1 
4b72 : ad fe 5a LDA $5afe ; (screen_row + 0)
4b75 : 85 1b __ STA ACCU + 0 
4b77 : ad ff 5a LDA $5aff ; (screen_row + 1)
4b7a : 85 1c __ STA ACCU + 1 
4b7c : ad fc 5a LDA $5afc ; (screen_col + 0)
4b7f : 85 03 __ STA WORK + 0 
4b81 : ad fd 5a LDA $5afd ; (screen_col + 1)
4b84 : 85 04 __ STA WORK + 1 
4b86 : 20 46 56 JSR $5646 ; (mul16 + 0)
4b89 : 18 __ __ CLC
4b8a : a5 05 __ LDA WORK + 2 
4b8c : 65 5f __ ADC T9 + 0 
4b8e : aa __ __ TAX
4b8f : a5 06 __ LDA WORK + 3 
4b91 : 65 60 __ ADC T9 + 1 
4b93 : a8 __ __ TAY
4b94 : 8a __ __ TXA
4b95 : 18 __ __ CLC
4b96 : 69 30 __ ADC #$30
4b98 : 85 0e __ STA P1 
4b9a : 90 01 __ BCC $4b9d ; (undo_performredo.s1025 + 0)
.s1024:
4b9c : c8 __ __ INY
.s1025:
4b9d : 84 0f __ STY P2 
4b9f : a0 00 __ LDY #$00
4ba1 : 84 13 __ STY P6 
4ba3 : b1 61 __ LDA (T10 + 0),y 
4ba5 : 18 __ __ CLC
4ba6 : 65 5a __ ADC T6 + 0 
4ba8 : aa __ __ TAX
4ba9 : c8 __ __ INY
4baa : b1 61 __ LDA (T10 + 0),y 
4bac : 65 5b __ ADC T6 + 1 
4bae : a8 __ __ TAY
4baf : 8a __ __ TXA
4bb0 : 18 __ __ CLC
4bb1 : 65 5d __ ADC T8 + 0 
4bb3 : 85 10 __ STA P3 
4bb5 : 98 __ __ TYA
4bb6 : 65 5e __ ADC T8 + 1 
4bb8 : 85 11 __ STA P4 
4bba : 20 03 14 JSR $1403 ; (bnk_cpyfromvdc.s0 + 0)
4bbd : e6 55 __ INC T2 + 0 
4bbf : a5 55 __ LDA T2 + 0 
4bc1 : c5 54 __ CMP T1 + 0 
4bc3 : b0 03 __ BCS $4bc8 ; (undo_performredo.s1025 + 43)
4bc5 : 4c dc 4a JMP $4adc ; (undo_performredo.l1014 + 0)
4bc8 : 4c 7a 4a JMP $4a7a ; (undo_performredo.s10 + 0)
--------------------------------------------------------------------
undo_new: ; undo_new(u8,u8,u8,u8)->void
.s1000:
4bcb : a2 03 __ LDX #$03
4bcd : b5 53 __ LDA T11 + 0,x 
4bcf : 9d ef ab STA $abef,x ; (vp_fill + 31)
4bd2 : ca __ __ DEX
4bd3 : 10 f8 __ BPL $4bcd ; (undo_new.s1000 + 2)
.s0:
4bd5 : ee fc 5b INC $5bfc ; (undonumber + 0)
4bd8 : ad fe 5b LDA $5bfe ; (undo_redopossible + 0)
4bdb : f0 0c __ BEQ $4be9 ; (undo_new.s2 + 0)
.s1:
4bdd : a9 01 __ LDA #$01
4bdf : 8d fd 5b STA $5bfd ; (undo_undopossible + 0)
4be2 : a9 00 __ LDA #$00
4be4 : 8d fe 5b STA $5bfe ; (undo_redopossible + 0)
4be7 : f0 03 __ BEQ $4bec ; (undo_new.s3 + 0)
.s2:
4be9 : ee fd 5b INC $5bfd ; (undo_undopossible + 0)
.s3:
4bec : a9 01 __ LDA #$01
4bee : 85 44 __ STA T1 + 0 
4bf0 : a9 28 __ LDA #$28
4bf2 : cd fc 5b CMP $5bfc ; (undonumber + 0)
4bf5 : b0 05 __ BCS $4bfc ; (undo_new.s6 + 0)
.s4:
4bf7 : a9 01 __ LDA #$01
4bf9 : 8d fc 5b STA $5bfc ; (undonumber + 0)
.s6:
4bfc : ad f6 ab LDA $abf6 ; (sstack + 0)
4bff : 85 49 __ STA T4 + 0 
4c01 : 85 1b __ STA ACCU + 0 
4c03 : a9 00 __ LDA #$00
4c05 : 85 1c __ STA ACCU + 1 
4c07 : a5 18 __ LDA P11 ; (width + 0)
4c09 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4c0c : a5 05 __ LDA WORK + 2 
4c0e : 85 4a __ STA T5 + 0 
4c10 : 0a __ __ ASL
4c11 : 85 4c __ STA T6 + 0 
4c13 : a5 06 __ LDA WORK + 3 
4c15 : 85 4b __ STA T5 + 1 
4c17 : 2a __ __ ROL
4c18 : 06 4c __ ASL T6 + 0 
4c1a : 2a __ __ ROL
4c1b : 85 4d __ STA T6 + 1 
4c1d : ad fa 5b LDA $5bfa ; (undoaddress + 0)
4c20 : 18 __ __ CLC
4c21 : 65 4c __ ADC T6 + 0 
4c23 : aa __ __ TAX
4c24 : ad fb 5b LDA $5bfb ; (undoaddress + 1)
4c27 : 65 4d __ ADC T6 + 1 
4c29 : cd fb 5b CMP $5bfb ; (undoaddress + 1)
4c2c : d0 03 __ BNE $4c31 ; (undo_new.s1009 + 0)
.s1008:
4c2e : ec fa 5b CPX $5bfa ; (undoaddress + 0)
.s1009:
4c31 : b0 11 __ BCS $4c44 ; (undo_new.s9 + 0)
.s7:
4c33 : a9 01 __ LDA #$01
4c35 : 8d fc 5b STA $5bfc ; (undonumber + 0)
4c38 : ad ec 5b LDA $5bec ; (vdc_state + 20)
4c3b : 8d fa 5b STA $5bfa ; (undoaddress + 0)
4c3e : ad ed 5b LDA $5bed ; (vdc_state + 21)
4c41 : 8d fb 5b STA $5bfb ; (undoaddress + 1)
.s9:
4c44 : a9 00 __ LDA #$00
4c46 : 85 52 __ STA T9 + 0 
4c48 : ad fa 5b LDA $5bfa ; (undoaddress + 0)
4c4b : 18 __ __ CLC
4c4c : 65 4c __ ADC T6 + 0 
4c4e : 85 4c __ STA T6 + 0 
4c50 : ad fb 5b LDA $5bfb ; (undoaddress + 1)
4c53 : 65 4d __ ADC T6 + 1 
4c55 : 85 4d __ STA T6 + 1 
4c57 : a9 ff __ LDA #$ff
4c59 : 4d ec 5b EOR $5bec ; (vdc_state + 20)
4c5c : aa __ __ TAX
4c5d : a9 ff __ LDA #$ff
4c5f : 4d ed 5b EOR $5bed ; (vdc_state + 21)
4c62 : c5 4d __ CMP T6 + 1 
4c64 : d0 02 __ BNE $4c68 ; (undo_new.s1007 + 0)
.s1006:
4c66 : e4 4c __ CPX T6 + 0 
.s1007:
4c68 : b0 02 __ BCS $4c6c ; (undo_new.s12 + 0)
.s10:
4c6a : c6 44 __ DEC T1 + 0 
.s12:
4c6c : a5 49 __ LDA T4 + 0 
4c6e : f0 16 __ BEQ $4c86 ; (undo_new.s16 + 0)
.s24:
4c70 : a5 17 __ LDA P10 ; (col + 0)
4c72 : 85 45 __ STA T2 + 0 
4c74 : a5 16 __ LDA P9 ; (row + 0)
4c76 : 85 4c __ STA T6 + 0 
4c78 : a9 7f __ LDA #$7f
4c7a : 85 11 __ STA P4 
4c7c : a5 18 __ LDA P11 ; (width + 0)
4c7e : 85 14 __ STA P7 
4c80 : a9 00 __ LDA #$00
4c82 : 18 __ __ CLC
4c83 : 4c 13 4d JMP $4d13 ; (undo_new.l1016 + 0)
.s16:
4c86 : ad fc 5b LDA $5bfc ; (undonumber + 0)
4c89 : 85 52 __ STA T9 + 0 
4c8b : 0a __ __ ASL
4c8c : 0a __ __ ASL
4c8d : 0a __ __ ASL
4c8e : a2 00 __ LDX #$00
4c90 : 90 01 __ BCC $4c93 ; (undo_new.s1021 + 0)
.s1020:
4c92 : e8 __ __ INX
.s1021:
4c93 : 38 __ __ SEC
4c94 : e5 52 __ SBC T9 + 0 
4c96 : b0 01 __ BCS $4c99 ; (undo_new.s1023 + 0)
.s1022:
4c98 : ca __ __ DEX
.s1023:
4c99 : 18 __ __ CLC
4c9a : 69 9b __ ADC #$9b
4c9c : 85 45 __ STA T2 + 0 
4c9e : 8a __ __ TXA
4c9f : 69 5d __ ADC #$5d
4ca1 : 85 46 __ STA T2 + 1 
4ca3 : ad fb 5b LDA $5bfb ; (undoaddress + 1)
4ca6 : 85 48 __ STA T3 + 1 
4ca8 : ad fa 5b LDA $5bfa ; (undoaddress + 0)
4cab : 85 47 __ STA T3 + 0 
4cad : a0 00 __ LDY #$00
4caf : 91 45 __ STA (T2 + 0),y 
4cb1 : a5 48 __ LDA T3 + 1 
4cb3 : c8 __ __ INY
4cb4 : 91 45 __ STA (T2 + 0),y 
4cb6 : a5 4a __ LDA T5 + 0 
4cb8 : 85 1b __ STA ACCU + 0 
4cba : a5 4b __ LDA T5 + 1 
4cbc : 85 1c __ STA ACCU + 1 
4cbe : a5 44 __ LDA T1 + 0 
4cc0 : 0a __ __ ASL
4cc1 : 18 __ __ CLC
4cc2 : 69 02 __ ADC #$02
4cc4 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4cc7 : 18 __ __ CLC
4cc8 : a5 05 __ LDA WORK + 2 
4cca : 65 47 __ ADC T3 + 0 
4ccc : 8d fa 5b STA $5bfa ; (undoaddress + 0)
4ccf : a5 06 __ LDA WORK + 3 
4cd1 : 65 48 __ ADC T3 + 1 
4cd3 : 8d fb 5b STA $5bfb ; (undoaddress + 1)
4cd6 : a5 52 __ LDA T9 + 0 
4cd8 : c9 28 __ CMP #$28
4cda : a9 00 __ LDA #$00
4cdc : b0 09 __ BCS $4ce7 ; (undo_new.s22 + 0)
.s21:
4cde : a0 07 __ LDY #$07
4ce0 : 91 45 __ STA (T2 + 0),y 
4ce2 : c8 __ __ INY
4ce3 : 91 45 __ STA (T2 + 0),y 
4ce5 : 90 06 __ BCC $4ced ; (undo_new.s23 + 0)
.s22:
4ce7 : 8d a2 5d STA $5da2 ; (Undo + 0)
4cea : 8d a3 5d STA $5da3 ; (Undo + 1)
.s23:
4ced : a5 49 __ LDA T4 + 0 
4cef : a0 04 __ LDY #$04
4cf1 : 91 45 __ STA (T2 + 0),y 
4cf3 : a5 18 __ LDA P11 ; (width + 0)
4cf5 : c8 __ __ INY
4cf6 : 91 45 __ STA (T2 + 0),y 
4cf8 : a5 44 __ LDA T1 + 0 
4cfa : c8 __ __ INY
4cfb : 91 45 __ STA (T2 + 0),y 
4cfd : a5 17 __ LDA P10 ; (col + 0)
4cff : a0 03 __ LDY #$03
4d01 : 91 45 __ STA (T2 + 0),y 
4d03 : a5 16 __ LDA P9 ; (row + 0)
4d05 : 88 __ __ DEY
4d06 : 91 45 __ STA (T2 + 0),y 
.s1001:
4d08 : a2 03 __ LDX #$03
4d0a : bd ef ab LDA $abef,x ; (vp_fill + 31)
4d0d : 95 53 __ STA T11 + 0,x 
4d0f : ca __ __ DEX
4d10 : 10 f8 __ BPL $4d0a ; (undo_new.s1001 + 2)
4d12 : 60 __ __ RTS
.l1016:
4d13 : 65 4c __ ADC T6 + 0 
4d15 : 85 03 __ STA WORK + 0 
4d17 : a9 00 __ LDA #$00
4d19 : 85 15 __ STA P8 
4d1b : 2a __ __ ROL
4d1c : 85 04 __ STA WORK + 1 
4d1e : ad fc 5a LDA $5afc ; (screen_col + 0)
4d21 : 85 53 __ STA T11 + 0 
4d23 : 85 1b __ STA ACCU + 0 
4d25 : ad fd 5a LDA $5afd ; (screen_col + 1)
4d28 : 85 54 __ STA T11 + 1 
4d2a : 85 1c __ STA ACCU + 1 
4d2c : 20 46 56 JSR $5646 ; (mul16 + 0)
4d2f : 18 __ __ CLC
4d30 : a5 05 __ LDA WORK + 2 
4d32 : 65 45 __ ADC T2 + 0 
4d34 : 85 50 __ STA T8 + 0 
4d36 : 85 12 __ STA P5 
4d38 : a5 06 __ LDA WORK + 3 
4d3a : 69 58 __ ADC #$58
4d3c : 85 51 __ STA T8 + 1 
4d3e : 85 13 __ STA P6 
4d40 : a5 52 __ LDA T9 + 0 
4d42 : 85 1b __ STA ACCU + 0 
4d44 : a9 00 __ LDA #$00
4d46 : 85 1c __ STA ACCU + 1 
4d48 : a5 14 __ LDA P7 
4d4a : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4d4d : a5 05 __ LDA WORK + 2 
4d4f : 85 4e __ STA T7 + 0 
4d51 : a5 06 __ LDA WORK + 3 
4d53 : 85 4f __ STA T7 + 1 
4d55 : ad fa 5b LDA $5bfa ; (undoaddress + 0)
4d58 : 85 55 __ STA T12 + 0 
4d5a : 18 __ __ CLC
4d5b : 65 05 __ ADC WORK + 2 
4d5d : 85 0f __ STA P2 
4d5f : ad fb 5b LDA $5bfb ; (undoaddress + 1)
4d62 : 85 56 __ STA T12 + 1 
4d64 : 65 06 __ ADC WORK + 3 
4d66 : 85 10 __ STA P3 
4d68 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4d6b : a9 00 __ LDA #$00
4d6d : 85 15 __ STA P8 
4d6f : ad fe 5a LDA $5afe ; (screen_row + 0)
4d72 : 85 1b __ STA ACCU + 0 
4d74 : ad ff 5a LDA $5aff ; (screen_row + 1)
4d77 : 85 1c __ STA ACCU + 1 
4d79 : a5 53 __ LDA T11 + 0 
4d7b : 85 03 __ STA WORK + 0 
4d7d : a5 54 __ LDA T11 + 1 
4d7f : 85 04 __ STA WORK + 1 
4d81 : 20 46 56 JSR $5646 ; (mul16 + 0)
4d84 : 18 __ __ CLC
4d85 : a5 05 __ LDA WORK + 2 
4d87 : 65 50 __ ADC T8 + 0 
4d89 : aa __ __ TAX
4d8a : a5 06 __ LDA WORK + 3 
4d8c : 65 51 __ ADC T8 + 1 
4d8e : a8 __ __ TAY
4d8f : 8a __ __ TXA
4d90 : 18 __ __ CLC
4d91 : 69 30 __ ADC #$30
4d93 : 85 12 __ STA P5 
4d95 : 90 01 __ BCC $4d98 ; (undo_new.s1019 + 0)
.s1018:
4d97 : c8 __ __ INY
.s1019:
4d98 : 84 13 __ STY P6 
4d9a : 18 __ __ CLC
4d9b : a5 4a __ LDA T5 + 0 
4d9d : 65 55 __ ADC T12 + 0 
4d9f : a8 __ __ TAY
4da0 : a5 4b __ LDA T5 + 1 
4da2 : 65 56 __ ADC T12 + 1 
4da4 : aa __ __ TAX
4da5 : 98 __ __ TYA
4da6 : 18 __ __ CLC
4da7 : 65 4e __ ADC T7 + 0 
4da9 : 85 0f __ STA P2 
4dab : 8a __ __ TXA
4dac : 65 4f __ ADC T7 + 1 
4dae : 85 10 __ STA P3 
4db0 : 20 a8 13 JSR $13a8 ; (bnk_cpytovdc.s0 + 0)
4db3 : e6 52 __ INC T9 + 0 
4db5 : a5 52 __ LDA T9 + 0 
4db7 : c5 49 __ CMP T4 + 0 
4db9 : b0 03 __ BCS $4dbe ; (undo_new.s1019 + 38)
4dbb : 4c 13 4d JMP $4d13 ; (undo_new.l1016 + 0)
4dbe : 4c 86 4c JMP $4c86 ; (undo_new.s16 + 0)
--------------------------------------------------------------------
screenmapplot: ; screenmapplot(u8,u8,u8,u8)->void
.s0:
4dc1 : ad fc 5a LDA $5afc ; (screen_col + 0)
4dc4 : 85 1b __ STA ACCU + 0 
4dc6 : ad fd 5a LDA $5afd ; (screen_col + 1)
4dc9 : 85 1c __ STA ACCU + 1 
4dcb : a5 10 __ LDA P3 ; (row + 0)
4dcd : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4dd0 : 18 __ __ CLC
4dd1 : a5 05 __ LDA WORK + 2 
4dd3 : 65 11 __ ADC P4 ; (col + 0)
4dd5 : 85 0d __ STA P0 
4dd7 : a5 06 __ LDA WORK + 3 
4dd9 : 69 58 __ ADC #$58
4ddb : 85 0e __ STA P1 
4ddd : a5 12 __ LDA P5 ; (screencode + 0)
4ddf : 85 0f __ STA P2 
4de1 : 20 f5 14 JSR $14f5 ; (bnk_writeb.s0 + 0)
4de4 : ad fc 5a LDA $5afc ; (screen_col + 0)
4de7 : 85 1b __ STA ACCU + 0 
4de9 : ad fd 5a LDA $5afd ; (screen_col + 1)
4dec : 85 1c __ STA ACCU + 1 
4dee : a5 10 __ LDA P3 ; (row + 0)
4df0 : 20 26 56 JSR $5626 ; (mul16by8 + 0)
4df3 : 18 __ __ CLC
4df4 : a5 05 __ LDA WORK + 2 
4df6 : 65 11 __ ADC P4 ; (col + 0)
4df8 : 85 43 __ STA T1 + 0 
4dfa : a5 06 __ LDA WORK + 3 
4dfc : 69 58 __ ADC #$58
4dfe : 85 44 __ STA T1 + 1 
4e00 : ad fe 5a LDA $5afe ; (screen_row + 0)
4e03 : 85 1b __ STA ACCU + 0 
4e05 : ad ff 5a LDA $5aff ; (screen_row + 1)
4e08 : 85 1c __ STA ACCU + 1 
4e0a : ad fc 5a LDA $5afc ; (screen_col + 0)
4e0d : 85 03 __ STA WORK + 0 
4e0f : ad fd 5a LDA $5afd ; (screen_col + 1)
4e12 : 85 04 __ STA WORK + 1 
4e14 : 20 46 56 JSR $5646 ; (mul16 + 0)
4e17 : 18 __ __ CLC
4e18 : a5 05 __ LDA WORK + 2 
4e1a : 65 43 __ ADC T1 + 0 
4e1c : a8 __ __ TAY
4e1d : a5 06 __ LDA WORK + 3 
4e1f : 65 44 __ ADC T1 + 1 
4e21 : aa __ __ TAX
4e22 : 98 __ __ TYA
4e23 : 18 __ __ CLC
4e24 : 69 30 __ ADC #$30
4e26 : 85 0d __ STA P0 
4e28 : 90 01 __ BCC $4e2b ; (screenmapplot.s1003 + 0)
.s1002:
4e2a : e8 __ __ INX
.s1003:
4e2b : 86 0e __ STX P1 
4e2d : a5 13 __ LDA P6 ; (attribute + 0)
4e2f : 85 0f __ STA P2 
4e31 : 4c f5 14 JMP $14f5 ; (bnk_writeb.s0 + 0)
--------------------------------------------------------------------
gotoxy: ; gotoxy(u8,u8)->void
.s0:
4e34 : a4 0d __ LDY P0 
4e36 : a6 0e __ LDX P1 
4e38 : 4c f0 ff JMP $fff0 
--------------------------------------------------------------------
mainmenuloop: ; mainmenuloop()->void
.s1000:
4e3b : a5 53 __ LDA T1 + 0 
4e3d : 8d a8 ab STA $aba8 ; (buff + 0)
4e40 : 38 __ __ SEC
4e41 : a5 23 __ LDA SP + 0 
4e43 : e9 08 __ SBC #$08
4e45 : 85 23 __ STA SP + 0 
4e47 : b0 02 __ BCS $4e4b ; (mainmenuloop.s0 + 0)
4e49 : c6 24 __ DEC SP + 1 
.s0:
4e4b : a9 00 __ LDA #$00
4e4d : 85 17 __ STA P10 
4e4f : 85 18 __ STA P11 
4e51 : 8d f6 ab STA $abf6 ; (sstack + 0)
4e54 : a9 01 __ LDA #$01
4e56 : 8d f8 ab STA $abf8 ; (sstack + 2)
4e59 : ad db 5b LDA $5bdb ; (vdc_state + 3)
4e5c : 8d f7 ab STA $abf7 ; (sstack + 1)
4e5f : 20 02 34 JSR $3402 ; (vdcwin_win_new.s1000 + 0)
4e62 : 20 ed 4f JSR $4fed ; (loadsyscharset.s0 + 0)
.l1:
4e65 : 20 10 50 JSR $5010 ; (menu_main.s1000 + 0)
4e68 : a5 1b __ LDA ACCU + 0 
4e6a : 85 53 __ STA T1 + 0 
4e6c : c9 18 __ CMP #$18
4e6e : f0 18 __ BEQ $4e88 ; (mainmenuloop.s3 + 0)
.s39:
4e70 : b0 03 __ BCS $4e75 ; (mainmenuloop.s40 + 0)
4e72 : 4c 0f 4f JMP $4f0f ; (mainmenuloop.s41 + 0)
.s40:
4e75 : c9 22 __ CMP #$22
4e77 : f0 0f __ BEQ $4e88 ; (mainmenuloop.s3 + 0)
.s55:
4e79 : b0 03 __ BCS $4e7e ; (mainmenuloop.s56 + 0)
4e7b : 4c ff 4e JMP $4eff ; (mainmenuloop.s57 + 0)
.s56:
4e7e : c9 2a __ CMP #$2a
4e80 : f0 76 __ BEQ $4ef8 ; (mainmenuloop.s34 + 0)
.s63:
4e82 : 90 e1 __ BCC $4e65 ; (mainmenuloop.l1 + 0)
.s64:
4e84 : c9 2b __ CMP #$2b
4e86 : f0 1d __ BEQ $4ea5 ; (mainmenuloop.s35 + 0)
.s3:
4e88 : a5 53 __ LDA T1 + 0 
4e8a : c9 63 __ CMP #$63
4e8c : 90 d7 __ BCC $4e65 ; (mainmenuloop.l1 + 0)
.s2:
4e8e : 20 38 38 JSR $3838 ; (vdcwin_win_free.s0 + 0)
4e91 : 20 23 54 JSR $5423 ; (restorealtcharset.s0 + 0)
.s1001:
4e94 : 18 __ __ CLC
4e95 : a5 23 __ LDA SP + 0 
4e97 : 69 08 __ ADC #$08
4e99 : 85 23 __ STA SP + 0 
4e9b : 90 02 __ BCC $4e9f ; (mainmenuloop.s1001 + 11)
4e9d : e6 24 __ INC SP + 1 
4e9f : ad a8 ab LDA $aba8 ; (buff + 0)
4ea2 : 85 53 __ STA T1 + 0 
4ea4 : 60 __ __ RTS
.s35:
4ea5 : a9 94 __ LDA #$94
4ea7 : a0 02 __ LDY #$02
4ea9 : 91 23 __ STA (SP + 0),y 
4eab : a9 59 __ LDA #$59
4ead : c8 __ __ INY
4eae : 91 23 __ STA (SP + 0),y 
4eb0 : a9 06 __ LDA #$06
4eb2 : c8 __ __ INY
4eb3 : 91 23 __ STA (SP + 0),y 
4eb5 : a9 54 __ LDA #$54
4eb7 : c8 __ __ INY
4eb8 : 91 23 __ STA (SP + 0),y 
4eba : a9 00 __ LDA #$00
4ebc : cd ff 2a CMP $2aff ; (undoenabled + 0)
4ebf : 2a __ __ ROL
4ec0 : 8d ff 2a STA $2aff ; (undoenabled + 0)
4ec3 : f0 06 __ BEQ $4ecb ; (mainmenuloop.s76 + 0)
.s75:
4ec5 : a9 54 __ LDA #$54
4ec7 : a2 0f __ LDX #$0f
4ec9 : 90 04 __ BCC $4ecf ; (mainmenuloop.s77 + 0)
.s76:
4ecb : a9 54 __ LDA #$54
4ecd : a2 19 __ LDX #$19
.s77:
4ecf : 85 44 __ STA T0 + 1 
4ed1 : 8a __ __ TXA
4ed2 : a0 06 __ LDY #$06
4ed4 : 91 23 __ STA (SP + 0),y 
4ed6 : a5 44 __ LDA T0 + 1 
4ed8 : c8 __ __ INY
4ed9 : 91 23 __ STA (SP + 0),y 
4edb : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
4ede : a9 00 __ LDA #$00
4ee0 : 8d fc 5b STA $5bfc ; (undonumber + 0)
4ee3 : 8d fd 5b STA $5bfd ; (undo_undopossible + 0)
4ee6 : 8d fe 5b STA $5bfe ; (undo_redopossible + 0)
4ee9 : ad ec 5b LDA $5bec ; (vdc_state + 20)
4eec : 8d fa 5b STA $5bfa ; (undoaddress + 0)
4eef : ad ed 5b LDA $5bed ; (vdc_state + 21)
4ef2 : 8d fb 5b STA $5bfb ; (undoaddress + 1)
4ef5 : 4c 65 4e JMP $4e65 ; (mainmenuloop.l1 + 0)
.s34:
4ef8 : a9 01 __ LDA #$01
4efa : 8d fb 5a STA $5afb ; (appexit + 0)
4efd : d0 8f __ BNE $4e8e ; (mainmenuloop.s2 + 0)
.s57:
4eff : c9 20 __ CMP #$20
4f01 : f0 85 __ BEQ $4e88 ; (mainmenuloop.s3 + 0)
.s58:
4f03 : b0 83 __ BCS $4e88 ; (mainmenuloop.s3 + 0)
.s60:
4f05 : c9 19 __ CMP #$19
4f07 : d0 03 __ BNE $4f0c ; (mainmenuloop.s60 + 7)
4f09 : 4c 88 4e JMP $4e88 ; (mainmenuloop.s3 + 0)
4f0c : 4c 65 4e JMP $4e65 ; (mainmenuloop.l1 + 0)
.s41:
4f0f : c9 0f __ CMP #$0f
4f11 : d0 03 __ BNE $4f16 ; (mainmenuloop.s42 + 0)
4f13 : 4c c9 4f JMP $4fc9 ; (mainmenuloop.s8 + 0)
.s42:
4f16 : b0 16 __ BCS $4f2e ; (mainmenuloop.s43 + 0)
.s44:
4f18 : c9 0d __ CMP #$0d
4f1a : d0 03 __ BNE $4f1f ; (mainmenuloop.s45 + 0)
4f1c : 4c 88 4e JMP $4e88 ; (mainmenuloop.s3 + 0)
.s45:
4f1f : 90 03 __ BCC $4f24 ; (mainmenuloop.s47 + 0)
4f21 : 4c 88 4e JMP $4e88 ; (mainmenuloop.s3 + 0)
.s47:
4f24 : c9 0b __ CMP #$0b
4f26 : d0 03 __ BNE $4f2b ; (mainmenuloop.s47 + 7)
4f28 : 4c 88 4e JMP $4e88 ; (mainmenuloop.s3 + 0)
4f2b : 4c 65 4e JMP $4e65 ; (mainmenuloop.l1 + 0)
.s43:
4f2e : c9 16 __ CMP #$16
4f30 : d0 03 __ BNE $4f35 ; (mainmenuloop.s50 + 0)
4f32 : 4c 88 4e JMP $4e88 ; (mainmenuloop.s3 + 0)
.s50:
4f35 : 90 03 __ BCC $4f3a ; (mainmenuloop.s52 + 0)
4f37 : 4c 88 4e JMP $4e88 ; (mainmenuloop.s3 + 0)
.s52:
4f3a : c9 10 __ CMP #$10
4f3c : f0 03 __ BEQ $4f41 ; (mainmenuloop.s15 + 0)
4f3e : 4c 65 4e JMP $4e65 ; (mainmenuloop.l1 + 0)
.s15:
4f41 : ad ff 2a LDA $2aff ; (undoenabled + 0)
4f44 : c9 01 __ CMP #$01
4f46 : d0 14 __ BNE $4f5c ; (mainmenuloop.s18 + 0)
.s16:
4f48 : a9 00 __ LDA #$00
4f4a : 85 16 __ STA P9 
4f4c : 85 17 __ STA P10 
4f4e : ad fc 5a LDA $5afc ; (screen_col + 0)
4f51 : 85 18 __ STA P11 
4f53 : ad fe 5a LDA $5afe ; (screen_row + 0)
4f56 : 8d f6 ab STA $abf6 ; (sstack + 0)
4f59 : 20 cb 4b JSR $4bcb ; (undo_new.s1000 + 0)
.s18:
4f5c : ad f4 5b LDA $5bf4 ; (plotscreencode + 0)
4f5f : 8d fb ab STA $abfb ; (sstack + 5)
4f62 : ad f8 5b LDA $5bf8 ; (plotblink + 0)
4f65 : 0a __ __ ASL
4f66 : 0a __ __ ASL
4f67 : 0a __ __ ASL
4f68 : 0a __ __ ASL
4f69 : 18 __ __ CLC
4f6a : 6d f5 5b ADC $5bf5 ; (plotcolor + 0)
4f6d : 85 43 __ STA T0 + 0 
4f6f : ad f7 5b LDA $5bf7 ; (plotunderline + 0)
4f72 : 4a __ __ LSR
4f73 : 6a __ __ ROR
4f74 : 6a __ __ ROR
4f75 : 29 c0 __ AND #$c0
4f77 : 6a __ __ ROR
4f78 : 65 43 __ ADC T0 + 0 
4f7a : 85 43 __ STA T0 + 0 
4f7c : ad f6 5b LDA $5bf6 ; (plotreverse + 0)
4f7f : 4a __ __ LSR
4f80 : 6a __ __ ROR
4f81 : 29 80 __ AND #$80
4f83 : 6a __ __ ROR
4f84 : 65 43 __ ADC T0 + 0 
4f86 : 85 43 __ STA T0 + 0 
4f88 : ad f9 5b LDA $5bf9 ; (plotaltchar + 0)
4f8b : 4a __ __ LSR
4f8c : a9 00 __ LDA #$00
4f8e : 6a __ __ ROR
4f8f : 65 43 __ ADC T0 + 0 
.s88:
4f91 : 8d fc ab STA $abfc ; (sstack + 6)
4f94 : 20 9b 39 JSR $399b ; (screenmapfill.s0 + 0)
4f97 : 20 38 38 JSR $3838 ; (vdcwin_win_free.s0 + 0)
4f9a : 20 ea 57 JSR $57ea ; (vdcwin_cpy_viewport@proxy + 0)
4f9d : a9 00 __ LDA #$00
4f9f : 85 17 __ STA P10 
4fa1 : 85 18 __ STA P11 
4fa3 : 8d f6 ab STA $abf6 ; (sstack + 0)
4fa6 : a9 01 __ LDA #$01
4fa8 : 8d f8 ab STA $abf8 ; (sstack + 2)
4fab : ad db 5b LDA $5bdb ; (vdc_state + 3)
4fae : 8d f7 ab STA $abf7 ; (sstack + 1)
4fb1 : 20 02 34 JSR $3402 ; (vdcwin_win_new.s1000 + 0)
4fb4 : a9 00 __ LDA #$00
4fb6 : 85 14 __ STA P7 
4fb8 : 20 34 51 JSR $5134 ; (menu_placebar.s0 + 0)
4fbb : ad ff 5b LDA $5bff ; (showbar + 0)
4fbe : d0 03 __ BNE $4fc3 ; (mainmenuloop.s12 + 0)
4fc0 : 4c 88 4e JMP $4e88 ; (mainmenuloop.s3 + 0)
.s12:
4fc3 : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
4fc6 : 4c 65 4e JMP $4e65 ; (mainmenuloop.l1 + 0)
.s8:
4fc9 : ad ff 2a LDA $2aff ; (undoenabled + 0)
4fcc : c9 01 __ CMP #$01
4fce : d0 14 __ BNE $4fe4 ; (mainmenuloop.s11 + 0)
.s9:
4fd0 : a9 00 __ LDA #$00
4fd2 : 85 16 __ STA P9 
4fd4 : 85 17 __ STA P10 
4fd6 : ad fc 5a LDA $5afc ; (screen_col + 0)
4fd9 : 85 18 __ STA P11 
4fdb : ad fe 5a LDA $5afe ; (screen_row + 0)
4fde : 8d f6 ab STA $abf6 ; (sstack + 0)
4fe1 : 20 cb 4b JSR $4bcb ; (undo_new.s1000 + 0)
.s11:
4fe4 : a9 20 __ LDA #$20
4fe6 : 8d fb ab STA $abfb ; (sstack + 5)
4fe9 : a9 0f __ LDA #$0f
4feb : d0 a4 __ BNE $4f91 ; (mainmenuloop.s88 + 0)
--------------------------------------------------------------------
loadsyscharset: ; loadsyscharset()->void
.s0:
4fed : ad fa 5a LDA $5afa ; (charsetchanged + 1)
4ff0 : c9 01 __ CMP #$01
4ff2 : f0 01 __ BEQ $4ff5 ; (loadsyscharset.s1 + 0)
.s1001:
4ff4 : 60 __ __ RTS
.s1:
4ff5 : a9 7f __ LDA #$7f
4ff7 : 85 11 __ STA P4 
4ff9 : a9 01 __ LDA #$01
4ffb : 85 15 __ STA P8 
4ffd : ad ea 5b LDA $5bea ; (vdc_state + 18)
5000 : 85 0f __ STA P2 
5002 : ad eb 5b LDA $5beb ; (vdc_state + 19)
5005 : 85 10 __ STA P3 
5007 : a9 00 __ LDA #$00
5009 : 85 14 __ STA P7 
500b : 85 12 __ STA P5 
500d : 4c 6d 15 JMP $156d ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
menu_main: ; menu_main()->u8
.s1000:
5010 : a2 03 __ LDX #$03
5012 : b5 53 __ LDA T0 + 0,x 
5014 : 9d c6 ab STA $abc6,x ; (buff + 30)
5017 : ca __ __ DEX
5018 : 10 f8 __ BPL $5012 ; (menu_main.s1000 + 2)
.s0:
501a : ad e0 5a LDA $5ae0 ; (menubar + 52)
501d : 85 14 __ STA P7 
501f : 20 34 51 JSR $5134 ; (menu_placebar.s0 + 0)
.l84:
5022 : a9 01 __ LDA #$01
5024 : 85 53 __ STA T0 + 0 
.l3:
5026 : a9 cf __ LDA #$cf
5028 : 85 13 __ STA P6 
502a : a6 53 __ LDX T0 + 0 
502c : bd db 5a LDA $5adb,x ; (menubar + 47)
502f : 85 0f __ STA P2 
5031 : ad e0 5a LDA $5ae0 ; (menubar + 52)
5034 : 85 10 __ STA P3 
5036 : bd ef 55 LDA $55ef,x ; (__multab12L + 0)
5039 : 18 __ __ CLC
503a : 69 a0 __ ADC #$a0
503c : 85 11 __ STA P4 
503e : a9 5a __ LDA #$5a
5040 : 69 00 __ ADC #$00
5042 : 85 12 __ STA P5 
5044 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
.l5:
5047 : 20 2a 38 JSR $382a ; (vdcwin_getch.s0 + 0)
504a : a5 1b __ LDA ACCU + 0 
504c : 85 54 __ STA T1 + 0 
504e : c9 0d __ CMP #$0d
5050 : d0 06 __ BNE $5058 ; (menu_main.s1002 + 0)
.s1003:
5052 : a9 00 __ LDA #$00
5054 : 85 55 __ STA T3 + 0 
5056 : f0 16 __ BEQ $506e ; (menu_main.s6 + 0)
.s1002:
5058 : a9 01 __ LDA #$01
505a : 85 55 __ STA T3 + 0 
505c : a5 1b __ LDA ACCU + 0 
505e : c9 9d __ CMP #$9d
5060 : f0 0c __ BEQ $506e ; (menu_main.s6 + 0)
.s9:
5062 : c9 1d __ CMP #$1d
5064 : f0 08 __ BEQ $506e ; (menu_main.s6 + 0)
.s8:
5066 : c9 1b __ CMP #$1b
5068 : f0 04 __ BEQ $506e ; (menu_main.s6 + 0)
.s7:
506a : c9 03 __ CMP #$03
506c : d0 d9 __ BNE $5047 ; (menu_main.l5 + 0)
.s6:
506e : a9 c4 __ LDA #$c4
5070 : 85 13 __ STA P6 
5072 : a6 53 __ LDX T0 + 0 
5074 : bd db 5a LDA $5adb,x ; (menubar + 47)
5077 : 85 0f __ STA P2 
5079 : ad e0 5a LDA $5ae0 ; (menubar + 52)
507c : 85 56 __ STA T4 + 0 
507e : 85 10 __ STA P3 
5080 : bd ef 55 LDA $55ef,x ; (__multab12L + 0)
5083 : 18 __ __ CLC
5084 : 69 a0 __ ADC #$a0
5086 : 85 11 __ STA P4 
5088 : a9 5a __ LDA #$5a
508a : 69 00 __ ADC #$00
508c : 85 12 __ STA P5 
508e : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
5091 : a5 54 __ LDA T1 + 0 
5093 : c9 9d __ CMP #$9d
5095 : d0 03 __ BNE $509a ; (menu_main.s12 + 0)
5097 : 4c 28 51 JMP $5128 ; (menu_main.s11 + 0)
.s12:
509a : c9 1d __ CMP #$1d
509c : d0 0c __ BNE $50aa ; (menu_main.s13 + 0)
.s17:
509e : e6 53 __ INC T0 + 0 
50a0 : a5 53 __ LDA T0 + 0 
50a2 : c9 05 __ CMP #$05
50a4 : 90 04 __ BCC $50aa ; (menu_main.s13 + 0)
.s20:
50a6 : a9 01 __ LDA #$01
.s1039:
50a8 : 85 53 __ STA T0 + 0 
.s13:
50aa : a5 55 __ LDA T3 + 0 
50ac : f0 0d __ BEQ $50bb ; (menu_main.s4 + 0)
.s24:
50ae : a5 54 __ LDA T1 + 0 
50b0 : c9 1b __ CMP #$1b
50b2 : f0 11 __ BEQ $50c5 ; (menu_main.s26 + 0)
.s23:
50b4 : c9 03 __ CMP #$03
50b6 : f0 03 __ BEQ $50bb ; (menu_main.s4 + 0)
50b8 : 4c 26 50 JMP $5026 ; (menu_main.l3 + 0)
.s4:
50bb : a5 54 __ LDA T1 + 0 
50bd : c9 1b __ CMP #$1b
50bf : f0 04 __ BEQ $50c5 ; (menu_main.s26 + 0)
.s28:
50c1 : c9 03 __ CMP #$03
50c3 : d0 06 __ BNE $50cb ; (menu_main.s25 + 0)
.s26:
50c5 : a9 63 __ LDA #$63
50c7 : 85 55 __ STA T3 + 0 
50c9 : d0 45 __ BNE $5110 ; (menu_main.s2 + 0)
.s25:
50cb : a6 53 __ LDX T0 + 0 
50cd : ca __ __ DEX
50ce : 8e fd ab STX $abfd ; (sstack + 7)
50d1 : bd dc 5a LDA $5adc,x ; (menubar + 48)
50d4 : 8d fb ab STA $abfb ; (sstack + 5)
50d7 : a6 56 __ LDX T4 + 0 
50d9 : e8 __ __ INX
50da : 8e fc ab STX $abfc ; (sstack + 6)
50dd : 20 b8 51 JSR $51b8 ; (menu_pulldown.s1000 + 0)
50e0 : a5 1b __ LDA ACCU + 0 
50e2 : 85 55 __ STA T3 + 0 
50e4 : c9 12 __ CMP #$12
50e6 : d0 0e __ BNE $50f6 ; (menu_main.s31 + 0)
.s29:
50e8 : a9 00 __ LDA #$00
50ea : 85 55 __ STA T3 + 0 
50ec : c6 53 __ DEC T0 + 0 
50ee : d0 06 __ BNE $50f6 ; (menu_main.s31 + 0)
.s32:
50f0 : a9 04 __ LDA #$04
50f2 : 85 53 __ STA T0 + 0 
50f4 : d0 13 __ BNE $5109 ; (menu_main.s27 + 0)
.s31:
50f6 : c9 13 __ CMP #$13
50f8 : d0 0f __ BNE $5109 ; (menu_main.s27 + 0)
.s35:
50fa : e6 53 __ INC T0 + 0 
50fc : a5 53 __ LDA T0 + 0 
50fe : c9 05 __ CMP #$05
5100 : 90 03 __ BCC $5105 ; (menu_main.s63 + 0)
5102 : 4c 22 50 JMP $5022 ; (menu_main.l84 + 0)
.s63:
5105 : a9 00 __ LDA #$00
5107 : 85 55 __ STA T3 + 0 
.s27:
5109 : a5 55 __ LDA T3 + 0 
510b : d0 03 __ BNE $5110 ; (menu_main.s2 + 0)
510d : 4c 26 50 JMP $5026 ; (menu_main.l3 + 0)
.s2:
5110 : a5 53 __ LDA T0 + 0 
5112 : 0a __ __ ASL
5113 : 0a __ __ ASL
5114 : 18 __ __ CLC
5115 : 65 53 __ ADC T0 + 0 
5117 : 0a __ __ ASL
5118 : 18 __ __ CLC
5119 : 65 55 __ ADC T3 + 0 
511b : 85 1b __ STA ACCU + 0 
.s1001:
511d : a2 03 __ LDX #$03
511f : bd c6 ab LDA $abc6,x ; (buff + 30)
5122 : 95 53 __ STA T0 + 0,x 
5124 : ca __ __ DEX
5125 : 10 f8 __ BPL $511f ; (menu_main.s1001 + 2)
5127 : 60 __ __ RTS
.s11:
5128 : c6 53 __ DEC T0 + 0 
512a : f0 03 __ BEQ $512f ; (menu_main.s14 + 0)
512c : 4c aa 50 JMP $50aa ; (menu_main.s13 + 0)
.s14:
512f : a9 04 __ LDA #$04
5131 : 4c a8 50 JMP $50a8 ; (menu_main.s1039 + 0)
--------------------------------------------------------------------
menu_placebar: ; menu_placebar(u8)->void
.s0:
5134 : a9 00 __ LDA #$00
5136 : 85 0f __ STA P2 
5138 : a9 20 __ LDA #$20
513a : 85 11 __ STA P4 
513c : a9 c4 __ LDA #$c4
513e : 85 12 __ STA P5 
5140 : a9 50 __ LDA #$50
5142 : 85 13 __ STA P6 
5144 : a5 14 __ LDA P7 ; (y + 0)
5146 : 8d e0 5a STA $5ae0 ; (menubar + 52)
5149 : 85 10 __ STA P3 
514b : 20 a9 2d JSR $2da9 ; (vdc_hchar.s0 + 0)
514e : a9 01 __ LDA #$01
5150 : 85 49 __ STA T1 + 0 
5152 : a0 00 __ LDY #$00
5154 : 84 4a __ STY T2 + 0 
.l2:
5156 : b9 ef 55 LDA $55ef,y ; (__multab12L + 0)
5159 : 18 __ __ CLC
515a : 69 ac __ ADC #$ac
515c : 85 0d __ STA P0 
515e : a9 5a __ LDA #$5a
5160 : 69 00 __ ADC #$00
5162 : 85 0e __ STA P1 
5164 : 20 db 32 JSR $32db ; (strlen.s0 + 0)
5167 : a5 0d __ LDA P0 
5169 : 85 11 __ STA P4 
516b : a5 0e __ LDA P1 
516d : 85 12 __ STA P5 
516f : a9 c4 __ LDA #$c4
5171 : 85 13 __ STA P6 
5173 : a5 1b __ LDA ACCU + 0 
5175 : 85 4b __ STA T4 + 0 
5177 : 18 __ __ CLC
5178 : 65 49 __ ADC T1 + 0 
517a : 85 43 __ STA T5 + 0 
517c : a9 00 __ LDA #$00
517e : 2a __ __ ROL
517f : 85 44 __ STA T5 + 1 
5181 : ad db 5b LDA $5bdb ; (vdc_state + 3)
5184 : 38 __ __ SEC
5185 : e9 01 __ SBC #$01
5187 : a8 __ __ TAY
5188 : ad dc 5b LDA $5bdc ; (vdc_state + 4)
518b : e9 00 __ SBC #$00
518d : c5 44 __ CMP T5 + 1 
518f : d0 02 __ BNE $5193 ; (menu_placebar.s1005 + 0)
.s1004:
5191 : c4 43 __ CPY T5 + 0 
.s1005:
5193 : 90 04 __ BCC $5199 ; (menu_placebar.s5 + 0)
.s7:
5195 : a5 49 __ LDA T1 + 0 
5197 : b0 04 __ BCS $519d ; (menu_placebar.s1006 + 0)
.s5:
5199 : 98 __ __ TYA
519a : 38 __ __ SEC
519b : e5 1b __ SBC ACCU + 0 
.s1006:
519d : 85 0f __ STA P2 
519f : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
51a2 : a5 0f __ LDA P2 
51a4 : a4 4a __ LDY T2 + 0 
51a6 : c8 __ __ INY
51a7 : 84 4a __ STY T2 + 0 
51a9 : 99 db 5a STA $5adb,y ; (menubar + 47)
51ac : a5 4b __ LDA T4 + 0 
51ae : 38 __ __ SEC
51af : 65 0f __ ADC P2 
51b1 : 85 49 __ STA T1 + 0 
51b3 : c0 04 __ CPY #$04
51b5 : 90 9f __ BCC $5156 ; (menu_placebar.l2 + 0)
.s1001:
51b7 : 60 __ __ RTS
--------------------------------------------------------------------
menu_pulldown: ; menu_pulldown(u8,u8,u8,u8)->u8
.s1000:
51b8 : a2 08 __ LDX #$08
51ba : b5 53 __ LDA T1 + 0,x 
51bc : 9d cb ab STA $abcb,x ; (buff + 35)
51bf : ca __ __ DEX
51c0 : 10 f8 __ BPL $51ba ; (menu_pulldown.s1000 + 2)
51c2 : 38 __ __ SEC
51c3 : a5 23 __ LDA SP + 0 
51c5 : e9 0a __ SBC #$0a
51c7 : 85 23 __ STA SP + 0 
51c9 : b0 02 __ BCS $51cd ; (menu_pulldown.s0 + 0)
51cb : c6 24 __ DEC SP + 1 
.s0:
51cd : a9 54 __ LDA #$54
51cf : ae fd ab LDX $abfd ; (sstack + 7)
51d2 : 86 52 __ STX T0 + 0 
51d4 : 18 __ __ CLC
51d5 : 7d f4 55 ADC $55f4,x ; (__multab96L + 0)
51d8 : 85 54 __ STA T2 + 0 
51da : 85 0d __ STA P0 
51dc : a9 58 __ LDA #$58
51de : 7d fa 55 ADC $55fa,x ; (__multab96H + 0)
51e1 : 85 55 __ STA T2 + 1 
51e3 : 85 0e __ STA P1 
51e5 : 20 db 32 JSR $32db ; (strlen.s0 + 0)
51e8 : a6 52 __ LDX T0 + 0 
51ea : bd 94 5a LDA $5a94,x ; (pulldown_options + 0)
51ed : 85 57 __ STA T4 + 0 
51ef : 8d f8 ab STA $abf8 ; (sstack + 2)
51f2 : e0 04 __ CPX #$04
51f4 : 90 08 __ BCC $51fe ; (menu_pulldown.s77 + 0)
.s76:
51f6 : a9 00 __ LDA #$00
51f8 : 85 53 __ STA T1 + 0 
51fa : a9 f0 __ LDA #$f0
51fc : b0 06 __ BCS $5204 ; (menu_pulldown.s81 + 0)
.s77:
51fe : a9 01 __ LDA #$01
5200 : 85 53 __ STA T1 + 0 
5202 : a9 70 __ LDA #$70
.s81:
5204 : 85 17 __ STA P10 
5206 : ad fb ab LDA $abfb ; (sstack + 5)
5209 : 85 52 __ STA T0 + 0 
520b : 85 18 __ STA P11 
520d : ad fc ab LDA $abfc ; (sstack + 6)
5210 : 85 56 __ STA T3 + 0 
5212 : 8d f6 ab STA $abf6 ; (sstack + 0)
5215 : 18 __ __ CLC
5216 : a5 1b __ LDA ACCU + 0 
5218 : 69 02 __ ADC #$02
521a : 8d f7 ab STA $abf7 ; (sstack + 1)
521d : 20 02 34 JSR $3402 ; (vdcwin_win_new.s1000 + 0)
5220 : a9 01 __ LDA #$01
5222 : 85 59 __ STA T6 + 0 
5224 : a5 57 __ LDA T4 + 0 
5226 : f0 5c __ BEQ $5284 ; (menu_pulldown.l5 + 0)
.s58:
5228 : a9 00 __ LDA #$00
522a : 85 58 __ STA T5 + 0 
522c : 85 5a __ STA T8 + 0 
522e : 85 5b __ STA T8 + 1 
5230 : 18 __ __ CLC
.l1048:
5231 : a9 00 __ LDA #$00
5233 : a0 02 __ LDY #$02
5235 : 91 23 __ STA (SP + 0),y 
5237 : a9 5d __ LDA #$5d
5239 : c8 __ __ INY
523a : 91 23 __ STA (SP + 0),y 
523c : a9 fa __ LDA #$fa
523e : c8 __ __ INY
523f : 91 23 __ STA (SP + 0),y 
5241 : a9 53 __ LDA #$53
5243 : c8 __ __ INY
5244 : 91 23 __ STA (SP + 0),y 
5246 : a5 54 __ LDA T2 + 0 
5248 : 65 5a __ ADC T8 + 0 
524a : c8 __ __ INY
524b : 91 23 __ STA (SP + 0),y 
524d : a5 55 __ LDA T2 + 1 
524f : 65 5b __ ADC T8 + 1 
5251 : c8 __ __ INY
5252 : 91 23 __ STA (SP + 0),y 
5254 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
5257 : a5 52 __ LDA T0 + 0 
5259 : 85 0f __ STA P2 
525b : a9 00 __ LDA #$00
525d : 85 11 __ STA P4 
525f : a9 5d __ LDA #$5d
5261 : 85 12 __ STA P5 
5263 : a9 c6 __ LDA #$c6
5265 : 85 13 __ STA P6 
5267 : 18 __ __ CLC
5268 : a5 58 __ LDA T5 + 0 
526a : 65 56 __ ADC T3 + 0 
526c : 85 10 __ STA P3 
526e : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
5271 : 18 __ __ CLC
5272 : a5 5a __ LDA T8 + 0 
5274 : 69 10 __ ADC #$10
5276 : 85 5a __ STA T8 + 0 
5278 : 90 02 __ BCC $527c ; (menu_pulldown.s1051 + 0)
.s1050:
527a : e6 5b __ INC T8 + 1 
.s1051:
527c : e6 58 __ INC T5 + 0 
527e : a5 58 __ LDA T5 + 0 
5280 : c5 57 __ CMP T4 + 0 
5282 : 90 ad __ BCC $5231 ; (menu_pulldown.l1048 + 0)
.l5:
5284 : a9 2d __ LDA #$2d
5286 : a0 06 __ LDY #$06
5288 : 91 23 __ STA (SP + 0),y 
528a : a9 00 __ LDA #$00
528c : c8 __ __ INY
528d : 91 23 __ STA (SP + 0),y 
528f : a9 00 __ LDA #$00
5291 : a0 02 __ LDY #$02
5293 : 91 23 __ STA (SP + 0),y 
5295 : a9 5d __ LDA #$5d
5297 : c8 __ __ INY
5298 : 91 23 __ STA (SP + 0),y 
529a : a9 00 __ LDA #$00
529c : c8 __ __ INY
529d : 91 23 __ STA (SP + 0),y 
529f : a9 54 __ LDA #$54
52a1 : c8 __ __ INY
52a2 : 91 23 __ STA (SP + 0),y 
52a4 : a5 59 __ LDA T6 + 0 
52a6 : 0a __ __ ASL
52a7 : 2a __ __ ROL
52a8 : 2a __ __ ROL
52a9 : 2a __ __ ROL
52aa : a8 __ __ TAY
52ab : 29 07 __ AND #$07
52ad : 2a __ __ ROL
52ae : aa __ __ TAX
52af : 98 __ __ TYA
52b0 : 29 f0 __ AND #$f0
52b2 : 38 __ __ SEC
52b3 : e9 10 __ SBC #$10
52b5 : b0 01 __ BCS $52b8 ; (menu_pulldown.s1053 + 0)
.s1052:
52b7 : ca __ __ DEX
.s1053:
52b8 : 18 __ __ CLC
52b9 : 65 54 __ ADC T2 + 0 
52bb : a0 08 __ LDY #$08
52bd : 91 23 __ STA (SP + 0),y 
52bf : 8a __ __ TXA
52c0 : 65 55 __ ADC T2 + 1 
52c2 : c8 __ __ INY
52c3 : 91 23 __ STA (SP + 0),y 
52c5 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
52c8 : a9 00 __ LDA #$00
52ca : 85 11 __ STA P4 
52cc : a9 5d __ LDA #$5d
52ce : 85 12 __ STA P5 
52d0 : a9 cd __ LDA #$cd
52d2 : 85 13 __ STA P6 
52d4 : ad fb ab LDA $abfb ; (sstack + 5)
52d7 : 85 0f __ STA P2 
52d9 : ad fc ab LDA $abfc ; (sstack + 6)
52dc : 85 56 __ STA T3 + 0 
52de : 18 __ __ CLC
52df : 65 59 __ ADC T6 + 0 
52e1 : 38 __ __ SEC
52e2 : e9 01 __ SBC #$01
52e4 : 85 10 __ STA P3 
52e6 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
.l7:
52e9 : 20 2a 38 JSR $382a ; (vdcwin_getch.s0 + 0)
52ec : a5 1b __ LDA ACCU + 0 
52ee : 85 5a __ STA T8 + 0 
52f0 : c9 0d __ CMP #$0d
52f2 : f0 18 __ BEQ $530c ; (menu_pulldown.s8 + 0)
.s14:
52f4 : c9 9d __ CMP #$9d
52f6 : f0 14 __ BEQ $530c ; (menu_pulldown.s8 + 0)
.s13:
52f8 : c9 1d __ CMP #$1d
52fa : f0 10 __ BEQ $530c ; (menu_pulldown.s8 + 0)
.s12:
52fc : c9 91 __ CMP #$91
52fe : f0 0c __ BEQ $530c ; (menu_pulldown.s8 + 0)
.s11:
5300 : c9 11 __ CMP #$11
5302 : f0 08 __ BEQ $530c ; (menu_pulldown.s8 + 0)
.s10:
5304 : c9 1b __ CMP #$1b
5306 : f0 04 __ BEQ $530c ; (menu_pulldown.s8 + 0)
.s9:
5308 : c9 03 __ CMP #$03
530a : d0 dd __ BNE $52e9 ; (menu_pulldown.l7 + 0)
.s8:
530c : a5 1b __ LDA ACCU + 0 
530e : c9 1b __ CMP #$1b
5310 : d0 03 __ BNE $5315 ; (menu_pulldown.s42 + 0)
5312 : 4c eb 53 JMP $53eb ; (menu_pulldown.s16 + 0)
.s42:
5315 : b0 03 __ BCS $531a ; (menu_pulldown.s43 + 0)
5317 : 4c db 53 JMP $53db ; (menu_pulldown.s44 + 0)
.s43:
531a : c9 91 __ CMP #$91
531c : f0 43 __ BEQ $5361 ; (menu_pulldown.s29 + 0)
.s50:
531e : b0 2f __ BCS $534f ; (menu_pulldown.s51 + 0)
.s52:
5320 : c9 1d __ CMP #$1d
5322 : f0 03 __ BEQ $5327 ; (menu_pulldown.s25 + 0)
5324 : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s25:
5327 : a5 53 __ LDA T1 + 0 
5329 : d0 03 __ BNE $532e ; (menu_pulldown.s26 + 0)
532b : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s26:
532e : a9 13 __ LDA #$13
.s1047:
5330 : 85 59 __ STA T6 + 0 
.s6:
5332 : 20 38 38 JSR $3838 ; (vdcwin_win_free.s0 + 0)
5335 : a5 59 __ LDA T6 + 0 
5337 : 85 1b __ STA ACCU + 0 
.s1001:
5339 : 18 __ __ CLC
533a : a5 23 __ LDA SP + 0 
533c : 69 0a __ ADC #$0a
533e : 85 23 __ STA SP + 0 
5340 : 90 02 __ BCC $5344 ; (menu_pulldown.s1001 + 11)
5342 : e6 24 __ INC SP + 1 
5344 : a2 08 __ LDX #$08
5346 : bd cb ab LDA $abcb,x ; (buff + 35)
5349 : 95 53 __ STA T1 + 0,x 
534b : ca __ __ DEX
534c : 10 f8 __ BPL $5346 ; (menu_pulldown.s1001 + 13)
534e : 60 __ __ RTS
.s51:
534f : c9 9d __ CMP #$9d
5351 : f0 03 __ BEQ $5356 ; (menu_pulldown.s21 + 0)
5353 : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s21:
5356 : a5 53 __ LDA T1 + 0 
5358 : d0 03 __ BNE $535d ; (menu_pulldown.s22 + 0)
535a : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s22:
535d : a9 12 __ LDA #$12
535f : d0 cf __ BNE $5330 ; (menu_pulldown.s1047 + 0)
.s29:
5361 : a9 00 __ LDA #$00
5363 : a0 02 __ LDY #$02
5365 : 91 23 __ STA (SP + 0),y 
5367 : a9 5d __ LDA #$5d
5369 : c8 __ __ INY
536a : 91 23 __ STA (SP + 0),y 
536c : a9 fa __ LDA #$fa
536e : c8 __ __ INY
536f : 91 23 __ STA (SP + 0),y 
5371 : a9 53 __ LDA #$53
5373 : c8 __ __ INY
5374 : 91 23 __ STA (SP + 0),y 
5376 : a5 59 __ LDA T6 + 0 
5378 : 0a __ __ ASL
5379 : 2a __ __ ROL
537a : 2a __ __ ROL
537b : 2a __ __ ROL
537c : a8 __ __ TAY
537d : 29 07 __ AND #$07
537f : 2a __ __ ROL
5380 : aa __ __ TAX
5381 : 98 __ __ TYA
5382 : 29 f0 __ AND #$f0
5384 : 38 __ __ SEC
5385 : e9 10 __ SBC #$10
5387 : b0 01 __ BCS $538a ; (menu_pulldown.s1055 + 0)
.s1054:
5389 : ca __ __ DEX
.s1055:
538a : 18 __ __ CLC
538b : 65 54 __ ADC T2 + 0 
538d : a0 06 __ LDY #$06
538f : 91 23 __ STA (SP + 0),y 
5391 : 8a __ __ TXA
5392 : 65 55 __ ADC T2 + 1 
5394 : c8 __ __ INY
5395 : 91 23 __ STA (SP + 0),y 
5397 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
539a : a9 00 __ LDA #$00
539c : 85 11 __ STA P4 
539e : a9 5d __ LDA #$5d
53a0 : 85 12 __ STA P5 
53a2 : a9 c6 __ LDA #$c6
53a4 : 85 13 __ STA P6 
53a6 : ad fb ab LDA $abfb ; (sstack + 5)
53a9 : 85 0f __ STA P2 
53ab : 18 __ __ CLC
53ac : a5 59 __ LDA T6 + 0 
53ae : 65 56 __ ADC T3 + 0 
53b0 : 38 __ __ SEC
53b1 : e9 01 __ SBC #$01
53b3 : 85 10 __ STA P3 
53b5 : 20 3a 32 JSR $323a ; (vdc_prints_attr.s0 + 0)
53b8 : a5 5a __ LDA T8 + 0 
53ba : c9 91 __ CMP #$91
53bc : d0 0e __ BNE $53cc ; (menu_pulldown.s31 + 0)
.s30:
53be : c6 59 __ DEC T6 + 0 
53c0 : f0 03 __ BEQ $53c5 ; (menu_pulldown.s33 + 0)
53c2 : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s33:
53c5 : a5 57 __ LDA T4 + 0 
.s1046:
53c7 : 85 59 __ STA T6 + 0 
53c9 : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s31:
53cc : e6 59 __ INC T6 + 0 
53ce : a5 57 __ LDA T4 + 0 
53d0 : c5 59 __ CMP T6 + 0 
53d2 : 90 03 __ BCC $53d7 ; (menu_pulldown.s36 + 0)
53d4 : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s36:
53d7 : a9 01 __ LDA #$01
53d9 : 90 ec __ BCC $53c7 ; (menu_pulldown.s1046 + 0)
.s44:
53db : c9 0d __ CMP #$0d
53dd : d0 03 __ BNE $53e2 ; (menu_pulldown.s45 + 0)
53df : 4c 32 53 JMP $5332 ; (menu_pulldown.s6 + 0)
.s45:
53e2 : b0 0c __ BCS $53f0 ; (menu_pulldown.s46 + 0)
.s47:
53e4 : c9 03 __ CMP #$03
53e6 : f0 03 __ BEQ $53eb ; (menu_pulldown.s16 + 0)
53e8 : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
.s16:
53eb : a9 00 __ LDA #$00
53ed : 4c 30 53 JMP $5330 ; (menu_pulldown.s1047 + 0)
.s46:
53f0 : c9 11 __ CMP #$11
53f2 : d0 03 __ BNE $53f7 ; (menu_pulldown.s46 + 7)
53f4 : 4c 61 53 JMP $5361 ; (menu_pulldown.s29 + 0)
53f7 : 4c 84 52 JMP $5284 ; (menu_pulldown.l5 + 0)
--------------------------------------------------------------------
53fa : __ __ __ BYT 20 25 53 20 00                                  :  %S .
--------------------------------------------------------------------
bootdevice:
53ff : __ __ __ BSS	1
--------------------------------------------------------------------
5400 : __ __ __ BYT 25 43 25 53 20 00                               : %C%S .
--------------------------------------------------------------------
5406 : __ __ __ BYT 75 4e 44 4f 3a 20 25 53 00                      : uNDO: %S.
--------------------------------------------------------------------
540f : __ __ __ BYT 65 4e 41 42 4c 45 44 20 20 00                   : eNABLED  .
--------------------------------------------------------------------
5419 : __ __ __ BYT 64 49 53 41 42 4c 45 44 20 00                   : dISABLED .
--------------------------------------------------------------------
restorealtcharset: ; restorealtcharset()->void
.s0:
5423 : ad fa 5a LDA $5afa ; (charsetchanged + 1)
5426 : c9 01 __ CMP #$01
5428 : f0 01 __ BEQ $542b ; (restorealtcharset.s1 + 0)
.s1001:
542a : 60 __ __ RTS
.s1:
542b : a9 7f __ LDA #$7f
542d : 85 11 __ STA P4 
542f : a9 01 __ LDA #$01
5431 : 85 15 __ STA P8 
5433 : ad ea 5b LDA $5bea ; (vdc_state + 18)
5436 : 85 0f __ STA P2 
5438 : ad eb 5b LDA $5beb ; (vdc_state + 19)
543b : 85 10 __ STA P3 
543d : a9 00 __ LDA #$00
543f : 85 14 __ STA P7 
5441 : 85 12 __ STA P5 
5443 : 4c 00 13 JMP $1300 ; (bnk_redef_charset@proxy + 0)
--------------------------------------------------------------------
togglestatusbar: ; togglestatusbar()->void
.s0:
5446 : ac dd 5b LDY $5bdd ; (vdc_state + 5)
5449 : 88 __ __ DEY
544a : ad ff 5a LDA $5aff ; (screen_row + 1)
544d : d0 05 __ BNE $5454 ; (togglestatusbar.s3 + 0)
.s1002:
544f : cc fe 5a CPY $5afe ; (screen_row + 0)
5452 : f0 15 __ BEQ $5469 ; (togglestatusbar.s1001 + 0)
.s3:
5454 : ad ff 5b LDA $5bff ; (showbar + 0)
5457 : d0 08 __ BNE $5461 ; (togglestatusbar.s5 + 0)
.s6:
5459 : a9 01 __ LDA #$01
545b : 8d ff 5b STA $5bff ; (showbar + 0)
545e : 4c 81 3b JMP $3b81 ; (initstatusbar.s1000 + 0)
.s5:
5461 : a9 00 __ LDA #$00
5463 : 8d ff 5b STA $5bff ; (showbar + 0)
5466 : 4c ea 57 JMP $57ea ; (vdcwin_cpy_viewport@proxy + 0)
.s1001:
5469 : 60 __ __ RTS
--------------------------------------------------------------------
helpscreen_load: ; helpscreen_load(u8)->void
.s1000:
546a : a5 53 __ LDA T0 + 0 
546c : 8d d0 ab STA $abd0 ; (buff + 40)
546f : 38 __ __ SEC
5470 : a5 23 __ LDA SP + 0 
5472 : e9 08 __ SBC #$08
5474 : 85 23 __ STA SP + 0 
5476 : b0 02 __ BCS $547a ; (helpscreen_load.s0 + 0)
5478 : c6 24 __ DEC SP + 1 
.s0:
547a : ad fa 5a LDA $5afa ; (charsetchanged + 1)
547d : c9 01 __ CMP #$01
547f : d0 1b __ BNE $549c ; (helpscreen_load.s3 + 0)
.s1:
5481 : a9 7f __ LDA #$7f
5483 : 85 11 __ STA P4 
5485 : a9 01 __ LDA #$01
5487 : 85 15 __ STA P8 
5489 : ad ea 5b LDA $5bea ; (vdc_state + 18)
548c : 85 0f __ STA P2 
548e : ad eb 5b LDA $5beb ; (vdc_state + 19)
5491 : 85 10 __ STA P3 
5493 : a9 00 __ LDA #$00
5495 : 85 14 __ STA P7 
5497 : 85 12 __ STA P5 
5499 : 20 6d 15 JSR $156d ; (bnk_redef_charset@proxy + 0)
.s3:
549c : ad da 5b LDA $5bda ; (vdc_state + 2)
549f : 85 53 __ STA T0 + 0 
54a1 : a9 1a __ LDA #$1a
54a3 : 8d 00 d6 STA $d600 
.l138:
54a6 : 2c 00 d6 BIT $d600 
54a9 : 10 fb __ BPL $54a6 ; (helpscreen_load.l138 + 0)
.s10:
54ab : ad 01 d6 LDA $d601 
54ae : 29 f0 __ AND #$f0
54b0 : a2 1a __ LDX #$1a
54b2 : 8e 00 d6 STX $d600 
.l140:
54b5 : 2c 00 d6 BIT $d600 
54b8 : 10 fb __ BPL $54b5 ; (helpscreen_load.l140 + 0)
.s16:
54ba : 8d 01 d6 STA $d601 
54bd : a5 53 __ LDA T0 + 0 
54bf : f0 03 __ BEQ $54c4 ; (helpscreen_load.s19 + 0)
.s17:
54c1 : 20 09 2f JSR $2f09 ; (vdc_set_mode@proxy + 0)
.s19:
54c4 : a9 01 __ LDA #$01
54c6 : a0 06 __ LDY #$06
54c8 : 91 23 __ STA (SP + 0),y 
54ca : a9 00 __ LDA #$00
54cc : c8 __ __ INY
54cd : 91 23 __ STA (SP + 0),y 
54cf : a9 51 __ LDA #$51
54d1 : a0 02 __ LDY #$02
54d3 : 91 23 __ STA (SP + 0),y 
54d5 : a9 5d __ LDA #$5d
54d7 : c8 __ __ INY
54d8 : 91 23 __ STA (SP + 0),y 
54da : a9 9a __ LDA #$9a
54dc : c8 __ __ INY
54dd : 91 23 __ STA (SP + 0),y 
54df : a9 55 __ LDA #$55
54e1 : c8 __ __ INY
54e2 : 91 23 __ STA (SP + 0),y 
54e4 : 20 cd 2b JSR $2bcd ; (sprintf.s0 + 0)
54e7 : a9 7f __ LDA #$7f
54e9 : 85 10 __ STA P3 
54eb : a9 51 __ LDA #$51
54ed : 85 13 __ STA P6 
54ef : a9 5d __ LDA #$5d
54f1 : 85 14 __ STA P7 
54f3 : ad ff 53 LDA $53ff ; (bootdevice + 0)
54f6 : 85 0f __ STA P2 
54f8 : a9 20 __ LDA #$20
54fa : 85 12 __ STA P5 
54fc : 20 5f 13 JSR $135f ; (bnk_load@proxy + 0)
54ff : a5 1b __ LDA ACCU + 0 
5501 : d0 06 __ BNE $5509 ; (helpscreen_load.s20 + 0)
.s21:
5503 : 20 a5 55 JSR $55a5 ; (menu_messagepopup.s0 + 0)
5506 : 4c 10 55 JMP $5510 ; (helpscreen_load.s144 + 0)
.s20:
5509 : a9 20 __ LDA #$20
550b : 85 13 __ STA P6 
550d : 20 26 15 JSR $1526 ; (bnk_cpytovdc@proxy + 0)
.s144:
5510 : 20 a7 2e JSR $2ea7 ; (getch.s0 + 0)
5513 : a5 53 __ LDA T0 + 0 
5515 : f0 05 __ BEQ $551c ; (helpscreen_load.s25 + 0)
.s23:
5517 : 85 16 __ STA P9 
5519 : 20 0d 2f JSR $2f0d ; (vdc_set_mode.s0 + 0)
.s25:
551c : a9 1a __ LDA #$1a
551e : 8d 00 d6 STA $d600 
.l145:
5521 : 2c 00 d6 BIT $d600 
5524 : 10 fb __ BPL $5521 ; (helpscreen_load.l145 + 0)
.s32:
5526 : ad 01 d6 LDA $d601 
5529 : 29 f0 __ AND #$f0
552b : 18 __ __ CLC
552c : 6d f3 5b ADC $5bf3 ; (screenbackground + 0)
552f : a2 1a __ LDX #$1a
5531 : 8e 00 d6 STX $d600 
.l147:
5534 : 2c 00 d6 BIT $d600 
5537 : 10 fb __ BPL $5534 ; (helpscreen_load.l147 + 0)
.s38:
5539 : 8d 01 d6 STA $d601 
553c : 20 ea 57 JSR $57ea ; (vdcwin_cpy_viewport@proxy + 0)
553f : ad ff 5b LDA $5bff ; (showbar + 0)
5542 : f0 03 __ BEQ $5547 ; (helpscreen_load.s42 + 0)
.s39:
5544 : 20 81 3b JSR $3b81 ; (initstatusbar.s1000 + 0)
.s42:
5547 : ad fc 5a LDA $5afc ; (screen_col + 0)
554a : 8d 08 5b STA $5b08 ; (vdc_modes + 8)
554d : 85 0e __ STA P1 
554f : ad fe 5a LDA $5afe ; (screen_row + 0)
5552 : 8d 09 5b STA $5b09 ; (vdc_modes + 9)
5555 : 85 0d __ STA P0 
5557 : ad f4 5b LDA $5bf4 ; (plotscreencode + 0)
555a : 85 0f __ STA P2 
555c : ad df 5b LDA $5bdf ; (vdc_state + 7)
555f : 85 10 __ STA P3 
5561 : 20 86 37 JSR $3786 ; (vdc_printc.s0 + 0)
5564 : 20 fb 3a JSR $3afb ; (vdcwin_cursor_show@proxy + 0)
5567 : ad fa 5a LDA $5afa ; (charsetchanged + 1)
556a : c9 01 __ CMP #$01
556c : d0 1b __ BNE $5589 ; (helpscreen_load.s1001 + 0)
.s46:
556e : a9 7f __ LDA #$7f
5570 : 85 11 __ STA P4 
5572 : a9 01 __ LDA #$01
5574 : 85 15 __ STA P8 
5576 : ad ea 5b LDA $5bea ; (vdc_state + 18)
5579 : 85 0f __ STA P2 
557b : ad eb 5b LDA $5beb ; (vdc_state + 19)
557e : 85 10 __ STA P3 
5580 : a9 00 __ LDA #$00
5582 : 85 14 __ STA P7 
5584 : 85 12 __ STA P5 
5586 : 20 00 13 JSR $1300 ; (bnk_redef_charset@proxy + 0)
.s1001:
5589 : 18 __ __ CLC
558a : a5 23 __ LDA SP + 0 
558c : 69 08 __ ADC #$08
558e : 85 23 __ STA SP + 0 
5590 : 90 02 __ BCC $5594 ; (helpscreen_load.s1001 + 11)
5592 : e6 24 __ INC SP + 1 
5594 : ad d0 ab LDA $abd0 ; (buff + 40)
5597 : 85 53 __ STA T0 + 0 
5599 : 60 __ __ RTS
--------------------------------------------------------------------
559a : __ __ __ BYT 56 44 43 53 45 48 53 43 25 55 00                : VDCSEHSC%U.
--------------------------------------------------------------------
menu_messagepopup: ; menu_messagepopup(const u8*)->void
.s0:
55a5 : a9 f0 __ LDA #$f0
55a7 : 85 17 __ STA P10 
55a9 : a9 08 __ LDA #$08
55ab : 85 18 __ STA P11 
55ad : 8d f6 ab STA $abf6 ; (sstack + 0)
55b0 : a9 1e __ LDA #$1e
55b2 : 8d f7 ab STA $abf7 ; (sstack + 1)
55b5 : a9 06 __ LDA #$06
55b7 : 8d f8 ab STA $abf8 ; (sstack + 2)
55ba : ad df 5b LDA $5bdf ; (vdc_state + 7)
55bd : 85 52 __ STA T0 + 0 
55bf : a9 8d __ LDA #$8d
55c1 : 8d df 5b STA $5bdf ; (vdc_state + 7)
55c4 : 20 02 34 JSR $3402 ; (vdcwin_win_new.s1000 + 0)
55c7 : a9 00 __ LDA #$00
55c9 : 85 11 __ STA P4 
55cb : a9 56 __ LDA #$56
55cd : 85 12 __ STA P5 
55cf : 20 16 58 JSR $5816 ; (vdc_prints_attr@proxy + 0)
55d2 : a9 0b __ LDA #$0b
55d4 : 85 10 __ STA P3 
55d6 : 20 0b 58 JSR $580b ; (vdc_prints_attr@proxy + 0)
55d9 : 20 2a 38 JSR $382a ; (vdcwin_getch.s0 + 0)
55dc : 20 38 38 JSR $3838 ; (vdcwin_win_free.s0 + 0)
55df : a5 52 __ LDA T0 + 0 
55e1 : 8d df 5b STA $5bdf ; (vdc_state + 7)
.s1001:
55e4 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
55e5 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
__multab13L:
55eb : __ __ __ BYT 00 0d 1a 27                                     : ...'
--------------------------------------------------------------------
__multab12L:
55ef : __ __ __ BYT 00 0c 18 24 30                                  : ...$0
--------------------------------------------------------------------
__multab96L:
55f4 : __ __ __ BYT 00 60 c0 20 80 e0                               : .`. ..
--------------------------------------------------------------------
__multab96H:
55fa : __ __ __ BYT 00 00 00 01 01 01                               : ......
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
vdcwin_cpy_viewport@proxy: ; vdcwin_cpy_viewport@proxy
57ea : a9 f9 __ LDA #$f9
57ec : 85 16 __ STA P9 
57ee : a9 5a __ LDA #$5a
57f0 : 85 17 __ STA P10 
57f2 : 4c fc 41 JMP $41fc ; (vdcwin_cpy_viewport.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
57f5 : a5 4c __ LDA $4c 
57f7 : 85 11 __ STA P4 
57f9 : a5 4d __ LDA $4d 
57fb : 85 12 __ STA P5 
57fd : 4c 4a 44 JMP $444a ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_block_copy@proxy: ; vdc_block_copy@proxy
5800 : a5 53 __ LDA $53 
5802 : 85 11 __ STA P4 
5804 : a5 54 __ LDA $54 
5806 : 85 12 __ STA P5 
5808 : 4c 4a 44 JMP $444a ; (vdc_block_copy.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
580b : a9 1f __ LDA #$1f
580d : 85 11 __ STA P4 
580f : a9 38 __ LDA #$38
5811 : 85 12 __ STA P5 
5813 : 4c 3a 32 JMP $323a ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
5816 : a9 0a __ LDA #$0a
5818 : 85 0f __ STA P2 
581a : a9 09 __ LDA #$09
581c : 85 10 __ STA P3 
581e : a9 8d __ LDA #$8d
5820 : 85 13 __ STA P6 
5822 : 4c 3a 32 JMP $323a ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_prints_attr@proxy: ; vdc_prints_attr@proxy
5825 : a5 4e __ LDA $4e 
5827 : 85 0f __ STA P2 
5829 : a9 51 __ LDA #$51
582b : 85 11 __ STA P4 
582d : a9 5d __ LDA #$5d
582f : 85 12 __ STA P5 
5831 : a5 51 __ LDA $51 
5833 : 85 13 __ STA P6 
5835 : 4c 3a 32 JMP $323a ; (vdc_prints_attr.s0 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
5838 : a5 44 __ LDA $44 
583a : 85 0e __ STA P1 
583c : 4c 58 2e JMP $2e58 ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
vdcwin_init@proxy: ; vdcwin_init@proxy
583f : a9 db __ LDA #$db
5841 : 85 0d __ STA P0 
5843 : a9 ab __ LDA #$ab
5845 : 85 0e __ STA P1 
5847 : ad 04 5b LDA $5b04 ; (vdc_modes + 4)
584a : 85 0f __ STA P2 
584c : ad 05 5b LDA $5b05 ; (vdc_modes + 5)
584f : 85 10 __ STA P3 
5851 : 4c 64 2b JMP $2b64 ; (vdcwin_init.s0 + 0)
--------------------------------------------------------------------
pulldown_titles:
5854 : __ __ __ BYT 77 49 44 54 48 3a 20 20 20 20 20 20 38 30 20 00 : wIDTH:      80 .
5864 : __ __ __ BYT 68 45 49 47 48 54 3a 20 20 20 20 20 32 35 20 00 : hEIGHT:     25 .
5874 : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 3a 20 20 30 20 00 : bACKGROUND:  0 .
5884 : __ __ __ BYT 73 43 52 45 45 4e 4d 4f 44 45 20 20 20 20 20 00 : sCREENMODE     .
5894 : __ __ __ BYT 63 4c 45 41 52 20 20 20 20 20 20 20 20 20 20 00 : cLEAR          .
58a4 : __ __ __ BYT 66 49 4c 4c 20 20 20 20 20 20 20 20 20 20 20 00 : fILL           .
58b4 : __ __ __ BYT 73 41 56 45 20 53 43 52 45 45 4e 20 20 20 20 00 : sAVE SCREEN    .
58c4 : __ __ __ BYT 6c 4f 41 44 20 53 43 52 45 45 4e 20 20 20 20 00 : lOAD SCREEN    .
58d4 : __ __ __ BYT 73 41 56 45 20 50 52 4f 4a 45 43 54 20 20 20 00 : sAVE PROJECT   .
58e4 : __ __ __ BYT 6c 4f 41 44 20 50 52 4f 4a 45 43 54 20 20 20 00 : lOAD PROJECT   .
58f4 : __ __ __ BYT 69 4d 50 4f 52 54 20 20 20 20 20 20 20 20 20 00 : iMPORT         .
5904 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5914 : __ __ __ BYT 6c 4f 41 44 20 53 54 41 4e 44 41 52 44 20 20 00 : lOAD STANDARD  .
5924 : __ __ __ BYT 6c 4f 41 44 20 41 4c 54 45 52 4e 41 54 45 20 00 : lOAD ALTERNATE .
5934 : __ __ __ BYT 73 41 56 45 20 53 54 41 4e 44 41 52 44 20 20 00 : sAVE STANDARD  .
5944 : __ __ __ BYT 73 41 56 45 20 41 4c 54 45 52 4e 41 54 45 20 00 : sAVE ALTERNATE .
5954 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5964 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5974 : __ __ __ BYT 76 45 52 53 49 4f 4e 2f 43 52 45 44 49 54 53 00 : vERSION/CREDITS.
5984 : __ __ __ BYT 65 58 49 54 20 50 52 4f 47 52 41 4d 20 20 20 00 : eXIT PROGRAM   .
5994 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59a4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59b4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59c4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
59d4 : __ __ __ BYT 79 45 53 00 00 00 00 00 00 00 00 00 00 00 00 00 : yES.............
59e4 : __ __ __ BYT 6e 4f 20 00 00 00 00 00 00 00 00 00 00 00 00 00 : nO .............
59f4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a04 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a14 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a24 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5a34 : __ __ __ BYT 70 61 6c 20 20 38 30 58 32 35 00 00 00 00 00 00 : pal  80X25......
5a44 : __ __ __ BYT 70 61 6c 20 20 38 30 58 35 30 00 00 00 00 00 00 : pal  80X50......
5a54 : __ __ __ BYT 70 61 6c 20 20 38 30 58 37 30 00 00 00 00 00 00 : pal  80X70......
5a64 : __ __ __ BYT 6e 74 73 63 20 38 30 58 32 35 00 00 00 00 00 00 : ntsc 80X25......
5a74 : __ __ __ BYT 6e 74 73 63 20 38 30 58 35 30 00 00 00 00 00 00 : ntsc 80X50......
5a84 : __ __ __ BYT 6e 74 73 63 20 38 30 58 36 30 00 00 00 00 00 00 : ntsc 80X60......
--------------------------------------------------------------------
pulldown_options:
5a94 : __ __ __ BYT 06 05 04 02 02 00                               : ......
--------------------------------------------------------------------
winStyles:
5a9a : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
5aaa : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
menubar:
5aac : __ __ __ BYT 73 43 52 45 45 4e 00 00 00 00 00 00 66 49 4c 45 : sCREEN......fILE
5abc : __ __ __ BYT 00 00 00 00 00 00 00 00 63 48 41 52 53 45 54 00 : ........cHARSET.
5acc : __ __ __ BYT 00 00 00 00 69 4e 46 4f 52 4d 41 54 49 4f 4e 00 : ....iNFORMATION.
5adc : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
winCfg:
5ae1 : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
5ae9 : __ __ __ BSS	16
--------------------------------------------------------------------
charsetchanged:
5af9 : __ __ __ BSS	2
--------------------------------------------------------------------
canvas:
5af9 : __ __ __ BSS	0
--------------------------------------------------------------------
appexit:
5afb : __ __ __ BSS	1
--------------------------------------------------------------------
screen_col:
5afc : __ __ __ BSS	2
--------------------------------------------------------------------
screen_row:
5afe : __ __ __ BSS	2
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
vdc_state:
5bd8 : __ __ __ BSS	25
--------------------------------------------------------------------
screentotal:
5bf1 : __ __ __ BSS	2
--------------------------------------------------------------------
screenbackground:
5bf3 : __ __ __ BSS	1
--------------------------------------------------------------------
plotscreencode:
5bf4 : __ __ __ BSS	1
--------------------------------------------------------------------
plotcolor:
5bf5 : __ __ __ BSS	1
--------------------------------------------------------------------
plotreverse:
5bf6 : __ __ __ BSS	1
--------------------------------------------------------------------
plotunderline:
5bf7 : __ __ __ BSS	1
--------------------------------------------------------------------
plotblink:
5bf8 : __ __ __ BSS	1
--------------------------------------------------------------------
plotaltchar:
5bf9 : __ __ __ BSS	1
--------------------------------------------------------------------
undoaddress:
5bfa : __ __ __ BSS	2
--------------------------------------------------------------------
undonumber:
5bfc : __ __ __ BSS	1
--------------------------------------------------------------------
undo_undopossible:
5bfd : __ __ __ BSS	1
--------------------------------------------------------------------
undo_redopossible:
5bfe : __ __ __ BSS	1
--------------------------------------------------------------------
showbar:
5bff : __ __ __ BSS	1
--------------------------------------------------------------------
multab:
5c00 : __ __ __ BSS	144
--------------------------------------------------------------------
windows:
5c90 : __ __ __ BSS	39
--------------------------------------------------------------------
programmode:
5cb7 : __ __ __ BSS	11
--------------------------------------------------------------------
favourites:
5cc2 : __ __ __ BSS	20
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
01:130e : 20 50 2e JSR $2e50 ; (vdc_mem_addr@proxy + 0)
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
01:136b : 20 a2 2a JSR $2aa2 ; (krnio_setbnk.s0 + 0)
01:136e : a5 13 __ LDA P6 ; (fname + 0)
01:1370 : 85 0d __ STA P0 
01:1372 : a5 14 __ LDA P7 ; (fname + 1)
01:1374 : 85 0e __ STA P1 
01:1376 : 20 a9 2a JSR $2aa9 ; (krnio_setnam.s0 + 0)
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
01:13b2 : 20 50 2e JSR $2e50 ; (vdc_mem_addr@proxy + 0)
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
01:151b : a9 7f __ LDA #$7f
01:151d : 85 10 __ STA P3 
01:151f : a9 00 __ LDA #$00
01:1521 : 85 11 __ STA P4 
01:1523 : 4c 63 13 JMP $1363 ; (bnk_load.s0 + 0)
--------------------------------------------------------------------
bnk_cpytovdc@proxy: ; bnk_cpytovdc@proxy
01:1526 : ad e0 5b LDA $5be0 ; (vdc_state + 8)
01:1529 : 85 0f __ STA P2 
01:152b : ad e1 5b LDA $5be1 ; (vdc_state + 9)
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
