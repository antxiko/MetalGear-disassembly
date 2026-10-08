; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 05 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS sonido_38_7F25_cola: canal del sonido 0x38 (palabra 56 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF (sigue del banco 4); lo
;   leen p04:60B1 (179 bytes)
;   0x8000..0x80b3  (179 bytes)
DATA_sonido_38_7F25_cola:
	defb 022h,041h,0fdh,033h,041h,0fah,022h,041h,0fdh,033h,041h,0fah,022h,041h,0fdh,033h	; 8000  "A.3A."A.3A."A.3
	defb 041h,040h,060h,071h,0fah,022h,071h,0fdh,033h,071h,0fah,022h,071h,0fdh,033h,071h	; 8010  A@`q."q.3q."q.3q
	defb 0fah,022h,071h,0fdh,033h,091h,0fah,022h,091h,0feh,002h,0fah,07fh,0efh,0e8h,0fdh	; 8020  ."q.3.."........
	defb 033h,0e4h,001h,0fah,022h,001h,0fdh,033h,001h,0fah,022h,001h,0fdh,033h,001h,0fah	; 8030  3..."..3.."..3..
	defb 022h,001h,0fdh,033h,001h,000h,000h,0e4h,0b1h,0fah,022h,0b1h,0fdh,033h,0b1h,0fah	; 8040  "..3......"..3..
	defb 022h,0b1h,0fdh,033h,0b1h,0fah,022h,0b1h,0fdh,033h,0b1h,0fah,022h,0b1h,0feh,002h	; 8050  "..3.."..3.."...
	defb 02dh,080h,0feh,0feh,0fah,07fh,0d6h,0c2h,0efh,0d6h,0e9h,004h,041h,041h,041h,041h	; 8060  -...........AAAA
	defb 041h,041h,041h,040h,040h,071h,071h,071h,071h,071h,071h,091h,091h,0feh,002h,068h	; 8070  AAA@@qqqqqq....h
	defb 080h,0efh,0e9h,005h,001h,001h,001h,001h,001h,001h,001h,000h,000h,0e9h,004h,0b1h	; 8080  ................
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0feh,002h,081h,080h,0feh,0feh,068h,080h,0e4h	; 8090  .............h..
	defb 0a1h,0a1h,0e3h,053h,033h,051h,0e4h,0a5h,0e3h,053h,033h,053h,0e4h,0a3h,0e3h,053h	; 80a0  ...S3Q...S3S...S
	defb 033h,051h,0ffh	; 80b0

; ----------------------------------------------------------------------
; DATOS sonido_3E_80B3: canal del sonido 0x3E (palabra 62 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (429
;   bytes)
;   0x80b3..0x8260  (429 bytes)
DATA_sonido_3E_80B3:
	defb 0e5h,0a1h,0a1h,0e3h,0a3h,083h,0a1h,0e5h,0a5h,0e3h,0a3h,083h,0a3h,0e5h,0a3h,0e3h	; 80b3  ................
	defb 0a3h,083h,0a1h,0ffh,0efh,0e9h,001h,0b1h,000h,000h,021h,001h,0b1h,001h,021h,0b1h	; 80c3  ..........!...!.
	defb 001h,0b1h,021h,0b1h,001h,0b1h,021h,001h,0b1h,001h,021h,001h,0b1h,001h,021h,0b1h	; 80d3  ..!...!...!...!.
	defb 0ffh,0d3h,0c3h,0efh,0d3h,0fch,034h,0e4h,071h,073h,0ech,054h,0e2h,005h,0efh,0e4h	; 80e3  ......4.qs.T....
	defb 073h,081h,083h,0ech,054h,0e2h,015h,0efh,0e4h,083h,0feh,002h,0e6h,080h,0fch,034h	; 80f3  s...T..........4
	defb 0e4h,071h,071h,0e3h,023h,003h,021h,0e4h,075h,0e3h,023h,003h,023h,0e4h,073h,0e3h	; 8103  .qq.#.!.u.#.#.s.
	defb 023h,003h,021h,055h,023h,003h,023h,0feh,002h,001h,081h,0feh,0ffh,09fh,080h,085h	; 8113  #.!U#.#.........
	defb 053h,033h,053h,0feh,0ffh,09fh,080h,005h,073h,001h,001h,003h,0e4h,011h,011h,0e3h	; 8123  S3S.....s.......
	defb 011h,011h,0e4h,011h,011h,0e3h,011h,0e4h,003h,001h,0e3h,001h,001h,0e4h,001h,001h	; 8133  ................
	defb 0e3h,001h,001h,0fbh,004h,0e3h,031h,031h,001h,001h,0e4h,091h,091h,061h,061h,091h	; 8143  ......11.....aa.
	defb 091h,0e3h,001h,001h,031h,031h,061h,061h,0feh,0feh,001h,081h,0d3h,0c3h,0efh,0d3h	; 8153  ....11aa........
	defb 0fbh,024h,0e5h,071h,073h,0ech,054h,0e2h,055h,0efh,0e3h,003h,0e5h,081h,083h,0ech	; 8163  .$.qs.T.U.......
	defb 054h,0e2h,065h,0efh,0e3h,013h,0feh,002h,061h,081h,0fbh,024h,0e5h,071h,071h,0e3h	; 8173  T.e.....a..$.qq.
	defb 073h,053h,071h,0e5h,075h,0e3h,073h,053h,073h,0e5h,073h,0e3h,073h,053h,071h,0a5h	; 8183  sSq.u.sSs.s.sSq.
	defb 073h,053h,073h,0feh,002h,07dh,081h,0feh,0ffh,0b3h,080h,0e3h,015h,0e4h,0a3h,083h	; 8193  sSs..}..........
	defb 0a3h,0feh,0ffh,0b3h,080h,0e4h,005h,0e2h,003h,0e3h,0a1h,0a1h,003h,0fch,034h,0e3h	; 81a3  ..............4.
	defb 081h,081h,0e4h,081h,081h,0e3h,011h,011h,0e2h,011h,0e3h,073h,071h,0e4h,071h,071h	; 81b3  ...........sq.qq
	defb 0e3h,001h,001h,0e2h,001h,001h,0fbh,004h,001h,001h,0e3h,091h,091h,061h,061h,031h	; 81c3  .............aa1
	defb 031h,061h,061h,091h,091h,0e2h,001h,001h,031h,031h,0feh,0feh,07dh,081h,0d3h,0c3h	; 81d3  1aa.....11..}...
	defb 0efh,0d3h,0e9h,001h,0b1h,0b1h,031h,031h,031h,031h,021h,021h,0b1h,0b1h,021h,021h	; 81e3  ......1111!!..!!
	defb 021h,021h,091h,0a1h,0feh,002h,0e3h,081h,0feh,0ffh,0c7h,080h,0efh,0e9h,001h,001h	; 81f3  !!..............
	defb 0b1h,021h,0b1h,001h,0b1h,021h,011h,0feh,0ffh,0c7h,080h,0efh,0e9h,001h,030h,030h	; 8203  .!...!........00
	defb 031h,031h,031h,081h,091h,0a1h,0a1h,0feh,002h,0fbh,081h,0efh,0e9h,001h,0b1h,000h	; 8213  111.............
	defb 000h,021h,001h,0b1h,0b1h,021h,0b1h,001h,0b1h,021h,001h,0b1h,0b1h,021h,011h,031h	; 8223  .!...!...!...!.1
	defb 031h,031h,031h,021h,021h,021h,021h,030h,030h,071h,071h,071h,081h,091h,0a1h,0b1h	; 8233  111!!!!00qqq....
	defb 0feh,0feh,0fbh,081h,0efh,0d7h,0fbh,023h,0e2h,093h,0f8h,013h,093h,0f6h,003h,091h	; 8243  .......#........
	defb 0fbh,023h,051h,091h,0e1h,045h,041h,023h,0e2h,0b1h,0e1h,001h,0ffh	; 8253  .#Q..EA#.....

; ----------------------------------------------------------------------
; DATOS sonido_41_8260: canal del sonido 0x41 (palabra 65 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (810
;   bytes)
;   0x8260..0x858a  (810 bytes)
DATA_sonido_41_8260:
	defb 0efh,0d7h,0fbh,023h,0e2h,053h,0f8h,013h,053h,0f6h,003h,051h,0f9h,012h,0e8h,051h	; 8260  ...#.S..S..Q...Q
	defb 0e9h,001h,030h,0efh,0e8h,050h,091h,0e1h,043h,0e9h,001h,030h,0efh,0e8h,040h,041h	; 8270  ..0..P..C..0..@A
	defb 023h,0e9h,001h,030h,0efh,0e8h,0e2h,0b0h,0ffh,0d7h,0e8h,0fbh,02dh,0e5h,093h,093h	; 8280  #..0........-...
	defb 093h,091h,0fbh,012h,0e2h,071h,091h,041h,0fbh,06fh,0e4h,091h,0e5h,090h,090h,091h	; 8290  .....q.A.o......
	defb 090h,090h,091h,0fbh,012h,0e2h,071h,091h,0f9h,022h,071h,091h,0f8h,012h,071h,091h	; 82a0  ......q.."q...q.
	defb 0fah,012h,0ech,055h,071h,091h,059h,077h,097h,0b7h,0feh,0ffh,047h,082h,0ech,052h	; 82b0  ...Uq.Yw....G..R
	defb 027h,009h,0e2h,0b5h,0e1h,009h,0feh,0ffh,047h,082h,027h,019h,0e2h,0b5h,0e1h,011h	; 82c0  '.......G.'.....
	defb 0f6h,043h,011h,0f8h,043h,011h,0f9h,043h,011h,0fbh,043h,011h,0fbh,023h,0e1h,021h	; 82d0  .C..C..C..C..#.!
	defb 0fah,023h,021h,0f8h,023h,021h,0fah,013h,0ech,052h,007h,0e2h,0b7h,0e1h,009h,0efh	; 82e0  .#!.#!...R......
	defb 021h,001h,021h,093h,023h,003h,023h,0e2h,093h,0e1h,025h,0fbh,023h,001h,0e2h,0b1h	; 82f0  !.!.#.#...%.#...
	defb 091h,0f9h,023h,091h,0f7h,023h,091h,0fbh,023h,091h,071h,051h,0fah,012h,040h,050h	; 8300  ..#..#..#.qQ..@P
	defb 090h,0e1h,000h,040h,050h,090h,0e0h,000h,0e3h,040h,050h,090h,0e2h,000h,040h,050h	; 8310  ...@P....@P...@P
	defb 090h,0e1h,000h,0fbh,023h,0e2h,0b5h,090h,0b0h,0e1h,005h,0e2h,0b0h,0e1h,000h,0fah	; 8320  ....#...........
	defb 012h,021h,041h,051h,071h,0f8h,012h,071h,0e5h,060h,070h,0d2h,0f6h,000h,0e4h,070h	; 8330  .!AQq..q.`p....p
	defb 090h,0b0h,0f7h,000h,0e3h,000h,020h,040h,050h,0f8h,000h,070h,090h,0b0h,0f9h,000h	; 8340  ...... @P..p....
	defb 0e2h,000h,020h,040h,050h,0feh,0feh,0bah,082h,0d7h,0fch,02dh,0e4h,093h,093h,093h	; 8350  .. @P......-....
	defb 093h,093h,093h,093h,093h,093h,093h,090h,090h,090h,0e3h,000h,0e4h,090h,070h,0fch	; 8360  ..............p.
	defb 021h,050h,050h,050h,050h,0e3h,001h,050h,0e4h,051h,072h,0e3h,071h,0e4h,070h,070h	; 8370  !PPPP..P.Qr.q.pp
	defb 0e3h,071h,0e4h,071h,0feh,006h,083h,083h,070h,0b0h,0e9h,001h,090h,090h,0efh,0d7h	; 8380  .q.q....p.......
	defb 0e4h,051h,050h,050h,0e9h,001h,030h,0efh,071h,070h,091h,091h,051h,073h,071h,0e3h	; 8390  .QPP..0.qp..Qsq.
	defb 021h,0e4h,071h,071h,070h,070h,081h,093h,091h,0e9h,001h,030h,0efh,091h,090h,091h	; 83a0  !.qqpp.....0....
	defb 091h,0e9h,001h,030h,0efh,090h,071h,061h,061h,0e9h,001h,030h,0efh,060h,091h,0e3h	; 83b0  ...0..qaa..0.`..
	defb 021h,021h,020h,000h,0e4h,090h,0e3h,000h,021h,021h,0e9h,001h,030h,0efh,001h,000h	; 83c0  !! .....!!..0...
	defb 0e4h,091h,091h,051h,073h,071h,0e3h,021h,0e4h,071h,071h,070h,070h,081h,093h,091h	; 83d0  ...Qsq.!.qqpp...
	defb 090h,091h,090h,091h,091h,091h,091h,091h,091h,091h,091h,0f9h,023h,091h,0fah,023h	; 83e0  ............#..#
	defb 091h,0fbh,023h,091h,0fch,023h,091h,0e4h,07fh,071h,0b1h,0e3h,021h,0e4h,077h,071h	; 83f0  ..#..#...q..!.wq
	defb 06fh,061h,091h,0e3h,021h,0e4h,067h,061h,057h,053h,053h,050h,050h,090h,090h,0e3h	; 8400  oa..!.gaWSSPP...
	defb 000h,000h,0e4h,057h,051h,071h,071h,071h,071h,071h,071h,071h,071h,070h,070h,0e5h	; 8410  ...WQqqqqqqqqpp.
	defb 070h,0e4h,070h,071h,071h,070h,070h,0e3h,060h,070h,0e5h,070h,0e4h,060h,060h,0e5h	; 8420  p.pqqpp.`p.p.``.
	defb 070h,0feh,0feh,08eh,083h,0d7h,0e9h,001h,0b3h,033h,0a0h,0a0h,0a1h,031h,0efh,0fbh	; 8430  p........3...1..
	defb 012h,0e2h,021h,041h,0e3h,0b1h,0e9h,001h,033h,0a0h,0a0h,081h,031h,0efh,0e2h,021h	; 8440  ..!A....3...1..!
	defb 041h,0f9h,012h,021h,041h,0e9h,001h,030h,030h,0a0h,020h,0efh,0fah,012h,0ech,055h	; 8450  A..!A..00. ....U
	defb 041h,051h,009h,027h,057h,077h,0feh,0ffh,060h,082h,0e1h,001h,0e3h,090h,0e2h,000h	; 8460  AQ.'Ww..`.......
	defb 040h,090h,0e1h,000h,0e2h,090h,040h,000h,0e1h,040h,000h,0e2h,090h,040h,000h,0e3h	; 8470  @.....@..@...@..
	defb 090h,040h,090h,060h,090h,0e2h,000h,020h,060h,090h,0e1h,000h,020h,060h,0e2h,090h	; 8480  .@.`... `... `..
	defb 0e1h,020h,0e2h,060h,0e9h,001h,000h,030h,030h,0a0h,0feh,0ffh,060h,082h,0e2h,097h	; 8490  . .`...00...`...
	defb 099h,095h,091h,0e9h,001h,001h,031h,021h,0a1h,0efh,0fah,023h,0e8h,0e1h,021h,0f9h	; 84a0  ......1!...#..!.
	defb 023h,021h,0f7h,023h,021h,0f7h,013h,0ech,054h,002h,007h,0e2h,0b7h,0e1h,009h,0efh	; 84b0  #!.#!...T.......
	defb 0e8h,0f9h,033h,021h,001h,021h,093h,023h,003h,023h,0e2h,093h,0e1h,022h,0f8h,003h	; 84c0  ..3!.!.#.#..."..
	defb 003h,0e2h,091h,051h,001h,0efh,0fah,023h,051h,041h,001h,0e8h,0f8h,012h,042h,050h	; 84d0  ...Q...#QA....BP
	defb 090h,0e1h,000h,040h,050h,090h,0e0h,000h,0e3h,040h,050h,090h,0e2h,000h,040h,050h	; 84e0  ...@P....@P...@P
	defb 0fah,023h,075h,070h,070h,055h,050h,050h,0f9h,013h,020h,020h,000h,000h,0e3h,090h	; 84f0  .#uppUPP..  ....
	defb 090h,071h,0f7h,013h,071h,0e9h,001h,0b0h,030h,0efh,0d2h,0f6h,000h,0e4h,040h,050h	; 8500  .q..q...0.....@P
	defb 0f7h,000h,070h,090h,0b0h,0f8h,000h,0e3h,000h,020h,040h,050h,070h,0f9h,000h,090h	; 8510  ..p...... @Pp...
	defb 0b0h,0e2h,000h,020h,0feh,0feh,066h,084h,0efh,0d4h,0fbh,000h,0e1h,060h,030h,000h	; 8520  ... ..f......`0.
	defb 0e2h,090h,060h,0e1h,000h,0e2h,090h,060h,030h,090h,060h,030h,000h,060h,030h,000h	; 8530  ..`....`0.`0.`0.
	defb 0e3h,097h,0e2h,007h,033h,023h,0fbh,003h,011h,011h,0fah,003h,011h,011h,0f9h,003h	; 8540  ....3#..........
	defb 011h,011h,0f8h,003h,011h,011h,0c7h,0e8h,0d5h,0fch,021h,0e5h,0b1h,0e3h,0b1h,0e2h	; 8550  ..........!.....
	defb 001h,0e5h,0b0h,0b0h,0e2h,001h,021h,0e5h,0b0h,0b0h,0e3h,0b1h,0e2h,001h,0e5h,090h	; 8560  ......!.........
	defb 090h,0e2h,041h,031h,041h,061h,071h,091h,0b1h,021h,041h,0fbh,021h,041h,0fch,020h	; 8570  ..A1Aaq..!A.!A.
	defb 021h,043h,0f9h,000h,041h,0f8h,000h,041h,0c3h,0ffh	; 8580  !C..A..A..

; ----------------------------------------------------------------------
; DATOS sonido_45_858A: canal del sonido 0x45 (palabra 69 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (102
;   bytes)
;   0x858a..0x85f0  (102 bytes)
DATA_sonido_45_858A:
	defb 0efh,0d4h,0fbh,000h,0e1h,030h,000h,0e2h,090h,060h,030h,090h,060h,030h,000h,060h	; 858a  .....0...`0.`0.`
	defb 030h,000h,0e3h,090h,0e2h,030h,000h,0e3h,090h,037h,097h,0a3h,093h,0fbh,003h,081h	; 859a  0....0...7......
	defb 081h,0fah,003h,081h,081h,0f9h,003h,081h,081h,0f8h,003h,081h,081h,0c7h,0d5h,0e9h	; 85aa  ................
	defb 001h,000h,000h,0efh,0fch,021h,0e3h,091h,071h,0e9h,001h,030h,030h,0efh,0e3h,071h	; 85ba  .....!..q..00..q
	defb 061h,0e9h,001h,030h,030h,0efh,0e3h,061h,0fch,033h,041h,040h,040h,0b1h,091h,0b1h	; 85ca  a..00..a.3A@@...
	defb 0e2h,001h,021h,041h,061h,0e3h,091h,0b1h,0fbh,033h,0b1h,0fch,020h,091h,0b3h,0f9h	; 85da  ..!Aa....3.. ...
	defb 000h,0b1h,0f8h,000h,0b1h,0ffh	; 85ea

; ----------------------------------------------------------------------
; DATOS sonido_46_85F0: canal del sonido 0x46 (palabra 70 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (104
;   bytes)
;   0x85f0..0x8658  (104 bytes)
DATA_sonido_46_85F0:
	defb 0efh,0d4h,0fch,000h,0e1h,000h,0e2h,090h,060h,030h,000h,060h,030h,000h,0e3h,090h	; 85f0  ........`0.`0...
	defb 0e2h,030h,000h,0e3h,090h,060h,0e2h,000h,0e3h,090h,030h,007h,037h,003h,0e4h,0b3h	; 8600  .0...`....0.7...
	defb 0fbh,003h,0a1h,0a1h,0fbh,003h,0a1h,0a1h,0fah,003h,0a1h,0a1h,0f8h,003h,0a1h,0a1h	; 8610  ................
	defb 0c7h,0d5h,0fdh,024h,0e4h,0b1h,0b1h,0b1h,0b0h,0b0h,0b1h,0b1h,0b0h,0b0h,0b1h,0e5h	; 8620  ...$............
	defb 091h,0fch,022h,0e4h,090h,090h,0fdh,022h,091h,091h,0fch,022h,090h,090h,091h,091h	; 8630  .."...."..."....
	defb 0fdh,022h,0e4h,0b0h,0b0h,0e5h,0b1h,0e4h,021h,041h,0fch,022h,041h,0fdh,020h,021h	; 8640  ."......!A."A. !
	defb 043h,0fah,000h,041h,0f9h,000h,041h,0ffh	; 8650  C..A..A.

; ----------------------------------------------------------------------
; DATOS sonido_4D_8658: canal del sonido 0x4D (palabra 77 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (14
;   bytes)
;   0x8658..0x8666  (14 bytes)
DATA_sonido_4D_8658:
	defb 0efh,0d1h,0fdh,038h,0e1h,0c0h,004h,074h,044h,074h,0e0h,009h,0c0h,0ffh	; 8658  ...8...tDt....

; ----------------------------------------------------------------------
; DATOS sonido_4E_8666: canal del sonido 0x4E (palabra 78 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (15
;   bytes)
;   0x8666..0x8675  (15 bytes)
DATA_sonido_4E_8666:
	defb 0efh,0e8h,0d1h,0fah,033h,0e1h,0c0h,004h,074h,044h,074h,0e0h,009h,0c0h,0ffh	; 8666  ....3...tDt....

; ----------------------------------------------------------------------
; DATOS sonido_53_8675: canal del sonido 0x53 (palabra 83 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (63
;   bytes)
;   0x8675..0x86b4  (63 bytes)
DATA_sonido_53_8675:
	defb 0feh,000h,022h,002h,0e1h,000h,0e1h,040h,0e1h,080h,0e1h,0c0h,0e2h,060h,0e2h,0b0h	; 8675  .."....@.....`..
	defb 0e3h,040h,0e4h,000h,0e4h,080h,0e2h,000h,0e2h,0b0h,0e4h,000h,0e4h,080h,0c1h,040h	; 8685  .@.............@
	defb 0c1h,0c0h,0c2h,060h,0c3h,000h,0c4h,000h,0a1h,040h,0a1h,0c0h,0a2h,060h,0a3h,000h	; 8695  ...`.....@...`..
	defb 0a4h,000h,0a4h,080h,081h,040h,081h,0c0h,082h,060h,083h,000h,084h,000h,0ffh	; 86a5  .....@...`.....

; ----------------------------------------------------------------------
; DATOS sonido_54_86B4: canal del sonido 0x54 (palabra 84 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (63
;   bytes)
;   0x86b4..0x86f3  (63 bytes)
DATA_sonido_54_86B4:
	defb 0feh,000h,022h,002h,0e2h,000h,0e1h,070h,0e2h,040h,0e3h,050h,0e4h,000h,0d1h,000h	; 86b4  .."....p.@.P....
	defb 0d1h,070h,0d2h,040h,0d3h,040h,0d4h,000h,0d5h,000h,0c1h,000h,0c1h,070h,0c2h,040h	; 86c4  .p.@.@.......p.@
	defb 0c3h,050h,0c4h,000h,0c5h,000h,0b1h,000h,0b1h,070h,0b2h,040h,0b3h,050h,0b4h,000h	; 86d4  .P.......p.@.P..
	defb 0a1h,000h,0a1h,070h,0a2h,040h,0a3h,050h,0a4h,000h,0a5h,000h,081h,000h,0ffh	; 86e4  ...p.@.P.......

; ----------------------------------------------------------------------
; DATOS sonido_57_86F3: canal del sonido 0x57 (palabra 87 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (159
;   bytes)
;   0x86f3..0x8792  (159 bytes)
DATA_sonido_57_86F3:
	defb 0feh,000h,022h,003h,0f1h,0c0h,0f2h,040h,0f2h,0c0h,0f3h,040h,0f3h,0c0h,0f4h,040h	; 86f3  .."....@...@...@
	defb 0f4h,0c0h,0f5h,040h,0f5h,0c0h,0f6h,040h,0f6h,0c0h,0e1h,0c0h,0e2h,040h,0e2h,0c0h	; 8703  ...@...@.....@..
	defb 0e3h,040h,0e3h,0c0h,0e4h,040h,0e4h,0c0h,0e5h,040h,0e5h,0c0h,0e6h,040h,0e6h,0c0h	; 8713  .@...@...@...@..
	defb 0e1h,0c0h,0d2h,040h,0d2h,0c0h,0d3h,040h,0d3h,0c0h,0d4h,040h,0d4h,0c0h,0d5h,040h	; 8723  ...@...@...@...@
	defb 0d5h,0c0h,0d6h,040h,0d6h,0c0h,0c1h,0c0h,0c2h,040h,0c2h,0c0h,0c3h,040h,0c3h,0c0h	; 8733  ...@.....@...@..
	defb 0c4h,040h,0c4h,0c0h,0c5h,040h,0c5h,0c0h,0c6h,040h,0c6h,0c0h,0b1h,0c0h,0b2h,040h	; 8743  .@...@...@.....@
	defb 0b2h,0c0h,0b3h,040h,0b3h,0c0h,0b4h,040h,0b4h,0c0h,0b5h,040h,0b5h,0c0h,0b6h,040h	; 8753  ...@...@...@...@
	defb 0b6h,0c0h,0a1h,0c0h,0a2h,040h,0a2h,0c0h,0a3h,040h,0a3h,0c0h,0a4h,040h,0a4h,0c0h	; 8763  .....@...@...@..
	defb 0a5h,040h,0a5h,0c0h,0a6h,040h,0a6h,0c0h,091h,0c0h,092h,040h,092h,0c0h,093h,040h	; 8773  .@...@.....@...@
	defb 093h,0c0h,094h,040h,094h,0c0h,095h,040h,095h,0c0h,096h,040h,096h,0c0h,0ffh	; 8783  ...@...@...@...

; ----------------------------------------------------------------------
; DATOS sonido_58_8792: canal del sonido 0x58 (palabra 88 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (37
;   bytes)
;   0x8792..0x87b7  (37 bytes)
DATA_sonido_58_8792:
	defb 0feh,000h,021h,00ah,018h,0e0h,019h,0d0h,01ah,0c0h,018h,0e0h,019h,0e0h,01ah,0e0h	; 8792  ..!.............
	defb 01bh,0e0h,0d0h,01dh,0d0h,01eh,0c0h,0b0h,0b0h,0a0h,0a0h,01fh,090h,090h,080h,080h	; 87a2  ................
	defb 070h,070h,060h,060h,0ffh	; 87b2

; ----------------------------------------------------------------------
; DATOS indice_de_danos_por_arma: 7 punteros, armas 1-7, a la tabla de dano de
;   esa arma por tipo de actor (p00:4388 lee 0x87B7 + 2 x (arma - 1) y guarda
;   el puntero en 0xEC00; p00:4393 lee el byte de delante, p00:4396 el del
;   tipo); lo leen p00:4388 (14 bytes)
;   0x87b7..0x87c5  (14 bytes)
DATA_indice_de_danos_por_arma:
	defw 087c6h,087c6h,08808h,0884ah,0888ch,088ceh,08910h	; 87b7

; ----------------------------------------------------------------------
; DATOS byte_de_delante_de_los_danos: el byte que p00:4393 lee justo delante
;   de la primera tabla de dano (DE - 1); lo leen p00:4393 (1 bytes)
;   0x87c5..0x87c6  (1 bytes)
DATA_byte_de_delante_de_los_danos:
	defb 006h	; 87c5

; ----------------------------------------------------------------------
; DATOS dano_87C6: el dano de un arma a cada tipo de actor, un byte por tipo
;   (0xFF = no le afecta): p00:4396 lee (0xEC00) + tipo; lo leen p00:4396 (66
;   bytes)
;   0x87c6..0x8808  (66 bytes)
DATA_dano_87C6:
	defb 0ffh,0ffh,0ffh,002h,002h,000h,0ffh,0ffh,000h,002h,002h,000h,002h,002h,000h,0ffh	; 87c6  ................
	defb 000h,000h,002h,002h,002h,002h,000h,002h,002h,000h,002h,002h,0ffh,002h,002h,000h	; 87d6  ................
	defb 002h,002h,0ffh,002h,000h,000h,0ffh,0ffh,002h,002h,0ffh,0ffh,0ffh,0ffh,0ffh,002h	; 87e6  ................
	defb 002h,002h,002h,002h,000h,0ffh,002h,002h,002h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 87f6  ................
	defb 0ffh,002h	; 8806

; ----------------------------------------------------------------------
; DATOS dano_8808: el dano de un arma a cada tipo de actor, un byte por tipo
;   (0xFF = no le afecta): p00:4396 lee (0xEC00) + tipo; lo leen p00:4396 (66
;   bytes)
;   0x8808..0x884a  (66 bytes)
DATA_dano_8808:
	defb 0ffh,0ffh,0ffh,005h,005h,005h,0ffh,0ffh,0ffh,005h,005h,0ffh,005h,005h,0ffh,0ffh	; 8808  ................
	defb 0ffh,005h,005h,005h,005h,005h,0ffh,005h,005h,0ffh,005h,005h,0ffh,005h,005h,000h	; 8818  ................
	defb 005h,005h,0ffh,005h,0ffh,005h,0ffh,0ffh,005h,005h,0ffh,0ffh,0ffh,0ffh,0ffh,005h	; 8828  ................
	defb 005h,005h,005h,005h,000h,0ffh,005h,005h,005h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8838  ................
	defb 0ffh,001h	; 8848

; ----------------------------------------------------------------------
; DATOS dano_884A: el dano de un arma a cada tipo de actor, un byte por tipo
;   (0xFF = no le afecta): p00:4396 lee (0xEC00) + tipo; lo leen p00:4396 (66
;   bytes)
;   0x884a..0x888c  (66 bytes)
DATA_dano_884A:
	defb 0ffh,0ffh,0ffh,00ah,00ah,00ah,0ffh,0ffh,000h,00ah,00ah,000h,00ah,00ah,000h,0ffh	; 884a  ................
	defb 000h,000h,00ah,00ah,00ah,00ah,000h,00ah,00ah,00ah,00ah,00ah,0ffh,00ah,00ah,00ah	; 885a  ................
	defb 00ah,00ah,0ffh,00ah,000h,000h,0ffh,0ffh,00ah,00ah,0ffh,0ffh,0ffh,0ffh,0ffh,00ah	; 886a  ................
	defb 00ah,00ah,00ah,00ah,000h,0ffh,00ah,00ah,00ah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 887a  ................
	defb 0ffh,001h	; 888a

; ----------------------------------------------------------------------
; DATOS dano_888C: el dano de un arma a cada tipo de actor, un byte por tipo
;   (0xFF = no le afecta): p00:4396 lee (0xEC00) + tipo; lo leen p00:4396 (66
;   bytes)
;   0x888c..0x88ce  (66 bytes)
DATA_dano_888C:
	defb 0ffh,0ffh,0ffh,005h,005h,005h,0ffh,0ffh,000h,005h,005h,000h,005h,005h,000h,0ffh	; 888c  ................
	defb 005h,000h,005h,005h,005h,005h,000h,005h,005h,000h,005h,005h,0ffh,005h,005h,000h	; 889c  ................
	defb 005h,005h,0ffh,005h,0ffh,000h,0ffh,0ffh,005h,005h,0ffh,0ffh,0ffh,0ffh,0ffh,005h	; 88ac  ................
	defb 005h,005h,005h,005h,000h,0ffh,005h,005h,005h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 88bc  ................
	defb 0ffh,003h	; 88cc

; ----------------------------------------------------------------------
; DATOS dano_88CE: el dano de un arma a cada tipo de actor, un byte por tipo
;   (0xFF = no le afecta): p00:4396 lee (0xEC00) + tipo; lo leen p00:4396 (66
;   bytes)
;   0x88ce..0x8910  (66 bytes)
DATA_dano_88CE:
	defb 0ffh,0ffh,0ffh,005h,005h,0ffh,0ffh,0ffh,005h,005h,005h,000h,005h,005h,000h,0ffh	; 88ce  ................
	defb 000h,000h,005h,005h,005h,005h,000h,005h,005h,000h,005h,005h,0ffh,005h,005h,000h	; 88de  ................
	defb 005h,005h,0ffh,005h,0ffh,000h,0ffh,0ffh,005h,000h,0ffh,000h,0ffh,0ffh,0ffh,005h	; 88ee  ................
	defb 005h,005h,005h,005h,0ffh,0ffh,005h,005h,005h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 88fe  ................
	defb 0ffh,001h	; 890e

; ----------------------------------------------------------------------
; DATOS dano_8910: el dano de un arma a cada tipo de actor, un byte por tipo
;   (0xFF = no le afecta): p00:4396 lee (0xEC00) + tipo; lo leen p00:4396 (65
;   bytes)
;   0x8910..0x8951  (65 bytes)
DATA_dano_8910:
	defb 0ffh,0ffh,0ffh,005h,005h,005h,0ffh,0ffh,000h,005h,005h,000h,005h,005h,000h,0ffh	; 8910  ................
	defb 000h,000h,005h,005h,005h,005h,000h,005h,005h,000h,005h,005h,0ffh,005h,005h,000h	; 8920  ................
	defb 005h,005h,0ffh,005h,000h,000h,0ffh,0ffh,005h,005h,0ffh,005h,0ffh,0ffh,0ffh,005h	; 8930  ................
	defb 005h,005h,005h,005h,000h,0ffh,005h,005h,005h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8940  ................
	defb 0ffh	; 8950

; ----------------------------------------------------------------------
; DATOS forma_8951: 65 bytes, uno por tipo de actor, que p02:8C38 carga en HL
;   y lee por p00:439C/p00:43A3 (HL + tipo, con 4-5-6 puesto); lo leen
;   p02:8C38 (65 bytes)
;   0x8951..0x8992  (65 bytes)
DATA_forma_8951:
	defb 0ffh,0ffh,0ffh,000h,000h,002h,0ffh,0ffh,003h,000h,000h,002h,000h,000h,011h,0ffh	; 8951  ................
	defb 00ah,00eh,000h,000h,000h,000h,002h,000h,014h,000h,014h,000h,0ffh,000h,002h,000h	; 8961  ................
	defb 000h,000h,0ffh,012h,002h,004h,0ffh,0ffh,000h,006h,0ffh,002h,0ffh,0ffh,0ffh,000h	; 8971  ................
	defb 000h,000h,000h,000h,000h,0ffh,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8981  ................
	defb 0ffh	; 8991

; ----------------------------------------------------------------------
; DATOS forma_8992: 65 bytes, uno por tipo de actor, que p02:8C47 carga en HL
;   y lee por p00:439C/p00:43A3 (HL + tipo, con 4-5-6 puesto); lo leen
;   p02:8C47 (65 bytes)
;   0x8992..0x89d3  (65 bytes)
DATA_forma_8992:
	defb 0ffh,0ffh,0ffh,001h,001h,001h,0ffh,0ffh,003h,001h,001h,002h,001h,001h,011h,0ffh	; 8992  ................
	defb 00bh,00eh,001h,001h,001h,001h,002h,001h,015h,001h,015h,001h,0ffh,001h,001h,001h	; 89a2  ................
	defb 001h,01bh,0ffh,00fh,0ffh,005h,0ffh,0ffh,001h,006h,0ffh,0ffh,0ffh,0ffh,0ffh,001h	; 89b2  ................
	defb 001h,001h,001h,001h,001h,0ffh,001h,001h,001h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 89c2  ................
	defb 0ffh	; 89d2

; ----------------------------------------------------------------------
; DATOS forma_89D3: 65 bytes, uno por tipo de actor, que p02:898C carga en HL
;   y lee por p00:439C/p00:43A3 (HL + tipo, con 4-5-6 puesto); lo leen
;   p02:898C (65 bytes)
;   0x89d3..0x8a14  (65 bytes)
DATA_forma_89D3:
	defb 0ffh,007h,0ffh,008h,008h,008h,008h,008h,00dh,008h,008h,00fh,008h,008h,010h,0ffh	; 89d3  ................
	defb 0ffh,00ch,008h,008h,008h,008h,00fh,008h,019h,008h,019h,008h,008h,008h,008h,008h	; 89e3  ................
	defb 008h,01ah,008h,013h,009h,0ffh,00fh,008h,008h,0ffh,00fh,008h,008h,00fh,009h,008h	; 89f3  ................
	defb 017h,017h,017h,017h,008h,009h,018h,017h,008h,009h,009h,009h,009h,009h,00fh,0ffh	; 8a03  ................
	defb 016h	; 8a13

; ----------------------------------------------------------------------
; DATOS forma_8A14: 65 bytes, uno por tipo de actor, que p02:89E5 carga en HL
;   y lee por p00:439C/p00:43A3 (HL + tipo, con 4-5-6 puesto); lo leen
;   p02:89E5 (65 bytes)
;   0x8a14..0x8a55  (65 bytes)
DATA_forma_8A14:
	defb 000h,000h,000h,002h,002h,000h,010h,000h,0ffh,002h,002h,020h,002h,002h,0ffh,0ffh	; 8a14  ........... ....
	defb 000h,0ffh,002h,002h,002h,002h,020h,002h,002h,008h,002h,002h,000h,002h,002h,008h	; 8a24  ...... .........
	defb 004h,004h,000h,004h,008h,000h,000h,000h,004h,000h,008h,000h,000h,000h,008h,002h	; 8a34  ................
	defb 000h,000h,000h,000h,000h,010h,000h,000h,004h,008h,008h,008h,008h,008h,010h,000h	; 8a44  ................
	defb 010h	; 8a54

; ----------------------------------------------------------------------
; DATOS formas_de_los_proyectiles: 28 fichas de 4 bytes, tipos 1-28, que
;   p00:43B4 copia a 0xC928 (0x8A55 + 4 x (tipo - 1)); lo leen p00:43B4 (112
;   bytes)
;   0x8a55..0x8ac5  (112 bytes)
DATA_formas_de_los_proyectiles:
	defb 0f0h,010h,000h,008h	; 8a55
	defb 000h,014h,000h,014h	; 8a59
	defb 000h,008h,000h,008h	; 8a5d
	defb 0e8h,018h,000h,018h	; 8a61
	defb 0e0h,020h,000h,010h	; 8a65
	defb 0e0h,010h,000h,010h	; 8a69
	defb 0dch,020h,000h,010h	; 8a6d
	defb 000h,008h,000h,010h	; 8a71
	defb 000h,008h,000h,00ch	; 8a75
	defb 010h,00ch,000h,008h	; 8a79
	defb 0d0h,030h,000h,020h	; 8a7d
	defb 0f0h,010h,000h,020h	; 8a81
	defb 008h,018h,000h,020h	; 8a85
	defb 0e8h,018h,000h,020h	; 8a89
	defb 000h,018h,000h,018h	; 8a8d
	defb 014h,010h,000h,010h	; 8a91
	defb 048h,048h,000h,00ch	; 8a95
	defb 048h,048h,000h,010h	; 8a99
	defb 004h,010h,000h,008h	; 8a9d
	defb 014h,008h,000h,00ch	; 8aa1
	defb 000h,010h,000h,010h	; 8aa5
	defb 0f8h,014h,000h,014h	; 8aa9
	defb 010h,018h,000h,018h	; 8aad
	defb 0f8h,010h,000h,010h	; 8ab1
	defb 0f8h,020h,000h,020h	; 8ab5
	defb 000h,00ch,000h,00ch	; 8ab9
	defb 0fch,008h,000h,00ch	; 8abd
	defb 000h,014h,000h,010h	; 8ac1

; ----------------------------------------------------------------------
; DATOS texto_al_coger_cada_objeto: 35 bytes, uno por objeto: el numero de
;   texto que sale al cogerlo (p00:43A3 lo lee en 0x8AC5 + objeto - 1 desde
;   p02); lo leen p00:43A3 (35 bytes)
;   0x8ac5..0x8ae8  (35 bytes)
DATA_texto_al_coger_cada_objeto:
	defb 010h,038h,02eh,077h,045h,012h,01dh,02bh,041h,043h,060h,04bh,097h,000h,055h,062h	; 8ac5  .8.wE..+AC`K..Ub
	defb 00dh,098h,078h,051h,079h,00bh,025h,03fh,037h,067h,06eh,099h,08fh,008h,0ffh,047h	; 8ad5  ..xQy.%?7gn....G
	defb 028h,03eh,015h	; 8ae5

; ----------------------------------------------------------------------
; DATOS unidades_de_cada_objeto: 35 bytes, uno por objeto: cuantas unidades da
;   (p00:43AC lee 0x8AE8 + objeto); lo leen p00:43AC (35 bytes)
;   0x8ae8..0x8b0b  (35 bytes)
DATA_unidades_de_cada_objeto:
	defb 000h,000h,000h,000h,005h,005h,005h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8ae8  ................
	defb 000h,000h,000h,000h,000h,031h,032h,033h,034h,035h,036h,037h,038h,001h,000h,000h	; 8af8  .....12345678...
	defb 000h,000h,000h	; 8b08

; ----------------------------------------------------------------------
; DATOS paleta_del_menu_de_armas: ternas [registro][RB][G] hasta 0xFF
;   (p00:4A95 -> L_4EC4); lo leen p00:4A95 (19 bytes)
;   0x8b0b..0x8b1e  (19 bytes)
DATA_paleta_del_menu_de_armas:
	defb 000h,000h,000h	; 8b0b
	defb 006h,070h,007h	; 8b0e
	defb 008h,070h,000h	; 8b11
	defb 00ch,033h,003h	; 8b14
	defb 00eh,077h,007h	; 8b17
	defb 00fh,000h,000h	; 8b1a
	defb 0ffh	; 8b1d

; ----------------------------------------------------------------------
; DATOS paleta_del_transceptor: ternas de paleta hasta 0xFF (p00:4AAD ->
;   L_4EC4); lo leen p00:4AAD (34 bytes)
;   0x8b1e..0x8b40  (34 bytes)
DATA_paleta_del_transceptor:
	defb 001h,010h,002h	; 8b1e
	defb 002h,042h,003h	; 8b21
	defb 003h,055h,007h	; 8b24
	defb 004h,031h,002h	; 8b27
	defb 005h,040h,000h	; 8b2a
	defb 009h,023h,002h	; 8b2d
	defb 00bh,020h,001h	; 8b30
	defb 00ch,033h,003h	; 8b33
	defb 00dh,005h,002h	; 8b36
	defb 00eh,077h,007h	; 8b39
	defb 00fh,000h,000h	; 8b3c
	defb 0ffh	; 8b3f

; ----------------------------------------------------------------------
; DATOS paleta_por_sala: un nibble por sala (p00:4B00 con L_42D4): que paleta
;   de 0x8BBE usa; las salas 0x7B-0x7D y 0xDC/0xDD con gafas (0xC135 = 3) usan
;   la 0xB y con el foco (0xC135 = 4) la 0xA; lo leen p00:4ACB (126 bytes)
;   0x8b40..0x8bbe  (126 bytes)
DATA_paleta_por_sala:
	defb 000h,000h,002h,020h,002h,020h,000h,000h,011h,011h,011h,011h,011h,011h,033h,033h	; 8b40  ... . ........33
	defb 033h,033h,033h,033h,088h,088h,088h,088h,088h,0c8h,088h,0eeh,0eeh,0eeh,0eeh,0eeh	; 8b50  3333............
	defb 055h,055h,055h,000h,000h,000h,000h,001h,011h,011h,011h,011h,088h,088h,08eh,0eeh	; 8b60  UUU.............
	defb 0eeh,0eeh,0eeh,055h,050h,000h,000h,00eh,0eeh,0eeh,0e8h,099h,050h,0eeh,0eeh,077h	; 8b70  ...UP.......P..w
	defb 074h,077h,074h,047h,046h,066h,066h,066h,044h,046h,046h,066h,046h,066h,066h,066h	; 8b80  twtGFfffDFFfFfff
	defb 064h,066h,044h,044h,066h,066h,067h,077h,066h,066h,046h,046h,066h,046h,064h,044h	; 8b90  dfDDffgwffFFfFdD
	defb 066h,044h,066h,047h,066h,044h,087h,077h,055h,050h,007h,077h,077h,077h,0eeh,000h	; 8ba0  fDfGfD.wUP.www..
	defb 011h,010h,000h,000h,000h,000h,000h,000h,019h,098h,081h,011h,011h,01dh	; 8bb0  ..............

; ----------------------------------------------------------------------
; DATOS indice_de_paletas_de_sala: 16 punteros a las paletas de sala (p00:4B06
;   -> L_42B4); lo leen p00:4B06 (32 bytes)
;   0x8bbe..0x8bde  (32 bytes)
DATA_indice_de_paletas_de_sala:
	defw 08bdeh,08bebh,08bf8h,08c05h,08c12h,08c1fh,08c2ch,08c39h	; 8bbe
	defw 08c46h,08c53h,08c60h,08c6dh,08c7dh,08c8ah,08c97h,08ca7h	; 8bce

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_0: la paleta 0 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8bde..0x8beb  (13 bytes)
DATA_paleta_de_sala_0:
	defb 001h,012h,002h	; 8bde
	defb 003h,001h,001h	; 8be1
	defb 005h,031h,002h	; 8be4
	defb 009h,020h,001h	; 8be7
	defb 0ffh	; 8bea

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_1: la paleta 1 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8beb..0x8bf8  (13 bytes)
DATA_paleta_de_sala_1:
	defb 001h,022h,002h	; 8beb
	defb 003h,011h,001h	; 8bee
	defb 005h,013h,002h	; 8bf1
	defb 009h,002h,001h	; 8bf4
	defb 0ffh	; 8bf7

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_2: la paleta 2 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8bf8..0x8c05  (13 bytes)
DATA_paleta_de_sala_2:
	defb 001h,022h,002h	; 8bf8
	defb 003h,011h,001h	; 8bfb
	defb 005h,031h,002h	; 8bfe
	defb 009h,000h,002h	; 8c01
	defb 0ffh	; 8c04

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_3: la paleta 3 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c05..0x8c12  (13 bytes)
DATA_paleta_de_sala_3:
	defb 001h,021h,002h	; 8c05
	defb 003h,010h,001h	; 8c08
	defb 005h,022h,002h	; 8c0b
	defb 009h,011h,001h	; 8c0e
	defb 0ffh	; 8c11

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_4: la paleta 4 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c12..0x8c1f  (13 bytes)
DATA_paleta_de_sala_4:
	defb 001h,022h,002h	; 8c12
	defb 003h,011h,001h	; 8c15
	defb 005h,012h,002h	; 8c18
	defb 009h,001h,001h	; 8c1b
	defb 0ffh	; 8c1e

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_5: la paleta 5 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c1f..0x8c2c  (13 bytes)
DATA_paleta_de_sala_5:
	defb 001h,053h,004h	; 8c1f
	defb 003h,042h,003h	; 8c22
	defb 005h,041h,002h	; 8c25
	defb 009h,020h,002h	; 8c28
	defb 0ffh	; 8c2b

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_6: la paleta 6 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c2c..0x8c39  (13 bytes)
DATA_paleta_de_sala_6:
	defb 001h,022h,002h	; 8c2c
	defb 003h,011h,001h	; 8c2f
	defb 005h,031h,002h	; 8c32
	defb 009h,020h,001h	; 8c35
	defb 0ffh	; 8c38

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_7: la paleta 7 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c39..0x8c46  (13 bytes)
DATA_paleta_de_sala_7:
	defb 001h,031h,002h	; 8c39
	defb 003h,020h,001h	; 8c3c
	defb 005h,012h,002h	; 8c3f
	defb 009h,001h,001h	; 8c42
	defb 0ffh	; 8c45

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_8: la paleta 8 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c46..0x8c53  (13 bytes)
DATA_paleta_de_sala_8:
	defb 001h,040h,002h	; 8c46
	defb 003h,030h,001h	; 8c49
	defb 005h,012h,002h	; 8c4c
	defb 009h,001h,001h	; 8c4f
	defb 0ffh	; 8c52

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_9: la paleta 9 de sala: ternas hasta 0xFF (p00:4B0D ->
;   L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c53..0x8c60  (13 bytes)
DATA_paleta_de_sala_9:
	defb 001h,022h,002h	; 8c53
	defb 003h,010h,001h	; 8c56
	defb 005h,032h,003h	; 8c59
	defb 009h,011h,001h	; 8c5c
	defb 0ffh	; 8c5f

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_10: la paleta 10 de sala: ternas hasta 0xFF (p00:4B0D
;   -> L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c60..0x8c6d  (13 bytes)
DATA_paleta_de_sala_10:
	defb 001h,044h,004h	; 8c60
	defb 003h,011h,001h	; 8c63
	defb 005h,022h,002h	; 8c66
	defb 009h,000h,000h	; 8c69
	defb 0ffh	; 8c6c

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_11: la paleta 11 de sala: ternas hasta 0xFF (p00:4B0D
;   -> L_4EC4); lo leen p00:4B0D (16 bytes)
;   0x8c6d..0x8c7d  (16 bytes)
DATA_paleta_de_sala_11:
	defb 001h,000h,000h	; 8c6d
	defb 003h,000h,000h	; 8c70
	defb 005h,000h,000h	; 8c73
	defb 009h,000h,000h	; 8c76
	defb 00ch,000h,000h	; 8c79
	defb 0ffh	; 8c7c

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_12: la paleta 12 de sala: ternas hasta 0xFF (p00:4B0D
;   -> L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c7d..0x8c8a  (13 bytes)
DATA_paleta_de_sala_12:
	defb 001h,010h,003h	; 8c7d
	defb 003h,030h,001h	; 8c80
	defb 005h,012h,002h	; 8c83
	defb 009h,001h,001h	; 8c86
	defb 0ffh	; 8c89

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_13: la paleta 13 de sala: ternas hasta 0xFF (p00:4B0D
;   -> L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8c8a..0x8c97  (13 bytes)
DATA_paleta_de_sala_13:
	defb 001h,070h,004h	; 8c8a
	defb 003h,040h,000h	; 8c8d
	defb 008h,070h,000h	; 8c90
	defb 009h,070h,007h	; 8c93
	defb 0ffh	; 8c96

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_14: la paleta 14 de sala: ternas hasta 0xFF (p00:4B0D
;   -> L_4EC4); lo leen p00:4B0D (16 bytes)
;   0x8c97..0x8ca7  (16 bytes)
DATA_paleta_de_sala_14:
	defb 001h,022h,002h	; 8c97
	defb 003h,011h,001h	; 8c9a
	defb 005h,011h,002h	; 8c9d
	defb 009h,000h,001h	; 8ca0
	defb 00ch,033h,003h	; 8ca3
	defb 0ffh	; 8ca6

; ----------------------------------------------------------------------
; DATOS paleta_de_sala_15: la paleta 15 de sala: ternas hasta 0xFF (p00:4B0D
;   -> L_4EC4); lo leen p00:4B0D (13 bytes)
;   0x8ca7..0x8cb4  (13 bytes)
DATA_paleta_de_sala_15:
	defb 001h,070h,007h	; 8ca7
	defb 003h,040h,000h	; 8caa
	defb 008h,070h,004h	; 8cad
	defb 009h,070h,004h	; 8cb0
	defb 0ffh	; 8cb3

; ----------------------------------------------------------------------
; DATOS indice_de_paletas_de_sprites: 32 punteros, uno por juego de sprites
;   (0x6185 del banco 10), a su paleta (p00:4AC5); lo leen p00:4AC5 (64 bytes)
;   0x8cb4..0x8cf4  (64 bytes)
DATA_indice_de_paletas_de_sprites:
	defw 08cf4h,08cfdh,08cfeh,08d0bh,08d12h,08d19h,08d20h,08d24h	; 8cb4
	defw 08d2eh,08d35h,08d3ch,08d43h,08cfdh,08d4ah,08d4eh,08d52h	; 8cc4
	defw 08d5ch,08d63h,08d6ah,08d71h,08d78h,08cfdh,08cfeh,08cfeh	; 8cd4
	defw 08d85h,08d85h,08cfdh,08d8ch,08d8ch,08d93h,08d9ah,08da1h	; 8ce4

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8CF4: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); se solapan 2 bloques: (paleta_de_sprites_8CFD 8CFD-8CFE);
;   lo leen p00:4B0D (10 bytes)
;   0x8cf4..0x8cfe  (10 bytes)
DATA_paleta_de_sprites_8CF4:
	defb 002h,027h,002h	; 8cf4
	defb 00bh,022h,002h	; 8cf7
	defb 00dh,055h,005h	; 8cfa
	defb 0ffh	; 8cfd

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8CFE: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (13 bytes)
;   0x8cfe..0x8d0b  (13 bytes)
DATA_paleta_de_sprites_8CFE:
	defb 004h,050h,000h	; 8cfe
	defb 00bh,050h,000h	; 8d01
	defb 002h,022h,002h	; 8d04
	defb 00dh,042h,003h	; 8d07
	defb 0ffh	; 8d0a

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D0B: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d0b..0x8d12  (7 bytes)
DATA_paleta_de_sprites_8D0B:
	defb 002h,021h,001h	; 8d0b
	defb 00dh,053h,004h	; 8d0e
	defb 0ffh	; 8d11

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D12: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d12..0x8d19  (7 bytes)
DATA_paleta_de_sprites_8D12:
	defb 002h,040h,000h	; 8d12
	defb 00dh,070h,000h	; 8d15
	defb 0ffh	; 8d18

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D19: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d19..0x8d20  (7 bytes)
DATA_paleta_de_sprites_8D19:
	defb 002h,030h,002h	; 8d19
	defb 00dh,053h,004h	; 8d1c
	defb 0ffh	; 8d1f

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D20: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (4 bytes)
;   0x8d20..0x8d24  (4 bytes)
DATA_paleta_de_sprites_8D20:
	defb 00dh,073h,004h	; 8d20
	defb 0ffh	; 8d23

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D24: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (10 bytes)
;   0x8d24..0x8d2e  (10 bytes)
DATA_paleta_de_sprites_8D24:
	defb 002h,021h,002h	; 8d24
	defb 00dh,053h,004h	; 8d27
	defb 00bh,055h,005h	; 8d2a
	defb 0ffh	; 8d2d

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D2E: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d2e..0x8d35  (7 bytes)
DATA_paleta_de_sprites_8D2E:
	defb 00dh,053h,004h	; 8d2e
	defb 00bh,041h,000h	; 8d31
	defb 0ffh	; 8d34

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D35: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d35..0x8d3c  (7 bytes)
DATA_paleta_de_sprites_8D35:
	defb 002h,013h,002h	; 8d35
	defb 00dh,042h,003h	; 8d38
	defb 0ffh	; 8d3b

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D3C: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d3c..0x8d43  (7 bytes)
DATA_paleta_de_sprites_8D3C:
	defb 002h,012h,001h	; 8d3c
	defb 00dh,042h,003h	; 8d3f
	defb 0ffh	; 8d42

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D43: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d43..0x8d4a  (7 bytes)
DATA_paleta_de_sprites_8D43:
	defb 002h,041h,002h	; 8d43
	defb 00dh,053h,004h	; 8d46
	defb 0ffh	; 8d49

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D4A: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (4 bytes)
;   0x8d4a..0x8d4e  (4 bytes)
DATA_paleta_de_sprites_8D4A:
	defb 00bh,012h,002h	; 8d4a
	defb 0ffh	; 8d4d

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D4E: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (4 bytes)
;   0x8d4e..0x8d52  (4 bytes)
DATA_paleta_de_sprites_8D4E:
	defb 00bh,012h,001h	; 8d4e
	defb 0ffh	; 8d51

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D52: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (10 bytes)
;   0x8d52..0x8d5c  (10 bytes)
DATA_paleta_de_sprites_8D52:
	defb 002h,002h,001h	; 8d52
	defb 00bh,021h,003h	; 8d55
	defb 00dh,053h,004h	; 8d58
	defb 0ffh	; 8d5b

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D5C: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d5c..0x8d63  (7 bytes)
DATA_paleta_de_sprites_8D5C:
	defb 002h,077h,007h	; 8d5c
	defb 00dh,053h,004h	; 8d5f
	defb 0ffh	; 8d62

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D63: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d63..0x8d6a  (7 bytes)
DATA_paleta_de_sprites_8D63:
	defb 002h,020h,002h	; 8d63
	defb 00dh,053h,004h	; 8d66
	defb 0ffh	; 8d69

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D6A: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d6a..0x8d71  (7 bytes)
DATA_paleta_de_sprites_8D6A:
	defb 002h,012h,002h	; 8d6a
	defb 00dh,053h,004h	; 8d6d
	defb 0ffh	; 8d70

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D71: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d71..0x8d78  (7 bytes)
DATA_paleta_de_sprites_8D71:
	defb 002h,044h,004h	; 8d71
	defb 00dh,022h,002h	; 8d74
	defb 0ffh	; 8d77

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D78: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (13 bytes)
;   0x8d78..0x8d85  (13 bytes)
DATA_paleta_de_sprites_8D78:
	defb 004h,050h,000h	; 8d78
	defb 00bh,050h,000h	; 8d7b
	defb 002h,022h,002h	; 8d7e
	defb 00dh,053h,004h	; 8d81
	defb 0ffh	; 8d84

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D85: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d85..0x8d8c  (7 bytes)
DATA_paleta_de_sprites_8D85:
	defb 002h,055h,005h	; 8d85
	defb 00dh,022h,002h	; 8d88
	defb 0ffh	; 8d8b

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D8C: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d8c..0x8d93  (7 bytes)
DATA_paleta_de_sprites_8D8C:
	defb 002h,021h,001h	; 8d8c
	defb 00dh,053h,004h	; 8d8f
	defb 0ffh	; 8d92

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D93: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d93..0x8d9a  (7 bytes)
DATA_paleta_de_sprites_8D93:
	defb 002h,020h,000h	; 8d93
	defb 00dh,042h,003h	; 8d96
	defb 0ffh	; 8d99

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8D9A: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8d9a..0x8da1  (7 bytes)
DATA_paleta_de_sprites_8D9A:
	defb 002h,003h,000h	; 8d9a
	defb 00dh,042h,003h	; 8d9d
	defb 0ffh	; 8da0

; ----------------------------------------------------------------------
; DATOS paleta_de_sprites_8DA1: paleta de un juego de sprites: ternas hasta
;   0xFF (p00:4B0D); lo leen p00:4B0D (7 bytes)
;   0x8da1..0x8da8  (7 bytes)
DATA_paleta_de_sprites_8DA1:
	defb 002h,000h,002h	; 8da1
	defb 00dh,042h,003h	; 8da4
	defb 0ffh	; 8da7

; ----------------------------------------------------------------------
; DATOS indice_de_ascensores: 11 punteros, salas 0xF0-0xFA, a la ficha del
;   ascensor (p00:4335 lee 0x8DA8 + 2 x (sala - 0xF0)); lo leen p00:4335 (22
;   bytes)
;   0x8da8..0x8dbe  (22 bytes)
DATA_indice_de_ascensores:
	defw 08dbeh,08dc6h,08dd1h,08dd9h,08de4h,08de9h,08df4h,08df9h	; 8da8
	defw 08dfeh,08dfeh,08e09h	; 8db8  -> DATA_ascensor_8DFE DATA_ascensor_8DFE DATA_ascensor_8E09

; ----------------------------------------------------------------------
; DATOS ascensor_8DBE: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (8 bytes)
;   0x8dbe..0x8dc6  (8 bytes)
DATA_ascensor_8DBE:
	defb 038h,0b8h,01fh,034h,038h,003h,0b4h,0b8h	; 8dbe  8..48...

; ----------------------------------------------------------------------
; DATOS ascensor_8DC6: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (11 bytes)
;   0x8dc6..0x8dd1  (11 bytes)
DATA_ascensor_8DC6:
	defb 028h,0b8h,01bh,034h,038h,00fh,074h,078h,03fh,0b4h,0b8h	; 8dc6  (..48.tx?..

; ----------------------------------------------------------------------
; DATOS ascensor_8DD1: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (8 bytes)
;   0x8dd1..0x8dd9  (8 bytes)
DATA_ascensor_8DD1:
	defb 078h,0c8h,035h,074h,078h,027h,0b4h,0b8h	; 8dd1  x.5tx'..

; ----------------------------------------------------------------------
; DATOS ascensor_8DD9: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (11 bytes)
;   0x8dd9..0x8de4  (11 bytes)
DATA_ascensor_8DD9:
	defb 028h,0b8h,051h,034h,038h,048h,074h,078h,05fh,0b4h,0b8h	; 8dd9  (.Q48Htx_..

; ----------------------------------------------------------------------
; DATOS ascensor_8DE4: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (5 bytes)
;   0x8de4..0x8de9  (5 bytes)
DATA_ascensor_8DE4:
	defb 0b8h,0c8h,058h,0b4h,0b8h	; 8de4

; ----------------------------------------------------------------------
; DATOS ascensor_8DE9: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (11 bytes)
;   0x8de9..0x8df4  (11 bytes)
DATA_ascensor_8DE9:
	defb 028h,0b8h,0cdh,034h,038h,0ceh,074h,078h,0cfh,0b4h,0b8h	; 8de9  (..48.tx...

; ----------------------------------------------------------------------
; DATOS ascensor_8DF4: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (5 bytes)
;   0x8df4..0x8df9  (5 bytes)
DATA_ascensor_8DF4:
	defb 0b8h,0c8h,09ah,0b4h,0b8h	; 8df4

; ----------------------------------------------------------------------
; DATOS ascensor_8DF9: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (5 bytes)
;   0x8df9..0x8dfe  (5 bytes)
DATA_ascensor_8DF9:
	defb 038h,0c8h,06dh,034h,038h	; 8df9

; ----------------------------------------------------------------------
; DATOS ascensor_8DFE: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (11 bytes)
;   0x8dfe..0x8e09  (11 bytes)
DATA_ascensor_8DFE:
	defb 028h,0c8h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8dfe  (..........

; ----------------------------------------------------------------------
; DATOS ascensor_8E09: la ficha de un ascensor: 2 bytes que p00:433C guarda en
;   0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la sala de
;   0xC136; lo leen p00:432D (5 bytes)
;   0x8e09..0x8e0e  (5 bytes)
DATA_ascensor_8E09:
	defb 028h,0b8h,073h,0b4h,0b8h	; 8e09

; ----------------------------------------------------------------------
; DATOS salas_vecinas: 156 fichas de 4 bytes, una por sala (p00:4302: las
;   salas 0x7E-0xCF restan 0x52 y las 0xD0-0xE3 y 0xF1+ restan 0x5F), con la
;   sala a la que se sale por cada lado (0xC133 - 1 elige el byte; 0xFF = no
;   hay); lo leen p00:4302 (624 bytes)
;   0x8e0e..0x907e  (624 bytes)
DATA_salas_vecinas:
	defb 001h,079h,0ffh,004h	; 8e0e
	defb 002h,000h,0ffh,005h	; 8e12
	defb 003h,001h,0ffh,006h	; 8e16
	defb 0ffh,002h,0ffh,007h	; 8e1a
	defb 005h,0ffh,000h,008h	; 8e1e
	defb 006h,004h,001h,009h	; 8e22
	defb 007h,005h,002h,00ah	; 8e26
	defb 0ffh,006h,003h,00bh	; 8e2a
	defb 009h,0ffh,004h,00ch	; 8e2e
	defb 00ah,008h,005h,00dh	; 8e32
	defb 00bh,009h,006h,00eh	; 8e36
	defb 040h,00ah,007h,00fh	; 8e3a
	defb 00dh,0ffh,008h,0ffh	; 8e3e
	defb 00eh,00ch,009h,0ffh	; 8e42
	defb 00fh,00dh,00ah,0ffh	; 8e46
	defb 0ffh,00eh,00bh,0ffh	; 8e4a
	defb 011h,0ffh,0ffh,014h	; 8e4e
	defb 012h,010h,0ffh,0ffh	; 8e52
	defb 013h,011h,0ffh,0ffh	; 8e56
	defb 0ffh,012h,0ffh,015h	; 8e5a
	defb 0ffh,0ffh,010h,016h	; 8e5e
	defb 0ffh,0ffh,013h,017h	; 8e62
	defb 0ffh,0ffh,014h,018h	; 8e66
	defb 0ffh,0ffh,015h,01bh	; 8e6a
	defb 019h,0ffh,016h,0ffh	; 8e6e
	defb 01ah,018h,0ffh,0ffh	; 8e72
	defb 01bh,019h,0ffh,0ffh	; 8e76
	defb 0ffh,01ah,017h,0ffh	; 8e7a
	defb 01dh,0ffh,0ffh,020h	; 8e7e
	defb 01eh,01ch,0ffh,0ffh	; 8e82
	defb 01fh,01dh,0ffh,0ffh	; 8e86
	defb 0ffh,01eh,0ffh,021h	; 8e8a
	defb 0ffh,0ffh,01ch,022h	; 8e8e
	defb 0ffh,0ffh,01fh,023h	; 8e92
	defb 0ffh,0ffh,020h,024h	; 8e96
	defb 0ffh,0ffh,021h,027h	; 8e9a
	defb 025h,0ffh,022h,0ffh	; 8e9e
	defb 026h,024h,0ffh,0ffh	; 8ea2
	defb 027h,025h,0ffh,0ffh	; 8ea6
	defb 0ffh,026h,023h,0ffh	; 8eaa
	defb 029h,0ffh,0ffh,02ch	; 8eae
	defb 02ah,028h,0ffh,02dh	; 8eb2
	defb 02bh,029h,0ffh,02eh	; 8eb6
	defb 0ffh,02ah,0ffh,02fh	; 8eba
	defb 02dh,0ffh,028h,030h	; 8ebe
	defb 02eh,02ch,029h,075h	; 8ec2
	defb 02fh,02dh,02ah,0ffh	; 8ec6
	defb 0ffh,02eh,02bh,031h	; 8eca
	defb 075h,0ffh,02ch,032h	; 8ece
	defb 0ffh,0ffh,02fh,035h	; 8ed2
	defb 033h,0ffh,030h,0ffh	; 8ed6
	defb 034h,032h,075h,0ffh	; 8eda
	defb 035h,033h,0ffh,0ffh	; 8ede
	defb 0ffh,034h,031h,0ffh	; 8ee2
	defb 037h,0ffh,0ffh,039h	; 8ee6
	defb 038h,036h,0ffh,0ffh	; 8eea
	defb 07bh,037h,0ffh,0ffh	; 8eee
	defb 0ffh,0ffh,036h,03ah	; 8ef2
	defb 03bh,0ffh,039h,03dh	; 8ef6
	defb 03ch,03ah,0ffh,03eh	; 8efa
	defb 0ffh,03bh,0ffh,03fh	; 8efe
	defb 03eh,0ffh,03ah,0ffh	; 8f02
	defb 03fh,03dh,03bh,0ffh	; 8f06
	defb 0ffh,03eh,03ch,0ffh	; 8f0a
	defb 078h,00bh,040h,040h	; 8f0e
	defb 042h,078h,041h,041h	; 8f12
	defb 043h,041h,042h,042h	; 8f16
	defb 044h,042h,043h,043h	; 8f1a
	defb 045h,043h,044h,044h	; 8f1e
	defb 049h,044h,045h,045h	; 8f22
	defb 047h,0ffh,0ffh,049h	; 8f26
	defb 048h,046h,0ffh,04ah	; 8f2a
	defb 0ffh,047h,0ffh,04bh	; 8f2e
	defb 04ah,045h,046h,04ch	; 8f32
	defb 04bh,049h,047h,04dh	; 8f36
	defb 066h,04ah,048h,04eh	; 8f3a
	defb 04dh,0ffh,049h,0ffh	; 8f3e
	defb 04eh,04ch,04ah,0ffh	; 8f42
	defb 069h,04dh,04bh,0ffh	; 8f46
	defb 050h,0ffh,0ffh,052h	; 8f4a
	defb 051h,04fh,0ffh,053h	; 8f4e
	defb 0ffh,050h,0ffh,054h	; 8f52
	defb 053h,0ffh,04fh,055h	; 8f56
	defb 054h,052h,050h,056h	; 8f5a
	defb 0ffh,053h,051h,057h	; 8f5e
	defb 056h,0ffh,052h,0ffh	; 8f62
	defb 057h,055h,053h,0ffh	; 8f66
	defb 0ffh,056h,054h,0ffh	; 8f6a
	defb 0ffh,0ffh,0ffh,05bh	; 8f6e
	defb 05ah,0ffh,0ffh,05ch	; 8f72
	defb 05bh,059h,0ffh,0ffh	; 8f76
	defb 0ffh,05ah,058h,0ffh	; 8f7a
	defb 0ffh,0ffh,059h,0ffh	; 8f7e
	defb 05eh,07dh,0ffh,060h	; 8f82
	defb 05fh,05dh,0ffh,061h	; 8f86
	defb 0ffh,05eh,0ffh,062h	; 8f8a
	defb 061h,0ffh,05dh,063h	; 8f8e
	defb 062h,060h,05eh,064h	; 8f92
	defb 0ffh,061h,05fh,065h	; 8f96
	defb 064h,0ffh,060h,0ffh	; 8f9a
	defb 065h,063h,061h,0ffh	; 8f9e
	defb 0ffh,064h,062h,0ffh	; 8fa2
	defb 067h,04bh,066h,066h	; 8fa6
	defb 0d0h,066h,067h,067h	; 8faa
	defb 06ch,0d2h,068h,068h	; 8fae
	defb 06ah,04eh,0ffh,0ffh	; 8fb2
	defb 0d3h,069h,0ffh,0ffh	; 8fb6
	defb 06eh,0d4h,06ch,0ffh	; 8fba
	defb 06dh,068h,0ffh,06bh	; 8fbe
	defb 0ffh,06ch,0ffh,06eh	; 8fc2
	defb 0ffh,06bh,06dh,0ffh	; 8fc6
	defb 070h,0ffh,0ffh,073h	; 8fca
	defb 071h,06fh,0ffh,0ffh	; 8fce
	defb 072h,070h,0ffh,0ffh	; 8fd2
	defb 074h,071h,0ffh,0ffh	; 8fd6
	defb 0ffh,0ffh,06fh,0ffh	; 8fda
	defb 076h,072h,0ffh,0ffh	; 8fde
	defb 0ffh,030h,02dh,033h	; 8fe2
	defb 0ffh,074h,077h,0ffh	; 8fe6
	defb 0ffh,0ffh,0ffh,076h	; 8fea
	defb 041h,040h,078h,078h	; 8fee
	defb 000h,0ffh,0ffh,0ffh	; 8ff2
	defb 0ffh,0ffh,0ffh,0ffh	; 8ff6
	defb 0ddh,038h,0ffh,0ffh	; 8ffa
	defb 07dh,0dch,0ffh,0ffh	; 8ffe
	defb 05dh,07ch,0ffh,0ffh	; 9002
	defb 0d1h,067h,0d0h,0d0h	; 9006
	defb 0d2h,0d0h,0d1h,0d1h	; 900a
	defb 068h,0d1h,0d2h,0d2h	; 900e
	defb 0d4h,06ah,0ffh,0ffh	; 9012
	defb 06bh,0d3h,0ffh,0ffh	; 9016
	defb 0ffh,0ffh,0ffh,0ffh	; 901a
	defb 0ffh,0ffh,0ffh,0ffh	; 901e
	defb 0ffh,0ffh,0ffh,0ffh	; 9022
	defb 0ffh,0ffh,0ffh,0ffh	; 9026
	defb 0ffh,0ffh,0ffh,0ffh	; 902a
	defb 0ffh,0ffh,0ffh,0ffh	; 902e
	defb 0ffh,0ffh,0ffh,0ffh	; 9032
	defb 07ch,0ddh,0ffh,0ffh	; 9036
	defb 0dch,07bh,0ffh,0ffh	; 903a
	defb 0ddh,07ch,0ffh,0ffh	; 903e
	defb 0ffh,0ffh,0ffh,0ffh	; 9042
	defb 0e1h,0ffh,0ffh,0ffh	; 9046
	defb 0e2h,0e0h,0ffh,0ffh	; 904a
	defb 0e3h,0e1h,0ffh,0ffh	; 904e
	defb 0e4h,0e2h,0ffh,0ffh	; 9052
	defb 0f2h,0ffh,0ffh,0ffh	; 9056
	defb 0ffh,0f1h,0ffh,0ffh	; 905a
	defb 0f4h,0ffh,0ffh,0ffh	; 905e
	defb 0ffh,0f3h,0ffh,0ffh	; 9062
	defb 0f6h,0ffh,0ffh,0ffh	; 9066
	defb 0ffh,0f5h,0ffh,0ffh	; 906a
	defb 0ffh,0f8h,0ffh,0ffh	; 906e
	defb 0f7h,0f9h,0ffh,0ffh	; 9072
	defb 0f8h,0fah,0ffh,0ffh	; 9076
	defb 0f9h,0ffh,0ffh,0ffh	; 907a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_1: [cuantos (nibble bajo)] y 3 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (10 bytes)
;   0x907e..0x9088  (10 bytes)
DATA_actores_de_la_sala_1:
	defb 003h	; 907e
	defb 005h,0b0h,040h	; 907f
	defb 004h,050h,050h	; 9082
	defb 005h,018h,0c0h	; 9085

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_2: [cuantos (nibble bajo)] y 2 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (7 bytes)
;   0x9088..0x908f  (7 bytes)
DATA_actores_de_la_sala_2:
	defb 002h	; 9088
	defb 004h,030h,040h	; 9089
	defb 005h,070h,0a8h	; 908c

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_3: [cuantos (nibble bajo)] y 3 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (10 bytes)
;   0x908f..0x9099  (10 bytes)
DATA_actores_de_la_sala_3:
	defb 003h	; 908f
	defb 028h,080h,080h	; 9090
	defb 00eh,030h,050h	; 9093
	defb 00eh,030h,090h	; 9096

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_4: [cuantos (nibble bajo)] y 2 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (7 bytes)
;   0x9099..0x90a0  (7 bytes)
DATA_actores_de_la_sala_4:
	defb 002h	; 9099
	defb 005h,088h,088h	; 909a
	defb 01eh,088h,098h	; 909d

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_5: [cuantos (nibble bajo)] y 1 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (4 bytes)
;   0x90a0..0x90a4  (4 bytes)
DATA_actores_de_la_sala_5:
	defb 001h	; 90a0
	defb 013h,078h,070h	; 90a1

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_6: [cuantos (nibble bajo)] y 2 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (7 bytes)
;   0x90a4..0x90ab  (7 bytes)
DATA_actores_de_la_sala_6:
	defb 002h	; 90a4
	defb 019h,040h,0a0h	; 90a5
	defb 019h,030h,070h	; 90a8

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_7: [cuantos (nibble bajo)] y 2 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (7 bytes)
;   0x90ab..0x90b2  (7 bytes)
DATA_actores_de_la_sala_7:
	defb 002h	; 90ab
	defb 013h,078h,050h	; 90ac
	defb 013h,078h,070h	; 90af

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_9: [cuantos (nibble bajo)] y 12 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (37 bytes)
;   0x90b2..0x90d7  (37 bytes)
DATA_actores_de_la_sala_9:
	defb 00ch	; 90b2
	defb 007h,048h,068h	; 90b3
	defb 007h,048h,088h	; 90b6
	defb 007h,048h,0e8h	; 90b9
	defb 007h,068h,088h	; 90bc
	defb 007h,068h,0d8h	; 90bf
	defb 007h,078h,068h	; 90c2
	defb 007h,088h,098h	; 90c5
	defb 007h,088h,0c8h	; 90c8
	defb 007h,098h,078h	; 90cb
	defb 007h,0a8h,098h	; 90ce
	defb 007h,0a8h,0b8h	; 90d1
	defb 007h,0b8h,0c8h	; 90d4

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_10: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x90d7..0x90e1  (10 bytes)
DATA_actores_de_la_sala_10:
	defb 003h	; 90d7
	defb 019h,090h,0b0h	; 90d8
	defb 019h,080h,050h	; 90db
	defb 019h,090h,060h	; 90de

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_11: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x90e1..0x90ee  (13 bytes)
DATA_actores_de_la_sala_11:
	defb 004h	; 90e1
	defb 030h,050h,050h	; 90e2
	defb 030h,050h,0a0h	; 90e5
	defb 030h,080h,058h	; 90e8
	defb 030h,080h,0a0h	; 90eb

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_12: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x90ee..0x90f5  (7 bytes)
DATA_actores_de_la_sala_12:
	defb 002h	; 90ee
	defb 004h,060h,088h	; 90ef
	defb 004h,078h,0e8h	; 90f2

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_13: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x90f5..0x90fc  (7 bytes)
DATA_actores_de_la_sala_13:
	defb 002h	; 90f5
	defb 004h,070h,058h	; 90f6
	defb 004h,060h,088h	; 90f9

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_14: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x90fc..0x9106  (10 bytes)
DATA_actores_de_la_sala_14:
	defb 003h	; 90fc
	defb 006h,098h,040h	; 90fd
	defb 006h,050h,0c0h	; 9100
	defb 006h,0b8h,0a0h	; 9103

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_15: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9106..0x910d  (7 bytes)
DATA_actores_de_la_sala_15:
	defb 002h	; 9106
	defb 004h,0a8h,010h	; 9107
	defb 004h,030h,0e8h	; 910a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_16: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x910d..0x9111  (4 bytes)
DATA_actores_de_la_sala_16:
	defb 001h	; 910d
	defb 018h,086h,060h	; 910e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_17: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x9111..0x911e  (13 bytes)
DATA_actores_de_la_sala_17:
	defb 004h	; 9111
	defb 004h,030h,058h	; 9112
	defb 004h,030h,0c0h	; 9115
	defb 004h,090h,0a0h	; 9118
	defb 004h,0b0h,060h	; 911b

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_18: [cuantos (nibble bajo)] y 5 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (16 bytes)
;   0x911e..0x912e  (16 bytes)
DATA_actores_de_la_sala_18:
	defb 005h	; 911e
	defb 004h,070h,060h	; 911f
	defb 004h,013h,020h	; 9122
	defb 004h,013h,0e0h	; 9125
	defb 004h,088h,018h	; 9128
	defb 004h,090h,0c8h	; 912b

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_19: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x912e..0x9135  (7 bytes)
DATA_actores_de_la_sala_19:
	defb 002h	; 912e
	defb 01eh,078h,0c8h	; 912f
	defb 01eh,0a8h,038h	; 9132

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_20: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9135..0x9139  (4 bytes)
DATA_actores_de_la_sala_20:
	defb 001h	; 9135
	defb 022h,034h,0e0h	; 9136

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_21: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9139..0x913d  (4 bytes)
DATA_actores_de_la_sala_21:
	defb 001h	; 9139
	defb 006h,058h,080h	; 913a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_22: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x913d..0x9144  (7 bytes)
DATA_actores_de_la_sala_22:
	defb 002h	; 913d
	defb 01eh,0a8h,020h	; 913e
	defb 01eh,0a8h,0f0h	; 9141

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_23: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9144..0x914e  (10 bytes)
DATA_actores_de_la_sala_23:
	defb 003h	; 9144
	defb 004h,028h,080h	; 9145
	defb 004h,050h,068h	; 9148
	defb 004h,090h,068h	; 914b

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_24: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x914e..0x9152  (4 bytes)
DATA_actores_de_la_sala_24:
	defb 001h	; 914e
	defb 023h,000h,000h	; 914f

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_26: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9152..0x9156  (4 bytes)
DATA_actores_de_la_sala_26:
	defb 001h	; 9152
	defb 004h,070h,080h	; 9153

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_27: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9156..0x915d  (7 bytes)
DATA_actores_de_la_sala_27:
	defb 002h	; 9156
	defb 006h,040h,058h	; 9157
	defb 006h,068h,060h	; 915a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_28: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x915d..0x9164  (7 bytes)
DATA_actores_de_la_sala_28:
	defb 002h	; 915d
	defb 006h,068h,020h	; 915e
	defb 004h,068h,0a8h	; 9161

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_29: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x9164..0x9171  (13 bytes)
DATA_actores_de_la_sala_29:
	defb 004h	; 9164
	defb 008h,070h,080h	; 9165
	defb 008h,050h,028h	; 9168
	defb 008h,030h,0c0h	; 916b
	defb 008h,0b0h,0a0h	; 916e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_30: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9171..0x9178  (7 bytes)
DATA_actores_de_la_sala_30:
	defb 002h	; 9171
	defb 01eh,090h,0c8h	; 9172
	defb 01eh,0b0h,038h	; 9175

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_31: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9178..0x917f  (7 bytes)
DATA_actores_de_la_sala_31:
	defb 002h	; 9178
	defb 006h,070h,040h	; 9179
	defb 006h,040h,0c0h	; 917c

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_32: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x917f..0x9183  (4 bytes)
DATA_actores_de_la_sala_32:
	defb 001h	; 917f
	defb 004h,058h,0b8h	; 9180

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_33: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9183..0x918a  (7 bytes)
DATA_actores_de_la_sala_33:
	defb 002h	; 9183
	defb 005h,030h,078h	; 9184
	defb 005h,030h,088h	; 9187

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_34: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x918a..0x9191  (7 bytes)
DATA_actores_de_la_sala_34:
	defb 002h	; 918a
	defb 01eh,028h,078h	; 918b
	defb 005h,028h,0c8h	; 918e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_35: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9191..0x919b  (10 bytes)
DATA_actores_de_la_sala_35:
	defb 003h	; 9191
	defb 004h,028h,068h	; 9192
	defb 01eh,060h,018h	; 9195
	defb 004h,0b0h,088h	; 9198

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_36: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x919b..0x91a5  (10 bytes)
DATA_actores_de_la_sala_36:
	defb 003h	; 919b
	defb 006h,038h,060h	; 919c
	defb 006h,078h,0f0h	; 919f
	defb 004h,070h,088h	; 91a2

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_37: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x91a5..0x91a9  (4 bytes)
DATA_actores_de_la_sala_37:
	defb 001h	; 91a5
	defb 02ch,010h,064h	; 91a6

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_38: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x91a9..0x91b0  (7 bytes)
DATA_actores_de_la_sala_38:
	defb 002h	; 91a9
	defb 004h,050h,038h	; 91aa
	defb 01eh,088h,040h	; 91ad

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_39: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x91b0..0x91bd  (13 bytes)
DATA_actores_de_la_sala_39:
	defb 004h	; 91b0
	defb 030h,048h,040h	; 91b1
	defb 030h,048h,0c0h	; 91b4
	defb 030h,0b0h,050h	; 91b7
	defb 030h,0b0h,0b8h	; 91ba

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_40: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x91bd..0x91c1  (4 bytes)
DATA_actores_de_la_sala_40:
	defb 001h	; 91bd
	defb 015h,060h,044h	; 91be

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_43: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x91c1..0x91c8  (7 bytes)
DATA_actores_de_la_sala_43:
	defb 002h	; 91c1
	defb 005h,090h,018h	; 91c2
	defb 004h,028h,0e8h	; 91c5

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_44: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x91c8..0x91cc  (4 bytes)
DATA_actores_de_la_sala_44:
	defb 001h	; 91c8
	defb 014h,080h,088h	; 91c9

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_45: [cuantos (nibble bajo)] y 9 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (28 bytes)
;   0x91cc..0x91e8  (28 bytes)
DATA_actores_de_la_sala_45:
	defb 009h	; 91cc
	defb 001h,030h,070h	; 91cd
	defb 002h,027h,073h	; 91d0
	defb 002h,037h,07bh	; 91d3
	defb 002h,047h,07eh	; 91d6
	defb 002h,057h,082h	; 91d9
	defb 002h,067h,085h	; 91dc
	defb 002h,077h,089h	; 91df
	defb 002h,087h,08ch	; 91e2
	defb 002h,097h,090h	; 91e5

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_46: [cuantos (nibble bajo)] y 9 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (28 bytes)
;   0x91e8..0x9204  (28 bytes)
DATA_actores_de_la_sala_46:
	defb 009h	; 91e8
	defb 001h,030h,090h	; 91e9
	defb 002h,027h,08ch	; 91ec
	defb 002h,037h,089h	; 91ef
	defb 002h,047h,085h	; 91f2
	defb 002h,057h,082h	; 91f5
	defb 002h,067h,07eh	; 91f8
	defb 002h,077h,07bh	; 91fb
	defb 002h,087h,073h	; 91fe
	defb 002h,097h,070h	; 9201

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_47: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9204..0x920b  (7 bytes)
DATA_actores_de_la_sala_47:
	defb 002h	; 9204
	defb 005h,078h,038h	; 9205
	defb 005h,0a8h,088h	; 9208

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_48: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x920b..0x920f  (4 bytes)
DATA_actores_de_la_sala_48:
	defb 001h	; 920b
	defb 014h,086h,092h	; 920c

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_49: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x920f..0x9219  (10 bytes)
DATA_actores_de_la_sala_49:
	defb 003h	; 920f
	defb 005h,028h,040h	; 9210
	defb 005h,050h,080h	; 9213
	defb 005h,028h,0c0h	; 9216

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_50: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9219..0x921d  (4 bytes)
DATA_actores_de_la_sala_50:
	defb 001h	; 9219
	defb 026h,058h,080h	; 921a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_51: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x921d..0x9221  (4 bytes)
DATA_actores_de_la_sala_51:
	defb 001h	; 921d
	defb 004h,030h,080h	; 921e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_52: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9221..0x9228  (7 bytes)
DATA_actores_de_la_sala_52:
	defb 002h	; 9221
	defb 01eh,030h,0e0h	; 9222
	defb 01eh,090h,018h	; 9225

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_55: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9228..0x922f  (7 bytes)
DATA_actores_de_la_sala_55:
	defb 002h	; 9228
	defb 019h,058h,048h	; 9229
	defb 019h,07eh,018h	; 922c

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_56: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x922f..0x923c  (13 bytes)
DATA_actores_de_la_sala_56:
	defb 004h	; 922f
	defb 019h,068h,052h	; 9230
	defb 019h,062h,090h	; 9233
	defb 019h,036h,070h	; 9236
	defb 019h,064h,0dah	; 9239

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_57: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x923c..0x9240  (4 bytes)
DATA_actores_de_la_sala_57:
	defb 001h	; 923c
	defb 021h,038h,090h	; 923d

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_58: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9240..0x9247  (7 bytes)
DATA_actores_de_la_sala_58:
	defb 002h	; 9240
	defb 01bh,090h,020h	; 9241
	defb 01dh,060h,080h	; 9244

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_60: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9247..0x924e  (7 bytes)
DATA_actores_de_la_sala_60:
	defb 002h	; 9247
	defb 01bh,040h,020h	; 9248
	defb 01dh,060h,080h	; 924b

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_61: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x924e..0x9255  (7 bytes)
DATA_actores_de_la_sala_61:
	defb 002h	; 924e
	defb 01bh,060h,0e0h	; 924f
	defb 01dh,060h,080h	; 9252

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_59: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9255..0x9259  (4 bytes)
DATA_actores_de_la_sala_59:
	defb 001h	; 9255
	defb 01dh,060h,080h	; 9256

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_64: [cuantos (nibble bajo)] y 9 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (28 bytes)
;   0x9259..0x9275  (28 bytes)
DATA_actores_de_la_sala_64:
	defb 009h	; 9259
	defb 007h,038h,018h	; 925a
	defb 007h,048h,068h	; 925d
	defb 007h,048h,098h	; 9260
	defb 007h,058h,0d8h	; 9263
	defb 007h,068h,078h	; 9266
	defb 007h,068h,0a8h	; 9269
	defb 007h,078h,088h	; 926c
	defb 007h,088h,0b8h	; 926f
	defb 007h,098h,048h	; 9272

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_65: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9275..0x9279  (4 bytes)
DATA_actores_de_la_sala_65:
	defb 001h	; 9275
	defb 027h,010h,080h	; 9276

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_67: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9279..0x927d  (4 bytes)
DATA_actores_de_la_sala_67:
	defb 001h	; 9279
	defb 009h,010h,090h	; 927a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_69: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x927d..0x928a  (13 bytes)
DATA_actores_de_la_sala_69:
	defb 004h	; 927d
	defb 030h,048h,060h	; 927e
	defb 030h,070h,070h	; 9281
	defb 030h,070h,098h	; 9284
	defb 02eh,078h,080h	; 9287

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_70: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x928a..0x9291  (7 bytes)
DATA_actores_de_la_sala_70:
	defb 002h	; 928a
	defb 004h,045h,050h	; 928b
	defb 004h,02bh,0a0h	; 928e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_71: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9291..0x9295  (4 bytes)
DATA_actores_de_la_sala_71:
	defb 001h	; 9291
	defb 012h,020h,070h	; 9292

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_74: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9295..0x929f  (10 bytes)
DATA_actores_de_la_sala_74:
	defb 003h	; 9295
	defb 004h,028h,0c0h	; 9296
	defb 004h,060h,030h	; 9299
	defb 004h,0abh,090h	; 929c

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_76: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x929f..0x92a3  (4 bytes)
DATA_actores_de_la_sala_76:
	defb 001h	; 929f
	defb 010h,080h,0a0h	; 92a0

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_77: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x92a3..0x92ad  (10 bytes)
DATA_actores_de_la_sala_77:
	defb 003h	; 92a3
	defb 030h,028h,028h	; 92a4
	defb 004h,088h,0d8h	; 92a7
	defb 004h,0abh,0c0h	; 92aa

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_79: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x92ad..0x92ba  (13 bytes)
DATA_actores_de_la_sala_79:
	defb 004h	; 92ad
	defb 01eh,030h,040h	; 92ae
	defb 01eh,0abh,020h	; 92b1
	defb 01eh,048h,090h	; 92b4
	defb 004h,070h,0e0h	; 92b7

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_80: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x92ba..0x92c4  (10 bytes)
DATA_actores_de_la_sala_80:
	defb 003h	; 92ba
	defb 030h,070h,030h	; 92bb
	defb 030h,030h,088h	; 92be
	defb 030h,058h,098h	; 92c1

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_81: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x92c4..0x92d1  (13 bytes)
DATA_actores_de_la_sala_81:
	defb 004h	; 92c4
	defb 004h,080h,01ch	; 92c5
	defb 004h,030h,020h	; 92c8
	defb 004h,02bh,0e0h	; 92cb
	defb 004h,0b0h,0e0h	; 92ce

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_82: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x92d1..0x92de  (13 bytes)
DATA_actores_de_la_sala_82:
	defb 004h	; 92d1
	defb 030h,060h,030h	; 92d2
	defb 030h,050h,0d0h	; 92d5
	defb 030h,0b0h,080h	; 92d8
	defb 030h,0b0h,0e0h	; 92db

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_83: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x92de..0x92e5  (7 bytes)
DATA_actores_de_la_sala_83:
	defb 002h	; 92de
	defb 01ah,02ch,080h	; 92df
	defb 01ah,0b2h,080h	; 92e2

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_84: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x92e5..0x92f2  (13 bytes)
DATA_actores_de_la_sala_84:
	defb 004h	; 92e5
	defb 01eh,02ah,040h	; 92e6
	defb 01eh,070h,030h	; 92e9
	defb 005h,030h,0e0h	; 92ec
	defb 005h,070h,0a0h	; 92ef

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_85: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x92f2..0x92f6  (4 bytes)
DATA_actores_de_la_sala_85:
	defb 001h	; 92f2
	defb 004h,070h,060h	; 92f3

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_86: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x92f6..0x9300  (10 bytes)
DATA_actores_de_la_sala_86:
	defb 003h	; 92f6
	defb 030h,068h,0d0h	; 92f7
	defb 004h,040h,030h	; 92fa
	defb 004h,0abh,058h	; 92fd

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_87: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9300..0x930a  (10 bytes)
DATA_actores_de_la_sala_87:
	defb 003h	; 9300
	defb 030h,06ah,068h	; 9301
	defb 030h,038h,0d0h	; 9304
	defb 030h,0a0h,0d0h	; 9307

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_88: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x930a..0x9314  (10 bytes)
DATA_actores_de_la_sala_88:
	defb 003h	; 930a
	defb 00dh,030h,060h	; 930b
	defb 00dh,030h,098h	; 930e
	defb 00dh,030h,0c0h	; 9311

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_89: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9314..0x9318  (4 bytes)
DATA_actores_de_la_sala_89:
	defb 001h	; 9314
	defb 014h,0a0h,07ch	; 9315

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_90: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9318..0x9322  (10 bytes)
DATA_actores_de_la_sala_90:
	defb 003h	; 9318
	defb 00dh,030h,040h	; 9319
	defb 00dh,030h,080h	; 931c
	defb 00dh,030h,0c0h	; 931f

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_91: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x9322..0x932f  (13 bytes)
DATA_actores_de_la_sala_91:
	defb 004h	; 9322
	defb 00dh,030h,048h	; 9323
	defb 00dh,07ah,048h	; 9326
	defb 00dh,030h,078h	; 9329
	defb 00dh,030h,0c0h	; 932c

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_92: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x932f..0x9333  (4 bytes)
DATA_actores_de_la_sala_92:
	defb 001h	; 932f
	defb 014h,050h,0b0h	; 9330

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_93: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9333..0x9337  (4 bytes)
DATA_actores_de_la_sala_93:
	defb 001h	; 9333
	defb 010h,050h,0c8h	; 9334

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_94: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x9337..0x9344  (13 bytes)
DATA_actores_de_la_sala_94:
	defb 004h	; 9337
	defb 008h,030h,060h	; 9338
	defb 008h,030h,0c0h	; 933b
	defb 008h,080h,030h	; 933e
	defb 008h,0b0h,080h	; 9341

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_95: [cuantos (nibble bajo)] y 9 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (28 bytes)
;   0x9344..0x9360  (28 bytes)
DATA_actores_de_la_sala_95:
	defb 009h	; 9344
	defb 024h,020h,070h	; 9345
	defb 025h,020h,070h	; 9348
	defb 025h,020h,070h	; 934b
	defb 025h,020h,070h	; 934e
	defb 025h,020h,070h	; 9351
	defb 025h,020h,070h	; 9354
	defb 025h,020h,070h	; 9357
	defb 025h,020h,070h	; 935a
	defb 025h,020h,070h	; 935d

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_96: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x9360..0x936d  (13 bytes)
DATA_actores_de_la_sala_96:
	defb 004h	; 9360
	defb 008h,040h,030h	; 9361
	defb 008h,020h,0c0h	; 9364
	defb 008h,0b0h,050h	; 9367
	defb 008h,080h,0d0h	; 936a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_97: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x936d..0x937a  (13 bytes)
DATA_actores_de_la_sala_97:
	defb 004h	; 936d
	defb 008h,030h,040h	; 936e
	defb 008h,070h,020h	; 9371
	defb 008h,040h,0e8h	; 9374
	defb 008h,098h,0b0h	; 9377

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_98: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x937a..0x9387  (13 bytes)
DATA_actores_de_la_sala_98:
	defb 004h	; 937a
	defb 008h,028h,060h	; 937b
	defb 008h,028h,0c0h	; 937e
	defb 008h,0a8h,040h	; 9381
	defb 008h,088h,0c0h	; 9384

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_100: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x9387..0x9394  (13 bytes)
DATA_actores_de_la_sala_100:
	defb 004h	; 9387
	defb 008h,050h,018h	; 9388
	defb 008h,020h,060h	; 938b
	defb 008h,070h,080h	; 938e
	defb 008h,0a0h,0d0h	; 9391

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_101: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x9394..0x93a1  (13 bytes)
DATA_actores_de_la_sala_101:
	defb 004h	; 9394
	defb 008h,028h,030h	; 9395
	defb 008h,090h,060h	; 9398
	defb 008h,058h,0a0h	; 939b
	defb 008h,0b0h,0e8h	; 939e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_102: [cuantos (nibble bajo)] y 6 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (19 bytes)
;   0x93a1..0x93b4  (19 bytes)
DATA_actores_de_la_sala_102:
	defb 006h	; 93a1
	defb 01fh,082h,0d1h	; 93a2
	defb 01fh,033h,086h	; 93a5
	defb 01fh,074h,095h	; 93a8
	defb 01fh,055h,054h	; 93ab
	defb 01fh,046h,073h	; 93ae
	defb 01fh,061h,022h	; 93b1

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_103: [cuantos (nibble bajo)] y 6 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (19 bytes)
;   0x93b4..0x93c7  (19 bytes)
DATA_actores_de_la_sala_103:
	defb 006h	; 93b4
	defb 01fh,061h,086h	; 93b5
	defb 01fh,092h,095h	; 93b8
	defb 01fh,033h,054h	; 93bb
	defb 01fh,074h,073h	; 93be
	defb 01fh,085h,022h	; 93c1
	defb 01fh,046h,0d1h	; 93c4

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_104: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x93c7..0x93d4  (13 bytes)
DATA_actores_de_la_sala_104:
	defb 004h	; 93c7
	defb 01ch,050h,010h	; 93c8
	defb 01ch,050h,050h	; 93cb
	defb 01ch,050h,090h	; 93ce
	defb 01ch,050h,0d0h	; 93d1

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_107: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x93d4..0x93e1  (13 bytes)
DATA_actores_de_la_sala_107:
	defb 004h	; 93d4
	defb 004h,040h,030h	; 93d5
	defb 004h,050h,0d0h	; 93d8
	defb 004h,0b0h,030h	; 93db
	defb 004h,0b0h,0d0h	; 93de

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_108: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x93e1..0x93eb  (10 bytes)
DATA_actores_de_la_sala_108:
	defb 003h	; 93e1
	defb 00bh,07ch,042h	; 93e2
	defb 00bh,06eh,09ah	; 93e5
	defb 00bh,0aeh,0dch	; 93e8

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_109: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x93eb..0x93f5  (10 bytes)
DATA_actores_de_la_sala_109:
	defb 003h	; 93eb
	defb 010h,050h,080h	; 93ec
	defb 010h,0a0h,040h	; 93ef
	defb 010h,0a0h,0a0h	; 93f2

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_110: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x93f5..0x93f9  (4 bytes)
DATA_actores_de_la_sala_110:
	defb 001h	; 93f5
	defb 02ch,010h,044h	; 93f6

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_111: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x93f9..0x9400  (7 bytes)
DATA_actores_de_la_sala_111:
	defb 002h	; 93f9
	defb 035h,018h,068h	; 93fa
	defb 035h,078h,0a8h	; 93fd

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_112: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9400..0x940a  (10 bytes)
DATA_actores_de_la_sala_112:
	defb 003h	; 9400
	defb 008h,030h,050h	; 9401
	defb 008h,070h,090h	; 9404
	defb 008h,0ach,040h	; 9407

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_113: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x940a..0x9411  (7 bytes)
DATA_actores_de_la_sala_113:
	defb 002h	; 940a
	defb 010h,070h,040h	; 940b
	defb 010h,088h,0c0h	; 940e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_114: [cuantos (nibble bajo)] y 11 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (34 bytes)
;   0x9411..0x9433  (34 bytes)
DATA_actores_de_la_sala_114:
	defb 00bh	; 9411
	defb 007h,028h,078h	; 9412
	defb 007h,038h,058h	; 9415
	defb 007h,048h,078h	; 9418
	defb 007h,048h,098h	; 941b
	defb 007h,058h,0a8h	; 941e
	defb 007h,068h,068h	; 9421
	defb 007h,088h,078h	; 9424
	defb 007h,098h,098h	; 9427
	defb 008h,068h,078h	; 942a
	defb 008h,030h,090h	; 942d
	defb 008h,0a8h,068h	; 9430

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_115: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9433..0x943a  (7 bytes)
DATA_actores_de_la_sala_115:
	defb 002h	; 9433
	defb 035h,010h,058h	; 9434
	defb 035h,010h,0c0h	; 9437

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_116: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x943a..0x943e  (4 bytes)
DATA_actores_de_la_sala_116:
	defb 001h	; 943a
	defb 02ch,010h,020h	; 943b

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_118: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x943e..0x9448  (10 bytes)
DATA_actores_de_la_sala_118:
	defb 003h	; 943e
	defb 011h,080h,080h	; 943f
	defb 035h,018h,058h	; 9442
	defb 035h,018h,0a8h	; 9445

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_119: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9448..0x944c  (4 bytes)
DATA_actores_de_la_sala_119:
	defb 001h	; 9448
	defb 020h,038h,030h	; 9449

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_120: [cuantos (nibble bajo)] y 9 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (28 bytes)
;   0x944c..0x9468  (28 bytes)
DATA_actores_de_la_sala_120:
	defb 009h	; 944c
	defb 007h,028h,038h	; 944d
	defb 007h,028h,088h	; 9450
	defb 007h,038h,0d8h	; 9453
	defb 007h,048h,0a8h	; 9456
	defb 007h,058h,068h	; 9459
	defb 007h,068h,028h	; 945c
	defb 007h,068h,088h	; 945f
	defb 007h,068h,0e8h	; 9462
	defb 007h,088h,038h	; 9465

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_123: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9468..0x9472  (10 bytes)
DATA_actores_de_la_sala_123:
	defb 003h	; 9468
	defb 010h,080h,030h	; 9469
	defb 010h,080h,080h	; 946c
	defb 010h,080h,0d0h	; 946f

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_124: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9472..0x9479  (7 bytes)
DATA_actores_de_la_sala_124:
	defb 002h	; 9472
	defb 010h,060h,040h	; 9473
	defb 010h,080h,0c0h	; 9476

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_127: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9479..0x947d  (4 bytes)
DATA_actores_de_la_sala_127:
	defb 001h	; 9479
	defb 00ah,070h,048h	; 947a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_131: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x947d..0x948a  (13 bytes)
DATA_actores_de_la_sala_131:
	defb 004h	; 947d
	defb 00ah,036h,046h	; 947e
	defb 00ah,036h,068h	; 9481
	defb 00ah,05ah,038h	; 9484
	defb 00ah,082h,066h	; 9487

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_132: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x948a..0x948e  (4 bytes)
DATA_actores_de_la_sala_132:
	defb 001h	; 948a
	defb 00ah,070h,048h	; 948b

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_138: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x948e..0x9492  (4 bytes)
DATA_actores_de_la_sala_138:
	defb 001h	; 948e
	defb 004h,058h,0b8h	; 948f

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_140: [cuantos (nibble bajo)] y 6 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (19 bytes)
;   0x9492..0x94a5  (19 bytes)
DATA_actores_de_la_sala_140:
	defb 006h	; 9492
	defb 030h,050h,038h	; 9493
	defb 040h,02dh,038h	; 9496
	defb 030h,050h,068h	; 9499
	defb 040h,02dh,068h	; 949c
	defb 030h,088h,058h	; 949f
	defb 040h,065h,058h	; 94a2

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_141: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x94a5..0x94a9  (4 bytes)
DATA_actores_de_la_sala_141:
	defb 001h	; 94a5
	defb 00fh,008h,080h	; 94a6

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_205: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x94a9..0x94b0  (7 bytes)
DATA_actores_de_la_sala_205:
	defb 002h	; 94a9
	defb 00fh,008h,080h	; 94aa
	defb 010h,060h,0a0h	; 94ad

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_150: [cuantos (nibble bajo)] y 4 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (13 bytes)
;   0x94b0..0x94bd  (13 bytes)
DATA_actores_de_la_sala_150:
	defb 004h	; 94b0
	defb 039h,096h,018h	; 94b1
	defb 039h,03ah,050h	; 94b4
	defb 039h,03ah,090h	; 94b7
	defb 039h,096h,0c8h	; 94ba

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_154: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x94bd..0x94c1  (4 bytes)
DATA_actores_de_la_sala_154:
	defb 001h	; 94bd
	defb 00ah,060h,050h	; 94be

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_164: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x94c1..0x94c5  (4 bytes)
DATA_actores_de_la_sala_164:
	defb 001h	; 94c1
	defb 033h,060h,080h	; 94c2

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_166: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x94c5..0x94cc  (7 bytes)
DATA_actores_de_la_sala_166:
	defb 002h	; 94c5
	defb 003h,060h,080h	; 94c6
	defb 010h,060h,0a0h	; 94c9

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_167: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x94cc..0x94d0  (4 bytes)
DATA_actores_de_la_sala_167:
	defb 001h	; 94cc
	defb 032h,060h,080h	; 94cd

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_178: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x94d0..0x94d4  (4 bytes)
DATA_actores_de_la_sala_178:
	defb 001h	; 94d0
	defb 004h,060h,098h	; 94d1

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_181: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x94d4..0x94db  (7 bytes)
DATA_actores_de_la_sala_181:
	defb 002h	; 94d4
	defb 00ah,066h,088h	; 94d5
	defb 00ah,032h,0bch	; 94d8

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_182: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x94db..0x94df  (4 bytes)
DATA_actores_de_la_sala_182:
	defb 001h	; 94db
	defb 034h,060h,080h	; 94dc

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_183: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x94df..0x94e6  (7 bytes)
DATA_actores_de_la_sala_183:
	defb 002h	; 94df
	defb 00bh,072h,050h	; 94e0
	defb 00bh,054h,0a1h	; 94e3

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_187: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x94e6..0x94ed  (7 bytes)
DATA_actores_de_la_sala_187:
	defb 002h	; 94e6
	defb 00ah,07ah,050h	; 94e7
	defb 00ah,062h,0beh	; 94ea

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_189: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x94ed..0x94f1  (4 bytes)
DATA_actores_de_la_sala_189:
	defb 001h	; 94ed
	defb 037h,060h,080h	; 94ee

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_193: [cuantos (nibble bajo)] y 5 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (16 bytes)
;   0x94f1..0x9501  (16 bytes)
DATA_actores_de_la_sala_193:
	defb 005h	; 94f1
	defb 029h,038h,080h	; 94f2
	defb 031h,030h,068h	; 94f5
	defb 031h,030h,098h	; 94f8
	defb 031h,054h,080h	; 94fb
	defb 010h,078h,080h	; 94fe

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_207: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9501..0x9508  (7 bytes)
DATA_actores_de_la_sala_207:
	defb 002h	; 9501
	defb 019h,03eh,04fh	; 9502
	defb 019h,076h,088h	; 9505

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_198: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x9508..0x950c  (4 bytes)
DATA_actores_de_la_sala_198:
	defb 001h	; 9508
	defb 031h,060h,080h	; 9509

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_201: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x950c..0x9510  (4 bytes)
DATA_actores_de_la_sala_201:
	defb 001h	; 950c
	defb 010h,060h,0a0h	; 950d

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_206: [cuantos (nibble bajo)] y 2 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (7 bytes)
;   0x9510..0x9517  (7 bytes)
DATA_actores_de_la_sala_206:
	defb 002h	; 9510
	defb 00dh,090h,050h	; 9511
	defb 00dh,090h,0b0h	; 9514

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_208: [cuantos (nibble bajo)] y 6 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (19 bytes)
;   0x9517..0x952a  (19 bytes)
DATA_actores_de_la_sala_208:
	defb 006h	; 9517
	defb 01fh,028h,0b0h	; 9518
	defb 01fh,070h,098h	; 951b
	defb 01fh,030h,060h	; 951e
	defb 01fh,085h,063h	; 9521
	defb 01fh,060h,090h	; 9524
	defb 01fh,074h,031h	; 9527

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_209: [cuantos (nibble bajo)] y 6 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (19 bytes)
;   0x952a..0x953d  (19 bytes)
DATA_actores_de_la_sala_209:
	defb 006h	; 952a
	defb 01fh,09eh,030h	; 952b
	defb 01fh,05ch,0cch	; 952e
	defb 01fh,056h,03ah	; 9531
	defb 01fh,080h,098h	; 9534
	defb 01fh,03ah,09ch	; 9537
	defb 01fh,040h,062h	; 953a

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_216: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x953d..0x9547  (10 bytes)
DATA_actores_de_la_sala_216:
	defb 003h	; 953d
	defb 00bh,04ch,072h	; 953e
	defb 00bh,07ah,056h	; 9541
	defb 00bh,04ah,0c8h	; 9544

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_220: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9547..0x9551  (10 bytes)
DATA_actores_de_la_sala_220:
	defb 003h	; 9547
	defb 010h,080h,040h	; 9548
	defb 010h,040h,080h	; 954b
	defb 010h,080h,0c0h	; 954e

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_221: [cuantos (nibble bajo)] y 3 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (10 bytes)
;   0x9551..0x955b  (10 bytes)
DATA_actores_de_la_sala_221:
	defb 003h	; 9551
	defb 010h,060h,030h	; 9552
	defb 010h,080h,080h	; 9555
	defb 010h,040h,0d0h	; 9558

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_129: [cuantos (nibble bajo)] y 1 ternas
;   [tipo][x][y]: p00:5660 crea un actor por terna (L_569A); lo leen p00:5660
;   (4 bytes)
;   0x955b..0x955f  (4 bytes)
DATA_actores_de_la_sala_129:
	defb 001h	; 955b
	defb 031h,060h,080h	; 955c

; ----------------------------------------------------------------------
; DATOS actores_de_la_sala_0: [cuantos (nibble bajo)] y 0 ternas [tipo][x][y]:
;   p00:5660 crea un actor por terna (L_569A); lo leen p00:5660 (1 bytes)
;   0x955f..0x9560  (1 bytes)
DATA_actores_de_la_sala_0:
	defb 000h	; 955f

; ----------------------------------------------------------------------
; DATOS indice_de_actores_por_sala: 222 punteros, salas 0-0xDD (p00:564C ->
;   L_42B4), a la lista de actores de esa sala; lo leen p00:564C (444 bytes)
;   0x9560..0x971c  (444 bytes)
DATA_indice_de_actores_por_sala:
	defw 0955fh,0907eh,09088h,0908fh,09099h,090a0h,090a4h,090abh	; 9560
	defw 0955fh,090b2h,090d7h,090e1h,090eeh,090f5h,090fch,09106h	; 9570
	defw 0910dh,09111h,0911eh,0912eh,09135h,09139h,0913dh,09144h	; 9580
	defw 0914eh,0914eh,09152h,09156h,0915dh,09164h,09171h,09178h	; 9590
	defw 0917fh,09183h,0918ah,09191h,0919bh,091a5h,091a9h,091b0h	; 95a0
	defw 091bdh,0955fh,0955fh,091c1h,091c8h,091cch,091e8h,09204h	; 95b0
	defw 0920bh,0920fh,09219h,0921dh,09221h,0955fh,0955fh,09228h	; 95c0
	defw 0922fh,0923ch,09240h,09255h,09247h,0924eh,09255h,0924eh	; 95d0
	defw 09259h,09275h,09275h,09279h,0955fh,0927dh,0928ah,09291h	; 95e0
	defw 0914eh,0955fh,09295h,0955fh,0929fh,092a3h,0955fh,092adh	; 95f0
	defw 092bah,092c4h,092d1h,092deh,092e5h,092f2h,092f6h,09300h	; 9600
	defw 0930ah,09314h,09318h,09322h,0932fh,09333h,09337h,09344h	; 9610
	defw 09360h,0936dh,0937ah,0955fh,09387h,09394h,093a1h,093b4h	; 9620
	defw 093c7h,0955fh,0955fh,093d4h,093e1h,093ebh,093f5h,093f9h	; 9630
	defw 09400h,0940ah,09411h,09433h,0943ah,0955fh,0943eh,09448h	; 9640
	defw 0944ch,0955fh,0955fh,09468h,09472h,0955fh,0955fh,09479h	; 9650
	defw 0955fh,0955bh,0955fh,0947dh,0948ah,0955fh,0955bh,0955fh	; 9660
	defw 0955bh,0955fh,0948eh,0955fh,09492h,094a5h,0955fh,0955fh	; 9670
	defw 0955bh,0955bh,0955bh,0955fh,0955bh,0955fh,094b0h,0955fh	; 9680
	defw 0955bh,094a5h,094bdh,0955fh,0955fh,0955fh,0955fh,0955bh	; 9690
	defw 0955fh,0955bh,0955fh,0955fh,094c1h,0955fh,094c5h,094cch	; 96a0
	defw 0955fh,0955fh,0955fh,0955fh,0955fh,0955fh,0955fh,0955fh	; 96b0
	defw 0955fh,0955fh,094d0h,0955fh,0955bh,094d4h,094dbh,094dfh	; 96c0
	defw 0955fh,0955fh,0955bh,094e6h,0955fh,094edh,0955bh,094a5h	; 96d0
	defw 0955fh,094f1h,0955bh,0955bh,0955fh,0955fh,09508h,0955fh	; 96e0
	defw 0955fh,0950ch,0955bh,0955bh,0955fh,094a9h,09510h,09501h	; 96f0
	defw 09517h,0952ah,0955fh,0955fh,0955fh,0955fh,0955fh,0955fh	; 9700
	defw 0953dh,0955fh,0955fh,0955fh,09547h,09551h	; 9710

; ----------------------------------------------------------------------
; DATOS sprites_por_tipo_de_actor: un byte por tipo de actor (1-62): cuantos
;   sprites lleva, que p00:56CA pone en (ix+0x20); el byte del tipo 0 es el
;   alto del ultimo puntero de 0x9560; lo leen p00:56CA (62 bytes)
;   0x971c..0x975a  (62 bytes)
DATA_sprites_por_tipo_de_actor:
	defb 000h,002h,000h,004h,004h,002h,002h,002h,012h,004h,004h,004h,004h,004h,012h,000h	; 971c  ................
	defb 008h,012h,004h,006h,006h,006h,002h,004h,004h,008h,004h,004h,000h,004h,002h,004h	; 972c  ................
	defb 004h,004h,000h,004h,002h,008h,000h,000h,004h,008h,004h,000h,004h,000h,002h,004h	; 973c  ................
	defb 004h,004h,004h,004h,002h,00ah,004h,004h,004h,002h,002h,001h,002h,001h	; 974c  ..............

; ----------------------------------------------------------------------
; DATOS indice_de_colores_por_tipo: 65 punteros, uno por tipo de actor, a sus
;   colores de sprite (p00:467D lee 0x975A + 2 x tipo; p00:5745 por p00:57EC);
;   lo leen p00:467D, p00:5745 (130 bytes)
;   0x975a..0x97dc  (130 bytes)
DATA_indice_de_colores_por_tipo:
	defw 00201h,09850h,097dch,09850h,097f0h,097f0h,097f0h,09844h	; 975a
	defw 09844h,097deh,097f0h,097f0h,0981eh,097f0h,097f0h,097f0h	; 976a
	defw 09850h,09844h,0982ah,09844h,09804h,09804h,09804h,0981eh	; 977a
	defw 097f0h,0980ch,09812h,0980eh,097f0h,09850h,097f0h,097f0h	; 978a
	defw 097f0h,097f0h,097f0h,09850h,097f0h,09844h,0983ch,09850h	; 979a
	defw 0982ah,09802h,09844h,0983ch,09850h,097f0h,09850h,0983ch	; 97aa
	defw 097f0h,097f0h,0981ah,09812h,09826h,097f0h,09844h,09822h	; 97ba
	defw 097f0h,097f0h,0984eh,0984eh,0984eh,0984eh,0984eh,0984eh	; 97ca
	defw 0980ah	; 97da  -> DATA_colores_980A

; ----------------------------------------------------------------------
; DATOS colores_97DC: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (2
;   bytes)
;   0x97dc..0x97de  (2 bytes)
DATA_colores_97DC:
	defb 00ch,00ch	; 97dc

; ----------------------------------------------------------------------
; DATOS colores_97DE: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F
;   (18 bytes)
;   0x97de..0x97f0  (18 bytes)
DATA_colores_97DE:
	defb 00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch	; 97de  .L.L.L.L.L.L.L.L
	defb 00bh,04ch	; 97ee

; ----------------------------------------------------------------------
; DATOS colores_97F0: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F
;   (18 bytes)
;   0x97f0..0x9802  (18 bytes)
DATA_colores_97F0:
	defb 002h,04dh,002h,04dh,002h,04dh,002h,04dh,002h,04dh,002h,04dh,002h,04dh,002h,04dh	; 97f0  .M.M.M.M.M.M.M.M
	defb 002h,04dh	; 9800

; ----------------------------------------------------------------------
; DATOS colores_9802: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (2
;   bytes)
;   0x9802..0x9804  (2 bytes)
DATA_colores_9802:
	defb 002h,04dh	; 9802

; ----------------------------------------------------------------------
; DATOS colores_9804: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (6
;   bytes)
;   0x9804..0x980a  (6 bytes)
DATA_colores_9804:
	defb 002h,04dh,002h,04dh,009h,009h	; 9804

; ----------------------------------------------------------------------
; DATOS colores_980A: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (2
;   bytes)
;   0x980a..0x980c  (2 bytes)
DATA_colores_980A:
	defb 00eh,000h	; 980a

; ----------------------------------------------------------------------
; DATOS colores_980C: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (2
;   bytes)
;   0x980c..0x980e  (2 bytes)
DATA_colores_980C:
	defb 00dh,00fh	; 980c

; ----------------------------------------------------------------------
; DATOS colores_980E: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (4
;   bytes)
;   0x980e..0x9812  (4 bytes)
DATA_colores_980E:
	defb 00dh,00fh,000h,000h	; 980e

; ----------------------------------------------------------------------
; DATOS colores_9812: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (8
;   bytes)
;   0x9812..0x981a  (8 bytes)
DATA_colores_9812:
	defb 002h,04dh,002h,04dh,00bh,04dh,00bh,04dh	; 9812  .M.M.M.M

; ----------------------------------------------------------------------
; DATOS colores_981A: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (4
;   bytes)
;   0x981a..0x981e  (4 bytes)
DATA_colores_981A:
	defb 00dh,04bh,00dh,04bh	; 981a

; ----------------------------------------------------------------------
; DATOS colores_981E: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (4
;   bytes)
;   0x981e..0x9822  (4 bytes)
DATA_colores_981E:
	defb 007h,04ah,007h,04ah	; 981e

; ----------------------------------------------------------------------
; DATOS colores_9822: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (4
;   bytes)
;   0x9822..0x9826  (4 bytes)
DATA_colores_9822:
	defb 00dh,04eh,00bh,04eh	; 9822

; ----------------------------------------------------------------------
; DATOS colores_9826: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (4
;   bytes)
;   0x9826..0x982a  (4 bytes)
DATA_colores_9826:
	defb 00dh,04eh,00eh,04bh	; 9826

; ----------------------------------------------------------------------
; DATOS colores_982A: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F
;   (18 bytes)
;   0x982a..0x983c  (18 bytes)
DATA_colores_982A:
	defb 00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch,00bh,04ch	; 982a  .L.L.L.L.L.L.L.L
	defb 00bh,04ch	; 983a

; ----------------------------------------------------------------------
; DATOS colores_983C: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (8
;   bytes)
;   0x983c..0x9844  (8 bytes)
DATA_colores_983C:
	defb 00eh,00eh,00eh,00eh,00eh,00eh,00eh,00eh	; 983c  ........

; ----------------------------------------------------------------------
; DATOS colores_9844: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F
;   (10 bytes)
;   0x9844..0x984e  (10 bytes)
DATA_colores_9844:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9844  ..........

; ----------------------------------------------------------------------
; DATOS colores_984E: los colores de los sprites de un tipo de actor, un byte
;   por sprite (p00:468F los pone en (ix+0x25) de 5 en 5); lo leen p00:468F (1
;   bytes)
;   0x984e..0x984f  (1 bytes)
DATA_colores_984E:
	defb 00eh	; 984e

; ----------------------------------------------------------------------
; DATOS byte_0d_por_tipo: 65 bytes, uno por tipo de actor, que p00:5754 guarda
;   en (ix+0x0D); lo leen p00:574E (65 bytes)
;   0x984f..0x9890  (65 bytes)
DATA_byte_0d_por_tipo:
	defb 00eh,0ffh,0ffh,0ffh,002h,002h,005h,0ffh,01eh,037h,002h,004h,002h,004h,004h,002h	; 984f  .........7......
	defb 0ffh,002h,028h,002h,002h,002h,002h,0ffh,002h,002h,028h,002h,002h,080h,002h,002h	; 985f  ..(.......(.....
	defb 028h,014h,014h,0ffh,01eh,0ffh,064h,0ffh,0ffh,014h,0f0h,014h,002h,002h,002h,002h	; 986f  (.....d.........
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,004h,002h,002h,002h,002h,002h,002h	; 987f  ................
	defb 002h	; 988f

; ----------------------------------------------------------------------
; DATOS indice_de_atributos_por_cuadro: 143 punteros, uno por cuadro
;   ((ix+0x0B)), a los atributos de sus sprites (p00:5518 -> L_42B4); lo leen
;   p00:5518 (286 bytes)
;   0x9890..0x99ae  (286 bytes)
DATA_indice_de_atributos_por_cuadro:
	defw 099aeh,099b3h,099b8h,099bdh,099c2h,099c7h,099cch,099d1h	; 9890
	defw 099d6h,099dbh,099e0h,099e5h,099eah,099eah,099eah,099eah	; 98a0
	defw 099eah,099edh,099f0h,099f0h,09a26h,09a2bh,09a30h,09a43h	; 98b0
	defw 09a56h,09a5bh,09a67h,09a6ch,09a6ch,09a6fh,09a72h,09a75h	; 98c0
	defw 09a78h,09a7dh,09a82h,09a87h,09a8ch,09a91h,09a96h,09a9bh	; 98d0
	defw 09aa0h,09aa5h,09aaah,09aafh,09ab4h,09ab9h,09abeh,09ac3h	; 98e0
	defw 09ac8h,09acdh,09ad2h,09ad7h,09adch,09ae1h,09ae7h,09afah	; 98f0
	defw 09b0dh,09b10h,09b13h,09b15h,09b17h,09b19h,09b19h,09b1eh	; 9900
	defw 09b23h,09b28h,09b2dh,09b32h,09b37h,09b3ch,09b41h,09b46h	; 9910
	defw 09b4bh,09b50h,09b55h,09b5ah,09b5fh,09b64h,09b69h,09b6eh	; 9920
	defw 09b73h,09b78h,09b7dh,09b82h,09b87h,09b8ch,09b93h,09b9ah	; 9930
	defw 09ba1h,09ba8h,09bafh,09bb6h,09bbdh,09bc4h,09bc9h,09bceh	; 9940
	defw 09bd3h,09bd8h,09bf6h,09bf9h,09bfch,09bffh,09c02h,09c05h	; 9950
	defw 09c08h,09c0bh,09c0eh,09c11h,09c14h,09c17h,09c17h,09c1ch	; 9960
	defw 09c21h,09c26h,09c32h,09c35h,09c3ah,09c3fh,09c4bh,09c4bh	; 9970
	defw 09c4dh,09c4fh,09c51h,09c5ch,09c67h,09c72h,09c72h,09c77h	; 9980
	defw 09c8ah,09c9dh,09cc0h,09cc9h,09cd2h,09cdbh,09ce4h,09cfch	; 9990
	defw 09d14h,09d2ch,09d3dh,09d52h,09d6ah,09d7fh,09d94h	; 99a0

; ----------------------------------------------------------------------
; DATOS atributos_por_cuadro: las listas de atributos de los actores, una por
;   cuadro: por sprite [y][x][patron] (p00:5526), o un byte 0x91-0xA5 que trae
;   un grupo de la tabla p00:556F (p00:5549); cuantos sprites lo dice
;   (ix+0x20), por eso no llevan cuenta; la ultima lista empieza en 0x9D94 y
;   acaba donde empiezan los caminos; lo leen p00:5526 (1267 bytes)
;   0x99ae..0x9ea1  (1267 bytes)
DATA_atributos_por_cuadro:
	defb 091h,070h,074h	; 99ae
	defb 090h,094h,092h	; 99b1
	defb 070h,074h,0d0h	; 99b4
	defb 0d4h,091h,060h	; 99b7
	defb 064h,080h,084h	; 99ba
	defb 092h,060h,064h	; 99bd
	defb 0c0h,0c4h,091h	; 99c0
	defb 068h,06ch,088h	; 99c3
	defb 08ch,092h,068h	; 99c6
	defb 06ch,0c8h,0cch	; 99c9
	defb 091h,078h,07ch	; 99cc
	defb 098h,09ch,092h	; 99cf
	defb 078h,07ch,0d8h	; 99d2
	defb 0dch,091h,070h	; 99d5
	defb 074h,0b0h,0b4h	; 99d8
	defb 091h,060h,064h	; 99db
	defb 0a0h,0a4h,091h	; 99de
	defb 068h,06ch,0a8h	; 99e1
	defb 0ach,091h,078h	; 99e4
	defb 07ch,0b8h,0bch	; 99e7
	defb 095h,050h,054h	; 99ea
	defb 095h,058h,05ch	; 99ed
	defb 0e8h,0e8h,060h	; 99f0
	defb 0e8h,0e8h,064h	; 99f3
	defb 0e8h,0f8h,068h	; 99f6
	defb 0e8h,0f8h,06ch	; 99f9
	defb 0e8h,008h,070h	; 99fc
	defb 0e8h,008h,074h	; 99ff
	defb 0f8h,0e8h,078h	; 9a02
	defb 0f8h,0e8h,07ch	; 9a05
	defb 0f8h,0f8h,080h	; 9a08
	defb 0f8h,0f8h,084h	; 9a0b
	defb 0f8h,008h,088h	; 9a0e
	defb 0f8h,008h,08ch	; 9a11
	defb 008h,0e8h,090h	; 9a14
	defb 008h,0e8h,094h	; 9a17
	defb 008h,0f8h,098h	; 9a1a
	defb 008h,0f8h,09ch	; 9a1d
	defb 008h,008h,0a0h	; 9a20
	defb 008h,008h,0a4h	; 9a23
	defb 095h,0e0h,0e4h	; 9a26
	defb 0e0h,0e4h,095h	; 9a29
	defb 0e8h,0ech,0e8h	; 9a2c
	defb 0ech,096h,060h	; 9a2f
	defb 064h,068h,06ch	; 9a32
	defb 070h,074h,078h	; 9a35
	defb 07ch,080h,084h	; 9a38
	defb 088h,08ch,090h	; 9a3b
	defb 094h,098h,09ch	; 9a3e
	defb 0a0h,0a4h,096h	; 9a41
	defb 060h,064h,068h	; 9a44
	defb 06ch,070h,074h	; 9a47
	defb 078h,07ch,080h	; 9a4a
	defb 084h,088h,08ch	; 9a4d
	defb 0a8h,0ach,098h	; 9a50
	defb 09ch,0b0h,0b4h	; 9a53
	defb 091h,060h,064h	; 9a56
	defb 068h,06ch,0e5h	; 9a59
	defb 0f9h,060h,0e5h	; 9a5c
	defb 0f9h,064h,0f5h	; 9a5f
	defb 0f8h,078h,0f5h	; 9a62
	defb 0f8h,07ch,091h	; 9a65
	defb 070h,074h,078h	; 9a68
	defb 07ch,095h,0e0h	; 9a6b
	defb 0e4h,095h,0e8h	; 9a6e
	defb 0ech,095h,0f0h	; 9a71
	defb 0f4h,095h,0f8h	; 9a74
	defb 0fch,09fh,0a0h	; 9a77
	defb 0a4h,0a8h,0ach	; 9a7a
	defb 09fh,0b0h,0b4h	; 9a7d
	defb 0b8h,0bch,09fh	; 9a80
	defb 060h,064h,068h	; 9a83
	defb 06ch,09fh,070h	; 9a86
	defb 074h,078h,07ch	; 9a89
	defb 0a0h,080h,084h	; 9a8c
	defb 088h,08ch,0a0h	; 9a8f
	defb 090h,094h,098h	; 9a92
	defb 09ch,0a0h,0c0h	; 9a95
	defb 0c4h,0c8h,0cch	; 9a98
	defb 0a0h,0d0h,0d4h	; 9a9b
	defb 0d8h,0dch,093h	; 9a9e
	defb 060h,064h,078h	; 9aa1
	defb 07ch,094h,060h	; 9aa4
	defb 064h,088h,08ch	; 9aa7
	defb 093h,068h,06ch	; 9aaa
	defb 078h,07ch,094h	; 9aad
	defb 068h,06ch,088h	; 9ab0
	defb 08ch,093h,070h	; 9ab3
	defb 074h,078h,07ch	; 9ab6
	defb 093h,070h,074h	; 9ab9
	defb 088h,08ch,093h	; 9abc
	defb 060h,064h,080h	; 9abf
	defb 084h,093h,068h	; 9ac2
	defb 06ch,080h,084h	; 9ac5
	defb 093h,070h,074h	; 9ac8
	defb 080h,084h,0a5h	; 9acb
	defb 060h,064h,070h	; 9ace
	defb 074h,0a5h,068h	; 9ad1
	defb 06ch,070h,074h	; 9ad4
	defb 0a5h,060h,064h	; 9ad7
	defb 070h,074h,0a5h	; 9ada
	defb 060h,064h,078h	; 9add
	defb 07ch,0f8h,0f0h	; 9ae0
	defb 0f4h,0f8h,000h	; 9ae3
	defb 0f8h,097h,0d0h	; 9ae6
	defb 0d4h,0d8h,0dch	; 9ae9
	defb 0d8h,0dch,0d8h	; 9aec
	defb 0dch,0d8h,0dch	; 9aef
	defb 0d8h,0dch,0d8h	; 9af2
	defb 0dch,0d8h,0dch	; 9af5
	defb 0e0h,0e4h,097h	; 9af8
	defb 0e8h,0ech,0f0h	; 9afb
	defb 0f4h,0f0h,0f4h	; 9afe
	defb 0f0h,0f4h,0f0h	; 9b01
	defb 0f4h,0f0h,0f4h	; 9b04
	defb 0f0h,0f4h,0f0h	; 9b07
	defb 0f4h,0f8h,0fch	; 9b0a
	defb 095h,0e0h,0e4h	; 9b0d
	defb 095h,0e8h,0ech	; 9b10
	defb 0a4h,0e0h,0a4h	; 9b13
	defb 0e4h,0a4h,0e8h	; 9b16
	defb 091h,0d0h,0d4h	; 9b19
	defb 0e0h,0e4h,091h	; 9b1c
	defb 0d8h,0dch,0e0h	; 9b1f
	defb 0e4h,091h,0e8h	; 9b22
	defb 0ech,0f0h,0f4h	; 9b25
	defb 098h,070h,074h	; 9b28
	defb 090h,094h,098h	; 9b2b
	defb 070h,074h,0b0h	; 9b2e
	defb 0b4h,098h,060h	; 9b31
	defb 064h,080h,084h	; 9b34
	defb 098h,060h,064h	; 9b37
	defb 0a0h,0a4h,098h	; 9b3a
	defb 068h,06ch,088h	; 9b3d
	defb 08ch,098h,068h	; 9b40
	defb 06ch,0a8h,0ach	; 9b43
	defb 098h,078h,07ch	; 9b46
	defb 098h,09ch,098h	; 9b49
	defb 078h,07ch,0b8h	; 9b4c
	defb 0bch,0a1h,070h	; 9b4f
	defb 074h,070h,074h	; 9b52
	defb 0a2h,070h,074h	; 9b55
	defb 070h,074h,0a1h	; 9b58
	defb 060h,064h,060h	; 9b5b
	defb 064h,0a2h,060h	; 9b5e
	defb 064h,060h,064h	; 9b61
	defb 0a1h,068h,06ch	; 9b64
	defb 068h,06ch,0a2h	; 9b67
	defb 068h,06ch,068h	; 9b6a
	defb 06ch,0a1h,078h	; 9b6d
	defb 07ch,078h,07ch	; 9b70
	defb 0a2h,078h,07ch	; 9b73
	defb 078h,07ch,0a2h	; 9b76
	defb 070h,074h,070h	; 9b79
	defb 074h,0a2h,060h	; 9b7c
	defb 064h,060h,064h	; 9b7f
	defb 0a2h,068h,06ch	; 9b82
	defb 068h,06ch,0a2h	; 9b85
	defb 078h,07ch,078h	; 9b88
	defb 07ch,09bh,070h	; 9b8b
	defb 074h,090h,094h	; 9b8e
	defb 0e0h,0e0h,09bh	; 9b91
	defb 060h,064h,080h	; 9b94
	defb 084h,0e0h,0e0h	; 9b97
	defb 09bh,068h,06ch	; 9b9a
	defb 088h,08ch,0e0h	; 9b9d
	defb 0e0h,09bh,078h	; 9ba0
	defb 07ch,098h,09ch	; 9ba3
	defb 0e0h,0e0h,09ch	; 9ba6
	defb 070h,074h,090h	; 9ba9
	defb 094h,0e0h,0e0h	; 9bac
	defb 09ch,060h,064h	; 9baf
	defb 080h,084h,0e0h	; 9bb2
	defb 0e0h,09ch,068h	; 9bb5
	defb 06ch,088h,08ch	; 9bb8
	defb 0e0h,0e0h,09ch	; 9bbb
	defb 078h,07ch,098h	; 9bbe
	defb 09ch,0e0h,0e0h	; 9bc1
	defb 091h,060h,064h	; 9bc4
	defb 068h,06ch,09ah	; 9bc7
	defb 070h,074h,078h	; 9bca
	defb 07ch,09ah,080h	; 9bcd
	defb 084h,088h,08ch	; 9bd0
	defb 09ah,090h,094h	; 9bd3
	defb 098h,09ch,008h	; 9bd6
	defb 0f8h,0dch,018h	; 9bd9
	defb 0f8h,0dch,028h	; 9bdc
	defb 0f8h,0dch,038h	; 9bdf
	defb 0f8h,0dch,048h	; 9be2
	defb 0f8h,0dch,058h	; 9be5
	defb 0f8h,0dch,068h	; 9be8
	defb 0f8h,0dch,078h	; 9beb
	defb 0f8h,0dch,088h	; 9bee
	defb 0f8h,0dch,08fh	; 9bf1
	defb 0f8h,0dch,095h	; 9bf4
	defb 060h,064h,095h	; 9bf7
	defb 068h,06ch,095h	; 9bfa
	defb 090h,094h,095h	; 9bfd
	defb 098h,09ch,095h	; 9c00
	defb 070h,074h,095h	; 9c03
	defb 078h,07ch,095h	; 9c06
	defb 080h,084h,095h	; 9c09
	defb 088h,08ch,095h	; 9c0c
	defb 038h,03ch,095h	; 9c0f
	defb 040h,044h,095h	; 9c12
	defb 048h,04ch,095h	; 9c15
	defb 0a0h,0a0h,0a0h	; 9c18
	defb 0a0h,095h,0a4h	; 9c1b
	defb 0a4h,0a4h,0a4h	; 9c1e
	defb 095h,0a8h,0a8h	; 9c21
	defb 0a8h,0a8h,0f0h	; 9c24
	defb 0f0h,0ach,0f0h	; 9c27
	defb 000h,0b0h,000h	; 9c2a
	defb 0f0h,0b4h,000h	; 9c2d
	defb 000h,0b8h,095h	; 9c30
	defb 050h,050h,095h	; 9c33
	defb 0e0h,0e4h,0e0h	; 9c36
	defb 0e4h,095h,0e8h	; 9c39
	defb 0ech,0e8h,0ech	; 9c3c
	defb 0f0h,0f0h,0f0h	; 9c3f
	defb 0f0h,000h,0f4h	; 9c42
	defb 000h,0f0h,0f8h	; 9c45
	defb 000h,000h,0fch	; 9c48
	defb 095h,050h,095h	; 9c4b
	defb 054h,095h,058h	; 9c4e
	defb 0e8h,0f8h,038h	; 9c51
	defb 0e8h,0f8h,03ch	; 9c54
	defb 09dh,000h,000h	; 9c57
	defb 000h,000h,0e8h	; 9c5a
	defb 0f8h,040h,0e8h	; 9c5d
	defb 0f8h,044h,09dh	; 9c60
	defb 000h,000h,000h	; 9c63
	defb 000h,0e8h,0f8h	; 9c66
	defb 048h,0e8h,0f8h	; 9c69
	defb 04ch,09dh,000h	; 9c6c
	defb 000h,000h,000h	; 9c6f
	defb 095h,054h,058h	; 9c72
	defb 054h,058h,09eh	; 9c75
	defb 0e0h,0e4h,038h	; 9c78
	defb 03ch,038h,03ch	; 9c7b
	defb 000h,000h,000h	; 9c7e
	defb 000h,000h,000h	; 9c81
	defb 000h,000h,000h	; 9c84
	defb 000h,000h,000h	; 9c87
	defb 09eh,0e8h,0ech	; 9c8a
	defb 040h,044h,040h	; 9c8d
	defb 044h,000h,000h	; 9c90
	defb 000h,000h,000h	; 9c93
	defb 000h,000h,000h	; 9c96
	defb 000h,000h,000h	; 9c99
	defb 000h,0d8h,0e8h	; 9c9c
	defb 0f0h,0d8h,0f8h	; 9c9f
	defb 0f4h,0e8h,0e8h	; 9ca2
	defb 0f8h,0e8h,0f8h	; 9ca5
	defb 0fch,0d0h,0f8h	; 9ca8
	defb 048h,0d0h,0f8h	; 9cab
	defb 04ch,0f0h,000h	; 9cae
	defb 048h,0f0h,000h	; 9cb1
	defb 04ch,09dh,000h	; 9cb4
	defb 000h,000h,000h	; 9cb7
	defb 000h,000h,000h	; 9cba
	defb 000h,000h,000h	; 9cbd
	defb 099h,078h,07ch	; 9cc0
	defb 080h,084h,088h	; 9cc3
	defb 08ch,090h,094h	; 9cc6
	defb 099h,0a8h,0ach	; 9cc9
	defb 0b0h,0b4h,098h	; 9ccc
	defb 09ch,0a0h,0a4h	; 9ccf
	defb 099h,038h,03ch	; 9cd2
	defb 040h,044h,048h	; 9cd5
	defb 04ch,050h,054h	; 9cd8
	defb 099h,068h,06ch	; 9cdb
	defb 070h,074h,058h	; 9cde
	defb 05ch,060h,064h	; 9ce1
	defb 0b0h,0c0h,060h	; 9ce4
	defb 0b0h,0d0h,064h	; 9ce7
	defb 0c0h,0c0h,068h	; 9cea
	defb 0c0h,0d0h,06ch	; 9ced
	defb 0b0h,020h,090h	; 9cf0
	defb 0b0h,030h,094h	; 9cf3
	defb 0c0h,020h,098h	; 9cf6
	defb 0c0h,030h,09ch	; 9cf9
	defb 0d0h,0d0h,070h	; 9cfc
	defb 0d0h,0e0h,074h	; 9cff
	defb 0e0h,0d0h,078h	; 9d02
	defb 0e0h,0e0h,07ch	; 9d05
	defb 0d0h,0d0h,070h	; 9d08
	defb 0d0h,0e0h,074h	; 9d0b
	defb 0e0h,0d0h,078h	; 9d0e
	defb 0e0h,0e0h,07ch	; 9d11
	defb 0d0h,010h,080h	; 9d14
	defb 0d0h,020h,084h	; 9d17
	defb 0e0h,010h,088h	; 9d1a
	defb 0e0h,020h,08ch	; 9d1d
	defb 0d0h,010h,080h	; 9d20
	defb 0d0h,020h,084h	; 9d23
	defb 0e0h,010h,088h	; 9d26
	defb 0e0h,020h,08ch	; 9d29
	defb 0d0h,0f8h,038h	; 9d2c
	defb 0d0h,0f8h,03ch	; 9d2f
	defb 0f0h,000h,038h	; 9d32
	defb 0f0h,000h,03ch	; 9d35
	defb 09dh,000h,000h	; 9d38
	defb 000h,000h,0d0h	; 9d3b
	defb 0f8h,040h,0d0h	; 9d3e
	defb 0f8h,044h,0f0h	; 9d41
	defb 000h,040h,0f0h	; 9d44
	defb 000h,044h,0e0h	; 9d47
	defb 0f0h,038h,0e0h	; 9d4a
	defb 0f0h,03ch,09dh	; 9d4d
	defb 000h,000h,0d0h	; 9d50
	defb 0f8h,048h,0d0h	; 9d53
	defb 0f8h,04ch,0f0h	; 9d56
	defb 000h,048h,0f0h	; 9d59
	defb 000h,04ch,0e0h	; 9d5c
	defb 0f0h,040h,0e0h	; 9d5f
	defb 0f0h,044h,0c8h	; 9d62
	defb 000h,060h,0c8h	; 9d65
	defb 000h,064h,0e0h	; 9d68
	defb 0f0h,048h,0e0h	; 9d6b
	defb 0f0h,04ch,0c8h	; 9d6e
	defb 000h,068h,0c8h	; 9d71
	defb 000h,06ch,0e0h	; 9d74
	defb 0f8h,060h,0e0h	; 9d77
	defb 0f8h,064h,09dh	; 9d7a
	defb 000h,000h,0c0h	; 9d7d
	defb 0f8h,070h,0c0h	; 9d80
	defb 008h,074h,0d0h	; 9d83
	defb 0f8h,078h,0d0h	; 9d86
	defb 008h,07ch,0e0h	; 9d89
	defb 0f8h,068h,0e0h	; 9d8c
	defb 0f8h,06ch,09dh	; 9d8f
	defb 000h,000h,0d8h	; 9d92
	defb 0f0h,070h,0d8h	; 9d95
	defb 000h,074h,0e8h	; 9d98
	defb 0f0h,078h,0e8h	; 9d9b
	defb 000h,07ch,09dh	; 9d9e
	defb 000h,000h,000h	; 9da1
	defb 000h,0e5h,0f8h	; 9da4
	defb 0e5h,0f8h,0f5h	; 9da7
	defb 0f8h,0f5h,0f8h	; 9daa
	defb 0e6h,0f8h,0e6h	; 9dad
	defb 0f8h,0f5h,0f8h	; 9db0
	defb 0f5h,0f8h,0f5h	; 9db3
	defb 0f8h,0f5h,0f8h	; 9db6
	defb 004h,0f8h,004h	; 9db9
	defb 0f8h,0f6h,0f8h	; 9dbc
	defb 0f6h,0f8h,004h	; 9dbf
	defb 0f8h,004h,0f8h	; 9dc2
	defb 0f8h,0f8h,0f8h	; 9dc5
	defb 0f8h,0f8h,0f8h	; 9dc8
	defb 0f8h,0f8h,0d0h	; 9dcb
	defb 0e8h,0d0h,0e8h	; 9dce
	defb 0d0h,0f8h,0d0h	; 9dd1
	defb 0f8h,0d0h,008h	; 9dd4
	defb 0d0h,008h,0e0h	; 9dd7
	defb 0e8h,0e0h,0e8h	; 9dda
	defb 0e0h,0f8h,0e0h	; 9ddd
	defb 0f8h,0e0h,008h	; 9de0
	defb 0e0h,008h,0f0h	; 9de3
	defb 0e8h,0f0h,0e8h	; 9de6
	defb 0f0h,0f8h,0f0h	; 9de9
	defb 0f8h,0f0h,008h	; 9dec
	defb 0f0h,008h,000h	; 9def
	defb 0f8h,000h,0f8h	; 9df2
	defb 010h,0f8h,010h	; 9df5
	defb 0f8h,020h,0f8h	; 9df8
	defb 020h,0f8h,030h	; 9dfb
	defb 0f8h,030h,0f8h	; 9dfe
	defb 040h,0f8h,040h	; 9e01
	defb 0f8h,050h,0f8h	; 9e04
	defb 050h,0f8h,060h	; 9e07
	defb 0f8h,060h,0f8h	; 9e0a
	defb 070h,0f8h,070h	; 9e0d
	defb 0f8h,080h,0f8h	; 9e10
	defb 080h,0f8h,0e0h	; 9e13
	defb 0f9h,0e0h,0f9h	; 9e16
	defb 0f0h,0f8h,0f0h	; 9e19
	defb 0f8h,0e0h,0f0h	; 9e1c
	defb 0e0h,0f0h,0e0h	; 9e1f
	defb 000h,0e0h,000h	; 9e22
	defb 0f0h,0f0h,0f0h	; 9e25
	defb 0f0h,0f0h,000h	; 9e28
	defb 0f0h,000h,0e0h	; 9e2b
	defb 0f8h,0e0h,0f8h	; 9e2e
	defb 0f0h,0f8h,0f0h	; 9e31
	defb 0f8h,0e1h,0f8h	; 9e34
	defb 0e1h,0f8h,0f0h	; 9e37
	defb 0f8h,0f0h,0f8h	; 9e3a
	defb 000h,0f8h,000h	; 9e3d
	defb 0f8h,0e0h,0f8h	; 9e40
	defb 0e0h,0f8h,0f0h	; 9e43
	defb 0f8h,0f0h,0f8h	; 9e46
	defb 01eh,0f8h,01eh	; 9e49
	defb 0f8h,0e0h,0f0h	; 9e4c
	defb 0e0h,0f0h,0d0h	; 9e4f
	defb 0f8h,0d0h,0f8h	; 9e52
	defb 0f0h,000h,0f0h	; 9e55
	defb 000h,0e1h,000h	; 9e58
	defb 0e1h,000h,0e1h	; 9e5b
	defb 000h,0e1h,000h	; 9e5e
	defb 0e1h,000h,0e1h	; 9e61
	defb 000h,0e1h,000h	; 9e64
	defb 0e1h,000h,0e1h	; 9e67
	defb 000h,0e1h,000h	; 9e6a
	defb 0e1h,000h,0e1h	; 9e6d
	defb 000h,0f0h,0f8h	; 9e70
	defb 0f0h,0f8h,000h	; 9e73
	defb 0f8h,000h,0f8h	; 9e76
	defb 0f8h,0f0h,0f8h	; 9e79
	defb 0f0h,0f8h,000h	; 9e7c
	defb 0f8h,000h,0f0h	; 9e7f
	defb 0f8h,0f0h,0f8h	; 9e82
	defb 0f0h,0f8h,0f0h	; 9e85
	defb 0f8h,0f1h,0f8h	; 9e88
	defb 0f1h,0f8h,0f1h	; 9e8b
	defb 0f8h,0f1h,0f8h	; 9e8e
	defb 0f8h,0f0h,0f8h	; 9e91
	defb 0f0h,0f8h,0f0h	; 9e94
	defb 0f8h,0f0h,0e0h	; 9e97
	defb 0f8h,0e0h,0f8h	; 9e9a
	defb 0f0h,0f8h,0f0h	; 9e9d
	defb 0f8h	; 9ea0

; ----------------------------------------------------------------------
; DATOS camino_9EA1: el camino del actor 1 de la sala 0: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9ea1..0x9ea6  (5 bytes)
DATA_camino_9EA1:
	defb 002h,0b0h	; 9ea1
	defb 0c8h,0b0h	; 9ea3
	defb 038h	; 9ea5

; ----------------------------------------------------------------------
; DATOS camino_9EA6: el camino del actor 2 de la sala 0: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (17 bytes)
;   0x9ea6..0x9eb7  (17 bytes)
DATA_camino_9EA6:
	defb 008h,050h	; 9ea6
	defb 038h,074h	; 9ea8
	defb 038h,074h	; 9eaa
	defb 0c8h,050h	; 9eac
	defb 0c8h,050h	; 9eae
	defb 0a8h,068h	; 9eb0
	defb 0a8h,068h	; 9eb2
	defb 058h,050h	; 9eb4
	defb 058h	; 9eb6

; ----------------------------------------------------------------------
; DATOS camino_9EB7: el camino del actor 3 de la sala 0: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9eb7..0x9ebc  (5 bytes)
DATA_camino_9EB7:
	defb 002h,018h	; 9eb7
	defb 038h,018h	; 9eb9
	defb 0c8h	; 9ebb

; ----------------------------------------------------------------------
; DATOS camino_9EBC: el camino del actor 1 de la sala 2: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (7 bytes)
;   0x9ebc..0x9ec3  (7 bytes)
DATA_camino_9EBC:
	defb 003h,030h	; 9ebc
	defb 048h,030h	; 9ebe
	defb 088h,030h	; 9ec0
	defb 0a8h	; 9ec2

; ----------------------------------------------------------------------
; DATOS camino_9EC3: el camino del actor 2 de la sala 2: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9ec3..0x9ec8  (5 bytes)
DATA_camino_9EC3:
	defb 002h,070h	; 9ec3
	defb 058h,070h	; 9ec5
	defb 0a8h	; 9ec7

; ----------------------------------------------------------------------
; DATOS camino_9EC8: el camino del actor 1 de la sala 3: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9ec8..0x9ed1  (9 bytes)
DATA_camino_9EC8:
	defb 004h,038h	; 9ec8
	defb 088h,038h	; 9eca
	defb 038h,088h	; 9ecc
	defb 038h,088h	; 9ece
	defb 088h	; 9ed0

; ----------------------------------------------------------------------
; DATOS camino_9ED1: el camino del actor 2 de la sala 3: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9ed1..0x9eda  (9 bytes)
DATA_camino_9ED1:
	defb 004h,038h	; 9ed1
	defb 098h,038h	; 9ed3
	defb 0e8h,088h	; 9ed5
	defb 0e8h,088h	; 9ed7
	defb 098h	; 9ed9

; ----------------------------------------------------------------------
; DATOS camino_9EDA: el camino del actor 3 de la sala 3 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (11 bytes)
;   0x9eda..0x9ee5  (11 bytes)
DATA_camino_9EDA:
	defb 005h,088h	; 9eda
	defb 070h,088h	; 9edc
	defb 088h,038h	; 9ede
	defb 088h,038h	; 9ee0
	defb 058h,088h	; 9ee2
	defb 058h	; 9ee4

; ----------------------------------------------------------------------
; DATOS camino_9EE5: el camino del actor 1 de la sala 6: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9ee5..0x9eea  (5 bytes)
DATA_camino_9EE5:
	defb 002h,088h	; 9ee5
	defb 050h,0a8h	; 9ee7
	defb 050h	; 9ee9

; ----------------------------------------------------------------------
; DATOS camino_9EEA: el camino del actor 2 de la sala 6: [byte para (ix+0x13)]
;   y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (21 bytes)
;   0x9eea..0x9eff  (21 bytes)
DATA_camino_9EEA:
	defb 00ah,088h	; 9eea
	defb 070h,0b0h	; 9eec
	defb 070h,0b0h	; 9eee
	defb 090h,030h	; 9ef0
	defb 090h,030h	; 9ef2
	defb 030h,050h	; 9ef4
	defb 030h,030h	; 9ef6
	defb 030h,030h	; 9ef8
	defb 090h,098h	; 9efa
	defb 090h,098h	; 9efc
	defb 070h	; 9efe

; ----------------------------------------------------------------------
; DATOS camino_9EFF: el camino del actor 5 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (13 bytes)
;   0x9eff..0x9f0c  (13 bytes)
DATA_camino_9EFF:
	defb 006h,060h	; 9eff
	defb 030h,060h	; 9f01
	defb 0c8h,018h	; 9f03
	defb 0c8h,018h	; 9f05
	defb 068h,018h	; 9f07
	defb 0c8h,060h	; 9f09
	defb 0c8h	; 9f0b

; ----------------------------------------------------------------------
; DATOS camino_9F0C: el camino del actor 6 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9f0c..0x9f15  (9 bytes)
DATA_camino_9F0C:
	defb 004h,0a8h	; 9f0c
	defb 0e8h,0a8h	; 9f0e
	defb 078h,078h	; 9f10
	defb 078h,078h	; 9f12
	defb 0e8h	; 9f14

; ----------------------------------------------------------------------
; DATOS camino_9F15: el camino del actor 7 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (7 bytes)
;   0x9f15..0x9f1c  (7 bytes)
DATA_camino_9F15:
	defb 003h,0b0h	; 9f15
	defb 058h,080h	; 9f17
	defb 058h,020h	; 9f19
	defb 058h	; 9f1b

; ----------------------------------------------------------------------
; DATOS camino_9F1C: el camino del actor 8 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (13 bytes)
;   0x9f1c..0x9f29  (13 bytes)
DATA_camino_9F1C:
	defb 006h,020h	; 9f1c
	defb 088h,070h	; 9f1e
	defb 088h,070h	; 9f20
	defb 0a8h,0b0h	; 9f22
	defb 0a8h,070h	; 9f24
	defb 0a8h,070h	; 9f26
	defb 088h	; 9f28

; ----------------------------------------------------------------------
; DATOS camino_9F29: el camino del actor 9 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f29..0x9f2e  (5 bytes)
DATA_camino_9F29:
	defb 002h,008h	; 9f29
	defb 040h,098h	; 9f2b
	defb 040h	; 9f2d

; ----------------------------------------------------------------------
; DATOS camino_9F2E: el camino del actor 10 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f2e..0x9f33  (5 bytes)
DATA_camino_9F2E:
	defb 002h,008h	; 9f2e
	defb 0c0h,070h	; 9f30
	defb 0c0h	; 9f32

; ----------------------------------------------------------------------
; DATOS camino_9F33: el camino del actor 11 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f33..0x9f38  (5 bytes)
DATA_camino_9F33:
	defb 002h,088h	; 9f33
	defb 0a0h,0b8h	; 9f35
	defb 0a0h	; 9f37

; ----------------------------------------------------------------------
; DATOS camino_9F38: el camino del actor 12 de la sala 8 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (7 bytes)
;   0x9f38..0x9f3f  (7 bytes)
DATA_camino_9F38:
	defb 003h,030h	; 9f38
	defb 010h,078h	; 9f3a
	defb 010h,0a8h	; 9f3c
	defb 010h	; 9f3e

; ----------------------------------------------------------------------
; DATOS camino_9F3F: el camino del actor 2 de la sala 15: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f3f..0x9f44  (5 bytes)
DATA_camino_9F3F:
	defb 002h,030h	; 9f3f
	defb 0e8h,078h	; 9f41
	defb 0e8h	; 9f43

; ----------------------------------------------------------------------
; DATOS camino_9F44: el camino del actor 1 de la sala 16: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9f44..0x9f4d  (9 bytes)
DATA_camino_9F44:
	defb 004h,030h	; 9f44
	defb 088h,030h	; 9f46
	defb 058h,080h	; 9f48
	defb 058h,030h	; 9f4a
	defb 058h	; 9f4c

; ----------------------------------------------------------------------
; DATOS camino_9F4D: el camino del actor 2 de la sala 16: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9f4d..0x9f56  (9 bytes)
DATA_camino_9F4D:
	defb 004h,030h	; 9f4d
	defb 098h,030h	; 9f4f
	defb 0b8h,080h	; 9f51
	defb 0b8h,030h	; 9f53
	defb 0b8h	; 9f55

; ----------------------------------------------------------------------
; DATOS camino_9F56: el camino del actor 3 de la sala 16: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9f56..0x9f5f  (9 bytes)
DATA_camino_9F56:
	defb 004h,090h	; 9f56
	defb 0b8h,030h	; 9f58
	defb 0b8h,090h	; 9f5a
	defb 0b8h,090h	; 9f5c
	defb 0a0h	; 9f5e

; ----------------------------------------------------------------------
; DATOS camino_9F5F: el camino del actor 4 de la sala 16: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9f5f..0x9f68  (9 bytes)
DATA_camino_9F5F:
	defb 004h,0b0h	; 9f5f
	defb 020h,0b0h	; 9f61
	defb 058h,040h	; 9f63
	defb 058h,0b0h	; 9f65
	defb 058h	; 9f67

; ----------------------------------------------------------------------
; DATOS camino_9F68: el camino del actor 1 de la sala 18: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f68..0x9f6d  (5 bytes)
DATA_camino_9F68:
	defb 002h,070h	; 9f68
	defb 098h,070h	; 9f6a
	defb 058h	; 9f6c

; ----------------------------------------------------------------------
; DATOS camino_9F6D: el camino del actor 2 de la sala 18: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f6d..0x9f72  (5 bytes)
DATA_camino_9F6D:
	defb 002h,013h	; 9f6d
	defb 060h,013h	; 9f6f
	defb 018h	; 9f71

; ----------------------------------------------------------------------
; DATOS camino_9F72: el camino del actor 3 de la sala 18: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f72..0x9f77  (5 bytes)
DATA_camino_9F72:
	defb 002h,013h	; 9f72
	defb 098h,013h	; 9f74
	defb 0e0h	; 9f76

; ----------------------------------------------------------------------
; DATOS camino_9F77: el camino del actor 4 de la sala 18: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f77..0x9f7c  (5 bytes)
DATA_camino_9F77:
	defb 002h,088h	; 9f77
	defb 068h,088h	; 9f79
	defb 018h	; 9f7b

; ----------------------------------------------------------------------
; DATOS camino_9F7C: el camino del actor 5 de la sala 18: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f7c..0x9f81  (5 bytes)
DATA_camino_9F7C:
	defb 002h,090h	; 9f7c
	defb 0a8h,090h	; 9f7e
	defb 0c8h	; 9f80

; ----------------------------------------------------------------------
; DATOS camino_9F81: el camino del actor 1 de la sala 19: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f81..0x9f86  (5 bytes)
DATA_camino_9F81:
	defb 002h,078h	; 9f81
	defb 038h,078h	; 9f83
	defb 0c8h	; 9f85

; ----------------------------------------------------------------------
; DATOS camino_9F86: el camino del actor 2 de la sala 19: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f86..0x9f8b  (5 bytes)
DATA_camino_9F86:
	defb 002h,0a8h	; 9f86
	defb 0c8h,0a8h	; 9f88
	defb 038h	; 9f8a

; ----------------------------------------------------------------------
; DATOS camino_9F8B: el camino del actor 1 de la sala 20: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f8b..0x9f90  (5 bytes)
DATA_camino_9F8B:
	defb 002h,058h	; 9f8b
	defb 050h,058h	; 9f8d
	defb 0b0h	; 9f8f

; ----------------------------------------------------------------------
; DATOS camino_9F90: el camino del actor 1 de la sala 22: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f90..0x9f95  (5 bytes)
DATA_camino_9F90:
	defb 002h,028h	; 9f90
	defb 020h,0a8h	; 9f92
	defb 020h	; 9f94

; ----------------------------------------------------------------------
; DATOS camino_9F95: el camino del actor 2 de la sala 22: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f95..0x9f9a  (5 bytes)
DATA_camino_9F95:
	defb 002h,028h	; 9f95
	defb 0f0h,0a8h	; 9f97
	defb 0f0h	; 9f99

; ----------------------------------------------------------------------
; DATOS camino_9F9A: el camino del actor 1 de la sala 23: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9f9a..0x9f9f  (5 bytes)
DATA_camino_9F9A:
	defb 002h,050h	; 9f9a
	defb 080h,028h	; 9f9c
	defb 080h	; 9f9e

; ----------------------------------------------------------------------
; DATOS camino_9F9F: el camino del actor 2 de la sala 23: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9f9f..0x9fa8  (9 bytes)
DATA_camino_9F9F:
	defb 004h,030h	; 9f9f
	defb 068h,030h	; 9fa1
	defb 038h,030h	; 9fa3
	defb 068h,050h	; 9fa5
	defb 068h	; 9fa7

; ----------------------------------------------------------------------
; DATOS camino_9FA8: el camino del actor 3 de la sala 23: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9fa8..0x9fb1  (9 bytes)
DATA_camino_9FA8:
	defb 004h,0b0h	; 9fa8
	defb 068h,0b0h	; 9faa
	defb 038h,0b0h	; 9fac
	defb 068h,090h	; 9fae
	defb 068h	; 9fb0

; ----------------------------------------------------------------------
; DATOS camino_9FB1: el camino del actor 1 de la sala 24: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9fb1..0x9fb6  (5 bytes)
DATA_camino_9FB1:
	defb 002h,070h	; 9fb1
	defb 038h,070h	; 9fb3
	defb 0c8h	; 9fb5

; ----------------------------------------------------------------------
; DATOS camino_9FB6: el camino del actor 1 de la sala 27: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9fb6..0x9fbb  (5 bytes)
DATA_camino_9FB6:
	defb 002h,040h	; 9fb6
	defb 008h,040h	; 9fb8
	defb 058h	; 9fba

; ----------------------------------------------------------------------
; DATOS camino_9FBB: el camino del actor 2 de la sala 27: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9fbb..0x9fc0  (5 bytes)
DATA_camino_9FBB:
	defb 002h,040h	; 9fbb
	defb 060h,0b8h	; 9fbd
	defb 060h	; 9fbf

; ----------------------------------------------------------------------
; DATOS camino_9FC0: el camino del actor 1 de la sala 28: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9fc0..0x9fc5  (5 bytes)
DATA_camino_9FC0:
	defb 002h,040h	; 9fc0
	defb 020h,0b0h	; 9fc2
	defb 020h	; 9fc4

; ----------------------------------------------------------------------
; DATOS camino_9FC5: el camino del actor 2 de la sala 28: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9fc5..0x9fce  (9 bytes)
DATA_camino_9FC5:
	defb 004h,030h	; 9fc5
	defb 0a8h,030h	; 9fc7
	defb 068h,030h	; 9fc9
	defb 0a8h,098h	; 9fcb
	defb 0a8h	; 9fcd

; ----------------------------------------------------------------------
; DATOS camino_9FCE: el camino del actor 1 de la sala 29: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9fce..0x9fd7  (9 bytes)
DATA_camino_9FCE:
	defb 004h,0abh	; 9fce
	defb 0c8h,0abh	; 9fd0
	defb 068h,0abh	; 9fd2
	defb 0c8h,030h	; 9fd4
	defb 0c8h	; 9fd6

; ----------------------------------------------------------------------
; DATOS camino_9FD7: el camino del actor 2 de la sala 29: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (9 bytes)
;   0x9fd7..0x9fe0  (9 bytes)
DATA_camino_9FD7:
	defb 004h,0b0h	; 9fd7
	defb 068h,058h	; 9fd9
	defb 068h,058h	; 9fdb
	defb 038h,0b0h	; 9fdd
	defb 038h	; 9fdf

; ----------------------------------------------------------------------
; DATOS camino_9FE0: el camino del actor 3 de la sala 29 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (5 bytes)
;   0x9fe0..0x9fe5  (5 bytes)
DATA_camino_9FE0:
	defb 002h,040h	; 9fe0
	defb 040h,0b8h	; 9fe2
	defb 040h	; 9fe4

; ----------------------------------------------------------------------
; DATOS camino_9FE5: el camino del actor 4 de la sala 29 y 1 mas: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (8 bytes)
;   0x9fe5..0x9fed  (8 bytes)
DATA_camino_9FE5:
	defb 002h,040h	; 9fe5
	defb 0a0h,040h	; 9fe7
	defb 0c0h,004h	; 9fe9
	defb 088h,088h	; 9feb

; ----------------------------------------------------------------------
; DATOS camino_9FED: el camino del actor 1 de la sala 32: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente); lo leen
;   p00:59F5 (18 bytes)
;   0x9fed..0x9fff  (18 bytes)
DATA_camino_9FED:
	defb 004h,030h	; 9fed
	defb 0b8h,030h	; 9fef
	defb 088h,0a8h	; 9ff1
	defb 088h,0a8h	; 9ff3
	defb 0b8h,004h	; 9ff5
	defb 0a8h,088h	; 9ff7
	defb 0a8h,0b8h	; 9ff9
	defb 030h,0b8h	; 9ffb
	defb 030h,088h	; 9ffd

; ----------------------------------------------------------------------
; DATOS camino_9FFF: el camino del actor 1 de la sala 33: [byte para
;   (ix+0x13)] y parejas [x][y] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 saca la direccion al siguiente) (sigue en el
;   banco 6, en 0xA000); lo leen p00:59F5 (1 bytes)
;   0x9fff..0xa000  (1 bytes)
DATA_camino_9FFF:
	defb 006h	; 9fff
