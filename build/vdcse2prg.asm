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
1c35 : a9 79 __ LDA #$79
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
1c65 : a9 19 __ LDA #$19
1c67 : 85 16 __ STA P9 
1c69 : 60 __ __ RTS
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
1c97 : 8d b9 50 STA $50b9 ; (charsetchanged + 0)
1c9a : 8d ba 50 STA $50ba ; (charsetchanged + 1)
1c9d : a2 15 __ LDX #$15
.l1002:
1c9f : ca __ __ DEX
1ca0 : 9d bb 50 STA $50bb,x ; (filename + 0)
1ca3 : d0 fa __ BNE $1c9f ; (main.l1002 + 0)
.s1003:
1ca5 : a2 0e __ LDX #$0e
.l1004:
1ca7 : ca __ __ DEX
1ca8 : 9d d0 50 STA $50d0,x ; (view + 0)
1cab : d0 fa __ BNE $1ca7 ; (main.l1004 + 0)
.s1005:
1cad : 20 8d 22 JSR $228d ; (bnk_init.s1000 + 0)
1cb0 : ad de 50 LDA $50de ; (bootdevice + 0)
1cb3 : 8d ef 50 STA $50ef ; (targetdevice + 0)
1cb6 : 20 29 2b JSR $2b29 ; (vdc_init.s1000 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 85 0f __ STA P2 
1cbd : 85 10 __ STA P3 
1cbf : a9 50 __ LDA #$50
1cc1 : 85 11 __ STA P4 
1cc3 : a9 19 __ LDA #$19
1cc5 : 85 12 __ STA P5 
1cc7 : a9 f0 __ LDA #$f0
1cc9 : 85 0d __ STA P0 
1ccb : a9 50 __ LDA #$50
1ccd : 85 0e __ STA P1 
1ccf : 20 01 31 JSR $3101 ; (vdcwin_init.s0 + 0)
1cd2 : a9 0b __ LDA #$0b
1cd4 : 85 0f __ STA P2 
1cd6 : a9 03 __ LDA #$03
1cd8 : 85 10 __ STA P3 
1cda : a9 3a __ LDA #$3a
1cdc : 85 11 __ STA P4 
1cde : a9 12 __ LDA #$12
1ce0 : 85 12 __ STA P5 
1ce2 : a9 f1 __ LDA #$f1
1ce4 : 85 0d __ STA P0 
1ce6 : a9 51 __ LDA #$51
1ce8 : 85 0e __ STA P1 
1cea : 20 01 31 JSR $3101 ; (vdcwin_init.s0 + 0)
1ced : a9 c5 __ LDA #$c5
1cef : 8d df 51 STA $51df ; (vdc_state + 7)
1cf2 : a9 00 __ LDA #$00
1cf4 : 85 0f __ STA P2 
1cf6 : 85 10 __ STA P3 
1cf8 : a9 01 __ LDA #$01
1cfa : 85 13 __ STA P6 
1cfc : 20 4b 50 JSR $504b ; (vdc_clear@proxy + 0)
1cff : a9 00 __ LDA #$00
1d01 : 85 11 __ STA P4 
1d03 : 85 12 __ STA P5 
1d05 : a9 97 __ LDA #$97
1d07 : 85 13 __ STA P6 
1d09 : a9 33 __ LDA #$33
1d0b : 85 14 __ STA P7 
1d0d : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
1d10 : a9 c4 __ LDA #$c4
1d12 : 8d df 51 STA $51df ; (vdc_state + 7)
1d15 : a9 00 __ LDA #$00
1d17 : 85 0f __ STA P2 
1d19 : a9 01 __ LDA #$01
1d1b : 85 10 __ STA P3 
1d1d : 85 13 __ STA P6 
1d1f : 20 4b 50 JSR $504b ; (vdc_clear@proxy + 0)
1d22 : a9 80 __ LDA #$80
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
1d37 : a9 dc __ LDA #$dc
1d39 : c8 __ __ INY
1d3a : 91 23 __ STA (SP + 0),y 
1d3c : a9 33 __ LDA #$33
1d3e : c8 __ __ INY
1d3f : 91 23 __ STA (SP + 0),y 
1d41 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
1d44 : a9 00 __ LDA #$00
1d46 : 85 11 __ STA P4 
1d48 : a9 01 __ LDA #$01
1d4a : 85 12 __ STA P5 
1d4c : 20 38 50 JSR $5038 ; (vdc_prints@proxy + 0)
1d4f : ad ff 46 LDA $46ff ; (mc_default + 0)
1d52 : 8d df 51 STA $51df ; (vdc_state + 7)
1d55 : 20 2a 34 JSR $342a ; (filepicker.s1000 + 0)
1d58 : a9 80 __ LDA #$80
1d5a : a0 02 __ LDY #$02
1d5c : 91 23 __ STA (SP + 0),y 
1d5e : a9 52 __ LDA #$52
1d60 : c8 __ __ INY
1d61 : 91 23 __ STA (SP + 0),y 
1d63 : a9 f5 __ LDA #$f5
1d65 : c8 __ __ INY
1d66 : 91 23 __ STA (SP + 0),y 
1d68 : a9 46 __ LDA #$46
1d6a : c8 __ __ INY
1d6b : 91 23 __ STA (SP + 0),y 
1d6d : ad ef 50 LDA $50ef ; (targetdevice + 0)
1d70 : c8 __ __ INY
1d71 : 91 23 __ STA (SP + 0),y 
1d73 : a9 00 __ LDA #$00
1d75 : c8 __ __ INY
1d76 : 91 23 __ STA (SP + 0),y 
1d78 : a9 bb __ LDA #$bb
1d7a : c8 __ __ INY
1d7b : 91 23 __ STA (SP + 0),y 
1d7d : a9 50 __ LDA #$50
1d7f : c8 __ __ INY
1d80 : 91 23 __ STA (SP + 0),y 
1d82 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
1d85 : a9 00 __ LDA #$00
1d87 : 8d f5 51 STA $51f5 ; (interface + 4)
1d8a : 8d f6 51 STA $51f6 ; (interface + 5)
1d8d : a9 f1 __ LDA #$f1
1d8f : a0 02 __ LDY #$02
1d91 : 91 23 __ STA (SP + 0),y 
1d93 : a9 51 __ LDA #$51
1d95 : c8 __ __ INY
1d96 : 91 23 __ STA (SP + 0),y 
1d98 : a9 00 __ LDA #$00
1d9a : c8 __ __ INY
1d9b : 91 23 __ STA (SP + 0),y 
1d9d : a9 47 __ LDA #$47
1d9f : c8 __ __ INY
1da0 : 91 23 __ STA (SP + 0),y 
1da2 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
1da5 : a9 f1 __ LDA #$f1
1da7 : a0 02 __ LDY #$02
1da9 : 91 23 __ STA (SP + 0),y 
1dab : a9 51 __ LDA #$51
1dad : c8 __ __ INY
1dae : 91 23 __ STA (SP + 0),y 
1db0 : a9 80 __ LDA #$80
1db2 : c8 __ __ INY
1db3 : 91 23 __ STA (SP + 0),y 
1db5 : a9 52 __ LDA #$52
1db7 : c8 __ __ INY
1db8 : 91 23 __ STA (SP + 0),y 
1dba : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
1dbd : a9 f1 __ LDA #$f1
1dbf : a0 02 __ LDY #$02
1dc1 : 91 23 __ STA (SP + 0),y 
1dc3 : a9 51 __ LDA #$51
1dc5 : c8 __ __ INY
1dc6 : 91 23 __ STA (SP + 0),y 
1dc8 : a9 0f __ LDA #$0f
1dca : c8 __ __ INY
1dcb : 91 23 __ STA (SP + 0),y 
1dcd : a9 47 __ LDA #$47
1dcf : c8 __ __ INY
1dd0 : 91 23 __ STA (SP + 0),y 
1dd2 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
1dd5 : ad f1 51 LDA $51f1 ; (interface + 0)
1dd8 : 85 15 __ STA P8 
1dda : ad f6 51 LDA $51f6 ; (interface + 5)
1ddd : 18 __ __ CLC
1dde : 6d f2 51 ADC $51f2 ; (interface + 1)
1de1 : 85 16 __ STA P9 
1de3 : a9 a4 __ LDA #$a4
1de5 : 85 17 __ STA P10 
1de7 : a9 50 __ LDA #$50
1de9 : 85 18 __ STA P11 
1deb : 20 35 47 JSR $4735 ; (textInput.s0 + 0)
1dee : a9 80 __ LDA #$80
1df0 : a0 02 __ LDY #$02
1df2 : 91 23 __ STA (SP + 0),y 
1df4 : a9 52 __ LDA #$52
1df6 : c8 __ __ INY
1df7 : 91 23 __ STA (SP + 0),y 
1df9 : a9 a4 __ LDA #$a4
1dfb : a0 06 __ LDY #$06
1dfd : 91 23 __ STA (SP + 0),y 
1dff : a9 50 __ LDA #$50
1e01 : c8 __ __ INY
1e02 : 91 23 __ STA (SP + 0),y 
1e04 : a9 a4 __ LDA #$a4
1e06 : c8 __ __ INY
1e07 : 91 23 __ STA (SP + 0),y 
1e09 : a9 50 __ LDA #$50
1e0b : c8 __ __ INY
1e0c : 91 23 __ STA (SP + 0),y 
1e0e : a9 75 __ LDA #$75
1e10 : a0 04 __ LDY #$04
1e12 : 91 23 __ STA (SP + 0),y 
1e14 : a9 49 __ LDA #$49
1e16 : c8 __ __ INY
1e17 : 91 23 __ STA (SP + 0),y 
1e19 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
1e1c : 20 7e 49 JSR $497e ; (cmd@proxy + 0)
1e1f : a5 1b __ LDA ACCU + 0 
1e21 : c9 3f __ CMP #$3f
1e23 : d0 1b __ BNE $1e40 ; (main.s4 + 0)
.s3:
1e25 : a9 f1 __ LDA #$f1
1e27 : a0 02 __ LDY #$02
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : a9 51 __ LDA #$51
1e2d : c8 __ __ INY
1e2e : 91 23 __ STA (SP + 0),y 
1e30 : a9 47 __ LDA #$47
1e32 : c8 __ __ INY
1e33 : 91 23 __ STA (SP + 0),y 
1e35 : a9 4a __ LDA #$4a
1e37 : c8 __ __ INY
1e38 : 91 23 __ STA (SP + 0),y 
1e3a : 20 2d 41 JSR $412d ; (vdcwin_put_string.s1000 + 0)
1e3d : 4c 25 22 JMP $2225 ; (main.l6 + 0)
.s4:
1e40 : 09 00 __ ORA #$00
1e42 : f0 07 __ BEQ $1e4b ; (main.s5 + 0)
.s15:
1e44 : c9 3e __ CMP #$3e
1e46 : f0 03 __ BEQ $1e4b ; (main.s5 + 0)
.s10:
1e48 : 20 73 4a JSR $4a73 ; (error_message.s1000 + 0)
.s5:
1e4b : a9 f1 __ LDA #$f1
1e4d : a0 02 __ LDY #$02
1e4f : 91 23 __ STA (SP + 0),y 
1e51 : a9 51 __ LDA #$51
1e53 : c8 __ __ INY
1e54 : 91 23 __ STA (SP + 0),y 
1e56 : a9 00 __ LDA #$00
1e58 : c8 __ __ INY
1e59 : 91 23 __ STA (SP + 0),y 
1e5b : a9 4b __ LDA #$4b
1e5d : c8 __ __ INY
1e5e : 91 23 __ STA (SP + 0),y 
1e60 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
1e63 : a9 00 __ LDA #$00
1e65 : 85 10 __ STA P3 
1e67 : ad ef 50 LDA $50ef ; (targetdevice + 0)
1e6a : 85 0f __ STA P2 
1e6c : a9 93 __ LDA #$93
1e6e : 85 11 __ STA P4 
1e70 : a9 bf __ LDA #$bf
1e72 : 85 12 __ STA P5 
1e74 : a9 bb __ LDA #$bb
1e76 : 85 13 __ STA P6 
1e78 : a9 50 __ LDA #$50
1e7a : 85 14 __ STA P7 
1e7c : 20 11 13 JSR $1311 ; (bnk_load.s0 + 0)
1e7f : a5 1b __ LDA ACCU + 0 
1e81 : d0 03 __ BNE $1e86 ; (main.s18 + 0)
.s16:
1e83 : 20 73 4a JSR $4a73 ; (error_message.s1000 + 0)
.s18:
1e86 : a9 bb __ LDA #$bb
1e88 : 85 0d __ STA P0 
1e8a : a9 50 __ LDA #$50
1e8c : 85 0e __ STA P1 
1e8e : ad 93 bf LDA $bf93 ; (projbuffer + 0)
1e91 : 8d b9 50 STA $50b9 ; (charsetchanged + 0)
1e94 : ad 94 bf LDA $bf94 ; (projbuffer + 1)
1e97 : 8d ba 50 STA $50ba ; (charsetchanged + 1)
1e9a : ad 98 bf LDA $bf98 ; (projbuffer + 5)
1e9d : 85 03 __ STA WORK + 0 
1e9f : 8d d6 50 STA $50d6 ; (view + 6)
1ea2 : ad 97 bf LDA $bf97 ; (projbuffer + 4)
1ea5 : 85 04 __ STA WORK + 1 
1ea7 : 8d d7 50 STA $50d7 ; (view + 7)
1eaa : ad 9a bf LDA $bf9a ; (projbuffer + 7)
1ead : 85 1b __ STA ACCU + 0 
1eaf : ad 99 bf LDA $bf99 ; (projbuffer + 6)
1eb2 : 85 1c __ STA ACCU + 1 
1eb4 : 20 a4 4c JSR $4ca4 ; (mul16 + 0)
1eb7 : a5 05 __ LDA WORK + 2 
1eb9 : 85 54 __ STA T3 + 0 
1ebb : 8d da 50 STA $50da ; (view + 10)
1ebe : a5 06 __ LDA WORK + 3 
1ec0 : 85 55 __ STA T3 + 1 
1ec2 : 8d db 50 STA $50db ; (view + 11)
1ec5 : ad 9a bf LDA $bf9a ; (projbuffer + 7)
1ec8 : 8d d8 50 STA $50d8 ; (view + 8)
1ecb : ad 99 bf LDA $bf99 ; (projbuffer + 6)
1ece : 8d d9 50 STA $50d9 ; (view + 9)
1ed1 : ad 9d bf LDA $bf9d ; (projbuffer + 10)
1ed4 : 8d dd 50 STA $50dd ; (view + 13)
1ed7 : ad a9 bf LDA $bfa9 ; (projbuffer + 22)
1eda : 8d dc 50 STA $50dc ; (view + 12)
1edd : 20 3a 33 JSR $333a ; (strlen.s0 + 0)
1ee0 : a9 00 __ LDA #$00
1ee2 : a6 1b __ LDX ACCU + 0 
1ee4 : 9d b6 50 STA $50b6,x ; (filedest + 18)
1ee7 : 06 54 __ ASL T3 + 0 
1ee9 : 26 55 __ ROL T3 + 1 
1eeb : 18 __ __ CLC
1eec : a9 30 __ LDA #$30
1eee : 65 54 __ ADC T3 + 0 
1ef0 : 85 54 __ STA T3 + 0 
1ef2 : a9 32 __ LDA #$32
1ef4 : 65 55 __ ADC T3 + 1 
1ef6 : 85 55 __ STA T3 + 1 
1ef8 : a9 bf __ LDA #$bf
1efa : c5 55 __ CMP T3 + 1 
1efc : d0 04 __ BNE $1f02 ; (main.s1011 + 0)
.s1010:
1efe : a9 ff __ LDA #$ff
1f00 : c5 54 __ CMP T3 + 0 
.s1011:
1f02 : b0 03 __ BCS $1f07 ; (main.s21 + 0)
.s19:
1f04 : 20 1b 4b JSR $4b1b ; (too_big.s1000 + 0)
.s21:
1f07 : a9 00 __ LDA #$00
1f09 : 8d d0 50 STA $50d0 ; (view + 0)
1f0c : a9 32 __ LDA #$32
1f0e : 8d d1 50 STA $50d1 ; (view + 1)
1f11 : ad b9 50 LDA $50b9 ; (charsetchanged + 0)
1f14 : f0 24 __ BEQ $1f3a ; (main.s86 + 0)
.s22:
1f16 : 18 __ __ CLC
1f17 : a5 55 __ LDA T3 + 1 
1f19 : 69 08 __ ADC #$08
1f1b : 85 57 __ STA T5 + 1 
1f1d : a9 bf __ LDA #$bf
1f1f : c5 57 __ CMP T5 + 1 
1f21 : d0 04 __ BNE $1f27 ; (main.s1009 + 0)
.s1008:
1f23 : a9 ff __ LDA #$ff
1f25 : c5 54 __ CMP T3 + 0 
.s1009:
1f27 : b0 03 __ BCS $1f2c ; (main.s27 + 0)
.s25:
1f29 : 20 1b 4b JSR $4b1b ; (too_big.s1000 + 0)
.s27:
1f2c : a5 54 __ LDA T3 + 0 
1f2e : 8d d2 50 STA $50d2 ; (view + 2)
1f31 : a5 55 __ LDA T3 + 1 
1f33 : 8d d3 50 STA $50d3 ; (view + 3)
1f36 : a5 57 __ LDA T5 + 1 
1f38 : 85 55 __ STA T3 + 1 
.s86:
1f3a : ad ba 50 LDA $50ba ; (charsetchanged + 1)
1f3d : f0 24 __ BEQ $1f63 ; (main.s30 + 0)
.s28:
1f3f : 18 __ __ CLC
1f40 : a5 55 __ LDA T3 + 1 
1f42 : 69 08 __ ADC #$08
1f44 : 85 57 __ STA T5 + 1 
1f46 : a9 bf __ LDA #$bf
1f48 : c5 57 __ CMP T5 + 1 
1f4a : d0 04 __ BNE $1f50 ; (main.s1007 + 0)
.s1006:
1f4c : a9 ff __ LDA #$ff
1f4e : c5 54 __ CMP T3 + 0 
.s1007:
1f50 : b0 03 __ BCS $1f55 ; (main.s33 + 0)
.s31:
1f52 : 20 1b 4b JSR $4b1b ; (too_big.s1000 + 0)
.s33:
1f55 : a5 54 __ LDA T3 + 0 
1f57 : 8d d4 50 STA $50d4 ; (view + 4)
1f5a : a5 55 __ LDA T3 + 1 
1f5c : 8d d5 50 STA $50d5 ; (view + 5)
1f5f : a5 57 __ LDA T5 + 1 
1f61 : 85 55 __ STA T3 + 1 
.s30:
1f63 : a9 00 __ LDA #$00
1f65 : a0 06 __ LDY #$06
1f67 : 91 23 __ STA (SP + 0),y 
1f69 : a9 32 __ LDA #$32
1f6b : c8 __ __ INY
1f6c : 91 23 __ STA (SP + 0),y 
1f6e : a9 80 __ LDA #$80
1f70 : a0 02 __ LDY #$02
1f72 : 91 23 __ STA (SP + 0),y 
1f74 : a9 52 __ LDA #$52
1f76 : c8 __ __ INY
1f77 : 91 23 __ STA (SP + 0),y 
1f79 : a9 83 __ LDA #$83
1f7b : c8 __ __ INY
1f7c : 91 23 __ STA (SP + 0),y 
1f7e : a9 4b __ LDA #$4b
1f80 : c8 __ __ INY
1f81 : 91 23 __ STA (SP + 0),y 
1f83 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
1f86 : a9 f1 __ LDA #$f1
1f88 : a0 02 __ LDY #$02
1f8a : 91 23 __ STA (SP + 0),y 
1f8c : a9 51 __ LDA #$51
1f8e : c8 __ __ INY
1f8f : 91 23 __ STA (SP + 0),y 
1f91 : a9 80 __ LDA #$80
1f93 : c8 __ __ INY
1f94 : 91 23 __ STA (SP + 0),y 
1f96 : a9 52 __ LDA #$52
1f98 : c8 __ __ INY
1f99 : 91 23 __ STA (SP + 0),y 
1f9b : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
1f9e : ad de 50 LDA $50de ; (bootdevice + 0)
1fa1 : 85 0f __ STA P2 
1fa3 : a9 01 __ LDA #$01
1fa5 : 85 10 __ STA P3 
1fa7 : 85 11 __ STA P4 
1fa9 : a9 1c __ LDA #$1c
1fab : 85 12 __ STA P5 
1fad : a9 a8 __ LDA #$a8
1faf : 85 13 __ STA P6 
1fb1 : a9 4b __ LDA #$4b
1fb3 : 85 14 __ STA P7 
1fb5 : 20 11 13 JSR $1311 ; (bnk_load.s0 + 0)
1fb8 : a5 1b __ LDA ACCU + 0 
1fba : d0 03 __ BNE $1fbf ; (main.s36 + 0)
.s34:
1fbc : 20 73 4a JSR $4a73 ; (error_message.s1000 + 0)
.s36:
1fbf : a9 80 __ LDA #$80
1fc1 : a0 02 __ LDY #$02
1fc3 : 91 23 __ STA (SP + 0),y 
1fc5 : a9 52 __ LDA #$52
1fc7 : c8 __ __ INY
1fc8 : 91 23 __ STA (SP + 0),y 
1fca : a9 d1 __ LDA #$d1
1fcc : a0 06 __ LDY #$06
1fce : 91 23 __ STA (SP + 0),y 
1fd0 : a9 2d __ LDA #$2d
1fd2 : c8 __ __ INY
1fd3 : 91 23 __ STA (SP + 0),y 
1fd5 : a9 b5 __ LDA #$b5
1fd7 : a0 04 __ LDY #$04
1fd9 : 91 23 __ STA (SP + 0),y 
1fdb : a9 4b __ LDA #$4b
1fdd : c8 __ __ INY
1fde : 91 23 __ STA (SP + 0),y 
1fe0 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
1fe3 : a9 f1 __ LDA #$f1
1fe5 : a0 02 __ LDY #$02
1fe7 : 91 23 __ STA (SP + 0),y 
1fe9 : a9 51 __ LDA #$51
1feb : c8 __ __ INY
1fec : 91 23 __ STA (SP + 0),y 
1fee : a9 80 __ LDA #$80
1ff0 : c8 __ __ INY
1ff1 : 91 23 __ STA (SP + 0),y 
1ff3 : a9 52 __ LDA #$52
1ff5 : c8 __ __ INY
1ff6 : 91 23 __ STA (SP + 0),y 
1ff8 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
1ffb : a9 d0 __ LDA #$d0
1ffd : 85 0f __ STA P2 
1fff : a9 50 __ LDA #$50
2001 : 85 10 __ STA P3 
2003 : 20 46 13 JSR $1346 ; (bnk_memcpy.s0 + 0)
2006 : a9 80 __ LDA #$80
2008 : a0 02 __ LDY #$02
200a : 91 23 __ STA (SP + 0),y 
200c : a9 52 __ LDA #$52
200e : c8 __ __ INY
200f : 91 23 __ STA (SP + 0),y 
2011 : a9 d7 __ LDA #$d7
2013 : c8 __ __ INY
2014 : 91 23 __ STA (SP + 0),y 
2016 : a9 4b __ LDA #$4b
2018 : c8 __ __ INY
2019 : 91 23 __ STA (SP + 0),y 
201b : ad d0 50 LDA $50d0 ; (view + 0)
201e : c8 __ __ INY
201f : 91 23 __ STA (SP + 0),y 
2021 : ad d1 50 LDA $50d1 ; (view + 1)
2024 : c8 __ __ INY
2025 : 91 23 __ STA (SP + 0),y 
2027 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
202a : a9 f1 __ LDA #$f1
202c : a0 02 __ LDY #$02
202e : 91 23 __ STA (SP + 0),y 
2030 : a9 51 __ LDA #$51
2032 : c8 __ __ INY
2033 : 91 23 __ STA (SP + 0),y 
2035 : a9 80 __ LDA #$80
2037 : c8 __ __ INY
2038 : 91 23 __ STA (SP + 0),y 
203a : a9 52 __ LDA #$52
203c : c8 __ __ INY
203d : 91 23 __ STA (SP + 0),y 
203f : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
2042 : a9 80 __ LDA #$80
2044 : a0 02 __ LDY #$02
2046 : 91 23 __ STA (SP + 0),y 
2048 : a9 52 __ LDA #$52
204a : c8 __ __ INY
204b : 91 23 __ STA (SP + 0),y 
204d : a9 bb __ LDA #$bb
204f : a0 06 __ LDY #$06
2051 : 91 23 __ STA (SP + 0),y 
2053 : a9 50 __ LDA #$50
2055 : c8 __ __ INY
2056 : 91 23 __ STA (SP + 0),y 
2058 : a9 f8 __ LDA #$f8
205a : a0 04 __ LDY #$04
205c : 91 23 __ STA (SP + 0),y 
205e : a9 4b __ LDA #$4b
2060 : c8 __ __ INY
2061 : 91 23 __ STA (SP + 0),y 
2063 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
2066 : ad d0 50 LDA $50d0 ; (view + 0)
2069 : 85 11 __ STA P4 
206b : ad d1 50 LDA $50d1 ; (view + 1)
206e : 85 12 __ STA P5 
2070 : 20 00 13 JSR $1300 ; (bnk_load@proxy + 0)
2073 : a5 1b __ LDA ACCU + 0 
2075 : d0 03 __ BNE $207a ; (main.s90 + 0)
.s37:
2077 : 20 73 4a JSR $4a73 ; (error_message.s1000 + 0)
.s90:
207a : ad b9 50 LDA $50b9 ; (charsetchanged + 0)
207d : f0 03 __ BEQ $2082 ; (main.s92 + 0)
207f : 4c ab 21 JMP $21ab ; (main.s40 + 0)
.s92:
2082 : ad ba 50 LDA $50ba ; (charsetchanged + 1)
2085 : f0 03 __ BEQ $208a ; (main.s48 + 0)
2087 : 4c 31 21 JMP $2131 ; (main.s46 + 0)
.s48:
208a : a9 80 __ LDA #$80
208c : a0 02 __ LDY #$02
208e : 91 23 __ STA (SP + 0),y 
2090 : a9 52 __ LDA #$52
2092 : c8 __ __ INY
2093 : 91 23 __ STA (SP + 0),y 
2095 : a9 52 __ LDA #$52
2097 : c8 __ __ INY
2098 : 91 23 __ STA (SP + 0),y 
209a : a9 4c __ LDA #$4c
209c : c8 __ __ INY
209d : 91 23 __ STA (SP + 0),y 
209f : 38 __ __ SEC
20a0 : a5 55 __ LDA T3 + 1 
20a2 : e9 32 __ SBC #$32
20a4 : a0 07 __ LDY #$07
20a6 : 91 23 __ STA (SP + 0),y 
20a8 : a5 54 __ LDA T3 + 0 
20aa : 88 __ __ DEY
20ab : 91 23 __ STA (SP + 0),y 
20ad : a9 a4 __ LDA #$a4
20af : a0 08 __ LDY #$08
20b1 : 91 23 __ STA (SP + 0),y 
20b3 : a9 50 __ LDA #$50
20b5 : c8 __ __ INY
20b6 : 91 23 __ STA (SP + 0),y 
20b8 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
20bb : a9 f1 __ LDA #$f1
20bd : a0 02 __ LDY #$02
20bf : 91 23 __ STA (SP + 0),y 
20c1 : a9 51 __ LDA #$51
20c3 : c8 __ __ INY
20c4 : 91 23 __ STA (SP + 0),y 
20c6 : a9 80 __ LDA #$80
20c8 : c8 __ __ INY
20c9 : 91 23 __ STA (SP + 0),y 
20cb : a9 52 __ LDA #$52
20cd : c8 __ __ INY
20ce : 91 23 __ STA (SP + 0),y 
20d0 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
20d3 : a5 54 __ LDA T3 + 0 
20d5 : 85 13 __ STA P6 
20d7 : a5 55 __ LDA T3 + 1 
20d9 : 85 14 __ STA P7 
20db : a9 a4 __ LDA #$a4
20dd : 85 15 __ STA P8 
20df : a9 50 __ LDA #$50
20e1 : 85 16 __ STA P9 
20e3 : ad ef 50 LDA $50ef ; (targetdevice + 0)
20e6 : 85 12 __ STA P5 
20e8 : 20 7e 13 JSR $137e ; (bnk_save.s0 + 0)
20eb : a5 1b __ LDA ACCU + 0 
20ed : f0 03 __ BEQ $20f2 ; (main.s54 + 0)
.s52:
20ef : 20 73 4a JSR $4a73 ; (error_message.s1000 + 0)
.s54:
20f2 : a9 f1 __ LDA #$f1
20f4 : a0 02 __ LDY #$02
20f6 : 91 23 __ STA (SP + 0),y 
20f8 : a9 51 __ LDA #$51
20fa : c8 __ __ INY
20fb : 91 23 __ STA (SP + 0),y 
20fd : a9 87 __ LDA #$87
20ff : c8 __ __ INY
2100 : 91 23 __ STA (SP + 0),y 
2102 : a9 4c __ LDA #$4c
2104 : c8 __ __ INY
2105 : 91 23 __ STA (SP + 0),y 
2107 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
210a : 20 9a 2d JSR $2d9a ; (getch.s0 + 0)
210d : 20 c6 4a JSR $4ac6 ; (vdc_exit.s0 + 0)
2110 : a9 04 __ LDA #$04
2112 : 8d 06 d5 STA $d506 
2115 : a9 00 __ LDA #$00
2117 : 85 1b __ STA ACCU + 0 
2119 : 85 1c __ STA ACCU + 1 
.s1001:
211b : 18 __ __ CLC
211c : a5 23 __ LDA SP + 0 
211e : 69 0a __ ADC #$0a
2120 : 85 23 __ STA SP + 0 
2122 : 90 02 __ BCC $2126 ; (main.s1001 + 11)
2124 : e6 24 __ INC SP + 1 
2126 : a2 04 __ LDX #$04
2128 : bd 89 bf LDA $bf89,x ; (main@stack + 0)
212b : 95 53 __ STA T1 + 0,x 
212d : ca __ __ DEX
212e : 10 f8 __ BPL $2128 ; (main.s1001 + 13)
2130 : 60 __ __ RTS
.s46:
2131 : a9 80 __ LDA #$80
2133 : a0 02 __ LDY #$02
2135 : 91 23 __ STA (SP + 0),y 
2137 : a9 52 __ LDA #$52
2139 : c8 __ __ INY
213a : 91 23 __ STA (SP + 0),y 
213c : a9 29 __ LDA #$29
213e : c8 __ __ INY
213f : 91 23 __ STA (SP + 0),y 
2141 : a9 4c __ LDA #$4c
2143 : c8 __ __ INY
2144 : 91 23 __ STA (SP + 0),y 
2146 : ad d4 50 LDA $50d4 ; (view + 4)
2149 : c8 __ __ INY
214a : 91 23 __ STA (SP + 0),y 
214c : ad d5 50 LDA $50d5 ; (view + 5)
214f : c8 __ __ INY
2150 : 91 23 __ STA (SP + 0),y 
2152 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
2155 : a9 f1 __ LDA #$f1
2157 : a0 02 __ LDY #$02
2159 : 91 23 __ STA (SP + 0),y 
215b : a9 51 __ LDA #$51
215d : c8 __ __ INY
215e : 91 23 __ STA (SP + 0),y 
2160 : a9 80 __ LDA #$80
2162 : c8 __ __ INY
2163 : 91 23 __ STA (SP + 0),y 
2165 : a9 52 __ LDA #$52
2167 : c8 __ __ INY
2168 : 91 23 __ STA (SP + 0),y 
216a : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
216d : a9 80 __ LDA #$80
216f : a0 02 __ LDY #$02
2171 : 91 23 __ STA (SP + 0),y 
2173 : a9 52 __ LDA #$52
2175 : c8 __ __ INY
2176 : 91 23 __ STA (SP + 0),y 
2178 : a9 bb __ LDA #$bb
217a : a0 06 __ LDY #$06
217c : 91 23 __ STA (SP + 0),y 
217e : a9 50 __ LDA #$50
2180 : c8 __ __ INY
2181 : 91 23 __ STA (SP + 0),y 
2183 : a9 4a __ LDA #$4a
2185 : a0 04 __ LDY #$04
2187 : 91 23 __ STA (SP + 0),y 
2189 : a9 4c __ LDA #$4c
218b : c8 __ __ INY
218c : 91 23 __ STA (SP + 0),y 
218e : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
2191 : ad d4 50 LDA $50d4 ; (view + 4)
2194 : 85 11 __ STA P4 
2196 : ad d5 50 LDA $50d5 ; (view + 5)
2199 : 85 12 __ STA P5 
219b : 20 00 13 JSR $1300 ; (bnk_load@proxy + 0)
219e : a5 1b __ LDA ACCU + 0 
21a0 : f0 03 __ BEQ $21a5 ; (main.s49 + 0)
21a2 : 4c 8a 20 JMP $208a ; (main.s48 + 0)
.s49:
21a5 : 20 73 4a JSR $4a73 ; (error_message.s1000 + 0)
21a8 : 4c 8a 20 JMP $208a ; (main.s48 + 0)
.s40:
21ab : a9 80 __ LDA #$80
21ad : a0 02 __ LDY #$02
21af : 91 23 __ STA (SP + 0),y 
21b1 : a9 52 __ LDA #$52
21b3 : c8 __ __ INY
21b4 : 91 23 __ STA (SP + 0),y 
21b6 : a9 00 __ LDA #$00
21b8 : c8 __ __ INY
21b9 : 91 23 __ STA (SP + 0),y 
21bb : a9 4c __ LDA #$4c
21bd : c8 __ __ INY
21be : 91 23 __ STA (SP + 0),y 
21c0 : ad d2 50 LDA $50d2 ; (view + 2)
21c3 : c8 __ __ INY
21c4 : 91 23 __ STA (SP + 0),y 
21c6 : ad d3 50 LDA $50d3 ; (view + 3)
21c9 : c8 __ __ INY
21ca : 91 23 __ STA (SP + 0),y 
21cc : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
21cf : a9 f1 __ LDA #$f1
21d1 : a0 02 __ LDY #$02
21d3 : 91 23 __ STA (SP + 0),y 
21d5 : a9 51 __ LDA #$51
21d7 : c8 __ __ INY
21d8 : 91 23 __ STA (SP + 0),y 
21da : a9 80 __ LDA #$80
21dc : c8 __ __ INY
21dd : 91 23 __ STA (SP + 0),y 
21df : a9 52 __ LDA #$52
21e1 : c8 __ __ INY
21e2 : 91 23 __ STA (SP + 0),y 
21e4 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
21e7 : a9 80 __ LDA #$80
21e9 : a0 02 __ LDY #$02
21eb : 91 23 __ STA (SP + 0),y 
21ed : a9 52 __ LDA #$52
21ef : c8 __ __ INY
21f0 : 91 23 __ STA (SP + 0),y 
21f2 : a9 bb __ LDA #$bb
21f4 : a0 06 __ LDY #$06
21f6 : 91 23 __ STA (SP + 0),y 
21f8 : a9 50 __ LDA #$50
21fa : c8 __ __ INY
21fb : 91 23 __ STA (SP + 0),y 
21fd : a9 21 __ LDA #$21
21ff : a0 04 __ LDY #$04
2201 : 91 23 __ STA (SP + 0),y 
2203 : a9 4c __ LDA #$4c
2205 : c8 __ __ INY
2206 : 91 23 __ STA (SP + 0),y 
2208 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
220b : ad d2 50 LDA $50d2 ; (view + 2)
220e : 85 11 __ STA P4 
2210 : ad d3 50 LDA $50d3 ; (view + 3)
2213 : 85 12 __ STA P5 
2215 : 20 00 13 JSR $1300 ; (bnk_load@proxy + 0)
2218 : a5 1b __ LDA ACCU + 0 
221a : f0 03 __ BEQ $221f ; (main.s43 + 0)
221c : 4c 82 20 JMP $2082 ; (main.s92 + 0)
.s43:
221f : 20 73 4a JSR $4a73 ; (error_message.s1000 + 0)
2222 : 4c 82 20 JMP $2082 ; (main.s92 + 0)
.l6:
2225 : 20 e7 46 JSR $46e7 ; (vdcwin_getch.s0 + 0)
2228 : a5 1b __ LDA ACCU + 0 
222a : 85 53 __ STA T1 + 0 
222c : c9 59 __ CMP #$59
222e : f0 04 __ BEQ $2234 ; (main.s7 + 0)
.s8:
2230 : c9 4e __ CMP #$4e
2232 : d0 f1 __ BNE $2225 ; (main.l6 + 0)
.s7:
2234 : a5 1b __ LDA ACCU + 0 
2236 : 8d f8 bf STA $bff8 ; (sstack + 0)
2239 : a9 f1 __ LDA #$f1
223b : 85 17 __ STA P10 
223d : a9 51 __ LDA #$51
223f : 85 18 __ STA P11 
2241 : 20 eb 3f JSR $3feb ; (vdcwin_put_char.s1000 + 0)
2244 : a9 f1 __ LDA #$f1
2246 : a0 02 __ LDY #$02
2248 : 91 23 __ STA (SP + 0),y 
224a : a9 51 __ LDA #$51
224c : c8 __ __ INY
224d : 91 23 __ STA (SP + 0),y 
224f : a9 fe __ LDA #$fe
2251 : c8 __ __ INY
2252 : 91 23 __ STA (SP + 0),y 
2254 : a9 33 __ LDA #$33
2256 : c8 __ __ INY
2257 : 91 23 __ STA (SP + 0),y 
2259 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
225c : a5 53 __ LDA T1 + 0 
225e : c9 59 __ CMP #$59
2260 : f0 03 __ BEQ $2265 ; (main.s9 + 0)
2262 : 4c 48 1e JMP $1e48 ; (main.s10 + 0)
.s9:
2265 : a9 28 __ LDA #$28
2267 : a0 02 __ LDY #$02
2269 : 91 23 __ STA (SP + 0),y 
226b : a9 54 __ LDA #$54
226d : c8 __ __ INY
226e : 91 23 __ STA (SP + 0),y 
2270 : a9 6e __ LDA #$6e
2272 : c8 __ __ INY
2273 : 91 23 __ STA (SP + 0),y 
2275 : a9 4a __ LDA #$4a
2277 : c8 __ __ INY
2278 : 91 23 __ STA (SP + 0),y 
227a : a9 a4 __ LDA #$a4
227c : c8 __ __ INY
227d : 91 23 __ STA (SP + 0),y 
227f : a9 50 __ LDA #$50
2281 : c8 __ __ INY
2282 : 91 23 __ STA (SP + 0),y 
2284 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
2287 : 20 7e 49 JSR $497e ; (cmd@proxy + 0)
228a : 4c 4b 1e JMP $1e4b ; (main.s5 + 0)
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
228d : 38 __ __ SEC
228e : a5 23 __ LDA SP + 0 
2290 : e9 06 __ SBC #$06
2292 : 85 23 __ STA SP + 0 
2294 : b0 02 __ BCS $2298 ; (bnk_init.s0 + 0)
2296 : c6 24 __ DEC SP + 1 
.s0:
2298 : a9 01 __ LDA #$01
229a : a0 02 __ LDY #$02
229c : 91 23 __ STA (SP + 0),y 
229e : a9 2a __ LDA #$2a
22a0 : c8 __ __ INY
22a1 : 91 23 __ STA (SP + 0),y 
22a3 : a5 ba __ LDA $ba 
22a5 : d0 02 __ BNE $22a9 ; (bnk_init.s1002 + 0)
.s2:
22a7 : a9 08 __ LDA #$08
.s1002:
22a9 : 8d de 50 STA $50de ; (bootdevice + 0)
22ac : a0 04 __ LDY #$04
22ae : 91 23 __ STA (SP + 0),y 
22b0 : a9 00 __ LDA #$00
22b2 : c8 __ __ INY
22b3 : 91 23 __ STA (SP + 0),y 
22b5 : 20 da 22 JSR $22da ; (printf.s0 + 0)
22b8 : a9 06 __ LDA #$06
22ba : 8d 06 d5 STA $d506 
22bd : a9 11 __ LDA #$11
22bf : a0 02 __ LDY #$02
22c1 : 91 23 __ STA (SP + 0),y 
22c3 : a9 2a __ LDA #$2a
22c5 : c8 __ __ INY
22c6 : 91 23 __ STA (SP + 0),y 
22c8 : 20 da 22 JSR $22da ; (printf.s0 + 0)
22cb : 20 2b 2a JSR $2a2b ; (load_overlay.s1000 + 0)
.s1001:
22ce : 18 __ __ CLC
22cf : a5 23 __ LDA SP + 0 
22d1 : 69 06 __ ADC #$06
22d3 : 85 23 __ STA SP + 0 
22d5 : 90 02 __ BCC $22d9 ; (bnk_init.s1001 + 11)
22d7 : e6 24 __ INC SP + 1 
22d9 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
22da : a9 01 __ LDA #$01
22dc : 8d fc bf STA $bffc ; (sstack + 4)
22df : a9 aa __ LDA #$aa
22e1 : 85 16 __ STA P9 
22e3 : a9 bf __ LDA #$bf
22e5 : 85 17 __ STA P10 
22e7 : a0 02 __ LDY #$02
22e9 : b1 23 __ LDA (SP + 0),y 
22eb : 8d f8 bf STA $bff8 ; (sstack + 0)
22ee : c8 __ __ INY
22ef : b1 23 __ LDA (SP + 0),y 
22f1 : 8d f9 bf STA $bff9 ; (sstack + 1)
22f4 : 18 __ __ CLC
22f5 : a5 23 __ LDA SP + 0 
22f7 : 69 04 __ ADC #$04
22f9 : 8d fa bf STA $bffa ; (sstack + 2)
22fc : a5 24 __ LDA SP + 1 
22fe : 69 00 __ ADC #$00
2300 : 8d fb bf STA $bffb ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s1000:
2303 : a5 53 __ LDA T7 + 0 
2305 : 8d dc bf STA $bfdc ; (sformat@stack + 0)
2308 : a5 54 __ LDA T7 + 1 
230a : 8d dd bf STA $bfdd ; (sformat@stack + 1)
230d : a5 55 __ LDA T7 + 2 
230f : 8d de bf STA $bfde ; (sformat@stack + 2)
.s0:
2312 : a9 00 __ LDA #$00
2314 : 85 47 __ STA T0 + 0 
2316 : ad f8 bf LDA $bff8 ; (sstack + 0)
2319 : 85 49 __ STA T1 + 0 
231b : ad f9 bf LDA $bff9 ; (sstack + 1)
231e : 85 4a __ STA T1 + 1 
.l1:
2320 : a0 00 __ LDY #$00
2322 : b1 49 __ LDA (T1 + 0),y 
2324 : d0 3c __ BNE $2362 ; (sformat.s2 + 0)
.s3:
2326 : a4 47 __ LDY T0 + 0 
2328 : 91 16 __ STA (P9),y ; (buff + 0)
232a : 98 __ __ TYA
232b : f0 1d __ BEQ $234a ; (sformat.s1070 + 0)
.s116:
232d : ad fc bf LDA $bffc ; (sstack + 4)
2330 : d0 0d __ BNE $233f ; (sformat.s119 + 0)
.s120:
2332 : 18 __ __ CLC
2333 : a5 16 __ LDA P9 ; (buff + 0)
2335 : 65 47 __ ADC T0 + 0 
2337 : aa __ __ TAX
2338 : a5 17 __ LDA P10 ; (buff + 1)
233a : 69 00 __ ADC #$00
233c : 4c 4e 23 JMP $234e ; (sformat.s1001 + 0)
.s119:
233f : a5 16 __ LDA P9 ; (buff + 0)
2341 : 85 0d __ STA P0 
2343 : a5 17 __ LDA P10 ; (buff + 1)
2345 : 85 0e __ STA P1 
2347 : 20 04 27 JSR $2704 ; (puts.s0 + 0)
.s1070:
234a : a5 17 __ LDA P10 ; (buff + 1)
234c : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
234e : 86 1b __ STX ACCU + 0 ; (fps + 0)
2350 : 85 1c __ STA ACCU + 1 ; (fps + 1)
2352 : ad dc bf LDA $bfdc ; (sformat@stack + 0)
2355 : 85 53 __ STA T7 + 0 
2357 : ad dd bf LDA $bfdd ; (sformat@stack + 1)
235a : 85 54 __ STA T7 + 1 
235c : ad de bf LDA $bfde ; (sformat@stack + 2)
235f : 85 55 __ STA T7 + 2 
2361 : 60 __ __ RTS
.s2:
2362 : c9 25 __ CMP #$25
2364 : f0 3f __ BEQ $23a5 ; (sformat.s4 + 0)
.s5:
2366 : a4 47 __ LDY T0 + 0 
2368 : 91 16 __ STA (P9),y ; (buff + 0)
236a : e6 49 __ INC T1 + 0 
236c : d0 02 __ BNE $2370 ; (sformat.s1098 + 0)
.s1097:
236e : e6 4a __ INC T1 + 1 
.s1098:
2370 : c8 __ __ INY
2371 : 84 47 __ STY T0 + 0 
2373 : 98 __ __ TYA
2374 : c0 28 __ CPY #$28
2376 : 90 a8 __ BCC $2320 ; (sformat.l1 + 0)
.s110:
2378 : 85 4c __ STA T5 + 0 
237a : a9 00 __ LDA #$00
237c : 85 47 __ STA T0 + 0 
237e : ad fc bf LDA $bffc ; (sstack + 4)
2381 : f0 14 __ BEQ $2397 ; (sformat.s114 + 0)
.s113:
2383 : a5 16 __ LDA P9 ; (buff + 0)
2385 : 85 0d __ STA P0 
2387 : a5 17 __ LDA P10 ; (buff + 1)
2389 : 85 0e __ STA P1 
238b : a9 00 __ LDA #$00
238d : a4 4c __ LDY T5 + 0 
238f : 91 16 __ STA (P9),y ; (buff + 0)
2391 : 20 04 27 JSR $2704 ; (puts.s0 + 0)
2394 : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s114:
2397 : 18 __ __ CLC
2398 : a5 16 __ LDA P9 ; (buff + 0)
239a : 65 4c __ ADC T5 + 0 
239c : 85 16 __ STA P9 ; (buff + 0)
239e : 90 80 __ BCC $2320 ; (sformat.l1 + 0)
.s1099:
23a0 : e6 17 __ INC P10 ; (buff + 1)
23a2 : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s4:
23a5 : a5 47 __ LDA T0 + 0 
23a7 : f0 27 __ BEQ $23d0 ; (sformat.s9 + 0)
.s7:
23a9 : 84 47 __ STY T0 + 0 
23ab : 85 4c __ STA T5 + 0 
23ad : ad fc bf LDA $bffc ; (sstack + 4)
23b0 : f0 13 __ BEQ $23c5 ; (sformat.s11 + 0)
.s10:
23b2 : a5 16 __ LDA P9 ; (buff + 0)
23b4 : 85 0d __ STA P0 
23b6 : a5 17 __ LDA P10 ; (buff + 1)
23b8 : 85 0e __ STA P1 
23ba : 98 __ __ TYA
23bb : a4 4c __ LDY T5 + 0 
23bd : 91 16 __ STA (P9),y ; (buff + 0)
23bf : 20 04 27 JSR $2704 ; (puts.s0 + 0)
23c2 : 4c d0 23 JMP $23d0 ; (sformat.s9 + 0)
.s11:
23c5 : 18 __ __ CLC
23c6 : a5 16 __ LDA P9 ; (buff + 0)
23c8 : 65 4c __ ADC T5 + 0 
23ca : 85 16 __ STA P9 ; (buff + 0)
23cc : 90 02 __ BCC $23d0 ; (sformat.s9 + 0)
.s1095:
23ce : e6 17 __ INC P10 ; (buff + 1)
.s9:
23d0 : a9 0a __ LDA #$0a
23d2 : 8d e3 bf STA $bfe3 ; (si + 3)
23d5 : a9 00 __ LDA #$00
23d7 : 8d e4 bf STA $bfe4 ; (si + 4)
23da : 8d e5 bf STA $bfe5 ; (si + 5)
23dd : 8d e6 bf STA $bfe6 ; (si + 6)
23e0 : 8d e7 bf STA $bfe7 ; (si + 7)
23e3 : a0 01 __ LDY #$01
23e5 : b1 49 __ LDA (T1 + 0),y 
23e7 : a2 20 __ LDX #$20
23e9 : 8e e0 bf STX $bfe0 ; (si + 0)
23ec : a2 00 __ LDX #$00
23ee : 8e e1 bf STX $bfe1 ; (si + 1)
23f1 : ca __ __ DEX
23f2 : 8e e2 bf STX $bfe2 ; (si + 2)
23f5 : aa __ __ TAX
23f6 : 18 __ __ CLC
23f7 : a5 49 __ LDA T1 + 0 
23f9 : 69 02 __ ADC #$02
.l14:
23fb : 85 49 __ STA T1 + 0 
23fd : 90 02 __ BCC $2401 ; (sformat.s1082 + 0)
.s1081:
23ff : e6 4a __ INC T1 + 1 
.s1082:
2401 : 8a __ __ TXA
2402 : e0 2b __ CPX #$2b
2404 : d0 08 __ BNE $240e ; (sformat.s17 + 0)
.s16:
2406 : a9 01 __ LDA #$01
2408 : 8d e5 bf STA $bfe5 ; (si + 5)
240b : 4c ef 26 JMP $26ef ; (sformat.s264 + 0)
.s17:
240e : c9 30 __ CMP #$30
2410 : d0 06 __ BNE $2418 ; (sformat.s20 + 0)
.s19:
2412 : 8d e0 bf STA $bfe0 ; (si + 0)
2415 : 4c ef 26 JMP $26ef ; (sformat.s264 + 0)
.s20:
2418 : c9 23 __ CMP #$23
241a : d0 08 __ BNE $2424 ; (sformat.s23 + 0)
.s22:
241c : a9 01 __ LDA #$01
241e : 8d e7 bf STA $bfe7 ; (si + 7)
2421 : 4c ef 26 JMP $26ef ; (sformat.s264 + 0)
.s23:
2424 : c9 2d __ CMP #$2d
2426 : d0 08 __ BNE $2430 ; (sformat.s15 + 0)
.s25:
2428 : a9 01 __ LDA #$01
242a : 8d e6 bf STA $bfe6 ; (si + 6)
242d : 4c ef 26 JMP $26ef ; (sformat.s264 + 0)
.s15:
2430 : 85 4c __ STA T5 + 0 
2432 : c9 30 __ CMP #$30
2434 : 90 55 __ BCC $248b ; (sformat.s31 + 0)
.s32:
2436 : c9 3a __ CMP #$3a
2438 : b0 51 __ BCS $248b ; (sformat.s31 + 0)
.s29:
243a : a9 00 __ LDA #$00
243c : 85 44 __ STA T6 + 0 
243e : 85 45 __ STA T6 + 1 
2440 : e0 3a __ CPX #$3a
2442 : b0 40 __ BCS $2484 ; (sformat.s35 + 0)
.l34:
2444 : a5 44 __ LDA T6 + 0 
2446 : 0a __ __ ASL
2447 : 85 1b __ STA ACCU + 0 ; (fps + 0)
2449 : a5 45 __ LDA T6 + 1 
244b : 2a __ __ ROL
244c : 06 1b __ ASL ACCU + 0 ; (fps + 0)
244e : 2a __ __ ROL
244f : aa __ __ TAX
2450 : 18 __ __ CLC
2451 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
2453 : 65 44 __ ADC T6 + 0 
2455 : 85 44 __ STA T6 + 0 
2457 : 8a __ __ TXA
2458 : 65 45 __ ADC T6 + 1 
245a : 06 44 __ ASL T6 + 0 
245c : 2a __ __ ROL
245d : aa __ __ TAX
245e : 18 __ __ CLC
245f : a5 44 __ LDA T6 + 0 
2461 : 65 4c __ ADC T5 + 0 
2463 : 90 01 __ BCC $2466 ; (sformat.s1092 + 0)
.s1091:
2465 : e8 __ __ INX
.s1092:
2466 : 38 __ __ SEC
2467 : e9 30 __ SBC #$30
2469 : 85 44 __ STA T6 + 0 
246b : 8a __ __ TXA
246c : e9 00 __ SBC #$00
246e : 85 45 __ STA T6 + 1 
2470 : a0 00 __ LDY #$00
2472 : b1 49 __ LDA (T1 + 0),y 
2474 : 85 4c __ STA T5 + 0 
2476 : e6 49 __ INC T1 + 0 
2478 : d0 02 __ BNE $247c ; (sformat.s1094 + 0)
.s1093:
247a : e6 4a __ INC T1 + 1 
.s1094:
247c : c9 30 __ CMP #$30
247e : 90 04 __ BCC $2484 ; (sformat.s35 + 0)
.s36:
2480 : c9 3a __ CMP #$3a
2482 : 90 c0 __ BCC $2444 ; (sformat.l34 + 0)
.s35:
2484 : a5 44 __ LDA T6 + 0 
2486 : 8d e1 bf STA $bfe1 ; (si + 1)
2489 : a5 4c __ LDA T5 + 0 
.s31:
248b : c9 2e __ CMP #$2e
248d : d0 51 __ BNE $24e0 ; (sformat.s39 + 0)
.s37:
248f : a9 00 __ LDA #$00
2491 : 85 44 __ STA T6 + 0 
.l243:
2493 : 85 45 __ STA T6 + 1 
2495 : a0 00 __ LDY #$00
2497 : b1 49 __ LDA (T1 + 0),y 
2499 : 85 4c __ STA T5 + 0 
249b : e6 49 __ INC T1 + 0 
249d : d0 02 __ BNE $24a1 ; (sformat.s1084 + 0)
.s1083:
249f : e6 4a __ INC T1 + 1 
.s1084:
24a1 : c9 30 __ CMP #$30
24a3 : 90 04 __ BCC $24a9 ; (sformat.s42 + 0)
.s43:
24a5 : c9 3a __ CMP #$3a
24a7 : 90 0a __ BCC $24b3 ; (sformat.s41 + 0)
.s42:
24a9 : a5 44 __ LDA T6 + 0 
24ab : 8d e2 bf STA $bfe2 ; (si + 2)
24ae : a5 4c __ LDA T5 + 0 
24b0 : 4c e0 24 JMP $24e0 ; (sformat.s39 + 0)
.s41:
24b3 : a5 44 __ LDA T6 + 0 
24b5 : 0a __ __ ASL
24b6 : 85 1b __ STA ACCU + 0 ; (fps + 0)
24b8 : a5 45 __ LDA T6 + 1 
24ba : 2a __ __ ROL
24bb : 06 1b __ ASL ACCU + 0 ; (fps + 0)
24bd : 2a __ __ ROL
24be : aa __ __ TAX
24bf : 18 __ __ CLC
24c0 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
24c2 : 65 44 __ ADC T6 + 0 
24c4 : 85 44 __ STA T6 + 0 
24c6 : 8a __ __ TXA
24c7 : 65 45 __ ADC T6 + 1 
24c9 : 06 44 __ ASL T6 + 0 
24cb : 2a __ __ ROL
24cc : aa __ __ TAX
24cd : 18 __ __ CLC
24ce : a5 44 __ LDA T6 + 0 
24d0 : 65 4c __ ADC T5 + 0 
24d2 : 90 01 __ BCC $24d5 ; (sformat.s1090 + 0)
.s1089:
24d4 : e8 __ __ INX
.s1090:
24d5 : 38 __ __ SEC
24d6 : e9 30 __ SBC #$30
24d8 : 85 44 __ STA T6 + 0 
24da : 8a __ __ TXA
24db : e9 00 __ SBC #$00
24dd : 4c 93 24 JMP $2493 ; (sformat.l243 + 0)
.s39:
24e0 : c9 64 __ CMP #$64
24e2 : f0 04 __ BEQ $24e8 ; (sformat.s44 + 0)
.s47:
24e4 : c9 44 __ CMP #$44
24e6 : d0 05 __ BNE $24ed ; (sformat.s45 + 0)
.s44:
24e8 : a9 01 __ LDA #$01
24ea : 4c b3 26 JMP $26b3 ; (sformat.s261 + 0)
.s45:
24ed : c9 75 __ CMP #$75
24ef : d0 03 __ BNE $24f4 ; (sformat.s51 + 0)
24f1 : 4c b1 26 JMP $26b1 ; (sformat.s291 + 0)
.s51:
24f4 : c9 55 __ CMP #$55
24f6 : d0 03 __ BNE $24fb ; (sformat.s49 + 0)
24f8 : 4c b1 26 JMP $26b1 ; (sformat.s291 + 0)
.s49:
24fb : c9 78 __ CMP #$78
24fd : f0 04 __ BEQ $2503 ; (sformat.s52 + 0)
.s55:
24ff : c9 58 __ CMP #$58
2501 : d0 0d __ BNE $2510 ; (sformat.s53 + 0)
.s52:
2503 : a9 10 __ LDA #$10
2505 : 8d e3 bf STA $bfe3 ; (si + 3)
2508 : a9 00 __ LDA #$00
250a : 8d e4 bf STA $bfe4 ; (si + 4)
250d : 4c b1 26 JMP $26b1 ; (sformat.s291 + 0)
.s53:
2510 : c9 6c __ CMP #$6c
2512 : d0 03 __ BNE $2517 ; (sformat.s59 + 0)
2514 : 4c 28 26 JMP $2628 ; (sformat.s56 + 0)
.s59:
2517 : c9 4c __ CMP #$4c
2519 : d0 03 __ BNE $251e ; (sformat.s57 + 0)
251b : 4c 28 26 JMP $2628 ; (sformat.s56 + 0)
.s57:
251e : c9 73 __ CMP #$73
2520 : f0 54 __ BEQ $2576 ; (sformat.s72 + 0)
.s75:
2522 : c9 53 __ CMP #$53
2524 : f0 50 __ BEQ $2576 ; (sformat.s72 + 0)
.s73:
2526 : c9 63 __ CMP #$63
2528 : f0 23 __ BEQ $254d ; (sformat.s103 + 0)
.s106:
252a : c9 43 __ CMP #$43
252c : f0 1f __ BEQ $254d ; (sformat.s103 + 0)
.s104:
252e : 09 00 __ ORA #$00
2530 : d0 03 __ BNE $2535 ; (sformat.s107 + 0)
2532 : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s107:
2535 : 18 __ __ CLC
2536 : a5 16 __ LDA P9 ; (buff + 0)
2538 : 65 47 __ ADC T0 + 0 
253a : 85 44 __ STA T6 + 0 
253c : a5 17 __ LDA P10 ; (buff + 1)
253e : 69 00 __ ADC #$00
2540 : 85 45 __ STA T6 + 1 
2542 : a5 4c __ LDA T5 + 0 
.s1068:
2544 : a0 00 __ LDY #$00
2546 : 91 44 __ STA (T6 + 0),y 
2548 : e6 47 __ INC T0 + 0 
254a : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s103:
254d : ad fa bf LDA $bffa ; (sstack + 2)
2550 : 85 4c __ STA T5 + 0 
2552 : 18 __ __ CLC
2553 : 69 02 __ ADC #$02
2555 : 8d fa bf STA $bffa ; (sstack + 2)
2558 : ad fb bf LDA $bffb ; (sstack + 3)
255b : 85 4d __ STA T5 + 1 
255d : 69 00 __ ADC #$00
255f : 8d fb bf STA $bffb ; (sstack + 3)
2562 : 18 __ __ CLC
2563 : a5 16 __ LDA P9 ; (buff + 0)
2565 : 65 47 __ ADC T0 + 0 
2567 : 85 44 __ STA T6 + 0 
2569 : a5 17 __ LDA P10 ; (buff + 1)
256b : 69 00 __ ADC #$00
256d : 85 45 __ STA T6 + 1 
256f : a0 00 __ LDY #$00
2571 : b1 4c __ LDA (T5 + 0),y 
2573 : 4c 44 25 JMP $2544 ; (sformat.s1068 + 0)
.s72:
2576 : ad fa bf LDA $bffa ; (sstack + 2)
2579 : 85 4c __ STA T5 + 0 
257b : 18 __ __ CLC
257c : 69 02 __ ADC #$02
257e : 8d fa bf STA $bffa ; (sstack + 2)
2581 : ad fb bf LDA $bffb ; (sstack + 3)
2584 : 85 4d __ STA T5 + 1 
2586 : 69 00 __ ADC #$00
2588 : 8d fb bf STA $bffb ; (sstack + 3)
258b : a0 00 __ LDY #$00
258d : 84 4b __ STY T3 + 0 
258f : b1 4c __ LDA (T5 + 0),y 
2591 : aa __ __ TAX
2592 : c8 __ __ INY
2593 : b1 4c __ LDA (T5 + 0),y 
2595 : 86 4c __ STX T5 + 0 
2597 : 85 4d __ STA T5 + 1 
2599 : ad e1 bf LDA $bfe1 ; (si + 1)
259c : f0 0c __ BEQ $25aa ; (sformat.s78 + 0)
.s1073:
259e : 88 __ __ DEY
259f : b1 4c __ LDA (T5 + 0),y 
25a1 : f0 05 __ BEQ $25a8 ; (sformat.s1074 + 0)
.l80:
25a3 : c8 __ __ INY
25a4 : b1 4c __ LDA (T5 + 0),y 
25a6 : d0 fb __ BNE $25a3 ; (sformat.l80 + 0)
.s1074:
25a8 : 84 4b __ STY T3 + 0 
.s78:
25aa : ad e6 bf LDA $bfe6 ; (si + 6)
25ad : d0 19 __ BNE $25c8 ; (sformat.s84 + 0)
.s1077:
25af : a6 4b __ LDX T3 + 0 
25b1 : ec e1 bf CPX $bfe1 ; (si + 1)
25b4 : a4 47 __ LDY T0 + 0 
25b6 : b0 0c __ BCS $25c4 ; (sformat.s1078 + 0)
.l86:
25b8 : ad e0 bf LDA $bfe0 ; (si + 0)
25bb : 91 16 __ STA (P9),y ; (buff + 0)
25bd : e8 __ __ INX
25be : ec e1 bf CPX $bfe1 ; (si + 1)
25c1 : c8 __ __ INY
25c2 : 90 f4 __ BCC $25b8 ; (sformat.l86 + 0)
.s1078:
25c4 : 86 4b __ STX T3 + 0 
25c6 : 84 47 __ STY T0 + 0 
.s84:
25c8 : ad fc bf LDA $bffc ; (sstack + 4)
25cb : d0 37 __ BNE $2604 ; (sformat.s88 + 0)
.l94:
25cd : a0 00 __ LDY #$00
25cf : b1 4c __ LDA (T5 + 0),y 
25d1 : f0 0f __ BEQ $25e2 ; (sformat.s251 + 0)
.s95:
25d3 : a4 47 __ LDY T0 + 0 
25d5 : 91 16 __ STA (P9),y ; (buff + 0)
25d7 : e6 47 __ INC T0 + 0 
25d9 : e6 4c __ INC T5 + 0 
25db : d0 f0 __ BNE $25cd ; (sformat.l94 + 0)
.s1087:
25dd : e6 4d __ INC T5 + 1 
25df : 4c cd 25 JMP $25cd ; (sformat.l94 + 0)
.s251:
25e2 : ad e6 bf LDA $bfe6 ; (si + 6)
25e5 : d0 03 __ BNE $25ea ; (sformat.s1075 + 0)
25e7 : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s1075:
25ea : a6 4b __ LDX T3 + 0 
25ec : ec e1 bf CPX $bfe1 ; (si + 1)
25ef : a4 47 __ LDY T0 + 0 
25f1 : b0 0c __ BCS $25ff ; (sformat.s1076 + 0)
.l101:
25f3 : ad e0 bf LDA $bfe0 ; (si + 0)
25f6 : 91 16 __ STA (P9),y ; (buff + 0)
25f8 : e8 __ __ INX
25f9 : ec e1 bf CPX $bfe1 ; (si + 1)
25fc : c8 __ __ INY
25fd : 90 f4 __ BCC $25f3 ; (sformat.l101 + 0)
.s1076:
25ff : 84 47 __ STY T0 + 0 
2601 : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s88:
2604 : a5 47 __ LDA T0 + 0 
2606 : f0 1a __ BEQ $2622 ; (sformat.s93 + 0)
.s91:
2608 : a5 16 __ LDA P9 ; (buff + 0)
260a : 85 0d __ STA P0 
260c : a5 17 __ LDA P10 ; (buff + 1)
260e : 85 0e __ STA P1 
2610 : a9 00 __ LDA #$00
2612 : a4 47 __ LDY T0 + 0 
2614 : 91 16 __ STA (P9),y ; (buff + 0)
2616 : 20 04 27 JSR $2704 ; (puts.s0 + 0)
2619 : 20 fc 26 JSR $26fc ; (puts@proxy + 0)
261c : a9 00 __ LDA #$00
261e : 85 47 __ STA T0 + 0 
2620 : f0 c0 __ BEQ $25e2 ; (sformat.s251 + 0)
.s93:
2622 : 20 fc 26 JSR $26fc ; (puts@proxy + 0)
2625 : 4c e2 25 JMP $25e2 ; (sformat.s251 + 0)
.s56:
2628 : ad fa bf LDA $bffa ; (sstack + 2)
262b : 85 4c __ STA T5 + 0 
262d : 18 __ __ CLC
262e : 69 04 __ ADC #$04
2630 : 8d fa bf STA $bffa ; (sstack + 2)
2633 : ad fb bf LDA $bffb ; (sstack + 3)
2636 : 85 4d __ STA T5 + 1 
2638 : 69 00 __ ADC #$00
263a : 8d fb bf STA $bffb ; (sstack + 3)
263d : a0 00 __ LDY #$00
263f : b1 49 __ LDA (T1 + 0),y 
2641 : aa __ __ TAX
2642 : e6 49 __ INC T1 + 0 
2644 : d0 02 __ BNE $2648 ; (sformat.s1086 + 0)
.s1085:
2646 : e6 4a __ INC T1 + 1 
.s1086:
2648 : b1 4c __ LDA (T5 + 0),y 
264a : 85 53 __ STA T7 + 0 
264c : a0 01 __ LDY #$01
264e : b1 4c __ LDA (T5 + 0),y 
2650 : 85 54 __ STA T7 + 1 
2652 : c8 __ __ INY
2653 : b1 4c __ LDA (T5 + 0),y 
2655 : 85 55 __ STA T7 + 2 
2657 : c8 __ __ INY
2658 : b1 4c __ LDA (T5 + 0),y 
265a : a8 __ __ TAY
265b : 8a __ __ TXA
265c : e0 64 __ CPX #$64
265e : f0 04 __ BEQ $2664 ; (sformat.s60 + 0)
.s63:
2660 : c9 44 __ CMP #$44
2662 : d0 04 __ BNE $2668 ; (sformat.s61 + 0)
.s60:
2664 : a9 01 __ LDA #$01
2666 : d0 1f __ BNE $2687 ; (sformat.s262 + 0)
.s61:
2668 : c9 75 __ CMP #$75
266a : f0 19 __ BEQ $2685 ; (sformat.s292 + 0)
.s67:
266c : c9 55 __ CMP #$55
266e : f0 15 __ BEQ $2685 ; (sformat.s292 + 0)
.s65:
2670 : c9 78 __ CMP #$78
2672 : f0 07 __ BEQ $267b ; (sformat.s68 + 0)
.s71:
2674 : c9 58 __ CMP #$58
2676 : f0 03 __ BEQ $267b ; (sformat.s68 + 0)
2678 : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s68:
267b : a9 10 __ LDA #$10
267d : 8d e3 bf STA $bfe3 ; (si + 3)
2680 : a9 00 __ LDA #$00
2682 : 8d e4 bf STA $bfe4 ; (si + 4)
.s292:
2685 : a9 00 __ LDA #$00
.s262:
2687 : 84 14 __ STY P7 
2689 : 85 15 __ STA P8 
268b : a5 16 __ LDA P9 ; (buff + 0)
268d : 85 0f __ STA P2 
268f : a5 17 __ LDA P10 ; (buff + 1)
2691 : 85 10 __ STA P3 
2693 : a5 53 __ LDA T7 + 0 
2695 : 85 11 __ STA P4 
2697 : a5 54 __ LDA T7 + 1 
2699 : 85 12 __ STA P5 
269b : a5 55 __ LDA T7 + 2 
269d : 85 13 __ STA P6 
269f : a9 e0 __ LDA #$e0
26a1 : 85 0d __ STA P0 
26a3 : a9 bf __ LDA #$bf
26a5 : 85 0e __ STA P1 
26a7 : 20 8e 28 JSR $288e ; (nforml.s0 + 0)
.s1069:
26aa : a5 1b __ LDA ACCU + 0 ; (fps + 0)
26ac : 85 47 __ STA T0 + 0 
26ae : 4c 20 23 JMP $2320 ; (sformat.l1 + 0)
.s291:
26b1 : a9 00 __ LDA #$00
.s261:
26b3 : 85 13 __ STA P6 
26b5 : a5 16 __ LDA P9 ; (buff + 0)
26b7 : 85 0f __ STA P2 
26b9 : a5 17 __ LDA P10 ; (buff + 1)
26bb : 85 10 __ STA P3 
26bd : ad fa bf LDA $bffa ; (sstack + 2)
26c0 : 85 47 __ STA T0 + 0 
26c2 : ad fb bf LDA $bffb ; (sstack + 3)
26c5 : 85 48 __ STA T0 + 1 
26c7 : a0 00 __ LDY #$00
26c9 : b1 47 __ LDA (T0 + 0),y 
26cb : 85 11 __ STA P4 
26cd : c8 __ __ INY
26ce : b1 47 __ LDA (T0 + 0),y 
26d0 : 85 12 __ STA P5 
26d2 : 18 __ __ CLC
26d3 : a5 47 __ LDA T0 + 0 
26d5 : 69 02 __ ADC #$02
26d7 : 8d fa bf STA $bffa ; (sstack + 2)
26da : a5 48 __ LDA T0 + 1 
26dc : 69 00 __ ADC #$00
26de : 8d fb bf STA $bffb ; (sstack + 3)
26e1 : a9 e0 __ LDA #$e0
26e3 : 85 0d __ STA P0 
26e5 : a9 bf __ LDA #$bf
26e7 : 85 0e __ STA P1 
26e9 : 20 59 27 JSR $2759 ; (nformi.s0 + 0)
26ec : 4c aa 26 JMP $26aa ; (sformat.s1069 + 0)
.s264:
26ef : a0 00 __ LDY #$00
26f1 : b1 49 __ LDA (T1 + 0),y 
26f3 : aa __ __ TAX
26f4 : 18 __ __ CLC
26f5 : a5 49 __ LDA T1 + 0 
26f7 : 69 01 __ ADC #$01
26f9 : 4c fb 23 JMP $23fb ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
26fc : a5 4c __ LDA $4c 
26fe : 85 0d __ STA P0 
2700 : a5 4d __ LDA $4d 
2702 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2704 : a0 00 __ LDY #$00
2706 : b1 0d __ LDA (P0),y 
2708 : f0 0b __ BEQ $2715 ; (puts.s1001 + 0)
270a : 20 16 27 JSR $2716 ; (putpch + 0)
270d : e6 0d __ INC P0 
270f : d0 f3 __ BNE $2704 ; (puts.s0 + 0)
2711 : e6 0e __ INC P1 
2713 : d0 ef __ BNE $2704 ; (puts.s0 + 0)
.s1001:
2715 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
2716 : ae fe 46 LDX $46fe ; (giocharmap + 0)
2719 : e0 01 __ CPX #$01
271b : 90 26 __ BCC $2743 ; (putpch + 45)
271d : c9 0a __ CMP #$0a
271f : d0 02 __ BNE $2723 ; (putpch + 13)
2721 : a9 0d __ LDA #$0d
2723 : c9 09 __ CMP #$09
2725 : f0 1f __ BEQ $2746 ; (putpch + 48)
2727 : e0 02 __ CPX #$02
2729 : 90 18 __ BCC $2743 ; (putpch + 45)
272b : c9 41 __ CMP #$41
272d : 90 14 __ BCC $2743 ; (putpch + 45)
272f : c9 7b __ CMP #$7b
2731 : b0 10 __ BCS $2743 ; (putpch + 45)
2733 : c9 61 __ CMP #$61
2735 : b0 04 __ BCS $273b ; (putpch + 37)
2737 : c9 5b __ CMP #$5b
2739 : b0 08 __ BCS $2743 ; (putpch + 45)
273b : 49 20 __ EOR #$20
273d : e0 03 __ CPX #$03
273f : f0 02 __ BEQ $2743 ; (putpch + 45)
2741 : 29 df __ AND #$df
2743 : 4c d2 ff JMP $ffd2 
2746 : 38 __ __ SEC
2747 : 20 f0 ff JSR $fff0 
274a : 98 __ __ TYA
274b : 29 03 __ AND #$03
274d : 49 03 __ EOR #$03
274f : aa __ __ TAX
2750 : a9 20 __ LDA #$20
2752 : 20 d2 ff JSR $ffd2 
2755 : ca __ __ DEX
2756 : 10 fa __ BPL $2752 ; (putpch + 60)
2758 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
2759 : a9 00 __ LDA #$00
275b : 85 43 __ STA T0 + 0 
275d : a5 13 __ LDA P6 ; (s + 0)
275f : f0 13 __ BEQ $2774 ; (nformi.s182 + 0)
.s4:
2761 : 24 12 __ BIT P5 ; (v + 1)
2763 : 10 0f __ BPL $2774 ; (nformi.s182 + 0)
.s1:
2765 : 38 __ __ SEC
2766 : a9 00 __ LDA #$00
2768 : e5 11 __ SBC P4 ; (v + 0)
276a : 85 11 __ STA P4 ; (v + 0)
276c : a9 00 __ LDA #$00
276e : e5 12 __ SBC P5 ; (v + 1)
2770 : 85 12 __ STA P5 ; (v + 1)
2772 : e6 43 __ INC T0 + 0 
.s182:
2774 : a9 10 __ LDA #$10
2776 : 85 44 __ STA T2 + 0 
2778 : a5 11 __ LDA P4 ; (v + 0)
277a : 05 12 __ ORA P5 ; (v + 1)
277c : f0 46 __ BEQ $27c4 ; (nformi.s7 + 0)
.s42:
277e : a0 03 __ LDY #$03
2780 : b1 0d __ LDA (P0),y ; (si + 0)
2782 : 85 45 __ STA T4 + 0 
2784 : c8 __ __ INY
2785 : b1 0d __ LDA (P0),y ; (si + 0)
2787 : 85 46 __ STA T4 + 1 
.l6:
2789 : a5 11 __ LDA P4 ; (v + 0)
278b : 85 1b __ STA ACCU + 0 
278d : a5 12 __ LDA P5 ; (v + 1)
278f : 85 1c __ STA ACCU + 1 
2791 : a5 45 __ LDA T4 + 0 
2793 : 85 03 __ STA WORK + 0 
2795 : a5 46 __ LDA T4 + 1 
2797 : 85 04 __ STA WORK + 1 
2799 : 20 e6 4c JSR $4ce6 ; (divmod + 0)
279c : a5 06 __ LDA WORK + 3 
279e : 30 08 __ BMI $27a8 ; (nformi.s78 + 0)
.s1019:
27a0 : d0 0a __ BNE $27ac ; (nformi.s77 + 0)
.s1018:
27a2 : a5 05 __ LDA WORK + 2 
27a4 : c9 0a __ CMP #$0a
27a6 : b0 04 __ BCS $27ac ; (nformi.s77 + 0)
.s78:
27a8 : a9 30 __ LDA #$30
27aa : d0 02 __ BNE $27ae ; (nformi.s79 + 0)
.s77:
27ac : a9 37 __ LDA #$37
.s79:
27ae : 18 __ __ CLC
27af : 65 05 __ ADC WORK + 2 
27b1 : c6 44 __ DEC T2 + 0 
27b3 : a6 44 __ LDX T2 + 0 
27b5 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
27b8 : a5 1b __ LDA ACCU + 0 
27ba : 85 11 __ STA P4 ; (v + 0)
27bc : a5 1c __ LDA ACCU + 1 
27be : 85 12 __ STA P5 ; (v + 1)
27c0 : 05 11 __ ORA P4 ; (v + 0)
27c2 : d0 c5 __ BNE $2789 ; (nformi.l6 + 0)
.s7:
27c4 : a0 02 __ LDY #$02
27c6 : b1 0d __ LDA (P0),y ; (si + 0)
27c8 : c9 ff __ CMP #$ff
27ca : d0 04 __ BNE $27d0 ; (nformi.s80 + 0)
.s81:
27cc : a9 0f __ LDA #$0f
27ce : d0 05 __ BNE $27d5 ; (nformi.s1026 + 0)
.s80:
27d0 : 38 __ __ SEC
27d1 : a9 10 __ LDA #$10
27d3 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
27d5 : a8 __ __ TAY
27d6 : c4 44 __ CPY T2 + 0 
27d8 : b0 0d __ BCS $27e7 ; (nformi.s10 + 0)
.s9:
27da : a9 30 __ LDA #$30
.l1027:
27dc : c6 44 __ DEC T2 + 0 
27de : a6 44 __ LDX T2 + 0 
27e0 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
27e3 : c4 44 __ CPY T2 + 0 
27e5 : 90 f5 __ BCC $27dc ; (nformi.l1027 + 0)
.s10:
27e7 : a0 07 __ LDY #$07
27e9 : b1 0d __ LDA (P0),y ; (si + 0)
27eb : f0 20 __ BEQ $280d ; (nformi.s13 + 0)
.s14:
27ed : a0 04 __ LDY #$04
27ef : b1 0d __ LDA (P0),y ; (si + 0)
27f1 : d0 1a __ BNE $280d ; (nformi.s13 + 0)
.s1013:
27f3 : 88 __ __ DEY
27f4 : b1 0d __ LDA (P0),y ; (si + 0)
27f6 : c9 10 __ CMP #$10
27f8 : d0 13 __ BNE $280d ; (nformi.s13 + 0)
.s11:
27fa : a9 58 __ LDA #$58
27fc : a6 44 __ LDX T2 + 0 
27fe : 9d e7 bf STA $bfe7,x ; (si + 7)
2801 : 8a __ __ TXA
2802 : 18 __ __ CLC
2803 : 69 fe __ ADC #$fe
2805 : 85 44 __ STA T2 + 0 
2807 : aa __ __ TAX
2808 : a9 30 __ LDA #$30
280a : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s13:
280d : a9 00 __ LDA #$00
280f : 85 1b __ STA ACCU + 0 
2811 : a5 43 __ LDA T0 + 0 
2813 : f0 06 __ BEQ $281b ; (nformi.s16 + 0)
.s15:
2815 : c6 44 __ DEC T2 + 0 
2817 : a9 2d __ LDA #$2d
2819 : d0 0a __ BNE $2825 ; (nformi.s1025 + 0)
.s16:
281b : a0 05 __ LDY #$05
281d : b1 0d __ LDA (P0),y ; (si + 0)
281f : f0 09 __ BEQ $282a ; (nformi.s163 + 0)
.s18:
2821 : c6 44 __ DEC T2 + 0 
2823 : a9 2b __ LDA #$2b
.s1025:
2825 : a6 44 __ LDX T2 + 0 
2827 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s163:
282a : a0 06 __ LDY #$06
282c : b1 0d __ LDA (P0),y ; (si + 0)
282e : d0 33 __ BNE $2863 ; (nformi.s24 + 0)
.l30:
2830 : a0 01 __ LDY #$01
2832 : b1 0d __ LDA (P0),y ; (si + 0)
2834 : 18 __ __ CLC
2835 : 65 44 __ ADC T2 + 0 
2837 : b0 04 __ BCS $283d ; (nformi.s31 + 0)
.s1006:
2839 : c9 11 __ CMP #$11
283b : 90 0d __ BCC $284a ; (nformi.s33 + 0)
.s31:
283d : c6 44 __ DEC T2 + 0 
283f : a0 00 __ LDY #$00
2841 : b1 0d __ LDA (P0),y ; (si + 0)
2843 : a6 44 __ LDX T2 + 0 
2845 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
2848 : b0 e6 __ BCS $2830 ; (nformi.l30 + 0)
.s33:
284a : a6 44 __ LDX T2 + 0 
284c : e0 10 __ CPX #$10
284e : b0 0e __ BCS $285e ; (nformi.s23 + 0)
.s34:
2850 : 88 __ __ DEY
.l1022:
2851 : bd e8 bf LDA $bfe8,x ; (buffer + 0)
2854 : 91 0f __ STA (P2),y ; (str + 0)
2856 : e8 __ __ INX
2857 : e0 10 __ CPX #$10
2859 : c8 __ __ INY
285a : 90 f5 __ BCC $2851 ; (nformi.l1022 + 0)
.s1023:
285c : 84 1b __ STY ACCU + 0 
.s23:
285e : a9 00 __ LDA #$00
2860 : 85 1c __ STA ACCU + 1 
.s1001:
2862 : 60 __ __ RTS
.s24:
2863 : a6 44 __ LDX T2 + 0 
2865 : e0 10 __ CPX #$10
2867 : b0 1a __ BCS $2883 ; (nformi.l27 + 0)
.s25:
2869 : a0 00 __ LDY #$00
.l1020:
286b : bd e8 bf LDA $bfe8,x ; (buffer + 0)
286e : 91 0f __ STA (P2),y ; (str + 0)
2870 : e8 __ __ INX
2871 : e0 10 __ CPX #$10
2873 : c8 __ __ INY
2874 : 90 f5 __ BCC $286b ; (nformi.l1020 + 0)
.s1021:
2876 : 84 1b __ STY ACCU + 0 
2878 : b0 09 __ BCS $2883 ; (nformi.l27 + 0)
.s28:
287a : 88 __ __ DEY
287b : b1 0d __ LDA (P0),y ; (si + 0)
287d : a4 1b __ LDY ACCU + 0 
287f : 91 0f __ STA (P2),y ; (str + 0)
2881 : e6 1b __ INC ACCU + 0 
.l27:
2883 : a5 1b __ LDA ACCU + 0 
2885 : a0 01 __ LDY #$01
2887 : d1 0d __ CMP (P0),y ; (si + 0)
2889 : 90 ef __ BCC $287a ; (nformi.s28 + 0)
288b : 4c 5e 28 JMP $285e ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
288e : a9 00 __ LDA #$00
2890 : 85 43 __ STA T0 + 0 
2892 : a5 15 __ LDA P8 ; (s + 0)
2894 : f0 21 __ BEQ $28b7 ; (nforml.s182 + 0)
.s4:
2896 : a5 14 __ LDA P7 ; (v + 3)
2898 : f0 1d __ BEQ $28b7 ; (nforml.s182 + 0)
.s1032:
289a : 10 1b __ BPL $28b7 ; (nforml.s182 + 0)
.s1:
289c : 38 __ __ SEC
289d : a9 00 __ LDA #$00
289f : e5 11 __ SBC P4 ; (v + 0)
28a1 : 85 11 __ STA P4 ; (v + 0)
28a3 : a9 00 __ LDA #$00
28a5 : e5 12 __ SBC P5 ; (v + 1)
28a7 : 85 12 __ STA P5 ; (v + 1)
28a9 : a9 00 __ LDA #$00
28ab : e5 13 __ SBC P6 ; (v + 2)
28ad : 85 13 __ STA P6 ; (v + 2)
28af : a9 00 __ LDA #$00
28b1 : e5 14 __ SBC P7 ; (v + 3)
28b3 : 85 14 __ STA P7 ; (v + 3)
28b5 : e6 43 __ INC T0 + 0 
.s182:
28b7 : a9 10 __ LDA #$10
28b9 : 85 44 __ STA T2 + 0 
28bb : a5 14 __ LDA P7 ; (v + 3)
28bd : d0 0c __ BNE $28cb ; (nforml.s42 + 0)
.s1024:
28bf : a5 13 __ LDA P6 ; (v + 2)
28c1 : d0 08 __ BNE $28cb ; (nforml.s42 + 0)
.s1025:
28c3 : a5 12 __ LDA P5 ; (v + 1)
28c5 : d0 04 __ BNE $28cb ; (nforml.s42 + 0)
.s1026:
28c7 : c5 11 __ CMP P4 ; (v + 0)
28c9 : b0 0e __ BCS $28d9 ; (nforml.s7 + 0)
.s42:
28cb : a0 03 __ LDY #$03
28cd : b1 0d __ LDA (P0),y ; (si + 0)
28cf : 85 45 __ STA T5 + 0 
28d1 : c8 __ __ INY
28d2 : b1 0d __ LDA (P0),y ; (si + 0)
28d4 : 85 46 __ STA T5 + 1 
28d6 : 4c a3 29 JMP $29a3 ; (nforml.l6 + 0)
.s7:
28d9 : a0 02 __ LDY #$02
28db : b1 0d __ LDA (P0),y ; (si + 0)
28dd : c9 ff __ CMP #$ff
28df : d0 04 __ BNE $28e5 ; (nforml.s80 + 0)
.s81:
28e1 : a9 0f __ LDA #$0f
28e3 : d0 05 __ BNE $28ea ; (nforml.s1039 + 0)
.s80:
28e5 : 38 __ __ SEC
28e6 : a9 10 __ LDA #$10
28e8 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
28ea : a8 __ __ TAY
28eb : c4 44 __ CPY T2 + 0 
28ed : b0 0d __ BCS $28fc ; (nforml.s10 + 0)
.s9:
28ef : a9 30 __ LDA #$30
.l1040:
28f1 : c6 44 __ DEC T2 + 0 
28f3 : a6 44 __ LDX T2 + 0 
28f5 : 9d e8 bf STA $bfe8,x ; (buffer + 0)
28f8 : c4 44 __ CPY T2 + 0 
28fa : 90 f5 __ BCC $28f1 ; (nforml.l1040 + 0)
.s10:
28fc : a0 07 __ LDY #$07
28fe : b1 0d __ LDA (P0),y ; (si + 0)
2900 : f0 20 __ BEQ $2922 ; (nforml.s13 + 0)
.s14:
2902 : a0 04 __ LDY #$04
2904 : b1 0d __ LDA (P0),y ; (si + 0)
2906 : d0 1a __ BNE $2922 ; (nforml.s13 + 0)
.s1013:
2908 : 88 __ __ DEY
2909 : b1 0d __ LDA (P0),y ; (si + 0)
290b : c9 10 __ CMP #$10
290d : d0 13 __ BNE $2922 ; (nforml.s13 + 0)
.s11:
290f : a9 58 __ LDA #$58
2911 : a6 44 __ LDX T2 + 0 
2913 : 9d e7 bf STA $bfe7,x ; (si + 7)
2916 : 8a __ __ TXA
2917 : 18 __ __ CLC
2918 : 69 fe __ ADC #$fe
291a : 85 44 __ STA T2 + 0 
291c : aa __ __ TAX
291d : a9 30 __ LDA #$30
291f : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s13:
2922 : a9 00 __ LDA #$00
2924 : 85 1b __ STA ACCU + 0 
2926 : a5 43 __ LDA T0 + 0 
2928 : f0 06 __ BEQ $2930 ; (nforml.s16 + 0)
.s15:
292a : c6 44 __ DEC T2 + 0 
292c : a9 2d __ LDA #$2d
292e : d0 0a __ BNE $293a ; (nforml.s1038 + 0)
.s16:
2930 : a0 05 __ LDY #$05
2932 : b1 0d __ LDA (P0),y ; (si + 0)
2934 : f0 09 __ BEQ $293f ; (nforml.s163 + 0)
.s18:
2936 : c6 44 __ DEC T2 + 0 
2938 : a9 2b __ LDA #$2b
.s1038:
293a : a6 44 __ LDX T2 + 0 
293c : 9d e8 bf STA $bfe8,x ; (buffer + 0)
.s163:
293f : a0 06 __ LDY #$06
2941 : b1 0d __ LDA (P0),y ; (si + 0)
2943 : d0 33 __ BNE $2978 ; (nforml.s24 + 0)
.l30:
2945 : a0 01 __ LDY #$01
2947 : b1 0d __ LDA (P0),y ; (si + 0)
2949 : 18 __ __ CLC
294a : 65 44 __ ADC T2 + 0 
294c : b0 04 __ BCS $2952 ; (nforml.s31 + 0)
.s1006:
294e : c9 11 __ CMP #$11
2950 : 90 0d __ BCC $295f ; (nforml.s33 + 0)
.s31:
2952 : c6 44 __ DEC T2 + 0 
2954 : a0 00 __ LDY #$00
2956 : b1 0d __ LDA (P0),y ; (si + 0)
2958 : a6 44 __ LDX T2 + 0 
295a : 9d e8 bf STA $bfe8,x ; (buffer + 0)
295d : b0 e6 __ BCS $2945 ; (nforml.l30 + 0)
.s33:
295f : a6 44 __ LDX T2 + 0 
2961 : e0 10 __ CPX #$10
2963 : b0 0e __ BCS $2973 ; (nforml.s23 + 0)
.s34:
2965 : 88 __ __ DEY
.l1035:
2966 : bd e8 bf LDA $bfe8,x ; (buffer + 0)
2969 : 91 0f __ STA (P2),y ; (str + 0)
296b : e8 __ __ INX
296c : e0 10 __ CPX #$10
296e : c8 __ __ INY
296f : 90 f5 __ BCC $2966 ; (nforml.l1035 + 0)
.s1036:
2971 : 84 1b __ STY ACCU + 0 
.s23:
2973 : a9 00 __ LDA #$00
2975 : 85 1c __ STA ACCU + 1 
.s1001:
2977 : 60 __ __ RTS
.s24:
2978 : a6 44 __ LDX T2 + 0 
297a : e0 10 __ CPX #$10
297c : b0 1a __ BCS $2998 ; (nforml.l27 + 0)
.s25:
297e : a0 00 __ LDY #$00
.l1033:
2980 : bd e8 bf LDA $bfe8,x ; (buffer + 0)
2983 : 91 0f __ STA (P2),y ; (str + 0)
2985 : e8 __ __ INX
2986 : e0 10 __ CPX #$10
2988 : c8 __ __ INY
2989 : 90 f5 __ BCC $2980 ; (nforml.l1033 + 0)
.s1034:
298b : 84 1b __ STY ACCU + 0 
298d : b0 09 __ BCS $2998 ; (nforml.l27 + 0)
.s28:
298f : 88 __ __ DEY
2990 : b1 0d __ LDA (P0),y ; (si + 0)
2992 : a4 1b __ LDY ACCU + 0 
2994 : 91 0f __ STA (P2),y ; (str + 0)
2996 : e6 1b __ INC ACCU + 0 
.l27:
2998 : a5 1b __ LDA ACCU + 0 
299a : a0 01 __ LDY #$01
299c : d1 0d __ CMP (P0),y ; (si + 0)
299e : 90 ef __ BCC $298f ; (nforml.s28 + 0)
29a0 : 4c 73 29 JMP $2973 ; (nforml.s23 + 0)
.l6:
29a3 : a5 11 __ LDA P4 ; (v + 0)
29a5 : 85 1b __ STA ACCU + 0 
29a7 : a5 12 __ LDA P5 ; (v + 1)
29a9 : 85 1c __ STA ACCU + 1 
29ab : a5 13 __ LDA P6 ; (v + 2)
29ad : 85 1d __ STA ACCU + 2 
29af : a5 14 __ LDA P7 ; (v + 3)
29b1 : 85 1e __ STA ACCU + 3 
29b3 : a5 45 __ LDA T5 + 0 
29b5 : 85 03 __ STA WORK + 0 
29b7 : a5 46 __ LDA T5 + 1 
29b9 : 85 04 __ STA WORK + 1 
29bb : a9 00 __ LDA #$00
29bd : 85 05 __ STA WORK + 2 
29bf : 85 06 __ STA WORK + 3 
29c1 : 20 6b 4d JSR $4d6b ; (divmod32 + 0)
29c4 : a5 08 __ LDA WORK + 5 
29c6 : 30 08 __ BMI $29d0 ; (nforml.s78 + 0)
.s1023:
29c8 : d0 0a __ BNE $29d4 ; (nforml.s77 + 0)
.s1022:
29ca : a5 07 __ LDA WORK + 4 
29cc : c9 0a __ CMP #$0a
29ce : b0 04 __ BCS $29d4 ; (nforml.s77 + 0)
.s78:
29d0 : a9 30 __ LDA #$30
29d2 : d0 02 __ BNE $29d6 ; (nforml.s79 + 0)
.s77:
29d4 : a9 37 __ LDA #$37
.s79:
29d6 : 18 __ __ CLC
29d7 : 65 07 __ ADC WORK + 4 
29d9 : c6 44 __ DEC T2 + 0 
29db : a6 44 __ LDX T2 + 0 
29dd : 9d e8 bf STA $bfe8,x ; (buffer + 0)
29e0 : a5 1b __ LDA ACCU + 0 
29e2 : 85 11 __ STA P4 ; (v + 0)
29e4 : a5 1c __ LDA ACCU + 1 
29e6 : 85 12 __ STA P5 ; (v + 1)
29e8 : a5 1d __ LDA ACCU + 2 
29ea : 85 13 __ STA P6 ; (v + 2)
29ec : a5 1e __ LDA ACCU + 3 
29ee : 85 14 __ STA P7 ; (v + 3)
29f0 : d0 b1 __ BNE $29a3 ; (nforml.l6 + 0)
.s1018:
29f2 : a5 13 __ LDA P6 ; (v + 2)
29f4 : d0 ad __ BNE $29a3 ; (nforml.l6 + 0)
.s1019:
29f6 : a5 12 __ LDA P5 ; (v + 1)
29f8 : d0 a9 __ BNE $29a3 ; (nforml.l6 + 0)
.s1020:
29fa : c5 11 __ CMP P4 ; (v + 0)
29fc : 90 a5 __ BCC $29a3 ; (nforml.l6 + 0)
29fe : 4c d9 28 JMP $28d9 ; (nforml.s7 + 0)
--------------------------------------------------------------------
2a01 : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
2a11 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
2a21 : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
load_overlay: ; load_overlay(const u8*)->void
.s1000:
2a2b : 38 __ __ SEC
2a2c : a5 23 __ LDA SP + 0 
2a2e : e9 06 __ SBC #$06
2a30 : 85 23 __ STA SP + 0 
2a32 : b0 02 __ BCS $2a36 ; (load_overlay.s0 + 0)
2a34 : c6 24 __ DEC SP + 1 
.s0:
2a36 : a9 00 __ LDA #$00
2a38 : 85 0d __ STA P0 
2a3a : 85 0e __ STA P1 
2a3c : 20 a3 2a JSR $2aa3 ; (krnio_setbnk.s0 + 0)
2a3f : a9 92 __ LDA #$92
2a41 : 85 0d __ STA P0 
2a43 : a9 2a __ LDA #$2a
2a45 : 85 0e __ STA P1 
2a47 : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
2a4a : a9 01 __ LDA #$01
2a4c : 85 0d __ STA P0 
2a4e : 85 0f __ STA P2 
2a50 : ad de 50 LDA $50de ; (bootdevice + 0)
2a53 : 85 0e __ STA P1 
2a55 : 20 c0 2a JSR $2ac0 ; (krnio_load.s0 + 0)
2a58 : 09 00 __ ORA #$00
2a5a : d0 2a __ BNE $2a86 ; (load_overlay.s1001 + 0)
.s1:
2a5c : a9 dd __ LDA #$dd
2a5e : a0 02 __ LDY #$02
2a60 : 91 23 __ STA (SP + 0),y 
2a62 : a9 2a __ LDA #$2a
2a64 : c8 __ __ INY
2a65 : 91 23 __ STA (SP + 0),y 
2a67 : 20 da 22 JSR $22da ; (printf.s0 + 0)
2a6a : a9 00 __ LDA #$00
2a6c : a0 02 __ LDY #$02
2a6e : 91 23 __ STA (SP + 0),y 
2a70 : a9 2b __ LDA #$2b
2a72 : c8 __ __ INY
2a73 : 91 23 __ STA (SP + 0),y 
2a75 : ad e0 50 LDA $50e0 ; (krnio_pstatus + 1)
2a78 : c8 __ __ INY
2a79 : 91 23 __ STA (SP + 0),y 
2a7b : a9 00 __ LDA #$00
2a7d : c8 __ __ INY
2a7e : 91 23 __ STA (SP + 0),y 
2a80 : 20 da 22 JSR $22da ; (printf.s0 + 0)
2a83 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s1001:
2a86 : 18 __ __ CLC
2a87 : a5 23 __ LDA SP + 0 
2a89 : 69 06 __ ADC #$06
2a8b : 85 23 __ STA SP + 0 
2a8d : 90 02 __ BCC $2a91 ; (load_overlay.s1001 + 11)
2a8f : e6 24 __ INC SP + 1 
2a91 : 60 __ __ RTS
--------------------------------------------------------------------
2a92 : __ __ __ BYT 56 44 43 53 45 32 50 52 47 4c 4d 43 00          : VDCSE2PRGLMC.
--------------------------------------------------------------------
krnio_setbnk@proxy: ; krnio_setbnk@proxy
2a9f : a9 00 __ LDA #$00
2aa1 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s0:
2aa3 : a5 0d __ LDA P0 
2aa5 : a6 0e __ LDX P1 
2aa7 : 4c 68 ff JMP $ff68 
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2aaa : a5 0d __ LDA P0 
2aac : 05 0e __ ORA P1 
2aae : f0 08 __ BEQ $2ab8 ; (krnio_setnam.s0 + 14)
2ab0 : a0 ff __ LDY #$ff
2ab2 : c8 __ __ INY
2ab3 : b1 0d __ LDA (P0),y 
2ab5 : d0 fb __ BNE $2ab2 ; (krnio_setnam.s0 + 8)
2ab7 : 98 __ __ TYA
2ab8 : a6 0d __ LDX P0 
2aba : a4 0e __ LDY P1 
2abc : 20 bd ff JSR $ffbd 
.s1001:
2abf : 60 __ __ RTS
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2ac0 : a5 0d __ LDA P0 
2ac2 : a6 0e __ LDX P1 
2ac4 : a4 0f __ LDY P2 
2ac6 : 20 ba ff JSR $ffba 
2ac9 : a9 00 __ LDA #$00
2acb : a2 00 __ LDX #$00
2acd : a0 00 __ LDY #$00
2acf : 20 d5 ff JSR $ffd5 
2ad2 : a9 00 __ LDA #$00
2ad4 : b0 02 __ BCS $2ad8 ; (krnio_load.s0 + 24)
2ad6 : a9 01 __ LDA #$01
2ad8 : 85 1b __ STA ACCU + 0 
.s1001:
2ada : a5 1b __ LDA ACCU + 0 
2adc : 60 __ __ RTS
--------------------------------------------------------------------
2add : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
2aed : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
clrscr: ; clrscr()->void
.s0:
2afb : 4c 81 ff JMP $ff81 
--------------------------------------------------------------------
2afe : __ __ __ BYT 24 00                                           : $.
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
2b1c : ae ff 33 LDX $33ff ; (spentry + 0)
2b1f : 9a __ __ TXS
2b20 : a9 4c __ LDA #$4c
2b22 : 85 54 __ STA $54 
2b24 : a9 00 __ LDA #$00
2b26 : 85 13 __ STA P6 
.s1001:
2b28 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2b29 : 38 __ __ SEC
2b2a : a5 23 __ LDA SP + 0 
2b2c : e9 04 __ SBC #$04
2b2e : 85 23 __ STA SP + 0 
2b30 : b0 02 __ BCS $2b34 ; (vdc_init.s0 + 0)
2b32 : c6 24 __ DEC SP + 1 
.s0:
2b34 : a2 14 __ LDX #$14
.l1002:
2b36 : bd 64 50 LDA $5064,x ; (vdc_clear@proxy + 14)
2b39 : 9d ff 0f STA $0fff,x 
2b3c : ca __ __ DEX
2b3d : d0 f7 __ BNE $2b36 ; (vdc_init.l1002 + 0)
.s1003:
2b3f : a9 1a __ LDA #$1a
2b41 : 8d 00 d6 STA $d600 
.l128:
2b44 : 2c 00 d6 BIT $d600 
2b47 : 10 fb __ BPL $2b44 ; (vdc_init.l128 + 0)
.s7:
2b49 : ad 01 d6 LDA $d601 
2b4c : 29 f0 __ AND #$f0
2b4e : aa __ __ TAX
2b4f : a9 1a __ LDA #$1a
2b51 : 8d 00 d6 STA $d600 
.l130:
2b54 : 2c 00 d6 BIT $d600 
2b57 : 10 fb __ BPL $2b54 ; (vdc_init.l130 + 0)
.s13:
2b59 : 8e 01 d6 STX $d601 
2b5c : 8d 00 d6 STA $d600 
.l132:
2b5f : 2c 00 d6 BIT $d600 
2b62 : 10 fb __ BPL $2b5f ; (vdc_init.l132 + 0)
.s20:
2b64 : ad 01 d6 LDA $d601 
2b67 : 29 0f __ AND #$0f
2b69 : 09 d0 __ ORA #$d0
2b6b : a2 1a __ LDX #$1a
2b6d : 8e 00 d6 STX $d600 
.l134:
2b70 : 2c 00 d6 BIT $d600 
2b73 : 10 fb __ BPL $2b70 ; (vdc_init.l134 + 0)
.s26:
2b75 : 8d 01 d6 STA $d601 
2b78 : a9 8d __ LDA #$8d
2b7a : 8d df 51 STA $51df ; (vdc_state + 7)
2b7d : 20 af 2b JSR $2baf ; (vdc_detect_mem_size.s0 + 0)
2b80 : 24 d7 __ BIT $d7 
2b82 : 30 17 __ BMI $2b9b ; (vdc_init.s29 + 0)
.s32:
2b84 : a9 6f __ LDA #$6f
2b86 : a0 02 __ LDY #$02
2b88 : 91 23 __ STA (SP + 0),y 
2b8a : a9 2d __ LDA #$2d
2b8c : c8 __ __ INY
2b8d : 91 23 __ STA (SP + 0),y 
2b8f : 20 da 22 JSR $22da ; (printf.s0 + 0)
2b92 : 20 9a 2d JSR $2d9a ; (getch.s0 + 0)
2b95 : 20 81 ff JSR $ff81 
2b98 : 20 d5 2d JSR $2dd5 ; (screen_setmode.s0 + 0)
.s29:
2b9b : a9 01 __ LDA #$01
2b9d : 20 dd 2d JSR $2ddd ; (fastmode.s0 + 0)
2ba0 : 20 fc 2d JSR $2dfc ; (vdc_set_mode@proxy + 0)
.s1001:
2ba3 : 18 __ __ CLC
2ba4 : a5 23 __ LDA SP + 0 
2ba6 : 69 04 __ ADC #$04
2ba8 : 85 23 __ STA SP + 0 
2baa : 90 02 __ BCC $2bae ; (vdc_init.s1001 + 11)
2bac : e6 24 __ INC SP + 1 
2bae : 60 __ __ RTS
--------------------------------------------------------------------
vdc_detect_mem_size: ; vdc_detect_mem_size()->void
.s0:
2baf : a9 1c __ LDA #$1c
2bb1 : 8d 00 d6 STA $d600 
.l335:
2bb4 : 2c 00 d6 BIT $d600 
2bb7 : 10 fb __ BPL $2bb4 ; (vdc_detect_mem_size.l335 + 0)
.s5:
2bb9 : ad 01 d6 LDA $d601 
2bbc : a8 __ __ TAY
2bbd : 09 10 __ ORA #$10
2bbf : a2 1c __ LDX #$1c
2bc1 : 8e 00 d6 STX $d600 
.l337:
2bc4 : 2c 00 d6 BIT $d600 
2bc7 : 10 fb __ BPL $2bc4 ; (vdc_detect_mem_size.l337 + 0)
.s12:
2bc9 : 8d 01 d6 STA $d601 
2bcc : a9 12 __ LDA #$12
2bce : 8d 00 d6 STA $d600 
.l339:
2bd1 : 2c 00 d6 BIT $d600 
2bd4 : 10 fb __ BPL $2bd1 ; (vdc_detect_mem_size.l339 + 0)
.s19:
2bd6 : a9 1f __ LDA #$1f
2bd8 : 8d 01 d6 STA $d601 
2bdb : a9 13 __ LDA #$13
2bdd : 8d 00 d6 STA $d600 
.l341:
2be0 : 2c 00 d6 BIT $d600 
2be3 : 10 fb __ BPL $2be0 ; (vdc_detect_mem_size.l341 + 0)
.s24:
2be5 : a9 ff __ LDA #$ff
2be7 : 8d 01 d6 STA $d601 
2bea : a9 1f __ LDA #$1f
2bec : 8d 00 d6 STA $d600 
.l343:
2bef : 2c 00 d6 BIT $d600 
2bf2 : 10 fb __ BPL $2bef ; (vdc_detect_mem_size.l343 + 0)
.s28:
2bf4 : a9 00 __ LDA #$00
2bf6 : 8d 01 d6 STA $d601 
2bf9 : a9 12 __ LDA #$12
2bfb : 8d 00 d6 STA $d600 
.l345:
2bfe : 2c 00 d6 BIT $d600 
2c01 : 10 fb __ BPL $2bfe ; (vdc_detect_mem_size.l345 + 0)
.s35:
2c03 : a9 9f __ LDA #$9f
2c05 : 8d 01 d6 STA $d601 
2c08 : a9 13 __ LDA #$13
2c0a : 8d 00 d6 STA $d600 
.l347:
2c0d : 2c 00 d6 BIT $d600 
2c10 : 10 fb __ BPL $2c0d ; (vdc_detect_mem_size.l347 + 0)
.s40:
2c12 : a9 ff __ LDA #$ff
2c14 : 8d 01 d6 STA $d601 
2c17 : a9 1f __ LDA #$1f
2c19 : 8d 00 d6 STA $d600 
.l349:
2c1c : 2c 00 d6 BIT $d600 
2c1f : 10 fb __ BPL $2c1c ; (vdc_detect_mem_size.l349 + 0)
.s44:
2c21 : a9 ff __ LDA #$ff
2c23 : 8d 01 d6 STA $d601 
2c26 : a9 12 __ LDA #$12
2c28 : 8d 00 d6 STA $d600 
.l351:
2c2b : 2c 00 d6 BIT $d600 
2c2e : 10 fb __ BPL $2c2b ; (vdc_detect_mem_size.l351 + 0)
.s51:
2c30 : a9 1f __ LDA #$1f
2c32 : 8d 01 d6 STA $d601 
2c35 : a9 13 __ LDA #$13
2c37 : 8d 00 d6 STA $d600 
.l353:
2c3a : 2c 00 d6 BIT $d600 
2c3d : 10 fb __ BPL $2c3a ; (vdc_detect_mem_size.l353 + 0)
.s56:
2c3f : a9 ff __ LDA #$ff
2c41 : 8d 01 d6 STA $d601 
2c44 : a9 1f __ LDA #$1f
2c46 : 8d 00 d6 STA $d600 
.l355:
2c49 : 2c 00 d6 BIT $d600 
2c4c : 10 fb __ BPL $2c49 ; (vdc_detect_mem_size.l355 + 0)
.s60:
2c4e : ad 01 d6 LDA $d601 
2c51 : f0 04 __ BEQ $2c57 ; (vdc_detect_mem_size.s1026 + 0)
.s1027:
2c53 : a9 10 __ LDA #$10
2c55 : d0 02 __ BNE $2c59 ; (vdc_detect_mem_size.s1028 + 0)
.s1026:
2c57 : a9 40 __ LDA #$40
.s1028:
2c59 : 8d d8 51 STA $51d8 ; (vdc_state + 0)
2c5c : 8e 00 d6 STX $d600 
.l358:
2c5f : 2c 00 d6 BIT $d600 
2c62 : 10 fb __ BPL $2c5f ; (vdc_detect_mem_size.l358 + 0)
.s67:
2c64 : 8c 01 d6 STY $d601 
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2c67 : a9 00 __ LDA #$00
2c69 : 85 0f __ STA P2 
2c6b : 85 10 __ STA P3 
2c6d : ad db 51 LDA $51db ; (vdc_state + 3)
2c70 : 85 12 __ STA P5 
2c72 : ad dd 51 LDA $51dd ; (vdc_state + 5)
2c75 : 85 13 __ STA P6 
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
2c77 : a9 20 __ LDA #$20
2c79 : 85 11 __ STA P4 
--------------------------------------------------------------------
vdc_clear: ; vdc_clear(u8,u8,u8,u8,u8)->void
.s0:
2c7b : 18 __ __ CLC
2c7c : a5 10 __ LDA P3 ; (y + 0)
2c7e : 65 13 __ ADC P6 ; (lines + 0)
2c80 : 85 43 __ STA T1 + 0 
2c82 : a9 00 __ LDA #$00
2c84 : 2a __ __ ROL
2c85 : 85 44 __ STA T1 + 1 
2c87 : d0 07 __ BNE $2c90 ; (vdc_clear.l2 + 0)
.s1018:
2c89 : a5 10 __ LDA P3 ; (y + 0)
2c8b : c5 43 __ CMP T1 + 0 
2c8d : 90 01 __ BCC $2c90 ; (vdc_clear.l2 + 0)
.s1001:
2c8f : 60 __ __ RTS
.l2:
2c90 : a5 10 __ LDA P3 ; (y + 0)
2c92 : 0a __ __ ASL
2c93 : aa __ __ TAX
2c94 : bd 00 53 LDA $5300,x ; (multab + 0)
2c97 : 18 __ __ CLC
2c98 : 65 0f __ ADC P2 ; (x + 0)
2c9a : 85 46 __ STA T3 + 0 
2c9c : bd 01 53 LDA $5301,x ; (multab + 1)
2c9f : 69 00 __ ADC #$00
2ca1 : 85 47 __ STA T3 + 1 
2ca3 : ad e0 51 LDA $51e0 ; (vdc_state + 8)
2ca6 : 18 __ __ CLC
2ca7 : 65 46 __ ADC T3 + 0 
2ca9 : 85 0d __ STA P0 
2cab : ad e1 51 LDA $51e1 ; (vdc_state + 9)
2cae : 65 47 __ ADC T3 + 1 
2cb0 : 85 0e __ STA P1 
2cb2 : ad df 51 LDA $51df ; (vdc_state + 7)
2cb5 : 85 45 __ STA T2 + 0 
2cb7 : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
2cba : a6 12 __ LDX P5 ; (length + 0)
2cbc : ca __ __ DEX
2cbd : 86 48 __ STX T4 + 0 
.l239:
2cbf : 2c 00 d6 BIT $d600 
2cc2 : 10 fb __ BPL $2cbf ; (vdc_clear.l239 + 0)
.s11:
2cc4 : a5 11 __ LDA P4 ; (val + 0)
2cc6 : 8d 01 d6 STA $d601 
2cc9 : a9 18 __ LDA #$18
2ccb : 8d 00 d6 STA $d600 
.l241:
2cce : 2c 00 d6 BIT $d600 
2cd1 : 10 fb __ BPL $2cce ; (vdc_clear.l241 + 0)
.s17:
2cd3 : ad 01 d6 LDA $d601 
2cd6 : 29 7f __ AND #$7f
2cd8 : a2 18 __ LDX #$18
2cda : 8e 00 d6 STX $d600 
.l243:
2cdd : 2c 00 d6 BIT $d600 
2ce0 : 10 fb __ BPL $2cdd ; (vdc_clear.l243 + 0)
.s23:
2ce2 : 8d 01 d6 STA $d601 
2ce5 : a9 1e __ LDA #$1e
2ce7 : 8d 00 d6 STA $d600 
.l245:
2cea : 2c 00 d6 BIT $d600 
2ced : 10 fb __ BPL $2cea ; (vdc_clear.l245 + 0)
.s28:
2cef : a5 48 __ LDA T4 + 0 
2cf1 : 8d 01 d6 STA $d601 
2cf4 : ad e2 51 LDA $51e2 ; (vdc_state + 10)
2cf7 : 18 __ __ CLC
2cf8 : 65 46 __ ADC T3 + 0 
2cfa : 85 0d __ STA P0 
2cfc : ad e3 51 LDA $51e3 ; (vdc_state + 11)
2cff : 65 47 __ ADC T3 + 1 
2d01 : 85 0e __ STA P1 
2d03 : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
.l247:
2d06 : 2c 00 d6 BIT $d600 
2d09 : 10 fb __ BPL $2d06 ; (vdc_clear.l247 + 0)
.s32:
2d0b : a5 45 __ LDA T2 + 0 
2d0d : 8d 01 d6 STA $d601 
2d10 : a9 18 __ LDA #$18
2d12 : 8d 00 d6 STA $d600 
.l249:
2d15 : 2c 00 d6 BIT $d600 
2d18 : 10 fb __ BPL $2d15 ; (vdc_clear.l249 + 0)
.s38:
2d1a : ad 01 d6 LDA $d601 
2d1d : 29 7f __ AND #$7f
2d1f : a2 18 __ LDX #$18
2d21 : 8e 00 d6 STX $d600 
.l251:
2d24 : 2c 00 d6 BIT $d600 
2d27 : 10 fb __ BPL $2d24 ; (vdc_clear.l251 + 0)
.s44:
2d29 : 8d 01 d6 STA $d601 
2d2c : a9 1e __ LDA #$1e
2d2e : 8d 00 d6 STA $d600 
.l253:
2d31 : 2c 00 d6 BIT $d600 
2d34 : 10 fb __ BPL $2d31 ; (vdc_clear.l253 + 0)
.s49:
2d36 : a5 48 __ LDA T4 + 0 
2d38 : 8d 01 d6 STA $d601 
2d3b : e6 10 __ INC P3 ; (y + 0)
2d3d : a5 44 __ LDA T1 + 1 
2d3f : f0 03 __ BEQ $2d44 ; (vdc_clear.s49 + 14)
2d41 : 4c 90 2c JMP $2c90 ; (vdc_clear.l2 + 0)
2d44 : 4c 89 2c JMP $2c89 ; (vdc_clear.s1018 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2d47 : a5 44 __ LDA $44 
2d49 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
2d4b : a9 12 __ LDA #$12
2d4d : 8d 00 d6 STA $d600 
.l56:
2d50 : 2c 00 d6 BIT $d600 
2d53 : 10 fb __ BPL $2d50 ; (vdc_mem_addr.l56 + 0)
.s5:
2d55 : a5 0e __ LDA P1 ; (addr + 1)
2d57 : 8d 01 d6 STA $d601 
2d5a : a9 13 __ LDA #$13
2d5c : 8d 00 d6 STA $d600 
.l58:
2d5f : 2c 00 d6 BIT $d600 
2d62 : 10 fb __ BPL $2d5f ; (vdc_mem_addr.l58 + 0)
.s10:
2d64 : a5 0d __ LDA P0 ; (addr + 0)
2d66 : 8d 01 d6 STA $d601 
2d69 : a9 1f __ LDA #$1f
2d6b : 8d 00 d6 STA $d600 
.s1001:
2d6e : 60 __ __ RTS
--------------------------------------------------------------------
2d6f : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2d7f : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2d8f : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
2d9a : 20 a4 2d JSR $2da4 ; (getpch + 0)
2d9d : c9 00 __ CMP #$00
2d9f : f0 f9 __ BEQ $2d9a ; (getch.s0 + 0)
2da1 : 85 1b __ STA ACCU + 0 
.s1001:
2da3 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2da4 : 20 e4 ff JSR $ffe4 
2da7 : ae fe 46 LDX $46fe ; (giocharmap + 0)
2daa : e0 01 __ CPX #$01
2dac : 90 26 __ BCC $2dd4 ; (getpch + 48)
2dae : c9 0d __ CMP #$0d
2db0 : d0 02 __ BNE $2db4 ; (getpch + 16)
2db2 : a9 0a __ LDA #$0a
2db4 : e0 02 __ CPX #$02
2db6 : 90 1c __ BCC $2dd4 ; (getpch + 48)
2db8 : c9 db __ CMP #$db
2dba : b0 18 __ BCS $2dd4 ; (getpch + 48)
2dbc : c9 41 __ CMP #$41
2dbe : 90 14 __ BCC $2dd4 ; (getpch + 48)
2dc0 : c9 c1 __ CMP #$c1
2dc2 : 90 02 __ BCC $2dc6 ; (getpch + 34)
2dc4 : 49 a0 __ EOR #$a0
2dc6 : c9 7b __ CMP #$7b
2dc8 : b0 0a __ BCS $2dd4 ; (getpch + 48)
2dca : c9 61 __ CMP #$61
2dcc : b0 04 __ BCS $2dd2 ; (getpch + 46)
2dce : c9 5b __ CMP #$5b
2dd0 : b0 02 __ BCS $2dd4 ; (getpch + 48)
2dd2 : 49 20 __ EOR #$20
2dd4 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2dd5 : 24 d7 __ BIT $d7 
2dd7 : 10 01 __ BPL $2dda ; (screen_setmode.s6 + 0)
.s1001:
2dd9 : 60 __ __ RTS
.s6:
2dda : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2ddd : 09 00 __ ORA #$00
2ddf : d0 0d __ BNE $2dee ; (fastmode.s1 + 0)
.s2:
2de1 : 8d 30 d0 STA $d030 
2de4 : ad 11 d0 LDA $d011 
2de7 : 29 7f __ AND #$7f
2de9 : 09 10 __ ORA #$10
2deb : 4c f8 2d JMP $2df8 ; (fastmode.s3 + 0)
.s1:
2dee : a9 01 __ LDA #$01
2df0 : 8d 30 d0 STA $d030 
2df3 : ad 11 d0 LDA $d011 
2df6 : 29 6f __ AND #$6f
.s3:
2df8 : 8d 11 d0 STA $d011 
.s1001:
2dfb : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode@proxy: ; vdc_set_mode@proxy
2dfc : a9 00 __ LDA #$00
2dfe : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
2e00 : a4 14 __ LDY P7 ; (mode + 0)
2e02 : be 1f 50 LDX $501f,y ; (__multab36L + 0)
2e05 : 86 49 __ STX T1 + 0 
2e07 : 86 4b __ STX T2 + 0 
2e09 : bd 04 51 LDA $5104,x ; (vdc_modes + 4)
2e0c : f0 08 __ BEQ $2e16 ; (vdc_set_mode.s3 + 0)
.s4:
2e0e : ad d8 51 LDA $51d8 ; (vdc_state + 0)
2e11 : c9 10 __ CMP #$10
2e13 : d0 01 __ BNE $2e16 ; (vdc_set_mode.s3 + 0)
2e15 : 60 __ __ RTS
.s3:
2e16 : 8c da 51 STY $51da ; (vdc_state + 2)
2e19 : a9 8d __ LDA #$8d
2e1b : 8d df 51 STA $51df ; (vdc_state + 7)
2e1e : a9 00 __ LDA #$00
2e20 : 8d ee 51 STA $51ee ; (vdc_state + 22)
2e23 : 8d ef 51 STA $51ef ; (vdc_state + 23)
2e26 : 8d f0 51 STA $51f0 ; (vdc_state + 24)
2e29 : bd 00 51 LDA $5100,x ; (vdc_modes + 0)
2e2c : 8d db 51 STA $51db ; (vdc_state + 3)
2e2f : bd 01 51 LDA $5101,x ; (vdc_modes + 1)
2e32 : 8d dc 51 STA $51dc ; (vdc_state + 4)
2e35 : bd 02 51 LDA $5102,x ; (vdc_modes + 2)
2e38 : 8d dd 51 STA $51dd ; (vdc_state + 5)
2e3b : bd 03 51 LDA $5103,x ; (vdc_modes + 3)
2e3e : 8d de 51 STA $51de ; (vdc_state + 6)
2e41 : bd 09 51 LDA $5109,x ; (vdc_modes + 9)
2e44 : 8d e4 51 STA $51e4 ; (vdc_state + 12)
2e47 : bd 0a 51 LDA $510a,x ; (vdc_modes + 10)
2e4a : 8d e5 51 STA $51e5 ; (vdc_state + 13)
2e4d : bd 0b 51 LDA $510b,x ; (vdc_modes + 11)
2e50 : 8d e6 51 STA $51e6 ; (vdc_state + 14)
2e53 : bd 0c 51 LDA $510c,x ; (vdc_modes + 12)
2e56 : 8d e7 51 STA $51e7 ; (vdc_state + 15)
2e59 : bd 0d 51 LDA $510d,x ; (vdc_modes + 13)
2e5c : 8d e8 51 STA $51e8 ; (vdc_state + 16)
2e5f : bd 0e 51 LDA $510e,x ; (vdc_modes + 14)
2e62 : 8d e9 51 STA $51e9 ; (vdc_state + 17)
2e65 : bd 0f 51 LDA $510f,x ; (vdc_modes + 15)
2e68 : 8d ea 51 STA $51ea ; (vdc_state + 18)
2e6b : bd 10 51 LDA $5110,x ; (vdc_modes + 16)
2e6e : 8d eb 51 STA $51eb ; (vdc_state + 19)
2e71 : bd 11 51 LDA $5111,x ; (vdc_modes + 17)
2e74 : 8d ec 51 STA $51ec ; (vdc_state + 20)
2e77 : bd 12 51 LDA $5112,x ; (vdc_modes + 18)
2e7a : 8d ed 51 STA $51ed ; (vdc_state + 21)
2e7d : bd 05 51 LDA $5105,x ; (vdc_modes + 5)
2e80 : 85 4c __ STA T3 + 0 
2e82 : 8d e0 51 STA $51e0 ; (vdc_state + 8)
2e85 : bd 06 51 LDA $5106,x ; (vdc_modes + 6)
2e88 : 85 4d __ STA T3 + 1 
2e8a : 8d e1 51 STA $51e1 ; (vdc_state + 9)
2e8d : bd 07 51 LDA $5107,x ; (vdc_modes + 7)
2e90 : 85 4e __ STA T5 + 0 
2e92 : 8d e2 51 STA $51e2 ; (vdc_state + 10)
2e95 : bd 08 51 LDA $5108,x ; (vdc_modes + 8)
2e98 : 85 4f __ STA T5 + 1 
2e9a : 8d e3 51 STA $51e3 ; (vdc_state + 11)
2e9d : 20 75 2f JSR $2f75 ; (vdc_set_multab.s0 + 0)
2ea0 : a9 22 __ LDA #$22
2ea2 : 8d 00 d6 STA $d600 
.l295:
2ea5 : 2c 00 d6 BIT $d600 
2ea8 : 10 fb __ BPL $2ea5 ; (vdc_set_mode.l295 + 0)
.s11:
2eaa : a9 80 __ LDA #$80
2eac : 8d 01 d6 STA $d601 
2eaf : a9 0c __ LDA #$0c
2eb1 : 8d 00 d6 STA $d600 
.l297:
2eb4 : 2c 00 d6 BIT $d600 
2eb7 : 10 fb __ BPL $2eb4 ; (vdc_set_mode.l297 + 0)
.s17:
2eb9 : a5 4d __ LDA T3 + 1 
2ebb : 8d 01 d6 STA $d601 
2ebe : a9 0d __ LDA #$0d
2ec0 : 8d 00 d6 STA $d600 
.l299:
2ec3 : 2c 00 d6 BIT $d600 
2ec6 : 10 fb __ BPL $2ec3 ; (vdc_set_mode.l299 + 0)
.s22:
2ec8 : a5 4c __ LDA T3 + 0 
2eca : 8d 01 d6 STA $d601 
2ecd : a9 14 __ LDA #$14
2ecf : 8d 00 d6 STA $d600 
.l301:
2ed2 : 2c 00 d6 BIT $d600 
2ed5 : 10 fb __ BPL $2ed2 ; (vdc_set_mode.l301 + 0)
.s27:
2ed7 : a5 4f __ LDA T5 + 1 
2ed9 : 8d 01 d6 STA $d601 
2edc : a9 15 __ LDA #$15
2ede : 8d 00 d6 STA $d600 
.l303:
2ee1 : 2c 00 d6 BIT $d600 
2ee4 : 10 fb __ BPL $2ee1 ; (vdc_set_mode.l303 + 0)
.s32:
2ee6 : a5 4e __ LDA T5 + 0 
2ee8 : 8d 01 d6 STA $d601 
2eeb : a6 49 __ LDX T1 + 0 
2eed : bd 0e 51 LDA $510e,x ; (vdc_modes + 14)
2ef0 : a2 1c __ LDX #$1c
2ef2 : 8e 00 d6 STX $d600 
.l305:
2ef5 : 2c 00 d6 BIT $d600 
2ef8 : 10 fb __ BPL $2ef5 ; (vdc_set_mode.l305 + 0)
.s39:
2efa : aa __ __ TAX
2efb : ad 01 d6 LDA $d601 
2efe : 29 10 __ AND #$10
2f00 : 85 4e __ STA T5 + 0 
2f02 : a9 1c __ LDA #$1c
2f04 : 8d 00 d6 STA $d600 
2f07 : 8a __ __ TXA
2f08 : 29 e0 __ AND #$e0
2f0a : 05 4e __ ORA T5 + 0 
.l307:
2f0c : 2c 00 d6 BIT $d600 
2f0f : 10 fb __ BPL $2f0c ; (vdc_set_mode.l307 + 0)
.s45:
2f11 : 8d 01 d6 STA $d601 
2f14 : 20 d0 2f JSR $2fd0 ; (vdc_restore_charsets.s0 + 0)
2f17 : 18 __ __ CLC
2f18 : a9 13 __ LDA #$13
2f1a : 65 49 __ ADC T1 + 0 
2f1c : 85 49 __ STA T1 + 0 
2f1e : a9 51 __ LDA #$51
2f20 : 69 00 __ ADC #$00
2f22 : 85 4a __ STA T1 + 1 
2f24 : 18 __ __ CLC
2f25 : a5 4b __ LDA T2 + 0 
2f27 : 69 13 __ ADC #$13
2f29 : 85 4c __ STA T3 + 0 
2f2b : a9 00 __ LDA #$00
2f2d : 85 43 __ STA T0 + 0 
2f2f : 69 51 __ ADC #$51
2f31 : 85 4d __ STA T3 + 1 
.l46:
2f33 : a4 43 __ LDY T0 + 0 
2f35 : b1 49 __ LDA (T1 + 0),y 
2f37 : 85 47 __ STA T7 + 0 
2f39 : c8 __ __ INY
2f3a : b1 49 __ LDA (T1 + 0),y 
2f3c : aa __ __ TAX
2f3d : a5 47 __ LDA T7 + 0 
2f3f : 8d 00 d6 STA $d600 
2f42 : c8 __ __ INY
2f43 : 84 43 __ STY T0 + 0 
.l309:
2f45 : 2c 00 d6 BIT $d600 
2f48 : 10 fb __ BPL $2f45 ; (vdc_set_mode.l309 + 0)
.s52:
2f4a : 8e 01 d6 STX $d601 
2f4d : b1 4c __ LDA (T3 + 0),y 
2f4f : c9 ff __ CMP #$ff
2f51 : d0 e0 __ BNE $2f33 ; (vdc_set_mode.l46 + 0)
.s47:
2f53 : a6 4b __ LDX T2 + 0 
2f55 : bd 04 51 LDA $5104,x ; (vdc_modes + 4)
2f58 : f0 08 __ BEQ $2f62 ; (vdc_set_mode.s55 + 0)
.s56:
2f5a : ad d9 51 LDA $51d9 ; (vdc_state + 1)
2f5d : d0 03 __ BNE $2f62 ; (vdc_set_mode.s55 + 0)
.s53:
2f5f : 20 2b 30 JSR $302b ; (vdc_set_extended_memsize.s0 + 0)
.s55:
2f62 : 20 67 2c JSR $2c67 ; (vdc_cls.s0 + 0)
2f65 : a9 22 __ LDA #$22
2f67 : 8d 00 d6 STA $d600 
.l314:
2f6a : 2c 00 d6 BIT $d600 
2f6d : 10 fb __ BPL $2f6a ; (vdc_set_mode.l314 + 0)
.s62:
2f6f : a9 7d __ LDA #$7d
2f71 : 8d 01 d6 STA $d601 
.s1001:
2f74 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2f75 : ad de 51 LDA $51de ; (vdc_state + 6)
2f78 : 85 1c __ STA ACCU + 1 
2f7a : ad dd 51 LDA $51dd ; (vdc_state + 5)
2f7d : 85 1b __ STA ACCU + 0 
2f7f : 05 1c __ ORA ACCU + 1 
2f81 : f0 4c __ BEQ $2fcf ; (vdc_set_multab.s1001 + 0)
.s5:
2f83 : ad db 51 LDA $51db ; (vdc_state + 3)
2f86 : 18 __ __ CLC
2f87 : 6d f0 51 ADC $51f0 ; (vdc_state + 24)
2f8a : 85 43 __ STA T2 + 0 
2f8c : ad dc 51 LDA $51dc ; (vdc_state + 4)
2f8f : 69 00 __ ADC #$00
2f91 : 85 44 __ STA T2 + 1 
2f93 : a9 00 __ LDA #$00
2f95 : 85 45 __ STA T3 + 0 
2f97 : 85 46 __ STA T3 + 1 
2f99 : a9 00 __ LDA #$00
2f9b : 85 47 __ STA T4 + 0 
2f9d : a9 53 __ LDA #$53
2f9f : 85 48 __ STA T4 + 1 
2fa1 : a2 00 __ LDX #$00
.l2:
2fa3 : a5 45 __ LDA T3 + 0 
2fa5 : a0 00 __ LDY #$00
2fa7 : 91 47 __ STA (T4 + 0),y 
2fa9 : a5 46 __ LDA T3 + 1 
2fab : c8 __ __ INY
2fac : 91 47 __ STA (T4 + 0),y 
2fae : 18 __ __ CLC
2faf : a5 43 __ LDA T2 + 0 
2fb1 : 65 45 __ ADC T3 + 0 
2fb3 : 85 45 __ STA T3 + 0 
2fb5 : a5 44 __ LDA T2 + 1 
2fb7 : 65 46 __ ADC T3 + 1 
2fb9 : 85 46 __ STA T3 + 1 
2fbb : 18 __ __ CLC
2fbc : a5 47 __ LDA T4 + 0 
2fbe : 69 02 __ ADC #$02
2fc0 : 85 47 __ STA T4 + 0 
2fc2 : 90 02 __ BCC $2fc6 ; (vdc_set_multab.s1006 + 0)
.s1005:
2fc4 : e6 48 __ INC T4 + 1 
.s1006:
2fc6 : e8 __ __ INX
2fc7 : a5 1c __ LDA ACCU + 1 
2fc9 : d0 d8 __ BNE $2fa3 ; (vdc_set_multab.l2 + 0)
.s1002:
2fcb : e4 1b __ CPX ACCU + 0 
2fcd : 90 d4 __ BCC $2fa3 ; (vdc_set_multab.l2 + 0)
.s1001:
2fcf : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2fd0 : ad e8 51 LDA $51e8 ; (vdc_state + 16)
2fd3 : 85 0d __ STA P0 
2fd5 : ad e9 51 LDA $51e9 ; (vdc_state + 17)
2fd8 : 85 0e __ STA P1 
2fda : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
2fdd : a9 00 __ LDA #$00
2fdf : 85 1b __ STA ACCU + 0 
2fe1 : 85 43 __ STA T1 + 0 
2fe3 : a9 d0 __ LDA #$d0
2fe5 : 85 1c __ STA ACCU + 1 
2fe7 : a9 02 __ LDA #$02
2fe9 : 85 44 __ STA T1 + 1 
.l2:
2feb : a2 08 __ LDX #$08
.l6:
2fed : a9 01 __ LDA #$01
2fef : 8d 00 ff STA $ff00 
2ff2 : a0 00 __ LDY #$00
2ff4 : b1 1b __ LDA (ACCU + 0),y 
2ff6 : a0 0e __ LDY #$0e
2ff8 : 8c 00 ff STY $ff00 
2ffb : a8 __ __ TAY
2ffc : e6 1b __ INC ACCU + 0 
2ffe : d0 02 __ BNE $3002 ; (vdc_restore_charsets.l106 + 0)
.s1006:
3000 : e6 1c __ INC ACCU + 1 
.l106:
3002 : 2c 00 d6 BIT $d600 
3005 : 10 fb __ BPL $3002 ; (vdc_restore_charsets.l106 + 0)
.s11:
3007 : 8c 01 d6 STY $d601 
300a : ca __ __ DEX
300b : d0 e0 __ BNE $2fed ; (vdc_restore_charsets.l6 + 0)
.s8:
300d : a2 08 __ LDX #$08
.l13:
300f : 2c 00 d6 BIT $d600 
3012 : 10 fb __ BPL $300f ; (vdc_restore_charsets.l13 + 0)
.s18:
3014 : a9 00 __ LDA #$00
3016 : 8d 01 d6 STA $d601 
3019 : ca __ __ DEX
301a : d0 f3 __ BNE $300f ; (vdc_restore_charsets.l13 + 0)
.s3:
301c : a5 43 __ LDA T1 + 0 
301e : d0 02 __ BNE $3022 ; (vdc_restore_charsets.s1009 + 0)
.s1008:
3020 : c6 44 __ DEC T1 + 1 
.s1009:
3022 : c6 43 __ DEC T1 + 0 
3024 : d0 c5 __ BNE $2feb ; (vdc_restore_charsets.l2 + 0)
.s1010:
3026 : a5 44 __ LDA T1 + 1 
3028 : d0 c1 __ BNE $2feb ; (vdc_restore_charsets.l2 + 0)
.s1001:
302a : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
302b : ad d8 51 LDA $51d8 ; (vdc_state + 0)
302e : c9 10 __ CMP #$10
3030 : f0 4d __ BEQ $307f ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
3032 : ad d9 51 LDA $51d9 ; (vdc_state + 1)
3035 : d0 48 __ BNE $307f ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
3037 : a9 22 __ LDA #$22
3039 : 8d 00 d6 STA $d600 
.l120:
303c : 2c 00 d6 BIT $d600 
303f : 10 fb __ BPL $303c ; (vdc_set_extended_memsize.l120 + 0)
.s11:
3041 : a9 80 __ LDA #$80
3043 : 8d 01 d6 STA $d601 
3046 : 20 80 30 JSR $3080 ; (vdc_wipe_mem.s0 + 0)
3049 : a9 1c __ LDA #$1c
304b : 8d 00 d6 STA $d600 
.l122:
304e : 2c 00 d6 BIT $d600 
3051 : 10 fb __ BPL $304e ; (vdc_set_extended_memsize.l122 + 0)
.s17:
3053 : ad 01 d6 LDA $d601 
3056 : 09 10 __ ORA #$10
3058 : a2 1c __ LDX #$1c
305a : 8e 00 d6 STX $d600 
.l124:
305d : 2c 00 d6 BIT $d600 
3060 : 10 fb __ BPL $305d ; (vdc_set_extended_memsize.l124 + 0)
.s23:
3062 : 8d 01 d6 STA $d601 
3065 : 20 d0 2f JSR $2fd0 ; (vdc_restore_charsets.s0 + 0)
3068 : 20 67 2c JSR $2c67 ; (vdc_cls.s0 + 0)
306b : a9 22 __ LDA #$22
306d : 8d 00 d6 STA $d600 
.l126:
3070 : 2c 00 d6 BIT $d600 
3073 : 10 fb __ BPL $3070 ; (vdc_set_extended_memsize.l126 + 0)
.s29:
3075 : a9 7d __ LDA #$7d
3077 : 8d 01 d6 STA $d601 
307a : a9 01 __ LDA #$01
307c : 8d d9 51 STA $51d9 ; (vdc_state + 1)
.s1001:
307f : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
3080 : a9 00 __ LDA #$00
3082 : 85 44 __ STA T0 + 1 
3084 : 85 0d __ STA P0 
3086 : a9 ff __ LDA #$ff
3088 : 85 45 __ STA T1 + 0 
.l2:
308a : 20 47 2d JSR $2d47 ; (vdc_mem_addr@proxy + 0)
.l252:
308d : 2c 00 d6 BIT $d600 
3090 : 10 fb __ BPL $308d ; (vdc_wipe_mem.l252 + 0)
.s8:
3092 : a9 00 __ LDA #$00
3094 : 8d 01 d6 STA $d601 
3097 : a9 18 __ LDA #$18
3099 : 8d 00 d6 STA $d600 
.l254:
309c : 2c 00 d6 BIT $d600 
309f : 10 fb __ BPL $309c ; (vdc_wipe_mem.l254 + 0)
.s14:
30a1 : ad 01 d6 LDA $d601 
30a4 : 29 7f __ AND #$7f
30a6 : a2 18 __ LDX #$18
30a8 : 8e 00 d6 STX $d600 
.l256:
30ab : 2c 00 d6 BIT $d600 
30ae : 10 fb __ BPL $30ab ; (vdc_wipe_mem.l256 + 0)
.s20:
30b0 : 8d 01 d6 STA $d601 
30b3 : a9 1e __ LDA #$1e
30b5 : 8d 00 d6 STA $d600 
.l258:
30b8 : 2c 00 d6 BIT $d600 
30bb : 10 fb __ BPL $30b8 ; (vdc_wipe_mem.l258 + 0)
.s25:
30bd : e6 44 __ INC T0 + 1 
30bf : a9 ff __ LDA #$ff
30c1 : 8d 01 d6 STA $d601 
30c4 : c6 45 __ DEC T1 + 0 
30c6 : d0 c2 __ BNE $308a ; (vdc_wipe_mem.l2 + 0)
.s4:
30c8 : 20 47 2d JSR $2d47 ; (vdc_mem_addr@proxy + 0)
.l261:
30cb : 2c 00 d6 BIT $d600 
30ce : 10 fb __ BPL $30cb ; (vdc_wipe_mem.l261 + 0)
.s29:
30d0 : a9 00 __ LDA #$00
30d2 : 8d 01 d6 STA $d601 
30d5 : a9 18 __ LDA #$18
30d7 : 8d 00 d6 STA $d600 
.l263:
30da : 2c 00 d6 BIT $d600 
30dd : 10 fb __ BPL $30da ; (vdc_wipe_mem.l263 + 0)
.s35:
30df : ad 01 d6 LDA $d601 
30e2 : 29 7f __ AND #$7f
30e4 : a2 18 __ LDX #$18
30e6 : 8e 00 d6 STX $d600 
.l265:
30e9 : 2c 00 d6 BIT $d600 
30ec : 10 fb __ BPL $30e9 ; (vdc_wipe_mem.l265 + 0)
.s41:
30ee : 8d 01 d6 STA $d601 
30f1 : a9 1e __ LDA #$1e
30f3 : 8d 00 d6 STA $d600 
.l267:
30f6 : 2c 00 d6 BIT $d600 
30f9 : 10 fb __ BPL $30f6 ; (vdc_wipe_mem.l267 + 0)
.s46:
30fb : a9 ff __ LDA #$ff
30fd : 8d 01 d6 STA $d601 
.s1001:
3100 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
3101 : a9 00 __ LDA #$00
3103 : a0 04 __ LDY #$04
3105 : 91 0d __ STA (P0),y ; (win + 0)
3107 : c8 __ __ INY
3108 : 91 0d __ STA (P0),y ; (win + 0)
310a : a5 0f __ LDA P2 ; (sx + 0)
310c : a0 00 __ LDY #$00
310e : 91 0d __ STA (P0),y ; (win + 0)
3110 : a5 10 __ LDA P3 ; (sy + 0)
3112 : c8 __ __ INY
3113 : 91 0d __ STA (P0),y ; (win + 0)
3115 : a5 11 __ LDA P4 ; (wx + 0)
3117 : c8 __ __ INY
3118 : 91 0d __ STA (P0),y ; (win + 0)
311a : a5 12 __ LDA P5 ; (wy + 0)
311c : c8 __ __ INY
311d : 91 0d __ STA (P0),y ; (win + 0)
311f : 06 10 __ ASL P3 ; (sy + 0)
3121 : a6 10 __ LDX P3 ; (sy + 0)
3123 : bd 00 53 LDA $5300,x ; (multab + 0)
3126 : 18 __ __ CLC
3127 : 65 0f __ ADC P2 ; (sx + 0)
3129 : 85 1b __ STA ACCU + 0 
312b : bd 01 53 LDA $5301,x ; (multab + 1)
312e : 69 00 __ ADC #$00
3130 : a8 __ __ TAY
3131 : ad e0 51 LDA $51e0 ; (vdc_state + 8)
3134 : 18 __ __ CLC
3135 : 65 1b __ ADC ACCU + 0 
3137 : 85 1b __ STA ACCU + 0 
3139 : 98 __ __ TYA
313a : 6d e1 51 ADC $51e1 ; (vdc_state + 9)
313d : a0 07 __ LDY #$07
313f : 91 0d __ STA (P0),y ; (win + 0)
3141 : a5 1b __ LDA ACCU + 0 
3143 : 88 __ __ DEY
3144 : 91 0d __ STA (P0),y ; (win + 0)
3146 : bd 00 53 LDA $5300,x ; (multab + 0)
3149 : 18 __ __ CLC
314a : 65 0f __ ADC P2 ; (sx + 0)
314c : 85 1b __ STA ACCU + 0 
314e : bd 01 53 LDA $5301,x ; (multab + 1)
3151 : 69 00 __ ADC #$00
3153 : aa __ __ TAX
3154 : ad e2 51 LDA $51e2 ; (vdc_state + 10)
3157 : 18 __ __ CLC
3158 : 65 1b __ ADC ACCU + 0 
315a : 85 1b __ STA ACCU + 0 
315c : 8a __ __ TXA
315d : 6d e3 51 ADC $51e3 ; (vdc_state + 11)
3160 : a0 09 __ LDY #$09
3162 : 91 0d __ STA (P0),y ; (win + 0)
3164 : a5 1b __ LDA ACCU + 0 
3166 : 88 __ __ DEY
3167 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
3169 : 60 __ __ RTS
--------------------------------------------------------------------
updateMenu: ; updateMenu()->void
.s0:
316a : a9 37 __ LDA #$37
316c : 85 0f __ STA P2 
316e : a9 04 __ LDA #$04
3170 : 85 10 __ STA P3 
3172 : a9 20 __ LDA #$20
3174 : 85 11 __ STA P4 
3176 : a9 0e __ LDA #$0e
3178 : 85 12 __ STA P5 
317a : a9 0a __ LDA #$0a
317c : 85 13 __ STA P6 
317e : ad 79 50 LDA $5079 ; (mc_menupopup + 0)
3181 : 8d df 51 STA $51df ; (vdc_state + 7)
3184 : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
3187 : a9 37 __ LDA #$37
3189 : 85 11 __ STA P4 
318b : a9 05 __ LDA #$05
318d : 85 12 __ STA P5 
318f : a9 8c __ LDA #$8c
3191 : 85 13 __ STA P6 
3193 : a9 46 __ LDA #$46
3195 : 85 14 __ STA P7 
3197 : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
319a : e6 12 __ INC P5 
319c : a9 9a __ LDA #$9a
319e : 85 13 __ STA P6 
31a0 : a9 46 __ LDA #$46
31a2 : 85 14 __ STA P7 
31a4 : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
31a7 : e6 12 __ INC P5 
31a9 : a9 a5 __ LDA #$a5
31ab : 85 13 __ STA P6 
31ad : a9 46 __ LDA #$46
31af : 85 14 __ STA P7 
31b1 : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
31b4 : e6 12 __ INC P5 
31b6 : a9 b0 __ LDA #$b0
31b8 : 85 13 __ STA P6 
31ba : a9 46 __ LDA #$46
31bc : 85 14 __ STA P7 
31be : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
31c1 : e6 12 __ INC P5 
31c3 : a9 b8 __ LDA #$b8
31c5 : 85 13 __ STA P6 
31c7 : a9 46 __ LDA #$46
31c9 : 85 14 __ STA P7 
31cb : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
31ce : e6 12 __ INC P5 
31d0 : a9 c0 __ LDA #$c0
31d2 : 85 13 __ STA P6 
31d4 : a9 46 __ LDA #$46
31d6 : 85 14 __ STA P7 
31d8 : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
31db : e6 12 __ INC P5 
31dd : a9 cf __ LDA #$cf
31df : 85 13 __ STA P6 
31e1 : a9 46 __ LDA #$46
31e3 : 85 14 __ STA P7 
31e5 : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
31e8 : e6 12 __ INC P5 
31ea : a9 dc __ LDA #$dc
31ec : 85 13 __ STA P6 
31ee : a9 46 __ LDA #$46
31f0 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
31f2 : a5 13 __ LDA P6 ; (string + 0)
31f4 : 85 0d __ STA P0 
31f6 : 85 43 __ STA T0 + 0 
31f8 : a5 14 __ LDA P7 ; (string + 1)
31fa : 85 0e __ STA P1 
31fc : 85 44 __ STA T0 + 1 
31fe : a5 12 __ LDA P5 ; (y + 0)
3200 : 0a __ __ ASL
3201 : aa __ __ TAX
3202 : bd 00 53 LDA $5300,x ; (multab + 0)
3205 : 85 46 __ STA T2 + 0 
3207 : bd 01 53 LDA $5301,x ; (multab + 1)
320a : 85 47 __ STA T2 + 1 
320c : ad df 51 LDA $51df ; (vdc_state + 7)
320f : 85 48 __ STA T3 + 0 
3211 : 20 3a 33 JSR $333a ; (strlen.s0 + 0)
3214 : a5 1b __ LDA ACCU + 0 
3216 : d0 01 __ BNE $3219 ; (vdc_prints.s6 + 0)
.s1001:
3218 : 60 __ __ RTS
.s6:
3219 : c9 01 __ CMP #$01
321b : d0 03 __ BNE $3220 ; (vdc_prints.s10 + 0)
321d : 4c a2 32 JMP $32a2 ; (vdc_prints.s8 + 0)
.s10:
3220 : 85 49 __ STA T4 + 0 
3222 : 18 __ __ CLC
3223 : a5 11 __ LDA P4 ; (x + 0)
3225 : 65 46 __ ADC T2 + 0 
3227 : 85 46 __ STA T2 + 0 
3229 : 90 02 __ BCC $322d ; (vdc_prints.s1021 + 0)
.s1020:
322b : e6 47 __ INC T2 + 1 
.s1021:
322d : 18 __ __ CLC
322e : 6d e0 51 ADC $51e0 ; (vdc_state + 8)
3231 : 85 0d __ STA P0 
3233 : ad e1 51 LDA $51e1 ; (vdc_state + 9)
3236 : 65 47 __ ADC T2 + 1 
3238 : 85 0e __ STA P1 
323a : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
323d : a5 49 __ LDA T4 + 0 
323f : f0 18 __ BEQ $3259 ; (vdc_prints.s15 + 0)
.s45:
3241 : a0 00 __ LDY #$00
.l13:
3243 : 84 45 __ STY T1 + 0 
3245 : b1 43 __ LDA (T0 + 0),y 
3247 : 20 5e 33 JSR $335e ; (pet2screen.s0 + 0)
.l175:
324a : 2c 00 d6 BIT $d600 
324d : 10 fb __ BPL $324a ; (vdc_prints.l175 + 0)
.s18:
324f : 8d 01 d6 STA $d601 
3252 : a4 45 __ LDY T1 + 0 
3254 : c8 __ __ INY
3255 : c4 49 __ CPY T4 + 0 
3257 : 90 ea __ BCC $3243 ; (vdc_prints.l13 + 0)
.s15:
3259 : ad e2 51 LDA $51e2 ; (vdc_state + 10)
325c : 18 __ __ CLC
325d : 65 46 __ ADC T2 + 0 
325f : 85 0d __ STA P0 
3261 : ad e3 51 LDA $51e3 ; (vdc_state + 11)
3264 : 65 47 __ ADC T2 + 1 
3266 : 85 0e __ STA P1 
3268 : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
326b : a6 49 __ LDX T4 + 0 
326d : ca __ __ DEX
.l178:
326e : 2c 00 d6 BIT $d600 
3271 : 10 fb __ BPL $326e ; (vdc_prints.l178 + 0)
.s22:
3273 : a5 48 __ LDA T3 + 0 
3275 : 8d 01 d6 STA $d601 
3278 : a9 18 __ LDA #$18
327a : 8d 00 d6 STA $d600 
.l180:
327d : 2c 00 d6 BIT $d600 
3280 : 10 fb __ BPL $327d ; (vdc_prints.l180 + 0)
.s28:
3282 : ad 01 d6 LDA $d601 
3285 : 29 7f __ AND #$7f
3287 : a0 18 __ LDY #$18
3289 : 8c 00 d6 STY $d600 
.l182:
328c : 2c 00 d6 BIT $d600 
328f : 10 fb __ BPL $328c ; (vdc_prints.l182 + 0)
.s34:
3291 : 8d 01 d6 STA $d601 
3294 : a9 1e __ LDA #$1e
3296 : 8d 00 d6 STA $d600 
.l184:
3299 : 2c 00 d6 BIT $d600 
329c : 10 fb __ BPL $3299 ; (vdc_prints.l184 + 0)
.s39:
329e : 8e 01 d6 STX $d601 
32a1 : 60 __ __ RTS
.s8:
32a2 : a5 11 __ LDA P4 ; (x + 0)
32a4 : 85 0d __ STA P0 
32a6 : a5 12 __ LDA P5 ; (y + 0)
32a8 : 85 0e __ STA P1 
32aa : a5 48 __ LDA T3 + 0 
32ac : 85 10 __ STA P3 
32ae : a0 00 __ LDY #$00
32b0 : b1 13 __ LDA (P6),y ; (string + 0)
32b2 : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
32b4 : a5 0e __ LDA P1 ; (y + 0)
32b6 : 0a __ __ ASL
32b7 : a2 12 __ LDX #$12
32b9 : 8e 00 d6 STX $d600 
32bc : aa __ __ TAX
32bd : 18 __ __ CLC
32be : a5 0d __ LDA P0 ; (x + 0)
32c0 : 7d 00 53 ADC $5300,x ; (multab + 0)
32c3 : 85 1b __ STA ACCU + 0 
32c5 : a9 00 __ LDA #$00
32c7 : 7d 01 53 ADC $5301,x ; (multab + 1)
32ca : 85 1c __ STA ACCU + 1 
32cc : 18 __ __ CLC
32cd : a5 1b __ LDA ACCU + 0 
32cf : 6d e0 51 ADC $51e0 ; (vdc_state + 8)
32d2 : aa __ __ TAX
32d3 : a5 1c __ LDA ACCU + 1 
32d5 : 6d e1 51 ADC $51e1 ; (vdc_state + 9)
.l167:
32d8 : 2c 00 d6 BIT $d600 
32db : 10 fb __ BPL $32d8 ; (vdc_printc.l167 + 0)
.s9:
32dd : 8d 01 d6 STA $d601 
32e0 : a9 13 __ LDA #$13
32e2 : 8d 00 d6 STA $d600 
.l169:
32e5 : 2c 00 d6 BIT $d600 
32e8 : 10 fb __ BPL $32e5 ; (vdc_printc.l169 + 0)
.s14:
32ea : 8e 01 d6 STX $d601 
32ed : a9 1f __ LDA #$1f
32ef : 8d 00 d6 STA $d600 
.l171:
32f2 : 2c 00 d6 BIT $d600 
32f5 : 10 fb __ BPL $32f2 ; (vdc_printc.l171 + 0)
.s18:
32f7 : a5 0f __ LDA P2 ; (val + 0)
32f9 : 8d 01 d6 STA $d601 
32fc : ad e2 51 LDA $51e2 ; (vdc_state + 10)
32ff : 18 __ __ CLC
3300 : 65 1b __ ADC ACCU + 0 
3302 : a8 __ __ TAY
3303 : a9 12 __ LDA #$12
3305 : 8d 00 d6 STA $d600 
3308 : ad e3 51 LDA $51e3 ; (vdc_state + 11)
330b : 65 1c __ ADC ACCU + 1 
.l173:
330d : 2c 00 d6 BIT $d600 
3310 : 10 fb __ BPL $330d ; (vdc_printc.l173 + 0)
.s25:
3312 : 8d 01 d6 STA $d601 
3315 : a9 13 __ LDA #$13
3317 : 8d 00 d6 STA $d600 
.l175:
331a : 2c 00 d6 BIT $d600 
331d : 10 fb __ BPL $331a ; (vdc_printc.l175 + 0)
.s30:
331f : 8c 01 d6 STY $d601 
3322 : a9 1f __ LDA #$1f
3324 : 8d 00 d6 STA $d600 
.l177:
3327 : 2c 00 d6 BIT $d600 
332a : 10 fb __ BPL $3327 ; (vdc_printc.l177 + 0)
.s34:
332c : a5 10 __ LDA P3 ; (attr + 0)
332e : 8d 01 d6 STA $d601 
.s1001:
3331 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
3332 : a5 17 __ LDA P10 
3334 : 85 0d __ STA P0 
3336 : a5 18 __ LDA P11 
3338 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
333a : a9 00 __ LDA #$00
333c : 85 1b __ STA ACCU + 0 
333e : 85 1c __ STA ACCU + 1 
3340 : a8 __ __ TAY
3341 : b1 0d __ LDA (P0),y ; (str + 0)
3343 : f0 18 __ BEQ $335d ; (strlen.s1001 + 0)
.s2:
3345 : a5 0d __ LDA P0 ; (str + 0)
3347 : 85 1b __ STA ACCU + 0 
3349 : a2 00 __ LDX #$00
.l1002:
334b : c8 __ __ INY
334c : d0 01 __ BNE $334f ; (strlen.s1005 + 0)
.s1004:
334e : e8 __ __ INX
.s1005:
334f : 8a __ __ TXA
3350 : 18 __ __ CLC
3351 : 65 0e __ ADC P1 ; (str + 1)
3353 : 85 1c __ STA ACCU + 1 
3355 : b1 1b __ LDA (ACCU + 0),y 
3357 : d0 f2 __ BNE $334b ; (strlen.l1002 + 0)
.s1003:
3359 : 86 1c __ STX ACCU + 1 
335b : 84 1b __ STY ACCU + 0 
.s1001:
335d : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
335e : c9 20 __ CMP #$20
3360 : b0 03 __ BCS $3365 ; (pet2screen.s2 + 0)
.s1:
3362 : 69 80 __ ADC #$80
3364 : 60 __ __ RTS
.s2:
3365 : c9 40 __ CMP #$40
3367 : 90 27 __ BCC $3390 ; (pet2screen.s21 + 0)
.s7:
3369 : c9 60 __ CMP #$60
336b : 90 17 __ BCC $3384 ; (pet2screen.s4 + 0)
.s11:
336d : 09 00 __ ORA #$00
336f : 30 04 __ BMI $3375 ; (pet2screen.s9 + 0)
.s8:
3371 : 38 __ __ SEC
3372 : e9 20 __ SBC #$20
3374 : 60 __ __ RTS
.s9:
3375 : c9 80 __ CMP #$80
3377 : 90 17 __ BCC $3390 ; (pet2screen.s21 + 0)
.s15:
3379 : c9 a0 __ CMP #$a0
337b : b0 03 __ BCS $3380 ; (pet2screen.s19 + 0)
.s12:
337d : 69 40 __ ADC #$40
337f : 60 __ __ RTS
.s19:
3380 : c9 c0 __ CMP #$c0
3382 : b0 04 __ BCS $3388 ; (pet2screen.s23 + 0)
.s4:
3384 : 38 __ __ SEC
3385 : e9 40 __ SBC #$40
3387 : 60 __ __ RTS
.s23:
3388 : c9 ff __ CMP #$ff
338a : b0 04 __ BCS $3390 ; (pet2screen.s21 + 0)
.s20:
338c : 38 __ __ SEC
338d : e9 80 __ SBC #$80
338f : 60 __ __ RTS
.s21:
3390 : c9 ff __ CMP #$ff
3392 : d0 02 __ BNE $3396 ; (pet2screen.s1001 + 0)
.s24:
3394 : a9 5e __ LDA #$5e
.s1001:
3396 : 60 __ __ RTS
--------------------------------------------------------------------
3397 : __ __ __ BYT 76 64 63 73 65 20 2d 20 70 72 67 20 67 45 4e 45 : vdcse - prg gENE
33a7 : __ __ __ BYT 52 41 54 4f 52 2e 00                            : RATOR..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
33ae : a9 00 __ LDA #$00
33b0 : 8d fc bf STA $bffc ; (sstack + 4)
33b3 : a0 02 __ LDY #$02
33b5 : b1 23 __ LDA (SP + 0),y 
33b7 : 85 16 __ STA P9 
33b9 : c8 __ __ INY
33ba : b1 23 __ LDA (SP + 0),y 
33bc : 85 17 __ STA P10 
33be : c8 __ __ INY
33bf : b1 23 __ LDA (SP + 0),y 
33c1 : 8d f8 bf STA $bff8 ; (sstack + 0)
33c4 : c8 __ __ INY
33c5 : b1 23 __ LDA (SP + 0),y 
33c7 : 8d f9 bf STA $bff9 ; (sstack + 1)
33ca : 18 __ __ CLC
33cb : a5 23 __ LDA SP + 0 
33cd : 69 06 __ ADC #$06
33cf : 8d fa bf STA $bffa ; (sstack + 2)
33d2 : a5 24 __ LDA SP + 1 
33d4 : 69 00 __ ADC #$00
33d6 : 8d fb bf STA $bffb ; (sstack + 3)
33d9 : 4c 03 23 JMP $2303 ; (sformat.s1000 + 0)
--------------------------------------------------------------------
33dc : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 30 39 2d 31 38 32 : V20-20240409-182
33ec : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
krnio_open@proxy: ; krnio_open@proxy
33ee : a5 10 __ LDA P3 
33f0 : 85 0e __ STA P1 
33f2 : 4c 0c 3d JMP $3d0c ; (krnio_open.s0 + 0)
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
33f5 : 4c b7 ff JMP $ffb7 
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
33f8 : 4c cc ff JMP $ffcc 
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s0:
33fb : 4c c3 ff JMP $ffc3 
--------------------------------------------------------------------
33fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
33ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
3400 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
3410 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 2c 20 56 : BY xANDER mOL, V
3420 : __ __ __ BYT 45 52 53 49 4f 4e 20 25 53 00                   : ERSION %S.
--------------------------------------------------------------------
filepicker: ; filepicker(u8)->void
.s1000:
342a : a2 05 __ LDX #$05
342c : b5 53 __ LDA T0 + 0,x 
342e : 9d cd bf STA $bfcd,x ; (buff + 35)
3431 : ca __ __ DEX
3432 : 10 f8 __ BPL $342c ; (filepicker.s1000 + 2)
.s0:
3434 : a9 0a __ LDA #$0a
3436 : 85 0f __ STA P2 
3438 : a9 02 __ LDA #$02
343a : 85 10 __ STA P3 
343c : a9 20 __ LDA #$20
343e : 85 11 __ STA P4 
3440 : a9 3c __ LDA #$3c
3442 : 85 12 __ STA P5 
3444 : a9 14 __ LDA #$14
3446 : 85 13 __ STA P6 
3448 : a9 00 __ LDA #$00
344a : a2 21 __ LDX #$21
.l1002:
344c : ca __ __ DEX
344d : 9d d1 52 STA $52d1,x ; (cwd + 0)
3450 : d0 fa __ BNE $344c ; (filepicker.l1002 + 0)
.s1003:
3452 : 8d fa 50 STA $50fa ; (disk_id_buf + 0)
3455 : 8d fb 50 STA $50fb ; (disk_id_buf + 1)
3458 : 8d fc 50 STA $50fc ; (disk_id_buf + 2)
345b : 8d fd 50 STA $50fd ; (disk_id_buf + 3)
345e : 8d fe 50 STA $50fe ; (disk_id_buf + 4)
3461 : a2 15 __ LDX #$15
.l1004:
3463 : ca __ __ DEX
3464 : 9d bb 50 STA $50bb,x ; (filename + 0)
3467 : d0 fa __ BNE $3463 ; (filepicker.l1004 + 0)
.s1005:
3469 : ad 79 50 LDA $5079 ; (mc_menupopup + 0)
346c : 85 53 __ STA T0 + 0 
346e : 8d df 51 STA $51df ; (vdc_state + 7)
3471 : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
3474 : a9 0b __ LDA #$0b
3476 : 85 11 __ STA P4 
3478 : a9 03 __ LDA #$03
347a : 85 12 __ STA P5 
347c : a5 53 __ LDA T0 + 0 
347e : 09 20 __ ORA #$20
3480 : 85 54 __ STA T1 + 0 
3482 : 8d df 51 STA $51df ; (vdc_state + 7)
3485 : a9 30 __ LDA #$30
3487 : 85 13 __ STA P6 
3489 : a9 39 __ LDA #$39
348b : 85 14 __ STA P7 
348d : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
3490 : a5 54 __ LDA T1 + 0 
3492 : 29 df __ AND #$df
3494 : 8d df 51 STA $51df ; (vdc_state + 7)
3497 : ad ef 50 LDA $50ef ; (targetdevice + 0)
349a : 8d ff bf STA $bfff ; (sstack + 7)
349d : 20 48 39 JSR $3948 ; (refreshDir.s0 + 0)
34a0 : 20 6a 31 JSR $316a ; (updateMenu.s0 + 0)
.l3:
34a3 : ad ea 52 LDA $52ea ; (cwd + 25)
34a6 : 85 54 __ STA T1 + 0 
34a8 : 8d fd 51 STA $51fd ; (current + 0)
34ab : ad eb 52 LDA $52eb ; (cwd + 26)
34ae : 85 55 __ STA T1 + 1 
34b0 : 8d fe 51 STA $51fe ; (current + 1)
34b3 : ad ee 52 LDA $52ee ; (cwd + 29)
34b6 : 85 56 __ STA T2 + 0 
34b8 : ad ef 52 LDA $52ef ; (cwd + 30)
34bb : 85 57 __ STA T2 + 1 
34bd : 20 e7 46 JSR $46e7 ; (vdcwin_getch.s0 + 0)
34c0 : a5 1b __ LDA ACCU + 0 
34c2 : 85 43 __ STA T3 + 0 
34c4 : a5 1c __ LDA ACCU + 1 
34c6 : 85 44 __ STA T3 + 1 
34c8 : d0 09 __ BNE $34d3 ; (filepicker.s89 + 0)
.s1058:
34ca : a5 1b __ LDA ACCU + 0 
34cc : c9 32 __ CMP #$32
34ce : d0 03 __ BNE $34d3 ; (filepicker.s89 + 0)
34d0 : 4c 92 36 JMP $3692 ; (filepicker.s7 + 0)
.s89:
34d3 : a5 56 __ LDA T2 + 0 
34d5 : 85 1b __ STA ACCU + 0 
34d7 : a5 57 __ LDA T2 + 1 
34d9 : 85 1c __ STA ACCU + 1 
34db : a9 0e __ LDA #$0e
34dd : 85 03 __ STA WORK + 0 
34df : a9 00 __ LDA #$00
34e1 : 85 04 __ STA WORK + 1 
34e3 : 20 e6 4c JSR $4ce6 ; (divmod + 0)
34e6 : a5 1b __ LDA ACCU + 0 
34e8 : 85 45 __ STA T4 + 0 
34ea : 0a __ __ ASL
34eb : 0a __ __ ASL
34ec : 0a __ __ ASL
34ed : 38 __ __ SEC
34ee : e5 1b __ SBC ACCU + 0 
34f0 : 0a __ __ ASL
34f1 : 49 ff __ EOR #$ff
34f3 : 38 __ __ SEC
34f4 : 65 56 __ ADC T2 + 0 
34f6 : 85 58 __ STA T5 + 0 
34f8 : 18 __ __ CLC
34f9 : 69 06 __ ADC #$06
34fb : 85 47 __ STA T6 + 0 
34fd : a5 44 __ LDA T3 + 1 
34ff : 10 03 __ BPL $3504 ; (filepicker.s1057 + 0)
3501 : 4c ee 37 JMP $37ee ; (filepicker.s91 + 0)
.s1057:
3504 : d0 09 __ BNE $350f ; (filepicker.s90 + 0)
.s1056:
3506 : a5 43 __ LDA T3 + 0 
3508 : c9 32 __ CMP #$32
350a : b0 03 __ BCS $350f ; (filepicker.s90 + 0)
350c : 4c ee 37 JMP $37ee ; (filepicker.s91 + 0)
.s90:
350f : a5 44 __ LDA T3 + 1 
3511 : d0 90 __ BNE $34a3 ; (filepicker.l3 + 0)
.s1032:
3513 : a5 43 __ LDA T3 + 0 
3515 : c9 55 __ CMP #$55
3517 : d0 6f __ BNE $3588 ; (filepicker.s1031 + 0)
.s76:
3519 : ad e8 52 LDA $52e8 ; (cwd + 23)
351c : 0d e9 52 ORA $52e9 ; (cwd + 24)
351f : f0 82 __ BEQ $34a3 ; (filepicker.l3 + 0)
.s80:
3521 : a0 17 __ LDY #$17
3523 : b1 54 __ LDA (T1 + 0),y 
3525 : c8 __ __ INY
3526 : 11 54 __ ORA (T1 + 0),y 
3528 : d0 03 __ BNE $352d ; (filepicker.s77 + 0)
352a : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s77:
352d : a5 47 __ LDA T6 + 0 
352f : 8d fd bf STA $bffd ; (sstack + 5)
3532 : a9 00 __ LDA #$00
3534 : 8d ea 52 STA $52ea ; (cwd + 25)
3537 : 8d eb 52 STA $52eb ; (cwd + 26)
353a : 20 87 44 JSR $4487 ; (printElementPriv.s1000 + 0)
353d : a2 0e __ LDX #$0e
.l82:
353f : ad fd 51 LDA $51fd ; (current + 0)
3542 : 85 54 __ STA T1 + 0 
3544 : ad fe 51 LDA $51fe ; (current + 1)
3547 : 85 55 __ STA T1 + 1 
3549 : a0 17 __ LDY #$17
354b : b1 54 __ LDA (T1 + 0),y 
354d : 85 02 __ STA $02 
354f : c8 __ __ INY
3550 : b1 54 __ LDA (T1 + 0),y 
3552 : a8 __ __ TAY
3553 : 05 02 __ ORA $02 
3555 : f0 22 __ BEQ $3579 ; (filepicker.s172 + 0)
.s85:
3557 : 8c fe 51 STY $51fe ; (current + 1)
355a : 8c eb 52 STY $52eb ; (cwd + 26)
355d : 8c ed 52 STY $52ed ; (cwd + 28)
3560 : a5 02 __ LDA $02 
3562 : 8d fd 51 STA $51fd ; (current + 0)
3565 : 8d ea 52 STA $52ea ; (cwd + 25)
3568 : 8d ec 52 STA $52ec ; (cwd + 27)
356b : ad ee 52 LDA $52ee ; (cwd + 29)
356e : 18 __ __ CLC
356f : 69 ff __ ADC #$ff
3571 : 8d ee 52 STA $52ee ; (cwd + 29)
3574 : b0 03 __ BCS $3579 ; (filepicker.s172 + 0)
.s1063:
3576 : ce ef 52 DEC $52ef ; (cwd + 30)
.s172:
3579 : ca __ __ DEX
357a : d0 c3 __ BNE $353f ; (filepicker.l82 + 0)
.s228:
357c : ad ef 50 LDA $50ef ; (targetdevice + 0)
357f : 8d fe bf STA $bffe ; (sstack + 6)
3582 : 20 83 39 JSR $3983 ; (printDir.s1000 + 0)
3585 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s1031:
3588 : b0 03 __ BCS $358d ; (filepicker.s1018 + 0)
358a : 4c ae 36 JMP $36ae ; (filepicker.s107 + 0)
.s1018:
358d : c9 89 __ CMP #$89
358f : d0 03 __ BNE $3594 ; (filepicker.s1013 + 0)
3591 : 4c 92 36 JMP $3692 ; (filepicker.s7 + 0)
.s1013:
3594 : b0 13 __ BCS $35a9 ; (filepicker.s1010 + 0)
.s115:
3596 : c9 85 __ CMP #$85
3598 : f0 03 __ BEQ $359d ; (filepicker.s227 + 0)
359a : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s227:
359d : ad ef 50 LDA $50ef ; (targetdevice + 0)
35a0 : 8d ff bf STA $bfff ; (sstack + 7)
35a3 : 20 48 39 JSR $3948 ; (refreshDir.s0 + 0)
35a6 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s1010:
35a9 : c9 91 __ CMP #$91
35ab : f0 03 __ BEQ $35b0 ; (filepicker.s43 + 0)
35ad : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s43:
35b0 : ad e8 52 LDA $52e8 ; (cwd + 23)
35b3 : 0d e9 52 ORA $52e9 ; (cwd + 24)
35b6 : d0 03 __ BNE $35bb ; (filepicker.s48 + 0)
35b8 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s48:
35bb : a5 54 __ LDA T1 + 0 
35bd : 05 55 __ ORA T1 + 1 
35bf : d0 03 __ BNE $35c4 ; (filepicker.s47 + 0)
35c1 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s47:
35c4 : a0 17 __ LDY #$17
35c6 : b1 54 __ LDA (T1 + 0),y 
35c8 : 85 02 __ STA $02 
35ca : c8 __ __ INY
35cb : b1 54 __ LDA (T1 + 0),y 
35cd : 85 55 __ STA T1 + 1 
35cf : 05 02 __ ORA $02 
35d1 : d0 03 __ BNE $35d6 ; (filepicker.s44 + 0)
35d3 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s44:
35d6 : a5 02 __ LDA $02 
35d8 : 8d fd 51 STA $51fd ; (current + 0)
35db : 8d ea 52 STA $52ea ; (cwd + 25)
35de : a5 55 __ LDA T1 + 1 
35e0 : 8d fe 51 STA $51fe ; (current + 1)
35e3 : 8d eb 52 STA $52eb ; (cwd + 26)
35e6 : 18 __ __ CLC
35e7 : a5 56 __ LDA T2 + 0 
35e9 : 69 ff __ ADC #$ff
35eb : 8d ee 52 STA $52ee ; (cwd + 29)
35ee : a5 57 __ LDA T2 + 1 
35f0 : 69 ff __ ADC #$ff
35f2 : 8d ef 52 STA $52ef ; (cwd + 30)
35f5 : 38 __ __ SEC
35f6 : a5 56 __ LDA T2 + 0 
35f8 : e9 01 __ SBC #$01
35fa : 85 1b __ STA ACCU + 0 
35fc : a5 57 __ LDA T2 + 1 
35fe : e9 00 __ SBC #$00
3600 : 85 1c __ STA ACCU + 1 
3602 : a9 0e __ LDA #$0e
3604 : 85 03 __ STA WORK + 0 
3606 : a9 00 __ LDA #$00
3608 : 85 04 __ STA WORK + 1 
360a : 20 e6 4c JSR $4ce6 ; (divmod + 0)
360d : a5 45 __ LDA T4 + 0 
360f : c5 1b __ CMP ACCU + 0 
3611 : f0 41 __ BEQ $3654 ; (filepicker.s50 + 0)
.s49:
3613 : a2 0d __ LDX #$0d
.l53:
3615 : ad fd 51 LDA $51fd ; (current + 0)
3618 : 85 56 __ STA T2 + 0 
361a : ad fe 51 LDA $51fe ; (current + 1)
361d : 85 57 __ STA T2 + 1 
361f : a0 17 __ LDY #$17
3621 : b1 56 __ LDA (T2 + 0),y 
3623 : 85 02 __ STA $02 
3625 : c8 __ __ INY
3626 : b1 56 __ LDA (T2 + 0),y 
3628 : 85 57 __ STA T2 + 1 
362a : d0 04 __ BNE $3630 ; (filepicker.s56 + 0)
.s1006:
362c : a5 02 __ LDA $02 
362e : f0 0a __ BEQ $363a ; (filepicker.s174 + 0)
.s56:
3630 : a5 02 __ LDA $02 
3632 : 8d fd 51 STA $51fd ; (current + 0)
3635 : a5 57 __ LDA T2 + 1 
3637 : 8d fe 51 STA $51fe ; (current + 1)
.s174:
363a : ca __ __ DEX
363b : d0 d8 __ BNE $3615 ; (filepicker.l53 + 0)
.s55:
363d : ad fd 51 LDA $51fd ; (current + 0)
3640 : 85 54 __ STA T1 + 0 
3642 : ad fe 51 LDA $51fe ; (current + 1)
3645 : 85 55 __ STA T1 + 1 
.s230:
3647 : a5 54 __ LDA T1 + 0 
3649 : 8d ec 52 STA $52ec ; (cwd + 27)
364c : a5 55 __ LDA T1 + 1 
364e : 8d ed 52 STA $52ed ; (cwd + 28)
3651 : 4c 7c 35 JMP $357c ; (filepicker.s228 + 0)
.s50:
3654 : a5 02 __ LDA $02 
3656 : 85 54 __ STA T1 + 0 
3658 : a5 47 __ LDA T6 + 0 
365a : 8d fd bf STA $bffd ; (sstack + 5)
365d : a0 15 __ LDY #$15
365f : b1 54 __ LDA (T1 + 0),y 
3661 : 8d fd 51 STA $51fd ; (current + 0)
3664 : c8 __ __ INY
3665 : b1 54 __ LDA (T1 + 0),y 
3667 : 8d fe 51 STA $51fe ; (current + 1)
366a : 20 87 44 JSR $4487 ; (printElementPriv.s1000 + 0)
366d : ad fd 51 LDA $51fd ; (current + 0)
3670 : 85 54 __ STA T1 + 0 
3672 : ad fe 51 LDA $51fe ; (current + 1)
3675 : 85 55 __ STA T1 + 1 
3677 : a0 17 __ LDY #$17
3679 : b1 54 __ LDA (T1 + 0),y 
367b : 8d fd 51 STA $51fd ; (current + 0)
367e : c8 __ __ INY
367f : b1 54 __ LDA (T1 + 0),y 
3681 : 8d fe 51 STA $51fe ; (current + 1)
3684 : 18 __ __ CLC
3685 : a5 58 __ LDA T5 + 0 
3687 : 69 05 __ ADC #$05
.s229:
3689 : 8d fd bf STA $bffd ; (sstack + 5)
368c : 20 87 44 JSR $4487 ; (printElementPriv.s1000 + 0)
368f : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s7:
3692 : ee ef 50 INC $50ef ; (targetdevice + 0)
3695 : ad ef 50 LDA $50ef ; (targetdevice + 0)
3698 : c9 1f __ CMP #$1f
369a : 90 05 __ BCC $36a1 ; (filepicker.s10 + 0)
.s8:
369c : a9 08 __ LDA #$08
.s1059:
369e : 8d ef 50 STA $50ef ; (targetdevice + 0)
.s10:
36a1 : a9 00 __ LDA #$00
36a3 : a2 21 __ LDX #$21
.l1014:
36a5 : ca __ __ DEX
36a6 : 9d d1 52 STA $52d1,x ; (cwd + 0)
36a9 : d0 fa __ BNE $36a5 ; (filepicker.l1014 + 0)
36ab : 4c 9d 35 JMP $359d ; (filepicker.s227 + 0)
.s107:
36ae : c9 50 __ CMP #$50
36b0 : d0 63 __ BNE $3715 ; (filepicker.s108 + 0)
.s64:
36b2 : ad e8 52 LDA $52e8 ; (cwd + 23)
36b5 : 0d e9 52 ORA $52e9 ; (cwd + 24)
36b8 : d0 03 __ BNE $36bd ; (filepicker.s68 + 0)
36ba : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s68:
36bd : a0 15 __ LDY #$15
36bf : b1 54 __ LDA (T1 + 0),y 
36c1 : c8 __ __ INY
36c2 : 11 54 __ ORA (T1 + 0),y 
36c4 : d0 03 __ BNE $36c9 ; (filepicker.s65 + 0)
36c6 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s65:
36c9 : a5 47 __ LDA T6 + 0 
36cb : 8d fd bf STA $bffd ; (sstack + 5)
36ce : a9 00 __ LDA #$00
36d0 : 8d ea 52 STA $52ea ; (cwd + 25)
36d3 : 8d eb 52 STA $52eb ; (cwd + 26)
36d6 : 20 87 44 JSR $4487 ; (printElementPriv.s1000 + 0)
36d9 : a2 0e __ LDX #$0e
.l70:
36db : ad fd 51 LDA $51fd ; (current + 0)
36de : 85 54 __ STA T1 + 0 
36e0 : ad fe 51 LDA $51fe ; (current + 1)
36e3 : 85 55 __ STA T1 + 1 
36e5 : a0 15 __ LDY #$15
36e7 : b1 54 __ LDA (T1 + 0),y 
36e9 : 85 02 __ STA $02 
36eb : c8 __ __ INY
36ec : b1 54 __ LDA (T1 + 0),y 
36ee : a8 __ __ TAY
36ef : 05 02 __ ORA $02 
36f1 : f0 1c __ BEQ $370f ; (filepicker.s173 + 0)
.s73:
36f3 : 8c fe 51 STY $51fe ; (current + 1)
36f6 : 8c eb 52 STY $52eb ; (cwd + 26)
36f9 : 8c ed 52 STY $52ed ; (cwd + 28)
36fc : a5 02 __ LDA $02 
36fe : 8d fd 51 STA $51fd ; (current + 0)
3701 : 8d ea 52 STA $52ea ; (cwd + 25)
3704 : 8d ec 52 STA $52ec ; (cwd + 27)
3707 : ee ee 52 INC $52ee ; (cwd + 29)
370a : d0 03 __ BNE $370f ; (filepicker.s173 + 0)
.s1065:
370c : ee ef 52 INC $52ef ; (cwd + 30)
.s173:
370f : ca __ __ DEX
3710 : d0 c9 __ BNE $36db ; (filepicker.l70 + 0)
3712 : 4c 7c 35 JMP $357c ; (filepicker.s228 + 0)
.s108:
3715 : 90 03 __ BCC $371a ; (filepicker.s110 + 0)
3717 : 4c c3 37 JMP $37c3 ; (filepicker.s109 + 0)
.s110:
371a : c9 45 __ CMP #$45
371c : f0 03 __ BEQ $3721 ; (filepicker.s19 + 0)
371e : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s19:
3721 : ad e8 52 LDA $52e8 ; (cwd + 23)
3724 : 0d e9 52 ORA $52e9 ; (cwd + 24)
3727 : d0 03 __ BNE $372c ; (filepicker.s20 + 0)
3729 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s20:
372c : ad e8 52 LDA $52e8 ; (cwd + 23)
372f : 8d fd 51 STA $51fd ; (current + 0)
3732 : ad e9 52 LDA $52e9 ; (cwd + 24)
3735 : 8d fe 51 STA $51fe ; (current + 1)
3738 : a9 00 __ LDA #$00
373a : 85 54 __ STA T1 + 0 
373c : 85 55 __ STA T1 + 1 
.l24:
373e : ad fd 51 LDA $51fd ; (current + 0)
3741 : 85 43 __ STA T3 + 0 
3743 : ad fe 51 LDA $51fe ; (current + 1)
3746 : 85 44 __ STA T3 + 1 
3748 : a0 15 __ LDY #$15
374a : b1 43 __ LDA (T3 + 0),y 
374c : 85 45 __ STA T4 + 0 
374e : c8 __ __ INY
374f : b1 43 __ LDA (T3 + 0),y 
3751 : 85 46 __ STA T4 + 1 
3753 : d0 18 __ BNE $376d ; (filepicker.s26 + 0)
.s1023:
3755 : a5 45 __ LDA T4 + 0 
3757 : d0 14 __ BNE $376d ; (filepicker.s26 + 0)
.s25:
3759 : a5 43 __ LDA T3 + 0 
375b : 8d ea 52 STA $52ea ; (cwd + 25)
375e : a5 44 __ LDA T3 + 1 
3760 : 8d eb 52 STA $52eb ; (cwd + 26)
3763 : a5 54 __ LDA T1 + 0 
3765 : 8d ee 52 STA $52ee ; (cwd + 29)
3768 : a5 55 __ LDA T1 + 1 
376a : 4c bd 37 JMP $37bd ; (filepicker.s1060 + 0)
.s26:
376d : a5 45 __ LDA T4 + 0 
376f : 8d fd 51 STA $51fd ; (current + 0)
3772 : a5 46 __ LDA T4 + 1 
3774 : 8d fe 51 STA $51fe ; (current + 1)
3777 : a5 54 __ LDA T1 + 0 
3779 : 85 1b __ STA ACCU + 0 
377b : a5 55 __ LDA T1 + 1 
377d : 85 1c __ STA ACCU + 1 
377f : a9 0e __ LDA #$0e
3781 : 85 03 __ STA WORK + 0 
3783 : a9 00 __ LDA #$00
3785 : 85 04 __ STA WORK + 1 
3787 : 20 e6 4c JSR $4ce6 ; (divmod + 0)
378a : a5 1b __ LDA ACCU + 0 
378c : 85 56 __ STA T2 + 0 
378e : 18 __ __ CLC
378f : a5 54 __ LDA T1 + 0 
3791 : 69 01 __ ADC #$01
3793 : 85 54 __ STA T1 + 0 
3795 : 85 1b __ STA ACCU + 0 
3797 : a5 55 __ LDA T1 + 1 
3799 : 69 00 __ ADC #$00
379b : 85 55 __ STA T1 + 1 
379d : 85 1c __ STA ACCU + 1 
379f : a9 0e __ LDA #$0e
37a1 : 85 03 __ STA WORK + 0 
37a3 : a9 00 __ LDA #$00
37a5 : 85 04 __ STA WORK + 1 
37a7 : 20 e6 4c JSR $4ce6 ; (divmod + 0)
37aa : a5 56 __ LDA T2 + 0 
37ac : c5 1b __ CMP ACCU + 0 
37ae : f0 8e __ BEQ $373e ; (filepicker.l24 + 0)
.s29:
37b0 : a5 45 __ LDA T4 + 0 
37b2 : 8d ec 52 STA $52ec ; (cwd + 27)
37b5 : a5 46 __ LDA T4 + 1 
37b7 : 8d ed 52 STA $52ed ; (cwd + 28)
37ba : 4c 3e 37 JMP $373e ; (filepicker.l24 + 0)
.s1060:
37bd : 8d ef 52 STA $52ef ; (cwd + 30)
37c0 : 4c 7c 35 JMP $357c ; (filepicker.s228 + 0)
.s109:
37c3 : c9 54 __ CMP #$54
37c5 : f0 03 __ BEQ $37ca ; (filepicker.s15 + 0)
37c7 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s15:
37ca : ad e8 52 LDA $52e8 ; (cwd + 23)
37cd : 0d e9 52 ORA $52e9 ; (cwd + 24)
37d0 : d0 03 __ BNE $37d5 ; (filepicker.s16 + 0)
37d2 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s16:
37d5 : ad e8 52 LDA $52e8 ; (cwd + 23)
37d8 : 8d ea 52 STA $52ea ; (cwd + 25)
37db : 8d ec 52 STA $52ec ; (cwd + 27)
37de : ad e9 52 LDA $52e9 ; (cwd + 24)
37e1 : 8d eb 52 STA $52eb ; (cwd + 26)
37e4 : 8d ed 52 STA $52ed ; (cwd + 28)
37e7 : a9 00 __ LDA #$00
37e9 : 8d ee 52 STA $52ee ; (cwd + 29)
37ec : f0 cf __ BEQ $37bd ; (filepicker.s1060 + 0)
.s91:
37ee : a5 44 __ LDA T3 + 1 
37f0 : d0 06 __ BNE $37f8 ; (filepicker.s92 + 0)
.s1055:
37f2 : a5 43 __ LDA T3 + 0 
37f4 : c9 13 __ CMP #$13
37f6 : f0 d2 __ BEQ $37ca ; (filepicker.s15 + 0)
.s92:
37f8 : a5 44 __ LDA T3 + 1 
37fa : 30 51 __ BMI $384d ; (filepicker.s94 + 0)
.s1054:
37fc : d0 06 __ BNE $3804 ; (filepicker.s93 + 0)
.s1053:
37fe : a5 43 __ LDA T3 + 0 
3800 : c9 13 __ CMP #$13
3802 : 90 49 __ BCC $384d ; (filepicker.s94 + 0)
.s93:
3804 : a5 43 __ LDA T3 + 0 
3806 : c9 2b __ CMP #$2b
3808 : d0 03 __ BNE $380d ; (filepicker.s100 + 0)
380a : 4c 92 36 JMP $3692 ; (filepicker.s7 + 0)
.s100:
380d : b0 25 __ BCS $3834 ; (filepicker.s101 + 0)
.s102:
380f : c9 1b __ CMP #$1b
3811 : f0 03 __ BEQ $3816 ; (filepicker.s4 + 0)
3813 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s4:
3816 : ad d1 52 LDA $52d1 ; (cwd + 0)
3819 : f0 03 __ BEQ $381e ; (filepicker.s120 + 0)
.s118:
381b : 20 53 3c JSR $3c53 ; (freeDir.s0 + 0)
.s120:
381e : a9 02 __ LDA #$02
3820 : 85 10 __ STA P3 
3822 : a9 14 __ LDA #$14
3824 : 85 13 __ STA P6 
3826 : 20 56 50 JSR $5056 ; (vdc_clear@proxy + 0)
.s1001:
3829 : a2 05 __ LDX #$05
382b : bd cd bf LDA $bfcd,x ; (buff + 35)
382e : 95 53 __ STA T0 + 0,x 
3830 : ca __ __ DEX
3831 : 10 f8 __ BPL $382b ; (filepicker.s1001 + 2)
3833 : 60 __ __ RTS
.s101:
3834 : c9 2d __ CMP #$2d
3836 : f0 03 __ BEQ $383b ; (filepicker.s11 + 0)
3838 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s11:
383b : ce ef 50 DEC $50ef ; (targetdevice + 0)
383e : ad ef 50 LDA $50ef ; (targetdevice + 0)
3841 : c9 08 __ CMP #$08
3843 : 90 03 __ BCC $3848 ; (filepicker.s12 + 0)
3845 : 4c a1 36 JMP $36a1 ; (filepicker.s10 + 0)
.s12:
3848 : a9 1e __ LDA #$1e
384a : 4c 9e 36 JMP $369e ; (filepicker.s1059 + 0)
.s94:
384d : a5 44 __ LDA T3 + 1 
384f : d0 27 __ BNE $3878 ; (filepicker.s95 + 0)
.s1052:
3851 : a5 43 __ LDA T3 + 0 
3853 : c9 0d __ CMP #$0d
3855 : d0 21 __ BNE $3878 ; (filepicker.s95 + 0)
.s59:
3857 : ad e8 52 LDA $52e8 ; (cwd + 23)
385a : 0d e9 52 ORA $52e9 ; (cwd + 24)
385d : d0 03 __ BNE $3862 ; (filepicker.s63 + 0)
385f : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s63:
3862 : a5 54 __ LDA T1 + 0 
3864 : 05 55 __ ORA T1 + 1 
3866 : d0 03 __ BNE $386b ; (filepicker.s60 + 0)
3868 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s60:
386b : a0 ff __ LDY #$ff
.l1050:
386d : c8 __ __ INY
386e : b1 54 __ LDA (T1 + 0),y 
3870 : 99 bb 50 STA $50bb,y ; (filename + 0)
3873 : d0 f8 __ BNE $386d ; (filepicker.l1050 + 0)
3875 : 4c 16 38 JMP $3816 ; (filepicker.s4 + 0)
.s95:
3878 : a5 44 __ LDA T3 + 1 
387a : 30 08 __ BMI $3884 ; (filepicker.s97 + 0)
.s1049:
387c : d0 16 __ BNE $3894 ; (filepicker.s96 + 0)
.s1048:
387e : a5 43 __ LDA T3 + 0 
3880 : c9 0d __ CMP #$0d
3882 : b0 10 __ BCS $3894 ; (filepicker.s96 + 0)
.s97:
3884 : a5 44 __ LDA T3 + 1 
3886 : f0 03 __ BEQ $388b ; (filepicker.s1047 + 0)
3888 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s1047:
388b : a5 43 __ LDA T3 + 0 
388d : c9 03 __ CMP #$03
388f : f0 85 __ BEQ $3816 ; (filepicker.s4 + 0)
3891 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s96:
3894 : a5 43 __ LDA T3 + 0 
3896 : c9 11 __ CMP #$11
3898 : f0 03 __ BEQ $389d ; (filepicker.s34 + 0)
389a : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s34:
389d : ad e8 52 LDA $52e8 ; (cwd + 23)
38a0 : 0d e9 52 ORA $52e9 ; (cwd + 24)
38a3 : d0 03 __ BNE $38a8 ; (filepicker.s39 + 0)
38a5 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s39:
38a8 : a5 54 __ LDA T1 + 0 
38aa : 05 55 __ ORA T1 + 1 
38ac : d0 03 __ BNE $38b1 ; (filepicker.s38 + 0)
38ae : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s38:
38b1 : a0 15 __ LDY #$15
38b3 : b1 54 __ LDA (T1 + 0),y 
38b5 : 85 02 __ STA $02 
38b7 : c8 __ __ INY
38b8 : b1 54 __ LDA (T1 + 0),y 
38ba : 85 55 __ STA T1 + 1 
38bc : 05 02 __ ORA $02 
38be : d0 03 __ BNE $38c3 ; (filepicker.s35 + 0)
38c0 : 4c a3 34 JMP $34a3 ; (filepicker.l3 + 0)
.s35:
38c3 : a5 02 __ LDA $02 
38c5 : 85 54 __ STA T1 + 0 
38c7 : 8d fd 51 STA $51fd ; (current + 0)
38ca : 8d ea 52 STA $52ea ; (cwd + 25)
38cd : a5 55 __ LDA T1 + 1 
38cf : 8d fe 51 STA $51fe ; (current + 1)
38d2 : 8d eb 52 STA $52eb ; (cwd + 26)
38d5 : 18 __ __ CLC
38d6 : a5 56 __ LDA T2 + 0 
38d8 : 69 01 __ ADC #$01
38da : 8d ee 52 STA $52ee ; (cwd + 29)
38dd : 85 1b __ STA ACCU + 0 
38df : a5 57 __ LDA T2 + 1 
38e1 : 69 00 __ ADC #$00
38e3 : 8d ef 52 STA $52ef ; (cwd + 30)
38e6 : 85 1c __ STA ACCU + 1 
38e8 : a9 0e __ LDA #$0e
38ea : 85 03 __ STA WORK + 0 
38ec : a9 00 __ LDA #$00
38ee : 85 04 __ STA WORK + 1 
38f0 : 20 e6 4c JSR $4ce6 ; (divmod + 0)
38f3 : a5 45 __ LDA T4 + 0 
38f5 : c5 1b __ CMP ACCU + 0 
38f7 : f0 03 __ BEQ $38fc ; (filepicker.s41 + 0)
38f9 : 4c 47 36 JMP $3647 ; (filepicker.s230 + 0)
.s41:
38fc : a5 47 __ LDA T6 + 0 
38fe : 8d fd bf STA $bffd ; (sstack + 5)
3901 : a0 17 __ LDY #$17
3903 : b1 54 __ LDA (T1 + 0),y 
3905 : 8d fd 51 STA $51fd ; (current + 0)
3908 : c8 __ __ INY
3909 : b1 54 __ LDA (T1 + 0),y 
390b : 8d fe 51 STA $51fe ; (current + 1)
390e : 20 87 44 JSR $4487 ; (printElementPriv.s1000 + 0)
3911 : ad fd 51 LDA $51fd ; (current + 0)
3914 : 85 54 __ STA T1 + 0 
3916 : ad fe 51 LDA $51fe ; (current + 1)
3919 : 85 55 __ STA T1 + 1 
391b : a0 15 __ LDY #$15
391d : b1 54 __ LDA (T1 + 0),y 
391f : 8d fd 51 STA $51fd ; (current + 0)
3922 : c8 __ __ INY
3923 : b1 54 __ LDA (T1 + 0),y 
3925 : 8d fe 51 STA $51fe ; (current + 1)
3928 : 18 __ __ CLC
3929 : a5 58 __ LDA T5 + 0 
392b : 69 07 __ ADC #$07
392d : 4c 89 36 JMP $3689 ; (filepicker.s229 + 0)
--------------------------------------------------------------------
3930 : __ __ __ BYT 73 45 4c 45 43 54 20 54 48 45 20 46 49 4c 45 20 : sELECT THE FILE 
3940 : __ __ __ BYT 54 4f 20 4c 4f 41 44 00                         : TO LOAD.
--------------------------------------------------------------------
refreshDir: ; refreshDir(u8,u8)->void
.s0:
3948 : ad ff bf LDA $bfff ; (sstack + 7)
394b : 8d fd bf STA $bffd ; (sstack + 5)
394e : 20 1c 3a JSR $3a1c ; (readDir.s1000 + 0)
3951 : a5 1b __ LDA ACCU + 0 
3953 : d0 1c __ BNE $3971 ; (refreshDir.s1 + 0)
.s2:
3955 : ad ff bf LDA $bfff ; (sstack + 7)
3958 : 8d fd bf STA $bffd ; (sstack + 5)
395b : 20 e2 43 JSR $43e2 ; (drawDirFrame.s1000 + 0)
395e : a9 0b __ LDA #$0b
3960 : 85 11 __ STA P4 
3962 : a9 06 __ LDA #$06
3964 : 85 12 __ STA P5 
3966 : a9 6a __ LDA #$6a
3968 : 85 13 __ STA P6 
396a : a9 46 __ LDA #$46
396c : 85 14 __ STA P7 
396e : 4c f2 31 JMP $31f2 ; (vdc_prints.s0 + 0)
.s1:
3971 : ad ff bf LDA $bfff ; (sstack + 7)
3974 : 8d fe bf STA $bffe ; (sstack + 6)
3977 : ad e8 52 LDA $52e8 ; (cwd + 23)
397a : 8d ea 52 STA $52ea ; (cwd + 25)
397d : ad e9 52 LDA $52e9 ; (cwd + 24)
3980 : 8d eb 52 STA $52eb ; (cwd + 26)
--------------------------------------------------------------------
printDir: ; printDir(u8)->void
.s1000:
3983 : a5 53 __ LDA T0 + 0 
3985 : 8d d4 bf STA $bfd4 ; (buff + 42)
.s0:
3988 : ad e8 52 LDA $52e8 ; (cwd + 23)
398b : 0d e9 52 ORA $52e9 ; (cwd + 24)
398e : d0 1a __ BNE $39aa ; (printDir.s3 + 0)
.s1:
3990 : ad f0 50 LDA $50f0 ; (fullscreen + 0)
3993 : 85 0f __ STA P2 
3995 : ad f1 50 LDA $50f1 ; (fullscreen + 1)
3998 : 85 10 __ STA P3 
399a : ad f2 50 LDA $50f2 ; (fullscreen + 2)
399d : 85 12 __ STA P5 
399f : ad f3 50 LDA $50f3 ; (fullscreen + 3)
39a2 : 85 13 __ STA P6 
39a4 : 20 77 2c JSR $2c77 ; (vdc_clear@proxy + 0)
39a7 : 4c f2 39 JMP $39f2 ; (printDir.s1001 + 0)
.s3:
39aa : ad fe bf LDA $bffe ; (sstack + 6)
39ad : 8d fd bf STA $bffd ; (sstack + 5)
39b0 : 20 e2 43 JSR $43e2 ; (drawDirFrame.s1000 + 0)
39b3 : a9 00 __ LDA #$00
39b5 : 85 53 __ STA T0 + 0 
39b7 : ad ec 52 LDA $52ec ; (cwd + 27)
39ba : ac ed 52 LDY $52ed ; (cwd + 28)
.l68:
39bd : 8c fe 51 STY $51fe ; (current + 1)
39c0 : 8d fd 51 STA $51fd ; (current + 0)
39c3 : 98 __ __ TYA
39c4 : d0 05 __ BNE $39cb ; (printDir.s11 + 0)
.s1006:
39c6 : ad fd 51 LDA $51fd ; (current + 0)
39c9 : f0 2d __ BEQ $39f8 ; (printDir.l12 + 0)
.s11:
39cb : a5 53 __ LDA T0 + 0 
39cd : c9 0e __ CMP #$0e
39cf : b0 21 __ BCS $39f2 ; (printDir.s1001 + 0)
.s8:
39d1 : 69 06 __ ADC #$06
39d3 : 8d fd bf STA $bffd ; (sstack + 5)
39d6 : 20 87 44 JSR $4487 ; (printElementPriv.s1000 + 0)
39d9 : e6 53 __ INC T0 + 0 
39db : ad fd 51 LDA $51fd ; (current + 0)
39de : 85 44 __ STA T2 + 0 
39e0 : ad fe 51 LDA $51fe ; (current + 1)
39e3 : 85 45 __ STA T2 + 1 
39e5 : a0 15 __ LDY #$15
39e7 : b1 44 __ LDA (T2 + 0),y 
39e9 : aa __ __ TAX
39ea : c8 __ __ INY
39eb : b1 44 __ LDA (T2 + 0),y 
39ed : a8 __ __ TAY
39ee : 8a __ __ TXA
39ef : 4c bd 39 JMP $39bd ; (printDir.l68 + 0)
.s1001:
39f2 : ad d4 bf LDA $bfd4 ; (buff + 42)
39f5 : 85 53 __ STA T0 + 0 
39f7 : 60 __ __ RTS
.l12:
39f8 : a5 53 __ LDA T0 + 0 
39fa : c9 0e __ CMP #$0e
39fc : b0 f4 __ BCS $39f2 ; (printDir.s1001 + 0)
.s13:
39fe : a9 0a __ LDA #$0a
3a00 : 85 0f __ STA P2 
3a02 : a9 20 __ LDA #$20
3a04 : 85 11 __ STA P4 
3a06 : a9 28 __ LDA #$28
3a08 : 85 12 __ STA P5 
3a0a : a9 01 __ LDA #$01
3a0c : 85 13 __ STA P6 
3a0e : a5 53 __ LDA T0 + 0 
3a10 : 69 06 __ ADC #$06
3a12 : 85 10 __ STA P3 
3a14 : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
3a17 : e6 53 __ INC T0 + 0 
3a19 : 4c f8 39 JMP $39f8 ; (printDir.l12 + 0)
--------------------------------------------------------------------
readDir: ; readDir(u8,u8)->u8
.s1000:
3a1c : a5 53 __ LDA T0 + 0 
3a1e : 8d d7 bf STA $bfd7 ; (buff + 45)
3a21 : a5 54 __ LDA T0 + 1 
3a23 : 8d d8 bf STA $bfd8 ; (buff + 46)
3a26 : a5 55 __ LDA T1 + 0 
3a28 : 8d d9 bf STA $bfd9 ; (buff + 47)
3a2b : 38 __ __ SEC
3a2c : a5 23 __ LDA SP + 0 
3a2e : e9 08 __ SBC #$08
3a30 : 85 23 __ STA SP + 0 
3a32 : b0 02 __ BCS $3a36 ; (readDir.s0 + 0)
3a34 : c6 24 __ DEC SP + 1 
.s0:
3a36 : a9 00 __ LDA #$00
3a38 : 8d fb 51 STA $51fb ; (previous + 0)
3a3b : 8d fc 51 STA $51fc ; (previous + 1)
3a3e : ad 79 50 LDA $5079 ; (mc_menupopup + 0)
3a41 : 8d df 51 STA $51df ; (vdc_state + 7)
3a44 : a9 ff __ LDA #$ff
3a46 : 85 55 __ STA T1 + 0 
3a48 : ad d1 52 LDA $52d1 ; (cwd + 0)
3a4b : f0 03 __ BEQ $3a50 ; (readDir.s3 + 0)
.s1:
3a4d : 20 53 3c JSR $3c53 ; (freeDir.s0 + 0)
.s3:
3a50 : a9 00 __ LDA #$00
3a52 : a2 21 __ LDX #$21
.l1002:
3a54 : ca __ __ DEX
3a55 : 9d d1 52 STA $52d1,x ; (cwd + 0)
3a58 : d0 fa __ BNE $3a54 ; (readDir.l1002 + 0)
.s1003:
3a5a : 8d fa 50 STA $50fa ; (disk_id_buf + 0)
3a5d : 8d fb 50 STA $50fb ; (disk_id_buf + 1)
3a60 : 8d fc 50 STA $50fc ; (disk_id_buf + 2)
3a63 : 8d fd 50 STA $50fd ; (disk_id_buf + 3)
3a66 : 8d fe 50 STA $50fe ; (disk_id_buf + 4)
3a69 : ad fd bf LDA $bffd ; (sstack + 5)
3a6c : 85 10 __ STA P3 
3a6e : 20 9a 3c JSR $3c9a ; (dir_open.s0 + 0)
3a71 : a5 1b __ LDA ACCU + 0 
3a73 : f0 03 __ BEQ $3a78 ; (readDir.l9 + 0)
3a75 : 4c 34 3c JMP $3c34 ; (readDir.s1016 + 0)
.l9:
3a78 : 20 54 3d JSR $3d54 ; (calloc.s0 + 0)
3a7b : a5 1b __ LDA ACCU + 0 
3a7d : 8d fd 51 STA $51fd ; (current + 0)
3a80 : a5 1c __ LDA ACCU + 1 
3a82 : 8d fe 51 STA $51fe ; (current + 1)
3a85 : 05 1b __ ORA ACCU + 0 
3a87 : d0 13 __ BNE $3a9c ; (readDir.s13 + 0)
.s11:
3a89 : 20 cc ff JSR $ffcc 
3a8c : a9 02 __ LDA #$02
3a8e : 20 c3 ff JSR $ffc3 
3a91 : ad df 51 LDA $51df ; (vdc_state + 7)
3a94 : 09 40 __ ORA #$40
3a96 : 8d df 51 STA $51df ; (vdc_state + 7)
3a99 : 4c 34 3c JMP $3c34 ; (readDir.s1016 + 0)
.s13:
3a9c : a5 1c __ LDA ACCU + 1 
3a9e : 85 14 __ STA P7 
3aa0 : 85 54 __ STA T0 + 1 
3aa2 : a5 1b __ LDA ACCU + 0 
3aa4 : 85 53 __ STA T0 + 0 
3aa6 : 85 13 __ STA P6 
3aa8 : 20 a6 3d JSR $3da6 ; (dir_readentry.s0 + 0)
3aab : a5 1b __ LDA ACCU + 0 
3aad : f0 03 __ BEQ $3ab2 ; (readDir.s19 + 0)
3aaf : 4c fb 3b JMP $3bfb ; (readDir.s17 + 0)
.s19:
3ab2 : ad df 51 LDA $51df ; (vdc_state + 7)
3ab5 : 09 40 __ ORA #$40
3ab7 : a8 __ __ TAY
3ab8 : a5 55 __ LDA T1 + 0 
3aba : 4a __ __ LSR
3abb : 4a __ __ LSR
3abc : c9 24 __ CMP #$24
3abe : 90 3a __ BCC $3afa ; (readDir.s22 + 0)
.s21:
3ac0 : 8c df 51 STY $51df ; (vdc_state + 7)
3ac3 : a9 05 __ LDA #$05
3ac5 : 85 10 __ STA P3 
3ac7 : a9 01 __ LDA #$01
3ac9 : 85 13 __ STA P6 
3acb : 20 56 50 JSR $5056 ; (vdc_clear@proxy + 0)
3ace : a9 80 __ LDA #$80
3ad0 : a0 02 __ LDY #$02
3ad2 : 91 23 __ STA (SP + 0),y 
3ad4 : a9 52 __ LDA #$52
3ad6 : c8 __ __ INY
3ad7 : 91 23 __ STA (SP + 0),y 
3ad9 : a9 e4 __ LDA #$e4
3adb : c8 __ __ INY
3adc : 91 23 __ STA (SP + 0),y 
3ade : a9 3f __ LDA #$3f
3ae0 : c8 __ __ INY
3ae1 : 91 23 __ STA (SP + 0),y 
3ae3 : ad fd bf LDA $bffd ; (sstack + 5)
3ae6 : c8 __ __ INY
3ae7 : 91 23 __ STA (SP + 0),y 
3ae9 : a9 00 __ LDA #$00
3aeb : c8 __ __ INY
3aec : 91 23 __ STA (SP + 0),y 
3aee : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
3af1 : 20 25 50 JSR $5025 ; (vdc_prints@proxy + 0)
3af4 : a9 00 __ LDA #$00
3af6 : 85 55 __ STA T1 + 0 
3af8 : f0 33 __ BEQ $3b2d ; (readDir.s95 + 0)
.s22:
3afa : 69 0e __ ADC #$0e
3afc : 8d f4 50 STA $50f4 ; (fullscreen + 4)
3aff : a9 05 __ LDA #$05
3b01 : 8d f5 50 STA $50f5 ; (fullscreen + 5)
3b04 : a5 55 __ LDA T1 + 0 
3b06 : 29 03 __ AND #$03
3b08 : aa __ __ TAX
3b09 : bd 7a 50 LDA $507a,x ; (progressRev + 0)
3b0c : f0 08 __ BEQ $3b16 ; (readDir.s67 + 0)
.s68:
3b0e : ad df 51 LDA $51df ; (vdc_state + 7)
3b11 : 29 bf __ AND #$bf
3b13 : 4c 17 3b JMP $3b17 ; (readDir.s1014 + 0)
.s67:
3b16 : 98 __ __ TYA
.s1014:
3b17 : 8d df 51 STA $51df ; (vdc_state + 7)
3b1a : a9 f0 __ LDA #$f0
3b1c : 85 17 __ STA P10 
3b1e : a9 50 __ LDA #$50
3b20 : 85 18 __ STA P11 
3b22 : bd 86 50 LDA $5086,x ; (progressBar + 0)
3b25 : 8d f8 bf STA $bff8 ; (sstack + 0)
3b28 : 20 eb 3f JSR $3feb ; (vdcwin_put_char.s1000 + 0)
3b2b : e6 55 __ INC T1 + 0 
.s95:
3b2d : ad fd 51 LDA $51fd ; (current + 0)
3b30 : 85 53 __ STA T0 + 0 
3b32 : ad fe 51 LDA $51fe ; (current + 1)
3b35 : 85 54 __ STA T0 + 1 
3b37 : a0 13 __ LDY #$13
3b39 : ad d1 52 LDA $52d1 ; (cwd + 0)
3b3c : d0 5f __ BNE $3b9d ; (readDir.s28 + 0)
.s27:
3b3e : b1 53 __ LDA (T0 + 0),y 
3b40 : c9 05 __ CMP #$05
3b42 : f0 19 __ BEQ $3b5d ; (readDir.s30 + 0)
.s31:
3b44 : a2 ff __ LDX #$ff
.l1004:
3b46 : e8 __ __ INX
3b47 : bd 32 43 LDA $4332,x 
3b4a : 9d d1 52 STA $52d1,x ; (cwd + 0)
3b4d : d0 f7 __ BNE $3b46 ; (readDir.l1004 + 0)
.s103:
3b4f : a5 54 __ LDA T0 + 1 
3b51 : a6 53 __ LDX T0 + 0 
.s1017:
3b53 : 86 1b __ STX ACCU + 0 
3b55 : 85 1c __ STA ACCU + 1 
3b57 : 20 25 4f JSR $4f25 ; (free + 0)
3b5a : 4c 78 3a JMP $3a78 ; (readDir.l9 + 0)
.s30:
3b5d : a0 00 __ LDY #$00
3b5f : f0 04 __ BEQ $3b65 ; (readDir.l33 + 0)
.s34:
3b61 : 99 d1 52 STA $52d1,y ; (cwd + 0)
3b64 : c8 __ __ INY
.l33:
3b65 : ad fd 51 LDA $51fd ; (current + 0)
3b68 : 85 1b __ STA ACCU + 0 
3b6a : ad fe 51 LDA $51fe ; (current + 1)
3b6d : 85 1c __ STA ACCU + 1 
3b6f : b1 1b __ LDA (ACCU + 0),y 
3b71 : d0 ee __ BNE $3b61 ; (readDir.s34 + 0)
.s36:
3b73 : a9 2c __ LDA #$2c
3b75 : 99 d1 52 STA $52d1,y ; (cwd + 0)
3b78 : ad fa 50 LDA $50fa ; (disk_id_buf + 0)
3b7b : 99 d2 52 STA $52d2,y ; (cwd + 1)
3b7e : ad fb 50 LDA $50fb ; (disk_id_buf + 1)
3b81 : 99 d3 52 STA $52d3,y ; (cwd + 2)
3b84 : ad fc 50 LDA $50fc ; (disk_id_buf + 2)
3b87 : 99 d4 52 STA $52d4,y ; (cwd + 3)
3b8a : ad fd 50 LDA $50fd ; (disk_id_buf + 3)
3b8d : 99 d5 52 STA $52d5,y ; (cwd + 4)
3b90 : ad fe 50 LDA $50fe ; (disk_id_buf + 4)
3b93 : 99 d6 52 STA $52d6,y ; (cwd + 5)
3b96 : a5 1c __ LDA ACCU + 1 
3b98 : a6 1b __ LDX ACCU + 0 
3b9a : 4c 53 3b JMP $3b53 ; (readDir.s1017 + 0)
.s28:
3b9d : b1 53 __ LDA (T0 + 0),y 
3b9f : c9 64 __ CMP #$64
3ba1 : d0 10 __ BNE $3bb3 ; (readDir.s38 + 0)
.s37:
3ba3 : a0 11 __ LDY #$11
3ba5 : b1 53 __ LDA (T0 + 0),y 
3ba7 : 8d f0 52 STA $52f0 ; (cwd + 31)
3baa : c8 __ __ INY
3bab : b1 53 __ LDA (T0 + 0),y 
3bad : 8d f1 52 STA $52f1 ; (cwd + 32)
3bb0 : 4c 4f 3b JMP $3b4f ; (readDir.s103 + 0)
.s38:
3bb3 : 20 3f 43 JSR $433f ; (dir_validentry.s0 + 0)
3bb6 : a5 1b __ LDA ACCU + 0 
3bb8 : f0 95 __ BEQ $3b4f ; (readDir.s103 + 0)
.s40:
3bba : ad e9 52 LDA $52e9 ; (cwd + 24)
3bbd : d0 05 __ BNE $3bc4 ; (readDir.s44 + 0)
.s1008:
3bbf : ad e8 52 LDA $52e8 ; (cwd + 23)
3bc2 : f0 20 __ BEQ $3be4 ; (readDir.s43 + 0)
.s44:
3bc4 : ad fc 51 LDA $51fc ; (previous + 1)
3bc7 : 85 45 __ STA T3 + 1 
3bc9 : ad fb 51 LDA $51fb ; (previous + 0)
3bcc : 85 44 __ STA T3 + 0 
3bce : a0 17 __ LDY #$17
3bd0 : 91 53 __ STA (T0 + 0),y 
3bd2 : a5 45 __ LDA T3 + 1 
3bd4 : c8 __ __ INY
3bd5 : 91 53 __ STA (T0 + 0),y 
3bd7 : a5 53 __ LDA T0 + 0 
3bd9 : a0 15 __ LDY #$15
3bdb : 91 44 __ STA (T3 + 0),y 
3bdd : a5 54 __ LDA T0 + 1 
3bdf : c8 __ __ INY
3be0 : 91 44 __ STA (T3 + 0),y 
3be2 : d0 0a __ BNE $3bee ; (readDir.s117 + 0)
.s43:
3be4 : a5 53 __ LDA T0 + 0 
3be6 : 8d e8 52 STA $52e8 ; (cwd + 23)
3be9 : a5 54 __ LDA T0 + 1 
3beb : 8d e9 52 STA $52e9 ; (cwd + 24)
.s117:
3bee : a5 53 __ LDA T0 + 0 
3bf0 : 8d fb 51 STA $51fb ; (previous + 0)
3bf3 : a5 54 __ LDA T0 + 1 
3bf5 : 8d fc 51 STA $51fc ; (previous + 1)
3bf8 : 4c 78 3a JMP $3a78 ; (readDir.l9 + 0)
.s17:
3bfb : a5 53 __ LDA T0 + 0 
3bfd : 85 1b __ STA ACCU + 0 
3bff : a5 54 __ LDA T0 + 1 
3c01 : 85 1c __ STA ACCU + 1 
3c03 : 20 25 4f JSR $4f25 ; (free + 0)
3c06 : 20 cc ff JSR $ffcc 
3c09 : a9 02 __ LDA #$02
3c0b : 20 c3 ff JSR $ffc3 
3c0e : ad df 51 LDA $51df ; (vdc_state + 7)
3c11 : 09 40 __ ORA #$40
3c13 : 8d df 51 STA $51df ; (vdc_state + 7)
3c16 : ad e8 52 LDA $52e8 ; (cwd + 23)
3c19 : 0d e9 52 ORA $52e9 ; (cwd + 24)
3c1c : f0 16 __ BEQ $3c34 ; (readDir.s1016 + 0)
.s48:
3c1e : ad e8 52 LDA $52e8 ; (cwd + 23)
3c21 : 8d ea 52 STA $52ea ; (cwd + 25)
3c24 : 8d ec 52 STA $52ec ; (cwd + 27)
3c27 : ad e9 52 LDA $52e9 ; (cwd + 24)
3c2a : 8d eb 52 STA $52eb ; (cwd + 26)
3c2d : 8d ed 52 STA $52ed ; (cwd + 28)
3c30 : a9 01 __ LDA #$01
3c32 : d0 02 __ BNE $3c36 ; (readDir.s1001 + 0)
.s1016:
3c34 : a9 00 __ LDA #$00
.s1001:
3c36 : 85 1b __ STA ACCU + 0 
3c38 : 18 __ __ CLC
3c39 : a5 23 __ LDA SP + 0 
3c3b : 69 08 __ ADC #$08
3c3d : 85 23 __ STA SP + 0 
3c3f : 90 02 __ BCC $3c43 ; (readDir.s1001 + 13)
3c41 : e6 24 __ INC SP + 1 
3c43 : ad d7 bf LDA $bfd7 ; (buff + 45)
3c46 : 85 53 __ STA T0 + 0 
3c48 : ad d8 bf LDA $bfd8 ; (buff + 46)
3c4b : 85 54 __ STA T0 + 1 
3c4d : ad d9 bf LDA $bfd9 ; (buff + 47)
3c50 : 85 55 __ STA T1 + 0 
3c52 : 60 __ __ RTS
--------------------------------------------------------------------
freeDir: ; freeDir()->void
.s0:
3c53 : ad d1 52 LDA $52d1 ; (cwd + 0)
3c56 : f0 41 __ BEQ $3c99 ; (freeDir.s1001 + 0)
.s3:
3c58 : ad e8 52 LDA $52e8 ; (cwd + 23)
3c5b : 85 43 __ STA T1 + 0 
3c5d : 8d fd 51 STA $51fd ; (current + 0)
3c60 : ad e9 52 LDA $52e9 ; (cwd + 24)
3c63 : 85 44 __ STA T1 + 1 
3c65 : 8d fe 51 STA $51fe ; (current + 1)
3c68 : 05 43 __ ORA T1 + 0 
3c6a : f0 28 __ BEQ $3c94 ; (freeDir.s7 + 0)
.l6:
3c6c : a5 43 __ LDA T1 + 0 
3c6e : 85 1b __ STA ACCU + 0 
3c70 : a5 44 __ LDA T1 + 1 
3c72 : 85 1c __ STA ACCU + 1 
3c74 : a0 15 __ LDY #$15
3c76 : b1 43 __ LDA (T1 + 0),y 
3c78 : 85 02 __ STA $02 
3c7a : c8 __ __ INY
3c7b : b1 43 __ LDA (T1 + 0),y 
3c7d : 85 44 __ STA T1 + 1 
3c7f : 20 25 4f JSR $4f25 ; (free + 0)
3c82 : a5 02 __ LDA $02 
3c84 : 85 43 __ STA T1 + 0 
3c86 : 05 44 __ ORA T1 + 1 
3c88 : d0 e2 __ BNE $3c6c ; (freeDir.l6 + 0)
.s9:
3c8a : a5 02 __ LDA $02 
3c8c : 8d fd 51 STA $51fd ; (current + 0)
3c8f : a5 44 __ LDA T1 + 1 
3c91 : 8d fe 51 STA $51fe ; (current + 1)
.s7:
3c94 : a9 00 __ LDA #$00
3c96 : 8d d1 52 STA $52d1 ; (cwd + 0)
.s1001:
3c99 : 60 __ __ RTS
--------------------------------------------------------------------
dir_open: ; dir_open(u8,u8)->u8
.s0:
3c9a : a9 00 __ LDA #$00
3c9c : 85 0d __ STA P0 
3c9e : 85 0e __ STA P1 
3ca0 : 20 a3 2a JSR $2aa3 ; (krnio_setbnk.s0 + 0)
3ca3 : a9 fe __ LDA #$fe
3ca5 : 85 0d __ STA P0 
3ca7 : a9 2a __ LDA #$2a
3ca9 : 85 0e __ STA P1 
3cab : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
3cae : a9 02 __ LDA #$02
3cb0 : 85 0d __ STA P0 
3cb2 : a9 00 __ LDA #$00
3cb4 : 85 0f __ STA P2 
3cb6 : 20 ee 33 JSR $33ee ; (krnio_open@proxy + 0)
3cb9 : 85 43 __ STA T1 + 0 
3cbb : 20 b7 ff JSR $ffb7 
3cbe : 85 44 __ STA T2 + 0 
3cc0 : 85 1b __ STA ACCU + 0 
3cc2 : a5 43 __ LDA T1 + 0 
3cc4 : f0 45 __ BEQ $3d0b ; (dir_open.s1001 + 0)
.s4:
3cc6 : a5 44 __ LDA T2 + 0 
3cc8 : f0 08 __ BEQ $3cd2 ; (dir_open.s3 + 0)
.s1:
3cca : 20 cc ff JSR $ffcc 
3ccd : a9 02 __ LDA #$02
3ccf : 20 c3 ff JSR $ffc3 
.s3:
3cd2 : a5 43 __ LDA T1 + 0 
3cd4 : f0 31 __ BEQ $3d07 ; (dir_open.s1002 + 0)
.s9:
3cd6 : a5 44 __ LDA T2 + 0 
3cd8 : d0 2d __ BNE $3d07 ; (dir_open.s1002 + 0)
.s6:
3cda : a9 02 __ LDA #$02
3cdc : 20 36 3d JSR $3d36 ; (krnio_chkin.s1000 + 0)
3cdf : 85 43 __ STA T1 + 0 
3ce1 : 20 b7 ff JSR $ffb7 
3ce4 : 85 44 __ STA T2 + 0 
3ce6 : a5 43 __ LDA T1 + 0 
3ce8 : f0 15 __ BEQ $3cff ; (dir_open.s11 + 0)
.s13:
3cea : a5 44 __ LDA T2 + 0 
3cec : d0 11 __ BNE $3cff ; (dir_open.s11 + 0)
.s10:
3cee : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
3cf1 : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
3cf4 : 20 b7 ff JSR $ffb7 
3cf7 : 85 44 __ STA T2 + 0 
3cf9 : 85 1b __ STA ACCU + 0 
3cfb : 09 00 __ ORA #$00
3cfd : f0 0c __ BEQ $3d0b ; (dir_open.s1001 + 0)
.s11:
3cff : 20 cc ff JSR $ffcc 
3d02 : a9 02 __ LDA #$02
3d04 : 20 c3 ff JSR $ffc3 
.s1002:
3d07 : a5 44 __ LDA T2 + 0 
3d09 : 85 1b __ STA ACCU + 0 
.s1001:
3d0b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
3d0c : a9 00 __ LDA #$00
3d0e : a6 0d __ LDX P0 ; (fnum + 0)
3d10 : 9d df 50 STA $50df,x ; (krnio_pstatus + 0)
3d13 : a9 00 __ LDA #$00
3d15 : 85 1b __ STA ACCU + 0 
3d17 : 85 1c __ STA ACCU + 1 
3d19 : a5 0d __ LDA P0 ; (fnum + 0)
3d1b : a6 0e __ LDX P1 
3d1d : a4 0f __ LDY P2 
3d1f : 20 ba ff JSR $ffba 
3d22 : 20 c0 ff JSR $ffc0 
3d25 : 90 08 __ BCC $3d2f ; (krnio_open.s0 + 35)
3d27 : a5 0d __ LDA P0 ; (fnum + 0)
3d29 : 20 c3 ff JSR $ffc3 
3d2c : 4c 33 3d JMP $3d33 ; (krnio_open.s1001 + 0)
3d2f : a9 01 __ LDA #$01
3d31 : 85 1b __ STA ACCU + 0 
.s1001:
3d33 : a5 1b __ LDA ACCU + 0 
3d35 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
3d36 : 85 0d __ STA P0 
.s0:
3d38 : a6 0d __ LDX P0 
3d3a : 20 c6 ff JSR $ffc6 
3d3d : a9 00 __ LDA #$00
3d3f : 85 1c __ STA ACCU + 1 
3d41 : b0 02 __ BCS $3d45 ; (krnio_chkin.s0 + 13)
3d43 : a9 01 __ LDA #$01
3d45 : 85 1b __ STA ACCU + 0 
.s1001:
3d47 : a5 1b __ LDA ACCU + 0 
3d49 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
3d4a : 20 cf ff JSR $ffcf 
3d4d : 85 1b __ STA ACCU + 0 
3d4f : a9 00 __ LDA #$00
3d51 : 85 1c __ STA ACCU + 1 
.s1001:
3d53 : 60 __ __ RTS
--------------------------------------------------------------------
calloc: ; calloc(i16,i16)->void*
.s0:
3d54 : a9 19 __ LDA #$19
3d56 : 85 1b __ STA ACCU + 0 
3d58 : a9 00 __ LDA #$00
3d5a : 85 1c __ STA ACCU + 1 
3d5c : 20 48 4e JSR $4e48 ; (malloc + 0)
3d5f : a5 1c __ LDA ACCU + 1 
3d61 : 05 1b __ ORA ACCU + 0 
3d63 : f0 1d __ BEQ $3d82 ; (calloc.s1001 + 0)
.s1:
3d65 : a5 1c __ LDA ACCU + 1 
3d67 : 85 0e __ STA P1 
3d69 : 85 44 __ STA T0 + 1 
3d6b : a5 1b __ LDA ACCU + 0 
3d6d : 85 0d __ STA P0 
3d6f : a9 19 __ LDA #$19
3d71 : 85 0f __ STA P2 
3d73 : a9 00 __ LDA #$00
3d75 : 85 10 __ STA P3 
3d77 : 20 83 3d JSR $3d83 ; (memclr.s0 + 0)
3d7a : a5 0d __ LDA P0 
3d7c : 85 1b __ STA ACCU + 0 
3d7e : a5 44 __ LDA T0 + 1 
3d80 : 85 1c __ STA ACCU + 1 
.s1001:
3d82 : 60 __ __ RTS
--------------------------------------------------------------------
memclr: ; memclr(void*,i16)->void
.s0:
3d83 : a5 10 __ LDA P3 ; (size + 1)
3d85 : 05 0f __ ORA P2 ; (size + 0)
3d87 : f0 1c __ BEQ $3da5 ; (memclr.s1001 + 0)
.s5:
3d89 : a0 00 __ LDY #$00
3d8b : a5 0f __ LDA P2 ; (size + 0)
3d8d : f0 02 __ BEQ $3d91 ; (memclr.l1002 + 0)
.s1005:
3d8f : e6 10 __ INC P3 ; (size + 1)
.l1002:
3d91 : a6 0f __ LDX P2 ; (size + 0)
.l1006:
3d93 : a9 00 __ LDA #$00
3d95 : 91 0d __ STA (P0),y ; (dst + 0)
3d97 : c8 __ __ INY
3d98 : d0 02 __ BNE $3d9c ; (memclr.s1009 + 0)
.s1008:
3d9a : e6 0e __ INC P1 ; (dst + 1)
.s1009:
3d9c : ca __ __ DEX
3d9d : d0 f4 __ BNE $3d93 ; (memclr.l1006 + 0)
.s1007:
3d9f : 85 0f __ STA P2 ; (size + 0)
3da1 : c6 10 __ DEC P3 ; (size + 1)
3da3 : d0 ec __ BNE $3d91 ; (memclr.l1002 + 0)
.s1001:
3da5 : 60 __ __ RTS
--------------------------------------------------------------------
dir_readentry: ; dir_readentry(const u8,struct DirEntry*)->u8
.s0:
3da6 : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
3da9 : a5 1b __ LDA ACCU + 0 
3dab : d0 04 __ BNE $3db1 ; (dir_readentry.s3 + 0)
.s1:
3dad : a9 01 __ LDA #$01
3daf : d0 59 __ BNE $3e0a ; (dir_readentry.s1095 + 0)
.s3:
3db1 : 20 b7 ff JSR $ffb7 
3db4 : 09 00 __ ORA #$00
3db6 : f0 03 __ BEQ $3dbb ; (dir_readentry.s7 + 0)
3db8 : 4c df 3f JMP $3fdf ; (dir_readentry.s5 + 0)
.s7:
3dbb : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
3dbe : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
3dc1 : a5 1b __ LDA ACCU + 0 
3dc3 : 85 43 __ STA T0 + 0 
3dc5 : a0 11 __ LDY #$11
3dc7 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3dc9 : a5 1c __ LDA ACCU + 1 
3dcb : 85 44 __ STA T0 + 1 
3dcd : c8 __ __ INY
3dce : 91 13 __ STA (P6),y ; (l_dirent + 0)
3dd0 : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
3dd3 : a5 1b __ LDA ACCU + 0 
3dd5 : 05 44 __ ORA T0 + 1 
3dd7 : a0 12 __ LDY #$12
3dd9 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3ddb : a5 43 __ LDA T0 + 0 
3ddd : 88 __ __ DEY
3dde : 91 13 __ STA (P6),y ; (l_dirent + 0)
3de0 : a9 00 __ LDA #$00
3de2 : a2 51 __ LDX #$51
.l1002:
3de4 : ca __ __ DEX
3de5 : 9d 80 52 STA $5280,x ; (linebuffer + 0)
3de8 : d0 fa __ BNE $3de4 ; (dir_readentry.l1002 + 0)
.s1003:
3dea : 85 45 __ STA T1 + 0 
.l10:
3dec : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
3def : a5 1b __ LDA ACCU + 0 
3df1 : f0 1a __ BEQ $3e0d ; (dir_readentry.s11 + 0)
.s14:
3df3 : a6 45 __ LDX T1 + 0 
3df5 : e0 51 __ CPX #$51
3df7 : b0 05 __ BCS $3dfe ; (dir_readentry.s281 + 0)
.s16:
3df9 : 9d 80 52 STA $5280,x ; (linebuffer + 0)
3dfc : e6 45 __ INC T1 + 0 
.s281:
3dfe : 20 b7 ff JSR $ffb7 
3e01 : 09 00 __ ORA #$00
3e03 : f0 e7 __ BEQ $3dec ; (dir_readentry.l10 + 0)
.s19:
3e05 : 20 cc ff JSR $ffcc 
3e08 : a9 02 __ LDA #$02
.s1095:
3e0a : 85 1b __ STA ACCU + 0 
.s1001:
3e0c : 60 __ __ RTS
.s11:
3e0d : ad 80 52 LDA $5280 ; (linebuffer + 0)
3e10 : c9 42 __ CMP #$42
3e12 : d0 07 __ BNE $3e1b ; (dir_readentry.s25 + 0)
.s23:
3e14 : a9 64 __ LDA #$64
3e16 : a0 13 __ LDY #$13
3e18 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3e1a : 60 __ __ RTS
.s25:
3e1b : a6 45 __ LDX T1 + 0 
3e1d : e0 05 __ CPX #$05
3e1f : b0 04 __ BCS $3e25 ; (dir_readentry.l1098 + 0)
.s27:
3e21 : a9 03 __ LDA #$03
3e23 : 90 e5 __ BCC $3e0a ; (dir_readentry.s1095 + 0)
.l1098:
3e25 : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3e28 : f0 0b __ BEQ $3e35 ; (dir_readentry.s35 + 0)
.s39:
3e2a : c9 20 __ CMP #$20
3e2c : f0 07 __ BEQ $3e35 ; (dir_readentry.s35 + 0)
.s38:
3e2e : c9 a0 __ CMP #$a0
3e30 : f0 03 __ BEQ $3e35 ; (dir_readentry.s35 + 0)
3e32 : 4c d9 3f JMP $3fd9 ; (dir_readentry.s37 + 0)
.s35:
3e35 : a9 00 __ LDA #$00
3e37 : 9d 80 52 STA $5280,x ; (linebuffer + 0)
3e3a : ca __ __ DEX
3e3b : d0 e8 __ BNE $3e25 ; (dir_readentry.l1098 + 0)
.s1097:
3e3d : 85 45 __ STA T1 + 0 
.s127:
3e3f : a2 00 __ LDX #$00
.l46:
3e41 : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3e44 : c9 22 __ CMP #$22
3e46 : f0 05 __ BEQ $3e4d ; (dir_readentry.s1100 + 0)
.s44:
3e48 : e8 __ __ INX
3e49 : e0 51 __ CPX #$51
3e4b : 90 f4 __ BCC $3e41 ; (dir_readentry.l46 + 0)
.s1100:
3e4d : e8 __ __ INX
3e4e : 86 1b __ STX ACCU + 0 
3e50 : e0 51 __ CPX #$51
3e52 : b0 17 __ BCS $3e6b ; (dir_readentry.s50 + 0)
.s126:
3e54 : a0 00 __ LDY #$00
.l52:
3e56 : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3e59 : c9 22 __ CMP #$22
3e5b : f0 0c __ BEQ $3e69 ; (dir_readentry.s1103 + 0)
.s51:
3e5d : c0 10 __ CPY #$10
3e5f : b0 08 __ BCS $3e69 ; (dir_readentry.s1103 + 0)
.s48:
3e61 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3e63 : e8 __ __ INX
3e64 : e0 51 __ CPX #$51
3e66 : c8 __ __ INY
3e67 : 90 ed __ BCC $3e56 ; (dir_readentry.l52 + 0)
.s1103:
3e69 : 86 1b __ STX ACCU + 0 
.s50:
3e6b : a6 45 __ LDX T1 + 0 
3e6d : 86 43 __ STX T0 + 0 
3e6f : bd 7d 52 LDA $527d,x ; (_cinfo + 125)
3e72 : 85 45 __ STA T1 + 0 
3e74 : c9 50 __ CMP #$50
3e76 : d0 13 __ BNE $3e8b ; (dir_readentry.s54 + 0)
.s57:
3e78 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3e7b : c9 52 __ CMP #$52
3e7d : d0 0c __ BNE $3e8b ; (dir_readentry.s54 + 0)
.s56:
3e7f : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3e82 : c9 47 __ CMP #$47
3e84 : d0 05 __ BNE $3e8b ; (dir_readentry.s54 + 0)
.s53:
3e86 : a9 11 __ LDA #$11
3e88 : 4c c0 3f JMP $3fc0 ; (dir_readentry.s55 + 0)
.s54:
3e8b : a5 45 __ LDA T1 + 0 
3e8d : c9 53 __ CMP #$53
3e8f : d0 15 __ BNE $3ea6 ; (dir_readentry.s59 + 0)
.s62:
3e91 : a6 43 __ LDX T0 + 0 
3e93 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3e96 : c9 45 __ CMP #$45
3e98 : d0 0c __ BNE $3ea6 ; (dir_readentry.s59 + 0)
.s61:
3e9a : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3e9d : c9 51 __ CMP #$51
3e9f : d0 05 __ BNE $3ea6 ; (dir_readentry.s59 + 0)
.s58:
3ea1 : a9 10 __ LDA #$10
3ea3 : 4c c0 3f JMP $3fc0 ; (dir_readentry.s55 + 0)
.s59:
3ea6 : a5 45 __ LDA T1 + 0 
3ea8 : c9 55 __ CMP #$55
3eaa : d0 15 __ BNE $3ec1 ; (dir_readentry.s64 + 0)
.s67:
3eac : a6 43 __ LDX T0 + 0 
3eae : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3eb1 : c9 53 __ CMP #$53
3eb3 : d0 0c __ BNE $3ec1 ; (dir_readentry.s64 + 0)
.s66:
3eb5 : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3eb8 : c9 52 __ CMP #$52
3eba : d0 05 __ BNE $3ec1 ; (dir_readentry.s64 + 0)
.s63:
3ebc : a9 12 __ LDA #$12
3ebe : 4c c0 3f JMP $3fc0 ; (dir_readentry.s55 + 0)
.s64:
3ec1 : a5 45 __ LDA T1 + 0 
3ec3 : c9 44 __ CMP #$44
3ec5 : f0 04 __ BEQ $3ecb ; (dir_readentry.s1006 + 0)
.s1007:
3ec7 : a2 00 __ LDX #$00
3ec9 : f0 17 __ BEQ $3ee2 ; (dir_readentry.s69 + 0)
.s1006:
3ecb : a4 43 __ LDY T0 + 0 
3ecd : b9 7e 52 LDA $527e,y ; (_cinfo + 126)
3ed0 : a2 01 __ LDX #$01
3ed2 : c9 45 __ CMP #$45
3ed4 : d0 0c __ BNE $3ee2 ; (dir_readentry.s69 + 0)
.s71:
3ed6 : b9 7f 52 LDA $527f,y ; (_cinfo + 127)
3ed9 : c9 4c __ CMP #$4c
3edb : d0 05 __ BNE $3ee2 ; (dir_readentry.s69 + 0)
.s68:
3edd : a9 00 __ LDA #$00
3edf : 4c c0 3f JMP $3fc0 ; (dir_readentry.s55 + 0)
.s69:
3ee2 : a5 45 __ LDA T1 + 0 
3ee4 : c9 52 __ CMP #$52
3ee6 : d0 15 __ BNE $3efd ; (dir_readentry.s74 + 0)
.s77:
3ee8 : a4 43 __ LDY T0 + 0 
3eea : b9 7e 52 LDA $527e,y ; (_cinfo + 126)
3eed : c9 45 __ CMP #$45
3eef : d0 0c __ BNE $3efd ; (dir_readentry.s74 + 0)
.s76:
3ef1 : b9 7f 52 LDA $527f,y ; (_cinfo + 127)
3ef4 : c9 4c __ CMP #$4c
3ef6 : d0 05 __ BNE $3efd ; (dir_readentry.s74 + 0)
.s73:
3ef8 : a9 13 __ LDA #$13
3efa : 4c c0 3f JMP $3fc0 ; (dir_readentry.s55 + 0)
.s74:
3efd : a5 45 __ LDA T1 + 0 
3eff : c9 43 __ CMP #$43
3f01 : d0 15 __ BNE $3f18 ; (dir_readentry.s79 + 0)
.s82:
3f03 : a4 43 __ LDY T0 + 0 
3f05 : b9 7e 52 LDA $527e,y ; (_cinfo + 126)
3f08 : c9 42 __ CMP #$42
3f0a : d0 0c __ BNE $3f18 ; (dir_readentry.s79 + 0)
.s81:
3f0c : b9 7f 52 LDA $527f,y ; (_cinfo + 127)
3f0f : c9 4d __ CMP #$4d
3f11 : d0 05 __ BNE $3f18 ; (dir_readentry.s79 + 0)
.s78:
3f13 : a9 01 __ LDA #$01
3f15 : 4c c0 3f JMP $3fc0 ; (dir_readentry.s55 + 0)
.s79:
3f18 : 8a __ __ TXA
3f19 : f0 15 __ BEQ $3f30 ; (dir_readentry.s84 + 0)
.s87:
3f1b : a6 43 __ LDX T0 + 0 
3f1d : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3f20 : c9 49 __ CMP #$49
3f22 : d0 0c __ BNE $3f30 ; (dir_readentry.s84 + 0)
.s86:
3f24 : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3f27 : c9 52 __ CMP #$52
3f29 : d0 05 __ BNE $3f30 ; (dir_readentry.s84 + 0)
.s83:
3f2b : a9 02 __ LDA #$02
3f2d : 4c c0 3f JMP $3fc0 ; (dir_readentry.s55 + 0)
.s84:
3f30 : a5 45 __ LDA T1 + 0 
3f32 : c9 56 __ CMP #$56
3f34 : d0 14 __ BNE $3f4a ; (dir_readentry.s89 + 0)
.s92:
3f36 : a6 43 __ LDX T0 + 0 
3f38 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3f3b : c9 52 __ CMP #$52
3f3d : d0 0b __ BNE $3f4a ; (dir_readentry.s89 + 0)
.s91:
3f3f : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3f42 : c9 50 __ CMP #$50
3f44 : d0 04 __ BNE $3f4a ; (dir_readentry.s89 + 0)
.s88:
3f46 : a9 14 __ LDA #$14
3f48 : d0 76 __ BNE $3fc0 ; (dir_readentry.s55 + 0)
.s89:
3f4a : a5 45 __ LDA T1 + 0 
3f4c : c9 4c __ CMP #$4c
3f4e : d0 14 __ BNE $3f64 ; (dir_readentry.s94 + 0)
.s97:
3f50 : a6 43 __ LDX T0 + 0 
3f52 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3f55 : c9 4e __ CMP #$4e
3f57 : d0 0b __ BNE $3f64 ; (dir_readentry.s94 + 0)
.s96:
3f59 : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3f5c : c9 4b __ CMP #$4b
3f5e : d0 04 __ BNE $3f64 ; (dir_readentry.s94 + 0)
.s93:
3f60 : a9 03 __ LDA #$03
3f62 : d0 5c __ BNE $3fc0 ; (dir_readentry.s55 + 0)
.s94:
3f64 : a9 05 __ LDA #$05
3f66 : a0 13 __ LDY #$13
3f68 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f6a : a6 1b __ LDX ACCU + 0 
3f6c : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3f6f : c9 22 __ CMP #$22
3f71 : d0 02 __ BNE $3f75 ; (dir_readentry.s100 + 0)
.s98:
3f73 : e6 1b __ INC ACCU + 0 
.s100:
3f75 : a9 00 __ LDA #$00
3f77 : 85 45 __ STA T1 + 0 
3f79 : a6 1b __ LDX ACCU + 0 
3f7b : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3f7e : c9 20 __ CMP #$20
3f80 : d0 02 __ BNE $3f84 ; (dir_readentry.l105 + 0)
.s101:
3f82 : e6 1b __ INC ACCU + 0 
.l105:
3f84 : a6 1b __ LDX ACCU + 0 
3f86 : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3f89 : f0 05 __ BEQ $3f90 ; (dir_readentry.s207 + 0)
.s108:
3f8b : a6 45 __ LDX T1 + 0 
3f8d : 9d fa 50 STA $50fa,x ; (disk_id_buf + 0)
.s207:
3f90 : e6 1b __ INC ACCU + 0 
3f92 : e6 45 __ INC T1 + 0 
3f94 : a6 45 __ LDX T1 + 0 
3f96 : e0 05 __ CPX #$05
3f98 : 90 ea __ BCC $3f84 ; (dir_readentry.l105 + 0)
.s107:
3f9a : a9 00 __ LDA #$00
3f9c : 9d fa 50 STA $50fa,x ; (disk_id_buf + 0)
3f9f : a0 0f __ LDY #$0f
3fa1 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
3fa3 : f0 08 __ BEQ $3fad ; (dir_readentry.l115 + 0)
.s119:
3fa5 : c9 20 __ CMP #$20
3fa7 : f0 04 __ BEQ $3fad ; (dir_readentry.l115 + 0)
.s118:
3fa9 : c9 a0 __ CMP #$a0
3fab : d0 0e __ BNE $3fbb ; (dir_readentry.s1096 + 0)
.l115:
3fad : a9 00 __ LDA #$00
3faf : 91 13 __ STA (P6),y ; (l_dirent + 0)
3fb1 : 88 __ __ DEY
3fb2 : f0 07 __ BEQ $3fbb ; (dir_readentry.s1096 + 0)
.s112:
3fb4 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
3fb6 : f0 f5 __ BEQ $3fad ; (dir_readentry.l115 + 0)
3fb8 : 4c a5 3f JMP $3fa5 ; (dir_readentry.s119 + 0)
.s1096:
3fbb : a9 00 __ LDA #$00
3fbd : 4c 0a 3e JMP $3e0a ; (dir_readentry.s1095 + 0)
.s55:
3fc0 : a0 13 __ LDY #$13
3fc2 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3fc4 : a6 1b __ LDX ACCU + 0 
3fc6 : bd 7c 52 LDA $527c,x ; (_cinfo + 124)
3fc9 : c9 3c __ CMP #$3c
3fcb : d0 04 __ BNE $3fd1 ; (dir_readentry.s165 + 0)
.s164:
3fcd : a9 01 __ LDA #$01
3fcf : d0 02 __ BNE $3fd3 ; (dir_readentry.s1093 + 0)
.s165:
3fd1 : a9 03 __ LDA #$03
.s1093:
3fd3 : a0 14 __ LDY #$14
3fd5 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3fd7 : d0 e2 __ BNE $3fbb ; (dir_readentry.s1096 + 0)
.s37:
3fd9 : e8 __ __ INX
3fda : 86 45 __ STX T1 + 0 
3fdc : 4c 3f 3e JMP $3e3f ; (dir_readentry.s127 + 0)
.s5:
3fdf : a9 07 __ LDA #$07
3fe1 : 4c 0a 3e JMP $3e0a ; (dir_readentry.s1095 + 0)
--------------------------------------------------------------------
3fe4 : __ __ __ BYT 5b 25 30 32 55 5d 00                            : [%02U].
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
3feb : 38 __ __ SEC
3fec : a5 23 __ LDA SP + 0 
3fee : e9 06 __ SBC #$06
3ff0 : 85 23 __ STA SP + 0 
3ff2 : b0 02 __ BCS $3ff6 ; (vdcwin_put_char.s0 + 0)
3ff4 : c6 24 __ DEC SP + 1 
.s0:
3ff6 : a5 17 __ LDA P10 ; (win + 0)
3ff8 : 85 11 __ STA P4 
3ffa : a5 18 __ LDA P11 ; (win + 1)
3ffc : 85 12 __ STA P5 
3ffe : a0 04 __ LDY #$04
4000 : b1 17 __ LDA (P10),y ; (win + 0)
4002 : 85 13 __ STA P6 
4004 : c8 __ __ INY
4005 : b1 17 __ LDA (P10),y ; (win + 0)
4007 : 85 14 __ STA P7 
4009 : ad f8 bf LDA $bff8 ; (sstack + 0)
400c : 85 15 __ STA P8 
400e : 20 5d 40 JSR $405d ; (vdcwin_putat_char.s0 + 0)
4011 : a6 13 __ LDX P6 
4013 : e8 __ __ INX
4014 : 8a __ __ TXA
4015 : a0 04 __ LDY #$04
4017 : 91 17 __ STA (P10),y ; (win + 0)
4019 : a0 02 __ LDY #$02
401b : d1 17 __ CMP (P10),y ; (win + 0)
401d : d0 32 __ BNE $4051 ; (vdcwin_put_char.s1001 + 0)
.s1:
401f : a9 00 __ LDA #$00
4021 : a0 04 __ LDY #$04
4023 : 91 17 __ STA (P10),y ; (win + 0)
4025 : 18 __ __ CLC
4026 : a5 14 __ LDA P7 
4028 : 69 01 __ ADC #$01
402a : c8 __ __ INY
402b : 91 17 __ STA (P10),y ; (win + 0)
402d : a0 03 __ LDY #$03
402f : d1 17 __ CMP (P10),y ; (win + 0)
4031 : d0 1e __ BNE $4051 ; (vdcwin_put_char.s1001 + 0)
.s4:
4033 : a5 14 __ LDA P7 
4035 : a0 05 __ LDY #$05
4037 : 91 17 __ STA (P10),y ; (win + 0)
4039 : a5 17 __ LDA P10 ; (win + 0)
403b : a0 02 __ LDY #$02
403d : 91 23 __ STA (SP + 0),y 
403f : a5 18 __ LDA P11 ; (win + 1)
4041 : c8 __ __ INY
4042 : 91 23 __ STA (SP + 0),y 
4044 : a9 fe __ LDA #$fe
4046 : c8 __ __ INY
4047 : 91 23 __ STA (SP + 0),y 
4049 : a9 33 __ LDA #$33
404b : c8 __ __ INY
404c : 91 23 __ STA (SP + 0),y 
404e : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
.s1001:
4051 : 18 __ __ CLC
4052 : a5 23 __ LDA SP + 0 
4054 : 69 06 __ ADC #$06
4056 : 85 23 __ STA SP + 0 
4058 : 90 02 __ BCC $405c ; (vdcwin_put_char.s1001 + 11)
405a : e6 24 __ INC SP + 1 
405c : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
405d : a5 15 __ LDA P8 ; (ch + 0)
405f : 4a __ __ LSR
4060 : 4a __ __ LSR
4061 : 4a __ __ LSR
4062 : 4a __ __ LSR
4063 : 4a __ __ LSR
4064 : aa __ __ TAX
4065 : bd 7e 50 LDA $507e,x ; (p2smap + 0)
4068 : 45 15 __ EOR P8 ; (ch + 0)
406a : 85 0f __ STA P2 
406c : a5 13 __ LDA P6 ; (x + 0)
406e : 18 __ __ CLC
406f : a0 00 __ LDY #$00
4071 : 71 11 __ ADC (P4),y ; (win + 0)
4073 : 85 0d __ STA P0 
4075 : a5 14 __ LDA P7 ; (y + 0)
4077 : 18 __ __ CLC
4078 : c8 __ __ INY
4079 : 71 11 __ ADC (P4),y ; (win + 0)
407b : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
407d : ad df 51 LDA $51df ; (vdc_state + 7)
4080 : 85 10 __ STA P3 
4082 : 4c b4 32 JMP $32b4 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
4085 : a5 53 __ LDA T0 + 0 
4087 : 8d f4 bf STA $bff4 ; (buffer + 12)
408a : a5 54 __ LDA T0 + 1 
408c : 8d f5 bf STA $bff5 ; (buffer + 13)
408f : a5 55 __ LDA T1 + 0 
4091 : 8d f6 bf STA $bff6 ; (buffer + 14)
4094 : 38 __ __ SEC
4095 : a5 23 __ LDA SP + 0 
4097 : e9 06 __ SBC #$06
4099 : 85 23 __ STA SP + 0 
409b : b0 02 __ BCS $409f ; (vdcwin_printline.s0 + 0)
409d : c6 24 __ DEC SP + 1 
.s0:
409f : a0 08 __ LDY #$08
40a1 : b1 23 __ LDA (SP + 0),y 
40a3 : 85 53 __ STA T0 + 0 
40a5 : a0 02 __ LDY #$02
40a7 : 91 23 __ STA (SP + 0),y 
40a9 : a0 09 __ LDY #$09
40ab : b1 23 __ LDA (SP + 0),y 
40ad : 85 54 __ STA T0 + 1 
40af : a0 03 __ LDY #$03
40b1 : 91 23 __ STA (SP + 0),y 
40b3 : a0 0a __ LDY #$0a
40b5 : b1 23 __ LDA (SP + 0),y 
40b7 : a0 04 __ LDY #$04
40b9 : 91 23 __ STA (SP + 0),y 
40bb : a0 0b __ LDY #$0b
40bd : b1 23 __ LDA (SP + 0),y 
40bf : a0 05 __ LDY #$05
40c1 : 91 23 __ STA (SP + 0),y 
40c3 : 20 2d 41 JSR $412d ; (vdcwin_put_string.s1000 + 0)
40c6 : a9 00 __ LDA #$00
40c8 : a0 04 __ LDY #$04
40ca : 91 53 __ STA (T0 + 0),y 
40cc : 88 __ __ DEY
40cd : b1 53 __ LDA (T0 + 0),y 
40cf : 85 55 __ STA T1 + 0 
40d1 : 38 __ __ SEC
40d2 : e9 01 __ SBC #$01
40d4 : 85 44 __ STA T3 + 0 
40d6 : a0 05 __ LDY #$05
40d8 : b1 53 __ LDA (T0 + 0),y 
40da : 90 0b __ BCC $40e7 ; (vdcwin_printline.s2 + 0)
.s1002:
40dc : aa __ __ TAX
40dd : e4 44 __ CPX T3 + 0 
40df : b0 06 __ BCS $40e7 ; (vdcwin_printline.s2 + 0)
.s1:
40e1 : e8 __ __ INX
40e2 : 8a __ __ TXA
40e3 : 91 53 __ STA (T0 + 0),y 
40e5 : 90 2b __ BCC $4112 ; (vdcwin_printline.s1001 + 0)
.s2:
40e7 : a5 53 __ LDA T0 + 0 
40e9 : 85 15 __ STA P8 
40eb : a5 54 __ LDA T0 + 1 
40ed : 85 16 __ STA P9 
40ef : 20 dd 41 JSR $41dd ; (vdcwin_scroll_up.s0 + 0)
40f2 : a9 20 __ LDA #$20
40f4 : 85 11 __ STA P4 
40f6 : a0 00 __ LDY #$00
40f8 : b1 15 __ LDA (P8),y 
40fa : 85 0f __ STA P2 ; (str + 0)
40fc : a0 02 __ LDY #$02
40fe : b1 15 __ LDA (P8),y 
4100 : 85 12 __ STA P5 
4102 : 88 __ __ DEY
4103 : 84 13 __ STY P6 
4105 : b1 15 __ LDA (P8),y 
4107 : 18 __ __ CLC
4108 : 65 55 __ ADC T1 + 0 
410a : 38 __ __ SEC
410b : e9 01 __ SBC #$01
410d : 85 10 __ STA P3 ; (str + 1)
410f : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
.s1001:
4112 : 18 __ __ CLC
4113 : a5 23 __ LDA SP + 0 
4115 : 69 06 __ ADC #$06
4117 : 85 23 __ STA SP + 0 
4119 : 90 02 __ BCC $411d ; (vdcwin_printline.s1001 + 11)
411b : e6 24 __ INC SP + 1 
411d : ad f4 bf LDA $bff4 ; (buffer + 12)
4120 : 85 53 __ STA T0 + 0 
4122 : ad f5 bf LDA $bff5 ; (buffer + 13)
4125 : 85 54 __ STA T0 + 1 
4127 : ad f6 bf LDA $bff6 ; (buffer + 14)
412a : 85 55 __ STA T1 + 0 
412c : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
412d : 38 __ __ SEC
412e : a5 23 __ LDA SP + 0 
4130 : e9 0b __ SBC #$0b
4132 : 85 23 __ STA SP + 0 
4134 : b0 02 __ BCS $4138 ; (vdcwin_put_string.s0 + 0)
4136 : c6 24 __ DEC SP + 1 
.s0:
4138 : a0 0d __ LDY #$0d
413a : b1 23 __ LDA (SP + 0),y 
413c : 85 11 __ STA P4 
413e : c8 __ __ INY
413f : b1 23 __ LDA (SP + 0),y 
4141 : 85 12 __ STA P5 
4143 : a0 04 __ LDY #$04
4145 : b1 11 __ LDA (P4),y 
4147 : 85 13 __ STA P6 
4149 : c8 __ __ INY
414a : b1 11 __ LDA (P4),y 
414c : 85 14 __ STA P7 
414e : a0 0f __ LDY #$0f
4150 : b1 23 __ LDA (SP + 0),y 
4152 : 85 15 __ STA P8 
4154 : c8 __ __ INY
4155 : b1 23 __ LDA (SP + 0),y 
4157 : 85 16 __ STA P9 
4159 : 20 a8 41 JSR $41a8 ; (vdcwin_putat_string.s0 + 0)
415c : 18 __ __ CLC
415d : a5 1b __ LDA ACCU + 0 
415f : 65 13 __ ADC P6 
4161 : a0 04 __ LDY #$04
4163 : 91 11 __ STA (P4),y 
4165 : a0 02 __ LDY #$02
4167 : d1 11 __ CMP (P4),y 
4169 : 90 31 __ BCC $419c ; (vdcwin_put_string.s1001 + 0)
.s1:
416b : a9 00 __ LDA #$00
416d : a0 04 __ LDY #$04
416f : 91 11 __ STA (P4),y 
4171 : a5 14 __ LDA P7 
4173 : 69 00 __ ADC #$00
4175 : c8 __ __ INY
4176 : 91 11 __ STA (P4),y 
4178 : a0 03 __ LDY #$03
417a : d1 11 __ CMP (P4),y 
417c : d0 1e __ BNE $419c ; (vdcwin_put_string.s1001 + 0)
.s4:
417e : a5 14 __ LDA P7 
4180 : a0 05 __ LDY #$05
4182 : 91 11 __ STA (P4),y 
4184 : a5 11 __ LDA P4 
4186 : a0 02 __ LDY #$02
4188 : 91 23 __ STA (SP + 0),y 
418a : a5 12 __ LDA P5 
418c : c8 __ __ INY
418d : 91 23 __ STA (SP + 0),y 
418f : a9 fe __ LDA #$fe
4191 : c8 __ __ INY
4192 : 91 23 __ STA (SP + 0),y 
4194 : a9 33 __ LDA #$33
4196 : c8 __ __ INY
4197 : 91 23 __ STA (SP + 0),y 
4199 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
.s1001:
419c : 18 __ __ CLC
419d : a5 23 __ LDA SP + 0 
419f : 69 0b __ ADC #$0b
41a1 : 85 23 __ STA SP + 0 
41a3 : 90 02 __ BCC $41a7 ; (vdcwin_put_string.s1001 + 11)
41a5 : e6 24 __ INC SP + 1 
41a7 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
41a8 : a9 00 __ LDA #$00
41aa : 85 43 __ STA T0 + 0 
41ac : f0 26 __ BEQ $41d4 ; (vdcwin_putat_string.l1 + 0)
.s2:
41ae : 4a __ __ LSR
41af : 4a __ __ LSR
41b0 : 4a __ __ LSR
41b1 : 4a __ __ LSR
41b2 : 4a __ __ LSR
41b3 : aa __ __ TAX
41b4 : bd 7e 50 LDA $507e,x ; (p2smap + 0)
41b7 : 51 15 __ EOR (P8),y ; (str + 0)
41b9 : 85 0f __ STA P2 
41bb : a5 13 __ LDA P6 ; (x + 0)
41bd : 18 __ __ CLC
41be : a0 00 __ LDY #$00
41c0 : 71 11 __ ADC (P4),y ; (win + 0)
41c2 : 18 __ __ CLC
41c3 : 65 43 __ ADC T0 + 0 
41c5 : 85 0d __ STA P0 
41c7 : a5 14 __ LDA P7 ; (y + 0)
41c9 : 18 __ __ CLC
41ca : c8 __ __ INY
41cb : 71 11 __ ADC (P4),y ; (win + 0)
41cd : 85 0e __ STA P1 
41cf : 20 7d 40 JSR $407d ; (vdc_printc@proxy + 0)
41d2 : e6 43 __ INC T0 + 0 
.l1:
41d4 : a4 43 __ LDY T0 + 0 
41d6 : b1 15 __ LDA (P8),y ; (str + 0)
41d8 : d0 d4 __ BNE $41ae ; (vdcwin_putat_string.s2 + 0)
.s3:
41da : 84 1b __ STY ACCU + 0 
.s1001:
41dc : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
41dd : a0 02 __ LDY #$02
41df : b1 15 __ LDA (P8),y ; (win + 0)
41e1 : 85 47 __ STA T2 + 0 
41e3 : a0 06 __ LDY #$06
41e5 : b1 15 __ LDA (P8),y ; (win + 0)
41e7 : 85 48 __ STA T3 + 0 
41e9 : c8 __ __ INY
41ea : b1 15 __ LDA (P8),y ; (win + 0)
41ec : 85 49 __ STA T3 + 1 
41ee : c8 __ __ INY
41ef : b1 15 __ LDA (P8),y ; (win + 0)
41f1 : 85 4a __ STA T4 + 0 
41f3 : c8 __ __ INY
41f4 : b1 15 __ LDA (P8),y ; (win + 0)
41f6 : 85 4b __ STA T4 + 1 
41f8 : ad db 51 LDA $51db ; (vdc_state + 3)
41fb : 85 4c __ STA T5 + 0 
41fd : ad dc 51 LDA $51dc ; (vdc_state + 4)
4200 : 85 4d __ STA T5 + 1 
4202 : a9 00 __ LDA #$00
4204 : 85 46 __ STA T0 + 0 
4206 : 85 14 __ STA P7 
4208 : f0 4c __ BEQ $4256 ; (vdcwin_scroll_up.l1 + 0)
.s2:
420a : a5 48 __ LDA T3 + 0 
420c : 85 0f __ STA P2 
420e : 18 __ __ CLC
420f : 65 4c __ ADC T5 + 0 
4211 : 85 11 __ STA P4 
4213 : a5 49 __ LDA T3 + 1 
4215 : 85 10 __ STA P3 
4217 : 65 4d __ ADC T5 + 1 
4219 : 85 12 __ STA P5 
421b : a5 47 __ LDA T2 + 0 
421d : 85 13 __ STA P6 
421f : 20 66 42 JSR $4266 ; (vdc_block_copy.s0 + 0)
4222 : a5 4a __ LDA T4 + 0 
4224 : 85 0f __ STA P2 
4226 : 18 __ __ CLC
4227 : 65 4c __ ADC T5 + 0 
4229 : 85 11 __ STA P4 
422b : a5 4b __ LDA T4 + 1 
422d : 85 10 __ STA P3 
422f : 65 4d __ ADC T5 + 1 
4231 : 85 12 __ STA P5 
4233 : 20 66 42 JSR $4266 ; (vdc_block_copy.s0 + 0)
4236 : ad db 51 LDA $51db ; (vdc_state + 3)
4239 : 18 __ __ CLC
423a : 65 48 __ ADC T3 + 0 
423c : 85 48 __ STA T3 + 0 
423e : ad dc 51 LDA $51dc ; (vdc_state + 4)
4241 : 65 49 __ ADC T3 + 1 
4243 : 85 49 __ STA T3 + 1 
4245 : 18 __ __ CLC
4246 : a5 4a __ LDA T4 + 0 
4248 : 6d db 51 ADC $51db ; (vdc_state + 3)
424b : 85 4a __ STA T4 + 0 
424d : a5 4b __ LDA T4 + 1 
424f : 6d dc 51 ADC $51dc ; (vdc_state + 4)
4252 : 85 4b __ STA T4 + 1 
4254 : e6 46 __ INC T0 + 0 
.l1:
4256 : a0 03 __ LDY #$03
4258 : b1 15 __ LDA (P8),y ; (win + 0)
425a : 38 __ __ SEC
425b : e9 01 __ SBC #$01
425d : 90 ab __ BCC $420a ; (vdcwin_scroll_up.s2 + 0)
.s1002:
425f : c5 46 __ CMP T0 + 0 
4261 : 90 02 __ BCC $4265 ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
4263 : d0 a5 __ BNE $420a ; (vdcwin_scroll_up.s2 + 0)
.s1001:
4265 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
4266 : a5 14 __ LDA P7 ; (length + 1)
4268 : d0 5a __ BNE $42c4 ; (vdc_block_copy.s73 + 0)
.s4:
426a : a5 0f __ LDA P2 ; (dest + 0)
426c : 85 0d __ STA P0 
426e : a5 10 __ LDA P3 ; (dest + 1)
4270 : 85 0e __ STA P1 
4272 : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
4275 : a9 18 __ LDA #$18
4277 : 8d 00 d6 STA $d600 
.l332:
427a : 2c 00 d6 BIT $d600 
427d : 10 fb __ BPL $427a ; (vdc_block_copy.l332 + 0)
.s40:
427f : ad 01 d6 LDA $d601 
4282 : 09 80 __ ORA #$80
4284 : a2 18 __ LDX #$18
4286 : 8e 00 d6 STX $d600 
.l334:
4289 : 2c 00 d6 BIT $d600 
428c : 10 fb __ BPL $4289 ; (vdc_block_copy.l334 + 0)
.s46:
428e : 8d 01 d6 STA $d601 
4291 : a9 20 __ LDA #$20
4293 : 8d 00 d6 STA $d600 
.l336:
4296 : 2c 00 d6 BIT $d600 
4299 : 10 fb __ BPL $4296 ; (vdc_block_copy.l336 + 0)
.s51:
429b : a5 12 __ LDA P5 ; (src + 1)
429d : 8d 01 d6 STA $d601 
42a0 : a9 21 __ LDA #$21
42a2 : 8d 00 d6 STA $d600 
.l338:
42a5 : 2c 00 d6 BIT $d600 
42a8 : 10 fb __ BPL $42a5 ; (vdc_block_copy.l338 + 0)
.s56:
42aa : a5 11 __ LDA P4 ; (src + 0)
42ac : 8d 01 d6 STA $d601 
42af : a9 1f __ LDA #$1f
42b1 : 8d 00 d6 STA $d600 
42b4 : a9 1e __ LDA #$1e
42b6 : 8d 00 d6 STA $d600 
.l340:
42b9 : 2c 00 d6 BIT $d600 
42bc : 10 fb __ BPL $42b9 ; (vdc_block_copy.l340 + 0)
.s62:
42be : a5 13 __ LDA P6 ; (length + 0)
42c0 : 8d 01 d6 STA $d601 
.s1001:
42c3 : 60 __ __ RTS
.s73:
42c4 : 85 45 __ STA T2 + 0 
42c6 : a5 10 __ LDA P3 ; (dest + 1)
42c8 : 85 44 __ STA T0 + 1 
42ca : a5 0f __ LDA P2 ; (dest + 0)
42cc : 85 0d __ STA P0 
.l2:
42ce : 20 47 2d JSR $2d47 ; (vdc_mem_addr@proxy + 0)
42d1 : a9 18 __ LDA #$18
42d3 : 8d 00 d6 STA $d600 
.l321:
42d6 : 2c 00 d6 BIT $d600 
42d9 : 10 fb __ BPL $42d6 ; (vdc_block_copy.l321 + 0)
.s11:
42db : ad 01 d6 LDA $d601 
42de : 09 80 __ ORA #$80
42e0 : a2 18 __ LDX #$18
42e2 : 8e 00 d6 STX $d600 
.l323:
42e5 : 2c 00 d6 BIT $d600 
42e8 : 10 fb __ BPL $42e5 ; (vdc_block_copy.l323 + 0)
.s17:
42ea : 8d 01 d6 STA $d601 
42ed : a9 20 __ LDA #$20
42ef : 8d 00 d6 STA $d600 
.l325:
42f2 : 2c 00 d6 BIT $d600 
42f5 : 10 fb __ BPL $42f2 ; (vdc_block_copy.l325 + 0)
.s22:
42f7 : a5 12 __ LDA P5 ; (src + 1)
42f9 : 8d 01 d6 STA $d601 
42fc : a9 21 __ LDA #$21
42fe : 8d 00 d6 STA $d600 
.l327:
4301 : 2c 00 d6 BIT $d600 
4304 : 10 fb __ BPL $4301 ; (vdc_block_copy.l327 + 0)
.s27:
4306 : a5 11 __ LDA P4 ; (src + 0)
4308 : 8d 01 d6 STA $d601 
430b : a9 1f __ LDA #$1f
430d : 8d 00 d6 STA $d600 
4310 : a9 1e __ LDA #$1e
4312 : 8d 00 d6 STA $d600 
.l329:
4315 : 2c 00 d6 BIT $d600 
4318 : 10 fb __ BPL $4315 ; (vdc_block_copy.l329 + 0)
.s33:
431a : a9 ff __ LDA #$ff
431c : 8d 01 d6 STA $d601 
431f : e6 12 __ INC P5 ; (src + 1)
4321 : e6 44 __ INC T0 + 1 
4323 : c6 45 __ DEC T2 + 0 
4325 : d0 a7 __ BNE $42ce ; (vdc_block_copy.l2 + 0)
.s145:
4327 : a5 0d __ LDA P0 
4329 : 85 0f __ STA P2 ; (dest + 0)
432b : a5 44 __ LDA T0 + 1 
432d : 85 10 __ STA P3 ; (dest + 1)
432f : 4c 6a 42 JMP $426a ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
4332 : __ __ __ BYT 75 4e 4b 4e 4f 57 4e 20 54 59 50 45 00          : uNKNOWN TYPE.
--------------------------------------------------------------------
dir_validentry: ; dir_validentry(u8)->u8
.s0:
433f : ad fd 51 LDA $51fd ; (current + 0)
4342 : 85 43 __ STA T0 + 0 
4344 : 85 0d __ STA P0 
4346 : ad fe 51 LDA $51fe ; (current + 1)
4349 : 85 44 __ STA T0 + 1 
434b : 85 0e __ STA P1 
434d : 20 3a 33 JSR $333a ; (strlen.s0 + 0)
4350 : a0 13 __ LDY #$13
4352 : b1 43 __ LDA (T0 + 0),y 
4354 : c9 11 __ CMP #$11
4356 : d0 4c __ BNE $43a4 ; (dir_validentry.s1015 + 0)
.s3:
4358 : a5 1b __ LDA ACCU + 0 
435a : c9 06 __ CMP #$06
435c : 90 46 __ BCC $43a4 ; (dir_validentry.s1015 + 0)
.s14:
435e : a9 00 __ LDA #$00
4360 : 8d f2 bf STA $bff2 ; (buffer + 10)
4363 : 8d f3 bf STA $bff3 ; (buffer + 11)
4366 : 8d f4 bf STA $bff4 ; (buffer + 12)
4369 : 8d f5 bf STA $bff5 ; (buffer + 13)
436c : 8d f6 bf STA $bff6 ; (buffer + 14)
436f : 8d f7 bf STA $bff7 ; (buffer + 15)
4372 : a5 1b __ LDA ACCU + 0 
4374 : e9 05 __ SBC #$05
4376 : 18 __ __ CLC
4377 : 65 43 __ ADC T0 + 0 
4379 : 85 43 __ STA T0 + 0 
437b : 90 02 __ BCC $437f ; (dir_validentry.s1011 + 0)
.s1010:
437d : e6 44 __ INC T0 + 1 
.s1011:
437f : a0 00 __ LDY #$00
.l1008:
4381 : b1 43 __ LDA (T0 + 0),y 
4383 : 99 f2 bf STA $bff2,y ; (buffer + 10)
4386 : c8 __ __ INY
4387 : c0 05 __ CPY #$05
4389 : 90 f6 __ BCC $4381 ; (dir_validentry.l1008 + 0)
.s1009:
438b : a9 f2 __ LDA #$f2
438d : 85 0d __ STA P0 
438f : a9 bf __ LDA #$bf
4391 : 85 0e __ STA P1 
4393 : a9 dc __ LDA #$dc
4395 : 85 0f __ STA P2 
4397 : a9 43 __ LDA #$43
4399 : 85 10 __ STA P3 
439b : 20 ad 43 JSR $43ad ; (strcmp.s0 + 0)
439e : a5 1b __ LDA ACCU + 0 
43a0 : 05 1c __ ORA ACCU + 1 
43a2 : f0 04 __ BEQ $43a8 ; (dir_validentry.s1012 + 0)
.s1015:
43a4 : a9 00 __ LDA #$00
43a6 : f0 02 __ BEQ $43aa ; (dir_validentry.s1001 + 0)
.s1012:
43a8 : a9 01 __ LDA #$01
.s1001:
43aa : 85 1b __ STA ACCU + 0 
43ac : 60 __ __ RTS
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i16
.s0:
43ad : a0 00 __ LDY #$00
43af : 84 1c __ STY ACCU + 1 
43b1 : b1 0d __ LDA (P0),y 
43b3 : f0 16 __ BEQ $43cb ; (strcmp.s0 + 30)
43b5 : d1 0f __ CMP (P2),y 
43b7 : d0 16 __ BNE $43cf ; (strcmp.s0 + 34)
43b9 : c8 __ __ INY
43ba : b1 0d __ LDA (P0),y 
43bc : f0 0d __ BEQ $43cb ; (strcmp.s0 + 30)
43be : d1 0f __ CMP (P2),y 
43c0 : d0 0d __ BNE $43cf ; (strcmp.s0 + 34)
43c2 : c8 __ __ INY
43c3 : d0 ec __ BNE $43b1 ; (strcmp.s0 + 4)
43c5 : e6 0e __ INC P1 
43c7 : e6 10 __ INC P3 
43c9 : d0 e6 __ BNE $43b1 ; (strcmp.s0 + 4)
43cb : d1 0f __ CMP (P2),y 
43cd : f0 0a __ BEQ $43d9 ; (strcmp.s0 + 44)
43cf : b0 06 __ BCS $43d7 ; (strcmp.s0 + 42)
43d1 : a9 ff __ LDA #$ff
43d3 : 85 1c __ STA ACCU + 1 
43d5 : 30 02 __ BMI $43d9 ; (strcmp.s0 + 44)
43d7 : a9 01 __ LDA #$01
43d9 : 85 1b __ STA ACCU + 0 
.s1001:
43db : 60 __ __ RTS
--------------------------------------------------------------------
43dc : __ __ __ BYT 2e 50 52 4f 4a 00                               : .PROJ.
--------------------------------------------------------------------
drawDirFrame: ; drawDirFrame(u8)->void
.s1000:
43e2 : 38 __ __ SEC
43e3 : a5 23 __ LDA SP + 0 
43e5 : e9 0a __ SBC #$0a
43e7 : 85 23 __ STA SP + 0 
43e9 : b0 02 __ BCS $43ed ; (drawDirFrame.s0 + 0)
43eb : c6 24 __ DEC SP + 1 
.s0:
43ed : a9 0a __ LDA #$0a
43ef : 85 0f __ STA P2 
43f1 : a9 05 __ LDA #$05
43f3 : 85 10 __ STA P3 
43f5 : a9 28 __ LDA #$28
43f7 : 85 12 __ STA P5 
43f9 : a9 10 __ LDA #$10
43fb : 85 13 __ STA P6 
43fd : 20 77 2c JSR $2c77 ; (vdc_clear@proxy + 0)
4400 : a9 80 __ LDA #$80
4402 : a0 02 __ LDY #$02
4404 : 91 23 __ STA (SP + 0),y 
4406 : a9 52 __ LDA #$52
4408 : c8 __ __ INY
4409 : 91 23 __ STA (SP + 0),y 
440b : a9 6b __ LDA #$6b
440d : c8 __ __ INY
440e : 91 23 __ STA (SP + 0),y 
4410 : a9 44 __ LDA #$44
4412 : c8 __ __ INY
4413 : 91 23 __ STA (SP + 0),y 
4415 : ad fd bf LDA $bffd ; (sstack + 5)
4418 : c8 __ __ INY
4419 : 91 23 __ STA (SP + 0),y 
441b : a9 00 __ LDA #$00
441d : c8 __ __ INY
441e : 91 23 __ STA (SP + 0),y 
4420 : a9 d1 __ LDA #$d1
4422 : c8 __ __ INY
4423 : 91 23 __ STA (SP + 0),y 
4425 : a9 52 __ LDA #$52
4427 : c8 __ __ INY
4428 : 91 23 __ STA (SP + 0),y 
442a : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
442d : 20 25 50 JSR $5025 ; (vdc_prints@proxy + 0)
4430 : a9 80 __ LDA #$80
4432 : a0 02 __ LDY #$02
4434 : 91 23 __ STA (SP + 0),y 
4436 : a9 52 __ LDA #$52
4438 : c8 __ __ INY
4439 : 91 23 __ STA (SP + 0),y 
443b : a9 78 __ LDA #$78
443d : c8 __ __ INY
443e : 91 23 __ STA (SP + 0),y 
4440 : a9 44 __ LDA #$44
4442 : c8 __ __ INY
4443 : 91 23 __ STA (SP + 0),y 
4445 : ad f0 52 LDA $52f0 ; (cwd + 31)
4448 : c8 __ __ INY
4449 : 91 23 __ STA (SP + 0),y 
444b : ad f1 52 LDA $52f1 ; (cwd + 32)
444e : c8 __ __ INY
444f : 91 23 __ STA (SP + 0),y 
4451 : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
4454 : a9 0b __ LDA #$0b
4456 : 85 11 __ STA P4 
4458 : a9 14 __ LDA #$14
445a : 85 12 __ STA P5 
445c : 20 38 50 JSR $5038 ; (vdc_prints@proxy + 0)
.s1001:
445f : 18 __ __ CLC
4460 : a5 23 __ LDA SP + 0 
4462 : 69 0a __ ADC #$0a
4464 : 85 23 __ STA SP + 0 
4466 : 90 02 __ BCC $446a ; (drawDirFrame.s1001 + 11)
4468 : e6 24 __ INC SP + 1 
446a : 60 __ __ RTS
--------------------------------------------------------------------
446b : __ __ __ BYT 5b 25 30 32 55 5d 20 25 2e 32 30 53 00          : [%02U] %.20S.
--------------------------------------------------------------------
4478 : __ __ __ BYT 25 55 20 42 4c 4f 43 4b 53 20 46 52 45 45 00    : %U BLOCKS FREE.
--------------------------------------------------------------------
printElementPriv: ; printElementPriv(const u8)->void
.s1000:
4487 : a2 03 __ LDX #$03
4489 : b5 53 __ LDA T1 + 0,x 
448b : 9d d6 bf STA $bfd6,x ; (buff + 44)
448e : ca __ __ DEX
448f : 10 f8 __ BPL $4489 ; (printElementPriv.s1000 + 2)
4491 : 38 __ __ SEC
4492 : a5 23 __ LDA SP + 0 
4494 : e9 0a __ SBC #$0a
4496 : 85 23 __ STA SP + 0 
4498 : b0 02 __ BCS $449c ; (printElementPriv.s0 + 0)
449a : c6 24 __ DEC SP + 1 
.s0:
449c : a9 0c __ LDA #$0c
449e : 8d f4 50 STA $50f4 ; (fullscreen + 4)
44a1 : ad 8a 50 LDA $508a ; (mc_pd_normal + 0)
44a4 : 8d df 51 STA $51df ; (vdc_state + 7)
44a7 : ad fd bf LDA $bffd ; (sstack + 5)
44aa : 8d f5 50 STA $50f5 ; (fullscreen + 5)
44ad : ad fd 51 LDA $51fd ; (current + 0)
44b0 : 85 53 __ STA T1 + 0 
44b2 : ad fe 51 LDA $51fe ; (current + 1)
44b5 : 85 54 __ STA T1 + 1 
44b7 : cd eb 52 CMP $52eb ; (cwd + 26)
44ba : d0 0d __ BNE $44c9 ; (printElementPriv.s3 + 0)
.s1011:
44bc : a5 53 __ LDA T1 + 0 
44be : cd ea 52 CMP $52ea ; (cwd + 25)
44c1 : d0 06 __ BNE $44c9 ; (printElementPriv.s3 + 0)
.s1:
44c3 : ad 8b 50 LDA $508b ; (mc_pd_select + 0)
44c6 : 8d df 51 STA $51df ; (vdc_state + 7)
.s3:
44c9 : a0 ff __ LDY #$ff
.l1002:
44cb : c8 __ __ INY
44cc : b1 53 __ LDA (T1 + 0),y 
44ce : 99 80 52 STA $5280,y ; (linebuffer + 0)
44d1 : d0 f8 __ BNE $44cb ; (printElementPriv.l1002 + 0)
.s1003:
44d3 : a9 80 __ LDA #$80
44d5 : a0 08 __ LDY #$08
44d7 : 91 23 __ STA (SP + 0),y 
44d9 : a9 52 __ LDA #$52
44db : c8 __ __ INY
44dc : 91 23 __ STA (SP + 0),y 
44de : a9 90 __ LDA #$90
44e0 : a0 02 __ LDY #$02
44e2 : 91 23 __ STA (SP + 0),y 
44e4 : a9 53 __ LDA #$53
44e6 : c8 __ __ INY
44e7 : 91 23 __ STA (SP + 0),y 
44e9 : a0 11 __ LDY #$11
44eb : b1 53 __ LDA (T1 + 0),y 
44ed : 85 1b __ STA ACCU + 0 
44ef : c8 __ __ INY
44f0 : b1 53 __ LDA (T1 + 0),y 
44f2 : a0 07 __ LDY #$07
44f4 : 91 23 __ STA (SP + 0),y 
44f6 : aa __ __ TAX
44f7 : a5 1b __ LDA ACCU + 0 
44f9 : 88 __ __ DEY
44fa : 91 23 __ STA (SP + 0),y 
44fc : e0 27 __ CPX #$27
44fe : d0 02 __ BNE $4502 ; (printElementPriv.s1010 + 0)
.s1009:
4500 : c9 10 __ CMP #$10
.s1010:
4502 : b0 06 __ BCS $450a ; (printElementPriv.s10 + 0)
.s9:
4504 : a9 45 __ LDA #$45
4506 : a2 ba __ LDX #$ba
4508 : 90 04 __ BCC $450e ; (printElementPriv.s11 + 0)
.s10:
450a : a9 45 __ LDA #$45
450c : a2 c5 __ LDX #$c5
.s11:
450e : 85 54 __ STA T1 + 1 
4510 : 8a __ __ TXA
4511 : a0 04 __ LDY #$04
4513 : 91 23 __ STA (SP + 0),y 
4515 : a5 54 __ LDA T1 + 1 
4517 : c8 __ __ INY
4518 : 91 23 __ STA (SP + 0),y 
451a : 20 ae 33 JSR $33ae ; (sprintf.s0 + 0)
451d : a9 90 __ LDA #$90
451f : a0 04 __ LDY #$04
4521 : 91 23 __ STA (SP + 0),y 
4523 : a9 53 __ LDA #$53
4525 : c8 __ __ INY
4526 : 91 23 __ STA (SP + 0),y 
4528 : a9 f0 __ LDA #$f0
452a : a0 02 __ LDY #$02
452c : 91 23 __ STA (SP + 0),y 
452e : a9 50 __ LDA #$50
4530 : c8 __ __ INY
4531 : 91 23 __ STA (SP + 0),y 
4533 : 20 2d 41 JSR $412d ; (vdcwin_put_string.s1000 + 0)
4536 : ad fd 51 LDA $51fd ; (current + 0)
4539 : 85 55 __ STA T3 + 0 
453b : ad fe 51 LDA $51fe ; (current + 1)
453e : 85 56 __ STA T3 + 1 
4540 : a0 13 __ LDY #$13
4542 : b1 55 __ LDA (T3 + 0),y 
4544 : 20 cf 45 JSR $45cf ; (fileTypeToStr.s1000 + 0)
4547 : a0 ff __ LDY #$ff
.l1004:
4549 : c8 __ __ INY
454a : b1 1b __ LDA (ACCU + 0),y 
454c : 99 90 53 STA $5390,y ; (linebuffer2 + 0)
454f : d0 f8 __ BNE $4549 ; (printElementPriv.l1004 + 0)
.s1005:
4551 : a0 12 __ LDY #$12
4553 : b1 55 __ LDA (T3 + 0),y 
4555 : c9 27 __ CMP #$27
4557 : d0 05 __ BNE $455e ; (printElementPriv.s1008 + 0)
.s1007:
4559 : 88 __ __ DEY
455a : b1 55 __ LDA (T3 + 0),y 
455c : c9 10 __ CMP #$10
.s1008:
455e : 90 26 __ BCC $4586 ; (printElementPriv.s7 + 0)
.s8:
4560 : a5 55 __ LDA T3 + 0 
4562 : 85 0d __ STA P0 
4564 : a5 56 __ LDA T3 + 1 
4566 : 85 0e __ STA P1 
4568 : 20 3a 33 JSR $333a ; (strlen.s0 + 0)
456b : a5 1c __ LDA ACCU + 1 
456d : d0 17 __ BNE $4586 ; (printElementPriv.s7 + 0)
.s1006:
456f : a5 1b __ LDA ACCU + 0 
4571 : c9 10 __ CMP #$10
4573 : d0 11 __ BNE $4586 ; (printElementPriv.s7 + 0)
.s5:
4575 : ad 91 53 LDA $5391 ; (linebuffer2 + 1)
4578 : 8d 90 53 STA $5390 ; (linebuffer2 + 0)
457b : ad 92 53 LDA $5392 ; (linebuffer2 + 2)
457e : 8d 91 53 STA $5391 ; (linebuffer2 + 1)
4581 : a9 00 __ LDA #$00
4583 : 8d 92 53 STA $5392 ; (linebuffer2 + 2)
.s7:
4586 : a9 f0 __ LDA #$f0
4588 : a0 02 __ LDY #$02
458a : 91 23 __ STA (SP + 0),y 
458c : a9 50 __ LDA #$50
458e : c8 __ __ INY
458f : 91 23 __ STA (SP + 0),y 
4591 : a9 90 __ LDA #$90
4593 : c8 __ __ INY
4594 : 91 23 __ STA (SP + 0),y 
4596 : a9 53 __ LDA #$53
4598 : c8 __ __ INY
4599 : 91 23 __ STA (SP + 0),y 
459b : 20 2d 41 JSR $412d ; (vdcwin_put_string.s1000 + 0)
459e : ad 79 50 LDA $5079 ; (mc_menupopup + 0)
45a1 : 8d df 51 STA $51df ; (vdc_state + 7)
.s1001:
45a4 : 18 __ __ CLC
45a5 : a5 23 __ LDA SP + 0 
45a7 : 69 0a __ ADC #$0a
45a9 : 85 23 __ STA SP + 0 
45ab : 90 02 __ BCC $45af ; (printElementPriv.s1001 + 11)
45ad : e6 24 __ INC SP + 1 
45af : a2 03 __ LDX #$03
45b1 : bd d6 bf LDA $bfd6,x ; (buff + 44)
45b4 : 95 53 __ STA T1 + 0,x 
45b6 : ca __ __ DEX
45b7 : 10 f8 __ BPL $45b1 ; (printElementPriv.s1001 + 13)
45b9 : 60 __ __ RTS
--------------------------------------------------------------------
45ba : __ __ __ BYT 25 34 55 20 25 2d 31 36 53 20 00                : %4U %-16S .
--------------------------------------------------------------------
45c5 : __ __ __ BYT 25 55 20 25 2d 31 35 53 20 00                   : %U %-15S .
--------------------------------------------------------------------
fileTypeToStr: ; fileTypeToStr(u8)->const u8*
.s1000:
45cf : aa __ __ TAX
.s0:
45d0 : a8 __ __ TAY
45d1 : 29 10 __ AND #$10
45d3 : d0 43 __ BNE $4618 ; (fileTypeToStr.s1 + 0)
.s2:
45d5 : e0 06 __ CPX #$06
45d7 : b0 0e __ BCS $45e7 ; (fileTypeToStr.s3 + 0)
.s8:
45d9 : 98 __ __ TYA
45da : 0a __ __ ASL
45db : aa __ __ TAX
45dc : bd 96 50 LDA $5096,x ; (oth_types + 0)
45df : 85 1b __ STA ACCU + 0 
45e1 : bd 97 50 LDA $5097,x ; (oth_types + 1)
45e4 : 4c 15 46 JMP $4615 ; (fileTypeToStr.s1001 + 0)
.s3:
45e7 : a9 3f __ LDA #$3f
45e9 : 8d f2 52 STA $52f2 ; (bad_type + 0)
45ec : ad a2 50 LDA $50a2 ; (value2hex + 0)
45ef : 85 1b __ STA ACCU + 0 
45f1 : ad a3 50 LDA $50a3 ; (value2hex + 1)
45f4 : 85 1c __ STA ACCU + 1 
45f6 : 8a __ __ TXA
45f7 : 4a __ __ LSR
45f8 : 4a __ __ LSR
45f9 : 4a __ __ LSR
45fa : 4a __ __ LSR
45fb : a8 __ __ TAY
45fc : b1 1b __ LDA (ACCU + 0),y 
45fe : 8d f3 52 STA $52f3 ; (bad_type + 1)
4601 : 8a __ __ TXA
4602 : 29 0f __ AND #$0f
4604 : a8 __ __ TAY
4605 : b1 1b __ LDA (ACCU + 0),y 
4607 : 8d f4 52 STA $52f4 ; (bad_type + 2)
460a : a9 00 __ LDA #$00
460c : 8d f5 52 STA $52f5 ; (bad_type + 3)
460f : a9 f2 __ LDA #$f2
4611 : 85 1b __ STA ACCU + 0 
4613 : a9 52 __ LDA #$52
.s1001:
4615 : 85 1c __ STA ACCU + 1 
4617 : 60 __ __ RTS
.s1:
4618 : 8a __ __ TXA
4619 : 29 ef __ AND #$ef
461b : c9 05 __ CMP #$05
461d : aa __ __ TAX
461e : b0 c7 __ BCS $45e7 ; (fileTypeToStr.s3 + 0)
.s4:
4620 : 0a __ __ ASL
4621 : aa __ __ TAX
4622 : bd 8c 50 LDA $508c,x ; (reg_types + 0)
4625 : 85 1b __ STA ACCU + 0 
4627 : bd 8d 50 LDA $508d,x ; (reg_types + 1)
462a : 4c 15 46 JMP $4615 ; (fileTypeToStr.s1001 + 0)
--------------------------------------------------------------------
462d : __ __ __ BYT 73 65 71 00                                     : seq.
--------------------------------------------------------------------
4631 : __ __ __ BYT 70 72 67 00                                     : prg.
--------------------------------------------------------------------
4635 : __ __ __ BYT 75 72 73 00                                     : urs.
--------------------------------------------------------------------
4639 : __ __ __ BYT 72 65 6c 00                                     : rel.
--------------------------------------------------------------------
463d : __ __ __ BYT 76 72 70 00                                     : vrp.
--------------------------------------------------------------------
4641 : __ __ __ BYT 64 65 6c 00                                     : del.
--------------------------------------------------------------------
4645 : __ __ __ BYT 63 62 6d 00                                     : cbm.
--------------------------------------------------------------------
4649 : __ __ __ BYT 64 69 72 00                                     : dir.
--------------------------------------------------------------------
464d : __ __ __ BYT 6c 6e 6b 00                                     : lnk.
--------------------------------------------------------------------
4651 : __ __ __ BYT 6f 74 68 00                                     : oth.
--------------------------------------------------------------------
4655 : __ __ __ BYT 68 64 72 00                                     : hdr.
--------------------------------------------------------------------
4659 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 : 0123456789ABCDEF
4669 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
466a : __ __ __ BYT 6e 4f 20 56 41 4c 49 44 20 44 49 52 45 43 54 4f : nO VALID DIRECTO
467a : __ __ __ BYT 52 59 20 45 4e 54 52 49 45 53 20 46 4f 55 4e 44 : RY ENTRIES FOUND
468a : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
468c : __ __ __ BYT 20 66 31 20 64 49 52 20 52 45 46 52 2e 00       :  f1 dIR REFR..
--------------------------------------------------------------------
469a : __ __ __ BYT 2b 2f 2d 20 64 45 56 49 43 45 00                : +/- dEVICE.
--------------------------------------------------------------------
46a5 : __ __ __ BYT 72 65 74 20 73 45 4c 45 43 54 00                : ret sELECT.
--------------------------------------------------------------------
46b0 : __ __ __ BYT 20 20 74 20 74 4f 50 00                         :   t tOP.
--------------------------------------------------------------------
46b8 : __ __ __ BYT 20 20 65 20 65 4e 44 00                         :   e eND.
--------------------------------------------------------------------
46c0 : __ __ __ BYT 70 2f 75 20 70 41 47 45 20 55 50 2f 44 4f 00    : p/u pAGE UP/DO.
--------------------------------------------------------------------
46cf : __ __ __ BYT 63 55 52 20 6e 41 56 49 47 41 54 45 00          : cUR nAVIGATE.
--------------------------------------------------------------------
46dc : __ __ __ BYT 65 73 63 20 63 41 4e 43 45 4c 00                : esc cANCEL.
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
46e7 : 20 e4 ff JSR $ffe4 
46ea : c9 00 __ CMP #$00
46ec : f0 f9 __ BEQ $46e7 ; (vdcwin_getch.s0 + 0)
46ee : 85 1b __ STA ACCU + 0 
46f0 : a9 00 __ LDA #$00
46f2 : 85 1c __ STA ACCU + 1 
.s1001:
46f4 : 60 __ __ RTS
--------------------------------------------------------------------
46f5 : __ __ __ BYT 5b 25 32 55 5d 20 25 53 00                      : [%2U] %S.
--------------------------------------------------------------------
giocharmap:
46fe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
mc_default:
46ff : __ __ __ BYT 8d                                              : .
--------------------------------------------------------------------
4700 : __ __ __ BYT 66 49 4c 45 20 53 45 4c 45 43 54 45 44 3a 00    : fILE SELECTED:.
--------------------------------------------------------------------
470f : __ __ __ BYT 63 48 4f 4f 53 45 20 46 49 4c 45 4e 41 4d 45 20 : cHOOSE FILENAME 
471f : __ __ __ BYT 4f 46 20 47 45 4e 45 52 41 54 45 44 20 50 52 4f : OF GENERATED PRO
472f : __ __ __ BYT 47 52 41 4d 3a 00                               : GRAM:.
--------------------------------------------------------------------
textInput: ; textInput(u8,u8,u8*,u8)->void
.s0:
4735 : 20 32 33 JSR $3332 ; (strlen@proxy + 0)
4738 : a5 1b __ LDA ACCU + 0 
473a : 85 4a __ STA T1 + 0 
473c : f0 13 __ BEQ $4751 ; (textInput.l143 + 0)
.s1:
473e : a5 17 __ LDA P10 ; (str + 0)
4740 : 85 13 __ STA P6 
4742 : a5 18 __ LDA P11 ; (str + 1)
4744 : 85 14 __ STA P7 
4746 : a5 15 __ LDA P8 ; (xpos + 0)
4748 : 85 11 __ STA P4 
474a : a5 16 __ LDA P9 ; (ypos + 0)
474c : 85 12 __ STA P5 
474e : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
.l143:
4751 : 18 __ __ CLC
4752 : a5 4a __ LDA T1 + 0 
4754 : 65 15 __ ADC P8 ; (xpos + 0)
4756 : 8d f4 50 STA $50f4 ; (fullscreen + 4)
4759 : a5 16 __ LDA P9 ; (ypos + 0)
475b : 8d f5 50 STA $50f5 ; (fullscreen + 5)
.l142:
475e : 20 fa 48 JSR $48fa ; (vdcwin_cursor_toggle.s0 + 0)
.l6:
4761 : 20 e7 46 JSR $46e7 ; (vdcwin_getch.s0 + 0)
4764 : a5 1b __ LDA ACCU + 0 
4766 : c9 1b __ CMP #$1b
4768 : d0 03 __ BNE $476d ; (textInput.s70 + 0)
476a : 4c 89 48 JMP $4889 ; (textInput.s1001 + 0)
.s70:
476d : 85 4c __ STA T3 + 0 
476f : c9 1b __ CMP #$1b
4771 : b0 03 __ BCS $4776 ; (textInput.s71 + 0)
4773 : 4c 70 48 JMP $4870 ; (textInput.s72 + 0)
.s71:
4776 : c9 94 __ CMP #$94
4778 : d0 5e __ BNE $47d8 ; (textInput.s78 + 0)
.s27:
477a : 20 32 33 JSR $3332 ; (strlen@proxy + 0)
477d : a5 1b __ LDA ACCU + 0 
477f : c9 14 __ CMP #$14
4781 : b0 de __ BCS $4761 ; (textInput.l6 + 0)
.s32:
4783 : 85 4e __ STA T4 + 0 
4785 : 09 00 __ ORA #$00
4787 : f0 d8 __ BEQ $4761 ; (textInput.l6 + 0)
.s31:
4789 : a5 4a __ LDA T1 + 0 
478b : c5 1b __ CMP ACCU + 0 
478d : b0 d2 __ BCS $4761 ; (textInput.l6 + 0)
.s28:
478f : 20 fa 48 JSR $48fa ; (vdcwin_cursor_toggle.s0 + 0)
4792 : a5 17 __ LDA P10 ; (str + 0)
4794 : 85 13 __ STA P6 
4796 : a5 18 __ LDA P11 ; (str + 1)
4798 : 85 14 __ STA P7 
479a : a5 15 __ LDA P8 ; (xpos + 0)
479c : 85 11 __ STA P4 
479e : a5 16 __ LDA P9 ; (ypos + 0)
47a0 : 85 12 __ STA P5 
47a2 : 18 __ __ CLC
47a3 : a5 4e __ LDA T4 + 0 
47a5 : 69 01 __ ADC #$01
47a7 : c5 4a __ CMP T1 + 0 
47a9 : 90 14 __ BCC $47bf ; (textInput.s35 + 0)
.s1038:
47ab : 85 4f __ STA T7 + 0 
47ad : a8 __ __ TAY
.l34:
47ae : b1 17 __ LDA (P10),y ; (str + 0)
47b0 : c8 __ __ INY
47b1 : 91 17 __ STA (P10),y ; (str + 0)
47b3 : a5 4f __ LDA T7 + 0 
47b5 : f0 08 __ BEQ $47bf ; (textInput.s35 + 0)
.s38:
47b7 : c6 4f __ DEC T7 + 0 
47b9 : a4 4f __ LDY T7 + 0 
47bb : c4 4a __ CPY T1 + 0 
47bd : b0 ef __ BCS $47ae ; (textInput.l34 + 0)
.s35:
47bf : a9 20 __ LDA #$20
47c1 : a4 4a __ LDY T1 + 0 
47c3 : 91 17 __ STA (P10),y ; (str + 0)
47c5 : 20 f2 31 JSR $31f2 ; (vdc_prints.s0 + 0)
47c8 : a5 16 __ LDA P9 ; (ypos + 0)
47ca : 8d f5 50 STA $50f5 ; (fullscreen + 5)
47cd : 18 __ __ CLC
47ce : a5 15 __ LDA P8 ; (xpos + 0)
47d0 : 65 4a __ ADC T1 + 0 
.s144:
47d2 : 8d f4 50 STA $50f4 ; (fullscreen + 4)
47d5 : 4c 5e 47 JMP $475e ; (textInput.l142 + 0)
.s78:
47d8 : 90 6c __ BCC $4846 ; (textInput.s80 + 0)
.s79:
47da : c9 9d __ CMP #$9d
47dc : d0 0f __ BNE $47ed ; (textInput.s53 + 0)
.s41:
47de : a5 4a __ LDA T1 + 0 
47e0 : d0 03 __ BNE $47e5 ; (textInput.s42 + 0)
47e2 : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s42:
47e5 : c6 4a __ DEC T1 + 0 
.s145:
47e7 : 20 fa 48 JSR $48fa ; (vdcwin_cursor_toggle.s0 + 0)
47ea : 4c 51 47 JMP $4751 ; (textInput.l143 + 0)
.s53:
47ed : 09 00 __ ORA #$00
47ef : 10 03 __ BPL $47f4 ; (textInput.s62 + 0)
47f1 : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s62:
47f4 : aa __ __ TAX
47f5 : bd 00 52 LDA $5200,x ; (_cinfo + 0)
47f8 : d0 03 __ BNE $47fd ; (textInput.s59 + 0)
47fa : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s59:
47fd : a4 4a __ LDY T1 + 0 
47ff : c0 14 __ CPY #$14
4801 : 90 03 __ BCC $4806 ; (textInput.s54 + 0)
4803 : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s54:
4806 : b1 17 __ LDA (P10),y ; (str + 0)
4808 : 85 4b __ STA T2 + 0 
480a : 8a __ __ TXA
480b : 91 17 __ STA (P10),y ; (str + 0)
480d : 20 fa 48 JSR $48fa ; (vdcwin_cursor_toggle.s0 + 0)
4810 : a5 4c __ LDA T3 + 0 
4812 : 20 5e 33 JSR $335e ; (pet2screen.s0 + 0)
4815 : 85 0f __ STA P2 
4817 : 18 __ __ CLC
4818 : a5 15 __ LDA P8 ; (xpos + 0)
481a : 65 4a __ ADC T1 + 0 
481c : 85 0d __ STA P0 
481e : a5 16 __ LDA P9 ; (ypos + 0)
4820 : 85 0e __ STA P1 
4822 : 20 43 50 JSR $5043 ; (vdc_printc@proxy + 0)
4825 : a5 16 __ LDA P9 ; (ypos + 0)
4827 : 8d f5 50 STA $50f5 ; (fullscreen + 5)
482a : e6 4a __ INC T1 + 0 
482c : 18 __ __ CLC
482d : a5 4a __ LDA T1 + 0 
482f : 65 15 __ ADC P8 ; (xpos + 0)
4831 : 8d f4 50 STA $50f4 ; (fullscreen + 4)
4834 : 20 fa 48 JSR $48fa ; (vdcwin_cursor_toggle.s0 + 0)
4837 : a5 4b __ LDA T2 + 0 
4839 : f0 03 __ BEQ $483e ; (textInput.s65 + 0)
483b : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s65:
483e : a4 4a __ LDY T1 + 0 
4840 : c8 __ __ INY
4841 : 91 17 __ STA (P10),y ; (str + 0)
4843 : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s80:
4846 : c9 1d __ CMP #$1d
4848 : d0 a3 __ BNE $47ed ; (textInput.s53 + 0)
.s46:
484a : 20 32 33 JSR $3332 ; (strlen@proxy + 0)
484d : a5 1c __ LDA ACCU + 1 
484f : 10 03 __ BPL $4854 ; (textInput.s1012 + 0)
4851 : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s1012:
4854 : d0 15 __ BNE $486b ; (textInput.s1037 + 0)
.s1010:
4856 : a5 4a __ LDA T1 + 0 
4858 : c5 1b __ CMP ACCU + 0 
485a : 90 03 __ BCC $485f ; (textInput.s50 + 0)
485c : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s50:
485f : c9 14 __ CMP #$14
4861 : 90 03 __ BCC $4866 ; (textInput.s47 + 0)
4863 : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s47:
4866 : e6 4a __ INC T1 + 0 
4868 : 4c e7 47 JMP $47e7 ; (textInput.s145 + 0)
.s1037:
486b : a5 4a __ LDA T1 + 0 
486d : 4c 5f 48 JMP $485f ; (textInput.s50 + 0)
.s72:
4870 : c9 0d __ CMP #$0d
4872 : d0 0c __ BNE $4880 ; (textInput.s73 + 0)
.s10:
4874 : 20 32 33 JSR $3332 ; (strlen@proxy + 0)
4877 : a9 00 __ LDA #$00
4879 : a4 1b __ LDY ACCU + 0 
487b : 91 17 __ STA (P10),y ; (str + 0)
487d : 4c 89 48 JMP $4889 ; (textInput.s1001 + 0)
.s73:
4880 : b0 0a __ BCS $488c ; (textInput.s74 + 0)
.s75:
4882 : c9 03 __ CMP #$03
4884 : f0 03 __ BEQ $4889 ; (textInput.s1001 + 0)
4886 : 4c ed 47 JMP $47ed ; (textInput.s53 + 0)
.s1001:
4889 : 4c fa 48 JMP $48fa ; (vdcwin_cursor_toggle.s0 + 0)
.s74:
488c : c9 14 __ CMP #$14
488e : f0 03 __ BEQ $4893 ; (textInput.s11 + 0)
4890 : 4c ed 47 JMP $47ed ; (textInput.s53 + 0)
.s11:
4893 : a5 4a __ LDA T1 + 0 
4895 : d0 03 __ BNE $489a ; (textInput.s12 + 0)
4897 : 4c 61 47 JMP $4761 ; (textInput.l6 + 0)
.s12:
489a : 20 fa 48 JSR $48fa ; (vdcwin_cursor_toggle.s0 + 0)
489d : a9 20 __ LDA #$20
489f : 85 0f __ STA P2 
48a1 : c6 4a __ DEC T1 + 0 
48a3 : 18 __ __ CLC
48a4 : a5 4a __ LDA T1 + 0 
48a6 : 65 15 __ ADC P8 ; (xpos + 0)
48a8 : 85 0d __ STA P0 
48aa : a5 16 __ LDA P9 ; (ypos + 0)
48ac : 85 4b __ STA T2 + 0 
48ae : 85 0e __ STA P1 
48b0 : 20 43 50 JSR $5043 ; (vdc_printc@proxy + 0)
48b3 : a5 4a __ LDA T1 + 0 
48b5 : 85 4f __ STA T7 + 0 
48b7 : a5 17 __ LDA P10 ; (str + 0)
48b9 : 85 4c __ STA T3 + 0 
48bb : a5 18 __ LDA P11 ; (str + 1)
48bd : 85 4d __ STA T3 + 1 
.l16:
48bf : a4 4f __ LDY T7 + 0 
48c1 : c8 __ __ INY
48c2 : b1 4c __ LDA (T3 + 0),y 
48c4 : 85 50 __ STA T8 + 0 
48c6 : 88 __ __ DEY
48c7 : 91 4c __ STA (T3 + 0),y 
48c9 : 09 00 __ ORA #$00
48cb : d0 04 __ BNE $48d1 ; (textInput.s19 + 0)
.s20:
48cd : a9 20 __ LDA #$20
48cf : d0 03 __ BNE $48d4 ; (textInput.s21 + 0)
.s19:
48d1 : 20 5e 33 JSR $335e ; (pet2screen.s0 + 0)
.s21:
48d4 : 85 0f __ STA P2 
48d6 : a5 4b __ LDA T2 + 0 
48d8 : 85 0e __ STA P1 
48da : 18 __ __ CLC
48db : a5 15 __ LDA P8 ; (xpos + 0)
48dd : 65 4f __ ADC T7 + 0 
48df : 85 0d __ STA P0 
48e1 : 20 43 50 JSR $5043 ; (vdc_printc@proxy + 0)
48e4 : a5 50 __ LDA T8 + 0 
48e6 : d0 0d __ BNE $48f5 ; (textInput.s17 + 0)
.s18:
48e8 : a5 0e __ LDA P1 
48ea : 8d f5 50 STA $50f5 ; (fullscreen + 5)
48ed : 18 __ __ CLC
48ee : a5 4a __ LDA T1 + 0 
48f0 : 65 15 __ ADC P8 ; (xpos + 0)
48f2 : 4c d2 47 JMP $47d2 ; (textInput.s144 + 0)
.s17:
48f5 : e6 4f __ INC T7 + 0 
48f7 : 4c bf 48 JMP $48bf ; (textInput.l16 + 0)
--------------------------------------------------------------------
vdcwin_cursor_toggle: ; vdcwin_cursor_toggle(struct VDCWin*)->void
.s0:
48fa : ad f5 50 LDA $50f5 ; (fullscreen + 5)
48fd : 18 __ __ CLC
48fe : 6d f1 50 ADC $50f1 ; (fullscreen + 1)
4901 : 0a __ __ ASL
4902 : a8 __ __ TAY
4903 : a9 12 __ LDA #$12
4905 : 8d 00 d6 STA $d600 
4908 : ad f4 50 LDA $50f4 ; (fullscreen + 4)
490b : 18 __ __ CLC
490c : 6d f0 50 ADC $50f0 ; (fullscreen + 0)
490f : 18 __ __ CLC
4910 : 79 00 53 ADC $5300,y ; (multab + 0)
4913 : aa __ __ TAX
4914 : a9 00 __ LDA #$00
4916 : 79 01 53 ADC $5301,y ; (multab + 1)
4919 : a8 __ __ TAY
491a : 8a __ __ TXA
491b : 18 __ __ CLC
491c : 6d e2 51 ADC $51e2 ; (vdc_state + 10)
491f : aa __ __ TAX
4920 : 98 __ __ TYA
4921 : 6d e3 51 ADC $51e3 ; (vdc_state + 11)
.l169:
4924 : 2c 00 d6 BIT $d600 
4927 : 10 fb __ BPL $4924 ; (vdcwin_cursor_toggle.l169 + 0)
.s9:
4929 : 8d 01 d6 STA $d601 
492c : a0 13 __ LDY #$13
492e : 8c 00 d6 STY $d600 
.l171:
4931 : 2c 00 d6 BIT $d600 
4934 : 10 fb __ BPL $4931 ; (vdcwin_cursor_toggle.l171 + 0)
.s14:
4936 : 8e 01 d6 STX $d601 
4939 : a0 1f __ LDY #$1f
493b : 8c 00 d6 STY $d600 
.l173:
493e : 2c 00 d6 BIT $d600 
4941 : 10 fb __ BPL $493e ; (vdcwin_cursor_toggle.l173 + 0)
.s18:
4943 : a8 __ __ TAY
4944 : ad 01 d6 LDA $d601 
4947 : 49 50 __ EOR #$50
4949 : 85 1b __ STA ACCU + 0 
494b : a9 12 __ LDA #$12
494d : 8d 00 d6 STA $d600 
.l175:
4950 : 2c 00 d6 BIT $d600 
4953 : 10 fb __ BPL $4950 ; (vdcwin_cursor_toggle.l175 + 0)
.s27:
4955 : 8c 01 d6 STY $d601 
4958 : a9 13 __ LDA #$13
495a : 8d 00 d6 STA $d600 
.l177:
495d : 2c 00 d6 BIT $d600 
4960 : 10 fb __ BPL $495d ; (vdcwin_cursor_toggle.l177 + 0)
.s32:
4962 : 8e 01 d6 STX $d601 
4965 : a9 1f __ LDA #$1f
4967 : 8d 00 d6 STA $d600 
.l179:
496a : 2c 00 d6 BIT $d600 
496d : 10 fb __ BPL $496a ; (vdcwin_cursor_toggle.l179 + 0)
.s36:
496f : a5 1b __ LDA ACCU + 0 
4971 : 8d 01 d6 STA $d601 
.s1001:
4974 : 60 __ __ RTS
--------------------------------------------------------------------
4975 : __ __ __ BYT 52 30 3a 25 53 3d 25 53 00                      : R0:%S=%S.
--------------------------------------------------------------------
cmd@proxy: ; cmd@proxy
497e : ad ef 50 LDA $50ef ; (targetdevice + 0)
4981 : 85 10 __ STA P3 
4983 : a9 28 __ LDA #$28
4985 : 85 11 __ STA P4 
4987 : a9 54 __ LDA #$54
4989 : 85 12 __ STA P5 
--------------------------------------------------------------------
cmd: ; cmd(const u8,const u8*)->u16
.s0:
498b : a9 00 __ LDA #$00
498d : 85 0d __ STA P0 
498f : 85 0e __ STA P1 
4991 : 20 a3 2a JSR $2aa3 ; (krnio_setbnk.s0 + 0)
4994 : a5 11 __ LDA P4 ; (cmd + 0)
4996 : 85 0d __ STA P0 
4998 : a5 12 __ LDA P5 ; (cmd + 1)
499a : 85 0e __ STA P1 
499c : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
499f : a9 0f __ LDA #$0f
49a1 : 85 0d __ STA P0 
49a3 : 85 0f __ STA P2 
49a5 : 20 ee 33 JSR $33ee ; (krnio_open@proxy + 0)
49a8 : 09 00 __ ORA #$00
49aa : d0 08 __ BNE $49b4 ; (cmd.s4 + 0)
.s2:
49ac : a9 0f __ LDA #$0f
49ae : 20 c3 ff JSR $ffc3 
49b1 : 4c d7 49 JMP $49d7 ; (cmd.s1002 + 0)
.s4:
49b4 : a9 00 __ LDA #$00
49b6 : 8d 00 54 STA $5400 ; (DOSstatus + 0)
49b9 : a9 00 __ LDA #$00
49bb : 85 0e __ STA P1 
49bd : a9 54 __ LDA #$54
49bf : 85 0f __ STA P2 
49c1 : 20 f8 49 JSR $49f8 ; (krnio_read.s0 + 0)
49c4 : a5 1b __ LDA ACCU + 0 
49c6 : 85 45 __ STA T0 + 0 
49c8 : a5 1c __ LDA ACCU + 1 
49ca : 85 46 __ STA T0 + 1 
49cc : a9 0f __ LDA #$0f
49ce : 20 c3 ff JSR $ffc3 
49d1 : a5 45 __ LDA T0 + 0 
49d3 : 05 46 __ ORA T0 + 1 
49d5 : d0 06 __ BNE $49dd ; (cmd.s18 + 0)
.s1002:
49d7 : 20 b7 ff JSR $ffb7 
49da : 4c f1 49 JMP $49f1 ; (cmd.s1001 + 0)
.s18:
49dd : ad 00 54 LDA $5400 ; (DOSstatus + 0)
49e0 : 0a __ __ ASL
49e1 : 0a __ __ ASL
49e2 : 18 __ __ CLC
49e3 : 6d 00 54 ADC $5400 ; (DOSstatus + 0)
49e6 : 0a __ __ ASL
49e7 : 38 __ __ SEC
49e8 : e9 e0 __ SBC #$e0
49ea : 18 __ __ CLC
49eb : 6d 01 54 ADC $5401 ; (DOSstatus + 1)
49ee : 38 __ __ SEC
49ef : e9 30 __ SBC #$30
.s1001:
49f1 : 85 1b __ STA ACCU + 0 
49f3 : a9 00 __ LDA #$00
49f5 : 85 1c __ STA ACCU + 1 
49f7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
.s0:
49f8 : ad ee 50 LDA $50ee ; (krnio_pstatus + 15)
49fb : c9 40 __ CMP #$40
49fd : d0 04 __ BNE $4a03 ; (krnio_read.s3 + 0)
.s1:
49ff : a9 00 __ LDA #$00
4a01 : f0 0b __ BEQ $4a0e ; (krnio_read.s1008 + 0)
.s3:
4a03 : a9 0f __ LDA #$0f
4a05 : 20 36 3d JSR $3d36 ; (krnio_chkin.s1000 + 0)
4a08 : 09 00 __ ORA #$00
4a0a : d0 07 __ BNE $4a13 ; (krnio_read.s5 + 0)
.s6:
4a0c : a9 ff __ LDA #$ff
.s1008:
4a0e : 85 1b __ STA ACCU + 0 
.s1001:
4a10 : 85 1c __ STA ACCU + 1 
4a12 : 60 __ __ RTS
.s5:
4a13 : a9 00 __ LDA #$00
4a15 : 85 43 __ STA T1 + 0 
.l9:
4a17 : 20 4a 3d JSR $3d4a ; (krnio_chrin.s0 + 0)
4a1a : a5 1b __ LDA ACCU + 0 
4a1c : 85 44 __ STA T2 + 0 
4a1e : 20 b7 ff JSR $ffb7 
4a21 : 8d ee 50 STA $50ee ; (krnio_pstatus + 15)
4a24 : aa __ __ TAX
4a25 : f0 04 __ BEQ $4a2b ; (krnio_read.s13 + 0)
.s14:
4a27 : c9 40 __ CMP #$40
4a29 : d0 11 __ BNE $4a3c ; (krnio_read.s10 + 0)
.s13:
4a2b : a5 44 __ LDA T2 + 0 
4a2d : a4 43 __ LDY T1 + 0 
4a2f : 91 0e __ STA (P1),y ; (data + 0)
4a31 : e6 43 __ INC T1 + 0 
4a33 : 8a __ __ TXA
4a34 : d0 06 __ BNE $4a3c ; (krnio_read.s10 + 0)
.s8:
4a36 : a5 43 __ LDA T1 + 0 
4a38 : c9 28 __ CMP #$28
4a3a : 90 db __ BCC $4a17 ; (krnio_read.l9 + 0)
.s10:
4a3c : 20 cc ff JSR $ffcc 
4a3f : a5 43 __ LDA T1 + 0 
4a41 : 85 1b __ STA ACCU + 0 
4a43 : a9 00 __ LDA #$00
4a45 : f0 c9 __ BEQ $4a10 ; (krnio_read.s1001 + 0)
--------------------------------------------------------------------
4a47 : __ __ __ BYT 6f 55 54 50 55 54 20 46 49 4c 45 20 45 58 49 53 : oUTPUT FILE EXIS
4a57 : __ __ __ BYT 54 53 2e 20 61 52 45 20 59 4f 55 20 53 55 52 45 : TS. aRE YOU SURE
4a67 : __ __ __ BYT 3f 20 79 2f 6e 20 00                            : ? y/n .
--------------------------------------------------------------------
4a6e : __ __ __ BYT 53 3a 25 53 00                                  : S:%S.
--------------------------------------------------------------------
error_message: ; error_message()->void
.s1000:
4a73 : 38 __ __ SEC
4a74 : a5 23 __ LDA SP + 0 
4a76 : e9 08 __ SBC #$08
4a78 : 85 23 __ STA SP + 0 
4a7a : b0 02 __ BCS $4a7e ; (error_message.s0 + 0)
4a7c : c6 24 __ DEC SP + 1 
.s0:
4a7e : 20 c6 4a JSR $4ac6 ; (vdc_exit.s0 + 0)
4a81 : a9 04 __ LDA #$04
4a83 : 8d 06 d5 STA $d506 
4a86 : a9 d1 __ LDA #$d1
4a88 : a0 02 __ LDY #$02
4a8a : 91 23 __ STA (SP + 0),y 
4a8c : a9 4a __ LDA #$4a
4a8e : c8 __ __ INY
4a8f : 91 23 __ STA (SP + 0),y 
4a91 : 20 da 22 JSR $22da ; (printf.s0 + 0)
4a94 : a9 80 __ LDA #$80
4a96 : a0 02 __ LDY #$02
4a98 : 91 23 __ STA (SP + 0),y 
4a9a : a9 52 __ LDA #$52
4a9c : c8 __ __ INY
4a9d : 91 23 __ STA (SP + 0),y 
4a9f : a9 df __ LDA #$df
4aa1 : c8 __ __ INY
4aa2 : 91 23 __ STA (SP + 0),y 
4aa4 : a9 4a __ LDA #$4a
4aa6 : c8 __ __ INY
4aa7 : 91 23 __ STA (SP + 0),y 
4aa9 : ad e0 50 LDA $50e0 ; (krnio_pstatus + 1)
4aac : c8 __ __ INY
4aad : 91 23 __ STA (SP + 0),y 
4aaf : a9 00 __ LDA #$00
4ab1 : c8 __ __ INY
4ab2 : 91 23 __ STA (SP + 0),y 
4ab4 : 20 da 22 JSR $22da ; (printf.s0 + 0)
4ab7 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s1001:
4aba : 18 __ __ CLC
4abb : a5 23 __ LDA SP + 0 
4abd : 69 08 __ ADC #$08
4abf : 85 23 __ STA SP + 0 
4ac1 : 90 02 __ BCC $4ac5 ; (error_message.s1001 + 11)
4ac3 : e6 24 __ INC SP + 1 
4ac5 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_exit: ; vdc_exit()->void
.s0:
4ac6 : a9 00 __ LDA #$00
4ac8 : 20 dd 2d JSR $2ddd ; (fastmode.s0 + 0)
4acb : 20 fc 2d JSR $2dfc ; (vdc_set_mode@proxy + 0)
4ace : 4c 67 2c JMP $2c67 ; (vdc_cls.s0 + 0)
--------------------------------------------------------------------
4ad1 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 0a 0d 00       : fILE ERROR!...
--------------------------------------------------------------------
4adf : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 0a 0d : eRROR NR.: %2x..
4aef : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4af0 : __ __ __ BYT 70 52 4f 4a 45 43 54 20 54 4f 20 42 49 47 2e 00 : pROJECT TO BIG..
--------------------------------------------------------------------
4b00 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 50 52 4f 4a 45 43 54 20 : lOADING PROJECT 
4b10 : __ __ __ BYT 4d 45 54 41 20 44 41 54 41 2e 00                : META DATA..
--------------------------------------------------------------------
too_big: ; too_big()->void
.s1000:
4b1b : 38 __ __ SEC
4b1c : a5 23 __ LDA SP + 0 
4b1e : e9 06 __ SBC #$06
4b20 : 85 23 __ STA SP + 0 
4b22 : b0 02 __ BCS $4b26 ; (too_big.s0 + 0)
4b24 : c6 24 __ DEC SP + 1 
.s0:
4b26 : a9 f1 __ LDA #$f1
4b28 : a0 02 __ LDY #$02
4b2a : 91 23 __ STA (SP + 0),y 
4b2c : a9 51 __ LDA #$51
4b2e : c8 __ __ INY
4b2f : 91 23 __ STA (SP + 0),y 
4b31 : a9 f0 __ LDA #$f0
4b33 : c8 __ __ INY
4b34 : 91 23 __ STA (SP + 0),y 
4b36 : a9 4a __ LDA #$4a
4b38 : c8 __ __ INY
4b39 : 91 23 __ STA (SP + 0),y 
4b3b : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
4b3e : a9 f1 __ LDA #$f1
4b40 : a0 02 __ LDY #$02
4b42 : 91 23 __ STA (SP + 0),y 
4b44 : a9 51 __ LDA #$51
4b46 : c8 __ __ INY
4b47 : 91 23 __ STA (SP + 0),y 
4b49 : a9 70 __ LDA #$70
4b4b : c8 __ __ INY
4b4c : 91 23 __ STA (SP + 0),y 
4b4e : a9 4b __ LDA #$4b
4b50 : c8 __ __ INY
4b51 : 91 23 __ STA (SP + 0),y 
4b53 : 20 85 40 JSR $4085 ; (vdcwin_printline.s1000 + 0)
4b56 : 20 e7 46 JSR $46e7 ; (vdcwin_getch.s0 + 0)
4b59 : 20 c6 4a JSR $4ac6 ; (vdc_exit.s0 + 0)
4b5c : a9 04 __ LDA #$04
4b5e : 8d 06 d5 STA $d506 
4b61 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s1001:
4b64 : 18 __ __ CLC
4b65 : a5 23 __ LDA SP + 0 
4b67 : 69 06 __ ADC #$06
4b69 : 85 23 __ STA SP + 0 
4b6b : 90 02 __ BCC $4b6f ; (too_big.s1001 + 11)
4b6d : e6 24 __ INC SP + 1 
4b6f : 60 __ __ RTS
--------------------------------------------------------------------
4b70 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
4b80 : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
4b83 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 56 49 45 55 57 45 52 20 : lOADING VIEUWER 
4b93 : __ __ __ BYT 43 4f 44 45 20 54 4f 20 41 44 44 52 45 53 53 20 : CODE TO ADDRESS 
4ba3 : __ __ __ BYT 25 34 58 2e 00                                  : %4X..
--------------------------------------------------------------------
4ba8 : __ __ __ BYT 56 44 43 53 45 32 50 52 47 56 57 43 00          : VDCSE2PRGVWC.
--------------------------------------------------------------------
4bb5 : __ __ __ BYT 63 4f 50 59 20 56 49 45 55 57 45 52 20 44 41 54 : cOPY VIEUWER DAT
4bc5 : __ __ __ BYT 41 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 : A TO ADDRESS %4X
4bd5 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
4bd7 : __ __ __ BYT 6c 4f 41 44 20 53 43 52 45 45 4e 20 44 41 54 41 : lOAD SCREEN DATA
4be7 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4bf7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4bf8 : __ __ __ BYT 25 53 2e 53 43 52 4e 00                         : %S.SCRN.
--------------------------------------------------------------------
4c00 : __ __ __ BYT 6c 4f 41 44 20 53 54 44 20 43 48 41 52 53 45 54 : lOAD STD CHARSET
4c10 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c20 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c21 : __ __ __ BYT 25 53 2e 43 48 52 53 00                         : %S.CHRS.
--------------------------------------------------------------------
4c29 : __ __ __ BYT 6c 4f 41 44 20 41 4c 54 20 43 48 41 52 53 45 54 : lOAD ALT CHARSET
4c39 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c49 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c4a : __ __ __ BYT 25 53 2e 43 48 52 41 00                         : %S.CHRA.
--------------------------------------------------------------------
4c52 : __ __ __ BYT 73 41 56 49 4e 47 20 25 34 58 20 42 59 54 45 53 : sAVING %4X BYTES
4c62 : __ __ __ BYT 20 54 4f 20 25 53 2e 00                         :  TO %S..
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
4c6a : a9 00 __ LDA #$00
4c6c : a6 0d __ LDX P0 
4c6e : a0 00 __ LDY #$00
4c70 : 20 ba ff JSR $ffba 
4c73 : a9 0e __ LDA #$0e
4c75 : a6 10 __ LDX P3 
4c77 : a4 11 __ LDY P4 
4c79 : 20 d8 ff JSR $ffd8 
4c7c : a9 00 __ LDA #$00
4c7e : b0 02 __ BCS $4c82 ; (krnio_save.s0 + 24)
4c80 : a9 01 __ LDA #$01
4c82 : 85 1b __ STA ACCU + 0 
.s1001:
4c84 : a5 1b __ LDA ACCU + 0 
4c86 : 60 __ __ RTS
--------------------------------------------------------------------
4c87 : __ __ __ BYT 66 49 4e 49 53 48 45 44 21 20 70 52 45 53 53 20 : fINISHED! pRESS 
4c97 : __ __ __ BYT 4b 45 59 20 54 4f 20 45 58 49 54 2e 00          : KEY TO EXIT..
--------------------------------------------------------------------
mul16: ; mul16
4ca4 : a0 00 __ LDY #$00
4ca6 : 84 06 __ STY WORK + 3 
4ca8 : a5 03 __ LDA WORK + 0 
4caa : a6 04 __ LDX WORK + 1 
4cac : f0 1c __ BEQ $4cca ; (mul16 + 38)
4cae : 38 __ __ SEC
4caf : 6a __ __ ROR
4cb0 : 90 0d __ BCC $4cbf ; (mul16 + 27)
4cb2 : aa __ __ TAX
4cb3 : 18 __ __ CLC
4cb4 : 98 __ __ TYA
4cb5 : 65 1b __ ADC ACCU + 0 
4cb7 : a8 __ __ TAY
4cb8 : a5 06 __ LDA WORK + 3 
4cba : 65 1c __ ADC ACCU + 1 
4cbc : 85 06 __ STA WORK + 3 
4cbe : 8a __ __ TXA
4cbf : 06 1b __ ASL ACCU + 0 
4cc1 : 26 1c __ ROL ACCU + 1 
4cc3 : 4a __ __ LSR
4cc4 : 90 f9 __ BCC $4cbf ; (mul16 + 27)
4cc6 : d0 ea __ BNE $4cb2 ; (mul16 + 14)
4cc8 : a5 04 __ LDA WORK + 1 
4cca : 4a __ __ LSR
4ccb : 90 0d __ BCC $4cda ; (mul16 + 54)
4ccd : aa __ __ TAX
4cce : 18 __ __ CLC
4ccf : 98 __ __ TYA
4cd0 : 65 1b __ ADC ACCU + 0 
4cd2 : a8 __ __ TAY
4cd3 : a5 06 __ LDA WORK + 3 
4cd5 : 65 1c __ ADC ACCU + 1 
4cd7 : 85 06 __ STA WORK + 3 
4cd9 : 8a __ __ TXA
4cda : 06 1b __ ASL ACCU + 0 
4cdc : 26 1c __ ROL ACCU + 1 
4cde : 4a __ __ LSR
4cdf : b0 ec __ BCS $4ccd ; (mul16 + 41)
4ce1 : d0 f7 __ BNE $4cda ; (mul16 + 54)
4ce3 : 84 05 __ STY WORK + 2 
4ce5 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4ce6 : a5 1c __ LDA ACCU + 1 
4ce8 : d0 31 __ BNE $4d1b ; (divmod + 53)
4cea : a5 04 __ LDA WORK + 1 
4cec : d0 1e __ BNE $4d0c ; (divmod + 38)
4cee : 85 06 __ STA WORK + 3 
4cf0 : a2 04 __ LDX #$04
4cf2 : 06 1b __ ASL ACCU + 0 
4cf4 : 2a __ __ ROL
4cf5 : c5 03 __ CMP WORK + 0 
4cf7 : 90 02 __ BCC $4cfb ; (divmod + 21)
4cf9 : e5 03 __ SBC WORK + 0 
4cfb : 26 1b __ ROL ACCU + 0 
4cfd : 2a __ __ ROL
4cfe : c5 03 __ CMP WORK + 0 
4d00 : 90 02 __ BCC $4d04 ; (divmod + 30)
4d02 : e5 03 __ SBC WORK + 0 
4d04 : 26 1b __ ROL ACCU + 0 
4d06 : ca __ __ DEX
4d07 : d0 eb __ BNE $4cf4 ; (divmod + 14)
4d09 : 85 05 __ STA WORK + 2 
4d0b : 60 __ __ RTS
4d0c : a5 1b __ LDA ACCU + 0 
4d0e : 85 05 __ STA WORK + 2 
4d10 : a5 1c __ LDA ACCU + 1 
4d12 : 85 06 __ STA WORK + 3 
4d14 : a9 00 __ LDA #$00
4d16 : 85 1b __ STA ACCU + 0 
4d18 : 85 1c __ STA ACCU + 1 
4d1a : 60 __ __ RTS
4d1b : a5 04 __ LDA WORK + 1 
4d1d : d0 1f __ BNE $4d3e ; (divmod + 88)
4d1f : a5 03 __ LDA WORK + 0 
4d21 : 30 1b __ BMI $4d3e ; (divmod + 88)
4d23 : a9 00 __ LDA #$00
4d25 : 85 06 __ STA WORK + 3 
4d27 : a2 10 __ LDX #$10
4d29 : 06 1b __ ASL ACCU + 0 
4d2b : 26 1c __ ROL ACCU + 1 
4d2d : 2a __ __ ROL
4d2e : c5 03 __ CMP WORK + 0 
4d30 : 90 02 __ BCC $4d34 ; (divmod + 78)
4d32 : e5 03 __ SBC WORK + 0 
4d34 : 26 1b __ ROL ACCU + 0 
4d36 : 26 1c __ ROL ACCU + 1 
4d38 : ca __ __ DEX
4d39 : d0 f2 __ BNE $4d2d ; (divmod + 71)
4d3b : 85 05 __ STA WORK + 2 
4d3d : 60 __ __ RTS
4d3e : a9 00 __ LDA #$00
4d40 : 85 05 __ STA WORK + 2 
4d42 : 85 06 __ STA WORK + 3 
4d44 : 84 02 __ STY $02 
4d46 : a0 10 __ LDY #$10
4d48 : 18 __ __ CLC
4d49 : 26 1b __ ROL ACCU + 0 
4d4b : 26 1c __ ROL ACCU + 1 
4d4d : 26 05 __ ROL WORK + 2 
4d4f : 26 06 __ ROL WORK + 3 
4d51 : 38 __ __ SEC
4d52 : a5 05 __ LDA WORK + 2 
4d54 : e5 03 __ SBC WORK + 0 
4d56 : aa __ __ TAX
4d57 : a5 06 __ LDA WORK + 3 
4d59 : e5 04 __ SBC WORK + 1 
4d5b : 90 04 __ BCC $4d61 ; (divmod + 123)
4d5d : 86 05 __ STX WORK + 2 
4d5f : 85 06 __ STA WORK + 3 
4d61 : 88 __ __ DEY
4d62 : d0 e5 __ BNE $4d49 ; (divmod + 99)
4d64 : 26 1b __ ROL ACCU + 0 
4d66 : 26 1c __ ROL ACCU + 1 
4d68 : a4 02 __ LDY $02 
4d6a : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
4d6b : 84 02 __ STY $02 
4d6d : a0 20 __ LDY #$20
4d6f : a9 00 __ LDA #$00
4d71 : 85 07 __ STA WORK + 4 
4d73 : 85 08 __ STA WORK + 5 
4d75 : 85 09 __ STA WORK + 6 
4d77 : 85 0a __ STA WORK + 7 
4d79 : a5 05 __ LDA WORK + 2 
4d7b : 05 06 __ ORA WORK + 3 
4d7d : d0 78 __ BNE $4df7 ; (divmod32 + 140)
4d7f : a5 04 __ LDA WORK + 1 
4d81 : d0 27 __ BNE $4daa ; (divmod32 + 63)
4d83 : 18 __ __ CLC
4d84 : 26 1b __ ROL ACCU + 0 
4d86 : 26 1c __ ROL ACCU + 1 
4d88 : 26 1d __ ROL ACCU + 2 
4d8a : 26 1e __ ROL ACCU + 3 
4d8c : 2a __ __ ROL
4d8d : 90 05 __ BCC $4d94 ; (divmod32 + 41)
4d8f : e5 03 __ SBC WORK + 0 
4d91 : 38 __ __ SEC
4d92 : b0 06 __ BCS $4d9a ; (divmod32 + 47)
4d94 : c5 03 __ CMP WORK + 0 
4d96 : 90 02 __ BCC $4d9a ; (divmod32 + 47)
4d98 : e5 03 __ SBC WORK + 0 
4d9a : 88 __ __ DEY
4d9b : d0 e7 __ BNE $4d84 ; (divmod32 + 25)
4d9d : 85 07 __ STA WORK + 4 
4d9f : 26 1b __ ROL ACCU + 0 
4da1 : 26 1c __ ROL ACCU + 1 
4da3 : 26 1d __ ROL ACCU + 2 
4da5 : 26 1e __ ROL ACCU + 3 
4da7 : a4 02 __ LDY $02 
4da9 : 60 __ __ RTS
4daa : a5 1e __ LDA ACCU + 3 
4dac : d0 10 __ BNE $4dbe ; (divmod32 + 83)
4dae : a6 1d __ LDX ACCU + 2 
4db0 : 86 1e __ STX ACCU + 3 
4db2 : a6 1c __ LDX ACCU + 1 
4db4 : 86 1d __ STX ACCU + 2 
4db6 : a6 1b __ LDX ACCU + 0 
4db8 : 86 1c __ STX ACCU + 1 
4dba : 85 1b __ STA ACCU + 0 
4dbc : a0 18 __ LDY #$18
4dbe : 18 __ __ CLC
4dbf : 26 1b __ ROL ACCU + 0 
4dc1 : 26 1c __ ROL ACCU + 1 
4dc3 : 26 1d __ ROL ACCU + 2 
4dc5 : 26 1e __ ROL ACCU + 3 
4dc7 : 26 07 __ ROL WORK + 4 
4dc9 : 26 08 __ ROL WORK + 5 
4dcb : 90 0c __ BCC $4dd9 ; (divmod32 + 110)
4dcd : a5 07 __ LDA WORK + 4 
4dcf : e5 03 __ SBC WORK + 0 
4dd1 : aa __ __ TAX
4dd2 : a5 08 __ LDA WORK + 5 
4dd4 : e5 04 __ SBC WORK + 1 
4dd6 : 38 __ __ SEC
4dd7 : b0 0c __ BCS $4de5 ; (divmod32 + 122)
4dd9 : 38 __ __ SEC
4dda : a5 07 __ LDA WORK + 4 
4ddc : e5 03 __ SBC WORK + 0 
4dde : aa __ __ TAX
4ddf : a5 08 __ LDA WORK + 5 
4de1 : e5 04 __ SBC WORK + 1 
4de3 : 90 04 __ BCC $4de9 ; (divmod32 + 126)
4de5 : 86 07 __ STX WORK + 4 
4de7 : 85 08 __ STA WORK + 5 
4de9 : 88 __ __ DEY
4dea : d0 d3 __ BNE $4dbf ; (divmod32 + 84)
4dec : 26 1b __ ROL ACCU + 0 
4dee : 26 1c __ ROL ACCU + 1 
4df0 : 26 1d __ ROL ACCU + 2 
4df2 : 26 1e __ ROL ACCU + 3 
4df4 : a4 02 __ LDY $02 
4df6 : 60 __ __ RTS
4df7 : a0 10 __ LDY #$10
4df9 : a5 1e __ LDA ACCU + 3 
4dfb : 85 08 __ STA WORK + 5 
4dfd : a5 1d __ LDA ACCU + 2 
4dff : 85 07 __ STA WORK + 4 
4e01 : a9 00 __ LDA #$00
4e03 : 85 1d __ STA ACCU + 2 
4e05 : 85 1e __ STA ACCU + 3 
4e07 : 18 __ __ CLC
4e08 : 26 1b __ ROL ACCU + 0 
4e0a : 26 1c __ ROL ACCU + 1 
4e0c : 26 07 __ ROL WORK + 4 
4e0e : 26 08 __ ROL WORK + 5 
4e10 : 26 09 __ ROL WORK + 6 
4e12 : 26 0a __ ROL WORK + 7 
4e14 : a5 07 __ LDA WORK + 4 
4e16 : c5 03 __ CMP WORK + 0 
4e18 : a5 08 __ LDA WORK + 5 
4e1a : e5 04 __ SBC WORK + 1 
4e1c : a5 09 __ LDA WORK + 6 
4e1e : e5 05 __ SBC WORK + 2 
4e20 : a5 0a __ LDA WORK + 7 
4e22 : e5 06 __ SBC WORK + 3 
4e24 : 90 18 __ BCC $4e3e ; (divmod32 + 211)
4e26 : a5 07 __ LDA WORK + 4 
4e28 : e5 03 __ SBC WORK + 0 
4e2a : 85 07 __ STA WORK + 4 
4e2c : a5 08 __ LDA WORK + 5 
4e2e : e5 04 __ SBC WORK + 1 
4e30 : 85 08 __ STA WORK + 5 
4e32 : a5 09 __ LDA WORK + 6 
4e34 : e5 05 __ SBC WORK + 2 
4e36 : 85 09 __ STA WORK + 6 
4e38 : a5 0a __ LDA WORK + 7 
4e3a : e5 06 __ SBC WORK + 3 
4e3c : 85 0a __ STA WORK + 7 
4e3e : 88 __ __ DEY
4e3f : d0 c7 __ BNE $4e08 ; (divmod32 + 157)
4e41 : 26 1b __ ROL ACCU + 0 
4e43 : 26 1c __ ROL ACCU + 1 
4e45 : a4 02 __ LDY $02 
4e47 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
4e48 : 18 __ __ CLC
4e49 : a5 1b __ LDA ACCU + 0 
4e4b : 69 06 __ ADC #$06
4e4d : 85 03 __ STA WORK + 0 
4e4f : a5 1c __ LDA ACCU + 1 
4e51 : 69 00 __ ADC #$00
4e53 : 85 04 __ STA WORK + 1 
4e55 : ad f8 52 LDA $52f8 ; (HeapNode + 2)
4e58 : d0 1f __ BNE $4e79 ; (malloc + 49)
4e5a : a9 00 __ LDA #$00
4e5c : 8d 80 54 STA $5480 
4e5f : 8d 81 54 STA $5481 
4e62 : ee f8 52 INC $52f8 ; (HeapNode + 2)
4e65 : a9 80 __ LDA #$80
4e67 : 8d f6 52 STA $52f6 ; (HeapNode + 0)
4e6a : a9 54 __ LDA #$54
4e6c : 8d f7 52 STA $52f7 ; (HeapNode + 1)
4e6f : a9 00 __ LDA #$00
4e71 : 8d 82 54 STA $5482 
4e74 : a9 b0 __ LDA #$b0
4e76 : 8d 83 54 STA $5483 
4e79 : a9 f6 __ LDA #$f6
4e7b : a2 52 __ LDX #$52
4e7d : 85 1d __ STA ACCU + 2 
4e7f : 86 1e __ STX ACCU + 3 
4e81 : 18 __ __ CLC
4e82 : a0 00 __ LDY #$00
4e84 : b1 1d __ LDA (ACCU + 2),y 
4e86 : 85 1b __ STA ACCU + 0 
4e88 : 65 03 __ ADC WORK + 0 
4e8a : 85 05 __ STA WORK + 2 
4e8c : c8 __ __ INY
4e8d : b1 1d __ LDA (ACCU + 2),y 
4e8f : 85 1c __ STA ACCU + 1 
4e91 : f0 18 __ BEQ $4eab ; (malloc + 99)
4e93 : 65 04 __ ADC WORK + 1 
4e95 : 85 06 __ STA WORK + 3 
4e97 : a0 02 __ LDY #$02
4e99 : b1 1b __ LDA (ACCU + 0),y 
4e9b : c5 05 __ CMP WORK + 2 
4e9d : c8 __ __ INY
4e9e : b1 1b __ LDA (ACCU + 0),y 
4ea0 : e5 06 __ SBC WORK + 3 
4ea2 : b0 09 __ BCS $4ead ; (malloc + 101)
4ea4 : a5 1b __ LDA ACCU + 0 
4ea6 : a6 1c __ LDX ACCU + 1 
4ea8 : 4c 7d 4e JMP $4e7d ; (malloc + 53)
4eab : 02 __ __ INV
4eac : 60 __ __ RTS
4ead : 18 __ __ CLC
4eae : a5 05 __ LDA WORK + 2 
4eb0 : 69 07 __ ADC #$07
4eb2 : 29 f8 __ AND #$f8
4eb4 : 85 07 __ STA WORK + 4 
4eb6 : a5 06 __ LDA WORK + 3 
4eb8 : 69 00 __ ADC #$00
4eba : 85 08 __ STA WORK + 5 
4ebc : a0 02 __ LDY #$02
4ebe : a5 07 __ LDA WORK + 4 
4ec0 : d1 1b __ CMP (ACCU + 0),y 
4ec2 : d0 15 __ BNE $4ed9 ; (malloc + 145)
4ec4 : c8 __ __ INY
4ec5 : a5 08 __ LDA WORK + 5 
4ec7 : d1 1b __ CMP (ACCU + 0),y 
4ec9 : d0 0e __ BNE $4ed9 ; (malloc + 145)
4ecb : a0 00 __ LDY #$00
4ecd : b1 1b __ LDA (ACCU + 0),y 
4ecf : 91 1d __ STA (ACCU + 2),y 
4ed1 : c8 __ __ INY
4ed2 : b1 1b __ LDA (ACCU + 0),y 
4ed4 : 91 1d __ STA (ACCU + 2),y 
4ed6 : 4c f6 4e JMP $4ef6 ; (malloc + 174)
4ed9 : a0 00 __ LDY #$00
4edb : b1 1b __ LDA (ACCU + 0),y 
4edd : 91 07 __ STA (WORK + 4),y 
4edf : a5 07 __ LDA WORK + 4 
4ee1 : 91 1d __ STA (ACCU + 2),y 
4ee3 : c8 __ __ INY
4ee4 : b1 1b __ LDA (ACCU + 0),y 
4ee6 : 91 07 __ STA (WORK + 4),y 
4ee8 : a5 08 __ LDA WORK + 5 
4eea : 91 1d __ STA (ACCU + 2),y 
4eec : c8 __ __ INY
4eed : b1 1b __ LDA (ACCU + 0),y 
4eef : 91 07 __ STA (WORK + 4),y 
4ef1 : c8 __ __ INY
4ef2 : b1 1b __ LDA (ACCU + 0),y 
4ef4 : 91 07 __ STA (WORK + 4),y 
4ef6 : a0 00 __ LDY #$00
4ef8 : a5 05 __ LDA WORK + 2 
4efa : 91 1b __ STA (ACCU + 0),y 
4efc : c8 __ __ INY
4efd : a5 06 __ LDA WORK + 3 
4eff : 91 1b __ STA (ACCU + 0),y 
4f01 : a0 02 __ LDY #$02
4f03 : a9 bd __ LDA #$bd
4f05 : 91 1b __ STA (ACCU + 0),y 
4f07 : c8 __ __ INY
4f08 : 91 1b __ STA (ACCU + 0),y 
4f0a : 38 __ __ SEC
4f0b : a5 05 __ LDA WORK + 2 
4f0d : e9 02 __ SBC #$02
4f0f : 85 05 __ STA WORK + 2 
4f11 : b0 02 __ BCS $4f15 ; (malloc + 205)
4f13 : c6 06 __ DEC WORK + 3 
4f15 : a9 be __ LDA #$be
4f17 : a0 00 __ LDY #$00
4f19 : 91 05 __ STA (WORK + 2),y 
4f1b : c8 __ __ INY
4f1c : 91 05 __ STA (WORK + 2),y 
4f1e : a5 1b __ LDA ACCU + 0 
4f20 : 09 04 __ ORA #$04
4f22 : 85 1b __ STA ACCU + 0 
4f24 : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
4f25 : a5 1b __ LDA ACCU + 0 
4f27 : 05 1c __ ORA ACCU + 1 
4f29 : d0 01 __ BNE $4f2c ; (free + 7)
4f2b : 60 __ __ RTS
4f2c : a5 1b __ LDA ACCU + 0 
4f2e : 29 07 __ AND #$07
4f30 : c9 04 __ CMP #$04
4f32 : d0 49 __ BNE $4f7d ; (free + 88)
4f34 : a5 1b __ LDA ACCU + 0 
4f36 : 29 f8 __ AND #$f8
4f38 : 85 1b __ STA ACCU + 0 
4f3a : a0 02 __ LDY #$02
4f3c : b1 1b __ LDA (ACCU + 0),y 
4f3e : c9 bd __ CMP #$bd
4f40 : d0 3b __ BNE $4f7d ; (free + 88)
4f42 : c8 __ __ INY
4f43 : b1 1b __ LDA (ACCU + 0),y 
4f45 : c9 bd __ CMP #$bd
4f47 : d0 34 __ BNE $4f7d ; (free + 88)
4f49 : a0 00 __ LDY #$00
4f4b : 38 __ __ SEC
4f4c : b1 1b __ LDA (ACCU + 0),y 
4f4e : e9 02 __ SBC #$02
4f50 : 85 03 __ STA WORK + 0 
4f52 : c8 __ __ INY
4f53 : b1 1b __ LDA (ACCU + 0),y 
4f55 : e9 00 __ SBC #$00
4f57 : 85 04 __ STA WORK + 1 
4f59 : a0 00 __ LDY #$00
4f5b : b1 03 __ LDA (WORK + 0),y 
4f5d : c9 be __ CMP #$be
4f5f : d0 1c __ BNE $4f7d ; (free + 88)
4f61 : c8 __ __ INY
4f62 : b1 03 __ LDA (WORK + 0),y 
4f64 : c9 be __ CMP #$be
4f66 : d0 15 __ BNE $4f7d ; (free + 88)
4f68 : a5 1b __ LDA ACCU + 0 
4f6a : 05 1c __ ORA ACCU + 1 
4f6c : d0 01 __ BNE $4f6f ; (free + 74)
4f6e : 60 __ __ RTS
4f6f : a5 1c __ LDA ACCU + 1 
4f71 : a6 1b __ LDX ACCU + 0 
4f73 : c9 54 __ CMP #$54
4f75 : 90 06 __ BCC $4f7d ; (free + 88)
4f77 : d0 05 __ BNE $4f7e ; (free + 89)
4f79 : e0 80 __ CPX #$80
4f7b : b0 01 __ BCS $4f7e ; (free + 89)
4f7d : 02 __ __ INV
4f7e : c9 b0 __ CMP #$b0
4f80 : 90 06 __ BCC $4f88 ; (free + 99)
4f82 : d0 f9 __ BNE $4f7d ; (free + 88)
4f84 : e0 00 __ CPX #$00
4f86 : b0 f5 __ BCS $4f7d ; (free + 88)
4f88 : a0 02 __ LDY #$02
4f8a : a9 bf __ LDA #$bf
4f8c : 91 1b __ STA (ACCU + 0),y 
4f8e : c8 __ __ INY
4f8f : 91 1b __ STA (ACCU + 0),y 
4f91 : 18 __ __ CLC
4f92 : a0 00 __ LDY #$00
4f94 : b1 1b __ LDA (ACCU + 0),y 
4f96 : 69 07 __ ADC #$07
4f98 : 29 f8 __ AND #$f8
4f9a : 85 1d __ STA ACCU + 2 
4f9c : c8 __ __ INY
4f9d : b1 1b __ LDA (ACCU + 0),y 
4f9f : 69 00 __ ADC #$00
4fa1 : 85 1e __ STA ACCU + 3 
4fa3 : a9 f6 __ LDA #$f6
4fa5 : a2 52 __ LDX #$52
4fa7 : 85 05 __ STA WORK + 2 
4fa9 : 86 06 __ STX WORK + 3 
4fab : a0 01 __ LDY #$01
4fad : b1 05 __ LDA (WORK + 2),y 
4faf : f0 28 __ BEQ $4fd9 ; (free + 180)
4fb1 : aa __ __ TAX
4fb2 : 88 __ __ DEY
4fb3 : b1 05 __ LDA (WORK + 2),y 
4fb5 : e4 1e __ CPX ACCU + 3 
4fb7 : 90 ee __ BCC $4fa7 ; (free + 130)
4fb9 : d0 1e __ BNE $4fd9 ; (free + 180)
4fbb : c5 1d __ CMP ACCU + 2 
4fbd : 90 e8 __ BCC $4fa7 ; (free + 130)
4fbf : d0 18 __ BNE $4fd9 ; (free + 180)
4fc1 : a0 00 __ LDY #$00
4fc3 : b1 1d __ LDA (ACCU + 2),y 
4fc5 : 91 1b __ STA (ACCU + 0),y 
4fc7 : c8 __ __ INY
4fc8 : b1 1d __ LDA (ACCU + 2),y 
4fca : 91 1b __ STA (ACCU + 0),y 
4fcc : c8 __ __ INY
4fcd : b1 1d __ LDA (ACCU + 2),y 
4fcf : 91 1b __ STA (ACCU + 0),y 
4fd1 : c8 __ __ INY
4fd2 : b1 1d __ LDA (ACCU + 2),y 
4fd4 : 91 1b __ STA (ACCU + 0),y 
4fd6 : 4c ee 4f JMP $4fee ; (free + 201)
4fd9 : a0 00 __ LDY #$00
4fdb : b1 05 __ LDA (WORK + 2),y 
4fdd : 91 1b __ STA (ACCU + 0),y 
4fdf : c8 __ __ INY
4fe0 : b1 05 __ LDA (WORK + 2),y 
4fe2 : 91 1b __ STA (ACCU + 0),y 
4fe4 : c8 __ __ INY
4fe5 : a5 1d __ LDA ACCU + 2 
4fe7 : 91 1b __ STA (ACCU + 0),y 
4fe9 : c8 __ __ INY
4fea : a5 1e __ LDA ACCU + 3 
4fec : 91 1b __ STA (ACCU + 0),y 
4fee : a0 02 __ LDY #$02
4ff0 : b1 05 __ LDA (WORK + 2),y 
4ff2 : c5 1b __ CMP ACCU + 0 
4ff4 : d0 1d __ BNE $5013 ; (free + 238)
4ff6 : c8 __ __ INY
4ff7 : b1 05 __ LDA (WORK + 2),y 
4ff9 : c5 1c __ CMP ACCU + 1 
4ffb : d0 16 __ BNE $5013 ; (free + 238)
4ffd : a0 00 __ LDY #$00
4fff : b1 1b __ LDA (ACCU + 0),y 
5001 : 91 05 __ STA (WORK + 2),y 
5003 : c8 __ __ INY
5004 : b1 1b __ LDA (ACCU + 0),y 
5006 : 91 05 __ STA (WORK + 2),y 
5008 : c8 __ __ INY
5009 : b1 1b __ LDA (ACCU + 0),y 
500b : 91 05 __ STA (WORK + 2),y 
500d : c8 __ __ INY
500e : b1 1b __ LDA (ACCU + 0),y 
5010 : 91 05 __ STA (WORK + 2),y 
5012 : 60 __ __ RTS
5013 : a0 00 __ LDY #$00
5015 : a5 1b __ LDA ACCU + 0 
5017 : 91 05 __ STA (WORK + 2),y 
5019 : c8 __ __ INY
501a : a5 1c __ LDA ACCU + 1 
501c : 91 05 __ STA (WORK + 2),y 
501e : 60 __ __ RTS
--------------------------------------------------------------------
__multab36L:
501f : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
5025 : a9 0b __ LDA #$0b
5027 : 85 11 __ STA P4 
5029 : a9 05 __ LDA #$05
502b : 85 12 __ STA P5 
502d : a9 80 __ LDA #$80
502f : 85 13 __ STA P6 
5031 : a9 52 __ LDA #$52
5033 : 85 14 __ STA P7 
5035 : 4c f2 31 JMP $31f2 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
5038 : a9 80 __ LDA #$80
503a : 85 13 __ STA P6 
503c : a9 52 __ LDA #$52
503e : 85 14 __ STA P7 
5040 : 4c f2 31 JMP $31f2 ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
5043 : ad 79 50 LDA $5079 ; (mc_menupopup + 0)
5046 : 85 10 __ STA P3 
5048 : 4c b4 32 JMP $32b4 ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
504b : a9 20 __ LDA #$20
504d : 85 11 __ STA P4 
504f : a9 50 __ LDA #$50
5051 : 85 12 __ STA P5 
5053 : 4c 7b 2c JMP $2c7b ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
5056 : a9 0a __ LDA #$0a
5058 : 85 0f __ STA P2 
505a : a9 20 __ LDA #$20
505c : 85 11 __ STA P4 
505e : a9 3c __ LDA #$3c
5060 : 85 12 __ STA P5 
5062 : 4c 7b 2c JMP $2c7b ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
5065 : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 85 89 86 8a 87 8b : ................
5075 : __ __ __ BYT 88 8c 0a 8c                                     : ....
--------------------------------------------------------------------
mc_menupopup:
5079 : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
progressRev:
507a : __ __ __ BYT 00 00 01 01                                     : ....
--------------------------------------------------------------------
p2smap:
507e : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
progressBar:
5086 : __ __ __ BYT a5 a1 a7 20                                     : ... 
--------------------------------------------------------------------
mc_pd_normal:
508a : __ __ __ BYT c6                                              : .
--------------------------------------------------------------------
mc_pd_select:
508b : __ __ __ BYT cd                                              : .
--------------------------------------------------------------------
reg_types:
508c : __ __ __ BYT 2d 46 31 46 35 46 39 46 3d 46                   : -F1F5F9F=F
--------------------------------------------------------------------
oth_types:
5096 : __ __ __ BYT 41 46 45 46 49 46 4d 46 51 46 55 46             : AFEFIFMFQFUF
--------------------------------------------------------------------
value2hex:
50a2 : __ __ __ BYT 59 46                                           : YF
--------------------------------------------------------------------
filedest:
50a4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
50b4 : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
charsetchanged:
50b9 : __ __ __ BSS	2
--------------------------------------------------------------------
filename:
50bb : __ __ __ BSS	21
--------------------------------------------------------------------
view:
50d0 : __ __ __ BSS	14
--------------------------------------------------------------------
bootdevice:
50de : __ __ __ BSS	1
--------------------------------------------------------------------
krnio_pstatus:
50df : __ __ __ BSS	16
--------------------------------------------------------------------
targetdevice:
50ef : __ __ __ BSS	1
--------------------------------------------------------------------
fullscreen:
50f0 : __ __ __ BSS	10
--------------------------------------------------------------------
disk_id_buf:
50fa : __ __ __ BSS	5
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
vdc_state:
51d8 : __ __ __ BSS	25
--------------------------------------------------------------------
interface:
51f1 : __ __ __ BSS	10
--------------------------------------------------------------------
previous:
51fb : __ __ __ BSS	2
--------------------------------------------------------------------
current:
51fd : __ __ __ BSS	2
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
linebuffer:
5280 : __ __ __ BSS	81
--------------------------------------------------------------------
cwd:
52d1 : __ __ __ BSS	33
--------------------------------------------------------------------
bad_type:
52f2 : __ __ __ BSS	4
--------------------------------------------------------------------
HeapNode:
52f6 : __ __ __ BSS	4
--------------------------------------------------------------------
multab:
5300 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer2:
5390 : __ __ __ BSS	81
--------------------------------------------------------------------
DOSstatus:
5400 : __ __ __ BSS	40
--------------------------------------------------------------------
buffer:
5428 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:1300 : ad ef 50 LDA $50ef ; (targetdevice + 0)
01:1303 : 85 0f __ STA P2 
01:1305 : a9 01 __ LDA #$01
01:1307 : 85 10 __ STA P3 
01:1309 : a9 80 __ LDA #$80
01:130b : 85 13 __ STA P6 
01:130d : a9 52 __ LDA #$52
01:130f : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:1311 : a5 10 __ LDA P3 ; (bank + 0)
01:1313 : 85 0d __ STA P0 
01:1315 : 20 9f 2a JSR $2a9f ; (krnio_setbnk@proxy + 0)
01:1318 : a5 13 __ LDA P6 ; (fname + 0)
01:131a : 85 0d __ STA P0 
01:131c : a5 14 __ LDA P7 ; (fname + 1)
01:131e : 85 0e __ STA P1 
01:1320 : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
01:1323 : a9 01 __ LDA #$01
01:1325 : a6 0f __ LDX P2 
01:1327 : a0 00 __ LDY #$00
01:1329 : 20 ba ff JSR $ffba 
01:132c : a9 00 __ LDA #$00
01:132e : a6 11 __ LDX P4 
01:1330 : a4 12 __ LDY P5 
01:1332 : 20 d5 ff JSR $ffd5 
01:1335 : a9 00 __ LDA #$00
01:1337 : b0 02 __ BCS $133b ; (bnk_load.s0 + 42)
01:1339 : a9 01 __ LDA #$01
01:133b : 85 1b __ STA ACCU + 0 
01:133d : a9 00 __ LDA #$00
01:133f : 85 0d __ STA P0 
01:1341 : 85 0e __ STA P1 
01:1343 : 4c a3 2a JMP $2aa3 ; (krnio_setbnk.s0 + 0)
--------------------------------------------------------------------
bnk_memcpy: ; bnk_memcpy(u8,u8*,u8,u8*,u16)->void
.s0:
01:1346 : a9 d1 __ LDA #$d1
01:1348 : 85 1b __ STA ACCU + 0 
01:134a : a9 2d __ LDA #$2d
01:134c : 85 1c __ STA ACCU + 1 
01:134e : ad 00 ff LDA $ff00 
01:1351 : 85 1d __ STA ACCU + 2 
01:1353 : a2 0e __ LDX #$0e
01:1355 : a0 00 __ LDY #$00
.l1002:
01:1357 : a9 0e __ LDA #$0e
01:1359 : 8d 00 ff STA $ff00 
01:135c : b1 0f __ LDA (P2),y ; (sp + 0)
01:135e : 85 1e __ STA ACCU + 3 
01:1360 : a9 7f __ LDA #$7f
01:1362 : 8d 00 ff STA $ff00 
01:1365 : a5 1e __ LDA ACCU + 3 
01:1367 : 91 1b __ STA (ACCU + 0),y 
01:1369 : e6 0f __ INC P2 ; (sp + 0)
01:136b : d0 02 __ BNE $136f ; (bnk_memcpy.s1005 + 0)
.s1004:
01:136d : e6 10 __ INC P3 ; (sp + 1)
.s1005:
01:136f : e6 1b __ INC ACCU + 0 
01:1371 : d0 02 __ BNE $1375 ; (bnk_memcpy.s1007 + 0)
.s1006:
01:1373 : e6 1c __ INC ACCU + 1 
.s1007:
01:1375 : ca __ __ DEX
01:1376 : d0 df __ BNE $1357 ; (bnk_memcpy.l1002 + 0)
.s1003:
01:1378 : a5 1d __ LDA ACCU + 2 
01:137a : 8d 00 ff STA $ff00 
.s1001:
01:137d : 60 __ __ RTS
--------------------------------------------------------------------
bnk_save: ; bnk_save(u8,u8,const u8*,const u8*,const u8*)->bool
.s0:
01:137e : a9 01 __ LDA #$01
01:1380 : 85 0d __ STA P0 
01:1382 : 20 9f 2a JSR $2a9f ; (krnio_setbnk@proxy + 0)
01:1385 : a5 15 __ LDA P8 ; (fname + 0)
01:1387 : 85 0d __ STA P0 
01:1389 : a5 16 __ LDA P9 ; (fname + 1)
01:138b : 85 0e __ STA P1 
01:138d : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
01:1390 : a5 12 __ LDA P5 ; (device + 0)
01:1392 : 85 0d __ STA P0 
01:1394 : a9 01 __ LDA #$01
01:1396 : 85 0e __ STA P1 
01:1398 : a9 1c __ LDA #$1c
01:139a : 85 0f __ STA P2 
01:139c : a5 13 __ LDA P6 ; (end + 0)
01:139e : 85 10 __ STA P3 
01:13a0 : a5 14 __ LDA P7 ; (end + 1)
01:13a2 : 85 11 __ STA P4 
01:13a4 : 20 6a 4c JSR $4c6a ; (krnio_save.s0 + 0)
01:13a7 : 85 43 __ STA T1 + 0 
01:13a9 : a9 00 __ LDA #$00
01:13ab : 85 0d __ STA P0 
01:13ad : 85 0e __ STA P1 
01:13af : 20 a3 2a JSR $2aa3 ; (krnio_setbnk.s0 + 0)
01:13b2 : a5 43 __ LDA T1 + 0 
01:13b4 : 85 1b __ STA ACCU + 0 
.s1001:
01:13b6 : 60 __ __ RTS
