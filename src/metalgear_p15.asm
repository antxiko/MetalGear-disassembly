; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 15 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS metafichas_juego_5_cola: las 96 metafichas del juego 5, 4 x 4 numeros
;   de ficha (16 bytes) cada una; el numero de la sala es 1-96 (p00:4CC3 resta
;   1); lo que las salas de ese juego usan como mucho (sigue del banco 14); lo
;   leen p00:4CC3 (1456 bytes)
;   0xa000..0xa5b0  (1456 bytes)
DATA_metafichas_juego_5_cola:
	defb 034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h	; a000  4444444444444444
	defb 047h,048h,049h,030h,04ah,04bh,04ch,030h,030h,030h,030h,030h,031h,031h,031h,031h	; a010  GHI0JKL000001111
	defb 014h,020h,030h,030h,014h,021h,030h,030h,014h,022h,030h,030h,014h,023h,031h,031h	; a020  . 00.!00."00.#11
	defb 030h,030h,030h,030h,030h,030h,030h,030h,030h,030h,030h,030h,031h,031h,031h,031h	; a030  0000000000001111
	defb 030h,030h,024h,013h,030h,030h,025h,013h,030h,030h,026h,013h,031h,031h,027h,013h	; a040  00$.00%.00&.11'.
	defb 014h,033h,035h,035h,014h,033h,035h,034h,014h,033h,035h,034h,014h,033h,035h,034h	; a050  .355.354.354.354
	defb 014h,033h,035h,034h,014h,033h,035h,034h,014h,033h,035h,034h,014h,017h,017h,017h	; a060  .354.354.354....
	defb 034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,017h,017h,017h,017h	; a070  444444444444....
	defb 034h,034h,032h,013h,034h,034h,032h,013h,034h,034h,032h,013h,017h,017h,017h,013h	; a080  442.442.442.....
	defb 035h,035h,032h,013h,034h,034h,032h,013h,034h,034h,032h,013h,034h,034h,032h,013h	; a090  552.442.442.442.
	defb 034h,034h,018h,013h,034h,034h,019h,013h,034h,034h,01ah,013h,034h,034h,01bh,013h	; a0a0  44..44..44..44..
	defb 014h,01ch,034h,034h,014h,01dh,034h,034h,014h,01eh,034h,034h,014h,01fh,034h,034h	; a0b0  ..44..44..44..44
	defb 034h,034h,037h,035h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h	; a0c0  4475444444444444
	defb 035h,035h,035h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h	; a0d0  5554444444444444
	defb 034h,034h,032h,013h,034h,034h,032h,013h,034h,034h,032h,013h,034h,034h,032h,013h	; a0e0  442.442.442.442.
	defb 014h,033h,036h,034h,014h,033h,035h,034h,014h,033h,035h,034h,014h,033h,035h,034h	; a0f0  .364.354.354.354
	defb 034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,013h	; a100  444444444444444.
	defb 034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,014h,034h,034h,034h	; a110  444444444444.444
	defb 035h,035h,028h,030h,034h,034h,029h,030h,034h,034h,02ah,030h,034h,034h,02bh,031h	; a120  55(044)044*044+1
	defb 014h,033h,035h,034h,014h,033h,035h,034h,014h,033h,035h,034h,014h,033h,035h,034h	; a130  .354.354.354.354
	defb 037h,035h,035h,035h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h	; a140  7555444444444444
	defb 035h,035h,035h,035h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h	; a150  5555444444444444
	defb 035h,035h,035h,035h,034h,034h,034h,034h,034h,039h,039h,039h,034h,039h,039h,039h	; a160  5555444449994999
	defb 030h,02ch,035h,035h,030h,02dh,035h,034h,030h,02eh,035h,034h,031h,02fh,035h,034h	; a170  0,550-540.541/54
	defb 002h,002h,002h,013h,002h,002h,002h,013h,002h,002h,002h,013h,002h,002h,002h,013h	; a180  ................
	defb 014h,002h,002h,002h,014h,002h,002h,002h,014h,002h,002h,002h,014h,002h,002h,002h	; a190  ................
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; a1a0  ................
	defb 04dh,04eh,04eh,04fh,050h,068h,068h,052h,053h,054h,055h,056h,057h,058h,059h,05ah	; a1b0  MNNOPhhRSTUVWXYZ
	defb 04dh,04eh,04eh,04fh,050h,068h,068h,052h,053h,038h,038h,056h,057h,035h,035h,05ah	; a1c0  MNNOPhhRS88VW55Z
	defb 034h,034h,00ch,013h,034h,034h,00dh,013h,036h,034h,00eh,013h,035h,034h,00fh,015h	; a1d0  44..44..64..54..
	defb 035h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h	; a1e0  5444444444444444
	defb 034h,034h,034h,034h,034h,034h,034h,034h,036h,034h,034h,034h,035h,034h,034h,034h	; a1f0  4444444464445444
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,017h,017h,017h,017h	; a200  ................
	defb 035h,034h,001h,015h,035h,034h,010h,015h,035h,034h,011h,015h,035h,034h,012h,013h	; a210  54..54..54..54..
	defb 030h,030h,030h,030h,094h,030h,030h,030h,095h,030h,030h,030h,031h,031h,031h,031h	; a220  0000.000.0001111
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h	; a230  ................
	defb 034h,034h,034h,034h,036h,034h,034h,034h,035h,034h,034h,034h,035h,034h,034h,034h	; a240  4444644454445444
	defb 035h,035h,035h,035h,034h,034h,034h,034h,036h,039h,039h,039h,035h,039h,039h,039h	; a250  5555444469995999
	defb 014h,033h,036h,034h,014h,033h,035h,034h,014h,033h,035h,034h,014h,017h,017h,017h	; a260  .364.354.354....
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,017h,017h,017h,017h	; a270  ................
	defb 035h,035h,035h,035h,035h,034h,034h,034h,035h,034h,034h,034h,035h,034h,034h,034h	; a280  5555544454445444
	defb 035h,034h,034h,034h,035h,034h,034h,034h,035h,034h,034h,034h,035h,034h,034h,034h	; a290  5444544454445444
	defb 037h,035h,035h,035h,034h,034h,034h,034h,034h,034h,034h,034h,017h,017h,017h,017h	; a2a0  755544444444....
	defb 035h,035h,032h,013h,034h,034h,032h,013h,036h,034h,032h,013h,035h,034h,032h,013h	; a2b0  552.442.642.542.
	defb 035h,034h,032h,013h,035h,034h,032h,013h,035h,034h,032h,013h,035h,034h,032h,013h	; a2c0  542.542.542.542.
	defb 035h,034h,032h,013h,035h,034h,032h,013h,035h,034h,032h,013h,017h,017h,017h,013h	; a2d0  542.542.542.....
	defb 035h,035h,035h,035h,034h,034h,034h,034h,036h,034h,034h,034h,035h,034h,034h,034h	; a2e0  5555444464445444
	defb 014h,005h,035h,035h,014h,006h,035h,034h,014h,007h,035h,034h,016h,008h,035h,034h	; a2f0  ..55..54..54..54
	defb 035h,035h,00ch,013h,034h,034h,00dh,013h,034h,034h,00eh,013h,034h,034h,00fh,015h	; a300  55..44..44..44..
	defb 0a0h,0a1h,0d1h,0d0h,0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h,035h,035h,035h,035h	; a310  ............5555
	defb 014h,033h,0a0h,0d0h,014h,033h,0a4h,0d4h,014h,033h,0a6h,0d6h,014h,033h,035h,035h	; a320  .3...3...3...355
	defb 0a0h,0a1h,0d1h,0d0h,0a4h,0a5h,0d5h,0d4h,0d1h,0d0h,0d7h,0d6h,0d3h,0d2h,035h,035h	; a330  ..............55
	defb 0a0h,0d0h,032h,013h,0a4h,0d4h,032h,013h,0a6h,0d6h,032h,013h,035h,035h,032h,013h	; a340  ..2...2...2.552.
	defb 0d5h,0d4h,035h,034h,0d1h,0d0h,035h,034h,0d3h,0d2h,035h,034h,017h,017h,017h,017h	; a350  ..54..54..54....
	defb 0a0h,0a1h,0d1h,0d0h,0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0a0h,0a1h,035h,035h,0a2h,0a3h	; a360  ............55..
	defb 034h,034h,0a4h,0a5h,034h,034h,0a0h,0a1h,034h,034h,0a2h,0a3h,017h,017h,017h,017h	; a370  44..44..44......
	defb 035h,035h,035h,035h,034h,034h,034h,034h,034h,034h,034h,034h,017h,017h,017h,017h	; a380  555544444444....
	defb 014h,01ch,034h,034h,014h,01dh,034h,034h,014h,01eh,034h,034h,017h,017h,017h,017h	; a390  ..44..44..44....
	defb 035h,034h,032h,013h,034h,034h,032h,013h,034h,034h,032h,013h,017h,017h,017h,013h	; a3a0  542.442.442.....
	defb 034h,034h,032h,013h,034h,034h,032h,013h,036h,034h,032h,013h,035h,034h,032h,013h	; a3b0  442.442.642.542.
	defb 035h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,034h,017h,017h,017h,017h	; a3c0  544444444444....
	defb 028h,030h,030h,030h,029h,030h,030h,030h,02ah,030h,030h,030h,02bh,031h,031h,031h	; a3d0  (000)000*000+111
	defb 030h,030h,030h,02ch,030h,030h,030h,02dh,030h,030h,030h,02eh,031h,031h,031h,02fh	; a3e0  000,000-000.111/
	defb 034h,034h,018h,013h,034h,034h,019h,013h,034h,034h,01ah,013h,017h,017h,017h,017h	; a3f0  44..44..44......
	defb 0a0h,0d0h,032h,013h,0a2h,0d2h,032h,013h,0a4h,0d4h,032h,013h,0a6h,0d6h,032h,013h	; a400  ..2...2...2...2.
	defb 014h,033h,0a0h,0d0h,014h,033h,0a2h,0d2h,014h,033h,0a4h,0d4h,014h,033h,0a6h,0d6h	; a410  .3...3...3...3..
	defb 0a0h,0d0h,032h,013h,0a2h,0d2h,032h,013h,0a4h,0d4h,032h,013h,017h,017h,017h,013h	; a420  ..2...2...2.....
	defb 067h,068h,068h,03bh,069h,06ah,06fh,079h,05bh,06bh,06ch,06dh,05bh,070h,071h,072h	; a430  ghh.ijoy[klm[pqr
	defb 067h,068h,068h,03bh,03dh,03eh,06fh,079h,06eh,06ch,06ch,06dh,071h,072h,071h,072h	; a440  ghh.=>oynllmqrqr
	defb 067h,068h,068h,03bh,03dh,03eh,07ah,03ch,06eh,06ch,07bh,05fh,071h,072h,033h,05fh	; a450  ghh.=>z<nl{_qr3_
	defb 045h,045h,03ah,045h,045h,045h,03ah,045h,045h,045h,03ah,045h,045h,045h,03ah,045h	; a460  EE:EEE:EEE:EEE:E
	defb 05bh,073h,074h,075h,05bh,076h,077h,078h,05bh,033h,044h,044h,05bh,033h,045h,045h	; a470  [stu[vwx[3DD[3EE
	defb 074h,075h,074h,075h,077h,078h,077h,078h,044h,044h,043h,044h,045h,045h,03ah,045h	; a480  tutuwxwxDDCDEE:E
	defb 074h,075h,033h,05fh,077h,078h,033h,05fh,044h,044h,033h,05fh,045h,045h,033h,05fh	; a490  tu3_wx3_DD3_EE3_
	defb 045h,045h,03ah,045h,045h,045h,03ah,045h,045h,045h,03ah,045h,045h,045h,03ah,046h	; a4a0  EE:EEE:EEE:EEE:F
	defb 045h,045h,03ah,046h,045h,045h,03ah,046h,045h,045h,03ah,046h,045h,045h,03ah,046h	; a4b0  EE:FEE:FEE:FEE:F
	defb 05bh,033h,045h,045h,05bh,033h,045h,045h,05bh,033h,045h,045h,05bh,033h,045h,045h	; a4c0  [3EE[3EE[3EE[3EE
	defb 05bh,040h,045h,045h,05bh,041h,045h,045h,05bh,041h,045h,045h,05bh,042h,045h,045h	; a4d0  [@EE[AEE[AEE[BEE
	defb 074h,075h,074h,075h,077h,078h,077h,078h,044h,084h,085h,086h,044h,089h,08ah,08bh	; a4e0  tutuwxwxD...D...
	defb 074h,075h,074h,075h,077h,078h,077h,078h,087h,088h,043h,044h,08ch,051h,03ah,045h	; a4f0  tutuwxwx..CD.Q:E
	defb 046h,046h,03ah,045h,046h,046h,03ah,045h,046h,046h,03ah,045h,045h,045h,03ah,045h	; a500  FF:EFF:EFF:EEE:E
	defb 045h,045h,07ch,05fh,045h,045h,07dh,05fh,045h,045h,07eh,05fh,046h,046h,07fh,03fh	; a510  EE|_EE}_EE~_FF.?
	defb 05bh,033h,045h,045h,05bh,033h,074h,075h,05ch,05dh,05eh,060h,064h,065h,062h,063h	; a520  [3EE[3tu\]^`debc
	defb 045h,045h,03ah,045h,074h,075h,074h,075h,05ch,060h,05eh,060h,064h,065h,062h,063h	; a530  EE:Etutu\`^`debc
	defb 045h,045h,033h,05fh,074h,075h,033h,05fh,05ch,060h,061h,066h,064h,065h,062h,063h	; a540  EE3_tu3_\`afdebc
	defb 046h,046h,080h,03fh,046h,046h,081h,03fh,046h,046h,082h,03fh,046h,046h,083h,05fh	; a550  FF.?FF.?FF.?FF._
	defb 034h,034h,028h,030h,034h,034h,029h,030h,034h,034h,02ah,030h,034h,034h,02bh,031h	; a560  44(044)044*044+1
	defb 035h,035h,0a0h,0d0h,034h,034h,0a2h,0d2h,034h,034h,0a4h,0d4h,034h,034h,0a6h,0d6h	; a570  55..44..44..44..
	defb 034h,034h,0a0h,0d0h,034h,034h,0a2h,0d2h,034h,034h,0a4h,0d4h,034h,034h,0a6h,0d6h	; a580  44..44..44..44..
	defb 0a0h,0d0h,035h,035h,0a2h,0d2h,035h,034h,0a4h,0d4h,035h,034h,0a6h,0d6h,035h,034h	; a590  ..55..54..54..54
	defb 0a0h,0d0h,035h,034h,0a2h,0d2h,035h,034h,0a4h,0d4h,035h,034h,0a6h,0d6h,035h,034h	; a5a0  ..54..54..54..54

; ----------------------------------------------------------------------
; DATOS metafichas_juego_6: las 21 metafichas del juego 6, 4 x 4 numeros de
;   ficha (16 bytes) cada una; el numero de la sala es 1-21 (p00:4CC3 resta
;   1); lo que las salas de ese juego usan como mucho; lo leen p00:4CC3 (336
;   bytes)
;   0xa5b0..0xa700  (336 bytes)
DATA_metafichas_juego_6:
	defb 003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; a5b0  ................
	defb 003h,003h,005h,004h,003h,003h,005h,004h,003h,003h,005h,004h,003h,003h,005h,004h	; a5c0  ................
	defb 003h,003h,003h,003h,003h,003h,003h,003h,006h,006h,006h,006h,008h,008h,008h,008h	; a5d0  ................
	defb 003h,003h,005h,004h,003h,003h,005h,004h,006h,006h,006h,004h,008h,008h,008h,004h	; a5e0  ................
	defb 006h,006h,0a0h,0d0h,008h,008h,0a2h,0d2h,008h,008h,0a4h,0d4h,00ah,00ah,0a6h,0d6h	; a5f0  ................
	defb 013h,00bh,00ch,00dh,003h,003h,012h,013h,007h,003h,003h,003h,009h,003h,003h,003h	; a600  ................
	defb 00eh,00fh,010h,011h,014h,015h,016h,017h,012h,018h,019h,01ah,003h,01bh,01ch,01dh	; a610  ................
	defb 003h,01eh,01fh,020h,003h,021h,022h,023h,007h,024h,025h,026h,009h,027h,028h,029h	; a620  ... .!"#.$%&.'()
	defb 009h,02ah,02bh,02ch,003h,003h,02dh,02eh,003h,003h,003h,02fh,003h,003h,003h,003h	; a630  .*+,..-..../....
	defb 051h,050h,04fh,04eh,057h,056h,055h,054h,05ah,059h,058h,052h,05dh,05ch,05bh,003h	; a640  QPONWVUTZYXR]\[.
	defb 04dh,04ch,04bh,053h,053h,052h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; a650  MLKSSR..........
	defb 060h,05fh,05eh,003h,063h,062h,061h,003h,066h,065h,064h,003h,069h,068h,067h,003h	; a660  `_^.cba.fed.ihg.
	defb 06ch,06bh,06ah,003h,06eh,06dh,003h,003h,06fh,003h,003h,003h,003h,003h,003h,003h	; a670  lkj.nm..o.......
	defb 0a0h,0a1h,0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,0a6h,0a7h,0d7h,0d6h	; a680  ................
	defb 009h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; a690  ................
	defb 003h,003h,013h,009h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; a6a0  ................
	defb 009h,009h,009h,009h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; a6b0  ................
	defb 0a0h,0d0h,005h,004h,0a2h,0d2h,005h,004h,0a4h,0d4h,005h,004h,0a6h,0d6h,005h,004h	; a6c0  ................
	defb 009h,009h,005h,004h,003h,003h,005h,004h,003h,003h,005h,004h,003h,003h,005h,004h	; a6d0  ................
	defb 013h,009h,009h,009h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; a6e0  ................
	defb 003h,003h,003h,003h,003h,003h,003h,003h,007h,003h,003h,003h,009h,003h,003h,003h	; a6f0  ................

; ----------------------------------------------------------------------
; DATOS a700: 32 bytes que leen p01:7778 (0xA700) y p01:7C44 (0xA710); lo leen
;   p01:7778, p01:7C44 (32 bytes)
;   0xa700..0xa720  (32 bytes)
DATA_a700:
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; a700  ................
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a710  ................

; ----------------------------------------------------------------------
; DATOS fichas_de_tipo_de_puerta: 20 fichas de 8 bytes, una por numero de
;   puerta (p00:445D lee 0xA720 + 8 x (puerta - 1)): 4 parejas de
;   desplazamiento que suma a la posicion de la puerta; lo leen p00:445D (160
;   bytes)
;   0xa720..0xa7c0  (160 bytes)
DATA_fichas_de_tipo_de_puerta:
	defb 020h,008h,004h,010h,010h,010h,000h,020h	; a720   ......
	defb 0f8h,008h,008h,010h,000h,008h,000h,020h	; a728  .......
	defb 028h,010h,008h,00ah,01ch,024h,000h,008h	; a730  (....$..
	defb 028h,010h,0f6h,00ah,01ch,024h,000h,008h	; a738  (....$..
	defb 020h,008h,004h,010h,010h,010h,000h,020h	; a740   ......
	defb 018h,010h,0f8h,010h,018h,010h,008h,010h	; a748  ........
	defb 0f6h,020h,000h,020h,000h,008h,000h,020h	; a750  . . ...
	defb 0f6h,012h,000h,020h,000h,008h,000h,020h	; a758  ... ...
	defb 010h,040h,000h,01ah,020h,020h,008h,008h	; a760  .@..  ..
	defb 010h,040h,0f6h,02ah,020h,020h,000h,008h	; a768  .@.*  ..
	defb 010h,030h,000h,02ah,020h,020h,018h,008h	; a770  .0.*  ..
	defb 020h,008h,008h,010h,010h,010h,000h,020h	; a778   ......
	defb 0f6h,012h,008h,010h,000h,008h,000h,020h	; a780  .......
	defb 020h,010h,000h,01ah,020h,020h,008h,008h	; a788   ...  ..
	defb 020h,010h,0f6h,01ah,020h,020h,000h,008h	; a790   ...  ..
	defb 030h,02ah,010h,020h,038h,010h,010h,020h	; a798  0*. 8..
	defb 010h,030h,0f6h,01ah,020h,020h,000h,008h	; a7a0  .0..  ..
	defb 010h,030h,0f6h,02ah,020h,020h,000h,008h	; a7a8  .0.*  ..
	defb 010h,018h,000h,02ah,0d0h,010h,000h,020h	; a7b0  ...*...
	defb 028h,010h,008h,008h,0f0h,040h,000h,008h	; a7b8  (....@..

; ----------------------------------------------------------------------
; DATOS indice_de_puertas_por_sala: 236 punteros, salas 0-0xE0 y 0xF0-0xFA
;   (que restan 0xF: p00:440C), a las puertas de cada sala (p00:4411 ->
;   L_42B4); lo leen p00:4411 (472 bytes)
;   0xa7c0..0xa998  (472 bytes)
DATA_indice_de_puertas_por_sala:
	defw 0b045h,0b045h,0b045h,0a998h,0b045h,0a99eh,0a9b8h,0a9c8h	; a7c0
	defw 0a9e2h,0a9e8h,0aa02h,0aa08h,0b045h,0aa13h,0aa1eh,0aa24h	; a7d0
	defw 0aa2ah,0aa35h,0b045h,0aa40h,0aa46h,0aa56h,0aa61h,0aa6ch	; a7e0
	defw 0aa72h,0b045h,0b045h,0aa78h,0aa7eh,0aa8eh,0aa99h,0aaa4h	; a7f0
	defw 0aaaah,0aab5h,0b045h,0aac0h,0aacbh,0b045h,0aad6h,0aadch	; a800
	defw 0aae2h,0aae8h,0aaeeh,0b045h,0b045h,0b045h,0b045h,0b045h	; a810
	defw 0b045h,0b045h,0b045h,0aaf4h,0b045h,0aafah,0ab00h,0ab0bh	; a820
	defw 0ab16h,0ab1ch,0ab2ch,0ab3ch,0ab42h,0ab48h,0ab4eh,0ab54h	; a830
	defw 0ab5fh,0ab6fh,0b045h,0b045h,0b045h,0ab7fh,0ab85h,0ab95h	; a840
	defw 0aba0h,0ababh,0abb6h,0abbch,0abc7h,0b045h,0abd2h,0abd8h	; a850
	defw 0b045h,0abdeh,0abe9h,0abf9h,0ac13h,0ac1eh,0ac24h,0ac34h	; a860
	defw 0ac3fh,0ac4ah,0b045h,0b045h,0ac50h,0ac56h,0ac66h,0ac6ch	; a870
	defw 0ac77h,0b045h,0ac82h,0ac92h,0aca7h,0acb2h,0acbdh,0b045h	; a880
	defw 0acc3h,0b045h,0b045h,0b045h,0acech,0acfch,0ad02h,0ad0dh	; a890
	defw 0ad13h,0ad23h,0ad2eh,0ad39h,0ad49h,0ad4fh,0ad55h,0ad5bh	; a8a0
	defw 0b045h,0b045h,0ad66h,0ad6ch,0b045h,0ad72h,0ad78h,0ad7eh	; a8b0
	defw 0ad84h,0ad8ah,0ad90h,0ad96h,0ad9ch,0ada2h,0ada8h,0adaeh	; a8c0
	defw 0adb4h,0adbah,0adc0h,0adc6h,0adcch,0add2h,0adddh,0adf2h	; a8d0
	defw 0adf8h,0adfeh,0ae04h,0ae0ah,0ae10h,0ae1bh,0ae26h,0ae31h	; a8e0
	defw 0ae37h,0ae3dh,0ae48h,0b045h,0ae53h,0ae59h,0ae5fh,0ae65h	; a8f0
	defw 0ae6bh,0ae71h,0ae77h,0ae7dh,0ae83h,0ae8eh,0ae94h,0ae9fh	; a900
	defw 0aea5h,0aeabh,0aeb1h,0aeb7h,0aebdh,0aec3h,0aec9h,0aecfh	; a910
	defw 0aed5h,0aedbh,0aee1h,0aee7h,0aeedh,0aef3h,0aef9h,0aeffh	; a920
	defw 0af05h,0af0bh,0af11h,0af17h,0af1dh,0af28h,0af33h,0af39h	; a930
	defw 0af3fh,0af45h,0af4bh,0af51h,0af57h,0af5dh,0af63h,0af69h	; a940
	defw 0af6fh,0af75h,0af7bh,0af81h,0af87h,0af97h,0afa2h,0afadh	; a950
	defw 0b045h,0b045h,0b045h,0b045h,0b045h,0afb8h,0afbeh,0afc4h	; a960
	defw 0afcah,0afd0h,0afd6h,0afdch,0b045h,0b045h,0b045h,0b045h	; a970
	defw 0afe2h,0afe8h,0aff3h,0b003h,0b00eh,0b01eh,0b024h,0b034h	; a980
	defw 0b03ah,0b045h,0b045h,0b040h	; a990  -> DATA_puertas_de_la_sala_232 0xb045 0xb045 DATA_puertas_de_la_sala_235

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_3: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xa998..0xa99e  (6 bytes)
DATA_puertas_de_la_sala_3:
	defb 002h,005h,000h,064h,0f0h	; a998
	defb 0ffh	; a99d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_5: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (26 bytes)
;   0xa99e..0xa9b8  (26 bytes)
DATA_puertas_de_la_sala_5:
	defb 065h,001h,044h,024h,07eh	; a99e
	defb 06dh,001h,064h,064h,07fh	; a9a3
	defb 071h,001h,044h,0a4h,080h	; a9a8
	defb 075h,001h,044h,024h,0c7h	; a9ad
	defb 06ch,002h,020h,060h,0cch	; a9b2
	defb 0ffh	; a9b7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_6: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xa9b8..0xa9c8  (16 bytes)
DATA_puertas_de_la_sala_6:
	defb 003h,001h,040h,024h,081h	; a9b8
	defb 004h,001h,000h,0c4h,007h	; a9bd
	defb 040h,002h,0a0h,080h,0cch	; a9c2
	defb 0ffh	; a9c7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_7: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (26 bytes)
;   0xa9c8..0xa9e2  (26 bytes)
DATA_puertas_de_la_sala_7:
	defb 004h,002h,0b8h,0c0h,006h	; a9c8
	defb 076h,001h,084h,024h,082h	; a9cd
	defb 005h,004h,060h,0f0h,00bh	; a9d2
	defb 077h,001h,064h,044h,083h	; a9d7
	defb 078h,001h,064h,064h,084h	; a9dc
	defb 0ffh	; a9e1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_8: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xa9e2..0xa9e8  (6 bytes)
DATA_puertas_de_la_sala_8:
	defb 001h,001h,040h,044h,08ah	; a9e2
	defb 0ffh	; a9e7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_9: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (26 bytes)
;   0xa9e8..0xaa02  (26 bytes)
DATA_puertas_de_la_sala_9:
	defb 074h,001h,064h,0a4h,087h	; a9e8
	defb 075h,001h,064h,024h,0c7h	; a9ed
	defb 085h,001h,064h,024h,0adh	; a9f2
	defb 092h,001h,064h,024h,0d5h	; a9f7
	defb 098h,001h,064h,024h,0dbh	; a9fc
	defb 0ffh	; aa01

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_10: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaa02..0xaa08  (6 bytes)
DATA_puertas_de_la_sala_10:
	defb 007h,001h,040h,084h,085h	; aa02
	defb 0ffh	; aa07

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_11: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa08..0xaa13  (11 bytes)
DATA_puertas_de_la_sala_11:
	defb 005h,003h,060h,008h,007h	; aa08
	defb 006h,001h,000h,064h,040h	; aa0d
	defb 0ffh	; aa12

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_13: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa13..0xaa1e  (11 bytes)
DATA_puertas_de_la_sala_13:
	defb 008h,003h,060h,028h,088h	; aa13
	defb 009h,004h,040h,0b0h,089h	; aa18
	defb 0ffh	; aa1d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_14: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaa1e..0xaa24  (6 bytes)
DATA_puertas_de_la_sala_14:
	defb 00ah,003h,040h,048h,086h	; aa1e
	defb 0ffh	; aa23

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_15: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaa24..0xaa2a  (6 bytes)
DATA_puertas_de_la_sala_15:
	defb 00bh,005h,000h,084h,0f1h	; aa24
	defb 0ffh	; aa29

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_16: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa2a..0xaa35  (11 bytes)
DATA_puertas_de_la_sala_16:
	defb 015h,001h,060h,044h,08bh	; aa2a
	defb 016h,004h,060h,0f0h,014h	; aa2f
	defb 0ffh	; aa34

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_17: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa35..0xaa40  (11 bytes)
DATA_puertas_de_la_sala_17:
	defb 017h,004h,040h,0d0h,0c3h	; aa35
	defb 079h,003h,020h,048h,08ch	; aa3a
	defb 0ffh	; aa3f

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_19: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaa40..0xaa46  (6 bytes)
DATA_puertas_de_la_sala_19:
	defb 07ah,001h,040h,084h,08dh	; aa40
	defb 0ffh	; aa45

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_20: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xaa46..0xaa56  (16 bytes)
DATA_puertas_de_la_sala_20:
	defb 019h,004h,060h,0f0h,016h	; aa46
	defb 016h,003h,060h,008h,010h	; aa4b
	defb 09bh,001h,000h,044h,08fh	; aa50
	defb 0ffh	; aa55

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_21: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa56..0xaa61  (11 bytes)
DATA_puertas_de_la_sala_21:
	defb 07ch,001h,060h,044h,08eh	; aa56
	defb 07dh,001h,060h,0a4h,08eh	; aa5b
	defb 0ffh	; aa60

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_22: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa61..0xaa6c  (11 bytes)
DATA_puertas_de_la_sala_22:
	defb 019h,003h,060h,008h,014h	; aa61
	defb 01ah,001h,080h,064h,090h	; aa66
	defb 0ffh	; aa6b

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_23: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaa6c..0xaa72  (6 bytes)
DATA_puertas_de_la_sala_23:
	defb 018h,003h,040h,028h,08eh	; aa6c
	defb 0ffh	; aa71

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_24: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaa72..0xaa78  (6 bytes)
DATA_puertas_de_la_sala_24:
	defb 01bh,001h,000h,044h,091h	; aa72
	defb 0ffh	; aa77

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_27: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaa78..0xaa7e  (6 bytes)
DATA_puertas_de_la_sala_27:
	defb 01ch,005h,000h,084h,0f1h	; aa78
	defb 0ffh	; aa7d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_28: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xaa7e..0xaa8e  (16 bytes)
DATA_puertas_de_la_sala_28:
	defb 01dh,003h,060h,028h,092h	; aa7e
	defb 01eh,003h,020h,028h,093h	; aa83
	defb 01fh,001h,000h,0c4h,01dh	; aa88
	defb 0ffh	; aa8d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_29: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa8e..0xaa99  (11 bytes)
DATA_puertas_de_la_sala_29:
	defb 01fh,002h,0b8h,0c0h,01ch	; aa8e
	defb 020h,003h,060h,008h,094h	; aa93
	defb 0ffh	; aa98

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_30: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaa99..0xaaa4  (11 bytes)
DATA_puertas_de_la_sala_30:
	defb 021h,004h,040h,0d0h,098h	; aa99
	defb 07eh,003h,060h,028h,095h	; aa9e
	defb 0ffh	; aaa3

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_31: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaaa4..0xaaaa  (6 bytes)
DATA_puertas_de_la_sala_31:
	defb 022h,005h,000h,064h,0f0h	; aaa4
	defb 0ffh	; aaa9

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_32: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaaaa..0xaab5  (11 bytes)
DATA_puertas_de_la_sala_32:
	defb 07fh,001h,060h,024h,099h	; aaaa
	defb 080h,003h,020h,068h,099h	; aaaf
	defb 0ffh	; aab4

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_33: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaab5..0xaac0  (11 bytes)
DATA_puertas_de_la_sala_33:
	defb 023h,001h,080h,064h,096h	; aab5
	defb 026h,004h,060h,0f0h,023h	; aaba
	defb 0ffh	; aabf

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_35: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaac0..0xaacb  (11 bytes)
DATA_puertas_de_la_sala_35:
	defb 026h,003h,060h,008h,021h	; aac0
	defb 027h,001h,000h,044h,09ch	; aac5
	defb 0ffh	; aaca

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_36: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaacb..0xaad6  (11 bytes)
DATA_puertas_de_la_sala_36:
	defb 028h,001h,040h,024h,09eh	; aacb
	defb 029h,001h,080h,0c4h,09dh	; aad0
	defb 0ffh	; aad5

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_38: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaad6..0xaadc  (6 bytes)
DATA_puertas_de_la_sala_38:
	defb 02ah,004h,040h,0d0h,09fh	; aad6
	defb 0ffh	; aadb

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_39: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaadc..0xaae2  (6 bytes)
DATA_puertas_de_la_sala_39:
	defb 02bh,005h,000h,084h,0f2h	; aadc
	defb 0ffh	; aae1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_40: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaae2..0xaae8  (6 bytes)
DATA_puertas_de_la_sala_40:
	defb 02ch,001h,060h,024h,0a0h	; aae2
	defb 0ffh	; aae7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_41: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaae8..0xaaee  (6 bytes)
DATA_puertas_de_la_sala_41:
	defb 02dh,004h,040h,050h,0a1h	; aae8
	defb 0ffh	; aaed

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_42: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaaee..0xaaf4  (6 bytes)
DATA_puertas_de_la_sala_42:
	defb 082h,004h,020h,090h,0a2h	; aaee
	defb 0ffh	; aaf3

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_51: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaaf4..0xaafa  (6 bytes)
DATA_puertas_de_la_sala_51:
	defb 02eh,001h,040h,0c4h,0a3h	; aaf4
	defb 0ffh	; aaf9

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_53: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xaafa..0xab00  (6 bytes)
DATA_puertas_de_la_sala_53:
	defb 02fh,005h,000h,084h,0f2h	; aafa
	defb 0ffh	; aaff

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_54: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xab00..0xab0b  (11 bytes)
DATA_puertas_de_la_sala_54:
	defb 00ch,00ch,080h,060h,0a4h	; ab00
	defb 00dh,001h,000h,044h,037h	; ab05
	defb 0ffh	; ab0a

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_55: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xab0b..0xab16  (11 bytes)
DATA_puertas_de_la_sala_55:
	defb 00dh,002h,0b8h,040h,036h	; ab0b
	defb 00eh,001h,060h,084h,0a6h	; ab10
	defb 0ffh	; ab15

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_56: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xab16..0xab1c  (6 bytes)
DATA_puertas_de_la_sala_56:
	defb 083h,001h,000h,0a4h,07bh	; ab16
	defb 0ffh	; ab1b

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_57: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xab1c..0xab2c  (16 bytes)
DATA_puertas_de_la_sala_57:
	defb 00fh,004h,040h,0f0h,03ah	; ab1c
	defb 09ah,002h,0b8h,080h,0a8h	; ab21
	defb 04ah,002h,0b8h,020h,07ah	; ab26
	defb 0ffh	; ab2b

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_58: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xab2c..0xab3c  (16 bytes)
DATA_puertas_de_la_sala_58:
	defb 00fh,003h,040h,008h,039h	; ab2c
	defb 011h,002h,0b8h,0a0h,0abh	; ab31
	defb 08ch,00ah,000h,030h,03ah	; ab36
	defb 0ffh	; ab3b

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_59: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xab3c..0xab42  (6 bytes)
DATA_puertas_de_la_sala_59:
	defb 010h,009h,020h,000h,0a9h	; ab3c
	defb 0ffh	; ab41

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_60: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xab42..0xab48  (6 bytes)
DATA_puertas_de_la_sala_60:
	defb 08eh,007h,078h,0e0h,03ch	; ab42
	defb 0ffh	; ab47

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_61: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xab48..0xab4e  (6 bytes)
DATA_puertas_de_la_sala_61:
	defb 012h,008h,0b8h,060h,0ach	; ab48
	defb 0ffh	; ab4d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_62: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xab4e..0xab54  (6 bytes)
DATA_puertas_de_la_sala_62:
	defb 013h,003h,040h,008h,0aah	; ab4e
	defb 0ffh	; ab53

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_63: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xab54..0xab5f  (11 bytes)
DATA_puertas_de_la_sala_63:
	defb 08dh,00bh,060h,070h,03fh	; ab54
	defb 014h,005h,000h,084h,0f1h	; ab59
	defb 0ffh	; ab5e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_64: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xab5f..0xab6f  (16 bytes)
DATA_puertas_de_la_sala_64:
	defb 006h,002h,0b8h,060h,00bh	; ab5f
	defb 084h,001h,064h,024h,0aeh	; ab64
	defb 085h,001h,064h,044h,0adh	; ab69
	defb 0ffh	; ab6e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_65: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xab6f..0xab7f  (16 bytes)
DATA_puertas_de_la_sala_65:
	defb 086h,001h,064h,0c4h,0afh	; ab6f
	defb 096h,001h,064h,0c4h,0d9h	; ab74
	defb 094h,001h,064h,0c4h,0d7h	; ab79
	defb 0ffh	; ab7e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_69: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xab7f..0xab85  (6 bytes)
DATA_puertas_de_la_sala_69:
	defb 031h,001h,000h,084h,049h	; ab7f
	defb 0ffh	; ab84

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_70: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xab85..0xab95  (16 bytes)
DATA_puertas_de_la_sala_70:
	defb 032h,001h,000h,024h,0b1h	; ab85
	defb 033h,001h,000h,064h,047h	; ab8a
	defb 034h,001h,000h,0a4h,0b0h	; ab8f
	defb 0ffh	; ab94

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_71: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xab95..0xaba0  (11 bytes)
DATA_puertas_de_la_sala_71:
	defb 033h,002h,0b8h,060h,046h	; ab95
	defb 035h,001h,000h,064h,048h	; ab9a
	defb 0ffh	; ab9f

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_72: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xaba0..0xabab  (11 bytes)
DATA_puertas_de_la_sala_72:
	defb 035h,002h,0b8h,060h,047h	; aba0
	defb 036h,005h,000h,064h,0f3h	; aba5
	defb 0ffh	; abaa

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_73: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xabab..0xabb6  (11 bytes)
DATA_puertas_de_la_sala_73:
	defb 031h,002h,0b8h,080h,045h	; abab
	defb 038h,004h,060h,0f0h,04ch	; abb0
	defb 0ffh	; abb5

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_74: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xabb6..0xabbc  (6 bytes)
DATA_puertas_de_la_sala_74:
	defb 037h,003h,060h,008h,0b2h	; abb6
	defb 0ffh	; abbb

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_75: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xabbc..0xabc7  (11 bytes)
DATA_puertas_de_la_sala_75:
	defb 039h,004h,080h,0b0h,0b3h	; abbc
	defb 03ah,001h,000h,084h,066h	; abc1
	defb 0ffh	; abc6

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_76: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xabc7..0xabd2  (11 bytes)
DATA_puertas_de_la_sala_76:
	defb 03bh,001h,020h,084h,0ceh	; abc7
	defb 038h,003h,060h,008h,049h	; abcc
	defb 0ffh	; abd1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_78: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xabd2..0xabd8  (6 bytes)
DATA_puertas_de_la_sala_78:
	defb 03ch,004h,040h,0f0h,0b4h	; abd2
	defb 0ffh	; abd7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_79: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xabd8..0xabde  (6 bytes)
DATA_puertas_de_la_sala_79:
	defb 087h,001h,000h,024h,0b5h	; abd8
	defb 0ffh	; abdd

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_81: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xabde..0xabe9  (11 bytes)
DATA_puertas_de_la_sala_81:
	defb 03dh,001h,080h,084h,0b6h	; abde
	defb 03eh,005h,000h,064h,0f3h	; abe3
	defb 0ffh	; abe8

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_82: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xabe9..0xabf9  (16 bytes)
DATA_puertas_de_la_sala_82:
	defb 041h,001h,000h,024h,053h	; abe9
	defb 044h,001h,000h,0c4h,053h	; abee
	defb 072h,001h,080h,084h,0cah	; abf3
	defb 0ffh	; abf8

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_83: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (26 bytes)
;   0xabf9..0xac13  (26 bytes)
DATA_puertas_de_la_sala_83:
	defb 041h,002h,0b8h,020h,052h	; abf9
	defb 042h,001h,000h,024h,054h	; abfe
	defb 043h,001h,000h,084h,054h	; ac03
	defb 044h,002h,0b8h,0c0h,052h	; ac08
	defb 045h,004h,060h,0f0h,056h	; ac0d
	defb 0ffh	; ac12

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_84: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xac13..0xac1e  (11 bytes)
DATA_puertas_de_la_sala_84:
	defb 042h,002h,0b8h,020h,053h	; ac13
	defb 043h,002h,0b8h,080h,053h	; ac18
	defb 0ffh	; ac1d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_85: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xac1e..0xac24  (6 bytes)
DATA_puertas_de_la_sala_85:
	defb 048h,001h,040h,084h,0cdh	; ac1e
	defb 0ffh	; ac23

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_86: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xac24..0xac34  (16 bytes)
DATA_puertas_de_la_sala_86:
	defb 045h,003h,060h,008h,053h	; ac24
	defb 046h,001h,000h,024h,0c6h	; ac29
	defb 049h,001h,020h,0c4h,0b9h	; ac2e
	defb 0ffh	; ac33

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_87: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xac34..0xac3f  (11 bytes)
DATA_puertas_de_la_sala_87:
	defb 047h,001h,000h,024h,0b7h	; ac34
	defb 04bh,001h,000h,0c4h,0b8h	; ac39
	defb 0ffh	; ac3e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_88: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xac3f..0xac4a  (11 bytes)
DATA_puertas_de_la_sala_88:
	defb 04ch,005h,000h,064h,0f4h	; ac3f
	defb 04dh,001h,080h,044h,0bah	; ac44
	defb 0ffh	; ac49

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_89: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xac4a..0xac50  (6 bytes)
DATA_puertas_de_la_sala_89:
	defb 04eh,001h,080h,0a4h,0bbh	; ac4a
	defb 0ffh	; ac4f

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_92: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xac50..0xac56  (6 bytes)
DATA_puertas_de_la_sala_92:
	defb 025h,001h,000h,084h,09ah	; ac50
	defb 0ffh	; ac55

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_93: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xac56..0xac66  (16 bytes)
DATA_puertas_de_la_sala_93:
	defb 030h,002h,0b8h,060h,07dh	; ac56
	defb 064h,011h,040h,0f0h,060h	; ac5b
	defb 088h,001h,060h,024h,0c4h	; ac60
	defb 0ffh	; ac65

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_94: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (6 bytes)
;   0xac66..0xac6c  (6 bytes)
DATA_puertas_de_la_sala_94:
	defb 050h,001h,080h,044h,0c5h	; ac66
	defb 0ffh	; ac6b

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_95: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xac6c..0xac77  (11 bytes)
DATA_puertas_de_la_sala_95:
	defb 051h,005h,000h,064h,0f3h	; ac6c
	defb 052h,004h,060h,0f0h,062h	; ac71
	defb 0ffh	; ac76

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_96: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (11 bytes)
;   0xac77..0xac82  (11 bytes)
DATA_puertas_de_la_sala_96:
	defb 055h,004h,060h,0f0h,063h	; ac77
	defb 064h,009h,040h,000h,05dh	; ac7c
	defb 0ffh	; ac81

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_98: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (16 bytes)
;   0xac82..0xac92  (16 bytes)
DATA_puertas_de_la_sala_98:
	defb 053h,001h,080h,044h,0bch	; ac82
	defb 054h,001h,060h,0c4h,0bdh	; ac87
	defb 052h,003h,060h,008h,05fh	; ac8c
	defb 0ffh	; ac91

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_99: fichas de 5 bytes [puerta][tipo][y][x][e] hasta
;   0xFF (la Y primero, como en los actores: el tercer byte no pasa de 184):
;   p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 y
;   de 0xB046); lo leen p00:441A (21 bytes)
;   0xac92..0xaca7  (21 bytes)
DATA_puertas_de_la_sala_99:
	defb 055h,003h,060h,008h,060h	; ac92
	defb 056h,001h,020h,024h,0cbh	; ac97
	defb 057h,001h,060h,084h,0cfh	; ac9c
	defb 058h,001h,000h,0c4h,064h	; aca1
	defb 0ffh	; aca6

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_100: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xaca7..0xacb2  (11 bytes)
DATA_puertas_de_la_sala_100:
	defb 058h,002h,0b8h,0c0h,063h	; aca7
	defb 090h,012h,000h,030h,064h	; acac
	defb 0ffh	; acb1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_101: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xacb2..0xacbd  (11 bytes)
DATA_puertas_de_la_sala_101:
	defb 089h,001h,060h,044h,0beh	; acb2
	defb 08ah,001h,040h,0c4h,0bfh	; acb7
	defb 0ffh	; acbc

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_102: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xacbd..0xacc3  (6 bytes)
DATA_puertas_de_la_sala_102:
	defb 03ah,002h,0b8h,080h,04bh	; acbd
	defb 0ffh	; acc2

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_104: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (41 bytes)
;   0xacc3..0xacec  (41 bytes)
DATA_puertas_de_la_sala_104:
	defb 059h,001h,000h,064h,06ch	; acc3
	defb 092h,001h,030h,008h,0d5h	; acc8
	defb 098h,001h,030h,0e8h,0dbh	; accd
	defb 093h,001h,030h,028h,0d6h	; acd2
	defb 094h,001h,030h,048h,0d7h	; acd7
	defb 095h,001h,030h,088h,0d8h	; acdc
	defb 096h,001h,030h,0a8h,0d9h	; ace1
	defb 097h,001h,030h,0c8h,0dah	; ace6
	defb 0ffh	; aceb

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_108: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (16 bytes)
;   0xacec..0xacfc  (16 bytes)
DATA_puertas_de_la_sala_108:
	defb 09ch,003h,060h,008h,0c9h	; acec
	defb 068h,010h,018h,0a0h,06ch	; acf1
	defb 059h,002h,0b8h,060h,068h	; acf6
	defb 0ffh	; acfb

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_109: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xacfc..0xad02  (6 bytes)
DATA_puertas_de_la_sala_109:
	defb 05ah,005h,000h,064h,0f7h	; acfc
	defb 0ffh	; ad01

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_110: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xad02..0xad0d  (11 bytes)
DATA_puertas_de_la_sala_110:
	defb 05ch,001h,000h,0c4h,0c1h	; ad02
	defb 08bh,001h,000h,024h,0c0h	; ad07
	defb 0ffh	; ad0c

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_111: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad0d..0xad13  (6 bytes)
DATA_puertas_de_la_sala_111:
	defb 05fh,001h,000h,0c4h,070h	; ad0d
	defb 0ffh	; ad12

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_112: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (16 bytes)
;   0xad13..0xad23  (16 bytes)
DATA_puertas_de_la_sala_112:
	defb 05fh,002h,0b8h,0c0h,06fh	; ad13
	defb 060h,001h,000h,0a4h,071h	; ad18
	defb 061h,013h,000h,028h,071h	; ad1d
	defb 0ffh	; ad22

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_113: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xad23..0xad2e  (11 bytes)
DATA_puertas_de_la_sala_113:
	defb 060h,002h,0b8h,0a0h,070h	; ad23
	defb 03fh,001h,000h,0c4h,072h	; ad28
	defb 0ffh	; ad2d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_114: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xad2e..0xad39  (11 bytes)
DATA_puertas_de_la_sala_114:
	defb 062h,001h,000h,024h,074h	; ad2e
	defb 03fh,002h,0b8h,0c0h,071h	; ad33
	defb 0ffh	; ad38

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_115: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (16 bytes)
;   0xad39..0xad49  (16 bytes)
DATA_puertas_de_la_sala_115:
	defb 05dh,005h,000h,084h,0fah	; ad39
	defb 05eh,004h,060h,0f0h,0c2h	; ad3e
	defb 073h,008h,0b8h,080h,0c8h	; ad43
	defb 0ffh	; ad48

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_116: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad49..0xad4f  (6 bytes)
DATA_puertas_de_la_sala_116:
	defb 062h,002h,0b8h,020h,072h	; ad49
	defb 0ffh	; ad4e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_117: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad4f..0xad55  (6 bytes)
DATA_puertas_de_la_sala_117:
	defb 091h,014h,080h,0e0h,0cch	; ad4f
	defb 0ffh	; ad54

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_118: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad55..0xad5b  (6 bytes)
DATA_puertas_de_la_sala_118:
	defb 063h,003h,040h,008h,077h	; ad55
	defb 0ffh	; ad5a

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_119: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xad5b..0xad66  (11 bytes)
DATA_puertas_de_la_sala_119:
	defb 063h,004h,040h,0f0h,076h	; ad5b
	defb 06bh,001h,000h,024h,0e0h	; ad60
	defb 0ffh	; ad65

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_122: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad66..0xad6c  (6 bytes)
DATA_puertas_de_la_sala_122:
	defb 04ah,001h,000h,064h,039h	; ad66
	defb 0ffh	; ad6b

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_123: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad6c..0xad72  (6 bytes)
DATA_puertas_de_la_sala_123:
	defb 083h,002h,0b8h,0a0h,038h	; ad6c
	defb 0ffh	; ad71

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_125: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad72..0xad78  (6 bytes)
DATA_puertas_de_la_sala_125:
	defb 030h,001h,000h,064h,05dh	; ad72
	defb 0ffh	; ad77

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_126: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad78..0xad7e  (6 bytes)
DATA_puertas_de_la_sala_126:
	defb 065h,004h,040h,0d0h,005h	; ad78
	defb 0ffh	; ad7d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_127: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad7e..0xad84  (6 bytes)
DATA_puertas_de_la_sala_127:
	defb 06dh,004h,040h,0d0h,005h	; ad7e
	defb 0ffh	; ad83

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_128: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad84..0xad8a  (6 bytes)
DATA_puertas_de_la_sala_128:
	defb 071h,004h,040h,0d0h,005h	; ad84
	defb 0ffh	; ad89

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_129: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad8a..0xad90  (6 bytes)
DATA_puertas_de_la_sala_129:
	defb 003h,002h,0b8h,060h,006h	; ad8a
	defb 0ffh	; ad8f

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_130: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad90..0xad96  (6 bytes)
DATA_puertas_de_la_sala_130:
	defb 076h,004h,040h,0d0h,007h	; ad90
	defb 0ffh	; ad95

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_131: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad96..0xad9c  (6 bytes)
DATA_puertas_de_la_sala_131:
	defb 077h,004h,040h,0d0h,007h	; ad96
	defb 0ffh	; ad9b

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_132: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xad9c..0xada2  (6 bytes)
DATA_puertas_de_la_sala_132:
	defb 078h,004h,040h,0d0h,007h	; ad9c
	defb 0ffh	; ada1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_133: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xada2..0xada8  (6 bytes)
DATA_puertas_de_la_sala_133:
	defb 007h,002h,0b8h,060h,00ah	; ada2
	defb 0ffh	; ada7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_134: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xada8..0xadae  (6 bytes)
DATA_puertas_de_la_sala_134:
	defb 00ah,004h,040h,0d0h,00eh	; ada8
	defb 0ffh	; adad

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_135: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadae..0xadb4  (6 bytes)
DATA_puertas_de_la_sala_135:
	defb 074h,004h,040h,0d0h,009h	; adae
	defb 0ffh	; adb3

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_136: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadb4..0xadba  (6 bytes)
DATA_puertas_de_la_sala_136:
	defb 008h,004h,040h,0d0h,00dh	; adb4
	defb 0ffh	; adb9

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_137: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadba..0xadc0  (6 bytes)
DATA_puertas_de_la_sala_137:
	defb 009h,003h,040h,028h,00dh	; adba
	defb 0ffh	; adbf

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_138: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadc0..0xadc6  (6 bytes)
DATA_puertas_de_la_sala_138:
	defb 001h,002h,0b8h,060h,008h	; adc0
	defb 0ffh	; adc5

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_139: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadc6..0xadcc  (6 bytes)
DATA_puertas_de_la_sala_139:
	defb 015h,002h,0b8h,060h,010h	; adc6
	defb 0ffh	; adcb

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_140: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadcc..0xadd2  (6 bytes)
DATA_puertas_de_la_sala_140:
	defb 079h,004h,040h,0d0h,011h	; adcc
	defb 0ffh	; add1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_141: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xadd2..0xaddd  (11 bytes)
DATA_puertas_de_la_sala_141:
	defb 07ah,002h,0b8h,060h,013h	; add2
	defb 07bh,004h,020h,0d0h,08eh	; add7
	defb 0ffh	; addc

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_142: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (21 bytes)
;   0xaddd..0xadf2  (21 bytes)
DATA_puertas_de_la_sala_142:
	defb 018h,004h,020h,0d0h,017h	; addd
	defb 07bh,003h,020h,028h,08dh	; ade2
	defb 07ch,002h,0b8h,040h,015h	; ade7
	defb 07dh,002h,0b8h,0a0h,015h	; adec
	defb 0ffh	; adf1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_143: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadf2..0xadf8  (6 bytes)
DATA_puertas_de_la_sala_143:
	defb 09bh,002h,0b8h,060h,014h	; adf2
	defb 0ffh	; adf7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_144: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadf8..0xadfe  (6 bytes)
DATA_puertas_de_la_sala_144:
	defb 01ah,002h,0b8h,060h,016h	; adf8
	defb 0ffh	; adfd

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_145: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xadfe..0xae04  (6 bytes)
DATA_puertas_de_la_sala_145:
	defb 01bh,002h,0b8h,060h,018h	; adfe
	defb 0ffh	; ae03

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_146: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae04..0xae0a  (6 bytes)
DATA_puertas_de_la_sala_146:
	defb 01dh,004h,040h,0d0h,01ch	; ae04
	defb 0ffh	; ae09

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_147: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae0a..0xae10  (6 bytes)
DATA_puertas_de_la_sala_147:
	defb 01eh,004h,040h,0d0h,01ch	; ae0a
	defb 0ffh	; ae0f

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_148: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xae10..0xae1b  (11 bytes)
DATA_puertas_de_la_sala_148:
	defb 020h,004h,040h,0d0h,01dh	; ae10
	defb 066h,001h,000h,064h,095h	; ae15
	defb 0ffh	; ae1a

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_149: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xae1b..0xae26  (11 bytes)
DATA_puertas_de_la_sala_149:
	defb 066h,002h,0b8h,060h,094h	; ae1b
	defb 07eh,004h,040h,0d0h,01eh	; ae20
	defb 0ffh	; ae25

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_150: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xae26..0xae31  (11 bytes)
DATA_puertas_de_la_sala_150:
	defb 023h,002h,0b8h,060h,021h	; ae26
	defb 024h,004h,040h,0f0h,097h	; ae2b
	defb 0ffh	; ae30

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_151: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae31..0xae37  (6 bytes)
DATA_puertas_de_la_sala_151:
	defb 024h,003h,040h,028h,096h	; ae31
	defb 0ffh	; ae36

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_152: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae37..0xae3d  (6 bytes)
DATA_puertas_de_la_sala_152:
	defb 021h,003h,040h,028h,01eh	; ae37
	defb 0ffh	; ae3c

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_153: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xae3d..0xae48  (11 bytes)
DATA_puertas_de_la_sala_153:
	defb 080h,004h,040h,0d0h,020h	; ae3d
	defb 07fh,002h,0b8h,060h,020h	; ae42
	defb 0ffh	; ae47

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_154: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xae48..0xae53  (11 bytes)
DATA_puertas_de_la_sala_154:
	defb 04fh,005h,000h,084h,0f6h	; ae48
	defb 025h,002h,0b8h,060h,05ch	; ae4d
	defb 0ffh	; ae52

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_156: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae53..0xae59  (6 bytes)
DATA_puertas_de_la_sala_156:
	defb 027h,002h,0b8h,060h,023h	; ae53
	defb 0ffh	; ae58

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_157: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae59..0xae5f  (6 bytes)
DATA_puertas_de_la_sala_157:
	defb 029h,002h,0b8h,060h,024h	; ae59
	defb 0ffh	; ae5e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_158: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae5f..0xae65  (6 bytes)
DATA_puertas_de_la_sala_158:
	defb 028h,002h,0b8h,060h,024h	; ae5f
	defb 0ffh	; ae64

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_159: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae65..0xae6b  (6 bytes)
DATA_puertas_de_la_sala_159:
	defb 02ah,003h,040h,028h,026h	; ae65
	defb 0ffh	; ae6a

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_160: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae6b..0xae71  (6 bytes)
DATA_puertas_de_la_sala_160:
	defb 02ch,002h,0b8h,060h,028h	; ae6b
	defb 0ffh	; ae70

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_161: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae71..0xae77  (6 bytes)
DATA_puertas_de_la_sala_161:
	defb 02dh,003h,040h,028h,029h	; ae71
	defb 0ffh	; ae76

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_162: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae77..0xae7d  (6 bytes)
DATA_puertas_de_la_sala_162:
	defb 082h,003h,040h,024h,02ah	; ae77
	defb 0ffh	; ae7c

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_163: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae7d..0xae83  (6 bytes)
DATA_puertas_de_la_sala_163:
	defb 02eh,002h,0b8h,060h,033h	; ae7d
	defb 0ffh	; ae82

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_164: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xae83..0xae8e  (11 bytes)
DATA_puertas_de_la_sala_164:
	defb 00ch,00dh,098h,060h,036h	; ae83
	defb 067h,00fh,020h,0d0h,0a5h	; ae88
	defb 0ffh	; ae8d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_165: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae8e..0xae94  (6 bytes)
DATA_puertas_de_la_sala_165:
	defb 067h,00eh,020h,020h,0a4h	; ae8e
	defb 0ffh	; ae93

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_166: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xae94..0xae9f  (11 bytes)
DATA_puertas_de_la_sala_166:
	defb 06ah,00fh,020h,0d0h,0a7h	; ae94
	defb 00eh,002h,0b8h,060h,037h	; ae99
	defb 0ffh	; ae9e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_167: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xae9f..0xaea5  (6 bytes)
DATA_puertas_de_la_sala_167:
	defb 06ah,00eh,020h,020h,0a6h	; ae9f
	defb 0ffh	; aea4

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_168: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaea5..0xaeab  (6 bytes)
DATA_puertas_de_la_sala_168:
	defb 09ah,001h,000h,064h,039h	; aea5
	defb 0ffh	; aeaa

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_169: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaeab..0xaeb1  (6 bytes)
DATA_puertas_de_la_sala_169:
	defb 010h,011h,040h,0d0h,03bh	; aeab
	defb 0ffh	; aeb0

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_170: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaeb1..0xaeb7  (6 bytes)
DATA_puertas_de_la_sala_170:
	defb 013h,004h,040h,0d0h,03eh	; aeb1
	defb 0ffh	; aeb6

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_171: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaeb7..0xaebd  (6 bytes)
DATA_puertas_de_la_sala_171:
	defb 011h,001h,000h,064h,03ah	; aeb7
	defb 0ffh	; aebc

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_172: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaebd..0xaec3  (6 bytes)
DATA_puertas_de_la_sala_172:
	defb 012h,00ch,000h,064h,03dh	; aebd
	defb 0ffh	; aec2

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_173: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaec3..0xaec9  (6 bytes)
DATA_puertas_de_la_sala_173:
	defb 085h,004h,040h,0d0h,009h	; aec3
	defb 0ffh	; aec8

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_174: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaec9..0xaecf  (6 bytes)
DATA_puertas_de_la_sala_174:
	defb 084h,004h,040h,0d0h,040h	; aec9
	defb 0ffh	; aece

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_175: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaecf..0xaed5  (6 bytes)
DATA_puertas_de_la_sala_175:
	defb 086h,004h,040h,0d0h,041h	; aecf
	defb 0ffh	; aed4

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_176: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaed5..0xaedb  (6 bytes)
DATA_puertas_de_la_sala_176:
	defb 034h,002h,0b8h,060h,046h	; aed5
	defb 0ffh	; aeda

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_177: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaedb..0xaee1  (6 bytes)
DATA_puertas_de_la_sala_177:
	defb 032h,002h,0b8h,060h,046h	; aedb
	defb 0ffh	; aee0

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_178: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaee1..0xaee7  (6 bytes)
DATA_puertas_de_la_sala_178:
	defb 037h,004h,040h,0d0h,04ah	; aee1
	defb 0ffh	; aee6

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_179: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaee7..0xaeed  (6 bytes)
DATA_puertas_de_la_sala_179:
	defb 039h,003h,040h,028h,04bh	; aee7
	defb 0ffh	; aeec

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_180: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaeed..0xaef3  (6 bytes)
DATA_puertas_de_la_sala_180:
	defb 03ch,003h,040h,028h,04eh	; aeed
	defb 0ffh	; aef2

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_181: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaef3..0xaef9  (6 bytes)
DATA_puertas_de_la_sala_181:
	defb 087h,002h,0b8h,060h,04fh	; aef3
	defb 0ffh	; aef8

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_182: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaef9..0xaeff  (6 bytes)
DATA_puertas_de_la_sala_182:
	defb 03dh,002h,0b8h,060h,051h	; aef9
	defb 0ffh	; aefe

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_183: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaeff..0xaf05  (6 bytes)
DATA_puertas_de_la_sala_183:
	defb 047h,002h,0b8h,060h,057h	; aeff
	defb 0ffh	; af04

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_184: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf05..0xaf0b  (6 bytes)
DATA_puertas_de_la_sala_184:
	defb 04bh,002h,0b8h,060h,057h	; af05
	defb 0ffh	; af0a

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_185: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf0b..0xaf11  (6 bytes)
DATA_puertas_de_la_sala_185:
	defb 049h,002h,0b8h,060h,056h	; af0b
	defb 0ffh	; af10

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_186: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf11..0xaf17  (6 bytes)
DATA_puertas_de_la_sala_186:
	defb 04dh,002h,0b8h,060h,058h	; af11
	defb 0ffh	; af16

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_187: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf17..0xaf1d  (6 bytes)
DATA_puertas_de_la_sala_187:
	defb 04eh,002h,0b8h,060h,059h	; af17
	defb 0ffh	; af1c

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_188: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xaf1d..0xaf28  (11 bytes)
DATA_puertas_de_la_sala_188:
	defb 053h,002h,0b8h,060h,062h	; af1d
	defb 099h,004h,040h,0d0h,0bdh	; af22
	defb 0ffh	; af27

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_189: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xaf28..0xaf33  (11 bytes)
DATA_puertas_de_la_sala_189:
	defb 054h,002h,0b8h,060h,062h	; af28
	defb 099h,003h,040h,028h,0bch	; af2d
	defb 0ffh	; af32

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_190: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf33..0xaf39  (6 bytes)
DATA_puertas_de_la_sala_190:
	defb 089h,002h,0b8h,060h,065h	; af33
	defb 0ffh	; af38

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_191: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf39..0xaf3f  (6 bytes)
DATA_puertas_de_la_sala_191:
	defb 08ah,002h,0b8h,060h,065h	; af39
	defb 0ffh	; af3e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_192: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf3f..0xaf45  (6 bytes)
DATA_puertas_de_la_sala_192:
	defb 08bh,002h,0b8h,060h,06eh	; af3f
	defb 0ffh	; af44

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_193: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf45..0xaf4b  (6 bytes)
DATA_puertas_de_la_sala_193:
	defb 05ch,002h,0b8h,060h,06eh	; af45
	defb 0ffh	; af4a

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_194: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf4b..0xaf51  (6 bytes)
DATA_puertas_de_la_sala_194:
	defb 05eh,003h,040h,028h,073h	; af4b
	defb 0ffh	; af50

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_195: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf51..0xaf57  (6 bytes)
DATA_puertas_de_la_sala_195:
	defb 017h,003h,040h,028h,011h	; af51
	defb 0ffh	; af56

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_196: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf57..0xaf5d  (6 bytes)
DATA_puertas_de_la_sala_196:
	defb 088h,002h,0b8h,060h,05dh	; af57
	defb 0ffh	; af5c

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_197: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf5d..0xaf63  (6 bytes)
DATA_puertas_de_la_sala_197:
	defb 050h,002h,0b8h,060h,05eh	; af5d
	defb 0ffh	; af62

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_198: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf63..0xaf69  (6 bytes)
DATA_puertas_de_la_sala_198:
	defb 046h,002h,0b8h,060h,056h	; af63
	defb 0ffh	; af68

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_199: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf69..0xaf6f  (6 bytes)
DATA_puertas_de_la_sala_199:
	defb 075h,004h,040h,0d0h,005h	; af69
	defb 0ffh	; af6e

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_200: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf6f..0xaf75  (6 bytes)
DATA_puertas_de_la_sala_200:
	defb 073h,00ch,000h,060h,073h	; af6f
	defb 0ffh	; af74

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_201: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf75..0xaf7b  (6 bytes)
DATA_puertas_de_la_sala_201:
	defb 09ch,004h,040h,0d0h,06ch	; af75
	defb 0ffh	; af7a

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_202: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf7b..0xaf81  (6 bytes)
DATA_puertas_de_la_sala_202:
	defb 072h,002h,0b8h,060h,052h	; af7b
	defb 0ffh	; af80

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_203: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xaf81..0xaf87  (6 bytes)
DATA_puertas_de_la_sala_203:
	defb 056h,002h,0b8h,060h,063h	; af81
	defb 0ffh	; af86

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_204: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (16 bytes)
;   0xaf87..0xaf97  (16 bytes)
DATA_puertas_de_la_sala_204:
	defb 091h,002h,000h,080h,075h	; af87
	defb 081h,002h,000h,080h,02eh	; af8c
	defb 05bh,002h,000h,080h,02dh	; af91
	defb 0ffh	; af96

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_205: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xaf97..0xafa2  (11 bytes)
DATA_puertas_de_la_sala_205:
	defb 048h,002h,0b8h,060h,055h	; af97
	defb 06fh,005h,000h,084h,0f5h	; af9c
	defb 0ffh	; afa1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_206: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xafa2..0xafad  (11 bytes)
DATA_puertas_de_la_sala_206:
	defb 03bh,002h,0b8h,060h,04ch	; afa2
	defb 06eh,005h,000h,084h,0f5h	; afa7
	defb 0ffh	; afac

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_207: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xafad..0xafb8  (11 bytes)
DATA_puertas_de_la_sala_207:
	defb 057h,002h,0b8h,060h,063h	; afad
	defb 070h,005h,000h,084h,0f5h	; afb2
	defb 0ffh	; afb7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_213: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafb8..0xafbe  (6 bytes)
DATA_puertas_de_la_sala_213:
	defb 092h,004h,040h,0d0h,009h	; afb8
	defb 0ffh	; afbd

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_214: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafbe..0xafc4  (6 bytes)
DATA_puertas_de_la_sala_214:
	defb 093h,004h,040h,0d0h,068h	; afbe
	defb 0ffh	; afc3

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_215: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafc4..0xafca  (6 bytes)
DATA_puertas_de_la_sala_215:
	defb 094h,004h,040h,0d0h,041h	; afc4
	defb 0ffh	; afc9

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_216: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafca..0xafd0  (6 bytes)
DATA_puertas_de_la_sala_216:
	defb 095h,004h,040h,0d0h,068h	; afca
	defb 0ffh	; afcf

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_217: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafd0..0xafd6  (6 bytes)
DATA_puertas_de_la_sala_217:
	defb 096h,004h,040h,0d0h,041h	; afd0
	defb 0ffh	; afd5

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_218: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafd6..0xafdc  (6 bytes)
DATA_puertas_de_la_sala_218:
	defb 097h,004h,040h,0d0h,068h	; afd6
	defb 0ffh	; afdb

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_219: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafdc..0xafe2  (6 bytes)
DATA_puertas_de_la_sala_219:
	defb 098h,004h,040h,0d0h,009h	; afdc
	defb 0ffh	; afe1

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_224: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xafe2..0xafe8  (6 bytes)
DATA_puertas_de_la_sala_224:
	defb 06bh,006h,080h,0e8h,077h	; afe2
	defb 0ffh	; afe7

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_225: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xafe8..0xaff3  (11 bytes)
DATA_puertas_de_la_sala_225:
	defb 002h,006h,098h,0e0h,003h	; afe8
	defb 022h,006h,018h,0e0h,01fh	; afed
	defb 0ffh	; aff2

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_226: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (16 bytes)
;   0xaff3..0xb003  (16 bytes)
DATA_puertas_de_la_sala_226:
	defb 00bh,006h,058h,0e0h,00fh	; aff3
	defb 014h,006h,098h,0e0h,03fh	; aff8
	defb 01ch,006h,018h,0e0h,01bh	; affd
	defb 0ffh	; b002

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_227: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (11 bytes)
;   0xb003..0xb00e  (11 bytes)
DATA_puertas_de_la_sala_227:
	defb 02bh,006h,098h,0e0h,027h	; b003
	defb 02fh,006h,058h,0e0h,035h	; b008
	defb 0ffh	; b00d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_228: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (16 bytes)
;   0xb00e..0xb01e  (16 bytes)
DATA_puertas_de_la_sala_228:
	defb 036h,006h,058h,0e0h,048h	; b00e
	defb 051h,006h,098h,0e0h,05fh	; b013
	defb 03eh,006h,018h,0e0h,051h	; b018
	defb 0ffh	; b01d

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_229: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xb01e..0xb024  (6 bytes)
DATA_puertas_de_la_sala_229:
	defb 04ch,006h,098h,0e0h,058h	; b01e
	defb 0ffh	; b023

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_230: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (16 bytes)
;   0xb024..0xb034  (16 bytes)
DATA_puertas_de_la_sala_230:
	defb 06eh,006h,058h,0e0h,0ceh	; b024
	defb 06fh,006h,018h,0e0h,0cdh	; b029
	defb 070h,006h,098h,0e0h,0cfh	; b02e
	defb 0ffh	; b033

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_231: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xb034..0xb03a  (6 bytes)
DATA_puertas_de_la_sala_231:
	defb 04fh,006h,098h,0e0h,09ah	; b034
	defb 0ffh	; b039

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_232: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); lo leen p00:441A (6 bytes)
;   0xb03a..0xb040  (6 bytes)
DATA_puertas_de_la_sala_232:
	defb 05ah,006h,018h,0e0h,06dh	; b03a
	defb 0ffh	; b03f

; ----------------------------------------------------------------------
; DATOS puertas_de_la_sala_235: fichas de 5 bytes [puerta][tipo][y][x][e]
;   hasta 0xFF (la Y primero, como en los actores: el tercer byte no pasa de
;   184): p00:441A monta una ficha en 0xC3D0 por puerta (el cerrojo sale de
;   0xC450 y de 0xB046); se solapan 2 bloques: (puertas_de_la_sala_0
;   B045-B046); lo leen p00:441A (6 bytes)
;   0xb040..0xb046  (6 bytes)
DATA_puertas_de_la_sala_235:
	defb 05dh,006h,098h,0e0h,073h	; b040
	defb 0ffh	; b045

; ----------------------------------------------------------------------
; DATOS cerrojo_de_cada_puerta: 160 bytes, uno por puerta: p00:4347 pone a 1
;   en 0xC450 las que no tienen los bits 6-7 a 10, y p00:4434 lee el byte de
;   la puerta; lo leen p00:4347, p00:4434 (160 bytes)
;   0xb046..0xb0e6  (160 bytes)
DATA_cerrojo_de_cada_puerta:
	defb 002h,041h,005h,005h,005h,045h,005h,042h,003h,043h,041h,02fh,007h,007h,004h,030h	; b046  .A...E.B.CA/...0
	defb 005h,030h,004h,041h,004h,005h,044h,044h,004h,044h,042h,041h,042h,003h,042h,042h	; b056  .0.A..DD.DBAB.BB
	defb 043h,041h,043h,042h,006h,003h,003h,003h,002h,042h,041h,004h,043h,004h,041h,007h	; b066  CACB.....BA.C.A.
	defb 04ch,005h,045h,007h,005h,041h,003h,006h,007h,048h,006h,046h,047h,041h,042h,081h	; b076  L.E..A...H.FGAB.
	defb 042h,042h,043h,046h,046h,044h,007h,006h,007h,003h,00dh,041h,043h,005h,041h,046h	; b086  BBCFFD.....AC.AF
	defb 041h,047h,007h,006h,046h,046h,006h,044h,008h,041h,081h,048h,041h,049h,049h,009h	; b096  AG..FF.D.A.HAII.
	defb 030h,042h,00eh,030h,08ah,002h,02fh,010h,00bh,030h,00eh,081h,08bh,041h,041h,041h	; b0a6  0B.0../..0...AAA
	defb 08bh,081h,030h,081h,081h,081h,081h,081h,081h,081h,044h,081h,081h,081h,081h,081h	; b0b6  ..0.......D.....
	defb 081h,081h,042h,081h,081h,081h,081h,081h,042h,081h,002h,010h,010h,010h,010h,010h	; b0c6  ..B.....B.......
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,00ah,002h,042h,006h,004h,019h,019h	; b0d6  ...........B....

; ----------------------------------------------------------------------
; DATOS puerta_B0E2_resto: el resto del registro de puerta que p01:780F carga
;   desde 0xB0E2: sus 4 primeros bytes son los ultimos cerrojos de 0xB046; lo
;   leen p01:780F (22 bytes)
;   0xb0e6..0xb0fc  (22 bytes)
DATA_puerta_B0E2_resto:
	defb 019h,019h,039h,032h,039h,039h,037h,039h,039h,037h,039h,039h,036h,039h,039h,038h	; b0e6  ..92997997996998
	defb 039h,039h,041h,041h,041h,041h	; b0f6

; ----------------------------------------------------------------------
; DATOS puerta_B0FC: dibujo de una puerta de los tipos 7-19 que p01:7814 carga
;   en DE para p01:784E: 1 filas x 4 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7814 (6 bytes)
;   0xb0fc..0xb102  (6 bytes)
DATA_puerta_B0FC:
	defb 001h,004h,019h,019h,019h,019h	; b0fc

; ----------------------------------------------------------------------
; DATOS puerta_B102: dibujo de una puerta de los tipos 7-19 que p01:7819 carga
;   en DE para p01:784E: 13 filas x 3 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7819 (41 bytes)
;   0xb102..0xb12b  (41 bytes)
DATA_puerta_B102:
	defb 00dh,003h,018h,03dh,041h,018h,03dh,041h,018h,03dh,041h,018h,03dh,041h,018h,03dh	; b102  ...=A.=A.=A.=A.=
	defb 041h,018h,03dh,041h,018h,03dh,041h,018h,03dh,041h,018h,03dh,041h,018h,03dh,041h	; b112  A.=A.=A.=A.=A.=A
	defb 018h,03dh,041h,018h,03dh,041h,018h,03dh,041h	; b122  .=A.=A.=A

; ----------------------------------------------------------------------
; DATOS puerta_B12B: dibujo de una puerta de los tipos 7-19 que p01:781E carga
;   en DE para p01:784E: 13 filas x 5 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:781E (67 bytes)
;   0xb12b..0xb16e  (67 bytes)
DATA_puerta_B12B:
	defb 00dh,005h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh	; b12b  ..:..=A:..=A:..=
	defb 041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h	; b13b  A:..=A:..=A:..=A
	defb 03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah	; b14b  :..=A:..=A:..=A:
	defb 017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h	; b15b  ..=A:..=A:..=A:.
	defb 018h,03dh,041h	; b16b

; ----------------------------------------------------------------------
; DATOS puerta_B16E: dibujo de una puerta de los tipos 7-19 que p01:7823 carga
;   en DE para p01:784E: 12 filas x 5 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7823 (62 bytes)
;   0xb16e..0xb1ac  (62 bytes)
DATA_puerta_B16E:
	defb 00ch,005h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh	; b16e  ..:..=A:..=A:..=
	defb 041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h	; b17e  A:..=A:..=A:..=A
	defb 03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah	; b18e  :..=A:..=A:..=A:
	defb 017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h	; b19e  ..=A:..=A:..=A

; ----------------------------------------------------------------------
; DATOS puerta_B1AC: dibujo de una puerta de los tipos 7-19 que p01:7828 carga
;   en DE para p01:784E: 1 filas x 4 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7828 (6 bytes)
;   0xb1ac..0xb1b2  (6 bytes)
DATA_puerta_B1AC:
	defb 001h,004h,017h,017h,017h,017h	; b1ac

; ----------------------------------------------------------------------
; DATOS puerta_B1B2: dibujo de una puerta de los tipos 7-19 que p01:7832 carga
;   en DE para p01:784E: 13 filas x 3 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7832 (41 bytes)
;   0xb1b2..0xb1db  (41 bytes)
DATA_puerta_B1B2:
	defb 00dh,003h,014h,033h,035h,014h,033h,035h,014h,033h,035h,014h,033h,035h,014h,033h	; b1b2  ...35.35.35.35.3
	defb 035h,014h,033h,035h,014h,033h,035h,014h,033h,035h,014h,033h,035h,014h,033h,035h	; b1c2  5.35.35.35.35.35
	defb 014h,033h,035h,014h,033h,035h,014h,033h,035h	; b1d2  .35.35.35

; ----------------------------------------------------------------------
; DATOS puerta_B1DB: dibujo de una puerta de los tipos 7-19 que p01:7837 carga
;   en DE para p01:784E: 12 filas x 2 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7837 (26 bytes)
;   0xb1db..0xb1f5  (26 bytes)
DATA_puerta_B1DB:
	defb 00ch,002h,032h,013h,032h,013h,032h,013h,032h,013h,032h,013h,032h,013h,032h,013h	; b1db  ..2.2.2.2.2.2.2.
	defb 032h,013h,032h,013h,032h,013h,032h,013h,032h,013h	; b1eb  2.2.2.2.2.

; ----------------------------------------------------------------------
; DATOS puerta_B1F5: dibujo de una puerta de los tipos 7-19 que p01:783C carga
;   en DE para p01:784E: 10 filas x 8 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:783C (82 bytes)
;   0xb1f5..0xb247  (82 bytes)
DATA_puerta_B1F5:
	defb 00ah,008h,021h,021h,021h,021h,021h,021h,021h,021h,01ch,049h,049h,049h,049h,049h	; b1f5  ..!!!!!!!!.IIIII
	defb 049h,01dh,01ch,046h,049h,049h,049h,047h,049h,01dh,01ch,049h,049h,047h,049h,049h	; b205  I..FIIIGI..IIGII
	defb 049h,01dh,018h,021h,021h,021h,021h,021h,021h,01bh,049h,049h,049h,047h,047h,049h	; b215  I..!!!!!!.IIIGGI
	defb 049h,049h,04ah,04bh,04ah,04bh,04ah,04bh,04ah,04bh,049h,046h,049h,049h,043h,049h	; b225  IIJKJKJKJKIFIICI
	defb 047h,049h,04ah,04bh,04ah,04bh,04ah,04bh,04ah,04bh,061h,061h,061h,061h,061h,061h	; b235  GIJKJKJKJKaaaaaa
	defb 061h,061h	; b245

; ----------------------------------------------------------------------
; DATOS puerta_B247: dibujo de una puerta de los tipos 7-19 que p01:7841 carga
;   en DE para p01:784E: 12 filas x 2 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7841 (26 bytes)
;   0xb247..0xb261  (26 bytes)
DATA_puerta_B247:
	defb 00ch,002h,03ah,017h,03ah,017h,03ah,017h,03ah,017h,03ah,017h,03ah,017h,03ah,017h	; b247  ..:.:.:.:.:.:.:.
	defb 03ah,017h,03ah,017h,03ah,017h,03ah,017h,03ah,017h	; b257  :.:.:.:.:.

; ----------------------------------------------------------------------
; DATOS puerta_B261: dibujo de una puerta de los tipos 7-19 que p01:7846 carga
;   en DE para p01:784E: 12 filas x 5 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:7846 (62 bytes)
;   0xb261..0xb29f  (62 bytes)
DATA_puerta_B261:
	defb 00ch,005h,026h,017h,018h,03dh,041h,027h,017h,018h,03dh,041h,028h,017h,018h,03dh	; b261  ..&..=A'..=A(..=
	defb 041h,029h,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h,03ah,017h,018h,03dh,041h	; b271  A)..=A:..=A:..=A
	defb 03ah,017h,018h,03dh,041h,03ah,017h,019h,019h,019h,03ah,017h,018h,022h,035h,03ah	; b281  :..=A:....:.."5:
	defb 017h,018h,023h,039h,03ah,017h,018h,024h,037h,03ah,017h,018h,025h,039h	; b291  ..#9:..$7:..%9

; ----------------------------------------------------------------------
; DATOS puerta_B29F: dibujo de una puerta de los tipos 7-19 que p01:784B carga
;   en DE para p01:784E: 5 filas x 6 columnas de numeros de ficha
;   ([filas][columnas] y las fichas; L_44AF las pinta en la X/Y de la puerta);
;   lo leen p01:784B (32 bytes)
;   0xb29f..0xb2bf  (32 bytes)
DATA_puerta_B29F:
	defb 005h,006h,032h,039h,039h,039h,039h,033h,039h,039h,037h,039h,032h,039h,039h,036h	; b29f  ..29999399792996
	defb 039h,039h,039h,036h,038h,039h,039h,039h,037h,039h,041h,041h,041h,041h,041h,041h	; b2af  9996899979AAAAAA

; ----------------------------------------------------------------------
; DATOS fichas_del_interruptor: 4 fichas en 3 planos que p00:4BCA vuelca en la
;   VRAM 0x9048 (el interruptor de la corriente); lo leen p00:4BCA (96 bytes)
;   0xb2bf..0xb31f  (96 bytes)
DATA_fichas_del_interruptor:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,083h,0ffh,0c7h,0bbh,0ffh,0ffh,083h,0ffh,0ffh,0abh,0ffh,0ffh,0abh,0ffh,0ffh,0ffh,083h	; b2bf  ........................
	defb 0ffh,0ffh,083h,0ffh,0ffh,0ffh,0ffh,0abh,0ffh,0ffh,0abh,0ffh,0ffh,0abh,0ffh,0ffh,083h,0ffh,0ffh,083h,0ffh,0ffh,0ffh,0ffh	; b2d7  ........................
	defb 07fh,07fh,07fh,07fh,041h,07fh,07fh,05fh,06bh,07fh,041h,07fh,07fh,05fh,06bh,07fh,041h,07fh,07fh,05fh,06bh,07fh,041h,07fh	; b2ef  ....A.._k.A.._k.A.._k.A.
	defb 07fh,05fh,06bh,07fh,041h,07fh,07fh,05fh,06bh,07fh,041h,07fh,07bh,057h,07fh,07fh,041h,07fh,07fh,07fh,07fh,000h,000h,000h	; b307  ._k.A.._k.A.{W..A.......

; ----------------------------------------------------------------------
; DATOS bloque_B31F: un bloque de 1 filas x 4 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p15:BEF7; lo leen p15:BEF7 (6 bytes)
;   0xb31f..0xb325  (6 bytes)
DATA_bloque_B31F:
	defb 001h,004h,0a0h,0a0h	; b31f
	defb 0d1h,0d0h	; b323

; ----------------------------------------------------------------------
; DATOS bloque_B325: un bloque de 3 filas x 8 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p15:BF01; lo leen p15:BF01 (26 bytes)
;   0xb325..0xb33f  (26 bytes)
DATA_bloque_B325:
	defb 003h,008h,000h,000h,0a2h,0a3h,0d3h,0d2h	; b325  ........
	defb 000h,000h,000h,000h,0a4h,0a5h,0d5h,0d4h	; b32d  ........
	defb 000h,000h,0a6h,0a7h,0a8h,0a9h,0d9h,0d8h	; b335  ........
	defb 0d7h,0d6h	; b33d

; ----------------------------------------------------------------------
; DATOS bloque_B33F: un bloque de 5 filas x 8 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p15:BF1C; lo leen p15:BF1C (42 bytes)
;   0xb33f..0xb369  (42 bytes)
DATA_bloque_B33F:
	defb 005h,008h,000h,0a2h,017h,018h,003h,004h	; b33f  ........
	defb 0d2h,000h,000h,019h,01ah,01bh,01ch,01dh	; b347  ........
	defb 01eh,000h,000h,01fh,020h,021h,022h,023h	; b34f  .... !"#
	defb 024h,000h,000h,025h,026h,027h,028h,029h	; b357  $..%&'()
	defb 02ah,000h,0a6h,0abh,0ach,0adh,0ddh,0dch	; b35f  *.......
	defb 0dbh,0d6h	; b367

; ----------------------------------------------------------------------
; DATOS bloque_B369: un bloque de 9 filas x 18 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p01:692A; lo leen p01:692A (164 bytes)
;   0xb369..0xb40d  (164 bytes)
DATA_bloque_B369:
	defb 009h,012h,048h,044h,044h,044h,044h,044h,044h,044h,04ch,046h,046h,046h,046h,046h,046h,04fh	; b369  ..HDDDDDDDLFFFFFFO
	defb 044h,04eh,05bh,052h,041h,041h,041h,041h,041h,041h,055h,040h,040h,040h,040h,040h,040h,057h	; b37b  DN[RAAAAAAU@@@@@@W
	defb 056h,062h,05bh,052h,041h,041h,041h,041h,041h,041h,055h,040h,040h,040h,040h,040h,040h,057h	; b38d  Vb[RAAAAAAU@@@@@@W
	defb 056h,062h,05bh,056h,051h,051h,051h,051h,051h,051h,050h,045h,045h,045h,045h,045h,045h,04dh	; b39f  Vb[VQQQQQQPEEEEEEM
	defb 056h,062h,05bh,040h,040h,040h,040h,056h,064h,053h,049h,05dh,056h,047h,047h,047h,047h,047h	; b3b1  Vb[@@@@VdSI]VGGGGG
	defb 047h,062h,05bh,040h,040h,040h,040h,056h,05ah,054h,054h,061h,056h,058h,04ah,058h,04ah,058h	; b3c3  Gb[@@@@VZTTaVXJXJX
	defb 04ah,062h,05bh,051h,051h,051h,051h,056h,05eh,054h,054h,065h,056h,058h,04ah,058h,04ah,058h	; b3d5  Jb[QQQQV^TTeVXJXJX
	defb 04ah,062h,05bh,056h,047h,047h,047h,056h,059h,05fh,066h,060h,056h,056h,056h,056h,056h,056h	; b3e7  Jb[VGGGVY_f`VVVVVV
	defb 056h,062h,04bh,04bh,04bh,04bh,04bh,04bh,04bh,05ch,063h,04bh,04bh,04bh,04bh,04bh,04bh,04bh	; b3f9  VbKKKKKKK\cKKKKKKK
	defb 04bh,04bh	; b40b

; ----------------------------------------------------------------------
; DATOS bloque_B40D: un bloque de 4 filas x 4 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p01:6933; lo leen p01:6933 (18 bytes)
;   0xb40d..0xb41f  (18 bytes)
DATA_bloque_B40D:
	defb 004h,004h,010h,011h	; b40d
	defb 012h,013h,014h,015h	; b411
	defb 016h,017h,018h,019h	; b415
	defb 01ah,01bh,01ch,01dh	; b419
	defb 01eh,01fh	; b41d

; ----------------------------------------------------------------------
; DATOS bloque_B41F: un bloque de 2 filas x 2 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p00:5E28; lo leen p00:5E28 (6 bytes)
;   0xb41f..0xb425  (6 bytes)
DATA_bloque_B41F:
	defb 002h,002h	; b41f
	defb 015h,016h	; b421
	defb 019h,01ah	; b423

; ----------------------------------------------------------------------
; DATOS bloque_B425: un bloque de 2 filas x 2 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p00:5E1C; lo leen p00:5E1C (6 bytes)
;   0xb425..0xb42b  (6 bytes)
DATA_bloque_B425:
	defb 002h,002h	; b425
	defb 030h,031h	; b427
	defb 019h,01ah	; b429

; ----------------------------------------------------------------------
; DATOS bloque_B42B: un bloque de 2 filas x 2 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104; lo carga
;   p00:5E23; lo leen p00:5E23 (6 bytes)
;   0xb42b..0xb431  (6 bytes)
DATA_bloque_B42B:
	defb 002h,002h	; b42b
	defb 015h,016h	; b42d
	defb 032h,01ah	; b42f

; ----------------------------------------------------------------------
; DATOS bloque_B431: un bloque de 11 filas x 16 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104: el Hind D
;   (p03:B862 lo pinta en X=0x40, Y=0 si el primer actor es del tipo 0x26); lo
;   carga p03:B86B; lo leen p03:B86B (178 bytes)
;   0xb431..0xb4e3  (178 bytes)
DATA_bloque_B431:
	defb 00bh,010h,013h,01bh,00ch,00dh,00eh,00fh,010h,011h,051h,050h,04fh,04eh,04dh,04ch	; b431  ..........QPONML
	defb 04bh,053h,003h,003h,012h,013h,014h,015h,016h,017h,057h,056h,055h,054h,053h,052h	; b441  KS........WVUTSR
	defb 003h,003h,007h,003h,003h,003h,012h,018h,019h,01ah,05ah,059h,058h,052h,003h,003h	; b451  ..........ZYXR..
	defb 003h,003h,009h,003h,003h,003h,003h,01bh,01ch,01dh,05dh,05ch,05bh,003h,003h,003h	; b461  ..........]\[...
	defb 003h,003h,0a0h,0a1h,0d1h,0d0h,003h,01eh,01fh,020h,060h,05fh,05eh,003h,0a0h,0a1h	; b471  ......... `_^...
	defb 0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,003h,021h,022h,023h,063h,062h,061h,003h,0a2h,0a3h	; b481  .......!"#cba...
	defb 0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,007h,024h,025h,026h,066h,065h,064h,003h,0a4h,0a5h	; b491  .......$%&fed...
	defb 0d5h,0d4h,0a6h,0a7h,0d7h,0d6h,009h,027h,028h,029h,069h,068h,067h,003h,0a6h,0a7h	; b4a1  .......'()ihg...
	defb 0d7h,0d6h,009h,009h,009h,009h,009h,02ah,02bh,02ch,06ch,06bh,06ah,003h,0a0h,0a1h	; b4b1  .......*+,lkj...
	defb 0d1h,0d0h,003h,003h,003h,003h,003h,003h,02dh,02eh,06eh,06dh,003h,003h,0a2h,0a3h	; b4c1  ........-.nm....
	defb 0d3h,0d2h,003h,003h,003h,003h,003h,003h,003h,02fh,06fh,003h,003h,003h,0a4h,0a5h	; b4d1  ........./o.....
	defb 0d5h,0d4h	; b4e1

; ----------------------------------------------------------------------
; DATOS bloque_B4E3: un bloque de 11 filas x 16 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104: el suelo
;   de la sala del Hind D sin el Hind (p03:B8C6, desde p01:7695); lo carga
;   p03:B8C9; lo leen p03:B8C9 (178 bytes)
;   0xb4e3..0xb595  (178 bytes)
DATA_bloque_B4E3:
	defb 00bh,010h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; b4e3  ................
	defb 003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; b4f3  ................
	defb 003h,003h,007h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; b503  ................
	defb 003h,003h,009h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; b513  ................
	defb 003h,003h,0a0h,0a1h,0d1h,0d0h,003h,003h,003h,003h,003h,003h,003h,003h,0a0h,0a1h	; b523  ................
	defb 0d1h,0d0h,0a2h,0a3h,0d3h,0d2h,003h,003h,003h,003h,003h,003h,003h,003h,0a2h,0a3h	; b533  ................
	defb 0d3h,0d2h,0a4h,0a5h,0d5h,0d4h,007h,003h,003h,003h,003h,003h,003h,003h,0a4h,0a5h	; b543  ................
	defb 0d5h,0d4h,0a6h,0a7h,0d7h,0d6h,009h,003h,003h,003h,003h,003h,003h,003h,0a6h,0a7h	; b553  ................
	defb 0d7h,0d6h,009h,009h,009h,009h,009h,003h,003h,003h,003h,003h,003h,003h,0a0h,0a1h	; b563  ................
	defb 0d1h,0d0h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,0a2h,0a3h	; b573  ................
	defb 0d3h,0d2h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,0a4h,0a5h	; b583  ................
	defb 0d5h,0d4h	; b593

; ----------------------------------------------------------------------
; DATOS bloque_B595: un bloque de 12 filas x 8 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104: Metal Gear
;   (p12:BC26 lo pinta en X=0x60, Y=0x20 si el primer actor es del tipo 0x11);
;   lo carga p00:44A7; lo leen p00:44A7 (98 bytes)
;   0xb595..0xb5f7  (98 bytes)
DATA_bloque_B595:
	defb 00ch,008h,049h,0a1h,0a2h,049h,049h,049h	; b595  ..I..III
	defb 049h,049h,04ah,0a3h,0a4h,0a5h,0a6h,0a7h	; b59d  IIJ.....
	defb 04ah,04bh,049h,0a8h,0a9h,0aah,0abh,0ach	; b5a5  JKI.....
	defb 0adh,049h,0aeh,0afh,0b0h,0b1h,0b2h,0b3h	; b5ad  .I......
	defb 0b4h,04ah,0b5h,0b6h,0b7h,0b8h,0b9h,0bah	; b5b5  .J......
	defb 0bbh,061h,060h,061h,0bch,0bdh,0beh,0bfh	; b5bd  .a`a....
	defb 0c0h,0c1h,060h,0c2h,0c3h,0c4h,0c5h,0c6h	; b5c5  ..`.....
	defb 0c7h,0c8h,0c9h,0cah,0cbh,0cch,0cdh,0ceh	; b5cd  ........
	defb 0cfh,0d0h,0d1h,0d2h,0d3h,0d4h,0d5h,0d6h	; b5d5  ........
	defb 0d7h,0d8h,060h,0d9h,0dah,0dbh,0dch,0ddh	; b5dd  ..`.....
	defb 060h,060h,060h,0deh,0dfh,0e0h,0e1h,0e2h	; b5e5  ```.....
	defb 060h,060h,060h,0e3h,0e4h,0e5h,0e6h,0e7h	; b5ed  ```.....
	defb 0e8h,060h	; b5f5

; ----------------------------------------------------------------------
; DATOS bloque_B5F7: un bloque de 12 filas x 8 columnas de numeros de ficha
;   ([filas][columnas] y las fichas) que p00:44BA pinta con L_4104: el suelo
;   de la sala de Metal Gear sin Metal Gear (p12:BC36, desde p01:767E); lo
;   carga p00:44AC; lo leen p00:44AC (98 bytes)
;   0xb5f7..0xb659  (98 bytes)
DATA_bloque_B5F7:
	defb 00ch,008h,049h,049h,049h,047h,047h,049h	; b5f7  ..IIIGGI
	defb 049h,049h,04ah,04bh,04ah,04bh,04ah,04bh	; b5ff  IIJKJKJK
	defb 04ah,04bh,049h,046h,049h,049h,043h,049h	; b607  JKIFIICI
	defb 047h,049h,04bh,04ah,04bh,04ah,04bh,04ah	; b60f  GIKJKJKJ
	defb 04bh,04ah,061h,061h,061h,061h,061h,061h	; b617  KJaaaaaa
	defb 061h,061h,060h,060h,060h,060h,060h,060h	; b61f  aa``````
	defb 060h,060h,060h,060h,060h,060h,060h,060h	; b627  ````````
	defb 060h,060h,060h,060h,060h,060h,060h,060h	; b62f  ````````
	defb 060h,060h,060h,060h,060h,060h,060h,060h	; b637  ````````
	defb 060h,060h,060h,060h,060h,060h,060h,060h	; b63f  ````````
	defb 060h,060h,060h,060h,060h,060h,060h,060h	; b647  ````````
	defb 060h,060h,060h,060h,060h,060h,060h,060h	; b64f  ````````
	defb 060h,060h	; b657

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_0: las llamadas de radio de una sala: 0 = ninguna; si
;   no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta la
;   que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb659..0xb65b  (2 bytes)
DATA_radio_de_la_sala_0:
	defb 019h,003h	; b659

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_4: las llamadas de radio de una sala: 0 = ninguna; si
;   no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta la
;   que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb65b..0xb65d  (2 bytes)
DATA_radio_de_la_sala_4:
	defb 015h,003h	; b65b

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_1: las llamadas de radio de una sala: 0 = ninguna; si
;   no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta la
;   que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb65d..0xb661  (4 bytes)
DATA_radio_de_la_sala_1:
	defb 014h,003h	; b65d
	defb 021h,017h	; b65f

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_5: las llamadas de radio de una sala: 0 = ninguna; si
;   no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta la
;   que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb661..0xb663  (2 bytes)
DATA_radio_de_la_sala_5:
	defb 015h,004h	; b661

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_20: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb663..0xb665  (2 bytes)
DATA_radio_de_la_sala_20:
	defb 035h,050h	; b663

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_28: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb665..0xb667  (2 bytes)
DATA_radio_de_la_sala_28:
	defb 015h,014h	; b665

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_29: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb667..0xb66b  (4 bytes)
DATA_radio_de_la_sala_29:
	defb 018h,019h	; b667
	defb 025h,01ah	; b669

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_30: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb66b..0xb66f  (4 bytes)
DATA_radio_de_la_sala_30:
	defb 014h,014h	; b66b
	defb 021h,017h	; b66d

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_31: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb66f..0xb671  (2 bytes)
DATA_radio_de_la_sala_31:
	defb 021h,017h	; b66f

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_33: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb671..0xb673  (2 bytes)
DATA_radio_de_la_sala_33:
	defb 021h,017h	; b671

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_37: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb673..0xb677  (4 bytes)
DATA_radio_de_la_sala_37:
	defb 018h,026h	; b673
	defb 025h,027h	; b675

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_45: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb677..0xb679  (2 bytes)
DATA_radio_de_la_sala_45:
	defb 025h,053h	; b677

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_50: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb679..0xb67b  (2 bytes)
DATA_radio_de_la_sala_50:
	defb 035h,058h	; b679

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_53: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb67b..0xb67f  (4 bytes)
DATA_radio_de_la_sala_53:
	defb 018h,02ah	; b67b
	defb 025h,033h	; b67d

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_54: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb67f..0xb681  (2 bytes)
DATA_radio_de_la_sala_54:
	defb 015h,03ch	; b67f

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_58: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb681..0xb683  (2 bytes)
DATA_radio_de_la_sala_58:
	defb 025h,040h	; b681

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_67: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb683..0xb685  (2 bytes)
DATA_radio_de_la_sala_67:
	defb 035h,05ch	; b683

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_69: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (6 bytes)
;   0xb685..0xb68b  (6 bytes)
DATA_radio_de_la_sala_69:
	defb 018h,05dh	; b685
	defb 024h,05eh	; b687
	defb 035h,05fh	; b689

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_82: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb68b..0xb68d  (2 bytes)
DATA_radio_de_la_sala_82:
	defb 045h,07ah	; b68b

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_83: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb68d..0xb68f  (2 bytes)
DATA_radio_de_la_sala_83:
	defb 055h,072h	; b68d

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_86: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb68f..0xb691  (2 bytes)
DATA_radio_de_la_sala_86:
	defb 065h,075h	; b68f

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_87: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb691..0xb693  (2 bytes)
DATA_radio_de_la_sala_87:
	defb 065h,076h	; b691

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_93: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb693..0xb695  (2 bytes)
DATA_radio_de_la_sala_93:
	defb 045h,070h	; b693

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_94: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb695..0xb697  (2 bytes)
DATA_radio_de_la_sala_94:
	defb 045h,040h	; b695

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_99: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb697..0xb699  (2 bytes)
DATA_radio_de_la_sala_99:
	defb 049h,06ah	; b697

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_102: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb699..0xb69d  (4 bytes)
DATA_radio_de_la_sala_102:
	defb 044h,07ah	; b699
	defb 055h,082h	; b69b

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_103: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb69d..0xb69f  (2 bytes)
DATA_radio_de_la_sala_103:
	defb 045h,07ah	; b69d

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_104: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb69f..0xb6a1  (2 bytes)
DATA_radio_de_la_sala_104:
	defb 079h,085h	; b69f

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_108: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb6a1..0xb6a5  (4 bytes)
DATA_radio_de_la_sala_108:
	defb 078h,084h	; b6a1
	defb 061h,086h	; b6a3

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_111: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb6a5..0xb6a9  (4 bytes)
DATA_radio_de_la_sala_111:
	defb 078h,088h	; b6a5
	defb 061h,089h	; b6a7

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_115: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6a9..0xb6ab  (2 bytes)
DATA_radio_de_la_sala_115:
	defb 069h,087h	; b6a9

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_116: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6ab..0xb6ad  (2 bytes)
DATA_radio_de_la_sala_116:
	defb 069h,092h	; b6ab

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_119: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb6ad..0xb6b1  (4 bytes)
DATA_radio_de_la_sala_119:
	defb 058h,095h	; b6ad
	defb 061h,094h	; b6af

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_123: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb6b1..0xb6b5  (4 bytes)
DATA_radio_de_la_sala_123:
	defb 058h,071h	; b6b1
	defb 045h,070h	; b6b3

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_150: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6b5..0xb6b7  (2 bytes)
DATA_radio_de_la_sala_150:
	defb 035h,09ch	; b6b5

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_165: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6b7..0xb6b9  (2 bytes)
DATA_radio_de_la_sala_165:
	defb 019h,03ah	; b6b7

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_178: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6b9..0xb6bb  (2 bytes)
DATA_radio_de_la_sala_178:
	defb 079h,063h	; b6b9

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_182: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6bb..0xb6bd  (2 bytes)
DATA_radio_de_la_sala_182:
	defb 045h,07eh	; b6bb

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_192: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6bd..0xb6bf  (2 bytes)
DATA_radio_de_la_sala_192:
	defb 049h,08ah	; b6bd

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_193: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (4 bytes)
;   0xb6bf..0xb6c3  (4 bytes)
DATA_radio_de_la_sala_193:
	defb 068h,08eh	; b6bf
	defb 055h,08dh	; b6c1

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_202: las llamadas de radio de una sala: 0 = ninguna;
;   si no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta
;   la que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (2 bytes)
;   0xb6c3..0xb6c5  (2 bytes)
DATA_radio_de_la_sala_202:
	defb 045h,07ah	; b6c3

; ----------------------------------------------------------------------
; DATOS radio_de_la_sala_2: las llamadas de radio de una sala: 0 = ninguna; si
;   no, parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] hasta la
;   que tiene el bit 0 (p00:48D0); lo leen p00:48D0 (1 bytes)
;   0xb6c5..0xb6c6  (1 bytes)
DATA_radio_de_la_sala_2:
	defb 000h	; b6c5

; ----------------------------------------------------------------------
; DATOS indice_de_llamadas_de_radio: 251 punteros, uno por sala (p00:48C0 ->
;   L_42B1), a las llamadas de radio de esa sala; lo leen p00:48C0 (502 bytes)
;   0xb6c6..0xb8bc  (502 bytes)
DATA_indice_de_llamadas_de_radio:
	defw 0b659h,0b65dh,0b6c5h,0b6c5h,0b65bh,0b661h,0b6c5h,0b661h	; b6c6
	defw 0b661h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b6d6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b663h,0b6c5h,0b6c5h,0b6c5h	; b6e6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b665h,0b667h,0b66bh,0b66fh	; b6f6
	defw 0b6c5h,0b671h,0b6c5h,0b6c5h,0b6c5h,0b673h,0b6c5h,0b6c5h	; b706
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b677h,0b677h,0b6c5h	; b716
	defw 0b677h,0b6c5h,0b679h,0b677h,0b6c5h,0b67bh,0b67fh,0b6c5h	; b726
	defw 0b6c5h,0b67fh,0b681h,0b681h,0b681h,0b681h,0b681h,0b681h	; b736
	defw 0b6c5h,0b6c5h,0b6c5h,0b683h,0b6c5h,0b685h,0b6c5h,0b6c5h	; b746
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b756
	defw 0b6c5h,0b6c5h,0b68bh,0b68dh,0b6c5h,0b6c5h,0b68fh,0b691h	; b766
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b693h,0b695h,0b6c5h	; b776
	defw 0b695h,0b695h,0b6c5h,0b697h,0b695h,0b6c5h,0b699h,0b69dh	; b786
	defw 0b69fh,0b6c5h,0b6c5h,0b6c5h,0b6a1h,0b6c5h,0b6c5h,0b6a5h	; b796
	defw 0b6c5h,0b6c5h,0b6c5h,0b6a9h,0b6abh,0b677h,0b6c5h,0b6adh	; b7a6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6b1h,0b6b1h,0b6b1h,0b6c5h,0b6c5h	; b7b6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b7c6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b7d6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6b5h,0b6c5h	; b7e6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b7f6
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6b7h,0b6c5h,0b6c5h	; b806
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b816
	defw 0b6c5h,0b6c5h,0b6b9h,0b6c5h,0b6c5h,0b6c5h,0b6bbh,0b6c5h	; b826
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b836
	defw 0b6bdh,0b6bfh,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b846
	defw 0b6c5h,0b6c5h,0b6c3h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b856
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b866
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6b1h,0b6b1h,0b6c5h,0b6c5h	; b876
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b886
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b896
	defw 0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h,0b6c5h	; b8a6
	defw 0b6c5h,0b6c5h,0b6c5h	; b8b6  -> DATA_radio_de_la_sala_2 DATA_radio_de_la_sala_2 DATA_radio_de_la_sala_2

; ======================================================================
; CODIGO 0xb8bc..0xbc9f  (995 bytes)
; ======================================================================


L_B8BC:
	ld hl,(0c114h)		;b8bc
	bit 2,h		;b8bf
	ld hl,0f600h		;b8c1
	ld de,0f400h		;b8c4
	ld bc,0e705h		;b8c7
	jr z,L_B8D4		;b8ca
	ld hl,0f200h		;b8cc
	ld de,0f000h		;b8cf
	ld b,0efh		;b8d2
L_B8D4:
	ld (0c116h),hl		;b8d4
	ld (0c114h),de		;b8d7
	jp 00047h		;b8db   ; BIOS WRTVDP - Writes data in the VDP-register
L_B8DE:
	ld hl,0c00fh		;b8de
	ld a,(hl)			;b8e1
	add a,068h		;b8e2
	and 078h		;b8e4
	ld (hl),a			;b8e6
	ld a,(00007h)		;b8e7
	ld c,a			;b8ea
	ld hl,(0c114h)		;b8eb
	call 040c3h		;b8ee
	ld a,(0c00fh)		;b8f1
	ld d,010h		;b8f4
	add a,a			;b8f6
L_B8F7:
	ld h,074h		;b8f7
	ld l,a			;b8f9
	add hl,hl			;b8fa
	ld b,020h		;b8fb
	otir		;b8fd
	add a,090h		;b8ff
	dec d			;b901
	jr nz,L_B8F7		;b902
	ld a,(0c00fh)		;b904
	ld d,010h		;b907
	ld h,0eah		;b909
L_B90B:
	ld l,a			;b90b
	ld b,008h		;b90c
	otir		;b90e
	add a,048h		;b910
	and 078h		;b912
	dec d			;b914
	jr nz,L_B90B		;b915
	ret			;b917
L_B918:
	ld hl,0e800h		;b918
	ld de,(0c114h)		;b91b
	ld bc,00280h		;b91f
	jr L_B945		;b922
L_B924:
	ld hl,0e840h		;b924
	ld de,(0c114h)		;b927
	ld a,040h		;b92b
	call 04055h		;b92d
	ld bc,001c0h		;b930
	call 040c8h		;b933
	ld hl,0ea10h		;b936
	ld de,(0c116h)		;b939
	ld a,010h		;b93d
	call 04055h		;b93f
	ld bc,00070h		;b942
L_B945:
	jp 040c8h		;b945
L_B948:
	ld hl,0c6a0h		;b948
	ld a,(hl)			;b94b
	inc hl			;b94c
	dec a			;b94d
	jp z,L_BAD9		;b94e
	ld a,(hl)			;b951
	ld b,a			;b952
	inc b			;b953
	djnz L_B964		;b954
	call L_BC61		;b956
	ld hl,0bc9fh		;b959
	call 040afh		;b95c
	call L_BC81		;b95f
	jr L_B97F		;b962
L_B964:
	djnz L_B981		;b964
	call L_BBEF		;b966
	jp c,L_BA89		;b969
	cp 00dh		;b96c
	ret nz			;b96e
	ld hl,0bce4h		;b96f
	call 040dch		;b972
L_B975:
	call L_BC8C		;b975
	ld (hl),a			;b978
	ld hl,0bcdbh		;b979
	call 040afh		;b97c
L_B97F:
	jr L_B9EC		;b97f
L_B981:
	djnz L_B9BD		;b981
	ld a,001h		;b983
	call 000eah		;b985   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	ld b,00ah		;b988
L_B98A:
	push bc			;b98a
	ld a,0eah		;b98b
	call 000edh		;b98d   ; BIOS TAPOUT - Writes data on the tape
	pop bc			;b990
	jr c,L_B9A9		;b991
	djnz L_B98A		;b993
	ld b,006h		;b995
	ld hl,0c6a8h		;b997
L_B99A:
	push hl			;b99a
	push bc			;b99b
	ld a,(hl)			;b99c
	call 000edh		;b99d   ; BIOS TAPOUT - Writes data on the tape
	jr c,L_B9A9		;b9a0
	pop bc			;b9a2
	pop hl			;b9a3
	inc hl			;b9a4
	djnz L_B99A		;b9a5
	jr L_B9EC		;b9a7
L_B9A9:
	call 000f0h		;b9a9   ; BIOS TAPOOF - Stops writing on the tape
	ld hl,0bcdbh		;b9ac
	call 040dch		;b9af
L_B9B2:
	call L_BC81		;b9b2
	ld b,006h		;b9b5
	ld hl,0bce4h		;b9b7
	jp L_BB5F		;b9ba
L_B9BD:
	djnz L_B9F1		;b9bd
	xor a			;b9bf
	call 000eah		;b9c0   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	jr c,L_B9A9		;b9c3
	ld de,0ca00h		;b9c5
	ld bc,00300h		;b9c8
L_B9CB:
	push de			;b9cb
	push bc			;b9cc
	ld a,(de)			;b9cd
	call 000edh		;b9ce   ; BIOS TAPOUT - Writes data on the tape
	pop bc			;b9d1
	pop de			;b9d2
	jr c,L_B9A9		;b9d3
	inc de			;b9d5
	dec bc			;b9d6
	ld a,b			;b9d7
	or c			;b9d8
	jr nz,L_B9CB		;b9d9
	ld a,(0c166h)		;b9db
	call 000edh		;b9de   ; BIOS TAPOUT - Writes data on the tape
	jr c,L_B9A9		;b9e1
	call 000f0h		;b9e3   ; BIOS TAPOOF - Stops writing on the tape
	ld hl,0bd1ah		;b9e6
	call 040afh		;b9e9
L_B9EC:
	ld hl,0c6a1h		;b9ec
	inc (hl)			;b9ef
	ret			;b9f0
L_B9F1:
	djnz L_BA6D		;b9f1
	ld hl,0e50fh		;b9f3
	bit 6,(hl)		;b9f6
	jr nz,L_BA16		;b9f8
	inc hl			;b9fa
	bit 3,(hl)		;b9fb
	ret z			;b9fd
	ld hl,0bd1ah		;b9fe
	call 040dch		;ba01
	ld hl,0bd11h		;ba04
	call 040afh		;ba07
	ld hl,0bd25h		;ba0a
	call 040afh		;ba0d
	ld a,005h		;ba10
	ld (0c6a1h),a		;ba12
	ret			;ba15
L_BA16:
	ld hl,0bd25h		;ba16
	call 040dch		;ba19
	ld hl,0bd3bh		;ba1c
	call 040afh		;ba1f
	ld hl,0bd25h		;ba22
	call 040dch		;ba25
	ld hl,0bd3bh		;ba28
	call 040afh		;ba2b
	call L_BB9A		;ba2e
	ld hl,0ca00h		;ba31
	ld bc,00300h		;ba34
L_BA37:
	push hl			;ba37
	push bc			;ba38
	call 000e4h		;ba39   ; BIOS TAPIN - Reads data from the tape
	pop bc			;ba3c
	pop hl			;ba3d
	jr c,L_BA4C		;ba3e
	cp (hl)			;ba40
	jr nz,L_BA53		;ba41
	inc hl			;ba43
	dec bc			;ba44
	ld a,b			;ba45
	or c			;ba46
	jr nz,L_BA37		;ba47
	call 000e4h		;ba49   ; BIOS TAPIN - Reads data from the tape
L_BA4C:
	jr c,L_BACC		;ba4c
	ld b,a			;ba4e
	ld a,(0c166h)		;ba4f
	cp b			;ba52
L_BA53:
	jr nz,L_BACC		;ba53
	call 000e7h		;ba55   ; BIOS TAPIOF - Stops reading from the tape
	call L_BC8C		;ba58
	cp (hl)			;ba5b
	jr nz,L_BACC		;ba5c
	ld hl,0bd00h		;ba5e
	call 040afh		;ba61
	ld hl,0bd25h		;ba64
	call 040afh		;ba67
	jp L_B9EC		;ba6a
L_BA6D:
	djnz L_BAAB		;ba6d
	ld hl,0e50fh		;ba6f
	bit 6,(hl)		;ba72
	jr z,L_BA85		;ba74
	ld hl,0bd00h		;ba76
	call 040dch		;ba79
	ld hl,0bd25h		;ba7c
	call 040dch		;ba7f
	jp L_B9B2		;ba82
L_BA85:
	inc hl			;ba85
	bit 3,(hl)		;ba86
	ret z			;ba88
L_BA89:
	ld de,0c011h		;ba89
	ld hl,0c010h		;ba8c
	ld bc,000dfh		;ba8f
	ld (hl),000h		;ba92
	ldir		;ba94
	ld hl,0c165h		;ba96
	ld (hl),000h		;ba99
	ld a,(0c6a0h)		;ba9b
	dec a			;ba9e
	jp nz,040e1h		;ba9f
	ld a,(0c167h)		;baa2
	or a			;baa5
	jp nz,040e1h		;baa6
	inc (hl)			;baa9
	ret			;baaa
L_BAAB:
	ld hl,0e50fh		;baab
	bit 6,(hl)		;baae
	jr z,L_BACE		;bab0
	ld hl,0bd11h		;bab2
	call 040dch		;bab5
	ld hl,0bd25h		;bab8
	call 040dch		;babb
	ld hl,0bcf1h		;babe
	call 040dch		;bac1
	ld a,001h		;bac4
	ld (0c6a1h),a		;bac6
	jp L_B975		;bac9
L_BACC:
	jr L_BB47		;bacc
L_BACE:
	inc hl			;bace
	bit 3,(hl)		;bacf
	ret z			;bad1
	ld a,001h		;bad2
	ld (0c167h),a		;bad4
	jr L_BA89		;bad7
L_BAD9:
	ld a,(hl)			;bad9
	ld b,a			;bada
	inc b			;badb
	djnz L_BAED		;badc
	call L_BC61		;bade
	ld hl,0bcbdh		;bae1
	call 040afh		;bae4
	call L_BC81		;bae7
	jp L_B9EC		;baea
L_BAED:
	djnz L_BB09		;baed
	call L_BBEF		;baef
	jr nc,L_BAFB		;baf2
	ld a,001h		;baf4
	ld (0c167h),a		;baf6
	jr L_BA89		;baf9
L_BAFB:
	push af			;bafb
	ld hl,0bd52h		;bafc
	call 040dch		;baff
	pop af			;bb02
	cp 00dh		;bb03
	ret nz			;bb05
	jp L_B9EC		;bb06
L_BB09:
	djnz L_BB75		;bb09
	call L_BB9A		;bb0b
	ld de,0d800h		;bb0e
	ld bc,00300h		;bb11
L_BB14:
	push de			;bb14
	push bc			;bb15
	call 000e4h		;bb16   ; BIOS TAPIN - Reads data from the tape
	pop bc			;bb19
	pop de			;bb1a
	jr c,L_BB47		;bb1b
	ld (de),a			;bb1d
	inc de			;bb1e
	dec bc			;bb1f
	ld a,b			;bb20
	or c			;bb21
	jr nz,L_BB14		;bb22
	call 000e4h		;bb24   ; BIOS TAPIN - Reads data from the tape
	jr c,L_BB47		;bb27
	ld (0c166h),a		;bb29
	call 000e7h		;bb2c   ; BIOS TAPIOF - Stops reading from the tape
	call L_BC8C		;bb2f
	cp (hl)			;bb32
	jr nz,L_BB47		;bb33
	ld de,0ca00h		;bb35
	ld hl,0d800h		;bb38
	ld bc,00300h		;bb3b
	ldir		;bb3e
	xor a			;bb40
	ld (0c167h),a		;bb41
	jp L_BA89		;bb44
L_BB47:
	call 000e7h		;bb47   ; BIOS TAPIOF - Stops reading from the tape
	ld a,001h		;bb4a
	ld (0c167h),a		;bb4c
	ld hl,0bd52h		;bb4f
	ld b,003h		;bb52
	ld a,(0c6a0h)		;bb54
	dec a			;bb57
	jr z,L_BB5F		;bb58
	ld hl,0bcf1h		;bb5a
	ld b,006h		;bb5d
L_BB5F:
	ld a,b			;bb5f
	ld (0c6a1h),a		;bb60
	call 040afh		;bb63
	ld hl,0bd11h		;bb66
	call 040afh		;bb69
	ld hl,0bd25h		;bb6c
	call 040afh		;bb6f
	jp L_BC81		;bb72
L_BB75:
	ld hl,0e50fh		;bb75
	bit 6,(hl)		;bb78
	jr z,L_BB93		;bb7a
	ld a,002h		;bb7c
	ld (0c6a1h),a		;bb7e
	ld hl,0bcf1h		;bb81
	call 040dch		;bb84
	ld hl,0bd11h		;bb87
	call 040dch		;bb8a
	ld hl,0bd1ah		;bb8d
	jp 040dch		;bb90
L_BB93:
	inc hl			;bb93
	bit 3,(hl)		;bb94
	ret z			;bb96
	jp L_BA89		;bb97
L_BB9A:
	call 000e1h		;bb9a   ; BIOS TAPION - Reads the header block after turning the cassette motor on
	jr c,L_BB47		;bb9d
	ld b,00ah		;bb9f
L_BBA1:
	push bc			;bba1
	call 000e4h		;bba2   ; BIOS TAPIN - Reads data from the tape
	pop bc			;bba5
L_BBA6:
	jr c,L_BB47		;bba6
	cp 0eah		;bba8
	jr nz,L_BB9A		;bbaa
	djnz L_BBA1		;bbac
	ld b,006h		;bbae
	ld hl,0c6a2h		;bbb0
L_BBB3:
	push bc			;bbb3
	push hl			;bbb4
	call 000e4h		;bbb5   ; BIOS TAPIN - Reads data from the tape
	pop hl			;bbb8
	pop bc			;bbb9
	ld (hl),a			;bbba
	inc hl			;bbbb
	djnz L_BBB3		;bbbc
	ld hl,0c6a2h		;bbbe
	ld de,0c6a8h		;bbc1
	ld b,006h		;bbc4
L_BBC6:
	ld a,(de)			;bbc6
	cp (hl)			;bbc7
	jr nz,L_BBDD		;bbc8
	inc hl			;bbca
	inc de			;bbcb
	djnz L_BBC6		;bbcc
	ld hl,0bd48h		;bbce
	call 040afh		;bbd1
	call L_BBE7		;bbd4
	call 000e1h		;bbd7   ; BIOS TAPION - Reads the header block after turning the cassette motor on
	jr c,L_BBA6		;bbda
	ret			;bbdc
L_BBDD:
	pop hl			;bbdd
	call 000e1h		;bbde   ; BIOS TAPION - Reads the header block after turning the cassette motor on
	ld hl,0bd41h		;bbe1
	call 040afh		;bbe4
L_BBE7:
	ld de,05860h		;bbe7
	ld hl,0c6a2h		;bbea
	jr L_BC50		;bbed
L_BBEF:
	xor a			;bbef
	ld (0fcach),a		;bbf0
	call 0009fh		;bbf3   ; BIOS CHGET - One character input (waiting)
	ld c,a			;bbf6
	ld hl,0c6aeh		;bbf7
	ld de,0c6a8h		;bbfa
	ld a,(hl)			;bbfd
	call 04055h		;bbfe
	ld a,c			;bc01
	cp 01bh		;bc02
	jr z,L_BC2E		;bc04
	cp 00dh		;bc06
	jr z,L_BC30		;bc08
	cp 008h		;bc0a
	jr z,L_BC36		;bc0c
	sub 030h		;bc0e
	cp 00ah		;bc10
	jr c,L_BC23		;bc12
	sub 011h		;bc14
	cp 01ah		;bc16
	jr c,L_BC23		;bc18
	sub 020h		;bc1a
	cp 01ah		;bc1c
	ret nc			;bc1e
	ld a,c			;bc1f
	sub 020h		;bc20
	ld c,a			;bc22
L_BC23:
	ld a,c			;bc23
	ld (de),a			;bc24
	ld a,(hl)			;bc25
	inc a			;bc26
	cp 006h		;bc27
	jr nc,L_BC4A		;bc29
	ld (hl),a			;bc2b
	jr L_BC4A		;bc2c
L_BC2E:
	scf			;bc2e
	ret			;bc2f
L_BC30:
	call L_BC4A		;bc30
	ld a,00dh		;bc33
	ret			;bc35
L_BC36:
	ex de,hl			;bc36
	ld c,(hl)			;bc37
	ld (hl),000h		;bc38
	ld a,(de)			;bc3a
	dec a			;bc3b
	jp m,L_BC4A		;bc3c
	ld (de),a			;bc3f
	ld a,c			;bc40
	and a			;bc41
	jr nz,L_BC48		;bc42
	dec hl			;bc44
	ld (hl),a			;bc45
	jr L_BC4A		;bc46
L_BC48:
	ex de,hl			;bc48
	inc (hl)			;bc49
L_BC4A:
	ld de,03050h		;bc4a
	ld hl,0c6a8h		;bc4d
L_BC50:
	ld c,001h		;bc50
	ld b,006h		;bc52
L_BC54:
	ld a,(hl)			;bc54
	inc hl			;bc55
	call 040e6h		;bc56
	ld a,d			;bc59
	add a,008h		;bc5a
	ld d,a			;bc5c
	djnz L_BC54		;bc5d
	xor a			;bc5f
	ret			;bc60
L_BC61:
	ld hl,00808h		;bc61
	ld bc,0a0a0h		;bc64
	xor a			;bc67
	ld (0c165h),a		;bc68
	ld (0c167h),a		;bc6b
	ld d,a			;bc6e
	call 04096h		;bc6f
	ld hl,0fbf0h		;bc72
	ld b,028h		;bc75
	call L_BC86		;bc77
	ld hl,0c6a8h		;bc7a
	ld b,006h		;bc7d
	jr L_BC86		;bc7f
L_BC81:
	ld hl,0c6aeh		;bc81
	ld b,00eh		;bc84
L_BC86:
	ld (hl),000h		;bc86
	inc hl			;bc88
	djnz L_BC86		;bc89
	ret			;bc8b
L_BC8C:
	ld hl,0ca00h		;bc8c
	ld bc,002ffh		;bc8f
	ld a,(hl)			;bc92
	inc hl			;bc93
L_BC94:
	add a,(hl)			;bc94
	inc hl			;bc95
	dec bc			;bc96
	ld a,c			;bc97
	or b			;bc98
	jr nz,L_BC94		;bc99
	ld hl,0c166h		;bc9b
	ret			;bc9e

; ----------------------------------------------------------------------
; DATOS rotulo_BC9F: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:B959 escribe; lo leen p15:B959 (30 bytes)
;   0xbc9f..0xbcbd  (30 bytes)
DATA_rotulo_BC9F:
	defb 010h,030h,053h,041h,056h,045h,000h,04dh,04fh,044h,045h,0feh,018h,040h,049h,04eh	; bc9f  .0SAVE.MODE..@IN
	defb 050h,055h,054h,000h,046h,049h,04ch,045h,000h,04eh,041h,04dh,045h,0ffh	; bcaf  PUT.FILE.NAME.

; ----------------------------------------------------------------------
; DATOS rotulo_BCBD: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:BAE1 escribe; lo leen p15:BAE1 (30 bytes)
;   0xbcbd..0xbcdb  (30 bytes)
DATA_rotulo_BCBD:
	defb 010h,030h,04ch,04fh,041h,044h,000h,04dh,04fh,044h,045h,0feh,018h,040h,049h,04eh	; bcbd  .0LOAD.MODE..@IN
	defb 050h,055h,054h,000h,046h,049h,04ch,045h,000h,04eh,041h,04dh,045h,0ffh	; bccd  PUT.FILE.NAME.

; ----------------------------------------------------------------------
; DATOS rotulo_BCDB: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:B979 escribe; lo leen p15:B979 (9 bytes)
;   0xbcdb..0xbce4  (9 bytes)
DATA_rotulo_BCDB:
	defb 028h,060h,053h,041h,056h,049h,04eh,047h,0ffh	; bcdb  (`SAVING.

; ----------------------------------------------------------------------
; DATOS rotulo_BCE4: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:B96F escribe; lo leen p15:B96F (13 bytes)
;   0xbce4..0xbcf1  (13 bytes)
DATA_rotulo_BCE4:
	defb 028h,060h,053h,041h,056h,045h,000h,045h,052h,052h,04fh,052h,0ffh	; bce4  (`SAVE.ERROR.

; ----------------------------------------------------------------------
; DATOS rotulo_BCF1: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:BABE escribe; lo leen p15:BABE (15 bytes)
;   0xbcf1..0xbd00  (15 bytes)
DATA_rotulo_BCF1:
	defb 028h,060h,056h,045h,052h,049h,046h,059h,000h,045h,052h,052h,04fh,052h,0ffh	; bcf1  (`VERIFY.ERROR.

; ----------------------------------------------------------------------
; DATOS rotulo_BD00: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:BA5E escribe; se solapan 2 bloques: (rotulo_BD11
;   BD11-BD1A); lo leen p15:BA5E, p15:BA04 (26 bytes)
;   0xbd00..0xbd1a  (26 bytes)
DATA_rotulo_BD00:
	defb 020h,060h,056h,045h,052h,049h,046h,059h,000h,053h,055h,043h,043h,045h,053h,053h	; bd00   `VERIFY.SUCCESS
	defb 0feh,020h,070h,052h,045h,054h,052h,059h,05bh,0ffh	; bd10  . pRETRY[.

; ----------------------------------------------------------------------
; DATOS rotulo_BD1A: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:B9E6 escribe; se solapan 2 bloques: (rotulo_BD25
;   BD25-BD3B); lo leen p15:B9E6, p15:BA0A (33 bytes)
;   0xbd1a..0xbd3b  (33 bytes)
DATA_rotulo_BD1A:
	defb 028h,060h,056h,045h,052h,049h,046h,059h,05bh,000h,0feh,020h,080h,059h,045h,053h	; bd1a  (`VERIFY[.. .YES
	defb 000h,000h,000h,000h,059h,0feh,020h,088h,04eh,04fh,000h,000h,000h,000h,000h,04eh	; bd2a  ....Y. .NO.....N
	defb 0ffh	; bd3a

; ----------------------------------------------------------------------
; DATOS rotulo_BD3B: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:BA1C escribe; lo leen p15:BA1C (6 bytes)
;   0xbd3b..0xbd41  (6 bytes)
DATA_rotulo_BD3B:
	defb 058h,060h,049h,04eh,047h,0ffh	; bd3b

; ----------------------------------------------------------------------
; DATOS rotulo_BD41: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:BBE1 escribe; lo leen p15:BBE1 (7 bytes)
;   0xbd41..0xbd48  (7 bytes)
DATA_rotulo_BD41:
	defb 028h,060h,053h,04bh,049h,050h,0ffh	; bd41

; ----------------------------------------------------------------------
; DATOS rotulo_BD48: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:BBCE escribe; lo leen p15:BBCE (10 bytes)
;   0xbd48..0xbd52  (10 bytes)
DATA_rotulo_BD48:
	defb 028h,060h,046h,04fh,055h,04eh,044h,000h,000h,0ffh	; bd48  (`FOUND...

; ----------------------------------------------------------------------
; DATOS rotulo_BD52: rotulo con posicion de la pantalla de guardar y cargar
;   (L_510C), que p15:BAFC escribe; lo leen p15:BAFC (16 bytes)
;   0xbd52..0xbd62  (16 bytes)
DATA_rotulo_BD52:
	defb 028h,060h,04ch,04fh,041h,044h,000h,045h,052h,052h,04fh,052h,000h,000h,000h,0ffh	; bd52  (`LOAD.ERROR....

; ======================================================================
; CODIGO 0xbd62..0xbfa7  (581 bytes)
; ======================================================================


L_BD62:
	call 040a0h		;bd62
	call 0409bh		;bd65
	ld a,0fbh		;bd68
	ld (0c130h),a		;bd6a   ; guarda la sala
	call 040fah		;bd6d
	call 040ffh		;bd70
	xor a			;bd73
	ld (0c922h),a		;bd74
	ld hl,00200h		;bd77
	ld (0c13dh),hl		;bd7a
	ld a,004h		;bd7d
	ld (0c151h),a		;bd7f   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ld a,080h		;bd82
	ld (0c184h),a		;bd84   ; guarda la X de Snake
	ld (0c182h),a		;bd87   ; guarda la Y de Snake
	ld a,013h		;bd8a
	ld (0c138h),a		;bd8c   ; guarda la frecuencia del transceptor (BCD)
	jp 040aah		;bd8f
L_BD92:
	ld a,(0c922h)		;bd92
	ld b,a			;bd95
	djnz L_BDBA		;bd96
	call L_BECB		;bd98
	ld hl,0c923h		;bd9b
	dec (hl)			;bd9e
	jp nz,L_BEE8		;bd9f
	ld a,080h		;bda2
	ld (0c923h),a		;bda4
	xor a			;bda7
	ld (0c18ah),a		;bda8   ; guarda la pose de Snake
	call L_BEE2		;bdab
	ld hl,08040h		;bdae
	ld bc,04028h		;bdb1
	ld d,a			;bdb4
	call 04096h		;bdb5
	jr L_BE2C		;bdb8
L_BDBA:
	djnz L_BDC7		;bdba
	ld hl,0c923h		;bdbc
	dec (hl)			;bdbf
	ret nz			;bdc0
	xor a			;bdc1
	ld (0c923h),a		;bdc2
	jr L_BE2C		;bdc5
L_BDC7:
	djnz L_BDD2		;bdc7
	ld hl,0c923h		;bdc9
	dec (hl)			;bdcc
	jp nz,L_BEE8		;bdcd
	jr L_BE2C		;bdd0
L_BDD2:
	djnz L_BDE9		;bdd2
	ld a,(0c032h)		;bdd4
	and a			;bdd7
	ret nz			;bdd8
	call 040ebh		;bdd9
	call 04190h		;bddc
	call 0407dh		;bddf
	ld a,040h		;bde2
	ld (0c923h),a		;bde4
	jr L_BE2C		;bde7
L_BDE9:
	djnz L_BDF7		;bde9
	ld hl,0c923h		;bdeb
	dec (hl)			;bdee
	ret nz			;bdef
	call 04154h		;bdf0
	ld a,09bh		;bdf3
	jr L_BE42		;bdf5
L_BDF7:
	djnz L_BE07		;bdf7
	call L_BEC2		;bdf9
	ret nz			;bdfc
	call 0414fh		;bdfd
	ld a,050h		;be00
	call 0405ah		;be02
	jr L_BE2C		;be05
L_BE07:
	djnz L_BE31		;be07
	ld a,(0c003h)		;be09   ; lee la cuenta de cuadros
	and 003h		;be0c
	ret nz			;be0e
	ld hl,0c138h		;be0f   ; apunta a la frecuencia del transceptor (BCD)
	ld a,(hl)			;be12
	add a,001h		;be13
	daa			;be15
	ld (hl),a			;be16
	call 04181h		;be17
	ld a,(0c138h)		;be1a   ; lee la frecuencia del transceptor (BCD)
	cp 077h		;be1d
	ret nz			;be1f
	ld a,010h		;be20
	ld (0c802h),a		;be22
	xor a			;be25
	ld (0c801h),a		;be26   ; guarda la barra de senal del transceptor (0-12)
	ld (0c153h),a		;be29   ; guarda el paso del modo
L_BE2C:
	ld hl,0c922h		;be2c
	inc (hl)			;be2f
	ret			;be30
L_BE31:
	djnz L_BE44		;be31
	call 04082h		;be33
	ld a,(0c153h)		;be36   ; lee el paso del modo
	dec a			;be39
	ret nz			;be3a
	ld a,05ch		;be3b
	call 0405ah		;be3d
	ld a,01fh		;be40
L_BE42:
	jr L_BE51		;be42
L_BE44:
	djnz L_BE53		;be44
	call L_BEC2		;be46
	ret nz			;be49
	ld a,041h		;be4a
	call 0405ah		;be4c
	ld a,02dh		;be4f
L_BE51:
	jr L_BE89		;be51
L_BE53:
	djnz L_BE63		;be53
	call L_BEC2		;be55
	ret nz			;be58
	ld a,05ch		;be59
	ld (0c0f4h),a		;be5b
	call 04177h		;be5e
	jr L_BE2C		;be61
L_BE63:
	djnz L_BE73		;be63
	call 0417ch		;be65
	ret nc			;be68
	call 0409bh		;be69
	ld a,070h		;be6c
	ld (0c923h),a		;be6e
	jr L_BE2C		;be71
L_BE73:
	djnz L_BE8F		;be73
	ld hl,0c923h		;be75
	dec (hl)			;be78
	ret nz			;be79
	ld a,05ch		;be7a
	call 0405ah		;be7c
	ld a,00eh		;be7f
	ld de,07707h		;be81
	call 040cdh		;be84
	ld a,00fh		;be87
L_BE89:
	call L_BE2C		;be89
	jp 04127h		;be8c
L_BE8F:
	djnz L_BE9A		;be8f
	call L_BEC2		;be91
	ret nz			;be94
	call 040aah		;be95
	jr L_BE2C		;be98
L_BE9A:
	call L_BECB		;be9a
	ld hl,0c13eh		;be9d
	ld a,(hl)			;bea0
	dec hl			;bea1
	or (hl)			;bea2
	jr z,L_BEB1		;bea3
	ld a,(hl)			;bea5
	sub 001h		;bea6
	daa			;bea8
	ld (hl),a			;bea9
	jr nc,L_BEAE		;beaa
	inc hl			;beac
	dec (hl)			;bead
L_BEAE:
	jp 0412ch		;beae
L_BEB1:
	xor a			;beb1
	ld (0c923h),a		;beb2
	ld hl,070c0h		;beb5
	ld bc,02010h		;beb8
	ld d,a			;bebb
	call 04096h		;bebc
	jp L_BE2C		;bebf
L_BEC2:
	call 0414ah		;bec2
	ld a,(0c151h)		;bec5   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 004h		;bec8
	ret			;beca
L_BECB:
	ld a,(0c003h)		;becb   ; lee la cuenta de cuadros
	bit 3,a		;bece
	ld a,004h		;bed0
	jr z,L_BED5		;bed2
	inc a			;bed4
L_BED5:
	ld (0c18ah),a		;bed5   ; guarda la pose de Snake
	ld hl,(0c183h)		;bed8   ; lee la X de Snake (16 bits)
	ld de,0fff8h		;bedb
	add hl,de			;bede
	ld (0c183h),hl		;bedf   ; guarda la X de Snake (16 bits)
L_BEE2:
	call 04186h		;bee2
	jp 0418bh		;bee5
L_BEE8:
	ld a,(hl)			;bee8
	cp 0e8h		;bee9
	ld c,a			;beeb
	ld a,056h		;beec
	jp z,0405ah		;beee
	ld a,c			;bef1
	cp 0e0h		;bef2
	ld de,09060h		;bef4
	ld hl,0b31fh		;bef7
	jr z,L_BF1F		;befa
	cp 0d0h		;befc
	ld de,08050h		;befe
	ld hl,0b325h		;bf01
	jr z,L_BF1F		;bf04
	cp 0c0h		;bf06
	jr z,L_BF1A		;bf08
	ret nc			;bf0a
	ld c,a			;bf0b
	and 007h		;bf0c
	ret nz			;bf0e
	bit 4,c		;bf0f
	ld a,00fh		;bf11
	jr nz,L_BF17		;bf13
	ld a,00dh		;bf15
L_BF17:
	jp 04145h		;bf17
L_BF1A:
	ld e,040h		;bf1a
	ld hl,0b33fh		;bf1c
L_BF1F:
	jp 04104h		;bf1f
L_BF22:
	ld a,(0c135h)		;bf22   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 004h		;bf25
	ret nz			;bf27
	ld a,(0c602h)		;bf28   ; lee la bandera 0xC602 (refuerzos y musica)
	and a			;bf2b
	ret nz			;bf2c
	ld a,(0c130h)		;bf2d   ; lee la sala
	sub 018h		;bf30
	jr z,L_BF3A		;bf32
	dec a			;bf34
	jr z,L_BF3A		;bf35
	cp 02fh		;bf37
	ret nz			;bf39
L_BF3A:
	ld hl,0d000h		;bf3a   ; apunta a los 16 actores (fichas de 0x80)
	ld a,(0c609h)		;bf3d
	ld b,a			;bf40
L_BF41:
	push bc			;bf41
	push hl			;bf42
	inc hl			;bf43
	bit 0,(hl)		;bf44
	jr z,L_BF64		;bf46
	inc hl			;bf48
	inc hl			;bf49
	ld e,(hl)			;bf4a
	inc hl			;bf4b
	inc hl			;bf4c
	ld d,(hl)			;bf4d
	ld a,010h		;bf4e
	call 04050h		;bf50
	ld b,(hl)			;bf53
	inc hl			;bf54
	ld a,(hl)			;bf55
	and a			;bf56
	ld c,008h		;bf57
	ex de,hl			;bf59
	jr nz,L_BF61		;bf5a
	call 04131h		;bf5c
	jr L_BF64		;bf5f
L_BF61:
	call 04136h		;bf61
L_BF64:
	pop hl			;bf64
	pop bc			;bf65
	ld a,080h		;bf66
	call 04050h		;bf68
	djnz L_BF41		;bf6b
	ret			;bf6d
L_BF6E:
	ld hl,0d000h		;bf6e   ; apunta a los 16 actores (fichas de 0x80)
	ld a,(0c609h)		;bf71
	ld b,a			;bf74
L_BF75:
	push bc			;bf75
	push hl			;bf76
	inc hl			;bf77
	bit 0,(hl)		;bf78
	jr z,L_BF9D		;bf7a
	inc hl			;bf7c
	inc hl			;bf7d
	ld e,(hl)			;bf7e
	inc hl			;bf7f
	inc hl			;bf80
	ld d,(hl)			;bf81
	ld a,011h		;bf82
	call 04050h		;bf84
	ld c,(hl)			;bf87
	dec hl			;bf88
	ld b,(hl)			;bf89
	dec hl			;bf8a
	ld a,(hl)			;bf8b
	dec hl			;bf8c
	ld l,(hl)			;bf8d
	ld h,a			;bf8e
	ld a,c			;bf8f
	ld c,002h		;bf90
	rra			;bf92
	jr c,L_BF98		;bf93
	ld a,b			;bf95
	ld b,c			;bf96
	ld c,a			;bf97
L_BF98:
	ld a,001h		;bf98
	call 04122h		;bf9a
L_BF9D:
	pop hl			;bf9d
	pop bc			;bf9e
	ld a,080h		;bf9f
	call 04050h		;bfa1
	djnz L_BF75		;bfa4
	ret			;bfa6

; ----------------------------------------------------------------------
; DATOS relleno_ff: 89 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (89 bytes)
;   0xbfa7..0xc000  (89 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff7  .........
