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
1c13 : 8e fc 46 STX $46fc ; (spentry + 0)
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
1c35 : a9 51 __ LDA #$51
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
1c97 : 8d 9c 50 STA $509c ; (charsetchanged + 0)
1c9a : 8d 9d 50 STA $509d ; (charsetchanged + 1)
1c9d : a2 15 __ LDX #$15
.l1002:
1c9f : ca __ __ DEX
1ca0 : 9d 9e 50 STA $509e,x ; (filename + 0)
1ca3 : d0 fa __ BNE $1c9f ; (main.l1002 + 0)
.s1003:
1ca5 : a2 0e __ LDX #$0e
.l1004:
1ca7 : ca __ __ DEX
1ca8 : 9d b3 50 STA $50b3,x ; (view + 0)
1cab : d0 fa __ BNE $1ca7 ; (main.l1004 + 0)
.s1005:
1cad : 20 8d 22 JSR $228d ; (bnk_init.s1000 + 0)
1cb0 : ad c1 50 LDA $50c1 ; (bootdevice + 0)
1cb3 : 8d d2 50 STA $50d2 ; (targetdevice + 0)
1cb6 : 20 29 2b JSR $2b29 ; (vdc_init.s1000 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 85 0f __ STA P2 
1cbd : 85 10 __ STA P3 
1cbf : a9 50 __ LDA #$50
1cc1 : 85 11 __ STA P4 
1cc3 : a9 19 __ LDA #$19
1cc5 : 85 12 __ STA P5 
1cc7 : a9 ec __ LDA #$ec
1cc9 : 85 0d __ STA P0 
1ccb : a9 50 __ LDA #$50
1ccd : 85 0e __ STA P1 
1ccf : 20 fb 30 JSR $30fb ; (vdcwin_init.s0 + 0)
1cd2 : a9 0b __ LDA #$0b
1cd4 : 85 0f __ STA P2 
1cd6 : a9 03 __ LDA #$03
1cd8 : 85 10 __ STA P3 
1cda : a9 3a __ LDA #$3a
1cdc : 85 11 __ STA P4 
1cde : a9 12 __ LDA #$12
1ce0 : 85 12 __ STA P5 
1ce2 : a9 f6 __ LDA #$f6
1ce4 : 85 0d __ STA P0 
1ce6 : a9 50 __ LDA #$50
1ce8 : 85 0e __ STA P1 
1cea : 20 fb 30 JSR $30fb ; (vdcwin_init.s0 + 0)
1ced : a9 c5 __ LDA #$c5
1cef : 8d da 50 STA $50da ; (vdc_state + 7)
1cf2 : a9 00 __ LDA #$00
1cf4 : 85 0f __ STA P2 
1cf6 : 85 10 __ STA P3 
1cf8 : a9 01 __ LDA #$01
1cfa : 85 13 __ STA P6 
1cfc : 20 34 50 JSR $5034 ; (vdc_clear@proxy + 0)
1cff : a9 00 __ LDA #$00
1d01 : 85 11 __ STA P4 
1d03 : 85 12 __ STA P5 
1d05 : a9 91 __ LDA #$91
1d07 : 85 13 __ STA P6 
1d09 : a9 33 __ LDA #$33
1d0b : 85 14 __ STA P7 
1d0d : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
1d10 : a9 c4 __ LDA #$c4
1d12 : 8d da 50 STA $50da ; (vdc_state + 7)
1d15 : a9 00 __ LDA #$00
1d17 : 85 0f __ STA P2 
1d19 : a9 01 __ LDA #$01
1d1b : 85 10 __ STA P3 
1d1d : 85 13 __ STA P6 
1d1f : 20 34 50 JSR $5034 ; (vdc_clear@proxy + 0)
1d22 : a9 80 __ LDA #$80
1d24 : a0 02 __ LDY #$02
1d26 : 91 23 __ STA (SP + 0),y 
1d28 : a9 52 __ LDA #$52
1d2a : c8 __ __ INY
1d2b : 91 23 __ STA (SP + 0),y 
1d2d : a9 d6 __ LDA #$d6
1d2f : c8 __ __ INY
1d30 : 91 23 __ STA (SP + 0),y 
1d32 : a9 33 __ LDA #$33
1d34 : c8 __ __ INY
1d35 : 91 23 __ STA (SP + 0),y 
1d37 : a9 00 __ LDA #$00
1d39 : c8 __ __ INY
1d3a : 91 23 __ STA (SP + 0),y 
1d3c : a9 34 __ LDA #$34
1d3e : c8 __ __ INY
1d3f : 91 23 __ STA (SP + 0),y 
1d41 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
1d44 : a9 00 __ LDA #$00
1d46 : 85 11 __ STA P4 
1d48 : a9 01 __ LDA #$01
1d4a : 85 12 __ STA P5 
1d4c : 20 21 50 JSR $5021 ; (vdc_prints@proxy + 0)
1d4f : ad fe 46 LDA $46fe ; (mc_default + 0)
1d52 : 8d da 50 STA $50da ; (vdc_state + 7)
1d55 : 20 12 34 JSR $3412 ; (filepicker.s1000 + 0)
1d58 : a9 80 __ LDA #$80
1d5a : a0 02 __ LDY #$02
1d5c : 91 23 __ STA (SP + 0),y 
1d5e : a9 52 __ LDA #$52
1d60 : c8 __ __ INY
1d61 : 91 23 __ STA (SP + 0),y 
1d63 : a9 e4 __ LDA #$e4
1d65 : c8 __ __ INY
1d66 : 91 23 __ STA (SP + 0),y 
1d68 : a9 46 __ LDA #$46
1d6a : c8 __ __ INY
1d6b : 91 23 __ STA (SP + 0),y 
1d6d : ad d2 50 LDA $50d2 ; (targetdevice + 0)
1d70 : c8 __ __ INY
1d71 : 91 23 __ STA (SP + 0),y 
1d73 : a9 00 __ LDA #$00
1d75 : c8 __ __ INY
1d76 : 91 23 __ STA (SP + 0),y 
1d78 : a9 9e __ LDA #$9e
1d7a : c8 __ __ INY
1d7b : 91 23 __ STA (SP + 0),y 
1d7d : a9 50 __ LDA #$50
1d7f : c8 __ __ INY
1d80 : 91 23 __ STA (SP + 0),y 
1d82 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
1d85 : a9 00 __ LDA #$00
1d87 : 8d fa 50 STA $50fa ; (interface + 4)
1d8a : 8d fb 50 STA $50fb ; (interface + 5)
1d8d : a9 f6 __ LDA #$f6
1d8f : a0 02 __ LDY #$02
1d91 : 91 23 __ STA (SP + 0),y 
1d93 : a9 50 __ LDA #$50
1d95 : c8 __ __ INY
1d96 : 91 23 __ STA (SP + 0),y 
1d98 : a9 ed __ LDA #$ed
1d9a : c8 __ __ INY
1d9b : 91 23 __ STA (SP + 0),y 
1d9d : a9 46 __ LDA #$46
1d9f : c8 __ __ INY
1da0 : 91 23 __ STA (SP + 0),y 
1da2 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
1da5 : a9 f6 __ LDA #$f6
1da7 : a0 02 __ LDY #$02
1da9 : 91 23 __ STA (SP + 0),y 
1dab : a9 50 __ LDA #$50
1dad : c8 __ __ INY
1dae : 91 23 __ STA (SP + 0),y 
1db0 : a9 80 __ LDA #$80
1db2 : c8 __ __ INY
1db3 : 91 23 __ STA (SP + 0),y 
1db5 : a9 52 __ LDA #$52
1db7 : c8 __ __ INY
1db8 : 91 23 __ STA (SP + 0),y 
1dba : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
1dbd : a9 f6 __ LDA #$f6
1dbf : a0 02 __ LDY #$02
1dc1 : 91 23 __ STA (SP + 0),y 
1dc3 : a9 50 __ LDA #$50
1dc5 : c8 __ __ INY
1dc6 : 91 23 __ STA (SP + 0),y 
1dc8 : a9 00 __ LDA #$00
1dca : c8 __ __ INY
1dcb : 91 23 __ STA (SP + 0),y 
1dcd : a9 47 __ LDA #$47
1dcf : c8 __ __ INY
1dd0 : 91 23 __ STA (SP + 0),y 
1dd2 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
1dd5 : ad f6 50 LDA $50f6 ; (interface + 0)
1dd8 : 85 15 __ STA P8 
1dda : ad fb 50 LDA $50fb ; (interface + 5)
1ddd : 18 __ __ CLC
1dde : 6d f7 50 ADC $50f7 ; (interface + 1)
1de1 : 85 16 __ STA P9 
1de3 : a9 87 __ LDA #$87
1de5 : 85 17 __ STA P10 
1de7 : a9 50 __ LDA #$50
1de9 : 85 18 __ STA P11 
1deb : 20 26 47 JSR $4726 ; (textInput.s0 + 0)
1dee : a9 80 __ LDA #$80
1df0 : a0 02 __ LDY #$02
1df2 : 91 23 __ STA (SP + 0),y 
1df4 : a9 52 __ LDA #$52
1df6 : c8 __ __ INY
1df7 : 91 23 __ STA (SP + 0),y 
1df9 : a9 87 __ LDA #$87
1dfb : a0 06 __ LDY #$06
1dfd : 91 23 __ STA (SP + 0),y 
1dff : a9 50 __ LDA #$50
1e01 : c8 __ __ INY
1e02 : 91 23 __ STA (SP + 0),y 
1e04 : a9 87 __ LDA #$87
1e06 : c8 __ __ INY
1e07 : 91 23 __ STA (SP + 0),y 
1e09 : a9 50 __ LDA #$50
1e0b : c8 __ __ INY
1e0c : 91 23 __ STA (SP + 0),y 
1e0e : a9 66 __ LDA #$66
1e10 : a0 04 __ LDY #$04
1e12 : 91 23 __ STA (SP + 0),y 
1e14 : a9 49 __ LDA #$49
1e16 : c8 __ __ INY
1e17 : 91 23 __ STA (SP + 0),y 
1e19 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
1e1c : 20 6f 49 JSR $496f ; (cmd@proxy + 0)
1e1f : a5 1b __ LDA ACCU + 0 
1e21 : c9 3f __ CMP #$3f
1e23 : d0 1b __ BNE $1e40 ; (main.s4 + 0)
.s3:
1e25 : a9 f6 __ LDA #$f6
1e27 : a0 02 __ LDY #$02
1e29 : 91 23 __ STA (SP + 0),y 
1e2b : a9 50 __ LDA #$50
1e2d : c8 __ __ INY
1e2e : 91 23 __ STA (SP + 0),y 
1e30 : a9 38 __ LDA #$38
1e32 : c8 __ __ INY
1e33 : 91 23 __ STA (SP + 0),y 
1e35 : a9 4a __ LDA #$4a
1e37 : c8 __ __ INY
1e38 : 91 23 __ STA (SP + 0),y 
1e3a : 20 d1 40 JSR $40d1 ; (vdcwin_put_string.s1000 + 0)
1e3d : 4c 25 22 JMP $2225 ; (main.l6 + 0)
.s4:
1e40 : 09 00 __ ORA #$00
1e42 : f0 07 __ BEQ $1e4b ; (main.s5 + 0)
.s15:
1e44 : c9 3e __ CMP #$3e
1e46 : f0 03 __ BEQ $1e4b ; (main.s5 + 0)
.s10:
1e48 : 20 64 4a JSR $4a64 ; (error_message.s1000 + 0)
.s5:
1e4b : a9 f6 __ LDA #$f6
1e4d : a0 02 __ LDY #$02
1e4f : 91 23 __ STA (SP + 0),y 
1e51 : a9 50 __ LDA #$50
1e53 : c8 __ __ INY
1e54 : 91 23 __ STA (SP + 0),y 
1e56 : a9 d7 __ LDA #$d7
1e58 : c8 __ __ INY
1e59 : 91 23 __ STA (SP + 0),y 
1e5b : a9 4a __ LDA #$4a
1e5d : c8 __ __ INY
1e5e : 91 23 __ STA (SP + 0),y 
1e60 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
1e63 : a9 00 __ LDA #$00
1e65 : 85 10 __ STA P3 
1e67 : ad d2 50 LDA $50d2 ; (targetdevice + 0)
1e6a : 85 0f __ STA P2 
1e6c : a9 93 __ LDA #$93
1e6e : 85 11 __ STA P4 
1e70 : a9 bf __ LDA #$bf
1e72 : 85 12 __ STA P5 
1e74 : a9 9e __ LDA #$9e
1e76 : 85 13 __ STA P6 
1e78 : a9 50 __ LDA #$50
1e7a : 85 14 __ STA P7 
1e7c : 20 11 0c JSR $0c11 ; (bnk_load.s0 + 0)
1e7f : a5 1b __ LDA ACCU + 0 
1e81 : d0 03 __ BNE $1e86 ; (main.s18 + 0)
.s16:
1e83 : 20 64 4a JSR $4a64 ; (error_message.s1000 + 0)
.s18:
1e86 : a9 9e __ LDA #$9e
1e88 : 85 0d __ STA P0 
1e8a : a9 50 __ LDA #$50
1e8c : 85 0e __ STA P1 
1e8e : ad 93 bf LDA $bf93 ; (projbuffer + 0)
1e91 : 8d 9c 50 STA $509c ; (charsetchanged + 0)
1e94 : ad 94 bf LDA $bf94 ; (projbuffer + 1)
1e97 : 8d 9d 50 STA $509d ; (charsetchanged + 1)
1e9a : ad 98 bf LDA $bf98 ; (projbuffer + 5)
1e9d : 85 03 __ STA WORK + 0 
1e9f : 8d b9 50 STA $50b9 ; (view + 6)
1ea2 : ad 97 bf LDA $bf97 ; (projbuffer + 4)
1ea5 : 85 04 __ STA WORK + 1 
1ea7 : 8d ba 50 STA $50ba ; (view + 7)
1eaa : ad 9a bf LDA $bf9a ; (projbuffer + 7)
1ead : 85 1b __ STA ACCU + 0 
1eaf : ad 99 bf LDA $bf99 ; (projbuffer + 6)
1eb2 : 85 1c __ STA ACCU + 1 
1eb4 : 20 93 4c JSR $4c93 ; (mul16 + 0)
1eb7 : a5 05 __ LDA WORK + 2 
1eb9 : 85 54 __ STA T3 + 0 
1ebb : 8d bd 50 STA $50bd ; (view + 10)
1ebe : a5 06 __ LDA WORK + 3 
1ec0 : 85 55 __ STA T3 + 1 
1ec2 : 8d be 50 STA $50be ; (view + 11)
1ec5 : ad 9a bf LDA $bf9a ; (projbuffer + 7)
1ec8 : 8d bb 50 STA $50bb ; (view + 8)
1ecb : ad 99 bf LDA $bf99 ; (projbuffer + 6)
1ece : 8d bc 50 STA $50bc ; (view + 9)
1ed1 : ad 9d bf LDA $bf9d ; (projbuffer + 10)
1ed4 : 8d c0 50 STA $50c0 ; (view + 13)
1ed7 : ad a9 bf LDA $bfa9 ; (projbuffer + 22)
1eda : 8d bf 50 STA $50bf ; (view + 12)
1edd : 20 34 33 JSR $3334 ; (strlen.s0 + 0)
1ee0 : a9 00 __ LDA #$00
1ee2 : a6 1b __ LDX ACCU + 0 
1ee4 : 9d 99 50 STA $5099,x ; (filedest + 18)
1ee7 : 06 54 __ ASL T3 + 0 
1ee9 : 26 55 __ ROL T3 + 1 
1eeb : 18 __ __ CLC
1eec : a9 30 __ LDA #$30
1eee : 65 54 __ ADC T3 + 0 
1ef0 : 85 54 __ STA T3 + 0 
1ef2 : a9 40 __ LDA #$40
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
1f04 : 20 f2 4a JSR $4af2 ; (too_big.s1000 + 0)
.s21:
1f07 : a9 00 __ LDA #$00
1f09 : 8d b3 50 STA $50b3 ; (view + 0)
1f0c : a9 40 __ LDA #$40
1f0e : 8d b4 50 STA $50b4 ; (view + 1)
1f11 : ad 9c 50 LDA $509c ; (charsetchanged + 0)
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
1f29 : 20 f2 4a JSR $4af2 ; (too_big.s1000 + 0)
.s27:
1f2c : a5 54 __ LDA T3 + 0 
1f2e : 8d b5 50 STA $50b5 ; (view + 2)
1f31 : a5 55 __ LDA T3 + 1 
1f33 : 8d b6 50 STA $50b6 ; (view + 3)
1f36 : a5 57 __ LDA T5 + 1 
1f38 : 85 55 __ STA T3 + 1 
.s86:
1f3a : ad 9d 50 LDA $509d ; (charsetchanged + 1)
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
1f52 : 20 f2 4a JSR $4af2 ; (too_big.s1000 + 0)
.s33:
1f55 : a5 54 __ LDA T3 + 0 
1f57 : 8d b7 50 STA $50b7 ; (view + 4)
1f5a : a5 55 __ LDA T3 + 1 
1f5c : 8d b8 50 STA $50b8 ; (view + 5)
1f5f : a5 57 __ LDA T5 + 1 
1f61 : 85 55 __ STA T3 + 1 
.s30:
1f63 : a9 01 __ LDA #$01
1f65 : a0 06 __ LDY #$06
1f67 : 91 23 __ STA (SP + 0),y 
1f69 : a9 1c __ LDA #$1c
1f6b : c8 __ __ INY
1f6c : 91 23 __ STA (SP + 0),y 
1f6e : a9 80 __ LDA #$80
1f70 : a0 02 __ LDY #$02
1f72 : 91 23 __ STA (SP + 0),y 
1f74 : a9 52 __ LDA #$52
1f76 : c8 __ __ INY
1f77 : 91 23 __ STA (SP + 0),y 
1f79 : a9 6a __ LDA #$6a
1f7b : c8 __ __ INY
1f7c : 91 23 __ STA (SP + 0),y 
1f7e : a9 4b __ LDA #$4b
1f80 : c8 __ __ INY
1f81 : 91 23 __ STA (SP + 0),y 
1f83 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
1f86 : a9 f6 __ LDA #$f6
1f88 : a0 02 __ LDY #$02
1f8a : 91 23 __ STA (SP + 0),y 
1f8c : a9 50 __ LDA #$50
1f8e : c8 __ __ INY
1f8f : 91 23 __ STA (SP + 0),y 
1f91 : a9 80 __ LDA #$80
1f93 : c8 __ __ INY
1f94 : 91 23 __ STA (SP + 0),y 
1f96 : a9 52 __ LDA #$52
1f98 : c8 __ __ INY
1f99 : 91 23 __ STA (SP + 0),y 
1f9b : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
1f9e : ad c1 50 LDA $50c1 ; (bootdevice + 0)
1fa1 : 85 0f __ STA P2 
1fa3 : a9 01 __ LDA #$01
1fa5 : 85 10 __ STA P3 
1fa7 : 85 11 __ STA P4 
1fa9 : a9 1c __ LDA #$1c
1fab : 85 12 __ STA P5 
1fad : a9 8e __ LDA #$8e
1faf : 85 13 __ STA P6 
1fb1 : a9 4b __ LDA #$4b
1fb3 : 85 14 __ STA P7 
1fb5 : 20 11 0c JSR $0c11 ; (bnk_load.s0 + 0)
1fb8 : a5 1b __ LDA ACCU + 0 
1fba : d0 03 __ BNE $1fbf ; (main.s36 + 0)
.s34:
1fbc : 20 64 4a JSR $4a64 ; (error_message.s1000 + 0)
.s36:
1fbf : a9 80 __ LDA #$80
1fc1 : a0 02 __ LDY #$02
1fc3 : 91 23 __ STA (SP + 0),y 
1fc5 : a9 52 __ LDA #$52
1fc7 : c8 __ __ INY
1fc8 : 91 23 __ STA (SP + 0),y 
1fca : a9 dd __ LDA #$dd
1fcc : a0 06 __ LDY #$06
1fce : 91 23 __ STA (SP + 0),y 
1fd0 : a9 36 __ LDA #$36
1fd2 : c8 __ __ INY
1fd3 : 91 23 __ STA (SP + 0),y 
1fd5 : a9 9b __ LDA #$9b
1fd7 : a0 04 __ LDY #$04
1fd9 : 91 23 __ STA (SP + 0),y 
1fdb : a9 4b __ LDA #$4b
1fdd : c8 __ __ INY
1fde : 91 23 __ STA (SP + 0),y 
1fe0 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
1fe3 : a9 f6 __ LDA #$f6
1fe5 : a0 02 __ LDY #$02
1fe7 : 91 23 __ STA (SP + 0),y 
1fe9 : a9 50 __ LDA #$50
1feb : c8 __ __ INY
1fec : 91 23 __ STA (SP + 0),y 
1fee : a9 80 __ LDA #$80
1ff0 : c8 __ __ INY
1ff1 : 91 23 __ STA (SP + 0),y 
1ff3 : a9 52 __ LDA #$52
1ff5 : c8 __ __ INY
1ff6 : 91 23 __ STA (SP + 0),y 
1ff8 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
1ffb : a9 b3 __ LDA #$b3
1ffd : 85 0f __ STA P2 
1fff : a9 50 __ LDA #$50
2001 : 85 10 __ STA P3 
2003 : 20 46 0c JSR $0c46 ; (bnk_memcpy.s0 + 0)
2006 : a9 80 __ LDA #$80
2008 : a0 02 __ LDY #$02
200a : 91 23 __ STA (SP + 0),y 
200c : a9 52 __ LDA #$52
200e : c8 __ __ INY
200f : 91 23 __ STA (SP + 0),y 
2011 : a9 bc __ LDA #$bc
2013 : c8 __ __ INY
2014 : 91 23 __ STA (SP + 0),y 
2016 : a9 4b __ LDA #$4b
2018 : c8 __ __ INY
2019 : 91 23 __ STA (SP + 0),y 
201b : ad b3 50 LDA $50b3 ; (view + 0)
201e : c8 __ __ INY
201f : 91 23 __ STA (SP + 0),y 
2021 : ad b4 50 LDA $50b4 ; (view + 1)
2024 : c8 __ __ INY
2025 : 91 23 __ STA (SP + 0),y 
2027 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
202a : a9 f6 __ LDA #$f6
202c : a0 02 __ LDY #$02
202e : 91 23 __ STA (SP + 0),y 
2030 : a9 50 __ LDA #$50
2032 : c8 __ __ INY
2033 : 91 23 __ STA (SP + 0),y 
2035 : a9 80 __ LDA #$80
2037 : c8 __ __ INY
2038 : 91 23 __ STA (SP + 0),y 
203a : a9 52 __ LDA #$52
203c : c8 __ __ INY
203d : 91 23 __ STA (SP + 0),y 
203f : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
2042 : a9 80 __ LDA #$80
2044 : a0 02 __ LDY #$02
2046 : 91 23 __ STA (SP + 0),y 
2048 : a9 52 __ LDA #$52
204a : c8 __ __ INY
204b : 91 23 __ STA (SP + 0),y 
204d : a9 9e __ LDA #$9e
204f : a0 06 __ LDY #$06
2051 : 91 23 __ STA (SP + 0),y 
2053 : a9 50 __ LDA #$50
2055 : c8 __ __ INY
2056 : 91 23 __ STA (SP + 0),y 
2058 : a9 dd __ LDA #$dd
205a : a0 04 __ LDY #$04
205c : 91 23 __ STA (SP + 0),y 
205e : a9 4b __ LDA #$4b
2060 : c8 __ __ INY
2061 : 91 23 __ STA (SP + 0),y 
2063 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
2066 : ad b3 50 LDA $50b3 ; (view + 0)
2069 : 85 11 __ STA P4 
206b : ad b4 50 LDA $50b4 ; (view + 1)
206e : 85 12 __ STA P5 
2070 : 20 00 0c JSR $0c00 ; (bnk_load@proxy + 0)
2073 : a5 1b __ LDA ACCU + 0 
2075 : d0 03 __ BNE $207a ; (main.s90 + 0)
.s37:
2077 : 20 64 4a JSR $4a64 ; (error_message.s1000 + 0)
.s90:
207a : ad 9c 50 LDA $509c ; (charsetchanged + 0)
207d : f0 03 __ BEQ $2082 ; (main.s92 + 0)
207f : 4c ab 21 JMP $21ab ; (main.s40 + 0)
.s92:
2082 : ad 9d 50 LDA $509d ; (charsetchanged + 1)
2085 : f0 03 __ BEQ $208a ; (main.s48 + 0)
2087 : 4c 31 21 JMP $2131 ; (main.s46 + 0)
.s48:
208a : a9 80 __ LDA #$80
208c : a0 02 __ LDY #$02
208e : 91 23 __ STA (SP + 0),y 
2090 : a9 52 __ LDA #$52
2092 : c8 __ __ INY
2093 : 91 23 __ STA (SP + 0),y 
2095 : a9 42 __ LDA #$42
2097 : c8 __ __ INY
2098 : 91 23 __ STA (SP + 0),y 
209a : a9 4c __ LDA #$4c
209c : c8 __ __ INY
209d : 91 23 __ STA (SP + 0),y 
209f : 38 __ __ SEC
20a0 : a5 55 __ LDA T3 + 1 
20a2 : e9 40 __ SBC #$40
20a4 : a0 07 __ LDY #$07
20a6 : 91 23 __ STA (SP + 0),y 
20a8 : a5 54 __ LDA T3 + 0 
20aa : 88 __ __ DEY
20ab : 91 23 __ STA (SP + 0),y 
20ad : a9 87 __ LDA #$87
20af : a0 08 __ LDY #$08
20b1 : 91 23 __ STA (SP + 0),y 
20b3 : a9 50 __ LDA #$50
20b5 : c8 __ __ INY
20b6 : 91 23 __ STA (SP + 0),y 
20b8 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
20bb : a9 f6 __ LDA #$f6
20bd : a0 02 __ LDY #$02
20bf : 91 23 __ STA (SP + 0),y 
20c1 : a9 50 __ LDA #$50
20c3 : c8 __ __ INY
20c4 : 91 23 __ STA (SP + 0),y 
20c6 : a9 80 __ LDA #$80
20c8 : c8 __ __ INY
20c9 : 91 23 __ STA (SP + 0),y 
20cb : a9 52 __ LDA #$52
20cd : c8 __ __ INY
20ce : 91 23 __ STA (SP + 0),y 
20d0 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
20d3 : a5 54 __ LDA T3 + 0 
20d5 : 85 13 __ STA P6 
20d7 : a5 55 __ LDA T3 + 1 
20d9 : 85 14 __ STA P7 
20db : a9 87 __ LDA #$87
20dd : 85 15 __ STA P8 
20df : a9 50 __ LDA #$50
20e1 : 85 16 __ STA P9 
20e3 : ad d2 50 LDA $50d2 ; (targetdevice + 0)
20e6 : 85 12 __ STA P5 
20e8 : 20 7e 0c JSR $0c7e ; (bnk_save.s0 + 0)
20eb : a5 1b __ LDA ACCU + 0 
20ed : d0 03 __ BNE $20f2 ; (main.s54 + 0)
.s52:
20ef : 20 64 4a JSR $4a64 ; (error_message.s1000 + 0)
.s54:
20f2 : a9 f6 __ LDA #$f6
20f4 : a0 02 __ LDY #$02
20f6 : 91 23 __ STA (SP + 0),y 
20f8 : a9 50 __ LDA #$50
20fa : c8 __ __ INY
20fb : 91 23 __ STA (SP + 0),y 
20fd : a9 76 __ LDA #$76
20ff : c8 __ __ INY
2100 : 91 23 __ STA (SP + 0),y 
2102 : a9 4c __ LDA #$4c
2104 : c8 __ __ INY
2105 : 91 23 __ STA (SP + 0),y 
2107 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
210a : 20 9a 2d JSR $2d9a ; (getch.s0 + 0)
210d : 20 ad 4a JSR $4aad ; (vdc_exit.s0 + 0)
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
213c : a9 21 __ LDA #$21
213e : c8 __ __ INY
213f : 91 23 __ STA (SP + 0),y 
2141 : a9 4c __ LDA #$4c
2143 : c8 __ __ INY
2144 : 91 23 __ STA (SP + 0),y 
2146 : ad b7 50 LDA $50b7 ; (view + 4)
2149 : c8 __ __ INY
214a : 91 23 __ STA (SP + 0),y 
214c : ad b8 50 LDA $50b8 ; (view + 5)
214f : c8 __ __ INY
2150 : 91 23 __ STA (SP + 0),y 
2152 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
2155 : a9 f6 __ LDA #$f6
2157 : a0 02 __ LDY #$02
2159 : 91 23 __ STA (SP + 0),y 
215b : a9 50 __ LDA #$50
215d : c8 __ __ INY
215e : 91 23 __ STA (SP + 0),y 
2160 : a9 80 __ LDA #$80
2162 : c8 __ __ INY
2163 : 91 23 __ STA (SP + 0),y 
2165 : a9 52 __ LDA #$52
2167 : c8 __ __ INY
2168 : 91 23 __ STA (SP + 0),y 
216a : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
216d : a9 80 __ LDA #$80
216f : a0 02 __ LDY #$02
2171 : 91 23 __ STA (SP + 0),y 
2173 : a9 52 __ LDA #$52
2175 : c8 __ __ INY
2176 : 91 23 __ STA (SP + 0),y 
2178 : a9 9e __ LDA #$9e
217a : a0 06 __ LDY #$06
217c : 91 23 __ STA (SP + 0),y 
217e : a9 50 __ LDA #$50
2180 : c8 __ __ INY
2181 : 91 23 __ STA (SP + 0),y 
2183 : a9 ed __ LDA #$ed
2185 : a0 04 __ LDY #$04
2187 : 91 23 __ STA (SP + 0),y 
2189 : a9 4b __ LDA #$4b
218b : c8 __ __ INY
218c : 91 23 __ STA (SP + 0),y 
218e : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
2191 : ad b7 50 LDA $50b7 ; (view + 4)
2194 : 85 11 __ STA P4 
2196 : ad b8 50 LDA $50b8 ; (view + 5)
2199 : 85 12 __ STA P5 
219b : 20 00 0c JSR $0c00 ; (bnk_load@proxy + 0)
219e : a5 1b __ LDA ACCU + 0 
21a0 : f0 03 __ BEQ $21a5 ; (main.s49 + 0)
21a2 : 4c 8a 20 JMP $208a ; (main.s48 + 0)
.s49:
21a5 : 20 64 4a JSR $4a64 ; (error_message.s1000 + 0)
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
21c0 : ad b5 50 LDA $50b5 ; (view + 2)
21c3 : c8 __ __ INY
21c4 : 91 23 __ STA (SP + 0),y 
21c6 : ad b6 50 LDA $50b6 ; (view + 3)
21c9 : c8 __ __ INY
21ca : 91 23 __ STA (SP + 0),y 
21cc : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
21cf : a9 f6 __ LDA #$f6
21d1 : a0 02 __ LDY #$02
21d3 : 91 23 __ STA (SP + 0),y 
21d5 : a9 50 __ LDA #$50
21d7 : c8 __ __ INY
21d8 : 91 23 __ STA (SP + 0),y 
21da : a9 80 __ LDA #$80
21dc : c8 __ __ INY
21dd : 91 23 __ STA (SP + 0),y 
21df : a9 52 __ LDA #$52
21e1 : c8 __ __ INY
21e2 : 91 23 __ STA (SP + 0),y 
21e4 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
21e7 : a9 80 __ LDA #$80
21e9 : a0 02 __ LDY #$02
21eb : 91 23 __ STA (SP + 0),y 
21ed : a9 52 __ LDA #$52
21ef : c8 __ __ INY
21f0 : 91 23 __ STA (SP + 0),y 
21f2 : a9 9e __ LDA #$9e
21f4 : a0 06 __ LDY #$06
21f6 : 91 23 __ STA (SP + 0),y 
21f8 : a9 50 __ LDA #$50
21fa : c8 __ __ INY
21fb : 91 23 __ STA (SP + 0),y 
21fd : a9 e5 __ LDA #$e5
21ff : a0 04 __ LDY #$04
2201 : 91 23 __ STA (SP + 0),y 
2203 : a9 4b __ LDA #$4b
2205 : c8 __ __ INY
2206 : 91 23 __ STA (SP + 0),y 
2208 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
220b : ad b5 50 LDA $50b5 ; (view + 2)
220e : 85 11 __ STA P4 
2210 : ad b6 50 LDA $50b6 ; (view + 3)
2213 : 85 12 __ STA P5 
2215 : 20 00 0c JSR $0c00 ; (bnk_load@proxy + 0)
2218 : a5 1b __ LDA ACCU + 0 
221a : f0 03 __ BEQ $221f ; (main.s43 + 0)
221c : 4c 82 20 JMP $2082 ; (main.s92 + 0)
.s43:
221f : 20 64 4a JSR $4a64 ; (error_message.s1000 + 0)
2222 : 4c 82 20 JMP $2082 ; (main.s92 + 0)
.l6:
2225 : 20 8f 46 JSR $468f ; (vdcwin_getch.s0 + 0)
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
2239 : a9 f6 __ LDA #$f6
223b : 85 17 __ STA P10 
223d : a9 50 __ LDA #$50
223f : 85 18 __ STA P11 
2241 : 20 8f 3f JSR $3f8f ; (vdcwin_put_char.s1000 + 0)
2244 : a9 f6 __ LDA #$f6
2246 : a0 02 __ LDY #$02
2248 : 91 23 __ STA (SP + 0),y 
224a : a9 50 __ LDA #$50
224c : c8 __ __ INY
224d : 91 23 __ STA (SP + 0),y 
224f : a9 81 __ LDA #$81
2251 : c8 __ __ INY
2252 : 91 23 __ STA (SP + 0),y 
2254 : a9 41 __ LDA #$41
2256 : c8 __ __ INY
2257 : 91 23 __ STA (SP + 0),y 
2259 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
225c : a5 53 __ LDA T1 + 0 
225e : c9 59 __ CMP #$59
2260 : f0 03 __ BEQ $2265 ; (main.s9 + 0)
2262 : 4c 48 1e JMP $1e48 ; (main.s10 + 0)
.s9:
2265 : a9 00 __ LDA #$00
2267 : a0 02 __ LDY #$02
2269 : 91 23 __ STA (SP + 0),y 
226b : a9 54 __ LDA #$54
226d : c8 __ __ INY
226e : 91 23 __ STA (SP + 0),y 
2270 : a9 5f __ LDA #$5f
2272 : c8 __ __ INY
2273 : 91 23 __ STA (SP + 0),y 
2275 : a9 4a __ LDA #$4a
2277 : c8 __ __ INY
2278 : 91 23 __ STA (SP + 0),y 
227a : a9 87 __ LDA #$87
227c : c8 __ __ INY
227d : 91 23 __ STA (SP + 0),y 
227f : a9 50 __ LDA #$50
2281 : c8 __ __ INY
2282 : 91 23 __ STA (SP + 0),y 
2284 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
2287 : 20 6f 49 JSR $496f ; (cmd@proxy + 0)
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
22a9 : 8d c1 50 STA $50c1 ; (bootdevice + 0)
22ac : a0 04 __ LDY #$04
22ae : 91 23 __ STA (SP + 0),y 
22b0 : a9 00 __ LDA #$00
22b2 : c8 __ __ INY
22b3 : 91 23 __ STA (SP + 0),y 
22b5 : 20 da 22 JSR $22da ; (printf.s0 + 0)
22b8 : a9 05 __ LDA #$05
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
2716 : ae fd 46 LDX $46fd ; (giocharmap + 0)
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
2799 : 20 d5 4c JSR $4cd5 ; (divmod + 0)
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
29c1 : 20 5a 4d JSR $4d5a ; (divmod32 + 0)
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
2a50 : ad c1 50 LDA $50c1 ; (bootdevice + 0)
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
2a75 : ad c3 50 LDA $50c3 ; (krnio_pstatus + 1)
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
2b1c : ae fc 46 LDX $46fc ; (spentry + 0)
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
2b36 : bd 4d 50 LDA $504d,x ; (vdc_clear@proxy + 14)
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
2b7a : 8d da 50 STA $50da ; (vdc_state + 7)
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
2c59 : 8d d3 50 STA $50d3 ; (vdc_state + 0)
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
2c6d : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2c70 : 85 12 __ STA P5 
2c72 : ad d8 50 LDA $50d8 ; (vdc_state + 5)
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
2ca3 : ad db 50 LDA $50db ; (vdc_state + 8)
2ca6 : 18 __ __ CLC
2ca7 : 65 46 __ ADC T3 + 0 
2ca9 : 85 0d __ STA P0 
2cab : ad dc 50 LDA $50dc ; (vdc_state + 9)
2cae : 65 47 __ ADC T3 + 1 
2cb0 : 85 0e __ STA P1 
2cb2 : ad da 50 LDA $50da ; (vdc_state + 7)
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
2cf4 : ad dd 50 LDA $50dd ; (vdc_state + 10)
2cf7 : 18 __ __ CLC
2cf8 : 65 46 __ ADC T3 + 0 
2cfa : 85 0d __ STA P0 
2cfc : ad de 50 LDA $50de ; (vdc_state + 11)
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
2da7 : ae fd 46 LDX $46fd ; (giocharmap + 0)
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
2e02 : be f5 4b LDX $4bf5,y ; (__multab36L + 0)
2e05 : 86 49 __ STX T1 + 0 
2e07 : 86 4b __ STX T2 + 0 
2e09 : bd 04 51 LDA $5104,x ; (vdc_modes + 4)
2e0c : f0 08 __ BEQ $2e16 ; (vdc_set_mode.s3 + 0)
.s4:
2e0e : ad d3 50 LDA $50d3 ; (vdc_state + 0)
2e11 : c9 10 __ CMP #$10
2e13 : d0 01 __ BNE $2e16 ; (vdc_set_mode.s3 + 0)
2e15 : 60 __ __ RTS
.s3:
2e16 : 8c d5 50 STY $50d5 ; (vdc_state + 2)
2e19 : a9 8d __ LDA #$8d
2e1b : 8d da 50 STA $50da ; (vdc_state + 7)
2e1e : a9 00 __ LDA #$00
2e20 : 8d e9 50 STA $50e9 ; (vdc_state + 22)
2e23 : 8d ea 50 STA $50ea ; (vdc_state + 23)
2e26 : 8d eb 50 STA $50eb ; (vdc_state + 24)
2e29 : bd 00 51 LDA $5100,x ; (vdc_modes + 0)
2e2c : 8d d6 50 STA $50d6 ; (vdc_state + 3)
2e2f : bd 01 51 LDA $5101,x ; (vdc_modes + 1)
2e32 : 8d d7 50 STA $50d7 ; (vdc_state + 4)
2e35 : bd 02 51 LDA $5102,x ; (vdc_modes + 2)
2e38 : 8d d8 50 STA $50d8 ; (vdc_state + 5)
2e3b : bd 03 51 LDA $5103,x ; (vdc_modes + 3)
2e3e : 8d d9 50 STA $50d9 ; (vdc_state + 6)
2e41 : bd 09 51 LDA $5109,x ; (vdc_modes + 9)
2e44 : 8d df 50 STA $50df ; (vdc_state + 12)
2e47 : bd 0a 51 LDA $510a,x ; (vdc_modes + 10)
2e4a : 8d e0 50 STA $50e0 ; (vdc_state + 13)
2e4d : bd 0b 51 LDA $510b,x ; (vdc_modes + 11)
2e50 : 8d e1 50 STA $50e1 ; (vdc_state + 14)
2e53 : bd 0c 51 LDA $510c,x ; (vdc_modes + 12)
2e56 : 8d e2 50 STA $50e2 ; (vdc_state + 15)
2e59 : bd 0d 51 LDA $510d,x ; (vdc_modes + 13)
2e5c : 8d e3 50 STA $50e3 ; (vdc_state + 16)
2e5f : bd 0e 51 LDA $510e,x ; (vdc_modes + 14)
2e62 : 8d e4 50 STA $50e4 ; (vdc_state + 17)
2e65 : bd 0f 51 LDA $510f,x ; (vdc_modes + 15)
2e68 : 8d e5 50 STA $50e5 ; (vdc_state + 18)
2e6b : bd 10 51 LDA $5110,x ; (vdc_modes + 16)
2e6e : 8d e6 50 STA $50e6 ; (vdc_state + 19)
2e71 : bd 11 51 LDA $5111,x ; (vdc_modes + 17)
2e74 : 8d e7 50 STA $50e7 ; (vdc_state + 20)
2e77 : bd 12 51 LDA $5112,x ; (vdc_modes + 18)
2e7a : 8d e8 50 STA $50e8 ; (vdc_state + 21)
2e7d : bd 05 51 LDA $5105,x ; (vdc_modes + 5)
2e80 : 85 4c __ STA T3 + 0 
2e82 : 8d db 50 STA $50db ; (vdc_state + 8)
2e85 : bd 06 51 LDA $5106,x ; (vdc_modes + 6)
2e88 : 85 4d __ STA T3 + 1 
2e8a : 8d dc 50 STA $50dc ; (vdc_state + 9)
2e8d : bd 07 51 LDA $5107,x ; (vdc_modes + 7)
2e90 : 85 4e __ STA T5 + 0 
2e92 : 8d dd 50 STA $50dd ; (vdc_state + 10)
2e95 : bd 08 51 LDA $5108,x ; (vdc_modes + 8)
2e98 : 85 4f __ STA T5 + 1 
2e9a : 8d de 50 STA $50de ; (vdc_state + 11)
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
2f5a : ad d4 50 LDA $50d4 ; (vdc_state + 1)
2f5d : d0 03 __ BNE $2f62 ; (vdc_set_mode.s55 + 0)
.s53:
2f5f : 20 25 30 JSR $3025 ; (vdc_set_extended_memsize.s0 + 0)
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
2f75 : ad d9 50 LDA $50d9 ; (vdc_state + 6)
2f78 : 85 1c __ STA ACCU + 1 
2f7a : ad d8 50 LDA $50d8 ; (vdc_state + 5)
2f7d : 85 1b __ STA ACCU + 0 
2f7f : 05 1c __ ORA ACCU + 1 
2f81 : f0 4c __ BEQ $2fcf ; (vdc_set_multab.s1001 + 0)
.s5:
2f83 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
2f86 : 18 __ __ CLC
2f87 : 6d eb 50 ADC $50eb ; (vdc_state + 24)
2f8a : 85 43 __ STA T2 + 0 
2f8c : ad d7 50 LDA $50d7 ; (vdc_state + 4)
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
2fd0 : ad e3 50 LDA $50e3 ; (vdc_state + 16)
2fd3 : 85 0d __ STA P0 
2fd5 : ad e4 50 LDA $50e4 ; (vdc_state + 17)
2fd8 : 85 0e __ STA P1 
2fda : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
2fdd : a9 00 __ LDA #$00
2fdf : 85 1b __ STA ACCU + 0 
2fe1 : 85 43 __ STA T1 + 0 
2fe3 : a9 d0 __ LDA #$d0
2fe5 : 85 1c __ STA ACCU + 1 
2fe7 : a9 fe __ LDA #$fe
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
.s1007:
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
301c : e6 43 __ INC T1 + 0 
301e : d0 cb __ BNE $2feb ; (vdc_restore_charsets.l2 + 0)
.s1006:
3020 : e6 44 __ INC T1 + 1 
3022 : d0 c7 __ BNE $2feb ; (vdc_restore_charsets.l2 + 0)
.s1001:
3024 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
3025 : ad d3 50 LDA $50d3 ; (vdc_state + 0)
3028 : c9 10 __ CMP #$10
302a : f0 4d __ BEQ $3079 ; (vdc_set_extended_memsize.s1001 + 0)
.s4:
302c : ad d4 50 LDA $50d4 ; (vdc_state + 1)
302f : d0 48 __ BNE $3079 ; (vdc_set_extended_memsize.s1001 + 0)
.s3:
3031 : a9 22 __ LDA #$22
3033 : 8d 00 d6 STA $d600 
.l120:
3036 : 2c 00 d6 BIT $d600 
3039 : 10 fb __ BPL $3036 ; (vdc_set_extended_memsize.l120 + 0)
.s11:
303b : a9 80 __ LDA #$80
303d : 8d 01 d6 STA $d601 
3040 : 20 7a 30 JSR $307a ; (vdc_wipe_mem.s0 + 0)
3043 : a9 1c __ LDA #$1c
3045 : 8d 00 d6 STA $d600 
.l122:
3048 : 2c 00 d6 BIT $d600 
304b : 10 fb __ BPL $3048 ; (vdc_set_extended_memsize.l122 + 0)
.s17:
304d : ad 01 d6 LDA $d601 
3050 : 09 10 __ ORA #$10
3052 : a2 1c __ LDX #$1c
3054 : 8e 00 d6 STX $d600 
.l124:
3057 : 2c 00 d6 BIT $d600 
305a : 10 fb __ BPL $3057 ; (vdc_set_extended_memsize.l124 + 0)
.s23:
305c : 8d 01 d6 STA $d601 
305f : 20 d0 2f JSR $2fd0 ; (vdc_restore_charsets.s0 + 0)
3062 : 20 67 2c JSR $2c67 ; (vdc_cls.s0 + 0)
3065 : a9 22 __ LDA #$22
3067 : 8d 00 d6 STA $d600 
.l126:
306a : 2c 00 d6 BIT $d600 
306d : 10 fb __ BPL $306a ; (vdc_set_extended_memsize.l126 + 0)
.s29:
306f : a9 7d __ LDA #$7d
3071 : 8d 01 d6 STA $d601 
3074 : a9 01 __ LDA #$01
3076 : 8d d4 50 STA $50d4 ; (vdc_state + 1)
.s1001:
3079 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_wipe_mem: ; vdc_wipe_mem()->void
.s0:
307a : a9 00 __ LDA #$00
307c : 85 44 __ STA T0 + 1 
307e : 85 0d __ STA P0 
3080 : a9 ff __ LDA #$ff
3082 : 85 45 __ STA T1 + 0 
.l2:
3084 : 20 47 2d JSR $2d47 ; (vdc_mem_addr@proxy + 0)
.l252:
3087 : 2c 00 d6 BIT $d600 
308a : 10 fb __ BPL $3087 ; (vdc_wipe_mem.l252 + 0)
.s8:
308c : a9 00 __ LDA #$00
308e : 8d 01 d6 STA $d601 
3091 : a9 18 __ LDA #$18
3093 : 8d 00 d6 STA $d600 
.l254:
3096 : 2c 00 d6 BIT $d600 
3099 : 10 fb __ BPL $3096 ; (vdc_wipe_mem.l254 + 0)
.s14:
309b : ad 01 d6 LDA $d601 
309e : 29 7f __ AND #$7f
30a0 : a2 18 __ LDX #$18
30a2 : 8e 00 d6 STX $d600 
.l256:
30a5 : 2c 00 d6 BIT $d600 
30a8 : 10 fb __ BPL $30a5 ; (vdc_wipe_mem.l256 + 0)
.s20:
30aa : 8d 01 d6 STA $d601 
30ad : a9 1e __ LDA #$1e
30af : 8d 00 d6 STA $d600 
.l258:
30b2 : 2c 00 d6 BIT $d600 
30b5 : 10 fb __ BPL $30b2 ; (vdc_wipe_mem.l258 + 0)
.s25:
30b7 : e6 44 __ INC T0 + 1 
30b9 : a9 ff __ LDA #$ff
30bb : 8d 01 d6 STA $d601 
30be : c6 45 __ DEC T1 + 0 
30c0 : d0 c2 __ BNE $3084 ; (vdc_wipe_mem.l2 + 0)
.s4:
30c2 : 20 47 2d JSR $2d47 ; (vdc_mem_addr@proxy + 0)
.l261:
30c5 : 2c 00 d6 BIT $d600 
30c8 : 10 fb __ BPL $30c5 ; (vdc_wipe_mem.l261 + 0)
.s29:
30ca : a9 00 __ LDA #$00
30cc : 8d 01 d6 STA $d601 
30cf : a9 18 __ LDA #$18
30d1 : 8d 00 d6 STA $d600 
.l263:
30d4 : 2c 00 d6 BIT $d600 
30d7 : 10 fb __ BPL $30d4 ; (vdc_wipe_mem.l263 + 0)
.s35:
30d9 : ad 01 d6 LDA $d601 
30dc : 29 7f __ AND #$7f
30de : a2 18 __ LDX #$18
30e0 : 8e 00 d6 STX $d600 
.l265:
30e3 : 2c 00 d6 BIT $d600 
30e6 : 10 fb __ BPL $30e3 ; (vdc_wipe_mem.l265 + 0)
.s41:
30e8 : 8d 01 d6 STA $d601 
30eb : a9 1e __ LDA #$1e
30ed : 8d 00 d6 STA $d600 
.l267:
30f0 : 2c 00 d6 BIT $d600 
30f3 : 10 fb __ BPL $30f0 ; (vdc_wipe_mem.l267 + 0)
.s46:
30f5 : a9 ff __ LDA #$ff
30f7 : 8d 01 d6 STA $d601 
.s1001:
30fa : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_init: ; vdcwin_init(struct VDCWin*,u8,u8,u8,u8)->void
.s0:
30fb : a9 00 __ LDA #$00
30fd : a0 04 __ LDY #$04
30ff : 91 0d __ STA (P0),y ; (win + 0)
3101 : c8 __ __ INY
3102 : 91 0d __ STA (P0),y ; (win + 0)
3104 : a5 0f __ LDA P2 ; (sx + 0)
3106 : a0 00 __ LDY #$00
3108 : 91 0d __ STA (P0),y ; (win + 0)
310a : a5 10 __ LDA P3 ; (sy + 0)
310c : c8 __ __ INY
310d : 91 0d __ STA (P0),y ; (win + 0)
310f : a5 11 __ LDA P4 ; (wx + 0)
3111 : c8 __ __ INY
3112 : 91 0d __ STA (P0),y ; (win + 0)
3114 : a5 12 __ LDA P5 ; (wy + 0)
3116 : c8 __ __ INY
3117 : 91 0d __ STA (P0),y ; (win + 0)
3119 : 06 10 __ ASL P3 ; (sy + 0)
311b : a6 10 __ LDX P3 ; (sy + 0)
311d : bd 00 53 LDA $5300,x ; (multab + 0)
3120 : 18 __ __ CLC
3121 : 65 0f __ ADC P2 ; (sx + 0)
3123 : 85 1b __ STA ACCU + 0 
3125 : bd 01 53 LDA $5301,x ; (multab + 1)
3128 : 69 00 __ ADC #$00
312a : a8 __ __ TAY
312b : ad db 50 LDA $50db ; (vdc_state + 8)
312e : 18 __ __ CLC
312f : 65 1b __ ADC ACCU + 0 
3131 : 85 1b __ STA ACCU + 0 
3133 : 98 __ __ TYA
3134 : 6d dc 50 ADC $50dc ; (vdc_state + 9)
3137 : a0 07 __ LDY #$07
3139 : 91 0d __ STA (P0),y ; (win + 0)
313b : a5 1b __ LDA ACCU + 0 
313d : 88 __ __ DEY
313e : 91 0d __ STA (P0),y ; (win + 0)
3140 : bd 00 53 LDA $5300,x ; (multab + 0)
3143 : 18 __ __ CLC
3144 : 65 0f __ ADC P2 ; (sx + 0)
3146 : 85 1b __ STA ACCU + 0 
3148 : bd 01 53 LDA $5301,x ; (multab + 1)
314b : 69 00 __ ADC #$00
314d : aa __ __ TAX
314e : ad dd 50 LDA $50dd ; (vdc_state + 10)
3151 : 18 __ __ CLC
3152 : 65 1b __ ADC ACCU + 0 
3154 : 85 1b __ STA ACCU + 0 
3156 : 8a __ __ TXA
3157 : 6d de 50 ADC $50de ; (vdc_state + 11)
315a : a0 09 __ LDY #$09
315c : 91 0d __ STA (P0),y ; (win + 0)
315e : a5 1b __ LDA ACCU + 0 
3160 : 88 __ __ DEY
3161 : 91 0d __ STA (P0),y ; (win + 0)
.s1001:
3163 : 60 __ __ RTS
--------------------------------------------------------------------
updateMenu: ; updateMenu()->void
.s0:
3164 : a9 37 __ LDA #$37
3166 : 85 0f __ STA P2 
3168 : a9 04 __ LDA #$04
316a : 85 10 __ STA P3 
316c : a9 20 __ LDA #$20
316e : 85 11 __ STA P4 
3170 : a9 0e __ LDA #$0e
3172 : 85 12 __ STA P5 
3174 : a9 0a __ LDA #$0a
3176 : 85 13 __ STA P6 
3178 : ad ff 46 LDA $46ff ; (mc_menupopup + 0)
317b : 8d da 50 STA $50da ; (vdc_state + 7)
317e : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
3181 : a9 37 __ LDA #$37
3183 : 85 11 __ STA P4 
3185 : a9 05 __ LDA #$05
3187 : 85 12 __ STA P5 
3189 : a9 34 __ LDA #$34
318b : 85 13 __ STA P6 
318d : a9 46 __ LDA #$46
318f : 85 14 __ STA P7 
3191 : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
3194 : e6 12 __ INC P5 
3196 : a9 42 __ LDA #$42
3198 : 85 13 __ STA P6 
319a : a9 46 __ LDA #$46
319c : 85 14 __ STA P7 
319e : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
31a1 : e6 12 __ INC P5 
31a3 : a9 4d __ LDA #$4d
31a5 : 85 13 __ STA P6 
31a7 : a9 46 __ LDA #$46
31a9 : 85 14 __ STA P7 
31ab : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
31ae : e6 12 __ INC P5 
31b0 : a9 58 __ LDA #$58
31b2 : 85 13 __ STA P6 
31b4 : a9 46 __ LDA #$46
31b6 : 85 14 __ STA P7 
31b8 : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
31bb : e6 12 __ INC P5 
31bd : a9 60 __ LDA #$60
31bf : 85 13 __ STA P6 
31c1 : a9 46 __ LDA #$46
31c3 : 85 14 __ STA P7 
31c5 : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
31c8 : e6 12 __ INC P5 
31ca : a9 68 __ LDA #$68
31cc : 85 13 __ STA P6 
31ce : a9 46 __ LDA #$46
31d0 : 85 14 __ STA P7 
31d2 : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
31d5 : e6 12 __ INC P5 
31d7 : a9 77 __ LDA #$77
31d9 : 85 13 __ STA P6 
31db : a9 46 __ LDA #$46
31dd : 85 14 __ STA P7 
31df : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
31e2 : e6 12 __ INC P5 
31e4 : a9 84 __ LDA #$84
31e6 : 85 13 __ STA P6 
31e8 : a9 46 __ LDA #$46
31ea : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
31ec : a5 13 __ LDA P6 ; (string + 0)
31ee : 85 0d __ STA P0 
31f0 : 85 43 __ STA T0 + 0 
31f2 : a5 14 __ LDA P7 ; (string + 1)
31f4 : 85 0e __ STA P1 
31f6 : 85 44 __ STA T0 + 1 
31f8 : a5 12 __ LDA P5 ; (y + 0)
31fa : 0a __ __ ASL
31fb : aa __ __ TAX
31fc : bd 00 53 LDA $5300,x ; (multab + 0)
31ff : 85 46 __ STA T2 + 0 
3201 : bd 01 53 LDA $5301,x ; (multab + 1)
3204 : 85 47 __ STA T2 + 1 
3206 : ad da 50 LDA $50da ; (vdc_state + 7)
3209 : 85 48 __ STA T3 + 0 
320b : 20 34 33 JSR $3334 ; (strlen.s0 + 0)
320e : a5 1b __ LDA ACCU + 0 
3210 : d0 01 __ BNE $3213 ; (vdc_prints.s6 + 0)
.s1001:
3212 : 60 __ __ RTS
.s6:
3213 : c9 01 __ CMP #$01
3215 : d0 03 __ BNE $321a ; (vdc_prints.s10 + 0)
3217 : 4c 9c 32 JMP $329c ; (vdc_prints.s8 + 0)
.s10:
321a : 85 49 __ STA T4 + 0 
321c : 18 __ __ CLC
321d : a5 11 __ LDA P4 ; (x + 0)
321f : 65 46 __ ADC T2 + 0 
3221 : 85 46 __ STA T2 + 0 
3223 : 90 02 __ BCC $3227 ; (vdc_prints.s1021 + 0)
.s1020:
3225 : e6 47 __ INC T2 + 1 
.s1021:
3227 : 18 __ __ CLC
3228 : 6d db 50 ADC $50db ; (vdc_state + 8)
322b : 85 0d __ STA P0 
322d : ad dc 50 LDA $50dc ; (vdc_state + 9)
3230 : 65 47 __ ADC T2 + 1 
3232 : 85 0e __ STA P1 
3234 : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
3237 : a5 49 __ LDA T4 + 0 
3239 : f0 18 __ BEQ $3253 ; (vdc_prints.s15 + 0)
.s45:
323b : a0 00 __ LDY #$00
.l13:
323d : 84 45 __ STY T1 + 0 
323f : b1 43 __ LDA (T0 + 0),y 
3241 : 20 58 33 JSR $3358 ; (pet2screen.s0 + 0)
.l175:
3244 : 2c 00 d6 BIT $d600 
3247 : 10 fb __ BPL $3244 ; (vdc_prints.l175 + 0)
.s18:
3249 : 8d 01 d6 STA $d601 
324c : a4 45 __ LDY T1 + 0 
324e : c8 __ __ INY
324f : c4 49 __ CPY T4 + 0 
3251 : 90 ea __ BCC $323d ; (vdc_prints.l13 + 0)
.s15:
3253 : ad dd 50 LDA $50dd ; (vdc_state + 10)
3256 : 18 __ __ CLC
3257 : 65 46 __ ADC T2 + 0 
3259 : 85 0d __ STA P0 
325b : ad de 50 LDA $50de ; (vdc_state + 11)
325e : 65 47 __ ADC T2 + 1 
3260 : 85 0e __ STA P1 
3262 : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
3265 : a6 49 __ LDX T4 + 0 
3267 : ca __ __ DEX
.l178:
3268 : 2c 00 d6 BIT $d600 
326b : 10 fb __ BPL $3268 ; (vdc_prints.l178 + 0)
.s22:
326d : a5 48 __ LDA T3 + 0 
326f : 8d 01 d6 STA $d601 
3272 : a9 18 __ LDA #$18
3274 : 8d 00 d6 STA $d600 
.l180:
3277 : 2c 00 d6 BIT $d600 
327a : 10 fb __ BPL $3277 ; (vdc_prints.l180 + 0)
.s28:
327c : ad 01 d6 LDA $d601 
327f : 29 7f __ AND #$7f
3281 : a0 18 __ LDY #$18
3283 : 8c 00 d6 STY $d600 
.l182:
3286 : 2c 00 d6 BIT $d600 
3289 : 10 fb __ BPL $3286 ; (vdc_prints.l182 + 0)
.s34:
328b : 8d 01 d6 STA $d601 
328e : a9 1e __ LDA #$1e
3290 : 8d 00 d6 STA $d600 
.l184:
3293 : 2c 00 d6 BIT $d600 
3296 : 10 fb __ BPL $3293 ; (vdc_prints.l184 + 0)
.s39:
3298 : 8e 01 d6 STX $d601 
329b : 60 __ __ RTS
.s8:
329c : a5 11 __ LDA P4 ; (x + 0)
329e : 85 0d __ STA P0 
32a0 : a5 12 __ LDA P5 ; (y + 0)
32a2 : 85 0e __ STA P1 
32a4 : a5 48 __ LDA T3 + 0 
32a6 : 85 10 __ STA P3 
32a8 : a0 00 __ LDY #$00
32aa : b1 13 __ LDA (P6),y ; (string + 0)
32ac : 85 0f __ STA P2 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
32ae : a5 0e __ LDA P1 ; (y + 0)
32b0 : 0a __ __ ASL
32b1 : a2 12 __ LDX #$12
32b3 : 8e 00 d6 STX $d600 
32b6 : aa __ __ TAX
32b7 : 18 __ __ CLC
32b8 : a5 0d __ LDA P0 ; (x + 0)
32ba : 7d 00 53 ADC $5300,x ; (multab + 0)
32bd : 85 1b __ STA ACCU + 0 
32bf : a9 00 __ LDA #$00
32c1 : 7d 01 53 ADC $5301,x ; (multab + 1)
32c4 : 85 1c __ STA ACCU + 1 
32c6 : 18 __ __ CLC
32c7 : a5 1b __ LDA ACCU + 0 
32c9 : 6d db 50 ADC $50db ; (vdc_state + 8)
32cc : aa __ __ TAX
32cd : a5 1c __ LDA ACCU + 1 
32cf : 6d dc 50 ADC $50dc ; (vdc_state + 9)
.l167:
32d2 : 2c 00 d6 BIT $d600 
32d5 : 10 fb __ BPL $32d2 ; (vdc_printc.l167 + 0)
.s9:
32d7 : 8d 01 d6 STA $d601 
32da : a9 13 __ LDA #$13
32dc : 8d 00 d6 STA $d600 
.l169:
32df : 2c 00 d6 BIT $d600 
32e2 : 10 fb __ BPL $32df ; (vdc_printc.l169 + 0)
.s14:
32e4 : 8e 01 d6 STX $d601 
32e7 : a9 1f __ LDA #$1f
32e9 : 8d 00 d6 STA $d600 
.l171:
32ec : 2c 00 d6 BIT $d600 
32ef : 10 fb __ BPL $32ec ; (vdc_printc.l171 + 0)
.s18:
32f1 : a5 0f __ LDA P2 ; (val + 0)
32f3 : 8d 01 d6 STA $d601 
32f6 : ad dd 50 LDA $50dd ; (vdc_state + 10)
32f9 : 18 __ __ CLC
32fa : 65 1b __ ADC ACCU + 0 
32fc : a8 __ __ TAY
32fd : a9 12 __ LDA #$12
32ff : 8d 00 d6 STA $d600 
3302 : ad de 50 LDA $50de ; (vdc_state + 11)
3305 : 65 1c __ ADC ACCU + 1 
.l173:
3307 : 2c 00 d6 BIT $d600 
330a : 10 fb __ BPL $3307 ; (vdc_printc.l173 + 0)
.s25:
330c : 8d 01 d6 STA $d601 
330f : a9 13 __ LDA #$13
3311 : 8d 00 d6 STA $d600 
.l175:
3314 : 2c 00 d6 BIT $d600 
3317 : 10 fb __ BPL $3314 ; (vdc_printc.l175 + 0)
.s30:
3319 : 8c 01 d6 STY $d601 
331c : a9 1f __ LDA #$1f
331e : 8d 00 d6 STA $d600 
.l177:
3321 : 2c 00 d6 BIT $d600 
3324 : 10 fb __ BPL $3321 ; (vdc_printc.l177 + 0)
.s34:
3326 : a5 10 __ LDA P3 ; (attr + 0)
3328 : 8d 01 d6 STA $d601 
.s1001:
332b : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
332c : a5 17 __ LDA P10 
332e : 85 0d __ STA P0 
3330 : a5 18 __ LDA P11 
3332 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s0:
3334 : a9 00 __ LDA #$00
3336 : 85 1b __ STA ACCU + 0 
3338 : 85 1c __ STA ACCU + 1 
333a : a8 __ __ TAY
333b : b1 0d __ LDA (P0),y ; (str + 0)
333d : f0 18 __ BEQ $3357 ; (strlen.s1001 + 0)
.s2:
333f : a5 0d __ LDA P0 ; (str + 0)
3341 : 85 1b __ STA ACCU + 0 
3343 : a2 00 __ LDX #$00
.l1002:
3345 : c8 __ __ INY
3346 : d0 01 __ BNE $3349 ; (strlen.s1005 + 0)
.s1004:
3348 : e8 __ __ INX
.s1005:
3349 : 8a __ __ TXA
334a : 18 __ __ CLC
334b : 65 0e __ ADC P1 ; (str + 1)
334d : 85 1c __ STA ACCU + 1 
334f : b1 1b __ LDA (ACCU + 0),y 
3351 : d0 f2 __ BNE $3345 ; (strlen.l1002 + 0)
.s1003:
3353 : 86 1c __ STX ACCU + 1 
3355 : 84 1b __ STY ACCU + 0 
.s1001:
3357 : 60 __ __ RTS
--------------------------------------------------------------------
pet2screen: ; pet2screen(u8)->u8
.s0:
3358 : c9 20 __ CMP #$20
335a : b0 03 __ BCS $335f ; (pet2screen.s2 + 0)
.s1:
335c : 69 80 __ ADC #$80
335e : 60 __ __ RTS
.s2:
335f : c9 40 __ CMP #$40
3361 : 90 27 __ BCC $338a ; (pet2screen.s21 + 0)
.s7:
3363 : c9 60 __ CMP #$60
3365 : 90 17 __ BCC $337e ; (pet2screen.s4 + 0)
.s11:
3367 : 09 00 __ ORA #$00
3369 : 30 04 __ BMI $336f ; (pet2screen.s9 + 0)
.s8:
336b : 38 __ __ SEC
336c : e9 20 __ SBC #$20
336e : 60 __ __ RTS
.s9:
336f : c9 80 __ CMP #$80
3371 : 90 17 __ BCC $338a ; (pet2screen.s21 + 0)
.s15:
3373 : c9 a0 __ CMP #$a0
3375 : b0 03 __ BCS $337a ; (pet2screen.s19 + 0)
.s12:
3377 : 69 40 __ ADC #$40
3379 : 60 __ __ RTS
.s19:
337a : c9 c0 __ CMP #$c0
337c : b0 04 __ BCS $3382 ; (pet2screen.s23 + 0)
.s4:
337e : 38 __ __ SEC
337f : e9 40 __ SBC #$40
3381 : 60 __ __ RTS
.s23:
3382 : c9 ff __ CMP #$ff
3384 : b0 04 __ BCS $338a ; (pet2screen.s21 + 0)
.s20:
3386 : 38 __ __ SEC
3387 : e9 80 __ SBC #$80
3389 : 60 __ __ RTS
.s21:
338a : c9 ff __ CMP #$ff
338c : d0 02 __ BNE $3390 ; (pet2screen.s1001 + 0)
.s24:
338e : a9 5e __ LDA #$5e
.s1001:
3390 : 60 __ __ RTS
--------------------------------------------------------------------
3391 : __ __ __ BYT 76 64 63 73 65 20 2d 20 70 72 67 20 67 45 4e 45 : vdcse - prg gENE
33a1 : __ __ __ BYT 52 41 54 4f 52 2e 00                            : RATOR..
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
33a8 : a9 00 __ LDA #$00
33aa : 8d fc bf STA $bffc ; (sstack + 4)
33ad : a0 02 __ LDY #$02
33af : b1 23 __ LDA (SP + 0),y 
33b1 : 85 16 __ STA P9 
33b3 : c8 __ __ INY
33b4 : b1 23 __ LDA (SP + 0),y 
33b6 : 85 17 __ STA P10 
33b8 : c8 __ __ INY
33b9 : b1 23 __ LDA (SP + 0),y 
33bb : 8d f8 bf STA $bff8 ; (sstack + 0)
33be : c8 __ __ INY
33bf : b1 23 __ LDA (SP + 0),y 
33c1 : 8d f9 bf STA $bff9 ; (sstack + 1)
33c4 : 18 __ __ CLC
33c5 : a5 23 __ LDA SP + 0 
33c7 : 69 06 __ ADC #$06
33c9 : 8d fa bf STA $bffa ; (sstack + 2)
33cc : a5 24 __ LDA SP + 1 
33ce : 69 00 __ ADC #$00
33d0 : 8d fb bf STA $bffb ; (sstack + 3)
33d3 : 4c 03 23 JMP $2303 ; (sformat.s1000 + 0)
--------------------------------------------------------------------
33d6 : __ __ __ BYT 77 52 49 54 54 45 4e 20 49 4e 20 32 30 32 34 20 : wRITTEN IN 2024 
33e6 : __ __ __ BYT 42 59 20 78 41 4e 44 45 52 20 6d 4f 4c 2c 20 56 : BY xANDER mOL, V
33f6 : __ __ __ BYT 45 52 53 49 4f 4e 20 25 53 00                   : ERSION %S.
--------------------------------------------------------------------
3400 : __ __ __ BYT 56 32 30 2d 32 30 32 34 30 34 31 33 2d 32 33 35 : V20-20240413-235
3410 : __ __ __ BYT 30 00                                           : 0.
--------------------------------------------------------------------
filepicker: ; filepicker(u8)->void
.s1000:
3412 : a2 05 __ LDX #$05
3414 : b5 53 __ LDA T0 + 0,x 
3416 : 9d cd bf STA $bfcd,x ; (buff + 35)
3419 : ca __ __ DEX
341a : 10 f8 __ BPL $3414 ; (filepicker.s1000 + 2)
.s0:
341c : a9 0a __ LDA #$0a
341e : 85 0f __ STA P2 
3420 : a9 02 __ LDA #$02
3422 : 85 10 __ STA P3 
3424 : a9 20 __ LDA #$20
3426 : 85 11 __ STA P4 
3428 : a9 3c __ LDA #$3c
342a : 85 12 __ STA P5 
342c : a9 14 __ LDA #$14
342e : 85 13 __ STA P6 
3430 : a9 00 __ LDA #$00
3432 : a2 21 __ LDX #$21
.l1002:
3434 : ca __ __ DEX
3435 : 9d d8 51 STA $51d8,x ; (cwd + 0)
3438 : d0 fa __ BNE $3434 ; (filepicker.l1002 + 0)
.s1003:
343a : 8d f9 51 STA $51f9 ; (disk_id_buf + 0)
343d : 8d fa 51 STA $51fa ; (disk_id_buf + 1)
3440 : 8d fb 51 STA $51fb ; (disk_id_buf + 2)
3443 : 8d fc 51 STA $51fc ; (disk_id_buf + 3)
3446 : 8d fd 51 STA $51fd ; (disk_id_buf + 4)
3449 : a2 15 __ LDX #$15
.l1004:
344b : ca __ __ DEX
344c : 9d 9e 50 STA $509e,x ; (filename + 0)
344f : d0 fa __ BNE $344b ; (filepicker.l1004 + 0)
.s1005:
3451 : ad ff 46 LDA $46ff ; (mc_menupopup + 0)
3454 : 85 53 __ STA T0 + 0 
3456 : 8d da 50 STA $50da ; (vdc_state + 7)
3459 : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
345c : a9 0b __ LDA #$0b
345e : 85 11 __ STA P4 
3460 : a9 03 __ LDA #$03
3462 : 85 12 __ STA P5 
3464 : a5 53 __ LDA T0 + 0 
3466 : 09 20 __ ORA #$20
3468 : 85 54 __ STA T1 + 0 
346a : 8d da 50 STA $50da ; (vdc_state + 7)
346d : a9 17 __ LDA #$17
346f : 85 13 __ STA P6 
3471 : a9 39 __ LDA #$39
3473 : 85 14 __ STA P7 
3475 : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
3478 : a5 54 __ LDA T1 + 0 
347a : 29 df __ AND #$df
347c : 8d da 50 STA $50da ; (vdc_state + 7)
347f : ad d2 50 LDA $50d2 ; (targetdevice + 0)
3482 : 8d ff bf STA $bfff ; (sstack + 7)
3485 : 20 2f 39 JSR $392f ; (refreshDir.s0 + 0)
3488 : 20 64 31 JSR $3164 ; (updateMenu.s0 + 0)
.l3:
348b : ad f1 51 LDA $51f1 ; (cwd + 25)
348e : 85 54 __ STA T1 + 0 
3490 : 8d d1 52 STA $52d1 ; (current + 0)
3493 : ad f2 51 LDA $51f2 ; (cwd + 26)
3496 : 85 55 __ STA T1 + 1 
3498 : 8d d2 52 STA $52d2 ; (current + 1)
349b : ad f5 51 LDA $51f5 ; (cwd + 29)
349e : 85 56 __ STA T2 + 0 
34a0 : ad f6 51 LDA $51f6 ; (cwd + 30)
34a3 : 85 57 __ STA T2 + 1 
34a5 : 20 8f 46 JSR $468f ; (vdcwin_getch.s0 + 0)
34a8 : a5 1b __ LDA ACCU + 0 
34aa : 85 43 __ STA T3 + 0 
34ac : a5 1c __ LDA ACCU + 1 
34ae : 85 44 __ STA T3 + 1 
34b0 : d0 09 __ BNE $34bb ; (filepicker.s89 + 0)
.s1058:
34b2 : a5 1b __ LDA ACCU + 0 
34b4 : c9 32 __ CMP #$32
34b6 : d0 03 __ BNE $34bb ; (filepicker.s89 + 0)
34b8 : 4c 79 36 JMP $3679 ; (filepicker.s7 + 0)
.s89:
34bb : a5 56 __ LDA T2 + 0 
34bd : 85 1b __ STA ACCU + 0 
34bf : a5 57 __ LDA T2 + 1 
34c1 : 85 1c __ STA ACCU + 1 
34c3 : a9 0e __ LDA #$0e
34c5 : 85 03 __ STA WORK + 0 
34c7 : a9 00 __ LDA #$00
34c9 : 85 04 __ STA WORK + 1 
34cb : 20 d5 4c JSR $4cd5 ; (divmod + 0)
34ce : a5 1b __ LDA ACCU + 0 
34d0 : 85 45 __ STA T4 + 0 
34d2 : 0a __ __ ASL
34d3 : 0a __ __ ASL
34d4 : 0a __ __ ASL
34d5 : 38 __ __ SEC
34d6 : e5 1b __ SBC ACCU + 0 
34d8 : 0a __ __ ASL
34d9 : 49 ff __ EOR #$ff
34db : 38 __ __ SEC
34dc : 65 56 __ ADC T2 + 0 
34de : 85 58 __ STA T5 + 0 
34e0 : 18 __ __ CLC
34e1 : 69 06 __ ADC #$06
34e3 : 85 47 __ STA T6 + 0 
34e5 : a5 44 __ LDA T3 + 1 
34e7 : 10 03 __ BPL $34ec ; (filepicker.s1057 + 0)
34e9 : 4c d5 37 JMP $37d5 ; (filepicker.s91 + 0)
.s1057:
34ec : d0 09 __ BNE $34f7 ; (filepicker.s90 + 0)
.s1056:
34ee : a5 43 __ LDA T3 + 0 
34f0 : c9 32 __ CMP #$32
34f2 : b0 03 __ BCS $34f7 ; (filepicker.s90 + 0)
34f4 : 4c d5 37 JMP $37d5 ; (filepicker.s91 + 0)
.s90:
34f7 : a5 44 __ LDA T3 + 1 
34f9 : d0 90 __ BNE $348b ; (filepicker.l3 + 0)
.s1032:
34fb : a5 43 __ LDA T3 + 0 
34fd : c9 55 __ CMP #$55
34ff : d0 6f __ BNE $3570 ; (filepicker.s1031 + 0)
.s76:
3501 : ad ef 51 LDA $51ef ; (cwd + 23)
3504 : 0d f0 51 ORA $51f0 ; (cwd + 24)
3507 : f0 82 __ BEQ $348b ; (filepicker.l3 + 0)
.s80:
3509 : a0 17 __ LDY #$17
350b : b1 54 __ LDA (T1 + 0),y 
350d : c8 __ __ INY
350e : 11 54 __ ORA (T1 + 0),y 
3510 : d0 03 __ BNE $3515 ; (filepicker.s77 + 0)
3512 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s77:
3515 : a5 47 __ LDA T6 + 0 
3517 : 8d fd bf STA $bffd ; (sstack + 5)
351a : a9 00 __ LDA #$00
351c : 8d f1 51 STA $51f1 ; (cwd + 25)
351f : 8d f2 51 STA $51f2 ; (cwd + 26)
3522 : 20 2f 44 JSR $442f ; (printElementPriv.s1000 + 0)
3525 : a2 0e __ LDX #$0e
.l82:
3527 : ad d1 52 LDA $52d1 ; (current + 0)
352a : 85 54 __ STA T1 + 0 
352c : ad d2 52 LDA $52d2 ; (current + 1)
352f : 85 55 __ STA T1 + 1 
3531 : a0 17 __ LDY #$17
3533 : b1 54 __ LDA (T1 + 0),y 
3535 : 85 02 __ STA $02 
3537 : c8 __ __ INY
3538 : b1 54 __ LDA (T1 + 0),y 
353a : a8 __ __ TAY
353b : 05 02 __ ORA $02 
353d : f0 22 __ BEQ $3561 ; (filepicker.s172 + 0)
.s85:
353f : 8c d2 52 STY $52d2 ; (current + 1)
3542 : 8c f2 51 STY $51f2 ; (cwd + 26)
3545 : 8c f4 51 STY $51f4 ; (cwd + 28)
3548 : a5 02 __ LDA $02 
354a : 8d d1 52 STA $52d1 ; (current + 0)
354d : 8d f1 51 STA $51f1 ; (cwd + 25)
3550 : 8d f3 51 STA $51f3 ; (cwd + 27)
3553 : ad f5 51 LDA $51f5 ; (cwd + 29)
3556 : 18 __ __ CLC
3557 : 69 ff __ ADC #$ff
3559 : 8d f5 51 STA $51f5 ; (cwd + 29)
355c : b0 03 __ BCS $3561 ; (filepicker.s172 + 0)
.s1063:
355e : ce f6 51 DEC $51f6 ; (cwd + 30)
.s172:
3561 : ca __ __ DEX
3562 : d0 c3 __ BNE $3527 ; (filepicker.l82 + 0)
.s228:
3564 : ad d2 50 LDA $50d2 ; (targetdevice + 0)
3567 : 8d fe bf STA $bffe ; (sstack + 6)
356a : 20 6a 39 JSR $396a ; (printDir.s1000 + 0)
356d : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s1031:
3570 : b0 03 __ BCS $3575 ; (filepicker.s1018 + 0)
3572 : 4c 95 36 JMP $3695 ; (filepicker.s107 + 0)
.s1018:
3575 : c9 89 __ CMP #$89
3577 : d0 03 __ BNE $357c ; (filepicker.s1013 + 0)
3579 : 4c 79 36 JMP $3679 ; (filepicker.s7 + 0)
.s1013:
357c : b0 13 __ BCS $3591 ; (filepicker.s1010 + 0)
.s115:
357e : c9 85 __ CMP #$85
3580 : f0 03 __ BEQ $3585 ; (filepicker.s227 + 0)
3582 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s227:
3585 : ad d2 50 LDA $50d2 ; (targetdevice + 0)
3588 : 8d ff bf STA $bfff ; (sstack + 7)
358b : 20 2f 39 JSR $392f ; (refreshDir.s0 + 0)
358e : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s1010:
3591 : c9 91 __ CMP #$91
3593 : f0 03 __ BEQ $3598 ; (filepicker.s43 + 0)
3595 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s43:
3598 : ad ef 51 LDA $51ef ; (cwd + 23)
359b : 0d f0 51 ORA $51f0 ; (cwd + 24)
359e : d0 03 __ BNE $35a3 ; (filepicker.s48 + 0)
35a0 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s48:
35a3 : a5 54 __ LDA T1 + 0 
35a5 : 05 55 __ ORA T1 + 1 
35a7 : d0 03 __ BNE $35ac ; (filepicker.s47 + 0)
35a9 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s47:
35ac : a0 17 __ LDY #$17
35ae : b1 54 __ LDA (T1 + 0),y 
35b0 : 85 02 __ STA $02 
35b2 : c8 __ __ INY
35b3 : b1 54 __ LDA (T1 + 0),y 
35b5 : 85 55 __ STA T1 + 1 
35b7 : 05 02 __ ORA $02 
35b9 : d0 03 __ BNE $35be ; (filepicker.s44 + 0)
35bb : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s44:
35be : a5 02 __ LDA $02 
35c0 : 8d d1 52 STA $52d1 ; (current + 0)
35c3 : 8d f1 51 STA $51f1 ; (cwd + 25)
35c6 : a5 55 __ LDA T1 + 1 
35c8 : 8d d2 52 STA $52d2 ; (current + 1)
35cb : 8d f2 51 STA $51f2 ; (cwd + 26)
35ce : 18 __ __ CLC
35cf : a5 56 __ LDA T2 + 0 
35d1 : 69 ff __ ADC #$ff
35d3 : 8d f5 51 STA $51f5 ; (cwd + 29)
35d6 : a5 57 __ LDA T2 + 1 
35d8 : 69 ff __ ADC #$ff
35da : 8d f6 51 STA $51f6 ; (cwd + 30)
35dd : 38 __ __ SEC
35de : a5 56 __ LDA T2 + 0 
35e0 : e9 01 __ SBC #$01
35e2 : 85 1b __ STA ACCU + 0 
35e4 : a5 57 __ LDA T2 + 1 
35e6 : e9 00 __ SBC #$00
35e8 : 85 1c __ STA ACCU + 1 
35ea : a9 0e __ LDA #$0e
35ec : 85 03 __ STA WORK + 0 
35ee : a9 00 __ LDA #$00
35f0 : 85 04 __ STA WORK + 1 
35f2 : 20 d5 4c JSR $4cd5 ; (divmod + 0)
35f5 : a5 45 __ LDA T4 + 0 
35f7 : c5 1b __ CMP ACCU + 0 
35f9 : f0 40 __ BEQ $363b ; (filepicker.s50 + 0)
.s49:
35fb : a9 0d __ LDA #$0d
35fd : 85 53 __ STA T0 + 0 
.l53:
35ff : ad d1 52 LDA $52d1 ; (current + 0)
3602 : 85 56 __ STA T2 + 0 
3604 : ad d2 52 LDA $52d2 ; (current + 1)
3607 : 85 57 __ STA T2 + 1 
3609 : a0 17 __ LDY #$17
360b : b1 56 __ LDA (T2 + 0),y 
360d : aa __ __ TAX
360e : c8 __ __ INY
360f : b1 56 __ LDA (T2 + 0),y 
3611 : 85 57 __ STA T2 + 1 
3613 : d0 03 __ BNE $3618 ; (filepicker.s56 + 0)
.s1006:
3615 : 8a __ __ TXA
3616 : f0 08 __ BEQ $3620 ; (filepicker.s174 + 0)
.s56:
3618 : 8e d1 52 STX $52d1 ; (current + 0)
361b : a5 57 __ LDA T2 + 1 
361d : 8d d2 52 STA $52d2 ; (current + 1)
.s174:
3620 : c6 53 __ DEC T0 + 0 
3622 : d0 db __ BNE $35ff ; (filepicker.l53 + 0)
.s55:
3624 : ad d1 52 LDA $52d1 ; (current + 0)
3627 : 85 54 __ STA T1 + 0 
3629 : ad d2 52 LDA $52d2 ; (current + 1)
362c : 85 55 __ STA T1 + 1 
.s230:
362e : a5 54 __ LDA T1 + 0 
3630 : 8d f3 51 STA $51f3 ; (cwd + 27)
3633 : a5 55 __ LDA T1 + 1 
3635 : 8d f4 51 STA $51f4 ; (cwd + 28)
3638 : 4c 64 35 JMP $3564 ; (filepicker.s228 + 0)
.s50:
363b : a5 02 __ LDA $02 
363d : 85 54 __ STA T1 + 0 
363f : a5 47 __ LDA T6 + 0 
3641 : 8d fd bf STA $bffd ; (sstack + 5)
3644 : a0 15 __ LDY #$15
3646 : b1 54 __ LDA (T1 + 0),y 
3648 : 8d d1 52 STA $52d1 ; (current + 0)
364b : c8 __ __ INY
364c : b1 54 __ LDA (T1 + 0),y 
364e : 8d d2 52 STA $52d2 ; (current + 1)
3651 : 20 2f 44 JSR $442f ; (printElementPriv.s1000 + 0)
3654 : ad d1 52 LDA $52d1 ; (current + 0)
3657 : 85 54 __ STA T1 + 0 
3659 : ad d2 52 LDA $52d2 ; (current + 1)
365c : 85 55 __ STA T1 + 1 
365e : a0 17 __ LDY #$17
3660 : b1 54 __ LDA (T1 + 0),y 
3662 : 8d d1 52 STA $52d1 ; (current + 0)
3665 : c8 __ __ INY
3666 : b1 54 __ LDA (T1 + 0),y 
3668 : 8d d2 52 STA $52d2 ; (current + 1)
366b : 18 __ __ CLC
366c : a5 58 __ LDA T5 + 0 
366e : 69 05 __ ADC #$05
.s229:
3670 : 8d fd bf STA $bffd ; (sstack + 5)
3673 : 20 2f 44 JSR $442f ; (printElementPriv.s1000 + 0)
3676 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s7:
3679 : ee d2 50 INC $50d2 ; (targetdevice + 0)
367c : ad d2 50 LDA $50d2 ; (targetdevice + 0)
367f : c9 1f __ CMP #$1f
3681 : 90 05 __ BCC $3688 ; (filepicker.s10 + 0)
.s8:
3683 : a9 08 __ LDA #$08
.s1059:
3685 : 8d d2 50 STA $50d2 ; (targetdevice + 0)
.s10:
3688 : a9 00 __ LDA #$00
368a : a2 21 __ LDX #$21
.l1014:
368c : ca __ __ DEX
368d : 9d d8 51 STA $51d8,x ; (cwd + 0)
3690 : d0 fa __ BNE $368c ; (filepicker.l1014 + 0)
3692 : 4c 85 35 JMP $3585 ; (filepicker.s227 + 0)
.s107:
3695 : c9 50 __ CMP #$50
3697 : d0 63 __ BNE $36fc ; (filepicker.s108 + 0)
.s64:
3699 : ad ef 51 LDA $51ef ; (cwd + 23)
369c : 0d f0 51 ORA $51f0 ; (cwd + 24)
369f : d0 03 __ BNE $36a4 ; (filepicker.s68 + 0)
36a1 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s68:
36a4 : a0 15 __ LDY #$15
36a6 : b1 54 __ LDA (T1 + 0),y 
36a8 : c8 __ __ INY
36a9 : 11 54 __ ORA (T1 + 0),y 
36ab : d0 03 __ BNE $36b0 ; (filepicker.s65 + 0)
36ad : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s65:
36b0 : a5 47 __ LDA T6 + 0 
36b2 : 8d fd bf STA $bffd ; (sstack + 5)
36b5 : a9 00 __ LDA #$00
36b7 : 8d f1 51 STA $51f1 ; (cwd + 25)
36ba : 8d f2 51 STA $51f2 ; (cwd + 26)
36bd : 20 2f 44 JSR $442f ; (printElementPriv.s1000 + 0)
36c0 : a2 0e __ LDX #$0e
.l70:
36c2 : ad d1 52 LDA $52d1 ; (current + 0)
36c5 : 85 54 __ STA T1 + 0 
36c7 : ad d2 52 LDA $52d2 ; (current + 1)
36ca : 85 55 __ STA T1 + 1 
36cc : a0 15 __ LDY #$15
36ce : b1 54 __ LDA (T1 + 0),y 
36d0 : 85 02 __ STA $02 
36d2 : c8 __ __ INY
36d3 : b1 54 __ LDA (T1 + 0),y 
36d5 : a8 __ __ TAY
36d6 : 05 02 __ ORA $02 
36d8 : f0 1c __ BEQ $36f6 ; (filepicker.s173 + 0)
.s73:
36da : 8c d2 52 STY $52d2 ; (current + 1)
36dd : 8c f2 51 STY $51f2 ; (cwd + 26)
36e0 : 8c f4 51 STY $51f4 ; (cwd + 28)
36e3 : a5 02 __ LDA $02 
36e5 : 8d d1 52 STA $52d1 ; (current + 0)
36e8 : 8d f1 51 STA $51f1 ; (cwd + 25)
36eb : 8d f3 51 STA $51f3 ; (cwd + 27)
36ee : ee f5 51 INC $51f5 ; (cwd + 29)
36f1 : d0 03 __ BNE $36f6 ; (filepicker.s173 + 0)
.s1065:
36f3 : ee f6 51 INC $51f6 ; (cwd + 30)
.s173:
36f6 : ca __ __ DEX
36f7 : d0 c9 __ BNE $36c2 ; (filepicker.l70 + 0)
36f9 : 4c 64 35 JMP $3564 ; (filepicker.s228 + 0)
.s108:
36fc : 90 03 __ BCC $3701 ; (filepicker.s110 + 0)
36fe : 4c aa 37 JMP $37aa ; (filepicker.s109 + 0)
.s110:
3701 : c9 45 __ CMP #$45
3703 : f0 03 __ BEQ $3708 ; (filepicker.s19 + 0)
3705 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s19:
3708 : ad ef 51 LDA $51ef ; (cwd + 23)
370b : 0d f0 51 ORA $51f0 ; (cwd + 24)
370e : d0 03 __ BNE $3713 ; (filepicker.s20 + 0)
3710 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s20:
3713 : ad ef 51 LDA $51ef ; (cwd + 23)
3716 : 8d d1 52 STA $52d1 ; (current + 0)
3719 : ad f0 51 LDA $51f0 ; (cwd + 24)
371c : 8d d2 52 STA $52d2 ; (current + 1)
371f : a9 00 __ LDA #$00
3721 : 85 54 __ STA T1 + 0 
3723 : 85 55 __ STA T1 + 1 
.l24:
3725 : ad d1 52 LDA $52d1 ; (current + 0)
3728 : 85 43 __ STA T3 + 0 
372a : ad d2 52 LDA $52d2 ; (current + 1)
372d : 85 44 __ STA T3 + 1 
372f : a0 15 __ LDY #$15
3731 : b1 43 __ LDA (T3 + 0),y 
3733 : 85 45 __ STA T4 + 0 
3735 : c8 __ __ INY
3736 : b1 43 __ LDA (T3 + 0),y 
3738 : 85 46 __ STA T4 + 1 
373a : d0 18 __ BNE $3754 ; (filepicker.s26 + 0)
.s1023:
373c : a5 45 __ LDA T4 + 0 
373e : d0 14 __ BNE $3754 ; (filepicker.s26 + 0)
.s25:
3740 : a5 43 __ LDA T3 + 0 
3742 : 8d f1 51 STA $51f1 ; (cwd + 25)
3745 : a5 44 __ LDA T3 + 1 
3747 : 8d f2 51 STA $51f2 ; (cwd + 26)
374a : a5 54 __ LDA T1 + 0 
374c : 8d f5 51 STA $51f5 ; (cwd + 29)
374f : a5 55 __ LDA T1 + 1 
3751 : 4c a4 37 JMP $37a4 ; (filepicker.s1060 + 0)
.s26:
3754 : a5 45 __ LDA T4 + 0 
3756 : 8d d1 52 STA $52d1 ; (current + 0)
3759 : a5 46 __ LDA T4 + 1 
375b : 8d d2 52 STA $52d2 ; (current + 1)
375e : a5 54 __ LDA T1 + 0 
3760 : 85 1b __ STA ACCU + 0 
3762 : a5 55 __ LDA T1 + 1 
3764 : 85 1c __ STA ACCU + 1 
3766 : a9 0e __ LDA #$0e
3768 : 85 03 __ STA WORK + 0 
376a : a9 00 __ LDA #$00
376c : 85 04 __ STA WORK + 1 
376e : 20 d5 4c JSR $4cd5 ; (divmod + 0)
3771 : a5 1b __ LDA ACCU + 0 
3773 : 85 56 __ STA T2 + 0 
3775 : 18 __ __ CLC
3776 : a5 54 __ LDA T1 + 0 
3778 : 69 01 __ ADC #$01
377a : 85 54 __ STA T1 + 0 
377c : 85 1b __ STA ACCU + 0 
377e : a5 55 __ LDA T1 + 1 
3780 : 69 00 __ ADC #$00
3782 : 85 55 __ STA T1 + 1 
3784 : 85 1c __ STA ACCU + 1 
3786 : a9 0e __ LDA #$0e
3788 : 85 03 __ STA WORK + 0 
378a : a9 00 __ LDA #$00
378c : 85 04 __ STA WORK + 1 
378e : 20 d5 4c JSR $4cd5 ; (divmod + 0)
3791 : a5 56 __ LDA T2 + 0 
3793 : c5 1b __ CMP ACCU + 0 
3795 : f0 8e __ BEQ $3725 ; (filepicker.l24 + 0)
.s29:
3797 : a5 45 __ LDA T4 + 0 
3799 : 8d f3 51 STA $51f3 ; (cwd + 27)
379c : a5 46 __ LDA T4 + 1 
379e : 8d f4 51 STA $51f4 ; (cwd + 28)
37a1 : 4c 25 37 JMP $3725 ; (filepicker.l24 + 0)
.s1060:
37a4 : 8d f6 51 STA $51f6 ; (cwd + 30)
37a7 : 4c 64 35 JMP $3564 ; (filepicker.s228 + 0)
.s109:
37aa : c9 54 __ CMP #$54
37ac : f0 03 __ BEQ $37b1 ; (filepicker.s15 + 0)
37ae : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s15:
37b1 : ad ef 51 LDA $51ef ; (cwd + 23)
37b4 : 0d f0 51 ORA $51f0 ; (cwd + 24)
37b7 : d0 03 __ BNE $37bc ; (filepicker.s16 + 0)
37b9 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s16:
37bc : ad ef 51 LDA $51ef ; (cwd + 23)
37bf : 8d f1 51 STA $51f1 ; (cwd + 25)
37c2 : 8d f3 51 STA $51f3 ; (cwd + 27)
37c5 : ad f0 51 LDA $51f0 ; (cwd + 24)
37c8 : 8d f2 51 STA $51f2 ; (cwd + 26)
37cb : 8d f4 51 STA $51f4 ; (cwd + 28)
37ce : a9 00 __ LDA #$00
37d0 : 8d f5 51 STA $51f5 ; (cwd + 29)
37d3 : f0 cf __ BEQ $37a4 ; (filepicker.s1060 + 0)
.s91:
37d5 : a5 44 __ LDA T3 + 1 
37d7 : d0 06 __ BNE $37df ; (filepicker.s92 + 0)
.s1055:
37d9 : a5 43 __ LDA T3 + 0 
37db : c9 13 __ CMP #$13
37dd : f0 d2 __ BEQ $37b1 ; (filepicker.s15 + 0)
.s92:
37df : a5 44 __ LDA T3 + 1 
37e1 : 30 51 __ BMI $3834 ; (filepicker.s94 + 0)
.s1054:
37e3 : d0 06 __ BNE $37eb ; (filepicker.s93 + 0)
.s1053:
37e5 : a5 43 __ LDA T3 + 0 
37e7 : c9 13 __ CMP #$13
37e9 : 90 49 __ BCC $3834 ; (filepicker.s94 + 0)
.s93:
37eb : a5 43 __ LDA T3 + 0 
37ed : c9 2b __ CMP #$2b
37ef : d0 03 __ BNE $37f4 ; (filepicker.s100 + 0)
37f1 : 4c 79 36 JMP $3679 ; (filepicker.s7 + 0)
.s100:
37f4 : b0 25 __ BCS $381b ; (filepicker.s101 + 0)
.s102:
37f6 : c9 1b __ CMP #$1b
37f8 : f0 03 __ BEQ $37fd ; (filepicker.s4 + 0)
37fa : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s4:
37fd : ad d8 51 LDA $51d8 ; (cwd + 0)
3800 : f0 03 __ BEQ $3805 ; (filepicker.s120 + 0)
.s118:
3802 : 20 9d 46 JSR $469d ; (freeDir.s0 + 0)
.s120:
3805 : a9 02 __ LDA #$02
3807 : 85 10 __ STA P3 
3809 : a9 14 __ LDA #$14
380b : 85 13 __ STA P6 
380d : 20 3f 50 JSR $503f ; (vdc_clear@proxy + 0)
.s1001:
3810 : a2 05 __ LDX #$05
3812 : bd cd bf LDA $bfcd,x ; (buff + 35)
3815 : 95 53 __ STA T0 + 0,x 
3817 : ca __ __ DEX
3818 : 10 f8 __ BPL $3812 ; (filepicker.s1001 + 2)
381a : 60 __ __ RTS
.s101:
381b : c9 2d __ CMP #$2d
381d : f0 03 __ BEQ $3822 ; (filepicker.s11 + 0)
381f : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s11:
3822 : ce d2 50 DEC $50d2 ; (targetdevice + 0)
3825 : ad d2 50 LDA $50d2 ; (targetdevice + 0)
3828 : c9 08 __ CMP #$08
382a : 90 03 __ BCC $382f ; (filepicker.s12 + 0)
382c : 4c 88 36 JMP $3688 ; (filepicker.s10 + 0)
.s12:
382f : a9 1e __ LDA #$1e
3831 : 4c 85 36 JMP $3685 ; (filepicker.s1059 + 0)
.s94:
3834 : a5 44 __ LDA T3 + 1 
3836 : d0 27 __ BNE $385f ; (filepicker.s95 + 0)
.s1052:
3838 : a5 43 __ LDA T3 + 0 
383a : c9 0d __ CMP #$0d
383c : d0 21 __ BNE $385f ; (filepicker.s95 + 0)
.s59:
383e : ad ef 51 LDA $51ef ; (cwd + 23)
3841 : 0d f0 51 ORA $51f0 ; (cwd + 24)
3844 : d0 03 __ BNE $3849 ; (filepicker.s63 + 0)
3846 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s63:
3849 : a5 54 __ LDA T1 + 0 
384b : 05 55 __ ORA T1 + 1 
384d : d0 03 __ BNE $3852 ; (filepicker.s60 + 0)
384f : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s60:
3852 : a0 ff __ LDY #$ff
.l1050:
3854 : c8 __ __ INY
3855 : b1 54 __ LDA (T1 + 0),y 
3857 : 99 9e 50 STA $509e,y ; (filename + 0)
385a : d0 f8 __ BNE $3854 ; (filepicker.l1050 + 0)
385c : 4c fd 37 JMP $37fd ; (filepicker.s4 + 0)
.s95:
385f : a5 44 __ LDA T3 + 1 
3861 : 30 08 __ BMI $386b ; (filepicker.s97 + 0)
.s1049:
3863 : d0 16 __ BNE $387b ; (filepicker.s96 + 0)
.s1048:
3865 : a5 43 __ LDA T3 + 0 
3867 : c9 0d __ CMP #$0d
3869 : b0 10 __ BCS $387b ; (filepicker.s96 + 0)
.s97:
386b : a5 44 __ LDA T3 + 1 
386d : f0 03 __ BEQ $3872 ; (filepicker.s1047 + 0)
386f : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s1047:
3872 : a5 43 __ LDA T3 + 0 
3874 : c9 03 __ CMP #$03
3876 : f0 85 __ BEQ $37fd ; (filepicker.s4 + 0)
3878 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s96:
387b : a5 43 __ LDA T3 + 0 
387d : c9 11 __ CMP #$11
387f : f0 03 __ BEQ $3884 ; (filepicker.s34 + 0)
3881 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s34:
3884 : ad ef 51 LDA $51ef ; (cwd + 23)
3887 : 0d f0 51 ORA $51f0 ; (cwd + 24)
388a : d0 03 __ BNE $388f ; (filepicker.s39 + 0)
388c : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s39:
388f : a5 54 __ LDA T1 + 0 
3891 : 05 55 __ ORA T1 + 1 
3893 : d0 03 __ BNE $3898 ; (filepicker.s38 + 0)
3895 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s38:
3898 : a0 15 __ LDY #$15
389a : b1 54 __ LDA (T1 + 0),y 
389c : 85 02 __ STA $02 
389e : c8 __ __ INY
389f : b1 54 __ LDA (T1 + 0),y 
38a1 : 85 55 __ STA T1 + 1 
38a3 : 05 02 __ ORA $02 
38a5 : d0 03 __ BNE $38aa ; (filepicker.s35 + 0)
38a7 : 4c 8b 34 JMP $348b ; (filepicker.l3 + 0)
.s35:
38aa : a5 02 __ LDA $02 
38ac : 85 54 __ STA T1 + 0 
38ae : 8d d1 52 STA $52d1 ; (current + 0)
38b1 : 8d f1 51 STA $51f1 ; (cwd + 25)
38b4 : a5 55 __ LDA T1 + 1 
38b6 : 8d d2 52 STA $52d2 ; (current + 1)
38b9 : 8d f2 51 STA $51f2 ; (cwd + 26)
38bc : 18 __ __ CLC
38bd : a5 56 __ LDA T2 + 0 
38bf : 69 01 __ ADC #$01
38c1 : 8d f5 51 STA $51f5 ; (cwd + 29)
38c4 : 85 1b __ STA ACCU + 0 
38c6 : a5 57 __ LDA T2 + 1 
38c8 : 69 00 __ ADC #$00
38ca : 8d f6 51 STA $51f6 ; (cwd + 30)
38cd : 85 1c __ STA ACCU + 1 
38cf : a9 0e __ LDA #$0e
38d1 : 85 03 __ STA WORK + 0 
38d3 : a9 00 __ LDA #$00
38d5 : 85 04 __ STA WORK + 1 
38d7 : 20 d5 4c JSR $4cd5 ; (divmod + 0)
38da : a5 45 __ LDA T4 + 0 
38dc : c5 1b __ CMP ACCU + 0 
38de : f0 03 __ BEQ $38e3 ; (filepicker.s41 + 0)
38e0 : 4c 2e 36 JMP $362e ; (filepicker.s230 + 0)
.s41:
38e3 : a5 47 __ LDA T6 + 0 
38e5 : 8d fd bf STA $bffd ; (sstack + 5)
38e8 : a0 17 __ LDY #$17
38ea : b1 54 __ LDA (T1 + 0),y 
38ec : 8d d1 52 STA $52d1 ; (current + 0)
38ef : c8 __ __ INY
38f0 : b1 54 __ LDA (T1 + 0),y 
38f2 : 8d d2 52 STA $52d2 ; (current + 1)
38f5 : 20 2f 44 JSR $442f ; (printElementPriv.s1000 + 0)
38f8 : ad d1 52 LDA $52d1 ; (current + 0)
38fb : 85 54 __ STA T1 + 0 
38fd : ad d2 52 LDA $52d2 ; (current + 1)
3900 : 85 55 __ STA T1 + 1 
3902 : a0 15 __ LDY #$15
3904 : b1 54 __ LDA (T1 + 0),y 
3906 : 8d d1 52 STA $52d1 ; (current + 0)
3909 : c8 __ __ INY
390a : b1 54 __ LDA (T1 + 0),y 
390c : 8d d2 52 STA $52d2 ; (current + 1)
390f : 18 __ __ CLC
3910 : a5 58 __ LDA T5 + 0 
3912 : 69 07 __ ADC #$07
3914 : 4c 70 36 JMP $3670 ; (filepicker.s229 + 0)
--------------------------------------------------------------------
3917 : __ __ __ BYT 73 45 4c 45 43 54 20 54 48 45 20 46 49 4c 45 20 : sELECT THE FILE 
3927 : __ __ __ BYT 54 4f 20 4c 4f 41 44 00                         : TO LOAD.
--------------------------------------------------------------------
refreshDir: ; refreshDir(u8,u8)->void
.s0:
392f : ad ff bf LDA $bfff ; (sstack + 7)
3932 : 8d fd bf STA $bffd ; (sstack + 5)
3935 : 20 03 3a JSR $3a03 ; (readDir.s1000 + 0)
3938 : a5 1b __ LDA ACCU + 0 
393a : d0 1c __ BNE $3958 ; (refreshDir.s1 + 0)
.s2:
393c : ad ff bf LDA $bfff ; (sstack + 7)
393f : 8d fd bf STA $bffd ; (sstack + 5)
3942 : 20 8a 43 JSR $438a ; (drawDirFrame.s1000 + 0)
3945 : a9 0b __ LDA #$0b
3947 : 85 11 __ STA P4 
3949 : a9 06 __ LDA #$06
394b : 85 12 __ STA P5 
394d : a9 12 __ LDA #$12
394f : 85 13 __ STA P6 
3951 : a9 46 __ LDA #$46
3953 : 85 14 __ STA P7 
3955 : 4c ec 31 JMP $31ec ; (vdc_prints.s0 + 0)
.s1:
3958 : ad ff bf LDA $bfff ; (sstack + 7)
395b : 8d fe bf STA $bffe ; (sstack + 6)
395e : ad ef 51 LDA $51ef ; (cwd + 23)
3961 : 8d f1 51 STA $51f1 ; (cwd + 25)
3964 : ad f0 51 LDA $51f0 ; (cwd + 24)
3967 : 8d f2 51 STA $51f2 ; (cwd + 26)
--------------------------------------------------------------------
printDir: ; printDir(u8)->void
.s1000:
396a : a5 53 __ LDA T0 + 0 
396c : 8d d4 bf STA $bfd4 ; (buff + 42)
.s0:
396f : ad ef 51 LDA $51ef ; (cwd + 23)
3972 : 0d f0 51 ORA $51f0 ; (cwd + 24)
3975 : d0 1a __ BNE $3991 ; (printDir.s3 + 0)
.s1:
3977 : ad ec 50 LDA $50ec ; (fullscreen + 0)
397a : 85 0f __ STA P2 
397c : ad ed 50 LDA $50ed ; (fullscreen + 1)
397f : 85 10 __ STA P3 
3981 : ad ee 50 LDA $50ee ; (fullscreen + 2)
3984 : 85 12 __ STA P5 
3986 : ad ef 50 LDA $50ef ; (fullscreen + 3)
3989 : 85 13 __ STA P6 
398b : 20 77 2c JSR $2c77 ; (vdc_clear@proxy + 0)
398e : 4c d9 39 JMP $39d9 ; (printDir.s1001 + 0)
.s3:
3991 : ad fe bf LDA $bffe ; (sstack + 6)
3994 : 8d fd bf STA $bffd ; (sstack + 5)
3997 : 20 8a 43 JSR $438a ; (drawDirFrame.s1000 + 0)
399a : a9 00 __ LDA #$00
399c : 85 53 __ STA T0 + 0 
399e : ad f3 51 LDA $51f3 ; (cwd + 27)
39a1 : ac f4 51 LDY $51f4 ; (cwd + 28)
.l68:
39a4 : 8c d2 52 STY $52d2 ; (current + 1)
39a7 : 8d d1 52 STA $52d1 ; (current + 0)
39aa : 98 __ __ TYA
39ab : d0 05 __ BNE $39b2 ; (printDir.s11 + 0)
.s1006:
39ad : ad d1 52 LDA $52d1 ; (current + 0)
39b0 : f0 2d __ BEQ $39df ; (printDir.l12 + 0)
.s11:
39b2 : a5 53 __ LDA T0 + 0 
39b4 : c9 0e __ CMP #$0e
39b6 : b0 21 __ BCS $39d9 ; (printDir.s1001 + 0)
.s8:
39b8 : 69 06 __ ADC #$06
39ba : 8d fd bf STA $bffd ; (sstack + 5)
39bd : 20 2f 44 JSR $442f ; (printElementPriv.s1000 + 0)
39c0 : e6 53 __ INC T0 + 0 
39c2 : ad d1 52 LDA $52d1 ; (current + 0)
39c5 : 85 44 __ STA T2 + 0 
39c7 : ad d2 52 LDA $52d2 ; (current + 1)
39ca : 85 45 __ STA T2 + 1 
39cc : a0 15 __ LDY #$15
39ce : b1 44 __ LDA (T2 + 0),y 
39d0 : aa __ __ TAX
39d1 : c8 __ __ INY
39d2 : b1 44 __ LDA (T2 + 0),y 
39d4 : a8 __ __ TAY
39d5 : 8a __ __ TXA
39d6 : 4c a4 39 JMP $39a4 ; (printDir.l68 + 0)
.s1001:
39d9 : ad d4 bf LDA $bfd4 ; (buff + 42)
39dc : 85 53 __ STA T0 + 0 
39de : 60 __ __ RTS
.l12:
39df : a5 53 __ LDA T0 + 0 
39e1 : c9 0e __ CMP #$0e
39e3 : b0 f4 __ BCS $39d9 ; (printDir.s1001 + 0)
.s13:
39e5 : a9 0a __ LDA #$0a
39e7 : 85 0f __ STA P2 
39e9 : a9 20 __ LDA #$20
39eb : 85 11 __ STA P4 
39ed : a9 28 __ LDA #$28
39ef : 85 12 __ STA P5 
39f1 : a9 01 __ LDA #$01
39f3 : 85 13 __ STA P6 
39f5 : a5 53 __ LDA T0 + 0 
39f7 : 69 06 __ ADC #$06
39f9 : 85 10 __ STA P3 
39fb : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
39fe : e6 53 __ INC T0 + 0 
3a00 : 4c df 39 JMP $39df ; (printDir.l12 + 0)
--------------------------------------------------------------------
readDir: ; readDir(u8,u8)->u8
.s1000:
3a03 : a5 53 __ LDA T0 + 0 
3a05 : 8d d7 bf STA $bfd7 ; (buff + 45)
3a08 : a5 54 __ LDA T0 + 1 
3a0a : 8d d8 bf STA $bfd8 ; (buff + 46)
3a0d : a5 55 __ LDA T1 + 0 
3a0f : 8d d9 bf STA $bfd9 ; (buff + 47)
3a12 : 38 __ __ SEC
3a13 : a5 23 __ LDA SP + 0 
3a15 : e9 08 __ SBC #$08
3a17 : 85 23 __ STA SP + 0 
3a19 : b0 02 __ BCS $3a1d ; (readDir.s0 + 0)
3a1b : c6 24 __ DEC SP + 1 
.s0:
3a1d : a9 00 __ LDA #$00
3a1f : 8d fe 51 STA $51fe ; (previous + 0)
3a22 : 8d ff 51 STA $51ff ; (previous + 1)
3a25 : ad ff 46 LDA $46ff ; (mc_menupopup + 0)
3a28 : 8d da 50 STA $50da ; (vdc_state + 7)
3a2b : a9 00 __ LDA #$00
3a2d : a2 21 __ LDX #$21
.l1002:
3a2f : ca __ __ DEX
3a30 : 9d d8 51 STA $51d8,x ; (cwd + 0)
3a33 : d0 fa __ BNE $3a2f ; (readDir.l1002 + 0)
.s1003:
3a35 : 8d f9 51 STA $51f9 ; (disk_id_buf + 0)
3a38 : 8d fa 51 STA $51fa ; (disk_id_buf + 1)
3a3b : 8d fb 51 STA $51fb ; (disk_id_buf + 2)
3a3e : 8d fc 51 STA $51fc ; (disk_id_buf + 3)
3a41 : 8d fd 51 STA $51fd ; (disk_id_buf + 4)
3a44 : ad fd bf LDA $bffd ; (sstack + 5)
3a47 : 85 10 __ STA P3 
3a49 : 20 32 3c JSR $3c32 ; (dir_open.s0 + 0)
3a4c : a5 1b __ LDA ACCU + 0 
3a4e : f0 03 __ BEQ $3a53 ; (readDir.s5 + 0)
3a50 : 4c 13 3c JMP $3c13 ; (readDir.s1016 + 0)
.s5:
3a53 : a9 ff __ LDA #$ff
3a55 : 85 55 __ STA T1 + 0 
.l6:
3a57 : 20 f9 3c JSR $3cf9 ; (calloc.s0 + 0)
3a5a : a5 1b __ LDA ACCU + 0 
3a5c : 8d d1 52 STA $52d1 ; (current + 0)
3a5f : a5 1c __ LDA ACCU + 1 
3a61 : 8d d2 52 STA $52d2 ; (current + 1)
3a64 : 05 1b __ ORA ACCU + 0 
3a66 : d0 13 __ BNE $3a7b ; (readDir.s10 + 0)
.s8:
3a68 : 20 cc ff JSR $ffcc 
3a6b : a9 02 __ LDA #$02
3a6d : 20 c3 ff JSR $ffc3 
3a70 : ad da 50 LDA $50da ; (vdc_state + 7)
3a73 : 09 40 __ ORA #$40
3a75 : 8d da 50 STA $50da ; (vdc_state + 7)
3a78 : 4c 13 3c JMP $3c13 ; (readDir.s1016 + 0)
.s10:
3a7b : a5 1c __ LDA ACCU + 1 
3a7d : 85 14 __ STA P7 
3a7f : 85 54 __ STA T0 + 1 
3a81 : a5 1b __ LDA ACCU + 0 
3a83 : 85 53 __ STA T0 + 0 
3a85 : 85 13 __ STA P6 
3a87 : 20 4a 3d JSR $3d4a ; (dir_readentry.s0 + 0)
3a8a : a5 1b __ LDA ACCU + 0 
3a8c : f0 03 __ BEQ $3a91 ; (readDir.s16 + 0)
3a8e : 4c da 3b JMP $3bda ; (readDir.s14 + 0)
.s16:
3a91 : ad da 50 LDA $50da ; (vdc_state + 7)
3a94 : 09 40 __ ORA #$40
3a96 : a8 __ __ TAY
3a97 : a5 55 __ LDA T1 + 0 
3a99 : 4a __ __ LSR
3a9a : 4a __ __ LSR
3a9b : c9 24 __ CMP #$24
3a9d : 90 3a __ BCC $3ad9 ; (readDir.s19 + 0)
.s18:
3a9f : 8c da 50 STY $50da ; (vdc_state + 7)
3aa2 : a9 05 __ LDA #$05
3aa4 : 85 10 __ STA P3 
3aa6 : a9 01 __ LDA #$01
3aa8 : 85 13 __ STA P6 
3aaa : 20 3f 50 JSR $503f ; (vdc_clear@proxy + 0)
3aad : a9 80 __ LDA #$80
3aaf : a0 02 __ LDY #$02
3ab1 : 91 23 __ STA (SP + 0),y 
3ab3 : a9 52 __ LDA #$52
3ab5 : c8 __ __ INY
3ab6 : 91 23 __ STA (SP + 0),y 
3ab8 : a9 88 __ LDA #$88
3aba : c8 __ __ INY
3abb : 91 23 __ STA (SP + 0),y 
3abd : a9 3f __ LDA #$3f
3abf : c8 __ __ INY
3ac0 : 91 23 __ STA (SP + 0),y 
3ac2 : ad fd bf LDA $bffd ; (sstack + 5)
3ac5 : c8 __ __ INY
3ac6 : 91 23 __ STA (SP + 0),y 
3ac8 : a9 00 __ LDA #$00
3aca : c8 __ __ INY
3acb : 91 23 __ STA (SP + 0),y 
3acd : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
3ad0 : 20 0e 50 JSR $500e ; (vdc_prints@proxy + 0)
3ad3 : a9 00 __ LDA #$00
3ad5 : 85 55 __ STA T1 + 0 
3ad7 : f0 33 __ BEQ $3b0c ; (readDir.s91 + 0)
.s19:
3ad9 : 69 0e __ ADC #$0e
3adb : 8d f0 50 STA $50f0 ; (fullscreen + 4)
3ade : a9 05 __ LDA #$05
3ae0 : 8d f1 50 STA $50f1 ; (fullscreen + 5)
3ae3 : a5 55 __ LDA T1 + 0 
3ae5 : 29 03 __ AND #$03
3ae7 : aa __ __ TAX
3ae8 : bd fb 4b LDA $4bfb,x ; (progressRev + 0)
3aeb : f0 08 __ BEQ $3af5 ; (readDir.s64 + 0)
.s65:
3aed : ad da 50 LDA $50da ; (vdc_state + 7)
3af0 : 29 bf __ AND #$bf
3af2 : 4c f6 3a JMP $3af6 ; (readDir.s1014 + 0)
.s64:
3af5 : 98 __ __ TYA
.s1014:
3af6 : 8d da 50 STA $50da ; (vdc_state + 7)
3af9 : a9 ec __ LDA #$ec
3afb : 85 17 __ STA P10 
3afd : a9 50 __ LDA #$50
3aff : 85 18 __ STA P11 
3b01 : bd 6a 50 LDA $506a,x ; (progressBar + 0)
3b04 : 8d f8 bf STA $bff8 ; (sstack + 0)
3b07 : 20 8f 3f JSR $3f8f ; (vdcwin_put_char.s1000 + 0)
3b0a : e6 55 __ INC T1 + 0 
.s91:
3b0c : ad d1 52 LDA $52d1 ; (current + 0)
3b0f : 85 53 __ STA T0 + 0 
3b11 : ad d2 52 LDA $52d2 ; (current + 1)
3b14 : 85 54 __ STA T0 + 1 
3b16 : a0 13 __ LDY #$13
3b18 : ad d8 51 LDA $51d8 ; (cwd + 0)
3b1b : d0 5f __ BNE $3b7c ; (readDir.s25 + 0)
.s24:
3b1d : b1 53 __ LDA (T0 + 0),y 
3b1f : c9 05 __ CMP #$05
3b21 : f0 19 __ BEQ $3b3c ; (readDir.s27 + 0)
.s28:
3b23 : a2 ff __ LDX #$ff
.l1004:
3b25 : e8 __ __ INX
3b26 : bd da 42 LDA $42da,x 
3b29 : 9d d8 51 STA $51d8,x ; (cwd + 0)
3b2c : d0 f7 __ BNE $3b25 ; (readDir.l1004 + 0)
.s99:
3b2e : a5 54 __ LDA T0 + 1 
3b30 : a6 53 __ LDX T0 + 0 
.s1017:
3b32 : 86 1b __ STX ACCU + 0 
3b34 : 85 1c __ STA ACCU + 1 
3b36 : 20 14 4f JSR $4f14 ; (free + 0)
3b39 : 4c 57 3a JMP $3a57 ; (readDir.l6 + 0)
.s27:
3b3c : a0 00 __ LDY #$00
3b3e : f0 04 __ BEQ $3b44 ; (readDir.l30 + 0)
.s31:
3b40 : 99 d8 51 STA $51d8,y ; (cwd + 0)
3b43 : c8 __ __ INY
.l30:
3b44 : ad d1 52 LDA $52d1 ; (current + 0)
3b47 : 85 1b __ STA ACCU + 0 
3b49 : ad d2 52 LDA $52d2 ; (current + 1)
3b4c : 85 1c __ STA ACCU + 1 
3b4e : b1 1b __ LDA (ACCU + 0),y 
3b50 : d0 ee __ BNE $3b40 ; (readDir.s31 + 0)
.s33:
3b52 : a9 2c __ LDA #$2c
3b54 : 99 d8 51 STA $51d8,y ; (cwd + 0)
3b57 : ad f9 51 LDA $51f9 ; (disk_id_buf + 0)
3b5a : 99 d9 51 STA $51d9,y ; (cwd + 1)
3b5d : ad fa 51 LDA $51fa ; (disk_id_buf + 1)
3b60 : 99 da 51 STA $51da,y ; (cwd + 2)
3b63 : ad fb 51 LDA $51fb ; (disk_id_buf + 2)
3b66 : 99 db 51 STA $51db,y ; (cwd + 3)
3b69 : ad fc 51 LDA $51fc ; (disk_id_buf + 3)
3b6c : 99 dc 51 STA $51dc,y ; (cwd + 4)
3b6f : ad fd 51 LDA $51fd ; (disk_id_buf + 4)
3b72 : 99 dd 51 STA $51dd,y ; (cwd + 5)
3b75 : a5 1c __ LDA ACCU + 1 
3b77 : a6 1b __ LDX ACCU + 0 
3b79 : 4c 32 3b JMP $3b32 ; (readDir.s1017 + 0)
.s25:
3b7c : b1 53 __ LDA (T0 + 0),y 
3b7e : c9 64 __ CMP #$64
3b80 : d0 10 __ BNE $3b92 ; (readDir.s35 + 0)
.s34:
3b82 : a0 11 __ LDY #$11
3b84 : b1 53 __ LDA (T0 + 0),y 
3b86 : 8d f7 51 STA $51f7 ; (cwd + 31)
3b89 : c8 __ __ INY
3b8a : b1 53 __ LDA (T0 + 0),y 
3b8c : 8d f8 51 STA $51f8 ; (cwd + 32)
3b8f : 4c 2e 3b JMP $3b2e ; (readDir.s99 + 0)
.s35:
3b92 : 20 e7 42 JSR $42e7 ; (dir_validentry.s0 + 0)
3b95 : a5 1b __ LDA ACCU + 0 
3b97 : f0 95 __ BEQ $3b2e ; (readDir.s99 + 0)
.s37:
3b99 : ad f0 51 LDA $51f0 ; (cwd + 24)
3b9c : d0 05 __ BNE $3ba3 ; (readDir.s41 + 0)
.s1008:
3b9e : ad ef 51 LDA $51ef ; (cwd + 23)
3ba1 : f0 20 __ BEQ $3bc3 ; (readDir.s40 + 0)
.s41:
3ba3 : ad ff 51 LDA $51ff ; (previous + 1)
3ba6 : 85 45 __ STA T3 + 1 
3ba8 : ad fe 51 LDA $51fe ; (previous + 0)
3bab : 85 44 __ STA T3 + 0 
3bad : a0 17 __ LDY #$17
3baf : 91 53 __ STA (T0 + 0),y 
3bb1 : a5 45 __ LDA T3 + 1 
3bb3 : c8 __ __ INY
3bb4 : 91 53 __ STA (T0 + 0),y 
3bb6 : a5 53 __ LDA T0 + 0 
3bb8 : a0 15 __ LDY #$15
3bba : 91 44 __ STA (T3 + 0),y 
3bbc : a5 54 __ LDA T0 + 1 
3bbe : c8 __ __ INY
3bbf : 91 44 __ STA (T3 + 0),y 
3bc1 : d0 0a __ BNE $3bcd ; (readDir.s112 + 0)
.s40:
3bc3 : a5 53 __ LDA T0 + 0 
3bc5 : 8d ef 51 STA $51ef ; (cwd + 23)
3bc8 : a5 54 __ LDA T0 + 1 
3bca : 8d f0 51 STA $51f0 ; (cwd + 24)
.s112:
3bcd : a5 53 __ LDA T0 + 0 
3bcf : 8d fe 51 STA $51fe ; (previous + 0)
3bd2 : a5 54 __ LDA T0 + 1 
3bd4 : 8d ff 51 STA $51ff ; (previous + 1)
3bd7 : 4c 57 3a JMP $3a57 ; (readDir.l6 + 0)
.s14:
3bda : a5 53 __ LDA T0 + 0 
3bdc : 85 1b __ STA ACCU + 0 
3bde : a5 54 __ LDA T0 + 1 
3be0 : 85 1c __ STA ACCU + 1 
3be2 : 20 14 4f JSR $4f14 ; (free + 0)
3be5 : 20 cc ff JSR $ffcc 
3be8 : a9 02 __ LDA #$02
3bea : 20 c3 ff JSR $ffc3 
3bed : ad da 50 LDA $50da ; (vdc_state + 7)
3bf0 : 09 40 __ ORA #$40
3bf2 : 8d da 50 STA $50da ; (vdc_state + 7)
3bf5 : ad ef 51 LDA $51ef ; (cwd + 23)
3bf8 : 0d f0 51 ORA $51f0 ; (cwd + 24)
3bfb : f0 16 __ BEQ $3c13 ; (readDir.s1016 + 0)
.s45:
3bfd : ad ef 51 LDA $51ef ; (cwd + 23)
3c00 : 8d f1 51 STA $51f1 ; (cwd + 25)
3c03 : 8d f3 51 STA $51f3 ; (cwd + 27)
3c06 : ad f0 51 LDA $51f0 ; (cwd + 24)
3c09 : 8d f2 51 STA $51f2 ; (cwd + 26)
3c0c : 8d f4 51 STA $51f4 ; (cwd + 28)
3c0f : a9 01 __ LDA #$01
3c11 : d0 02 __ BNE $3c15 ; (readDir.s1001 + 0)
.s1016:
3c13 : a9 00 __ LDA #$00
.s1001:
3c15 : 85 1b __ STA ACCU + 0 
3c17 : 18 __ __ CLC
3c18 : a5 23 __ LDA SP + 0 
3c1a : 69 08 __ ADC #$08
3c1c : 85 23 __ STA SP + 0 
3c1e : 90 02 __ BCC $3c22 ; (readDir.s1001 + 13)
3c20 : e6 24 __ INC SP + 1 
3c22 : ad d7 bf LDA $bfd7 ; (buff + 45)
3c25 : 85 53 __ STA T0 + 0 
3c27 : ad d8 bf LDA $bfd8 ; (buff + 46)
3c2a : 85 54 __ STA T0 + 1 
3c2c : ad d9 bf LDA $bfd9 ; (buff + 47)
3c2f : 85 55 __ STA T1 + 0 
3c31 : 60 __ __ RTS
--------------------------------------------------------------------
dir_open: ; dir_open(u8,u8)->u8
.s0:
3c32 : a9 00 __ LDA #$00
3c34 : 85 0d __ STA P0 
3c36 : 85 0e __ STA P1 
3c38 : 20 a3 2a JSR $2aa3 ; (krnio_setbnk.s0 + 0)
3c3b : a9 fe __ LDA #$fe
3c3d : 85 0d __ STA P0 
3c3f : a9 2a __ LDA #$2a
3c41 : 85 0e __ STA P1 
3c43 : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
3c46 : a9 02 __ LDA #$02
3c48 : 85 0d __ STA P0 
3c4a : a9 00 __ LDA #$00
3c4c : 85 0f __ STA P2 
3c4e : 20 a4 3c JSR $3ca4 ; (krnio_open@proxy + 0)
3c51 : 85 43 __ STA T1 + 0 
3c53 : 20 b7 ff JSR $ffb7 
3c56 : 85 44 __ STA T2 + 0 
3c58 : 85 1b __ STA ACCU + 0 
3c5a : a5 43 __ LDA T1 + 0 
3c5c : f0 45 __ BEQ $3ca3 ; (dir_open.s1001 + 0)
.s4:
3c5e : a5 44 __ LDA T2 + 0 
3c60 : f0 08 __ BEQ $3c6a ; (dir_open.s3 + 0)
.s1:
3c62 : 20 cc ff JSR $ffcc 
3c65 : a9 02 __ LDA #$02
3c67 : 20 c3 ff JSR $ffc3 
.s3:
3c6a : a5 43 __ LDA T1 + 0 
3c6c : f0 31 __ BEQ $3c9f ; (dir_open.s1002 + 0)
.s9:
3c6e : a5 44 __ LDA T2 + 0 
3c70 : d0 2d __ BNE $3c9f ; (dir_open.s1002 + 0)
.s6:
3c72 : a9 02 __ LDA #$02
3c74 : 20 db 3c JSR $3cdb ; (krnio_chkin.s1000 + 0)
3c77 : 85 43 __ STA T1 + 0 
3c79 : 20 b7 ff JSR $ffb7 
3c7c : 85 44 __ STA T2 + 0 
3c7e : a5 43 __ LDA T1 + 0 
3c80 : f0 15 __ BEQ $3c97 ; (dir_open.s11 + 0)
.s13:
3c82 : a5 44 __ LDA T2 + 0 
3c84 : d0 11 __ BNE $3c97 ; (dir_open.s11 + 0)
.s10:
3c86 : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
3c89 : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
3c8c : 20 b7 ff JSR $ffb7 
3c8f : 85 44 __ STA T2 + 0 
3c91 : 85 1b __ STA ACCU + 0 
3c93 : 09 00 __ ORA #$00
3c95 : f0 0c __ BEQ $3ca3 ; (dir_open.s1001 + 0)
.s11:
3c97 : 20 cc ff JSR $ffcc 
3c9a : a9 02 __ LDA #$02
3c9c : 20 c3 ff JSR $ffc3 
.s1002:
3c9f : a5 44 __ LDA T2 + 0 
3ca1 : 85 1b __ STA ACCU + 0 
.s1001:
3ca3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open@proxy: ; krnio_open@proxy
3ca4 : a5 10 __ LDA P3 
3ca6 : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s0:
3ca8 : a9 00 __ LDA #$00
3caa : a6 0d __ LDX P0 ; (fnum + 0)
3cac : 9d c2 50 STA $50c2,x ; (krnio_pstatus + 0)
3caf : a9 00 __ LDA #$00
3cb1 : 85 1b __ STA ACCU + 0 
3cb3 : 85 1c __ STA ACCU + 1 
3cb5 : a5 0d __ LDA P0 ; (fnum + 0)
3cb7 : a6 0e __ LDX P1 
3cb9 : a4 0f __ LDY P2 
3cbb : 20 ba ff JSR $ffba 
3cbe : 20 c0 ff JSR $ffc0 
3cc1 : 90 08 __ BCC $3ccb ; (krnio_open.s0 + 35)
3cc3 : a5 0d __ LDA P0 ; (fnum + 0)
3cc5 : 20 c3 ff JSR $ffc3 
3cc8 : 4c cf 3c JMP $3ccf ; (krnio_open.s1001 + 0)
3ccb : a9 01 __ LDA #$01
3ccd : 85 1b __ STA ACCU + 0 
.s1001:
3ccf : a5 1b __ LDA ACCU + 0 
3cd1 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s0:
3cd2 : 4c b7 ff JMP $ffb7 
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s0:
3cd5 : 4c cc ff JMP $ffcc 
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s0:
3cd8 : 4c c3 ff JMP $ffc3 
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s1000:
3cdb : 85 0d __ STA P0 
.s0:
3cdd : a6 0d __ LDX P0 
3cdf : 20 c6 ff JSR $ffc6 
3ce2 : a9 00 __ LDA #$00
3ce4 : 85 1c __ STA ACCU + 1 
3ce6 : b0 02 __ BCS $3cea ; (krnio_chkin.s0 + 13)
3ce8 : a9 01 __ LDA #$01
3cea : 85 1b __ STA ACCU + 0 
.s1001:
3cec : a5 1b __ LDA ACCU + 0 
3cee : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->i16
.s0:
3cef : 20 cf ff JSR $ffcf 
3cf2 : 85 1b __ STA ACCU + 0 
3cf4 : a9 00 __ LDA #$00
3cf6 : 85 1c __ STA ACCU + 1 
.s1001:
3cf8 : 60 __ __ RTS
--------------------------------------------------------------------
calloc: ; calloc(i16,i16)->void*
.s0:
3cf9 : a9 19 __ LDA #$19
3cfb : 85 1b __ STA ACCU + 0 
3cfd : a9 00 __ LDA #$00
3cff : 85 1c __ STA ACCU + 1 
3d01 : 20 37 4e JSR $4e37 ; (malloc + 0)
3d04 : a5 1c __ LDA ACCU + 1 
3d06 : 05 1b __ ORA ACCU + 0 
3d08 : f0 1d __ BEQ $3d27 ; (calloc.s1001 + 0)
.s1:
3d0a : a5 1c __ LDA ACCU + 1 
3d0c : 85 0e __ STA P1 
3d0e : 85 44 __ STA T0 + 1 
3d10 : a5 1b __ LDA ACCU + 0 
3d12 : 85 0d __ STA P0 
3d14 : a9 19 __ LDA #$19
3d16 : 85 0f __ STA P2 
3d18 : a9 00 __ LDA #$00
3d1a : 85 10 __ STA P3 
3d1c : 20 28 3d JSR $3d28 ; (memclr.s0 + 0)
3d1f : a5 0d __ LDA P0 
3d21 : 85 1b __ STA ACCU + 0 
3d23 : a5 44 __ LDA T0 + 1 
3d25 : 85 1c __ STA ACCU + 1 
.s1001:
3d27 : 60 __ __ RTS
--------------------------------------------------------------------
memclr: ; memclr(void*,i16)->void
.s0:
3d28 : a5 10 __ LDA P3 ; (size + 1)
3d2a : 05 0f __ ORA P2 ; (size + 0)
3d2c : f0 1b __ BEQ $3d49 ; (memclr.s1001 + 0)
.s5:
3d2e : a0 00 __ LDY #$00
3d30 : a5 0f __ LDA P2 ; (size + 0)
3d32 : f0 02 __ BEQ $3d36 ; (memclr.s1011 + 0)
.s1005:
3d34 : e6 10 __ INC P3 ; (size + 1)
.s1011:
3d36 : 98 __ __ TYA
.l1002:
3d37 : a6 0f __ LDX P2 ; (size + 0)
.l1006:
3d39 : 91 0d __ STA (P0),y ; (dst + 0)
3d3b : c8 __ __ INY
3d3c : d0 02 __ BNE $3d40 ; (memclr.s1009 + 0)
.s1008:
3d3e : e6 0e __ INC P1 ; (dst + 1)
.s1009:
3d40 : ca __ __ DEX
3d41 : d0 f6 __ BNE $3d39 ; (memclr.l1006 + 0)
.s1007:
3d43 : 85 0f __ STA P2 ; (size + 0)
3d45 : c6 10 __ DEC P3 ; (size + 1)
3d47 : d0 ee __ BNE $3d37 ; (memclr.l1002 + 0)
.s1001:
3d49 : 60 __ __ RTS
--------------------------------------------------------------------
dir_readentry: ; dir_readentry(const u8,struct DirEntry*)->u8
.s0:
3d4a : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
3d4d : a5 1b __ LDA ACCU + 0 
3d4f : d0 04 __ BNE $3d55 ; (dir_readentry.s3 + 0)
.s1:
3d51 : a9 01 __ LDA #$01
3d53 : d0 59 __ BNE $3dae ; (dir_readentry.s1095 + 0)
.s3:
3d55 : 20 b7 ff JSR $ffb7 
3d58 : 09 00 __ ORA #$00
3d5a : f0 03 __ BEQ $3d5f ; (dir_readentry.s7 + 0)
3d5c : 4c 83 3f JMP $3f83 ; (dir_readentry.s5 + 0)
.s7:
3d5f : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
3d62 : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
3d65 : a5 1b __ LDA ACCU + 0 
3d67 : 85 43 __ STA T0 + 0 
3d69 : a0 11 __ LDY #$11
3d6b : 91 13 __ STA (P6),y ; (l_dirent + 0)
3d6d : a5 1c __ LDA ACCU + 1 
3d6f : 85 44 __ STA T0 + 1 
3d71 : c8 __ __ INY
3d72 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3d74 : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
3d77 : a5 1b __ LDA ACCU + 0 
3d79 : 05 44 __ ORA T0 + 1 
3d7b : a0 12 __ LDY #$12
3d7d : 91 13 __ STA (P6),y ; (l_dirent + 0)
3d7f : a5 43 __ LDA T0 + 0 
3d81 : 88 __ __ DEY
3d82 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3d84 : a9 00 __ LDA #$00
3d86 : a2 51 __ LDX #$51
.l1002:
3d88 : ca __ __ DEX
3d89 : 9d 80 52 STA $5280,x ; (linebuffer + 0)
3d8c : d0 fa __ BNE $3d88 ; (dir_readentry.l1002 + 0)
.s1003:
3d8e : 85 45 __ STA T1 + 0 
.l10:
3d90 : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
3d93 : a5 1b __ LDA ACCU + 0 
3d95 : f0 1a __ BEQ $3db1 ; (dir_readentry.s11 + 0)
.s14:
3d97 : a6 45 __ LDX T1 + 0 
3d99 : e0 51 __ CPX #$51
3d9b : b0 05 __ BCS $3da2 ; (dir_readentry.s281 + 0)
.s16:
3d9d : 9d 80 52 STA $5280,x ; (linebuffer + 0)
3da0 : e6 45 __ INC T1 + 0 
.s281:
3da2 : 20 b7 ff JSR $ffb7 
3da5 : 09 00 __ ORA #$00
3da7 : f0 e7 __ BEQ $3d90 ; (dir_readentry.l10 + 0)
.s19:
3da9 : 20 cc ff JSR $ffcc 
3dac : a9 02 __ LDA #$02
.s1095:
3dae : 85 1b __ STA ACCU + 0 
.s1001:
3db0 : 60 __ __ RTS
.s11:
3db1 : ad 80 52 LDA $5280 ; (linebuffer + 0)
3db4 : c9 42 __ CMP #$42
3db6 : d0 07 __ BNE $3dbf ; (dir_readentry.s25 + 0)
.s23:
3db8 : a9 64 __ LDA #$64
3dba : a0 13 __ LDY #$13
3dbc : 91 13 __ STA (P6),y ; (l_dirent + 0)
3dbe : 60 __ __ RTS
.s25:
3dbf : a6 45 __ LDX T1 + 0 
3dc1 : e0 05 __ CPX #$05
3dc3 : b0 04 __ BCS $3dc9 ; (dir_readentry.l1098 + 0)
.s27:
3dc5 : a9 03 __ LDA #$03
3dc7 : 90 e5 __ BCC $3dae ; (dir_readentry.s1095 + 0)
.l1098:
3dc9 : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3dcc : f0 0b __ BEQ $3dd9 ; (dir_readentry.s35 + 0)
.s39:
3dce : c9 20 __ CMP #$20
3dd0 : f0 07 __ BEQ $3dd9 ; (dir_readentry.s35 + 0)
.s38:
3dd2 : c9 a0 __ CMP #$a0
3dd4 : f0 03 __ BEQ $3dd9 ; (dir_readentry.s35 + 0)
3dd6 : 4c 7d 3f JMP $3f7d ; (dir_readentry.s37 + 0)
.s35:
3dd9 : a9 00 __ LDA #$00
3ddb : 9d 80 52 STA $5280,x ; (linebuffer + 0)
3dde : ca __ __ DEX
3ddf : d0 e8 __ BNE $3dc9 ; (dir_readentry.l1098 + 0)
.s1097:
3de1 : 85 45 __ STA T1 + 0 
.s127:
3de3 : a2 00 __ LDX #$00
.l46:
3de5 : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3de8 : c9 22 __ CMP #$22
3dea : f0 05 __ BEQ $3df1 ; (dir_readentry.s1100 + 0)
.s44:
3dec : e8 __ __ INX
3ded : e0 51 __ CPX #$51
3def : 90 f4 __ BCC $3de5 ; (dir_readentry.l46 + 0)
.s1100:
3df1 : e8 __ __ INX
3df2 : 86 1b __ STX ACCU + 0 
3df4 : e0 51 __ CPX #$51
3df6 : b0 17 __ BCS $3e0f ; (dir_readentry.s50 + 0)
.s126:
3df8 : a0 00 __ LDY #$00
.l52:
3dfa : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3dfd : c9 22 __ CMP #$22
3dff : f0 0c __ BEQ $3e0d ; (dir_readentry.s1103 + 0)
.s51:
3e01 : c0 10 __ CPY #$10
3e03 : b0 08 __ BCS $3e0d ; (dir_readentry.s1103 + 0)
.s48:
3e05 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3e07 : e8 __ __ INX
3e08 : e0 51 __ CPX #$51
3e0a : c8 __ __ INY
3e0b : 90 ed __ BCC $3dfa ; (dir_readentry.l52 + 0)
.s1103:
3e0d : 86 1b __ STX ACCU + 0 
.s50:
3e0f : a6 45 __ LDX T1 + 0 
3e11 : 86 43 __ STX T0 + 0 
3e13 : bd 7d 52 LDA $527d,x ; (_cinfo + 125)
3e16 : 85 45 __ STA T1 + 0 
3e18 : c9 50 __ CMP #$50
3e1a : d0 13 __ BNE $3e2f ; (dir_readentry.s54 + 0)
.s57:
3e1c : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3e1f : c9 52 __ CMP #$52
3e21 : d0 0c __ BNE $3e2f ; (dir_readentry.s54 + 0)
.s56:
3e23 : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3e26 : c9 47 __ CMP #$47
3e28 : d0 05 __ BNE $3e2f ; (dir_readentry.s54 + 0)
.s53:
3e2a : a9 11 __ LDA #$11
3e2c : 4c 64 3f JMP $3f64 ; (dir_readentry.s55 + 0)
.s54:
3e2f : a5 45 __ LDA T1 + 0 
3e31 : c9 53 __ CMP #$53
3e33 : d0 15 __ BNE $3e4a ; (dir_readentry.s59 + 0)
.s62:
3e35 : a6 43 __ LDX T0 + 0 
3e37 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3e3a : c9 45 __ CMP #$45
3e3c : d0 0c __ BNE $3e4a ; (dir_readentry.s59 + 0)
.s61:
3e3e : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3e41 : c9 51 __ CMP #$51
3e43 : d0 05 __ BNE $3e4a ; (dir_readentry.s59 + 0)
.s58:
3e45 : a9 10 __ LDA #$10
3e47 : 4c 64 3f JMP $3f64 ; (dir_readentry.s55 + 0)
.s59:
3e4a : a5 45 __ LDA T1 + 0 
3e4c : c9 55 __ CMP #$55
3e4e : d0 15 __ BNE $3e65 ; (dir_readentry.s64 + 0)
.s67:
3e50 : a6 43 __ LDX T0 + 0 
3e52 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3e55 : c9 53 __ CMP #$53
3e57 : d0 0c __ BNE $3e65 ; (dir_readentry.s64 + 0)
.s66:
3e59 : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3e5c : c9 52 __ CMP #$52
3e5e : d0 05 __ BNE $3e65 ; (dir_readentry.s64 + 0)
.s63:
3e60 : a9 12 __ LDA #$12
3e62 : 4c 64 3f JMP $3f64 ; (dir_readentry.s55 + 0)
.s64:
3e65 : a5 45 __ LDA T1 + 0 
3e67 : c9 44 __ CMP #$44
3e69 : f0 04 __ BEQ $3e6f ; (dir_readentry.s1006 + 0)
.s1007:
3e6b : a2 00 __ LDX #$00
3e6d : f0 17 __ BEQ $3e86 ; (dir_readentry.s69 + 0)
.s1006:
3e6f : a4 43 __ LDY T0 + 0 
3e71 : b9 7e 52 LDA $527e,y ; (_cinfo + 126)
3e74 : a2 01 __ LDX #$01
3e76 : c9 45 __ CMP #$45
3e78 : d0 0c __ BNE $3e86 ; (dir_readentry.s69 + 0)
.s71:
3e7a : b9 7f 52 LDA $527f,y ; (_cinfo + 127)
3e7d : c9 4c __ CMP #$4c
3e7f : d0 05 __ BNE $3e86 ; (dir_readentry.s69 + 0)
.s68:
3e81 : a9 00 __ LDA #$00
3e83 : 4c 64 3f JMP $3f64 ; (dir_readentry.s55 + 0)
.s69:
3e86 : a5 45 __ LDA T1 + 0 
3e88 : c9 52 __ CMP #$52
3e8a : d0 15 __ BNE $3ea1 ; (dir_readentry.s74 + 0)
.s77:
3e8c : a4 43 __ LDY T0 + 0 
3e8e : b9 7e 52 LDA $527e,y ; (_cinfo + 126)
3e91 : c9 45 __ CMP #$45
3e93 : d0 0c __ BNE $3ea1 ; (dir_readentry.s74 + 0)
.s76:
3e95 : b9 7f 52 LDA $527f,y ; (_cinfo + 127)
3e98 : c9 4c __ CMP #$4c
3e9a : d0 05 __ BNE $3ea1 ; (dir_readentry.s74 + 0)
.s73:
3e9c : a9 13 __ LDA #$13
3e9e : 4c 64 3f JMP $3f64 ; (dir_readentry.s55 + 0)
.s74:
3ea1 : a5 45 __ LDA T1 + 0 
3ea3 : c9 43 __ CMP #$43
3ea5 : d0 15 __ BNE $3ebc ; (dir_readentry.s79 + 0)
.s82:
3ea7 : a4 43 __ LDY T0 + 0 
3ea9 : b9 7e 52 LDA $527e,y ; (_cinfo + 126)
3eac : c9 42 __ CMP #$42
3eae : d0 0c __ BNE $3ebc ; (dir_readentry.s79 + 0)
.s81:
3eb0 : b9 7f 52 LDA $527f,y ; (_cinfo + 127)
3eb3 : c9 4d __ CMP #$4d
3eb5 : d0 05 __ BNE $3ebc ; (dir_readentry.s79 + 0)
.s78:
3eb7 : a9 01 __ LDA #$01
3eb9 : 4c 64 3f JMP $3f64 ; (dir_readentry.s55 + 0)
.s79:
3ebc : 8a __ __ TXA
3ebd : f0 15 __ BEQ $3ed4 ; (dir_readentry.s84 + 0)
.s87:
3ebf : a6 43 __ LDX T0 + 0 
3ec1 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3ec4 : c9 49 __ CMP #$49
3ec6 : d0 0c __ BNE $3ed4 ; (dir_readentry.s84 + 0)
.s86:
3ec8 : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3ecb : c9 52 __ CMP #$52
3ecd : d0 05 __ BNE $3ed4 ; (dir_readentry.s84 + 0)
.s83:
3ecf : a9 02 __ LDA #$02
3ed1 : 4c 64 3f JMP $3f64 ; (dir_readentry.s55 + 0)
.s84:
3ed4 : a5 45 __ LDA T1 + 0 
3ed6 : c9 56 __ CMP #$56
3ed8 : d0 14 __ BNE $3eee ; (dir_readentry.s89 + 0)
.s92:
3eda : a6 43 __ LDX T0 + 0 
3edc : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3edf : c9 52 __ CMP #$52
3ee1 : d0 0b __ BNE $3eee ; (dir_readentry.s89 + 0)
.s91:
3ee3 : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3ee6 : c9 50 __ CMP #$50
3ee8 : d0 04 __ BNE $3eee ; (dir_readentry.s89 + 0)
.s88:
3eea : a9 14 __ LDA #$14
3eec : d0 76 __ BNE $3f64 ; (dir_readentry.s55 + 0)
.s89:
3eee : a5 45 __ LDA T1 + 0 
3ef0 : c9 4c __ CMP #$4c
3ef2 : d0 14 __ BNE $3f08 ; (dir_readentry.s94 + 0)
.s97:
3ef4 : a6 43 __ LDX T0 + 0 
3ef6 : bd 7e 52 LDA $527e,x ; (_cinfo + 126)
3ef9 : c9 4e __ CMP #$4e
3efb : d0 0b __ BNE $3f08 ; (dir_readentry.s94 + 0)
.s96:
3efd : bd 7f 52 LDA $527f,x ; (_cinfo + 127)
3f00 : c9 4b __ CMP #$4b
3f02 : d0 04 __ BNE $3f08 ; (dir_readentry.s94 + 0)
.s93:
3f04 : a9 03 __ LDA #$03
3f06 : d0 5c __ BNE $3f64 ; (dir_readentry.s55 + 0)
.s94:
3f08 : a9 05 __ LDA #$05
3f0a : a0 13 __ LDY #$13
3f0c : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f0e : a6 1b __ LDX ACCU + 0 
3f10 : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3f13 : c9 22 __ CMP #$22
3f15 : d0 02 __ BNE $3f19 ; (dir_readentry.s100 + 0)
.s98:
3f17 : e6 1b __ INC ACCU + 0 
.s100:
3f19 : a9 00 __ LDA #$00
3f1b : 85 45 __ STA T1 + 0 
3f1d : a6 1b __ LDX ACCU + 0 
3f1f : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3f22 : c9 20 __ CMP #$20
3f24 : d0 02 __ BNE $3f28 ; (dir_readentry.l105 + 0)
.s101:
3f26 : e6 1b __ INC ACCU + 0 
.l105:
3f28 : a6 1b __ LDX ACCU + 0 
3f2a : bd 80 52 LDA $5280,x ; (linebuffer + 0)
3f2d : f0 05 __ BEQ $3f34 ; (dir_readentry.s207 + 0)
.s108:
3f2f : a6 45 __ LDX T1 + 0 
3f31 : 9d f9 51 STA $51f9,x ; (disk_id_buf + 0)
.s207:
3f34 : e6 1b __ INC ACCU + 0 
3f36 : e6 45 __ INC T1 + 0 
3f38 : a6 45 __ LDX T1 + 0 
3f3a : e0 05 __ CPX #$05
3f3c : 90 ea __ BCC $3f28 ; (dir_readentry.l105 + 0)
.s107:
3f3e : a9 00 __ LDA #$00
3f40 : 9d f9 51 STA $51f9,x ; (disk_id_buf + 0)
3f43 : a0 0f __ LDY #$0f
3f45 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
3f47 : f0 08 __ BEQ $3f51 ; (dir_readentry.l115 + 0)
.s119:
3f49 : c9 20 __ CMP #$20
3f4b : f0 04 __ BEQ $3f51 ; (dir_readentry.l115 + 0)
.s118:
3f4d : c9 a0 __ CMP #$a0
3f4f : d0 0e __ BNE $3f5f ; (dir_readentry.s1096 + 0)
.l115:
3f51 : a9 00 __ LDA #$00
3f53 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f55 : 88 __ __ DEY
3f56 : f0 07 __ BEQ $3f5f ; (dir_readentry.s1096 + 0)
.s112:
3f58 : b1 13 __ LDA (P6),y ; (l_dirent + 0)
3f5a : f0 f5 __ BEQ $3f51 ; (dir_readentry.l115 + 0)
3f5c : 4c 49 3f JMP $3f49 ; (dir_readentry.s119 + 0)
.s1096:
3f5f : a9 00 __ LDA #$00
3f61 : 4c ae 3d JMP $3dae ; (dir_readentry.s1095 + 0)
.s55:
3f64 : a0 13 __ LDY #$13
3f66 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f68 : a6 1b __ LDX ACCU + 0 
3f6a : bd 7c 52 LDA $527c,x ; (_cinfo + 124)
3f6d : c9 3c __ CMP #$3c
3f6f : d0 04 __ BNE $3f75 ; (dir_readentry.s165 + 0)
.s164:
3f71 : a9 01 __ LDA #$01
3f73 : d0 02 __ BNE $3f77 ; (dir_readentry.s1093 + 0)
.s165:
3f75 : a9 03 __ LDA #$03
.s1093:
3f77 : a0 14 __ LDY #$14
3f79 : 91 13 __ STA (P6),y ; (l_dirent + 0)
3f7b : d0 e2 __ BNE $3f5f ; (dir_readentry.s1096 + 0)
.s37:
3f7d : e8 __ __ INX
3f7e : 86 45 __ STX T1 + 0 
3f80 : 4c e3 3d JMP $3de3 ; (dir_readentry.s127 + 0)
.s5:
3f83 : a9 07 __ LDA #$07
3f85 : 4c ae 3d JMP $3dae ; (dir_readentry.s1095 + 0)
--------------------------------------------------------------------
3f88 : __ __ __ BYT 5b 25 30 32 55 5d 00                            : [%02U].
--------------------------------------------------------------------
vdcwin_put_char: ; vdcwin_put_char(struct VDCWin*,u8)->void
.s1000:
3f8f : 38 __ __ SEC
3f90 : a5 23 __ LDA SP + 0 
3f92 : e9 06 __ SBC #$06
3f94 : 85 23 __ STA SP + 0 
3f96 : b0 02 __ BCS $3f9a ; (vdcwin_put_char.s0 + 0)
3f98 : c6 24 __ DEC SP + 1 
.s0:
3f9a : a5 17 __ LDA P10 ; (win + 0)
3f9c : 85 11 __ STA P4 
3f9e : a5 18 __ LDA P11 ; (win + 1)
3fa0 : 85 12 __ STA P5 
3fa2 : a0 04 __ LDY #$04
3fa4 : b1 17 __ LDA (P10),y ; (win + 0)
3fa6 : 85 13 __ STA P6 
3fa8 : c8 __ __ INY
3fa9 : b1 17 __ LDA (P10),y ; (win + 0)
3fab : 85 14 __ STA P7 
3fad : ad f8 bf LDA $bff8 ; (sstack + 0)
3fb0 : 85 15 __ STA P8 
3fb2 : 20 01 40 JSR $4001 ; (vdcwin_putat_char.s0 + 0)
3fb5 : a6 13 __ LDX P6 
3fb7 : e8 __ __ INX
3fb8 : 8a __ __ TXA
3fb9 : a0 04 __ LDY #$04
3fbb : 91 17 __ STA (P10),y ; (win + 0)
3fbd : a0 02 __ LDY #$02
3fbf : d1 17 __ CMP (P10),y ; (win + 0)
3fc1 : d0 32 __ BNE $3ff5 ; (vdcwin_put_char.s1001 + 0)
.s1:
3fc3 : a9 00 __ LDA #$00
3fc5 : a0 04 __ LDY #$04
3fc7 : 91 17 __ STA (P10),y ; (win + 0)
3fc9 : 18 __ __ CLC
3fca : a5 14 __ LDA P7 
3fcc : 69 01 __ ADC #$01
3fce : c8 __ __ INY
3fcf : 91 17 __ STA (P10),y ; (win + 0)
3fd1 : a0 03 __ LDY #$03
3fd3 : d1 17 __ CMP (P10),y ; (win + 0)
3fd5 : d0 1e __ BNE $3ff5 ; (vdcwin_put_char.s1001 + 0)
.s4:
3fd7 : a5 14 __ LDA P7 
3fd9 : a0 05 __ LDY #$05
3fdb : 91 17 __ STA (P10),y ; (win + 0)
3fdd : a5 17 __ LDA P10 ; (win + 0)
3fdf : a0 02 __ LDY #$02
3fe1 : 91 23 __ STA (SP + 0),y 
3fe3 : a5 18 __ LDA P11 ; (win + 1)
3fe5 : c8 __ __ INY
3fe6 : 91 23 __ STA (SP + 0),y 
3fe8 : a9 81 __ LDA #$81
3fea : c8 __ __ INY
3feb : 91 23 __ STA (SP + 0),y 
3fed : a9 41 __ LDA #$41
3fef : c8 __ __ INY
3ff0 : 91 23 __ STA (SP + 0),y 
3ff2 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
.s1001:
3ff5 : 18 __ __ CLC
3ff6 : a5 23 __ LDA SP + 0 
3ff8 : 69 06 __ ADC #$06
3ffa : 85 23 __ STA SP + 0 
3ffc : 90 02 __ BCC $4000 ; (vdcwin_put_char.s1001 + 11)
3ffe : e6 24 __ INC SP + 1 
4000 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_char: ; vdcwin_putat_char(struct VDCWin*,u8,u8,u8)->void
.s0:
4001 : a5 15 __ LDA P8 ; (ch + 0)
4003 : 4a __ __ LSR
4004 : 4a __ __ LSR
4005 : 4a __ __ LSR
4006 : 4a __ __ LSR
4007 : 4a __ __ LSR
4008 : aa __ __ TAX
4009 : bd 62 50 LDA $5062,x ; (p2smap + 0)
400c : 45 15 __ EOR P8 ; (ch + 0)
400e : 85 0f __ STA P2 
4010 : a5 13 __ LDA P6 ; (x + 0)
4012 : 18 __ __ CLC
4013 : a0 00 __ LDY #$00
4015 : 71 11 __ ADC (P4),y ; (win + 0)
4017 : 85 0d __ STA P0 
4019 : a5 14 __ LDA P7 ; (y + 0)
401b : 18 __ __ CLC
401c : c8 __ __ INY
401d : 71 11 __ ADC (P4),y ; (win + 0)
401f : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
4021 : ad da 50 LDA $50da ; (vdc_state + 7)
4024 : 85 10 __ STA P3 
4026 : 4c ae 32 JMP $32ae ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdcwin_printline: ; vdcwin_printline(struct VDCWin*,const u8*)->void
.s1000:
4029 : a5 53 __ LDA T0 + 0 
402b : 8d f4 bf STA $bff4 ; (buffer + 12)
402e : a5 54 __ LDA T0 + 1 
4030 : 8d f5 bf STA $bff5 ; (buffer + 13)
4033 : a5 55 __ LDA T1 + 0 
4035 : 8d f6 bf STA $bff6 ; (buffer + 14)
4038 : 38 __ __ SEC
4039 : a5 23 __ LDA SP + 0 
403b : e9 06 __ SBC #$06
403d : 85 23 __ STA SP + 0 
403f : b0 02 __ BCS $4043 ; (vdcwin_printline.s0 + 0)
4041 : c6 24 __ DEC SP + 1 
.s0:
4043 : a0 08 __ LDY #$08
4045 : b1 23 __ LDA (SP + 0),y 
4047 : 85 53 __ STA T0 + 0 
4049 : a0 02 __ LDY #$02
404b : 91 23 __ STA (SP + 0),y 
404d : a0 09 __ LDY #$09
404f : b1 23 __ LDA (SP + 0),y 
4051 : 85 54 __ STA T0 + 1 
4053 : a0 03 __ LDY #$03
4055 : 91 23 __ STA (SP + 0),y 
4057 : a0 0a __ LDY #$0a
4059 : b1 23 __ LDA (SP + 0),y 
405b : a0 04 __ LDY #$04
405d : 91 23 __ STA (SP + 0),y 
405f : a0 0b __ LDY #$0b
4061 : b1 23 __ LDA (SP + 0),y 
4063 : a0 05 __ LDY #$05
4065 : 91 23 __ STA (SP + 0),y 
4067 : 20 d1 40 JSR $40d1 ; (vdcwin_put_string.s1000 + 0)
406a : a9 00 __ LDA #$00
406c : a0 04 __ LDY #$04
406e : 91 53 __ STA (T0 + 0),y 
4070 : 88 __ __ DEY
4071 : b1 53 __ LDA (T0 + 0),y 
4073 : 85 55 __ STA T1 + 0 
4075 : 38 __ __ SEC
4076 : e9 01 __ SBC #$01
4078 : 85 44 __ STA T3 + 0 
407a : a0 05 __ LDY #$05
407c : b1 53 __ LDA (T0 + 0),y 
407e : 90 0b __ BCC $408b ; (vdcwin_printline.s2 + 0)
.s1002:
4080 : aa __ __ TAX
4081 : e4 44 __ CPX T3 + 0 
4083 : b0 06 __ BCS $408b ; (vdcwin_printline.s2 + 0)
.s1:
4085 : e8 __ __ INX
4086 : 8a __ __ TXA
4087 : 91 53 __ STA (T0 + 0),y 
4089 : 90 2b __ BCC $40b6 ; (vdcwin_printline.s1001 + 0)
.s2:
408b : a5 53 __ LDA T0 + 0 
408d : 85 15 __ STA P8 
408f : a5 54 __ LDA T0 + 1 
4091 : 85 16 __ STA P9 
4093 : 20 82 41 JSR $4182 ; (vdcwin_scroll_up.s0 + 0)
4096 : a9 20 __ LDA #$20
4098 : 85 11 __ STA P4 
409a : a0 00 __ LDY #$00
409c : b1 15 __ LDA (P8),y 
409e : 85 0f __ STA P2 ; (str + 0)
40a0 : a0 02 __ LDY #$02
40a2 : b1 15 __ LDA (P8),y 
40a4 : 85 12 __ STA P5 
40a6 : 88 __ __ DEY
40a7 : 84 13 __ STY P6 
40a9 : b1 15 __ LDA (P8),y 
40ab : 18 __ __ CLC
40ac : 65 55 __ ADC T1 + 0 
40ae : 38 __ __ SEC
40af : e9 01 __ SBC #$01
40b1 : 85 10 __ STA P3 ; (str + 1)
40b3 : 20 7b 2c JSR $2c7b ; (vdc_clear.s0 + 0)
.s1001:
40b6 : 18 __ __ CLC
40b7 : a5 23 __ LDA SP + 0 
40b9 : 69 06 __ ADC #$06
40bb : 85 23 __ STA SP + 0 
40bd : 90 02 __ BCC $40c1 ; (vdcwin_printline.s1001 + 11)
40bf : e6 24 __ INC SP + 1 
40c1 : ad f4 bf LDA $bff4 ; (buffer + 12)
40c4 : 85 53 __ STA T0 + 0 
40c6 : ad f5 bf LDA $bff5 ; (buffer + 13)
40c9 : 85 54 __ STA T0 + 1 
40cb : ad f6 bf LDA $bff6 ; (buffer + 14)
40ce : 85 55 __ STA T1 + 0 
40d0 : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_put_string: ; vdcwin_put_string(struct VDCWin*,const u8*)->void
.s1000:
40d1 : 38 __ __ SEC
40d2 : a5 23 __ LDA SP + 0 
40d4 : e9 0b __ SBC #$0b
40d6 : 85 23 __ STA SP + 0 
40d8 : b0 02 __ BCS $40dc ; (vdcwin_put_string.s0 + 0)
40da : c6 24 __ DEC SP + 1 
.s0:
40dc : a0 0d __ LDY #$0d
40de : b1 23 __ LDA (SP + 0),y 
40e0 : 85 11 __ STA P4 
40e2 : c8 __ __ INY
40e3 : b1 23 __ LDA (SP + 0),y 
40e5 : 85 12 __ STA P5 
40e7 : a0 04 __ LDY #$04
40e9 : b1 11 __ LDA (P4),y 
40eb : 85 13 __ STA P6 
40ed : c8 __ __ INY
40ee : b1 11 __ LDA (P4),y 
40f0 : 85 14 __ STA P7 
40f2 : a0 0f __ LDY #$0f
40f4 : b1 23 __ LDA (SP + 0),y 
40f6 : 85 15 __ STA P8 
40f8 : c8 __ __ INY
40f9 : b1 23 __ LDA (SP + 0),y 
40fb : 85 16 __ STA P9 
40fd : 20 4c 41 JSR $414c ; (vdcwin_putat_string.s0 + 0)
4100 : 18 __ __ CLC
4101 : a5 1b __ LDA ACCU + 0 
4103 : 65 13 __ ADC P6 
4105 : a0 04 __ LDY #$04
4107 : 91 11 __ STA (P4),y 
4109 : a0 02 __ LDY #$02
410b : d1 11 __ CMP (P4),y 
410d : 90 31 __ BCC $4140 ; (vdcwin_put_string.s1001 + 0)
.s1:
410f : a9 00 __ LDA #$00
4111 : a0 04 __ LDY #$04
4113 : 91 11 __ STA (P4),y 
4115 : a5 14 __ LDA P7 
4117 : 69 00 __ ADC #$00
4119 : c8 __ __ INY
411a : 91 11 __ STA (P4),y 
411c : a0 03 __ LDY #$03
411e : d1 11 __ CMP (P4),y 
4120 : d0 1e __ BNE $4140 ; (vdcwin_put_string.s1001 + 0)
.s4:
4122 : a5 14 __ LDA P7 
4124 : a0 05 __ LDY #$05
4126 : 91 11 __ STA (P4),y 
4128 : a5 11 __ LDA P4 
412a : a0 02 __ LDY #$02
412c : 91 23 __ STA (SP + 0),y 
412e : a5 12 __ LDA P5 
4130 : c8 __ __ INY
4131 : 91 23 __ STA (SP + 0),y 
4133 : a9 81 __ LDA #$81
4135 : c8 __ __ INY
4136 : 91 23 __ STA (SP + 0),y 
4138 : a9 41 __ LDA #$41
413a : c8 __ __ INY
413b : 91 23 __ STA (SP + 0),y 
413d : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
.s1001:
4140 : 18 __ __ CLC
4141 : a5 23 __ LDA SP + 0 
4143 : 69 0b __ ADC #$0b
4145 : 85 23 __ STA SP + 0 
4147 : 90 02 __ BCC $414b ; (vdcwin_put_string.s1001 + 11)
4149 : e6 24 __ INC SP + 1 
414b : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_putat_string: ; vdcwin_putat_string(struct VDCWin*,u8,u8,const u8*)->u8
.s0:
414c : a9 00 __ LDA #$00
414e : 85 43 __ STA T0 + 0 
4150 : f0 26 __ BEQ $4178 ; (vdcwin_putat_string.l1 + 0)
.s2:
4152 : 4a __ __ LSR
4153 : 4a __ __ LSR
4154 : 4a __ __ LSR
4155 : 4a __ __ LSR
4156 : 4a __ __ LSR
4157 : aa __ __ TAX
4158 : bd 62 50 LDA $5062,x ; (p2smap + 0)
415b : 51 15 __ EOR (P8),y ; (str + 0)
415d : 85 0f __ STA P2 
415f : a5 13 __ LDA P6 ; (x + 0)
4161 : 18 __ __ CLC
4162 : a0 00 __ LDY #$00
4164 : 71 11 __ ADC (P4),y ; (win + 0)
4166 : 18 __ __ CLC
4167 : 65 43 __ ADC T0 + 0 
4169 : 85 0d __ STA P0 
416b : a5 14 __ LDA P7 ; (y + 0)
416d : 18 __ __ CLC
416e : c8 __ __ INY
416f : 71 11 __ ADC (P4),y ; (win + 0)
4171 : 85 0e __ STA P1 
4173 : 20 21 40 JSR $4021 ; (vdc_printc@proxy + 0)
4176 : e6 43 __ INC T0 + 0 
.l1:
4178 : a4 43 __ LDY T0 + 0 
417a : b1 15 __ LDA (P8),y ; (str + 0)
417c : d0 d4 __ BNE $4152 ; (vdcwin_putat_string.s2 + 0)
.s3:
417e : 84 1b __ STY ACCU + 0 
.s1001:
4180 : 60 __ __ RTS
--------------------------------------------------------------------
4181 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vdcwin_scroll_up: ; vdcwin_scroll_up(struct VDCWin*,u8)->void
.s0:
4182 : a9 00 __ LDA #$00
4184 : 85 46 __ STA T0 + 0 
4186 : a0 02 __ LDY #$02
4188 : b1 15 __ LDA (P8),y ; (win + 0)
418a : 85 47 __ STA T2 + 0 
418c : a0 06 __ LDY #$06
418e : b1 15 __ LDA (P8),y ; (win + 0)
4190 : 85 48 __ STA T3 + 0 
4192 : c8 __ __ INY
4193 : b1 15 __ LDA (P8),y ; (win + 0)
4195 : 85 49 __ STA T3 + 1 
4197 : c8 __ __ INY
4198 : b1 15 __ LDA (P8),y ; (win + 0)
419a : 85 4a __ STA T4 + 0 
419c : c8 __ __ INY
419d : b1 15 __ LDA (P8),y ; (win + 0)
419f : 85 4b __ STA T4 + 1 
41a1 : ad d6 50 LDA $50d6 ; (vdc_state + 3)
41a4 : 85 4c __ STA T5 + 0 
41a6 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
41a9 : 85 4d __ STA T5 + 1 
41ab : 4c fe 41 JMP $41fe ; (vdcwin_scroll_up.l1 + 0)
.s2:
41ae : a5 48 __ LDA T3 + 0 
41b0 : 85 0f __ STA P2 
41b2 : 18 __ __ CLC
41b3 : 65 4c __ ADC T5 + 0 
41b5 : 85 11 __ STA P4 
41b7 : a5 49 __ LDA T3 + 1 
41b9 : 85 10 __ STA P3 
41bb : 65 4d __ ADC T5 + 1 
41bd : 85 12 __ STA P5 
41bf : a5 47 __ LDA T2 + 0 
41c1 : 85 13 __ STA P6 
41c3 : a9 00 __ LDA #$00
41c5 : 85 14 __ STA P7 
41c7 : 20 0e 42 JSR $420e ; (vdc_block_copy.s0 + 0)
41ca : a5 4a __ LDA T4 + 0 
41cc : 85 0f __ STA P2 
41ce : 18 __ __ CLC
41cf : 65 4c __ ADC T5 + 0 
41d1 : 85 11 __ STA P4 
41d3 : a5 4b __ LDA T4 + 1 
41d5 : 85 10 __ STA P3 
41d7 : 65 4d __ ADC T5 + 1 
41d9 : 85 12 __ STA P5 
41db : 20 0e 42 JSR $420e ; (vdc_block_copy.s0 + 0)
41de : ad d6 50 LDA $50d6 ; (vdc_state + 3)
41e1 : 18 __ __ CLC
41e2 : 65 48 __ ADC T3 + 0 
41e4 : 85 48 __ STA T3 + 0 
41e6 : ad d7 50 LDA $50d7 ; (vdc_state + 4)
41e9 : 65 49 __ ADC T3 + 1 
41eb : 85 49 __ STA T3 + 1 
41ed : 18 __ __ CLC
41ee : a5 4a __ LDA T4 + 0 
41f0 : 6d d6 50 ADC $50d6 ; (vdc_state + 3)
41f3 : 85 4a __ STA T4 + 0 
41f5 : a5 4b __ LDA T4 + 1 
41f7 : 6d d7 50 ADC $50d7 ; (vdc_state + 4)
41fa : 85 4b __ STA T4 + 1 
41fc : e6 46 __ INC T0 + 0 
.l1:
41fe : a0 03 __ LDY #$03
4200 : b1 15 __ LDA (P8),y ; (win + 0)
4202 : 38 __ __ SEC
4203 : e9 01 __ SBC #$01
4205 : 90 a7 __ BCC $41ae ; (vdcwin_scroll_up.s2 + 0)
.s1002:
4207 : c5 46 __ CMP T0 + 0 
4209 : 90 02 __ BCC $420d ; (vdcwin_scroll_up.s1001 + 0)
.s1004:
420b : d0 a1 __ BNE $41ae ; (vdcwin_scroll_up.s2 + 0)
.s1001:
420d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_block_copy: ; vdc_block_copy(u16,u16,u16)->void
.s0:
420e : a5 14 __ LDA P7 ; (length + 1)
4210 : d0 5a __ BNE $426c ; (vdc_block_copy.s73 + 0)
.s4:
4212 : a5 0f __ LDA P2 ; (dest + 0)
4214 : 85 0d __ STA P0 
4216 : a5 10 __ LDA P3 ; (dest + 1)
4218 : 85 0e __ STA P1 
421a : 20 4b 2d JSR $2d4b ; (vdc_mem_addr.s0 + 0)
421d : a9 18 __ LDA #$18
421f : 8d 00 d6 STA $d600 
.l332:
4222 : 2c 00 d6 BIT $d600 
4225 : 10 fb __ BPL $4222 ; (vdc_block_copy.l332 + 0)
.s40:
4227 : ad 01 d6 LDA $d601 
422a : 09 80 __ ORA #$80
422c : a2 18 __ LDX #$18
422e : 8e 00 d6 STX $d600 
.l334:
4231 : 2c 00 d6 BIT $d600 
4234 : 10 fb __ BPL $4231 ; (vdc_block_copy.l334 + 0)
.s46:
4236 : 8d 01 d6 STA $d601 
4239 : a9 20 __ LDA #$20
423b : 8d 00 d6 STA $d600 
.l336:
423e : 2c 00 d6 BIT $d600 
4241 : 10 fb __ BPL $423e ; (vdc_block_copy.l336 + 0)
.s51:
4243 : a5 12 __ LDA P5 ; (src + 1)
4245 : 8d 01 d6 STA $d601 
4248 : a9 21 __ LDA #$21
424a : 8d 00 d6 STA $d600 
.l338:
424d : 2c 00 d6 BIT $d600 
4250 : 10 fb __ BPL $424d ; (vdc_block_copy.l338 + 0)
.s56:
4252 : a5 11 __ LDA P4 ; (src + 0)
4254 : 8d 01 d6 STA $d601 
4257 : a9 1f __ LDA #$1f
4259 : 8d 00 d6 STA $d600 
425c : a9 1e __ LDA #$1e
425e : 8d 00 d6 STA $d600 
.l340:
4261 : 2c 00 d6 BIT $d600 
4264 : 10 fb __ BPL $4261 ; (vdc_block_copy.l340 + 0)
.s62:
4266 : a5 13 __ LDA P6 ; (length + 0)
4268 : 8d 01 d6 STA $d601 
.s1001:
426b : 60 __ __ RTS
.s73:
426c : 85 45 __ STA T2 + 0 
426e : a5 10 __ LDA P3 ; (dest + 1)
4270 : 85 44 __ STA T0 + 1 
4272 : a5 0f __ LDA P2 ; (dest + 0)
4274 : 85 0d __ STA P0 
.l2:
4276 : 20 47 2d JSR $2d47 ; (vdc_mem_addr@proxy + 0)
4279 : a9 18 __ LDA #$18
427b : 8d 00 d6 STA $d600 
.l321:
427e : 2c 00 d6 BIT $d600 
4281 : 10 fb __ BPL $427e ; (vdc_block_copy.l321 + 0)
.s11:
4283 : ad 01 d6 LDA $d601 
4286 : 09 80 __ ORA #$80
4288 : a2 18 __ LDX #$18
428a : 8e 00 d6 STX $d600 
.l323:
428d : 2c 00 d6 BIT $d600 
4290 : 10 fb __ BPL $428d ; (vdc_block_copy.l323 + 0)
.s17:
4292 : 8d 01 d6 STA $d601 
4295 : a9 20 __ LDA #$20
4297 : 8d 00 d6 STA $d600 
.l325:
429a : 2c 00 d6 BIT $d600 
429d : 10 fb __ BPL $429a ; (vdc_block_copy.l325 + 0)
.s22:
429f : a5 12 __ LDA P5 ; (src + 1)
42a1 : 8d 01 d6 STA $d601 
42a4 : a9 21 __ LDA #$21
42a6 : 8d 00 d6 STA $d600 
.l327:
42a9 : 2c 00 d6 BIT $d600 
42ac : 10 fb __ BPL $42a9 ; (vdc_block_copy.l327 + 0)
.s27:
42ae : a5 11 __ LDA P4 ; (src + 0)
42b0 : 8d 01 d6 STA $d601 
42b3 : a9 1f __ LDA #$1f
42b5 : 8d 00 d6 STA $d600 
42b8 : a9 1e __ LDA #$1e
42ba : 8d 00 d6 STA $d600 
.l329:
42bd : 2c 00 d6 BIT $d600 
42c0 : 10 fb __ BPL $42bd ; (vdc_block_copy.l329 + 0)
.s33:
42c2 : a9 ff __ LDA #$ff
42c4 : 8d 01 d6 STA $d601 
42c7 : e6 12 __ INC P5 ; (src + 1)
42c9 : e6 44 __ INC T0 + 1 
42cb : c6 45 __ DEC T2 + 0 
42cd : d0 a7 __ BNE $4276 ; (vdc_block_copy.l2 + 0)
.s145:
42cf : a5 0d __ LDA P0 
42d1 : 85 0f __ STA P2 ; (dest + 0)
42d3 : a5 44 __ LDA T0 + 1 
42d5 : 85 10 __ STA P3 ; (dest + 1)
42d7 : 4c 12 42 JMP $4212 ; (vdc_block_copy.s4 + 0)
--------------------------------------------------------------------
42da : __ __ __ BYT 75 4e 4b 4e 4f 57 4e 20 54 59 50 45 00          : uNKNOWN TYPE.
--------------------------------------------------------------------
dir_validentry: ; dir_validentry(u8)->u8
.s0:
42e7 : ad d1 52 LDA $52d1 ; (current + 0)
42ea : 85 43 __ STA T0 + 0 
42ec : 85 0d __ STA P0 
42ee : ad d2 52 LDA $52d2 ; (current + 1)
42f1 : 85 44 __ STA T0 + 1 
42f3 : 85 0e __ STA P1 
42f5 : 20 34 33 JSR $3334 ; (strlen.s0 + 0)
42f8 : a0 13 __ LDY #$13
42fa : b1 43 __ LDA (T0 + 0),y 
42fc : c9 11 __ CMP #$11
42fe : d0 4c __ BNE $434c ; (dir_validentry.s1015 + 0)
.s3:
4300 : a5 1b __ LDA ACCU + 0 
4302 : c9 06 __ CMP #$06
4304 : 90 46 __ BCC $434c ; (dir_validentry.s1015 + 0)
.s14:
4306 : a9 00 __ LDA #$00
4308 : 8d f2 bf STA $bff2 ; (buffer + 10)
430b : 8d f3 bf STA $bff3 ; (buffer + 11)
430e : 8d f4 bf STA $bff4 ; (buffer + 12)
4311 : 8d f5 bf STA $bff5 ; (buffer + 13)
4314 : 8d f6 bf STA $bff6 ; (buffer + 14)
4317 : 8d f7 bf STA $bff7 ; (buffer + 15)
431a : a5 1b __ LDA ACCU + 0 
431c : e9 05 __ SBC #$05
431e : 18 __ __ CLC
431f : 65 0d __ ADC P0 
4321 : 85 43 __ STA T0 + 0 
4323 : 90 02 __ BCC $4327 ; (dir_validentry.s1011 + 0)
.s1010:
4325 : e6 44 __ INC T0 + 1 
.s1011:
4327 : a0 00 __ LDY #$00
.l1008:
4329 : b1 43 __ LDA (T0 + 0),y 
432b : 99 f2 bf STA $bff2,y ; (buffer + 10)
432e : c8 __ __ INY
432f : c0 05 __ CPY #$05
4331 : 90 f6 __ BCC $4329 ; (dir_validentry.l1008 + 0)
.s1009:
4333 : a9 f2 __ LDA #$f2
4335 : 85 0d __ STA P0 
4337 : a9 bf __ LDA #$bf
4339 : 85 0e __ STA P1 
433b : a9 84 __ LDA #$84
433d : 85 0f __ STA P2 
433f : a9 43 __ LDA #$43
4341 : 85 10 __ STA P3 
4343 : 20 55 43 JSR $4355 ; (strcmp.s0 + 0)
4346 : a5 1b __ LDA ACCU + 0 
4348 : 05 1c __ ORA ACCU + 1 
434a : f0 04 __ BEQ $4350 ; (dir_validentry.s1012 + 0)
.s1015:
434c : a9 00 __ LDA #$00
434e : f0 02 __ BEQ $4352 ; (dir_validentry.s1001 + 0)
.s1012:
4350 : a9 01 __ LDA #$01
.s1001:
4352 : 85 1b __ STA ACCU + 0 
4354 : 60 __ __ RTS
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i16
.s0:
4355 : a0 00 __ LDY #$00
4357 : 84 1c __ STY ACCU + 1 
4359 : b1 0d __ LDA (P0),y 
435b : f0 16 __ BEQ $4373 ; (strcmp.s0 + 30)
435d : d1 0f __ CMP (P2),y 
435f : d0 16 __ BNE $4377 ; (strcmp.s0 + 34)
4361 : c8 __ __ INY
4362 : b1 0d __ LDA (P0),y 
4364 : f0 0d __ BEQ $4373 ; (strcmp.s0 + 30)
4366 : d1 0f __ CMP (P2),y 
4368 : d0 0d __ BNE $4377 ; (strcmp.s0 + 34)
436a : c8 __ __ INY
436b : d0 ec __ BNE $4359 ; (strcmp.s0 + 4)
436d : e6 0e __ INC P1 
436f : e6 10 __ INC P3 
4371 : d0 e6 __ BNE $4359 ; (strcmp.s0 + 4)
4373 : d1 0f __ CMP (P2),y 
4375 : f0 0a __ BEQ $4381 ; (strcmp.s0 + 44)
4377 : b0 06 __ BCS $437f ; (strcmp.s0 + 42)
4379 : a9 ff __ LDA #$ff
437b : 85 1c __ STA ACCU + 1 
437d : 30 02 __ BMI $4381 ; (strcmp.s0 + 44)
437f : a9 01 __ LDA #$01
4381 : 85 1b __ STA ACCU + 0 
.s1001:
4383 : 60 __ __ RTS
--------------------------------------------------------------------
4384 : __ __ __ BYT 2e 50 52 4f 4a 00                               : .PROJ.
--------------------------------------------------------------------
drawDirFrame: ; drawDirFrame(u8)->void
.s1000:
438a : 38 __ __ SEC
438b : a5 23 __ LDA SP + 0 
438d : e9 0a __ SBC #$0a
438f : 85 23 __ STA SP + 0 
4391 : b0 02 __ BCS $4395 ; (drawDirFrame.s0 + 0)
4393 : c6 24 __ DEC SP + 1 
.s0:
4395 : a9 0a __ LDA #$0a
4397 : 85 0f __ STA P2 
4399 : a9 05 __ LDA #$05
439b : 85 10 __ STA P3 
439d : a9 28 __ LDA #$28
439f : 85 12 __ STA P5 
43a1 : a9 10 __ LDA #$10
43a3 : 85 13 __ STA P6 
43a5 : 20 77 2c JSR $2c77 ; (vdc_clear@proxy + 0)
43a8 : a9 80 __ LDA #$80
43aa : a0 02 __ LDY #$02
43ac : 91 23 __ STA (SP + 0),y 
43ae : a9 52 __ LDA #$52
43b0 : c8 __ __ INY
43b1 : 91 23 __ STA (SP + 0),y 
43b3 : a9 13 __ LDA #$13
43b5 : c8 __ __ INY
43b6 : 91 23 __ STA (SP + 0),y 
43b8 : a9 44 __ LDA #$44
43ba : c8 __ __ INY
43bb : 91 23 __ STA (SP + 0),y 
43bd : ad fd bf LDA $bffd ; (sstack + 5)
43c0 : c8 __ __ INY
43c1 : 91 23 __ STA (SP + 0),y 
43c3 : a9 00 __ LDA #$00
43c5 : c8 __ __ INY
43c6 : 91 23 __ STA (SP + 0),y 
43c8 : a9 d8 __ LDA #$d8
43ca : c8 __ __ INY
43cb : 91 23 __ STA (SP + 0),y 
43cd : a9 51 __ LDA #$51
43cf : c8 __ __ INY
43d0 : 91 23 __ STA (SP + 0),y 
43d2 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
43d5 : 20 0e 50 JSR $500e ; (vdc_prints@proxy + 0)
43d8 : a9 80 __ LDA #$80
43da : a0 02 __ LDY #$02
43dc : 91 23 __ STA (SP + 0),y 
43de : a9 52 __ LDA #$52
43e0 : c8 __ __ INY
43e1 : 91 23 __ STA (SP + 0),y 
43e3 : a9 20 __ LDA #$20
43e5 : c8 __ __ INY
43e6 : 91 23 __ STA (SP + 0),y 
43e8 : a9 44 __ LDA #$44
43ea : c8 __ __ INY
43eb : 91 23 __ STA (SP + 0),y 
43ed : ad f7 51 LDA $51f7 ; (cwd + 31)
43f0 : c8 __ __ INY
43f1 : 91 23 __ STA (SP + 0),y 
43f3 : ad f8 51 LDA $51f8 ; (cwd + 32)
43f6 : c8 __ __ INY
43f7 : 91 23 __ STA (SP + 0),y 
43f9 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
43fc : a9 0b __ LDA #$0b
43fe : 85 11 __ STA P4 
4400 : a9 14 __ LDA #$14
4402 : 85 12 __ STA P5 
4404 : 20 21 50 JSR $5021 ; (vdc_prints@proxy + 0)
.s1001:
4407 : 18 __ __ CLC
4408 : a5 23 __ LDA SP + 0 
440a : 69 0a __ ADC #$0a
440c : 85 23 __ STA SP + 0 
440e : 90 02 __ BCC $4412 ; (drawDirFrame.s1001 + 11)
4410 : e6 24 __ INC SP + 1 
4412 : 60 __ __ RTS
--------------------------------------------------------------------
4413 : __ __ __ BYT 5b 25 30 32 55 5d 20 25 2e 32 30 53 00          : [%02U] %.20S.
--------------------------------------------------------------------
4420 : __ __ __ BYT 25 55 20 42 4c 4f 43 4b 53 20 46 52 45 45 00    : %U BLOCKS FREE.
--------------------------------------------------------------------
printElementPriv: ; printElementPriv(const u8)->void
.s1000:
442f : a2 03 __ LDX #$03
4431 : b5 53 __ LDA T1 + 0,x 
4433 : 9d d6 bf STA $bfd6,x ; (buff + 44)
4436 : ca __ __ DEX
4437 : 10 f8 __ BPL $4431 ; (printElementPriv.s1000 + 2)
4439 : 38 __ __ SEC
443a : a5 23 __ LDA SP + 0 
443c : e9 0a __ SBC #$0a
443e : 85 23 __ STA SP + 0 
4440 : b0 02 __ BCS $4444 ; (printElementPriv.s0 + 0)
4442 : c6 24 __ DEC SP + 1 
.s0:
4444 : a9 0c __ LDA #$0c
4446 : 8d f0 50 STA $50f0 ; (fullscreen + 4)
4449 : ad ff 4b LDA $4bff ; (mc_pd_normal + 0)
444c : 8d da 50 STA $50da ; (vdc_state + 7)
444f : ad fd bf LDA $bffd ; (sstack + 5)
4452 : 8d f1 50 STA $50f1 ; (fullscreen + 5)
4455 : ad d1 52 LDA $52d1 ; (current + 0)
4458 : 85 53 __ STA T1 + 0 
445a : ad d2 52 LDA $52d2 ; (current + 1)
445d : 85 54 __ STA T1 + 1 
445f : cd f2 51 CMP $51f2 ; (cwd + 26)
4462 : d0 0d __ BNE $4471 ; (printElementPriv.s3 + 0)
.s1011:
4464 : a5 53 __ LDA T1 + 0 
4466 : cd f1 51 CMP $51f1 ; (cwd + 25)
4469 : d0 06 __ BNE $4471 ; (printElementPriv.s3 + 0)
.s1:
446b : ad 6e 50 LDA $506e ; (mc_pd_select + 0)
446e : 8d da 50 STA $50da ; (vdc_state + 7)
.s3:
4471 : a0 ff __ LDY #$ff
.l1002:
4473 : c8 __ __ INY
4474 : b1 53 __ LDA (T1 + 0),y 
4476 : 99 80 52 STA $5280,y ; (linebuffer + 0)
4479 : d0 f8 __ BNE $4473 ; (printElementPriv.l1002 + 0)
.s1003:
447b : a9 80 __ LDA #$80
447d : a0 08 __ LDY #$08
447f : 91 23 __ STA (SP + 0),y 
4481 : a9 52 __ LDA #$52
4483 : c8 __ __ INY
4484 : 91 23 __ STA (SP + 0),y 
4486 : a9 90 __ LDA #$90
4488 : a0 02 __ LDY #$02
448a : 91 23 __ STA (SP + 0),y 
448c : a9 53 __ LDA #$53
448e : c8 __ __ INY
448f : 91 23 __ STA (SP + 0),y 
4491 : a0 11 __ LDY #$11
4493 : b1 53 __ LDA (T1 + 0),y 
4495 : 85 1b __ STA ACCU + 0 
4497 : c8 __ __ INY
4498 : b1 53 __ LDA (T1 + 0),y 
449a : a0 07 __ LDY #$07
449c : 91 23 __ STA (SP + 0),y 
449e : aa __ __ TAX
449f : a5 1b __ LDA ACCU + 0 
44a1 : 88 __ __ DEY
44a2 : 91 23 __ STA (SP + 0),y 
44a4 : e0 27 __ CPX #$27
44a6 : d0 02 __ BNE $44aa ; (printElementPriv.s1010 + 0)
.s1009:
44a8 : c9 10 __ CMP #$10
.s1010:
44aa : b0 06 __ BCS $44b2 ; (printElementPriv.s10 + 0)
.s9:
44ac : a9 45 __ LDA #$45
44ae : a2 62 __ LDX #$62
44b0 : 90 04 __ BCC $44b6 ; (printElementPriv.s11 + 0)
.s10:
44b2 : a9 45 __ LDA #$45
44b4 : a2 6d __ LDX #$6d
.s11:
44b6 : 85 54 __ STA T1 + 1 
44b8 : 8a __ __ TXA
44b9 : a0 04 __ LDY #$04
44bb : 91 23 __ STA (SP + 0),y 
44bd : a5 54 __ LDA T1 + 1 
44bf : c8 __ __ INY
44c0 : 91 23 __ STA (SP + 0),y 
44c2 : 20 a8 33 JSR $33a8 ; (sprintf.s0 + 0)
44c5 : a9 90 __ LDA #$90
44c7 : a0 04 __ LDY #$04
44c9 : 91 23 __ STA (SP + 0),y 
44cb : a9 53 __ LDA #$53
44cd : c8 __ __ INY
44ce : 91 23 __ STA (SP + 0),y 
44d0 : a9 ec __ LDA #$ec
44d2 : a0 02 __ LDY #$02
44d4 : 91 23 __ STA (SP + 0),y 
44d6 : a9 50 __ LDA #$50
44d8 : c8 __ __ INY
44d9 : 91 23 __ STA (SP + 0),y 
44db : 20 d1 40 JSR $40d1 ; (vdcwin_put_string.s1000 + 0)
44de : ad d1 52 LDA $52d1 ; (current + 0)
44e1 : 85 55 __ STA T3 + 0 
44e3 : ad d2 52 LDA $52d2 ; (current + 1)
44e6 : 85 56 __ STA T3 + 1 
44e8 : a0 13 __ LDY #$13
44ea : b1 55 __ LDA (T3 + 0),y 
44ec : 20 77 45 JSR $4577 ; (fileTypeToStr.s1000 + 0)
44ef : a0 ff __ LDY #$ff
.l1004:
44f1 : c8 __ __ INY
44f2 : b1 1b __ LDA (ACCU + 0),y 
44f4 : 99 90 53 STA $5390,y ; (linebuffer2 + 0)
44f7 : d0 f8 __ BNE $44f1 ; (printElementPriv.l1004 + 0)
.s1005:
44f9 : a0 12 __ LDY #$12
44fb : b1 55 __ LDA (T3 + 0),y 
44fd : c9 27 __ CMP #$27
44ff : d0 05 __ BNE $4506 ; (printElementPriv.s1008 + 0)
.s1007:
4501 : 88 __ __ DEY
4502 : b1 55 __ LDA (T3 + 0),y 
4504 : c9 10 __ CMP #$10
.s1008:
4506 : 90 26 __ BCC $452e ; (printElementPriv.s7 + 0)
.s8:
4508 : a5 55 __ LDA T3 + 0 
450a : 85 0d __ STA P0 
450c : a5 56 __ LDA T3 + 1 
450e : 85 0e __ STA P1 
4510 : 20 34 33 JSR $3334 ; (strlen.s0 + 0)
4513 : a5 1c __ LDA ACCU + 1 
4515 : d0 17 __ BNE $452e ; (printElementPriv.s7 + 0)
.s1006:
4517 : a5 1b __ LDA ACCU + 0 
4519 : c9 10 __ CMP #$10
451b : d0 11 __ BNE $452e ; (printElementPriv.s7 + 0)
.s5:
451d : ad 91 53 LDA $5391 ; (linebuffer2 + 1)
4520 : 8d 90 53 STA $5390 ; (linebuffer2 + 0)
4523 : ad 92 53 LDA $5392 ; (linebuffer2 + 2)
4526 : 8d 91 53 STA $5391 ; (linebuffer2 + 1)
4529 : a9 00 __ LDA #$00
452b : 8d 92 53 STA $5392 ; (linebuffer2 + 2)
.s7:
452e : a9 ec __ LDA #$ec
4530 : a0 02 __ LDY #$02
4532 : 91 23 __ STA (SP + 0),y 
4534 : a9 50 __ LDA #$50
4536 : c8 __ __ INY
4537 : 91 23 __ STA (SP + 0),y 
4539 : a9 90 __ LDA #$90
453b : c8 __ __ INY
453c : 91 23 __ STA (SP + 0),y 
453e : a9 53 __ LDA #$53
4540 : c8 __ __ INY
4541 : 91 23 __ STA (SP + 0),y 
4543 : 20 d1 40 JSR $40d1 ; (vdcwin_put_string.s1000 + 0)
4546 : ad ff 46 LDA $46ff ; (mc_menupopup + 0)
4549 : 8d da 50 STA $50da ; (vdc_state + 7)
.s1001:
454c : 18 __ __ CLC
454d : a5 23 __ LDA SP + 0 
454f : 69 0a __ ADC #$0a
4551 : 85 23 __ STA SP + 0 
4553 : 90 02 __ BCC $4557 ; (printElementPriv.s1001 + 11)
4555 : e6 24 __ INC SP + 1 
4557 : a2 03 __ LDX #$03
4559 : bd d6 bf LDA $bfd6,x ; (buff + 44)
455c : 95 53 __ STA T1 + 0,x 
455e : ca __ __ DEX
455f : 10 f8 __ BPL $4559 ; (printElementPriv.s1001 + 13)
4561 : 60 __ __ RTS
--------------------------------------------------------------------
4562 : __ __ __ BYT 25 34 55 20 25 2d 31 36 53 20 00                : %4U %-16S .
--------------------------------------------------------------------
456d : __ __ __ BYT 25 55 20 25 2d 31 35 53 20 00                   : %U %-15S .
--------------------------------------------------------------------
fileTypeToStr: ; fileTypeToStr(u8)->const u8*
.s1000:
4577 : aa __ __ TAX
.s0:
4578 : a8 __ __ TAY
4579 : 29 10 __ AND #$10
457b : d0 43 __ BNE $45c0 ; (fileTypeToStr.s1 + 0)
.s2:
457d : e0 06 __ CPX #$06
457f : b0 0e __ BCS $458f ; (fileTypeToStr.s3 + 0)
.s8:
4581 : 98 __ __ TYA
4582 : 0a __ __ ASL
4583 : aa __ __ TAX
4584 : bd 79 50 LDA $5079,x ; (oth_types + 0)
4587 : 85 1b __ STA ACCU + 0 
4589 : bd 7a 50 LDA $507a,x ; (oth_types + 1)
458c : 4c bd 45 JMP $45bd ; (fileTypeToStr.s1001 + 0)
.s3:
458f : a9 3f __ LDA #$3f
4591 : 8d d3 52 STA $52d3 ; (bad_type + 0)
4594 : ad 85 50 LDA $5085 ; (value2hex + 0)
4597 : 85 1b __ STA ACCU + 0 
4599 : ad 86 50 LDA $5086 ; (value2hex + 1)
459c : 85 1c __ STA ACCU + 1 
459e : 8a __ __ TXA
459f : 4a __ __ LSR
45a0 : 4a __ __ LSR
45a1 : 4a __ __ LSR
45a2 : 4a __ __ LSR
45a3 : a8 __ __ TAY
45a4 : b1 1b __ LDA (ACCU + 0),y 
45a6 : 8d d4 52 STA $52d4 ; (bad_type + 1)
45a9 : 8a __ __ TXA
45aa : 29 0f __ AND #$0f
45ac : a8 __ __ TAY
45ad : b1 1b __ LDA (ACCU + 0),y 
45af : 8d d5 52 STA $52d5 ; (bad_type + 2)
45b2 : a9 00 __ LDA #$00
45b4 : 8d d6 52 STA $52d6 ; (bad_type + 3)
45b7 : a9 d3 __ LDA #$d3
45b9 : 85 1b __ STA ACCU + 0 
45bb : a9 52 __ LDA #$52
.s1001:
45bd : 85 1c __ STA ACCU + 1 
45bf : 60 __ __ RTS
.s1:
45c0 : 8a __ __ TXA
45c1 : 29 ef __ AND #$ef
45c3 : c9 05 __ CMP #$05
45c5 : aa __ __ TAX
45c6 : b0 c7 __ BCS $458f ; (fileTypeToStr.s3 + 0)
.s4:
45c8 : 0a __ __ ASL
45c9 : aa __ __ TAX
45ca : bd 6f 50 LDA $506f,x ; (reg_types + 0)
45cd : 85 1b __ STA ACCU + 0 
45cf : bd 70 50 LDA $5070,x ; (reg_types + 1)
45d2 : 4c bd 45 JMP $45bd ; (fileTypeToStr.s1001 + 0)
--------------------------------------------------------------------
45d5 : __ __ __ BYT 73 65 71 00                                     : seq.
--------------------------------------------------------------------
45d9 : __ __ __ BYT 70 72 67 00                                     : prg.
--------------------------------------------------------------------
45dd : __ __ __ BYT 75 72 73 00                                     : urs.
--------------------------------------------------------------------
45e1 : __ __ __ BYT 72 65 6c 00                                     : rel.
--------------------------------------------------------------------
45e5 : __ __ __ BYT 76 72 70 00                                     : vrp.
--------------------------------------------------------------------
45e9 : __ __ __ BYT 64 65 6c 00                                     : del.
--------------------------------------------------------------------
45ed : __ __ __ BYT 63 62 6d 00                                     : cbm.
--------------------------------------------------------------------
45f1 : __ __ __ BYT 64 69 72 00                                     : dir.
--------------------------------------------------------------------
45f5 : __ __ __ BYT 6c 6e 6b 00                                     : lnk.
--------------------------------------------------------------------
45f9 : __ __ __ BYT 6f 74 68 00                                     : oth.
--------------------------------------------------------------------
45fd : __ __ __ BYT 68 64 72 00                                     : hdr.
--------------------------------------------------------------------
4601 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 : 0123456789ABCDEF
4611 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4612 : __ __ __ BYT 6e 4f 20 56 41 4c 49 44 20 44 49 52 45 43 54 4f : nO VALID DIRECTO
4622 : __ __ __ BYT 52 59 20 45 4e 54 52 49 45 53 20 46 4f 55 4e 44 : RY ENTRIES FOUND
4632 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
4634 : __ __ __ BYT 20 66 31 20 64 49 52 20 52 45 46 52 2e 00       :  f1 dIR REFR..
--------------------------------------------------------------------
4642 : __ __ __ BYT 2b 2f 2d 20 64 45 56 49 43 45 00                : +/- dEVICE.
--------------------------------------------------------------------
464d : __ __ __ BYT 72 65 74 20 73 45 4c 45 43 54 00                : ret sELECT.
--------------------------------------------------------------------
4658 : __ __ __ BYT 20 20 74 20 74 4f 50 00                         :   t tOP.
--------------------------------------------------------------------
4660 : __ __ __ BYT 20 20 65 20 65 4e 44 00                         :   e eND.
--------------------------------------------------------------------
4668 : __ __ __ BYT 70 2f 75 20 70 41 47 45 20 55 50 2f 44 4f 00    : p/u pAGE UP/DO.
--------------------------------------------------------------------
4677 : __ __ __ BYT 63 55 52 20 6e 41 56 49 47 41 54 45 00          : cUR nAVIGATE.
--------------------------------------------------------------------
4684 : __ __ __ BYT 65 73 63 20 63 41 4e 43 45 4c 00                : esc cANCEL.
--------------------------------------------------------------------
vdcwin_getch: ; vdcwin_getch()->i16
.s0:
468f : 20 e4 ff JSR $ffe4 
4692 : c9 00 __ CMP #$00
4694 : f0 f9 __ BEQ $468f ; (vdcwin_getch.s0 + 0)
4696 : 85 1b __ STA ACCU + 0 
4698 : a9 00 __ LDA #$00
469a : 85 1c __ STA ACCU + 1 
.s1001:
469c : 60 __ __ RTS
--------------------------------------------------------------------
freeDir: ; freeDir()->void
.s0:
469d : ad d8 51 LDA $51d8 ; (cwd + 0)
46a0 : f0 41 __ BEQ $46e3 ; (freeDir.s1001 + 0)
.s3:
46a2 : ad ef 51 LDA $51ef ; (cwd + 23)
46a5 : 85 43 __ STA T1 + 0 
46a7 : 8d d1 52 STA $52d1 ; (current + 0)
46aa : ad f0 51 LDA $51f0 ; (cwd + 24)
46ad : 85 44 __ STA T1 + 1 
46af : 8d d2 52 STA $52d2 ; (current + 1)
46b2 : 05 43 __ ORA T1 + 0 
46b4 : f0 28 __ BEQ $46de ; (freeDir.s7 + 0)
.l6:
46b6 : a5 43 __ LDA T1 + 0 
46b8 : 85 1b __ STA ACCU + 0 
46ba : a5 44 __ LDA T1 + 1 
46bc : 85 1c __ STA ACCU + 1 
46be : a0 15 __ LDY #$15
46c0 : b1 43 __ LDA (T1 + 0),y 
46c2 : 85 02 __ STA $02 
46c4 : c8 __ __ INY
46c5 : b1 43 __ LDA (T1 + 0),y 
46c7 : 85 44 __ STA T1 + 1 
46c9 : 20 14 4f JSR $4f14 ; (free + 0)
46cc : a5 02 __ LDA $02 
46ce : 85 43 __ STA T1 + 0 
46d0 : 05 44 __ ORA T1 + 1 
46d2 : d0 e2 __ BNE $46b6 ; (freeDir.l6 + 0)
.s9:
46d4 : a5 02 __ LDA $02 
46d6 : 8d d1 52 STA $52d1 ; (current + 0)
46d9 : a5 44 __ LDA T1 + 1 
46db : 8d d2 52 STA $52d2 ; (current + 1)
.s7:
46de : a9 00 __ LDA #$00
46e0 : 8d d8 51 STA $51d8 ; (cwd + 0)
.s1001:
46e3 : 60 __ __ RTS
--------------------------------------------------------------------
46e4 : __ __ __ BYT 5b 25 32 55 5d 20 25 53 00                      : [%2U] %S.
--------------------------------------------------------------------
46ed : __ __ __ BYT 66 49 4c 45 20 53 45 4c 45 43 54 45 44 3a 00    : fILE SELECTED:.
--------------------------------------------------------------------
spentry:
46fc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
46fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
mc_default:
46fe : __ __ __ BYT 8d                                              : .
--------------------------------------------------------------------
mc_menupopup:
46ff : __ __ __ BYT cf                                              : .
--------------------------------------------------------------------
4700 : __ __ __ BYT 63 48 4f 4f 53 45 20 46 49 4c 45 4e 41 4d 45 20 : cHOOSE FILENAME 
4710 : __ __ __ BYT 4f 46 20 47 45 4e 45 52 41 54 45 44 20 50 52 4f : OF GENERATED PRO
4720 : __ __ __ BYT 47 52 41 4d 3a 00                               : GRAM:.
--------------------------------------------------------------------
textInput: ; textInput(u8,u8,u8*,u8)->void
.s0:
4726 : 20 2c 33 JSR $332c ; (strlen@proxy + 0)
4729 : a5 1b __ LDA ACCU + 0 
472b : 85 4a __ STA T1 + 0 
472d : f0 13 __ BEQ $4742 ; (textInput.l143 + 0)
.s1:
472f : a5 17 __ LDA P10 ; (str + 0)
4731 : 85 13 __ STA P6 
4733 : a5 18 __ LDA P11 ; (str + 1)
4735 : 85 14 __ STA P7 
4737 : a5 15 __ LDA P8 ; (xpos + 0)
4739 : 85 11 __ STA P4 
473b : a5 16 __ LDA P9 ; (ypos + 0)
473d : 85 12 __ STA P5 
473f : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
.l143:
4742 : 18 __ __ CLC
4743 : a5 4a __ LDA T1 + 0 
4745 : 65 15 __ ADC P8 ; (xpos + 0)
4747 : 8d f0 50 STA $50f0 ; (fullscreen + 4)
474a : a5 16 __ LDA P9 ; (ypos + 0)
474c : 8d f1 50 STA $50f1 ; (fullscreen + 5)
.l142:
474f : 20 eb 48 JSR $48eb ; (vdcwin_cursor_toggle.s0 + 0)
.l6:
4752 : 20 8f 46 JSR $468f ; (vdcwin_getch.s0 + 0)
4755 : a5 1b __ LDA ACCU + 0 
4757 : c9 1b __ CMP #$1b
4759 : d0 03 __ BNE $475e ; (textInput.s70 + 0)
475b : 4c 7a 48 JMP $487a ; (textInput.s1001 + 0)
.s70:
475e : 85 4c __ STA T3 + 0 
4760 : c9 1b __ CMP #$1b
4762 : b0 03 __ BCS $4767 ; (textInput.s71 + 0)
4764 : 4c 61 48 JMP $4861 ; (textInput.s72 + 0)
.s71:
4767 : c9 94 __ CMP #$94
4769 : d0 5e __ BNE $47c9 ; (textInput.s78 + 0)
.s27:
476b : 20 2c 33 JSR $332c ; (strlen@proxy + 0)
476e : a5 1b __ LDA ACCU + 0 
4770 : c9 14 __ CMP #$14
4772 : b0 de __ BCS $4752 ; (textInput.l6 + 0)
.s32:
4774 : 85 4e __ STA T4 + 0 
4776 : 09 00 __ ORA #$00
4778 : f0 d8 __ BEQ $4752 ; (textInput.l6 + 0)
.s31:
477a : a5 4a __ LDA T1 + 0 
477c : c5 1b __ CMP ACCU + 0 
477e : b0 d2 __ BCS $4752 ; (textInput.l6 + 0)
.s28:
4780 : 20 eb 48 JSR $48eb ; (vdcwin_cursor_toggle.s0 + 0)
4783 : a5 17 __ LDA P10 ; (str + 0)
4785 : 85 13 __ STA P6 
4787 : a5 18 __ LDA P11 ; (str + 1)
4789 : 85 14 __ STA P7 
478b : a5 15 __ LDA P8 ; (xpos + 0)
478d : 85 11 __ STA P4 
478f : a5 16 __ LDA P9 ; (ypos + 0)
4791 : 85 12 __ STA P5 
4793 : 18 __ __ CLC
4794 : a5 4e __ LDA T4 + 0 
4796 : 69 01 __ ADC #$01
4798 : c5 4a __ CMP T1 + 0 
479a : 90 14 __ BCC $47b0 ; (textInput.s35 + 0)
.s1038:
479c : 85 4f __ STA T7 + 0 
479e : a8 __ __ TAY
.l34:
479f : b1 17 __ LDA (P10),y ; (str + 0)
47a1 : c8 __ __ INY
47a2 : 91 17 __ STA (P10),y ; (str + 0)
47a4 : a5 4f __ LDA T7 + 0 
47a6 : f0 08 __ BEQ $47b0 ; (textInput.s35 + 0)
.s38:
47a8 : c6 4f __ DEC T7 + 0 
47aa : a4 4f __ LDY T7 + 0 
47ac : c4 4a __ CPY T1 + 0 
47ae : b0 ef __ BCS $479f ; (textInput.l34 + 0)
.s35:
47b0 : a9 20 __ LDA #$20
47b2 : a4 4a __ LDY T1 + 0 
47b4 : 91 17 __ STA (P10),y ; (str + 0)
47b6 : 20 ec 31 JSR $31ec ; (vdc_prints.s0 + 0)
47b9 : a5 16 __ LDA P9 ; (ypos + 0)
47bb : 8d f1 50 STA $50f1 ; (fullscreen + 5)
47be : 18 __ __ CLC
47bf : a5 15 __ LDA P8 ; (xpos + 0)
47c1 : 65 4a __ ADC T1 + 0 
.s144:
47c3 : 8d f0 50 STA $50f0 ; (fullscreen + 4)
47c6 : 4c 4f 47 JMP $474f ; (textInput.l142 + 0)
.s78:
47c9 : 90 6c __ BCC $4837 ; (textInput.s80 + 0)
.s79:
47cb : c9 9d __ CMP #$9d
47cd : d0 0f __ BNE $47de ; (textInput.s53 + 0)
.s41:
47cf : a5 4a __ LDA T1 + 0 
47d1 : d0 03 __ BNE $47d6 ; (textInput.s42 + 0)
47d3 : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s42:
47d6 : c6 4a __ DEC T1 + 0 
.s145:
47d8 : 20 eb 48 JSR $48eb ; (vdcwin_cursor_toggle.s0 + 0)
47db : 4c 42 47 JMP $4742 ; (textInput.l143 + 0)
.s53:
47de : 09 00 __ ORA #$00
47e0 : 10 03 __ BPL $47e5 ; (textInput.s62 + 0)
47e2 : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s62:
47e5 : aa __ __ TAX
47e6 : bd 00 52 LDA $5200,x ; (_cinfo + 0)
47e9 : d0 03 __ BNE $47ee ; (textInput.s59 + 0)
47eb : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s59:
47ee : a4 4a __ LDY T1 + 0 
47f0 : c0 14 __ CPY #$14
47f2 : 90 03 __ BCC $47f7 ; (textInput.s54 + 0)
47f4 : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s54:
47f7 : b1 17 __ LDA (P10),y ; (str + 0)
47f9 : 85 4b __ STA T2 + 0 
47fb : 8a __ __ TXA
47fc : 91 17 __ STA (P10),y ; (str + 0)
47fe : 20 eb 48 JSR $48eb ; (vdcwin_cursor_toggle.s0 + 0)
4801 : a5 4c __ LDA T3 + 0 
4803 : 20 58 33 JSR $3358 ; (pet2screen.s0 + 0)
4806 : 85 0f __ STA P2 
4808 : 18 __ __ CLC
4809 : a5 15 __ LDA P8 ; (xpos + 0)
480b : 65 4a __ ADC T1 + 0 
480d : 85 0d __ STA P0 
480f : a5 16 __ LDA P9 ; (ypos + 0)
4811 : 85 0e __ STA P1 
4813 : 20 2c 50 JSR $502c ; (vdc_printc@proxy + 0)
4816 : a5 16 __ LDA P9 ; (ypos + 0)
4818 : 8d f1 50 STA $50f1 ; (fullscreen + 5)
481b : e6 4a __ INC T1 + 0 
481d : 18 __ __ CLC
481e : a5 4a __ LDA T1 + 0 
4820 : 65 15 __ ADC P8 ; (xpos + 0)
4822 : 8d f0 50 STA $50f0 ; (fullscreen + 4)
4825 : 20 eb 48 JSR $48eb ; (vdcwin_cursor_toggle.s0 + 0)
4828 : a5 4b __ LDA T2 + 0 
482a : f0 03 __ BEQ $482f ; (textInput.s65 + 0)
482c : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s65:
482f : a4 4a __ LDY T1 + 0 
4831 : c8 __ __ INY
4832 : 91 17 __ STA (P10),y ; (str + 0)
4834 : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s80:
4837 : c9 1d __ CMP #$1d
4839 : d0 a3 __ BNE $47de ; (textInput.s53 + 0)
.s46:
483b : 20 2c 33 JSR $332c ; (strlen@proxy + 0)
483e : a5 1c __ LDA ACCU + 1 
4840 : 10 03 __ BPL $4845 ; (textInput.s1012 + 0)
4842 : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s1012:
4845 : d0 15 __ BNE $485c ; (textInput.s1037 + 0)
.s1010:
4847 : a5 4a __ LDA T1 + 0 
4849 : c5 1b __ CMP ACCU + 0 
484b : 90 03 __ BCC $4850 ; (textInput.s50 + 0)
484d : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s50:
4850 : c9 14 __ CMP #$14
4852 : 90 03 __ BCC $4857 ; (textInput.s47 + 0)
4854 : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s47:
4857 : e6 4a __ INC T1 + 0 
4859 : 4c d8 47 JMP $47d8 ; (textInput.s145 + 0)
.s1037:
485c : a5 4a __ LDA T1 + 0 
485e : 4c 50 48 JMP $4850 ; (textInput.s50 + 0)
.s72:
4861 : c9 0d __ CMP #$0d
4863 : d0 0c __ BNE $4871 ; (textInput.s73 + 0)
.s10:
4865 : 20 2c 33 JSR $332c ; (strlen@proxy + 0)
4868 : a9 00 __ LDA #$00
486a : a4 1b __ LDY ACCU + 0 
486c : 91 17 __ STA (P10),y ; (str + 0)
486e : 4c 7a 48 JMP $487a ; (textInput.s1001 + 0)
.s73:
4871 : b0 0a __ BCS $487d ; (textInput.s74 + 0)
.s75:
4873 : c9 03 __ CMP #$03
4875 : f0 03 __ BEQ $487a ; (textInput.s1001 + 0)
4877 : 4c de 47 JMP $47de ; (textInput.s53 + 0)
.s1001:
487a : 4c eb 48 JMP $48eb ; (vdcwin_cursor_toggle.s0 + 0)
.s74:
487d : c9 14 __ CMP #$14
487f : f0 03 __ BEQ $4884 ; (textInput.s11 + 0)
4881 : 4c de 47 JMP $47de ; (textInput.s53 + 0)
.s11:
4884 : a5 4a __ LDA T1 + 0 
4886 : d0 03 __ BNE $488b ; (textInput.s12 + 0)
4888 : 4c 52 47 JMP $4752 ; (textInput.l6 + 0)
.s12:
488b : 20 eb 48 JSR $48eb ; (vdcwin_cursor_toggle.s0 + 0)
488e : a9 20 __ LDA #$20
4890 : 85 0f __ STA P2 
4892 : c6 4a __ DEC T1 + 0 
4894 : 18 __ __ CLC
4895 : a5 4a __ LDA T1 + 0 
4897 : 65 15 __ ADC P8 ; (xpos + 0)
4899 : 85 0d __ STA P0 
489b : a5 16 __ LDA P9 ; (ypos + 0)
489d : 85 4b __ STA T2 + 0 
489f : 85 0e __ STA P1 
48a1 : 20 2c 50 JSR $502c ; (vdc_printc@proxy + 0)
48a4 : a5 4a __ LDA T1 + 0 
48a6 : 85 4f __ STA T7 + 0 
48a8 : a5 17 __ LDA P10 ; (str + 0)
48aa : 85 4c __ STA T3 + 0 
48ac : a5 18 __ LDA P11 ; (str + 1)
48ae : 85 4d __ STA T3 + 1 
.l16:
48b0 : a4 4f __ LDY T7 + 0 
48b2 : c8 __ __ INY
48b3 : b1 4c __ LDA (T3 + 0),y 
48b5 : 85 50 __ STA T8 + 0 
48b7 : 88 __ __ DEY
48b8 : 91 4c __ STA (T3 + 0),y 
48ba : 09 00 __ ORA #$00
48bc : d0 04 __ BNE $48c2 ; (textInput.s19 + 0)
.s20:
48be : a9 20 __ LDA #$20
48c0 : d0 03 __ BNE $48c5 ; (textInput.s21 + 0)
.s19:
48c2 : 20 58 33 JSR $3358 ; (pet2screen.s0 + 0)
.s21:
48c5 : 85 0f __ STA P2 
48c7 : a5 4b __ LDA T2 + 0 
48c9 : 85 0e __ STA P1 
48cb : 18 __ __ CLC
48cc : a5 15 __ LDA P8 ; (xpos + 0)
48ce : 65 4f __ ADC T7 + 0 
48d0 : 85 0d __ STA P0 
48d2 : 20 2c 50 JSR $502c ; (vdc_printc@proxy + 0)
48d5 : a5 50 __ LDA T8 + 0 
48d7 : d0 0d __ BNE $48e6 ; (textInput.s17 + 0)
.s18:
48d9 : a5 0e __ LDA P1 
48db : 8d f1 50 STA $50f1 ; (fullscreen + 5)
48de : 18 __ __ CLC
48df : a5 4a __ LDA T1 + 0 
48e1 : 65 15 __ ADC P8 ; (xpos + 0)
48e3 : 4c c3 47 JMP $47c3 ; (textInput.s144 + 0)
.s17:
48e6 : e6 4f __ INC T7 + 0 
48e8 : 4c b0 48 JMP $48b0 ; (textInput.l16 + 0)
--------------------------------------------------------------------
vdcwin_cursor_toggle: ; vdcwin_cursor_toggle(struct VDCWin*)->void
.s0:
48eb : ad f1 50 LDA $50f1 ; (fullscreen + 5)
48ee : 18 __ __ CLC
48ef : 6d ed 50 ADC $50ed ; (fullscreen + 1)
48f2 : 0a __ __ ASL
48f3 : a8 __ __ TAY
48f4 : a9 12 __ LDA #$12
48f6 : 8d 00 d6 STA $d600 
48f9 : ad f0 50 LDA $50f0 ; (fullscreen + 4)
48fc : 18 __ __ CLC
48fd : 6d ec 50 ADC $50ec ; (fullscreen + 0)
4900 : 18 __ __ CLC
4901 : 79 00 53 ADC $5300,y ; (multab + 0)
4904 : aa __ __ TAX
4905 : a9 00 __ LDA #$00
4907 : 79 01 53 ADC $5301,y ; (multab + 1)
490a : a8 __ __ TAY
490b : 8a __ __ TXA
490c : 18 __ __ CLC
490d : 6d dd 50 ADC $50dd ; (vdc_state + 10)
4910 : aa __ __ TAX
4911 : 98 __ __ TYA
4912 : 6d de 50 ADC $50de ; (vdc_state + 11)
.l169:
4915 : 2c 00 d6 BIT $d600 
4918 : 10 fb __ BPL $4915 ; (vdcwin_cursor_toggle.l169 + 0)
.s9:
491a : 8d 01 d6 STA $d601 
491d : a0 13 __ LDY #$13
491f : 8c 00 d6 STY $d600 
.l171:
4922 : 2c 00 d6 BIT $d600 
4925 : 10 fb __ BPL $4922 ; (vdcwin_cursor_toggle.l171 + 0)
.s14:
4927 : 8e 01 d6 STX $d601 
492a : a0 1f __ LDY #$1f
492c : 8c 00 d6 STY $d600 
.l173:
492f : 2c 00 d6 BIT $d600 
4932 : 10 fb __ BPL $492f ; (vdcwin_cursor_toggle.l173 + 0)
.s18:
4934 : a8 __ __ TAY
4935 : ad 01 d6 LDA $d601 
4938 : 49 50 __ EOR #$50
493a : 85 1b __ STA ACCU + 0 
493c : a9 12 __ LDA #$12
493e : 8d 00 d6 STA $d600 
.l175:
4941 : 2c 00 d6 BIT $d600 
4944 : 10 fb __ BPL $4941 ; (vdcwin_cursor_toggle.l175 + 0)
.s27:
4946 : 8c 01 d6 STY $d601 
4949 : a9 13 __ LDA #$13
494b : 8d 00 d6 STA $d600 
.l177:
494e : 2c 00 d6 BIT $d600 
4951 : 10 fb __ BPL $494e ; (vdcwin_cursor_toggle.l177 + 0)
.s32:
4953 : 8e 01 d6 STX $d601 
4956 : a9 1f __ LDA #$1f
4958 : 8d 00 d6 STA $d600 
.l179:
495b : 2c 00 d6 BIT $d600 
495e : 10 fb __ BPL $495b ; (vdcwin_cursor_toggle.l179 + 0)
.s36:
4960 : a5 1b __ LDA ACCU + 0 
4962 : 8d 01 d6 STA $d601 
.s1001:
4965 : 60 __ __ RTS
--------------------------------------------------------------------
4966 : __ __ __ BYT 52 30 3a 25 53 3d 25 53 00                      : R0:%S=%S.
--------------------------------------------------------------------
cmd@proxy: ; cmd@proxy
496f : ad d2 50 LDA $50d2 ; (targetdevice + 0)
4972 : 85 10 __ STA P3 
4974 : a9 00 __ LDA #$00
4976 : 85 11 __ STA P4 
4978 : a9 54 __ LDA #$54
497a : 85 12 __ STA P5 
--------------------------------------------------------------------
cmd: ; cmd(const u8,const u8*)->u16
.s0:
497c : a9 00 __ LDA #$00
497e : 85 0d __ STA P0 
4980 : 85 0e __ STA P1 
4982 : 20 a3 2a JSR $2aa3 ; (krnio_setbnk.s0 + 0)
4985 : a5 11 __ LDA P4 ; (cmd + 0)
4987 : 85 0d __ STA P0 
4989 : a5 12 __ LDA P5 ; (cmd + 1)
498b : 85 0e __ STA P1 
498d : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
4990 : a9 0f __ LDA #$0f
4992 : 85 0d __ STA P0 
4994 : 85 0f __ STA P2 
4996 : 20 a4 3c JSR $3ca4 ; (krnio_open@proxy + 0)
4999 : 09 00 __ ORA #$00
499b : d0 08 __ BNE $49a5 ; (cmd.s4 + 0)
.s2:
499d : a9 0f __ LDA #$0f
499f : 20 c3 ff JSR $ffc3 
49a2 : 4c c8 49 JMP $49c8 ; (cmd.s1002 + 0)
.s4:
49a5 : a9 00 __ LDA #$00
49a7 : 8d d7 52 STA $52d7 ; (DOSstatus + 0)
49aa : a9 d7 __ LDA #$d7
49ac : 85 0e __ STA P1 
49ae : a9 52 __ LDA #$52
49b0 : 85 0f __ STA P2 
49b2 : 20 e9 49 JSR $49e9 ; (krnio_read.s0 + 0)
49b5 : a5 1b __ LDA ACCU + 0 
49b7 : 85 45 __ STA T0 + 0 
49b9 : a5 1c __ LDA ACCU + 1 
49bb : 85 46 __ STA T0 + 1 
49bd : a9 0f __ LDA #$0f
49bf : 20 c3 ff JSR $ffc3 
49c2 : a5 45 __ LDA T0 + 0 
49c4 : 05 46 __ ORA T0 + 1 
49c6 : d0 06 __ BNE $49ce ; (cmd.s18 + 0)
.s1002:
49c8 : 20 b7 ff JSR $ffb7 
49cb : 4c e2 49 JMP $49e2 ; (cmd.s1001 + 0)
.s18:
49ce : ad d7 52 LDA $52d7 ; (DOSstatus + 0)
49d1 : 0a __ __ ASL
49d2 : 0a __ __ ASL
49d3 : 18 __ __ CLC
49d4 : 6d d7 52 ADC $52d7 ; (DOSstatus + 0)
49d7 : 0a __ __ ASL
49d8 : 38 __ __ SEC
49d9 : e9 e0 __ SBC #$e0
49db : 18 __ __ CLC
49dc : 6d d8 52 ADC $52d8 ; (DOSstatus + 1)
49df : 38 __ __ SEC
49e0 : e9 30 __ SBC #$30
.s1001:
49e2 : 85 1b __ STA ACCU + 0 
49e4 : a9 00 __ LDA #$00
49e6 : 85 1c __ STA ACCU + 1 
49e8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
.s0:
49e9 : ad d1 50 LDA $50d1 ; (krnio_pstatus + 15)
49ec : c9 40 __ CMP #$40
49ee : d0 04 __ BNE $49f4 ; (krnio_read.s3 + 0)
.s1:
49f0 : a9 00 __ LDA #$00
49f2 : f0 0b __ BEQ $49ff ; (krnio_read.s1008 + 0)
.s3:
49f4 : a9 0f __ LDA #$0f
49f6 : 20 db 3c JSR $3cdb ; (krnio_chkin.s1000 + 0)
49f9 : 09 00 __ ORA #$00
49fb : d0 07 __ BNE $4a04 ; (krnio_read.s5 + 0)
.s6:
49fd : a9 ff __ LDA #$ff
.s1008:
49ff : 85 1b __ STA ACCU + 0 
.s1001:
4a01 : 85 1c __ STA ACCU + 1 
4a03 : 60 __ __ RTS
.s5:
4a04 : a9 00 __ LDA #$00
4a06 : 85 43 __ STA T1 + 0 
.l9:
4a08 : 20 ef 3c JSR $3cef ; (krnio_chrin.s0 + 0)
4a0b : a5 1b __ LDA ACCU + 0 
4a0d : 85 44 __ STA T2 + 0 
4a0f : 20 b7 ff JSR $ffb7 
4a12 : 8d d1 50 STA $50d1 ; (krnio_pstatus + 15)
4a15 : aa __ __ TAX
4a16 : f0 04 __ BEQ $4a1c ; (krnio_read.s13 + 0)
.s14:
4a18 : c9 40 __ CMP #$40
4a1a : d0 11 __ BNE $4a2d ; (krnio_read.s10 + 0)
.s13:
4a1c : a5 44 __ LDA T2 + 0 
4a1e : a4 43 __ LDY T1 + 0 
4a20 : 91 0e __ STA (P1),y ; (data + 0)
4a22 : e6 43 __ INC T1 + 0 
4a24 : 8a __ __ TXA
4a25 : d0 06 __ BNE $4a2d ; (krnio_read.s10 + 0)
.s8:
4a27 : a5 43 __ LDA T1 + 0 
4a29 : c9 28 __ CMP #$28
4a2b : 90 db __ BCC $4a08 ; (krnio_read.l9 + 0)
.s10:
4a2d : 20 cc ff JSR $ffcc 
4a30 : a5 43 __ LDA T1 + 0 
4a32 : 85 1b __ STA ACCU + 0 
4a34 : a9 00 __ LDA #$00
4a36 : f0 c9 __ BEQ $4a01 ; (krnio_read.s1001 + 0)
--------------------------------------------------------------------
4a38 : __ __ __ BYT 6f 55 54 50 55 54 20 46 49 4c 45 20 45 58 49 53 : oUTPUT FILE EXIS
4a48 : __ __ __ BYT 54 53 2e 20 61 52 45 20 59 4f 55 20 53 55 52 45 : TS. aRE YOU SURE
4a58 : __ __ __ BYT 3f 20 79 2f 6e 20 00                            : ? y/n .
--------------------------------------------------------------------
4a5f : __ __ __ BYT 53 3a 25 53 00                                  : S:%S.
--------------------------------------------------------------------
error_message: ; error_message()->void
.s1000:
4a64 : 38 __ __ SEC
4a65 : a5 23 __ LDA SP + 0 
4a67 : e9 06 __ SBC #$06
4a69 : 85 23 __ STA SP + 0 
4a6b : b0 02 __ BCS $4a6f ; (error_message.s0 + 0)
4a6d : c6 24 __ DEC SP + 1 
.s0:
4a6f : 20 ad 4a JSR $4aad ; (vdc_exit.s0 + 0)
4a72 : a9 04 __ LDA #$04
4a74 : 8d 06 d5 STA $d506 
4a77 : a9 b8 __ LDA #$b8
4a79 : a0 02 __ LDY #$02
4a7b : 91 23 __ STA (SP + 0),y 
4a7d : a9 4a __ LDA #$4a
4a7f : c8 __ __ INY
4a80 : 91 23 __ STA (SP + 0),y 
4a82 : 20 da 22 JSR $22da ; (printf.s0 + 0)
4a85 : a9 c6 __ LDA #$c6
4a87 : a0 02 __ LDY #$02
4a89 : 91 23 __ STA (SP + 0),y 
4a8b : a9 4a __ LDA #$4a
4a8d : c8 __ __ INY
4a8e : 91 23 __ STA (SP + 0),y 
4a90 : ad c3 50 LDA $50c3 ; (krnio_pstatus + 1)
4a93 : c8 __ __ INY
4a94 : 91 23 __ STA (SP + 0),y 
4a96 : a9 00 __ LDA #$00
4a98 : c8 __ __ INY
4a99 : 91 23 __ STA (SP + 0),y 
4a9b : 20 da 22 JSR $22da ; (printf.s0 + 0)
4a9e : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s1001:
4aa1 : 18 __ __ CLC
4aa2 : a5 23 __ LDA SP + 0 
4aa4 : 69 06 __ ADC #$06
4aa6 : 85 23 __ STA SP + 0 
4aa8 : 90 02 __ BCC $4aac ; (error_message.s1001 + 11)
4aaa : e6 24 __ INC SP + 1 
4aac : 60 __ __ RTS
--------------------------------------------------------------------
vdc_exit: ; vdc_exit()->void
.s0:
4aad : a9 00 __ LDA #$00
4aaf : 20 dd 2d JSR $2ddd ; (fastmode.s0 + 0)
4ab2 : 20 fc 2d JSR $2dfc ; (vdc_set_mode@proxy + 0)
4ab5 : 4c 67 2c JMP $2c67 ; (vdc_cls.s0 + 0)
--------------------------------------------------------------------
4ab8 : __ __ __ BYT 66 49 4c 45 20 45 52 52 4f 52 21 0a 0d 00       : fILE ERROR!...
--------------------------------------------------------------------
4ac6 : __ __ __ BYT 65 52 52 4f 52 20 4e 52 2e 3a 20 25 32 78 0a 0d : eRROR NR.: %2x..
4ad6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4ad7 : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 50 52 4f 4a 45 43 54 20 : lOADING PROJECT 
4ae7 : __ __ __ BYT 4d 45 54 41 20 44 41 54 41 2e 00                : META DATA..
--------------------------------------------------------------------
too_big: ; too_big()->void
.s1000:
4af2 : 38 __ __ SEC
4af3 : a5 23 __ LDA SP + 0 
4af5 : e9 06 __ SBC #$06
4af7 : 85 23 __ STA SP + 0 
4af9 : b0 02 __ BCS $4afd ; (too_big.s0 + 0)
4afb : c6 24 __ DEC SP + 1 
.s0:
4afd : a9 f6 __ LDA #$f6
4aff : a0 02 __ LDY #$02
4b01 : 91 23 __ STA (SP + 0),y 
4b03 : a9 50 __ LDA #$50
4b05 : c8 __ __ INY
4b06 : 91 23 __ STA (SP + 0),y 
4b08 : a9 47 __ LDA #$47
4b0a : c8 __ __ INY
4b0b : 91 23 __ STA (SP + 0),y 
4b0d : a9 4b __ LDA #$4b
4b0f : c8 __ __ INY
4b10 : 91 23 __ STA (SP + 0),y 
4b12 : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
4b15 : a9 f6 __ LDA #$f6
4b17 : a0 02 __ LDY #$02
4b19 : 91 23 __ STA (SP + 0),y 
4b1b : a9 50 __ LDA #$50
4b1d : c8 __ __ INY
4b1e : 91 23 __ STA (SP + 0),y 
4b20 : a9 57 __ LDA #$57
4b22 : c8 __ __ INY
4b23 : 91 23 __ STA (SP + 0),y 
4b25 : a9 4b __ LDA #$4b
4b27 : c8 __ __ INY
4b28 : 91 23 __ STA (SP + 0),y 
4b2a : 20 29 40 JSR $4029 ; (vdcwin_printline.s1000 + 0)
4b2d : 20 8f 46 JSR $468f ; (vdcwin_getch.s0 + 0)
4b30 : 20 ad 4a JSR $4aad ; (vdc_exit.s0 + 0)
4b33 : a9 04 __ LDA #$04
4b35 : 8d 06 d5 STA $d506 
4b38 : 20 0c 2b JSR $2b0c ; (exit@proxy + 0)
.s1001:
4b3b : 18 __ __ CLC
4b3c : a5 23 __ LDA SP + 0 
4b3e : 69 06 __ ADC #$06
4b40 : 85 23 __ STA SP + 0 
4b42 : 90 02 __ BCC $4b46 ; (too_big.s1001 + 11)
4b44 : e6 24 __ INC SP + 1 
4b46 : 60 __ __ RTS
--------------------------------------------------------------------
4b47 : __ __ __ BYT 70 52 4f 4a 45 43 54 20 54 4f 20 42 49 47 2e 00 : pROJECT TO BIG..
--------------------------------------------------------------------
4b57 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
4b67 : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
4b6a : __ __ __ BYT 6c 4f 41 44 49 4e 47 20 56 49 45 57 45 52 20 43 : lOADING VIEWER C
4b7a : __ __ __ BYT 4f 44 45 20 54 4f 20 41 44 44 52 45 53 53 20 25 : ODE TO ADDRESS %
4b8a : __ __ __ BYT 34 58 2e 00                                     : 4X..
--------------------------------------------------------------------
4b8e : __ __ __ BYT 56 44 43 53 45 32 50 52 47 56 57 43 00          : VDCSE2PRGVWC.
--------------------------------------------------------------------
4b9b : __ __ __ BYT 63 4f 50 59 20 56 49 45 57 45 52 20 44 41 54 41 : cOPY VIEWER DATA
4bab : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4bbb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4bbc : __ __ __ BYT 6c 4f 41 44 20 53 43 52 45 45 4e 20 44 41 54 41 : lOAD SCREEN DATA
4bcc : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4bdc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4bdd : __ __ __ BYT 25 53 2e 53 43 52 4e 00                         : %S.SCRN.
--------------------------------------------------------------------
4be5 : __ __ __ BYT 25 53 2e 43 48 52 53 00                         : %S.CHRS.
--------------------------------------------------------------------
4bed : __ __ __ BYT 25 53 2e 43 48 52 41 00                         : %S.CHRA.
--------------------------------------------------------------------
__multab36L:
4bf5 : __ __ __ BYT 00 24 48 6c 90 b4                               : .$Hl..
--------------------------------------------------------------------
progressRev:
4bfb : __ __ __ BYT 00 00 01 01                                     : ....
--------------------------------------------------------------------
mc_pd_normal:
4bff : __ __ __ BYT c6                                              : .
--------------------------------------------------------------------
4c00 : __ __ __ BYT 6c 4f 41 44 20 53 54 44 20 43 48 41 52 53 45 54 : lOAD STD CHARSET
4c10 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c20 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c21 : __ __ __ BYT 6c 4f 41 44 20 41 4c 54 20 43 48 41 52 53 45 54 : lOAD ALT CHARSET
4c31 : __ __ __ BYT 20 54 4f 20 41 44 44 52 45 53 53 20 25 34 58 2e :  TO ADDRESS %4X.
4c41 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
4c42 : __ __ __ BYT 73 41 56 49 4e 47 20 25 55 20 42 59 54 45 53 20 : sAVING %U BYTES 
4c52 : __ __ __ BYT 54 4f 20 25 53 2e 00                            : TO %S..
--------------------------------------------------------------------
krnio_save: ; krnio_save(u8,const u8*,const u8*)->bool
.s0:
4c59 : a9 00 __ LDA #$00
4c5b : a6 0d __ LDX P0 
4c5d : a0 00 __ LDY #$00
4c5f : 20 ba ff JSR $ffba 
4c62 : a9 0e __ LDA #$0e
4c64 : a6 10 __ LDX P3 
4c66 : a4 11 __ LDY P4 
4c68 : 20 d8 ff JSR $ffd8 
4c6b : a9 00 __ LDA #$00
4c6d : b0 02 __ BCS $4c71 ; (krnio_save.s0 + 24)
4c6f : a9 01 __ LDA #$01
4c71 : 85 1b __ STA ACCU + 0 
.s1001:
4c73 : a5 1b __ LDA ACCU + 0 
4c75 : 60 __ __ RTS
--------------------------------------------------------------------
4c76 : __ __ __ BYT 66 49 4e 49 53 48 45 44 21 20 70 52 45 53 53 20 : fINISHED! pRESS 
4c86 : __ __ __ BYT 4b 45 59 20 54 4f 20 45 58 49 54 2e 00          : KEY TO EXIT..
--------------------------------------------------------------------
mul16: ; mul16
4c93 : a0 00 __ LDY #$00
4c95 : 84 06 __ STY WORK + 3 
4c97 : a5 03 __ LDA WORK + 0 
4c99 : a6 04 __ LDX WORK + 1 
4c9b : f0 1c __ BEQ $4cb9 ; (mul16 + 38)
4c9d : 38 __ __ SEC
4c9e : 6a __ __ ROR
4c9f : 90 0d __ BCC $4cae ; (mul16 + 27)
4ca1 : aa __ __ TAX
4ca2 : 18 __ __ CLC
4ca3 : 98 __ __ TYA
4ca4 : 65 1b __ ADC ACCU + 0 
4ca6 : a8 __ __ TAY
4ca7 : a5 06 __ LDA WORK + 3 
4ca9 : 65 1c __ ADC ACCU + 1 
4cab : 85 06 __ STA WORK + 3 
4cad : 8a __ __ TXA
4cae : 06 1b __ ASL ACCU + 0 
4cb0 : 26 1c __ ROL ACCU + 1 
4cb2 : 4a __ __ LSR
4cb3 : 90 f9 __ BCC $4cae ; (mul16 + 27)
4cb5 : d0 ea __ BNE $4ca1 ; (mul16 + 14)
4cb7 : a5 04 __ LDA WORK + 1 
4cb9 : 4a __ __ LSR
4cba : 90 0d __ BCC $4cc9 ; (mul16 + 54)
4cbc : aa __ __ TAX
4cbd : 18 __ __ CLC
4cbe : 98 __ __ TYA
4cbf : 65 1b __ ADC ACCU + 0 
4cc1 : a8 __ __ TAY
4cc2 : a5 06 __ LDA WORK + 3 
4cc4 : 65 1c __ ADC ACCU + 1 
4cc6 : 85 06 __ STA WORK + 3 
4cc8 : 8a __ __ TXA
4cc9 : 06 1b __ ASL ACCU + 0 
4ccb : 26 1c __ ROL ACCU + 1 
4ccd : 4a __ __ LSR
4cce : b0 ec __ BCS $4cbc ; (mul16 + 41)
4cd0 : d0 f7 __ BNE $4cc9 ; (mul16 + 54)
4cd2 : 84 05 __ STY WORK + 2 
4cd4 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4cd5 : a5 1c __ LDA ACCU + 1 
4cd7 : d0 31 __ BNE $4d0a ; (divmod + 53)
4cd9 : a5 04 __ LDA WORK + 1 
4cdb : d0 1e __ BNE $4cfb ; (divmod + 38)
4cdd : 85 06 __ STA WORK + 3 
4cdf : a2 04 __ LDX #$04
4ce1 : 06 1b __ ASL ACCU + 0 
4ce3 : 2a __ __ ROL
4ce4 : c5 03 __ CMP WORK + 0 
4ce6 : 90 02 __ BCC $4cea ; (divmod + 21)
4ce8 : e5 03 __ SBC WORK + 0 
4cea : 26 1b __ ROL ACCU + 0 
4cec : 2a __ __ ROL
4ced : c5 03 __ CMP WORK + 0 
4cef : 90 02 __ BCC $4cf3 ; (divmod + 30)
4cf1 : e5 03 __ SBC WORK + 0 
4cf3 : 26 1b __ ROL ACCU + 0 
4cf5 : ca __ __ DEX
4cf6 : d0 eb __ BNE $4ce3 ; (divmod + 14)
4cf8 : 85 05 __ STA WORK + 2 
4cfa : 60 __ __ RTS
4cfb : a5 1b __ LDA ACCU + 0 
4cfd : 85 05 __ STA WORK + 2 
4cff : a5 1c __ LDA ACCU + 1 
4d01 : 85 06 __ STA WORK + 3 
4d03 : a9 00 __ LDA #$00
4d05 : 85 1b __ STA ACCU + 0 
4d07 : 85 1c __ STA ACCU + 1 
4d09 : 60 __ __ RTS
4d0a : a5 04 __ LDA WORK + 1 
4d0c : d0 1f __ BNE $4d2d ; (divmod + 88)
4d0e : a5 03 __ LDA WORK + 0 
4d10 : 30 1b __ BMI $4d2d ; (divmod + 88)
4d12 : a9 00 __ LDA #$00
4d14 : 85 06 __ STA WORK + 3 
4d16 : a2 10 __ LDX #$10
4d18 : 06 1b __ ASL ACCU + 0 
4d1a : 26 1c __ ROL ACCU + 1 
4d1c : 2a __ __ ROL
4d1d : c5 03 __ CMP WORK + 0 
4d1f : 90 02 __ BCC $4d23 ; (divmod + 78)
4d21 : e5 03 __ SBC WORK + 0 
4d23 : 26 1b __ ROL ACCU + 0 
4d25 : 26 1c __ ROL ACCU + 1 
4d27 : ca __ __ DEX
4d28 : d0 f2 __ BNE $4d1c ; (divmod + 71)
4d2a : 85 05 __ STA WORK + 2 
4d2c : 60 __ __ RTS
4d2d : a9 00 __ LDA #$00
4d2f : 85 05 __ STA WORK + 2 
4d31 : 85 06 __ STA WORK + 3 
4d33 : 84 02 __ STY $02 
4d35 : a0 10 __ LDY #$10
4d37 : 18 __ __ CLC
4d38 : 26 1b __ ROL ACCU + 0 
4d3a : 26 1c __ ROL ACCU + 1 
4d3c : 26 05 __ ROL WORK + 2 
4d3e : 26 06 __ ROL WORK + 3 
4d40 : 38 __ __ SEC
4d41 : a5 05 __ LDA WORK + 2 
4d43 : e5 03 __ SBC WORK + 0 
4d45 : aa __ __ TAX
4d46 : a5 06 __ LDA WORK + 3 
4d48 : e5 04 __ SBC WORK + 1 
4d4a : 90 04 __ BCC $4d50 ; (divmod + 123)
4d4c : 86 05 __ STX WORK + 2 
4d4e : 85 06 __ STA WORK + 3 
4d50 : 88 __ __ DEY
4d51 : d0 e5 __ BNE $4d38 ; (divmod + 99)
4d53 : 26 1b __ ROL ACCU + 0 
4d55 : 26 1c __ ROL ACCU + 1 
4d57 : a4 02 __ LDY $02 
4d59 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
4d5a : 84 02 __ STY $02 
4d5c : a0 20 __ LDY #$20
4d5e : a9 00 __ LDA #$00
4d60 : 85 07 __ STA WORK + 4 
4d62 : 85 08 __ STA WORK + 5 
4d64 : 85 09 __ STA WORK + 6 
4d66 : 85 0a __ STA WORK + 7 
4d68 : a5 05 __ LDA WORK + 2 
4d6a : 05 06 __ ORA WORK + 3 
4d6c : d0 78 __ BNE $4de6 ; (divmod32 + 140)
4d6e : a5 04 __ LDA WORK + 1 
4d70 : d0 27 __ BNE $4d99 ; (divmod32 + 63)
4d72 : 18 __ __ CLC
4d73 : 26 1b __ ROL ACCU + 0 
4d75 : 26 1c __ ROL ACCU + 1 
4d77 : 26 1d __ ROL ACCU + 2 
4d79 : 26 1e __ ROL ACCU + 3 
4d7b : 2a __ __ ROL
4d7c : 90 05 __ BCC $4d83 ; (divmod32 + 41)
4d7e : e5 03 __ SBC WORK + 0 
4d80 : 38 __ __ SEC
4d81 : b0 06 __ BCS $4d89 ; (divmod32 + 47)
4d83 : c5 03 __ CMP WORK + 0 
4d85 : 90 02 __ BCC $4d89 ; (divmod32 + 47)
4d87 : e5 03 __ SBC WORK + 0 
4d89 : 88 __ __ DEY
4d8a : d0 e7 __ BNE $4d73 ; (divmod32 + 25)
4d8c : 85 07 __ STA WORK + 4 
4d8e : 26 1b __ ROL ACCU + 0 
4d90 : 26 1c __ ROL ACCU + 1 
4d92 : 26 1d __ ROL ACCU + 2 
4d94 : 26 1e __ ROL ACCU + 3 
4d96 : a4 02 __ LDY $02 
4d98 : 60 __ __ RTS
4d99 : a5 1e __ LDA ACCU + 3 
4d9b : d0 10 __ BNE $4dad ; (divmod32 + 83)
4d9d : a6 1d __ LDX ACCU + 2 
4d9f : 86 1e __ STX ACCU + 3 
4da1 : a6 1c __ LDX ACCU + 1 
4da3 : 86 1d __ STX ACCU + 2 
4da5 : a6 1b __ LDX ACCU + 0 
4da7 : 86 1c __ STX ACCU + 1 
4da9 : 85 1b __ STA ACCU + 0 
4dab : a0 18 __ LDY #$18
4dad : 18 __ __ CLC
4dae : 26 1b __ ROL ACCU + 0 
4db0 : 26 1c __ ROL ACCU + 1 
4db2 : 26 1d __ ROL ACCU + 2 
4db4 : 26 1e __ ROL ACCU + 3 
4db6 : 26 07 __ ROL WORK + 4 
4db8 : 26 08 __ ROL WORK + 5 
4dba : 90 0c __ BCC $4dc8 ; (divmod32 + 110)
4dbc : a5 07 __ LDA WORK + 4 
4dbe : e5 03 __ SBC WORK + 0 
4dc0 : aa __ __ TAX
4dc1 : a5 08 __ LDA WORK + 5 
4dc3 : e5 04 __ SBC WORK + 1 
4dc5 : 38 __ __ SEC
4dc6 : b0 0c __ BCS $4dd4 ; (divmod32 + 122)
4dc8 : 38 __ __ SEC
4dc9 : a5 07 __ LDA WORK + 4 
4dcb : e5 03 __ SBC WORK + 0 
4dcd : aa __ __ TAX
4dce : a5 08 __ LDA WORK + 5 
4dd0 : e5 04 __ SBC WORK + 1 
4dd2 : 90 04 __ BCC $4dd8 ; (divmod32 + 126)
4dd4 : 86 07 __ STX WORK + 4 
4dd6 : 85 08 __ STA WORK + 5 
4dd8 : 88 __ __ DEY
4dd9 : d0 d3 __ BNE $4dae ; (divmod32 + 84)
4ddb : 26 1b __ ROL ACCU + 0 
4ddd : 26 1c __ ROL ACCU + 1 
4ddf : 26 1d __ ROL ACCU + 2 
4de1 : 26 1e __ ROL ACCU + 3 
4de3 : a4 02 __ LDY $02 
4de5 : 60 __ __ RTS
4de6 : a0 10 __ LDY #$10
4de8 : a5 1e __ LDA ACCU + 3 
4dea : 85 08 __ STA WORK + 5 
4dec : a5 1d __ LDA ACCU + 2 
4dee : 85 07 __ STA WORK + 4 
4df0 : a9 00 __ LDA #$00
4df2 : 85 1d __ STA ACCU + 2 
4df4 : 85 1e __ STA ACCU + 3 
4df6 : 18 __ __ CLC
4df7 : 26 1b __ ROL ACCU + 0 
4df9 : 26 1c __ ROL ACCU + 1 
4dfb : 26 07 __ ROL WORK + 4 
4dfd : 26 08 __ ROL WORK + 5 
4dff : 26 09 __ ROL WORK + 6 
4e01 : 26 0a __ ROL WORK + 7 
4e03 : a5 07 __ LDA WORK + 4 
4e05 : c5 03 __ CMP WORK + 0 
4e07 : a5 08 __ LDA WORK + 5 
4e09 : e5 04 __ SBC WORK + 1 
4e0b : a5 09 __ LDA WORK + 6 
4e0d : e5 05 __ SBC WORK + 2 
4e0f : a5 0a __ LDA WORK + 7 
4e11 : e5 06 __ SBC WORK + 3 
4e13 : 90 18 __ BCC $4e2d ; (divmod32 + 211)
4e15 : a5 07 __ LDA WORK + 4 
4e17 : e5 03 __ SBC WORK + 0 
4e19 : 85 07 __ STA WORK + 4 
4e1b : a5 08 __ LDA WORK + 5 
4e1d : e5 04 __ SBC WORK + 1 
4e1f : 85 08 __ STA WORK + 5 
4e21 : a5 09 __ LDA WORK + 6 
4e23 : e5 05 __ SBC WORK + 2 
4e25 : 85 09 __ STA WORK + 6 
4e27 : a5 0a __ LDA WORK + 7 
4e29 : e5 06 __ SBC WORK + 3 
4e2b : 85 0a __ STA WORK + 7 
4e2d : 88 __ __ DEY
4e2e : d0 c7 __ BNE $4df7 ; (divmod32 + 157)
4e30 : 26 1b __ ROL ACCU + 0 
4e32 : 26 1c __ ROL ACCU + 1 
4e34 : a4 02 __ LDY $02 
4e36 : 60 __ __ RTS
--------------------------------------------------------------------
malloc: ; malloc
4e37 : 18 __ __ CLC
4e38 : a5 1b __ LDA ACCU + 0 
4e3a : 69 06 __ ADC #$06
4e3c : 85 03 __ STA WORK + 0 
4e3e : a5 1c __ LDA ACCU + 1 
4e40 : 69 00 __ ADC #$00
4e42 : 85 04 __ STA WORK + 1 
4e44 : ad e3 53 LDA $53e3 ; (HeapNode + 2)
4e47 : d0 1f __ BNE $4e68 ; (malloc + 49)
4e49 : a9 00 __ LDA #$00
4e4b : 8d 58 54 STA $5458 
4e4e : 8d 59 54 STA $5459 
4e51 : ee e3 53 INC $53e3 ; (HeapNode + 2)
4e54 : a9 58 __ LDA #$58
4e56 : 8d e1 53 STA $53e1 ; (HeapNode + 0)
4e59 : a9 54 __ LDA #$54
4e5b : 8d e2 53 STA $53e2 ; (HeapNode + 1)
4e5e : a9 00 __ LDA #$00
4e60 : 8d 5a 54 STA $545a 
4e63 : a9 b0 __ LDA #$b0
4e65 : 8d 5b 54 STA $545b 
4e68 : a9 e1 __ LDA #$e1
4e6a : a2 53 __ LDX #$53
4e6c : 85 1d __ STA ACCU + 2 
4e6e : 86 1e __ STX ACCU + 3 
4e70 : 18 __ __ CLC
4e71 : a0 00 __ LDY #$00
4e73 : b1 1d __ LDA (ACCU + 2),y 
4e75 : 85 1b __ STA ACCU + 0 
4e77 : 65 03 __ ADC WORK + 0 
4e79 : 85 05 __ STA WORK + 2 
4e7b : c8 __ __ INY
4e7c : b1 1d __ LDA (ACCU + 2),y 
4e7e : 85 1c __ STA ACCU + 1 
4e80 : f0 18 __ BEQ $4e9a ; (malloc + 99)
4e82 : 65 04 __ ADC WORK + 1 
4e84 : 85 06 __ STA WORK + 3 
4e86 : a0 02 __ LDY #$02
4e88 : b1 1b __ LDA (ACCU + 0),y 
4e8a : c5 05 __ CMP WORK + 2 
4e8c : c8 __ __ INY
4e8d : b1 1b __ LDA (ACCU + 0),y 
4e8f : e5 06 __ SBC WORK + 3 
4e91 : b0 09 __ BCS $4e9c ; (malloc + 101)
4e93 : a5 1b __ LDA ACCU + 0 
4e95 : a6 1c __ LDX ACCU + 1 
4e97 : 4c 6c 4e JMP $4e6c ; (malloc + 53)
4e9a : 02 __ __ INV
4e9b : 60 __ __ RTS
4e9c : 18 __ __ CLC
4e9d : a5 05 __ LDA WORK + 2 
4e9f : 69 07 __ ADC #$07
4ea1 : 29 f8 __ AND #$f8
4ea3 : 85 07 __ STA WORK + 4 
4ea5 : a5 06 __ LDA WORK + 3 
4ea7 : 69 00 __ ADC #$00
4ea9 : 85 08 __ STA WORK + 5 
4eab : a0 02 __ LDY #$02
4ead : a5 07 __ LDA WORK + 4 
4eaf : d1 1b __ CMP (ACCU + 0),y 
4eb1 : d0 15 __ BNE $4ec8 ; (malloc + 145)
4eb3 : c8 __ __ INY
4eb4 : a5 08 __ LDA WORK + 5 
4eb6 : d1 1b __ CMP (ACCU + 0),y 
4eb8 : d0 0e __ BNE $4ec8 ; (malloc + 145)
4eba : a0 00 __ LDY #$00
4ebc : b1 1b __ LDA (ACCU + 0),y 
4ebe : 91 1d __ STA (ACCU + 2),y 
4ec0 : c8 __ __ INY
4ec1 : b1 1b __ LDA (ACCU + 0),y 
4ec3 : 91 1d __ STA (ACCU + 2),y 
4ec5 : 4c e5 4e JMP $4ee5 ; (malloc + 174)
4ec8 : a0 00 __ LDY #$00
4eca : b1 1b __ LDA (ACCU + 0),y 
4ecc : 91 07 __ STA (WORK + 4),y 
4ece : a5 07 __ LDA WORK + 4 
4ed0 : 91 1d __ STA (ACCU + 2),y 
4ed2 : c8 __ __ INY
4ed3 : b1 1b __ LDA (ACCU + 0),y 
4ed5 : 91 07 __ STA (WORK + 4),y 
4ed7 : a5 08 __ LDA WORK + 5 
4ed9 : 91 1d __ STA (ACCU + 2),y 
4edb : c8 __ __ INY
4edc : b1 1b __ LDA (ACCU + 0),y 
4ede : 91 07 __ STA (WORK + 4),y 
4ee0 : c8 __ __ INY
4ee1 : b1 1b __ LDA (ACCU + 0),y 
4ee3 : 91 07 __ STA (WORK + 4),y 
4ee5 : a0 00 __ LDY #$00
4ee7 : a5 05 __ LDA WORK + 2 
4ee9 : 91 1b __ STA (ACCU + 0),y 
4eeb : c8 __ __ INY
4eec : a5 06 __ LDA WORK + 3 
4eee : 91 1b __ STA (ACCU + 0),y 
4ef0 : a0 02 __ LDY #$02
4ef2 : a9 bd __ LDA #$bd
4ef4 : 91 1b __ STA (ACCU + 0),y 
4ef6 : c8 __ __ INY
4ef7 : 91 1b __ STA (ACCU + 0),y 
4ef9 : 38 __ __ SEC
4efa : a5 05 __ LDA WORK + 2 
4efc : e9 02 __ SBC #$02
4efe : 85 05 __ STA WORK + 2 
4f00 : b0 02 __ BCS $4f04 ; (malloc + 205)
4f02 : c6 06 __ DEC WORK + 3 
4f04 : a9 be __ LDA #$be
4f06 : a0 00 __ LDY #$00
4f08 : 91 05 __ STA (WORK + 2),y 
4f0a : c8 __ __ INY
4f0b : 91 05 __ STA (WORK + 2),y 
4f0d : a5 1b __ LDA ACCU + 0 
4f0f : 09 04 __ ORA #$04
4f11 : 85 1b __ STA ACCU + 0 
4f13 : 60 __ __ RTS
--------------------------------------------------------------------
free: ; free
4f14 : a5 1b __ LDA ACCU + 0 
4f16 : 05 1c __ ORA ACCU + 1 
4f18 : d0 01 __ BNE $4f1b ; (free + 7)
4f1a : 60 __ __ RTS
4f1b : a5 1b __ LDA ACCU + 0 
4f1d : 29 07 __ AND #$07
4f1f : c9 04 __ CMP #$04
4f21 : d0 49 __ BNE $4f6c ; (free + 88)
4f23 : a5 1b __ LDA ACCU + 0 
4f25 : 29 f8 __ AND #$f8
4f27 : 85 1b __ STA ACCU + 0 
4f29 : a0 02 __ LDY #$02
4f2b : b1 1b __ LDA (ACCU + 0),y 
4f2d : c9 bd __ CMP #$bd
4f2f : d0 3b __ BNE $4f6c ; (free + 88)
4f31 : c8 __ __ INY
4f32 : b1 1b __ LDA (ACCU + 0),y 
4f34 : c9 bd __ CMP #$bd
4f36 : d0 34 __ BNE $4f6c ; (free + 88)
4f38 : a0 00 __ LDY #$00
4f3a : 38 __ __ SEC
4f3b : b1 1b __ LDA (ACCU + 0),y 
4f3d : e9 02 __ SBC #$02
4f3f : 85 03 __ STA WORK + 0 
4f41 : c8 __ __ INY
4f42 : b1 1b __ LDA (ACCU + 0),y 
4f44 : e9 00 __ SBC #$00
4f46 : 85 04 __ STA WORK + 1 
4f48 : a0 00 __ LDY #$00
4f4a : b1 03 __ LDA (WORK + 0),y 
4f4c : c9 be __ CMP #$be
4f4e : d0 1c __ BNE $4f6c ; (free + 88)
4f50 : c8 __ __ INY
4f51 : b1 03 __ LDA (WORK + 0),y 
4f53 : c9 be __ CMP #$be
4f55 : d0 15 __ BNE $4f6c ; (free + 88)
4f57 : a5 1b __ LDA ACCU + 0 
4f59 : 05 1c __ ORA ACCU + 1 
4f5b : d0 01 __ BNE $4f5e ; (free + 74)
4f5d : 60 __ __ RTS
4f5e : a5 1c __ LDA ACCU + 1 
4f60 : a6 1b __ LDX ACCU + 0 
4f62 : c9 54 __ CMP #$54
4f64 : 90 06 __ BCC $4f6c ; (free + 88)
4f66 : d0 05 __ BNE $4f6d ; (free + 89)
4f68 : e0 58 __ CPX #$58
4f6a : b0 01 __ BCS $4f6d ; (free + 89)
4f6c : 02 __ __ INV
4f6d : c9 b0 __ CMP #$b0
4f6f : 90 06 __ BCC $4f77 ; (free + 99)
4f71 : d0 f9 __ BNE $4f6c ; (free + 88)
4f73 : e0 00 __ CPX #$00
4f75 : b0 f5 __ BCS $4f6c ; (free + 88)
4f77 : a0 02 __ LDY #$02
4f79 : a9 bf __ LDA #$bf
4f7b : 91 1b __ STA (ACCU + 0),y 
4f7d : c8 __ __ INY
4f7e : 91 1b __ STA (ACCU + 0),y 
4f80 : 18 __ __ CLC
4f81 : a0 00 __ LDY #$00
4f83 : b1 1b __ LDA (ACCU + 0),y 
4f85 : 69 07 __ ADC #$07
4f87 : 29 f8 __ AND #$f8
4f89 : 85 1d __ STA ACCU + 2 
4f8b : c8 __ __ INY
4f8c : b1 1b __ LDA (ACCU + 0),y 
4f8e : 69 00 __ ADC #$00
4f90 : 85 1e __ STA ACCU + 3 
4f92 : a9 e1 __ LDA #$e1
4f94 : a2 53 __ LDX #$53
4f96 : 85 05 __ STA WORK + 2 
4f98 : 86 06 __ STX WORK + 3 
4f9a : a0 01 __ LDY #$01
4f9c : b1 05 __ LDA (WORK + 2),y 
4f9e : f0 28 __ BEQ $4fc8 ; (free + 180)
4fa0 : aa __ __ TAX
4fa1 : 88 __ __ DEY
4fa2 : b1 05 __ LDA (WORK + 2),y 
4fa4 : e4 1e __ CPX ACCU + 3 
4fa6 : 90 ee __ BCC $4f96 ; (free + 130)
4fa8 : d0 1e __ BNE $4fc8 ; (free + 180)
4faa : c5 1d __ CMP ACCU + 2 
4fac : 90 e8 __ BCC $4f96 ; (free + 130)
4fae : d0 18 __ BNE $4fc8 ; (free + 180)
4fb0 : a0 00 __ LDY #$00
4fb2 : b1 1d __ LDA (ACCU + 2),y 
4fb4 : 91 1b __ STA (ACCU + 0),y 
4fb6 : c8 __ __ INY
4fb7 : b1 1d __ LDA (ACCU + 2),y 
4fb9 : 91 1b __ STA (ACCU + 0),y 
4fbb : c8 __ __ INY
4fbc : b1 1d __ LDA (ACCU + 2),y 
4fbe : 91 1b __ STA (ACCU + 0),y 
4fc0 : c8 __ __ INY
4fc1 : b1 1d __ LDA (ACCU + 2),y 
4fc3 : 91 1b __ STA (ACCU + 0),y 
4fc5 : 4c dd 4f JMP $4fdd ; (free + 201)
4fc8 : a0 00 __ LDY #$00
4fca : b1 05 __ LDA (WORK + 2),y 
4fcc : 91 1b __ STA (ACCU + 0),y 
4fce : c8 __ __ INY
4fcf : b1 05 __ LDA (WORK + 2),y 
4fd1 : 91 1b __ STA (ACCU + 0),y 
4fd3 : c8 __ __ INY
4fd4 : a5 1d __ LDA ACCU + 2 
4fd6 : 91 1b __ STA (ACCU + 0),y 
4fd8 : c8 __ __ INY
4fd9 : a5 1e __ LDA ACCU + 3 
4fdb : 91 1b __ STA (ACCU + 0),y 
4fdd : a0 02 __ LDY #$02
4fdf : b1 05 __ LDA (WORK + 2),y 
4fe1 : c5 1b __ CMP ACCU + 0 
4fe3 : d0 1d __ BNE $5002 ; (free + 238)
4fe5 : c8 __ __ INY
4fe6 : b1 05 __ LDA (WORK + 2),y 
4fe8 : c5 1c __ CMP ACCU + 1 
4fea : d0 16 __ BNE $5002 ; (free + 238)
4fec : a0 00 __ LDY #$00
4fee : b1 1b __ LDA (ACCU + 0),y 
4ff0 : 91 05 __ STA (WORK + 2),y 
4ff2 : c8 __ __ INY
4ff3 : b1 1b __ LDA (ACCU + 0),y 
4ff5 : 91 05 __ STA (WORK + 2),y 
4ff7 : c8 __ __ INY
4ff8 : b1 1b __ LDA (ACCU + 0),y 
4ffa : 91 05 __ STA (WORK + 2),y 
4ffc : c8 __ __ INY
4ffd : b1 1b __ LDA (ACCU + 0),y 
4fff : 91 05 __ STA (WORK + 2),y 
5001 : 60 __ __ RTS
5002 : a0 00 __ LDY #$00
5004 : a5 1b __ LDA ACCU + 0 
5006 : 91 05 __ STA (WORK + 2),y 
5008 : c8 __ __ INY
5009 : a5 1c __ LDA ACCU + 1 
500b : 91 05 __ STA (WORK + 2),y 
500d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
500e : a9 0b __ LDA #$0b
5010 : 85 11 __ STA P4 
5012 : a9 05 __ LDA #$05
5014 : 85 12 __ STA P5 
5016 : a9 80 __ LDA #$80
5018 : 85 13 __ STA P6 
501a : a9 52 __ LDA #$52
501c : 85 14 __ STA P7 
501e : 4c ec 31 JMP $31ec ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
5021 : a9 80 __ LDA #$80
5023 : 85 13 __ STA P6 
5025 : a9 52 __ LDA #$52
5027 : 85 14 __ STA P7 
5029 : 4c ec 31 JMP $31ec ; (vdc_prints.s0 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
502c : ad ff 46 LDA $46ff ; (mc_menupopup + 0)
502f : 85 10 __ STA P3 
5031 : 4c ae 32 JMP $32ae ; (vdc_printc.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
5034 : a9 20 __ LDA #$20
5036 : 85 11 __ STA P4 
5038 : a9 50 __ LDA #$50
503a : 85 12 __ STA P5 
503c : 4c 7b 2c JMP $2c7b ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
vdc_clear@proxy: ; vdc_clear@proxy
503f : a9 0a __ LDA #$0a
5041 : 85 0f __ STA P2 
5043 : a9 20 __ LDA #$20
5045 : 85 11 __ STA P4 
5047 : a9 3c __ LDA #$3c
5049 : 85 12 __ STA P5 
504b : 4c 7b 2c JMP $2c7b ; (vdc_clear.s0 + 0)
--------------------------------------------------------------------
504e : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 85 89 86 8a 87 8b : ................
505e : __ __ __ BYT 88 8c 0a 8c                                     : ....
--------------------------------------------------------------------
p2smap:
5062 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
progressBar:
506a : __ __ __ BYT a5 a1 a7 20                                     : ... 
--------------------------------------------------------------------
mc_pd_select:
506e : __ __ __ BYT cd                                              : .
--------------------------------------------------------------------
reg_types:
506f : __ __ __ BYT d5 45 d9 45 dd 45 e1 45 e5 45                   : .E.E.E.E.E
--------------------------------------------------------------------
oth_types:
5079 : __ __ __ BYT e9 45 ed 45 f1 45 f5 45 f9 45 fd 45             : .E.E.E.E.E.E
--------------------------------------------------------------------
value2hex:
5085 : __ __ __ BYT 01 46                                           : .F
--------------------------------------------------------------------
filedest:
5087 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5097 : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
charsetchanged:
509c : __ __ __ BSS	2
--------------------------------------------------------------------
filename:
509e : __ __ __ BSS	21
--------------------------------------------------------------------
view:
50b3 : __ __ __ BSS	14
--------------------------------------------------------------------
bootdevice:
50c1 : __ __ __ BSS	1
--------------------------------------------------------------------
krnio_pstatus:
50c2 : __ __ __ BSS	16
--------------------------------------------------------------------
targetdevice:
50d2 : __ __ __ BSS	1
--------------------------------------------------------------------
vdc_state:
50d3 : __ __ __ BSS	25
--------------------------------------------------------------------
fullscreen:
50ec : __ __ __ BSS	10
--------------------------------------------------------------------
interface:
50f6 : __ __ __ BSS	10
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
cwd:
51d8 : __ __ __ BSS	33
--------------------------------------------------------------------
disk_id_buf:
51f9 : __ __ __ BSS	5
--------------------------------------------------------------------
previous:
51fe : __ __ __ BSS	2
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
current:
52d1 : __ __ __ BSS	2
--------------------------------------------------------------------
bad_type:
52d3 : __ __ __ BSS	4
--------------------------------------------------------------------
DOSstatus:
52d7 : __ __ __ BSS	40
--------------------------------------------------------------------
multab:
5300 : __ __ __ BSS	144
--------------------------------------------------------------------
linebuffer2:
5390 : __ __ __ BSS	81
--------------------------------------------------------------------
HeapNode:
53e1 : __ __ __ BSS	4
--------------------------------------------------------------------
buffer:
5400 : __ __ __ BSS	81
--------------------------------------------------------------------
bnk_load@proxy: ; bnk_load@proxy
01:0c00 : ad d2 50 LDA $50d2 ; (targetdevice + 0)
01:0c03 : 85 0f __ STA P2 
01:0c05 : a9 01 __ LDA #$01
01:0c07 : 85 10 __ STA P3 
01:0c09 : a9 80 __ LDA #$80
01:0c0b : 85 13 __ STA P6 
01:0c0d : a9 52 __ LDA #$52
01:0c0f : 85 14 __ STA P7 
--------------------------------------------------------------------
bnk_load: ; bnk_load(u8,u8,const u8*,const u8*)->bool
.s0:
01:0c11 : a5 10 __ LDA P3 ; (bank + 0)
01:0c13 : 85 0d __ STA P0 
01:0c15 : 20 9f 2a JSR $2a9f ; (krnio_setbnk@proxy + 0)
01:0c18 : a5 13 __ LDA P6 ; (fname + 0)
01:0c1a : 85 0d __ STA P0 
01:0c1c : a5 14 __ LDA P7 ; (fname + 1)
01:0c1e : 85 0e __ STA P1 
01:0c20 : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
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
01:0c43 : 4c a3 2a JMP $2aa3 ; (krnio_setbnk.s0 + 0)
--------------------------------------------------------------------
bnk_memcpy: ; bnk_memcpy(u8,u8*,u8,u8*,u16)->void
.s0:
01:0c46 : a9 dd __ LDA #$dd
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
01:0c82 : 20 9f 2a JSR $2a9f ; (krnio_setbnk@proxy + 0)
01:0c85 : a5 15 __ LDA P8 ; (fname + 0)
01:0c87 : 85 0d __ STA P0 
01:0c89 : a5 16 __ LDA P9 ; (fname + 1)
01:0c8b : 85 0e __ STA P1 
01:0c8d : 20 aa 2a JSR $2aaa ; (krnio_setnam.s0 + 0)
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
01:0ca4 : 20 59 4c JSR $4c59 ; (krnio_save.s0 + 0)
01:0ca7 : 85 43 __ STA T1 + 0 
01:0ca9 : a9 00 __ LDA #$00
01:0cab : 85 0d __ STA P0 
01:0cad : 85 0e __ STA P1 
01:0caf : 20 a3 2a JSR $2aa3 ; (krnio_setbnk.s0 + 0)
01:0cb2 : a5 43 __ LDA T1 + 0 
01:0cb4 : 85 1b __ STA ACCU + 0 
.s1001:
01:0cb6 : 60 __ __ RTS
