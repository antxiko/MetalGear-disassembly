; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 09 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS fichas_juego_6_9E99_cola: 72 fichas de 8 x 8 en 3 planos (24 bytes por
;   ficha) del juego 6, desde la ficha 161 de la VRAM: p00:49C6 (L_524C) las
;   pasa a 4 bits por punto con la tabla de colores de 0xE700 (sigue del banco
;   8); lo leen p00:49C6 (1369 bytes)
;   0xa000..0xa559  (1369 bytes)
DATA_fichas_juego_6_9E99_cola:
	defb 0ffh,0c0h,0e0h,0c0h,000h,0c0h,000h,004h,004h,004h,00ch,00dh,00ch,000h,0e3h,000h,003h,0ffh,003h,0ffh,0feh,0feh,0ffh,0fch	; a000  ........................
	defb 0fch,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0ffh,07dh,07dh,0feh,07ah,07ah,0feh,078h,078h,0feh,0f8h,0f8h,0fah,0f8h,0f8h,0fah,078h	; a018  ........}}.zz.xx.......x
	defb 078h,0fch,001h,000h,0dch,0c5h,0c4h,003h,003h,003h,000h,030h,000h,000h,00fh,000h,080h,00eh,000h,000h,008h,000h,080h,003h	; a030  x..........0............
	defb 000h,000h,0f4h,000h,00eh,020h,000h,0f3h,0f8h,0f0h,000h,011h,000h,01bh,07ah,01ah,000h,0e1h,000h,000h,0c3h,000h,000h,087h	; a048  ..... ........z.........
	defb 000h,00ch,05ch,00ch,004h,0cch,004h,0f4h,00ch,004h,016h,0cch,004h,08bh,066h,002h,04bh,0e6h,042h,00bh,0e6h,002h,00bh,0e6h	; a060  ..\...........f.K.B.....
	defb 002h,0d8h,0c0h,0ffh,083h,0c1h,0ffh,0a3h,0c2h,0feh,0efh,0c7h,0ffh,0b8h,0b8h,0ffh,0b7h,090h,0d8h,0b7h,090h,0d8h,0b7h,090h	; a078  ........................
	defb 0d8h,0ffh,03fh,0ffh,0ffh,0feh,0feh,0afh,0afh,0ffh,0afh,0aeh,0feh,0dfh,0dfh,0dfh,0b9h,0f8h,0bah,0f7h,0deh,0d6h,0bfh,099h	; a090  ..?.....................
	defb 0d9h,0ffh,0c1h,0c1h,0ffh,007h,007h,0ffh,0f9h,0f9h,0ffh,046h,046h,0ffh,07dh,07dh,0ffh,01fh,01fh,0ffh,070h,070h,0e0h,080h	; a0a8  ...........FF.}}....pp..
	defb 080h,0fah,0f8h,0f8h,0feh,0c8h,0c8h,0feh,0d8h,0d8h,0feh,068h,068h,0feh,0d8h,0d8h,0feh,0e8h,0e8h,0ffh,078h,078h,07fh,00ch	; a0c0  ...........hh.......xx..
	defb 00ch,000h,006h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a0d8  ........................
	defb 000h,000h,00fh,000h,000h,01fh,000h,000h,03fh,000h,000h,07fh,000h,000h,07fh,000h,000h,07fh,000h,000h,01ch,000h,000h,000h	; a0f0  ........?...............
	defb 000h,00bh,0e7h,003h,00ah,0a2h,003h,00bh,0e2h,002h,00bh,0a3h,003h,016h,0a6h,007h,01fh,02eh,00eh,01fh,022h,00eh,03bh,052h	; a108  ...................."..R
	defb 01eh,0c7h,08fh,087h,08fh,09fh,088h,0c7h,0bfh,087h,0c0h,087h,0b8h,0b1h,0b1h,0fdh,0d9h,0e9h,0fdh,0bah,0c8h,0fch,0f7h,050h	; a120  .......................P
	defb 0f8h,01fh,0cch,00ch,08eh,0edh,08ch,066h,0e5h,064h,0d7h,0b6h,0f6h,08fh,07eh,0feh,0efh,07fh,0ffh,0fdh,09dh,0ffh,06fh,06fh	; a138  .......f.d....~.......oo
	defb 07fh,000h,000h,000h,080h,000h,000h,080h,000h,000h,070h,080h,000h,08fh,070h,000h,0c0h,00fh,000h,0e0h,000h,000h,0f8h,080h	; a150  ..........p...p.........
	defb 080h,000h,000h,000h,000h,000h,000h,000h,001h,0d8h,007h,000h,000h,0f8h,007h,000h,002h,0f1h,000h,00dh,003h,001h,033h,00eh	; a168  ......................3.
	defb 003h,033h,063h,03fh,076h,0a6h,03fh,0e6h,066h,07fh,02eh,0eeh,03fh,04eh,0ceh,07fh,0dch,09ch,0ffh,0b4h,034h,0bfh,074h,054h	; a180  .3c?v.?.f...?N......4.tT
	defb 0dfh,0ffh,0ffh,0ffh,0f0h,030h,0ffh,03fh,06ch,0fch,0afh,03bh,0ffh,06ah,02eh,0ffh,07fh,02eh,0fah,06fh,02eh,0fah,02fh,02eh	; a198  .....0.?l....j.....o../.
	defb 0feh,0ffh,001h,001h,081h,07fh,001h,081h,041h,03fh,087h,041h,039h,08bh,047h,033h,097h,04ch,024h,09dh,04ah,028h,092h,055h	; a1b0  ........A?.A9.G3.L$.J(.U
	defb 030h,0fdh,030h,0f0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fah,0fah,0ffh,0ffh,0ffh,0ffh,0fch,03ch,03fh,0feh,006h,007h,07fh,083h	; a1c8  0.0..............<?.....
	defb 003h,03fh,03fh,03fh,0f7h,0f6h,0f6h,03fh,03ah,0fah,0dfh,0dbh,0dbh,0dfh,0dbh,0dbh,0ffh,0dfh,0dfh,0feh,0deh,0dfh,0fah,0ebh	; a1e0  .???...?:...............
	defb 0eeh,0ffh,094h,094h,0ffh,0c0h,0c0h,0ffh,0e1h,0e1h,0ffh,0ffh,0ffh,04bh,04bh,0ffh,0ffh,0feh,0feh,006h,0f4h,005h,007h,0ddh	; a1f8  .............KK.........
	defb 005h,0deh,03ch,01fh,0f9h,0f1h,0fdh,073h,003h,0ffh,00fh,00fh,0afh,0ffh,0fbh,0fbh,0cfh,0cch,0fch,07fh,078h,0f8h,0ffh,0fch	; a210  ..<....s............x...
	defb 0fch,0ffh,0dfh,0dfh,07fh,05fh,05fh,0ffh,0dfh,0dfh,075h,054h,0dfh,0ffh,0dfh,0dfh,0ebh,02ah,02ah,0f7h,014h,014h,04fh,02ch	; a228  .....__...uT.....**...O,
	defb 00ch,03fh,03ah,0feh,0fch,0efh,0fch,0f0h,0f0h,0ffh,0e7h,020h,0f8h,0c8h,0c7h,0f0h,090h,048h,027h,090h,048h,027h,090h,048h	; a240  .?:........ .....H'.H'.H
	defb 027h,0ffh,000h,000h,080h,07fh,000h,080h,040h,03fh,087h,040h,038h,089h,047h,031h,092h,04ah,026h,095h,04ch,025h,09bh,048h	; a258  '.......@?.@8.G1.J&.L%.H
	defb 029h,0f0h,02eh,030h,0c8h,056h,048h,0f0h,04eh,040h,089h,0a4h,080h,007h,060h,000h,000h,0e0h,000h,000h,0c0h,000h,003h,0c0h	; a270  )..0.VH.N@....`.........
	defb 000h,03fh,081h,001h,07fh,001h,001h,0ffh,003h,003h,09fh,003h,003h,03ah,002h,006h,07dh,00dh,00dh,0feh,00eh,00fh,0feh,03ch	; a288  .?...........:..}......<
	defb 03fh,0ffh,0deh,0deh,07bh,052h,0d6h,0bfh,0afh,0afh,07bh,07bh,0fbh,0bfh,0bfh,0ffh,0ffh,0e8h,0e8h,0e0h,0c0h,0dfh,0ffh,0dfh	; a2a0  ?...{R....{{............
	defb 0dfh,09fh,007h,067h,00fh,007h,007h,0ffh,00eh,00fh,0fbh,0fah,0fbh,0ffh,0feh,0ffh,0ffh,017h,017h,007h,003h,0fbh,0ffh,0fbh	; a2b8  ...g....................
	defb 0fbh,0feh,086h,0ffh,087h,003h,0ffh,023h,031h,0ffh,07bh,0b5h,0ffh,073h,08dh,0ffh,086h,03ah,0ffh,0ffh,084h,0fch,0f8h,0c8h	; a2d0  .......#1.{..s...:......
	defb 0cfh,007h,074h,004h,002h,07bh,002h,00eh,072h,003h,091h,025h,001h,0e0h,006h,000h,000h,007h,000h,000h,003h,000h,0c0h,003h	; a2e8  ..t..{..r..%............
	defb 000h,0ffh,000h,000h,080h,07fh,000h,080h,040h,03fh,087h,040h,038h,088h,0c7h,0b0h,050h,048h,067h,0b0h,028h,0a7h,0d0h,018h	; a300  ........@?.@8...PHg.(...
	defb 097h,0ffh,008h,00eh,087h,07eh,007h,083h,043h,03fh,087h,040h,038h,088h,047h,030h,090h,048h,027h,090h,048h,027h,090h,048h	; a318  .....~..C?.@8.G0.H'.H'.H
	defb 027h,0e7h,000h,000h,0efh,001h,083h,07fh,003h,04fh,0ffh,0cfh,0ffh,0b9h,079h,03fh,097h,049h,021h,093h,048h,024h,093h,048h	; a330  '........O....y?.I!.H$.H
	defb 024h,0feh,078h,07fh,0f2h,0f0h,0ffh,0fch,0f8h,0ffh,0f2h,0b0h,0ffh,0fbh,04bh,0cfh,0ffh,05ch,0dfh,0f7h,0b4h,0ffh,0fdh,0d9h	; a348  $.x...........K..\......
	defb 0ffh,073h,060h,0f3h,07fh,05fh,0ffh,0f0h,0e7h,0f0h,0ffh,0efh,0ffh,038h,031h,0f8h,0efh,0efh,0efh,0efh,0adh,0edh,075h,075h	; a360  .s`.._.......81.......uu
	defb 0fdh,0ceh,006h,0cfh,0feh,0fah,0ffh,00fh,0e7h,00fh,0ffh,0f7h,0ffh,01ch,08ch,01fh,0f7h,0f7h,0f7h,0f7h,0b5h,0b7h,0beh,0beh	; a378  ........................
	defb 0bfh,07fh,01eh,0feh,04fh,00fh,0ffh,03fh,01eh,0feh,04fh,00dh,0ffh,0dbh,0dah,0ffh,0f7h,032h,0fbh,0f7h,035h,0ffh,0bfh,09ah	; a390  ....O..?..O......2..5...
	defb 0feh,0e7h,000h,000h,0f7h,080h,0c1h,0feh,0c0h,0f2h,0bfh,0b3h,0ffh,0bch,08fh,0cch,0b0h,088h,0c7h,090h,088h,0e7h,090h,088h	; a3a8  ........................
	defb 0e7h,0ffh,010h,070h,0e0h,07fh,0e0h,0c0h,0c0h,0ffh,087h,040h,038h,088h,047h,030h,090h,048h,027h,090h,048h,027h,090h,048h	; a3c0  ...p.......@8.G0.H'.H'.H
	defb 027h,0ffh,001h,001h,080h,07eh,001h,081h,040h,03eh,087h,043h,03bh,088h,044h,033h,093h,048h,024h,091h,048h,026h,091h,048h	; a3d8  '....~..@>.C..D3.H$.H&.H
	defb 026h,0ffh,0ebh,0efh,0bfh,0adh,0efh,0dfh,0cfh,0cfh,0dfh,0c0h,0c0h,0ffh,0f7h,0d6h,0beh,0adh,0ech,0a8h,0abh,0e8h,0a0h,0b6h	; a3f0  &.......................
	defb 0e0h,0ffh,0ffh,0ffh,0f0h,0d0h,0dfh,0ffh,008h,008h,0ffh,017h,01fh,0feh,092h,01fh,0fdh,09fh,01dh,0b7h,015h,01fh,0bbh,01eh	; a408  ........................
	defb 01ah,0ffh,0ffh,0ffh,08fh,08bh,0fbh,0bfh,090h,0d0h,0bfh,0a8h,0f8h,0ffh,0c9h,0f8h,0bfh,0f9h,0b8h,0fdh,0b8h,0f8h,0ddh,0f8h	; a420  ........................
	defb 0d8h,0ffh,0d7h,0f7h,0fch,0b4h,0f7h,0fbh,0f2h,0f2h,0fbh,003h,003h,0feh,0eeh,06bh,07fh,0b4h,034h,017h,0d4h,014h,007h,06ch	; a438  ...............k..4....l
	defb 004h,0ffh,001h,001h,080h,07ch,003h,083h,040h,03ch,09fh,047h,027h,0b8h,008h,04fh,0b7h,010h,058h,0b7h,050h,018h,097h,050h	; a450  .....|..@<.G'..O..X.P..P
	defb 038h,0e0h,0f8h,0e0h,0c0h,0e8h,0c0h,0c3h,0f8h,0c0h,0fch,0c0h,0c0h,081h,0f0h,080h,083h,0f1h,081h,0ffh,002h,0fbh,0ffh,0fah	; a468  8.......................
	defb 0ffh,0bfh,027h,02fh,0aeh,03ah,02fh,07bh,050h,07ch,0e7h,067h,07fh,028h,0e8h,03fh,0afh,0e8h,0b8h,097h,0d0h,098h,0d7h,050h	; a480  ..'/.:/{P|.g.(.?.......P
	defb 0d8h,0fdh,0e4h,0f4h,0f5h,0dch,0f4h,09eh,08ah,0feh,0a7h,0a6h,0feh,0b4h,097h,0dch,0b5h,097h,0ddh,0b9h,09bh,0d9h,0b3h,092h	; a498  ........................
	defb 0dbh,007h,01fh,007h,002h,016h,003h,0c3h,01eh,002h,03fh,003h,003h,081h,00fh,001h,0c1h,08fh,081h,0ffh,040h,0dfh,0ffh,05eh	; a4b0  ..........?.........@..^
	defb 0feh,0ffh,03ch,03fh,0beh,070h,03fh,0c8h,078h,04fh,084h,0c4h,08eh,007h,087h,01fh,0ffh,0f8h,0f8h,0b4h,010h,05bh,091h,049h	; a4c8  ..<?.p?.xO...........[.I
	defb 027h,0beh,0beh,0ffh,0ffh,07fh,0ffh,07fh,063h,07fh,0f1h,0c1h,0f5h,0f3h,0b3h,0f7h,0fbh,0dah,0fah,08fh,0eeh,09eh,00ch,0c8h	; a4e0  '.......c...............
	defb 03bh,07fh,07fh,07fh,080h,080h,0ffh,0bfh,080h,0c0h,0bfh,084h,0c4h,0b8h,087h,0c0h,0b0h,088h,0c7h,090h,0c8h,0a7h,090h,048h	; a4f8  .......................H
	defb 027h,0feh,0feh,0feh,080h,080h,0ffh,0bfh,080h,0c0h,0bfh,047h,007h,088h,048h,03fh,097h,048h,020h,091h,048h,026h,090h,048h	; a510  '..........G..H?.H .H&.H
	defb 027h,07dh,07dh,0ffh,0ffh,0feh,0ffh,0feh,0c6h,0feh,08fh,083h,0afh,0cfh,0cdh,0efh,0dfh,0dbh,0dfh,0f1h,0f7h,0f9h,0b0h,053h	; a528  '}}....................S
	defb 01ch,0ffh,03ch,0fch,07ch,00fh,0fch,012h,01eh,0f3h,021h,023h,071h,0e0h,0e1h,0f8h,0bfh,09fh,0dfh,0b6h,050h,019h,090h,0c8h	; a540  ..<.|.....!#q.......P...
	defb 0a7h	; a558

; ----------------------------------------------------------------------
; DATOS mapa_del_pozo: el dibujo del pozo como numeros de ficha, por filas:
;   0xFE baja una fila (8 puntos), 0xFF acaba; p00:51E2 (desde p00:4A8D) copia
;   cada ficha de la VRAM a la VRAM con L_519C; lo leen p00:4A8D (72 bytes)
;   0xa559..0xa5a1  (72 bytes)
DATA_mapa_del_pozo:
	defb 001h,009h,009h,009h,009h,009h,009h,005h,0feh,002h,009h,009h,009h,009h,009h,009h	; a559  ................
	defb 006h,0feh,003h,009h,009h,009h,00ah,009h,009h,007h,0feh,004h,009h,00ah,00ah,009h	; a569  ................
	defb 00ah,009h,008h,0feh,00bh,00dh,00dh,00dh,00dh,00dh,00dh,00ch,0feh,00bh,00dh,00dh	; a579  ................
	defb 00dh,00dh,00dh,00dh,00ch,0feh,00bh,00dh,00dh,00dh,00dh,00dh,00dh,00ch,0feh,00bh	; a589  ................
	defb 00dh,00dh,00dh,00dh,00dh,00dh,00ch,0ffh	; a599  ........

; ----------------------------------------------------------------------
; DATOS resto_del_pozo: 192 bytes detras del mapa del pozo (acaba en el 0xFF
;   de 0xA5A0) y delante de los dibujos del final: parecen dibujos de 1 bit
;   por punto (filas 0xFF, 0xC0, 0xFB...), pero ninguna instruccion de los 16
;   bancos nombra una direccion de 0xA5A1-0xA660 (grep en los listados) y
;   p00:4A87 solo lee el mapa de 0xA559. SIN LECTOR A LA VISTA: queda para una
;   lectura medida en openMSX
;   0xa5a1..0xa661  (192 bytes)
DATA_resto_del_pozo:
	defb 0ffh,088h,08ch,0fbh,08ch,0fbh,0ffh,0ffh,0ffh,0c0h,0c0h,0ffh,0c0h,0ffh,0ffh,0ffh	; a5a1  ................
	defb 0bfh,0e8h,06ch,0fbh,06ch,0fbh,07fh,0ffh,0bfh,0f0h,070h,0ffh,070h,0ffh,07fh,0ffh	; a5b1  ..l.l.....p.p...
	defb 0bfh,0f8h,07ch,0fbh,06ch,0fbh,06fh,0ffh,0bfh,0fch,07ch,0ffh,06ch,0ffh,06ch,0ffh	; a5c1  ..|.l.o...|.l.l.
	defb 0beh,0ffh,07eh,0ffh,06eh,0ffh,06eh,0ffh,0bfh,0ffh,07fh,0ffh,06fh,0ffh,06fh,0ffh	; a5d1  ..~.n.n.....o.o.
	defb 0ffh,009h,009h,0ffh,009h,0ffh,0ffh,0ffh,0ffh,082h,0c3h,0beh,0c3h,0beh,0ffh,0feh	; a5e1  ................
	defb 0fdh,00fh,00fh,0feh,00dh,0feh,0fdh,0feh,0ffh,08dh,08fh,0feh,08dh,0feh,0fdh,0feh	; a5f1  ................
	defb 0ffh,01dh,017h,0feh,01dh,0f6h,0fdh,0f6h,0ffh,0bdh,0f7h,0beh,0fdh,0b6h,0fdh,0f6h	; a601  ................
	defb 0dfh,07dh,057h,0feh,05dh,0f6h,0fdh,0f6h,0dfh,0fdh,0d7h,0feh,0ddh,0f6h,0fdh,0f6h	; a611  .}W.]...........
	defb 0ffh,008h,00ch,0fbh,00ch,0fbh,0ffh,0ffh,0ffh,080h,0c0h,0bfh,0c0h,0bfh,0ffh,0ffh	; a621  ................
	defb 0ffh,008h,00ch,0fbh,00ch,0fbh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a631  ................
	defb 0bfh,0ffh,07fh,0ffh,06fh,0ffh,06fh,0ffh,0bfh,0ffh,07fh,0ffh,06fh,0ffh,06fh,0ffh	; a641  ....o.o.....o.o.
	defb 0dfh,0fdh,0d7h,0feh,0ddh,0f6h,0fdh,0f6h,0dfh,0fdh,0d7h,0feh,0ddh,0f6h,0fdh,0f6h	; a651  ................

; ----------------------------------------------------------------------
; DATOS fichas_juego_7_A661: 42 fichas de 8 x 8 en 3 planos (24 bytes por
;   ficha) del juego 7, desde la ficha 1 de la VRAM: p00:49C6 (L_524C) las
;   pasa a 4 bits por punto con la tabla de colores de 0xE700; lo leen
;   p00:49C6 (1008 bytes)
;   0xa661..0xaa51  (1008 bytes)
DATA_fichas_juego_7_A661:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0e0h,0e0h,0ffh,0c0h,0c0h,0ffh,004h,004h,0ffh,0d1h,0d1h,0ffh,0c5h,0c5h,0ffh,018h,010h	; a661  ........................
	defb 0ffh,0f1h,0f1h,0ffh,000h,000h,0ffh,002h,002h,0ffh,016h,016h,0ffh,04bh,040h,0ffh,05ch,054h,0ffh,054h,044h,0ffh,011h,001h	; a679  .............K@.\T.TD...
	defb 0ffh,057h,057h,0ffh,009h,009h,0ffh,082h,082h,0ffh,004h,004h,0ffh,086h,006h,0ffh,0e4h,064h,0ffh,0a7h,0a7h,0ffh,02eh,02eh	; a691  .WW..............d......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,03fh,03fh,0ffh,007h,007h,0ffh,00bh,00bh,0ffh,0c2h,0c2h,0ffh,0f8h,0f8h,0ffh,0dah,0dah	; a6a9  .......??...............
	defb 0ffh,0e6h,0e6h,0ffh,0dfh,0dfh,0ffh,095h,095h,0ffh,0fah,0e0h,0ffh,0a1h,081h,0ffh,0c5h,0c5h,0ffh,017h,017h,0ffh,024h,024h	; a6c1  ......................$$
	defb 0ffh,0c9h,0c1h,0ffh,0d0h,0c0h,0ffh,0d9h,041h,0ffh,029h,000h,0ffh,0a3h,082h,0ffh,0e9h,080h,0ffh,043h,000h,0ffh,07fh,002h	; a6d9  ........A.)........C....
	defb 0ffh,0d8h,0c0h,0ffh,054h,054h,0ffh,0d0h,0d0h,0ffh,0c2h,0c2h,0ffh,0bch,0bch,0ffh,01ah,01ah,0ffh,019h,019h,0ffh,01dh,000h	; a6f1  ....TT..................
	defb 0ffh,03fh,03fh,0ffh,02ch,02ch,0ffh,03ah,03ah,0ffh,002h,002h,0ffh,0afh,02fh,0ffh,0b6h,0b6h,0ffh,0bfh,012h,0ffh,06fh,04ch	; a709  .??.,,.::...../.......oL
	defb 0ffh,0ffh,0dfh,0ffh,0fbh,0dbh,0ffh,0bah,08ah,0ffh,0e5h,0c5h,0ffh,0fbh,0fbh,0ffh,087h,003h,0ffh,068h,040h,0ffh,0f1h,011h	; a721  ...................h@...
	defb 0ffh,0efh,0efh,0ffh,079h,079h,0ffh,061h,041h,0ffh,089h,089h,0ffh,068h,068h,0ffh,0e5h,0e5h,0ffh,0f8h,0f8h,0ffh,065h,065h	; a739  ....yy.aA....hh.......ee
	defb 0ffh,03eh,03eh,0ffh,02dh,025h,0ffh,0dfh,082h,0ffh,08ch,004h,0ffh,0f8h,0a0h,0dbh,0d1h,0d1h,0dfh,0deh,0cch,0fdh,0f9h,0f9h	; a751  .>>.-%..................
	defb 0ffh,083h,080h,0feh,00ah,008h,0feh,000h,000h,0ffh,017h,016h,0ffh,09fh,000h,0ffh,0fdh,06ch,0ffh,0aeh,020h,0ffh,0fch,008h	; a769  .................l.. ...
	defb 0ffh,0f4h,0e4h,0ffh,0eah,068h,0ffh,05bh,010h,0ffh,0f8h,008h,0d0h,0d0h,000h,08bh,008h,000h,0feh,010h,000h,0ffh,067h,000h	; a781  .....h.[..............g.
	defb 0ffh,0d7h,095h,0ffh,0bch,038h,0ffh,047h,007h,027h,002h,000h,01eh,006h,000h,0f9h,019h,000h,018h,008h,000h,0deh,0c6h,000h	; a799  .....8.G.'..............
	defb 0ffh,0a6h,0a2h,0ffh,01ch,018h,0ffh,09ch,080h,0ffh,0beh,082h,0ffh,0dfh,002h,0ffh,0feh,000h,04fh,04ch,010h,06bh,00bh,000h	; a7b1  ..................OL.k..
	defb 0ffh,0c0h,0c0h,0ffh,0b7h,097h,0ffh,0d2h,0c2h,0ffh,0e1h,081h,0ffh,0a1h,001h,0dfh,08fh,007h,0dfh,05fh,007h,09fh,09fh,087h	; a7c9  ..................._....
	defb 0dfh,0dfh,0d6h,0ffh,0ffh,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a7e1  ........................
	defb 06fh,040h,000h,0bfh,090h,090h,0c7h,0c7h,006h,0ffh,0ffh,0ffh,0ffh,0f4h,0f4h,0ffh,0ffh,0feh,0ffh,0fch,0fch,0ffh,0eeh,0eeh	; a7f9  o@......................
	defb 0d1h,011h,000h,0f3h,033h,000h,0e0h,0e0h,00ah,041h,041h,016h,0c0h,041h,00fh,0c0h,045h,00fh,0c0h,043h,00fh,0c0h,043h,00bh	; a811  ....3....AA..A..E..C..C.
	defb 0c7h,0c1h,001h,017h,016h,000h,047h,047h,0a0h,003h,001h,080h,003h,003h,0a0h,013h,053h,0c0h,002h,0c2h,0c0h,001h,0c1h,0c0h	; a829  ......GG........S.......
	defb 0d0h,040h,000h,0c0h,000h,000h,0ffh,07fh,07fh,0ffh,07fh,079h,0ffh,07fh,07fh,0ffh,07fh,07fh,0ffh,07fh,07fh,0ffh,07fh,07fh	; a841  .@.........y............
	defb 07fh,07fh,017h,0ffh,0ffh,06fh,0ffh,0ffh,0dfh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a859  .....o..................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0e0h,0e0h,0ffh,0c0h,0c0h,0ffh,004h,004h,0ffh,0d1h,0d1h,0ffh,0c5h,0c5h,0f7h,010h,010h	; a871  ........................
	defb 0ffh,0f1h,0f1h,0ffh,000h,000h,0ffh,002h,002h,0ffh,016h,016h,0f4h,040h,040h,0f7h,054h,054h,0efh,044h,044h,0efh,001h,001h	; a889  .............@@.TT.DD...
	defb 0ffh,0e6h,0e6h,0ffh,0dfh,0dfh,0ffh,095h,095h,0e5h,0e0h,0e0h,0dfh,081h,081h,0ffh,0c5h,0c5h,0ffh,017h,017h,0ffh,024h,024h	; a8a1  ......................$$
	defb 0f7h,0c1h,0c1h,0efh,0c0h,0c0h,067h,041h,041h,0d6h,000h,000h,0deh,082h,082h,096h,080h,080h,0bch,000h,000h,082h,002h,002h	; a8b9  ......gAA...............
	defb 0e7h,0c0h,0c0h,0ffh,054h,054h,0ffh,0d0h,0d0h,0ffh,0c2h,0c2h,0ffh,0bch,0bch,0ffh,01ah,01ah,0ffh,019h,019h,0e2h,000h,000h	; a8d1  ....TT..................
	defb 0ffh,03fh,03fh,0ffh,02ch,02ch,0ffh,03ah,03ah,0ffh,002h,002h,07fh,02fh,02fh,0ffh,0b6h,0b6h,052h,012h,012h,0dch,04ch,04ch	; a8e9  .??.,,.::....//...R...LL
	defb 0dfh,0dfh,0dfh,0dfh,0dbh,0dbh,0cfh,08ah,08ah,0dfh,0c5h,0c5h,0ffh,0fbh,0fbh,07bh,003h,003h,0d7h,040h,040h,01fh,011h,011h	; a901  ...............{...@@...
	defb 0ffh,0efh,0efh,0ffh,079h,079h,0dfh,041h,041h,0ffh,089h,089h,0ffh,068h,068h,0ffh,0e5h,0e5h,0ffh,0f8h,0f8h,0ffh,065h,065h	; a919  ....yy.AA....hh.......ee
	defb 0ffh,03eh,03eh,0f7h,025h,025h,0a2h,082h,082h,077h,004h,004h,0a7h,0a0h,0a0h,0dbh,0d1h,0f5h,0cdh,0cch,0ech,0fdh,0f9h,0fbh	; a931  .>>.%%...w..............
	defb 0fch,080h,080h,0fch,008h,009h,0feh,000h,001h,0feh,016h,016h,060h,000h,000h,06eh,06ch,06ch,071h,020h,020h,00bh,008h,008h	; a949  ............`..nllq  ...
	defb 0efh,0e4h,0e4h,07dh,068h,068h,0b4h,010h,010h,00fh,008h,008h,000h,000h,02fh,083h,000h,074h,0eeh,000h,001h,098h,000h,000h	; a961  ...}hh......../..t......
	defb 0bdh,095h,095h,07bh,038h,038h,0bfh,007h,007h,025h,000h,0d8h,018h,000h,0e1h,0e0h,000h,006h,010h,000h,0e7h,018h,000h,021h	; a979  ...{88...%.............!
	defb 0fbh,0a2h,0a2h,0fbh,018h,018h,0e3h,080h,080h,0c3h,082h,082h,022h,002h,002h,001h,000h,000h,003h,000h,0a0h,060h,000h,094h	; a991  ............"........`..
	defb 0ffh,0c0h,0c0h,0dfh,097h,097h,0efh,0c2h,0c2h,09fh,081h,081h,05fh,001h,001h,057h,007h,027h,087h,007h,027h,087h,087h,0e7h	; a9a9  ............_..W.'..'...
	defb 0d6h,0d6h,0f6h,0fdh,0fdh,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a9c1  ........................
	defb 02fh,000h,090h,0bfh,090h,0d0h,006h,006h,03eh,0ffh,0ffh,0ffh,0ffh,0f4h,0f4h,0feh,0feh,0feh,0ffh,0fch,0fch,0ffh,0eeh,0eeh	; a9d9  /.......>...............
	defb 0c0h,000h,02eh,0c0h,000h,00ch,000h,000h,015h,000h,000h,0a8h,080h,001h,031h,080h,005h,035h,080h,003h,033h,080h,003h,037h	; a9f1  ..............1..5..3..7
	defb 007h,001h,039h,001h,000h,0e8h,000h,000h,018h,002h,000h,07ch,000h,000h,05ch,000h,040h,06ch,000h,0c0h,0fdh,000h,0c0h,0feh	; aa09  ..9........|..\.@l......
	defb 090h,000h,02fh,0c0h,000h,03fh,0ffh,07fh,07fh,0f9h,079h,079h,0ffh,07fh,07fh,0ffh,07fh,07fh,0ffh,07fh,07fh,0ffh,07fh,07fh	; aa21  ../..?....yy............
	defb 017h,017h,097h,06fh,06fh,06fh,0dfh,0dfh,0dfh,07fh,07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; aa39  ...ooo..................

; ----------------------------------------------------------------------
; DATOS fichas_juego_7_AA51: 14 fichas de 8 x 8 en 3 planos (24 bytes por
;   ficha) del juego 7, desde la ficha 160 de la VRAM: p00:49C6 (L_524C) las
;   pasa a 4 bits por punto con la tabla de colores de 0xE700; lo leen
;   p00:49C6 (336 bytes)
;   0xaa51..0xaba1  (336 bytes)
DATA_fichas_juego_7_AA51:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,048h,048h,0ffh	; aa51  .....................HH.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f0h,0f8h,0f8h,080h,080h,080h,003h,000h,000h,03fh,000h,01fh,0ffh	; aa69  ....................?...
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0fch,0ffh,0fch,0fch,0ffh,0e4h,0e4h,0ffh,0c8h,0c8h	; aa81  ........................
	defb 0ffh,0ffh,0ffh,0ffh,09eh,09eh,0ffh,0f0h,0f0h,0ffh,080h,080h,0ffh,000h,000h,0ffh,000h,000h,0ffh,010h,000h,0ffh,063h,000h	; aa99  ......................c.
	defb 0ffh,0d3h,0d0h,0ffh,0d8h,0c0h,0ffh,0f1h,0d0h,0ffh,0f0h,0f0h,0ffh,0f7h,0f0h,0ffh,0e3h,0e2h,0ffh,0e3h,0e0h,0ffh,0e3h,0e0h	; aab1  ........................
	defb 0ffh,083h,080h,0fbh,07bh,000h,0f7h,0f7h,000h,0dfh,09fh,000h,0e5h,0e5h,000h,0e8h,0e8h,000h,060h,060h,000h,0c0h,0c0h,000h	; aac9  ....{.............``....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0b3h,0b3h,0ffh	; aae1  ........................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,00fh,00fh,0ffh	; aaf9  ........................
	defb 0ffh,0e3h,0e0h,0ffh,0f3h,0f0h,0ffh,0f9h,0f8h,0ffh,0f8h,0f8h,0ffh,0fch,0fch,0ffh,0fch,0fch,0ffh,0fdh,0fch,000h,000h,0e4h	; ab11  ........................
	defb 0c0h,0c0h,007h,080h,080h,00fh,0c0h,0c1h,00fh,0c0h,0c3h,00fh,0c0h,0c3h,007h,080h,083h,007h,000h,007h,03fh,000h,01fh,0ffh	; ab29  ....................?...
	defb 0ffh,0fch,0fch,0ffh,0fch,0fch,0ffh,0f8h,0f8h,0ffh,0f8h,0f8h,0ffh,0fch,0fch,0ffh,0ffh,0f0h,001h,001h,000h,000h,000h,0e4h	; ab41  ........................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f8h,0f8h,0ffh,000h,000h,000h	; ab59  ........................
	defb 0ffh,0fch,0fch,0ffh,0fch,0fch,0ffh,0f8h,0f8h,0ffh,0f8h,0f8h,0ffh,0fch,0fch,0f0h,0f0h,0f0h,000h,000h,0feh,000h,000h,01bh	; ab71  ........................
	defb 000h,005h,035h,000h,007h,077h,000h,001h,031h,000h,003h,033h,000h,003h,03bh,000h,003h,07bh,000h,007h,0c7h,000h,01fh,01fh	; ab89  ..5..w..1..3.....{......

; ----------------------------------------------------------------------
; DATOS retrato_de_snake: 16 fichas en 3 planos (colores 0x4B2B) que p00:4BA0
;   vuelca en la VRAM 0xC040 (el retrato del transceptor); lo leen p00:4BA0
;   (384 bytes)
;   0xaba1..0xad21  (384 bytes)
DATA_retrato_de_snake:
	defb 0ffh,0ffh,000h,0ffh,0ffh,001h,0ffh,0ffh,003h,0ffh,0ffh,003h,0ffh,0ffh,007h,0ffh,0ffh,00fh,0ffh,0ffh,01eh,0ffh,0ffh,01eh	; aba1  ........................
	defb 0ffh,0ffh,03fh,0ffh,0fch,0f8h,0ffh,0ffh,0e3h,0ffh,0ffh,0ffh,0ffh,0eeh,0ceh,0ffh,0c4h,0c4h,0ffh,0ffh,0cfh,0ffh,0ffh,0f4h	; abb9  ..?.....................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0f3h,0ffh,0ffh,0f0h,0ffh,0ffh,0ffh,0ffh,0f9h,091h,0ffh,0ffh,091h,0ffh,0ffh,0c8h,0ffh,0ffh,036h	; abd1  .......................6
	defb 0ffh,0ffh,080h,0ffh,0ffh,0c0h,0ffh,0ffh,0e0h,0ffh,0ffh,060h,0ffh,0ffh,0e0h,0ffh,0ffh,0b0h,0ffh,0ffh,090h,0ffh,0ffh,050h	; abe9  ...........`...........P
	defb 0ffh,0ffh,01eh,0ffh,0ffh,00fh,0ffh,0ffh,00fh,0ffh,0ffh,00dh,0ffh,0ffh,009h,0ffh,0ffh,009h,0ffh,0ffh,005h,0ffh,0ffh,004h	; ac01  ........................
	defb 0ffh,0b2h,082h,091h,081h,001h,0dfh,01fh,000h,0ffh,09fh,08fh,0deh,0cch,0c7h,0d7h,0c0h,000h,0c2h,080h,000h,0c1h,080h,080h	; ac19  ........................
	defb 0ffh,01fh,017h,0cfh,00ah,003h,0efh,0c2h,083h,0feh,0e1h,041h,04fh,000h,081h,017h,000h,001h,027h,000h,001h,00fh,001h,002h	; ac31  ...........AO.....'.....
	defb 0ffh,0ffh,0f0h,07fh,03fh,030h,0ffh,01fh,008h,0dfh,0d7h,004h,0ffh,0dbh,012h,0ffh,09bh,092h,0ffh,0afh,08ch,0ffh,02fh,008h	; ac49  ....?0................/.
	defb 0ffh,0ffh,000h,0ffh,0ffh,001h,0ffh,0ffh,001h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,00eh,0f1h,0f1h,011h	; ac61  ........................
	defb 080h,080h,080h,038h,000h,000h,0fch,0f0h,000h,0f0h,0e0h,0c0h,0ffh,0f2h,05eh,0f0h,0e0h,040h,0fch,0f4h,024h,0f0h,0f0h,020h	; ac79  ...8..........^..@..$..
	defb 02fh,001h,002h,02fh,009h,002h,05eh,012h,004h,03eh,026h,008h,03eh,008h,010h,03eh,014h,020h,07eh,02ch,040h,0ffh,058h,080h	; ac91  /../..^..>&.>..>. ~,@.X.
	defb 0ffh,06fh,048h,07fh,07fh,068h,07fh,07fh,078h,03fh,03fh,03eh,01fh,011h,011h,00fh,00dh,009h,03fh,01fh,011h,07fh,03fh,020h	; aca9  .oH..h..x??>......?...?
	defb 0ffh,0eeh,020h,0dfh,0dfh,056h,0efh,0cfh,08fh,0bfh,027h,027h,0dfh,01fh,013h,0ffh,0efh,0cbh,0ffh,0bfh,027h,0ffh,0dfh,09ch	; acc1  .. ..V....''........'...
	defb 0fbh,081h,0f2h,0ffh,047h,03ch,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0ffh,0dfh,09fh,0ffh,09ch,01ch,0ffh,0b3h,030h,0ffh,0afh,02eh	; acd9  ....G<..............0...
	defb 0ffh,0f8h,000h,0ffh,0ffh,003h,0ffh,03fh,004h,0ffh,0beh,0b8h,0ffh,0fdh,0c9h,0ffh,0fbh,033h,0ffh,0f7h,046h,0ffh,0f3h,003h	; acf1  .......?.........3..F...
	defb 0ffh,07fh,059h,0ffh,0ffh,0c2h,0ffh,0ffh,007h,0ffh,0fch,00ch,0ffh,0f8h,078h,0ffh,0f0h,050h,0ffh,0f6h,0a6h,0ffh,0f8h,0c8h	; ad09  ..Y...........x..P......

; ----------------------------------------------------------------------
; DATOS retrato_de_snake_2: 3 fichas mas del retrato, en la VRAM 0xC440
;   (p00:4BAB); lo leen p00:4BAB (72 bytes)
;   0xad21..0xad69  (72 bytes)
DATA_retrato_de_snake_2:
	defb 0ffh,0b2h,082h,091h,081h,001h,0dfh,01fh,000h,0ffh,09fh,08fh,0dch,0cch,0c7h,0d7h,0c0h,000h,0c2h,080h,000h,0c1h,080h,080h	; ad21  ........................
	defb 0ffh,01fh,017h,0cfh,00ah,003h,0efh,0c2h,003h,0feh,0e1h,041h,0cfh,000h,081h,017h,000h,001h,027h,000h,001h,00fh,001h,002h	; ad39  ...........A......'.....
	defb 080h,080h,080h,038h,000h,000h,0fch,0b0h,000h,0f2h,0e0h,0c0h,0ffh,0deh,04eh,0ffh,0feh,040h,0f8h,0e0h,040h,0fch,0f4h,024h	; ad51  ...8..........N..@..@..$

; ======================================================================
; CODIGO 0xad69..0xae5f  (246 bytes)
; ======================================================================


L_AD69:
	ld a,(0c196h)		;ad69
	ld b,a			;ad6c
	djnz L_AD85		;ad6d
	xor a			;ad6f
	ld (0c151h),a		;ad70
	ld a,(0c007h)		;ad73
	and 00ch		;ad76
	jr z,L_AD81		;ad78
	and 004h		;ad7a
	ld a,003h		;ad7c
	jr z,L_AD81		;ad7e
	inc a			;ad80
L_AD81:
	ld (0c18ch),a		;ad81
	ret			;ad84
L_AD85:
	djnz L_AD93		;ad85
	ld a,(0c195h)		;ad87
	ld (0c133h),a		;ad8a
	ld a,001h		;ad8d
	ld (0c151h),a		;ad8f
	ret			;ad92
L_AD93:
	call 040b9h		;ad93
	ld a,(0c130h)		;ad96
	ld b,a			;ad99
	ld a,(0c007h)		;ad9a
	ld d,a			;ad9d
	ld a,(0c195h)		;ad9e
	ld hl,0c193h		;ada1
	dec a			;ada4
	jr nz,L_ADE2		;ada5
	ld a,(0c182h)		;ada7
	dec a			;adaa
	ld (0c182h),a		;adab
	dec (hl)			;adae
	ld a,(hl)			;adaf
	cp 018h		;adb0
	jr c,L_AE23		;adb2
	ld c,a			;adb4
	ld a,(0c130h)		;adb5
	ld b,a			;adb8
	cp 0f8h		;adb9
	jr z,L_ADC5		;adbb
	cp 0f9h		;adbd
	jr z,L_ADC5		;adbf
	cp 0fah		;adc1
	jr nz,L_ADC9		;adc3
L_ADC5:
	ld a,d			;adc5
	rra			;adc6
	jr c,L_AE28		;adc7
L_ADC9:
	ld a,c			;adc9
	cp 038h		;adca
	jr z,L_AE1B		;adcc
	ld a,b			;adce
	cp 0f7h		;adcf
	jr nz,L_ADD7		;add1
	ld a,d			;add3
	rra			;add4
	jr c,L_AE28		;add5
L_ADD7:
	ld a,c			;add7
	cp 078h		;add8
	jr z,L_AE1B		;adda
	cp 0b8h		;addc
	jr z,L_AE1B		;adde
	jr L_AE28		;ade0
L_ADE2:
	ld a,(0c182h)		;ade2
	inc a			;ade5
	ld (0c182h),a		;ade6
	inc (hl)			;ade9
	ld a,(hl)			;adea
	cp 0d0h		;adeb
	jr nc,L_AE23		;aded
	ld c,a			;adef
	ld a,b			;adf0
	cp 0f7h		;adf1
	jr z,L_ADFD		;adf3
	cp 0f8h		;adf5
	jr z,L_ADFD		;adf7
	cp 0f9h		;adf9
	jr nz,L_AE02		;adfb
L_ADFD:
	ld a,d			;adfd
	and 002h		;adfe
	jr nz,L_AE28		;ae00
L_AE02:
	ld a,c			;ae02
	cp 0b8h		;ae03
	jr z,L_AE1B		;ae05
	ld a,b			;ae07
	cp 0fah		;ae08
	jr nz,L_AE10		;ae0a
	ld a,d			;ae0c
	rra			;ae0d
	jr c,L_AE28		;ae0e
L_AE10:
	ld a,c			;ae10
	cp 078h		;ae11
	jr z,L_AE1B		;ae13
	cp 038h		;ae15
	jr z,L_AE1B		;ae17
	jr L_AE28		;ae19
L_AE1B:
	call L_AE28		;ae1b
L_AE1E:
	ld hl,0c196h		;ae1e
	inc (hl)			;ae21
	ret			;ae22
L_AE23:
	call L_AE1E		;ae23
	inc (hl)			;ae26
	ret			;ae27
L_AE28:
	ld hl,0ae5fh		;ae28
	ld de,0ea50h		;ae2b
	ld bc,00cffh		;ae2e
L_AE31:
	ld a,(0c193h)		;ae31
	add a,(hl)			;ae34
	ld (de),a			;ae35
	inc hl			;ae36
	inc e			;ae37
	ld a,(0c194h)		;ae38
	add a,(hl)			;ae3b
	ld (de),a			;ae3c
	inc hl			;ae3d
	inc e			;ae3e
	ldi		;ae3f
	inc hl			;ae41
	inc e			;ae42
	djnz L_AE31		;ae43
	ld de,0e940h		;ae45
	ld hl,0ae5fh		;ae48
	ld c,00ch		;ae4b
	inc hl			;ae4d
	inc hl			;ae4e
	inc hl			;ae4f
L_AE50:
	ld a,(hl)			;ae50
	ld b,010h		;ae51
L_AE53:
	ld (de),a			;ae53
	inc de			;ae54
	djnz L_AE53		;ae55
	inc hl			;ae57
	inc hl			;ae58
	inc hl			;ae59
	inc hl			;ae5a
	dec c			;ae5b
	jr nz,L_AE50		;ae5c
	ret			;ae5e

; ----------------------------------------------------------------------
; DATOS sprites_del_ascensor: 12 fichas de 4 bytes [y][x][patron][color] que
;   p09:AE31 pone en 0xEA50 sumando la posicion (0xC193/0xC194), y p09:AE50
;   copia el color 16 veces a 0xE940; lo leen p09:AE28 (48 bytes)
;   0xae5f..0xae8f  (48 bytes)
DATA_sprites_del_ascensor:
	defb 0d0h,0f8h,038h,00ch	; ae5f
	defb 0d0h,0f8h,03ch,04bh	; ae63
	defb 0e0h,0f0h,040h,002h	; ae67
	defb 0e0h,0f0h,044h,04dh	; ae6b
	defb 0e0h,000h,048h,002h	; ae6f
	defb 0e0h,000h,04ch,04dh	; ae73
	defb 0f0h,0f0h,050h,002h	; ae77
	defb 0f0h,0f0h,054h,04dh	; ae7b
	defb 0f0h,000h,058h,002h	; ae7f
	defb 0f0h,000h,05ch,04dh	; ae83
	defb 000h,0f8h,060h,00ch	; ae87
	defb 000h,0f8h,064h,04bh	; ae8b

; ======================================================================
; CODIGO 0xae8f..0xae98  (9 bytes)
; ======================================================================


L_AE8F:
	ld a,(0c920h)		;ae8f
	ld hl,0ae98h		;ae92
	jp L_B50C		;ae95

; ----------------------------------------------------------------------
; DATOS saltos_de_la_intro: 13 direcciones de codigo del banco 9, una por paso
;   de la intro (0xC920): p09:AE92 las recorre con L_B50C (`jp (hl)`); lo leen
;   p09:AE92 (26 bytes)
;   0xae98..0xaeb2  (26 bytes)
DATA_saltos_de_la_intro:
	defw 0aeb2h,0aedah,0aefbh,0af14h,0af3bh,0af69h,0af73h,0af80h,0af95h,0afbbh,0afe9h,0b018h,0b043h	; ae98

; ======================================================================
; CODIGO 0xaeb2..0xb050  (414 bytes)
; ======================================================================


L_AEB2:
	ld hl,0c921h		;aeb2
	dec (hl)			;aeb5
	jr z,L_AEC9		;aeb6
	xor a			;aeb8
	ld (0c006h),a		;aeb9
	ld a,003h		;aebc
	ld (0c185h),a		;aebe
	ld a,004h		;aec1
	ld (0c007h),a		;aec3
	jp L_AFA8		;aec6
L_AEC9:
	ld a,002h		;aec9
	ld (0c18bh),a		;aecb
	dec a			;aece
	ld (0c185h),a		;aecf
	ld a,030h		;aed2
	ld (0c921h),a		;aed4
	jp L_AF8E		;aed7
L_AEDA:
	ld hl,0c921h		;aeda
	dec (hl)			;aedd
	jr z,L_AEEA		;aede
	xor a			;aee0
	ld (0c006h),a		;aee1
	ld (0c007h),a		;aee4
	jp L_AFA8		;aee7
L_AEEA:
	ld a,050h		;aeea
	ld (0c921h),a		;aeec
	ld a,004h		;aeef
	ld (0c18bh),a		;aef1
	dec a			;aef4
	ld (0c185h),a		;aef5
	jp L_AF8E		;aef8
L_AEFB:
	ld hl,0c921h		;aefb
	dec (hl)			;aefe
	jr z,L_AF0D		;aeff
	xor a			;af01
	ld (0c006h),a		;af02
	ld a,004h		;af05
	ld (0c007h),a		;af07
	jp L_AFA8		;af0a
L_AF0D:
	ld a,020h		;af0d
	ld (0c921h),a		;af0f
	jr L_AF8E		;af12
L_AF14:
	ld hl,0c921h		;af14
	dec (hl)			;af17
	jr z,L_AF2A		;af18
	xor a			;af1a
	ld (0c006h),a		;af1b
	ld a,001h		;af1e
	ld (0c185h),a		;af20
	ld a,001h		;af23
	ld (0c007h),a		;af25
	jr L_AFA8		;af28
L_AF2A:
	ld a,002h		;af2a
	ld (0c18bh),a		;af2c
	ld a,004h		;af2f
	ld (0c185h),a		;af31
	ld a,040h		;af34
	ld (0c921h),a		;af36
	jr L_AF8E		;af39
L_AF3B:
	ld hl,0c921h		;af3b
	dec (hl)			;af3e
	jr z,L_AF4E		;af3f
	ld a,(hl)			;af41
	sub 020h		;af42
	ret nz			;af44
	inc a			;af45
	ld (0c15fh),a		;af46
	ld a,022h		;af49
	jp 0405ah		;af4b
L_AF4E:
	ld a,001h		;af4e
	ld (0c0f1h),a		;af50
	ld a,059h		;af53
	call 0405ah		;af55
	call 0407dh		;af58
	ld a,010h		;af5b
	ld (0c802h),a		;af5d
	xor a			;af60
	ld (0c801h),a		;af61
	ld (0c153h),a		;af64
	jr L_AF8E		;af67
L_AF69:
	call 04082h		;af69
	ld a,(0c153h)		;af6c
	dec a			;af6f
	ret nz			;af70
	jr L_AF8E		;af71
L_AF73:
	call L_AF8E		;af73
	ld a,05ch		;af76
	call 0405ah		;af78
	ld a,002h		;af7b
	jp 0405fh		;af7d
L_AF80:
	call 04087h		;af80
	ld a,028h		;af83
	ld (0c921h),a		;af85
	ld hl,00200h		;af88
	ld (0c143h),hl		;af8b
L_AF8E:
	ld hl,0c920h		;af8e
	inc (hl)			;af91
	jp 04078h		;af92
L_AF95:
	ld hl,0c921h		;af95
	dec (hl)			;af98
	jr z,L_AFB4		;af99
	xor a			;af9b
	ld (0c006h),a		;af9c
	ld a,004h		;af9f
	ld (0c185h),a		;afa1
	rlca			;afa4
	ld (0c007h),a		;afa5
L_AFA8:
	call 04064h		;afa8
	call 0406eh		;afab
L_AFAE:
	call 04073h		;afae
	jp 04078h		;afb1
L_AFB4:
	ld a,030h		;afb4
	ld (0c921h),a		;afb6
	jr L_AF8E		;afb9
L_AFBB:
	ld hl,0c921h		;afbb
	dec (hl)			;afbe
	jr z,L_AFCE		;afbf
	xor a			;afc1
	ld (0c006h),a		;afc2
	inc a			;afc5
	ld (0c185h),a		;afc6
	ld (0c007h),a		;afc9
	jr L_AFA8		;afcc
L_AFCE:
	ld hl,08800h		;afce
	ld (0c181h),hl		;afd1
	ld h,001h		;afd4
	ld (0c143h),hl		;afd6
	ld a,h			;afd9
	ld (0c185h),a		;afda
	ld a,005h		;afdd
	ld (0c18bh),a		;afdf
	ld a,01ch		;afe2
	ld (0c921h),a		;afe4
	jr L_AF8E		;afe7
L_AFE9:
	ld hl,0c921h		;afe9
	dec (hl)			;afec
	jr z,L_AFFF		;afed
	xor a			;afef
	ld (0c006h),a		;aff0
	inc a			;aff3
	ld (0c185h),a		;aff4
	ld (0c007h),a		;aff7
	call 04069h		;affa
	jr L_AFAE		;affd
L_AFFF:
	ld hl,06600h		;afff
	ld (0c181h),hl		;b002
	xor a			;b005
	ld (0c18bh),a		;b006
	inc a			;b009
	ld (0c185h),a		;b00a
	ld (0c18eh),a		;b00d
	ld a,00ch		;b010
	ld (0c921h),a		;b012
	jp L_AF8E		;b015
L_B018:
	ld hl,0c921h		;b018
	dec (hl)			;b01b
	jp z,L_AF8E		;b01c
	xor a			;b01f
	ld (0c007h),a		;b020
	ld (0c006h),a		;b023
	inc a			;b026
	ld (0c185h),a		;b027
	ld a,(hl)			;b02a
	bit 0,a		;b02b
	jp z,04078h		;b02d
	ld hl,0b050h		;b030
	call 04050h		;b033
	ld d,(hl)			;b036
	ld e,000h		;b037
	ld hl,(0c181h)		;b039
	add hl,de			;b03c
	ld (0c181h),hl		;b03d
	jp 04078h		;b040
L_B043:
	xor a			;b043
	ld (0c180h),a		;b044
	ld hl,00200h		;b047
	ld (0c143h),hl		;b04a
	jp 04078h		;b04d

; ----------------------------------------------------------------------
; DATOS pasos_de_la_intro_b050: 12 bytes, uno por paso de la intro (0xC920),
;   que p09:B030 lee en 0xB050 + A y suma como parte alta a 0xC181 (el
;   desplazamiento de la pantalla en cada paso)
;   0xb050..0xb05c  (12 bytes)
DATA_pasos_de_la_intro_b050:
	defb 002h,001h,000h,0feh,0feh,0feh,0fdh,0fbh,0f9h,0fbh,0fdh,0feh	; b050  ............

; ======================================================================
; CODIGO 0xb05c..0xb0ae  (82 bytes)
; ======================================================================


L_B05C:
	ld a,001h		;b05c
	ld (0faf6h),a		;b05e
	call L_B0A3		;b061
	ld de,00040h		;b064
	ld hl,0b0b2h		;b067
	ld bc,06c0eh		;b06a
	call 0408ch		;b06d
	ld de,09858h		;b070
	ld hl,0b412h		;b073
	ld bc,00d08h		;b076
	call 0408ch		;b079
	ld de,05840h		;b07c
	ld hl,0b10ah		;b07f
	ld bc,00106h		;b082
	call 0408ch		;b085
	ld hl,0b0aeh		;b088
	ld de,0e700h		;b08b
	ld bc,00004h		;b08e
	ldir		;b091
	ld hl,0b47ah		;b093
	ld de,0ac30h		;b096
	ld b,006h		;b099
	call 04091h		;b09b
	xor a			;b09e
	ld (0faf6h),a		;b09f
	ret			;b0a2
L_B0A3:
	xor a			;b0a3
	ld h,a			;b0a4
	ld l,a			;b0a5
	ld bc,01808h		;b0a6
	ld d,001h		;b0a9
	jp 04096h		;b0ab

; ----------------------------------------------------------------------
; DATOS colores_de_la_fuente: 4 bytes que p09:B088 copia a 0xE700: la tabla de
;   colores de los caracteres; lo leen p09:B088 (4 bytes)
;   0xb0ae..0xb0b2  (4 bytes)
DATA_colores_de_la_fuente:
	defb 006h,008h,00eh,00fh	; b0ae

; ----------------------------------------------------------------------
; DATOS fuente: 108 caracteres de 1 bit por punto (8 bytes) que p09:B06D pinta
;   con L_505D en la VRAM 0x0040 con el color 0xE; lo leen p09:B06D (864
;   bytes)
;   0xb0b2..0xb412  (864 bytes)
DATA_fuente:
	defb 000h,028h,06ch,0c6h,0c6h,0c6h,06ch,028h	; b0b2  .(l...l(
	defb 000h,018h,038h,018h,018h,018h,018h,07ah	; b0ba  ..8....z
	defb 000h,06ch,0c6h,006h,00ch,028h,060h,0eeh	; b0c2  .l...(`.
	defb 000h,06eh,00ch,008h,02ch,006h,0c6h,06ch	; b0ca  .n..,..l
	defb 000h,00ch,02ch,06ch,0cch,0eeh,00ch,00ch	; b0d2  ..,l....
	defb 000h,0eeh,0c0h,0ech,006h,006h,0c6h,06ch	; b0da  .......l
	defb 000h,02eh,060h,0c0h,0ech,0c6h,0c6h,06ch	; b0e2  ..`....l
	defb 000h,0f6h,086h,084h,010h,030h,030h,030h	; b0ea  .....000
	defb 000h,068h,0c4h,0e4h,068h,08eh,086h,06ch	; b0f2  .h..h..l
	defb 000h,06ch,0c6h,0c6h,06eh,006h,00ch,068h	; b0fa  .l..n..h
	defb 03ch,042h,099h,0a1h,0a1h,099h,042h,03ch	; b102  <B....B<
	defb 000h,018h,018h,0ffh,07eh,03ch,03ch,066h	; b10a  ....~<<f
	defb 000h,008h,00ch,07eh,07fh,07eh,00ch,008h	; b112  ...~.~..
	defb 000h,018h,018h,018h,018h,018h,000h,018h	; b11a  ........
	defb 000h,06ch,06ch,06ch,06ch,06ch,000h,06ch	; b122  .lllll.l
	defb 000h,006h,006h,026h,066h,0fch,060h,020h	; b12a  ...&f.`
	defb 000h,000h,000h,000h,03ch,000h,000h,000h	; b132  ....<...
	defb 000h,030h,074h,0c6h,0c6h,0f6h,0c6h,0c6h	; b13a  .0t.....
	defb 000h,0dch,0c6h,0c6h,0dch,0c6h,0c6h,0dch	; b142  ........
	defb 000h,02ch,066h,0c0h,0c0h,0c0h,066h,02ch	; b14a  .,f...f,
	defb 000h,0d8h,0cch,0c6h,0c6h,0c6h,0cch,0d8h	; b152  ........
	defb 000h,06eh,060h,060h,06ch,060h,060h,06eh	; b15a  .n``l``n
	defb 000h,06eh,060h,060h,06ch,060h,060h,060h	; b162  .n``l```
	defb 000h,02eh,060h,0c0h,0ceh,0c6h,066h,02eh	; b16a  ..`...f.
	defb 000h,0c6h,0c6h,0c6h,0f6h,0c6h,0c6h,0c6h	; b172  ........
	defb 000h,03ah,018h,018h,018h,018h,018h,03ah	; b17a  .:.....:
	defb 000h,00eh,00eh,00eh,00eh,00eh,08eh,06ch	; b182  .......l
	defb 000h,0c6h,0cch,0d8h,0d0h,0d8h,0dch,0ceh	; b18a  ........
	defb 000h,060h,060h,060h,060h,060h,060h,06eh	; b192  .``````n
	defb 000h,0c6h,0eeh,0feh,0feh,0d6h,0c6h,0c6h	; b19a  ........
	defb 000h,0c6h,0e6h,076h,0bah,0dch,0ceh,0c6h	; b1a2  ...v....
	defb 000h,06ch,0c6h,0c6h,0c6h,0c6h,0c6h,06ch	; b1aa  .l.....l
	defb 000h,0dch,0c6h,0c6h,0c6h,0dch,0c0h,0c0h	; b1b2  ........
	defb 000h,07ch,0c6h,0c6h,0c6h,0dah,0cch,07ah	; b1ba  .|.....z
	defb 000h,0dch,0c6h,0c6h,0cch,0d8h,0dch,0ceh	; b1c2  ........
	defb 000h,06ch,0c6h,0c0h,06ch,006h,0c6h,06ch	; b1ca  .l..l..l
	defb 000h,07ah,018h,018h,018h,018h,018h,018h	; b1d2  .z......
	defb 000h,0c6h,0c6h,0c6h,0c6h,0c6h,0c6h,074h	; b1da  .......t
	defb 000h,0c6h,0c6h,0c6h,0c6h,06ch,038h,010h	; b1e2  .....l8.
	defb 000h,0d6h,0d6h,0feh,0feh,0eeh,0c6h,082h	; b1ea  ........
	defb 000h,0c6h,0eeh,074h,038h,05ch,0eeh,0c6h	; b1f2  ...t8\..
	defb 000h,066h,066h,066h,03ch,018h,018h,018h	; b1fa  .fff<...
	defb 000h,0f6h,00eh,01ch,038h,070h,0e0h,0deh	; b202  ....8p..
	defb 000h,03ch,066h,006h,00ch,010h,000h,018h	; b20a  .<f.....
	defb 000h,000h,000h,000h,000h,000h,018h,018h	; b212  ........
	defb 000h,000h,000h,000h,000h,020h,050h,020h	; b21a  ..... P
	defb 000h,000h,000h,000h,000h,000h,040h,020h	; b222  ......@
	defb 000h,000h,000h,000h,000h,030h,010h,020h	; b22a  .....0.
	defb 000h,07fh,009h,009h,00eh,008h,008h,030h	; b232  .......0
	defb 000h,003h,01ch,068h,008h,008h,008h,008h	; b23a  ...h....
	defb 000h,008h,07fh,041h,041h,001h,002h,01ch	; b242  ...AA...
	defb 000h,07fh,008h,008h,008h,008h,008h,07fh	; b24a  ........
	defb 000h,004h,07fh,004h,00ch,014h,014h,064h	; b252  .......d
	defb 000h,010h,07fh,011h,011h,011h,011h,062h	; b25a  .......b
	defb 000h,010h,07fh,008h,008h,07fh,004h,004h	; b262  ........
	defb 000h,03fh,021h,041h,001h,001h,006h,038h	; b26a  .?!A...8
	defb 000h,020h,03fh,022h,042h,002h,004h,018h	; b272  . ?"B...
	defb 000h,07fh,001h,001h,001h,001h,001h,07fh	; b27a  ........
	defb 000h,022h,07fh,022h,022h,022h,002h,01ch	; b282  ."."""..
	defb 000h,070h,001h,071h,001h,001h,002h,07ch	; b28a  .p.q...|
	defb 000h,07fh,001h,001h,002h,004h,01ah,061h	; b292  .......a
	defb 000h,020h,07fh,021h,021h,022h,020h,01fh	; b29a  . .!!" .
	defb 000h,041h,041h,041h,021h,001h,002h,03ch	; b2a2  .AAA!..<
	defb 000h,03fh,021h,059h,007h,001h,006h,038h	; b2aa  .?!Y...8
	defb 000h,03fh,004h,07fh,004h,004h,008h,030h	; b2b2  .?.....0
	defb 000h,051h,051h,051h,001h,002h,002h,03ch	; b2ba  .QQQ...<
	defb 000h,07fh,000h,07fh,004h,004h,004h,038h	; b2c2  .......8
	defb 000h,020h,020h,03ch,023h,020h,020h,020h	; b2ca  .  <#
	defb 000h,004h,07fh,004h,004h,004h,008h,070h	; b2d2  .......p
	defb 000h,000h,03eh,000h,000h,000h,000h,07fh	; b2da  ..>.....
	defb 000h,07fh,001h,011h,009h,006h,006h,079h	; b2e2  .......y
	defb 000h,008h,07fh,001h,001h,03eh,049h,008h	; b2ea  .....>I.
	defb 000h,001h,001h,002h,002h,004h,008h,030h	; b2f2  .......0
	defb 000h,022h,021h,021h,021h,021h,021h,041h	; b2fa  ."!!!!!A
	defb 000h,040h,07eh,040h,040h,040h,040h,03fh	; b302  .@~@@@@?
	defb 000h,07fh,001h,001h,001h,001h,002h,03ch	; b30a  .......<
	defb 000h,010h,028h,044h,044h,002h,002h,001h	; b312  ..(DD...
	defb 000h,008h,07fh,008h,02ah,02ah,04ah,049h	; b31a  ....**JI
	defb 000h,07fh,001h,001h,021h,016h,008h,004h	; b322  ....!...
	defb 000h,07eh,000h,000h,07eh,000h,000h,07eh	; b32a  .~..~..~
	defb 000h,010h,020h,020h,042h,041h,041h,07fh	; b332  ..  BAA.
	defb 000h,001h,001h,012h,00ah,004h,00ah,031h	; b33a  .......1
	defb 000h,07fh,010h,010h,07fh,010h,010h,00fh	; b342  ........
	defb 000h,020h,07fh,021h,021h,026h,020h,020h	; b34a  . .!!&
	defb 000h,03eh,002h,002h,002h,002h,002h,07fh	; b352  .>......
	defb 000h,07fh,001h,001h,07fh,001h,001h,07fh	; b35a  ........
	defb 000h,07fh,000h,07fh,001h,001h,001h,03eh	; b362  .......>
	defb 000h,041h,041h,041h,041h,001h,006h,038h	; b36a  .AAAA..8
	defb 000h,028h,028h,028h,029h,029h,049h,04eh	; b372  .((())IN
	defb 000h,020h,020h,020h,021h,021h,022h,03ch	; b37a  .   !!"<
	defb 000h,07fh,041h,041h,041h,041h,041h,07fh	; b382  ..AAAAA.
	defb 000h,07fh,041h,041h,001h,001h,002h,03ch	; b38a  ..AA...<
	defb 000h,07fh,001h,001h,07fh,001h,002h,03ch	; b392  .......<
	defb 000h,071h,001h,001h,001h,001h,002h,07ch	; b39a  .q.....|
	defb 000h,000h,000h,01fh,001h,005h,004h,018h	; b3a2  ........
	defb 000h,000h,000h,001h,007h,01ch,004h,004h	; b3aa  ........
	defb 000h,000h,000h,004h,01fh,011h,001h,006h	; b3b2  ........
	defb 000h,000h,000h,000h,00fh,002h,002h,00fh	; b3ba  ........
	defb 000h,000h,000h,002h,01fh,006h,00ah,012h	; b3c2  ........
	defb 000h,000h,000h,015h,015h,015h,001h,006h	; b3ca  ........
	defb 000h,000h,000h,008h,01fh,009h,00ah,008h	; b3d2  ........
	defb 000h,000h,000h,000h,01eh,002h,002h,01fh	; b3da  ........
	defb 000h,000h,000h,00fh,001h,00fh,001h,00fh	; b3e2  ........
	defb 0c0h,040h,080h,000h,000h,000h,000h,000h	; b3ea  .@......
	defb 040h,020h,080h,040h,000h,000h,000h,000h	; b3f2  @ .@....
	defb 000h,008h,018h,03fh,07fh,03fh,018h,008h	; b3fa  ...?.?..
	defb 000h,008h,01ch,03eh,07fh,01ch,01ch,01ch	; b402  ...>....
	defb 000h,01ch,01ch,01ch,07fh,03eh,01ch,008h	; b40a  .....>..

; ----------------------------------------------------------------------
; DATOS fuente_2: 13 caracteres mas de 1 bit por punto, en la VRAM 0x9858
;   (p09:B079); lo leen p09:B079 (104 bytes)
;   0xb412..0xb47a  (104 bytes)
DATA_fuente_2:
	defb 000h,000h,000h,000h,000h,018h,018h,000h	; b412  ........
	defb 07ch,0bah,0c6h,0c6h,0c6h,0c6h,0c6h,0c6h	; b41a  |.......
	defb 0c6h,0c6h,0c6h,0c6h,0c6h,0bah,07ch,000h	; b422  ......|.
	defb 000h,002h,006h,006h,006h,006h,006h,006h	; b42a  ........
	defb 006h,006h,006h,006h,006h,002h,000h,000h	; b432  ........
	defb 07ch,03ah,006h,006h,006h,006h,07eh,0bch	; b43a  |:....~.
	defb 0c0h,0c0h,0c0h,0c0h,0c0h,0b8h,07ch,000h	; b442  ......|.
	defb 07ch,03ah,006h,006h,006h,006h,03eh,03eh	; b44a  |:....>>
	defb 006h,006h,006h,006h,006h,03ah,07ch,000h	; b452  .....:|.
	defb 000h,082h,0c6h,0c6h,0c6h,0c6h,07eh,07eh	; b45a  ......~~
	defb 07eh,0bch,0c0h,0c0h,0c0h,0c0h,07ch,07ch	; b462  ~.....||
	defb 07ch,0bah,0c6h,0c6h,0c6h,0c6h,086h,006h	; b46a  |.......
	defb 07ch,0bah,0c6h,0c6h,0c6h,0c6h,07ch,07ch	; b472  |.....||

; ----------------------------------------------------------------------
; DATOS fichas_b47a: 6 fichas en 2 planos (16 bytes) que p09:B09B vuelca con
;   L_51FE en la VRAM 0xAC30; lo leen p09:B09B (96 bytes)
;   0xb47a..0xb4da  (96 bytes)
DATA_fichas_b47a:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0c7h,0ffh,082h,0ffh,092h,0ffh,092h,0ffh,09eh,0ffh,09eh	; b47a  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,019h,0ffh,009h,0ffh,049h,0ffh,049h,0ffh,049h,0ffh,049h	; b48a  .........I.I.I.I
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0cfh,0ffh,0cfh,0ffh,0cfh,0ffh,0cfh,0ffh,0cfh,0ffh,0cfh	; b49a  ................
	defb 0ffh,09eh,0ffh,092h,0ffh,092h,0ffh,082h,0ffh,0c6h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b4aa  ................
	defb 0ffh,009h,0ffh,009h,0ffh,049h,0ffh,048h,0ffh,048h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b4ba  .....I.H.H......
	defb 0ffh,0cfh,0ffh,0cfh,0ffh,0cfh,0ffh,043h,0ffh,043h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b4ca  .......C.C......

; ======================================================================
; CODIGO 0xb4da..0xb515  (59 bytes)
; ======================================================================


L_B4DA:
	call 040a0h		;b4da
	ld d,001h		;b4dd
	call 04163h		;b4df
	call 0409bh		;b4e2
	ld bc,00007h		;b4e5
	call 00047h		;b4e8   ; BIOS WRTVDP - Writes data in the VDP-register
	call L_B05C		;b4eb
	call L_B5B5		;b4ee
	ld a,060h		;b4f1
	ld (0c119h),a		;b4f3
	xor a			;b4f6
	ld (0c118h),a		;b4f7
	call L_B0A3		;b4fa
	ld hl,0b602h		;b4fd
	call 04118h		;b500
	jp 040aah		;b503
L_B506:
	ld a,(0c118h)		;b506
	ld hl,0b515h		;b509
L_B50C:
	add a,a			;b50c
	call 04050h		;b50d
	ld e,(hl)			;b510
	inc hl			;b511
	ld d,(hl)			;b512
	ex de,hl			;b513
	jp (hl)			;b514

; ----------------------------------------------------------------------
; DATOS saltos_del_menu: 5 direcciones de codigo, una por estado del menu
;   (0xC118): p09:B509 -> L_B50C; lo leen p09:B509 (10 bytes)
;   0xb515..0xb51f  (10 bytes)
DATA_saltos_del_menu:
	defw 0b51fh,0b52eh,0b55fh,0b571h,0b57fh	; b515

; ======================================================================
; CODIGO 0xb51f..0xb58a  (107 bytes)
; ======================================================================


L_B51F:
	ld a,047h		;b51f
	call 04140h		;b521
L_B524:
	ld a,00ch		;b524
	ld (0c119h),a		;b526
	ld hl,0c118h		;b529
	inc (hl)			;b52c
	ret			;b52d
L_B52E:
	ld hl,0c119h		;b52e
	dec (hl)			;b531
	jr z,L_B524		;b532
L_B534:
	ld a,(0c119h)		;b534
	dec a			;b537
	ld hl,0b5f7h		;b538
	call 04050h		;b53b
	ld e,(hl)			;b53e
	ld d,020h		;b53f
	push de			;b541
	ld hl,02068h		;b542
	ld bc,06820h		;b545
	ld a,048h		;b548
	call 040a5h		;b54a
	pop de			;b54d
	ld a,008h		;b54e
	add a,e			;b550
	ld e,a			;b551
	ld d,088h		;b552
	ld hl,08868h		;b554
	ld bc,04820h		;b557
	ld a,048h		;b55a
	jp 040a5h		;b55c
L_B55F:
	call 040f5h		;b55f
	ld a,001h		;b562
	ld (0c119h),a		;b564
	call L_B534		;b567
	xor a			;b56a
	ld (0c119h),a		;b56b
	jp L_B524		;b56e
L_B571:
	ld hl,0c119h		;b571
	dec (hl)			;b574
	ret nz			;b575
	call L_B524		;b576
L_B579:
	ld hl,0b58ah		;b579
	jp 040afh		;b57c
L_B57F:
	call L_B55F		;b57f
	ld a,04ah		;b582
	call 04140h		;b584
	jp L_B579		;b587

; ----------------------------------------------------------------------
; DATOS rotulo_del_titulo: rotulo con posicion (L_510C: [X][Y] y caracteres,
;   0xFE otra posicion, 0xFF acaba): ":" (la ficha 10 de la fuente, el (C)) en
;   (0x4E,0x60), "KONAMI 1987" en (0x58,0x60) y "PUSH SPACE KEY" en
;   (0x48,0x88); p09:B579 lo carga en HL para escribirlo
;   0xb58a..0xb5ad  (35 bytes)
DATA_rotulo_del_titulo:
	defb 04eh,060h,03ah,0feh,058h,060h,04bh,04fh,04eh,041h,04dh,049h,000h,031h,039h,038h	; b58a  N`:.X`KONAMI.198
	defb 037h,0feh,048h,088h,050h,055h,053h,048h,000h,053h,050h,041h,043h,045h,000h,04bh	; b59a  7.H.PUSH.SPACE.K
	defb 045h,059h,0ffh	; b5aa

; ----------------------------------------------------------------------
; DATOS colores_del_titulo: 8 bytes que p09:B5B5 copia a 0xE700 antes del
;   logotipo; lo leen p09:B5B5 (8 bytes)
;   0xb5ad..0xb5b5  (8 bytes)
DATA_colores_del_titulo:
	defb 000h,002h,003h,004h,005h,009h,00ah,00eh	; b5ad  ........

; ======================================================================
; CODIGO 0xb5b5..0xb5f7  (66 bytes)
; ======================================================================


L_B5B5:
	ld hl,0b5adh		;b5b5
	ld de,0e700h		;b5b8
	ld bc,00008h		;b5bb
	ldir		;b5be
	ld hl,0b8b9h		;b5c0
	ld de,08004h		;b5c3
	ld b,046h		;b5c6
	call 04168h		;b5c8
	ld hl,0b618h		;b5cb
	ld de,02068h		;b5ce
	ld bc,00d04h		;b5d1
	call L_B5E0		;b5d4
	ld hl,0b64ch		;b5d7
	ld de,08870h		;b5da
	ld bc,00904h		;b5dd
L_B5E0:
	push de			;b5e0
	push bc			;b5e1
L_B5E2:
	ld a,(hl)			;b5e2
	call 040b4h		;b5e3
	ld a,d			;b5e6
	add a,008h		;b5e7
	ld d,a			;b5e9
	inc hl			;b5ea
	djnz L_B5E2		;b5eb
	pop bc			;b5ed
	pop de			;b5ee
	ld a,e			;b5ef
	add a,008h		;b5f0
	ld e,a			;b5f2
	dec c			;b5f3
	jr nz,L_B5E0		;b5f4
	ret			;b5f6

; ----------------------------------------------------------------------
; DATOS once_bytes_b5f7: 11 bytes de 0x20 a 0xC0 de 0x10 en 0x10, entre el
;   `ret` de 0xB5F6 y la paleta de 0xB602; ninguna instruccion de los 16
;   bancos los nombra (grep de 0xB5F7 en los listados: solo p00:44AC, que es
;   el bloque de fichas del banco 15). SIN LECTOR A LA VISTA
;   0xb5f7..0xb602  (11 bytes)
DATA_once_bytes_b5f7:
	defb 020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b0h,0c0h	; b5f7   0@P`p.....

; ----------------------------------------------------------------------
; DATOS paleta_del_titulo: ternas [registro][RB][G] hasta 0xFF que p09:B500
;   manda al VDP (p00:4118, L_4EC4); lo leen p09:B500 (22 bytes)
;   0xb602..0xb618  (22 bytes)
DATA_paleta_del_titulo:
	defb 002h,033h,003h	; b602
	defb 003h,022h,002h	; b605
	defb 004h,055h,005h	; b608
	defb 005h,062h,005h	; b60b
	defb 009h,060h,003h	; b60e
	defb 00ah,061h,001h	; b611
	defb 00eh,077h,007h	; b614
	defb 0ffh	; b617

; ----------------------------------------------------------------------
; DATOS montaje_del_titulo: 4 filas de 13 numeros de ficha que p09:B5D4
;   (L_B5E0) pinta de una en una con p00:40B4 desde (0x20,0x68); lo leen
;   p09:B5D4 (52 bytes)
;   0xb618..0xb64c  (52 bytes)
DATA_montaje_del_titulo:
	defb 001h,002h,003h,004h,005h,000h,000h,000h,000h,000h,000h,000h,000h	; b618  .............
	defb 006h,007h,008h,009h,00ah,00bh,00ch,00dh,00eh,00fh,010h,011h,000h	; b625  .............
	defb 012h,013h,014h,015h,016h,017h,018h,019h,01ah,01bh,01ch,01dh,000h	; b632  .............
	defb 01eh,01fh,020h,021h,022h,023h,024h,025h,026h,027h,028h,029h,02ah	; b63f  .. !"#$%&'()*

; ----------------------------------------------------------------------
; DATOS montaje_del_titulo_2: 4 filas de 9 numeros de ficha (p09:B5DD, desde
;   (0x88,0x70)); lo leen p09:B5DD (36 bytes)
;   0xb64c..0xb670  (36 bytes)
DATA_montaje_del_titulo_2:
	defb 02bh,02ch,02dh,02eh,02fh,030h,031h,032h,033h	; b64c  +,-./0123
	defb 034h,035h,036h,037h,038h,039h,03ah,03bh,03ch	; b655  456789:.<
	defb 03dh,03eh,03fh,040h,041h,042h,043h,044h,045h	; b65e  =>?@ABCDE
	defb 000h,000h,000h,000h,000h,000h,000h,000h,046h	; b667  ........F

; ======================================================================
; CODIGO 0xb670..0xb6a6  (54 bytes)
; ======================================================================


L_B670:
	call 040a0h		;b670
	ld a,05ch		;b673
	call 04140h		;b675
	call 04113h		;b678
	ld hl,0b6a6h		;b67b
	call 04118h		;b67e
	ld b,00fh		;b681
	ld c,007h		;b683
	call 00047h		;b685   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,02840h		;b688
	ld bc,0a848h		;b68b
	xor a			;b68e
	ld d,001h		;b68f
	call 04096h		;b691
	call 0411dh		;b694
	call 040aah		;b697
	ld hl,0c130h		;b69a
	ld (hl),03ch		;b69d
	inc hl			;b69f
	ld (hl),031h		;b6a0
	inc hl			;b6a2
	ld (hl),000h		;b6a3
	ret			;b6a5

; ----------------------------------------------------------------------
; DATOS paleta_del_logotipo_konami: ternas de paleta hasta 0xFF (p09:B67E ->
;   L_4EC4); lo leen p09:B67E (16 bytes)
;   0xb6a6..0xb6b6  (16 bytes)
DATA_paleta_del_logotipo_konami:
	defb 000h,000h,000h	; b6a6
	defb 001h,070h,003h	; b6a9
	defb 002h,060h,001h	; b6ac
	defb 003h,044h,004h	; b6af
	defb 00fh,077h,007h	; b6b2
	defb 0ffh	; b6b5

; ======================================================================
; CODIGO 0xb6b6..0xb6d8  (34 bytes)
; ======================================================================


L_B6B6:
	ld hl,0c130h		;b6b6
	dec (hl)			;b6b9
	ld a,(hl)			;b6ba
	and 001h		;b6bb
	ret nz			;b6bd
	inc hl			;b6be
	dec (hl)			;b6bf
	jr nz,L_B6C8		;b6c0
	ld a,001h		;b6c2
	ld (0c132h),a		;b6c4
	ret			;b6c7
L_B6C8:
	ld a,031h		;b6c8
	sub (hl)			;b6ca
	ld c,a			;b6cb
	ld b,0a8h		;b6cc
	ld hl,02840h		;b6ce
	ld e,l			;b6d1
	ld d,h			;b6d2
	ld a,001h		;b6d3
	jp 04122h		;b6d5

; ----------------------------------------------------------------------
; DATOS montaje_del_logotipo_konami: numeros de ficha del logotipo de Konami
;   por filas (0xFE n baja una fila y corre n puntos, 0xFF acaba) que p00:4C79
;   copia con L_518A; lo leen p00:4C75 (65 bytes)
;   0xb6d8..0xb719  (65 bytes)
DATA_montaje_del_logotipo_konami:
	defb 001h,002h,003h,0feh,0f8h,004h,005h,006h,007h,0feh,0f0h,008h,009h,00ah,00bh,00eh	; b6d8  ................
	defb 00fh,010h,011h,01bh,01ch,01dh,01eh,01fh,020h,021h,022h,023h,024h,025h,026h,0feh	; b6e8  ........ !"#$%&.
	defb 000h,00ch,002h,00dh,012h,013h,014h,015h,027h,028h,029h,02ah,02bh,02ch,02dh,02eh	; b6f8  ........'()*+,-.
	defb 02fh,030h,031h,032h,033h,034h,0feh,010h,016h,019h,017h,0feh,0f8h,018h,019h,01ah	; b708  /01234..........
	defb 0ffh	; b718

; ----------------------------------------------------------------------
; DATOS logotipo_konami_B719: 13 caracteres de 1 bit por punto (8 bytes) del
;   logotipo de Konami que p00:4C57 pinta con L_505D en la VRAM 0x0800, color
;   1; lo leen p00:4C57 (104 bytes)
;   0xb719..0xb781  (104 bytes)
DATA_logotipo_konami_B719:
	defb 007h,007h,00fh,00fh,00fh,01fh,01fh,03fh	; b719  .......?
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b721  ........
	defb 0f8h,0f8h,0f0h,0f0h,0f0h,0e0h,0e0h,0e0h	; b729  ........
	defb 000h,000h,000h,000h,001h,003h,00fh,07fh	; b731  ........
	defb 03fh,07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh	; b739  ?.......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0f0h,0c0h	; b741  ........
	defb 0c0h,0c0h,080h,080h,000h,000h,000h,000h	; b749  ........
	defb 000h,000h,000h,001h,003h,007h,00fh,00fh	; b751  ........
	defb 00fh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b759  .?......
	defb 0ffh,0ffh,0ffh,0feh,0fch,0f8h,0f8h,0f0h	; b761  ........
	defb 0f8h,0c0h,000h,000h,000h,000h,000h,000h	; b769  ........
	defb 01fh,01fh,01fh,03fh,03fh,03fh,07fh,07fh	; b771  ...???..
	defb 0f0h,0e0h,0e0h,0c0h,0c0h,0c0h,080h,080h	; b779  ........

; ----------------------------------------------------------------------
; DATOS logotipo_konami_B781: 13 caracteres de 1 bit por punto (8 bytes) del
;   logotipo de Konami que p00:4C63 pinta con L_505D en la VRAM 0x7000, color
;   2; lo leen p00:4C63 (104 bytes)
;   0xb781..0xb7e9  (104 bytes)
DATA_logotipo_konami_B781:
	defb 000h,000h,000h,000h,000h,001h,001h,003h	; b781  ........
	defb 07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b789  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fch	; b791  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; b799  ........
	defb 000h,000h,000h,000h,000h,000h,000h,007h	; b7a1  ........
	defb 003h,007h,007h,00fh,01fh,03fh,0ffh,0ffh	; b7a9  .....?..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f8h	; b7b1  ........
	defb 0fch,0f8h,0f8h,0f0h,0e0h,0c0h,000h,000h	; b7b9  ........
	defb 000h,003h,00fh,01fh,03fh,07fh,0ffh,0ffh	; b7c1  ....?...
	defb 0ffh,0fch,0f0h,0e0h,0c0h,080h,080h,000h	; b7c9  ........
	defb 001h,001h,001h,003h,003h,003h,007h,007h	; b7d1  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b7d9  ........
	defb 0ffh,0feh,0feh,0fch,0fch,0fch,0f8h,0f8h	; b7e1  ........

; ----------------------------------------------------------------------
; DATOS logotipo_konami_B7E9: 26 caracteres de 1 bit por punto (8 bytes) del
;   logotipo de Konami que p00:4C6F pinta con L_505D en la VRAM 0xD800, color
;   3; lo leen p00:4C6F (208 bytes)
;   0xb7e9..0xb8b9  (208 bytes)
DATA_logotipo_konami_B7E9:
	defb 03ch,03ch,078h,078h,079h,0f3h,0f7h,0ffh	; b7e9  <<xxy...
	defb 01fh,03eh,07ch,0f9h,0f3h,0e3h,0c3h,087h	; b7f1  .>|.....
	defb 01fh,07fh,0f8h,0f0h,0e0h,0e0h,0c0h,0c0h	; b7f9  ........
	defb 0c0h,0f0h,0f8h,078h,078h,079h,079h,079h	; b801  ...xxyyy
	defb 07fh,07fh,0ffh,0f7h,0f7h,0e7h,0e7h,0e7h	; b809  ........
	defb 00fh,00fh,01eh,01eh,01eh,03ch,03ch,03ch	; b811  .....<<<
	defb 003h,007h,00fh,00eh,01eh,03ch,038h,078h	; b819  .....<8x
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0e1h,0e1h,0e1h	; b821  ........
	defb 07eh,07eh,0feh,0f6h,0f6h,0eeh,0eeh,0eeh	; b829  ~~......
	defb 00fh,00fh,01fh,01dh,03dh,03bh,07bh,073h	; b831  ....=.{s
	defb 0f1h,0f1h,0e3h,0e3h,0e3h,0c7h,0c7h,0c7h	; b839  ........
	defb 0e0h,0e0h,0c0h,0c0h,0c0h,080h,080h,080h	; b841  ........
	defb 001h,001h,001h,003h,003h,003h,007h,007h	; b849  ........
	defb 0efh,0e7h,0e7h,0c7h,0c7h,0c3h,083h,083h	; b851  ........
	defb 087h,087h,087h,0c7h,0c7h,0c7h,0e3h,0e0h	; b859  ........
	defb 080h,080h,081h,081h,083h,0c7h,0ffh,0feh	; b861  ........
	defb 0fbh,0f3h,0f3h,0f7h,0e7h,0c7h,08fh,00fh	; b869  ........
	defb 0c7h,0c7h,0c7h,087h,087h,087h,007h,007h	; b871  ........
	defb 078h,078h,079h,0f1h,0f3h,0f7h,0e7h,0efh	; b879  xxy.....
	defb 070h,0f0h,0ffh,0ffh,0ffh,080h,080h,000h	; b881  p.......
	defb 0e3h,0e3h,0e3h,0e7h,0e7h,0e7h,0efh,0efh	; b889  ........
	defb 0ceh,0ceh,0cfh,08fh,08fh,08fh,00fh,00fh	; b891  ........
	defb 0f7h,0e7h,0c7h,0cfh,08fh,08fh,01eh,01eh	; b899  ........
	defb 08fh,08fh,08fh,01eh,01eh,01eh,03ch,03ch	; b8a1  ......<<
	defb 007h,008h,017h,014h,017h,014h,008h,007h	; b8a9  ........
	defb 080h,040h,020h,0a0h,020h,0a0h,040h,080h	; b8b1  .@ . .@.

; ----------------------------------------------------------------------
; DATOS logotipo_metal_gear: 70 fichas en 3 planos del logotipo METAL GEAR del
;   titulo, que p09:B5C8 vuelca en la VRAM 0x8004 (por p00:4168, L_524C); lo
;   leen p09:B5C8 (1680 bytes)
;   0xb8b9..0xbf49  (1680 bytes)
DATA_logotipo_metal_gear:
	defb 000h,000h,000h,000h,000h,000h,001h,001h,001h,002h,003h,001h,002h,001h,001h,004h,003h,003h,000h,007h,003h,000h,00fh,007h	; b8b9  ........................
	defb 000h,000h,000h,000h,000h,000h,0f8h,0e7h,080h,001h,0ffh,0feh,001h,0ffh,0feh,001h,0ffh,0feh,001h,0ffh,0feh,000h,0ffh,0ffh	; b8d1  ........................
	defb 000h,000h,000h,000h,000h,000h,01fh,01eh,010h,020h,03fh,01fh,040h,03fh,03fh,000h,0ffh,07fh,000h,0ffh,0ffh,000h,0ffh,0ffh	; b8e9  ......... ?.@??.........
	defb 000h,000h,000h,000h,000h,000h,003h,0c3h,002h,044h,0c7h,083h,028h,0e7h,0c7h,020h,0ffh,0cfh,020h,0ffh,0dfh,000h,0ffh,0ffh	; b901  .........D..(.. .. .....
	defb 000h,000h,000h,000h,000h,000h,0e0h,0d0h,000h,008h,0f8h,0f0h,004h,0fch,0f8h,002h,0feh,0fch,002h,0feh,0fch,002h,0feh,0fch	; b919  ........................
	defb 007h,008h,007h,000h,01fh,00fh,000h,01fh,00fh,01fh,01ch,003h,000h,004h,003h,003h,004h,003h,000h,004h,003h,007h,00bh,000h	; b931  ........................
	defb 0ffh,000h,0ffh,000h,0ffh,0ffh,003h,0ffh,0fch,0fch,004h,0f8h,004h,004h,0f8h,0fch,00ch,0f0h,01ch,01ch,0e8h,0f8h,0f8h,010h	; b949  ........................
	defb 0ffh,000h,0ffh,000h,0ffh,0ffh,080h,0ffh,07fh,03fh,040h,03fh,000h,040h,03fh,03fh,040h,03fh,001h,081h,07eh,07fh,0ffh,001h	; b961  .........?@?.@??@?..~...
	defb 0ffh,000h,0ffh,000h,0ffh,0ffh,078h,0ffh,087h,0c3h,044h,083h,040h,044h,083h,0c7h,048h,087h,080h,088h,007h,087h,08fh,000h	; b979  ......x...D.@D..H.......
	defb 0feh,002h,0fch,004h,0fch,0f8h,004h,0fdh,0f8h,0fch,007h,0f9h,004h,004h,0fbh,0ffh,00fh,0f0h,018h,019h,0e0h,0f8h,0f9h,010h	; b991  ........................
	defb 07ch,07bh,060h,080h,07fh,07fh,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,003h,0fch,006h,006h,0f8h,0feh,0fch,004h	; b9a9  |{`.....................
	defb 000h,0ffh,000h,001h,0ffh,0feh,002h,0ffh,0fch,0fdh,006h,0f9h,008h,00ch,0f3h,0f7h,0f7h,000h,000h,000h,000h,000h,000h,000h	; b9c1  ........................
	defb 0fch,0fbh,060h,080h,07fh,07fh,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0f0h,00fh,000h,010h,00fh,00fh,01fh,000h	; b9d9  ..`.....................
	defb 000h,0ffh,000h,000h,0ffh,0ffh,001h,0ffh,0feh,0feh,003h,0fch,004h,006h,0f9h,0f9h,039h,0c0h,060h,060h,080h,0e0h,0e1h,040h	; b9f1  ................9.``...@
	defb 07eh,0fdh,030h,0c0h,0bfh,03fh,000h,0ffh,07fh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,080h,07fh,000h,080h,07fh,0ffh,0ffh,004h	; ba09  ~.0..?..................
	defb 018h,0f8h,000h,010h,0f0h,0e0h,010h,0f1h,0e0h,0f1h,012h,0e1h,010h,014h,0e3h,0f7h,017h,0e0h,030h,031h,0c0h,0f0h,0f1h,020h	; ba21  ..................01...
	defb 07dh,07bh,060h,081h,07fh,07eh,001h,0ffh,0feh,0ffh,001h,0feh,001h,001h,0feh,0feh,002h,0fch,002h,002h,0fch,0feh,0feh,004h	; ba39  }{`..~..................
	defb 007h,00fh,007h,007h,00fh,007h,007h,00fh,000h,007h,018h,000h,000h,01fh,000h,008h,017h,000h,00fh,010h,000h,01fh,028h,000h	; ba51  ......................(.
	defb 0f8h,0f8h,0f0h,0f8h,0f8h,0e0h,0f8h,0e9h,000h,0f0h,011h,000h,010h,0f1h,000h,010h,0f1h,000h,0f1h,012h,000h,0e1h,023h,000h	; ba69  ......................#.
	defb 07fh,0ffh,07fh,07fh,0ffh,07eh,0ffh,0fdh,000h,0fdh,003h,000h,001h,0ffh,000h,083h,07dh,000h,0feh,000h,000h,0feh,002h,000h	; ba81  .....~..........}.......
	defb 087h,08fh,007h,08fh,09fh,00fh,00fh,01fh,000h,01fh,000h,000h,000h,01fh,000h,010h,02fh,000h,01fh,020h,000h,01fh,030h,000h	; ba99  ................/.. ..0.
	defb 0f8h,0f9h,0f0h,0f1h,0f3h,0c1h,0f1h,0d3h,000h,0d3h,030h,000h,010h,0f3h,000h,062h,0a5h,000h,0e3h,024h,000h,0e3h,066h,000h	; bab1  ..........0....b...$..f.
	defb 0fdh,0fdh,0f8h,0ffh,0f9h,0f1h,0ffh,0f3h,000h,0efh,010h,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,007h,000h	; bac9  ........................
	defb 0f0h,08eh,000h,0fah,0feh,0f8h,0fch,0f4h,000h,0f8h,008h,000h,010h,0f0h,000h,0e0h,020h,000h,0c0h,0c0h,000h,080h,080h,000h	; bae1  ................ .......
	defb 01fh,03fh,01fh,01fh,03fh,01fh,01fh,03fh,000h,03fh,000h,000h,000h,07fh,000h,021h,05eh,000h,03fh,040h,000h,03fh,060h,000h	; baf9  .?..?..?.?.....!^.?@.?`.
	defb 0e0h,0e1h,0c0h,0c1h,0c3h,001h,0c1h,043h,000h,047h,0c0h,000h,080h,087h,000h,084h,08bh,000h,087h,088h,000h,08fh,098h,000h	; bb11  .......C.G..............
	defb 0ffh,0fbh,0fbh,0fbh,0f7h,0f3h,0fbh,0f3h,000h,0f3h,000h,000h,010h,0e3h,000h,024h,0e3h,000h,0efh,030h,000h,0dfh,070h,000h	; bb29  ...............$...0..p.
	defb 0f0h,0f1h,0e0h,0f1h,0f3h,0c1h,0f1h,0d3h,000h,0d3h,030h,000h,010h,0f3h,000h,032h,0d5h,000h,0f3h,014h,000h,0f3h,036h,000h	; bb41  ..........0....2......6.
	defb 0feh,0feh,0fch,0feh,0feh,0f8h,0fch,0f4h,000h,0f4h,00ch,000h,004h,0fch,000h,00ch,0f4h,000h,0f8h,008h,000h,0f8h,008h,000h	; bb59  ........................
	defb 01fh,03fh,000h,01fh,03fh,000h,01fh,03fh,000h,01fh,03fh,000h,00fh,070h,000h,03fh,07fh,000h,03fh,07fh,013h,01eh,021h,000h	; bb71  .?..?..?..?..p.?..?...!.
	defb 0e3h,0e3h,000h,0e3h,0e3h,000h,0e7h,0e3h,000h,0c7h,043h,000h,0c7h,0c0h,000h,0cfh,0cfh,000h,08fh,087h,001h,087h,088h,000h	; bb89  ..........C.............
	defb 0feh,0feh,000h,0feh,0feh,000h,0fch,0fch,000h,0fch,0f4h,000h,0fch,00ch,000h,0fch,0fch,000h,0f8h,0f8h,030h,0f8h,008h,000h	; bba1  ....................0...
	defb 01fh,03fh,000h,07fh,07fh,000h,07fh,03fh,000h,07fh,03fh,000h,07fh,000h,000h,0ffh,0ffh,000h,0ffh,07fh,013h,07fh,080h,000h	; bbb9  .?.....?..?.............
	defb 0e3h,0e7h,000h,0cfh,0cfh,000h,0cfh,0c7h,000h,0cfh,047h,000h,0cfh,0c0h,000h,09fh,09fh,000h,09fh,08fh,008h,08fh,090h,000h	; bbd1  ..........G.............
	defb 0f8h,0f8h,000h,0f0h,0f0h,000h,0f0h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,04ch,0ffh,000h,000h	; bbe9  ....................L...
	defb 000h,000h,000h,000h,000h,000h,000h,0f8h,000h,0f8h,0c8h,000h,0f1h,030h,000h,0e1h,0e1h,000h,0c1h,0c0h,080h,080h,001h,000h	; bc01  .............0..........
	defb 0ffh,07fh,000h,0ffh,07fh,000h,0ffh,07fh,000h,0ffh,07dh,000h,0feh,002h,000h,0feh,0feh,000h,0feh,0feh,04ch,0feh,000h,000h	; bc19  ..........}.........L...
	defb 00fh,01fh,000h,03fh,03fh,000h,03fh,01fh,000h,07fh,03eh,000h,07fh,001h,000h,0feh,0feh,000h,0feh,07eh,004h,07eh,080h,000h	; bc31  ...??.?...>........~.~..
	defb 0bfh,07fh,000h,07fh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,007h,007h,000h,003h,007h,000h,003h,004h,000h	; bc49  ........................
	defb 0f7h,0f7h,000h,0f7h,0f7h,000h,0f7h,0ffh,000h,0f7h,0dfh,000h,0efh,030h,000h,0ffh,0efh,000h,0ffh,0efh,060h,0efh,010h,000h	; bc61  .............0......`...
	defb 0f8h,0f8h,000h,0f8h,0f8h,000h,0f0h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,013h,0ffh,001h,000h	; bc79  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,0f0h,000h,0f0h,090h,000h,0e0h,060h,000h,0c0h,0c0h,000h,080h,080h,000h,000h,000h,000h	; bc91  .............`..........
	defb 003h,001h,001h,004h,003h,003h,000h,00fh,007h,007h,008h,007h,000h,010h,00fh,00fh,010h,00fh,000h,010h,00fh,00fh,01fh,000h	; bca9  ........................
	defb 0f0h,0efh,080h,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,03fh,0c0h,0c0h,0c0h,000h,0c0h,0c0h,080h	; bcc1  ................?.......
	defb 003h,0ffh,000h,006h,0fdh,0f9h,00bh,0fch,0f3h,0f7h,018h,0e7h,020h,030h,0cfh,0cfh,0cch,003h,000h,004h,003h,003h,007h,000h	; bcd9  ............ 0..........
	defb 0f8h,0f7h,0c0h,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,00fh,0f0h,008h,008h,0f0h,0f8h,0f8h,010h	; bcf1  ........................
	defb 002h,0feh,000h,004h,0fch,0f8h,008h,0f8h,0f0h,0f0h,011h,0e0h,020h,022h,0c1h,0c1h,0c1h,000h,000h,000h,000h,000h,001h,000h	; bd09  ............ "..........
	defb 03eh,03dh,030h,040h,03fh,03fh,000h,0ffh,07fh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,080h,07fh,000h,080h,07fh,0ffh,0ffh,004h	; bd21  >=0@??..................
	defb 010h,0f0h,000h,010h,0f0h,0e0h,010h,0f1h,0e0h,0f1h,012h,0e1h,010h,014h,0e3h,0f3h,013h,0e0h,010h,011h,0e0h,0f0h,0f1h,020h	; bd39  .......................
	defb 07ah,07eh,060h,082h,07fh,07ch,000h,0ffh,0fdh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,007h,0f8h,00ch,00ch,0f0h,0fch,0fch,008h	; bd51  z~`..|..................
	defb 07ch,0fbh,060h,001h,0ffh,0feh,001h,0ffh,0feh,0ffh,001h,0feh,001h,001h,0feh,0ffh,0c1h,03eh,001h,041h,03eh,03fh,07fh,002h	; bd69  |.`..............>.A>?..
	defb 01fh,03fh,01fh,01fh,03fh,01fh,01fh,03fh,000h,01eh,021h,000h,021h,05fh,000h,031h,04fh,000h,03fh,041h,000h,03fh,061h,000h	; bd81  .?..?..?..!.!_.1O.?A.?a.
	defb 0c0h,0c0h,080h,087h,080h,000h,08fh,08fh,000h,09fh,080h,000h,080h,0bfh,000h,040h,03fh,000h,07fh,080h,000h,0ffh,0f0h,000h	; bd99  ...............@?.......
	defb 003h,007h,003h,0f7h,00fh,007h,0f7h,0dfh,000h,0d7h,038h,000h,010h,0ffh,000h,068h,0b7h,000h,0efh,030h,000h,0efh,078h,000h	; bdb1  ..........8....h...0..x.
	defb 0f7h,0f0h,0e0h,0ffh,0ffh,0c7h,0ffh,0dfh,000h,0cfh,030h,000h,000h,0ffh,000h,019h,0e6h,000h,0ffh,001h,000h,0feh,03eh,000h	; bdc9  ..........0...........>.
	defb 0f8h,001h,000h,0f9h,0fbh,0c1h,0f1h,0d3h,000h,0a3h,064h,000h,040h,0c7h,000h,080h,08fh,000h,007h,008h,000h,00fh,018h,000h	; bde1  ..........d.@...........
	defb 0ffh,0ffh,0fbh,0fbh,0ffh,0e3h,0fbh,0efh,000h,0d3h,034h,000h,020h,0e7h,000h,064h,0abh,000h,0cfh,050h,000h,0dfh,070h,000h	; bdf9  ..........4. ..d...P..p.
	defb 0f0h,0f1h,0e0h,0f0h,0f1h,0c0h,0f1h,0d3h,000h,0d1h,032h,000h,030h,0d3h,000h,072h,095h,000h,0f3h,014h,000h,0f3h,036h,000h	; be11  ..........2.0..r......6.
	defb 0fch,0fdh,0f8h,0f9h,0fbh,0f1h,0fbh,0efh,000h,0f7h,00ch,000h,008h,0ffh,000h,01ch,0e3h,000h,0ffh,018h,000h,0ffh,03ch,000h	; be29  ......................<.
	defb 03fh,0ffh,03eh,0feh,0feh,0f8h,0feh,0fah,000h,0f4h,00ch,000h,00ch,0f4h,000h,038h,0c8h,000h,0f0h,030h,000h,0e0h,020h,000h	; be41  ?.>............8...0.. .
	defb 07fh,0ffh,000h,07eh,0feh,000h,07eh,0ffh,000h,0ffh,07fh,000h,0ffh,000h,000h,07fh,0ffh,000h,03fh,07fh,000h,01fh,020h,000h	; be59  ...~..~...........?... .
	defb 00fh,01fh,000h,01fh,03fh,000h,01fh,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,0ffh,0ffh,026h,0feh,000h,000h	; be71  ....?...............&...
	defb 0efh,0ffh,000h,0dfh,0ffh,000h,0dfh,0ffh,000h,0dfh,07fh,000h,0bfh,080h,000h,0ffh,0bfh,000h,07fh,03fh,000h,07fh,000h,000h	; be89  ...................?....
	defb 0c0h,0c0h,000h,0c0h,0c0h,000h,0c0h,0ffh,000h,0ffh,0feh,000h,0ffh,001h,000h,0ffh,0ffh,000h,0feh,0feh,04ch,0fch,004h,000h	; bea1  ....................L...
	defb 00fh,01fh,000h,01fh,03fh,000h,05fh,0ffh,000h,0bfh,0feh,000h,0ffh,081h,000h,0feh,07eh,000h,0feh,07eh,00ch,0feh,002h,000h	; beb9  ....?._.........~..~....
	defb 0bfh,0ffh,000h,07fh,0ffh,000h,0ffh,0ffh,000h,0ffh,017h,000h,0ffh,0fch,000h,003h,007h,000h,003h,007h,000h,003h,004h,000h	; bed1  ........................
	defb 0f3h,0f7h,000h,0f7h,0ffh,000h,0f7h,0ffh,000h,0f7h,0dfh,000h,0ffh,010h,000h,0ffh,0f7h,000h,0ffh,0ffh,061h,0ffh,010h,000h	; bee9  ....................a...
	defb 0f3h,0f7h,000h,0f3h,0f7h,000h,0e3h,0e7h,000h,0e1h,0a3h,000h,0e1h,022h,000h,0c1h,0c2h,000h,0c0h,0c1h,080h,0c0h,041h,000h	; bf01  ............."........A.
	defb 0e0h,0e0h,000h,0f0h,0f0h,000h,0f0h,0f0h,000h,0f8h,0e8h,000h,0f8h,008h,000h,0fch,004h,000h,0fch,00ch,000h,0feh,0feh,000h	; bf19  ........................
	defb 07eh,0feh,000h,07fh,081h,000h,03fh,07fh,006h,01fh,060h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bf31  ~.....?...`.............

; ======================================================================
; CODIGO 0xbf49..0xbf60  (23 bytes)
; ======================================================================


L_BF49:
	ld a,(0c130h)		;bf49
	ld bc,00006h		;bf4c
	ld hl,0bf60h		;bf4f
	cpir		;bf52
	ret nz			;bf54
	ld a,090h		;bf55
	ld (0c608h),a		;bf57
	ld a,005h		;bf5a
	ld (0c151h),a		;bf5c
	ret			;bf5f

; ----------------------------------------------------------------------
; DATOS salas_del_camion: 6 numeros de sala que p09:BF4F busca con cpir; lo
;   leen p09:BF4F (6 bytes)
;   0xbf60..0xbf66  (6 bytes)
DATA_salas_del_camion:
	defb 0c7h,0d9h,0dbh,0d5h,0d7h,0adh	; bf60

; ======================================================================
; CODIGO 0xbf66..0xbf99  (51 bytes)
; ======================================================================


L_BF66:
	ld hl,0c608h		;bf66
	dec (hl)			;bf69
	jr z,$+55		;bf6a
	ld a,(hl)			;bf6c
	cp 08eh		;bf6d
	jr nz,L_BF80		;bf6f
	ld a,(0cee1h)		;bf71
	and a			;bf74
	jr nz,L_BF80		;bf75
	inc a			;bf77
	ld (0cee1h),a		;bf78
	ld a,05bh		;bf7b
	jp 04127h		;bf7d
L_BF80:
	ld a,(hl)			;bf80
	ld c,a			;bf81
	cp 08dh		;bf82
	ld a,01fh		;bf84
	call z,0405ah		;bf86
	ld a,c			;bf89
	cp 080h		;bf8a
	ret nc			;bf8c
	and 00eh		;bf8d
	rra			;bf8f
	ld hl,0bf99h		;bf90
	call 04050h		;bf93
	ld a,(hl)			;bf96
	jr $+19		;bf97

; ----------------------------------------------------------------------
; DATOS bf99: 8 bytes que p09:BF90 lee en 0xBF99 + ((bits 1-3 de A) / 2); lo
;   leen p09:BF90 (8 bytes)
;   0xbf99..0xbfa1  (8 bytes)
DATA_bf99:
	defb 002h,0ffh,001h,0feh,002h,0fdh,0ffh,000h	; bf99  ........

; ======================================================================
; CODIGO 0xbfa1..0xbfe6  (69 bytes)
; ======================================================================


L_BFA1:
	ld a,028h		;bfa1
	call 0405ah		;bfa3
	xor a			;bfa6
	ld (0c151h),a		;bfa7
L_BFAA:
	ld b,a			;bfaa
	ld c,017h		;bfab
	jp 00047h		;bfad   ; BIOS WRTVDP - Writes data in the VDP-register
L_BFB0:
	ld a,(0c130h)		;bfb0
	ld c,a			;bfb3
	cp 085h		;bfb4
	jr nz,L_BFC8		;bfb6
	ld a,(0c660h)		;bfb8
	and a			;bfbb
	ret nz			;bfbc
	ld a,002h		;bfbd
	ld (0c608h),a		;bfbf
	ld a,00ch		;bfc2
	ld (0c151h),a		;bfc4
	ret			;bfc7
L_BFC8:
	ld a,c			;bfc8
	sub 06fh		;bfc9
	ret nz			;bfcb
	inc a			;bfcc
	ld (0c664h),a		;bfcd
	ret			;bfd0
L_BFD1:
	ld hl,0c608h		;bfd1
	dec (hl)			;bfd4
	ld a,059h		;bfd5
	jp z,04127h		;bfd7
	ld a,(hl)			;bfda
	dec a			;bfdb
	ret z			;bfdc
	xor a			;bfdd
	ld (0c151h),a		;bfde
	inc a			;bfe1
	ld (0c660h),a		;bfe2
	ret			;bfe5

; ----------------------------------------------------------------------
; DATOS relleno_ff: 26 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (26 bytes)
;   0xbfe6..0xc000  (26 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff6  ..........
