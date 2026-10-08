; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 14 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS sala_64_cola: la sala 64: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta (sigue del banco 13); lo leen p00:4CB7 (32 bytes)
;   0x8000..0x8020  (32 bytes)
DATA_sala_64_cola:
	defb 040h,050h,050h,04eh,040h,040h,040h,040h	; 8000  @PPN@@@@
	defb 040h,054h,054h,056h,040h,040h,040h,040h	; 8008  @TTV@@@@
	defb 040h,058h,042h,04fh,040h,040h,040h,040h	; 8010  @XBO@@@@
	defb 044h,044h,044h,040h,044h,044h,044h,044h	; 8018  DDD@DDDD

; ----------------------------------------------------------------------
; DATOS sala_66_120: la sala 66, 120: 6 filas de 8 metafichas (un byte cada
;   una, indice 1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4
;   fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8020..0x8050  (48 bytes)
DATA_sala_66_120:
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8020  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8028  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8030  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8038  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8040  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8048  @@@@@@@@

; ----------------------------------------------------------------------
; DATOS sala_65: la sala 65: 6 filas de 8 metafichas (un byte cada una, indice
;   1-113 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8050..0x8080  (48 bytes)
DATA_sala_65:
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8050  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8058  @@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,050h,04eh	; 8060  @@@@@@PN
	defb 040h,040h,040h,040h,040h,040h,054h,056h	; 8068  @@@@@@TV
	defb 040h,040h,040h,040h,040h,040h,058h,04fh	; 8070  @@@@@@XO
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 8078  @@@@@@@@

; ----------------------------------------------------------------------
; DATOS sala_67: la sala 67: 6 filas de 8 metafichas (un byte cada una, indice
;   1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8080..0x80b0  (48 bytes)
DATA_sala_67:
	defb 036h,04bh,02ch,03bh,040h,03ch,02ch,03bh	; 8080  6K,.@<,.
	defb 038h,02ch,028h,03bh,040h,03ah,028h,03bh	; 8088  8,(.@:(.
	defb 04bh,02ch,008h,03fh,040h,03eh,00bh,04ah	; 8090  K,.?@>.J
	defb 028h,028h,078h,079h,040h,041h,077h,028h	; 8098  ((xy@Aw(
	defb 009h,00ah,07ah,04fh,040h,040h,07bh,00ah	; 80a0  ..zO@@{.
	defb 042h,042h,043h,040h,040h,040h,041h,042h	; 80a8  BBC@@@AB

; ----------------------------------------------------------------------
; DATOS sala_68: la sala 68: 6 filas de 8 metafichas (un byte cada una, indice
;   1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x80b0..0x80e0  (48 bytes)
DATA_sala_68:
	defb 040h,040h,040h,040h,040h,040h,040h,040h	; 80b0  @@@@@@@@
	defb 044h,044h,044h,037h,040h,040h,040h,036h	; 80b8  DDD7@@@6
	defb 028h,028h,02ch,039h,040h,040h,040h,038h	; 80c0  ((,9@@@8
	defb 00ah,00bh,02ch,03dh,040h,036h,044h,04bh	; 80c8  ..,=@6DK
	defb 042h,048h,02ch,03bh,040h,038h,02ch,028h	; 80d0  BH,.@8,(
	defb 040h,03ch,02ch,03bh,040h,03ch,02ch,008h	; 80d8  @<,.@<,.

; ----------------------------------------------------------------------
; DATOS sala_69: la sala 69: 6 filas de 8 metafichas (un byte cada una, indice
;   1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x80e0..0x8110  (48 bytes)
DATA_sala_69:
	defb 009h,00ah,009h,00ah,001h,00ah,009h,00ah	; 80e0  ........
	defb 042h,042h,042h,042h,042h,042h,042h,042h	; 80e8  BBBBBBBB
	defb 04dh,04dh,04eh,040h,040h,040h,04dh,04dh	; 80f0  MMN@@@MM
	defb 042h,042h,04fh,040h,040h,040h,058h,042h	; 80f8  BBO@@@XB
	defb 040h,040h,04dh,04dh,04dh,04dh,04eh,040h	; 8100  @@MMMMN@
	defb 040h,040h,058h,042h,042h,042h,04fh,040h	; 8108  @@XBBBO@

; ----------------------------------------------------------------------
; DATOS sala_102: la sala 102: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8110..0x8140  (48 bytes)
DATA_sala_102:
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8110  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8118  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8120  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8128  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8130  FFFFFFFF
	defb 045h,045h,045h,045h,046h,045h,045h,045h	; 8138  EEEEFEEE

; ----------------------------------------------------------------------
; DATOS sala_103_208_209: la sala 103, 208, 209, 210: 6 filas de 8 metafichas
;   (un byte cada una, indice 1-123 en el juego 2); p00:4CB7 las monta en
;   0xE000 de 4 x 4 fichas y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8140..0x8170  (48 bytes)
DATA_sala_103_208_209:
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8140  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8148  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8150  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8158  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8160  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8168  FFFFFFFF

; ----------------------------------------------------------------------
; DATOS sala_104: la sala 104: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8170..0x81a0  (48 bytes)
DATA_sala_104:
	defb 051h,051h,051h,001h,051h,051h,051h,051h	; 8170  QQQ.QQQQ
	defb 055h,055h,055h,029h,055h,055h,055h,055h	; 8178  UUU)UUUU
	defb 059h,059h,059h,053h,059h,059h,059h,059h	; 8180  YYYSYYYY
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8188  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8190  FFFFFFFF
	defb 046h,046h,046h,046h,046h,046h,046h,046h	; 8198  FFFFFFFF

; ----------------------------------------------------------------------
; DATOS sala_123: la sala 123: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x81a0..0x81d0  (48 bytes)
DATA_sala_123:
	defb 019h,007h,007h,007h,007h,007h,007h,014h	; 81a0  ........
	defb 019h,007h,04dh,075h,074h,04dh,022h,014h	; 81a8  ..MutM".
	defb 019h,007h,04dh,076h,074h,04dh,023h,014h	; 81b0  ..MvtM#.
	defb 019h,007h,006h,021h,020h,025h,062h,014h	; 81b8  ...! %b.
	defb 019h,007h,007h,007h,007h,007h,007h,014h	; 81c0  ........
	defb 066h,067h,067h,067h,067h,022h,067h,068h	; 81c8  fgggg"gh

; ----------------------------------------------------------------------
; DATOS sala_221: la sala 221: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x81d0..0x8200  (48 bytes)
DATA_sala_221:
	defb 019h,007h,007h,007h,007h,007h,007h,014h	; 81d0  ........
	defb 019h,007h,074h,04dh,04dh,075h,007h,014h	; 81d8  ..tMMu..
	defb 019h,007h,020h,025h,025h,021h,007h,014h	; 81e0  .. %%!..
	defb 019h,007h,007h,007h,007h,074h,04dh,060h	; 81e8  .....tM`
	defb 05bh,04dh,04dh,022h,007h,020h,025h,00eh	; 81f0  [MM". %.
	defb 01eh,025h,025h,062h,007h,007h,007h,014h	; 81f8  .%%b....

; ----------------------------------------------------------------------
; DATOS sala_220: la sala 220: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8200..0x8230  (48 bytes)
DATA_sala_220:
	defb 019h,007h,007h,007h,007h,007h,007h,014h	; 8200  ........
	defb 05bh,022h,007h,007h,007h,007h,007h,014h	; 8208  ["......
	defb 05bh,023h,007h,007h,007h,007h,04dh,060h	; 8210  [#....M`
	defb 05bh,023h,007h,04dh,022h,007h,006h,060h	; 8218  [#.M"..`
	defb 05bh,023h,007h,04dh,023h,007h,007h,060h	; 8220  [#.M#..`
	defb 01eh,062h,007h,006h,062h,007h,007h,073h	; 8228  .b..b..s

; ----------------------------------------------------------------------
; DATOS sala_124: la sala 124: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8230..0x8260  (48 bytes)
DATA_sala_124:
	defb 019h,04dh,04dh,04dh,022h,007h,007h,014h	; 8230  .MMM"...
	defb 019h,006h,025h,025h,04dh,04dh,022h,014h	; 8238  ..%%MM".
	defb 019h,007h,007h,007h,006h,04dh,04dh,060h	; 8240  .....MM`
	defb 019h,007h,007h,007h,007h,006h,025h,060h	; 8248  ......%`
	defb 05bh,04dh,04dh,04dh,04dh,022h,007h,060h	; 8250  [MMMM".`
	defb 01eh,025h,025h,025h,025h,062h,007h,073h	; 8258  .%%%%b.s

; ----------------------------------------------------------------------
; DATOS sala_125: la sala 125: 6 filas de 8 metafichas (un byte cada una,
;   indice 1-123 en el juego 2); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas
;   y p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8260..0x8290  (48 bytes)
DATA_sala_125:
	defb 008h,009h,00ah,001h,00ah,009h,00ah,00bh	; 8260  ........
	defb 01eh,025h,04dh,024h,025h,025h,025h,00eh	; 8268  .%M$%%%.
	defb 019h,007h,04dh,04dh,04dh,022h,04dh,060h	; 8270  ..MMM"M`
	defb 019h,007h,006h,025h,025h,062h,04dh,072h	; 8278  ...%%bMr
	defb 019h,04dh,022h,007h,007h,04dh,04dh,06ch	; 8280  .M"..MMl
	defb 019h,04dh,04dh,04dh,022h,006h,025h,063h	; 8288  .MMM".%c

; ----------------------------------------------------------------------
; DATOS sala_50: la sala 50: 6 filas de 8 metafichas (un byte cada una, indice
;   1-21 en el juego 6); p00:4CB7 las monta en 0xE000 de 4 x 4 fichas y
;   p00:4D2E las pinta; lo leen p00:4CB7 (48 bytes)
;   0x8290..0x82c0  (48 bytes)
DATA_sala_50:
	defb 005h,00eh,015h,001h,001h,001h,001h,002h	; 8290  ........
	defb 010h,00eh,00eh,015h,001h,00eh,015h,002h	; 8298  ........
	defb 001h,014h,011h,00fh,001h,00eh,00eh,012h	; 82a0  ........
	defb 001h,001h,001h,001h,001h,014h,011h,013h	; 82a8  ........
	defb 001h,001h,001h,001h,001h,001h,001h,002h	; 82b0  ........
	defb 003h,003h,003h,003h,003h,003h,003h,004h	; 82b8  ........

; ----------------------------------------------------------------------
; DATOS metafichas_juego_1: las 216 metafichas del juego 1, 4 x 4 numeros de
;   ficha (16 bytes) cada una; el numero de la sala es 1-216 (p00:4CC3 resta
;   1); lo que las salas de ese juego usan como mucho; lo leen p00:4CC3 (3456
;   bytes)
;   0x82c0..0x9040  (3456 bytes)
DATA_metafichas_juego_1:
	defb 003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h	; 82c0  ................
	defb 01dh,005h,061h,060h,01dh,006h,061h,060h,01dh,007h,061h,060h,01fh,008h,061h,060h	; 82d0  ..a`..a`..a`..a`
	defb 01fh,002h,061h,060h,01fh,009h,061h,060h,01fh,00ah,061h,060h,01dh,00bh,061h,060h	; 82e0  ..a`..a`..a`..a`
	defb 060h,060h,00ch,01ch,060h,060h,00dh,01ch,060h,060h,00eh,01ch,060h,060h,00fh,01eh	; 82f0  ``..``..``..``..
	defb 060h,060h,001h,01eh,060h,060h,010h,01eh,060h,060h,011h,01eh,060h,060h,012h,01ch	; 8300  ``..``..``..``..
	defb 0f3h,0f2h,0a0h,0d0h,0f6h,0f5h,0a2h,0d2h,0f8h,088h,0a4h,0d4h,061h,061h,0a6h,0d6h	; 8310  ............aa..
	defb 060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h	; 8320  ````````````````
	defb 01dh,02ah,049h,049h,01dh,02bh,04ah,04bh,01dh,02ch,049h,049h,01dh,02dh,04ah,04bh	; 8330  .*II.+JK.,II.-JK
	defb 049h,049h,049h,047h,04ah,04bh,04ah,04bh,049h,046h,049h,049h,04ah,04bh,04bh,04ah	; 8340  IIIGJKJKIFIIJKKJ
	defb 047h,049h,049h,049h,04ah,04bh,04ah,04bh,043h,049h,047h,049h,04bh,04ah,04bh,04ah	; 8350  GIIIJKJKCIGIKJKJ
	defb 049h,049h,02eh,01ch,04ah,04bh,02fh,01ch,049h,049h,030h,01ch,04bh,04ah,031h,01ch	; 8360  II..JK/.II0.KJ1.
	defb 01dh,050h,061h,060h,01dh,04fh,061h,060h,01dh,050h,061h,060h,019h,021h,021h,021h	; 8370  .Pa`.Oa`.Pa`.!!!
	defb 060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 8380  ````````````!!!!
	defb 061h,061h,04ch,01ch,060h,060h,04dh,01ch,060h,060h,04ch,01ch,060h,060h,04dh,01ch	; 8390  aaL.``M.``L.``M.
	defb 060h,060h,04ch,01ch,060h,060h,04dh,01ch,060h,060h,04ch,01ch,021h,021h,021h,01ah	; 83a0  ``L.``M.``L.!!!.
	defb 060h,060h,022h,01ch,060h,060h,023h,01ch,060h,060h,024h,01ch,060h,060h,025h,01ch	; 83b0  ``".``#.``$.``%.
	defb 01dh,026h,060h,060h,01dh,027h,060h,060h,01dh,028h,060h,060h,01dh,029h,060h,060h	; 83c0  .&``.'``.(``.)``
	defb 060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,014h	; 83d0  ```````````````.
	defb 060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,017h,060h,060h,060h	; 83e0  ````````````.```
	defb 060h,060h,04ch,01ch,060h,060h,04dh,01ch,060h,060h,04ch,01ch,060h,060h,04dh,01ch	; 83f0  ``L.``M.``L.``M.
	defb 01dh,050h,062h,060h,01dh,04fh,061h,060h,01dh,050h,061h,060h,01dh,04fh,061h,060h	; 8400  .Pb`.Oa`.Pa`.Oa`
	defb 061h,060h,04ch,01ch,060h,060h,04dh,01ch,060h,060h,04ch,01ch,021h,021h,021h,01ah	; 8410  a`L.``M.``L.!!!.
	defb 01dh,050h,061h,061h,01dh,04fh,061h,060h,01dh,050h,061h,060h,01dh,04fh,061h,060h	; 8420  .Paa.Oa`.Pa`.Oa`
	defb 060h,060h,060h,060h,060h,060h,060h,060h,062h,060h,060h,060h,061h,060h,060h,014h	; 8430  ````````b```a``.
	defb 01dh,050h,061h,060h,01dh,04fh,061h,060h,01dh,050h,061h,060h,01dh,04fh,061h,060h	; 8440  .Pa`.Oa`.Pa`.Oa`
	defb 060h,060h,063h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h	; 8450  ``ca````````````
	defb 061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h	; 8460  aaa`````````````
	defb 060h,060h,032h,049h,060h,060h,033h,04ah,060h,060h,034h,049h,060h,060h,035h,04bh	; 8470  ``2I``3J``4I``5K
	defb 049h,036h,061h,060h,04bh,037h,061h,060h,049h,038h,061h,060h,04ah,039h,061h,060h	; 8480  I6a`K7a`I8a`J9a`
	defb 063h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h	; 8490  caaa````````````
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h	; 84a0  aaaa````````````
	defb 014h,021h,021h,021h,01ch,047h,049h,049h,01ch,049h,049h,049h,01ch,049h,049h,049h	; 84b0  .!!!.GII.III.III
	defb 021h,021h,021h,017h,049h,049h,049h,01dh,049h,049h,049h,01dh,049h,043h,049h,01dh	; 84c0  !!!.III.III.ICI.
	defb 078h,079h,03eh,01ch,078h,078h,03fh,01ch,078h,079h,040h,01ch,079h,064h,041h,01ch	; 84d0  xy>.xx?.xy@.ydA.
	defb 01dh,03ah,079h,078h,01dh,03bh,079h,064h,01dh,03ch,079h,078h,01dh,03dh,078h,078h	; 84e0  .:yx..yd.<yx.=xx
	defb 01ch,049h,049h,049h,01ch,046h,049h,049h,01ch,049h,049h,047h,018h,021h,021h,021h	; 84f0  .III.FII.IIG.!!!
	defb 049h,049h,049h,01dh,049h,047h,049h,01dh,049h,049h,049h,01dh,021h,021h,021h,01bh	; 8500  III.IGI.III.!!!.
	defb 078h,078h,04ch,01ch,079h,078h,04dh,01ch,064h,079h,04ch,01ch,079h,078h,04dh,01ch	; 8510  xxL.yxM.dyL.yxM.
	defb 01dh,050h,066h,078h,01dh,04fh,065h,078h,01dh,050h,065h,078h,01dh,04fh,065h,079h	; 8520  .Pfx.Oex.Pex.Oey
	defb 01dh,04fh,065h,078h,01dh,04fh,065h,079h,01dh,04fh,065h,078h,019h,021h,021h,021h	; 8530  .Oex.Oey.Oex.!!!
	defb 079h,064h,04ch,01ch,064h,064h,04dh,01ch,079h,079h,04ch,01ch,021h,021h,021h,01ah	; 8540  ydL.ddM.yyL.!!!.
	defb 061h,060h,022h,01ch,060h,060h,023h,01ch,060h,060h,024h,01ch,060h,060h,025h,01ch	; 8550  a`".``#.``$.``%.
	defb 01dh,050h,065h,064h,01dh,04fh,065h,064h,01dh,050h,065h,079h,01dh,04fh,065h,078h	; 8560  .Ped.Oed.Pey.Oex
	defb 078h,079h,079h,078h,079h,064h,064h,079h,078h,079h,079h,078h,021h,021h,021h,021h	; 8570  xyyxyddyxyyx!!!!
	defb 065h,065h,065h,01ch,079h,079h,079h,01ch,078h,078h,078h,01ch,021h,021h,021h,01ah	; 8580  eee.yyy.xxx.!!!.
	defb 078h,078h,032h,049h,064h,078h,033h,04ah,064h,078h,034h,049h,078h,079h,035h,04bh	; 8590  xx2Idx3Jdx4Ixy5K
	defb 049h,036h,065h,079h,04bh,037h,065h,064h,049h,038h,065h,079h,04ah,039h,065h,078h	; 85a0  I6eyK7edI8eyJ9ex
	defb 078h,079h,079h,078h,079h,064h,064h,079h,079h,079h,064h,064h,064h,079h,079h,079h	; 85b0  xyyxyddyyydddyyy
	defb 052h,052h,052h,052h,053h,053h,053h,053h,053h,053h,053h,053h,054h,054h,054h,054h	; 85c0  RRRRSSSSSSSSTTTT
	defb 052h,052h,0b6h,0b8h,053h,053h,0b7h,0b8h,053h,053h,0b7h,0b8h,054h,054h,0b7h,0b8h	; 85d0  RR..SS..SS..TT..
	defb 078h,079h,0b7h,0b8h,079h,064h,0b7h,0b8h,078h,079h,0b7h,0b8h,078h,078h,0b7h,0b8h	; 85e0  xy..yd..xy..xx..
	defb 065h,065h,0b7h,0b8h,064h,064h,0b7h,0b8h,079h,079h,0b7h,0b8h,078h,078h,0b7h,0b8h	; 85f0  ee..dd..yy..xx..
	defb 078h,079h,067h,065h,078h,079h,064h,079h,079h,064h,079h,078h,078h,079h,078h,078h	; 8600  xygexydyydyxxyxx
	defb 065h,065h,065h,079h,078h,079h,079h,079h,079h,064h,064h,064h,078h,079h,079h,079h	; 8610  eeeyxyyyydddxyyy
	defb 065h,065h,065h,065h,079h,079h,079h,079h,079h,064h,079h,078h,079h,064h,079h,079h	; 8620  eeeeyyyyydyxydyy
	defb 078h,078h,079h,079h,079h,079h,064h,064h,066h,078h,079h,079h,065h,078h,078h,078h	; 8630  xxyyyyddfxyyexxx
	defb 065h,079h,079h,078h,065h,064h,064h,079h,065h,064h,079h,078h,065h,079h,078h,078h	; 8640  eyyxeddyedyxeyxx
	defb 078h,079h,0b7h,0b8h,079h,064h,0b7h,0b8h,078h,079h,0b7h,0b8h,021h,021h,021h,021h	; 8650  xy..yd..xy..!!!!
	defb 0e8h,0e7h,065h,079h,0e8h,0e7h,065h,079h,0e8h,0e7h,065h,078h,021h,021h,021h,021h	; 8660  ..ey..ey..ex!!!!
	defb 0e8h,0e6h,078h,079h,0e8h,0e7h,079h,064h,0e8h,0e7h,066h,079h,0e8h,0e7h,065h,078h	; 8670  ..xy..yd..fy..ex
	defb 0e8h,0e7h,065h,079h,0e8h,0e7h,065h,078h,0e8h,0e7h,065h,079h,0e8h,0e7h,065h,078h	; 8680  ..ey..ex..ey..ex
	defb 060h,060h,063h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,014h	; 8690  ``ca```````````.
	defb 061h,061h,04ch,01ch,060h,060h,04dh,01ch,060h,060h,04ch,01ch,021h,021h,021h,01ah	; 86a0  aaL.``M.``L.!!!.
	defb 01dh,050h,052h,052h,01dh,04fh,053h,053h,01dh,050h,053h,053h,01dh,04fh,054h,054h	; 86b0  .PRR.OSS.PSS.OTT
	defb 01dh,050h,065h,065h,01dh,04fh,065h,064h,01dh,050h,065h,079h,01dh,04fh,065h,078h	; 86c0  .Pee.Oed.Pey.Oex
	defb 065h,065h,04ch,01ch,079h,078h,04dh,01ch,078h,078h,04ch,01ch,078h,079h,04dh,01ch	; 86d0  eeL.yxM.xxL.xyM.
	defb 056h,057h,057h,058h,059h,05ah,05ah,05bh,059h,05ah,05ah,05bh,05ch,05dh,05dh,05eh	; 86e0  VWWXYZZ[YZZ[\]]^
	defb 060h,060h,060h,060h,060h,060h,060h,060h,069h,069h,069h,069h,06ch,06ch,06ch,06ch	; 86f0  ````````iiiillll
	defb 060h,060h,060h,060h,060h,060h,060h,060h,068h,069h,069h,069h,06bh,06ch,06ch,06ch	; 8700  ````````hiiiklll
	defb 060h,060h,060h,060h,060h,060h,060h,060h,069h,069h,069h,06ah,06ch,06ch,06ch,06eh	; 8710  ````````iiijllln
	defb 060h,060h,060h,06eh,060h,060h,060h,06eh,069h,069h,069h,07dh,06ch,06ch,06ch,077h	; 8720  ```n```niii}lllw
	defb 06bh,061h,061h,061h,06bh,061h,060h,060h,06bh,061h,060h,060h,06bh,061h,060h,060h	; 8730  kaaaka``ka``ka``
	defb 06bh,061h,060h,060h,06bh,061h,060h,060h,06bh,061h,060h,060h,06bh,061h,060h,060h	; 8740  ka``ka``ka``ka``
	defb 061h,061h,061h,06eh,060h,060h,060h,06eh,060h,060h,060h,06eh,060h,060h,060h,06eh	; 8750  aaan```n```n```n
	defb 060h,060h,060h,06eh,060h,060h,060h,06eh,060h,060h,060h,06eh,060h,060h,060h,06eh	; 8760  ```n```n```n```n
	defb 06bh,06dh,06dh,06dh,06bh,070h,06fh,070h,06bh,071h,074h,073h,06bh,072h,073h,074h	; 8770  kmmmkpopkqtskrst
	defb 06bh,071h,073h,074h,06bh,072h,074h,073h,06bh,071h,073h,074h,06bh,072h,074h,073h	; 8780  kqstkrtskqstkrts
	defb 06dh,06dh,06dh,06eh,070h,06fh,070h,06eh,074h,073h,074h,06eh,073h,074h,073h,06eh	; 8790  mmmnpopntstnstsn
	defb 073h,074h,073h,06eh,074h,073h,074h,06eh,073h,074h,073h,06eh,074h,073h,074h,06eh	; 87a0  stsntstnstsntstn
	defb 063h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 87b0  caaa````````!!!!
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 87c0  aaaa````````!!!!
	defb 06dh,06dh,06dh,06dh,06fh,070h,06fh,070h,074h,073h,074h,073h,073h,074h,073h,074h	; 87d0  mmmmopoptstsstst
	defb 072h,073h,074h,073h,071h,074h,073h,074h,074h,073h,074h,073h,073h,074h,073h,074h	; 87e0  rstsqtsttstsstst
	defb 072h,073h,074h,073h,071h,074h,073h,074h,072h,073h,074h,073h,071h,074h,073h,074h	; 87f0  rstsqtstrstsqtst
	defb 06fh,070h,06fh,070h,072h,073h,074h,073h,071h,074h,073h,074h,072h,073h,074h,073h	; 8800  opoprstsqtstrsts
	defb 073h,074h,073h,074h,074h,073h,074h,073h,073h,074h,073h,074h,074h,073h,074h,073h	; 8810  ststtstsststtsts
	defb 061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h,021h,021h,021h,021h	; 8820  a```a```a```!!!!
	defb 062h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h	; 8830  b```a```a```a```
	defb 061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h	; 8840  a```a```a```a```
	defb 073h,074h,073h,074h,074h,073h,074h,073h,069h,069h,069h,069h,06ch,06ch,06ch,06ch	; 8850  ststtstsiiiillll
	defb 06bh,061h,060h,060h,06bh,061h,060h,060h,07ch,069h,069h,069h,07eh,06ch,06ch,06ch	; 8860  ka``ka``|iii~lll
	defb 06bh,071h,073h,074h,06bh,072h,074h,073h,07ch,069h,069h,069h,07eh,06ch,06ch,06ch	; 8870  kqstkrts|iii~lll
	defb 073h,074h,073h,06eh,074h,073h,074h,06eh,069h,069h,069h,07dh,06ch,06ch,06ch,077h	; 8880  stsntstniii}lllw
	defb 061h,061h,061h,06eh,060h,060h,060h,06eh,060h,060h,060h,06eh,021h,021h,021h,021h	; 8890  aaan```n```n!!!!
	defb 01dh,04fh,061h,060h,01dh,04fh,061h,060h,01dh,04fh,069h,069h,01dh,04fh,06ch,06ch	; 88a0  .Oa`.Oa`.Oii.Oll
	defb 060h,060h,063h,061h,060h,060h,060h,060h,069h,069h,069h,069h,06ch,06ch,06ch,06ch	; 88b0  ``ca````iiiillll
	defb 061h,061h,061h,061h,060h,060h,060h,060h,069h,069h,069h,069h,06ch,06ch,06ch,06ch	; 88c0  aaaa````iiiillll
	defb 061h,061h,061h,060h,060h,060h,060h,060h,069h,069h,069h,069h,06ch,06ch,06ch,06ch	; 88d0  aaa`````iiiillll
	defb 01dh,04fh,061h,061h,01dh,04fh,061h,060h,01dh,04fh,061h,060h,019h,021h,021h,021h	; 88e0  .Oaa.Oa`.Oa`.!!!
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,021h,017h,060h,060h	; 88f0  aaaa````````!.``
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,014h,021h	; 8900  aaaa``````````.!
	defb 061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 8910  a```````````!!!!
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,017h,060h,060h,060h	; 8920  aaaa````````.```
	defb 06fh,070h,06fh,070h,073h,074h,073h,074h,074h,073h,074h,073h,073h,074h,073h,074h	; 8930  opopststtstsstst
	defb 061h,061h,061h,061h,061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h	; 8940  aaaaa```a```a```
	defb 01dh,073h,01dh,074h,01dh,074h,01dh,073h,01dh,073h,01dh,074h,019h,021h,019h,021h	; 8950  .s.t.t.s.s.t.!.!
	defb 075h,076h,075h,076h,076h,075h,076h,075h,075h,076h,075h,076h,076h,075h,076h,075h	; 8960  uvuvvuvuuvuvvuvu
	defb 071h,075h,076h,075h,072h,076h,075h,076h,071h,075h,076h,075h,072h,076h,075h,076h	; 8970  quvurvuvquvurvuv
	defb 06fh,070h,06fh,070h,075h,076h,075h,076h,076h,075h,076h,075h,075h,076h,075h,076h	; 8980  opopuvuvvuvuuvuv
	defb 075h,076h,075h,06eh,076h,075h,076h,06eh,075h,076h,075h,06eh,076h,075h,076h,06eh	; 8990  uvunvuvnuvunvuvn
	defb 06fh,070h,06fh,06eh,075h,076h,075h,06eh,076h,075h,076h,06eh,075h,076h,075h,06eh	; 89a0  oponuvunvuvnuvun
	defb 06fh,070h,06fh,070h,072h,075h,076h,075h,071h,076h,075h,076h,072h,075h,076h,075h	; 89b0  opopruvuqvuvruvu
	defb 06bh,071h,075h,076h,06bh,072h,076h,075h,06bh,071h,075h,076h,06bh,072h,076h,075h	; 89c0  kquvkrvukquvkrvu
	defb 01dh,03ah,078h,078h,01dh,03bh,079h,078h,01dh,03ch,079h,078h,019h,021h,021h,021h	; 89d0  .:xx..yx.<yx.!!!
	defb 078h,079h,079h,079h,079h,064h,064h,064h,078h,079h,064h,079h,017h,078h,079h,078h	; 89e0  xyyyydddxydy.xyx
	defb 06dh,06dh,06dh,06dh,06fh,070h,06fh,070h,072h,073h,074h,073h,071h,074h,073h,074h	; 89f0  mmmmopoprstsqtst
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h	; 8a00  ................
	defb 013h,051h,051h,055h,056h,058h,056h,058h,059h,04eh,05fh,05bh,05ch,05eh,05ch,05eh	; 8a10  .QQUVXVXYN_[\^\^
	defb 060h,060h,063h,061h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 8a20  ``ca````````!!!!
	defb 07fh,0bah,0bbh,0ebh,080h,0bch,0bdh,0edh,081h,0beh,0bfh,0efh,082h,0c0h,0c1h,0f1h	; 8a30  ................
	defb 0eah,084h,0a0h,0d0h,0ech,085h,0a2h,0d2h,0eeh,086h,0a4h,0d4h,0f0h,087h,0a6h,0d6h	; 8a40  ................
	defb 0a8h,0a9h,0d9h,0d8h,0aah,0abh,0dbh,0dah,0aah,0abh,0dbh,0dah,0aah,0abh,0dbh,0dah	; 8a50  ................
	defb 0b2h,0b5h,0e5h,0e2h,0aah,0abh,0dbh,0dah,0aah,0abh,0dbh,0dah,0aah,0abh,0dbh,0dah	; 8a60  ................
	defb 0c2h,0c3h,0c4h,0f4h,0c5h,0c6h,0c7h,0f7h,083h,0c8h,089h,07bh,060h,063h,061h,061h	; 8a70  ...........{`caa
	defb 0f3h,0f2h,061h,061h,0f6h,0f5h,061h,060h,0f8h,088h,061h,060h,061h,061h,061h,060h	; 8a80  ..aa..a`..a`aaa`
	defb 0ach,0adh,0ddh,0dch,0aeh,001h,001h,0deh,0afh,001h,001h,0dfh,0b0h,0b1h,0e1h,0e0h	; 8a90  ................
	defb 0ach,0adh,0ddh,0dch,0aeh,001h,001h,0deh,0afh,001h,001h,0dfh,0b3h,0b4h,0e4h,0e3h	; 8aa0  ................
	defb 060h,060h,060h,060h,060h,060h,060h,060h,062h,060h,060h,060h,061h,060h,060h,060h	; 8ab0  ````````b```a```
	defb 061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h	; 8ac0  a```````````````
	defb 049h,049h,049h,049h,094h,04ah,04bh,04ah,095h,049h,049h,049h,04bh,04ah,04bh,04ah	; 8ad0  IIII.JKJ.IIIKJKJ
	defb 067h,065h,065h,065h,079h,079h,064h,064h,078h,078h,079h,079h,079h,078h,078h,078h	; 8ae0  geeeyyddxxyyyxxx
	defb 065h,078h,079h,078h,064h,079h,064h,079h,078h,079h,064h,064h,078h,078h,079h,079h	; 8af0  exyxdydyxyddxxyy
	defb 061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 8b00  aaa`````````!!!!
	defb 061h,060h,063h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h	; 8b10  a`ca````````````
	defb 060h,060h,032h,049h,060h,060h,033h,04ah,062h,060h,034h,049h,061h,060h,035h,04bh	; 8b20  ``2I``3Jb`4Ia`5K
	defb 0a0h,0d0h,04ch,01ch,0a2h,0d2h,04dh,01ch,0a4h,0d4h,04ch,01ch,0a6h,0d6h,04dh,01ch	; 8b30  ..L...M...L...M.
	defb 063h,061h,032h,049h,060h,060h,033h,04ah,060h,060h,034h,049h,060h,060h,035h,04bh	; 8b40  ca2I``3J``4I``5K
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,021h,021h,021h,021h	; 8b50  ............!!!!
	defb 060h,060h,060h,060h,062h,060h,060h,060h,061h,060h,060h,060h,021h,021h,021h,021h	; 8b60  ````b```a```!!!!
	defb 060h,060h,04ch,01ch,060h,060h,04dh,01ch,062h,060h,04ch,01ch,061h,060h,04dh,01ch	; 8b70  ``L.``M.b`L.a`M.
	defb 062h,060h,032h,049h,061h,060h,033h,04ah,061h,060h,034h,049h,061h,060h,035h,04bh	; 8b80  b`2Ia`3Ja`4Ia`5K
	defb 061h,060h,032h,049h,060h,060h,033h,04ah,060h,060h,034h,049h,060h,060h,035h,04bh	; 8b90  a`2I``3J``4I``5K
	defb 01dh,005h,061h,061h,01dh,006h,061h,060h,01dh,007h,061h,060h,01fh,008h,061h,060h	; 8ba0  ..aa..a`..a`..a`
	defb 063h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,017h,060h,060h,060h	; 8bb0  caaa````````.```
	defb 061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,014h	; 8bc0  a``````````````.
	defb 061h,060h,04ch,01ch,060h,060h,04dh,01ch,060h,060h,04ch,01ch,060h,060h,04dh,01ch	; 8bd0  a`L.``M.``L.``M.
	defb 062h,060h,04ch,01ch,061h,060h,04dh,01ch,061h,060h,04ch,01ch,061h,060h,04dh,01ch	; 8be0  b`L.a`M.a`L.a`M.
	defb 049h,049h,049h,049h,092h,04bh,04ah,04bh,093h,049h,049h,049h,04bh,04ah,04bh,04ah	; 8bf0  IIII.KJK.IIIKJKJ
	defb 049h,049h,049h,049h,046h,04bh,04ah,04bh,047h,049h,049h,049h,04bh,04ah,04bh,04ah	; 8c00  IIIIFKJKGIIIKJKJ
	defb 01dh,04fh,044h,044h,01dh,050h,044h,042h,01dh,04fh,044h,042h,01dh,050h,044h,042h	; 8c10  .ODD.PDB.ODB.PDB
	defb 01dh,04fh,044h,042h,01dh,050h,044h,042h,01dh,04fh,044h,042h,019h,021h,021h,021h	; 8c20  .ODB.PDB.ODB.!!!
	defb 042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,021h,021h,021h,021h	; 8c30  BBBBBBBBBBBB!!!!
	defb 044h,044h,044h,044h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h	; 8c40  DDDDBBBBBBBBBBBB
	defb 042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,017h,042h,042h,042h	; 8c50  BBBBBBBBBBBB.BBB
	defb 042h,042h,032h,049h,042h,042h,033h,04ah,042h,042h,034h,049h,042h,042h,035h,04bh	; 8c60  BB2IBB3JBB4IBB5K
	defb 061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,014h	; 8c70  a```a```a```a``.
	defb 061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,017h,060h,060h,060h	; 8c80  aaa`````````.```
	defb 049h,036h,061h,061h,04bh,037h,061h,060h,049h,038h,061h,060h,04ah,039h,061h,060h	; 8c90  I6aaK7a`I8a`J9a`
	defb 049h,036h,062h,060h,04bh,037h,061h,060h,049h,038h,061h,060h,04ah,039h,061h,060h	; 8ca0  I6b`K7a`I8a`J9a`
	defb 061h,060h,022h,01ch,061h,060h,023h,01ch,061h,060h,024h,01ch,061h,060h,025h,01ch	; 8cb0  a`".a`#.a`$.a`%.
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,014h	; 8cc0  aaaa```````````.
	defb 061h,061h,032h,049h,060h,060h,033h,04ah,060h,060h,034h,049h,060h,060h,035h,04bh	; 8cd0  aa2I``3J``4I``5K
	defb 01dh,04fh,062h,060h,01dh,050h,061h,060h,01dh,04fh,061h,060h,019h,021h,021h,021h	; 8ce0  .Ob`.Pa`.Oa`.!!!
	defb 060h,060h,022h,01ch,060h,060h,023h,01ch,060h,060h,024h,01ch,021h,021h,021h,01ah	; 8cf0  ``".``#.``$.!!!.
	defb 061h,060h,032h,049h,061h,060h,033h,04ah,061h,060h,034h,049h,061h,060h,035h,04bh	; 8d00  a`2Ia`3Ja`4Ia`5K
	defb 061h,060h,063h,061h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 8d10  a`ca````````!!!!
	defb 044h,044h,04ch,01ch,042h,042h,04dh,01ch,042h,042h,04ch,01ch,042h,042h,04dh,01ch	; 8d20  DDL.BBM.BBL.BBM.
	defb 045h,044h,044h,044h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h	; 8d30  EDDDBBBBBBBBBBBB
	defb 042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h	; 8d40  BBBBBBBBBBBBBBBB
	defb 01dh,04fh,044h,042h,01dh,050h,044h,042h,01dh,04fh,044h,042h,01dh,050h,044h,042h	; 8d50  .ODB.PDB.ODB.PDB
	defb 01dh,04fh,0a0h,0d0h,01dh,050h,0a2h,0d2h,01dh,04fh,0a4h,0d4h,01dh,050h,0a6h,0d6h	; 8d60  .O...P...O...P..
	defb 063h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,014h	; 8d70  caaa```````````.
	defb 060h,060h,001h,01eh,060h,060h,010h,01eh,062h,060h,011h,01eh,061h,060h,012h,01ch	; 8d80  ``..``..b`..a`..
	defb 060h,060h,063h,061h,060h,060h,060h,060h,060h,060h,060h,060h,017h,060h,060h,060h	; 8d90  ``ca````````.```
	defb 013h,051h,051h,055h,056h,058h,056h,058h,059h,04eh,05fh,05bh,021h,021h,021h,021h	; 8da0  .QQUVXVXYN_[!!!!
	defb 061h,060h,04ch,01ch,061h,060h,04dh,01ch,061h,060h,04ch,01ch,021h,021h,021h,01ah	; 8db0  a`L.a`M.a`L.!!!.
	defb 061h,061h,061h,061h,061h,060h,060h,060h,061h,060h,060h,060h,021h,021h,021h,021h	; 8dc0  aaaaa```a```!!!!
	defb 061h,061h,0a0h,0d0h,060h,060h,0a2h,0d2h,060h,060h,0a4h,0d4h,060h,060h,0a6h,0d6h	; 8dd0  aa..``..``..``..
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; 8de0  ................
	defb 0b9h,07ah,07ah,0e9h,0b9h,07ah,07ah,0e9h,0b9h,07ah,07ah,0e9h,0b9h,07ah,07ah,0e9h	; 8df0  .zz..zz..zz..zz.
	defb 049h,049h,049h,049h,049h,049h,049h,049h,049h,049h,049h,049h,021h,021h,021h,021h	; 8e00  IIIIIIIIIIII!!!!
	defb 049h,036h,071h,075h,04bh,037h,072h,076h,049h,038h,071h,075h,04ah,039h,072h,076h	; 8e10  I6quK7rvI8quJ9rv
	defb 076h,075h,032h,049h,075h,076h,033h,04ah,076h,075h,034h,049h,075h,076h,035h,04bh	; 8e20  vu2Iuv3Jvu4Iuv5K
	defb 06fh,070h,071h,075h,075h,076h,075h,076h,076h,075h,076h,075h,075h,076h,075h,076h	; 8e30  opquuvuvvuvuuvuv
	defb 075h,076h,06fh,070h,076h,075h,076h,075h,075h,076h,075h,076h,076h,075h,076h,075h	; 8e40  uvopvuvuuvuvvuvu
	defb 073h,074h,073h,074h,074h,073h,074h,073h,069h,06ah,073h,074h,06ch,06eh,074h,073h	; 8e50  ststtstsijstlnts
	defb 073h,074h,073h,074h,074h,073h,074h,073h,073h,074h,068h,069h,074h,073h,06bh,06ch	; 8e60  ststtstssthitskl
	defb 0a0h,0d0h,061h,061h,0a2h,0d2h,061h,060h,0a4h,0d4h,061h,060h,0a6h,0d6h,061h,060h	; 8e70  ..aa..a`..a`..a`
	defb 01dh,04fh,0a0h,0a1h,01dh,050h,0a2h,0a3h,01dh,04fh,0a4h,0a5h,019h,021h,021h,021h	; 8e80  .O...P...O...!!!
	defb 0d1h,0d0h,060h,060h,0d3h,0d2h,060h,060h,0d5h,0d4h,062h,060h,021h,021h,021h,021h	; 8e90  ..``..``..b`!!!!
	defb 0a0h,0d0h,04dh,01ch,0a2h,0d2h,04ch,01ch,0a4h,0d4h,04dh,01ch,021h,021h,021h,01ah	; 8ea0  ..M...L...M.!!!.
	defb 061h,060h,00ch,01ch,060h,060h,00dh,01ch,060h,060h,00eh,01ch,060h,060h,00fh,01eh	; 8eb0  a`..``..``..``..
	defb 061h,061h,04ch,01ch,061h,060h,04dh,01ch,061h,060h,04ch,01ch,061h,060h,04dh,01ch	; 8ec0  aaL.a`M.a`L.a`M.
	defb 061h,060h,04ch,01ch,061h,060h,04dh,01ch,061h,060h,04ch,01ch,061h,060h,04dh,01ch	; 8ed0  a`L.a`M.a`L.a`M.
	defb 061h,061h,061h,061h,061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,014h	; 8ee0  aaaaa```a```a``.
	defb 042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,042h,021h,017h,042h,042h	; 8ef0  BBBBBBBBBBBB!.BB
	defb 060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,014h,021h	; 8f00  ``````````````.!
	defb 060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,021h,017h,060h,060h	; 8f10  ````````````!.``
	defb 060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,060h,021h,017h,060h,060h	; 8f20  ````````````!.``
	defb 060h,060h,063h,061h,060h,060h,060h,060h,062h,060h,060h,060h,061h,060h,060h,014h	; 8f30  ``ca````b```a``.
	defb 0a0h,0d0h,032h,049h,0a2h,0d2h,033h,04ah,0a4h,0d4h,034h,049h,0a6h,0d6h,035h,04bh	; 8f40  ..2I..3J..4I..5K
	defb 049h,036h,0a0h,0d0h,04bh,037h,0a2h,0d2h,049h,038h,0a4h,0d4h,04ah,039h,0a6h,0d6h	; 8f50  I6..K7..I8..J9..
	defb 060h,060h,022h,01ch,060h,060h,023h,01ch,062h,060h,024h,01ch,061h,060h,025h,01ch	; 8f60  ``".``#.b`$.a`%.
	defb 061h,060h,00ch,01ch,061h,060h,00dh,01ch,061h,060h,00eh,01ch,061h,060h,00fh,01eh	; 8f70  a`..a`..a`..a`..
	defb 061h,060h,001h,01eh,061h,060h,010h,01eh,061h,060h,011h,01eh,061h,060h,012h,01ch	; 8f80  a`..a`..a`..a`..
	defb 060h,060h,063h,061h,060h,060h,060h,060h,060h,060h,060h,060h,021h,017h,060h,060h	; 8f90  ``ca````````!.``
	defb 061h,061h,00ch,01ch,060h,060h,00dh,01ch,060h,060h,00eh,01ch,060h,060h,00fh,01eh	; 8fa0  aa..``..``..``..
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,014h,021h,021h,021h	; 8fb0  aaaa````````.!!!
	defb 061h,061h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,017h	; 8fc0  aaaa````````!!!.
	defb 0a0h,0d0h,061h,060h,0a2h,0d2h,061h,060h,0a4h,0d4h,061h,060h,0a6h,0d6h,061h,060h	; 8fd0  ..a`..a`..a`..a`
	defb 060h,060h,0a0h,0d0h,060h,060h,0a2h,0d2h,060h,060h,0a4h,0d4h,060h,060h,0a6h,0d6h	; 8fe0  ``..``..``..``..
	defb 01dh,04fh,044h,044h,01dh,050h,044h,042h,01dh,04fh,044h,042h,019h,021h,021h,021h	; 8ff0  .ODD.PDB.ODB.!!!
	defb 044h,044h,044h,044h,042h,042h,042h,042h,042h,042h,042h,042h,021h,021h,021h,021h	; 9000  DDDDBBBBBBBB!!!!
	defb 061h,060h,063h,061h,061h,060h,060h,060h,061h,060h,060h,060h,061h,060h,060h,060h	; 9010  a`caa```a```a```
	defb 063h,061h,061h,060h,060h,060h,060h,060h,060h,060h,060h,060h,021h,021h,021h,021h	; 9020  caa`````````!!!!
	defb 063h,061h,04ch,01ch,060h,060h,04dh,01ch,060h,060h,04ch,01ch,060h,060h,04dh,01ch	; 9030  caL.``M.``L.``M.

; ----------------------------------------------------------------------
; DATOS metafichas_juego_2: las 123 metafichas del juego 2, 4 x 4 numeros de
;   ficha (16 bytes) cada una; el numero de la sala es 1-123 (p00:4CC3 resta
;   1); lo que las salas de ese juego usan como mucho; lo leen p00:4CC3 (1968
;   bytes)
;   0x9040..0x97f0  (1968 bytes)
DATA_metafichas_juego_2:
	defb 003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h	; 9040  ................
	defb 018h,005h,041h,040h,018h,006h,041h,040h,018h,007h,041h,040h,057h,008h,041h,040h	; 9050  ..A@..A@..A@W.A@
	defb 057h,001h,041h,040h,057h,009h,041h,040h,057h,00ah,041h,040h,018h,00bh,041h,040h	; 9060  W.A@W.A@W.A@..A@
	defb 040h,040h,00ch,017h,040h,040h,00dh,017h,040h,040h,00eh,017h,040h,040h,00fh,056h	; 9070  @@..@@..@@..@@.V
	defb 040h,040h,001h,056h,040h,040h,010h,056h,040h,040h,011h,056h,040h,040h,012h,017h	; 9080  @@.V@@.V@@.V@@..
	defb 043h,041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h	; 9090  CAAA@@@@@@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h	; 90a0  @@@@@@@@@@@@@@@@
	defb 018h,022h,035h,039h,018h,023h,039h,039h,018h,024h,037h,039h,018h,025h,039h,037h	; 90b0  ."59.#99.$79.%97
	defb 039h,032h,039h,039h,037h,039h,039h,037h,039h,039h,036h,039h,039h,038h,039h,039h	; 90c0  9299799799699899
	defb 039h,039h,033h,039h,039h,032h,039h,039h,039h,039h,036h,034h,039h,037h,039h,039h	; 90d0  9939929999649799
	defb 039h,039h,026h,017h,039h,037h,027h,017h,039h,039h,028h,017h,039h,039h,029h,017h	; 90e0  99&.97'.99(.99).
	defb 018h,03dh,041h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h,019h,019h,019h,019h	; 90f0  .=A@.=A@.=A@....
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,019h,019h,019h,019h	; 9100  @@@@@@@@@@@@....
	defb 041h,041h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h	; 9110  AA:.@@:.@@:.@@:.
	defb 040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,019h,019h,019h,019h	; 9120  @@:.@@:.@@:.....
	defb 040h,040h,01ah,017h,040h,040h,01bh,017h,040h,040h,01ch,017h,040h,040h,01dh,017h	; 9130  @@..@@..@@..@@..
	defb 018h,01eh,040h,040h,018h,01fh,040h,040h,018h,020h,040h,040h,018h,021h,040h,040h	; 9140  ..@@..@@. @@.!@@
	defb 018h,01eh,0a0h,0d0h,018h,01fh,0a2h,0d2h,018h,020h,0a4h,0d4h,018h,021h,0a6h,0d6h	; 9150  ......... ...!..
	defb 043h,041h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,019h,019h,019h,019h	; 9160  CA:.@@:.@@:.....
	defb 040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h	; 9170  @@:.@@:.@@:.@@:.
	defb 018h,03dh,042h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h	; 9180  .=B@.=A@.=A@.=A@
	defb 041h,041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,019h,019h,019h,019h	; 9190  AAAA@@@@@@@@....
	defb 041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,019h,019h,019h,019h	; 91a0  AAA@@@@@@@@@....
	defb 040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,015h	; 91b0  @@:.@@:.@@:.@@:.
	defb 018h,03dh,041h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h	; 91c0  .=A@.=A@.=A@.=A@
	defb 040h,040h,043h,041h,040h,040h,040h,040h,040h,040h,040h,040h,019h,019h,019h,019h	; 91d0  @@CA@@@@@@@@....
	defb 018h,03dh,041h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h,016h,03dh,041h,040h	; 91e0  .=A@.=A@.=A@.=A@
	defb 040h,040h,02ah,033h,040h,040h,02bh,032h,040h,040h,02ch,034h,040h,040h,02dh,039h	; 91f0  @@*3@@+2@@,4@@-9
	defb 039h,02eh,041h,040h,036h,02fh,041h,040h,039h,030h,041h,040h,037h,031h,041h,040h	; 9200  9.A@6/A@90A@71A@
	defb 018h,03dh,041h,041h,018h,03dh,041h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h	; 9210  .=AA.=A@.=A@.=A@
	defb 018h,03dh,042h,040h,018h,03dh,041h,040h,018h,03dh,041h,040h,019h,019h,019h,019h	; 9220  .=B@.=A@.=A@....
	defb 040h,040h,043h,041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h	; 9230  @@CA@@@@@@@@@@@@
	defb 041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h	; 9240  AAA@@@@@@@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h,042h,040h,040h,040h,041h,040h,040h,040h	; 9250  @@@@@@@@B@@@A@@@
	defb 041h,040h,040h,040h,041h,040h,040h,040h,041h,040h,040h,040h,041h,040h,040h,040h	; 9260  A@@@A@@@A@@@A@@@
	defb 041h,041h,041h,041h,041h,040h,040h,040h,041h,040h,040h,040h,041h,040h,040h,040h	; 9270  AAAAA@@@A@@@A@@@
	defb 041h,041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h	; 9280  AAAA@@@@@@@@@@@@
	defb 041h,041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,013h	; 9290  AAAA@@@@@@@@@@@.
	defb 041h,041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,014h,040h,040h,040h	; 92a0  AAAA@@@@@@@@.@@@
	defb 039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,019h,019h,019h,019h	; 92b0  999999999999....
	defb 044h,045h,044h,045h,045h,04ah,04bh,04ah,044h,04bh,04ah,04bh,045h,04ah,04bh,04ah	; 92c0  DEDEEJKJDKJKEJKJ
	defb 041h,040h,040h,043h,040h,040h,040h,040h,040h,040h,040h,040h,019h,019h,019h,019h	; 92d0  A@@C@@@@@@@@....
	defb 040h,040h,040h,02dh,040h,040h,040h,02dh,042h,040h,040h,02dh,041h,040h,040h,02dh	; 92e0  @@@-@@@-B@@-A@@-
	defb 039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h,039h	; 92f0  9999999999999999
	defb 041h,041h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,019h,019h,019h,019h	; 9300  AA:.@@:.@@:.....
	defb 041h,041h,02ah,033h,040h,040h,02bh,039h,040h,040h,02ch,037h,040h,040h,02dh,036h	; 9310  AA*3@@+9@@,7@@-6
	defb 039h,02eh,041h,041h,036h,02fh,041h,040h,039h,030h,041h,040h,037h,031h,041h,040h	; 9320  9.AA6/A@90A@71A@
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,013h	; 9330  @@@@@@@@@@@@@@@.
	defb 018h,03dh,041h,041h,018h,03dh,041h,040h,018h,03dh,041h,040h,019h,019h,019h,019h	; 9340  .=AA.=A@.=A@....
	defb 039h,02eh,042h,040h,039h,02fh,041h,040h,034h,030h,041h,040h,039h,031h,041h,040h	; 9350  9.B@9/A@40A@91A@
	defb 040h,040h,043h,041h,040h,040h,040h,040h,040h,040h,040h,040h,014h,040h,040h,040h	; 9360  @@CA@@@@@@@@.@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,014h,040h,040h,040h	; 9370  @@@@@@@@@@@@.@@@
	defb 041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,019h,019h,019h,019h	; 9380  A@@@@@@@@@@@....
	defb 044h,045h,044h,045h,045h,044h,045h,044h,044h,045h,044h,045h,045h,044h,045h,013h	; 9390  DEDEEDEDDEDEEDE.
	defb 044h,045h,044h,045h,045h,044h,045h,044h,044h,045h,044h,045h,014h,044h,045h,044h	; 93a0  DEDEEDEDDEDE.DED
	defb 044h,045h,04eh,03bh,045h,044h,04fh,03bh,044h,045h,050h,03bh,045h,044h,051h,03bh	; 93b0  DEN.EDO.DEP.EDQ.
	defb 03ch,052h,044h,045h,03ch,053h,045h,044h,03ch,054h,044h,045h,03ch,055h,045h,044h	; 93c0  <RDE<SED<TDE<UED
	defb 045h,044h,03ah,03bh,044h,045h,03ah,03bh,045h,044h,03ah,03bh,044h,045h,03ah,015h	; 93d0  ED:.DE:.ED:.DE:.
	defb 03ch,03dh,046h,044h,03ch,03dh,047h,045h,03ch,03dh,046h,044h,03ch,03dh,047h,045h	; 93e0  <=FD<=GE<=FD<=GE
	defb 044h,045h,03ah,03bh,045h,044h,03ah,03bh,044h,045h,03ah,03bh,045h,045h,03ah,03bh	; 93f0  DE:.ED:.DE:.EE:.
	defb 03ch,03dh,049h,045h,03ch,03dh,047h,044h,03ch,03dh,047h,045h,03ch,03dh,046h,044h	; 9400  <=IE<=GD<=GE<=FD
	defb 044h,045h,02ah,039h,045h,044h,02bh,039h,044h,045h,02ch,037h,045h,044h,02dh,038h	; 9410  DE*9ED+9DE,7ED-8
	defb 033h,02eh,046h,044h,034h,02fh,047h,045h,039h,030h,046h,044h,039h,031h,047h,045h	; 9420  3.FD4/GE90FD91GE
	defb 044h,045h,045h,044h,045h,044h,045h,044h,044h,045h,044h,045h,045h,044h,045h,044h	; 9430  DEEDEDEDDEDEEDED
	defb 044h,045h,048h,046h,045h,044h,045h,044h,044h,045h,044h,045h,045h,044h,045h,044h	; 9440  DEHFEDEDDEDEEDED
	defb 047h,046h,047h,046h,045h,044h,045h,044h,044h,045h,044h,045h,045h,044h,045h,044h	; 9450  GFGFEDEDDEDEEDED
	defb 047h,046h,047h,045h,045h,044h,045h,044h,044h,045h,044h,045h,045h,044h,045h,044h	; 9460  GFGEEDEDDEDEEDED
	defb 044h,045h,044h,045h,045h,044h,045h,044h,044h,045h,044h,045h,03eh,03eh,03eh,03eh	; 9470  DEDEEDEDDEDE>>>>
	defb 04ah,04bh,04ah,04bh,04bh,04ah,04bh,04ah,04ah,04bh,04ah,04bh,03eh,03eh,03eh,03eh	; 9480  JKJKKJKJJKJK>>>>
	defb 04bh,04ah,04bh,04ah,04ah,04bh,04ah,04bh,04bh,04ah,04bh,04ah,04ah,04bh,04ah,04bh	; 9490  KJKJJKJKKJKJJKJK
	defb 044h,045h,044h,045h,04bh,04ah,04bh,04ah,04ah,04bh,04ah,04bh,04bh,04ah,04bh,04ah	; 94a0  DEDEKJKJJKJKKJKJ
	defb 046h,047h,03ah,03bh,044h,045h,03ah,03bh,045h,044h,03ah,03bh,044h,045h,03ah,03bh	; 94b0  FG:.DE:.ED:.DE:.
	defb 03ch,03dh,046h,047h,03ch,03dh,047h,044h,03ch,03dh,046h,045h,03ch,03dh,047h,044h	; 94c0  <=FG<=GD<=FE<=GD
	defb 03ch,03dh,046h,044h,03ch,03dh,047h,045h,03ch,03dh,046h,044h,03eh,03eh,03eh,03eh	; 94d0  <=FD<=GE<=FD>>>>
	defb 045h,044h,03ah,03bh,044h,045h,03ah,03bh,045h,044h,03ah,03bh,03eh,03eh,03eh,03eh	; 94e0  ED:.DE:.ED:.>>>>
	defb 039h,039h,033h,039h,094h,034h,039h,039h,095h,039h,039h,039h,039h,039h,039h,038h	; 94f0  9939.499.9999998
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h	; 9500  ................
	defb 044h,045h,044h,045h,045h,044h,045h,044h,049h,045h,044h,045h,046h,044h,045h,044h	; 9510  DEDEEDEDIEDEFDED
	defb 047h,045h,044h,045h,045h,044h,045h,044h,044h,044h,044h,045h,045h,044h,045h,044h	; 9520  GEDEEDEDDDDEEDED
	defb 0a8h,0a9h,0d9h,0d8h,0aah,0abh,0dbh,0dah,0aah,0abh,0dbh,0dah,0aah,0abh,0dbh,0dah	; 9530  ................
	defb 039h,039h,039h,039h,039h,039h,039h,039h,0b2h,0b5h,0e5h,0e2h,0aah,0abh,0dbh,0dah	; 9540  99999999........
	defb 04ah,04bh,04ah,04bh,04bh,04ah,04bh,04ah,04dh,04bh,04ah,04bh,045h,04ah,04bh,04ah	; 9550  JKJKKJKJMKJKEJKJ
	defb 045h,04bh,04bh,04bh,045h,04bh,04bh,04bh,044h,04bh,04ah,04bh,04bh,04ah,04bh,04ah	; 9560  EKKKEKKKDKJKKJKJ
	defb 0ach,0adh,0ddh,0dch,0aeh,001h,001h,0deh,0afh,001h,001h,0dfh,0b0h,0b1h,0e1h,0e0h	; 9570  ................
	defb 0aah,0abh,0dbh,0dah,0aah,0abh,0dbh,0dah,0ach,0adh,0ddh,0dch,0aeh,001h,001h,0deh	; 9580  ................
	defb 046h,045h,044h,045h,047h,045h,045h,044h,046h,045h,044h,045h,047h,044h,045h,044h	; 9590  FEDEGEEDFEDEGDED
	defb 044h,04bh,04ah,04bh,045h,04ah,04bh,04bh,044h,04bh,04ah,04bh,045h,04ah,04bh,04ah	; 95a0  DKJKEJKKDKJKEJKJ
	defb 048h,046h,047h,046h,045h,044h,045h,044h,044h,045h,044h,045h,045h,045h,045h,044h	; 95b0  HFGFEDEDDEDEEEED
	defb 0afh,001h,001h,0dfh,0b3h,0b4h,0e4h,0e3h,04ch,044h,045h,044h,04bh,04ah,04bh,04ah	; 95c0  ........LDEDKJKJ
	defb 041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,013h	; 95d0  AAA@@@@@@@@@@@@.
	defb 018h,03dh,0a0h,0d0h,018h,03dh,0a2h,0d2h,018h,03dh,0a4h,0d4h,018h,03dh,0a6h,0d6h	; 95e0  .=...=...=...=..
	defb 018h,03dh,041h,058h,018h,03dh,041h,058h,018h,03dh,041h,058h,019h,019h,019h,019h	; 95f0  .=AX.=AX.=AX....
	defb 058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h	; 9600  XXXXXXXXXXXXXXXX
	defb 058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,058h,019h,019h,019h,019h	; 9610  XXXXXXXXXXXX....
	defb 058h,058h,03ah,017h,058h,058h,03ah,017h,058h,058h,03ah,017h,019h,019h,019h,019h	; 9620  XX:.XX:.XX:.....
	defb 0a0h,0d0h,03ah,017h,0a2h,0d2h,03ah,017h,0a4h,0d4h,03ah,017h,0a6h,0d6h,03ah,017h	; 9630  ..:...:...:...:.
	defb 043h,041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,019h,019h,019h,019h	; 9640  CAAA@@@@@@@@....
	defb 041h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h	; 9650  A@@@@@@@@@@@@@@@
	defb 041h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h	; 9660  A@:.@@:.@@:.@@:.
	defb 040h,040h,03ah,017h,040h,040h,03ah,017h,042h,040h,03ah,017h,041h,040h,03ah,017h	; 9670  @@:.@@:.B@:.A@:.
	defb 041h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,019h,019h,019h,019h	; 9680  A@:.@@:.@@:.....
	defb 018h,03dh,0a0h,0d0h,018h,03dh,0a2h,0d2h,018h,03dh,0a4h,0d4h,019h,019h,019h,019h	; 9690  .=...=...=......
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,019h,019h,019h,019h	; 96a0  ................
	defb 0a0h,0d0h,03ah,017h,0a2h,0d2h,03ah,017h,0a4h,0d4h,03ah,017h,019h,019h,019h,019h	; 96b0  ..:...:...:.....
	defb 0a0h,0d0h,01ah,017h,0a2h,0d2h,01bh,017h,0a4h,0d4h,01ch,017h,0a6h,0d6h,01dh,017h	; 96c0  ................
	defb 041h,040h,043h,041h,041h,040h,040h,040h,041h,040h,040h,040h,041h,040h,040h,040h	; 96d0  A@CAA@@@A@@@A@@@
	defb 041h,040h,02ah,039h,041h,040h,02bh,039h,041h,040h,02ch,039h,041h,040h,02dh,039h	; 96e0  A@*9A@+9A@,9A@-9
	defb 041h,040h,03ah,017h,041h,040h,03ah,017h,041h,040h,03ah,017h,041h,040h,03ah,017h	; 96f0  A@:.A@:.A@:.A@:.
	defb 040h,040h,03ah,017h,040h,040h,03ah,017h,042h,040h,03ah,017h,041h,040h,03ah,017h	; 9700  @@:.@@:.B@:.A@:.
	defb 041h,040h,01ah,017h,040h,040h,01bh,017h,040h,040h,01ch,017h,040h,040h,01dh,017h	; 9710  A@..@@..@@..@@..
	defb 041h,040h,040h,040h,041h,040h,040h,040h,041h,040h,040h,040h,041h,040h,040h,013h	; 9720  A@@@A@@@A@@@A@@.
	defb 041h,041h,041h,041h,040h,040h,040h,040h,040h,040h,040h,040h,019h,014h,040h,040h	; 9730  AAAA@@@@@@@@..@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,019h,014h,040h,040h	; 9740  @@@@@@@@@@@@..@@
	defb 041h,041h,03ah,017h,041h,040h,03ah,017h,041h,040h,03ah,017h,041h,040h,03ah,017h	; 9750  AA:.A@:.A@:.A@:.
	defb 043h,041h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h,040h,040h,03ah,017h	; 9760  CA:.@@:.@@:.@@:.
	defb 040h,040h,0a0h,0d0h,040h,040h,0a2h,0d2h,040h,040h,0a4h,0d4h,040h,040h,0a6h,0d6h	; 9770  @@..@@..@@..@@..
	defb 0a0h,0d0h,040h,040h,0a2h,0d2h,040h,040h,0a4h,0d4h,042h,040h,0a6h,0d6h,041h,040h	; 9780  ..@@..@@..B@..A@
	defb 0a0h,0d0h,041h,040h,0a2h,0d2h,041h,040h,0a4h,0d4h,041h,040h,0a6h,0d6h,041h,040h	; 9790  ..A@..A@..A@..A@
	defb 0a0h,0d0h,03ah,017h,0a2h,0d2h,03ah,017h,0a4h,0d4h,03ah,017h,0a6h,0d6h,03ah,017h	; 97a0  ..:...:...:...:.
	defb 018h,03dh,0a0h,0d0h,018h,03dh,0a2h,0d2h,018h,03dh,0a4h,0d4h,018h,03dh,0a6h,0d6h	; 97b0  .=...=...=...=..
	defb 046h,047h,046h,045h,047h,044h,045h,044h,046h,045h,044h,045h,047h,044h,045h,044h	; 97c0  FGFEGDEDFEDEGDED
	defb 039h,02eh,046h,047h,039h,02fh,047h,044h,039h,030h,046h,045h,039h,031h,047h,044h	; 97d0  9.FG9/GD90FE91GD
	defb 048h,047h,02ah,039h,044h,045h,02bh,039h,045h,044h,02ch,039h,044h,045h,02dh,039h	; 97e0  HG*9DE+9ED,9DE-9

; ----------------------------------------------------------------------
; DATOS metafichas_juego_3: las 106 metafichas del juego 3, 4 x 4 numeros de
;   ficha (16 bytes) cada una; el numero de la sala es 1-106 (p00:4CC3 resta
;   1); lo que las salas de ese juego usan como mucho; lo leen p00:4CC3 (1696
;   bytes)
;   0x97f0..0x9e90  (1696 bytes)
DATA_metafichas_juego_3:
	defb 003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h	; 97f0  ................
	defb 013h,005h,046h,045h,013h,006h,046h,045h,013h,007h,046h,045h,039h,008h,046h,045h	; 9800  ..FE..FE..FE9.FE
	defb 039h,001h,046h,045h,039h,009h,046h,045h,039h,00ah,046h,045h,013h,00bh,046h,045h	; 9810  9.FE9.FE9.FE..FE
	defb 045h,045h,00ch,013h,045h,045h,00dh,013h,045h,045h,00eh,013h,045h,045h,00fh,039h	; 9820  EE..EE..EE..EE.9
	defb 045h,045h,001h,039h,045h,045h,010h,039h,045h,045h,011h,039h,045h,045h,012h,013h	; 9830  EE.9EE.9EE.9EE..
	defb 048h,046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9840  HFFFEEEEEEEEEEEE
	defb 045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9850  EEEEEEEEEEEEEEEE
	defb 02eh,02fh,02ch,02dh,04ch,037h,04ah,04bh,050h,037h,04eh,04fh,054h,037h,052h,053h	; 9860  ./,-L7JKP7NOT7RS
	defb 02eh,02fh,02ch,02dh,04ch,04dh,04ah,04bh,050h,051h,04eh,04fh,054h,055h,052h,053h	; 9870  ./,-LMJKPQNOTURS
	defb 046h,037h,046h,046h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h	; 9880  F7FFE7IEE7IEE7IE
	defb 013h,01ch,02ch,02dh,013h,01dh,04ah,04bh,013h,01eh,04eh,04fh,013h,01fh,052h,053h	; 9890  ..,-..JK..NO..RS
	defb 045h,037h,049h,045h,045h,037h,049h,045h,045h,041h,042h,042h,045h,044h,044h,044h	; 98a0  E7IEE7IEEABBEDDD
	defb 045h,045h,045h,045h,045h,045h,045h,045h,042h,042h,042h,042h,044h,044h,044h,044h	; 98b0  EEEEEEEEBBBBDDDD
	defb 046h,046h,037h,046h,045h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h	; 98c0  FF7FEE7IEE7IEE7I
	defb 046h,046h,056h,013h,045h,045h,057h,013h,045h,045h,058h,013h,045h,045h,059h,013h	; 98d0  FFV.EEW.EEX.EEY.
	defb 045h,045h,014h,013h,045h,045h,015h,013h,045h,045h,016h,013h,045h,045h,017h,013h	; 98e0  EE..EE..EE..EE..
	defb 013h,018h,045h,045h,013h,019h,045h,045h,013h,01ah,045h,045h,013h,01bh,045h,045h	; 98f0  ..EE..EE..EE..EE
	defb 002h,034h,035h,035h,002h,037h,038h,038h,002h,037h,044h,044h,045h,037h,03ah,03ah	; 9900  .455.788.7DDE7::
	defb 035h,035h,035h,035h,038h,038h,038h,038h,044h,044h,044h,044h,03ah,03ah,03ah,03ah	; 9910  55558888DDDD::::
	defb 045h,045h,056h,013h,045h,045h,057h,013h,045h,045h,058h,013h,045h,045h,059h,013h	; 9920  EEV.EEW.EEX.EEY.
	defb 013h,05ah,047h,045h,013h,05bh,046h,045h,013h,05ch,046h,045h,013h,05dh,046h,045h	; 9930  .ZGE.[FE.\FE.]FE
	defb 045h,037h,049h,049h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h	; 9940  E7IIE7IEE7IEE7IE
	defb 049h,049h,049h,049h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9950  IIIIEEEEEEEEEEEE
	defb 045h,045h,024h,02eh,045h,045h,025h,04ch,045h,045h,026h,050h,045h,045h,027h,054h	; 9960  EE$.EE%LEE&PEE'T
	defb 02fh,028h,046h,045h,04dh,029h,046h,045h,051h,02ah,046h,045h,055h,02bh,046h,045h	; 9970  /(FEM)FEQ*FEU+FE
	defb 035h,035h,036h,002h,038h,038h,037h,002h,044h,044h,037h,002h,03ah,03ah,037h,049h	; 9980  556.887.DD7.::7I
	defb 013h,05ah,046h,045h,013h,05bh,046h,045h,013h,05ch,046h,045h,013h,05dh,046h,045h	; 9990  .ZFE.[FE.\FE.]FE
	defb 045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h	; 99a0  EEEEEEEEEEEEEEE.
	defb 045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,045h,045h,045h	; 99b0  EEEEEEEEEEEE.EEE
	defb 049h,049h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h	; 99c0  II7IEE7IEE7IEE7I
	defb 045h,045h,042h,042h,045h,045h,044h,044h,045h,045h,044h,044h,045h,045h,03ah,03ah	; 99d0  EEBBEEDDEEDDEE::
	defb 013h,05ah,046h,046h,013h,05bh,046h,045h,013h,05ch,046h,045h,013h,05dh,046h,045h	; 99e0  .ZFF.[FE.\FE.]FE
	defb 02eh,02fh,02ch,02dh,04ch,04dh,037h,04bh,050h,051h,037h,04fh,054h,055h,037h,053h	; 99f0  ./,-LM7KPQ7OTU7S
	defb 045h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h	; 9a00  EE7IEE7IEE7IEE7I
	defb 045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,013h,013h	; 9a10  EEEEEEEEEEEE....
	defb 038h,038h,038h,038h,038h,038h,038h,038h,038h,038h,038h,038h,013h,013h,013h,013h	; 9a20  888888888888....
	defb 045h,045h,048h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9a30  EEHFEEEEEEEEEEEE
	defb 046h,046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9a40  FFFFEEEEEEEEEEEE
	defb 046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9a50  FFFEEEEEEEEEEEEE
	defb 045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h,013h,013h,013h,013h	; 9a60  E7IEE7IEE7IE....
	defb 045h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,013h,013h,013h,013h	; 9a70  EE7IEE7IEE7I....
	defb 045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h	; 9a80  E7IEE7IEE7IEE7IE
	defb 045h,045h,048h,046h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,013h,013h	; 9a90  EEHFEEEEEEEE....
	defb 046h,046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,013h,013h	; 9aa0  FFFFEEEEEEEE....
	defb 046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,013h,013h	; 9ab0  FFFEEEEEEEEE....
	defb 013h,018h,045h,045h,013h,019h,045h,045h,013h,042h,042h,042h,013h,044h,044h,044h	; 9ac0  ..EE..EE.BBB.DDD
	defb 045h,045h,037h,049h,045h,045h,037h,049h,042h,042h,043h,049h,044h,044h,03fh,049h	; 9ad0  EE7IEE7IBBCIDD?I
	defb 045h,045h,048h,046h,045h,045h,045h,045h,042h,042h,042h,042h,044h,044h,044h,044h	; 9ae0  EEHFEEEEBBBBDDDD
	defb 046h,046h,046h,045h,045h,045h,045h,045h,042h,042h,042h,042h,044h,044h,044h,044h	; 9af0  FFFEEEEEBBBBDDDD
	defb 02fh,028h,047h,045h,04dh,029h,046h,045h,051h,02ah,046h,045h,055h,02bh,046h,045h	; 9b00  /(GEM)FEQ*FEU+FE
	defb 049h,049h,049h,049h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h	; 9b10  IIIIEEEEEEEEEEE.
	defb 049h,049h,049h,049h,045h,045h,045h,045h,045h,045h,045h,045h,013h,045h,045h,045h	; 9b20  IIIIEEEEEEEE.EEE
	defb 046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,045h,045h,045h	; 9b30  FFFEEEEEEEEE.EEE
	defb 042h,042h,049h,045h,044h,044h,049h,045h,044h,044h,049h,045h,03ah,03ah,049h,045h	; 9b40  BBIEDDIEDDIE::IE
	defb 049h,049h,049h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9b50  IIIEEEEEEEEEEEEE
	defb 02ch,02dh,020h,013h,04ah,04bh,021h,013h,04eh,04fh,022h,013h,052h,053h,023h,013h	; 9b60  ,- .JK!.NO".RS#.
	defb 042h,042h,046h,046h,044h,044h,049h,045h,044h,044h,049h,045h,03ah,03ah,049h,045h	; 9b70  BBFFDDIEDDIE::IE
	defb 013h,05ah,047h,045h,013h,05bh,046h,045h,013h,05ch,046h,045h,013h,013h,013h,013h	; 9b80  .ZGE.[FE.\FE....
	defb 046h,046h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,013h,013h,013h,013h	; 9b90  FF7IEE7IEE7I....
	defb 060h,061h,062h,060h,063h,064h,065h,066h,063h,064h,065h,066h,066h,067h,068h,063h	; 9ba0  `ab`cdefcdeffghc
	defb 062h,060h,061h,062h,068h,063h,064h,065h,068h,063h,064h,065h,065h,066h,067h,068h	; 9bb0  b`abhcdehcdeefgh
	defb 069h,06ah,06bh,06ch,030h,031h,04dh,04ah,05eh,050h,051h,04eh,053h,054h,055h,052h	; 9bc0  ijkl01MJ^PQNSTUR
	defb 06dh,06eh,03ch,03dh,04bh,04ch,032h,033h,04fh,050h,051h,05fh,053h,054h,055h,052h	; 9bd0  mn<=KL23OPQ_STUR
	defb 046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h	; 9be0  FEEEEEEEEEEEEEEE
	defb 045h,045h,045h,045h,045h,045h,045h,045h,047h,045h,045h,045h,046h,045h,045h,045h	; 9bf0  EEEEEEEEGEEEFEEE
	defb 046h,045h,045h,045h,046h,045h,045h,045h,046h,045h,045h,045h,046h,045h,045h,045h	; 9c00  FEEEFEEEFEEEFEEE
	defb 046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,013h,013h	; 9c10  FEEEEEEEEEEE....
	defb 048h,046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,013h,013h	; 9c20  HFFFEEEEEEEE....
	defb 046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,045h,045h,045h	; 9c30  FEEEEEEEEEEE.EEE
	defb 046h,046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h	; 9c40  FFFFEEEEEEEEEEE.
	defb 046h,046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,013h,045h,045h,045h	; 9c50  FFFFEEEEEEEE.EEE
	defb 046h,046h,046h,046h,045h,045h,045h,045h,042h,042h,042h,042h,044h,044h,044h,044h	; 9c60  FFFFEEEEBBBBDDDD
	defb 046h,046h,046h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h	; 9c70  FFFEEEEEEEEEEEE.
	defb 046h,045h,014h,013h,045h,045h,015h,013h,045h,045h,016h,013h,013h,013h,013h,013h	; 9c80  FE..EE..EE......
	defb 049h,049h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,013h,013h,013h,013h	; 9c90  II7IEE7IEE7I....
	defb 049h,049h,049h,049h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,013h,013h	; 9ca0  IIIIEEEEEEEE....
	defb 045h,045h,045h,045h,047h,045h,045h,045h,046h,045h,045h,045h,046h,045h,045h,013h	; 9cb0  EEEEGEEEFEEEFEE.
	defb 02eh,02fh,02ch,02dh,092h,04dh,04ah,04bh,093h,051h,04eh,04fh,054h,055h,052h,053h	; 9cc0  ./,-.MJK.QNOTURS
	defb 040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h	; 9cd0  @@@@@@@@@@@@@@@@
	defb 040h,040h,040h,040h,040h,040h,040h,040h,042h,042h,042h,042h,044h,044h,044h,044h	; 9ce0  @@@@@@@@BBBBDDDD
	defb 02ch,02dh,020h,013h,094h,04bh,021h,013h,095h,04fh,022h,013h,052h,053h,023h,013h	; 9cf0  ,- ..K!..O".RS#.
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h	; 9d00  ................
	defb 0a0h,0d0h,0a0h,0d0h,0a2h,0d2h,0a2h,0d2h,0a4h,0d4h,0a4h,0d4h,0a6h,0d6h,0a6h,0d6h	; 9d10  ................
	defb 048h,046h,046h,046h,045h,045h,045h,045h,042h,042h,042h,042h,044h,044h,044h,044h	; 9d20  HFFFEEEEBBBBDDDD
	defb 046h,045h,045h,045h,045h,045h,045h,045h,042h,042h,042h,042h,044h,044h,044h,044h	; 9d30  FEEEEEEEBBBBDDDD
	defb 046h,046h,024h,02eh,045h,045h,025h,04ch,045h,045h,026h,050h,045h,045h,027h,054h	; 9d40  FF$.EE%LEE&PEE'T
	defb 042h,037h,049h,045h,044h,037h,049h,045h,044h,037h,049h,045h,03ah,037h,013h,013h	; 9d50  B7IED7IED7IE:7..
	defb 045h,045h,045h,045h,045h,045h,045h,045h,042h,037h,045h,045h,044h,037h,045h,045h	; 9d60  EEEEEEEEB7EED7EE
	defb 02eh,02fh,02ch,02dh,04ch,04dh,04ah,04bh,0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h	; 9d70  ./,-LMJK........
	defb 0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h,0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h	; 9d80  ................
	defb 0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h,048h,046h,046h,046h,045h,045h,045h,045h	; 9d90  ........HFFFEEEE
	defb 0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h,046h,046h,046h,046h,045h,045h,045h,045h	; 9da0  ........FFFFEEEE
	defb 046h,045h,045h,045h,046h,045h,045h,045h,046h,045h,045h,045h,045h,045h,045h,045h	; 9db0  FEEEFEEEFEEEEEEE
	defb 046h,046h,046h,046h,046h,045h,045h,045h,046h,045h,045h,045h,046h,045h,045h,045h	; 9dc0  FFFFFEEEFEEEFEEE
	defb 047h,045h,045h,045h,046h,045h,045h,045h,046h,045h,045h,045h,046h,045h,045h,045h	; 9dd0  GEEEFEEEFEEEFEEE
	defb 0a0h,0d0h,056h,013h,0a2h,0d2h,057h,013h,0a4h,0d4h,058h,013h,0a6h,0d6h,059h,013h	; 9de0  ..V...W...X...Y.
	defb 045h,037h,0a0h,0d0h,045h,037h,0a2h,0d2h,045h,037h,0a4h,0d4h,045h,037h,0a6h,0d6h	; 9df0  E7..E7..E7..E7..
	defb 045h,037h,046h,046h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h	; 9e00  E7FFE7IEE7IEE7IE
	defb 046h,046h,00ch,013h,045h,045h,00dh,013h,045h,045h,00eh,013h,045h,045h,00fh,039h	; 9e10  FF..EE..EE..EE.9
	defb 045h,045h,048h,046h,045h,045h,045h,045h,047h,045h,045h,045h,046h,045h,045h,045h	; 9e20  EEHFEEEEGEEEFEEE
	defb 0a0h,0d0h,037h,049h,0a2h,0d2h,037h,049h,0a4h,0d4h,037h,049h,0a6h,0d6h,037h,049h	; 9e30  ..7I..7I..7I..7I
	defb 048h,046h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h,045h,045h,037h,049h	; 9e40  HF7IEE7IEE7IEE7I
	defb 045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h	; 9e50  EEEEEEEEEEEEEE..
	defb 045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,045h,013h,013h,045h,045h	; 9e60  EEEEEEEEEEEE..EE
	defb 02eh,02fh,02ch,02dh,094h,04dh,04ah,04bh,095h,051h,04eh,04fh,054h,055h,052h,053h	; 9e70  ./,-.MJK.QNOTURS
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; 9e80  ................

; ----------------------------------------------------------------------
; DATOS metafichas_juego_4: las 18 metafichas del juego 4, 4 x 4 numeros de
;   ficha (16 bytes) cada una; el numero de la sala es 1-18 (p00:4CC3 resta
;   1); lo que las salas de ese juego usan como mucho; lo leen p00:4CC3 (288
;   bytes)
;   0x9e90..0x9fb0  (288 bytes)
DATA_metafichas_juego_4:
	defb 00ch,00dh,00eh,00fh,010h,011h,012h,013h,00eh,00fh,00ch,00dh,011h,013h,010h,011h	; 9e90  ................
	defb 00ch,00eh,00fh,016h,010h,011h,013h,016h,00fh,00ch,00fh,016h,013h,010h,013h,016h	; 9ea0  ................
	defb 016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h	; 9eb0  ................
	defb 016h,003h,016h,016h,016h,003h,016h,016h,016h,003h,016h,016h,016h,003h,016h,016h	; 9ec0  ................
	defb 010h,013h,010h,013h,016h,00ch,00eh,00fh,016h,00ch,00fh,00ch,016h,010h,013h,010h	; 9ed0  ................
	defb 00ch,00dh,00fh,016h,010h,011h,013h,016h,00fh,00ch,00fh,016h,013h,010h,013h,00ch	; 9ee0  ................
	defb 016h,003h,016h,016h,016h,003h,016h,016h,016h,003h,016h,016h,00eh,00fh,00ch,00dh	; 9ef0  ................
	defb 016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,00eh,00fh,00ch,00dh	; 9f00  ................
	defb 016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,016h,00ch,00fh,00ch,00dh	; 9f10  ................
	defb 00ah,00bh,00eh,00fh,00ch,00fh,00ch,00eh,010h,013h,010h,012h,016h,016h,016h,016h	; 9f20  ................
	defb 00ch,00eh,00dh,00fh,00dh,00fh,00ch,00eh,011h,013h,010h,012h,016h,016h,016h,016h	; 9f30  ................
	defb 016h,00ah,00eh,00fh,016h,010h,011h,013h,016h,00ah,00fh,00ch,016h,010h,013h,010h	; 9f40  ................
	defb 00ch,00fh,004h,005h,010h,013h,006h,007h,00fh,00ch,00fh,016h,013h,010h,013h,00ch	; 9f50  ................
	defb 00ch,00fh,004h,005h,010h,013h,014h,015h,00fh,00ch,00fh,016h,013h,010h,013h,016h	; 9f60  ................
	defb 00ch,00dh,00eh,00fh,010h,011h,012h,013h,00fh,00ch,00fh,016h,013h,010h,013h,016h	; 9f70  ................
	defb 00eh,00fh,00ch,00dh,00ch,00dh,00eh,00fh,010h,011h,011h,013h,016h,003h,016h,016h	; 9f80  ................
	defb 016h,008h,009h,001h,016h,008h,009h,001h,016h,008h,009h,001h,016h,008h,009h,001h	; 9f90  ................
	defb 016h,017h,009h,001h,016h,017h,009h,001h,016h,008h,009h,001h,016h,008h,009h,001h	; 9fa0  ................

; ----------------------------------------------------------------------
; DATOS metafichas_juego_5: las 96 metafichas del juego 5, 4 x 4 numeros de
;   ficha (16 bytes) cada una; el numero de la sala es 1-96 (p00:4CC3 resta
;   1); lo que las salas de ese juego usan como mucho (sigue en el banco 15,
;   en 0xA000); lo leen p00:4CC3 (80 bytes)
;   0x9fb0..0xa000  (80 bytes)
DATA_metafichas_juego_5:
	defb 003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h,003h,001h,001h,004h	; 9fb0  ................
	defb 014h,005h,035h,034h,014h,006h,035h,034h,014h,007h,035h,034h,016h,008h,035h,034h	; 9fc0  ..54..54..54..54
	defb 016h,001h,035h,034h,016h,009h,035h,034h,016h,00ah,035h,034h,014h,00bh,035h,034h	; 9fd0  ..54..54..54..54
	defb 034h,034h,00ch,013h,034h,034h,00dh,013h,034h,034h,00eh,013h,034h,034h,00fh,015h	; 9fe0  44..44..44..44..
	defb 034h,034h,001h,015h,034h,034h,010h,015h,034h,034h,011h,015h,034h,034h,012h,013h	; 9ff0  44..44..44..44..
