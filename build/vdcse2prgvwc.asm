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
1c13 : 8e a2 2d STX $2da2 ; (spentry + 0)
1c16 : a9 d8 __ LDA #$d8
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 2e __ LDA #$2e
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 2f __ LDA #$2f
1c21 : e9 2e __ SBC #$2e
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
1c35 : a9 90 __ LDA #$90
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
1c50 : a9 ae __ LDA #$ae
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 31 __ LDA #$31
1c56 : 85 24 __ STA SP + 1 
1c58 : 20 80 1c JSR $1c80 ; (main.s0 + 0)
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
.s0:
1c80 : ad dd 2d LDA $2ddd ; (view + 12)
1c83 : 85 16 __ STA P9 
1c85 : 20 d1 1d JSR $1dd1 ; (vdc_init.s1000 + 0)
1c88 : a9 1a __ LDA #$1a
1c8a : 8d 00 d6 STA $d600 
.l71:
1c8d : 2c 00 d6 BIT $d600 
1c90 : 10 fb __ BPL $1c8d ; (main.l71 + 0)
.s8:
1c92 : ad 01 d6 LDA $d601 
1c95 : 29 f0 __ AND #$f0
1c97 : 18 __ __ CLC
1c98 : 6d de 2d ADC $2dde ; (view + 13)
1c9b : a2 1a __ LDX #$1a
1c9d : 8e 00 d6 STX $d600 
.l73:
1ca0 : 2c 00 d6 BIT $d600 
1ca3 : 10 fb __ BPL $1ca0 ; (main.l73 + 0)
.s14:
1ca5 : 8d 01 d6 STA $d601 
1ca8 : ad d4 2d LDA $2dd4 ; (view + 3)
1cab : 85 52 __ STA T2 + 1 
1cad : ad d3 2d LDA $2dd3 ; (view + 2)
1cb0 : 85 51 __ STA T2 + 0 
1cb2 : 05 52 __ ORA T2 + 1 
1cb4 : f0 32 __ BEQ $1ce8 ; (main.s77 + 0)
.s15:
1cb6 : a5 51 __ LDA T2 + 0 
1cb8 : 85 11 __ STA P4 
1cba : a5 52 __ LDA T2 + 1 
1cbc : 85 12 __ STA P5 
1cbe : ad c8 2d LDA $2dc8 ; (vdc_state + 16)
1cc1 : 85 0f __ STA P2 
1cc3 : ad c9 2d LDA $2dc9 ; (vdc_state + 17)
1cc6 : 85 10 __ STA P3 
1cc8 : 20 30 29 JSR $2930 ; (vdc_redef_charset.s0 + 0)
1ccb : a5 51 __ LDA T2 + 0 
1ccd : 05 52 __ ORA T2 + 1 
1ccf : f0 17 __ BEQ $1ce8 ; (main.s77 + 0)
.s18:
1cd1 : ad ca 2d LDA $2dca ; (vdc_state + 18)
1cd4 : 85 0f __ STA P2 
1cd6 : ad cb 2d LDA $2dcb ; (vdc_state + 19)
1cd9 : 85 10 __ STA P3 
1cdb : ad d5 2d LDA $2dd5 ; (view + 4)
1cde : 85 11 __ STA P4 
1ce0 : ad d6 2d LDA $2dd6 ; (view + 5)
1ce3 : 85 12 __ STA P5 
1ce5 : 20 30 29 JSR $2930 ; (vdc_redef_charset.s0 + 0)
.s77:
1ce8 : ad bc 2d LDA $2dbc ; (vdc_state + 4)
1ceb : cd d8 2d CMP $2dd8 ; (view + 7)
1cee : d0 06 __ BNE $1cf6 ; (main.s1005 + 0)
.s1004:
1cf0 : ad bb 2d LDA $2dbb ; (vdc_state + 3)
1cf3 : cd d7 2d CMP $2dd7 ; (view + 6)
.s1005:
1cf6 : 90 13 __ BCC $1d0b ; (main.s23 + 0)
.s24:
1cf8 : ad be 2d LDA $2dbe ; (vdc_state + 6)
1cfb : cd da 2d CMP $2dda ; (view + 9)
1cfe : d0 06 __ BNE $1d06 ; (main.s1003 + 0)
.s1002:
1d00 : ad bd 2d LDA $2dbd ; (vdc_state + 5)
1d03 : cd d9 2d CMP $2dd9 ; (view + 8)
.s1003:
1d06 : 90 03 __ BCC $1d0b ; (main.s23 + 0)
.s22:
1d08 : 20 62 29 JSR $2962 ; (show_noscroll.s0 + 0)
.s23:
1d0b : a9 00 __ LDA #$00
1d0d : 20 10 26 JSR $2610 ; (fastmode.s0 + 0)
1d10 : a9 00 __ LDA #$00
1d12 : 85 0f __ STA P2 
1d14 : 20 2f 26 JSR $262f ; (vdc_set_mode.s0 + 0)
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
1d17 : a9 00 __ LDA #$00
1d19 : 85 43 __ STA T0 + 0 
1d1b : ad bb 2d LDA $2dbb ; (vdc_state + 3)
1d1e : 85 44 __ STA T1 + 0 
1d20 : ad bd 2d LDA $2dbd ; (vdc_state + 5)
1d23 : 85 45 __ STA T2 + 0 
.l2:
1d25 : a5 43 __ LDA T0 + 0 
1d27 : c5 45 __ CMP T2 + 0 
1d29 : 90 01 __ BCC $1d2c ; (vdc_cls.s3 + 0)
.s1001:
1d2b : 60 __ __ RTS
.s3:
1d2c : 0a __ __ ASL
1d2d : aa __ __ TAX
1d2e : bd 00 2f LDA $2f00,x ; (multab + 0)
1d31 : 85 47 __ STA T4 + 0 
1d33 : 18 __ __ CLC
1d34 : 6d c0 2d ADC $2dc0 ; (vdc_state + 8)
1d37 : 85 0d __ STA P0 
1d39 : bd 01 2f LDA $2f01,x ; (multab + 1)
1d3c : 85 48 __ STA T4 + 1 
1d3e : 6d c1 2d ADC $2dc1 ; (vdc_state + 9)
1d41 : 85 0e __ STA P1 
1d43 : ad bf 2d LDA $2dbf ; (vdc_state + 7)
1d46 : 85 46 __ STA T3 + 0 
1d48 : 20 1f 1f JSR $1f1f ; (vdc_mem_addr.s0 + 0)
1d4b : a6 44 __ LDX T1 + 0 
1d4d : ca __ __ DEX
1d4e : 86 49 __ STX T5 + 0 
.l239:
1d50 : 2c 00 d6 BIT $d600 
1d53 : 10 fb __ BPL $1d50 ; (vdc_cls.l239 + 0)
.s12:
1d55 : a9 20 __ LDA #$20
1d57 : 8d 01 d6 STA $d601 
1d5a : a9 18 __ LDA #$18
1d5c : 8d 00 d6 STA $d600 
.l241:
1d5f : 2c 00 d6 BIT $d600 
1d62 : 10 fb __ BPL $1d5f ; (vdc_cls.l241 + 0)
.s18:
1d64 : ad 01 d6 LDA $d601 
1d67 : 29 7f __ AND #$7f
1d69 : a2 18 __ LDX #$18
1d6b : 8e 00 d6 STX $d600 
.l243:
1d6e : 2c 00 d6 BIT $d600 
1d71 : 10 fb __ BPL $1d6e ; (vdc_cls.l243 + 0)
.s24:
1d73 : 8d 01 d6 STA $d601 
1d76 : a9 1e __ LDA #$1e
1d78 : 8d 00 d6 STA $d600 
.l245:
1d7b : 2c 00 d6 BIT $d600 
1d7e : 10 fb __ BPL $1d7b ; (vdc_cls.l245 + 0)
.s29:
1d80 : a5 49 __ LDA T5 + 0 
1d82 : 8d 01 d6 STA $d601 
1d85 : ad c2 2d LDA $2dc2 ; (vdc_state + 10)
1d88 : 18 __ __ CLC
1d89 : 65 47 __ ADC T4 + 0 
1d8b : 85 0d __ STA P0 
1d8d : ad c3 2d LDA $2dc3 ; (vdc_state + 11)
1d90 : 65 48 __ ADC T4 + 1 
1d92 : 85 0e __ STA P1 
1d94 : 20 1f 1f JSR $1f1f ; (vdc_mem_addr.s0 + 0)
.l247:
1d97 : 2c 00 d6 BIT $d600 
1d9a : 10 fb __ BPL $1d97 ; (vdc_cls.l247 + 0)
.s33:
1d9c : a5 46 __ LDA T3 + 0 
1d9e : 8d 01 d6 STA $d601 
1da1 : a9 18 __ LDA #$18
1da3 : 8d 00 d6 STA $d600 
.l249:
1da6 : 2c 00 d6 BIT $d600 
1da9 : 10 fb __ BPL $1da6 ; (vdc_cls.l249 + 0)
.s39:
1dab : ad 01 d6 LDA $d601 
1dae : 29 7f __ AND #$7f
1db0 : a2 18 __ LDX #$18
1db2 : 8e 00 d6 STX $d600 
.l251:
1db5 : 2c 00 d6 BIT $d600 
1db8 : 10 fb __ BPL $1db5 ; (vdc_cls.l251 + 0)
.s45:
1dba : 8d 01 d6 STA $d601 
1dbd : a9 1e __ LDA #$1e
1dbf : 8d 00 d6 STA $d600 
.l253:
1dc2 : 2c 00 d6 BIT $d600 
1dc5 : 10 fb __ BPL $1dc2 ; (vdc_cls.l253 + 0)
.s50:
1dc7 : a5 49 __ LDA T5 + 0 
1dc9 : 8d 01 d6 STA $d601 
1dcc : e6 43 __ INC T0 + 0 
1dce : 4c 25 1d JMP $1d25 ; (vdc_cls.l2 + 0)
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
1dd1 : 38 __ __ SEC
1dd2 : a5 23 __ LDA SP + 0 
1dd4 : e9 04 __ SBC #$04
1dd6 : 85 23 __ STA SP + 0 
1dd8 : b0 02 __ BCS $1ddc ; (vdc_init.s0 + 0)
1dda : c6 24 __ DEC SP + 1 
.s0:
1ddc : a2 14 __ LDX #$14
.l1002:
1dde : bd a2 2d LDA $2da2,x ; (spentry + 0)
1de1 : 9d ff 0f STA $0fff,x 
1de4 : ca __ __ DEX
1de5 : d0 f7 __ BNE $1dde ; (vdc_init.l1002 + 0)
.s1003:
1de7 : a9 1a __ LDA #$1a
1de9 : 8d 00 d6 STA $d600 
.l463:
1dec : 2c 00 d6 BIT $d600 
1def : 10 fb __ BPL $1dec ; (vdc_init.l463 + 0)
.s7:
1df1 : ad 01 d6 LDA $d601 
1df4 : 29 f0 __ AND #$f0
1df6 : a8 __ __ TAY
1df7 : a9 1a __ LDA #$1a
1df9 : 8d 00 d6 STA $d600 
.l465:
1dfc : 2c 00 d6 BIT $d600 
1dff : 10 fb __ BPL $1dfc ; (vdc_init.l465 + 0)
.s13:
1e01 : 8c 01 d6 STY $d601 
1e04 : 8d 00 d6 STA $d600 
.l467:
1e07 : 2c 00 d6 BIT $d600 
1e0a : 10 fb __ BPL $1e07 ; (vdc_init.l467 + 0)
.s20:
1e0c : ad 01 d6 LDA $d601 
1e0f : 29 0f __ AND #$0f
1e11 : 09 d0 __ ORA #$d0
1e13 : a0 1a __ LDY #$1a
1e15 : 8c 00 d6 STY $d600 
.l469:
1e18 : 2c 00 d6 BIT $d600 
1e1b : 10 fb __ BPL $1e18 ; (vdc_init.l469 + 0)
.s26:
1e1d : 8d 01 d6 STA $d601 
1e20 : a9 8d __ LDA #$8d
1e22 : 8d bf 2d STA $2dbf ; (vdc_state + 7)
1e25 : a9 1c __ LDA #$1c
1e27 : 8d 00 d6 STA $d600 
.l471:
1e2a : 2c 00 d6 BIT $d600 
1e2d : 10 fb __ BPL $1e2a ; (vdc_init.l471 + 0)
.s32:
1e2f : ad 01 d6 LDA $d601 
1e32 : a8 __ __ TAY
1e33 : 09 10 __ ORA #$10
1e35 : 85 44 __ STA T1 + 0 
1e37 : a9 1c __ LDA #$1c
1e39 : 8d 00 d6 STA $d600 
.l473:
1e3c : 2c 00 d6 BIT $d600 
1e3f : 10 fb __ BPL $1e3c ; (vdc_init.l473 + 0)
.s39:
1e41 : a5 44 __ LDA T1 + 0 
1e43 : 8d 01 d6 STA $d601 
1e46 : a9 12 __ LDA #$12
1e48 : 8d 00 d6 STA $d600 
.l475:
1e4b : 2c 00 d6 BIT $d600 
1e4e : 10 fb __ BPL $1e4b ; (vdc_init.l475 + 0)
.s46:
1e50 : a9 1f __ LDA #$1f
1e52 : 8d 01 d6 STA $d601 
1e55 : a9 13 __ LDA #$13
1e57 : 8d 00 d6 STA $d600 
.l477:
1e5a : 2c 00 d6 BIT $d600 
1e5d : 10 fb __ BPL $1e5a ; (vdc_init.l477 + 0)
.s51:
1e5f : a9 ff __ LDA #$ff
1e61 : 8d 01 d6 STA $d601 
1e64 : a9 1f __ LDA #$1f
1e66 : 8d 00 d6 STA $d600 
.l479:
1e69 : 2c 00 d6 BIT $d600 
1e6c : 10 fb __ BPL $1e69 ; (vdc_init.l479 + 0)
.s55:
1e6e : 8e 01 d6 STX $d601 
1e71 : a9 12 __ LDA #$12
1e73 : 8d 00 d6 STA $d600 
.l481:
1e76 : 2c 00 d6 BIT $d600 
1e79 : 10 fb __ BPL $1e76 ; (vdc_init.l481 + 0)
.s62:
1e7b : a9 9f __ LDA #$9f
1e7d : 8d 01 d6 STA $d601 
1e80 : a9 13 __ LDA #$13
1e82 : 8d 00 d6 STA $d600 
.l483:
1e85 : 2c 00 d6 BIT $d600 
1e88 : 10 fb __ BPL $1e85 ; (vdc_init.l483 + 0)
.s67:
1e8a : a9 ff __ LDA #$ff
1e8c : 8d 01 d6 STA $d601 
1e8f : a9 1f __ LDA #$1f
1e91 : 8d 00 d6 STA $d600 
.l485:
1e94 : 2c 00 d6 BIT $d600 
1e97 : 10 fb __ BPL $1e94 ; (vdc_init.l485 + 0)
.s71:
1e99 : a9 ff __ LDA #$ff
1e9b : 8d 01 d6 STA $d601 
1e9e : a9 12 __ LDA #$12
1ea0 : 8d 00 d6 STA $d600 
.l487:
1ea3 : 2c 00 d6 BIT $d600 
1ea6 : 10 fb __ BPL $1ea3 ; (vdc_init.l487 + 0)
.s78:
1ea8 : a9 1f __ LDA #$1f
1eaa : 8d 01 d6 STA $d601 
1ead : a9 13 __ LDA #$13
1eaf : 8d 00 d6 STA $d600 
.l489:
1eb2 : 2c 00 d6 BIT $d600 
1eb5 : 10 fb __ BPL $1eb2 ; (vdc_init.l489 + 0)
.s83:
1eb7 : a9 ff __ LDA #$ff
1eb9 : 8d 01 d6 STA $d601 
1ebc : a9 1f __ LDA #$1f
1ebe : 8d 00 d6 STA $d600 
.l491:
1ec1 : 2c 00 d6 BIT $d600 
1ec4 : 10 fb __ BPL $1ec1 ; (vdc_init.l491 + 0)
.s87:
1ec6 : ad 01 d6 LDA $d601 
1ec9 : f0 04 __ BEQ $1ecf ; (vdc_init.s1038 + 0)
.s1039:
1ecb : a9 10 __ LDA #$10
1ecd : d0 02 __ BNE $1ed1 ; (vdc_init.s1040 + 0)
.s1038:
1ecf : a9 40 __ LDA #$40
.s1040:
1ed1 : 8d b8 2d STA $2db8 ; (vdc_state + 0)
1ed4 : a9 1c __ LDA #$1c
1ed6 : 8d 00 d6 STA $d600 
.l494:
1ed9 : 2c 00 d6 BIT $d600 
1edc : 10 fb __ BPL $1ed9 ; (vdc_init.l494 + 0)
.s94:
1ede : 8c 01 d6 STY $d601 
1ee1 : 20 17 1d JSR $1d17 ; (vdc_cls.s0 + 0)
1ee4 : 24 d7 __ BIT $d7 
1ee6 : 30 17 __ BMI $1eff ; (vdc_init.s97 + 0)
.s100:
1ee8 : a9 9f __ LDA #$9f
1eea : a0 02 __ LDY #$02
1eec : 91 23 __ STA (SP + 0),y 
1eee : a9 25 __ LDA #$25
1ef0 : c8 __ __ INY
1ef1 : 91 23 __ STA (SP + 0),y 
1ef3 : 20 43 1f JSR $1f43 ; (printf.s1000 + 0)
1ef6 : 20 ca 25 JSR $25ca ; (getch.s0 + 0)
1ef9 : 20 81 ff JSR $ff81 
1efc : 20 08 26 JSR $2608 ; (screen_setmode.s0 + 0)
.s97:
1eff : a9 01 __ LDA #$01
1f01 : 20 10 26 JSR $2610 ; (fastmode.s0 + 0)
1f04 : a5 16 __ LDA P9 ; (mode + 0)
1f06 : 85 0f __ STA P2 
1f08 : 20 2f 26 JSR $262f ; (vdc_set_mode.s0 + 0)
.s1001:
1f0b : 18 __ __ CLC
1f0c : a5 23 __ LDA SP + 0 
1f0e : 69 04 __ ADC #$04
1f10 : 85 23 __ STA SP + 0 
1f12 : 90 02 __ BCC $1f16 ; (vdc_init.s1001 + 11)
1f14 : e6 24 __ INC SP + 1 
1f16 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
1f17 : a5 0f __ LDA P2 
1f19 : 85 0d __ STA P0 
1f1b : a5 10 __ LDA P3 
1f1d : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
1f1f : a9 12 __ LDA #$12
1f21 : 8d 00 d6 STA $d600 
.l56:
1f24 : 2c 00 d6 BIT $d600 
1f27 : 10 fb __ BPL $1f24 ; (vdc_mem_addr.l56 + 0)
.s5:
1f29 : a5 0e __ LDA P1 ; (addr + 1)
1f2b : 8d 01 d6 STA $d601 
1f2e : a9 13 __ LDA #$13
1f30 : 8d 00 d6 STA $d600 
.l58:
1f33 : 2c 00 d6 BIT $d600 
1f36 : 10 fb __ BPL $1f33 ; (vdc_mem_addr.l58 + 0)
.s10:
1f38 : a5 0d __ LDA P0 ; (addr + 0)
1f3a : 8d 01 d6 STA $d601 
1f3d : a9 1f __ LDA #$1f
1f3f : 8d 00 d6 STA $d600 
.s1001:
1f42 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
1f43 : a2 03 __ LDX #$03
1f45 : b5 53 __ LDA T8 + 0,x 
1f47 : 9d b0 31 STA $31b0,x ; (printf@stack + 0)
1f4a : ca __ __ DEX
1f4b : 10 f8 __ BPL $1f45 ; (printf.s1000 + 2)
.s0:
1f4d : 18 __ __ CLC
1f4e : a5 23 __ LDA SP + 0 
1f50 : 69 04 __ ADC #$04
1f52 : 85 47 __ STA T0 + 0 
1f54 : a5 24 __ LDA SP + 1 
1f56 : 69 00 __ ADC #$00
1f58 : 85 48 __ STA T0 + 1 
1f5a : a9 00 __ LDA #$00
1f5c : 85 49 __ STA T2 + 0 
1f5e : a0 02 __ LDY #$02
1f60 : b1 23 __ LDA (SP + 0),y 
1f62 : 85 4a __ STA T3 + 0 
1f64 : c8 __ __ INY
1f65 : b1 23 __ LDA (SP + 0),y 
1f67 : 85 4b __ STA T3 + 1 
.l2:
1f69 : a0 00 __ LDY #$00
1f6b : b1 4a __ LDA (T3 + 0),y 
1f6d : d0 1e __ BNE $1f8d ; (printf.s3 + 0)
.s4:
1f6f : a6 49 __ LDX T2 + 0 
1f71 : 9d bc 31 STA $31bc,x ; (buff + 0)
1f74 : 8a __ __ TXA
1f75 : f0 0b __ BEQ $1f82 ; (printf.s1001 + 0)
.s117:
1f77 : a9 bc __ LDA #$bc
1f79 : 85 0d __ STA P0 ; (fmt + 0)
1f7b : a9 31 __ LDA #$31
1f7d : 85 0e __ STA P1 ; (fmt + 1)
1f7f : 20 a2 22 JSR $22a2 ; (puts.s0 + 0)
.s1001:
1f82 : a2 03 __ LDX #$03
1f84 : bd b0 31 LDA $31b0,x ; (printf@stack + 0)
1f87 : 95 53 __ STA T8 + 0,x 
1f89 : ca __ __ DEX
1f8a : 10 f8 __ BPL $1f84 ; (printf.s1001 + 2)
1f8c : 60 __ __ RTS
.s3:
1f8d : c9 25 __ CMP #$25
1f8f : f0 28 __ BEQ $1fb9 ; (printf.s5 + 0)
.s6:
1f91 : a6 49 __ LDX T2 + 0 
1f93 : 9d bc 31 STA $31bc,x ; (buff + 0)
1f96 : e6 4a __ INC T3 + 0 
1f98 : d0 02 __ BNE $1f9c ; (printf.s1098 + 0)
.s1097:
1f9a : e6 4b __ INC T3 + 1 
.s1098:
1f9c : e8 __ __ INX
1f9d : 86 49 __ STX T2 + 0 
1f9f : e0 28 __ CPX #$28
1fa1 : 90 c6 __ BCC $1f69 ; (printf.l2 + 0)
.s111:
1fa3 : a9 bc __ LDA #$bc
1fa5 : 85 0d __ STA P0 ; (fmt + 0)
1fa7 : a9 31 __ LDA #$31
1fa9 : 85 0e __ STA P1 ; (fmt + 1)
1fab : 98 __ __ TYA
1fac : 9d bc 31 STA $31bc,x ; (buff + 0)
1faf : 20 a2 22 JSR $22a2 ; (puts.s0 + 0)
1fb2 : a9 00 __ LDA #$00
.s1068:
1fb4 : 85 49 __ STA T2 + 0 
1fb6 : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s5:
1fb9 : a5 49 __ LDA T2 + 0 
1fbb : f0 15 __ BEQ $1fd2 ; (printf.s10 + 0)
.s8:
1fbd : a9 bc __ LDA #$bc
1fbf : 85 0d __ STA P0 ; (fmt + 0)
1fc1 : a9 31 __ LDA #$31
1fc3 : 85 0e __ STA P1 ; (fmt + 1)
1fc5 : 98 __ __ TYA
1fc6 : a6 49 __ LDX T2 + 0 
1fc8 : 9d bc 31 STA $31bc,x ; (buff + 0)
1fcb : 20 a2 22 JSR $22a2 ; (puts.s0 + 0)
1fce : a9 00 __ LDA #$00
1fd0 : 85 49 __ STA T2 + 0 
.s10:
1fd2 : a9 0a __ LDA #$0a
1fd4 : 8d b7 31 STA $31b7 ; (si + 3)
1fd7 : a9 00 __ LDA #$00
1fd9 : 8d b8 31 STA $31b8 ; (si + 4)
1fdc : 8d b9 31 STA $31b9 ; (si + 5)
1fdf : 8d ba 31 STA $31ba ; (si + 6)
1fe2 : 8d bb 31 STA $31bb ; (si + 7)
1fe5 : a0 01 __ LDY #$01
1fe7 : b1 4a __ LDA (T3 + 0),y 
1fe9 : a2 20 __ LDX #$20
1feb : 8e b4 31 STX $31b4 ; (si + 0)
1fee : a2 00 __ LDX #$00
1ff0 : 8e b5 31 STX $31b5 ; (si + 1)
1ff3 : ca __ __ DEX
1ff4 : 8e b6 31 STX $31b6 ; (si + 2)
1ff7 : aa __ __ TAX
1ff8 : 18 __ __ CLC
1ff9 : a5 4a __ LDA T3 + 0 
1ffb : 69 02 __ ADC #$02
.l15:
1ffd : 85 4a __ STA T3 + 0 
1fff : 90 02 __ BCC $2003 ; (printf.s1080 + 0)
.s1079:
2001 : e6 4b __ INC T3 + 1 
.s1080:
2003 : 8a __ __ TXA
2004 : e0 2b __ CPX #$2b
2006 : d0 08 __ BNE $2010 ; (printf.s18 + 0)
.s17:
2008 : a9 01 __ LDA #$01
200a : 8d b9 31 STA $31b9 ; (si + 5)
200d : 4c 95 22 JMP $2295 ; (printf.s246 + 0)
.s18:
2010 : c9 30 __ CMP #$30
2012 : d0 06 __ BNE $201a ; (printf.s21 + 0)
.s20:
2014 : 8d b4 31 STA $31b4 ; (si + 0)
2017 : 4c 95 22 JMP $2295 ; (printf.s246 + 0)
.s21:
201a : c9 23 __ CMP #$23
201c : d0 08 __ BNE $2026 ; (printf.s24 + 0)
.s23:
201e : a9 01 __ LDA #$01
2020 : 8d bb 31 STA $31bb ; (si + 7)
2023 : 4c 95 22 JMP $2295 ; (printf.s246 + 0)
.s24:
2026 : c9 2d __ CMP #$2d
2028 : d0 08 __ BNE $2032 ; (printf.s16 + 0)
.s26:
202a : a9 01 __ LDA #$01
202c : 8d ba 31 STA $31ba ; (si + 6)
202f : 4c 95 22 JMP $2295 ; (printf.s246 + 0)
.s16:
2032 : c9 30 __ CMP #$30
2034 : 90 57 __ BCC $208d ; (printf.s32 + 0)
.s33:
2036 : c9 3a __ CMP #$3a
2038 : b0 53 __ BCS $208d ; (printf.s32 + 0)
.s30:
203a : 85 4c __ STA T4 + 0 
203c : a9 00 __ LDA #$00
203e : 85 4d __ STA T6 + 0 
2040 : 85 4e __ STA T6 + 1 
2042 : e0 3a __ CPX #$3a
2044 : b0 40 __ BCS $2086 ; (printf.s36 + 0)
.l35:
2046 : a5 4d __ LDA T6 + 0 
2048 : 0a __ __ ASL
2049 : 85 1b __ STA ACCU + 0 
204b : a5 4e __ LDA T6 + 1 
204d : 2a __ __ ROL
204e : 06 1b __ ASL ACCU + 0 
2050 : 2a __ __ ROL
2051 : aa __ __ TAX
2052 : 18 __ __ CLC
2053 : a5 1b __ LDA ACCU + 0 
2055 : 65 4d __ ADC T6 + 0 
2057 : 85 4d __ STA T6 + 0 
2059 : 8a __ __ TXA
205a : 65 4e __ ADC T6 + 1 
205c : 06 4d __ ASL T6 + 0 
205e : 2a __ __ ROL
205f : aa __ __ TAX
2060 : 18 __ __ CLC
2061 : a5 4d __ LDA T6 + 0 
2063 : 65 4c __ ADC T4 + 0 
2065 : 90 01 __ BCC $2068 ; (printf.s1094 + 0)
.s1093:
2067 : e8 __ __ INX
.s1094:
2068 : 38 __ __ SEC
2069 : e9 30 __ SBC #$30
206b : 85 4d __ STA T6 + 0 
206d : 8a __ __ TXA
206e : e9 00 __ SBC #$00
2070 : 85 4e __ STA T6 + 1 
2072 : a0 00 __ LDY #$00
2074 : b1 4a __ LDA (T3 + 0),y 
2076 : 85 4c __ STA T4 + 0 
2078 : e6 4a __ INC T3 + 0 
207a : d0 02 __ BNE $207e ; (printf.s1096 + 0)
.s1095:
207c : e6 4b __ INC T3 + 1 
.s1096:
207e : c9 30 __ CMP #$30
2080 : 90 04 __ BCC $2086 ; (printf.s36 + 0)
.s37:
2082 : c9 3a __ CMP #$3a
2084 : 90 c0 __ BCC $2046 ; (printf.l35 + 0)
.s36:
2086 : a5 4d __ LDA T6 + 0 
2088 : 8d b5 31 STA $31b5 ; (si + 1)
208b : a5 4c __ LDA T4 + 0 
.s32:
208d : c9 2e __ CMP #$2e
208f : d0 51 __ BNE $20e2 ; (printf.s40 + 0)
.s38:
2091 : a9 00 __ LDA #$00
2093 : 85 4d __ STA T6 + 0 
.l231:
2095 : 85 4e __ STA T6 + 1 
2097 : a0 00 __ LDY #$00
2099 : b1 4a __ LDA (T3 + 0),y 
209b : 85 4c __ STA T4 + 0 
209d : e6 4a __ INC T3 + 0 
209f : d0 02 __ BNE $20a3 ; (printf.s1082 + 0)
.s1081:
20a1 : e6 4b __ INC T3 + 1 
.s1082:
20a3 : c9 30 __ CMP #$30
20a5 : 90 04 __ BCC $20ab ; (printf.s43 + 0)
.s44:
20a7 : c9 3a __ CMP #$3a
20a9 : 90 0a __ BCC $20b5 ; (printf.s42 + 0)
.s43:
20ab : a5 4d __ LDA T6 + 0 
20ad : 8d b6 31 STA $31b6 ; (si + 2)
20b0 : a5 4c __ LDA T4 + 0 
20b2 : 4c e2 20 JMP $20e2 ; (printf.s40 + 0)
.s42:
20b5 : a5 4d __ LDA T6 + 0 
20b7 : 0a __ __ ASL
20b8 : 85 1b __ STA ACCU + 0 
20ba : a5 4e __ LDA T6 + 1 
20bc : 2a __ __ ROL
20bd : 06 1b __ ASL ACCU + 0 
20bf : 2a __ __ ROL
20c0 : aa __ __ TAX
20c1 : 18 __ __ CLC
20c2 : a5 1b __ LDA ACCU + 0 
20c4 : 65 4d __ ADC T6 + 0 
20c6 : 85 4d __ STA T6 + 0 
20c8 : 8a __ __ TXA
20c9 : 65 4e __ ADC T6 + 1 
20cb : 06 4d __ ASL T6 + 0 
20cd : 2a __ __ ROL
20ce : aa __ __ TAX
20cf : 18 __ __ CLC
20d0 : a5 4d __ LDA T6 + 0 
20d2 : 65 4c __ ADC T4 + 0 
20d4 : 90 01 __ BCC $20d7 ; (printf.s1092 + 0)
.s1091:
20d6 : e8 __ __ INX
.s1092:
20d7 : 38 __ __ SEC
20d8 : e9 30 __ SBC #$30
20da : 85 4d __ STA T6 + 0 
20dc : 8a __ __ TXA
20dd : e9 00 __ SBC #$00
20df : 4c 95 20 JMP $2095 ; (printf.l231 + 0)
.s40:
20e2 : c9 64 __ CMP #$64
20e4 : f0 04 __ BEQ $20ea ; (printf.s45 + 0)
.s48:
20e6 : c9 44 __ CMP #$44
20e8 : d0 05 __ BNE $20ef ; (printf.s46 + 0)
.s45:
20ea : a9 01 __ LDA #$01
20ec : 4c 6e 22 JMP $226e ; (printf.s247 + 0)
.s46:
20ef : c9 75 __ CMP #$75
20f1 : d0 03 __ BNE $20f6 ; (printf.s52 + 0)
20f3 : 4c 6c 22 JMP $226c ; (printf.s269 + 0)
.s52:
20f6 : c9 55 __ CMP #$55
20f8 : d0 03 __ BNE $20fd ; (printf.s50 + 0)
20fa : 4c 6c 22 JMP $226c ; (printf.s269 + 0)
.s50:
20fd : c9 78 __ CMP #$78
20ff : f0 04 __ BEQ $2105 ; (printf.s53 + 0)
.s56:
2101 : c9 58 __ CMP #$58
2103 : d0 0d __ BNE $2112 ; (printf.s54 + 0)
.s53:
2105 : a9 10 __ LDA #$10
2107 : 8d b7 31 STA $31b7 ; (si + 3)
210a : a9 00 __ LDA #$00
210c : 8d b8 31 STA $31b8 ; (si + 4)
210f : 4c 6c 22 JMP $226c ; (printf.s269 + 0)
.s54:
2112 : c9 6c __ CMP #$6c
2114 : d0 03 __ BNE $2119 ; (printf.s60 + 0)
2116 : 4c ee 21 JMP $21ee ; (printf.s57 + 0)
.s60:
2119 : c9 4c __ CMP #$4c
211b : d0 03 __ BNE $2120 ; (printf.s58 + 0)
211d : 4c ee 21 JMP $21ee ; (printf.s57 + 0)
.s58:
2120 : c9 73 __ CMP #$73
2122 : f0 39 __ BEQ $215d ; (printf.s73 + 0)
.s76:
2124 : c9 53 __ CMP #$53
2126 : f0 35 __ BEQ $215d ; (printf.s73 + 0)
.s74:
2128 : c9 63 __ CMP #$63
212a : f0 15 __ BEQ $2141 ; (printf.s104 + 0)
.s107:
212c : c9 43 __ CMP #$43
212e : f0 11 __ BEQ $2141 ; (printf.s104 + 0)
.s105:
2130 : 09 00 __ ORA #$00
2132 : d0 03 __ BNE $2137 ; (printf.s108 + 0)
2134 : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s108:
2137 : a6 49 __ LDX T2 + 0 
2139 : 9d bc 31 STA $31bc,x ; (buff + 0)
213c : e6 49 __ INC T2 + 0 
213e : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s104:
2141 : a0 00 __ LDY #$00
2143 : b1 47 __ LDA (T0 + 0),y 
2145 : a6 49 __ LDX T2 + 0 
2147 : 9d bc 31 STA $31bc,x ; (buff + 0)
214a : e6 49 __ INC T2 + 0 
.s244:
214c : 18 __ __ CLC
214d : a5 47 __ LDA T0 + 0 
214f : 69 02 __ ADC #$02
2151 : 85 47 __ STA T0 + 0 
2153 : b0 03 __ BCS $2158 ; (printf.s1083 + 0)
2155 : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s1083:
2158 : e6 48 __ INC T0 + 1 
215a : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s73:
215d : a0 00 __ LDY #$00
215f : 84 4c __ STY T4 + 0 
2161 : b1 47 __ LDA (T0 + 0),y 
2163 : 85 4d __ STA T6 + 0 
2165 : c8 __ __ INY
2166 : b1 47 __ LDA (T0 + 0),y 
2168 : 85 4e __ STA T6 + 1 
216a : 18 __ __ CLC
216b : a5 47 __ LDA T0 + 0 
216d : 69 02 __ ADC #$02
216f : 85 47 __ STA T0 + 0 
2171 : 90 02 __ BCC $2175 ; (printf.s1090 + 0)
.s1089:
2173 : e6 48 __ INC T0 + 1 
.s1090:
2175 : ad b5 31 LDA $31b5 ; (si + 1)
2178 : f0 0d __ BEQ $2187 ; (printf.s79 + 0)
.s1071:
217a : a0 00 __ LDY #$00
217c : b1 4d __ LDA (T6 + 0),y 
217e : f0 05 __ BEQ $2185 ; (printf.s1072 + 0)
.l81:
2180 : c8 __ __ INY
2181 : b1 4d __ LDA (T6 + 0),y 
2183 : d0 fb __ BNE $2180 ; (printf.l81 + 0)
.s1072:
2185 : 84 4c __ STY T4 + 0 
.s79:
2187 : ad ba 31 LDA $31ba ; (si + 6)
218a : d0 1a __ BNE $21a6 ; (printf.s85 + 0)
.s1075:
218c : a4 4c __ LDY T4 + 0 
218e : cc b5 31 CPY $31b5 ; (si + 1)
2191 : a6 49 __ LDX T2 + 0 
2193 : b0 0d __ BCS $21a2 ; (printf.s1076 + 0)
.l87:
2195 : ad b4 31 LDA $31b4 ; (si + 0)
2198 : 9d bc 31 STA $31bc,x ; (buff + 0)
219b : c8 __ __ INY
219c : cc b5 31 CPY $31b5 ; (si + 1)
219f : e8 __ __ INX
21a0 : 90 f3 __ BCC $2195 ; (printf.l87 + 0)
.s1076:
21a2 : 86 49 __ STX T2 + 0 
21a4 : 84 4c __ STY T4 + 0 
.s85:
21a6 : a5 49 __ LDA T2 + 0 
21a8 : f0 16 __ BEQ $21c0 ; (printf.s238 + 0)
.s92:
21aa : a9 bc __ LDA #$bc
21ac : 85 0d __ STA P0 ; (fmt + 0)
21ae : a9 31 __ LDA #$31
21b0 : 85 0e __ STA P1 ; (fmt + 1)
21b2 : a9 00 __ LDA #$00
21b4 : a6 49 __ LDX T2 + 0 
21b6 : 9d bc 31 STA $31bc,x ; (buff + 0)
21b9 : 20 a2 22 JSR $22a2 ; (puts.s0 + 0)
21bc : a9 00 __ LDA #$00
21be : 85 49 __ STA T2 + 0 
.s238:
21c0 : a5 4d __ LDA T6 + 0 
21c2 : 85 0d __ STA P0 ; (fmt + 0)
21c4 : a5 4e __ LDA T6 + 1 
21c6 : 85 0e __ STA P1 ; (fmt + 1)
21c8 : 20 a2 22 JSR $22a2 ; (puts.s0 + 0)
21cb : ad ba 31 LDA $31ba ; (si + 6)
21ce : d0 03 __ BNE $21d3 ; (printf.s1073 + 0)
21d0 : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s1073:
21d3 : a4 4c __ LDY T4 + 0 
21d5 : cc b5 31 CPY $31b5 ; (si + 1)
21d8 : a2 00 __ LDX #$00
21da : b0 0d __ BCS $21e9 ; (printf.s1074 + 0)
.l102:
21dc : ad b4 31 LDA $31b4 ; (si + 0)
21df : 9d bc 31 STA $31bc,x ; (buff + 0)
21e2 : c8 __ __ INY
21e3 : cc b5 31 CPY $31b5 ; (si + 1)
21e6 : e8 __ __ INX
21e7 : 90 f3 __ BCC $21dc ; (printf.l102 + 0)
.s1074:
21e9 : 86 49 __ STX T2 + 0 
21eb : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s57:
21ee : a0 00 __ LDY #$00
21f0 : b1 47 __ LDA (T0 + 0),y 
21f2 : 85 53 __ STA T8 + 0 
21f4 : c8 __ __ INY
21f5 : b1 47 __ LDA (T0 + 0),y 
21f7 : 85 54 __ STA T8 + 1 
21f9 : c8 __ __ INY
21fa : b1 47 __ LDA (T0 + 0),y 
21fc : 85 55 __ STA T8 + 2 
21fe : c8 __ __ INY
21ff : b1 47 __ LDA (T0 + 0),y 
2201 : 85 56 __ STA T8 + 3 
2203 : 18 __ __ CLC
2204 : a5 47 __ LDA T0 + 0 
2206 : 69 04 __ ADC #$04
2208 : 85 47 __ STA T0 + 0 
220a : 90 02 __ BCC $220e ; (printf.s1086 + 0)
.s1085:
220c : e6 48 __ INC T0 + 1 
.s1086:
220e : a0 00 __ LDY #$00
2210 : b1 4a __ LDA (T3 + 0),y 
2212 : aa __ __ TAX
2213 : e6 4a __ INC T3 + 0 
2215 : d0 02 __ BNE $2219 ; (printf.s1088 + 0)
.s1087:
2217 : e6 4b __ INC T3 + 1 
.s1088:
2219 : 8a __ __ TXA
221a : e0 64 __ CPX #$64
221c : f0 04 __ BEQ $2222 ; (printf.s61 + 0)
.s64:
221e : c9 44 __ CMP #$44
2220 : d0 04 __ BNE $2226 ; (printf.s62 + 0)
.s61:
2222 : a9 01 __ LDA #$01
2224 : d0 1c __ BNE $2242 ; (printf.s245 + 0)
.s62:
2226 : c9 75 __ CMP #$75
2228 : f0 17 __ BEQ $2241 ; (printf.s268 + 0)
.s68:
222a : c9 55 __ CMP #$55
222c : f0 13 __ BEQ $2241 ; (printf.s268 + 0)
.s66:
222e : c9 78 __ CMP #$78
2230 : f0 07 __ BEQ $2239 ; (printf.s69 + 0)
.s72:
2232 : c9 58 __ CMP #$58
2234 : f0 03 __ BEQ $2239 ; (printf.s69 + 0)
2236 : 4c 69 1f JMP $1f69 ; (printf.l2 + 0)
.s69:
2239 : 8c b8 31 STY $31b8 ; (si + 4)
223c : a9 10 __ LDA #$10
223e : 8d b7 31 STA $31b7 ; (si + 3)
.s268:
2241 : 98 __ __ TYA
.s245:
2242 : 85 15 __ STA P8 
2244 : a9 bc __ LDA #$bc
2246 : 85 0f __ STA P2 ; (fmt + 2)
2248 : a9 31 __ LDA #$31
224a : 85 10 __ STA P3 ; (fmt + 3)
224c : a5 53 __ LDA T8 + 0 
224e : 85 11 __ STA P4 
2250 : a5 54 __ LDA T8 + 1 
2252 : 85 12 __ STA P5 
2254 : a5 55 __ LDA T8 + 2 
2256 : 85 13 __ STA P6 
2258 : a5 56 __ LDA T8 + 3 
225a : 85 14 __ STA P7 
225c : a9 b4 __ LDA #$b4
225e : 85 0d __ STA P0 ; (fmt + 0)
2260 : a9 31 __ LDA #$31
2262 : 85 0e __ STA P1 ; (fmt + 1)
2264 : 20 2c 24 JSR $242c ; (nforml.s0 + 0)
2267 : a5 1b __ LDA ACCU + 0 
2269 : 4c b4 1f JMP $1fb4 ; (printf.s1068 + 0)
.s269:
226c : a9 00 __ LDA #$00
.s247:
226e : 85 13 __ STA P6 
2270 : a9 bc __ LDA #$bc
2272 : 85 0f __ STA P2 ; (fmt + 2)
2274 : a9 31 __ LDA #$31
2276 : 85 10 __ STA P3 ; (fmt + 3)
2278 : a0 00 __ LDY #$00
227a : b1 47 __ LDA (T0 + 0),y 
227c : 85 11 __ STA P4 
227e : c8 __ __ INY
227f : b1 47 __ LDA (T0 + 0),y 
2281 : 85 12 __ STA P5 
2283 : a9 b4 __ LDA #$b4
2285 : 85 0d __ STA P0 ; (fmt + 0)
2287 : a9 31 __ LDA #$31
2289 : 85 0e __ STA P1 ; (fmt + 1)
228b : 20 f7 22 JSR $22f7 ; (nformi.s0 + 0)
228e : a5 1b __ LDA ACCU + 0 
2290 : 85 49 __ STA T2 + 0 
2292 : 4c 4c 21 JMP $214c ; (printf.s244 + 0)
.s246:
2295 : a0 00 __ LDY #$00
2297 : b1 4a __ LDA (T3 + 0),y 
2299 : aa __ __ TAX
229a : 18 __ __ CLC
229b : a5 4a __ LDA T3 + 0 
229d : 69 01 __ ADC #$01
229f : 4c fd 1f JMP $1ffd ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
22a2 : a0 00 __ LDY #$00
22a4 : b1 0d __ LDA (P0),y 
22a6 : f0 0b __ BEQ $22b3 ; (puts.s1001 + 0)
22a8 : 20 b4 22 JSR $22b4 ; (putpch + 0)
22ab : e6 0d __ INC P0 
22ad : d0 f3 __ BNE $22a2 ; (puts.s0 + 0)
22af : e6 0e __ INC P1 
22b1 : d0 ef __ BNE $22a2 ; (puts.s0 + 0)
.s1001:
22b3 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
22b4 : ae b7 2d LDX $2db7 ; (giocharmap + 0)
22b7 : e0 01 __ CPX #$01
22b9 : 90 26 __ BCC $22e1 ; (putpch + 45)
22bb : c9 0a __ CMP #$0a
22bd : d0 02 __ BNE $22c1 ; (putpch + 13)
22bf : a9 0d __ LDA #$0d
22c1 : c9 09 __ CMP #$09
22c3 : f0 1f __ BEQ $22e4 ; (putpch + 48)
22c5 : e0 02 __ CPX #$02
22c7 : 90 18 __ BCC $22e1 ; (putpch + 45)
22c9 : c9 41 __ CMP #$41
22cb : 90 14 __ BCC $22e1 ; (putpch + 45)
22cd : c9 7b __ CMP #$7b
22cf : b0 10 __ BCS $22e1 ; (putpch + 45)
22d1 : c9 61 __ CMP #$61
22d3 : b0 04 __ BCS $22d9 ; (putpch + 37)
22d5 : c9 5b __ CMP #$5b
22d7 : b0 08 __ BCS $22e1 ; (putpch + 45)
22d9 : 49 20 __ EOR #$20
22db : e0 03 __ CPX #$03
22dd : f0 02 __ BEQ $22e1 ; (putpch + 45)
22df : 29 df __ AND #$df
22e1 : 4c d2 ff JMP $ffd2 
22e4 : 38 __ __ SEC
22e5 : 20 f0 ff JSR $fff0 
22e8 : 98 __ __ TYA
22e9 : 29 03 __ AND #$03
22eb : 49 03 __ EOR #$03
22ed : aa __ __ TAX
22ee : a9 20 __ LDA #$20
22f0 : 20 d2 ff JSR $ffd2 
22f3 : ca __ __ DEX
22f4 : 10 fa __ BPL $22f0 ; (putpch + 60)
22f6 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
22f7 : a9 00 __ LDA #$00
22f9 : 85 43 __ STA T0 + 0 
22fb : a5 13 __ LDA P6 ; (s + 0)
22fd : f0 13 __ BEQ $2312 ; (nformi.s182 + 0)
.s4:
22ff : 24 12 __ BIT P5 ; (v + 1)
2301 : 10 0f __ BPL $2312 ; (nformi.s182 + 0)
.s1:
2303 : 38 __ __ SEC
2304 : a9 00 __ LDA #$00
2306 : e5 11 __ SBC P4 ; (v + 0)
2308 : 85 11 __ STA P4 ; (v + 0)
230a : a9 00 __ LDA #$00
230c : e5 12 __ SBC P5 ; (v + 1)
230e : 85 12 __ STA P5 ; (v + 1)
2310 : e6 43 __ INC T0 + 0 
.s182:
2312 : a9 10 __ LDA #$10
2314 : 85 44 __ STA T2 + 0 
2316 : a5 11 __ LDA P4 ; (v + 0)
2318 : 05 12 __ ORA P5 ; (v + 1)
231a : f0 46 __ BEQ $2362 ; (nformi.s7 + 0)
.s42:
231c : a0 03 __ LDY #$03
231e : b1 0d __ LDA (P0),y ; (si + 0)
2320 : 85 45 __ STA T4 + 0 
2322 : c8 __ __ INY
2323 : b1 0d __ LDA (P0),y ; (si + 0)
2325 : 85 46 __ STA T4 + 1 
.l6:
2327 : a5 11 __ LDA P4 ; (v + 0)
2329 : 85 1b __ STA ACCU + 0 
232b : a5 12 __ LDA P5 ; (v + 1)
232d : 85 1c __ STA ACCU + 1 
232f : a5 45 __ LDA T4 + 0 
2331 : 85 03 __ STA WORK + 0 
2333 : a5 46 __ LDA T4 + 1 
2335 : 85 04 __ STA WORK + 1 
2337 : 20 33 2c JSR $2c33 ; (divmod + 0)
233a : a5 06 __ LDA WORK + 3 
233c : 30 08 __ BMI $2346 ; (nformi.s78 + 0)
.s1019:
233e : d0 0a __ BNE $234a ; (nformi.s77 + 0)
.s1018:
2340 : a5 05 __ LDA WORK + 2 
2342 : c9 0a __ CMP #$0a
2344 : b0 04 __ BCS $234a ; (nformi.s77 + 0)
.s78:
2346 : a9 30 __ LDA #$30
2348 : d0 02 __ BNE $234c ; (nformi.s79 + 0)
.s77:
234a : a9 37 __ LDA #$37
.s79:
234c : 18 __ __ CLC
234d : 65 05 __ ADC WORK + 2 
234f : c6 44 __ DEC T2 + 0 
2351 : a6 44 __ LDX T2 + 0 
2353 : 9d ee 31 STA $31ee,x ; (canvas + 4)
2356 : a5 1b __ LDA ACCU + 0 
2358 : 85 11 __ STA P4 ; (v + 0)
235a : a5 1c __ LDA ACCU + 1 
235c : 85 12 __ STA P5 ; (v + 1)
235e : 05 11 __ ORA P4 ; (v + 0)
2360 : d0 c5 __ BNE $2327 ; (nformi.l6 + 0)
.s7:
2362 : a0 02 __ LDY #$02
2364 : b1 0d __ LDA (P0),y ; (si + 0)
2366 : c9 ff __ CMP #$ff
2368 : d0 04 __ BNE $236e ; (nformi.s80 + 0)
.s81:
236a : a9 0f __ LDA #$0f
236c : d0 05 __ BNE $2373 ; (nformi.s1026 + 0)
.s80:
236e : 38 __ __ SEC
236f : a9 10 __ LDA #$10
2371 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2373 : a8 __ __ TAY
2374 : c4 44 __ CPY T2 + 0 
2376 : b0 0d __ BCS $2385 ; (nformi.s10 + 0)
.s9:
2378 : a9 30 __ LDA #$30
.l1027:
237a : c6 44 __ DEC T2 + 0 
237c : a6 44 __ LDX T2 + 0 
237e : 9d ee 31 STA $31ee,x ; (canvas + 4)
2381 : c4 44 __ CPY T2 + 0 
2383 : 90 f5 __ BCC $237a ; (nformi.l1027 + 0)
.s10:
2385 : a0 07 __ LDY #$07
2387 : b1 0d __ LDA (P0),y ; (si + 0)
2389 : f0 20 __ BEQ $23ab ; (nformi.s13 + 0)
.s14:
238b : a0 04 __ LDY #$04
238d : b1 0d __ LDA (P0),y ; (si + 0)
238f : d0 1a __ BNE $23ab ; (nformi.s13 + 0)
.s1013:
2391 : 88 __ __ DEY
2392 : b1 0d __ LDA (P0),y ; (si + 0)
2394 : c9 10 __ CMP #$10
2396 : d0 13 __ BNE $23ab ; (nformi.s13 + 0)
.s11:
2398 : a9 58 __ LDA #$58
239a : a6 44 __ LDX T2 + 0 
239c : 9d ed 31 STA $31ed,x ; (buff + 49)
239f : 8a __ __ TXA
23a0 : 18 __ __ CLC
23a1 : 69 fe __ ADC #$fe
23a3 : 85 44 __ STA T2 + 0 
23a5 : aa __ __ TAX
23a6 : a9 30 __ LDA #$30
23a8 : 9d ee 31 STA $31ee,x ; (canvas + 4)
.s13:
23ab : a9 00 __ LDA #$00
23ad : 85 1b __ STA ACCU + 0 
23af : a5 43 __ LDA T0 + 0 
23b1 : f0 06 __ BEQ $23b9 ; (nformi.s16 + 0)
.s15:
23b3 : c6 44 __ DEC T2 + 0 
23b5 : a9 2d __ LDA #$2d
23b7 : d0 0a __ BNE $23c3 ; (nformi.s1025 + 0)
.s16:
23b9 : a0 05 __ LDY #$05
23bb : b1 0d __ LDA (P0),y ; (si + 0)
23bd : f0 09 __ BEQ $23c8 ; (nformi.s163 + 0)
.s18:
23bf : c6 44 __ DEC T2 + 0 
23c1 : a9 2b __ LDA #$2b
.s1025:
23c3 : a6 44 __ LDX T2 + 0 
23c5 : 9d ee 31 STA $31ee,x ; (canvas + 4)
.s163:
23c8 : a0 06 __ LDY #$06
23ca : b1 0d __ LDA (P0),y ; (si + 0)
23cc : d0 33 __ BNE $2401 ; (nformi.s24 + 0)
.l30:
23ce : a0 01 __ LDY #$01
23d0 : b1 0d __ LDA (P0),y ; (si + 0)
23d2 : 18 __ __ CLC
23d3 : 65 44 __ ADC T2 + 0 
23d5 : b0 04 __ BCS $23db ; (nformi.s31 + 0)
.s1006:
23d7 : c9 11 __ CMP #$11
23d9 : 90 0d __ BCC $23e8 ; (nformi.s33 + 0)
.s31:
23db : c6 44 __ DEC T2 + 0 
23dd : a0 00 __ LDY #$00
23df : b1 0d __ LDA (P0),y ; (si + 0)
23e1 : a6 44 __ LDX T2 + 0 
23e3 : 9d ee 31 STA $31ee,x ; (canvas + 4)
23e6 : b0 e6 __ BCS $23ce ; (nformi.l30 + 0)
.s33:
23e8 : a6 44 __ LDX T2 + 0 
23ea : e0 10 __ CPX #$10
23ec : b0 0e __ BCS $23fc ; (nformi.s23 + 0)
.s34:
23ee : 88 __ __ DEY
.l1022:
23ef : bd ee 31 LDA $31ee,x ; (canvas + 4)
23f2 : 91 0f __ STA (P2),y ; (str + 0)
23f4 : e8 __ __ INX
23f5 : e0 10 __ CPX #$10
23f7 : c8 __ __ INY
23f8 : 90 f5 __ BCC $23ef ; (nformi.l1022 + 0)
.s1023:
23fa : 84 1b __ STY ACCU + 0 
.s23:
23fc : a9 00 __ LDA #$00
23fe : 85 1c __ STA ACCU + 1 
.s1001:
2400 : 60 __ __ RTS
.s24:
2401 : a6 44 __ LDX T2 + 0 
2403 : e0 10 __ CPX #$10
2405 : b0 1a __ BCS $2421 ; (nformi.l27 + 0)
.s25:
2407 : a0 00 __ LDY #$00
.l1020:
2409 : bd ee 31 LDA $31ee,x ; (canvas + 4)
240c : 91 0f __ STA (P2),y ; (str + 0)
240e : e8 __ __ INX
240f : e0 10 __ CPX #$10
2411 : c8 __ __ INY
2412 : 90 f5 __ BCC $2409 ; (nformi.l1020 + 0)
.s1021:
2414 : 84 1b __ STY ACCU + 0 
2416 : b0 09 __ BCS $2421 ; (nformi.l27 + 0)
.s28:
2418 : 88 __ __ DEY
2419 : b1 0d __ LDA (P0),y ; (si + 0)
241b : a4 1b __ LDY ACCU + 0 
241d : 91 0f __ STA (P2),y ; (str + 0)
241f : e6 1b __ INC ACCU + 0 
.l27:
2421 : a5 1b __ LDA ACCU + 0 
2423 : a0 01 __ LDY #$01
2425 : d1 0d __ CMP (P0),y ; (si + 0)
2427 : 90 ef __ BCC $2418 ; (nformi.s28 + 0)
2429 : 4c fc 23 JMP $23fc ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
242c : a9 00 __ LDA #$00
242e : 85 43 __ STA T0 + 0 
2430 : a5 15 __ LDA P8 ; (s + 0)
2432 : f0 21 __ BEQ $2455 ; (nforml.s182 + 0)
.s4:
2434 : a5 14 __ LDA P7 ; (v + 3)
2436 : f0 1d __ BEQ $2455 ; (nforml.s182 + 0)
.s1032:
2438 : 10 1b __ BPL $2455 ; (nforml.s182 + 0)
.s1:
243a : 38 __ __ SEC
243b : a9 00 __ LDA #$00
243d : e5 11 __ SBC P4 ; (v + 0)
243f : 85 11 __ STA P4 ; (v + 0)
2441 : a9 00 __ LDA #$00
2443 : e5 12 __ SBC P5 ; (v + 1)
2445 : 85 12 __ STA P5 ; (v + 1)
2447 : a9 00 __ LDA #$00
2449 : e5 13 __ SBC P6 ; (v + 2)
244b : 85 13 __ STA P6 ; (v + 2)
244d : a9 00 __ LDA #$00
244f : e5 14 __ SBC P7 ; (v + 3)
2451 : 85 14 __ STA P7 ; (v + 3)
2453 : e6 43 __ INC T0 + 0 
.s182:
2455 : a9 10 __ LDA #$10
2457 : 85 44 __ STA T2 + 0 
2459 : a5 14 __ LDA P7 ; (v + 3)
245b : d0 0c __ BNE $2469 ; (nforml.s42 + 0)
.s1024:
245d : a5 13 __ LDA P6 ; (v + 2)
245f : d0 08 __ BNE $2469 ; (nforml.s42 + 0)
.s1025:
2461 : a5 12 __ LDA P5 ; (v + 1)
2463 : d0 04 __ BNE $2469 ; (nforml.s42 + 0)
.s1026:
2465 : c5 11 __ CMP P4 ; (v + 0)
2467 : b0 0e __ BCS $2477 ; (nforml.s7 + 0)
.s42:
2469 : a0 03 __ LDY #$03
246b : b1 0d __ LDA (P0),y ; (si + 0)
246d : 85 45 __ STA T5 + 0 
246f : c8 __ __ INY
2470 : b1 0d __ LDA (P0),y ; (si + 0)
2472 : 85 46 __ STA T5 + 1 
2474 : 4c 41 25 JMP $2541 ; (nforml.l6 + 0)
.s7:
2477 : a0 02 __ LDY #$02
2479 : b1 0d __ LDA (P0),y ; (si + 0)
247b : c9 ff __ CMP #$ff
247d : d0 04 __ BNE $2483 ; (nforml.s80 + 0)
.s81:
247f : a9 0f __ LDA #$0f
2481 : d0 05 __ BNE $2488 ; (nforml.s1039 + 0)
.s80:
2483 : 38 __ __ SEC
2484 : a9 10 __ LDA #$10
2486 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2488 : a8 __ __ TAY
2489 : c4 44 __ CPY T2 + 0 
248b : b0 0d __ BCS $249a ; (nforml.s10 + 0)
.s9:
248d : a9 30 __ LDA #$30
.l1040:
248f : c6 44 __ DEC T2 + 0 
2491 : a6 44 __ LDX T2 + 0 
2493 : 9d ee 31 STA $31ee,x ; (canvas + 4)
2496 : c4 44 __ CPY T2 + 0 
2498 : 90 f5 __ BCC $248f ; (nforml.l1040 + 0)
.s10:
249a : a0 07 __ LDY #$07
249c : b1 0d __ LDA (P0),y ; (si + 0)
249e : f0 20 __ BEQ $24c0 ; (nforml.s13 + 0)
.s14:
24a0 : a0 04 __ LDY #$04
24a2 : b1 0d __ LDA (P0),y ; (si + 0)
24a4 : d0 1a __ BNE $24c0 ; (nforml.s13 + 0)
.s1013:
24a6 : 88 __ __ DEY
24a7 : b1 0d __ LDA (P0),y ; (si + 0)
24a9 : c9 10 __ CMP #$10
24ab : d0 13 __ BNE $24c0 ; (nforml.s13 + 0)
.s11:
24ad : a9 58 __ LDA #$58
24af : a6 44 __ LDX T2 + 0 
24b1 : 9d ed 31 STA $31ed,x ; (buff + 49)
24b4 : 8a __ __ TXA
24b5 : 18 __ __ CLC
24b6 : 69 fe __ ADC #$fe
24b8 : 85 44 __ STA T2 + 0 
24ba : aa __ __ TAX
24bb : a9 30 __ LDA #$30
24bd : 9d ee 31 STA $31ee,x ; (canvas + 4)
.s13:
24c0 : a9 00 __ LDA #$00
24c2 : 85 1b __ STA ACCU + 0 
24c4 : a5 43 __ LDA T0 + 0 
24c6 : f0 06 __ BEQ $24ce ; (nforml.s16 + 0)
.s15:
24c8 : c6 44 __ DEC T2 + 0 
24ca : a9 2d __ LDA #$2d
24cc : d0 0a __ BNE $24d8 ; (nforml.s1038 + 0)
.s16:
24ce : a0 05 __ LDY #$05
24d0 : b1 0d __ LDA (P0),y ; (si + 0)
24d2 : f0 09 __ BEQ $24dd ; (nforml.s163 + 0)
.s18:
24d4 : c6 44 __ DEC T2 + 0 
24d6 : a9 2b __ LDA #$2b
.s1038:
24d8 : a6 44 __ LDX T2 + 0 
24da : 9d ee 31 STA $31ee,x ; (canvas + 4)
.s163:
24dd : a0 06 __ LDY #$06
24df : b1 0d __ LDA (P0),y ; (si + 0)
24e1 : d0 33 __ BNE $2516 ; (nforml.s24 + 0)
.l30:
24e3 : a0 01 __ LDY #$01
24e5 : b1 0d __ LDA (P0),y ; (si + 0)
24e7 : 18 __ __ CLC
24e8 : 65 44 __ ADC T2 + 0 
24ea : b0 04 __ BCS $24f0 ; (nforml.s31 + 0)
.s1006:
24ec : c9 11 __ CMP #$11
24ee : 90 0d __ BCC $24fd ; (nforml.s33 + 0)
.s31:
24f0 : c6 44 __ DEC T2 + 0 
24f2 : a0 00 __ LDY #$00
24f4 : b1 0d __ LDA (P0),y ; (si + 0)
24f6 : a6 44 __ LDX T2 + 0 
24f8 : 9d ee 31 STA $31ee,x ; (canvas + 4)
24fb : b0 e6 __ BCS $24e3 ; (nforml.l30 + 0)
.s33:
24fd : a6 44 __ LDX T2 + 0 
24ff : e0 10 __ CPX #$10
2501 : b0 0e __ BCS $2511 ; (nforml.s23 + 0)
.s34:
2503 : 88 __ __ DEY
.l1035:
2504 : bd ee 31 LDA $31ee,x ; (canvas + 4)
2507 : 91 0f __ STA (P2),y ; (str + 0)
2509 : e8 __ __ INX
250a : e0 10 __ CPX #$10
250c : c8 __ __ INY
250d : 90 f5 __ BCC $2504 ; (nforml.l1035 + 0)
.s1036:
250f : 84 1b __ STY ACCU + 0 
.s23:
2511 : a9 00 __ LDA #$00
2513 : 85 1c __ STA ACCU + 1 
.s1001:
2515 : 60 __ __ RTS
.s24:
2516 : a6 44 __ LDX T2 + 0 
2518 : e0 10 __ CPX #$10
251a : b0 1a __ BCS $2536 ; (nforml.l27 + 0)
.s25:
251c : a0 00 __ LDY #$00
.l1033:
251e : bd ee 31 LDA $31ee,x ; (canvas + 4)
2521 : 91 0f __ STA (P2),y ; (str + 0)
2523 : e8 __ __ INX
2524 : e0 10 __ CPX #$10
2526 : c8 __ __ INY
2527 : 90 f5 __ BCC $251e ; (nforml.l1033 + 0)
.s1034:
2529 : 84 1b __ STY ACCU + 0 
252b : b0 09 __ BCS $2536 ; (nforml.l27 + 0)
.s28:
252d : 88 __ __ DEY
252e : b1 0d __ LDA (P0),y ; (si + 0)
2530 : a4 1b __ LDY ACCU + 0 
2532 : 91 0f __ STA (P2),y ; (str + 0)
2534 : e6 1b __ INC ACCU + 0 
.l27:
2536 : a5 1b __ LDA ACCU + 0 
2538 : a0 01 __ LDY #$01
253a : d1 0d __ CMP (P0),y ; (si + 0)
253c : 90 ef __ BCC $252d ; (nforml.s28 + 0)
253e : 4c 11 25 JMP $2511 ; (nforml.s23 + 0)
.l6:
2541 : a5 11 __ LDA P4 ; (v + 0)
2543 : 85 1b __ STA ACCU + 0 
2545 : a5 12 __ LDA P5 ; (v + 1)
2547 : 85 1c __ STA ACCU + 1 
2549 : a5 13 __ LDA P6 ; (v + 2)
254b : 85 1d __ STA ACCU + 2 
254d : a5 14 __ LDA P7 ; (v + 3)
254f : 85 1e __ STA ACCU + 3 
2551 : a5 45 __ LDA T5 + 0 
2553 : 85 03 __ STA WORK + 0 
2555 : a5 46 __ LDA T5 + 1 
2557 : 85 04 __ STA WORK + 1 
2559 : a9 00 __ LDA #$00
255b : 85 05 __ STA WORK + 2 
255d : 85 06 __ STA WORK + 3 
255f : 20 b8 2c JSR $2cb8 ; (divmod32 + 0)
2562 : a5 08 __ LDA WORK + 5 
2564 : 30 08 __ BMI $256e ; (nforml.s78 + 0)
.s1023:
2566 : d0 0a __ BNE $2572 ; (nforml.s77 + 0)
.s1022:
2568 : a5 07 __ LDA WORK + 4 
256a : c9 0a __ CMP #$0a
256c : b0 04 __ BCS $2572 ; (nforml.s77 + 0)
.s78:
256e : a9 30 __ LDA #$30
2570 : d0 02 __ BNE $2574 ; (nforml.s79 + 0)
.s77:
2572 : a9 37 __ LDA #$37
.s79:
2574 : 18 __ __ CLC
2575 : 65 07 __ ADC WORK + 4 
2577 : c6 44 __ DEC T2 + 0 
2579 : a6 44 __ LDX T2 + 0 
257b : 9d ee 31 STA $31ee,x ; (canvas + 4)
257e : a5 1b __ LDA ACCU + 0 
2580 : 85 11 __ STA P4 ; (v + 0)
2582 : a5 1c __ LDA ACCU + 1 
2584 : 85 12 __ STA P5 ; (v + 1)
2586 : a5 1d __ LDA ACCU + 2 
2588 : 85 13 __ STA P6 ; (v + 2)
258a : a5 1e __ LDA ACCU + 3 
258c : 85 14 __ STA P7 ; (v + 3)
258e : d0 b1 __ BNE $2541 ; (nforml.l6 + 0)
.s1018:
2590 : a5 13 __ LDA P6 ; (v + 2)
2592 : d0 ad __ BNE $2541 ; (nforml.l6 + 0)
.s1019:
2594 : a5 12 __ LDA P5 ; (v + 1)
2596 : d0 a9 __ BNE $2541 ; (nforml.l6 + 0)
.s1020:
2598 : c5 11 __ CMP P4 ; (v + 0)
259a : 90 a5 __ BCC $2541 ; (nforml.l6 + 0)
259c : 4c 77 24 JMP $2477 ; (nforml.s7 + 0)
--------------------------------------------------------------------
259f : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
25af : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
25bf : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
25ca : 20 d4 25 JSR $25d4 ; (getpch + 0)
25cd : c9 00 __ CMP #$00
25cf : f0 f9 __ BEQ $25ca ; (getch.s0 + 0)
25d1 : 85 1b __ STA ACCU + 0 
.s1001:
25d3 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
25d4 : 20 e4 ff JSR $ffe4 
25d7 : ae b7 2d LDX $2db7 ; (giocharmap + 0)
25da : e0 01 __ CPX #$01
25dc : 90 26 __ BCC $2604 ; (getpch + 48)
25de : c9 0d __ CMP #$0d
25e0 : d0 02 __ BNE $25e4 ; (getpch + 16)
25e2 : a9 0a __ LDA #$0a
25e4 : e0 02 __ CPX #$02
25e6 : 90 1c __ BCC $2604 ; (getpch + 48)
25e8 : c9 db __ CMP #$db
25ea : b0 18 __ BCS $2604 ; (getpch + 48)
25ec : c9 41 __ CMP #$41
25ee : 90 14 __ BCC $2604 ; (getpch + 48)
25f0 : c9 c1 __ CMP #$c1
25f2 : 90 02 __ BCC $25f6 ; (getpch + 34)
25f4 : 49 a0 __ EOR #$a0
25f6 : c9 7b __ CMP #$7b
25f8 : b0 0a __ BCS $2604 ; (getpch + 48)
25fa : c9 61 __ CMP #$61
25fc : b0 04 __ BCS $2602 ; (getpch + 46)
25fe : c9 5b __ CMP #$5b
2600 : b0 02 __ BCS $2604 ; (getpch + 48)
2602 : 49 20 __ EOR #$20
2604 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2605 : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2608 : 24 d7 __ BIT $d7 
260a : 10 01 __ BPL $260d ; (screen_setmode.s6 + 0)
.s1001:
260c : 60 __ __ RTS
.s6:
260d : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2610 : 09 00 __ ORA #$00
2612 : d0 0d __ BNE $2621 ; (fastmode.s1 + 0)
.s2:
2614 : 8d 30 d0 STA $d030 
2617 : ad 11 d0 LDA $d011 
261a : 29 7f __ AND #$7f
261c : 09 10 __ ORA #$10
261e : 4c 2b 26 JMP $262b ; (fastmode.s3 + 0)
.s1:
2621 : a9 01 __ LDA #$01
2623 : 8d 30 d0 STA $d030 
2626 : ad 11 d0 LDA $d011 
2629 : 29 6f __ AND #$6f
.s3:
262b : 8d 11 d0 STA $d011 
.s1001:
262e : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
262f : a4 0f __ LDY P2 ; (mode + 0)
2631 : be 95 2d LDX $2d95,y ; (__multab36L + 0)
2634 : 86 4a __ STX T1 + 0 
2636 : 86 4c __ STX T2 + 0 
2638 : bd 04 2e LDA $2e04,x ; (vdc_modes + 4)
263b : f0 08 __ BEQ $2645 ; (vdc_set_mode.s3 + 0)
.s4:
263d : ad b8 2d LDA $2db8 ; (vdc_state + 0)
2640 : c9 10 __ CMP #$10
2642 : d0 01 __ BNE $2645 ; (vdc_set_mode.s3 + 0)
2644 : 60 __ __ RTS
.s3:
2645 : 8c ba 2d STY $2dba ; (vdc_state + 2)
2648 : a9 8d __ LDA #$8d
264a : 8d bf 2d STA $2dbf ; (vdc_state + 7)
264d : a9 00 __ LDA #$00
264f : 8d ce 2d STA $2dce ; (vdc_state + 22)
2652 : 8d cf 2d STA $2dcf ; (vdc_state + 23)
2655 : 8d d0 2d STA $2dd0 ; (vdc_state + 24)
2658 : bd 00 2e LDA $2e00,x ; (vdc_modes + 0)
265b : 8d bb 2d STA $2dbb ; (vdc_state + 3)
265e : bd 01 2e LDA $2e01,x ; (vdc_modes + 1)
2661 : 8d bc 2d STA $2dbc ; (vdc_state + 4)
2664 : bd 02 2e LDA $2e02,x ; (vdc_modes + 2)
2667 : 8d bd 2d STA $2dbd ; (vdc_state + 5)
266a : bd 03 2e LDA $2e03,x ; (vdc_modes + 3)
266d : 8d be 2d STA $2dbe ; (vdc_state + 6)
2670 : bd 09 2e LDA $2e09,x ; (vdc_modes + 9)
2673 : 8d c4 2d STA $2dc4 ; (vdc_state + 12)
2676 : bd 0a 2e LDA $2e0a,x ; (vdc_modes + 10)
2679 : 8d c5 2d STA $2dc5 ; (vdc_state + 13)
267c : bd 0b 2e LDA $2e0b,x ; (vdc_modes + 11)
267f : 8d c6 2d STA $2dc6 ; (vdc_state + 14)
2682 : bd 0c 2e LDA $2e0c,x ; (vdc_modes + 12)
2685 : 8d c7 2d STA $2dc7 ; (vdc_state + 15)
2688 : bd 0d 2e LDA $2e0d,x ; (vdc_modes + 13)
268b : 8d c8 2d STA $2dc8 ; (vdc_state + 16)
268e : bd 0e 2e LDA $2e0e,x ; (vdc_modes + 14)
2691 : 8d c9 2d STA $2dc9 ; (vdc_state + 17)
2694 : bd 0f 2e LDA $2e0f,x ; (vdc_modes + 15)
2697 : 8d ca 2d STA $2dca ; (vdc_state + 18)
269a : bd 10 2e LDA $2e10,x ; (vdc_modes + 16)
269d : 8d cb 2d STA $2dcb ; (vdc_state + 19)
26a0 : bd 11 2e LDA $2e11,x ; (vdc_modes + 17)
26a3 : 8d cc 2d STA $2dcc ; (vdc_state + 20)
26a6 : bd 12 2e LDA $2e12,x ; (vdc_modes + 18)
26a9 : 8d cd 2d STA $2dcd ; (vdc_state + 21)
26ac : bd 05 2e LDA $2e05,x ; (vdc_modes + 5)
26af : 85 4d __ STA T3 + 0 
26b1 : 8d c0 2d STA $2dc0 ; (vdc_state + 8)
26b4 : bd 06 2e LDA $2e06,x ; (vdc_modes + 6)
26b7 : 85 4e __ STA T3 + 1 
26b9 : 8d c1 2d STA $2dc1 ; (vdc_state + 9)
26bc : bd 07 2e LDA $2e07,x ; (vdc_modes + 7)
26bf : 85 4f __ STA T5 + 0 
26c1 : 8d c2 2d STA $2dc2 ; (vdc_state + 10)
26c4 : bd 08 2e LDA $2e08,x ; (vdc_modes + 8)
26c7 : 85 50 __ STA T5 + 1 
26c9 : 8d c3 2d STA $2dc3 ; (vdc_state + 11)
26cc : 20 a4 27 JSR $27a4 ; (vdc_set_multab.s0 + 0)
26cf : a9 22 __ LDA #$22
26d1 : 8d 00 d6 STA $d600 
.l295:
26d4 : 2c 00 d6 BIT $d600 
26d7 : 10 fb __ BPL $26d4 ; (vdc_set_mode.l295 + 0)
.s11:
26d9 : a9 80 __ LDA #$80
26db : 8d 01 d6 STA $d601 
26de : a9 0c __ LDA #$0c
26e0 : 8d 00 d6 STA $d600 
.l297:
26e3 : 2c 00 d6 BIT $d600 
26e6 : 10 fb __ BPL $26e3 ; (vdc_set_mode.l297 + 0)
.s17:
26e8 : a5 4e __ LDA T3 + 1 
26ea : 8d 01 d6 STA $d601 
26ed : a9 0d __ LDA #$0d
26ef : 8d 00 d6 STA $d600 
.l299:
26f2 : 2c 00 d6 BIT $d600 
26f5 : 10 fb __ BPL $26f2 ; (vdc_set_mode.l299 + 0)
.s22:
26f7 : a5 4d __ LDA T3 + 0 
26f9 : 8d 01 d6 STA $d601 
26fc : a9 14 __ LDA #$14
26fe : 8d 00 d6 STA $d600 
.l301:
2701 : 2c 00 d6 BIT $d600 
2704 : 10 fb __ BPL $2701 ; (vdc_set_mode.l301 + 0)
.s27:
2706 : a5 50 __ LDA T5 + 1 
2708 : 8d 01 d6 STA $d601 
270b : a9 15 __ LDA #$15
270d : 8d 00 d6 STA $d600 
.l303:
2710 : 2c 00 d6 BIT $d600 
2713 : 10 fb __ BPL $2710 ; (vdc_set_mode.l303 + 0)
.s32:
2715 : a5 4f __ LDA T5 + 0 
2717 : 8d 01 d6 STA $d601 
271a : a6 4a __ LDX T1 + 0 
271c : bd 0e 2e LDA $2e0e,x ; (vdc_modes + 14)
271f : a2 1c __ LDX #$1c
2721 : 8e 00 d6 STX $d600 
.l305:
2724 : 2c 00 d6 BIT $d600 
2727 : 10 fb __ BPL $2724 ; (vdc_set_mode.l305 + 0)
.s39:
2729 : aa __ __ TAX
272a : ad 01 d6 LDA $d601 
272d : 29 10 __ AND #$10
272f : 85 4f __ STA T5 + 0 
2731 : a9 1c __ LDA #$1c
2733 : 8d 00 d6 STA $d600 
2736 : 8a __ __ TXA
2737 : 29 e0 __ AND #$e0
2739 : 05 4f __ ORA T5 + 0 
.l307:
273b : 2c 00 d6 BIT $d600 
273e : 10 fb __ BPL $273b ; (vdc_set_mode.l307 + 0)
.s45:
2740 : 8d 01 d6 STA $d601 
2743 : 20 ff 27 JSR $27ff ; (vdc_restore_charsets.s0 + 0)
2746 : 18 __ __ CLC
2747 : a9 13 __ LDA #$13
2749 : 65 4a __ ADC T1 + 0 
274b : 85 4a __ STA T1 + 0 
274d : a9 2e __ LDA #$2e
274f : 69 00 __ ADC #$00
2751 : 85 4b __ STA T1 + 1 
2753 : 18 __ __ CLC
2754 : a5 4c __ LDA T2 + 0 
2756 : 69 13 __ ADC #$13
2758 : 85 4d __ STA T3 + 0 
275a : a9 00 __ LDA #$00
275c : 85 43 __ STA T0 + 0 
275e : 69 2e __ ADC #$2e
2760 : 85 4e __ STA T3 + 1 
.l46:
2762 : a4 43 __ LDY T0 + 0 
2764 : b1 4a __ LDA (T1 + 0),y 
2766 : 85 47 __ STA T7 + 0 
2768 : c8 __ __ INY
2769 : b1 4a __ LDA (T1 + 0),y 
276b : aa __ __ TAX
276c : a5 47 __ LDA T7 + 0 
276e : 8d 00 d6 STA $d600 
2771 : c8 __ __ INY
2772 : 84 43 __ STY T0 + 0 
.l309:
2774 : 2c 00 d6 BIT $d600 
2777 : 10 fb __ BPL $2774 ; (vdc_set_mode.l309 + 0)
.s52:
2779 : 8e 01 d6 STX $d601 
277c : b1 4d __ LDA (T3 + 0),y 
277e : c9 ff __ CMP #$ff
2780 : d0 e0 __ BNE $2762 ; (vdc_set_mode.l46 + 0)
.s47:
2782 : a6 4c __ LDX T2 + 0 
2784 : bd 04 2e LDA $2e04,x ; (vdc_modes + 4)
2787 : f0 08 __ BEQ $2791 ; (vdc_set_mode.s55 + 0)
.s56:
2789 : ad b9 2d LDA $2db9 ; (vdc_state + 1)
278c : d0 03 __ BNE $2791 ; (vdc_set_mode.s55 + 0)
.s53:
278e : 20 5a 28 JSR $285a ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2791 : 20 17 1d JSR $1d17 ; (vdc_cls.s0 + 0)
2794 : a9 22 __ LDA #$22
2796 : 8d 00 d6 STA $d600 
.l314:
2799 : 2c 00 d6 BIT $d600 
279c : 10 fb __ BPL $2799 ; (vdc_set_mode.l314 + 0)
.s62:
279e : a9 7d __ LDA #$7d
27a0 : 8d 01 d6 STA $d601 
.s1001:
27a3 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
27a4 : ad be 2d LDA $2dbe ; (vdc_state + 6)
27a7 : 85 1c __ STA ACCU + 1 
27a9 : ad bd 2d LDA $2dbd ; (vdc_state + 5)
27ac : 85 1b __ STA ACCU + 0 
27ae : 05 1c __ ORA ACCU + 1 
27b0 : f0 4c __ BEQ $27fe ; (vdc_set_multab.s1001 + 0)
.s5:
27b2 : ad bb 2d LDA $2dbb ; (vdc_state + 3)
27b5 : 18 __ __ CLC
27b6 : 6d d0 2d ADC $2dd0 ; (vdc_state + 24)
27b9 : 85 43 __ STA T2 + 0 
27bb : ad bc 2d LDA $2dbc ; (vdc_state + 4)
27be : 69 00 __ ADC #$00
27c0 : 85 44 __ STA T2 + 1 
27c2 : a9 00 __ LDA #$00
27c4 : 85 45 __ STA T3 + 0 
27c6 : 85 46 __ STA T3 + 1 
27c8 : a9 00 __ LDA #$00
27ca : 85 47 __ STA T4 + 0 
27cc : a9 2f __ LDA #$2f
27ce : 85 48 __ STA T4 + 1 
27d0 : a2 00 __ LDX #$00
.l2:
27d2 : a5 45 __ LDA T3 + 0 
27d4 : a0 00 __ LDY #$00
27d6 : 91 47 __ STA (T4 + 0),y 
27d8 : a5 46 __ LDA T3 + 1 
27da : c8 __ __ INY
27db : 91 47 __ STA (T4 + 0),y 
27dd : 18 __ __ CLC
27de : a5 43 __ LDA T2 + 0 
27e0 : 65 45 __ ADC T3 + 0 
27e2 : 85 45 __ STA T3 + 0 
27e4 : a5 44 __ LDA T2 + 1 
27e6 : 65 46 __ ADC T3 + 1 
27e8 : 85 46 __ STA T3 + 1 
27ea : 18 __ __ CLC
27eb : a5 47 __ LDA T4 + 0 
27ed : 69 02 __ ADC #$02
27ef : 85 47 __ STA T4 + 0 
27f1 : 90 02 __ BCC $27f5 ; (vdc_set_multab.s1006 + 0)
.s1005:
27f3 : e6 48 __ INC T4 + 1 
.s1006:
27f5 : e8 __ __ INX
27f6 : a5 1c __ LDA ACCU + 1 
27f8 : d0 d8 __ BNE $27d2 ; (vdc_set_multab.l2 + 0)
.s1002:
27fa : e4 1b __ CPX ACCU + 0 
27fc : 90 d4 __ BCC $27d2 ; (vdc_set_multab.l2 + 0)
.s1001:
27fe : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
27ff : ad c8 2d LDA $2dc8 ; (vdc_state + 16)
2802 : 85 0d __ STA P0 
2804 : ad c9 2d LDA $2dc9 ; (vdc_state + 17)
2807 : 85 0e __ STA P1 
2809 : 20 1f 1f JSR $1f1f ; (vdc_mem_addr.s0 + 0)
280c : a9 00 __ LDA #$00
280e : 85 1b __ STA ACCU + 0 
2810 : 85 43 __ STA T1 + 0 
2812 : a9 d0 __ LDA #$d0
2814 : 85 1c __ STA ACCU + 1 
2816 : a9 02 __ LDA #$02
2818 : 85 44 __ STA T1 + 1 
.l2:
281a : a2 08 __ LDX #$08
.l6:
281c : a9 01 __ LDA #$01
281e : 8d 00 ff STA $ff00 
2821 : a0 00 __ LDY #$00
2823 : b1 1b __ LDA (ACCU + 0),y 
2825 : a0 0e __ LDY #$0e
2827 : 8c 00 ff STY $ff00 
282a : a8 __ __ TAY
282b : e6 1b __ INC ACCU + 0 
282d : d0 02 __ BNE $2831 ; (vdc_restore_charsets.l106 + 0)
.s1006:
282f : e6 1c __ INC ACCU + 1 
.l106:
2831 : 2c 00 d6 BIT $d600 
2834 : 10 fb __ BPL $2831 ; (vdc_restore_charsets.l106 + 0)
.s11:
2836 : 8c 01 d6 STY $d601 
2839 : ca __ __ DEX
283a : d0 e0 __ BNE $281c ; (vdc_restore_charsets.l6 + 0)
.s8:
283c : a2 08 __ LDX #$08
.l13:
283e : 2c 00 d6 BIT $d600 
2841 : 10 fb __ BPL $283e ; (vdc_restore_charsets.l13 + 0)
.s18:
2843 : a9 00 __ LDA #$00
2845 : 8d 01 d6 STA $d601 
2848 : ca __ __ DEX
2849 : d0 f3 __ BNE $283e ; (vdc_restore_charsets.l13 + 0)
.s3:
284b : a5 43 __ LDA T1 + 0 
284d : d0 02 __ BNE $2851 ; (vdc_restore_charsets.s1009 + 0)
.s1008:
284f : c6 44 __ DEC T1 + 1 
.s1009:
2851 : c6 43 __ DEC T1 + 0 
2853 : d0 c5 __ BNE $281a ; (vdc_restore_charsets.l2 + 0)
.s1010:
2855 : a5 44 __ LDA T1 + 1 
2857 : d0 c1 __ BNE $281a ; (vdc_restore_charsets.l2 + 0)
.s1001:
2859 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
285a : ad b8 2d LDA $2db8 ; (vdc_state + 0)
285d : c9 10 __ CMP #$10
285f : f0 4d __ BEQ $28ae ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
2861 : ad b9 2d LDA $2db9 ; (vdc_state + 1)
2864 : d0 48 __ BNE $28ae ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
2866 : a9 22 __ LDA #$22
2868 : 8d 00 d6 STA $d600 
.l120:
286b : 2c 00 d6 BIT $d600 
286e : 10 fb __ BPL $286b ; (vdc_set_extended_memsize.l120 + 0)
.s11:
2870 : a9 80 __ LDA #$80
2872 : 8d 01 d6 STA $d601 
2875 : 20 af 28 JSR $28af ; (vdc_wipe_mem.s0 + 0)
2878 : a9 1c __ LDA #$1c
287a : 8d 00 d6 STA $d600 
.l122:
287d : 2c 00 d6 BIT $d600 
2880 : 10 fb __ BPL $287d ; (vdc_set_extended_memsize.l122 + 0)
.s17:
2882 : ad 01 d6 LDA $d601 
2885 : 09 10 __ ORA #$10
2887 : a2 1c __ LDX #$1c
2889 : 8e 00 d6 STX $d600 
.l124:
288c : 2c 00 d6 BIT $d600 
288f : 10 fb __ BPL $288c ; (vdc_set_extended_memsize.l124 + 0)
.s23:
2891 : 8d 01 d6 STA $d601 
2894 : 20 ff 27 JSR $27ff ; (vdc_restore_charsets.s0 + 0)
2897 : 20 17 1d JSR $1d17 ; (vdc_cls.s0 + 0)
289a : a9 22 __ LDA #$22
289c : 8d 00 d6 STA $d600 
.l126:
289f : 2c 00 d6 BIT $d600 
28a2 : 10 fb __ BPL $289f ; (vdc_set_extended_memsize.l126 + 0)
.s29:
28a4 : a9 7d __ LDA #$7d
28a6 : 8d 01 d6 STA $d601 
28a9 : a9 01 __ LDA #$01
28ab : 8d b9 2d STA $2db9 ; (vdc_state + 1)
.s1001:
28ae : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
28af : a9 00 __ LDA #$00
28b1 : 85 44 __ STA T0 + 1 
28b3 : 85 0d __ STA P0 
28b5 : a9 ff __ LDA #$ff
28b7 : 85 45 __ STA T1 + 0 
.l2:
28b9 : 20 9b 2d JSR $2d9b ; (vdc_mem_addr@proxy + 0)
.l252:
28bc : 2c 00 d6 BIT $d600 
28bf : 10 fb __ BPL $28bc ; (vdc_wipe_mem.l252 + 0)
.s8:
28c1 : a9 00 __ LDA #$00
28c3 : 8d 01 d6 STA $d601 
28c6 : a9 18 __ LDA #$18
28c8 : 8d 00 d6 STA $d600 
.l254:
28cb : 2c 00 d6 BIT $d600 
28ce : 10 fb __ BPL $28cb ; (vdc_wipe_mem.l254 + 0)
.s14:
28d0 : ad 01 d6 LDA $d601 
28d3 : 29 7f __ AND #$7f
28d5 : a2 18 __ LDX #$18
28d7 : 8e 00 d6 STX $d600 
.l256:
28da : 2c 00 d6 BIT $d600 
28dd : 10 fb __ BPL $28da ; (vdc_wipe_mem.l256 + 0)
.s20:
28df : 8d 01 d6 STA $d601 
28e2 : a9 1e __ LDA #$1e
28e4 : 8d 00 d6 STA $d600 
.l258:
28e7 : 2c 00 d6 BIT $d600 
28ea : 10 fb __ BPL $28e7 ; (vdc_wipe_mem.l258 + 0)
.s25:
28ec : e6 44 __ INC T0 + 1 
28ee : a9 ff __ LDA #$ff
28f0 : 8d 01 d6 STA $d601 
28f3 : c6 45 __ DEC T1 + 0 
28f5 : d0 c2 __ BNE $28b9 ; (vdc_wipe_mem.l2 + 0)
.s4:
28f7 : 20 9b 2d JSR $2d9b ; (vdc_mem_addr@proxy + 0)
.l261:
28fa : 2c 00 d6 BIT $d600 
28fd : 10 fb __ BPL $28fa ; (vdc_wipe_mem.l261 + 0)
.s29:
28ff : a9 00 __ LDA #$00
2901 : 8d 01 d6 STA $d601 
2904 : a9 18 __ LDA #$18
2906 : 8d 00 d6 STA $d600 
.l263:
2909 : 2c 00 d6 BIT $d600 
290c : 10 fb __ BPL $2909 ; (vdc_wipe_mem.l263 + 0)
.s35:
290e : ad 01 d6 LDA $d601 
2911 : 29 7f __ AND #$7f
2913 : a2 18 __ LDX #$18
2915 : 8e 00 d6 STX $d600 
.l265:
2918 : 2c 00 d6 BIT $d600 
291b : 10 fb __ BPL $2918 ; (vdc_wipe_mem.l265 + 0)
.s41:
291d : 8d 01 d6 STA $d601 
2920 : a9 1e __ LDA #$1e
2922 : 8d 00 d6 STA $d600 
.l267:
2925 : 2c 00 d6 BIT $d600 
2928 : 10 fb __ BPL $2925 ; (vdc_wipe_mem.l267 + 0)
.s46:
292a : a9 ff __ LDA #$ff
292c : 8d 01 d6 STA $d601 
.s1001:
292f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_redef_charset: ; vdc_redef_charset(u16,u8*,u16)->void
.s0:
2930 : 20 17 1f JSR $1f17 ; (vdc_mem_addr@proxy + 0)
2933 : a9 00 __ LDA #$00
2935 : 85 1b __ STA ACCU + 0 
.l2:
2937 : a2 08 __ LDX #$08
.l5:
2939 : a0 00 __ LDY #$00
293b : b1 11 __ LDA (P4),y ; (sp + 0)
293d : e6 11 __ INC P4 ; (sp + 0)
293f : d0 02 __ BNE $2943 ; (vdc_redef_charset.l105 + 0)
.s1006:
2941 : e6 12 __ INC P5 ; (sp + 1)
.l105:
2943 : 2c 00 d6 BIT $d600 
2946 : 10 fb __ BPL $2943 ; (vdc_redef_charset.l105 + 0)
.s10:
2948 : 8d 01 d6 STA $d601 
294b : ca __ __ DEX
294c : d0 eb __ BNE $2939 ; (vdc_redef_charset.l5 + 0)
.s7:
294e : a2 08 __ LDX #$08
.l12:
2950 : 2c 00 d6 BIT $d600 
2953 : 10 fb __ BPL $2950 ; (vdc_redef_charset.l12 + 0)
.s17:
2955 : a9 00 __ LDA #$00
2957 : 8d 01 d6 STA $d601 
295a : ca __ __ DEX
295b : d0 f3 __ BNE $2950 ; (vdc_redef_charset.l12 + 0)
.s14:
295d : c6 1b __ DEC ACCU + 0 
295f : d0 d6 __ BNE $2937 ; (vdc_redef_charset.l2 + 0)
.s1001:
2961 : 60 __ __ RTS
--------------------------------------------------------------------
show_noscroll: ; show_noscroll()->void
.s0:
2962 : ad d7 2d LDA $2dd7 ; (view + 6)
2965 : 85 15 __ STA P8 
2967 : 85 11 __ STA P4 
2969 : a9 ea __ LDA #$ea
296b : 85 0d __ STA P0 
296d : a9 31 __ LDA #$31
296f : 85 0e __ STA P1 
2971 : ad d9 2d LDA $2dd9 ; (view + 8)
2974 : 85 17 __ STA P10 
2976 : 85 13 __ STA P6 
2978 : ad da 2d LDA $2dda ; (view + 9)
297b : 85 18 __ STA P11 
297d : 85 14 __ STA P7 
297f : ad d1 2d LDA $2dd1 ; (view + 0)
2982 : 85 0f __ STA P2 
2984 : ad d2 2d LDA $2dd2 ; (view + 1)
2987 : 85 10 __ STA P3 
2989 : ad d8 2d LDA $2dd8 ; (view + 7)
298c : 85 16 __ STA P9 
298e : 85 12 __ STA P5 
2990 : cd bc 2d CMP $2dbc ; (vdc_state + 4)
2993 : d0 05 __ BNE $299a ; (show_noscroll.s1005 + 0)
.s1004:
2995 : a5 11 __ LDA P4 
2997 : cd bb 2d CMP $2dbb ; (vdc_state + 3)
.s1005:
299a : 90 06 __ BCC $29a2 ; (show_noscroll.s1 + 0)
.s3:
299c : a9 00 __ LDA #$00
299e : 85 43 __ STA T0 + 0 
29a0 : b0 10 __ BCS $29b2 ; (show_noscroll.s8 + 0)
.s1:
29a2 : ad bb 2d LDA $2dbb ; (vdc_state + 3)
29a5 : 38 __ __ SEC
29a6 : e5 11 __ SBC P4 
29a8 : 85 43 __ STA T0 + 0 
29aa : ad bc 2d LDA $2dbc ; (vdc_state + 4)
29ad : e5 12 __ SBC P5 
29af : 4a __ __ LSR
29b0 : 66 43 __ ROR T0 + 0 
.s8:
29b2 : a5 14 __ LDA P7 
29b4 : a0 00 __ LDY #$00
29b6 : cd be 2d CMP $2dbe ; (vdc_state + 6)
29b9 : d0 05 __ BNE $29c0 ; (show_noscroll.s1003 + 0)
.s1002:
29bb : a5 13 __ LDA P6 
29bd : cd bd 2d CMP $2dbd ; (vdc_state + 5)
.s1003:
29c0 : b0 10 __ BCS $29d2 ; (show_noscroll.s6 + 0)
.s4:
29c2 : ad bd 2d LDA $2dbd ; (vdc_state + 5)
29c5 : 38 __ __ SEC
29c6 : e5 13 __ SBC P6 
29c8 : aa __ __ TAX
29c9 : ad be 2d LDA $2dbe ; (vdc_state + 6)
29cc : e5 14 __ SBC P7 
29ce : 4a __ __ LSR
29cf : 8a __ __ TXA
29d0 : 6a __ __ ROR
29d1 : a8 __ __ TAY
.s6:
29d2 : 8c ff 31 STY $31ff ; (sstack + 1)
29d5 : a5 43 __ LDA T0 + 0 
29d7 : 8d fe 31 STA $31fe ; (sstack + 0)
29da : 20 f6 29 JSR $29f6 ; (vdcwin_viewport_init.s0 + 0)
29dd : a9 ea __ LDA #$ea
29df : 85 15 __ STA P8 
29e1 : a9 31 __ LDA #$31
29e3 : 85 16 __ STA P9 
29e5 : 20 91 2a JSR $2a91 ; (vdcwin_cpy_viewport.s0 + 0)
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->void
.s0:
29e8 : 20 e4 ff JSR $ffe4 
29eb : c9 00 __ CMP #$00
29ed : f0 f9 __ BEQ $29e8 ; (vdcwin_getch.s0 + 0)
29ef : 85 1b __ STA ACCU + 0 
29f1 : a9 00 __ LDA #$00
29f3 : 85 1c __ STA ACCU + 1 
.s1001:
29f5 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_viewport_init: ; vdcwin_viewport_init(struct VDCViewport*,u8*,u16,u16,u16,u16,u8,u8)->void
.s0:
29f6 : a9 00 __ LDA #$00
29f8 : a0 06 __ LDY #$06
29fa : 91 0d __ STA (P0),y ; (vp + 0)
29fc : c8 __ __ INY
29fd : 91 0d __ STA (P0),y ; (vp + 0)
29ff : c8 __ __ INY
2a00 : 91 0d __ STA (P0),y ; (vp + 0)
2a02 : c8 __ __ INY
2a03 : 91 0d __ STA (P0),y ; (vp + 0)
2a05 : a0 0e __ LDY #$0e
2a07 : 91 0d __ STA (P0),y ; (vp + 0)
2a09 : c8 __ __ INY
2a0a : 91 0d __ STA (P0),y ; (vp + 0)
2a0c : a5 0f __ LDA P2 ; (sourcebase + 0)
2a0e : a0 00 __ LDY #$00
2a10 : 91 0d __ STA (P0),y ; (vp + 0)
2a12 : a5 10 __ LDA P3 ; (sourcebase + 1)
2a14 : c8 __ __ INY
2a15 : 91 0d __ STA (P0),y ; (vp + 0)
2a17 : a5 11 __ LDA P4 ; (sourcewidth + 0)
2a19 : c8 __ __ INY
2a1a : 91 0d __ STA (P0),y ; (vp + 0)
2a1c : a5 12 __ LDA P5 ; (sourcewidth + 1)
2a1e : c8 __ __ INY
2a1f : 91 0d __ STA (P0),y ; (vp + 0)
2a21 : a5 13 __ LDA P6 ; (sourceheight + 0)
2a23 : c8 __ __ INY
2a24 : 91 0d __ STA (P0),y ; (vp + 0)
2a26 : a5 14 __ LDA P7 ; (sourceheight + 1)
2a28 : c8 __ __ INY
2a29 : 91 0d __ STA (P0),y ; (vp + 0)
2a2b : ad fe 31 LDA $31fe ; (sstack + 0)
2a2e : 85 1b __ STA ACCU + 0 
2a30 : a0 0a __ LDY #$0a
2a32 : 91 0d __ STA (P0),y ; (vp + 0)
2a34 : ad ff 31 LDA $31ff ; (sstack + 1)
2a37 : 85 1c __ STA ACCU + 1 
2a39 : c8 __ __ INY
2a3a : 91 0d __ STA (P0),y ; (vp + 0)
2a3c : a5 15 __ LDA P8 ; (viewwidth + 0)
2a3e : c8 __ __ INY
2a3f : 91 0d __ STA (P0),y ; (vp + 0)
2a41 : a5 17 __ LDA P10 ; (viewheight + 0)
2a43 : c8 __ __ INY
2a44 : 91 0d __ STA (P0),y ; (vp + 0)
2a46 : 06 1c __ ASL ACCU + 1 
2a48 : a6 1c __ LDX ACCU + 1 
2a4a : bd 00 2f LDA $2f00,x ; (multab + 0)
2a4d : 18 __ __ CLC
2a4e : 65 1b __ ADC ACCU + 0 
2a50 : 85 1c __ STA ACCU + 1 
2a52 : bd 01 2f LDA $2f01,x ; (multab + 1)
2a55 : 69 00 __ ADC #$00
2a57 : a8 __ __ TAY
2a58 : ad c0 2d LDA $2dc0 ; (vdc_state + 8)
2a5b : 18 __ __ CLC
2a5c : 65 1c __ ADC ACCU + 1 
2a5e : 85 1c __ STA ACCU + 1 
2a60 : 98 __ __ TYA
2a61 : 6d c1 2d ADC $2dc1 ; (vdc_state + 9)
2a64 : a0 11 __ LDY #$11
2a66 : 91 0d __ STA (P0),y ; (vp + 0)
2a68 : a5 1c __ LDA ACCU + 1 
2a6a : 88 __ __ DEY
2a6b : 91 0d __ STA (P0),y ; (vp + 0)
2a6d : bd 00 2f LDA $2f00,x ; (multab + 0)
2a70 : 18 __ __ CLC
2a71 : 65 1b __ ADC ACCU + 0 
2a73 : 85 1b __ STA ACCU + 0 
2a75 : bd 01 2f LDA $2f01,x ; (multab + 1)
2a78 : 69 00 __ ADC #$00
2a7a : aa __ __ TAX
2a7b : ad c2 2d LDA $2dc2 ; (vdc_state + 10)
2a7e : 18 __ __ CLC
2a7f : 65 1b __ ADC ACCU + 0 
2a81 : 85 1b __ STA ACCU + 0 
2a83 : 8a __ __ TXA
2a84 : 6d c3 2d ADC $2dc3 ; (vdc_state + 11)
2a87 : a0 13 __ LDY #$13
2a89 : 91 0d __ STA (P0),y ; (vp + 0)
2a8b : a5 1b __ LDA ACCU + 0 
2a8d : 88 __ __ DEY
2a8e : 91 0d __ STA (P0),y ; (vp + 0)
.s1001:
2a90 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
2a91 : a5 15 __ LDA P8 ; (viewport + 0)
2a93 : 85 43 __ STA T0 + 0 
2a95 : a5 16 __ LDA P9 ; (viewport + 1)
2a97 : 85 44 __ STA T0 + 1 
2a99 : a0 08 __ LDY #$08
2a9b : b1 15 __ LDA (P8),y ; (viewport + 0)
2a9d : 85 1b __ STA ACCU + 0 
2a9f : c8 __ __ INY
2aa0 : b1 15 __ LDA (P8),y ; (viewport + 0)
2aa2 : 85 1c __ STA ACCU + 1 
2aa4 : a0 02 __ LDY #$02
2aa6 : b1 15 __ LDA (P8),y ; (viewport + 0)
2aa8 : 85 03 __ STA WORK + 0 
2aaa : c8 __ __ INY
2aab : b1 15 __ LDA (P8),y ; (viewport + 0)
2aad : 85 04 __ STA WORK + 1 
2aaf : 20 f1 2b JSR $2bf1 ; (mul16 + 0)
2ab2 : a0 00 __ LDY #$00
2ab4 : 84 49 __ STY T3 + 0 
2ab6 : b1 15 __ LDA (P8),y ; (viewport + 0)
2ab8 : 18 __ __ CLC
2ab9 : 65 05 __ ADC WORK + 2 
2abb : aa __ __ TAX
2abc : c8 __ __ INY
2abd : b1 15 __ LDA (P8),y ; (viewport + 0)
2abf : 65 06 __ ADC WORK + 3 
2ac1 : 85 46 __ STA T1 + 1 
2ac3 : 8a __ __ TXA
2ac4 : 18 __ __ CLC
2ac5 : a0 06 __ LDY #$06
2ac7 : 71 15 __ ADC (P8),y ; (viewport + 0)
2ac9 : 85 45 __ STA T1 + 0 
2acb : a5 46 __ LDA T1 + 1 
2acd : c8 __ __ INY
2ace : 71 15 __ ADC (P8),y ; (viewport + 0)
2ad0 : 85 46 __ STA T1 + 1 
2ad2 : a0 10 __ LDY #$10
2ad4 : b1 15 __ LDA (P8),y ; (viewport + 0)
2ad6 : aa __ __ TAX
2ad7 : c8 __ __ INY
2ad8 : b1 15 __ LDA (P8),y ; (viewport + 0)
2ada : 4c 0d 2b JMP $2b0d ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
2add : 86 0f __ STX P2 
2adf : a5 45 __ LDA T1 + 0 
2ae1 : 85 11 __ STA P4 
2ae3 : a5 46 __ LDA T1 + 1 
2ae5 : 85 12 __ STA P5 
2ae7 : 88 __ __ DEY
2ae8 : b1 43 __ LDA (T0 + 0),y 
2aea : 85 13 __ STA P6 
2aec : 20 c6 2b JSR $2bc6 ; (vdc_cpytovdc@proxy + 0)
2aef : a5 45 __ LDA T1 + 0 
2af1 : 18 __ __ CLC
2af2 : a0 02 __ LDY #$02
2af4 : 71 43 __ ADC (T0 + 0),y 
2af6 : 85 45 __ STA T1 + 0 
2af8 : a5 46 __ LDA T1 + 1 
2afa : c8 __ __ INY
2afb : 71 43 __ ADC (T0 + 0),y 
2afd : 85 46 __ STA T1 + 1 
2aff : ad bb 2d LDA $2dbb ; (vdc_state + 3)
2b02 : 18 __ __ CLC
2b03 : 65 0f __ ADC P2 
2b05 : aa __ __ TAX
2b06 : ad bc 2d LDA $2dbc ; (vdc_state + 4)
2b09 : 65 10 __ ADC P3 
2b0b : e6 49 __ INC T3 + 0 
.l1:
2b0d : 85 10 __ STA P3 
2b0f : a5 49 __ LDA T3 + 0 
2b11 : a0 0d __ LDY #$0d
2b13 : d1 43 __ CMP (T0 + 0),y 
2b15 : 90 c6 __ BCC $2add ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
2b17 : a0 02 __ LDY #$02
2b19 : b1 43 __ LDA (T0 + 0),y 
2b1b : 85 45 __ STA T1 + 0 
2b1d : 85 03 __ STA WORK + 0 
2b1f : c8 __ __ INY
2b20 : b1 43 __ LDA (T0 + 0),y 
2b22 : 85 46 __ STA T1 + 1 
2b24 : 85 04 __ STA WORK + 1 
2b26 : a0 08 __ LDY #$08
2b28 : b1 43 __ LDA (T0 + 0),y 
2b2a : 85 1b __ STA ACCU + 0 
2b2c : c8 __ __ INY
2b2d : b1 43 __ LDA (T0 + 0),y 
2b2f : 85 1c __ STA ACCU + 1 
2b31 : 20 f1 2b JSR $2bf1 ; (mul16 + 0)
2b34 : a0 00 __ LDY #$00
2b36 : 84 49 __ STY T3 + 0 
2b38 : b1 43 __ LDA (T0 + 0),y 
2b3a : 18 __ __ CLC
2b3b : 65 05 __ ADC WORK + 2 
2b3d : aa __ __ TAX
2b3e : c8 __ __ INY
2b3f : b1 43 __ LDA (T0 + 0),y 
2b41 : 65 06 __ ADC WORK + 3 
2b43 : 85 48 __ STA T2 + 1 
2b45 : 8a __ __ TXA
2b46 : 18 __ __ CLC
2b47 : a0 06 __ LDY #$06
2b49 : 71 43 __ ADC (T0 + 0),y 
2b4b : 85 47 __ STA T2 + 0 
2b4d : a5 48 __ LDA T2 + 1 
2b4f : c8 __ __ INY
2b50 : 71 43 __ ADC (T0 + 0),y 
2b52 : 85 48 __ STA T2 + 1 
2b54 : a0 04 __ LDY #$04
2b56 : b1 43 __ LDA (T0 + 0),y 
2b58 : 85 1b __ STA ACCU + 0 
2b5a : c8 __ __ INY
2b5b : b1 43 __ LDA (T0 + 0),y 
2b5d : 85 1c __ STA ACCU + 1 
2b5f : a5 45 __ LDA T1 + 0 
2b61 : 85 03 __ STA WORK + 0 
2b63 : a5 46 __ LDA T1 + 1 
2b65 : 85 04 __ STA WORK + 1 
2b67 : 20 f1 2b JSR $2bf1 ; (mul16 + 0)
2b6a : 18 __ __ CLC
2b6b : a5 47 __ LDA T2 + 0 
2b6d : 65 05 __ ADC WORK + 2 
2b6f : aa __ __ TAX
2b70 : a5 48 __ LDA T2 + 1 
2b72 : 65 06 __ ADC WORK + 3 
2b74 : a8 __ __ TAY
2b75 : 8a __ __ TXA
2b76 : 18 __ __ CLC
2b77 : 69 30 __ ADC #$30
2b79 : 85 45 __ STA T1 + 0 
2b7b : 90 01 __ BCC $2b7e ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
2b7d : c8 __ __ INY
.s1007:
2b7e : 84 46 __ STY T1 + 1 
2b80 : a0 12 __ LDY #$12
2b82 : b1 43 __ LDA (T0 + 0),y 
2b84 : aa __ __ TAX
2b85 : c8 __ __ INY
2b86 : b1 43 __ LDA (T0 + 0),y 
2b88 : 4c bb 2b JMP $2bbb ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
2b8b : 86 0f __ STX P2 
2b8d : a5 45 __ LDA T1 + 0 
2b8f : 85 11 __ STA P4 
2b91 : a5 46 __ LDA T1 + 1 
2b93 : 85 12 __ STA P5 
2b95 : 88 __ __ DEY
2b96 : b1 15 __ LDA (P8),y ; (viewport + 0)
2b98 : 85 13 __ STA P6 
2b9a : 20 c6 2b JSR $2bc6 ; (vdc_cpytovdc@proxy + 0)
2b9d : a5 45 __ LDA T1 + 0 
2b9f : 18 __ __ CLC
2ba0 : a0 02 __ LDY #$02
2ba2 : 71 15 __ ADC (P8),y ; (viewport + 0)
2ba4 : 85 45 __ STA T1 + 0 
2ba6 : a5 46 __ LDA T1 + 1 
2ba8 : c8 __ __ INY
2ba9 : 71 15 __ ADC (P8),y ; (viewport + 0)
2bab : 85 46 __ STA T1 + 1 
2bad : ad bb 2d LDA $2dbb ; (vdc_state + 3)
2bb0 : 18 __ __ CLC
2bb1 : 65 0f __ ADC P2 
2bb3 : aa __ __ TAX
2bb4 : ad bc 2d LDA $2dbc ; (vdc_state + 4)
2bb7 : 65 10 __ ADC P3 
2bb9 : e6 49 __ INC T3 + 0 
.l5:
2bbb : 85 10 __ STA P3 
2bbd : a5 49 __ LDA T3 + 0 
2bbf : a0 0d __ LDY #$0d
2bc1 : d1 15 __ CMP (P8),y ; (viewport + 0)
2bc3 : 90 c6 __ BCC $2b8b ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
2bc5 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cpytovdc@proxy: ; vdc_cpytovdc@proxy
2bc6 : a9 00 __ LDA #$00
2bc8 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_cpytovdc: ; vdc_cpytovdc(u16,u8*,u16)->void
.s0:
2bca : 20 17 1f JSR $1f17 ; (vdc_mem_addr@proxy + 0)
2bcd : a6 13 __ LDX P6 ; (size + 0)
.l51:
2bcf : 8a __ __ TXA
2bd0 : 05 14 __ ORA P7 ; (size + 1)
2bd2 : d0 01 __ BNE $2bd5 ; (vdc_cpytovdc.s2 + 0)
.s1001:
2bd4 : 60 __ __ RTS
.s2:
2bd5 : a0 00 __ LDY #$00
2bd7 : b1 11 __ LDA (P4),y ; (sp + 0)
2bd9 : e6 11 __ INC P4 ; (sp + 0)
2bdb : d0 02 __ BNE $2bdf ; (vdc_cpytovdc.l52 + 0)
.s1004:
2bdd : e6 12 __ INC P5 ; (sp + 1)
.l52:
2bdf : 2c 00 d6 BIT $d600 
2be2 : 10 fb __ BPL $2bdf ; (vdc_cpytovdc.l52 + 0)
.s6:
2be4 : 8d 01 d6 STA $d601 
2be7 : ca __ __ DEX
2be8 : e0 ff __ CPX #$ff
2bea : d0 e3 __ BNE $2bcf ; (vdc_cpytovdc.l51 + 0)
.s1006:
2bec : c6 14 __ DEC P7 ; (size + 1)
2bee : 4c cf 2b JMP $2bcf ; (vdc_cpytovdc.l51 + 0)
--------------------------------------------------------------------
mul16: ; mul16
2bf1 : a0 00 __ LDY #$00
2bf3 : 84 06 __ STY WORK + 3 
2bf5 : a5 03 __ LDA WORK + 0 
2bf7 : a6 04 __ LDX WORK + 1 
2bf9 : f0 1c __ BEQ $2c17 ; (mul16 + 38)
2bfb : 38 __ __ SEC
2bfc : 6a __ __ ROR
2bfd : 90 0d __ BCC $2c0c ; (mul16 + 27)
2bff : aa __ __ TAX
2c00 : 18 __ __ CLC
2c01 : 98 __ __ TYA
2c02 : 65 1b __ ADC ACCU + 0 
2c04 : a8 __ __ TAY
2c05 : a5 06 __ LDA WORK + 3 
2c07 : 65 1c __ ADC ACCU + 1 
2c09 : 85 06 __ STA WORK + 3 
2c0b : 8a __ __ TXA
2c0c : 06 1b __ ASL ACCU + 0 
2c0e : 26 1c __ ROL ACCU + 1 
2c10 : 4a __ __ LSR
2c11 : 90 f9 __ BCC $2c0c ; (mul16 + 27)
2c13 : d0 ea __ BNE $2bff ; (mul16 + 14)
2c15 : a5 04 __ LDA WORK + 1 
2c17 : 4a __ __ LSR
2c18 : 90 0d __ BCC $2c27 ; (mul16 + 54)
2c1a : aa __ __ TAX
2c1b : 18 __ __ CLC
2c1c : 98 __ __ TYA
2c1d : 65 1b __ ADC ACCU + 0 
2c1f : a8 __ __ TAY
2c20 : a5 06 __ LDA WORK + 3 
2c22 : 65 1c __ ADC ACCU + 1 
2c24 : 85 06 __ STA WORK + 3 
2c26 : 8a __ __ TXA
2c27 : 06 1b __ ASL ACCU + 0 
2c29 : 26 1c __ ROL ACCU + 1 
2c2b : 4a __ __ LSR
2c2c : b0 ec __ BCS $2c1a ; (mul16 + 41)
2c2e : d0 f7 __ BNE $2c27 ; (mul16 + 54)
2c30 : 84 05 __ STY WORK + 2 
2c32 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
2c33 : a5 1c __ LDA ACCU + 1 
2c35 : d0 31 __ BNE $2c68 ; (divmod + 53)
2c37 : a5 04 __ LDA WORK + 1 
2c39 : d0 1e __ BNE $2c59 ; (divmod + 38)
2c3b : 85 06 __ STA WORK + 3 
2c3d : a2 04 __ LDX #$04
2c3f : 06 1b __ ASL ACCU + 0 
2c41 : 2a __ __ ROL
2c42 : c5 03 __ CMP WORK + 0 
2c44 : 90 02 __ BCC $2c48 ; (divmod + 21)
2c46 : e5 03 __ SBC WORK + 0 
2c48 : 26 1b __ ROL ACCU + 0 
2c4a : 2a __ __ ROL
2c4b : c5 03 __ CMP WORK + 0 
2c4d : 90 02 __ BCC $2c51 ; (divmod + 30)
2c4f : e5 03 __ SBC WORK + 0 
2c51 : 26 1b __ ROL ACCU + 0 
2c53 : ca __ __ DEX
2c54 : d0 eb __ BNE $2c41 ; (divmod + 14)
2c56 : 85 05 __ STA WORK + 2 
2c58 : 60 __ __ RTS
2c59 : a5 1b __ LDA ACCU + 0 
2c5b : 85 05 __ STA WORK + 2 
2c5d : a5 1c __ LDA ACCU + 1 
2c5f : 85 06 __ STA WORK + 3 
2c61 : a9 00 __ LDA #$00
2c63 : 85 1b __ STA ACCU + 0 
2c65 : 85 1c __ STA ACCU + 1 
2c67 : 60 __ __ RTS
2c68 : a5 04 __ LDA WORK + 1 
2c6a : d0 1f __ BNE $2c8b ; (divmod + 88)
2c6c : a5 03 __ LDA WORK + 0 
2c6e : 30 1b __ BMI $2c8b ; (divmod + 88)
2c70 : a9 00 __ LDA #$00
2c72 : 85 06 __ STA WORK + 3 
2c74 : a2 10 __ LDX #$10
2c76 : 06 1b __ ASL ACCU + 0 
2c78 : 26 1c __ ROL ACCU + 1 
2c7a : 2a __ __ ROL
2c7b : c5 03 __ CMP WORK + 0 
2c7d : 90 02 __ BCC $2c81 ; (divmod + 78)
2c7f : e5 03 __ SBC WORK + 0 
2c81 : 26 1b __ ROL ACCU + 0 
2c83 : 26 1c __ ROL ACCU + 1 
2c85 : ca __ __ DEX
2c86 : d0 f2 __ BNE $2c7a ; (divmod + 71)
2c88 : 85 05 __ STA WORK + 2 
2c8a : 60 __ __ RTS
2c8b : a9 00 __ LDA #$00
2c8d : 85 05 __ STA WORK + 2 
2c8f : 85 06 __ STA WORK + 3 
2c91 : 84 02 __ STY $02 
2c93 : a0 10 __ LDY #$10
2c95 : 18 __ __ CLC
2c96 : 26 1b __ ROL ACCU + 0 
2c98 : 26 1c __ ROL ACCU + 1 
2c9a : 26 05 __ ROL WORK + 2 
2c9c : 26 06 __ ROL WORK + 3 
2c9e : 38 __ __ SEC
2c9f : a5 05 __ LDA WORK + 2 
2ca1 : e5 03 __ SBC WORK + 0 
2ca3 : aa __ __ TAX
2ca4 : a5 06 __ LDA WORK + 3 
2ca6 : e5 04 __ SBC WORK + 1 
2ca8 : 90 04 __ BCC $2cae ; (divmod + 123)
2caa : 86 05 __ STX WORK + 2 
2cac : 85 06 __ STA WORK + 3 
2cae : 88 __ __ DEY
2caf : d0 e5 __ BNE $2c96 ; (divmod + 99)
2cb1 : 26 1b __ ROL ACCU + 0 
2cb3 : 26 1c __ ROL ACCU + 1 
2cb5 : a4 02 __ LDY $02 
2cb7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2cb8 : 84 02 __ STY $02 
2cba : a0 20 __ LDY #$20
2cbc : a9 00 __ LDA #$00
2cbe : 85 07 __ STA WORK + 4 
2cc0 : 85 08 __ STA WORK + 5 
2cc2 : 85 09 __ STA WORK + 6 
2cc4 : 85 0a __ STA WORK + 7 
2cc6 : a5 05 __ LDA WORK + 2 
2cc8 : 05 06 __ ORA WORK + 3 
2cca : d0 78 __ BNE $2d44 ; (divmod32 + 140)
2ccc : a5 04 __ LDA WORK + 1 
2cce : d0 27 __ BNE $2cf7 ; (divmod32 + 63)
2cd0 : 18 __ __ CLC
2cd1 : 26 1b __ ROL ACCU + 0 
2cd3 : 26 1c __ ROL ACCU + 1 
2cd5 : 26 1d __ ROL ACCU + 2 
2cd7 : 26 1e __ ROL ACCU + 3 
2cd9 : 2a __ __ ROL
2cda : 90 05 __ BCC $2ce1 ; (divmod32 + 41)
2cdc : e5 03 __ SBC WORK + 0 
2cde : 38 __ __ SEC
2cdf : b0 06 __ BCS $2ce7 ; (divmod32 + 47)
2ce1 : c5 03 __ CMP WORK + 0 
2ce3 : 90 02 __ BCC $2ce7 ; (divmod32 + 47)
2ce5 : e5 03 __ SBC WORK + 0 
2ce7 : 88 __ __ DEY
2ce8 : d0 e7 __ BNE $2cd1 ; (divmod32 + 25)
2cea : 85 07 __ STA WORK + 4 
2cec : 26 1b __ ROL ACCU + 0 
2cee : 26 1c __ ROL ACCU + 1 
2cf0 : 26 1d __ ROL ACCU + 2 
2cf2 : 26 1e __ ROL ACCU + 3 
2cf4 : a4 02 __ LDY $02 
2cf6 : 60 __ __ RTS
2cf7 : a5 1e __ LDA ACCU + 3 
2cf9 : d0 10 __ BNE $2d0b ; (divmod32 + 83)
2cfb : a6 1d __ LDX ACCU + 2 
2cfd : 86 1e __ STX ACCU + 3 
2cff : a6 1c __ LDX ACCU + 1 
2d01 : 86 1d __ STX ACCU + 2 
2d03 : a6 1b __ LDX ACCU + 0 
2d05 : 86 1c __ STX ACCU + 1 
2d07 : 85 1b __ STA ACCU + 0 
2d09 : a0 18 __ LDY #$18
2d0b : 18 __ __ CLC
2d0c : 26 1b __ ROL ACCU + 0 
2d0e : 26 1c __ ROL ACCU + 1 
2d10 : 26 1d __ ROL ACCU + 2 
2d12 : 26 1e __ ROL ACCU + 3 
2d14 : 26 07 __ ROL WORK + 4 
2d16 : 26 08 __ ROL WORK + 5 
2d18 : 90 0c __ BCC $2d26 ; (divmod32 + 110)
2d1a : a5 07 __ LDA WORK + 4 
2d1c : e5 03 __ SBC WORK + 0 
2d1e : aa __ __ TAX
2d1f : a5 08 __ LDA WORK + 5 
2d21 : e5 04 __ SBC WORK + 1 
2d23 : 38 __ __ SEC
2d24 : b0 0c __ BCS $2d32 ; (divmod32 + 122)
2d26 : 38 __ __ SEC
2d27 : a5 07 __ LDA WORK + 4 
2d29 : e5 03 __ SBC WORK + 0 
2d2b : aa __ __ TAX
2d2c : a5 08 __ LDA WORK + 5 
2d2e : e5 04 __ SBC WORK + 1 
2d30 : 90 04 __ BCC $2d36 ; (divmod32 + 126)
2d32 : 86 07 __ STX WORK + 4 
2d34 : 85 08 __ STA WORK + 5 
2d36 : 88 __ __ DEY
2d37 : d0 d3 __ BNE $2d0c ; (divmod32 + 84)
2d39 : 26 1b __ ROL ACCU + 0 
2d3b : 26 1c __ ROL ACCU + 1 
2d3d : 26 1d __ ROL ACCU + 2 
2d3f : 26 1e __ ROL ACCU + 3 
2d41 : a4 02 __ LDY $02 
2d43 : 60 __ __ RTS
2d44 : a0 10 __ LDY #$10
2d46 : a5 1e __ LDA ACCU + 3 
2d48 : 85 08 __ STA WORK + 5 
2d4a : a5 1d __ LDA ACCU + 2 
2d4c : 85 07 __ STA WORK + 4 
2d4e : a9 00 __ LDA #$00
2d50 : 85 1d __ STA ACCU + 2 
2d52 : 85 1e __ STA ACCU + 3 
2d54 : 18 __ __ CLC
2d55 : 26 1b __ ROL ACCU + 0 
2d57 : 26 1c __ ROL ACCU + 1 
2d59 : 26 07 __ ROL WORK + 4 
2d5b : 26 08 __ ROL WORK + 5 
2d5d : 26 09 __ ROL WORK + 6 
2d5f : 26 0a __ ROL WORK + 7 
2d61 : a5 07 __ LDA WORK + 4 
2d63 : c5 03 __ CMP WORK + 0 
2d65 : a5 08 __ LDA WORK + 5 
2d67 : e5 04 __ SBC WORK + 1 
2d69 : a5 09 __ LDA WORK + 6 
2d6b : e5 05 __ SBC WORK + 2 
2d6d : a5 0a __ LDA WORK + 7 
2d6f : e5 06 __ SBC WORK + 3 
2d71 : 90 18 __ BCC $2d8b ; (divmod32 + 211)
2d73 : a5 07 __ LDA WORK + 4 
2d75 : e5 03 __ SBC WORK + 0 
2d77 : 85 07 __ STA WORK + 4 
2d79 : a5 08 __ LDA WORK + 5 
2d7b : e5 04 __ SBC WORK + 1 
2d7d : 85 08 __ STA WORK + 5 
2d7f : a5 09 __ LDA WORK + 6 
2d81 : e5 05 __ SBC WORK + 2 
2d83 : 85 09 __ STA WORK + 6 
2d85 : a5 0a __ LDA WORK + 7 
2d87 : e5 06 __ SBC WORK + 3 
2d89 : 85 0a __ STA WORK + 7 
2d8b : 88 __ __ DEY
2d8c : d0 c7 __ BNE $2d55 ; (divmod32 + 157)
2d8e : 26 1b __ ROL ACCU + 0 
2d90 : 26 1c __ ROL ACCU + 1 
2d92 : a4 02 __ LDY $02 
2d94 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
2d95 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2d9b : a5 44 __ LDA $44 
2d9d : 85 0e __ STA P1 
2d9f : 4c 1f 1f JMP $1f1f ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
spentry:
2da2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
2da3 : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 85 89 86 8a 87 8b : ................
2db3 : __ __ __ BYT 88 8c 0a 8c                                     : ....
--------------------------------------------------------------------
giocharmap:
2db7 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_state:
2db8 : __ __ __ BSS	25
--------------------------------------------------------------------
view:
2dd1 : __ __ __ BSS	14
--------------------------------------------------------------------
vdc_modes:
2e00 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
2e10 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
2e20 : __ __ __ BYT e7 24 7e ff 50 00 32 00 01 00 00 00 10 00 40 00 : .$~.P.2.......@.
2e30 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
2e40 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
2e50 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
2e60 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
2e70 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
2e80 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
2e90 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
2ea0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
2eb0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
2ec0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
2ed0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
multab:
2f00 : __ __ __ BSS	144
