; Compiled with 1.27.242
--------------------------------------------------------------------
startup: ; startup
0b00 : 43 __ __ INV
0b01 : 42 __ __ INV
0b02 : 4d 00 00 EOR $0000 
0b05 : 00 __ __ BRK
0b06 : 00 __ __ BRK
0b07 : 56 44 __ LSR $44,x 
0b09 : 43 __ __ INV
0b0a : 20 53 43 JSR $4353 
0b0d : 52 __ __ INV
0b0e : 45 45 __ EOR $45 
0b10 : 4e 20 45 LSR $4520 
0b13 : 44 __ __ INV
0b14 : 49 54 __ EOR #$54
0b16 : 4f __ __ INV
0b17 : 52 __ __ INV
0b18 : 00 __ __ BRK
0b19 : 00 __ __ BRK
0b1a : a5 ba __ LDA $ba 
0b1c : 29 03 __ AND #$03
0b1e : a8 __ __ TAY
0b1f : b9 64 0b LDA $0b64,y ; (startup + 100)
0b22 : aa __ __ TAX
0b23 : b9 68 0b LDA $0b68,y ; (startup + 104)
0b26 : a8 __ __ TAY
0b27 : 4c a5 af JMP $afa5 
0b2a : 52 __ __ INV
0b2b : 55 4e __ EOR $4e,x 
0b2d : 22 __ __ INV
0b2e : 56 44 __ LSR $44,x 
0b30 : 43 __ __ INV
0b31 : 53 __ __ INV
0b32 : 45 22 __ EOR ADDR + 3 
0b34 : 2c 55 38 BIT $3855 
0b37 : 00 __ __ BRK
0b38 : 52 __ __ INV
0b39 : 55 4e __ EOR $4e,x 
0b3b : 22 __ __ INV
0b3c : 56 44 __ LSR $44,x 
0b3e : 43 __ __ INV
0b3f : 53 __ __ INV
0b40 : 45 22 __ EOR ADDR + 3 
0b42 : 2c 55 39 BIT $3955 
0b45 : 00 __ __ BRK
0b46 : 52 __ __ INV
0b47 : 55 4e __ EOR $4e,x 
0b49 : 22 __ __ INV
0b4a : 56 44 __ LSR $44,x 
0b4c : 43 __ __ INV
0b4d : 53 __ __ INV
0b4e : 45 22 __ EOR ADDR + 3 
0b50 : 2c 55 31 BIT $3155 
0b53 : 30 00 __ BMI $0b55 ; (startup + 85)
0b55 : 52 __ __ INV
0b56 : 55 4e __ EOR $4e,x 
0b58 : 22 __ __ INV
0b59 : 56 44 __ LSR $44,x 
0b5b : 43 __ __ INV
0b5c : 53 __ __ INV
0b5d : 45 22 __ EOR ADDR + 3 
0b5f : 2c 55 31 BIT $3155 
0b62 : 31 00 __ AND ($00),y 
0b64 : 29 37 __ AND #$37
0b66 : 45 54 __ EOR $54 
0b68 : 0b __ __ INV
0b69 : 0b __ __ INV
0b6a : 0b __ __ INV
0b6b : 0b __ __ INV
0b6c : 60 __ __ RTS
--------------------------------------------------------------------
pad:
0bff : __ __ __ BYT 00                                              : .
