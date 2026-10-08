; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 13 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS indice_de_salas: 251 punteros, uno por numero de sala (0xC130), a 48
;   bytes de metafichas: p00:4CFF los lee con L_42B1; lo leen p00:4CFF (502
;   bytes)
;   0x6000..0x61f6  (502 bytes)
DATA_indice_de_salas:
	defw 06280h,062b0h,062e0h,06310h,06340h,06370h,063a0h,063d0h	; 6000
	defw 06400h,06430h,06460h,06490h,064c0h,064f0h,06520h,06550h	; 6010
	defw 06790h,067c0h,067f0h,06820h,06850h,06880h,068b0h,068e0h	; 6020
	defw 06910h,06940h,06970h,069a0h,069d0h,06a00h,06a30h,06a60h	; 6030
	defw 06a90h,06ac0h,06af0h,06b20h,06b50h,06b80h,06bb0h,06be0h	; 6040
	defw 06c10h,06c40h,06c70h,06ca0h,06cd0h,06e50h,06e20h,06d00h	; 6050
	defw 06d30h,06d60h,08290h,06d90h,06dc0h,06df0h,06700h,06730h	; 6060
	defw 06760h,066d0h,065b0h,06610h,06670h,065e0h,06640h,066a0h	; 6070
	defw 07ff0h,08050h,08020h,08080h,080b0h,080e0h,070f0h,07120h	; 6080
	defw 07150h,07180h,071b0h,071e0h,07210h,07240h,07270h,07450h	; 6090
	defw 07480h,074b0h,074e0h,07510h,07540h,07570h,075a0h,075d0h	; 60a0
	defw 07600h,07630h,07660h,07690h,076c0h,072a0h,072d0h,07300h	; 60b0
	defw 07330h,07360h,07390h,073c0h,073f0h,07420h,08110h,08140h	; 60c0
	defw 08170h,07f60h,07f90h,07fc0h,076f0h,07720h,07750h,07de0h	; 60d0
	defw 07e10h,07e40h,07e70h,07ea0h,07ed0h,06e80h,07f00h,07f30h	; 60e0
	defw 08020h,06580h,07d80h,081a0h,08230h,08260h,07780h,07780h	; 60f0
	defw 07780h,077b0h,07780h,07780h,07780h,077b0h,077e0h,07780h	; 6100
	defw 077e0h,079c0h,07b10h,079f0h,07990h,07a20h,07a50h,077b0h	; 6110
	defw 077b0h,077b0h,077e0h,07990h,07810h,07a80h,07ab0h,07c30h	; 6120
	defw 079c0h,07ae0h,07d50h,061f6h,079f0h,079f0h,079f0h,07b40h	; 6130
	defw 079f0h,07840h,079c0h,079f0h,07c00h,078a0h,07870h,078a0h	; 6140
	defw 07b70h,07ba0h,07990h,07b70h,07bd0h,07780h,07780h,07780h	; 6150
	defw 079f0h,079f0h,07db0h,07c30h,078d0h,079f0h,077b0h,079f0h	; 6160
	defw 079f0h,079f0h,07900h,079f0h,07a80h,07930h,077b0h,07c60h	; 6170
	defw 079f0h,07c90h,078d0h,078d0h,079f0h,079f0h,07900h,07780h	; 6180
	defw 07bd0h,07cc0h,077b0h,07960h,07030h,07cf0h,07d20h,07d50h	; 6190
	defw 08140h,08140h,08140h,07f90h,07f90h,07780h,07780h,07780h	; 61a0
	defw 07780h,07780h,07780h,07780h,08200h,081d0h,061f6h,061f6h	; 61b0
	defw 070c0h,07090h,07060h,061f6h,061f6h,061f6h,061f6h,061f6h	; 61c0
	defw 061f6h,061f6h,061f6h,061f6h,061f6h,061f6h,061f6h,061f6h	; 61d0
	defw 06eb0h,06ee0h,06f10h,06f40h,06f70h,06f40h,06f70h,06fa0h	; 61e0
	defw 06fd0h,06fd0h,07000h	; 61f0  -> DATA_sala_248_249 DATA_sala_248_249 DATA_sala_250

; ----------------------------------------------------------------------
; DATOS juego_de_metafichas_por_sala: el juego de metafichas de cada sala, un
;   nibble por sala (1-6): p00:4CA9 con L_42D1; lo leen p00:4CA9 (126 bytes)
;   0x61f6..0x6274  (126 bytes)
DATA_juego_de_metafichas_por_sala:
	defb 011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h	; 61f6  ................
	defb 011h,011h,011h,011h,033h,033h,031h,013h,033h,063h,033h,022h,022h,022h,022h,022h	; 6206  ....331.3c3"""""
	defb 022h,022h,022h,011h,011h,011h,011h,011h,011h,011h,011h,011h,033h,033h,032h,022h	; 6216  """.........332"
	defb 022h,022h,022h,022h,021h,011h,011h,012h,022h,022h,023h,011h,021h,052h,022h,055h	; 6226  """"!...""#.!R"U
	defb 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h	; 6236  UUUUUUUUUUUUUUUU
	defb 055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h,055h	; 6246  UUUUUUUUUUUUUUUU
	defb 055h,055h,055h,055h,055h,055h,045h,055h,022h,021h,015h,055h,055h,055h,022h,020h	; 6256  UUUUUUEU"!.UUU"
	defb 044h,040h,000h,000h,000h,000h,000h,000h,044h,044h,044h,044h,044h,047h	; 6266  D@......DDDDDG

; ----------------------------------------------------------------------
; DATOS indice_de_metafichas: 6 punteros, juegos 1-6, a las metafichas (16
;   bytes cada una): p00:4CB0 lee 0x6274 + 2 x (juego - 1); lo leen p00:4CB0
;   (12 bytes)
;   0x6274..0x6280  (12 bytes)
DATA_indice_de_metafichas:
	defw 082c0h,09040h,097f0h,09e90h,09fb0h,0a5b0h	; 6274

; ----------------------------------------------------------------------
; DATOS sala_0: la sala 0: 6 filas de 8 metafichas (un byte cada una, indice
;   1-137 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6280..0x62b0  (48 bytes)
DATA_sala_0:
	defb 019h,007h,007h,007h,007h,007h,01ch,00bh	; 6280  ........
	defb 019h,078h,079h,075h,080h,075h,075h,088h	; 6288  .xyu.uu.
	defb 019h,07ch,07dh,01fh,081h,01eh,01fh,088h	; 6290  .|}.....
	defb 019h,078h,079h,078h,079h,080h,007h,089h	; 6298  .xyxy...
	defb 019h,07ch,07dh,07ch,006h,059h,007h,01ah	; 62a0  .|}|.Y..
	defb 00ch,00dh,00dh,007h,01ah,066h,00dh,00dh	; 62a8  .....f..

; ----------------------------------------------------------------------
; DATOS sala_1: la sala 1: 6 filas de 8 metafichas (un byte cada una, indice
;   1-142 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x62b0..0x62e0  (48 bytes)
DATA_sala_1:
	defb 021h,019h,007h,007h,007h,007h,014h,020h	; 62b0  !......
	defb 025h,019h,075h,075h,075h,075h,08ch,024h	; 62b8  %.uuuu.$
	defb 021h,019h,01eh,075h,075h,069h,08eh,009h	; 62c0  !..uui..
	defb 025h,019h,007h,01eh,01fh,081h,01ah,01fh	; 62c8  %.......
	defb 008h,01dh,075h,075h,075h,075h,018h,00dh	; 62d0  ..uuuu..
	defb 017h,01bh,01eh,01fh,01fh,01fh,02ah,020h	; 62d8  ......*

; ----------------------------------------------------------------------
; DATOS sala_2: la sala 2: 6 filas de 8 metafichas (un byte cada una, indice
;   1-144 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x62e0..0x6310  (48 bytes)
DATA_sala_2:
	defb 025h,019h,07ch,006h,080h,014h,024h,025h	; 62e0  %.|...$%
	defb 008h,01dh,007h,01ah,081h,01ch,00bh,020h	; 62e8  .......
	defb 017h,01bh,007h,075h,080h,03eh,03fh,024h	; 62f0  ...u.>?$
	defb 019h,075h,080h,01eh,081h,010h,024h,025h	; 62f8  .u....$%
	defb 00ch,090h,081h,075h,075h,087h,00bh,020h	; 6300  ...uu..
	defb 021h,011h,007h,01eh,01fh,086h,00eh,024h	; 6308  !......$

; ----------------------------------------------------------------------
; DATOS sala_3: la sala 3: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6310..0x6340  (48 bytes)
DATA_sala_3:
	defb 008h,009h,00ah,001h,082h,00ah,009h,00ah	; 6310  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,01fh	; 6318  ........
	defb 019h,078h,079h,078h,079h,078h,079h,075h	; 6320  .xyxyxyu
	defb 019h,07ch,07dh,07ch,07dh,07ch,07dh,075h	; 6328  .|}|}|}u
	defb 00ch,013h,007h,007h,007h,007h,007h,01eh	; 6330  ........
	defb 021h,011h,078h,079h,080h,0c5h,00dh,00dh	; 6338  !.xy....

; ----------------------------------------------------------------------
; DATOS sala_4: la sala 4: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6340..0x6370  (48 bytes)
DATA_sala_4:
	defb 025h,008h,00ah,009h,00ah,009h,009h,00ah	; 6340  %.......
	defb 021h,017h,01fh,01fh,01fh,01fh,01fh,01fh	; 6348  !.......
	defb 025h,019h,078h,079h,080h,078h,079h,080h	; 6350  %.xy.xy.
	defb 00ah,01dh,07ch,07dh,081h,07ch,07dh,081h	; 6358  ..|}.|}.
	defb 01fh,01bh,007h,007h,007h,007h,007h,007h	; 6360  ........
	defb 00dh,08ah,08ah,08ah,08ah,08ah,08ah,08bh	; 6368  ........

; ----------------------------------------------------------------------
; DATOS sala_5: la sala 5: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6370..0x63a0  (48 bytes)
DATA_sala_5:
	defb 02bh,030h,030h,030h,030h,030h,030h,033h	; 6370  +0000003
	defb 02bh,07bh,038h,030h,030h,07bh,038h,033h	; 6378  +{800{83
	defb 02fh,07fh,039h,07bh,038h,07fh,039h,033h	; 6380  /.9{8.93
	defb 036h,083h,084h,07fh,039h,083h,084h,033h	; 6388  6...9..3
	defb 073h,030h,030h,083h,084h,030h,030h,033h	; 6390  s00..003
	defb 072h,02ch,02ch,02ch,02ch,02ch,02ch,03ah	; 6398  r,,,,,,:

; ----------------------------------------------------------------------
; DATOS sala_6: la sala 6: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x63a0..0x63d0  (48 bytes)
DATA_sala_6:
	defb 020h,021h,008h,009h,00ah,009h,001h,00ah	; 63a0   !......
	defb 024h,025h,041h,037h,037h,037h,037h,037h	; 63a8  $%A77777
	defb 008h,001h,02fh,030h,030h,030h,030h,030h	; 63b0  ../00000
	defb 041h,037h,036h,030h,030h,030h,030h,030h	; 63b8  A7600000
	defb 040h,031h,031h,031h,031h,031h,031h,032h	; 63c0  @1111112
	defb 041h,037h,037h,037h,037h,037h,037h,034h	; 63c8  A7777774

; ----------------------------------------------------------------------
; DATOS sala_7: la sala 7: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x63d0..0x6400  (48 bytes)
DATA_sala_7:
	defb 043h,043h,043h,043h,043h,043h,043h,00bh	; 63d0  CCCCCCC.
	defb 01fh,01fh,01fh,01fh,01fh,01fh,01fh,00eh	; 63d8  ........
	defb 075h,080h,07ah,07ah,080h,075h,080h,014h	; 63e0  u.zz.u..
	defb 075h,07ah,07eh,07eh,059h,075h,059h,004h	; 63e8  uz~~YuY.
	defb 01fh,07eh,069h,01fh,081h,075h,059h,005h	; 63f0  .~i..uY.
	defb 00dh,050h,066h,00dh,00dh,050h,081h,00fh	; 63f8  .Pf..P..

; ----------------------------------------------------------------------
; DATOS sala_8: la sala 8: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6400..0x6430  (48 bytes)
DATA_sala_8:
	defb 009h,00bh,020h,021h,008h,009h,00ah,009h	; 6400  .. !....
	defb 01fh,00eh,024h,025h,017h,01fh,01fh,075h	; 6408  ..$%...u
	defb 007h,01ch,001h,00bh,019h,078h,079h,075h	; 6410  .....xyu
	defb 007h,01ah,01fh,00eh,019h,07ch,07dh,075h	; 6418  .....|}u
	defb 007h,007h,007h,014h,019h,007h,007h,01eh	; 6420  ........
	defb 00dh,00dh,00dh,00fh,00ch,00dh,00dh,00dh	; 6428  ........

; ----------------------------------------------------------------------
; DATOS sala_9: la sala 9: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6430..0x6460  (48 bytes)
DATA_sala_9:
	defb 03dh,030h,030h,030h,030h,030h,030h,026h	; 6430  =000000&
	defb 03dh,030h,030h,030h,030h,030h,030h,026h	; 6438  =000000&
	defb 03dh,07bh,038h,030h,030h,07bh,038h,026h	; 6440  ={800{8&
	defb 03dh,07fh,039h,030h,030h,07fh,039h,026h	; 6448  =.900.9&
	defb 03dh,083h,084h,030h,030h,083h,084h,026h	; 6450  =..00..&
	defb 03bh,02ch,02ch,02ch,02ch,02ch,02ch,029h	; 6458  .,,,,,,)

; ----------------------------------------------------------------------
; DATOS sala_10: la sala 10: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6460..0x6490  (48 bytes)
DATA_sala_10:
	defb 009h,00ah,00bh,024h,0b5h,025h,008h,00bh	; 6460  ...$.%..
	defb 037h,037h,042h,024h,0b5h,025h,041h,042h	; 6468  77B$.%AB
	defb 030h,030h,02eh,009h,001h,00ah,02fh,026h	; 6470  00..../&
	defb 030h,030h,035h,037h,037h,037h,036h,026h	; 6478  0057776&
	defb 03ch,030h,030h,030h,030h,030h,030h,026h	; 6480  <000000&
	defb 03dh,030h,030h,030h,030h,030h,030h,026h	; 6488  =000000&

; ----------------------------------------------------------------------
; DATOS sala_11: la sala 11: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6490..0x64c0  (48 bytes)
DATA_sala_11:
	defb 008h,009h,00ah,001h,009h,00ah,009h,00ah	; 6490  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,01fh	; 6498  ........
	defb 019h,075h,080h,007h,007h,007h,075h,080h	; 64a0  .u....u.
	defb 002h,075h,059h,007h,007h,007h,075h,059h	; 64a8  .uY...uY
	defb 003h,075h,059h,007h,007h,007h,075h,059h	; 64b0  .uY...uY
	defb 00ch,050h,066h,00dh,00dh,00dh,050h,066h	; 64b8  .Pf...Pf

; ----------------------------------------------------------------------
; DATOS sala_12: la sala 12: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x64c0..0x64f0  (48 bytes)
DATA_sala_12:
	defb 00ah,009h,01dh,007h,007h,007h,014h,020h	; 64c0  .......
	defb 075h,069h,078h,079h,078h,079h,08ch,024h	; 64c8  uixyxy.$
	defb 075h,059h,07ch,07dh,07ch,07dh,08eh,00bh	; 64d0  uY|}|}..
	defb 075h,059h,007h,007h,007h,007h,01ah,00eh	; 64d8  uY......
	defb 01fh,081h,075h,080h,075h,075h,075h,08ch	; 64e0  ..u.uuu.
	defb 00dh,00dh,08ah,057h,050h,051h,051h,016h	; 64e8  ...WPQQ.

; ----------------------------------------------------------------------
; DATOS sala_13: la sala 13: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x64f0..0x6520  (48 bytes)
DATA_sala_13:
	defb 020h,021h,019h,075h,087h,00bh,024h,025h	; 64f0   !.u..$%
	defb 021h,025h,019h,01eh,086h,00eh,020h,021h	; 64f8  !%.... !
	defb 025h,008h,01dh,075h,080h,004h,024h,025h	; 6500  %..u..$%
	defb 021h,08fh,01bh,01eh,081h,005h,024h,025h	; 6508  !.....$%
	defb 025h,003h,007h,075h,075h,087h,00bh,020h	; 6510  %..uu..
	defb 020h,021h,011h,01eh,01fh,086h,00eh,024h	; 6518   !.....$

; ----------------------------------------------------------------------
; DATOS sala_14: la sala 14: 6 filas de 8 metafichas (un byte cada una, indice
;   1-197 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6520..0x6550  (48 bytes)
DATA_sala_14:
	defb 020h,021h,015h,007h,007h,014h,020h,021h	; 6520   !.... !
	defb 024h,025h,019h,007h,075h,08ch,024h,025h	; 6528  $%..u.$%
	defb 020h,021h,002h,075h,069h,092h,020h,021h	; 6530   !.ui. !
	defb 024h,025h,003h,01eh,091h,00fh,024h,025h	; 6538  $%....$%
	defb 020h,021h,019h,007h,010h,020h,021h,020h	; 6540   !... !
	defb 024h,025h,019h,075h,08ch,024h,025h,024h	; 6548  $%.u.$%$

; ----------------------------------------------------------------------
; DATOS sala_15: la sala 15: 6 filas de 8 metafichas (un byte cada una, indice
;   1-199 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6550..0x6580  (48 bytes)
DATA_sala_15:
	defb 009h,00ah,009h,00ah,001h,082h,00ah,00bh	; 6550  ........
	defb 01fh,01fh,01fh,01fh,01fh,01fh,01fh,00eh	; 6558  ........
	defb 007h,078h,079h,078h,079h,078h,079h,08ch	; 6560  .xyxyxy.
	defb 007h,07ch,07dh,07ch,07dh,07ch,006h,0c2h	; 6568  .|}|}|..
	defb 007h,007h,007h,007h,007h,012h,077h,016h	; 6570  ......w.
	defb 00dh,00dh,0c7h,007h,007h,010h,020h,021h	; 6578  ...... !

; ----------------------------------------------------------------------
; DATOS sala_121: la sala 121: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-199 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6580..0x65b0  (48 bytes)
DATA_sala_121:
	defb 009h,043h,043h,0b3h,0b3h,043h,043h,009h	; 6580  .CC..CC.
	defb 079h,078h,079h,069h,01fh,078h,079h,078h	; 6588  yxyi.xyx
	defb 006h,07ch,07dh,081h,007h,07ch,07dh,07ch	; 6590  .|}..|}|
	defb 031h,031h,031h,031h,031h,031h,031h,031h	; 6598  11111111
	defb 075h,075h,052h,052h,052h,052h,052h,075h	; 65a0  uuRRRRRu
	defb 068h,068h,056h,056h,056h,056h,056h,068h	; 65a8  hhVVVVVh

; ----------------------------------------------------------------------
; DATOS sala_58: la sala 58: 6 filas de 8 metafichas (un byte cada una, indice
;   1-37 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x65b0..0x65e0  (48 bytes)
DATA_sala_58:
	defb 019h,01ch,01dh,014h,019h,01ch,00ah,009h	; 65b0  ........
	defb 019h,020h,021h,018h,00ch,01ah,016h,016h	; 65b8  . !.....
	defb 002h,010h,011h,01ch,009h,009h,00ah,009h	; 65c0  ........
	defb 003h,018h,01fh,01ah,016h,016h,016h,016h	; 65c8  ........
	defb 019h,01ch,009h,009h,00ah,009h,00ah,009h	; 65d0  ........
	defb 00ch,01ah,016h,016h,016h,025h,016h,016h	; 65d8  .....%..

; ----------------------------------------------------------------------
; DATOS sala_61: la sala 61: 6 filas de 8 metafichas (un byte cada una, indice
;   1-37 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x65e0..0x6610  (48 bytes)
DATA_sala_61:
	defb 00ah,009h,01dh,014h,019h,014h,019h,014h	; 65e0  ........
	defb 016h,016h,017h,00fh,01bh,014h,019h,014h	; 65e8  ........
	defb 009h,00ah,009h,00ah,01dh,014h,019h,014h	; 65f0  ........
	defb 016h,016h,016h,016h,017h,00fh,01bh,014h	; 65f8  ........
	defb 009h,00ah,009h,00ah,009h,00ah,01dh,014h	; 6600  ........
	defb 016h,016h,016h,025h,016h,016h,017h,00fh	; 6608  ...%....

; ----------------------------------------------------------------------
; DATOS sala_59: la sala 59: 6 filas de 8 metafichas (un byte cada una, indice
;   1-49 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6610..0x6640  (48 bytes)
DATA_sala_59:
	defb 019h,014h,019h,014h,019h,014h,02ch,02ch	; 6610  ......,,
	defb 01dh,014h,019h,014h,019h,014h,02ch,02ch	; 6618  ......,,
	defb 021h,014h,019h,014h,019h,014h,02ch,02ch	; 6620  !.....,,
	defb 011h,014h,019h,014h,019h,014h,028h,028h	; 6628  ......((
	defb 015h,014h,019h,014h,019h,014h,008h,009h	; 6630  ........
	defb 019h,014h,019h,014h,019h,018h,031h,016h	; 6638  ......1.

; ----------------------------------------------------------------------
; DATOS sala_62: la sala 62: 6 filas de 8 metafichas (un byte cada una, indice
;   1-49 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6640..0x6670  (48 bytes)
DATA_sala_62:
	defb 015h,014h,019h,014h,019h,014h,019h,014h	; 6640  ........
	defb 019h,014h,019h,014h,019h,014h,019h,014h	; 6648  ........
	defb 002h,014h,019h,014h,019h,014h,019h,014h	; 6650  ........
	defb 003h,014h,019h,014h,019h,014h,019h,014h	; 6658  ........
	defb 01dh,014h,019h,014h,019h,014h,019h,014h	; 6660  ........
	defb 017h,00fh,01bh,014h,019h,014h,019h,014h	; 6668  ........

; ----------------------------------------------------------------------
; DATOS sala_60: la sala 60: 6 filas de 8 metafichas (un byte cada una, indice
;   1-49 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6670..0x66a0  (48 bytes)
DATA_sala_60:
	defb 008h,009h,00ah,009h,00ah,009h,00ah,009h	; 6670  ........
	defb 01eh,026h,016h,016h,016h,016h,016h,016h	; 6678  .&......
	defb 019h,010h,008h,00bh,008h,009h,00ah,009h	; 6680  ........
	defb 019h,014h,01eh,00eh,01eh,026h,016h,026h	; 6688  .....&.&
	defb 019h,014h,019h,014h,019h,010h,008h,02bh	; 6690  .......+
	defb 019h,014h,019h,014h,019h,014h,031h,02ah	; 6698  ......1*

; ----------------------------------------------------------------------
; DATOS sala_63: la sala 63: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x66a0..0x66d0  (48 bytes)
DATA_sala_63:
	defb 009h,00ah,009h,00ah,001h,009h,00ah,00bh	; 66a0  ........
	defb 016h,016h,016h,016h,016h,016h,027h,00eh	; 66a8  ......'.
	defb 009h,00bh,008h,00bh,008h,00bh,011h,014h	; 66b0  ........
	defb 016h,02dh,01eh,02eh,02fh,00eh,015h,014h	; 66b8  .-../...
	defb 009h,00bh,019h,020h,021h,014h,019h,014h	; 66c0  ... !...
	defb 070h,00eh,019h,010h,011h,014h,019h,014h	; 66c8  p.......

; ----------------------------------------------------------------------
; DATOS sala_57: la sala 57: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x66d0..0x6700  (48 bytes)
DATA_sala_57:
	defb 008h,009h,00ah,009h,00ah,009h,00ah,00bh	; 66d0  ........
	defb 01eh,025h,025h,025h,025h,025h,025h,00eh	; 66d8  .%%%%%%.
	defb 01bh,007h,007h,007h,007h,04dh,022h,004h	; 66e0  .....M".
	defb 01dh,007h,007h,007h,007h,04dh,023h,005h	; 66e8  .....M#.
	defb 021h,007h,007h,007h,007h,04dh,04dh,060h	; 66f0  !....MM`
	defb 00dh,007h,00dh,00dh,007h,061h,016h,02dh	; 66f8  .....a.-

; ----------------------------------------------------------------------
; DATOS sala_54: la sala 54: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6700..0x6730  (48 bytes)
DATA_sala_54:
	defb 008h,009h,001h,00ah,009h,009h,00ah,00bh	; 6700  ........
	defb 01eh,026h,016h,016h,016h,016h,027h,00eh	; 6708  .&....'.
	defb 019h,010h,02ch,02ch,02ch,02ch,011h,018h	; 6710  ..,,,,..
	defb 019h,014h,028h,028h,028h,028h,015h,01ch	; 6718  ..((((..
	defb 019h,01ch,009h,001h,009h,00ah,01dh,020h	; 6720  .......
	defb 00ch,01ah,016h,016h,016h,016h,017h,00dh	; 6728  ........

; ----------------------------------------------------------------------
; DATOS sala_55: la sala 55: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6730..0x6760  (48 bytes)
DATA_sala_55:
	defb 019h,007h,014h,02ch,02ch,02ch,02ch,02ch	; 6730  ...,,,,,
	defb 019h,04dh,06dh,02ch,02ch,02ch,02ch,02ch	; 6738  .Mm,,,,,
	defb 019h,04dh,06ch,028h,028h,028h,028h,028h	; 6740  .Ml(((((
	defb 019h,04dh,06bh,00ah,001h,009h,00ah,00bh	; 6748  .Mk.....
	defb 019h,04dh,06ah,025h,025h,025h,025h,00eh	; 6750  .Mj%%%%.
	defb 00ch,061h,062h,00dh,00dh,00dh,00dh,00fh	; 6758  .ab.....

; ----------------------------------------------------------------------
; DATOS sala_56: la sala 56: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6760..0x6790  (48 bytes)
DATA_sala_56:
	defb 008h,009h,00ah,009h,00ah,001h,00ah,00bh	; 6760  ........
	defb 01eh,025h,025h,025h,025h,025h,025h,00eh	; 6768  .%%%%%%.
	defb 019h,04dh,022h,04dh,022h,04dh,022h,014h	; 6770  .M"M"M".
	defb 019h,04dh,023h,04dh,023h,04dh,023h,014h	; 6778  .M#M#M#.
	defb 019h,04dh,06fh,061h,035h,061h,035h,00fh	; 6780  .Moa5a5.
	defb 019h,006h,06eh,02ch,02ch,02ch,02ch,02ch	; 6788  ..n,,,,,

; ----------------------------------------------------------------------
; DATOS sala_16: la sala 16: 6 filas de 8 metafichas (un byte cada una, indice
;   1-199 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6790..0x67c0  (48 bytes)
DATA_sala_16:
	defb 097h,098h,098h,098h,09ah,09bh,00ah,00bh	; 6790  ........
	defb 020h,021h,020h,021h,011h,01ah,01fh,00eh	; 6798   ! !....
	defb 024h,025h,024h,025h,015h,075h,080h,014h	; 67a0  $%$%.u..
	defb 008h,094h,001h,009h,01dh,075h,059h,004h	; 67a8  .....uY.
	defb 096h,099h,01fh,01fh,01bh,01eh,081h,005h	; 67b0  ........
	defb 097h,098h,00dh,00dh,00dh,00dh,00dh,00fh	; 67b8  ........

; ----------------------------------------------------------------------
; DATOS sala_17: la sala 17: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x67c0..0x67f0  (48 bytes)
DATA_sala_17:
	defb 020h,021h,019h,075h,075h,087h,00bh,024h	; 67c0   !.uu..$
	defb 024h,025h,002h,01eh,01fh,086h,00eh,020h	; 67c8  $%.....
	defb 020h,021h,003h,0d3h,075h,080h,004h,024h	; 67d0   !..u..$
	defb 024h,025h,019h,075h,075h,059h,005h,020h	; 67d8  $%.uuY.
	defb 008h,009h,01dh,075h,069h,091h,00fh,024h	; 67e0  ...ui..$
	defb 017h,01fh,01bh,01eh,081h,010h,020h,021h	; 67e8  ...... !

; ----------------------------------------------------------------------
; DATOS sala_18: la sala 18: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x67f0..0x6820  (48 bytes)
DATA_sala_18:
	defb 019h,012h,00dh,00dh,013h,012h,00dh,00fh	; 67f0  ........
	defb 019h,010h,024h,025h,011h,010h,020h,021h	; 67f8  ..$%.. !
	defb 019h,088h,008h,009h,09fh,088h,024h,025h	; 6800  ......$%
	defb 019h,0c9h,09eh,01fh,01bh,089h,00bh,020h	; 6808  .......
	defb 00ch,050h,09dh,0d3h,075h,0c8h,03fh,024h	; 6810  .P..u.?$
	defb 020h,021h,011h,075h,075h,0a0h,020h,021h	; 6818   !.uu. !

; ----------------------------------------------------------------------
; DATOS sala_19: la sala 19: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6820..0x6850  (48 bytes)
DATA_sala_19:
	defb 020h,021h,020h,021h,020h,021h,020h,021h	; 6820   ! ! ! !
	defb 024h,025h,024h,025h,024h,025h,024h,025h	; 6828  $%$%$%$%
	defb 008h,009h,00ah,009h,001h,009h,00ah,00bh	; 6830  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,00eh	; 6838  ........
	defb 019h,075h,075h,075h,075h,075h,075h,08ch	; 6840  .uuuuuu.
	defb 019h,01eh,01fh,01fh,01fh,01fh,01fh,092h	; 6848  ........

; ----------------------------------------------------------------------
; DATOS sala_20: la sala 20: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6850..0x6880  (48 bytes)
DATA_sala_20:
	defb 008h,009h,001h,00ah,009h,00ah,009h,00bh	; 6850  ........
	defb 017h,0a1h,067h,0a1h,067h,0a1h,067h,00eh	; 6858  ..g.g.g.
	defb 019h,010h,011h,010h,011h,010h,011h,014h	; 6860  ........
	defb 002h,014h,015h,014h,015h,014h,015h,004h	; 6868  ........
	defb 003h,01ch,01dh,01ch,01dh,01ch,01dh,005h	; 6870  ........
	defb 00ch,077h,085h,077h,085h,077h,085h,00fh	; 6878  .w.w.w..

; ----------------------------------------------------------------------
; DATOS sala_21: la sala 21: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6880..0x68b0  (48 bytes)
DATA_sala_21:
	defb 025h,024h,025h,024h,025h,024h,025h,024h	; 6880  %$%$%$%$
	defb 020h,021h,020h,021h,020h,021h,020h,021h	; 6888   ! ! ! !
	defb 024h,025h,024h,025h,024h,025h,024h,025h	; 6890  $%$%$%$%
	defb 008h,009h,001h,009h,00ah,001h,00ah,00bh	; 6898  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,0a2h	; 68a0  ........
	defb 00ch,00dh,00dh,00dh,00dh,00dh,00dh,077h	; 68a8  .......w

; ----------------------------------------------------------------------
; DATOS sala_22: la sala 22: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x68b0..0x68e0  (48 bytes)
DATA_sala_22:
	defb 008h,009h,00ah,009h,00ah,009h,00ah,009h	; 68b0  ........
	defb 017h,0a1h,051h,051h,051h,051h,067h,01fh	; 68b8  ..QQQQg.
	defb 019h,010h,020h,021h,020h,021h,011h,007h	; 68c0  .. ! !..
	defb 002h,014h,024h,025h,024h,025h,015h,007h	; 68c8  ..$%$%..
	defb 003h,01ch,00ah,001h,009h,00ah,01dh,007h	; 68d0  ........
	defb 00ch,077h,051h,051h,051h,051h,085h,00dh	; 68d8  .wQQQQ..

; ----------------------------------------------------------------------
; DATOS sala_23: la sala 23: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x68e0..0x6910  (48 bytes)
DATA_sala_23:
	defb 021h,008h,009h,00ah,00bh,0b5h,008h,00ah	; 68e0  !.......
	defb 025h,017h,01fh,01fh,00eh,0b5h,017h,0a1h	; 68e8  %.......
	defb 021h,002h,075h,080h,01ch,00ah,01dh,010h	; 68f0  !.u.....
	defb 025h,003h,075h,059h,03eh,067h,01bh,01ch	; 68f8  %.uY>g..
	defb 009h,01dh,075h,059h,010h,011h,012h,077h	; 6900  ..uY...w
	defb 051h,085h,050h,066h,00fh,0a3h,0a4h,020h	; 6908  Q.Pf...

; ----------------------------------------------------------------------
; DATOS sala_24: la sala 24: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6910..0x6940  (48 bytes)
DATA_sala_24:
	defb 01dh,01ch,001h,00ah,01dh,076h,080h,014h	; 6910  .....v..
	defb 01bh,01ah,01fh,01fh,01bh,01eh,081h,014h	; 6918  ........
	defb 007h,076h,080h,076h,080h,076h,080h,014h	; 6920  .v.v.v..
	defb 007h,01eh,081h,01eh,081h,01eh,081h,014h	; 6928  ........
	defb 007h,076h,076h,076h,080h,076h,080h,014h	; 6930  .vvv.v..
	defb 00dh,050h,051h,051h,066h,050h,066h,00fh	; 6938  .PQQfPf.

; ----------------------------------------------------------------------
; DATOS sala_25: la sala 25: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6940..0x6970  (48 bytes)
DATA_sala_25:
	defb 019h,007h,007h,007h,007h,007h,007h,014h	; 6940  ........
	defb 019h,007h,076h,080h,007h,007h,007h,014h	; 6948  ..v.....
	defb 019h,007h,01eh,081h,076h,076h,076h,08ch	; 6950  ....vvv.
	defb 019h,007h,076h,080h,076h,069h,01fh,092h	; 6958  ..v.vi..
	defb 019h,012h,050h,066h,090h,081h,007h,014h	; 6960  ..Pf....
	defb 019h,010h,020h,021h,011h,076h,080h,014h	; 6968  .. !.v..

; ----------------------------------------------------------------------
; DATOS sala_26: la sala 26: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6970..0x69a0  (48 bytes)
DATA_sala_26:
	defb 019h,012h,00fh,00ch,00dh,00dh,013h,014h	; 6970  ........
	defb 019h,010h,024h,025h,024h,025h,011h,014h	; 6978  ..$%$%..
	defb 019h,01ch,009h,00ah,009h,00ah,09fh,014h	; 6980  ........
	defb 019h,01ah,01fh,01fh,01fh,01fh,01bh,014h	; 6988  ........
	defb 0abh,075h,075h,080h,075h,075h,075h,088h	; 6990  .uu.uuu.
	defb 017h,01fh,01fh,081h,01eh,01fh,01fh,00eh	; 6998  ........

; ----------------------------------------------------------------------
; DATOS sala_27: la sala 27: 6 filas de 8 metafichas (un byte cada una, indice
;   1-211 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x69a0..0x69d0  (48 bytes)
DATA_sala_27:
	defb 009h,00ah,009h,00ah,001h,00ah,009h,00bh	; 69a0  ........
	defb 051h,051h,051h,067h,01fh,01fh,01fh,00eh	; 69a8  QQQg....
	defb 025h,024h,025h,011h,007h,007h,007h,014h	; 69b0  %$%.....
	defb 009h,00ah,00bh,015h,075h,075h,075h,08ch	; 69b8  ....uuu.
	defb 067h,01fh,00eh,019h,01eh,01fh,01fh,092h	; 69c0  g.......
	defb 011h,007h,014h,019h,007h,007h,007h,014h	; 69c8  ........

; ----------------------------------------------------------------------
; DATOS sala_28: la sala 28: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x69d0..0x6a00  (48 bytes)
DATA_sala_28:
	defb 021h,008h,009h,00ah,009h,00ah,001h,00bh	; 69d0  !.......
	defb 025h,08fh,01fh,01fh,01fh,0a1h,051h,03fh	; 69d8  %.....Q?
	defb 021h,003h,007h,075h,075h,0cbh,024h,025h	; 69e0  !..uu.$%
	defb 025h,002h,007h,075h,075h,0a5h,009h,00ah	; 69e8  %..uu...
	defb 021h,003h,007h,075h,075h,0d6h,01fh,01fh	; 69f0  !..uu...
	defb 025h,00ch,00dh,050h,051h,066h,00dh,00dh	; 69f8  %..PQf..

; ----------------------------------------------------------------------
; DATOS sala_29: la sala 29: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6a00..0x6a30  (48 bytes)
DATA_sala_29:
	defb 008h,00ah,009h,00ah,00ah,009h,00ah,00bh	; 6a00  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,00eh	; 6a08  ........
	defb 019h,007h,075h,075h,075h,075h,080h,014h	; 6a10  ..uuuu..
	defb 002h,007h,075h,069h,01fh,01fh,081h,014h	; 6a18  ..ui....
	defb 003h,007h,075h,059h,075h,075h,075h,088h	; 6a20  ..uYuuu.
	defb 00ch,00dh,08ah,057h,050h,051h,01fh,03fh	; 6a28  ...WPQ.?

; ----------------------------------------------------------------------
; DATOS sala_30: la sala 30: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6a30..0x6a60  (48 bytes)
DATA_sala_30:
	defb 024h,025h,019h,014h,0b5h,015h,014h,020h	; 6a30  $%.....
	defb 021h,008h,01dh,014h,0b5h,0abh,08ch,024h	; 6a38  !......$
	defb 025h,017h,01bh,014h,0b5h,0abh,0cch,020h	; 6a40  %......
	defb 021h,002h,075h,08ch,0b5h,0abh,0cdh,024h	; 6a48  !.u....$
	defb 025h,003h,075h,0a5h,00ah,0cah,0c2h,020h	; 6a50  %.u....
	defb 021h,00ch,050h,0a6h,051h,051h,016h,024h	; 6a58  !.P.QQ.$

; ----------------------------------------------------------------------
; DATOS sala_31: la sala 31: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6a60..0x6a90  (48 bytes)
DATA_sala_31:
	defb 020h,021h,008h,001h,082h,00ah,009h,00ah	; 6a60   !......
	defb 024h,025h,017h,01fh,0a1h,051h,067h,075h	; 6a68  $%...Qgu
	defb 020h,021h,019h,007h,010h,0b5h,011h,01eh	; 6a70   !......
	defb 024h,025h,019h,007h,01ch,00ah,09fh,007h	; 6a78  $%......
	defb 020h,021h,019h,007h,01ah,01fh,01bh,007h	; 6a80   !......
	defb 024h,025h,019h,0c5h,00dh,0c6h,0c5h,00dh	; 6a88  $%......

; ----------------------------------------------------------------------
; DATOS sala_32: la sala 32: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6a90..0x6ac0  (48 bytes)
DATA_sala_32:
	defb 024h,025h,024h,008h,009h,00ah,00bh,020h	; 6a90  $%$....
	defb 021h,020h,021h,08fh,0a1h,067h,00eh,024h	; 6a98  ! !..g.$
	defb 025h,024h,025h,003h,010h,011h,01ch,00ah	; 6aa0  %$%.....
	defb 00ah,001h,00bh,019h,014h,015h,01ah,01fh	; 6aa8  ........
	defb 01fh,01fh,00eh,019h,01ch,01dh,075h,080h	; 6ab0  ......u.
	defb 00dh,00dh,00fh,00ch,077h,085h,050h,066h	; 6ab8  ....w.Pf

; ----------------------------------------------------------------------
; DATOS sala_33: la sala 33: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6ac0..0x6af0  (48 bytes)
DATA_sala_33:
	defb 00ah,009h,00ah,009h,00ah,009h,00ah,00bh	; 6ac0  ........
	defb 075h,0c3h,051h,051h,051h,051h,067h,00eh	; 6ac8  u.QQQQg.
	defb 01eh,02ah,020h,021h,020h,021h,011h,014h	; 6ad0  .* ! !..
	defb 007h,014h,024h,025h,024h,025h,015h,004h	; 6ad8  ..$%$%..
	defb 007h,01ch,009h,001h,009h,00ah,01dh,005h	; 6ae0  ........
	defb 00dh,077h,051h,051h,051h,051h,085h,00fh	; 6ae8  .wQQQQ..

; ----------------------------------------------------------------------
; DATOS sala_34: la sala 34: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6af0..0x6b20  (48 bytes)
DATA_sala_34:
	defb 021h,020h,021h,008h,00bh,008h,00bh,020h	; 6af0  ! !....
	defb 025h,024h,025h,017h,088h,0abh,0c1h,024h	; 6af8  %$%....$
	defb 009h,00ah,00ah,01dh,0c9h,0cah,0a5h,00ah	; 6b00  ........
	defb 01fh,01fh,01fh,01bh,01eh,01fh,086h,01fh	; 6b08  ........
	defb 007h,075h,075h,075h,080h,075h,075h,080h	; 6b10  .uuu.uu.
	defb 00dh,050h,08ah,0b1h,066h,08ah,0b1h,066h	; 6b18  .P..f..f

; ----------------------------------------------------------------------
; DATOS sala_35: la sala 35: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6b20..0x6b50  (48 bytes)
DATA_sala_35:
	defb 008h,009h,001h,00ah,009h,00ah,009h,00ah	; 6b20  ........
	defb 017h,0a1h,067h,0a1h,051h,051h,067h,075h	; 6b28  ..g.QQgu
	defb 019h,010h,011h,010h,020h,021h,011h,01eh	; 6b30  .... !..
	defb 002h,088h,0abh,08ch,024h,025h,015h,007h	; 6b38  ....$%..
	defb 003h,0c9h,0cah,0a5h,009h,00ah,01dh,007h	; 6b40  ........
	defb 00ch,050h,051h,0a6h,051h,051h,085h,00dh	; 6b48  .PQ.QQ..

; ----------------------------------------------------------------------
; DATOS sala_36: la sala 36: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6b50..0x6b80  (48 bytes)
DATA_sala_36:
	defb 021h,020h,021h,015h,012h,00dh,00dh,00fh	; 6b50  ! !.....
	defb 025h,024h,025h,0abh,0cbh,025h,024h,025h	; 6b58  %$%..%$%
	defb 009h,001h,009h,0cah,0c2h,020h,021h,020h	; 6b60  ..... !
	defb 01fh,01fh,01fh,01fh,092h,024h,025h,024h	; 6b68  .....$%$
	defb 007h,075h,075h,075h,087h,00ah,001h,00bh	; 6b70  .uuu....
	defb 00dh,050h,051h,051h,0a6h,051h,051h,03fh	; 6b78  .PQQ.QQ?

; ----------------------------------------------------------------------
; DATOS sala_37: la sala 37: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6b80..0x6bb0  (48 bytes)
DATA_sala_37:
	defb 0aah,0a9h,09bh,094h,00ah,009h,00ah,00bh	; 6b80  ........
	defb 019h,007h,01ah,01fh,01fh,01fh,01fh,00eh	; 6b88  ........
	defb 0abh,075h,075h,075h,075h,075h,080h,014h	; 6b90  .uuuuu..
	defb 017h,01fh,01fh,01fh,01fh,01fh,081h,014h	; 6b98  ........
	defb 019h,007h,007h,007h,075h,075h,075h,088h	; 6ba0  ....uuu.
	defb 00ch,00dh,00dh,0c4h,0a8h,099h,099h,0a7h	; 6ba8  ........

; ----------------------------------------------------------------------
; DATOS sala_38: la sala 38: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6bb0..0x6be0  (48 bytes)
DATA_sala_38:
	defb 025h,015h,088h,024h,025h,0abh,09ch,00fh	; 6bb0  %..$%...
	defb 008h,01dh,088h,020h,021h,0abh,0a0h,020h	; 6bb8  ... !..
	defb 063h,09dh,088h,024h,025h,0abh,0cch,024h	; 6bc0  c..$%..$
	defb 025h,011h,0c9h,009h,00ah,0cah,0cdh,020h	; 6bc8  %......
	defb 008h,09fh,0ach,051h,051h,051h,016h,024h	; 6bd0  ...QQQ.$
	defb 017h,01bh,010h,020h,021h,020h,021h,020h	; 6bd8  ... ! !

; ----------------------------------------------------------------------
; DATOS sala_39: la sala 39: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6be0..0x6c10  (48 bytes)
DATA_sala_39:
	defb 009h,00ah,009h,00ah,001h,009h,00ah,00bh	; 6be0  ........
	defb 075h,069h,01fh,01fh,01fh,01fh,01fh,00eh	; 6be8  ui......
	defb 01eh,091h,00dh,00dh,00dh,00dh,013h,014h	; 6bf0  ........
	defb 007h,010h,024h,025h,024h,025h,011h,014h	; 6bf8  ..$%$%..
	defb 007h,01ch,009h,00ah,009h,00ah,09fh,014h	; 6c00  ........
	defb 00dh,0ceh,0d0h,051h,051h,0d1h,01bh,014h	; 6c08  ...QQ...

; ----------------------------------------------------------------------
; DATOS sala_40: la sala 40: 6 filas de 8 metafichas (un byte cada una, indice
;   1-85 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6c10..0x6c40  (48 bytes)
DATA_sala_40:
	defb 024h,024h,024h,00bh,009h,009h,009h,021h	; 6c10  $$$....!
	defb 024h,024h,024h,020h,026h,026h,026h,00eh	; 6c18  $$$ &&&.
	defb 024h,024h,024h,01bh,007h,052h,041h,01fh	; 6c20  $$$..RA.
	defb 008h,001h,04eh,019h,007h,052h,042h,04fh	; 6c28  ..N..RBO
	defb 00ah,026h,026h,027h,007h,052h,042h,04fh	; 6c30  .&&'.RBO
	defb 00ch,00dh,00dh,00dh,00dh,054h,055h,050h	; 6c38  .....TUP

; ----------------------------------------------------------------------
; DATOS sala_41: la sala 41: 6 filas de 8 metafichas (un byte cada una, indice
;   1-99 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6c40..0x6c70  (48 bytes)
DATA_sala_41:
	defb 02ah,007h,014h,024h,024h,024h,015h,022h	; 6c40  *..$$$."
	defb 061h,052h,060h,024h,024h,024h,01bh,022h	; 6c48  aR`$$$."
	defb 062h,026h,063h,024h,024h,024h,01bh,022h	; 6c50  b&c$$$."
	defb 02ah,007h,005h,024h,024h,024h,01bh,022h	; 6c58  *..$$$."
	defb 02ah,007h,018h,009h,009h,009h,019h,022h	; 6c60  *......"
	defb 028h,023h,02bh,02ch,02ch,02ch,02dh,029h	; 6c68  (#+,,,-)

; ----------------------------------------------------------------------
; DATOS sala_42: la sala 42: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6c70..0x6ca0  (48 bytes)
DATA_sala_42:
	defb 02ah,03eh,03fh,05fh,014h,024h,024h,024h	; 6c70  *>?_.$$$
	defb 02ah,006h,026h,040h,004h,024h,024h,024h	; 6c78  *.&@.$$$
	defb 02ah,03ch,03dh,007h,005h,024h,024h,024h	; 6c80  *<=..$$$
	defb 02ah,03eh,03fh,05fh,018h,009h,009h,021h	; 6c88  *>?_...!
	defb 02ah,006h,026h,040h,025h,026h,026h,00eh	; 6c90  *.&@%&&.
	defb 02ah,007h,067h,023h,023h,023h,068h,022h	; 6c98  *.g###h"

; ----------------------------------------------------------------------
; DATOS sala_43: la sala 43: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6ca0..0x6cd0  (48 bytes)
DATA_sala_43:
	defb 012h,013h,013h,013h,013h,013h,013h,013h	; 6ca0  ........
	defb 016h,017h,017h,017h,017h,017h,017h,017h	; 6ca8  ........
	defb 02ah,03ch,03dh,007h,007h,03ch,03dh,007h	; 6cb0  *<=..<=.
	defb 02ah,03eh,03fh,05fh,007h,03eh,03fh,05fh	; 6cb8  *>?_.>?_
	defb 02ah,006h,026h,040h,01ch,044h,02ch,043h	; 6cc0  *.&@.D,C
	defb 02ah,03ch,03dh,007h,010h,024h,024h,024h	; 6cc8  *<=..$$$

; ----------------------------------------------------------------------
; DATOS sala_44: la sala 44: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6cd0..0x6d00  (48 bytes)
DATA_sala_44:
	defb 012h,013h,013h,013h,007h,013h,013h,013h	; 6cd0  ........
	defb 016h,017h,017h,017h,007h,017h,017h,017h	; 6cd8  ........
	defb 036h,03ch,03dh,007h,03ch,03dh,007h,03ch	; 6ce0  6<=.<=.<
	defb 037h,03eh,03fh,05fh,03eh,03fh,05fh,03eh	; 6ce8  7>?_>?_>
	defb 007h,006h,026h,040h,006h,026h,040h,006h	; 6cf0  ..&@.&@.
	defb 00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh	; 6cf8  ........

; ----------------------------------------------------------------------
; DATOS sala_47: la sala 47: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6d00..0x6d30  (48 bytes)
DATA_sala_47:
	defb 013h,013h,013h,013h,013h,013h,013h,013h	; 6d00  ........
	defb 017h,017h,017h,017h,017h,017h,017h,017h	; 6d08  ........
	defb 007h,007h,053h,041h,052h,041h,052h,041h	; 6d10  ..SARARA
	defb 007h,007h,006h,040h,006h,040h,006h,040h	; 6d18  ...@.@.@
	defb 023h,01dh,007h,052h,041h,053h,041h,007h	; 6d20  #..RASA.
	defb 024h,02eh,00dh,054h,040h,054h,055h,00dh	; 6d28  $..T@TU.

; ----------------------------------------------------------------------
; DATOS sala_48: la sala 48: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6d30..0x6d60  (48 bytes)
DATA_sala_48:
	defb 013h,013h,013h,013h,013h,013h,013h,013h	; 6d30  ........
	defb 017h,017h,017h,017h,017h,017h,017h,017h	; 6d38  ........
	defb 03dh,007h,03ch,03dh,007h,03ch,03dh,007h	; 6d40  =.<=.<=.
	defb 03fh,05fh,03eh,03fh,05fh,03eh,03fh,05fh	; 6d48  ?_>?_>?_
	defb 026h,040h,006h,026h,040h,006h,026h,040h	; 6d50  &@.&@.&@
	defb 00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh	; 6d58  ........

; ----------------------------------------------------------------------
; DATOS sala_49: la sala 49: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6d60..0x6d90  (48 bytes)
DATA_sala_49:
	defb 013h,013h,013h,013h,013h,013h,013h,038h	; 6d60  .......8
	defb 017h,033h,034h,017h,017h,033h,034h,00fh	; 6d68  .34..34.
	defb 007h,010h,011h,01ch,01dh,010h,011h,018h	; 6d70  ........
	defb 007h,014h,015h,010h,011h,014h,015h,025h	; 6d78  .......%
	defb 007h,018h,019h,018h,032h,018h,019h,007h	; 6d80  ....2...
	defb 00dh,030h,031h,030h,031h,030h,031h,00dh	; 6d88  .010101.

; ----------------------------------------------------------------------
; DATOS sala_51: la sala 51: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6d90..0x6dc0  (48 bytes)
DATA_sala_51:
	defb 02ah,03eh,03fh,05fh,014h,024h,024h,024h	; 6d90  *>?_.$$$
	defb 028h,044h,02ch,045h,014h,024h,024h,024h	; 6d98  (D,E.$$$
	defb 008h,009h,038h,011h,018h,009h,001h,021h	; 6da0  ..8....!
	defb 039h,026h,00fh,03ah,02bh,02ch,02ch,03bh	; 6da8  9&.:+,,.
	defb 037h,007h,018h,009h,009h,009h,009h,021h	; 6db0  7......!
	defb 057h,023h,025h,026h,026h,026h,026h,00eh	; 6db8  W#%&&&&.

; ----------------------------------------------------------------------
; DATOS sala_52: la sala 52: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6dc0..0x6df0  (48 bytes)
DATA_sala_52:
	defb 02ah,03eh,03fh,05fh,03eh,03fh,05fh,022h	; 6dc0  *>?_>?_"
	defb 02ah,006h,026h,040h,006h,026h,040h,022h	; 6dc8  *.&@.&@"
	defb 02ah,03ch,03dh,007h,03ch,03dh,007h,022h	; 6dd0  *<=.<=."
	defb 02ah,03eh,03fh,05fh,03eh,03fh,05fh,022h	; 6dd8  *>?_>?_"
	defb 02ah,006h,026h,040h,006h,026h,040h,022h	; 6de0  *.&@.&@"
	defb 02ah,03ch,03dh,007h,067h,023h,023h,029h	; 6de8  *<=.g##)

; ----------------------------------------------------------------------
; DATOS sala_53: la sala 53: 6 filas de 8 metafichas (un byte cada una, indice
;   1-104 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6df0..0x6e20  (48 bytes)
DATA_sala_53:
	defb 024h,024h,024h,00bh,001h,051h,00bh,01ah	; 6df0  $$$..Q..
	defb 024h,024h,024h,020h,026h,00fh,020h,01eh	; 6df8  $$$ &. .
	defb 009h,009h,009h,019h,007h,018h,019h,022h	; 6e00  ......."
	defb 026h,026h,026h,027h,007h,025h,027h,022h	; 6e08  &&&'.%'"
	defb 007h,007h,007h,007h,007h,007h,007h,022h	; 6e10  ......."
	defb 058h,03ch,03dh,007h,03ch,03dh,007h,022h	; 6e18  X<=.<=."

; ----------------------------------------------------------------------
; DATOS sala_46: la sala 46: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6e20..0x6e50  (48 bytes)
DATA_sala_46:
	defb 0b3h,0b3h,0b3h,0b3h,0b4h,0b3h,0b3h,0b3h	; 6e20  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e28  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e30  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e38  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e40  ........
	defb 0b3h,0b3h,0b3h,0b4h,0b3h,0b3h,0b3h,0b3h	; 6e48  ........

; ----------------------------------------------------------------------
; DATOS sala_45: la sala 45: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6e50..0x6e80  (48 bytes)
DATA_sala_45:
	defb 0b3h,0b3h,0b3h,0b4h,0b3h,0b3h,0b3h,0b3h	; 6e50  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e58  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e60  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e68  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h,0b3h	; 6e70  ........
	defb 0b3h,0b3h,0b3h,0b3h,0b4h,0b3h,0b3h,0b3h	; 6e78  ........

; ----------------------------------------------------------------------
; DATOS sala_117: la sala 117: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-106 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6e80..0x6eb0  (48 bytes)
DATA_sala_117:
	defb 06ah,06ah,06ah,06ah,06ah,06ah,06ah,06ah	; 6e80  jjjjjjjj
	defb 06ah,06ah,06ah,06ah,06ah,06ah,06ah,06ah	; 6e88  jjjjjjjj
	defb 06ah,06ah,06ah,06ah,06ah,06ah,06ah,06ah	; 6e90  jjjjjjjj
	defb 06ah,06ah,06ah,06ah,06ah,06ah,06ah,013h	; 6e98  jjjjjjj.
	defb 06ah,06ah,06ah,06ah,06ah,06ah,06ah,017h	; 6ea0  jjjjjjj.
	defb 06ah,06ah,06ah,06ah,06ah,06ah,06ah,013h	; 6ea8  jjjjjjj.

; ----------------------------------------------------------------------
; DATOS sala_240: la sala 240: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6eb0..0x6ee0  (48 bytes)
DATA_sala_240:
	defb 001h,001h,00fh,010h,00ah,00ah,00ah,00ah	; 6eb0  ........
	defb 001h,001h,002h,004h,009h,008h,008h,008h	; 6eb8  ........
	defb 001h,001h,002h,004h,005h,001h,001h,001h	; 6ec0  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6ec8  ........
	defb 001h,001h,002h,004h,00ah,00ah,00bh,00bh	; 6ed0  ........
	defb 001h,001h,006h,007h,008h,008h,008h,008h	; 6ed8  ........

; ----------------------------------------------------------------------
; DATOS sala_241: la sala 241: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6ee0..0x6f10  (48 bytes)
DATA_sala_241:
	defb 001h,001h,002h,004h,00ah,00ah,00ah,00ah	; 6ee0  ........
	defb 001h,001h,002h,004h,009h,008h,008h,008h	; 6ee8  ........
	defb 001h,001h,002h,004h,00ah,00bh,00bh,00bh	; 6ef0  ........
	defb 001h,001h,002h,004h,009h,008h,008h,008h	; 6ef8  ........
	defb 001h,001h,002h,004h,00ah,00bh,00bh,00bh	; 6f00  ........
	defb 001h,001h,00dh,007h,008h,008h,008h,008h	; 6f08  ........

; ----------------------------------------------------------------------
; DATOS sala_242: la sala 242: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6f10..0x6f40  (48 bytes)
DATA_sala_242:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6f10  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6f18  ........
	defb 001h,001h,00fh,010h,00ah,00ah,00ah,00ah	; 6f20  ........
	defb 001h,001h,00eh,004h,009h,008h,008h,008h	; 6f28  ........
	defb 001h,001h,002h,004h,00ah,00ah,00ah,00ah	; 6f30  ........
	defb 001h,001h,002h,004h,009h,008h,008h,008h	; 6f38  ........

; ----------------------------------------------------------------------
; DATOS sala_243_245: la sala 243, 245: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6f40..0x6f70  (48 bytes)
DATA_sala_243_245:
	defb 001h,001h,002h,004h,00ah,00ah,00ah,00ah	; 6f40  ........
	defb 001h,001h,002h,004h,009h,008h,008h,008h	; 6f48  ........
	defb 001h,001h,002h,004h,00ah,00ah,00ah,00ah	; 6f50  ........
	defb 001h,001h,002h,004h,009h,008h,008h,008h	; 6f58  ........
	defb 001h,001h,002h,004h,00ah,00ah,00ah,00ah	; 6f60  ........
	defb 001h,001h,00dh,007h,008h,008h,008h,008h	; 6f68  ........

; ----------------------------------------------------------------------
; DATOS sala_244_246: la sala 244, 246: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6f70..0x6fa0  (48 bytes)
DATA_sala_244_246:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6f70  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6f78  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6f80  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 6f88  ........
	defb 001h,001h,00fh,010h,00ah,00ah,00ah,00ah	; 6f90  ........
	defb 001h,001h,00eh,004h,009h,008h,008h,008h	; 6f98  ........

; ----------------------------------------------------------------------
; DATOS sala_247: la sala 247: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6fa0..0x6fd0  (48 bytes)
DATA_sala_247:
	defb 001h,001h,00fh,010h,00ah,00ah,00ah,00ah	; 6fa0  ........
	defb 001h,001h,002h,004h,009h,008h,008h,008h	; 6fa8  ........
	defb 001h,001h,002h,004h,005h,001h,001h,001h	; 6fb0  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6fb8  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6fc0  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6fc8  ........

; ----------------------------------------------------------------------
; DATOS sala_248_249: la sala 248, 249: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x6fd0..0x7000  (48 bytes)
DATA_sala_248_249:
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6fd0  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6fd8  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6fe0  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6fe8  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6ff0  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 6ff8  ........

; ----------------------------------------------------------------------
; DATOS sala_250: la sala 250: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7000..0x7030  (48 bytes)
DATA_sala_250:
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 7000  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 7008  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 7010  ........
	defb 001h,001h,002h,004h,00ch,001h,001h,001h	; 7018  ........
	defb 001h,001h,002h,004h,00ah,00ah,00ah,00ah	; 7020  ........
	defb 001h,001h,00dh,007h,008h,008h,008h,008h	; 7028  ........

; ----------------------------------------------------------------------
; DATOS sala_204: la sala 204: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-16 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7030..0x7060  (48 bytes)
DATA_sala_204:
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 7030  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 7038  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 7040  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 7048  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 7050  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 7058  ........

; ----------------------------------------------------------------------
; DATOS sala_226: la sala 226: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-18 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7060..0x7090  (48 bytes)
DATA_sala_226:
	defb 002h,011h,003h,003h,003h,003h,003h,00ch	; 7060  ........
	defb 002h,011h,003h,003h,003h,003h,003h,00ch	; 7068  ........
	defb 002h,011h,003h,003h,003h,003h,003h,00ch	; 7070  ........
	defb 002h,011h,003h,003h,003h,003h,003h,00ch	; 7078  ........
	defb 002h,011h,003h,003h,003h,003h,003h,00ch	; 7080  ........
	defb 002h,011h,003h,003h,003h,012h,003h,00ch	; 7088  ........

; ----------------------------------------------------------------------
; DATOS sala_225: la sala 225: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-18 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7090..0x70c0  (48 bytes)
DATA_sala_225:
	defb 002h,011h,003h,003h,003h,011h,003h,00ch	; 7090  ........
	defb 002h,011h,003h,003h,003h,011h,003h,00ch	; 7098  ........
	defb 002h,011h,003h,003h,003h,011h,003h,00ch	; 70a0  ........
	defb 002h,011h,003h,003h,003h,011h,003h,00ch	; 70a8  ........
	defb 002h,011h,003h,012h,003h,011h,003h,00ch	; 70b0  ........
	defb 002h,011h,003h,011h,003h,011h,003h,00ch	; 70b8  ........

; ----------------------------------------------------------------------
; DATOS sala_224: la sala 224: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-18 en el juego 4); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x70c0..0x70f0  (48 bytes)
DATA_sala_224:
	defb 002h,011h,003h,011h,003h,011h,003h,00ch	; 70c0  ........
	defb 002h,011h,003h,011h,003h,011h,003h,00ch	; 70c8  ........
	defb 002h,011h,003h,011h,003h,011h,003h,00ch	; 70d0  ........
	defb 002h,011h,003h,011h,003h,011h,003h,00ch	; 70d8  ........
	defb 002h,011h,003h,011h,003h,011h,003h,003h	; 70e0  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; 70e8  ........

; ----------------------------------------------------------------------
; DATOS sala_70: la sala 70: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x70f0..0x7120  (48 bytes)
DATA_sala_70:
	defb 008h,001h,009h,001h,00ah,001h,009h,00ah	; 70f0  ........
	defb 017h,01fh,04ah,055h,048h,01fh,01fh,01fh	; 70f8  ..JUH...
	defb 019h,045h,047h,054h,05bh,044h,044h,044h	; 7100  .EGT[DDD
	defb 019h,04ch,052h,053h,052h,052h,052h,052h	; 7108  .LRSRRRR
	defb 019h,05ch,05ah,05ah,05ah,05ah,05ah,05ah	; 7110  .\ZZZZZZ
	defb 00ch,050h,051h,051h,051h,051h,051h,051h	; 7118  .PQQQQQQ

; ----------------------------------------------------------------------
; DATOS sala_71: la sala 71: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7120..0x7150  (48 bytes)
DATA_sala_71:
	defb 020h,021h,008h,001h,00bh,020h,021h,020h	; 7120   !... !
	defb 024h,025h,017h,01fh,00eh,024h,025h,024h	; 7128  $%...$%$
	defb 020h,021h,019h,007h,014h,020h,021h,020h	; 7130   !... !
	defb 024h,025h,019h,007h,014h,024h,025h,024h	; 7138  $%...$%$
	defb 020h,021h,019h,007h,014h,020h,021h,020h	; 7140   !... !
	defb 024h,025h,00ch,007h,00fh,024h,025h,024h	; 7148  $%...$%$

; ----------------------------------------------------------------------
; DATOS sala_72: la sala 72: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7150..0x7180  (48 bytes)
DATA_sala_72:
	defb 008h,009h,00ah,001h,082h,00ah,009h,00ah	; 7150  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,01fh	; 7158  ........
	defb 019h,076h,080h,007h,007h,076h,080h,007h	; 7160  .v...v..
	defb 019h,01eh,081h,076h,080h,01eh,081h,012h	; 7168  ...v....
	defb 019h,076h,080h,01eh,081h,076h,080h,010h	; 7170  .v...v..
	defb 00ch,050h,066h,007h,00dh,050h,066h,00fh	; 7178  .Pf..Pf.

; ----------------------------------------------------------------------
; DATOS sala_73: la sala 73: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7180..0x71b0  (48 bytes)
DATA_sala_73:
	defb 009h,00ah,009h,00ah,01dh,01ch,00ah,00bh	; 7180  ........
	defb 01fh,01fh,01fh,01fh,01bh,01ah,01fh,00eh	; 7188  ........
	defb 044h,044h,044h,044h,044h,046h,007h,014h	; 7190  DDDDDF..
	defb 052h,052h,052h,052h,052h,04eh,058h,004h	; 7198  RRRRRNX.
	defb 05ah,05ah,05ah,056h,05ah,05dh,059h,005h	; 71a0  ZZZVZ]Y.
	defb 051h,051h,051h,00dh,01eh,05eh,057h,00fh	; 71a8  QQQ..^W.

; ----------------------------------------------------------------------
; DATOS sala_74: la sala 74: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x71b0..0x71e0  (48 bytes)
DATA_sala_74:
	defb 019h,007h,007h,007h,049h,01ch,00ah,009h	; 71b0  ....I...
	defb 05fh,044h,044h,007h,05bh,060h,061h,061h	; 71b8  _DD.[`aa
	defb 017h,01fh,04ch,052h,052h,052h,052h,052h	; 71c0  ..LRRRRR
	defb 002h,007h,04dh,06bh,06bh,06bh,06bh,06bh	; 71c8  ..Mkkkkk
	defb 003h,007h,05ch,05ah,05ah,05ah,056h,05ah	; 71d0  ..\ZZZVZ
	defb 00ch,00dh,050h,051h,064h,065h,00dh,050h	; 71d8  ..PQde.P

; ----------------------------------------------------------------------
; DATOS sala_75: la sala 75: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x71e0..0x7210  (48 bytes)
DATA_sala_75:
	defb 009h,00ah,00bh,008h,001h,00ah,009h,00ah	; 71e0  ........
	defb 01fh,01fh,00eh,063h,051h,051h,051h,051h	; 71e8  ...cQQQQ
	defb 007h,007h,01ch,009h,00ah,00bh,020h,021h	; 71f0  ...... !
	defb 013h,007h,01ah,01fh,048h,00eh,024h,025h	; 71f8  ....H.$%
	defb 011h,007h,007h,007h,049h,004h,020h,021h	; 7200  ....I. !
	defb 015h,007h,007h,007h,049h,005h,024h,025h	; 7208  ....I.$%

; ----------------------------------------------------------------------
; DATOS sala_76: la sala 76: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7210..0x7240  (48 bytes)
DATA_sala_76:
	defb 024h,025h,024h,025h,024h,025h,024h,025h	; 7210  $%$%$%$%
	defb 008h,009h,00ah,009h,001h,009h,00ah,00bh	; 7218  ........
	defb 0abh,0bch,01fh,01fh,01fh,01fh,075h,088h	; 7220  ......u.
	defb 08fh,01bh,007h,075h,080h,007h,075h,088h	; 7228  ...u..u.
	defb 003h,007h,007h,075h,059h,007h,075h,088h	; 7230  ...uY.u.
	defb 0bdh,0beh,00dh,050h,066h,00dh,08ah,0bfh	; 7238  ...Pf...

; ----------------------------------------------------------------------
; DATOS sala_77: la sala 77: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7240..0x7270  (48 bytes)
DATA_sala_77:
	defb 01dh,04bh,054h,06bh,06bh,04fh,059h,014h	; 7240  .KTkkOY.
	defb 062h,047h,054h,06bh,06bh,04fh,059h,014h	; 7248  bGTkkOY.
	defb 052h,052h,053h,06bh,056h,04fh,059h,014h	; 7250  RRSkVOY.
	defb 06bh,06bh,06bh,06bh,056h,04fh,059h,014h	; 7258  kkkkVOY.
	defb 05ah,05ah,05ah,05ah,05ah,05dh,059h,014h	; 7260  ZZZZZ]Y.
	defb 051h,051h,051h,051h,051h,051h,066h,00fh	; 7268  QQQQQQf.

; ----------------------------------------------------------------------
; DATOS sala_78: la sala 78: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7270..0x72a0  (48 bytes)
DATA_sala_78:
	defb 009h,00ah,00ah,0b6h,0b7h,009h,009h,00bh	; 7270  ........
	defb 067h,04ah,070h,0b8h,0b9h,06fh,069h,00eh	; 7278  gJp..oi.
	defb 011h,04bh,06ch,06bh,06bh,06eh,059h,004h	; 7280  .KlkknY.
	defb 015h,047h,06ch,06bh,06bh,06eh,059h,005h	; 7288  .GlkknY.
	defb 019h,01eh,054h,06bh,06bh,06eh,059h,014h	; 7290  ..TkknY.
	defb 019h,04bh,054h,06bh,06bh,04fh,059h,014h	; 7298  .KTkkOY.

; ----------------------------------------------------------------------
; DATOS sala_93: la sala 93: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x72a0..0x72d0  (48 bytes)
DATA_sala_93:
	defb 02ch,02ch,02ch,008h,009h,00ah,009h,00bh	; 72a0  ,,,.....
	defb 02ch,02ch,02ch,01eh,025h,025h,025h,00eh	; 72a8  ,,,.%%%.
	defb 028h,028h,028h,019h,04dh,022h,007h,01ch	; 72b0  (((.M"..
	defb 008h,001h,009h,01dh,04dh,023h,007h,020h	; 72b8  ....M#.
	defb 01eh,025h,025h,021h,04dh,04dh,04dh,069h	; 72c0  .%%!MMMi
	defb 00ch,00dh,00dh,007h,061h,016h,016h,02dh	; 72c8  ....a..-

; ----------------------------------------------------------------------
; DATOS sala_94: la sala 94: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x72d0..0x7300  (48 bytes)
DATA_sala_94:
	defb 008h,009h,00ah,009h,00ah,009h,00ah,009h	; 72d0  ........
	defb 01eh,026h,016h,016h,016h,016h,016h,016h	; 72d8  .&......
	defb 019h,010h,02ch,02ch,008h,009h,00ah,009h	; 72e0  ..,,....
	defb 019h,018h,028h,028h,031h,016h,016h,016h	; 72e8  ..((1...
	defb 019h,01ch,001h,009h,009h,009h,009h,009h	; 72f0  ........
	defb 00ch,01ah,016h,016h,016h,016h,016h,016h	; 72f8  ........

; ----------------------------------------------------------------------
; DATOS sala_95: la sala 95: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7300..0x7330  (48 bytes)
DATA_sala_95:
	defb 02ch,028h,008h,001h,00bh,028h,028h,028h	; 7300  ,(...(((
	defb 02ch,008h,02fh,025h,02eh,009h,00ah,00bh	; 7308  ,./%....
	defb 02ch,01eh,021h,007h,020h,025h,025h,00eh	; 7310  ,.!. %%.
	defb 02ch,019h,007h,007h,007h,007h,007h,004h	; 7318  ,.......
	defb 02ch,019h,007h,007h,007h,007h,007h,005h	; 7320  ,.......
	defb 028h,066h,067h,067h,067h,067h,067h,068h	; 7328  (fgggggh

; ----------------------------------------------------------------------
; DATOS sala_96: la sala 96: 6 filas de 8 metafichas (un byte cada una, indice
;   1-112 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7330..0x7360  (48 bytes)
DATA_sala_96:
	defb 015h,014h,019h,018h,028h,019h,014h,028h	; 7330  ....(..(
	defb 019h,014h,019h,01ch,00bh,019h,01ch,00bh	; 7338  ........
	defb 01dh,014h,00ch,033h,00eh,019h,020h,00eh	; 7340  ...3.. .
	defb 021h,018h,028h,011h,014h,019h,007h,004h	; 7348  !.(.....
	defb 011h,01ch,009h,032h,014h,019h,007h,005h	; 7350  ...2....
	defb 01fh,01ah,016h,017h,00fh,00ch,00dh,00fh	; 7358  ........

; ----------------------------------------------------------------------
; DATOS sala_97: la sala 97: 6 filas de 8 metafichas (un byte cada una, indice
;   1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7360..0x7390  (48 bytes)
DATA_sala_97:
	defb 009h,00ah,009h,00ah,01dh,014h,008h,009h	; 7360  ........
	defb 016h,016h,016h,016h,017h,00fh,01eh,025h	; 7368  .......%
	defb 00ah,009h,00ah,00bh,008h,009h,01dh,007h	; 7370  ........
	defb 016h,016h,027h,00eh,01eh,025h,05ah,00dh	; 7378  ..'..%Z.
	defb 00ah,00bh,011h,014h,019h,007h,010h,02ch	; 7380  .......,
	defb 070h,00eh,015h,014h,00ch,071h,014h,02ch	; 7388  p....q.,

; ----------------------------------------------------------------------
; DATOS sala_98: la sala 98: 6 filas de 8 metafichas (un byte cada una, indice
;   1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7390..0x73c0  (48 bytes)
DATA_sala_98:
	defb 008h,009h,00ah,009h,00ah,009h,00ah,009h	; 7390  ........
	defb 01eh,026h,016h,016h,016h,016h,016h,016h	; 7398  .&......
	defb 019h,010h,02ch,02ch,028h,028h,028h,028h	; 73a0  ..,,((((
	defb 002h,018h,028h,028h,008h,009h,001h,00ah	; 73a8  ..((....
	defb 003h,01ch,001h,00bh,01eh,026h,016h,016h	; 73b0  .....&..
	defb 00ch,01ah,016h,02dh,019h,010h,02ch,02ch	; 73b8  ...-..,,

; ----------------------------------------------------------------------
; DATOS sala_99: la sala 99: 6 filas de 8 metafichas (un byte cada una, indice
;   1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x73c0..0x73f0  (48 bytes)
DATA_sala_99:
	defb 028h,028h,028h,02ch,02ch,008h,001h,00bh	; 73c0  (((,,...
	defb 008h,001h,00bh,02ch,02ch,031h,027h,00eh	; 73c8  ...,,1'.
	defb 01eh,025h,00eh,028h,028h,028h,011h,014h	; 73d0  .%.(((..
	defb 002h,007h,01ch,009h,001h,00ah,032h,014h	; 73d8  ......2.
	defb 003h,007h,020h,025h,025h,025h,021h,014h	; 73e0  .. %%%!.
	defb 00ch,00dh,00dh,00dh,00dh,00dh,00dh,00fh	; 73e8  ........

; ----------------------------------------------------------------------
; DATOS sala_100: la sala 100: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x73f0..0x7420  (48 bytes)
DATA_sala_100:
	defb 00ah,009h,01dh,014h,019h,014h,019h,014h	; 73f0  ........
	defb 025h,026h,017h,00fh,01bh,014h,019h,014h	; 73f8  %&......
	defb 007h,010h,008h,00ah,01dh,014h,019h,014h	; 7400  ........
	defb 00dh,00fh,031h,016h,017h,00fh,01bh,014h	; 7408  ..1.....
	defb 02ch,02ch,02ch,02ch,02ch,008h,01dh,014h	; 7410  ,,,,,...
	defb 02ch,02ch,02ch,02ch,02ch,031h,021h,00fh	; 7418  ,,,,,1!.

; ----------------------------------------------------------------------
; DATOS sala_101: la sala 101: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7420..0x7450  (48 bytes)
DATA_sala_101:
	defb 009h,00ah,009h,00ah,009h,00bh,02ch,02ch	; 7420  ......,,
	defb 016h,016h,016h,016h,027h,00eh,028h,028h	; 7428  ....'.((
	defb 008h,00bh,028h,028h,011h,01ch,001h,00bh	; 7430  ..((....
	defb 02fh,02eh,001h,00bh,015h,020h,025h,00eh	; 7438  /.... %.
	defb 017h,01ah,027h,00eh,019h,030h,034h,014h	; 7440  ..'..04.
	defb 02ch,02ch,011h,014h,019h,010h,011h,014h	; 7448  ,,......

; ----------------------------------------------------------------------
; DATOS sala_79: la sala 79: 6 filas de 8 metafichas (un byte cada una, indice
;   1-214 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7450..0x7480  (48 bytes)
DATA_sala_79:
	defb 008h,001h,00bh,0abh,059h,01ch,01dh,014h	; 7450  ....Y...
	defb 017h,01fh,00eh,0abh,059h,03eh,09dh,014h	; 7458  ....Y>..
	defb 019h,007h,014h,0abh,059h,010h,011h,014h	; 7460  ....Y...
	defb 019h,007h,014h,0abh,09ch,00fh,015h,014h	; 7468  ........
	defb 019h,007h,01ch,0cah,0a0h,008h,01dh,01ch	; 7470  ........
	defb 00ch,00dh,077h,051h,016h,063h,085h,077h	; 7478  ..wQ.c.w

; ----------------------------------------------------------------------
; DATOS sala_80: la sala 80: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7480..0x74b0  (48 bytes)
DATA_sala_80:
	defb 019h,014h,0b5h,019h,007h,088h,019h,014h	; 7480  ........
	defb 00ch,00fh,0b5h,019h,007h,088h,019h,014h	; 7488  ........
	defb 008h,009h,00ah,01dh,007h,088h,019h,01ch	; 7490  ........
	defb 063h,051h,051h,09dh,007h,088h,00ch,077h	; 7498  cQQ....w
	defb 021h,020h,021h,011h,007h,088h,008h,00bh	; 74a0  ! !.....
	defb 025h,024h,025h,0abh,080h,0d8h,017h,00eh	; 74a8  %$%.....

; ----------------------------------------------------------------------
; DATOS sala_81: la sala 81: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x74b0..0x74e0  (48 bytes)
DATA_sala_81:
	defb 008h,009h,00ah,001h,00ah,009h,00ah,00bh	; 74b0  ........
	defb 017h,0a1h,051h,051h,051h,051h,067h,00eh	; 74b8  ..QQQQg.
	defb 019h,010h,020h,021h,020h,021h,011h,01ch	; 74c0  .. ! !..
	defb 019h,014h,024h,025h,024h,025h,015h,03eh	; 74c8  ..$%$%.>
	defb 019h,014h,0b5h,008h,001h,00bh,019h,010h	; 74d0  ........
	defb 019h,014h,0b5h,017h,01fh,088h,019h,014h	; 74d8  ........

; ----------------------------------------------------------------------
; DATOS sala_82: la sala 82: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x74e0..0x7510  (48 bytes)
DATA_sala_82:
	defb 008h,001h,00bh,020h,021h,008h,001h,00bh	; 74e0  ... !...
	defb 017h,01fh,00eh,024h,025h,017h,01fh,00eh	; 74e8  ...$%...
	defb 019h,007h,014h,020h,021h,019h,007h,01ch	; 74f0  ... !...
	defb 019h,007h,014h,024h,025h,019h,007h,03eh	; 74f8  ...$%..>
	defb 01dh,007h,014h,008h,001h,01dh,007h,010h	; 7500  ........
	defb 085h,00dh,00fh,063h,051h,085h,00dh,00fh	; 7508  ...cQ...

; ----------------------------------------------------------------------
; DATOS sala_83: la sala 83: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7510..0x7540  (48 bytes)
DATA_sala_83:
	defb 008h,001h,009h,00ah,001h,009h,00ah,00bh	; 7510  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,00eh	; 7518  ........
	defb 01dh,075h,075h,075h,075h,075h,075h,08ch	; 7520  .uuuuuu.
	defb 09dh,01eh,01fh,01fh,01fh,01fh,01fh,0c0h	; 7528  ........
	defb 011h,075h,075h,075h,075h,075h,075h,0adh	; 7530  .uuuuuu.
	defb 0a3h,01eh,051h,051h,051h,051h,01fh,016h	; 7538  ..QQQQ..

; ----------------------------------------------------------------------
; DATOS sala_84: la sala 84: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7540..0x7570  (48 bytes)
DATA_sala_84:
	defb 008h,009h,00ah,009h,00ah,009h,00ah,009h	; 7540  ........
	defb 017h,01fh,0a1h,051h,051h,051h,051h,051h	; 7548  ...QQQQQ
	defb 01dh,007h,010h,008h,00ah,009h,00ah,009h	; 7550  ........
	defb 09dh,007h,014h,0abh,069h,0a1h,051h,051h	; 7558  ....i.QQ
	defb 011h,007h,014h,0abh,059h,010h,020h,021h	; 7560  ....Y. !
	defb 0a3h,007h,00fh,063h,081h,0bfh,024h,025h	; 7568  ...c..$%

; ----------------------------------------------------------------------
; DATOS sala_85: la sala 85: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7570..0x75a0  (48 bytes)
DATA_sala_85:
	defb 020h,021h,020h,021h,020h,021h,020h,021h	; 7570   ! ! ! !
	defb 024h,025h,024h,025h,024h,025h,024h,025h	; 7578  $%$%$%$%
	defb 009h,00ah,009h,00ah,001h,009h,00ah,00bh	; 7580  ........
	defb 051h,067h,0bch,0b2h,069h,01fh,01fh,00eh	; 7588  Qg..i...
	defb 021h,011h,0d2h,0d3h,059h,007h,007h,014h	; 7590  !...Y...
	defb 025h,0a3h,0d7h,077h,066h,00dh,00dh,00fh	; 7598  %..wf...

; ----------------------------------------------------------------------
; DATOS sala_86: la sala 86: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x75a0..0x75d0  (48 bytes)
DATA_sala_86:
	defb 008h,001h,00bh,019h,014h,024h,025h,024h	; 75a0  .....$%$
	defb 0abh,069h,088h,019h,014h,008h,001h,00bh	; 75a8  .i......
	defb 0abh,059h,088h,019h,014h,0abh,069h,088h	; 75b0  .Y....i.
	defb 08fh,081h,088h,00ch,00fh,0abh,059h,088h	; 75b8  ......Y.
	defb 003h,007h,089h,009h,00ah,0cah,059h,088h	; 75c0  ......Y.
	defb 00ch,00dh,077h,051h,051h,051h,066h,0bfh	; 75c8  ..wQQQf.

; ----------------------------------------------------------------------
; DATOS sala_87: la sala 87: 6 filas de 8 metafichas (un byte cada una, indice
;   1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x75d0..0x7600  (48 bytes)
DATA_sala_87:
	defb 009h,001h,00bh,008h,00bh,008h,001h,00bh	; 75d0  ........
	defb 051h,051h,03fh,017h,00eh,017h,01fh,00eh	; 75d8  QQ?.....
	defb 009h,00ah,009h,01dh,01ch,01dh,007h,014h	; 75e0  ........
	defb 051h,051h,051h,09dh,03eh,09dh,007h,014h	; 75e8  QQQ.>...
	defb 021h,020h,021h,011h,010h,011h,007h,014h	; 75f0  ! !.....
	defb 025h,024h,025h,015h,014h,0a3h,00dh,00fh	; 75f8  %$%.....

; ----------------------------------------------------------------------
; DATOS sala_88: la sala 88: 6 filas de 8 metafichas (un byte cada una, indice
;   1-106 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7600..0x7630  (48 bytes)
DATA_sala_88:
	defb 008h,009h,009h,001h,069h,009h,009h,038h	; 7600  ....i..8
	defb 00ah,046h,02ch,047h,046h,02ch,047h,00fh	; 7608  .F,GF,G.
	defb 02ah,010h,024h,011h,010h,024h,011h,014h	; 7610  *.$..$..
	defb 061h,060h,024h,015h,014h,024h,015h,018h	; 7618  a`$..$..
	defb 062h,056h,001h,019h,018h,009h,019h,025h	; 7620  bV.....%
	defb 00ch,030h,048h,031h,030h,048h,031h,00dh	; 7628  .0H10H1.

; ----------------------------------------------------------------------
; DATOS sala_89: la sala 89: 6 filas de 8 metafichas (un byte cada una, indice
;   1-106 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7630..0x7660  (48 bytes)
DATA_sala_89:
	defb 02ah,007h,018h,009h,009h,009h,009h,009h	; 7630  *.......
	defb 02ah,007h,025h,046h,02ch,02ch,047h,026h	; 7638  *.%F,,G&
	defb 02ah,007h,007h,010h,024h,024h,011h,007h	; 7640  *...$$..
	defb 02ah,007h,007h,014h,024h,024h,015h,007h	; 7648  *...$$..
	defb 02ah,007h,007h,018h,009h,001h,019h,007h	; 7650  *.......
	defb 00ch,00dh,00dh,030h,048h,048h,031h,00dh	; 7658  ...0HH1.

; ----------------------------------------------------------------------
; DATOS sala_90: la sala 90: 6 filas de 8 metafichas (un byte cada una, indice
;   1-106 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7660..0x7690  (48 bytes)
DATA_sala_90:
	defb 008h,009h,009h,009h,009h,009h,019h,022h	; 7660  ......."
	defb 00ah,046h,047h,046h,047h,046h,035h,022h	; 7668  .FGFGF5"
	defb 02ah,010h,011h,010h,011h,010h,011h,065h	; 7670  *......e
	defb 02ah,018h,032h,018h,032h,018h,032h,066h	; 7678  *.2.2.2f
	defb 061h,064h,049h,02bh,02dh,02bh,02dh,029h	; 7680  adI+-+-)
	defb 062h,040h,010h,024h,024h,024h,024h,024h	; 7688  b@.$$$$$

; ----------------------------------------------------------------------
; DATOS sala_91: la sala 91: 6 filas de 8 metafichas (un byte cada una, indice
;   1-106 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7690..0x76c0  (48 bytes)
DATA_sala_91:
	defb 00bh,009h,013h,013h,013h,013h,013h,01ah	; 7690  ........
	defb 020h,026h,017h,017h,017h,033h,04ch,04bh	; 7698   &...3LK
	defb 01bh,007h,052h,052h,041h,010h,024h,024h	; 76a0  ..RRA.$$
	defb 019h,007h,006h,026h,040h,018h,009h,021h	; 76a8  ...&@..!
	defb 027h,007h,052h,053h,04dh,02bh,047h,00eh	; 76b0  '.RSM+G.
	defb 00dh,00dh,044h,02ch,04ah,024h,011h,022h	; 76b8  ..D,J$."

; ----------------------------------------------------------------------
; DATOS sala_92: la sala 92: 6 filas de 8 metafichas (un byte cada una, indice
;   1-106 en el juego 3); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x76c0..0x76f0  (48 bytes)
DATA_sala_92:
	defb 009h,059h,059h,059h,001h,059h,009h,021h	; 76c0  .YYY.Y.!
	defb 026h,05ah,05ah,05ah,05eh,05ah,05eh,00eh	; 76c8  &ZZZ^Z^.
	defb 007h,05bh,05ch,05ch,05dh,05bh,05dh,022h	; 76d0  .[\\][]"
	defb 007h,007h,007h,007h,007h,007h,007h,022h	; 76d8  ......."
	defb 007h,007h,007h,007h,007h,007h,007h,022h	; 76e0  ......."
	defb 00dh,00dh,00dh,00dh,00dh,00dh,00dh,02fh	; 76e8  ......./

; ----------------------------------------------------------------------
; DATOS sala_108: la sala 108: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x76f0..0x7720  (48 bytes)
DATA_sala_108:
	defb 00ch,00dh,00dh,08ah,057h,013h,012h,00fh	; 76f0  ....W...
	defb 025h,024h,025h,024h,025h,011h,010h,024h	; 76f8  %$%$%..$
	defb 008h,009h,00ah,009h,00ah,09fh,01ch,00bh	; 7700  ........
	defb 08fh,01fh,01fh,01fh,01fh,01bh,01ah,00eh	; 7708  ........
	defb 003h,007h,007h,007h,007h,007h,007h,014h	; 7710  ........
	defb 00ch,00dh,00dh,007h,00dh,00dh,00dh,00fh	; 7718  ........

; ----------------------------------------------------------------------
; DATOS sala_109: la sala 109: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7720..0x7750  (48 bytes)
DATA_sala_109:
	defb 008h,009h,00ah,001h,082h,009h,00ah,00bh	; 7720  ........
	defb 017h,01fh,01fh,01fh,01fh,075h,075h,0c1h	; 7728  .....uu.
	defb 019h,007h,007h,007h,007h,075h,075h,088h	; 7730  .....uu.
	defb 019h,007h,007h,007h,007h,01eh,075h,088h	; 7738  ......u.
	defb 019h,007h,007h,075h,080h,007h,01eh,00eh	; 7740  ...u....
	defb 019h,007h,007h,075h,059h,007h,007h,014h	; 7748  ...uY...

; ----------------------------------------------------------------------
; DATOS sala_110: la sala 110: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7750..0x7780  (48 bytes)
DATA_sala_110:
	defb 008h,001h,094h,00ah,00bh,008h,001h,00bh	; 7750  ........
	defb 0d4h,0d5h,051h,067h,00eh,017h,099h,00eh	; 7758  ..Qg....
	defb 025h,024h,025h,011h,014h,019h,007h,014h	; 7760  %$%.....
	defb 008h,009h,00ah,09fh,014h,019h,007h,014h	; 7768  ........
	defb 017h,01fh,01fh,01bh,01ch,01dh,007h,014h	; 7770  ........
	defb 019h,007h,0a9h,0a9h,01ah,01bh,0a9h,014h	; 7778  ........

; ----------------------------------------------------------------------
; DATOS sala_126_127_128: la sala 126, 127, 128, 130, 131, 132, 135, 173 ...:
;   6 filas de 8 metafichas (un byte cada una, indice 1-91 en el juego 5);
;   p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y p00:4D2E las pinta; lo leen
;   p00:4CB7 (48 bytes)
;   0x7780..0x77b0  (48 bytes)
DATA_sala_126_127_128:
	defb 020h,049h,04ah,04ah,04ah,04ah,04bh,020h	; 7780   IJJJJK
	defb 020h,04dh,04eh,04eh,054h,055h,04fh,020h	; 7788   MNNTUO
	defb 020h,053h,04ch,04ch,04ch,050h,057h,020h	; 7790   SLLLPW
	defb 020h,052h,056h,04ch,04ch,051h,05bh,020h	; 7798   RVLLQ[
	defb 020h,058h,059h,059h,059h,059h,05ah,020h	; 77a0   XYYYYZ
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 77a8

; ----------------------------------------------------------------------
; DATOS sala_129_133_143: la sala 129, 133, 143, 144, 145, 182, 190, 202: 6
;   filas de 8 metafichas (un byte cada una, indice 1-91 en el juego 5);
;   p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y p00:4D2E las pinta; lo leen
;   p00:4CB7 (48 bytes)
;   0x77b0..0x77e0  (48 bytes)
DATA_sala_129_133_143:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 77b0   ......
	defb 020h,00bh,022h,02bh,01ch,01ch,00fh,020h	; 77b8   ."+...
	defb 020h,019h,01ah,024h,006h,029h,041h,020h	; 77c0   ..$.)A
	defb 020h,019h,006h,006h,006h,029h,032h,020h	; 77c8   ....)2
	defb 020h,00ch,00dh,006h,00dh,030h,040h,020h	; 77d0   ....0@
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 77d8    .*.

; ----------------------------------------------------------------------
; DATOS sala_134_136_146: la sala 134, 136, 146: 6 filas de 8 metafichas (un
;   byte cada una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de
;   4 x 4 fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x77e0..0x7810  (48 bytes)
DATA_sala_134_136_146:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 77e0   ......
	defb 020h,00bh,022h,02bh,01ch,01ch,00fh,020h	; 77e8   ."+...
	defb 020h,019h,01ah,024h,006h,006h,004h,020h	; 77f0   ..$...
	defb 020h,019h,006h,006h,006h,006h,005h,020h	; 77f8   ......
	defb 020h,00ch,00dh,00dh,00dh,00dh,00eh,020h	; 7800   ......
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7808

; ----------------------------------------------------------------------
; DATOS sala_148: la sala 148: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7810..0x7840  (48 bytes)
DATA_sala_148:
	defb 020h,008h,009h,001h,009h,009h,00ah,020h	; 7810   ......
	defb 020h,00bh,01bh,01bh,01bh,01bh,00fh,020h	; 7818   ......
	defb 020h,019h,006h,006h,006h,006h,004h,020h	; 7820   ......
	defb 020h,019h,006h,006h,006h,006h,005h,020h	; 7828   ......
	defb 020h,00ch,00dh,00dh,00dh,00dh,00eh,020h	; 7830   ......
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7838

; ----------------------------------------------------------------------
; DATOS sala_161: la sala 161: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7840..0x7870  (48 bytes)
DATA_sala_161:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 7840   ......
	defb 020h,00bh,01ch,01ch,01ch,01ch,00fh,020h	; 7848   ......
	defb 020h,002h,006h,006h,006h,029h,041h,020h	; 7850   ....)A
	defb 020h,003h,006h,006h,006h,029h,032h,020h	; 7858   ....)2
	defb 020h,00ch,00dh,00dh,00dh,030h,040h,020h	; 7860   ....0@
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7868

; ----------------------------------------------------------------------
; DATOS sala_166: la sala 166: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7870..0x78a0  (48 bytes)
DATA_sala_166:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 7870   ......
	defb 020h,00bh,022h,02bh,01ch,01ch,018h,020h	; 7878   ."+...
	defb 020h,019h,01ah,024h,006h,006h,012h,020h	; 7880   ..$...
	defb 020h,019h,006h,006h,006h,006h,010h,020h	; 7888   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7890   ......
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7898    .*.

; ----------------------------------------------------------------------
; DATOS sala_165_167: la sala 165, 167: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x78a0..0x78d0  (48 bytes)
DATA_sala_165_167:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 78a0   ......
	defb 020h,01dh,01ch,01ch,01ch,01ch,00fh,020h	; 78a8   ......
	defb 020h,013h,006h,006h,006h,029h,041h,020h	; 78b0   ....)A
	defb 020h,011h,006h,006h,006h,029h,032h,020h	; 78b8   ....)2
	defb 020h,02ch,00dh,00dh,00dh,030h,040h,020h	; 78c0   ,...0@
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 78c8

; ----------------------------------------------------------------------
; DATOS sala_180_194_195: la sala 180, 194, 195: 6 filas de 8 metafichas (un
;   byte cada una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de
;   4 x 4 fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x78d0..0x7900  (48 bytes)
DATA_sala_180_194_195:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 78d0   ......
	defb 020h,00bh,022h,02bh,01ch,01ch,00fh,020h	; 78d8   ."+...
	defb 020h,002h,01ah,024h,006h,029h,041h,020h	; 78e0   ..$.)A
	defb 020h,003h,006h,006h,006h,029h,032h,020h	; 78e8   ....)2
	defb 020h,00ch,00dh,00dh,00dh,030h,040h,020h	; 78f0   ....0@
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 78f8

; ----------------------------------------------------------------------
; DATOS sala_186_198: la sala 186, 198: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7900..0x7930  (48 bytes)
DATA_sala_186_198:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 7900   ......
	defb 020h,00bh,022h,02bh,01ch,01ch,00fh,020h	; 7908   ."+...
	defb 020h,019h,01ah,024h,006h,006h,014h,020h	; 7910   ..$...
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7918   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7920   ......
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7928    .*.

; ----------------------------------------------------------------------
; DATOS sala_189: la sala 189: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7930..0x7960  (48 bytes)
DATA_sala_189:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 7930   ......
	defb 020h,00bh,029h,029h,029h,029h,031h,020h	; 7938   .))))1
	defb 020h,002h,029h,02eh,01bh,029h,032h,020h	; 7940   .)..)2
	defb 020h,003h,029h,02fh,006h,029h,032h,020h	; 7948   .)/.)2
	defb 020h,00ch,030h,024h,02dh,02dh,033h,020h	; 7950   .0$--3
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7958    .*.

; ----------------------------------------------------------------------
; DATOS sala_203: la sala 203: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7960..0x7990  (48 bytes)
DATA_sala_203:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 7960   ......
	defb 020h,00bh,01ch,01ch,01ch,01ch,00fh,020h	; 7968   ......
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7970   ......
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7978   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7980   ......
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7988    .*.

; ----------------------------------------------------------------------
; DATOS sala_140_147_170: la sala 140, 147, 170: 6 filas de 8 metafichas (un
;   byte cada una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de
;   4 x 4 fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7990..0x79c0  (48 bytes)
DATA_sala_140_147_170:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7990   ......
	defb 020h,00bh,021h,034h,01bh,01bh,00fh,020h	; 7998   .!4...
	defb 020h,019h,01ah,024h,006h,006h,004h,020h	; 79a0   ..$...
	defb 020h,019h,006h,006h,006h,006h,005h,020h	; 79a8   ......
	defb 020h,00ch,00dh,00dh,00dh,00dh,00eh,020h	; 79b0   ......
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 79b8

; ----------------------------------------------------------------------
; DATOS sala_137_152_162: la sala 137, 152, 162: 6 filas de 8 metafichas (un
;   byte cada una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de
;   4 x 4 fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x79c0..0x79f0  (48 bytes)
DATA_sala_137_152_162:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 79c0   ......
	defb 020h,00bh,021h,034h,01bh,01bh,00fh,020h	; 79c8   .!4...
	defb 020h,002h,01ah,024h,006h,029h,041h,020h	; 79d0   ..$.)A
	defb 020h,003h,006h,006h,006h,029h,032h,020h	; 79d8   ....)2
	defb 020h,00ch,00dh,00dh,00dh,030h,040h,020h	; 79e0   ....0@
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 79e8

; ----------------------------------------------------------------------
; DATOS sala_139_156_157: la sala 139, 156, 157, 158, 160, 163, 176, 177 ...:
;   6 filas de 8 metafichas (un byte cada una, indice 1-91 en el juego 5);
;   p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y p00:4D2E las pinta; lo leen
;   p00:4CB7 (48 bytes)
;   0x79f0..0x7a20  (48 bytes)
DATA_sala_139_156_157:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 79f0   ......
	defb 020h,00bh,021h,034h,01bh,01bh,00fh,020h	; 79f8   .!4...
	defb 020h,019h,01ah,024h,006h,006h,014h,020h	; 7a00   ..$...
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7a08   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7a10   ......
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7a18    .*.

; ----------------------------------------------------------------------
; DATOS sala_141: la sala 141: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7a20..0x7a50  (48 bytes)
DATA_sala_141:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7a20   ......
	defb 020h,00bh,01bh,01bh,01bh,01bh,036h,020h	; 7a28   .....6
	defb 020h,019h,006h,006h,006h,006h,005h,020h	; 7a30   ......
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7a38   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7a40   ......
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7a48    .*.

; ----------------------------------------------------------------------
; DATOS sala_142: la sala 142: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7a50..0x7a80  (48 bytes)
DATA_sala_142:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7a50   ......
	defb 020h,035h,01bh,01bh,01bh,01bh,036h,020h	; 7a58   5....6
	defb 020h,003h,006h,006h,006h,006h,005h,020h	; 7a60   ......
	defb 020h,038h,037h,03ch,039h,037h,03ah,020h	; 7a68   87<97:
	defb 020h,00ch,006h,03dh,03bh,006h,00eh,020h	; 7a70   ..=...
	defb 020h,01eh,02ah,01fh,01eh,02ah,01fh,020h	; 7a78   .*..*.

; ----------------------------------------------------------------------
; DATOS sala_149_188: la sala 149, 188: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7a80..0x7ab0  (48 bytes)
DATA_sala_149_188:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7a80   ......
	defb 020h,00bh,021h,034h,01bh,01bh,00fh,020h	; 7a88   .!4...
	defb 020h,019h,01ah,024h,006h,006h,004h,020h	; 7a90   ..$...
	defb 020h,019h,006h,006h,006h,006h,005h,020h	; 7a98   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7aa0   ......
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7aa8    .*.

; ----------------------------------------------------------------------
; DATOS sala_150: la sala 150: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7ab0..0x7ae0  (48 bytes)
DATA_sala_150:
	defb 008h,009h,009h,009h,009h,009h,009h,00ah	; 7ab0  ........
	defb 00bh,01bh,01bh,01bh,01bh,01bh,01bh,00fh	; 7ab8  ........
	defb 019h,006h,029h,025h,029h,025h,006h,004h	; 7ac0  ..)%)%..
	defb 019h,006h,01ah,024h,01ah,024h,006h,005h	; 7ac8  ...$.$..
	defb 019h,029h,029h,025h,029h,029h,025h,014h	; 7ad0  .))%))%.
	defb 00ch,030h,03eh,024h,030h,03eh,042h,00eh	; 7ad8  .0>$0>B.

; ----------------------------------------------------------------------
; DATOS sala_153: la sala 153: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7ae0..0x7b10  (48 bytes)
DATA_sala_153:
	defb 026h,008h,009h,009h,009h,009h,00ah,020h	; 7ae0  &......
	defb 008h,01dh,01bh,01bh,01bh,01bh,00fh,020h	; 7ae8  .......
	defb 00bh,013h,006h,006h,006h,006h,004h,020h	; 7af0  .......
	defb 00ch,017h,006h,006h,006h,006h,005h,020h	; 7af8  .......
	defb 020h,03fh,00dh,006h,00dh,00dh,00eh,020h	; 7b00   ?.....
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7b08    .*.

; ----------------------------------------------------------------------
; DATOS sala_138: la sala 138: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7b10..0x7b40  (48 bytes)
DATA_sala_138:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7b10   ......
	defb 020h,00bh,021h,034h,01bh,01bh,00fh,020h	; 7b18   .!4...
	defb 020h,019h,01ah,024h,006h,006h,014h,020h	; 7b20   ..$...
	defb 020h,019h,029h,029h,029h,029h,041h,020h	; 7b28   .))))A
	defb 020h,00ch,030h,01bh,03eh,03eh,040h,020h	; 7b30   .0.>>@
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7b38    .*.

; ----------------------------------------------------------------------
; DATOS sala_159: la sala 159: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7b40..0x7b70  (48 bytes)
DATA_sala_159:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7b40   ......
	defb 020h,00bh,01bh,01bh,021h,034h,00fh,020h	; 7b48   ...!4.
	defb 020h,002h,029h,025h,01ah,029h,041h,020h	; 7b50   .)%.)A
	defb 020h,003h,029h,02fh,006h,029h,032h,020h	; 7b58   .)/.)2
	defb 020h,00ch,030h,042h,00dh,030h,040h,020h	; 7b60   .0B.0@
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7b68

; ----------------------------------------------------------------------
; DATOS sala_168_171: la sala 168, 171: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-91 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7b70..0x7ba0  (48 bytes)
DATA_sala_168_171:
	defb 020h,008h,009h,001h,009h,009h,00ah,020h	; 7b70   ......
	defb 020h,00bh,01bh,01bh,021h,034h,00fh,020h	; 7b78   ...!4.
	defb 020h,019h,029h,025h,01ah,024h,014h,020h	; 7b80   .)%.$.
	defb 020h,019h,029h,02fh,006h,006h,014h,020h	; 7b88   .)/...
	defb 020h,00ch,030h,042h,00dh,00dh,00eh,020h	; 7b90   .0B...
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7b98

; ----------------------------------------------------------------------
; DATOS sala_169: la sala 169: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-92 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7ba0..0x7bd0  (48 bytes)
DATA_sala_169:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7ba0   ......
	defb 020h,00bh,021h,034h,01bh,01bh,00fh,020h	; 7ba8   .!4...
	defb 020h,019h,01ah,024h,006h,006h,05ch,020h	; 7bb0   ..$..\
	defb 020h,019h,006h,006h,006h,006h,012h,020h	; 7bb8   ......
	defb 020h,00ch,00dh,00dh,00dh,00dh,045h,020h	; 7bc0   .....E
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7bc8

; ----------------------------------------------------------------------
; DATOS sala_172_200: la sala 172, 200: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-92 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7bd0..0x7c00  (48 bytes)
DATA_sala_172_200:
	defb 020h,008h,044h,02fh,043h,009h,00ah,020h	; 7bd0   .D/C..
	defb 020h,00bh,01bh,024h,021h,034h,00fh,020h	; 7bd8   ..$!4.
	defb 020h,019h,029h,025h,01ah,024h,014h,020h	; 7be0   .)%.$.
	defb 020h,019h,029h,02fh,006h,006h,014h,020h	; 7be8   .)/...
	defb 020h,00ch,030h,042h,00dh,00dh,00eh,020h	; 7bf0   .0B...
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7bf8

; ----------------------------------------------------------------------
; DATOS sala_164: la sala 164: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-92 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7c00..0x7c30  (48 bytes)
DATA_sala_164:
	defb 020h,008h,007h,007h,007h,007h,00ah,020h	; 7c00   ......
	defb 020h,00bh,022h,02bh,01ch,01ch,018h,020h	; 7c08   ."+...
	defb 020h,019h,01ah,024h,006h,006h,012h,020h	; 7c10   ..$...
	defb 020h,019h,006h,006h,006h,006h,010h,020h	; 7c18   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7c20   ......
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7c28

; ----------------------------------------------------------------------
; DATOS sala_151_179: la sala 151, 179: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-92 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7c30..0x7c60  (48 bytes)
DATA_sala_151_179:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7c30   ......
	defb 020h,00bh,01bh,01bh,021h,034h,00fh,020h	; 7c38   ...!4.
	defb 020h,002h,006h,006h,01ah,029h,041h,020h	; 7c40   ....)A
	defb 020h,003h,006h,006h,006h,029h,032h,020h	; 7c48   ....)2
	defb 020h,00ch,00dh,00dh,00dh,030h,040h,020h	; 7c50   ....0@
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7c58

; ----------------------------------------------------------------------
; DATOS sala_191: la sala 191: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-92 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7c60..0x7c90  (48 bytes)
DATA_sala_191:
	defb 026h,008h,009h,009h,009h,009h,00ah,026h	; 7c60  &......&
	defb 008h,01dh,01bh,01bh,01bh,01bh,018h,00ah	; 7c68  ........
	defb 00bh,013h,006h,006h,006h,006h,012h,00fh	; 7c70  ........
	defb 00ch,017h,006h,006h,006h,006h,016h,00eh	; 7c78  ........
	defb 020h,03fh,00dh,006h,00dh,00dh,045h,020h	; 7c80   ?....E
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7c88    .*.

; ----------------------------------------------------------------------
; DATOS sala_193: la sala 193: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-96 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7c90..0x7cc0  (48 bytes)
DATA_sala_193:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7c90   ......
	defb 020h,047h,05fh,01bh,01bh,05dh,046h,020h	; 7c98   G_..]F
	defb 020h,047h,060h,006h,006h,05eh,046h,020h	; 7ca0   G`..^F
	defb 020h,00bh,013h,006h,006h,012h,00fh,020h	; 7ca8   ......
	defb 020h,00ch,017h,006h,006h,016h,00eh,020h	; 7cb0   ......
	defb 020h,020h,03fh,006h,00dh,045h,020h,020h	; 7cb8    ?..E

; ----------------------------------------------------------------------
; DATOS sala_201: la sala 201: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-96 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7cc0..0x7cf0  (48 bytes)
DATA_sala_201:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7cc0   ......
	defb 020h,00bh,01bh,029h,029h,029h,046h,020h	; 7cc8   ..)))F
	defb 020h,019h,006h,029h,02eh,01bh,036h,020h	; 7cd0   ..)..6
	defb 020h,019h,006h,029h,02fh,006h,005h,020h	; 7cd8   ..)/..
	defb 020h,00ch,00dh,02dh,02dh,02dh,048h,020h	; 7ce0   ..---H
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7ce8

; ----------------------------------------------------------------------
; DATOS sala_205: la sala 205: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-96 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7cf0..0x7d20  (48 bytes)
DATA_sala_205:
	defb 026h,008h,009h,009h,001h,009h,00ah,020h	; 7cf0  &......
	defb 008h,01dh,01bh,01bh,01bh,01bh,00fh,020h	; 7cf8  .......
	defb 00bh,013h,006h,006h,006h,006h,014h,020h	; 7d00  .......
	defb 00ch,017h,006h,006h,006h,006h,014h,020h	; 7d08  .......
	defb 020h,03fh,00dh,006h,00dh,00dh,00eh,020h	; 7d10   ?.....
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7d18    .*.

; ----------------------------------------------------------------------
; DATOS sala_206: la sala 206: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-96 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7d20..0x7d50  (48 bytes)
DATA_sala_206:
	defb 020h,008h,009h,009h,001h,009h,00ah,020h	; 7d20   ......
	defb 020h,00bh,01bh,01bh,01bh,01bh,00fh,020h	; 7d28   ......
	defb 020h,019h,029h,025h,006h,029h,041h,020h	; 7d30   .)%.)A
	defb 020h,019h,029h,02fh,006h,029h,032h,020h	; 7d38   .)/.)2
	defb 020h,00ch,030h,024h,00dh,030h,040h,020h	; 7d40   .0$.0@
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7d48    .*.

; ----------------------------------------------------------------------
; DATOS sala_154_207: la sala 154, 207: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-96 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7d50..0x7d80  (48 bytes)
DATA_sala_154_207:
	defb 020h,008h,009h,009h,001h,009h,00ah,020h	; 7d50   ......
	defb 020h,00bh,01bh,01bh,01bh,01bh,00fh,020h	; 7d58   ......
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7d60   ......
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7d68   ......
	defb 020h,00ch,00dh,006h,00dh,00dh,00eh,020h	; 7d70   ......
	defb 020h,020h,01eh,02ah,01fh,020h,020h,020h	; 7d78    .*.

; ----------------------------------------------------------------------
; DATOS sala_122: la sala 122: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-96 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7d80..0x7db0  (48 bytes)
DATA_sala_122:
	defb 020h,008h,009h,001h,009h,009h,00ah,020h	; 7d80   ......
	defb 020h,00bh,01bh,01bh,01bh,01bh,00fh,020h	; 7d88   ......
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7d90   ......
	defb 020h,019h,006h,006h,006h,006h,014h,020h	; 7d98   ......
	defb 020h,00ch,00dh,00dh,00dh,00dh,00eh,020h	; 7da0   ......
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7da8

; ----------------------------------------------------------------------
; DATOS sala_178: la sala 178: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-96 en el juego 5); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7db0..0x7de0  (48 bytes)
DATA_sala_178:
	defb 020h,008h,009h,009h,009h,009h,00ah,020h	; 7db0   ......
	defb 020h,00bh,021h,034h,01bh,01bh,00fh,020h	; 7db8   .!4...
	defb 020h,019h,01ah,024h,006h,029h,023h,020h	; 7dc0   ..$.)#
	defb 020h,019h,006h,006h,006h,029h,027h,020h	; 7dc8   ....)'
	defb 020h,00ch,00dh,00dh,00dh,030h,040h,020h	; 7dd0   ....0@
	defb 020h,020h,020h,020h,020h,020h,020h,020h	; 7dd8

; ----------------------------------------------------------------------
; DATOS sala_111: la sala 111: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7de0..0x7e10  (48 bytes)
DATA_sala_111:
	defb 028h,028h,028h,028h,028h,008h,001h,00bh	; 7de0  (((((...
	defb 008h,00ah,009h,00ah,009h,02fh,025h,00eh	; 7de8  ...../%.
	defb 01eh,026h,016h,016h,016h,017h,00dh,00fh	; 7df0  .&......
	defb 019h,010h,028h,028h,028h,028h,028h,028h	; 7df8  ..((((((
	defb 019h,01ch,00ah,009h,00ah,009h,00ah,009h	; 7e00  ........
	defb 00ch,01ah,016h,016h,016h,016h,016h,016h	; 7e08  ........

; ----------------------------------------------------------------------
; DATOS sala_112: la sala 112: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7e10..0x7e40  (48 bytes)
DATA_sala_112:
	defb 008h,01dh,01ch,00ah,009h,001h,009h,00bh	; 7e10  ........
	defb 01eh,021h,020h,025h,04dh,024h,025h,00eh	; 7e18  .! %M$%.
	defb 019h,04dh,04dh,04dh,04dh,023h,04dh,064h	; 7e20  .MMMM#Md
	defb 019h,006h,025h,025h,025h,062h,006h,063h	; 7e28  ..%%%b.c
	defb 05bh,04dh,04dh,04dh,04dh,04dh,04dh,064h	; 7e30  [MMMMMMd
	defb 031h,016h,016h,016h,016h,016h,025h,065h	; 7e38  1.....%e

; ----------------------------------------------------------------------
; DATOS sala_113: la sala 113: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7e40..0x7e70  (48 bytes)
DATA_sala_113:
	defb 008h,009h,00ah,009h,00ah,009h,001h,00bh	; 7e40  ........
	defb 01eh,025h,025h,026h,027h,025h,025h,00eh	; 7e48  .%%&'%%.
	defb 019h,007h,007h,010h,012h,04dh,04dh,060h	; 7e50  .....MM`
	defb 019h,007h,007h,014h,05bh,024h,025h,060h	; 7e58  ....[$%`
	defb 00ch,034h,030h,00fh,05bh,023h,007h,060h	; 7e60  .40.[#.`
	defb 02ch,011h,010h,02ch,031h,062h,00dh,013h	; 7e68  ,..,1b..

; ----------------------------------------------------------------------
; DATOS sala_114: la sala 114: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7e70..0x7ea0  (48 bytes)
DATA_sala_114:
	defb 008h,001h,009h,00ah,009h,00bh,02ch,02ch	; 7e70  ......,,
	defb 031h,016h,027h,025h,025h,00eh,02ch,02ch	; 7e78  1.'%%.,,
	defb 02ch,02ch,011h,007h,007h,014h,02ch,02ch	; 7e80  ,,....,,
	defb 028h,028h,015h,007h,007h,018h,028h,028h	; 7e88  ((....((
	defb 008h,009h,01dh,007h,007h,01ch,00ah,00bh	; 7e90  ........
	defb 031h,016h,017h,00dh,00dh,01ah,025h,02dh	; 7e98  1.....%-

; ----------------------------------------------------------------------
; DATOS sala_115: la sala 115: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7ea0..0x7ed0  (48 bytes)
DATA_sala_115:
	defb 028h,028h,028h,008h,001h,00bh,028h,028h	; 7ea0  (((...((
	defb 008h,009h,00ah,02fh,025h,02eh,00ah,00bh	; 7ea8  .../%...
	defb 01eh,025h,025h,05ah,00dh,033h,025h,00eh	; 7eb0  .%%Z.3%.
	defb 01bh,007h,007h,010h,028h,011h,007h,004h	; 7eb8  ....(...
	defb 01dh,007h,007h,01ch,009h,032h,007h,005h	; 7ec0  .....2..
	defb 017h,00dh,00dh,01ah,025h,017h,00dh,00fh	; 7ec8  ....%...

; ----------------------------------------------------------------------
; DATOS sala_116: la sala 116: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7ed0..0x7f00  (48 bytes)
DATA_sala_116:
	defb 008h,009h,00ah,001h,00ah,009h,00ah,00bh	; 7ed0  ........
	defb 01eh,025h,025h,025h,025h,025h,025h,00eh	; 7ed8  .%%%%%%.
	defb 05bh,04dh,04dh,04dh,04dh,04dh,022h,014h	; 7ee0  [MMMMM".
	defb 01eh,025h,025h,026h,016h,016h,035h,00fh	; 7ee8  .%%&..5.
	defb 019h,007h,007h,010h,02ch,02ch,02ch,02ch	; 7ef0  ....,,,,
	defb 05ch,05dh,05eh,05fh,02ch,02ch,02ch,02ch	; 7ef8  \]^_,,,,

; ----------------------------------------------------------------------
; DATOS sala_118: la sala 118: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7f00..0x7f30  (48 bytes)
DATA_sala_118:
	defb 025h,024h,0b5h,0b5h,0b5h,0b5h,025h,024h	; 7f00  %$....%$
	defb 008h,00bh,008h,009h,00ah,00bh,008h,00bh	; 7f08  ........
	defb 08fh,0a2h,09eh,01fh,01fh,0a2h,09eh,00eh	; 7f10  ........
	defb 003h,01ah,01bh,007h,007h,01ah,01bh,014h	; 7f18  ........
	defb 019h,076h,080h,007h,007h,007h,076h,08ch	; 7f20  .v....v.
	defb 00ch,0afh,057h,007h,00dh,00dh,0afh,0b0h	; 7f28  ..W.....

; ----------------------------------------------------------------------
; DATOS sala_119: la sala 119: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7f30..0x7f60  (48 bytes)
DATA_sala_119:
	defb 008h,001h,00ah,009h,00ah,009h,00ah,00bh	; 7f30  ........
	defb 017h,01fh,01fh,01fh,01fh,01fh,01fh,00eh	; 7f38  ........
	defb 019h,075h,080h,075h,080h,075h,080h,004h	; 7f40  .u.u.u..
	defb 019h,01eh,081h,01eh,081h,01eh,081h,005h	; 7f48  ........
	defb 019h,075h,080h,075h,080h,075h,080h,014h	; 7f50  .u.u.u..
	defb 00ch,050h,066h,050h,066h,050h,066h,00fh	; 7f58  .PfPfPf.

; ----------------------------------------------------------------------
; DATOS sala_105: la sala 105: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7f60..0x7f90  (48 bytes)
DATA_sala_105:
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7f60  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7f68  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7f70  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7f78  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7f80  ..qkknY.
	defb 00ch,00dh,05ch,0bah,0bbh,05dh,057h,00fh	; 7f88  ..\..]W.

; ----------------------------------------------------------------------
; DATOS sala_106_211_212: la sala 106, 211, 212: 6 filas de 8 metafichas (un
;   byte cada una, indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000
;   de 4 x 4 fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7f90..0x7fc0  (48 bytes)
DATA_sala_106_211_212:
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7f90  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7f98  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7fa0  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7fa8  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7fb0  ..qkknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7fb8  ..qkknY.

; ----------------------------------------------------------------------
; DATOS sala_107: la sala 107: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-216 en el juego 1); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x7fc0..0x7ff0  (48 bytes)
DATA_sala_107:
	defb 019h,007h,007h,007h,007h,007h,007h,014h	; 7fc0  ........
	defb 019h,007h,044h,044h,044h,046h,007h,014h	; 7fc8  ..DDDF..
	defb 019h,007h,01eh,074h,052h,04eh,058h,014h	; 7fd0  ...tRNX.
	defb 019h,007h,045h,054h,056h,04fh,059h,014h	; 7fd8  ..ETVOY.
	defb 019h,007h,04ch,053h,06bh,06eh,059h,014h	; 7fe0  ..LSknY.
	defb 019h,007h,071h,06bh,06bh,06eh,059h,014h	; 7fe8  ..qkknY.

; ----------------------------------------------------------------------
; DATOS sala_64: la sala 64: 6 filas de 8 metafichas (un byte cada una, indice
;   1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta (sigue en el banco 14, en 0x8000); lo leen p00:4CB7 (16
;   bytes)
;   0x7ff0..0x8000  (16 bytes)
DATA_sala_64:
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 7ff0  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 7ff8  @@@@@@@@
