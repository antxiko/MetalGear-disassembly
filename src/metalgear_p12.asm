; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 12 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS patrones_9F43_cola: patrones de sprite comprimidos (n < 0x80 repite el
;   byte siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n &
;   0x7F bytes, 0 acaba; L_4DD5): juego 4, patron 96 (sigue del banco 11); lo
;   leen p00:4DD5 (306 bytes)
;   0xa000..0xa132  (306 bytes)
DATA_patrones_9F43_cola:
	defb 002h,007h,01eh,01dh,0f7h,043h,0b0h,002h,003h,004h,003h,000h,030h,078h,04ch,008h	; a000  .....C......0xL.
	defb 0f8h,0b0h,0f0h,0d0h,0ech,09fh,08ch,0c6h,060h,0e0h,0c0h,004h,000h,09ch,002h,001h	; a010  ........`.......
	defb 00bh,01fh,066h,014h,0e3h,0d0h,003h,007h,007h,002h,000h,0d0h,088h,0c4h,018h,0c8h	; a020  ..f.............
	defb 050h,000h,078h,0f8h,094h,048h,0a4h,080h,020h,040h,003h,000h,003h,001h,088h,023h	; a030  P.x..H.. @.....#
	defb 042h,047h,0c5h,063h,06eh,01ch,001h,003h,000h,08fh,028h,070h,0d2h,0a1h,0c5h,06bh	; a040  BG.cn.....(p...k
	defb 0e7h,0ebh,0d6h,0ach,090h,09ch,086h,080h,080h,005h,000h,088h,023h,0e5h,087h,084h	; a050  ............#...
	defb 006h,02dh,053h,01dh,004h,000h,08dh,058h,088h,07ah,0a3h,0ceh,0ach,020h,07dh,0dah	; a060  .-S....X.z... }.
	defb 0ech,0b0h,084h,082h,005h,000h,002h,001h,09bh,003h,007h,002h,007h,035h,067h,067h	; a070  .............5gg
	defb 03ch,010h,000h,000h,050h,060h,050h,0d0h,080h,0c2h,06dh,0e5h,0fbh,0cfh,046h,0a0h	; a080  <...P`P...m...F.
	defb 070h,078h,028h,020h,003h,000h,0b0h,001h,003h,001h,00bh,007h,074h,056h,000h,04ah	; a090  px( ........tV.J
	defb 02ch,010h,000h,000h,030h,0b0h,0a0h,050h,000h,0c6h,0afh,02eh,06ch,0d1h,0cah,0e0h	; a0a0  ,...0..P....l...
	defb 0d0h,028h,000h,000h,002h,00fh,00ch,010h,018h,01bh,00dh,027h,0ffh,003h,005h,01ah	; a0b0  .(.........'....
	defb 015h,036h,023h,001h,000h,080h,040h,003h,000h,0bah,0c0h,078h,0b8h,0ech,0d6h,00ch	; a0c0  .6#...@....x....
	defb 042h,0a0h,0c8h,0f0h,001h,008h,004h,018h,014h,017h,00ah,01ch,03eh,007h,00dh,00bh	; a0d0  B...........>...
	defb 007h,015h,022h,001h,0c0h,040h,060h,000h,000h,0c0h,0a0h,0e0h,074h,02ah,0d8h,00ah	; a0e0  .."..@`.....t*..
	defb 06eh,060h,038h,010h,000h,00ch,01eh,032h,010h,01fh,00dh,00fh,00bh,037h,0f9h,031h	; a0f0  n`8....2.....7.1
	defb 063h,006h,007h,003h,005h,000h,09bh,040h,0e0h,078h,0b8h,0efh,0c2h,00dh,040h,0c0h	; a100  c......@.x....@.
	defb 020h,0c0h,000h,00bh,011h,023h,018h,013h,00ah,000h,01eh,01fh,029h,012h,025h,001h	; a110   ....#......).%.
	defb 004h,002h,004h,000h,08ch,040h,080h,0d0h,0f8h,066h,028h,0c7h,00bh,0c0h,0e0h,0e0h	; a120  .....@...f(.....
	defb 040h,000h	; a130

; ----------------------------------------------------------------------
; DATOS laseres_de_las_salas_18_1a: los laseres de las salas 0x18 (0xA132),
;   0x19 (0xA15D) y 0x1A (0xA181): [cuantos] y sus fichas, que p00:5433 copia
;   a 0xD000; lo leen p00:5425 (150 bytes)
;   0xa132..0xa1c8  (150 bytes)
DATA_laseres_de_las_salas_18_1a:
	defb 006h,001h,010h,06fh,098h,09eh,030h,000h,001h,018h,0afh,098h,09ch,028h,000h,001h	; a132  ...o..0......(..
	defb 050h,040h,0a0h,000h,020h,001h,001h,058h,06fh,098h,09ah,028h,000h,001h,050h,080h	; a142  P@.. ..Xo..(..P.
	defb 0a2h,000h,020h,001h,001h,098h,0afh,098h,098h,020h,000h,005h,001h,030h,008h,0a0h	; a152  .. ...... ...0..
	defb 000h,038h,001h,001h,038h,04fh,098h,09eh,028h,000h,001h,078h,04fh,098h,09ch,020h	; a162  .8..8O..(..xO..
	defb 000h,001h,050h,0e0h,0a2h,000h,018h,001h,001h,0b0h,088h,0a4h,000h,018h,001h,00ah	; a172  ..P.............
	defb 001h,010h,0afh,098h,09eh,030h,000h,000h,050h,008h,0a0h,000h,018h,001h,000h,050h	; a182  .....0..P......P
	defb 040h,0a2h,000h,060h,001h,001h,058h,02fh,098h,09ch,028h,000h,000h,070h,008h,0a4h	; a192  @..`..X/..(..p..
	defb 000h,058h,001h,000h,058h,0afh,098h,09ah,028h,000h,001h,090h,040h,0a6h,000h,060h	; a1a2  .X..X...(...@..`
	defb 001h,000h,090h,0c0h,0a8h,000h,038h,001h,001h,098h,030h,098h,098h,020h,000h,000h	; a1b2  ......8...0.. ..
	defb 098h,0b0h,098h,096h,020h,000h	; a1c2

; ----------------------------------------------------------------------
; DATOS indice_de_laseres: 5 punteros (0xC60B) a listas de 10 bytes: p00:54DC;
;   lo leen p00:54DC (10 bytes)
;   0xa1c8..0xa1d2  (10 bytes)
DATA_indice_de_laseres:
	defw 0a1d2h,0a1dch,0a1e6h,0a1f0h,0a1fah	; a1c8

; ----------------------------------------------------------------------
; DATOS laseres: 5 listas de 10 bytes, un byte por laser, que p00:54E9 reparte
;   en 0xD001 + 0x80 x n; lo leen p00:54E9 (50 bytes)
;   0xa1d2..0xa204  (50 bytes)
DATA_laseres:
	defb 001h,000h,000h,001h,000h,000h,001h,000h,001h,000h	; a1d2  ..........
	defb 000h,001h,001h,000h,000h,000h,001h,000h,000h,001h	; a1dc  ..........
	defb 001h,000h,001h,000h,000h,001h,000h,000h,001h,001h	; a1e6  ..........
	defb 001h,001h,001h,000h,000h,000h,000h,001h,000h,000h	; a1f0  ..........
	defb 001h,000h,000h,000h,001h,001h,000h,000h,000h,001h	; a1fa  ..........

; ----------------------------------------------------------------------
; DATOS musica_y_radio_por_sala: 251 bytes, uno por sala: los bits 0-2 son la
;   zona de musica (p00:4368 -> 0xC158) y p00:453D lee el resto; lo leen
;   p00:4368, p00:453D (251 bytes)
;   0xa204..0xa2ff  (251 bytes)
DATA_musica_y_radio_por_sala:
	defb 008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a204  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,008h,000h,000h	; a214  ................
	defb 000h,000h,000h,000h,000h,008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a224  ................
	defb 000h,000h,000h,000h,000h,008h,010h,010h,010h,010h,010h,010h,010h,010h,010h,010h	; a234  ................
	defb 000h,000h,000h,000h,000h,008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a244  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,040h,040h,040h,040h,040h,010h,010h,010h	; a254  ........@@@@@...
	defb 010h,010h,010h,018h,010h,010h,000h,000h,008h,000h,000h,000h,008h,000h,000h,018h	; a264  ................
	defb 010h,010h,010h,018h,018h,000h,020h,018h,000h,000h,011h,010h,010h,018h,001h,001h	; a274  ...... .........
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a284  ................
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a294  ................
	defb 001h,001h,001h,001h,011h,019h,011h,011h,011h,011h,011h,011h,011h,001h,001h,001h	; a2a4  ................
	defb 001h,001h,009h,001h,001h,001h,001h,001h,001h,001h,041h,041h,011h,011h,011h,011h	; a2b4  ..........AA....
	defb 009h,009h,011h,001h,011h,011h,001h,001h,011h,001h,001h,011h,001h,001h,001h,011h	; a2c4  ................
	defb 000h,000h,000h,000h,000h,001h,001h,001h,001h,001h,001h,001h,010h,010h,000h,000h	; a2d4  ................
	defb 021h,021h,021h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a2e4  !!!.............
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a2f4  ...........

; ----------------------------------------------------------------------
; DATOS zona_de_radio_por_sala: un nibble por sala (p00:4379 con L_42D1 ->
;   0xC161): la zona del transceptor; lo leen p00:4379 (126 bytes)
;   0xa2ff..0xa37d  (126 bytes)
DATA_zona_de_radio_por_sala:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,011h,011h,011h,011h,011h,011h,022h,022h	; a2ff  ..............""
	defb 022h,022h,022h,022h,033h,033h,033h,033h,033h,033h,033h,044h,044h,044h,044h,044h	; a30f  """"3333333DDDDD
	defb 000h,000h,000h,055h,055h,055h,055h,056h,066h,066h,066h,066h,077h,077h,078h,088h	; a31f  ...UUUUVffffwwx.
	defb 088h,088h,088h,055h,055h,055h,099h,09ah,0aah,0aah,0a3h,0aah,000h,044h,044h,000h	; a32f  ...UUU.......DD.
	defb 000h,000h,000h,000h,000h,001h,011h,011h,011h,022h,022h,022h,022h,000h,022h,022h	; a33f  ........."""".""
	defb 033h,033h,044h,044h,044h,044h,040h,000h,055h,055h,056h,066h,066h,077h,088h,088h	; a34f  33DDDD@.UUVffw..
	defb 099h,0a1h,088h,060h,0a9h,068h,006h,058h,050h,005h,055h,055h,055h,055h,044h,000h	; a35f  ...`.h.XP.UUUUD.
	defb 0aah,0a0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a36f  ..............

; ----------------------------------------------------------------------
; DATOS indice_de_textos: 159 punteros, uno por numero de texto (0xCEF0 - 1),
;   que p00:52C6 lee con L_42B4; lo leen p00:52C6 (318 bytes)
;   0xa37d..0xa4bb  (318 bytes)
DATA_indice_de_textos:
	defw 0a4bbh,0a4c4h,0a52dh,0a570h,0b8a6h,0a5a7h,0a5b1h,0b8a6h	; a37d
	defw 0b8a6h,0a5bch,0b8a6h,0b8a6h,0b8a6h,0b8a6h,0a5ceh,0b8a6h	; a38d
	defw 0b8a6h,0b8a6h,0b8a6h,0a605h,0b8a6h,0b8a6h,0a62bh,0b8a6h	; a39d
	defw 0a664h,0a682h,0a6bdh,0a6dch,0b8a6h,0b8a6h,0a6dfh,0a758h	; a3ad
	defw 0a790h,0a79dh,0a7a6h,0a7ddh,0b8a6h,0a84bh,0a893h,0b8a6h	; a3bd
	defw 0b8a6h,0a8bfh,0b8a6h,0b8a6h,0a90ch,0b8a6h,0b8a6h,0b8a6h	; a3cd
	defw 0b8a6h,0aa85h,0aab1h,0aad0h,0b8a6h,0aaf2h,0b8a6h,0b8a6h	; a3dd
	defw 0b8a6h,0ab29h,0ab51h,0ac12h,0ac77h,0ac5fh,0b8a6h,0acb1h	; a3ed
	defw 0b8a6h,0b8a6h,0b8a6h,0b8a6h,0b8a6h,0b8a6h,0b8a6h,0b8a6h	; a3fd
	defw 0b8a6h,0b8a6h,0b8a6h,0b8a6h,0acedh,0ad13h,0ad2eh,0ad4eh	; a40d
	defw 0b8a6h,0b8a6h,0ad6ah,0ad92h,0b8a6h,0b8a6h,0b8a6h,0ad95h	; a41d
	defw 0adc3h,0add6h,0ae16h,0ae32h,0ae55h,0ae97h,0aedch,0b8a6h	; a42d
	defw 0b8a6h,0b8a6h,0aefch,0b8a6h,0af1fh,0b8a6h,0b8a6h,0b8a6h	; a43d
	defw 0b8a6h,0af32h,0af48h,0af4bh,0af70h,0b8a6h,0b8a6h,0afb7h	; a44d
	defw 0afe3h,0b00eh,0b03ah,0b060h,0b0c7h,0b0ebh,0b8a6h,0b8a6h	; a45d
	defw 0b8a6h,0b0fdh,0b125h,0b143h,0b18ch,0b2b4h,0b2e6h,0b2efh	; a46d
	defw 0b2f8h,0b355h,0b38eh,0b391h,0b3aah,0b3d1h,0b3eah,0b416h	; a47d
	defw 0b45bh,0b4b7h,0b4fch,0b523h,0b55eh,0b595h,0b8a6h,0b5e3h	; a48d
	defw 0b8a6h,0b62ah,0b641h,0b731h,0b77bh,0b7deh,0b8a6h,0b8a6h	; a49d
	defw 0b8a6h,0b8a6h,0b81dh,0b87eh,0b8a6h,0b8a6h,0b8a6h	; a4ad

; ----------------------------------------------------------------------
; DATOS texto_1: el texto 1: [tipo de ventana] y los caracteres; 0xFE salto de
;   linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (9 bytes)
;   0xa4bb..0xa4c4  (9 bytes)
DATA_texto_1:
	defb 000h,052h,045h,04ch,049h,045h,056h,045h,0ffh	; a4bb  .RELIEVE.

; ----------------------------------------------------------------------
; DATOS texto_2: el texto 2: [tipo de ventana] y los caracteres; 0xFE salto de
;   linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (105 bytes)
;   0xa4c4..0xa52d  (105 bytes)
DATA_texto_2:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,04fh,050h,045h,052h,041h,054h,049h,04fh,04eh,000h	; a4c4  ......OPERATION.
	defb 0a3h,000h,04eh,033h,031h,033h,05ch,0fdh,050h,045h,04eh,045h,054h,052h,041h,054h	; a4d4  ..N313\.PENETRAT
	defb 045h,000h,0ceh,000h,0b8h,097h,053h,0feh,0a4h,000h,0dah,0feh,0a5h,0feh,0a6h,0feh	; a4e4  E.....S.........
	defb 0a7h,03dh,0fdh,046h,049h,052h,053h,054h,05fh,0feh,0a8h,000h,04dh,049h,053h,053h	; a4f4  .=.FIRST_...MISS
	defb 049h,04eh,047h,0feh,0a9h,000h,0dah,000h,0aah,0feh,0a7h,03dh,0fdh,0a8h,000h,049h	; a504  ING........=...I
	defb 04eh,000h,0ceh,000h,0d6h,000h,04fh,046h,0feh,031h,032h,030h,038h,035h,000h,0abh	; a514  N.....OF.12085..
	defb 000h,0ach,000h,0e2h,05ch,0feh,0a2h,0adh,0ffh	; a524  ....\....

; ----------------------------------------------------------------------
; DATOS texto_3: el texto 3: [tipo de ventana] y los caracteres; 0xFE salto de
;   linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (67 bytes)
;   0xa52d..0xa570  (67 bytes)
DATA_texto_3:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,04dh,049h,053h,049h,04fh,04eh,03dh,0feh,0d8h,000h	; a52d  ......MISION=...
	defb 0f1h,000h,0e6h,0feh,0ceh,000h,0b8h,097h,053h,000h,0fah,05fh,0feh,0a4h,05ch,0fdh	; a53d  ........S.._..\.
	defb 0eeh,000h,041h,043h,054h,049h,0e2h,000h,0e5h,000h,0e6h,000h,0e3h,0feh,044h,049h	; a54d  ..ACTI........DI
	defb 053h,043h,04fh,056h,045h,052h,045h,044h,000h,0ebh,0feh,0ceh,000h,0b8h,05ch,0feh	; a55d  SCOVERED......\.
	defb 0a2h,0adh,0ffh	; a56d

; ----------------------------------------------------------------------
; DATOS texto_4: el texto 4: [tipo de ventana] y los caracteres; 0xFE salto de
;   linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (55 bytes)
;   0xa570..0xa5a7  (55 bytes)
DATA_texto_4:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,0eeh,000h,0ceh,000h,0d2h,053h,000h,0dah,0feh,0d3h	; a570  ...........S....
	defb 000h,0abh,0feh,0ceh,000h,0b8h,097h,053h,000h,0efh,03eh,0fdh,0afh,000h,0e7h,000h	; a580  .......S..>.....
	defb 0bch,0feh,041h,04eh,000h,049h,05ch,044h,05ch,0d4h,000h,0e6h,000h,0edh,0feh,0ceh	; a590  ..AN.I\D\.......
	defb 000h,0dbh,05ch,0feh,0a2h,0adh,0ffh	; a5a0

; ----------------------------------------------------------------------
; DATOS texto_6: el texto 6: [tipo de ventana] y los caracteres; 0xFE salto de
;   linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (10 bytes)
;   0xa5a7..0xa5b1  (10 bytes)
DATA_texto_6:
	defb 004h,044h,04fh,04eh,097h,054h,000h,0aeh,03dh,0ffh	; a5a7  .DON.T..=.

; ----------------------------------------------------------------------
; DATOS texto_7: el texto 7: [tipo de ventana] y los caracteres; 0xFE salto de
;   linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (11 bytes)
;   0xa5b1..0xa5bc  (11 bytes)
DATA_texto_7:
	defb 004h,0afh,000h,041h,052h,045h,000h,0b0h,044h,03dh,0ffh	; a5b1  ...ARE..D=.

; ----------------------------------------------------------------------
; DATOS texto_10: el texto 10: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (18 bytes)
;   0xa5bc..0xa5ce  (18 bytes)
DATA_texto_10:
	defb 003h,0d1h,000h,0cbh,0a2h,0feh,0afh,052h,000h,052h,045h,050h,04ch,059h,05fh,0d5h	; a5bc  .......R.REPLY_.
	defb 05ch,0ffh	; a5cc

; ----------------------------------------------------------------------
; DATOS texto_15: el texto 15: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (55 bytes)
;   0xa5ce..0xa605  (55 bytes)
DATA_texto_15:
	defb 003h,04ch,049h,053h,054h,045h,04eh,03dh,000h,0cbh,0a2h,0feh,049h,097h,04ch,04ch	; a5ce  .LISTEN=....I.LL
	defb 000h,0eah,000h,044h,049h,045h,0a2h,0fdh,049h,097h,04ch,04ch,000h,047h,045h,054h	; a5de  ...DIE..I.LL.GET
	defb 000h,0afh,05ch,0feh,04fh,04eh,045h,000h,044h,041h,059h,05ch,0fdh,053h,045h,045h	; a5ee  ..\.ONE.DAY\.SEE
	defb 000h,0afh,000h,041h,0d8h,0a2h,0ffh	; a5fe

; ----------------------------------------------------------------------
; DATOS texto_20: el texto 20: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (38 bytes)
;   0xa605..0xa62b  (38 bytes)
DATA_texto_20:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,0ech,000h,0c2h,000h,0e3h,0feh,053h,04fh,04dh,045h	; a605  ............SOME
	defb 000h,0b1h,05ch,0fdh,054h,052h,059h,000h,0e6h,000h,0a8h,000h,0d9h,0feh,0ceh,000h	; a615  ..\.TRY.........
	defb 0fch,03dh,0feh,0a2h,0adh,0ffh	; a625

; ----------------------------------------------------------------------
; DATOS texto_23: el texto 23: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (57 bytes)
;   0xa62b..0xa664  (57 bytes)
DATA_texto_23:
	defb 013h,0d1h,000h,0ceh,000h,0b1h,0feh,0b5h,05fh,0b2h,0a2h,0fdh,049h,000h,0c1h,000h	; a62b  ........_...I...
	defb 042h,052h,049h,045h,046h,000h,0afh,000h,0e2h,0feh,0ceh,000h,0fah,000h,044h,045h	; a63b  BRIEF.........DE
	defb 054h,041h,049h,04ch,053h,05ch,0feh,0d5h,000h,0a8h,000h,0e2h,0feh,0b3h,000h,031h	; a64b  TAILS\.........1
	defb 032h,030h,037h,039h,05ch,0feh,0a2h,0adh,0ffh	; a65b  2079\....

; ----------------------------------------------------------------------
; DATOS texto_25: el texto 25: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (30 bytes)
;   0xa664..0xa682  (30 bytes)
DATA_texto_25:
	defb 003h,0d1h,000h,0a1h,0a2h,0feh,0b4h,000h,041h,000h,0f0h,000h,04dh,041h,053h,04bh	; a664  ........A...MASK
	defb 000h,049h,04eh,0feh,0ceh,000h,0f0h,000h,0f6h,05ch,0feh,0a2h,0adh,0ffh	; a674  .IN......\....

; ----------------------------------------------------------------------
; DATOS texto_26: el texto 26: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (59 bytes)
;   0xa682..0xa6bd  (59 bytes)
DATA_texto_26:
	defb 013h,0d1h,000h,0ceh,000h,0b1h,0feh,0b5h,05fh,0b2h,0a2h,0fdh,047h,04fh,000h,0e6h	; a682  ........_...GO..
	defb 000h,0ceh,000h,053h,04fh,055h,054h,048h,000h,050h,041h,052h,054h,000h,04fh,046h	; a692  ...SOUTH.PART.OF
	defb 0feh,0ceh,000h,031h,053h,054h,000h,0c7h,000h,0e6h,000h,047h,045h,054h,0feh,0afh	; a6a2  ...1ST.....GET..
	defb 052h,000h,04dh,041h,053h,04bh,05ch,0feh,0a2h,0adh,0ffh	; a6b2  R.MASK\....

; ----------------------------------------------------------------------
; DATOS texto_27: el texto 27: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (31 bytes)
;   0xa6bd..0xa6dc  (31 bytes)
DATA_texto_27:
	defb 011h,0b6h,03dh,0fdh,0b1h,05fh,0d7h,0feh,0c1h,000h,053h,055h,050h,050h,04fh,052h	; a6bd  ..=.._....SUPPOR
	defb 054h,000h,0afh,0feh,0e2h,000h,0b3h,000h,031h,032h,030h,033h,033h,05ch,0ffh	; a6cd  T.......12033\.

; ----------------------------------------------------------------------
; DATOS texto_28: el texto 28: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (3 bytes)
;   0xa6dc..0xa6df  (3 bytes)
DATA_texto_28:
	defb 000h,0b6h,0ffh	; a6dc

; ----------------------------------------------------------------------
; DATOS texto_31: el texto 31: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (121 bytes)
;   0xa6df..0xa758  (121 bytes)
DATA_texto_31:
	defb 013h,0d1h,000h,052h,041h,044h,049h,04fh,000h,04bh,04eh,04bh,05ch,0feh,0cch,000h	; a6df  ...RADIO.KNK\...
	defb 04eh,045h,057h,053h,000h,046h,04ch,041h,053h,048h,03dh,0fdh,0ech,000h,057h,041h	; a6ef  NEWS.FLASH=...WA
	defb 053h,000h,041h,050h,050h,041h,052h,045h,04eh,054h,04ch,059h,0feh,041h,000h,054h	; a6ff  S.APPARENTLY.A.T
	defb 052h,045h,04dh,045h,04eh,044h,04fh,055h,053h,000h,045h,041h,052h,054h,048h,0feh	; a70f  REMENDOUS.EARTH.
	defb 054h,052h,045h,04dh,04fh,052h,000h,049h,04eh,000h,0ceh,000h,052h,045h,047h,049h	; a71f  TREMOR.IN...REGI
	defb 04fh,04eh,000h,04fh,046h,0feh,047h,041h,04ch,05ah,042h,055h,052h,047h,05fh,053h	; a72f  ON.OF.GALZBURG_S
	defb 04fh,055h,054h,048h,000h,041h,046h,052h,049h,043h,041h,0feh,041h,054h,000h,04dh	; a73f  OUTH.AFRICA.AT.M
	defb 049h,044h,04eh,049h,047h,048h,054h,05ch,0ffh	; a74f  IDNIGHT\.

; ----------------------------------------------------------------------
; DATOS texto_32: el texto 32: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (56 bytes)
;   0xa758..0xa790  (56 bytes)
DATA_texto_32:
	defb 011h,0b6h,03dh,0fdh,0b7h,045h,052h,0feh,0a3h,044h,0feh,041h,000h,046h,045h,057h	; a758  ..=..ER..D.A.FEW
	defb 000h,044h,041h,059h,053h,000h,041h,047h,04fh,0fdh,0dah,000h,049h,053h,000h,053h	; a768  .DAYS.AGO...IS.S
	defb 041h,046h,045h,000h,0ach,05ch,0fdh,048h,045h,000h,057h,041h,053h,000h,0b0h,044h	; a778  AFE..\.HE.WAS..D
	defb 000h,0ebh,0feh,0ceh,000h,0b8h,05ch,0ffh	; a788  ......\.

; ----------------------------------------------------------------------
; DATOS texto_33: el texto 33: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (13 bytes)
;   0xa790..0xa79d  (13 bytes)
DATA_texto_33:
	defb 004h,049h,097h,04dh,000h,053h,04ch,045h,045h,050h,059h,05ch,0ffh	; a790  .I.M.SLEEPY\.

; ----------------------------------------------------------------------
; DATOS texto_34: el texto 34: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (9 bytes)
;   0xa79d..0xa7a6  (9 bytes)
DATA_texto_34:
	defb 004h,0adh,053h,04ch,045h,050h,054h,03dh,0ffh	; a79d  ..SLEPT=.

; ----------------------------------------------------------------------
; DATOS texto_35: el texto 35: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (55 bytes)
;   0xa7a6..0xa7dd  (55 bytes)
DATA_texto_35:
	defb 001h,050h,052h,04fh,042h,041h,042h,04ch,059h,05fh,0feh,0b7h,045h,052h,0feh,0d8h	; a7a6  .PROBABLY_..ER..
	defb 045h,044h,000h,0f1h,05ch,0fdh,044h,04fh,04eh,097h,054h,000h,04dh,041h,04bh,045h	; a7b6  ED..\.DON.T.MAKE
	defb 000h,0f7h,0feh,0f2h,000h,048h,049h,04dh,05fh,0feh,041h,054h,000h,041h,04eh,059h	; a7c6  .....HIM_.AT.ANY
	defb 000h,043h,04fh,053h,054h,05ch,0ffh	; a7d6

; ----------------------------------------------------------------------
; DATOS texto_36: el texto 36: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (110 bytes)
;   0xa7dd..0xa84b  (110 bytes)
DATA_texto_36:
	defb 003h,0d1h,000h,0a1h,0a2h,0feh,0c1h,000h,045h,058h,050h,04ch,041h,049h,04eh,000h	; a7dd  ........EXPLAIN.
	defb 048h,04fh,057h,000h,0e6h,0feh,055h,053h,045h,000h,046h,040h,04bh,045h,059h,05ch	; a7ed  HOW...USE.F@KEY\
	defb 0fdh,046h,040h,031h,000h,0b9h,000h,050h,041h,055h,053h,045h,05ch,0feh,046h,040h	; a7fd  .F@1...PAUSE\.F@
	defb 032h,000h,0b9h,000h,0bah,0feh,0afh,052h,000h,0d2h,053h,05ch,0feh,046h,040h,033h	; a80d  2......R..S\.F@3
	defb 000h,0b9h,000h,0bah,0feh,0afh,052h,000h,0d3h,05ch,0fdh,046h,040h,034h,000h,0b9h	; a81d  ......R..\.F@4..
	defb 0feh,0fch,000h,0d6h,05ch,0feh,052h,045h,04dh,045h,04dh,042h,045h,052h,000h,054h	; a82d  ....\.REMEMBER.T
	defb 048h,045h,053h,045h,000h,057h,045h,04ch,04ch,05ch,0feh,0a2h,0adh,0ffh	; a83d  HESE.WELL\....

; ----------------------------------------------------------------------
; DATOS texto_38: el texto 38: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (72 bytes)
;   0xa84b..0xa893  (72 bytes)
DATA_texto_38:
	defb 013h,0d1h,000h,0a1h,0a2h,0fdh,0fbh,000h,044h,04fh,057h,04eh,000h,0ceh,000h,050h	; a84b  ........DOWN...P
	defb 04fh,057h,045h,052h,0feh,053h,055h,050h,050h,04ch,059h,000h,042h,04fh,058h,000h	; a85b  OWER.SUPPLY.BOX.
	defb 0d9h,0feh,0ceh,000h,0dfh,0feh,0e0h,000h,0e6h,000h,047h,045h,054h,000h,052h,049h	; a86b  ..........GET.RI
	defb 044h,000h,04fh,046h,0feh,0ceh,000h,048h,049h,047h,048h,040h,056h,04fh,04ch,054h	; a87b  D.OF...HIGH@VOLT
	defb 041h,047h,045h,05ch,0fdh,0a2h,0adh,0ffh	; a88b  AGE\....

; ----------------------------------------------------------------------
; DATOS texto_39: el texto 39: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (44 bytes)
;   0xa893..0xa8bf  (44 bytes)
DATA_texto_39:
	defb 003h,0d1h,000h,0b2h,0a2h,0feh,0ceh,000h,0dfh,0feh,0e0h,000h,049h,053h,000h,0e4h	; a893  ............IS..
	defb 000h,049h,04eh,0feh,0ceh,000h,053h,04fh,055h,054h,048h,045h,041h,053h,054h,045h	; a8a3  .IN...SOUTHEASTE
	defb 052h,04eh,000h,041h,052h,045h,041h,05ch,0feh,0a2h,0adh,0ffh	; a8b3  RN.AREA\....

; ----------------------------------------------------------------------
; DATOS texto_42: el texto 42: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (77 bytes)
;   0xa8bf..0xa90c  (77 bytes)
DATA_texto_42:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,057h,049h,04eh,044h,000h,042h,041h,052h,052h,049h	; a8bf  ......WIND.BARRI
	defb 045h,052h,000h,049h,053h,0feh,045h,058h,054h,045h,04eh,044h,045h,044h,000h,0e2h	; a8cf  ER.IS.EXTENDED..
	defb 0feh,0ceh,000h,052h,04fh,04fh,046h,054h,04fh,050h,05ch,0fdh,04ch,04fh,04fh,04bh	; a8df  ...ROOFTOP\.LOOK
	defb 000h,0f2h,0feh,0ceh,000h,0f3h,000h,0e6h,0feh,0e3h,000h,049h,04eh,0e6h,000h,0ceh	; a8ef  ...........IN...
	defb 000h,042h,041h,052h,052h,049h,045h,052h,05ch,0feh,0a2h,0adh,0ffh	; a8ff  .BARRIER\....

; ----------------------------------------------------------------------
; DATOS texto_45: el texto 45: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (377 bytes)
;   0xa90c..0xaa85  (377 bytes)
DATA_texto_45:
	defb 003h,04eh,045h,058h,054h,05fh,0feh,057h,045h,000h,049h,04eh,054h,052h,04fh,044h	; a90c  .NEXT_.WE.INTROD
	defb 055h,043h,045h,0feh,0a7h,000h,053h,054h,041h,046h,046h,0a2h,0fdh,000h,000h,000h	; a91c  UCE...STAFF.....
	defb 000h,000h,04dh,041h,049h,04eh,000h,050h,052h,04fh,047h,052h,041h,04dh,0feh,0feh	; a92c  ..MAIN.PROGRAM..
	defb 000h,000h,000h,000h,048h,049h,052h,04fh,059h,055h,04bh,049h,000h,046h,055h,04bh	; a93c  ....HIROYUKI.FUK
	defb 055h,049h,0feh,0fdh,000h,000h,000h,000h,000h,000h,053h,055h,042h,000h,050h,052h	; a94c  UI........SUB.PR
	defb 04fh,047h,052h,041h,04dh,0feh,0feh,000h,000h,000h,000h,054h,04fh,04dh,04fh,04eh	; a95c  OGRAM......TOMON
	defb 04fh,052h,049h,000h,04fh,053h,054h,055h,04bh,041h,0feh,000h,000h,000h,000h,000h	; a96c  ORI.OSTUKA......
	defb 04bh,04fh,04ah,049h,000h,054h,04fh,059h,04fh,048h,041h,052h,041h,0fdh,000h,000h	; a97c  KOJI.TOYOHARA...
	defb 000h,000h,047h,052h,041h,050h,048h,049h,043h,000h,044h,045h,053h,049h,047h,04eh	; a98c  ..GRAPHIC.DESIGN
	defb 0feh,0feh,000h,000h,000h,000h,000h,04dh,041h,053h,041h,04dh,049h,000h,054h,041h	; a99c  .......MASAMI.TA
	defb 042h,041h,054h,041h,0feh,000h,000h,000h,000h,000h,041h,05ah,055h,053h,041h,000h	; a9ac  BATA......AZUSA.
	defb 046h,055h,04ah,049h,04dh,04fh,054h,04fh,0fdh,000h,000h,000h,04dh,041h,049h,04eh	; a9bc  FUJIMOTO....MAIN
	defb 000h,053h,04fh,055h,04eh,044h,000h,045h,046h,046h,045h,043h,054h,0feh,0feh,000h	; a9cc  .SOUND.EFFECT...
	defb 000h,000h,000h,000h,000h,049h,04bh,055h,000h,04dh,049h,05ah,055h,054h,041h,04eh	; a9dc  .....IKU.MIZUTAN
	defb 049h,0fdh,000h,000h,000h,053h,055h,042h,000h,053h,04fh,055h,04eh,044h,000h,045h	; a9ec  I....SUB.SOUND.E
	defb 046h,046h,045h,043h,054h,0feh,0feh,000h,053h,048h,049h,047h,045h,048h,049h,052h	; a9fc  FFECT...SHIGEHIR
	defb 04fh,000h,054h,041h,04bh,045h,04eh,04fh,055h,043h,048h,049h,0feh,000h,000h,000h	; aa0c  O.TAKENOUCHI....
	defb 000h,04dh,04fh,054h,04fh,041h,04bh,049h,000h,046h,055h,052h,055h,04bh,041h,057h	; aa1c  .MOTOAKI.FURUKAW
	defb 041h,0fdh,000h,000h,000h,000h,000h,000h,047h,041h,04dh,045h,000h,044h,045h,053h	; aa2c  A.......GAME.DES
	defb 049h,047h,04eh,0feh,0feh,000h,000h,000h,000h,000h,048h,049h,044h,045h,04fh,000h	; aa3c  IGN.......HIDEO.
	defb 04bh,04fh,04ah,049h,04dh,041h,0fdh,000h,000h,000h,000h,000h,050h,052h,045h,053h	; aa4c  KOJIMA......PRES
	defb 045h,04eh,054h,045h,044h,000h,000h,042h,059h,0feh,0feh,000h,000h,000h,000h,000h	; aa5c  ENTED..BY.......
	defb 000h,000h,000h,04bh,04fh,04eh,041h,04dh,049h,0feh,0feh,000h,000h,000h,000h,000h	; aa6c  ...KONAMI.......
	defb 000h,000h,000h,000h,031h,039h,038h,037h,0ffh	; aa7c  ....1987.

; ----------------------------------------------------------------------
; DATOS texto_50: el texto 50: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (44 bytes)
;   0xaa85..0xaab1  (44 bytes)
DATA_texto_50:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,0bbh,000h,0afh,052h,000h,0d3h,03dh,0feh,0bbh,000h	; aa85  .........R..=...
	defb 049h,046h,000h,0afh,000h,0bch,000h,0e3h,045h,04eh,0feh,042h,055h,047h,047h,045h	; aa95  IF......EN.BUGGE
	defb 044h,000h,0ebh,000h,0ceh,000h,0b8h,05ch,0feh,0a2h,0adh,0ffh	; aaa5  D......\....

; ----------------------------------------------------------------------
; DATOS texto_51: el texto 51: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (31 bytes)
;   0xaab1..0xaad0  (31 bytes)
DATA_texto_51:
	defb 003h,0d1h,000h,0b2h,0a2h,0feh,0ceh,000h,0f3h,0feh,0e1h,000h,0e3h,000h,046h,04fh	; aab1  ..............FO
	defb 055h,04eh,044h,000h,049h,04eh,0feh,0ceh,000h,0c6h,05ch,0feh,0a2h,0adh,0ffh	; aac1  UND.IN....\....

; ----------------------------------------------------------------------
; DATOS texto_52: el texto 52: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (34 bytes)
;   0xaad0..0xaaf2  (34 bytes)
DATA_texto_52:
	defb 011h,0b6h,03dh,0fdh,0b7h,045h,052h,0feh,043h,041h,04ch,04ch,045h,044h,0feh,0a9h	; aad0  ..=..ER.CALLED..
	defb 000h,0c2h,000h,042h,045h,0fdh,0bdh,000h,049h,04eh,0feh,0ceh,000h,0beh,000h,0c0h	; aae0  ...BE...IN......
	defb 05ch,0ffh	; aaf0

; ----------------------------------------------------------------------
; DATOS texto_54: el texto 54: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (55 bytes)
;   0xaaf2..0xab29  (55 bytes)
DATA_texto_54:
	defb 011h,0b6h,03dh,0fdh,0ceh,000h,042h,045h,053h,054h,000h,0f7h,000h,04fh,046h,0feh	; aaf2  ..=...BEST...OF.
	defb 0d8h,049h,04eh,047h,000h,0f1h,000h,054h,04fh,0feh,0ceh,000h,0beh,000h,0c0h,05fh	; ab02  .ING...TO......_
	defb 0fdh,049h,053h,000h,0e6h,000h,041h,04ch,04ch,04fh,057h,000h,0ceh,0feh,0b8h,000h	; ab12  .IS...ALLOW.....
	defb 0e6h,000h,0b0h,0feh,0afh,05ch,0ffh	; ab22

; ----------------------------------------------------------------------
; DATOS texto_58: el texto 58: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (40 bytes)
;   0xab29..0xab51  (40 bytes)
DATA_texto_58:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,0aeh,000h,04fh,055h,054h,05fh,0dah,000h,04ch,04fh	; ab29  ........OUT_..LO
	defb 043h,041h,054h,045h,0feh,0a9h,097h,053h,000h,0bfh,0feh,0c0h,05ch,0fdh,0bbh,000h	; ab39  CATE...S....\...
	defb 0ceh,000h,0e8h,03dh,0feh,0a2h,0adh,0ffh	; ab49  ...=....

; ----------------------------------------------------------------------
; DATOS texto_59: el texto 59: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (193 bytes)
;   0xab51..0xac12  (193 bytes)
DATA_texto_59:
	defb 011h,049h,097h,04dh,000h,0a9h,05ch,0fdh,0a6h,0feh,0a7h,000h,048h,041h,053h,0fdh	; ab51  .I.M..\.....HAS.
	defb 04eh,055h,043h,04ch,045h,041h,052h,000h,0d2h,053h,0feh,044h,045h,053h,049h,047h	; ab61  NUCLEAR..S.DESIG
	defb 04eh,045h,044h,000h,0f2h,000h,045h,056h,045h,052h,059h,0feh,050h,041h,052h,054h	; ab71  NED...EVERY.PART
	defb 000h,04fh,046h,000h,045h,041h,052h,054h,048h,05ch,0fdh,049h,046h,000h,049h,054h	; ab81  .OF.EARTH\.IF.IT
	defb 000h,049h,053h,000h,0d0h,044h,05fh,0feh,04eh,055h,043h,04ch,045h,041h,052h,000h	; ab91  .IS..D_.NUCLEAR.
	defb 041h,054h,054h,041h,043h,04bh,0fdh,0abh,000h,041h,04eh,059h,057h,048h,057h,052h	; aba1  ATTACK...ANYWHWR
	defb 045h,0fdh,0c1h,000h,0e3h,0feh,050h,04fh,053h,053h,049h,042h,04ch,045h,05ch,0fdh	; abb1  E.....POSSIBLE\.
	defb 0a7h,000h,0c2h,000h,0e3h,0feh,0a5h,045h,044h,05fh,0fdh,0e3h,0f2h,045h,000h,049h	; abc1  .......ED_...E.I
	defb 054h,000h,049h,053h,0feh,0d0h,044h,05ch,0fdh,0ech,000h,049h,053h,000h,0c3h,000h	; abd1  T.IS..D\...IS...
	defb 04fh,04eh,045h,0feh,0f7h,000h,0e6h,000h,0a5h,0feh,0a7h,05ch,0fdh,0c4h,05fh,057h	; abe1  ONE........\.._W
	defb 048h,04fh,0feh,044h,045h,056h,045h,04ch,04fh,050h,045h,044h,000h,049h,054h,000h	; abf1  HO.DEVELOPED.IT.
	defb 04bh,04eh,04fh,057h,0feh,0ceh,000h,0c3h,000h,04dh,045h,054h,048h,04fh,044h,05ch	; ac01  KNOW.....METHOD\
	defb 0ffh	; ac11

; ----------------------------------------------------------------------
; DATOS texto_60: el texto 60: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (77 bytes)
;   0xac12..0xac5f  (77 bytes)
DATA_texto_60:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,0eeh,000h,042h,041h,043h,04bh,000h,0afh,052h,000h	; ac12  ........BACK..R.
	defb 0d2h,053h,0feh,0dah,000h,0d3h,05fh,0feh,0dah,000h,047h,045h,054h,000h,04fh,055h	; ac22  .S...._...GET.OU
	defb 054h,000h,04fh,046h,000h,0f4h,03dh,0fdh,054h,048h,045h,059h,000h,0c2h,000h,0e3h	; ac32  T.OF..=.THEY....
	defb 000h,043h,04fh,04eh,043h,045h,041h,04ch,045h,044h,0feh,049h,04eh,000h,041h,000h	; ac42  .CONCEALED.IN.A.
	defb 0f6h,05ch,0feh,0fbh,000h,0ceh,000h,0dbh,03dh,0feh,0a2h,0adh,0ffh	; ac52  .\......=....

; ----------------------------------------------------------------------
; DATOS texto_62: el texto 62: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (24 bytes)
;   0xac5f..0xac77  (24 bytes)
DATA_texto_62:
	defb 001h,049h,000h,054h,04fh,04fh,04bh,000h,042h,041h,043h,04bh,000h,0feh,0ceh,000h	; ac5f  .I.TOOK.BACK....
	defb 0d2h,053h,0feh,0dah,000h,0d3h,05ch,0ffh	; ac6f  .S....\.

; ----------------------------------------------------------------------
; DATOS texto_61: el texto 61: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (58 bytes)
;   0xac77..0xacb1  (58 bytes)
DATA_texto_61:
	defb 001h,049h,097h,04dh,000h,053h,048h,04fh,04fh,054h,000h,047h,055h,04eh,04eh,045h	; ac77  .I.M.SHOOT.GUNNE
	defb 052h,03dh,0fdh,04eh,04fh,042h,04fh,044h,059h,000h,048h,041h,053h,0fdh,045h,056h	; ac87  R=.NOBODY.HAS.EV
	defb 045h,052h,000h,0e3h,045h,04eh,000h,041h,042h,04ch,045h,000h,0e6h,0feh,045h,053h	; ac97  ER..EN.ABLE...ES
	defb 043h,041h,050h,045h,000h,0abh,000h,0f4h,05ch,0ffh	; aca7  CAPE....\.

; ----------------------------------------------------------------------
; DATOS texto_64: el texto 64: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (60 bytes)
;   0xacb1..0xaced  (60 bytes)
DATA_texto_64:
	defb 013h,0d1h,000h,0b2h,0a2h,0fdh,0afh,000h,0e7h,000h,04bh,04eh,04fh,043h,04bh,0feh	; acb1  ..........KNOCK.
	defb 0ceh,000h,0e8h,000h,0dah,000h,042h,04ch,041h,053h,054h,000h,049h,054h,0feh,057h	; acc1  ......BLAST.IT.W
	defb 048h,049h,043h,048h,000h,053h,04fh,055h,04eh,044h,053h,0feh,049h,052h,052h,045h	; acd1  HICH.SOUNDS.IRRE
	defb 047h,055h,04ch,041h,052h,04ch,059h,05ch,0feh,0a2h,0adh,0ffh	; ace1  GULARLY\....

; ----------------------------------------------------------------------
; DATOS texto_77: el texto 77: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (38 bytes)
;   0xaced..0xad13  (38 bytes)
DATA_texto_77:
	defb 011h,0b6h,03dh,0fdh,0ceh,000h,0c3h,000h,0f7h,000h,0e6h,0feh,052h,045h,041h,043h	; aced  ..=.........REAC
	defb 048h,000h,0ceh,000h,0cfh,0feh,049h,053h,000h,0ebh,000h,050h,041h,052h,041h,043h	; acfd  H.....IS...PARAC
	defb 048h,055h,054h,045h,05ch,0ffh	; ad0d

; ----------------------------------------------------------------------
; DATOS texto_78: el texto 78: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (27 bytes)
;   0xad13..0xad2e  (27 bytes)
DATA_texto_78:
	defb 011h,0b6h,03dh,0fdh,0c4h,000h,049h,053h,0feh,0bdh,000h,0e6h,0fdh,041h,000h,0bfh	; ad13  ..=...IS.....A..
	defb 000h,0c0h,000h,049h,04eh,0feh,0ceh,000h,0cfh,05ch,0ffh	; ad23  ...IN....\.

; ----------------------------------------------------------------------
; DATOS texto_79: el texto 79: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (32 bytes)
;   0xad2e..0xad4e  (32 bytes)
DATA_texto_79:
	defb 001h,049h,097h,04dh,000h,0feh,0deh,03dh,0fdh,049h,097h,04ch,04ch,000h,0eah,000h	; ad2e  .I.M...=.I.LL...
	defb 04ch,045h,054h,0feh,0afh,000h,047h,04fh,000h,041h,048h,045h,041h,044h,03eh,0ffh	; ad3e  LET...GO.AHEAD>.

; ----------------------------------------------------------------------
; DATOS texto_80: el texto 80: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (28 bytes)
;   0xad4e..0xad6a  (28 bytes)
DATA_texto_80:
	defb 003h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,0deh,000h,0c2h,000h,0e3h,0feh,0f9h,045h	; ad4e  ...............E
	defb 044h,000h,0ebh,0feh,0dfh,000h,0e0h,05ch,0feh,0a2h,0adh,0ffh	; ad5e  D......\....

; ----------------------------------------------------------------------
; DATOS texto_83: el texto 83: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (40 bytes)
;   0xad6a..0xad92  (40 bytes)
DATA_texto_83:
	defb 003h,0d1h,000h,0b2h,0a2h,0feh,0afh,000h,0e1h,000h,047h,045h,054h,0feh,0ceh,000h	; ad6a  ..........GET...
	defb 050h,041h,052h,041h,043h,048h,055h,054h,045h,000h,0e2h,0feh,0ceh,000h,032h,04eh	; ad7a  PARACHUTE.....2N
	defb 044h,000h,0c7h,05ch,0feh,0a2h,0adh,0ffh	; ad8a  D..\....

; ----------------------------------------------------------------------
; DATOS texto_84: el texto 84: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (3 bytes)
;   0xad92..0xad95  (3 bytes)
DATA_texto_84:
	defb 000h,0b6h,0ffh	; ad92

; ----------------------------------------------------------------------
; DATOS texto_88: el texto 88: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (46 bytes)
;   0xad95..0xadc3  (46 bytes)
DATA_texto_88:
	defb 003h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,048h,049h,04eh,044h,040h,044h,000h,0c2h	; ad95  ........HIND@D..
	defb 000h,0e3h,0feh,0a5h,045h,044h,000h,0ebh,0feh,047h,052h,045h,04eh,041h,044h,045h	; ada5  ....ED...GRENADE
	defb 000h,04ch,041h,055h,04eh,043h,048h,045h,052h,05ch,0feh,0a2h,0ddh,0ffh	; adb5  .LAUNCHER\....

; ----------------------------------------------------------------------
; DATOS texto_89: el texto 89: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (19 bytes)
;   0xadc3..0xadd6  (19 bytes)
DATA_texto_89:
	defb 004h,0a2h,0c4h,05ch,0feh,049h,054h,097h,053h,000h,0e6h,04fh,000h,04ch,041h,054h	; adc3  ...\.IT.S..O.LAT
	defb 045h,05ch,0ffh	; add3

; ----------------------------------------------------------------------
; DATOS texto_90: el texto 90: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (64 bytes)
;   0xadd6..0xae16  (64 bytes)
DATA_texto_90:
	defb 011h,0b6h,03dh,0fdh,0c4h,000h,057h,041h,053h,0feh,051h,055h,049h,043h,04bh,04ch	; add6  ..=...WAS.QUICKL
	defb 059h,000h,0aeh,044h,000h,0e6h,0feh,0c5h,000h,04eh,04fh,05ch,032h,05ch,0fdh,0c5h	; ade6  Y..D.....NO\2\..
	defb 000h,04eh,04fh,05ch,032h,000h,04ch,049h,045h,053h,0feh,031h,030h,04bh,04dh,000h	; adf6  .NO\2.LIES.10KM.
	defb 054h,04fh,000h,0ceh,000h,04eh,04fh,052h,054h,048h,0feh,0abh,000h,0f4h,05ch,0ffh	; ae06  TO...NORTH....\.

; ----------------------------------------------------------------------
; DATOS texto_91: el texto 91: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (28 bytes)
;   0xae16..0xae32  (28 bytes)
DATA_texto_91:
	defb 001h,049h,000h,047h,04fh,04fh,046h,045h,044h,03eh,0feh,0ceh,000h,0efh,0feh,053h	; ae16  .I.GOOFED>.....S
	defb 054h,041h,052h,054h,045h,044h,000h,0e6h,000h,0aeh,03dh,0ffh	; ae26  TARTED....=.

; ----------------------------------------------------------------------
; DATOS texto_92: el texto 92: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (35 bytes)
;   0xae32..0xae55  (35 bytes)
DATA_texto_92:
	defb 003h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,0a5h,000h,0ceh,000h,054h,041h,04eh,04bh	; ae32  ............TANK
	defb 000h,0d9h,0feh,0ceh,000h,04ch,041h,04eh,044h,000h,04dh,049h,04eh,045h,05ch,0feh	; ae42  .....LAND.MINE\.
	defb 0a2h,0ddh,0ffh	; ae52

; ----------------------------------------------------------------------
; DATOS texto_93: el texto 93: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (66 bytes)
;   0xae55..0xae97  (66 bytes)
DATA_texto_93:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,0bbh,000h,050h,04fh,049h,04eh,054h,03dh,0fdh,0b4h	; ae55  ........POINT=..
	defb 0feh,041h,04eh,000h,0b8h,097h,053h,000h,055h,04eh,049h,0f2h,04dh,0feh,0dah,000h	; ae65  .AN...S.UNI.M...
	defb 0d8h,000h,0f1h,05ch,0fdh,0c1h,000h,055h,053h,045h,000h,0b3h,000h,031h,032h,030h	; ae75  ...\...USE...120
	defb 031h,033h,0feh,0f2h,000h,046h,055h,054h,055h,052h,045h,000h,0a8h,05ch,0feh,0a2h	; ae85  13...FUTURE..\..
	defb 0adh,0ffh	; ae95

; ----------------------------------------------------------------------
; DATOS texto_94: el texto 94: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (69 bytes)
;   0xae97..0xaedc  (69 bytes)
DATA_texto_94:
	defb 013h,0d1h,000h,0b2h,0a2h,0fdh,0b8h,097h,053h,000h,055h,04eh,049h,0f2h,04dh,000h	; ae97  ........S.UNI.M.
	defb 049h,053h,0feh,0e4h,000h,049h,04eh,0feh,0ceh,000h,0c6h,000h,04fh,046h,0feh,0c5h	; aea7  IS...IN.....OF..
	defb 000h,04eh,04fh,05ch,031h,05ch,0fdh,0c1h,000h,0a8h,0feh,049h,04eh,000h,0ceh,000h	; aeb7  .NO\1\.....IN...
	defb 0d6h,000h,04fh,046h,000h,031h,032h,030h,032h,036h,0feh,0abh,000h,0ach,000h,0e2h	; aec7  ..OF.12026......
	defb 05ch,0feh,0a2h,0adh,0ffh	; aed7

; ----------------------------------------------------------------------
; DATOS texto_95: el texto 95: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (32 bytes)
;   0xaedc..0xaefc  (32 bytes)
DATA_texto_95:
	defb 013h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,0c1h,000h,0a8h,000h,0e2h,0feh,0b3h,000h	; aedc  ................
	defb 031h,032h,030h,039h,031h,000h,0abh,0feh,0ach,000h,0e2h,05ch,0fdh,0a2h,0ddh,0ffh	; aeec  12091......\....

; ----------------------------------------------------------------------
; DATOS texto_99: el texto 99: [tipo de ventana] y los caracteres; 0xFE salto
;   de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (35 bytes)
;   0xaefc..0xaf1f  (35 bytes)
DATA_texto_99:
	defb 003h,0d1h,000h,0a1h,0a2h,0feh,049h,054h,000h,057h,041h,053h,000h,04ah,041h,04dh	; aefc  ......IT.WAS.JAM
	defb 04dh,049h,04eh,047h,05fh,042h,055h,054h,0a2h,0feh,04fh,04bh,000h,0ach,05ch,0feh	; af0c  MING_BUT..OK..\.
	defb 0a2h,0adh,0ffh	; af1c

; ----------------------------------------------------------------------
; DATOS texto_101: el texto 101: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (19 bytes)
;   0xaf1f..0xaf32  (19 bytes)
DATA_texto_101:
	defb 011h,0b6h,03dh,0fdh,0c4h,000h,049h,053h,0feh,0bdh,000h,049h,04eh,0feh,0ceh,000h	; af1f  ..=...IS...IN...
	defb 0c6h,05ch,0ffh	; af2f

; ----------------------------------------------------------------------
; DATOS texto_106: el texto 106: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (22 bytes)
;   0xaf32..0xaf48  (22 bytes)
DATA_texto_106:
	defb 003h,0d1h,000h,0b2h,0a2h,0feh,0f5h,000h,0afh,000h,0e6h,0feh,0ceh,000h,0f0h,000h	; af32  ................
	defb 0f6h,03dh,0feh,0a2h,0adh,0ffh	; af42

; ----------------------------------------------------------------------
; DATOS texto_107: el texto 107: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (3 bytes)
;   0xaf48..0xaf4b  (3 bytes)
DATA_texto_107:
	defb 000h,0b6h,0ffh	; af48

; ----------------------------------------------------------------------
; DATOS texto_108: el texto 108: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (37 bytes)
;   0xaf4b..0xaf70  (37 bytes)
DATA_texto_108:
	defb 004h,049h,097h,04dh,000h,046h,049h,052h,045h,000h,054h,052h,04fh,04fh,050h,045h	; af4b  .I.M.FIRE.TROOPE
	defb 052h,03dh,0fdh,049h,000h,0c1h,0fdh,042h,055h,052h,04eh,000h,0afh,000h,041h,04ch	; af5b  R=.I...BURN...AL
	defb 049h,056h,045h,03dh,0ffh	; af6b

; ----------------------------------------------------------------------
; DATOS texto_109: el texto 109: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (71 bytes)
;   0xaf70..0xafb7  (71 bytes)
DATA_texto_109:
	defb 001h,0afh,000h,041h,052h,045h,000h,043h,041h,055h,047h,048h,054h,000h,049h,04eh	; af70  ...ARE.CAUGHT.IN
	defb 0feh,041h,000h,054h,052h,041h,050h,05ch,0fdh,049h,04eh,000h,046h,041h,043h,054h	; af80  .A.TRAP\.IN.FACT
	defb 05fh,0fdh,057h,045h,000h,0bch,000h,0bdh,0feh,0c4h,000h,0e2h,0feh,0ceh,000h,053h	; af90  _.WE...........S
	defb 045h,043h,0e2h,044h,000h,0c7h,05ch,0fdh,049h,000h,0c1h,000h,047h,045h,054h,000h	; afa0  EC.D..\.I...GET.
	defb 0afh,0feh,0b7h,045h,052h,03dh,0ffh	; afb0

; ----------------------------------------------------------------------
; DATOS texto_112: el texto 112: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (44 bytes)
;   0xafb7..0xafe3  (44 bytes)
DATA_texto_112:
	defb 003h,0d1h,000h,0b2h,0a2h,0feh,0ceh,000h,046h,04ch,041h,053h,048h,000h,04ch,049h	; afb7  ........FLASH.LI
	defb 047h,048h,054h,000h,0e1h,000h,0e3h,0feh,046h,04fh,055h,04eh,044h,000h,0e2h,000h	; afc7  GHT.....FOUND...
	defb 0ceh,000h,031h,053h,054h,000h,0c7h,05ch,0feh,0a2h,0adh,0ffh	; afd7  ..1ST..\....

; ----------------------------------------------------------------------
; DATOS texto_113: el texto 113: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (43 bytes)
;   0xafe3..0xb00e  (43 bytes)
DATA_texto_113:
	defb 003h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,0d5h,000h,054h,041h,04bh,045h,000h,043h	; afe3  ..........TAKE.C
	defb 041h,052h,045h,05fh,0feh,0ech,000h,04dh,041h,059h,000h,0e3h,000h,041h,000h,050h	; aff3  ARE_...MAY...A.P
	defb 049h,054h,046h,041h,04ch,04ch,05ch,0feh,0a2h,0ddh,0ffh	; b003  ITFALL\....

; ----------------------------------------------------------------------
; DATOS texto_114: el texto 114: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (44 bytes)
;   0xb00e..0xb03a  (44 bytes)
DATA_texto_114:
	defb 003h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,0ceh,000h,0dbh,04bh,045h,045h,050h,045h	; b00e  ...........KEEPE
	defb 052h,05fh,0feh,0f8h,0feh,049h,053h,000h,049h,04eh,056h,049h,04eh,043h,049h,042h	; b01e  R_...IS.INVINCIB
	defb 04ch,045h,03dh,0feh,045h,053h,043h,041h,050h,045h,03dh,0ffh	; b02e  LE=.ESCAPE=.

; ----------------------------------------------------------------------
; DATOS texto_115: el texto 115: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (38 bytes)
;   0xb03a..0xb060  (38 bytes)
DATA_texto_115:
	defb 011h,0b6h,03dh,0fdh,0afh,000h,0c2h,000h,0bch,0feh,041h,000h,043h,04fh,04dh,050h	; b03a  ..=.......A.COMP
	defb 041h,053h,053h,000h,0e6h,000h,043h,052h,04fh,053h,053h,0feh,0ceh,000h,044h,045h	; b04a  ASS...CROSS...DE
	defb 053h,045h,052h,054h,05ch,0ffh	; b05a

; ----------------------------------------------------------------------
; DATOS texto_116: el texto 116: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (103
;   bytes)
;   0xb060..0xb0c7  (103 bytes)
DATA_texto_116:
	defb 011h,0b6h,03dh,0fdh,0afh,000h,04dh,049h,047h,048h,054h,000h,0e3h,000h,041h,042h	; b060  ..=...MIGHT...AB
	defb 04ch,045h,0feh,0e6h,000h,0a8h,000h,0c8h,0feh,04fh,046h,000h,0b1h,000h,0e2h,0fdh	; b070  LE.......OF.....
	defb 0b3h,000h,031h,032h,030h,034h,038h,05ch,0fdh,042h,055h,054h,000h,053h,048h,045h	; b080  ..12048\.BUT.SHE
	defb 000h,049h,053h,000h,050h,052h,04fh,055h,044h,05fh,0feh,0dah,0feh,057h,04fh,055h	; b090  .IS.PROUD_...WOU
	defb 04ch,044h,04eh,097h,054h,000h,041h,04eh,053h,057h,045h,052h,05fh,0fdh,049h,046h	; b0a0  LDN.T.ANSWER_.IF
	defb 000h,0afh,000h,057h,045h,052h,045h,000h,0e5h,0feh,0ceh,000h,045h,058h,045h,043h	; b0b0  ...WERE.....EXEC
	defb 055h,054h,049h,056h,045h,05ch,0ffh	; b0c0

; ----------------------------------------------------------------------
; DATOS texto_117: el texto 117: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (36 bytes)
;   0xb0c7..0xb0eb  (36 bytes)
DATA_texto_117:
	defb 013h,0d1h,000h,0c8h,0a2h,0feh,0c1h,000h,041h,052h,052h,041h,04eh,047h,045h,0feh	; b0c7  ........ARRANGE.
	defb 041h,000h,0cah,05ch,0fdh,043h,04fh,04dh,045h,000h,0f2h,0feh,041h,000h,0cah,03dh	; b0d7  A..\.COME...A..=
	defb 0feh,0a2h,0adh,0ffh	; b0e7

; ----------------------------------------------------------------------
; DATOS texto_118: el texto 118: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (18 bytes)
;   0xb0eb..0xb0fd  (18 bytes)
DATA_texto_118:
	defb 003h,0d1h,000h,0c8h,0a2h,0feh,0c1h,000h,0edh,000h,0ceh,000h,0dbh,05ch,0feh,0a2h	; b0eb  .............\..
	defb 0adh,0ffh	; b0fb

; ----------------------------------------------------------------------
; DATOS texto_122: el texto 122: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (40 bytes)
;   0xb0fd..0xb125  (40 bytes)
DATA_texto_122:
	defb 003h,0d1h,000h,0b2h,0a2h,0feh,0ceh,000h,043h,04fh,04dh,050h,041h,053h,053h,000h	; b0fd  ........COMPASS.
	defb 0e1h,000h,0e3h,0feh,046h,04fh,055h,04eh,044h,000h,0e2h,000h,0ceh,000h,032h,04eh	; b10d  ....FOUND.....2N
	defb 044h,000h,0c7h,05ch,0feh,0a2h,0adh,0ffh	; b11d  D..\....

; ----------------------------------------------------------------------
; DATOS texto_123: el texto 123: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (30 bytes)
;   0xb125..0xb143  (30 bytes)
DATA_texto_123:
	defb 001h,0b6h,03dh,0fdh,0ceh,000h,044h,049h,054h,043h,048h,000h,0c1h,000h,0f5h,0feh	; b125  ..=...DITCH.....
	defb 0afh,000h,0e6h,0feh,0ceh,000h,04eh,04fh,05ch,033h,000h,0c5h,05ch,0ffh	; b135  ......NO\3..\.

; ----------------------------------------------------------------------
; DATOS texto_124: el texto 124: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (73 bytes)
;   0xb143..0xb18c  (73 bytes)
DATA_texto_124:
	defb 011h,049h,097h,04dh,000h,0c4h,05ch,0fdh,04dh,059h,000h,044h,041h,055h,047h,048h	; b143  .I.M..\.MY.DAUGH
	defb 054h,045h,052h,000h,0c9h,0feh,057h,041h,053h,000h,054h,041h,04bh,045h,04eh,0feh	; b153  TER...WAS.TAKEN.
	defb 041h,053h,000h,048h,04fh,053h,054h,041h,047h,045h,05ch,0fdh,053h,041h,056h,045h	; b163  AS.HOSTAGE\.SAVE
	defb 000h,0c9h,0feh,04fh,052h,05fh,049h,000h,057h,04fh,04eh,097h,054h,000h,044h,049h	; b173  ...OR_I.WON.T.DI
	defb 053h,043h,055h,053h,053h,0feh,0a7h,05ch,0ffh	; b183  SCUSS..\.

; ----------------------------------------------------------------------
; DATOS texto_125: el texto 125: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (296
;   bytes)
;   0xb18c..0xb2b4  (296 bytes)
DATA_texto_125:
	defb 011h,049h,097h,04dh,000h,0c4h,05ch,0fdh,0a7h,000h,049h,053h,000h,049h,04eh,0feh	; b18c  .I.M..\...IS.IN.
	defb 031h,030h,030h,054h,048h,000h,0c6h,000h,04fh,046h,0feh,0c5h,000h,04eh,04fh,05ch	; b19c  100TH...OF...NO\
	defb 033h,05fh,0fdh,032h,030h,04bh,04dh,000h,0e6h,000h,0ceh,000h,04eh,04fh,052h,054h	; b1ac  3_.20KM.....NORT
	defb 048h,0feh,04fh,046h,000h,0f4h,05ch,0fdh,0a7h,000h,0e1h,000h,0e3h,0feh,0a5h,045h	; b1bc  H.OF..\........E
	defb 044h,0feh,049h,04eh,000h,0c3h,000h,04fh,04eh,045h,000h,0f7h,05ch,0fdh,041h,054h	; b1cc  D.IN...ONE..\.AT
	defb 054h,041h,043h,048h,000h,050h,04ch,041h,053h,054h,049h,043h,000h,042h,04fh,04dh	; b1dc  TACH.PLASTIC.BOM
	defb 042h,0feh,0e6h,000h,0ceh,000h,046h,04fh,04fh,054h,000h,04fh,046h,0feh,0a7h,05ch	; b1ec  B.....FOOT.OF..\
	defb 0fdh,052h,05fh,052h,05fh,04ch,05fh,052h,05fh,04ch,05fh,04ch,05fh,052h,05fh,04ch	; b1fc  .R_R_L_R_L_L_R_L
	defb 05fh,04ch,05fh,0feh,052h,05fh,052h,05fh,04ch,05fh,052h,05fh,04ch,05fh,052h,05fh	; b20c  _L_.R_R_L_R_L_R_
	defb 0a2h,0feh,049h,04eh,000h,04fh,052h,044h,045h,052h,05ch,0fdh,049h,000h,0f2h,047h	; b21c  ..IN.ORDER\.I..G
	defb 04fh,054h,0feh,0ceh,000h,052h,045h,04dh,041h,049h,04eh,044h,045h,052h,05ch,0fdh	; b22c  OT...REMAINDER\.
	defb 041h,04eh,059h,0f7h,05fh,0fdh,053h,045h,054h,000h,031h,036h,000h,055h,04eh,049h	; b23c  ANY._.SET.16.UNI
	defb 054h,053h,05ch,0fdh,0afh,000h,043h,041h,04eh,000h,0e5h,05fh,0feh,0a5h,0fdh,049h	; b24c  TS\...CAN.._...I
	defb 046h,000h,0afh,000h,043h,04fh,04dh,04dh,049h,054h,0feh,041h,04eh,000h,045h,052h	; b25c  F...COMMIT.AN.ER
	defb 052h,04fh,052h,0feh,049h,04eh,000h,0ceh,000h,04fh,052h,044h,045h,052h,05ch,0fdh	; b26c  ROR.IN...ORDER\.
	defb 0f8h,000h,048h,041h,053h,0feh,041h,04eh,000h,049h,05ch,044h,05ch,000h,0d4h,0fdh	; b27c  ..HAS.AN.I\D\...
	defb 0e6h,000h,047h,045h,054h,000h,04fh,055h,054h,000h,04fh,046h,0feh,0c5h,000h,04eh	; b28c  ..GET.OUT.OF...N
	defb 04fh,05ch,032h,05ch,0fdh,0afh,000h,0e7h,000h,055h,053h,045h,0feh,041h,000h,0cah	; b29c  O\2\.....USE.A..
	defb 0feh,0e6h,000h,0f9h,000h,0f8h,05ch,0ffh	; b2ac  ......\.

; ----------------------------------------------------------------------
; DATOS texto_126: el texto 126: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (50 bytes)
;   0xb2b4..0xb2e6  (50 bytes)
DATA_texto_126:
	defb 003h,0d1h,000h,0b2h,0a2h,0feh,053h,045h,043h,052h,045h,054h,000h,053h,055h,042h	; b2b4  ......SECRET.SUB
	defb 0f7h,000h,0abh,0feh,0ceh,000h,053h,04fh,055h,054h,048h,045h,041h,053h,054h,000h	; b2c4  ......SOUTHEAST.
	defb 0f5h,053h,000h,0afh,0feh,0e6h,000h,04eh,04fh,05ch,031h,000h,0c5h,05ch,0feh,0a2h	; b2d4  .S.....NO\1..\..
	defb 0adh,0ffh	; b2e4

; ----------------------------------------------------------------------
; DATOS texto_127: el texto 127: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (9 bytes)
;   0xb2e6..0xb2ef  (9 bytes)
DATA_texto_127:
	defb 000h,043h,04fh,04dh,045h,000h,049h,04eh,0ffh	; b2e6  .COME.IN.

; ----------------------------------------------------------------------
; DATOS texto_128: el texto 128: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (9 bytes)
;   0xb2ef..0xb2f8  (9 bytes)
DATA_texto_128:
	defb 000h,048h,045h,04ch,050h,000h,04dh,045h,0ffh	; b2ef  .HELP.ME.

; ----------------------------------------------------------------------
; DATOS texto_129: el texto 129: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (93 bytes)
;   0xb2f8..0xb355  (93 bytes)
DATA_texto_129:
	defb 011h,054h,048h,041h,04eh,04bh,000h,0afh,05ch,0fdh,049h,097h,04dh,000h,0ceh,000h	; b2f8  .THANK..\.I.M...
	defb 044h,041h,055h,047h,048h,054h,045h,052h,000h,04fh,046h,0feh,0c4h,05fh,0feh,0c9h	; b308  DAUGHTER.OF.._..
	defb 05ch,0fdh,04dh,059h,000h,046h,041h,054h,048h,045h,052h,000h,057h,041h,053h,0feh	; b318  \.MY.FATHER.WAS.
	defb 0f2h,043h,045h,044h,000h,0e6h,000h,044h,045h,056h,045h,04ch,04fh,050h,0feh,0a7h	; b328  .CED...DEVELOP..
	defb 05ch,0fdh,0d5h,000h,048h,045h,04ch,050h,0feh,04dh,059h,000h,046h,041h,054h,048h	; b338  \...HELP.MY.FATH
	defb 045h,052h,0feh,055h,052h,047h,045h,04eh,054h,04ch,059h,05ch,0ffh	; b348  ER.URGENTLY\.

; ----------------------------------------------------------------------
; DATOS texto_130: el texto 130: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (57 bytes)
;   0xb355..0xb38e  (57 bytes)
DATA_texto_130:
	defb 003h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,041h,04eh,000h,041h,04eh,054h,049h,044h	; b355  ........AN.ANTID
	defb 04fh,054h,045h,000h,049h,053h,000h,047h,04fh,04fh,044h,000h,0f2h,0feh,0ceh,000h	; b365  OTE.IS.GOOD.....
	defb 050h,04fh,049h,053h,04fh,04eh,000h,04fh,046h,0feh,041h,000h,053h,043h,04fh,052h	; b375  POISON.OF.A.SCOR
	defb 050h,049h,04fh,04eh,05ch,0feh,0a2h,0ddh,0ffh	; b385  PION\....

; ----------------------------------------------------------------------
; DATOS texto_131: el texto 131: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (3 bytes)
;   0xb38e..0xb391  (3 bytes)
DATA_texto_131:
	defb 000h,0b6h,0ffh	; b38e

; ----------------------------------------------------------------------
; DATOS texto_132: el texto 132: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (25 bytes)
;   0xb391..0xb3aa  (25 bytes)
DATA_texto_132:
	defb 003h,0d1h,000h,0a1h,0a2h,0feh,045h,04eh,054h,045h,052h,000h,0ceh,000h,04ch,045h	; b391  ......ENTER...LE
	defb 046h,054h,000h,0dbh,05ch,0feh,0a2h,0adh,0ffh	; b3a1  FT..\....

; ----------------------------------------------------------------------
; DATOS texto_133: el texto 133: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (39 bytes)
;   0xb3aa..0xb3d1  (39 bytes)
DATA_texto_133:
	defb 003h,0d1h,000h,0a1h,0a2h,0feh,043h,052h,045h,045h,050h,000h,049h,04eh,0e6h,000h	; b3aa  ......CREEP.IN..
	defb 0ceh,000h,0efh,0feh,0e2h,000h,0ceh,000h,052h,049h,047h,048h,054h,000h,053h,049h	; b3ba  ........RIGHT.SI
	defb 044h,045h,05ch,0feh,0a2h,0adh,0ffh	; b3ca

; ----------------------------------------------------------------------
; DATOS texto_134: el texto 134: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (25 bytes)
;   0xb3d1..0xb3ea  (25 bytes)
DATA_texto_134:
	defb 003h,0d1h,000h,0c8h,0a2h,0feh,0afh,000h,0e7h,000h,0fbh,000h,044h,04fh,057h,04eh	; b3d1  ............DOWN
	defb 0feh,0ceh,000h,0e8h,05ch,0feh,0a2h,0adh,0ffh	; b3e1  ....\....

; ----------------------------------------------------------------------
; DATOS texto_135: el texto 135: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (44 bytes)
;   0xb3ea..0xb416  (44 bytes)
DATA_texto_135:
	defb 003h,0d1h,000h,0c8h,0a2h,0feh,0ech,000h,049h,053h,000h,041h,04eh,000h,04fh,058h	; b3ea  ........IS.AN.OX
	defb 059h,047h,045h,04eh,0feh,043h,059h,04ch,049h,04eh,044h,045h,052h,000h,0e3h,059h	; b3fa  YGEN.CYLINDER..Y
	defb 04fh,04eh,044h,0feh,0ceh,000h,0e8h,05ch,0feh,0a2h,0adh,0ffh	; b40a  OND....\....

; ----------------------------------------------------------------------
; DATOS texto_136: el texto 136: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (69 bytes)
;   0xb416..0xb45b  (69 bytes)
DATA_texto_136:
	defb 013h,0d1h,000h,0a1h,0a2h,0feh,0cbh,03dh,0feh,053h,054h,04fh,050h,000h,0ceh,000h	; b416  .......=.STOP...
	defb 04fh,050h,045h,052h,041h,054h,049h,04fh,04eh,05ch,0feh,053h,057h,049h,054h,043h	; b426  OPERATION\.SWITC
	defb 048h,000h,04fh,046h,046h,000h,0afh,052h,000h,04dh,053h,058h,0feh,041h,054h,000h	; b436  H.OFF..R.MSX.AT.
	defb 0e2h,043h,045h,05ch,0fdh,0d1h,000h,0ceh,000h,043h,04fh,04dh,04dh,041h,04eh,044h	; b446  .CE\.....COMMAND
	defb 05ch,0feh,0a2h,0adh,0ffh	; b456

; ----------------------------------------------------------------------
; DATOS texto_137: el texto 137: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (92 bytes)
;   0xb45b..0xb4b7  (92 bytes)
DATA_texto_137:
	defb 013h,0d1h,000h,0c8h,0a2h,0feh,041h,000h,0d4h,000h,057h,048h,049h,043h,048h,000h	; b45b  ......A...WHICH.
	defb 04fh,050h,045h,04eh,0feh,0ceh,000h,04eh,045h,058h,054h,000h,0dbh,000h,04ch,049h	; b46b  OPEN...NEXT...LI
	defb 045h,053h,000h,049h,04eh,0feh,0ceh,000h,045h,041h,053h,054h,000h,04fh,046h,000h	; b47b  ES.IN...EAST.OF.
	defb 0c5h,000h,033h,05ch,0fdh,0ceh,000h,045h,041h,053h,054h,045h,052h,04eh,000h,053h	; b48b  ..3\...EASTERN.S
	defb 049h,044h,045h,000h,0f5h,053h,0feh,0e6h,000h,0ceh,000h,044h,049h,054h,043h,048h	; b49b  IDE..S.....DITCH
	defb 0feh,04fh,046h,000h,0c5h,000h,032h,05ch,0feh,0a2h,0adh,0ffh	; b4ab  .OF...2\....

; ----------------------------------------------------------------------
; DATOS texto_138: el texto 138: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (69 bytes)
;   0xb4b7..0xb4fc  (69 bytes)
DATA_texto_138:
	defb 013h,0d1h,000h,0b2h,0a2h,0feh,049h,000h,0bch,000h,044h,049h,053h,043h,04fh,056h	; b4b7  ......I...DISCOV
	defb 045h,052h,045h,044h,0feh,057h,048h,04fh,000h,0ceh,000h,042h,04fh,053h,053h,000h	; b4c7  ERED.WHO...BOSS.
	defb 04fh,046h,0feh,0a4h,000h,049h,053h,05ch,0fdh,0ceh,000h,042h,04fh,053h,053h,000h	; b4d7  OF...IS\...BOSS.
	defb 049h,053h,05ch,0a2h,0fdh,04fh,048h,000h,04eh,04fh,03eh,0feh,057h,048h,041h,05ch	; b4e7  IS\..OH.NO>.WHA\
	defb 041h,05ch,0a2h,0a2h,0ffh	; b4f7

; ----------------------------------------------------------------------
; DATOS texto_139: el texto 139: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (39 bytes)
;   0xb4fc..0xb523  (39 bytes)
DATA_texto_139:
	defb 001h,049h,097h,04dh,000h,043h,04fh,057h,041h,052h,044h,000h,044h,055h,043h,04bh	; b4fc  .I.M.COWARD.DUCK
	defb 03dh,0fdh,0afh,000h,0e1h,097h,054h,0fdh,053h,048h,04fh,04fh,054h,000h,04dh,045h	; b50c  =.....T.SHOOT.ME
	defb 05fh,0fdh,0e1h,000h,0afh,05bh,0ffh	; b51c

; ----------------------------------------------------------------------
; DATOS texto_140: el texto 140: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (59 bytes)
;   0xb523..0xb55e  (59 bytes)
DATA_texto_140:
	defb 011h,0b6h,03dh,0fdh,049h,097h,04dh,000h,041h,000h,042h,052h,04fh,054h,048h,045h	; b523  ..=.I.M.A.BROTHE
	defb 052h,000h,04fh,046h,0fdh,0c8h,05ch,0fdh,043h,04ch,049h,04dh,042h,000h,0ceh,000h	; b533  R.OF..\.CLIMB...
	defb 04ch,045h,046h,054h,0fdh,04ch,041h,044h,044h,045h,052h,0fdh,057h,048h,045h,04eh	; b543  LEFT.LADDER.WHEN
	defb 000h,045h,053h,043h,041h,050h,049h,04eh,047h,05ch,0ffh	; b553  .ESCAPING\.

; ----------------------------------------------------------------------
; DATOS texto_141: el texto 141: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (55 bytes)
;   0xb55e..0xb595  (55 bytes)
DATA_texto_141:
	defb 013h,0dch,000h,0d1h,000h,0d7h,0a2h,0fdh,055h,053h,045h,000h,0ceh,000h,048h,041h	; b55e  ........USE...HA
	defb 04eh,044h,000h,047h,055h,04eh,000h,0e6h,0feh,0b0h,000h,0ceh,000h,050h,052h,049h	; b56e  ND.GUN.......PRI
	defb 053h,04fh,04eh,045h,052h,053h,05fh,0feh,0e5h,000h,0e6h,000h,0f9h,000h,054h,048h	; b57e  SONERS_.......TH
	defb 045h,04dh,05ch,0feh,0a2h,0ddh,0ffh	; b58e

; ----------------------------------------------------------------------
; DATOS texto_142: el texto 142: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (78 bytes)
;   0xb595..0xb5e3  (78 bytes)
DATA_texto_142:
	defb 013h,0d1h,000h,0c8h,0a2h,0feh,043h,04fh,057h,041h,052h,044h,000h,044h,055h,043h	; b595  ......COWARD.DUC
	defb 04bh,000h,048h,041h,053h,000h,0d4h,000h,038h,05ch,0fdh,04dh,059h,000h,042h,052h	; b5a5  K.HAS...8\.MY.BR
	defb 04fh,054h,048h,045h,052h,000h,049h,053h,000h,041h,04dh,04fh,04eh,047h,0feh,0ceh	; b5b5  OTHER.IS.AMONG..
	defb 000h,043h,041h,050h,054h,049h,056h,045h,053h,05ch,0feh,0d5h,000h,044h,04fh,04eh	; b5c5  .CAPTIVES\...DON
	defb 097h,054h,000h,0f9h,000h,054h,048h,045h,04dh,05ch,0feh,0a2h,0adh,0ffh	; b5d5  .T...THEM\....

; ----------------------------------------------------------------------
; DATOS texto_144: el texto 144: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (71 bytes)
;   0xb5e3..0xb62a  (71 bytes)
DATA_texto_144:
	defb 011h,0b6h,03dh,0fdh,042h,04fh,053h,053h,000h,04fh,046h,0feh,0a4h,000h,049h,053h	; b5e3  ..=.BOSS.OF...IS
	defb 0feh,0a1h,05fh,0fdh,047h,045h,04eh,045h,052h,041h,04ch,000h,043h,04fh,04dh,04dh	; b5f3  .._.GENERAL.COMM
	defb 041h,04eh,044h,041h,04eh,054h,0feh,04fh,046h,000h,0b7h,05ch,0fdh,045h,056h,045h	; b603  ANDANT.OF..\.EVE
	defb 052h,059h,054h,048h,049h,04eh,047h,000h,049h,053h,000h,044h,04fh,04eh,045h,0feh	; b613  RYTHING.IS.DONE.
	defb 0ebh,000h,048h,049h,04dh,05ch,0ffh	; b623

; ----------------------------------------------------------------------
; DATOS texto_146: el texto 146: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (23 bytes)
;   0xb62a..0xb641  (23 bytes)
DATA_texto_146:
	defb 003h,0d1h,000h,0c8h,0a2h,0feh,0afh,000h,0c2h,000h,052h,055h,04eh,000h,046h,041h	; b62a  ..........RUN.FA
	defb 053h,054h,05ch,0feh,0a2h,0adh,0ffh	; b63a

; ----------------------------------------------------------------------
; DATOS texto_147: el texto 147: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (240
;   bytes)
;   0xb641..0xb731  (240 bytes)
DATA_texto_147:
	defb 011h,0cbh,03dh,0feh,0afh,097h,056h,045h,000h,046h,049h,04eh,041h,04ch,04ch,059h	; b641  ..=...VE.FINALLY
	defb 0feh,043h,04fh,04dh,045h,000h,0f4h,05ch,0fdh,059h,045h,041h,048h,05fh,049h,097h	; b651  .COME..\.YEAH_I.
	defb 04dh,000h,0a1h,0feh,047h,045h,04eh,045h,052h,041h,04ch,000h,043h,04fh,04dh,04dh	; b661  M...GENERAL.COMM
	defb 041h,04eh,044h,041h,04eh,054h,0feh,04fh,046h,000h,0b7h,05ch,0fdh,0dah,000h,049h	; b671  ANDANT.OF..\...I
	defb 04eh,000h,043h,048h,041h,052h,047h,045h,000h,04fh,046h,0feh,054h,048h,049h,053h	; b681  N.CHARGE.OF.THIS
	defb 000h,0fah,05fh,0feh,0a4h,05ch,0fdh,049h,000h,047h,041h,056h,045h,000h,0afh,0feh	; b691  .._..\.I.GAVE...
	defb 049h,04eh,053h,054h,052h,055h,043h,054h,049h,04fh,04eh,053h,0feh,0e6h,000h,042h	; b6a1  INSTRUCTIONS...B
	defb 052h,049h,04eh,047h,000h,042h,041h,043h,04bh,0fdh,046h,041h,04ch,053h,045h,000h	; b6b1  RING.BACK.FALSE.
	defb 049h,04eh,0f2h,04dh,041h,054h,049h,04fh,04eh,0feh,04fh,046h,000h,0a7h,05ch,0fdh	; b6c1  IN.MATION.OF..\.
	defb 048h,04fh,057h,045h,056h,045h,052h,05fh,0feh,0afh,000h,041h,043h,043h,04fh,04dh	; b6d1  HOWEVER_...ACCOM
	defb 050h,04ch,049h,053h,048h,045h,044h,0feh,0e6h,04fh,000h,04dh,055h,043h,048h,05ch	; b6e1  PLISHED..O.MUCH\
	defb 0fdh,0afh,000h,0bch,0feh,0d0h,04ch,059h,000h,053h,04dh,041h,053h,048h,045h,044h	; b6f1  ......LY.SMASHED
	defb 0feh,04dh,059h,000h,041h,04dh,042h,049h,054h,049h,04fh,04eh,053h,05ch,0fdh,0cbh	; b701  .MY.AMBITIONS\..
	defb 03eh,0fdh,049h,000h,0c1h,000h,0e5h,0feh,044h,049h,045h,000h,041h,04ch,04fh,04eh	; b711  >.I.....DIE.ALON
	defb 045h,05ch,0fdh,0afh,000h,0c1h,000h,04ah,04fh,049h,04eh,000h,04dh,045h,05ch,0ffh	; b721  E\.....JOIN.ME\.

; ----------------------------------------------------------------------
; DATOS texto_148: el texto 148: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (74 bytes)
;   0xb731..0xb77b  (74 bytes)
DATA_texto_148:
	defb 013h,0d1h,000h,0c8h,0a2h,0feh,0afh,000h,0e1h,000h,045h,058h,054h,045h,04eh,044h	; b731  ..........EXTEND
	defb 000h,0ceh,000h,054h,049h,04dh,045h,0feh,04ch,049h,04dh,049h,054h,000h,0ebh,000h	; b741  ...TIME.LIMIT...
	defb 055h,053h,049h,04eh,047h,0feh,041h,000h,043h,049h,047h,041h,052h,045h,054h,054h	; b751  USING.A.CIGARETT
	defb 045h,05ch,0fdh,0d5h,000h,052h,045h,054h,055h,052h,04eh,000h,049h,04eh,0feh,053h	; b761  E\...RETURN.IN.S
	defb 041h,046h,045h,054h,059h,05fh,0feh,0cbh,03dh,0ffh	; b771  AFETY_..=.

; ----------------------------------------------------------------------
; DATOS texto_149: el texto 149: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (99 bytes)
;   0xb77b..0xb7de  (99 bytes)
DATA_texto_149:
	defb 013h,0d1h,000h,0d7h,0a2h,0feh,049h,000h,044h,04fh,04eh,097h,054h,000h,04bh,04eh	; b77b  ......I.DON.T.KN
	defb 04fh,057h,000h,048h,04fh,057h,000h,0e6h,0feh,0e9h,000h,0a1h,05ch,0feh,049h,054h	; b78b  OW.HOW......\.IT
	defb 000h,041h,04ch,04ch,000h,044h,045h,050h,045h,04eh,044h,053h,000h,0e2h,000h,0afh	; b79b  .ALL.DEPENDS....
	defb 05ch,0feh,0cbh,03dh,0fdh,049h,000h,04ch,04fh,056h,045h,0a2h,05ch,0feh,04eh,04fh	; b7ab  \..=.I.LOVE.\.NO
	defb 05fh,049h,054h,000h,057h,041h,053h,0feh,041h,000h,04dh,045h,052h,045h,000h,04eh	; b7bb  _IT.WAS.A.MERE.N
	defb 04fh,054h,048h,049h,04eh,047h,03dh,0feh,047h,04fh,04fh,044h,000h,04ch,055h,043h	; b7cb  OTHING=.GOOD.LUC
	defb 04bh,03eh,0ffh	; b7db

; ----------------------------------------------------------------------
; DATOS texto_150: el texto 150: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (63 bytes)
;   0xb7de..0xb81d  (63 bytes)
DATA_texto_150:
	defb 001h,0cch,03eh,0fdh,0cch,03eh,0fdh,0ceh,0feh,053h,045h,04ch,046h,040h,0cdh,0feh	; b7de  ..>..>...SELF@..
	defb 053h,057h,049h,054h,043h,048h,000h,04fh,046h,0fdh,0a4h,000h,048h,041h,053h,0feh	; b7ee  SWITCH.OF...HAS.
	defb 0e3h,045h,04eh,000h,041h,043h,054h,049h,056h,041h,054h,045h,044h,05ch,0fdh,045h	; b7fe  .EN.ACTIVATED\.E
	defb 053h,043h,041h,050h,045h,000h,051h,055h,049h,043h,04bh,04ch,059h,03eh,0ffh	; b80e  SCAPE.QUICKLY>.

; ----------------------------------------------------------------------
; DATOS texto_155: el texto 155: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (97 bytes)
;   0xb81d..0xb87e  (97 bytes)
DATA_texto_155:
	defb 013h,0d1h,000h,0cbh,0a2h,0feh,0a7h,097h,053h,0feh,0cdh,000h,049h,053h,0feh,041h	; b81d  ........S...IS.A
	defb 000h,053h,055h,043h,043h,045h,053h,053h,05ch,0fdh,04fh,050h,045h,052h,041h,054h	; b82d  .SUCCESS\.OPERAT
	defb 049h,04fh,04eh,000h,000h,0a3h,000h,04eh,033h,031h,033h,0feh,046h,049h,04eh,049h	; b83d  ION....N313.FINI
	defb 053h,048h,045h,044h,03dh,0a2h,0fdh,045h,056h,045h,052h,059h,054h,048h,049h,04eh	; b84d  SHED=..EVERYTHIN
	defb 047h,000h,049h,053h,000h,046h,049h,04eh,049h,053h,048h,045h,044h,05ch,0fdh,049h	; b85d  G.IS.FINISHED\.I
	defb 000h,0c1h,000h,047h,04fh,000h,042h,041h,043h,04bh,000h,0ach,05ch,0feh,0a2h,0adh	; b86d  ...GO.BACK..\...
	defb 0ffh	; b87d

; ----------------------------------------------------------------------
; DATOS texto_156: el texto 156: [tipo de ventana] y los caracteres; 0xFE
;   salto de linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el
;   trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (40 bytes)
;   0xb87e..0xb8a6  (40 bytes)
DATA_texto_156:
	defb 003h,0dch,000h,0d1h,000h,0d7h,0a2h,0feh,049h,000h,053h,055h,050h,050h,04fh,053h	; b87e  ........I.SUPPOS
	defb 045h,000h,054h,048h,045h,059h,000h,0bch,0feh,041h,000h,053h,049h,04ch,045h,04eh	; b88e  E.THEY...A.SILEN
	defb 043h,045h,052h,05ch,0feh,0a2h,0ddh,0ffh	; b89e  CER\....

; ----------------------------------------------------------------------
; DATOS texto_5: el texto 5: [tipo de ventana] y los caracteres; 0xFE salto de
;   linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete el trozo
;   0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0); lo leen p00:52E0 (1 bytes)
;   0xb8a6..0xb8a7  (1 bytes)
DATA_texto_5:
	defb 0ffh	; b8a6

; ----------------------------------------------------------------------
; DATOS indice_de_trozos_de_texto: 92 punteros a trozos de texto que los
;   textos meten con los codigos 0xA1-0xFC (p00:5302); lo leen p00:5302 (184
;   bytes)
;   0xb8a7..0xb95f  (184 bytes)
DATA_indice_de_trozos_de_texto:
	defw 0b95fh,0b968h,0b96ch,0b974h,0b981h,0b98ah,0b99eh,0b9a9h	; b8a7
	defw 0b9b1h,0b9bah,0b9c5h,0b9cah,0b9ceh,0b9d3h,0b9d8h,0b9dch	; b8b7
	defw 0b9e4h,0b9efh,0b9fch,0ba05h,0ba0ch,0ba13h,0ba1bh,0ba25h	; b8c7
	defw 0ba2bh,0ba33h,0ba3dh,0ba43h,0ba48h,0ba51h,0ba58h,0ba61h	; b8d7
	defw 0ba66h,0ba6bh,0ba70h,0ba75h,0ba83h,0ba8ch,0ba95h,0ba9bh	; b8e7
	defw 0baa4h,0baaah,0babah,0bac6h,0bad0h,0badch,0bae0h,0baeah	; b8f7
	defw 0baf3h,0bafbh,0bb02h,0bb0dh,0bb12h,0bb19h,0bb1eh,0bb24h	; b907
	defw 0bb29h,0bb2eh,0bb32h,0bb37h,0bb3eh,0bb42h,0bb52h,0bb61h	; b917
	defw 0bb69h,0bb6dh,0bb70h,0bb73h,0bb7dh,0bb81h,0bb84h,0bb8bh	; b927
	defw 0bb90h,0bb97h,0bb9dh,0bba0h,0bba6h,0bbabh,0bbb0h,0bbb6h	; b937
	defw 0bbbah,0bbc1h,0bbc5h,0bbd5h,0bbdah,0bbdfh,0bbe4h,0bbe8h	; b947
	defw 0bbf2h,0bbf7h,0bc00h,0bc06h	; b957  -> DATA_trozo_F9 DATA_trozo_FA DATA_trozo_FB DATA_trozo_FC

; ----------------------------------------------------------------------
; DATOS trozo_A1: trozo de texto 0xA1: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xb95f..0xb968  (9 bytes)
DATA_trozo_A1:
	defb 042h,049h,047h,000h,042h,04fh,053h,053h,0ffh	; b95f  BIG.BOSS.

; ----------------------------------------------------------------------
; DATOS trozo_A2: trozo de texto 0xA2: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xb968..0xb96c  (4 bytes)
DATA_trozo_A2:
	defb 05ch,05ch,05ch,0ffh	; b968

; ----------------------------------------------------------------------
; DATOS trozo_A3: trozo de texto 0xA3: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (8 bytes)
;   0xb96c..0xb974  (8 bytes)
DATA_trozo_A3:
	defb 049h,04eh,054h,052h,055h,044h,045h,0ffh	; b96c  INTRUDE.

; ----------------------------------------------------------------------
; DATOS trozo_A4: trozo de texto 0xA4: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (13 bytes)
;   0xb974..0xb981  (13 bytes)
DATA_trozo_A4:
	defb 04fh,055h,054h,045h,052h,000h,048h,045h,041h,056h,045h,04eh,0ffh	; b974  OUTER.HEAVEN.

; ----------------------------------------------------------------------
; DATOS trozo_A5: trozo de texto 0xA5: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xb981..0xb98a  (9 bytes)
DATA_trozo_A5:
	defb 044h,045h,053h,054h,04fh,052h,04fh,059h,0ffh	; b981  DESTOROY.

; ----------------------------------------------------------------------
; DATOS trozo_A6: trozo de texto 0xA6: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (20 bytes)
;   0xb98a..0xb99e  (20 bytes)
DATA_trozo_A6:
	defb 054h,048h,045h,000h,055h,04ch,054h,049h,04dh,041h,054h,045h,000h,057h,045h,041h	; b98a  THE.ULTIMATE.WEA
	defb 050h,04fh,04eh,0ffh	; b99a

; ----------------------------------------------------------------------
; DATOS trozo_A7: trozo de texto 0xA7: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (11 bytes)
;   0xb99e..0xb9a9  (11 bytes)
DATA_trozo_A7:
	defb 04dh,045h,054h,041h,04ch,000h,047h,045h,041h,052h,0ffh	; b99e  METAL.GEAR.

; ----------------------------------------------------------------------
; DATOS trozo_A8: trozo de texto 0xA8: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (8 bytes)
;   0xb9a9..0xb9b1  (8 bytes)
DATA_trozo_A8:
	defb 043h,04fh,04eh,054h,041h,043h,054h,0ffh	; b9a9  CONTACT.

; ----------------------------------------------------------------------
; DATOS trozo_A9: trozo de texto 0xA9: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xb9b1..0xb9ba  (9 bytes)
DATA_trozo_A9:
	defb 047h,052h,045h,059h,000h,046h,04fh,058h,0ffh	; b9b1  GREY.FOX.

; ----------------------------------------------------------------------
; DATOS trozo_AA: trozo de texto 0xAA: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (11 bytes)
;   0xb9ba..0xb9c5  (11 bytes)
DATA_trozo_AA:
	defb 053h,045h,041h,052h,043h,048h,000h,046h,04fh,052h,0ffh	; b9ba  SEARCH.FOR.

; ----------------------------------------------------------------------
; DATOS trozo_AB: trozo de texto 0xAB: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xb9c5..0xb9ca  (5 bytes)
DATA_trozo_AB:
	defb 046h,052h,04fh,04dh,0ffh	; b9c5

; ----------------------------------------------------------------------
; DATOS trozo_AC: trozo de texto 0xAC: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xb9ca..0xb9ce  (4 bytes)
DATA_trozo_AC:
	defb 04eh,04fh,057h,0ffh	; b9ca

; ----------------------------------------------------------------------
; DATOS trozo_AD: trozo de texto 0xAD: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xb9ce..0xb9d3  (5 bytes)
DATA_trozo_AD:
	defb 04fh,056h,045h,052h,0ffh	; b9ce

; ----------------------------------------------------------------------
; DATOS trozo_AE: trozo de texto 0xAE: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xb9d3..0xb9d8  (5 bytes)
DATA_trozo_AE:
	defb 04dh,04fh,056h,045h,0ffh	; b9d3

; ----------------------------------------------------------------------
; DATOS trozo_AF: trozo de texto 0xAF: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xb9d8..0xb9dc  (4 bytes)
DATA_trozo_AF:
	defb 059h,04fh,055h,0ffh	; b9d8

; ----------------------------------------------------------------------
; DATOS trozo_B0: trozo de texto 0xB0: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (8 bytes)
;   0xb9dc..0xb9e4  (8 bytes)
DATA_trozo_B0:
	defb 043h,041h,050h,054h,055h,052h,045h,0ffh	; b9dc  CAPTURE.

; ----------------------------------------------------------------------
; DATOS trozo_B1: trozo de texto 0xB1: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (11 bytes)
;   0xb9e4..0xb9ef  (11 bytes)
DATA_trozo_B1:
	defb 052h,045h,053h,049h,053h,054h,041h,04eh,043h,045h,0ffh	; b9e4  RESISTANCE.

; ----------------------------------------------------------------------
; DATOS trozo_B2: trozo de texto 0xB2: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (13 bytes)
;   0xb9ef..0xb9fc  (13 bytes)
DATA_trozo_B2:
	defb 04dh,052h,05ch,053h,043h,048h,04eh,045h,049h,044h,045h,052h,0ffh	; b9ef  MR\SCHNEIDER.

; ----------------------------------------------------------------------
; DATOS trozo_B3: trozo de texto 0xB3: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xb9fc..0xba05  (9 bytes)
DATA_trozo_B3:
	defb 057h,041h,056h,045h,042h,041h,04eh,044h,0ffh	; b9fc  WAVEBAND.

; ----------------------------------------------------------------------
; DATOS trozo_B4: trozo de texto 0xB4: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xba05..0xba0c  (7 bytes)
DATA_trozo_B4:
	defb 050h,055h,054h,000h,04fh,04eh,0ffh	; ba05

; ----------------------------------------------------------------------
; DATOS trozo_B5: trozo de texto 0xB5: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xba0c..0xba13  (7 bytes)
DATA_trozo_B5:
	defb 04ch,045h,041h,044h,045h,052h,0ffh	; ba0c

; ----------------------------------------------------------------------
; DATOS trozo_B6: trozo de texto 0xB6: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (8 bytes)
;   0xba13..0xba1b  (8 bytes)
DATA_trozo_B6:
	defb 052h,045h,053h,043h,055h,045h,044h,0ffh	; ba13  RESCUED.

; ----------------------------------------------------------------------
; DATOS trozo_B7: trozo de texto 0xB7: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (10 bytes)
;   0xba1b..0xba25  (10 bytes)
DATA_trozo_B7:
	defb 046h,04fh,058h,000h,048h,04fh,055h,04eh,044h,0ffh	; ba1b  FOX.HOUND.

; ----------------------------------------------------------------------
; DATOS trozo_B8: trozo de texto 0xB8: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xba25..0xba2b  (6 bytes)
DATA_trozo_B8:
	defb 045h,04eh,045h,04dh,059h,0ffh	; ba25

; ----------------------------------------------------------------------
; DATOS trozo_B9: trozo de texto 0xB9: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (8 bytes)
;   0xba2b..0xba33  (8 bytes)
DATA_trozo_B9:
	defb 04bh,045h,059h,000h,046h,04fh,052h,0ffh	; ba2b  KEY.FOR.

; ----------------------------------------------------------------------
; DATOS trozo_BA: trozo de texto 0xBA: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (10 bytes)
;   0xba33..0xba3d  (10 bytes)
DATA_trozo_BA:
	defb 053h,045h,04ch,045h,043h,054h,049h,04eh,047h,0ffh	; ba33  SELECTING.

; ----------------------------------------------------------------------
; DATOS trozo_BB: trozo de texto 0xBB: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xba3d..0xba43  (6 bytes)
DATA_trozo_BB:
	defb 043h,048h,045h,043h,04bh,0ffh	; ba3d

; ----------------------------------------------------------------------
; DATOS trozo_BC: trozo de texto 0xBC: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xba43..0xba48  (5 bytes)
DATA_trozo_BC:
	defb 048h,041h,056h,045h,0ffh	; ba43

; ----------------------------------------------------------------------
; DATOS trozo_BD: trozo de texto 0xBD: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xba48..0xba51  (9 bytes)
DATA_trozo_BD:
	defb 043h,04fh,04eh,046h,049h,04eh,045h,044h,0ffh	; ba48  CONFINED.

; ----------------------------------------------------------------------
; DATOS trozo_BE: trozo de texto 0xBE: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xba51..0xba58  (7 bytes)
DATA_trozo_BE:
	defb 053h,045h,043h,052h,045h,054h,0ffh	; ba51

; ----------------------------------------------------------------------
; DATOS trozo_BF: trozo de texto 0xBF: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xba58..0xba61  (9 bytes)
DATA_trozo_BF:
	defb 053h,04fh,04ch,049h,054h,041h,052h,059h,0ffh	; ba58  SOLITARY.

; ----------------------------------------------------------------------
; DATOS trozo_C0: trozo de texto 0xC0: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xba61..0xba66  (5 bytes)
DATA_trozo_C0:
	defb 043h,045h,04ch,04ch,0ffh	; ba61

; ----------------------------------------------------------------------
; DATOS trozo_C1: trozo de texto 0xC1: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xba66..0xba6b  (5 bytes)
DATA_trozo_C1:
	defb 057h,049h,04ch,04ch,0ffh	; ba66

; ----------------------------------------------------------------------
; DATOS trozo_C2: trozo de texto 0xC2: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xba6b..0xba70  (5 bytes)
DATA_trozo_C2:
	defb 04dh,055h,053h,054h,0ffh	; ba6b

; ----------------------------------------------------------------------
; DATOS trozo_C3: trozo de texto 0xC3: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xba70..0xba75  (5 bytes)
DATA_trozo_C3:
	defb 04fh,04eh,04ch,059h,0ffh	; ba70

; ----------------------------------------------------------------------
; DATOS trozo_C4: trozo de texto 0xC4: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (14 bytes)
;   0xba75..0xba83  (14 bytes)
DATA_trozo_C4:
	defb 044h,052h,05ch,050h,045h,054h,054h,052h,04fh,056h,049h,043h,048h,0ffh	; ba75  DR\PETTROVICH.

; ----------------------------------------------------------------------
; DATOS trozo_C5: trozo de texto 0xC5: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xba83..0xba8c  (9 bytes)
DATA_trozo_C5:
	defb 042h,055h,049h,04ch,044h,049h,04eh,047h,0ffh	; ba83  BUILDING.

; ----------------------------------------------------------------------
; DATOS trozo_C6: trozo de texto 0xC6: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xba8c..0xba95  (9 bytes)
DATA_trozo_C6:
	defb 042h,041h,053h,045h,04dh,045h,04eh,054h,0ffh	; ba8c  BASEMENT.

; ----------------------------------------------------------------------
; DATOS trozo_C7: trozo de texto 0xC7: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xba95..0xba9b  (6 bytes)
DATA_trozo_C7:
	defb 046h,04ch,04fh,04fh,052h,0ffh	; ba95

; ----------------------------------------------------------------------
; DATOS trozo_C8: trozo de texto 0xC8: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xba9b..0xbaa4  (9 bytes)
DATA_trozo_C8:
	defb 04ah,045h,04eh,04eh,049h,046h,045h,052h,0ffh	; ba9b  JENNIFER.

; ----------------------------------------------------------------------
; DATOS trozo_C9: trozo de texto 0xC9: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xbaa4..0xbaaa  (6 bytes)
DATA_trozo_C9:
	defb 045h,04ch,04ch,045h,04eh,0ffh	; baa4

; ----------------------------------------------------------------------
; DATOS trozo_CA: trozo de texto 0xCA: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (16 bytes)
;   0xbaaa..0xbaba  (16 bytes)
DATA_trozo_CA:
	defb 052h,04fh,043h,04bh,045h,054h,000h,04ch,041h,055h,04eh,043h,048h,045h,052h,0ffh	; baaa  ROCKET.LAUNCHER.

; ----------------------------------------------------------------------
; DATOS trozo_CB: trozo de texto 0xCB: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (12 bytes)
;   0xbaba..0xbac6  (12 bytes)
DATA_trozo_CB:
	defb 053h,04fh,04ch,049h,044h,000h,053h,04eh,041h,04bh,045h,0ffh	; baba  SOLID.SNAKE.

; ----------------------------------------------------------------------
; DATOS trozo_CC: trozo de texto 0xCC: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (10 bytes)
;   0xbac6..0xbad0  (10 bytes)
DATA_trozo_CC:
	defb 045h,04dh,045h,052h,047h,045h,04eh,043h,059h,0ffh	; bac6  EMERGENCY.

; ----------------------------------------------------------------------
; DATOS trozo_CD: trozo de texto 0xCD: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (12 bytes)
;   0xbad0..0xbadc  (12 bytes)
DATA_trozo_CD:
	defb 044h,045h,053h,054h,052h,055h,043h,054h,049h,04fh,04eh,0ffh	; bad0  DESTRUCTION.

; ----------------------------------------------------------------------
; DATOS trozo_CE: trozo de texto 0xCE: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbadc..0xbae0  (4 bytes)
DATA_trozo_CE:
	defb 054h,048h,045h,0ffh	; badc

; ----------------------------------------------------------------------
; DATOS trozo_CF: trozo de texto 0xCF: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (10 bytes)
;   0xbae0..0xbaea  (10 bytes)
DATA_trozo_CF:
	defb 043h,04fh,055h,052h,054h,059h,041h,052h,044h,0ffh	; bae0  COURTYARD.

; ----------------------------------------------------------------------
; DATOS trozo_D0: trozo de texto 0xD0: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xbaea..0xbaf3  (9 bytes)
DATA_trozo_D0:
	defb 043h,04fh,04dh,050h,04ch,045h,054h,045h,0ffh	; baea  COMPLETE.

; ----------------------------------------------------------------------
; DATOS trozo_D1: trozo de texto 0xD1: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (8 bytes)
;   0xbaf3..0xbafb  (8 bytes)
DATA_trozo_D1:
	defb 054h,048h,049h,053h,000h,049h,053h,0ffh	; baf3  THIS.IS.

; ----------------------------------------------------------------------
; DATOS trozo_D2: trozo de texto 0xD2: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xbafb..0xbb02  (7 bytes)
DATA_trozo_D2:
	defb 057h,045h,041h,050h,04fh,04eh,0ffh	; bafb

; ----------------------------------------------------------------------
; DATOS trozo_D3: trozo de texto 0xD3: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (11 bytes)
;   0xbb02..0xbb0d  (11 bytes)
DATA_trozo_D3:
	defb 045h,051h,055h,049h,050h,04dh,045h,04eh,054h,053h,0ffh	; bb02  EQUIPMENTS.

; ----------------------------------------------------------------------
; DATOS trozo_D4: trozo de texto 0xD4: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbb0d..0xbb12  (5 bytes)
DATA_trozo_D4:
	defb 043h,041h,052h,044h,0ffh	; bb0d

; ----------------------------------------------------------------------
; DATOS trozo_D5: trozo de texto 0xD5: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xbb12..0xbb19  (7 bytes)
DATA_trozo_D5:
	defb 050h,04ch,045h,041h,053h,045h,0ffh	; bb12

; ----------------------------------------------------------------------
; DATOS trozo_D6: trozo de texto 0xD6: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbb19..0xbb1e  (5 bytes)
DATA_trozo_D6:
	defb 042h,041h,04eh,044h,0ffh	; bb19

; ----------------------------------------------------------------------
; DATOS trozo_D7: trozo de texto 0xD7: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xbb1e..0xbb24  (6 bytes)
DATA_trozo_D7:
	defb 044h,049h,041h,04eh,045h,0ffh	; bb1e

; ----------------------------------------------------------------------
; DATOS trozo_D8: trozo de texto 0xD8: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbb24..0xbb29  (5 bytes)
DATA_trozo_D8:
	defb 047h,041h,049h,04eh,0ffh	; bb24

; ----------------------------------------------------------------------
; DATOS trozo_D9: trozo de texto 0xD9: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbb29..0xbb2e  (5 bytes)
DATA_trozo_D9:
	defb 057h,049h,054h,048h,0ffh	; bb29

; ----------------------------------------------------------------------
; DATOS trozo_DA: trozo de texto 0xDA: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbb2e..0xbb32  (4 bytes)
DATA_trozo_DA:
	defb 041h,04eh,044h,0ffh	; bb2e

; ----------------------------------------------------------------------
; DATOS trozo_DB: trozo de texto 0xDB: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbb32..0xbb37  (5 bytes)
DATA_trozo_DB:
	defb 044h,04fh,04fh,052h,0ffh	; bb32

; ----------------------------------------------------------------------
; DATOS trozo_DC: trozo de texto 0xDC: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xbb37..0xbb3e  (7 bytes)
DATA_trozo_DC:
	defb 048h,045h,04ch,04ch,04fh,03dh,0ffh	; bb37

; ----------------------------------------------------------------------
; DATOS trozo_DD: trozo de texto 0xDD: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbb3e..0xbb42  (4 bytes)
DATA_trozo_DD:
	defb 042h,059h,045h,0ffh	; bb3e

; ----------------------------------------------------------------------
; DATOS trozo_DE: trozo de texto 0xDE: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (16 bytes)
;   0xbb42..0xbb52  (16 bytes)
DATA_trozo_DE:
	defb 04dh,041h,043h,048h,049h,04eh,045h,000h,047h,055h,04eh,000h,04bh,049h,044h,0ffh	; bb42  MACHINE.GUN.KID.

; ----------------------------------------------------------------------
; DATOS trozo_DF: trozo de texto 0xDF: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (15 bytes)
;   0xbb52..0xbb61  (15 bytes)
DATA_trozo_DF:
	defb 052h,045h,04dh,04fh,054h,045h,040h,043h,04fh,04eh,054h,052h,04fh,04ch,0ffh	; bb52  REMOTE@CONTROL.

; ----------------------------------------------------------------------
; DATOS trozo_E0: trozo de texto 0xE0: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (8 bytes)
;   0xbb61..0xbb69  (8 bytes)
DATA_trozo_E0:
	defb 04dh,049h,053h,053h,049h,04ch,045h,0ffh	; bb61  MISSILE.

; ----------------------------------------------------------------------
; DATOS trozo_E1: trozo de texto 0xE1: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbb69..0xbb6d  (4 bytes)
DATA_trozo_E1:
	defb 043h,041h,04eh,0ffh	; bb69

; ----------------------------------------------------------------------
; DATOS trozo_E2: trozo de texto 0xE2: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (3 bytes)
;   0xbb6d..0xbb70  (3 bytes)
DATA_trozo_E2:
	defb 04fh,04eh,0ffh	; bb6d

; ----------------------------------------------------------------------
; DATOS trozo_E3: trozo de texto 0xE3: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (3 bytes)
;   0xbb70..0xbb73  (3 bytes)
DATA_trozo_E3:
	defb 042h,045h,0ffh	; bb70

; ----------------------------------------------------------------------
; DATOS trozo_E4: trozo de texto 0xE4: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (10 bytes)
;   0xbb73..0xbb7d  (10 bytes)
DATA_trozo_E4:
	defb 041h,056h,041h,049h,04ch,041h,042h,04ch,045h,0ffh	; bb73  AVAILABLE.

; ----------------------------------------------------------------------
; DATOS trozo_E5: trozo de texto 0xE5: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbb7d..0xbb81  (4 bytes)
DATA_trozo_E5:
	defb 04eh,04fh,054h,0ffh	; bb7d

; ----------------------------------------------------------------------
; DATOS trozo_E6: trozo de texto 0xE6: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (3 bytes)
;   0xbb81..0xbb84  (3 bytes)
DATA_trozo_E6:
	defb 054h,04fh,0ffh	; bb81

; ----------------------------------------------------------------------
; DATOS trozo_E7: trozo de texto 0xE7: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xbb84..0xbb8b  (7 bytes)
DATA_trozo_E7:
	defb 053h,048h,04fh,055h,04ch,044h,0ffh	; bb84

; ----------------------------------------------------------------------
; DATOS trozo_E8: trozo de texto 0xE8: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbb8b..0xbb90  (5 bytes)
DATA_trozo_E8:
	defb 057h,041h,04ch,04ch,0ffh	; bb8b

; ----------------------------------------------------------------------
; DATOS trozo_E9: trozo de texto 0xE9: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xbb90..0xbb97  (7 bytes)
DATA_trozo_E9:
	defb 044h,045h,046h,045h,041h,054h,0ffh	; bb90

; ----------------------------------------------------------------------
; DATOS trozo_EA: trozo de texto 0xEA: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xbb97..0xbb9d  (6 bytes)
DATA_trozo_EA:
	defb 04eh,045h,056h,045h,052h,0ffh	; bb97

; ----------------------------------------------------------------------
; DATOS trozo_EB: trozo de texto 0xEB: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (3 bytes)
;   0xbb9d..0xbba0  (3 bytes)
DATA_trozo_EB:
	defb 042h,059h,0ffh	; bb9d

; ----------------------------------------------------------------------
; DATOS trozo_EC: trozo de texto 0xEC: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xbba0..0xbba6  (6 bytes)
DATA_trozo_EC:
	defb 054h,048h,045h,052h,045h,0ffh	; bba0

; ----------------------------------------------------------------------
; DATOS trozo_ED: trozo de texto 0xED: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbba6..0xbbab  (5 bytes)
DATA_trozo_ED:
	defb 04fh,050h,045h,04eh,0ffh	; bba6

; ----------------------------------------------------------------------
; DATOS trozo_EE: trozo de texto 0xEE: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbbab..0xbbb0  (5 bytes)
DATA_trozo_EE:
	defb 054h,041h,04bh,045h,0ffh	; bbab

; ----------------------------------------------------------------------
; DATOS trozo_EF: trozo de texto 0xEF: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xbbb0..0xbbb6  (6 bytes)
DATA_trozo_EF:
	defb 04ch,04fh,052h,052h,059h,0ffh	; bbb0

; ----------------------------------------------------------------------
; DATOS trozo_F0: trozo de texto 0xF0: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbbb6..0xbbba  (4 bytes)
DATA_trozo_F0:
	defb 047h,041h,053h,0ffh	; bbb6

; ----------------------------------------------------------------------
; DATOS trozo_F1: trozo de texto 0xF1: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (7 bytes)
;   0xbbba..0xbbc1  (7 bytes)
DATA_trozo_F1:
	defb 041h,043h,043h,045h,053h,053h,0ffh	; bbba

; ----------------------------------------------------------------------
; DATOS trozo_F2: trozo de texto 0xF2: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbbc1..0xbbc5  (4 bytes)
DATA_trozo_F2:
	defb 046h,04fh,052h,0ffh	; bbc1

; ----------------------------------------------------------------------
; DATOS trozo_F3: trozo de texto 0xF3: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (16 bytes)
;   0xbbc5..0xbbd5  (16 bytes)
DATA_trozo_F3:
	defb 042h,04fh,04dh,042h,000h,042h,04ch,041h,053h,054h,000h,053h,055h,049h,054h,0ffh	; bbc5  BOMB.BLAST.SUIT.

; ----------------------------------------------------------------------
; DATOS trozo_F4: trozo de texto 0xF4: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbbd5..0xbbda  (5 bytes)
DATA_trozo_F4:
	defb 048h,045h,052h,045h,0ffh	; bbd5

; ----------------------------------------------------------------------
; DATOS trozo_F5: trozo de texto 0xF5: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbbda..0xbbdf  (5 bytes)
DATA_trozo_F5:
	defb 04ch,045h,041h,044h,0ffh	; bbda

; ----------------------------------------------------------------------
; DATOS trozo_F6: trozo de texto 0xF6: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbbdf..0xbbe4  (5 bytes)
DATA_trozo_F6:
	defb 052h,04fh,04fh,04dh,0ffh	; bbdf

; ----------------------------------------------------------------------
; DATOS trozo_F7: trozo de texto 0xF7: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (4 bytes)
;   0xbbe4..0xbbe8  (4 bytes)
DATA_trozo_F7:
	defb 057h,041h,059h,0ffh	; bbe4

; ----------------------------------------------------------------------
; DATOS trozo_F8: trozo de texto 0xF8: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (10 bytes)
;   0xbbe8..0xbbf2  (10 bytes)
DATA_trozo_F8:
	defb 04dh,052h,05ch,041h,052h,04eh,04fh,04ch,044h,0ffh	; bbe8  MR\ARNOLD.

; ----------------------------------------------------------------------
; DATOS trozo_F9: trozo de texto 0xF9: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (5 bytes)
;   0xbbf2..0xbbf7  (5 bytes)
DATA_trozo_F9:
	defb 04bh,049h,04ch,04ch,0ffh	; bbf2

; ----------------------------------------------------------------------
; DATOS trozo_FA: trozo de texto 0xFA: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (9 bytes)
;   0xbbf7..0xbc00  (9 bytes)
DATA_trozo_FA:
	defb 046h,04fh,052h,054h,052h,045h,053h,053h,0ffh	; bbf7  FORTRESS.

; ----------------------------------------------------------------------
; DATOS trozo_FB: trozo de texto 0xFB: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (6 bytes)
;   0xbc00..0xbc06  (6 bytes)
DATA_trozo_FB:
	defb 042h,052h,045h,041h,04bh,0ffh	; bc00

; ----------------------------------------------------------------------
; DATOS trozo_FC: trozo de texto 0xFC: caracteres hasta 0xFF (p00:530A); lo
;   leen p00:530A (12 bytes)
;   0xbc06..0xbc12  (12 bytes)
DATA_trozo_FC:
	defb 054h,052h,041h,04eh,053h,043h,045h,049h,056h,045h,052h,0ffh	; bc06  TRANSCEIVER.

; ======================================================================
; CODIGO 0xbc12..0xbc3c  (42 bytes)
; ======================================================================


crea_metal_gear:		; con 0xC623 nada; si no, (ix+0x1B) = 0xC623 y el dibujo de Metal Gear
	ld a,(0c623h)		;bc12
	or a			;bc15
	jp nz,0413bh		;bc16
	ld hl,0c623h		;bc19
	ld (ix+01bh),l		;bc1c
	ld (ix+01ch),h		;bc1f
	ld (ix+00eh),003h		;bc22
dibujo_si_metal_gear:		; si el primer actor es el 0x11, el dibujo de Metal Gear en (0x60, 0x20)
	ld a,(0d000h)		;bc26   ; lee los 16 actores (fichas de 0x80)
	cp 011h		;bc29
	ret nz			;bc2b
	ld (ix+001h),000h		;bc2c
	ld de,06020h		;bc30
	jp 040f0h		;bc33   ; dibujo_de_metal_gear_y_vuelve: llama a dibujo_de_metal_gear (p00:44A7) y deja otra vez los bancos 1-2 y el de zona
dibujo_sin_metal_gear:		; el dibujo p15:B5F7 en (0x60, 0x20)
	ld de,06020h		;bc36
	jp 04109h		;bc39   ; dibujo_b5f7_y_vuelve: llama a dibujo_b5f7 (p00:44AC) y deja otra vez los bancos 1-2 y el de zona

; ----------------------------------------------------------------------
; DATOS relleno_ff: 964 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (964 bytes)
;   0xbc3c..0xc000  (964 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc3c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc4c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc5c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc6c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc7c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc8c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc9c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcac  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcbc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bccc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcdc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcec  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcfc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd0c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd1c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd2c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd3c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd4c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd5c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd6c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd7c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd8c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd9c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdac  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdbc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdcc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bddc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdec  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdfc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be0c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be1c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be2c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be3c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be4c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be5c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be6c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be7c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be8c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be9c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beac  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bebc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; becc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bedc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beec  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; befc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf0c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf1c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf2c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf3c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf4c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf5c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf6c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf7c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf8c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf9c  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfac  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfbc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfcc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfdc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfec  ................
	defb 0ffh,0ffh,0ffh,0ffh	; bffc
