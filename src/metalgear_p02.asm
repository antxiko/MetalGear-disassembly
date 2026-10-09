; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l82c7h:	equ 0x082c7

; ======================================================================
; CODIGO 0x8000..0x8037  (55 bytes)
; ======================================================================


guarda_para_el_telescopio:		; guarda 0xC639, 0xC15F y 0xC632, los sprites de 0x8037 en 0xEA10, colores 14 y patrones p06:A6F9
	ld (0c639h),a		;8000   ; guarda 0xC616 en 0xC639
	ld hl,(0c15fh)		;8003   ; lee la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna) y el byte siguiente (16 bits)
	ld (0c163h),hl		;8006   ; 0xC15F-0xC160 en 0xC163
	ld a,(0c632h)		;8009   ; 0xC632 en 0xC16A
	ld (0c16ah),a		;800c
	ld hl,0ea0eh		;800f   ; los atributos de los sprites desde 0xEA0E fuera
	ld de,0ea0fh		;8012
	ld bc,00057h		;8015
	ld (hl),0e0h		;8018
	ldir		;801a
	ld hl,08037h		;801c   ; los 6 sprites de la mira (0x8037) en 0xEA10
	ld de,0ea10h		;801f
	ld bc,00018h		;8022
	ldir		;8025
	ld hl,0e840h		;8027   ; 64 lineas de color 14 en 0xE840
	ld de,0e841h		;802a
	ld bc,0003fh		;802d
	ld (hl),00eh		;8030
	ldir		;8032
	jp 04c40h		;8034   ; patrones_a6f9: los patrones de p06:A6F9 (con su destino)

; ----------------------------------------------------------------------
; DATOS sprites_8037: 24 bytes, 6 fichas [y][x][patron][color], que p02:801C
;   copia a 0xEA10 (los sprites de la mira)
;   0x8037..0x804f  (24 bytes)
DATA_sprites_8037:
	defb 050h,070h,010h,000h	; 8037
	defb 050h,080h,014h,000h	; 803b
	defb 060h,070h,018h,000h	; 803f
	defb 060h,080h,01ch,000h	; 8043
	defb 0e0h,000h,000h,000h	; 8047
	defb 0e0h,000h,000h,000h	; 804b

; ======================================================================
; CODIGO 0x804f..0x806c  (29 bytes)
; ======================================================================


disparo_oido:		; si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
	ld a,(0c158h)		;804f   ; lee los 3 bits bajos de p12:A204 de la sala
	cp 001h		;8052   ; en las salas con el bit de p12:A204 = 1 no se oye
	ret z			;8054
	ld a,(0c130h)		;8055   ; lee la sala
	ld hl,0806ch		;8058   ; ni en las 55 salas de 0x806C
	ld b,037h		;805b
L_805D:
	cp (hl)			;805d   ; busca la sala
	ret z			;805e
	inc hl			;805f
	djnz L_805D		;8060
	ld a,(0c602h)		;8062   ; lee la bandera 0xC602 (refuerzos y musica)
	and a			;8065   ; con la bandera ya puesta, nada
	ret nz			;8066
	ld a,05ah		;8067   ; la cuenta de 0x5A cuadros
	jp 07d27h		;8069   ; pon_c602_con_cuenta: 0xC605 = A y pon_c602

; ----------------------------------------------------------------------
; DATOS salas_806c: 55 numeros de sala que p02:805D compara con 0xC130 (B =
;   0x37): si esta, vuelve sin hacer nada
;   0x806c..0x80a3  (55 bytes)
DATA_salas_806c:
	defb 005h,006h,009h,00ah,014h,01dh,025h,032h,040h,041h,042h,043h,044h,047h,053h,066h	; 806c  ......%2@ABCDGSf
	defb 067h,06eh,077h,078h,096h,0c1h,0d0h,0d1h,036h,037h,038h,039h,03ah,03bh,03ch,03dh	; 807c  gnwx....6789:.<=
	defb 03eh,03fh,05dh,05eh,05fh,060h,061h,062h,063h,064h,065h,06fh,070h,071h,072h,073h	; 808c  >?]^_`abcdeopqrs
	defb 074h,076h,07bh,07ch,07dh,0dch,0ddh	; 809c

; ======================================================================
; CODIGO 0x80a3..0x80c4  (33 bytes)
; ======================================================================


dispara:		; con arma, en salas < 0xE0 (no 0xCC) y sin las poses 2, 4, 7: el disparo del arma (tabla 0x80C4)
	ld a,(0c134h)		;80a3   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	and a			;80a6   ; sin arma, nada
	ret z			;80a7
	ld a,(0c130h)		;80a8   ; lee la sala
	cp 0cch		;80ab   ; en la sala 0xCC no se dispara
	ret z			;80ad
	cp 0e0h		;80ae   ; ni en los ascensores (0xE0+)
	ret nc			;80b0
	ld a,(0c18bh)		;80b1   ; lee el modo de la pose de Snake
	cp 002h		;80b4   ; ni en los modos de pose 2, 4 y 7
	ret z			;80b6
	cp 004h		;80b7
	ret z			;80b9
	cp 007h		;80ba
	ret z			;80bc
	ld a,(0c134h)		;80bd   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	dec a			;80c0   ; del arma 1-7 al indice
	call 041eah		;80c1   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_80C4: 7 destinos del despachador p00:41EA (call en p02:80C1, el
;   indice en A): 8364, 8416, 8538, 8632, 86EC, 87AC, 8817; lo leen p02:80C1
;   (14 bytes)
;   0x80c4..0x80d2  (14 bytes)
DATA_tabla_80C4:
	defw 08364h,08416h,08538h,08632h,086ech,087ach,08817h	; 80c4

; ======================================================================
; CODIGO 0x80d2..0x8140  (110 bytes)
; ======================================================================


hueco_de_proyectil:		; IX = el primer proyectil libre de 0xC200 y acarreo; sin acarreo si no hay
	ld hl,0c200h		;80d2   ; apunta a los proyectiles (0x180 bytes)
	ld de,00040h		;80d5   ; fichas de 0x40
	ld b,006h		;80d8   ; 6 proyectiles
L_80DA:
	ld a,(hl)			;80da   ; arma 0: libre
	and a			;80db
	jp z,L_80E4		;80dc
	add hl,de			;80df   ; la ficha siguiente
	djnz L_80DA		;80e0
	and a			;80e2   ; ninguna libre: sin acarreo
	ret			;80e3
L_80E4:
	push hl			;80e4   ; IX = la ficha libre
	pop ix		;80e5
	scf			;80e7   ; acarreo
	ret			;80e8
sprites_del_proyectil:		; reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ld a,(0c134h)		;80e9   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	dec a			;80ec   ; del arma 1-7 al indice
	ld hl,08140h		;80ed   ; 0x8140: cuantos sprites tiene cada arma
	call 041e0h		;80f0   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;80f3
	push ix		;80f4   ; IY = la ficha + 0x20
	pop iy		;80f6
	ld de,00020h		;80f8
	add iy,de		;80fb
	ld (iy+000h),c		;80fd   ; +0x20: cuantos sprites
	inc iy		;8100
	ld hl,0ea10h		;8102   ; los 6 huecos de sprite de los proyectiles (0xEA10)
	ld e,004h		;8105   ; desde el sprite 4
	ld b,006h		;8107
L_8109:
	ld a,(hl)			;8109   ; 0xE0: libre
	cp 0e0h		;810a
	jr nz,L_8121		;810c
	ld (iy+000h),e		;810e   ; +0x21 + 5 x n: el hueco
	ld (hl),0e1h		;8111   ; ocupado (0xE1)
	dec c			;8113   ; todos colocados: listo
	jp z,L_8130		;8114
	inc iy		;8117   ; el siguiente sprite de la ficha
	inc iy		;8119
	inc iy		;811b
	inc iy		;811d
	inc iy		;811f
L_8121:
	inc e			;8121   ; el hueco siguiente
	inc hl			;8122
	inc hl			;8123
	inc hl			;8124
	inc hl			;8125
	djnz L_8109		;8126
	push ix		;8128   ; no caben: se devuelven
	pop hl			;812a
	call quita_proyectil		;812b   ; quita_proyectil: el arma del proyectil a cero y sus sprites escondidos
	xor a			;812e   ; sin acarreo
	ret			;812f
L_8130:
	ld a,(0c134h)		;8130   ; el arma en la ficha
	ld (ix+000h),a		;8133   ; guarda el arma del proyectil
	ld (ix+001h),000h		;8136   ; el paso y la cuenta a cero
	ld (ix+002h),000h		;813a   ; la cuenta del proyectil = 0x00
	scf			;813e   ; acarreo: hecho
	ret			;813f

; ----------------------------------------------------------------------
; DATOS tabla_por_arma: 7 bytes (1, 1, 2, 4, 4, 2, 4), uno por arma 1-7:
;   p02:80ED lee 0x8140 + arma - 1 (0xC134) y lo deja en C
;   0x8140..0x8147  (7 bytes)
DATA_tabla_por_arma:
	defb 001h,001h,002h,004h,004h,002h,004h	; 8140

; ======================================================================
; CODIGO 0x8147..0x8168  (33 bytes)
; ======================================================================


proyectiles:		; un cuadro de los 6 proyectiles por su arma (tabla 0x8168); 0xFF lo quita
	ld hl,0c200h		;8147   ; apunta a los proyectiles (0x180 bytes)
	ld b,006h		;814a   ; 6 proyectiles
L_814C:
	push bc			;814c
	push hl			;814d
	ld a,(hl)			;814e   ; arma 0: libre
	and a			;814f
	call nz,un_proyectil		;8150   ; un_proyectil: el proyectil HL por su arma (tabla 0x8168); 0xFF lo quita
	pop hl			;8153
	ld de,00040h		;8154   ; la ficha siguiente
	add hl,de			;8157
	pop bc			;8158
	djnz L_814C		;8159
	ret			;815b
un_proyectil:		; el proyectil HL por su arma (tabla 0x8168); 0xFF lo quita
	push hl			;815c
	pop ix		;815d
	inc a			;815f   ; 0xFF: quitarlo
	jp z,quita_proyectil		;8160   ; quita_proyectil: el arma del proyectil a cero y sus sprites escondidos
	dec a			;8163   ; del arma 1-7 al indice
	dec a			;8164
	call 041eah		;8165   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_8168: 7 destinos del despachador p00:41EA (call en p02:8165, el
;   indice en A): 83EE, 83EE, 85B1, 86B2, 8763, 87F3, 8897; lo leen p02:8165
;   (14 bytes)
;   0x8168..0x8176  (14 bytes)
DATA_tabla_8168:
	defw 083eeh,083eeh,085b1h,086b2h,08763h,087f3h,08897h	; 8168

; ======================================================================
; CODIGO 0x8176..0x82cb  (341 bytes)
; ======================================================================


sprites_de_los_proyectiles:		; los sprites de los proyectiles a 0xEA00 y sus colores a 0xE800
	ld hl,0c200h		;8176   ; apunta a los proyectiles (0x180 bytes)
	ld b,006h		;8179   ; 6 proyectiles
L_817B:
	push bc			;817b
	push hl			;817c
	ld a,(hl)			;817d   ; libre: el siguiente
	and a			;817e
	jr z,L_81B2		;817f
	ld a,020h		;8181   ; +0x20: cuantos sprites
	call 041e0h		;8183   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;8186
	inc hl			;8187   ; +0x21: el hueco del primero
	ld c,0ffh		;8188
L_818A:
	push bc			;818a   ; un sprite
	ld a,(hl)			;818b   ; el hueco...
	ld de,0ea00h		;818c   ; apunta a la copia de los atributos de los sprites
	add a,a			;818f   ; ...4 bytes en la copia de atributos
	add a,a			;8190
	ld b,a			;8191
	call 041e5h		;8192   ; de_mas_a: DE = DE + A
	inc hl			;8195
	ldi		;8196   ; y, x, patron
	ldi		;8198
	ldi		;819a
	push hl			;819c
	ld de,0e800h		;819d   ; los colores: 0xE800 + 16 x hueco
	ld a,b			;81a0
	call 042beh		;81a1   ; cuatro_a: HL = 4 x A
	add hl,de			;81a4
	ex de,hl			;81a5
	pop hl			;81a6
	ld a,(hl)			;81a7   ; el color...
	inc hl			;81a8
	ld b,010h		;81a9   ; ...en sus 16 lineas
L_81AB:
	ld (de),a			;81ab
	inc de			;81ac
	djnz L_81AB		;81ad
	pop bc			;81af   ; el sprite siguiente
	djnz L_818A		;81b0
L_81B2:
	pop hl			;81b2   ; la ficha siguiente
	ld de,00040h		;81b3
	add hl,de			;81b6
	pop bc			;81b7
	djnz L_817B		;81b8
	ret			;81ba
mueve_proyectil:		; la Y (ix+3, 4) y la X (ix+5, 6) del proyectil mas sus velocidades
	ld e,(ix+003h)		;81bb   ; lee la Y del proyectil (fraccion)
	ld d,(ix+004h)		;81be   ; lee la Y del proyectil
	ld l,(ix+007h)		;81c1   ; lee la velocidad Y del proyectil
	ld h,(ix+008h)		;81c4   ; lee la velocidad Y del proyectil (alta)
	add hl,de			;81c7   ; + la velocidad Y
	ld (ix+003h),l		;81c8   ; guarda la Y del proyectil (fraccion)
	ld (ix+004h),h		;81cb   ; guarda la Y del proyectil
mueve_proyectil_x:		; la X del proyectil (ix+5, 6) mas la velocidad (ix+9, 0x0A)
	ld e,(ix+005h)		;81ce   ; lee la X del proyectil (fraccion)
	ld d,(ix+006h)		;81d1   ; lee la X del proyectil
	ld l,(ix+009h)		;81d4   ; lee la velocidad X del proyectil
	ld h,(ix+00ah)		;81d7   ; lee la velocidad X del proyectil (alta)
	add hl,de			;81da   ; + la velocidad X
	ld (ix+005h),l		;81db   ; guarda la X del proyectil (fraccion)
	ld (ix+006h),h		;81de   ; guarda la X del proyectil
	ret			;81e1
mueve_proyectil_suelo:		; la X y la Y del suelo del proyectil
	call mueve_proyectil_x		;81e2   ; mueve_proyectil_x: la X del proyectil (ix+5, 6) mas la velocidad (ix+9, 0x0A)
mueve_suelo:		; la Y del suelo (ix+0x0D, 0x0E) mas la velocidad Y (ix+7, 8)
	ld e,(ix+00dh)		;81e5   ; lee la Y del suelo bajo el proyectil (fraccion)
	ld d,(ix+00eh)		;81e8   ; lee la Y del suelo bajo el proyectil
	ld l,(ix+007h)		;81eb   ; lee la velocidad Y del proyectil
	ld h,(ix+008h)		;81ee   ; lee la velocidad Y del proyectil (alta)
	add hl,de			;81f1   ; + la velocidad Y
	ld (ix+00dh),l		;81f2   ; guarda la Y del suelo bajo el proyectil (fraccion)
	ld (ix+00eh),h		;81f5   ; guarda la Y del suelo bajo el proyectil
	ret			;81f8
choca_proyectil:		; acarreo si el proyectil (ix+4, ix+6) choca con una pared hacia (ix+0x0C)
	ld l,(ix+004h)		;81f9   ; lee la Y del proyectil
	jr L_8201		;81fc
choca_suelo:		; acarreo si el suelo del proyectil (ix+0x0E, ix+6) choca con una pared
	ld l,(ix+00eh)		;81fe   ; lee la Y del suelo bajo el proyectil
L_8201:
	ld c,(ix+00ch)		;8201   ; lee la direccion del proyectil
	ld b,002h		;8204   ; la caja grande, hacia su direccion
	ld h,(ix+006h)		;8206   ; lee la X del proyectil
	jp choca		;8209   ; choca: acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)
proyectil_fuera:		; si el proyectil sale (Y >= 0xB8, X >= 0xF8 o < 9) lo quita
	ld a,(ix+004h)		;820c   ; lee la Y del proyectil
	cp 0b8h		;820f
	jp nc,quita_proyectil		;8211   ; Y >= 0xB8: fuera
	ld a,(ix+006h)		;8214   ; lee la X del proyectil
	cp 0f8h		;8217
	jp nc,quita_proyectil		;8219   ; X >= 0xF8: fuera
	cp 009h		;821c   ; X < 9: fuera
	ret nc			;821e
quita_proyectil:		; el arma del proyectil a cero y sus sprites escondidos
	push ix		;821f
	pop de			;8221
	ld (ix+000h),000h		;8222   ; el arma del proyectil = 0x00
	ld a,020h		;8226   ; +0x20: cuantos sprites
	call 041e5h		;8228   ; de_mas_a: DE = DE + A
	ld a,(de)			;822b
	ld b,a			;822c
	inc de			;822d
L_822E:
	ld a,(de)			;822e   ; el hueco de cada sprite...
	ld hl,0ea00h		;822f   ; apunta a la copia de los atributos de los sprites
	add a,a			;8232
	call 041dfh		;8233   ; hl_mas_2a: HL = HL + 2 x A
	ld (hl),0e0h		;8236   ; ...fuera de la pantalla
	inc de			;8238   ; el sprite siguiente (5 bytes)
	inc de			;8239
	inc de			;823a
	inc de			;823b
	inc de			;823c
	djnz L_822E		;823d
	ret			;823f
ventana_crece:		; el recuadro de la ventana crece un paso (0xC528); acarreo al acabar
	ld hl,0c528h		;8240   ; la cuenta de pasos de la ventana
	dec (hl)			;8243
	jr z,L_8290		;8244   ; al acabar, acarreo
	ld c,000h		;8246   ; borra el marco de antes (color 0)
	call marco_de_ventana		;8248   ; marco_de_ventana: el recuadro 0xC529 de 0xC52D en el color C
	ld a,(0c529h)		;824b   ; la X baja el paso X...
	ld hl,0c52bh		;824e
	sub (hl)			;8251
	ld (0c529h),a		;8252
	ld a,(hl)			;8255   ; ...y el ancho crece el doble
	ld hl,0c52dh		;8256
	add a,a			;8259
	add a,(hl)			;825a
	ld (hl),a			;825b
	ld a,(0c52ah)		;825c   ; la Y baja el paso Y...
	ld hl,0c52ch		;825f
	sub (hl)			;8262
	ld (0c52ah),a		;8263
	ld a,(hl)			;8266   ; ...y el alto crece el doble
	ld hl,0c52eh		;8267
	add a,a			;826a
	add a,(hl)			;826b
	ld (hl),a			;826c
	ld hl,(0c529h)		;826d   ; el interior...
	inc h			;8270
	inc l			;8271
	ld bc,(0c52dh)		;8272   ; ...2 menos de ancho y de alto...
	dec c			;8276
	dec c			;8277
	dec b			;8278
	dec b			;8279
	xor a			;827a   ; ...a negro
	ld d,a			;827b
	call 04f91h		;827c   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
	ld a,(0c52fh)		;827f   ; el marco nuevo en su color (0xC52F)
	ld c,a			;8282
marco_de_ventana:		; el recuadro 0xC529 de 0xC52D en el color C
	ld hl,(0c529h)		;8283
	ld de,(0c52dh)		;8286
	inc e			;828a
	call 04f63h		;828b   ; recuadro: un recuadro de D x E desde (H, L) en el color C
	and a			;828e   ; sin acarreo
	ret			;828f
L_8290:
	scf			;8290
	ret			;8291
choca_actor:		; choca con H = (ix+5), L = (ix+3)
	ld l,(ix+003h)		;8292
	ld h,(ix+005h)		;8295
choca:		; acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)
	ld (0ec00h),hl		;8298   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,b			;829b   ; la caja: (4 x B + C) x 4 en 0x82CB
	add a,a			;829c
	add a,a			;829d
	add a,c			;829e
	add a,a			;829f
	add a,a			;82a0
	ld hl,l82c7h		;82a1
	ld d,000h		;82a4
	ld e,a			;82a6
	add hl,de			;82a7
	ld b,002h		;82a8   ; 2 puntos por caja
L_82AA:
	ld a,(0ec00h)		;82aa   ; lee la casilla de trabajo 0xEC00
	add a,(hl)			;82ad   ; la Y + el desplazamiento
	ld e,a			;82ae
	inc hl			;82af
	ld a,(0ec01h)		;82b0   ; la X + el desplazamiento
	add a,(hl)			;82b3
	inc hl			;82b4
	push hl			;82b5
	ld h,a			;82b6   ; la ficha de la sala en ese punto
	ld l,e			;82b7
	call 05c09h		;82b8   ; ficha_en_el_punto: HL = 0xE000 + (L / 8) x 32 + H / 8: la ficha de la sala montada en ese punto
	ld d,000h		;82bb   ; su byte de choque en 0xC700
	ld e,(hl)			;82bd
	ld hl,0c700h		;82be
	add hl,de			;82c1
	ld a,(hl)			;82c2
	rra			;82c3   ; bit 0: pared
	pop hl			;82c4
	jr c,L_82C9		;82c5   ; pared: acarreo
L_82C7:
	djnz L_82AA		;82c7   ; el otro punto
L_82C9:
	ld a,c			;82c9
	ret			;82ca

; ----------------------------------------------------------------------
; DATOS cajas_de_choque: 12 fichas de 4 bytes, dos parejas [dy][dx] cada una,
;   que p02:82AA recorre (B = 2) sumando a la posicion (la Y en 0xEC00, la X
;   en 0xEC01) y mirando en 0xC700 si la ficha choca (L_5C09); p02:82A1 elige
;   la ficha con 0x82C7 + 4 x (4 x B + C)
;   0x82cb..0x82fb  (48 bytes)
DATA_cajas_de_choque:
	defb 0fbh,0fah,0fbh,005h	; 82cb
	defb 004h,0fah,004h,005h	; 82cf
	defb 0fch,0f8h,003h,0f8h	; 82d3
	defb 0fch,007h,003h,007h	; 82d7
	defb 0f7h,0f8h,0f7h,007h	; 82db
	defb 008h,0f8h,008h,007h	; 82df
	defb 0f8h,0f7h,007h,0f7h	; 82e3
	defb 0f8h,008h,007h,008h	; 82e7
	defb 0fbh,0fch,0fbh,003h	; 82eb
	defb 004h,0fch,004h,003h	; 82ef
	defb 0fch,0fbh,003h,0fbh	; 82f3
	defb 0fch,004h,003h,004h	; 82f7

; ======================================================================
; CODIGO 0x82fb..0x83e6  (235 bytes)
; ======================================================================


fichas_de_snake:		; H y L = las dos fichas de la sala bajo Snake
	ld a,(0c184h)		;82fb   ; lee la X de Snake
	sub 004h		;82fe   ; la X - 4
	ld h,a			;8300
	ld a,(0c182h)		;8301   ; lee la Y de Snake
	ld l,a			;8304   ; y la Y
fichas_en_el_punto:		; H y L = la ficha de la sala en el punto HL y la siguiente
	call 05c09h		;8305   ; ficha_en_el_punto: HL = 0xE000 + (L / 8) x 32 + H / 8: la ficha de la sala montada en ese punto
	ld a,(hl)			;8308   ; H = la ficha del punto, L = la siguiente
	inc hl			;8309
	ld l,(hl)			;830a
	ld h,a			;830b
	ret			;830c
cuadro_tipo_47:		; lo de cada cuadro del tipo 47
	ld l,(ix+003h)		;830d   ; lee la Y del actor
	ld h,(ix+005h)		;8310   ; lee la X del actor
	call 05c09h		;8313   ; ficha_en_el_punto: HL = 0xE000 + (L / 8) x 32 + H / 8: la ficha de la sala montada en ese punto
	ld b,002h		;8316   ; dos filas de fichas
L_8318:
	ld d,000h		;8318
	ld a,(hl)			;831a   ; las fichas 0x6B y 0x6E: nada
	cp 06bh		;831b
	ret z			;831d
	cp 06eh		;831e
	ret z			;8320
	ld e,a			;8321   ; su byte de choque
	push hl			;8322
	ld hl,0c700h		;8323
	add hl,de			;8326
	ld a,(hl)			;8327
	rra			;8328   ; sin pared: nada
	pop hl			;8329
	ret nc			;832a
	ld de,00040h		;832b   ; la fila de abajo (2 filas de 32)
	add hl,de			;832e
	djnz L_8318		;832f
	jp 07371h		;8331   ; en una pared: se quita
hacia_snake_dir:		; A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	ld a,(0c182h)		;8334   ; lee la Y de Snake
	sub (ix+003h)		;8337   ; le resta la Y del actor
	ld d,002h		;833a   ; Snake por debajo: abajo (2)
	jr nc,L_8341		;833c
	dec d			;833e   ; por encima: arriba (1)
	neg		;833f
L_8341:
	ld b,a			;8341   ; B = |dy|
	ld a,(0c184h)		;8342   ; lee la X de Snake
	sub (ix+005h)		;8345   ; le resta la X del actor
	ld e,004h		;8348   ; Snake a la derecha: 4
	jr nc,L_834F		;834a
	dec e			;834c   ; a la izquierda: 3
	neg		;834d
L_834F:
	cp b			;834f   ; |dx| < |dy|: manda la vertical
	ld a,d			;8350
	ld b,e			;8351
	ret c			;8352
	ld a,e			;8353   ; si no, la horizontal
	ld b,d			;8354
	ret			;8355
lejos_de_snake_dir:		; las direcciones contrarias a las de hacia_snake_dir
	call hacia_snake_dir		;8356   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	ld c,b			;8359   ; C = la otra
	call contraria		;835a   ; contraria: A = la direccion contraria (1 y 2, 3 y 4)
	ld b,a			;835d   ; B = la contraria de la principal
	ld a,c			;835e
contraria:		; A = la direccion contraria (1 y 2, 3 y 4)
	dec a			;835f   ; 1 <-> 2, 3 <-> 4
	xor 001h		;8360
	inc a			;8362
	ret			;8363
dispara_hand_gun:		; HAND GUN: con la tecla 0x10 nueva gasta una bala y la lanza (sonido 0x0C, 0x0E con SILENCER)
	ld a,(0c006h)		;8364   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 010h		;8367   ; la tecla 0x10 nueva
	ret z			;8369
	ld a,001h		;836a   ; la HAND GUN en la lista
	call 043e8h		;836c   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;836f   ; la municion
	ld (0ec00h),hl		;8370   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(hl)			;8373
	inc hl			;8374
	or (hl)			;8375
	ld a,015h		;8376   ; sin balas: el sonido 0x15
	jp z,0427ch		;8378   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	call hueco_de_proyectil		;837b   ; hueco_de_proyectil: IX = el primer proyectil libre de 0xC200 y acarreo; sin acarreo si no hay
	ret nc			;837e   ; ningun hueco libre
	call sprites_del_proyectil		;837f   ; sprites_del_proyectil: reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ret nc			;8382   ; sin sprites libres
	ld hl,(0ec00h)		;8383   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,000h		;8386   ; gasta una (C = 0: solo pinta)
	call 04613h		;8388   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld (ix+002h),010h		;838b   ; la cuenta del proyectil = 0x10
	ld (ix+00fh),001h		;838f   ; si el proyectil hiere (bit 0) = 0x01
	ld a,(0c182h)		;8393   ; lee la Y de Snake
	ld (ix+003h),000h		;8396   ; la Y del proyectil (fraccion) = 0x00
	ld (ix+00dh),000h		;839a   ; la Y del suelo bajo el proyectil (fraccion) = 0x00
	ld (ix+00eh),a		;839e   ; el suelo: la Y de Snake
	sub 00eh		;83a1   ; la bala sale 0x0E por encima
	ld (ix+004h),a		;83a3   ; guarda la Y del proyectil
	ld a,(0c184h)		;83a6   ; lee la X de Snake
	ld (ix+005h),000h		;83a9   ; la X del proyectil (fraccion) = 0x00
	ld (ix+006h),a		;83ad   ; guarda la X del proyectil
	ld a,(0c185h)		;83b0   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (ix+00ch),a		;83b3   ; guarda la direccion del proyectil
	ld hl,083e6h		;83b6   ; la velocidad por la direccion (0x83E6)
	call 041deh		;83b9   ; hl_mas_2a_menos_2: HL = HL + 2 x (A - 1)
	ld (ix+007h),000h		;83bc   ; la velocidad Y del proyectil = 0x00
	ld a,(hl)			;83c0
	ld (ix+008h),a		;83c1   ; guarda la velocidad Y del proyectil (alta)
	inc hl			;83c4
	ld (ix+009h),000h		;83c5   ; la velocidad X del proyectil = 0x00
	ld a,(hl)			;83c9
	ld (ix+00ah),a		;83ca   ; guarda la velocidad X del proyectil (alta)
	ld (ix+00bh),000h		;83cd   ; el cuadro del proyectil = 0x00
	ld a,(0c51ch)		;83d1   ; con SILENCER (0xC51C)...
	and a			;83d4
	ld a,00ch		;83d5   ; ...el sonido 0x0E; sin el, el 0x0C...
	jr z,L_83DB		;83d7
	ld a,00eh		;83d9
L_83DB:
	push af			;83db
	call 04284h		;83dc   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
	pop af			;83df   ; ...y sin SILENCER se oye (disparo_oido)
	call z,disparo_oido		;83e0   ; disparo_oido: si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
	jp 053dah		;83e3   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido

; ----------------------------------------------------------------------
; DATOS velocidad_de_la_bala: 4 parejas [dy][dx], una por direccion 1-4
;   (0xC185: arriba, abajo, izquierda, derecha; p01:63FC): p02:83B6 lee 0x83E6
;   + 2 x (direccion - 1) con L_41DE
;   0x83e6..0x83ee  (8 bytes)
DATA_velocidad_de_la_bala:
	defb 0fah,000h	; 83e6
	defb 006h,000h	; 83e8
	defb 000h,0fah	; 83ea
	defb 000h,006h	; 83ec

; ======================================================================
; CODIGO 0x83ee..0x84b8  (202 bytes)
; ======================================================================


vuela_bala:		; la bala de las armas 1 y 2: vida (ix+2), mueve, choca y sale
	dec (ix+002h)		;83ee   ; baja la cuenta del proyectil
	jp z,quita_proyectil		;83f1   ; quita_proyectil: el arma del proyectil a cero y sus sprites escondidos
	call mueve_proyectil		;83f4   ; mueve_proyectil: la Y (ix+3, 4) y la X (ix+5, 6) del proyectil mas sus velocidades
	call mueve_suelo		;83f7   ; mueve_suelo: la Y del suelo (ix+0x0D, 0x0E) mas la velocidad Y (ix+7, 8)
	call choca_proyectil		;83fa   ; choca_proyectil: acarreo si el proyectil (ix+4, ix+6) choca con una pared hacia (ix+0x0C)
	jr nc,L_8405		;83fd   ; sin pared por arriba, sigue
	call choca_suelo		;83ff   ; choca_suelo: acarreo si el suelo del proyectil (ix+0x0E, ix+6) choca con una pared
	jp c,quita_proyectil		;8402   ; quita_proyectil: el arma del proyectil a cero y sus sprites escondidos
L_8405:
	call proyectil_fuera		;8405   ; proyectil_fuera: si el proyectil sale (Y >= 0xB8, X >= 0xF8 o < 9) lo quita
	jp 053dah		;8408   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido
sin_balas:		; el sonido 0x15 y la cuenta de la SMG a cero
	ld a,015h		;840b   ; el sonido 0x15 (sin balas)
	call 0427ch		;840d   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
dos_ceros:		; pone a cero (HL) y (HL + 1)
	ld (hl),000h		;8410
	inc hl			;8412
	ld (hl),000h		;8413
	ret			;8415
dispara_smg:		; SMG: con la tecla 0x10 mantenida, una bala cada 2 cuadros en abanico (0xC19F, 0x84B8)
	ld hl,0c19eh		;8416   ; 0xC19E: la cuenta de cadencia
	ld a,(0c007h)		;8419   ; lee las teclas que hay
	and 010h		;841c   ; sin la tecla 0x10, la cuenta y el abanico a cero
	jr z,dos_ceros		;841e
	inc (hl)			;8420   ; cada 2 cuadros
	ld a,(hl)			;8421
	cp 002h		;8422
	ret nz			;8424
	ld (hl),000h		;8425
	inc hl			;8427   ; 0xC19F: la posicion del abanico (1-8)
	inc (hl)			;8428
	ld a,(hl)			;8429
	cp 009h		;842a
	jr nz,L_8430		;842c
	ld (hl),001h		;842e
L_8430:
	ld a,002h		;8430   ; la SMG en la lista
	call 043e8h		;8432   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8435
	ld (0ec00h),hl		;8436   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(hl)			;8439   ; sin balas: el sonido 0x15
	inc hl			;843a
	or (hl)			;843b
	jr z,sin_balas		;843c
	call hueco_de_proyectil		;843e   ; hueco_de_proyectil: IX = el primer proyectil libre de 0xC200 y acarreo; sin acarreo si no hay
	ret nc			;8441   ; ningun hueco libre
	call sprites_del_proyectil		;8442   ; sprites_del_proyectil: reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ret nc			;8445   ; sin sprites libres
	ld hl,(0ec00h)		;8446   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,000h		;8449   ; gasta una
	call 04613h		;844b   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld (ix+002h),010h		;844e   ; la cuenta del proyectil = 0x10
	ld (ix+00fh),001h		;8452   ; si el proyectil hiere (bit 0) = 0x01
	ld a,(0c182h)		;8456   ; lee la Y de Snake
	ld (ix+003h),000h		;8459   ; la Y del proyectil (fraccion) = 0x00
	ld (ix+00dh),000h		;845d   ; la Y del suelo bajo el proyectil (fraccion) = 0x00
	ld (ix+00eh),a		;8461   ; guarda la Y del suelo bajo el proyectil
	sub 00eh		;8464   ; la bala sale 0x0E por encima
	ld (ix+004h),a		;8466   ; guarda la Y del proyectil
	ld a,(0c184h)		;8469   ; lee la X de Snake
	ld (ix+005h),000h		;846c   ; la X del proyectil (fraccion) = 0x00
	ld (ix+006h),a		;8470   ; guarda la X del proyectil
	ld a,(0c185h)		;8473   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (ix+00ch),a		;8476   ; guarda la direccion del proyectil
	dec a			;8479   ; 16 bytes por direccion...
	add a,a			;847a
	add a,a			;847b
	add a,a			;847c
	add a,a			;847d
	ld hl,084b8h		;847e   ; ...en 0x84B8
	call 041dfh		;8481   ; hl_mas_2a: HL = HL + 2 x A
	ld a,(0c19fh)		;8484   ; 4 por posicion del abanico
	dec a			;8487
	add a,a			;8488
	call 041dfh		;8489   ; hl_mas_2a: HL = HL + 2 x A
	ld a,(hl)			;848c
	ld (ix+007h),a		;848d   ; guarda la velocidad Y del proyectil
	inc hl			;8490
	ld a,(hl)			;8491
	ld (ix+008h),a		;8492   ; guarda la velocidad Y del proyectil (alta)
	inc hl			;8495
	ld a,(hl)			;8496
	ld (ix+009h),a		;8497   ; guarda la velocidad X del proyectil
	inc hl			;849a
	ld a,(hl)			;849b
	ld (ix+00ah),a		;849c   ; guarda la velocidad X del proyectil (alta)
	ld (ix+00bh),000h		;849f   ; el cuadro del proyectil = 0x00
	ld a,(0c51ch)		;84a3   ; con SILENCER, el sonido 0x0E; sin el, el 0x0D y se oye
	and a			;84a6
	ld a,00dh		;84a7
	jr z,L_84AD		;84a9
	ld a,00eh		;84ab
L_84AD:
	push af			;84ad
	call 0427ch		;84ae   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	pop af			;84b1
	call z,disparo_oido		;84b2   ; disparo_oido: si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
	jp 053dah		;84b5   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido

; ----------------------------------------------------------------------
; DATOS velocidades_de_la_metralleta: 16 fichas de 8 bytes: p02:847E lee 4
;   bytes desde 0x84B8 + 8 x A + 2 x (0xC19F - 1), la velocidad de la Y
;   (ix+7/8) y la de la X (ix+9/0xA), de 16 bits
;   0x84b8..0x8538  (128 bytes)
DATA_velocidades_de_la_metralleta:
	defb 000h,0fah,000h,000h,000h,0fah,080h,0feh	; 84b8  ........
	defb 000h,0fah,000h,0fdh,000h,0fah,080h,0feh	; 84c0  ........
	defb 000h,0fah,000h,000h,000h,0fah,080h,001h	; 84c8  ........
	defb 000h,0fah,000h,003h,000h,0fah,080h,001h	; 84d0  ........
	defb 000h,006h,000h,000h,000h,006h,080h,0feh	; 84d8  ........
	defb 000h,006h,000h,0fdh,000h,006h,080h,0feh	; 84e0  ........
	defb 000h,006h,000h,000h,000h,006h,080h,001h	; 84e8  ........
	defb 000h,006h,000h,003h,000h,006h,080h,001h	; 84f0  ........
	defb 000h,000h,000h,0fah,080h,001h,000h,0fah	; 84f8  ........
	defb 000h,003h,000h,0fah,080h,001h,000h,0fah	; 8500  ........
	defb 000h,000h,000h,0fah,080h,0feh,000h,0fah	; 8508  ........
	defb 000h,0fdh,000h,0fah,080h,0feh,000h,0fah	; 8510  ........
	defb 000h,000h,000h,006h,080h,001h,000h,006h	; 8518  ........
	defb 000h,003h,000h,006h,080h,001h,000h,006h	; 8520  ........
	defb 000h,000h,000h,006h,080h,0feh,000h,006h	; 8528  ........
	defb 000h,0fdh,000h,006h,080h,0feh,000h,006h	; 8530  ........

; ======================================================================
; CODIGO 0x8538..0x85a9  (113 bytes)
; ======================================================================


lanza_grenade:		; GRENADE: la lanza en parabola (0x85A9) con el sonido 0x12
	ld a,(0c006h)		;8538   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 010h		;853b   ; la tecla 0x10 nueva
	ret z			;853d
	ld a,003h		;853e   ; la GRENADE en la lista
	call 043e8h		;8540   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8543
	ld (0ec00h),hl		;8544   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(hl)			;8547
	inc hl			;8548
	or (hl)			;8549
	ret z			;854a   ; sin granadas, nada
	call hueco_de_proyectil		;854b   ; hueco_de_proyectil: IX = el primer proyectil libre de 0xC200 y acarreo; sin acarreo si no hay
	ret nc			;854e   ; ningun hueco libre
	call sprites_del_proyectil		;854f   ; sprites_del_proyectil: reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ret nc			;8552   ; sin sprites libres
	ld hl,(0ec00h)		;8553   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,000h		;8556   ; gasta una
	call 04613h		;8558   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld (ix+002h),018h		;855b   ; la cuenta del proyectil = 0x18
	ld (ix+00fh),000h		;855f   ; si el proyectil hiere (bit 0) = 0x00
	ld a,(0c182h)		;8563   ; lee la Y de Snake
	ld (ix+003h),000h		;8566   ; la Y del proyectil (fraccion) = 0x00
	ld (ix+00dh),000h		;856a   ; la Y del suelo bajo el proyectil (fraccion) = 0x00
	sub 010h		;856e   ; sale 0x10 por encima
	ld (ix+004h),a		;8570   ; guarda la Y del proyectil
	ld (ix+00eh),a		;8573   ; guarda la Y del suelo bajo el proyectil
	ld a,(0c184h)		;8576   ; lee la X de Snake
	ld (ix+005h),000h		;8579   ; la X del proyectil (fraccion) = 0x00
	ld (ix+006h),a		;857d   ; guarda la X del proyectil
	ld a,(0c185h)		;8580   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (ix+00ch),a		;8583   ; guarda la direccion del proyectil
	ld hl,085a9h		;8586   ; la velocidad por la direccion (0x85A9)
	call 041deh		;8589   ; hl_mas_2a_menos_2: HL = HL + 2 x (A - 1)
	ld (ix+007h),000h		;858c   ; la velocidad Y del proyectil = 0x00
	ld a,(hl)			;8590
	ld (ix+008h),a		;8591   ; guarda la velocidad Y del proyectil (alta)
	inc hl			;8594
	ld (ix+009h),000h		;8595   ; la velocidad X del proyectil = 0x00
	ld a,(hl)			;8599
	ld (ix+00ah),a		;859a   ; guarda la velocidad X del proyectil (alta)
	ld (ix+00bh),001h		;859d   ; el cuadro del proyectil = 0x01
	ld a,012h		;85a1   ; el sonido 0x12
	call 0427ch		;85a3   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	jp 053dah		;85a6   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido

; ----------------------------------------------------------------------
; DATOS velocidad_de_la_granada: 4 parejas [dy][dx] por direccion (p02:8586 ->
;   L_41DE)
;   0x85a9..0x85b1  (8 bytes)
DATA_velocidad_de_la_granada:
	defb 0fdh,000h	; 85a9
	defb 003h,000h	; 85ab
	defb 000h,0fdh	; 85ad
	defb 000h,003h	; 85af

; ======================================================================
; CODIGO 0x85b1..0x85b7  (6 bytes)
; ======================================================================


vuela_grenade:		; la GRENADE: paso 0 vuela (0x85E3), paso 1 explota
	ld a,(ix+001h)		;85b1   ; el paso
	call 041eah		;85b4   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_85B7: 2 destinos del despachador p00:41EA (call en p02:85B4, el
;   indice en A): 85BB, 8613; lo leen p02:85B4 (4 bytes)
;   0x85b7..0x85bb  (4 bytes)
DATA_tabla_85B7:
	defw 085bbh,08613h	; 85b7  -> L_85BB explosion_pequena

; ======================================================================
; CODIGO 0x85bb..0x85e3  (40 bytes)
; ======================================================================


L_85BB:
	dec (ix+002h)		;85bb   ; baja la cuenta del proyectil
	jp z,grenade_explota		;85be   ; grenade_explota: sonido 0x1A, la explosion (cuadros 3-5) y disparo_oido
	call mueve_proyectil_suelo		;85c1   ; mueve_proyectil_suelo: la X y la Y del suelo del proyectil
	ld a,(ix+002h)		;85c4   ; la altura de la parabola (0x85E3) por la cuenta...
	ld hl,085e3h		;85c7
	call 041e0h		;85ca   ; hl_mas_a: HL = HL + A
	ld h,(hl)			;85cd   ; ...sobre la Y del suelo
	ld l,000h		;85ce
	ld e,(ix+00dh)		;85d0   ; lee la Y del suelo bajo el proyectil (fraccion)
	ld d,(ix+00eh)		;85d3   ; lee la Y del suelo bajo el proyectil
	add hl,de			;85d6
	ld (ix+003h),l		;85d7   ; guarda la Y del proyectil (fraccion)
	ld (ix+004h),h		;85da   ; guarda la Y del proyectil
	call proyectil_fuera		;85dd   ; proyectil_fuera: si el proyectil sale (Y >= 0xB8, X >= 0xF8 o < 9) lo quita
	jp 053dah		;85e0   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido

; ----------------------------------------------------------------------
; DATOS parabola_de_la_granada: 25 bytes (0x10, 8, 0, -4, -8 ... -0x26 ... 0),
;   uno por cuadro (ix+2), que p02:85C7 lee en 0x85E3 + cuadro y usa como
;   parte alta de la altura
;   0x85e3..0x85fc  (25 bytes)
DATA_parabola_de_la_granada:
	defb 010h,008h,000h,0fch,0f8h,0f4h,0f0h,0ech,0e8h,0e4h,0e0h,0dch,0dah,0d8h,0dah,0dch	; 85e3  ................
	defb 0e0h,0e4h,0e8h,0ech,0f0h,0f4h,0f8h,0fch,000h	; 85f3  .........

; ======================================================================
; CODIGO 0x85fc..0x86aa  (174 bytes)
; ======================================================================


grenade_explota:		; sonido 0x1A, la explosion (cuadros 3-5) y disparo_oido
	ld a,01ah		;85fc   ; el sonido 0x1A
	call 0427ch		;85fe   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	inc (ix+001h)		;8601   ; al paso 1: la explosion
	ld (ix+002h),00fh		;8604   ; la cuenta del proyectil = 0x0F
	ld (ix+00bh),003h		;8608   ; el cuadro del proyectil = 0x03
	ld (ix+00fh),001h		;860c   ; si el proyectil hiere (bit 0) = 0x01
	jp disparo_oido		;8610   ; disparo_oido: si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
explosion_pequena:		; la explosion: cuadros 3, 4 y 5 y la quita
	ld (ix+00fh),000h		;8613   ; si el proyectil hiere (bit 0) = 0x00
	dec (ix+002h)		;8617   ; baja la cuenta del proyectil
	jp z,quita_proyectil		;861a   ; quita_proyectil: el arma del proyectil a cero y sus sprites escondidos
	ld a,(ix+002h)		;861d   ; lee la cuenta del proyectil
	cp 00ah		;8620   ; cuenta 0x0A-0x0F: cuadro 3
	ld c,003h		;8622
	jr nc,L_862C		;8624
	cp 005h		;8626   ; 5-9: el 4; 0-4: el 5
	inc c			;8628
	jr nc,L_862C		;8629
	inc c			;862b
L_862C:
	ld (ix+00bh),c		;862c   ; guarda el cuadro del proyectil
	jp 053dah		;862f   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido
dispara_rocket:		; ROCKET: uno solo (0xC200), velocidad 0x86AA y sus patrones (p10:63A0)
	ld a,(0c006h)		;8632   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 010h		;8635   ; la tecla 0x10 nueva
	ret z			;8637
	ld a,004h		;8638   ; el ROCKET en la lista
	call 043e8h		;863a   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;863d
	ld (0ec00h),hl		;863e   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(hl)			;8641
	inc hl			;8642
	or (hl)			;8643
	ret z			;8644   ; sin cohetes, nada
	ld a,(0c200h)		;8645   ; lee los proyectiles (0x180 bytes)
	and a			;8648   ; solo uno a la vez (el primer hueco)
	ret nz			;8649
	ld ix,0c200h		;864a   ; apunta a los proyectiles (0x180 bytes)
	call sprites_del_proyectil		;864e   ; sprites_del_proyectil: reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ret nc			;8651   ; sin sprites libres
	ld hl,(0ec00h)		;8652   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,000h		;8655   ; gasta uno
	call 04613h		;8657   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld (ix+00fh),001h		;865a   ; si el proyectil hiere (bit 0) = 0x01
	ld a,(0c182h)		;865e   ; lee la Y de Snake
	ld (ix+003h),000h		;8661   ; la Y del proyectil (fraccion) = 0x00
	ld (ix+00dh),000h		;8665   ; la Y del suelo bajo el proyectil (fraccion) = 0x00
	ld (ix+00eh),a		;8669   ; guarda la Y del suelo bajo el proyectil
	sub 010h		;866c   ; sale 0x10 por encima
	ld (ix+004h),a		;866e   ; guarda la Y del proyectil
	ld a,(0c184h)		;8671   ; lee la X de Snake
	ld (ix+005h),000h		;8674   ; la X del proyectil (fraccion) = 0x00
	ld (ix+006h),a		;8678   ; guarda la X del proyectil
	ld a,(0c185h)		;867b   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (ix+00ch),a		;867e   ; guarda la direccion del proyectil
	ld hl,086aah		;8681   ; la velocidad por la direccion (0x86AA)
	call 041deh		;8684   ; hl_mas_2a_menos_2: HL = HL + 2 x (A - 1)
	ld (ix+007h),000h		;8687   ; la velocidad Y del proyectil = 0x00
	ld a,(hl)			;868b
	ld (ix+008h),a		;868c   ; guarda la velocidad Y del proyectil (alta)
	inc hl			;868f
	ld (ix+009h),000h		;8690   ; la velocidad X del proyectil = 0x00
	ld a,(hl)			;8694
	ld (ix+00ah),a		;8695   ; guarda la velocidad X del proyectil (alta)
	ld (ix+00bh),002h		;8698   ; el cuadro del proyectil = 0x02
	ld a,013h		;869c   ; el sonido 0x13
	call 0427ch		;869e   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld de,063a0h		;86a1   ; los patrones del cohete de p10:63A0
	call 04c2eh		;86a4   ; patrones_del_cohete: carga los patrones del proyectil por la direccion (ix+0x0C) en 0xF880
	jp 053dah		;86a7   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido

; ----------------------------------------------------------------------
; DATOS velocidad_del_cohete: 4 parejas [dy][dx] por direccion (p02:8684 ->
;   L_41DE)
;   0x86aa..0x86b2  (8 bytes)
DATA_velocidad_del_cohete:
	defb 0fbh,000h	; 86aa
	defb 005h,000h	; 86ac
	defb 000h,0fbh	; 86ae
	defb 000h,005h	; 86b0

; ======================================================================
; CODIGO 0x86b2..0x86b8  (6 bytes)
; ======================================================================


vuela_rocket:		; el ROCKET: vuela hasta chocar, explota y la explosion grande
	ld a,(ix+001h)		;86b2   ; el paso
	call 041eah		;86b5   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_86B8: 3 destinos del despachador p00:41EA (call en p02:86B5, el
;   indice en A): 86BE, 86D4, 878D; lo leen p02:86B5 (6 bytes)
;   0x86b8..0x86be  (6 bytes)
DATA_tabla_86B8:
	defw 086beh,086d4h,0878dh	; 86b8  -> L_86BE rocket_explota explosion_grande

; ======================================================================
; CODIGO 0x86be..0x8753  (149 bytes)
; ======================================================================


L_86BE:
	call mueve_proyectil		;86be   ; mueve_proyectil: la Y (ix+3, 4) y la X (ix+5, 6) del proyectil mas sus velocidades
	call mueve_suelo		;86c1   ; mueve_suelo: la Y del suelo (ix+0x0D, 0x0E) mas la velocidad Y (ix+7, 8)
	call choca_proyectil		;86c4   ; choca_proyectil: acarreo si el proyectil (ix+4, ix+6) choca con una pared hacia (ix+0x0C)
	jr nc,L_86CE		;86c7   ; sin pared, sigue
	call choca_suelo		;86c9   ; choca_suelo: acarreo si el suelo del proyectil (ix+0x0E, ix+6) choca con una pared
	jr c,L_86E8		;86cc   ; el suelo tambien choca: explota
L_86CE:
	call proyectil_fuera		;86ce   ; proyectil_fuera: si el proyectil sale (Y >= 0xB8, X >= 0xF8 o < 9) lo quita
	jp 053dah		;86d1   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido
rocket_explota:		; sonido 0x1A, cuadro 7 y disparo_oido
	ld a,01ah		;86d4   ; el sonido 0x1A
	call 0427ch		;86d6   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld (ix+002h),00fh		;86d9   ; la cuenta del proyectil = 0x0F
	ld (ix+00bh),007h		;86dd   ; el cuadro del proyectil = 0x07
	ld (ix+00fh),000h		;86e1   ; si el proyectil hiere (bit 0) = 0x00
	call disparo_oido		;86e5   ; disparo_oido: si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
L_86E8:
	inc (ix+001h)		;86e8   ; sube el paso del proyectil
	ret			;86eb
pon_p_bomb:		; P.BOMB: una sola, delante de Snake (0x8753), 0x30 cuadros
	ld a,(0c006h)		;86ec   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 010h		;86ef   ; la tecla 0x10 nueva
	ret z			;86f1
	ld a,005h		;86f2   ; la P.BOMB en la lista
	call 043e8h		;86f4   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;86f7
	ld (0ec00h),hl		;86f8   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(hl)			;86fb
	inc hl			;86fc
	or (hl)			;86fd
	ret z			;86fe   ; sin bombas, nada
	ld a,(0c200h)		;86ff   ; lee los proyectiles (0x180 bytes)
	and a			;8702   ; solo una a la vez
	ret nz			;8703
	ld ix,0c200h		;8704   ; apunta a los proyectiles (0x180 bytes)
	call sprites_del_proyectil		;8708   ; sprites_del_proyectil: reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ret nc			;870b   ; sin sprites libres
	ld hl,(0ec00h)		;870c   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,001h		;870f   ; gasta una (C = 1)
	call 04613h		;8711   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld (ix+002h),030h		;8714   ; 0x30 cuadros hasta explotar
	ld (ix+00fh),000h		;8718   ; si el proyectil hiere (bit 0) = 0x00
	ld a,(0c185h)		;871c   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;871f   ; 4 bytes por direccion en 0x8753...
	add a,a			;8720
	add a,a			;8721
	ld de,08753h		;8722
	call 041e5h		;8725   ; de_mas_a: DE = DE + A
	ld a,(de)			;8728   ; ...el desplazamiento Y...
	ld c,a			;8729
	inc de			;872a
	ld a,(de)			;872b
	ld b,a			;872c
	inc de			;872d
	ld hl,(0c181h)		;872e   ; lee la Y de Snake (16 bits)
	add hl,bc			;8731   ; ...sobre la Y de Snake
	ld (ix+003h),l		;8732   ; guarda la Y del proyectil (fraccion)
	ld (ix+004h),h		;8735   ; guarda la Y del proyectil
	ld a,(de)			;8738   ; el desplazamiento X...
	ld c,a			;8739
	inc de			;873a
	ld a,(de)			;873b
	ld b,a			;873c
	ld hl,(0c183h)		;873d   ; lee la X de Snake (16 bits)
	add hl,bc			;8740   ; ...sobre la X de Snake
	ld (ix+005h),l		;8741   ; guarda la X del proyectil (fraccion)
	ld (ix+006h),h		;8744   ; guarda la X del proyectil
	ld (ix+00bh),006h		;8747   ; el cuadro del proyectil = 0x06
	ld a,017h		;874b   ; el sonido 0x17
	call 0427ch		;874d   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	jp 053dah		;8750   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido

; ----------------------------------------------------------------------
; DATOS fichas_8753: 4 fichas de 4 bytes, una por direccion, que p02:8722 lee
;   en 0x8753 + 4 x A
;   0x8753..0x8763  (16 bytes)
DATA_fichas_8753:
	defb 000h,0f0h,000h,000h	; 8753
	defb 000h,008h,000h,000h	; 8757
	defb 000h,000h,000h,0f4h	; 875b
	defb 000h,000h,000h,00ch	; 875f

; ======================================================================
; CODIGO 0x8763..0x8769  (6 bytes)
; ======================================================================


p_bomb:		; la P.BOMB: espera, explota (sonido 0x1C) y la explosion grande
	ld a,(ix+001h)		;8763   ; el paso
	call 041eah		;8766   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_8769: 3 destinos del despachador p00:41EA (call en p02:8766, el
;   indice en A): 876F, 8779, 878D; lo leen p02:8766 (6 bytes)
;   0x8769..0x876f  (6 bytes)
DATA_tabla_8769:
	defw 0876fh,08779h,0878dh	; 8769  -> L_876F L_8779 explosion_grande

; ======================================================================
; CODIGO 0x876f..0x87f9  (138 bytes)
; ======================================================================


L_876F:
	dec (ix+002h)		;876f   ; espera la cuenta
	ret nz			;8772
	ld (ix+00fh),001h		;8773   ; al explotar hiere
	jr L_8789		;8777
L_8779:
	ld a,01ch		;8779   ; el sonido 0x1C
	call 0427ch		;877b   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld (ix+002h),00fh		;877e   ; la cuenta del proyectil = 0x0F
	ld (ix+00bh),007h		;8782   ; el cuadro del proyectil = 0x07
	call disparo_oido		;8786   ; disparo_oido: si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
L_8789:
	inc (ix+001h)		;8789   ; sube el paso del proyectil
	ret			;878c
explosion_grande:		; la explosion: cuadros 7, 8 y 9 y la quita
	ld (ix+00fh),000h		;878d   ; si el proyectil hiere (bit 0) = 0x00
	dec (ix+002h)		;8791   ; baja la cuenta del proyectil
	jp z,quita_proyectil		;8794   ; quita_proyectil: el arma del proyectil a cero y sus sprites escondidos
	ld a,(ix+002h)		;8797   ; cuenta 0x0A-0x0F: cuadro 7
	ld c,007h		;879a
	cp 00ah		;879c
	jr nc,L_87A6		;879e
	inc c			;87a0   ; 5-9: el 8; 0-4: el 9
	cp 005h		;87a1
	jr nc,L_87A6		;87a3
	inc c			;87a5
L_87A6:
	ld (ix+00bh),c		;87a6   ; guarda el cuadro del proyectil
	jp 053dah		;87a9   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido
pon_l_mine:		; L.MINE: en el sitio de Snake, cuadro 0x0A
	ld a,(0c006h)		;87ac   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 010h		;87af   ; la tecla 0x10 nueva
	ret z			;87b1
	ld a,006h		;87b2   ; la L.MINE en la lista
	call 043e8h		;87b4   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;87b7
	ld (0ec00h),hl		;87b8   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(hl)			;87bb
	inc hl			;87bc
	or (hl)			;87bd
	ret z			;87be   ; sin minas, nada
	call hueco_de_proyectil		;87bf   ; hueco_de_proyectil: IX = el primer proyectil libre de 0xC200 y acarreo; sin acarreo si no hay
	ret nc			;87c2   ; ningun hueco libre
	call sprites_del_proyectil		;87c3   ; sprites_del_proyectil: reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ret nc			;87c6   ; sin sprites libres
	ld hl,(0ec00h)		;87c7   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,001h		;87ca   ; gasta una (C = 1)
	call 04613h		;87cc   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld (ix+00fh),001h		;87cf   ; si el proyectil hiere (bit 0) = 0x01
	ld a,(0c182h)		;87d3   ; lee la Y de Snake
	ld (ix+004h),a		;87d6   ; en la Y de Snake...
	ld (ix+003h),000h		;87d9   ; la Y del proyectil (fraccion) = 0x00
	ld a,(0c184h)		;87dd   ; lee la X de Snake
	ld (ix+006h),a		;87e0   ; ...y en su X
	ld (ix+005h),000h		;87e3   ; la X del proyectil (fraccion) = 0x00
	ld (ix+00bh),00ah		;87e7   ; el cuadro del proyectil = 0x0A
	ld a,017h		;87eb   ; el sonido 0x17
	call 0427ch		;87ed   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	jp 053dah		;87f0   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido
l_mine:		; la L.MINE: quieta hasta que algo la pisa, explota (sonido 0x1C)
	ld a,(ix+001h)		;87f3   ; el paso (0: quieta; lo pasa a 1 quien la pisa)
	call 041eah		;87f6   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_87F9: 3 destinos del despachador p00:41EA (call en p02:87F6, el
;   indice en A): 8816, 87FF, 8613; lo leen p02:87F6 (6 bytes)
;   0x87f9..0x87ff  (6 bytes)
DATA_tabla_87F9:
	defw 08816h,087ffh,08613h	; 87f9  -> L_8816 L_87FF explosion_pequena

; ======================================================================
; CODIGO 0x87ff..0x888f  (144 bytes)
; ======================================================================


L_87FF:
	ld a,01ch		;87ff   ; el sonido 0x1C
	call 0427ch		;8801   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	inc (ix+001h)		;8804   ; sube el paso del proyectil
	ld (ix+00fh),000h		;8807   ; si el proyectil hiere (bit 0) = 0x00
	ld (ix+002h),00fh		;880b   ; la cuenta del proyectil = 0x0F
	ld (ix+00bh),003h		;880f   ; el cuadro del proyectil = 0x03
	call disparo_oido		;8813   ; disparo_oido: si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
L_8816:
	ret			;8816
dispara_missile:		; MISSILE: uno solo, por la direccion de Snake, patrones p10:63A8
	ld a,(0c006h)		;8817   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 010h		;881a   ; la tecla 0x10 nueva
	ret z			;881c
	ld a,007h		;881d   ; el MISSILE en la lista
	call 043e8h		;881f   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8822
	ld (0ec00h),hl		;8823   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(hl)			;8826
	inc hl			;8827
	or (hl)			;8828
	ret z			;8829   ; sin misiles, nada
	ld a,(0c200h)		;882a   ; lee los proyectiles (0x180 bytes)
	and a			;882d   ; solo uno a la vez
	ret nz			;882e
	ld ix,0c200h		;882f   ; apunta a los proyectiles (0x180 bytes)
	call sprites_del_proyectil		;8833   ; sprites_del_proyectil: reserva en 0xEA10 los sprites del arma (0x8140); acarreo si caben
	ret nc			;8836   ; sin sprites libres
	ld hl,(0ec00h)		;8837   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,001h		;883a   ; gasta uno (C = 1)
	call 04613h		;883c   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld (ix+00fh),001h		;883f   ; si el proyectil hiere (bit 0) = 0x01
	ld a,(0c182h)		;8843   ; lee la Y de Snake
	ld (ix+003h),000h		;8846   ; la Y del proyectil (fraccion) = 0x00
	ld (ix+00dh),000h		;884a   ; la Y del suelo bajo el proyectil (fraccion) = 0x00
	ld (ix+00eh),a		;884e   ; guarda la Y del suelo bajo el proyectil
	sub 010h		;8851   ; sale 0x10 por encima
	ld (ix+004h),a		;8853   ; guarda la Y del proyectil
	ld a,(0c184h)		;8856   ; lee la X de Snake
	ld (ix+005h),000h		;8859   ; la X del proyectil (fraccion) = 0x00
	ld (ix+006h),a		;885d   ; guarda la X del proyectil
	ld a,014h		;8860   ; el sonido 0x14
	call 0427ch		;8862   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld a,(0c185h)		;8865   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
rumbo_del_missile:		; la direccion A del MISSILE, su velocidad (0x888F) y sus patrones
	ld (ix+00ch),a		;8868   ; guarda la direccion del proyectil
	ld hl,0888fh		;886b   ; la velocidad por la direccion (0x888F)
	call 041deh		;886e   ; hl_mas_2a_menos_2: HL = HL + 2 x (A - 1)
	ld (ix+007h),000h		;8871   ; la velocidad Y del proyectil = 0x00
	ld a,(hl)			;8875
	ld (ix+008h),a		;8876   ; guarda la velocidad Y del proyectil (alta)
	inc hl			;8879
	ld (ix+009h),000h		;887a   ; la velocidad X del proyectil = 0x00
	ld a,(hl)			;887e
	ld (ix+00ah),a		;887f   ; guarda la velocidad X del proyectil (alta)
	ld (ix+00bh),00bh		;8882   ; el cuadro del proyectil = 0x0B
	ld de,063a8h		;8886   ; los patrones del misil de p10:63A8
	call 04c2eh		;8889   ; patrones_del_cohete: carga los patrones del proyectil por la direccion (ix+0x0C) en 0xF880
	jp 053dah		;888c   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido

; ----------------------------------------------------------------------
; DATOS velocidad_888f: 4 parejas [dy][dx] por direccion (p02:886E -> L_41DE)
;   0x888f..0x8897  (8 bytes)
DATA_velocidad_888f:
	defb 0fch,000h	; 888f
	defb 004h,000h	; 8891
	defb 000h,0fch	; 8893
	defb 000h,004h	; 8895

; ======================================================================
; CODIGO 0x8897..0x889d  (6 bytes)
; ======================================================================


vuela_missile:		; el MISSILE: las teclas de direccion lo giran; vuela hasta chocar y explota
	ld a,(ix+001h)		;8897   ; el paso
	call 041eah		;889a   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_889D: 3 destinos del despachador p00:41EA (call en p02:889A, el
;   indice en A): 88A3, 88D7, 878D; lo leen p02:889A (6 bytes)
;   0x889d..0x88a3  (6 bytes)
DATA_tabla_889D:
	defw 088a3h,088d7h,0878dh	; 889d  -> L_88A3 missile_explota explosion_grande

; ======================================================================
; CODIGO 0x88a3..0x8a11  (366 bytes)
; ======================================================================


L_88A3:
	ld a,(0c006h)		;88a3   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	rra			;88a6   ; la tecla nueva: arriba (1)...
	ld c,001h		;88a7
	jr c,L_88B7		;88a9
	inc c			;88ab   ; ...abajo (2)...
	rra			;88ac
	jr c,L_88B7		;88ad
	inc c			;88af   ; ...izquierda (3)...
	rra			;88b0
	jr c,L_88B7		;88b1
	inc c			;88b3   ; ...o derecha (4)
	rra			;88b4
	jr nc,L_88BB		;88b5
L_88B7:
	ld a,c			;88b7   ; cambia el rumbo
	call rumbo_del_missile		;88b8   ; rumbo_del_missile: la direccion A del MISSILE, su velocidad (0x888F) y sus patrones
L_88BB:
	call mueve_proyectil		;88bb   ; mueve_proyectil: la Y (ix+3, 4) y la X (ix+5, 6) del proyectil mas sus velocidades
	call mueve_suelo		;88be   ; mueve_suelo: la Y del suelo (ix+0x0D, 0x0E) mas la velocidad Y (ix+7, 8)
	call choca_proyectil		;88c1   ; choca_proyectil: acarreo si el proyectil (ix+4, ix+6) choca con una pared hacia (ix+0x0C)
	jr nc,L_88CB		;88c4   ; sin pared, sigue
	call choca_suelo		;88c6   ; choca_suelo: acarreo si el suelo del proyectil (ix+0x0E, ix+6) choca con una pared
	jr c,L_88EB		;88c9   ; el suelo tambien choca: explota
L_88CB:
	call proyectil_fuera		;88cb   ; proyectil_fuera: si el proyectil sale (Y >= 0xB8, X >= 0xF8 o < 9) lo quita
	ld de,063a8h		;88ce   ; los patrones por la direccion
	call 04c2eh		;88d1   ; patrones_del_cohete: carga los patrones del proyectil por la direccion (ix+0x0C) en 0xF880
	jp 053dah		;88d4   ; atributos_del_proyectil: el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido
missile_explota:		; sonido 0x1A, cuadro 7 y disparo_oido
	ld a,01ah		;88d7   ; el sonido 0x1A
	call 0427ch		;88d9   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld (ix+00fh),000h		;88dc   ; si el proyectil hiere (bit 0) = 0x00
	ld (ix+002h),00fh		;88e0   ; la cuenta del proyectil = 0x0F
	ld (ix+00bh),007h		;88e4   ; el cuadro del proyectil = 0x07
	call disparo_oido		;88e8   ; disparo_oido: si la sala no esta en 0x806C ni 0xC158 = 1 ni ya 0xC602: pon_c602 con la cuenta 0x5A
L_88EB:
	inc (ix+001h)		;88eb   ; sube el paso del proyectil
	ret			;88ee
choques_del_cuadro:		; proyectiles y Snake contra los actores, fichas y salas que hieren, puertas y objetos
	ld a,(0c151h)		;88ef   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 009h		;88f2   ; Snake muerto (modo 9): nada
	ret z			;88f4
	call proyectiles_contra_actores		;88f5   ; proyectiles_contra_actores: con el arma 0xC142: su tabla de dano y de cajas (p05:8951 o 8992) y cada proyectil contra los actores
	call snake_contra_actores		;88f8   ; snake_contra_actores: cada actor vivo contra Snake (golpe, contacto y dano)
	call trampilla		;88fb   ; trampilla: en las salas 0x2D/0x2E, sobre las fichas 1 y 1 (sin 0xC15E): modo 1 por la puerta 0x5B/0x81
	call fichas_que_hieren		;88fe   ; fichas_que_hieren: en las salas 0x10, 0x25, 0x6E, 0x28 y 0x74 con 0xC616, sobre sus fichas: sonido 0x18 y dano 2
	call salas_que_hieren		;8901   ; salas_que_hieren: en las salas de 0x8C2A, sin la MASK (objeto 5): dano 2 cada 0x10 cuadros
	ld a,(0c151h)		;8904   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 009h		;8907   ; si murio en este cuadro, nada mas
	ret z			;8909
	call 0785bh		;890a   ; mira_las_puertas: Snake ante una puerta que se abre: modo 7; en un paso abierto: modo 1 y 0xC4FC = la puerta
	call objetos_de_la_sala		;890d   ; objetos_de_la_sala: Snake contra los 3 objetos de 0xC5D0 (fichas de 0x10)
	ld a,(0c5b9h)		;8910   ; con 0xC5B9, sin la captura
	and a			;8913
	ret nz			;8914
	ld a,(0c130h)		;8915   ; lee la sala
	cp 008h		;8918   ; en la sala 8...
	ret nz			;891a
	ld a,(0c184h)		;891b   ; lee la X de Snake
	cp 0d0h		;891e   ; ...con la X de Snake entre 0xC0 y 0xCF...
	ret nc			;8920
	cp 0c0h		;8921
	ret c			;8923
	ld a,00bh		;8924   ; ...el modo 11 (la captura)
	ld (0c151h),a		;8926   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	xor a			;8929   ; el paso 0
	ld (0c900h),a		;892a   ; guarda el paso de la secuencia 0xC900
	ret			;892d
snake_contra_actores:		; cada actor vivo contra Snake (golpe, contacto y dano)
	xor a			;892e   ; 0xC15E a cero
	ld (0c15eh),a		;892f
	ld ix,0d000h		;8932   ; apunta a los 16 actores (fichas de 0x80)
	ld a,(0c182h)		;8936   ; lee la Y de Snake
	ld e,a			;8939   ; E = la Y de Snake
	ld a,(0c184h)		;893a   ; lee la X de Snake
	ld d,a			;893d   ; D = la X
	ld b,010h		;893e   ; 16 actores
L_8940:
	push bc			;8940
	push de			;8941
	ld a,(ix+000h)		;8942   ; lee el tipo del actor
	bit 7,a		;8945   ; muriendo: nada
	jr nz,L_894D		;8947
	and a			;8949   ; hueco vacio: nada
	call nz,snake_contra_actor		;894a   ; snake_contra_actor: el actor IX contra Snake: golpe con la tecla 0x20, caja por tipo (p05:89D3) y dano
L_894D:
	ld de,00080h		;894d   ; la ficha siguiente
	add ix,de		;8950
	pop de			;8952
	pop bc			;8953
	djnz L_8940		;8954
	ret			;8956
snake_contra_actor:		; el actor IX contra Snake: golpe con la tecla 0x20, caja por tipo (p05:89D3) y dano
	ld a,(ix+01eh)		;8957   ; lee las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	and 01fh		;895a   ; las marcas de golpe y contacto a cero
	ld (ix+01eh),a		;895c   ; guarda las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ld a,(ix+000h)		;895f   ; lee el tipo del actor
	cp 023h		;8962   ; los rayos (0x23) tienen lo suyo
	jp z,contra_tipo_35		;8964   ; contra_tipo_35: el tipo 35 (largo ix+0x15, de lado si ix+0x16 bit 0) toca a Snake: pon_c602 y quita a todos
	bit 0,(ix+00eh)		;8967   ; mira el bit 0 de con que choca el actor (bit 0 Snake, bit 1 proyectiles)
	ret z			;896b   ; si no choca con Snake, nada
	cp 010h		;896c   ; la trampa (0x10) tiene lo suyo
	jp z,contra_tipo_16		;896e   ; contra_tipo_16: el tipo 16: dentro de su recuadro (ix+0x13, 0x14, 0x15) dano 0xFF
	cp 036h		;8971   ; el tipo 0x36 tiene lo suyo
	jp z,contra_tipo_54		;8973   ; contra_tipo_54: el tipo 54: en su columna (X +- 8) y su alto por (ix+0x0C) (0x8B7E), dano
	ld a,(0c006h)		;8976   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 020h		;8979   ; la tecla 0x20 nueva...
	jr z,L_8989		;897b
	ld a,(0c18bh)		;897d   ; lee el modo de la pose de Snake
	dec a			;8980   ; ...y Snake con el modo de pose 1: el golpe
	call z,golpea_actor		;8981   ; golpea_actor: si el tipo esta en 0x8A11 y en el alcance del golpe (0x8A5B): bit 6 de (ix+0x1E) y el sonido 8
	bit 6,(ix+01eh)		;8984   ; mira el bit 6 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ret nz			;8988   ; golpeado: nada mas
L_8989:
	ld a,(ix+000h)		;8989   ; lee el tipo del actor
	ld hl,089d3h		;898c   ; p05:89D3: la caja de contacto de cada tipo
	call 043a3h		;898f   ; byte_del_banco_5: A = el byte A - 1 de la tabla HL, con los bancos 4-5-6
	ld l,a			;8992
	inc a			;8993   ; 0xFF: sin contacto
	ret z			;8994
	push de			;8995
	call 043b4h		;8996   ; caja_de_choque: copia la caja A (p05:8A55 + 4 x (A - 1)) a 0xC928; HL = 0xC928
	pop de			;8999   ; la caja copiada en 0xC928 (HL)
	call cerca_de_snake		;899a   ; cerca_de_snake: acarreo si (ix+3, ix+5) mas el desplazamiento de HL esta a menos de [alto][ancho] de (E, D)
	ret nc			;899d   ; Snake fuera de la caja: nada
	ld a,(ix+000h)		;899e   ; lee el tipo del actor
	sub 002h		;89a1   ; el tipo 2: lo suyo
	jp z,contra_tipo_2		;89a3   ; contra_tipo_2: 0xC15E = 1 y el bit 7 de (ix+0x1E)
	ld a,(ix+01fh)		;89a6   ; lee la cuenta del golpe del actor
	and a			;89a9   ; durante la sacudida no hiere
	ret nz			;89aa
	set 7,(ix+01eh)		;89ab   ; pone a uno el bit 7 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ld a,(ix+000h)		;89af   ; lee el tipo del actor
	cp 007h		;89b2   ; el tipo 7 (la mina)...
	jr nz,L_89BA		;89b4
	ld (ix+00dh),000h		;89b6   ; el aguante del actor = 0x00
L_89BA:
	ld a,(ix+000h)		;89ba   ; lee el tipo del actor
	cp 01fh		;89bd   ; el tipo 0x1F (escorpion): veneno (0xC139)...
	jr nz,L_89CB		;89bf
	ld a,001h		;89c1
	ld (0c139h),a		;89c3
sonido_10:		; el sonido 0x10
	ld a,010h		;89c6   ; ...y el sonido 0x10
	jp 04284h		;89c8   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
L_89CB:
	ld a,(ix+000h)		;89cb   ; lee el tipo del actor
	cp 031h		;89ce   ; los tipos 0x31-0x34 y 0x37 no hieren
	jr c,L_89D8		;89d0
	cp 035h		;89d2
	ret c			;89d4
	cp 037h		;89d5
	ret z			;89d7
L_89D8:
	ld a,(0c199h)		;89d8   ; lee la cuenta de herido (Snake parpadea)
	and a			;89db   ; herido hace poco: nada
	ret nz			;89dc
	call sonido_10		;89dd   ; sonido_10: el sonido 0x10
	ld a,020h		;89e0   ; 0x20 cuadros herido
	ld (0c199h),a		;89e2   ; guarda la cuenta de herido (Snake parpadea)
	ld hl,08a14h		;89e5   ; 0xEC00 = 0x8A14
	ld (0ec00h),hl		;89e8   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,(ix+000h)		;89eb   ; lee el tipo del actor
	push af			;89ee
	dec a			;89ef   ; el dano del tipo contra Snake (la tabla de 0xEC00)
	call 04396h		;89f0   ; dano: A = el byte A de la tabla de dano de 0xEC00
	ld b,a			;89f3
	pop af			;89f4
	cp 02bh		;89f5   ; los tipos 0x2B, 0x2F y 0x3A-0x3E...
	jr z,L_8A05		;89f7
	cp 02fh		;89f9
	jr z,L_8A05		;89fb
	cp 03ah		;89fd
	jr c,L_8A0E		;89ff
	cp 03fh		;8a01
	jr nc,L_8A0E		;8a03
L_8A05:
	ld a,(0c135h)		;8a05   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 001h		;8a08   ; ...con ARMOR (objeto 1)...
	jr nz,L_8A0E		;8a0a
	srl b		;8a0c   ; ...hacen la mitad
L_8A0E:
	jp dano_a_snake		;8a0e   ; dano_a_snake: resta B a la vida 0xC131; al llegar a cero, Snake muere (estado 3, modo 9, sonido 0x44)

; ----------------------------------------------------------------------
; DATOS tipos_8a11: 12 tipos de actor (4, 5, 0x1E, 0xA, 0xB, 0xD, 0xE, 0x13,
;   0x18, 0x1C, 0x30, 0x37) que p02:8A25 compara con (ix+0) (B = 12)
;   0x8a11..0x8a1d  (12 bytes)
DATA_tipos_8a11:
	defb 004h,005h,01eh,00ah,00bh,00dh,00eh,013h,018h,01ch,030h,037h	; 8a11  ..........07

; ======================================================================
; CODIGO 0x8a1d..0x8a5b  (62 bytes)
; ======================================================================


golpea_actor:		; si el tipo esta en 0x8A11 y en el alcance del golpe (0x8A5B): bit 6 de (ix+0x1E) y el sonido 8
	ld a,(ix+000h)		;8a1d   ; lee el tipo del actor
	ld b,00ch		;8a20   ; los 12 tipos que se pueden golpear (0x8A11)
	ld hl,08a11h		;8a22
L_8A25:
	cp (hl)			;8a25   ; busca el tipo
	jr z,L_8A2C		;8a26
	inc hl			;8a28
	djnz L_8A25		;8a29
	ret			;8a2b
L_8A2C:
	ld a,(0c185h)		;8a2c   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;8a2f   ; por la direccion de Snake, el alcance del golpe
	ld hl,08a5bh		;8a30
	jr z,L_8A44		;8a33
	dec a			;8a35
	ld hl,08a61h		;8a36
	jr z,L_8A44		;8a39
	dec a			;8a3b
	ld hl,08a5dh		;8a3c
	jr z,L_8A44		;8a3f
	ld hl,08a63h		;8a41
L_8A44:
	call cerca_de_snake		;8a44   ; cerca_de_snake: acarreo si (ix+3, ix+5) mas el desplazamiento de HL esta a menos de [alto][ancho] de (E, D)
	ret nc			;8a47   ; fuera del alcance: nada
	ld a,(ix+01fh)		;8a48   ; lee la cuenta del golpe del actor
	cp 038h		;8a4b   ; si ya esta en la sacudida, nada
	ret nc			;8a4d
	ld (ix+01fh),000h		;8a4e   ; la cuenta del golpe del actor = 0x00
	set 6,(ix+01eh)		;8a52   ; pone a uno el bit 6 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ld a,008h		;8a56   ; el sonido 8
	jp 04284h		;8a58   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5

; ----------------------------------------------------------------------
; DATOS alcance_del_punetazo: fichas de 4 bytes [dy][margen en Y][dx][margen
;   en X] que p02:8A67 usa segun la direccion (0xC185): 0x8A5B arriba, 0x8A61
;   abajo, 0x8A5D izquierda y 0x8A63 derecha (p02:8A30-8A41); se solapan
;   0x8a5b..0x8a67  (12 bytes)
DATA_alcance_del_punetazo:
	defb 00ch,00ch	; 8a5b
	defb 000h,00ch	; 8a5d
	defb 00ch,00ch	; 8a5f
	defb 0f4h,00ch	; 8a61
	defb 000h,00ch	; 8a63
	defb 0f4h,00ch	; 8a65

; ======================================================================
; CODIGO 0x8a67..0x8b7e  (279 bytes)
; ======================================================================


cerca_de_snake:		; acarreo si (ix+3, ix+5) mas el desplazamiento de HL esta a menos de [alto][ancho] de (E, D)
	ld a,(ix+003h)		;8a67   ; lee la Y del actor
	add a,(hl)			;8a6a   ; la Y + dy...
	inc hl			;8a6b
	sub e			;8a6c   ; ...menos la Y de Snake...
	jr nc,L_8A71		;8a6d
	neg		;8a6f
L_8A71:
	cp (hl)			;8a71   ; ...menor que el alto
	ret nc			;8a72
	inc hl			;8a73
	ld a,(ix+005h)		;8a74   ; lee la X del actor
	add a,(hl)			;8a77   ; la X + dx menos la X de Snake...
	inc hl			;8a78
	sub d			;8a79
	jr nc,L_8A7E		;8a7a
	neg		;8a7c
L_8A7E:
	cp (hl)			;8a7e   ; ...menor que el ancho: acarreo
	ret			;8a7f
contra_tipo_35:		; el tipo 35 (largo ix+0x15, de lado si ix+0x16 bit 0) toca a Snake: pon_c602 y quita a todos
	bit 0,(ix+001h)		;8a80   ; mira el bit 0 de el paso del actor
	ret z			;8a84   ; apagado: nada
	bit 0,(ix+016h)		;8a85   ; bit 0 de (ix+0x16): horizontal
	jr nz,L_8AAA		;8a89
	ld a,d			;8a8b   ; vertical: la X de Snake a menos de 4...
	sub (ix+005h)		;8a8c   ; le resta la X del actor
	jr nc,L_8A93		;8a8f
	neg		;8a91
L_8A93:
	cp 004h		;8a93
	ret nc			;8a95
	ld a,(ix+015h)		;8a96   ; ...y la Y dentro del largo (ix+0x15)
	srl a		;8a99
	ld b,a			;8a9b
	add a,008h		;8a9c
	add a,(ix+003h)		;8a9e   ; le suma la Y del actor
	sub e			;8aa1
	jr nc,L_8AA6		;8aa2
	neg		;8aa4
L_8AA6:
	cp b			;8aa6
	ret nc			;8aa7
	jr L_8AC5		;8aa8
L_8AAA:
	ld a,e			;8aaa   ; horizontal: la Y de Snake a menos de 4...
	sub (ix+003h)		;8aab   ; le resta la Y del actor
	jr nc,L_8AB2		;8aae
	neg		;8ab0
L_8AB2:
	cp 004h		;8ab2
	ret nc			;8ab4
	ld a,(ix+015h)		;8ab5   ; ...y la X dentro del largo
	srl a		;8ab8
	ld b,a			;8aba
	add a,(ix+005h)		;8abb   ; le suma la X del actor
	sub d			;8abe
	jr nc,L_8AC3		;8abf
	neg		;8ac1
L_8AC3:
	cp b			;8ac3
	ret nc			;8ac4
L_8AC5:
	set 7,(ix+01eh)		;8ac5   ; pone a uno el bit 7 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ld a,05ah		;8ac9   ; la alarma con la cuenta 0x5A
	call 07d27h		;8acb   ; pon_c602_con_cuenta: 0xC605 = A y pon_c602
	push ix		;8ace   ; p15:BF6E: borra los rayos...
	call 07707h		;8ad0   ; llama_bf6e: p15:BF6E
	call quita_a_todos		;8ad3   ; quita_a_todos: quita a los 16 actores
	pop ix		;8ad6   ; ...y los quita todos
	ret			;8ad8
quita_a_todos:		; quita a los 16 actores
	ld ix,0d000h		;8ad9   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;8add   ; los 16 actores
L_8ADF:
	ld a,(ix+000h)		;8adf   ; lee el tipo del actor
	and a			;8ae2   ; hueco vacio: nada
	call nz,07371h		;8ae3   ; p01:7371: lo quita
	ld de,00080h		;8ae6   ; la ficha siguiente
	add ix,de		;8ae9
	djnz L_8ADF		;8aeb
	ret			;8aed
contra_tipo_2:		; 0xC15E = 1 y el bit 7 de (ix+0x1E)
	ld a,001h		;8aee   ; Snake encima del tipo 2: 0xC15E = 1
	ld (0c15eh),a		;8af0
	set 7,(ix+01eh)		;8af3   ; pone a uno el bit 7 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ret			;8af7
contra_tipo_16:		; el tipo 16: dentro de su recuadro (ix+0x13, 0x14, 0x15) dano 0xFF
	bit 2,(ix+00eh)		;8af8   ; mira el bit 2 de con que choca el actor (bit 0 Snake, bit 1 proyectiles)
	jr nz,L_8B1E		;8afc   ; con el bit 2 de (ix+0x0E), la zona grande
	ld b,(ix+015h)		;8afe   ; el recuadro: media anchura...
	srl b		;8b01
	ld a,(ix+013h)		;8b03   ; ...desde (ix+0x13, ix+0x14)
	add a,b			;8b06
	sub e			;8b07
	jr nc,L_8B0C		;8b08
	neg		;8b0a
L_8B0C:
	cp b			;8b0c
	ret nc			;8b0d   ; Snake fuera: nada
	ld a,(ix+014h)		;8b0e
	add a,b			;8b11
	sub d			;8b12
	jr nc,L_8B17		;8b13
	neg		;8b15
L_8B17:
	cp b			;8b17
	ret nc			;8b18
	ld b,0ffh		;8b19   ; dentro: dano 0xFF (muere)
	jp dano_a_snake		;8b1b   ; dano_a_snake: resta B a la vida 0xC131; al llegar a cero, Snake muere (estado 3, modo 9, sonido 0x44)
L_8B1E:
	ld a,(ix+003h)		;8b1e   ; lee la Y del actor
	sub e			;8b21   ; a menos de 0x28 en Y...
	jr nc,L_8B26		;8b22
	neg		;8b24
L_8B26:
	cp 028h		;8b26
	ret nc			;8b28
	ld a,(ix+005h)		;8b29   ; lee la X del actor
	sub d			;8b2c   ; ...y en X...
	jr nc,L_8B31		;8b2d
	neg		;8b2f
L_8B31:
	cp 028h		;8b31
	ret nc			;8b33
	set 7,(ix+01eh)		;8b34   ; pone a uno el bit 7 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ret			;8b38   ; ...el bit 7 de (ix+0x1E)
contra_tipo_54:		; el tipo 54: en su columna (X +- 8) y su alto por (ix+0x0C) (0x8B7E), dano
	ld a,(ix+005h)		;8b39   ; lee la X del actor
	sub d			;8b3c   ; la X de Snake a menos de 8
	jr nc,L_8B41		;8b3d
	neg		;8b3f
L_8B41:
	cp 008h		;8b41
	ret nc			;8b43
	ld a,(0c130h)		;8b44   ; lee la sala
	cp 06fh		;8b47   ; en la sala 0x6F...
	jr nz,L_8B56		;8b49
	ld a,(ix+00ch)		;8b4b   ; lee la cuenta de cuadros del actor
	cp 008h		;8b4e   ; ...el cuadro, hasta 7
	jr c,L_8B59		;8b50
	ld a,007h		;8b52
	jr L_8B59		;8b54
L_8B56:
	ld a,(ix+00ch)		;8b56   ; lee la cuenta de cuadros del actor
L_8B59:
	cp 00ch		;8b59   ; el 0x0C y el 0: no toca
	ret z			;8b5b
	and a			;8b5c
	ret z			;8b5d
	ld hl,08b7eh		;8b5e   ; el alto por la cuenta (0x8B7E)...
	dec a			;8b61
	cp 00ch		;8b62
	ld d,00ch		;8b64
	jr nc,L_8B6C		;8b66
	call 041e0h		;8b68   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;8b6b
L_8B6C:
	ld a,d			;8b6c   ; ...por 8
	add a,a			;8b6d
	add a,a			;8b6e
	add a,a			;8b6f
	ld d,a			;8b70
	add a,(ix+003h)		;8b71   ; le suma la Y del actor
	sub e			;8b74   ; la Y de Snake dentro del alto
	jr nc,L_8B79		;8b75
	neg		;8b77
L_8B79:
	cp d			;8b79
	ret nc			;8b7a
	jp L_89CB		;8b7b   ; hiere como un actor

; ----------------------------------------------------------------------
; DATOS tabla_8b7e: 12 bytes (1, 1, 2, 3, 4 ... 0xB) que p02:8B5E lee en
;   0x8B7E + A - 1 cuando A es menor que 12
;   0x8b7e..0x8b8a  (12 bytes)
DATA_tabla_8b7e:
	defb 001h,001h,002h,003h,004h,005h,006h,007h,008h,009h,00ah,00bh	; 8b7e  ............

; ======================================================================
; CODIGO 0x8b8a..0x8c2a  (160 bytes)
; ======================================================================


trampilla:		; en las salas 0x2D/0x2E, sobre las fichas 1 y 1 (sin 0xC15E): modo 1 por la puerta 0x5B/0x81
	ld a,(0c130h)		;8b8a   ; lee la sala
	cp 02dh		;8b8d   ; solo en las salas 0x2D y 0x2E
	jr z,L_8B94		;8b8f
	cp 02eh		;8b91
	ret nz			;8b93
L_8B94:
	ld a,(0c15eh)		;8b94   ; encima del tipo 2 (0xC15E) no cae
	and a			;8b97
	ret nz			;8b98
	call fichas_de_snake		;8b99   ; fichas_de_snake: H y L = las dos fichas de la sala bajo Snake
	dec h			;8b9c   ; las dos fichas bajo Snake son la 1 (el hueco)
	ret nz			;8b9d
	dec l			;8b9e
	ret nz			;8b9f
	ld a,(0c130h)		;8ba0   ; lee la sala
	cp 02dh		;8ba3   ; la sala 0x2D: la puerta 0x5B, 0xC162 = 1
	ld a,05bh		;8ba5
	ld c,001h		;8ba7
	jr z,L_8BAE		;8ba9
	ld a,081h		;8bab   ; la 0x2E: la puerta 0x81, 0xC162 = 2
	inc c			;8bad
L_8BAE:
	ld (0c4fch),a		;8bae
	ld a,c			;8bb1
	ld (0c162h),a		;8bb2
	xor a			;8bb5   ; el paso 0
	ld (0c4fdh),a		;8bb6
	inc a			;8bb9   ; el modo 1: cambio de sala
	ld (0c151h),a		;8bba   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ret			;8bbd
fichas_que_hieren:		; en las salas 0x10, 0x25, 0x6E, 0x28 y 0x74 con 0xC616, sobre sus fichas: sonido 0x18 y dano 2
	ld a,(0c130h)		;8bbe   ; lee la sala
	cp 010h		;8bc1   ; las salas 0x10, 0x25 y 0x6E: las fichas 0x60 y 0x61
	ld bc,06061h		;8bc3
	jr z,L_8BDD		;8bc6
	cp 025h		;8bc8
	jr z,L_8BDD		;8bca
	cp 06eh		;8bcc
	jr z,L_8BDD		;8bce
	cp 028h		;8bd0   ; la 0x28: las 0x45 y 0x46
	ld bc,04546h		;8bd2
	jr z,L_8BDD		;8bd5
	cp 074h		;8bd7   ; la 0x74: las 0x40 y 0x41
	ld bc,04041h		;8bd9
	ret nz			;8bdc
L_8BDD:
	ld a,(0c616h)		;8bdd   ; solo con 0xC616
	and a			;8be0
	ret z			;8be1
	push bc			;8be2
	call fichas_de_snake		;8be3   ; fichas_de_snake: H y L = las dos fichas de la sala bajo Snake
	pop bc			;8be6
	ld a,h			;8be7   ; alguna de las dos fichas bajo Snake...
	cp b			;8be8
	jr z,L_8BF4		;8be9
	cp c			;8beb
	jr z,L_8BF4		;8bec
	ld a,l			;8bee
	cp b			;8bef
	jr z,L_8BF4		;8bf0
	cp c			;8bf2
	ret nz			;8bf3
L_8BF4:
	ld a,(0c199h)		;8bf4   ; lee la cuenta de herido (Snake parpadea)
	and a			;8bf7   ; herido hace poco: nada
	ret nz			;8bf8
	ld a,018h		;8bf9   ; el sonido 0x18
	call 04284h		;8bfb   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
	ld a,008h		;8bfe   ; 8 cuadros herido
	ld (0c199h),a		;8c00   ; guarda la cuenta de herido (Snake parpadea)
	jr L_8C25		;8c03
salas_que_hieren:		; en las salas de 0x8C2A, sin la MASK (objeto 5): dano 2 cada 0x10 cuadros
	ld a,(0c130h)		;8c05   ; lee la sala
	ld b,009h		;8c08   ; las 9 salas de 0x8C2A
	ld hl,08c2ah		;8c0a
L_8C0D:
	cp (hl)			;8c0d   ; busca la sala
	jr z,L_8C14		;8c0e
	inc hl			;8c10
	djnz L_8C0D		;8c11
	ret			;8c13
L_8C14:
	ld a,(0c135h)		;8c14   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 005h		;8c17   ; con la MASK (objeto 5), nada
	ret z			;8c19
	ld c,010h		;8c1a   ; 0x10 cuadros
dano_cada_c:		; si 0xC199 es cero: 0xC199 = C y dano 2
	ld a,(0c199h)		;8c1c   ; lee la cuenta de herido (Snake parpadea)
	and a			;8c1f   ; herido hace poco: nada
	ret nz			;8c20
	ld a,c			;8c21   ; la cuenta
	ld (0c199h),a		;8c22   ; guarda la cuenta de herido (Snake parpadea)
L_8C25:
	ld b,002h		;8c25   ; dano 2
	jp dano_a_snake		;8c27   ; dano_a_snake: resta B a la vida 0xC131; al llegar a cero, Snake muere (estado 3, modo 9, sonido 0x44)

; ----------------------------------------------------------------------
; DATOS salas_8c2a: 9 numeros de sala (0x1D, 0x5E, 0x60, 0x61, 0x62, 0x64,
;   0x65, 0x70, 0x72) que p02:8C0D compara con 0xC130
;   0x8c2a..0x8c33  (9 bytes)
DATA_salas_8c2a:
	defb 01dh,05eh,060h,061h,062h,064h,065h,070h,072h	; 8c2a  .^`abdepr

; ======================================================================
; CODIGO 0x8c33..0x8d3b  (264 bytes)
; ======================================================================


proyectiles_contra_actores:		; con el arma 0xC142: su tabla de dano y de cajas (p05:8951 o 8992) y cada proyectil contra los actores
	ld a,(0c142h)		;8c33   ; el arma de los disparos
	and a			;8c36
	ret z			;8c37
	ld hl,08951h		;8c38   ; las armas 1, 2, 4 y 7: las cajas de p05:8951...
	cp 003h		;8c3b
	jr c,L_8C4A		;8c3d
	cp 004h		;8c3f
	jr z,L_8C4A		;8c41
	cp 007h		;8c43
	jr z,L_8C4A		;8c45
	ld hl,08992h		;8c47   ; ...las 3, 5 y 6: las de p05:8992
L_8C4A:
	ld (0ec02h),hl		;8c4a
	call 04384h		;8c4d   ; tabla_de_dano: apunta 0xEC00 a la tabla de dano del arma A (p05:87B7)
	ld b,a			;8c50   ; B = 6 proyectiles
	ld ix,0c200h		;8c51   ; apunta a los proyectiles (0x180 bytes)
L_8C55:
	push bc			;8c55
	ld a,(ix+000h)		;8c56   ; lee el arma del proyectil
	and a			;8c59   ; hueco libre: nada
	call nz,proyectil_contra_actores		;8c5a   ; proyectil_contra_actores: el proyectil IX (si (ix+0x0F) bit 0) contra los 16 actores
	ld de,00040h		;8c5d   ; la ficha siguiente
	add ix,de		;8c60
	pop bc			;8c62
	djnz L_8C55		;8c63
	ret			;8c65
proyectil_contra_actores:		; el proyectil IX (si (ix+0x0F) bit 0) contra los 16 actores
	ld a,(ix+00fh)		;8c66   ; lee si el proyectil hiere (bit 0)
	rra			;8c69
	ret nc			;8c6a   ; sin herir: nada
	ld iy,0d000h		;8c6b   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;8c6f   ; 16 actores
L_8C71:
	push bc			;8c71
	ld a,(iy+000h)		;8c72   ; hueco vacio: nada
	and a			;8c75
	call nz,proyectil_contra_actor		;8c76   ; proyectil_contra_actor: el proyectil IX contra el actor IY: caja, marca y dano; Metal Gear solo con el orden de 0x8D3B
	ld de,00080h		;8c79   ; la ficha siguiente
	add iy,de		;8c7c
	pop bc			;8c7e
	djnz L_8C71		;8c7f
	ret			;8c81
proyectil_contra_actor:		; el proyectil IX contra el actor IY: caja, marca y dano; Metal Gear solo con el orden de 0x8D3B
	bit 1,(iy+00eh)		;8c82   ; bit 1 de (iy+0x0E): los proyectiles le dan
	ret z			;8c86
	ld a,(iy+000h)		;8c87   ; la caja del tipo para esta arma
	ld hl,(0ec02h)		;8c8a
	call 043a3h		;8c8d   ; byte_del_banco_5: A = el byte A - 1 de la tabla HL, con los bancos 4-5-6
	inc a			;8c90
	ret z			;8c91   ; 0xFF: no le toca
	call 043b4h		;8c92   ; caja_de_choque: copia la caja A (p05:8A55 + 4 x (A - 1)) a 0xC928; HL = 0xC928
	ld a,(iy+01eh)		;8c95   ; las marcas del arma a cero
	and 0e0h		;8c98
	ld (iy+01eh),a		;8c9a
	ld a,(iy+003h)		;8c9d   ; la Y del actor + dy menos la Y del proyectil...
	add a,(hl)			;8ca0
	inc hl			;8ca1
	sub (ix+004h)		;8ca2   ; le resta la Y del proyectil
	jr nc,L_8CA9		;8ca5
	neg		;8ca7
L_8CA9:
	cp (hl)			;8ca9   ; ...menor que el alto
	ret nc			;8caa
	inc hl			;8cab
	ld a,(iy+005h)		;8cac   ; la X + dx menos la X del proyectil...
	add a,(hl)			;8caf
	inc hl			;8cb0
	sub (ix+006h)		;8cb1   ; le resta la X del proyectil
	jr nc,L_8CB8		;8cb4
	neg		;8cb6
L_8CB8:
	cp (hl)			;8cb8   ; ...menor que el ancho
	ret nc			;8cb9
	ld c,(ix+001h)		;8cba   ; lee el paso del proyectil
	ld a,(ix+000h)		;8cbd   ; lee el arma del proyectil
	cp 004h		;8cc0   ; el ROCKET, la L.MINE y el MISSILE...
	jr z,L_8CCC		;8cc2
	cp 006h		;8cc4
	jr z,L_8CCC		;8cc6
	cp 007h		;8cc8
	jr nz,L_8CD3		;8cca
L_8CCC:
	inc c			;8ccc   ; ...en su paso 0 pasan al 1 (explotan)
	dec c			;8ccd
	jr nz,L_8CD3		;8cce
	inc (ix+001h)		;8cd0   ; sube el paso del proyectil
L_8CD3:
	ld a,(ix+000h)		;8cd3   ; lee el arma del proyectil
	or (iy+01eh)		;8cd6   ; el arma queda marcada en el actor
	ld (iy+01eh),a		;8cd9
	ld a,(iy+000h)		;8cdc
	dec a			;8cdf   ; el dano de esta arma contra el tipo
	call 04396h		;8ce0   ; dano: A = el byte A de la tabla de dano de 0xEC00
	ld c,a			;8ce3
	inc a			;8ce4
	jr z,L_8D32		;8ce5   ; 0xFF: no le hace nada
	ld a,(0c142h)		;8ce7   ; Metal Gear (0x11) con la P.BOMB:
	cp 005h		;8cea
	jr nz,L_8D28		;8cec
	ld a,(iy+000h)		;8cee
	cp 011h		;8cf1
	jr nz,L_8D28		;8cf3
	ld a,(ix+001h)		;8cf5   ; lee el paso del proyectil
	dec a			;8cf8   ; solo explotando (paso 1)
	jr nz,L_8D32		;8cf9
	ld a,(iy+005h)		;8cfb   ; 1 si la bomba esta a la izquierda, 2 a la derecha
	cp (ix+006h)		;8cfe   ; compara con la X del proyectil
	ld a,001h		;8d01
	jr nc,L_8D06		;8d03
	inc a			;8d05
L_8D06:
	ld de,0c1ceh		;8d06   ; los 16 ultimos golpes en 0xC1BF-0xC1CE...
	ld hl,0c1cdh		;8d09
	ld bc,0000fh		;8d0c
	lddr		;8d0f
	ld (de),a			;8d11   ; ...el nuevo primero
	ld hl,08d3bh		;8d12   ; comparados con el orden de 0x8D3B
	ld b,010h		;8d15
L_8D17:
	ld a,(de)			;8d17
	cp (hl)			;8d18
	jr nz,L_8D32		;8d19
	inc de			;8d1b
	inc hl			;8d1c
	djnz L_8D17		;8d1d
	xor a			;8d1f   ; en orden: borra 0xD08D y 0xD10D...
	ld (0d08dh),a		;8d20
	ld (0d10dh),a		;8d23
	ld c,002h		;8d26   ; ...y dano 2
L_8D28:
	ld a,(iy+00dh)		;8d28   ; el aguante baja el dano...
	sub c			;8d2b
	jr nc,L_8D2F		;8d2c
	xor a			;8d2e   ; ...sin pasar de cero
L_8D2F:
	ld (iy+00dh),a		;8d2f
L_8D32:
	ld a,(ix+000h)		;8d32   ; lee el arma del proyectil
	cp 003h		;8d35   ; las balas (armas 1 y 2) se quitan al dar
	jp c,quita_proyectil		;8d37   ; quita_proyectil: el arma del proyectil a cero y sus sprites escondidos
	ret			;8d3a

; ----------------------------------------------------------------------
; DATOS tabla_8d3b: 16 bytes (1 y 2) que p02:8D18 compara uno a uno con (de)
;   (B = 16)
;   0x8d3b..0x8d4b  (16 bytes)
DATA_tabla_8d3b:
	defb 002h,002h,001h,002h,001h,002h,002h,001h,001h,002h,001h,001h,002h,001h,002h,002h	; 8d3b  ................

; ======================================================================
; CODIGO 0x8d4b..0x918a  (1087 bytes)
; ======================================================================


objetos_de_la_sala:		; Snake contra los 3 objetos de 0xC5D0 (fichas de 0x10)
	ld hl,0c5d0h		;8d4b   ; los 3 objetos de la sala (fichas de 0x10)
	ld a,(0c182h)		;8d4e   ; lee la Y de Snake
	ld e,a			;8d51   ; E = la Y de Snake
	ld a,(0c184h)		;8d52   ; lee la X de Snake
	ld d,a			;8d55   ; D = la X
	ld bc,00300h		;8d56   ; B = 3, C = el numero de objeto
L_8D59:
	push hl			;8d59
	push de			;8d5a
	push bc			;8d5b
	ld a,(hl)			;8d5c
	and a			;8d5d   ; vacio: nada
	call nz,coge_objeto		;8d5e   ; coge_objeto: si Snake esta encima del objeto HL lo coge: municion (0x23), arma (< 8), SILENCER (8) u objeto
	ld a,(0c151h)		;8d61   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 00ah		;8d64   ; si se abrio una ventana de texto (modo 10)...
	jr nz,L_8D6D		;8d66
	pop bc			;8d68   ; ...no mira mas
	ld b,001h		;8d69
	jr L_8D6E		;8d6b
L_8D6D:
	pop bc			;8d6d
L_8D6E:
	pop de			;8d6e
	pop hl			;8d6f
	ld a,010h		;8d70   ; la ficha siguiente
	call 041e0h		;8d72   ; hl_mas_a: HL = HL + A
	inc c			;8d75
	djnz L_8D59		;8d76
	ret			;8d78
coge_objeto:		; si Snake esta encima del objeto HL lo coge: municion (0x23), arma (< 8), SILENCER (8) u objeto
	push hl			;8d79
	pop ix		;8d7a
	ld a,c			;8d7c   ; 0xEC00 = el numero de objeto
	ld (0ec00h),a		;8d7d   ; guarda la casilla de trabajo 0xEC00
	inc hl			;8d80
	bit 0,(hl)		;8d81   ; bit 0 del byte 1: el dibujo es de 16 de ancho
	ld bc,01014h		;8d83   ; 32 de ancho: la caja de 0x14...
	jr z,L_8D8B		;8d86
	ld bc,0080ch		;8d88   ; 16: la de 0x0C
L_8D8B:
	inc hl			;8d8b
	ld a,(hl)			;8d8c   ; la Y + 0x10 menos la de Snake...
	add a,010h		;8d8d
	sub e			;8d8f
	jr nc,L_8D94		;8d90
	neg		;8d92
L_8D94:
	cp 010h		;8d94   ; ...a menos de 0x10
	ret nc			;8d96
	inc hl			;8d97
	ld a,(hl)			;8d98   ; la X + la mitad menos la de Snake...
	add a,b			;8d99
	sub d			;8d9a
	jr nc,L_8D9F		;8d9b
	neg		;8d9d
L_8D9F:
	cp c			;8d9f   ; ...dentro de la caja
	ret nc			;8da0
	inc hl			;8da1
	ld a,(hl)			;8da2   ; +4 en 0xEC02
	ld (0ec02h),a		;8da3
	dec hl			;8da6
	dec hl			;8da7
	dec hl			;8da8
	dec hl			;8da9
	ld a,(hl)			;8daa   ; +0: el objeto, en 0xEC01
	ld (0ec01h),a		;8dab
	cp 023h		;8dae   ; 0x23: la municion
	jp z,coge_municion		;8db0   ; coge_municion: 0x20 balas de HAND GUN y SMG, 6 GRENADE y 2 ROCKET a las que lleve
	cp 008h		;8db3   ; menos de 8: un arma
	jr c,coge_arma		;8db5
	jr z,L_8DFD		;8db7   ; el 8: el SILENCER
	call marca_cogido		;8db9   ; marca_cogido: marca el arma (0xC520) o el objeto (0xC5A0) como cogido
	ld a,(0ec01h)		;8dbc   ; del 9 en adelante, un objeto (objeto - 8)
	sub 008h		;8dbf
	cp 01ah		;8dc1   ; el 0x1A: lo suyo
	jp z,coge_objeto_34		;8dc3   ; coge_objeto_34: 0xC13B = 0, 0xC5B9 = 1 y el objeto 0x17 en 0xC530
	call 043e1h		;8dc6   ; busca_objeto: busca A en los 25 objetos de 0xC530 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	jr c,L_8DD1		;8dc9   ; si ya lo lleva, suma
	call suma_objeto		;8dcb   ; suma_objeto: suma a (HL + 1) lo de p05:8AE8 del objeto y recorta a los maximos
	jp borra_objeto		;8dce   ; borra_objeto: tapa el objeto (copia de la pagina 1), sonido 0x24 y el texto de p05:8AC5 si es 0x3E
L_8DD1:
	ld a,(0ec01h)		;8dd1
	sub 008h		;8dd4
	ld hl,0c530h		;8dd6   ; apunta a los objetos que se llevan (fichas de 4)
	ld b,019h		;8dd9   ; 25 huecos
	ld c,a			;8ddb
L_8DDC:
	ld a,(hl)			;8ddc   ; el primer hueco vacio
	and a			;8ddd
	jr z,L_8DE8		;8dde
	ld a,004h		;8de0
	call 041e0h		;8de2   ; hl_mas_a: HL = HL + A
	djnz L_8DDC		;8de5
	ret			;8de7
L_8DE8:
	ld (hl),c			;8de8   ; el objeto nuevo
	ld a,c			;8de9
	cp 008h		;8dea   ; el 8 (ANTEN)...
	jr nz,L_8DF7		;8dec
	ld a,010h		;8dee   ; ...pone 0xC160 = 0x10 y 0xC15F = 0: una llamada
	ld (0c160h),a		;8df0   ; guarda la cuenta hasta la llamada
	xor a			;8df3
	ld (0c15fh),a		;8df4   ; guarda la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna)
L_8DF7:
	call suma_objeto		;8df7   ; suma_objeto: suma a (HL + 1) lo de p05:8AE8 del objeto y recorta a los maximos
	jp borra_objeto		;8dfa   ; borra_objeto: tapa el objeto (copia de la pagina 1), sonido 0x24 y el texto de p05:8AC5 si es 0x3E
L_8DFD:
	call marca_cogido		;8dfd   ; marca_cogido: marca el arma (0xC520) o el objeto (0xC5A0) como cogido
	ld a,008h		;8e00   ; el SILENCER: 0xC51C = 8
	ld (0c51ch),a		;8e02
	jp borra_objeto		;8e05   ; borra_objeto: tapa el objeto (copia de la pagina 1), sonido 0x24 y el texto de p05:8AC5 si es 0x3E
coge_arma:		; el arma: municion si ya la lleva; si no, al primer hueco de 0xC500 (y elegida si es la primera)
	call marca_cogido		;8e08   ; marca_cogido: marca el arma (0xC520) o el objeto (0xC5A0) como cogido
	ld a,(0ec01h)		;8e0b   ; el arma
	call 043e8h		;8e0e   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	jr c,L_8E2B		;8e11   ; si no la lleva, la anade
	push hl			;8e13
	call suma_objeto		;8e14   ; suma_objeto: suma a (HL + 1) lo de p05:8AE8 del objeto y recorta a los maximos
	pop hl			;8e17
	ld a,(0c134h)		;8e18   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	ld c,a			;8e1b   ; si es la elegida...
	ld a,(0ec01h)		;8e1c
	cp c			;8e1f
	jp nz,borra_objeto		;8e20   ; borra_objeto: tapa el objeto (copia de la pagina 1), sonido 0x24 y el texto de p05:8AC5 si es 0x3E
	inc hl			;8e23   ; ...pinta su municion nueva
	inc hl			;8e24
	call 04795h		;8e25   ; pinta_municion: el numero BCD de 2 bytes de HL en (0xC0, 0xC8)
	jp borra_objeto		;8e28   ; borra_objeto: tapa el objeto (copia de la pagina 1), sonido 0x24 y el texto de p05:8AC5 si es 0x3E
L_8E2B:
	ld a,(0ec01h)		;8e2b
	ld hl,0c500h		;8e2e   ; apunta a las armas que se llevan (fichas de 4: [arma][municion BCD])
	ld b,007h		;8e31   ; 7 huecos
	ld c,a			;8e33
L_8E34:
	ld a,(hl)			;8e34   ; el primer hueco vacio
	and a			;8e35
	jr z,L_8E40		;8e36
	ld a,004h		;8e38
	call 041e0h		;8e3a   ; hl_mas_a: HL = HL + A
	djnz L_8E34		;8e3d
	ret			;8e3f
L_8E40:
	ld (hl),c			;8e40   ; el arma nueva
	push hl			;8e41
	ld a,b			;8e42
	cp 007h		;8e43   ; si es la primera arma...
	jr nz,L_8E6D		;8e45
	ld a,c			;8e47
	cp 003h		;8e48   ; ...(salvo la GRENADE)...
	jr z,L_8E6D		;8e4a
	ld (0c142h),a		;8e4c   ; ...queda elegida
	ld (0c134h),a		;8e4f   ; guarda el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	call 04bech		;8e52   ; patrones_del_arma: carga los patrones del arma elegida (p10:6392) y los de su explosion
	ld hl,0ea10h		;8e55   ; los sprites de los proyectiles fuera
	ld b,018h		;8e58
	ld a,0e0h		;8e5a
L_8E5C:
	ld (hl),a			;8e5c
	inc hl			;8e5d
	djnz L_8E5C		;8e5e
	ld hl,0c200h		;8e60   ; apunta a los proyectiles (0x180 bytes)
	ld de,0c201h		;8e63   ; los proyectiles a cero
	ld bc,0017fh		;8e66
	ld (hl),000h		;8e69
	ldir		;8e6b
L_8E6D:
	pop hl			;8e6d
	call suma_objeto		;8e6e   ; suma_objeto: suma a (HL + 1) lo de p05:8AE8 del objeto y recorta a los maximos
	call 04751h		;8e71   ; marcador_arma: pinta en el marcador el arma elegida (0xC134) y su municion
	jr borra_objeto		;8e74
coge_objeto_34:		; 0xC13B = 0, 0xC5B9 = 1 y el objeto 0x17 en 0xC530
	xor a			;8e76
	ld (0c13bh),a		;8e77   ; guarda la bandera de capturado (sin armas ni objetos)
	inc a			;8e7a   ; 0xC13B a cero (ya no capturado)...
	ld (0c5b9h),a		;8e7b   ; ...y 0xC5B9 = 1
	ld hl,0c530h		;8e7e   ; apunta a los objetos que se llevan (fichas de 4)
	ld b,019h		;8e81   ; en el primer hueco vacio...
L_8E83:
	ld a,(hl)			;8e83
	and a			;8e84
	jr z,L_8E8E		;8e85
	ld a,004h		;8e87
	call 041e0h		;8e89   ; hl_mas_a: HL = HL + A
	jr L_8E83		;8e8c
L_8E8E:
	ld (hl),017h		;8e8e   ; ...el objeto 0x17 con cantidad 1
	inc hl			;8e90
	ld a,001h		;8e91
	ld (hl),a			;8e93
	ld (0c5b6h),a		;8e94   ; 0xC5B6 = 1
	call 04751h		;8e97   ; marcador_arma: pinta en el marcador el arma elegida (0xC134) y su municion
	call 04843h		;8e9a   ; marcador_objeto: pinta en el marcador el objeto elegido (0xC135)
	jr borra_objeto		;8e9d
coge_municion:		; 0x20 balas de HAND GUN y SMG, 6 GRENADE y 2 ROCKET a las que lleve
	ld a,001h		;8e9f   ; la HAND GUN: +0x20
	call 043e8h		;8ea1   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8ea4
	ld a,020h		;8ea5
	call nc,suma_a		;8ea7   ; suma_a: suma A (BCD) a (HL) y recorta cada municion a su maximo (0xC380)
	ld a,002h		;8eaa   ; la SMG: +0x20
	call 043e8h		;8eac   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8eaf
	ld a,020h		;8eb0
	call nc,suma_a		;8eb2   ; suma_a: suma A (BCD) a (HL) y recorta cada municion a su maximo (0xC380)
	ld a,003h		;8eb5   ; la GRENADE: +6
	call 043e8h		;8eb7   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8eba
	ld a,006h		;8ebb
	call nc,suma_a		;8ebd   ; suma_a: suma A (BCD) a (HL) y recorta cada municion a su maximo (0xC380)
	ld a,004h		;8ec0   ; el ROCKET: +2
	call 043e8h		;8ec2   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8ec5
	ld a,002h		;8ec6
	call nc,suma_a		;8ec8   ; suma_a: suma A (BCD) a (HL) y recorta cada municion a su maximo (0xC380)
	ld a,(0c134h)		;8ecb   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	and a			;8ece   ; sin arma elegida, nada mas
	jr z,borra_objeto		;8ecf
	call 043e8h		;8ed1   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;8ed4   ; si no, pinta su municion
	inc hl			;8ed5
	call 04795h		;8ed6   ; pinta_municion: el numero BCD de 2 bytes de HL en (0xC0, 0xC8)
borra_objeto:		; tapa el objeto (copia de la pagina 1), sonido 0x24 y el texto de p05:8AC5 si es 0x3E
	ld a,(0ec00h)		;8ed9   ; lee la casilla de trabajo 0xEC00
	and a			;8edc   ; el fondo guardado del objeto 0, 1 o 2...
	ld hl,0a0b0h		;8edd   ; ...en (0xB0, 0xA0), (0xC0, 0xA0) o (0xD0, 0xA0) de la pagina 1
	jr z,L_8EE9		;8ee0
	dec a			;8ee2
	ld l,0c0h		;8ee3
	jr z,L_8EE9		;8ee5
	ld l,0d0h		;8ee7
L_8EE9:
	bit 0,(ix+001h)		;8ee9   ; 32 x 16 o 16 x 16
	ld bc,02010h		;8eed
	jr z,L_8EF4		;8ef0
	ld b,010h		;8ef2
L_8EF4:
	ld e,(ix+002h)		;8ef4   ; en el sitio del objeto
	ld d,(ix+003h)		;8ef7
	ld a,048h		;8efa   ; de la pagina 1 a la 0, TIMP
	call 05011h		;8efc   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	ld c,(ix+000h)		;8eff   ; el objeto...
	ld (ix+000h),000h		;8f02   ; ...fuera de la sala
	ld a,024h		;8f06   ; el sonido 0x24
	call 04284h		;8f08   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
	ld a,(0ec02h)		;8f0b   ; con +4 (0xEC02) no hay texto
	and a			;8f0e
	ret nz			;8f0f
	ld a,c			;8f10
	ld hl,08ac5h		;8f11   ; p05:8AC5: el texto al coger cada objeto
	call 043a3h		;8f14   ; byte_del_banco_5: A = el byte A - 1 de la tabla HL, con los bancos 4-5-6
	and a			;8f17
	ret z			;8f18
	cp 03eh		;8f19   ; solo el 0x3E
	ret nz			;8f1b
	jp 05ce1h		;8f1c   ; ventana_de_texto: abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
suma_objeto:		; suma a (HL + 1) lo de p05:8AE8 del objeto y recorta a los maximos
	inc hl			;8f1f
	ld a,(0ec01h)		;8f20   ; lo que suma el objeto
	dec a			;8f23
	call 043a9h		;8f24   ; suma_de_objeto: A = el byte A de p05:8AE8 (lo que suma cada objeto)
suma_a:		; suma A (BCD) a (HL) y recorta cada municion a su maximo (0xC380)
	add a,(hl)			;8f27   ; la cantidad (BCD)...
	daa			;8f28
	ld (hl),a			;8f29
	jr nc,recorta_municion		;8f2a   ; ...con acarreo al byte alto
	inc hl			;8f2c
	inc (hl)			;8f2d
recorta_municion:		; cada municion y las raciones, a su maximo (0xC380)
	ld a,001h		;8f2e   ; la HAND GUN, a su maximo (0xC380)
	call 043e8h		;8f30   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c380h)		;8f33
	call nc,recorta		;8f37   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ld a,002h		;8f3a   ; la SMG
	call 043e8h		;8f3c   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c382h)		;8f3f
	call nc,recorta		;8f43   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ld a,003h		;8f46   ; la GRENADE
	call 043e8h		;8f48   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c384h)		;8f4b
	call nc,recorta		;8f4f   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ld a,004h		;8f52   ; el ROCKET
	call 043e8h		;8f54   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c386h)		;8f57
	call nc,recorta		;8f5b   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ld a,005h		;8f5e   ; la P.BOMB
	call 043e8h		;8f60   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c388h)		;8f63
	call nc,recorta		;8f67   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ld a,006h		;8f6a   ; la L.MINE
	call 043e8h		;8f6c   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c38ah)		;8f6f
	call nc,recorta		;8f73   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ld a,007h		;8f76   ; el MISSILE
	call 043e8h		;8f78   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c38ch)		;8f7b
	call nc,recorta		;8f7f   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ld a,016h		;8f82   ; las raciones (0x16), a 0xC3BA
	call 043e1h		;8f84   ; busca_objeto: busca A en los 25 objetos de 0xC530 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld bc,(0c3bah)		;8f87
	call nc,recorta		;8f8b   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
	ret			;8f8e
marca_cogido:		; marca el arma (0xC520) o el objeto (0xC5A0) como cogido
	ld c,a			;8f8f   ; C = el objeto
	cp 005h		;8f90   ; las armas 1-4 se marcan
	jr c,L_8F9D		;8f92
	cp 008h		;8f94   ; las 5-7 no (su municion vuelve a salir)
	ret c			;8f96
	cp 01eh		;8f97   ; ni el 0x1E ni el 0x23
	ret z			;8f99
	cp 023h		;8f9a
	ret z			;8f9c
L_8F9D:
	cp 009h		;8f9d   ; las armas (1-8): 0xC520
	ld hl,0c520h		;8f9f
	jr c,L_8FA9		;8fa2
	sub 008h		;8fa4   ; los objetos: 0xC5A0 + objeto - 9
	ld hl,0c5a0h		;8fa6
L_8FA9:
	dec a			;8fa9
	call 041e0h		;8faa   ; hl_mas_a: HL = HL + A
	ld (hl),001h		;8fad   ; marcado: no vuelve a salir
	ret			;8faf
borra_la_partida:		; 0xC120-0xEC8F a cero y 0xC008 = 0
	xor a			;8fb0
	ld hl,0c120h		;8fb1   ; 0xC120-0xEC8F...
	ld bc,02b6fh		;8fb4
	ld d,h			;8fb7
	ld e,l			;8fb8
	inc e			;8fb9
	ld (hl),a			;8fba   ; ...a cero
	ldir		;8fbb
	ld (0c008h),a		;8fbd   ; guarda la pausa (1) o F5 (2)
	ret			;8fc0
marcador:		; LIFE, CLASS, la llamada, el arma y el objeto
	call barra_de_vida		;8fc1   ; barra_de_vida: LIFE y la barra 0xC131 sobre el maximo 0xC137
	call estrellas		;8fc4   ; estrellas: CLASS y las estrellas de 0xC132
	call marcador_llamada		;8fc7   ; marcador_llamada: CALL parpadeando con 0xC15F = 1 (sonido 0x22) o la cuenta atras 0xC13D
	call 04751h		;8fca   ; marcador_arma: pinta en el marcador el arma elegida (0xC134) y su municion
	jp 04843h		;8fcd   ; marcador_objeto: pinta en el marcador el objeto elegido (0xC135)
marcador_llamada:		; CALL parpadeando con 0xC15F = 1 (sonido 0x22) o la cuenta atras 0xC13D
	ld c,000h		;8fd0   ; C = 0: el rotulo CALL en blanco
	ld a,(0c15fh)		;8fd2   ; lee la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna)
	dec a			;8fd5   ; con la llamada sonando (0xC15F = 1)...
	jr nz,L_8FF2		;8fd6
	ld a,(0c151h)		;8fd8   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	sub 002h		;8fdb   ; ...salvo en las ventanas de armas y equipo...
	jr z,L_8FF2		;8fdd
	dec a			;8fdf
	jr z,L_8FF2		;8fe0
	ld a,(0c003h)		;8fe2   ; lee la cuenta de cuadros
	bit 3,a		;8fe5   ; ...cada 8 cuadros (8 si y 8 no)...
	jr nz,L_8FF2		;8fe7
	and 007h		;8fe9
	ld a,022h		;8feb   ; ...el sonido 0x22 cada 8...
	call z,0427ch		;8fed   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld c,0ffh		;8ff0   ; ...y CALL de verdad
L_8FF2:
	ld a,(0c13ch)		;8ff2   ; lee la cuenta atras en marcha
	and a			;8ff5   ; sin cuenta atras: CALL (p02:92CF) en (0x78, 0xC1)
	jr nz,L_8FFE		;8ff6
	ld hl,092cfh		;8ff8
	jp 05112h		;8ffb
L_8FFE:
	ld a,(0c922h)		;8ffe   ; en el final, sin digitos
	cp 004h		;9001
	ret nc			;9003
	ld c,001h		;9004   ; con la cuenta atras, sus 4 digitos grandes...
	ld de,070c1h		;9006   ; ...en (0xC1, 0x70)
	ld a,(0c13eh)		;9009   ; los dos digitos altos (0xC13E)
	rra			;900c
	rra			;900d
	rra			;900e
	rra			;900f
	call 06b16h		;9010   ; digito_de_frecuencia: el digito A (dos caracteres de 0x6B34) en (D, E)
	ld a,(0c13eh)		;9013   ; el de las unidades del byte alto
	call 06b16h		;9016   ; digito_de_frecuencia: el digito A (dos caracteres de 0x6B34) en (D, E)
	ld a,(0c13dh)		;9019   ; lee la cuenta atras (BCD, 16 bits)
	rra			;901c   ; los dos bajos (0xC13D)
	rra			;901d
	rra			;901e
	rra			;901f
	call 06b16h		;9020   ; digito_de_frecuencia: el digito A (dos caracteres de 0x6B34) en (D, E)
	ld a,(0c13dh)		;9023   ; lee la cuenta atras (BCD, 16 bits)
	jp 06b16h		;9026   ; digito_de_frecuencia: el digito A (dos caracteres de 0x6B34) en (D, E)
dano_4:		; dano 4
	ld b,004h		;9029   ; dano 4
dano_a_snake:		; resta B a la vida 0xC131; al llegar a cero, Snake muere (estado 3, modo 9, sonido 0x44)
	ld hl,0c131h		;902b   ; apunta a la vida (LIFE)
	ld a,(hl)			;902e   ; sin vida, muere
	and a			;902f
	jr z,snake_muere		;9030
L_9032:
	dec (hl)			;9032   ; uno menos por punto de dano...
	jr z,snake_muere		;9033   ; ...hasta cero: muere
	djnz L_9032		;9035
	jp barra_de_vida		;9037   ; barra_de_vida: LIFE y la barra 0xC131 sobre el maximo 0xC137
snake_muere:		; estado 3, pose 6, modo 9, 0xC19D = 0x80 y el sonido 0x44
	call barra_de_vida		;903a   ; barra_de_vida: LIFE y la barra 0xC131 sobre el maximo 0xC137
	ld a,003h		;903d   ; el estado 3 de Snake
	ld (0c180h),a		;903f   ; guarda el estado de Snake
	ld a,006h		;9042   ; el modo de pose 6
	ld (0c18bh),a		;9044   ; guarda el modo de la pose de Snake
	ld a,009h		;9047   ; el modo 9 de la partida
	ld (0c151h),a		;9049   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ld a,080h		;904c   ; 0x80 cuadros
	ld (0c19dh),a		;904e
	xor a			;9051   ; 0xC199 a cero
	ld (0c199h),a		;9052   ; guarda la cuenta de herido (Snake parpadea)
	ld hl,0ea10h		;9055   ; los sprites de los proyectiles fuera
	ld de,0ea11h		;9058
	ld bc,00017h		;905b
	ld (hl),0e0h		;905e
	ldir		;9060
	ld a,044h		;9062   ; el sonido 0x44
	jp 0427ch		;9064   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
barra_de_vida:		; LIFE y la barra 0xC131 sobre el maximo 0xC137
	ld hl,092afh		;9067   ; LIFE (p02:92AF)
	call 0510ch		;906a   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	ld hl,031c1h		;906d   ; el marco de la barra en (0x31, 0xC1), 0x32 x 8, color 14
	ld de,03208h		;9070
	ld c,00eh		;9073
	call 04f63h		;9075   ; recuadro: un recuadro de D x E desde (H, L) en el color C
	ld a,(0c131h)		;9078   ; lee la vida (LIFE)
	and a			;907b   ; sin vida o con 1, sin barra
	jr z,L_908F		;907c
	dec a			;907e
	jr z,L_908F		;907f
	inc a			;9081   ; la vida...
	ld hl,032c2h		;9082   ; ...desde (0x32, 0xC2), 6 de alto...
	ld c,006h		;9085
	ld b,a			;9087
	ld d,000h		;9088
	ld a,088h		;908a   ; ...en el color 8 (0x88)
	call 04f91h		;908c   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
L_908F:
	ld a,(0c131h)		;908f   ; lee la vida (LIFE)
	cp 030h		;9092   ; con el maximo de 0x30 (o 0x2F)...
	ret z			;9094
	cp 02fh		;9095
	ret z			;9097
	ld e,a			;9098   ; ...el resto de la barra...
	ld c,032h		;9099
	add a,c			;909b
	ld h,a			;909c
	ld l,0c2h		;909d
	ld a,030h		;909f   ; ...0x30 - vida...
	sub e			;90a1
	ld b,a			;90a2
	ld c,006h		;90a3
	xor a			;90a5   ; ...a negro
	ld d,a			;90a6
	jp 04f91h		;90a7   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
estrellas:		; CLASS y las estrellas de 0xC132
	ld hl,092b6h		;90aa   ; CLASS (p02:92B6)
	call 0510ch		;90ad   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	ld de,034c9h		;90b0   ; las estrellas en (0x34, 0xC9)
	ld a,(0c132h)		;90b3   ; lee la CLASS (0-3 estrellas)
	inc a			;90b6   ; CLASS + 1...
	ld c,03bh		;90b7   ; ...estrellas (0x3B)
	call caracter_b_veces		;90b9   ; caracter_b_veces: el caracter C B veces desde (D, E)
	ld a,(0c132h)		;90bc   ; lee la CLASS (0-3 estrellas)
	sub 003h		;90bf   ; el resto hasta 3...
	ret z			;90c1
	neg		;90c2
	ld c,000h		;90c4   ; ...en blanco
caracter_b_veces:		; el caracter C B veces desde (D, E)
	ld b,a			;90c6   ; B veces
L_90C7:
	ld a,c			;90c7   ; el caracter C
	call 05135h		;90c8   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	ld a,d			;90cb   ; 8 puntos a la derecha
	add a,008h		;90cc
	ld d,a			;90ce
	djnz L_90C7		;90cf
	ret			;90d1
numero_bcd:		; el numero BCD de HL hacia atras, B bytes, sin ceros a la izquierda
	ld c,000h		;90d2   ; C = 0: los ceros de la izquierda en blanco
L_90D4:
	dec b			;90d4   ; el ultimo byte...
	jr nz,L_90D9		;90d5
	ld c,0ffh		;90d7   ; ...pinta su cero
L_90D9:
	inc b			;90d9
	ld a,(hl)			;90da   ; el nibble alto...
	rra			;90db
	rra			;90dc
	rra			;90dd
	rra			;90de
	call digito		;90df   ; digito: el digito A (o blanco si es un cero a la izquierda)
L_90E2:
	ld a,(hl)			;90e2   ; ...y el bajo
	call digito		;90e3   ; digito: el digito A (o blanco si es un cero a la izquierda)
	dec hl			;90e6   ; el byte anterior (hacia atras)
	djnz L_90D4		;90e7
	ret			;90e9
numero_bcd_2:		; el numero BCD de 2 bytes de HL
	ld c,000h		;90ea   ; 2 bytes
	ld b,002h		;90ec
	jr L_90E2		;90ee
digito:		; el digito A (o blanco si es un cero a la izquierda)
	and 00fh		;90f0   ; el digito
	jr z,L_90F6		;90f2
	ld c,0ffh		;90f4   ; el primer digito no cero: desde aqui todos
L_90F6:
	add a,030h		;90f6   ; '0' + digito (o 0, el blanco)
	and c			;90f8
	call 05135h		;90f9   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	ld a,d			;90fc   ; 8 puntos a la derecha
	add a,008h		;90fd
	ld d,a			;90ff
	ret			;9100
maximos:		; los maximos de municion y de raciones por CLASS (0x918A-0x91BA) en 0xC380
	ld de,0c381h		;9101   ; 0xC380-0xC3CF a 0xFF
	ld hl,0c380h		;9104
	ld bc,0004fh		;9107
	ld (hl),0ffh		;910a
	ldir		;910c
	ld a,(0c132h)		;910e   ; lee la CLASS (0-3 estrellas)
	and a			;9111   ; CLASS 0: 0x918A y 3 raciones
	ld hl,0918ah		;9112
	ld c,003h		;9115
	jr z,L_912E		;9117
	dec a			;9119   ; CLASS 1: 0x919A y 6
	ld hl,0919ah		;911a
	ld c,006h		;911d
	jr z,L_912E		;911f
	dec a			;9121   ; CLASS 2: 0x91AA y 9
	ld hl,091aah		;9122
	ld c,009h		;9125
	jr z,L_912E		;9127
	ld hl,091bah		;9129   ; CLASS 3: 0x91BA y 0x12
	ld c,012h		;912c
L_912E:
	ld a,c			;912e
	ld de,0c380h		;912f   ; los 8 maximos (BCD) a 0xC380
	ld bc,00010h		;9132
	ldir		;9135
	ld l,a			;9137   ; el de las raciones a 0xC3BA
	ld h,000h		;9138
	ld (0c3bah),hl		;913a
	ld a,(0c141h)		;913d   ; con la clave de la municion (0xC141 bit 0)...
	rra			;9140
	jr nc,L_914E		;9141
	ld hl,091cah		;9143   ; ...todos a 999 (0x91CA)
	ld de,0c380h		;9146
	ld bc,00010h		;9149
	ldir		;914c
L_914E:
	rra			;914e   ; con la de las raciones (bit 1), 999
	jr nc,L_9157		;914f
	ld hl,00999h		;9151
	ld (0c3bah),hl		;9154
L_9157:
	ld a,016h		;9157   ; si lleva raciones...
	call 043e1h		;9159   ; busca_objeto: busca A en los 25 objetos de 0xC530 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	jr nc,L_9165		;915c
	ld bc,(0c3bah)		;915e   ; ...recorta su cantidad
	call recorta		;9162   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
L_9165:
	ld b,008h		;9165   ; las 8 armas
	ld c,001h		;9167
	ld ix,0c380h		;9169   ; los maximos
L_916D:
	ld a,c			;916d   ; si lleva el arma...
	push bc			;916e
	push ix		;916f
	call 043e8h		;9171   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	jr nc,L_917F		;9174
	ld c,(ix+000h)		;9176   ; ...recorta su municion
	ld b,(ix+001h)		;9179
	call recorta		;917c   ; recorta: si la cantidad de (HL + 1) pasa de BC, la deja en BC
L_917F:
	pop ix		;917f
	pop bc			;9181
	inc c			;9182   ; el arma siguiente
	inc ix		;9183
	inc ix		;9185
	djnz L_916D		;9187
	ret			;9189

; ----------------------------------------------------------------------
; DATOS bloques_918a: 5 bloques de 16 bytes: p02:912E copia a 0xC380 el de
;   0x918A, 0x919A, 0x91AA o 0x91BA segun 0xC132 (0-3; C = 3, 6, 9 o 0x12) y
;   p02:914C el de 0x91CA
;   0x918a..0x91da  (80 bytes)
DATA_bloques_918a:
	defb 050h,000h,050h,000h,015h,000h,005h,000h,005h,000h,005h,000h,005h,000h,005h,000h	; 918a  P.P.............
	defb 000h,001h,000h,001h,030h,000h,010h,000h,010h,000h,010h,000h,010h,000h,010h,000h	; 919a  ....0...........
	defb 000h,002h,000h,002h,060h,000h,020h,000h,015h,000h,015h,000h,015h,000h,015h,000h	; 91aa  ....`. .........
	defb 000h,003h,000h,003h,090h,000h,030h,000h,020h,000h,020h,000h,020h,000h,020h,000h	; 91ba  ......0. . . . .
	defb 099h,009h,099h,009h,099h,009h,099h,009h,099h,009h,099h,009h,099h,009h,099h,009h	; 91ca  ................

; ======================================================================
; CODIGO 0x91da..0x9262  (136 bytes)
; ======================================================================


recorta:		; si la cantidad de (HL + 1) pasa de BC, la deja en BC
	inc hl			;91da   ; DE = la cantidad (+1, +2)
	ld e,(hl)			;91db
	inc hl			;91dc
	ld d,(hl)			;91dd
	ex de,hl			;91de
	and a			;91df   ; si no pasa del maximo, nada
	sbc hl,bc		;91e0
	ret z			;91e2
	ret c			;91e3
	ex de,hl			;91e4   ; si pasa, la deja en el maximo
	ld (hl),b			;91e5
	dec hl			;91e6
	ld (hl),c			;91e7
	ret			;91e8
cuenta_de_llamada:		; baja 0xC160 y pasa 0xC15F de 0 a 1 (llamando) y de 1 a 2
	ld hl,0c160h		;91e9   ; apunta a la cuenta hasta la llamada
	ld a,(hl)			;91ec   ; sin cuenta, nada
	and a			;91ed
	ret z			;91ee
	ld a,(0c15fh)		;91ef   ; lee la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna)
	cp 002h		;91f2   ; sin llamada (2), nada
	ret z			;91f4
	dec a			;91f5   ; sonando (1): la cuenta del sonido
	jr z,L_9201		;91f6
	dec (hl)			;91f8   ; pendiente (0): espera la cuenta...
	ret nz			;91f9
	ld (hl),058h		;91fa   ; ...0x58 cuadros sonando
	ld a,001h		;91fc
	ld (0c15fh),a		;91fe   ; guarda la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna)
L_9201:
	dec (hl)			;9201   ; al acabar de sonar...
	ret nz			;9202
	ld a,002h		;9203   ; ...sin llamada
	ld (0c15fh),a		;9205   ; guarda la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna)
	ret			;9208
cuenta_atras:		; con 0xC13C baja la cuenta 0xC13D (BCD); a cero, Snake muere
	ld a,(0c13ch)		;9209   ; lee la cuenta atras en marcha
	and a			;920c   ; sin cuenta atras, nada
	ret z			;920d
	ld hl,0c13dh		;920e   ; apunta a la cuenta atras (BCD, 16 bits)
	ld a,(hl)			;9211   ; baja 1 (BCD)
	sub 001h		;9212
	daa			;9214
	ld (hl),a			;9215
	jr nc,L_921F		;9216   ; sin acarreo, el byte alto no cambia
	inc hl			;9218   ; el byte alto baja 1
	ld a,(hl)			;9219
	sub 001h		;921a
	daa			;921c
	ld (hl),a			;921d
	dec hl			;921e
L_921F:
	ld a,(hl)			;921f   ; a cero...
	inc hl			;9220
	or (hl)			;9221
	ret nz			;9222
	call marcador_llamada		;9223   ; marcador_llamada: CALL parpadeando con 0xC15F = 1 (sonido 0x22) o la cuenta atras 0xC13D
	xor a			;9226   ; ...la vida a cero: muere
	ld (0c131h),a		;9227   ; guarda la vida (LIFE)
	jp snake_muere		;922a   ; snake_muere: estado 3, pose 6, modo 9, 0xC19D = 0x80 y el sonido 0x44
aprieta_armas:		; quita los huecos de la lista de armas 0xC500
	ld de,0c500h		;922d   ; apunta a las armas que se llevan (fichas de 4: [arma][municion BCD])
	ld b,006h		;9230   ; 7 huecos
	jr L_9239		;9232
aprieta_objetos:		; quita los huecos de la lista de objetos 0xC530
	ld de,0c530h		;9234   ; apunta a los objetos que se llevan (fichas de 4)
	ld b,018h		;9237   ; 25 huecos
L_9239:
	ld a,(de)			;9239   ; busca un hueco vacio
	and a			;923a
	jr z,L_9245		;923b
	ld a,004h		;923d   ; la ficha siguiente
	call 041e5h		;923f   ; de_mas_a: DE = DE + A
	djnz L_9239		;9242
	ret			;9244
L_9245:
	push de			;9245   ; detras, la primera ficha llena...
	pop hl			;9246
	ld a,004h		;9247
	call 041e0h		;9249   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;924c
	and a			;924d
	jr nz,L_9253		;924e
	djnz L_9245		;9250
	ret			;9252
L_9253:
	push bc			;9253   ; ...sube al hueco vacio
	ld b,004h		;9254
L_9256:
	ld a,(hl)			;9256   ; los 4 bytes
	ld (de),a			;9257
	ld (hl),000h		;9258
	inc hl			;925a
	inc de			;925b
	djnz L_9256		;925c
	pop bc			;925e
	djnz L_9239		;925f   ; sigue apretando
	ret			;9261

; ----------------------------------------------------------------------
; DATOS rotulo_konami_1987: rotulo con posicion (L_510C): ":" en (0x50,0x60),
;   "KONAMI 1987" y "PUSH SPACE KEY" en (0x48,0x88), igual que el de p09:B58A;
;   ninguna instruccion de los 16 bancos nombra 0x9262 (grep en los listados).
;   SIN LECTOR A LA VISTA
;   0x9262..0x9282  (32 bytes)
DATA_rotulo_konami_1987:
	defb 050h,060h,03ah,04bh,04fh,04eh,041h,04dh,049h,000h,031h,039h,038h,037h,0feh,048h	; 9262  P`:KONAMI.1987.H
	defb 088h,050h,055h,053h,048h,000h,053h,050h,041h,043h,045h,000h,04bh,045h,059h,0ffh	; 9272  .PUSH.SPACE.KEY.

; ----------------------------------------------------------------------
; DATOS rotulo_play_start: [0x48][0x88] "  PLAY START" 0xFF, que p01:674A
;   escribe con L_510C
;   0x9282..0x9293  (17 bytes)
DATA_rotulo_play_start:
	defb 048h,088h,000h,000h,050h,04ch,041h,059h,000h,053h,054h,041h,052h,054h,000h,000h	; 9282  H...PLAY.START..
	defb 0ffh	; 9292

; ----------------------------------------------------------------------
; DATOS rotulo_game_over: "GAME OVER" (p01:680F) y, desde 0x92A0 tras el 0xFE,
;   "CONTINUE" (p01:67FA lo escribe desde ahi con L_5110)
;   0x9293..0x92af  (28 bytes)
DATA_rotulo_game_over:
	defb 058h,058h,047h,041h,04dh,045h,000h,000h,04fh,056h,045h,052h,0feh,050h,070h,043h	; 9293  XXGAME..OVER.PpC
	defb 04fh,04eh,054h,049h,04eh,055h,045h,000h,000h,046h,035h,0ffh	; 92a3  ONTINUE..F5.

; ----------------------------------------------------------------------
; DATOS rotulo_life: "LIFE" con posicion (p02:906A -> L_510C)
;   0x92af..0x92b6  (7 bytes)
DATA_rotulo_life:
	defb 010h,0c1h,04ch,049h,046h,045h,0ffh	; 92af

; ----------------------------------------------------------------------
; DATOS rotulo_class: "CLASS" con posicion (p02:90AD -> L_510C)
;   0x92b6..0x92be  (8 bytes)
DATA_rotulo_class:
	defb 008h,0c9h,043h,04ch,041h,053h,053h,0ffh	; 92b6  ..CLASS.

; ----------------------------------------------------------------------
; DATOS rotulo_telescope: el rotulo del prismatico con posicion (p01:71BB ->
;   L_510C)
;   0x92be..0x92cf  (17 bytes)
DATA_rotulo_telescope:
	defb 020h,0c4h,054h,045h,04ch,045h,053h,043h,04fh,050h,045h,000h,04dh,04fh,044h,045h	; 92be   .TELESCOPE.MODE
	defb 0ffh	; 92ce

; ----------------------------------------------------------------------
; DATOS rotulo_call: "CALL" con posicion (p02:8FF8 -> L_5112)
;   0x92cf..0x92db  (12 bytes)
DATA_rotulo_call:
	defb 078h,0c1h,09ch,09dh,09eh,0feh,078h,0c9h,09fh,0a0h,0a1h,0ffh	; 92cf  x.....x.....

; ======================================================================
; CODIGO 0x92db..0x9474  (409 bytes)
; ======================================================================


nueva_sala:		; la sala nueva: por la puerta 0xC4FC, por el lado (sala_vecina) o el ascensor
	ld a,(0c130h)		;92db   ; lee la sala
	cp 0cch		;92de   ; en la sala 0xCC (la caida)...
	jp z,cae_en_cc		;92e0   ; cae_en_cc: baja 0xC15B y al acabar sale a la sala 5, 6 o 0x0A
	ld a,(0c4fch)		;92e3   ; por una puerta (0xC4FC)
	and a			;92e6
	jp nz,por_la_puerta		;92e7   ; por_la_puerta: la sala de destino de la puerta 0xC4FC (byte 0x0F); trampillas 0x91, 0x5B y 0x81
	ld a,(0c133h)		;92ea   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;92ed   ; sin lado, nada
	ret z			;92ee
	call 042e6h		;92ef   ; sala_vecina: A = la sala vecina por el lado 0xC133 (tabla p05:8E0E); 0xFF si la sala no tiene vecinas
	cp 0f0h		;92f2   ; la vecina es un ascensor
	jp nc,al_ascensor		;92f4   ; al_ascensor: entra en el ascensor: 0xC136 = la sala de antes, Y de entrada y modo 6
	ld hl,0c130h		;92f7   ; apunta a la sala
	ld c,(hl)			;92fa   ; C = la sala de antes
	ld (0c130h),a		;92fb   ; guarda la sala
	ld a,c			;92fe   ; desde la sala 0x67...
	cp 067h		;92ff
	jr nz,L_9317		;9301
	ld a,(0c135h)		;9303   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 00bh		;9306   ; ...sin COMPAS (objeto 0x0B)...
	jr z,L_9317		;9308
	ld a,(0c185h)		;930a   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp 002h		;930d   ; ...y sin ir hacia abajo...
	jr z,L_9317		;930f
	ld a,067h		;9311   ; ...se vuelve a la 0x67
	ld (0c130h),a		;9313   ; guarda la sala
	ld c,a			;9316
L_9317:
	ld a,c			;9317   ; 0xC136 = la sala de antes
	ld (0c136h),a		;9318   ; guarda la parada del ascensor
L_931B:
	xor a			;931b   ; el modo 0
	ld (0c151h),a		;931c   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ret			;931f
al_ascensor:		; entra en el ascensor: 0xC136 = la sala de antes, Y de entrada y modo 6
	call 042e6h		;9320   ; sala_vecina: A = la sala vecina por el lado 0xC133 (tabla p05:8E0E); 0xFF si la sala no tiene vecinas
	ld hl,0c130h		;9323   ; apunta a la sala
	ld c,(hl)			;9326   ; C = la sala de antes
	ld (0c130h),a		;9327   ; guarda la sala
	ld a,c			;932a
	ld (0c136h),a		;932b   ; guarda la parada del ascensor
	call 0432dh		;932e   ; datos_del_ascensor: 0xC197 y 0xC198 = los dos primeros bytes del ascensor (sala - 0xF0) en p05:8DA8
	ld a,(0c133h)		;9331   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;9334   ; entrando por arriba: la cabina en 0xD0...
	ld a,0d0h		;9335
	jr z,L_933B		;9337
	ld a,018h		;9339   ; ...por abajo, en 0x18
L_933B:
	ld (0c193h),a		;933b
	ld l,000h		;933e   ; Snake 4 puntos por encima de la cabina
	sub 004h		;9340
	ld h,a			;9342
	ld (0c181h),hl		;9343   ; guarda la Y de Snake (16 bits)
	call sprites_del_ascensor		;9346   ; sprites_del_ascensor: los sprites del ascensor (0x95B7) en 0xEA00 y colores 15
	xor a			;9349   ; el paso 0 del ascensor
	ld (0c196h),a		;934a
	ld a,006h		;934d   ; el modo 6
	ld (0c151h),a		;934f   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ret			;9352
por_la_puerta:		; la sala de destino de la puerta 0xC4FC (byte 0x0F); trampillas 0x91, 0x5B y 0x81
	ld a,(0c4fch)		;9353   ; la puerta
	cp 091h		;9356   ; 0x91: la sala 0x75 (la trampilla de la sala 0x75)
	ld c,075h		;9358
	jp z,cae_por_la_trampilla		;935a   ; cae_por_la_trampilla: con PARAC (objeto 0x0C) a la sala 0xCC; si no, dano 0xFF
	cp 05bh		;935d   ; 0x5B: la 0x2D
	ld c,02dh		;935f
	jp z,cae_por_la_trampilla		;9361   ; cae_por_la_trampilla: con PARAC (objeto 0x0C) a la sala 0xCC; si no, dano 0xFF
	cp 081h		;9364   ; 0x81: la 0x2E
	ld c,02eh		;9366
	jp z,cae_por_la_trampilla		;9368   ; cae_por_la_trampilla: con PARAC (objeto 0x0C) a la sala 0xCC; si no, dano 0xFF
	ld hl,0c3d0h		;936b   ; apunta a las puertas de la sala
	ld de,00010h		;936e   ; busca la puerta en las de la sala
L_9371:
	cp (hl)			;9371
	jr z,L_9377		;9372
	add hl,de			;9374
	jr L_9371		;9375
L_9377:
	ld a,00fh		;9377   ; +0x0F: la sala de destino
	call 041e0h		;9379   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;937c
	ld c,a			;937d
	ld a,(0c130h)		;937e   ; lee la sala
	ld (0c136h),a		;9381   ; guarda la parada del ascensor
	ld a,c			;9384   ; la sala nueva
	ld (0c130h),a		;9385   ; guarda la sala
	cp 0f0h		;9388   ; un ascensor...
	jr c,L_938E		;938a
	jr L_93A2		;938c
L_938E:
	ld a,(0c130h)		;938e   ; lee la sala
	and 0f0h		;9391   ; las salas 0xE0-0xEF...
	cp 0e0h		;9393
	jp z,L_9418		;9395
	ld a,(0c136h)		;9398   ; lee la parada del ascensor
	cp 0f0h		;939b   ; (de un ascensor o no, lo mismo)
	jr nc,L_93BC		;939d
	jp L_93BC		;939f
L_93A2:
	call 04315h		;93a2   ; parada_del_ascensor: BC = los dos bytes que siguen a la parada 0xC136 en la lista del ascensor
	ld e,000h		;93a5   ; la Y de la parada (C)...
	ld d,c			;93a7
	ld (0c181h),de		;93a8   ; guarda la Y de Snake (16 bits)
	ld d,0d8h		;93ac   ; ...X = 0xD8
	ld (0c183h),de		;93ae   ; guarda la X de Snake (16 bits)
	ld e,b			;93b2   ; 0xC193 = la parada, 0xC194 = 0x70
	ld d,070h		;93b3
	ld (0c193h),de		;93b5
	call sprites_del_ascensor		;93b9   ; sprites_del_ascensor: los sprites del ascensor (0x95B7) en 0xEA00 y colores 15
L_93BC:
	jp L_931B		;93bc
cae_por_la_trampilla:		; con PARAC (objeto 0x0C) a la sala 0xCC; si no, dano 0xFF
	ld a,(0c135h)		;93bf   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 00ch		;93c2   ; con PARAC (objeto 0x0C)...
	jr nz,L_93DA		;93c4
	ld a,0cch		;93c6   ; ...a la sala 0xCC
	ld (0c130h),a		;93c8   ; guarda la sala
	ld a,c			;93cb   ; 0xC136 = la sala de la trampilla
	ld (0c136h),a		;93cc   ; guarda la parada del ascensor
	ld a,002h		;93cf   ; 2 cuadros de caida
	ld (0c15bh),a		;93d1
	call 058c9h		;93d4   ; quita_c602: la bandera 0xC602 y 0xC603-0xC607 a cero y, si se juega, la musica de la sala
	jp L_931B		;93d7
L_93DA:
	call sale_de_cc		;93da   ; sale_de_cc: la sala 5, 6 o 0x0A segun 0xC162
	xor a			;93dd   ; sin parada
	ld (0c136h),a		;93de   ; guarda la parada del ascensor
	ld a,0ffh		;93e1   ; 0xC4FC = 0xFF: cayo sin paracaidas
	ld (0c4fch),a		;93e3
	ld b,0ffh		;93e6   ; dano 0xFF: muere
	jp dano_a_snake		;93e8   ; dano_a_snake: resta B a la vida 0xC131; al llegar a cero, Snake muere (estado 3, modo 9, sonido 0x44)
cae_en_cc:		; baja 0xC15B y al acabar sale a la sala 5, 6 o 0x0A
	ld hl,0c15bh		;93eb
	dec (hl)			;93ee   ; al acabar la caida, sale
	jr z,sale_de_cc		;93ef
	ld a,0cch		;93f1   ; sigue en la 0xCC
	ld (0c130h),a		;93f3   ; guarda la sala
	ld (0c136h),a		;93f6   ; guarda la parada del ascensor
	jp L_931B		;93f9
sale_de_cc:		; la sala 5, 6 o 0x0A segun 0xC162
	ld a,(0c162h)		;93fc
	dec a			;93ff   ; por la trampilla 1 (0x2D): a la sala 5
	ld c,005h		;9400
	jr z,L_940B		;9402
	dec a			;9404   ; por la 2 (0x2E): a la 6
	ld c,006h		;9405
	jr z,L_940B		;9407
	ld c,00ah		;9409   ; por la 0x75: a la 0x0A
L_940B:
	ld a,c			;940b
	ld (0c130h),a		;940c   ; guarda la sala
	ld a,0cch		;940f   ; la parada 0xCC
	ld (0c136h),a		;9411   ; guarda la parada del ascensor
	xor a			;9414   ; 0xC162 a cero
	ld (0c162h),a		;9415
L_9418:
	jp L_931B		;9418
entra_snake:		; pone a Snake en la sala nueva segun por donde entro
	ld a,(0c4fch)		;941b
	cp 0ffh		;941e   ; cayo sin paracaidas
	jp z,L_9546		;9420
	cp 091h		;9423   ; por las trampillas
	jp z,L_9506		;9425
	cp 05bh		;9428
	jp z,L_9506		;942a
	cp 081h		;942d
	jp z,L_9506		;942f
	cp 06bh		;9432   ; por la puerta 0x6B
	jp z,L_9578		;9434
	and a			;9437   ; por un lado o un ascensor
	jr nz,L_944A		;9438
	ld a,(0c136h)		;943a   ; lee la parada del ascensor
	cp 0cch		;943d   ; desde la caida
	jp z,L_951A		;943f
	ld a,(0c130h)		;9442   ; lee la sala
	cp 0f0h		;9445   ; en los ascensores, nada
	ret nc			;9447
	jr entra_por_el_lado		;9448
L_944A:
	ld a,(0c130h)		;944a   ; lee la sala
	cp 0f0h		;944d   ; a un ascensor
	jr nc,$+45		;944f
	ld a,(0c136h)		;9451   ; lee la parada del ascensor
	cp 0f0h		;9454   ; desde un ascensor
	jr nc,$+55		;9456
	jp L_9493		;9458
entra_por_el_lado:		; la Y o la X de entrada por el lado 0xC133 (0x9474)
	ld de,09474h		;945b   ; 0x9474: por el lado, la Y o la X de entrada
	ld a,(0c133h)		;945e   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;9461   ; el lado contrario...
	ld c,a			;9462
	call 042b4h		;9463   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;9466   ; HL = la coordenada
	ld a,c			;9467
	cp 002h		;9468   ; arriba y abajo: la Y
	jr nc,L_9470		;946a
	ld (0c181h),hl		;946c   ; guarda la Y de Snake (16 bits)
	ret			;946f   ; izquierda y derecha: la X
L_9470:
	ld (0c183h),hl		;9470   ; guarda la X de Snake (16 bits)
	ret			;9473

; ----------------------------------------------------------------------
; DATOS palabras_9474: 4 palabras, una por lado de salida (0xC133 = 1-4):
;   p02:945B lee 0x9474 + 2 x (lado - 1) y las deja en 0xC183
;   0x9474..0x947c  (8 bytes)
DATA_palabras_9474:
	defw 0b800h,01200h,0f200h,00c00h	; 9474

; ======================================================================
; CODIGO 0x947c..0x94cd  (81 bytes)
; ======================================================================


estado_2_derecha:		; estado 2 mirando a la izquierda
	ld a,002h		;947c   ; estado 2
	ld (0c180h),a		;947e   ; guarda el estado de Snake
	inc a			;9481   ; mirando a la izquierda (3)
	ld (0c185h),a		;9482   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
teclas_a_cero:		; 0xC191 y 0xC192 a cero
	xor a			;9485
	ld (0c191h),a		;9486
	ld (0c192h),a		;9489
	ret			;948c
entra_por_la_puerta:		; delante de la puerta 0xC4FC por su tipo (0x94CD): Y, X y direccion
	call teclas_a_cero		;948d   ; teclas_a_cero: 0xC191 y 0xC192 a cero
	ld (0c180h),a		;9490   ; guarda el estado de Snake
L_9493:
	ld a,(0c4fch)		;9493
	ld hl,0c3d0h		;9496   ; apunta a las puertas de la sala
	ld de,00010h		;9499   ; busca la puerta
L_949C:
	cp (hl)			;949c
	jr z,L_94A2		;949d
	add hl,de			;949f
	jr L_949C		;94a0
L_94A2:
	inc hl			;94a2   ; +3: el tipo
	inc hl			;94a3
	inc hl			;94a4
	ld a,(hl)			;94a5
	inc hl			;94a6   ; +5: la Y
	inc hl			;94a7
	ex de,hl			;94a8
	ld hl,094cdh		;94a9   ; 0x94CD: 3 bytes por tipo: [dy][dx][direccion]
	dec a			;94ac
	ld c,a			;94ad
	add a,a			;94ae
	add a,c			;94af
	call 041e0h		;94b0   ; hl_mas_a: HL = HL + A
	ld a,(de)			;94b3   ; la Y de entrada
	add a,(hl)			;94b4
	ld b,a			;94b5
	ld c,000h		;94b6
	inc de			;94b8
	inc hl			;94b9
	ld a,(de)			;94ba   ; la X
	add a,(hl)			;94bb
	ld d,a			;94bc
	ld e,000h		;94bd
	inc hl			;94bf
	ld a,(hl)			;94c0   ; la direccion
	ld (0c181h),bc		;94c1   ; guarda la Y de Snake (16 bits)
	ld (0c183h),de		;94c5   ; guarda la X de Snake (16 bits)
	ld (0c185h),a		;94c9   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;94cc

; ----------------------------------------------------------------------
; DATOS fichas_94cd: 19 ternas [x][y][direccion] que p02:94A9 elige con 3 x (A
;   - 1) (0x94CD + 2A + A): la posicion de Snake al entrar por una puerta
;   0x94cd..0x9506  (57 bytes)
DATA_fichas_94cd:
	defb 028h,00ch,002h	; 94cd
	defb 0f8h,010h,001h	; 94d0
	defb 030h,010h,004h	; 94d3
	defb 030h,0f6h,003h	; 94d6
	defb 028h,00ch,002h	; 94d9
	defb 000h,000h,000h	; 94dc
	defb 028h,010h,002h	; 94df
	defb 0f8h,010h,001h	; 94e2
	defb 030h,018h,004h	; 94e5
	defb 030h,010h,004h	; 94e8
	defb 030h,0f6h,003h	; 94eb
	defb 028h,010h,002h	; 94ee
	defb 0f8h,010h,001h	; 94f1
	defb 030h,018h,004h	; 94f4
	defb 030h,0f8h,003h	; 94f7
	defb 030h,0f6h,003h	; 94fa
	defb 030h,0f6h,003h	; 94fd
	defb 030h,0f6h,003h	; 9500
	defb 030h,010h,002h	; 9503

; ======================================================================
; CODIGO 0x9506..0x95b7  (177 bytes)
; ======================================================================


L_9506:
	ld a,003h		;9506   ; el modo de pose 3...
	ld (0c18bh),a		;9508   ; guarda el modo de la pose de Snake
	inc a			;950b   ; ...y el estado 4 (cayendo)
	ld (0c180h),a		;950c   ; guarda el estado de Snake
	call teclas_a_cero		;950f   ; teclas_a_cero: 0xC191 y 0xC192 a cero
	ld hl,08000h		;9512   ; X = 0x80
	ld (0c183h),hl		;9515   ; guarda la X de Snake (16 bits)
	jr L_9529		;9518
L_951A:
	ld a,(0c130h)		;951a   ; lee la sala
	cp 00ah		;951d   ; desde la caida a las salas 0x0A, 5 o 6...
	jr z,L_9530		;951f
	cp 005h		;9521
	jr z,L_9530		;9523
	cp 006h		;9525
	jr z,L_9530		;9527
L_9529:
	ld hl,03000h		;9529   ; si no, Y = 0x30
	ld (0c181h),hl		;952c   ; guarda la Y de Snake (16 bits)
	ret			;952f
L_9530:
	call teclas_a_cero		;9530   ; teclas_a_cero: 0xC191 y 0xC192 a cero
	ld (0c180h),a		;9533   ; guarda el estado de Snake
	ld (0c18bh),a		;9536   ; guarda el modo de la pose de Snake
	ld (0c18fh),a		;9539
	ld (0c18ah),a		;953c   ; guarda la pose de Snake
	ld (0c18dh),a		;953f
	inc a			;9542
	ld (0c185h),a		;9543   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
L_9546:
	ld l,000h		;9546   ; la sala 0x0A: (0x80, 0xA0)
	ld a,(0c130h)		;9548   ; lee la sala
	cp 00ah		;954b
	jr z,L_9557		;954d
	cp 005h		;954f
	jr z,L_9562		;9551
	cp 006h		;9553
	jr z,L_956D		;9555
L_9557:
	ld h,080h		;9557
	ld (0c181h),hl		;9559   ; guarda la Y de Snake (16 bits)
	ld h,0a0h		;955c
	ld (0c183h),hl		;955e   ; guarda la X de Snake (16 bits)
	ret			;9561
L_9562:
	ld h,038h		;9562   ; la 5: (0x38, 0x68)
	ld (0c181h),hl		;9564   ; guarda la Y de Snake (16 bits)
	ld h,068h		;9567
	ld (0c183h),hl		;9569   ; guarda la X de Snake (16 bits)
	ret			;956c
L_956D:
	ld h,0a8h		;956d   ; la 6: (0xA8, 0x80)
	ld (0c181h),hl		;956f   ; guarda la Y de Snake (16 bits)
	ld h,080h		;9572
	ld (0c183h),hl		;9574   ; guarda la X de Snake (16 bits)
	ret			;9577
L_9578:
	ld a,(0c130h)		;9578   ; lee la sala
	cp 077h		;957b   ; en la sala 0x77, delante de la puerta
	jp z,entra_por_la_puerta		;957d   ; entra_por_la_puerta: delante de la puerta 0xC4FC por su tipo (0x94CD): Y, X y direccion
	ld a,006h		;9580   ; en las demas: estado 6...
	ld (0c180h),a		;9582   ; guarda el estado de Snake
	rrca			;9585   ; ...mirando a la izquierda (3)...
	ld (0c185h),a		;9586   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	call teclas_a_cero		;9589   ; teclas_a_cero: 0xC191 y 0xC192 a cero
	ld hl,09e00h		;958c   ; ...en (0x9E, 0xD8)
	ld (0c181h),hl		;958f   ; guarda la Y de Snake (16 bits)
	ld h,0d8h		;9592
	ld (0c183h),hl		;9594   ; guarda la X de Snake (16 bits)
	ret			;9597
sprites_del_ascensor:		; los sprites del ascensor (0x95B7) en 0xEA00 y colores 15
	ld de,0ea00h		;9598   ; apunta a la copia de los atributos de los sprites
	ld hl,095b7h		;959b   ; 8 sprites de 8 bytes de 0x95B7 (los dos primeros, una y otra vez)
	ld b,008h		;959e
L_95A0:
	push hl			;95a0
	ld c,008h		;95a1
L_95A3:
	ld a,(hl)			;95a3   ; a 0xEA00
	ld (de),a			;95a4
	inc hl			;95a5
	inc de			;95a6
	dec c			;95a7
	jr nz,L_95A3		;95a8
	pop hl			;95aa
	djnz L_95A0		;95ab
	ld de,0e800h		;95ad   ; los colores...
	ld a,00fh		;95b0   ; ...15
L_95B2:
	ld (de),a			;95b2
	inc de			;95b3
	djnz L_95B2		;95b4
	ret			;95b6

; ----------------------------------------------------------------------
; DATOS sprites_95b7: 2 fichas de 4 bytes [y][x][patron][color] que p02:959B
;   copia 8 veces a 0xEA00 (B = 8, C = 8)
;   0x95b7..0x95bf  (8 bytes)
DATA_sprites_95b7:
	defb 0c0h,0ffh,000h,0e0h	; 95b7
	defb 0d0h,0ffh,000h,0e0h	; 95bb

; ======================================================================
; CODIGO 0x95bf..0x95c5  (6 bytes)
; ======================================================================


cuadro_tipo_41:		; lo de cada cuadro del tipo 41
	ld a,(ix+001h)		;95bf   ; lee el paso del actor
	call 041eah		;95c2   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_95C5: 5 destinos del despachador p00:41EA (call en p02:95C2, el
;   indice en A): 95CF, 95E7, 9604, 962C, 964A; lo leen p02:95C2 (10 bytes)
;   0x95c5..0x95cf  (10 bytes)
DATA_tabla_95C5:
	defw 095cfh,095e7h,09604h,0962ch,0964ah	; 95c5

; ======================================================================
; CODIGO 0x95cf..0x9775  (422 bytes)
; ======================================================================


L_95CF:
	dec (ix+013h)		;95cf   ; paso 0: espera (ix+0x13)
	ret nz			;95d2
	ld hl,0c169h		;95d3   ; la primera vez...
	ld a,(hl)			;95d6
	or a			;95d7
	jr nz,L_95E1		;95d8
	ld (hl),001h		;95da
	ld a,08bh		;95dc   ; ...el texto 0x8B
	call 05cd9h		;95de   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
L_95E1:
	ld (ix+013h),010h		;95e1   ; 0x10 cuadros
	jr paso_siguiente_9600		;95e5
L_95E7:
	dec (ix+013h)		;95e7   ; paso 1: espera
	ret nz			;95ea
	ld (ix+013h),008h		;95eb
	ld a,(0c184h)		;95ef   ; lee la X de Snake
	cp (ix+005h)		;95f2   ; compara con la X del actor
	ld de,00200h		;95f5   ; hacia Snake a 2 puntos por cuadro
	jr nc,L_95FD		;95f8
	ld de,0fe00h		;95fa
L_95FD:
	call 05b5dh		;95fd   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
paso_siguiente_9600:		; sube el paso del actor (ix+1)
	inc (ix+001h)		;9600   ; sube el paso del actor
	ret			;9603
L_9604:
	ld b,007h		;9604   ; paso 2: anda
	call 05b6ah		;9606   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	dec (ix+013h)		;9609
	ret nz			;960c
	ld (ix+013h),005h		;960d   ; 5 cuadros
	ld (ix+00bh),01ah		;9611   ; el cuadro del actor = 0x1A
	ld de,00000h		;9615   ; se para
	call 05b5dh		;9618   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
	call paso_siguiente_9600		;961b   ; paso_siguiente_9600: sube el paso del actor (ix+1)
	ld a,(ix+003h)		;961e   ; lee la Y del actor
	sub 010h		;9621   ; crea el tipo 0x3F 0x10 por encima
	ld e,a			;9623
	ld d,(ix+005h)		;9624   ; lee la X del actor
	ld c,03fh		;9627
	jp 0569ah		;9629   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
L_962C:
	dec (ix+013h)		;962c   ; paso 3: espera
	ret nz			;962f
	ld (ix+013h),008h		;9630
	ld (ix+00bh),018h		;9634   ; el cuadro del actor = 0x18
	ld a,(ix+005h)		;9638   ; lee la X del actor
	cp 080h		;963b   ; hacia el centro a 2 puntos
	ld de,0fe00h		;963d
	jr nc,L_9645		;9640
	ld de,00200h		;9642
L_9645:
	call 05b5dh		;9645   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
	jr paso_siguiente_9600		;9648
L_964A:
	ld b,007h		;964a   ; paso 4: anda...
	call 05b6ah		;964c   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	dec (ix+013h)		;964f
	ret nz			;9652
	ld (ix+013h),008h		;9653
	ld de,00000h		;9657   ; ...y se para, al paso 1
	call 05b5dh		;965a   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
	ld (ix+001h),001h		;965d   ; el paso del actor = 0x01
	ret			;9661
crea_tipo_63:		; la creacion del tipo 63
	ld a,006h		;9662   ; el sonido 6
	call 0427ch		;9664   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld a,(ix+003h)		;9667   ; lee la Y del actor
	ld (ix+015h),a		;966a   ; el centro de la vuelta: su Y...
	ld a,(ix+005h)		;966d   ; lee la X del actor
	ld (ix+016h),a		;9670   ; ...y su X
	cp 080h		;9673   ; a la derecha de la sala, sentido 0; a la izquierda, 2
	ld a,000h		;9675
	jr nc,L_967B		;9677
	ld a,002h		;9679
L_967B:
	ld (ix+01bh),a		;967b
	ld a,r		;967e   ; el radio, al azar
	and 001h		;9680
	ld (ix+01ch),a		;9682
	ld (ix+00bh),077h		;9685   ; el cuadro del actor = 0x77
	ld (ix+017h),040h		;9689   ; el angulo Y empieza en 0x40...
	ld (ix+019h),0feh		;968d   ; ...bajando 2 por cuadro
	ld (ix+018h),040h		;9691   ; el angulo X en 0x40...
	ld (ix+01ah),0fch		;9695   ; ...bajando 4
	ret			;9699
cuadro_tipo_63:		; lo de cada cuadro del tipo 63
	ld a,(ix+00ch)		;969a   ; lee la cuenta de cuadros del actor
	and 001h		;969d   ; cada 2 cuadros...
	jr nz,L_96B4		;969f
	inc (ix+014h)		;96a1   ; ...el cuadro siguiente (0x77-0x79)
	ld a,(ix+014h)		;96a4
	cp 003h		;96a7
	jr c,L_96AF		;96a9
	xor a			;96ab
	ld (ix+014h),a		;96ac
L_96AF:
	add a,077h		;96af
	ld (ix+00bh),a		;96b1   ; guarda el cuadro del actor
L_96B4:
	ld a,(ix+017h)		;96b4   ; el angulo Y avanza
	add a,(ix+019h)		;96b7
	ld (ix+017h),a		;96ba
	cp 040h		;96bd   ; al salir de 0-0x3F, rebota
	call nc,rebota_y		;96bf   ; rebota_y: cambia de signo (ix+0x19); si queda en 0xFE, quita al actor
	call 05be2h		;96c2   ; pareja_a: C y B = los bytes A y 63 - A (A de 0 a 63) de la tabla p06:A6B9
	srl b		;96c5   ; la mitad del seno...
	ld a,(ix+01ch)		;96c7   ; ...o la cuarta parte con el otro radio
	or a			;96ca
	jr z,L_96CF		;96cb
	srl b		;96cd
L_96CF:
	ld a,(ix+015h)		;96cf   ; la Y = el centro + el seno
	add a,b			;96d2
	ld (ix+003h),a		;96d3   ; guarda la Y del actor
	ld a,(ix+018h)		;96d6   ; el angulo X avanza
	add a,(ix+01ah)		;96d9
	ld (ix+018h),a		;96dc
	cp 040h		;96df   ; al salir de 0-0x3F, rebota
	call nc,rebota_x		;96e1   ; rebota_x: cambia de signo (ix+0x1A) y sube (ix+0x1B)
	call 05be2h		;96e4   ; pareja_a: C y B = los bytes A y 63 - A (A de 0 a 63) de la tabla p06:A6B9
	srl b		;96e7   ; la cuarta parte
	srl b		;96e9
	ld a,(ix+01bh)		;96eb   ; en los cuartos 2 y 3 hacia el otro lado
	cp 002h		;96ee
	jr c,L_96FB		;96f0
	cp 004h		;96f2
	jr nc,L_96FB		;96f4
	ld a,b			;96f6
	neg		;96f7
	jr L_96FC		;96f9
L_96FB:
	ld a,b			;96fb
L_96FC:
	add a,(ix+016h)		;96fc   ; la X = el centro +- el seno
	ld (ix+005h),a		;96ff   ; guarda la X del actor
	ret			;9702
rebota_y:		; cambia de signo (ix+0x19); si queda en 0xFE, quita al actor
	ld a,(ix+019h)		;9703   ; da la vuelta al angulo Y
	neg		;9706
	ld (ix+019h),a		;9708
	inc a			;970b   ; si vuelve a 0xFE (la vuelta entera), se quita
	inc a			;970c
	ret nz			;970d
L_970E:
	jp 07371h		;970e
rebota_x:		; cambia de signo (ix+0x1A) y sube (ix+0x1B)
	ld a,(ix+01ah)		;9711   ; da la vuelta al angulo X...
	neg		;9714
	ld (ix+01ah),a		;9716
	inc (ix+01bh)		;9719   ; ...y el cuarto siguiente
	ret			;971c
crea_tipo_41:		; la creacion del tipo 41
	ld a,(0c5b4h)		;971d   ; con 0xC5B4 no aparece
	or a			;9720
	jr nz,L_970E		;9721
	ld (ix+00bh),018h		;9723   ; el cuadro del actor = 0x18
	ld (ix+013h),003h		;9727   ; 3 cuadros
	inc (ix+006h)		;972b   ; sube si el actor se mueve (p01:7336)
	jp 0b9e6h		;972e   ; musica_3e: la musica 0x3E (salvo en el modo 8)
ve_a_snake:		; el actor mira hacia (ix+0x11) desde su sitio: si ve a Snake, alarma
	ld a,(ix+011h)		;9731   ; lee la direccion del actor
	ld h,(ix+005h)		;9734   ; lee la X del actor
	ld l,(ix+003h)		;9737   ; lee la Y del actor
ve_a_snake_desde:		; mira hacia A desde HL: Snake en linea y sin pared por medio (no en la caja quieta)
	ld (0ec00h),a		;973a   ; guarda la casilla de trabajo 0xEC00
	ld (0ec01h),hl		;973d
	ld a,(0c602h)		;9740   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;9743
	ret nz			;9744
	ld a,(0c18ah)		;9745   ; lee la pose de Snake
	ld b,025h		;9748
	cp b			;974a
	ret z			;974b
	inc b			;974c
	cp b			;974d
	ret z			;974e
	ld a,(0c18bh)		;974f   ; lee el modo de la pose de Snake
	cp 007h		;9752
	jr nz,L_9767		;9754
	ld hl,0c186h		;9756   ; apunta a la velocidad Y de Snake
	ld a,(hl)			;9759
	inc hl			;975a
	or (hl)			;975b
	jr nz,L_9767		;975c
	ld hl,0c188h		;975e   ; apunta a la velocidad X de Snake
	ld a,(hl)			;9761
	or (hl)			;9762
	inc hl			;9763
	or (hl)			;9764
	or a			;9765
	ret z			;9766
L_9767:
	ld a,(ix+01eh)		;9767   ; lee las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	bit 7,a		;976a
	jp nz,alarma_de_actor		;976c   ; alarma_de_actor: la alarma desde el actor: 0xC614 por la sala (0x98DE), 0xC60C y los refuerzos
	ld a,(0ec00h)		;976f   ; lee la casilla de trabajo 0xEC00
	call 041eah		;9772   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9775: 4 destinos del despachador p00:41EA (call en p02:9772, el
;   indice en A): 978F, 97A3, 97BA, 97CE; lo leen p02:9772 (8 bytes)
;   0x9775..0x977d  (8 bytes)
DATA_tabla_9775:
	defw 0978fh,097a3h,097bah,097ceh	; 9775  -> L_978F L_97A3 L_97BA L_97CE

; ======================================================================
; CODIGO 0x977d..0x98de  (353 bytes)
; ======================================================================


dy_a_snake:		; A = 0xEC01 - la Y de Snake
	ld a,(0c182h)		;977d   ; lee la Y de Snake
	ld b,a			;9780
	ld a,(0ec01h)		;9781
	sub b			;9784
	ret			;9785
dx_a_snake:		; A = 0xEC02 - la X de Snake
	ld a,(0c184h)		;9786   ; lee la X de Snake
	ld b,a			;9789
	ld a,(0ec02h)		;978a
	sub b			;978d
	ret			;978e
L_978F:
	call en_columna		;978f   ; en_columna: acarreo si Snake esta en la columna de 0xEC02
	ret nc			;9792
	call dy_a_snake		;9793   ; dy_a_snake: A = 0xEC01 - la Y de Snake
	ret c			;9796
	and 0f8h		;9797
	rra			;9799
	rra			;979a
	rra			;979b
	jr nz,L_979F		;979c
	inc a			;979e
L_979F:
	ld c,0e0h		;979f
	jr L_97E2		;97a1
L_97A3:
	call en_columna		;97a3   ; en_columna: acarreo si Snake esta en la columna de 0xEC02
	ret nc			;97a6
	call dy_a_snake		;97a7   ; dy_a_snake: A = 0xEC01 - la Y de Snake
	ret nc			;97aa
	neg		;97ab
	and 0f8h		;97ad
	rra			;97af
	rra			;97b0
	rra			;97b1
	jr nz,L_97B5		;97b2
	inc a			;97b4
L_97B5:
	ld b,a			;97b5
	ld c,020h		;97b6
	jr L_97E2		;97b8
L_97BA:
	call en_fila		;97ba   ; en_fila: acarreo si Snake esta en la fila de 0xEC01
	ret nc			;97bd
	call dx_a_snake		;97be   ; dx_a_snake: A = 0xEC02 - la X de Snake
	ret c			;97c1
	and 0f8h		;97c2
	rra			;97c4
	rra			;97c5
	rra			;97c6
	jr nz,L_97CA		;97c7
	inc a			;97c9
L_97CA:
	ld c,0ffh		;97ca
	jr L_97E2		;97cc
L_97CE:
	call en_fila		;97ce   ; en_fila: acarreo si Snake esta en la fila de 0xEC01
	ret nc			;97d1
	call dx_a_snake		;97d2   ; dx_a_snake: A = 0xEC02 - la X de Snake
	ret nc			;97d5
	neg		;97d6
	and 0f8h		;97d8
	rra			;97da
	rra			;97db
	rra			;97dc
	jr nz,L_97E0		;97dd
	inc a			;97df
L_97E0:
	ld c,001h		;97e0
L_97E2:
	ld b,a			;97e2   ; B = cuantas fichas hasta Snake
	ld hl,(0ec01h)		;97e3   ; desde la ficha del actor
	call 05c09h		;97e6   ; ficha_en_el_punto: HL = 0xE000 + (L / 8) x 32 + H / 8: la ficha de la sala montada en ese punto
L_97E9:
	ld (0ec03h),hl		;97e9   ; la ficha que se mira
	ld a,(0c157h)		;97ec   ; lee el juego de fichas cargado
	or a			;97ef   ; con el juego de fichas 0, unas fichas no tapan:
	ld a,(hl)			;97f0
	jr nz,L_981E		;97f1
	ld e,068h		;97f3   ; la 0x68-0x6C...
	cp e			;97f5
	jr z,L_9828		;97f6
	inc e			;97f8
	cp e			;97f9
	jr z,L_9828		;97fa
	inc e			;97fc
	cp e			;97fd
	jr z,L_9828		;97fe
	inc e			;9800
	cp e			;9801
	jr z,L_9828		;9802
	inc e			;9804
	cp e			;9805
	jr z,L_9828		;9806
	inc e			;9808   ; ...la 0x6E...
	inc e			;9809
	cp e			;980a
	jr z,L_9828		;980b
	ld e,08bh		;980d   ; ...y la 0x8B-0x8E
	cp e			;980f
	jr z,L_9828		;9810
	inc e			;9812
	cp e			;9813
	jr z,L_9828		;9814
	inc e			;9816
	cp e			;9817
	jr z,L_9828		;9818
	inc e			;981a
	cp e			;981b
	jr z,L_9828		;981c
L_981E:
	ld e,a			;981e   ; las demas: su byte de choque
	ld d,000h		;981f
	ld hl,0c700h		;9821
	add hl,de			;9824
	ld a,(hl)			;9825
	or a			;9826   ; pared: no ve a Snake
	ret nz			;9827
L_9828:
	ld hl,(0ec03h)		;9828   ; la ficha siguiente hacia Snake
	ld e,c			;982b   ; C = el paso (+-1 o +-32)
	rl c		;982c
	ld c,e			;982e
	ld d,0ffh		;982f   ; D = 0xFF si es negativo
	jr c,L_9835		;9831
	ld d,000h		;9833
L_9835:
	add hl,de			;9835   ; + el paso
	djnz L_97E9		;9836   ; hasta Snake
	ld a,(ix+000h)		;9838   ; lee el tipo del actor
	cp 006h		;983b   ; la camara (tipo 6):
	jr nz,alarma_de_actor		;983d
	ld a,001h		;983f   ; (ix+0x41) = 1 y 0xC668 = 1
	ld (ix+041h),a		;9841
	ld (0c668h),a		;9844
	ld a,028h		;9847   ; refuerzos cada 0x28 cuadros
	ld (0c605h),a		;9849   ; guarda la cuenta de los refuerzos
alarma:		; pon_c602 y 0xC60F = la sala, 0xC669 = 0x10
	call 07d2ah		;984c   ; pon_c602: 0xC602 = 1, 0xC604 = la sala, 0xC606 y la musica 0x32 (0x2F si la pone un actor del tipo 6 o 0x23)
L_984F:
	ld a,(0c130h)		;984f   ; lee la sala
	ld (0c60fh),a		;9852   ; la sala de la alarma
	ld a,010h		;9855   ; 0x10 cuadros
	ld (0c669h),a		;9857
	ret			;985a
alarma_de_actor:		; la alarma desde el actor: 0xC614 por la sala (0x98DE), 0xC60C y los refuerzos
	ld a,(0c602h)		;985b   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;985e   ; con la alarma ya puesta, nada
	ret nz			;985f
	ld a,(0c130h)		;9860   ; lee la sala
	ld b,a			;9863   ; B = la sala
	cp 080h		;9864   ; las salas 0x80+: sin aviso
	ld a,000h		;9866
	jr nc,L_9883		;9868
	ld a,b			;986a   ; la sala / 8...
	srl a		;986b
	srl a		;986d
	srl a		;986f
	ld hl,098deh		;9871   ; ...un byte de 0x98DE
	call 041e0h		;9874   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;9877
	ld a,b			;9878   ; el bit de la sala (sala mod 8)
	and 007h		;9879
	inc a			;987b
	ld b,a			;987c
	xor a			;987d
L_987E:
	rl c		;987e   ; saca el bit
	djnz L_987E		;9880
	rla			;9882
L_9883:
	ld (0c614h),a		;9883   ; 0xC614 = el bit: la sala tiene aviso
	ld a,(0c184h)		;9886   ; lee la X de Snake
	ld b,a			;9889   ; B = la X de Snake
	ld a,(ix+005h)		;988a   ; lee la X del actor
	ld c,008h		;988d   ; el aviso a la izquierda o a la derecha del actor
	cp b			;988f
	jr c,L_9894		;9890
	ld c,0f8h		;9892
L_9894:
	add a,008h		;9894   ; X de 8 en 8...
	and 0f8h		;9896
	ld d,a			;9898
	ld a,(ix+003h)		;9899   ; lee la Y del actor
	sub 018h		;989c   ; ...Y - 0x18 de 8 en 8
	and 0f8h		;989e
	ld e,a			;98a0
	cp 0bfh		;98a1   ; por encima de 0xBF, a cero
	jr c,L_98A7		;98a3
	ld e,000h		;98a5
L_98A7:
	ld hl,0c60ch		;98a7   ; 0xC60C = donde va el aviso
	ld (hl),e			;98aa
	inc hl			;98ab
	ld (hl),d			;98ac
	ex de,hl			;98ad   ; p03:AC4D: guarda el fondo
	call 0ac4dh		;98ae   ; guarda_fondo_16: copia 16 x 16 de HL a (0x60, 0x80) de la pagina 1
	ld a,(0c614h)		;98b1   ; con aviso...
	or a			;98b4
	ld hl,00080h		;98b5   ; ...el dibujo de (0x80, 0) y sin refuerzos...
	ld b,000h		;98b8
	jr z,L_98C0		;98ba
	ld h,010h		;98bc   ; ...si no, el de (0x80, 0x10) y refuerzos cada 0x1E cuadros
	ld b,01eh		;98be
L_98C0:
	ld a,b			;98c0
	ld (0c605h),a		;98c1   ; guarda la cuenta de los refuerzos
	ld a,e			;98c4   ; por encima de 0xBF, a cero
	cp 0bfh		;98c5
	jr c,L_98CF		;98c7
	ld e,000h		;98c9
	ld a,e			;98cb
	ld (0c60ch),a		;98cc
L_98CF:
	call 0ac5bh		;98cf   ; pon_dibujo_16: copia 16 x 16 de HL a DE con TIMP
	call alarma		;98d2   ; alarma: pon_c602 y 0xC60F = la sala, 0xC669 = 0x10
	ld a,(ix+000h)		;98d5   ; lee el tipo del actor
	cp 006h		;98d8   ; la camara no se mueve
	ret z			;98da
	jp 058e9h		;98db   ; reaparece: crea en IX el actor de p06:A445 de la sala (salas < 0xBC)

; ----------------------------------------------------------------------
; DATOS tabla_98de: 16 bytes que p02:9871 lee en 0x98DE + (A / 4) y deja en C
;   0x98de..0x98ee  (16 bytes)
DATA_tabla_98de:
	defb 001h,01ch,003h,000h,0a3h,010h,058h,000h,004h,001h,09fh,000h,000h,008h,000h,001h	; 98de  ......X.........

; ======================================================================
; CODIGO 0x98ee..0x99fd  (271 bytes)
; ======================================================================


en_columna:		; acarreo si Snake esta en la columna de 0xEC02
	ld hl,00810h		;98ee   ; 8 a cada lado, 0x10 de ancho
	ld de,(0ec01h)		;98f1
	ld a,(0c184h)		;98f5   ; lee la X de Snake
	sub h			;98f8   ; la X de Snake - 8...
	cp d			;98f9   ; ...por debajo de la X del actor...
	ret nc			;98fa
	add a,l			;98fb   ; ...y + 0x10 por encima
	ld e,a			;98fc
	ld a,d			;98fd
	cp e			;98fe
	ret			;98ff
en_fila:		; acarreo si Snake esta en la fila de 0xEC01
	ld a,(ix+000h)		;9900   ; lee el tipo del actor
	cp 006h		;9903
	ld hl,00408h		;9905
	jr z,L_990D		;9908
	ld hl,0060ch		;990a   ; ...los demas: 6 y 0x0C
L_990D:
	ld de,(0ec01h)		;990d
	ld a,(0c182h)		;9911   ; lee la Y de Snake
	sub h			;9914
	cp e			;9915
	ret nc			;9916
	add a,l			;9917
	ld d,a			;9918
	ld a,e			;9919
	cp d			;991a
	ret			;991b
oye_disparo:		; acarreo si el actor esta marcado o hay un disparo sin SILENCER en marcha
	ld a,(ix+000h)		;991c   ; lee el tipo del actor
	cp 006h		;991f
	ret z			;9921
	ld a,(ix+01eh)		;9922   ; lee las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	bit 7,a		;9925
	jr nz,L_994C		;9927
	ld a,(0c134h)		;9929   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	sub 003h		;992c
	jr nc,L_9935		;992e
	ld a,(0c51ch)		;9930
	or a			;9933
	ret nz			;9934
L_9935:
	xor a			;9935
	ld hl,0c200h		;9936   ; apunta a los proyectiles (0x180 bytes)
	ld de,00040h		;9939
	ld b,006h		;993c
L_993E:
	cp (hl)			;993e
	jr nz,L_9946		;993f
L_9941:
	add hl,de			;9941
	djnz L_993E		;9942
	or a			;9944
	ret			;9945
L_9946:
	inc hl			;9946
	ld a,(hl)			;9947
	dec hl			;9948
	dec a			;9949
	jr nz,L_9941		;994a
L_994C:
	scf			;994c
	ret			;994d
cuadro_tipo_15:		; lo de cada cuadro del tipo 15
	ld b,003h		;994e
	call 05b6ah		;9950   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	call rueda_en_el_borde		;9953   ; rueda_en_el_borde: el tipo 15 al llegar a 0x38/0xC8 da la vuelta con el sonido 0x1D
	ld a,(ix+001h)		;9956   ; lee el paso del actor
	dec a			;9959
	jr nz,L_9991		;995a
	ld a,(ix+013h)		;995c
	cp 080h		;995f
	jr c,L_9971		;9961
	ld a,(ix+005h)		;9963   ; lee la X del actor
	cp 0c8h		;9966
	jp nc,05ba2h		;9968   ; paso_siguiente: sube el paso del actor (ix+1)
	cp 038h		;996b
	jp c,05ba2h		;996d   ; paso_siguiente: sube el paso del actor (ix+1)
	ret			;9970
L_9971:
	call 05b45h		;9971   ; sitio_de_snake: E = la Y de Snake, D = la X
	ld a,e			;9974
	cp 080h		;9975
	ret nc			;9977
	ld a,d			;9978
	cp (ix+005h)		;9979   ; compara con la X del actor
	ld de,00080h		;997c
	ld b,002h		;997f
	jr c,L_9988		;9981
	ld de,0ff80h		;9983
	ld b,003h		;9986
L_9988:
	ld (ix+011h),b		;9988   ; guarda la direccion del actor
	call 05b5dh		;998b   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
	jp 05ba2h		;998e   ; paso_siguiente: sube el paso del actor (ix+1)
L_9991:
	ld a,(ix+011h)		;9991   ; lee la direccion del actor
	rra			;9994
	ld de,0fff8h		;9995
	jr nc,L_999D		;9998
	ld de,00008h		;999a
L_999D:
	jp 05b55h		;999d   ; suma_velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) += DE
rueda_en_el_borde:		; el tipo 15 al llegar a 0x38/0xC8 da la vuelta con el sonido 0x1D
	ld a,(ix+005h)		;99a0   ; lee la X del actor
	ld h,0c8h		;99a3   ; la X maxima 0xC8...
	ld c,h			;99a5
	dec h			;99a6
	cp c			;99a7   ; al llegar, hacia la izquierda (2) a medio punto
	ld de,0ff80h		;99a8
	ld b,002h		;99ab
	jr nc,L_99BA		;99ad
	ld h,038h		;99af   ; la minima 0x38...
	ld c,h			;99b1
	inc h			;99b2
	cp c			;99b3
	ret nc			;99b4
	ld b,003h		;99b5   ; ...hacia la derecha (3)
	ld de,00080h		;99b7
L_99BA:
	ld (ix+005h),h		;99ba   ; guarda la X del actor
	ld (ix+011h),b		;99bd   ; guarda la direccion del actor
	call 05b5dh		;99c0   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
	ld a,01dh		;99c3   ; el sonido 0x1D
	jp 0427ch		;99c5   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
crea_tipo_15:		; la creacion del tipo 15
	ld a,(0c184h)		;99c8   ; lee la X de Snake
	ld (ix+013h),a		;99cb
	ld de,00080h		;99ce
	ld hl,00000h		;99d1
	ld a,(0c184h)		;99d4   ; lee la X de Snake
	cp 080h		;99d7
	jr c,L_99DE		;99d9
	ld de,0ff80h		;99db
L_99DE:
	call 05b64h		;99de   ; velocidades: la velocidad X del actor = DE y la Y = HL
	inc (ix+006h)		;99e1   ; sube si el actor se mueve (p01:7336)
	ld (ix+00bh),036h		;99e4   ; el cuadro del actor = 0x36
	ret			;99e8
crea_tipo_8:		; la creacion del tipo 8
	ld (ix+00eh),000h		;99e9   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld a,r		;99ed
	ld (ix+013h),a		;99ef
	ld (ix+00bh),038h		;99f2   ; el cuadro del actor = 0x38
	ret			;99f6
cuadro_tipo_8:		; lo de cada cuadro del tipo 8
	ld a,(ix+001h)		;99f7   ; lee el paso del actor
	call 041eah		;99fa   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_99FD: 2 destinos del despachador p00:41EA (call en p02:99FA, el
;   indice en A): 9A01, 9A13; lo leen p02:99FA (4 bytes)
;   0x99fd..0x9a01  (4 bytes)
DATA_tabla_99FD:
	defw 09a01h,09a13h	; 99fd  -> L_9A01 L_9A13

; ======================================================================
; CODIGO 0x9a01..0x9a49  (72 bytes)
; ======================================================================


L_9A01:
	dec (ix+013h)		;9a01
	ret nz			;9a04
	ld (ix+013h),020h		;9a05
	ld a,002h		;9a09
	ld c,04dh		;9a0b
	call 05bc3h		;9a0d
	jp 05ba2h		;9a10   ; paso_siguiente: sube el paso del actor (ix+1)
L_9A13:
	ld b,007h		;9a13
	call 05b6ah		;9a15   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	dec (ix+013h)		;9a18
	ret nz			;9a1b
	call 05bc1h		;9a1c   ; colores_a_cero: escribe A y C alternos cada 5 bytes desde (ix+0x25)
	call crea_tipo_8		;9a1f   ; crea_tipo_8: la creacion del tipo 8
	jp 05ba6h		;9a22   ; paso_cero: el paso del actor (ix+1) a cero
crea_tipo_46:		; la creacion del tipo 46
	call 058c9h		;9a25   ; quita_c602: la bandera 0xC602 y 0xC603-0xC607 a cero y, si se juega, la musica de la sala
	ld a,(0c136h)		;9a28   ; lee la parada del ascensor
	cp 049h		;9a2b
	jp z,0740ch		;9a2d   ; borra_actor: el tipo y (ix+0x0E) a cero y sus sprites escondidos
	ld (ix+014h),010h		;9a30
	ld (ix+00eh),000h		;9a34   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ret			;9a38
cuadro_tipo_46:		; lo de cada cuadro del tipo 46
	ld a,(0c602h)		;9a39   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;9a3c
	jp nz,0740ch		;9a3d   ; borra_actor: el tipo y (ix+0x0E) a cero y sus sprites escondidos
	call texto_23_una_vez		;9a40   ; texto_23_una_vez: tras (ix+0x14) cuadros, el texto 0x23 una vez (0xC63A)
	ld a,(ix+001h)		;9a43   ; lee el paso del actor
	call 041eah		;9a46   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9A49: 2 destinos del despachador p00:41EA (call en p02:9A46, el
;   indice en A): 9A4D, 9A5E; lo leen p02:9A46 (4 bytes)
;   0x9a49..0x9a4d  (4 bytes)
DATA_tabla_9A49:
	defw 09a4dh,09a5eh	; 9a49  -> L_9A4D L_9A5E

; ======================================================================
; CODIGO 0x9a4d..0x9b35  (232 bytes)
; ======================================================================


L_9A4D:
	call 05b45h		;9a4d   ; sitio_de_snake: E = la Y de Snake, D = la X
	ld a,e			;9a50
	cp 080h		;9a51
	ret nc			;9a53
	ld a,d			;9a54
	cp 038h		;9a55
	ret c			;9a57
	cp 0b8h		;9a58
	ret nc			;9a5a
	inc (ix+001h)		;9a5b   ; sube el paso del actor
L_9A5E:
	ld a,(0c135h)		;9a5e   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 018h		;9a61
	jr z,L_9A88		;9a63
	ld a,01eh		;9a65
	call 07d27h		;9a67   ; pon_c602_con_cuenta: 0xC605 = A y pon_c602
	jp 07371h		;9a6a
texto_23_una_vez:		; tras (ix+0x14) cuadros, el texto 0x23 una vez (0xC63A)
	ld a,(0c602h)		;9a6d   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;9a70
	ret nz			;9a71
	ld a,(ix+014h)		;9a72
	or a			;9a75
	ret z			;9a76
	dec (ix+014h)		;9a77
	ret nz			;9a7a
	ld hl,0c63ah		;9a7b
	ld a,(hl)			;9a7e
	or a			;9a7f
	ret nz			;9a80
	ld (hl),001h		;9a81
	ld a,023h		;9a83
	jp 05cd9h		;9a85   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
L_9A88:
	ld a,(ix+016h)		;9a88   ; la primera vez...
	or a			;9a8b
	jr nz,L_9A96		;9a8c
	inc (ix+016h)		;9a8e
	ld a,07fh		;9a91   ; ...el texto 0x7F
	jp 05cd9h		;9a93   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
L_9A96:
	cp 002h		;9a96   ; la segunda...
	ret nc			;9a98
	ld a,001h		;9a99   ; ...0xC62C y 0xC62D = 1 (la puerta de clase 12)
	ld (0c62ch),a		;9a9b
	ld (0c62dh),a		;9a9e   ; (una sola vez)
	inc (ix+016h)		;9aa1
	ret			;9aa4
crea_tipo_48:		; la creacion del tipo 48
	ld a,(0c130h)		;9aa5   ; lee la sala
	ld c,a			;9aa8   ; C = la sala
	ld b,001h		;9aa9   ; en la sala 0x8C, 0xC633 = 1 (se duermen)
	cp 08ch		;9aab
	jr z,L_9AB0		;9aad
	dec b			;9aaf
L_9AB0:
	ld a,b			;9ab0
	ld (0c633h),a		;9ab1
	ld a,c			;9ab4   ; en la sala 0x27...
	cp 027h		;9ab5
	push af			;9ab7
	call z,0a190h		;9ab8   ; ...p03:A190: su arreglo
	pop af			;9abb
	cp 045h		;9abc   ; en la sala 0x45...
	jr nz,L_9ACE		;9abe
	ld b,001h		;9ac0   ; ...(ix+0x5E) = 1...
	ld a,(0c136h)		;9ac2   ; lee la parada del ascensor
	cp 049h		;9ac5   ; ...salvo viniendo de la 0x49
	jr nz,L_9ACB		;9ac7
	ld b,000h		;9ac9
L_9ACB:
	ld (ix+05eh),b		;9acb
L_9ACE:
	jp 05b01h		;9ace   ; camino_al_azar: elige un camino al azar de la sala (p06:A2DF) para IX
L_9AD1:
	call oye_disparo		;9ad1   ; oye_disparo: acarreo si el actor esta marcado o hay un disparo sin SILENCER en marcha
	jp c,alarma_de_actor		;9ad4   ; alarma_de_actor: la alarma desde el actor: 0xC614 por la sala (0x98DE), 0xC60C y los refuerzos
	jr L_9AF0		;9ad7
cuadro_tipo_48:		; lo de cada cuadro del tipo 48
	ld a,(ix+045h)		;9ad9
	or a			;9adc
	jp nz,0740ch		;9add   ; borra_actor: el tipo y (ix+0x0E) a cero y sus sprites escondidos
	ld a,(0c130h)		;9ae0   ; lee la sala
	cp 045h		;9ae3
	jr z,L_9AF0		;9ae5
	ld a,(0c633h)		;9ae7
	or a			;9aea
	jr nz,L_9AD1		;9aeb
	call ve_a_snake		;9aed   ; ve_a_snake: el actor mira hacia (ix+0x11) desde su sitio: si ve a Snake, alarma
L_9AF0:
	ld a,(0c602h)		;9af0   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;9af3
	jp nz,058e9h		;9af4   ; reaparece: crea en IX el actor de p06:A445 de la sala (salas < 0xBC)
	dec (ix+05dh)		;9af7
	ret nz			;9afa
	ld a,(ix+014h)		;9afb
	inc a			;9afe
	cp (ix+013h)		;9aff
	jr c,L_9B05		;9b02
	xor a			;9b04
L_9B05:
	ld (ix+014h),a		;9b05
	ld d,(ix+05ch)		;9b08
	ld e,(ix+05bh)		;9b0b
	call 041e5h		;9b0e   ; de_mas_a: DE = DE + A
	jp 05b40h		;9b11
crea_tipo_25:		; la creacion del tipo 25
	ld a,r		;9b14
	ld hl,0c003h		;9b16   ; apunta a la cuenta de cuadros
	xor (hl)			;9b19
	and 003h		;9b1a
	add a,a			;9b1c
	add a,a			;9b1d
	add a,a			;9b1e
	add a,020h		;9b1f
	ld (ix+012h),a		;9b21   ; guarda la cuenta de espera del actor
	ld (ix+00bh),014h		;9b24   ; el cuadro del actor = 0x14
	ld (ix+00eh),003h		;9b28   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	jp 0b3f8h		;9b2c   ; parado: las dos velocidades a cero
cuadro_tipo_25:		; lo de cada cuadro del tipo 25
	ld a,(ix+001h)		;9b2f   ; lee el paso del actor
	call 041eah		;9b32   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9B35: 3 destinos del despachador p00:41EA (call en p02:9B32, el
;   indice en A): 9B3B, 9B56, 9B89; lo leen p02:9B32 (6 bytes)
;   0x9b35..0x9b3b  (6 bytes)
DATA_tabla_9B35:
	defw 09b3bh,09b56h,09b89h	; 9b35  -> L_9B3B L_9B56 L_9B89

; ======================================================================
; CODIGO 0x9b3b..0x9bdd  (162 bytes)
; ======================================================================


L_9B3B:
	dec (ix+012h)		;9b3b   ; baja la cuenta de espera del actor
	ret nz			;9b3e
	call 0a9b7h		;9b3f   ; azar_0_3: A = (R XOR (ix+0x0C)) AND 3
	add a,005h		;9b42
	add a,a			;9b44
	add a,a			;9b45
	ld (ix+013h),a		;9b46
	add a,a			;9b49
	ld (ix+012h),a		;9b4a   ; guarda la cuenta de espera del actor
	ld (ix+001h),001h		;9b4d   ; el paso del actor = 0x01
	ld (ix+00bh),015h		;9b51   ; el cuadro del actor = 0x15
	ret			;9b55
L_9B56:
	dec (ix+013h)		;9b56
	ret nz			;9b59
	ld a,r		;9b5a
	xor (ix+00ch)		;9b5c   ; XOR con la cuenta de cuadros del actor
	rra			;9b5f
	jr c,L_9B6B		;9b60
	ld (ix+001h),000h		;9b62   ; el paso del actor = 0x00
	ld (ix+00bh),014h		;9b66   ; el cuadro del actor = 0x14
	ret			;9b6a
L_9B6B:
	ld (ix+001h),002h		;9b6b   ; el paso del actor = 0x02
	ld (ix+006h),001h		;9b6f   ; si el actor se mueve (p01:7336) = 0x01
	call hacia_snake_dir		;9b73   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	exx			;9b76
	call choca_hacia		;9b77   ; choca_hacia: choca hacia la direccion A, 8 puntos por delante del actor
	jr nc,L_9B7E		;9b7a
	exx			;9b7c
	ld a,b			;9b7d
L_9B7E:
	ld (ix+011h),a		;9b7e   ; guarda la direccion del actor
	call cuadro_de_a		;9b81   ; cuadro_de_a: cuadro = 2 x A + 0x1E (+1 con el bit 2 de (ix+0x0C) a cero)
	call velocidad_de_dir		;9b84   ; velocidad_de_dir: las velocidades (ix+8, ix+0x0A) por la direccion (ix+0x11) (0x9BDB)
	jr L_9BB1		;9b87
L_9B89:
	call cuadro_de_dir		;9b89   ; cuadro_de_dir: cuadro = 2 x direccion + 0x1E (+1 con el bit 2 de (ix+0x0C) a cero)
	ld a,(ix+011h)		;9b8c   ; lee la direccion del actor
	call choca_hacia		;9b8f   ; choca_hacia: choca hacia la direccion A, 8 puntos por delante del actor
	jr c,L_9B9D		;9b92
	dec (ix+012h)		;9b94   ; baja la cuenta de espera del actor
	ret nz			;9b97
	ld a,003h		;9b98
	call 0427ch		;9b9a   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
L_9B9D:
	call hacia_snake_dir		;9b9d   ; hacia_snake_dir: A = la direccion de IX hacia Snake por el eje mayor (1-4), B = la del otro eje
	exx			;9ba0
	call choca_hacia		;9ba1   ; choca_hacia: choca hacia la direccion A, 8 puntos por delante del actor
	jr nc,L_9BA8		;9ba4
	exx			;9ba6
	ld a,b			;9ba7
L_9BA8:
	ld (ix+011h),a		;9ba8   ; guarda la direccion del actor
	call cuadro_de_a		;9bab   ; cuadro_de_a: cuadro = 2 x A + 0x1E (+1 con el bit 2 de (ix+0x0C) a cero)
	call velocidad_de_dir		;9bae   ; velocidad_de_dir: las velocidades (ix+8, ix+0x0A) por la direccion (ix+0x11) (0x9BDB)
L_9BB1:
	call 0a9b7h		;9bb1   ; azar_0_3: A = (R XOR (ix+0x0C)) AND 3
	add a,005h		;9bb4
	add a,a			;9bb6
	add a,a			;9bb7
	ld (ix+012h),a		;9bb8   ; guarda la cuenta de espera del actor
	ret			;9bbb
cuadro_de_dir:		; cuadro = 2 x direccion + 0x1E (+1 con el bit 2 de (ix+0x0C) a cero)
	ld a,(ix+011h)		;9bbc   ; lee la direccion del actor
cuadro_de_a:		; cuadro = 2 x A + 0x1E (+1 con el bit 2 de (ix+0x0C) a cero)
	add a,a			;9bbf
	add a,01eh		;9bc0
	bit 2,(ix+00ch)		;9bc2   ; mira el bit 2 de la cuenta de cuadros del actor
	jr nz,L_9BC9		;9bc6
	inc a			;9bc8
L_9BC9:
	ld (ix+00bh),a		;9bc9   ; guarda el cuadro del actor
	ret			;9bcc
velocidad_de_dir:		; las velocidades (ix+8, ix+0x0A) por la direccion (ix+0x11) (0x9BDB)
	ld a,(ix+011h)		;9bcd   ; lee la direccion del actor
	ld de,09bdbh		;9bd0
	call 042b4h		;9bd3   ; palabra_a: DE = la palabra A de la tabla DE
	ld (ix+008h),e		;9bd6   ; guarda la velocidad Y del actor (alta)
	ld (ix+00ah),d		;9bd9   ; guarda la velocidad X del actor (alta)
	ret			;9bdc

; ----------------------------------------------------------------------
; DATOS velocidad_9bdd: 4 parejas [dy][dx], una por direccion (ix+0x11) = 1-4:
;   p02:9BD0 lee 0x9BDB + 2 x direccion con L_42B4 y las pone en
;   (ix+8)/(ix+0xA)
;   0x9bdd..0x9be5  (8 bytes)
DATA_velocidad_9bdd:
	defb 0fdh,000h	; 9bdd
	defb 003h,000h	; 9bdf
	defb 000h,0fdh	; 9be1
	defb 000h,003h	; 9be3

; ======================================================================
; CODIGO 0x9be5..0x9bfc  (23 bytes)
; ======================================================================


choca_hacia:		; choca hacia la direccion A, 8 puntos por delante del actor
	ld c,a			;9be5
	ld de,09bfah		;9be6
	call 042b4h		;9be9   ; palabra_a: DE = la palabra A de la tabla DE
	ld a,e			;9bec
	add a,(ix+003h)		;9bed   ; le suma la Y del actor
	ld b,a			;9bf0
	ld a,d			;9bf1
	add a,(ix+005h)		;9bf2   ; le suma la X del actor
	ld l,b			;9bf5
	ld h,a			;9bf6
	ld b,001h		;9bf7
	jp choca		;9bf9   ; choca: acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)

; ----------------------------------------------------------------------
; DATOS velocidad_9bfc: 4 parejas [dy][dx] que p02:9BE6 lee en 0x9BFA + 2 x C
;   con L_42B4 y suma a (ix+3) y (ix+5)
;   0x9bfc..0x9c04  (8 bytes)
DATA_velocidad_9bfc:
	defb 0f8h,000h	; 9bfc
	defb 008h,000h	; 9bfe
	defb 000h,0f8h	; 9c00
	defb 000h,008h	; 9c02

; ======================================================================
; CODIGO 0x9c04..0x9c0a  (6 bytes)
; ======================================================================


cuadro_tipo_55:		; lo de cada cuadro del tipo 55
	ld a,(ix+001h)		;9c04   ; lee el paso del actor
	call 041eah		;9c07   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9C0A: 4 destinos del despachador p00:41EA (call en p02:9C07, el
;   indice en A): 9C12, 9C23, 9C2B, 9C48; lo leen p02:9C07 (8 bytes)
;   0x9c0a..0x9c12  (8 bytes)
DATA_tabla_9C0A:
	defw 09c12h,09c23h,09c2bh,09c48h	; 9c0a  -> L_9C12 L_9C23 L_9C2B L_9C48

; ======================================================================
; CODIGO 0x9c12..0x9c87  (117 bytes)
; ======================================================================


L_9C12:
	ld b,00fh		;9c12
	call 05b6ah		;9c14   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	bit 7,(ix+01eh)		;9c17   ; mira el bit 7 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ret z			;9c1b
	ld (ix+00bh),040h		;9c1c   ; el cuadro del actor = 0x40
	jp 05ba2h		;9c20   ; paso_siguiente: sube el paso del actor (ix+1)
L_9C23:
	ld a,06dh		;9c23
	call 05cd9h		;9c25   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
	jp 05ba2h		;9c28   ; paso_siguiente: sube el paso del actor (ix+1)
L_9C2B:
	call 05ba2h		;9c2b   ; paso_siguiente: sube el paso del actor (ix+1)
	inc (ix+006h)		;9c2e   ; sube si el actor se mueve (p01:7336)
	ld de,00100h		;9c31
	call 05b4eh		;9c34   ; velocidad_y: la velocidad Y del actor (ix+7, ix+8) = DE
	ld a,001h		;9c37
	ld (0c656h),a		;9c39
	ld (ix+013h),010h		;9c3c
	ld de,08060h		;9c40
	ld c,010h		;9c43
	jp 0569ah		;9c45   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
L_9C48:
	dec (ix+013h)		;9c48
	ret nz			;9c4b
	jp 07371h		;9c4c
crea_tipo_49:		; la creacion del tipo 49
	ld (ix+00bh),03eh		;9c4f   ; el cuadro del actor = 0x3E
	ld a,(ix+000h)		;9c53   ; lee el tipo del actor
	call 05bafh		;9c56   ; cuenta_tipo: A = cuantos actores del tipo A hay
	ld (ix+00fh),a		;9c59   ; guarda el numero del actor entre los de su tipo
	ld a,r		;9c5c
	ld (ix+00ch),a		;9c5e   ; guarda la cuenta de cuadros del actor
	ld (ix+013h),020h		;9c61
	ld (ix+014h),002h		;9c65
	ld a,(0c130h)		;9c69   ; lee la sala
	ld hl,09c87h		;9c6c
	ld bc,00017h		;9c6f
	cpir		;9c72
	ld e,c			;9c74
	ld d,000h		;9c75
	ld hl,0c640h		;9c77
	add hl,de			;9c7a
	ld a,(hl)			;9c7b
	or a			;9c7c
	jp nz,07371h		;9c7d
	ld (ix+015h),l		;9c80
	ld (ix+016h),h		;9c83
	ret			;9c86

; ----------------------------------------------------------------------
; DATOS salas_9c87: 23 numeros de sala que p02:9C72 busca con cpir (0xC130) y
;   usa la posicion (C) como indice
;   0x9c87..0x9c9e  (23 bytes)
DATA_salas_9c87:
	defb 0bdh,0b6h,0a7h,0a4h,0cbh,0cah,0c6h,0c3h,0c2h,0c1h,0beh,0bah,0b4h,0a1h,09fh,098h,094h,092h,091h,090h,088h,086h,081h	; 9c87  .......................

; ======================================================================
; CODIGO 0x9c9e..0x9ca4  (6 bytes)
; ======================================================================


cuadro_tipo_49:		; lo de cada cuadro del tipo 49
	ld a,(ix+001h)		;9c9e   ; lee el paso del actor
	call 041eah		;9ca1   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9CA4: 4 destinos del despachador p00:41EA (call en p02:9CA1, el
;   indice en A): 9CAC, 9D20, 9D26, 9D97; lo leen p02:9CA1 (8 bytes)
;   0x9ca4..0x9cac  (8 bytes)
DATA_tabla_9CA4:
	defw 09cach,09d20h,09d26h,09d97h	; 9ca4  -> L_9CAC L_9D20 habla_tipo_49 L_9D97

; ======================================================================
; CODIGO 0x9cac..0x9d59  (173 bytes)
; ======================================================================


L_9CAC:
	ld a,(ix+000h)		;9cac   ; lee el tipo del actor
	cp 032h		;9caf
	call z,cuadro_tipo_3		;9cb1   ; cuadro_tipo_3: lo de cada cuadro del tipo 3
	ld b,00fh		;9cb4
	call 05b6ah		;9cb6   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	ld a,(0c130h)		;9cb9   ; lee la sala
	cp 0c1h		;9cbc
	jr nz,L_9CC5		;9cbe
	ld a,(0c5b4h)		;9cc0
	or a			;9cc3
	ret z			;9cc4
L_9CC5:
	bit 7,(ix+01eh)		;9cc5   ; mira el bit 7 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	ret z			;9cc9
	ld (ix+014h),002h		;9cca
	ld (ix+00bh),040h		;9cce   ; el cuadro del actor = 0x40
	jr paso_actor		;9cd2
cuadro_tipo_3:		; lo de cada cuadro del tipo 3
	dec (ix+014h)		;9cd4
	ret nz			;9cd7
	ld (ix+014h),0c0h		;9cd8
	ld a,080h		;9cdc
	jp 05cd9h		;9cde   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
habla_y_sube:		; marca la sala, el texto B y sube_c132_cada_5
	ld a,b			;9ce1
	push af			;9ce2
	call marca_sala_del_tipo_49		;9ce3   ; marca_sala_del_tipo_49: pone a 1 la bandera de la sala (ix+0x15, 0x16) en 0xC640
	call paso_actor		;9ce6   ; paso_actor: sube el paso del actor (ix+1)
	push ix		;9ce9
	call 064c8h		;9ceb   ; sube_c132_cada_5: sube 0xC13A y, cada 5, sube 0xC132
	pop ix		;9cee
	pop af			;9cf0
	jp 05ce1h		;9cf1   ; ventana_de_texto: abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
habla_tipo_52:		; el texto 0x7C (0x7D con 0xC654) del tipo 0x34
	ld a,(0c654h)		;9cf4
	or a			;9cf7
	ld a,07ch		;9cf8
	jr z,L_9D00		;9cfa
	inc a			;9cfc
	call marca_sala_del_tipo_49		;9cfd   ; marca_sala_del_tipo_49: pone a 1 la bandera de la sala (ix+0x15, 0x16) en 0xC640
L_9D00:
	push ix		;9d00
	push af			;9d02
	call 064c8h		;9d03   ; sube_c132_cada_5: sube 0xC13A y, cada 5, sube 0xC132
	pop af			;9d06
	pop ix		;9d07
	call 05ce1h		;9d09   ; ventana_de_texto: abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
paso_actor:		; sube el paso del actor (ix+1)
	inc (ix+001h)		;9d0c
	ret			;9d0f
habla_en_c1:		; en la sala 0xC1, el texto 0x83 o 0x8C segun la Y
	ld a,(ix+003h)		;9d10   ; lee la Y del actor
	cp 054h		;9d13
	ld a,083h		;9d15
	jr nz,L_9D00		;9d17
	call marca_sala_del_tipo_49		;9d19   ; marca_sala_del_tipo_49: pone a 1 la bandera de la sala (ix+0x15, 0x16) en 0xC640
	ld a,08ch		;9d1c
	jr L_9D00		;9d1e
L_9D20:
	dec (ix+014h)		;9d20
	ret nz			;9d23
	jr paso_actor		;9d24
habla_tipo_49:		; el texto de la sala (0x9D59; casos 0xA7, 0xC1 y el tipo 0x34), sube_c132_cada_5
	ld a,(ix+000h)		;9d26   ; lee el tipo del actor
	cp 034h		;9d29
	jr z,habla_tipo_52		;9d2b
	ld a,(0c130h)		;9d2d   ; lee la sala
	ld b,081h		;9d30
	cp 0a7h		;9d32
	jr z,habla_y_sube		;9d34
	cp 0c1h		;9d36
	jr z,habla_en_c1		;9d38
	ld hl,09d59h		;9d3a   ; las 19 parejas [sala][texto] de 0x9D59
	ld b,013h		;9d3d
L_9D3F:
	cp (hl)			;9d3f   ; busca la sala
	jr z,L_9D47		;9d40
	inc hl			;9d42   ; la pareja siguiente
	inc hl			;9d43
	djnz L_9D3F		;9d44
	ret			;9d46
L_9D47:
	inc hl			;9d47   ; B = el texto
	ld b,(hl)			;9d48
	call marca_sala_del_tipo_49		;9d49   ; marca_sala_del_tipo_49: pone a 1 la bandera de la sala (ix+0x15, 0x16) en 0xC640
	ld a,b			;9d4c   ; marca la sala y el texto
	call 05ce1h		;9d4d   ; ventana_de_texto: abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
	push ix		;9d50   ; una estrella cada 5
	call 064c8h		;9d52   ; sube_c132_cada_5: sube 0xC13A y, cada 5, sube 0xC132
	pop ix		;9d55
	jr paso_actor		;9d57

; ----------------------------------------------------------------------
; DATOS parejas_9d59: 19 parejas [sala][valor] que p02:9D3F compara con 0xC130
;   (B = 0x13) y usa el segundo byte
;   0x9d59..0x9d7f  (38 bytes)
DATA_parejas_9d59:
	defb 081h,05ah	; 9d59
	defb 086h,034h	; 9d5b
	defb 088h,036h	; 9d5d
	defb 090h,04eh	; 9d5f
	defb 091h,083h	; 9d61
	defb 092h,020h	; 9d63
	defb 094h,01ch	; 9d65
	defb 098h,01ch	; 9d67
	defb 09fh,01bh	; 9d69
	defb 0a1h,054h	; 9d6b
	defb 0a4h,03bh	; 9d6d
	defb 0b4h,07bh	; 9d6f
	defb 0bah,065h	; 9d71
	defb 0beh,06bh	; 9d73
	defb 0c2h,090h	; 9d75
	defb 0c3h,04dh	; 9d77
	defb 0c6h,074h	; 9d79
	defb 0cah,073h	; 9d7b
	defb 0cbh,083h	; 9d7d

; ======================================================================
; CODIGO 0x9d7f..0x9dc5  (70 bytes)
; ======================================================================


crea_tipo_3:		; la creacion del tipo 3
	ld a,(0c654h)		;9d7f
	or a			;9d82
	jp nz,07371h		;9d83
	ld (ix+00eh),000h		;9d86   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld (ix+014h),020h		;9d8a
	ret			;9d8e
marca_sala_del_tipo_49:		; pone a 1 la bandera de la sala (ix+0x15, 0x16) en 0xC640
	ld l,(ix+015h)		;9d8f
	ld h,(ix+016h)		;9d92
	ld (hl),001h		;9d95
L_9D97:
	ret			;9d97
cuadro_de_direccion:		; cuadro = 2 x (ix+0x11) + el bit 0 del cuadro
	ld a,(ix+011h)		;9d98   ; lee la direccion del actor
	rlca			;9d9b
	add a,000h		;9d9c
	ld b,a			;9d9e
	ld a,(ix+00bh)		;9d9f   ; lee el cuadro del actor
	and 001h		;9da2
	or b			;9da4
	ld (ix+00bh),a		;9da5   ; guarda el cuadro del actor
	ret			;9da8
cuadro_tipo_4:		; lo de cada cuadro del tipo 4
	ld a,(ix+045h)		;9da9
	or a			;9dac
	jp nz,07371h		;9dad
	ld a,(ix+040h)		;9db0
	sub 003h		;9db3
	call nz,ve_a_snake		;9db5   ; ve_a_snake: el actor mira hacia (ix+0x11) desde su sitio: si ve a Snake, alarma
	ld a,(0c602h)		;9db8   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;9dbb
	jp nz,058e9h		;9dbc   ; reaparece: crea en IX el actor de p06:A445 de la sala (salas < 0xBC)
	ld a,(ix+040h)		;9dbf
	call 041eah		;9dc2   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9DC5: 5 destinos del despachador p00:41EA (call en p02:9DC2, el
;   indice en A): 9DCF, 9E08, 9E2C, 9E72, 9E8B; lo leen p02:9DC2 (10 bytes)
;   0x9dc5..0x9dcf  (10 bytes)
DATA_tabla_9DC5:
	defw 09dcfh,09e08h,09e2ch,09e72h,09e8bh	; 9dc5

; ======================================================================
; CODIGO 0x9dcf..0x9eeb  (284 bytes)
; ======================================================================


L_9DCF:
	call anda_el_camino		;9dcf   ; anda_el_camino: se duerme si toca, alterna el cuadro y mira si llego al punto
	jr $-58		;9dd2
anda_el_camino:		; se duerme si toca, alterna el cuadro y mira si llego al punto
	call se_duerme		;9dd4   ; se_duerme: con 0xC633, al acabar (ix+0x44): se para, cuadro 2, texto 0x21 y el tipo 0x40 encima
	ld bc,00700h		;9dd7
	call 05b6ah		;9dda   ; alterna_cuadro: si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
llego_al_punto:		; si paso el punto (ix+0x15, 0x16) por su direccion, punto_alcanzado
	ld d,(ix+005h)		;9ddd   ; lee la X del actor
	ld e,(ix+003h)		;9de0   ; lee la Y del actor
	ld h,(ix+016h)		;9de3
	ld l,(ix+015h)		;9de6
	ld a,(ix+011h)		;9de9   ; lee la direccion del actor
	dec a			;9dec
	jr z,L_9DFA		;9ded
	dec a			;9def
	jr z,L_9E00		;9df0
	dec a			;9df2
	jr z,L_9E04		;9df3
	ld a,l			;9df5
	sub e			;9df6
L_9DF7:
	ret c			;9df7
	jr L_9DFD		;9df8
L_9DFA:
	ld a,l			;9dfa
	sub e			;9dfb
L_9DFC:
	ret nc			;9dfc
L_9DFD:
	jp 05a6ah		;9dfd   ; punto_alcanzado: pone el actor en el punto, pasa al siguiente del camino y, a veces, se para
L_9E00:
	ld a,h			;9e00
	sub d			;9e01
	jr L_9DF7		;9e02
L_9E04:
	ld a,h			;9e04
	sub d			;9e05
	jr L_9DFC		;9e06
da_la_vuelta:		; tras (ix+0x12) cuadros, mira a otro lado al azar
	dec (ix+012h)		;9e08   ; baja la cuenta de espera del actor
	ret nz			;9e0b
	ld a,(ix+011h)		;9e0c   ; lee la direccion del actor
	ld (ix+042h),a		;9e0f
	xor 002h		;9e12
	ld b,a			;9e14
	ld a,r		;9e15
	rra			;9e17
	rra			;9e18
	and 001h		;9e19
	or b			;9e1b
	ld (ix+011h),a		;9e1c   ; guarda la direccion del actor
	add a,008h		;9e1f
	ld (ix+00bh),a		;9e21   ; guarda el cuadro del actor
	ld (ix+012h),010h		;9e24   ; la cuenta de espera del actor = 0x10
L_9E28:
	inc (ix+040h)		;9e28
	ret			;9e2b
sigue_andando:		; tras (ix+0x12) cuadros, vuelve a la direccion de antes y al paso 0
	dec (ix+012h)		;9e2c   ; baja la cuenta de espera del actor
	ret nz			;9e2f
	inc (ix+006h)		;9e30   ; sube si el actor se mueve (p01:7336)
	ld a,(ix+042h)		;9e33
	ld (ix+011h),a		;9e36   ; guarda la direccion del actor
	ld (ix+040h),000h		;9e39
	ret			;9e3d
se_duerme:		; con 0xC633, al acabar (ix+0x44): se para, cuadro 2, texto 0x21 y el tipo 0x40 encima
	ld a,(0c633h)		;9e3e
	or a			;9e41
	ret z			;9e42
	dec (ix+044h)		;9e43
	ret nz			;9e46
	pop hl			;9e47
	pop hl			;9e48
	ld (ix+006h),000h		;9e49   ; si el actor se mueve (p01:7336) = 0x00
	ld a,(ix+040h)		;9e4d
	ld (ix+047h),a		;9e50
	ld (ix+040h),003h		;9e53
	ld (ix+00bh),002h		;9e57   ; el cuadro del actor = 0x02
	ld (ix+046h),000h		;9e5b
	ld a,021h		;9e5f
	call 05cd9h		;9e61   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
	ld d,(ix+005h)		;9e64   ; lee la X del actor
	ld a,(ix+003h)		;9e67   ; lee la Y del actor
	sub 023h		;9e6a
	ld e,a			;9e6c
	ld c,040h		;9e6d
	jp 0569ah		;9e6f   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
dormido:		; si oye un disparo, alarma; al acabar (ix+0x46) se despierta
	call oye_disparo		;9e72   ; oye_disparo: acarreo si el actor esta marcado o hay un disparo sin SILENCER en marcha
	jp c,alarma_de_actor		;9e75   ; alarma_de_actor: la alarma desde el actor: 0xC614 por la sala (0x98DE), 0xC60C y los refuerzos
	dec (ix+046h)		;9e78
	ret nz			;9e7b
	ld (ix+044h),0c0h		;9e7c
	push ix		;9e80
	pop hl			;9e82
	ld de,0008dh		;9e83
	add hl,de			;9e86
	ld (hl),000h		;9e87
	jr L_9E28		;9e89
despierta:		; vuelve al paso de antes con el texto 0x22
	inc (ix+006h)		;9e8b   ; sube si el actor se mueve (p01:7336)
	ld a,(ix+047h)		;9e8e
	ld (ix+040h),a		;9e91
	ld a,022h		;9e94
	jp 05cd9h		;9e96   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
crea_tipo_53:		; la creacion del tipo 53
	ld a,(0c130h)		;9e99   ; lee la sala
	cp 076h		;9e9c
	jr nz,L_9EA7		;9e9e
	ld a,(0c623h)		;9ea0
	or a			;9ea3
	jp nz,07371h		;9ea4
L_9EA7:
	ld (ix+00eh),000h		;9ea7   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	ld a,035h		;9eab
	jr L_9EB1		;9ead
crea_tipo_6:		; la creacion del tipo 6
	ld a,006h		;9eaf
L_9EB1:
	call 05bafh		;9eb1   ; cuenta_tipo: A = cuantos actores del tipo A hay
	ld (ix+00fh),a		;9eb4   ; guarda el numero del actor entre los de su tipo
	ld a,r		;9eb7
	ld (ix+012h),a		;9eb9   ; guarda la cuenta de espera del actor
	ld a,(0c130h)		;9ebc   ; lee la sala
	ld hl,09eebh		;9ebf
	ld bc,0000bh		;9ec2
	cpir		;9ec5
	ld a,c			;9ec7
	ld hl,09ef6h		;9ec8
	call 041dfh		;9ecb   ; hl_mas_2a: HL = HL + 2 x A
	ld e,(hl)			;9ece
	inc hl			;9ecf
	ld d,(hl)			;9ed0
	ex de,hl			;9ed1
	ld a,(ix+00fh)		;9ed2   ; lee el numero del actor entre los de su tipo
	dec a			;9ed5
	call 041e0h		;9ed6   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;9ed9
	ld (ix+01bh),a		;9eda
	add a,01ch		;9edd
	ld (ix+00bh),a		;9edf   ; guarda el cuadro del actor
	inc (ix+006h)		;9ee2   ; sube si el actor se mueve (p01:7336)
camino_del_actor:		; carga el camino (ix+0x0F) de la sala
	ld b,(ix+00fh)		;9ee5   ; lee el numero del actor entre los de su tipo
	jp 059cch		;9ee8   ; carga_camino: carga el camino B de la sala (p06:A2DF) en IX y va al primer punto

; ----------------------------------------------------------------------
; DATOS salas_9eeb: 11 numeros de sala (0x95, 0x76, 0x73, 0x6F, 0x6E, 0x24,
;   0x1F, 0x1C, 0x1B, 0x15, 0xE) que p02:9EC5 busca con cpir; la posicion (C)
;   elige en 0x9EF6
;   0x9eeb..0x9ef6  (11 bytes)
DATA_salas_9eeb:
	defb 095h,076h,073h,06fh,06eh,024h,01fh,01ch,01bh,015h,00eh	; 9eeb  .vson$.....

; ----------------------------------------------------------------------
; DATOS indice_9ef6: 12 punteros (p02:9EC8 lee 0x9EF6 + 2 x C) a los bytes de
;   0x9F0C-0x9F16; el primero cae en los dos ultimos bytes del propio indice
;   0x9ef6..0x9f0e  (24 bytes)
DATA_indice_9ef6:
	defw 09f16h,09f15h,09f12h,09f14h,09f10h,09f0eh	; 9ef6
	defw 09f0eh,09f0ch,09f0ch,09f0ch,09f0ch,00101h	; 9f02

; ----------------------------------------------------------------------
; DATOS bytes_9f0e: los bytes (1, 1, 1, 1, 3 y ceros) a los que apunta el
;   indice de 0x9EF6 (p02:9ECE lee E y D)
;   0x9f0e..0x9f19  (11 bytes)
DATA_bytes_9f0e:
	defb 001h,001h,003h,000h,000h,003h,003h,001h,003h,002h,002h	; 9f0e  ...........

; ======================================================================
; CODIGO 0x9f19..0x9f1f  (6 bytes)
; ======================================================================


cuadro_tipo_6:		; lo de cada cuadro del tipo 6
	ld a,(ix+001h)		;9f19   ; lee el paso del actor
	call 041eah		;9f1c   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9F1F: 3 destinos del despachador p00:41EA (call en p02:9F1C, el
;   indice en A): 9F25, 9F6E, 9F85; lo leen p02:9F1C (6 bytes)
;   0x9f1f..0x9f25  (6 bytes)
DATA_tabla_9F1F:
	defw 09f25h,09f6eh,09f85h	; 9f1f  -> camara_vigila camara_avisa L_9F85

; ======================================================================
; CODIGO 0x9f25..0x9f86  (97 bytes)
; ======================================================================


camara_vigila:		; mira hacia (ix+0x1B) desde su sitio (0x9F86); si ve a Snake, al paso 1
	ld a,(0c602h)		;9f25   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;9f28
	jp nz,0a1a0h		;9f29
	ld a,(ix+01bh)		;9f2c
	ld b,a			;9f2f
	ld hl,09f86h		;9f30
	call 041dfh		;9f33   ; hl_mas_2a: HL = HL + 2 x A
	ld a,(ix+003h)		;9f36   ; lee la Y del actor
	add a,(hl)			;9f39
	inc hl			;9f3a
	ld e,a			;9f3b
	ld a,(ix+005h)		;9f3c   ; lee la X del actor
	add a,(hl)			;9f3f
	ld d,a			;9f40
	ld a,b			;9f41
	ex de,hl			;9f42
	call ve_a_snake_desde		;9f43   ; ve_a_snake_desde: mira hacia A desde HL: Snake en linea y sin pared por medio (no en la caja quieta)
	ld a,(ix+041h)		;9f46
	or a			;9f49
	jr z,L_9F57		;9f4a
	ld (ix+006h),000h		;9f4c   ; si el actor se mueve (p01:7336) = 0x00
	ld (ix+012h),020h		;9f50   ; la cuenta de espera del actor = 0x20
	jp 05ba2h		;9f54   ; paso_siguiente: sube el paso del actor (ix+1)
L_9F57:
	ld a,(ix+006h)		;9f57   ; lee si el actor se mueve (p01:7336)
	or a			;9f5a
	jp nz,llego_al_punto		;9f5b   ; llego_al_punto: si paso el punto (ix+0x15, 0x16) por su direccion, punto_alcanzado
	dec (ix+012h)		;9f5e   ; baja la cuenta de espera del actor
	ret nz			;9f61
	ld (ix+006h),001h		;9f62   ; si el actor se mueve (p01:7336) = 0x01
	ld a,r		;9f66
	ld (ix+012h),a		;9f68   ; guarda la cuenta de espera del actor
	jp 05a02h		;9f6b   ; hacia_el_punto: direccion (ix+0x11) y velocidades hacia el punto (ix+0x15, ix+0x16) con la marcha (ix+0x43)
camara_avisa:		; parpadea (colores 2/0x4D y 4/0x4B) hasta acabar (ix+0x12)
	dec (ix+012h)		;9f6e   ; baja la cuenta de espera del actor
	jp z,0a1a0h		;9f71
	ld a,(ix+012h)		;9f74   ; lee la cuenta de espera del actor
	ld bc,0024dh		;9f77
	bit 2,a		;9f7a
	jr z,L_9F81		;9f7c
	ld bc,0044bh		;9f7e
L_9F81:
	ld a,b			;9f81
	jp 05bc3h		;9f82
L_9F85:
	ret			;9f85

; ----------------------------------------------------------------------
; DATOS parejas_9f86: 4 parejas que p02:9F30 lee en 0x9F86 + 2 x (ix+0x1B) y
;   suma a (ix+3)
;   0x9f86..0x9f8e  (8 bytes)
DATA_parejas_9f86:
	defb 0f4h,000h	; 9f86
	defb 02bh,000h	; 9f88
	defb 000h,0efh	; 9f8a
	defb 000h,010h	; 9f8c

; ======================================================================
; CODIGO 0x9f8e..0x9f94  (6 bytes)
; ======================================================================


cuadro_tipo_53:		; lo de cada cuadro del tipo 53
	ld a,(ix+001h)		;9f8e   ; lee el paso del actor
	call 041eah		;9f91   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9F94: 3 destinos del despachador p00:41EA (call en p02:9F91, el
;   indice en A): 9F9A, 9FD5, A049; lo leen p02:9F91 (6 bytes)
;   0x9f94..0x9f9a  (6 bytes)
DATA_tabla_9F94:
	defw 09f9ah,09fd5h,0a049h	; 9f94  -> L_9F9A L_9FD5 0xa049

; ======================================================================
; CODIGO 0x9f9a..0x9ffe  (100 bytes)
; ======================================================================


L_9F9A:
	call llego_al_punto		;9f9a   ; llego_al_punto: si paso el punto (ix+0x15, 0x16) por su direccion, punto_alcanzado
bajo_la_camara:		; si Snake pasa por debajo: paso 1 y crea el tipo 0x36; A = 0xFF
	ld a,(0c182h)		;9f9d   ; lee la Y de Snake
	cp (ix+003h)		;9fa0   ; compara con la Y del actor
	ret c			;9fa3
	ld a,(0c184h)		;9fa4   ; lee la X de Snake
	sub 004h		;9fa7
	ld d,(ix+005h)		;9fa9   ; lee la X del actor
	cp d			;9fac
	ret nc			;9fad
	add a,008h		;9fae
	cp d			;9fb0
	ret c			;9fb1
	ld a,(ix+001h)		;9fb2   ; lee el paso del actor
	or a			;9fb5
	call z,05ba2h		;9fb6   ; paso_siguiente: sube el paso del actor (ix+1)
	ld (ix+059h),020h		;9fb9
	ld de,00000h		;9fbd
	call 05b5dh		;9fc0   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
	ld d,(ix+005h)		;9fc3   ; lee la X del actor
	ld e,(ix+003h)		;9fc6   ; lee la Y del actor
	ld c,036h		;9fc9
	push ix		;9fcb
	call 0569ah		;9fcd   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	pop ix		;9fd0
	ld a,0ffh		;9fd2
	ret			;9fd4
L_9FD5:
	call llego_al_punto		;9fd5   ; llego_al_punto: si paso el punto (ix+0x15, 0x16) por su direccion, punto_alcanzado
	ld a,(ix+059h)		;9fd8
	or a			;9fdb
	jr z,L_9FE2		;9fdc
	dec (ix+059h)		;9fde
	ret nz			;9fe1
L_9FE2:
	call bajo_la_camara		;9fe2   ; bajo_la_camara: si Snake pasa por debajo: paso 1 y crea el tipo 0x36; A = 0xFF
	inc a			;9fe5
	ret z			;9fe6
	ld a,(0c184h)		;9fe7   ; lee la X de Snake
	sub (ix+005h)		;9fea   ; le resta la X del actor
	jr nc,L_9FF1		;9fed
	neg		;9fef
L_9FF1:
	cp 060h		;9ff1
	jr c,$+14		;9ff3
	ld l,(ix+017h)		;9ff5
	ld h,(ix+018h)		;9ff8
	call camino_del_actor		;9ffb   ; camino_del_actor: carga el camino (ix+0x0F) de la sala

; ----------------------------------------------------------------------
; DATOS jp_partido: los dos primeros bytes (C3 A6) de `jp 0x5BA6`: el tercero
;   (5B) es el primer byte del banco 3, en 0xA000. Sigue a `call 0x9EE5` en
;   p02:9FFB; el codigo de la camara continua de largo en p03:A001 por el `jr
;   c` de p02:9FF3
;   0x9ffe..0xa000  (2 bytes)
DATA_jp_partido:
	defb 0c3h,0a6h	; 9ffe
