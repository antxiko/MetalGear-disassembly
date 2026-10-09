; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 03 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
la90eh:	equ 0x0a90e

; ----------------------------------------------------------------------
; DATOS tercer_byte_del_jp_de_p02_9FFE: el byte alto (5B) del `jp 0x5BA6` que
;   empieza en p02:9FFE: la instruccion cruza del banco 2 a este. El codigo de
;   la camara sigue en 0xA001 (llega por el `jr c` de p02:9FF3)
;   0xa000..0xa001  (1 bytes)
DATA_tercer_byte_del_jp_de_p02_9FFE:
	defb 05bh	; a000

; ======================================================================
; CODIGO 0xa001..0xa045  (68 bytes)
; ======================================================================


L_A001:
	ld a,(ix+01ch)		;a001
	or a			;a004
	jr nz,L_A029		;a005
	ld a,(ix+00fh)		;a007   ; lee el numero del actor entre los de su tipo
	ld hl,0a043h		;a00a
	call 041dfh		;a00d   ; hl_mas_2a: HL = HL + 2 x A
	ld a,(ix+005h)		;a010   ; lee la X del actor
	cp (hl)			;a013
	ld c,001h		;a014
	jr z,L_A020		;a016
	inc hl			;a018
	cp (hl)			;a019
	ld c,0ffh		;a01a
	jr z,L_A020		;a01c
	jr L_A029		;a01e
L_A020:
	ld (ix+01ch),c		;a020
L_A023:
	ld de,00000h		;a023
	jp 05b5dh		;a026   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
L_A029:
	ld a,(0c184h)		;a029   ; lee la X de Snake
	ld c,(ix+005h)		;a02c   ; lee la X del actor
	cp c			;a02f
	jr z,L_A023		;a030
	ld a,(ix+016h)		;a032
	cp c			;a035
	ld de,0ff00h		;a036
	jr c,L_A03E		;a039
	ld de,00100h		;a03b
L_A03E:
	ld (ix+01ch),000h		;a03e
	jp 05b5dh		;a042   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE

; ----------------------------------------------------------------------
; DATOS limites_a045: 4 bytes (0x10, 0x58, 0xC0, 0xF0): p03:A00A lee 0xA043 +
;   2 x (ix+0x0F) y compara (ix+5) con el byte
;   0xa045..0xa049  (4 bytes)
DATA_limites_a045:
	defb 010h,058h,0c0h,0f0h	; a045

; ======================================================================
; CODIGO 0xa049..0xa078  (47 bytes)
; ======================================================================


L_A049:
	ret			;a049
crea_tipo_54:		; la creacion del tipo 54
	ld a,(0c130h)		;a04a   ; lee la sala
	cp 06fh		;a04d   ; en la sala 0x6F...
	jr nz,L_A061		;a04f
	push ix		;a051   ; ...3 sprites...
	pop hl			;a053
	set 5,l		;a054
	ld (hl),003h		;a056
	ld b,007h		;a058   ; ...y los 7 huecos de sprite de antes se devuelven
	ld de,00010h		;a05a
	add hl,de			;a05d
	call 05703h		;a05e
L_A061:
	ld (ix+00bh),061h		;a061   ; el cuadro del actor = 0x61
	ld (ix+058h),00bh		;a065   ; (ix+0x58) = 0x0B: los sprites que faltan
	ld (ix+059h),001h		;a069   ; (ix+0x59) = 1: la cuenta
	ld a,004h		;a06d   ; el sonido 4
	jp 0427ch		;a06f   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
cuadro_tipo_54:		; lo de cada cuadro del tipo 54
	ld a,(ix+001h)		;a072   ; lee el paso del actor
	call 041eah		;a075   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_A078: 3 destinos del despachador p00:41EA (call en p03:A075, el
;   indice en A): A07E, A0AD, A0D5; lo leen p03:A075 (6 bytes)
;   0xa078..0xa07e  (6 bytes)
DATA_tabla_A078:
	defw 0a07eh,0a0adh,0a0d5h	; a078  -> L_A07E L_A0AD L_A0D5

; ======================================================================
; CODIGO 0xa07e..0xa252  (468 bytes)
; ======================================================================


L_A07E:
	dec (ix+059h)		;a07e   ; paso 0: cada (ix+0x59) cuadros...
	ret nz			;a081
	ld (ix+059h),001h		;a082
	dec (ix+058h)		;a086   ; ...un sprite mas se enciende
	jr nz,color_del_sprite_b		;a089
	ld (ix+058h),00bh		;a08b   ; al acabar, al paso 1
	ld (ix+059h),001h		;a08f
	jp 05ba2h		;a093   ; paso_siguiente: sube el paso del actor (ix+1)
color_del_sprite_b:		; el sprite 11 - (ix+0x58) del actor toma el color C
	ld a,00bh		;a096   ; el sprite 11 - (ix+0x58)...
	sub (ix+058h)		;a098
	ld b,a			;a09b
	ld c,008h		;a09c   ; ...en el color 8
L_A09E:
	push ix		;a09e   ; HL = la ficha + 0x20
	pop hl			;a0a0
	ld de,00020h		;a0a1
	add hl,de			;a0a4
	ld de,00005h		;a0a5
L_A0A8:
	add hl,de			;a0a8   ; + 5 x B: el color del sprite B
	djnz L_A0A8		;a0a9
	ld (hl),c			;a0ab   ; = C
	ret			;a0ac
L_A0AD:
	ld a,(ix+059h)		;a0ad   ; paso 1: el color 14 o 8 cada 4 cuadros
	rra			;a0b0
	rra			;a0b1
	ld c,00eh		;a0b2
	jr c,L_A0B8		;a0b4
	ld c,008h		;a0b6
L_A0B8:
	call color_del_sprite_b		;a0b8   ; color_del_sprite_b: el sprite 11 - (ix+0x58) del actor toma el color C
	dec (ix+059h)		;a0bb   ; cada (ix+0x59) cuadros...
	ret nz			;a0be
	ld (ix+059h),001h		;a0bf
	dec (ix+058h)		;a0c3   ; ...un sprite se apaga
	jr nz,L_A0CB		;a0c6
	jp 07371h		;a0c8   ; al acabar, se quita
L_A0CB:
	ld a,00bh		;a0cb   ; el sprite 11 - (ix+0x58)...
	sub (ix+058h)		;a0cd
	ld b,a			;a0d0
	ld c,000h		;a0d1   ; ...en el color 0
	jr L_A09E		;a0d3
L_A0D5:
	ret			;a0d5   ; paso 2: nada
crea_tipo_64:		; la creacion del tipo 64
	ld a,r		;a0d6
	ld (ix+00ch),a		;a0d8   ; guarda la cuenta de cuadros del actor
	ld (ix+00eh),000h		;a0db   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld (ix+058h),0e0h		;a0df
	ld (ix+00bh),03ah		;a0e3   ; el cuadro del actor = 0x3A
	ret			;a0e7
cuadro_tipo_64:		; lo de cada cuadro del tipo 64
	ld a,(0c602h)		;a0e8   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;a0eb
	jr nz,L_A109		;a0ec
	ld a,(ix-080h)		;a0ee
	or a			;a0f1
	jr z,L_A109		;a0f2
	ld bc,00f3ah		;a0f4
	call 05b78h		;a0f7   ; cuadro_de_paso: si (ix+0x0C) AND B es 0, cuadro = 3 x direccion + paso (0x5B9E) + C
	ld a,(0c130h)		;a0fa   ; lee la sala
	cp 08ch		;a0fd
	ret z			;a0ff
	dec (ix+058h)		;a100
	ret nz			;a103
	ld a,(0c633h)		;a104
	or a			;a107
	ret nz			;a108
L_A109:
	jp 07371h		;a109
L_A10C:
	ld a,d			;a10c
	ld c,0b0h		;a10d
	cp 001h		;a10f
	jr z,L_A115		;a111
	ld c,018h		;a113
L_A115:
	ld a,(ix+003h)		;a115   ; lee la Y del actor
	cp c			;a118
	ret nz			;a119
L_A11A:
	ld (ix+045h),001h		;a11a
	ld (ix+00eh),000h		;a11e   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld (ix+020h),000h		;a122   ; cuantos sprites tiene el actor = 0x00
	jp 05bc1h		;a126   ; colores_a_cero: escribe A y C alternos cada 5 bytes desde (ix+0x25)
L_A129:
	ld a,e			;a129
	cp 089h		;a12a
	ld a,(ix+005h)		;a12c   ; lee la X del actor
	ld c,088h		;a12f
	ret nz			;a131
	jr L_A159		;a132
L_A134:
	ld a,d			;a134
	ld c,010h		;a135
	cp 004h		;a137
	ld a,(ix+005h)		;a139   ; lee la X del actor
	ret nz			;a13c
	jr L_A159		;a13d
L_A13F:
	ld a,d			;a13f
	ld c,030h		;a140
	cp 001h		;a142
	ld a,(ix+003h)		;a144   ; lee la Y del actor
	jr nz,L_A159		;a147
	jr L_A155		;a149
L_A14B:
	ld a,d			;a14b
	ld c,013h		;a14c
	cp 001h		;a14e
	ld a,(ix+003h)		;a150   ; lee la Y del actor
	jr nz,L_A159		;a153
L_A155:
	cp c			;a155
	ret z			;a156
	jr L_A11A		;a157
L_A159:
	cp c			;a159
	ret nz			;a15a
	jr L_A11A		;a15b
L_A15D:
	ld a,08dh		;a15d
	ld c,078h		;a15f
	cp e			;a161
	ld a,(ix+003h)		;a162   ; lee la Y del actor
	jr z,L_A159		;a165
	dec d			;a167
	ret nz			;a168
	ld c,0a8h		;a169
	jr L_A159		;a16b
L_A16D:
	ld a,e			;a16d
	ld c,020h		;a16e
	cp 014h		;a170
	ld a,(ix+005h)		;a172   ; lee la X del actor
	jr z,L_A159		;a175
	ld c,0f0h		;a177
	jr L_A159		;a179
L_A17B:
	ld a,09ch		;a17b
	cp e			;a17d
	ld a,(ix+003h)		;a17e   ; lee la Y del actor
	ld c,028h		;a181
	jr z,L_A159		;a183
	ld a,021h		;a185
	cp e			;a187
	ld c,018h		;a188
	ld a,(ix+005h)		;a18a   ; lee la X del actor
	ret nz			;a18d
	jr L_A159		;a18e
L_A190:
	ld a,(0c136h)		;a190   ; lee la parada del ascensor
	cp 0f2h		;a193
	ld a,(ix+003h)		;a195   ; lee la Y del actor
	ld c,048h		;a198
	jr z,L_A159		;a19a
	ld c,0b0h		;a19c
	jr L_A159		;a19e
L_A1A0:
	ld (ix+001h),002h		;a1a0   ; el paso del actor = 0x02
	ld (ix+006h),000h		;a1a4   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+00eh),000h		;a1a8   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	call 05bc1h		;a1ac   ; colores_a_cero: escribe A y C alternos cada 5 bytes desde (ix+0x25)
dibujo_de_camara:		; copia 16 x 16 de (0x20 + 16 x (ix+0x1B), 0x80) de la pagina 1 a la Y/X del actor con TIMP
	ld a,(ix+01bh)		;a1af
	sla a		;a1b2
	sla a		;a1b4
	sla a		;a1b6
	sla a		;a1b8
	add a,020h		;a1ba
	ld h,a			;a1bc
	ld l,080h		;a1bd
	ld a,(ix+003h)		;a1bf   ; lee la Y del actor
	sub 008h		;a1c2
	ld e,a			;a1c4
	ld a,(ix+005h)		;a1c5   ; lee la X del actor
	sub 008h		;a1c8
	ld d,a			;a1ca
	ld bc,01010h		;a1cb
	ld a,048h		;a1ce
	jp 05011h		;a1d0   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
camaras_con_c632:		; con 0xC632, el dibujo de cada camara (tipo 6)
	ld a,(0c632h)		;a1d3
	or a			;a1d6
	ret z			;a1d7
	ld hl,0d000h		;a1d8   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;a1db
L_A1DD:
	ld a,006h		;a1dd
	cp (hl)			;a1df
	call z,dibujo_de_camara_hl		;a1e0   ; dibujo_de_camara_hl: dibujo_de_camara del actor HL
	ld de,00080h		;a1e3
	add hl,de			;a1e6
	djnz L_A1DD		;a1e7
	ret			;a1e9
dibujo_de_camara_hl:		; dibujo_de_camara del actor HL
	push hl			;a1ea
	push bc			;a1eb
	push hl			;a1ec
	pop ix		;a1ed
	call dibujo_de_camara		;a1ef   ; dibujo_de_camara: copia 16 x 16 de (0x20 + 16 x (ix+0x1B), 0x80) de la pagina 1 a la Y/X del actor con TIMP
	pop bc			;a1f2
	pop hl			;a1f3
	ret			;a1f4
crea_tipo_44:		; la creacion del tipo 44
	ld (ix+013h),004h		;a1f5
	ld a,001h		;a1f9
	ld (ix+014h),a		;a1fb
	ld (0c616h),a		;a1fe
	ret			;a201
cuadro_tipo_44:		; lo de cada cuadro del tipo 44
	ld a,(ix+00ch)		;a202   ; lee la cuenta de cuadros del actor
	and 003h		;a205
	ret nz			;a207
	ld a,(ix+013h)		;a208
	add a,(ix+014h)		;a20b
	ld (ix+013h),a		;a20e
	cp 007h		;a211
	call nc,rebota_color		;a213   ; rebota_color: da la vuelta al recorrido de colores del tipo 44
	ld a,(ix+013h)		;a216
	ld d,a			;a219
	rlca			;a21a
	rlca			;a21b
	rlca			;a21c
	rlca			;a21d
	or d			;a21e
	ld e,d			;a21f
	ld d,a			;a220
	ld a,(0c130h)		;a221   ; lee la sala
	ld b,005h		;a224
	cp 074h		;a226
	jr z,L_A230		;a228
	cp 028h		;a22a
	jr z,L_A230		;a22c
	ld b,009h		;a22e
L_A230:
	ld a,b			;a230
	jp 04e66h		;a231   ; color: el color A de la paleta = DE ([RB][G]), y su copia en 0xF680
rebota_color:		; da la vuelta al recorrido de colores del tipo 44
	inc a			;a234   ; al pasar de 7...
	ld b,006h		;a235   ; ...vuelve al 6...
	jr nz,L_A23B		;a237
	ld b,001h		;a239   ; ...o, al pasar de 0, al 1
L_A23B:
	ld (ix+013h),b		;a23b
	ld a,(ix+014h)		;a23e   ; y el sentido cambia
	ld b,0ffh		;a241
	dec a			;a243
	jr z,L_A248		;a244
	ld b,001h		;a246
L_A248:
	ld (ix+014h),b		;a248
	ret			;a24b
cuadro_tipo_36:		; lo de cada cuadro del tipo 36
	ld a,(ix+001h)		;a24c   ; lee el paso del actor
	call 041eah		;a24f   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_A252: 6 destinos del despachador p00:41EA (call en p03:A24F, el
;   indice en A): A25E, A26A, A2B4, A327, A351, A439; lo leen p03:A24F (12
;   bytes)
;   0xa252..0xa25e  (12 bytes)
DATA_tabla_A252:
	defw 0a25eh,0a26ah,0a2b4h,0a327h,0a351h,0a439h	; a252

; ======================================================================
; CODIGO 0xa25e..0xa5e4  (902 bytes)
; ======================================================================


L_A25E:
	dec (ix+073h)		;a25e
	ret nz			;a261
	inc (ix+001h)		;a262   ; sube el paso del actor
	ld a,06ch		;a265
	jp 05cddh		;a267   ; ventana_de_texto_1: abre la ventana del texto A en el modo 1 (0xCEE0)
L_A26A:
	ld hl,0d000h		;a26a   ; busca los actores del tipo 0x25 (las llamas)
	ld de,00080h		;a26d
	ld bc,01000h		;a270
	ld a,025h		;a273   ; el tipo 0x25
L_A275:
	cp (hl)			;a275   ; uno mas, y su ficha a la pila
	jr nz,L_A27A		;a276
	inc c			;a278
	push hl			;a279
L_A27A:
	add hl,de			;a27a   ; la ficha siguiente
	djnz L_A275		;a27b
	ld a,c			;a27d   ; ninguna: nada
	or a			;a27e
	jr z,L_A292		;a27f
	push ix		;a281   ; (ix+0x3F) = cuantas...
	pop hl			;a283
	ld a,03fh		;a284
	or l			;a286
	ld l,a			;a287
	ld b,c			;a288
	ld (hl),b			;a289
	inc l			;a28a   ; ...y sus fichas detras
L_A28B:
	pop de			;a28b   ; una ficha de la pila
	ld (hl),e			;a28c
	inc l			;a28d
	ld (hl),d			;a28e
	inc l			;a28f
	djnz L_A28B		;a290
L_A292:
	call hacia_snake_de_lado		;a292   ; hacia_snake_de_lado: velocidad X de 2 hacia Snake y cuadro 0x2C/0x28
	jp L_A323		;a295   ; al paso siguiente
hacia_snake_de_lado:		; velocidad X de 2 hacia Snake y cuadro 0x2C/0x28
	ld (ix+006h),001h		;a298   ; si el actor se mueve (p01:7336) = 0x01
	ld a,(0c184h)		;a29c   ; lee la X de Snake
	cp (ix+005h)		;a29f   ; compara con la X del actor
	ld b,02ch		;a2a2   ; Snake a la derecha: cuadro 0x2C y X + 2
	ld de,00200h		;a2a4
	jr nc,L_A2AE		;a2a7
	ld b,028h		;a2a9   ; a la izquierda: cuadro 0x28 y X - 2
	ld de,0fe00h		;a2ab
L_A2AE:
	ld (ix+00bh),b		;a2ae   ; guarda el cuadro del actor
	jp 05b5dh		;a2b1   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
L_A2B4:
	ld b,003h		;a2b4   ; paso 2: alterna el cuadro cada 4
	call 05b6ah		;a2b6   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	ld a,(ix+005h)		;a2b9   ; lee la X del actor
	ld b,080h		;a2bc   ; hasta la X 0x80...
	cp b			;a2be
	jr nc,L_A2C5		;a2bf
	ld b,060h		;a2c1   ; ...o la 0x60
	cp b			;a2c3
	ret nc			;a2c4
L_A2C5:
	ld (ix+005h),b		;a2c5   ; queda justo ahi
	ld e,(ix+003h)		;a2c8   ; lee la Y del actor
	ld (ix+017h),e		;a2cb   ; (ix+0x17) = su Y, (ix+0x19) = su X
	ld (ix+019h),b		;a2ce
	ld (ix+00bh),02fh		;a2d1   ; el cuadro del actor = 0x2F
	ld a,e			;a2d5   ; las llamas, 0x0B por debajo...
	add a,00bh		;a2d6
	ld c,b			;a2d8   ; ...y en su X
	ld b,(ix+03fh)		;a2d9
	ld hl,0d083h		;a2dc   ; +3 y +5 de los actores 1, 2... (0xD083, de 0x80 en 0x80)
	ld de,0007eh		;a2df
L_A2E2:
	ld (hl),a			;a2e2
	inc l			;a2e3
	inc l			;a2e4
	ld (hl),c			;a2e5
	add hl,de			;a2e6
	djnz L_A2E2		;a2e7
	ld de,00000h		;a2e9   ; quieto
	ld h,d			;a2ec
	ld l,e			;a2ed
	call 05b64h		;a2ee   ; velocidades: la velocidad X del actor = DE y la Y = HL
	ld c,03eh		;a2f1   ; cada llama de la lista:
	ld b,(ix+03fh)		;a2f3
	push ix		;a2f6
	pop hl			;a2f8
	ld (0ec00h),hl		;a2f9   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
L_A2FC:
	ld a,b			;a2fc   ; +0x3E + 2 x n: su ficha
	sla a		;a2fd
	add a,c			;a2ff
	ld hl,(0ec00h)		;a300   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	call 041e0h		;a303   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;a306
	inc l			;a307
	ld d,(hl)			;a308
	push de			;a309
	pop ix		;a30a   ; IX = la llama
	ld (ix+072h),000h		;a30c   ; (ix+0x72) = 0 y choca con todo
	ld (ix+00eh),003h		;a310
	push bc			;a314   ; colores 8 y 0x46
	call colores_8_46		;a315   ; colores_8_46: A = 8, C = 0x46 y pone los colores
	pop bc			;a318
	djnz L_A2FC		;a319   ; la siguiente
	ld ix,(0ec00h)		;a31b   ; IX = el tipo 36 otra vez
	ld (ix+013h),010h		;a31f   ; 0x10 cuadros
L_A323:
	inc (ix+001h)		;a323   ; el paso siguiente
	ret			;a326
L_A327:
	dec (ix+013h)		;a327   ; paso 3: la llama crece 0x10 cuadros
	jr nz,L_A332		;a32a
	ld (ix+013h),050h		;a32c   ; luego 0x50 cuadros del paso 4
	jr L_A323		;a330
L_A332:
	ld a,(ix+013h)		;a332   ; el largo: 0x10 - la cuenta
	neg		;a335
	add a,010h		;a337
	ld c,a			;a339
	push ix		;a33a   ; los desplazamientos de cada llama en (ix+0x50)...
	pop de			;a33c
	ld a,050h		;a33d
	add a,e			;a33f
	ld e,a			;a340
	ld b,(ix+03fh)		;a341
	xor a			;a344   ; ...de C en C
	ex de,hl			;a345
L_A346:
	add a,c			;a346   ; [dy] = n x C, [dx] = 0
	ld (hl),a			;a347
	inc l			;a348
	ld (hl),000h		;a349
	inc l			;a34b
	djnz L_A346		;a34c
	jp L_A3FC		;a34e   ; las llamas a su sitio
L_A351:
	dec (ix+013h)		;a351   ; paso 4: la llama ondea
	jr nz,L_A35F		;a354
	ld a,(ix+03fh)		;a356   ; luego (ix+0x3F) + 1 cuadros del paso 5
	inc a			;a359
	ld (ix+013h),a		;a35a
	jr L_A323		;a35d
L_A35F:
	ld d,(ix+01ah)		;a35f   ; el angulo (ix+0x14) avanza (ix+0x1A)
	ld a,d			;a362
	add a,(ix+014h)		;a363
	ld (ix+014h),a		;a366
	ld c,018h		;a369   ; entre 0x18...
	cp c			;a36b
	jr c,L_A373		;a36c
	ld c,03fh		;a36e   ; ...y 0x3F
	cp c			;a370
	jr c,L_A385		;a371
L_A373:
	ld (ix+014h),c		;a373   ; al salir, rebota...
	ld a,d			;a376
	neg		;a377
	ld (ix+01ah),a		;a379
	ld a,(ix+015h)		;a37c   ; ...y el cuarto (ix+0x15) siguiente
	inc a			;a37f
	and 003h		;a380
	ld (ix+015h),a		;a382
L_A385:
	ld c,02fh		;a385   ; el cuadro por el angulo: 0x2F...
	ld a,(ix+014h)		;a387
	cp 02ch		;a38a
	jr nc,L_A39B		;a38c
	ld c,02eh		;a38e   ; ...0x2E en los cuartos 1 y 2...
	ld a,(ix+015h)		;a390
	dec a			;a393
	jr z,L_A39B		;a394
	dec a			;a396
	jr z,L_A39B		;a397
	ld c,030h		;a399   ; ...0x30 en los otros
L_A39B:
	ld (ix+00bh),c		;a39b   ; guarda el cuadro del actor
	call 05bdfh		;a39e   ; pareja_del_angulo: C y B = los bytes (ix+0x14) y 63 - (ix+0x14) de la tabla p06:A6B9
	ld a,b			;a3a1   ; el coseno / 16: el paso X
	srl a		;a3a2
	srl a		;a3a4
	srl a		;a3a6
	srl a		;a3a8
	ld b,a			;a3aa
	ld a,(ix+015h)		;a3ab   ; en los cuartos 1 y 2, hacia el otro lado
	dec a			;a3ae
	jr z,L_A3B5		;a3af
	dec a			;a3b1
	ld a,b			;a3b2
	jr nz,L_A3B9		;a3b3
L_A3B5:
	ld a,b			;a3b5
	neg		;a3b6
	ld b,a			;a3b8
L_A3B9:
	ld (ix+051h),b		;a3b9   ; (ix+0x51) = el paso X
	ld a,c			;a3bc   ; el seno / 16: el paso Y
	srl a		;a3bd
	srl a		;a3bf
	srl a		;a3c1
	srl a		;a3c3
	ld c,a			;a3c5
	ld a,(ix+015h)		;a3c6
	sub 002h		;a3c9
	jr c,L_A3CD		;a3cb
L_A3CD:
	ld (ix+050h),c		;a3cd   ; (ix+0x50) = el paso Y
	ld h,(ix+03fh)		;a3d0   ; H = cuantas llamas
	push ix		;a3d3
	pop de			;a3d5
	ld a,050h		;a3d6   ; los desplazamientos (ix+0x50)
	add a,e			;a3d8
	ld e,a			;a3d9
	ld a,(de)			;a3da   ; C = el paso Y
	ld c,a			;a3db
	inc e			;a3dc
	inc e			;a3dd
	ld a,c			;a3de
	ld b,h			;a3df
L_A3E0:
	add a,c			;a3e0   ; [dy] de cada llama = n x paso
	ld (de),a			;a3e1
	inc e			;a3e2
	inc e			;a3e3
	djnz L_A3E0		;a3e4
	ld b,(ix+03fh)		;a3e6   ; vuelve al primero
	ld a,b			;a3e9
	sla a		;a3ea
	neg		;a3ec
	add a,e			;a3ee
	ld e,a			;a3ef
	inc e			;a3f0
	ld c,(ix+051h)		;a3f1   ; C = el paso X
	ld a,c			;a3f4
	ld b,h			;a3f5
L_A3F6:
	add a,c			;a3f6   ; [dx] de cada llama = n x paso
	ld (de),a			;a3f7
	inc e			;a3f8
	inc e			;a3f9
	djnz L_A3F6		;a3fa
L_A3FC:
	push ix		;a3fc   ; HL = (ix+0x50): los desplazamientos
	pop hl			;a3fe
	ld a,050h		;a3ff
	or l			;a401
	ld l,a			;a402
	push hl			;a403
	ld a,0efh		;a404   ; (ix+0x3F): cuantas llamas
	add a,l			;a406
	ld l,a			;a407
	ld b,(hl)			;a408
	inc l			;a409
	push bc			;a40a
	exx			;a40b
	pop bc			;a40c
L_A40D:
	exx			;a40d   ; la ficha de la llama
	ld e,(hl)			;a40e
	inc l			;a40f
	ld d,(hl)			;a410
	inc l			;a411
	ex de,hl			;a412
	push hl			;a413   ; IY = la llama
	pop iy		;a414
	ld b,d			;a416
	ld c,e			;a417
	inc l			;a418   ; +3: su Y
	inc l			;a419
	inc l			;a41a
	pop de			;a41b
	ld a,(de)			;a41c   ; [dy] tambien en (iy+0x50)
	ld (iy+050h),a		;a41d
	inc e			;a420
	add a,(ix+017h)		;a421   ; la Y = (ix+0x17) + dy
	ld (hl),a			;a424
	inc l			;a425
	inc l			;a426   ; +5: su X
	ld a,(de)			;a427   ; [dx] tambien en (iy+0x51)
	ld (iy+051h),a		;a428
	inc e			;a42b
	push de			;a42c
	add a,(ix+019h)		;a42d   ; la X = (ix+0x19) + dx
	ld (hl),a			;a430
	ld h,b			;a431
	ld l,c			;a432
	exx			;a433
	djnz L_A40D		;a434   ; la siguiente
	exx			;a436
	pop de			;a437
	ret			;a438
L_A439:
	dec (ix+013h)		;a439   ; paso 5: las llamas se apagan una a una
	jr z,L_A463		;a43c
	ld a,(ix+013h)		;a43e   ; la llama n - 1...
	dec a			;a441
	sla a		;a442   ; ...+0x40 + 2 x n: su ficha
	add a,040h		;a444
	push ix		;a446
	pop hl			;a448
	push hl			;a449
	call 041e0h		;a44a   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;a44d
	inc l			;a44e
	ld d,(hl)			;a44f
	push de			;a450
	pop ix		;a451   ; IX = la llama
	ld (ix+072h),001h		;a453   ; (ix+0x72) = 1: apagada...
	ld (ix+00eh),000h		;a457   ; ...no choca...
	xor a			;a45b   ; ...y transparente
	ld c,a			;a45c
	call 05bc3h		;a45d
	pop ix		;a460   ; IX = el tipo 36
	ret			;a462
L_A463:
	call tipo_36_empieza		;a463   ; al acabar: otra vez desde el principio
	call hacia_snake_de_lado		;a466   ; hacia_snake_de_lado: velocidad X de 2 hacia Snake y cuadro 0x2C/0x28
	ld a,001h		;a469   ; al paso 1
	jp 05babh		;a46b   ; paso_a: el paso del actor (ix+1) = A
L_A46E:
	ld b,002h		;a46e   ; la Y y la X (16 bits) de (ix+0x16)...
	push ix		;a470
L_A472:
	ld e,(ix+007h)		;a472   ; lee la velocidad Y del actor
	ld d,(ix+008h)		;a475   ; lee la velocidad Y del actor (alta)
	ld l,(ix+016h)		;a478
	ld h,(ix+017h)		;a47b
	add hl,de			;a47e   ; ...mas las velocidades
	ld (ix+016h),l		;a47f
	ld (ix+017h),h		;a482
	inc ix		;a485   ; de la Y a la X
	inc ix		;a487
	djnz L_A472		;a489
	pop ix		;a48b
	ld a,(ix+019h)		;a48d   ; al pasar la X 0x80, hacia la izquierda...
	cp 080h		;a490
	jr c,L_A499		;a492
	ld de,0fe00h		;a494
	jr L_A49F		;a497
L_A499:
	cp 060h		;a499   ; ...al bajar de 0x60, hacia la derecha
	ret nc			;a49b
	ld de,00200h		;a49c
L_A49F:
	jp 05b5dh		;a49f   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
crea_tipo_36:		; la creacion del tipo 36
	ld a,(0c627h)		;a4a2   ; con 0xC627 no aparece
	or a			;a4a5
	jr nz,L_A4E1		;a4a6
	ld (ix+073h),002h		;a4a8   ; (ix+0x73) = 2 cuadros
	ld a,033h		;a4ac   ; hasta 2 del tipo 0x33
	call 05bafh		;a4ae   ; cuenta_tipo: A = cuantos actores del tipo A hay
	cp 002h		;a4b1
	jp nc,07371h		;a4b3
	call musica_3e		;a4b6   ; musica_3e: la musica 0x3E (salvo en el modo 8)
tipo_36_empieza:		; los valores de partida del tipo 36 y velocidad X de -2
	ld (ix+01ah),004h		;a4b9   ; el angulo sube de 4 en 4...
	ld (ix+014h),03fh		;a4bd   ; ...desde 0x3F...
	ld (ix+015h),002h		;a4c1   ; ...en el cuarto 2
	ld (ix+00bh),02ch		;a4c5   ; el cuadro del actor = 0x2C
	ld e,(ix+003h)		;a4c9   ; lee la Y del actor
	ld d,(ix+005h)		;a4cc   ; lee la X del actor
	ld (ix+017h),e		;a4cf   ; (ix+0x17) = su Y, (ix+0x19) = su X
	ld (ix+019h),d		;a4d2
	ld de,0fe00h		;a4d5   ; hacia la izquierda a 2 puntos
	ld hl,00000h		;a4d8
	jr L_A4FF		;a4db
crea_tipo_37:		; la creacion del tipo 37
	ld a,(0c628h)		;a4dd   ; con 0xC628 no aparece
	or a			;a4e0
L_A4E1:
	jp nz,07371h		;a4e1
	ld a,034h		;a4e4   ; hasta 5 del tipo 0x34
	call 05bafh		;a4e6   ; cuenta_tipo: A = cuantos actores del tipo A hay
	cp 005h		;a4e9
	jp nc,07371h		;a4eb
	ld (ix+00bh),010h		;a4ee   ; el cuadro del actor = 0x10
	ld a,r		;a4f2   ; la cuenta al azar
	ld (ix+00ch),a		;a4f4   ; guarda la cuenta de cuadros del actor
	inc (ix+006h)		;a4f7   ; sube si el actor se mueve (p01:7336)
	ld hl,00000h		;a4fa   ; quieto
	ld d,h			;a4fd
	ld e,l			;a4fe
L_A4FF:
	jp 05b64h		;a4ff   ; velocidades: la velocidad X del actor = DE y la Y = HL
cuadro_tipo_37:		; lo de cada cuadro del tipo 37
	ld a,(0c627h)		;a502   ; con 0xC627, se borra
	or a			;a505
	jp nz,0740ch		;a506   ; borra_actor: el tipo y (ix+0x0E) a cero y sus sprites escondidos
	ld a,024h		;a509   ; sin tipo 0x24, se quita
	call 05bafh		;a50b   ; cuenta_tipo: A = cuantos actores del tipo A hay
	or a			;a50e
	jp z,07371h		;a50f
	ld b,007h		;a512   ; alterna el cuadro cada 8
	call 05b6ah		;a514   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	ld a,(ix+025h)		;a517   ; con color, nada mas
	or a			;a51a
	ret nz			;a51b
	ld a,(ix+070h)		;a51c   ; (ix+0x70): a que lado mira
	or a			;a51f
	ld a,(ix+005h)		;a520   ; lee la X del actor
	jr nz,L_A52A		;a523   ; 0: se enciende en la mitad derecha...
	cp 080h		;a525
	ret c			;a527
	jr L_A52D		;a528
L_A52A:
	cp 080h		;a52a   ; ...1: en la izquierda
	ret nc			;a52c
L_A52D:
	ld a,(ix+072h)		;a52d   ; apagada (ix+0x72): nada
	or a			;a530
	ret nz			;a531
colores_8_46:		; A = 8, C = 0x46 y pone los colores
	ld a,008h		;a532   ; colores 8 y 0x46
	ld c,046h		;a534
	jr L_A546		;a536
L_A538:
	ld a,(ix+051h)		;a538   ; (ix+0x70) = el signo de (ix+0x51)
	ld d,000h		;a53b
	rla			;a53d
	rl d		;a53e
	ld a,d			;a540
	ld (ix+070h),a		;a541
	xor a			;a544   ; colores 0: transparente
	ld c,a			;a545
L_A546:
	jp 05bc3h		;a546
cuadro_tipo_1:		; lo de cada cuadro del tipo 1
	ld a,(ix+001h)		;a549   ; lee el paso del actor
	dec a			;a54c   ; paso 1: el vaiven
	jp z,L_A5B0		;a54d
	ld hl,0d000h		;a550   ; paso 0: busca los actores del tipo 2
	ld de,00080h		;a553
	ld bc,01000h		;a556
	ld a,002h		;a559   ; el tipo 2
L_A55B:
	cp (hl)			;a55b   ; uno mas, y su ficha a la pila
	jr nz,L_A560		;a55c
	inc c			;a55e
	push hl			;a55f
L_A560:
	add hl,de			;a560   ; la ficha siguiente
	djnz L_A55B		;a561
	ld a,c			;a563   ; ninguno: al paso 1
	or a			;a564
	jr z,L_A5AD		;a565
	push ix		;a567   ; (ix+0x30) = cuantos...
	pop hl			;a569
	ld a,030h		;a56a
	or l			;a56c
	ld l,a			;a56d
	ld b,c			;a56e
	ld (hl),b			;a56f
	inc l			;a570   ; ...y sus fichas detras
L_A571:
	pop de			;a571   ; una ficha de la pila
	ld (hl),e			;a572
	inc l			;a573
	ld (hl),d			;a574
	inc l			;a575
	djnz L_A571		;a576
	ld de,0a5e4h		;a578   ; las velocidades de 0xA5E4
	ld c,(ix+030h)		;a57b   ; C = cuantos
	push ix		;a57e
	pop hl			;a580
	ld a,031h		;a581
	add a,l			;a583
	ld l,a			;a584
L_A585:
	push de			;a585   ; la ficha del tipo 2
	ld e,(hl)			;a586
	inc l			;a587
	ld d,(hl)			;a588
	inc l			;a589
	ld (ix+013h),l		;a58a   ; (ix+0x13, 0x14) = por donde va la lista
	ld (ix+014h),h		;a58d
	ex de,hl			;a590
	ld a,007h		;a591   ; +7, +8: la velocidad Y a cero
	add a,l			;a593
	ld l,a			;a594
	ld (hl),000h		;a595
	inc l			;a597
	ld (hl),000h		;a598
	inc l			;a59a
	pop de			;a59b
	ld b,002h		;a59c   ; +9, +0x0A: la velocidad X de la tabla
L_A59E:
	ld a,(de)			;a59e
	inc de			;a59f
	ld (hl),a			;a5a0
	inc l			;a5a1
	djnz L_A59E		;a5a2
	ld l,(ix+013h)		;a5a4   ; el siguiente
	ld h,(ix+014h)		;a5a7
	dec c			;a5aa
	jr nz,L_A585		;a5ab
L_A5AD:
	jp 05ba2h		;a5ad   ; paso_siguiente: sube el paso del actor (ix+1)
L_A5B0:
	dec (ix+015h)		;a5b0   ; cada 0x20 cuadros...
	ret nz			;a5b3
	ld (ix+015h),020h		;a5b4
	ld c,(ix+030h)		;a5b8   ; ...a cada uno del tipo 2...
	push ix		;a5bb
	pop hl			;a5bd
	ld a,031h		;a5be
	add a,l			;a5c0
	ld l,a			;a5c1
L_A5C2:
	ld e,(hl)			;a5c2   ; la ficha
	inc l			;a5c3
	ld d,(hl)			;a5c4
	inc l			;a5c5
	ld (ix+013h),l		;a5c6
	ld (ix+014h),h		;a5c9
	ex de,hl			;a5cc
	ld a,009h		;a5cd   ; +9: la velocidad X...
	add a,l			;a5cf
	ld l,a			;a5d0
	ld e,(hl)			;a5d1
	inc l			;a5d2
	ld d,(hl)			;a5d3
	call 05bfbh		;a5d4   ; ...cambia de signo
	ld (hl),d			;a5d7
	dec l			;a5d8
	ld (hl),e			;a5d9
	ld l,(ix+013h)		;a5da   ; el siguiente
	ld h,(ix+014h)		;a5dd
	dec c			;a5e0
	jr nz,L_A5C2		;a5e1
	ret			;a5e3

; ----------------------------------------------------------------------
; DATOS velocidades_a5e4: 8 palabras (0x40, 0x80, 0xC0, 0x100, 0x100, 0xC0,
;   0x80, 0x40) que p03:A578 recorre con C = (ix+0x30): la velocidad del
;   puente
;   0xa5e4..0xa5f4  (16 bytes)
DATA_velocidades_a5e4:
	defw 00040h,00080h,000c0h,00100h,00100h,000c0h,00080h,00040h	; a5e4

; ======================================================================
; CODIGO 0xa5f4..0xa7c4  (464 bytes)
; ======================================================================


crea_tipo_1:		; la creacion del tipo 1
	inc (ix+006h)		;a5f4   ; sube si el actor se mueve (p01:7336)
	ld (ix+00bh),035h		;a5f7   ; el cuadro del actor = 0x35
	ld (ix+015h),010h		;a5fb
	ld (ix+00eh),001h		;a5ff   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ret			;a603
cuadro_tipo_16:		; lo de cada cuadro del tipo 16
	ld b,(ix+001h)		;a604   ; lee el paso del actor
	inc b			;a607
	djnz L_A637		;a608
	bit 7,(ix+01eh)		;a60a   ; mira el bit 7 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ret z			;a60e
	ld (ix+00eh),001h		;a60f   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+019h),001h		;a613
	ld h,(ix+005h)		;a617   ; lee la X del actor
	ld l,(ix+003h)		;a61a   ; lee la Y del actor
	ld (ix+014h),h		;a61d
	ld (ix+013h),l		;a620
	ld (ix+018h),060h		;a623
	ld (ix+017h),0c0h		;a627
	ld (ix+015h),000h		;a62b
	ld a,007h		;a62f
	call 0427ch		;a631   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
L_A634:
	jp 05ba2h		;a634   ; paso_siguiente: sube el paso del actor (ix+1)
L_A637:
	dec b			;a637   ; cada B cuadros
	ret nz			;a638
	ld a,(ix+015h)		;a639   ; el alto (ix+0x15) crece 2...
	add a,002h		;a63c
	ld (ix+015h),a		;a63e
	cp 040h		;a641   ; ...hasta 0x40
	jr c,L_A65B		;a643
	ld (ix+016h),016h		;a645   ; abierta del todo: (ix+0x16) = 0x16, (ix+0x18) = 0x40, (ix+0x17) = 0xA0
	ld (ix+018h),040h		;a649
	ld (ix+017h),0a0h		;a64d
	res 0,(ix+013h)		;a651
	res 0,(ix+014h)		;a655
	jr nc,L_A634		;a659
L_A65B:
	dec (ix+013h)		;a65b
	dec (ix+014h)		;a65e
	dec (ix+017h)		;a661
	dec (ix+018h)		;a664
	call lee_recuadro		;a667   ; lee_recuadro: D, E = (ix+0x14), (ix+0x13); H, L = (ix+0x18), (ix+0x17)
	ld b,(ix+015h)		;a66a
	ld c,001h		;a66d
	ld a,001h		;a66f
	call 04fcdh		;a671   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	call lee_recuadro		;a674   ; lee_recuadro: D, E = (ix+0x14), (ix+0x13); H, L = (ix+0x18), (ix+0x17)
	ld b,(ix+015h)		;a677
	ld c,001h		;a67a
	ld a,b			;a67c
	add a,e			;a67d
	ld e,a			;a67e
	ld a,b			;a67f
	add a,l			;a680
	ld l,a			;a681
	ld a,001h		;a682
	call 04fcdh		;a684   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld a,(ix+015h)		;a687
	ld c,a			;a68a
	rra			;a68b
	rra			;a68c
	ret c			;a68d
	ld b,002h		;a68e
	ld a,001h		;a690
	call lee_recuadro		;a692   ; lee_recuadro: D, E = (ix+0x14), (ix+0x13); H, L = (ix+0x18), (ix+0x17)
	call 04fcdh		;a695   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	call lee_recuadro		;a698   ; lee_recuadro: D, E = (ix+0x14), (ix+0x13); H, L = (ix+0x18), (ix+0x17)
	ld a,(ix+015h)		;a69b
	ld c,a			;a69e
	sub 002h		;a69f
	ld b,a			;a6a1
	ld a,d			;a6a2
	add a,b			;a6a3
	ld d,a			;a6a4
	ld a,h			;a6a5
	add a,b			;a6a6
	ld h,a			;a6a7
	ld b,002h		;a6a8
	ld a,001h		;a6aa
	jp 04fcdh		;a6ac   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
lee_recuadro:		; D, E = (ix+0x14), (ix+0x13); H, L = (ix+0x18), (ix+0x17)
	ld d,(ix+014h)		;a6af
	ld e,(ix+013h)		;a6b2
	ld h,(ix+018h)		;a6b5
	ld l,(ix+017h)		;a6b8
	ret			;a6bb
crea_tipo_16:		; la creacion del tipo 16
	ld hl,04b27h		;a6bc
	ld c,004h		;a6bf
	call 042c9h		;a6c1   ; c_colores: copia C colores de HL a 0xE700
	ld hl,0a5a1h		;a6c4
	ld de,0cc20h		;a6c7
	ld b,00ch		;a6ca
	call 04a81h		;a6cc   ; fichas_y_montaje_a559: B fichas de 2 planos de HL a la VRAM DE y el montaje p09:A559
	ld (ix+00eh),005h		;a6cf   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x05
	ld a,(0c130h)		;a6d3   ; lee la sala
	cp 0beh		;a6d6
	ret nz			;a6d8
	ld (ix+001h),002h		;a6d9   ; el paso del actor = 0x02
	ld (ix+015h),03fh		;a6dd
	ld a,(ix+005h)		;a6e1   ; lee la X del actor
	sub 020h		;a6e4
	ld (ix+014h),a		;a6e6
	ld a,(ix+003h)		;a6e9   ; lee la Y del actor
	sub 020h		;a6ec
	ld (ix+013h),a		;a6ee
	ld (ix+018h),040h		;a6f1
	ld (ix+017h),0a0h		;a6f5
	jr dibujo_de_trampa		;a6f9
trampas_abiertas:		; dibuja abiertas las trampas (tipo 0x10) que lo esten
	xor a			;a6fb
	ld (0ec00h),a		;a6fc   ; guarda la casilla de trabajo 0xEC00
	ld b,010h		;a6ff
	ld hl,0d000h		;a701   ; apunta a los 16 actores (fichas de 0x80)
L_A704:
	ld a,010h		;a704
	cp (hl)			;a706
	push bc			;a707
	call z,trampa_abierta		;a708   ; trampa_abierta: la trampa HL: colores la primera vez (p00:4A7C) y su dibujo si (ix+0x19)
	pop bc			;a70b
	ld de,00080h		;a70c
	add hl,de			;a70f
	djnz L_A704		;a710
	ret			;a712
trampa_abierta:		; la trampa HL: colores la primera vez (p00:4A7C) y su dibujo si (ix+0x19)
	push hl			;a713
	ld hl,0ec00h		;a714   ; apunta a la casilla de trabajo 0xEC00
	ld a,(hl)			;a717
	inc (hl)			;a718
	or a			;a719
	call z,04a7ch		;a71a   ; montaje_a559: el montaje p09:A559 de fichas del bloque en (0x40, 0xA0) de la pagina 1
	pop hl			;a71d
	push hl			;a71e
	pop ix		;a71f
	ld a,(ix+019h)		;a721
	or a			;a724
	ret z			;a725
	push hl			;a726
	call dibujo_de_trampa		;a727   ; dibujo_de_trampa: el recuadro de la trampa con el alto (ix+0x15), hasta 0x3F
	pop hl			;a72a
	ret			;a72b
dibujo_de_trampa:		; el recuadro de la trampa con el alto (ix+0x15), hasta 0x3F
	call lee_recuadro		;a72c   ; lee_recuadro: D, E = (ix+0x14), (ix+0x13); H, L = (ix+0x18), (ix+0x17)
	res 0,d		;a72f
	res 0,h		;a731
	ld a,(ix+015h)		;a733
	cp 040h		;a736
	jr c,L_A73F		;a738
	ld a,03fh		;a73a
	ld (ix+015h),a		;a73c
L_A73F:
	ld b,(ix+015h)		;a73f
	ld c,b			;a742
	inc c			;a743
	ld a,001h		;a744
	jp 04fcdh		;a746   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
crea_tipo_10:		; la creacion del tipo 10
	ld (ix+001h),004h		;a749   ; el paso del actor = 0x04
	ld a,(0c602h)		;a74d   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;a750
	jr nz,L_A772		;a751
	ld a,(0c130h)		;a753   ; lee la sala
	cp 07fh		;a756
	jr nz,L_A75F		;a758
	ld a,(0c634h)		;a75a
	jr L_A76E		;a75d
L_A75F:
	sub 083h		;a75f
	jr nz,L_A768		;a761
	ld a,(0c635h)		;a763
	jr L_A76E		;a766
L_A768:
	dec a			;a768
	jr nz,L_A772		;a769
	ld a,(0c636h)		;a76b
L_A76E:
	or a			;a76e
	jp nz,07371h		;a76f
L_A772:
	ld (ix+00eh),003h		;a772   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	call 08334h		;a776   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	ld (ix+011h),a		;a779   ; guarda la direccion del actor
	call cuadro_por_a		;a77c   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	call velocidad_a916_dir		;a77f   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
	xor a			;a782
	ld (ix+007h),a		;a783   ; guarda la velocidad Y del actor
	ld (ix+009h),a		;a786   ; guarda la velocidad X del actor
	ld (ix+01bh),a		;a789
	ld (ix+012h),014h		;a78c   ; la cuenta de espera del actor = 0x14
	inc a			;a790
	ld (ix+006h),a		;a791   ; guarda si el actor se mueve (p01:7336)
	ld (ix+013h),a		;a794
tipo_22_por_sala:		; valores del tipo 22 segun la sala (0xD8, 0xBB, 0x9A, 0x58-0x5C)
	ld a,(0c130h)		;a797   ; lee la sala
	ld hl,00000h		;a79a   ; sin cuenta de refuerzos...
	cp 0d8h		;a79d   ; ...en la sala 0xD8
	jr z,L_A7B7		;a79f
	cp 0bbh		;a7a1   ; en las 0xBB, 0x9A y 0x58-0x5C...
	jr z,L_A7AE		;a7a3
	cp 09ah		;a7a5
	jr z,L_A7AE		;a7a7
	sub 058h		;a7a9
	cp 005h		;a7ab
	ret nc			;a7ad
L_A7AE:
	ld h,00ah		;a7ae   ; ...0xC606 = 0x0A y la cuenta 0x10-0x1F al azar
	ld a,r		;a7b0
	and 00fh		;a7b2
	add a,010h		;a7b4
	ld l,a			;a7b6
L_A7B7:
	ld (0c605h),hl		;a7b7   ; 0xC605 = la cuenta, 0xC606 = cuantos
	ret			;a7ba
cuadro_tipo_10:		; lo de cada cuadro del tipo 10
	call ficha_del_tipo_10		;a7bb   ; ficha_del_tipo_10: las fichas bajo el actor: (ix+0x1B) segun la ficha que pisa
	ld a,(ix+001h)		;a7be   ; lee el paso del actor
	call 041eah		;a7c1   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_A7C4: 5 destinos del despachador p00:41EA (call en p03:A7C1, el
;   indice en A): A7CE, A859, A88F, A8CB, A8E8; lo leen p03:A7C1 (10 bytes)
;   0xa7c4..0xa7ce  (10 bytes)
DATA_tabla_A7C4:
	defw 0a7ceh,0a859h,0a88fh,0a8cbh,0a8e8h	; a7c4

; ======================================================================
; CODIGO 0xa7ce..0xa910  (322 bytes)
; ======================================================================


L_A7CE:
	call cuadro_por_direccion		;a7ce   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld b,000h		;a7d1
	ld c,(ix+011h)		;a7d3   ; lee la direccion del actor
	call 08292h		;a7d6   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	jp c,L_A7E0		;a7d9
	dec (ix+012h)		;a7dc   ; baja la cuenta de espera del actor
	ret nz			;a7df
L_A7E0:
	call es_tipo_0b		;a7e0   ; es_tipo_0b: sin acarreo si el tipo no es 0x0B
	jp c,L_A840		;a7e3
L_A7E6:
	call 08334h		;a7e6   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	exx			;a7e9
	ld b,000h		;a7ea
	ld c,a			;a7ec
	call 08292h		;a7ed   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	exx			;a7f0
	jp nc,L_A7FF		;a7f1
	ld (ix+001h),002h		;a7f4   ; el paso del actor = 0x02
	ld (ix+013h),a		;a7f8
	ld a,b			;a7fb
	jp L_A8BF		;a7fc
L_A7FF:
	ld (ix+011h),a		;a7ff   ; guarda la direccion del actor
	call cuadro_por_a		;a802   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	call velocidad_a916_dir		;a805   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
	ld a,r		;a808
	xor (ix+00ch)		;a80a   ; XOR con la cuenta de cuadros del actor
	and 007h		;a80d
	add a,00fh		;a80f
	ld b,a			;a811
	and 003h		;a812
	jp z,espera_por_tipo		;a814   ; espera_por_tipo: B = 0x14 (0x0A con el tipo 0x0B)
L_A817:
	ld (ix+012h),b		;a817   ; guarda la cuenta de espera del actor
	ld (ix+001h),001h		;a81a   ; el paso del actor = 0x01
	ld (ix+006h),000h		;a81e   ; si el actor se mueve (p01:7336) = 0x00
L_A822:
	ld c,02fh		;a822
crea_encima:		; crea el actor C 0x10 puntos por encima de IX
	ld a,(ix+003h)		;a824   ; lee la Y del actor
	sub 010h		;a827
	ld e,a			;a829
	ld d,(ix+005h)		;a82a   ; lee la X del actor
	jp 0569ah		;a82d   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
L_A830:
	call 08356h		;a830   ; lejos_de_snake_dir: las direcciones contrarias a las de hacia_snake_dir
	ld (ix+011h),a		;a833   ; guarda la direccion del actor
	ld (ix+012h),01eh		;a836   ; la cuenta de espera del actor = 0x1E
	call cuadro_por_a		;a83a   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	jp velocidad_a916_dir		;a83d   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
L_A840:
	call 08356h		;a840   ; lejos_de_snake_dir: las direcciones contrarias a las de hacia_snake_dir
	exx			;a843
	ld b,000h		;a844
	ld c,a			;a846
	call 08292h		;a847   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	jp nc,L_A7FF		;a84a
	exx			;a84d
	ld (ix+001h),003h		;a84e   ; el paso del actor = 0x03
	ld (ix+013h),a		;a852
	ld a,b			;a855
	jp L_A8BF		;a856
L_A859:
	call 08334h		;a859   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	call cuadro_a_mas_1b		;a85c   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
	dec (ix+012h)		;a85f   ; baja la cuenta de espera del actor
	ret nz			;a862
	call espera_por_tipo		;a863   ; espera_por_tipo: B = 0x14 (0x0A con el tipo 0x0B)
	ld (ix+001h),000h		;a866   ; el paso del actor = 0x00
	ld (ix+006h),001h		;a86a   ; si el actor se mueve (p01:7336) = 0x01
	ld a,(ix+000h)		;a86e   ; lee el tipo del actor
	cp 00bh		;a871
	jp z,L_A822		;a873
	ret			;a876
espera_por_tipo:		; B = 0x14 (0x0A con el tipo 0x0B)
	ld a,(ix+000h)		;a877   ; lee el tipo del actor
	cp 00bh		;a87a
	ld b,014h		;a87c
	jp nz,L_A883		;a87e
	ld b,00ah		;a881
L_A883:
	ld a,r		;a883
	xor (ix+00ch)		;a885   ; XOR con la cuenta de cuadros del actor
	and 00fh		;a888
	add a,b			;a88a
	ld (ix+012h),a		;a88b   ; guarda la cuenta de espera del actor
	ret			;a88e
L_A88F:
	call cuadro_por_direccion		;a88f   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld b,000h		;a892
	ld c,(ix+013h)		;a894
	call 08292h		;a897   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	jp nc,L_A8BB		;a89a
	ld b,000h		;a89d
	ld c,(ix+011h)		;a89f   ; lee la direccion del actor
	call 08292h		;a8a2   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	ret nc			;a8a5
	ld a,(ix+013h)		;a8a6
	call 0835fh		;a8a9   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
	ld b,000h		;a8ac
	ld c,a			;a8ae
	call 08292h		;a8af   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	jp nc,L_A8BB		;a8b2
	ld a,(ix+011h)		;a8b5   ; lee la direccion del actor
	call 0835fh		;a8b8   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
L_A8BB:
	ld (ix+001h),000h		;a8bb   ; el paso del actor = 0x00
L_A8BF:
	ld (ix+011h),a		;a8bf   ; guarda la direccion del actor
	call cuadro_por_a		;a8c2   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	call velocidad_a916_dir		;a8c5   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
	jp espera_por_tipo		;a8c8   ; espera_por_tipo: B = 0x14 (0x0A con el tipo 0x0B)
L_A8CB:
	call cuadro_por_direccion		;a8cb   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld b,000h		;a8ce
	ld c,(ix+011h)		;a8d0   ; lee la direccion del actor
	call 08292h		;a8d3   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	jp c,L_A7E6		;a8d6
	dec (ix+012h)		;a8d9   ; baja la cuenta de espera del actor
	ret nz			;a8dc
	call es_tipo_0b		;a8dd   ; es_tipo_0b: sin acarreo si el tipo no es 0x0B
	jp c,L_A840		;a8e0
	ld b,014h		;a8e3
	jp L_A817		;a8e5
L_A8E8:
	dec (ix+013h)		;a8e8
	ret nz			;a8eb
	ld (ix+001h),000h		;a8ec   ; el paso del actor = 0x00
	ld a,(0c602h)		;a8f0   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;a8f3
	ret nz			;a8f4
	jp 07d2ah		;a8f5   ; pon_c602: 0xC602 = 1, 0xC604 = la sala, 0xC606 y la musica 0x32 (0x2F si la pone un actor del tipo 6 o 0x23)
velocidad_a90e:		; las velocidades de la direccion (ix+0x11) de la tabla 0xA90E
	ld a,(ix+011h)		;a8f8   ; lee la direccion del actor
	ld de,la90eh		;a8fb
L_A8FE:
	call 042b4h		;a8fe   ; palabra_a: DE = la palabra A de la tabla DE
	ld (ix+008h),e		;a901   ; guarda la velocidad Y del actor (alta)
	ld (ix+00ah),d		;a904   ; guarda la velocidad X del actor (alta)
	ret			;a907
velocidad_a916_dir:		; las velocidades de la direccion (ix+0x11) de la tabla 0xA916
	ld a,(ix+011h)		;a908   ; lee la direccion del actor
velocidad_a916:		; las velocidades de la direccion A de la tabla 0xA916
	ld de,0a916h		;a90b
L_A90E:
	jr L_A8FE		;a90e

; ----------------------------------------------------------------------
; DATOS velocidades_a910: dos juegos de 4 parejas [dy][dx], uno por direccion:
;   p03:A8FB lee 0xA90E + 2 x (ix+0x11) y p03:A90B 0xA916 + 2 x (ix+0x11), con
;   L_42B4, y las pone en (ix+8)/(ix+0xA)
;   0xa910..0xa920  (16 bytes)
DATA_velocidades_a910:
	defb 0ffh,000h	; a910
	defb 001h,000h	; a912
	defb 000h,0ffh	; a914
	defb 000h,001h	; a916
	defb 0feh,000h	; a918
	defb 002h,000h	; a91a
	defb 000h,0feh	; a91c
	defb 000h,002h	; a91e

; ======================================================================
; CODIGO 0xa920..0xab70  (592 bytes)
; ======================================================================


cuadro_por_direccion:		; cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld a,(ix+011h)		;a920   ; lee la direccion del actor
cuadro_por_a:		; cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	dec a			;a923
	add a,a			;a924
	bit 2,(ix+00ch)		;a925   ; mira el bit 2 de la cuenta de cuadros del actor
	jp z,L_A92D		;a929
	inc a			;a92c
L_A92D:
	add a,(ix+01bh)		;a92d
	ld (ix+00bh),a		;a930   ; guarda el cuadro del actor
	ret			;a933
cuadro_mas_1b:		; cuadro = (ix+0x11) + 7 + (ix+0x1B)
	ld a,(ix+011h)		;a934   ; lee la direccion del actor
cuadro_a_mas_1b:		; cuadro = A + 7 + (ix+0x1B)
	add a,007h		;a937
	add a,(ix+01bh)		;a939
	ld (ix+00bh),a		;a93c   ; guarda el cuadro del actor
	ret			;a93f
es_tipo_0b:		; sin acarreo si el tipo no es 0x0B
	ld a,(ix+000h)		;a940   ; lee el tipo del actor
	cp 00bh		;a943
	scf			;a945
	ccf			;a946
	ret nz			;a947
lejos_de_snake_x:		; la distancia en X a Snake
	ld a,(0c184h)		;a948   ; lee la X de Snake
	sub (ix+005h)		;a94b   ; le resta la X del actor
	jp nc,L_A953		;a94e
	neg		;a951
L_A953:
	ld b,a			;a953
	ld a,(0c182h)		;a954   ; lee la Y de Snake
	sub (ix+003h)		;a957   ; le resta la Y del actor
	jp nc,L_A95F		;a95a
	neg		;a95d
L_A95F:
	cp b			;a95f
	jp nc,L_A964		;a960
	ld a,b			;a963
L_A964:
	cp 030h		;a964
	ret			;a966
ficha_del_tipo_10:		; las fichas bajo el actor: (ix+0x1B) segun la ficha que pisa
	ld a,(ix+005h)		;a967   ; lee la X del actor
	sub 004h		;a96a
	ld h,a			;a96c
	ld l,(ix+003h)		;a96d   ; lee la Y del actor
	call 08305h		;a970   ; fichas_en_el_punto: H y L = la ficha de la sala en el punto HL y la siguiente
	ld a,l			;a973
	dec a			;a974
	jp z,L_A9A0		;a975
	ld a,h			;a978
	dec a			;a979
	jp z,L_A9A0		;a97a
	ld a,(0c130h)		;a97d   ; lee la sala
	cp 046h		;a980
	ret c			;a982
	ld (ix+01bh),000h		;a983
	ld a,l			;a987
	cp 06dh		;a988
	jp z,L_A99B		;a98a
	sub 06fh		;a98d
	cp 008h		;a98f
	ret nc			;a991
	ld a,h			;a992
	jp z,L_A99B		;a993
	sub 06fh		;a996
	cp 008h		;a998
	ret nc			;a99a
L_A99B:
	ld (ix+01bh),049h		;a99b
	ret			;a99f
L_A9A0:
	ld (ix+001h),000h		;a9a0   ; el paso del actor = 0x00
	ld (ix+012h),00ah		;a9a4   ; la cuenta de espera del actor = 0x0A
	ld a,(ix+011h)		;a9a8   ; lee la direccion del actor
	call 0835fh		;a9ab   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
	ld (ix+011h),a		;a9ae   ; guarda la direccion del actor
	call cuadro_por_a		;a9b1   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	jp velocidad_a916_dir		;a9b4   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
azar_0_3:		; A = (R XOR (ix+0x0C)) AND 3
	ld a,r		;a9b7
	xor (ix+00ch)		;a9b9   ; XOR con la cuenta de cuadros del actor
	and 003h		;a9bc
	ret			;a9be
crea_tipo_47:		; la creacion del tipo 47
	inc (ix+006h)		;a9bf   ; sube si el actor se mueve (p01:7336)
	ld (ix+00eh),001h		;a9c2   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+00bh),072h		;a9c6   ; el cuadro del actor = 0x72
	ld a,090h		;a9ca
	call 05c27h		;a9cc   ; hacia_snake_a: HL y DE = la velocidad de IX hacia Snake con el modulo A (+ 8 x 0xC152)
	call 05b64h		;a9cf   ; velocidades: la velocidad X del actor = DE y la Y = HL
	ld a,005h		;a9d2
	jp 04284h		;a9d4   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
crea_tipo_19:		; la creacion del tipo 19
	ld a,004h		;a9d7
	call 05bafh		;a9d9   ; cuenta_tipo: A = cuantos actores del tipo A hay
	push af			;a9dc
	ld a,013h		;a9dd
	call 05bafh		;a9df   ; cuenta_tipo: A = cuantos actores del tipo A hay
	pop bc			;a9e2
	add a,b			;a9e3
	ld (ix+07dh),a		;a9e4
	ld (ix+00fh),a		;a9e7   ; guarda el numero del actor entre los de su tipo
	ld (ix+00eh),000h		;a9ea   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	call 05997h		;a9ee   ; camino_b: el camino B de la sala (p06:A2DF) para IX, con los arreglos de algunas salas (p03:A10C-A17B)
	ld a,(0c130h)		;a9f1   ; lee la sala
	cp 007h		;a9f4
	jr nz,banderas_salas_5_7		;a9f6
	ld a,(ix+00fh)		;a9f8   ; lee el numero del actor entre los de su tipo
	dec a			;a9fb
	jr z,banderas_salas_5_7		;a9fc
	ld (ix+043h),008h		;a9fe   ; la marcha del actor (0, 4 u 8) = 0x08
banderas_salas_5_7:		; la bandera de 0xC634 que toca en las salas 5 y 7
	ld a,(0c130h)		;aa02   ; lee la sala
	cp 005h		;aa05
	ld hl,0c634h		;aa07
	jr z,L_AA1B		;aa0a
	cp 007h		;aa0c
	jr nz,L_AA1D		;aa0e
	ld a,(ix+00fh)		;aa10   ; lee el numero del actor entre los de su tipo
	dec a			;aa13
	inc hl			;aa14
	jr z,L_AA1B		;aa15
	inc hl			;aa17
	dec a			;aa18
	jr nz,L_AA1D		;aa19
L_AA1B:
	ld (hl),000h		;aa1b
L_AA1D:
	ld (ix+006h),001h		;aa1d   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+014h),000h		;aa21
	ld a,(0c002h)		;aa25   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;aa28
	ld a,064h		;aa2a
	jr z,L_AA32		;aa2c
	ld a,r		;aa2e
	set 7,a		;aa30
L_AA32:
	ld (ix+07eh),a		;aa32
	ld (ix+00bh),002h		;aa35   ; el cuadro del actor = 0x02
	jp parado		;aa39   ; parado: las dos velocidades a cero
cuadro_tipo_19:		; lo de cada cuadro del tipo 19
	ld b,(ix+001h)		;aa3c   ; lee el paso del actor
	inc b			;aa3f
	djnz L_AA79		;aa40
	dec (ix+07eh)		;aa42
	ret nz			;aa45
	ld a,(0c130h)		;aa46   ; lee la sala
	cp 005h		;aa49
	ld hl,0c634h		;aa4b
	jr z,L_AA5F		;aa4e
	cp 007h		;aa50
	jr nz,L_AA61		;aa52
	ld a,(ix+00fh)		;aa54   ; lee el numero del actor entre los de su tipo
	dec a			;aa57
	inc hl			;aa58
	jr z,L_AA5F		;aa59
	inc hl			;aa5b
	dec a			;aa5c
	jr nz,L_AA61		;aa5d
L_AA5F:
	ld (hl),001h		;aa5f
L_AA61:
	ld (ix+07eh),008h		;aa61
	ld a,004h		;aa65
	call 04676h		;aa67   ; colores_del_tipo: copia los colores del tipo A (p05:975A) a la ficha IX, uno cada 5 bytes desde (ix+0x25)
	ld (ix+00eh),003h		;aa6a   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	ld hl,00200h		;aa6e
	ld de,00000h		;aa71
	call 05b64h		;aa74   ; velocidades: la velocidad X del actor = DE y la Y = HL
	jr L_AA91		;aa77
L_AA79:
	djnz L_AA95		;aa79
	dec (ix+07eh)		;aa7b
	ret nz			;aa7e
	ld (ix+07bh),000h		;aa7f
	ld (ix+07ch),0ffh		;aa83
	ld e,(ix+017h)		;aa87
	ld d,(ix+018h)		;aa8a
	inc de			;aa8d
	call 0592fh		;aa8e   ; punto_siguiente: el punto de DE como el siguiente del camino
L_AA91:
	inc (ix+001h)		;aa91   ; sube el paso del actor
	ret			;aa94
L_AA95:
	djnz L_AADB		;aa95
	call 09da9h		;aa97   ; cuadro_tipo_4: lo de cada cuadro del tipo 4
	ld a,(0c602h)		;aa9a   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;aa9d
	jp nz,058e9h		;aa9e   ; reaparece: crea en IX el actor de p06:A445 de la sala (salas < 0xBC)
	ld a,(ix+014h)		;aaa1
	cp (ix+07bh)		;aaa4
	ret z			;aaa7
	ld (ix+07bh),a		;aaa8
	inc (ix+07ch)		;aaab
	ld a,(ix+07ch)		;aaae
	cp (ix+013h)		;aab1
	ret c			;aab4
	dec (ix+07ch)		;aab5
	ld a,(ix+040h)		;aab8
	or a			;aabb
	jr z,L_AAC8		;aabc
	inc (ix+006h)		;aabe   ; sube si el actor se mueve (p01:7336)
	ld (ix+040h),000h		;aac1
	call 05a02h		;aac5   ; hacia_el_punto: direccion (ix+0x11) y velocidades hacia el punto (ix+0x15, ix+0x16) con la marcha (ix+0x43)
L_AAC8:
	ld hl,0fe00h		;aac8
	ld de,00000h		;aacb
	call 05b64h		;aace   ; velocidades: la velocidad X del actor = DE y la Y = HL
	ld (ix+07eh),008h		;aad1
	ld (ix+00bh),000h		;aad5   ; el cuadro del actor = 0x00
	jr L_AA91		;aad9
L_AADB:
	dec (ix+07eh)		;aadb
	ret nz			;aade
	ld a,(0c130h)		;aadf   ; lee la sala
	cp 005h		;aae2
	ld hl,0c634h		;aae4
	jr z,L_AAF8		;aae7
	cp 007h		;aae9
	jr nz,L_AAFA		;aaeb
	ld a,(ix+00fh)		;aaed   ; lee el numero del actor entre los de su tipo
	dec a			;aaf0
	inc hl			;aaf1
	jr z,L_AAF8		;aaf2
	inc hl			;aaf4
	dec a			;aaf5
	jr nz,L_AAFA		;aaf6
L_AAF8:
	ld (hl),000h		;aaf8
L_AAFA:
	xor a			;aafa
	ld (ix+00eh),a		;aafb   ; guarda con que choca el actor (bit 0 Snake, bit 1 proyectiles)
	ld c,a			;aafe
	call 05bc3h		;aaff
	call banderas_salas_5_7		;ab02   ; banderas_salas_5_7: la bandera de 0xC634 que toca en las salas 5 y 7
	jp 05ba6h		;ab05   ; paso_cero: el paso del actor (ix+1) a cero
crea_tipo_14:		; la creacion del tipo 14
	ld a,(ix+005h)		;ab08   ; lee la X del actor
	cp 0f2h		;ab0b
	jr z,L_AB37		;ab0d
	ld a,(0c136h)		;ab0f   ; lee la parada del ascensor
	cp 0f0h		;ab12
	jp z,07371h		;ab14
	ld (ix+012h),000h		;ab17   ; la cuenta de espera del actor = 0x00
	ld (ix+001h),001h		;ab1b   ; el paso del actor = 0x01
	ld (ix+006h),000h		;ab1f   ; si el actor se mueve (p01:7336) = 0x00
	ld a,(ix+005h)		;ab23   ; lee la X del actor
	ld (ix+013h),a		;ab26
	ld (ix+015h),01eh		;ab29
	ld a,002h		;ab2d
	ld (ix+011h),a		;ab2f   ; guarda la direccion del actor
	ld (ix+00bh),009h		;ab32   ; el cuadro del actor = 0x09
	ret			;ab36
L_AB37:
	ld (ix+001h),000h		;ab37   ; el paso del actor = 0x00
	ld (ix+006h),001h		;ab3b   ; si el actor se mueve (p01:7336) = 0x01
	ld a,003h		;ab3f
	ld (ix+011h),a		;ab41   ; guarda la direccion del actor
	call cuadro_por_a		;ab44   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	call parado		;ab47   ; parado: las dos velocidades a cero
	call velocidad_a90e		;ab4a   ; velocidad_a90e: las velocidades de la direccion (ix+0x11) de la tabla 0xA90E
	ld a,(ix+013h)		;ab4d
	cp 090h		;ab50
	ret z			;ab52
	ld (ix+012h),040h		;ab53   ; la cuenta de espera del actor = 0x40
	ld (ix+013h),050h		;ab57
	ret			;ab5b
cuadro_tipo_14:		; lo de cada cuadro del tipo 14
	ld a,(ix+001h)		;ab5c   ; lee el paso del actor
	cp 003h		;ab5f
	jr nc,L_AB6D		;ab61
	ld a,(0c602h)		;ab63   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;ab66
	jp nz,058e9h		;ab67   ; reaparece: crea en IX el actor de p06:A445 de la sala (salas < 0xBC)
	ld a,(ix+001h)		;ab6a   ; lee el paso del actor
L_AB6D:
	call 041eah		;ab6d   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_AB70: 5 destinos del despachador p00:41EA (call en p03:AB6D, el
;   indice en A): AB7A, ABBF, AC8C, ACA1, ACC0; lo leen p03:AB6D (10 bytes)
;   0xab70..0xab7a  (10 bytes)
DATA_tabla_AB70:
	defw 0ab7ah,0abbfh,0ac8ch,0aca1h,0acc0h	; ab70

; ======================================================================
; CODIGO 0xab7a..0xad55  (475 bytes)
; ======================================================================


L_AB7A:
	ld a,(0c182h)		;ab7a   ; lee la Y de Snake
	cp 03dh		;ab7d
	jr c,L_ABEA		;ab7f
	call cuadro_por_direccion		;ab81   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld a,(ix+005h)		;ab84   ; lee la X del actor
	cp (ix+013h)		;ab87
	jr z,L_ABA5		;ab8a
	ld a,(ix+013h)		;ab8c
	cp 090h		;ab8f
	ret z			;ab91
	dec (ix+012h)		;ab92   ; baja la cuenta de espera del actor
	ret nz			;ab95
	ld c,00eh		;ab96
	ld de,0f230h		;ab98
	call 0569ah		;ab9b   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	ld bc,00013h		;ab9e
	add hl,bc			;aba1
	ld (hl),090h		;aba2
	ret			;aba4
L_ABA5:
	ld (ix+012h),000h		;aba5   ; la cuenta de espera del actor = 0x00
	ld (ix+001h),001h		;aba9   ; el paso del actor = 0x01
	ld (ix+006h),000h		;abad   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+015h),01eh		;abb1
	ld a,002h		;abb5
	ld (ix+011h),a		;abb7   ; guarda la direccion del actor
	ld (ix+00bh),009h		;abba   ; el cuadro del actor = 0x09
	ret			;abbe
L_ABBF:
	ld a,(0c182h)		;abbf   ; lee la Y de Snake
	cp 03dh		;abc2
	jr c,L_ABEA		;abc4
	dec (ix+012h)		;abc6   ; baja la cuenta de espera del actor
	jp nz,L_AC63		;abc9
	ld (ix+001h),002h		;abcc   ; el paso del actor = 0x02
	ld (ix+006h),001h		;abd0   ; si el actor se mueve (p01:7336) = 0x01
	ld a,004h		;abd4
	ld (ix+011h),a		;abd6   ; guarda la direccion del actor
	call cuadro_por_a		;abd9   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	call velocidad_a90e		;abdc   ; velocidad_a90e: las velocidades de la direccion (ix+0x11) de la tabla 0xA90E
	ld a,(ix+013h)		;abdf
	cp 050h		;abe2
	ld a,001h		;abe4
	jp z,05cd9h		;abe6   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
	ret			;abe9
L_ABEA:
	push ix		;abea
	ld a,(0c184h)		;abec   ; lee la X de Snake
	cp (ix+005h)		;abef   ; compara con la X del actor
	ld a,00ah		;abf2
	jr c,L_ABF7		;abf4
	inc a			;abf6
L_ABF7:
	ld (ix+001h),003h		;abf7   ; el paso del actor = 0x03
	ld (ix+006h),000h		;abfb   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+00bh),a		;abff   ; guarda el cuadro del actor
	ld (ix+014h),00fh		;ac02
	ld bc,00080h		;ac06
	add ix,bc		;ac09
	ld (ix+001h),003h		;ac0b   ; el paso del actor = 0x03
	ld (ix+006h),000h		;ac0f   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+00bh),a		;ac13   ; guarda el cuadro del actor
	ld (ix+014h),00fh		;ac16
	ld a,(0c602h)		;ac1a   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;ac1d
	ret nz			;ac1e
	ld a,03ch		;ac1f
	call 07d27h		;ac21   ; pon_c602_con_cuenta: 0xC605 = A y pon_c602
	pop ix		;ac24
	ld h,010h		;ac26
pon_aviso:		; guarda el fondo en la pagina 1 y pone el dibujo de 0x80 sobre el actor (0xC60C)
	ld l,080h		;ac28
	ld a,(ix+003h)		;ac2a
	sub 018h		;ac2d
	and 0f8h		;ac2f
	ld e,a			;ac31
	ld a,(ix+005h)		;ac32
	add a,008h		;ac35
	and 0f8h		;ac37
	ld d,a			;ac39
	push hl			;ac3a
	ld hl,0c60ch		;ac3b
	ld (hl),e			;ac3e
	inc hl			;ac3f
	ld (hl),d			;ac40
	ex de,hl			;ac41
	call guarda_fondo_16		;ac42   ; guarda_fondo_16: copia 16 x 16 de HL a (0x60, 0x80) de la pagina 1
	pop hl			;ac45
	call pon_dibujo_16		;ac46   ; pon_dibujo_16: copia 16 x 16 de HL a DE con TIMP
	pop hl			;ac49
	jp 0984fh		;ac4a
guarda_fondo_16:		; copia 16 x 16 de HL a (0x60, 0x80) de la pagina 1
	push hl			;ac4d
	ld de,06080h		;ac4e
	ld bc,01010h		;ac51
	ld a,004h		;ac54
	call 04fcdh		;ac56   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;ac59
	ret			;ac5a
pon_dibujo_16:		; copia 16 x 16 de HL a DE con TIMP
	ld bc,01010h		;ac5b
	ld a,048h		;ac5e
	jp 05011h		;ac60   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
L_AC63:
	dec (ix+015h)		;ac63
	ret nz			;ac66
	ld a,r		;ac67
	and 00fh		;ac69
	add a,020h		;ac6b
	ld (ix+015h),a		;ac6d
	ld a,r		;ac70
	xor (ix+00ch)		;ac72   ; XOR con la cuenta de cuadros del actor
	and 001h		;ac75
	ld b,a			;ac77
	ld a,(ix+011h)		;ac78   ; lee la direccion del actor
	and 001h		;ac7b
	add a,b			;ac7d
	add a,(ix+011h)		;ac7e   ; le suma la direccion del actor
	and 003h		;ac81
	or a			;ac83
	ret z			;ac84
	inc a			;ac85
	ld (ix+011h),a		;ac86   ; guarda la direccion del actor
	jp cuadro_a_mas_1b		;ac89   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
L_AC8C:
	call cuadro_por_direccion		;ac8c   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld a,(0c182h)		;ac8f   ; lee la Y de Snake
	cp 03dh		;ac92
	ret nc			;ac94
	ld a,(0c184h)		;ac95   ; lee la X de Snake
	add a,010h		;ac98
	cp (ix+005h)		;ac9a   ; compara con la X del actor
	jp nc,L_ABEA		;ac9d
	ret			;aca0
L_ACA1:
	dec (ix+014h)		;aca1
	ret nz			;aca4
	ld ix,0d080h		;aca5
	call 058e9h		;aca9   ; reaparece: crea en IX el actor de p06:A445 de la sala (salas < 0xBC)
	ld ix,0d100h		;acac
	ld (ix+001h),004h		;acb0
	ld (ix+006h),001h		;acb4
	ld a,004h		;acb8
	ld (ix+011h),a		;acba
	ld (ix+00ah),a		;acbd
L_ACC0:
	jp cuadro_por_direccion		;acc0   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
crea_tipo_13:		; la creacion del tipo 13
	ld (ix+011h),001h		;acc3   ; la direccion del actor = 0x01
	ld (ix+015h),003h		;acc7
	ld a,(0c130h)		;accb   ; lee la sala
	cp 0ceh		;acce
	jr z,L_AD19		;acd0
	ld hl,0c602h		;acd2   ; apunta a la bandera 0xC602 (refuerzos y musica)
	ld (hl),001h		;acd5
	ld hl,00a80h		;acd7
	ld (0c605h),hl		;acda   ; guarda la cuenta de los refuerzos y el byte siguiente (16 bits)
	sub 05ah		;acdd
	jr z,L_ACFA		;acdf
	dec a			;ace1
	jr z,L_AD0A		;ace2
	ld a,(0c182h)		;ace4   ; lee la Y de Snake
	rla			;ace7
	jr c,L_ACEE		;ace8
	ld (ix+003h),0a8h		;acea   ; la Y del actor = 0xA8
L_ACEE:
	ld a,(ix+005h)		;acee   ; lee la X del actor
	cp 098h		;acf1
	ld b,003h		;acf3
	jr z,L_AD14		;acf5
	inc b			;acf7
	jr L_AD14		;acf8
L_ACFA:
	ld (ix+014h),000h		;acfa
	ld a,(0c182h)		;acfe   ; lee la Y de Snake
	rla			;ad01
	jr c,L_AD27		;ad02
	ld (ix+003h),090h		;ad04   ; la Y del actor = 0x90
	jr L_AD27		;ad08
L_AD0A:
	ld a,(ix+005h)		;ad0a   ; lee la X del actor
	cp 078h		;ad0d
	ld b,004h		;ad0f
	jr z,L_AD14		;ad11
	dec b			;ad13
L_AD14:
	ld (ix+014h),b		;ad14
	jr L_AD27		;ad17
L_AD19:
	ld (ix+014h),000h		;ad19
	ld a,(0c182h)		;ad1d   ; lee la Y de Snake
	rla			;ad20
	jr nc,L_AD27		;ad21
	ld (ix+003h),038h		;ad23   ; la Y del actor = 0x38
L_AD27:
	bit 7,(ix+003h)		;ad27   ; mira el bit 7 de la Y del actor
	jr nz,L_AD31		;ad2b
	ld (ix+011h),002h		;ad2d   ; la direccion del actor = 0x02
L_AD31:
	call cuadro_mas_1b		;ad31   ; cuadro_mas_1b: cuadro = (ix+0x11) + 7 + (ix+0x1B)
	call parado		;ad34   ; parado: las dos velocidades a cero
	ld a,(ix+005h)		;ad37   ; lee la X del actor
	ld (ix+013h),a		;ad3a
	jp espera_azar_64		;ad3d   ; espera_azar_64: (ix+0x12) = 1-64 al azar
cuadro_tipo_13:		; lo de cada cuadro del tipo 13
	ld a,(0c182h)		;ad40   ; lee la Y de Snake
	sub (ix+003h)		;ad43   ; le resta la Y del actor
	add a,010h		;ad46
	cp 021h		;ad48
	ld a,00ah		;ad4a
	jp c,058fdh		;ad4c   ; pon_tipo: pone el tipo A en IX y lo prepara (p03:B3F8, p02:8334, p03:A923, colores)
	ld a,(ix+001h)		;ad4f   ; lee el paso del actor
	call 041eah		;ad52   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_AD55: 4 destinos del despachador p00:41EA (call en p03:AD52, el
;   indice en A): AD5D, AD8D, ADAB, ADD7; lo leen p03:AD52 (8 bytes)
;   0xad55..0xad5d  (8 bytes)
DATA_tabla_AD55:
	defw 0ad5dh,0ad8dh,0adabh,0add7h	; ad55  -> L_AD5D L_AD8D L_ADAB L_ADD7

; ======================================================================
; CODIGO 0xad5d..0xae8f  (306 bytes)
; ======================================================================


L_AD5D:
	dec (ix+012h)		;ad5d   ; baja la cuenta de espera del actor
	ret nz			;ad60
	dec (ix+015h)		;ad61
	ld a,00ah		;ad64
	jp z,058fdh		;ad66   ; pon_tipo: pone el tipo A en IX y lo prepara (p03:B3F8, p02:8334, p03:A923, colores)
	inc (ix+001h)		;ad69   ; sube el paso del actor
	ld (ix+006h),001h		;ad6c   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+012h),00ah		;ad70   ; la cuenta de espera del actor = 0x0A
	ld a,(ix+014h)		;ad74
	or a			;ad77
	jp nz,L_AD84		;ad78
	ld a,r		;ad7b
	xor (ix+00ch)		;ad7d   ; XOR con la cuenta de cuadros del actor
	and 001h		;ad80
	add a,003h		;ad82
L_AD84:
	ld (ix+011h),a		;ad84   ; guarda la direccion del actor
	call cuadro_por_a		;ad87   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	jp velocidad_a916_dir		;ad8a   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
L_AD8D:
	call cuadro_por_direccion		;ad8d   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	dec (ix+012h)		;ad90   ; baja la cuenta de espera del actor
	ret nz			;ad93
	inc (ix+001h)		;ad94   ; sube el paso del actor
	ld (ix+006h),000h		;ad97   ; si el actor se mueve (p01:7336) = 0x00
	call espera_azar_64		;ad9b   ; espera_azar_64: (ix+0x12) = 1-64 al azar
	bit 7,(ix+003h)		;ad9e   ; mira el bit 7 de la Y del actor
	ld a,001h		;ada2
	jp nz,cuadro_a_mas_1b		;ada4   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
	inc a			;ada7
	jp cuadro_a_mas_1b		;ada8   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
L_ADAB:
	dec (ix+012h)		;adab   ; baja la cuenta de espera del actor
	jp z,L_ADBC		;adae
	ld a,(ix+00ch)		;adb1   ; lee la cuenta de cuadros del actor
	and 00fh		;adb4
	ret nz			;adb6
	ld c,03bh		;adb7
	jp crea_encima		;adb9   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
L_ADBC:
	inc (ix+001h)		;adbc   ; sube el paso del actor
	ld a,(ix+00ah)		;adbf   ; lee la velocidad X del actor (alta)
	neg		;adc2
	ld (ix+00ah),a		;adc4   ; guarda la velocidad X del actor (alta)
	ld (ix+006h),001h		;adc7   ; si el actor se mueve (p01:7336) = 0x01
	ld a,(ix+011h)		;adcb   ; lee la direccion del actor
	call 0835fh		;adce   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
	ld (ix+011h),a		;add1   ; guarda la direccion del actor
	jp cuadro_por_a		;add4   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
L_ADD7:
	call cuadro_por_direccion		;add7   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld a,(ix+005h)		;adda   ; lee la X del actor
	sub (ix+013h)		;addd
	ret nz			;ade0
	ld (ix+001h),a		;ade1   ; guarda el paso del actor
	ld (ix+006h),a		;ade4   ; guarda si el actor se mueve (p01:7336)
	bit 7,(ix+003h)		;ade7   ; mira el bit 7 de la Y del actor
	ld a,001h		;adeb
	jp nz,L_ADF1		;aded
	inc a			;adf0
L_ADF1:
	call cuadro_a_mas_1b		;adf1   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
espera_azar_64:		; (ix+0x12) = 1-64 al azar
	ld a,r		;adf4
	xor (ix+00ch)		;adf6   ; XOR con la cuenta de cuadros del actor
	and 03fh		;adf9
	inc a			;adfb
	ld (ix+012h),a		;adfc   ; guarda la cuenta de espera del actor
	ret			;adff
crea_tipo_58:		; la creacion del tipo 58
	ld hl,0ffc0h		;ae00   ; la X al azar: -0x40 a +0x3F...
	ld a,r		;ae03
	and 07fh		;ae05
	ld d,000h		;ae07
	ld e,a			;ae09
	add hl,de			;ae0a
	bit 7,(ix+005h)		;ae0b   ; mira el bit 7 de la X del actor
	ld de,0fb00h		;ae0f   ; ...la Y a 5 puntos hacia el centro
	jp nz,L_AE32		;ae12
	ld d,005h		;ae15
	jp L_AE32		;ae17
crea_tipo_59:		; la creacion del tipo 59
	ld de,0ffc0h		;ae1a   ; la Y al azar: -0x40 a +0x3F...
	ld a,r		;ae1d
	and 07fh		;ae1f
	ld h,000h		;ae21
	ld l,a			;ae23
	add hl,de			;ae24
	ex de,hl			;ae25
	bit 7,(ix+003h)		;ae26   ; mira el bit 7 de la Y del actor
	ld hl,0fb00h		;ae2a   ; ...la X a 5 puntos hacia el centro
	jp nz,L_AE32		;ae2d
	ld h,005h		;ae30
L_AE32:
	call 05b64h		;ae32   ; velocidades: la velocidad X del actor = DE y la Y = HL
	ld (ix+006h),001h		;ae35   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00eh),001h		;ae39   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+00bh),072h		;ae3d   ; el cuadro del actor = 0x72
	ld a,005h		;ae41   ; el sonido 5
	jp 0427ch		;ae43   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
crea_tipo_57:		; la creacion del tipo 57
	ld a,(0c527h)		;ae46
	or a			;ae49
	jp nz,07371h		;ae4a
	ld a,03eh		;ae4d
	ld (0c159h),a		;ae4f   ; guarda la musica que suena
	call 0427ch		;ae52   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	inc (ix+006h)		;ae55   ; sube si el actor se mueve (p01:7336)
	call parado		;ae58   ; parado: las dos velocidades a cero
	ld a,r		;ae5b
	and 00fh		;ae5d
	inc a			;ae5f
	ld (ix+012h),a		;ae60   ; guarda la cuenta de espera del actor
	bit 7,(ix+003h)		;ae63   ; mira el bit 7 de la Y del actor
	ld a,009h		;ae67
	ld b,003h		;ae69
	jp z,L_AE79		;ae6b
	inc a			;ae6e
	ld b,001h		;ae6f
	bit 7,(ix+005h)		;ae71   ; mira el bit 7 de la X del actor
	jp nz,L_AE79		;ae75
	inc a			;ae78
L_AE79:
	ld (ix+015h),b		;ae79
	jp L_AF25		;ae7c
cuadro_tipo_57:		; lo de cada cuadro del tipo 57
	bit 0,(ix+016h)		;ae7f
	jp nz,cuadro_tipo_10		;ae83   ; cuadro_tipo_10: lo de cada cuadro del tipo 10
	call snake_a_tiro		;ae86   ; snake_a_tiro: si Snake esta a menos de 0x20 en la otra coordenada
	ld a,(ix+001h)		;ae89   ; lee el paso del actor
	call 041eah		;ae8c   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_AE8F: 4 destinos del despachador p00:41EA (call en p03:AE8C, el
;   indice en A): AE97, AEB6, AEDF, AEFA; lo leen p03:AE8C (8 bytes)
;   0xae8f..0xae97  (8 bytes)
DATA_tabla_AE8F:
	defw 0ae97h,0aeb6h,0aedfh,0aefah	; ae8f  -> L_AE97 L_AEB6 L_AEDF L_AEFA

; ======================================================================
; CODIGO 0xae97..0xb14c  (693 bytes)
; ======================================================================


L_AE97:
	dec (ix+012h)		;ae97   ; baja la cuenta de espera del actor
	ret nz			;ae9a
	ld (ix+001h),001h		;ae9b   ; el paso del actor = 0x01
	ld (ix+012h),00eh		;ae9f   ; la cuenta de espera del actor = 0x0E
	ld a,r		;aea3
	xor (ix+00ch)		;aea5   ; XOR con la cuenta de cuadros del actor
	and 001h		;aea8
	add a,(ix+015h)		;aeaa
	ld (ix+011h),a		;aead   ; guarda la direccion del actor
	call cuadro_por_a		;aeb0   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	jp velocidad_a916_dir		;aeb3   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
L_AEB6:
	call cuadro_por_direccion		;aeb6   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	dec (ix+012h)		;aeb9   ; baja la cuenta de espera del actor
	ret nz			;aebc
	ld (ix+001h),002h		;aebd   ; el paso del actor = 0x02
	call parado		;aec1   ; parado: las dos velocidades a cero
	ld a,r		;aec4
	xor (ix+00ch)		;aec6   ; XOR con la cuenta de cuadros del actor
	and 007h		;aec9
	inc a			;aecb
	ld (ix+012h),a		;aecc   ; guarda la cuenta de espera del actor
	call cuadro_por_lado		;aecf   ; cuadro_por_lado: cuadro 9, 10 u 11 segun (ix+0x15) y el lado de la sala
	bit 1,(ix+015h)		;aed2
	ld c,03bh		;aed6
	jp nz,crea_encima		;aed8   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
	dec c			;aedb
	jp crea_encima		;aedc   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
L_AEDF:
	dec (ix+012h)		;aedf   ; baja la cuenta de espera del actor
	ret nz			;aee2
	ld (ix+001h),003h		;aee3   ; el paso del actor = 0x03
	ld (ix+012h),00eh		;aee7   ; la cuenta de espera del actor = 0x0E
	ld a,(ix+011h)		;aeeb   ; lee la direccion del actor
	call 0835fh		;aeee   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
	ld (ix+011h),a		;aef1   ; guarda la direccion del actor
	call cuadro_por_a		;aef4   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	jp velocidad_a916_dir		;aef7   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
L_AEFA:
	call cuadro_por_direccion		;aefa   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	dec (ix+012h)		;aefd   ; baja la cuenta de espera del actor
	ret nz			;af00
	ld (ix+001h),000h		;af01   ; el paso del actor = 0x00
	call parado		;af05   ; parado: las dos velocidades a cero
	ld a,r		;af08
	xor (ix+00ch)		;af0a   ; XOR con la cuenta de cuadros del actor
	and 00fh		;af0d
	inc a			;af0f
	ld (ix+012h),a		;af10   ; guarda la cuenta de espera del actor
cuadro_por_lado:		; cuadro 9, 10 u 11 segun (ix+0x15) y el lado de la sala
	bit 1,(ix+015h)		;af13
	ld a,009h		;af17
	jp nz,L_AF25		;af19
	inc a			;af1c
	bit 7,(ix+005h)		;af1d   ; mira el bit 7 de la X del actor
	jp nz,L_AF25		;af21
	inc a			;af24
L_AF25:
	ld (ix+00bh),a		;af25   ; guarda el cuadro del actor
	ret			;af28
snake_a_tiro:		; si Snake esta a menos de 0x20 en la otra coordenada
	bit 1,(ix+015h)		;af29
	jp z,L_AF3D		;af2d
	ld a,(0c182h)		;af30   ; lee la Y de Snake
	sub (ix+003h)		;af33   ; le resta la Y del actor
	add a,020h		;af36
	cp 041h		;af38
	ret nc			;af3a
	jr L_AF48		;af3b
L_AF3D:
	ld a,(0c184h)		;af3d   ; lee la X de Snake
	sub (ix+005h)		;af40   ; le resta la X del actor
	add a,020h		;af43
	cp 041h		;af45
	ret nc			;af47
L_AF48:
	ld (ix+016h),001h		;af48
	ld a,039h		;af4c
	pop hl			;af4e
	jp 058fdh		;af4f   ; pon_tipo: pone el tipo A en IX y lo prepara (p03:B3F8, p02:8334, p03:A923, colores)
crea_tipo_7:		; la creacion del tipo 7
	ld a,007h		;af52
	call 05bafh		;af54   ; cuenta_tipo: A = cuantos actores del tipo A hay
	dec a			;af57
	ld (ix+00fh),a		;af58   ; guarda el numero del actor entre los de su tipo
	ld h,(ix+005h)		;af5b   ; lee la X del actor
	ld l,(ix+003h)		;af5e   ; lee la Y del actor
	call sitio_de_mina		;af61   ; sitio_de_mina: H, L - 8 y A = (ix+0x0F) x 16
	ld d,a			;af64
	ld e,0a0h		;af65
	ld bc,01010h		;af67
	ld a,010h		;af6a
	call 05011h		;af6c   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	ld a,(0c135h)		;af6f   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 007h		;af72
	ret nz			;af74
punto_de_mina:		; copia 5 x 5 de (0x95, 0x65) de la pagina 1 a (Y - 3, X - 3) con TIMP
	ld a,(ix+005h)		;af75   ; lee la X del actor
	sub 003h		;af78
	ld d,a			;af7a
	ld a,(ix+003h)		;af7b   ; lee la Y del actor
	sub 003h		;af7e
	ld e,a			;af80
	ld hl,09565h		;af81
	ld bc,00505h		;af84
	ld a,048h		;af87
	jp 05011h		;af89   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
sitio_de_mina:		; H, L - 8 y A = (ix+0x0F) x 16
	ld a,h			;af8c   ; H = la X - 8
	sub 008h		;af8d
	ld h,a			;af8f
	ld a,l			;af90   ; L = la Y - 8
	sub 008h		;af91
	ld l,a			;af93
	ld a,(ix+00fh)		;af94   ; lee el numero del actor entre los de su tipo
	rlca			;af97   ; x 16
	rlca			;af98
	rlca			;af99
	rlca			;af9a
	ret			;af9b
minas_con_detec:		; con DETEC (objeto 7) marca las minas (tipo 7)
	ld a,(0c135h)		;af9c   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 007h		;af9f
	ret nz			;afa1
	ld ix,0d000h		;afa2   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;afa6
L_AFA8:
	ld a,(ix+000h)		;afa8   ; lee el tipo del actor
	cp 007h		;afab
	call z,marca_mina		;afad   ; marca_mina: el punto de la mina IX
	ld de,00080h		;afb0
	add ix,de		;afb3
	djnz L_AFA8		;afb5
	ret			;afb7
marca_mina:		; el punto de la mina IX
	ld l,(ix+003h)		;afb8   ; lee la Y del actor
	ld h,(ix+005h)		;afbb   ; lee la X del actor
	push bc			;afbe
	call punto_de_mina		;afbf   ; punto_de_mina: copia 5 x 5 de (0x95, 0x65) de la pagina 1 a (Y - 3, X - 3) con TIMP
	pop bc			;afc2
	ret			;afc3
crea_tipo_20:		; la creacion del tipo 20
	call 08334h		;afc4   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	ld (ix+011h),a		;afc7   ; guarda la direccion del actor
	call cuadro_mas_54		;afca   ; cuadro_mas_54: cuadro = A + 0x54
L_AFCD:
	call parado		;afcd   ; parado: las dos velocidades a cero
	ld (ix+006h),000h		;afd0   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+012h),020h		;afd4   ; la cuenta de espera del actor = 0x20
	ld (ix+014h),000h		;afd8
	ld (ix+015h),0ffh		;afdc
	ld (ix+00eh),002h		;afe0   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x02
	ld a,(ix+002h)		;afe4
	ld (ix+016h),a		;afe7
	ld a,(ix+003h)		;afea   ; lee la Y del actor
	ld (ix+017h),a		;afed
	ld a,(ix+004h)		;aff0
	ld (ix+018h),a		;aff3
	ld a,(ix+005h)		;aff6   ; lee la X del actor
	ld (ix+019h),a		;aff9
	ld a,(ix+000h)		;affc   ; lee el tipo del actor
	cp 015h		;afff
	ld (ix+000h),014h		;b001   ; el tipo del actor = 0x14
	ld (ix+020h),004h		;b005   ; cuantos sprites tiene el actor = 0x04
	ret z			;b009
	ld (ix+020h),006h		;b00a   ; cuantos sprites tiene el actor = 0x06
	ret			;b00e
cuadro_tipo_20:		; lo de cada cuadro del tipo 20
	call cuadro_dir_mas_58		;b00f   ; cuadro_dir_mas_58: cuadro = (ix+0x11) + 0x58
	dec (ix+012h)		;b012   ; baja la cuenta de espera del actor
	jr z,L_B025		;b015
	ld a,(ix+015h)		;b017
	add a,(ix+003h)		;b01a   ; le suma la Y del actor
	ld (ix+003h),a		;b01d   ; guarda la Y del actor
	ld (ix+020h),004h		;b020   ; cuantos sprites tiene el actor = 0x04
	ret			;b024
L_B025:
	ld (ix+000h),016h		;b025   ; el tipo del actor = 0x16
	ld (ix+006h),001h		;b029   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+012h),02dh		;b02d   ; la cuenta de espera del actor = 0x2D
	ld (ix+020h),006h		;b031   ; cuantos sprites tiene el actor = 0x06
	jp L_B0AE		;b035
crea_tipo_21:		; la creacion del tipo 21
	ld a,(0c136h)		;b038   ; lee la parada del ascensor
	cp 0a0h		;b03b
	jp z,07371h		;b03d
	ld (ix+006h),001h		;b040   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00eh),002h		;b044   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x02
	ld a,001h		;b048
	ld (ix+011h),a		;b04a   ; guarda la direccion del actor
	call cuadro_mas_58		;b04d   ; cuadro_mas_58: cuadro = A + 0x58
	jp parado		;b050   ; parado: las dos velocidades a cero
cuadro_tipo_21:		; lo de cada cuadro del tipo 21
	bit 0,(ix+001h)		;b053   ; mira el bit 0 de el paso del actor
	jr nz,L_B072		;b057
	ld (ix+020h),004h		;b059   ; cuantos sprites tiene el actor = 0x04
	ld (ix+001h),001h		;b05d   ; el paso del actor = 0x01
	ld (ix+008h),002h		;b061   ; la velocidad Y del actor (alta) = 0x02
	call cuadro_dir_mas_58		;b065   ; cuadro_dir_mas_58: cuadro = (ix+0x11) + 0x58
	ld a,(0c602h)		;b068   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;b06b
	ret nz			;b06c
	ld a,05ah		;b06d
	jp 07d27h		;b06f   ; pon_c602_con_cuenta: 0xC605 = A y pon_c602
L_B072:
	ld a,(ix+003h)		;b072   ; lee la Y del actor
	cp 086h		;b075
	ret c			;b077
	ld a,015h		;b078
	call 0427ch		;b07a   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld de,04470h		;b07d
	ld c,02ch		;b080
	call 0569ah		;b082   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	call 08334h		;b085   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	ld (ix+011h),a		;b088   ; guarda la direccion del actor
	call cuadro_mas_58		;b08b   ; cuadro_mas_58: cuadro = A + 0x58
	jp L_AFCD		;b08e
crea_tipo_22:		; la creacion del tipo 22
	ld (ix+006h),001h		;b091   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00eh),002h		;b095   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x02
	ld a,003h		;b099
	ld (ix+011h),a		;b09b   ; guarda la direccion del actor
	call cuadro_mas_58		;b09e   ; cuadro_mas_58: cuadro = A + 0x58
	call parado		;b0a1   ; parado: las dos velocidades a cero
	call tipo_22_altura		;b0a4   ; tipo_22_altura: HL = la velocidad Y y B = 0x60 o 0x70 por el bit 7 de (ix+0x0C)
	ld (ix+012h),02dh		;b0a7   ; la cuenta de espera del actor = 0x2D
	call tipo_22_por_sala		;b0ab   ; tipo_22_por_sala: valores del tipo 22 segun la sala (0xD8, 0xBB, 0x9A, 0x58-0x5C)
L_B0AE:
	ld a,(0c602h)		;b0ae   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;b0b1
	ret nz			;b0b2
	ld a,01eh		;b0b3
	jp 07d27h		;b0b5   ; pon_c602_con_cuenta: 0xC605 = A y pon_c602
cuadro_tipo_22:		; lo de cada cuadro del tipo 22
	call 08334h		;b0b8   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	ld (ix+011h),a		;b0bb   ; guarda la direccion del actor
	call cuadro_mas_58		;b0be   ; cuadro_mas_58: cuadro = A + 0x58
	call tipo_22_altura		;b0c1   ; tipo_22_altura: HL = la velocidad Y y B = 0x60 o 0x70 por el bit 7 de (ix+0x0C)
	dec (ix+012h)		;b0c4   ; baja la cuenta de espera del actor
	ret nz			;b0c7
	ld a,r		;b0c8
	xor (ix+00ch)		;b0ca   ; XOR con la cuenta de cuadros del actor
	and 00fh		;b0cd
	add a,01eh		;b0cf
	ld (ix+012h),a		;b0d1   ; guarda la cuenta de espera del actor
	ld c,03dh		;b0d4
	jp crea_encima		;b0d6   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
L_B0D9:
	ld a,(ix+011h)		;b0d9   ; lee la direccion del actor
cuadro_mas_54:		; cuadro = A + 0x54
	add a,054h		;b0dc
	ld (ix+00bh),a		;b0de   ; guarda el cuadro del actor
	ret			;b0e1
cuadro_dir_mas_58:		; cuadro = (ix+0x11) + 0x58
	ld a,(ix+011h)		;b0e2   ; lee la direccion del actor
cuadro_mas_58:		; cuadro = A + 0x58
	add a,058h		;b0e5
	ld (ix+00bh),a		;b0e7   ; guarda el cuadro del actor
	ret			;b0ea
tipo_22_altura:		; HL = la velocidad Y y B = 0x60 o 0x70 por el bit 7 de (ix+0x0C)
	ld l,(ix+007h)		;b0eb   ; lee la velocidad Y del actor
	ld h,(ix+008h)		;b0ee   ; lee la velocidad Y del actor (alta)
	bit 7,(ix+00ch)		;b0f1   ; mira el bit 7 de la cuenta de cuadros del actor
	ld b,060h		;b0f5
	jr z,L_B0FB		;b0f7
	ld b,070h		;b0f9
L_B0FB:
	ld a,(ix+003h)		;b0fb   ; lee la Y del actor
	cp b			;b0fe
	ld bc,00018h		;b0ff
	jr c,L_B107		;b102
	ld bc,0ffe8h		;b104
L_B107:
	add hl,bc			;b107
	ld (ix+007h),l		;b108   ; guarda la velocidad Y del actor
	ld (ix+008h),h		;b10b   ; guarda la velocidad Y del actor (alta)
	ld l,(ix+009h)		;b10e   ; lee la velocidad X del actor
	ld h,(ix+00ah)		;b111   ; lee la velocidad X del actor (alta)
	bit 7,(ix+00ch)		;b114   ; mira el bit 7 de la cuenta de cuadros del actor
	ld b,078h		;b118
	jr z,L_B11E		;b11a
	ld b,088h		;b11c
L_B11E:
	ld a,(ix+005h)		;b11e   ; lee la X del actor
	cp b			;b121
	ld bc,00030h		;b122
	jr c,L_B12A		;b125
	ld bc,0ffd0h		;b127
L_B12A:
	add hl,bc			;b12a
	ld (ix+009h),l		;b12b   ; guarda la velocidad X del actor
	ld (ix+00ah),h		;b12e   ; guarda la velocidad X del actor (alta)
	ret			;b131
crea_tipo_31:		; la creacion del tipo 31
	ld (ix+001h),002h		;b132   ; el paso del actor = 0x02
	ld (ix+012h),008h		;b136   ; la cuenta de espera del actor = 0x08
	ld a,r		;b13a
	ld hl,0c003h		;b13c   ; apunta a la cuenta de cuadros
	xor (hl)			;b13f
	and 003h		;b140
	inc a			;b142
	jp cuadro_mas_60		;b143   ; cuadro_mas_60: cuadro = 2 x A + 0x60, +1 con el bit 2 de (ix+0x0C)
cuadro_tipo_31:		; lo de cada cuadro del tipo 31
	ld a,(ix+001h)		;b146   ; lee el paso del actor
	call 041eah		;b149   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_B14C: 3 destinos del despachador p00:41EA (call en p03:B149, el
;   indice en A): B152, B192, B1A5; lo leen p03:B149 (6 bytes)
;   0xb14c..0xb152  (6 bytes)
DATA_tabla_B14C:
	defw 0b152h,0b192h,0b1a5h	; b14c  -> L_B152 L_B192 L_B1A5

; ======================================================================
; CODIGO 0xb152..0xb1de  (140 bytes)
; ======================================================================


L_B152:
	call lejos_de_snake_x		;b152   ; lejos_de_snake_x: la distancia en X a Snake
	cp 051h		;b155
	jr c,L_B176		;b157
	call cerca_del_centro		;b159   ; cerca_del_centro: acarreo si el actor esta en el recuadro (Y + 0x50 < 0x61, X + 0x10 < 0x21)
	jr c,L_B184		;b15c
	dec (ix+012h)		;b15e   ; baja la cuenta de espera del actor
	ret nz			;b161
L_B162:
	call espera_azar_5		;b162   ; espera_azar_5: (ix+0x12) = 5-8 al azar
	call azar_0_3		;b165   ; azar_0_3: A = (R XOR (ix+0x0C)) AND 3
	inc a			;b168
	ld (ix+011h),a		;b169   ; guarda la direccion del actor
	call cuadro_mas_60		;b16c   ; cuadro_mas_60: cuadro = 2 x A + 0x60, +1 con el bit 2 de (ix+0x0C)
	call cerca_del_centro		;b16f   ; cerca_del_centro: acarreo si el actor esta en el recuadro (Y + 0x50 < 0x61, X + 0x10 < 0x21)
	jr c,L_B184		;b172
	jr L_B1CE		;b174
L_B176:
	ld (ix+001h),001h		;b176   ; el paso del actor = 0x01
	ld (ix+012h),008h		;b17a   ; la cuenta de espera del actor = 0x08
	call 05c25h		;b17e   ; hacia_snake: HL y DE = la velocidad de IX hacia Snake con el modulo 0x80 (+ 8 x 0xC152)
	jp 05b64h		;b181   ; velocidades: la velocidad X del actor = DE y la Y = HL
L_B184:
	ld a,(ix+011h)		;b184   ; lee la direccion del actor
	call 0835fh		;b187   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
	ld (ix+011h),a		;b18a   ; guarda la direccion del actor
	call cuadro_mas_60		;b18d   ; cuadro_mas_60: cuadro = 2 x A + 0x60, +1 con el bit 2 de (ix+0x0C)
	jr L_B1CE		;b190
L_B192:
	call cerca_del_centro		;b192   ; cerca_del_centro: acarreo si el actor esta en el recuadro (Y + 0x50 < 0x61, X + 0x10 < 0x21)
	jr c,L_B19B		;b195
	dec (ix+012h)		;b197   ; baja la cuenta de espera del actor
	ret nz			;b19a
L_B19B:
	inc (ix+001h)		;b19b   ; sube el paso del actor
	ld (ix+012h),014h		;b19e   ; la cuenta de espera del actor = 0x14
	jp parado		;b1a2   ; parado: las dos velocidades a cero
L_B1A5:
	dec (ix+012h)		;b1a5   ; baja la cuenta de espera del actor
	ret nz			;b1a8
	ld (ix+001h),000h		;b1a9   ; el paso del actor = 0x00
	ld (ix+006h),001h		;b1ad   ; si el actor se mueve (p01:7336) = 0x01
	jr L_B162		;b1b1
espera_azar_5:		; (ix+0x12) = 5-8 al azar
	call azar_0_3		;b1b3   ; azar_0_3: A = (R XOR (ix+0x0C)) AND 3
	add a,005h		;b1b6
	ld (ix+012h),a		;b1b8   ; guarda la cuenta de espera del actor
	ret			;b1bb
L_B1BC:
	ld a,(ix+011h)		;b1bc   ; lee la direccion del actor
cuadro_mas_60:		; cuadro = 2 x A + 0x60, +1 con el bit 2 de (ix+0x0C)
	add a,a			;b1bf
	add a,060h		;b1c0
	bit 2,(ix+00ch)		;b1c2   ; mira el bit 2 de la cuenta de cuadros del actor
	jp z,L_B1CA		;b1c6
	inc a			;b1c9
L_B1CA:
	ld (ix+00bh),a		;b1ca   ; guarda el cuadro del actor
	ret			;b1cd
L_B1CE:
	ld a,(ix+011h)		;b1ce   ; lee la direccion del actor
	ld de,0b1dch		;b1d1
	call 042b4h		;b1d4   ; palabra_a: DE = la palabra A de la tabla DE
	ld (ix+008h),e		;b1d7   ; guarda la velocidad Y del actor (alta)
	ld (ix+00ah),d		;b1da   ; guarda la velocidad X del actor (alta)
	ret			;b1dd

; ----------------------------------------------------------------------
; DATOS velocidad_b1de: 4 parejas [dy][dx] (-1, 1) que p03:B1D1 lee en 0xB1DC
;   + 2 x (ix+0x11) con L_42B4
;   0xb1de..0xb1e6  (8 bytes)
DATA_velocidad_b1de:
	defb 0ffh,0ffh	; b1de
	defb 001h,001h	; b1e0
	defb 001h,0ffh	; b1e2
	defb 0ffh,001h	; b1e4

; ======================================================================
; CODIGO 0xb1e6..0xb204  (30 bytes)
; ======================================================================


cerca_del_centro:		; acarreo si el actor esta en el recuadro (Y + 0x50 < 0x61, X + 0x10 < 0x21)
	ld a,(ix+003h)		;b1e6   ; lee la Y del actor
	add a,050h		;b1e9
	cp 061h		;b1eb
	ret c			;b1ed
	ld a,(ix+005h)		;b1ee   ; lee la X del actor
	add a,010h		;b1f1
	cp 021h		;b1f3
	ret			;b1f5
cuadro_tipo_18:		; lo de cada cuadro del tipo 18
	ld a,(ix+003h)		;b1f6   ; lee la Y del actor
	cp 0a0h		;b1f9
	jp nc,velocidad_y_cero		;b1fb   ; velocidad_y_cero: la velocidad Y a cero
	ld a,(ix+001h)		;b1fe   ; lee el paso del actor
	call 041eah		;b201   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_B204: 7 destinos del despachador p00:41EA (call en p03:B201, el
;   indice en A): B212, B21F, B212, B230, B212, B239, B277; lo leen p03:B201
;   (14 bytes)
;   0xb204..0xb212  (14 bytes)
DATA_tabla_B204:
	defw 0b212h,0b21fh,0b212h,0b230h,0b212h,0b239h,0b277h	; b204

; ======================================================================
; CODIGO 0xb212..0xb296  (132 bytes)
; ======================================================================


L_B212:
	dec (ix+013h)		;b212
	ret nz			;b215
	call velocidad_y_cero		;b216   ; velocidad_y_cero: la velocidad Y a cero
	ld (ix+013h),010h		;b219
	jr L_B22D		;b21d
L_B21F:
	dec (ix+013h)		;b21f
	ret nz			;b222
	ld de,00080h		;b223
L_B226:
	call 05b4eh		;b226   ; velocidad_y: la velocidad Y del actor (ix+7, ix+8) = DE
	ld (ix+013h),030h		;b229
L_B22D:
	jp 05ba2h		;b22d   ; paso_siguiente: sube el paso del actor (ix+1)
L_B230:
	dec (ix+013h)		;b230
	ret nz			;b233
	ld de,000c0h		;b234
	jr L_B226		;b237
L_B239:
	dec (ix+013h)		;b239
	ret nz			;b23c
	ld de,000e0h		;b23d
	jr L_B226		;b240
velocidad_y_cero:		; la velocidad Y a cero
	ld de,00000h		;b242
	jp 05b4eh		;b245   ; velocidad_y: la velocidad Y del actor (ix+7, ix+8) = DE
crea_tipo_18:		; la creacion del tipo 18
	ld a,(0c622h)		;b248
	or a			;b24b
	jp nz,0737bh		;b24c   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld hl,0c621h		;b24f
	ld (ix+01bh),l		;b252
	ld (ix+01ch),h		;b255
	ld (ix+013h),030h		;b258
	ld (ix+00bh),013h		;b25c   ; el cuadro del actor = 0x13
	inc (ix+006h)		;b260   ; sube si el actor se mueve (p01:7336)
	ld de,00000h		;b263
	ld hl,00060h		;b266
	call 05b64h		;b269   ; velocidades: la velocidad X del actor = DE y la Y = HL
	jp musica_3e		;b26c   ; musica_3e: la musica 0x3E (salvo en el modo 8)
bandera_c622:		; 0xC622 = 1 y la musica de la sala
	ld a,001h		;b26f
	ld (0c622h),a		;b271
	call 044ech		;b274   ; musica_de_la_sala: 0xC602 a cero y elige la musica de la sala (0xC159, 0xC0F4) y 0xC15F
L_B277:
	ret			;b277
crea_tipo_24:		; la creacion del tipo 24
	ld a,(0c136h)		;b278   ; lee la parada del ascensor
	cp 08bh		;b27b
	jp z,07371h		;b27d
	inc (ix+006h)		;b280   ; sube si el actor se mueve (p01:7336)
	ld (ix+011h),004h		;b283   ; la direccion del actor = 0x04
	call cuadro_por_direccion		;b287   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	call parado		;b28a   ; parado: las dos velocidades a cero
	jp velocidad_a90e		;b28d   ; velocidad_a90e: las velocidades de la direccion (ix+0x11) de la tabla 0xA90E
cuadro_tipo_24:		; lo de cada cuadro del tipo 24
	ld a,(ix+001h)		;b290   ; lee el paso del actor
	call 041eah		;b293   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_B296: 7 destinos del despachador p00:41EA (call en p03:B293, el
;   indice en A): B2A4, B2DB, B351, B376, B38F, B3A6, B3C0; lo leen p03:B293
;   (14 bytes)
;   0xb296..0xb2a4  (14 bytes)
DATA_tabla_B296:
	defw 0b2a4h,0b2dbh,0b351h,0b376h,0b38fh,0b3a6h,0b3c0h	; b296

; ======================================================================
; CODIGO 0xb2a4..0xb442  (414 bytes)
; ======================================================================


L_B2A4:
	ld a,(0c602h)		;b2a4   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;b2a7
	jp nz,L_B3C4		;b2a8
	call cuadro_por_direccion		;b2ab   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	call snake_abajo		;b2ae   ; snake_abajo: acarreo si la Y de Snake es 0x80 o mas
	ld a,(ix+005h)		;b2b1   ; lee la X del actor
	ld b,004h		;b2b4
	cp 050h		;b2b6
	jr z,L_B2D2		;b2b8
	cp 098h		;b2ba
	jr z,L_B2C1		;b2bc
	cp 0d0h		;b2be
	ret nz			;b2c0
L_B2C1:
	ld (ix+001h),001h		;b2c1   ; el paso del actor = 0x01
	ld (ix+006h),000h		;b2c5   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+012h),01eh		;b2c9   ; la cuenta de espera del actor = 0x1E
	ld (ix+00bh),008h		;b2cd   ; el cuadro del actor = 0x08
	ret			;b2d1
L_B2D2:
	ld (ix+011h),b		;b2d2   ; guarda la direccion del actor
	call cuadro_por_direccion		;b2d5   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	jp velocidad_a90e		;b2d8   ; velocidad_a90e: las velocidades de la direccion (ix+0x11) de la tabla 0xA90E
L_B2DB:
	ld a,(0c602h)		;b2db   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;b2de
	jp nz,L_B3C4		;b2df
	dec (ix+012h)		;b2e2   ; baja la cuenta de espera del actor
	jr nz,L_B2FD		;b2e5
	ld (ix+001h),000h		;b2e7   ; el paso del actor = 0x00
	ld (ix+006h),001h		;b2eb   ; si el actor se mueve (p01:7336) = 0x01
	ld a,(ix+005h)		;b2ef   ; lee la X del actor
	cp 0d0h		;b2f2
	jr z,L_B2F9		;b2f4
	jp cuadro_por_direccion		;b2f6   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
L_B2F9:
	ld b,003h		;b2f9
	jr L_B2D2		;b2fb
L_B2FD:
	ld a,(ix+005h)		;b2fd   ; lee la X del actor
	cp 0d0h		;b300
	jr nz,L_B30D		;b302
	ld a,(0c184h)		;b304   ; lee la X de Snake
	cp 0c0h		;b307
	jr nc,L_B31E		;b309
	jr snake_abajo		;b30b
L_B30D:
	ld a,(0c184h)		;b30d   ; lee la X de Snake
	sub (ix+005h)		;b310   ; le resta la X del actor
	add a,008h		;b313
	cp 011h		;b315
	jr c,L_B31E		;b317
snake_abajo:		; acarreo si la Y de Snake es 0x80 o mas
	ld a,(0c182h)		;b319   ; lee la Y de Snake
	rla			;b31c
	ret nc			;b31d
L_B31E:
	ld a,(0c18bh)		;b31e   ; lee el modo de la pose de Snake
	cp 007h		;b321
	jr nz,L_B336		;b323
	ld hl,0c186h		;b325   ; apunta a la velocidad Y de Snake
	ld a,(hl)			;b328
	inc hl			;b329
	or (hl)			;b32a
	jr nz,L_B336		;b32b
	ld hl,0c188h		;b32d   ; apunta a la velocidad X de Snake
	ld a,(hl)			;b330
	or (hl)			;b331
	inc hl			;b332
	or (hl)			;b333
	or a			;b334
	ret z			;b335
L_B336:
	xor a			;b336
	call 07d27h		;b337   ; pon_c602_con_cuenta: 0xC605 = A y pon_c602
	ld h,000h		;b33a
	call pon_aviso		;b33c   ; pon_aviso: guarda el fondo en la pagina 1 y pone el dibujo de 0x80 sobre el actor (0xC60C)
	ld (ix+001h),006h		;b33f   ; el paso del actor = 0x06
	ld (ix+006h),000h		;b343   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+012h),00fh		;b347   ; la cuenta de espera del actor = 0x0F
	call 08334h		;b34b   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	jp cuadro_a_mas_1b		;b34e   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
L_B351:
	call cuadro_por_direccion		;b351   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld a,(ix+005h)		;b354   ; lee la X del actor
	cp 025h		;b357
	ret nc			;b359
	inc (ix+001h)		;b35a   ; sube el paso del actor
	ld (ix+006h),000h		;b35d   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+012h),00ah		;b361   ; la cuenta de espera del actor = 0x0A
	ld (ix+00bh),008h		;b365   ; el cuadro del actor = 0x08
	ld a,015h		;b369
	call 0427ch		;b36b   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld c,02ch		;b36e
	ld de,02470h		;b370
	jp 0569ah		;b373   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
L_B376:
	dec (ix+012h)		;b376   ; baja la cuenta de espera del actor
	ret nz			;b379
	inc (ix+001h)		;b37a   ; sube el paso del actor
	ld (ix+006h),001h		;b37d   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+012h),010h		;b381   ; la cuenta de espera del actor = 0x10
	ld (ix+011h),004h		;b385   ; la direccion del actor = 0x04
	call cuadro_por_a		;b389   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
	jp velocidad_a90e		;b38c   ; velocidad_a90e: las velocidades de la direccion (ix+0x11) de la tabla 0xA90E
L_B38F:
	call cuadro_por_direccion		;b38f   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	dec (ix+012h)		;b392   ; baja la cuenta de espera del actor
	ret nz			;b395
	inc (ix+001h)		;b396   ; sube el paso del actor
	ld (ix+006h),000h		;b399   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+00bh),00bh		;b39d   ; el cuadro del actor = 0x0B
	ld (ix+012h),001h		;b3a1   ; la cuenta de espera del actor = 0x01
	ret			;b3a5
L_B3A6:
	ld a,(0c182h)		;b3a6   ; lee la Y de Snake
	rla			;b3a9
	ret nc			;b3aa
	call 08334h		;b3ab   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	add a,007h		;b3ae
	ld (ix+00bh),a		;b3b0   ; guarda el cuadro del actor
	dec (ix+012h)		;b3b3   ; baja la cuenta de espera del actor
	ret nz			;b3b6
	ld (ix+012h),010h		;b3b7   ; la cuenta de espera del actor = 0x10
	ld c,03dh		;b3bb
	jp crea_encima		;b3bd   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
L_B3C0:
	dec (ix+012h)		;b3c0   ; baja la cuenta de espera del actor
	ret nz			;b3c3
L_B3C4:
	ld (ix+001h),002h		;b3c4   ; el paso del actor = 0x02
	ld (ix+006h),001h		;b3c8   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00ah),0fdh		;b3cc   ; la velocidad X del actor (alta) = 0xFD
	ld a,003h		;b3d0
	ld (ix+011h),a		;b3d2   ; guarda la direccion del actor
	jp cuadro_por_a		;b3d5   ; cuadro_por_a: cuadro = 2 x (A - 1), +1 con el bit 2 de (ix+0x0C)
crea_tipo_27:		; la creacion del tipo 27
	ld a,01bh		;b3d8
	call 05bafh		;b3da   ; cuenta_tipo: A = cuantos actores del tipo A hay
	cp 003h		;b3dd
	jp nc,07371h		;b3df
	inc (ix+006h)		;b3e2   ; sube si el actor se mueve (p01:7336)
	ld a,(0c62fh)		;b3e5
	or a			;b3e8
	jr z,L_B400		;b3e9
	ld (ix+013h),040h		;b3eb
	ld (ix+00bh),014h		;b3ef   ; el cuadro del actor = 0x14
	ld a,r		;b3f3
	ld (ix+00ch),a		;b3f5   ; guarda la cuenta de cuadros del actor
parado:		; las dos velocidades a cero
	ld de,00000h		;b3f8
	ld l,e			;b3fb
	ld h,d			;b3fc
	jp 05b64h		;b3fd   ; velocidades: la velocidad X del actor = DE y la Y = HL
L_B400:
	call paso_y_colores_0d		;b400   ; paso_y_colores_0d: paso siguiente y colores 0x0D/0x0F
	ld a,(0c133h)		;b403   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;b406
	bit 1,a		;b407
	jr nz,$+85		;b409
sube_o_baja_a_snake:		; velocidad Y de 3 hacia Snake
	ld a,(0c182h)		;b40b   ; lee la Y de Snake
	cp (ix+003h)		;b40e   ; compara con la Y del actor
	ld b,000h		;b411
	ld de,00000h		;b413
	ld hl,0fd00h		;b416
	jr c,L_B41F		;b419
	inc b			;b41b
	ld hl,00300h		;b41c
L_B41F:
	ld (ix+011h),b		;b41f   ; guarda la direccion del actor
	ld a,b			;b422
	add a,a			;b423
	add a,020h		;b424
	ld (ix+00bh),a		;b426   ; guarda el cuadro del actor
	jp 05b64h		;b429   ; velocidades: la velocidad X del actor = DE y la Y = HL
cuadro_tipo_27:		; lo de cada cuadro del tipo 27
	bit 1,(ix+011h)		;b42c   ; mira el bit 1 de la direccion del actor
	jr nz,L_B43C		;b430
	ld a,020h		;b432
	cp (ix+005h)		;b434   ; compara con la X del actor
	jr c,L_B43C		;b437
	ld (ix+005h),a		;b439   ; guarda la X del actor
L_B43C:
	ld a,(ix+001h)		;b43c   ; lee el paso del actor
	call 041eah		;b43f   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_B442: 3 destinos del despachador p00:41EA (call en p03:B43F, el
;   indice en A): B474, B48A, B448; lo leen p03:B43F (6 bytes)
;   0xb442..0xb448  (6 bytes)
DATA_tabla_B442:
	defw 0b474h,0b48ah,0b448h	; b442  -> L_B474 L_B48A L_B448

; ======================================================================
; CODIGO 0xb448..0xb542  (250 bytes)
; ======================================================================


L_B448:
	call mira_delante		;b448   ; mira_delante: alterna el cuadro y mira la ficha de delante (0xB542)
	dec (ix+013h)		;b44b
	ret nz			;b44e
	ld a,003h		;b44f
	call 0427ch		;b451   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld (ix+013h),018h		;b454
	bit 1,(ix+011h)		;b458   ; mira el bit 1 de la direccion del actor
	jr z,$-81		;b45c
L_B45E:
	ld a,(0c184h)		;b45e   ; lee la X de Snake
	cp (ix+005h)		;b461   ; compara con la X del actor
	ld b,002h		;b464
	ld hl,00000h		;b466
	ld de,0fd00h		;b469
	jr c,$-77		;b46c
	inc b			;b46e
	ld de,00300h		;b46f
	jr $-83		;b472
L_B474:
	ld b,01fh		;b474
	call 05b6ah		;b476   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	dec (ix+013h)		;b479
	ret nz			;b47c
	call sube_o_baja_a_snake		;b47d   ; sube_o_baja_a_snake: velocidad Y de 3 hacia Snake
paso_y_colores_0d:		; paso siguiente y colores 0x0D/0x0F
	call 05ba2h		;b480   ; paso_siguiente: sube el paso del actor (ix+1)
	ld a,00dh		;b483
	ld c,00fh		;b485
	jp 05bc3h		;b487
L_B48A:
	call alineado_con_snake		;b48a   ; alineado_con_snake: si Snake esta en linea con el actor por su direccion
mira_delante:		; alterna el cuadro y mira la ficha de delante (0xB542)
	ld b,007h		;b48d
	call 05b6ah		;b48f   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	ld l,(ix+011h)		;b492   ; lee la direccion del actor
	ld h,000h		;b495
	ld de,0b542h		;b497
	add hl,hl			;b49a
	add hl,de			;b49b
	ex de,hl			;b49c
	ld a,(de)			;b49d
	inc de			;b49e
	add a,(ix+003h)		;b49f   ; le suma la Y del actor
	ld l,a			;b4a2
	ld a,(de)			;b4a3
	add a,(ix+005h)		;b4a4   ; le suma la X del actor
	ld h,a			;b4a7
	ld a,(ix+011h)		;b4a8   ; lee la direccion del actor
	inc a			;b4ab
	cp 005h		;b4ac
	jr c,L_B4B1		;b4ae
	xor a			;b4b0
L_B4B1:
	ld c,a			;b4b1
	ld b,002h		;b4b2
	call 08298h		;b4b4   ; choca: acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)
	ret nc			;b4b7
	ld a,(ix+005h)		;b4b8   ; lee la X del actor
	cp 0f2h		;b4bb
	ret nc			;b4bd
	cp 00ch		;b4be
	ret c			;b4c0
	ld a,(ix+003h)		;b4c1   ; lee la Y del actor
	cp 01ch		;b4c4
	ret c			;b4c6
	cp 0b4h		;b4c7
	ret nc			;b4c9
	bit 1,(ix+011h)		;b4ca   ; mira el bit 1 de la direccion del actor
	ld a,000h		;b4ce
	jr nz,L_B4D4		;b4d0
	ld a,002h		;b4d2
L_B4D4:
	ld (ix+017h),a		;b4d4   ; (ix+0x17) = A
	ld d,000h		;b4d7   ; 0: los colores de 0xE7...
	ld e,0e7h		;b4d9
	or a			;b4db
	jr z,L_B4EB		;b4dc
	ld e,019h		;b4de   ; ...1: de 0x19
	dec a			;b4e0
	jr z,L_B4EB		;b4e1
	ld de,0e700h		;b4e3   ; apunta a los colores de las fichas
	dec a			;b4e6
	jr z,L_B4EB		;b4e7
	ld d,019h		;b4e9
L_B4EB:
	ld a,d			;b4eb
	add a,(ix+005h)		;b4ec   ; le suma la X del actor
	ld h,a			;b4ef
	ld a,e			;b4f0
	add a,(ix+003h)		;b4f1   ; le suma la Y del actor
	ld l,a			;b4f4
	ld a,(ix+017h)		;b4f5
	inc a			;b4f8
	cp 005h		;b4f9
	jr c,L_B4FF		;b4fb
	ld a,001h		;b4fd
L_B4FF:
	ld c,a			;b4ff
	ld b,002h		;b500
	call 08298h		;b502   ; choca: acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)
	jr c,L_B53A		;b505
	dec a			;b507
	ld (ix+011h),a		;b508   ; guarda la direccion del actor
	ld hl,0fd00h		;b50b
	ld de,00000h		;b50e
	or a			;b511
	jr z,L_B526		;b512
	ld hl,00300h		;b514
	dec a			;b517
	jr z,L_B526		;b518
	ld de,0fd00h		;b51a
	ld hl,00000h		;b51d
	dec a			;b520
	jr z,L_B526		;b521
	ld de,00300h		;b523
L_B526:
	call 05b64h		;b526   ; velocidades: la velocidad X del actor = DE y la Y = HL
	ld a,(ix+00bh)		;b529   ; lee el cuadro del actor
	and 001h		;b52c
	ld b,a			;b52e
	ld a,(ix+011h)		;b52f   ; lee la direccion del actor
	add a,a			;b532
	add a,020h		;b533
	add a,b			;b535
	ld (ix+00bh),a		;b536   ; guarda el cuadro del actor
	ret			;b539
L_B53A:
	ld a,(ix+017h)		;b53a
	inc a			;b53d
	and 003h		;b53e
	jr L_B4D4		;b540

; ----------------------------------------------------------------------
; DATOS velocidad_b542: 4 parejas [dy][dx] (-8, 8) que p03:B497 lee en 0xB542
;   + 2 x (ix+0x11) y suma a (ix+3) y (ix+5)
;   0xb542..0xb54a  (8 bytes)
DATA_velocidad_b542:
	defb 0f8h,000h	; b542
	defb 008h,000h	; b544
	defb 000h,0f8h	; b546
	defb 000h,008h	; b548

; ======================================================================
; CODIGO 0xb54a..0xb5f6  (172 bytes)
; ======================================================================


alineado_con_snake:		; si Snake esta en linea con el actor por su direccion
	call 05b45h		;b54a   ; sitio_de_snake: E = la Y de Snake, D = la X
	ld h,(ix+005h)		;b54d   ; lee la X del actor
	ld l,(ix+003h)		;b550   ; lee la Y del actor
	bit 1,(ix+011h)		;b553   ; mira el bit 1 de la direccion del actor
	jr nz,L_B572		;b557
	ld a,d			;b559
	sub h			;b55a
	jr nc,L_B55F		;b55b
	neg		;b55d
L_B55F:
	cp 030h		;b55f   ; Snake a menos de 0x30 en X...
	ret nc			;b561
	ld a,e			;b562   ; ...y en la franja Y 0x18 por arriba...
	sub 018h		;b563
	cp l			;b565
	ret nc			;b566
	add a,030h		;b567
	cp l			;b569
	ret c			;b56a
	ld (ix+013h),018h		;b56b   ; ...0x18 cuadros y al paso siguiente
	jp 05ba2h		;b56f   ; paso_siguiente: sube el paso del actor (ix+1)
L_B572:
	ld a,e			;b572   ; |dy| a Snake
	sub l			;b573
	jr nc,L_B578		;b574
	neg		;b576
L_B578:
	cp 030h		;b578   ; menos de 0x30...
	ret nc			;b57a
	ld a,d			;b57b   ; ...y en la franja X 0x20 a cada lado...
	sub 020h		;b57c
	cp h			;b57e
	ret nc			;b57f
	add a,040h		;b580
	cp h			;b582
	ret c			;b583
	ld (ix+013h),018h		;b584   ; ...0x18 cuadros y al paso siguiente
	jp 05ba2h		;b588   ; paso_siguiente: sube el paso del actor (ix+1)
crea_tipo_29:		; la creacion del tipo 29
	call 05b45h		;b58b   ; sitio_de_snake: E = la Y de Snake, D = la X
	ld a,d			;b58e
	ld c,014h		;b58f
	cp c			;b591
	jr nc,L_B595		;b592
	ld a,d			;b594
L_B595:
	ld (ix+016h),a		;b595
	ld (ix+015h),e		;b598
	ld (ix+013h),030h		;b59b
	ld (ix+00eh),000h		;b59f   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ret			;b5a3
cuadro_tipo_29:		; lo de cada cuadro del tipo 29
	dec (ix+013h)		;b5a4   ; cada (ix+0x13) cuadros...
	ret nz			;b5a7
	ld hl,0c62eh		;b5a8   ; ...mientras queden del tipo 0x1B (0xC62E)...
	ld a,(hl)			;b5ab
	or a			;b5ac
	jp z,07371h		;b5ad
	dec (hl)			;b5b0   ; ...uno menos...
	ld (ix+013h),030h		;b5b1   ; ...0x30 cuadros...
	ld e,(ix+015h)		;b5b5   ; ...en (ix+0x15, ix+0x16)...
	ld d,(ix+016h)		;b5b8
	ld c,01bh		;b5bb   ; ...crea uno del tipo 0x1B
	jp 0569ah		;b5bd   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
crea_tipo_33:		; la creacion del tipo 33
	ld hl,0c631h		;b5c0
	bit 0,(hl)		;b5c3
	jp nz,0737bh		;b5c5   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld (ix+00bh),05dh		;b5c8   ; el cuadro del actor = 0x5D
	ld (ix+014h),002h		;b5cc
	inc (ix+006h)		;b5d0   ; sube si el actor se mueve (p01:7336)
	ld a,(0c184h)		;b5d3   ; lee la X de Snake
	cp (ix+005h)		;b5d6   ; compara con la X del actor
	ld a,004h		;b5d9
	ld b,a			;b5db
	jr nc,L_B5E1		;b5dc
	ld a,0fch		;b5de
	dec b			;b5e0
L_B5E1:
	ld (ix+00ah),a		;b5e1   ; guarda la velocidad X del actor (alta)
	ld (ix+011h),b		;b5e4   ; guarda la direccion del actor
	ld (ix+012h),00bh		;b5e7   ; la cuenta de espera del actor = 0x0B
	ld (ix+00eh),000h		;b5eb   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ret			;b5ef
cuadro_tipo_33:		; lo de cada cuadro del tipo 33
	ld a,(ix+001h)		;b5f0   ; lee el paso del actor
	call 041eah		;b5f3   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_B5F6: 3 destinos del despachador p00:41EA (call en p03:B5F3, el
;   indice en A): B5FC, B615, B641; lo leen p03:B5F3 (6 bytes)
;   0xb5f6..0xb5fc  (6 bytes)
DATA_tabla_B5F6:
	defw 0b5fch,0b615h,0b641h	; b5f6  -> L_B5FC L_B615 L_B641

; ======================================================================
; CODIGO 0xb5fc..0xb68f  (147 bytes)
; ======================================================================


L_B5FC:
	dec (ix+014h)		;b5fc
	ret nz			;b5ff
	ld hl,0c631h		;b600
	bit 1,(hl)		;b603
	jr nz,L_B60E		;b605
	set 1,(hl)		;b607
	ld a,03dh		;b609
	call 05cd9h		;b60b   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
L_B60E:
	ld (ix+001h),001h		;b60e   ; el paso del actor = 0x01
	jp musica_3e		;b612   ; musica_3e: la musica 0x3E (salvo en el modo 8)
L_B615:
	call cuadro_b68f		;b615   ; cuadro_b68f: cuadro de la tabla 0xB68F por los bits 1-2 de (ix+0x0C)
	bit 7,(ix+00ah)		;b618   ; mira el bit 7 de la velocidad X del actor (alta)
	ld c,003h		;b61c
	jr nz,L_B621		;b61e
	inc c			;b620
L_B621:
	ld b,000h		;b621
	call 08292h		;b623   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	jr c,L_B62C		;b626
	dec (ix+012h)		;b628   ; baja la cuenta de espera del actor
	ret nz			;b62b
L_B62C:
	ld (ix+00ah),000h		;b62c   ; la velocidad X del actor (alta) = 0x00
	ld (ix+00bh),05dh		;b630   ; el cuadro del actor = 0x5D
	ld (ix+012h),02dh		;b634   ; la cuenta de espera del actor = 0x2D
	ld (ix+001h),002h		;b638   ; el paso del actor = 0x02
	ld (ix+00eh),003h		;b63c   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	ret			;b640
L_B641:
	dec (ix+012h)		;b641   ; baja la cuenta de espera del actor
	jr z,L_B65E		;b644
	ld a,(0c182h)		;b646   ; lee la Y de Snake
	cp 0a6h		;b649
	jr c,L_B653		;b64b
	ld a,(0c184h)		;b64d   ; lee la X de Snake
	cp 0aah		;b650
	ret nc			;b652
L_B653:
	ld a,(ix+00ch)		;b653   ; lee la cuenta de cuadros del actor
	and 00fh		;b656
	ret nz			;b658
	ld c,02bh		;b659
	jp crea_encima		;b65b   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
L_B65E:
	ld a,(0c184h)		;b65e   ; lee la X de Snake
	cp (ix+005h)		;b661   ; compara con la X del actor
	ld a,004h		;b664
	ld b,a			;b666
	jr nc,L_B66C		;b667
	ld a,0fch		;b669
	dec b			;b66b
L_B66C:
	ld (ix+00ah),a		;b66c   ; guarda la velocidad X del actor (alta)
	ld (ix+011h),b		;b66f   ; guarda la direccion del actor
	ld (ix+001h),001h		;b672   ; el paso del actor = 0x01
	ld (ix+012h),00bh		;b676   ; la cuenta de espera del actor = 0x0B
	ld (ix+00eh),000h		;b67a   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
cuadro_b68f:		; cuadro de la tabla 0xB68F por los bits 1-2 de (ix+0x0C)
	ld hl,0b68fh		;b67e
	ld a,(ix+00ch)		;b681   ; lee la cuenta de cuadros del actor
	and 006h		;b684
	rra			;b686
	call 041e0h		;b687   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;b68a
	ld (ix+00bh),a		;b68b   ; guarda el cuadro del actor
	ret			;b68e

; ----------------------------------------------------------------------
; DATOS patrones_b68f: 4 numeros de patron (0x5E, 0x5F, 0x60, 0x5F) que
;   p03:B67E lee con los bits 1-2 de (ix+0x0C)
;   0xb68f..0xb693  (4 bytes)
DATA_patrones_b68f:
	defb 05eh,05fh,060h,05fh	; b68f

; ======================================================================
; CODIGO 0xb693..0xb6eb  (88 bytes)
; ======================================================================


crea_tipo_43:		; la creacion del tipo 43
	inc (ix+006h)		;b693   ; sube si el actor se mueve (p01:7336)
	ld (ix+00bh),06eh		;b696   ; el cuadro del actor = 0x6E
	ld (ix+00eh),001h		;b69a   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+012h),000h		;b69e   ; la cuenta de espera del actor = 0x00
	ld a,090h		;b6a2
	call 05c27h		;b6a4   ; hacia_snake_a: HL y DE = la velocidad de IX hacia Snake con el modulo A (+ 8 x 0xC152)
	call 05b64h		;b6a7   ; velocidades: la velocidad X del actor = DE y la Y = HL
	ld a,00fh		;b6aa
	jp 0427ch		;b6ac   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
cuadro_tipo_43:		; lo de cada cuadro del tipo 43
	inc (ix+012h)		;b6af   ; sube la cuenta de espera del actor
	ld a,(ix+012h)		;b6b2   ; lee la cuenta de espera del actor
	cp 007h		;b6b5
	ld bc,0026eh		;b6b7
	jr c,L_B6C8		;b6ba
	cp 00eh		;b6bc
	inc c			;b6be
	jr c,L_B6C8		;b6bf
	cp 015h		;b6c1
	inc c			;b6c3
	jr c,L_B6C8		;b6c4
	inc c			;b6c6
	dec b			;b6c7
L_B6C8:
	ld (ix+00bh),c		;b6c8   ; guarda el cuadro del actor
	ld c,002h		;b6cb
	call 08292h		;b6cd   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	ret nc			;b6d0
	jp 07371h		;b6d1
crea_tipo_34:		; la creacion del tipo 34
	ld hl,0c630h		;b6d4
	bit 0,(hl)		;b6d7
	jp nz,0737bh		;b6d9   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld (ix+00bh),031h		;b6dc   ; el cuadro del actor = 0x31
	ld (ix+014h),002h		;b6e0
	ret			;b6e4
cuadro_tipo_34:		; lo de cada cuadro del tipo 34
	ld a,(ix+001h)		;b6e5   ; lee el paso del actor
	call 041eah		;b6e8   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_B6EB: 5 destinos del despachador p00:41EA (call en p03:B6E8, el
;   indice en A): B6F5, B711, B75A, B77B, B7ED; lo leen p03:B6E8 (10 bytes)
;   0xb6eb..0xb6f5  (10 bytes)
DATA_tabla_B6EB:
	defw 0b6f5h,0b711h,0b75ah,0b77bh,0b7edh	; b6eb

; ======================================================================
; CODIGO 0xb6f5..0xb9ab  (694 bytes)
; ======================================================================


L_B6F5:
	dec (ix+014h)		;b6f5
	ret nz			;b6f8
	ld hl,0c630h		;b6f9
	bit 1,(hl)		;b6fc
	jr nz,L_B707		;b6fe
	set 1,(hl)		;b700
	ld a,04fh		;b702
	call 05cd9h		;b704   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
L_B707:
	ld (ix+006h),001h		;b707   ; si el actor se mueve (p01:7336) = 0x01
	call musica_3e		;b70b   ; musica_3e: la musica 0x3E (salvo en el modo 8)
	jp L_B7B6		;b70e
L_B711:
	dec (ix+012h)		;b711   ; baja la cuenta de espera del actor
	jr nz,L_B738		;b714
	ld a,r		;b716
	xor (ix+00ch)		;b718   ; XOR con la cuenta de cuadros del actor
	rra			;b71b
	ld b,003h		;b71c
	ld a,0fch		;b71e
	jr c,L_B725		;b720
	inc b			;b722
	ld a,004h		;b723
L_B725:
	ld (ix+011h),b		;b725   ; guarda la direccion del actor
	ld (ix+00ah),a		;b728   ; guarda la velocidad X del actor (alta)
L_B72B:
	ld (ix+00bh),033h		;b72b   ; el cuadro del actor = 0x33
	ld (ix+012h),008h		;b72f   ; la cuenta de espera del actor = 0x08
	ld (ix+001h),002h		;b733   ; el paso del actor = 0x02
	ret			;b737
L_B738:
	ld a,(0c184h)		;b738   ; lee la X de Snake
	sub (ix+005h)		;b73b   ; le resta la X del actor
	add a,008h		;b73e
	cp 011h		;b740
	ret c			;b742
	ld a,(0c184h)		;b743   ; lee la X de Snake
	cp (ix+005h)		;b746   ; compara con la X del actor
	ld b,003h		;b749
	ld a,0fch		;b74b
	jr c,L_B752		;b74d
	inc b			;b74f
	ld a,004h		;b750
L_B752:
	ld (ix+011h),b		;b752   ; guarda la direccion del actor
	ld (ix+00ah),a		;b755   ; guarda la velocidad X del actor (alta)
	jr L_B72B		;b758
L_B75A:
	bit 2,(ix+00ch)		;b75a   ; mira el bit 2 de la cuenta de cuadros del actor
	ld a,033h		;b75e
	jr z,L_B763		;b760
	inc a			;b762
L_B763:
	ld (ix+00bh),a		;b763   ; guarda el cuadro del actor
	dec (ix+012h)		;b766   ; baja la cuenta de espera del actor
	ret nz			;b769
	ld (ix+00bh),031h		;b76a   ; el cuadro del actor = 0x31
	ld (ix+012h),028h		;b76e   ; la cuenta de espera del actor = 0x28
	ld (ix+001h),003h		;b772   ; el paso del actor = 0x03
	ld (ix+00ah),000h		;b776   ; la velocidad X del actor (alta) = 0x00
	ret			;b77a
L_B77B:
	ld a,(0c184h)		;b77b   ; lee la X de Snake
	sub (ix+005h)		;b77e   ; le resta la X del actor
	add a,030h		;b781
	cp 061h		;b783
	jr nc,L_B7B6		;b785
	dec (ix+012h)		;b787   ; baja la cuenta de espera del actor
	jr z,L_B7B6		;b78a
	ld a,(ix+012h)		;b78c   ; lee la cuenta de espera del actor
	and 003h		;b78f
	ld (ix+00bh),031h		;b791   ; el cuadro del actor = 0x31
	ret nz			;b795
	ld (ix+00bh),032h		;b796   ; el cuadro del actor = 0x32
	ld c,03ch		;b79a
	call crea_encima		;b79c   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
	ld bc,00012h		;b79f
	add hl,bc			;b7a2
	ld a,(ix+013h)		;b7a3
	inc a			;b7a6
	and 007h		;b7a7
	ld (ix+013h),a		;b7a9
	cp 005h		;b7ac
	jr c,L_B7B4		;b7ae
	sub 008h		;b7b0
	neg		;b7b2
L_B7B4:
	ld (hl),a			;b7b4
	ret			;b7b5
L_B7B6:
	ld a,(ix+005h)		;b7b6   ; lee la X del actor
	ld c,a			;b7b9
	cp 0e0h		;b7ba
	ld a,0fch		;b7bc
	ld b,003h		;b7be
	jr z,L_B7D6		;b7c0
	ld a,c			;b7c2
	cp 020h		;b7c3
	ld a,004h		;b7c5
	ld b,a			;b7c7
	jr z,L_B7D6		;b7c8
	ld a,(0c184h)		;b7ca   ; lee la X de Snake
	cp c			;b7cd
	dec b			;b7ce
	ld a,0fch		;b7cf
	jr c,L_B7D6		;b7d1
	inc b			;b7d3
	ld a,004h		;b7d4
L_B7D6:
	ld (ix+011h),b		;b7d6   ; guarda la direccion del actor
	ld (ix+00ah),a		;b7d9   ; guarda la velocidad X del actor (alta)
	ld (ix+00bh),033h		;b7dc   ; el cuadro del actor = 0x33
	ld (ix+012h),008h		;b7e0   ; la cuenta de espera del actor = 0x08
	ld (ix+001h),004h		;b7e4   ; el paso del actor = 0x04
	ld (ix+006h),001h		;b7e8   ; si el actor se mueve (p01:7336) = 0x01
	ret			;b7ec
L_B7ED:
	bit 2,(ix+00ch)		;b7ed   ; mira el bit 2 de la cuenta de cuadros del actor
	ld a,033h		;b7f1
	jr z,L_B7F6		;b7f3
	inc a			;b7f5
L_B7F6:
	ld (ix+00bh),a		;b7f6   ; guarda el cuadro del actor
	dec (ix+012h)		;b7f9   ; baja la cuenta de espera del actor
	ret nz			;b7fc
	ld (ix+001h),001h		;b7fd   ; el paso del actor = 0x01
	ld (ix+00ah),000h		;b801   ; la velocidad X del actor (alta) = 0x00
	ld (ix+012h),02dh		;b805   ; la cuenta de espera del actor = 0x2D
	ld (ix+00bh),031h		;b809   ; el cuadro del actor = 0x31
	ret			;b80d
crea_tipo_60:		; la creacion del tipo 60
	ld (ix+006h),001h		;b80e   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00eh),001h		;b812   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+00bh),072h		;b816   ; el cuadro del actor = 0x72
	ret			;b81a
cuadro_tipo_60:		; lo de cada cuadro del tipo 60
	bit 0,(ix+001h)		;b81b   ; mira el bit 0 de el paso del actor
	ret nz			;b81f
	ld (ix+001h),001h		;b820   ; el paso del actor = 0x01
	ld hl,0ff80h		;b824
	ld a,(ix+012h)		;b827   ; lee la cuenta de espera del actor
	or a			;b82a
	rra			;b82b
	rra			;b82c
	rra			;b82d
	ld d,000h		;b82e
	rl d		;b830
	ld e,a			;b832
	add hl,de			;b833
	ld (ix+009h),l		;b834   ; guarda la velocidad X del actor
	ld (ix+00ah),h		;b837   ; guarda la velocidad X del actor (alta)
	ld (ix+008h),005h		;b83a   ; la velocidad Y del actor (alta) = 0x05
	ld a,005h		;b83e
	jp 0427ch		;b840   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
crea_tipo_38:		; la creacion del tipo 38
	ld a,(0c620h)		;b843
	or a			;b846
	jp nz,0737bh		;b847   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld (ix+014h),005h		;b84a
	ld (ix+015h),005h		;b84e
	ld hl,0c620h		;b852
	ld (ix+01bh),l		;b855
	ld (ix+01ch),h		;b858
	ld (ix+00bh),086h		;b85b   ; el cuadro del actor = 0x86
	call musica_3e		;b85f   ; musica_3e: la musica 0x3E (salvo en el modo 8)
dibujo_si_hind_d:		; si el primer actor es el 0x26, el dibujo p15:B431 en (0x40, 0)
	ld a,(0d000h)		;b862   ; lee los 16 actores (fichas de 0x80)
	cp 026h		;b865
	ret nz			;b867
	ld de,04000h		;b868
	ld hl,0b431h		;b86b
	jp 044afh		;b86e   ; pone_dibujo: pone un dibujo del banco 15 ([filas][columnas] y fichas) en la sala, en D/E
cuadro_tipo_38:		; lo de cada cuadro del tipo 38
	inc (ix+016h)		;b871   ; el cuadro siguiente...
	ld a,(ix+016h)		;b874
	cp 003h		;b877   ; ...0, 1, 2 y vuelta...
	jr c,L_B87F		;b879
	xor a			;b87b
	ld (ix+016h),a		;b87c
L_B87F:
	add a,086h		;b87f   ; ...0x86-0x88
	ld (ix+00bh),a		;b881   ; guarda el cuadro del actor
	ld a,(ix+00ch)		;b884   ; lee la cuenta de cuadros del actor
	and 003h		;b887
	ld a,002h		;b889
	call z,04284h		;b88b   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
	bit 0,(ix+001h)		;b88e   ; mira el bit 0 de el paso del actor
	jr nz,L_B8B5		;b892
	dec (ix+014h)		;b894
	ret nz			;b897
	ld (ix+014h),005h		;b898
	dec (ix+015h)		;b89c
	jr z,L_B8AC		;b89f
	ld c,03dh		;b8a1
	ld e,(ix+003h)		;b8a3   ; lee la Y del actor
	ld d,(ix+005h)		;b8a6   ; lee la X del actor
	jp 0569ah		;b8a9   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
L_B8AC:
	ld (ix+001h),001h		;b8ac   ; el paso del actor = 0x01
	ld (ix+014h),011h		;b8b0
	ret			;b8b4
L_B8B5:
	dec (ix+014h)		;b8b5
	ret nz			;b8b8
	ld (ix+014h),005h		;b8b9
	ld (ix+015h),005h		;b8bd
	ld (ix+001h),000h		;b8c1   ; el paso del actor = 0x00
cuadro_tipo_23:		; lo de cada cuadro del tipo 23
	ret			;b8c5
L_B8C6:
	ld de,04000h		;b8c6
	ld hl,0b4e3h		;b8c9
	call 044afh		;b8cc   ; pone_dibujo: pone un dibujo del banco 15 ([filas][columnas] y fichas) en la sala, en D/E
	jp 0737bh		;b8cf   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
crea_tipo_61:		; la creacion del tipo 61
	inc (ix+006h)		;b8d2   ; sube si el actor se mueve (p01:7336)
	ld (ix+00eh),001h		;b8d5   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+00bh),072h		;b8d9   ; el cuadro del actor = 0x72
	ld a,090h		;b8dd
	call 05c27h		;b8df   ; hacia_snake_a: HL y DE = la velocidad de IX hacia Snake con el modulo A (+ 8 x 0xC152)
	jp 05b64h		;b8e2   ; velocidades: la velocidad X del actor = DE y la Y = HL
crea_tipo_39:		; la creacion del tipo 39
	ld a,(0c621h)		;b8e5
	or a			;b8e8
	jp nz,0737bh		;b8e9   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld (ix+00eh),000h		;b8ec   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld (ix+012h),014h		;b8f0   ; la cuenta de espera del actor = 0x14
	ret			;b8f4
cuadro_tipo_39:		; lo de cada cuadro del tipo 39
	dec (ix+012h)		;b8f5   ; baja la cuenta de espera del actor
	ret nz			;b8f8
	bit 0,(ix+001h)		;b8f9   ; mira el bit 0 de el paso del actor
	jr nz,L_B90C		;b8fd
	ld (ix+001h),001h		;b8ff   ; el paso del actor = 0x01
	ld (ix+012h),014h		;b903   ; la cuenta de espera del actor = 0x14
	ld a,00bh		;b907
	jp 0427ch		;b909   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
L_B90C:
	ld (ix+001h),000h		;b90c   ; el paso del actor = 0x00
	ld (ix+012h),032h		;b910   ; la cuenta de espera del actor = 0x32
	ld a,(ix+00ch)		;b914   ; lee la cuenta de cuadros del actor
	and 003h		;b917
	ld a,(0c184h)		;b919   ; lee la X de Snake
	jr z,L_B92B		;b91c
	ld a,r		;b91e
	xor (ix+00ch)		;b920   ; XOR con la cuenta de cuadros del actor
	srl a		;b923
	ld b,a			;b925
	srl a		;b926
	add a,b			;b928
	add a,020h		;b929
L_B92B:
	ld c,00ch		;b92b
	ld d,a			;b92d
	ld e,000h		;b92e
	jp 0569ah		;b930   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
crea_tipo_12:		; la creacion del tipo 12
	ld (ix+006h),001h		;b933   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00eh),001h		;b937   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+00bh),07eh		;b93b   ; el cuadro del actor = 0x7E
	ld a,r		;b93f
	ld hl,0c003h		;b941   ; apunta a la cuenta de cuadros
	xor (hl)			;b944
	and 00fh		;b945
	add a,00ah		;b947
	ld (ix+012h),a		;b949   ; guarda la cuenta de espera del actor
	and 001h		;b94c
	ld (ix+013h),a		;b94e
	call parado		;b951   ; parado: las dos velocidades a cero
	ld (ix+008h),006h		;b954   ; la velocidad Y del actor (alta) = 0x06
	ret			;b958
cuadro_tipo_12:		; lo de cada cuadro del tipo 12
	ld de,00018h		;b959
	bit 0,(ix+013h)		;b95c
	jr z,L_B965		;b960
	ld de,0ffe8h		;b962
L_B965:
	call 05b55h		;b965   ; suma_velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) += DE
	dec (ix+012h)		;b968   ; baja la cuenta de espera del actor
	ret nz			;b96b
	ld (ix+012h),012h		;b96c   ; la cuenta de espera del actor = 0x12
	ld (ix+000h),041h		;b970   ; el tipo del actor = 0x41
	ld (ix+006h),000h		;b974   ; si el actor se mueve (p01:7336) = 0x00
	ld a,01ah		;b978
	jp 0427ch		;b97a   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
cuadro_tipo_65:		; lo de cada cuadro del tipo 65
	dec (ix+012h)		;b97d   ; baja la cuenta de espera del actor
	jp z,07371h		;b980
	ld a,(ix+012h)		;b983   ; lee la cuenta de espera del actor
	cp 00dh		;b986
	ld b,073h		;b988
	jr nc,L_B992		;b98a
	cp 008h		;b98c
	inc b			;b98e
	jr nc,L_B992		;b98f
	inc b			;b991
L_B992:
	ld (ix+00bh),b		;b992   ; guarda el cuadro del actor
	ld a,b			;b995
	sub 073h		;b996
	ld de,0b9abh		;b998
	call 042b4h		;b99b   ; palabra_a: DE = la palabra A de la tabla DE
	ld (ix+025h),e		;b99e
	ld (ix+02ah),d		;b9a1
	ld (ix+02fh),e		;b9a4
	ld (ix+034h),d		;b9a7
	ret			;b9aa

; ----------------------------------------------------------------------
; DATOS palabras_b9ab: 3 palabras, tipos de actor 0x73-0x75: p03:B998 lee
;   0xB9AB + 2 x (tipo - 0x73) con L_42B4 y las guarda en (ix+0x25)/(ix+0x2A)
;   0xb9ab..0xb9b1  (6 bytes)
DATA_palabras_b9ab:
	defw 04608h,04608h,00e0eh	; b9ab

; ======================================================================
; CODIGO 0xb9b1..0xbab7  (262 bytes)
; ======================================================================


crea_tipo_9:		; la creacion del tipo 9
	ld a,(0c621h)		;b9b1
	or a			;b9b4
	jp nz,0737bh		;b9b5   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	inc (ix+006h)		;b9b8   ; sube si el actor se mueve (p01:7336)
	ld (ix+00bh),016h		;b9bb   ; el cuadro del actor = 0x16
	xor a			;b9bf
	ld (ix+007h),080h		;b9c0   ; la velocidad Y del actor = 0x80
	ld (ix+008h),a		;b9c4   ; guarda la velocidad Y del actor (alta)
	ld (ix+012h),01eh		;b9c7   ; la cuenta de espera del actor = 0x1E
	ld (ix+013h),a		;b9cb
	ld (ix+014h),001h		;b9ce
	ld (ix+015h),a		;b9d2
	ld (ix+016h),03ch		;b9d5
	ld (ix+017h),09ah		;b9d9
	ld hl,0c621h		;b9dd
	ld (ix+01bh),l		;b9e0
	ld (ix+01ch),h		;b9e3
musica_3e:		; la musica 0x3E (salvo en el modo 8)
	ld a,(0c151h)		;b9e6   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 008h		;b9e9
	ret z			;b9eb
	ld a,03eh		;b9ec
	ld (0c159h),a		;b9ee   ; guarda la musica que suena
	jp 0427ch		;b9f1   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
cuadro_tipo_9:		; lo de cada cuadro del tipo 9
	dec (ix+016h)		;b9f4
	jp nz,L_BA1C		;b9f7
	inc (ix+016h)		;b9fa
	ld a,(0c184h)		;b9fd   ; lee la X de Snake
	sub (ix+005h)		;ba00   ; le resta la X del actor
	add a,004h		;ba03
	cp 009h		;ba05
	jp nc,L_BA1C		;ba07
	ld c,017h		;ba0a
	ld a,(ix+003h)		;ba0c   ; lee la Y del actor
	add a,004h		;ba0f
	ld e,a			;ba11
	ld d,(ix+005h)		;ba12   ; lee la X del actor
	call 0569ah		;ba15   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	ld (ix+016h),01eh		;ba18
L_BA1C:
	bit 0,(ix+013h)		;ba1c
	jp nz,L_BA31		;ba20
	dec (ix+012h)		;ba23   ; baja la cuenta de espera del actor
	jp nz,L_BA83		;ba26
	ld (ix+012h),02dh		;ba29   ; la cuenta de espera del actor = 0x2D
	ld (ix+013h),001h		;ba2d
L_BA31:
	dec (ix+012h)		;ba31   ; baja la cuenta de espera del actor
	jp nz,L_BA4A		;ba34
	ld (ix+012h),01eh		;ba37   ; la cuenta de espera del actor = 0x1E
	ld (ix+013h),000h		;ba3b
	ld a,(ix+014h)		;ba3f
	neg		;ba42
	ld (ix+014h),a		;ba44
	jp L_BA83		;ba47
L_BA4A:
	ld a,(ix+00ch)		;ba4a   ; lee la cuenta de cuadros del actor
	and 007h		;ba4d
	jp nz,L_BA83		;ba4f
	ld c,03eh		;ba52
	ld a,(ix+003h)		;ba54   ; lee la Y del actor
	sub 00eh		;ba57
	ld e,a			;ba59
	bit 7,(ix+014h)		;ba5a
	ld a,010h		;ba5e
	jp z,L_BA65		;ba60
	neg		;ba63
L_BA65:
	add a,(ix+005h)		;ba65   ; le suma la X del actor
	ld d,a			;ba68
	call 0569ah		;ba69   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	ld bc,00012h		;ba6c
	add hl,bc			;ba6f
	ld a,(ix+015h)		;ba70
	inc a			;ba73
	and 007h		;ba74
	ld (ix+015h),a		;ba76
	cp 005h		;ba79
	jp c,L_BA82		;ba7b
	sub 008h		;ba7e
	neg		;ba80
L_BA82:
	ld (hl),a			;ba82
L_BA83:
	ld a,(ix+001h)		;ba83   ; lee el paso del actor
	cp 002h		;ba86
	jp z,L_BAFC		;ba88
	ld a,016h		;ba8b
	bit 2,(ix+00ch)		;ba8d   ; mira el bit 2 de la cuenta de cuadros del actor
	jp z,L_BA95		;ba91
	inc a			;ba94
L_BA95:
	ld (ix+00bh),a		;ba95   ; guarda el cuadro del actor
	ld a,(ix+00ch)		;ba98   ; lee la cuenta de cuadros del actor
	and 07fh		;ba9b
	jp nz,L_BAB1		;ba9d
	ld (ix+006h),a		;baa0   ; guarda si el actor se mueve (p01:7336)
	ld a,(ix+001h)		;baa3   ; lee el paso del actor
	ld (ix+019h),a		;baa6
	ld (ix+001h),002h		;baa9   ; el paso del actor = 0x02
	ld (ix+018h),028h		;baad
L_BAB1:
	ld a,(ix+001h)		;bab1   ; lee el paso del actor
	call 041eah		;bab4   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_BAB7: 4 destinos del despachador p00:41EA (call en p03:BAB4, el
;   indice en A): BABF, BAE7, BAFC, BB0B; lo leen p03:BAB4 (8 bytes)
;   0xbab7..0xbabf  (8 bytes)
DATA_tabla_BAB7:
	defw 0babfh,0bae7h,0bafch,0bb0bh	; bab7  -> L_BABF L_BAE7 L_BAFC L_BB0B

; ======================================================================
; CODIGO 0xbabf..0xbb83  (196 bytes)
; ======================================================================


L_BABF:
	dec (ix+017h)		;babf
	ret nz			;bac2
	ld (ix+017h),032h		;bac3
	ld (ix+007h),080h		;bac7   ; la velocidad Y del actor = 0x80
	ld b,000h		;bacb
	bit 7,(ix+008h)		;bacd   ; mira el bit 7 de la velocidad Y del actor (alta)
	jp nz,L_BAE3		;bad1
	dec b			;bad4
	call azar_0_3		;bad5   ; azar_0_3: A = (R XOR (ix+0x0C)) AND 3
	jp nz,L_BAE3		;bad8
	ld (ix+001h),001h		;badb   ; el paso del actor = 0x01
	ld (ix+017h),09ah		;badf
L_BAE3:
	ld (ix+008h),b		;bae3   ; guarda la velocidad Y del actor (alta)
	ret			;bae6
L_BAE7:
	dec (ix+017h)		;bae7
	ret nz			;baea
	ld (ix+017h),09ah		;baeb
	ld (ix+001h),000h		;baef   ; el paso del actor = 0x00
	ld (ix+007h),080h		;baf3   ; la velocidad Y del actor = 0x80
	ld (ix+008h),000h		;baf7   ; la velocidad Y del actor (alta) = 0x00
	ret			;bafb
L_BAFC:
	dec (ix+018h)		;bafc
	ret nz			;baff
	ld a,(ix+019h)		;bb00
	ld (ix+001h),a		;bb03   ; guarda el paso del actor
	ld (ix+006h),001h		;bb06   ; si el actor se mueve (p01:7336) = 0x01
	ret			;bb0a
L_BB0B:
	xor a			;bb0b
	ld (0c621h),a		;bb0c
	ret			;bb0f
crea_tipo_23:		; la creacion del tipo 23
	ld (ix+006h),001h		;bb10   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00eh),001h		;bb14   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+00bh),07eh		;bb18   ; el cuadro del actor = 0x7E
	call parado		;bb1c   ; parado: las dos velocidades a cero
	ld (ix+008h),006h		;bb1f   ; la velocidad Y del actor (alta) = 0x06
	ld a,013h		;bb23
	jp 0427ch		;bb25   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
crea_tipo_62:		; la creacion del tipo 62
	ld (ix+00bh),072h		;bb28   ; el cuadro del actor = 0x72
	ld (ix+00eh),001h		;bb2c   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	jp parado		;bb30   ; parado: las dos velocidades a cero
cuadro_tipo_62:		; lo de cada cuadro del tipo 62
	bit 0,(ix+001h)		;bb33   ; mira el bit 0 de el paso del actor
	ret nz			;bb37
	ld (ix+001h),001h		;bb38   ; el paso del actor = 0x01
	ld (ix+006h),001h		;bb3c   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+008h),006h		;bb40   ; la velocidad Y del actor (alta) = 0x06
	ld a,(ix+012h)		;bb44   ; lee la cuenta de espera del actor
	add a,0feh		;bb47
	ld (ix+00ah),a		;bb49   ; guarda la velocidad X del actor (alta)
	ld a,005h		;bb4c
	jp 0427ch		;bb4e   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
crea_tipo_26:		; la creacion del tipo 26
	ld a,(0c5b3h)		;bb51
	or a			;bb54
	jp nz,0737bh		;bb55   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld (ix+006h),001h		;bb58   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+00eh),003h		;bb5c   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	ld a,(ix+003h)		;bb60   ; lee la Y del actor
	rlca			;bb63
	rlca			;bb64
	and 001h		;bb65
	add a,003h		;bb67
	ld (ix+011h),a		;bb69   ; guarda la direccion del actor
	call cuadro_doble		;bb6c   ; cuadro_doble: cuadro = 2 x A
	call parado		;bb6f   ; parado: las dos velocidades a cero
	jp espera_azar_bc95		;bb72   ; espera_azar_bc95: (ix+0x12) al azar (1-48)
cuadro_tipo_26:		; lo de cada cuadro del tipo 26
	ld a,(ix+01eh)		;bb75   ; lee las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	and 00fh		;bb78
	jp nz,L_BC29		;bb7a
	ld a,(ix+001h)		;bb7d   ; lee el paso del actor
	call 041eah		;bb80   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_BB83: 4 destinos del despachador p00:41EA (call en p03:BB80, el
;   indice en A): BB8B, BBC9, BC05, BC55; lo leen p03:BB80 (8 bytes)
;   0xbb83..0xbb8b  (8 bytes)
DATA_tabla_BB83:
	defw 0bb8bh,0bbc9h,0bc05h,0bc55h	; bb83  -> L_BB8B L_BBC9 L_BC05 L_BC55

; ======================================================================
; CODIGO 0xbb8b..0xbcd9  (334 bytes)
; ======================================================================


L_BB8B:
	ld a,(0c182h)		;bb8b   ; lee la Y de Snake
	sub (ix+003h)		;bb8e   ; le resta la Y del actor
	add a,010h		;bb91
	cp 021h		;bb93
	jr nc,L_BBB4		;bb95
L_BB97:
	ld (ix+001h),001h		;bb97   ; el paso del actor = 0x01
	call espera_azar_bc95		;bb9b   ; espera_azar_bc95: (ix+0x12) al azar (1-48)
	ld a,(0c184h)		;bb9e   ; lee la X de Snake
	cp (ix+005h)		;bba1   ; compara con la X del actor
	ld a,003h		;bba4
	jr c,L_BBA9		;bba6
	inc a			;bba8
L_BBA9:
	ld (ix+011h),a		;bba9   ; guarda la direccion del actor
	ld b,004h		;bbac
	call cuadro_dir_bc7f		;bbae   ; cuadro_dir_bc7f: cuadro de la direccion (ix+0x11), +1 con (ix+0x0C) AND B
	jp 09bcdh		;bbb1   ; velocidad_de_dir: las velocidades (ix+8, ix+0x0A) por la direccion (ix+0x11) (0x9BDB)
L_BBB4:
	dec (ix+012h)		;bbb4   ; baja la cuenta de espera del actor
	ret nz			;bbb7
	call espera_azar_bc95		;bbb8   ; espera_azar_bc95: (ix+0x12) al azar (1-48)
	ld a,r		;bbbb
	xor (ix+00ch)		;bbbd   ; XOR con la cuenta de cuadros del actor
	and 001h		;bbc0
	add a,a			;bbc2
	add a,082h		;bbc3
	ld (ix+00bh),a		;bbc5   ; guarda el cuadro del actor
	ret			;bbc8
L_BBC9:
	ld a,(0c182h)		;bbc9   ; lee la Y de Snake
	sub (ix+003h)		;bbcc   ; le resta la Y del actor
	add a,010h		;bbcf
	cp 021h		;bbd1
	jr nc,L_BBEA		;bbd3
	ld b,004h		;bbd5
	call cuadro_dir_bc7f		;bbd7   ; cuadro_dir_bc7f: cuadro de la direccion (ix+0x11), +1 con (ix+0x0C) AND B
	ld b,000h		;bbda
	ld c,(ix+011h)		;bbdc   ; lee la direccion del actor
	call 08292h		;bbdf   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	jr c,L_BB97		;bbe2
	dec (ix+012h)		;bbe4   ; baja la cuenta de espera del actor
	ret nz			;bbe7
	jr L_BB97		;bbe8
L_BBEA:
	ld (ix+001h),002h		;bbea   ; el paso del actor = 0x02
	ld a,(ix+005h)		;bbee   ; lee la X del actor
	cp 080h		;bbf1
	jr z,L_BC1C		;bbf3
	ld a,004h		;bbf5
	jr c,L_BBFA		;bbf7
	dec a			;bbf9
L_BBFA:
	ld (ix+011h),a		;bbfa   ; guarda la direccion del actor
	ld b,004h		;bbfd
	call cuadro_bc7f		;bbff   ; cuadro_bc7f: cuadro = 2 x A, +1 con (ix+0x0C) AND B
	jp velocidad_a90e		;bc02   ; velocidad_a90e: las velocidades de la direccion (ix+0x11) de la tabla 0xA90E
L_BC05:
	ld a,(0c182h)		;bc05   ; lee la Y de Snake
	sub (ix+003h)		;bc08   ; le resta la Y del actor
	add a,010h		;bc0b
	cp 021h		;bc0d
	jr c,L_BB97		;bc0f
	ld b,008h		;bc11
	call cuadro_dir_bc7f		;bc13   ; cuadro_dir_bc7f: cuadro de la direccion (ix+0x11), +1 con (ix+0x0C) AND B
	ld a,(ix+005h)		;bc16   ; lee la X del actor
	cp 080h		;bc19
	ret nz			;bc1b
L_BC1C:
	call cuadro_dir_bc92		;bc1c   ; cuadro_dir_bc92: cuadro = 2 x (ix+0x11)
	ld (ix+001h),000h		;bc1f   ; el paso del actor = 0x00
	ld (ix+00ah),000h		;bc23   ; la velocidad X del actor (alta) = 0x00
	jr espera_azar_bc95		;bc27
L_BC29:
	add a,003h		;bc29
	ld (ix+015h),a		;bc2b
	ld a,(ix+00ah)		;bc2e   ; lee la velocidad X del actor (alta)
	ld (ix+014h),a		;bc31
	ld a,(0c184h)		;bc34   ; lee la X de Snake
	cp (ix+005h)		;bc37   ; compara con la X del actor
	ld a,002h		;bc3a
	jr c,L_BC40		;bc3c
	ld a,0feh		;bc3e
L_BC40:
	ld (ix+00ah),a		;bc40   ; guarda la velocidad X del actor (alta)
	ld a,(ix+001h)		;bc43   ; lee el paso del actor
	ld (ix+013h),a		;bc46
	ld (ix+001h),003h		;bc49   ; el paso del actor = 0x03
	ld (ix+00eh),001h		;bc4d   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x01
	ld (ix+01eh),000h		;bc51   ; las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto) = 0x00
L_BC55:
	bit 7,(ix+00ah)		;bc55   ; mira el bit 7 de la velocidad X del actor (alta)
	ld bc,00004h		;bc59
	jr z,L_BC5F		;bc5c
	dec c			;bc5e
L_BC5F:
	call 08292h		;bc5f   ; choca_actor: choca con H = (ix+5), L = (ix+3)
	ld a,000h		;bc62
	jr c,L_BC6D		;bc64
	dec (ix+015h)		;bc66
	ret nz			;bc69
	ld a,(ix+014h)		;bc6a
L_BC6D:
	ld (ix+00ah),a		;bc6d   ; guarda la velocidad X del actor (alta)
	ld a,(ix+013h)		;bc70
	ld (ix+001h),a		;bc73   ; guarda el paso del actor
	ld (ix+00eh),003h		;bc76   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	ld b,004h		;bc7a
cuadro_dir_bc7f:		; cuadro de la direccion (ix+0x11), +1 con (ix+0x0C) AND B
	ld a,(ix+011h)		;bc7c   ; lee la direccion del actor
cuadro_bc7f:		; cuadro = 2 x A, +1 con (ix+0x0C) AND B
	add a,a			;bc7f
	ld c,a			;bc80
	ld a,(ix+00ch)		;bc81   ; lee la cuenta de cuadros del actor
	and b			;bc84
	ld a,c			;bc85
	jr z,L_BC89		;bc86
	inc a			;bc88
L_BC89:
	add a,07ch		;bc89
	ld (ix+00bh),a		;bc8b   ; guarda el cuadro del actor
	ret			;bc8e
cuadro_dir_bc92:		; cuadro = 2 x (ix+0x11)
	ld a,(ix+011h)		;bc8f   ; lee la direccion del actor
cuadro_doble:		; cuadro = 2 x A
	add a,a			;bc92
	jr L_BC89		;bc93
espera_azar_bc95:		; (ix+0x12) al azar (1-48)
	ld a,r		;bc95
	xor (ix+00ch)		;bc97   ; XOR con la cuenta de cuadros del actor
	srl a		;bc9a
	srl a		;bc9c
	srl a		;bc9e
	ld b,a			;bca0
	srl a		;bca1
	add a,b			;bca3
	inc a			;bca4
	ld (ix+012h),a		;bca5   ; guarda la cuenta de espera del actor
	ret			;bca8
crea_tipo_28:		; la creacion del tipo 28
	call 05bc1h		;bca9   ; colores_a_cero: escribe A y C alternos cada 5 bytes desde (ix+0x25)
	ld (ix+00eh),000h		;bcac   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld a,002h		;bcb0
	ld (ix+011h),a		;bcb2   ; guarda la direccion del actor
	call cuadro_a_mas_1b		;bcb5   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
	ld a,(0c151h)		;bcb8   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 008h		;bcbb
	jr z,L_BCC7		;bcbd
	ld a,032h		;bcbf
	ld (0c159h),a		;bcc1   ; guarda la musica que suena
	call 0427ch		;bcc4   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
L_BCC7:
	ld a,r		;bcc7
	xor (ix+00ch)		;bcc9   ; XOR con la cuenta de cuadros del actor
	and 00fh		;bccc
	inc a			;bcce
	ld (ix+012h),a		;bccf   ; guarda la cuenta de espera del actor
	ret			;bcd2
cuadro_tipo_28:		; lo de cada cuadro del tipo 28
	ld a,(ix+001h)		;bcd3   ; lee el paso del actor
	call 041eah		;bcd6   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_BCD9: 5 destinos del despachador p00:41EA (call en p03:BCD6, el
;   indice en A): BCE3, BD16, BD27, BD45, BD5A; lo leen p03:BCD6 (10 bytes)
;   0xbcd9..0xbce3  (10 bytes)
DATA_tabla_BCD9:
	defw 0bce3h,0bd16h,0bd27h,0bd45h,0bd5ah	; bcd9

; ======================================================================
; CODIGO 0xbce3..0xbda8  (197 bytes)
; ======================================================================


L_BCE3:
	dec (ix+012h)		;bce3   ; baja la cuenta de espera del actor
	ret nz			;bce6
	call azar_0_3		;bce7   ; azar_0_3: A = (R XOR (ix+0x0C)) AND 3
	cp 001h		;bcea
	jp c,L_BD11		;bcec
	jp z,L_BD03		;bcef
	ld (ix+001h),002h		;bcf2   ; el paso del actor = 0x02
	ld (ix+008h),002h		;bcf6   ; la velocidad Y del actor (alta) = 0x02
	inc (ix+006h)		;bcfa   ; sube si el actor se mueve (p01:7336)
	ld (ix+012h),00ah		;bcfd   ; la cuenta de espera del actor = 0x0A
	jr colores_4d		;bd01
L_BD03:
	ld (ix+001h),001h		;bd03   ; el paso del actor = 0x01
	ld (ix+012h),01eh		;bd07   ; la cuenta de espera del actor = 0x1E
	call cuadro_mas_1b		;bd0b   ; cuadro_mas_1b: cuadro = (ix+0x11) + 7 + (ix+0x1B)
	call colores_4d		;bd0e   ; colores_4d: (ix+0x0E) = 3 y los colores 0x02/0x4D
L_BD11:
	ld c,03dh		;bd11
	jp crea_encima		;bd13   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
L_BD16:
	dec (ix+012h)		;bd16   ; baja la cuenta de espera del actor
	ret nz			;bd19
	ld (ix+001h),000h		;bd1a   ; el paso del actor = 0x00
	ld (ix+00eh),000h		;bd1e   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	call 05bc1h		;bd22   ; colores_a_cero: escribe A y C alternos cada 5 bytes desde (ix+0x25)
	jr $-94		;bd25
L_BD27:
	call cuadro_por_direccion		;bd27   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	dec (ix+012h)		;bd2a   ; baja la cuenta de espera del actor
	ret nz			;bd2d
	ld (ix+001h),003h		;bd2e   ; el paso del actor = 0x03
	ld (ix+008h),000h		;bd32   ; la velocidad Y del actor (alta) = 0x00
	ld (ix+012h),019h		;bd36   ; la cuenta de espera del actor = 0x19
	call 08334h		;bd3a   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	ld (ix+011h),a		;bd3d   ; guarda la direccion del actor
	call cuadro_a_mas_1b		;bd40   ; cuadro_a_mas_1b: cuadro = A + 7 + (ix+0x1B)
	jr L_BD11		;bd43
L_BD45:
	dec (ix+012h)		;bd45   ; baja la cuenta de espera del actor
	ret nz			;bd48
	ld (ix+001h),004h		;bd49   ; el paso del actor = 0x04
	ld (ix+008h),0feh		;bd4d   ; la velocidad Y del actor (alta) = 0xFE
	ld (ix+011h),001h		;bd51   ; la direccion del actor = 0x01
	ld (ix+012h),00ah		;bd55   ; la cuenta de espera del actor = 0x0A
	ret			;bd59
L_BD5A:
	call cuadro_por_direccion		;bd5a   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	dec (ix+012h)		;bd5d   ; baja la cuenta de espera del actor
	ret nz			;bd60
	xor a			;bd61
	ld (ix+001h),a		;bd62   ; guarda el paso del actor
	ld (ix+008h),a		;bd65   ; guarda la velocidad Y del actor (alta)
	ld (ix+006h),001h		;bd68   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+011h),002h		;bd6c   ; la direccion del actor = 0x02
	ld (ix+00eh),a		;bd70   ; guarda con que choca el actor (bit 0 Snake, bit 1 proyectiles)
	call 05bc1h		;bd73   ; colores_a_cero: escribe A y C alternos cada 5 bytes desde (ix+0x25)
	jp L_BCC7		;bd76
colores_4d:		; (ix+0x0E) = 3 y los colores 0x02/0x4D
	ld (ix+00eh),003h		;bd79   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	ld de,0024dh		;bd7d
	ld (ix+025h),d		;bd80
	ld (ix+02ah),e		;bd83
	ld (ix+02fh),d		;bd86
	ld (ix+034h),e		;bd89
	ret			;bd8c
crea_tipo_32:		; la creacion del tipo 32
	ld hl,0c637h		;bd8d
	bit 0,(hl)		;bd90
	jp nz,0737bh		;bd92   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld (ix+012h),002h		;bd95   ; la cuenta de espera del actor = 0x02
	call parado		;bd99   ; parado: las dos velocidades a cero
	ld (ix+011h),004h		;bd9c   ; la direccion del actor = 0x04
	jr $+86		;bda0
cuadro_tipo_32:		; lo de cada cuadro del tipo 32
	ld a,(ix+001h)		;bda2   ; lee el paso del actor
	call 041eah		;bda5   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_BDA8: 6 destinos del despachador p00:41EA (call en p03:BDA5, el
;   indice en A): BDB4, BDCC, BE09, BE26, BE3B, BE5F; lo leen p03:BDA5 (12
;   bytes)
;   0xbda8..0xbdb4  (12 bytes)
DATA_tabla_BDA8:
	defw 0bdb4h,0bdcch,0be09h,0be26h,0be3bh,0be5fh	; bda8

; ======================================================================
; CODIGO 0xbdb4..0xbfaf  (507 bytes)
; ======================================================================


L_BDB4:
	dec (ix+012h)		;bdb4   ; baja la cuenta de espera del actor
	ret nz			;bdb7
	ld (ix+001h),001h		;bdb8   ; el paso del actor = 0x01
	call espera_azar_32		;bdbc   ; espera_azar_32: (ix+0x12) = 1-32 al azar
	ld hl,0c637h		;bdbf
	bit 1,(hl)		;bdc2
	ret nz			;bdc4
	set 1,(hl)		;bdc5
	ld a,093h		;bdc7
	jp 05cddh		;bdc9   ; ventana_de_texto_1: abre la ventana del texto A en el modo 1 (0xCEE0)
L_BDCC:
	call snake_cerca_48		;bdcc   ; snake_cerca_48: acarreo si Snake esta a menos de 0x48 en X y en Y
	jr c,L_BDEB		;bdcf
	call dx_a_snake_bf53		;bdd1   ; dx_a_snake_bf53: la distancia en X a Snake si esta en la fila
	jr nc,L_BDF8		;bdd4
	dec (ix+012h)		;bdd6   ; baja la cuenta de espera del actor
	ret nz			;bdd9
	ld (ix+001h),003h		;bdda   ; el paso del actor = 0x03
	ld (ix+006h),001h		;bdde   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+012h),005h		;bde2   ; la cuenta de espera del actor = 0x05
	call mira_a_snake_lado_2		;bde6   ; mira_a_snake_lado_2: en las filas 0x38/0xA8, la direccion de lado hacia Snake
	jr L_BDF6		;bde9
L_BDEB:
	ld (ix+001h),002h		;bdeb   ; el paso del actor = 0x02
	ld (ix+006h),001h		;bdef   ; si el actor se mueve (p01:7336) = 0x01
	call mira_a_snake_lado		;bdf3   ; mira_a_snake_lado: en las filas 0x38/0xA8, mira hacia Snake de lado
L_BDF6:
	jr direccion_be73		;bdf6
L_BDF8:
	ld (ix+001h),002h		;bdf8   ; el paso del actor = 0x02
	ld (ix+006h),001h		;bdfc   ; si el actor se mueve (p01:7336) = 0x01
	ld (ix+013h),002h		;be00
	call mira_a_snake_lado_2		;be04   ; mira_a_snake_lado_2: en las filas 0x38/0xA8, la direccion de lado hacia Snake
	jr direccion_be73		;be07
L_BE09:
	call direccion_be73		;be09   ; direccion_be73: A = (ix+0x11)
	call en_el_borde_x		;be0c   ; en_el_borde_x: si no se mueve en Y y esta en X = 0x18 o 0xC8
	call en_la_fila		;be0f   ; en_la_fila: Z si el actor esta en las filas 0x38/0xA8 o en 0x58/0x98
	ret nz			;be12
	call snake_cerca_48		;be13   ; snake_cerca_48: acarreo si Snake esta a menos de 0x48 en X y en Y
	jr c,L_BDEB		;be16
	call dx_a_snake_bf53		;be18   ; dx_a_snake_bf53: la distancia en X a Snake si esta en la fila
	ret nc			;be1b
	ld (ix+001h),001h		;be1c   ; el paso del actor = 0x01
	ld (ix+006h),000h		;be20   ; si el actor se mueve (p01:7336) = 0x00
	jr L_BE84		;be24
L_BE26:
	call direccion_be73		;be26   ; direccion_be73: A = (ix+0x11)
	dec (ix+012h)		;be29   ; baja la cuenta de espera del actor
	ret nz			;be2c
	ld (ix+001h),004h		;be2d   ; el paso del actor = 0x04
	ld (ix+006h),000h		;be31   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+012h),005h		;be35   ; la cuenta de espera del actor = 0x05
	jr L_BE84		;be39
L_BE3B:
	dec (ix+012h)		;be3b   ; baja la cuenta de espera del actor
	ret nz			;be3e
	ld (ix+001h),005h		;be3f   ; el paso del actor = 0x05
	ld (ix+006h),001h		;be43   ; si el actor se mueve (p01:7336) = 0x01
	ld a,(ix+011h)		;be47   ; lee la direccion del actor
	call 0835fh		;be4a   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
	ld (ix+011h),a		;be4d   ; guarda la direccion del actor
	call velocidad_doble		;be50   ; velocidad_doble: las velocidades de la direccion A (0xA916) al doble
	call fila_38_a8		;be53   ; fila_38_a8: Z si la Y del actor es 0x38 o 0xA8
	ld c,03ah		;be56
	jp nz,crea_encima		;be58   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
	inc c			;be5b
	jp crea_encima		;be5c   ; crea_encima: crea el actor C 0x10 puntos por encima de IX
L_BE5F:
	call direccion_be73		;be5f   ; direccion_be73: A = (ix+0x11)
	call en_la_fila		;be62   ; en_la_fila: Z si el actor esta en las filas 0x38/0xA8 o en 0x58/0x98
	ret nz			;be65
	ld (ix+001h),001h		;be66   ; el paso del actor = 0x01
	ld (ix+006h),000h		;be6a   ; si el actor se mueve (p01:7336) = 0x00
	call espera_azar_32		;be6e   ; espera_azar_32: (ix+0x12) = 1-32 al azar
	jr L_BE84		;be71
direccion_be73:		; A = (ix+0x11)
	ld a,(ix+011h)		;be73   ; lee la direccion del actor
L_BE76:
	add a,a			;be76
	add a,03fh		;be77
	bit 1,(ix+00ch)		;be79   ; mira el bit 1 de la cuenta de cuadros del actor
	jr nz,L_BE80		;be7d
	inc a			;be7f
L_BE80:
	ld (ix+00bh),a		;be80   ; guarda el cuadro del actor
	ret			;be83
L_BE84:
	call fila_38_a8		;be84   ; fila_38_a8: Z si la Y del actor es 0x38 o 0xA8
	ld b,002h		;be87
	jr z,L_BE90		;be89
	ld a,(ix+005h)		;be8b   ; lee la X del actor
	ld b,004h		;be8e
L_BE90:
	rlca			;be90
	and 001h		;be91
	sub b			;be93
	neg		;be94
	jr L_BE76		;be96
mira_a_snake_lado:		; en las filas 0x38/0xA8, mira hacia Snake de lado
	call fila_38_a8		;be98   ; fila_38_a8: Z si la Y del actor es 0x38 o 0xA8
	jr nz,L_BEBC		;be9b
	ld a,(0c184h)		;be9d   ; lee la X de Snake
	cp (ix+005h)		;bea0   ; compara con la X del actor
	ld a,004h		;bea3
	jr c,L_BEA8		;bea5
	dec a			;bea7
L_BEA8:
	ld (ix+011h),a		;bea8   ; guarda la direccion del actor
	ld a,(ix+011h)		;beab   ; lee la direccion del actor
velocidad_doble:		; las velocidades de la direccion A (0xA916) al doble
	call velocidad_a916		;beae   ; velocidad_a916: las velocidades de la direccion A de la tabla 0xA916
	sla e		;beb1
	sla d		;beb3
	ld (ix+008h),e		;beb5   ; guarda la velocidad Y del actor (alta)
	ld (ix+00ah),d		;beb8   ; guarda la velocidad X del actor (alta)
	ret			;bebb
L_BEBC:
	ld a,(0c182h)		;bebc   ; lee la Y de Snake
	cp (ix+003h)		;bebf   ; compara con la Y del actor
	ld a,002h		;bec2
	jr c,L_BEA8		;bec4
	dec a			;bec6
	jr L_BEA8		;bec7
mira_a_snake_lado_2:		; en las filas 0x38/0xA8, la direccion de lado hacia Snake
	call fila_38_a8		;bec9   ; fila_38_a8: Z si la Y del actor es 0x38 o 0xA8
	jr nz,L_BEDB		;becc
	ld a,(0c184h)		;bece   ; lee la X de Snake
	cp (ix+005h)		;bed1   ; compara con la X del actor
	ld a,003h		;bed4
	jr c,L_BEA8		;bed6
	inc a			;bed8
	jr L_BEA8		;bed9
L_BEDB:
	ld a,(0c182h)		;bedb   ; lee la Y de Snake
	cp (ix+003h)		;bede   ; compara con la Y del actor
	ld a,001h		;bee1
	jr c,L_BEA8		;bee3
	inc a			;bee5
	jr L_BEA8		;bee6
en_el_borde_x:		; si no se mueve en Y y esta en X = 0x18 o 0xC8
	call se_mueve_en_y		;bee8   ; se_mueve_en_y: NZ si la velocidad Y alta no es cero
	jr nz,L_BF02		;beeb
	ld a,(ix+005h)		;beed   ; lee la X del actor
	cp 018h		;bef0
	jr z,L_BEF7		;bef2
	cp 0c8h		;bef4
	ret nz			;bef6
L_BEF7:
	bit 7,(ix+003h)		;bef7   ; mira el bit 7 de la Y del actor
	ld a,002h		;befb
	jr z,L_BEA8		;befd
	dec a			;beff
	jr L_BEA8		;bf00
L_BF02:
	ld a,(ix+003h)		;bf02   ; lee la Y del actor
	cp 038h		;bf05
	jr z,L_BF0C		;bf07
	cp 0a8h		;bf09
	ret nz			;bf0b
L_BF0C:
	bit 7,(ix+005h)		;bf0c   ; mira el bit 7 de la X del actor
	ld a,004h		;bf10
	jr z,L_BEA8		;bf12
	dec a			;bf14
	jr L_BEA8		;bf15
espera_azar_32:		; (ix+0x12) = 1-32 al azar
	ld a,r		;bf17
	xor (ix+00ch)		;bf19   ; XOR con la cuenta de cuadros del actor
	and 01fh		;bf1c
	inc a			;bf1e
	ld (ix+012h),a		;bf1f   ; guarda la cuenta de espera del actor
	ret			;bf22
en_la_fila:		; Z si el actor esta en las filas 0x38/0xA8 o en 0x58/0x98
	call fila_38_a8		;bf23   ; fila_38_a8: Z si la Y del actor es 0x38 o 0xA8
	jr z,L_BF31		;bf26
	ld a,(ix+003h)		;bf28   ; lee la Y del actor
	cp 058h		;bf2b
	ret z			;bf2d
	cp 098h		;bf2e
	ret			;bf30
L_BF31:
	ld a,(ix+005h)		;bf31   ; lee la X del actor
	cp 030h		;bf34
	ret z			;bf36
	cp 070h		;bf37
	ret z			;bf39
	cp 0b0h		;bf3a
	ret			;bf3c
snake_cerca_48:		; acarreo si Snake esta a menos de 0x48 en X y en Y
	ld a,(0c184h)		;bf3d   ; lee la X de Snake
	sub (ix+005h)		;bf40   ; le resta la X del actor
	add a,048h		;bf43
	cp 091h		;bf45
	ret nc			;bf47
	ld a,(0c182h)		;bf48   ; lee la Y de Snake
	sub (ix+003h)		;bf4b   ; le resta la Y del actor
	add a,048h		;bf4e
	cp 091h		;bf50
	ret			;bf52
dx_a_snake_bf53:		; la distancia en X a Snake si esta en la fila
	call fila_38_a8		;bf53   ; fila_38_a8: Z si la Y del actor es 0x38 o 0xA8
	jr nz,L_BF60		;bf56
	ld a,(0c184h)		;bf58   ; lee la X de Snake
	sub (ix+005h)		;bf5b   ; le resta la X del actor
	jr L_BF66		;bf5e
L_BF60:
	ld a,(0c182h)		;bf60   ; lee la Y de Snake
	sub (ix+003h)		;bf63   ; le resta la Y del actor
L_BF66:
	add a,030h		;bf66
	cp 061h		;bf68
	ret			;bf6a
fila_38_a8:		; Z si la Y del actor es 0x38 o 0xA8
	ld a,(ix+003h)		;bf6b   ; lee la Y del actor
	cp 038h		;bf6e
	ret z			;bf70
	cp 0a8h		;bf71
	ret			;bf73
se_mueve_en_y:		; NZ si la velocidad Y alta no es cero
	ld a,(ix+008h)		;bf74   ; lee la velocidad Y del actor (alta)
	or a			;bf77
	ret			;bf78
crea_tipo_40:		; la creacion del tipo 40
	ld (ix+00eh),000h		;bf79   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld a,(0c136h)		;bf7d   ; lee la parada del ascensor
	cp 0f0h		;bf80
	ld (ix+012h),01eh		;bf82   ; la cuenta de espera del actor = 0x1E
	ld (ix+013h),005h		;bf86
	ret z			;bf8a
	ld (ix+013h),013h		;bf8b
	ret			;bf8f
cuadro_tipo_40:		; lo de cada cuadro del tipo 40
	ld a,(0c602h)		;bf90   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;bf93
	jp nz,07371h		;bf94
	dec (ix+012h)		;bf97   ; baja la cuenta de espera del actor
	ret nz			;bf9a
	ld (ix+012h),01eh		;bf9b   ; la cuenta de espera del actor = 0x1E
	dec (ix+013h)		;bf9f
	ret nz			;bfa2
	ld (ix+013h),017h		;bfa3
	ld c,00eh		;bfa7
	ld de,0f230h		;bfa9
	jp 0569ah		;bfac   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe

; ----------------------------------------------------------------------
; DATOS relleno_ff: 81 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (81 bytes)
;   0xbfaf..0xc000  (81 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfaf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfbf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfcf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfdf  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfef  ................
	defb 0ffh	; bfff
