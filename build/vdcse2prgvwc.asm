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
1c13 : 8e ae 36 STX $36ae ; (spentry + 0)
1c16 : a9 d8 __ LDA #$d8
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 37 __ LDA #$37
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 38 __ LDA #$38
1c21 : e9 37 __ SBC #$37
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
1c50 : a9 ab __ LDA #$ab
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 3f __ LDA #$3f
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
1c80 : a5 53 __ LDA T0 + 0 
1c82 : 8d ad 3f STA $3fad ; (main@stack + 0)
1c85 : a5 54 __ LDA T3 + 0 
1c87 : 8d ae 3f STA $3fae ; (main@stack + 1)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 06 __ SBC #$06
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : ad e9 36 LDA $36e9 ; (view + 12)
1c98 : 85 53 __ STA T0 + 0 
1c9a : 85 16 __ STA P9 
1c9c : 20 7e 1d JSR $1d7e ; (vdc_init.s1000 + 0)
1c9f : a9 1a __ LDA #$1a
1ca1 : 8d 00 d6 STA $d600 
.l78:
1ca4 : 2c 00 d6 BIT $d600 
1ca7 : 10 fb __ BPL $1ca4 ; (main.l78 + 0)
.s8:
1ca9 : ad 01 d6 LDA $d601 
1cac : 29 f0 __ AND #$f0
1cae : 18 __ __ CLC
1caf : 6d ea 36 ADC $36ea ; (view + 13)
1cb2 : a2 1a __ LDX #$1a
1cb4 : 8e 00 d6 STX $d600 
.l80:
1cb7 : 2c 00 d6 BIT $d600 
1cba : 10 fb __ BPL $1cb7 ; (main.l80 + 0)
.s14:
1cbc : 8d 01 d6 STA $d601 
1cbf : ad df 36 LDA $36df ; (view + 2)
1cc2 : 85 54 __ STA T3 + 0 
1cc4 : 0d e0 36 ORA $36e0 ; (view + 3)
1cc7 : f0 34 __ BEQ $1cfd ; (main.s84 + 0)
.s15:
1cc9 : a5 54 __ LDA T3 + 0 
1ccb : 85 11 __ STA P4 
1ccd : ad e0 36 LDA $36e0 ; (view + 3)
1cd0 : 85 12 __ STA P5 
1cd2 : ad d4 36 LDA $36d4 ; (vdc_state + 16)
1cd5 : 85 0f __ STA P2 
1cd7 : ad d5 36 LDA $36d5 ; (vdc_state + 17)
1cda : 85 10 __ STA P3 
1cdc : 20 91 29 JSR $2991 ; (vdc_redef_charset.s0 + 0)
1cdf : a5 54 __ LDA T3 + 0 
1ce1 : 0d e0 36 ORA $36e0 ; (view + 3)
1ce4 : f0 17 __ BEQ $1cfd ; (main.s84 + 0)
.s18:
1ce6 : ad d6 36 LDA $36d6 ; (vdc_state + 18)
1ce9 : 85 0f __ STA P2 
1ceb : ad d7 36 LDA $36d7 ; (vdc_state + 19)
1cee : 85 10 __ STA P3 
1cf0 : ad e1 36 LDA $36e1 ; (view + 4)
1cf3 : 85 11 __ STA P4 
1cf5 : ad e2 36 LDA $36e2 ; (view + 5)
1cf8 : 85 12 __ STA P5 
1cfa : 20 91 29 JSR $2991 ; (vdc_redef_charset.s0 + 0)
.s84:
1cfd : ad c8 36 LDA $36c8 ; (vdc_state + 4)
1d00 : cd e4 36 CMP $36e4 ; (view + 7)
1d03 : d0 06 __ BNE $1d0b ; (main.s1005 + 0)
.s1004:
1d05 : ad c7 36 LDA $36c7 ; (vdc_state + 3)
1d08 : cd e3 36 CMP $36e3 ; (view + 6)
.s1005:
1d0b : 90 16 __ BCC $1d23 ; (main.s21 + 0)
.s24:
1d0d : ad ca 36 LDA $36ca ; (vdc_state + 6)
1d10 : cd e6 36 CMP $36e6 ; (view + 9)
1d13 : d0 06 __ BNE $1d1b ; (main.s1003 + 0)
.s1002:
1d15 : ad c9 36 LDA $36c9 ; (vdc_state + 5)
1d18 : cd e5 36 CMP $36e5 ; (view + 8)
.s1003:
1d1b : 90 06 __ BCC $1d23 ; (main.s21 + 0)
.s22:
1d1d : 20 45 32 JSR $3245 ; (show_noscroll.s0 + 0)
1d20 : 4c 2b 1d JMP $1d2b ; (main.s23 + 0)
.s21:
1d23 : ad c5 36 LDA $36c5 ; (vdc_state + 1)
1d26 : f0 03 __ BEQ $1d2b ; (main.s23 + 0)
.s25:
1d28 : 20 c1 29 JSR $29c1 ; (show_fs_scroll.s1000 + 0)
.s23:
1d2b : a5 53 __ LDA T0 + 0 
1d2d : d0 12 __ BNE $1d41 ; (main.s30 + 0)
.s31:
1d2f : a5 54 __ LDA T3 + 0 
1d31 : 0d e0 36 ORA $36e0 ; (view + 3)
1d34 : d0 08 __ BNE $1d3e ; (main.s28 + 0)
.s32:
1d36 : ad e1 36 LDA $36e1 ; (view + 4)
1d39 : 0d e2 36 ORA $36e2 ; (view + 5)
1d3c : f0 03 __ BEQ $1d41 ; (main.s30 + 0)
.s28:
1d3e : 20 66 28 JSR $2866 ; (vdc_restore_charsets.s0 + 0)
.s30:
1d41 : a9 00 __ LDA #$00
1d43 : 20 77 26 JSR $2677 ; (fastmode.s0 + 0)
1d46 : a9 00 __ LDA #$00
1d48 : 85 0f __ STA P2 
1d4a : 20 96 26 JSR $2696 ; (vdc_set_mode.s0 + 0)
1d4d : 20 c4 1e JSR $1ec4 ; (vdc_cls.s0 + 0)
1d50 : a9 a9 __ LDA #$a9
1d52 : a0 02 __ LDY #$02
1d54 : 91 23 __ STA (SP + 0),y 
1d56 : a9 34 __ LDA #$34
1d58 : c8 __ __ INY
1d59 : 91 23 __ STA (SP + 0),y 
1d5b : a9 cb __ LDA #$cb
1d5d : c8 __ __ INY
1d5e : 91 23 __ STA (SP + 0),y 
1d60 : a9 34 __ LDA #$34
1d62 : c8 __ __ INY
1d63 : 91 23 __ STA (SP + 0),y 
1d65 : 20 aa 1f JSR $1faa ; (printf.s1000 + 0)
.s1001:
1d68 : 18 __ __ CLC
1d69 : a5 23 __ LDA SP + 0 
1d6b : 69 06 __ ADC #$06
1d6d : 85 23 __ STA SP + 0 
1d6f : 90 02 __ BCC $1d73 ; (main.s1001 + 11)
1d71 : e6 24 __ INC SP + 1 
1d73 : ad ad 3f LDA $3fad ; (main@stack + 0)
1d76 : 85 53 __ STA T0 + 0 
1d78 : ad ae 3f LDA $3fae ; (main@stack + 1)
1d7b : 85 54 __ STA T3 + 0 
1d7d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
1d7e : 38 __ __ SEC
1d7f : a5 23 __ LDA SP + 0 
1d81 : e9 04 __ SBC #$04
1d83 : 85 23 __ STA SP + 0 
1d85 : b0 02 __ BCS $1d89 ; (vdc_init.s0 + 0)
1d87 : c6 24 __ DEC SP + 1 
.s0:
1d89 : a2 14 __ LDX #$14
.l1002:
1d8b : bd ae 36 LDA $36ae,x ; (spentry + 0)
1d8e : 9d ff 0f STA $0fff,x 
1d91 : ca __ __ DEX
1d92 : d0 f7 __ BNE $1d8b ; (vdc_init.l1002 + 0)
.s1003:
1d94 : a9 1a __ LDA #$1a
1d96 : 8d 00 d6 STA $d600 
.l463:
1d99 : 2c 00 d6 BIT $d600 
1d9c : 10 fb __ BPL $1d99 ; (vdc_init.l463 + 0)
.s7:
1d9e : ad 01 d6 LDA $d601 
1da1 : 29 f0 __ AND #$f0
1da3 : a8 __ __ TAY
1da4 : a9 1a __ LDA #$1a
1da6 : 8d 00 d6 STA $d600 
.l465:
1da9 : 2c 00 d6 BIT $d600 
1dac : 10 fb __ BPL $1da9 ; (vdc_init.l465 + 0)
.s13:
1dae : 8c 01 d6 STY $d601 
1db1 : 8d 00 d6 STA $d600 
.l467:
1db4 : 2c 00 d6 BIT $d600 
1db7 : 10 fb __ BPL $1db4 ; (vdc_init.l467 + 0)
.s20:
1db9 : ad 01 d6 LDA $d601 
1dbc : 29 0f __ AND #$0f
1dbe : 09 d0 __ ORA #$d0
1dc0 : a0 1a __ LDY #$1a
1dc2 : 8c 00 d6 STY $d600 
.l469:
1dc5 : 2c 00 d6 BIT $d600 
1dc8 : 10 fb __ BPL $1dc5 ; (vdc_init.l469 + 0)
.s26:
1dca : 8d 01 d6 STA $d601 
1dcd : a9 8d __ LDA #$8d
1dcf : 8d cb 36 STA $36cb ; (vdc_state + 7)
1dd2 : a9 1c __ LDA #$1c
1dd4 : 8d 00 d6 STA $d600 
.l471:
1dd7 : 2c 00 d6 BIT $d600 
1dda : 10 fb __ BPL $1dd7 ; (vdc_init.l471 + 0)
.s32:
1ddc : ad 01 d6 LDA $d601 
1ddf : a8 __ __ TAY
1de0 : 09 10 __ ORA #$10
1de2 : 85 44 __ STA T1 + 0 
1de4 : a9 1c __ LDA #$1c
1de6 : 8d 00 d6 STA $d600 
.l473:
1de9 : 2c 00 d6 BIT $d600 
1dec : 10 fb __ BPL $1de9 ; (vdc_init.l473 + 0)
.s39:
1dee : a5 44 __ LDA T1 + 0 
1df0 : 8d 01 d6 STA $d601 
1df3 : a9 12 __ LDA #$12
1df5 : 8d 00 d6 STA $d600 
.l475:
1df8 : 2c 00 d6 BIT $d600 
1dfb : 10 fb __ BPL $1df8 ; (vdc_init.l475 + 0)
.s46:
1dfd : a9 1f __ LDA #$1f
1dff : 8d 01 d6 STA $d601 
1e02 : a9 13 __ LDA #$13
1e04 : 8d 00 d6 STA $d600 
.l477:
1e07 : 2c 00 d6 BIT $d600 
1e0a : 10 fb __ BPL $1e07 ; (vdc_init.l477 + 0)
.s51:
1e0c : a9 ff __ LDA #$ff
1e0e : 8d 01 d6 STA $d601 
1e11 : a9 1f __ LDA #$1f
1e13 : 8d 00 d6 STA $d600 
.l479:
1e16 : 2c 00 d6 BIT $d600 
1e19 : 10 fb __ BPL $1e16 ; (vdc_init.l479 + 0)
.s55:
1e1b : 8e 01 d6 STX $d601 
1e1e : a9 12 __ LDA #$12
1e20 : 8d 00 d6 STA $d600 
.l481:
1e23 : 2c 00 d6 BIT $d600 
1e26 : 10 fb __ BPL $1e23 ; (vdc_init.l481 + 0)
.s62:
1e28 : a9 9f __ LDA #$9f
1e2a : 8d 01 d6 STA $d601 
1e2d : a9 13 __ LDA #$13
1e2f : 8d 00 d6 STA $d600 
.l483:
1e32 : 2c 00 d6 BIT $d600 
1e35 : 10 fb __ BPL $1e32 ; (vdc_init.l483 + 0)
.s67:
1e37 : a9 ff __ LDA #$ff
1e39 : 8d 01 d6 STA $d601 
1e3c : a9 1f __ LDA #$1f
1e3e : 8d 00 d6 STA $d600 
.l485:
1e41 : 2c 00 d6 BIT $d600 
1e44 : 10 fb __ BPL $1e41 ; (vdc_init.l485 + 0)
.s71:
1e46 : a9 ff __ LDA #$ff
1e48 : 8d 01 d6 STA $d601 
1e4b : a9 12 __ LDA #$12
1e4d : 8d 00 d6 STA $d600 
.l487:
1e50 : 2c 00 d6 BIT $d600 
1e53 : 10 fb __ BPL $1e50 ; (vdc_init.l487 + 0)
.s78:
1e55 : a9 1f __ LDA #$1f
1e57 : 8d 01 d6 STA $d601 
1e5a : a9 13 __ LDA #$13
1e5c : 8d 00 d6 STA $d600 
.l489:
1e5f : 2c 00 d6 BIT $d600 
1e62 : 10 fb __ BPL $1e5f ; (vdc_init.l489 + 0)
.s83:
1e64 : a9 ff __ LDA #$ff
1e66 : 8d 01 d6 STA $d601 
1e69 : a9 1f __ LDA #$1f
1e6b : 8d 00 d6 STA $d600 
.l491:
1e6e : 2c 00 d6 BIT $d600 
1e71 : 10 fb __ BPL $1e6e ; (vdc_init.l491 + 0)
.s87:
1e73 : ad 01 d6 LDA $d601 
1e76 : f0 04 __ BEQ $1e7c ; (vdc_init.s1038 + 0)
.s1039:
1e78 : a9 10 __ LDA #$10
1e7a : d0 02 __ BNE $1e7e ; (vdc_init.s1040 + 0)
.s1038:
1e7c : a9 40 __ LDA #$40
.s1040:
1e7e : 8d c4 36 STA $36c4 ; (vdc_state + 0)
1e81 : a9 1c __ LDA #$1c
1e83 : 8d 00 d6 STA $d600 
.l494:
1e86 : 2c 00 d6 BIT $d600 
1e89 : 10 fb __ BPL $1e86 ; (vdc_init.l494 + 0)
.s94:
1e8b : 8c 01 d6 STY $d601 
1e8e : 20 c4 1e JSR $1ec4 ; (vdc_cls.s0 + 0)
1e91 : 24 d7 __ BIT $d7 
1e93 : 30 17 __ BMI $1eac ; (vdc_init.s97 + 0)
.s100:
1e95 : a9 06 __ LDA #$06
1e97 : a0 02 __ LDY #$02
1e99 : 91 23 __ STA (SP + 0),y 
1e9b : a9 26 __ LDA #$26
1e9d : c8 __ __ INY
1e9e : 91 23 __ STA (SP + 0),y 
1ea0 : 20 aa 1f JSR $1faa ; (printf.s1000 + 0)
1ea3 : 20 31 26 JSR $2631 ; (getch.s0 + 0)
1ea6 : 20 81 ff JSR $ff81 
1ea9 : 20 6f 26 JSR $266f ; (screen_setmode.s0 + 0)
.s97:
1eac : a9 01 __ LDA #$01
1eae : 20 77 26 JSR $2677 ; (fastmode.s0 + 0)
1eb1 : a5 16 __ LDA P9 ; (mode + 0)
1eb3 : 85 0f __ STA P2 
1eb5 : 20 96 26 JSR $2696 ; (vdc_set_mode.s0 + 0)
.s1001:
1eb8 : 18 __ __ CLC
1eb9 : a5 23 __ LDA SP + 0 
1ebb : 69 04 __ ADC #$04
1ebd : 85 23 __ STA SP + 0 
1ebf : 90 02 __ BCC $1ec3 ; (vdc_init.s1001 + 11)
1ec1 : e6 24 __ INC SP + 1 
1ec3 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
1ec4 : a9 00 __ LDA #$00
1ec6 : 85 43 __ STA T0 + 0 
1ec8 : ad c7 36 LDA $36c7 ; (vdc_state + 3)
1ecb : 85 44 __ STA T1 + 0 
1ecd : ad c9 36 LDA $36c9 ; (vdc_state + 5)
1ed0 : 85 45 __ STA T2 + 0 
.l2:
1ed2 : a5 43 __ LDA T0 + 0 
1ed4 : c5 45 __ CMP T2 + 0 
1ed6 : 90 01 __ BCC $1ed9 ; (vdc_cls.s3 + 0)
.s1001:
1ed8 : 60 __ __ RTS
.s3:
1ed9 : 0a __ __ ASL
1eda : aa __ __ TAX
1edb : bd 00 38 LDA $3800,x ; (multab + 0)
1ede : 85 47 __ STA T4 + 0 
1ee0 : 18 __ __ CLC
1ee1 : 6d cc 36 ADC $36cc ; (vdc_state + 8)
1ee4 : 85 0d __ STA P0 
1ee6 : bd 01 38 LDA $3801,x ; (multab + 1)
1ee9 : 85 48 __ STA T4 + 1 
1eeb : 6d cd 36 ADC $36cd ; (vdc_state + 9)
1eee : 85 0e __ STA P1 
1ef0 : ad cb 36 LDA $36cb ; (vdc_state + 7)
1ef3 : 85 46 __ STA T3 + 0 
1ef5 : 20 86 1f JSR $1f86 ; (vdc_mem_addr.s0 + 0)
1ef8 : a6 44 __ LDX T1 + 0 
1efa : ca __ __ DEX
1efb : 86 49 __ STX T5 + 0 
.l239:
1efd : 2c 00 d6 BIT $d600 
1f00 : 10 fb __ BPL $1efd ; (vdc_cls.l239 + 0)
.s12:
1f02 : a9 20 __ LDA #$20
1f04 : 8d 01 d6 STA $d601 
1f07 : a9 18 __ LDA #$18
1f09 : 8d 00 d6 STA $d600 
.l241:
1f0c : 2c 00 d6 BIT $d600 
1f0f : 10 fb __ BPL $1f0c ; (vdc_cls.l241 + 0)
.s18:
1f11 : ad 01 d6 LDA $d601 
1f14 : 29 7f __ AND #$7f
1f16 : a2 18 __ LDX #$18
1f18 : 8e 00 d6 STX $d600 
.l243:
1f1b : 2c 00 d6 BIT $d600 
1f1e : 10 fb __ BPL $1f1b ; (vdc_cls.l243 + 0)
.s24:
1f20 : 8d 01 d6 STA $d601 
1f23 : a9 1e __ LDA #$1e
1f25 : 8d 00 d6 STA $d600 
.l245:
1f28 : 2c 00 d6 BIT $d600 
1f2b : 10 fb __ BPL $1f28 ; (vdc_cls.l245 + 0)
.s29:
1f2d : a5 49 __ LDA T5 + 0 
1f2f : 8d 01 d6 STA $d601 
1f32 : ad ce 36 LDA $36ce ; (vdc_state + 10)
1f35 : 18 __ __ CLC
1f36 : 65 47 __ ADC T4 + 0 
1f38 : 85 0d __ STA P0 
1f3a : ad cf 36 LDA $36cf ; (vdc_state + 11)
1f3d : 65 48 __ ADC T4 + 1 
1f3f : 85 0e __ STA P1 
1f41 : 20 86 1f JSR $1f86 ; (vdc_mem_addr.s0 + 0)
.l247:
1f44 : 2c 00 d6 BIT $d600 
1f47 : 10 fb __ BPL $1f44 ; (vdc_cls.l247 + 0)
.s33:
1f49 : a5 46 __ LDA T3 + 0 
1f4b : 8d 01 d6 STA $d601 
1f4e : a9 18 __ LDA #$18
1f50 : 8d 00 d6 STA $d600 
.l249:
1f53 : 2c 00 d6 BIT $d600 
1f56 : 10 fb __ BPL $1f53 ; (vdc_cls.l249 + 0)
.s39:
1f58 : ad 01 d6 LDA $d601 
1f5b : 29 7f __ AND #$7f
1f5d : a2 18 __ LDX #$18
1f5f : 8e 00 d6 STX $d600 
.l251:
1f62 : 2c 00 d6 BIT $d600 
1f65 : 10 fb __ BPL $1f62 ; (vdc_cls.l251 + 0)
.s45:
1f67 : 8d 01 d6 STA $d601 
1f6a : a9 1e __ LDA #$1e
1f6c : 8d 00 d6 STA $d600 
.l253:
1f6f : 2c 00 d6 BIT $d600 
1f72 : 10 fb __ BPL $1f6f ; (vdc_cls.l253 + 0)
.s50:
1f74 : a5 49 __ LDA T5 + 0 
1f76 : 8d 01 d6 STA $d601 
1f79 : e6 43 __ INC T0 + 0 
1f7b : 4c d2 1e JMP $1ed2 ; (vdc_cls.l2 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
1f7e : a5 0f __ LDA P2 
1f80 : 85 0d __ STA P0 
1f82 : a5 10 __ LDA P3 
1f84 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
1f86 : a9 12 __ LDA #$12
1f88 : 8d 00 d6 STA $d600 
.l56:
1f8b : 2c 00 d6 BIT $d600 
1f8e : 10 fb __ BPL $1f8b ; (vdc_mem_addr.l56 + 0)
.s5:
1f90 : a5 0e __ LDA P1 ; (addr + 1)
1f92 : 8d 01 d6 STA $d601 
1f95 : a9 13 __ LDA #$13
1f97 : 8d 00 d6 STA $d600 
.l58:
1f9a : 2c 00 d6 BIT $d600 
1f9d : 10 fb __ BPL $1f9a ; (vdc_mem_addr.l58 + 0)
.s10:
1f9f : a5 0d __ LDA P0 ; (addr + 0)
1fa1 : 8d 01 d6 STA $d601 
1fa4 : a9 1f __ LDA #$1f
1fa6 : 8d 00 d6 STA $d600 
.s1001:
1fa9 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
1faa : a2 03 __ LDX #$03
1fac : b5 53 __ LDA T8 + 0,x 
1fae : 9d b0 3f STA $3fb0,x ; (printf@stack + 0)
1fb1 : ca __ __ DEX
1fb2 : 10 f8 __ BPL $1fac ; (printf.s1000 + 2)
.s0:
1fb4 : 18 __ __ CLC
1fb5 : a5 23 __ LDA SP + 0 
1fb7 : 69 04 __ ADC #$04
1fb9 : 85 47 __ STA T0 + 0 
1fbb : a5 24 __ LDA SP + 1 
1fbd : 69 00 __ ADC #$00
1fbf : 85 48 __ STA T0 + 1 
1fc1 : a9 00 __ LDA #$00
1fc3 : 85 49 __ STA T2 + 0 
1fc5 : a0 02 __ LDY #$02
1fc7 : b1 23 __ LDA (SP + 0),y 
1fc9 : 85 4a __ STA T3 + 0 
1fcb : c8 __ __ INY
1fcc : b1 23 __ LDA (SP + 0),y 
1fce : 85 4b __ STA T3 + 1 
.l2:
1fd0 : a0 00 __ LDY #$00
1fd2 : b1 4a __ LDA (T3 + 0),y 
1fd4 : d0 1e __ BNE $1ff4 ; (printf.s3 + 0)
.s4:
1fd6 : a6 49 __ LDX T2 + 0 
1fd8 : 9d bc 3f STA $3fbc,x ; (buff + 0)
1fdb : 8a __ __ TXA
1fdc : f0 0b __ BEQ $1fe9 ; (printf.s1001 + 0)
.s117:
1fde : a9 bc __ LDA #$bc
1fe0 : 85 0d __ STA P0 ; (fmt + 0)
1fe2 : a9 3f __ LDA #$3f
1fe4 : 85 0e __ STA P1 ; (fmt + 1)
1fe6 : 20 09 23 JSR $2309 ; (puts.s0 + 0)
.s1001:
1fe9 : a2 03 __ LDX #$03
1feb : bd b0 3f LDA $3fb0,x ; (printf@stack + 0)
1fee : 95 53 __ STA T8 + 0,x 
1ff0 : ca __ __ DEX
1ff1 : 10 f8 __ BPL $1feb ; (printf.s1001 + 2)
1ff3 : 60 __ __ RTS
.s3:
1ff4 : c9 25 __ CMP #$25
1ff6 : f0 28 __ BEQ $2020 ; (printf.s5 + 0)
.s6:
1ff8 : a6 49 __ LDX T2 + 0 
1ffa : 9d bc 3f STA $3fbc,x ; (buff + 0)
1ffd : e6 4a __ INC T3 + 0 
1fff : d0 02 __ BNE $2003 ; (printf.s1098 + 0)
.s1097:
2001 : e6 4b __ INC T3 + 1 
.s1098:
2003 : e8 __ __ INX
2004 : 86 49 __ STX T2 + 0 
2006 : e0 28 __ CPX #$28
2008 : 90 c6 __ BCC $1fd0 ; (printf.l2 + 0)
.s111:
200a : a9 bc __ LDA #$bc
200c : 85 0d __ STA P0 ; (fmt + 0)
200e : a9 3f __ LDA #$3f
2010 : 85 0e __ STA P1 ; (fmt + 1)
2012 : 98 __ __ TYA
2013 : 9d bc 3f STA $3fbc,x ; (buff + 0)
2016 : 20 09 23 JSR $2309 ; (puts.s0 + 0)
2019 : a9 00 __ LDA #$00
.s1068:
201b : 85 49 __ STA T2 + 0 
201d : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s5:
2020 : a5 49 __ LDA T2 + 0 
2022 : f0 15 __ BEQ $2039 ; (printf.s10 + 0)
.s8:
2024 : a9 bc __ LDA #$bc
2026 : 85 0d __ STA P0 ; (fmt + 0)
2028 : a9 3f __ LDA #$3f
202a : 85 0e __ STA P1 ; (fmt + 1)
202c : 98 __ __ TYA
202d : a6 49 __ LDX T2 + 0 
202f : 9d bc 3f STA $3fbc,x ; (buff + 0)
2032 : 20 09 23 JSR $2309 ; (puts.s0 + 0)
2035 : a9 00 __ LDA #$00
2037 : 85 49 __ STA T2 + 0 
.s10:
2039 : a9 0a __ LDA #$0a
203b : 8d b7 3f STA $3fb7 ; (si + 3)
203e : a9 00 __ LDA #$00
2040 : 8d b8 3f STA $3fb8 ; (si + 4)
2043 : 8d b9 3f STA $3fb9 ; (si + 5)
2046 : 8d ba 3f STA $3fba ; (si + 6)
2049 : 8d bb 3f STA $3fbb ; (si + 7)
204c : a0 01 __ LDY #$01
204e : b1 4a __ LDA (T3 + 0),y 
2050 : a2 20 __ LDX #$20
2052 : 8e b4 3f STX $3fb4 ; (si + 0)
2055 : a2 00 __ LDX #$00
2057 : 8e b5 3f STX $3fb5 ; (si + 1)
205a : ca __ __ DEX
205b : 8e b6 3f STX $3fb6 ; (si + 2)
205e : aa __ __ TAX
205f : 18 __ __ CLC
2060 : a5 4a __ LDA T3 + 0 
2062 : 69 02 __ ADC #$02
.l15:
2064 : 85 4a __ STA T3 + 0 
2066 : 90 02 __ BCC $206a ; (printf.s1080 + 0)
.s1079:
2068 : e6 4b __ INC T3 + 1 
.s1080:
206a : 8a __ __ TXA
206b : e0 2b __ CPX #$2b
206d : d0 08 __ BNE $2077 ; (printf.s18 + 0)
.s17:
206f : a9 01 __ LDA #$01
2071 : 8d b9 3f STA $3fb9 ; (si + 5)
2074 : 4c fc 22 JMP $22fc ; (printf.s246 + 0)
.s18:
2077 : c9 30 __ CMP #$30
2079 : d0 06 __ BNE $2081 ; (printf.s21 + 0)
.s20:
207b : 8d b4 3f STA $3fb4 ; (si + 0)
207e : 4c fc 22 JMP $22fc ; (printf.s246 + 0)
.s21:
2081 : c9 23 __ CMP #$23
2083 : d0 08 __ BNE $208d ; (printf.s24 + 0)
.s23:
2085 : a9 01 __ LDA #$01
2087 : 8d bb 3f STA $3fbb ; (si + 7)
208a : 4c fc 22 JMP $22fc ; (printf.s246 + 0)
.s24:
208d : c9 2d __ CMP #$2d
208f : d0 08 __ BNE $2099 ; (printf.s16 + 0)
.s26:
2091 : a9 01 __ LDA #$01
2093 : 8d ba 3f STA $3fba ; (si + 6)
2096 : 4c fc 22 JMP $22fc ; (printf.s246 + 0)
.s16:
2099 : c9 30 __ CMP #$30
209b : 90 57 __ BCC $20f4 ; (printf.s32 + 0)
.s33:
209d : c9 3a __ CMP #$3a
209f : b0 53 __ BCS $20f4 ; (printf.s32 + 0)
.s30:
20a1 : 85 4c __ STA T4 + 0 
20a3 : a9 00 __ LDA #$00
20a5 : 85 4d __ STA T6 + 0 
20a7 : 85 4e __ STA T6 + 1 
20a9 : e0 3a __ CPX #$3a
20ab : b0 40 __ BCS $20ed ; (printf.s36 + 0)
.l35:
20ad : a5 4d __ LDA T6 + 0 
20af : 0a __ __ ASL
20b0 : 85 1b __ STA ACCU + 0 
20b2 : a5 4e __ LDA T6 + 1 
20b4 : 2a __ __ ROL
20b5 : 06 1b __ ASL ACCU + 0 
20b7 : 2a __ __ ROL
20b8 : aa __ __ TAX
20b9 : 18 __ __ CLC
20ba : a5 1b __ LDA ACCU + 0 
20bc : 65 4d __ ADC T6 + 0 
20be : 85 4d __ STA T6 + 0 
20c0 : 8a __ __ TXA
20c1 : 65 4e __ ADC T6 + 1 
20c3 : 06 4d __ ASL T6 + 0 
20c5 : 2a __ __ ROL
20c6 : aa __ __ TAX
20c7 : 18 __ __ CLC
20c8 : a5 4d __ LDA T6 + 0 
20ca : 65 4c __ ADC T4 + 0 
20cc : 90 01 __ BCC $20cf ; (printf.s1094 + 0)
.s1093:
20ce : e8 __ __ INX
.s1094:
20cf : 38 __ __ SEC
20d0 : e9 30 __ SBC #$30
20d2 : 85 4d __ STA T6 + 0 
20d4 : 8a __ __ TXA
20d5 : e9 00 __ SBC #$00
20d7 : 85 4e __ STA T6 + 1 
20d9 : a0 00 __ LDY #$00
20db : b1 4a __ LDA (T3 + 0),y 
20dd : 85 4c __ STA T4 + 0 
20df : e6 4a __ INC T3 + 0 
20e1 : d0 02 __ BNE $20e5 ; (printf.s1096 + 0)
.s1095:
20e3 : e6 4b __ INC T3 + 1 
.s1096:
20e5 : c9 30 __ CMP #$30
20e7 : 90 04 __ BCC $20ed ; (printf.s36 + 0)
.s37:
20e9 : c9 3a __ CMP #$3a
20eb : 90 c0 __ BCC $20ad ; (printf.l35 + 0)
.s36:
20ed : a5 4d __ LDA T6 + 0 
20ef : 8d b5 3f STA $3fb5 ; (si + 1)
20f2 : a5 4c __ LDA T4 + 0 
.s32:
20f4 : c9 2e __ CMP #$2e
20f6 : d0 51 __ BNE $2149 ; (printf.s40 + 0)
.s38:
20f8 : a9 00 __ LDA #$00
20fa : 85 4d __ STA T6 + 0 
.l231:
20fc : 85 4e __ STA T6 + 1 
20fe : a0 00 __ LDY #$00
2100 : b1 4a __ LDA (T3 + 0),y 
2102 : 85 4c __ STA T4 + 0 
2104 : e6 4a __ INC T3 + 0 
2106 : d0 02 __ BNE $210a ; (printf.s1082 + 0)
.s1081:
2108 : e6 4b __ INC T3 + 1 
.s1082:
210a : c9 30 __ CMP #$30
210c : 90 04 __ BCC $2112 ; (printf.s43 + 0)
.s44:
210e : c9 3a __ CMP #$3a
2110 : 90 0a __ BCC $211c ; (printf.s42 + 0)
.s43:
2112 : a5 4d __ LDA T6 + 0 
2114 : 8d b6 3f STA $3fb6 ; (si + 2)
2117 : a5 4c __ LDA T4 + 0 
2119 : 4c 49 21 JMP $2149 ; (printf.s40 + 0)
.s42:
211c : a5 4d __ LDA T6 + 0 
211e : 0a __ __ ASL
211f : 85 1b __ STA ACCU + 0 
2121 : a5 4e __ LDA T6 + 1 
2123 : 2a __ __ ROL
2124 : 06 1b __ ASL ACCU + 0 
2126 : 2a __ __ ROL
2127 : aa __ __ TAX
2128 : 18 __ __ CLC
2129 : a5 1b __ LDA ACCU + 0 
212b : 65 4d __ ADC T6 + 0 
212d : 85 4d __ STA T6 + 0 
212f : 8a __ __ TXA
2130 : 65 4e __ ADC T6 + 1 
2132 : 06 4d __ ASL T6 + 0 
2134 : 2a __ __ ROL
2135 : aa __ __ TAX
2136 : 18 __ __ CLC
2137 : a5 4d __ LDA T6 + 0 
2139 : 65 4c __ ADC T4 + 0 
213b : 90 01 __ BCC $213e ; (printf.s1092 + 0)
.s1091:
213d : e8 __ __ INX
.s1092:
213e : 38 __ __ SEC
213f : e9 30 __ SBC #$30
2141 : 85 4d __ STA T6 + 0 
2143 : 8a __ __ TXA
2144 : e9 00 __ SBC #$00
2146 : 4c fc 20 JMP $20fc ; (printf.l231 + 0)
.s40:
2149 : c9 64 __ CMP #$64
214b : f0 04 __ BEQ $2151 ; (printf.s45 + 0)
.s48:
214d : c9 44 __ CMP #$44
214f : d0 05 __ BNE $2156 ; (printf.s46 + 0)
.s45:
2151 : a9 01 __ LDA #$01
2153 : 4c d5 22 JMP $22d5 ; (printf.s247 + 0)
.s46:
2156 : c9 75 __ CMP #$75
2158 : d0 03 __ BNE $215d ; (printf.s52 + 0)
215a : 4c d3 22 JMP $22d3 ; (printf.s269 + 0)
.s52:
215d : c9 55 __ CMP #$55
215f : d0 03 __ BNE $2164 ; (printf.s50 + 0)
2161 : 4c d3 22 JMP $22d3 ; (printf.s269 + 0)
.s50:
2164 : c9 78 __ CMP #$78
2166 : f0 04 __ BEQ $216c ; (printf.s53 + 0)
.s56:
2168 : c9 58 __ CMP #$58
216a : d0 0d __ BNE $2179 ; (printf.s54 + 0)
.s53:
216c : a9 10 __ LDA #$10
216e : 8d b7 3f STA $3fb7 ; (si + 3)
2171 : a9 00 __ LDA #$00
2173 : 8d b8 3f STA $3fb8 ; (si + 4)
2176 : 4c d3 22 JMP $22d3 ; (printf.s269 + 0)
.s54:
2179 : c9 6c __ CMP #$6c
217b : d0 03 __ BNE $2180 ; (printf.s60 + 0)
217d : 4c 55 22 JMP $2255 ; (printf.s57 + 0)
.s60:
2180 : c9 4c __ CMP #$4c
2182 : d0 03 __ BNE $2187 ; (printf.s58 + 0)
2184 : 4c 55 22 JMP $2255 ; (printf.s57 + 0)
.s58:
2187 : c9 73 __ CMP #$73
2189 : f0 39 __ BEQ $21c4 ; (printf.s73 + 0)
.s76:
218b : c9 53 __ CMP #$53
218d : f0 35 __ BEQ $21c4 ; (printf.s73 + 0)
.s74:
218f : c9 63 __ CMP #$63
2191 : f0 15 __ BEQ $21a8 ; (printf.s104 + 0)
.s107:
2193 : c9 43 __ CMP #$43
2195 : f0 11 __ BEQ $21a8 ; (printf.s104 + 0)
.s105:
2197 : 09 00 __ ORA #$00
2199 : d0 03 __ BNE $219e ; (printf.s108 + 0)
219b : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s108:
219e : a6 49 __ LDX T2 + 0 
21a0 : 9d bc 3f STA $3fbc,x ; (buff + 0)
21a3 : e6 49 __ INC T2 + 0 
21a5 : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s104:
21a8 : a0 00 __ LDY #$00
21aa : b1 47 __ LDA (T0 + 0),y 
21ac : a6 49 __ LDX T2 + 0 
21ae : 9d bc 3f STA $3fbc,x ; (buff + 0)
21b1 : e6 49 __ INC T2 + 0 
.s244:
21b3 : 18 __ __ CLC
21b4 : a5 47 __ LDA T0 + 0 
21b6 : 69 02 __ ADC #$02
21b8 : 85 47 __ STA T0 + 0 
21ba : b0 03 __ BCS $21bf ; (printf.s1083 + 0)
21bc : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s1083:
21bf : e6 48 __ INC T0 + 1 
21c1 : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s73:
21c4 : a0 00 __ LDY #$00
21c6 : 84 4c __ STY T4 + 0 
21c8 : b1 47 __ LDA (T0 + 0),y 
21ca : 85 4d __ STA T6 + 0 
21cc : c8 __ __ INY
21cd : b1 47 __ LDA (T0 + 0),y 
21cf : 85 4e __ STA T6 + 1 
21d1 : 18 __ __ CLC
21d2 : a5 47 __ LDA T0 + 0 
21d4 : 69 02 __ ADC #$02
21d6 : 85 47 __ STA T0 + 0 
21d8 : 90 02 __ BCC $21dc ; (printf.s1090 + 0)
.s1089:
21da : e6 48 __ INC T0 + 1 
.s1090:
21dc : ad b5 3f LDA $3fb5 ; (si + 1)
21df : f0 0d __ BEQ $21ee ; (printf.s79 + 0)
.s1071:
21e1 : a0 00 __ LDY #$00
21e3 : b1 4d __ LDA (T6 + 0),y 
21e5 : f0 05 __ BEQ $21ec ; (printf.s1072 + 0)
.l81:
21e7 : c8 __ __ INY
21e8 : b1 4d __ LDA (T6 + 0),y 
21ea : d0 fb __ BNE $21e7 ; (printf.l81 + 0)
.s1072:
21ec : 84 4c __ STY T4 + 0 
.s79:
21ee : ad ba 3f LDA $3fba ; (si + 6)
21f1 : d0 1a __ BNE $220d ; (printf.s85 + 0)
.s1075:
21f3 : a4 4c __ LDY T4 + 0 
21f5 : cc b5 3f CPY $3fb5 ; (si + 1)
21f8 : a6 49 __ LDX T2 + 0 
21fa : b0 0d __ BCS $2209 ; (printf.s1076 + 0)
.l87:
21fc : ad b4 3f LDA $3fb4 ; (si + 0)
21ff : 9d bc 3f STA $3fbc,x ; (buff + 0)
2202 : c8 __ __ INY
2203 : cc b5 3f CPY $3fb5 ; (si + 1)
2206 : e8 __ __ INX
2207 : 90 f3 __ BCC $21fc ; (printf.l87 + 0)
.s1076:
2209 : 86 49 __ STX T2 + 0 
220b : 84 4c __ STY T4 + 0 
.s85:
220d : a5 49 __ LDA T2 + 0 
220f : f0 16 __ BEQ $2227 ; (printf.s238 + 0)
.s92:
2211 : a9 bc __ LDA #$bc
2213 : 85 0d __ STA P0 ; (fmt + 0)
2215 : a9 3f __ LDA #$3f
2217 : 85 0e __ STA P1 ; (fmt + 1)
2219 : a9 00 __ LDA #$00
221b : a6 49 __ LDX T2 + 0 
221d : 9d bc 3f STA $3fbc,x ; (buff + 0)
2220 : 20 09 23 JSR $2309 ; (puts.s0 + 0)
2223 : a9 00 __ LDA #$00
2225 : 85 49 __ STA T2 + 0 
.s238:
2227 : a5 4d __ LDA T6 + 0 
2229 : 85 0d __ STA P0 ; (fmt + 0)
222b : a5 4e __ LDA T6 + 1 
222d : 85 0e __ STA P1 ; (fmt + 1)
222f : 20 09 23 JSR $2309 ; (puts.s0 + 0)
2232 : ad ba 3f LDA $3fba ; (si + 6)
2235 : d0 03 __ BNE $223a ; (printf.s1073 + 0)
2237 : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s1073:
223a : a4 4c __ LDY T4 + 0 
223c : cc b5 3f CPY $3fb5 ; (si + 1)
223f : a2 00 __ LDX #$00
2241 : b0 0d __ BCS $2250 ; (printf.s1074 + 0)
.l102:
2243 : ad b4 3f LDA $3fb4 ; (si + 0)
2246 : 9d bc 3f STA $3fbc,x ; (buff + 0)
2249 : c8 __ __ INY
224a : cc b5 3f CPY $3fb5 ; (si + 1)
224d : e8 __ __ INX
224e : 90 f3 __ BCC $2243 ; (printf.l102 + 0)
.s1074:
2250 : 86 49 __ STX T2 + 0 
2252 : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s57:
2255 : a0 00 __ LDY #$00
2257 : b1 47 __ LDA (T0 + 0),y 
2259 : 85 53 __ STA T8 + 0 
225b : c8 __ __ INY
225c : b1 47 __ LDA (T0 + 0),y 
225e : 85 54 __ STA T8 + 1 
2260 : c8 __ __ INY
2261 : b1 47 __ LDA (T0 + 0),y 
2263 : 85 55 __ STA T8 + 2 
2265 : c8 __ __ INY
2266 : b1 47 __ LDA (T0 + 0),y 
2268 : 85 56 __ STA T8 + 3 
226a : 18 __ __ CLC
226b : a5 47 __ LDA T0 + 0 
226d : 69 04 __ ADC #$04
226f : 85 47 __ STA T0 + 0 
2271 : 90 02 __ BCC $2275 ; (printf.s1086 + 0)
.s1085:
2273 : e6 48 __ INC T0 + 1 
.s1086:
2275 : a0 00 __ LDY #$00
2277 : b1 4a __ LDA (T3 + 0),y 
2279 : aa __ __ TAX
227a : e6 4a __ INC T3 + 0 
227c : d0 02 __ BNE $2280 ; (printf.s1088 + 0)
.s1087:
227e : e6 4b __ INC T3 + 1 
.s1088:
2280 : 8a __ __ TXA
2281 : e0 64 __ CPX #$64
2283 : f0 04 __ BEQ $2289 ; (printf.s61 + 0)
.s64:
2285 : c9 44 __ CMP #$44
2287 : d0 04 __ BNE $228d ; (printf.s62 + 0)
.s61:
2289 : a9 01 __ LDA #$01
228b : d0 1c __ BNE $22a9 ; (printf.s245 + 0)
.s62:
228d : c9 75 __ CMP #$75
228f : f0 17 __ BEQ $22a8 ; (printf.s268 + 0)
.s68:
2291 : c9 55 __ CMP #$55
2293 : f0 13 __ BEQ $22a8 ; (printf.s268 + 0)
.s66:
2295 : c9 78 __ CMP #$78
2297 : f0 07 __ BEQ $22a0 ; (printf.s69 + 0)
.s72:
2299 : c9 58 __ CMP #$58
229b : f0 03 __ BEQ $22a0 ; (printf.s69 + 0)
229d : 4c d0 1f JMP $1fd0 ; (printf.l2 + 0)
.s69:
22a0 : 8c b8 3f STY $3fb8 ; (si + 4)
22a3 : a9 10 __ LDA #$10
22a5 : 8d b7 3f STA $3fb7 ; (si + 3)
.s268:
22a8 : 98 __ __ TYA
.s245:
22a9 : 85 15 __ STA P8 
22ab : a9 bc __ LDA #$bc
22ad : 85 0f __ STA P2 ; (fmt + 2)
22af : a9 3f __ LDA #$3f
22b1 : 85 10 __ STA P3 ; (fmt + 3)
22b3 : a5 53 __ LDA T8 + 0 
22b5 : 85 11 __ STA P4 
22b7 : a5 54 __ LDA T8 + 1 
22b9 : 85 12 __ STA P5 
22bb : a5 55 __ LDA T8 + 2 
22bd : 85 13 __ STA P6 
22bf : a5 56 __ LDA T8 + 3 
22c1 : 85 14 __ STA P7 
22c3 : a9 b4 __ LDA #$b4
22c5 : 85 0d __ STA P0 ; (fmt + 0)
22c7 : a9 3f __ LDA #$3f
22c9 : 85 0e __ STA P1 ; (fmt + 1)
22cb : 20 93 24 JSR $2493 ; (nforml.s0 + 0)
22ce : a5 1b __ LDA ACCU + 0 
22d0 : 4c 1b 20 JMP $201b ; (printf.s1068 + 0)
.s269:
22d3 : a9 00 __ LDA #$00
.s247:
22d5 : 85 13 __ STA P6 
22d7 : a9 bc __ LDA #$bc
22d9 : 85 0f __ STA P2 ; (fmt + 2)
22db : a9 3f __ LDA #$3f
22dd : 85 10 __ STA P3 ; (fmt + 3)
22df : a0 00 __ LDY #$00
22e1 : b1 47 __ LDA (T0 + 0),y 
22e3 : 85 11 __ STA P4 
22e5 : c8 __ __ INY
22e6 : b1 47 __ LDA (T0 + 0),y 
22e8 : 85 12 __ STA P5 
22ea : a9 b4 __ LDA #$b4
22ec : 85 0d __ STA P0 ; (fmt + 0)
22ee : a9 3f __ LDA #$3f
22f0 : 85 0e __ STA P1 ; (fmt + 1)
22f2 : 20 5e 23 JSR $235e ; (nformi.s0 + 0)
22f5 : a5 1b __ LDA ACCU + 0 
22f7 : 85 49 __ STA T2 + 0 
22f9 : 4c b3 21 JMP $21b3 ; (printf.s244 + 0)
.s246:
22fc : a0 00 __ LDY #$00
22fe : b1 4a __ LDA (T3 + 0),y 
2300 : aa __ __ TAX
2301 : 18 __ __ CLC
2302 : a5 4a __ LDA T3 + 0 
2304 : 69 01 __ ADC #$01
2306 : 4c 64 20 JMP $2064 ; (printf.l15 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2309 : a0 00 __ LDY #$00
230b : b1 0d __ LDA (P0),y 
230d : f0 0b __ BEQ $231a ; (puts.s1001 + 0)
230f : 20 1b 23 JSR $231b ; (putpch + 0)
2312 : e6 0d __ INC P0 
2314 : d0 f3 __ BNE $2309 ; (puts.s0 + 0)
2316 : e6 0e __ INC P1 
2318 : d0 ef __ BNE $2309 ; (puts.s0 + 0)
.s1001:
231a : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
231b : ae c3 36 LDX $36c3 ; (giocharmap + 0)
231e : e0 01 __ CPX #$01
2320 : 90 26 __ BCC $2348 ; (putpch + 45)
2322 : c9 0a __ CMP #$0a
2324 : d0 02 __ BNE $2328 ; (putpch + 13)
2326 : a9 0d __ LDA #$0d
2328 : c9 09 __ CMP #$09
232a : f0 1f __ BEQ $234b ; (putpch + 48)
232c : e0 02 __ CPX #$02
232e : 90 18 __ BCC $2348 ; (putpch + 45)
2330 : c9 41 __ CMP #$41
2332 : 90 14 __ BCC $2348 ; (putpch + 45)
2334 : c9 7b __ CMP #$7b
2336 : b0 10 __ BCS $2348 ; (putpch + 45)
2338 : c9 61 __ CMP #$61
233a : b0 04 __ BCS $2340 ; (putpch + 37)
233c : c9 5b __ CMP #$5b
233e : b0 08 __ BCS $2348 ; (putpch + 45)
2340 : 49 20 __ EOR #$20
2342 : e0 03 __ CPX #$03
2344 : f0 02 __ BEQ $2348 ; (putpch + 45)
2346 : 29 df __ AND #$df
2348 : 4c d2 ff JMP $ffd2 
234b : 38 __ __ SEC
234c : 20 f0 ff JSR $fff0 
234f : 98 __ __ TYA
2350 : 29 03 __ AND #$03
2352 : 49 03 __ EOR #$03
2354 : aa __ __ TAX
2355 : a9 20 __ LDA #$20
2357 : 20 d2 ff JSR $ffd2 
235a : ca __ __ DEX
235b : 10 fa __ BPL $2357 ; (putpch + 60)
235d : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
235e : a9 00 __ LDA #$00
2360 : 85 43 __ STA T0 + 0 
2362 : a5 13 __ LDA P6 ; (s + 0)
2364 : f0 13 __ BEQ $2379 ; (nformi.s182 + 0)
.s4:
2366 : 24 12 __ BIT P5 ; (v + 1)
2368 : 10 0f __ BPL $2379 ; (nformi.s182 + 0)
.s1:
236a : 38 __ __ SEC
236b : a9 00 __ LDA #$00
236d : e5 11 __ SBC P4 ; (v + 0)
236f : 85 11 __ STA P4 ; (v + 0)
2371 : a9 00 __ LDA #$00
2373 : e5 12 __ SBC P5 ; (v + 1)
2375 : 85 12 __ STA P5 ; (v + 1)
2377 : e6 43 __ INC T0 + 0 
.s182:
2379 : a9 10 __ LDA #$10
237b : 85 44 __ STA T2 + 0 
237d : a5 11 __ LDA P4 ; (v + 0)
237f : 05 12 __ ORA P5 ; (v + 1)
2381 : f0 46 __ BEQ $23c9 ; (nformi.s7 + 0)
.s42:
2383 : a0 03 __ LDY #$03
2385 : b1 0d __ LDA (P0),y ; (si + 0)
2387 : 85 45 __ STA T4 + 0 
2389 : c8 __ __ INY
238a : b1 0d __ LDA (P0),y ; (si + 0)
238c : 85 46 __ STA T4 + 1 
.l6:
238e : a5 11 __ LDA P4 ; (v + 0)
2390 : 85 1b __ STA ACCU + 0 
2392 : a5 12 __ LDA P5 ; (v + 1)
2394 : 85 1c __ STA ACCU + 1 
2396 : a5 45 __ LDA T4 + 0 
2398 : 85 03 __ STA WORK + 0 
239a : a5 46 __ LDA T4 + 1 
239c : 85 04 __ STA WORK + 1 
239e : 20 3f 35 JSR $353f ; (divmod + 0)
23a1 : a5 06 __ LDA WORK + 3 
23a3 : 30 08 __ BMI $23ad ; (nformi.s78 + 0)
.s1019:
23a5 : d0 0a __ BNE $23b1 ; (nformi.s77 + 0)
.s1018:
23a7 : a5 05 __ LDA WORK + 2 
23a9 : c9 0a __ CMP #$0a
23ab : b0 04 __ BCS $23b1 ; (nformi.s77 + 0)
.s78:
23ad : a9 30 __ LDA #$30
23af : d0 02 __ BNE $23b3 ; (nformi.s79 + 0)
.s77:
23b1 : a9 37 __ LDA #$37
.s79:
23b3 : 18 __ __ CLC
23b4 : 65 05 __ ADC WORK + 2 
23b6 : c6 44 __ DEC T2 + 0 
23b8 : a6 44 __ LDX T2 + 0 
23ba : 9d ee 3f STA $3fee,x ; (softscroll + 5)
23bd : a5 1b __ LDA ACCU + 0 
23bf : 85 11 __ STA P4 ; (v + 0)
23c1 : a5 1c __ LDA ACCU + 1 
23c3 : 85 12 __ STA P5 ; (v + 1)
23c5 : 05 11 __ ORA P4 ; (v + 0)
23c7 : d0 c5 __ BNE $238e ; (nformi.l6 + 0)
.s7:
23c9 : a0 02 __ LDY #$02
23cb : b1 0d __ LDA (P0),y ; (si + 0)
23cd : c9 ff __ CMP #$ff
23cf : d0 04 __ BNE $23d5 ; (nformi.s80 + 0)
.s81:
23d1 : a9 0f __ LDA #$0f
23d3 : d0 05 __ BNE $23da ; (nformi.s1026 + 0)
.s80:
23d5 : 38 __ __ SEC
23d6 : a9 10 __ LDA #$10
23d8 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
23da : a8 __ __ TAY
23db : c4 44 __ CPY T2 + 0 
23dd : b0 0d __ BCS $23ec ; (nformi.s10 + 0)
.s9:
23df : a9 30 __ LDA #$30
.l1027:
23e1 : c6 44 __ DEC T2 + 0 
23e3 : a6 44 __ LDX T2 + 0 
23e5 : 9d ee 3f STA $3fee,x ; (softscroll + 5)
23e8 : c4 44 __ CPY T2 + 0 
23ea : 90 f5 __ BCC $23e1 ; (nformi.l1027 + 0)
.s10:
23ec : a0 07 __ LDY #$07
23ee : b1 0d __ LDA (P0),y ; (si + 0)
23f0 : f0 20 __ BEQ $2412 ; (nformi.s13 + 0)
.s14:
23f2 : a0 04 __ LDY #$04
23f4 : b1 0d __ LDA (P0),y ; (si + 0)
23f6 : d0 1a __ BNE $2412 ; (nformi.s13 + 0)
.s1013:
23f8 : 88 __ __ DEY
23f9 : b1 0d __ LDA (P0),y ; (si + 0)
23fb : c9 10 __ CMP #$10
23fd : d0 13 __ BNE $2412 ; (nformi.s13 + 0)
.s11:
23ff : a9 58 __ LDA #$58
2401 : a6 44 __ LDX T2 + 0 
2403 : 9d ed 3f STA $3fed,x ; (buff + 49)
2406 : 8a __ __ TXA
2407 : 18 __ __ CLC
2408 : 69 fe __ ADC #$fe
240a : 85 44 __ STA T2 + 0 
240c : aa __ __ TAX
240d : a9 30 __ LDA #$30
240f : 9d ee 3f STA $3fee,x ; (softscroll + 5)
.s13:
2412 : a9 00 __ LDA #$00
2414 : 85 1b __ STA ACCU + 0 
2416 : a5 43 __ LDA T0 + 0 
2418 : f0 06 __ BEQ $2420 ; (nformi.s16 + 0)
.s15:
241a : c6 44 __ DEC T2 + 0 
241c : a9 2d __ LDA #$2d
241e : d0 0a __ BNE $242a ; (nformi.s1025 + 0)
.s16:
2420 : a0 05 __ LDY #$05
2422 : b1 0d __ LDA (P0),y ; (si + 0)
2424 : f0 09 __ BEQ $242f ; (nformi.s163 + 0)
.s18:
2426 : c6 44 __ DEC T2 + 0 
2428 : a9 2b __ LDA #$2b
.s1025:
242a : a6 44 __ LDX T2 + 0 
242c : 9d ee 3f STA $3fee,x ; (softscroll + 5)
.s163:
242f : a0 06 __ LDY #$06
2431 : b1 0d __ LDA (P0),y ; (si + 0)
2433 : d0 33 __ BNE $2468 ; (nformi.s24 + 0)
.l30:
2435 : a0 01 __ LDY #$01
2437 : b1 0d __ LDA (P0),y ; (si + 0)
2439 : 18 __ __ CLC
243a : 65 44 __ ADC T2 + 0 
243c : b0 04 __ BCS $2442 ; (nformi.s31 + 0)
.s1006:
243e : c9 11 __ CMP #$11
2440 : 90 0d __ BCC $244f ; (nformi.s33 + 0)
.s31:
2442 : c6 44 __ DEC T2 + 0 
2444 : a0 00 __ LDY #$00
2446 : b1 0d __ LDA (P0),y ; (si + 0)
2448 : a6 44 __ LDX T2 + 0 
244a : 9d ee 3f STA $3fee,x ; (softscroll + 5)
244d : b0 e6 __ BCS $2435 ; (nformi.l30 + 0)
.s33:
244f : a6 44 __ LDX T2 + 0 
2451 : e0 10 __ CPX #$10
2453 : b0 0e __ BCS $2463 ; (nformi.s23 + 0)
.s34:
2455 : 88 __ __ DEY
.l1022:
2456 : bd ee 3f LDA $3fee,x ; (softscroll + 5)
2459 : 91 0f __ STA (P2),y ; (str + 0)
245b : e8 __ __ INX
245c : e0 10 __ CPX #$10
245e : c8 __ __ INY
245f : 90 f5 __ BCC $2456 ; (nformi.l1022 + 0)
.s1023:
2461 : 84 1b __ STY ACCU + 0 
.s23:
2463 : a9 00 __ LDA #$00
2465 : 85 1c __ STA ACCU + 1 
.s1001:
2467 : 60 __ __ RTS
.s24:
2468 : a6 44 __ LDX T2 + 0 
246a : e0 10 __ CPX #$10
246c : b0 1a __ BCS $2488 ; (nformi.l27 + 0)
.s25:
246e : a0 00 __ LDY #$00
.l1020:
2470 : bd ee 3f LDA $3fee,x ; (softscroll + 5)
2473 : 91 0f __ STA (P2),y ; (str + 0)
2475 : e8 __ __ INX
2476 : e0 10 __ CPX #$10
2478 : c8 __ __ INY
2479 : 90 f5 __ BCC $2470 ; (nformi.l1020 + 0)
.s1021:
247b : 84 1b __ STY ACCU + 0 
247d : b0 09 __ BCS $2488 ; (nformi.l27 + 0)
.s28:
247f : 88 __ __ DEY
2480 : b1 0d __ LDA (P0),y ; (si + 0)
2482 : a4 1b __ LDY ACCU + 0 
2484 : 91 0f __ STA (P2),y ; (str + 0)
2486 : e6 1b __ INC ACCU + 0 
.l27:
2488 : a5 1b __ LDA ACCU + 0 
248a : a0 01 __ LDY #$01
248c : d1 0d __ CMP (P0),y ; (si + 0)
248e : 90 ef __ BCC $247f ; (nformi.s28 + 0)
2490 : 4c 63 24 JMP $2463 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
2493 : a9 00 __ LDA #$00
2495 : 85 43 __ STA T0 + 0 
2497 : a5 15 __ LDA P8 ; (s + 0)
2499 : f0 21 __ BEQ $24bc ; (nforml.s182 + 0)
.s4:
249b : a5 14 __ LDA P7 ; (v + 3)
249d : f0 1d __ BEQ $24bc ; (nforml.s182 + 0)
.s1032:
249f : 10 1b __ BPL $24bc ; (nforml.s182 + 0)
.s1:
24a1 : 38 __ __ SEC
24a2 : a9 00 __ LDA #$00
24a4 : e5 11 __ SBC P4 ; (v + 0)
24a6 : 85 11 __ STA P4 ; (v + 0)
24a8 : a9 00 __ LDA #$00
24aa : e5 12 __ SBC P5 ; (v + 1)
24ac : 85 12 __ STA P5 ; (v + 1)
24ae : a9 00 __ LDA #$00
24b0 : e5 13 __ SBC P6 ; (v + 2)
24b2 : 85 13 __ STA P6 ; (v + 2)
24b4 : a9 00 __ LDA #$00
24b6 : e5 14 __ SBC P7 ; (v + 3)
24b8 : 85 14 __ STA P7 ; (v + 3)
24ba : e6 43 __ INC T0 + 0 
.s182:
24bc : a9 10 __ LDA #$10
24be : 85 44 __ STA T2 + 0 
24c0 : a5 14 __ LDA P7 ; (v + 3)
24c2 : d0 0c __ BNE $24d0 ; (nforml.s42 + 0)
.s1024:
24c4 : a5 13 __ LDA P6 ; (v + 2)
24c6 : d0 08 __ BNE $24d0 ; (nforml.s42 + 0)
.s1025:
24c8 : a5 12 __ LDA P5 ; (v + 1)
24ca : d0 04 __ BNE $24d0 ; (nforml.s42 + 0)
.s1026:
24cc : c5 11 __ CMP P4 ; (v + 0)
24ce : b0 0e __ BCS $24de ; (nforml.s7 + 0)
.s42:
24d0 : a0 03 __ LDY #$03
24d2 : b1 0d __ LDA (P0),y ; (si + 0)
24d4 : 85 45 __ STA T5 + 0 
24d6 : c8 __ __ INY
24d7 : b1 0d __ LDA (P0),y ; (si + 0)
24d9 : 85 46 __ STA T5 + 1 
24db : 4c a8 25 JMP $25a8 ; (nforml.l6 + 0)
.s7:
24de : a0 02 __ LDY #$02
24e0 : b1 0d __ LDA (P0),y ; (si + 0)
24e2 : c9 ff __ CMP #$ff
24e4 : d0 04 __ BNE $24ea ; (nforml.s80 + 0)
.s81:
24e6 : a9 0f __ LDA #$0f
24e8 : d0 05 __ BNE $24ef ; (nforml.s1039 + 0)
.s80:
24ea : 38 __ __ SEC
24eb : a9 10 __ LDA #$10
24ed : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
24ef : a8 __ __ TAY
24f0 : c4 44 __ CPY T2 + 0 
24f2 : b0 0d __ BCS $2501 ; (nforml.s10 + 0)
.s9:
24f4 : a9 30 __ LDA #$30
.l1040:
24f6 : c6 44 __ DEC T2 + 0 
24f8 : a6 44 __ LDX T2 + 0 
24fa : 9d ee 3f STA $3fee,x ; (softscroll + 5)
24fd : c4 44 __ CPY T2 + 0 
24ff : 90 f5 __ BCC $24f6 ; (nforml.l1040 + 0)
.s10:
2501 : a0 07 __ LDY #$07
2503 : b1 0d __ LDA (P0),y ; (si + 0)
2505 : f0 20 __ BEQ $2527 ; (nforml.s13 + 0)
.s14:
2507 : a0 04 __ LDY #$04
2509 : b1 0d __ LDA (P0),y ; (si + 0)
250b : d0 1a __ BNE $2527 ; (nforml.s13 + 0)
.s1013:
250d : 88 __ __ DEY
250e : b1 0d __ LDA (P0),y ; (si + 0)
2510 : c9 10 __ CMP #$10
2512 : d0 13 __ BNE $2527 ; (nforml.s13 + 0)
.s11:
2514 : a9 58 __ LDA #$58
2516 : a6 44 __ LDX T2 + 0 
2518 : 9d ed 3f STA $3fed,x ; (buff + 49)
251b : 8a __ __ TXA
251c : 18 __ __ CLC
251d : 69 fe __ ADC #$fe
251f : 85 44 __ STA T2 + 0 
2521 : aa __ __ TAX
2522 : a9 30 __ LDA #$30
2524 : 9d ee 3f STA $3fee,x ; (softscroll + 5)
.s13:
2527 : a9 00 __ LDA #$00
2529 : 85 1b __ STA ACCU + 0 
252b : a5 43 __ LDA T0 + 0 
252d : f0 06 __ BEQ $2535 ; (nforml.s16 + 0)
.s15:
252f : c6 44 __ DEC T2 + 0 
2531 : a9 2d __ LDA #$2d
2533 : d0 0a __ BNE $253f ; (nforml.s1038 + 0)
.s16:
2535 : a0 05 __ LDY #$05
2537 : b1 0d __ LDA (P0),y ; (si + 0)
2539 : f0 09 __ BEQ $2544 ; (nforml.s163 + 0)
.s18:
253b : c6 44 __ DEC T2 + 0 
253d : a9 2b __ LDA #$2b
.s1038:
253f : a6 44 __ LDX T2 + 0 
2541 : 9d ee 3f STA $3fee,x ; (softscroll + 5)
.s163:
2544 : a0 06 __ LDY #$06
2546 : b1 0d __ LDA (P0),y ; (si + 0)
2548 : d0 33 __ BNE $257d ; (nforml.s24 + 0)
.l30:
254a : a0 01 __ LDY #$01
254c : b1 0d __ LDA (P0),y ; (si + 0)
254e : 18 __ __ CLC
254f : 65 44 __ ADC T2 + 0 
2551 : b0 04 __ BCS $2557 ; (nforml.s31 + 0)
.s1006:
2553 : c9 11 __ CMP #$11
2555 : 90 0d __ BCC $2564 ; (nforml.s33 + 0)
.s31:
2557 : c6 44 __ DEC T2 + 0 
2559 : a0 00 __ LDY #$00
255b : b1 0d __ LDA (P0),y ; (si + 0)
255d : a6 44 __ LDX T2 + 0 
255f : 9d ee 3f STA $3fee,x ; (softscroll + 5)
2562 : b0 e6 __ BCS $254a ; (nforml.l30 + 0)
.s33:
2564 : a6 44 __ LDX T2 + 0 
2566 : e0 10 __ CPX #$10
2568 : b0 0e __ BCS $2578 ; (nforml.s23 + 0)
.s34:
256a : 88 __ __ DEY
.l1035:
256b : bd ee 3f LDA $3fee,x ; (softscroll + 5)
256e : 91 0f __ STA (P2),y ; (str + 0)
2570 : e8 __ __ INX
2571 : e0 10 __ CPX #$10
2573 : c8 __ __ INY
2574 : 90 f5 __ BCC $256b ; (nforml.l1035 + 0)
.s1036:
2576 : 84 1b __ STY ACCU + 0 
.s23:
2578 : a9 00 __ LDA #$00
257a : 85 1c __ STA ACCU + 1 
.s1001:
257c : 60 __ __ RTS
.s24:
257d : a6 44 __ LDX T2 + 0 
257f : e0 10 __ CPX #$10
2581 : b0 1a __ BCS $259d ; (nforml.l27 + 0)
.s25:
2583 : a0 00 __ LDY #$00
.l1033:
2585 : bd ee 3f LDA $3fee,x ; (softscroll + 5)
2588 : 91 0f __ STA (P2),y ; (str + 0)
258a : e8 __ __ INX
258b : e0 10 __ CPX #$10
258d : c8 __ __ INY
258e : 90 f5 __ BCC $2585 ; (nforml.l1033 + 0)
.s1034:
2590 : 84 1b __ STY ACCU + 0 
2592 : b0 09 __ BCS $259d ; (nforml.l27 + 0)
.s28:
2594 : 88 __ __ DEY
2595 : b1 0d __ LDA (P0),y ; (si + 0)
2597 : a4 1b __ LDY ACCU + 0 
2599 : 91 0f __ STA (P2),y ; (str + 0)
259b : e6 1b __ INC ACCU + 0 
.l27:
259d : a5 1b __ LDA ACCU + 0 
259f : a0 01 __ LDY #$01
25a1 : d1 0d __ CMP (P0),y ; (si + 0)
25a3 : 90 ef __ BCC $2594 ; (nforml.s28 + 0)
25a5 : 4c 78 25 JMP $2578 ; (nforml.s23 + 0)
.l6:
25a8 : a5 11 __ LDA P4 ; (v + 0)
25aa : 85 1b __ STA ACCU + 0 
25ac : a5 12 __ LDA P5 ; (v + 1)
25ae : 85 1c __ STA ACCU + 1 
25b0 : a5 13 __ LDA P6 ; (v + 2)
25b2 : 85 1d __ STA ACCU + 2 
25b4 : a5 14 __ LDA P7 ; (v + 3)
25b6 : 85 1e __ STA ACCU + 3 
25b8 : a5 45 __ LDA T5 + 0 
25ba : 85 03 __ STA WORK + 0 
25bc : a5 46 __ LDA T5 + 1 
25be : 85 04 __ STA WORK + 1 
25c0 : a9 00 __ LDA #$00
25c2 : 85 05 __ STA WORK + 2 
25c4 : 85 06 __ STA WORK + 3 
25c6 : 20 c4 35 JSR $35c4 ; (divmod32 + 0)
25c9 : a5 08 __ LDA WORK + 5 
25cb : 30 08 __ BMI $25d5 ; (nforml.s78 + 0)
.s1023:
25cd : d0 0a __ BNE $25d9 ; (nforml.s77 + 0)
.s1022:
25cf : a5 07 __ LDA WORK + 4 
25d1 : c9 0a __ CMP #$0a
25d3 : b0 04 __ BCS $25d9 ; (nforml.s77 + 0)
.s78:
25d5 : a9 30 __ LDA #$30
25d7 : d0 02 __ BNE $25db ; (nforml.s79 + 0)
.s77:
25d9 : a9 37 __ LDA #$37
.s79:
25db : 18 __ __ CLC
25dc : 65 07 __ ADC WORK + 4 
25de : c6 44 __ DEC T2 + 0 
25e0 : a6 44 __ LDX T2 + 0 
25e2 : 9d ee 3f STA $3fee,x ; (softscroll + 5)
25e5 : a5 1b __ LDA ACCU + 0 
25e7 : 85 11 __ STA P4 ; (v + 0)
25e9 : a5 1c __ LDA ACCU + 1 
25eb : 85 12 __ STA P5 ; (v + 1)
25ed : a5 1d __ LDA ACCU + 2 
25ef : 85 13 __ STA P6 ; (v + 2)
25f1 : a5 1e __ LDA ACCU + 3 
25f3 : 85 14 __ STA P7 ; (v + 3)
25f5 : d0 b1 __ BNE $25a8 ; (nforml.l6 + 0)
.s1018:
25f7 : a5 13 __ LDA P6 ; (v + 2)
25f9 : d0 ad __ BNE $25a8 ; (nforml.l6 + 0)
.s1019:
25fb : a5 12 __ LDA P5 ; (v + 1)
25fd : d0 a9 __ BNE $25a8 ; (nforml.l6 + 0)
.s1020:
25ff : c5 11 __ CMP P4 ; (v + 0)
2601 : 90 a5 __ BCC $25a8 ; (nforml.l6 + 0)
2603 : 4c de 24 JMP $24de ; (nforml.s7 + 0)
--------------------------------------------------------------------
2606 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2616 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2626 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
2631 : 20 3b 26 JSR $263b ; (getpch + 0)
2634 : c9 00 __ CMP #$00
2636 : f0 f9 __ BEQ $2631 ; (getch.s0 + 0)
2638 : 85 1b __ STA ACCU + 0 
.s1001:
263a : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
263b : 20 e4 ff JSR $ffe4 
263e : ae c3 36 LDX $36c3 ; (giocharmap + 0)
2641 : e0 01 __ CPX #$01
2643 : 90 26 __ BCC $266b ; (getpch + 48)
2645 : c9 0d __ CMP #$0d
2647 : d0 02 __ BNE $264b ; (getpch + 16)
2649 : a9 0a __ LDA #$0a
264b : e0 02 __ CPX #$02
264d : 90 1c __ BCC $266b ; (getpch + 48)
264f : c9 db __ CMP #$db
2651 : b0 18 __ BCS $266b ; (getpch + 48)
2653 : c9 41 __ CMP #$41
2655 : 90 14 __ BCC $266b ; (getpch + 48)
2657 : c9 c1 __ CMP #$c1
2659 : 90 02 __ BCC $265d ; (getpch + 34)
265b : 49 a0 __ EOR #$a0
265d : c9 7b __ CMP #$7b
265f : b0 0a __ BCS $266b ; (getpch + 48)
2661 : c9 61 __ CMP #$61
2663 : b0 04 __ BCS $2669 ; (getpch + 46)
2665 : c9 5b __ CMP #$5b
2667 : b0 02 __ BCS $266b ; (getpch + 48)
2669 : 49 20 __ EOR #$20
266b : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
266c : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
266f : 24 d7 __ BIT $d7 
2671 : 10 01 __ BPL $2674 ; (screen_setmode.s6 + 0)
.s1001:
2673 : 60 __ __ RTS
.s6:
2674 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2677 : 09 00 __ ORA #$00
2679 : d0 0d __ BNE $2688 ; (fastmode.s1 + 0)
.s2:
267b : 8d 30 d0 STA $d030 
267e : ad 11 d0 LDA $d011 
2681 : 29 7f __ AND #$7f
2683 : 09 10 __ ORA #$10
2685 : 4c 92 26 JMP $2692 ; (fastmode.s3 + 0)
.s1:
2688 : a9 01 __ LDA #$01
268a : 8d 30 d0 STA $d030 
268d : ad 11 d0 LDA $d011 
2690 : 29 6f __ AND #$6f
.s3:
2692 : 8d 11 d0 STA $d011 
.s1001:
2695 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2696 : a4 0f __ LDY P2 ; (mode + 0)
2698 : be a1 36 LDX $36a1,y ; (__multab36L + 0)
269b : 86 4a __ STX T1 + 0 
269d : 86 4c __ STX T2 + 0 
269f : bd 04 37 LDA $3704,x ; (vdc_modes + 4)
26a2 : f0 08 __ BEQ $26ac ; (vdc_set_mode.s3 + 0)
.s4:
26a4 : ad c4 36 LDA $36c4 ; (vdc_state + 0)
26a7 : c9 10 __ CMP #$10
26a9 : d0 01 __ BNE $26ac ; (vdc_set_mode.s3 + 0)
26ab : 60 __ __ RTS
.s3:
26ac : 8c c6 36 STY $36c6 ; (vdc_state + 2)
26af : a9 8d __ LDA #$8d
26b1 : 8d cb 36 STA $36cb ; (vdc_state + 7)
26b4 : a9 00 __ LDA #$00
26b6 : 8d da 36 STA $36da ; (vdc_state + 22)
26b9 : 8d db 36 STA $36db ; (vdc_state + 23)
26bc : 8d dc 36 STA $36dc ; (vdc_state + 24)
26bf : bd 00 37 LDA $3700,x ; (vdc_modes + 0)
26c2 : 8d c7 36 STA $36c7 ; (vdc_state + 3)
26c5 : bd 01 37 LDA $3701,x ; (vdc_modes + 1)
26c8 : 8d c8 36 STA $36c8 ; (vdc_state + 4)
26cb : bd 02 37 LDA $3702,x ; (vdc_modes + 2)
26ce : 8d c9 36 STA $36c9 ; (vdc_state + 5)
26d1 : bd 03 37 LDA $3703,x ; (vdc_modes + 3)
26d4 : 8d ca 36 STA $36ca ; (vdc_state + 6)
26d7 : bd 09 37 LDA $3709,x ; (vdc_modes + 9)
26da : 8d d0 36 STA $36d0 ; (vdc_state + 12)
26dd : bd 0a 37 LDA $370a,x ; (vdc_modes + 10)
26e0 : 8d d1 36 STA $36d1 ; (vdc_state + 13)
26e3 : bd 0b 37 LDA $370b,x ; (vdc_modes + 11)
26e6 : 8d d2 36 STA $36d2 ; (vdc_state + 14)
26e9 : bd 0c 37 LDA $370c,x ; (vdc_modes + 12)
26ec : 8d d3 36 STA $36d3 ; (vdc_state + 15)
26ef : bd 0d 37 LDA $370d,x ; (vdc_modes + 13)
26f2 : 8d d4 36 STA $36d4 ; (vdc_state + 16)
26f5 : bd 0e 37 LDA $370e,x ; (vdc_modes + 14)
26f8 : 8d d5 36 STA $36d5 ; (vdc_state + 17)
26fb : bd 0f 37 LDA $370f,x ; (vdc_modes + 15)
26fe : 8d d6 36 STA $36d6 ; (vdc_state + 18)
2701 : bd 10 37 LDA $3710,x ; (vdc_modes + 16)
2704 : 8d d7 36 STA $36d7 ; (vdc_state + 19)
2707 : bd 11 37 LDA $3711,x ; (vdc_modes + 17)
270a : 8d d8 36 STA $36d8 ; (vdc_state + 20)
270d : bd 12 37 LDA $3712,x ; (vdc_modes + 18)
2710 : 8d d9 36 STA $36d9 ; (vdc_state + 21)
2713 : bd 05 37 LDA $3705,x ; (vdc_modes + 5)
2716 : 85 4d __ STA T3 + 0 
2718 : 8d cc 36 STA $36cc ; (vdc_state + 8)
271b : bd 06 37 LDA $3706,x ; (vdc_modes + 6)
271e : 85 4e __ STA T3 + 1 
2720 : 8d cd 36 STA $36cd ; (vdc_state + 9)
2723 : bd 07 37 LDA $3707,x ; (vdc_modes + 7)
2726 : 85 4f __ STA T5 + 0 
2728 : 8d ce 36 STA $36ce ; (vdc_state + 10)
272b : bd 08 37 LDA $3708,x ; (vdc_modes + 8)
272e : 85 50 __ STA T5 + 1 
2730 : 8d cf 36 STA $36cf ; (vdc_state + 11)
2733 : 20 0b 28 JSR $280b ; (vdc_set_multab.s0 + 0)
2736 : a9 22 __ LDA #$22
2738 : 8d 00 d6 STA $d600 
.l295:
273b : 2c 00 d6 BIT $d600 
273e : 10 fb __ BPL $273b ; (vdc_set_mode.l295 + 0)
.s11:
2740 : a9 80 __ LDA #$80
2742 : 8d 01 d6 STA $d601 
2745 : a9 0c __ LDA #$0c
2747 : 8d 00 d6 STA $d600 
.l297:
274a : 2c 00 d6 BIT $d600 
274d : 10 fb __ BPL $274a ; (vdc_set_mode.l297 + 0)
.s17:
274f : a5 4e __ LDA T3 + 1 
2751 : 8d 01 d6 STA $d601 
2754 : a9 0d __ LDA #$0d
2756 : 8d 00 d6 STA $d600 
.l299:
2759 : 2c 00 d6 BIT $d600 
275c : 10 fb __ BPL $2759 ; (vdc_set_mode.l299 + 0)
.s22:
275e : a5 4d __ LDA T3 + 0 
2760 : 8d 01 d6 STA $d601 
2763 : a9 14 __ LDA #$14
2765 : 8d 00 d6 STA $d600 
.l301:
2768 : 2c 00 d6 BIT $d600 
276b : 10 fb __ BPL $2768 ; (vdc_set_mode.l301 + 0)
.s27:
276d : a5 50 __ LDA T5 + 1 
276f : 8d 01 d6 STA $d601 
2772 : a9 15 __ LDA #$15
2774 : 8d 00 d6 STA $d600 
.l303:
2777 : 2c 00 d6 BIT $d600 
277a : 10 fb __ BPL $2777 ; (vdc_set_mode.l303 + 0)
.s32:
277c : a5 4f __ LDA T5 + 0 
277e : 8d 01 d6 STA $d601 
2781 : a6 4a __ LDX T1 + 0 
2783 : bd 0e 37 LDA $370e,x ; (vdc_modes + 14)
2786 : a2 1c __ LDX #$1c
2788 : 8e 00 d6 STX $d600 
.l305:
278b : 2c 00 d6 BIT $d600 
278e : 10 fb __ BPL $278b ; (vdc_set_mode.l305 + 0)
.s39:
2790 : aa __ __ TAX
2791 : ad 01 d6 LDA $d601 
2794 : 29 10 __ AND #$10
2796 : 85 4f __ STA T5 + 0 
2798 : a9 1c __ LDA #$1c
279a : 8d 00 d6 STA $d600 
279d : 8a __ __ TXA
279e : 29 e0 __ AND #$e0
27a0 : 05 4f __ ORA T5 + 0 
.l307:
27a2 : 2c 00 d6 BIT $d600 
27a5 : 10 fb __ BPL $27a2 ; (vdc_set_mode.l307 + 0)
.s45:
27a7 : 8d 01 d6 STA $d601 
27aa : 20 66 28 JSR $2866 ; (vdc_restore_charsets.s0 + 0)
27ad : 18 __ __ CLC
27ae : a9 13 __ LDA #$13
27b0 : 65 4a __ ADC T1 + 0 
27b2 : 85 4a __ STA T1 + 0 
27b4 : a9 37 __ LDA #$37
27b6 : 69 00 __ ADC #$00
27b8 : 85 4b __ STA T1 + 1 
27ba : 18 __ __ CLC
27bb : a5 4c __ LDA T2 + 0 
27bd : 69 13 __ ADC #$13
27bf : 85 4d __ STA T3 + 0 
27c1 : a9 00 __ LDA #$00
27c3 : 85 43 __ STA T0 + 0 
27c5 : 69 37 __ ADC #$37
27c7 : 85 4e __ STA T3 + 1 
.l46:
27c9 : a4 43 __ LDY T0 + 0 
27cb : b1 4a __ LDA (T1 + 0),y 
27cd : 85 47 __ STA T7 + 0 
27cf : c8 __ __ INY
27d0 : b1 4a __ LDA (T1 + 0),y 
27d2 : aa __ __ TAX
27d3 : a5 47 __ LDA T7 + 0 
27d5 : 8d 00 d6 STA $d600 
27d8 : c8 __ __ INY
27d9 : 84 43 __ STY T0 + 0 
.l309:
27db : 2c 00 d6 BIT $d600 
27de : 10 fb __ BPL $27db ; (vdc_set_mode.l309 + 0)
.s52:
27e0 : 8e 01 d6 STX $d601 
27e3 : b1 4d __ LDA (T3 + 0),y 
27e5 : c9 ff __ CMP #$ff
27e7 : d0 e0 __ BNE $27c9 ; (vdc_set_mode.l46 + 0)
.s47:
27e9 : a6 4c __ LDX T2 + 0 
27eb : bd 04 37 LDA $3704,x ; (vdc_modes + 4)
27ee : f0 08 __ BEQ $27f8 ; (vdc_set_mode.s55 + 0)
.s56:
27f0 : ad c5 36 LDA $36c5 ; (vdc_state + 1)
27f3 : d0 03 __ BNE $27f8 ; (vdc_set_mode.s55 + 0)
.s53:
27f5 : 20 bb 28 JSR $28bb ; (vdc_set_extended_memsize.s0 + 0)
.s55:
27f8 : 20 c4 1e JSR $1ec4 ; (vdc_cls.s0 + 0)
27fb : a9 22 __ LDA #$22
27fd : 8d 00 d6 STA $d600 
.l314:
2800 : 2c 00 d6 BIT $d600 
2803 : 10 fb __ BPL $2800 ; (vdc_set_mode.l314 + 0)
.s62:
2805 : a9 7d __ LDA #$7d
2807 : 8d 01 d6 STA $d601 
.s1001:
280a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
280b : ad ca 36 LDA $36ca ; (vdc_state + 6)
280e : 85 1c __ STA ACCU + 1 
2810 : ad c9 36 LDA $36c9 ; (vdc_state + 5)
2813 : 85 1b __ STA ACCU + 0 
2815 : 05 1c __ ORA ACCU + 1 
2817 : f0 4c __ BEQ $2865 ; (vdc_set_multab.s1001 + 0)
.s5:
2819 : ad c7 36 LDA $36c7 ; (vdc_state + 3)
281c : 18 __ __ CLC
281d : 6d dc 36 ADC $36dc ; (vdc_state + 24)
2820 : 85 43 __ STA T2 + 0 
2822 : ad c8 36 LDA $36c8 ; (vdc_state + 4)
2825 : 69 00 __ ADC #$00
2827 : 85 44 __ STA T2 + 1 
2829 : a9 00 __ LDA #$00
282b : 85 45 __ STA T3 + 0 
282d : 85 46 __ STA T3 + 1 
282f : a9 00 __ LDA #$00
2831 : 85 47 __ STA T4 + 0 
2833 : a9 38 __ LDA #$38
2835 : 85 48 __ STA T4 + 1 
2837 : a2 00 __ LDX #$00
.l2:
2839 : a5 45 __ LDA T3 + 0 
283b : a0 00 __ LDY #$00
283d : 91 47 __ STA (T4 + 0),y 
283f : a5 46 __ LDA T3 + 1 
2841 : c8 __ __ INY
2842 : 91 47 __ STA (T4 + 0),y 
2844 : 18 __ __ CLC
2845 : a5 43 __ LDA T2 + 0 
2847 : 65 45 __ ADC T3 + 0 
2849 : 85 45 __ STA T3 + 0 
284b : a5 44 __ LDA T2 + 1 
284d : 65 46 __ ADC T3 + 1 
284f : 85 46 __ STA T3 + 1 
2851 : 18 __ __ CLC
2852 : a5 47 __ LDA T4 + 0 
2854 : 69 02 __ ADC #$02
2856 : 85 47 __ STA T4 + 0 
2858 : 90 02 __ BCC $285c ; (vdc_set_multab.s1006 + 0)
.s1005:
285a : e6 48 __ INC T4 + 1 
.s1006:
285c : e8 __ __ INX
285d : a5 1c __ LDA ACCU + 1 
285f : d0 d8 __ BNE $2839 ; (vdc_set_multab.l2 + 0)
.s1002:
2861 : e4 1b __ CPX ACCU + 0 
2863 : 90 d4 __ BCC $2839 ; (vdc_set_multab.l2 + 0)
.s1001:
2865 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2866 : ad d4 36 LDA $36d4 ; (vdc_state + 16)
2869 : 85 0d __ STA P0 
286b : ad d5 36 LDA $36d5 ; (vdc_state + 17)
286e : 85 0e __ STA P1 
2870 : 20 86 1f JSR $1f86 ; (vdc_mem_addr.s0 + 0)
2873 : a9 00 __ LDA #$00
2875 : 85 1b __ STA ACCU + 0 
2877 : 85 43 __ STA T1 + 0 
2879 : a9 d0 __ LDA #$d0
287b : 85 1c __ STA ACCU + 1 
287d : a9 fe __ LDA #$fe
287f : 85 44 __ STA T1 + 1 
.l2:
2881 : a2 08 __ LDX #$08
.l6:
2883 : a9 01 __ LDA #$01
2885 : 8d 00 ff STA $ff00 
2888 : a0 00 __ LDY #$00
288a : b1 1b __ LDA (ACCU + 0),y 
288c : a0 0e __ LDY #$0e
288e : 8c 00 ff STY $ff00 
2891 : a8 __ __ TAY
2892 : e6 1b __ INC ACCU + 0 
2894 : d0 02 __ BNE $2898 ; (vdc_restore_charsets.l106 + 0)
.s1007:
2896 : e6 1c __ INC ACCU + 1 
.l106:
2898 : 2c 00 d6 BIT $d600 
289b : 10 fb __ BPL $2898 ; (vdc_restore_charsets.l106 + 0)
.s11:
289d : 8c 01 d6 STY $d601 
28a0 : ca __ __ DEX
28a1 : d0 e0 __ BNE $2883 ; (vdc_restore_charsets.l6 + 0)
.s8:
28a3 : a2 08 __ LDX #$08
.l13:
28a5 : 2c 00 d6 BIT $d600 
28a8 : 10 fb __ BPL $28a5 ; (vdc_restore_charsets.l13 + 0)
.s18:
28aa : a9 00 __ LDA #$00
28ac : 8d 01 d6 STA $d601 
28af : ca __ __ DEX
28b0 : d0 f3 __ BNE $28a5 ; (vdc_restore_charsets.l13 + 0)
.s3:
28b2 : e6 43 __ INC T1 + 0 
28b4 : d0 cb __ BNE $2881 ; (vdc_restore_charsets.l2 + 0)
.s1006:
28b6 : e6 44 __ INC T1 + 1 
28b8 : d0 c7 __ BNE $2881 ; (vdc_restore_charsets.l2 + 0)
.s1001:
28ba : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
28bb : ad c4 36 LDA $36c4 ; (vdc_state + 0)
28be : c9 10 __ CMP #$10
28c0 : f0 4d __ BEQ $290f ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
28c2 : ad c5 36 LDA $36c5 ; (vdc_state + 1)
28c5 : d0 48 __ BNE $290f ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
28c7 : a9 22 __ LDA #$22
28c9 : 8d 00 d6 STA $d600 
.l120:
28cc : 2c 00 d6 BIT $d600 
28cf : 10 fb __ BPL $28cc ; (vdc_set_extended_memsize.l120 + 0)
.s11:
28d1 : a9 80 __ LDA #$80
28d3 : 8d 01 d6 STA $d601 
28d6 : 20 10 29 JSR $2910 ; (vdc_wipe_mem.s0 + 0)
28d9 : a9 1c __ LDA #$1c
28db : 8d 00 d6 STA $d600 
.l122:
28de : 2c 00 d6 BIT $d600 
28e1 : 10 fb __ BPL $28de ; (vdc_set_extended_memsize.l122 + 0)
.s17:
28e3 : ad 01 d6 LDA $d601 
28e6 : 09 10 __ ORA #$10
28e8 : a2 1c __ LDX #$1c
28ea : 8e 00 d6 STX $d600 
.l124:
28ed : 2c 00 d6 BIT $d600 
28f0 : 10 fb __ BPL $28ed ; (vdc_set_extended_memsize.l124 + 0)
.s23:
28f2 : 8d 01 d6 STA $d601 
28f5 : 20 66 28 JSR $2866 ; (vdc_restore_charsets.s0 + 0)
28f8 : 20 c4 1e JSR $1ec4 ; (vdc_cls.s0 + 0)
28fb : a9 22 __ LDA #$22
28fd : 8d 00 d6 STA $d600 
.l126:
2900 : 2c 00 d6 BIT $d600 
2903 : 10 fb __ BPL $2900 ; (vdc_set_extended_memsize.l126 + 0)
.s29:
2905 : a9 7d __ LDA #$7d
2907 : 8d 01 d6 STA $d601 
290a : a9 01 __ LDA #$01
290c : 8d c5 36 STA $36c5 ; (vdc_state + 1)
.s1001:
290f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
2910 : a9 00 __ LDA #$00
2912 : 85 44 __ STA T0 + 1 
2914 : 85 0d __ STA P0 
2916 : a9 ff __ LDA #$ff
2918 : 85 45 __ STA T1 + 0 
.l2:
291a : 20 a7 36 JSR $36a7 ; (vdc_mem_addr@proxy + 0)
.l252:
291d : 2c 00 d6 BIT $d600 
2920 : 10 fb __ BPL $291d ; (vdc_wipe_mem.l252 + 0)
.s8:
2922 : a9 00 __ LDA #$00
2924 : 8d 01 d6 STA $d601 
2927 : a9 18 __ LDA #$18
2929 : 8d 00 d6 STA $d600 
.l254:
292c : 2c 00 d6 BIT $d600 
292f : 10 fb __ BPL $292c ; (vdc_wipe_mem.l254 + 0)
.s14:
2931 : ad 01 d6 LDA $d601 
2934 : 29 7f __ AND #$7f
2936 : a2 18 __ LDX #$18
2938 : 8e 00 d6 STX $d600 
.l256:
293b : 2c 00 d6 BIT $d600 
293e : 10 fb __ BPL $293b ; (vdc_wipe_mem.l256 + 0)
.s20:
2940 : 8d 01 d6 STA $d601 
2943 : a9 1e __ LDA #$1e
2945 : 8d 00 d6 STA $d600 
.l258:
2948 : 2c 00 d6 BIT $d600 
294b : 10 fb __ BPL $2948 ; (vdc_wipe_mem.l258 + 0)
.s25:
294d : e6 44 __ INC T0 + 1 
294f : a9 ff __ LDA #$ff
2951 : 8d 01 d6 STA $d601 
2954 : c6 45 __ DEC T1 + 0 
2956 : d0 c2 __ BNE $291a ; (vdc_wipe_mem.l2 + 0)
.s4:
2958 : 20 a7 36 JSR $36a7 ; (vdc_mem_addr@proxy + 0)
.l261:
295b : 2c 00 d6 BIT $d600 
295e : 10 fb __ BPL $295b ; (vdc_wipe_mem.l261 + 0)
.s29:
2960 : a9 00 __ LDA #$00
2962 : 8d 01 d6 STA $d601 
2965 : a9 18 __ LDA #$18
2967 : 8d 00 d6 STA $d600 
.l263:
296a : 2c 00 d6 BIT $d600 
296d : 10 fb __ BPL $296a ; (vdc_wipe_mem.l263 + 0)
.s35:
296f : ad 01 d6 LDA $d601 
2972 : 29 7f __ AND #$7f
2974 : a2 18 __ LDX #$18
2976 : 8e 00 d6 STX $d600 
.l265:
2979 : 2c 00 d6 BIT $d600 
297c : 10 fb __ BPL $2979 ; (vdc_wipe_mem.l265 + 0)
.s41:
297e : 8d 01 d6 STA $d601 
2981 : a9 1e __ LDA #$1e
2983 : 8d 00 d6 STA $d600 
.l267:
2986 : 2c 00 d6 BIT $d600 
2989 : 10 fb __ BPL $2986 ; (vdc_wipe_mem.l267 + 0)
.s46:
298b : a9 ff __ LDA #$ff
298d : 8d 01 d6 STA $d601 
.s1001:
2990 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_redef_charset: ; vdc_redef_charset(u16,u8*,u16)->void
.s0:
2991 : 20 7e 1f JSR $1f7e ; (vdc_mem_addr@proxy + 0)
2994 : a0 00 __ LDY #$00
2996 : 84 1b __ STY ACCU + 0 
.l2:
2998 : a2 08 __ LDX #$08
.l5:
299a : b1 11 __ LDA (P4),y ; (sp + 0)
299c : e6 11 __ INC P4 ; (sp + 0)
299e : d0 02 __ BNE $29a2 ; (vdc_redef_charset.l105 + 0)
.s1006:
29a0 : e6 12 __ INC P5 ; (sp + 1)
.l105:
29a2 : 2c 00 d6 BIT $d600 
29a5 : 10 fb __ BPL $29a2 ; (vdc_redef_charset.l105 + 0)
.s10:
29a7 : 8d 01 d6 STA $d601 
29aa : ca __ __ DEX
29ab : d0 ed __ BNE $299a ; (vdc_redef_charset.l5 + 0)
.s7:
29ad : a2 08 __ LDX #$08
.l12:
29af : 2c 00 d6 BIT $d600 
29b2 : 10 fb __ BPL $29af ; (vdc_redef_charset.l12 + 0)
.s17:
29b4 : a9 00 __ LDA #$00
29b6 : 8d 01 d6 STA $d601 
29b9 : ca __ __ DEX
29ba : d0 f3 __ BNE $29af ; (vdc_redef_charset.l12 + 0)
.s14:
29bc : c6 1b __ DEC ACCU + 0 
29be : d0 d8 __ BNE $2998 ; (vdc_redef_charset.l2 + 0)
.s1001:
29c0 : 60 __ __ RTS
--------------------------------------------------------------------
show_fs_scroll: ; show_fs_scroll()->void
.s1000:
29c1 : a2 06 __ LDX #$06
29c3 : b5 53 __ LDA T2 + 0,x 
29c5 : 9d e0 3f STA $3fe0,x ; (buff + 36)
29c8 : ca __ __ DEX
29c9 : 10 f8 __ BPL $29c3 ; (show_fs_scroll.s1000 + 2)
.s0:
29cb : ad e5 36 LDA $36e5 ; (view + 8)
29ce : 8d ec 3f STA $3fec ; (buff + 48)
29d1 : ad e3 36 LDA $36e3 ; (view + 6)
29d4 : 8d eb 3f STA $3feb ; (buff + 47)
29d7 : ad dd 36 LDA $36dd ; (view + 0)
29da : 8d e9 3f STA $3fe9 ; (buff + 45)
29dd : ad de 36 LDA $36de ; (view + 1)
29e0 : 8d ea 3f STA $3fea ; (buff + 46)
29e3 : a9 e9 __ LDA #$e9
29e5 : 85 15 __ STA P8 
29e7 : a9 3f __ LDA #$3f
29e9 : 85 16 __ STA P9 
29eb : ad c6 36 LDA $36c6 ; (vdc_state + 2)
29ee : 85 17 __ STA P10 
29f0 : ad c7 36 LDA $36c7 ; (vdc_state + 3)
29f3 : 85 53 __ STA T2 + 0 
29f5 : ad c8 36 LDA $36c8 ; (vdc_state + 4)
29f8 : 85 54 __ STA T2 + 1 
29fa : ad c9 36 LDA $36c9 ; (vdc_state + 5)
29fd : 85 56 __ STA T4 + 0 
29ff : ad ca 36 LDA $36ca ; (vdc_state + 6)
2a02 : 85 57 __ STA T4 + 1 
2a04 : 20 d3 2c JSR $2cd3 ; (vdc_fs_softscroll_init.s1000 + 0)
2a07 : a5 1b __ LDA ACCU + 0 
2a09 : d0 0b __ BNE $2a16 ; (show_fs_scroll.s132 + 0)
.s1001:
2a0b : a2 06 __ LDX #$06
2a0d : bd e0 3f LDA $3fe0,x ; (buff + 36)
2a10 : 95 53 __ STA T2 + 0,x 
2a12 : ca __ __ DEX
2a13 : 10 f8 __ BPL $2a0d ; (show_fs_scroll.s1001 + 2)
2a15 : 60 __ __ RTS
.s132:
2a16 : a5 57 __ LDA T4 + 1 
2a18 : cd e6 36 CMP $36e6 ; (view + 9)
2a1b : d0 05 __ BNE $2a22 ; (show_fs_scroll.s1053 + 0)
.s1052:
2a1d : a5 56 __ LDA T4 + 0 
2a1f : cd e5 36 CMP $36e5 ; (view + 8)
.s1053:
2a22 : a9 00 __ LDA #$00
2a24 : 2a __ __ ROL
2a25 : 49 01 __ EOR #$01
2a27 : 85 51 __ STA T0 + 0 
2a29 : a5 54 __ LDA T2 + 1 
2a2b : cd e4 36 CMP $36e4 ; (view + 7)
2a2e : d0 05 __ BNE $2a35 ; (show_fs_scroll.s1051 + 0)
.s1050:
2a30 : a5 53 __ LDA T2 + 0 
2a32 : cd e3 36 CMP $36e3 ; (view + 6)
.s1051:
2a35 : a9 00 __ LDA #$00
2a37 : 2a __ __ ROL
2a38 : 49 01 __ EOR #$01
2a3a : 85 52 __ STA T1 + 0 
2a3c : a6 56 __ LDX T4 + 0 
2a3e : ca __ __ DEX
2a3f : 86 53 __ STX T2 + 0 
2a41 : a9 01 __ LDA #$01
2a43 : 85 55 __ STA T3 + 0 
.l5:
2a45 : 20 a5 2e JSR $2ea5 ; (vdcwin_checkch.s0 + 0)
2a48 : a5 1b __ LDA ACCU + 0 
2a4a : 05 1c __ ORA ACCU + 1 
2a4c : d0 f7 __ BNE $2a45 ; (show_fs_scroll.l5 + 0)
.l8:
2a4e : ad c9 36 LDA $36c9 ; (vdc_state + 5)
2a51 : 85 58 __ STA T7 + 0 
2a53 : ad ca 36 LDA $36ca ; (vdc_state + 6)
2a56 : 85 59 __ STA T7 + 1 
2a58 : ad ec 3f LDA $3fec ; (buff + 48)
2a5b : 38 __ __ SEC
2a5c : e5 58 __ SBC T7 + 0 
2a5e : aa __ __ TAX
2a5f : a9 00 __ LDA #$00
2a61 : e5 59 __ SBC T7 + 1 
2a63 : a8 __ __ TAY
2a64 : 8a __ __ TXA
2a65 : 38 __ __ SEC
2a66 : e9 02 __ SBC #$02
2a68 : 85 46 __ STA T8 + 0 
2a6a : 98 __ __ TYA
2a6b : e9 00 __ SBC #$00
2a6d : d0 09 __ BNE $2a78 ; (show_fs_scroll.s12 + 0)
.s1048:
2a6f : a5 46 __ LDA T8 + 0 
2a71 : c5 53 __ CMP T2 + 0 
2a73 : b0 03 __ BCS $2a78 ; (show_fs_scroll.s12 + 0)
.s10:
2a75 : ca __ __ DEX
2a76 : 86 53 __ STX T2 + 0 
.s12:
2a78 : a5 55 __ LDA T3 + 0 
2a7a : c9 01 __ CMP #$01
2a7c : d0 2a __ BNE $2aa8 ; (show_fs_scroll.s15 + 0)
.s13:
2a7e : a5 52 __ LDA T1 + 0 
2a80 : f0 20 __ BEQ $2aa2 ; (show_fs_scroll.s17 + 0)
.s16:
2a82 : 20 af 2e JSR $2eaf ; (vdc_fs_softscroll_right@proxy + 0)
2a85 : ad eb 3f LDA $3feb ; (buff + 47)
2a88 : 38 __ __ SEC
2a89 : ed c7 36 SBC $36c7 ; (vdc_state + 3)
2a8c : a8 __ __ TAY
2a8d : a9 00 __ LDA #$00
2a8f : ed c8 36 SBC $36c8 ; (vdc_state + 4)
2a92 : aa __ __ TAX
2a93 : 98 __ __ TYA
2a94 : 38 __ __ SEC
2a95 : e9 01 __ SBC #$01
2a97 : a8 __ __ TAY
2a98 : 8a __ __ TXA
2a99 : e9 00 __ SBC #$00
2a9b : d0 0b __ BNE $2aa8 ; (show_fs_scroll.s15 + 0)
.s1044:
2a9d : cc f3 3f CPY $3ff3 ; (softscroll + 10)
2aa0 : d0 06 __ BNE $2aa8 ; (show_fs_scroll.s15 + 0)
.s17:
2aa2 : a9 02 __ LDA #$02
2aa4 : 85 55 __ STA T3 + 0 
2aa6 : d0 06 __ BNE $2aae ; (show_fs_scroll.s22 + 0)
.s15:
2aa8 : a5 55 __ LDA T3 + 0 
2aaa : c9 02 __ CMP #$02
2aac : d0 16 __ BNE $2ac4 ; (show_fs_scroll.s24 + 0)
.s22:
2aae : a5 51 __ LDA T0 + 0 
2ab0 : d0 03 __ BNE $2ab5 ; (show_fs_scroll.s25 + 0)
2ab2 : 4c af 2c JMP $2caf ; (show_fs_scroll.s266 + 0)
.s25:
2ab5 : 20 a0 2f JSR $2fa0 ; (vdc_fs_softscroll_down@proxy + 0)
2ab8 : a5 53 __ LDA T2 + 0 
2aba : cd f4 3f CMP $3ff4 ; (softscroll + 11)
2abd : d0 03 __ BNE $2ac2 ; (show_fs_scroll.s1059 + 0)
2abf : 4c 8b 2c JMP $2c8b ; (show_fs_scroll.s28 + 0)
.s1059:
2ac2 : a5 55 __ LDA T3 + 0 
.s24:
2ac4 : c9 03 __ CMP #$03
2ac6 : d0 12 __ BNE $2ada ; (show_fs_scroll.s39 + 0)
.s37:
2ac8 : a5 52 __ LDA T1 + 0 
2aca : f0 08 __ BEQ $2ad4 ; (show_fs_scroll.s41 + 0)
.s40:
2acc : 20 82 30 JSR $3082 ; (vdc_fs_softscroll_left@proxy + 0)
2acf : ad f3 3f LDA $3ff3 ; (softscroll + 10)
2ad2 : d0 06 __ BNE $2ada ; (show_fs_scroll.s39 + 0)
.s41:
2ad4 : a9 04 __ LDA #$04
2ad6 : 85 55 __ STA T3 + 0 
2ad8 : d0 06 __ BNE $2ae0 ; (show_fs_scroll.s46 + 0)
.s39:
2ada : a5 55 __ LDA T3 + 0 
2adc : c9 04 __ CMP #$04
2ade : d0 19 __ BNE $2af9 ; (show_fs_scroll.s48 + 0)
.s46:
2ae0 : a5 51 __ LDA T0 + 0 
2ae2 : d0 06 __ BNE $2aea ; (show_fs_scroll.s49 + 0)
.s50:
2ae4 : a9 05 __ LDA #$05
2ae6 : 85 55 __ STA T3 + 0 
2ae8 : d0 13 __ BNE $2afd ; (show_fs_scroll.s61 + 0)
.s49:
2aea : 20 a0 2f JSR $2fa0 ; (vdc_fs_softscroll_down@proxy + 0)
2aed : a5 53 __ LDA T2 + 0 
2aef : cd f4 3f CMP $3ff4 ; (softscroll + 11)
2af2 : d0 03 __ BNE $2af7 ; (show_fs_scroll.s1058 + 0)
2af4 : 4c 45 2c JMP $2c45 ; (show_fs_scroll.s52 + 0)
.s1058:
2af7 : a5 55 __ LDA T3 + 0 
.s48:
2af9 : c9 05 __ CMP #$05
2afb : d0 2a __ BNE $2b27 ; (show_fs_scroll.s63 + 0)
.s61:
2afd : a5 52 __ LDA T1 + 0 
2aff : f0 20 __ BEQ $2b21 ; (show_fs_scroll.s65 + 0)
.s64:
2b01 : 20 af 2e JSR $2eaf ; (vdc_fs_softscroll_right@proxy + 0)
2b04 : ad eb 3f LDA $3feb ; (buff + 47)
2b07 : 38 __ __ SEC
2b08 : ed c7 36 SBC $36c7 ; (vdc_state + 3)
2b0b : a8 __ __ TAY
2b0c : a9 00 __ LDA #$00
2b0e : ed c8 36 SBC $36c8 ; (vdc_state + 4)
2b11 : aa __ __ TAX
2b12 : 98 __ __ TYA
2b13 : 38 __ __ SEC
2b14 : e9 01 __ SBC #$01
2b16 : a8 __ __ TAY
2b17 : 8a __ __ TXA
2b18 : e9 00 __ SBC #$00
2b1a : d0 0b __ BNE $2b27 ; (show_fs_scroll.s63 + 0)
.s1022:
2b1c : cc f3 3f CPY $3ff3 ; (softscroll + 10)
2b1f : d0 06 __ BNE $2b27 ; (show_fs_scroll.s63 + 0)
.s65:
2b21 : a9 06 __ LDA #$06
2b23 : 85 55 __ STA T3 + 0 
2b25 : d0 06 __ BNE $2b2d ; (show_fs_scroll.s70 + 0)
.s63:
2b27 : a5 55 __ LDA T3 + 0 
2b29 : c9 06 __ CMP #$06
2b2b : d0 19 __ BNE $2b46 ; (show_fs_scroll.s72 + 0)
.s70:
2b2d : a5 51 __ LDA T0 + 0 
2b2f : d0 06 __ BNE $2b37 ; (show_fs_scroll.s73 + 0)
.s74:
2b31 : a9 07 __ LDA #$07
2b33 : 85 55 __ STA T3 + 0 
2b35 : d0 13 __ BNE $2b4a ; (show_fs_scroll.s85 + 0)
.s73:
2b37 : 20 6b 31 JSR $316b ; (vdc_fs_softscroll_up@proxy + 0)
2b3a : a5 53 __ LDA T2 + 0 
2b3c : cd f4 3f CMP $3ff4 ; (softscroll + 11)
2b3f : d0 03 __ BNE $2b44 ; (show_fs_scroll.s1057 + 0)
2b41 : 4c 12 2c JMP $2c12 ; (show_fs_scroll.s76 + 0)
.s1057:
2b44 : a5 55 __ LDA T3 + 0 
.s72:
2b46 : c9 07 __ CMP #$07
2b48 : d0 14 __ BNE $2b5e ; (show_fs_scroll.s87 + 0)
.s85:
2b4a : a5 52 __ LDA T1 + 0 
2b4c : f0 08 __ BEQ $2b56 ; (show_fs_scroll.s89 + 0)
.s88:
2b4e : 20 82 30 JSR $3082 ; (vdc_fs_softscroll_left@proxy + 0)
2b51 : ad f3 3f LDA $3ff3 ; (softscroll + 10)
2b54 : d0 06 __ BNE $2b5c ; (show_fs_scroll.s1056 + 0)
.s89:
2b56 : a9 08 __ LDA #$08
2b58 : 85 55 __ STA T3 + 0 
2b5a : d0 09 __ BNE $2b65 ; (show_fs_scroll.s94 + 0)
.s1056:
2b5c : a5 55 __ LDA T3 + 0 
.s87:
2b5e : c9 08 __ CMP #$08
2b60 : f0 03 __ BEQ $2b65 ; (show_fs_scroll.s94 + 0)
2b62 : 4c f2 2b JMP $2bf2 ; (show_fs_scroll.s250 + 0)
.s94:
2b65 : a5 51 __ LDA T0 + 0 
2b67 : d0 03 __ BNE $2b6c ; (show_fs_scroll.s97 + 0)
2b69 : 4c 02 2c JMP $2c02 ; (show_fs_scroll.s260 + 0)
.s97:
2b6c : 20 6b 31 JSR $316b ; (vdc_fs_softscroll_up@proxy + 0)
2b6f : a5 53 __ LDA T2 + 0 
2b71 : cd f4 3f CMP $3ff4 ; (softscroll + 11)
2b74 : d0 7c __ BNE $2bf2 ; (show_fs_scroll.s250 + 0)
.s100:
2b76 : 09 00 __ ORA #$00
2b78 : d0 07 __ BNE $2b81 ; (show_fs_scroll.s104 + 0)
.s103:
2b7a : a5 58 __ LDA T7 + 0 
2b7c : 85 53 __ STA T2 + 0 
2b7e : 4c 02 2c JMP $2c02 ; (show_fs_scroll.s260 + 0)
.s104:
2b81 : a9 05 __ LDA #$05
2b83 : 85 55 __ STA T3 + 0 
2b85 : 38 __ __ SEC
2b86 : a5 58 __ LDA T7 + 0 
2b88 : e9 01 __ SBC #$01
2b8a : a8 __ __ TAY
2b8b : a5 59 __ LDA T7 + 1 
2b8d : e9 00 __ SBC #$00
2b8f : d0 0e __ BNE $2b9f ; (show_fs_scroll.s107 + 0)
.s1008:
2b91 : c4 53 __ CPY T2 + 0 
2b93 : b0 0a __ BCS $2b9f ; (show_fs_scroll.s107 + 0)
.s106:
2b95 : 38 __ __ SEC
2b96 : a5 53 __ LDA T2 + 0 
2b98 : e5 58 __ SBC T7 + 0 
2b9a : 85 53 __ STA T2 + 0 
2b9c : 4c f2 2b JMP $2bf2 ; (show_fs_scroll.s250 + 0)
.s107:
2b9f : 20 a5 2e JSR $2ea5 ; (vdcwin_checkch.s0 + 0)
2ba2 : a5 1b __ LDA ACCU + 0 
2ba4 : 05 1c __ ORA ACCU + 1 
2ba6 : d0 05 __ BNE $2bad ; (show_fs_scroll.s9 + 0)
.s198:
2ba8 : 85 53 __ STA T2 + 0 
2baa : 4c 4e 2a JMP $2a4e ; (show_fs_scroll.l8 + 0)
.s9:
2bad : ad c6 36 LDA $36c6 ; (vdc_state + 2)
2bb0 : 85 55 __ STA T3 + 0 
2bb2 : 20 c4 1e JSR $1ec4 ; (vdc_cls.s0 + 0)
2bb5 : a9 1b __ LDA #$1b
2bb7 : 8d 00 d6 STA $d600 
.l251:
2bba : 2c 00 d6 BIT $d600 
2bbd : 10 fb __ BPL $2bba ; (show_fs_scroll.l251 + 0)
.s117:
2bbf : a9 00 __ LDA #$00
2bc1 : 8d 01 d6 STA $d601 
2bc4 : a9 18 __ LDA #$18
2bc6 : 8d 00 d6 STA $d600 
2bc9 : ac f1 3f LDY $3ff1 ; (softscroll + 8)
.l253:
2bcc : 2c 00 d6 BIT $d600 
2bcf : 10 fb __ BPL $2bcc ; (show_fs_scroll.l253 + 0)
.s122:
2bd1 : 8c 01 d6 STY $d601 
2bd4 : a9 19 __ LDA #$19
2bd6 : 8d 00 d6 STA $d600 
2bd9 : ad f5 3f LDA $3ff5 ; (softscroll + 12)
2bdc : 18 __ __ CLC
2bdd : 6d f2 3f ADC $3ff2 ; (softscroll + 9)
.l255:
2be0 : 2c 00 d6 BIT $d600 
2be3 : 10 fb __ BPL $2be0 ; (show_fs_scroll.l255 + 0)
.s127:
2be5 : 8d 01 d6 STA $d601 
2be8 : a5 55 __ LDA T3 + 0 
2bea : 85 0f __ STA P2 
2bec : 20 96 26 JSR $2696 ; (vdc_set_mode.s0 + 0)
2bef : 4c 0b 2a JMP $2a0b ; (show_fs_scroll.s1001 + 0)
.s250:
2bf2 : 20 a5 2e JSR $2ea5 ; (vdcwin_checkch.s0 + 0)
2bf5 : a5 1b __ LDA ACCU + 0 
2bf7 : 05 1c __ ORA ACCU + 1 
2bf9 : d0 b2 __ BNE $2bad ; (show_fs_scroll.s9 + 0)
.s111:
2bfb : a5 55 __ LDA T3 + 0 
2bfd : f0 ae __ BEQ $2bad ; (show_fs_scroll.s9 + 0)
2bff : 4c 4e 2a JMP $2a4e ; (show_fs_scroll.l8 + 0)
.s260:
2c02 : 20 a5 2e JSR $2ea5 ; (vdcwin_checkch.s0 + 0)
2c05 : a5 1b __ LDA ACCU + 0 
2c07 : 05 1c __ ORA ACCU + 1 
2c09 : d0 a2 __ BNE $2bad ; (show_fs_scroll.s9 + 0)
.s197:
2c0b : a9 01 __ LDA #$01
2c0d : 85 55 __ STA T3 + 0 
2c0f : 4c 4e 2a JMP $2a4e ; (show_fs_scroll.l8 + 0)
.s76:
2c12 : 09 00 __ ORA #$00
2c14 : d0 08 __ BNE $2c1e ; (show_fs_scroll.s80 + 0)
.s79:
2c16 : a5 58 __ LDA T7 + 0 
2c18 : 85 53 __ STA T2 + 0 
2c1a : a9 03 __ LDA #$03
2c1c : d0 22 __ BNE $2c40 ; (show_fs_scroll.s1054 + 0)
.s80:
2c1e : a9 07 __ LDA #$07
2c20 : 85 55 __ STA T3 + 0 
2c22 : 38 __ __ SEC
2c23 : a5 58 __ LDA T7 + 0 
2c25 : e9 01 __ SBC #$01
2c27 : a8 __ __ TAY
2c28 : a5 59 __ LDA T7 + 1 
2c2a : e9 00 __ SBC #$00
2c2c : d0 04 __ BNE $2c32 ; (show_fs_scroll.s83 + 0)
.s1016:
2c2e : c4 53 __ CPY T2 + 0 
2c30 : 90 04 __ BCC $2c36 ; (show_fs_scroll.s82 + 0)
.s83:
2c32 : a9 00 __ LDA #$00
2c34 : f0 05 __ BEQ $2c3b ; (show_fs_scroll.s1061 + 0)
.s82:
2c36 : 38 __ __ SEC
2c37 : a5 53 __ LDA T2 + 0 
2c39 : e5 58 __ SBC T7 + 0 
.s1061:
2c3b : 85 53 __ STA T2 + 0 
2c3d : 4c 4a 2b JMP $2b4a ; (show_fs_scroll.s85 + 0)
.s1054:
2c40 : 85 55 __ STA T3 + 0 
2c42 : 4c f2 2b JMP $2bf2 ; (show_fs_scroll.s250 + 0)
.s52:
2c45 : ad ec 3f LDA $3fec ; (buff + 48)
2c48 : 38 __ __ SEC
2c49 : e5 58 __ SBC T7 + 0 
2c4b : aa __ __ TAX
2c4c : a9 00 __ LDA #$00
2c4e : ed ca 36 SBC $36ca ; (vdc_state + 6)
2c51 : a8 __ __ TAY
2c52 : 8a __ __ TXA
2c53 : 38 __ __ SEC
2c54 : e9 01 __ SBC #$01
2c56 : 85 44 __ STA T6 + 0 
2c58 : 98 __ __ TYA
2c59 : e9 00 __ SBC #$00
2c5b : d0 06 __ BNE $2c63 ; (show_fs_scroll.s56 + 0)
.s1028:
2c5d : a5 53 __ LDA T2 + 0 
2c5f : c5 44 __ CMP T6 + 0 
2c61 : f0 0b __ BEQ $2c6e ; (show_fs_scroll.s55 + 0)
.s56:
2c63 : 18 __ __ CLC
2c64 : a5 53 __ LDA T2 + 0 
2c66 : 65 58 __ ADC T7 + 0 
2c68 : 85 53 __ STA T2 + 0 
2c6a : a9 01 __ LDA #$01
2c6c : d0 d2 __ BNE $2c40 ; (show_fs_scroll.s1054 + 0)
.s55:
2c6e : a9 05 __ LDA #$05
2c70 : 85 55 __ STA T3 + 0 
2c72 : a5 59 __ LDA T7 + 1 
2c74 : d0 07 __ BNE $2c7d ; (show_fs_scroll.s59 + 0)
.s1026:
2c76 : a5 58 __ LDA T7 + 0 
2c78 : cd f4 3f CMP $3ff4 ; (softscroll + 11)
2c7b : 90 04 __ BCC $2c81 ; (show_fs_scroll.s58 + 0)
.s59:
2c7d : a9 00 __ LDA #$00
2c7f : f0 05 __ BEQ $2c86 ; (show_fs_scroll.s1060 + 0)
.s58:
2c81 : 38 __ __ SEC
2c82 : a5 53 __ LDA T2 + 0 
2c84 : e5 58 __ SBC T7 + 0 
.s1060:
2c86 : 85 53 __ STA T2 + 0 
2c88 : 4c fd 2a JMP $2afd ; (show_fs_scroll.s61 + 0)
.s28:
2c8b : ad ec 3f LDA $3fec ; (buff + 48)
2c8e : 38 __ __ SEC
2c8f : e5 58 __ SBC T7 + 0 
2c91 : aa __ __ TAX
2c92 : a9 00 __ LDA #$00
2c94 : e5 59 __ SBC T7 + 1 
2c96 : a8 __ __ TAY
2c97 : 8a __ __ TXA
2c98 : 38 __ __ SEC
2c99 : e9 01 __ SBC #$01
2c9b : 85 44 __ STA T6 + 0 
2c9d : 98 __ __ TYA
2c9e : e9 00 __ SBC #$00
2ca0 : d0 06 __ BNE $2ca8 ; (show_fs_scroll.s32 + 0)
.s1038:
2ca2 : a5 53 __ LDA T2 + 0 
2ca4 : c5 44 __ CMP T6 + 0 
2ca6 : f0 0e __ BEQ $2cb6 ; (show_fs_scroll.s31 + 0)
.s32:
2ca8 : 18 __ __ CLC
2ca9 : a5 53 __ LDA T2 + 0 
2cab : 65 58 __ ADC T7 + 0 
2cad : 85 53 __ STA T2 + 0 
.s266:
2caf : a9 03 __ LDA #$03
2cb1 : 85 55 __ STA T3 + 0 
2cb3 : 4c c8 2a JMP $2ac8 ; (show_fs_scroll.s37 + 0)
.s31:
2cb6 : a9 07 __ LDA #$07
2cb8 : 85 55 __ STA T3 + 0 
2cba : a5 59 __ LDA T7 + 1 
2cbc : d0 07 __ BNE $2cc5 ; (show_fs_scroll.s35 + 0)
.s1036:
2cbe : a5 58 __ LDA T7 + 0 
2cc0 : cd f4 3f CMP $3ff4 ; (softscroll + 11)
2cc3 : 90 04 __ BCC $2cc9 ; (show_fs_scroll.s34 + 0)
.s35:
2cc5 : a9 00 __ LDA #$00
2cc7 : f0 05 __ BEQ $2cce ; (show_fs_scroll.s1055 + 0)
.s34:
2cc9 : 38 __ __ SEC
2cca : a5 53 __ LDA T2 + 0 
2ccc : e5 58 __ SBC T7 + 0 
.s1055:
2cce : 85 53 __ STA T2 + 0 
2cd0 : 4c da 2a JMP $2ada ; (show_fs_scroll.s39 + 0)
--------------------------------------------------------------------
vdc_fs_softscroll_init: ; vdc_fs_softscroll_init(struct VDCSoftScrollSettings*,u8)->u8
.s1000:
2cd3 : a2 05 __ LDX #$05
2cd5 : b5 53 __ LDA T2 + 0,x 
2cd7 : 9d f6 3f STA $3ff6,x ; (canvas + 12)
2cda : ca __ __ DEX
2cdb : 10 f8 __ BPL $2cd5 ; (vdc_fs_softscroll_init.s1000 + 2)
.s0:
2cdd : a0 03 __ LDY #$03
2cdf : b1 15 __ LDA (P8),y ; (settings + 0)
2ce1 : 85 1b __ STA ACCU + 0 
2ce3 : a9 00 __ LDA #$00
2ce5 : 85 1c __ STA ACCU + 1 
2ce7 : 88 __ __ DEY
2ce8 : b1 15 __ LDA (P8),y ; (settings + 0)
2cea : 85 53 __ STA T2 + 0 
2cec : 20 dd 34 JSR $34dd ; (mul16by8 + 0)
2cef : a5 05 __ LDA WORK + 2 
2cf1 : 85 55 __ STA T3 + 0 
2cf3 : 0a __ __ ASL
2cf4 : aa __ __ TAX
2cf5 : a5 06 __ LDA WORK + 3 
2cf7 : 85 56 __ STA T3 + 1 
2cf9 : 2a __ __ ROL
2cfa : a8 __ __ TAY
2cfb : 8a __ __ TXA
2cfc : 18 __ __ CLC
2cfd : 69 30 __ ADC #$30
2cff : 85 57 __ STA T4 + 0 
2d01 : 90 01 __ BCC $2d04 ; (vdc_fs_softscroll_init.s1027 + 0)
.s1026:
2d03 : c8 __ __ INY
.s1027:
2d04 : 84 58 __ STY T4 + 1 
2d06 : a9 20 __ LDA #$20
2d08 : c5 58 __ CMP T4 + 1 
2d0a : d0 04 __ BNE $2d10 ; (vdc_fs_softscroll_init.s1025 + 0)
.s1024:
2d0c : a9 00 __ LDA #$00
2d0e : c5 57 __ CMP T4 + 0 
.s1025:
2d10 : b0 08 __ BCS $2d1a ; (vdc_fs_softscroll_init.s4 + 0)
.s5:
2d12 : ad c5 36 LDA $36c5 ; (vdc_state + 1)
2d15 : d0 03 __ BNE $2d1a ; (vdc_fs_softscroll_init.s4 + 0)
2d17 : 4c 76 2e JMP $2e76 ; (vdc_fs_softscroll_init.s1 + 0)
.s4:
2d1a : a9 e0 __ LDA #$e0
2d1c : c5 58 __ CMP T4 + 1 
2d1e : d0 04 __ BNE $2d24 ; (vdc_fs_softscroll_init.s1023 + 0)
.s1022:
2d20 : a9 00 __ LDA #$00
2d22 : c5 57 __ CMP T4 + 0 
.s1023:
2d24 : b0 03 __ BCS $2d29 ; (vdc_fs_softscroll_init.s3 + 0)
2d26 : 4c 76 2e JMP $2e76 ; (vdc_fs_softscroll_init.s1 + 0)
.s3:
2d29 : a5 17 __ LDA P10 ; (mode + 0)
2d2b : 85 0f __ STA P2 
2d2d : 20 96 26 JSR $2696 ; (vdc_set_mode.s0 + 0)
2d30 : a9 00 __ LDA #$00
2d32 : 8d cc 36 STA $36cc ; (vdc_state + 8)
2d35 : 8d d4 36 STA $36d4 ; (vdc_state + 16)
2d38 : 8d d5 36 STA $36d5 ; (vdc_state + 17)
2d3b : 8d d6 36 STA $36d6 ; (vdc_state + 18)
2d3e : a9 20 __ LDA #$20
2d40 : 8d cd 36 STA $36cd ; (vdc_state + 9)
2d43 : a9 10 __ LDA #$10
2d45 : 8d d7 36 STA $36d7 ; (vdc_state + 19)
2d48 : a5 55 __ LDA T3 + 0 
2d4a : 8d ce 36 STA $36ce ; (vdc_state + 10)
2d4d : 18 __ __ CLC
2d4e : a5 56 __ LDA T3 + 1 
2d50 : 69 20 __ ADC #$20
2d52 : 85 58 __ STA T4 + 1 
2d54 : 8d cf 36 STA $36cf ; (vdc_state + 11)
2d57 : 38 __ __ SEC
2d58 : a5 53 __ LDA T2 + 0 
2d5a : ed c7 36 SBC $36c7 ; (vdc_state + 3)
2d5d : 85 53 __ STA T2 + 0 
2d5f : 8d dc 36 STA $36dc ; (vdc_state + 24)
2d62 : 20 0b 28 JSR $280b ; (vdc_set_multab.s0 + 0)
2d65 : 20 c4 1e JSR $1ec4 ; (vdc_cls.s0 + 0)
2d68 : a9 1c __ LDA #$1c
2d6a : 8d 00 d6 STA $d600 
.l290:
2d6d : 2c 00 d6 BIT $d600 
2d70 : 10 fb __ BPL $2d6d ; (vdc_fs_softscroll_init.l290 + 0)
.s13:
2d72 : ad 01 d6 LDA $d601 
2d75 : 29 10 __ AND #$10
2d77 : a2 1c __ LDX #$1c
2d79 : 8e 00 d6 STX $d600 
.l292:
2d7c : 2c 00 d6 BIT $d600 
2d7f : 10 fb __ BPL $2d7c ; (vdc_fs_softscroll_init.l292 + 0)
.s19:
2d81 : 8d 01 d6 STA $d601 
2d84 : 20 66 28 JSR $2866 ; (vdc_restore_charsets.s0 + 0)
2d87 : a9 0c __ LDA #$0c
2d89 : 8d 00 d6 STA $d600 
.l294:
2d8c : 2c 00 d6 BIT $d600 
2d8f : 10 fb __ BPL $2d8c ; (vdc_fs_softscroll_init.l294 + 0)
.s25:
2d91 : a9 20 __ LDA #$20
2d93 : 8d 01 d6 STA $d601 
2d96 : a9 0d __ LDA #$0d
2d98 : 8d 00 d6 STA $d600 
.l296:
2d9b : 2c 00 d6 BIT $d600 
2d9e : 10 fb __ BPL $2d9b ; (vdc_fs_softscroll_init.l296 + 0)
.s30:
2da0 : a9 00 __ LDA #$00
2da2 : 8d 01 d6 STA $d601 
2da5 : a9 14 __ LDA #$14
2da7 : 8d 00 d6 STA $d600 
.l298:
2daa : 2c 00 d6 BIT $d600 
2dad : 10 fb __ BPL $2daa ; (vdc_fs_softscroll_init.l298 + 0)
.s35:
2daf : a5 58 __ LDA T4 + 1 
2db1 : 8d 01 d6 STA $d601 
2db4 : a9 15 __ LDA #$15
2db6 : 8d 00 d6 STA $d600 
.l300:
2db9 : 2c 00 d6 BIT $d600 
2dbc : 10 fb __ BPL $2db9 ; (vdc_fs_softscroll_init.l300 + 0)
.s40:
2dbe : a5 55 __ LDA T3 + 0 
2dc0 : 8d 01 d6 STA $d601 
2dc3 : a9 1b __ LDA #$1b
2dc5 : 8d 00 d6 STA $d600 
.l302:
2dc8 : 2c 00 d6 BIT $d600 
2dcb : 10 fb __ BPL $2dc8 ; (vdc_fs_softscroll_init.l302 + 0)
.s45:
2dcd : a5 53 __ LDA T2 + 0 
2dcf : 8d 01 d6 STA $d601 
2dd2 : a9 20 __ LDA #$20
2dd4 : 85 10 __ STA P3 
2dd6 : a5 55 __ LDA T3 + 0 
2dd8 : 85 13 __ STA P6 
2dda : a5 56 __ LDA T3 + 1 
2ddc : 85 14 __ STA P7 
2dde : a0 00 __ LDY #$00
2de0 : 84 0f __ STY P2 
2de2 : b1 15 __ LDA (P8),y ; (settings + 0)
2de4 : 85 53 __ STA T2 + 0 
2de6 : 85 11 __ STA P4 
2de8 : c8 __ __ INY
2de9 : b1 15 __ LDA (P8),y ; (settings + 0)
2deb : 85 54 __ STA T2 + 1 
2ded : 85 12 __ STA P5 
2def : 20 7e 2e JSR $2e7e ; (vdc_cpytovdc.s0 + 0)
2df2 : a5 13 __ LDA P6 
2df4 : 85 0f __ STA P2 
2df6 : a5 58 __ LDA T4 + 1 
2df8 : 85 10 __ STA P3 
2dfa : 18 __ __ CLC
2dfb : a5 53 __ LDA T2 + 0 
2dfd : 65 13 __ ADC P6 
2dff : aa __ __ TAX
2e00 : a5 56 __ LDA T3 + 1 
2e02 : 85 14 __ STA P7 
2e04 : 65 54 __ ADC T2 + 1 
2e06 : a8 __ __ TAY
2e07 : 8a __ __ TXA
2e08 : 18 __ __ CLC
2e09 : 69 30 __ ADC #$30
2e0b : 85 11 __ STA P4 
2e0d : 90 01 __ BCC $2e10 ; (vdc_fs_softscroll_init.s1029 + 0)
.s1028:
2e0f : c8 __ __ INY
.s1029:
2e10 : 84 12 __ STY P5 
2e12 : 20 7e 2e JSR $2e7e ; (vdc_cpytovdc.s0 + 0)
2e15 : a9 00 __ LDA #$00
2e17 : a0 04 __ LDY #$04
2e19 : 91 15 __ STA (P8),y ; (settings + 0)
2e1b : c8 __ __ INY
2e1c : 91 15 __ STA (P8),y ; (settings + 0)
2e1e : c8 __ __ INY
2e1f : 91 15 __ STA (P8),y ; (settings + 0)
2e21 : c8 __ __ INY
2e22 : 91 15 __ STA (P8),y ; (settings + 0)
2e24 : a9 18 __ LDA #$18
2e26 : 8d 00 d6 STA $d600 
.l304:
2e29 : 2c 00 d6 BIT $d600 
2e2c : 10 fb __ BPL $2e29 ; (vdc_fs_softscroll_init.l304 + 0)
.s50:
2e2e : ad 01 d6 LDA $d601 
2e31 : 29 f0 __ AND #$f0
2e33 : a0 08 __ LDY #$08
2e35 : 91 15 __ STA (P8),y ; (settings + 0)
2e37 : a9 19 __ LDA #$19
2e39 : 8d 00 d6 STA $d600 
.l306:
2e3c : 2c 00 d6 BIT $d600 
2e3f : 10 fb __ BPL $2e3c ; (vdc_fs_softscroll_init.l306 + 0)
.s57:
2e41 : ad 01 d6 LDA $d601 
2e44 : 29 0f __ AND #$0f
2e46 : a0 0c __ LDY #$0c
2e48 : 91 15 __ STA (P8),y ; (settings + 0)
2e4a : a9 19 __ LDA #$19
2e4c : 8d 00 d6 STA $d600 
.l308:
2e4f : 2c 00 d6 BIT $d600 
2e52 : 10 fb __ BPL $2e4f ; (vdc_fs_softscroll_init.l308 + 0)
.s64:
2e54 : a9 00 __ LDA #$00
2e56 : a0 0a __ LDY #$0a
2e58 : ae 01 d6 LDX $d601 
2e5b : 91 15 __ STA (P8),y ; (settings + 0)
2e5d : c8 __ __ INY
2e5e : 91 15 __ STA (P8),y ; (settings + 0)
2e60 : 8a __ __ TXA
2e61 : 29 f0 __ AND #$f0
2e63 : a0 09 __ LDY #$09
2e65 : 91 15 __ STA (P8),y ; (settings + 0)
2e67 : a9 01 __ LDA #$01
.s1001:
2e69 : 85 1b __ STA ACCU + 0 
2e6b : a2 05 __ LDX #$05
2e6d : bd f6 3f LDA $3ff6,x ; (canvas + 12)
2e70 : 95 53 __ STA T2 + 0,x 
2e72 : ca __ __ DEX
2e73 : 10 f8 __ BPL $2e6d ; (vdc_fs_softscroll_init.s1001 + 4)
2e75 : 60 __ __ RTS
.s1:
2e76 : a9 00 __ LDA #$00
2e78 : 90 ef __ BCC $2e69 ; (vdc_fs_softscroll_init.s1001 + 0)
--------------------------------------------------------------------
vdc_cpytovdc@proxy: ; vdc_cpytovdc@proxy
2e7a : a9 00 __ LDA #$00
2e7c : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_cpytovdc: ; vdc_cpytovdc(u16,u8*,u16)->void
.s0:
2e7e : 20 7e 1f JSR $1f7e ; (vdc_mem_addr@proxy + 0)
2e81 : a6 13 __ LDX P6 ; (size + 0)
.l51:
2e83 : 8a __ __ TXA
2e84 : 05 14 __ ORA P7 ; (size + 1)
2e86 : d0 01 __ BNE $2e89 ; (vdc_cpytovdc.s2 + 0)
.s1001:
2e88 : 60 __ __ RTS
.s2:
2e89 : a0 00 __ LDY #$00
2e8b : b1 11 __ LDA (P4),y ; (sp + 0)
2e8d : e6 11 __ INC P4 ; (sp + 0)
2e8f : d0 02 __ BNE $2e93 ; (vdc_cpytovdc.l52 + 0)
.s1004:
2e91 : e6 12 __ INC P5 ; (sp + 1)
.l52:
2e93 : 2c 00 d6 BIT $d600 
2e96 : 10 fb __ BPL $2e93 ; (vdc_cpytovdc.l52 + 0)
.s6:
2e98 : 8d 01 d6 STA $d601 
2e9b : ca __ __ DEX
2e9c : e0 ff __ CPX #$ff
2e9e : d0 e3 __ BNE $2e83 ; (vdc_cpytovdc.l51 + 0)
.s1006:
2ea0 : c6 14 __ DEC P7 ; (size + 1)
2ea2 : 4c 83 2e JMP $2e83 ; (vdc_cpytovdc.l51 + 0)
--------------------------------------------------------------------
vdcwin_checkch: ; vdcwin_checkch()->i16
.s0:
2ea5 : 20 e4 ff JSR $ffe4 
2ea8 : 85 1b __ STA ACCU + 0 
2eaa : a9 00 __ LDA #$00
2eac : 85 1c __ STA ACCU + 1 
.s1001:
2eae : 60 __ __ RTS
--------------------------------------------------------------------
vdc_fs_softscroll_right@proxy: ; vdc_fs_softscroll_right@proxy
2eaf : a9 e9 __ LDA #$e9
2eb1 : 85 0d __ STA P0 
2eb3 : a9 3f __ LDA #$3f
2eb5 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_fs_softscroll_right: ; vdc_fs_softscroll_right(struct VDCSoftScrollSettings*,u8)->void
.s0:
2eb7 : a0 07 __ LDY #$07
2eb9 : b1 0d __ LDA (P0),y ; (settings + 0)
2ebb : c9 02 __ CMP #$02
2ebd : 90 03 __ BCC $2ec2 ; (vdc_fs_softscroll_right.s2 + 0)
2ebf : 4c 8b 2f JMP $2f8b ; (vdc_fs_softscroll_right.s1 + 0)
.s2:
2ec2 : a0 02 __ LDY #$02
2ec4 : b1 0d __ LDA (P0),y ; (settings + 0)
2ec6 : 38 __ __ SEC
2ec7 : ed c7 36 SBC $36c7 ; (vdc_state + 3)
2eca : 85 43 __ STA T3 + 0 
2ecc : a9 00 __ LDA #$00
2ece : ed c8 36 SBC $36c8 ; (vdc_state + 4)
2ed1 : 85 44 __ STA T3 + 1 
2ed3 : a0 0a __ LDY #$0a
2ed5 : b1 0d __ LDA (P0),y ; (settings + 0)
2ed7 : 85 1b __ STA ACCU + 0 
2ed9 : 18 __ __ CLC
2eda : 69 01 __ ADC #$01
2edc : aa __ __ TAX
2edd : a9 00 __ LDA #$00
2edf : 2a __ __ ROL
2ee0 : c5 44 __ CMP T3 + 1 
2ee2 : d0 02 __ BNE $2ee6 ; (vdc_fs_softscroll_right.s1013 + 0)
.s1012:
2ee4 : e4 43 __ CPX T3 + 0 
.s1013:
2ee6 : 90 01 __ BCC $2ee9 ; (vdc_fs_softscroll_right.s15 + 0)
.s1001:
2ee8 : 60 __ __ RTS
.s15:
2ee9 : a0 0c __ LDY #$0c
2eeb : b1 0d __ LDA (P0),y ; (settings + 0)
2eed : 29 01 __ AND #$01
2eef : 09 06 __ ORA #$06
2ef1 : a0 07 __ LDY #$07
2ef3 : 91 0d __ STA (P0),y ; (settings + 0)
2ef5 : a6 1b __ LDX ACCU + 0 
2ef7 : e8 __ __ INX
2ef8 : 8a __ __ TXA
2ef9 : a0 0a __ LDY #$0a
2efb : 91 0d __ STA (P0),y ; (settings + 0)
2efd : a0 04 __ LDY #$04
2eff : b1 0d __ LDA (P0),y ; (settings + 0)
2f01 : 69 01 __ ADC #$01
2f03 : 85 43 __ STA T3 + 0 
2f05 : 91 0d __ STA (P0),y ; (settings + 0)
2f07 : c8 __ __ INY
2f08 : b1 0d __ LDA (P0),y ; (settings + 0)
2f0a : 69 00 __ ADC #$00
2f0c : 85 44 __ STA T3 + 1 
2f0e : 91 0d __ STA (P0),y ; (settings + 0)
.l267:
2f10 : ad 00 d6 LDA $d600 
2f13 : 29 20 __ AND #$20
2f15 : d0 f9 __ BNE $2f10 ; (vdc_fs_softscroll_right.l267 + 0)
.s18:
2f17 : ad ce 36 LDA $36ce ; (vdc_state + 10)
2f1a : 18 __ __ CLC
2f1b : 65 43 __ ADC T3 + 0 
2f1d : aa __ __ TAX
2f1e : ad cf 36 LDA $36cf ; (vdc_state + 11)
2f21 : 65 44 __ ADC T3 + 1 
2f23 : a8 __ __ TAY
2f24 : ad cc 36 LDA $36cc ; (vdc_state + 8)
2f27 : 18 __ __ CLC
2f28 : 65 43 __ ADC T3 + 0 
2f2a : 85 43 __ STA T3 + 0 
2f2c : a9 0c __ LDA #$0c
2f2e : 8d 00 d6 STA $d600 
2f31 : ad cd 36 LDA $36cd ; (vdc_state + 9)
2f34 : 65 44 __ ADC T3 + 1 
.l269:
2f36 : 2c 00 d6 BIT $d600 
2f39 : 10 fb __ BPL $2f36 ; (vdc_fs_softscroll_right.l269 + 0)
.s26:
2f3b : 8d 01 d6 STA $d601 
2f3e : a9 0d __ LDA #$0d
2f40 : 8d 00 d6 STA $d600 
.l271:
2f43 : 2c 00 d6 BIT $d600 
2f46 : 10 fb __ BPL $2f43 ; (vdc_fs_softscroll_right.l271 + 0)
.s31:
2f48 : a5 43 __ LDA T3 + 0 
2f4a : 8d 01 d6 STA $d601 
2f4d : a9 14 __ LDA #$14
2f4f : 8d 00 d6 STA $d600 
.l273:
2f52 : 2c 00 d6 BIT $d600 
2f55 : 10 fb __ BPL $2f52 ; (vdc_fs_softscroll_right.l273 + 0)
.s36:
2f57 : 8c 01 d6 STY $d601 
2f5a : a9 15 __ LDA #$15
2f5c : 8d 00 d6 STA $d600 
.l275:
2f5f : 2c 00 d6 BIT $d600 
2f62 : 10 fb __ BPL $2f5f ; (vdc_fs_softscroll_right.l275 + 0)
.s41:
2f64 : 8e 01 d6 STX $d601 
.l277:
2f67 : ad 00 d6 LDA $d600 
2f6a : 29 20 __ AND #$20
2f6c : f0 f9 __ BEQ $2f67 ; (vdc_fs_softscroll_right.l277 + 0)
.s42:
2f6e : a0 07 __ LDY #$07
.s1018:
2f70 : b1 0d __ LDA (P0),y ; (settings + 0)
2f72 : aa __ __ TAX
2f73 : a0 09 __ LDY #$09
2f75 : b1 0d __ LDA (P0),y ; (settings + 0)
2f77 : 85 1b __ STA ACCU + 0 
2f79 : a9 19 __ LDA #$19
2f7b : 8d 00 d6 STA $d600 
2f7e : 8a __ __ TXA
2f7f : 18 __ __ CLC
2f80 : 65 1b __ ADC ACCU + 0 
.l264:
2f82 : 2c 00 d6 BIT $d600 
2f85 : 10 fb __ BPL $2f82 ; (vdc_fs_softscroll_right.l264 + 0)
.s469:
2f87 : 8d 01 d6 STA $d601 
2f8a : 60 __ __ RTS
.s1:
2f8b : e9 02 __ SBC #$02
2f8d : 91 0d __ STA (P0),y ; (settings + 0)
.l261:
2f8f : ad 00 d6 LDA $d600 
2f92 : 29 20 __ AND #$20
2f94 : d0 f9 __ BNE $2f8f ; (vdc_fs_softscroll_right.l261 + 0)
.l8:
2f96 : ad 00 d6 LDA $d600 
2f99 : 29 20 __ AND #$20
2f9b : f0 f9 __ BEQ $2f96 ; (vdc_fs_softscroll_right.l8 + 0)
2f9d : 4c 70 2f JMP $2f70 ; (vdc_fs_softscroll_right.s1018 + 0)
--------------------------------------------------------------------
vdc_fs_softscroll_down@proxy: ; vdc_fs_softscroll_down@proxy
2fa0 : a9 e9 __ LDA #$e9
2fa2 : 85 0d __ STA P0 
2fa4 : a9 3f __ LDA #$3f
2fa6 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_fs_softscroll_down: ; vdc_fs_softscroll_down(struct VDCSoftScrollSettings*,u8)->void
.l211:
2fa8 : ad 00 d6 LDA $d600 
2fab : 29 20 __ AND #$20
2fad : f0 f9 __ BEQ $2fa8 ; (vdc_fs_softscroll_down.l211 + 0)
.l6:
2faf : ad 00 d6 LDA $d600 
2fb2 : 29 20 __ AND #$20
2fb4 : d0 f9 __ BNE $2faf ; (vdc_fs_softscroll_down.l6 + 0)
.s1:
2fb6 : a0 06 __ LDY #$06
2fb8 : b1 0d __ LDA (P0),y ; (settings + 0)
2fba : aa __ __ TAX
2fbb : 18 __ __ CLC
2fbc : 69 02 __ ADC #$02
2fbe : 91 0d __ STA (P0),y ; (settings + 0)
2fc0 : c9 07 __ CMP #$07
2fc2 : b0 13 __ BCS $2fd7 ; (vdc_fs_softscroll_down.s8 + 0)
.s9:
2fc4 : a0 08 __ LDY #$08
2fc6 : 71 0d __ ADC (P0),y ; (settings + 0)
2fc8 : aa __ __ TAX
2fc9 : a9 18 __ LDA #$18
.s1018:
2fcb : 8d 00 d6 STA $d600 
.l223:
2fce : 2c 00 d6 BIT $d600 
2fd1 : 10 fb __ BPL $2fce ; (vdc_fs_softscroll_down.l223 + 0)
.s384:
2fd3 : 8e 01 d6 STX $d601 
.s1001:
2fd6 : 60 __ __ RTS
.s8:
2fd7 : a0 03 __ LDY #$03
2fd9 : b1 0d __ LDA (P0),y ; (settings + 0)
2fdb : ed c9 36 SBC $36c9 ; (vdc_state + 5)
2fde : a8 __ __ TAY
2fdf : a9 00 __ LDA #$00
2fe1 : ed ca 36 SBC $36ca ; (vdc_state + 6)
2fe4 : 85 44 __ STA T4 + 1 
2fe6 : 98 __ __ TYA
2fe7 : 38 __ __ SEC
2fe8 : e9 01 __ SBC #$01
2fea : 85 43 __ STA T4 + 0 
2fec : a0 0b __ LDY #$0b
2fee : b1 0d __ LDA (P0),y ; (settings + 0)
2ff0 : 85 1b __ STA ACCU + 0 
2ff2 : a5 44 __ LDA T4 + 1 
2ff4 : e9 00 __ SBC #$00
2ff6 : d0 0c __ BNE $3004 ; (vdc_fs_softscroll_down.s11 + 0)
.s1014:
2ff8 : a5 1b __ LDA ACCU + 0 
2ffa : c5 43 __ CMP T4 + 0 
2ffc : 90 06 __ BCC $3004 ; (vdc_fs_softscroll_down.s11 + 0)
.s12:
2ffe : 8a __ __ TXA
2fff : a0 06 __ LDY #$06
3001 : 91 0d __ STA (P0),y ; (settings + 0)
3003 : 60 __ __ RTS
.s11:
3004 : a9 00 __ LDA #$00
3006 : a0 06 __ LDY #$06
3008 : 91 0d __ STA (P0),y ; (settings + 0)
300a : 18 __ __ CLC
300b : a5 1b __ LDA ACCU + 0 
300d : 69 01 __ ADC #$01
300f : a0 0b __ LDY #$0b
3011 : 91 0d __ STA (P0),y ; (settings + 0)
3013 : a0 02 __ LDY #$02
3015 : b1 0d __ LDA (P0),y ; (settings + 0)
3017 : 18 __ __ CLC
3018 : a0 04 __ LDY #$04
301a : 71 0d __ ADC (P0),y ; (settings + 0)
301c : 85 43 __ STA T4 + 0 
301e : 91 0d __ STA (P0),y ; (settings + 0)
3020 : c8 __ __ INY
3021 : b1 0d __ LDA (P0),y ; (settings + 0)
3023 : 69 00 __ ADC #$00
3025 : 85 44 __ STA T4 + 1 
3027 : 91 0d __ STA (P0),y ; (settings + 0)
3029 : a0 08 __ LDY #$08
302b : b1 0d __ LDA (P0),y ; (settings + 0)
302d : a2 18 __ LDX #$18
302f : 8e 00 d6 STX $d600 
.l215:
3032 : 2c 00 d6 BIT $d600 
3035 : 10 fb __ BPL $3032 ; (vdc_fs_softscroll_down.l215 + 0)
.s18:
3037 : 8d 01 d6 STA $d601 
303a : ad ce 36 LDA $36ce ; (vdc_state + 10)
303d : 18 __ __ CLC
303e : 65 43 __ ADC T4 + 0 
3040 : aa __ __ TAX
3041 : ad cf 36 LDA $36cf ; (vdc_state + 11)
3044 : 65 44 __ ADC T4 + 1 
3046 : a8 __ __ TAY
3047 : ad cc 36 LDA $36cc ; (vdc_state + 8)
304a : 18 __ __ CLC
304b : 65 43 __ ADC T4 + 0 
304d : 85 43 __ STA T4 + 0 
304f : a9 0c __ LDA #$0c
3051 : 8d 00 d6 STA $d600 
3054 : ad cd 36 LDA $36cd ; (vdc_state + 9)
3057 : 65 44 __ ADC T4 + 1 
.l217:
3059 : 2c 00 d6 BIT $d600 
305c : 10 fb __ BPL $3059 ; (vdc_fs_softscroll_down.l217 + 0)
.s24:
305e : 8d 01 d6 STA $d601 
3061 : a9 0d __ LDA #$0d
3063 : 8d 00 d6 STA $d600 
.l219:
3066 : 2c 00 d6 BIT $d600 
3069 : 10 fb __ BPL $3066 ; (vdc_fs_softscroll_down.l219 + 0)
.s29:
306b : a5 43 __ LDA T4 + 0 
306d : 8d 01 d6 STA $d601 
3070 : a9 14 __ LDA #$14
3072 : 8d 00 d6 STA $d600 
.l221:
3075 : 2c 00 d6 BIT $d600 
3078 : 10 fb __ BPL $3075 ; (vdc_fs_softscroll_down.l221 + 0)
.s34:
307a : 8c 01 d6 STY $d601 
307d : a9 15 __ LDA #$15
307f : 4c cb 2f JMP $2fcb ; (vdc_fs_softscroll_down.s1018 + 0)
--------------------------------------------------------------------
vdc_fs_softscroll_left@proxy: ; vdc_fs_softscroll_left@proxy
3082 : a9 e9 __ LDA #$e9
3084 : 85 0d __ STA P0 
3086 : a9 3f __ LDA #$3f
3088 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_fs_softscroll_left: ; vdc_fs_softscroll_left(struct VDCSoftScrollSettings*,u8)->void
.s0:
308a : 18 __ __ CLC
308b : a0 07 __ LDY #$07
308d : b1 0d __ LDA (P0),y ; (settings + 0)
308f : 69 02 __ ADC #$02
3091 : 91 0d __ STA (P0),y ; (settings + 0)
3093 : c9 07 __ CMP #$07
3095 : b0 12 __ BCS $30a9 ; (vdc_fs_softscroll_left.s1 + 0)
.s2:
3097 : a0 09 __ LDY #$09
3099 : 71 0d __ ADC (P0),y ; (settings + 0)
.s1018:
309b : a2 19 __ LDX #$19
309d : 8e 00 d6 STX $d600 
.l317:
30a0 : 2c 00 d6 BIT $d600 
30a3 : 10 fb __ BPL $30a0 ; (vdc_fs_softscroll_left.l317 + 0)
.s554:
30a5 : 8d 01 d6 STA $d601 
.s1001:
30a8 : 60 __ __ RTS
.s1:
30a9 : a0 0a __ LDY #$0a
30ab : b1 0d __ LDA (P0),y ; (settings + 0)
30ad : aa __ __ TAX
30ae : a0 0c __ LDY #$0c
30b0 : 09 00 __ ORA #$00
30b2 : d0 29 __ BNE $30dd ; (vdc_fs_softscroll_left.s4 + 0)
.s5:
30b4 : b1 0d __ LDA (P0),y ; (settings + 0)
30b6 : a0 07 __ LDY #$07
30b8 : 91 0d __ STA (P0),y ; (settings + 0)
.l320:
30ba : ad 00 d6 LDA $d600 
30bd : 29 20 __ AND #$20
30bf : d0 f9 __ BNE $30ba ; (vdc_fs_softscroll_left.l320 + 0)
.l47:
30c1 : ad 00 d6 LDA $d600 
30c4 : 29 20 __ AND #$20
30c6 : f0 f9 __ BEQ $30c1 ; (vdc_fs_softscroll_left.l47 + 0)
.s46:
30c8 : b1 0d __ LDA (P0),y ; (settings + 0)
30ca : aa __ __ TAX
30cb : a0 09 __ LDY #$09
30cd : b1 0d __ LDA (P0),y ; (settings + 0)
30cf : 85 1b __ STA ACCU + 0 
30d1 : a9 19 __ LDA #$19
30d3 : 8d 00 d6 STA $d600 
30d6 : 8a __ __ TXA
30d7 : 18 __ __ CLC
30d8 : 65 1b __ ADC ACCU + 0 
30da : 4c a0 30 JMP $30a0 ; (vdc_fs_softscroll_left.l317 + 0)
.s4:
30dd : b1 0d __ LDA (P0),y ; (settings + 0)
30df : 29 01 __ AND #$01
30e1 : a0 07 __ LDY #$07
30e3 : 91 0d __ STA (P0),y ; (settings + 0)
30e5 : ca __ __ DEX
30e6 : 8a __ __ TXA
30e7 : a0 0a __ LDY #$0a
30e9 : 91 0d __ STA (P0),y ; (settings + 0)
30eb : 18 __ __ CLC
30ec : a0 04 __ LDY #$04
30ee : b1 0d __ LDA (P0),y ; (settings + 0)
30f0 : 69 ff __ ADC #$ff
30f2 : 85 1b __ STA ACCU + 0 
30f4 : 91 0d __ STA (P0),y ; (settings + 0)
30f6 : c8 __ __ INY
30f7 : b1 0d __ LDA (P0),y ; (settings + 0)
30f9 : 69 ff __ ADC #$ff
30fb : 85 1c __ STA ACCU + 1 
30fd : 91 0d __ STA (P0),y ; (settings + 0)
.l305:
30ff : ad 00 d6 LDA $d600 
3102 : 29 20 __ AND #$20
3104 : d0 f9 __ BNE $30ff ; (vdc_fs_softscroll_left.l305 + 0)
.s7:
3106 : ad ce 36 LDA $36ce ; (vdc_state + 10)
3109 : 18 __ __ CLC
310a : 65 1b __ ADC ACCU + 0 
310c : aa __ __ TAX
310d : ad cf 36 LDA $36cf ; (vdc_state + 11)
3110 : 65 1c __ ADC ACCU + 1 
3112 : a8 __ __ TAY
3113 : ad cc 36 LDA $36cc ; (vdc_state + 8)
3116 : 18 __ __ CLC
3117 : 65 1b __ ADC ACCU + 0 
3119 : 85 1b __ STA ACCU + 0 
311b : a9 0c __ LDA #$0c
311d : 8d 00 d6 STA $d600 
3120 : ad cd 36 LDA $36cd ; (vdc_state + 9)
3123 : 65 1c __ ADC ACCU + 1 
.l307:
3125 : 2c 00 d6 BIT $d600 
3128 : 10 fb __ BPL $3125 ; (vdc_fs_softscroll_left.l307 + 0)
.s15:
312a : 8d 01 d6 STA $d601 
312d : a9 0d __ LDA #$0d
312f : 8d 00 d6 STA $d600 
.l309:
3132 : 2c 00 d6 BIT $d600 
3135 : 10 fb __ BPL $3132 ; (vdc_fs_softscroll_left.l309 + 0)
.s20:
3137 : a5 1b __ LDA ACCU + 0 
3139 : 8d 01 d6 STA $d601 
313c : a9 14 __ LDA #$14
313e : 8d 00 d6 STA $d600 
.l311:
3141 : 2c 00 d6 BIT $d600 
3144 : 10 fb __ BPL $3141 ; (vdc_fs_softscroll_left.l311 + 0)
.s25:
3146 : 8c 01 d6 STY $d601 
3149 : a9 15 __ LDA #$15
314b : 8d 00 d6 STA $d600 
.l313:
314e : 2c 00 d6 BIT $d600 
3151 : 10 fb __ BPL $314e ; (vdc_fs_softscroll_left.l313 + 0)
.s30:
3153 : 8e 01 d6 STX $d601 
.l315:
3156 : ad 00 d6 LDA $d600 
3159 : 29 20 __ AND #$20
315b : f0 f9 __ BEQ $3156 ; (vdc_fs_softscroll_left.l315 + 0)
.l36:
315d : ad 00 d6 LDA $d600 
3160 : 29 20 __ AND #$20
3162 : d0 f9 __ BNE $315d ; (vdc_fs_softscroll_left.l36 + 0)
.s31:
3164 : a0 09 __ LDY #$09
3166 : b1 0d __ LDA (P0),y ; (settings + 0)
3168 : 4c 9b 30 JMP $309b ; (vdc_fs_softscroll_left.s1018 + 0)
--------------------------------------------------------------------
vdc_fs_softscroll_up@proxy: ; vdc_fs_softscroll_up@proxy
316b : a9 e9 __ LDA #$e9
316d : 85 0d __ STA P0 
316f : a9 3f __ LDA #$3f
3171 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_fs_softscroll_up: ; vdc_fs_softscroll_up(struct VDCSoftScrollSettings*,u8)->void
.l236:
3173 : ad 00 d6 LDA $d600 
3176 : 29 20 __ AND #$20
3178 : f0 f9 __ BEQ $3173 ; (vdc_fs_softscroll_up.l236 + 0)
.l6:
317a : ad 00 d6 LDA $d600 
317d : 29 20 __ AND #$20
317f : d0 f9 __ BNE $317a ; (vdc_fs_softscroll_up.l6 + 0)
.s1:
3181 : a0 06 __ LDY #$06
3183 : b1 0d __ LDA (P0),y ; (settings + 0)
3185 : c9 02 __ CMP #$02
3187 : 90 03 __ BCC $318c ; (vdc_fs_softscroll_up.s9 + 0)
3189 : 4c 2d 32 JMP $322d ; (vdc_fs_softscroll_up.s8 + 0)
.s9:
318c : a0 0b __ LDY #$0b
318e : b1 0d __ LDA (P0),y ; (settings + 0)
3190 : d0 01 __ BNE $3193 ; (vdc_fs_softscroll_up.s16 + 0)
.s1001:
3192 : 60 __ __ RTS
.s16:
3193 : aa __ __ TAX
3194 : a9 06 __ LDA #$06
3196 : a8 __ __ TAY
3197 : 91 0d __ STA (P0),y ; (settings + 0)
3199 : ca __ __ DEX
319a : 8a __ __ TXA
319b : a0 0b __ LDY #$0b
319d : 91 0d __ STA (P0),y ; (settings + 0)
319f : a0 02 __ LDY #$02
31a1 : b1 0d __ LDA (P0),y ; (settings + 0)
31a3 : 85 1b __ STA ACCU + 0 
31a5 : 38 __ __ SEC
31a6 : a0 04 __ LDY #$04
31a8 : b1 0d __ LDA (P0),y ; (settings + 0)
31aa : e5 1b __ SBC ACCU + 0 
31ac : 85 43 __ STA T3 + 0 
31ae : 91 0d __ STA (P0),y ; (settings + 0)
31b0 : c8 __ __ INY
31b1 : b1 0d __ LDA (P0),y ; (settings + 0)
31b3 : e9 00 __ SBC #$00
31b5 : 85 44 __ STA T3 + 1 
31b7 : 91 0d __ STA (P0),y ; (settings + 0)
.l242:
31b9 : ad 00 d6 LDA $d600 
31bc : 29 20 __ AND #$20
31be : d0 f9 __ BNE $31b9 ; (vdc_fs_softscroll_up.l242 + 0)
.s19:
31c0 : a0 06 __ LDY #$06
31c2 : b1 0d __ LDA (P0),y ; (settings + 0)
31c4 : aa __ __ TAX
31c5 : a0 08 __ LDY #$08
31c7 : b1 0d __ LDA (P0),y ; (settings + 0)
31c9 : 85 1b __ STA ACCU + 0 
31cb : a9 18 __ LDA #$18
31cd : 8d 00 d6 STA $d600 
31d0 : 8a __ __ TXA
31d1 : 18 __ __ CLC
31d2 : 65 1b __ ADC ACCU + 0 
.l244:
31d4 : 2c 00 d6 BIT $d600 
31d7 : 10 fb __ BPL $31d4 ; (vdc_fs_softscroll_up.l244 + 0)
.s26:
31d9 : 8d 01 d6 STA $d601 
31dc : ad ce 36 LDA $36ce ; (vdc_state + 10)
31df : 18 __ __ CLC
31e0 : 65 43 __ ADC T3 + 0 
31e2 : aa __ __ TAX
31e3 : ad cf 36 LDA $36cf ; (vdc_state + 11)
31e6 : 65 44 __ ADC T3 + 1 
31e8 : a8 __ __ TAY
31e9 : ad cc 36 LDA $36cc ; (vdc_state + 8)
31ec : 18 __ __ CLC
31ed : 65 43 __ ADC T3 + 0 
31ef : 85 43 __ STA T3 + 0 
31f1 : a9 0c __ LDA #$0c
31f3 : 8d 00 d6 STA $d600 
31f6 : ad cd 36 LDA $36cd ; (vdc_state + 9)
31f9 : 65 44 __ ADC T3 + 1 
.l246:
31fb : 2c 00 d6 BIT $d600 
31fe : 10 fb __ BPL $31fb ; (vdc_fs_softscroll_up.l246 + 0)
.s32:
3200 : 8d 01 d6 STA $d601 
3203 : a9 0d __ LDA #$0d
3205 : 8d 00 d6 STA $d600 
.l248:
3208 : 2c 00 d6 BIT $d600 
320b : 10 fb __ BPL $3208 ; (vdc_fs_softscroll_up.l248 + 0)
.s37:
320d : a5 43 __ LDA T3 + 0 
320f : 8d 01 d6 STA $d601 
3212 : a9 14 __ LDA #$14
3214 : 8d 00 d6 STA $d600 
.l250:
3217 : 2c 00 d6 BIT $d600 
321a : 10 fb __ BPL $3217 ; (vdc_fs_softscroll_up.l250 + 0)
.s42:
321c : 8c 01 d6 STY $d601 
321f : a9 15 __ LDA #$15
3221 : 8d 00 d6 STA $d600 
.l239:
3224 : 2c 00 d6 BIT $d600 
3227 : 10 fb __ BPL $3224 ; (vdc_fs_softscroll_up.l239 + 0)
.s427:
3229 : 8e 01 d6 STX $d601 
322c : 60 __ __ RTS
.s8:
322d : e9 02 __ SBC #$02
322f : 91 0d __ STA (P0),y ; (settings + 0)
3231 : aa __ __ TAX
3232 : a0 08 __ LDY #$08
3234 : b1 0d __ LDA (P0),y ; (settings + 0)
3236 : 85 1b __ STA ACCU + 0 
3238 : a9 18 __ LDA #$18
323a : 8d 00 d6 STA $d600 
323d : 8a __ __ TXA
323e : 18 __ __ CLC
323f : 65 1b __ ADC ACCU + 0 
3241 : aa __ __ TAX
3242 : 4c 24 32 JMP $3224 ; (vdc_fs_softscroll_up.l239 + 0)
--------------------------------------------------------------------
show_noscroll: ; show_noscroll()->void
.s0:
3245 : ad e3 36 LDA $36e3 ; (view + 6)
3248 : 85 15 __ STA P8 
324a : 85 11 __ STA P4 
324c : a9 ea __ LDA #$ea
324e : 85 0d __ STA P0 
3250 : a9 3f __ LDA #$3f
3252 : 85 0e __ STA P1 
3254 : ad e5 36 LDA $36e5 ; (view + 8)
3257 : 85 17 __ STA P10 
3259 : 85 13 __ STA P6 
325b : ad e6 36 LDA $36e6 ; (view + 9)
325e : 85 18 __ STA P11 
3260 : 85 14 __ STA P7 
3262 : ad dd 36 LDA $36dd ; (view + 0)
3265 : 85 0f __ STA P2 
3267 : ad de 36 LDA $36de ; (view + 1)
326a : 85 10 __ STA P3 
326c : ad e4 36 LDA $36e4 ; (view + 7)
326f : 85 16 __ STA P9 
3271 : 85 12 __ STA P5 
3273 : cd c8 36 CMP $36c8 ; (vdc_state + 4)
3276 : d0 05 __ BNE $327d ; (show_noscroll.s1005 + 0)
.s1004:
3278 : a5 11 __ LDA P4 
327a : cd c7 36 CMP $36c7 ; (vdc_state + 3)
.s1005:
327d : 90 06 __ BCC $3285 ; (show_noscroll.s1 + 0)
.s3:
327f : a9 00 __ LDA #$00
3281 : 85 43 __ STA T0 + 0 
3283 : b0 10 __ BCS $3295 ; (show_noscroll.s8 + 0)
.s1:
3285 : ad c7 36 LDA $36c7 ; (vdc_state + 3)
3288 : 38 __ __ SEC
3289 : e5 11 __ SBC P4 
328b : 85 43 __ STA T0 + 0 
328d : ad c8 36 LDA $36c8 ; (vdc_state + 4)
3290 : e5 12 __ SBC P5 
3292 : 4a __ __ LSR
3293 : 66 43 __ ROR T0 + 0 
.s8:
3295 : a5 14 __ LDA P7 
3297 : a0 00 __ LDY #$00
3299 : cd ca 36 CMP $36ca ; (vdc_state + 6)
329c : d0 05 __ BNE $32a3 ; (show_noscroll.s1003 + 0)
.s1002:
329e : a5 13 __ LDA P6 
32a0 : cd c9 36 CMP $36c9 ; (vdc_state + 5)
.s1003:
32a3 : b0 10 __ BCS $32b5 ; (show_noscroll.s6 + 0)
.s4:
32a5 : ad c9 36 LDA $36c9 ; (vdc_state + 5)
32a8 : 38 __ __ SEC
32a9 : e5 13 __ SBC P6 
32ab : aa __ __ TAX
32ac : ad ca 36 LDA $36ca ; (vdc_state + 6)
32af : e5 14 __ SBC P7 
32b1 : 4a __ __ LSR
32b2 : 8a __ __ TXA
32b3 : 6a __ __ ROR
32b4 : a8 __ __ TAY
.s6:
32b5 : 8c ff 3f STY $3fff ; (sstack + 1)
32b8 : a5 43 __ LDA T0 + 0 
32ba : 8d fe 3f STA $3ffe ; (sstack + 0)
32bd : 20 d9 32 JSR $32d9 ; (vdcwin_viewport_init.s0 + 0)
32c0 : a9 ea __ LDA #$ea
32c2 : 85 15 __ STA P8 
32c4 : a9 3f __ LDA #$3f
32c6 : 85 16 __ STA P9 
32c8 : 20 74 33 JSR $3374 ; (vdcwin_cpy_viewport.s0 + 0)
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->void
.s0:
32cb : 20 e4 ff JSR $ffe4 
32ce : c9 00 __ CMP #$00
32d0 : f0 f9 __ BEQ $32cb ; (vdcwin_getch.s0 + 0)
32d2 : 85 1b __ STA ACCU + 0 
32d4 : a9 00 __ LDA #$00
32d6 : 85 1c __ STA ACCU + 1 
.s1001:
32d8 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_viewport_init: ; vdcwin_viewport_init(struct VDCViewport*,u8*,u16,u16,u16,u16,u8,u8)->void
.s0:
32d9 : a9 00 __ LDA #$00
32db : a0 06 __ LDY #$06
32dd : 91 0d __ STA (P0),y ; (vp + 0)
32df : c8 __ __ INY
32e0 : 91 0d __ STA (P0),y ; (vp + 0)
32e2 : c8 __ __ INY
32e3 : 91 0d __ STA (P0),y ; (vp + 0)
32e5 : c8 __ __ INY
32e6 : 91 0d __ STA (P0),y ; (vp + 0)
32e8 : a0 0e __ LDY #$0e
32ea : 91 0d __ STA (P0),y ; (vp + 0)
32ec : c8 __ __ INY
32ed : 91 0d __ STA (P0),y ; (vp + 0)
32ef : a5 0f __ LDA P2 ; (sourcebase + 0)
32f1 : a0 00 __ LDY #$00
32f3 : 91 0d __ STA (P0),y ; (vp + 0)
32f5 : a5 10 __ LDA P3 ; (sourcebase + 1)
32f7 : c8 __ __ INY
32f8 : 91 0d __ STA (P0),y ; (vp + 0)
32fa : a5 11 __ LDA P4 ; (sourcewidth + 0)
32fc : c8 __ __ INY
32fd : 91 0d __ STA (P0),y ; (vp + 0)
32ff : a5 12 __ LDA P5 ; (sourcewidth + 1)
3301 : c8 __ __ INY
3302 : 91 0d __ STA (P0),y ; (vp + 0)
3304 : a5 13 __ LDA P6 ; (sourceheight + 0)
3306 : c8 __ __ INY
3307 : 91 0d __ STA (P0),y ; (vp + 0)
3309 : a5 14 __ LDA P7 ; (sourceheight + 1)
330b : c8 __ __ INY
330c : 91 0d __ STA (P0),y ; (vp + 0)
330e : ad fe 3f LDA $3ffe ; (sstack + 0)
3311 : 85 1b __ STA ACCU + 0 
3313 : a0 0a __ LDY #$0a
3315 : 91 0d __ STA (P0),y ; (vp + 0)
3317 : ad ff 3f LDA $3fff ; (sstack + 1)
331a : 85 1c __ STA ACCU + 1 
331c : c8 __ __ INY
331d : 91 0d __ STA (P0),y ; (vp + 0)
331f : a5 15 __ LDA P8 ; (viewwidth + 0)
3321 : c8 __ __ INY
3322 : 91 0d __ STA (P0),y ; (vp + 0)
3324 : a5 17 __ LDA P10 ; (viewheight + 0)
3326 : c8 __ __ INY
3327 : 91 0d __ STA (P0),y ; (vp + 0)
3329 : 06 1c __ ASL ACCU + 1 
332b : a6 1c __ LDX ACCU + 1 
332d : bd 00 38 LDA $3800,x ; (multab + 0)
3330 : 18 __ __ CLC
3331 : 65 1b __ ADC ACCU + 0 
3333 : 85 1c __ STA ACCU + 1 
3335 : bd 01 38 LDA $3801,x ; (multab + 1)
3338 : 69 00 __ ADC #$00
333a : a8 __ __ TAY
333b : ad cc 36 LDA $36cc ; (vdc_state + 8)
333e : 18 __ __ CLC
333f : 65 1c __ ADC ACCU + 1 
3341 : 85 1c __ STA ACCU + 1 
3343 : 98 __ __ TYA
3344 : 6d cd 36 ADC $36cd ; (vdc_state + 9)
3347 : a0 11 __ LDY #$11
3349 : 91 0d __ STA (P0),y ; (vp + 0)
334b : a5 1c __ LDA ACCU + 1 
334d : 88 __ __ DEY
334e : 91 0d __ STA (P0),y ; (vp + 0)
3350 : bd 00 38 LDA $3800,x ; (multab + 0)
3353 : 18 __ __ CLC
3354 : 65 1b __ ADC ACCU + 0 
3356 : 85 1b __ STA ACCU + 0 
3358 : bd 01 38 LDA $3801,x ; (multab + 1)
335b : 69 00 __ ADC #$00
335d : aa __ __ TAX
335e : ad ce 36 LDA $36ce ; (vdc_state + 10)
3361 : 18 __ __ CLC
3362 : 65 1b __ ADC ACCU + 0 
3364 : 85 1b __ STA ACCU + 0 
3366 : 8a __ __ TXA
3367 : 6d cf 36 ADC $36cf ; (vdc_state + 11)
336a : a0 13 __ LDY #$13
336c : 91 0d __ STA (P0),y ; (vp + 0)
336e : a5 1b __ LDA ACCU + 0 
3370 : 88 __ __ DEY
3371 : 91 0d __ STA (P0),y ; (vp + 0)
.s1001:
3373 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_cpy_viewport: ; vdcwin_cpy_viewport(struct VDCViewport*)->void
.s0:
3374 : a5 15 __ LDA P8 ; (viewport + 0)
3376 : 85 43 __ STA T0 + 0 
3378 : a5 16 __ LDA P9 ; (viewport + 1)
337a : 85 44 __ STA T0 + 1 
337c : a0 08 __ LDY #$08
337e : b1 15 __ LDA (P8),y ; (viewport + 0)
3380 : 85 1b __ STA ACCU + 0 
3382 : c8 __ __ INY
3383 : b1 15 __ LDA (P8),y ; (viewport + 0)
3385 : 85 1c __ STA ACCU + 1 
3387 : a0 02 __ LDY #$02
3389 : b1 15 __ LDA (P8),y ; (viewport + 0)
338b : 85 03 __ STA WORK + 0 
338d : c8 __ __ INY
338e : b1 15 __ LDA (P8),y ; (viewport + 0)
3390 : 85 04 __ STA WORK + 1 
3392 : 20 fd 34 JSR $34fd ; (mul16 + 0)
3395 : a0 00 __ LDY #$00
3397 : 84 49 __ STY T3 + 0 
3399 : b1 15 __ LDA (P8),y ; (viewport + 0)
339b : 18 __ __ CLC
339c : 65 05 __ ADC WORK + 2 
339e : aa __ __ TAX
339f : c8 __ __ INY
33a0 : b1 15 __ LDA (P8),y ; (viewport + 0)
33a2 : 65 06 __ ADC WORK + 3 
33a4 : 85 46 __ STA T1 + 1 
33a6 : 8a __ __ TXA
33a7 : 18 __ __ CLC
33a8 : a0 06 __ LDY #$06
33aa : 71 15 __ ADC (P8),y ; (viewport + 0)
33ac : 85 45 __ STA T1 + 0 
33ae : a5 46 __ LDA T1 + 1 
33b0 : c8 __ __ INY
33b1 : 71 15 __ ADC (P8),y ; (viewport + 0)
33b3 : 85 46 __ STA T1 + 1 
33b5 : a0 10 __ LDY #$10
33b7 : b1 15 __ LDA (P8),y ; (viewport + 0)
33b9 : aa __ __ TAX
33ba : c8 __ __ INY
33bb : b1 15 __ LDA (P8),y ; (viewport + 0)
33bd : 4c f0 33 JMP $33f0 ; (vdcwin_cpy_viewport.l1 + 0)
.s2:
33c0 : 86 0f __ STX P2 
33c2 : a5 45 __ LDA T1 + 0 
33c4 : 85 11 __ STA P4 
33c6 : a5 46 __ LDA T1 + 1 
33c8 : 85 12 __ STA P5 
33ca : 88 __ __ DEY
33cb : b1 43 __ LDA (T0 + 0),y 
33cd : 85 13 __ STA P6 
33cf : 20 7a 2e JSR $2e7a ; (vdc_cpytovdc@proxy + 0)
33d2 : a5 45 __ LDA T1 + 0 
33d4 : 18 __ __ CLC
33d5 : a0 02 __ LDY #$02
33d7 : 71 43 __ ADC (T0 + 0),y 
33d9 : 85 45 __ STA T1 + 0 
33db : a5 46 __ LDA T1 + 1 
33dd : c8 __ __ INY
33de : 71 43 __ ADC (T0 + 0),y 
33e0 : 85 46 __ STA T1 + 1 
33e2 : ad c7 36 LDA $36c7 ; (vdc_state + 3)
33e5 : 18 __ __ CLC
33e6 : 65 0f __ ADC P2 
33e8 : aa __ __ TAX
33e9 : ad c8 36 LDA $36c8 ; (vdc_state + 4)
33ec : 65 10 __ ADC P3 
33ee : e6 49 __ INC T3 + 0 
.l1:
33f0 : 85 10 __ STA P3 
33f2 : a5 49 __ LDA T3 + 0 
33f4 : a0 0d __ LDY #$0d
33f6 : d1 43 __ CMP (T0 + 0),y 
33f8 : 90 c6 __ BCC $33c0 ; (vdcwin_cpy_viewport.s2 + 0)
.s4:
33fa : a0 02 __ LDY #$02
33fc : b1 43 __ LDA (T0 + 0),y 
33fe : 85 45 __ STA T1 + 0 
3400 : 85 03 __ STA WORK + 0 
3402 : c8 __ __ INY
3403 : b1 43 __ LDA (T0 + 0),y 
3405 : 85 46 __ STA T1 + 1 
3407 : 85 04 __ STA WORK + 1 
3409 : a0 08 __ LDY #$08
340b : b1 43 __ LDA (T0 + 0),y 
340d : 85 1b __ STA ACCU + 0 
340f : c8 __ __ INY
3410 : b1 43 __ LDA (T0 + 0),y 
3412 : 85 1c __ STA ACCU + 1 
3414 : 20 fd 34 JSR $34fd ; (mul16 + 0)
3417 : a0 00 __ LDY #$00
3419 : 84 49 __ STY T3 + 0 
341b : b1 43 __ LDA (T0 + 0),y 
341d : 18 __ __ CLC
341e : 65 05 __ ADC WORK + 2 
3420 : aa __ __ TAX
3421 : c8 __ __ INY
3422 : b1 43 __ LDA (T0 + 0),y 
3424 : 65 06 __ ADC WORK + 3 
3426 : 85 48 __ STA T2 + 1 
3428 : 8a __ __ TXA
3429 : 18 __ __ CLC
342a : a0 06 __ LDY #$06
342c : 71 43 __ ADC (T0 + 0),y 
342e : 85 47 __ STA T2 + 0 
3430 : a5 48 __ LDA T2 + 1 
3432 : c8 __ __ INY
3433 : 71 43 __ ADC (T0 + 0),y 
3435 : 85 48 __ STA T2 + 1 
3437 : a0 04 __ LDY #$04
3439 : b1 43 __ LDA (T0 + 0),y 
343b : 85 1b __ STA ACCU + 0 
343d : c8 __ __ INY
343e : b1 43 __ LDA (T0 + 0),y 
3440 : 85 1c __ STA ACCU + 1 
3442 : a5 45 __ LDA T1 + 0 
3444 : 85 03 __ STA WORK + 0 
3446 : a5 46 __ LDA T1 + 1 
3448 : 85 04 __ STA WORK + 1 
344a : 20 fd 34 JSR $34fd ; (mul16 + 0)
344d : 18 __ __ CLC
344e : a5 47 __ LDA T2 + 0 
3450 : 65 05 __ ADC WORK + 2 
3452 : aa __ __ TAX
3453 : a5 48 __ LDA T2 + 1 
3455 : 65 06 __ ADC WORK + 3 
3457 : a8 __ __ TAY
3458 : 8a __ __ TXA
3459 : 18 __ __ CLC
345a : 69 30 __ ADC #$30
345c : 85 45 __ STA T1 + 0 
345e : 90 01 __ BCC $3461 ; (vdcwin_cpy_viewport.s1007 + 0)
.s1006:
3460 : c8 __ __ INY
.s1007:
3461 : 84 46 __ STY T1 + 1 
3463 : a0 12 __ LDY #$12
3465 : b1 43 __ LDA (T0 + 0),y 
3467 : aa __ __ TAX
3468 : c8 __ __ INY
3469 : b1 43 __ LDA (T0 + 0),y 
346b : 4c 9e 34 JMP $349e ; (vdcwin_cpy_viewport.l5 + 0)
.s6:
346e : 86 0f __ STX P2 
3470 : a5 45 __ LDA T1 + 0 
3472 : 85 11 __ STA P4 
3474 : a5 46 __ LDA T1 + 1 
3476 : 85 12 __ STA P5 
3478 : 88 __ __ DEY
3479 : b1 15 __ LDA (P8),y ; (viewport + 0)
347b : 85 13 __ STA P6 
347d : 20 7a 2e JSR $2e7a ; (vdc_cpytovdc@proxy + 0)
3480 : a5 45 __ LDA T1 + 0 
3482 : 18 __ __ CLC
3483 : a0 02 __ LDY #$02
3485 : 71 15 __ ADC (P8),y ; (viewport + 0)
3487 : 85 45 __ STA T1 + 0 
3489 : a5 46 __ LDA T1 + 1 
348b : c8 __ __ INY
348c : 71 15 __ ADC (P8),y ; (viewport + 0)
348e : 85 46 __ STA T1 + 1 
3490 : ad c7 36 LDA $36c7 ; (vdc_state + 3)
3493 : 18 __ __ CLC
3494 : 65 0f __ ADC P2 
3496 : aa __ __ TAX
3497 : ad c8 36 LDA $36c8 ; (vdc_state + 4)
349a : 65 10 __ ADC P3 
349c : e6 49 __ INC T3 + 0 
.l5:
349e : 85 10 __ STA P3 
34a0 : a5 49 __ LDA T3 + 0 
34a2 : a0 0d __ LDY #$0d
34a4 : d1 15 __ CMP (P8),y ; (viewport + 0)
34a6 : 90 c6 __ BCC $346e ; (vdcwin_cpy_viewport.s6 + 0)
.s1001:
34a8 : 60 __ __ RTS
--------------------------------------------------------------------
34a9 : __ __ __ BYT 47 45 4e 45 52 41 54 45 44 20 57 49 54 48 20 56 : GENERATED WITH V
34b9 : __ __ __ BYT 44 43 53 45 20 56 45 52 53 49 4f 4e 20 25 53 0a : DCSE VERSION %S.
34c9 : __ __ __ BYT 0d 00                                           : ..
--------------------------------------------------------------------
34cb : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 31 33 2d 32 33 35 : V20-20240413-235
34db : __ __ __ BYT 30 00                                           : 0.
--------------------------------------------------------------------
mul16by8: ; mul16by8
34dd : a0 00 __ LDY #$00
34df : 84 06 __ STY WORK + 3 
34e1 : 4a __ __ LSR
34e2 : 90 0d __ BCC $34f1 ; (mul16by8 + 20)
34e4 : aa __ __ TAX
34e5 : 18 __ __ CLC
34e6 : 98 __ __ TYA
34e7 : 65 1b __ ADC ACCU + 0 
34e9 : a8 __ __ TAY
34ea : a5 06 __ LDA WORK + 3 
34ec : 65 1c __ ADC ACCU + 1 
34ee : 85 06 __ STA WORK + 3 
34f0 : 8a __ __ TXA
34f1 : 06 1b __ ASL ACCU + 0 
34f3 : 26 1c __ ROL ACCU + 1 
34f5 : 4a __ __ LSR
34f6 : b0 ec __ BCS $34e4 ; (mul16by8 + 7)
34f8 : d0 f7 __ BNE $34f1 ; (mul16by8 + 20)
34fa : 84 05 __ STY WORK + 2 
34fc : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
34fd : a0 00 __ LDY #$00
34ff : 84 06 __ STY WORK + 3 
3501 : a5 03 __ LDA WORK + 0 
3503 : a6 04 __ LDX WORK + 1 
3505 : f0 1c __ BEQ $3523 ; (mul16 + 38)
3507 : 38 __ __ SEC
3508 : 6a __ __ ROR
3509 : 90 0d __ BCC $3518 ; (mul16 + 27)
350b : aa __ __ TAX
350c : 18 __ __ CLC
350d : 98 __ __ TYA
350e : 65 1b __ ADC ACCU + 0 
3510 : a8 __ __ TAY
3511 : a5 06 __ LDA WORK + 3 
3513 : 65 1c __ ADC ACCU + 1 
3515 : 85 06 __ STA WORK + 3 
3517 : 8a __ __ TXA
3518 : 06 1b __ ASL ACCU + 0 
351a : 26 1c __ ROL ACCU + 1 
351c : 4a __ __ LSR
351d : 90 f9 __ BCC $3518 ; (mul16 + 27)
351f : d0 ea __ BNE $350b ; (mul16 + 14)
3521 : a5 04 __ LDA WORK + 1 
3523 : 4a __ __ LSR
3524 : 90 0d __ BCC $3533 ; (mul16 + 54)
3526 : aa __ __ TAX
3527 : 18 __ __ CLC
3528 : 98 __ __ TYA
3529 : 65 1b __ ADC ACCU + 0 
352b : a8 __ __ TAY
352c : a5 06 __ LDA WORK + 3 
352e : 65 1c __ ADC ACCU + 1 
3530 : 85 06 __ STA WORK + 3 
3532 : 8a __ __ TXA
3533 : 06 1b __ ASL ACCU + 0 
3535 : 26 1c __ ROL ACCU + 1 
3537 : 4a __ __ LSR
3538 : b0 ec __ BCS $3526 ; (mul16 + 41)
353a : d0 f7 __ BNE $3533 ; (mul16 + 54)
353c : 84 05 __ STY WORK + 2 
353e : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
353f : a5 1c __ LDA ACCU + 1 
3541 : d0 31 __ BNE $3574 ; (divmod + 53)
3543 : a5 04 __ LDA WORK + 1 
3545 : d0 1e __ BNE $3565 ; (divmod + 38)
3547 : 85 06 __ STA WORK + 3 
3549 : a2 04 __ LDX #$04
354b : 06 1b __ ASL ACCU + 0 
354d : 2a __ __ ROL
354e : c5 03 __ CMP WORK + 0 
3550 : 90 02 __ BCC $3554 ; (divmod + 21)
3552 : e5 03 __ SBC WORK + 0 
3554 : 26 1b __ ROL ACCU + 0 
3556 : 2a __ __ ROL
3557 : c5 03 __ CMP WORK + 0 
3559 : 90 02 __ BCC $355d ; (divmod + 30)
355b : e5 03 __ SBC WORK + 0 
355d : 26 1b __ ROL ACCU + 0 
355f : ca __ __ DEX
3560 : d0 eb __ BNE $354d ; (divmod + 14)
3562 : 85 05 __ STA WORK + 2 
3564 : 60 __ __ RTS
3565 : a5 1b __ LDA ACCU + 0 
3567 : 85 05 __ STA WORK + 2 
3569 : a5 1c __ LDA ACCU + 1 
356b : 85 06 __ STA WORK + 3 
356d : a9 00 __ LDA #$00
356f : 85 1b __ STA ACCU + 0 
3571 : 85 1c __ STA ACCU + 1 
3573 : 60 __ __ RTS
3574 : a5 04 __ LDA WORK + 1 
3576 : d0 1f __ BNE $3597 ; (divmod + 88)
3578 : a5 03 __ LDA WORK + 0 
357a : 30 1b __ BMI $3597 ; (divmod + 88)
357c : a9 00 __ LDA #$00
357e : 85 06 __ STA WORK + 3 
3580 : a2 10 __ LDX #$10
3582 : 06 1b __ ASL ACCU + 0 
3584 : 26 1c __ ROL ACCU + 1 
3586 : 2a __ __ ROL
3587 : c5 03 __ CMP WORK + 0 
3589 : 90 02 __ BCC $358d ; (divmod + 78)
358b : e5 03 __ SBC WORK + 0 
358d : 26 1b __ ROL ACCU + 0 
358f : 26 1c __ ROL ACCU + 1 
3591 : ca __ __ DEX
3592 : d0 f2 __ BNE $3586 ; (divmod + 71)
3594 : 85 05 __ STA WORK + 2 
3596 : 60 __ __ RTS
3597 : a9 00 __ LDA #$00
3599 : 85 05 __ STA WORK + 2 
359b : 85 06 __ STA WORK + 3 
359d : 84 02 __ STY $02 
359f : a0 10 __ LDY #$10
35a1 : 18 __ __ CLC
35a2 : 26 1b __ ROL ACCU + 0 
35a4 : 26 1c __ ROL ACCU + 1 
35a6 : 26 05 __ ROL WORK + 2 
35a8 : 26 06 __ ROL WORK + 3 
35aa : 38 __ __ SEC
35ab : a5 05 __ LDA WORK + 2 
35ad : e5 03 __ SBC WORK + 0 
35af : aa __ __ TAX
35b0 : a5 06 __ LDA WORK + 3 
35b2 : e5 04 __ SBC WORK + 1 
35b4 : 90 04 __ BCC $35ba ; (divmod + 123)
35b6 : 86 05 __ STX WORK + 2 
35b8 : 85 06 __ STA WORK + 3 
35ba : 88 __ __ DEY
35bb : d0 e5 __ BNE $35a2 ; (divmod + 99)
35bd : 26 1b __ ROL ACCU + 0 
35bf : 26 1c __ ROL ACCU + 1 
35c1 : a4 02 __ LDY $02 
35c3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
35c4 : 84 02 __ STY $02 
35c6 : a0 20 __ LDY #$20
35c8 : a9 00 __ LDA #$00
35ca : 85 07 __ STA WORK + 4 
35cc : 85 08 __ STA WORK + 5 
35ce : 85 09 __ STA WORK + 6 
35d0 : 85 0a __ STA WORK + 7 
35d2 : a5 05 __ LDA WORK + 2 
35d4 : 05 06 __ ORA WORK + 3 
35d6 : d0 78 __ BNE $3650 ; (divmod32 + 140)
35d8 : a5 04 __ LDA WORK + 1 
35da : d0 27 __ BNE $3603 ; (divmod32 + 63)
35dc : 18 __ __ CLC
35dd : 26 1b __ ROL ACCU + 0 
35df : 26 1c __ ROL ACCU + 1 
35e1 : 26 1d __ ROL ACCU + 2 
35e3 : 26 1e __ ROL ACCU + 3 
35e5 : 2a __ __ ROL
35e6 : 90 05 __ BCC $35ed ; (divmod32 + 41)
35e8 : e5 03 __ SBC WORK + 0 
35ea : 38 __ __ SEC
35eb : b0 06 __ BCS $35f3 ; (divmod32 + 47)
35ed : c5 03 __ CMP WORK + 0 
35ef : 90 02 __ BCC $35f3 ; (divmod32 + 47)
35f1 : e5 03 __ SBC WORK + 0 
35f3 : 88 __ __ DEY
35f4 : d0 e7 __ BNE $35dd ; (divmod32 + 25)
35f6 : 85 07 __ STA WORK + 4 
35f8 : 26 1b __ ROL ACCU + 0 
35fa : 26 1c __ ROL ACCU + 1 
35fc : 26 1d __ ROL ACCU + 2 
35fe : 26 1e __ ROL ACCU + 3 
3600 : a4 02 __ LDY $02 
3602 : 60 __ __ RTS
3603 : a5 1e __ LDA ACCU + 3 
3605 : d0 10 __ BNE $3617 ; (divmod32 + 83)
3607 : a6 1d __ LDX ACCU + 2 
3609 : 86 1e __ STX ACCU + 3 
360b : a6 1c __ LDX ACCU + 1 
360d : 86 1d __ STX ACCU + 2 
360f : a6 1b __ LDX ACCU + 0 
3611 : 86 1c __ STX ACCU + 1 
3613 : 85 1b __ STA ACCU + 0 
3615 : a0 18 __ LDY #$18
3617 : 18 __ __ CLC
3618 : 26 1b __ ROL ACCU + 0 
361a : 26 1c __ ROL ACCU + 1 
361c : 26 1d __ ROL ACCU + 2 
361e : 26 1e __ ROL ACCU + 3 
3620 : 26 07 __ ROL WORK + 4 
3622 : 26 08 __ ROL WORK + 5 
3624 : 90 0c __ BCC $3632 ; (divmod32 + 110)
3626 : a5 07 __ LDA WORK + 4 
3628 : e5 03 __ SBC WORK + 0 
362a : aa __ __ TAX
362b : a5 08 __ LDA WORK + 5 
362d : e5 04 __ SBC WORK + 1 
362f : 38 __ __ SEC
3630 : b0 0c __ BCS $363e ; (divmod32 + 122)
3632 : 38 __ __ SEC
3633 : a5 07 __ LDA WORK + 4 
3635 : e5 03 __ SBC WORK + 0 
3637 : aa __ __ TAX
3638 : a5 08 __ LDA WORK + 5 
363a : e5 04 __ SBC WORK + 1 
363c : 90 04 __ BCC $3642 ; (divmod32 + 126)
363e : 86 07 __ STX WORK + 4 
3640 : 85 08 __ STA WORK + 5 
3642 : 88 __ __ DEY
3643 : d0 d3 __ BNE $3618 ; (divmod32 + 84)
3645 : 26 1b __ ROL ACCU + 0 
3647 : 26 1c __ ROL ACCU + 1 
3649 : 26 1d __ ROL ACCU + 2 
364b : 26 1e __ ROL ACCU + 3 
364d : a4 02 __ LDY $02 
364f : 60 __ __ RTS
3650 : a0 10 __ LDY #$10
3652 : a5 1e __ LDA ACCU + 3 
3654 : 85 08 __ STA WORK + 5 
3656 : a5 1d __ LDA ACCU + 2 
3658 : 85 07 __ STA WORK + 4 
365a : a9 00 __ LDA #$00
365c : 85 1d __ STA ACCU + 2 
365e : 85 1e __ STA ACCU + 3 
3660 : 18 __ __ CLC
3661 : 26 1b __ ROL ACCU + 0 
3663 : 26 1c __ ROL ACCU + 1 
3665 : 26 07 __ ROL WORK + 4 
3667 : 26 08 __ ROL WORK + 5 
3669 : 26 09 __ ROL WORK + 6 
366b : 26 0a __ ROL WORK + 7 
366d : a5 07 __ LDA WORK + 4 
366f : c5 03 __ CMP WORK + 0 
3671 : a5 08 __ LDA WORK + 5 
3673 : e5 04 __ SBC WORK + 1 
3675 : a5 09 __ LDA WORK + 6 
3677 : e5 05 __ SBC WORK + 2 
3679 : a5 0a __ LDA WORK + 7 
367b : e5 06 __ SBC WORK + 3 
367d : 90 18 __ BCC $3697 ; (divmod32 + 211)
367f : a5 07 __ LDA WORK + 4 
3681 : e5 03 __ SBC WORK + 0 
3683 : 85 07 __ STA WORK + 4 
3685 : a5 08 __ LDA WORK + 5 
3687 : e5 04 __ SBC WORK + 1 
3689 : 85 08 __ STA WORK + 5 
368b : a5 09 __ LDA WORK + 6 
368d : e5 05 __ SBC WORK + 2 
368f : 85 09 __ STA WORK + 6 
3691 : a5 0a __ LDA WORK + 7 
3693 : e5 06 __ SBC WORK + 3 
3695 : 85 0a __ STA WORK + 7 
3697 : 88 __ __ DEY
3698 : d0 c7 __ BNE $3661 ; (divmod32 + 157)
369a : 26 1b __ ROL ACCU + 0 
369c : 26 1c __ ROL ACCU + 1 
369e : a4 02 __ LDY $02 
36a0 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
36a1 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
36a7 : a5 44 __ LDA $44 
36a9 : 85 0e __ STA P1 
36ab : 4c 86 1f JMP $1f86 ; (vdc_mem_addr.s0 + 0)
--------------------------------------------------------------------
spentry:
36ae : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
36af : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 85 89 86 8a 87 8b : ................
36bf : __ __ __ BYT 88 8c 0a 8c                                     : ....
--------------------------------------------------------------------
giocharmap:
36c3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_state:
36c4 : __ __ __ BSS	25
--------------------------------------------------------------------
view:
36dd : __ __ __ BSS	14
--------------------------------------------------------------------
vdc_modes:
3700 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
3710 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
3720 : __ __ __ BYT e7 24 7e ff 50 00 32 00 01 00 00 00 10 00 40 00 : .$~.P.2.......@.
3730 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
3740 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
3750 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
3760 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
3770 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
3780 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
3790 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
37a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
37b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
37c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
37d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
multab:
3800 : __ __ __ BSS	144
