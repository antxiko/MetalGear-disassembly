; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 06 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS camino_9FFF_cola: el camino del actor 1 de la sala 33: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente) (sigue del banco 5); lo leen p00:59F5 (12
;   bytes)
;   0xa000..0xa00c  (12 bytes)
DATA_camino_9FFF_cola:
	defb 030h,028h	; a000
	defb 0abh,028h	; a002
	defb 0abh,078h	; a004
	defb 0abh,028h	; a006
	defb 030h,028h	; a008
	defb 030h,078h	; a00a

; ----------------------------------------------------------------------
; DATOS camino_A00C: el camino del actor 2 de la sala 33: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (13 bytes)
;   0xa00c..0xa019  (13 bytes)
DATA_camino_A00C:
	defb 006h,030h	; a00c
	defb 0d8h,0b0h	; a00e
	defb 0d8h,0b0h	; a010
	defb 088h,0b0h	; a012
	defb 0d8h,030h	; a014
	defb 0d8h,030h	; a016
	defb 088h	; a018

; ----------------------------------------------------------------------
; DATOS camino_A019: el camino del actor 1 de la sala 34: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (11 bytes)
;   0xa019..0xa024  (11 bytes)
DATA_camino_A019:
	defb 005h,070h	; a019
	defb 078h,070h	; a01b
	defb 018h,070h	; a01d
	defb 088h,070h	; a01f
	defb 078h,028h	; a021
	defb 078h	; a023

; ----------------------------------------------------------------------
; DATOS camino_A024: el camino del actor 2 de la sala 34: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (11 bytes)
;   0xa024..0xa02f  (11 bytes)
DATA_camino_A024:
	defb 005h,070h	; a024
	defb 0c8h,070h	; a026
	defb 0f0h,070h	; a028
	defb 098h,070h	; a02a
	defb 0c8h,028h	; a02c
	defb 0c8h	; a02e

; ----------------------------------------------------------------------
; DATOS camino_A02F: el camino del actor 1 de la sala 35: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa02f..0xa034  (5 bytes)
DATA_camino_A02F:
	defb 002h,028h	; a02f
	defb 0d8h,028h	; a031
	defb 068h	; a033

; ----------------------------------------------------------------------
; DATOS camino_A034: el camino del actor 2 de la sala 35: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa034..0xa039  (5 bytes)
DATA_camino_A034:
	defb 002h,030h	; a034
	defb 018h,0b0h	; a036
	defb 018h	; a038

; ----------------------------------------------------------------------
; DATOS camino_A039: el camino del actor 3 de la sala 35: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa039..0xa03e  (5 bytes)
DATA_camino_A039:
	defb 002h,0b0h	; a039
	defb 068h,0b0h	; a03b
	defb 0d8h	; a03d

; ----------------------------------------------------------------------
; DATOS camino_A03E: el camino del actor 1 de la sala 36: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa03e..0xa043  (5 bytes)
DATA_camino_A03E:
	defb 002h,038h	; a03e
	defb 010h,038h	; a040
	defb 060h	; a042

; ----------------------------------------------------------------------
; DATOS camino_A043: el camino del actor 2 de la sala 36: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa043..0xa048  (5 bytes)
DATA_camino_A043:
	defb 002h,078h	; a043
	defb 0a0h,078h	; a045
	defb 0f0h	; a047

; ----------------------------------------------------------------------
; DATOS camino_A048: el camino del actor 3 de la sala 36: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (13 bytes)
;   0xa048..0xa055  (13 bytes)
DATA_camino_A048:
	defb 006h,0a8h	; a048
	defb 088h,0a8h	; a04a
	defb 0b0h,0a8h	; a04c
	defb 088h,070h	; a04e
	defb 088h,070h	; a050
	defb 040h,070h	; a052
	defb 088h	; a054

; ----------------------------------------------------------------------
; DATOS camino_A055: el camino del actor 1 de la sala 37: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa055..0xa05e  (9 bytes)
DATA_camino_A055:
	defb 004h,010h	; a055
	defb 038h,050h	; a057
	defb 038h,090h	; a059
	defb 038h,0b8h	; a05b
	defb 038h	; a05d

; ----------------------------------------------------------------------
; DATOS camino_A05E: el camino del actor 2 de la sala 37: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa05e..0xa067  (9 bytes)
DATA_camino_A05E:
	defb 004h,088h	; a05e
	defb 0c8h,010h	; a060
	defb 0c8h,088h	; a062
	defb 0c8h,088h	; a064
	defb 068h	; a066

; ----------------------------------------------------------------------
; DATOS camino_A067: el camino del actor 1 de la sala 40: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa067..0xa070  (9 bytes)
DATA_camino_A067:
	defb 004h,038h	; a067
	defb 018h,090h	; a069
	defb 018h,090h	; a06b
	defb 070h,038h	; a06d
	defb 070h	; a06f

; ----------------------------------------------------------------------
; DATOS camino_A070: el camino del actor 1 de la sala 43: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa070..0xa079  (9 bytes)
DATA_camino_A070:
	defb 004h,090h	; a070
	defb 068h,038h	; a072
	defb 068h,038h	; a074
	defb 018h,090h	; a076
	defb 018h	; a078

; ----------------------------------------------------------------------
; DATOS camino_A079: el camino del actor 2 de la sala 43: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa079..0xa082  (9 bytes)
DATA_camino_A079:
	defb 004h,028h	; a079
	defb 098h,088h	; a07b
	defb 098h,088h	; a07d
	defb 0e8h,028h	; a07f
	defb 0e8h	; a081

; ----------------------------------------------------------------------
; DATOS camino_A082: el camino del actor 1 de la sala 44: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (17 bytes)
;   0xa082..0xa093  (17 bytes)
DATA_camino_A082:
	defb 008h,038h	; a082
	defb 038h,038h	; a084
	defb 068h,068h	; a086
	defb 068h,068h	; a088
	defb 0c8h,0a8h	; a08a
	defb 0c8h,0a8h	; a08c
	defb 098h,068h	; a08e
	defb 098h,068h	; a090
	defb 038h	; a092

; ----------------------------------------------------------------------
; DATOS camino_A093: el camino del actor 2 de la sala 44: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (19 bytes)
;   0xa093..0xa0a6  (19 bytes)
DATA_camino_A093:
	defb 009h,078h	; a093
	defb 088h,078h	; a095
	defb 0b8h,078h	; a097
	defb 0e8h,038h	; a099
	defb 0e8h,038h	; a09b
	defb 0b8h,078h	; a09d
	defb 0b8h,078h	; a09f
	defb 058h,0a8h	; a0a1
	defb 058h,0a8h	; a0a3
	defb 088h	; a0a5

; ----------------------------------------------------------------------
; DATOS camino_A0A6: el camino del actor 3 de la sala 44 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0a6..0xa0ab  (5 bytes)
DATA_camino_A0A6:
	defb 002h,028h	; a0a6
	defb 068h,028h	; a0a8
	defb 010h	; a0aa

; ----------------------------------------------------------------------
; DATOS camino_A0AB: el camino del actor 4 de la sala 44 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0ab..0xa0b0  (5 bytes)
DATA_camino_A0AB:
	defb 002h,050h	; a0ab
	defb 058h,050h	; a0ad
	defb 0a8h	; a0af

; ----------------------------------------------------------------------
; DATOS camino_A0B0: el camino del actor 5 de la sala 44 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0b0..0xa0b5  (5 bytes)
DATA_camino_A0B0:
	defb 002h,028h	; a0b0
	defb 098h,028h	; a0b2
	defb 0e8h	; a0b4

; ----------------------------------------------------------------------
; DATOS camino_A0B5: el camino del actor 6 de la sala 44 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (13 bytes)
;   0xa0b5..0xa0c2  (13 bytes)
DATA_camino_A0B5:
	defb 006h,070h	; a0b5
	defb 080h,070h	; a0b7
	defb 0d0h,070h	; a0b9
	defb 080h,030h	; a0bb
	defb 080h,030h	; a0bd
	defb 040h,030h	; a0bf
	defb 080h	; a0c1

; ----------------------------------------------------------------------
; DATOS camino_A0C2: el camino del actor 7 de la sala 44 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa0c2..0xa0cb  (9 bytes)
DATA_camino_A0C2:
	defb 004h,030h	; a0c2
	defb 018h,030h	; a0c4
	defb 068h,030h	; a0c6
	defb 0b0h,030h	; a0c8
	defb 0e0h	; a0ca

; ----------------------------------------------------------------------
; DATOS camino_A0CB: el camino del actor 8 de la sala 44 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (11 bytes)
;   0xa0cb..0xa0d6  (11 bytes)
DATA_camino_A0CB:
	defb 005h,090h	; a0cb
	defb 0e0h,090h	; a0cd
	defb 078h,090h	; a0cf
	defb 0a8h,090h	; a0d1
	defb 0b8h,090h	; a0d3
	defb 018h	; a0d5

; ----------------------------------------------------------------------
; DATOS camino_A0D6: el camino del actor 5 de la sala 53 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0d6..0xa0db  (5 bytes)
DATA_camino_A0D6:
	defb 002h,045h	; a0d6
	defb 018h,045h	; a0d8
	defb 050h	; a0da

; ----------------------------------------------------------------------
; DATOS camino_A0DB: el camino del actor 6 de la sala 53 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0db..0xa0e0  (5 bytes)
DATA_camino_A0DB:
	defb 002h,02bh	; a0db
	defb 090h,02bh	; a0dd
	defb 0f0h	; a0df

; ----------------------------------------------------------------------
; DATOS camino_A0E0: el camino del actor 7 de la sala 53 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0e0..0xa0e5  (5 bytes)
DATA_camino_A0E0:
	defb 002h,028h	; a0e0
	defb 090h,028h	; a0e2
	defb 0f0h	; a0e4

; ----------------------------------------------------------------------
; DATOS camino_A0E5: el camino del actor 8 de la sala 53 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0e5..0xa0ea  (5 bytes)
DATA_camino_A0E5:
	defb 002h,048h	; a0e5
	defb 030h,090h	; a0e7
	defb 030h	; a0e9

; ----------------------------------------------------------------------
; DATOS camino_A0EA: el camino del actor 9 de la sala 53 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0ea..0xa0ef  (5 bytes)
DATA_camino_A0EA:
	defb 002h,0abh	; a0ea
	defb 030h,0abh	; a0ec
	defb 090h	; a0ee

; ----------------------------------------------------------------------
; DATOS camino_A0EF: el camino del actor 2 de la sala 75: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0ef..0xa0f4  (5 bytes)
DATA_camino_A0EF:
	defb 002h,050h	; a0ef
	defb 0d8h,0b0h	; a0f1
	defb 0d8h	; a0f3

; ----------------------------------------------------------------------
; DATOS camino_A0F4: el camino del actor 3 de la sala 75: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa0f4..0xa0f9  (5 bytes)
DATA_camino_A0F4:
	defb 002h,0abh	; a0f4
	defb 060h,0abh	; a0f6
	defb 0c0h	; a0f8

; ----------------------------------------------------------------------
; DATOS camino_A0F9: el camino del actor 1 de la sala 78: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa0f9..0xa102  (9 bytes)
DATA_camino_A0F9:
	defb 004h,040h	; a0f9
	defb 040h,080h	; a0fb
	defb 040h,080h	; a0fd
	defb 020h,040h	; a0ff
	defb 020h	; a101

; ----------------------------------------------------------------------
; DATOS camino_A102: el camino del actor 2 de la sala 78: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa102..0xa107  (5 bytes)
DATA_camino_A102:
	defb 002h,0abh	; a102
	defb 060h,0abh	; a104
	defb 020h	; a106

; ----------------------------------------------------------------------
; DATOS camino_A107: el camino del actor 3 de la sala 78: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (7 bytes)
;   0xa107..0xa10e  (7 bytes)
DATA_camino_A107:
	defb 003h,060h	; a107
	defb 090h,038h	; a109
	defb 090h,018h	; a10b
	defb 090h	; a10d

; ----------------------------------------------------------------------
; DATOS camino_A10E: el camino del actor 4 de la sala 78: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (7 bytes)
;   0xa10e..0xa115  (7 bytes)
DATA_camino_A10E:
	defb 003h,010h	; a10e
	defb 0e0h,01ch	; a110
	defb 0e0h,070h	; a112
	defb 0e0h	; a114

; ----------------------------------------------------------------------
; DATOS camino_A115: el camino del actor 1 de la sala 81: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa115..0xa11a  (5 bytes)
DATA_camino_A115:
	defb 002h,0b0h	; a115
	defb 01ch,080h	; a117
	defb 01ch	; a119

; ----------------------------------------------------------------------
; DATOS camino_A11A: el camino del actor 2 de la sala 81: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa11a..0xa123  (9 bytes)
DATA_camino_A11A:
	defb 004h,030h	; a11a
	defb 050h,030h	; a11c
	defb 020h,070h	; a11e
	defb 020h,030h	; a120
	defb 020h	; a122

; ----------------------------------------------------------------------
; DATOS camino_A123: el camino del actor 3 de la sala 81: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa123..0xa12c  (9 bytes)
DATA_camino_A123:
	defb 004h,02bh	; a123
	defb 0a0h,02bh	; a125
	defb 0e0h,060h	; a127
	defb 0e0h,02bh	; a129
	defb 0e0h	; a12b

; ----------------------------------------------------------------------
; DATOS camino_A12C: el camino del actor 4 de la sala 81: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (7 bytes)
;   0xa12c..0xa133  (7 bytes)
DATA_camino_A12C:
	defb 003h,078h	; a12c
	defb 0e0h,090h	; a12e
	defb 0e0h,0b0h	; a130
	defb 0e0h	; a132

; ----------------------------------------------------------------------
; DATOS camino_A133: el camino del actor 1 de la sala 83: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa133..0xa13c  (9 bytes)
DATA_camino_A133:
	defb 004h,02ah	; a133
	defb 060h,02ah	; a135
	defb 040h,02ah	; a137
	defb 020h,02ah	; a139
	defb 040h	; a13b

; ----------------------------------------------------------------------
; DATOS camino_A13C: el camino del actor 2 de la sala 83: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (7 bytes)
;   0xa13c..0xa143  (7 bytes)
DATA_camino_A13C:
	defb 003h,0b0h	; a13c
	defb 030h,090h	; a13e
	defb 030h,070h	; a140
	defb 030h	; a142

; ----------------------------------------------------------------------
; DATOS camino_A143: el camino del actor 3 de la sala 83: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa143..0xa148  (5 bytes)
DATA_camino_A143:
	defb 002h,030h	; a143
	defb 090h,030h	; a145
	defb 0e0h	; a147

; ----------------------------------------------------------------------
; DATOS camino_A148: el camino del actor 4 de la sala 83: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa148..0xa151  (9 bytes)
DATA_camino_A148:
	defb 004h,070h	; a148
	defb 088h,070h	; a14a
	defb 09ah,070h	; a14c
	defb 0d0h,070h	; a14e
	defb 09ah	; a150

; ----------------------------------------------------------------------
; DATOS camino_A151: el camino del actor 1 de la sala 85: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (11 bytes)
;   0xa151..0xa15c  (11 bytes)
DATA_camino_A151:
	defb 005h,0b0h	; a151
	defb 060h,0b0h	; a153
	defb 038h,0b0h	; a155
	defb 078h,0b0h	; a157
	defb 060h,070h	; a159
	defb 060h	; a15b

; ----------------------------------------------------------------------
; DATOS camino_A15C: el camino del actor 2 de la sala 86: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa15c..0xa161  (5 bytes)
DATA_camino_A15C:
	defb 002h,060h	; a15c
	defb 030h,028h	; a15e
	defb 030h	; a160

; ----------------------------------------------------------------------
; DATOS camino_A161: el camino del actor 3 de la sala 86: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa161..0xa166  (5 bytes)
DATA_camino_A161:
	defb 002h,0abh	; a161
	defb 0b0h,0abh	; a163
	defb 058h	; a165

; ----------------------------------------------------------------------
; DATOS camino_A166: el camino del actor 1 de la sala 88: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa166..0xa16f  (9 bytes)
DATA_camino_A166:
	defb 004h,017h	; a166
	defb 030h,017h	; a168
	defb 060h,017h	; a16a
	defb 030h,040h	; a16c
	defb 030h	; a16e

; ----------------------------------------------------------------------
; DATOS camino_A16F: el camino del actor 2 de la sala 88: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa16f..0xa178  (9 bytes)
DATA_camino_A16F:
	defb 004h,025h	; a16f
	defb 0d0h,025h	; a171
	defb 0a0h,025h	; a173
	defb 0d0h,050h	; a175
	defb 0d0h	; a177

; ----------------------------------------------------------------------
; DATOS camino_A178: el camino del actor 3 de la sala 88: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa178..0xa17d  (5 bytes)
DATA_camino_A178:
	defb 002h,078h	; a178
	defb 030h,0b0h	; a17a
	defb 030h	; a17c

; ----------------------------------------------------------------------
; DATOS camino_A17D: el camino del actor 4 de la sala 88: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa17d..0xa182  (5 bytes)
DATA_camino_A17D:
	defb 002h,070h	; a17d
	defb 0d0h,0b0h	; a17f
	defb 0d0h	; a181

; ----------------------------------------------------------------------
; DATOS camino_A182: el camino del actor 5 de la sala 88 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa182..0xa187  (5 bytes)
DATA_camino_A182:
	defb 002h,018h	; a182
	defb 040h,018h	; a184
	defb 0a0h	; a186

; ----------------------------------------------------------------------
; DATOS camino_A187: el camino del actor 6 de la sala 88 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa187..0xa18c  (5 bytes)
DATA_camino_A187:
	defb 002h,078h	; a187
	defb 0e0h,078h	; a189
	defb 038h	; a18b

; ----------------------------------------------------------------------
; DATOS camino_A18C: el camino del actor 7 de la sala 88 y 2 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa18c..0xa191  (5 bytes)
DATA_camino_A18C:
	defb 002h,010h	; a18c
	defb 010h,010h	; a18e
	defb 058h	; a190

; ----------------------------------------------------------------------
; DATOS camino_A191: el camino del actor 8 de la sala 88 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa191..0xa196  (5 bytes)
DATA_camino_A191:
	defb 002h,010h	; a191
	defb 0f0h,010h	; a193
	defb 0c0h	; a195

; ----------------------------------------------------------------------
; DATOS camino_A196: el camino del actor 9 de la sala 88 y 2 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa196..0xa19b  (5 bytes)
DATA_camino_A196:
	defb 002h,018h	; a196
	defb 07ch,018h	; a198
	defb 058h	; a19a

; ----------------------------------------------------------------------
; DATOS camino_A19B: el camino del actor 4 de la sala 112 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa19b..0xa1a0  (5 bytes)
DATA_camino_A19B:
	defb 002h,018h	; a19b
	defb 084h,018h	; a19d
	defb 0a8h	; a19f

; ----------------------------------------------------------------------
; DATOS camino_A1A0: el camino del actor 5 de la sala 112 y 2 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa1a0..0xa1a5  (5 bytes)
DATA_camino_A1A0:
	defb 002h,058h	; a1a0
	defb 048h,058h	; a1a2
	defb 0b8h	; a1a4

; ----------------------------------------------------------------------
; DATOS camino_A1A5: el camino del actor 1 de la sala 141: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (9 bytes)
;   0xa1a5..0xa1ae  (9 bytes)
DATA_camino_A1A5:
	defb 004h,080h	; a1a5
	defb 098h,080h	; a1a7
	defb 0c8h,038h	; a1a9
	defb 0c8h,038h	; a1ab
	defb 098h	; a1ad

; ----------------------------------------------------------------------
; DATOS camino_A1AE: el camino del actor 1 de la sala 39 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (3 bytes)
;   0xa1ae..0xa1b1  (3 bytes)
DATA_camino_A1AE:
	defb 002h,003h	; a1ae
	defb 001h	; a1b0

; ----------------------------------------------------------------------
; DATOS camino_A1B1: el camino del actor 3 de la sala 8 y 4 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (3 bytes)
;   0xa1b1..0xa1b4  (3 bytes)
DATA_camino_A1B1:
	defb 002h,002h	; a1b1
	defb 001h	; a1b3

; ----------------------------------------------------------------------
; DATOS camino_A1B4: el camino del actor 3 de la sala 82 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (3 bytes)
;   0xa1b4..0xa1b7  (3 bytes)
DATA_camino_A1B4:
	defb 002h,002h	; a1b4
	defb 000h	; a1b6

; ----------------------------------------------------------------------
; DATOS camino_A1B7: el camino del actor 9 de la sala 44 y 5 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (4 bytes)
;   0xa1b7..0xa1bb  (4 bytes)
DATA_camino_A1B7:
	defb 003h,003h	; a1b7
	defb 001h,002h	; a1b9

; ----------------------------------------------------------------------
; DATOS camino_A1BB: el camino del actor 2 de la sala 53 y 1 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa1bb..0xa1c0  (5 bytes)
DATA_camino_A1BB:
	defb 004h,001h	; a1bb
	defb 002h,001h	; a1bd
	defb 003h	; a1bf

; ----------------------------------------------------------------------
; DATOS camino_A1C0: el camino del actor 1 de la sala 75 y 2 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (5 bytes)
;   0xa1c0..0xa1c5  (5 bytes)
DATA_camino_A1C0:
	defb 004h,003h	; a1c0
	defb 001h,002h	; a1c2
	defb 001h	; a1c4

; ----------------------------------------------------------------------
; DATOS camino_A1C5: el camino del actor 1 de la sala 8 y 4 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (4 bytes)
;   0xa1c5..0xa1c9  (4 bytes)
DATA_camino_A1C5:
	defb 003h,002h	; a1c5
	defb 000h,003h	; a1c7

; ----------------------------------------------------------------------
; DATOS camino_A1C9: el camino del actor 6 de la sala 112 y 12 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (2 bytes)
;   0xa1c9..0xa1cb  (2 bytes)
DATA_camino_A1C9:
	defb 001h,003h	; a1c9

; ----------------------------------------------------------------------
; DATOS camino_A1CB: el camino del actor 8 de la sala 112 y 3 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (2 bytes)
;   0xa1cb..0xa1cd  (2 bytes)
DATA_camino_A1CB:
	defb 001h,002h	; a1cb

; ----------------------------------------------------------------------
; DATOS camino_A1CD: el camino del actor 10 de la sala 112 y 2 mas: [byte para
;   (ix+0x13)] y parejas [y][x] de puntos de paso que p00:59F5 va cargando en
;   (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, para
;   sacar la direccion al siguiente); lo leen p00:59F5 (2 bytes)
;   0xa1cd..0xa1cf  (2 bytes)
DATA_camino_A1CD:
	defb 001h,000h	; a1cd

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_0: la tabla de caminos de la sala 0, 1: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa1cf..0xa1d5  (6 bytes)
DATA_caminos_de_la_sala_0:
	defw 09ea1h,09ea6h,09eb7h	; a1cf

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_2: la tabla de caminos de la sala 2: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa1d5..0xa1d9  (4 bytes)
DATA_caminos_de_la_sala_2:
	defw 09ebch,09ec3h	; a1d5

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_3: la tabla de caminos de la sala 3, 4: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa1d9..0xa1dd  (4 bytes)
DATA_caminos_de_la_sala_3:
	defw 09ec8h,09ed1h	; a1d9

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_5: la tabla de caminos de la sala 5: una palabra
;   por actor (1 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (2 bytes)
;   0xa1dd..0xa1df  (2 bytes)
DATA_caminos_de_la_sala_5:
	defw 09edah	; a1dd

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_6: la tabla de caminos de la sala 6, 7: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa1df..0xa1e3  (4 bytes)
DATA_caminos_de_la_sala_6:
	defw 09ee5h,09eeah	; a1df

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_8: la tabla de caminos de la sala 8, 9, 10, 11: una
;   palabra por actor (12 actores en 0x9560), al registro de su camino; lo
;   leen p00:59E4 (8 bytes)
;   0xa1e3..0xa1eb  (8 bytes)
DATA_caminos_de_la_sala_8:
	defw 0a1c5h,0a1c5h,0a1b1h,0a1b1h	; a1e3  -> DATA_camino_A1C5 DATA_camino_A1C5 DATA_camino_A1B1 DATA_camino_A1B1

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_12: la tabla de caminos de la sala 12: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa1eb..0xa1ef  (4 bytes)
DATA_caminos_de_la_sala_12:
	defw 09effh,09f0ch	; a1eb

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_13: la tabla de caminos de la sala 13: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa1ef..0xa1f3  (4 bytes)
DATA_caminos_de_la_sala_13:
	defw 09f15h,09f1ch	; a1ef

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_14: la tabla de caminos de la sala 14: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa1f3..0xa1f9  (6 bytes)
DATA_caminos_de_la_sala_14:
	defw 09f29h,09f2eh,09f33h	; a1f3

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_15: la tabla de caminos de la sala 15: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa1f9..0xa1fd  (4 bytes)
DATA_caminos_de_la_sala_15:
	defw 09f38h,09f3fh	; a1f9

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_16: la tabla de caminos de la sala 16, 17: una
;   palabra por actor (4 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (8 bytes)
;   0xa1fd..0xa205  (8 bytes)
DATA_caminos_de_la_sala_16:
	defw 09f44h,09f4dh,09f56h,09f5fh	; a1fd

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_18: la tabla de caminos de la sala 18: una palabra
;   por actor (5 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (10 bytes)
;   0xa205..0xa20f  (10 bytes)
DATA_caminos_de_la_sala_18:
	defw 09f68h,09f6dh,09f72h,09f77h	; a205
	defw 09f7ch	; a20d

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_19: la tabla de caminos de la sala 19: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa20f..0xa213  (4 bytes)
DATA_caminos_de_la_sala_19:
	defw 09f81h,09f86h	; a20f

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_20: la tabla de caminos de la sala 20, 21: una
;   palabra por actor (1 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (2 bytes)
;   0xa213..0xa215  (2 bytes)
DATA_caminos_de_la_sala_20:
	defw 09f8bh	; a213

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_22: la tabla de caminos de la sala 22: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa215..0xa219  (4 bytes)
DATA_caminos_de_la_sala_22:
	defw 09f90h,09f95h	; a215

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_23: la tabla de caminos de la sala 23: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa219..0xa21f  (6 bytes)
DATA_caminos_de_la_sala_23:
	defw 09f9ah,09f9fh,09fa8h	; a219

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_24: la tabla de caminos de la sala 24, 25, 26: una
;   palabra por actor (1 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (2 bytes)
;   0xa21f..0xa221  (2 bytes)
DATA_caminos_de_la_sala_24:
	defw 09fb1h	; a21f

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_27: la tabla de caminos de la sala 27: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa221..0xa225  (4 bytes)
DATA_caminos_de_la_sala_27:
	defw 09fb6h,09fbbh	; a221

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_28: la tabla de caminos de la sala 28: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa225..0xa229  (4 bytes)
DATA_caminos_de_la_sala_28:
	defw 09fc0h,09fc5h	; a225

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_29: la tabla de caminos de la sala 29, 30: una
;   palabra por actor (4 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa229..0xa22d  (4 bytes)
DATA_caminos_de_la_sala_29:
	defw 09fceh,09fd7h	; a229

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_31: la tabla de caminos de la sala 31: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa22d..0xa231  (4 bytes)
DATA_caminos_de_la_sala_31:
	defw 09fe0h,09fe5h	; a22d

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_32: la tabla de caminos de la sala 32: una palabra
;   por actor (1 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa231..0xa235  (4 bytes)
DATA_caminos_de_la_sala_32:
	defw 09fedh,09ff6h	; a231

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_33: la tabla de caminos de la sala 33: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa235..0xa239  (4 bytes)
DATA_caminos_de_la_sala_33:
	defw 09fffh,0a00ch	; a235  -> 0x9fff DATA_camino_A00C

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_34: la tabla de caminos de la sala 34: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa239..0xa23d  (4 bytes)
DATA_caminos_de_la_sala_34:
	defw 0a019h,0a024h	; a239  -> DATA_camino_A019 DATA_camino_A024

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_35: la tabla de caminos de la sala 35: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa23d..0xa243  (6 bytes)
DATA_caminos_de_la_sala_35:
	defw 0a02fh,0a034h,0a039h	; a23d  -> DATA_camino_A02F DATA_camino_A034 DATA_camino_A039

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_36: la tabla de caminos de la sala 36: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa243..0xa249  (6 bytes)
DATA_caminos_de_la_sala_36:
	defw 0a03eh,0a043h,0a048h	; a243  -> DATA_camino_A03E DATA_camino_A043 DATA_camino_A048

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_37: la tabla de caminos de la sala 37, 38: una
;   palabra por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa249..0xa24d  (4 bytes)
DATA_caminos_de_la_sala_37:
	defw 0a055h,0a05eh	; a249  -> DATA_camino_A055 DATA_camino_A05E

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_39: la tabla de caminos de la sala 39: una palabra
;   por actor (4 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (8 bytes)
;   0xa24d..0xa255  (8 bytes)
DATA_caminos_de_la_sala_39:
	defw 0a1aeh,0a1b1h,0a1aeh,0a1b1h	; a24d  -> DATA_camino_A1AE DATA_camino_A1B1 DATA_camino_A1AE DATA_camino_A1B1

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_40: la tabla de caminos de la sala 40, 41, 42: una
;   palabra por actor (1 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (2 bytes)
;   0xa255..0xa257  (2 bytes)
DATA_caminos_de_la_sala_40:
	defw 0a067h	; a255  -> DATA_camino_A067

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_43: la tabla de caminos de la sala 43: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa257..0xa25b  (4 bytes)
DATA_caminos_de_la_sala_43:
	defw 0a070h,0a079h	; a257  -> DATA_camino_A070 DATA_camino_A079

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_44: la tabla de caminos de la sala 44, 45, 46, 47:
;   una palabra por actor (9 actores en 0x9560), al registro de su camino; lo
;   leen p00:59E4 (4 bytes)
;   0xa25b..0xa25f  (4 bytes)
DATA_caminos_de_la_sala_44:
	defw 0a082h,0a093h	; a25b  -> DATA_camino_A082 DATA_camino_A093

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_48: la tabla de caminos de la sala 48, 49: una
;   palabra por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa25f..0xa265  (6 bytes)
DATA_caminos_de_la_sala_48:
	defw 0a0a6h,0a0abh,0a0b0h	; a25f  -> DATA_camino_A0A6 DATA_camino_A0AB DATA_camino_A0B0

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_50: la tabla de caminos de la sala 50, 51: una
;   palabra por actor (1 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (2 bytes)
;   0xa265..0xa267  (2 bytes)
DATA_caminos_de_la_sala_50:
	defw 0a0b5h	; a265  -> DATA_camino_A0B5

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_52: la tabla de caminos de la sala 52: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa267..0xa26b  (4 bytes)
DATA_caminos_de_la_sala_52:
	defw 0a0c2h,0a0cbh	; a267  -> DATA_camino_A0C2 DATA_camino_A0CB

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_53: la tabla de caminos de la sala 53, 54, 55, 56,
;   57, 58: una palabra por actor (9 actores en 0x9560), al registro de su
;   camino; lo leen p00:59E4 (8 bytes)
;   0xa26b..0xa273  (8 bytes)
DATA_caminos_de_la_sala_53:
	defw 0a1b7h,0a1bbh,0a1b7h,0a1bbh	; a26b  -> DATA_camino_A1B7 DATA_camino_A1BB DATA_camino_A1B7 DATA_camino_A1BB

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_70: la tabla de caminos de la sala 70: una palabra
;   por actor (2 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (4 bytes)
;   0xa273..0xa277  (4 bytes)
DATA_caminos_de_la_sala_70:
	defw 0a0d6h,0a0dbh	; a273  -> DATA_camino_A0D6 DATA_camino_A0DB

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_71: la tabla de caminos de la sala 71, 72, 73, 74:
;   una palabra por actor (3 actores en 0x9560), al registro de su camino; lo
;   leen p00:59E4 (6 bytes)
;   0xa277..0xa27d  (6 bytes)
DATA_caminos_de_la_sala_71:
	defw 0a0e0h,0a0e5h,0a0eah	; a277  -> DATA_camino_A0E0 DATA_camino_A0E5 DATA_camino_A0EA

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_75: la tabla de caminos de la sala 75, 76, 77: una
;   palabra por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa27d..0xa283  (6 bytes)
DATA_caminos_de_la_sala_75:
	defw 0a1c0h,0a0efh,0a0f4h	; a27d  -> DATA_camino_A1C0 DATA_camino_A0EF DATA_camino_A0F4

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_78: la tabla de caminos de la sala 78, 79: una
;   palabra por actor (4 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (8 bytes)
;   0xa283..0xa28b  (8 bytes)
DATA_caminos_de_la_sala_78:
	defw 0a0f9h,0a102h,0a107h,0a10eh	; a283  -> DATA_camino_A0F9 DATA_camino_A102 DATA_camino_A107 DATA_camino_A10E

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_80: la tabla de caminos de la sala 80: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa28b..0xa291  (6 bytes)
DATA_caminos_de_la_sala_80:
	defw 0a1b7h,0a1b7h,0a1b7h	; a28b  -> DATA_camino_A1B7 DATA_camino_A1B7 DATA_camino_A1B7

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_81: la tabla de caminos de la sala 81: una palabra
;   por actor (4 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (8 bytes)
;   0xa291..0xa299  (8 bytes)
DATA_caminos_de_la_sala_81:
	defw 0a115h,0a11ah,0a123h,0a12ch	; a291  -> DATA_camino_A115 DATA_camino_A11A DATA_camino_A123 DATA_camino_A12C

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_82: la tabla de caminos de la sala 82: una palabra
;   por actor (4 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (8 bytes)
;   0xa299..0xa2a1  (8 bytes)
DATA_caminos_de_la_sala_82:
	defw 0a1c5h,0a1c0h,0a1b4h,0a1c5h	; a299  -> DATA_camino_A1C5 DATA_camino_A1C0 DATA_camino_A1B4 DATA_camino_A1C5

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_83: la tabla de caminos de la sala 83, 84: una
;   palabra por actor (4 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (8 bytes)
;   0xa2a1..0xa2a9  (8 bytes)
DATA_caminos_de_la_sala_83:
	defw 0a133h,0a13ch,0a143h,0a148h	; a2a1  -> DATA_camino_A133 DATA_camino_A13C DATA_camino_A143 DATA_camino_A148

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_85: la tabla de caminos de la sala 85: una palabra
;   por actor (1 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (2 bytes)
;   0xa2a9..0xa2ab  (2 bytes)
DATA_caminos_de_la_sala_85:
	defw 0a151h	; a2a9  -> DATA_camino_A151

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_86: la tabla de caminos de la sala 86: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa2ab..0xa2b1  (6 bytes)
DATA_caminos_de_la_sala_86:
	defw 0a1c0h,0a15ch,0a161h	; a2ab  -> DATA_camino_A1C0 DATA_camino_A15C DATA_camino_A161

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_87: la tabla de caminos de la sala 87: una palabra
;   por actor (3 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (6 bytes)
;   0xa2b1..0xa2b7  (6 bytes)
DATA_caminos_de_la_sala_87:
	defw 0a1c5h,0a1b1h,0a1b4h	; a2b1  -> DATA_camino_A1C5 DATA_camino_A1B1 DATA_camino_A1B4

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_88: la tabla de caminos de la sala 88, 89, 90, 91,
;   92, 93: una palabra por actor (9 actores en 0x9560), al registro de su
;   camino; lo leen p00:59E4 (8 bytes)
;   0xa2b7..0xa2bf  (8 bytes)
DATA_caminos_de_la_sala_88:
	defw 0a166h,0a16fh,0a178h,0a17dh	; a2b7  -> DATA_camino_A166 DATA_camino_A16F DATA_camino_A178 DATA_camino_A17D

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_108: la tabla de caminos de la sala 108, 109, 110,
;   111: una palabra por actor (3 actores en 0x9560), al registro de su
;   camino; lo leen p00:59E4 (4 bytes)
;   0xa2bf..0xa2c3  (4 bytes)
DATA_caminos_de_la_sala_108:
	defw 0a182h,0a187h	; a2bf  -> DATA_camino_A182 DATA_camino_A187

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_112: la tabla de caminos de la sala 112, 113, 114,
;   115: una palabra por actor (11 actores en 0x9560), al registro de su
;   camino; lo leen p00:59E4 (4 bytes)
;   0xa2c3..0xa2c7  (4 bytes)
DATA_caminos_de_la_sala_112:
	defw 0a18ch,0a191h	; a2c3  -> DATA_camino_A18C DATA_camino_A191

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_116: la tabla de caminos de la sala 116, 117, 118:
;   una palabra por actor (3 actores en 0x9560), al registro de su camino; lo
;   leen p00:59E4 (4 bytes)
;   0xa2c7..0xa2cb  (4 bytes)
DATA_caminos_de_la_sala_116:
	defw 0a196h,0a19bh	; a2c7  -> DATA_camino_A196 DATA_camino_A19B

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_119: la tabla de caminos de la sala 119, 120, 121,
;   122, 123, 124: una palabra por actor (9 actores en 0x9560), al registro de
;   su camino; lo leen p00:59E4 (2 bytes)
;   0xa2cb..0xa2cd  (2 bytes)
DATA_caminos_de_la_sala_119:
	defw 0a1a0h	; a2cb  -> DATA_camino_A1A0

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_139: la tabla de caminos de la sala 139, 140: una
;   palabra por actor (6 actores en 0x9560), al registro de su camino; lo leen
;   p00:59E4 (16 bytes)
;   0xa2cd..0xa2dd  (16 bytes)
DATA_caminos_de_la_sala_139:
	defw 0a1c9h,0a1c9h,0a1cbh,0a1c9h	; a2cd  -> DATA_camino_A1C9 DATA_camino_A1C9 DATA_camino_A1CB DATA_camino_A1C9
	defw 0a1cdh,0a1c9h,0a1cbh,0a1c9h	; a2d5  -> DATA_camino_A1CD DATA_camino_A1C9 DATA_camino_A1CB DATA_camino_A1C9

; ----------------------------------------------------------------------
; DATOS caminos_de_la_sala_141: la tabla de caminos de la sala 141, 142, 143,
;   144, 145, 146: una palabra por actor (4 actores en 0x9560), al registro de
;   su camino; lo leen p00:59E4 (2 bytes)
;   0xa2dd..0xa2df  (2 bytes)
DATA_caminos_de_la_sala_141:
	defw 0a1a5h	; a2dd  -> DATA_camino_A1A5

; ----------------------------------------------------------------------
; DATOS indice_de_caminos: 179 punteros, salas 0-178 (p00:59D9 y p00:5B13 leen
;   0xA2DF + 2 x sala), a la tabla de caminos de esa sala: una palabra por
;   actor (B - 1, p00:59E4); lo leen p00:59D9, p00:5B13 (358 bytes)
;   0xa2df..0xa445  (358 bytes)
DATA_indice_de_caminos:
	defw 0a1cfh,0a1cfh,0a1d5h,0a1d9h,0a1d9h,0a1ddh,0a1dfh,0a1dfh	; a2df
	defw 0a1e3h,0a1e3h,0a1e3h,0a1e3h,0a1ebh,0a1efh,0a1f3h,0a1f9h	; a2ef
	defw 0a1fdh,0a1fdh,0a205h,0a20fh,0a213h,0a213h,0a215h,0a219h	; a2ff
	defw 0a21fh,0a21fh,0a21fh,0a221h,0a225h,0a229h,0a229h,0a22dh	; a30f
	defw 0a231h,0a235h,0a239h,0a23dh,0a243h,0a249h,0a249h,0a24dh	; a31f
	defw 0a255h,0a255h,0a255h,0a257h,0a25bh,0a25bh,0a25bh,0a25bh	; a32f
	defw 0a25fh,0a25fh,0a265h,0a265h,0a267h,0a26bh,0a26bh,0a26bh	; a33f
	defw 0a26bh,0a26bh,0a26bh,0a26bh,0a26bh,0a26bh,0a26bh,0a26bh	; a34f
	defw 0a26bh,0a26bh,0a26bh,0a26bh,0a26bh,0a26bh,0a273h,0a277h	; a35f
	defw 0a277h,0a277h,0a277h,0a27dh,0a27dh,0a27dh,0a283h,0a283h	; a36f
	defw 0a28bh,0a291h,0a299h,0a2a1h,0a2a1h,0a2a9h,0a2abh,0a2b1h	; a37f
	defw 0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h	; a38f
	defw 0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2b7h	; a39f
	defw 0a2b7h,0a2b7h,0a2b7h,0a2b7h,0a2bfh,0a2bfh,0a2bfh,0a2bfh	; a3af
	defw 0a2c3h,0a2c3h,0a2c3h,0a2c3h,0a2c7h,0a2c7h,0a2c7h,0a2cbh	; a3bf
	defw 0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh	; a3cf
	defw 0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh,0a2cbh	; a3df
	defw 0a2cbh,0a2cbh,0a2cbh,0a2cdh,0a2cdh,0a2ddh,0a2ddh,0a2ddh	; a3ef
	defw 0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh	; a3ff
	defw 0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh	; a40f
	defw 0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh	; a41f
	defw 0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh,0a2ddh	; a42f
	defw 0a2ddh,0a2ddh,0a2ddh	; a43f  -> DATA_caminos_de_la_sala_141 DATA_caminos_de_la_sala_141 DATA_caminos_de_la_sala_141

; ----------------------------------------------------------------------
; DATOS reaparicion_por_sala: 188 fichas de 3 bytes, salas 0-0xBB (p00:583B: 3
;   x sala): [tipo de actor][xy][xy]; p00:5867 coge el segundo o el tercer
;   byte segun el bit 0 de 0xC003 (azar) y saca la x del nibble alto y la y
;   del bajo; lo leen p00:5841, p00:58B8, p00:58F5 (564 bytes)
;   0xa445..0xa679  (564 bytes)
DATA_reaparicion_por_sala:
	defb 00ah,019h,0afh	; a445
	defb 00ah,014h,09fh	; a448
	defb 00ah,0c5h,01ah	; a44b
	defb 00bh,03fh,0afh	; a44e
	defb 00ah,091h,0afh	; a451
	defb 00ah,081h,01eh	; a454
	defb 000h,000h,000h	; a457
	defb 00ah,085h,031h	; a45a
	defb 000h,031h,0b1h	; a45d
	defb 000h,000h,000h	; a460
	defb 000h,000h,000h	; a463
	defb 00ah,03fh,0bfh	; a466
	defb 00ah,091h,016h	; a469
	defb 00ah,0c6h,0cah	; a46c
	defb 00ah,01ah,016h	; a46f
	defb 00ah,0cah,031h	; a472
	defb 000h,012h,01ah	; a475
	defb 00ah,055h,0cah	; a478
	defb 00ah,015h,01ah	; a47b
	defb 00ah,0c8h,069h	; a47e
	defb 000h,000h,000h	; a481
	defb 00ah,0bfh,0bfh	; a484
	defb 00bh,0bfh,03fh	; a487
	defb 00bh,0b1h,03fh	; a48a
	defb 00bh,01eh,071h	; a48d
	defb 00bh,0c2h,01bh	; a490
	defb 00ah,0c7h,01eh	; a493
	defb 00ah,031h,0ceh	; a496
	defb 00ah,0bfh,09fh	; a499
	defb 000h,000h,000h	; a49c
	defb 00ah,093h,01ch	; a49f
	defb 00ah,0c6h,0afh	; a4a2
	defb 00ah,083h,0bfh	; a4a5
	defb 00ah,051h,0b1h	; a4a8
	defb 00ah,071h,07fh	; a4ab
	defb 00bh,0bfh,07fh	; a4ae
	defb 00ah,0b1h,019h	; a4b1
	defb 000h,000h,000h	; a4b4
	defb 00ah,01dh,0c4h	; a4b7
	defb 00ah,051h,0ceh	; a4ba
	defb 016h,05fh,0a1h	; a4bd
	defb 016h,012h,01dh	; a4c0
	defb 016h,018h,0c4h	; a4c3
	defb 00bh,0c7h,03fh	; a4c6
	defb 016h,09fh,041h	; a4c9
	defb 000h,000h,000h	; a4cc
	defb 000h,000h,000h	; a4cf
	defb 00bh,071h,09fh	; a4d2
	defb 016h,0cdh,014h	; a4d5
	defb 00bh,031h,07fh	; a4d8
	defb 000h,000h,000h	; a4db
	defb 00ah,017h,018h	; a4de
	defb 00bh,017h,0c8h	; a4e1
	defb 00ah,091h,0cdh	; a4e4
	defb 000h,000h,000h	; a4e7
	defb 000h,000h,000h	; a4ea
	defb 000h,000h,000h	; a4ed
	defb 000h,000h,000h	; a4f0
	defb 000h,000h,000h	; a4f3
	defb 000h,000h,000h	; a4f6
	defb 000h,000h,000h	; a4f9
	defb 000h,000h,000h	; a4fc
	defb 000h,000h,000h	; a4ff
	defb 000h,000h,000h	; a502
	defb 000h,000h,000h	; a505
	defb 000h,000h,000h	; a508
	defb 000h,000h,000h	; a50b
	defb 000h,000h,000h	; a50e
	defb 000h,021h,01ch	; a511
	defb 00bh,031h,03fh	; a514
	defb 00ah,04fh,0bfh	; a517
	defb 000h,000h,000h	; a51a
	defb 00ah,03fh,07fh	; a51d
	defb 00ah,041h,01ah	; a520
	defb 00ah,0bfh,014h	; a523
	defb 00ah,0c7h,041h	; a526
	defb 000h,000h,000h	; a529
	defb 00ah,012h,01dh	; a52c
	defb 00ah,0cdh,031h	; a52f
	defb 00ah,01ah,01eh	; a532
	defb 00bh,0c9h,018h	; a535
	defb 00ah,0c2h,0ceh	; a538
	defb 00ah,07fh,0b1h	; a53b
	defb 000h,000h,000h	; a53e
	defb 00ah,071h,03fh	; a541
	defb 00bh,071h,071h	; a544
	defb 00bh,018h,018h	; a547
	defb 00bh,0c8h,071h	; a54a
	defb 00ah,09fh,0afh	; a54d
	defb 016h,031h,01dh	; a550
	defb 00ah,0c3h,01eh	; a553
	defb 00ah,0a1h,0ceh	; a556
	defb 016h,0cbh,0cdh	; a559
	defb 000h,000h,000h	; a55c
	defb 000h,000h,000h	; a55f
	defb 000h,000h,000h	; a562
	defb 000h,000h,000h	; a565
	defb 000h,000h,000h	; a568
	defb 000h,000h,000h	; a56b
	defb 000h,000h,000h	; a56e
	defb 000h,000h,000h	; a571
	defb 000h,000h,000h	; a574
	defb 000h,000h,000h	; a577
	defb 000h,000h,000h	; a57a
	defb 000h,000h,000h	; a57d
	defb 000h,000h,000h	; a580
	defb 000h,000h,000h	; a583
	defb 00ah,014h,01ch	; a586
	defb 00bh,0c7h,0c7h	; a589
	defb 000h,000h,000h	; a58c
	defb 000h,000h,000h	; a58f
	defb 000h,000h,000h	; a592
	defb 000h,000h,000h	; a595
	defb 000h,000h,000h	; a598
	defb 000h,000h,000h	; a59b
	defb 000h,000h,000h	; a59e
	defb 000h,000h,000h	; a5a1
	defb 000h,000h,000h	; a5a4
	defb 000h,000h,000h	; a5a7
	defb 000h,000h,000h	; a5aa
	defb 000h,000h,000h	; a5ad
	defb 00ah,029h,027h	; a5b0
	defb 000h,000h,000h	; a5b3
	defb 000h,000h,000h	; a5b6
	defb 000h,000h,000h	; a5b9
	defb 000h,000h,000h	; a5bc
	defb 00ah,07dh,07dh	; a5bf
	defb 00ah,07dh,07dh	; a5c2
	defb 00ah,07dh,07dh	; a5c5
	defb 000h,000h,000h	; a5c8
	defb 00ah,07dh,07dh	; a5cb
	defb 00ah,07dh,07dh	; a5ce
	defb 00ah,07dh,07dh	; a5d1
	defb 000h,0c7h,0c7h	; a5d4
	defb 000h,000h,000h	; a5d7
	defb 000h,000h,000h	; a5da
	defb 000h,000h,000h	; a5dd
	defb 00ah,073h,073h	; a5e0
	defb 00bh,0c7h,0c7h	; a5e3
	defb 00ah,0c7h,0c7h	; a5e6
	defb 00ah,07dh,07dh	; a5e9
	defb 000h,000h,000h	; a5ec
	defb 000h,053h,053h	; a5ef
	defb 000h,000h,000h	; a5f2
	defb 000h,000h,000h	; a5f5
	defb 000h,000h,000h	; a5f8
	defb 000h,000h,000h	; a5fb
	defb 00ah,07dh,07dh	; a5fe
	defb 000h,000h,000h	; a601
	defb 00ah,07dh,07dh	; a604
	defb 000h,000h,000h	; a607
	defb 000h,000h,000h	; a60a
	defb 000h,000h,000h	; a60d
	defb 000h,000h,000h	; a610
	defb 00ah,0c7h,0c7h	; a613
	defb 00ah,0c7h,0c7h	; a616
	defb 00bh,0c7h,0c7h	; a619
	defb 00ah,0c7h,0c7h	; a61c
	defb 00ah,0c7h,0c7h	; a61f
	defb 000h,000h,000h	; a622
	defb 00ah,0c7h,0c7h	; a625
	defb 000h,000h,000h	; a628
	defb 00ah,073h,073h	; a62b
	defb 00ah,0c7h,0c7h	; a62e
	defb 000h,000h,000h	; a631
	defb 000h,000h,000h	; a634
	defb 000h,0c7h,0c7h	; a637
	defb 000h,000h,000h	; a63a
	defb 000h,000h,000h	; a63d
	defb 000h,000h,000h	; a640
	defb 000h,000h,000h	; a643
	defb 000h,000h,000h	; a646
	defb 000h,000h,000h	; a649
	defb 000h,000h,000h	; a64c
	defb 000h,07dh,07dh	; a64f
	defb 000h,07dh,07dh	; a652
	defb 00ah,0c7h,0c7h	; a655
	defb 00ah,0c7h,0c7h	; a658
	defb 00ah,07dh,07dh	; a65b
	defb 00ah,073h,073h	; a65e
	defb 000h,000h,000h	; a661
	defb 00ah,0c7h,0c7h	; a664
	defb 000h,000h,000h	; a667
	defb 00bh,0c7h,0c7h	; a66a
	defb 00bh,0c7h,0c7h	; a66d
	defb 00bh,0c7h,0c7h	; a670
	defb 000h,000h,000h	; a673
	defb 00ah,0c7h,0c7h	; a676

; ----------------------------------------------------------------------
; DATOS tabla_a679: 64 bytes que p00:5CAB lee en 0xA679 + 8 x (bits 5-7) + E;
;   lo leen p00:5CAB (64 bytes)
;   0xa679..0xa6b9  (64 bytes)
DATA_tabla_a679:
	defb 020h,008h,004h,003h,002h,002h,001h,001h	; a679   .......
	defb 038h,020h,015h,00fh,00ch,009h,008h,007h	; a681  8 ......
	defb 03bh,02bh,020h,019h,014h,010h,00eh,00ch	; a689  .+ .....
	defb 03dh,031h,027h,020h,01ah,016h,013h,011h	; a691  =1' ....
	defb 03dh,034h,02ch,025h,020h,01ch,018h,015h	; a699  =4,% ...
	defb 03eh,036h,02fh,029h,024h,020h,01ch,019h	; a6a1  >6/)$ ..
	defb 03eh,038h,032h,02ch,028h,023h,020h,01dh	; a6a9  >82,(# .
	defb 03eh,039h,034h,02fh,02ah,026h,023h,020h	; a6b1  >94/*&#

; ----------------------------------------------------------------------
; DATOS tabla_a6b9: 64 bytes que p00:5BEE y p00:5C46 leen dos veces (0xA6B9 +
;   DE y 0xA6B9 + A, con A = 0x3F - E); lo leen p00:5BEE, p00:5C46 (64 bytes)
;   0xa6b9..0xa6f9  (64 bytes)
DATA_tabla_a6b9:
	defb 000h,006h,00ch,012h,019h,01fh,026h,02ch	; a6b9  ......&,
	defb 032h,038h,03eh,044h,04ah,050h,056h,05ch	; a6c1  28>DJPV\
	defb 062h,068h,06dh,073h,079h,07eh,084h,089h	; a6c9  bhmsy~..
	defb 08eh,093h,099h,09eh,0a2h,0a7h,0ach,0b1h	; a6d1  ........
	defb 0b5h,0b9h,0beh,0c2h,0c6h,0cah,0ceh,0d1h	; a6d9  ........
	defb 0d5h,0d8h,0dch,0dfh,0e2h,0e5h,0e7h,0eah	; a6e1  ........
	defb 0edh,0efh,0f1h,0f3h,0f5h,0f7h,0f8h,0fah	; a6e9  ........
	defb 0fbh,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; a6f1  ........

; ----------------------------------------------------------------------
; DATOS punto_de_mira: [destino en la VRAM (0xF880)] y los patrones
;   comprimidos del punto de mira, que p00:4C43 descomprime con L_4DCF/L_4DD5;
;   lo leen p00:4C43 (100 bytes)
;   0xa6f9..0xa75d  (100 bytes)
DATA_punto_de_mira:
	defb 080h,0f8h,083h,07fh,0ffh,0e0h,005h,0c0h,005h,000h,002h,001h,081h,003h,006h,000h	; a6f9  ................
	defb 08ah,001h,007h,001h,001h,007h,001h,001h,021h,021h,0ffh,006h,000h,08dh,080h,0e0h	; a709  ........!!......
	defb 080h,080h,0e0h,080h,080h,084h,084h,0ffh,0feh,0ffh,007h,005h,003h,005h,000h,002h	; a719  ................
	defb 080h,084h,0c0h,003h,001h,001h,005h,000h,005h,0c0h,08dh,0e0h,0ffh,07fh,0ffh,021h	; a729  ...............!
	defb 021h,001h,001h,007h,001h,001h,007h,001h,006h,000h,08ah,0ffh,084h,084h,080h,080h	; a739  !...............
	defb 0e0h,080h,080h,0e0h,080h,006h,000h,083h,0c0h,080h,080h,005h,000h,005h,003h,083h	; a749  ................
	defb 007h,0ffh,0feh,000h	; a759

; ----------------------------------------------------------------------
; DATOS fichas_de_objetos: 132 fichas en 3 planos (colores 0x4B1B) que
;   p00:4B47 vuelca en la VRAM 0xB000: los objetos y las armas; lo leen
;   p00:4B47 (3168 bytes)
;   0xa75d..0xb3bd  (3168 bytes)
DATA_fichas_de_objetos:
	defb 003h,001h,003h,007h,000h,007h,005h,002h,007h,003h,007h,003h,000h,007h,000h,007h,007h,007h,003h,003h,003h,003h,003h,003h	; a75d  ........................
	defb 000h,000h,000h,0c7h,0b8h,0ffh,0ffh,000h,0ffh,000h,0ffh,0fah,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0f3h,0ffh,0feh,0ffh,0feh	; a775  ........................
	defb 00fh,00bh,00fh,0e7h,019h,0ffh,0e7h,03ch,0e7h,039h,0deh,0bfh,07fh,082h,07fh,07fh,0bdh,07fh,0ffh,08bh,0ffh,0dfh,0bbh,0ffh	; a78d  .......<.9..............
	defb 0e0h,0e0h,0e0h,0e0h,060h,0e0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0f0h,070h,0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,080h,080h,080h	; a7a5  ....`........p..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,005h,007h,007h,007h,007h,007h,007h,007h,001h,000h,001h,000h,001h,001h	; a7bd  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,07fh,0ffh,0ebh,03ch,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0f6h,0ffh,0f7h	; a7d5  .............<..........
	defb 03bh,047h,07bh,07dh,07fh,07dh,07dh,0afh,0fdh,0fdh,08fh,0fdh,0fdh,00fh,0fdh,00bh,0ffh,00bh,0fbh,0fdh,0fbh,0fbh,07dh,0fbh	; a7ed  .G{}.}}...............}.
	defb 000h,000h,000h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; a805  ........................
	defb 000h,000h,000h,000h,000h,000h,002h,007h,007h,09ah,065h,0ffh,005h,0fah,005h,0fah,0ffh,0fah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a81d  ..........e.............
	defb 000h,000h,000h,00ch,004h,00ch,0bfh,0e0h,0ffh,0b1h,04eh,0ffh,05fh,0a0h,05fh,0a0h,0ffh,0a0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a835  ..........N._._.........
	defb 003h,001h,003h,003h,000h,003h,081h,07eh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,089h,0ffh,0efh,01bh,0efh,0dfh,070h,0dfh	; a84d  .......~..............p.
	defb 000h,000h,000h,080h,080h,080h,0f4h,01ch,0fch,0e4h,01ch,0fch,0ceh,0f2h,0ceh,0f6h,01ah,0f6h,0f9h,07fh,0fbh,0ffh,07dh,0ffh	; a865  ......................}.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00fh,000h,00fh,030h,00fh,03fh,0cfh,031h,0ffh,0cfh,0ffh,0cfh	; a87d  ...............0.?.1....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,01ch,00ch,01ch,0deh,0c6h,0deh,0e0h,05fh,0ffh,0efh,09fh,0efh,040h,0ffh,040h	; a895  ................_....@.@
	defb 010h,010h,010h,030h,010h,030h,01fh,011h,01fh,03eh,00eh,03eh,038h,038h,038h,0e2h,05dh,0ffh,0bfh,0dfh,0bfh,000h,0ffh,000h	; a8ad  ...0.0...>.>888.].......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,000h,003h,0f7h,040h,0f7h,0f7h,0fch,0f7h,04bh,0ffh,04bh	; a8c5  ................@....K.K
	defb 03fh,03fh,03fh,07dh,065h,07fh,076h,040h,07fh,07dh,045h,07fh,079h,040h,07fh,07eh,042h,07fh,07ch,040h,07fh,06bh,042h,07fh	; a8dd  ???}e.v@.}E.y@.~B.|@.kB.
	defb 09ch,09ch,09ch,0feh,0f6h,0feh,095h,0fdh,0fdh,0b5h,0fdh,0b5h,09dh,0ddh,09dh,0dbh,0dbh,0dbh,0a4h,0a4h,0a4h,0ffh,0ffh,0ffh	; a8f5  ........................
	defb 000h,000h,000h,007h,000h,007h,01fh,001h,01fh,037h,008h,03fh,060h,01fh,078h,067h,01fh,077h,0adh,05fh,0fch,0adh,07fh,0feh	; a90d  .........7.?`.xg.w._....
	defb 000h,000h,000h,040h,080h,040h,050h,0a0h,050h,040h,0b8h,040h,008h,0f4h,008h,0cah,0f6h,0cah,06dh,0f3h,06dh,0edh,0fbh,06dh	; a925  ...@.@P.P@.@......m.m..m
	defb 0e0h,0e0h,020h,070h,0f0h,010h,0aeh,0fah,0beh,054h,06ch,05ch,068h,074h,06ch,074h,05ah,076h,02ah,02dh,02bh,005h,006h,005h	; a93d  .. p.....Tl\htltZv*-+...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,080h,070h,0c0h,0f0h	; a955  .....................p..
	defb 070h,070h,070h,0f8h,0c8h,0f8h,0ech,094h,0fch,0b7h,0efh,0bfh,0dfh,0e8h,0dfh,07dh,072h,07fh,03eh,031h,03fh,017h,01ch,017h	; a96d  ppp............}r.>1?...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,080h,0c0h,040h,0c0h,0e0h,0a0h,0e0h,0f0h,050h,0f0h,078h,0a8h,0f8h	; a985  .............@.....P.x..
	defb 00fh,00fh,00fh,07ch,078h,07fh,0ceh,0fah,0cfh,0b6h,0afh,0f6h,0b1h,0afh,0f1h,0a2h,0bfh,0e2h,0c7h,0fdh,0c7h,0ffh,0bdh,0ffh	; a99d  ...|x...................
	defb 0e0h,0e0h,0e0h,03ch,07ch,0bch,0a6h,0feh,0a6h,0cah,0fah,0ceh,02ah,0dah,02eh,02ah,0dah,02eh,006h,0feh,006h,07ah,0feh,07ah	; a9b5  ...<|.......*..*.....z.z
	defb 003h,003h,003h,004h,004h,007h,008h,008h,00fh,00bh,009h,00fh,009h,00bh,00fh,039h,039h,03fh,044h,04ch,077h,08bh,09bh,0efh	; a9cd  ...............99?DLw...
	defb 080h,080h,080h,040h,0c0h,040h,020h,060h,0a0h,0a0h,0e0h,0a0h,0a0h,0e0h,0a0h,038h,078h,0b8h,044h,0cch,074h,0a2h,0e6h,0bah	; a9e5  ...@.@ `.......8x.D.t...
	defb 000h,000h,000h,001h,001h,001h,003h,002h,003h,007h,004h,007h,006h,005h,007h,005h,006h,007h,00fh,00ah,00fh,00fh,009h,00fh	; a9fd  ........................
	defb 0f0h,0f0h,0f0h,0a8h,0d8h,0f8h,0ach,0d4h,0fch,0aeh,0d2h,0feh,0cdh,073h,0ffh,0edh,033h,0ffh,099h,017h,0ffh,01fh,01fh,0ffh	; aa15  .............s..3.......
	defb 000h,000h,000h,000h,000h,000h,001h,001h,001h,03eh,03fh,03eh,071h,05fh,071h,09eh,0eeh,0feh,0ffh,073h,0ffh,07fh,0fch,0cfh	; aa2d  .........>?>q_q....s....
	defb 03fh,03fh,03fh,0c1h,0ffh,0c1h,03eh,0ffh,03eh,0c6h,0c7h,0c6h,009h,00fh,009h,016h,01eh,016h,014h,01ch,014h,0eah,0eeh,0eah	; aa45  ???...>.>...............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; aa5d  ........................
	defb 017h,01fh,017h,008h,00fh,008h,00fh,00fh,00fh,007h,007h,007h,001h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; aa75  ........................
	defb 09dh,0ebh,0bdh,02fh,0ddh,03fh,0efh,0d5h,0ffh,0ceh,0f5h,0deh,0ffh,0eeh,0ffh,02fh,030h,02fh,01fh,01fh,01fh,01fh,01fh,01fh	; aa8d  .../.?........./0/......
	defb 080h,080h,080h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0e0h,0e0h,0e0h	; aaa5  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,001h,000h,000h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; aabd  ........................
	defb 07ah,07dh,0fbh,07eh,07fh,0ffh,0beh,0bfh,0ffh,0b3h,0b3h,0f3h,0b0h,0b1h,0f1h,060h,061h,0e1h,0e0h,0e1h,0e1h,001h,001h,001h	; aad5  z}.~...........`a.......
	defb 0ffh,07fh,0ffh,0bfh,07fh,0bfh,0ffh,03fh,0ffh,070h,0f0h,070h,0f0h,070h,0f0h,0f0h,070h,0f0h,0f0h,070h,0f0h,0f0h,0f0h,0f0h	; aaed  .......?.p.p.p..p..p....
	defb 080h,080h,080h,080h,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ab05  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ab1d  ........................
	defb 05fh,05fh,05fh,003h,002h,003h,007h,001h,007h,000h,007h,000h,007h,007h,007h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ab35  ___.....................
	defb 0deh,07fh,0deh,09fh,0ffh,09fh,03fh,0ffh,03fh,060h,0e0h,060h,0c0h,0c0h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ab4d  ......?.?`.`............
	defb 0f2h,032h,0f2h,070h,090h,070h,0a0h,0e0h,0a0h,0c0h,0c0h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ab65  .2.p.p..................
	defb 030h,03fh,030h,01fh,01fh,01fh,003h,003h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ab7d  0?0.....................
	defb 0ffh,0ffh,0ffh,0feh,0fbh,0feh,0feh,0fdh,0feh,03eh,03fh,03eh,006h,007h,006h,007h,007h,007h,003h,003h,003h,000h,000h,000h	; ab95  .........>?>............
	defb 0ffh,0ffh,0ffh,0f7h,07fh,0f7h,0f7h,07fh,0f7h,0feh,07eh,0feh,070h,0f0h,070h,0e0h,0e0h,0e0h,0c0h,0c0h,0c0h,000h,000h,000h	; abad  ..........~.p.p.........
	defb 0fch,0ffh,0fch,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,007h,007h,007h,003h,003h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; abc5  ........................
	defb 07dh,049h,07fh,07ah,040h,07fh,075h,044h,07fh,07bh,061h,07fh,07fh,04fh,07fh,06fh,046h,07fh,07fh,067h,07fh,03fh,03fh,03fh	; abdd  }I.z@.uD.{a..O.oF..g.???
	defb 0c1h,0ffh,0c1h,0dfh,0fdh,0f7h,0ffh,0ddh,0ffh,0e1h,0ffh,0e1h,0fdh,0ffh,0fdh,0c1h,0ffh,0c1h,0ffh,0ffh,0ffh,000h,000h,000h	; abf5  ........................
	defb 02dh,0dfh,07ch,06fh,09fh,07fh,0a7h,0dfh,0bfh,0b7h,0c8h,0bfh,05fh,061h,05fh,02fh,030h,02fh,018h,01fh,018h,00fh,00fh,00fh	; ac0d  -.|o........_a_/0/......
	defb 06dh,0f3h,06dh,0edh,0f3h,0edh,0cbh,0f7h,0cbh,04bh,0b7h,04bh,046h,0beh,046h,04ch,0bch,04ch,038h,0f8h,038h,0e0h,0e0h,0e0h	; ac25  m.m......K.KF.FL.L8.8...
	defb 002h,003h,002h,003h,003h,003h,003h,002h,003h,003h,002h,003h,001h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ac3d  ........................
	defb 0b8h,060h,0f8h,05ch,0b0h,07ch,0ach,0dch,0bch,0d8h,070h,0d8h,0f4h,038h,0f4h,0fah,0bch,0fah,04dh,04fh,04dh,006h,006h,006h	; ac55  .`.\.|....p..8....MOM...
	defb 017h,01eh,017h,01bh,01fh,01bh,00dh,00fh,00dh,006h,007h,006h,003h,003h,003h,001h,001h,001h,000h,000h,000h,000h,000h,000h	; ac6d  ........................
	defb 0a4h,05ch,0fch,0c2h,03eh,0e6h,083h,0ffh,0c3h,0dfh,0b9h,0dfh,077h,09bh,07fh,0beh,0c2h,0beh,0deh,0e6h,0deh,07ch,07ch,07ch	; ac85  .\..>.......w........|||
	defb 0f7h,0adh,0f7h,0ffh,0bdh,0ffh,0f5h,0afh,0f5h,0ddh,0bfh,0ddh,0c5h,0bfh,0c5h,0a2h,0dfh,0a2h,0e1h,0ffh,0e1h,07fh,07fh,07fh	; ac9d  ........................
	defb 06ah,0deh,06ah,07ah,0feh,07ah,06ah,0deh,06ah,032h,0feh,032h,002h,0feh,002h,022h,0deh,022h,00eh,0feh,00eh,0fch,0fch,0fch	; acb5  j.jz.zj.j2.2..."."......
	defb 088h,0b8h,0cfh,010h,070h,09fh,020h,070h,0afh,0a0h,0f0h,0afh,0f8h,0f9h,0feh,027h,037h,02fh,020h,030h,02fh,018h,01bh,01ch	; accd  ....p. p.......'7/ 0/...
	defb 022h,066h,0bah,011h,033h,0ddh,009h,03bh,0cdh,00ah,07eh,08ah,03ch,0fch,03ch,0c8h,0f8h,0c8h,008h,0f8h,008h,038h,0f8h,038h	; ace5  "f..3.....~.<.<......8.8
	defb 00fh,009h,00fh,017h,01bh,01fh,02eh,036h,03fh,05dh,06dh,07fh,0fbh,09bh,0ffh,0f7h,0b7h,0ffh,04fh,04fh,07fh,03eh,03eh,03eh	; acfd  .......6?]m.......OO.>>>
	defb 0bbh,0bbh,0ffh,0e7h,0e7h,0ffh,07eh,07eh,0feh,0f8h,0f8h,0f8h,0c0h,0c0h,0c0h,080h,080h,080h,000h,000h,000h,000h,000h,000h	; ad15  ......~~................
	defb 0ffh,07fh,0c3h,0ffh,07fh,0c0h,0ffh,07fh,0e6h,0bfh,0bbh,0feh,047h,045h,07fh,03dh,03dh,03fh,002h,002h,003h,001h,001h,001h	; ad2d  ............GE.==?......
	defb 0f5h,037h,0f5h,0feh,0cfh,0feh,0fch,0f3h,03ch,0fdh,0fbh,00dh,0dfh,0fbh,02fh,0fah,0f2h,01eh,0f4h,0e4h,0fch,008h,008h,0f8h	; ad45  .7......<...../.........
	defb 00fh,00fh,00fh,011h,016h,01fh,026h,028h,03fh,059h,041h,07fh,077h,076h,07fh,096h,0d5h,0ffh,09ch,0ffh,0ffh,09ch,0ffh,0ffh	; ad5d  ......&(?YA.wv..........
	defb 0e0h,0e0h,0e0h,030h,030h,0f0h,018h,018h,0f8h,0c8h,0c8h,0f8h,0ach,02ch,0fch,01ch,0dch,0fch,052h,0b2h,0feh,09dh,07dh,0ffh	; ad75  ...00........,....R...}.
	defb 000h,000h,000h,000h,001h,001h,007h,000h,007h,01eh,001h,01fh,01ch,077h,07fh,021h,0feh,0deh,043h,0fdh,0fch,063h,0fdh,0bdh	; ad8d  .............w.!..C..c..
	defb 000h,000h,000h,040h,0c0h,080h,080h,0e0h,060h,000h,0f0h,0f0h,0e0h,018h,018h,0f0h,0ech,04ch,0f8h,0f6h,096h,0f8h,0f7h,027h	; ada5  ...@....`........L.....'
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,001h,003h,003h,003h	; adbd  ........................
	defb 034h,034h,03ch,02ah,03ah,03ah,069h,069h,079h,071h,051h,071h,0d1h,0d1h,0f1h,0feh,0beh,0feh,0b0h,0b0h,0f0h,0e0h,060h,0e0h	; add5  44<*::iiyqQq..........`.
	defb 000h,000h,000h,007h,007h,007h,00eh,00dh,00fh,00fh,00bh,00fh,00fh,00bh,00fh,00fh,00dh,00fh,03fh,03eh,03fh,02fh,03fh,03fh	; aded  ..................?>?/??
	defb 000h,000h,000h,080h,080h,080h,0dch,0dch,0dch,0fch,074h,0fch,0fch,0ach,0fch,0f8h,0d8h,0f8h,0fch,0ach,0fch,0feh,076h,0feh	; ae05  ..........t...........v.
	defb 000h,000h,000h,03ch,03ch,03ch,05eh,066h,07eh,0dah,0a6h,0fah,0fah,0beh,0fah,0dfh,0e7h,0ffh,0dfh,0a7h,0ffh,0dbh,0a7h,0fbh	; ae1d  ...<<<^f~...............
	defb 000h,000h,000h,03ch,03ch,03ch,06eh,072h,07eh,06dh,053h,07dh,07dh,05fh,07dh,0efh,0b3h,0ffh,0edh,033h,0fdh,0edh,013h,0fdh	; ae35  ...<<<nr~mS}}_}....3....
	defb 016h,01ah,01eh,03eh,036h,03eh,07fh,06bh,07fh,06dh,057h,07dh,06dh,057h,07dh,06dh,057h,07dh,06dh,057h,07dh,06dh,057h,07dh	; ae4d  ...>6>.k.mW}mW}mW}mW}mW}
	defb 02ch,034h,03ch,07ch,06ch,07ch,0feh,0d6h,0feh,0dah,0aeh,0fah,07ah,08eh,07ah,0fah,08eh,0fah,0fah,08eh,0fah,0fah,08eh,0fah	; ae65  ,4<|l|......z.z.........
	defb 000h,000h,000h,01fh,01fh,01fh,03fh,031h,03fh,077h,06fh,077h,06fh,05fh,06eh,06fh,05fh,06eh,06fh,07eh,06fh,07eh,04fh,07fh	; ae7d  ......?1?wowo_no_no~o~O.
	defb 000h,000h,000h,0f0h,0f0h,0f0h,0f8h,018h,0f8h,0fch,0cch,0fch,0fch,0e4h,0fch,0fch,0e4h,0fch,0fch,0ech,0fch,0ech,0f4h,0fch	; ae95  ........................
	defb 00fh,00fh,00fh,019h,01eh,01fh,032h,03dh,03fh,064h,07bh,07fh,044h,07bh,07fh,0c4h,0fbh,0ffh,084h,0fbh,0ffh,084h,0fbh,0ffh	; aead  ......2=?d{.D{..........
	defb 0f0h,0f0h,0f0h,0f8h,018h,0f8h,07ch,0cch,0fch,07eh,0a6h,0feh,07eh,0a2h,0feh,07fh,0a3h,0ffh,07fh,0a1h,0ffh,0ffh,021h,0ffh	; aec5  ......|..~..~.........!.
	defb 006h,000h,007h,00eh,002h,00fh,009h,006h,00fh,005h,003h,007h,004h,003h,007h,004h,003h,007h,004h,003h,007h,009h,006h,00fh	; aedd  ........................
	defb 070h,050h,0f0h,078h,048h,0f8h,0f8h,028h,0f8h,0f8h,0d8h,0f8h,0f4h,04ch,0fch,0feh,05ah,0feh,0feh,05ah,0feh,0feh,02ah,0feh	; aef5  pP.xH..(.....L..Z..Z..*.
	defb 000h,000h,000h,001h,000h,001h,003h,001h,003h,007h,003h,006h,007h,00bh,00eh,00fh,010h,01fh,03fh,000h,03fh,03fh,040h,07fh	; af0d  ..................?.??@.
	defb 080h,000h,080h,0e0h,020h,0e0h,0f0h,090h,0f0h,0f8h,0c8h,078h,07ch,0c4h,0bch,0feh,0e2h,01eh,0ffh,071h,08fh,0fdh,033h,0cdh	; af25  .... ......x|......q..3.
	defb 000h,000h,000h,000h,000h,000h,00fh,000h,00fh,02fh,01fh,03fh,071h,03eh,071h,023h,07ch,063h,027h,058h,067h,063h,07ch,063h	; af3d  ........./.?q>q#|c'Xgc|c
	defb 000h,000h,000h,000h,000h,000h,0f0h,000h,0f0h,0fch,0f0h,0fch,0feh,00ch,0feh,0feh,004h,0feh,0feh,002h,0feh,0feh,006h,0feh	; af55  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,008h,008h,009h,009h,009h,00bh,00bh,008h,00fh,00eh,008h,00eh,00dh,009h	; af6d  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,0c0h,0e0h,0e0h,020h,0f0h,0f0h,010h,0f0h,0f0h,050h	; af85  ................. .....P
	defb 000h,000h,000h,00fh,00fh,00fh,078h,07fh,078h,0fbh,0efh,09fh,0ffh,0c5h,0ffh,0ffh,083h,0ffh,0bfh,0c1h,0ffh,0b7h,0d9h,0ffh	; af9d  ......x.x...............
	defb 000h,000h,000h,0e0h,0e0h,0e0h,03ch,0fch,03ch,0feh,0beh,0f2h,0feh,056h,0feh,0feh,0a2h,0feh,0feh,022h,0feh,0feh,052h,0feh	; afb5  ......<.<....V....."..R.
	defb 001h,001h,001h,002h,002h,003h,004h,004h,007h,00ch,00dh,00eh,012h,012h,01fh,021h,025h,03bh,040h,040h,07fh,0a0h,0a0h,0ffh	; afcd  ...............!%.@@....
	defb 020h,020h,0e0h,010h,010h,0f0h,008h,008h,0f8h,004h,004h,0fch,002h,002h,0feh,002h,002h,0feh,085h,0a5h,0dfh,049h,049h,0ffh	; afe5    ...................II.
	defb 001h,001h,001h,01ah,01bh,01bh,03fh,03ch,027h,07eh,07fh,058h,03fh,03fh,026h,07fh,07dh,06fh,0feh,0f3h,09eh,079h,066h,07dh	; affd  ......?<'~.X??&.}o...yf}
	defb 080h,080h,080h,0c0h,040h,0c0h,020h,0e0h,020h,040h,0c0h,040h,0e0h,0e0h,060h,050h,0f0h,050h,028h,0f8h,028h,00ch,0fch,00ch	; b015  ....@. . @.@..`P.P(.(...
	defb 000h,000h,000h,000h,000h,000h,07fh,07fh,07fh,09fh,0e0h,09fh,0cfh,0ffh,0cfh,0a0h,0ffh,0a0h,09fh,0ffh,09fh,09fh,0f0h,09fh	; b02d  ........................
	defb 000h,000h,000h,000h,000h,000h,0f8h,0f8h,0f8h,0fch,004h,0fch,0feh,0f2h,0feh,0ffh,001h,0ffh,0ffh,0ffh,0ffh,0ffh,001h,0ffh	; b045  ........................
	defb 0dah,0dbh,0ffh,07dh,075h,07fh,033h,02bh,03fh,061h,051h,07fh,0b5h,0b5h,0ffh,09eh,09eh,0feh,0cch,0cch,0fch,078h,078h,078h	; b05d  ...}u.3+?aQ..........xxx
	defb 03ch,0fch,0ffh,0f2h,0f2h,0f3h,072h,072h,0f3h,0e5h,0e5h,0e7h,0cah,0cah,0ceh,00ah,00ah,00eh,004h,004h,004h,000h,000h,000h	; b075  <.....rr................
	defb 073h,0dch,0beh,0d9h,0aeh,0ffh,06ch,057h,07fh,036h,02bh,03fh,01bh,014h,01fh,00dh,00bh,00fh,007h,005h,007h,003h,003h,003h	; b08d  s.....lW.6+?............
	defb 0f0h,0efh,04fh,0e3h,01eh,01fh,00eh,0f9h,0ffh,039h,0e6h,0ffh,0e6h,09ah,0feh,098h,068h,0f8h,060h,0a0h,0e0h,080h,000h,080h	; b0a5  ..O......9......h.`.....
	defb 007h,007h,007h,01dh,01eh,01fh,037h,038h,03fh,02fh,033h,03fh,07fh,060h,07fh,07fh,05fh,07fh,071h,061h,07fh,03fh,03fh,03fh	; b0bd  ......78?/3?.`.._.qa.???
	defb 070h,070h,0f0h,0d8h,098h,0f8h,0f8h,098h,0f8h,0e8h,028h,0f8h,0d8h,0d8h,0f8h,0f0h,0f0h,0f0h,0e0h,0e0h,0e0h,080h,080h,080h	; b0d5  pp........(.............
	defb 03fh,036h,03fh,01fh,019h,01fh,01fh,019h,01fh,03fh,036h,03fh,07fh,06fh,07fh,0f9h,0d9h,0f9h,0f0h,0b0h,0f0h,0e0h,0e0h,0e0h	; b0ed  ?6?......?6?.o..........
	defb 0feh,0bah,0feh,0ffh,0dbh,0ffh,0ffh,0e7h,0ffh,0feh,0feh,0feh,0dch,05ch,0dch,0c0h,0c0h,0c0h,000h,000h,000h,000h,000h,000h	; b105  .............\..........
	defb 0dbh,0a7h,0fbh,0c9h,0b7h,0f9h,0fdh,0bfh,0fdh,0f9h,0bfh,0fdh,0e3h,0dfh,0e3h,07eh,07eh,07eh,000h,000h,000h,000h,000h,000h	; b11d  ...............~~~......
	defb 0edh,0d3h,0fdh,0cdh,0b3h,0fdh,0bdh,0ffh,0fdh,0f9h,0bfh,0fdh,0e3h,0dfh,0e3h,07eh,07eh,07eh,000h,000h,000h,000h,000h,000h	; b135  ...............~~~......
	defb 06dh,057h,07dh,06dh,057h,07dh,06dh,057h,07dh,05dh,067h,07dh,07fh,047h,07fh,07dh,05fh,07dh,05dh,07fh,05dh,023h,03fh,023h	; b14d  mW}mW}mW}]g}.G.}_}].]#?#
	defb 0dah,0aeh,0fah,0dah,0aeh,0fah,0dah,0aeh,0fah,0bah,0ceh,0fah,0feh,08eh,0feh,0fah,0beh,0fah,03ah,0feh,03ah,0c4h,0fch,0c4h	; b165  ..................:.:...
	defb 07eh,04fh,07fh,07fh,067h,07fh,07fh,051h,07fh,06fh,05fh,07fh,06ch,073h,07ch,038h,037h,038h,01fh,01fh,01fh,000h,000h,000h	; b17d  ~O..g..Q.o_.ls|878......
	defb 0ech,0f4h,0fch,0dch,0ech,0fch,0f4h,01ch,0f4h,0e4h,0fch,0e4h,06ch,0fch,06ch,078h,0f8h,078h,0f0h,0f0h,0f0h,000h,000h,000h	; b195  ............l.lx.x......
	defb 091h,0ffh,0ffh,0bbh,0ffh,0ffh,0bbh,0ffh,0ffh,0dbh,0ffh,0ffh,06dh,07fh,07fh,035h,03fh,03fh,01ah,01fh,01fh,00eh,00fh,00fh	; b1ad  ............m..5??......
	defb 0ffh,089h,0ffh,0ffh,0ddh,0ffh,0ffh,0ddh,0ffh,0ffh,0dbh,0ffh,0feh,0b6h,0feh,0fch,0ach,0fch,0f8h,058h,0f8h,0f0h,070h,0f0h	; b1c5  ...................X..p.
	defb 033h,02ch,03fh,067h,058h,07fh,0c7h,0bbh,0fch,0cfh,0b7h,0f8h,0c7h,0bbh,0fch,0e7h,09bh,0fch,073h,04ch,07fh,03fh,030h,03fh	; b1dd  3,?gX.............sL.?0?
	defb 0ffh,017h,0ffh,0ffh,00bh,0ffh,0ffh,0e5h,01fh,0ffh,0f5h,00fh,0ffh,0e5h,01fh,0ffh,089h,07fh,0ffh,073h,0ffh,0fch,00ch,0fch	; b1f5  ...................s....
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,07fh,080h,07fh,0bfh,0c0h,0bfh,05fh,060h,05fh,02fh,036h,02fh,016h,019h,016h,009h,00fh,009h	; b20d  ............_`_/6/......
	defb 0fbh,007h,0fbh,0f6h,00eh,0f6h,0ech,01ch,0ech,0d8h,038h,0d8h,0b0h,070h,0b0h,060h,0e0h,060h,0c0h,0c0h,0c0h,080h,080h,080h	; b225  ..........8..p.`.`......
	defb 050h,07fh,070h,060h,07fh,07fh,07fh,05fh,07fh,06fh,057h,078h,06fh,057h,078h,03fh,030h,03fh,03fh,03fh,03fh,00fh,00fh,00fh	; b23d  P.p`..._.oWxoWx?0????...
	defb 0fah,00eh,0feh,006h,0feh,0feh,0ffh,0fbh,0ffh,0ffh,0fbh,0bfh,0ffh,0fbh,0bfh,0ffh,0bfh,0ffh,0feh,0feh,0feh,0f8h,0f8h,0f8h	; b255  ........................
	defb 01fh,017h,018h,01fh,017h,01ch,017h,01bh,01fh,00ah,00ch,00fh,007h,007h,007h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b26d  ........................
	defb 0f8h,0e8h,0d8h,0e8h,0e8h,038h,0e8h,0e8h,0f8h,070h,070h,0f0h,0e0h,0e0h,0e0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b285  .....8...pp.............
	defb 0f7h,098h,0ffh,0bfh,093h,0ffh,0dch,09fh,0fch,0ffh,091h,0ffh,077h,079h,07fh,03fh,031h,03fh,01fh,01fh,01fh,000h,000h,000h	; b29d  ............wy.?1?......
	defb 0feh,092h,0feh,0fah,012h,0feh,016h,0f2h,01eh,0feh,012h,0feh,0fch,01ch,0fch,0f8h,018h,0f8h,0f0h,0f0h,0f0h,000h,000h,000h	; b2b5  ........................
	defb 090h,090h,0ffh,088h,088h,0ffh,084h,084h,0ffh,0d2h,0d2h,0ffh,069h,069h,07fh,031h,031h,03fh,019h,019h,01fh,00dh,00dh,00fh	; b2cd  ............ii.11?......
	defb 031h,0b1h,07fh,021h,021h,0ffh,043h,043h,0ffh,086h,086h,0feh,00ch,00ch,0fch,018h,018h,0f8h,030h,030h,0f0h,060h,060h,0e0h	; b2e5  1..!!.CC..........00.``.
	defb 073h,04ch,07bh,073h,04ch,07bh,0b7h,0c8h,0bfh,0bfh,0c0h,0bfh,09fh,0e0h,09fh,04fh,070h,04fh,030h,03fh,030h,00fh,00fh,00fh	; b2fd  sL{sL{.........OpO0?0...
	defb 026h,0deh,026h,0a2h,05eh,0a2h,023h,0dfh,023h,023h,0dfh,063h,047h,0bfh,0c7h,086h,07eh,086h,01ch,0fch,01ch,0f0h,0f0h,0f0h	; b315  &.&.^.#.##.cG...~.......
	defb 09fh,0f7h,09fh,09ch,0f7h,09ch,09ch,0f7h,09ch,09ch,0f7h,09ch,05fh,076h,05fh,030h,03fh,030h,01fh,01fh,01fh,000h,000h,000h	; b32d  ............_v_0?0......
	defb 0ffh,0f5h,0ffh,00fh,0f5h,00fh,03fh,0c5h,03fh,00fh,0f5h,00fh,0ffh,001h,0ffh,001h,0ffh,001h,0ffh,0ffh,0ffh,000h,000h,000h	; b345  ......?.?...............
	defb 000h,000h,000h,000h,008h,008h,000h,00ch,00ch,000h,00eh,00eh,000h,00fh,00fh,000h,07fh,07fh,000h,03fh,03fh,001h,01fh,01eh	; b35d  ...................??...
	defb 000h,020h,020h,000h,020h,020h,000h,060h,060h,000h,0e0h,0e0h,038h,0f8h,0c8h,078h,0ffh,08fh,0f0h,0feh,01eh,0e0h,0fch,03ch	; b375  .  .  .``...8..x.......<
	defb 000h,000h,000h,008h,000h,000h,00ch,000h,000h,00eh,000h,000h,00fh,001h,000h,07fh,003h,000h,03fh,007h,000h,01fh,007h,001h	; b38d  ..................?.....
	defb 020h,000h,000h,020h,000h,000h,060h,060h,000h,0e0h,0e0h,000h,0e0h,0e0h,020h,0ffh,0cch,040h,0feh,09ch,080h,0fch,03ch,004h	; b3a5   .. ..``...... ..@....<.

; ----------------------------------------------------------------------
; DATOS fichas_b3bd: 4 fichas en 3 planos en la VRAM 0xC400 (p00:4B52); lo
;   leen p00:4B52 (96 bytes)
;   0xb3bd..0xb41d  (96 bytes)
DATA_fichas_b3bd:
	defb 003h,00fh,00ch,003h,01fh,01ch,003h,03fh,03fh,01ch,07fh,067h,01ch,01fh,007h,01ch,01fh,01fh,000h,006h,006h,000h,004h,004h	; b3bd  .......??..g............
	defb 0c0h,0f8h,078h,080h,0fch,0fch,000h,0feh,0feh,000h,0ffh,0ffh,000h,0f0h,0f0h,000h,070h,070h,000h,030h,030h,000h,010h,010h	; b3d5  ..x.............pp.00...
	defb 00fh,006h,006h,03fh,038h,008h,03fh,038h,008h,07fh,038h,038h,007h,007h,001h,007h,007h,001h,007h,007h,007h,004h,000h,000h	; b3ed  ...?8.?8..88............
	defb 0f8h,078h,008h,0fch,0f0h,010h,0feh,0e0h,020h,0ffh,0c0h,0c0h,0f0h,000h,000h,070h,000h,000h,030h,000h,000h,010h,000h,000h	; b405  .x...... ......p..0.....

; ----------------------------------------------------------------------
; DATOS fichas_del_transceptor: 31 fichas en 3 planos (colores 0x4B13) que
;   p00:4B63 vuelca en la VRAM 0xC804; las 7 de 0xB65D van otra vez volteadas
;   a 0xCC00 (p00:4B6E); lo leen p00:4B63, p00:4B6E (744 bytes)
;   0xb41d..0xb705  (744 bytes)
DATA_fichas_del_transceptor:
	defb 058h,0a0h,0ffh,099h,0ffh,099h,099h,0ffh,099h,099h,0ffh,099h,099h,0ffh,099h,099h,0ffh,099h,0ffh,0ffh,0ffh,077h,077h,077h	; b41d  X....................www
	defb 00bh,0f4h,0ffh,0e9h,0ffh,089h,0a9h,0ffh,0c9h,0a9h,0ffh,0c9h,0a9h,0ffh,0c9h,0e9h,0ffh,089h,0ffh,0ffh,0ffh,077h,077h,077h	; b435  .....................www
	defb 000h,0ffh,0ffh,0eeh,0ffh,088h,0aah,0ffh,0cch,0aah,0ffh,0cch,0aah,0ffh,0cch,0eeh,0ffh,088h,0ffh,0ffh,0ffh,077h,077h,077h	; b44d  .....................www
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b465  ........................
	defb 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,0ffh,000h,000h,000h	; b47d  ........................
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h	; b495  ........................
	defb 02ch,010h,034h,03ch,03ch,07eh,06eh,07eh,0f7h,036h,03eh,0e7h,03ch,03ch,07eh,076h,04ah,07eh,03ch,03ch,03ch,000h,000h,000h	; b4ad  ,.4<<~n~.6>.<<~vJ~<<<...
	defb 0ffh,000h,0ffh,0bfh,03fh,0ffh,0dfh,05fh,0ffh,0e0h,060h,0ffh,0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h	; b4c5  ....?.._..`..`..`..`..`.
	defb 0e0h,000h,018h,038h,0c0h,0feh,006h,000h,0ffh,001h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; b4dd  ...8....................
	defb 001h,0feh,0ffh,0ffh,0feh,0ffh,057h,0feh,0ffh,0ffh,0aah,0ffh,0ffh,056h,0ffh,0ffh,0aah,0ffh,001h,0feh,0ffh,0ffh,0ffh,0ffh	; b4f5  ......W......V..........
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; b50d  ........................
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,007h,000h,008h	; b525  ........................
	defb 0c0h,080h,0a0h,0c0h,080h,0a0h,0c0h,000h,020h,000h,000h,0e0h,0e0h,0e0h,0e0h,000h,000h,000h,000h,000h,0e0h,000h,000h,000h	; b53d  ........ ...............
	defb 0ffh,000h,0ffh,0ffh,0feh,0ffh,0ffh,0feh,0ffh,007h,006h,0ffh,007h,006h,00fh,007h,006h,00fh,007h,006h,00fh,007h,006h,00fh	; b555  ........................
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,000h,020h	; b56d  .......................
	defb 006h,002h,00ah,007h,003h,00bh,007h,000h,008h,000h,000h,00fh,00fh,00fh,00fh,000h,000h,000h,000h,000h,00fh,000h,000h,000h	; b585  ........................
	defb 000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b59d  ........................
	defb 000h,000h,001h,000h,000h,001h,000h,000h,001h,000h,000h,001h,000h,000h,001h,000h,000h,001h,000h,000h,001h,000h,000h,001h	; b5b5  ........................
	defb 006h,001h,019h,01ch,003h,07fh,060h,000h,0ffh,080h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; b5cd  ......`.................
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; b5e5  ........................
	defb 006h,002h,08ah,006h,002h,08ah,006h,002h,08ah,006h,002h,08ah,006h,002h,08ah,006h,002h,08ah,006h,002h,08ah,006h,002h,08ah	; b5fd  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b615  ........................
	defb 0c0h,080h,0a0h,0c0h,080h,0a0h,0c0h,080h,0a0h,0c0h,080h,0a0h,0c0h,080h,0a0h,0c0h,080h,0a0h,0c0h,080h,0a0h,0c0h,080h,0a0h	; b62d  ........................
	defb 080h,07fh,0ffh,0ffh,07fh,0ffh,0d5h,07fh,0ffh,0ffh,06ah,0ffh,0ffh,055h,0ffh,0ffh,06ah,0ffh,080h,07fh,0ffh,0ffh,0ffh,0ffh	; b645  ..........j..U..j.......
	defb 010h,000h,03fh,028h,020h,03fh,014h,014h,01fh,00ah,00ah,00fh,007h,007h,007h,003h,003h,003h,000h,000h,000h,000h,000h,000h	; b65d  ..?( ?..................
	defb 010h,000h,03fh,020h,000h,07fh,020h,000h,07fh,040h,000h,0ffh,040h,000h,0ffh,040h,000h,0ffh,040h,000h,0ffh,040h,000h,0ffh	; b675  ..? .. ..@..@..@..@..@..
	defb 0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h,0e0h,060h,0f0h	; b68d  .`..`..`..`..`..`..`..`.
	defb 00fh,00fh,08fh,0ffh,0ffh,0ffh,00fh,00fh,0ffh,0f8h,000h,0ffh,000h,000h,0f0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; b6a5  ........................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,000h,0c0h,040h,000h,0e0h,020h,000h,0f0h,010h,000h,0f8h,008h,000h,0fch	; b6bd  ............@.. ........
	defb 040h,000h,0ffh,040h,000h,0ffh,040h,000h,0ffh,040h,000h,0ffh,040h,000h,0ffh,020h,000h,07fh,020h,000h,07fh,050h,040h,07fh	; b6d5  @..@..@..@..@.. .. ..P@.
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,080h,080h,0ffh,0e0h,0e0h,0ffh,0ffh,0ffh,0ffh,03fh,03fh,03fh	; b6ed  .....................???

; ----------------------------------------------------------------------
; DATOS fichas_de_la_camara: 8 fichas en 2 planos (16 bytes, colores 0x4B23)
;   en la VRAM 0xC010 (p00:4B81, L_51FE); lo leen p00:4B81 (128 bytes)
;   0xb705..0xb785  (128 bytes)
DATA_fichas_de_la_camara:
	defb 003h,002h,009h,00eh,00bh,00ch,00fh,00fh,009h,00eh,00bh,00ch,00bh,00ch,00bh,00ch	; b705  ................
	defb 040h,0c0h,0b0h,050h,0f0h,010h,0f0h,0f0h,0f0h,010h,0f0h,010h,0f0h,010h,0f0h,010h	; b715  @..P............
	defb 001h,001h,008h,00fh,00ah,00dh,00bh,00ch,00bh,00ch,00bh,00ch,009h,00eh,00fh,00fh	; b725  ................
	defb 098h,098h,054h,0b4h,0f4h,010h,0f4h,014h,0f8h,018h,0f0h,010h,070h,090h,0f0h,0f0h	; b735  ..T.........p...
	defb 000h,000h,000h,000h,000h,000h,01fh,01fh,004h,01fh,0cdh,0d6h,004h,0dfh,0ffh,03fh	; b745  ...............?
	defb 000h,000h,00ch,008h,012h,012h,0fdh,0fdh,017h,0ebh,0feh,002h,07eh,082h,0ffh,0ebh	; b755  ............~...
	defb 000h,000h,030h,010h,048h,048h,0bfh,0bfh,0c0h,0ffh,04fh,070h,043h,07ch,0ffh,0f7h	; b765  ..0.HH....OpC|..
	defb 000h,000h,000h,000h,000h,000h,0f8h,0f8h,0a8h,070h,0ebh,033h,0e8h,033h,0ffh,0fch	; b775  .........p.3.3..

; ----------------------------------------------------------------------
; DATOS fichas_de_la_camara_2: 8 fichas mas en 2 planos, en la VRAM 0xC410
;   (p00:4B8C); lo leen p00:4B8C (128 bytes)
;   0xb785..0xb805  (128 bytes)
DATA_fichas_de_la_camara_2:
	defb 00bh,00ch,01bh,01ch,029h,02eh,02fh,00fh,02fh,02eh,01fh,01eh,007h,006h,001h,001h	; b785  ....)././.......
	defb 0f0h,010h,0f0h,010h,030h,0d0h,0f0h,0f0h,0f0h,070h,0f0h,0f0h,0f0h,0f0h,080h,080h	; b795  ....0....p......
	defb 009h,00eh,008h,00fh,00fh,00fh,00eh,00fh,00fh,00dh,00fh,00fh,003h,002h,001h,001h	; b7a5  ................
	defb 0f0h,010h,0b0h,050h,0f0h,0f0h,070h,0d0h,0f0h,0b0h,0f0h,0f0h,040h,0c0h,080h,080h	; b7b5  ...P..p.....@...
	defb 0ffh,0e6h,0dfh,0c4h,0dfh,0c4h,01fh,01fh,000h,000h,007h,006h,000h,000h,000h,000h	; b7c5  ................
	defb 0ffh,003h,0feh,002h,0feh,002h,0feh,0feh,010h,000h,0f0h,080h,000h,000h,000h,000h	; b7d5  ................
	defb 0ffh,0c0h,07fh,040h,07fh,040h,03fh,03fh,008h,000h,00fh,001h,000h,000h,000h,000h	; b7e5  ...@.@??........
	defb 0ffh,027h,0fbh,023h,0fbh,023h,0f8h,0f8h,000h,000h,0e0h,060h,000h,000h,000h,000h	; b7f5  .'.#.#.....`....

; ----------------------------------------------------------------------
; DATOS rotulo_B805: rotulo con posicion ([fila][columna] y caracteres, 0xFE
;   otra posicion, 0xFF acaba) que p00:46A2 escribe con L_510C: WEAPON /
;   SELECT / OPTION; lo leen p00:46A2 (26 bytes)
;   0xb805..0xb81f  (26 bytes)
DATA_rotulo_B805:
	defb 048h,010h,057h,045h,041h,050h,04fh,04eh,000h,000h,053h,045h,04ch,045h,043h,054h	; b805  H.WEAPON..SELECT
	defb 0feh,068h,090h,04fh,050h,054h,049h,04fh,04eh,0ffh	; b815  .h.OPTION.

; ----------------------------------------------------------------------
; DATOS rotulo_B81F: rotulo con posicion ([fila][columna] y caracteres, 0xFE
;   otra posicion, 0xFF acaba) que p00:47AC escribe con L_510C: EQUIPMENT /
;   SELECT; lo leen p00:47AC (20 bytes)
;   0xb81f..0xb833  (20 bytes)
DATA_rotulo_B81F:
	defb 040h,010h,045h,051h,055h,049h,050h,04dh,045h,04eh,054h,000h,000h,053h,045h,04ch	; b81f  @.EQUIPMENT..SEL
	defb 045h,043h,054h,0ffh	; b82f

; ----------------------------------------------------------------------
; DATOS rotulo_B833: rotulo con posicion ([fila][columna] y caracteres, 0xFE
;   otra posicion, 0xFF acaba) que p00:4BB7 escribe con L_510C: TRANSCEIVER /
;   RECV y los simbolos; lo leen p00:4BB7 (34 bytes)
;   0xb833..0xb855  (34 bytes)
DATA_rotulo_B833:
	defb 050h,008h,054h,052h,041h,04eh,053h,043h,045h,049h,056h,045h,052h,0feh,038h,040h	; b833  P.TRANSCEIVER.8@
	defb 052h,045h,043h,056h,0feh,078h,021h,0a6h,0a8h,0a4h,0feh,078h,029h,0a7h,0a9h,0a5h	; b843  RECV.x!....x)...
	defb 0a3h,0ffh	; b853

; ----------------------------------------------------------------------
; DATOS dibujo_de_cada_arma: 8 palabras, armas 1-8: de donde copia p00:46ED el
;   dibujo del arma en el menu (p00:46D0 lee 0xB855 + 2 x (arma - 1)); lo leen
;   p00:46D0 (16 bytes)
;   0xb855..0xb865  (16 bytes)
DATA_dibujo_de_cada_arma:
	defw 06000h,06020h,06040h,06060h,06081h,06091h,060a1h,060b1h	; b855

; ----------------------------------------------------------------------
; DATOS indice_de_nombres_de_armas: 8 punteros a los nombres de las armas
;   (p00:46F0); lo leen p00:46F0 (16 bytes)
;   0xb865..0xb875  (16 bytes)
DATA_indice_de_nombres_de_armas:
	defw 0b875h,0b87eh,0b882h,0b88ah,0b891h,0b898h,0b89fh,0b8a7h	; b865

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_1: el nombre del arma 1, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (9 bytes)
;   0xb875..0xb87e  (9 bytes)
DATA_nombre_de_arma_1:
	defb 048h,041h,04eh,044h,000h,047h,055h,04eh,0ffh	; b875  HAND.GUN.

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_2: el nombre del arma 2, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (4 bytes)
;   0xb87e..0xb882  (4 bytes)
DATA_nombre_de_arma_2:
	defb 053h,04dh,047h,0ffh	; b87e

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_3: el nombre del arma 3, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (8 bytes)
;   0xb882..0xb88a  (8 bytes)
DATA_nombre_de_arma_3:
	defb 047h,052h,045h,04eh,041h,044h,045h,0ffh	; b882  GRENADE.

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_4: el nombre del arma 4, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (7 bytes)
;   0xb88a..0xb891  (7 bytes)
DATA_nombre_de_arma_4:
	defb 052h,04fh,043h,04bh,045h,054h,0ffh	; b88a

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_5: el nombre del arma 5, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (7 bytes)
;   0xb891..0xb898  (7 bytes)
DATA_nombre_de_arma_5:
	defb 050h,040h,042h,04fh,04dh,042h,0ffh	; b891

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_6: el nombre del arma 6, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (7 bytes)
;   0xb898..0xb89f  (7 bytes)
DATA_nombre_de_arma_6:
	defb 04ch,040h,04dh,041h,049h,04eh,0ffh	; b898

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_7: el nombre del arma 7, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (8 bytes)
;   0xb89f..0xb8a7  (8 bytes)
DATA_nombre_de_arma_7:
	defb 04dh,049h,053h,053h,049h,04ch,045h,0ffh	; b89f  MISSILE.

; ----------------------------------------------------------------------
; DATOS nombre_de_arma_8: el nombre del arma 8, caracteres hasta 0xFF
;   (p00:4702, L_5116); lo leen p00:4702 (9 bytes)
;   0xb8a7..0xb8b0  (9 bytes)
DATA_nombre_de_arma_8:
	defb 053h,049h,04ch,045h,04eh,043h,045h,052h,0ffh	; b8a7  SILENCER.

; ----------------------------------------------------------------------
; DATOS cursor_del_menu_de_armas: 8 palabras [x][y] del cursor por hueco del
;   menu de armas (p00:43CA -> L_42B4 por 0xC154); lo leen p00:43CA (16 bytes)
;   0xb8b0..0xb8c0  (16 bytes)
DATA_cursor_del_menu_de_armas:
	defw 00000h,0102ch,01044h,0105ch,01074h,0802ch,08044h,0805ch	; b8b0

; ----------------------------------------------------------------------
; DATOS dibujo_de_cada_objeto: 27 palabras, objetos 1-27: de donde copia
;   p00:47E8 el dibujo del objeto en el menu (p00:47D4); lo leen p00:47D4 (54
;   bytes)
;   0xb8c0..0xb8f6  (54 bytes)
DATA_dibujo_de_cada_objeto:
	defw 060c1h,060d1h,060e1h,060f1h,07001h,07011h,07021h,07031h	; b8c0
	defw 07041h,07051h,07061h,07071h,07081h,07091h,07091h,07091h	; b8d0
	defw 07091h,07091h,07091h,07091h,07091h,070a1h,070b1h,070c1h	; b8e0
	defw 070d1h,070e1h,070f1h	; b8f0

; ----------------------------------------------------------------------
; DATOS indice_de_nombres_de_objetos: 25 punteros a los nombres de los objetos
;   (p00:47EB); lo leen p00:47EB (50 bytes)
;   0xb8f6..0xb928  (50 bytes)
DATA_indice_de_nombres_de_objetos:
	defw 0b928h,0b92eh,0b933h,0b939h,0b93fh,0b944h,0b94ah,0b950h	; b8f6
	defw 0b956h,0b95ch,0b962h,0b969h,0b96fh,0b975h,0b97bh,0b981h	; b906
	defw 0b987h,0b98dh,0b993h,0b999h,0b99fh,0b9a5h,0b9abh,0b9b1h	; b916
	defw 0b9b7h	; b926  -> DATA_nombre_de_objeto_25

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_1: el nombre del objeto 1, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb928..0xb92e  (6 bytes)
DATA_nombre_de_objeto_1:
	defb 041h,052h,04dh,04fh,052h,0ffh	; b928

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_2: el nombre del objeto 2, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (5 bytes)
;   0xb92e..0xb933  (5 bytes)
DATA_nombre_de_objeto_2:
	defb 053h,055h,049h,054h,0ffh	; b92e

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_3: el nombre del objeto 3, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb933..0xb939  (6 bytes)
DATA_nombre_de_objeto_3:
	defb 04ch,049h,047h,048h,054h,0ffh	; b933

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_4: el nombre del objeto 4, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb939..0xb93f  (6 bytes)
DATA_nombre_de_objeto_4:
	defb 047h,04fh,047h,047h,04ch,0ffh	; b939

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_5: el nombre del objeto 5, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (5 bytes)
;   0xb93f..0xb944  (5 bytes)
DATA_nombre_de_objeto_5:
	defb 04dh,041h,053h,04bh,0ffh	; b93f

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_6: el nombre del objeto 6, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb944..0xb94a  (6 bytes)
DATA_nombre_de_objeto_6:
	defb 043h,049h,047h,041h,04ch,0ffh	; b944

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_7: el nombre del objeto 7, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb94a..0xb950  (6 bytes)
DATA_nombre_de_objeto_7:
	defb 044h,045h,054h,045h,043h,0ffh	; b94a

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_8: el nombre del objeto 8, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb950..0xb956  (6 bytes)
DATA_nombre_de_objeto_8:
	defb 041h,04eh,054h,045h,04eh,0ffh	; b950

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_9: el nombre del objeto 9, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb956..0xb95c  (6 bytes)
DATA_nombre_de_objeto_9:
	defb 053h,043h,04fh,050h,045h,0ffh	; b956

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_10: el nombre del objeto 10, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb95c..0xb962  (6 bytes)
DATA_nombre_de_objeto_10:
	defb 042h,04fh,04dh,042h,045h,0ffh	; b95c

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_11: el nombre del objeto 11, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (7 bytes)
;   0xb962..0xb969  (7 bytes)
DATA_nombre_de_objeto_11:
	defb 043h,04fh,04dh,050h,041h,053h,0ffh	; b962

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_12: el nombre del objeto 12, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb969..0xb96f  (6 bytes)
DATA_nombre_de_objeto_12:
	defb 050h,041h,052h,041h,043h,0ffh	; b969

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_13: el nombre del objeto 13, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb96f..0xb975  (6 bytes)
DATA_nombre_de_objeto_13:
	defb 041h,04eh,054h,049h,044h,0ffh	; b96f

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_14: el nombre del objeto 14, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb975..0xb97b  (6 bytes)
DATA_nombre_de_objeto_14:
	defb 043h,041h,052h,044h,031h,0ffh	; b975

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_15: el nombre del objeto 15, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb97b..0xb981  (6 bytes)
DATA_nombre_de_objeto_15:
	defb 043h,041h,052h,044h,032h,0ffh	; b97b

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_16: el nombre del objeto 16, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb981..0xb987  (6 bytes)
DATA_nombre_de_objeto_16:
	defb 043h,041h,052h,044h,033h,0ffh	; b981

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_17: el nombre del objeto 17, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb987..0xb98d  (6 bytes)
DATA_nombre_de_objeto_17:
	defb 043h,041h,052h,044h,034h,0ffh	; b987

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_18: el nombre del objeto 18, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb98d..0xb993  (6 bytes)
DATA_nombre_de_objeto_18:
	defb 043h,041h,052h,044h,035h,0ffh	; b98d

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_19: el nombre del objeto 19, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb993..0xb999  (6 bytes)
DATA_nombre_de_objeto_19:
	defb 043h,041h,052h,044h,036h,0ffh	; b993

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_20: el nombre del objeto 20, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb999..0xb99f  (6 bytes)
DATA_nombre_de_objeto_20:
	defb 043h,041h,052h,044h,037h,0ffh	; b999

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_21: el nombre del objeto 21, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb99f..0xb9a5  (6 bytes)
DATA_nombre_de_objeto_21:
	defb 043h,041h,052h,044h,038h,0ffh	; b99f

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_22: el nombre del objeto 22, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb9a5..0xb9ab  (6 bytes)
DATA_nombre_de_objeto_22:
	defb 052h,041h,054h,049h,04fh,0ffh	; b9a5

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_23: el nombre del objeto 23, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb9ab..0xb9b1  (6 bytes)
DATA_nombre_de_objeto_23:
	defb 054h,052h,041h,04eh,053h,0ffh	; b9ab

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_24: el nombre del objeto 24, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (6 bytes)
;   0xb9b1..0xb9b7  (6 bytes)
DATA_nombre_de_objeto_24:
	defb 055h,04eh,049h,046h,04fh,0ffh	; b9b1

; ----------------------------------------------------------------------
; DATOS nombre_de_objeto_25: el nombre del objeto 25, caracteres hasta 0xFF
;   (p00:47FD); lo leen p00:47FD (4 bytes)
;   0xb9b7..0xb9bb  (4 bytes)
DATA_nombre_de_objeto_25:
	defb 042h,04fh,058h,0ffh	; b9b7

; ----------------------------------------------------------------------
; DATOS cursor_del_menu_de_objetos: 26 palabras [x][y] del cursor por hueco
;   del menu de objetos (p00:43CF, p00:489B); lo leen p00:43CF, p00:489B (52
;   bytes)
;   0xb9bb..0xb9ef  (52 bytes)
DATA_cursor_del_menu_de_objetos:
	defw 00000h,0102ch,0103ch,0104ch,0105ch,0106ch,0107ch,0108ch	; b9bb
	defw 0109ch,010ach,0602ch,0603ch,0604ch,0605ch,0606ch,0607ch	; b9cb
	defw 0608ch,0609ch,060ach,0b02ch,0b03ch,0b04ch,0b05ch,0b06ch	; b9db
	defw 0b07ch,0b08ch	; b9eb

; ----------------------------------------------------------------------
; DATOS objetos_por_sala: 97 bytes, salas 0x7A-0xDA: que lista de 0xBA50 tiene
;   cada sala (0 = ninguna); p06:BBF4 lee 0xB9EF + sala - 0x7A; lo leen
;   p06:BBF4 (97 bytes)
;   0xb9ef..0xba50  (97 bytes)
DATA_objetos_por_sala:
	defb 012h,000h,000h,000h,001h,002h,003h,000h,028h,000h,004h,000h,000h,007h,000h,006h	; b9ef  ........(.......
	defb 005h,009h,008h,000h,00bh,00ah,000h,000h,000h,00dh,000h,00ch,000h,00eh,000h,029h	; b9ff  ...............)
	defb 000h,000h,011h,010h,023h,000h,013h,000h,02ah,02eh,000h,000h,000h,000h,014h,019h	; ba0f  ....#...*.......
	defb 017h,016h,02bh,000h,018h,015h,01ch,01bh,01ah,00fh,000h,01dh,000h,01eh,01fh,020h	; ba1f  ..+............
	defb 000h,021h,024h,000h,000h,025h,026h,000h,000h,000h,02fh,023h,000h,000h,027h,000h	; ba2f  .!$..%&.../#..'.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02ah,000h,02fh,000h	; ba3f  ............*./.
	defb 02dh	; ba4f

; ----------------------------------------------------------------------
; DATOS indice_de_objetos_en_sala: 47 punteros a las listas de objetos
;   (p06:BBFE -> p00:40BE); lo leen p06:BBFE (94 bytes)
;   0xba50..0xbaae  (94 bytes)
DATA_indice_de_objetos_en_sala:
	defw 0baaeh,0bab2h,0bab6h,0babah,0babeh,0bac2h,0bac6h,0bacah	; ba50
	defw 0baceh,0bad2h,0bad6h,0baddh,0bae1h,0bae5h,0bae9h,0baedh	; ba60
	defw 0baf1h,0baf5h,0bafch,0bb00h,0bb04h,0bb08h,0bb0ch,0bb10h	; ba70
	defw 0bb14h,0bb18h,0bb1ch,0bb26h,0bb2ah,0bb34h,0bb38h,0bb3ch	; ba80
	defw 0bb40h,0bb47h,0bb4bh,0bb4fh,0bb53h,0bb5dh,0bb64h,0bb68h	; ba90
	defw 0bb6ch,0bb70h,0bb74h,0bb7bh,0bb7fh,0bb83h,0bb87h	; baa0

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_1: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbaae..0xbab2  (4 bytes)
DATA_objetos_en_sala_1:
	defb 01eh,050h,050h	; baae
	defb 0ffh	; bab1

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_2: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbab2..0xbab6  (4 bytes)
DATA_objetos_en_sala_2:
	defb 016h,050h,070h	; bab2
	defb 0ffh	; bab5

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_3: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbab6..0xbaba  (4 bytes)
DATA_objetos_en_sala_3:
	defb 011h,040h,070h	; bab6
	defb 0ffh	; bab9

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_4: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbaba..0xbabe  (4 bytes)
DATA_objetos_en_sala_4:
	defb 006h,040h,060h	; baba
	defb 0ffh	; babd

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_5: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbabe..0xbac2  (4 bytes)
DATA_objetos_en_sala_5:
	defb 00dh,020h,048h	; babe
	defb 0ffh	; bac1

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_6: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbac2..0xbac6  (4 bytes)
DATA_objetos_en_sala_6:
	defb 002h,020h,040h	; bac2
	defb 0ffh	; bac5

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_7: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbac6..0xbaca  (4 bytes)
DATA_objetos_en_sala_7:
	defb 019h,060h,080h	; bac6
	defb 0ffh	; bac9

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_8: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbaca..0xbace  (4 bytes)
DATA_objetos_en_sala_8:
	defb 006h,020h,048h	; baca
	defb 0ffh	; bacd

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_9: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los
;   que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbace..0xbad2  (4 bytes)
DATA_objetos_en_sala_9:
	defb 00ch,020h,048h	; bace
	defb 0ffh	; bad1

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_10: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbad2..0xbad6  (4 bytes)
DATA_objetos_en_sala_10:
	defb 014h,020h,048h	; bad2
	defb 0ffh	; bad5

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_11: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (7 bytes)
;   0xbad6..0xbadd  (7 bytes)
DATA_objetos_en_sala_11:
	defb 005h,080h,050h	; bad6
	defb 023h,080h,0b0h	; bad9
	defb 0ffh	; badc

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_12: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbadd..0xbae1  (4 bytes)
DATA_objetos_en_sala_12:
	defb 023h,020h,0a0h	; badd
	defb 0ffh	; bae0

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_13: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbae1..0xbae5  (4 bytes)
DATA_objetos_en_sala_13:
	defb 007h,020h,048h	; bae1
	defb 0ffh	; bae4

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_14: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbae5..0xbae9  (4 bytes)
DATA_objetos_en_sala_14:
	defb 003h,020h,080h	; bae5
	defb 0ffh	; bae8

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_15: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbae9..0xbaed  (4 bytes)
DATA_objetos_en_sala_15:
	defb 005h,020h,088h	; bae9
	defb 0ffh	; baec

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_16: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbaed..0xbaf1  (4 bytes)
DATA_objetos_en_sala_16:
	defb 017h,020h,048h	; baed
	defb 0ffh	; baf0

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_17: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbaf1..0xbaf5  (4 bytes)
DATA_objetos_en_sala_17:
	defb 021h,060h,048h	; baf1
	defb 0ffh	; baf4

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_18: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (7 bytes)
;   0xbaf5..0xbafc  (7 bytes)
DATA_objetos_en_sala_18:
	defb 018h,070h,042h	; baf5
	defb 023h,040h,0a0h	; baf8
	defb 0ffh	; bafb

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_19: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbafc..0xbb00  (4 bytes)
DATA_objetos_en_sala_19:
	defb 00fh,020h,048h	; bafc
	defb 0ffh	; baff

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_20: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb00..0xbb04  (4 bytes)
DATA_objetos_en_sala_20:
	defb 022h,020h,088h	; bb00
	defb 0ffh	; bb03

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_21: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb04..0xbb08  (4 bytes)
DATA_objetos_en_sala_21:
	defb 01eh,040h,060h	; bb04
	defb 0ffh	; bb07

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_22: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb08..0xbb0c  (4 bytes)
DATA_objetos_en_sala_22:
	defb 009h,020h,088h	; bb08
	defb 0ffh	; bb0b

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_23: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb0c..0xbb10  (4 bytes)
DATA_objetos_en_sala_23:
	defb 00ah,020h,048h	; bb0c
	defb 0ffh	; bb0f

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_24: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb10..0xbb14  (4 bytes)
DATA_objetos_en_sala_24:
	defb 005h,060h,060h	; bb10
	defb 0ffh	; bb13

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_25: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb14..0xbb18  (4 bytes)
DATA_objetos_en_sala_25:
	defb 020h,020h,048h	; bb14
	defb 0ffh	; bb17

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_26: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb18..0xbb1c  (4 bytes)
DATA_objetos_en_sala_26:
	defb 010h,020h,048h	; bb18
	defb 0ffh	; bb1b

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_27: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (10 bytes)
;   0xbb1c..0xbb26  (10 bytes)
DATA_objetos_en_sala_27:
	defb 006h,070h,080h	; bb1c
	defb 023h,040h,040h	; bb1f
	defb 020h,020h,048h	; bb22
	defb 0ffh	; bb25

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_28: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb26..0xbb2a  (4 bytes)
DATA_objetos_en_sala_28:
	defb 00bh,020h,048h	; bb26
	defb 0ffh	; bb29

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_29: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (10 bytes)
;   0xbb2a..0xbb34  (10 bytes)
DATA_objetos_en_sala_29:
	defb 023h,030h,070h	; bb2a
	defb 023h,040h,038h	; bb2d
	defb 023h,080h,0b8h	; bb30
	defb 0ffh	; bb33

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_30: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb34..0xbb38  (4 bytes)
DATA_objetos_en_sala_30:
	defb 015h,020h,048h	; bb34
	defb 0ffh	; bb37

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_31: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb38..0xbb3c  (4 bytes)
DATA_objetos_en_sala_31:
	defb 013h,020h,048h	; bb38
	defb 0ffh	; bb3b

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_32: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb3c..0xbb40  (4 bytes)
DATA_objetos_en_sala_32:
	defb 004h,020h,040h	; bb3c
	defb 0ffh	; bb3f

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_33: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (7 bytes)
;   0xbb40..0xbb47  (7 bytes)
DATA_objetos_en_sala_33:
	defb 01ah,020h,048h	; bb40
	defb 023h,080h,0a8h	; bb43
	defb 0ffh	; bb46

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_34: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb47..0xbb4b  (4 bytes)
DATA_objetos_en_sala_34:
	defb 01eh,020h,048h	; bb47
	defb 0ffh	; bb4a

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_35: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb4b..0xbb4f  (4 bytes)
DATA_objetos_en_sala_35:
	defb 01eh,020h,048h	; bb4b
	defb 0ffh	; bb4e

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_36: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb4f..0xbb53  (4 bytes)
DATA_objetos_en_sala_36:
	defb 01bh,020h,048h	; bb4f
	defb 0ffh	; bb52

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_37: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (10 bytes)
;   0xbb53..0xbb5d  (10 bytes)
DATA_objetos_en_sala_37:
	defb 005h,048h,028h	; bb53
	defb 023h,048h,0c0h	; bb56
	defb 01eh,060h,0c0h	; bb59
	defb 0ffh	; bb5c

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_38: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (7 bytes)
;   0xbb5d..0xbb64  (7 bytes)
DATA_objetos_en_sala_38:
	defb 023h,018h,068h	; bb5d
	defb 023h,050h,040h	; bb60
	defb 0ffh	; bb63

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_39: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb64..0xbb68  (4 bytes)
DATA_objetos_en_sala_39:
	defb 012h,020h,088h	; bb64
	defb 0ffh	; bb67

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_40: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb68..0xbb6c  (4 bytes)
DATA_objetos_en_sala_40:
	defb 001h,060h,040h	; bb68
	defb 0ffh	; bb6b

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_41: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb6c..0xbb70  (4 bytes)
DATA_objetos_en_sala_41:
	defb 005h,038h,030h	; bb6c
	defb 0ffh	; bb6f

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_42: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb70..0xbb74  (4 bytes)
DATA_objetos_en_sala_42:
	defb 023h,030h,068h	; bb70
	defb 0ffh	; bb73

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_43: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (7 bytes)
;   0xbb74..0xbb7b  (7 bytes)
DATA_objetos_en_sala_43:
	defb 023h,02ah,040h	; bb74
	defb 005h,070h,0a8h	; bb77
	defb 0ffh	; bb7a

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_44: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb7b..0xbb7f  (4 bytes)
DATA_objetos_en_sala_44:
	defb 023h,050h,018h	; bb7b
	defb 0ffh	; bb7e

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_45: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb7f..0xbb83  (4 bytes)
DATA_objetos_en_sala_45:
	defb 01eh,040h,048h	; bb7f
	defb 0ffh	; bb82

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_46: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (4 bytes)
;   0xbb83..0xbb87  (4 bytes)
DATA_objetos_en_sala_46:
	defb 007h,020h,048h	; bb83
	defb 0ffh	; bb86

; ----------------------------------------------------------------------
; DATOS objetos_en_sala_47: ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea
;   los que aun no se han cogido (0xC520/0xC5A0); lo leen p06:BC07 (7 bytes)
;   0xbb87..0xbb8e  (7 bytes)
DATA_objetos_en_sala_47:
	defb 023h,050h,060h	; bb87
	defb 023h,070h,0a8h	; bb8a
	defb 0ffh	; bb8d

; ======================================================================
; CODIGO 0xbb8e..0xbbd8  (74 bytes)
; ======================================================================


L_BB8E:
	ld hl,0bbd8h		;bb8e
	call 04050h		;bb91
	ld a,(hl)			;bb94
	ld hl,0c5c1h		;bb95
	ld (hl),a			;bb98
	inc hl			;bb99
	ld (hl),e			;bb9a
	inc hl			;bb9b
	ld (hl),d			;bb9c
	inc hl			;bb9d
	ld (hl),0ffh		;bb9e
	ld c,001h		;bba0
	cp 01eh		;bba2
	jr z,L_BBAB		;bba4
	cp 023h		;bba6
	jr z,L_BBAB		;bba8
	dec c			;bbaa
L_BBAB:
	ld a,(0c5c0h)		;bbab
	and a			;bbae
	ret nz			;bbaf
	inc a			;bbb0
	ld (0c5c0h),a		;bbb1
	ld hl,0c5d0h		;bbb4
	ld a,(hl)			;bbb7
	and a			;bbb8
	ret nz			;bbb9
	push bc			;bbba
	ld de,0c5c1h		;bbbb
	call L_BC07		;bbbe
	ld bc,0000ch		;bbc1
	and a			;bbc4
	sbc hl,bc		;bbc5
	pop bc			;bbc7
	ld (hl),c			;bbc8
	ld ix,0c5d0h		;bbc9
	ld bc,00100h		;bbcd
	call L_BC4E		;bbd0
	ld a,025h		;bbd3
	jp 0405ah		;bbd5

; ----------------------------------------------------------------------
; DATOS bbd8: 5 bytes que p06:BB8E lee en 0xBBD8 + A; lo leen p06:BB8E (5
;   bytes)
;   0xbbd8..0xbbdd  (5 bytes)
DATA_bbd8:
	defb 01eh,023h,01ch,01dh,008h	; bbd8

; ======================================================================
; CODIGO 0xbbdd..0xbd8f  (434 bytes)
; ======================================================================


L_BBDD:
	ld hl,0c5d0h		;bbdd
	ld de,0c5d1h		;bbe0
	ld bc,0002fh		;bbe3
	ld (hl),b			;bbe6
	ldir		;bbe7
	ld a,(0c130h)		;bbe9
	cp 0dah		;bbec
	ret nc			;bbee
	cp 07ah		;bbef
	ret c			;bbf1
	sub 07ah		;bbf2
	ld de,0b9efh		;bbf4
	call 04055h		;bbf7
	ld a,(de)			;bbfa
	and a			;bbfb
	ret z			;bbfc
	dec a			;bbfd
	ld de,0ba50h		;bbfe
	call 040beh		;bc01
	ld hl,0c5d0h		;bc04
L_BC07:
	ld a,(de)			;bc07
	inc a			;bc08
	ret z			;bc09
	dec a			;bc0a
	ld b,a			;bc0b
	cp 004h		;bc0c
	jr nz,L_BC15		;bc0e
	ld a,(0c661h)		;bc10
	and a			;bc13
	ret z			;bc14
L_BC15:
	ld a,b			;bc15
	cp 009h		;bc16
	ld bc,0c520h		;bc18
	jr c,L_BC22		;bc1b
	sub 008h		;bc1d
	ld bc,0c5a0h		;bc1f
L_BC22:
	dec a			;bc22
	add a,c			;bc23
	ld c,a			;bc24
	jr nc,L_BC28		;bc25
	inc b			;bc27
L_BC28:
	ld a,(bc)			;bc28
	and a			;bc29
	jr z,L_BC31		;bc2a
	inc de			;bc2c
	inc de			;bc2d
	inc de			;bc2e
	jr L_BC07		;bc2f
L_BC31:
	ld a,(de)			;bc31
	ld (hl),a			;bc32
	inc de			;bc33
	inc hl			;bc34
	inc hl			;bc35
	ld a,(de)			;bc36
	ld (hl),a			;bc37
	inc de			;bc38
	inc hl			;bc39
	ld a,(de)			;bc3a
	ld (hl),a			;bc3b
	inc hl			;bc3c
	inc de			;bc3d
	ld (hl),000h		;bc3e
	ld a,00ch		;bc40
	call 04050h		;bc42
	jr L_BC07		;bc45
L_BC47:
	ld ix,0c5d0h		;bc47
	ld bc,00300h		;bc4b
L_BC4E:
	push bc			;bc4e
	ld a,(ix+000h)		;bc4f
	and a			;bc52
	jr z,L_BCA4		;bc53
	cp 009h		;bc55
	ld hl,0b855h		;bc57
	jr c,L_BC61		;bc5a
	sub 008h		;bc5c
	ld hl,0b8c0h		;bc5e
L_BC61:
	dec a			;bc61
	add a,a			;bc62
	call 04050h		;bc63
	ld a,(hl)			;bc66
	and 001h		;bc67
	ld (ix+001h),a		;bc69
	push hl			;bc6c
	ld a,c			;bc6d
	and a			;bc6e
	ld de,0a0b0h		;bc6f
	jr z,L_BC7B		;bc72
	dec a			;bc74
	ld e,0c0h		;bc75
	jr z,L_BC7B		;bc77
	ld e,0d0h		;bc79
L_BC7B:
	bit 0,(ix+001h)		;bc7b
	ld bc,02010h		;bc7f
	jr z,L_BC85		;bc82
	ld b,c			;bc84
L_BC85:
	ld l,(ix+002h)		;bc85
	ld h,(ix+003h)		;bc88
	ld a,018h		;bc8b
	push bc			;bc8d
	call 040a5h		;bc8e
	pop bc			;bc91
	pop hl			;bc92
	ld a,(hl)			;bc93
	and 0feh		;bc94
	inc hl			;bc96
	ld l,(hl)			;bc97
	ld h,a			;bc98
	ld e,(ix+002h)		;bc99
	ld d,(ix+003h)		;bc9c
	ld a,048h		;bc9f
	call 040a5h		;bca1
L_BCA4:
	pop bc			;bca4
	ld de,00010h		;bca5
	add ix,de		;bca8
	inc c			;bcaa
	djnz L_BC4E		;bcab
	ret			;bcad
L_BCAE:
	call 04195h		;bcae
	ld a,(0c00ch)		;bcb1
	inc a			;bcb4
	and 003h		;bcb5
	ld (0c00ch),a		;bcb7
	ld de,0bd8fh		;bcba
	call 040beh		;bcbd
	ld a,(de)			;bcc0
	ld (0c00ah),a		;bcc1
	inc de			;bcc4
	ld a,(de)			;bcc5
	call 0410eh		;bcc6
	ld (0c00dh),de		;bcc9
	ld a,(0c00ch)		;bccd
	dec a			;bcd0
	jr z,L_BCFD		;bcd1
	dec a			;bcd3
	jr z,L_BCD9		;bcd4
	dec a			;bcd6
	jr z,L_BD04		;bcd7
L_BCD9:
	call 0416dh		;bcd9
	call 04172h		;bcdc
	ld a,085h		;bcdf
	ld (0c138h),a		;bce1
	ld a,010h		;bce4
	ld (0c131h),a		;bce6
	call 0407dh		;bce9
	ld a,010h		;bcec
	ld (0c802h),a		;bcee
	xor a			;bcf1
	ld (0c009h),a		;bcf2
	ld (0c801h),a		;bcf5
	ld (0c153h),a		;bcf8
	jr L_BD39		;bcfb
L_BCFD:
	ld a,005h		;bcfd
	ld (0c130h),a		;bcff
	jr L_BD14		;bd02
L_BD04:
	ld a,01fh		;bd04
	ld (0c130h),a		;bd06
	ld a,001h		;bd09
	ld (0c134h),a		;bd0b
	ld (0c142h),a		;bd0e
	ld (0c500h),a		;bd11
L_BD14:
	call 04159h		;bd14
	ld a,(0f0f7h)		;bd17
	and a			;bd1a
	jr nz,L_BD25		;bd1b
	ld a,02ch		;bd1d
	ld (0c159h),a		;bd1f
	call 04140h		;bd22
L_BD25:
	ld a,(0c00ch)		;bd25
	cp 002h		;bd28
	ld de,01070h		;bd2a
	jr c,L_BD32		;bd2d
	ld de,07028h		;bd2f
L_BD32:
	ld hl,0c182h		;bd32
	ld (hl),e			;bd35
	inc hl			;bd36
	inc hl			;bd37
	ld (hl),d			;bd38
L_BD39:
	ld a,001h		;bd39
	ld (0c123h),a		;bd3b
	ret			;bd3e
L_BD3F:
	ld a,(0c00ch)		;bd3f
	rra			;bd42
	jp c,0415eh		;bd43
	ld a,(0c009h)		;bd46
	dec a			;bd49
	jr z,L_BD5F		;bd4a
	dec a			;bd4c
	jr z,L_BD6C		;bd4d
	call 04082h		;bd4f
	ld a,(0c153h)		;bd52
	dec a			;bd55
	ret nz			;bd56
	call L_BD68		;bd57
	ld a,024h		;bd5a
	jp 04127h		;bd5c
L_BD5F:
	call 0414ah		;bd5f
	ld a,(0c151h)		;bd62
	cp 004h		;bd65
	ret nz			;bd67
L_BD68:
	ld hl,0c009h		;bd68
	inc (hl)			;bd6b
L_BD6C:
	ret			;bd6c
L_BD6D:
	ld hl,0c00ah		;bd6d
	dec (hl)			;bd70
	jr nz,L_BD83		;bd71
	ld hl,(0c00dh)		;bd73
	inc hl			;bd76
	ld a,(hl)			;bd77
	cp 0ffh		;bd78
	jr z,L_BD8A		;bd7a
	ld (0c00ah),a		;bd7c
	inc hl			;bd7f
	ld (0c00dh),hl		;bd80
L_BD83:
	ld hl,(0c00dh)		;bd83
	ld a,(hl)			;bd86
	jp 0410eh		;bd87
L_BD8A:
	xor a			;bd8a
	ld (0c123h),a		;bd8b
	ret			;bd8e

; ----------------------------------------------------------------------
; DATOS indice_de_la_demo: 4 punteros (0xC00C) a los guiones de la demo
;   (p06:BCBA); lo leen p06:BCBA (8 bytes)
;   0xbd8f..0xbd97  (8 bytes)
DATA_indice_de_la_demo:
	defw 0bdcah,0bd97h,0bdcah,0bdd5h	; bd8f  -> DATA_guion_de_la_demo_BDCA DATA_guion_de_la_demo_BD97 DATA_guion_de_la_demo_BDCA DATA_guion_de_la_demo_BDD5

; ----------------------------------------------------------------------
; DATOS guion_de_la_demo_BD97: un guion de la demo: [sala][teclas] y parejas
;   [cuadros][teclas] que p06:BCC0 va mandando como si las pulsara alguien; lo
;   leen p06:BCC0 (51 bytes)
;   0xbd97..0xbdca  (51 bytes)
DATA_guion_de_la_demo_BD97:
	defb 023h,008h	; bd97
	defb 004h,000h	; bd99
	defb 002h,002h	; bd9b
	defb 0a8h,000h	; bd9d
	defb 00bh,002h	; bd9f
	defb 00ch,008h	; bda1
	defb 005h,001h	; bda3
	defb 010h,000h	; bda5
	defb 00eh,004h	; bda7
	defb 006h,001h	; bda9
	defb 014h,004h	; bdab
	defb 042h,000h	; bdad
	defb 028h,008h	; bdaf
	defb 00ah,000h	; bdb1
	defb 049h,004h	; bdb3
	defb 009h,002h	; bdb5
	defb 04eh,000h	; bdb7
	defb 002h,020h	; bdb9
	defb 00ah,000h	; bdbb
	defb 003h,020h	; bdbd
	defb 00ah,000h	; bdbf
	defb 010h,020h	; bdc1
	defb 006h,002h	; bdc3
	defb 049h,004h	; bdc5
	defb 042h,001h	; bdc7
	defb 0ffh	; bdc9

; ----------------------------------------------------------------------
; DATOS guion_de_la_demo_BDCA: un guion de la demo: [sala][teclas] y parejas
;   [cuadros][teclas] que p06:BCC0 va mandando como si las pulsara alguien; lo
;   leen p06:BCC0 (11 bytes)
;   0xbdca..0xbdd5  (11 bytes)
DATA_guion_de_la_demo_BDCA:
	defb 000h,000h	; bdca
	defb 000h,000h	; bdcc
	defb 000h,000h	; bdce
	defb 000h,000h	; bdd0
	defb 080h,000h	; bdd2
	defb 0ffh	; bdd4

; ----------------------------------------------------------------------
; DATOS guion_de_la_demo_BDD5: un guion de la demo: [sala][teclas] y parejas
;   [cuadros][teclas] que p06:BCC0 va mandando como si las pulsara alguien; lo
;   leen p06:BCC0 (35 bytes)
;   0xbdd5..0xbdf8  (35 bytes)
DATA_guion_de_la_demo_BDD5:
	defb 01fh,000h	; bdd5
	defb 03ah,002h	; bdd7
	defb 00dh,008h	; bdd9
	defb 010h,004h	; bddb
	defb 05eh,002h	; bddd
	defb 01ah,004h	; bddf
	defb 010h,001h	; bde1
	defb 016h,004h	; bde3
	defb 01ch,001h	; bde5
	defb 01eh,000h	; bde7
	defb 005h,002h	; bde9
	defb 018h,012h	; bdeb
	defb 012h,004h	; bded
	defb 002h,008h	; bdef
	defb 004h,008h	; bdf1
	defb 001h,010h	; bdf3
	defb 009h,008h	; bdf5
	defb 0ffh	; bdf7

; ======================================================================
; CODIGO 0xbdf8..0xbe51  (89 bytes)
; ======================================================================


L_BDF8:
	ld a,(0c623h)		;bdf8
	and a			;bdfb
	ret nz			;bdfc
	ld hl,0be64h		;bdfd
	ld a,(0c130h)		;be00
	ld d,a			;be03
	ld a,(0c136h)		;be04
	ld e,a			;be07
	ld b,01fh		;be08
L_BE0A:
	ld a,(hl)			;be0a
	inc hl			;be0b
	cp d			;be0c
	jr nz,L_BE13		;be0d
	ld a,(hl)			;be0f
	cp e			;be10
	jr z,L_BE20		;be11
L_BE13:
	inc hl			;be13
	djnz L_BE0A		;be14
	ret			;be16
L_BE17:
	xor a			;be17
	call L_BE22		;be18
	xor a			;be1b
	ld (0c199h),a		;be1c
	ret			;be1f
L_BE20:
	ld a,001h		;be20
L_BE22:
	ld ix,0ec00h		;be22
	ld (ix+000h),a		;be26
	ld de,0ca00h		;be29
	ld hl,0be51h		;be2c
L_BE2F:
	ld c,(hl)			;be2f
	inc c			;be30
	ret z			;be31
	dec c			;be32
	inc hl			;be33
	ld b,(hl)			;be34
	inc hl			;be35
	ld a,(hl)			;be36
	inc hl			;be37
	push hl			;be38
	ld l,c			;be39
	ld h,b			;be3a
	ld c,a			;be3b
	ld b,000h		;be3c
	bit 0,(ix+000h)		;be3e
	jr nz,L_BE45		;be42
	ex de,hl			;be44
L_BE45:
	ldir		;be45
	bit 0,(ix+000h)		;be47
	jr nz,L_BE4E		;be4b
	ex de,hl			;be4d
L_BE4E:
	pop hl			;be4e
	jr L_BE2F		;be4f

; ----------------------------------------------------------------------
; DATOS puntos_de_control: 6 ternas y 0xFF que p06:BE2F recorre al cargar o al
;   empezar (lo que se pone en 0xCA00 + c); lo leen p06:BE2F (19 bytes)
;   0xbe51..0xbe64  (19 bytes)
DATA_puntos_de_control:
	defb 030h,0c1h,020h	; be51
	defb 080h,0c1h,020h	; be54
	defb 080h,0c3h,050h	; be57
	defb 050h,0c4h,0d8h	; be5a
	defb 030h,0c5h,090h	; be5d
	defb 000h,0c6h,0a0h	; be60
	defb 0ffh	; be63

; ----------------------------------------------------------------------
; DATOS salas_de_punto_de_control: 31 parejas [sala][sala siguiente] que
;   p06:BE0A compara con 0xC130 y 0xC136; lo leen p06:BE0A (62 bytes)
;   0xbe64..0xbea2  (62 bytes)
DATA_salas_de_punto_de_control:
	defb 079h,079h	; be64
	defb 079h,000h	; be66
	defb 0f0h,003h	; be68
	defb 0f0h,01fh	; be6a
	defb 0f2h,027h	; be6c
	defb 0f1h,00fh	; be6e
	defb 0f1h,01bh	; be70
	defb 0f2h,035h	; be72
	defb 0f1h,03fh	; be74
	defb 0f3h,048h	; be76
	defb 0f5h,0ceh	; be78
	defb 0f3h,05fh	; be7a
	defb 0f5h,0cfh	; be7c
	defb 0f4h,058h	; be7e
	defb 0f6h,09ah	; be80
	defb 0f3h,051h	; be82
	defb 0f5h,0cdh	; be84
	defb 0f7h,06dh	; be86
	defb 0fah,073h	; be88
	defb 0a5h,008h	; be8a
	defb 00ah,0cch	; be8c
	defb 040h,00bh	; be8e
	defb 049h,045h	; be90
	defb 07dh,05dh	; be92
	defb 038h,07bh	; be94
	defb 066h,04bh	; be96
	defb 06ch,068h	; be98
	defb 069h,04eh	; be9a
	defb 06eh,06bh	; be9c
	defb 076h,074h	; be9e
	defb 07bh,038h	; bea0

; ======================================================================
; CODIGO 0xbea2..0xbef1  (79 bytes)
; ======================================================================


L_BEA2:
	call L_BEA8		;bea2
	jp L_BEC6		;bea5
L_BEA8:
	ld b,009h		;bea8
	ld hl,0e515h		;beaa
	ld de,0e50ch		;bead
L_BEB0:
	push bc			;beb0
	push hl			;beb1
	push de			;beb2
	ld a,b			;beb3
	dec a			;beb4
	call 00141h		;beb5   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;beb8
	pop de			;beb9
	pop hl			;beba
	ld c,(hl)			;bebb
	ld (hl),a			;bebc
	xor c			;bebd
	and (hl)			;bebe
	ld (de),a			;bebf
	inc hl			;bec0
	inc de			;bec1
	pop bc			;bec2
	djnz L_BEB0		;bec3
	ret			;bec5
L_BEC6:
	ld hl,0e50ch		;bec6
	ld b,009h		;bec9
L_BECB:
	ld a,(hl)			;becb
	and a			;becc
	jr nz,L_BED3		;becd
	inc hl			;becf
	djnz L_BECB		;bed0
	ret			;bed2
L_BED3:
	dec b			;bed3
	ld e,b			;bed4
	ld bc,00800h		;bed5
L_BED8:
	rlca			;bed8
	jr c,L_BEDF		;bed9
	inc c			;bedb
	djnz L_BED8		;bedc
	ret			;bede
L_BEDF:
	ld a,e			;bedf
	add a,a			;bee0
	add a,a			;bee1
	add a,a			;bee2
	add a,c			;bee3
	ld de,0e500h		;bee4
	ld hl,0e501h		;bee7
	ld bc,0000bh		;beea
	ldir		;beed
	ld (de),a			;beef
	ret			;bef0

; ----------------------------------------------------------------------
; DATOS clave_BEF1: una contrasena: caracteres hasta 0xFF que p06:BF2F compara
;   con lo tecleado (0xE50B hacia abajo, p06:BF22); lo leen p06:BF2F (5 bytes)
;   0xbef1..0xbef6  (5 bytes)
DATA_clave_BEF1:
	defb 003h,047h,02fh,01eh,0ffh	; bef1

; ----------------------------------------------------------------------
; DATOS clave_BEF6: una contrasena: caracteres hasta 0xFF que p06:BF3A compara
;   con lo tecleado (0xE50B hacia abajo, p06:BF22); lo leen p06:BF3A (13
;   bytes)
;   0xbef6..0xbf03  (13 bytes)
DATA_clave_BEF6:
	defb 019h,011h,020h,01dh,047h,011h,02bh,047h,011h,02eh,024h,011h,0ffh	; bef6  .. .G.+G..$..

; ----------------------------------------------------------------------
; DATOS clave_BF03: una contrasena: caracteres hasta 0xFF que p06:BF43 compara
;   con lo tecleado (0xE50B hacia abajo, p06:BF22); lo leen p06:BF43 (9 bytes)
;   0xbf03..0xbf0c  (9 bytes)
DATA_clave_BF03:
	defb 020h,01dh,01eh,02dh,020h,02eh,024h,019h,0ffh	; bf03   ..- .$..

; ----------------------------------------------------------------------
; DATOS clave_BF0C: una contrasena: caracteres hasta 0xFF que p06:BF4C compara
;   con lo tecleado (0xE50B hacia abajo, p06:BF22); lo leen p06:BF4C (10
;   bytes)
;   0xbf0c..0xbf16  (10 bytes)
DATA_clave_BF0C:
	defb 024h,023h,019h,02eh,011h,026h,023h,02fh,019h,0ffh	; bf0c  $#...&#/..

; ----------------------------------------------------------------------
; DATOS clave_BF16: una contrasena: caracteres hasta 0xFF que p06:BF55 compara
;   con lo tecleado (0xE50B hacia abajo, p06:BF22); lo leen p06:BF55 (12
;   bytes)
;   0xbf16..0xbf22  (12 bytes)
DATA_clave_BF16:
	defb 011h,025h,023h,01bh,047h,01dh,027h,011h,020h,019h,01ah,0ffh	; bf16  .%#.G.'. ...

; ======================================================================
; CODIGO 0xbf22..0xbfcc  (170 bytes)
; ======================================================================


L_BF22:
	ld hl,0e50bh		;bf22
L_BF25:
	ld a,(de)			;bf25
	cp 0ffh		;bf26
	ret z			;bf28
	cp (hl)			;bf29
	ret nz			;bf2a
	dec hl			;bf2b
	inc de			;bf2c
	jr L_BF25		;bf2d
L_BF2F:
	ld de,0bef1h		;bf2f
	call L_BF22		;bf32
	ld c,000h		;bf35
	jr z,L_BF5C		;bf37
	inc c			;bf39
	ld de,0bef6h		;bf3a
	call L_BF22		;bf3d
	jr z,L_BF5C		;bf40
	inc c			;bf42
	ld de,0bf03h		;bf43
	call L_BF22		;bf46
	jr z,L_BF5C		;bf49
	inc c			;bf4b
	ld de,0bf0ch		;bf4c
	call L_BF22		;bf4f
	jr z,L_BF5C		;bf52
	inc c			;bf54
	ld de,0bf16h		;bf55
	call L_BF22		;bf58
	ret nz			;bf5b
L_BF5C:
	ld b,c			;bf5c
	djnz L_BF68		;bf5d
	call 040d7h		;bf5f
	call 040d7h		;bf62
L_BF65:
	jp 040d7h		;bf65
L_BF68:
	djnz L_BF81		;bf68
	ld a,(0c141h)		;bf6a
	set 0,a		;bf6d
	ld (0c141h),a		;bf6f
	ld hl,0c380h		;bf72
	ld de,00999h		;bf75
	ld b,008h		;bf78
L_BF7A:
	ld (hl),e			;bf7a
	inc hl			;bf7b
	ld (hl),d			;bf7c
	inc hl			;bf7d
	djnz L_BF7A		;bf7e
	ret			;bf80
L_BF81:
	djnz L_BF92		;bf81
	ld a,(0c141h)		;bf83
	set 1,a		;bf86
	ld (0c141h),a		;bf88
	ld hl,00999h		;bf8b
	ld (0c3bah),hl		;bf8e
	ret			;bf91
L_BF92:
	djnz L_BF65		;bf92
	ld a,00eh		;bf94
	ld b,008h		;bf96
L_BF98:
	push bc			;bf98
	push af			;bf99
	ld e,a			;bf9a
	push de			;bf9b
	call 040d2h		;bf9c
	pop de			;bf9f
	call c,L_BFAD		;bfa0
	pop af			;bfa3
	inc a			;bfa4
	pop bc			;bfa5
	djnz L_BF98		;bfa6
	xor a			;bfa8
	ld (0c45bh),a		;bfa9
	ret			;bfac
L_BFAD:
	ld hl,0c530h		;bfad
L_BFB0:
	ld a,(hl)			;bfb0
	and a			;bfb1
	jr z,L_BFBB		;bfb2
	ld a,004h		;bfb4
	call 04050h		;bfb6
	jr L_BFB0		;bfb9
L_BFBB:
	ld (hl),e			;bfbb
	ld a,e			;bfbc
	inc hl			;bfbd
	add a,023h		;bfbe
	ld (hl),a			;bfc0
	ld a,e			;bfc1
	ld hl,0c5a0h		;bfc2
	dec a			;bfc5
	call 04050h		;bfc6
	ld (hl),001h		;bfc9
	ret			;bfcb

; ----------------------------------------------------------------------
; DATOS relleno_ff: 52 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (52 bytes)
;   0xbfcc..0xc000  (52 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfcc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfdc  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfec  ................
	defb 0ffh,0ffh,0ffh,0ffh	; bffc
