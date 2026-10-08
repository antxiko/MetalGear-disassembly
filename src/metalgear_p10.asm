; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 10 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS indice_de_patrones_del_jugador: 53 punteros, uno por juego de patrones
;   de Snake (0xC18A), a sus patrones comprimidos: p00:53BA (L_42B4); lo leen
;   p00:53BA (106 bytes)
;   0x6000..0x606a  (106 bytes)
DATA_indice_de_patrones_del_jugador:
	defw 06781h,06708h,067f9h,064abh,06436h,06521h,0660dh,0659ah	; 6000
	defw 0668bh,068e8h,06873h,06965h,06d3fh,06cc9h,06dbdh,06a5dh	; 6010
	defw 069e0h,06ad6h,06bd0h,06b54h,06c4ch,06ebbh,06e3eh,06f36h	; 6020
	defw 070a6h,06fafh,0702fh,07125h,0721ch,0719ah,071dch,0725ch	; 6030
	defw 07320h,0729ch,072deh,07362h,073a4h,074ddh,07505h,0752eh	; 6040
	defw 075a1h,0767dh,076f1h,07617h,076f1h,0721ch,0719ah,071dch	; 6050
	defw 0725ch,07320h,0729ch,072deh,07362h	; 6060

; ----------------------------------------------------------------------
; DATOS atributos_por_juego_del_jugador: 53 bytes: que lista de atributos de
;   0x609F usa cada juego de patrones (p00:531E, p00:5364); lo leen p00:531E
;   (53 bytes)
;   0x606a..0x609f  (53 bytes)
DATA_atributos_por_juego_del_jugador:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 606a  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,006h,001h,001h,001h,001h	; 607a  ................
	defb 001h,001h,001h,001h,005h,004h,004h,000h,000h,002h,003h,007h,008h,009h,009h,009h	; 608a  ................
	defb 009h,009h,009h,009h,009h	; 609a

; ----------------------------------------------------------------------
; DATOS indice_de_atributos_del_jugador: 10 punteros a las listas de atributos
;   de Snake (p00:5328, p00:536E); lo leen p00:5328 (20 bytes)
;   0x609f..0x60b3  (20 bytes)
DATA_indice_de_atributos_del_jugador:
	defw 060b3h,060c4h,060b3h,060d5h,060e6h,060f7h,06128h,06139h	; 609f
	defw 06152h,06163h	; 60af  -> DATA_atributos_de_snake_8 DATA_atributos_de_snake_9

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_0: [cuantos] y 4 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; se solapan 2 bloques:
;   (atributos_de_snake_2 60B3-60C4); lo leen p00:533C (17 bytes)
;   0x60b3..0x60c4  (17 bytes)
DATA_atributos_de_snake_0:
	defb 004h	; 60b3
	defb 0e8h,0f8h,000h,007h	; 60b4
	defb 0e8h,0f8h,004h,04ah	; 60b8
	defb 0f8h,0f8h,008h,007h	; 60bc
	defb 0f8h,0f8h,00ch,04ch	; 60c0

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_1: [cuantos] y 4 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (17
;   bytes)
;   0x60c4..0x60d5  (17 bytes)
DATA_atributos_de_snake_1:
	defb 004h	; 60c4
	defb 0f6h,0f8h,000h,007h	; 60c5
	defb 0f6h,0f8h,004h,04ah	; 60c9
	defb 080h,000h,000h,000h	; 60cd
	defb 080h,000h,000h,000h	; 60d1

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_3: [cuantos] y 4 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (17
;   bytes)
;   0x60d5..0x60e6  (17 bytes)
DATA_atributos_de_snake_3:
	defb 004h	; 60d5
	defb 0e4h,0f8h,000h,007h	; 60d6
	defb 0e4h,0f8h,004h,04ah	; 60da
	defb 0f4h,0f8h,008h,007h	; 60de
	defb 0f4h,0f8h,00ch,04ah	; 60e2

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_4: [cuantos] y 4 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (17
;   bytes)
;   0x60e6..0x60f7  (17 bytes)
DATA_atributos_de_snake_4:
	defb 004h	; 60e6
	defb 0f8h,0f8h,000h,00eh	; 60e7
	defb 0f8h,0f8h,004h,00fh	; 60eb
	defb 080h,000h,000h,000h	; 60ef
	defb 080h,000h,000h,000h	; 60f3

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_5: [cuantos] y 12 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (49
;   bytes)
;   0x60f7..0x6128  (49 bytes)
DATA_atributos_de_snake_5:
	defb 00ch	; 60f7
	defb 0e8h,0f8h,028h,007h	; 60f8
	defb 0e8h,0f8h,02ch,04ah	; 60fc
	defb 0f8h,0f8h,000h,007h	; 6100
	defb 0f8h,0f8h,004h,04ch	; 6104
	defb 0c8h,0f0h,008h,00dh	; 6108
	defb 0c8h,0f0h,00ch,04eh	; 610c
	defb 0c8h,000h,010h,00dh	; 6110
	defb 0c8h,000h,014h,04eh	; 6114
	defb 0d8h,0f0h,018h,00dh	; 6118
	defb 0d8h,0f0h,01ch,00fh	; 611c
	defb 0d8h,000h,020h,00dh	; 6120
	defb 0d8h,000h,024h,00fh	; 6124

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_6: [cuantos] y 4 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (17
;   bytes)
;   0x6128..0x6139  (17 bytes)
DATA_atributos_de_snake_6:
	defb 004h	; 6128
	defb 0e8h,0fbh,000h,007h	; 6129
	defb 0e8h,0fbh,004h,04ah	; 612d
	defb 0f8h,0f8h,008h,007h	; 6131
	defb 0f8h,0f8h,00ch,04ch	; 6135

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_7: [cuantos] y 6 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (25
;   bytes)
;   0x6139..0x6152  (25 bytes)
DATA_atributos_de_snake_7:
	defb 006h	; 6139
	defb 0e8h,0f8h,000h,007h	; 613a
	defb 0e8h,0f8h,004h,04ah	; 613e
	defb 0f8h,0f8h,008h,007h	; 6142
	defb 0f8h,0f8h,00ch,04ch	; 6146
	defb 080h,000h,000h,000h	; 614a
	defb 080h,000h,000h,000h	; 614e

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_8: [cuantos] y 4 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (17
;   bytes)
;   0x6152..0x6163  (17 bytes)
DATA_atributos_de_snake_8:
	defb 004h	; 6152
	defb 0e3h,0f8h,000h,007h	; 6153
	defb 0e3h,0f8h,004h,04ah	; 6157
	defb 0f3h,0f8h,008h,007h	; 615b
	defb 0f3h,0f8h,00ch,04ah	; 615f

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_9: [cuantos] y 4 fichas [y][x][patron][color]:
;   p00:5341 suma la posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40),
;   y p00:5394 copia el color 16 veces a 0xE800/0xE900; lo leen p00:533C (17
;   bytes)
;   0x6163..0x6174  (17 bytes)
DATA_atributos_de_snake_9:
	defb 004h	; 6163
	defb 0f5h,0f8h,000h,007h	; 6164
	defb 0f5h,0f8h,004h,04ah	; 6168
	defb 080h,000h,000h,000h	; 616c
	defb 080h,000h,000h,000h	; 6170

; ----------------------------------------------------------------------
; DATOS atributos_de_snake_agachado: la lista de atributos que p00:538C usa
;   cuando 0xC199 no es 0 y el bit 0 de 0xC003 esta a 0; lo leen p00:538C (17
;   bytes)
;   0x6174..0x6185  (17 bytes)
DATA_atributos_de_snake_agachado:
	defb 004h	; 6174
	defb 000h,000h,000h,008h	; 6175
	defb 000h,000h,000h,047h	; 6179
	defb 000h,000h,000h,008h	; 617d
	defb 000h,000h,000h,047h	; 6181

; ----------------------------------------------------------------------
; DATOS juego_de_sprites_por_sala: 251 bytes: el juego de sprites de cada sala
;   (0xC130): p00:4A4A y p00:4AB8 lo leen en 0x6185 + sala; lo leen p00:4A4A
;   (251 bytes)
;   0x6185..0x6280  (251 bytes)
DATA_juego_de_sprites_por_sala:
	defb 002h,002h,002h,01dh,002h,002h,006h,002h,002h,017h,006h,002h,002h,002h,016h,002h	; 6185  ................
	defb 017h,002h,002h,002h,00bh,016h,01dh,01dh,01dh,01dh,01ch,016h,016h,018h,002h,016h	; 6195  ................
	defb 002h,002h,002h,01dh,016h,017h,002h,002h,005h,005h,005h,01dh,005h,015h,015h,01dh	; 61a5  ................
	defb 005h,01dh,00ch,002h,01dh,002h,002h,006h,006h,00ah,006h,006h,006h,006h,006h,006h	; 61b5  ................
	defb 017h,00dh,00dh,00dh,01dh,01dh,01fh,00eh,01fh,01fh,01fh,01fh,017h,01fh,01fh,01fh	; 61c5  ................
	defb 01eh,01fh,01fh,00fh,01fh,01eh,01eh,01eh,01fh,005h,01fh,01fh,005h,01ah,018h,010h	; 61d5  ................
	defb 018h,018h,018h,001h,018h,018h,004h,004h,017h,002h,002h,002h,01dh,01ah,014h,014h	; 61e5  ................
	defb 018h,01ah,018h,014h,001h,001h,019h,012h,001h,001h,001h,001h,001h,001h,002h,002h	; 61f5  ................
	defb 001h,003h,002h,002h,002h,002h,003h,001h,003h,002h,01ch,001h,01ch,013h,001h,001h	; 6205  ................
	defb 003h,003h,003h,002h,003h,002h,002h,001h,003h,013h,005h,001h,01dh,002h,002h,003h	; 6215  ................
	defb 005h,003h,005h,002h,009h,001h,008h,008h,001h,001h,001h,001h,001h,001h,001h,001h	; 6225  ................
	defb 01fh,01fh,01fh,01fh,003h,01fh,007h,01eh,01eh,01eh,003h,005h,001h,007h,003h,013h	; 6235  ................
	defb 001h,011h,003h,003h,001h,001h,003h,001h,001h,001h,003h,003h,001h,013h,002h,006h	; 6245  ................
	defb 004h,004h,004h,002h,002h,000h,000h,000h,01dh,000h,000h,000h,002h,005h,000h,000h	; 6255  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6265  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6275  ...........

; ----------------------------------------------------------------------
; DATOS indice_de_juegos_de_sprites: 32 punteros a las listas de patrones de
;   cada juego de sprites (p00:4A51); lo leen p00:4A51 (64 bytes)
;   0x6280..0x62c0  (64 bytes)
DATA_indice_de_juegos_de_sprites:
	defw 062c0h,062c3h,062c4h,062ceh,062d2h,062d6h,062e6h,062eah	; 6280
	defw 062eeh,062f2h,062f6h,062fdh,06304h,06311h,06321h,0632bh	; 6290
	defw 0632fh,06336h,06340h,06347h,0634eh,06358h,0635ch,06366h	; 62a0
	defw 06373h,0634bh,062c3h,06377h,0637eh,062c4h,062c4h,062c4h	; 62b0

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_0: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); se solapan 2 bloques: (sprites_del_juego_1
;   62C3-62C4); lo leen p00:4A57 (4 bytes)
;   0x62c0..0x62c4  (4 bytes)
DATA_sprites_del_juego_0:
	defb 038h,0abh,078h	; 62c0
	defb 0ffh	; 62c3

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_2: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (10 bytes)
;   0x62c4..0x62ce  (10 bytes)
DATA_sprites_del_juego_2:
	defb 050h,013h,098h	; 62c4
	defb 060h,0a4h,089h	; 62c7
	defb 0e0h,06ah,095h	; 62ca
	defb 0ffh	; 62cd

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_3: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x62ce..0x62d2  (4 bytes)
DATA_sprites_del_juego_3:
	defb 0d0h,0c8h,079h	; 62ce
	defb 0ffh	; 62d1

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_4: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x62d2..0x62d6  (4 bytes)
DATA_sprites_del_juego_4:
	defb 060h,043h,09fh	; 62d2
	defb 0ffh	; 62d5

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_5: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (16 bytes)
;   0x62d6..0x62e6  (16 bytes)
DATA_sprites_del_juego_5:
	defb 038h,03eh,077h	; 62d6
	defb 060h,0a4h,089h	; 62d9
	defb 050h,013h,098h	; 62dc
	defb 060h,07dh,090h	; 62df
	defb 0e0h,0c5h,097h	; 62e2
	defb 0ffh	; 62e5

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_6: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x62e6..0x62ea  (4 bytes)
DATA_sprites_del_juego_6:
	defb 060h,09bh,09bh	; 62e6
	defb 0ffh	; 62e9

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_7: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x62ea..0x62ee  (4 bytes)
DATA_sprites_del_juego_7:
	defb 0d0h,094h,096h	; 62ea
	defb 0ffh	; 62ed

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_8: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x62ee..0x62f2  (4 bytes)
DATA_sprites_del_juego_8:
	defb 0d0h,078h,088h	; 62ee
	defb 0ffh	; 62f1

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_9: ternas [patron][origen lo][origen hi] hasta 0xFF:
;   cada una, unos patrones comprimidos que p00:4A69 descomprime en la VRAM
;   0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x62f2..0x62f6  (4 bytes)
DATA_sprites_del_juego_9:
	defb 0d0h,002h,07bh	; 62f2
	defb 0ffh	; 62f5

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_10: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (7 bytes)
;   0x62f6..0x62fd  (7 bytes)
DATA_sprites_del_juego_10:
	defb 060h,025h,07fh	; 62f6
	defb 0a0h,09ah,099h	; 62f9
	defb 0ffh	; 62fc

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_11: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (7 bytes)
;   0x62fd..0x6304  (7 bytes)
DATA_sprites_del_juego_11:
	defb 050h,013h,098h	; 62fd
	defb 060h,06eh,092h	; 6300
	defb 0ffh	; 6303

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_12: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (13 bytes)
;   0x6304..0x6311  (13 bytes)
DATA_sprites_del_juego_12:
	defb 038h,03eh,077h	; 6304
	defb 050h,013h,098h	; 6307
	defb 060h,06dh,093h	; 630a
	defb 0e0h,0d3h,077h	; 630d
	defb 0ffh	; 6310

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_13: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (16 bytes)
;   0x6311..0x6321  (16 bytes)
DATA_sprites_del_juego_13:
	defb 038h,03eh,077h	; 6311
	defb 050h,013h,098h	; 6314
	defb 054h,062h,099h	; 6317
	defb 060h,0dbh,081h	; 631a
	defb 0e0h,0d3h,077h	; 631d
	defb 0ffh	; 6320

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_14: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (10 bytes)
;   0x6321..0x632b  (10 bytes)
DATA_sprites_del_juego_14:
	defb 038h,03eh,077h	; 6321
	defb 060h,013h,084h	; 6324
	defb 0e0h,0d3h,077h	; 6327
	defb 0ffh	; 632a

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_15: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x632b..0x632f  (4 bytes)
DATA_sprites_del_juego_15:
	defb 038h,019h,086h	; 632b
	defb 0ffh	; 632e

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_16: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (7 bytes)
;   0x632f..0x6336  (7 bytes)
DATA_sprites_del_juego_16:
	defb 050h,022h,09bh	; 632f
	defb 060h,092h,08dh	; 6332
	defb 0ffh	; 6335

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_17: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (10 bytes)
;   0x6336..0x6340  (10 bytes)
DATA_sprites_del_juego_17:
	defb 050h,0e0h,097h	; 6336
	defb 060h,097h,095h	; 6339
	defb 0d0h,0c8h,079h	; 633c
	defb 0ffh	; 633f

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_18: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (7 bytes)
;   0x6340..0x6347  (7 bytes)
DATA_sprites_del_juego_18:
	defb 050h,013h,098h	; 6340
	defb 060h,038h,07ch	; 6343
	defb 0ffh	; 6346

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_19: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x6347..0x634b  (4 bytes)
DATA_sprites_del_juego_19:
	defb 0d0h,012h,08fh	; 6347
	defb 0ffh	; 634a

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_25: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); se solapan 2 bloques:
;   (sprites_del_juego_20 634E-6358); lo leen p00:4A57 (13 bytes)
;   0x634b..0x6358  (13 bytes)
DATA_sprites_del_juego_25:
	defb 060h,0d3h,077h	; 634b
	defb 038h,03eh,077h	; 634e
	defb 0dch,0c0h,097h	; 6351
	defb 0e0h,0eah,080h	; 6354
	defb 0ffh	; 6357

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_21: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x6358..0x635c  (4 bytes)
DATA_sprites_del_juego_21:
	defb 0f4h,03bh,090h	; 6358
	defb 0ffh	; 635b

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_22: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (10 bytes)
;   0x635c..0x6366  (10 bytes)
DATA_sprites_del_juego_22:
	defb 0e0h,0eah,080h	; 635c
	defb 050h,013h,098h	; 635f
	defb 060h,0a4h,089h	; 6362
	defb 0ffh	; 6365

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_23: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (13 bytes)
;   0x6366..0x6373  (13 bytes)
DATA_sprites_del_juego_23:
	defb 038h,03eh,077h	; 6366
	defb 050h,013h,098h	; 6369
	defb 060h,0a4h,089h	; 636c
	defb 0e0h,0d3h,077h	; 636f
	defb 0ffh	; 6372

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_24: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (4 bytes)
;   0x6373..0x6377  (4 bytes)
DATA_sprites_del_juego_24:
	defb 0e0h,000h,095h	; 6373
	defb 0ffh	; 6376

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_27: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (7 bytes)
;   0x6377..0x637e  (7 bytes)
DATA_sprites_del_juego_27:
	defb 0d0h,0c8h,079h	; 6377
	defb 060h,09bh,09bh	; 637a
	defb 0ffh	; 637d

; ----------------------------------------------------------------------
; DATOS sprites_del_juego_28: ternas [patron][origen lo][origen hi] hasta
;   0xFF: cada una, unos patrones comprimidos que p00:4A69 descomprime en la
;   VRAM 0xF800 + 8 x patron (L_4DD5); lo leen p00:4A57 (10 bytes)
;   0x637e..0x6388  (10 bytes)
DATA_sprites_del_juego_28:
	defb 050h,013h,098h	; 637e
	defb 060h,0a4h,089h	; 6381
	defb 0e0h,06ah,095h	; 6384
	defb 0ffh	; 6387

; ----------------------------------------------------------------------
; DATOS lista_de_sprites_sin_indice: una lista de ternas [patron][origen] como
;   las de 0x62C0 (0x50 -> 0x1398, 0x98 -> 0x60A4, 0x89 -> 0x6AE0, 0x95 ->
;   0xFF...) que repite la de 0x6380 con un sprite mas; ningun puntero de
;   0x6280 apunta a ella (la de 0x6380 la usan los juegos 30 y 31). SIN LECTOR
;   A LA VISTA
;   0x6388..0x6392  (10 bytes)
DATA_lista_de_sprites_sin_indice:
	defb 050h,013h,098h,060h,0a4h,089h,0e0h,06ah,095h,0ffh	; 6388  P..`...j..

; ----------------------------------------------------------------------
; DATOS indice_de_patrones_de_las_armas: 15 punteros, armas 1-15 (0xC134), a
;   los patrones comprimidos del proyectil: p00:4BFF los lee con L_42B4 y
;   L_4DD5 los descomprime en la VRAM 0xF880; las armas 4 y 7 no cargan nada
;   (p00:4BF6) y su palabra (0x63A0) apunta aqui dentro; lo leen p00:4BFF (30
;   bytes)
;   0x6392..0x63b0  (30 bytes)
DATA_indice_de_patrones_de_las_armas:
	defw 09813h,09813h,0981eh,063a0h,09922h	; 6392
	defw 09af2h,063a0h,09870h,098c9h,098ffh	; 639c
	defw 098a6h,09a56h,09aa4h,09ad1h,09a83h	; 63a6

; ----------------------------------------------------------------------
; DATOS indice_de_atributos_de_las_armas: 12 punteros a listas de atributos
;   por cuadro ((ix+0x0B)): p00:53E0; lo leen p00:53E0 (24 bytes)
;   0x63b0..0x63c8  (24 bytes)
DATA_indice_de_atributos_de_las_armas:
	defw 063c8h,063cch,063d4h,063deh,063e6h,063eeh,063f6h,06400h	; 63b0
	defw 0640ah,06414h,06424h,0642ch	; 63c0

; ----------------------------------------------------------------------
; DATOS atributos_de_las_armas: las listas de atributos de los proyectiles,
;   una por cuadro: por sprite [y][x][patron][color], o 0x80 si va escondido;
;   cuantos sprites lo dice el actor ((ix+0x20)), por eso no llevan cuenta
;   (p00:53F2); lo leen p00:53F2 (110 bytes)
;   0x63c8..0x6436  (110 bytes)
DATA_atributos_de_las_armas:
	defb 0f8h,0f8h,010h,00eh	; 63c8
	defb 0f8h,0f8h,010h,007h	; 63cc
	defb 0f8h,0f8h,014h,04ah	; 63d0
	defb 0f8h,0f8h,010h,007h	; 63d4
	defb 0f8h,0f8h,014h,04ch	; 63d8
	defb 080h,080h,0f8h,0f8h	; 63dc
	defb 020h,006h,0f8h,0f8h	; 63e0
	defb 024h,048h,0f8h,0f8h	; 63e4
	defb 028h,006h,0f8h,0f8h	; 63e8
	defb 02ch,048h,0f8h,0f8h	; 63ec
	defb 030h,006h,0f8h,0f8h	; 63f0
	defb 034h,048h,0f8h,0f8h	; 63f4
	defb 010h,007h,0f8h,0f8h	; 63f8
	defb 014h,04ah,080h,080h	; 63fc
	defb 0f8h,0f8h,018h,006h	; 6400
	defb 0f8h,0f8h,01ch,048h	; 6404
	defb 080h,080h,0f8h,0f8h	; 6408
	defb 020h,006h,0f8h,0f8h	; 640c
	defb 024h,048h,080h,080h	; 6410
	defb 0f0h,0f0h,028h,00eh	; 6414
	defb 0f0h,000h,02ch,00eh	; 6418
	defb 000h,0f0h,030h,00eh	; 641c
	defb 000h,000h,034h,00eh	; 6420
	defb 0f8h,0f8h,010h,00ch	; 6424
	defb 0f8h,0f8h,014h,047h	; 6428
	defb 0f8h,0f8h,010h,008h	; 642c
	defb 0f8h,0f8h,014h,00fh	; 6430
	defb 080h,080h	; 6434

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_4: patrones de sprite de Snake (juego 4),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (117 bytes)
;   0x6436..0x64ab  (117 bytes)
DATA_patrones_de_snake_4:
	defb 095h,003h,007h,007h,03dh,074h,036h,0ffh,0ceh,0feh,0bfh,037h,078h,03fh,037h,037h	; 6436  ....=t6....7x?77
	defb 03fh,080h,0c0h,0e0h,0d8h,0fch,003h,0e8h,003h,0f0h,0afh,0a0h,0e0h,0f0h,0b0h,0b0h	; 6446  ?...............
	defb 003h,007h,004h,03fh,05fh,04fh,03bh,07bh,0cbh,079h,058h,07fh,024h,029h,02ah,023h	; 6456  ...?_O.{.yX.$)*#
	defb 080h,0c0h,0e0h,0f8h,0d4h,0d0h,098h,098h,090h,010h,030h,0e0h,060h,0b0h,050h,050h	; 6466  ..........0.`.PP
	defb 03fh,03dh,03ch,019h,001h,01dh,03fh,01fh,00fh,003h,006h,000h,003h,0f0h,002h,0e0h	; 6476  ?=<...?.........
	defb 086h,0c0h,0e0h,0a0h,0e0h,0e0h,0c0h,005h,000h,08ah,037h,02dh,024h,019h,001h,01dh	; 6486  ..........7-$...
	defb 03fh,01fh,00fh,003h,006h,000h,08bh,030h,010h,090h,020h,020h,040h,0a0h,060h,060h	; 6496  ?......0..  @.``
	defb 0a0h,0c0h,005h,000h,000h	; 64a6

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_3: patrones de sprite de Snake (juego 3),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (118 bytes)
;   0x64ab..0x6521  (118 bytes)
DATA_patrones_de_snake_3:
	defb 0c2h,003h,007h,007h,01dh,03ch,06eh,05fh,0f6h,0f6h,0ffh,0bfh,0f8h,09fh,0fbh,077h	; 64ab  .....<n_.......w
	defb 037h,080h,0c0h,0f0h,0d8h,0ech,0ech,0fch,0fch,0f8h,0f4h,0fch,0bah,0fch,0b0h,0d8h	; 64bb  7...............
	defb 0f0h,003h,007h,004h,01fh,037h,057h,033h,08bh,0dbh,0b1h,0dch,0bfh,0feh,095h,079h	; 64cb  .....7W3.......y
	defb 02bh,080h,0c0h,0f0h,0e8h,0f4h,0f4h,09ch,094h,098h,01ch,034h,0feh,05ch,050h,0a8h	; 64db  +..........4.\P.
	defb 000h,03fh,03fh,004h,01fh,086h,00fh,017h,013h,01bh,017h,00eh,004h,000h,081h,0f0h	; 64eb  .??.............
	defb 004h,0e0h,085h,0b0h,0d0h,0e0h,0e0h,0c0h,006h,000h,002h,021h,085h,011h,013h,019h	; 64fb  ...........!....
	defb 013h,00bh,004h,01fh,081h,00eh,004h,000h,08ah,090h,0a0h,000h,0a0h,0e0h,0f0h,0f0h	; 650b  ................
	defb 0e0h,0e0h,0c0h,006h,000h,000h	; 651b

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_5: patrones de sprite de Snake (juego 5),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (121 bytes)
;   0x6521..0x659a  (121 bytes)
DATA_patrones_de_snake_5:
	defb 0cch,000h,003h,03fh,07fh,05dh,074h,076h,03fh,02eh,02eh,01fh,01fh,01ah,03fh,02fh	; 6521  ...?.]tv?.....?/
	defb 027h,000h,080h,0c0h,0c0h,0f8h,0dah,0deh,0ffh,0f3h,0ffh,0fdh,0feh,03ch,0f0h,0f0h	; 6531  '............<..
	defb 0b0h,000h,003h,03fh,04ch,02fh,00fh,05fh,03bh,033h,033h,011h,018h,01fh,024h,037h	; 6541  ...?L/._.33...$7
	defb 03bh,000h,080h,0c0h,0c0h,0f8h,0f6h,0e0h,08dh,09fh,0d3h,0cfh,0f8h,0fch,050h,010h	; 6551  ..............P.
	defb 050h,06fh,07dh,078h,07ch,03ch,03ch,03fh,03fh,02fh,06fh,05ch,078h,004h,000h,08ah	; 6561  Po}x|<<??/o\x...
	defb 0b0h,0f0h,0f0h,0e0h,000h,0c0h,0e0h,0e0h,0c0h,080h,006h,000h,086h,047h,045h,058h	; 6571  .............GEX
	defb 044h,024h,02ch,003h,03fh,083h,07fh,07ch,078h,004h,000h,08ah,010h,0b0h,0d0h,0a0h	; 6581  D$,.?..|x.......
	defb 000h,0c0h,0e0h,0e0h,0c0h,080h,006h,000h,000h	; 6591  .........

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_7: patrones de sprite de Snake (juego 7),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (115 bytes)
;   0x659a..0x660d  (115 bytes)
DATA_patrones_de_snake_7:
	defb 0c9h,007h,00fh,00fh,019h,01bh,01eh,01dh,01fh,00fh,00ch,00fh,01fh,03fh,06fh,05dh	; 659a  .............?o]
	defb 079h,000h,080h,080h,0c0h,0f0h,0b8h,06ch,07ch,0d8h,0e8h,088h,0f0h,0f0h,070h,070h	; 65aa  y......l|.....pp
	defb 0b0h,007h,00fh,009h,01fh,01dh,017h,017h,012h,00bh,00fh,00ch,013h,022h,056h,064h	; 65ba  ............."Vd
	defb 059h,000h,080h,080h,0c0h,0b0h,0c8h,094h,0b4h,0e8h,0d8h,078h,090h,070h,090h,0b0h	; 65ca  Y..........x.p..
	defb 050h,079h,030h,070h,070h,0dch,0bfh,0ffh,01fh,007h,007h,000h,08ah,0f8h,0feh,07bh	; 65da  Py0pp..........{
	defb 025h,003h,000h,0c0h,0e0h,0e0h,0c0h,006h,000h,089h,049h,010h,070h,050h,0fch,0ffh	; 65ea  %.........I.pP..
	defb 0ffh,01fh,007h,007h,000h,08ah,018h,0aeh,04dh,027h,003h,000h,0c0h,0e0h,0e0h,0c0h	; 65fa  ........M'......
	defb 006h,000h,000h	; 660a

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_6: patrones de sprite de Snake (juego 6),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (126 bytes)
;   0x660d..0x668b  (126 bytes)
DATA_patrones_de_snake_6:
	defb 091h,007h,00fh,00fh,009h,01bh,01eh,01dh,01dh,01fh,02fh,02fh,05dh,03fh,017h,02fh	; 660d  ..........//]?./
	defb 03fh,000h,003h,080h,09dh,0f0h,0ach,074h,07eh,07bh,079h,07dh,0f9h,026h,0e4h,0b8h	; 661d  ?......t~{y}.&..
	defb 078h,007h,00fh,009h,00fh,01dh,01fh,017h,017h,01ch,038h,03ch,07fh,03bh,019h,033h	; 662d  x.........8<...3
	defb 026h,000h,003h,080h,098h,0f0h,0f4h,0c8h,0c6h,0edh,0d7h,0bah,0dfh,0fah,07ch,058h	; 663d  &.............|X
	defb 088h,07fh,07fh,07dh,039h,038h,028h,06ch,05fh,07fh,03fh,007h,001h,004h,000h,082h	; 664d  ...}98(l_.?.....
	defb 0f0h,0e0h,004h,0f0h,087h,050h,068h,0e8h,0ech,0dch,0fch,070h,003h,000h,08ch,04eh	; 665d  .....Ph....p...N
	defb 046h,04dh,029h,038h,038h,074h,06fh,07fh,03fh,007h,001h,004h,000h,089h,030h,060h	; 666d  FM)88to.?.....0`
	defb 010h,010h,090h,0f0h,070h,058h,0d8h,003h,0fch,081h,070h,003h,000h,000h	; 667d  ....pX....p...

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_8: patrones de sprite de Snake (juego 8),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (125 bytes)
;   0x668b..0x6708  (125 bytes)
DATA_patrones_de_snake_8:
	defb 0c2h,000h,007h,00fh,00fh,009h,01bh,036h,035h,07dh,09fh,0efh,07fh,01dh,007h,007h	; 668b  .......65}......
	defb 00fh,000h,000h,080h,080h,0f8h,0feh,0afh,0b9h,0bch,0fdh,0f2h,0f4h,078h,0f8h,0d8h	; 669b  .............x..
	defb 0b0h,000h,007h,00fh,009h,00fh,01dh,02fh,02fh,067h,0f2h,098h,06ch,01fh,007h,006h	; 66ab  .......//g..l...
	defb 009h,000h,000h,080h,080h,0e8h,0c6h,0d5h,04eh,06fh,07bh,03eh,0f8h,0f8h,0c8h,028h	; 66bb  ........No{>...(
	defb 040h,00fh,00fh,003h,007h,002h,003h,086h,002h,003h,007h,00eh,00fh,007h,003h,000h	; 66cb  @...............
	defb 082h,0f0h,0e0h,003h,0c0h,003h,0e0h,002h,078h,082h,0f0h,0c0h,004h,000h,002h,00ah	; 66db  ........x.......
	defb 003h,004h,088h,002h,003h,003h,002h,007h,00fh,00fh,007h,003h,000h,08ch,010h,020h	; 66eb  ...............
	defb 0c0h,040h,040h,0a0h,0a0h,060h,0f8h,0f8h,0f0h,0c0h,004h,000h,000h	; 66fb  .@@..`.......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_1: patrones de sprite de Snake (juego 1),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (121 bytes)
;   0x6708..0x6781  (121 bytes)
DATA_patrones_de_snake_1:
	defb 08bh,000h,003h,007h,007h,01fh,037h,078h,077h,077h,037h,03fh,005h,01fh,08dh,000h	; 6708  ......7xww7?....
	defb 080h,0c0h,0f8h,0ach,066h,076h,072h,07ah,07eh,0fah,0fch,070h,003h,0f0h,0a4h,000h	; 6718  ....fvrz~..p....
	defb 003h,004h,007h,01fh,02ch,057h,04eh,058h,02ch,02fh,018h,010h,013h,01dh,01bh,000h	; 6728  ....,WNX,/......
	defb 080h,0c0h,0f8h,074h,0bah,0aah,09eh,096h,0bah,0b6h,03ch,090h,030h,090h,010h,016h	; 6738  ...t......<.0...
	defb 016h,01eh,008h,003h,000h,081h,001h,003h,003h,081h,001h,004h,000h,004h,0f0h,088h	; 6748  ................
	defb 0e0h,060h,0b0h,0b0h,0e0h,0e0h,0c0h,080h,004h,000h,084h,01ah,018h,01ah,008h,003h	; 6758  .`..............
	defb 000h,081h,001h,003h,003h,081h,001h,004h,000h,08ch,090h,0f0h,050h,010h,0a0h,060h	; 6768  ............P..`
	defb 0d0h,0d0h,0e0h,0e0h,0c0h,080h,004h,000h,000h	; 6778  .........

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_0: patrones de sprite de Snake (juego 0),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (120 bytes)
;   0x6781..0x67f9  (120 bytes)
DATA_patrones_de_snake_0:
	defb 0c1h,003h,007h,007h,01fh,07bh,05dh,05ch,07fh,0ddh,09dh,0b8h,06fh,01fh,01dh,03bh	; 6781  .....{]\....o...
	defb 03bh,080h,0c0h,0c0h,0f0h,0d8h,0dch,05ch,0fch,0d8h,0f8h,01ch,0e0h,0b0h,030h,0f0h	; 6791  .......\......0.
	defb 0f0h,003h,004h,007h,01fh,044h,026h,027h,06fh,0f7h,0f2h,0dfh,06fh,010h,012h,024h	; 67a1  .....D&'o...o..$
	defb 025h,080h,0c0h,0c0h,0f0h,0f8h,074h,0a4h,0f4h,07ch,02ch,0fch,0e0h,050h,0c0h,0c0h	; 67b1  %.....t..|,..P..
	defb 010h,03fh,003h,03eh,003h,01ch,085h,00fh,01bh,037h,03bh,01eh,004h,000h,004h,0f0h	; 67c1  .?.>.....7......
	defb 087h,070h,050h,058h,0f8h,0f8h,0e0h,080h,005h,000h,08ch,023h,026h,032h,022h,014h	; 67d1  .pPX.......#&2".
	defb 014h,01ch,00fh,01fh,03bh,03fh,01eh,004h,000h,08bh,090h,0b0h,0d0h,090h,070h,070h	; 67e1  .....?........pp
	defb 078h,0f8h,0f8h,0e0h,080h,005h,000h,000h	; 67f1  x.......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_2: patrones de sprite de Snake (juego 2),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (122 bytes)
;   0x67f9..0x6873  (122 bytes)
DATA_patrones_de_snake_2:
	defb 08dh,000h,001h,003h,01fh,035h,066h,06eh,04eh,05eh,07eh,05fh,03fh,00eh,003h,00fh	; 67f9  .....5fnN^~_?...
	defb 08bh,000h,0c0h,0e0h,0e0h,0f8h,0ech,01eh,0eeh,0eeh,0ech,0fch,005h,0f8h,0a0h,000h	; 6809  ................
	defb 001h,003h,01fh,02eh,05dh,055h,079h,069h,05dh,06dh,03ch,009h,00ch,009h,008h,000h	; 6819  ....]Uyi]m<.....
	defb 0c0h,020h,0e0h,0f8h,034h,0eah,072h,01ah,034h,0f4h,018h,008h,0c8h,0b8h,0d8h,004h	; 6829  . ..4.r.4.......
	defb 00fh,088h,007h,006h,00dh,00dh,007h,007h,003h,001h,004h,000h,002h,068h,082h,078h	; 6839  .............h.x
	defb 010h,003h,000h,081h,080h,003h,0c0h,081h,080h,004h,000h,08ch,009h,00fh,00ah,008h	; 6849  ................
	defb 005h,006h,00bh,00bh,007h,007h,003h,001h,004h,000h,084h,058h,018h,058h,010h,003h	; 6859  ...........X.X..
	defb 000h,081h,080h,003h,0c0h,081h,080h,004h,000h,000h	; 6869  ..........

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_10: patrones de sprite de Snake (juego 10),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (117 bytes)
;   0x6873..0x68e8  (117 bytes)
DATA_patrones_de_snake_10:
	defb 0cah,000h,001h,001h,003h,00fh,01dh,036h,03eh,01bh,017h,011h,00fh,00fh,00eh,006h	; 6873  .......6>.......
	defb 006h,0e0h,0f0h,0f0h,098h,0d8h,078h,0b8h,0f8h,0f0h,030h,0f0h,0f8h,0fch,0f6h,0fbh	; 6883  ......x...0.....
	defb 0ffh,000h,001h,001h,003h,00dh,013h,029h,02dh,017h,01bh,01eh,009h,00eh,009h,005h	; 6893  .......)-.......
	defb 005h,0e0h,0f0h,090h,0f8h,0b8h,0e8h,0e8h,048h,0d0h,0f0h,030h,0e8h,044h,02ah,065h	; 68a3  ........H..0.D*e
	defb 071h,00fh,03fh,04fh,078h,020h,001h,007h,00fh,00fh,007h,006h,000h,08ah,0dfh,09eh	; 68b3  q.?Ox ..........
	defb 00eh,00eh,03bh,0fdh,0ffh,0fch,0f0h,0c0h,006h,000h,08ah,00eh,038h,07dh,058h,020h	; 68c3  ............8}X
	defb 001h,007h,00fh,00fh,007h,006h,000h,08ah,05dh,092h,00eh,00ah,03fh,0ffh,0ffh,0fch	; 68d3  ........]...?...
	defb 0f0h,0c0h,006h,000h,000h	; 68e3

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_9: patrones de sprite de Snake (juego 9),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (125 bytes)
;   0x68e8..0x6965  (125 bytes)
DATA_patrones_de_snake_9:
	defb 081h,000h,003h,001h,09dh,01fh,035h,06eh,07eh,0deh,09eh,0beh,09fh,064h,027h,01dh	; 68e8  ......5n~....d'.
	defb 01eh,0e0h,0f0h,0f0h,090h,0d8h,078h,0b8h,0b8h,0f8h,0f4h,0f4h,0bah,0fch,0e8h,0f4h	; 68f8  ......x.........
	defb 0fch,000h,003h,001h,09fh,01fh,02fh,053h,063h,0b7h,0ebh,05dh,0fbh,05fh,03eh,01ah	; 6908  ....../Sc..]._>.
	defb 011h,0e0h,0f0h,090h,0f0h,0b8h,0f8h,0e8h,0e8h,038h,01ch,03ch,0feh,0dch,098h,0cch	; 6918  .........8.<....
	defb 064h,00fh,00fh,007h,003h,00fh,087h,00eh,01fh,01bh,037h,03bh,03fh,00ch,003h,000h	; 6928  d.........7.?...
	defb 002h,0feh,089h,0beh,09ch,098h,028h,06ch,0f6h,0feh,0fch,0e0h,005h,000h,089h,008h	; 6938  ......(l........
	defb 00ch,006h,008h,009h,009h,00eh,01bh,017h,003h,03fh,081h,00ch,003h,000h,08bh,07ah	; 6948  .........?.....z
	defb 062h,0a6h,094h,098h,038h,05ch,0eeh,0feh,0fch,0e0h,005h,000h,000h	; 6958  b...8\.......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_11: patrones de sprite de Snake (juego 11),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (123 bytes)
;   0x6965..0x69e0  (123 bytes)
DATA_patrones_de_snake_11:
	defb 002h,000h,002h,001h,0beh,01fh,07fh,0f5h,09dh,03dh,0bfh,04fh,02fh,01eh,01fh,01bh	; 6965  .........=.O/...
	defb 00dh,000h,0e0h,0f0h,0f0h,090h,0d8h,06ch,0ach,0beh,0f9h,0f7h,0feh,0b8h,0e0h,0e0h	; 6975  .......l........
	defb 0f0h,000h,000h,001h,001h,017h,063h,0abh,072h,0f6h,0deh,07ch,01fh,01fh,013h,014h	; 6985  ......c.r..|....
	defb 002h,000h,0e0h,0f0h,090h,0f0h,0b8h,0f4h,0f4h,0e6h,04fh,019h,036h,0f8h,0e0h,060h	; 6995  ..........O.6..`
	defb 090h,00fh,007h,003h,003h,002h,007h,085h,00fh,00eh,006h,007h,003h,004h,000h,002h	; 69a5  ................
	defb 0f0h,003h,0e0h,002h,0c0h,085h,040h,0e0h,0e0h,060h,0c0h,004h,000h,08ch,008h,004h	; 69b5  ......@..`......
	defb 003h,002h,002h,005h,005h,00eh,00fh,007h,007h,003h,004h,000h,002h,050h,003h,020h	; 69c5  .............P.
	defb 087h,040h,0c0h,0c0h,060h,0e0h,0e0h,0c0h,004h,000h,000h	; 69d5  .@..`......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_16: patrones de sprite de Snake (juego 16),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (125 bytes)
;   0x69e0..0x6a5d  (125 bytes)
DATA_patrones_de_snake_16:
	defb 091h,003h,007h,007h,00dh,01ch,03eh,035h,07bh,05fh,03dh,03dh,01fh,01eh,03fh,017h	; 69e0  ......>5{_==..?.
	defb 02fh,080h,003h,0c0h,09dh,0e0h,0f0h,0d8h,0bch,0f4h,06ch,0fch,0d8h,008h,0f8h,0d8h	; 69f0  /.........l.....
	defb 0d8h,003h,007h,004h,00fh,007h,02fh,02fh,07eh,06ch,03ah,03ah,01dh,01fh,033h,009h	; 6a00  ......//~l::..3.
	defb 037h,080h,003h,0c0h,09ch,0e0h,0f0h,0a8h,064h,048h,0d0h,0f4h,0b8h,0f8h,0f8h,028h	; 6a10  7.......dH.....(
	defb 038h,03fh,07eh,07ch,03ch,03ch,01ch,01eh,01bh,01bh,03bh,037h,01fh,006h,004h,008h	; 6a20  8?~|<<.....7....
	defb 000h,003h,0f8h,088h,070h,000h,030h,0f8h,0f8h,0f0h,0e0h,080h,005h,000h,09bh,023h	; 6a30  ....p.0........#
	defb 046h,04ch,024h,02ch,014h,01eh,017h,017h,03fh,03fh,01fh,006h,004h,008h,000h,088h	; 6a40  FL$,....??......
	defb 098h,0e8h,050h,000h,030h,0f8h,0f8h,0f0h,0e0h,080h,005h,000h,000h	; 6a50  ..P.0........

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_15: patrones de sprite de Snake (juego 15),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (121 bytes)
;   0x6a5d..0x6ad6  (121 bytes)
DATA_patrones_de_snake_15:
	defb 091h,003h,007h,007h,01dh,03ch,076h,077h,07dh,03dh,03fh,07fh,05fh,03fh,01fh,03fh	; 6a5d  .....<vw}=?._?.?
	defb 037h,080h,003h,0c0h,09dh,0e0h,0f8h,0ach,0f6h,076h,07eh,0ech,0cch,0d8h,0f0h,078h	; 6a6d  7........v~....x
	defb 0d8h,003h,007h,004h,01fh,027h,05fh,04bh,05fh,073h,072h,058h,07ch,03fh,017h,023h	; 6a7d  .....'_K_srX|?.#
	defb 02bh,080h,003h,0c0h,08dh,0e0h,0d8h,0f4h,04ah,0cah,0dah,0fch,0f4h,0a8h,0b0h,0c8h	; 6a8d  +.......J.......
	defb 0a8h,03fh,003h,01fh,087h,017h,01fh,037h,01fh,007h,003h,001h,005h,000h,004h,0f8h	; 6a9d  .?.....7........
	defb 004h,0f0h,085h,0d0h,0b8h,0f8h,0d8h,070h,003h,000h,083h,027h,013h,017h,003h,01bh	; 6aad  .......p...'....
	defb 085h,03fh,01fh,007h,003h,001h,005h,000h,08dh,008h,088h,018h,028h,090h,090h,0f0h	; 6abd  .?..........(...
	defb 0b0h,0b0h,0d8h,0b8h,0f8h,070h,003h,000h,000h	; 6acd  .....p...

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_17: patrones de sprite de Snake (juego 17),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (126 bytes)
;   0x6ad6..0x6b54  (126 bytes)
DATA_patrones_de_snake_17:
	defb 092h,000h,003h,007h,007h,03dh,07ch,0d6h,0f7h,0f6h,0beh,0bbh,0ffh,05fh,03fh,01fh	; 6ad6  .....=|......_?.
	defb 037h,000h,080h,003h,0c0h,09dh,0f0h,0ech,0feh,0dbh,0dbh,0ffh,0ffh,0f3h,0e6h,0bch	; 6ae6  7...............
	defb 0f8h,000h,003h,007h,004h,03fh,04fh,0afh,09bh,0fbh,0d9h,0f5h,0b0h,07ch,03eh,007h	; 6af6  .....?O......|>.
	defb 02bh,000h,080h,003h,0c0h,098h,0f0h,0dch,0dah,0b5h,0a5h,013h,03dh,03dh,07ah,0dch	; 6b06  +...........==z.
	defb 0f8h,03fh,03fh,01fh,01eh,00ch,000h,000h,00eh,01fh,01fh,007h,001h,001h,003h,000h	; 6b16  .??.............
	defb 006h,0f8h,002h,0f0h,095h,0b0h,0b8h,0b8h,0d8h,0f0h,0c0h,040h,020h,023h,023h,017h	; 6b26  ...........@ ##.
	defb 01ah,004h,000h,000h,00eh,01fh,01fh,007h,001h,001h,003h,000h,090h,088h,048h,088h	; 6b36  ..............H.
	defb 088h,098h,0c8h,090h,0d0h,0f0h,0d8h,0f8h,0f8h,0f0h,0c0h,040h,020h,000h	; 6b46  ...........@ .

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_19: patrones de sprite de Snake (juego 19),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (124 bytes)
;   0x6b54..0x6bd0  (124 bytes)
DATA_patrones_de_snake_19:
	defb 0c1h,007h,00fh,00fh,009h,00bh,00ch,00bh,00dh,01bh,01fh,0fdh,0d0h,03bh,01fh,007h	; 6b54  ................
	defb 007h,000h,080h,0b8h,0dch,0fch,0e6h,05eh,0bah,0feh,0ffh,0f7h,0efh,0beh,0f6h,0cch	; 6b64  .......^........
	defb 07ch,007h,00fh,009h,00fh,00dh,00fh,00fh,00ah,014h,016h,0ffh,0ffh,025h,01fh,006h	; 6b74  |............%..
	defb 004h,000h,080h,0b8h,0ech,014h,03eh,0feh,0eeh,046h,047h,09fh,0ffh,0f2h,0cah,034h	; 6b84  ......>..FG....4
	defb 08ch,007h,004h,00fh,088h,007h,00fh,00dh,00dh,07dh,01bh,01fh,00fh,003h,000h,004h	; 6b94  .........}......
	defb 0f8h,088h,0b8h,028h,048h,0fch,0fch,0f8h,0e0h,0c0h,004h,000h,086h,004h,008h,009h	; 6ba4  ...(H...........
	defb 00ah,008h,005h,003h,00bh,084h,07fh,015h,01fh,00fh,003h,000h,08ch,038h,078h,0c8h	; 6bb4  .............8x.
	defb 0d8h,0a8h,038h,078h,0ech,0fch,0f8h,0e0h,0c0h,004h,000h,000h	; 6bc4  ..8x........

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_18: patrones de sprite de Snake (juego 18),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (124 bytes)
;   0x6bd0..0x6c4c  (124 bytes)
DATA_patrones_de_snake_18:
	defb 0c0h,007h,00fh,00fh,009h,00bh,00fh,018h,01fh,01bh,01fh,0fbh,0b1h,0c7h,03fh,007h	; 6bd0  ..............?.
	defb 00eh,000h,080h,0f8h,0dch,06eh,0ffh,0cdh,03fh,07eh,077h,0efh,09fh,0feh,0eeh,09ch	; 6be0  .....n..?~w.....
	defb 0fch,007h,00fh,009h,00fh,00dh,00eh,01fh,013h,014h,014h,0feh,0efh,0fbh,03eh,004h	; 6bf0  ..............>.
	defb 009h,000h,080h,0f8h,0e4h,09ah,01fh,07fh,0f9h,0ceh,0cfh,09fh,0f7h,0e2h,012h,064h	; 6c00  ...............d
	defb 05ch,004h,01fh,083h,00eh,00fh,00fh,003h,00dh,082h,013h,01fh,004h,000h,002h,0fch	; 6c10  \...............
	defb 08ah,0feh,03eh,03ch,016h,01eh,076h,0feh,0feh,0f0h,080h,004h,000h,086h,010h,012h	; 6c20  ..><..v.........
	defb 011h,011h,00ah,00fh,003h,00bh,083h,00fh,01fh,01fh,004h,000h,08ch,074h,0cch,0c2h	; 6c30  .............t..
	defb 026h,03ch,01ah,01ah,07ah,0fah,0feh,0f0h,080h,004h,000h,000h	; 6c40  &<..z.......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_20: patrones de sprite de Snake (juego 20),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (125 bytes)
;   0x6c4c..0x6cc9  (125 bytes)
DATA_patrones_de_snake_20:
	defb 0cch,000h,007h,00fh,00fh,009h,00ah,00fh,01bh,03dh,036h,0feh,0afh,0e7h,03fh,01fh	; 6c4c  .........=6...?.
	defb 037h,000h,000h,098h,0fch,0beh,0deh,0edh,0ddh,0beh,07ch,0ffh,0efh,03ch,0fch,0ech	; 6c5c  7.........|..<..
	defb 0f8h,000h,007h,00fh,009h,00fh,00fh,00ch,01eh,027h,02bh,0f1h,0ffh,0deh,027h,019h	; 6c6c  .........'+...'.
	defb 028h,000h,000h,098h,0e4h,0e2h,076h,03fh,03bh,07eh,0cch,08fh,01fh,0fch,0e4h,094h	; 6c7c  (.....v?.~......
	defb 088h,07fh,07fh,07dh,03dh,038h,034h,014h,027h,03fh,03fh,01fh,001h,004h,000h,08ch	; 6c8c  ...}=84.'??.....
	defb 0f8h,0f0h,0f8h,0fch,0f6h,07bh,00dh,005h,0e2h,0f0h,0f0h,0e0h,004h,000h,087h,043h	; 6c9c  .....{.........C
	defb 04fh,065h,03dh,028h,02ch,01ch,003h,03fh,082h,01fh,001h,004h,000h,08ch,008h,010h	; 6cac  Oe=(,..?........
	defb 028h,00ch,09ah,075h,00fh,007h,0e2h,0f0h,0f0h,0e0h,004h,000h,000h	; 6cbc  (..u.........

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_13: patrones de sprite de Snake (juego 13),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (118 bytes)
;   0x6cc9..0x6d3f  (118 bytes)
DATA_patrones_de_snake_13:
	defb 081h,003h,003h,007h,088h,01fh,036h,036h,030h,03fh,03fh,01fh,010h,004h,01fh,08dh	; 6cc9  ......660??.....
	defb 080h,0c0h,0c0h,0f0h,078h,0ech,0ech,0fch,064h,0e4h,074h,0fch,0f8h,003h,0f0h,0a0h	; 6cd9  ....x...d.t.....
	defb 003h,006h,007h,007h,01dh,02bh,029h,02fh,037h,021h,018h,01fh,017h,000h,011h,016h	; 6ce9  .....+)/7!......
	defb 080h,040h,0c0h,0f0h,0c8h,094h,094h,0bch,0dch,0f8h,0f8h,0f4h,0b8h,010h,010h,030h	; 6cf9  .@.............0
	defb 003h,00fh,088h,00bh,01fh,01fh,00fh,00eh,007h,003h,001h,005h,000h,004h,0f0h,083h	; 6d09  ................
	defb 0e0h,060h,060h,003h,0f0h,081h,0e0h,005h,000h,08bh,003h,00bh,00fh,00fh,01bh,01fh	; 6d19  .``.............
	defb 00fh,00fh,007h,003h,001h,005h,000h,002h,010h,089h,0d0h,090h,0a0h,0e0h,0a0h,070h	; 6d29  ...............p
	defb 030h,0f0h,0e0h,005h,000h,000h	; 6d39

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_12: patrones de sprite de Snake (juego 12),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (126 bytes)
;   0x6d3f..0x6dbd  (126 bytes)
DATA_patrones_de_snake_12:
	defb 0c9h,003h,007h,007h,01fh,03fh,037h,037h,030h,01fh,03fh,01fh,014h,01fh,01fh,00ch	; 6d3f  .....?770.?.....
	defb 00fh,080h,0c0h,0c0h,0f8h,0bch,06eh,076h,0feh,064h,0f2h,0feh,0fch,0f8h,0f0h,0f0h	; 6d4f  ......nv.d......
	defb 070h,003h,006h,007h,01fh,028h,019h,019h,02fh,017h,021h,018h,01fh,017h,010h,00bh	; 6d5f  p....(../.!.....
	defb 00eh,080h,040h,0c0h,0f8h,0e4h,0d2h,0cah,0dah,0fch,0eeh,0e2h,0f4h,078h,070h,010h	; 6d6f  ..@..........xp.
	defb 0b0h,00fh,00fh,007h,007h,00bh,00fh,00fh,007h,007h,003h,003h,081h,001h,003h,000h	; 6d7f  ................
	defb 005h,0f0h,002h,0e0h,092h,060h,020h,0f0h,0b0h,0f0h,0e0h,040h,000h,000h,00ah,00bh	; 6d8f  .....` ....@....
	defb 005h,007h,00dh,00dh,00fh,007h,007h,003h,003h,081h,001h,003h,000h,003h,010h,08dh	; 6d9f  ................
	defb 0d0h,010h,020h,0a0h,0e0h,0e0h,070h,070h,0f0h,0e0h,040h,000h,000h,000h	; 6daf  .. ...pp..@...

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_14: patrones de sprite de Snake (juego 14),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (129 bytes)
;   0x6dbd..0x6e3e  (129 bytes)
DATA_patrones_de_snake_14:
	defb 082h,000h,003h,003h,007h,08dh,01eh,02dh,02dh,031h,03eh,03fh,01eh,011h,03fh,03fh	; 6dbd  .......--1>?..??
	defb 01fh,000h,080h,003h,0c0h,0b8h,0e0h,070h,070h,0f0h,0c8h,0c8h,0e8h,0f8h,0f0h,0f8h	; 6dcd  .......pp.......
	defb 0f8h,000h,003h,006h,007h,007h,01dh,03ah,032h,02fh,037h,021h,011h,01fh,020h,026h	; 6ddd  .......:2/7!.. &
	defb 011h,000h,080h,040h,0c0h,0c0h,020h,090h,090h,030h,0f8h,0b0h,0d0h,0e8h,010h,008h	; 6ded  ...@.. ..0......
	defb 098h,01fh,01fh,03eh,03eh,02ch,068h,050h,028h,019h,003h,003h,007h,003h,003h,000h	; 6dfd  ...>>,hP(.......
	defb 002h,0f8h,08bh,0f0h,078h,058h,078h,0f8h,0f0h,0f0h,0e0h,0c0h,0c0h,080h,003h,000h	; 6e0d  ....xXx.........
	defb 08dh,011h,017h,022h,03ah,03ch,058h,070h,038h,019h,003h,003h,007h,003h,003h,000h	; 6e1d  ...":<Xp8.......
	defb 08dh,0c8h,088h,0d0h,078h,068h,058h,0f8h,0f0h,0f0h,0e0h,0c0h,0c0h,080h,003h,000h	; 6e2d  ....xhX.........
	defb 000h	; 6e3d

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_22: patrones de sprite de Snake (juego 22),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (125 bytes)
;   0x6e3e..0x6ebb  (125 bytes)
DATA_patrones_de_snake_22:
	defb 0cch,000h,001h,001h,003h,00fh,01eh,03ah,036h,07dh,05dh,067h,0f9h,0f9h,01fh,01dh	; 6e3e  .......:6}]g....
	defb 01dh,0e0h,0f0h,0f0h,090h,0d8h,07ch,0bch,0b4h,0fch,0fch,0ffh,0fah,0fch,0f8h,0ech	; 6e4e  ......|.........
	defb 0f6h,000h,001h,001h,003h,00dh,017h,025h,02bh,076h,06eh,05fh,0e7h,0ffh,01eh,01ah	; 6e5e  .......%+vn_....
	defb 012h,0e0h,0f0h,090h,0f0h,0b8h,0f4h,0f4h,0fch,05ch,03ch,0bfh,0f6h,0fch,0d8h,074h	; 6e6e  .........\<....t
	defb 08ah,00fh,00fh,01fh,03fh,05eh,098h,0b0h,0e1h,06fh,01fh,01fh,00fh,004h,000h,002h	; 6e7e  ....?^...o......
	defb 0ffh,081h,08fh,003h,00fh,086h,03bh,0fbh,0fdh,0feh,0fch,0c0h,004h,000h,08ch,008h	; 6e8e  ................
	defb 00ch,010h,021h,076h,0e8h,0f0h,0a1h,06fh,01fh,01fh,00fh,004h,000h,08ch,041h,0f5h	; 6e9e  ..!v...o......A.
	defb 089h,009h,00bh,00dh,03dh,0ffh,0ffh,0feh,0fch,0c0h,004h,000h,000h	; 6eae  ....=........

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_21: patrones de sprite de Snake (juego 21),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (123 bytes)
;   0x6ebb..0x6f36  (123 bytes)
DATA_patrones_de_snake_21:
	defb 0c0h,000h,001h,001h,01fh,03fh,065h,07dh,05dh,0cbh,09bh,04fh,0e7h,0f9h,01fh,01dh	; 6ebb  .....?e}]..O....
	defb 00dh,0e0h,0f0h,0f0h,090h,0d8h,07ch,0beh,0b6h,0feh,0feh,0ffh,0fah,0feh,0fch,0f4h	; 6ecb  ......|.........
	defb 0fch,000h,001h,001h,01bh,025h,05bh,066h,076h,0bch,0feh,077h,0ffh,0ffh,01eh,012h	; 6edb  .....%[fv..w....
	defb 00ah,0e0h,0f0h,090h,0f0h,0b8h,0fch,0f6h,0fah,05ah,036h,0bfh,0f6h,0feh,0dch,06ch	; 6eeb  .........Z6....l
	defb 044h,003h,00fh,002h,01fh,087h,01eh,01ch,02dh,07fh,06fh,03fh,01fh,004h,000h,08bh	; 6efb  D.......-.o?....
	defb 0feh,0beh,09eh,03ch,03ch,078h,070h,0f0h,0f8h,0feh,0f0h,005h,000h,002h,008h,08ah	; 6f0b  ...<<xp.........
	defb 00ch,011h,013h,012h,01ch,035h,05fh,05fh,03fh,01fh,004h,000h,08bh,0f2h,0a2h,092h	; 6f1b  .....5__?.......
	defb 024h,02ch,078h,050h,0b0h,098h,0feh,0f0h,005h,000h,000h	; 6f2b  $,xP.......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_23: patrones de sprite de Snake (juego 23),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (121 bytes)
;   0x6f36..0x6faf  (121 bytes)
DATA_patrones_de_snake_23:
	defb 002h,000h,002h,001h,0beh,007h,01fh,03dh,03dh,05bh,04bh,06fh,02fh,0f7h,0f7h,00fh	; 6f36  .......==[Ko/...
	defb 00eh,000h,0e0h,0f0h,0f0h,090h,0d8h,07ch,06eh,06eh,0eeh,0feh,0feh,0ffh,0fah,0f8h	; 6f46  .......|nn......
	defb 0f8h,000h,000h,001h,001h,007h,015h,023h,032h,06eh,07ch,05ch,037h,0efh,0efh,00fh	; 6f56  .......#2n|\7...
	defb 00dh,000h,0e0h,0f0h,090h,0f0h,0b8h,0fch,0fah,0fah,052h,036h,0beh,0ffh,0feh,0f8h	; 6f66  ..........R6....
	defb 058h,00fh,007h,005h,003h,085h,007h,00fh,007h,003h,001h,004h,000h,004h,0f8h,004h	; 6f76  X...............
	defb 0f0h,085h,070h,078h,03fh,0f8h,070h,003h,000h,08ch,008h,004h,003h,002h,003h,002h	; 6f86  ..px?.p.........
	defb 001h,005h,00fh,007h,003h,001h,004h,000h,081h,048h,003h,028h,002h,030h,087h,070h	; 6f96  .........H.(.0.p
	defb 0f0h,0b0h,0f8h,0ffh,0f8h,070h,003h,000h,000h	; 6fa6  .....p...

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_25: patrones de sprite de Snake (juego 25),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (128 bytes)
;   0x6faf..0x702f  (128 bytes)
DATA_patrones_de_snake_25:
	defb 0cdh,003h,007h,007h,005h,00ch,01eh,03bh,033h,03fh,03bh,033h,037h,039h,039h,07fh	; 6faf  ........3?.3799.
	defb 03fh,080h,0f0h,0f8h,0d8h,0d8h,0fch,0f4h,0bch,0b0h,0f0h,0f0h,0a0h,0f0h,0f0h,0b8h	; 6fbf  ?...............
	defb 0d8h,003h,007h,004h,007h,00fh,01fh,037h,02dh,02eh,03fh,03eh,03fh,03fh,02fh,06fh	; 6fcf  .......7-.?>??/o
	defb 023h,080h,0f0h,0d8h,0e8h,0f8h,09ch,0dch,0dch,0d0h,050h,030h,0e0h,0f0h,0d0h,058h	; 6fdf  #.........P0...X
	defb 028h,07fh,07eh,07ch,078h,050h,05ch,0ffh,0ffh,07fh,01fh,00fh,00fh,003h,003h,000h	; 6fef  (.~|xP\.........
	defb 003h,0f8h,081h,078h,003h,0f8h,002h,0f0h,094h,0d8h,0cch,0deh,0ech,078h,000h,000h	; 6fff  ...x.........x..
	defb 073h,056h,04ch,078h,070h,07ch,0ffh,0ffh,07fh,01fh,00fh,00fh,003h,003h,000h,003h	; 700f  sVLxp|..........
	defb 088h,08dh,048h,088h,088h,0d8h,0f0h,0f0h,0f8h,0fch,0feh,0fch,078h,000h,000h,000h	; 701f  ..H.........x...

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_26: patrones de sprite de Snake (juego 26),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (119 bytes)
;   0x702f..0x70a6  (119 bytes)
DATA_patrones_de_snake_26:
	defb 002h,000h,087h,001h,00fh,0fbh,02fh,045h,0ffh,003h,003h,001h,09dh,000h,001h,003h	; 702f  ....../E........
	defb 006h,000h,0e0h,0f0h,0feh,03dh,075h,0f7h,0b4h,0bch,0e6h,0e8h,0fdh,0d6h,0feh,076h	; 703f  .....=u........v
	defb 07eh,000h,000h,001h,00fh,0fdh,0f9h,0feh,0feh,002h,003h,001h,09fh,000h,001h,002h	; 704f  ~...............
	defb 005h,000h,0e0h,0f0h,03eh,0fbh,0aah,0ebh,0efh,0dfh,07fh,03fh,03fh,0feh,0f2h,0aah	; 705f  ....>......??...
	defb 086h,00fh,00fh,01fh,01fh,00fh,00eh,00ah,01bh,037h,03fh,00fh,005h,000h,002h,0fch	; 706f  .........7?.....
	defb 088h,0feh,0bah,01ah,00eh,07eh,0ffh,0ffh,0f8h,006h,000h,08bh,008h,009h,018h,010h	; 707f  .....~..........
	defb 00dh,00eh,00eh,01fh,03fh,03fh,00fh,005h,000h,08ah,00ch,03ch,0e6h,0aeh,01eh,00eh	; 708f  ....??.....<....
	defb 07eh,0ffh,0ffh,0f8h,006h,000h,000h	; 709f

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_24: patrones de sprite de Snake (juego 24),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (127 bytes)
;   0x70a6..0x7125  (127 bytes)
DATA_patrones_de_snake_24:
	defb 081h,000h,003h,001h,09dh,000h,007h,00fh,00fh,01fh,03eh,033h,03fh,07fh,053h,043h	; 70a6  ..........>3?.SC
	defb 074h,0c0h,020h,020h,090h,090h,0f0h,0f8h,0e8h,0b8h,0d8h,010h,050h,050h,070h,0d0h	; 70b6  t.  ........PPp.
	defb 070h,000h,003h,001h,08fh,000h,007h,00ch,00fh,01fh,033h,02dh,031h,07fh,07fh,07eh	; 70c6  p.........3-1..~
	defb 07fh,0c0h,0e0h,0e0h,003h,0f0h,084h,098h,0d8h,0e8h,078h,003h,0f0h,085h,0b0h,0f0h	; 70d6  ..........x.....
	defb 0f0h,01fh,01fh,003h,03fh,08bh,01eh,01ch,024h,077h,07fh,03fh,01fh,00fh,003h,000h	; 70e6  ....?...$w.?....
	defb 000h,004h,0f8h,002h,0fch,002h,07ch,0a2h,034h,0a4h,0f4h,0f4h,0ech,0fch,0fch,018h	; 70f6  ......|.4.......
	defb 01fh,010h,020h,021h,02fh,016h,01ch,03ch,07fh,07fh,03fh,01fh,00fh,003h,000h,000h	; 7106  .. !/..<..?.....
	defb 098h,008h,0c8h,088h,08ch,0e4h,044h,05ch,03ch,0bch,005h,0fch,081h,018h,000h	; 7116  ......D\<......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_27: patrones de sprite de Snake (juego 27),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (117 bytes)
;   0x7125..0x719a  (117 bytes)
DATA_patrones_de_snake_27:
	defb 0cah,003h,007h,01fh,07eh,0b7h,0adh,06bh,036h,037h,037h,025h,033h,07fh,06fh,067h	; 7125  ....~..k677%3.og
	defb 077h,080h,0c0h,0e0h,060h,060h,0e0h,0ffh,0c1h,0ddh,0fbh,0c0h,0e0h,0e0h,0b0h,098h	; 7135  w...``..........
	defb 0d8h,003h,007h,01eh,067h,0feh,0ffh,074h,03dh,02ch,02bh,03ah,03fh,04fh,051h,05bh	; 7145  ....g..t=,+:?OQ[
	defb 05bh,080h,0c0h,060h,0e0h,0e0h,0a0h,07fh,07fh,067h,0fbh,0c0h,0e0h,020h,050h,068h	; 7155  [..`.....g... Ph
	defb 0a8h,007h,00fh,01fh,01fh,016h,02fh,067h,07fh,03fh,00fh,006h,000h,08ah,0ffh,0dfh	; 7165  ....../g.?......
	defb 09eh,00eh,03bh,0fdh,0ffh,0ffh,0feh,080h,006h,000h,08ah,004h,008h,015h,01fh,01eh	; 7175  ................
	defb 03fh,07fh,07fh,03fh,00fh,006h,000h,085h,07dh,0d3h,09ah,00eh,03fh,003h,0ffh,082h	; 7185  ?..?....}...?...
	defb 0feh,080h,006h,000h,000h	; 7195

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_29: patrones de sprite de Snake (juego 29),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (66 bytes)
;   0x719a..0x71dc  (66 bytes)
DATA_patrones_de_snake_29:
	defb 09eh,000h,003h,007h,007h,01dh,03ch,06eh,0dfh,0f6h,0f6h,0ffh,0bfh,0f8h,09eh,0f0h	; 719a  ......<n........
	defb 060h,000h,080h,0c0h,0f0h,0d8h,0ech,0ech,0fch,0fch,0f8h,0f4h,0fch,0bah,01ch,003h	; 71aa  `...............
	defb 000h,09fh,003h,007h,004h,01fh,037h,057h,0b3h,08bh,0dbh,0b1h,0dch,0bfh,0feh,090h	; 71ba  ......7W........
	defb 069h,000h,080h,0c0h,0f0h,0e8h,0f4h,0f4h,09ch,094h,098h,01ch,035h,0feh,01ch,002h	; 71ca  i...........5...
	defb 0c8h,000h	; 71da

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_30: patrones de sprite de Snake (juego 30),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (64 bytes)
;   0x71dc..0x721c  (64 bytes)
DATA_patrones_de_snake_30:
	defb 08eh,000h,007h,00fh,00fh,009h,01bh,01eh,01dh,01dh,01fh,02fh,02fh,05dh,021h,004h	; 71dc  ...........//]!.
	defb 000h,003h,080h,09dh,0f8h,0ach,074h,07eh,07bh,079h,07dh,0f9h,027h,066h,000h,000h	; 71ec  ......t~{y}.'f..
	defb 007h,00fh,009h,00fh,01dh,01fh,017h,017h,01ch,038h,03ch,07fh,021h,010h,00eh,000h	; 71fc  .........8<.!...
	defb 000h,003h,080h,08bh,0f8h,0f4h,0c8h,0c6h,0edh,0d7h,0bah,0dfh,0fbh,07eh,020h,000h	; 720c  .............~ .

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_28: patrones de sprite de Snake (juego 28),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (64 bytes)
;   0x721c..0x725c  (64 bytes)
DATA_patrones_de_snake_28:
	defb 08dh,000h,003h,007h,007h,01fh,07bh,05dh,0dch,0ffh,0ddh,09dh,0b8h,06fh,004h,000h	; 721c  ......{].....o..
	defb 08ch,080h,0c0h,0c0h,0f8h,0dch,0deh,05eh,0feh,0dah,0fah,01ch,0f0h,004h,000h,09fh	; 722c  .......^........
	defb 003h,004h,007h,01fh,044h,026h,0a7h,0efh,0f7h,0f2h,0dfh,06fh,080h,01ah,000h,000h	; 723c  ....D&.....o....
	defb 080h,0c0h,0c0h,0f8h,0f4h,076h,0a6h,0f6h,07eh,02eh,0fch,0f1h,002h,018h,000h,000h	; 724c  .....v..~.......

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_31: patrones de sprite de Snake (juego 31),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (64 bytes)
;   0x725c..0x729c  (64 bytes)
DATA_patrones_de_snake_31:
	defb 002h,000h,003h,001h,09ah,01fh,035h,02eh,07eh,0deh,09eh,0beh,09fh,064h,027h,018h	; 725c  ......5.~....d'.
	defb 000h,0e0h,0f0h,0f0h,090h,0d8h,078h,0b8h,0b8h,0f8h,0f4h,0f4h,0bah,0f4h,080h,003h	; 726c  ......x.........
	defb 000h,003h,001h,09bh,01fh,02fh,013h,063h,0b7h,0ebh,05dh,0fbh,05fh,0bfh,058h,000h	; 727c  ...../.c..]._.X.
	defb 0e0h,0f0h,090h,0f0h,0b8h,0f8h,0e8h,0e8h,038h,01ch,03ch,0feh,0f4h,081h,00ch,000h	; 728c  ........8.<.....

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_33: patrones de sprite de Snake (juego 33),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (66 bytes)
;   0x729c..0x72de  (66 bytes)
DATA_patrones_de_snake_33:
	defb 092h,000h,003h,007h,007h,01dh,03ch,076h,077h,07dh,03dh,03fh,07fh,05fh,03fh,00fh	; 729c  ......<vw}=?._?.
	defb 001h,000h,080h,003h,0c0h,09dh,0e0h,0f8h,0ach,0f6h,076h,07eh,0ech,0cch,0d8h,0f0h	; 72ac  ..........v~....
	defb 040h,000h,003h,007h,004h,01fh,027h,05fh,04bh,05fh,073h,072h,058h,07ch,0bfh,00fh	; 72bc  @.....'_K_srX|..
	defb 031h,000h,080h,003h,0c0h,08bh,0e0h,0d8h,0f4h,04ah,0cah,0dah,0fch,0f4h,0aah,0b2h	; 72cc  1........J......
	defb 0c4h,000h	; 72dc

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_34: patrones de sprite de Snake (juego 34),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (66 bytes)
;   0x72de..0x7320  (66 bytes)
DATA_patrones_de_snake_34:
	defb 08fh,000h,007h,00fh,00fh,009h,00bh,00fh,018h,01fh,01bh,01fh,0fbh,0b1h,0c7h,03ch	; 72de  ...............<
	defb 003h,000h,08ch,080h,0f8h,0dch,06eh,0ffh,0cdh,03fh,07eh,077h,0efh,090h,0e0h,003h	; 72ee  ......n..?~w....
	defb 000h,09fh,007h,00fh,009h,00fh,00dh,00eh,01fh,013h,014h,014h,0feh,0efh,0fbh,03ch	; 72fe  ...............<
	defb 00ch,000h,000h,080h,0f8h,0e4h,09ah,01fh,07fh,0f9h,0ceh,0cfh,09fh,0f0h,0e1h,002h	; 730e  ................
	defb 018h,000h	; 731e

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_32: patrones de sprite de Snake (juego 32),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (66 bytes)
;   0x7320..0x7362  (66 bytes)
DATA_patrones_de_snake_32:
	defb 08eh,000h,003h,007h,007h,01fh,03fh,077h,077h,070h,07fh,03fh,03fh,014h,00fh,003h	; 7320  ......?wwp.??...
	defb 000h,0afh,080h,0c0h,0c0h,0f8h,0bch,06eh,076h,0feh,066h,0f2h,0f6h,0fch,0f8h,0f0h	; 7330  .......nv.f.....
	defb 000h,000h,003h,006h,007h,01fh,028h,059h,059h,06fh,077h,021h,038h,05fh,047h,020h	; 7340  ......(YYow!8_G
	defb 00ch,000h,080h,040h,0c0h,0f8h,0e4h,0d2h,0cah,0dah,0feh,0eeh,0fah,0f4h,078h,072h	; 7350  ...@..........xr
	defb 004h,000h	; 7360

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_35: patrones de sprite de Snake (juego 35),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (66 bytes)
;   0x7362..0x73a4  (66 bytes)
DATA_patrones_de_snake_35:
	defb 002h,000h,002h,001h,09bh,01fh,03fh,065h,07dh,05dh,0cbh,09bh,04fh,0e7h,0f9h,01eh	; 7362  ......?e}]..O...
	defb 000h,000h,0e0h,0f0h,0f0h,090h,0d8h,07ch,0beh,0b6h,0feh,0feh,0ffh,0fah,0fch,0c0h	; 7372  .......|........
	defb 003h,000h,002h,001h,09ch,01bh,025h,05bh,066h,076h,0bch,0feh,077h,0ffh,0ffh,05eh	; 7382  ......%[fv..w..^
	defb 030h,000h,0e0h,0f0h,090h,0f0h,0b8h,0fch,0f6h,0fah,05ah,036h,0bfh,0f6h,0fch,0c2h	; 7392  0.........Z6....
	defb 018h,000h	; 73a2

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_36: patrones de sprite de Snake (juego 36),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (313 bytes)
;   0x73a4..0x74dd  (313 bytes)
DATA_patrones_de_snake_36:
	defb 003h,03fh,003h,03eh,081h,01eh,003h,02ch,083h,034h,028h,010h,003h,000h,006h,0f8h	; 73a4  .?.>...,.4(.....
	defb 081h,0f0h,003h,068h,083h,058h,028h,010h,003h,000h,08dh,022h,027h,023h,032h,026h	; 73b4  ...h.X(...."'#2&
	defb 032h,016h,03ch,034h,034h,03ch,038h,010h,003h,000h,08dh,0c8h,088h,088h,0d8h,0c8h	; 73c4  2.<44<8.........
	defb 098h,0d0h,078h,058h,058h,078h,038h,010h,004h,000h,0dah,003h,004h,009h,013h,027h	; 73d4  ..xXXx8........'
	defb 026h,02eh,06ch,06ch,03ch,03eh,03eh,03fh,01fh,013h,07fh,0feh,03fh,0e7h,087h,00fh	; 73e4  &.ll<>>?....?...
	defb 01eh,03ch,03ch,07ch,07ch,038h,03ch,07ch,0feh,0ffh,000h,003h,007h,00eh,01dh,03ah	; 73f4  .<<||8<|.......:
	defb 03bh,035h,057h,057h,027h,025h,035h,034h,01ch,013h,07fh,083h,0f9h,0dfh,079h,0f2h	; 7404  .5WW'%54......y.
	defb 0e5h,0cbh,0cbh,08bh,093h,0d7h,0d3h,08bh,009h,0c8h,0fch,0ffh,0f8h,0cfh,0c3h,0e1h	; 7414  ................
	defb 0f0h,070h,070h,078h,078h,038h,078h,07dh,0ffh,0ffh,000h,080h,040h,020h,090h,0c8h	; 7424  .ppxx8x}....@ ..
	defb 0c8h,0e8h,06ch,06ch,078h,003h,0f8h,0a2h,0f0h,090h,0fch,083h,03fh,0f6h,03dh,09eh	; 7434  ..llx.......?.=.
	defb 04fh,0afh,0afh,0a7h,097h,0d7h,097h,0a2h,020h,027h,000h,080h,0c0h,0e0h,070h,0b8h	; 7444  O....... '....p.
	defb 0b8h,058h,0d4h,0d4h,0c8h,048h,058h,058h,070h,090h,010h,000h,081h,003h,00fh,000h	; 7454  .X...HXXp.......
	defb 002h,009h,002h,004h,002h,002h,002h,001h,008h,000h,091h,03ch,00bh,088h,084h,044h	; 7464  ...........<...D
	defb 044h,024h,024h,092h,092h,052h,04ah,02ah,025h,025h,017h,080h,01fh,000h,096h,079h	; 7474  D$$..RJ*%%.....y
	defb 0a1h,022h,042h,044h,044h,049h,049h,092h,092h,094h,0a4h,0a8h,048h,048h,0d0h,020h	; 7484  ."BDDII.....HH.
	defb 020h,040h,040h,080h,080h,00ah,000h,0c0h,01ah,012h,03bh,04fh,05fh,07dh,09ch,03eh	; 7494   @@........O_}.>
	defb 0f7h,076h,036h,01fh,01bh,03ch,017h,03bh,0b0h,090h,0b8h,0e4h,0f4h,0fch,0e4h,0f6h	; 74a4  .v6..<..........
	defb 0deh,0dch,0d0h,0f0h,0b0h,078h,0d0h,0b8h,01ah,012h,03bh,07fh,06ch,05fh,0f7h,0d7h	; 74b4  .....x......l_..
	defb 03bh,05bh,02bh,011h,01ch,027h,01bh,02ch,0b0h,090h,0b8h,0fch,0ech,0f4h,0fch,0eah	; 74c4  .[+..'.,........
	defb 0b2h,0ach,0b0h,010h,070h,0c8h,0b0h,068h,000h	; 74d4  ....p..h.

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_37: patrones de sprite de Snake (juego 37),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (40 bytes)
;   0x74dd..0x7505  (40 bytes)
DATA_patrones_de_snake_37:
	defb 004h,000h,088h,01fh,07fh,0feh,0ffh,0ffh,03fh,01fh,007h,007h,000h,089h,0f8h,0beh	; 74dd  ........?.......
	defb 0feh,0ffh,0dfh,0ffh,0feh,0fch,0f8h,009h,000h,083h,004h,005h,013h,00ch,000h,085h	; 74ed  ................
	defb 0c0h,060h,0d0h,038h,020h,007h,000h,000h	; 74fd  .`.8 ...

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_38: patrones de sprite de Snake (juego 38),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (41 bytes)
;   0x7505..0x752e  (41 bytes)
DATA_patrones_de_snake_38:
	defb 004h,000h,088h,007h,03eh,0ffh,06fh,07fh,00fh,07fh,001h,007h,000h,002h,0f8h,087h	; 7505  ....>.o.........
	defb 0ffh,0ech,0feh,0ffh,0fch,0e4h,0e0h,009h,000h,084h,005h,004h,011h,002h,00bh,000h	; 7515  ................
	defb 002h,080h,083h,058h,0f0h,010h,007h,000h,000h	; 7525  ...X.....

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_39: patrones de sprite de Snake (juego 39),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (115 bytes)
;   0x752e..0x75a1  (115 bytes)
DATA_patrones_de_snake_39:
	defb 004h,000h,09ch,003h,007h,007h,03fh,057h,077h,0f4h,0b7h,097h,07fh,030h,01fh,018h	; 752e  ......?Ww....0..
	defb 024h,034h,016h,092h,0cah,0feh,0f6h,0b6h,0bch,03ch,0b8h,0b0h,0f0h,030h,0f0h,004h	; 753e  $4.......<...0..
	defb 000h,098h,003h,006h,007h,03fh,06ch,04ch,0ebh,0ffh,0fch,068h,03fh,01fh,018h,03ch	; 754e  .....?lL...h?..<
	defb 02ch,01ah,09eh,04eh,0f6h,0eah,06ah,0e4h,0e4h,0f8h,004h,0f0h,085h,01fh,03fh,03fh	; 755e  ,..N..j.......??
	defb 07fh,07fh,003h,07eh,002h,03eh,08eh,01ch,014h,034h,02ch,018h,000h,0f8h,0f8h,0fch	; 756e  ...~.>...4,.....
	defb 0fch,0f8h,078h,048h,030h,008h,000h,098h,010h,020h,023h,041h,043h,04eh,066h,042h	; 757e  ..xH0.... #ACNfB
	defb 02ah,02eh,01ch,01ch,03ch,03ch,018h,000h,008h,008h,0c4h,0f4h,0a8h,078h,078h,030h	; 758e  *...<<.......xx0
	defb 008h,000h,000h	; 759e

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_40: patrones de sprite de Snake (juego 40),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (118 bytes)
;   0x75a1..0x7617  (118 bytes)
DATA_patrones_de_snake_40:
	defb 090h,018h,034h,024h,068h,049h,05bh,07fh,06fh,06bh,07bh,03ah,01bh,01bh,01fh,008h	; 75a1  ..4$hI[.ok{:....
	defb 00fh,004h,000h,09ch,0c0h,0e0h,0e0h,0fch,0deh,0dbh,01bh,0dfh,0d9h,0fdh,01eh,0f8h	; 75b1  ................
	defb 018h,02ch,03ch,058h,079h,07bh,06fh,057h,05fh,046h,025h,01fh,01eh,014h,00fh,00fh	; 75c1  .,<Xy{oW_F%.....
	defb 004h,000h,094h,0c0h,020h,0e0h,0fch,03ah,075h,0f5h,0f7h,07fh,07fh,0feh,0f8h,01fh	; 75d1  .... ..:u.......
	defb 01fh,03fh,03fh,01fh,01eh,012h,00ch,008h,000h,081h,0f8h,003h,0fch,094h,0feh,03eh	; 75e1  .??............>
	defb 03eh,07eh,07ch,03ch,038h,028h,028h,034h,018h,000h,010h,010h,023h,02fh,015h,01eh	; 75f1  >~|<8((4....#/..
	defb 01eh,00ch,008h,000h,08ah,008h,004h,0cch,084h,0c2h,03ah,022h,042h,054h,034h,003h	; 7601  ..........:"BT4.
	defb 038h,083h,03ch,018h,000h,000h	; 7611

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_43: patrones de sprite de Snake (juego 43),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (102 bytes)
;   0x7617..0x767d  (102 bytes)
DATA_patrones_de_snake_43:
	defb 009h,000h,087h,010h,03bh,07fh,07ch,07bh,077h,037h,009h,000h,087h,010h,0b8h,0fch	; 7617  ......|{w7......
	defb 07ch,0bch,0fch,03ch,009h,000h,087h,018h,02bh,05fh,04bh,06fh,058h,03bh,009h,000h	; 7627  |..<....+_KoX...
	defb 08ah,030h,0a8h,064h,094h,0e4h,04ch,0cch,03fh,01fh,01fh,004h,03fh,086h,03eh,03fh	; 7637  .0.d..L.?...?.>?
	defb 01bh,00bh,016h,00ch,003h,000h,003h,0f8h,003h,0f0h,002h,0f8h,002h,0f0h,093h,0b0h	; 7647  ................
	defb 0e0h,090h,048h,030h,000h,028h,010h,013h,021h,021h,02bh,017h,022h,02fh,01fh,00dh	; 7657  ..H0.(..!!+."/..
	defb 01ah,00ch,003h,000h,090h,058h,038h,0b8h,010h,010h,090h,0e8h,088h,090h,0d0h,0f0h	; 7667  .....X8.........
	defb 0e0h,0f0h,078h,030h,000h,000h	; 7677

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_41: patrones de sprite de Snake (juego 41),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (116 bytes)
;   0x767d..0x76f1  (116 bytes)
DATA_patrones_de_snake_41:
	defb 005h,000h,08bh,001h,003h,01bh,03ah,03bh,03bh,07ch,05bh,07fh,02fh,00fh,005h,000h	; 767d  ......:..|[./...
	defb 08bh,0c0h,0e0h,0fch,01eh,0deh,0deh,03eh,0dah,0fah,0fch,0f8h,005h,000h,08bh,001h	; 768d  .......>........
	defb 002h,01fh,02fh,005h,00eh,07fh,077h,07ch,028h,00bh,005h,000h,08bh,0c0h,0e0h,0fch	; 769d  ../...w|(.......
	defb 0f2h,0f0h,072h,0feh,0feh,03eh,01ch,088h,006h,01fh,097h,00fh,00eh,01fh,01bh,013h	; 76ad  ..r..>..........
	defb 01bh,00fh,003h,000h,000h,0f8h,0fch,07ch,07ch,078h,038h,02ch,066h,0eeh,0fch,0fch	; 76bd  .......||x8,f...
	defb 0f8h,0e0h,003h,000h,088h,010h,011h,011h,017h,011h,013h,009h,00ah,004h,01fh,091h	; 76cd  ................
	defb 00fh,003h,000h,000h,0e8h,084h,044h,074h,048h,038h,03ch,07eh,0feh,0fch,0fch,0f8h	; 76dd  ......DtH8<~....
	defb 0e0h,003h,000h,000h	; 76ed

; ----------------------------------------------------------------------
; DATOS patrones_de_snake_42: patrones de sprite de Snake (juego 42),
;   comprimidos: n < 0x80 repite el byte siguiente n veces, n > 0x80 copia n &
;   0x7F bytes, 0 acaba (p00:53C2 los manda a la VRAM 0xF800); lo leen
;   p00:53C2 (77 bytes)
;   0x76f1..0x773e  (77 bytes)
DATA_patrones_de_snake_42:
	defb 008h,000h,088h,03fh,041h,051h,051h,0b1h,0a1h,0a1h,081h,008h,000h,088h,0f8h,08ch	; 76f1  ...?AQQ.........
	defb 09ch,08ch,0beh,096h,09eh,086h,008h,000h,088h,03fh,07fh,06fh,06fh,0efh,0deh,0ffh	; 7701  .........?.oo...
	defb 0ffh,008h,000h,088h,0f8h,074h,064h,074h,04ah,06ah,06ah,07ah,010h,0ffh,005h,0feh	; 7711  .....tdtJjjz....
	defb 00bh,0ffh,085h,081h,0bfh,0bfh,0bch,0b0h,005h,0a0h,002h,080h,089h,0a0h,081h,080h	; 7721  ................
	defb 0ffh,002h,0fah,00ah,002h,002h,008h,003h,083h,083h,003h,0ffh,000h	; 7731  .............

; ----------------------------------------------------------------------
; DATOS patrones_773E: patrones de sprite comprimidos (n < 0x80 repite el byte
;   siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n & 0x7F
;   bytes, 0 acaba; L_4DD5): juego 5, patron 56; juego 12, patron 56; juego
;   13, patron 56; juego 14, patron 56; lo leen p00:4DD5 (149 bytes)
;   0x773e..0x77d3  (149 bytes)
DATA_patrones_773E:
	defb 006h,000h,081h,017h,003h,00fh,081h,007h,00ah,000h,085h,080h,0c0h,0c0h,0e0h,0c0h	; 773e  ................
	defb 00dh,000h,083h,001h,003h,001h,00dh,000h,083h,080h,0c0h,080h,008h,000h,08ah,070h	; 774e  ...............p
	defb 00fh,003h,00fh,01fh,03fh,03fh,05eh,00eh,021h,007h,000h,085h,0c0h,0f0h,0d8h,0b8h	; 775e  ....??^.!.......
	defb 078h,003h,0f8h,082h,0e8h,0f0h,004h,000h,08bh,080h,010h,070h,01ch,000h,007h,00fh	; 776e  x..........p....
	defb 00fh,03fh,031h,01eh,003h,004h,004h,000h,089h,004h,080h,0a0h,050h,0a0h,0f0h,070h	; 777e  .?1.........P..p
	defb 074h,062h,005h,000h,0bfh,072h,01ch,03fh,07fh,03fh,03fh,01fh,08fh,0bfh,07ch,07eh	; 778e  tb...r.?.??...|~
	defb 02fh,000h,000h,041h,000h,018h,07ch,010h,01eh,0dch,0deh,0deh,0ffh,09fh,03eh,07eh	; 779e  /..A..|.......>~
	defb 0fch,074h,080h,000h,000h,002h,003h,00ch,03ch,05ch,058h,060h,030h,00ch,01fh,00fh	; 77ae  .t......<\X`0...
	defb 012h,01fh,000h,000h,080h,018h,085h,0fch,0eah,02ah,024h,026h,047h,06fh,0cch,09ch	; 77be  .........*$&Go..
	defb 038h,088h,078h,000h,000h	; 77ce

; ----------------------------------------------------------------------
; DATOS patrones_77D3: patrones de sprite comprimidos (n < 0x80 repite el byte
;   siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n & 0x7F
;   bytes, 0 acaba; L_4DD5): juego 12, patron 224; juego 13, patron 224; juego
;   14, patron 224; juego 23, patron 224; lo leen p00:4DD5 (216 bytes)
;   0x77d3..0x78ab  (216 bytes)
DATA_patrones_77D3:
	defb 006h,000h,081h,017h,003h,00fh,081h,007h,00ah,000h,085h,080h,0c0h,0c0h,0e0h,0c0h	; 77d3  ................
	defb 00dh,000h,083h,001h,003h,001h,00dh,000h,083h,080h,0c0h,080h,007h,000h,0beh,072h	; 77e3  ...............r
	defb 01ch,03fh,07fh,03fh,03fh,01fh,08fh,0bfh,07ch,07eh,02fh,000h,000h,041h,000h,018h	; 77f3  .?.??...|~/..A..
	defb 07ch,010h,01eh,0dch,0deh,0deh,0ffh,09fh,03eh,07eh,0fch,074h,080h,000h,000h,002h	; 7803  |.......>~.t....
	defb 003h,00ch,03ch,05ch,058h,060h,030h,00ch,01fh,00fh,012h,01fh,000h,000h,080h,018h	; 7813  ..<\X`0.........
	defb 085h,0fch,0eah,02ah,024h,026h,047h,06fh,0cch,09ch,038h,088h,078h,003h,000h,096h	; 7823  ...*$&Go..8.x...
	defb 018h,00eh,003h,001h,007h,00fh,00fh,03fh,02fh,01fh,01eh,069h,003h,003h,038h,00ch	; 7833  .......?/..i..8.
	defb 00eh,006h,006h,086h,0cfh,0efh,004h,0f7h,081h,0e7h,003h,0ffh,003h,000h,08dh,03ch	; 7843  ...............<
	defb 070h,071h,0f3h,0f7h,0ffh,0ffh,0f6h,0f8h,0ffh,09fh,0bfh,0bfh,004h,000h,08fh,03fh	; 7853  pq.............?
	defb 0fch,0e0h,080h,0c0h,000h,000h,0e0h,0e0h,0f8h,0ffh,07eh,001h,000h,007h,003h,00fh	; 7863  ..........~.....
	defb 085h,01fh,06fh,040h,080h,080h,005h,000h,096h,0ffh,0f8h,0f7h,0e7h,0efh,0efh,0cfh	; 7873  ..o@............
	defb 0c7h,0c7h,017h,013h,038h,078h,060h,0c0h,080h,03fh,07fh,0ffh,0ffh,0feh,0feh,005h	; 7883  ....8x`..?......
	defb 0ffh,082h,00eh,0f0h,003h,000h,090h,080h,0c0h,0e0h,0f0h,0fch,07eh,066h,063h,041h	; 7893  ............~fcA
	defb 002h,020h,060h,010h,018h,000h,000h,000h	; 78a3  . `.....

; ----------------------------------------------------------------------
; DATOS patrones_78AB: patrones de sprite comprimidos (n < 0x80 repite el byte
;   siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n & 0x7F
;   bytes, 0 acaba; L_4DD5): juego 0, patron 56; lo leen p00:4DD5 (285 bytes)
;   0x78ab..0x79c8  (285 bytes)
DATA_patrones_78AB:
	defb 004h,000h,083h,03fh,059h,0b0h,003h,0b6h,083h,0b0h,0b6h,0b6h,003h,0b0h,004h,000h	; 78ab  ...?Y...........
	defb 085h,0c0h,0e0h,0f0h,0f0h,0feh,007h,0b3h,004h,000h,082h,03fh,067h,003h,0cfh,084h	; 78bb  ...........?g...
	defb 0c9h,0cfh,0cfh,0c9h,003h,0cfh,004h,000h,085h,0c0h,0e0h,0f0h,0f0h,0feh,007h,0cfh	; 78cb  ................
	defb 092h,0ffh,080h,0ffh,0dfh,0f0h,0f7h,0f4h,0d4h,094h,090h,096h,0deh,0fch,0f6h,0f0h	; 78db  ................
	defb 0d0h,0ffh,000h,003h,0ffh,082h,01fh,00fh,003h,000h,086h,063h,0f7h,0d6h,063h,000h	; 78eb  ...........c..c.
	defb 000h,004h,0ffh,003h,0bfh,004h,0ffh,081h,0fdh,003h,0bfh,004h,0ffh,083h,0a4h,0ffh	; 78fb  ................
	defb 0fah,005h,0ffh,081h,0deh,005h,0ffh,081h,000h,003h,0ffh,082h,0f8h,0f0h,003h,000h	; 790b  ................
	defb 08ch,0c6h,0efh,06bh,0c6h,000h,000h,0ffh,001h,0ffh,0fah,00eh,0eah,003h,02ah,087h	; 791b  ...k..........*.
	defb 00ah,06ah,07ah,03ah,06ah,00ah,00ah,003h,0ffh,083h,025h,0ffh,05fh,005h,0ffh,081h	; 792b  .jz:j.....%._...
	defb 07bh,007h,0ffh,008h,0feh,081h,0beh,004h,0feh,093h,0f4h,0d4h,095h,094h,094h,0d4h	; 793b  {...............
	defb 0f4h,0f5h,0f7h,0d5h,094h,097h,090h,0ffh,080h,0ffh,000h,000h,0c0h,004h,000h,003h	; 794b  ................
	defb 0ffh,087h,000h,0ffh,000h,0ffh,000h,0ffh,0bfh,005h,0ffh,003h,0bfh,00fh,0ffh,081h	; 795b  ................
	defb 000h,007h,0ffh,002h,000h,081h,003h,004h,000h,003h,0ffh,089h,000h,0ffh,000h,0ffh	; 796b  ................
	defb 000h,0ffh,02ah,02ah,0aah,004h,02ah,088h,0aah,0eah,0aah,02ah,0eah,00ah,0ffh,001h	; 797b  ..**..*....*....
	defb 009h,0ffh,081h,000h,007h,0ffh,00dh,0feh,003h,0ffh,083h,0b0h,0ffh,07fh,003h,004h	; 798b  ................
	defb 083h,00ch,004h,004h,006h,00ch,08ah,004h,0b3h,0b3h,0ffh,07eh,004h,004h,00ch,004h	; 799b  ...........~....
	defb 00ch,007h,000h,083h,0cfh,0ffh,07fh,003h,00ch,083h,004h,00ch,00ch,006h,004h,08ah	; 79ab  ................
	defb 00ch,0cfh,0cfh,0ffh,07eh,00ch,00ch,004h,00ch,00ch,007h,000h,000h	; 79bb  ....~........

; ----------------------------------------------------------------------
; DATOS patrones_79C8: patrones de sprite comprimidos (n < 0x80 repite el byte
;   siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n & 0x7F
;   bytes, 0 acaba; L_4DD5): juego 3, patron 208; juego 17, patron 208; juego
;   27, patron 208; lo leen p00:4DD5 (314 bytes)
;   0x79c8..0x7b02  (314 bytes)
DATA_patrones_79C8:
	defb 002h,000h,0beh,003h,007h,005h,01ch,03ch,07ah,07bh,05ch,06eh,07eh,063h,03ch,01fh	; 79c8  .......<z{\n~c<.
	defb 03fh,000h,000h,080h,0c0h,040h,070h,0f8h,0fch,0feh,07ah,076h,0feh,0c6h,03ch,0fch	; 79d8  ?....@p...zv..<.
	defb 0f8h,000h,000h,003h,007h,007h,01fh,027h,047h,067h,077h,07bh,07fh,07fh,03fh,013h	; 79e8  .......'Ggw{..?.
	defb 030h,000h,000h,080h,0c0h,0c0h,0f0h,0c8h,0e4h,0c6h,0deh,0deh,0beh,0feh,0fch,0fch	; 79f8  0...............
	defb 078h,003h,000h,08dh,003h,007h,007h,03dh,07ch,07ah,07dh,05ch,07eh,05fh,023h,01ch	; 7a08  x......=|z}\~_#.
	defb 03fh,003h,000h,08dh,080h,0c0h,0c0h,07ch,07eh,0feh,0feh,07ah,07eh,0fah,0c6h,03ch	; 7a18  ?......|~..z~..<
	defb 0fch,003h,000h,08dh,003h,007h,007h,03fh,067h,047h,067h,073h,07bh,07dh,03fh,01fh	; 7a28  .......?gGgs{}?.
	defb 03fh,003h,000h,08eh,080h,0c0h,0c0h,0fch,0c6h,0e2h,0ceh,0ceh,0deh,0beh,0feh,0fch	; 7a38  ?...............
	defb 0fch,07fh,004h,0ffh,088h,073h,033h,01bh,009h,019h,013h,01fh,00eh,003h,000h,082h	; 7a48  .....s3.........
	defb 0f8h,0fch,003h,0feh,094h,0fch,0ech,0e4h,0e4h,0f4h,0e6h,072h,01ah,00eh,000h,000h	; 7a58  ...........r....
	defb 067h,0c1h,09fh,087h,0dfh,07fh,03fh,01fh,00fh,003h,01fh,081h,00eh,003h,000h,085h	; 7a68  g.....?.........
	defb 0e8h,084h,086h,0d2h,0f6h,005h,0fch,084h,0feh,07eh,01eh,00eh,004h,000h,0bfh,003h	; 7a78  .........~......
	defb 005h,004h,03ch,07eh,07bh,0fbh,0bch,0beh,09eh,09fh,0dfh,07fh,05fh,000h,000h,080h	; 7a88  ..<~{......._...
	defb 040h,040h,0f8h,0fch,0fch,0feh,07bh,079h,0f1h,0fdh,0f9h,0f3h,0e6h,000h,000h,003h	; 7a98  @@....{y........
	defb 007h,007h,03fh,067h,047h,0e7h,0e7h,0f3h,0f3h,0f1h,0f8h,070h,070h,000h,000h,080h	; 7aa8  ..?gG......pp...
	defb 0c0h,0c0h,0f8h,0cch,0e4h,0c6h,0cfh,0cfh,09fh,03fh,07fh,0bfh,0feh,07fh,005h,0ffh	; 7ab8  .........?......
	defb 087h,067h,027h,033h,01bh,032h,026h,03ch,003h,000h,082h,0e4h,0fch,005h,0feh,096h	; 7ac8  .g'3.2&<........
	defb 0ech,0e4h,0f4h,064h,026h,032h,01eh,004h,000h,067h,0c1h,08bh,087h,087h,0dfh,07fh	; 7ad8  ...d&2...g......
	defb 03fh,03fh,01fh,03eh,03eh,03ch,003h,000h,087h,0fch,094h,086h,0c2h,0d2h,0e6h,0feh	; 7ae8  ??.>><..........
	defb 003h,0fch,086h,07ch,03eh,03eh,01eh,004h,000h,000h	; 7af8  ...|>>....

; ----------------------------------------------------------------------
; DATOS patrones_7B02: patrones de sprite comprimidos (n < 0x80 repite el byte
;   siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n & 0x7F
;   bytes, 0 acaba; L_4DD5): juego 9, patron 208; lo leen p00:4DD5 (310 bytes)
;   0x7b02..0x7c38  (310 bytes)
DATA_patrones_7B02:
	defb 002h,000h,0aah,003h,007h,01fh,03fh,07dh,07ah,07fh,07ch,07eh,07eh,05fh,070h,07fh	; 7b02  ......?}z.|~~_p.
	defb 07fh,000h,000h,080h,0f0h,0fch,0feh,0feh,0ffh,0ffh,0feh,0feh,0fah,0c4h,03ch,0f8h	; 7b12  ..............<.
	defb 0f8h,000h,000h,003h,007h,01fh,027h,047h,047h,043h,053h,071h,079h,003h,07fh,0aah	; 7b22  ......'GGCSqy...
	defb 047h,000h,000h,080h,0f0h,0e4h,0e2h,0c2h,0c1h,0c9h,08ah,08eh,0beh,0fch,0fch,0f8h	; 7b32  G...............
	defb 0f8h,000h,003h,007h,01fh,03dh,074h,0fah,0fbh,0fch,0feh,07eh,05fh,023h,03ch,03fh	; 7b42  .....=t....~_#<?
	defb 07fh,000h,080h,0c0h,0c0h,0f8h,0fch,0fch,0feh,07eh,003h,0feh,090h,0fah,00ch,0f8h	; 7b52  .........~......
	defb 0f8h,000h,003h,007h,01fh,027h,04fh,087h,087h,083h,0d1h,071h,07ch,003h,03fh,09eh	; 7b62  .....'O....q|.?.
	defb 047h,000h,080h,0c0h,0c0h,0f8h,0c4h,0c0h,0c2h,0cah,08ah,08eh,01eh,0feh,0fch,0f8h	; 7b72  G...............
	defb 0f8h,0ffh,0ffh,07fh,07fh,03fh,03fh,01fh,013h,01bh,019h,033h,03fh,01fh,003h,000h	; 7b82  .....??....3?...
	defb 002h,0fch,006h,0feh,08eh,0fch,0e6h,0e7h,0f7h,033h,01eh,000h,000h,083h,087h,04fh	; 7b92  .........3.....O
	defb 043h,027h,037h,004h,01fh,002h,03fh,081h,01fh,003h,000h,002h,084h,08ch,082h,0e2h	; 7ba2  C'7...?.........
	defb 0e2h,0c2h,0e2h,0e6h,0fch,0feh,0ffh,0ffh,03fh,01eh,003h,000h,0c0h,003h,007h,005h	; 7bb2  ........?.......
	defb 01ch,034h,07ah,0fbh,0fch,0feh,0bfh,09fh,0bfh,09fh,09fh,0c7h,000h,080h,0c0h,0c0h	; 7bc2  .4z.............
	defb 078h,0fch,0feh,0ffh,07fh,0ffh,0ffh,0f9h,0f9h,0fdh,0fbh,0f9h,000h,003h,007h,007h	; 7bd2  x...............
	defb 01fh,02fh,047h,087h,097h,0d3h,0f1h,0f1h,0f9h,0f9h,0ffh,0fdh,000h,080h,0c0h,0c0h	; 7be2  ./G.............
	defb 0f8h,0c4h,0c2h,0c1h,0c5h,089h,08fh,00fh,00fh,03fh,09fh,00fh,0e7h,003h,0ffh,002h	; 7bf2  .........?......
	defb 07fh,08bh,03fh,01fh,013h,01bh,019h,033h,03fh,01ch,000h,000h,0ffh,009h,0feh,08dh	; 7c02  ..?....3?.......
	defb 0f2h,0fah,01bh,00dh,00fh,000h,0bfh,09fh,09fh,0c7h,043h,063h,037h,004h,01fh,002h	; 7c12  ..........Cc7...
	defb 03fh,093h,01ch,000h,000h,087h,086h,082h,082h,0e2h,0e2h,0c2h,0e2h,0e6h,0feh,0feh	; 7c22  ?...............
	defb 0f6h,01fh,00bh,00fh,000h,000h	; 7c32

; ----------------------------------------------------------------------
; DATOS patrones_7C38: patrones de sprite comprimidos (n < 0x80 repite el byte
;   siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n & 0x7F
;   bytes, 0 acaba; L_4DD5): juego 18, patron 96; lo leen p00:4DD5 (749 bytes)
;   0x7c38..0x7f25  (749 bytes)
DATA_patrones_7C38:
	defb 0a1h,003h,004h,007h,006h,01ch,036h,035h,03dh,03fh,03fh,01fh,01fh,00eh,019h,01fh	; 7c38  ......65=??.....
	defb 01fh,080h,0c0h,040h,040h,060h,0f8h,0dch,0beh,0b6h,0eeh,0fch,098h,030h,0f8h,0f8h	; 7c48  ...@@`.......0..
	defb 0d8h,003h,003h,007h,08dh,017h,02fh,02fh,01fh,01ah,038h,038h,01fh,00dh,01fh,017h	; 7c58  ......//..88....
	defb 010h,080h,003h,0c0h,0adh,0e0h,0f8h,074h,0e2h,0cah,0d2h,0e4h,078h,0d0h,0e8h,008h	; 7c68  .......t....x...
	defb 028h,003h,004h,005h,006h,005h,007h,00fh,01ah,01fh,0ffh,0afh,047h,03fh,003h,007h	; 7c78  (...........G?..
	defb 007h,080h,0c0h,0c0h,0ech,0f6h,0b7h,0fdh,0f5h,0eeh,05fh,07fh,0ffh,0ech,01ch,0feh	; 7c88  .........._.....
	defb 07eh,003h,004h,007h,0b8h,006h,00bh,015h,011h,0f1h,0fbh,07fh,026h,003h,004h,004h	; 7c98  ~...........&...
	defb 080h,0c0h,0c0h,0fch,09ah,04fh,00fh,09fh,0beh,0f7h,0e7h,08fh,07ch,0f4h,0e2h,082h	; 7ca8  .....O......|...
	defb 003h,004h,007h,00fh,01eh,02dh,02dh,03fh,01eh,011h,00eh,00fh,010h,01fh,01bh,01fh	; 7cb8  .....--?........
	defb 080h,0c0h,0c0h,0e0h,0f0h,0d8h,0e8h,0f8h,0d8h,0cch,0f4h,0fch,038h,003h,0f0h,0b6h	; 7cc8  ............8...
	defb 003h,007h,007h,00fh,019h,03bh,033h,021h,013h,01fh,00fh,009h,01fh,01fh,014h,010h	; 7cd8  ......3!........
	defb 080h,0c0h,0c0h,0e0h,090h,028h,098h,0b8h,0e8h,0b4h,0cch,0fch,0f8h,0f0h,010h,010h	; 7ce8  .....(..........
	defb 000h,001h,001h,01fh,03dh,02eh,07eh,07eh,0ddh,0bfh,09fh,04fh,0f7h,0f9h,01fh,01fh	; 7cf8  ....=.~~...O....
	defb 0e0h,090h,0f0h,0b0h,0d0h,0f8h,003h,0ech,002h,0fch,096h,0feh,0fch,0e8h,0f0h,0f0h	; 7d08  ................
	defb 000h,001h,001h,01fh,027h,033h,043h,067h,0beh,0dch,0e9h,07fh,0efh,0ffh,016h,000h	; 7d18  ....'3Cg........
	defb 0e0h,003h,0f0h,08ch,0b0h,078h,07ch,078h,050h,034h,03ch,0feh,0fch,078h,050h,040h	; 7d28  .....x|xP4<..xP@
	defb 004h,01fh,002h,017h,08bh,01ah,01eh,01eh,00eh,00fh,00fh,01fh,03fh,03fh,01fh,0d8h	; 7d38  ............??..
	defb 004h,0f8h,002h,0f0h,0b0h,070h,078h,078h,0f0h,0f0h,0e0h,0c0h,080h,000h,011h,019h	; 7d48  .....pxx........
	defb 017h,011h,019h,009h,006h,014h,012h,002h,007h,00bh,013h,03bh,037h,01fh,028h,038h	; 7d58  ............7.(8
	defb 0c8h,088h,0c8h,090h,0f0h,010h,038h,058h,0f0h,0f0h,0e0h,0c0h,080h,000h,007h,003h	; 7d68  ......8X........
	defb 007h,007h,006h,006h,007h,005h,003h,002h,007h,083h,00fh,003h,07eh,005h,0fch,0ach	; 7d78  ............~...
	defb 0f8h,078h,0f8h,0f8h,0fch,0feh,0fch,0f8h,0e0h,080h,004h,002h,005h,004h,005h,005h	; 7d88  .x..............
	defb 004h,002h,002h,003h,002h,002h,007h,004h,00fh,003h,082h,00ch,0fch,034h,0f4h,064h	; 7d98  .............4.d
	defb 0e8h,0b8h,0e8h,0e8h,0fch,07eh,07ch,0f8h,0e0h,080h,00fh,01fh,003h,00fh,08bh,007h	; 7da8  .....~|.........
	defb 00fh,00fh,01fh,00fh,00fh,007h,007h,003h,000h,000h,003h,0f0h,0adh,070h,0b0h,0f0h	; 7db8  .............p..
	defb 070h,0e0h,0e0h,060h,0e0h,0e0h,0f0h,0f0h,0e0h,000h,00ch,013h,007h,009h,00bh,007h	; 7dc8  p..`............
	defb 009h,00dh,01fh,00fh,00fh,007h,007h,003h,000h,000h,070h,0d0h,010h,090h,050h,0d0h	; 7dd8  ..........p...P.
	defb 090h,020h,0a0h,0e0h,020h,060h,0b0h,0f0h,0e0h,000h,003h,01fh,002h,01bh,002h,00fh	; 7de8  . .. `..........
	defb 083h,01fh,01bh,00fh,003h,01fh,002h,03fh,081h,01fh,007h,0f0h,005h,0e0h,003h,0f0h	; 7df8  .......?........
	defb 0a1h,0e0h,018h,017h,011h,014h,015h,009h,009h,013h,015h,00bh,01fh,013h,013h,037h	; 7e08  ...............7
	defb 03bh,01fh,070h,0d0h,090h,0d0h,0d0h,0f0h,0d0h,080h,0e0h,0e0h,0a0h,0a0h,0b0h,0d0h	; 7e18  ..p.............
	defb 0f0h,0e0h,006h,01fh,003h,00fh,002h,01fh,002h,00fh,085h,007h,003h,000h,0b8h,0b8h	; 7e28  ................
	defb 003h,0f0h,002h,0b0h,085h,0f0h,0d0h,0a0h,0e0h,0e0h,003h,0f0h,0b4h,0e0h,003h,012h	; 7e38  ................
	defb 01eh,011h,013h,011h,00bh,00fh,00bh,01bh,017h,00fh,00fh,007h,003h,000h,048h,048h	; 7e48  ..............HH
	defb 010h,0f0h,010h,050h,050h,030h,0b0h,060h,0e0h,020h,030h,070h,0b0h,0e0h,00fh,00eh	; 7e58  ...PP0.`. 0p....
	defb 01fh,017h,02fh,02eh,03ch,03ch,038h,030h,018h,038h,05fh,0ffh,0ffh,07fh,07eh,0feh	; 7e68  ../.<<80.8_...~.
	defb 0fch,003h,0f8h,0bch,0fch,07ch,03eh,00fh,00fh,0ffh,0ffh,0feh,0fch,080h,008h,00dh	; 7e78  .....|>.........
	defb 013h,018h,031h,01ah,00ch,024h,038h,010h,028h,028h,06fh,09fh,0ffh,07fh,082h,002h	; 7e88  ..1..$8.((o.....
	defb 00ch,0f8h,0c8h,098h,0c4h,06ch,032h,009h,00dh,0fbh,0ffh,0feh,0fch,080h,01fh,01fh	; 7e98  .....l2.........
	defb 017h,017h,01fh,02fh,03eh,03eh,05ch,073h,07fh,07fh,03fh,03fh,008h,000h,0f0h,0f0h	; 7ea8  .../>>\s..??....
	defb 003h,0f8h,088h,078h,070h,038h,0f8h,0f8h,0f0h,0f0h,0c0h,003h,000h,09dh,010h,01fh	; 7eb8  ...xp8..........
	defb 019h,019h,015h,033h,032h,02ah,06ch,033h,05fh,05fh,03fh,03fh,008h,000h,070h,0d0h	; 7ec8  ...32*l3__??..p.
	defb 088h,0c8h,0a8h,048h,050h,038h,0c8h,0d8h,0f0h,0f0h,0c0h,003h,000h,08bh,01bh,00fh	; 7ed8  ...HP8..........
	defb 01fh,01fh,01bh,01bh,03fh,037h,03eh,03ch,078h,004h,0ffh,08bh,07fh,0f8h,0f8h,0fch	; 7ee8  ....?7><x.......
	defb 0fch,0feh,03eh,01eh,01eh,00eh,00eh,004h,0ffh,0a2h,0feh,080h,014h,008h,017h,010h	; 7ef8  ..>.............
	defb 015h,015h,029h,029h,032h,03ch,058h,09fh,0bfh,0dfh,0ffh,07fh,048h,058h,0e4h,0c0h	; 7f08  ..))2<X.....HX..
	defb 0eah,038h,010h,012h,00eh,00ah,0f9h,0fbh,0fch,0ffh,0feh,080h,000h	; 7f18  .8...........

; ----------------------------------------------------------------------
; DATOS patrones_7F25: patrones de sprite comprimidos (n < 0x80 repite el byte
;   siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia n & 0x7F
;   bytes, 0 acaba; L_4DD5): juego 10, patron 96 (sigue en el banco 11, en
;   0x8000); lo leen p00:4DD5 (219 bytes)
;   0x7f25..0x8000  (219 bytes)
DATA_patrones_7F25:
	defb 092h,000h,007h,00bh,00fh,03fh,079h,05dh,07fh,07fh,0bfh,0ffh,0ffh,0bfh,0efh,077h	; 7f25  .....?y].......w
	defb 03fh,000h,000h,003h,080h,09dh,0e0h,0f8h,0fch,0f6h,0f6h,0eeh,0fch,09ch,078h,0f0h	; 7f35  ?.............x.
	defb 0e0h,000h,007h,00ch,008h,03fh,06fh,07fh,05fh,079h,0fbh,0bfh,0ffh,0ffh,0bch,06ch	; 7f45  .....?o._y.....l
	defb 03fh,000h,000h,003h,080h,09eh,0e0h,0b8h,074h,0eah,0cah,0d2h,0e4h,064h,088h,030h	; 7f55  ?.......t....d.0
	defb 0e0h,07fh,0dfh,09fh,0bfh,0fdh,07dh,06ch,078h,03dh,03fh,03fh,06fh,0dfh,0ffh,07fh	; 7f65  ......}lx=??o...
	defb 018h,0e0h,0f0h,0d0h,005h,0f0h,003h,0f8h,0a3h,0f0h,0e0h,0c0h,000h,000h,062h,0a7h	; 7f75  ..............b.
	defb 0e7h,0cfh,09dh,045h,05ch,068h,03dh,027h,037h,077h,0efh,0ffh,07fh,018h,020h,090h	; 7f85  ...E\h='7w.... .
	defb 030h,090h,0d0h,0b0h,0f0h,090h,0b8h,0d8h,0f8h,0f0h,0e0h,0c0h,009h,000h,089h,004h	; 7f95  0...............
	defb 00eh,00eh,01eh,01eh,037h,037h,03fh,037h,009h,000h,087h,030h,078h,0f8h,0fch,0f4h	; 7fa5  ....77?7...0x...
	defb 0eeh,0feh,007h,000h,089h,004h,00ah,00eh,012h,016h,02bh,02bh,02dh,02bh,009h,000h	; 7fb5  ..........++-+..
	defb 0c7h,030h,048h,0b8h,0cch,0ech,096h,0c6h,039h,03fh,03fh,03eh,07fh,0dfh,0beh,0bfh	; 7fc5  .0H.....9??>....
	defb 0ffh,0dfh,0ffh,067h,066h,03eh,01fh,001h,07eh,0feh,0fch,0fch,0feh,0ffh,07bh,07bh	; 7fd5  ...gf>..~.....{{
	defb 0fbh,0ffh,0fbh,0f7h,07eh,07ch,0f0h,080h,036h,037h,03fh,03fh,05eh,0bfh,0cfh,0ffh	; 7fe5  ....~|..67??^...
	defb 09fh,0beh,0dfh,07fh,07fh,03fh,01fh,001h,08eh,0eeh,0fch	; 7ff5  .....?.....
