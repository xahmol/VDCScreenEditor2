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
1c13 : 8e ff 33 STX $33ff ; (spentry + 0)
1c16 : a9 80 __ LDA #$80
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 52 __ LDA #$52
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 54 __ LDA #$54
1c21 : e9 52 __ SBC #$52
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
1c35 : a9 a2 __ LDA #$a2
1c37 : e9 80 __ SBC #$80
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
1c50 : a9 87 __ LDA #$87
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 bf __ LDA #$bf
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
1c80 : a2 04 __ LDX #$04
1c82 : b5 53 __ LDA T1 + 0,x 
1c84 : 9d 89 bf STA $bf89,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
1c8a : 38 __ __ SEC
1c8b : a5 23 __ LDA SP + 0 
1c8d : e9 0a __ SBC #$0a
1c8f : 85 23 __ STA SP + 0 
1c91 : b0 02 __ BCS $1c95 ; (main.s0 + 0)
1c93 : c6 24 __ DEC SP + 1 
.s0:
1c95 : a9 00 __ LDA #$00
1c97 : 8d f0 50 STA $50f0 ; (charsetchanged + 0)
1c9a : 8d f1 50 STA $50f1 ; (charsetchanged + 1)
1c9d : a2 15 __ LDX #$15
.l1002:
1c9f : ca __ __ DEX
1ca0 : 9d d8 51 STA $51d8,x ; (filename + 0)
1ca3 : d0 fa __ BNE $1c9f ; (main.l1002 + 0)
.s1003:
1ca5 : a2 0e __ LDX #$0e
.l1004:
1ca7 : ca __ __ DEX
1ca8 : 9d f2 50 STA $50f2,x ; (view + 0)
1cab : d0 fa __ BNE $1ca7 ; (main.l1004 + 0)
.s1005:
1cad : 20 a8 22 JSR $22a8 ; (bnk_init.s1000 + 0)
1cb0 : ad ed 51 LDA $51ed ; (bootdevice + 0)
1cb3 : 8d fe 51 STA $51fe ; (targetdevice + 0)
1cb6 : 20 47 2b JSR $2b47 ; (vdc_init.s1000 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 85 0f __ STA P2 
1cbd : 85 10 __ STA P3 
1cbf : a9 50 __ LDA #$50
1cc1 : 85 11 __ STA P4 
1cc3 : a9 19 __ LDA #$19
1cc5 : 85 12 __ STA P5 
1cc7 : a9 99 __ LDA #$99
1cc9 : 85 0d __ STA P0 
1ccb : a9 52 __ LDA #$52
1ccd : 85 0e __ STA P1 
1ccf : 20 18 31 JSR $3118 ; (vdcwin_init.s0 + 0)
1cd2 : a9 0b __ LDA #$0b
1cd4 : 85 0f __ STA P2 
1cd6 : a9 03 __ LDA #$03
1cd8 : 85 10 __ STA P3 
1cda : a9 3a __ LDA #$3a
1cdc : 85 11 __ STA P4 
1cde : a9 12 __ LDA #$12
1ce0 : 85 12 __ STA P5 
1ce2 : a9 a3 __ LDA #$a3
1ce4 : 85 0d __ STA P0 
1ce6 : a9 52 __ LDA #$52
1ce8 : 85 0e __ STA P1 
1cea : 20 18 31 JSR $3118 ; (vdcwin_init.s0 + 0)
1ced : a9 c5 __ LDA #$c5
1cef : 8d 87 52 STA $5287 ; (vdc_state + 7)
1cf2 : a9 00 __ LDA #$00
1cf4 : 85 0f __ STA P2 
1cf6 : 85 10 __ STA P3 
1cf8 : a9 01 __ LDA #$01
1cfa : 85 13 __ STA P6 
1cfc : 20 84 50 JSR $5084 ; (vdc_clear@proxy + 0)
1cff : a9 00 __ LDA #$00
1d01 : 85 11 __ STA P4 
1d03 : 85 12 __ STA P5 
1d05 : a9 ae __ LDA #$ae
1d07 : 85 13 __ STA P6 
1d09 : a9 33 __ LDA #$33
1d0b : 85 14 __ STA P7 
1d0d : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
1d10 : a9 c4 __ LDA #$c4
1d12 : 8d 87 52 STA $5287 ; (vdc_state + 7)
1d15 : a9 00 __ LDA #$00
1d17 : 85 0f __ STA P2 
1d19 : a9 01 __ LDA #$01
1d1b : 85 10 __ STA P3 
1d1d : 85 13 __ STA P6 
1d1f : 20 84 50 JSR $5084 ; (vdc_clear@proxy + 0)
1d22 : a9 ad __ LDA #$ad
1d24 : a0 02 __ LDY #$02
1d26 : 91 23 __ STA (SP + 0),y 
1d28 : a9 52 __ LDA #$52
1d2a : c8 __ __ INY
1d2b : 91 23 __ STA (SP + 0),y 
1d2d : a9 00 __ LDA #$00
1d2f : c8 __ __ INY
1d30 : 91 23 __ STA (SP + 0),y 
1d32 : a9 34 __ LDA #$34
1d34 : c8 __ __ INY
1d35 : 91 23 __ STA (SP + 0),y 
1d37 : a9 2a __ LDA #$2a
1d39 : c8 __ __ INY
1d3a : 91 23 __ STA (SP + 0),y 
1d3c : a9 34 __ LDA #$34
1d3e : c8 __ __ INY
1d3f : 91 23 __ STA (SP + 0),y 
1d41 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
1d44 : a9 00 __ LDA #$00
1d46 : 85 11 __ STA P4 
1d48 : a9 01 __ LDA #$01
1d4a : 85 12 __ STA P5 
1d4c : 20 71 50 JSR $5071 ; (vdc_prints@proxy + 0)
1d4f : ad fd 4b LDA $4bfd ; (mc_default + 0)
1d52 : 8d 87 52 STA $5287 ; (vdc_state + 7)
1d55 : 20 3c 34 JSR $343c ; (filepicker.s1000 + 0)
1d58 : a9 ad __ LDA #$ad
1d5a : a0 02 __ LDY #$02
1d5c : 91 23 __ STA (SP + 0),y 
1d5e : a9 52 __ LDA #$52
1d60 : c8 __ __ INY
1d61 : 91 23 __ STA (SP + 0),y 
1d63 : a9 06 __ LDA #$06
1d65 : c8 __ __ INY
1d66 : 91 23 __ STA (SP + 0),y 
1d68 : a9 47 __ LDA #$47
1d6a : c8 __ __ INY
1d6b : 91 23 __ STA (SP + 0),y 
1d6d : ad fe 51 LDA $51fe ; (targetdevice + 0)
1d70 : c8 __ __ INY
1d71 : 91 23 __ STA (SP + 0),y 
1d73 : a9 00 __ LDA #$00
1d75 : c8 __ __ INY
1d76 : 91 23 __ STA (SP + 0),y 
1d78 : a9 d8 __ LDA #$d8
1d7a : c8 __ __ INY
1d7b : 91 23 __ STA (SP + 0),y 
1d7d : a9 51 __ LDA #$51
1d7f : c8 __ __ INY
1d80 : 91 23 __ STA (SP + 0),y 
1d82 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
1d85 : a9 00 __ LDA #$00
1d87 : 8d a7 52 STA $52a7 ; (interface + 4)
1d8a : 8d a8 52 STA $52a8 ; (interface + 5)
1d8d : a9 a3 __ LDA #$a3
1d8f : a0 02 __ LDY #$02
1d91 : 91 23 __ STA (SP + 0),y 
1d93 : a9 52 __ LDA #$52
1d95 : c8 __ __ INY
1d96 : 91 23 __ STA (SP + 0),y 
1d98 : a9 0f __ LDA #$0f
1d9a : c8 __ __ INY
1d9b : 91 23 __ STA (SP + 0),y 
1d9d : a9 47 __ LDA #$47
1d9f : c8 __ __ INY
1da0 : 91 23 __ STA (SP + 0),y 
1da2 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
1da5 : a9 a3 __ LDA #$a3
1da7 : a0 02 __ LDY #$02
1da9 : 91 23 __ STA (SP + 0),y 
1dab : a9 52 __ LDA #$52
1dad : c8 __ __ INY
1dae : 91 23 __ STA (SP + 0),y 
1db0 : a9 ad __ LDA #$ad
1db2 : c8 __ __ INY
1db3 : 91 23 __ STA (SP + 0),y 
1db5 : a9 52 __ LDA #$52
1db7 : c8 __ __ INY
1db8 : 91 23 __ STA (SP + 0),y 
1dba : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
1dbd : a9 a3 __ LDA #$a3
1dbf : a0 02 __ LDY #$02
1dc1 : 91 23 __ STA (SP + 0),y 
1dc3 : a9 52 __ LDA #$52
1dc5 : c8 __ __ INY
1dc6 : 91 23 __ STA (SP + 0),y 
1dc8 : a9 1e __ LDA #$1e
1dca : c8 __ __ INY
1dcb : 91 23 __ STA (SP + 0),y 
1dcd : a9 47 __ LDA #$47
1dcf : c8 __ __ INY
1dd0 : 91 23 __ STA (SP + 0),y 
1dd2 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
1dd5 : ad a3 52 LDA $52a3 ; (interface + 0)
1dd8 : 85 15 __ STA P8 
1dda : ad a8 52 LDA $52a8 ; (interface + 5)
1ddd : 18 __ __ CLC
1dde : 6d a4 52 ADC $52a4 ; (interface + 1)
1de1 : 85 16 __ STA P9 
1de3 : a9 db __ LDA #$db
1de5 : 85 17 __ STA P10 
1de7 : a9 50 __ LDA #$50
1de9 : 85 18 __ STA P11 
1deb : 20 44 47 JSR $4744 ; (textInput.s0 + 0)
1dee : a9 ad __ LDA #$ad
1df0 : a0 02 __ LDY #$02
1df2 : 91 23 __ STA (SP + 0),y 
1df4 : a9 52 __ LDA #$52
1df6 : c8 __ __ INY
1df7 : 91 23 __ STA (SP + 0),y 
1df9 : a9 db __ LDA #$db
1dfb : a0 06 __ LDY #$06
1dfd : 91 23 __ STA (SP + 0),y 
1dff : a9 50 __ LDA #$50
1e01 : c8 __ __ INY
1e02 : 91 23 __ STA (SP + 0),y 
1e04 : a9 db __ LDA #$db
1e06 : c8 __ __ INY
1e07 : 91 23 __ STA (SP + 0),y 
1e09 : a9 50 __ LDA #$50
1e0b : c8 __ __ INY
1e0c : 91 23 __ STA (SP + 0),y 
1e0e : a9 84 __ LDA #$84
1e10 : a0 04 __ LDY #$04
1e12 : 91 23 __ STA (SP + 0),y 
1e14 : a9 49 __ LDA #$49
1e16 : c8 __ __ INY
1e17 : 91 23 __ STA (SP + 0),y 
1e19 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
1e1c : a9 ad __ LDA #$ad
1e1e : 85 11 __ STA P4 
1e20 : a9 52 __ LDA #$52
1e22 : 85 12 __ STA P5 
1e24 : 20 8d 49 JSR $498d ; (cmd@proxy + 0)
1e27 : a5 1b __ LDA ACCU + 0 
1e29 : c9 3f __ CMP #$3f
1e2b : d0 1b __ BNE $1e48 ; (main.s4 + 0)
.s3:
1e2d : a9 a3 __ LDA #$a3
1e2f : a0 02 __ LDY #$02
1e31 : 91 23 __ STA (SP + 0),y 
1e33 : a9 52 __ LDA #$52
1e35 : c8 __ __ INY
1e36 : 91 23 __ STA (SP + 0),y 
1e38 : a9 4e __ LDA #$4e
1e3a : c8 __ __ INY
1e3b : 91 23 __ STA (SP + 0),y 
1e3d : a9 4a __ LDA #$4a
1e3f : c8 __ __ INY
1e40 : 91 23 __ STA (SP + 0),y 
1e42 : 20 f4 40 JSR $40f4 ; (vdcwin_put_string.s1000 + 0)
1e45 : 4c 35 22 JMP $2235 ; (main.l6 + 0)
.s4:
1e48 : 09 00 __ ORA #$00
1e4a : f0 07 __ BEQ $1e53 ; (main.s5 + 0)
.s15:
1e4c : c9 3e __ CMP #$3e
1e4e : f0 03 __ BEQ $1e53 ; (main.s5 + 0)
.s12:
1e50 : 20 d2 4a JSR $4ad2 ; (error_message.s1000 + 0)
.s5:
1e53 : a9 a3 __ LDA #$a3
1e55 : a0 02 __ LDY #$02
1e57 : 91 23 __ STA (SP + 0),y 
1e59 : a9 52 __ LDA #$52
1e5b : c8 __ __ INY
1e5c : 91 23 __ STA (SP + 0),y 
1e5e : a9 5e __ LDA #$5e
1e60 : c8 __ __ INY
1e61 : 91 23 __ STA (SP + 0),y 
1e63 : a9 4b __ LDA #$4b
1e65 : c8 __ __ INY
1e66 : 91 23 __ STA (SP + 0),y 
1e68 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
1e6b : a9 00 __ LDA #$00
1e6d : 85 10 __ STA P3 
1e6f : ad fe 51 LDA $51fe ; (targetdevice + 0)
1e72 : 85 0f __ STA P2 
1e74 : a9 93 __ LDA #$93
1e76 : 85 11 __ STA P4 
1e78 : a9 bf __ LDA #$bf
1e7a : 85 12 __ STA P5 
1e7c : a9 d8 __ LDA #$d8
1e7e : 85 13 __ STA P6 
1e80 : a9 51 __ LDA #$51
1e82 : 85 14 __ STA P7 
1e84 : 20 11 0c JSR $0c11 ; (bnk_load.s0 + 0)
1e87 : a5 1b __ LDA ACCU + 0 
1e89 : d0 03 __ BNE $1e8e ; (main.s18 + 0)
.s16:
1e8b : 20 d2 4a JSR $4ad2 ; (error_message.s1000 + 0)
.s18:
1e8e : a9 d8 __ LDA #$d8
1e90 : 85 0d __ STA P0 
1e92 : a9 51 __ LDA #$51
1e94 : 85 0e __ STA P1 
1e96 : ad 93 bf LDA $bf93 ; (projbuffer + 0)
1e99 : 8d f0 50 STA $50f0 ; (charsetchanged + 0)
1e9c : ad 94 bf LDA $bf94 ; (projbuffer + 1)
1e9f : 8d f1 50 STA $50f1 ; (charsetchanged + 1)
1ea2 : ad 98 bf LDA $bf98 ; (projbuffer + 5)
1ea5 : 85 03 __ STA WORK + 0 
1ea7 : 8d f8 50 STA $50f8 ; (view + 6)
1eaa : ad 97 bf LDA $bf97 ; (projbuffer + 4)
1ead : 85 04 __ STA WORK + 1 
1eaf : 8d f9 50 STA $50f9 ; (view + 7)
1eb2 : ad 9a bf LDA $bf9a ; (projbuffer + 7)
1eb5 : 85 1b __ STA ACCU + 0 
1eb7 : ad 99 bf LDA $bf99 ; (projbuffer + 6)
1eba : 85 1c __ STA ACCU + 1 
1ebc : 20 dd 4c JSR $4cdd ; (mul16 + 0)
1ebf : a5 05 __ LDA WORK + 2 
1ec1 : 85 54 __ STA T3 + 0 
1ec3 : 8d fc 50 STA $50fc ; (view + 10)
1ec6 : a5 06 __ LDA WORK + 3 
1ec8 : 85 55 __ STA T3 + 1 
1eca : 8d fd 50 STA $50fd ; (view + 11)
1ecd : ad 9a bf LDA $bf9a ; (projbuffer + 7)
1ed0 : 8d fa 50 STA $50fa ; (view + 8)
1ed3 : ad 99 bf LDA $bf99 ; (projbuffer + 6)
1ed6 : 8d fb 50 STA $50fb ; (view + 9)
1ed9 : ad 9d bf LDA $bf9d ; (projbuffer + 10)
1edc : 8d ff 50 STA $50ff ; (view + 13)
1edf : ad a9 bf LDA $bfa9 ; (projbuffer + 22)
1ee2 : 8d fe 50 STA $50fe ; (view + 12)
1ee5 : 20 51 33 JSR $3351 ; (strlen.s0 + 0)
1ee8 : a9 00 __ LDA #$00
1eea : a6 1b __ LDX ACCU + 0 
1eec : 9d d3 51 STA $51d3,x ; (vdc_modes + 211)
1eef : 06 54 __ ASL T3 + 0 
1ef1 : 26 55 __ ROL T3 + 1 
1ef3 : 18 __ __ CLC
1ef4 : a9 30 __ LDA #$30
1ef6 : 65 54 __ ADC T3 + 0 
1ef8 : 85 54 __ STA T3 + 0 
1efa : a9 40 __ LDA #$40
1efc : 65 55 __ ADC T3 + 1 
1efe : 85 55 __ STA T3 + 1 
1f00 : a9 bf __ LDA #$bf
1f02 : c5 55 __ CMP T3 + 1 
1f04 : d0 04 __ BNE $1f0a ; (main.s1011 + 0)
.s1010:
1f06 : a9 ff __ LDA #$ff
1f08 : c5 54 __ CMP T3 + 0 
.s1011:
1f0a : b0 03 __ BCS $1f0f ; (main.s21 + 0)
.s19:
1f0c : 20 79 4b JSR $4b79 ; (too_big.s1000 + 0)
.s21:
1f0f : a9 00 __ LDA #$00
1f11 : 8d f2 50 STA $50f2 ; (view + 0)
1f14 : a9 40 __ LDA #$40
1f16 : 8d f3 50 STA $50f3 ; (view + 1)
1f19 : ad f0 50 LDA $50f0 ; (charsetchanged + 0)
1f1c : f0 24 __ BEQ $1f42 ; (main.s87 + 0)
.s22:
1f1e : 18 __ __ CLC
1f1f : a5 55 __ LDA T3 + 1 
1f21 : 69 08 __ ADC #$08
1f23 : 85 57 __ STA T5 + 1 
1f25 : a9 bf __ LDA #$bf
1f27 : c5 57 __ CMP T5 + 1 
1f29 : d0 04 __ BNE $1f2f ; (main.s1009 + 0)
.s1008:
1f2b : a9 ff __ LDA #$ff
1f2d : c5 54 __ CMP T3 + 0 
.s1009:
1f2f : b0 03 __ BCS $1f34 ; (main.s27 + 0)
.s25:
1f31 : 20 79 4b JSR $4b79 ; (too_big.s1000 + 0)
.s27:
1f34 : a5 54 __ LDA T3 + 0 
1f36 : 8d f4 50 STA $50f4 ; (view + 2)
1f39 : a5 55 __ LDA T3 + 1 
1f3b : 8d f5 50 STA $50f5 ; (view + 3)
1f3e : a5 57 __ LDA T5 + 1 
1f40 : 85 55 __ STA T3 + 1 
.s87:
1f42 : ad f1 50 LDA $50f1 ; (charsetchanged + 1)
1f45 : f0 24 __ BEQ $1f6b ; (main.s30 + 0)
.s28:
1f47 : 18 __ __ CLC
1f48 : a5 55 __ LDA T3 + 1 
1f4a : 69 08 __ ADC #$08
1f4c : 85 57 __ STA T5 + 1 
1f4e : a9 bf __ LDA #$bf
1f50 : c5 57 __ CMP T5 + 1 
1f52 : d0 04 __ BNE $1f58 ; (main.s1007 + 0)
.s1006:
1f54 : a9 ff __ LDA #$ff
1f56 : c5 54 __ CMP T3 + 0 
.s1007:
1f58 : b0 03 __ BCS $1f5d ; (main.s33 + 0)
.s31:
1f5a : 20 79 4b JSR $4b79 ; (too_big.s1000 + 0)
.s33:
1f5d : a5 54 __ LDA T3 + 0 
1f5f : 8d f6 50 STA $50f6 ; (view + 4)
1f62 : a5 55 __ LDA T3 + 1 
1f64 : 8d f7 50 STA $50f7 ; (view + 5)
1f67 : a5 57 __ LDA T5 + 1 
1f69 : 85 55 __ STA T3 + 1 
.s30:
1f6b : a9 01 __ LDA #$01
1f6d : a0 06 __ LDY #$06
1f6f : 91 23 __ STA (SP + 0),y 
1f71 : a9 1c __ LDA #$1c
1f73 : c8 __ __ INY
1f74 : 91 23 __ STA (SP + 0),y 
1f76 : a9 ad __ LDA #$ad
1f78 : a0 02 __ LDY #$02
1f7a : 91 23 __ STA (SP + 0),y 
1f7c : a9 52 __ LDA #$52
1f7e : c8 __ __ INY
1f7f : 91 23 __ STA (SP + 0),y 
1f81 : a9 bb __ LDA #$bb
1f83 : c8 __ __ INY
1f84 : 91 23 __ STA (SP + 0),y 
1f86 : a9 4b __ LDA #$4b
1f88 : c8 __ __ INY
1f89 : 91 23 __ STA (SP + 0),y 
1f8b : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
1f8e : a9 a3 __ LDA #$a3
1f90 : a0 02 __ LDY #$02
1f92 : 91 23 __ STA (SP + 0),y 
1f94 : a9 52 __ LDA #$52
1f96 : c8 __ __ INY
1f97 : 91 23 __ STA (SP + 0),y 
1f99 : a9 ad __ LDA #$ad
1f9b : c8 __ __ INY
1f9c : 91 23 __ STA (SP + 0),y 
1f9e : a9 52 __ LDA #$52
1fa0 : c8 __ __ INY
1fa1 : 91 23 __ STA (SP + 0),y 
1fa3 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
1fa6 : ad ed 51 LDA $51ed ; (bootdevice + 0)
1fa9 : 85 0f __ STA P2 
1fab : a9 01 __ LDA #$01
1fad : 85 10 __ STA P3 
1faf : 85 11 __ STA P4 
1fb1 : a9 1c __ LDA #$1c
1fb3 : 85 12 __ STA P5 
1fb5 : a9 df __ LDA #$df
1fb7 : 85 13 __ STA P6 
1fb9 : a9 4b __ LDA #$4b
1fbb : 85 14 __ STA P7 
1fbd : 20 11 0c JSR $0c11 ; (bnk_load.s0 + 0)
1fc0 : a5 1b __ LDA ACCU + 0 
1fc2 : d0 03 __ BNE $1fc7 ; (main.s36 + 0)
.s34:
1fc4 : 20 d2 4a JSR $4ad2 ; (error_message.s1000 + 0)
.s36:
1fc7 : a9 ad __ LDA #$ad
1fc9 : a0 02 __ LDY #$02
1fcb : 91 23 __ STA (SP + 0),y 
1fcd : a9 52 __ LDA #$52
1fcf : c8 __ __ INY
1fd0 : 91 23 __ STA (SP + 0),y 
1fd2 : a9 de __ LDA #$de
1fd4 : a0 06 __ LDY #$06
1fd6 : 91 23 __ STA (SP + 0),y 
1fd8 : a9 36 __ LDA #$36
1fda : c8 __ __ INY
1fdb : 91 23 __ STA (SP + 0),y 
1fdd : a9 00 __ LDA #$00
1fdf : a0 04 __ LDY #$04
1fe1 : 91 23 __ STA (SP + 0),y 
1fe3 : a9 4c __ LDA #$4c
1fe5 : c8 __ __ INY
1fe6 : 91 23 __ STA (SP + 0),y 
1fe8 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
1feb : a9 a3 __ LDA #$a3
1fed : a0 02 __ LDY #$02
1fef : 91 23 __ STA (SP + 0),y 
1ff1 : a9 52 __ LDA #$52
1ff3 : c8 __ __ INY
1ff4 : 91 23 __ STA (SP + 0),y 
1ff6 : a9 ad __ LDA #$ad
1ff8 : c8 __ __ INY
1ff9 : 91 23 __ STA (SP + 0),y 
1ffb : a9 52 __ LDA #$52
1ffd : c8 __ __ INY
1ffe : 91 23 __ STA (SP + 0),y 
2000 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
2003 : a9 f2 __ LDA #$f2
2005 : 85 0f __ STA P2 
2007 : a9 50 __ LDA #$50
2009 : 85 10 __ STA P3 
200b : 20 46 0c JSR $0c46 ; (bnk_memcpy.s0 + 0)
200e : a9 ad __ LDA #$ad
2010 : a0 02 __ LDY #$02
2012 : 91 23 __ STA (SP + 0),y 
2014 : a9 52 __ LDA #$52
2016 : c8 __ __ INY
2017 : 91 23 __ STA (SP + 0),y 
2019 : a9 21 __ LDA #$21
201b : c8 __ __ INY
201c : 91 23 __ STA (SP + 0),y 
201e : a9 4c __ LDA #$4c
2020 : c8 __ __ INY
2021 : 91 23 __ STA (SP + 0),y 
2023 : ad f2 50 LDA $50f2 ; (view + 0)
2026 : c8 __ __ INY
2027 : 91 23 __ STA (SP + 0),y 
2029 : ad f3 50 LDA $50f3 ; (view + 1)
202c : c8 __ __ INY
202d : 91 23 __ STA (SP + 0),y 
202f : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
2032 : a9 a3 __ LDA #$a3
2034 : a0 02 __ LDY #$02
2036 : 91 23 __ STA (SP + 0),y 
2038 : a9 52 __ LDA #$52
203a : c8 __ __ INY
203b : 91 23 __ STA (SP + 0),y 
203d : a9 ad __ LDA #$ad
203f : c8 __ __ INY
2040 : 91 23 __ STA (SP + 0),y 
2042 : a9 52 __ LDA #$52
2044 : c8 __ __ INY
2045 : 91 23 __ STA (SP + 0),y 
2047 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
204a : a9 ad __ LDA #$ad
204c : a0 02 __ LDY #$02
204e : 91 23 __ STA (SP + 0),y 
2050 : a9 52 __ LDA #$52
2052 : c8 __ __ INY
2053 : 91 23 __ STA (SP + 0),y 
2055 : a9 d8 __ LDA #$d8
2057 : a0 06 __ LDY #$06
2059 : 91 23 __ STA (SP + 0),y 
205b : a9 51 __ LDA #$51
205d : c8 __ __ INY
205e : 91 23 __ STA (SP + 0),y 
2060 : a9 ec __ LDA #$ec
2062 : a0 04 __ LDY #$04
2064 : 91 23 __ STA (SP + 0),y 
2066 : a9 4b __ LDA #$4b
2068 : c8 __ __ INY
2069 : 91 23 __ STA (SP + 0),y 
206b : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
206e : ad f2 50 LDA $50f2 ; (view + 0)
2071 : 85 11 __ STA P4 
2073 : ad f3 50 LDA $50f3 ; (view + 1)
2076 : 85 12 __ STA P5 
2078 : 20 00 0c JSR $0c00 ; (bnk_load@proxy + 0)
207b : a5 1b __ LDA ACCU + 0 
207d : d0 03 __ BNE $2082 ; (main.s91 + 0)
.s37:
207f : 20 d2 4a JSR $4ad2 ; (error_message.s1000 + 0)
.s91:
2082 : ad f0 50 LDA $50f0 ; (charsetchanged + 0)
2085 : f0 03 __ BEQ $208a ; (main.s93 + 0)
2087 : 4c bb 21 JMP $21bb ; (main.s40 + 0)
.s93:
208a : ad f1 50 LDA $50f1 ; (charsetchanged + 1)
208d : f0 03 __ BEQ $2092 ; (main.s48 + 0)
208f : 4c 41 21 JMP $2141 ; (main.s46 + 0)
.s48:
2092 : a9 ad __ LDA #$ad
2094 : a0 02 __ LDY #$02
2096 : 91 23 __ STA (SP + 0),y 
2098 : a9 52 __ LDA #$52
209a : c8 __ __ INY
209b : 91 23 __ STA (SP + 0),y 
209d : a9 8c __ LDA #$8c
209f : c8 __ __ INY
20a0 : 91 23 __ STA (SP + 0),y 
20a2 : a9 4c __ LDA #$4c
20a4 : c8 __ __ INY
20a5 : 91 23 __ STA (SP + 0),y 
20a7 : 38 __ __ SEC
20a8 : a5 55 __ LDA T3 + 1 
20aa : e9 40 __ SBC #$40
20ac : a0 07 __ LDY #$07
20ae : 91 23 __ STA (SP + 0),y 
20b0 : a5 54 __ LDA T3 + 0 
20b2 : 88 __ __ DEY
20b3 : 91 23 __ STA (SP + 0),y 
20b5 : a9 db __ LDA #$db
20b7 : a0 08 __ LDY #$08
20b9 : 91 23 __ STA (SP + 0),y 
20bb : a9 50 __ LDA #$50
20bd : c8 __ __ INY
20be : 91 23 __ STA (SP + 0),y 
20c0 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
20c3 : a9 a3 __ LDA #$a3
20c5 : a0 02 __ LDY #$02
20c7 : 91 23 __ STA (SP + 0),y 
20c9 : a9 52 __ LDA #$52
20cb : c8 __ __ INY
20cc : 91 23 __ STA (SP + 0),y 
20ce : a9 ad __ LDA #$ad
20d0 : c8 __ __ INY
20d1 : 91 23 __ STA (SP + 0),y 
20d3 : a9 52 __ LDA #$52
20d5 : c8 __ __ INY
20d6 : 91 23 __ STA (SP + 0),y 
20d8 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
20db : a5 54 __ LDA T3 + 0 
20dd : 85 13 __ STA P6 
20df : a5 55 __ LDA T3 + 1 
20e1 : 85 14 __ STA P7 
20e3 : a9 db __ LDA #$db
20e5 : 85 15 __ STA P8 
20e7 : a9 50 __ LDA #$50
20e9 : 85 16 __ STA P9 
20eb : ad fe 51 LDA $51fe ; (targetdevice + 0)
20ee : 85 12 __ STA P5 
20f0 : 20 7e 0c JSR $0c7e ; (bnk_save.s0 + 0)
20f3 : a5 1b __ LDA ACCU + 0 
20f5 : d0 03 __ BNE $20fa ; (main.s54 + 0)
.s52:
20f7 : 20 d2 4a JSR $4ad2 ; (error_message.s1000 + 0)
.s54:
20fa : a9 a3 __ LDA #$a3
20fc : a0 02 __ LDY #$02
20fe : 91 23 __ STA (SP + 0),y 
2100 : a9 52 __ LDA #$52
2102 : c8 __ __ INY
2103 : 91 23 __ STA (SP + 0),y 
2105 : a9 c0 __ LDA #$c0
2107 : c8 __ __ INY
2108 : 91 23 __ STA (SP + 0),y 
210a : a9 4c __ LDA #$4c
210c : c8 __ __ INY
210d : 91 23 __ STA (SP + 0),y 
210f : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
2112 : 20 b4 2d JSR $2db4 ; (getch.s0 + 0)
2115 : a9 00 __ LDA #$00
2117 : 20 fa 2d JSR $2dfa ; (fastmode.s0 + 0)
211a : 20 19 2e JSR $2e19 ; (vdc_set_mode@proxy + 0)
211d : 20 85 2c JSR $2c85 ; (vdc_cls.s0 + 0)
2120 : a9 04 __ LDA #$04
2122 : 8d 06 d5 STA $d506 
2125 : a9 00 __ LDA #$00
2127 : 85 1b __ STA ACCU + 0 
2129 : 85 1c __ STA ACCU + 1 
.s1001:
212b : 18 __ __ CLC
212c : a5 23 __ LDA SP + 0 
212e : 69 0a __ ADC #$0a
2130 : 85 23 __ STA SP + 0 
2132 : 90 02 __ BCC $2136 ; (main.s1001 + 11)
2134 : e6 24 __ INC SP + 1 
2136 : a2 04 __ LDX #$04
2138 : bd 89 bf LDA $bf89,x ; (main@stack + 0)
213b : 95 53 __ STA T1 + 0,x 
213d : ca __ __ DEX
213e : 10 f8 __ BPL $2138 ; (main.s1001 + 13)
2140 : 60 __ __ RTS
.s46:
2141 : a9 ad __ LDA #$ad
2143 : a0 02 __ LDY #$02
2145 : 91 23 __ STA (SP + 0),y 
2147 : a9 52 __ LDA #$52
2149 : c8 __ __ INY
214a : 91 23 __ STA (SP + 0),y 
214c : a9 63 __ LDA #$63
214e : c8 __ __ INY
214f : 91 23 __ STA (SP + 0),y 
2151 : a9 4c __ LDA #$4c
2153 : c8 __ __ INY
2154 : 91 23 __ STA (SP + 0),y 
2156 : ad f6 50 LDA $50f6 ; (view + 4)
2159 : c8 __ __ INY
215a : 91 23 __ STA (SP + 0),y 
215c : ad f7 50 LDA $50f7 ; (view + 5)
215f : c8 __ __ INY
2160 : 91 23 __ STA (SP + 0),y 
2162 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
2165 : a9 a3 __ LDA #$a3
2167 : a0 02 __ LDY #$02
2169 : 91 23 __ STA (SP + 0),y 
216b : a9 52 __ LDA #$52
216d : c8 __ __ INY
216e : 91 23 __ STA (SP + 0),y 
2170 : a9 ad __ LDA #$ad
2172 : c8 __ __ INY
2173 : 91 23 __ STA (SP + 0),y 
2175 : a9 52 __ LDA #$52
2177 : c8 __ __ INY
2178 : 91 23 __ STA (SP + 0),y 
217a : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
217d : a9 ad __ LDA #$ad
217f : a0 02 __ LDY #$02
2181 : 91 23 __ STA (SP + 0),y 
2183 : a9 52 __ LDA #$52
2185 : c8 __ __ INY
2186 : 91 23 __ STA (SP + 0),y 
2188 : a9 d8 __ LDA #$d8
218a : a0 06 __ LDY #$06
218c : 91 23 __ STA (SP + 0),y 
218e : a9 51 __ LDA #$51
2190 : c8 __ __ INY
2191 : 91 23 __ STA (SP + 0),y 
2193 : a9 84 __ LDA #$84
2195 : a0 04 __ LDY #$04
2197 : 91 23 __ STA (SP + 0),y 
2199 : a9 4c __ LDA #$4c
219b : c8 __ __ INY
219c : 91 23 __ STA (SP + 0),y 
219e : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
21a1 : ad f6 50 LDA $50f6 ; (view + 4)
21a4 : 85 11 __ STA P4 
21a6 : ad f7 50 LDA $50f7 ; (view + 5)
21a9 : 85 12 __ STA P5 
21ab : 20 00 0c JSR $0c00 ; (bnk_load@proxy + 0)
21ae : a5 1b __ LDA ACCU + 0 
21b0 : f0 03 __ BEQ $21b5 ; (main.s49 + 0)
21b2 : 4c 92 20 JMP $2092 ; (main.s48 + 0)
.s49:
21b5 : 20 d2 4a JSR $4ad2 ; (error_message.s1000 + 0)
21b8 : 4c 92 20 JMP $2092 ; (main.s48 + 0)
.s40:
21bb : a9 ad __ LDA #$ad
21bd : a0 02 __ LDY #$02
21bf : 91 23 __ STA (SP + 0),y 
21c1 : a9 52 __ LDA #$52
21c3 : c8 __ __ INY
21c4 : 91 23 __ STA (SP + 0),y 
21c6 : a9 42 __ LDA #$42
21c8 : c8 __ __ INY
21c9 : 91 23 __ STA (SP + 0),y 
21cb : a9 4c __ LDA #$4c
21cd : c8 __ __ INY
21ce : 91 23 __ STA (SP + 0),y 
21d0 : ad f4 50 LDA $50f4 ; (view + 2)
21d3 : c8 __ __ INY
21d4 : 91 23 __ STA (SP + 0),y 
21d6 : ad f5 50 LDA $50f5 ; (view + 3)
21d9 : c8 __ __ INY
21da : 91 23 __ STA (SP + 0),y 
21dc : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
21df : a9 a3 __ LDA #$a3
21e1 : a0 02 __ LDY #$02
21e3 : 91 23 __ STA (SP + 0),y 
21e5 : a9 52 __ LDA #$52
21e7 : c8 __ __ INY
21e8 : 91 23 __ STA (SP + 0),y 
21ea : a9 ad __ LDA #$ad
21ec : c8 __ __ INY
21ed : 91 23 __ STA (SP + 0),y 
21ef : a9 52 __ LDA #$52
21f1 : c8 __ __ INY
21f2 : 91 23 __ STA (SP + 0),y 
21f4 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
21f7 : a9 ad __ LDA #$ad
21f9 : a0 02 __ LDY #$02
21fb : 91 23 __ STA (SP + 0),y 
21fd : a9 52 __ LDA #$52
21ff : c8 __ __ INY
2200 : 91 23 __ STA (SP + 0),y 
2202 : a9 d8 __ LDA #$d8
2204 : a0 06 __ LDY #$06
2206 : 91 23 __ STA (SP + 0),y 
2208 : a9 51 __ LDA #$51
220a : c8 __ __ INY
220b : 91 23 __ STA (SP + 0),y 
220d : a9 f4 __ LDA #$f4
220f : a0 04 __ LDY #$04
2211 : 91 23 __ STA (SP + 0),y 
2213 : a9 4b __ LDA #$4b
2215 : c8 __ __ INY
2216 : 91 23 __ STA (SP + 0),y 
2218 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
221b : ad f4 50 LDA $50f4 ; (view + 2)
221e : 85 11 __ STA P4 
2220 : ad f5 50 LDA $50f5 ; (view + 3)
2223 : 85 12 __ STA P5 
2225 : 20 00 0c JSR $0c00 ; (bnk_load@proxy + 0)
2228 : a5 1b __ LDA ACCU + 0 
222a : f0 03 __ BEQ $222f ; (main.s43 + 0)
222c : 4c 8a 20 JMP $208a ; (main.s93 + 0)
.s43:
222f : 20 d2 4a JSR $4ad2 ; (error_message.s1000 + 0)
2232 : 4c 8a 20 JMP $208a ; (main.s93 + 0)
.l6:
2235 : 20 b1 46 JSR $46b1 ; (vdcwin_getch.s0 + 0)
2238 : a5 1b __ LDA ACCU + 0 
223a : 85 53 __ STA T1 + 0 
223c : c9 59 __ CMP #$59
223e : f0 04 __ BEQ $2244 ; (main.s7 + 0)
.s8:
2240 : c9 4e __ CMP #$4e
2242 : d0 f1 __ BNE $2235 ; (main.l6 + 0)
.s7:
2244 : a5 1b __ LDA ACCU + 0 
2246 : 8d f8 bf STA $bff8 ; (sstack + 0)
2249 : a9 a3 __ LDA #$a3
224b : 85 17 __ STA P10 
224d : a9 52 __ LDA #$52
224f : 85 18 __ STA P11 
2251 : 20 b2 3f JSR $3fb2 ; (vdcwin_put_char.s1000 + 0)
2254 : a9 a3 __ LDA #$a3
2256 : a0 02 __ LDY #$02
2258 : 91 23 __ STA (SP + 0),y 
225a : a9 52 __ LDA #$52
225c : c8 __ __ INY
225d : 91 23 __ STA (SP + 0),y 
225f : a9 ff __ LDA #$ff
2261 : c8 __ __ INY
2262 : 91 23 __ STA (SP + 0),y 
2264 : a9 2a __ LDA #$2a
2266 : c8 __ __ INY
2267 : 91 23 __ STA (SP + 0),y 
2269 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
226c : a5 53 __ LDA T1 + 0 
226e : c9 59 __ CMP #$59
2270 : f0 06 __ BEQ $2278 ; (main.s9 + 0)
.s10:
2272 : 20 7a 4a JSR $4a7a ; (prg_exit.s1000 + 0)
2275 : 4c 53 1e JMP $1e53 ; (main.s5 + 0)
.s9:
2278 : a9 51 __ LDA #$51
227a : a0 02 __ LDY #$02
227c : 91 23 __ STA (SP + 0),y 
227e : a9 54 __ LDA #$54
2280 : c8 __ __ INY
2281 : 91 23 __ STA (SP + 0),y 
2283 : a9 75 __ LDA #$75
2285 : c8 __ __ INY
2286 : 91 23 __ STA (SP + 0),y 
2288 : a9 4a __ LDA #$4a
228a : c8 __ __ INY
228b : 91 23 __ STA (SP + 0),y 
228d : a9 db __ LDA #$db
228f : c8 __ __ INY
2290 : 91 23 __ STA (SP + 0),y 
2292 : a9 50 __ LDA #$50
2294 : c8 __ __ INY
2295 : 91 23 __ STA (SP + 0),y 
2297 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
229a : a9 51 __ LDA #$51
229c : 85 11 __ STA P4 
229e : a9 54 __ LDA #$54
22a0 : 85 12 __ STA P5 
22a2 : 20 8d 49 JSR $498d ; (cmd@proxy + 0)
22a5 : 4c 53 1e JMP $1e53 ; (main.s5 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
22a8 : 38 __ __ SEC
22a9 : a5 23 __ LDA SP + 0 
22ab : e9 06 __ SBC #$06
22ad : 85 23 __ STA SP + 0 
22af : b0 02 __ BCS $22b3 ; (bnk_init.s0 + 0)
22b1 : c6 24 __ DEC SP + 1 
.s0:
22b3 : a9 1c __ LDA #$1c
22b5 : a0 02 __ LDY #$02
22b7 : 91 23 __ STA (SP + 0),y 
22b9 : a9 2a __ LDA #$2a
22bb : c8 __ __ INY
22bc : 91 23 __ STA (SP + 0),y 
22be : a5 ba __ LDA $ba 
22c0 : d0 02 __ BNE $22c4 ; (bnk_init.s1002 + 0)
.s2:
22c2 : a9 08 __ LDA #$08
.s1002:
22c4 : 8d ed 51 STA $51ed ; (bootdevice + 0)
22c7 : a0 04 __ LDY #$04
22c9 : 91 23 __ STA (SP + 0),y 
22cb : a9 00 __ LDA #$00
22cd : c8 __ __ INY
22ce : 91 23 __ STA (SP + 0),y 
22d0 : 20 f5 22 JSR $22f5 ; (printf.s0 + 0)
22d3 : a9 05 __ LDA #$05
22d5 : 8d 06 d5 STA $d506 
22d8 : a9 2c __ LDA #$2c
22da : a0 02 __ LDY #$02
22dc : 91 23 __ STA (SP + 0),y 
22de : a9 2a __ LDA #$2a
22e0 : c8 __ __ INY
22e1 : 91 23 __ STA (SP + 0),y 
22e3 : 20 f5 22 JSR $22f5 ; (printf.s0 + 0)
22e6 : 20 46 2a JSR $2a46 ; (load_overlay.s1000 + 0)
.s1001:
22e9 : 18 __ __ CLC
22ea : a5 23 __ LDA SP + 0 
22ec : 69 06 __ ADC #$06
22ee : 85 23 __ STA SP + 0 
22f0 : 90 02 __ BCC $22f4 ; (bnk_init.s1001 + 11)
22f2 : e6 24 __ INC SP + 1 
22f4 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22f5 : a9 01 __ LDA #$01
22f7 : 8d fc bf STA $bffc ; (sstack + 4)
22fa : a9 aa __ LDA #$aa
22fc : 85 16 __ STA P9 
22fe : a9 bf __ LDA #$bf
2300 : 85 17 __ STA P10 
2302 : a0 02 __ LDY #$02
2304 : b1 23 __ LDA (SP + 0),y 
2306 : 8d f8 bf STA $bff8 ; (sstack + 0)
2309 : c8 __ __ INY
230a : b1 23 __ LDA (SP + 0),y 
230c : 8d f9 bf STA $bff9 ; (sstack + 1)
230f : 18 __ __ CLC
2310 : a5 23 __ LDA SP + 0 
2312 : 69 04 __ ADC #$04
2314 : 8d fa bf STA $bffa ; (sstack + 2)
2317 : a5 24 __ LDA SP + 1 
2319 : 69 00 __ ADC #$00
231b : 8d fb bf STA $bffb ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
231e : a5 53 __ LDA T7 + 0 
2320 : 8d dc bf STA $bfdc ; (sformat@stack + 0)
2323 : a5 54 __ LDA T7 + 1 
2325 : 8d dd bf STA $bfdd ; (sformat@stack + 1)
2328 : a5 55 __ LDA T7 + 2 
232a : 8d de bf STA $bfde ; (sformat@stack + 2)
.s0:
232d : a9 00 __ LDA #$00
232f : 85 47 __ STA T0 + 0 
2331 : ad f8 bf LDA $bff8 ; (sstack + 0)
2334 : 85 49 __ STA T1 + 0 
2336 : ad f9 bf LDA $bff9 ; (sstack + 1)
2339 : 85 4a __ STA T1 + 1 
.l1:
233b : a0 00 __ LDY #$00
233d : b1 49 __ LDA (T1 + 0),y 
233f : d0 3c __ BNE $237d ; (sformat.s2 + 0)
.s3:
2341 : a4 47 __ LDY T0 + 0 
2343 : 91 16 __ STA (P9),y ; (buff + 0)
2345 : 98 __ __ TYA
2346 : f0 1d __ BEQ $2365 ; (sformat.s1070 + 0)
.s116:
2348 : ad fc bf LDA $bffc ; (sstack + 4)
234b : d0 0d __ BNE $235a ; (sformat.s119 + 0)
.s120:
234d : 18 __ __ CLC
234e : a5 16 __ LDA P9 ; (buff + 0)
2350 : 65 47 __ ADC T0 + 0 
2352 : aa __ __ TAX
2353 : a5 17 __ LDA P10 ; (buff + 1)
2355 : 69 00 __ ADC #$00
2357 : 4c 69 23 JMP $2369 ; (sformat.s1001 + 0)
.s119:
235a : a5 16 __ LDA P9 ; (buff + 0)
235c : 85 0d __ STA P0 
235e : a5 17 __ LDA P10 ; (buff + 1)
2360 : 85 0e __ STA P1 
2362 : 20 1f 27 JSR $271f ; (puts.s0 + 0)
.s1070:
2365 : a5 17 __ LDA P10 ; (buff + 1)
2367 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
2369 : 86 1b __ STX ACCU + 0 ; (fps + 0)
236b : 85 1c __ STA ACCU + 1 ; (fps + 1)
236d : ad dc bf LDA $bfdc ; (sformat@stack + 0)
2370 : 85 53 __ STA T7 + 0 
2372 : ad dd bf LDA $bfdd ; (sformat@stack + 1)
2375 : 85 54 __ STA T7 + 1 
2377 : ad de bf LDA $bfde ; (sformat@stack + 2)
237a : 85 55 __ STA T7 + 2 
237c : 60 __ __ RTS
.s2:
237d : c9 25 __ CMP #$25
237f : f0 3f __ BEQ $23c0 ; (sformat.s4 + 0)
.s5:
2381 : a4 47 __ LDY T0 + 0 
2383 : 91 16 __ STA (P9),y ; (buff + 0)
2385 : e6 49 __ INC T1 + 0 
2387 : d0 02 __ BNE $238b ; (sformat.s1098 + 0)
.s1097:
2389 : e6 4a __ INC T1 + 1 
.s1098:
238b : c8 __ __ INY
238c : 84 47 __ STY T0 + 0 
238e : 98 __ __ TYA
238f : c0 28 __ CPY #$28
2391 : 90 a8 __ BCC $233b ; (sformat.l1 + 0)
.s110:
2393 : 85 4c __ STA T5 + 0 
2395 : a9 00 __ LDA #$00
2397 : 85 47 __ STA T0 + 0 
2399 : ad fc bf LDA $bffc ; (sstack + 4)
239c : f0 14 __ BEQ $23b2 ; (sformat.s114 + 0)
.s113:
239e : a5 16 __ LDA P9 ; (buff + 0)
23a0 : 85 0d __ STA P0 
23a2 : a5 17 __ LDA P10 ; (buff + 1)
23a4 : 85 0e __ STA P1 
23a6 : a9 00 __ LDA #$00
23a8 : a4 4c __ LDY T5 + 0 
23aa : 91 16 __ STA (P9),y ; (buff + 0)
23ac : 20 1f 27 JSR $271f ; (puts.s0 + 0)
23af : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s114:
23b2 : 18 __ __ CLC
23b3 : a5 16 __ LDA P9 ; (buff + 0)
23b5 : 65 4c __ ADC T5 + 0 
23b7 : 85 16 __ STA P9 ; (buff + 0)
23b9 : 90 80 __ BCC $233b ; (sformat.l1 + 0)
.s1099:
23bb : e6 17 __ INC P10 ; (buff + 1)
23bd : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s4:
23c0 : a5 47 __ LDA T0 + 0 
23c2 : f0 27 __ BEQ $23eb ; (sformat.s9 + 0)
.s7:
23c4 : 84 47 __ STY T0 + 0 
23c6 : 85 4c __ STA T5 + 0 
23c8 : ad fc bf LDA $bffc ; (sstack + 4)
23cb : f0 13 __ BEQ $23e0 ; (sformat.s11 + 0)
.s10:
23cd : a5 16 __ LDA P9 ; (buff + 0)
23cf : 85 0d __ STA P0 
23d1 : a5 17 __ LDA P10 ; (buff + 1)
23d3 : 85 0e __ STA P1 
23d5 : 98 __ __ TYA
23d6 : a4 4c __ LDY T5 + 0 
23d8 : 91 16 __ STA (P9),y ; (buff + 0)
23da : 20 1f 27 JSR $271f ; (puts.s0 + 0)
23dd : 4c eb 23 JMP $23eb ; (sformat.s9 + 0)
.s11:
23e0 : 18 __ __ CLC
23e1 : a5 16 __ LDA P9 ; (buff + 0)
23e3 : 65 4c __ ADC T5 + 0 
23e5 : 85 16 __ STA P9 ; (buff + 0)
23e7 : 90 02 __ BCC $23eb ; (sformat.s9 + 0)
.s1095:
23e9 : e6 17 __ INC P10 ; (buff + 1)
.s9:
23eb : a9 0a __ LDA #$0a
23ed : 8d e3 bf STA $bfe3 ; (si + 3)
23f0 : a9 00 __ LDA #$00
23f2 : 8d e4 bf STA $bfe4 ; (si + 4)
23f5 : 8d e5 bf STA $bfe5 ; (si + 5)
23f8 : 8d e6 bf STA $bfe6 ; (si + 6)
23fb : 8d e7 bf STA $bfe7 ; (si + 7)
23fe : a0 01 __ LDY #$01
2400 : b1 49 __ LDA (T1 + 0),y 
2402 : a2 20 __ LDX #$20
2404 : 8e e0 bf STX $bfe0 ; (si + 0)
2407 : a2 00 __ LDX #$00
2409 : 8e e1 bf STX $bfe1 ; (si + 1)
240c : ca __ __ DEX
240d : 8e e2 bf STX $bfe2 ; (si + 2)
2410 : aa __ __ TAX
2411 : 18 __ __ CLC
2412 : a5 49 __ LDA T1 + 0 
2414 : 69 02 __ ADC #$02
.l14:
2416 : 85 49 __ STA T1 + 0 
2418 : 90 02 __ BCC $241c ; (sformat.s1082 + 0)
.s1081:
241a : e6 4a __ INC T1 + 1 
.s1082:
241c : 8a __ __ TXA
241d : e0 2b __ CPX #$2b
241f : d0 08 __ BNE $2429 ; (sformat.s17 + 0)
.s16:
2421 : a9 01 __ LDA #$01
2423 : 8d e5 bf STA $bfe5 ; (si + 5)
2426 : 4c 0a 27 JMP $270a ; (sformat.s264 + 0)
.s17:
2429 : c9 30 __ CMP #$30
242b : d0 06 __ BNE $2433 ; (sformat.s20 + 0)
.s19:
242d : 8d e0 bf STA $bfe0 ; (si + 0)
2430 : 4c 0a 27 JMP $270a ; (sformat.s264 + 0)
.s20:
2433 : c9 23 __ CMP #$23
2435 : d0 08 __ BNE $243f ; (sformat.s23 + 0)
.s22:
2437 : a9 01 __ LDA #$01
2439 : 8d e7 bf STA $bfe7 ; (si + 7)
243c : 4c 0a 27 JMP $270a ; (sformat.s264 + 0)
.s23:
243f : c9 2d __ CMP #$2d
2441 : d0 08 __ BNE $244b ; (sformat.s15 + 0)
.s25:
2443 : a9 01 __ LDA #$01
2445 : 8d e6 bf STA $bfe6 ; (si + 6)
2448 : 4c 0a 27 JMP $270a ; (sformat.s264 + 0)
.s15:
244b : 85 4c __ STA T5 + 0 
244d : c9 30 __ CMP #$30
244f : 90 55 __ BCC $24a6 ; (sformat.s31 + 0)
.s32:
2451 : c9 3a __ CMP #$3a
2453 : b0 51 __ BCS $24a6 ; (sformat.s31 + 0)
.s29:
2455 : a9 00 __ LDA #$00
2457 : 85 44 __ STA T6 + 0 
2459 : 85 45 __ STA T6 + 1 
245b : e0 3a __ CPX #$3a
245d : b0 40 __ BCS $249f ; (sformat.s35 + 0)
.l34:
245f : a5 44 __ LDA T6 + 0 
2461 : 0a __ __ ASL
2462 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2464 : a5 45 __ LDA T6 + 1 
2466 : 2a __ __ ROL
2467 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2469 : 2a __ __ ROL
246a : aa __ __ TAX
246b : 18 __ __ CLC
246c : a5 1b __ LDA ACCU + 0 ; (fps + 0)
246e : 65 44 __ ADC T6 + 0 
2470 : 85 44 __ STA T6 + 0 
2472 : 8a __ __ TXA
2473 : 65 45 __ ADC T6 + 1 
2475 : 06 44 __ ASL T6 + 0 
2477 : 2a __ __ ROL
2478 : aa __ __ TAX
2479 : 18 __ __ CLC
247a : a5 44 __ LDA T6 + 0 
247c : 65 4c __ ADC T5 + 0 
247e : 90 01 __ BCC $2481 ; (sformat.s1092 + 0)
.s1091:
2480 : e8 __ __ INX
.s1092:
2481 : 38 __ __ SEC
2482 : e9 30 __ SBC #$30
2484 : 85 44 __ STA T6 + 0 
2486 : 8a __ __ TXA
2487 : e9 00 __ SBC #$00
2489 : 85 45 __ STA T6 + 1 
248b : a0 00 __ LDY #$00
248d : b1 49 __ LDA (T1 + 0),y 
248f : 85 4c __ STA T5 + 0 
2491 : e6 49 __ INC T1 + 0 
2493 : d0 02 __ BNE $2497 ; (sformat.s1094 + 0)
.s1093:
2495 : e6 4a __ INC T1 + 1 
.s1094:
2497 : c9 30 __ CMP #$30
2499 : 90 04 __ BCC $249f ; (sformat.s35 + 0)
.s36:
249b : c9 3a __ CMP #$3a
249d : 90 c0 __ BCC $245f ; (sformat.l34 + 0)
.s35:
249f : a5 44 __ LDA T6 + 0 
24a1 : 8d e1 bf STA $bfe1 ; (si + 1)
24a4 : a5 4c __ LDA T5 + 0 
.s31:
24a6 : c9 2e __ CMP #$2e
24a8 : d0 51 __ BNE $24fb ; (sformat.s39 + 0)
.s37:
24aa : a9 00 __ LDA #$00
24ac : 85 44 __ STA T6 + 0 
.l243:
24ae : 85 45 __ STA T6 + 1 
24b0 : a0 00 __ LDY #$00
24b2 : b1 49 __ LDA (T1 + 0),y 
24b4 : 85 4c __ STA T5 + 0 
24b6 : e6 49 __ INC T1 + 0 
24b8 : d0 02 __ BNE $24bc ; (sformat.s1084 + 0)
.s1083:
24ba : e6 4a __ INC T1 + 1 
.s1084:
24bc : c9 30 __ CMP #$30
24be : 90 04 __ BCC $24c4 ; (sformat.s42 + 0)
.s43:
24c0 : c9 3a __ CMP #$3a
24c2 : 90 0a __ BCC $24ce ; (sformat.s41 + 0)
.s42:
24c4 : a5 44 __ LDA T6 + 0 
24c6 : 8d e2 bf STA $bfe2 ; (si + 2)
24c9 : a5 4c __ LDA T5 + 0 
24cb : 4c fb 24 JMP $24fb ; (sformat.s39 + 0)
.s41:
24ce : a5 44 __ LDA T6 + 0 
24d0 : 0a __ __ ASL
24d1 : 85 1b __ STA ACCU + 0 ; (fps + 0)
24d3 : a5 45 __ LDA T6 + 1 
24d5 : 2a __ __ ROL
24d6 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24d8 : 2a __ __ ROL
24d9 : aa __ __ TAX
24da : 18 __ __ CLC
24db : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24dd : 65 44 __ ADC T6 + 0 
24df : 85 44 __ STA T6 + 0 
24e1 : 8a __ __ TXA
24e2 : 65 45 __ ADC T6 + 1 
24e4 : 06 44 __ ASL T6 + 0 
24e6 : 2a __ __ ROL
24e7 : aa __ __ TAX
24e8 : 18 __ __ CLC
24e9 : a5 44 __ LDA T6 + 0 
24eb : 65 4c __ ADC T5 + 0 
24ed : 90 01 __ BCC $24f0 ; (sformat.s1090 + 0)
.s1089:
24ef : e8 __ __ INX
.s1090:
24f0 : 38 __ __ SEC
24f1 : e9 30 __ SBC #$30
24f3 : 85 44 __ STA T6 + 0 
24f5 : 8a __ __ TXA
24f6 : e9 00 __ SBC #$00
24f8 : 4c ae 24 JMP $24ae ; (sformat.l243 + 0)
.s39:
24fb : c9 64 __ CMP #$64
24fd : f0 04 __ BEQ $2503 ; (sformat.s44 + 0)
.s47:
24ff : c9 44 __ CMP #$44
2501 : d0 05 __ BNE $2508 ; (sformat.s45 + 0)
.s44:
2503 : a9 01 __ LDA #$01
2505 : 4c ce 26 JMP $26ce ; (sformat.s261 + 0)
.s45:
2508 : c9 75 __ CMP #$75
250a : d0 03 __ BNE $250f ; (sformat.s51 + 0)
250c : 4c cc 26 JMP $26cc ; (sformat.s291 + 0)
.s51:
250f : c9 55 __ CMP #$55
2511 : d0 03 __ BNE $2516 ; (sformat.s49 + 0)
2513 : 4c cc 26 JMP $26cc ; (sformat.s291 + 0)
.s49:
2516 : c9 78 __ CMP #$78
2518 : f0 04 __ BEQ $251e ; (sformat.s52 + 0)
.s55:
251a : c9 58 __ CMP #$58
251c : d0 0d __ BNE $252b ; (sformat.s53 + 0)
.s52:
251e : a9 10 __ LDA #$10
2520 : 8d e3 bf STA $bfe3 ; (si + 3)
2523 : a9 00 __ LDA #$00
2525 : 8d e4 bf STA $bfe4 ; (si + 4)
2528 : 4c cc 26 JMP $26cc ; (sformat.s291 + 0)
.s53:
252b : c9 6c __ CMP #$6c
252d : d0 03 __ BNE $2532 ; (sformat.s59 + 0)
252f : 4c 43 26 JMP $2643 ; (sformat.s56 + 0)
.s59:
2532 : c9 4c __ CMP #$4c
2534 : d0 03 __ BNE $2539 ; (sformat.s57 + 0)
2536 : 4c 43 26 JMP $2643 ; (sformat.s56 + 0)
.s57:
2539 : c9 73 __ CMP #$73
253b : f0 54 __ BEQ $2591 ; (sformat.s72 + 0)
.s75:
253d : c9 53 __ CMP #$53
253f : f0 50 __ BEQ $2591 ; (sformat.s72 + 0)
.s73:
2541 : c9 63 __ CMP #$63
2543 : f0 23 __ BEQ $2568 ; (sformat.s103 + 0)
.s106:
2545 : c9 43 __ CMP #$43
2547 : f0 1f __ BEQ $2568 ; (sformat.s103 + 0)
.s104:
2549 : 09 00 __ ORA #$00
254b : d0 03 __ BNE $2550 ; (sformat.s107 + 0)
254d : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s107:
2550 : 18 __ __ CLC
2551 : a5 16 __ LDA P9 ; (buff + 0)
2553 : 65 47 __ ADC T0 + 0 
2555 : 85 44 __ STA T6 + 0 
2557 : a5 17 __ LDA P10 ; (buff + 1)
2559 : 69 00 __ ADC #$00
255b : 85 45 __ STA T6 + 1 
255d : a5 4c __ LDA T5 + 0 
.s1068:
255f : a0 00 __ LDY #$00
2561 : 91 44 __ STA (T6 + 0),y 
2563 : e6 47 __ INC T0 + 0 
2565 : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s103:
2568 : ad fa bf LDA $bffa ; (sstack + 2)
256b : 85 4c __ STA T5 + 0 
256d : 18 __ __ CLC
256e : 69 02 __ ADC #$02
2570 : 8d fa bf STA $bffa ; (sstack + 2)
2573 : ad fb bf LDA $bffb ; (sstack + 3)
2576 : 85 4d __ STA T5 + 1 
2578 : 69 00 __ ADC #$00
257a : 8d fb bf STA $bffb ; (sstack + 3)
257d : 18 __ __ CLC
257e : a5 16 __ LDA P9 ; (buff + 0)
2580 : 65 47 __ ADC T0 + 0 
2582 : 85 44 __ STA T6 + 0 
2584 : a5 17 __ LDA P10 ; (buff + 1)
2586 : 69 00 __ ADC #$00
2588 : 85 45 __ STA T6 + 1 
258a : a0 00 __ LDY #$00
258c : b1 4c __ LDA (T5 + 0),y 
258e : 4c 5f 25 JMP $255f ; (sformat.s1068 + 0)
.s72:
2591 : ad fa bf LDA $bffa ; (sstack + 2)
2594 : 85 4c __ STA T5 + 0 
2596 : 18 __ __ CLC
2597 : 69 02 __ ADC #$02
2599 : 8d fa bf STA $bffa ; (sstack + 2)
259c : ad fb bf LDA $bffb ; (sstack + 3)
259f : 85 4d __ STA T5 + 1 
25a1 : 69 00 __ ADC #$00
25a3 : 8d fb bf STA $bffb ; (sstack + 3)
25a6 : a0 00 __ LDY #$00
25a8 : 84 4b __ STY T3 + 0 
25aa : b1 4c __ LDA (T5 + 0),y 
25ac : aa __ __ TAX
25ad : c8 __ __ INY
25ae : b1 4c __ LDA (T5 + 0),y 
25b0 : 86 4c __ STX T5 + 0 
25b2 : 85 4d __ STA T5 + 1 
25b4 : ad e1 bf LDA $bfe1 ; (si + 1)
25b7 : f0 0c __ BEQ $25c5 ; (sformat.s78 + 0)
.s1073:
25b9 : 88 __ __ DEY
25ba : b1 4c __ LDA (T5 + 0),y 
25bc : f0 05 __ BEQ $25c3 ; (sformat.s1074 + 0)
.l80:
25be : c8 __ __ INY
25bf : b1 4c __ LDA (T5 + 0),y 
25c1 : d0 fb __ BNE $25be ; (sformat.l80 + 0)
.s1074:
25c3 : 84 4b __ STY T3 + 0 
.s78:
25c5 : ad e6 bf LDA $bfe6 ; (si + 6)
25c8 : d0 19 __ BNE $25e3 ; (sformat.s84 + 0)
.s1077:
25ca : a6 4b __ LDX T3 + 0 
25cc : ec e1 bf CPX $bfe1 ; (si + 1)
25cf : a4 47 __ LDY T0 + 0 
25d1 : b0 0c __ BCS $25df ; (sformat.s1078 + 0)
.l86:
25d3 : ad e0 bf LDA $bfe0 ; (si + 0)
25d6 : 91 16 __ STA (P9),y ; (buff + 0)
25d8 : e8 __ __ INX
25d9 : ec e1 bf CPX $bfe1 ; (si + 1)
25dc : c8 __ __ INY
25dd : 90 f4 __ BCC $25d3 ; (sformat.l86 + 0)
.s1078:
25df : 86 4b __ STX T3 + 0 
25e1 : 84 47 __ STY T0 + 0 
.s84:
25e3 : ad fc bf LDA $bffc ; (sstack + 4)
25e6 : d0 37 __ BNE $261f ; (sformat.s88 + 0)
.l94:
25e8 : a0 00 __ LDY #$00
25ea : b1 4c __ LDA (T5 + 0),y 
25ec : f0 0f __ BEQ $25fd ; (sformat.s251 + 0)
.s95:
25ee : a4 47 __ LDY T0 + 0 
25f0 : 91 16 __ STA (P9),y ; (buff + 0)
25f2 : e6 47 __ INC T0 + 0 
25f4 : e6 4c __ INC T5 + 0 
25f6 : d0 f0 __ BNE $25e8 ; (sformat.l94 + 0)
.s1087:
25f8 : e6 4d __ INC T5 + 1 
25fa : 4c e8 25 JMP $25e8 ; (sformat.l94 + 0)
.s251:
25fd : ad e6 bf LDA $bfe6 ; (si + 6)
2600 : d0 03 __ BNE $2605 ; (sformat.s1075 + 0)
2602 : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s1075:
2605 : a6 4b __ LDX T3 + 0 
2607 : ec e1 bf CPX $bfe1 ; (si + 1)
260a : a4 47 __ LDY T0 + 0 
260c : b0 0c __ BCS $261a ; (sformat.s1076 + 0)
.l101:
260e : ad e0 bf LDA $bfe0 ; (si + 0)
2611 : 91 16 __ STA (P9),y ; (buff + 0)
2613 : e8 __ __ INX
2614 : ec e1 bf CPX $bfe1 ; (si + 1)
2617 : c8 __ __ INY
2618 : 90 f4 __ BCC $260e ; (sformat.l101 + 0)
.s1076:
261a : 84 47 __ STY T0 + 0 
261c : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s88:
261f : a5 47 __ LDA T0 + 0 
2621 : f0 1a __ BEQ $263d ; (sformat.s93 + 0)
.s91:
2623 : a5 16 __ LDA P9 ; (buff + 0)
2625 : 85 0d __ STA P0 
2627 : a5 17 __ LDA P10 ; (buff + 1)
2629 : 85 0e __ STA P1 
262b : a9 00 __ LDA #$00
262d : a4 47 __ LDY T0 + 0 
262f : 91 16 __ STA (P9),y ; (buff + 0)
2631 : 20 1f 27 JSR $271f ; (puts.s0 + 0)
2634 : 20 17 27 JSR $2717 ; (puts@proxy + 0)
2637 : a9 00 __ LDA #$00
2639 : 85 47 __ STA T0 + 0 
263b : f0 c0 __ BEQ $25fd ; (sformat.s251 + 0)
.s93:
263d : 20 17 27 JSR $2717 ; (puts@proxy + 0)
2640 : 4c fd 25 JMP $25fd ; (sformat.s251 + 0)
.s56:
2643 : ad fa bf LDA $bffa ; (sstack + 2)
2646 : 85 4c __ STA T5 + 0 
2648 : 18 __ __ CLC
2649 : 69 04 __ ADC #$04
264b : 8d fa bf STA $bffa ; (sstack + 2)
264e : ad fb bf LDA $bffb ; (sstack + 3)
2651 : 85 4d __ STA T5 + 1 
2653 : 69 00 __ ADC #$00
2655 : 8d fb bf STA $bffb ; (sstack + 3)
2658 : a0 00 __ LDY #$00
265a : b1 49 __ LDA (T1 + 0),y 
265c : aa __ __ TAX
265d : e6 49 __ INC T1 + 0 
265f : d0 02 __ BNE $2663 ; (sformat.s1086 + 0)
.s1085:
2661 : e6 4a __ INC T1 + 1 
.s1086:
2663 : b1 4c __ LDA (T5 + 0),y 
2665 : 85 53 __ STA T7 + 0 
2667 : a0 01 __ LDY #$01
2669 : b1 4c __ LDA (T5 + 0),y 
266b : 85 54 __ STA T7 + 1 
266d : c8 __ __ INY
266e : b1 4c __ LDA (T5 + 0),y 
2670 : 85 55 __ STA T7 + 2 
2672 : c8 __ __ INY
2673 : b1 4c __ LDA (T5 + 0),y 
2675 : a8 __ __ TAY
2676 : 8a __ __ TXA
2677 : e0 64 __ CPX #$64
2679 : f0 04 __ BEQ $267f ; (sformat.s60 + 0)
.s63:
267b : c9 44 __ CMP #$44
267d : d0 04 __ BNE $2683 ; (sformat.s61 + 0)
.s60:
267f : a9 01 __ LDA #$01
2681 : d0 1f __ BNE $26a2 ; (sformat.s262 + 0)
.s61:
2683 : c9 75 __ CMP #$75
2685 : f0 19 __ BEQ $26a0 ; (sformat.s292 + 0)
.s67:
2687 : c9 55 __ CMP #$55
2689 : f0 15 __ BEQ $26a0 ; (sformat.s292 + 0)
.s65:
268b : c9 78 __ CMP #$78
268d : f0 07 __ BEQ $2696 ; (sformat.s68 + 0)
.s71:
268f : c9 58 __ CMP #$58
2691 : f0 03 __ BEQ $2696 ; (sformat.s68 + 0)
2693 : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s68:
2696 : a9 10 __ LDA #$10
2698 : 8d e3 bf STA $bfe3 ; (si + 3)
269b : a9 00 __ LDA #$00
269d : 8d e4 bf STA $bfe4 ; (si + 4)
.s292:
26a0 : a9 00 __ LDA #$00
.s262:
26a2 : 84 14 __ STY P7 
26a4 : 85 15 __ STA P8 
26a6 : a5 16 __ LDA P9 ; (buff + 0)
26a8 : 85 0f __ STA P2 
26aa : a5 17 __ LDA P10 ; (buff + 1)
26ac : 85 10 __ STA P3 
26ae : a5 53 __ LDA T7 + 0 
26b0 : 85 11 __ STA P4 
26b2 : a5 54 __ LDA T7 + 1 
26b4 : 85 12 __ STA P5 
26b6 : a5 55 __ LDA T7 + 2 
26b8 : 85 13 __ STA P6 
26ba : a9 e0 __ LDA #$e0
26bc : 85 0d __ STA P0 
26be : a9 bf __ LDA #$bf
26c0 : 85 0e __ STA P1 
26c2 : 20 a9 28 JSR $28a9 ; (nforml.s0 + 0)
.s1069:
26c5 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26c7 : 85 47 __ STA T0 + 0 
26c9 : 4c 3b 23 JMP $233b ; (sformat.l1 + 0)
.s291:
26cc : a9 00 __ LDA #$00
.s261:
26ce : 85 13 __ STA P6 
26d0 : a5 16 __ LDA P9 ; (buff + 0)
26d2 : 85 0f __ STA P2 
26d4 : a5 17 __ LDA P10 ; (buff + 1)
26d6 : 85 10 __ STA P3 
26d8 : ad fa bf LDA $bffa ; (sstack + 2)
26db : 85 47 __ STA T0 + 0 
26dd : ad fb bf LDA $bffb ; (sstack + 3)
26e0 : 85 48 __ STA T0 + 1 
26e2 : a0 00 __ LDY #$00
26e4 : b1 47 __ LDA (T0 + 0),y 
26e6 : 85 11 __ STA P4 
26e8 : c8 __ __ INY
26e9 : b1 47 __ LDA (T0 + 0),y 
26eb : 85 12 __ STA P5 
26ed : 18 __ __ CLC
26ee : a5 47 __ LDA T0 + 0 
26f0 : 69 02 __ ADC #$02
26f2 : 8d fa bf STA $bffa ; (sstack + 2)
26f5 : a5 48 __ LDA T0 + 1 
26f7 : 69 00 __ ADC #$00
26f9 : 8d fb bf STA $bffb ; (sstack + 3)
26fc : a9 e0 __ LDA #$e0
26fe : 85 0d __ STA P0 
2700 : a9 bf __ LDA #$bf
2702 : 85 0e __ STA P1 
2704 : 20 74 27 JSR $2774 ; (nformi.s0 + 0)
2707 : 4c c5 26 JMP $26c5 ; (sformat.s1069 + 0)
.s264:
270a : a0 00 __ LDY #$00
270c : b1 49 __ LDA (T1 + 0),y 
270e : aa __ __ TAX
270f : 18 __ __ CLC
2710 : a5 49 __ LDA T1 + 0 
2712 : 69 01 __ ADC #$01
2714 : 4c 16 24 JMP $2416 ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
2717 : a5 4c __ LDA $4c 
2719 : 85 0d __ STA P0 
271b : a5 4d __ LDA $4d 
271d : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
271f : a0 00 __ LDY #$00
2721 : b1 0d __ LDA (P0),y 
2723 : f0 0b __ BEQ $2730 ; (puts.s1001 + 0)
2725 : 20 31 27 JSR $2731 ; (putpch + 0)
2728 : e6 0d __ INC P0 
272a : d0 f3 __ BNE $271f ; (puts.s0 + 0)
272c : e6 0e __ INC P1 
272e : d0 ef __ BNE $271f ; (puts.s0 + 0)
.s1001:
2730 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2731 : ae fc 4b LDX $4bfc ; (giocharmap + 0)
2734 : e0 01 __ CPX #$01
2736 : 90 26 __ BCC $275e ; (putpch + 45)
2738 : c9 0a __ CMP #$0a
273a : d0 02 __ BNE $273e ; (putpch + 13)
273c : a9 0d __ LDA #$0d
273e : c9 09 __ CMP #$09
2740 : f0 1f __ BEQ $2761 ; (putpch + 48)
2742 : e0 02 __ CPX #$02
2744 : 90 18 __ BCC $275e ; (putpch + 45)
2746 : c9 41 __ CMP #$41
2748 : 90 14 __ BCC $275e ; (putpch + 45)
274a : c9 7b __ CMP #$7b
274c : b0 10 __ BCS $275e ; (putpch + 45)
274e : c9 61 __ CMP #$61
2750 : b0 04 __ BCS $2756 ; (putpch + 37)
2752 : c9 5b __ CMP #$5b
2754 : b0 08 __ BCS $275e ; (putpch + 45)
2756 : 49 20 __ EOR #$20
2758 : e0 03 __ CPX #$03
275a : f0 02 __ BEQ $275e ; (putpch + 45)
275c : 29 df __ AND #$df
275e : 4c d2 ff JMP $ffd2 
2761 : 38 __ __ SEC
2762 : 20 f0 ff JSR $fff0 
2765 : 98 __ __ TYA
2766 : 29 03 __ AND #$03
2768 : 49 03 __ EOR #$03
276a : aa __ __ TAX
276b : a9 20 __ LDA #$20
276d : 20 d2 ff JSR $ffd2 
2770 : ca __ __ DEX
2771 : 10 fa __ BPL $276d ; (putpch + 60)
2773 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2774 : a9 00 __ LDA #$00
2776 : 85 43 __ STA T0 + 0 
2778 : a5 13 __ LDA P6 ; (s + 0)
277a : f0 13 __ BEQ $278f ; (nformi.s182 + 0)
.s4:
277c : 24 12 __ BIT P5 ; (v + 1)
277e : 10 0f __ BPL $278f ; (nformi.s182 + 0)
.s1:
2780 : 38 __ __ SEC
2781 : a9 00 __ LDA #$00
2783 : e5 11 __ SBC P4 ; (v + 0)
2785 : 85 11 __ STA P4 ; (v + 0)
2787 : a9 00 __ LDA #$00
2789 : e5 12 __ SBC P5 ; (v + 1)
278b : 85 12 __ STA P5 ; (v + 1)
278d : e6 43 __ INC T0 + 0 
.s182:
278f : a9 10 __ LDA #$10
2791 : 85 44 __ STA T2 + 0 
2793 : a5 11 __ LDA P4 ; (v + 0)
2795 : 05 12 __ ORA P5 ; (v + 1)
2797 : f0 46 __ BEQ $27df ; (nformi.s7 + 0)
.s42:
2799 : a0 03 __ LDY #$03
279b : b1 0d __ LDA (P0),y ; (si + 0)
279d : 85 45 __ STA T4 + 0 
279f : c8 __ __ INY
27a0 : b1 0d __ LDA (P0),y ; (si + 0)
27a2 : 85 46 __ STA T4 + 1 
.l6:
27a4 : a5 11 __ LDA P4 ; (v + 0)
27a6 : 85 1b __ STA ACCU + 0 
27a8 : a5 12 __ LDA P5 ; (v + 1)
27aa : 85 1c __ STA ACCU + 1 
27ac : a5 45 __ LDA T4 + 0 
27ae : 85 03 __ STA WORK + 0 
27b0 : a5 46 __ LDA T4 + 1 
27b2 : 85 04 __ STA WORK + 1 
27b4 : 20 1f 4d JSR $4d1f ; (divmod + 0)
27b7 : a5 06 __ LDA WORK + 3 
27b9 : 30 08 __ BMI $27c3 ; (nformi.s78 + 0)
.s1019:
27bb : d0 0a __ BNE $27c7 ; (nformi.s77 + 0)
.s1018:
27bd : a5 05 __ LDA WORK + 2 
27bf : c9 0a __ CMP #$0a
27c1 : b0 04 __ BCS $27c7 ; (nformi.s77 + 0)
.s78:
27c3 : a9 30 __ LDA #$30
27c5 : d0 02 __ BNE $27c9 ; (nformi.s79 + 0)
.s77:
27c7 : a9 37 __ LDA #$37
.s79:
27c9 : 18 __ __ CLC
27ca : 65 05 __ ADC WORK + 2 
27cc : c6 44 __ DEC T2 + 0 
27ce : a6 44 __ LDX T2 + 0 
27d0 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
27d3 : a5 1b __ LDA ACCU + 0 
27d5 : 85 11 __ STA P4 ; (v + 0)
27d7 : a5 1c __ LDA ACCU + 1 
27d9 : 85 12 __ STA P5 ; (v + 1)
27db : 05 11 __ ORA P4 ; (v + 0)
27dd : d0 c5 __ BNE $27a4 ; (nformi.l6 + 0)
.s7:
27df : a0 02 __ LDY #$02
27e1 : b1 0d __ LDA (P0),y ; (si + 0)
27e3 : c9 ff __ CMP #$ff
27e5 : d0 04 __ BNE $27eb ; (nformi.s80 + 0)
.s81:
27e7 : a9 0f __ LDA #$0f
27e9 : d0 05 __ BNE $27f0 ; (nformi.s1026 + 0)
.s80:
27eb : 38 __ __ SEC
27ec : a9 10 __ LDA #$10
27ee : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27f0 : a8 __ __ TAY
27f1 : c4 44 __ CPY T2 + 0 
27f3 : b0 0d __ BCS $2802 ; (nformi.s10 + 0)
.s9:
27f5 : a9 30 __ LDA #$30
.l1027:
27f7 : c6 44 __ DEC T2 + 0 
27f9 : a6 44 __ LDX T2 + 0 
27fb : 9d e8 bf STA $bfe8,x ; (buffer + 0)
27fe : c4 44 __ CPY T2 + 0 
2800 : 90 f5 __ BCC $27f7 ; (nformi.l1027 + 0)
.s10:
2802 : a0 07 __ LDY #$07
2804 : b1 0d __ LDA (P0),y ; (si + 0)
2806 : f0 20 __ BEQ $2828 ; (nformi.s13 + 0)
.s14:
2808 : a0 04 __ LDY #$04
280a : b1 0d __ LDA (P0),y ; (si + 0)
280c : d0 1a __ BNE $2828 ; (nformi.s13 + 0)
.s1013:
280e : 88 __ __ DEY
280f : b1 0d __ LDA (P0),y ; (si + 0)
2811 : c9 10 __ CMP #$10
2813 : d0 13 __ BNE $2828 ; (nformi.s13 + 0)
.s11:
2815 : a9 58 __ LDA #$58
2817 : a6 44 __ LDX T2 + 0 
2819 : 9d e7 bf STA $bfe7,x ; (si + 7)
281c : 8a __ __ TXA
281d : 18 __ __ CLC
281e : 69 fe __ ADC #$fe
2820 : 85 44 __ STA T2 + 0 
2822 : aa __ __ TAX
2823 : a9 30 __ LDA #$30
2825 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s13:
2828 : a9 00 __ LDA #$00
282a : 85 1b __ STA ACCU + 0 
282c : a5 43 __ LDA T0 + 0 
282e : f0 06 __ BEQ $2836 ; (nformi.s16 + 0)
.s15:
2830 : c6 44 __ DEC T2 + 0 
2832 : a9 2d __ LDA #$2d
2834 : d0 0a __ BNE $2840 ; (nformi.s1025 + 0)
.s16:
2836 : a0 05 __ LDY #$05
2838 : b1 0d __ LDA (P0),y ; (si + 0)
283a : f0 09 __ BEQ $2845 ; (nformi.s163 + 0)
.s18:
283c : c6 44 __ DEC T2 + 0 
283e : a9 2b __ LDA #$2b
.s1025:
2840 : a6 44 __ LDX T2 + 0 
2842 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s163:
2845 : a0 06 __ LDY #$06
2847 : b1 0d __ LDA (P0),y ; (si + 0)
2849 : d0 33 __ BNE $287e ; (nformi.s24 + 0)
.l30:
284b : a0 01 __ LDY #$01
284d : b1 0d __ LDA (P0),y ; (si + 0)
284f : 18 __ __ CLC
2850 : 65 44 __ ADC T2 + 0 
2852 : b0 04 __ BCS $2858 ; (nformi.s31 + 0)
.s1006:
2854 : c9 11 __ CMP #$11
2856 : 90 0d __ BCC $2865 ; (nformi.s33 + 0)
.s31:
2858 : c6 44 __ DEC T2 + 0 
285a : a0 00 __ LDY #$00
285c : b1 0d __ LDA (P0),y ; (si + 0)
285e : a6 44 __ LDX T2 + 0 
2860 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
2863 : b0 e6 __ BCS $284b ; (nformi.l30 + 0)
.s33:
2865 : a6 44 __ LDX T2 + 0 
2867 : e0 10 __ CPX #$10
2869 : b0 0e __ BCS $2879 ; (nformi.s23 + 0)
.s34:
286b : 88 __ __ DEY
.l1022:
286c : bd e8 bf LDA $bfe8,x ; (buffer + 0)
286f : 91 0f __ STA (P2),y ; (str + 0)
2871 : e8 __ __ INX
2872 : e0 10 __ CPX #$10
2874 : c8 __ __ INY
2875 : 90 f5 __ BCC $286c ; (nformi.l1022 + 0)
.s1023:
2877 : 84 1b __ STY ACCU + 0 
.s23:
2879 : a9 00 __ LDA #$00
287b : 85 1c __ STA ACCU + 1 
.s1001:
287d : 60 __ __ RTS
.s24:
287e : a6 44 __ LDX T2 + 0 
2880 : e0 10 __ CPX #$10
2882 : b0 1a __ BCS $289e ; (nformi.l27 + 0)
.s25:
2884 : a0 00 __ LDY #$00
.l1020:
2886 : bd e8 bf LDA $bfe8,x ; (buffer + 0)
2889 : 91 0f __ STA (P2),y ; (str + 0)
288b : e8 __ __ INX
288c : e0 10 __ CPX #$10
288e : c8 __ __ INY
288f : 90 f5 __ BCC $2886 ; (nformi.l1020 + 0)
.s1021:
2891 : 84 1b __ STY ACCU + 0 
2893 : b0 09 __ BCS $289e ; (nformi.l27 + 0)
.s28:
2895 : 88 __ __ DEY
2896 : b1 0d __ LDA (P0),y ; (si + 0)
2898 : a4 1b __ LDY ACCU + 0 
289a : 91 0f __ STA (P2),y ; (str + 0)
289c : e6 1b __ INC ACCU + 0 
.l27:
289e : a5 1b __ LDA ACCU + 0 
28a0 : a0 01 __ LDY #$01
28a2 : d1 0d __ CMP (P0),y ; (si + 0)
28a4 : 90 ef __ BCC $2895 ; (nformi.s28 + 0)
28a6 : 4c 79 28 JMP $2879 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
28a9 : a9 00 __ LDA #$00
28ab : 85 43 __ STA T0 + 0 
28ad : a5 15 __ LDA P8 ; (s + 0)
28af : f0 21 __ BEQ $28d2 ; (nforml.s182 + 0)
.s4:
28b1 : a5 14 __ LDA P7 ; (v + 3)
28b3 : f0 1d __ BEQ $28d2 ; (nforml.s182 + 0)
.s1032:
28b5 : 10 1b __ BPL $28d2 ; (nforml.s182 + 0)
.s1:
28b7 : 38 __ __ SEC
28b8 : a9 00 __ LDA #$00
28ba : e5 11 __ SBC P4 ; (v + 0)
28bc : 85 11 __ STA P4 ; (v + 0)
28be : a9 00 __ LDA #$00
28c0 : e5 12 __ SBC P5 ; (v + 1)
28c2 : 85 12 __ STA P5 ; (v + 1)
28c4 : a9 00 __ LDA #$00
28c6 : e5 13 __ SBC P6 ; (v + 2)
28c8 : 85 13 __ STA P6 ; (v + 2)
28ca : a9 00 __ LDA #$00
28cc : e5 14 __ SBC P7 ; (v + 3)
28ce : 85 14 __ STA P7 ; (v + 3)
28d0 : e6 43 __ INC T0 + 0 
.s182:
28d2 : a9 10 __ LDA #$10
28d4 : 85 44 __ STA T2 + 0 
28d6 : a5 14 __ LDA P7 ; (v + 3)
28d8 : d0 0c __ BNE $28e6 ; (nforml.s42 + 0)
.s1024:
28da : a5 13 __ LDA P6 ; (v + 2)
28dc : d0 08 __ BNE $28e6 ; (nforml.s42 + 0)
.s1025:
28de : a5 12 __ LDA P5 ; (v + 1)
28e0 : d0 04 __ BNE $28e6 ; (nforml.s42 + 0)
.s1026:
28e2 : c5 11 __ CMP P4 ; (v + 0)
28e4 : b0 0e __ BCS $28f4 ; (nforml.s7 + 0)
.s42:
28e6 : a0 03 __ LDY #$03
28e8 : b1 0d __ LDA (P0),y ; (si + 0)
28ea : 85 45 __ STA T5 + 0 
28ec : c8 __ __ INY
28ed : b1 0d __ LDA (P0),y ; (si + 0)
28ef : 85 46 __ STA T5 + 1 
28f1 : 4c be 29 JMP $29be ; (nforml.l6 + 0)
.s7:
28f4 : a0 02 __ LDY #$02
28f6 : b1 0d __ LDA (P0),y ; (si + 0)
28f8 : c9 ff __ CMP #$ff
28fa : d0 04 __ BNE $2900 ; (nforml.s80 + 0)
.s81:
28fc : a9 0f __ LDA #$0f
28fe : d0 05 __ BNE $2905 ; (nforml.s1039 + 0)
.s80:
2900 : 38 __ __ SEC
2901 : a9 10 __ LDA #$10
2903 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2905 : a8 __ __ TAY
2906 : c4 44 __ CPY T2 + 0 
2908 : b0 0d __ BCS $2917 ; (nforml.s10 + 0)
.s9:
290a : a9 30 __ LDA #$30
.l1040:
290c : c6 44 __ DEC T2 + 0 
290e : a6 44 __ LDX T2 + 0 
2910 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
2913 : c4 44 __ CPY T2 + 0 
2915 : 90 f5 __ BCC $290c ; (nforml.l1040 + 0)
.s10:
2917 : a0 07 __ LDY #$07
2919 : b1 0d __ LDA (P0),y ; (si + 0)
291b : f0 20 __ BEQ $293d ; (nforml.s13 + 0)
.s14:
291d : a0 04 __ LDY #$04
291f : b1 0d __ LDA (P0),y ; (si + 0)
2921 : d0 1a __ BNE $293d ; (nforml.s13 + 0)
.s1013:
2923 : 88 __ __ DEY
2924 : b1 0d __ LDA (P0),y ; (si + 0)
2926 : c9 10 __ CMP #$10
2928 : d0 13 __ BNE $293d ; (nforml.s13 + 0)
.s11:
292a : a9 58 __ LDA #$58
292c : a6 44 __ LDX T2 + 0 
292e : 9d e7 bf STA $bfe7,x ; (si + 7)
2931 : 8a __ __ TXA
2932 : 18 __ __ CLC
2933 : 69 fe __ ADC #$fe
2935 : 85 44 __ STA T2 + 0 
2937 : aa __ __ TAX
2938 : a9 30 __ LDA #$30
293a : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s13:
293d : a9 00 __ LDA #$00
293f : 85 1b __ STA ACCU + 0 
2941 : a5 43 __ LDA T0 + 0 
2943 : f0 06 __ BEQ $294b ; (nforml.s16 + 0)
.s15:
2945 : c6 44 __ DEC T2 + 0 
2947 : a9 2d __ LDA #$2d
2949 : d0 0a __ BNE $2955 ; (nforml.s1038 + 0)
.s16:
294b : a0 05 __ LDY #$05
294d : b1 0d __ LDA (P0),y ; (si + 0)
294f : f0 09 __ BEQ $295a ; (nforml.s163 + 0)
.s18:
2951 : c6 44 __ DEC T2 + 0 
2953 : a9 2b __ LDA #$2b
.s1038:
2955 : a6 44 __ LDX T2 + 0 
2957 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s163:
295a : a0 06 __ LDY #$06
295c : b1 0d __ LDA (P0),y ; (si + 0)
295e : d0 33 __ BNE $2993 ; (nforml.s24 + 0)
.l30:
2960 : a0 01 __ LDY #$01
2962 : b1 0d __ LDA (P0),y ; (si + 0)
2964 : 18 __ __ CLC
2965 : 65 44 __ ADC T2 + 0 
2967 : b0 04 __ BCS $296d ; (nforml.s31 + 0)
.s1006:
2969 : c9 11 __ CMP #$11
296b : 90 0d __ BCC $297a ; (nforml.s33 + 0)
.s31:
296d : c6 44 __ DEC T2 + 0 
296f : a0 00 __ LDY #$00
2971 : b1 0d __ LDA (P0),y ; (si + 0)
2973 : a6 44 __ LDX T2 + 0 
2975 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
2978 : b0 e6 __ BCS $2960 ; (nforml.l30 + 0)
.s33:
297a : a6 44 __ LDX T2 + 0 
297c : e0 10 __ CPX #$10
297e : b0 0e __ BCS $298e ; (nforml.s23 + 0)
.s34:
2980 : 88 __ __ DEY
.l1035:
2981 : bd e8 bf LDA $bfe8,x ; (buffer + 0)
2984 : 91 0f __ STA (P2),y ; (str + 0)
2986 : e8 __ __ INX
2987 : e0 10 __ CPX #$10
2989 : c8 __ __ INY
298a : 90 f5 __ BCC $2981 ; (nforml.l1035 + 0)
.s1036:
298c : 84 1b __ STY ACCU + 0 
.s23:
298e : a9 00 __ LDA #$00
2990 : 85 1c __ STA ACCU + 1 
.s1001:
2992 : 60 __ __ RTS
.s24:
2993 : a6 44 __ LDX T2 + 0 
2995 : e0 10 __ CPX #$10
2997 : b0 1a __ BCS $29b3 ; (nforml.l27 + 0)
.s25:
2999 : a0 00 __ LDY #$00
.l1033:
299b : bd e8 bf LDA $bfe8,x ; (buffer + 0)
299e : 91 0f __ STA (P2),y ; (str + 0)
29a0 : e8 __ __ INX
29a1 : e0 10 __ CPX #$10
29a3 : c8 __ __ INY
29a4 : 90 f5 __ BCC $299b ; (nforml.l1033 + 0)
.s1034:
29a6 : 84 1b __ STY ACCU + 0 
29a8 : b0 09 __ BCS $29b3 ; (nforml.l27 + 0)
.s28:
29aa : 88 __ __ DEY
29ab : b1 0d __ LDA (P0),y ; (si + 0)
29ad : a4 1b __ LDY ACCU + 0 
29af : 91 0f __ STA (P2),y ; (str + 0)
29b1 : e6 1b __ INC ACCU + 0 
.l27:
29b3 : a5 1b __ LDA ACCU + 0 
29b5 : a0 01 __ LDY #$01
29b7 : d1 0d __ CMP (P0),y ; (si + 0)
29b9 : 90 ef __ BCC $29aa ; (nforml.s28 + 0)
29bb : 4c 8e 29 JMP $298e ; (nforml.s23 + 0)
.l6:
29be : a5 11 __ LDA P4 ; (v + 0)
29c0 : 85 1b __ STA ACCU + 0 
29c2 : a5 12 __ LDA P5 ; (v + 1)
29c4 : 85 1c __ STA ACCU + 1 
29c6 : a5 13 __ LDA P6 ; (v + 2)
29c8 : 85 1d __ STA ACCU + 2 
29ca : a5 14 __ LDA P7 ; (v + 3)
29cc : 85 1e __ STA ACCU + 3 
29ce : a5 45 __ LDA T5 + 0 
29d0 : 85 03 __ STA WORK + 0 
29d2 : a5 46 __ LDA T5 + 1 
29d4 : 85 04 __ STA WORK + 1 
29d6 : a9 00 __ LDA #$00
29d8 : 85 05 __ STA WORK + 2 
29da : 85 06 __ STA WORK + 3 
29dc : 20 a4 4d JSR $4da4 ; (divmod32 + 0)
29df : a5 08 __ LDA WORK + 5 
29e1 : 30 08 __ BMI $29eb ; (nforml.s78 + 0)
.s1023:
29e3 : d0 0a __ BNE $29ef ; (nforml.s77 + 0)
.s1022:
29e5 : a5 07 __ LDA WORK + 4 
29e7 : c9 0a __ CMP #$0a
29e9 : b0 04 __ BCS $29ef ; (nforml.s77 + 0)
.s78:
29eb : a9 30 __ LDA #$30
29ed : d0 02 __ BNE $29f1 ; (nforml.s79 + 0)
.s77:
29ef : a9 37 __ LDA #$37
.s79:
29f1 : 18 __ __ CLC
29f2 : 65 07 __ ADC WORK + 4 
29f4 : c6 44 __ DEC T2 + 0 
29f6 : a6 44 __ LDX T2 + 0 
29f8 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
29fb : a5 1b __ LDA ACCU + 0 
29fd : 85 11 __ STA P4 ; (v + 0)
29ff : a5 1c __ LDA ACCU + 1 
2a01 : 85 12 __ STA P5 ; (v + 1)
2a03 : a5 1d __ LDA ACCU + 2 
2a05 : 85 13 __ STA P6 ; (v + 2)
2a07 : a5 1e __ LDA ACCU + 3 
2a09 : 85 14 __ STA P7 ; (v + 3)
2a0b : d0 b1 __ BNE $29be ; (nforml.l6 + 0)
.s1018:
2a0d : a5 13 __ LDA P6 ; (v + 2)
2a0f : d0 ad __ BNE $29be ; (nforml.l6 + 0)
.s1019:
2a11 : a5 12 __ LDA P5 ; (v + 1)
2a13 : d0 a9 __ BNE $29be ; (nforml.l6 + 0)
.s1020:
2a15 : c5 11 __ CMP P4 ; (v + 0)
2a17 : 90 a5 __ BCC $29be ; (nforml.l6 + 0)
2a19 : 4c f4 28 JMP $28f4 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2a1c : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2a2c : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2a3c : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2a46 : 38 __ __ SEC
2a47 : a5 23 __ LDA SP + 0 
2a49 : e9 06 __ SBC #$06
2a4b : 85 23 __ STA SP + 0 
2a4d : b0 02 __ BCS $2a51 ; (load_overlay.s0 + 0)
2a4f : c6 24 __ DEC SP + 1 
.s0:
2a51 : a9 00 __ LDA #$00
2a53 : 85 0d __ STA P0 
2a55 : 85 0e __ STA P1 
2a57 : 20 be 2a JSR $2abe ; (krnio_setbnk.s0 + 0)
2a5a : a9 ad __ LDA #$ad
2a5c : 85 0d __ STA P0 
2a5e : a9 2a __ LDA #$2a
2a60 : 85 0e __ STA P1 
2a62 : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
2a65 : a9 01 __ LDA #$01
2a67 : 85 0d __ STA P0 
2a69 : 85 0f __ STA P2 
2a6b : ad ed 51 LDA $51ed ; (bootdevice + 0)
2a6e : 85 0e __ STA P1 
2a70 : 20 db 2a JSR $2adb ; (krnio_load.s0 + 0)
2a73 : 09 00 __ ORA #$00
2a75 : d0 2a __ BNE $2aa1 ; (load_overlay.s1001 + 0)
.s1:
2a77 : a9 00 __ LDA #$00
2a79 : a0 02 __ LDY #$02
2a7b : 91 23 __ STA (SP + 0),y 
2a7d : a9 2b __ LDA #$2b
2a7f : c8 __ __ INY
2a80 : 91 23 __ STA (SP + 0),y 
2a82 : 20 f5 22 JSR $22f5 ; (printf.s0 + 0)
2a85 : a9 1e __ LDA #$1e
2a87 : a0 02 __ LDY #$02
2a89 : 91 23 __ STA (SP + 0),y 
2a8b : a9 2b __ LDA #$2b
2a8d : c8 __ __ INY
2a8e : 91 23 __ STA (SP + 0),y 
2a90 : ad ef 51 LDA $51ef ; (krnio_pstatus + 1)
2a93 : c8 __ __ INY
2a94 : 91 23 __ STA (SP + 0),y 
2a96 : a9 00 __ LDA #$00
2a98 : c8 __ __ INY
2a99 : 91 23 __ STA (SP + 0),y 
2a9b : 20 f5 22 JSR $22f5 ; (printf.s0 + 0)
2a9e : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
.s1001:
2aa1 : 18 __ __ CLC
2aa2 : a5 23 __ LDA SP + 0 
2aa4 : 69 06 __ ADC #$06
2aa6 : 85 23 __ STA SP + 0 
2aa8 : 90 02 __ BCC $2aac ; (load_overlay.s1001 + 11)
2aaa : e6 24 __ INC SP + 1 
2aac : 60 __ __ RTS
--------------------------------------------------------------------
2aad : __ __ __ BYT 56 44 43 53 45 32 50 52 47 4c 4d 43 00          : VDCSE2PRGLMC.
--------------------------------------------------------------------
krnio_setbnk@proxy: ; krnio_setbnk@proxy
2aba : a9 00 __ LDA #$00
2abc : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2abe : a5 0d __ LDA P0 
2ac0 : a6 0e __ LDX P1 
2ac2 : 4c 68 ff JMP $ff68 
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
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2af8 : a5 44 __ LDA $44 
2afa : 85 0e __ STA P1 
2afc : 4c 65 2d JMP $2d65 ; (vdc_mem_addr.s0 + 0)
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
2b3a : ae ff 33 LDX $33ff ; (spentry + 0)
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
2b54 : bd 9d 50 LDA $509d,x ; (vdc_clear@proxy + 14)
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
2b98 : 8d 87 52 STA $5287 ; (vdc_state + 7)
2b9b : 20 cd 2b JSR $2bcd ; (vdc_detect_mem_size.s0 + 0)
2b9e : 24 d7 __ BIT $d7 
2ba0 : 30 17 __ BMI $2bb9 ; (vdc_init.s29 + 0)
.s32:
2ba2 : a9 89 __ LDA #$89
2ba4 : a0 02 __ LDY #$02
2ba6 : 91 23 __ STA (SP + 0),y 
2ba8 : a9 2d __ LDA #$2d
2baa : c8 __ __ INY
2bab : 91 23 __ STA (SP + 0),y 
2bad : 20 f5 22 JSR $22f5 ; (printf.s0 + 0)
2bb0 : 20 b4 2d JSR $2db4 ; (getch.s0 + 0)
2bb3 : 20 81 ff JSR $ff81 
2bb6 : 20 f2 2d JSR $2df2 ; (screen_setmode.s0 + 0)
.s29:
2bb9 : a9 01 __ LDA #$01
2bbb : 20 fa 2d JSR $2dfa ; (fastmode.s0 + 0)
2bbe : 20 19 2e JSR $2e19 ; (vdc_set_mode@proxy + 0)
.s1001:
2bc1 : 18 __ __ CLC
2bc2 : a5 23 __ LDA SP + 0 
2bc4 : 69 04 __ ADC #$04
2bc6 : 85 23 __ STA SP + 0 
2bc8 : 90 02 __ BCC $2bcc ; (vdc_init.s1001 + 11)
2bca : e6 24 __ INC SP + 1 
2bcc : 60 __ __ RTS
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2bcd : a9 1c __ LDA #$1c
2bcf : 8d 00 d6 STA $d600 
.l335:
2bd2 : 2c 00 d6 BIT $d600 
2bd5 : 10 fb __ BPL $2bd2 ; (vdc_detect_mem_size.l335 + 0)
.s5:
2bd7 : ad 01 d6 LDA $d601 
2bda : a8 __ __ TAY
2bdb : 09 10 __ ORA #$10
2bdd : a2 1c __ LDX #$1c
2bdf : 8e 00 d6 STX $d600 
.l337:
2be2 : 2c 00 d6 BIT $d600 
2be5 : 10 fb __ BPL $2be2 ; (vdc_detect_mem_size.l337 + 0)
.s12:
2be7 : 8d 01 d6 STA $d601 
2bea : a9 12 __ LDA #$12
2bec : 8d 00 d6 STA $d600 
.l339:
2bef : 2c 00 d6 BIT $d600 
2bf2 : 10 fb __ BPL $2bef ; (vdc_detect_mem_size.l339 + 0)
.s19:
2bf4 : a9 1f __ LDA #$1f
2bf6 : 8d 01 d6 STA $d601 
2bf9 : a9 13 __ LDA #$13
2bfb : 8d 00 d6 STA $d600 
.l341:
2bfe : 2c 00 d6 BIT $d600 
2c01 : 10 fb __ BPL $2bfe ; (vdc_detect_mem_size.l341 + 0)
.s24:
2c03 : a9 ff __ LDA #$ff
2c05 : 8d 01 d6 STA $d601 
2c08 : a9 1f __ LDA #$1f
2c0a : 8d 00 d6 STA $d600 
.l343:
2c0d : 2c 00 d6 BIT $d600 
2c10 : 10 fb __ BPL $2c0d ; (vdc_detect_mem_size.l343 + 0)
.s28:
2c12 : a9 00 __ LDA #$00
2c14 : 8d 01 d6 STA $d601 
2c17 : a9 12 __ LDA #$12
2c19 : 8d 00 d6 STA $d600 
.l345:
2c1c : 2c 00 d6 BIT $d600 
2c1f : 10 fb __ BPL $2c1c ; (vdc_detect_mem_size.l345 + 0)
.s35:
2c21 : a9 9f __ LDA #$9f
2c23 : 8d 01 d6 STA $d601 
2c26 : a9 13 __ LDA #$13
2c28 : 8d 00 d6 STA $d600 
.l347:
2c2b : 2c 00 d6 BIT $d600 
2c2e : 10 fb __ BPL $2c2b ; (vdc_detect_mem_size.l347 + 0)
.s40:
2c30 : a9 ff __ LDA #$ff
2c32 : 8d 01 d6 STA $d601 
2c35 : a9 1f __ LDA #$1f
2c37 : 8d 00 d6 STA $d600 
.l349:
2c3a : 2c 00 d6 BIT $d600 
2c3d : 10 fb __ BPL $2c3a ; (vdc_detect_mem_size.l349 + 0)
.s44:
2c3f : a9 ff __ LDA #$ff
2c41 : 8d 01 d6 STA $d601 
2c44 : a9 12 __ LDA #$12
2c46 : 8d 00 d6 STA $d600 
.l351:
2c49 : 2c 00 d6 BIT $d600 
2c4c : 10 fb __ BPL $2c49 ; (vdc_detect_mem_size.l351 + 0)
.s51:
2c4e : a9 1f __ LDA #$1f
2c50 : 8d 01 d6 STA $d601 
2c53 : a9 13 __ LDA #$13
2c55 : 8d 00 d6 STA $d600 
.l353:
2c58 : 2c 00 d6 BIT $d600 
2c5b : 10 fb __ BPL $2c58 ; (vdc_detect_mem_size.l353 + 0)
.s56:
2c5d : a9 ff __ LDA #$ff
2c5f : 8d 01 d6 STA $d601 
2c62 : a9 1f __ LDA #$1f
2c64 : 8d 00 d6 STA $d600 
.l355:
2c67 : 2c 00 d6 BIT $d600 
2c6a : 10 fb __ BPL $2c67 ; (vdc_detect_mem_size.l355 + 0)
.s60:
2c6c : ad 01 d6 LDA $d601 
2c6f : f0 04 __ BEQ $2c75 ; (vdc_detect_mem_size.s1026 + 0)
.s1027:
2c71 : a9 10 __ LDA #$10
2c73 : d0 02 __ BNE $2c77 ; (vdc_detect_mem_size.s1028 + 0)
.s1026:
2c75 : a9 40 __ LDA #$40
.s1028:
2c77 : 8d 80 52 STA $5280 ; (vdc_state + 0)
2c7a : 8e 00 d6 STX $d600 
.l358:
2c7d : 2c 00 d6 BIT $d600 
2c80 : 10 fb __ BPL $2c7d ; (vdc_detect_mem_size.l358 + 0)
.s67:
2c82 : 8c 01 d6 STY $d601 
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2c85 : a9 00 __ LDA #$00
2c87 : 85 0f __ STA P2 
2c89 : 85 10 __ STA P3 
2c8b : ad 83 52 LDA $5283 ; (vdc_state + 3)
2c8e : 85 12 __ STA P5 
2c90 : ad 85 52 LDA $5285 ; (vdc_state + 5)
2c93 : 85 13 __ STA P6 
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
2c95 : a9 20 __ LDA #$20
2c97 : 85 11 __ STA P4 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2c99 : 18 __ __ CLC
2c9a : a5 10 __ LDA P3 ; (y + 0)
2c9c : 65 13 __ ADC P6 ; (lines + 0)
2c9e : 85 43 __ STA T1 + 0 
2ca0 : a9 00 __ LDA #$00
2ca2 : 2a __ __ ROL
2ca3 : 85 44 __ STA T1 + 1 
2ca5 : d0 07 __ BNE $2cae ; (vdc_clear.l2 + 0)
.s1018:
2ca7 : a5 10 __ LDA P3 ; (y + 0)
2ca9 : c5 43 __ CMP T1 + 0 
2cab : 90 01 __ BCC $2cae ; (vdc_clear.l2 + 0)
.s1001:
2cad : 60 __ __ RTS
.l2:
2cae : a5 10 __ LDA P3 ; (y + 0)
2cb0 : 0a __ __ ASL
2cb1 : aa __ __ TAX
2cb2 : bd 00 53 LDA $5300,x ; (multab + 0)
2cb5 : 18 __ __ CLC
2cb6 : 65 0f __ ADC P2 ; (x + 0)
2cb8 : 85 46 __ STA T3 + 0 
2cba : bd 01 53 LDA $5301,x ; (multab + 1)
2cbd : 69 00 __ ADC #$00
2cbf : 85 47 __ STA T3 + 1 
2cc1 : ad 88 52 LDA $5288 ; (vdc_state + 8)
2cc4 : 18 __ __ CLC
2cc5 : 65 46 __ ADC T3 + 0 
2cc7 : 85 0d __ STA P0 
2cc9 : ad 89 52 LDA $5289 ; (vdc_state + 9)
2ccc : 65 47 __ ADC T3 + 1 
2cce : 85 0e __ STA P1 
2cd0 : ad 87 52 LDA $5287 ; (vdc_state + 7)
2cd3 : 85 45 __ STA T2 + 0 
2cd5 : 20 65 2d JSR $2d65 ; (vdc_mem_addr.s0 + 0)
2cd8 : a6 12 __ LDX P5 ; (length + 0)
2cda : ca __ __ DEX
2cdb : 86 48 __ STX T4 + 0 
.l239:
2cdd : 2c 00 d6 BIT $d600 
2ce0 : 10 fb __ BPL $2cdd ; (vdc_clear.l239 + 0)
.s11:
2ce2 : a5 11 __ LDA P4 ; (val + 0)
2ce4 : 8d 01 d6 STA $d601 
2ce7 : a9 18 __ LDA #$18
2ce9 : 8d 00 d6 STA $d600 
.l241:
2cec : 2c 00 d6 BIT $d600 
2cef : 10 fb __ BPL $2cec ; (vdc_clear.l241 + 0)
.s17:
2cf1 : ad 01 d6 LDA $d601 
2cf4 : 29 7f __ AND #$7f
2cf6 : a2 18 __ LDX #$18
2cf8 : 8e 00 d6 STX $d600 
.l243:
2cfb : 2c 00 d6 BIT $d600 
2cfe : 10 fb __ BPL $2cfb ; (vdc_clear.l243 + 0)
.s23:
2d00 : 8d 01 d6 STA $d601 
2d03 : a9 1e __ LDA #$1e
2d05 : 8d 00 d6 STA $d600 
.l245:
2d08 : 2c 00 d6 BIT $d600 
2d0b : 10 fb __ BPL $2d08 ; (vdc_clear.l245 + 0)
.s28:
2d0d : a5 48 __ LDA T4 + 0 
2d0f : 8d 01 d6 STA $d601 
2d12 : ad 8a 52 LDA $528a ; (vdc_state + 10)
2d15 : 18 __ __ CLC
2d16 : 65 46 __ ADC T3 + 0 
2d18 : 85 0d __ STA P0 
2d1a : ad 8b 52 LDA $528b ; (vdc_state + 11)
2d1d : 65 47 __ ADC T3 + 1 
2d1f : 85 0e __ STA P1 
2d21 : 20 65 2d JSR $2d65 ; (vdc_mem_addr.s0 + 0)
.l247:
2d24 : 2c 00 d6 BIT $d600 
2d27 : 10 fb __ BPL $2d24 ; (vdc_clear.l247 + 0)
.s32:
2d29 : a5 45 __ LDA T2 + 0 
2d2b : 8d 01 d6 STA $d601 
2d2e : a9 18 __ LDA #$18
2d30 : 8d 00 d6 STA $d600 
.l249:
2d33 : 2c 00 d6 BIT $d600 
2d36 : 10 fb __ BPL $2d33 ; (vdc_clear.l249 + 0)
.s38:
2d38 : ad 01 d6 LDA $d601 
2d3b : 29 7f __ AND #$7f
2d3d : a2 18 __ LDX #$18
2d3f : 8e 00 d6 STX $d600 
.l251:
2d42 : 2c 00 d6 BIT $d600 
2d45 : 10 fb __ BPL $2d42 ; (vdc_clear.l251 + 0)
.s44:
2d47 : 8d 01 d6 STA $d601 
2d4a : a9 1e __ LDA #$1e
2d4c : 8d 00 d6 STA $d600 
.l253:
2d4f : 2c 00 d6 BIT $d600 
2d52 : 10 fb __ BPL $2d4f ; (vdc_clear.l253 + 0)
.s49:
2d54 : a5 48 __ LDA T4 + 0 
2d56 : 8d 01 d6 STA $d601 
2d59 : e6 10 __ INC P3 ; (y + 0)
2d5b : a5 44 __ LDA T1 + 1 
2d5d : f0 03 __ BEQ $2d62 ; (vdc_clear.s49 + 14)
2d5f : 4c ae 2c JMP $2cae ; (vdc_clear.l2 + 0)
2d62 : 4c a7 2c JMP $2ca7 ; (vdc_clear.s1018 + 0)
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2d65 : a9 12 __ LDA #$12
2d67 : 8d 00 d6 STA $d600 
.l56:
2d6a : 2c 00 d6 BIT $d600 
2d6d : 10 fb __ BPL $2d6a ; (vdc_mem_addr.l56 + 0)
.s5:
2d6f : a5 0e __ LDA P1 ; (addr + 1)
2d71 : 8d 01 d6 STA $d601 
2d74 : a9 13 __ LDA #$13
2d76 : 8d 00 d6 STA $d600 
.l58:
2d79 : 2c 00 d6 BIT $d600 
2d7c : 10 fb __ BPL $2d79 ; (vdc_mem_addr.l58 + 0)
.s10:
2d7e : a5 0d __ LDA P0 ; (addr + 0)
2d80 : 8d 01 d6 STA $d601 
2d83 : a9 1f __ LDA #$1f
2d85 : 8d 00 d6 STA $d600 
.s1001:
2d88 : 60 __ __ RTS
--------------------------------------------------------------------
2d89 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2d99 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2da9 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
2db4 : 20 be 2d JSR $2dbe ; (getpch + 0)
2db7 : c9 00 __ CMP #$00
2db9 : f0 f9 __ BEQ $2db4 ; (getch.s0 + 0)
2dbb : 85 1b __ STA ACCU + 0 
.s1001:
2dbd : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2dbe : 20 e4 ff JSR $ffe4 
2dc1 : ae fc 4b LDX $4bfc ; (giocharmap + 0)
2dc4 : e0 01 __ CPX #$01
2dc6 : 90 26 __ BCC $2dee ; (getpch + 48)
2dc8 : c9 0d __ CMP #$0d
2dca : d0 02 __ BNE $2dce ; (getpch + 16)
2dcc : a9 0a __ LDA #$0a
2dce : e0 02 __ CPX #$02
2dd0 : 90 1c __ BCC $2dee ; (getpch + 48)
2dd2 : c9 db __ CMP #$db
2dd4 : b0 18 __ BCS $2dee ; (getpch + 48)
2dd6 : c9 41 __ CMP #$41
2dd8 : 90 14 __ BCC $2dee ; (getpch + 48)
2dda : c9 c1 __ CMP #$c1
2ddc : 90 02 __ BCC $2de0 ; (getpch + 34)
2dde : 49 a0 __ EOR #$a0
2de0 : c9 7b __ CMP #$7b
2de2 : b0 0a __ BCS $2dee ; (getpch + 48)
2de4 : c9 61 __ CMP #$61
2de6 : b0 04 __ BCS $2dec ; (getpch + 46)
2de8 : c9 5b __ CMP #$5b
2dea : b0 02 __ BCS $2dee ; (getpch + 48)
2dec : 49 20 __ EOR #$20
2dee : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2def : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2df2 : 24 d7 __ BIT $d7 
2df4 : 10 01 __ BPL $2df7 ; (screen_setmode.s6 + 0)
.s1001:
2df6 : 60 __ __ RTS
.s6:
2df7 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2dfa : 09 00 __ ORA #$00
2dfc : d0 0d __ BNE $2e0b ; (fastmode.s1 + 0)
.s2:
2dfe : 8d 30 d0 STA $d030 
2e01 : ad 11 d0 LDA $d011 
2e04 : 29 7f __ AND #$7f
2e06 : 09 10 __ ORA #$10
2e08 : 4c 15 2e JMP $2e15 ; (fastmode.s3 + 0)
.s1:
2e0b : a9 01 __ LDA #$01
2e0d : 8d 30 d0 STA $d030 
2e10 : ad 11 d0 LDA $d011 
2e13 : 29 6f __ AND #$6f
.s3:
2e15 : 8d 11 d0 STA $d011 
.s1001:
2e18 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2e19 : a9 00 __ LDA #$00
2e1b : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2e1d : a4 14 __ LDY P7 ; (mode + 0)
2e1f : be 58 50 LDX $5058,y ; (__multab36L + 0)
2e22 : 86 49 __ STX T1 + 0 
2e24 : 86 4b __ STX T2 + 0 
2e26 : bd 04 51 LDA $5104,x ; (vdc_modes + 4)
2e29 : f0 08 __ BEQ $2e33 ; (vdc_set_mode.s3 + 0)
.s4:
2e2b : ad 80 52 LDA $5280 ; (vdc_state + 0)
2e2e : c9 10 __ CMP #$10
2e30 : d0 01 __ BNE $2e33 ; (vdc_set_mode.s3 + 0)
2e32 : 60 __ __ RTS
.s3:
2e33 : 8c 82 52 STY $5282 ; (vdc_state + 2)
2e36 : a9 8d __ LDA #$8d
2e38 : 8d 87 52 STA $5287 ; (vdc_state + 7)
2e3b : a9 00 __ LDA #$00
2e3d : 8d 96 52 STA $5296 ; (vdc_state + 22)
2e40 : 8d 97 52 STA $5297 ; (vdc_state + 23)
2e43 : 8d 98 52 STA $5298 ; (vdc_state + 24)
2e46 : bd 00 51 LDA $5100,x ; (vdc_modes + 0)
2e49 : 8d 83 52 STA $5283 ; (vdc_state + 3)
2e4c : bd 01 51 LDA $5101,x ; (vdc_modes + 1)
2e4f : 8d 84 52 STA $5284 ; (vdc_state + 4)
2e52 : bd 02 51 LDA $5102,x ; (vdc_modes + 2)
2e55 : 8d 85 52 STA $5285 ; (vdc_state + 5)
2e58 : bd 03 51 LDA $5103,x ; (vdc_modes + 3)
2e5b : 8d 86 52 STA $5286 ; (vdc_state + 6)
2e5e : bd 09 51 LDA $5109,x ; (vdc_modes + 9)
2e61 : 8d 8c 52 STA $528c ; (vdc_state + 12)
2e64 : bd 0a 51 LDA $510a,x ; (vdc_modes + 10)
2e67 : 8d 8d 52 STA $528d ; (vdc_state + 13)
2e6a : bd 0b 51 LDA $510b,x ; (vdc_modes + 11)
2e6d : 8d 8e 52 STA $528e ; (vdc_state + 14)
2e70 : bd 0c 51 LDA $510c,x ; (vdc_modes + 12)
2e73 : 8d 8f 52 STA $528f ; (vdc_state + 15)
2e76 : bd 0d 51 LDA $510d,x ; (vdc_modes + 13)
2e79 : 8d 90 52 STA $5290 ; (vdc_state + 16)
2e7c : bd 0e 51 LDA $510e,x ; (vdc_modes + 14)
2e7f : 8d 91 52 STA $5291 ; (vdc_state + 17)
2e82 : bd 0f 51 LDA $510f,x ; (vdc_modes + 15)
2e85 : 8d 92 52 STA $5292 ; (vdc_state + 18)
2e88 : bd 10 51 LDA $5110,x ; (vdc_modes + 16)
2e8b : 8d 93 52 STA $5293 ; (vdc_state + 19)
2e8e : bd 11 51 LDA $5111,x ; (vdc_modes + 17)
2e91 : 8d 94 52 STA $5294 ; (vdc_state + 20)
2e94 : bd 12 51 LDA $5112,x ; (vdc_modes + 18)
2e97 : 8d 95 52 STA $5295 ; (vdc_state + 21)
2e9a : bd 05 51 LDA $5105,x ; (vdc_modes + 5)
2e9d : 85 4c __ STA T3 + 0 
2e9f : 8d 88 52 STA $5288 ; (vdc_state + 8)
2ea2 : bd 06 51 LDA $5106,x ; (vdc_modes + 6)
2ea5 : 85 4d __ STA T3 + 1 
2ea7 : 8d 89 52 STA $5289 ; (vdc_state + 9)
2eaa : bd 07 51 LDA $5107,x ; (vdc_modes + 7)
2ead : 85 4e __ STA T5 + 0 
2eaf : 8d 8a 52 STA $528a ; (vdc_state + 10)
2eb2 : bd 08 51 LDA $5108,x ; (vdc_modes + 8)
2eb5 : 85 4f __ STA T5 + 1 
2eb7 : 8d 8b 52 STA $528b ; (vdc_state + 11)
2eba : 20 92 2f JSR $2f92 ; (vdc_set_multab.s0 + 0)
2ebd : a9 22 __ LDA #$22
2ebf : 8d 00 d6 STA $d600 
.l295:
2ec2 : 2c 00 d6 BIT $d600 
2ec5 : 10 fb __ BPL $2ec2 ; (vdc_set_mode.l295 + 0)
.s11:
2ec7 : a9 80 __ LDA #$80
2ec9 : 8d 01 d6 STA $d601 
2ecc : a9 0c __ LDA #$0c
2ece : 8d 00 d6 STA $d600 
.l297:
2ed1 : 2c 00 d6 BIT $d600 
2ed4 : 10 fb __ BPL $2ed1 ; (vdc_set_mode.l297 + 0)
.s17:
2ed6 : a5 4d __ LDA T3 + 1 
2ed8 : 8d 01 d6 STA $d601 
2edb : a9 0d __ LDA #$0d
2edd : 8d 00 d6 STA $d600 
.l299:
2ee0 : 2c 00 d6 BIT $d600 
2ee3 : 10 fb __ BPL $2ee0 ; (vdc_set_mode.l299 + 0)
.s22:
2ee5 : a5 4c __ LDA T3 + 0 
2ee7 : 8d 01 d6 STA $d601 
2eea : a9 14 __ LDA #$14
2eec : 8d 00 d6 STA $d600 
.l301:
2eef : 2c 00 d6 BIT $d600 
2ef2 : 10 fb __ BPL $2eef ; (vdc_set_mode.l301 + 0)
.s27:
2ef4 : a5 4f __ LDA T5 + 1 
2ef6 : 8d 01 d6 STA $d601 
2ef9 : a9 15 __ LDA #$15
2efb : 8d 00 d6 STA $d600 
.l303:
2efe : 2c 00 d6 BIT $d600 
2f01 : 10 fb __ BPL $2efe ; (vdc_set_mode.l303 + 0)
.s32:
2f03 : a5 4e __ LDA T5 + 0 
2f05 : 8d 01 d6 STA $d601 
2f08 : a6 49 __ LDX T1 + 0 
2f0a : bd 0e 51 LDA $510e,x ; (vdc_modes + 14)
2f0d : a2 1c __ LDX #$1c
2f0f : 8e 00 d6 STX $d600 
.l305:
2f12 : 2c 00 d6 BIT $d600 
2f15 : 10 fb __ BPL $2f12 ; (vdc_set_mode.l305 + 0)
.s39:
2f17 : aa __ __ TAX
2f18 : ad 01 d6 LDA $d601 
2f1b : 29 10 __ AND #$10
2f1d : 85 4e __ STA T5 + 0 
2f1f : a9 1c __ LDA #$1c
2f21 : 8d 00 d6 STA $d600 
2f24 : 8a __ __ TXA
2f25 : 29 e0 __ AND #$e0
2f27 : 05 4e __ ORA T5 + 0 
.l307:
2f29 : 2c 00 d6 BIT $d600 
2f2c : 10 fb __ BPL $2f29 ; (vdc_set_mode.l307 + 0)
.s45:
2f2e : 8d 01 d6 STA $d601 
2f31 : 20 ed 2f JSR $2fed ; (vdc_restore_charsets.s0 + 0)
2f34 : 18 __ __ CLC
2f35 : a9 13 __ LDA #$13
2f37 : 65 49 __ ADC T1 + 0 
2f39 : 85 49 __ STA T1 + 0 
2f3b : a9 51 __ LDA #$51
2f3d : 69 00 __ ADC #$00
2f3f : 85 4a __ STA T1 + 1 
2f41 : 18 __ __ CLC
2f42 : a5 4b __ LDA T2 + 0 
2f44 : 69 13 __ ADC #$13
2f46 : 85 4c __ STA T3 + 0 
2f48 : a9 00 __ LDA #$00
2f4a : 85 43 __ STA T0 + 0 
2f4c : 69 51 __ ADC #$51
2f4e : 85 4d __ STA T3 + 1 
.l46:
2f50 : a4 43 __ LDY T0 + 0 
2f52 : b1 49 __ LDA (T1 + 0),y 
2f54 : 85 47 __ STA T7 + 0 
2f56 : c8 __ __ INY
2f57 : b1 49 __ LDA (T1 + 0),y 
2f59 : aa __ __ TAX
2f5a : a5 47 __ LDA T7 + 0 
2f5c : 8d 00 d6 STA $d600 
2f5f : c8 __ __ INY
2f60 : 84 43 __ STY T0 + 0 
.l309:
2f62 : 2c 00 d6 BIT $d600 
2f65 : 10 fb __ BPL $2f62 ; (vdc_set_mode.l309 + 0)
.s52:
2f67 : 8e 01 d6 STX $d601 
2f6a : b1 4c __ LDA (T3 + 0),y 
2f6c : c9 ff __ CMP #$ff
2f6e : d0 e0 __ BNE $2f50 ; (vdc_set_mode.l46 + 0)
.s47:
2f70 : a6 4b __ LDX T2 + 0 
2f72 : bd 04 51 LDA $5104,x ; (vdc_modes + 4)
2f75 : f0 08 __ BEQ $2f7f ; (vdc_set_mode.s55 + 0)
.s56:
2f77 : ad 81 52 LDA $5281 ; (vdc_state + 1)
2f7a : d0 03 __ BNE $2f7f ; (vdc_set_mode.s55 + 0)
.s53:
2f7c : 20 42 30 JSR $3042 ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2f7f : 20 85 2c JSR $2c85 ; (vdc_cls.s0 + 0)
2f82 : a9 22 __ LDA #$22
2f84 : 8d 00 d6 STA $d600 
.l314:
2f87 : 2c 00 d6 BIT $d600 
2f8a : 10 fb __ BPL $2f87 ; (vdc_set_mode.l314 + 0)
.s62:
2f8c : a9 7d __ LDA #$7d
2f8e : 8d 01 d6 STA $d601 
.s1001:
2f91 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2f92 : ad 86 52 LDA $5286 ; (vdc_state + 6)
2f95 : 85 1c __ STA ACCU + 1 
2f97 : ad 85 52 LDA $5285 ; (vdc_state + 5)
2f9a : 85 1b __ STA ACCU + 0 
2f9c : 05 1c __ ORA ACCU + 1 
2f9e : f0 4c __ BEQ $2fec ; (vdc_set_multab.s1001 + 0)
.s5:
2fa0 : ad 83 52 LDA $5283 ; (vdc_state + 3)
2fa3 : 18 __ __ CLC
2fa4 : 6d 98 52 ADC $5298 ; (vdc_state + 24)
2fa7 : 85 43 __ STA T2 + 0 
2fa9 : ad 84 52 LDA $5284 ; (vdc_state + 4)
2fac : 69 00 __ ADC #$00
2fae : 85 44 __ STA T2 + 1 
2fb0 : a9 00 __ LDA #$00
2fb2 : 85 45 __ STA T3 + 0 
2fb4 : 85 46 __ STA T3 + 1 
2fb6 : a9 00 __ LDA #$00
2fb8 : 85 47 __ STA T4 + 0 
2fba : a9 53 __ LDA #$53
2fbc : 85 48 __ STA T4 + 1 
2fbe : a2 00 __ LDX #$00
.l2:
2fc0 : a5 45 __ LDA T3 + 0 
2fc2 : a0 00 __ LDY #$00
2fc4 : 91 47 __ STA (T4 + 0),y 
2fc6 : a5 46 __ LDA T3 + 1 
2fc8 : c8 __ __ INY
2fc9 : 91 47 __ STA (T4 + 0),y 
2fcb : 18 __ __ CLC
2fcc : a5 43 __ LDA T2 + 0 
2fce : 65 45 __ ADC T3 + 0 
2fd0 : 85 45 __ STA T3 + 0 
2fd2 : a5 44 __ LDA T2 + 1 
2fd4 : 65 46 __ ADC T3 + 1 
2fd6 : 85 46 __ STA T3 + 1 
2fd8 : 18 __ __ CLC
2fd9 : a5 47 __ LDA T4 + 0 
2fdb : 69 02 __ ADC #$02
2fdd : 85 47 __ STA T4 + 0 
2fdf : 90 02 __ BCC $2fe3 ; (vdc_set_multab.s1006 + 0)
.s1005:
2fe1 : e6 48 __ INC T4 + 1 
.s1006:
2fe3 : e8 __ __ INX
2fe4 : a5 1c __ LDA ACCU + 1 
2fe6 : d0 d8 __ BNE $2fc0 ; (vdc_set_multab.l2 + 0)
.s1002:
2fe8 : e4 1b __ CPX ACCU + 0 
2fea : 90 d4 __ BCC $2fc0 ; (vdc_set_multab.l2 + 0)
.s1001:
2fec : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2fed : ad 90 52 LDA $5290 ; (vdc_state + 16)
2ff0 : 85 0d __ STA P0 
2ff2 : ad 91 52 LDA $5291 ; (vdc_state + 17)
2ff5 : 85 0e __ STA P1 
2ff7 : 20 65 2d JSR $2d65 ; (vdc_mem_addr.s0 + 0)
2ffa : a9 00 __ LDA #$00
2ffc : 85 1b __ STA ACCU + 0 
2ffe : 85 43 __ STA T1 + 0 
3000 : a9 d0 __ LDA #$d0
3002 : 85 1c __ STA ACCU + 1 
3004 : a9 fe __ LDA #$fe
3006 : 85 44 __ STA T1 + 1 
.l2:
3008 : a2 08 __ LDX #$08
.l6:
300a : a9 01 __ LDA #$01
300c : 8d 00 ff STA $ff00 
300f : a0 00 __ LDY #$00
3011 : b1 1b __ LDA (ACCU + 0),y 
3013 : a0 0e __ LDY #$0e
3015 : 8c 00 ff STY $ff00 
3018 : a8 __ __ TAY
3019 : e6 1b __ INC ACCU + 0 
301b : d0 02 __ BNE $301f ; (vdc_restore_charsets.l106 + 0)
.s1007:
301d : e6 1c __ INC ACCU + 1 
.l106:
301f : 2c 00 d6 BIT $d600 
3022 : 10 fb __ BPL $301f ; (vdc_restore_charsets.l106 + 0)
.s11:
3024 : 8c 01 d6 STY $d601 
3027 : ca __ __ DEX
3028 : d0 e0 __ BNE $300a ; (vdc_restore_charsets.l6 + 0)
.s8:
302a : a2 08 __ LDX #$08
.l13:
302c : 2c 00 d6 BIT $d600 
302f : 10 fb __ BPL $302c ; (vdc_restore_charsets.l13 + 0)
.s18:
3031 : a9 00 __ LDA #$00
3033 : 8d 01 d6 STA $d601 
3036 : ca __ __ DEX
3037 : d0 f3 __ BNE $302c ; (vdc_restore_charsets.l13 + 0)
.s3:
3039 : e6 43 __ INC T1 + 0 
303b : d0 cb __ BNE $3008 ; (vdc_restore_charsets.l2 + 0)
.s1006:
303d : e6 44 __ INC T1 + 1 
303f : d0 c7 __ BNE $3008 ; (vdc_restore_charsets.l2 + 0)
.s1001:
3041 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
3042 : ad 80 52 LDA $5280 ; (vdc_state + 0)
3045 : c9 10 __ CMP #$10
3047 : f0 4d __ BEQ $3096 ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
3049 : ad 81 52 LDA $5281 ; (vdc_state + 1)
304c : d0 48 __ BNE $3096 ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
304e : a9 22 __ LDA #$22
3050 : 8d 00 d6 STA $d600 
.l120:
3053 : 2c 00 d6 BIT $d600 
3056 : 10 fb __ BPL $3053 ; (vdc_set_extended_memsize.l120 + 0)
.s11:
3058 : a9 80 __ LDA #$80
305a : 8d 01 d6 STA $d601 
305d : 20 97 30 JSR $3097 ; (vdc_wipe_mem.s0 + 0)
3060 : a9 1c __ LDA #$1c
3062 : 8d 00 d6 STA $d600 
.l122:
3065 : 2c 00 d6 BIT $d600 
3068 : 10 fb __ BPL $3065 ; (vdc_set_extended_memsize.l122 + 0)
.s17:
306a : ad 01 d6 LDA $d601 
306d : 09 10 __ ORA #$10
306f : a2 1c __ LDX #$1c
3071 : 8e 00 d6 STX $d600 
.l124:
3074 : 2c 00 d6 BIT $d600 
3077 : 10 fb __ BPL $3074 ; (vdc_set_extended_memsize.l124 + 0)
.s23:
3079 : 8d 01 d6 STA $d601 
307c : 20 ed 2f JSR $2fed ; (vdc_restore_charsets.s0 + 0)
307f : 20 85 2c JSR $2c85 ; (vdc_cls.s0 + 0)
3082 : a9 22 __ LDA #$22
3084 : 8d 00 d6 STA $d600 
.l126:
3087 : 2c 00 d6 BIT $d600 
308a : 10 fb __ BPL $3087 ; (vdc_set_extended_memsize.l126 + 0)
.s29:
308c : a9 7d __ LDA #$7d
308e : 8d 01 d6 STA $d601 
3091 : a9 01 __ LDA #$01
3093 : 8d 81 52 STA $5281 ; (vdc_state + 1)
.s1001:
3096 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
3097 : a9 00 __ LDA #$00
3099 : 85 44 __ STA T0 + 1 
309b : 85 0d __ STA P0 
309d : a9 ff __ LDA #$ff
309f : 85 45 __ STA T1 + 0 
.l2:
30a1 : 20 f8 2a JSR $2af8 ; (vdc_mem_addr@proxy + 0)
.l252:
30a4 : 2c 00 d6 BIT $d600 
30a7 : 10 fb __ BPL $30a4 ; (vdc_wipe_mem.l252 + 0)
.s8:
30a9 : a9 00 __ LDA #$00
30ab : 8d 01 d6 STA $d601 
30ae : a9 18 __ LDA #$18
30b0 : 8d 00 d6 STA $d600 
.l254:
30b3 : 2c 00 d6 BIT $d600 
30b6 : 10 fb __ BPL $30b3 ; (vdc_wipe_mem.l254 + 0)
.s14:
30b8 : ad 01 d6 LDA $d601 
30bb : 29 7f __ AND #$7f
30bd : a2 18 __ LDX #$18
30bf : 8e 00 d6 STX $d600 
.l256:
30c2 : 2c 00 d6 BIT $d600 
30c5 : 10 fb __ BPL $30c2 ; (vdc_wipe_mem.l256 + 0)
.s20:
30c7 : 8d 01 d6 STA $d601 
30ca : a9 1e __ LDA #$1e
30cc : 8d 00 d6 STA $d600 
.l258:
30cf : 2c 00 d6 BIT $d600 
30d2 : 10 fb __ BPL $30cf ; (vdc_wipe_mem.l258 + 0)
.s25:
30d4 : e6 44 __ INC T0 + 1 
30d6 : a9 ff __ LDA #$ff
30d8 : 8d 01 d6 STA $d601 
30db : c6 45 __ DEC T1 + 0 
30dd : d0 c2 __ BNE $30a1 ; (vdc_wipe_mem.l2 + 0)
.s4:
30df : 20 f8 2a JSR $2af8 ; (vdc_mem_addr@proxy + 0)
.l261:
30e2 : 2c 00 d6 BIT $d600 
30e5 : 10 fb __ BPL $30e2 ; (vdc_wipe_mem.l261 + 0)
.s29:
30e7 : a9 00 __ LDA #$00
30e9 : 8d 01 d6 STA $d601 
30ec : a9 18 __ LDA #$18
30ee : 8d 00 d6 STA $d600 
.l263:
30f1 : 2c 00 d6 BIT $d600 
30f4 : 10 fb __ BPL $30f1 ; (vdc_wipe_mem.l263 + 0)
.s35:
30f6 : ad 01 d6 LDA $d601 
30f9 : 29 7f __ AND #$7f
30fb : a2 18 __ LDX #$18
30fd : 8e 00 d6 STX $d600 
.l265:
3100 : 2c 00 d6 BIT $d600 
3103 : 10 fb __ BPL $3100 ; (vdc_wipe_mem.l265 + 0)
.s41:
3105 : 8d 01 d6 STA $d601 
3108 : a9 1e __ LDA #$1e
310a : 8d 00 d6 STA $d600 
.l267:
310d : 2c 00 d6 BIT $d600 
3110 : 10 fb __ BPL $310d ; (vdc_wipe_mem.l267 + 0)
.s46:
3112 : a9 ff __ LDA #$ff
3114 : 8d 01 d6 STA $d601 
.s1001:
3117 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
3118 : a9 00 __ LDA #$00
311a : a0 04 __ LDY #$04
311c : 91 0d __ STA (P0),y ; (win + 0)
311e : c8 __ __ INY
311f : 91 0d __ STA (P0),y ; (win + 0)
3121 : a5 0f __ LDA P2 ; (sx + 0)
3123 : a0 00 __ LDY #$00
3125 : 91 0d __ STA (P0),y ; (win + 0)
3127 : a5 10 __ LDA P3 ; (sy + 0)
3129 : c8 __ __ INY
312a : 91 0d __ STA (P0),y ; (win + 0)
312c : a5 11 __ LDA P4 ; (wx + 0)
312e : c8 __ __ INY
312f : 91 0d __ STA (P0),y ; (win + 0)
3131 : a5 12 __ LDA P5 ; (wy + 0)
3133 : c8 __ __ INY
3134 : 91 0d __ STA (P0),y ; (win + 0)
3136 : 06 10 __ ASL P3 ; (sy + 0)
3138 : a6 10 __ LDX P3 ; (sy + 0)
313a : bd 00 53 LDA $5300,x ; (multab + 0)
313d : 18 __ __ CLC
313e : 65 0f __ ADC P2 ; (sx + 0)
3140 : 85 1b __ STA ACCU + 0 
3142 : bd 01 53 LDA $5301,x ; (multab + 1)
3145 : 69 00 __ ADC #$00
3147 : a8 __ __ TAY
3148 : ad 88 52 LDA $5288 ; (vdc_state + 8)
314b : 18 __ __ CLC
314c : 65 1b __ ADC ACCU + 0 
314e : 85 1b __ STA ACCU + 0 
3150 : 98 __ __ TYA
3151 : 6d 89 52 ADC $5289 ; (vdc_state + 9)
3154 : a0 07 __ LDY #$07
3156 : 91 0d __ STA (P0),y ; (win + 0)
3158 : a5 1b __ LDA ACCU + 0 
315a : 88 __ __ DEY
315b : 91 0d __ STA (P0),y ; (win + 0)
315d : bd 00 53 LDA $5300,x ; (multab + 0)
3160 : 18 __ __ CLC
3161 : 65 0f __ ADC P2 ; (sx + 0)
3163 : 85 1b __ STA ACCU + 0 
3165 : bd 01 53 LDA $5301,x ; (multab + 1)
3168 : 69 00 __ ADC #$00
316a : aa __ __ TAX
316b : ad 8a 52 LDA $528a ; (vdc_state + 10)
316e : 18 __ __ CLC
316f : 65 1b __ ADC ACCU + 0 
3171 : 85 1b __ STA ACCU + 0 
3173 : 8a __ __ TXA
3174 : 6d 8b 52 ADC $528b ; (vdc_state + 11)
3177 : a0 09 __ LDY #$09
3179 : 91 0d __ STA (P0),y ; (win + 0)
317b : a5 1b __ LDA ACCU + 0 
317d : 88 __ __ DEY
317e : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
3180 : 60 __ __ RTS
--------------------------------------------------------------------
updateMenu: ; updateMenu()->void
.s0:
3181 : a9 37 __ LDA #$37
3183 : 85 0f __ STA P2 
3185 : a9 04 __ LDA #$04
3187 : 85 10 __ STA P3 
3189 : a9 20 __ LDA #$20
318b : 85 11 __ STA P4 
318d : a9 0e __ LDA #$0e
318f : 85 12 __ STA P5 
3191 : a9 0a __ LDA #$0a
3193 : 85 13 __ STA P6 
3195 : ad fe 4b LDA $4bfe ; (mc_menupopup + 0)
3198 : 8d 87 52 STA $5287 ; (vdc_state + 7)
319b : 20 99 2c JSR $2c99 ; (vdc_clear.s0 + 0)
319e : a9 37 __ LDA #$37
31a0 : 85 11 __ STA P4 
31a2 : a9 05 __ LDA #$05
31a4 : 85 12 __ STA P5 
31a6 : a9 56 __ LDA #$56
31a8 : 85 13 __ STA P6 
31aa : a9 46 __ LDA #$46
31ac : 85 14 __ STA P7 
31ae : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
31b1 : e6 12 __ INC P5 
31b3 : a9 64 __ LDA #$64
31b5 : 85 13 __ STA P6 
31b7 : a9 46 __ LDA #$46
31b9 : 85 14 __ STA P7 
31bb : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
31be : e6 12 __ INC P5 
31c0 : a9 6f __ LDA #$6f
31c2 : 85 13 __ STA P6 
31c4 : a9 46 __ LDA #$46
31c6 : 85 14 __ STA P7 
31c8 : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
31cb : e6 12 __ INC P5 
31cd : a9 7a __ LDA #$7a
31cf : 85 13 __ STA P6 
31d1 : a9 46 __ LDA #$46
31d3 : 85 14 __ STA P7 
31d5 : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
31d8 : e6 12 __ INC P5 
31da : a9 82 __ LDA #$82
31dc : 85 13 __ STA P6 
31de : a9 46 __ LDA #$46
31e0 : 85 14 __ STA P7 
31e2 : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
31e5 : e6 12 __ INC P5 
31e7 : a9 8a __ LDA #$8a
31e9 : 85 13 __ STA P6 
31eb : a9 46 __ LDA #$46
31ed : 85 14 __ STA P7 
31ef : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
31f2 : e6 12 __ INC P5 
31f4 : a9 99 __ LDA #$99
31f6 : 85 13 __ STA P6 
31f8 : a9 46 __ LDA #$46
31fa : 85 14 __ STA P7 
31fc : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
31ff : e6 12 __ INC P5 
3201 : a9 a6 __ LDA #$a6
3203 : 85 13 __ STA P6 
3205 : a9 46 __ LDA #$46
3207 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
3209 : a5 13 __ LDA P6 ; (string + 0)
320b : 85 0d __ STA P0 
320d : 85 43 __ STA T0 + 0 
320f : a5 14 __ LDA P7 ; (string + 1)
3211 : 85 0e __ STA P1 
3213 : 85 44 __ STA T0 + 1 
3215 : a5 12 __ LDA P5 ; (y + 0)
3217 : 0a __ __ ASL
3218 : aa __ __ TAX
3219 : bd 00 53 LDA $5300,x ; (multab + 0)
321c : 85 46 __ STA T2 + 0 
321e : bd 01 53 LDA $5301,x ; (multab + 1)
3221 : 85 47 __ STA T2 + 1 
3223 : ad 87 52 LDA $5287 ; (vdc_state + 7)
3226 : 85 48 __ STA T3 + 0 
3228 : 20 51 33 JSR $3351 ; (strlen.s0 + 0)
322b : a5 1b __ LDA ACCU + 0 
322d : d0 01 __ BNE $3230 ; (vdc_prints.s6 + 0)
.s1001:
322f : 60 __ __ RTS
.s6:
3230 : c9 01 __ CMP #$01
3232 : d0 03 __ BNE $3237 ; (vdc_prints.s10 + 0)
3234 : 4c b9 32 JMP $32b9 ; (vdc_prints.s8 + 0)
.s10:
3237 : 85 49 __ STA T4 + 0 
3239 : 18 __ __ CLC
323a : a5 11 __ LDA P4 ; (x + 0)
323c : 65 46 __ ADC T2 + 0 
323e : 85 46 __ STA T2 + 0 
3240 : 90 02 __ BCC $3244 ; (vdc_prints.s1021 + 0)
.s1020:
3242 : e6 47 __ INC T2 + 1 
.s1021:
3244 : 18 __ __ CLC
3245 : 6d 88 52 ADC $5288 ; (vdc_state + 8)
3248 : 85 0d __ STA P0 
324a : ad 89 52 LDA $5289 ; (vdc_state + 9)
324d : 65 47 __ ADC T2 + 1 
324f : 85 0e __ STA P1 
3251 : 20 65 2d JSR $2d65 ; (vdc_mem_addr.s0 + 0)
3254 : a5 49 __ LDA T4 + 0 
3256 : f0 18 __ BEQ $3270 ; (vdc_prints.s15 + 0)
.s45:
3258 : a0 00 __ LDY #$00
.l13:
325a : 84 45 __ STY T1 + 0 
325c : b1 43 __ LDA (T0 + 0),y 
325e : 20 75 33 JSR $3375 ; (pet2screen.s0 + 0)
.l175:
3261 : 2c 00 d6 BIT $d600 
3264 : 10 fb __ BPL $3261 ; (vdc_prints.l175 + 0)
.s18:
3266 : 8d 01 d6 STA $d601 
3269 : a4 45 __ LDY T1 + 0 
326b : c8 __ __ INY
326c : c4 49 __ CPY T4 + 0 
326e : 90 ea __ BCC $325a ; (vdc_prints.l13 + 0)
.s15:
3270 : ad 8a 52 LDA $528a ; (vdc_state + 10)
3273 : 18 __ __ CLC
3274 : 65 46 __ ADC T2 + 0 
3276 : 85 0d __ STA P0 
3278 : ad 8b 52 LDA $528b ; (vdc_state + 11)
327b : 65 47 __ ADC T2 + 1 
327d : 85 0e __ STA P1 
327f : 20 65 2d JSR $2d65 ; (vdc_mem_addr.s0 + 0)
3282 : a6 49 __ LDX T4 + 0 
3284 : ca __ __ DEX
.l178:
3285 : 2c 00 d6 BIT $d600 
3288 : 10 fb __ BPL $3285 ; (vdc_prints.l178 + 0)
.s22:
328a : a5 48 __ LDA T3 + 0 
328c : 8d 01 d6 STA $d601 
328f : a9 18 __ LDA #$18
3291 : 8d 00 d6 STA $d600 
.l180:
3294 : 2c 00 d6 BIT $d600 
3297 : 10 fb __ BPL $3294 ; (vdc_prints.l180 + 0)
.s28:
3299 : ad 01 d6 LDA $d601 
329c : 29 7f __ AND #$7f
329e : a0 18 __ LDY #$18
32a0 : 8c 00 d6 STY $d600 
.l182:
32a3 : 2c 00 d6 BIT $d600 
32a6 : 10 fb __ BPL $32a3 ; (vdc_prints.l182 + 0)
.s34:
32a8 : 8d 01 d6 STA $d601 
32ab : a9 1e __ LDA #$1e
32ad : 8d 00 d6 STA $d600 
.l184:
32b0 : 2c 00 d6 BIT $d600 
32b3 : 10 fb __ BPL $32b0 ; (vdc_prints.l184 + 0)
.s39:
32b5 : 8e 01 d6 STX $d601 
32b8 : 60 __ __ RTS
.s8:
32b9 : a5 11 __ LDA P4 ; (x + 0)
32bb : 85 0d __ STA P0 
32bd : a5 12 __ LDA P5 ; (y + 0)
32bf : 85 0e __ STA P1 
32c1 : a5 48 __ LDA T3 + 0 
32c3 : 85 10 __ STA P3 
32c5 : a0 00 __ LDY #$00
32c7 : b1 13 __ LDA (P6),y ; (string + 0)
32c9 : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
32cb : a5 0e __ LDA P1 ; (y + 0)
32cd : 0a __ __ ASL
32ce : a2 12 __ LDX #$12
32d0 : 8e 00 d6 STX $d600 
32d3 : aa __ __ TAX
32d4 : 18 __ __ CLC
32d5 : a5 0d __ LDA P0 ; (x + 0)
32d7 : 7d 00 53 ADC $5300,x ; (multab + 0)
32da : 85 1b __ STA ACCU + 0 
32dc : a9 00 __ LDA #$00
32de : 7d 01 53 ADC $5301,x ; (multab + 1)
32e1 : 85 1c __ STA ACCU + 1 
32e3 : 18 __ __ CLC
32e4 : a5 1b __ LDA ACCU + 0 
32e6 : 6d 88 52 ADC $5288 ; (vdc_state + 8)
32e9 : aa __ __ TAX
32ea : a5 1c __ LDA ACCU + 1 
32ec : 6d 89 52 ADC $5289 ; (vdc_state + 9)
.l167:
32ef : 2c 00 d6 BIT $d600 
32f2 : 10 fb __ BPL $32ef ; (vdc_printc.l167 + 0)
.s9:
32f4 : 8d 01 d6 STA $d601 
32f7 : a9 13 __ LDA #$13
32f9 : 8d 00 d6 STA $d600 
.l169:
32fc : 2c 00 d6 BIT $d600 
32ff : 10 fb __ BPL $32fc ; (vdc_printc.l169 + 0)
.s14:
3301 : 8e 01 d6 STX $d601 
3304 : a9 1f __ LDA #$1f
3306 : 8d 00 d6 STA $d600 
.l171:
3309 : 2c 00 d6 BIT $d600 
330c : 10 fb __ BPL $3309 ; (vdc_printc.l171 + 0)
.s18:
330e : a5 0f __ LDA P2 ; (val + 0)
3310 : 8d 01 d6 STA $d601 
3313 : ad 8a 52 LDA $528a ; (vdc_state + 10)
3316 : 18 __ __ CLC
3317 : 65 1b __ ADC ACCU + 0 
3319 : a8 __ __ TAY
331a : a9 12 __ LDA #$12
331c : 8d 00 d6 STA $d600 
331f : ad 8b 52 LDA $528b ; (vdc_state + 11)
3322 : 65 1c __ ADC ACCU + 1 
.l173:
3324 : 2c 00 d6 BIT $d600 
3327 : 10 fb __ BPL $3324 ; (vdc_printc.l173 + 0)
.s25:
3329 : 8d 01 d6 STA $d601 
332c : a9 13 __ LDA #$13
332e : 8d 00 d6 STA $d600 
.l175:
3331 : 2c 00 d6 BIT $d600 
3334 : 10 fb __ BPL $3331 ; (vdc_printc.l175 + 0)
.s30:
3336 : 8c 01 d6 STY $d601 
3339 : a9 1f __ LDA #$1f
333b : 8d 00 d6 STA $d600 
.l177:
333e : 2c 00 d6 BIT $d600 
3341 : 10 fb __ BPL $333e ; (vdc_printc.l177 + 0)
.s34:
3343 : a5 10 __ LDA P3 ; (attr + 0)
3345 : 8d 01 d6 STA $d601 
.s1001:
3348 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
3349 : a5 17 __ LDA P10 
334b : 85 0d __ STA P0 
334d : a5 18 __ LDA P11 
334f : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
3351 : a9 00 __ LDA #$00
3353 : 85 1b __ STA ACCU + 0 
3355 : 85 1c __ STA ACCU + 1 
3357 : a8 __ __ TAY
3358 : b1 0d __ LDA (P0),y ; (str + 0)
335a : f0 18 __ BEQ $3374 ; (strlen.s1001 + 0)
.s2:
335c : a5 0d __ LDA P0 ; (str + 0)
335e : 85 1b __ STA ACCU + 0 
3360 : a2 00 __ LDX #$00
.l1002:
3362 : c8 __ __ INY
3363 : d0 01 __ BNE $3366 ; (strlen.s1005 + 0)
.s1004:
3365 : e8 __ __ INX
.s1005:
3366 : 8a __ __ TXA
3367 : 18 __ __ CLC
3368 : 65 0e __ ADC P1 ; (str + 1)
336a : 85 1c __ STA ACCU + 1 
336c : b1 1b __ LDA (ACCU + 0),y 
336e : d0 f2 __ BNE $3362 ; (strlen.l1002 + 0)
.s1003:
3370 : 86 1c __ STX ACCU + 1 
3372 : 84 1b __ STY ACCU + 0 
.s1001:
3374 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
3375 : c9 20 __ CMP #$20
3377 : b0 03 __ BCS $337c ; (pet2screen.s2 + 0)
.s1:
3379 : 69 80 __ ADC #$80
337b : 60 __ __ RTS
.s2:
337c : c9 40 __ CMP #$40
337e : 90 27 __ BCC $33a7 ; (pet2screen.s21 + 0)
.s7:
3380 : c9 60 __ CMP #$60
3382 : 90 17 __ BCC $339b ; (pet2screen.s4 + 0)
.s11:
3384 : 09 00 __ ORA #$00
3386 : 30 04 __ BMI $338c ; (pet2screen.s9 + 0)
.s8:
3388 : 38 __ __ SEC
3389 : e9 20 __ SBC #$20
338b : 60 __ __ RTS
.s9:
338c : c9 80 __ CMP #$80
338e : 90 17 __ BCC $33a7 ; (pet2screen.s21 + 0)
.s15:
3390 : c9 a0 __ CMP #$a0
3392 : b0 03 __ BCS $3397 ; (pet2screen.s19 + 0)
.s12:
3394 : 69 40 __ ADC #$40
3396 : 60 __ __ RTS
.s19:
3397 : c9 c0 __ CMP #$c0
3399 : b0 04 __ BCS $339f ; (pet2screen.s23 + 0)
.s4:
339b : 38 __ __ SEC
339c : e9 40 __ SBC #$40
339e : 60 __ __ RTS
.s23:
339f : c9 ff __ CMP #$ff
33a1 : b0 04 __ BCS $33a7 ; (pet2screen.s21 + 0)
.s20:
33a3 : 38 __ __ SEC
33a4 : e9 80 __ SBC #$80
33a6 : 60 __ __ RTS
.s21:
33a7 : c9 ff __ CMP #$ff
33a9 : d0 02 __ BNE $33ad ; (pet2screen.s1001 + 0)
.s24:
33ab : a9 5e __ LDA #$5e
.s1001:
33ad : 60 __ __ RTS
--------------------------------------------------------------------
33ae : __ __ __ BYT 76 64 63 73 65 20 2d 20 70 72 67 20 67 45 4e 45 : vdcse - prg gENE
33be : __ __ __ BYT 52 41 54 4f 52 2e 00                            : RATOR..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
33c5 : a9 00 __ LDA #$00
33c7 : 8d fc bf STA $bffc ; (sstack + 4)
33ca : a0 02 __ LDY #$02
33cc : b1 23 __ LDA (SP + 0),y 
33ce : 85 16 __ STA P9 
33d0 : c8 __ __ INY
33d1 : b1 23 __ LDA (SP + 0),y 
33d3 : 85 17 __ STA P10 
33d5 : c8 __ __ INY
33d6 : b1 23 __ LDA (SP + 0),y 
33d8 : 8d f8 bf STA $bff8 ; (sstack + 0)
33db : c8 __ __ INY
33dc : b1 23 __ LDA (SP + 0),y 
33de : 8d f9 bf STA $bff9 ; (sstack + 1)
33e1 : 18 __ __ CLC
33e2 : a5 23 __ LDA SP + 0 
33e4 : 69 06 __ ADC #$06
33e6 : 8d fa bf STA $bffa ; (sstack + 2)
33e9 : a5 24 __ LDA SP + 1 
33eb : 69 00 __ ADC #$00
33ed : 8d fb bf STA $bffb ; (sstack + 3)
33f0 : 4c 1e 23 JMP $231e ; (sformat.s1000 + 0)
--------------------------------------------------------------------
33f3 : __ __ __ BYT 24 00                                           : $.
--------------------------------------------------------------------
krnio_open@proxy: ; krnio_open@proxy
33f5 : a5 10 __ LDA P3 
33f7 : 85 0e __ STA P1 
33f9 : 4c ce 3c JMP $3cce ; (krnio_open.s0 + 0)
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
33fc : 4c b7 ff JMP $ffb7 
--------------------------------------------------------------------
spentry:
33ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3400 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
3410 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 2c 20 56 : BY xANDER mOL, V
3420 : __ __ __ BYT 45 52 53 49 4f 4e 20 25 53 00                   : ERSION %S.
--------------------------------------------------------------------
342a : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 31 35 2d 31 33 32 : V20-20240415-132
343a : __ __ __ BYT 38 00                                           : 8.
--------------------------------------------------------------------
filepicker: ; filepicker(u8)->void
.s1000:
343c : a2 05 __ LDX #$05
343e : b5 53 __ LDA T0 + 0,x 
3440 : 9d cd bf STA $bfcd,x ; (buff + 35)
3443 : ca __ __ DEX
3444 : 10 f8 __ BPL $343e ; (filepicker.s1000 + 2)
.s0:
3446 : a9 0a __ LDA #$0a
3448 : 85 0f __ STA P2 
344a : a9 02 __ LDA #$02
344c : 85 10 __ STA P3 
344e : a9 20 __ LDA #$20
3450 : 85 11 __ STA P4 
3452 : a9 3c __ LDA #$3c
3454 : 85 12 __ STA P5 
3456 : a9 14 __ LDA #$14
3458 : 85 13 __ STA P6 
345a : a9 00 __ LDA #$00
345c : a2 21 __ LDX #$21
.l1002:
345e : ca __ __ DEX
345f : 9d 90 53 STA $5390,x ; (cwd + 0)
3462 : d0 fa __ BNE $345e ; (filepicker.l1002 + 0)
.s1003:
3464 : 8d b1 53 STA $53b1 ; (disk_id_buf + 0)
3467 : 8d b2 53 STA $53b2 ; (disk_id_buf + 1)
346a : 8d b3 53 STA $53b3 ; (disk_id_buf + 2)
346d : 8d b4 53 STA $53b4 ; (disk_id_buf + 3)
3470 : 8d b5 53 STA $53b5 ; (disk_id_buf + 4)
3473 : a2 15 __ LDX #$15
.l1004:
3475 : ca __ __ DEX
3476 : 9d d8 51 STA $51d8,x ; (filename + 0)
3479 : d0 fa __ BNE $3475 ; (filepicker.l1004 + 0)
.s1005:
347b : ad fe 4b LDA $4bfe ; (mc_menupopup + 0)
347e : 85 53 __ STA T0 + 0 
3480 : 8d 87 52 STA $5287 ; (vdc_state + 7)
3483 : 20 99 2c JSR $2c99 ; (vdc_clear.s0 + 0)
3486 : a9 0b __ LDA #$0b
3488 : 85 11 __ STA P4 
348a : a9 03 __ LDA #$03
348c : 85 12 __ STA P5 
348e : a5 53 __ LDA T0 + 0 
3490 : 09 20 __ ORA #$20
3492 : 85 54 __ STA T1 + 0 
3494 : 8d 87 52 STA $5287 ; (vdc_state + 7)
3497 : a9 41 __ LDA #$41
3499 : 85 13 __ STA P6 
349b : a9 39 __ LDA #$39
349d : 85 14 __ STA P7 
349f : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
34a2 : a5 54 __ LDA T1 + 0 
34a4 : 29 df __ AND #$df
34a6 : 8d 87 52 STA $5287 ; (vdc_state + 7)
34a9 : ad fe 51 LDA $51fe ; (targetdevice + 0)
34ac : 8d ff bf STA $bfff ; (sstack + 7)
34af : 20 59 39 JSR $3959 ; (refreshDir.s0 + 0)
34b2 : 20 81 31 JSR $3181 ; (updateMenu.s0 + 0)
.l3:
34b5 : ad a9 53 LDA $53a9 ; (cwd + 25)
34b8 : 85 54 __ STA T1 + 0 
34ba : 8d b6 53 STA $53b6 ; (current + 0)
34bd : ad aa 53 LDA $53aa ; (cwd + 26)
34c0 : 85 55 __ STA T1 + 1 
34c2 : 8d b7 53 STA $53b7 ; (current + 1)
34c5 : ad ad 53 LDA $53ad ; (cwd + 29)
34c8 : 85 56 __ STA T2 + 0 
34ca : ad ae 53 LDA $53ae ; (cwd + 30)
34cd : 85 57 __ STA T2 + 1 
34cf : 20 b1 46 JSR $46b1 ; (vdcwin_getch.s0 + 0)
34d2 : a5 1b __ LDA ACCU + 0 
34d4 : 85 43 __ STA T3 + 0 
34d6 : a5 1c __ LDA ACCU + 1 
34d8 : 85 44 __ STA T3 + 1 
34da : d0 09 __ BNE $34e5 ; (filepicker.s89 + 0)
.s1058:
34dc : a5 1b __ LDA ACCU + 0 
34de : c9 32 __ CMP #$32
34e0 : d0 03 __ BNE $34e5 ; (filepicker.s89 + 0)
34e2 : 4c a3 36 JMP $36a3 ; (filepicker.s7 + 0)
.s89:
34e5 : a5 56 __ LDA T2 + 0 
34e7 : 85 1b __ STA ACCU + 0 
34e9 : a5 57 __ LDA T2 + 1 
34eb : 85 1c __ STA ACCU + 1 
34ed : a9 0e __ LDA #$0e
34ef : 85 03 __ STA WORK + 0 
34f1 : a9 00 __ LDA #$00
34f3 : 85 04 __ STA WORK + 1 
34f5 : 20 1f 4d JSR $4d1f ; (divmod + 0)
34f8 : a5 1b __ LDA ACCU + 0 
34fa : 85 45 __ STA T4 + 0 
34fc : 0a __ __ ASL
34fd : 0a __ __ ASL
34fe : 0a __ __ ASL
34ff : 38 __ __ SEC
3500 : e5 1b __ SBC ACCU + 0 
3502 : 0a __ __ ASL
3503 : 49 ff __ EOR #$ff
3505 : 38 __ __ SEC
3506 : 65 56 __ ADC T2 + 0 
3508 : 85 58 __ STA T5 + 0 
350a : 18 __ __ CLC
350b : 69 06 __ ADC #$06
350d : 85 47 __ STA T6 + 0 
350f : a5 44 __ LDA T3 + 1 
3511 : 10 03 __ BPL $3516 ; (filepicker.s1057 + 0)
3513 : 4c ff 37 JMP $37ff ; (filepicker.s91 + 0)
.s1057:
3516 : d0 09 __ BNE $3521 ; (filepicker.s90 + 0)
.s1056:
3518 : a5 43 __ LDA T3 + 0 
351a : c9 32 __ CMP #$32
351c : b0 03 __ BCS $3521 ; (filepicker.s90 + 0)
351e : 4c ff 37 JMP $37ff ; (filepicker.s91 + 0)
.s90:
3521 : a5 44 __ LDA T3 + 1 
3523 : d0 90 __ BNE $34b5 ; (filepicker.l3 + 0)
.s1032:
3525 : a5 43 __ LDA T3 + 0 
3527 : c9 55 __ CMP #$55
3529 : d0 6f __ BNE $359a ; (filepicker.s1031 + 0)
.s76:
352b : ad a7 53 LDA $53a7 ; (cwd + 23)
352e : 0d a8 53 ORA $53a8 ; (cwd + 24)
3531 : f0 82 __ BEQ $34b5 ; (filepicker.l3 + 0)
.s80:
3533 : a0 17 __ LDY #$17
3535 : b1 54 __ LDA (T1 + 0),y 
3537 : c8 __ __ INY
3538 : 11 54 __ ORA (T1 + 0),y 
353a : d0 03 __ BNE $353f ; (filepicker.s77 + 0)
353c : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s77:
353f : a5 47 __ LDA T6 + 0 
3541 : 8d fd bf STA $bffd ; (sstack + 5)
3544 : a9 00 __ LDA #$00
3546 : 8d a9 53 STA $53a9 ; (cwd + 25)
3549 : 8d aa 53 STA $53aa ; (cwd + 26)
354c : 20 55 44 JSR $4455 ; (printElementPriv.s1000 + 0)
354f : a2 0e __ LDX #$0e
.l82:
3551 : ad b6 53 LDA $53b6 ; (current + 0)
3554 : 85 54 __ STA T1 + 0 
3556 : ad b7 53 LDA $53b7 ; (current + 1)
3559 : 85 55 __ STA T1 + 1 
355b : a0 17 __ LDY #$17
355d : b1 54 __ LDA (T1 + 0),y 
355f : 85 02 __ STA $02 
3561 : c8 __ __ INY
3562 : b1 54 __ LDA (T1 + 0),y 
3564 : a8 __ __ TAY
3565 : 05 02 __ ORA $02 
3567 : f0 22 __ BEQ $358b ; (filepicker.s172 + 0)
.s85:
3569 : 8c b7 53 STY $53b7 ; (current + 1)
356c : 8c aa 53 STY $53aa ; (cwd + 26)
356f : 8c ac 53 STY $53ac ; (cwd + 28)
3572 : a5 02 __ LDA $02 
3574 : 8d b6 53 STA $53b6 ; (current + 0)
3577 : 8d a9 53 STA $53a9 ; (cwd + 25)
357a : 8d ab 53 STA $53ab ; (cwd + 27)
357d : ad ad 53 LDA $53ad ; (cwd + 29)
3580 : 18 __ __ CLC
3581 : 69 ff __ ADC #$ff
3583 : 8d ad 53 STA $53ad ; (cwd + 29)
3586 : b0 03 __ BCS $358b ; (filepicker.s172 + 0)
.s1063:
3588 : ce ae 53 DEC $53ae ; (cwd + 30)
.s172:
358b : ca __ __ DEX
358c : d0 c3 __ BNE $3551 ; (filepicker.l82 + 0)
.s228:
358e : ad fe 51 LDA $51fe ; (targetdevice + 0)
3591 : 8d fe bf STA $bffe ; (sstack + 6)
3594 : 20 94 39 JSR $3994 ; (printDir.s1000 + 0)
3597 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s1031:
359a : b0 03 __ BCS $359f ; (filepicker.s1018 + 0)
359c : 4c bf 36 JMP $36bf ; (filepicker.s107 + 0)
.s1018:
359f : c9 89 __ CMP #$89
35a1 : d0 03 __ BNE $35a6 ; (filepicker.s1013 + 0)
35a3 : 4c a3 36 JMP $36a3 ; (filepicker.s7 + 0)
.s1013:
35a6 : b0 13 __ BCS $35bb ; (filepicker.s1010 + 0)
.s115:
35a8 : c9 85 __ CMP #$85
35aa : f0 03 __ BEQ $35af ; (filepicker.s227 + 0)
35ac : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s227:
35af : ad fe 51 LDA $51fe ; (targetdevice + 0)
35b2 : 8d ff bf STA $bfff ; (sstack + 7)
35b5 : 20 59 39 JSR $3959 ; (refreshDir.s0 + 0)
35b8 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s1010:
35bb : c9 91 __ CMP #$91
35bd : f0 03 __ BEQ $35c2 ; (filepicker.s43 + 0)
35bf : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s43:
35c2 : ad a7 53 LDA $53a7 ; (cwd + 23)
35c5 : 0d a8 53 ORA $53a8 ; (cwd + 24)
35c8 : d0 03 __ BNE $35cd ; (filepicker.s48 + 0)
35ca : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s48:
35cd : a5 54 __ LDA T1 + 0 
35cf : 05 55 __ ORA T1 + 1 
35d1 : d0 03 __ BNE $35d6 ; (filepicker.s47 + 0)
35d3 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s47:
35d6 : a0 17 __ LDY #$17
35d8 : b1 54 __ LDA (T1 + 0),y 
35da : 85 02 __ STA $02 
35dc : c8 __ __ INY
35dd : b1 54 __ LDA (T1 + 0),y 
35df : 85 55 __ STA T1 + 1 
35e1 : 05 02 __ ORA $02 
35e3 : d0 03 __ BNE $35e8 ; (filepicker.s44 + 0)
35e5 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s44:
35e8 : a5 02 __ LDA $02 
35ea : 8d b6 53 STA $53b6 ; (current + 0)
35ed : 8d a9 53 STA $53a9 ; (cwd + 25)
35f0 : a5 55 __ LDA T1 + 1 
35f2 : 8d b7 53 STA $53b7 ; (current + 1)
35f5 : 8d aa 53 STA $53aa ; (cwd + 26)
35f8 : 18 __ __ CLC
35f9 : a5 56 __ LDA T2 + 0 
35fb : 69 ff __ ADC #$ff
35fd : 8d ad 53 STA $53ad ; (cwd + 29)
3600 : a5 57 __ LDA T2 + 1 
3602 : 69 ff __ ADC #$ff
3604 : 8d ae 53 STA $53ae ; (cwd + 30)
3607 : 38 __ __ SEC
3608 : a5 56 __ LDA T2 + 0 
360a : e9 01 __ SBC #$01
360c : 85 1b __ STA ACCU + 0 
360e : a5 57 __ LDA T2 + 1 
3610 : e9 00 __ SBC #$00
3612 : 85 1c __ STA ACCU + 1 
3614 : a9 0e __ LDA #$0e
3616 : 85 03 __ STA WORK + 0 
3618 : a9 00 __ LDA #$00
361a : 85 04 __ STA WORK + 1 
361c : 20 1f 4d JSR $4d1f ; (divmod + 0)
361f : a5 45 __ LDA T4 + 0 
3621 : c5 1b __ CMP ACCU + 0 
3623 : f0 40 __ BEQ $3665 ; (filepicker.s50 + 0)
.s49:
3625 : a9 0d __ LDA #$0d
3627 : 85 53 __ STA T0 + 0 
.l53:
3629 : ad b6 53 LDA $53b6 ; (current + 0)
362c : 85 56 __ STA T2 + 0 
362e : ad b7 53 LDA $53b7 ; (current + 1)
3631 : 85 57 __ STA T2 + 1 
3633 : a0 17 __ LDY #$17
3635 : b1 56 __ LDA (T2 + 0),y 
3637 : aa __ __ TAX
3638 : c8 __ __ INY
3639 : b1 56 __ LDA (T2 + 0),y 
363b : 85 57 __ STA T2 + 1 
363d : d0 03 __ BNE $3642 ; (filepicker.s56 + 0)
.s1006:
363f : 8a __ __ TXA
3640 : f0 08 __ BEQ $364a ; (filepicker.s174 + 0)
.s56:
3642 : 8e b6 53 STX $53b6 ; (current + 0)
3645 : a5 57 __ LDA T2 + 1 
3647 : 8d b7 53 STA $53b7 ; (current + 1)
.s174:
364a : c6 53 __ DEC T0 + 0 
364c : d0 db __ BNE $3629 ; (filepicker.l53 + 0)
.s55:
364e : ad b6 53 LDA $53b6 ; (current + 0)
3651 : 85 54 __ STA T1 + 0 
3653 : ad b7 53 LDA $53b7 ; (current + 1)
3656 : 85 55 __ STA T1 + 1 
.s230:
3658 : a5 54 __ LDA T1 + 0 
365a : 8d ab 53 STA $53ab ; (cwd + 27)
365d : a5 55 __ LDA T1 + 1 
365f : 8d ac 53 STA $53ac ; (cwd + 28)
3662 : 4c 8e 35 JMP $358e ; (filepicker.s228 + 0)
.s50:
3665 : a5 02 __ LDA $02 
3667 : 85 54 __ STA T1 + 0 
3669 : a5 47 __ LDA T6 + 0 
366b : 8d fd bf STA $bffd ; (sstack + 5)
366e : a0 15 __ LDY #$15
3670 : b1 54 __ LDA (T1 + 0),y 
3672 : 8d b6 53 STA $53b6 ; (current + 0)
3675 : c8 __ __ INY
3676 : b1 54 __ LDA (T1 + 0),y 
3678 : 8d b7 53 STA $53b7 ; (current + 1)
367b : 20 55 44 JSR $4455 ; (printElementPriv.s1000 + 0)
367e : ad b6 53 LDA $53b6 ; (current + 0)
3681 : 85 54 __ STA T1 + 0 
3683 : ad b7 53 LDA $53b7 ; (current + 1)
3686 : 85 55 __ STA T1 + 1 
3688 : a0 17 __ LDY #$17
368a : b1 54 __ LDA (T1 + 0),y 
368c : 8d b6 53 STA $53b6 ; (current + 0)
368f : c8 __ __ INY
3690 : b1 54 __ LDA (T1 + 0),y 
3692 : 8d b7 53 STA $53b7 ; (current + 1)
3695 : 18 __ __ CLC
3696 : a5 58 __ LDA T5 + 0 
3698 : 69 05 __ ADC #$05
.s229:
369a : 8d fd bf STA $bffd ; (sstack + 5)
369d : 20 55 44 JSR $4455 ; (printElementPriv.s1000 + 0)
36a0 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s7:
36a3 : ee fe 51 INC $51fe ; (targetdevice + 0)
36a6 : ad fe 51 LDA $51fe ; (targetdevice + 0)
36a9 : c9 1f __ CMP #$1f
36ab : 90 05 __ BCC $36b2 ; (filepicker.s10 + 0)
.s8:
36ad : a9 08 __ LDA #$08
.s1059:
36af : 8d fe 51 STA $51fe ; (targetdevice + 0)
.s10:
36b2 : a9 00 __ LDA #$00
36b4 : a2 21 __ LDX #$21
.l1014:
36b6 : ca __ __ DEX
36b7 : 9d 90 53 STA $5390,x ; (cwd + 0)
36ba : d0 fa __ BNE $36b6 ; (filepicker.l1014 + 0)
36bc : 4c af 35 JMP $35af ; (filepicker.s227 + 0)
.s107:
36bf : c9 50 __ CMP #$50
36c1 : d0 63 __ BNE $3726 ; (filepicker.s108 + 0)
.s64:
36c3 : ad a7 53 LDA $53a7 ; (cwd + 23)
36c6 : 0d a8 53 ORA $53a8 ; (cwd + 24)
36c9 : d0 03 __ BNE $36ce ; (filepicker.s68 + 0)
36cb : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s68:
36ce : a0 15 __ LDY #$15
36d0 : b1 54 __ LDA (T1 + 0),y 
36d2 : c8 __ __ INY
36d3 : 11 54 __ ORA (T1 + 0),y 
36d5 : d0 03 __ BNE $36da ; (filepicker.s65 + 0)
36d7 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s65:
36da : a5 47 __ LDA T6 + 0 
36dc : 8d fd bf STA $bffd ; (sstack + 5)
36df : a9 00 __ LDA #$00
36e1 : 8d a9 53 STA $53a9 ; (cwd + 25)
36e4 : 8d aa 53 STA $53aa ; (cwd + 26)
36e7 : 20 55 44 JSR $4455 ; (printElementPriv.s1000 + 0)
36ea : a2 0e __ LDX #$0e
.l70:
36ec : ad b6 53 LDA $53b6 ; (current + 0)
36ef : 85 54 __ STA T1 + 0 
36f1 : ad b7 53 LDA $53b7 ; (current + 1)
36f4 : 85 55 __ STA T1 + 1 
36f6 : a0 15 __ LDY #$15
36f8 : b1 54 __ LDA (T1 + 0),y 
36fa : 85 02 __ STA $02 
36fc : c8 __ __ INY
36fd : b1 54 __ LDA (T1 + 0),y 
36ff : a8 __ __ TAY
3700 : 05 02 __ ORA $02 
3702 : f0 1c __ BEQ $3720 ; (filepicker.s173 + 0)
.s73:
3704 : 8c b7 53 STY $53b7 ; (current + 1)
3707 : 8c aa 53 STY $53aa ; (cwd + 26)
370a : 8c ac 53 STY $53ac ; (cwd + 28)
370d : a5 02 __ LDA $02 
370f : 8d b6 53 STA $53b6 ; (current + 0)
3712 : 8d a9 53 STA $53a9 ; (cwd + 25)
3715 : 8d ab 53 STA $53ab ; (cwd + 27)
3718 : ee ad 53 INC $53ad ; (cwd + 29)
371b : d0 03 __ BNE $3720 ; (filepicker.s173 + 0)
.s1065:
371d : ee ae 53 INC $53ae ; (cwd + 30)
.s173:
3720 : ca __ __ DEX
3721 : d0 c9 __ BNE $36ec ; (filepicker.l70 + 0)
3723 : 4c 8e 35 JMP $358e ; (filepicker.s228 + 0)
.s108:
3726 : 90 03 __ BCC $372b ; (filepicker.s110 + 0)
3728 : 4c d4 37 JMP $37d4 ; (filepicker.s109 + 0)
.s110:
372b : c9 45 __ CMP #$45
372d : f0 03 __ BEQ $3732 ; (filepicker.s19 + 0)
372f : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s19:
3732 : ad a7 53 LDA $53a7 ; (cwd + 23)
3735 : 0d a8 53 ORA $53a8 ; (cwd + 24)
3738 : d0 03 __ BNE $373d ; (filepicker.s20 + 0)
373a : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s20:
373d : ad a7 53 LDA $53a7 ; (cwd + 23)
3740 : 8d b6 53 STA $53b6 ; (current + 0)
3743 : ad a8 53 LDA $53a8 ; (cwd + 24)
3746 : 8d b7 53 STA $53b7 ; (current + 1)
3749 : a9 00 __ LDA #$00
374b : 85 54 __ STA T1 + 0 
374d : 85 55 __ STA T1 + 1 
.l24:
374f : ad b6 53 LDA $53b6 ; (current + 0)
3752 : 85 43 __ STA T3 + 0 
3754 : ad b7 53 LDA $53b7 ; (current + 1)
3757 : 85 44 __ STA T3 + 1 
3759 : a0 15 __ LDY #$15
375b : b1 43 __ LDA (T3 + 0),y 
375d : 85 45 __ STA T4 + 0 
375f : c8 __ __ INY
3760 : b1 43 __ LDA (T3 + 0),y 
3762 : 85 46 __ STA T4 + 1 
3764 : d0 18 __ BNE $377e ; (filepicker.s26 + 0)
.s1023:
3766 : a5 45 __ LDA T4 + 0 
3768 : d0 14 __ BNE $377e ; (filepicker.s26 + 0)
.s25:
376a : a5 43 __ LDA T3 + 0 
376c : 8d a9 53 STA $53a9 ; (cwd + 25)
376f : a5 44 __ LDA T3 + 1 
3771 : 8d aa 53 STA $53aa ; (cwd + 26)
3774 : a5 54 __ LDA T1 + 0 
3776 : 8d ad 53 STA $53ad ; (cwd + 29)
3779 : a5 55 __ LDA T1 + 1 
377b : 4c ce 37 JMP $37ce ; (filepicker.s1060 + 0)
.s26:
377e : a5 45 __ LDA T4 + 0 
3780 : 8d b6 53 STA $53b6 ; (current + 0)
3783 : a5 46 __ LDA T4 + 1 
3785 : 8d b7 53 STA $53b7 ; (current + 1)
3788 : a5 54 __ LDA T1 + 0 
378a : 85 1b __ STA ACCU + 0 
378c : a5 55 __ LDA T1 + 1 
378e : 85 1c __ STA ACCU + 1 
3790 : a9 0e __ LDA #$0e
3792 : 85 03 __ STA WORK + 0 
3794 : a9 00 __ LDA #$00
3796 : 85 04 __ STA WORK + 1 
3798 : 20 1f 4d JSR $4d1f ; (divmod + 0)
379b : a5 1b __ LDA ACCU + 0 
379d : 85 56 __ STA T2 + 0 
379f : 18 __ __ CLC
37a0 : a5 54 __ LDA T1 + 0 
37a2 : 69 01 __ ADC #$01
37a4 : 85 54 __ STA T1 + 0 
37a6 : 85 1b __ STA ACCU + 0 
37a8 : a5 55 __ LDA T1 + 1 
37aa : 69 00 __ ADC #$00
37ac : 85 55 __ STA T1 + 1 
37ae : 85 1c __ STA ACCU + 1 
37b0 : a9 0e __ LDA #$0e
37b2 : 85 03 __ STA WORK + 0 
37b4 : a9 00 __ LDA #$00
37b6 : 85 04 __ STA WORK + 1 
37b8 : 20 1f 4d JSR $4d1f ; (divmod + 0)
37bb : a5 56 __ LDA T2 + 0 
37bd : c5 1b __ CMP ACCU + 0 
37bf : f0 8e __ BEQ $374f ; (filepicker.l24 + 0)
.s29:
37c1 : a5 45 __ LDA T4 + 0 
37c3 : 8d ab 53 STA $53ab ; (cwd + 27)
37c6 : a5 46 __ LDA T4 + 1 
37c8 : 8d ac 53 STA $53ac ; (cwd + 28)
37cb : 4c 4f 37 JMP $374f ; (filepicker.l24 + 0)
.s1060:
37ce : 8d ae 53 STA $53ae ; (cwd + 30)
37d1 : 4c 8e 35 JMP $358e ; (filepicker.s228 + 0)
.s109:
37d4 : c9 54 __ CMP #$54
37d6 : f0 03 __ BEQ $37db ; (filepicker.s15 + 0)
37d8 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s15:
37db : ad a7 53 LDA $53a7 ; (cwd + 23)
37de : 0d a8 53 ORA $53a8 ; (cwd + 24)
37e1 : d0 03 __ BNE $37e6 ; (filepicker.s16 + 0)
37e3 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s16:
37e6 : ad a7 53 LDA $53a7 ; (cwd + 23)
37e9 : 8d a9 53 STA $53a9 ; (cwd + 25)
37ec : 8d ab 53 STA $53ab ; (cwd + 27)
37ef : ad a8 53 LDA $53a8 ; (cwd + 24)
37f2 : 8d aa 53 STA $53aa ; (cwd + 26)
37f5 : 8d ac 53 STA $53ac ; (cwd + 28)
37f8 : a9 00 __ LDA #$00
37fa : 8d ad 53 STA $53ad ; (cwd + 29)
37fd : f0 cf __ BEQ $37ce ; (filepicker.s1060 + 0)
.s91:
37ff : a5 44 __ LDA T3 + 1 
3801 : d0 06 __ BNE $3809 ; (filepicker.s92 + 0)
.s1055:
3803 : a5 43 __ LDA T3 + 0 
3805 : c9 13 __ CMP #$13
3807 : f0 d2 __ BEQ $37db ; (filepicker.s15 + 0)
.s92:
3809 : a5 44 __ LDA T3 + 1 
380b : 30 51 __ BMI $385e ; (filepicker.s94 + 0)
.s1054:
380d : d0 06 __ BNE $3815 ; (filepicker.s93 + 0)
.s1053:
380f : a5 43 __ LDA T3 + 0 
3811 : c9 13 __ CMP #$13
3813 : 90 49 __ BCC $385e ; (filepicker.s94 + 0)
.s93:
3815 : a5 43 __ LDA T3 + 0 
3817 : c9 2b __ CMP #$2b
3819 : d0 03 __ BNE $381e ; (filepicker.s100 + 0)
381b : 4c a3 36 JMP $36a3 ; (filepicker.s7 + 0)
.s100:
381e : b0 25 __ BCS $3845 ; (filepicker.s101 + 0)
.s102:
3820 : c9 1b __ CMP #$1b
3822 : f0 03 __ BEQ $3827 ; (filepicker.s4 + 0)
3824 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s4:
3827 : ad 90 53 LDA $5390 ; (cwd + 0)
382a : f0 03 __ BEQ $382f ; (filepicker.s120 + 0)
.s118:
382c : 20 bf 46 JSR $46bf ; (freeDir.s0 + 0)
.s120:
382f : a9 02 __ LDA #$02
3831 : 85 10 __ STA P3 
3833 : a9 14 __ LDA #$14
3835 : 85 13 __ STA P6 
3837 : 20 8f 50 JSR $508f ; (vdc_clear@proxy + 0)
.s1001:
383a : a2 05 __ LDX #$05
383c : bd cd bf LDA $bfcd,x ; (buff + 35)
383f : 95 53 __ STA T0 + 0,x 
3841 : ca __ __ DEX
3842 : 10 f8 __ BPL $383c ; (filepicker.s1001 + 2)
3844 : 60 __ __ RTS
.s101:
3845 : c9 2d __ CMP #$2d
3847 : f0 03 __ BEQ $384c ; (filepicker.s11 + 0)
3849 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s11:
384c : ce fe 51 DEC $51fe ; (targetdevice + 0)
384f : ad fe 51 LDA $51fe ; (targetdevice + 0)
3852 : c9 08 __ CMP #$08
3854 : 90 03 __ BCC $3859 ; (filepicker.s12 + 0)
3856 : 4c b2 36 JMP $36b2 ; (filepicker.s10 + 0)
.s12:
3859 : a9 1e __ LDA #$1e
385b : 4c af 36 JMP $36af ; (filepicker.s1059 + 0)
.s94:
385e : a5 44 __ LDA T3 + 1 
3860 : d0 27 __ BNE $3889 ; (filepicker.s95 + 0)
.s1052:
3862 : a5 43 __ LDA T3 + 0 
3864 : c9 0d __ CMP #$0d
3866 : d0 21 __ BNE $3889 ; (filepicker.s95 + 0)
.s59:
3868 : ad a7 53 LDA $53a7 ; (cwd + 23)
386b : 0d a8 53 ORA $53a8 ; (cwd + 24)
386e : d0 03 __ BNE $3873 ; (filepicker.s63 + 0)
3870 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s63:
3873 : a5 54 __ LDA T1 + 0 
3875 : 05 55 __ ORA T1 + 1 
3877 : d0 03 __ BNE $387c ; (filepicker.s60 + 0)
3879 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s60:
387c : a0 ff __ LDY #$ff
.l1050:
387e : c8 __ __ INY
387f : b1 54 __ LDA (T1 + 0),y 
3881 : 99 d8 51 STA $51d8,y ; (filename + 0)
3884 : d0 f8 __ BNE $387e ; (filepicker.l1050 + 0)
3886 : 4c 27 38 JMP $3827 ; (filepicker.s4 + 0)
.s95:
3889 : a5 44 __ LDA T3 + 1 
388b : 30 08 __ BMI $3895 ; (filepicker.s97 + 0)
.s1049:
388d : d0 16 __ BNE $38a5 ; (filepicker.s96 + 0)
.s1048:
388f : a5 43 __ LDA T3 + 0 
3891 : c9 0d __ CMP #$0d
3893 : b0 10 __ BCS $38a5 ; (filepicker.s96 + 0)
.s97:
3895 : a5 44 __ LDA T3 + 1 
3897 : f0 03 __ BEQ $389c ; (filepicker.s1047 + 0)
3899 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s1047:
389c : a5 43 __ LDA T3 + 0 
389e : c9 03 __ CMP #$03
38a0 : f0 85 __ BEQ $3827 ; (filepicker.s4 + 0)
38a2 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s96:
38a5 : a5 43 __ LDA T3 + 0 
38a7 : c9 11 __ CMP #$11
38a9 : f0 03 __ BEQ $38ae ; (filepicker.s34 + 0)
38ab : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s34:
38ae : ad a7 53 LDA $53a7 ; (cwd + 23)
38b1 : 0d a8 53 ORA $53a8 ; (cwd + 24)
38b4 : d0 03 __ BNE $38b9 ; (filepicker.s39 + 0)
38b6 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s39:
38b9 : a5 54 __ LDA T1 + 0 
38bb : 05 55 __ ORA T1 + 1 
38bd : d0 03 __ BNE $38c2 ; (filepicker.s38 + 0)
38bf : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s38:
38c2 : a0 15 __ LDY #$15
38c4 : b1 54 __ LDA (T1 + 0),y 
38c6 : 85 02 __ STA $02 
38c8 : c8 __ __ INY
38c9 : b1 54 __ LDA (T1 + 0),y 
38cb : 85 55 __ STA T1 + 1 
38cd : 05 02 __ ORA $02 
38cf : d0 03 __ BNE $38d4 ; (filepicker.s35 + 0)
38d1 : 4c b5 34 JMP $34b5 ; (filepicker.l3 + 0)
.s35:
38d4 : a5 02 __ LDA $02 
38d6 : 85 54 __ STA T1 + 0 
38d8 : 8d b6 53 STA $53b6 ; (current + 0)
38db : 8d a9 53 STA $53a9 ; (cwd + 25)
38de : a5 55 __ LDA T1 + 1 
38e0 : 8d b7 53 STA $53b7 ; (current + 1)
38e3 : 8d aa 53 STA $53aa ; (cwd + 26)
38e6 : 18 __ __ CLC
38e7 : a5 56 __ LDA T2 + 0 
38e9 : 69 01 __ ADC #$01
38eb : 8d ad 53 STA $53ad ; (cwd + 29)
38ee : 85 1b __ STA ACCU + 0 
38f0 : a5 57 __ LDA T2 + 1 
38f2 : 69 00 __ ADC #$00
38f4 : 8d ae 53 STA $53ae ; (cwd + 30)
38f7 : 85 1c __ STA ACCU + 1 
38f9 : a9 0e __ LDA #$0e
38fb : 85 03 __ STA WORK + 0 
38fd : a9 00 __ LDA #$00
38ff : 85 04 __ STA WORK + 1 
3901 : 20 1f 4d JSR $4d1f ; (divmod + 0)
3904 : a5 45 __ LDA T4 + 0 
3906 : c5 1b __ CMP ACCU + 0 
3908 : f0 03 __ BEQ $390d ; (filepicker.s41 + 0)
390a : 4c 58 36 JMP $3658 ; (filepicker.s230 + 0)
.s41:
390d : a5 47 __ LDA T6 + 0 
390f : 8d fd bf STA $bffd ; (sstack + 5)
3912 : a0 17 __ LDY #$17
3914 : b1 54 __ LDA (T1 + 0),y 
3916 : 8d b6 53 STA $53b6 ; (current + 0)
3919 : c8 __ __ INY
391a : b1 54 __ LDA (T1 + 0),y 
391c : 8d b7 53 STA $53b7 ; (current + 1)
391f : 20 55 44 JSR $4455 ; (printElementPriv.s1000 + 0)
3922 : ad b6 53 LDA $53b6 ; (current + 0)
3925 : 85 54 __ STA T1 + 0 
3927 : ad b7 53 LDA $53b7 ; (current + 1)
392a : 85 55 __ STA T1 + 1 
392c : a0 15 __ LDY #$15
392e : b1 54 __ LDA (T1 + 0),y 
3930 : 8d b6 53 STA $53b6 ; (current + 0)
3933 : c8 __ __ INY
3934 : b1 54 __ LDA (T1 + 0),y 
3936 : 8d b7 53 STA $53b7 ; (current + 1)
3939 : 18 __ __ CLC
393a : a5 58 __ LDA T5 + 0 
393c : 69 07 __ ADC #$07
393e : 4c 9a 36 JMP $369a ; (filepicker.s229 + 0)
--------------------------------------------------------------------
3941 : __ __ __ BYT 73 45 4c 45 43 54 20 54 48 45 20 46 49 4c 45 20 : sELECT THE FILE 
3951 : __ __ __ BYT 54 4f 20 4c 4f 41 44 00                         : TO LOAD.
--------------------------------------------------------------------
refreshDir: ; refreshDir(u8,u8)->void
.s0:
3959 : ad ff bf LDA $bfff ; (sstack + 7)
395c : 8d fd bf STA $bffd ; (sstack + 5)
395f : 20 2d 3a JSR $3a2d ; (readDir.s1000 + 0)
3962 : a5 1b __ LDA ACCU + 0 
3964 : d0 1c __ BNE $3982 ; (refreshDir.s1 + 0)
.s2:
3966 : ad ff bf LDA $bfff ; (sstack + 7)
3969 : 8d fd bf STA $bffd ; (sstack + 5)
396c : 20 b0 43 JSR $43b0 ; (drawDirFrame.s1000 + 0)
396f : a9 0b __ LDA #$0b
3971 : 85 11 __ STA P4 
3973 : a9 06 __ LDA #$06
3975 : 85 12 __ STA P5 
3977 : a9 34 __ LDA #$34
3979 : 85 13 __ STA P6 
397b : a9 46 __ LDA #$46
397d : 85 14 __ STA P7 
397f : 4c 09 32 JMP $3209 ; (vdc_prints.s0 + 0)
.s1:
3982 : ad ff bf LDA $bfff ; (sstack + 7)
3985 : 8d fe bf STA $bffe ; (sstack + 6)
3988 : ad a7 53 LDA $53a7 ; (cwd + 23)
398b : 8d a9 53 STA $53a9 ; (cwd + 25)
398e : ad a8 53 LDA $53a8 ; (cwd + 24)
3991 : 8d aa 53 STA $53aa ; (cwd + 26)
--------------------------------------------------------------------
printDir: ; printDir(u8)->void
.s1000:
3994 : a5 53 __ LDA T0 + 0 
3996 : 8d d4 bf STA $bfd4 ; (buff + 42)
.s0:
3999 : ad a7 53 LDA $53a7 ; (cwd + 23)
399c : 0d a8 53 ORA $53a8 ; (cwd + 24)
399f : d0 1a __ BNE $39bb ; (printDir.s3 + 0)
.s1:
39a1 : ad 99 52 LDA $5299 ; (fullscreen + 0)
39a4 : 85 0f __ STA P2 
39a6 : ad 9a 52 LDA $529a ; (fullscreen + 1)
39a9 : 85 10 __ STA P3 
39ab : ad 9b 52 LDA $529b ; (fullscreen + 2)
39ae : 85 12 __ STA P5 
39b0 : ad 9c 52 LDA $529c ; (fullscreen + 3)
39b3 : 85 13 __ STA P6 
39b5 : 20 95 2c JSR $2c95 ; (vdc_clear@proxy + 0)
39b8 : 4c 03 3a JMP $3a03 ; (printDir.s1001 + 0)
.s3:
39bb : ad fe bf LDA $bffe ; (sstack + 6)
39be : 8d fd bf STA $bffd ; (sstack + 5)
39c1 : 20 b0 43 JSR $43b0 ; (drawDirFrame.s1000 + 0)
39c4 : a9 00 __ LDA #$00
39c6 : 85 53 __ STA T0 + 0 
39c8 : ad ab 53 LDA $53ab ; (cwd + 27)
39cb : ac ac 53 LDY $53ac ; (cwd + 28)
.l68:
39ce : 8c b7 53 STY $53b7 ; (current + 1)
39d1 : 8d b6 53 STA $53b6 ; (current + 0)
39d4 : 98 __ __ TYA
39d5 : d0 05 __ BNE $39dc ; (printDir.s11 + 0)
.s1006:
39d7 : ad b6 53 LDA $53b6 ; (current + 0)
39da : f0 2d __ BEQ $3a09 ; (printDir.l12 + 0)
.s11:
39dc : a5 53 __ LDA T0 + 0 
39de : c9 0e __ CMP #$0e
39e0 : b0 21 __ BCS $3a03 ; (printDir.s1001 + 0)
.s8:
39e2 : 69 06 __ ADC #$06
39e4 : 8d fd bf STA $bffd ; (sstack + 5)
39e7 : 20 55 44 JSR $4455 ; (printElementPriv.s1000 + 0)
39ea : e6 53 __ INC T0 + 0 
39ec : ad b6 53 LDA $53b6 ; (current + 0)
39ef : 85 44 __ STA T2 + 0 
39f1 : ad b7 53 LDA $53b7 ; (current + 1)
39f4 : 85 45 __ STA T2 + 1 
39f6 : a0 15 __ LDY #$15
39f8 : b1 44 __ LDA (T2 + 0),y 
39fa : aa __ __ TAX
39fb : c8 __ __ INY
39fc : b1 44 __ LDA (T2 + 0),y 
39fe : a8 __ __ TAY
39ff : 8a __ __ TXA
3a00 : 4c ce 39 JMP $39ce ; (printDir.l68 + 0)
.s1001:
3a03 : ad d4 bf LDA $bfd4 ; (buff + 42)
3a06 : 85 53 __ STA T0 + 0 
3a08 : 60 __ __ RTS
.l12:
3a09 : a5 53 __ LDA T0 + 0 
3a0b : c9 0e __ CMP #$0e
3a0d : b0 f4 __ BCS $3a03 ; (printDir.s1001 + 0)
.s13:
3a0f : a9 0a __ LDA #$0a
3a11 : 85 0f __ STA P2 
3a13 : a9 20 __ LDA #$20
3a15 : 85 11 __ STA P4 
3a17 : a9 28 __ LDA #$28
3a19 : 85 12 __ STA P5 
3a1b : a9 01 __ LDA #$01
3a1d : 85 13 __ STA P6 
3a1f : a5 53 __ LDA T0 + 0 
3a21 : 69 06 __ ADC #$06
3a23 : 85 10 __ STA P3 
3a25 : 20 99 2c JSR $2c99 ; (vdc_clear.s0 + 0)
3a28 : e6 53 __ INC T0 + 0 
3a2a : 4c 09 3a JMP $3a09 ; (printDir.l12 + 0)
--------------------------------------------------------------------
readDir: ; readDir(u8,u8)->u8
.s1000:
3a2d : a5 53 __ LDA T0 + 0 
3a2f : 8d d7 bf STA $bfd7 ; (buff + 45)
3a32 : a5 54 __ LDA T0 + 1 
3a34 : 8d d8 bf STA $bfd8 ; (buff + 46)
3a37 : a5 55 __ LDA T1 + 0 
3a39 : 8d d9 bf STA $bfd9 ; (buff + 47)
3a3c : 38 __ __ SEC
3a3d : a5 23 __ LDA SP + 0 
3a3f : e9 08 __ SBC #$08
3a41 : 85 23 __ STA SP + 0 
3a43 : b0 02 __ BCS $3a47 ; (readDir.s0 + 0)
3a45 : c6 24 __ DEC SP + 1 
.s0:
3a47 : a9 00 __ LDA #$00
3a49 : 8d fe 52 STA $52fe ; (previous + 0)
3a4c : 8d ff 52 STA $52ff ; (previous + 1)
3a4f : ad fe 4b LDA $4bfe ; (mc_menupopup + 0)
3a52 : 8d 87 52 STA $5287 ; (vdc_state + 7)
3a55 : a9 00 __ LDA #$00
3a57 : a2 21 __ LDX #$21
.l1002:
3a59 : ca __ __ DEX
3a5a : 9d 90 53 STA $5390,x ; (cwd + 0)
3a5d : d0 fa __ BNE $3a59 ; (readDir.l1002 + 0)
.s1003:
3a5f : 8d b1 53 STA $53b1 ; (disk_id_buf + 0)
3a62 : 8d b2 53 STA $53b2 ; (disk_id_buf + 1)
3a65 : 8d b3 53 STA $53b3 ; (disk_id_buf + 2)
3a68 : 8d b4 53 STA $53b4 ; (disk_id_buf + 3)
3a6b : 8d b5 53 STA $53b5 ; (disk_id_buf + 4)
3a6e : ad fd bf LDA $bffd ; (sstack + 5)
3a71 : 85 10 __ STA P3 
3a73 : 20 5c 3c JSR $3c5c ; (dir_open.s0 + 0)
3a76 : a5 1b __ LDA ACCU + 0 
3a78 : f0 03 __ BEQ $3a7d ; (readDir.s5 + 0)
3a7a : 4c 3d 3c JMP $3c3d ; (readDir.s1016 + 0)
.s5:
3a7d : a9 ff __ LDA #$ff
3a7f : 85 55 __ STA T1 + 0 
.l6:
3a81 : 20 1c 3d JSR $3d1c ; (calloc.s0 + 0)
3a84 : a5 1b __ LDA ACCU + 0 
3a86 : 8d b6 53 STA $53b6 ; (current + 0)
3a89 : a5 1c __ LDA ACCU + 1 
3a8b : 8d b7 53 STA $53b7 ; (current + 1)
3a8e : 05 1b __ ORA ACCU + 0 
3a90 : d0 13 __ BNE $3aa5 ; (readDir.s10 + 0)
.s8:
3a92 : 20 cc ff JSR $ffcc 
3a95 : a9 02 __ LDA #$02
3a97 : 20 c3 ff JSR $ffc3 
3a9a : ad 87 52 LDA $5287 ; (vdc_state + 7)
3a9d : 09 40 __ ORA #$40
3a9f : 8d 87 52 STA $5287 ; (vdc_state + 7)
3aa2 : 4c 3d 3c JMP $3c3d ; (readDir.s1016 + 0)
.s10:
3aa5 : a5 1c __ LDA ACCU + 1 
3aa7 : 85 14 __ STA P7 
3aa9 : 85 54 __ STA T0 + 1 
3aab : a5 1b __ LDA ACCU + 0 
3aad : 85 53 __ STA T0 + 0 
3aaf : 85 13 __ STA P6 
3ab1 : 20 6d 3d JSR $3d6d ; (dir_readentry.s0 + 0)
3ab4 : a5 1b __ LDA ACCU + 0 
3ab6 : f0 03 __ BEQ $3abb ; (readDir.s16 + 0)
3ab8 : 4c 04 3c JMP $3c04 ; (readDir.s14 + 0)
.s16:
3abb : ad 87 52 LDA $5287 ; (vdc_state + 7)
3abe : 09 40 __ ORA #$40
3ac0 : a8 __ __ TAY
3ac1 : a5 55 __ LDA T1 + 0 
3ac3 : 4a __ __ LSR
3ac4 : 4a __ __ LSR
3ac5 : c9 24 __ CMP #$24
3ac7 : 90 3a __ BCC $3b03 ; (readDir.s19 + 0)
.s18:
3ac9 : 8c 87 52 STY $5287 ; (vdc_state + 7)
3acc : a9 05 __ LDA #$05
3ace : 85 10 __ STA P3 
3ad0 : a9 01 __ LDA #$01
3ad2 : 85 13 __ STA P6 
3ad4 : 20 8f 50 JSR $508f ; (vdc_clear@proxy + 0)
3ad7 : a9 ad __ LDA #$ad
3ad9 : a0 02 __ LDY #$02
3adb : 91 23 __ STA (SP + 0),y 
3add : a9 52 __ LDA #$52
3adf : c8 __ __ INY
3ae0 : 91 23 __ STA (SP + 0),y 
3ae2 : a9 ab __ LDA #$ab
3ae4 : c8 __ __ INY
3ae5 : 91 23 __ STA (SP + 0),y 
3ae7 : a9 3f __ LDA #$3f
3ae9 : c8 __ __ INY
3aea : 91 23 __ STA (SP + 0),y 
3aec : ad fd bf LDA $bffd ; (sstack + 5)
3aef : c8 __ __ INY
3af0 : 91 23 __ STA (SP + 0),y 
3af2 : a9 00 __ LDA #$00
3af4 : c8 __ __ INY
3af5 : 91 23 __ STA (SP + 0),y 
3af7 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
3afa : 20 5e 50 JSR $505e ; (vdc_prints@proxy + 0)
3afd : a9 00 __ LDA #$00
3aff : 85 55 __ STA T1 + 0 
3b01 : f0 33 __ BEQ $3b36 ; (readDir.s91 + 0)
.s19:
3b03 : 69 0e __ ADC #$0e
3b05 : 8d 9d 52 STA $529d ; (fullscreen + 4)
3b08 : a9 05 __ LDA #$05
3b0a : 8d 9e 52 STA $529e ; (fullscreen + 5)
3b0d : a5 55 __ LDA T1 + 0 
3b0f : 29 03 __ AND #$03
3b11 : aa __ __ TAX
3b12 : bd b2 50 LDA $50b2,x ; (progressRev + 0)
3b15 : f0 08 __ BEQ $3b1f ; (readDir.s64 + 0)
.s65:
3b17 : ad 87 52 LDA $5287 ; (vdc_state + 7)
3b1a : 29 bf __ AND #$bf
3b1c : 4c 20 3b JMP $3b20 ; (readDir.s1014 + 0)
.s64:
3b1f : 98 __ __ TYA
.s1014:
3b20 : 8d 87 52 STA $5287 ; (vdc_state + 7)
3b23 : a9 99 __ LDA #$99
3b25 : 85 17 __ STA P10 
3b27 : a9 52 __ LDA #$52
3b29 : 85 18 __ STA P11 
3b2b : bd be 50 LDA $50be,x ; (progressBar + 0)
3b2e : 8d f8 bf STA $bff8 ; (sstack + 0)
3b31 : 20 b2 3f JSR $3fb2 ; (vdcwin_put_char.s1000 + 0)
3b34 : e6 55 __ INC T1 + 0 
.s91:
3b36 : ad b6 53 LDA $53b6 ; (current + 0)
3b39 : 85 53 __ STA T0 + 0 
3b3b : ad b7 53 LDA $53b7 ; (current + 1)
3b3e : 85 54 __ STA T0 + 1 
3b40 : a0 13 __ LDY #$13
3b42 : ad 90 53 LDA $5390 ; (cwd + 0)
3b45 : d0 5f __ BNE $3ba6 ; (readDir.s25 + 0)
.s24:
3b47 : b1 53 __ LDA (T0 + 0),y 
3b49 : c9 05 __ CMP #$05
3b4b : f0 19 __ BEQ $3b66 ; (readDir.s27 + 0)
.s28:
3b4d : a2 ff __ LDX #$ff
.l1004:
3b4f : e8 __ __ INX
3b50 : bd 00 43 LDA $4300,x 
3b53 : 9d 90 53 STA $5390,x ; (cwd + 0)
3b56 : d0 f7 __ BNE $3b4f ; (readDir.l1004 + 0)
.s99:
3b58 : a5 54 __ LDA T0 + 1 
3b5a : a6 53 __ LDX T0 + 0 
.s1017:
3b5c : 86 1b __ STX ACCU + 0 
3b5e : 85 1c __ STA ACCU + 1 
3b60 : 20 5e 4f JSR $4f5e ; (free + 0)
3b63 : 4c 81 3a JMP $3a81 ; (readDir.l6 + 0)
.s27:
3b66 : a0 00 __ LDY #$00
3b68 : f0 04 __ BEQ $3b6e ; (readDir.l30 + 0)
.s31:
3b6a : 99 90 53 STA $5390,y ; (cwd + 0)
3b6d : c8 __ __ INY
.l30:
3b6e : ad b6 53 LDA $53b6 ; (current + 0)
3b71 : 85 1b __ STA ACCU + 0 
3b73 : ad b7 53 LDA $53b7 ; (current + 1)
3b76 : 85 1c __ STA ACCU + 1 
3b78 : b1 1b __ LDA (ACCU + 0),y 
3b7a : d0 ee __ BNE $3b6a ; (readDir.s31 + 0)
.s33:
3b7c : a9 2c __ LDA #$2c
3b7e : 99 90 53 STA $5390,y ; (cwd + 0)
3b81 : ad b1 53 LDA $53b1 ; (disk_id_buf + 0)
3b84 : 99 91 53 STA $5391,y ; (cwd + 1)
3b87 : ad b2 53 LDA $53b2 ; (disk_id_buf + 1)
3b8a : 99 92 53 STA $5392,y ; (cwd + 2)
3b8d : ad b3 53 LDA $53b3 ; (disk_id_buf + 2)
3b90 : 99 93 53 STA $5393,y ; (cwd + 3)
3b93 : ad b4 53 LDA $53b4 ; (disk_id_buf + 3)
3b96 : 99 94 53 STA $5394,y ; (cwd + 4)
3b99 : ad b5 53 LDA $53b5 ; (disk_id_buf + 4)
3b9c : 99 95 53 STA $5395,y ; (cwd + 5)
3b9f : a5 1c __ LDA ACCU + 1 
3ba1 : a6 1b __ LDX ACCU + 0 
3ba3 : 4c 5c 3b JMP $3b5c ; (readDir.s1017 + 0)
.s25:
3ba6 : b1 53 __ LDA (T0 + 0),y 
3ba8 : c9 64 __ CMP #$64
3baa : d0 10 __ BNE $3bbc ; (readDir.s35 + 0)
.s34:
3bac : a0 11 __ LDY #$11
3bae : b1 53 __ LDA (T0 + 0),y 
3bb0 : 8d af 53 STA $53af ; (cwd + 31)
3bb3 : c8 __ __ INY
3bb4 : b1 53 __ LDA (T0 + 0),y 
3bb6 : 8d b0 53 STA $53b0 ; (cwd + 32)
3bb9 : 4c 58 3b JMP $3b58 ; (readDir.s99 + 0)
.s35:
3bbc : 20 0d 43 JSR $430d ; (dir_validentry.s0 + 0)
3bbf : a5 1b __ LDA ACCU + 0 
3bc1 : f0 95 __ BEQ $3b58 ; (readDir.s99 + 0)
.s37:
3bc3 : ad a8 53 LDA $53a8 ; (cwd + 24)
3bc6 : d0 05 __ BNE $3bcd ; (readDir.s41 + 0)
.s1008:
3bc8 : ad a7 53 LDA $53a7 ; (cwd + 23)
3bcb : f0 20 __ BEQ $3bed ; (readDir.s40 + 0)
.s41:
3bcd : ad ff 52 LDA $52ff ; (previous + 1)
3bd0 : 85 45 __ STA T3 + 1 
3bd2 : ad fe 52 LDA $52fe ; (previous + 0)
3bd5 : 85 44 __ STA T3 + 0 
3bd7 : a0 17 __ LDY #$17
3bd9 : 91 53 __ STA (T0 + 0),y 
3bdb : a5 45 __ LDA T3 + 1 
3bdd : c8 __ __ INY
3bde : 91 53 __ STA (T0 + 0),y 
3be0 : a5 53 __ LDA T0 + 0 
3be2 : a0 15 __ LDY #$15
3be4 : 91 44 __ STA (T3 + 0),y 
3be6 : a5 54 __ LDA T0 + 1 
3be8 : c8 __ __ INY
3be9 : 91 44 __ STA (T3 + 0),y 
3beb : d0 0a __ BNE $3bf7 ; (readDir.s112 + 0)
.s40:
3bed : a5 53 __ LDA T0 + 0 
3bef : 8d a7 53 STA $53a7 ; (cwd + 23)
3bf2 : a5 54 __ LDA T0 + 1 
3bf4 : 8d a8 53 STA $53a8 ; (cwd + 24)
.s112:
3bf7 : a5 53 __ LDA T0 + 0 
3bf9 : 8d fe 52 STA $52fe ; (previous + 0)
3bfc : a5 54 __ LDA T0 + 1 
3bfe : 8d ff 52 STA $52ff ; (previous + 1)
3c01 : 4c 81 3a JMP $3a81 ; (readDir.l6 + 0)
.s14:
3c04 : a5 53 __ LDA T0 + 0 
3c06 : 85 1b __ STA ACCU + 0 
3c08 : a5 54 __ LDA T0 + 1 
3c0a : 85 1c __ STA ACCU + 1 
3c0c : 20 5e 4f JSR $4f5e ; (free + 0)
3c0f : 20 cc ff JSR $ffcc 
3c12 : a9 02 __ LDA #$02
3c14 : 20 c3 ff JSR $ffc3 
3c17 : ad 87 52 LDA $5287 ; (vdc_state + 7)
3c1a : 09 40 __ ORA #$40
3c1c : 8d 87 52 STA $5287 ; (vdc_state + 7)
3c1f : ad a7 53 LDA $53a7 ; (cwd + 23)
3c22 : 0d a8 53 ORA $53a8 ; (cwd + 24)
3c25 : f0 16 __ BEQ $3c3d ; (readDir.s1016 + 0)
.s45:
3c27 : ad a7 53 LDA $53a7 ; (cwd + 23)
3c2a : 8d a9 53 STA $53a9 ; (cwd + 25)
3c2d : 8d ab 53 STA $53ab ; (cwd + 27)
3c30 : ad a8 53 LDA $53a8 ; (cwd + 24)
3c33 : 8d aa 53 STA $53aa ; (cwd + 26)
3c36 : 8d ac 53 STA $53ac ; (cwd + 28)
3c39 : a9 01 __ LDA #$01
3c3b : d0 02 __ BNE $3c3f ; (readDir.s1001 + 0)
.s1016:
3c3d : a9 00 __ LDA #$00
.s1001:
3c3f : 85 1b __ STA ACCU + 0 
3c41 : 18 __ __ CLC
3c42 : a5 23 __ LDA SP + 0 
3c44 : 69 08 __ ADC #$08
3c46 : 85 23 __ STA SP + 0 
3c48 : 90 02 __ BCC $3c4c ; (readDir.s1001 + 13)
3c4a : e6 24 __ INC SP + 1 
3c4c : ad d7 bf LDA $bfd7 ; (buff + 45)
3c4f : 85 53 __ STA T0 + 0 
3c51 : ad d8 bf LDA $bfd8 ; (buff + 46)
3c54 : 85 54 __ STA T0 + 1 
3c56 : ad d9 bf LDA $bfd9 ; (buff + 47)
3c59 : 85 55 __ STA T1 + 0 
3c5b : 60 __ __ RTS
--------------------------------------------------------------------
dir_open: ; dir_open(u8,u8)->u8
.s0:
3c5c : a9 00 __ LDA #$00
3c5e : 85 0d __ STA P0 
3c60 : 85 0e __ STA P1 
3c62 : 20 be 2a JSR $2abe ; (krnio_setbnk.s0 + 0)
3c65 : a9 f3 __ LDA #$f3
3c67 : 85 0d __ STA P0 
3c69 : a9 33 __ LDA #$33
3c6b : 85 0e __ STA P1 
3c6d : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
3c70 : a9 02 __ LDA #$02
3c72 : 85 0d __ STA P0 
3c74 : a9 00 __ LDA #$00
3c76 : 85 0f __ STA P2 
3c78 : 20 f5 33 JSR $33f5 ; (krnio_open@proxy + 0)
3c7b : 85 43 __ STA T1 + 0 
3c7d : 20 b7 ff JSR $ffb7 
3c80 : 85 44 __ STA T2 + 0 
3c82 : 85 1b __ STA ACCU + 0 
3c84 : a5 43 __ LDA T1 + 0 
3c86 : f0 45 __ BEQ $3ccd ; (dir_open.s1001 + 0)
.s4:
3c88 : a5 44 __ LDA T2 + 0 
3c8a : f0 08 __ BEQ $3c94 ; (dir_open.s3 + 0)
.s1:
3c8c : 20 cc ff JSR $ffcc 
3c8f : a9 02 __ LDA #$02
3c91 : 20 c3 ff JSR $ffc3 
.s3:
3c94 : a5 43 __ LDA T1 + 0 
3c96 : f0 31 __ BEQ $3cc9 ; (dir_open.s1002 + 0)
.s9:
3c98 : a5 44 __ LDA T2 + 0 
3c9a : d0 2d __ BNE $3cc9 ; (dir_open.s1002 + 0)
.s6:
3c9c : a9 02 __ LDA #$02
3c9e : 20 fe 3c JSR $3cfe ; (krnio_chkin.s1000 + 0)
3ca1 : 85 43 __ STA T1 + 0 
3ca3 : 20 b7 ff JSR $ffb7 
3ca6 : 85 44 __ STA T2 + 0 
3ca8 : a5 43 __ LDA T1 + 0 
3caa : f0 15 __ BEQ $3cc1 ; (dir_open.s11 + 0)
.s13:
3cac : a5 44 __ LDA T2 + 0 
3cae : d0 11 __ BNE $3cc1 ; (dir_open.s11 + 0)
.s10:
3cb0 : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
3cb3 : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
3cb6 : 20 b7 ff JSR $ffb7 
3cb9 : 85 44 __ STA T2 + 0 
3cbb : 85 1b __ STA ACCU + 0 
3cbd : 09 00 __ ORA #$00
3cbf : f0 0c __ BEQ $3ccd ; (dir_open.s1001 + 0)
.s11:
3cc1 : 20 cc ff JSR $ffcc 
3cc4 : a9 02 __ LDA #$02
3cc6 : 20 c3 ff JSR $ffc3 
.s1002:
3cc9 : a5 44 __ LDA T2 + 0 
3ccb : 85 1b __ STA ACCU + 0 
.s1001:
3ccd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
3cce : a9 00 __ LDA #$00
3cd0 : a6 0d __ LDX P0 ; (fnum + 0)
3cd2 : 9d ee 51 STA $51ee,x ; (krnio_pstatus + 0)
3cd5 : a9 00 __ LDA #$00
3cd7 : 85 1b __ STA ACCU + 0 
3cd9 : 85 1c __ STA ACCU + 1 
3cdb : a5 0d __ LDA P0 ; (fnum + 0)
3cdd : a6 0e __ LDX P1 
3cdf : a4 0f __ LDY P2 
3ce1 : 20 ba ff JSR $ffba 
3ce4 : 20 c0 ff JSR $ffc0 
3ce7 : 90 08 __ BCC $3cf1 ; (krnio_open.s0 + 35)
3ce9 : a5 0d __ LDA P0 ; (fnum + 0)
3ceb : 20 c3 ff JSR $ffc3 
3cee : 4c f5 3c JMP $3cf5 ; (krnio_open.s1001 + 0)
3cf1 : a9 01 __ LDA #$01
3cf3 : 85 1b __ STA ACCU + 0 
.s1001:
3cf5 : a5 1b __ LDA ACCU + 0 
3cf7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
3cf8 : 4c cc ff JMP $ffcc 
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s0:
3cfb : 4c c3 ff JMP $ffc3 
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
3cfe : 85 0d __ STA P0 
.s0:
3d00 : a6 0d __ LDX P0 
3d02 : 20 c6 ff JSR $ffc6 
3d05 : a9 00 __ LDA #$00
3d07 : 85 1c __ STA ACCU + 1 
3d09 : b0 02 __ BCS $3d0d ; (krnio_chkin.s0 + 13)
3d0b : a9 01 __ LDA #$01
3d0d : 85 1b __ STA ACCU + 0 
.s1001:
3d0f : a5 1b __ LDA ACCU + 0 
3d11 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
3d12 : 20 cf ff JSR $ffcf 
3d15 : 85 1b __ STA ACCU + 0 
3d17 : a9 00 __ LDA #$00
3d19 : 85 1c __ STA ACCU + 1 
.s1001:
3d1b : 60 __ __ RTS
--------------------------------------------------------------------
calloc: ; calloc(i16,i16)->void*
.s0:
3d1c : a9 19 __ LDA #$19
3d1e : 85 1b __ STA ACCU + 0 
3d20 : a9 00 __ LDA #$00
3d22 : 85 1c __ STA ACCU + 1 
3d24 : 20 81 4e JSR $4e81 ; (malloc + 0)
3d27 : a5 1c __ LDA ACCU + 1 
3d29 : 05 1b __ ORA ACCU + 0 
3d2b : f0 1d __ BEQ $3d4a ; (calloc.s1001 + 0)
.s1:
3d2d : a5 1c __ LDA ACCU + 1 
3d2f : 85 0e __ STA P1 
3d31 : 85 44 __ STA T0 + 1 
3d33 : a5 1b __ LDA ACCU + 0 
3d35 : 85 0d __ STA P0 
3d37 : a9 19 __ LDA #$19
3d39 : 85 0f __ STA P2 
3d3b : a9 00 __ LDA #$00
3d3d : 85 10 __ STA P3 
3d3f : 20 4b 3d JSR $3d4b ; (memclr.s0 + 0)
3d42 : a5 0d __ LDA P0 
3d44 : 85 1b __ STA ACCU + 0 
3d46 : a5 44 __ LDA T0 + 1 
3d48 : 85 1c __ STA ACCU + 1 
.s1001:
3d4a : 60 __ __ RTS
--------------------------------------------------------------------
memclr: ; memclr(void*,i16)->void
.s0:
3d4b : a5 10 __ LDA P3 ; (size + 1)
3d4d : 05 0f __ ORA P2 ; (size + 0)
3d4f : f0 1b __ BEQ $3d6c ; (memclr.s1001 + 0)
.s5:
3d51 : a0 00 __ LDY #$00
3d53 : a5 0f __ LDA P2 ; (size + 0)
3d55 : f0 02 __ BEQ $3d59 ; (memclr.s1011 + 0)
.s1005:
3d57 : e6 10 __ INC P3 ; (size + 1)
.s1011:
3d59 : 98 __ __ TYA
.l1002:
3d5a : a6 0f __ LDX P2 ; (size + 0)
.l1006:
3d5c : 91 0d __ STA (P0),y ; (dst + 0)
3d5e : c8 __ __ INY
3d5f : d0 02 __ BNE $3d63 ; (memclr.s1009 + 0)
.s1008:
3d61 : e6 0e __ INC P1 ; (dst + 1)
.s1009:
3d63 : ca __ __ DEX
3d64 : d0 f6 __ BNE $3d5c ; (memclr.l1006 + 0)
.s1007:
3d66 : 85 0f __ STA P2 ; (size + 0)
3d68 : c6 10 __ DEC P3 ; (size + 1)
3d6a : d0 ee __ BNE $3d5a ; (memclr.l1002 + 0)
.s1001:
3d6c : 60 __ __ RTS
--------------------------------------------------------------------
dir_readentry: ; dir_readentry(const u8,struct DirEntry*)->u8
.s0:
3d6d : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
3d70 : a5 1b __ LDA ACCU + 0 
3d72 : d0 04 __ BNE $3d78 ; (dir_readentry.s3 + 0)
.s1:
3d74 : a9 01 __ LDA #$01
3d76 : d0 59 __ BNE $3dd1 ; (dir_readentry.s1095 + 0)
.s3:
3d78 : 20 b7 ff JSR $ffb7 
3d7b : 09 00 __ ORA #$00
3d7d : f0 03 __ BEQ $3d82 ; (dir_readentry.s7 + 0)
3d7f : 4c a6 3f JMP $3fa6 ; (dir_readentry.s5 + 0)
.s7:
3d82 : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
3d85 : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
3d88 : a5 1b __ LDA ACCU + 0 
3d8a : 85 43 __ STA T0 + 0 
3d8c : a0 11 __ LDY #$11
3d8e : 91 13 __ STA (P6),y ; (l_dirent + 0)
3d90 : a5 1c __ LDA ACCU + 1 
3d92 : 85 44 __ STA T0 + 1 
3d94 : c8 __ __ INY
3d95 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3d97 : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
3d9a : a5 1b __ LDA ACCU + 0 
3d9c : 05 44 __ ORA T0 + 1 
3d9e : a0 12 __ LDY #$12
3da0 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3da2 : a5 43 __ LDA T0 + 0 
3da4 : 88 __ __ DEY
3da5 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3da7 : a9 00 __ LDA #$00
3da9 : a2 51 __ LDX #$51
.l1002:
3dab : ca __ __ DEX
3dac : 9d ad 52 STA $52ad,x ; (linebuffer + 0)
3daf : d0 fa __ BNE $3dab ; (dir_readentry.l1002 + 0)
.s1003:
3db1 : 85 45 __ STA T1 + 0 
.l10:
3db3 : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
3db6 : a5 1b __ LDA ACCU + 0 
3db8 : f0 1a __ BEQ $3dd4 ; (dir_readentry.s11 + 0)
.s14:
3dba : a6 45 __ LDX T1 + 0 
3dbc : e0 51 __ CPX #$51
3dbe : b0 05 __ BCS $3dc5 ; (dir_readentry.s281 + 0)
.s16:
3dc0 : 9d ad 52 STA $52ad,x ; (linebuffer + 0)
3dc3 : e6 45 __ INC T1 + 0 
.s281:
3dc5 : 20 b7 ff JSR $ffb7 
3dc8 : 09 00 __ ORA #$00
3dca : f0 e7 __ BEQ $3db3 ; (dir_readentry.l10 + 0)
.s19:
3dcc : 20 cc ff JSR $ffcc 
3dcf : a9 02 __ LDA #$02
.s1095:
3dd1 : 85 1b __ STA ACCU + 0 
.s1001:
3dd3 : 60 __ __ RTS
.s11:
3dd4 : ad ad 52 LDA $52ad ; (linebuffer + 0)
3dd7 : c9 42 __ CMP #$42
3dd9 : d0 07 __ BNE $3de2 ; (dir_readentry.s25 + 0)
.s23:
3ddb : a9 64 __ LDA #$64
3ddd : a0 13 __ LDY #$13
3ddf : 91 13 __ STA (P6),y ; (l_dirent + 0)
3de1 : 60 __ __ RTS
.s25:
3de2 : a6 45 __ LDX T1 + 0 
3de4 : e0 05 __ CPX #$05
3de6 : b0 04 __ BCS $3dec ; (dir_readentry.l1098 + 0)
.s27:
3de8 : a9 03 __ LDA #$03
3dea : 90 e5 __ BCC $3dd1 ; (dir_readentry.s1095 + 0)
.l1098:
3dec : bd ad 52 LDA $52ad,x ; (linebuffer + 0)
3def : f0 0b __ BEQ $3dfc ; (dir_readentry.s35 + 0)
.s39:
3df1 : c9 20 __ CMP #$20
3df3 : f0 07 __ BEQ $3dfc ; (dir_readentry.s35 + 0)
.s38:
3df5 : c9 a0 __ CMP #$a0
3df7 : f0 03 __ BEQ $3dfc ; (dir_readentry.s35 + 0)
3df9 : 4c a0 3f JMP $3fa0 ; (dir_readentry.s37 + 0)
.s35:
3dfc : a9 00 __ LDA #$00
3dfe : 9d ad 52 STA $52ad,x ; (linebuffer + 0)
3e01 : ca __ __ DEX
3e02 : d0 e8 __ BNE $3dec ; (dir_readentry.l1098 + 0)
.s1097:
3e04 : 85 45 __ STA T1 + 0 
.s127:
3e06 : a2 00 __ LDX #$00
.l46:
3e08 : bd ad 52 LDA $52ad,x ; (linebuffer + 0)
3e0b : c9 22 __ CMP #$22
3e0d : f0 05 __ BEQ $3e14 ; (dir_readentry.s1100 + 0)
.s44:
3e0f : e8 __ __ INX
3e10 : e0 51 __ CPX #$51
3e12 : 90 f4 __ BCC $3e08 ; (dir_readentry.l46 + 0)
.s1100:
3e14 : e8 __ __ INX
3e15 : 86 1b __ STX ACCU + 0 
3e17 : e0 51 __ CPX #$51
3e19 : b0 17 __ BCS $3e32 ; (dir_readentry.s50 + 0)
.s126:
3e1b : a0 00 __ LDY #$00
.l52:
3e1d : bd ad 52 LDA $52ad,x ; (linebuffer + 0)
3e20 : c9 22 __ CMP #$22
3e22 : f0 0c __ BEQ $3e30 ; (dir_readentry.s1103 + 0)
.s51:
3e24 : c0 10 __ CPY #$10
3e26 : b0 08 __ BCS $3e30 ; (dir_readentry.s1103 + 0)
.s48:
3e28 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3e2a : e8 __ __ INX
3e2b : e0 51 __ CPX #$51
3e2d : c8 __ __ INY
3e2e : 90 ed __ BCC $3e1d ; (dir_readentry.l52 + 0)
.s1103:
3e30 : 86 1b __ STX ACCU + 0 
.s50:
3e32 : a6 45 __ LDX T1 + 0 
3e34 : 86 43 __ STX T0 + 0 
3e36 : bd aa 52 LDA $52aa,x ; (interface + 7)
3e39 : 85 45 __ STA T1 + 0 
3e3b : c9 50 __ CMP #$50
3e3d : d0 13 __ BNE $3e52 ; (dir_readentry.s54 + 0)
.s57:
3e3f : bd ab 52 LDA $52ab,x ; (interface + 8)
3e42 : c9 52 __ CMP #$52
3e44 : d0 0c __ BNE $3e52 ; (dir_readentry.s54 + 0)
.s56:
3e46 : bd ac 52 LDA $52ac,x ; (interface + 9)
3e49 : c9 47 __ CMP #$47
3e4b : d0 05 __ BNE $3e52 ; (dir_readentry.s54 + 0)
.s53:
3e4d : a9 11 __ LDA #$11
3e4f : 4c 87 3f JMP $3f87 ; (dir_readentry.s55 + 0)
.s54:
3e52 : a5 45 __ LDA T1 + 0 
3e54 : c9 53 __ CMP #$53
3e56 : d0 15 __ BNE $3e6d ; (dir_readentry.s59 + 0)
.s62:
3e58 : a6 43 __ LDX T0 + 0 
3e5a : bd ab 52 LDA $52ab,x ; (interface + 8)
3e5d : c9 45 __ CMP #$45
3e5f : d0 0c __ BNE $3e6d ; (dir_readentry.s59 + 0)
.s61:
3e61 : bd ac 52 LDA $52ac,x ; (interface + 9)
3e64 : c9 51 __ CMP #$51
3e66 : d0 05 __ BNE $3e6d ; (dir_readentry.s59 + 0)
.s58:
3e68 : a9 10 __ LDA #$10
3e6a : 4c 87 3f JMP $3f87 ; (dir_readentry.s55 + 0)
.s59:
3e6d : a5 45 __ LDA T1 + 0 
3e6f : c9 55 __ CMP #$55
3e71 : d0 15 __ BNE $3e88 ; (dir_readentry.s64 + 0)
.s67:
3e73 : a6 43 __ LDX T0 + 0 
3e75 : bd ab 52 LDA $52ab,x ; (interface + 8)
3e78 : c9 53 __ CMP #$53
3e7a : d0 0c __ BNE $3e88 ; (dir_readentry.s64 + 0)
.s66:
3e7c : bd ac 52 LDA $52ac,x ; (interface + 9)
3e7f : c9 52 __ CMP #$52
3e81 : d0 05 __ BNE $3e88 ; (dir_readentry.s64 + 0)
.s63:
3e83 : a9 12 __ LDA #$12
3e85 : 4c 87 3f JMP $3f87 ; (dir_readentry.s55 + 0)
.s64:
3e88 : a5 45 __ LDA T1 + 0 
3e8a : c9 44 __ CMP #$44
3e8c : f0 04 __ BEQ $3e92 ; (dir_readentry.s1006 + 0)
.s1007:
3e8e : a2 00 __ LDX #$00
3e90 : f0 17 __ BEQ $3ea9 ; (dir_readentry.s69 + 0)
.s1006:
3e92 : a4 43 __ LDY T0 + 0 
3e94 : b9 ab 52 LDA $52ab,y ; (interface + 8)
3e97 : a2 01 __ LDX #$01
3e99 : c9 45 __ CMP #$45
3e9b : d0 0c __ BNE $3ea9 ; (dir_readentry.s69 + 0)
.s71:
3e9d : b9 ac 52 LDA $52ac,y ; (interface + 9)
3ea0 : c9 4c __ CMP #$4c
3ea2 : d0 05 __ BNE $3ea9 ; (dir_readentry.s69 + 0)
.s68:
3ea4 : a9 00 __ LDA #$00
3ea6 : 4c 87 3f JMP $3f87 ; (dir_readentry.s55 + 0)
.s69:
3ea9 : a5 45 __ LDA T1 + 0 
3eab : c9 52 __ CMP #$52
3ead : d0 15 __ BNE $3ec4 ; (dir_readentry.s74 + 0)
.s77:
3eaf : a4 43 __ LDY T0 + 0 
3eb1 : b9 ab 52 LDA $52ab,y ; (interface + 8)
3eb4 : c9 45 __ CMP #$45
3eb6 : d0 0c __ BNE $3ec4 ; (dir_readentry.s74 + 0)
.s76:
3eb8 : b9 ac 52 LDA $52ac,y ; (interface + 9)
3ebb : c9 4c __ CMP #$4c
3ebd : d0 05 __ BNE $3ec4 ; (dir_readentry.s74 + 0)
.s73:
3ebf : a9 13 __ LDA #$13
3ec1 : 4c 87 3f JMP $3f87 ; (dir_readentry.s55 + 0)
.s74:
3ec4 : a5 45 __ LDA T1 + 0 
3ec6 : c9 43 __ CMP #$43
3ec8 : d0 15 __ BNE $3edf ; (dir_readentry.s79 + 0)
.s82:
3eca : a4 43 __ LDY T0 + 0 
3ecc : b9 ab 52 LDA $52ab,y ; (interface + 8)
3ecf : c9 42 __ CMP #$42
3ed1 : d0 0c __ BNE $3edf ; (dir_readentry.s79 + 0)
.s81:
3ed3 : b9 ac 52 LDA $52ac,y ; (interface + 9)
3ed6 : c9 4d __ CMP #$4d
3ed8 : d0 05 __ BNE $3edf ; (dir_readentry.s79 + 0)
.s78:
3eda : a9 01 __ LDA #$01
3edc : 4c 87 3f JMP $3f87 ; (dir_readentry.s55 + 0)
.s79:
3edf : 8a __ __ TXA
3ee0 : f0 15 __ BEQ $3ef7 ; (dir_readentry.s84 + 0)
.s87:
3ee2 : a6 43 __ LDX T0 + 0 
3ee4 : bd ab 52 LDA $52ab,x ; (interface + 8)
3ee7 : c9 49 __ CMP #$49
3ee9 : d0 0c __ BNE $3ef7 ; (dir_readentry.s84 + 0)
.s86:
3eeb : bd ac 52 LDA $52ac,x ; (interface + 9)
3eee : c9 52 __ CMP #$52
3ef0 : d0 05 __ BNE $3ef7 ; (dir_readentry.s84 + 0)
.s83:
3ef2 : a9 02 __ LDA #$02
3ef4 : 4c 87 3f JMP $3f87 ; (dir_readentry.s55 + 0)
.s84:
3ef7 : a5 45 __ LDA T1 + 0 
3ef9 : c9 56 __ CMP #$56
3efb : d0 14 __ BNE $3f11 ; (dir_readentry.s89 + 0)
.s92:
3efd : a6 43 __ LDX T0 + 0 
3eff : bd ab 52 LDA $52ab,x ; (interface + 8)
3f02 : c9 52 __ CMP #$52
3f04 : d0 0b __ BNE $3f11 ; (dir_readentry.s89 + 0)
.s91:
3f06 : bd ac 52 LDA $52ac,x ; (interface + 9)
3f09 : c9 50 __ CMP #$50
3f0b : d0 04 __ BNE $3f11 ; (dir_readentry.s89 + 0)
.s88:
3f0d : a9 14 __ LDA #$14
3f0f : d0 76 __ BNE $3f87 ; (dir_readentry.s55 + 0)
.s89:
3f11 : a5 45 __ LDA T1 + 0 
3f13 : c9 4c __ CMP #$4c
3f15 : d0 14 __ BNE $3f2b ; (dir_readentry.s94 + 0)
.s97:
3f17 : a6 43 __ LDX T0 + 0 
3f19 : bd ab 52 LDA $52ab,x ; (interface + 8)
3f1c : c9 4e __ CMP #$4e
3f1e : d0 0b __ BNE $3f2b ; (dir_readentry.s94 + 0)
.s96:
3f20 : bd ac 52 LDA $52ac,x ; (interface + 9)
3f23 : c9 4b __ CMP #$4b
3f25 : d0 04 __ BNE $3f2b ; (dir_readentry.s94 + 0)
.s93:
3f27 : a9 03 __ LDA #$03
3f29 : d0 5c __ BNE $3f87 ; (dir_readentry.s55 + 0)
.s94:
3f2b : a9 05 __ LDA #$05
3f2d : a0 13 __ LDY #$13
3f2f : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f31 : a6 1b __ LDX ACCU + 0 
3f33 : bd ad 52 LDA $52ad,x ; (linebuffer + 0)
3f36 : c9 22 __ CMP #$22
3f38 : d0 02 __ BNE $3f3c ; (dir_readentry.s100 + 0)
.s98:
3f3a : e6 1b __ INC ACCU + 0 
.s100:
3f3c : a9 00 __ LDA #$00
3f3e : 85 45 __ STA T1 + 0 
3f40 : a6 1b __ LDX ACCU + 0 
3f42 : bd ad 52 LDA $52ad,x ; (linebuffer + 0)
3f45 : c9 20 __ CMP #$20
3f47 : d0 02 __ BNE $3f4b ; (dir_readentry.l105 + 0)
.s101:
3f49 : e6 1b __ INC ACCU + 0 
.l105:
3f4b : a6 1b __ LDX ACCU + 0 
3f4d : bd ad 52 LDA $52ad,x ; (linebuffer + 0)
3f50 : f0 05 __ BEQ $3f57 ; (dir_readentry.s207 + 0)
.s108:
3f52 : a6 45 __ LDX T1 + 0 
3f54 : 9d b1 53 STA $53b1,x ; (disk_id_buf + 0)
.s207:
3f57 : e6 1b __ INC ACCU + 0 
3f59 : e6 45 __ INC T1 + 0 
3f5b : a6 45 __ LDX T1 + 0 
3f5d : e0 05 __ CPX #$05
3f5f : 90 ea __ BCC $3f4b ; (dir_readentry.l105 + 0)
.s107:
3f61 : a9 00 __ LDA #$00
3f63 : 9d b1 53 STA $53b1,x ; (disk_id_buf + 0)
3f66 : a0 0f __ LDY #$0f
3f68 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
3f6a : f0 08 __ BEQ $3f74 ; (dir_readentry.l115 + 0)
.s119:
3f6c : c9 20 __ CMP #$20
3f6e : f0 04 __ BEQ $3f74 ; (dir_readentry.l115 + 0)
.s118:
3f70 : c9 a0 __ CMP #$a0
3f72 : d0 0e __ BNE $3f82 ; (dir_readentry.s1096 + 0)
.l115:
3f74 : a9 00 __ LDA #$00
3f76 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f78 : 88 __ __ DEY
3f79 : f0 07 __ BEQ $3f82 ; (dir_readentry.s1096 + 0)
.s112:
3f7b : b1 13 __ LDA (P6),y ; (l_dirent + 0)
3f7d : f0 f5 __ BEQ $3f74 ; (dir_readentry.l115 + 0)
3f7f : 4c 6c 3f JMP $3f6c ; (dir_readentry.s119 + 0)
.s1096:
3f82 : a9 00 __ LDA #$00
3f84 : 4c d1 3d JMP $3dd1 ; (dir_readentry.s1095 + 0)
.s55:
3f87 : a0 13 __ LDY #$13
3f89 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f8b : a6 1b __ LDX ACCU + 0 
3f8d : bd a9 52 LDA $52a9,x ; (interface + 6)
3f90 : c9 3c __ CMP #$3c
3f92 : d0 04 __ BNE $3f98 ; (dir_readentry.s165 + 0)
.s164:
3f94 : a9 01 __ LDA #$01
3f96 : d0 02 __ BNE $3f9a ; (dir_readentry.s1093 + 0)
.s165:
3f98 : a9 03 __ LDA #$03
.s1093:
3f9a : a0 14 __ LDY #$14
3f9c : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f9e : d0 e2 __ BNE $3f82 ; (dir_readentry.s1096 + 0)
.s37:
3fa0 : e8 __ __ INX
3fa1 : 86 45 __ STX T1 + 0 
3fa3 : 4c 06 3e JMP $3e06 ; (dir_readentry.s127 + 0)
.s5:
3fa6 : a9 07 __ LDA #$07
3fa8 : 4c d1 3d JMP $3dd1 ; (dir_readentry.s1095 + 0)
--------------------------------------------------------------------
3fab : __ __ __ BYT 5b 25 30 32 55 5d 00                            : [%02U].
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
3fb2 : 38 __ __ SEC
3fb3 : a5 23 __ LDA SP + 0 
3fb5 : e9 06 __ SBC #$06
3fb7 : 85 23 __ STA SP + 0 
3fb9 : b0 02 __ BCS $3fbd ; (vdcwin_put_char.s0 + 0)
3fbb : c6 24 __ DEC SP + 1 
.s0:
3fbd : a5 17 __ LDA P10 ; (win + 0)
3fbf : 85 11 __ STA P4 
3fc1 : a5 18 __ LDA P11 ; (win + 1)
3fc3 : 85 12 __ STA P5 
3fc5 : a0 04 __ LDY #$04
3fc7 : b1 17 __ LDA (P10),y ; (win + 0)
3fc9 : 85 13 __ STA P6 
3fcb : c8 __ __ INY
3fcc : b1 17 __ LDA (P10),y ; (win + 0)
3fce : 85 14 __ STA P7 
3fd0 : ad f8 bf LDA $bff8 ; (sstack + 0)
3fd3 : 85 15 __ STA P8 
3fd5 : 20 24 40 JSR $4024 ; (vdcwin_putat_char.s0 + 0)
3fd8 : a6 13 __ LDX P6 
3fda : e8 __ __ INX
3fdb : 8a __ __ TXA
3fdc : a0 04 __ LDY #$04
3fde : 91 17 __ STA (P10),y ; (win + 0)
3fe0 : a0 02 __ LDY #$02
3fe2 : d1 17 __ CMP (P10),y ; (win + 0)
3fe4 : d0 32 __ BNE $4018 ; (vdcwin_put_char.s1001 + 0)
.s1:
3fe6 : a9 00 __ LDA #$00
3fe8 : a0 04 __ LDY #$04
3fea : 91 17 __ STA (P10),y ; (win + 0)
3fec : 18 __ __ CLC
3fed : a5 14 __ LDA P7 
3fef : 69 01 __ ADC #$01
3ff1 : c8 __ __ INY
3ff2 : 91 17 __ STA (P10),y ; (win + 0)
3ff4 : a0 03 __ LDY #$03
3ff6 : d1 17 __ CMP (P10),y ; (win + 0)
3ff8 : d0 1e __ BNE $4018 ; (vdcwin_put_char.s1001 + 0)
.s4:
3ffa : a5 14 __ LDA P7 
3ffc : a0 05 __ LDY #$05
3ffe : 91 17 __ STA (P10),y ; (win + 0)
4000 : a5 17 __ LDA P10 ; (win + 0)
4002 : a0 02 __ LDY #$02
4004 : 91 23 __ STA (SP + 0),y 
4006 : a5 18 __ LDA P11 ; (win + 1)
4008 : c8 __ __ INY
4009 : 91 23 __ STA (SP + 0),y 
400b : a9 ff __ LDA #$ff
400d : c8 __ __ INY
400e : 91 23 __ STA (SP + 0),y 
4010 : a9 2a __ LDA #$2a
4012 : c8 __ __ INY
4013 : 91 23 __ STA (SP + 0),y 
4015 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
.s1001:
4018 : 18 __ __ CLC
4019 : a5 23 __ LDA SP + 0 
401b : 69 06 __ ADC #$06
401d : 85 23 __ STA SP + 0 
401f : 90 02 __ BCC $4023 ; (vdcwin_put_char.s1001 + 11)
4021 : e6 24 __ INC SP + 1 
4023 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
4024 : a5 15 __ LDA P8 ; (ch + 0)
4026 : 4a __ __ LSR
4027 : 4a __ __ LSR
4028 : 4a __ __ LSR
4029 : 4a __ __ LSR
402a : 4a __ __ LSR
402b : aa __ __ TAX
402c : bd b6 50 LDA $50b6,x ; (p2smap + 0)
402f : 45 15 __ EOR P8 ; (ch + 0)
4031 : 85 0f __ STA P2 
4033 : a5 13 __ LDA P6 ; (x + 0)
4035 : 18 __ __ CLC
4036 : a0 00 __ LDY #$00
4038 : 71 11 __ ADC (P4),y ; (win + 0)
403a : 85 0d __ STA P0 
403c : a5 14 __ LDA P7 ; (y + 0)
403e : 18 __ __ CLC
403f : c8 __ __ INY
4040 : 71 11 __ ADC (P4),y ; (win + 0)
4042 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
4044 : ad 87 52 LDA $5287 ; (vdc_state + 7)
4047 : 85 10 __ STA P3 
4049 : 4c cb 32 JMP $32cb ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
404c : a5 53 __ LDA T0 + 0 
404e : 8d f4 bf STA $bff4 ; (buffer + 12)
4051 : a5 54 __ LDA T0 + 1 
4053 : 8d f5 bf STA $bff5 ; (buffer + 13)
4056 : a5 55 __ LDA T1 + 0 
4058 : 8d f6 bf STA $bff6 ; (buffer + 14)
405b : 38 __ __ SEC
405c : a5 23 __ LDA SP + 0 
405e : e9 06 __ SBC #$06
4060 : 85 23 __ STA SP + 0 
4062 : b0 02 __ BCS $4066 ; (vdcwin_printline.s0 + 0)
4064 : c6 24 __ DEC SP + 1 
.s0:
4066 : a0 08 __ LDY #$08
4068 : b1 23 __ LDA (SP + 0),y 
406a : 85 53 __ STA T0 + 0 
406c : a0 02 __ LDY #$02
406e : 91 23 __ STA (SP + 0),y 
4070 : a0 09 __ LDY #$09
4072 : b1 23 __ LDA (SP + 0),y 
4074 : 85 54 __ STA T0 + 1 
4076 : a0 03 __ LDY #$03
4078 : 91 23 __ STA (SP + 0),y 
407a : a0 0a __ LDY #$0a
407c : b1 23 __ LDA (SP + 0),y 
407e : a0 04 __ LDY #$04
4080 : 91 23 __ STA (SP + 0),y 
4082 : a0 0b __ LDY #$0b
4084 : b1 23 __ LDA (SP + 0),y 
4086 : a0 05 __ LDY #$05
4088 : 91 23 __ STA (SP + 0),y 
408a : 20 f4 40 JSR $40f4 ; (vdcwin_put_string.s1000 + 0)
408d : a9 00 __ LDA #$00
408f : a0 04 __ LDY #$04
4091 : 91 53 __ STA (T0 + 0),y 
4093 : 88 __ __ DEY
4094 : b1 53 __ LDA (T0 + 0),y 
4096 : 85 55 __ STA T1 + 0 
4098 : 38 __ __ SEC
4099 : e9 01 __ SBC #$01
409b : 85 44 __ STA T3 + 0 
409d : a0 05 __ LDY #$05
409f : b1 53 __ LDA (T0 + 0),y 
40a1 : 90 0b __ BCC $40ae ; (vdcwin_printline.s2 + 0)
.s1002:
40a3 : aa __ __ TAX
40a4 : e4 44 __ CPX T3 + 0 
40a6 : b0 06 __ BCS $40ae ; (vdcwin_printline.s2 + 0)
.s1:
40a8 : e8 __ __ INX
40a9 : 8a __ __ TXA
40aa : 91 53 __ STA (T0 + 0),y 
40ac : 90 2b __ BCC $40d9 ; (vdcwin_printline.s1001 + 0)
.s2:
40ae : a5 53 __ LDA T0 + 0 
40b0 : 85 15 __ STA P8 
40b2 : a5 54 __ LDA T0 + 1 
40b4 : 85 16 __ STA P9 
40b6 : 20 a4 41 JSR $41a4 ; (vdcwin_scroll_up.s0 + 0)
40b9 : a9 20 __ LDA #$20
40bb : 85 11 __ STA P4 
40bd : a0 00 __ LDY #$00
40bf : b1 15 __ LDA (P8),y 
40c1 : 85 0f __ STA P2 ; (str + 0)
40c3 : a0 02 __ LDY #$02
40c5 : b1 15 __ LDA (P8),y 
40c7 : 85 12 __ STA P5 
40c9 : 88 __ __ DEY
40ca : 84 13 __ STY P6 
40cc : b1 15 __ LDA (P8),y 
40ce : 18 __ __ CLC
40cf : 65 55 __ ADC T1 + 0 
40d1 : 38 __ __ SEC
40d2 : e9 01 __ SBC #$01
40d4 : 85 10 __ STA P3 ; (str + 1)
40d6 : 20 99 2c JSR $2c99 ; (vdc_clear.s0 + 0)
.s1001:
40d9 : 18 __ __ CLC
40da : a5 23 __ LDA SP + 0 
40dc : 69 06 __ ADC #$06
40de : 85 23 __ STA SP + 0 
40e0 : 90 02 __ BCC $40e4 ; (vdcwin_printline.s1001 + 11)
40e2 : e6 24 __ INC SP + 1 
40e4 : ad f4 bf LDA $bff4 ; (buffer + 12)
40e7 : 85 53 __ STA T0 + 0 
40e9 : ad f5 bf LDA $bff5 ; (buffer + 13)
40ec : 85 54 __ STA T0 + 1 
40ee : ad f6 bf LDA $bff6 ; (buffer + 14)
40f1 : 85 55 __ STA T1 + 0 
40f3 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
40f4 : 38 __ __ SEC
40f5 : a5 23 __ LDA SP + 0 
40f7 : e9 0b __ SBC #$0b
40f9 : 85 23 __ STA SP + 0 
40fb : b0 02 __ BCS $40ff ; (vdcwin_put_string.s0 + 0)
40fd : c6 24 __ DEC SP + 1 
.s0:
40ff : a0 0d __ LDY #$0d
4101 : b1 23 __ LDA (SP + 0),y 
4103 : 85 11 __ STA P4 
4105 : c8 __ __ INY
4106 : b1 23 __ LDA (SP + 0),y 
4108 : 85 12 __ STA P5 
410a : a0 04 __ LDY #$04
410c : b1 11 __ LDA (P4),y 
410e : 85 13 __ STA P6 
4110 : c8 __ __ INY
4111 : b1 11 __ LDA (P4),y 
4113 : 85 14 __ STA P7 
4115 : a0 0f __ LDY #$0f
4117 : b1 23 __ LDA (SP + 0),y 
4119 : 85 15 __ STA P8 
411b : c8 __ __ INY
411c : b1 23 __ LDA (SP + 0),y 
411e : 85 16 __ STA P9 
4120 : 20 6f 41 JSR $416f ; (vdcwin_putat_string.s0 + 0)
4123 : 18 __ __ CLC
4124 : a5 1b __ LDA ACCU + 0 
4126 : 65 13 __ ADC P6 
4128 : a0 04 __ LDY #$04
412a : 91 11 __ STA (P4),y 
412c : a0 02 __ LDY #$02
412e : d1 11 __ CMP (P4),y 
4130 : 90 31 __ BCC $4163 ; (vdcwin_put_string.s1001 + 0)
.s1:
4132 : a9 00 __ LDA #$00
4134 : a0 04 __ LDY #$04
4136 : 91 11 __ STA (P4),y 
4138 : a5 14 __ LDA P7 
413a : 69 00 __ ADC #$00
413c : c8 __ __ INY
413d : 91 11 __ STA (P4),y 
413f : a0 03 __ LDY #$03
4141 : d1 11 __ CMP (P4),y 
4143 : d0 1e __ BNE $4163 ; (vdcwin_put_string.s1001 + 0)
.s4:
4145 : a5 14 __ LDA P7 
4147 : a0 05 __ LDY #$05
4149 : 91 11 __ STA (P4),y 
414b : a5 11 __ LDA P4 
414d : a0 02 __ LDY #$02
414f : 91 23 __ STA (SP + 0),y 
4151 : a5 12 __ LDA P5 
4153 : c8 __ __ INY
4154 : 91 23 __ STA (SP + 0),y 
4156 : a9 ff __ LDA #$ff
4158 : c8 __ __ INY
4159 : 91 23 __ STA (SP + 0),y 
415b : a9 2a __ LDA #$2a
415d : c8 __ __ INY
415e : 91 23 __ STA (SP + 0),y 
4160 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
.s1001:
4163 : 18 __ __ CLC
4164 : a5 23 __ LDA SP + 0 
4166 : 69 0b __ ADC #$0b
4168 : 85 23 __ STA SP + 0 
416a : 90 02 __ BCC $416e ; (vdcwin_put_string.s1001 + 11)
416c : e6 24 __ INC SP + 1 
416e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
416f : a9 00 __ LDA #$00
4171 : 85 43 __ STA T0 + 0 
4173 : f0 26 __ BEQ $419b ; (vdcwin_putat_string.l1 + 0)
.s2:
4175 : 4a __ __ LSR
4176 : 4a __ __ LSR
4177 : 4a __ __ LSR
4178 : 4a __ __ LSR
4179 : 4a __ __ LSR
417a : aa __ __ TAX
417b : bd b6 50 LDA $50b6,x ; (p2smap + 0)
417e : 51 15 __ EOR (P8),y ; (str + 0)
4180 : 85 0f __ STA P2 
4182 : a5 13 __ LDA P6 ; (x + 0)
4184 : 18 __ __ CLC
4185 : a0 00 __ LDY #$00
4187 : 71 11 __ ADC (P4),y ; (win + 0)
4189 : 18 __ __ CLC
418a : 65 43 __ ADC T0 + 0 
418c : 85 0d __ STA P0 
418e : a5 14 __ LDA P7 ; (y + 0)
4190 : 18 __ __ CLC
4191 : c8 __ __ INY
4192 : 71 11 __ ADC (P4),y ; (win + 0)
4194 : 85 0e __ STA P1 
4196 : 20 44 40 JSR $4044 ; (vdc_printc@proxy + 0)
4199 : e6 43 __ INC T0 + 0 
.l1:
419b : a4 43 __ LDY T0 + 0 
419d : b1 15 __ LDA (P8),y ; (str + 0)
419f : d0 d4 __ BNE $4175 ; (vdcwin_putat_string.s2 + 0)
.s3:
41a1 : 84 1b __ STY ACCU + 0 
.s1001:
41a3 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
41a4 : a9 00 __ LDA #$00
41a6 : 85 46 __ STA T0 + 0 
41a8 : a0 02 __ LDY #$02
41aa : b1 15 __ LDA (P8),y ; (win + 0)
41ac : 85 47 __ STA T2 + 0 
41ae : a0 06 __ LDY #$06
41b0 : b1 15 __ LDA (P8),y ; (win + 0)
41b2 : 85 48 __ STA T3 + 0 
41b4 : c8 __ __ INY
41b5 : b1 15 __ LDA (P8),y ; (win + 0)
41b7 : 85 49 __ STA T3 + 1 
41b9 : c8 __ __ INY
41ba : b1 15 __ LDA (P8),y ; (win + 0)
41bc : 85 4a __ STA T4 + 0 
41be : c8 __ __ INY
41bf : b1 15 __ LDA (P8),y ; (win + 0)
41c1 : 85 4b __ STA T4 + 1 
41c3 : ad 83 52 LDA $5283 ; (vdc_state + 3)
41c6 : 85 4c __ STA T5 + 0 
41c8 : ad 84 52 LDA $5284 ; (vdc_state + 4)
41cb : 85 4d __ STA T5 + 1 
41cd : 4c 20 42 JMP $4220 ; (vdcwin_scroll_up.l1 + 0)
.s2:
41d0 : a5 48 __ LDA T3 + 0 
41d2 : 85 0f __ STA P2 
41d4 : 18 __ __ CLC
41d5 : 65 4c __ ADC T5 + 0 
41d7 : 85 11 __ STA P4 
41d9 : a5 49 __ LDA T3 + 1 
41db : 85 10 __ STA P3 
41dd : 65 4d __ ADC T5 + 1 
41df : 85 12 __ STA P5 
41e1 : a5 47 __ LDA T2 + 0 
41e3 : 85 13 __ STA P6 
41e5 : a9 00 __ LDA #$00
41e7 : 85 14 __ STA P7 
41e9 : 20 30 42 JSR $4230 ; (vdc_block_copy.s0 + 0)
41ec : a5 4a __ LDA T4 + 0 
41ee : 85 0f __ STA P2 
41f0 : 18 __ __ CLC
41f1 : 65 4c __ ADC T5 + 0 
41f3 : 85 11 __ STA P4 
41f5 : a5 4b __ LDA T4 + 1 
41f7 : 85 10 __ STA P3 
41f9 : 65 4d __ ADC T5 + 1 
41fb : 85 12 __ STA P5 
41fd : 20 30 42 JSR $4230 ; (vdc_block_copy.s0 + 0)
4200 : ad 83 52 LDA $5283 ; (vdc_state + 3)
4203 : 18 __ __ CLC
4204 : 65 48 __ ADC T3 + 0 
4206 : 85 48 __ STA T3 + 0 
4208 : ad 84 52 LDA $5284 ; (vdc_state + 4)
420b : 65 49 __ ADC T3 + 1 
420d : 85 49 __ STA T3 + 1 
420f : 18 __ __ CLC
4210 : a5 4a __ LDA T4 + 0 
4212 : 6d 83 52 ADC $5283 ; (vdc_state + 3)
4215 : 85 4a __ STA T4 + 0 
4217 : a5 4b __ LDA T4 + 1 
4219 : 6d 84 52 ADC $5284 ; (vdc_state + 4)
421c : 85 4b __ STA T4 + 1 
421e : e6 46 __ INC T0 + 0 
.l1:
4220 : a0 03 __ LDY #$03
4222 : b1 15 __ LDA (P8),y ; (win + 0)
4224 : 38 __ __ SEC
4225 : e9 01 __ SBC #$01
4227 : 90 a7 __ BCC $41d0 ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4229 : c5 46 __ CMP T0 + 0 
422b : 90 02 __ BCC $422f ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
422d : d0 a1 __ BNE $41d0 ; (vdcwin_scroll_up.s2 + 0)
.s1001:
422f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
4230 : a5 14 __ LDA P7 ; (length + 1)
4232 : d0 5a __ BNE $428e ; (vdc_block_copy.s73 + 0)
.s4:
4234 : a5 0f __ LDA P2 ; (dest + 0)
4236 : 85 0d __ STA P0 
4238 : a5 10 __ LDA P3 ; (dest + 1)
423a : 85 0e __ STA P1 
423c : 20 65 2d JSR $2d65 ; (vdc_mem_addr.s0 + 0)
423f : a9 18 __ LDA #$18
4241 : 8d 00 d6 STA $d600 
.l332:
4244 : 2c 00 d6 BIT $d600 
4247 : 10 fb __ BPL $4244 ; (vdc_block_copy.l332 + 0)
.s40:
4249 : ad 01 d6 LDA $d601 
424c : 09 80 __ ORA #$80
424e : a2 18 __ LDX #$18
4250 : 8e 00 d6 STX $d600 
.l334:
4253 : 2c 00 d6 BIT $d600 
4256 : 10 fb __ BPL $4253 ; (vdc_block_copy.l334 + 0)
.s46:
4258 : 8d 01 d6 STA $d601 
425b : a9 20 __ LDA #$20
425d : 8d 00 d6 STA $d600 
.l336:
4260 : 2c 00 d6 BIT $d600 
4263 : 10 fb __ BPL $4260 ; (vdc_block_copy.l336 + 0)
.s51:
4265 : a5 12 __ LDA P5 ; (src + 1)
4267 : 8d 01 d6 STA $d601 
426a : a9 21 __ LDA #$21
426c : 8d 00 d6 STA $d600 
.l338:
426f : 2c 00 d6 BIT $d600 
4272 : 10 fb __ BPL $426f ; (vdc_block_copy.l338 + 0)
.s56:
4274 : a5 11 __ LDA P4 ; (src + 0)
4276 : 8d 01 d6 STA $d601 
4279 : a9 1f __ LDA #$1f
427b : 8d 00 d6 STA $d600 
427e : a9 1e __ LDA #$1e
4280 : 8d 00 d6 STA $d600 
.l340:
4283 : 2c 00 d6 BIT $d600 
4286 : 10 fb __ BPL $4283 ; (vdc_block_copy.l340 + 0)
.s62:
4288 : a5 13 __ LDA P6 ; (length + 0)
428a : 8d 01 d6 STA $d601 
.s1001:
428d : 60 __ __ RTS
.s73:
428e : 85 45 __ STA T2 + 0 
4290 : a5 10 __ LDA P3 ; (dest + 1)
4292 : 85 44 __ STA T0 + 1 
4294 : a5 0f __ LDA P2 ; (dest + 0)
4296 : 85 0d __ STA P0 
.l2:
4298 : 20 f8 2a JSR $2af8 ; (vdc_mem_addr@proxy + 0)
429b : a9 18 __ LDA #$18
429d : 8d 00 d6 STA $d600 
.l321:
42a0 : 2c 00 d6 BIT $d600 
42a3 : 10 fb __ BPL $42a0 ; (vdc_block_copy.l321 + 0)
.s11:
42a5 : ad 01 d6 LDA $d601 
42a8 : 09 80 __ ORA #$80
42aa : a2 18 __ LDX #$18
42ac : 8e 00 d6 STX $d600 
.l323:
42af : 2c 00 d6 BIT $d600 
42b2 : 10 fb __ BPL $42af ; (vdc_block_copy.l323 + 0)
.s17:
42b4 : 8d 01 d6 STA $d601 
42b7 : a9 20 __ LDA #$20
42b9 : 8d 00 d6 STA $d600 
.l325:
42bc : 2c 00 d6 BIT $d600 
42bf : 10 fb __ BPL $42bc ; (vdc_block_copy.l325 + 0)
.s22:
42c1 : a5 12 __ LDA P5 ; (src + 1)
42c3 : 8d 01 d6 STA $d601 
42c6 : a9 21 __ LDA #$21
42c8 : 8d 00 d6 STA $d600 
.l327:
42cb : 2c 00 d6 BIT $d600 
42ce : 10 fb __ BPL $42cb ; (vdc_block_copy.l327 + 0)
.s27:
42d0 : a5 11 __ LDA P4 ; (src + 0)
42d2 : 8d 01 d6 STA $d601 
42d5 : a9 1f __ LDA #$1f
42d7 : 8d 00 d6 STA $d600 
42da : a9 1e __ LDA #$1e
42dc : 8d 00 d6 STA $d600 
.l329:
42df : 2c 00 d6 BIT $d600 
42e2 : 10 fb __ BPL $42df ; (vdc_block_copy.l329 + 0)
.s33:
42e4 : a9 ff __ LDA #$ff
42e6 : 8d 01 d6 STA $d601 
42e9 : e6 12 __ INC P5 ; (src + 1)
42eb : e6 44 __ INC T0 + 1 
42ed : c6 45 __ DEC T2 + 0 
42ef : d0 a7 __ BNE $4298 ; (vdc_block_copy.l2 + 0)
.s145:
42f1 : a5 0d __ LDA P0 
42f3 : 85 0f __ STA P2 ; (dest + 0)
42f5 : a5 44 __ LDA T0 + 1 
42f7 : 85 10 __ STA P3 ; (dest + 1)
42f9 : 4c 34 42 JMP $4234 ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
42fc : __ __ __ BYT 73 65 71 00                                     : seq.
--------------------------------------------------------------------
4300 : __ __ __ BYT 75 4e 4b 4e 4f 57 4e 20 54 59 50 45 00          : uNKNOWN TYPE.
--------------------------------------------------------------------
dir_validentry: ; dir_validentry(u8)->u8
.s0:
430d : ad b6 53 LDA $53b6 ; (current + 0)
4310 : 85 43 __ STA T0 + 0 
4312 : 85 0d __ STA P0 
4314 : ad b7 53 LDA $53b7 ; (current + 1)
4317 : 85 44 __ STA T0 + 1 
4319 : 85 0e __ STA P1 
431b : 20 51 33 JSR $3351 ; (strlen.s0 + 0)
431e : a0 13 __ LDY #$13
4320 : b1 43 __ LDA (T0 + 0),y 
4322 : c9 11 __ CMP #$11
4324 : d0 4c __ BNE $4372 ; (dir_validentry.s1015 + 0)
.s3:
4326 : a5 1b __ LDA ACCU + 0 
4328 : c9 06 __ CMP #$06
432a : 90 46 __ BCC $4372 ; (dir_validentry.s1015 + 0)
.s14:
432c : a9 00 __ LDA #$00
432e : 8d f2 bf STA $bff2 ; (buffer + 10)
4331 : 8d f3 bf STA $bff3 ; (buffer + 11)
4334 : 8d f4 bf STA $bff4 ; (buffer + 12)
4337 : 8d f5 bf STA $bff5 ; (buffer + 13)
433a : 8d f6 bf STA $bff6 ; (buffer + 14)
433d : 8d f7 bf STA $bff7 ; (buffer + 15)
4340 : a5 1b __ LDA ACCU + 0 
4342 : e9 05 __ SBC #$05
4344 : 18 __ __ CLC
4345 : 65 0d __ ADC P0 
4347 : 85 43 __ STA T0 + 0 
4349 : 90 02 __ BCC $434d ; (dir_validentry.s1011 + 0)
.s1010:
434b : e6 44 __ INC T0 + 1 
.s1011:
434d : a0 00 __ LDY #$00
.l1008:
434f : b1 43 __ LDA (T0 + 0),y 
4351 : 99 f2 bf STA $bff2,y ; (buffer + 10)
4354 : c8 __ __ INY
4355 : c0 05 __ CPY #$05
4357 : 90 f6 __ BCC $434f ; (dir_validentry.l1008 + 0)
.s1009:
4359 : a9 f2 __ LDA #$f2
435b : 85 0d __ STA P0 
435d : a9 bf __ LDA #$bf
435f : 85 0e __ STA P1 
4361 : a9 aa __ LDA #$aa
4363 : 85 0f __ STA P2 
4365 : a9 43 __ LDA #$43
4367 : 85 10 __ STA P3 
4369 : 20 7b 43 JSR $437b ; (strcmp.s0 + 0)
436c : a5 1b __ LDA ACCU + 0 
436e : 05 1c __ ORA ACCU + 1 
4370 : f0 04 __ BEQ $4376 ; (dir_validentry.s1012 + 0)
.s1015:
4372 : a9 00 __ LDA #$00
4374 : f0 02 __ BEQ $4378 ; (dir_validentry.s1001 + 0)
.s1012:
4376 : a9 01 __ LDA #$01
.s1001:
4378 : 85 1b __ STA ACCU + 0 
437a : 60 __ __ RTS
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i16
.s0:
437b : a0 00 __ LDY #$00
437d : 84 1c __ STY ACCU + 1 
437f : b1 0d __ LDA (P0),y 
4381 : f0 16 __ BEQ $4399 ; (strcmp.s0 + 30)
4383 : d1 0f __ CMP (P2),y 
4385 : d0 16 __ BNE $439d ; (strcmp.s0 + 34)
4387 : c8 __ __ INY
4388 : b1 0d __ LDA (P0),y 
438a : f0 0d __ BEQ $4399 ; (strcmp.s0 + 30)
438c : d1 0f __ CMP (P2),y 
438e : d0 0d __ BNE $439d ; (strcmp.s0 + 34)
4390 : c8 __ __ INY
4391 : d0 ec __ BNE $437f ; (strcmp.s0 + 4)
4393 : e6 0e __ INC P1 
4395 : e6 10 __ INC P3 
4397 : d0 e6 __ BNE $437f ; (strcmp.s0 + 4)
4399 : d1 0f __ CMP (P2),y 
439b : f0 0a __ BEQ $43a7 ; (strcmp.s0 + 44)
439d : b0 06 __ BCS $43a5 ; (strcmp.s0 + 42)
439f : a9 ff __ LDA #$ff
43a1 : 85 1c __ STA ACCU + 1 
43a3 : 30 02 __ BMI $43a7 ; (strcmp.s0 + 44)
43a5 : a9 01 __ LDA #$01
43a7 : 85 1b __ STA ACCU + 0 
.s1001:
43a9 : 60 __ __ RTS
--------------------------------------------------------------------
43aa : __ __ __ BYT 2e 50 52 4f 4a 00                               : .PROJ.
--------------------------------------------------------------------
drawDirFrame: ; drawDirFrame(u8)->void
.s1000:
43b0 : 38 __ __ SEC
43b1 : a5 23 __ LDA SP + 0 
43b3 : e9 0a __ SBC #$0a
43b5 : 85 23 __ STA SP + 0 
43b7 : b0 02 __ BCS $43bb ; (drawDirFrame.s0 + 0)
43b9 : c6 24 __ DEC SP + 1 
.s0:
43bb : a9 0a __ LDA #$0a
43bd : 85 0f __ STA P2 
43bf : a9 05 __ LDA #$05
43c1 : 85 10 __ STA P3 
43c3 : a9 28 __ LDA #$28
43c5 : 85 12 __ STA P5 
43c7 : a9 10 __ LDA #$10
43c9 : 85 13 __ STA P6 
43cb : 20 95 2c JSR $2c95 ; (vdc_clear@proxy + 0)
43ce : a9 ad __ LDA #$ad
43d0 : a0 02 __ LDY #$02
43d2 : 91 23 __ STA (SP + 0),y 
43d4 : a9 52 __ LDA #$52
43d6 : c8 __ __ INY
43d7 : 91 23 __ STA (SP + 0),y 
43d9 : a9 39 __ LDA #$39
43db : c8 __ __ INY
43dc : 91 23 __ STA (SP + 0),y 
43de : a9 44 __ LDA #$44
43e0 : c8 __ __ INY
43e1 : 91 23 __ STA (SP + 0),y 
43e3 : ad fd bf LDA $bffd ; (sstack + 5)
43e6 : c8 __ __ INY
43e7 : 91 23 __ STA (SP + 0),y 
43e9 : a9 00 __ LDA #$00
43eb : c8 __ __ INY
43ec : 91 23 __ STA (SP + 0),y 
43ee : a9 90 __ LDA #$90
43f0 : c8 __ __ INY
43f1 : 91 23 __ STA (SP + 0),y 
43f3 : a9 53 __ LDA #$53
43f5 : c8 __ __ INY
43f6 : 91 23 __ STA (SP + 0),y 
43f8 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
43fb : 20 5e 50 JSR $505e ; (vdc_prints@proxy + 0)
43fe : a9 ad __ LDA #$ad
4400 : a0 02 __ LDY #$02
4402 : 91 23 __ STA (SP + 0),y 
4404 : a9 52 __ LDA #$52
4406 : c8 __ __ INY
4407 : 91 23 __ STA (SP + 0),y 
4409 : a9 46 __ LDA #$46
440b : c8 __ __ INY
440c : 91 23 __ STA (SP + 0),y 
440e : a9 44 __ LDA #$44
4410 : c8 __ __ INY
4411 : 91 23 __ STA (SP + 0),y 
4413 : ad af 53 LDA $53af ; (cwd + 31)
4416 : c8 __ __ INY
4417 : 91 23 __ STA (SP + 0),y 
4419 : ad b0 53 LDA $53b0 ; (cwd + 32)
441c : c8 __ __ INY
441d : 91 23 __ STA (SP + 0),y 
441f : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
4422 : a9 0b __ LDA #$0b
4424 : 85 11 __ STA P4 
4426 : a9 14 __ LDA #$14
4428 : 85 12 __ STA P5 
442a : 20 71 50 JSR $5071 ; (vdc_prints@proxy + 0)
.s1001:
442d : 18 __ __ CLC
442e : a5 23 __ LDA SP + 0 
4430 : 69 0a __ ADC #$0a
4432 : 85 23 __ STA SP + 0 
4434 : 90 02 __ BCC $4438 ; (drawDirFrame.s1001 + 11)
4436 : e6 24 __ INC SP + 1 
4438 : 60 __ __ RTS
--------------------------------------------------------------------
4439 : __ __ __ BYT 5b 25 30 32 55 5d 20 25 2e 32 30 53 00          : [%02U] %.20S.
--------------------------------------------------------------------
4446 : __ __ __ BYT 25 55 20 42 4c 4f 43 4b 53 20 46 52 45 45 00    : %U BLOCKS FREE.
--------------------------------------------------------------------
printElementPriv: ; printElementPriv(const u8)->void
.s1000:
4455 : a2 03 __ LDX #$03
4457 : b5 53 __ LDA T1 + 0,x 
4459 : 9d d6 bf STA $bfd6,x ; (buff + 44)
445c : ca __ __ DEX
445d : 10 f8 __ BPL $4457 ; (printElementPriv.s1000 + 2)
445f : 38 __ __ SEC
4460 : a5 23 __ LDA SP + 0 
4462 : e9 0a __ SBC #$0a
4464 : 85 23 __ STA SP + 0 
4466 : b0 02 __ BCS $446a ; (printElementPriv.s0 + 0)
4468 : c6 24 __ DEC SP + 1 
.s0:
446a : a9 0c __ LDA #$0c
446c : 8d 9d 52 STA $529d ; (fullscreen + 4)
446f : ad ff 4b LDA $4bff ; (mc_pd_normal + 0)
4472 : 8d 87 52 STA $5287 ; (vdc_state + 7)
4475 : ad fd bf LDA $bffd ; (sstack + 5)
4478 : 8d 9e 52 STA $529e ; (fullscreen + 5)
447b : ad b6 53 LDA $53b6 ; (current + 0)
447e : 85 53 __ STA T1 + 0 
4480 : ad b7 53 LDA $53b7 ; (current + 1)
4483 : 85 54 __ STA T1 + 1 
4485 : cd aa 53 CMP $53aa ; (cwd + 26)
4488 : d0 0d __ BNE $4497 ; (printElementPriv.s3 + 0)
.s1011:
448a : a5 53 __ LDA T1 + 0 
448c : cd a9 53 CMP $53a9 ; (cwd + 25)
448f : d0 06 __ BNE $4497 ; (printElementPriv.s3 + 0)
.s1:
4491 : ad c2 50 LDA $50c2 ; (mc_pd_select + 0)
4494 : 8d 87 52 STA $5287 ; (vdc_state + 7)
.s3:
4497 : a0 ff __ LDY #$ff
.l1002:
4499 : c8 __ __ INY
449a : b1 53 __ LDA (T1 + 0),y 
449c : 99 ad 52 STA $52ad,y ; (linebuffer + 0)
449f : d0 f8 __ BNE $4499 ; (printElementPriv.l1002 + 0)
.s1003:
44a1 : a9 ad __ LDA #$ad
44a3 : a0 08 __ LDY #$08
44a5 : 91 23 __ STA (SP + 0),y 
44a7 : a9 52 __ LDA #$52
44a9 : c8 __ __ INY
44aa : 91 23 __ STA (SP + 0),y 
44ac : a9 00 __ LDA #$00
44ae : a0 02 __ LDY #$02
44b0 : 91 23 __ STA (SP + 0),y 
44b2 : a9 54 __ LDA #$54
44b4 : c8 __ __ INY
44b5 : 91 23 __ STA (SP + 0),y 
44b7 : a0 11 __ LDY #$11
44b9 : b1 53 __ LDA (T1 + 0),y 
44bb : 85 1b __ STA ACCU + 0 
44bd : c8 __ __ INY
44be : b1 53 __ LDA (T1 + 0),y 
44c0 : a0 07 __ LDY #$07
44c2 : 91 23 __ STA (SP + 0),y 
44c4 : aa __ __ TAX
44c5 : a5 1b __ LDA ACCU + 0 
44c7 : 88 __ __ DEY
44c8 : 91 23 __ STA (SP + 0),y 
44ca : e0 27 __ CPX #$27
44cc : d0 02 __ BNE $44d0 ; (printElementPriv.s1010 + 0)
.s1009:
44ce : c9 10 __ CMP #$10
.s1010:
44d0 : b0 06 __ BCS $44d8 ; (printElementPriv.s10 + 0)
.s9:
44d2 : a9 45 __ LDA #$45
44d4 : a2 88 __ LDX #$88
44d6 : 90 04 __ BCC $44dc ; (printElementPriv.s11 + 0)
.s10:
44d8 : a9 45 __ LDA #$45
44da : a2 93 __ LDX #$93
.s11:
44dc : 85 54 __ STA T1 + 1 
44de : 8a __ __ TXA
44df : a0 04 __ LDY #$04
44e1 : 91 23 __ STA (SP + 0),y 
44e3 : a5 54 __ LDA T1 + 1 
44e5 : c8 __ __ INY
44e6 : 91 23 __ STA (SP + 0),y 
44e8 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
44eb : a9 00 __ LDA #$00
44ed : a0 04 __ LDY #$04
44ef : 91 23 __ STA (SP + 0),y 
44f1 : a9 54 __ LDA #$54
44f3 : c8 __ __ INY
44f4 : 91 23 __ STA (SP + 0),y 
44f6 : a9 99 __ LDA #$99
44f8 : a0 02 __ LDY #$02
44fa : 91 23 __ STA (SP + 0),y 
44fc : a9 52 __ LDA #$52
44fe : c8 __ __ INY
44ff : 91 23 __ STA (SP + 0),y 
4501 : 20 f4 40 JSR $40f4 ; (vdcwin_put_string.s1000 + 0)
4504 : ad b6 53 LDA $53b6 ; (current + 0)
4507 : 85 55 __ STA T3 + 0 
4509 : ad b7 53 LDA $53b7 ; (current + 1)
450c : 85 56 __ STA T3 + 1 
450e : a0 13 __ LDY #$13
4510 : b1 55 __ LDA (T3 + 0),y 
4512 : 20 9d 45 JSR $459d ; (fileTypeToStr.s1000 + 0)
4515 : a0 ff __ LDY #$ff
.l1004:
4517 : c8 __ __ INY
4518 : b1 1b __ LDA (ACCU + 0),y 
451a : 99 00 54 STA $5400,y ; (linebuffer2 + 0)
451d : d0 f8 __ BNE $4517 ; (printElementPriv.l1004 + 0)
.s1005:
451f : a0 12 __ LDY #$12
4521 : b1 55 __ LDA (T3 + 0),y 
4523 : c9 27 __ CMP #$27
4525 : d0 05 __ BNE $452c ; (printElementPriv.s1008 + 0)
.s1007:
4527 : 88 __ __ DEY
4528 : b1 55 __ LDA (T3 + 0),y 
452a : c9 10 __ CMP #$10
.s1008:
452c : 90 26 __ BCC $4554 ; (printElementPriv.s7 + 0)
.s8:
452e : a5 55 __ LDA T3 + 0 
4530 : 85 0d __ STA P0 
4532 : a5 56 __ LDA T3 + 1 
4534 : 85 0e __ STA P1 
4536 : 20 51 33 JSR $3351 ; (strlen.s0 + 0)
4539 : a5 1c __ LDA ACCU + 1 
453b : d0 17 __ BNE $4554 ; (printElementPriv.s7 + 0)
.s1006:
453d : a5 1b __ LDA ACCU + 0 
453f : c9 10 __ CMP #$10
4541 : d0 11 __ BNE $4554 ; (printElementPriv.s7 + 0)
.s5:
4543 : ad 01 54 LDA $5401 ; (linebuffer2 + 1)
4546 : 8d 00 54 STA $5400 ; (linebuffer2 + 0)
4549 : ad 02 54 LDA $5402 ; (linebuffer2 + 2)
454c : 8d 01 54 STA $5401 ; (linebuffer2 + 1)
454f : a9 00 __ LDA #$00
4551 : 8d 02 54 STA $5402 ; (linebuffer2 + 2)
.s7:
4554 : a9 99 __ LDA #$99
4556 : a0 02 __ LDY #$02
4558 : 91 23 __ STA (SP + 0),y 
455a : a9 52 __ LDA #$52
455c : c8 __ __ INY
455d : 91 23 __ STA (SP + 0),y 
455f : a9 00 __ LDA #$00
4561 : c8 __ __ INY
4562 : 91 23 __ STA (SP + 0),y 
4564 : a9 54 __ LDA #$54
4566 : c8 __ __ INY
4567 : 91 23 __ STA (SP + 0),y 
4569 : 20 f4 40 JSR $40f4 ; (vdcwin_put_string.s1000 + 0)
456c : ad fe 4b LDA $4bfe ; (mc_menupopup + 0)
456f : 8d 87 52 STA $5287 ; (vdc_state + 7)
.s1001:
4572 : 18 __ __ CLC
4573 : a5 23 __ LDA SP + 0 
4575 : 69 0a __ ADC #$0a
4577 : 85 23 __ STA SP + 0 
4579 : 90 02 __ BCC $457d ; (printElementPriv.s1001 + 11)
457b : e6 24 __ INC SP + 1 
457d : a2 03 __ LDX #$03
457f : bd d6 bf LDA $bfd6,x ; (buff + 44)
4582 : 95 53 __ STA T1 + 0,x 
4584 : ca __ __ DEX
4585 : 10 f8 __ BPL $457f ; (printElementPriv.s1001 + 13)
4587 : 60 __ __ RTS
--------------------------------------------------------------------
4588 : __ __ __ BYT 25 34 55 20 25 2d 31 36 53 20 00                : %4U %-16S .
--------------------------------------------------------------------
4593 : __ __ __ BYT 25 55 20 25 2d 31 35 53 20 00                   : %U %-15S .
--------------------------------------------------------------------
fileTypeToStr: ; fileTypeToStr(u8)->const u8*
.s1000:
459d : aa __ __ TAX
.s0:
459e : a8 __ __ TAY
459f : 29 10 __ AND #$10
45a1 : d0 43 __ BNE $45e6 ; (fileTypeToStr.s1 + 0)
.s2:
45a3 : e0 06 __ CPX #$06
45a5 : b0 0e __ BCS $45b5 ; (fileTypeToStr.s3 + 0)
.s8:
45a7 : 98 __ __ TYA
45a8 : 0a __ __ ASL
45a9 : aa __ __ TAX
45aa : bd cd 50 LDA $50cd,x ; (oth_types + 0)
45ad : 85 1b __ STA ACCU + 0 
45af : bd ce 50 LDA $50ce,x ; (oth_types + 1)
45b2 : 4c e3 45 JMP $45e3 ; (fileTypeToStr.s1001 + 0)
.s3:
45b5 : a9 3f __ LDA #$3f
45b7 : 8d b8 53 STA $53b8 ; (bad_type + 0)
45ba : ad d9 50 LDA $50d9 ; (value2hex + 0)
45bd : 85 1b __ STA ACCU + 0 
45bf : ad da 50 LDA $50da ; (value2hex + 1)
45c2 : 85 1c __ STA ACCU + 1 
45c4 : 8a __ __ TXA
45c5 : 4a __ __ LSR
45c6 : 4a __ __ LSR
45c7 : 4a __ __ LSR
45c8 : 4a __ __ LSR
45c9 : a8 __ __ TAY
45ca : b1 1b __ LDA (ACCU + 0),y 
45cc : 8d b9 53 STA $53b9 ; (bad_type + 1)
45cf : 8a __ __ TXA
45d0 : 29 0f __ AND #$0f
45d2 : a8 __ __ TAY
45d3 : b1 1b __ LDA (ACCU + 0),y 
45d5 : 8d ba 53 STA $53ba ; (bad_type + 2)
45d8 : a9 00 __ LDA #$00
45da : 8d bb 53 STA $53bb ; (bad_type + 3)
45dd : a9 b8 __ LDA #$b8
45df : 85 1b __ STA ACCU + 0 
45e1 : a9 53 __ LDA #$53
.s1001:
45e3 : 85 1c __ STA ACCU + 1 
45e5 : 60 __ __ RTS
.s1:
45e6 : 8a __ __ TXA
45e7 : 29 ef __ AND #$ef
45e9 : c9 05 __ CMP #$05
45eb : aa __ __ TAX
45ec : b0 c7 __ BCS $45b5 ; (fileTypeToStr.s3 + 0)
.s4:
45ee : 0a __ __ ASL
45ef : aa __ __ TAX
45f0 : bd c3 50 LDA $50c3,x ; (reg_types + 0)
45f3 : 85 1b __ STA ACCU + 0 
45f5 : bd c4 50 LDA $50c4,x ; (reg_types + 1)
45f8 : 4c e3 45 JMP $45e3 ; (fileTypeToStr.s1001 + 0)
--------------------------------------------------------------------
45fb : __ __ __ BYT 70 72 67 00                                     : prg.
--------------------------------------------------------------------
45ff : __ __ __ BYT 75 72 73 00                                     : urs.
--------------------------------------------------------------------
4603 : __ __ __ BYT 72 65 6c 00                                     : rel.
--------------------------------------------------------------------
4607 : __ __ __ BYT 76 72 70 00                                     : vrp.
--------------------------------------------------------------------
460b : __ __ __ BYT 64 65 6c 00                                     : del.
--------------------------------------------------------------------
460f : __ __ __ BYT 63 62 6d 00                                     : cbm.
--------------------------------------------------------------------
4613 : __ __ __ BYT 64 69 72 00                                     : dir.
--------------------------------------------------------------------
4617 : __ __ __ BYT 6c 6e 6b 00                                     : lnk.
--------------------------------------------------------------------
461b : __ __ __ BYT 6f 74 68 00                                     : oth.
--------------------------------------------------------------------
461f : __ __ __ BYT 68 64 72 00                                     : hdr.
--------------------------------------------------------------------
4623 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 : 0123456789ABCDEF
4633 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4634 : __ __ __ BYT 6e 4f 20 56 41 4c 49 44 20 44 49 52 45 43 54 4f : nO VALID DIRECTO
4644 : __ __ __ BYT 52 59 20 45 4e 54 52 49 45 53 20 46 4f 55 4e 44 : RY ENTRIES FOUND
4654 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
4656 : __ __ __ BYT 20 66 31 20 64 49 52 20 52 45 46 52 2e 00       :  f1 dIR REFR..
--------------------------------------------------------------------
4664 : __ __ __ BYT 2b 2f 2d 20 64 45 56 49 43 45 00                : +/- dEVICE.
--------------------------------------------------------------------
466f : __ __ __ BYT 72 65 74 20 73 45 4c 45 43 54 00                : ret sELECT.
--------------------------------------------------------------------
467a : __ __ __ BYT 20 20 74 20 74 4f 50 00                         :   t tOP.
--------------------------------------------------------------------
4682 : __ __ __ BYT 20 20 65 20 65 4e 44 00                         :   e eND.
--------------------------------------------------------------------
468a : __ __ __ BYT 70 2f 75 20 70 41 47 45 20 55 50 2f 44 4f 00    : p/u pAGE UP/DO.
--------------------------------------------------------------------
4699 : __ __ __ BYT 63 55 52 20 6e 41 56 49 47 41 54 45 00          : cUR nAVIGATE.
--------------------------------------------------------------------
46a6 : __ __ __ BYT 65 73 63 20 63 41 4e 43 45 4c 00                : esc cANCEL.
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
46b1 : 20 e4 ff JSR $ffe4 
46b4 : c9 00 __ CMP #$00
46b6 : f0 f9 __ BEQ $46b1 ; (vdcwin_getch.s0 + 0)
46b8 : 85 1b __ STA ACCU + 0 
46ba : a9 00 __ LDA #$00
46bc : 85 1c __ STA ACCU + 1 
.s1001:
46be : 60 __ __ RTS
--------------------------------------------------------------------
freeDir: ; freeDir()->void
.s0:
46bf : ad 90 53 LDA $5390 ; (cwd + 0)
46c2 : f0 41 __ BEQ $4705 ; (freeDir.s1001 + 0)
.s3:
46c4 : ad a7 53 LDA $53a7 ; (cwd + 23)
46c7 : 85 43 __ STA T1 + 0 
46c9 : 8d b6 53 STA $53b6 ; (current + 0)
46cc : ad a8 53 LDA $53a8 ; (cwd + 24)
46cf : 85 44 __ STA T1 + 1 
46d1 : 8d b7 53 STA $53b7 ; (current + 1)
46d4 : 05 43 __ ORA T1 + 0 
46d6 : f0 28 __ BEQ $4700 ; (freeDir.s7 + 0)
.l6:
46d8 : a5 43 __ LDA T1 + 0 
46da : 85 1b __ STA ACCU + 0 
46dc : a5 44 __ LDA T1 + 1 
46de : 85 1c __ STA ACCU + 1 
46e0 : a0 15 __ LDY #$15
46e2 : b1 43 __ LDA (T1 + 0),y 
46e4 : 85 02 __ STA $02 
46e6 : c8 __ __ INY
46e7 : b1 43 __ LDA (T1 + 0),y 
46e9 : 85 44 __ STA T1 + 1 
46eb : 20 5e 4f JSR $4f5e ; (free + 0)
46ee : a5 02 __ LDA $02 
46f0 : 85 43 __ STA T1 + 0 
46f2 : 05 44 __ ORA T1 + 1 
46f4 : d0 e2 __ BNE $46d8 ; (freeDir.l6 + 0)
.s9:
46f6 : a5 02 __ LDA $02 
46f8 : 8d b6 53 STA $53b6 ; (current + 0)
46fb : a5 44 __ LDA T1 + 1 
46fd : 8d b7 53 STA $53b7 ; (current + 1)
.s7:
4700 : a9 00 __ LDA #$00
4702 : 8d 90 53 STA $5390 ; (cwd + 0)
.s1001:
4705 : 60 __ __ RTS
--------------------------------------------------------------------
4706 : __ __ __ BYT 5b 25 32 55 5d 20 25 53 00                      : [%2U] %S.
--------------------------------------------------------------------
470f : __ __ __ BYT 66 49 4c 45 20 53 45 4c 45 43 54 45 44 3a 00    : fILE SELECTED:.
--------------------------------------------------------------------
471e : __ __ __ BYT 63 48 4f 4f 53 45 20 46 49 4c 45 4e 41 4d 45 20 : cHOOSE FILENAME 
472e : __ __ __ BYT 4f 46 20 47 45 4e 45 52 41 54 45 44 20 50 52 4f : OF GENERATED PRO
473e : __ __ __ BYT 47 52 41 4d 3a 00                               : GRAM:.
--------------------------------------------------------------------
textInput: ; textInput(u8,u8,u8*,u8)->void
.s0:
4744 : 20 49 33 JSR $3349 ; (strlen@proxy + 0)
4747 : a5 1b __ LDA ACCU + 0 
4749 : 85 4a __ STA T1 + 0 
474b : f0 13 __ BEQ $4760 ; (textInput.l143 + 0)
.s1:
474d : a5 17 __ LDA P10 ; (str + 0)
474f : 85 13 __ STA P6 
4751 : a5 18 __ LDA P11 ; (str + 1)
4753 : 85 14 __ STA P7 
4755 : a5 15 __ LDA P8 ; (xpos + 0)
4757 : 85 11 __ STA P4 
4759 : a5 16 __ LDA P9 ; (ypos + 0)
475b : 85 12 __ STA P5 
475d : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
.l143:
4760 : 18 __ __ CLC
4761 : a5 4a __ LDA T1 + 0 
4763 : 65 15 __ ADC P8 ; (xpos + 0)
4765 : 8d 9d 52 STA $529d ; (fullscreen + 4)
4768 : a5 16 __ LDA P9 ; (ypos + 0)
476a : 8d 9e 52 STA $529e ; (fullscreen + 5)
.l142:
476d : 20 09 49 JSR $4909 ; (vdcwin_cursor_toggle.s0 + 0)
.l6:
4770 : 20 b1 46 JSR $46b1 ; (vdcwin_getch.s0 + 0)
4773 : a5 1b __ LDA ACCU + 0 
4775 : c9 1b __ CMP #$1b
4777 : d0 03 __ BNE $477c ; (textInput.s70 + 0)
4779 : 4c 98 48 JMP $4898 ; (textInput.s1001 + 0)
.s70:
477c : 85 4c __ STA T3 + 0 
477e : c9 1b __ CMP #$1b
4780 : b0 03 __ BCS $4785 ; (textInput.s71 + 0)
4782 : 4c 7f 48 JMP $487f ; (textInput.s72 + 0)
.s71:
4785 : c9 94 __ CMP #$94
4787 : d0 5e __ BNE $47e7 ; (textInput.s78 + 0)
.s27:
4789 : 20 49 33 JSR $3349 ; (strlen@proxy + 0)
478c : a5 1b __ LDA ACCU + 0 
478e : c9 14 __ CMP #$14
4790 : b0 de __ BCS $4770 ; (textInput.l6 + 0)
.s32:
4792 : 85 4e __ STA T4 + 0 
4794 : 09 00 __ ORA #$00
4796 : f0 d8 __ BEQ $4770 ; (textInput.l6 + 0)
.s31:
4798 : a5 4a __ LDA T1 + 0 
479a : c5 1b __ CMP ACCU + 0 
479c : b0 d2 __ BCS $4770 ; (textInput.l6 + 0)
.s28:
479e : 20 09 49 JSR $4909 ; (vdcwin_cursor_toggle.s0 + 0)
47a1 : a5 17 __ LDA P10 ; (str + 0)
47a3 : 85 13 __ STA P6 
47a5 : a5 18 __ LDA P11 ; (str + 1)
47a7 : 85 14 __ STA P7 
47a9 : a5 15 __ LDA P8 ; (xpos + 0)
47ab : 85 11 __ STA P4 
47ad : a5 16 __ LDA P9 ; (ypos + 0)
47af : 85 12 __ STA P5 
47b1 : 18 __ __ CLC
47b2 : a5 4e __ LDA T4 + 0 
47b4 : 69 01 __ ADC #$01
47b6 : c5 4a __ CMP T1 + 0 
47b8 : 90 14 __ BCC $47ce ; (textInput.s35 + 0)
.s1038:
47ba : 85 4f __ STA T7 + 0 
47bc : a8 __ __ TAY
.l34:
47bd : b1 17 __ LDA (P10),y ; (str + 0)
47bf : c8 __ __ INY
47c0 : 91 17 __ STA (P10),y ; (str + 0)
47c2 : a5 4f __ LDA T7 + 0 
47c4 : f0 08 __ BEQ $47ce ; (textInput.s35 + 0)
.s38:
47c6 : c6 4f __ DEC T7 + 0 
47c8 : a4 4f __ LDY T7 + 0 
47ca : c4 4a __ CPY T1 + 0 
47cc : b0 ef __ BCS $47bd ; (textInput.l34 + 0)
.s35:
47ce : a9 20 __ LDA #$20
47d0 : a4 4a __ LDY T1 + 0 
47d2 : 91 17 __ STA (P10),y ; (str + 0)
47d4 : 20 09 32 JSR $3209 ; (vdc_prints.s0 + 0)
47d7 : a5 16 __ LDA P9 ; (ypos + 0)
47d9 : 8d 9e 52 STA $529e ; (fullscreen + 5)
47dc : 18 __ __ CLC
47dd : a5 15 __ LDA P8 ; (xpos + 0)
47df : 65 4a __ ADC T1 + 0 
.s144:
47e1 : 8d 9d 52 STA $529d ; (fullscreen + 4)
47e4 : 4c 6d 47 JMP $476d ; (textInput.l142 + 0)
.s78:
47e7 : 90 6c __ BCC $4855 ; (textInput.s80 + 0)
.s79:
47e9 : c9 9d __ CMP #$9d
47eb : d0 0f __ BNE $47fc ; (textInput.s53 + 0)
.s41:
47ed : a5 4a __ LDA T1 + 0 
47ef : d0 03 __ BNE $47f4 ; (textInput.s42 + 0)
47f1 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s42:
47f4 : c6 4a __ DEC T1 + 0 
.s145:
47f6 : 20 09 49 JSR $4909 ; (vdcwin_cursor_toggle.s0 + 0)
47f9 : 4c 60 47 JMP $4760 ; (textInput.l143 + 0)
.s53:
47fc : 09 00 __ ORA #$00
47fe : 10 03 __ BPL $4803 ; (textInput.s62 + 0)
4800 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s62:
4803 : aa __ __ TAX
4804 : bd 00 52 LDA $5200,x ; (_cinfo + 0)
4807 : d0 03 __ BNE $480c ; (textInput.s59 + 0)
4809 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s59:
480c : a4 4a __ LDY T1 + 0 
480e : c0 14 __ CPY #$14
4810 : 90 03 __ BCC $4815 ; (textInput.s54 + 0)
4812 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s54:
4815 : b1 17 __ LDA (P10),y ; (str + 0)
4817 : 85 4b __ STA T2 + 0 
4819 : 8a __ __ TXA
481a : 91 17 __ STA (P10),y ; (str + 0)
481c : 20 09 49 JSR $4909 ; (vdcwin_cursor_toggle.s0 + 0)
481f : a5 4c __ LDA T3 + 0 
4821 : 20 75 33 JSR $3375 ; (pet2screen.s0 + 0)
4824 : 85 0f __ STA P2 
4826 : 18 __ __ CLC
4827 : a5 15 __ LDA P8 ; (xpos + 0)
4829 : 65 4a __ ADC T1 + 0 
482b : 85 0d __ STA P0 
482d : a5 16 __ LDA P9 ; (ypos + 0)
482f : 85 0e __ STA P1 
4831 : 20 7c 50 JSR $507c ; (vdc_printc@proxy + 0)
4834 : a5 16 __ LDA P9 ; (ypos + 0)
4836 : 8d 9e 52 STA $529e ; (fullscreen + 5)
4839 : e6 4a __ INC T1 + 0 
483b : 18 __ __ CLC
483c : a5 4a __ LDA T1 + 0 
483e : 65 15 __ ADC P8 ; (xpos + 0)
4840 : 8d 9d 52 STA $529d ; (fullscreen + 4)
4843 : 20 09 49 JSR $4909 ; (vdcwin_cursor_toggle.s0 + 0)
4846 : a5 4b __ LDA T2 + 0 
4848 : f0 03 __ BEQ $484d ; (textInput.s65 + 0)
484a : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s65:
484d : a4 4a __ LDY T1 + 0 
484f : c8 __ __ INY
4850 : 91 17 __ STA (P10),y ; (str + 0)
4852 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s80:
4855 : c9 1d __ CMP #$1d
4857 : d0 a3 __ BNE $47fc ; (textInput.s53 + 0)
.s46:
4859 : 20 49 33 JSR $3349 ; (strlen@proxy + 0)
485c : a5 1c __ LDA ACCU + 1 
485e : 10 03 __ BPL $4863 ; (textInput.s1012 + 0)
4860 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s1012:
4863 : d0 15 __ BNE $487a ; (textInput.s1037 + 0)
.s1010:
4865 : a5 4a __ LDA T1 + 0 
4867 : c5 1b __ CMP ACCU + 0 
4869 : 90 03 __ BCC $486e ; (textInput.s50 + 0)
486b : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s50:
486e : c9 14 __ CMP #$14
4870 : 90 03 __ BCC $4875 ; (textInput.s47 + 0)
4872 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s47:
4875 : e6 4a __ INC T1 + 0 
4877 : 4c f6 47 JMP $47f6 ; (textInput.s145 + 0)
.s1037:
487a : a5 4a __ LDA T1 + 0 
487c : 4c 6e 48 JMP $486e ; (textInput.s50 + 0)
.s72:
487f : c9 0d __ CMP #$0d
4881 : d0 0c __ BNE $488f ; (textInput.s73 + 0)
.s10:
4883 : 20 49 33 JSR $3349 ; (strlen@proxy + 0)
4886 : a9 00 __ LDA #$00
4888 : a4 1b __ LDY ACCU + 0 
488a : 91 17 __ STA (P10),y ; (str + 0)
488c : 4c 98 48 JMP $4898 ; (textInput.s1001 + 0)
.s73:
488f : b0 0a __ BCS $489b ; (textInput.s74 + 0)
.s75:
4891 : c9 03 __ CMP #$03
4893 : f0 03 __ BEQ $4898 ; (textInput.s1001 + 0)
4895 : 4c fc 47 JMP $47fc ; (textInput.s53 + 0)
.s1001:
4898 : 4c 09 49 JMP $4909 ; (vdcwin_cursor_toggle.s0 + 0)
.s74:
489b : c9 14 __ CMP #$14
489d : f0 03 __ BEQ $48a2 ; (textInput.s11 + 0)
489f : 4c fc 47 JMP $47fc ; (textInput.s53 + 0)
.s11:
48a2 : a5 4a __ LDA T1 + 0 
48a4 : d0 03 __ BNE $48a9 ; (textInput.s12 + 0)
48a6 : 4c 70 47 JMP $4770 ; (textInput.l6 + 0)
.s12:
48a9 : 20 09 49 JSR $4909 ; (vdcwin_cursor_toggle.s0 + 0)
48ac : a9 20 __ LDA #$20
48ae : 85 0f __ STA P2 
48b0 : c6 4a __ DEC T1 + 0 
48b2 : 18 __ __ CLC
48b3 : a5 4a __ LDA T1 + 0 
48b5 : 65 15 __ ADC P8 ; (xpos + 0)
48b7 : 85 0d __ STA P0 
48b9 : a5 16 __ LDA P9 ; (ypos + 0)
48bb : 85 4b __ STA T2 + 0 
48bd : 85 0e __ STA P1 
48bf : 20 7c 50 JSR $507c ; (vdc_printc@proxy + 0)
48c2 : a5 4a __ LDA T1 + 0 
48c4 : 85 4f __ STA T7 + 0 
48c6 : a5 17 __ LDA P10 ; (str + 0)
48c8 : 85 4c __ STA T3 + 0 
48ca : a5 18 __ LDA P11 ; (str + 1)
48cc : 85 4d __ STA T3 + 1 
.l16:
48ce : a4 4f __ LDY T7 + 0 
48d0 : c8 __ __ INY
48d1 : b1 4c __ LDA (T3 + 0),y 
48d3 : 85 50 __ STA T8 + 0 
48d5 : 88 __ __ DEY
48d6 : 91 4c __ STA (T3 + 0),y 
48d8 : 09 00 __ ORA #$00
48da : d0 04 __ BNE $48e0 ; (textInput.s19 + 0)
.s20:
48dc : a9 20 __ LDA #$20
48de : d0 03 __ BNE $48e3 ; (textInput.s21 + 0)
.s19:
48e0 : 20 75 33 JSR $3375 ; (pet2screen.s0 + 0)
.s21:
48e3 : 85 0f __ STA P2 
48e5 : a5 4b __ LDA T2 + 0 
48e7 : 85 0e __ STA P1 
48e9 : 18 __ __ CLC
48ea : a5 15 __ LDA P8 ; (xpos + 0)
48ec : 65 4f __ ADC T7 + 0 
48ee : 85 0d __ STA P0 
48f0 : 20 7c 50 JSR $507c ; (vdc_printc@proxy + 0)
48f3 : a5 50 __ LDA T8 + 0 
48f5 : d0 0d __ BNE $4904 ; (textInput.s17 + 0)
.s18:
48f7 : a5 0e __ LDA P1 
48f9 : 8d 9e 52 STA $529e ; (fullscreen + 5)
48fc : 18 __ __ CLC
48fd : a5 4a __ LDA T1 + 0 
48ff : 65 15 __ ADC P8 ; (xpos + 0)
4901 : 4c e1 47 JMP $47e1 ; (textInput.s144 + 0)
.s17:
4904 : e6 4f __ INC T7 + 0 
4906 : 4c ce 48 JMP $48ce ; (textInput.l16 + 0)
--------------------------------------------------------------------
vdcwin_cursor_toggle: ; vdcwin_cursor_toggle(struct VDCWin*)->void
.s0:
4909 : ad 9e 52 LDA $529e ; (fullscreen + 5)
490c : 18 __ __ CLC
490d : 6d 9a 52 ADC $529a ; (fullscreen + 1)
4910 : 0a __ __ ASL
4911 : a8 __ __ TAY
4912 : a9 12 __ LDA #$12
4914 : 8d 00 d6 STA $d600 
4917 : ad 9d 52 LDA $529d ; (fullscreen + 4)
491a : 18 __ __ CLC
491b : 6d 99 52 ADC $5299 ; (fullscreen + 0)
491e : 18 __ __ CLC
491f : 79 00 53 ADC $5300,y ; (multab + 0)
4922 : aa __ __ TAX
4923 : a9 00 __ LDA #$00
4925 : 79 01 53 ADC $5301,y ; (multab + 1)
4928 : a8 __ __ TAY
4929 : 8a __ __ TXA
492a : 18 __ __ CLC
492b : 6d 8a 52 ADC $528a ; (vdc_state + 10)
492e : aa __ __ TAX
492f : 98 __ __ TYA
4930 : 6d 8b 52 ADC $528b ; (vdc_state + 11)
.l169:
4933 : 2c 00 d6 BIT $d600 
4936 : 10 fb __ BPL $4933 ; (vdcwin_cursor_toggle.l169 + 0)
.s9:
4938 : 8d 01 d6 STA $d601 
493b : a0 13 __ LDY #$13
493d : 8c 00 d6 STY $d600 
.l171:
4940 : 2c 00 d6 BIT $d600 
4943 : 10 fb __ BPL $4940 ; (vdcwin_cursor_toggle.l171 + 0)
.s14:
4945 : 8e 01 d6 STX $d601 
4948 : a0 1f __ LDY #$1f
494a : 8c 00 d6 STY $d600 
.l173:
494d : 2c 00 d6 BIT $d600 
4950 : 10 fb __ BPL $494d ; (vdcwin_cursor_toggle.l173 + 0)
.s18:
4952 : a8 __ __ TAY
4953 : ad 01 d6 LDA $d601 
4956 : 49 50 __ EOR #$50
4958 : 85 1b __ STA ACCU + 0 
495a : a9 12 __ LDA #$12
495c : 8d 00 d6 STA $d600 
.l175:
495f : 2c 00 d6 BIT $d600 
4962 : 10 fb __ BPL $495f ; (vdcwin_cursor_toggle.l175 + 0)
.s27:
4964 : 8c 01 d6 STY $d601 
4967 : a9 13 __ LDA #$13
4969 : 8d 00 d6 STA $d600 
.l177:
496c : 2c 00 d6 BIT $d600 
496f : 10 fb __ BPL $496c ; (vdcwin_cursor_toggle.l177 + 0)
.s32:
4971 : 8e 01 d6 STX $d601 
4974 : a9 1f __ LDA #$1f
4976 : 8d 00 d6 STA $d600 
.l179:
4979 : 2c 00 d6 BIT $d600 
497c : 10 fb __ BPL $4979 ; (vdcwin_cursor_toggle.l179 + 0)
.s36:
497e : a5 1b __ LDA ACCU + 0 
4980 : 8d 01 d6 STA $d601 
.s1001:
4983 : 60 __ __ RTS
--------------------------------------------------------------------
4984 : __ __ __ BYT 52 30 3a 25 53 3d 25 53 00                      : R0:%S=%S.
--------------------------------------------------------------------
cmd@proxy: ; cmd@proxy
498d : ad fe 51 LDA $51fe ; (targetdevice + 0)
4990 : 85 10 __ STA P3 
--------------------------------------------------------------------
cmd: ; cmd(const u8,const u8*)->u16
.s0:
4992 : a9 00 __ LDA #$00
4994 : 85 0d __ STA P0 
4996 : 85 0e __ STA P1 
4998 : 20 be 2a JSR $2abe ; (krnio_setbnk.s0 + 0)
499b : a5 11 __ LDA P4 ; (cmd + 0)
499d : 85 0d __ STA P0 
499f : a5 12 __ LDA P5 ; (cmd + 1)
49a1 : 85 0e __ STA P1 
49a3 : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
49a6 : a9 0f __ LDA #$0f
49a8 : 85 0d __ STA P0 
49aa : 85 0f __ STA P2 
49ac : 20 f5 33 JSR $33f5 ; (krnio_open@proxy + 0)
49af : 09 00 __ ORA #$00
49b1 : d0 08 __ BNE $49bb ; (cmd.s4 + 0)
.s2:
49b3 : a9 0f __ LDA #$0f
49b5 : 20 c3 ff JSR $ffc3 
49b8 : 4c de 49 JMP $49de ; (cmd.s1002 + 0)
.s4:
49bb : a9 00 __ LDA #$00
49bd : 8d bc 53 STA $53bc ; (DOSstatus + 0)
49c0 : a9 bc __ LDA #$bc
49c2 : 85 0e __ STA P1 
49c4 : a9 53 __ LDA #$53
49c6 : 85 0f __ STA P2 
49c8 : 20 ff 49 JSR $49ff ; (krnio_read.s0 + 0)
49cb : a5 1b __ LDA ACCU + 0 
49cd : 85 45 __ STA T0 + 0 
49cf : a5 1c __ LDA ACCU + 1 
49d1 : 85 46 __ STA T0 + 1 
49d3 : a9 0f __ LDA #$0f
49d5 : 20 c3 ff JSR $ffc3 
49d8 : a5 45 __ LDA T0 + 0 
49da : 05 46 __ ORA T0 + 1 
49dc : d0 06 __ BNE $49e4 ; (cmd.s18 + 0)
.s1002:
49de : 20 b7 ff JSR $ffb7 
49e1 : 4c f8 49 JMP $49f8 ; (cmd.s1001 + 0)
.s18:
49e4 : ad bc 53 LDA $53bc ; (DOSstatus + 0)
49e7 : 0a __ __ ASL
49e8 : 0a __ __ ASL
49e9 : 18 __ __ CLC
49ea : 6d bc 53 ADC $53bc ; (DOSstatus + 0)
49ed : 0a __ __ ASL
49ee : 38 __ __ SEC
49ef : e9 e0 __ SBC #$e0
49f1 : 18 __ __ CLC
49f2 : 6d bd 53 ADC $53bd ; (DOSstatus + 1)
49f5 : 38 __ __ SEC
49f6 : e9 30 __ SBC #$30
.s1001:
49f8 : 85 1b __ STA ACCU + 0 
49fa : a9 00 __ LDA #$00
49fc : 85 1c __ STA ACCU + 1 
49fe : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
.s0:
49ff : ad fd 51 LDA $51fd ; (krnio_pstatus + 15)
4a02 : c9 40 __ CMP #$40
4a04 : d0 04 __ BNE $4a0a ; (krnio_read.s3 + 0)
.s1:
4a06 : a9 00 __ LDA #$00
4a08 : f0 0b __ BEQ $4a15 ; (krnio_read.s1008 + 0)
.s3:
4a0a : a9 0f __ LDA #$0f
4a0c : 20 fe 3c JSR $3cfe ; (krnio_chkin.s1000 + 0)
4a0f : 09 00 __ ORA #$00
4a11 : d0 07 __ BNE $4a1a ; (krnio_read.s5 + 0)
.s6:
4a13 : a9 ff __ LDA #$ff
.s1008:
4a15 : 85 1b __ STA ACCU + 0 
.s1001:
4a17 : 85 1c __ STA ACCU + 1 
4a19 : 60 __ __ RTS
.s5:
4a1a : a9 00 __ LDA #$00
4a1c : 85 43 __ STA T1 + 0 
.l9:
4a1e : 20 12 3d JSR $3d12 ; (krnio_chrin.s0 + 0)
4a21 : a5 1b __ LDA ACCU + 0 
4a23 : 85 44 __ STA T2 + 0 
4a25 : 20 b7 ff JSR $ffb7 
4a28 : 8d fd 51 STA $51fd ; (krnio_pstatus + 15)
4a2b : aa __ __ TAX
4a2c : f0 04 __ BEQ $4a32 ; (krnio_read.s13 + 0)
.s14:
4a2e : c9 40 __ CMP #$40
4a30 : d0 11 __ BNE $4a43 ; (krnio_read.s10 + 0)
.s13:
4a32 : a5 44 __ LDA T2 + 0 
4a34 : a4 43 __ LDY T1 + 0 
4a36 : 91 0e __ STA (P1),y ; (data + 0)
4a38 : e6 43 __ INC T1 + 0 
4a3a : 8a __ __ TXA
4a3b : d0 06 __ BNE $4a43 ; (krnio_read.s10 + 0)
.s8:
4a3d : a5 43 __ LDA T1 + 0 
4a3f : c9 28 __ CMP #$28
4a41 : 90 db __ BCC $4a1e ; (krnio_read.l9 + 0)
.s10:
4a43 : 20 cc ff JSR $ffcc 
4a46 : a5 43 __ LDA T1 + 0 
4a48 : 85 1b __ STA ACCU + 0 
4a4a : a9 00 __ LDA #$00
4a4c : f0 c9 __ BEQ $4a17 ; (krnio_read.s1001 + 0)
--------------------------------------------------------------------
4a4e : __ __ __ BYT 6f 55 54 50 55 54 20 46 49 4c 45 20 45 58 49 53 : oUTPUT FILE EXIS
4a5e : __ __ __ BYT 54 53 2e 20 61 52 45 20 59 4f 55 20 53 55 52 45 : TS. aRE YOU SURE
4a6e : __ __ __ BYT 3f 20 79 2f 6e 20 00                            : ? y/n .
--------------------------------------------------------------------
4a75 : __ __ __ BYT 53 3a 25 53 00                                  : S:%S.
--------------------------------------------------------------------
prg_exit: ; prg_exit()->void
.s1000:
4a7a : 38 __ __ SEC
4a7b : a5 23 __ LDA SP + 0 
4a7d : e9 06 __ SBC #$06
4a7f : 85 23 __ STA SP + 0 
4a81 : b0 02 __ BCS $4a85 ; (prg_exit.s0 + 0)
4a83 : c6 24 __ DEC SP + 1 
.s0:
4a85 : a9 a3 __ LDA #$a3
4a87 : a0 02 __ LDY #$02
4a89 : 91 23 __ STA (SP + 0),y 
4a8b : a9 52 __ LDA #$52
4a8d : c8 __ __ INY
4a8e : 91 23 __ STA (SP + 0),y 
4a90 : a9 bf __ LDA #$bf
4a92 : c8 __ __ INY
4a93 : 91 23 __ STA (SP + 0),y 
4a95 : a9 4a __ LDA #$4a
4a97 : c8 __ __ INY
4a98 : 91 23 __ STA (SP + 0),y 
4a9a : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
4a9d : 20 b1 46 JSR $46b1 ; (vdcwin_getch.s0 + 0)
4aa0 : a9 00 __ LDA #$00
4aa2 : 20 fa 2d JSR $2dfa ; (fastmode.s0 + 0)
4aa5 : 20 19 2e JSR $2e19 ; (vdc_set_mode@proxy + 0)
4aa8 : 20 85 2c JSR $2c85 ; (vdc_cls.s0 + 0)
4aab : a9 04 __ LDA #$04
4aad : 8d 06 d5 STA $d506 
4ab0 : 20 2a 2b JSR $2b2a ; (exit@proxy + 0)
.s1001:
4ab3 : 18 __ __ CLC
4ab4 : a5 23 __ LDA SP + 0 
4ab6 : 69 06 __ ADC #$06
4ab8 : 85 23 __ STA SP + 0 
4aba : 90 02 __ BCC $4abe ; (prg_exit.s1001 + 11)
4abc : e6 24 __ INC SP + 1 
4abe : 60 __ __ RTS
--------------------------------------------------------------------
4abf : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
4acf : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
error_message: ; error_message()->void
.s1000:
4ad2 : 38 __ __ SEC
4ad3 : a5 23 __ LDA SP + 0 
4ad5 : e9 08 __ SBC #$08
4ad7 : 85 23 __ STA SP + 0 
4ad9 : b0 02 __ BCS $4add ; (error_message.s0 + 0)
4adb : c6 24 __ DEC SP + 1 
.s0:
4add : a9 a3 __ LDA #$a3
4adf : a0 02 __ LDY #$02
4ae1 : 91 23 __ STA (SP + 0),y 
4ae3 : a9 52 __ LDA #$52
4ae5 : c8 __ __ INY
4ae6 : 91 23 __ STA (SP + 0),y 
4ae8 : a9 3f __ LDA #$3f
4aea : c8 __ __ INY
4aeb : 91 23 __ STA (SP + 0),y 
4aed : a9 4b __ LDA #$4b
4aef : c8 __ __ INY
4af0 : 91 23 __ STA (SP + 0),y 
4af2 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
4af5 : a9 ad __ LDA #$ad
4af7 : a0 02 __ LDY #$02
4af9 : 91 23 __ STA (SP + 0),y 
4afb : a9 52 __ LDA #$52
4afd : c8 __ __ INY
4afe : 91 23 __ STA (SP + 0),y 
4b00 : a9 4d __ LDA #$4d
4b02 : c8 __ __ INY
4b03 : 91 23 __ STA (SP + 0),y 
4b05 : a9 4b __ LDA #$4b
4b07 : c8 __ __ INY
4b08 : 91 23 __ STA (SP + 0),y 
4b0a : ad ef 51 LDA $51ef ; (krnio_pstatus + 1)
4b0d : c8 __ __ INY
4b0e : 91 23 __ STA (SP + 0),y 
4b10 : a9 00 __ LDA #$00
4b12 : c8 __ __ INY
4b13 : 91 23 __ STA (SP + 0),y 
4b15 : 20 c5 33 JSR $33c5 ; (sprintf.s0 + 0)
4b18 : a9 a3 __ LDA #$a3
4b1a : a0 02 __ LDY #$02
4b1c : 91 23 __ STA (SP + 0),y 
4b1e : a9 52 __ LDA #$52
4b20 : c8 __ __ INY
4b21 : 91 23 __ STA (SP + 0),y 
4b23 : a9 3f __ LDA #$3f
4b25 : c8 __ __ INY
4b26 : 91 23 __ STA (SP + 0),y 
4b28 : a9 4b __ LDA #$4b
4b2a : c8 __ __ INY
4b2b : 91 23 __ STA (SP + 0),y 
4b2d : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
4b30 : 20 7a 4a JSR $4a7a ; (prg_exit.s1000 + 0)
.s1001:
4b33 : 18 __ __ CLC
4b34 : a5 23 __ LDA SP + 0 
4b36 : 69 08 __ ADC #$08
4b38 : 85 23 __ STA SP + 0 
4b3a : 90 02 __ BCC $4b3e ; (error_message.s1001 + 11)
4b3c : e6 24 __ INC SP + 1 
4b3e : 60 __ __ RTS
--------------------------------------------------------------------
4b3f : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 0a 0d 00       : fILE ERROR!...
--------------------------------------------------------------------
4b4d : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 0a 0d : eRROR NR.: %2x..
4b5d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4b5e : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 50 52 4f 4a 45 43 54 20 : lOADING PROJECT 
4b6e : __ __ __ BYT 4d 45 54 41 20 44 41 54 41 2e 00                : META DATA..
--------------------------------------------------------------------
too_big: ; too_big()->void
.s1000:
4b79 : 38 __ __ SEC
4b7a : a5 23 __ LDA SP + 0 
4b7c : e9 06 __ SBC #$06
4b7e : 85 23 __ STA SP + 0 
4b80 : b0 02 __ BCS $4b84 ; (too_big.s0 + 0)
4b82 : c6 24 __ DEC SP + 1 
.s0:
4b84 : a9 a3 __ LDA #$a3
4b86 : a0 02 __ LDY #$02
4b88 : 91 23 __ STA (SP + 0),y 
4b8a : a9 52 __ LDA #$52
4b8c : c8 __ __ INY
4b8d : 91 23 __ STA (SP + 0),y 
4b8f : a9 ab __ LDA #$ab
4b91 : c8 __ __ INY
4b92 : 91 23 __ STA (SP + 0),y 
4b94 : a9 4b __ LDA #$4b
4b96 : c8 __ __ INY
4b97 : 91 23 __ STA (SP + 0),y 
4b99 : 20 4c 40 JSR $404c ; (vdcwin_printline.s1000 + 0)
4b9c : 20 7a 4a JSR $4a7a ; (prg_exit.s1000 + 0)
.s1001:
4b9f : 18 __ __ CLC
4ba0 : a5 23 __ LDA SP + 0 
4ba2 : 69 06 __ ADC #$06
4ba4 : 85 23 __ STA SP + 0 
4ba6 : 90 02 __ BCC $4baa ; (too_big.s1001 + 11)
4ba8 : e6 24 __ INC SP + 1 
4baa : 60 __ __ RTS
--------------------------------------------------------------------
4bab : __ __ __ BYT 70 52 4f 4a 45 43 54 20 54 4f 20 42 49 47 2e 00 : pROJECT TO BIG..
--------------------------------------------------------------------
4bbb : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 56 49 45 57 45 52 20 43 : lOADING VIEWER C
4bcb : __ __ __ BYT 4f 44 45 20 54 4f 20 41 44 44 52 45 53 53 20 25 : ODE TO ADDRESS %
4bdb : __ __ __ BYT 34 58 2e 00                                     : 4X..
--------------------------------------------------------------------
4bdf : __ __ __ BYT 56 44 43 53 45 32 50 52 47 56 57 43 00          : VDCSE2PRGVWC.
--------------------------------------------------------------------
4bec : __ __ __ BYT 25 53 2e 53 43 52 4e 00                         : %S.SCRN.
--------------------------------------------------------------------
4bf4 : __ __ __ BYT 25 53 2e 43 48 52 53 00                         : %S.CHRS.
--------------------------------------------------------------------
giocharmap:
4bfc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
mc_default:
4bfd : __ __ __ BYT 8d                                              : .
--------------------------------------------------------------------
mc_menupopup:
4bfe : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
mc_pd_normal:
4bff : __ __ __ BYT c6                                              : .
--------------------------------------------------------------------
4c00 : __ __ __ BYT 63 4f 50 59 20 56 49 45 57 45 52 20 44 41 54 41 : cOPY VIEWER DATA
4c10 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c20 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c21 : __ __ __ BYT 6c 4f 41 44 20 53 43 52 45 45 4e 20 44 41 54 41 : lOAD SCREEN DATA
4c31 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c41 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c42 : __ __ __ BYT 6c 4f 41 44 20 53 54 44 20 43 48 41 52 53 45 54 : lOAD STD CHARSET
4c52 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c62 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c63 : __ __ __ BYT 6c 4f 41 44 20 41 4c 54 20 43 48 41 52 53 45 54 : lOAD ALT CHARSET
4c73 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c83 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c84 : __ __ __ BYT 25 53 2e 43 48 52 41 00                         : %S.CHRA.
--------------------------------------------------------------------
4c8c : __ __ __ BYT 73 41 56 49 4e 47 20 25 55 20 42 59 54 45 53 20 : sAVING %U BYTES 
4c9c : __ __ __ BYT 54 4f 20 25 53 2e 00                            : TO %S..
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
4ca3 : a9 00 __ LDA #$00
4ca5 : a6 0d __ LDX P0 
4ca7 : a0 00 __ LDY #$00
4ca9 : 20 ba ff JSR $ffba 
4cac : a9 0e __ LDA #$0e
4cae : a6 10 __ LDX P3 
4cb0 : a4 11 __ LDY P4 
4cb2 : 20 d8 ff JSR $ffd8 
4cb5 : a9 00 __ LDA #$00
4cb7 : b0 02 __ BCS $4cbb ; (krnio_save.s0 + 24)
4cb9 : a9 01 __ LDA #$01
4cbb : 85 1b __ STA ACCU + 0 
.s1001:
4cbd : a5 1b __ LDA ACCU + 0 
4cbf : 60 __ __ RTS
--------------------------------------------------------------------
4cc0 : __ __ __ BYT 66 49 4e 49 53 48 45 44 21 20 70 52 45 53 53 20 : fINISHED! pRESS 
4cd0 : __ __ __ BYT 4b 45 59 20 54 4f 20 45 58 49 54 2e 00          : KEY TO EXIT..
--------------------------------------------------------------------
mul16: ; mul16
4cdd : a0 00 __ LDY #$00
4cdf : 84 06 __ STY WORK + 3 
4ce1 : a5 03 __ LDA WORK + 0 
4ce3 : a6 04 __ LDX WORK + 1 
4ce5 : f0 1c __ BEQ $4d03 ; (mul16 + 38)
4ce7 : 38 __ __ SEC
4ce8 : 6a __ __ ROR
4ce9 : 90 0d __ BCC $4cf8 ; (mul16 + 27)
4ceb : aa __ __ TAX
4cec : 18 __ __ CLC
4ced : 98 __ __ TYA
4cee : 65 1b __ ADC ACCU + 0 
4cf0 : a8 __ __ TAY
4cf1 : a5 06 __ LDA WORK + 3 
4cf3 : 65 1c __ ADC ACCU + 1 
4cf5 : 85 06 __ STA WORK + 3 
4cf7 : 8a __ __ TXA
4cf8 : 06 1b __ ASL ACCU + 0 
4cfa : 26 1c __ ROL ACCU + 1 
4cfc : 4a __ __ LSR
4cfd : 90 f9 __ BCC $4cf8 ; (mul16 + 27)
4cff : d0 ea __ BNE $4ceb ; (mul16 + 14)
4d01 : a5 04 __ LDA WORK + 1 
4d03 : 4a __ __ LSR
4d04 : 90 0d __ BCC $4d13 ; (mul16 + 54)
4d06 : aa __ __ TAX
4d07 : 18 __ __ CLC
4d08 : 98 __ __ TYA
4d09 : 65 1b __ ADC ACCU + 0 
4d0b : a8 __ __ TAY
4d0c : a5 06 __ LDA WORK + 3 
4d0e : 65 1c __ ADC ACCU + 1 
4d10 : 85 06 __ STA WORK + 3 
4d12 : 8a __ __ TXA
4d13 : 06 1b __ ASL ACCU + 0 
4d15 : 26 1c __ ROL ACCU + 1 
4d17 : 4a __ __ LSR
4d18 : b0 ec __ BCS $4d06 ; (mul16 + 41)
4d1a : d0 f7 __ BNE $4d13 ; (mul16 + 54)
4d1c : 84 05 __ STY WORK + 2 
4d1e : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4d1f : a5 1c __ LDA ACCU + 1 
4d21 : d0 31 __ BNE $4d54 ; (divmod + 53)
4d23 : a5 04 __ LDA WORK + 1 
4d25 : d0 1e __ BNE $4d45 ; (divmod + 38)
4d27 : 85 06 __ STA WORK + 3 
4d29 : a2 04 __ LDX #$04
4d2b : 06 1b __ ASL ACCU + 0 
4d2d : 2a __ __ ROL
4d2e : c5 03 __ CMP WORK + 0 
4d30 : 90 02 __ BCC $4d34 ; (divmod + 21)
4d32 : e5 03 __ SBC WORK + 0 
4d34 : 26 1b __ ROL ACCU + 0 
4d36 : 2a __ __ ROL
4d37 : c5 03 __ CMP WORK + 0 
4d39 : 90 02 __ BCC $4d3d ; (divmod + 30)
4d3b : e5 03 __ SBC WORK + 0 
4d3d : 26 1b __ ROL ACCU + 0 
4d3f : ca __ __ DEX
4d40 : d0 eb __ BNE $4d2d ; (divmod + 14)
4d42 : 85 05 __ STA WORK + 2 
4d44 : 60 __ __ RTS
4d45 : a5 1b __ LDA ACCU + 0 
4d47 : 85 05 __ STA WORK + 2 
4d49 : a5 1c __ LDA ACCU + 1 
4d4b : 85 06 __ STA WORK + 3 
4d4d : a9 00 __ LDA #$00
4d4f : 85 1b __ STA ACCU + 0 
4d51 : 85 1c __ STA ACCU + 1 
4d53 : 60 __ __ RTS
4d54 : a5 04 __ LDA WORK + 1 
4d56 : d0 1f __ BNE $4d77 ; (divmod + 88)
4d58 : a5 03 __ LDA WORK + 0 
4d5a : 30 1b __ BMI $4d77 ; (divmod + 88)
4d5c : a9 00 __ LDA #$00
4d5e : 85 06 __ STA WORK + 3 
4d60 : a2 10 __ LDX #$10
4d62 : 06 1b __ ASL ACCU + 0 
4d64 : 26 1c __ ROL ACCU + 1 
4d66 : 2a __ __ ROL
4d67 : c5 03 __ CMP WORK + 0 
4d69 : 90 02 __ BCC $4d6d ; (divmod + 78)
4d6b : e5 03 __ SBC WORK + 0 
4d6d : 26 1b __ ROL ACCU + 0 
4d6f : 26 1c __ ROL ACCU + 1 
4d71 : ca __ __ DEX
4d72 : d0 f2 __ BNE $4d66 ; (divmod + 71)
4d74 : 85 05 __ STA WORK + 2 
4d76 : 60 __ __ RTS
4d77 : a9 00 __ LDA #$00
4d79 : 85 05 __ STA WORK + 2 
4d7b : 85 06 __ STA WORK + 3 
4d7d : 84 02 __ STY $02 
4d7f : a0 10 __ LDY #$10
4d81 : 18 __ __ CLC
4d82 : 26 1b __ ROL ACCU + 0 
4d84 : 26 1c __ ROL ACCU + 1 
4d86 : 26 05 __ ROL WORK + 2 
4d88 : 26 06 __ ROL WORK + 3 
4d8a : 38 __ __ SEC
4d8b : a5 05 __ LDA WORK + 2 
4d8d : e5 03 __ SBC WORK + 0 
4d8f : aa __ __ TAX
4d90 : a5 06 __ LDA WORK + 3 
4d92 : e5 04 __ SBC WORK + 1 
4d94 : 90 04 __ BCC $4d9a ; (divmod + 123)
4d96 : 86 05 __ STX WORK + 2 
4d98 : 85 06 __ STA WORK + 3 
4d9a : 88 __ __ DEY
4d9b : d0 e5 __ BNE $4d82 ; (divmod + 99)
4d9d : 26 1b __ ROL ACCU + 0 
4d9f : 26 1c __ ROL ACCU + 1 
4da1 : a4 02 __ LDY $02 
4da3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
4da4 : 84 02 __ STY $02 
4da6 : a0 20 __ LDY #$20
4da8 : a9 00 __ LDA #$00
4daa : 85 07 __ STA WORK + 4 
4dac : 85 08 __ STA WORK + 5 
4dae : 85 09 __ STA WORK + 6 
4db0 : 85 0a __ STA WORK + 7 
4db2 : a5 05 __ LDA WORK + 2 
4db4 : 05 06 __ ORA WORK + 3 
4db6 : d0 78 __ BNE $4e30 ; (divmod32 + 140)
4db8 : a5 04 __ LDA WORK + 1 
4dba : d0 27 __ BNE $4de3 ; (divmod32 + 63)
4dbc : 18 __ __ CLC
4dbd : 26 1b __ ROL ACCU + 0 
4dbf : 26 1c __ ROL ACCU + 1 
4dc1 : 26 1d __ ROL ACCU + 2 
4dc3 : 26 1e __ ROL ACCU + 3 
4dc5 : 2a __ __ ROL
4dc6 : 90 05 __ BCC $4dcd ; (divmod32 + 41)
4dc8 : e5 03 __ SBC WORK + 0 
4dca : 38 __ __ SEC
4dcb : b0 06 __ BCS $4dd3 ; (divmod32 + 47)
4dcd : c5 03 __ CMP WORK + 0 
4dcf : 90 02 __ BCC $4dd3 ; (divmod32 + 47)
4dd1 : e5 03 __ SBC WORK + 0 
4dd3 : 88 __ __ DEY
4dd4 : d0 e7 __ BNE $4dbd ; (divmod32 + 25)
4dd6 : 85 07 __ STA WORK + 4 
4dd8 : 26 1b __ ROL ACCU + 0 
4dda : 26 1c __ ROL ACCU + 1 
4ddc : 26 1d __ ROL ACCU + 2 
4dde : 26 1e __ ROL ACCU + 3 
4de0 : a4 02 __ LDY $02 
4de2 : 60 __ __ RTS
4de3 : a5 1e __ LDA ACCU + 3 
4de5 : d0 10 __ BNE $4df7 ; (divmod32 + 83)
4de7 : a6 1d __ LDX ACCU + 2 
4de9 : 86 1e __ STX ACCU + 3 
4deb : a6 1c __ LDX ACCU + 1 
4ded : 86 1d __ STX ACCU + 2 
4def : a6 1b __ LDX ACCU + 0 
4df1 : 86 1c __ STX ACCU + 1 
4df3 : 85 1b __ STA ACCU + 0 
4df5 : a0 18 __ LDY #$18
4df7 : 18 __ __ CLC
4df8 : 26 1b __ ROL ACCU + 0 
4dfa : 26 1c __ ROL ACCU + 1 
4dfc : 26 1d __ ROL ACCU + 2 
4dfe : 26 1e __ ROL ACCU + 3 
4e00 : 26 07 __ ROL WORK + 4 
4e02 : 26 08 __ ROL WORK + 5 
4e04 : 90 0c __ BCC $4e12 ; (divmod32 + 110)
4e06 : a5 07 __ LDA WORK + 4 
4e08 : e5 03 __ SBC WORK + 0 
4e0a : aa __ __ TAX
4e0b : a5 08 __ LDA WORK + 5 
4e0d : e5 04 __ SBC WORK + 1 
4e0f : 38 __ __ SEC
4e10 : b0 0c __ BCS $4e1e ; (divmod32 + 122)
4e12 : 38 __ __ SEC
4e13 : a5 07 __ LDA WORK + 4 
4e15 : e5 03 __ SBC WORK + 0 
4e17 : aa __ __ TAX
4e18 : a5 08 __ LDA WORK + 5 
4e1a : e5 04 __ SBC WORK + 1 
4e1c : 90 04 __ BCC $4e22 ; (divmod32 + 126)
4e1e : 86 07 __ STX WORK + 4 
4e20 : 85 08 __ STA WORK + 5 
4e22 : 88 __ __ DEY
4e23 : d0 d3 __ BNE $4df8 ; (divmod32 + 84)
4e25 : 26 1b __ ROL ACCU + 0 
4e27 : 26 1c __ ROL ACCU + 1 
4e29 : 26 1d __ ROL ACCU + 2 
4e2b : 26 1e __ ROL ACCU + 3 
4e2d : a4 02 __ LDY $02 
4e2f : 60 __ __ RTS
4e30 : a0 10 __ LDY #$10
4e32 : a5 1e __ LDA ACCU + 3 
4e34 : 85 08 __ STA WORK + 5 
4e36 : a5 1d __ LDA ACCU + 2 
4e38 : 85 07 __ STA WORK + 4 
4e3a : a9 00 __ LDA #$00
4e3c : 85 1d __ STA ACCU + 2 
4e3e : 85 1e __ STA ACCU + 3 
4e40 : 18 __ __ CLC
4e41 : 26 1b __ ROL ACCU + 0 
4e43 : 26 1c __ ROL ACCU + 1 
4e45 : 26 07 __ ROL WORK + 4 
4e47 : 26 08 __ ROL WORK + 5 
4e49 : 26 09 __ ROL WORK + 6 
4e4b : 26 0a __ ROL WORK + 7 
4e4d : a5 07 __ LDA WORK + 4 
4e4f : c5 03 __ CMP WORK + 0 
4e51 : a5 08 __ LDA WORK + 5 
4e53 : e5 04 __ SBC WORK + 1 
4e55 : a5 09 __ LDA WORK + 6 
4e57 : e5 05 __ SBC WORK + 2 
4e59 : a5 0a __ LDA WORK + 7 
4e5b : e5 06 __ SBC WORK + 3 
4e5d : 90 18 __ BCC $4e77 ; (divmod32 + 211)
4e5f : a5 07 __ LDA WORK + 4 
4e61 : e5 03 __ SBC WORK + 0 
4e63 : 85 07 __ STA WORK + 4 
4e65 : a5 08 __ LDA WORK + 5 
4e67 : e5 04 __ SBC WORK + 1 
4e69 : 85 08 __ STA WORK + 5 
4e6b : a5 09 __ LDA WORK + 6 
4e6d : e5 05 __ SBC WORK + 2 
4e6f : 85 09 __ STA WORK + 6 
4e71 : a5 0a __ LDA WORK + 7 
4e73 : e5 06 __ SBC WORK + 3 
4e75 : 85 0a __ STA WORK + 7 
4e77 : 88 __ __ DEY
4e78 : d0 c7 __ BNE $4e41 ; (divmod32 + 157)
4e7a : 26 1b __ ROL ACCU + 0 
4e7c : 26 1c __ ROL ACCU + 1 
4e7e : a4 02 __ LDY $02 
4e80 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
4e81 : 18 __ __ CLC
4e82 : a5 1b __ LDA ACCU + 0 
4e84 : 69 06 __ ADC #$06
4e86 : 85 03 __ STA WORK + 0 
4e88 : a5 1c __ LDA ACCU + 1 
4e8a : 69 00 __ ADC #$00
4e8c : 85 04 __ STA WORK + 1 
4e8e : ad e6 53 LDA $53e6 ; (HeapNode + 2)
4e91 : d0 1f __ BNE $4eb2 ; (malloc + 49)
4e93 : a9 00 __ LDA #$00
4e95 : 8d a8 54 STA $54a8 
4e98 : 8d a9 54 STA $54a9 
4e9b : ee e6 53 INC $53e6 ; (HeapNode + 2)
4e9e : a9 a8 __ LDA #$a8
4ea0 : 8d e4 53 STA $53e4 ; (HeapNode + 0)
4ea3 : a9 54 __ LDA #$54
4ea5 : 8d e5 53 STA $53e5 ; (HeapNode + 1)
4ea8 : a9 00 __ LDA #$00
4eaa : 8d aa 54 STA $54aa 
4ead : a9 b0 __ LDA #$b0
4eaf : 8d ab 54 STA $54ab 
4eb2 : a9 e4 __ LDA #$e4
4eb4 : a2 53 __ LDX #$53
4eb6 : 85 1d __ STA ACCU + 2 
4eb8 : 86 1e __ STX ACCU + 3 
4eba : 18 __ __ CLC
4ebb : a0 00 __ LDY #$00
4ebd : b1 1d __ LDA (ACCU + 2),y 
4ebf : 85 1b __ STA ACCU + 0 
4ec1 : 65 03 __ ADC WORK + 0 
4ec3 : 85 05 __ STA WORK + 2 
4ec5 : c8 __ __ INY
4ec6 : b1 1d __ LDA (ACCU + 2),y 
4ec8 : 85 1c __ STA ACCU + 1 
4eca : f0 18 __ BEQ $4ee4 ; (malloc + 99)
4ecc : 65 04 __ ADC WORK + 1 
4ece : 85 06 __ STA WORK + 3 
4ed0 : a0 02 __ LDY #$02
4ed2 : b1 1b __ LDA (ACCU + 0),y 
4ed4 : c5 05 __ CMP WORK + 2 
4ed6 : c8 __ __ INY
4ed7 : b1 1b __ LDA (ACCU + 0),y 
4ed9 : e5 06 __ SBC WORK + 3 
4edb : b0 09 __ BCS $4ee6 ; (malloc + 101)
4edd : a5 1b __ LDA ACCU + 0 
4edf : a6 1c __ LDX ACCU + 1 
4ee1 : 4c b6 4e JMP $4eb6 ; (malloc + 53)
4ee4 : 02 __ __ INV
4ee5 : 60 __ __ RTS
4ee6 : 18 __ __ CLC
4ee7 : a5 05 __ LDA WORK + 2 
4ee9 : 69 07 __ ADC #$07
4eeb : 29 f8 __ AND #$f8
4eed : 85 07 __ STA WORK + 4 
4eef : a5 06 __ LDA WORK + 3 
4ef1 : 69 00 __ ADC #$00
4ef3 : 85 08 __ STA WORK + 5 
4ef5 : a0 02 __ LDY #$02
4ef7 : a5 07 __ LDA WORK + 4 
4ef9 : d1 1b __ CMP (ACCU + 0),y 
4efb : d0 15 __ BNE $4f12 ; (malloc + 145)
4efd : c8 __ __ INY
4efe : a5 08 __ LDA WORK + 5 
4f00 : d1 1b __ CMP (ACCU + 0),y 
4f02 : d0 0e __ BNE $4f12 ; (malloc + 145)
4f04 : a0 00 __ LDY #$00
4f06 : b1 1b __ LDA (ACCU + 0),y 
4f08 : 91 1d __ STA (ACCU + 2),y 
4f0a : c8 __ __ INY
4f0b : b1 1b __ LDA (ACCU + 0),y 
4f0d : 91 1d __ STA (ACCU + 2),y 
4f0f : 4c 2f 4f JMP $4f2f ; (malloc + 174)
4f12 : a0 00 __ LDY #$00
4f14 : b1 1b __ LDA (ACCU + 0),y 
4f16 : 91 07 __ STA (WORK + 4),y 
4f18 : a5 07 __ LDA WORK + 4 
4f1a : 91 1d __ STA (ACCU + 2),y 
4f1c : c8 __ __ INY
4f1d : b1 1b __ LDA (ACCU + 0),y 
4f1f : 91 07 __ STA (WORK + 4),y 
4f21 : a5 08 __ LDA WORK + 5 
4f23 : 91 1d __ STA (ACCU + 2),y 
4f25 : c8 __ __ INY
4f26 : b1 1b __ LDA (ACCU + 0),y 
4f28 : 91 07 __ STA (WORK + 4),y 
4f2a : c8 __ __ INY
4f2b : b1 1b __ LDA (ACCU + 0),y 
4f2d : 91 07 __ STA (WORK + 4),y 
4f2f : a0 00 __ LDY #$00
4f31 : a5 05 __ LDA WORK + 2 
4f33 : 91 1b __ STA (ACCU + 0),y 
4f35 : c8 __ __ INY
4f36 : a5 06 __ LDA WORK + 3 
4f38 : 91 1b __ STA (ACCU + 0),y 
4f3a : a0 02 __ LDY #$02
4f3c : a9 bd __ LDA #$bd
4f3e : 91 1b __ STA (ACCU + 0),y 
4f40 : c8 __ __ INY
4f41 : 91 1b __ STA (ACCU + 0),y 
4f43 : 38 __ __ SEC
4f44 : a5 05 __ LDA WORK + 2 
4f46 : e9 02 __ SBC #$02
4f48 : 85 05 __ STA WORK + 2 
4f4a : b0 02 __ BCS $4f4e ; (malloc + 205)
4f4c : c6 06 __ DEC WORK + 3 
4f4e : a9 be __ LDA #$be
4f50 : a0 00 __ LDY #$00
4f52 : 91 05 __ STA (WORK + 2),y 
4f54 : c8 __ __ INY
4f55 : 91 05 __ STA (WORK + 2),y 
4f57 : a5 1b __ LDA ACCU + 0 
4f59 : 09 04 __ ORA #$04
4f5b : 85 1b __ STA ACCU + 0 
4f5d : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
4f5e : a5 1b __ LDA ACCU + 0 
4f60 : 05 1c __ ORA ACCU + 1 
4f62 : d0 01 __ BNE $4f65 ; (free + 7)
4f64 : 60 __ __ RTS
4f65 : a5 1b __ LDA ACCU + 0 
4f67 : 29 07 __ AND #$07
4f69 : c9 04 __ CMP #$04
4f6b : d0 49 __ BNE $4fb6 ; (free + 88)
4f6d : a5 1b __ LDA ACCU + 0 
4f6f : 29 f8 __ AND #$f8
4f71 : 85 1b __ STA ACCU + 0 
4f73 : a0 02 __ LDY #$02
4f75 : b1 1b __ LDA (ACCU + 0),y 
4f77 : c9 bd __ CMP #$bd
4f79 : d0 3b __ BNE $4fb6 ; (free + 88)
4f7b : c8 __ __ INY
4f7c : b1 1b __ LDA (ACCU + 0),y 
4f7e : c9 bd __ CMP #$bd
4f80 : d0 34 __ BNE $4fb6 ; (free + 88)
4f82 : a0 00 __ LDY #$00
4f84 : 38 __ __ SEC
4f85 : b1 1b __ LDA (ACCU + 0),y 
4f87 : e9 02 __ SBC #$02
4f89 : 85 03 __ STA WORK + 0 
4f8b : c8 __ __ INY
4f8c : b1 1b __ LDA (ACCU + 0),y 
4f8e : e9 00 __ SBC #$00
4f90 : 85 04 __ STA WORK + 1 
4f92 : a0 00 __ LDY #$00
4f94 : b1 03 __ LDA (WORK + 0),y 
4f96 : c9 be __ CMP #$be
4f98 : d0 1c __ BNE $4fb6 ; (free + 88)
4f9a : c8 __ __ INY
4f9b : b1 03 __ LDA (WORK + 0),y 
4f9d : c9 be __ CMP #$be
4f9f : d0 15 __ BNE $4fb6 ; (free + 88)
4fa1 : a5 1b __ LDA ACCU + 0 
4fa3 : 05 1c __ ORA ACCU + 1 
4fa5 : d0 01 __ BNE $4fa8 ; (free + 74)
4fa7 : 60 __ __ RTS
4fa8 : a5 1c __ LDA ACCU + 1 
4faa : a6 1b __ LDX ACCU + 0 
4fac : c9 54 __ CMP #$54
4fae : 90 06 __ BCC $4fb6 ; (free + 88)
4fb0 : d0 05 __ BNE $4fb7 ; (free + 89)
4fb2 : e0 a8 __ CPX #$a8
4fb4 : b0 01 __ BCS $4fb7 ; (free + 89)
4fb6 : 02 __ __ INV
4fb7 : c9 b0 __ CMP #$b0
4fb9 : 90 06 __ BCC $4fc1 ; (free + 99)
4fbb : d0 f9 __ BNE $4fb6 ; (free + 88)
4fbd : e0 00 __ CPX #$00
4fbf : b0 f5 __ BCS $4fb6 ; (free + 88)
4fc1 : a0 02 __ LDY #$02
4fc3 : a9 bf __ LDA #$bf
4fc5 : 91 1b __ STA (ACCU + 0),y 
4fc7 : c8 __ __ INY
4fc8 : 91 1b __ STA (ACCU + 0),y 
4fca : 18 __ __ CLC
4fcb : a0 00 __ LDY #$00
4fcd : b1 1b __ LDA (ACCU + 0),y 
4fcf : 69 07 __ ADC #$07
4fd1 : 29 f8 __ AND #$f8
4fd3 : 85 1d __ STA ACCU + 2 
4fd5 : c8 __ __ INY
4fd6 : b1 1b __ LDA (ACCU + 0),y 
4fd8 : 69 00 __ ADC #$00
4fda : 85 1e __ STA ACCU + 3 
4fdc : a9 e4 __ LDA #$e4
4fde : a2 53 __ LDX #$53
4fe0 : 85 05 __ STA WORK + 2 
4fe2 : 86 06 __ STX WORK + 3 
4fe4 : a0 01 __ LDY #$01
4fe6 : b1 05 __ LDA (WORK + 2),y 
4fe8 : f0 28 __ BEQ $5012 ; (free + 180)
4fea : aa __ __ TAX
4feb : 88 __ __ DEY
4fec : b1 05 __ LDA (WORK + 2),y 
4fee : e4 1e __ CPX ACCU + 3 
4ff0 : 90 ee __ BCC $4fe0 ; (free + 130)
4ff2 : d0 1e __ BNE $5012 ; (free + 180)
4ff4 : c5 1d __ CMP ACCU + 2 
4ff6 : 90 e8 __ BCC $4fe0 ; (free + 130)
4ff8 : d0 18 __ BNE $5012 ; (free + 180)
4ffa : a0 00 __ LDY #$00
4ffc : b1 1d __ LDA (ACCU + 2),y 
4ffe : 91 1b __ STA (ACCU + 0),y 
5000 : c8 __ __ INY
5001 : b1 1d __ LDA (ACCU + 2),y 
5003 : 91 1b __ STA (ACCU + 0),y 
5005 : c8 __ __ INY
5006 : b1 1d __ LDA (ACCU + 2),y 
5008 : 91 1b __ STA (ACCU + 0),y 
500a : c8 __ __ INY
500b : b1 1d __ LDA (ACCU + 2),y 
500d : 91 1b __ STA (ACCU + 0),y 
500f : 4c 27 50 JMP $5027 ; (free + 201)
5012 : a0 00 __ LDY #$00
5014 : b1 05 __ LDA (WORK + 2),y 
5016 : 91 1b __ STA (ACCU + 0),y 
5018 : c8 __ __ INY
5019 : b1 05 __ LDA (WORK + 2),y 
501b : 91 1b __ STA (ACCU + 0),y 
501d : c8 __ __ INY
501e : a5 1d __ LDA ACCU + 2 
5020 : 91 1b __ STA (ACCU + 0),y 
5022 : c8 __ __ INY
5023 : a5 1e __ LDA ACCU + 3 
5025 : 91 1b __ STA (ACCU + 0),y 
5027 : a0 02 __ LDY #$02
5029 : b1 05 __ LDA (WORK + 2),y 
502b : c5 1b __ CMP ACCU + 0 
502d : d0 1d __ BNE $504c ; (free + 238)
502f : c8 __ __ INY
5030 : b1 05 __ LDA (WORK + 2),y 
5032 : c5 1c __ CMP ACCU + 1 
5034 : d0 16 __ BNE $504c ; (free + 238)
5036 : a0 00 __ LDY #$00
5038 : b1 1b __ LDA (ACCU + 0),y 
503a : 91 05 __ STA (WORK + 2),y 
503c : c8 __ __ INY
503d : b1 1b __ LDA (ACCU + 0),y 
503f : 91 05 __ STA (WORK + 2),y 
5041 : c8 __ __ INY
5042 : b1 1b __ LDA (ACCU + 0),y 
5044 : 91 05 __ STA (WORK + 2),y 
5046 : c8 __ __ INY
5047 : b1 1b __ LDA (ACCU + 0),y 
5049 : 91 05 __ STA (WORK + 2),y 
504b : 60 __ __ RTS
504c : a0 00 __ LDY #$00
504e : a5 1b __ LDA ACCU + 0 
5050 : 91 05 __ STA (WORK + 2),y 
5052 : c8 __ __ INY
5053 : a5 1c __ LDA ACCU + 1 
5055 : 91 05 __ STA (WORK + 2),y 
5057 : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
5058 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
505e : a9 0b __ LDA #$0b
5060 : 85 11 __ STA P4 
5062 : a9 05 __ LDA #$05
5064 : 85 12 __ STA P5 
5066 : a9 ad __ LDA #$ad
5068 : 85 13 __ STA P6 
506a : a9 52 __ LDA #$52
506c : 85 14 __ STA P7 
506e : 4c 09 32 JMP $3209 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
5071 : a9 ad __ LDA #$ad
5073 : 85 13 __ STA P6 
5075 : a9 52 __ LDA #$52
5077 : 85 14 __ STA P7 
5079 : 4c 09 32 JMP $3209 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
507c : ad fe 4b LDA $4bfe ; (mc_menupopup + 0)
507f : 85 10 __ STA P3 
5081 : 4c cb 32 JMP $32cb ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
5084 : a9 20 __ LDA #$20
5086 : 85 11 __ STA P4 
5088 : a9 50 __ LDA #$50
508a : 85 12 __ STA P5 
508c : 4c 99 2c JMP $2c99 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
508f : a9 0a __ LDA #$0a
5091 : 85 0f __ STA P2 
5093 : a9 20 __ LDA #$20
5095 : 85 11 __ STA P4 
5097 : a9 3c __ LDA #$3c
5099 : 85 12 __ STA P5 
509b : 4c 99 2c JMP $2c99 ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
509e : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 85 89 86 8a 87 8b : ................
50ae : __ __ __ BYT 88 8c 0a 8c                                     : ....
--------------------------------------------------------------------
progressRev:
50b2 : __ __ __ BYT 00 00 01 01                                     : ....
--------------------------------------------------------------------
p2smap:
50b6 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
progressBar:
50be : __ __ __ BYT a5 a1 a7 20                                     : ... 
--------------------------------------------------------------------
mc_pd_select:
50c2 : __ __ __ BYT cd                                              : .
--------------------------------------------------------------------
reg_types:
50c3 : __ __ __ BYT fc 42 fb 45 ff 45 03 46 07 46                   : .B.E.E.F.F
--------------------------------------------------------------------
oth_types:
50cd : __ __ __ BYT 0b 46 0f 46 13 46 17 46 1b 46 1f 46             : .F.F.F.F.F.F
--------------------------------------------------------------------
value2hex:
50d9 : __ __ __ BYT 23 46                                           : #F
--------------------------------------------------------------------
filedest:
50db : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
50eb : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
charsetchanged:
50f0 : __ __ __ BSS	2
--------------------------------------------------------------------
view:
50f2 : __ __ __ BSS	14
--------------------------------------------------------------------
vdc_modes:
5100 : __ __ __ BYT 50 00 19 00 00 00 00 00 08 00 10 00 18 00 20 00 : P............. .
5110 : __ __ __ BYT 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 fc 09 : 0.@...&..... ...
5120 : __ __ __ BYT e7 24 7e ff 50 00 32 00 01 00 00 00 10 00 40 00 : .$~.P.2.......@.
5130 : __ __ __ BYT 50 00 20 00 30 00 60 00 7f 04 4d 05 00 06 32 07 : P. .0.`...M...2.
5140 : __ __ __ BYT 40 08 03 09 07 24 00 ff 50 00 46 00 01 00 00 00 : @....$..P.F.....
5150 : __ __ __ BYT 18 00 60 00 78 00 40 00 50 00 90 00 7f 04 4d 05 : ..`.x.@.P.....M.
5160 : __ __ __ BYT 00 06 46 07 48 08 03 09 07 24 00 ff 50 00 19 00 : ..F.H....$..P...
5170 : __ __ __ BYT 00 00 00 00 08 00 10 00 18 00 20 00 30 00 40 00 : .......... .0.@.
5180 : __ __ __ BYT 7e 04 20 05 e0 06 19 07 1d 08 fc 09 e7 24 f5 ff : ~. ..........$..
5190 : __ __ __ BYT 50 00 32 00 01 00 00 00 10 00 40 00 50 00 20 00 : P.2.......@.P. .
51a0 : __ __ __ BYT 30 00 60 00 7e 04 41 05 00 06 32 07 3b 08 03 09 : 0.`.~.A...2.;...
51b0 : __ __ __ BYT 07 24 00 ff 50 00 3c 00 01 00 00 00 18 00 60 00 : .$..P.<.......`.
51c0 : __ __ __ BYT 78 00 40 00 50 00 90 00 7e 04 41 05 00 06 3c 07 : x.@.P...~.A...<.
51d0 : __ __ __ BYT 3d 08 03 09 07 24 00 ff                         : =....$..
--------------------------------------------------------------------
filename:
51d8 : __ __ __ BSS	21
--------------------------------------------------------------------
bootdevice:
51ed : __ __ __ BSS	1
--------------------------------------------------------------------
krnio_pstatus:
51ee : __ __ __ BSS	16
--------------------------------------------------------------------
targetdevice:
51fe : __ __ __ BSS	1
--------------------------------------------------------------------
_cinfo:
5200 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 02 01 01 01 01 00 00 : ................
5210 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5220 : __ __ __ BYT 02 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 : .@@@@@@@@@@@@@@@
5230 : __ __ __ BYT 04 04 04 04 04 04 04 04 04 04 40 40 40 40 40 40 : ..........@@@@@@
5240 : __ __ __ BYT 40 30 30 30 30 30 30 10 10 10 10 10 10 10 10 10 : @000000.........
5250 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 10 40 40 40 40 40 : ...........@@@@@
5260 : __ __ __ BYT 40 28 28 28 28 28 28 08 08 08 08 08 08 08 08 08 : @((((((.........
5270 : __ __ __ BYT 08 08 08 08 08 08 08 08 08 08 08 40 40 40 40 00 : ...........@@@@.
--------------------------------------------------------------------
vdc_state:
5280 : __ __ __ BSS	25
--------------------------------------------------------------------
fullscreen:
5299 : __ __ __ BSS	10
--------------------------------------------------------------------
interface:
52a3 : __ __ __ BSS	10
--------------------------------------------------------------------
linebuffer:
52ad : __ __ __ BSS	81
--------------------------------------------------------------------
previous:
52fe : __ __ __ BSS	2
--------------------------------------------------------------------
multab:
5300 : __ __ __ BSS	144
--------------------------------------------------------------------
cwd:
5390 : __ __ __ BSS	33
--------------------------------------------------------------------
disk_id_buf:
53b1 : __ __ __ BSS	5
--------------------------------------------------------------------
current:
53b6 : __ __ __ BSS	2
--------------------------------------------------------------------
bad_type:
53b8 : __ __ __ BSS	4
--------------------------------------------------------------------
DOSstatus:
53bc : __ __ __ BSS	40
--------------------------------------------------------------------
HeapNode:
53e4 : __ __ __ BSS	4
--------------------------------------------------------------------
linebuffer2:
5400 : __ __ __ BSS	81
--------------------------------------------------------------------
buffer:
5451 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:0c00 : ad fe 51 LDA $51fe ; (targetdevice + 0)
01:0c03 : 85 0f __ STA P2 
01:0c05 : a9 01 __ LDA #$01
01:0c07 : 85 10 __ STA P3 
01:0c09 : a9 ad __ LDA #$ad
01:0c0b : 85 13 __ STA P6 
01:0c0d : a9 52 __ LDA #$52
01:0c0f : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:0c11 : a5 10 __ LDA P3 ; (bank + 0)
01:0c13 : 85 0d __ STA P0 
01:0c15 : 20 ba 2a JSR $2aba ; (krnio_setbnk@proxy + 0)
01:0c18 : a5 13 __ LDA P6 ; (fname + 0)
01:0c1a : 85 0d __ STA P0 
01:0c1c : a5 14 __ LDA P7 ; (fname + 1)
01:0c1e : 85 0e __ STA P1 
01:0c20 : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
01:0c23 : a9 01 __ LDA #$01
01:0c25 : a6 0f __ LDX P2 
01:0c27 : a0 00 __ LDY #$00
01:0c29 : 20 ba ff JSR $ffba 
01:0c2c : a9 00 __ LDA #$00
01:0c2e : a6 11 __ LDX P4 
01:0c30 : a4 12 __ LDY P5 
01:0c32 : 20 d5 ff JSR $ffd5 
01:0c35 : a9 00 __ LDA #$00
01:0c37 : b0 02 __ BCS $0c3b ; (bnk_load.s0 + 42)
01:0c39 : a9 01 __ LDA #$01
01:0c3b : 85 1b __ STA ACCU + 0 
01:0c3d : a9 00 __ LDA #$00
01:0c3f : 85 0d __ STA P0 
01:0c41 : 85 0e __ STA P1 
01:0c43 : 4c be 2a JMP $2abe ; (krnio_setbnk.s0 + 0)
--------------------------------------------------------------------
bnk_memcpy: ; bnk_memcpy(u8,u8*,u8,u8*,u16)->void
.s0:
01:0c46 : a9 de __ LDA #$de
01:0c48 : 85 1b __ STA ACCU + 0 
01:0c4a : a9 36 __ LDA #$36
01:0c4c : 85 1c __ STA ACCU + 1 
01:0c4e : ad 00 ff LDA $ff00 
01:0c51 : 85 1d __ STA ACCU + 2 
01:0c53 : a2 0e __ LDX #$0e
01:0c55 : a0 00 __ LDY #$00
.l1002:
01:0c57 : a9 0e __ LDA #$0e
01:0c59 : 8d 00 ff STA $ff00 
01:0c5c : b1 0f __ LDA (P2),y ; (sp + 0)
01:0c5e : 85 1e __ STA ACCU + 3 
01:0c60 : a9 7f __ LDA #$7f
01:0c62 : 8d 00 ff STA $ff00 
01:0c65 : a5 1e __ LDA ACCU + 3 
01:0c67 : 91 1b __ STA (ACCU + 0),y 
01:0c69 : e6 0f __ INC P2 ; (sp + 0)
01:0c6b : d0 02 __ BNE $0c6f ; (bnk_memcpy.s1005 + 0)
.s1004:
01:0c6d : e6 10 __ INC P3 ; (sp + 1)
.s1005:
01:0c6f : e6 1b __ INC ACCU + 0 
01:0c71 : d0 02 __ BNE $0c75 ; (bnk_memcpy.s1007 + 0)
.s1006:
01:0c73 : e6 1c __ INC ACCU + 1 
.s1007:
01:0c75 : ca __ __ DEX
01:0c76 : d0 df __ BNE $0c57 ; (bnk_memcpy.l1002 + 0)
.s1003:
01:0c78 : a5 1d __ LDA ACCU + 2 
01:0c7a : 8d 00 ff STA $ff00 
.s1001:
01:0c7d : 60 __ __ RTS
--------------------------------------------------------------------
bnk_save: ; bnk_save(u8,u8,const u8*,const u8*,const u8*)->bool
.s0:
01:0c7e : a9 01 __ LDA #$01
01:0c80 : 85 0d __ STA P0 
01:0c82 : 20 ba 2a JSR $2aba ; (krnio_setbnk@proxy + 0)
01:0c85 : a5 15 __ LDA P8 ; (fname + 0)
01:0c87 : 85 0d __ STA P0 
01:0c89 : a5 16 __ LDA P9 ; (fname + 1)
01:0c8b : 85 0e __ STA P1 
01:0c8d : 20 c5 2a JSR $2ac5 ; (krnio_setnam.s0 + 0)
01:0c90 : a5 12 __ LDA P5 ; (device + 0)
01:0c92 : 85 0d __ STA P0 
01:0c94 : a9 01 __ LDA #$01
01:0c96 : 85 0e __ STA P1 
01:0c98 : a9 1c __ LDA #$1c
01:0c9a : 85 0f __ STA P2 
01:0c9c : a5 13 __ LDA P6 ; (end + 0)
01:0c9e : 85 10 __ STA P3 
01:0ca0 : a5 14 __ LDA P7 ; (end + 1)
01:0ca2 : 85 11 __ STA P4 
01:0ca4 : 20 a3 4c JSR $4ca3 ; (krnio_save.s0 + 0)
01:0ca7 : 85 43 __ STA T1 + 0 
01:0ca9 : a9 00 __ LDA #$00
01:0cab : 85 0d __ STA P0 
01:0cad : 85 0e __ STA P1 
01:0caf : 20 be 2a JSR $2abe ; (krnio_setbnk.s0 + 0)
01:0cb2 : a5 43 __ LDA T1 + 0 
01:0cb4 : 85 1b __ STA ACCU + 0 
.s1001:
01:0cb6 : 60 __ __ RTS
