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


L_8000:
	ld (0c639h),a		;8000
	ld hl,(0c15fh)		;8003
	ld (0c163h),hl		;8006
	ld a,(0c632h)		;8009
	ld (0c16ah),a		;800c
	ld hl,0ea0eh		;800f
	ld de,0ea0fh		;8012
	ld bc,00057h		;8015
	ld (hl),0e0h		;8018
	ldir		;801a
	ld hl,08037h		;801c
	ld de,0ea10h		;801f
	ld bc,00018h		;8022
	ldir		;8025
	ld hl,0e840h		;8027
	ld de,0e841h		;802a
	ld bc,0003fh		;802d
	ld (hl),00eh		;8030
	ldir		;8032
	jp 04c40h		;8034

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


L_804F:
	ld a,(0c158h)		;804f
	cp 001h		;8052
	ret z			;8054
	ld a,(0c130h)		;8055
	ld hl,0806ch		;8058
	ld b,037h		;805b
L_805D:
	cp (hl)			;805d
	ret z			;805e
	inc hl			;805f
	djnz L_805D		;8060
	ld a,(0c602h)		;8062
	and a			;8065
	ret nz			;8066
	ld a,05ah		;8067
	jp 07d27h		;8069

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


L_80A3:
	ld a,(0c134h)		;80a3
	and a			;80a6
	ret z			;80a7
	ld a,(0c130h)		;80a8
	cp 0cch		;80ab
	ret z			;80ad
	cp 0e0h		;80ae
	ret nc			;80b0
	ld a,(0c18bh)		;80b1
	cp 002h		;80b4
	ret z			;80b6
	cp 004h		;80b7
	ret z			;80b9
	cp 007h		;80ba
	ret z			;80bc
	ld a,(0c134h)		;80bd
	dec a			;80c0
	call 041eah		;80c1

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


L_80D2:
	ld hl,0c200h		;80d2
	ld de,00040h		;80d5
	ld b,006h		;80d8
L_80DA:
	ld a,(hl)			;80da
	and a			;80db
	jp z,L_80E4		;80dc
	add hl,de			;80df
	djnz L_80DA		;80e0
	and a			;80e2
	ret			;80e3
L_80E4:
	push hl			;80e4
	pop ix		;80e5
	scf			;80e7
	ret			;80e8
L_80E9:
	ld a,(0c134h)		;80e9
	dec a			;80ec
	ld hl,08140h		;80ed
	call 041e0h		;80f0
	ld c,(hl)			;80f3
	push ix		;80f4
	pop iy		;80f6
	ld de,00020h		;80f8
	add iy,de		;80fb
	ld (iy+000h),c		;80fd
	inc iy		;8100
	ld hl,0ea10h		;8102
	ld e,004h		;8105
	ld b,006h		;8107
L_8109:
	ld a,(hl)			;8109
	cp 0e0h		;810a
	jr nz,L_8121		;810c
	ld (iy+000h),e		;810e
	ld (hl),0e1h		;8111
	dec c			;8113
	jp z,L_8130		;8114
	inc iy		;8117
	inc iy		;8119
	inc iy		;811b
	inc iy		;811d
	inc iy		;811f
L_8121:
	inc e			;8121
	inc hl			;8122
	inc hl			;8123
	inc hl			;8124
	inc hl			;8125
	djnz L_8109		;8126
	push ix		;8128
	pop hl			;812a
	call L_821F		;812b
	xor a			;812e
	ret			;812f
L_8130:
	ld a,(0c134h)		;8130
	ld (ix+000h),a		;8133
	ld (ix+001h),000h		;8136
	ld (ix+002h),000h		;813a
	scf			;813e
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


L_8147:
	ld hl,0c200h		;8147
	ld b,006h		;814a
L_814C:
	push bc			;814c
	push hl			;814d
	ld a,(hl)			;814e
	and a			;814f
	call nz,L_815C		;8150
	pop hl			;8153
	ld de,00040h		;8154
	add hl,de			;8157
	pop bc			;8158
	djnz L_814C		;8159
	ret			;815b
L_815C:
	push hl			;815c
	pop ix		;815d
	inc a			;815f
	jp z,L_821F		;8160
	dec a			;8163
	dec a			;8164
	call 041eah		;8165

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


L_8176:
	ld hl,0c200h		;8176
	ld b,006h		;8179
L_817B:
	push bc			;817b
	push hl			;817c
	ld a,(hl)			;817d
	and a			;817e
	jr z,L_81B2		;817f
	ld a,020h		;8181
	call 041e0h		;8183
	ld b,(hl)			;8186
	inc hl			;8187
	ld c,0ffh		;8188
L_818A:
	push bc			;818a
	ld a,(hl)			;818b
	ld de,0ea00h		;818c
	add a,a			;818f
	add a,a			;8190
	ld b,a			;8191
	call 041e5h		;8192
	inc hl			;8195
	ldi		;8196
	ldi		;8198
	ldi		;819a
	push hl			;819c
	ld de,0e800h		;819d
	ld a,b			;81a0
	call 042beh		;81a1
	add hl,de			;81a4
	ex de,hl			;81a5
	pop hl			;81a6
	ld a,(hl)			;81a7
	inc hl			;81a8
	ld b,010h		;81a9
L_81AB:
	ld (de),a			;81ab
	inc de			;81ac
	djnz L_81AB		;81ad
	pop bc			;81af
	djnz L_818A		;81b0
L_81B2:
	pop hl			;81b2
	ld de,00040h		;81b3
	add hl,de			;81b6
	pop bc			;81b7
	djnz L_817B		;81b8
	ret			;81ba
L_81BB:
	ld e,(ix+003h)		;81bb
	ld d,(ix+004h)		;81be
	ld l,(ix+007h)		;81c1
	ld h,(ix+008h)		;81c4
	add hl,de			;81c7
	ld (ix+003h),l		;81c8
	ld (ix+004h),h		;81cb
L_81CE:
	ld e,(ix+005h)		;81ce
	ld d,(ix+006h)		;81d1
	ld l,(ix+009h)		;81d4
	ld h,(ix+00ah)		;81d7
	add hl,de			;81da
	ld (ix+005h),l		;81db
	ld (ix+006h),h		;81de
	ret			;81e1
L_81E2:
	call L_81CE		;81e2
L_81E5:
	ld e,(ix+00dh)		;81e5
	ld d,(ix+00eh)		;81e8
	ld l,(ix+007h)		;81eb
	ld h,(ix+008h)		;81ee
	add hl,de			;81f1
	ld (ix+00dh),l		;81f2
	ld (ix+00eh),h		;81f5
	ret			;81f8
L_81F9:
	ld l,(ix+004h)		;81f9
	jr L_8201		;81fc
L_81FE:
	ld l,(ix+00eh)		;81fe
L_8201:
	ld c,(ix+00ch)		;8201
	ld b,002h		;8204
	ld h,(ix+006h)		;8206
	jp L_8298		;8209
L_820C:
	ld a,(ix+004h)		;820c
	cp 0b8h		;820f
	jp nc,L_821F		;8211
	ld a,(ix+006h)		;8214
	cp 0f8h		;8217
	jp nc,L_821F		;8219
	cp 009h		;821c
	ret nc			;821e
L_821F:
	push ix		;821f
	pop de			;8221
	ld (ix+000h),000h		;8222
	ld a,020h		;8226
	call 041e5h		;8228
	ld a,(de)			;822b
	ld b,a			;822c
	inc de			;822d
L_822E:
	ld a,(de)			;822e
	ld hl,0ea00h		;822f
	add a,a			;8232
	call 041dfh		;8233
	ld (hl),0e0h		;8236
	inc de			;8238
	inc de			;8239
	inc de			;823a
	inc de			;823b
	inc de			;823c
	djnz L_822E		;823d
	ret			;823f
L_8240:
	ld hl,0c528h		;8240
	dec (hl)			;8243
	jr z,L_8290		;8244
	ld c,000h		;8246
	call L_8283		;8248
	ld a,(0c529h)		;824b
	ld hl,0c52bh		;824e
	sub (hl)			;8251
	ld (0c529h),a		;8252
	ld a,(hl)			;8255
	ld hl,0c52dh		;8256
	add a,a			;8259
	add a,(hl)			;825a
	ld (hl),a			;825b
	ld a,(0c52ah)		;825c
	ld hl,0c52ch		;825f
	sub (hl)			;8262
	ld (0c52ah),a		;8263
	ld a,(hl)			;8266
	ld hl,0c52eh		;8267
	add a,a			;826a
	add a,(hl)			;826b
	ld (hl),a			;826c
	ld hl,(0c529h)		;826d
	inc h			;8270
	inc l			;8271
	ld bc,(0c52dh)		;8272
	dec c			;8276
	dec c			;8277
	dec b			;8278
	dec b			;8279
	xor a			;827a
	ld d,a			;827b
	call 04f91h		;827c
	ld a,(0c52fh)		;827f
	ld c,a			;8282
L_8283:
	ld hl,(0c529h)		;8283
	ld de,(0c52dh)		;8286
	inc e			;828a
	call 04f63h		;828b
	and a			;828e
	ret			;828f
L_8290:
	scf			;8290
	ret			;8291
L_8292:
	ld l,(ix+003h)		;8292
	ld h,(ix+005h)		;8295
L_8298:
	ld (0ec00h),hl		;8298
	ld a,b			;829b
	add a,a			;829c
	add a,a			;829d
	add a,c			;829e
	add a,a			;829f
	add a,a			;82a0
	ld hl,l82c7h		;82a1
	ld d,000h		;82a4
	ld e,a			;82a6
	add hl,de			;82a7
	ld b,002h		;82a8
L_82AA:
	ld a,(0ec00h)		;82aa
	add a,(hl)			;82ad
	ld e,a			;82ae
	inc hl			;82af
	ld a,(0ec01h)		;82b0
	add a,(hl)			;82b3
	inc hl			;82b4
	push hl			;82b5
	ld h,a			;82b6
	ld l,e			;82b7
	call 05c09h		;82b8
	ld d,000h		;82bb
	ld e,(hl)			;82bd
	ld hl,0c700h		;82be
	add hl,de			;82c1
	ld a,(hl)			;82c2
	rra			;82c3
	pop hl			;82c4
	jr c,L_82C9		;82c5
L_82C7:
	djnz L_82AA		;82c7
L_82C9:
	ld a,c			;82c9
	ret			;82ca

; ----------------------------------------------------------------------
; DATOS cajas_de_choque: 12 fichas de 4 bytes, dos parejas [dx][dy] cada una,
;   que p02:82AA recorre (B = 2) sumando a la posicion y mirando en 0xC700 si
;   la ficha choca (L_5C09); p02:82A1 elige la ficha con 0x82C7 + 4 x (4 x B +
;   C)
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


L_82FB:
	ld a,(0c184h)		;82fb
	sub 004h		;82fe
	ld h,a			;8300
	ld a,(0c182h)		;8301
	ld l,a			;8304
L_8305:
	call 05c09h		;8305
	ld a,(hl)			;8308
	inc hl			;8309
	ld l,(hl)			;830a
	ld h,a			;830b
	ret			;830c
L_830D:
	ld l,(ix+003h)		;830d
	ld h,(ix+005h)		;8310
	call 05c09h		;8313
	ld b,002h		;8316
L_8318:
	ld d,000h		;8318
	ld a,(hl)			;831a
	cp 06bh		;831b
	ret z			;831d
	cp 06eh		;831e
	ret z			;8320
	ld e,a			;8321
	push hl			;8322
	ld hl,0c700h		;8323
	add hl,de			;8326
	ld a,(hl)			;8327
	rra			;8328
	pop hl			;8329
	ret nc			;832a
	ld de,00040h		;832b
	add hl,de			;832e
	djnz L_8318		;832f
	jp 07371h		;8331
L_8334:
	ld a,(0c182h)		;8334
	sub (ix+003h)		;8337
	ld d,002h		;833a
	jr nc,L_8341		;833c
	dec d			;833e
	neg		;833f
L_8341:
	ld b,a			;8341
	ld a,(0c184h)		;8342
	sub (ix+005h)		;8345
	ld e,004h		;8348
	jr nc,L_834F		;834a
	dec e			;834c
	neg		;834d
L_834F:
	cp b			;834f
	ld a,d			;8350
	ld b,e			;8351
	ret c			;8352
	ld a,e			;8353
	ld b,d			;8354
	ret			;8355
L_8356:
	call L_8334		;8356
	ld c,b			;8359
	call L_835F		;835a
	ld b,a			;835d
	ld a,c			;835e
L_835F:
	dec a			;835f
	xor 001h		;8360
	inc a			;8362
	ret			;8363
L_8364:
	ld a,(0c006h)		;8364
	and 010h		;8367
	ret z			;8369
	ld a,001h		;836a
	call 043e8h		;836c
	inc hl			;836f
	ld (0ec00h),hl		;8370
	ld a,(hl)			;8373
	inc hl			;8374
	or (hl)			;8375
	ld a,015h		;8376
	jp z,0427ch		;8378
	call L_80D2		;837b
	ret nc			;837e
	call L_80E9		;837f
	ret nc			;8382
	ld hl,(0ec00h)		;8383
	ld c,000h		;8386
	call 04613h		;8388
	ld (ix+002h),010h		;838b
	ld (ix+00fh),001h		;838f
	ld a,(0c182h)		;8393
	ld (ix+003h),000h		;8396
	ld (ix+00dh),000h		;839a
	ld (ix+00eh),a		;839e
	sub 00eh		;83a1
	ld (ix+004h),a		;83a3
	ld a,(0c184h)		;83a6
	ld (ix+005h),000h		;83a9
	ld (ix+006h),a		;83ad
	ld a,(0c185h)		;83b0
	ld (ix+00ch),a		;83b3
	ld hl,083e6h		;83b6
	call 041deh		;83b9
	ld (ix+007h),000h		;83bc
	ld a,(hl)			;83c0
	ld (ix+008h),a		;83c1
	inc hl			;83c4
	ld (ix+009h),000h		;83c5
	ld a,(hl)			;83c9
	ld (ix+00ah),a		;83ca
	ld (ix+00bh),000h		;83cd
	ld a,(0c51ch)		;83d1
	and a			;83d4
	ld a,00ch		;83d5
	jr z,L_83DB		;83d7
	ld a,00eh		;83d9
L_83DB:
	push af			;83db
	call 04284h		;83dc
	pop af			;83df
	call z,L_804F		;83e0
	jp 053dah		;83e3

; ----------------------------------------------------------------------
; DATOS velocidad_de_la_bala: 4 parejas [dx][dy], una por direccion 1-4
;   (0xC185): p02:83B6 lee 0x83E6 + 2 x (direccion - 1) con L_41DE
;   0x83e6..0x83ee  (8 bytes)
DATA_velocidad_de_la_bala:
	defb 0fah,000h	; 83e6
	defb 006h,000h	; 83e8
	defb 000h,0fah	; 83ea
	defb 000h,006h	; 83ec

; ======================================================================
; CODIGO 0x83ee..0x84b8  (202 bytes)
; ======================================================================


L_83EE:
	dec (ix+002h)		;83ee
	jp z,L_821F		;83f1
	call L_81BB		;83f4
	call L_81E5		;83f7
	call L_81F9		;83fa
	jr nc,L_8405		;83fd
	call L_81FE		;83ff
	jp c,L_821F		;8402
L_8405:
	call L_820C		;8405
	jp 053dah		;8408
L_840B:
	ld a,015h		;840b
	call 0427ch		;840d
L_8410:
	ld (hl),000h		;8410
	inc hl			;8412
	ld (hl),000h		;8413
	ret			;8415
L_8416:
	ld hl,0c19eh		;8416
	ld a,(0c007h)		;8419
	and 010h		;841c
	jr z,L_8410		;841e
	inc (hl)			;8420
	ld a,(hl)			;8421
	cp 002h		;8422
	ret nz			;8424
	ld (hl),000h		;8425
	inc hl			;8427
	inc (hl)			;8428
	ld a,(hl)			;8429
	cp 009h		;842a
	jr nz,L_8430		;842c
	ld (hl),001h		;842e
L_8430:
	ld a,002h		;8430
	call 043e8h		;8432
	inc hl			;8435
	ld (0ec00h),hl		;8436
	ld a,(hl)			;8439
	inc hl			;843a
	or (hl)			;843b
	jr z,L_840B		;843c
	call L_80D2		;843e
	ret nc			;8441
	call L_80E9		;8442
	ret nc			;8445
	ld hl,(0ec00h)		;8446
	ld c,000h		;8449
	call 04613h		;844b
	ld (ix+002h),010h		;844e
	ld (ix+00fh),001h		;8452
	ld a,(0c182h)		;8456
	ld (ix+003h),000h		;8459
	ld (ix+00dh),000h		;845d
	ld (ix+00eh),a		;8461
	sub 00eh		;8464
	ld (ix+004h),a		;8466
	ld a,(0c184h)		;8469
	ld (ix+005h),000h		;846c
	ld (ix+006h),a		;8470
	ld a,(0c185h)		;8473
	ld (ix+00ch),a		;8476
	dec a			;8479
	add a,a			;847a
	add a,a			;847b
	add a,a			;847c
	add a,a			;847d
	ld hl,084b8h		;847e
	call 041dfh		;8481
	ld a,(0c19fh)		;8484
	dec a			;8487
	add a,a			;8488
	call 041dfh		;8489
	ld a,(hl)			;848c
	ld (ix+007h),a		;848d
	inc hl			;8490
	ld a,(hl)			;8491
	ld (ix+008h),a		;8492
	inc hl			;8495
	ld a,(hl)			;8496
	ld (ix+009h),a		;8497
	inc hl			;849a
	ld a,(hl)			;849b
	ld (ix+00ah),a		;849c
	ld (ix+00bh),000h		;849f
	ld a,(0c51ch)		;84a3
	and a			;84a6
	ld a,00dh		;84a7
	jr z,L_84AD		;84a9
	ld a,00eh		;84ab
L_84AD:
	push af			;84ad
	call 0427ch		;84ae
	pop af			;84b1
	call z,L_804F		;84b2
	jp 053dah		;84b5

; ----------------------------------------------------------------------
; DATOS velocidades_de_la_metralleta: 16 fichas de 8 bytes, 4 parejas [dx][dy]
;   cada una: p02:847E lee 0x84B8 + 8 x A + 2 x (0xC19F - 1)
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


L_8538:
	ld a,(0c006h)		;8538
	and 010h		;853b
	ret z			;853d
	ld a,003h		;853e
	call 043e8h		;8540
	inc hl			;8543
	ld (0ec00h),hl		;8544
	ld a,(hl)			;8547
	inc hl			;8548
	or (hl)			;8549
	ret z			;854a
	call L_80D2		;854b
	ret nc			;854e
	call L_80E9		;854f
	ret nc			;8552
	ld hl,(0ec00h)		;8553
	ld c,000h		;8556
	call 04613h		;8558
	ld (ix+002h),018h		;855b
	ld (ix+00fh),000h		;855f
	ld a,(0c182h)		;8563
	ld (ix+003h),000h		;8566
	ld (ix+00dh),000h		;856a
	sub 010h		;856e
	ld (ix+004h),a		;8570
	ld (ix+00eh),a		;8573
	ld a,(0c184h)		;8576
	ld (ix+005h),000h		;8579
	ld (ix+006h),a		;857d
	ld a,(0c185h)		;8580
	ld (ix+00ch),a		;8583
	ld hl,085a9h		;8586
	call 041deh		;8589
	ld (ix+007h),000h		;858c
	ld a,(hl)			;8590
	ld (ix+008h),a		;8591
	inc hl			;8594
	ld (ix+009h),000h		;8595
	ld a,(hl)			;8599
	ld (ix+00ah),a		;859a
	ld (ix+00bh),001h		;859d
	ld a,012h		;85a1
	call 0427ch		;85a3
	jp 053dah		;85a6

; ----------------------------------------------------------------------
; DATOS velocidad_de_la_granada: 4 parejas [dx][dy] por direccion (p02:8586 ->
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


L_85B1:
	ld a,(ix+001h)		;85b1
	call 041eah		;85b4

; ----------------------------------------------------------------------
; DATOS tabla_85B7: 2 destinos del despachador p00:41EA (call en p02:85B4, el
;   indice en A): 85BB, 8613; lo leen p02:85B4 (4 bytes)
;   0x85b7..0x85bb  (4 bytes)
DATA_tabla_85B7:
	defw 085bbh,08613h	; 85b7  -> L_85BB L_8613

; ======================================================================
; CODIGO 0x85bb..0x85e3  (40 bytes)
; ======================================================================


L_85BB:
	dec (ix+002h)		;85bb
	jp z,L_85FC		;85be
	call L_81E2		;85c1
	ld a,(ix+002h)		;85c4
	ld hl,085e3h		;85c7
	call 041e0h		;85ca
	ld h,(hl)			;85cd
	ld l,000h		;85ce
	ld e,(ix+00dh)		;85d0
	ld d,(ix+00eh)		;85d3
	add hl,de			;85d6
	ld (ix+003h),l		;85d7
	ld (ix+004h),h		;85da
	call L_820C		;85dd
	jp 053dah		;85e0

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


L_85FC:
	ld a,01ah		;85fc
	call 0427ch		;85fe
	inc (ix+001h)		;8601
	ld (ix+002h),00fh		;8604
	ld (ix+00bh),003h		;8608
	ld (ix+00fh),001h		;860c
	jp L_804F		;8610
L_8613:
	ld (ix+00fh),000h		;8613
	dec (ix+002h)		;8617
	jp z,L_821F		;861a
	ld a,(ix+002h)		;861d
	cp 00ah		;8620
	ld c,003h		;8622
	jr nc,L_862C		;8624
	cp 005h		;8626
	inc c			;8628
	jr nc,L_862C		;8629
	inc c			;862b
L_862C:
	ld (ix+00bh),c		;862c
	jp 053dah		;862f
L_8632:
	ld a,(0c006h)		;8632
	and 010h		;8635
	ret z			;8637
	ld a,004h		;8638
	call 043e8h		;863a
	inc hl			;863d
	ld (0ec00h),hl		;863e
	ld a,(hl)			;8641
	inc hl			;8642
	or (hl)			;8643
	ret z			;8644
	ld a,(0c200h)		;8645
	and a			;8648
	ret nz			;8649
	ld ix,0c200h		;864a
	call L_80E9		;864e
	ret nc			;8651
	ld hl,(0ec00h)		;8652
	ld c,000h		;8655
	call 04613h		;8657
	ld (ix+00fh),001h		;865a
	ld a,(0c182h)		;865e
	ld (ix+003h),000h		;8661
	ld (ix+00dh),000h		;8665
	ld (ix+00eh),a		;8669
	sub 010h		;866c
	ld (ix+004h),a		;866e
	ld a,(0c184h)		;8671
	ld (ix+005h),000h		;8674
	ld (ix+006h),a		;8678
	ld a,(0c185h)		;867b
	ld (ix+00ch),a		;867e
	ld hl,086aah		;8681
	call 041deh		;8684
	ld (ix+007h),000h		;8687
	ld a,(hl)			;868b
	ld (ix+008h),a		;868c
	inc hl			;868f
	ld (ix+009h),000h		;8690
	ld a,(hl)			;8694
	ld (ix+00ah),a		;8695
	ld (ix+00bh),002h		;8698
	ld a,013h		;869c
	call 0427ch		;869e
	ld de,063a0h		;86a1
	call 04c2eh		;86a4
	jp 053dah		;86a7

; ----------------------------------------------------------------------
; DATOS velocidad_del_cohete: 4 parejas [dx][dy] por direccion (p02:8684 ->
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


L_86B2:
	ld a,(ix+001h)		;86b2
	call 041eah		;86b5

; ----------------------------------------------------------------------
; DATOS tabla_86B8: 3 destinos del despachador p00:41EA (call en p02:86B5, el
;   indice en A): 86BE, 86D4, 878D; lo leen p02:86B5 (6 bytes)
;   0x86b8..0x86be  (6 bytes)
DATA_tabla_86B8:
	defw 086beh,086d4h,0878dh	; 86b8  -> L_86BE L_86D4 L_878D

; ======================================================================
; CODIGO 0x86be..0x8753  (149 bytes)
; ======================================================================


L_86BE:
	call L_81BB		;86be
	call L_81E5		;86c1
	call L_81F9		;86c4
	jr nc,L_86CE		;86c7
	call L_81FE		;86c9
	jr c,L_86E8		;86cc
L_86CE:
	call L_820C		;86ce
	jp 053dah		;86d1
L_86D4:
	ld a,01ah		;86d4
	call 0427ch		;86d6
	ld (ix+002h),00fh		;86d9
	ld (ix+00bh),007h		;86dd
	ld (ix+00fh),000h		;86e1
	call L_804F		;86e5
L_86E8:
	inc (ix+001h)		;86e8
	ret			;86eb
L_86EC:
	ld a,(0c006h)		;86ec
	and 010h		;86ef
	ret z			;86f1
	ld a,005h		;86f2
	call 043e8h		;86f4
	inc hl			;86f7
	ld (0ec00h),hl		;86f8
	ld a,(hl)			;86fb
	inc hl			;86fc
	or (hl)			;86fd
	ret z			;86fe
	ld a,(0c200h)		;86ff
	and a			;8702
	ret nz			;8703
	ld ix,0c200h		;8704
	call L_80E9		;8708
	ret nc			;870b
	ld hl,(0ec00h)		;870c
	ld c,001h		;870f
	call 04613h		;8711
	ld (ix+002h),030h		;8714
	ld (ix+00fh),000h		;8718
	ld a,(0c185h)		;871c
	dec a			;871f
	add a,a			;8720
	add a,a			;8721
	ld de,08753h		;8722
	call 041e5h		;8725
	ld a,(de)			;8728
	ld c,a			;8729
	inc de			;872a
	ld a,(de)			;872b
	ld b,a			;872c
	inc de			;872d
	ld hl,(0c181h)		;872e
	add hl,bc			;8731
	ld (ix+003h),l		;8732
	ld (ix+004h),h		;8735
	ld a,(de)			;8738
	ld c,a			;8739
	inc de			;873a
	ld a,(de)			;873b
	ld b,a			;873c
	ld hl,(0c183h)		;873d
	add hl,bc			;8740
	ld (ix+005h),l		;8741
	ld (ix+006h),h		;8744
	ld (ix+00bh),006h		;8747
	ld a,017h		;874b
	call 0427ch		;874d
	jp 053dah		;8750

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


L_8763:
	ld a,(ix+001h)		;8763
	call 041eah		;8766

; ----------------------------------------------------------------------
; DATOS tabla_8769: 3 destinos del despachador p00:41EA (call en p02:8766, el
;   indice en A): 876F, 8779, 878D; lo leen p02:8766 (6 bytes)
;   0x8769..0x876f  (6 bytes)
DATA_tabla_8769:
	defw 0876fh,08779h,0878dh	; 8769  -> L_876F L_8779 L_878D

; ======================================================================
; CODIGO 0x876f..0x87f9  (138 bytes)
; ======================================================================


L_876F:
	dec (ix+002h)		;876f
	ret nz			;8772
	ld (ix+00fh),001h		;8773
	jr L_8789		;8777
L_8779:
	ld a,01ch		;8779
	call 0427ch		;877b
	ld (ix+002h),00fh		;877e
	ld (ix+00bh),007h		;8782
	call L_804F		;8786
L_8789:
	inc (ix+001h)		;8789
	ret			;878c
L_878D:
	ld (ix+00fh),000h		;878d
	dec (ix+002h)		;8791
	jp z,L_821F		;8794
	ld a,(ix+002h)		;8797
	ld c,007h		;879a
	cp 00ah		;879c
	jr nc,L_87A6		;879e
	inc c			;87a0
	cp 005h		;87a1
	jr nc,L_87A6		;87a3
	inc c			;87a5
L_87A6:
	ld (ix+00bh),c		;87a6
	jp 053dah		;87a9
L_87AC:
	ld a,(0c006h)		;87ac
	and 010h		;87af
	ret z			;87b1
	ld a,006h		;87b2
	call 043e8h		;87b4
	inc hl			;87b7
	ld (0ec00h),hl		;87b8
	ld a,(hl)			;87bb
	inc hl			;87bc
	or (hl)			;87bd
	ret z			;87be
	call L_80D2		;87bf
	ret nc			;87c2
	call L_80E9		;87c3
	ret nc			;87c6
	ld hl,(0ec00h)		;87c7
	ld c,001h		;87ca
	call 04613h		;87cc
	ld (ix+00fh),001h		;87cf
	ld a,(0c182h)		;87d3
	ld (ix+004h),a		;87d6
	ld (ix+003h),000h		;87d9
	ld a,(0c184h)		;87dd
	ld (ix+006h),a		;87e0
	ld (ix+005h),000h		;87e3
	ld (ix+00bh),00ah		;87e7
	ld a,017h		;87eb
	call 0427ch		;87ed
	jp 053dah		;87f0
L_87F3:
	ld a,(ix+001h)		;87f3
	call 041eah		;87f6

; ----------------------------------------------------------------------
; DATOS tabla_87F9: 3 destinos del despachador p00:41EA (call en p02:87F6, el
;   indice en A): 8816, 87FF, 8613; lo leen p02:87F6 (6 bytes)
;   0x87f9..0x87ff  (6 bytes)
DATA_tabla_87F9:
	defw 08816h,087ffh,08613h	; 87f9  -> L_8816 L_87FF L_8613

; ======================================================================
; CODIGO 0x87ff..0x888f  (144 bytes)
; ======================================================================


L_87FF:
	ld a,01ch		;87ff
	call 0427ch		;8801
	inc (ix+001h)		;8804
	ld (ix+00fh),000h		;8807
	ld (ix+002h),00fh		;880b
	ld (ix+00bh),003h		;880f
	call L_804F		;8813
L_8816:
	ret			;8816
L_8817:
	ld a,(0c006h)		;8817
	and 010h		;881a
	ret z			;881c
	ld a,007h		;881d
	call 043e8h		;881f
	inc hl			;8822
	ld (0ec00h),hl		;8823
	ld a,(hl)			;8826
	inc hl			;8827
	or (hl)			;8828
	ret z			;8829
	ld a,(0c200h)		;882a
	and a			;882d
	ret nz			;882e
	ld ix,0c200h		;882f
	call L_80E9		;8833
	ret nc			;8836
	ld hl,(0ec00h)		;8837
	ld c,001h		;883a
	call 04613h		;883c
	ld (ix+00fh),001h		;883f
	ld a,(0c182h)		;8843
	ld (ix+003h),000h		;8846
	ld (ix+00dh),000h		;884a
	ld (ix+00eh),a		;884e
	sub 010h		;8851
	ld (ix+004h),a		;8853
	ld a,(0c184h)		;8856
	ld (ix+005h),000h		;8859
	ld (ix+006h),a		;885d
	ld a,014h		;8860
	call 0427ch		;8862
	ld a,(0c185h)		;8865
L_8868:
	ld (ix+00ch),a		;8868
	ld hl,0888fh		;886b
	call 041deh		;886e
	ld (ix+007h),000h		;8871
	ld a,(hl)			;8875
	ld (ix+008h),a		;8876
	inc hl			;8879
	ld (ix+009h),000h		;887a
	ld a,(hl)			;887e
	ld (ix+00ah),a		;887f
	ld (ix+00bh),00bh		;8882
	ld de,063a8h		;8886
	call 04c2eh		;8889
	jp 053dah		;888c

; ----------------------------------------------------------------------
; DATOS velocidad_888f: 4 parejas [dx][dy] por direccion (p02:886E -> L_41DE)
;   0x888f..0x8897  (8 bytes)
DATA_velocidad_888f:
	defb 0fch,000h	; 888f
	defb 004h,000h	; 8891
	defb 000h,0fch	; 8893
	defb 000h,004h	; 8895

; ======================================================================
; CODIGO 0x8897..0x889d  (6 bytes)
; ======================================================================


L_8897:
	ld a,(ix+001h)		;8897
	call 041eah		;889a

; ----------------------------------------------------------------------
; DATOS tabla_889D: 3 destinos del despachador p00:41EA (call en p02:889A, el
;   indice en A): 88A3, 88D7, 878D; lo leen p02:889A (6 bytes)
;   0x889d..0x88a3  (6 bytes)
DATA_tabla_889D:
	defw 088a3h,088d7h,0878dh	; 889d  -> L_88A3 L_88D7 L_878D

; ======================================================================
; CODIGO 0x88a3..0x8a11  (366 bytes)
; ======================================================================


L_88A3:
	ld a,(0c006h)		;88a3
	rra			;88a6
	ld c,001h		;88a7
	jr c,L_88B7		;88a9
	inc c			;88ab
	rra			;88ac
	jr c,L_88B7		;88ad
	inc c			;88af
	rra			;88b0
	jr c,L_88B7		;88b1
	inc c			;88b3
	rra			;88b4
	jr nc,L_88BB		;88b5
L_88B7:
	ld a,c			;88b7
	call L_8868		;88b8
L_88BB:
	call L_81BB		;88bb
	call L_81E5		;88be
	call L_81F9		;88c1
	jr nc,L_88CB		;88c4
	call L_81FE		;88c6
	jr c,L_88EB		;88c9
L_88CB:
	call L_820C		;88cb
	ld de,063a8h		;88ce
	call 04c2eh		;88d1
	jp 053dah		;88d4
L_88D7:
	ld a,01ah		;88d7
	call 0427ch		;88d9
	ld (ix+00fh),000h		;88dc
	ld (ix+002h),00fh		;88e0
	ld (ix+00bh),007h		;88e4
	call L_804F		;88e8
L_88EB:
	inc (ix+001h)		;88eb
	ret			;88ee
L_88EF:
	ld a,(0c151h)		;88ef
	cp 009h		;88f2
	ret z			;88f4
	call L_8C33		;88f5
	call L_892E		;88f8
	call L_8B8A		;88fb
	call L_8BBE		;88fe
	call L_8C05		;8901
	ld a,(0c151h)		;8904
	cp 009h		;8907
	ret z			;8909
	call 0785bh		;890a
	call L_8D4B		;890d
	ld a,(0c5b9h)		;8910
	and a			;8913
	ret nz			;8914
	ld a,(0c130h)		;8915
	cp 008h		;8918
	ret nz			;891a
	ld a,(0c184h)		;891b
	cp 0d0h		;891e
	ret nc			;8920
	cp 0c0h		;8921
	ret c			;8923
	ld a,00bh		;8924
	ld (0c151h),a		;8926
	xor a			;8929
	ld (0c900h),a		;892a
	ret			;892d
L_892E:
	xor a			;892e
	ld (0c15eh),a		;892f
	ld ix,0d000h		;8932
	ld a,(0c182h)		;8936
	ld e,a			;8939
	ld a,(0c184h)		;893a
	ld d,a			;893d
	ld b,010h		;893e
L_8940:
	push bc			;8940
	push de			;8941
	ld a,(ix+000h)		;8942
	bit 7,a		;8945
	jr nz,L_894D		;8947
	and a			;8949
	call nz,L_8957		;894a
L_894D:
	ld de,00080h		;894d
	add ix,de		;8950
	pop de			;8952
	pop bc			;8953
	djnz L_8940		;8954
	ret			;8956
L_8957:
	ld a,(ix+01eh)		;8957
	and 01fh		;895a
	ld (ix+01eh),a		;895c
	ld a,(ix+000h)		;895f
	cp 023h		;8962
	jp z,L_8A80		;8964
	bit 0,(ix+00eh)		;8967
	ret z			;896b
	cp 010h		;896c
	jp z,L_8AF8		;896e
	cp 036h		;8971
	jp z,L_8B39		;8973
	ld a,(0c006h)		;8976
	and 020h		;8979
	jr z,L_8989		;897b
	ld a,(0c18bh)		;897d
	dec a			;8980
	call z,L_8A1D		;8981
	bit 6,(ix+01eh)		;8984
	ret nz			;8988
L_8989:
	ld a,(ix+000h)		;8989
	ld hl,089d3h		;898c
	call 043a3h		;898f
	ld l,a			;8992
	inc a			;8993
	ret z			;8994
	push de			;8995
	call 043b4h		;8996
	pop de			;8999
	call L_8A67		;899a
	ret nc			;899d
	ld a,(ix+000h)		;899e
	sub 002h		;89a1
	jp z,L_8AEE		;89a3
	ld a,(ix+01fh)		;89a6
	and a			;89a9
	ret nz			;89aa
	set 7,(ix+01eh)		;89ab
	ld a,(ix+000h)		;89af
	cp 007h		;89b2
	jr nz,L_89BA		;89b4
	ld (ix+00dh),000h		;89b6
L_89BA:
	ld a,(ix+000h)		;89ba
	cp 01fh		;89bd
	jr nz,L_89CB		;89bf
	ld a,001h		;89c1
	ld (0c139h),a		;89c3
L_89C6:
	ld a,010h		;89c6
	jp 04284h		;89c8
L_89CB:
	ld a,(ix+000h)		;89cb
	cp 031h		;89ce
	jr c,L_89D8		;89d0
	cp 035h		;89d2
	ret c			;89d4
	cp 037h		;89d5
	ret z			;89d7
L_89D8:
	ld a,(0c199h)		;89d8
	and a			;89db
	ret nz			;89dc
	call L_89C6		;89dd
	ld a,020h		;89e0
	ld (0c199h),a		;89e2
	ld hl,08a14h		;89e5
	ld (0ec00h),hl		;89e8
	ld a,(ix+000h)		;89eb
	push af			;89ee
	dec a			;89ef
	call 04396h		;89f0
	ld b,a			;89f3
	pop af			;89f4
	cp 02bh		;89f5
	jr z,L_8A05		;89f7
	cp 02fh		;89f9
	jr z,L_8A05		;89fb
	cp 03ah		;89fd
	jr c,L_8A0E		;89ff
	cp 03fh		;8a01
	jr nc,L_8A0E		;8a03
L_8A05:
	ld a,(0c135h)		;8a05
	cp 001h		;8a08
	jr nz,L_8A0E		;8a0a
	srl b		;8a0c
L_8A0E:
	jp L_902B		;8a0e

; ----------------------------------------------------------------------
; DATOS tipos_8a11: 12 tipos de actor (4, 5, 0x1E, 0xA, 0xB, 0xD, 0xE, 0x13,
;   0x18, 0x1C, 0x30, 0x37) que p02:8A25 compara con (ix+0) (B = 12)
;   0x8a11..0x8a1d  (12 bytes)
DATA_tipos_8a11:
	defb 004h,005h,01eh,00ah,00bh,00dh,00eh,013h,018h,01ch,030h,037h	; 8a11  ..........07

; ======================================================================
; CODIGO 0x8a1d..0x8a5b  (62 bytes)
; ======================================================================


L_8A1D:
	ld a,(ix+000h)		;8a1d
	ld b,00ch		;8a20
	ld hl,08a11h		;8a22
L_8A25:
	cp (hl)			;8a25
	jr z,L_8A2C		;8a26
	inc hl			;8a28
	djnz L_8A25		;8a29
	ret			;8a2b
L_8A2C:
	ld a,(0c185h)		;8a2c
	dec a			;8a2f
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
	call L_8A67		;8a44
	ret nc			;8a47
	ld a,(ix+01fh)		;8a48
	cp 038h		;8a4b
	ret nc			;8a4d
	ld (ix+01fh),000h		;8a4e
	set 6,(ix+01eh)		;8a52
	ld a,008h		;8a56
	jp 04284h		;8a58

; ----------------------------------------------------------------------
; DATOS alcance_del_punetazo: 4 parejas [dx][dy] que p02:8A67 usa segun la
;   direccion (0xC185): 0x8A5B arriba, 0x8A61 abajo, 0x8A5D izquierda y 0x8A63
;   derecha (p02:8A30-8A41); se solapan
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


L_8A67:
	ld a,(ix+003h)		;8a67
	add a,(hl)			;8a6a
	inc hl			;8a6b
	sub e			;8a6c
	jr nc,L_8A71		;8a6d
	neg		;8a6f
L_8A71:
	cp (hl)			;8a71
	ret nc			;8a72
	inc hl			;8a73
	ld a,(ix+005h)		;8a74
	add a,(hl)			;8a77
	inc hl			;8a78
	sub d			;8a79
	jr nc,L_8A7E		;8a7a
	neg		;8a7c
L_8A7E:
	cp (hl)			;8a7e
	ret			;8a7f
L_8A80:
	bit 0,(ix+001h)		;8a80
	ret z			;8a84
	bit 0,(ix+016h)		;8a85
	jr nz,L_8AAA		;8a89
	ld a,d			;8a8b
	sub (ix+005h)		;8a8c
	jr nc,L_8A93		;8a8f
	neg		;8a91
L_8A93:
	cp 004h		;8a93
	ret nc			;8a95
	ld a,(ix+015h)		;8a96
	srl a		;8a99
	ld b,a			;8a9b
	add a,008h		;8a9c
	add a,(ix+003h)		;8a9e
	sub e			;8aa1
	jr nc,L_8AA6		;8aa2
	neg		;8aa4
L_8AA6:
	cp b			;8aa6
	ret nc			;8aa7
	jr L_8AC5		;8aa8
L_8AAA:
	ld a,e			;8aaa
	sub (ix+003h)		;8aab
	jr nc,L_8AB2		;8aae
	neg		;8ab0
L_8AB2:
	cp 004h		;8ab2
	ret nc			;8ab4
	ld a,(ix+015h)		;8ab5
	srl a		;8ab8
	ld b,a			;8aba
	add a,(ix+005h)		;8abb
	sub d			;8abe
	jr nc,L_8AC3		;8abf
	neg		;8ac1
L_8AC3:
	cp b			;8ac3
	ret nc			;8ac4
L_8AC5:
	set 7,(ix+01eh)		;8ac5
	ld a,05ah		;8ac9
	call 07d27h		;8acb
	push ix		;8ace
	call 07707h		;8ad0
	call L_8AD9		;8ad3
	pop ix		;8ad6
	ret			;8ad8
L_8AD9:
	ld ix,0d000h		;8ad9
	ld b,010h		;8add
L_8ADF:
	ld a,(ix+000h)		;8adf
	and a			;8ae2
	call nz,07371h		;8ae3
	ld de,00080h		;8ae6
	add ix,de		;8ae9
	djnz L_8ADF		;8aeb
	ret			;8aed
L_8AEE:
	ld a,001h		;8aee
	ld (0c15eh),a		;8af0
	set 7,(ix+01eh)		;8af3
	ret			;8af7
L_8AF8:
	bit 2,(ix+00eh)		;8af8
	jr nz,L_8B1E		;8afc
	ld b,(ix+015h)		;8afe
	srl b		;8b01
	ld a,(ix+013h)		;8b03
	add a,b			;8b06
	sub e			;8b07
	jr nc,L_8B0C		;8b08
	neg		;8b0a
L_8B0C:
	cp b			;8b0c
	ret nc			;8b0d
	ld a,(ix+014h)		;8b0e
	add a,b			;8b11
	sub d			;8b12
	jr nc,L_8B17		;8b13
	neg		;8b15
L_8B17:
	cp b			;8b17
	ret nc			;8b18
	ld b,0ffh		;8b19
	jp L_902B		;8b1b
L_8B1E:
	ld a,(ix+003h)		;8b1e
	sub e			;8b21
	jr nc,L_8B26		;8b22
	neg		;8b24
L_8B26:
	cp 028h		;8b26
	ret nc			;8b28
	ld a,(ix+005h)		;8b29
	sub d			;8b2c
	jr nc,L_8B31		;8b2d
	neg		;8b2f
L_8B31:
	cp 028h		;8b31
	ret nc			;8b33
	set 7,(ix+01eh)		;8b34
	ret			;8b38
L_8B39:
	ld a,(ix+005h)		;8b39
	sub d			;8b3c
	jr nc,L_8B41		;8b3d
	neg		;8b3f
L_8B41:
	cp 008h		;8b41
	ret nc			;8b43
	ld a,(0c130h)		;8b44
	cp 06fh		;8b47
	jr nz,L_8B56		;8b49
	ld a,(ix+00ch)		;8b4b
	cp 008h		;8b4e
	jr c,L_8B59		;8b50
	ld a,007h		;8b52
	jr L_8B59		;8b54
L_8B56:
	ld a,(ix+00ch)		;8b56
L_8B59:
	cp 00ch		;8b59
	ret z			;8b5b
	and a			;8b5c
	ret z			;8b5d
	ld hl,08b7eh		;8b5e
	dec a			;8b61
	cp 00ch		;8b62
	ld d,00ch		;8b64
	jr nc,L_8B6C		;8b66
	call 041e0h		;8b68
	ld d,(hl)			;8b6b
L_8B6C:
	ld a,d			;8b6c
	add a,a			;8b6d
	add a,a			;8b6e
	add a,a			;8b6f
	ld d,a			;8b70
	add a,(ix+003h)		;8b71
	sub e			;8b74
	jr nc,L_8B79		;8b75
	neg		;8b77
L_8B79:
	cp d			;8b79
	ret nc			;8b7a
	jp L_89CB		;8b7b

; ----------------------------------------------------------------------
; DATOS tabla_8b7e: 12 bytes (1, 1, 2, 3, 4 ... 0xB) que p02:8B5E lee en
;   0x8B7E + A - 1 cuando A es menor que 12
;   0x8b7e..0x8b8a  (12 bytes)
DATA_tabla_8b7e:
	defb 001h,001h,002h,003h,004h,005h,006h,007h,008h,009h,00ah,00bh	; 8b7e  ............

; ======================================================================
; CODIGO 0x8b8a..0x8c2a  (160 bytes)
; ======================================================================


L_8B8A:
	ld a,(0c130h)		;8b8a
	cp 02dh		;8b8d
	jr z,L_8B94		;8b8f
	cp 02eh		;8b91
	ret nz			;8b93
L_8B94:
	ld a,(0c15eh)		;8b94
	and a			;8b97
	ret nz			;8b98
	call L_82FB		;8b99
	dec h			;8b9c
	ret nz			;8b9d
	dec l			;8b9e
	ret nz			;8b9f
	ld a,(0c130h)		;8ba0
	cp 02dh		;8ba3
	ld a,05bh		;8ba5
	ld c,001h		;8ba7
	jr z,L_8BAE		;8ba9
	ld a,081h		;8bab
	inc c			;8bad
L_8BAE:
	ld (0c4fch),a		;8bae
	ld a,c			;8bb1
	ld (0c162h),a		;8bb2
	xor a			;8bb5
	ld (0c4fdh),a		;8bb6
	inc a			;8bb9
	ld (0c151h),a		;8bba
	ret			;8bbd
L_8BBE:
	ld a,(0c130h)		;8bbe
	cp 010h		;8bc1
	ld bc,06061h		;8bc3
	jr z,L_8BDD		;8bc6
	cp 025h		;8bc8
	jr z,L_8BDD		;8bca
	cp 06eh		;8bcc
	jr z,L_8BDD		;8bce
	cp 028h		;8bd0
	ld bc,04546h		;8bd2
	jr z,L_8BDD		;8bd5
	cp 074h		;8bd7
	ld bc,04041h		;8bd9
	ret nz			;8bdc
L_8BDD:
	ld a,(0c616h)		;8bdd
	and a			;8be0
	ret z			;8be1
	push bc			;8be2
	call L_82FB		;8be3
	pop bc			;8be6
	ld a,h			;8be7
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
	ld a,(0c199h)		;8bf4
	and a			;8bf7
	ret nz			;8bf8
	ld a,018h		;8bf9
	call 04284h		;8bfb
	ld a,008h		;8bfe
	ld (0c199h),a		;8c00
	jr L_8C25		;8c03
L_8C05:
	ld a,(0c130h)		;8c05
	ld b,009h		;8c08
	ld hl,08c2ah		;8c0a
L_8C0D:
	cp (hl)			;8c0d
	jr z,L_8C14		;8c0e
	inc hl			;8c10
	djnz L_8C0D		;8c11
	ret			;8c13
L_8C14:
	ld a,(0c135h)		;8c14
	cp 005h		;8c17
	ret z			;8c19
	ld c,010h		;8c1a
L_8C1C:
	ld a,(0c199h)		;8c1c
	and a			;8c1f
	ret nz			;8c20
	ld a,c			;8c21
	ld (0c199h),a		;8c22
L_8C25:
	ld b,002h		;8c25
	jp L_902B		;8c27

; ----------------------------------------------------------------------
; DATOS salas_8c2a: 9 numeros de sala (0x1D, 0x5E, 0x60, 0x61, 0x62, 0x64,
;   0x65, 0x70, 0x72) que p02:8C0D compara con 0xC130
;   0x8c2a..0x8c33  (9 bytes)
DATA_salas_8c2a:
	defb 01dh,05eh,060h,061h,062h,064h,065h,070h,072h	; 8c2a  .^`abdepr

; ======================================================================
; CODIGO 0x8c33..0x8d3b  (264 bytes)
; ======================================================================


L_8C33:
	ld a,(0c142h)		;8c33
	and a			;8c36
	ret z			;8c37
	ld hl,08951h		;8c38
	cp 003h		;8c3b
	jr c,L_8C4A		;8c3d
	cp 004h		;8c3f
	jr z,L_8C4A		;8c41
	cp 007h		;8c43
	jr z,L_8C4A		;8c45
	ld hl,08992h		;8c47
L_8C4A:
	ld (0ec02h),hl		;8c4a
	call 04384h		;8c4d
	ld b,a			;8c50
	ld ix,0c200h		;8c51
L_8C55:
	push bc			;8c55
	ld a,(ix+000h)		;8c56
	and a			;8c59
	call nz,L_8C66		;8c5a
	ld de,00040h		;8c5d
	add ix,de		;8c60
	pop bc			;8c62
	djnz L_8C55		;8c63
	ret			;8c65
L_8C66:
	ld a,(ix+00fh)		;8c66
	rra			;8c69
	ret nc			;8c6a
	ld iy,0d000h		;8c6b
	ld b,010h		;8c6f
L_8C71:
	push bc			;8c71
	ld a,(iy+000h)		;8c72
	and a			;8c75
	call nz,L_8C82		;8c76
	ld de,00080h		;8c79
	add iy,de		;8c7c
	pop bc			;8c7e
	djnz L_8C71		;8c7f
	ret			;8c81
L_8C82:
	bit 1,(iy+00eh)		;8c82
	ret z			;8c86
	ld a,(iy+000h)		;8c87
	ld hl,(0ec02h)		;8c8a
	call 043a3h		;8c8d
	inc a			;8c90
	ret z			;8c91
	call 043b4h		;8c92
	ld a,(iy+01eh)		;8c95
	and 0e0h		;8c98
	ld (iy+01eh),a		;8c9a
	ld a,(iy+003h)		;8c9d
	add a,(hl)			;8ca0
	inc hl			;8ca1
	sub (ix+004h)		;8ca2
	jr nc,L_8CA9		;8ca5
	neg		;8ca7
L_8CA9:
	cp (hl)			;8ca9
	ret nc			;8caa
	inc hl			;8cab
	ld a,(iy+005h)		;8cac
	add a,(hl)			;8caf
	inc hl			;8cb0
	sub (ix+006h)		;8cb1
	jr nc,L_8CB8		;8cb4
	neg		;8cb6
L_8CB8:
	cp (hl)			;8cb8
	ret nc			;8cb9
	ld c,(ix+001h)		;8cba
	ld a,(ix+000h)		;8cbd
	cp 004h		;8cc0
	jr z,L_8CCC		;8cc2
	cp 006h		;8cc4
	jr z,L_8CCC		;8cc6
	cp 007h		;8cc8
	jr nz,L_8CD3		;8cca
L_8CCC:
	inc c			;8ccc
	dec c			;8ccd
	jr nz,L_8CD3		;8cce
	inc (ix+001h)		;8cd0
L_8CD3:
	ld a,(ix+000h)		;8cd3
	or (iy+01eh)		;8cd6
	ld (iy+01eh),a		;8cd9
	ld a,(iy+000h)		;8cdc
	dec a			;8cdf
	call 04396h		;8ce0
	ld c,a			;8ce3
	inc a			;8ce4
	jr z,L_8D32		;8ce5
	ld a,(0c142h)		;8ce7
	cp 005h		;8cea
	jr nz,L_8D28		;8cec
	ld a,(iy+000h)		;8cee
	cp 011h		;8cf1
	jr nz,L_8D28		;8cf3
	ld a,(ix+001h)		;8cf5
	dec a			;8cf8
	jr nz,L_8D32		;8cf9
	ld a,(iy+005h)		;8cfb
	cp (ix+006h)		;8cfe
	ld a,001h		;8d01
	jr nc,L_8D06		;8d03
	inc a			;8d05
L_8D06:
	ld de,0c1ceh		;8d06
	ld hl,0c1cdh		;8d09
	ld bc,0000fh		;8d0c
	lddr		;8d0f
	ld (de),a			;8d11
	ld hl,08d3bh		;8d12
	ld b,010h		;8d15
L_8D17:
	ld a,(de)			;8d17
	cp (hl)			;8d18
	jr nz,L_8D32		;8d19
	inc de			;8d1b
	inc hl			;8d1c
	djnz L_8D17		;8d1d
	xor a			;8d1f
	ld (0d08dh),a		;8d20
	ld (0d10dh),a		;8d23
	ld c,002h		;8d26
L_8D28:
	ld a,(iy+00dh)		;8d28
	sub c			;8d2b
	jr nc,L_8D2F		;8d2c
	xor a			;8d2e
L_8D2F:
	ld (iy+00dh),a		;8d2f
L_8D32:
	ld a,(ix+000h)		;8d32
	cp 003h		;8d35
	jp c,L_821F		;8d37
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


L_8D4B:
	ld hl,0c5d0h		;8d4b
	ld a,(0c182h)		;8d4e
	ld e,a			;8d51
	ld a,(0c184h)		;8d52
	ld d,a			;8d55
	ld bc,00300h		;8d56
L_8D59:
	push hl			;8d59
	push de			;8d5a
	push bc			;8d5b
	ld a,(hl)			;8d5c
	and a			;8d5d
	call nz,L_8D79		;8d5e
	ld a,(0c151h)		;8d61
	cp 00ah		;8d64
	jr nz,L_8D6D		;8d66
	pop bc			;8d68
	ld b,001h		;8d69
	jr L_8D6E		;8d6b
L_8D6D:
	pop bc			;8d6d
L_8D6E:
	pop de			;8d6e
	pop hl			;8d6f
	ld a,010h		;8d70
	call 041e0h		;8d72
	inc c			;8d75
	djnz L_8D59		;8d76
	ret			;8d78
L_8D79:
	push hl			;8d79
	pop ix		;8d7a
	ld a,c			;8d7c
	ld (0ec00h),a		;8d7d
	inc hl			;8d80
	bit 0,(hl)		;8d81
	ld bc,01014h		;8d83
	jr z,L_8D8B		;8d86
	ld bc,0080ch		;8d88
L_8D8B:
	inc hl			;8d8b
	ld a,(hl)			;8d8c
	add a,010h		;8d8d
	sub e			;8d8f
	jr nc,L_8D94		;8d90
	neg		;8d92
L_8D94:
	cp 010h		;8d94
	ret nc			;8d96
	inc hl			;8d97
	ld a,(hl)			;8d98
	add a,b			;8d99
	sub d			;8d9a
	jr nc,L_8D9F		;8d9b
	neg		;8d9d
L_8D9F:
	cp c			;8d9f
	ret nc			;8da0
	inc hl			;8da1
	ld a,(hl)			;8da2
	ld (0ec02h),a		;8da3
	dec hl			;8da6
	dec hl			;8da7
	dec hl			;8da8
	dec hl			;8da9
	ld a,(hl)			;8daa
	ld (0ec01h),a		;8dab
	cp 023h		;8dae
	jp z,L_8E9F		;8db0
	cp 008h		;8db3
	jr c,L_8E08		;8db5
	jr z,L_8DFD		;8db7
	call L_8F8F		;8db9
	ld a,(0ec01h)		;8dbc
	sub 008h		;8dbf
	cp 01ah		;8dc1
	jp z,L_8E76		;8dc3
	call 043e1h		;8dc6
	jr c,L_8DD1		;8dc9
	call L_8F1F		;8dcb
	jp L_8ED9		;8dce
L_8DD1:
	ld a,(0ec01h)		;8dd1
	sub 008h		;8dd4
	ld hl,0c530h		;8dd6
	ld b,019h		;8dd9
	ld c,a			;8ddb
L_8DDC:
	ld a,(hl)			;8ddc
	and a			;8ddd
	jr z,L_8DE8		;8dde
	ld a,004h		;8de0
	call 041e0h		;8de2
	djnz L_8DDC		;8de5
	ret			;8de7
L_8DE8:
	ld (hl),c			;8de8
	ld a,c			;8de9
	cp 008h		;8dea
	jr nz,L_8DF7		;8dec
	ld a,010h		;8dee
	ld (0c160h),a		;8df0
	xor a			;8df3
	ld (0c15fh),a		;8df4
L_8DF7:
	call L_8F1F		;8df7
	jp L_8ED9		;8dfa
L_8DFD:
	call L_8F8F		;8dfd
	ld a,008h		;8e00
	ld (0c51ch),a		;8e02
	jp L_8ED9		;8e05
L_8E08:
	call L_8F8F		;8e08
	ld a,(0ec01h)		;8e0b
	call 043e8h		;8e0e
	jr c,L_8E2B		;8e11
	push hl			;8e13
	call L_8F1F		;8e14
	pop hl			;8e17
	ld a,(0c134h)		;8e18
	ld c,a			;8e1b
	ld a,(0ec01h)		;8e1c
	cp c			;8e1f
	jp nz,L_8ED9		;8e20
	inc hl			;8e23
	inc hl			;8e24
	call 04795h		;8e25
	jp L_8ED9		;8e28
L_8E2B:
	ld a,(0ec01h)		;8e2b
	ld hl,0c500h		;8e2e
	ld b,007h		;8e31
	ld c,a			;8e33
L_8E34:
	ld a,(hl)			;8e34
	and a			;8e35
	jr z,L_8E40		;8e36
	ld a,004h		;8e38
	call 041e0h		;8e3a
	djnz L_8E34		;8e3d
	ret			;8e3f
L_8E40:
	ld (hl),c			;8e40
	push hl			;8e41
	ld a,b			;8e42
	cp 007h		;8e43
	jr nz,L_8E6D		;8e45
	ld a,c			;8e47
	cp 003h		;8e48
	jr z,L_8E6D		;8e4a
	ld (0c142h),a		;8e4c
	ld (0c134h),a		;8e4f
	call 04bech		;8e52
	ld hl,0ea10h		;8e55
	ld b,018h		;8e58
	ld a,0e0h		;8e5a
L_8E5C:
	ld (hl),a			;8e5c
	inc hl			;8e5d
	djnz L_8E5C		;8e5e
	ld hl,0c200h		;8e60
	ld de,0c201h		;8e63
	ld bc,0017fh		;8e66
	ld (hl),000h		;8e69
	ldir		;8e6b
L_8E6D:
	pop hl			;8e6d
	call L_8F1F		;8e6e
	call 04751h		;8e71
	jr L_8ED9		;8e74
L_8E76:
	xor a			;8e76
	ld (0c13bh),a		;8e77
	inc a			;8e7a
	ld (0c5b9h),a		;8e7b
	ld hl,0c530h		;8e7e
	ld b,019h		;8e81
L_8E83:
	ld a,(hl)			;8e83
	and a			;8e84
	jr z,L_8E8E		;8e85
	ld a,004h		;8e87
	call 041e0h		;8e89
	jr L_8E83		;8e8c
L_8E8E:
	ld (hl),017h		;8e8e
	inc hl			;8e90
	ld a,001h		;8e91
	ld (hl),a			;8e93
	ld (0c5b6h),a		;8e94
	call 04751h		;8e97
	call 04843h		;8e9a
	jr L_8ED9		;8e9d
L_8E9F:
	ld a,001h		;8e9f
	call 043e8h		;8ea1
	inc hl			;8ea4
	ld a,020h		;8ea5
	call nc,L_8F27		;8ea7
	ld a,002h		;8eaa
	call 043e8h		;8eac
	inc hl			;8eaf
	ld a,020h		;8eb0
	call nc,L_8F27		;8eb2
	ld a,003h		;8eb5
	call 043e8h		;8eb7
	inc hl			;8eba
	ld a,006h		;8ebb
	call nc,L_8F27		;8ebd
	ld a,004h		;8ec0
	call 043e8h		;8ec2
	inc hl			;8ec5
	ld a,002h		;8ec6
	call nc,L_8F27		;8ec8
	ld a,(0c134h)		;8ecb
	and a			;8ece
	jr z,L_8ED9		;8ecf
	call 043e8h		;8ed1
	inc hl			;8ed4
	inc hl			;8ed5
	call 04795h		;8ed6
L_8ED9:
	ld a,(0ec00h)		;8ed9
	and a			;8edc
	ld hl,0a0b0h		;8edd
	jr z,L_8EE9		;8ee0
	dec a			;8ee2
	ld l,0c0h		;8ee3
	jr z,L_8EE9		;8ee5
	ld l,0d0h		;8ee7
L_8EE9:
	bit 0,(ix+001h)		;8ee9
	ld bc,02010h		;8eed
	jr z,L_8EF4		;8ef0
	ld b,010h		;8ef2
L_8EF4:
	ld e,(ix+002h)		;8ef4
	ld d,(ix+003h)		;8ef7
	ld a,048h		;8efa
	call 05011h		;8efc
	ld c,(ix+000h)		;8eff
	ld (ix+000h),000h		;8f02
	ld a,024h		;8f06
	call 04284h		;8f08
	ld a,(0ec02h)		;8f0b
	and a			;8f0e
	ret nz			;8f0f
	ld a,c			;8f10
	ld hl,08ac5h		;8f11
	call 043a3h		;8f14
	and a			;8f17
	ret z			;8f18
	cp 03eh		;8f19
	ret nz			;8f1b
	jp 05ce1h		;8f1c
L_8F1F:
	inc hl			;8f1f
	ld a,(0ec01h)		;8f20
	dec a			;8f23
	call 043a9h		;8f24
L_8F27:
	add a,(hl)			;8f27
	daa			;8f28
	ld (hl),a			;8f29
	jr nc,L_8F2E		;8f2a
	inc hl			;8f2c
	inc (hl)			;8f2d
L_8F2E:
	ld a,001h		;8f2e
	call 043e8h		;8f30
	ld bc,(0c380h)		;8f33
	call nc,L_91DA		;8f37
	ld a,002h		;8f3a
	call 043e8h		;8f3c
	ld bc,(0c382h)		;8f3f
	call nc,L_91DA		;8f43
	ld a,003h		;8f46
	call 043e8h		;8f48
	ld bc,(0c384h)		;8f4b
	call nc,L_91DA		;8f4f
	ld a,004h		;8f52
	call 043e8h		;8f54
	ld bc,(0c386h)		;8f57
	call nc,L_91DA		;8f5b
	ld a,005h		;8f5e
	call 043e8h		;8f60
	ld bc,(0c388h)		;8f63
	call nc,L_91DA		;8f67
	ld a,006h		;8f6a
	call 043e8h		;8f6c
	ld bc,(0c38ah)		;8f6f
	call nc,L_91DA		;8f73
	ld a,007h		;8f76
	call 043e8h		;8f78
	ld bc,(0c38ch)		;8f7b
	call nc,L_91DA		;8f7f
	ld a,016h		;8f82
	call 043e1h		;8f84
	ld bc,(0c3bah)		;8f87
	call nc,L_91DA		;8f8b
	ret			;8f8e
L_8F8F:
	ld c,a			;8f8f
	cp 005h		;8f90
	jr c,L_8F9D		;8f92
	cp 008h		;8f94
	ret c			;8f96
	cp 01eh		;8f97
	ret z			;8f99
	cp 023h		;8f9a
	ret z			;8f9c
L_8F9D:
	cp 009h		;8f9d
	ld hl,0c520h		;8f9f
	jr c,L_8FA9		;8fa2
	sub 008h		;8fa4
	ld hl,0c5a0h		;8fa6
L_8FA9:
	dec a			;8fa9
	call 041e0h		;8faa
	ld (hl),001h		;8fad
	ret			;8faf
L_8FB0:
	xor a			;8fb0
	ld hl,0c120h		;8fb1
	ld bc,02b6fh		;8fb4
	ld d,h			;8fb7
	ld e,l			;8fb8
	inc e			;8fb9
	ld (hl),a			;8fba
	ldir		;8fbb
	ld (0c008h),a		;8fbd
	ret			;8fc0
L_8FC1:
	call L_9067		;8fc1
	call L_90AA		;8fc4
	call L_8FD0		;8fc7
	call 04751h		;8fca
	jp 04843h		;8fcd
L_8FD0:
	ld c,000h		;8fd0
	ld a,(0c15fh)		;8fd2
	dec a			;8fd5
	jr nz,L_8FF2		;8fd6
	ld a,(0c151h)		;8fd8
	sub 002h		;8fdb
	jr z,L_8FF2		;8fdd
	dec a			;8fdf
	jr z,L_8FF2		;8fe0
	ld a,(0c003h)		;8fe2
	bit 3,a		;8fe5
	jr nz,L_8FF2		;8fe7
	and 007h		;8fe9
	ld a,022h		;8feb
	call z,0427ch		;8fed
	ld c,0ffh		;8ff0
L_8FF2:
	ld a,(0c13ch)		;8ff2
	and a			;8ff5
	jr nz,L_8FFE		;8ff6
	ld hl,092cfh		;8ff8
	jp 05112h		;8ffb
L_8FFE:
	ld a,(0c922h)		;8ffe
	cp 004h		;9001
	ret nc			;9003
	ld c,001h		;9004
	ld de,070c1h		;9006
	ld a,(0c13eh)		;9009
	rra			;900c
	rra			;900d
	rra			;900e
	rra			;900f
	call 06b16h		;9010
	ld a,(0c13eh)		;9013
	call 06b16h		;9016
	ld a,(0c13dh)		;9019
	rra			;901c
	rra			;901d
	rra			;901e
	rra			;901f
	call 06b16h		;9020
	ld a,(0c13dh)		;9023
	jp 06b16h		;9026
L_9029:
	ld b,004h		;9029
L_902B:
	ld hl,0c131h		;902b
	ld a,(hl)			;902e
	and a			;902f
	jr z,L_903A		;9030
L_9032:
	dec (hl)			;9032
	jr z,L_903A		;9033
	djnz L_9032		;9035
	jp L_9067		;9037
L_903A:
	call L_9067		;903a
	ld a,003h		;903d
	ld (0c180h),a		;903f
	ld a,006h		;9042
	ld (0c18bh),a		;9044
	ld a,009h		;9047
	ld (0c151h),a		;9049
	ld a,080h		;904c
	ld (0c19dh),a		;904e
	xor a			;9051
	ld (0c199h),a		;9052
	ld hl,0ea10h		;9055
	ld de,0ea11h		;9058
	ld bc,00017h		;905b
	ld (hl),0e0h		;905e
	ldir		;9060
	ld a,044h		;9062
	jp 0427ch		;9064
L_9067:
	ld hl,092afh		;9067
	call 0510ch		;906a
	ld hl,031c1h		;906d
	ld de,03208h		;9070
	ld c,00eh		;9073
	call 04f63h		;9075
	ld a,(0c131h)		;9078
	and a			;907b
	jr z,L_908F		;907c
	dec a			;907e
	jr z,L_908F		;907f
	inc a			;9081
	ld hl,032c2h		;9082
	ld c,006h		;9085
	ld b,a			;9087
	ld d,000h		;9088
	ld a,088h		;908a
	call 04f91h		;908c
L_908F:
	ld a,(0c131h)		;908f
	cp 030h		;9092
	ret z			;9094
	cp 02fh		;9095
	ret z			;9097
	ld e,a			;9098
	ld c,032h		;9099
	add a,c			;909b
	ld h,a			;909c
	ld l,0c2h		;909d
	ld a,030h		;909f
	sub e			;90a1
	ld b,a			;90a2
	ld c,006h		;90a3
	xor a			;90a5
	ld d,a			;90a6
	jp 04f91h		;90a7
L_90AA:
	ld hl,092b6h		;90aa
	call 0510ch		;90ad
	ld de,034c9h		;90b0
	ld a,(0c132h)		;90b3
	inc a			;90b6
	ld c,03bh		;90b7
	call L_90C6		;90b9
	ld a,(0c132h)		;90bc
	sub 003h		;90bf
	ret z			;90c1
	neg		;90c2
	ld c,000h		;90c4
L_90C6:
	ld b,a			;90c6
L_90C7:
	ld a,c			;90c7
	call 05135h		;90c8
	ld a,d			;90cb
	add a,008h		;90cc
	ld d,a			;90ce
	djnz L_90C7		;90cf
	ret			;90d1
L_90D2:
	ld c,000h		;90d2
L_90D4:
	dec b			;90d4
	jr nz,L_90D9		;90d5
	ld c,0ffh		;90d7
L_90D9:
	inc b			;90d9
	ld a,(hl)			;90da
	rra			;90db
	rra			;90dc
	rra			;90dd
	rra			;90de
	call L_90F0		;90df
L_90E2:
	ld a,(hl)			;90e2
	call L_90F0		;90e3
	dec hl			;90e6
	djnz L_90D4		;90e7
	ret			;90e9
L_90EA:
	ld c,000h		;90ea
	ld b,002h		;90ec
	jr L_90E2		;90ee
L_90F0:
	and 00fh		;90f0
	jr z,L_90F6		;90f2
	ld c,0ffh		;90f4
L_90F6:
	add a,030h		;90f6
	and c			;90f8
	call 05135h		;90f9
	ld a,d			;90fc
	add a,008h		;90fd
	ld d,a			;90ff
	ret			;9100
L_9101:
	ld de,0c381h		;9101
	ld hl,0c380h		;9104
	ld bc,0004fh		;9107
	ld (hl),0ffh		;910a
	ldir		;910c
	ld a,(0c132h)		;910e
	and a			;9111
	ld hl,0918ah		;9112
	ld c,003h		;9115
	jr z,L_912E		;9117
	dec a			;9119
	ld hl,0919ah		;911a
	ld c,006h		;911d
	jr z,L_912E		;911f
	dec a			;9121
	ld hl,091aah		;9122
	ld c,009h		;9125
	jr z,L_912E		;9127
	ld hl,091bah		;9129
	ld c,012h		;912c
L_912E:
	ld a,c			;912e
	ld de,0c380h		;912f
	ld bc,00010h		;9132
	ldir		;9135
	ld l,a			;9137
	ld h,000h		;9138
	ld (0c3bah),hl		;913a
	ld a,(0c141h)		;913d
	rra			;9140
	jr nc,L_914E		;9141
	ld hl,091cah		;9143
	ld de,0c380h		;9146
	ld bc,00010h		;9149
	ldir		;914c
L_914E:
	rra			;914e
	jr nc,L_9157		;914f
	ld hl,00999h		;9151
	ld (0c3bah),hl		;9154
L_9157:
	ld a,016h		;9157
	call 043e1h		;9159
	jr nc,L_9165		;915c
	ld bc,(0c3bah)		;915e
	call L_91DA		;9162
L_9165:
	ld b,008h		;9165
	ld c,001h		;9167
	ld ix,0c380h		;9169
L_916D:
	ld a,c			;916d
	push bc			;916e
	push ix		;916f
	call 043e8h		;9171
	jr nc,L_917F		;9174
	ld c,(ix+000h)		;9176
	ld b,(ix+001h)		;9179
	call L_91DA		;917c
L_917F:
	pop ix		;917f
	pop bc			;9181
	inc c			;9182
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


L_91DA:
	inc hl			;91da
	ld e,(hl)			;91db
	inc hl			;91dc
	ld d,(hl)			;91dd
	ex de,hl			;91de
	and a			;91df
	sbc hl,bc		;91e0
	ret z			;91e2
	ret c			;91e3
	ex de,hl			;91e4
	ld (hl),b			;91e5
	dec hl			;91e6
	ld (hl),c			;91e7
	ret			;91e8
L_91E9:
	ld hl,0c160h		;91e9
	ld a,(hl)			;91ec
	and a			;91ed
	ret z			;91ee
	ld a,(0c15fh)		;91ef
	cp 002h		;91f2
	ret z			;91f4
	dec a			;91f5
	jr z,L_9201		;91f6
	dec (hl)			;91f8
	ret nz			;91f9
	ld (hl),058h		;91fa
	ld a,001h		;91fc
	ld (0c15fh),a		;91fe
L_9201:
	dec (hl)			;9201
	ret nz			;9202
	ld a,002h		;9203
	ld (0c15fh),a		;9205
	ret			;9208
L_9209:
	ld a,(0c13ch)		;9209
	and a			;920c
	ret z			;920d
	ld hl,0c13dh		;920e
	ld a,(hl)			;9211
	sub 001h		;9212
	daa			;9214
	ld (hl),a			;9215
	jr nc,L_921F		;9216
	inc hl			;9218
	ld a,(hl)			;9219
	sub 001h		;921a
	daa			;921c
	ld (hl),a			;921d
	dec hl			;921e
L_921F:
	ld a,(hl)			;921f
	inc hl			;9220
	or (hl)			;9221
	ret nz			;9222
	call L_8FD0		;9223
	xor a			;9226
	ld (0c131h),a		;9227
	jp L_903A		;922a
L_922D:
	ld de,0c500h		;922d
	ld b,006h		;9230
	jr L_9239		;9232
L_9234:
	ld de,0c530h		;9234
	ld b,018h		;9237
L_9239:
	ld a,(de)			;9239
	and a			;923a
	jr z,L_9245		;923b
	ld a,004h		;923d
	call 041e5h		;923f
	djnz L_9239		;9242
	ret			;9244
L_9245:
	push de			;9245
	pop hl			;9246
	ld a,004h		;9247
	call 041e0h		;9249
	ld a,(hl)			;924c
	and a			;924d
	jr nz,L_9253		;924e
	djnz L_9245		;9250
	ret			;9252
L_9253:
	push bc			;9253
	ld b,004h		;9254
L_9256:
	ld a,(hl)			;9256
	ld (de),a			;9257
	ld (hl),000h		;9258
	inc hl			;925a
	inc de			;925b
	djnz L_9256		;925c
	pop bc			;925e
	djnz L_9239		;925f
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


L_92DB:
	ld a,(0c130h)		;92db
	cp 0cch		;92de
	jp z,L_93EB		;92e0
	ld a,(0c4fch)		;92e3
	and a			;92e6
	jp nz,L_9353		;92e7
	ld a,(0c133h)		;92ea
	and a			;92ed
	ret z			;92ee
	call 042e6h		;92ef
	cp 0f0h		;92f2
	jp nc,L_9320		;92f4
	ld hl,0c130h		;92f7
	ld c,(hl)			;92fa
	ld (0c130h),a		;92fb
	ld a,c			;92fe
	cp 067h		;92ff
	jr nz,L_9317		;9301
	ld a,(0c135h)		;9303
	cp 00bh		;9306
	jr z,L_9317		;9308
	ld a,(0c185h)		;930a
	cp 002h		;930d
	jr z,L_9317		;930f
	ld a,067h		;9311
	ld (0c130h),a		;9313
	ld c,a			;9316
L_9317:
	ld a,c			;9317
	ld (0c136h),a		;9318
L_931B:
	xor a			;931b
	ld (0c151h),a		;931c
	ret			;931f
L_9320:
	call 042e6h		;9320
	ld hl,0c130h		;9323
	ld c,(hl)			;9326
	ld (0c130h),a		;9327
	ld a,c			;932a
	ld (0c136h),a		;932b
	call 0432dh		;932e
	ld a,(0c133h)		;9331
	dec a			;9334
	ld a,0d0h		;9335
	jr z,L_933B		;9337
	ld a,018h		;9339
L_933B:
	ld (0c193h),a		;933b
	ld l,000h		;933e
	sub 004h		;9340
	ld h,a			;9342
	ld (0c181h),hl		;9343
	call L_9598		;9346
	xor a			;9349
	ld (0c196h),a		;934a
	ld a,006h		;934d
	ld (0c151h),a		;934f
	ret			;9352
L_9353:
	ld a,(0c4fch)		;9353
	cp 091h		;9356
	ld c,075h		;9358
	jp z,L_93BF		;935a
	cp 05bh		;935d
	ld c,02dh		;935f
	jp z,L_93BF		;9361
	cp 081h		;9364
	ld c,02eh		;9366
	jp z,L_93BF		;9368
	ld hl,0c3d0h		;936b
	ld de,00010h		;936e
L_9371:
	cp (hl)			;9371
	jr z,L_9377		;9372
	add hl,de			;9374
	jr L_9371		;9375
L_9377:
	ld a,00fh		;9377
	call 041e0h		;9379
	ld a,(hl)			;937c
	ld c,a			;937d
	ld a,(0c130h)		;937e
	ld (0c136h),a		;9381
	ld a,c			;9384
	ld (0c130h),a		;9385
	cp 0f0h		;9388
	jr c,L_938E		;938a
	jr L_93A2		;938c
L_938E:
	ld a,(0c130h)		;938e
	and 0f0h		;9391
	cp 0e0h		;9393
	jp z,L_9418		;9395
	ld a,(0c136h)		;9398
	cp 0f0h		;939b
	jr nc,L_93BC		;939d
	jp L_93BC		;939f
L_93A2:
	call 04315h		;93a2
	ld e,000h		;93a5
	ld d,c			;93a7
	ld (0c181h),de		;93a8
	ld d,0d8h		;93ac
	ld (0c183h),de		;93ae
	ld e,b			;93b2
	ld d,070h		;93b3
	ld (0c193h),de		;93b5
	call L_9598		;93b9
L_93BC:
	jp L_931B		;93bc
L_93BF:
	ld a,(0c135h)		;93bf
	cp 00ch		;93c2
	jr nz,L_93DA		;93c4
	ld a,0cch		;93c6
	ld (0c130h),a		;93c8
	ld a,c			;93cb
	ld (0c136h),a		;93cc
	ld a,002h		;93cf
	ld (0c15bh),a		;93d1
	call 058c9h		;93d4
	jp L_931B		;93d7
L_93DA:
	call L_93FC		;93da
	xor a			;93dd
	ld (0c136h),a		;93de
	ld a,0ffh		;93e1
	ld (0c4fch),a		;93e3
	ld b,0ffh		;93e6
	jp L_902B		;93e8
L_93EB:
	ld hl,0c15bh		;93eb
	dec (hl)			;93ee
	jr z,L_93FC		;93ef
	ld a,0cch		;93f1
	ld (0c130h),a		;93f3
	ld (0c136h),a		;93f6
	jp L_931B		;93f9
L_93FC:
	ld a,(0c162h)		;93fc
	dec a			;93ff
	ld c,005h		;9400
	jr z,L_940B		;9402
	dec a			;9404
	ld c,006h		;9405
	jr z,L_940B		;9407
	ld c,00ah		;9409
L_940B:
	ld a,c			;940b
	ld (0c130h),a		;940c
	ld a,0cch		;940f
	ld (0c136h),a		;9411
	xor a			;9414
	ld (0c162h),a		;9415
L_9418:
	jp L_931B		;9418
L_941B:
	ld a,(0c4fch)		;941b
	cp 0ffh		;941e
	jp z,L_9546		;9420
	cp 091h		;9423
	jp z,L_9506		;9425
	cp 05bh		;9428
	jp z,L_9506		;942a
	cp 081h		;942d
	jp z,L_9506		;942f
	cp 06bh		;9432
	jp z,L_9578		;9434
	and a			;9437
	jr nz,L_944A		;9438
	ld a,(0c136h)		;943a
	cp 0cch		;943d
	jp z,L_951A		;943f
	ld a,(0c130h)		;9442
	cp 0f0h		;9445
	ret nc			;9447
	jr L_945B		;9448
L_944A:
	ld a,(0c130h)		;944a
	cp 0f0h		;944d
	jr nc,$+45		;944f
	ld a,(0c136h)		;9451
	cp 0f0h		;9454
	jr nc,$+55		;9456
	jp L_9493		;9458
L_945B:
	ld de,09474h		;945b
	ld a,(0c133h)		;945e
	dec a			;9461
	ld c,a			;9462
	call 042b4h		;9463
	ex de,hl			;9466
	ld a,c			;9467
	cp 002h		;9468
	jr nc,L_9470		;946a
	ld (0c181h),hl		;946c
	ret			;946f
L_9470:
	ld (0c183h),hl		;9470
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


L_947C:
	ld a,002h		;947c
	ld (0c180h),a		;947e
	inc a			;9481
	ld (0c185h),a		;9482
L_9485:
	xor a			;9485
	ld (0c191h),a		;9486
	ld (0c192h),a		;9489
	ret			;948c
L_948D:
	call L_9485		;948d
	ld (0c180h),a		;9490
L_9493:
	ld a,(0c4fch)		;9493
	ld hl,0c3d0h		;9496
	ld de,00010h		;9499
L_949C:
	cp (hl)			;949c
	jr z,L_94A2		;949d
	add hl,de			;949f
	jr L_949C		;94a0
L_94A2:
	inc hl			;94a2
	inc hl			;94a3
	inc hl			;94a4
	ld a,(hl)			;94a5
	inc hl			;94a6
	inc hl			;94a7
	ex de,hl			;94a8
	ld hl,094cdh		;94a9
	dec a			;94ac
	ld c,a			;94ad
	add a,a			;94ae
	add a,c			;94af
	call 041e0h		;94b0
	ld a,(de)			;94b3
	add a,(hl)			;94b4
	ld b,a			;94b5
	ld c,000h		;94b6
	inc de			;94b8
	inc hl			;94b9
	ld a,(de)			;94ba
	add a,(hl)			;94bb
	ld d,a			;94bc
	ld e,000h		;94bd
	inc hl			;94bf
	ld a,(hl)			;94c0
	ld (0c181h),bc		;94c1
	ld (0c183h),de		;94c5
	ld (0c185h),a		;94c9
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
	ld a,003h		;9506
	ld (0c18bh),a		;9508
	inc a			;950b
	ld (0c180h),a		;950c
	call L_9485		;950f
	ld hl,08000h		;9512
	ld (0c183h),hl		;9515
	jr L_9529		;9518
L_951A:
	ld a,(0c130h)		;951a
	cp 00ah		;951d
	jr z,L_9530		;951f
	cp 005h		;9521
	jr z,L_9530		;9523
	cp 006h		;9525
	jr z,L_9530		;9527
L_9529:
	ld hl,03000h		;9529
	ld (0c181h),hl		;952c
	ret			;952f
L_9530:
	call L_9485		;9530
	ld (0c180h),a		;9533
	ld (0c18bh),a		;9536
	ld (0c18fh),a		;9539
	ld (0c18ah),a		;953c
	ld (0c18dh),a		;953f
	inc a			;9542
	ld (0c185h),a		;9543
L_9546:
	ld l,000h		;9546
	ld a,(0c130h)		;9548
	cp 00ah		;954b
	jr z,L_9557		;954d
	cp 005h		;954f
	jr z,L_9562		;9551
	cp 006h		;9553
	jr z,L_956D		;9555
L_9557:
	ld h,080h		;9557
	ld (0c181h),hl		;9559
	ld h,0a0h		;955c
	ld (0c183h),hl		;955e
	ret			;9561
L_9562:
	ld h,038h		;9562
	ld (0c181h),hl		;9564
	ld h,068h		;9567
	ld (0c183h),hl		;9569
	ret			;956c
L_956D:
	ld h,0a8h		;956d
	ld (0c181h),hl		;956f
	ld h,080h		;9572
	ld (0c183h),hl		;9574
	ret			;9577
L_9578:
	ld a,(0c130h)		;9578
	cp 077h		;957b
	jp z,L_948D		;957d
	ld a,006h		;9580
	ld (0c180h),a		;9582
	rrca			;9585
	ld (0c185h),a		;9586
	call L_9485		;9589
	ld hl,09e00h		;958c
	ld (0c181h),hl		;958f
	ld h,0d8h		;9592
	ld (0c183h),hl		;9594
	ret			;9597
L_9598:
	ld de,0ea00h		;9598
	ld hl,095b7h		;959b
	ld b,008h		;959e
L_95A0:
	push hl			;95a0
	ld c,008h		;95a1
L_95A3:
	ld a,(hl)			;95a3
	ld (de),a			;95a4
	inc hl			;95a5
	inc de			;95a6
	dec c			;95a7
	jr nz,L_95A3		;95a8
	pop hl			;95aa
	djnz L_95A0		;95ab
	ld de,0e800h		;95ad
	ld a,00fh		;95b0
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


L_95BF:
	ld a,(ix+001h)		;95bf
	call 041eah		;95c2

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
	dec (ix+013h)		;95cf
	ret nz			;95d2
	ld hl,0c169h		;95d3
	ld a,(hl)			;95d6
	or a			;95d7
	jr nz,L_95E1		;95d8
	ld (hl),001h		;95da
	ld a,08bh		;95dc
	call 05cd9h		;95de
L_95E1:
	ld (ix+013h),010h		;95e1
	jr L_9600		;95e5
L_95E7:
	dec (ix+013h)		;95e7
	ret nz			;95ea
	ld (ix+013h),008h		;95eb
	ld a,(0c184h)		;95ef
	cp (ix+005h)		;95f2
	ld de,00200h		;95f5
	jr nc,L_95FD		;95f8
	ld de,0fe00h		;95fa
L_95FD:
	call 05b5dh		;95fd
L_9600:
	inc (ix+001h)		;9600
	ret			;9603
L_9604:
	ld b,007h		;9604
	call 05b6ah		;9606
	dec (ix+013h)		;9609
	ret nz			;960c
	ld (ix+013h),005h		;960d
	ld (ix+00bh),01ah		;9611
	ld de,00000h		;9615
	call 05b5dh		;9618
	call L_9600		;961b
	ld a,(ix+003h)		;961e
	sub 010h		;9621
	ld e,a			;9623
	ld d,(ix+005h)		;9624
	ld c,03fh		;9627
	jp 0569ah		;9629
L_962C:
	dec (ix+013h)		;962c
	ret nz			;962f
	ld (ix+013h),008h		;9630
	ld (ix+00bh),018h		;9634
	ld a,(ix+005h)		;9638
	cp 080h		;963b
	ld de,0fe00h		;963d
	jr nc,L_9645		;9640
	ld de,00200h		;9642
L_9645:
	call 05b5dh		;9645
	jr L_9600		;9648
L_964A:
	ld b,007h		;964a
	call 05b6ah		;964c
	dec (ix+013h)		;964f
	ret nz			;9652
	ld (ix+013h),008h		;9653
	ld de,00000h		;9657
	call 05b5dh		;965a
	ld (ix+001h),001h		;965d
	ret			;9661
L_9662:
	ld a,006h		;9662
	call 0427ch		;9664
	ld a,(ix+003h)		;9667
	ld (ix+015h),a		;966a
	ld a,(ix+005h)		;966d
	ld (ix+016h),a		;9670
	cp 080h		;9673
	ld a,000h		;9675
	jr nc,L_967B		;9677
	ld a,002h		;9679
L_967B:
	ld (ix+01bh),a		;967b
	ld a,r		;967e
	and 001h		;9680
	ld (ix+01ch),a		;9682
	ld (ix+00bh),077h		;9685
	ld (ix+017h),040h		;9689
	ld (ix+019h),0feh		;968d
	ld (ix+018h),040h		;9691
	ld (ix+01ah),0fch		;9695
	ret			;9699
L_969A:
	ld a,(ix+00ch)		;969a
	and 001h		;969d
	jr nz,L_96B4		;969f
	inc (ix+014h)		;96a1
	ld a,(ix+014h)		;96a4
	cp 003h		;96a7
	jr c,L_96AF		;96a9
	xor a			;96ab
	ld (ix+014h),a		;96ac
L_96AF:
	add a,077h		;96af
	ld (ix+00bh),a		;96b1
L_96B4:
	ld a,(ix+017h)		;96b4
	add a,(ix+019h)		;96b7
	ld (ix+017h),a		;96ba
	cp 040h		;96bd
	call nc,L_9703		;96bf
	call 05be2h		;96c2
	srl b		;96c5
	ld a,(ix+01ch)		;96c7
	or a			;96ca
	jr z,L_96CF		;96cb
	srl b		;96cd
L_96CF:
	ld a,(ix+015h)		;96cf
	add a,b			;96d2
	ld (ix+003h),a		;96d3
	ld a,(ix+018h)		;96d6
	add a,(ix+01ah)		;96d9
	ld (ix+018h),a		;96dc
	cp 040h		;96df
	call nc,L_9711		;96e1
	call 05be2h		;96e4
	srl b		;96e7
	srl b		;96e9
	ld a,(ix+01bh)		;96eb
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
	add a,(ix+016h)		;96fc
	ld (ix+005h),a		;96ff
	ret			;9702
L_9703:
	ld a,(ix+019h)		;9703
	neg		;9706
	ld (ix+019h),a		;9708
	inc a			;970b
	inc a			;970c
	ret nz			;970d
L_970E:
	jp 07371h		;970e
L_9711:
	ld a,(ix+01ah)		;9711
	neg		;9714
	ld (ix+01ah),a		;9716
	inc (ix+01bh)		;9719
	ret			;971c
L_971D:
	ld a,(0c5b4h)		;971d
	or a			;9720
	jr nz,L_970E		;9721
	ld (ix+00bh),018h		;9723
	ld (ix+013h),003h		;9727
	inc (ix+006h)		;972b
	jp 0b9e6h		;972e
L_9731:
	ld a,(ix+011h)		;9731
	ld h,(ix+005h)		;9734
	ld l,(ix+003h)		;9737
L_973A:
	ld (0ec00h),a		;973a
	ld (0ec01h),hl		;973d
	ld a,(0c602h)		;9740
	or a			;9743
	ret nz			;9744
	ld a,(0c18ah)		;9745
	ld b,025h		;9748
	cp b			;974a
	ret z			;974b
	inc b			;974c
	cp b			;974d
	ret z			;974e
	ld a,(0c18bh)		;974f
	cp 007h		;9752
	jr nz,L_9767		;9754
	ld hl,0c186h		;9756
	ld a,(hl)			;9759
	inc hl			;975a
	or (hl)			;975b
	jr nz,L_9767		;975c
	ld hl,0c188h		;975e
	ld a,(hl)			;9761
	or (hl)			;9762
	inc hl			;9763
	or (hl)			;9764
	or a			;9765
	ret z			;9766
L_9767:
	ld a,(ix+01eh)		;9767
	bit 7,a		;976a
	jp nz,L_985B		;976c
	ld a,(0ec00h)		;976f
	call 041eah		;9772

; ----------------------------------------------------------------------
; DATOS tabla_9775: 4 destinos del despachador p00:41EA (call en p02:9772, el
;   indice en A): 978F, 97A3, 97BA, 97CE; lo leen p02:9772 (8 bytes)
;   0x9775..0x977d  (8 bytes)
DATA_tabla_9775:
	defw 0978fh,097a3h,097bah,097ceh	; 9775  -> L_978F L_97A3 L_97BA L_97CE

; ======================================================================
; CODIGO 0x977d..0x98de  (353 bytes)
; ======================================================================


L_977D:
	ld a,(0c182h)		;977d
	ld b,a			;9780
	ld a,(0ec01h)		;9781
	sub b			;9784
	ret			;9785
L_9786:
	ld a,(0c184h)		;9786
	ld b,a			;9789
	ld a,(0ec02h)		;978a
	sub b			;978d
	ret			;978e
L_978F:
	call L_98EE		;978f
	ret nc			;9792
	call L_977D		;9793
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
	call L_98EE		;97a3
	ret nc			;97a6
	call L_977D		;97a7
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
	call L_9900		;97ba
	ret nc			;97bd
	call L_9786		;97be
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
	call L_9900		;97ce
	ret nc			;97d1
	call L_9786		;97d2
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
	ld b,a			;97e2
	ld hl,(0ec01h)		;97e3
	call 05c09h		;97e6
L_97E9:
	ld (0ec03h),hl		;97e9
	ld a,(0c157h)		;97ec
	or a			;97ef
	ld a,(hl)			;97f0
	jr nz,L_981E		;97f1
	ld e,068h		;97f3
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
	inc e			;9808
	inc e			;9809
	cp e			;980a
	jr z,L_9828		;980b
	ld e,08bh		;980d
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
	ld e,a			;981e
	ld d,000h		;981f
	ld hl,0c700h		;9821
	add hl,de			;9824
	ld a,(hl)			;9825
	or a			;9826
	ret nz			;9827
L_9828:
	ld hl,(0ec03h)		;9828
	ld e,c			;982b
	rl c		;982c
	ld c,e			;982e
	ld d,0ffh		;982f
	jr c,L_9835		;9831
	ld d,000h		;9833
L_9835:
	add hl,de			;9835
	djnz L_97E9		;9836
	ld a,(ix+000h)		;9838
	cp 006h		;983b
	jr nz,L_985B		;983d
	ld a,001h		;983f
	ld (ix+041h),a		;9841
	ld (0c668h),a		;9844
	ld a,028h		;9847
	ld (0c605h),a		;9849
L_984C:
	call 07d2ah		;984c
L_984F:
	ld a,(0c130h)		;984f
	ld (0c60fh),a		;9852
	ld a,010h		;9855
	ld (0c669h),a		;9857
	ret			;985a
L_985B:
	ld a,(0c602h)		;985b
	or a			;985e
	ret nz			;985f
	ld a,(0c130h)		;9860
	ld b,a			;9863
	cp 080h		;9864
	ld a,000h		;9866
	jr nc,L_9883		;9868
	ld a,b			;986a
	srl a		;986b
	srl a		;986d
	srl a		;986f
	ld hl,098deh		;9871
	call 041e0h		;9874
	ld c,(hl)			;9877
	ld a,b			;9878
	and 007h		;9879
	inc a			;987b
	ld b,a			;987c
	xor a			;987d
L_987E:
	rl c		;987e
	djnz L_987E		;9880
	rla			;9882
L_9883:
	ld (0c614h),a		;9883
	ld a,(0c184h)		;9886
	ld b,a			;9889
	ld a,(ix+005h)		;988a
	ld c,008h		;988d
	cp b			;988f
	jr c,L_9894		;9890
	ld c,0f8h		;9892
L_9894:
	add a,008h		;9894
	and 0f8h		;9896
	ld d,a			;9898
	ld a,(ix+003h)		;9899
	sub 018h		;989c
	and 0f8h		;989e
	ld e,a			;98a0
	cp 0bfh		;98a1
	jr c,L_98A7		;98a3
	ld e,000h		;98a5
L_98A7:
	ld hl,0c60ch		;98a7
	ld (hl),e			;98aa
	inc hl			;98ab
	ld (hl),d			;98ac
	ex de,hl			;98ad
	call 0ac4dh		;98ae
	ld a,(0c614h)		;98b1
	or a			;98b4
	ld hl,00080h		;98b5
	ld b,000h		;98b8
	jr z,L_98C0		;98ba
	ld h,010h		;98bc
	ld b,01eh		;98be
L_98C0:
	ld a,b			;98c0
	ld (0c605h),a		;98c1
	ld a,e			;98c4
	cp 0bfh		;98c5
	jr c,L_98CF		;98c7
	ld e,000h		;98c9
	ld a,e			;98cb
	ld (0c60ch),a		;98cc
L_98CF:
	call 0ac5bh		;98cf
	call L_984C		;98d2
	ld a,(ix+000h)		;98d5
	cp 006h		;98d8
	ret z			;98da
	jp 058e9h		;98db

; ----------------------------------------------------------------------
; DATOS tabla_98de: 16 bytes que p02:9871 lee en 0x98DE + (A / 4) y deja en C
;   0x98de..0x98ee  (16 bytes)
DATA_tabla_98de:
	defb 001h,01ch,003h,000h,0a3h,010h,058h,000h,004h,001h,09fh,000h,000h,008h,000h,001h	; 98de  ......X.........

; ======================================================================
; CODIGO 0x98ee..0x99fd  (271 bytes)
; ======================================================================


L_98EE:
	ld hl,00810h		;98ee
	ld de,(0ec01h)		;98f1
	ld a,(0c184h)		;98f5
	sub h			;98f8
	cp d			;98f9
	ret nc			;98fa
	add a,l			;98fb
	ld e,a			;98fc
	ld a,d			;98fd
	cp e			;98fe
	ret			;98ff
L_9900:
	ld a,(ix+000h)		;9900
	cp 006h		;9903
	ld hl,00408h		;9905
	jr z,L_990D		;9908
	ld hl,0060ch		;990a
L_990D:
	ld de,(0ec01h)		;990d
	ld a,(0c182h)		;9911
	sub h			;9914
	cp e			;9915
	ret nc			;9916
	add a,l			;9917
	ld d,a			;9918
	ld a,e			;9919
	cp d			;991a
	ret			;991b
L_991C:
	ld a,(ix+000h)		;991c
	cp 006h		;991f
	ret z			;9921
	ld a,(ix+01eh)		;9922
	bit 7,a		;9925
	jr nz,L_994C		;9927
	ld a,(0c134h)		;9929
	sub 003h		;992c
	jr nc,L_9935		;992e
	ld a,(0c51ch)		;9930
	or a			;9933
	ret nz			;9934
L_9935:
	xor a			;9935
	ld hl,0c200h		;9936
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
L_994E:
	ld b,003h		;994e
	call 05b6ah		;9950
	call L_99A0		;9953
	ld a,(ix+001h)		;9956
	dec a			;9959
	jr nz,L_9991		;995a
	ld a,(ix+013h)		;995c
	cp 080h		;995f
	jr c,L_9971		;9961
	ld a,(ix+005h)		;9963
	cp 0c8h		;9966
	jp nc,05ba2h		;9968
	cp 038h		;996b
	jp c,05ba2h		;996d
	ret			;9970
L_9971:
	call 05b45h		;9971
	ld a,e			;9974
	cp 080h		;9975
	ret nc			;9977
	ld a,d			;9978
	cp (ix+005h)		;9979
	ld de,00080h		;997c
	ld b,002h		;997f
	jr c,L_9988		;9981
	ld de,0ff80h		;9983
	ld b,003h		;9986
L_9988:
	ld (ix+011h),b		;9988
	call 05b5dh		;998b
	jp 05ba2h		;998e
L_9991:
	ld a,(ix+011h)		;9991
	rra			;9994
	ld de,0fff8h		;9995
	jr nc,L_999D		;9998
	ld de,00008h		;999a
L_999D:
	jp 05b55h		;999d
L_99A0:
	ld a,(ix+005h)		;99a0
	ld h,0c8h		;99a3
	ld c,h			;99a5
	dec h			;99a6
	cp c			;99a7
	ld de,0ff80h		;99a8
	ld b,002h		;99ab
	jr nc,L_99BA		;99ad
	ld h,038h		;99af
	ld c,h			;99b1
	inc h			;99b2
	cp c			;99b3
	ret nc			;99b4
	ld b,003h		;99b5
	ld de,00080h		;99b7
L_99BA:
	ld (ix+005h),h		;99ba
	ld (ix+011h),b		;99bd
	call 05b5dh		;99c0
	ld a,01dh		;99c3
	jp 0427ch		;99c5
L_99C8:
	ld a,(0c184h)		;99c8
	ld (ix+013h),a		;99cb
	ld de,00080h		;99ce
	ld hl,00000h		;99d1
	ld a,(0c184h)		;99d4
	cp 080h		;99d7
	jr c,L_99DE		;99d9
	ld de,0ff80h		;99db
L_99DE:
	call 05b64h		;99de
	inc (ix+006h)		;99e1
	ld (ix+00bh),036h		;99e4
	ret			;99e8
L_99E9:
	ld (ix+00eh),000h		;99e9
	ld a,r		;99ed
	ld (ix+013h),a		;99ef
	ld (ix+00bh),038h		;99f2
	ret			;99f6
L_99F7:
	ld a,(ix+001h)		;99f7
	call 041eah		;99fa

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
	jp 05ba2h		;9a10
L_9A13:
	ld b,007h		;9a13
	call 05b6ah		;9a15
	dec (ix+013h)		;9a18
	ret nz			;9a1b
	call 05bc1h		;9a1c
	call L_99E9		;9a1f
	jp 05ba6h		;9a22
L_9A25:
	call 058c9h		;9a25
	ld a,(0c136h)		;9a28
	cp 049h		;9a2b
	jp z,0740ch		;9a2d
	ld (ix+014h),010h		;9a30
	ld (ix+00eh),000h		;9a34
	ret			;9a38
L_9A39:
	ld a,(0c602h)		;9a39
	or a			;9a3c
	jp nz,0740ch		;9a3d
	call L_9A6D		;9a40
	ld a,(ix+001h)		;9a43
	call 041eah		;9a46

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
	call 05b45h		;9a4d
	ld a,e			;9a50
	cp 080h		;9a51
	ret nc			;9a53
	ld a,d			;9a54
	cp 038h		;9a55
	ret c			;9a57
	cp 0b8h		;9a58
	ret nc			;9a5a
	inc (ix+001h)		;9a5b
L_9A5E:
	ld a,(0c135h)		;9a5e
	cp 018h		;9a61
	jr z,L_9A88		;9a63
	ld a,01eh		;9a65
	call 07d27h		;9a67
	jp 07371h		;9a6a
L_9A6D:
	ld a,(0c602h)		;9a6d
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
	jp 05cd9h		;9a85
L_9A88:
	ld a,(ix+016h)		;9a88
	or a			;9a8b
	jr nz,L_9A96		;9a8c
	inc (ix+016h)		;9a8e
	ld a,07fh		;9a91
	jp 05cd9h		;9a93
L_9A96:
	cp 002h		;9a96
	ret nc			;9a98
	ld a,001h		;9a99
	ld (0c62ch),a		;9a9b
	ld (0c62dh),a		;9a9e
	inc (ix+016h)		;9aa1
	ret			;9aa4
L_9AA5:
	ld a,(0c130h)		;9aa5
	ld c,a			;9aa8
	ld b,001h		;9aa9
	cp 08ch		;9aab
	jr z,L_9AB0		;9aad
	dec b			;9aaf
L_9AB0:
	ld a,b			;9ab0
	ld (0c633h),a		;9ab1
	ld a,c			;9ab4
	cp 027h		;9ab5
	push af			;9ab7
	call z,0a190h		;9ab8
	pop af			;9abb
	cp 045h		;9abc
	jr nz,L_9ACE		;9abe
	ld b,001h		;9ac0
	ld a,(0c136h)		;9ac2
	cp 049h		;9ac5
	jr nz,L_9ACB		;9ac7
	ld b,000h		;9ac9
L_9ACB:
	ld (ix+05eh),b		;9acb
L_9ACE:
	jp 05b01h		;9ace
L_9AD1:
	call L_991C		;9ad1
	jp c,L_985B		;9ad4
	jr L_9AF0		;9ad7
L_9AD9:
	ld a,(ix+045h)		;9ad9
	or a			;9adc
	jp nz,0740ch		;9add
	ld a,(0c130h)		;9ae0
	cp 045h		;9ae3
	jr z,L_9AF0		;9ae5
	ld a,(0c633h)		;9ae7
	or a			;9aea
	jr nz,L_9AD1		;9aeb
	call L_9731		;9aed
L_9AF0:
	ld a,(0c602h)		;9af0
	or a			;9af3
	jp nz,058e9h		;9af4
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
	call 041e5h		;9b0e
	jp 05b40h		;9b11
L_9B14:
	ld a,r		;9b14
	ld hl,0c003h		;9b16
	xor (hl)			;9b19
	and 003h		;9b1a
	add a,a			;9b1c
	add a,a			;9b1d
	add a,a			;9b1e
	add a,020h		;9b1f
	ld (ix+012h),a		;9b21
	ld (ix+00bh),014h		;9b24
	ld (ix+00eh),003h		;9b28
	jp 0b3f8h		;9b2c
L_9B2F:
	ld a,(ix+001h)		;9b2f
	call 041eah		;9b32

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
	dec (ix+012h)		;9b3b
	ret nz			;9b3e
	call 0a9b7h		;9b3f
	add a,005h		;9b42
	add a,a			;9b44
	add a,a			;9b45
	ld (ix+013h),a		;9b46
	add a,a			;9b49
	ld (ix+012h),a		;9b4a
	ld (ix+001h),001h		;9b4d
	ld (ix+00bh),015h		;9b51
	ret			;9b55
L_9B56:
	dec (ix+013h)		;9b56
	ret nz			;9b59
	ld a,r		;9b5a
	xor (ix+00ch)		;9b5c
	rra			;9b5f
	jr c,L_9B6B		;9b60
	ld (ix+001h),000h		;9b62
	ld (ix+00bh),014h		;9b66
	ret			;9b6a
L_9B6B:
	ld (ix+001h),002h		;9b6b
	ld (ix+006h),001h		;9b6f
	call L_8334		;9b73
	exx			;9b76
	call L_9BE5		;9b77
	jr nc,L_9B7E		;9b7a
	exx			;9b7c
	ld a,b			;9b7d
L_9B7E:
	ld (ix+011h),a		;9b7e
	call L_9BBF		;9b81
	call L_9BCD		;9b84
	jr L_9BB1		;9b87
L_9B89:
	call L_9BBC		;9b89
	ld a,(ix+011h)		;9b8c
	call L_9BE5		;9b8f
	jr c,L_9B9D		;9b92
	dec (ix+012h)		;9b94
	ret nz			;9b97
	ld a,003h		;9b98
	call 0427ch		;9b9a
L_9B9D:
	call L_8334		;9b9d
	exx			;9ba0
	call L_9BE5		;9ba1
	jr nc,L_9BA8		;9ba4
	exx			;9ba6
	ld a,b			;9ba7
L_9BA8:
	ld (ix+011h),a		;9ba8
	call L_9BBF		;9bab
	call L_9BCD		;9bae
L_9BB1:
	call 0a9b7h		;9bb1
	add a,005h		;9bb4
	add a,a			;9bb6
	add a,a			;9bb7
	ld (ix+012h),a		;9bb8
	ret			;9bbb
L_9BBC:
	ld a,(ix+011h)		;9bbc
L_9BBF:
	add a,a			;9bbf
	add a,01eh		;9bc0
	bit 2,(ix+00ch)		;9bc2
	jr nz,L_9BC9		;9bc6
	inc a			;9bc8
L_9BC9:
	ld (ix+00bh),a		;9bc9
	ret			;9bcc
L_9BCD:
	ld a,(ix+011h)		;9bcd
	ld de,09bdbh		;9bd0
	call 042b4h		;9bd3
	ld (ix+008h),e		;9bd6
	ld (ix+00ah),d		;9bd9
	ret			;9bdc

; ----------------------------------------------------------------------
; DATOS velocidad_9bdd: 4 parejas [dx][dy], una por direccion (ix+0x11) = 1-4:
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


L_9BE5:
	ld c,a			;9be5
	ld de,09bfah		;9be6
	call 042b4h		;9be9
	ld a,e			;9bec
	add a,(ix+003h)		;9bed
	ld b,a			;9bf0
	ld a,d			;9bf1
	add a,(ix+005h)		;9bf2
	ld l,b			;9bf5
	ld h,a			;9bf6
	ld b,001h		;9bf7
	jp L_8298		;9bf9

; ----------------------------------------------------------------------
; DATOS velocidad_9bfc: 4 parejas [dx][dy] que p02:9BE6 lee en 0x9BFA + 2 x C
;   con L_42B4 y suma a (ix+3)
;   0x9bfc..0x9c04  (8 bytes)
DATA_velocidad_9bfc:
	defb 0f8h,000h	; 9bfc
	defb 008h,000h	; 9bfe
	defb 000h,0f8h	; 9c00
	defb 000h,008h	; 9c02

; ======================================================================
; CODIGO 0x9c04..0x9c0a  (6 bytes)
; ======================================================================


L_9C04:
	ld a,(ix+001h)		;9c04
	call 041eah		;9c07

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
	call 05b6ah		;9c14
	bit 7,(ix+01eh)		;9c17
	ret z			;9c1b
	ld (ix+00bh),040h		;9c1c
	jp 05ba2h		;9c20
L_9C23:
	ld a,06dh		;9c23
	call 05cd9h		;9c25
	jp 05ba2h		;9c28
L_9C2B:
	call 05ba2h		;9c2b
	inc (ix+006h)		;9c2e
	ld de,00100h		;9c31
	call 05b4eh		;9c34
	ld a,001h		;9c37
	ld (0c656h),a		;9c39
	ld (ix+013h),010h		;9c3c
	ld de,08060h		;9c40
	ld c,010h		;9c43
	jp 0569ah		;9c45
L_9C48:
	dec (ix+013h)		;9c48
	ret nz			;9c4b
	jp 07371h		;9c4c
L_9C4F:
	ld (ix+00bh),03eh		;9c4f
	ld a,(ix+000h)		;9c53
	call 05bafh		;9c56
	ld (ix+00fh),a		;9c59
	ld a,r		;9c5c
	ld (ix+00ch),a		;9c5e
	ld (ix+013h),020h		;9c61
	ld (ix+014h),002h		;9c65
	ld a,(0c130h)		;9c69
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


L_9C9E:
	ld a,(ix+001h)		;9c9e
	call 041eah		;9ca1

; ----------------------------------------------------------------------
; DATOS tabla_9CA4: 4 destinos del despachador p00:41EA (call en p02:9CA1, el
;   indice en A): 9CAC, 9D20, 9D26, 9D97; lo leen p02:9CA1 (8 bytes)
;   0x9ca4..0x9cac  (8 bytes)
DATA_tabla_9CA4:
	defw 09cach,09d20h,09d26h,09d97h	; 9ca4  -> L_9CAC L_9D20 L_9D26 L_9D97

; ======================================================================
; CODIGO 0x9cac..0x9d59  (173 bytes)
; ======================================================================


L_9CAC:
	ld a,(ix+000h)		;9cac
	cp 032h		;9caf
	call z,L_9CD4		;9cb1
	ld b,00fh		;9cb4
	call 05b6ah		;9cb6
	ld a,(0c130h)		;9cb9
	cp 0c1h		;9cbc
	jr nz,L_9CC5		;9cbe
	ld a,(0c5b4h)		;9cc0
	or a			;9cc3
	ret z			;9cc4
L_9CC5:
	bit 7,(ix+01eh)		;9cc5
	ret z			;9cc9
	ld (ix+014h),002h		;9cca
	ld (ix+00bh),040h		;9cce
	jr L_9D0C		;9cd2
L_9CD4:
	dec (ix+014h)		;9cd4
	ret nz			;9cd7
	ld (ix+014h),0c0h		;9cd8
	ld a,080h		;9cdc
	jp 05cd9h		;9cde
L_9CE1:
	ld a,b			;9ce1
	push af			;9ce2
	call L_9D8F		;9ce3
	call L_9D0C		;9ce6
	push ix		;9ce9
	call 064c8h		;9ceb
	pop ix		;9cee
	pop af			;9cf0
	jp 05ce1h		;9cf1
L_9CF4:
	ld a,(0c654h)		;9cf4
	or a			;9cf7
	ld a,07ch		;9cf8
	jr z,L_9D00		;9cfa
	inc a			;9cfc
	call L_9D8F		;9cfd
L_9D00:
	push ix		;9d00
	push af			;9d02
	call 064c8h		;9d03
	pop af			;9d06
	pop ix		;9d07
	call 05ce1h		;9d09
L_9D0C:
	inc (ix+001h)		;9d0c
	ret			;9d0f
L_9D10:
	ld a,(ix+003h)		;9d10
	cp 054h		;9d13
	ld a,083h		;9d15
	jr nz,L_9D00		;9d17
	call L_9D8F		;9d19
	ld a,08ch		;9d1c
	jr L_9D00		;9d1e
L_9D20:
	dec (ix+014h)		;9d20
	ret nz			;9d23
	jr L_9D0C		;9d24
L_9D26:
	ld a,(ix+000h)		;9d26
	cp 034h		;9d29
	jr z,L_9CF4		;9d2b
	ld a,(0c130h)		;9d2d
	ld b,081h		;9d30
	cp 0a7h		;9d32
	jr z,L_9CE1		;9d34
	cp 0c1h		;9d36
	jr z,L_9D10		;9d38
	ld hl,09d59h		;9d3a
	ld b,013h		;9d3d
L_9D3F:
	cp (hl)			;9d3f
	jr z,L_9D47		;9d40
	inc hl			;9d42
	inc hl			;9d43
	djnz L_9D3F		;9d44
	ret			;9d46
L_9D47:
	inc hl			;9d47
	ld b,(hl)			;9d48
	call L_9D8F		;9d49
	ld a,b			;9d4c
	call 05ce1h		;9d4d
	push ix		;9d50
	call 064c8h		;9d52
	pop ix		;9d55
	jr L_9D0C		;9d57

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


L_9D7F:
	ld a,(0c654h)		;9d7f
	or a			;9d82
	jp nz,07371h		;9d83
	ld (ix+00eh),000h		;9d86
	ld (ix+014h),020h		;9d8a
	ret			;9d8e
L_9D8F:
	ld l,(ix+015h)		;9d8f
	ld h,(ix+016h)		;9d92
	ld (hl),001h		;9d95
L_9D97:
	ret			;9d97
L_9D98:
	ld a,(ix+011h)		;9d98
	rlca			;9d9b
	add a,000h		;9d9c
	ld b,a			;9d9e
	ld a,(ix+00bh)		;9d9f
	and 001h		;9da2
	or b			;9da4
	ld (ix+00bh),a		;9da5
	ret			;9da8
L_9DA9:
	ld a,(ix+045h)		;9da9
	or a			;9dac
	jp nz,07371h		;9dad
	ld a,(ix+040h)		;9db0
	sub 003h		;9db3
	call nz,L_9731		;9db5
	ld a,(0c602h)		;9db8
	or a			;9dbb
	jp nz,058e9h		;9dbc
	ld a,(ix+040h)		;9dbf
	call 041eah		;9dc2

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
	call L_9DD4		;9dcf
	jr $-58		;9dd2
L_9DD4:
	call L_9E3E		;9dd4
	ld bc,00700h		;9dd7
	call 05b6ah		;9dda
L_9DDD:
	ld d,(ix+005h)		;9ddd
	ld e,(ix+003h)		;9de0
	ld h,(ix+016h)		;9de3
	ld l,(ix+015h)		;9de6
	ld a,(ix+011h)		;9de9
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
	jp 05a6ah		;9dfd
L_9E00:
	ld a,h			;9e00
	sub d			;9e01
	jr L_9DF7		;9e02
L_9E04:
	ld a,h			;9e04
	sub d			;9e05
	jr L_9DFC		;9e06
L_9E08:
	dec (ix+012h)		;9e08
	ret nz			;9e0b
	ld a,(ix+011h)		;9e0c
	ld (ix+042h),a		;9e0f
	xor 002h		;9e12
	ld b,a			;9e14
	ld a,r		;9e15
	rra			;9e17
	rra			;9e18
	and 001h		;9e19
	or b			;9e1b
	ld (ix+011h),a		;9e1c
	add a,008h		;9e1f
	ld (ix+00bh),a		;9e21
	ld (ix+012h),010h		;9e24
L_9E28:
	inc (ix+040h)		;9e28
	ret			;9e2b
L_9E2C:
	dec (ix+012h)		;9e2c
	ret nz			;9e2f
	inc (ix+006h)		;9e30
	ld a,(ix+042h)		;9e33
	ld (ix+011h),a		;9e36
	ld (ix+040h),000h		;9e39
	ret			;9e3d
L_9E3E:
	ld a,(0c633h)		;9e3e
	or a			;9e41
	ret z			;9e42
	dec (ix+044h)		;9e43
	ret nz			;9e46
	pop hl			;9e47
	pop hl			;9e48
	ld (ix+006h),000h		;9e49
	ld a,(ix+040h)		;9e4d
	ld (ix+047h),a		;9e50
	ld (ix+040h),003h		;9e53
	ld (ix+00bh),002h		;9e57
	ld (ix+046h),000h		;9e5b
	ld a,021h		;9e5f
	call 05cd9h		;9e61
	ld d,(ix+005h)		;9e64
	ld a,(ix+003h)		;9e67
	sub 023h		;9e6a
	ld e,a			;9e6c
	ld c,040h		;9e6d
	jp 0569ah		;9e6f
L_9E72:
	call L_991C		;9e72
	jp c,L_985B		;9e75
	dec (ix+046h)		;9e78
	ret nz			;9e7b
	ld (ix+044h),0c0h		;9e7c
	push ix		;9e80
	pop hl			;9e82
	ld de,0008dh		;9e83
	add hl,de			;9e86
	ld (hl),000h		;9e87
	jr L_9E28		;9e89
L_9E8B:
	inc (ix+006h)		;9e8b
	ld a,(ix+047h)		;9e8e
	ld (ix+040h),a		;9e91
	ld a,022h		;9e94
	jp 05cd9h		;9e96
L_9E99:
	ld a,(0c130h)		;9e99
	cp 076h		;9e9c
	jr nz,L_9EA7		;9e9e
	ld a,(0c623h)		;9ea0
	or a			;9ea3
	jp nz,07371h		;9ea4
L_9EA7:
	ld (ix+00eh),000h		;9ea7
	ld a,035h		;9eab
	jr L_9EB1		;9ead
L_9EAF:
	ld a,006h		;9eaf
L_9EB1:
	call 05bafh		;9eb1
	ld (ix+00fh),a		;9eb4
	ld a,r		;9eb7
	ld (ix+012h),a		;9eb9
	ld a,(0c130h)		;9ebc
	ld hl,09eebh		;9ebf
	ld bc,0000bh		;9ec2
	cpir		;9ec5
	ld a,c			;9ec7
	ld hl,09ef6h		;9ec8
	call 041dfh		;9ecb
	ld e,(hl)			;9ece
	inc hl			;9ecf
	ld d,(hl)			;9ed0
	ex de,hl			;9ed1
	ld a,(ix+00fh)		;9ed2
	dec a			;9ed5
	call 041e0h		;9ed6
	ld a,(hl)			;9ed9
	ld (ix+01bh),a		;9eda
	add a,01ch		;9edd
	ld (ix+00bh),a		;9edf
	inc (ix+006h)		;9ee2
L_9EE5:
	ld b,(ix+00fh)		;9ee5
	jp 059cch		;9ee8

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


L_9F19:
	ld a,(ix+001h)		;9f19
	call 041eah		;9f1c

; ----------------------------------------------------------------------
; DATOS tabla_9F1F: 3 destinos del despachador p00:41EA (call en p02:9F1C, el
;   indice en A): 9F25, 9F6E, 9F85; lo leen p02:9F1C (6 bytes)
;   0x9f1f..0x9f25  (6 bytes)
DATA_tabla_9F1F:
	defw 09f25h,09f6eh,09f85h	; 9f1f  -> L_9F25 L_9F6E L_9F85

; ======================================================================
; CODIGO 0x9f25..0x9f86  (97 bytes)
; ======================================================================


L_9F25:
	ld a,(0c602h)		;9f25
	or a			;9f28
	jp nz,0a1a0h		;9f29
	ld a,(ix+01bh)		;9f2c
	ld b,a			;9f2f
	ld hl,09f86h		;9f30
	call 041dfh		;9f33
	ld a,(ix+003h)		;9f36
	add a,(hl)			;9f39
	inc hl			;9f3a
	ld e,a			;9f3b
	ld a,(ix+005h)		;9f3c
	add a,(hl)			;9f3f
	ld d,a			;9f40
	ld a,b			;9f41
	ex de,hl			;9f42
	call L_973A		;9f43
	ld a,(ix+041h)		;9f46
	or a			;9f49
	jr z,L_9F57		;9f4a
	ld (ix+006h),000h		;9f4c
	ld (ix+012h),020h		;9f50
	jp 05ba2h		;9f54
L_9F57:
	ld a,(ix+006h)		;9f57
	or a			;9f5a
	jp nz,L_9DDD		;9f5b
	dec (ix+012h)		;9f5e
	ret nz			;9f61
	ld (ix+006h),001h		;9f62
	ld a,r		;9f66
	ld (ix+012h),a		;9f68
	jp 05a02h		;9f6b
L_9F6E:
	dec (ix+012h)		;9f6e
	jp z,0a1a0h		;9f71
	ld a,(ix+012h)		;9f74
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


L_9F8E:
	ld a,(ix+001h)		;9f8e
	call 041eah		;9f91

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
	call L_9DDD		;9f9a
L_9F9D:
	ld a,(0c182h)		;9f9d
	cp (ix+003h)		;9fa0
	ret c			;9fa3
	ld a,(0c184h)		;9fa4
	sub 004h		;9fa7
	ld d,(ix+005h)		;9fa9
	cp d			;9fac
	ret nc			;9fad
	add a,008h		;9fae
	cp d			;9fb0
	ret c			;9fb1
	ld a,(ix+001h)		;9fb2
	or a			;9fb5
	call z,05ba2h		;9fb6
	ld (ix+059h),020h		;9fb9
	ld de,00000h		;9fbd
	call 05b5dh		;9fc0
	ld d,(ix+005h)		;9fc3
	ld e,(ix+003h)		;9fc6
	ld c,036h		;9fc9
	push ix		;9fcb
	call 0569ah		;9fcd
	pop ix		;9fd0
	ld a,0ffh		;9fd2
	ret			;9fd4
L_9FD5:
	call L_9DDD		;9fd5
	ld a,(ix+059h)		;9fd8
	or a			;9fdb
	jr z,L_9FE2		;9fdc
	dec (ix+059h)		;9fde
	ret nz			;9fe1
L_9FE2:
	call L_9F9D		;9fe2
	inc a			;9fe5
	ret z			;9fe6
	ld a,(0c184h)		;9fe7
	sub (ix+005h)		;9fea
	jr nc,L_9FF1		;9fed
	neg		;9fef
L_9FF1:
	cp 060h		;9ff1
	jr c,$+14		;9ff3
	ld l,(ix+017h)		;9ff5
	ld h,(ix+018h)		;9ff8
	call L_9EE5		;9ffb

; ----------------------------------------------------------------------
; DATOS jp_partido: los dos primeros bytes (C3 A6) de `jp 0x5BA6`: el tercero
;   (5B) es el primer byte del banco 3, en 0xA000. Sigue a `call 0x9EE5` en
;   p02:9FFB; el codigo de la camara continua de largo en p03:A001 por el `jr
;   c` de p02:9FF3
;   0x9ffe..0xa000  (2 bytes)
DATA_jp_partido:
	defb 0c3h,0a6h	; 9ffe
