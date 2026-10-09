; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 01 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS tercer_byte_del_call_de_p00_5FFE: el byte alto (41) del `call 0x41EA`
;   que empieza en p00:5FFE: la instruccion cruza del banco 0 a este. Detras,
;   en 0x6001, la tabla de 9 destinos de ese despachador (el estado del
;   jugador)
;   0x6000..0x6001  (1 bytes)
DATA_tercer_byte_del_call_de_p00_5FFE:
	defb 041h	; 6000

; ----------------------------------------------------------------------
; DATOS tabla_6001: 9 destinos del despachador p00:41EA (call en p01:5FFE, el
;   indice en A): 6013, 605B, 6064, 6061, 6082, 609C, 60AD, 60C6, 60E3; lo
;   leen p01:5FFE (18 bytes)
;   0x6001..0x6013  (18 bytes)
DATA_tabla_6001:
	defw 06013h,0605bh,06064h,06061h,06082h,0609ch,060adh,060c6h	; 6001
	defw 060e3h	; 6011  -> snake_estado_8

; ======================================================================
; CODIGO 0x6013..0x6150  (317 bytes)
; ======================================================================


snake_estado_0:		; estado 0: teclas, salas especiales, golpe, velocidad, choque, pose y bordes
	ld a,(0c200h)		;6013   ; lee los proyectiles (0x180 bytes)
	cp 007h		;6016
	ret z			;6018
	call teclas_de_direccion		;6019   ; teclas_de_direccion: 0xC18C = la direccion de las teclas (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0x6150)
	call pose_por_la_ficha		;601c   ; pose_por_la_ficha: en las salas de 0x6342 elige el modo de pose 0xC18B por la ficha que pisa Snake
	ld a,(0c180h)		;601f   ; lee el estado de Snake
	cp 003h		;6022
	jp z,pose_de_snake		;6024   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
	call sala_35		;6027   ; sala_35: en la sala 0x35, con el objeto no 2 y Snake en el recuadro: abajo pone 0xC1A0, si no estado 5
	ld a,(0c180h)		;602a   ; lee el estado de Snake
	cp 005h		;602d
	jp z,pose_de_snake		;602f   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
	call golpe		;6032   ; golpe: con la tecla 0x20 nueva: estado 1, pose 1, 0xC190 = 8 y Snake quieta
	call velocidad_de_snake		;6035   ; velocidad_de_snake: 0xC185 y la velocidad de Snake (0xC186 Y, 0xC188 X) con el modulo 0xC143
	call choque_de_snake		;6038   ; choque_de_snake: mira con p02:8298 el sitio al que va Snake y la para si choca
	ld a,(0c18bh)		;603b   ; lee el modo de la pose de Snake
	dec a			;603e
	jr z,L_6055		;603f
	dec a			;6041
	jr z,L_6055		;6042
	sub 002h		;6044
	jr z,L_6055		;6046
	ld a,(0c135h)		;6048   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 019h		;604b
	ld a,007h		;604d
	jr z,L_6052		;604f
	xor a			;6051
L_6052:
	ld (0c18bh),a		;6052   ; guarda el modo de la pose de Snake
L_6055:
	call pose_de_snake		;6055   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
	jp mueve_snake		;6058   ; mueve_snake: suma las velocidades a Snake y mira los cuatro bordes (0xC133 y el modo 1)
snake_estado_1:		; estado 1: teclas de lado y la cuenta 0xC190 (vuelve al 0)
	call teclas_de_lado		;605b   ; teclas_de_lado: 0xC18C = la direccion de las teclas de lado (mascara 0x0C)
	call cuenta_del_golpe		;605e   ; cuenta_del_golpe: baja 0xC190 y al llegar a cero vuelve al estado 0
snake_estado_3:		; estado 3: solo la pose
	jp pose_de_snake		;6061   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
snake_estado_2:		; estado 2: el ascensor (0xC197/0xC198), velocidad, choque y el borde de lado
	call teclas_del_ascensor		;6064   ; teclas_del_ascensor: con X < 0x78 y arriba/abajo pulsadas, si el ascensor va a otra parada: 0xC195 y el modo 6
	ld a,(0c151h)		;6067   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 006h		;606a
	jp z,L_651E		;606c
	call teclas_de_lado		;606f   ; teclas_de_lado: 0xC18C = la direccion de las teclas de lado (mascara 0x0C)
	call velocidad_de_lado		;6072   ; velocidad_de_lado: la velocidad de Snake (0xC186/0xC188) si se pulsa izquierda o derecha
	call choque_de_snake		;6075   ; choque_de_snake: mira con p02:8298 el sitio al que va Snake y la para si choca
	xor a			;6078
	ld (0c18bh),a		;6079   ; guarda el modo de la pose de Snake
	call pose_de_snake		;607c   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
	jp mueve_snake_x		;607f   ; mueve_snake_x: suma la velocidad X (no baja de 0x68) y mira el borde derecho
snake_estado_4:		; estado 4: velocidad Y fija de 1 y la X de 0xC003 (bit 4), pose 3
	ld hl,00100h		;6082
	ld (0c186h),hl		;6085   ; guarda la velocidad Y de Snake y el byte siguiente (16 bits)
	ld a,(0c003h)		;6088   ; lee la cuenta de cuadros
	bit 4,a		;608b
	jr z,L_6091		;608d
	ld h,0ffh		;608f
L_6091:
	ld (0c188h),hl		;6091   ; guarda la velocidad X de Snake y el byte siguiente (16 bits)
	ld a,003h		;6094
	ld (0c18bh),a		;6096   ; guarda el modo de la pose de Snake
	jp L_6055		;6099
snake_estado_5:		; estado 5: sube 3 puntos por cuadro hasta Y = 0x30, y vuelve al 0
	ld hl,0c182h		;609c   ; apunta a la Y de Snake
	ld a,(hl)			;609f
	cp 030h		;60a0
	jr c,L_60A8		;60a2
	dec (hl)			;60a4
	dec (hl)			;60a5
	dec (hl)			;60a6
	ret			;60a7
L_60A8:
	xor a			;60a8
	ld (0c180h),a		;60a9   ; guarda el estado de Snake
	ret			;60ac
snake_estado_6:		; estado 6: teclas de lado, velocidad, choque y la ficha 8 con arriba
	call teclas_de_lado		;60ad   ; teclas_de_lado: 0xC18C = la direccion de las teclas de lado (mascara 0x0C)
	call velocidad_de_lado		;60b0   ; velocidad_de_lado: la velocidad de Snake (0xC186/0xC188) si se pulsa izquierda o derecha
	call choque_de_snake		;60b3   ; choque_de_snake: mira con p02:8298 el sitio al que va Snake y la para si choca
	call sube_por_la_ficha_8		;60b6   ; sube_por_la_ficha_8: sobre la ficha 8 con arriba nueva: Y = 0x99, estado 7 y pose 5
	ld a,(0c180h)		;60b9   ; lee el estado de Snake
	cp 007h		;60bc
	ret z			;60be
	xor a			;60bf
	ld (0c18bh),a		;60c0   ; guarda el modo de la pose de Snake
	jp L_6055		;60c3
snake_estado_7:		; estado 7: teclas de arriba/abajo en la sala 0xE0
	call teclas_arriba_abajo		;60c6   ; teclas_arriba_abajo: 0xC18C = la direccion de las teclas de arriba/abajo (mascara 3)
	call velocidad_arriba_abajo		;60c9   ; velocidad_arriba_abajo: la velocidad de Snake (0xC186/0xC188) si se pulsa arriba o abajo
	call choque_de_snake		;60cc   ; choque_de_snake: mira con p02:8298 el sitio al que va Snake y la para si choca
	call baja_en_la_sala_e0		;60cf   ; baja_en_la_sala_e0: en la sala 0xE0 con Y = 0x99 y un lado: Y = 0x9E, estado 6
	ld a,(0c180h)		;60d2   ; lee el estado de Snake
	cp 006h		;60d5
	ret z			;60d7
	ld a,005h		;60d8
	ld (0c18bh),a		;60da   ; guarda el modo de la pose de Snake
	call pose_de_snake		;60dd   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
	jp mueve_snake_y		;60e0   ; mueve_snake_y: suma la velocidad Y y mira los bordes de arriba/abajo (con los casos de 0xE0 y 0xE2)
snake_estado_8:		; estado 8: p09:AE8F y, al volver al 0, p06:BDF8
	call 04919h		;60e3   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0ae8fh		;60e6   ; intro_paso: un paso de la entrada de Snake (0xC920, tabla 0xAE98)
	call 04248h		;60e9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c180h)		;60ec   ; lee el estado de Snake
	and a			;60ef
	ret nz			;60f0
	call 04913h		;60f1   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bdf8h		;60f4   ; punto_de_control: si (sala, parada) esta en 0xBE64 (31 parejas), guarda la partida en 0xCA00
	jp 04248h		;60f7   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
teclas_arriba_abajo:		; 0xC18C = la direccion de las teclas de arriba/abajo (mascara 3)
	ld c,003h		;60fa
	jr teclas_con_mascara		;60fc
teclas_de_lado:		; 0xC18C = la direccion de las teclas de lado (mascara 0x0C)
	ld c,00ch		;60fe
	jr teclas_con_mascara		;6100
teclas_de_direccion:		; 0xC18C = la direccion de las teclas (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0x6150)
	ld c,00fh		;6102
teclas_con_mascara:		; 0xC18C = la direccion de las teclas de la mascara C, la ultima pulsada manda
	ld a,(0c006h)		;6104   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and c			;6107
	jr nz,L_6126		;6108
	ld hl,0c191h		;610a
	ld a,(0c007h)		;610d   ; lee las teclas que hay
	and c			;6110
	ld b,a			;6111
	and (hl)			;6112
	ld a,b			;6113
	jr nz,L_6145		;6114
	ld hl,0c192h		;6116
	ld a,(0c007h)		;6119   ; lee las teclas que hay
	and c			;611c
	and (hl)			;611d
	ld a,b			;611e
	jr z,L_6145		;611f
	ld a,(hl)			;6121
	ld (hl),000h		;6122
	jr L_6142		;6124
L_6126:
	ld a,(0c191h)		;6126
	ld (0c192h),a		;6129
	ld a,(0c006h)		;612c   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and c			;612f
	ld c,a			;6130
	and 001h		;6131
	jr nz,L_6142		;6133
	ld a,c			;6135
	and 002h		;6136
	jr nz,L_6142		;6138
	ld a,c			;613a
	and 004h		;613b
	jr nz,L_6142		;613d
	ld a,c			;613f
	and 008h		;6140
L_6142:
	ld (0c191h),a		;6142
L_6145:
	ld hl,06150h		;6145
	call 041e0h		;6148   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;614b
	ld (0c18ch),a		;614c   ; guarda la direccion de las teclas
	ret			;614f

; ----------------------------------------------------------------------
; DATOS tabla_6150: 16 bytes (0, 1, 2, 0, 3, 0, 0, 0, 4 y ceros) que p01:6145
;   lee en 0x6150 + A (los bits 0-3 de 0xC191) y guarda en 0xC18C
;   0x6150..0x6160  (16 bytes)
DATA_tabla_6150:
	defb 000h,001h,002h,000h,003h,000h,000h,000h,004h,000h,000h,000h,000h,000h,000h,000h	; 6150  ................

; ======================================================================
; CODIGO 0x6160..0x6342  (482 bytes)
; ======================================================================


velocidad_arriba_abajo:		; la velocidad de Snake (0xC186/0xC188) si se pulsa arriba o abajo
	xor a			;6160
	ld (0c1a0h),a		;6161
	ld a,(0c007h)		;6164   ; lee las teclas que hay
	and 003h		;6167
	jr nz,L_618D		;6169
	jr L_6187		;616b
velocidad_de_lado:		; la velocidad de Snake (0xC186/0xC188) si se pulsa izquierda o derecha
	xor a			;616d
	ld (0c1a0h),a		;616e
	ld a,(0c007h)		;6171   ; lee las teclas que hay
	and 00ch		;6174
	jr nz,L_618D		;6176
	jr L_6187		;6178
velocidad_de_snake:		; 0xC185 y la velocidad de Snake (0xC186 Y, 0xC188 X) con el modulo 0xC143
	ld a,(0c180h)		;617a   ; lee el estado de Snake
	cp 001h		;617d
	ret z			;617f
	ld a,(0c007h)		;6180   ; lee las teclas que hay
	and 00fh		;6183
	jr nz,L_618D		;6185
L_6187:
	inc a			;6187
	ld (0c18eh),a		;6188
	jr L_619A		;618b
L_618D:
	xor a			;618d
	ld (0c18eh),a		;618e
	ld a,(0c18ch)		;6191   ; lee la direccion de las teclas
	and a			;6194
	jr z,L_619A		;6195
	ld (0c185h),a		;6197   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
L_619A:
	ld hl,(0c143h)		;619a   ; lee el modulo de la velocidad de Snake y el byte siguiente (16 bits)
	ld e,l			;619d
	ld d,h			;619e
	ld a,(0c18eh)		;619f
	and a			;61a2
	jr nz,L_61B6		;61a3
	ld a,(0c185h)		;61a5   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;61a8
	jr z,L_61BB		;61a9
	dec a			;61ab
	jr z,L_61BE		;61ac
	dec a			;61ae
	jr z,L_61C3		;61af
	ld hl,00000h		;61b1
	jr L_61C6		;61b4
L_61B6:
	ld hl,00000h		;61b6
	jr L_61BE		;61b9
L_61BB:
	call 05c01h		;61bb   ; hl_negado: HL = -HL
L_61BE:
	ld de,00000h		;61be
	jr L_61C9		;61c1
L_61C3:
	call 05bfbh		;61c3   ; de_negado: DE = -DE
L_61C6:
	ld hl,00000h		;61c6
L_61C9:
	ld (0c186h),hl		;61c9   ; guarda la velocidad Y de Snake y el byte siguiente (16 bits)
	ld (0c188h),de		;61cc   ; guarda la velocidad X de Snake y el byte siguiente (16 bits)
	ld a,(0c1a0h)		;61d0
	and a			;61d3
	ret z			;61d4
	ld hl,00000h		;61d5
	ld (0c186h),hl		;61d8   ; guarda la velocidad Y de Snake y el byte siguiente (16 bits)
	ret			;61db
golpe:		; con la tecla 0x20 nueva: estado 1, pose 1, 0xC190 = 8 y Snake quieta
	ld a,(0c006h)		;61dc   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 020h		;61df
	ret z			;61e1
	ld a,(0c18bh)		;61e2   ; lee el modo de la pose de Snake
	cp 002h		;61e5
	ret z			;61e7
	cp 004h		;61e8
	ret z			;61ea
	cp 007h		;61eb
	ret z			;61ed
	ld a,008h		;61ee
	ld (0c190h),a		;61f0   ; guarda la cuenta del golpe
	ld a,001h		;61f3
	ld (0c18bh),a		;61f5   ; guarda el modo de la pose de Snake
	ld (0c180h),a		;61f8   ; guarda el estado de Snake
snake_quieta:		; la velocidad de Snake a cero (0xC186 y 0xC188)
	ld hl,00000h		;61fb
	ld (0c186h),hl		;61fe   ; guarda la velocidad Y de Snake y el byte siguiente (16 bits)
	ld (0c188h),hl		;6201   ; guarda la velocidad X de Snake y el byte siguiente (16 bits)
	ret			;6204
choque_de_snake:		; mira con p02:8298 el sitio al que va Snake y la para si choca
	ld a,(0c180h)		;6205   ; lee el estado de Snake
	dec a			;6208
	jr z,golpe_contra_pared		;6209
	ld hl,(0c181h)		;620b   ; lee la Y de Snake (16 bits)
	ld de,(0c186h)		;620e   ; lee la velocidad Y de Snake y el byte siguiente (16 bits)
	add hl,de			;6212
	ld a,h			;6213
	ld hl,(0c183h)		;6214   ; lee la X de Snake (16 bits)
	ld de,(0c188h)		;6217   ; lee la velocidad X de Snake y el byte siguiente (16 bits)
	add hl,de			;621b
	ld l,a			;621c
	ld b,000h		;621d
	ld a,(0c185h)		;621f   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld c,a			;6222
	push bc			;6223
	push hl			;6224
	call 08298h		;6225   ; choca: acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)
	pop hl			;6228
	pop bc			;6229
	jr c,snake_quieta		;622a
	ld a,(0c130h)		;622c   ; lee la sala
	cp 04eh		;622f
	ret nz			;6231
	ld b,002h		;6232
	call 08298h		;6234   ; choca: acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)
	ret nc			;6237
	jr snake_quieta		;6238
golpe_contra_pared:		; mira con p02:8298 dos puntos por delante y, si hay pared, el sonido 9
	ld a,(0c185h)		;623a   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;623d
	ld bc,0fe00h		;623e
	ld d,c			;6241
	ld e,c			;6242
	jr z,L_6253		;6243
	dec a			;6245
	ld b,002h		;6246
	jr z,L_6253		;6248
	dec a			;624a
	ld b,d			;624b
	ld c,d			;624c
	ld d,0feh		;624d
	jr z,L_6253		;624f
	ld d,002h		;6251
L_6253:
	ld hl,(0c181h)		;6253   ; lee la Y de Snake (16 bits)
	add hl,bc			;6256
	ld a,h			;6257
	ld hl,(0c183h)		;6258   ; lee la X de Snake (16 bits)
	add hl,de			;625b
	ld l,a			;625c
	ld b,000h		;625d
	ld a,(0c185h)		;625f   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld c,a			;6262
	call 08298h		;6263   ; choca: acarreo si alguno de los 2 puntos de la caja B (0x82CB) hacia C, desde Y = L, X = H, pisa una ficha con choque (0xC700 bit 0)
	ld a,009h		;6266
	call c,0427ch		;6268   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ret			;626b
cuenta_del_golpe:		; baja 0xC190 y al llegar a cero vuelve al estado 0
	ld hl,0c190h		;626c   ; apunta a la cuenta del golpe
	dec (hl)			;626f
	ret nz			;6270
	xor a			;6271
	ld (0c18bh),a		;6272   ; guarda el modo de la pose de Snake
	ld (0c180h),a		;6275   ; guarda el estado de Snake
	ret			;6278
teclas_del_ascensor:		; con X < 0x78 y arriba/abajo pulsadas, si el ascensor va a otra parada: 0xC195 y el modo 6
	ld a,(0c184h)		;6279   ; lee la X de Snake
	cp 078h		;627c
	ret nc			;627e
	ld c,003h		;627f
	ld a,(0c130h)		;6281   ; lee la sala
	cp 0f3h		;6284
	jr c,L_6293		;6286
	cp 0f7h		;6288
	jr nc,L_6293		;628a
	ld c,001h		;628c
	cp 0f5h		;628e
	jr c,L_6293		;6290
	inc c			;6292
L_6293:
	ld a,(0c007h)		;6293   ; lee las teclas que hay
	and c			;6296
	ret z			;6297
	ld hl,0c193h		;6298
	rra			;629b
	jr c,L_62A5		;629c
	ld c,002h		;629e
	ld a,(0c198h)		;62a0   ; lee el segundo byte del ascensor
	jr L_62AA		;62a3
L_62A5:
	ld c,001h		;62a5
	ld a,(0c197h)		;62a7   ; lee el primer byte del ascensor
L_62AA:
	cp (hl)			;62aa
	ret z			;62ab
	ld a,c			;62ac
	ld (0c195h),a		;62ad
	ld hl,0c196h		;62b0
	ld (hl),000h		;62b3
	ld a,006h		;62b5
	ld (0c151h),a		;62b7   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ret			;62ba
pose_por_la_ficha:		; en las salas de 0x6342 elige el modo de pose 0xC18B por la ficha que pisa Snake
	ld a,(0c130h)		;62bb   ; lee la sala
	ld hl,06342h		;62be
	ld b,00ah		;62c1
L_62C3:
	cp (hl)			;62c3
	jr z,L_62D4		;62c4
	inc hl			;62c6
	djnz L_62C3		;62c7
	ld a,(0c18bh)		;62c9   ; lee el modo de la pose de Snake
	cp 007h		;62cc
	ret z			;62ce
	xor a			;62cf
	ld (0c18bh),a		;62d0   ; guarda el modo de la pose de Snake
	ret			;62d3
L_62D4:
	call 082fbh		;62d4   ; fichas_de_snake: H y L = las dos fichas de la sala bajo Snake
	ld a,h			;62d7
	cp 06fh		;62d8
	jr c,L_62E8		;62da
	cp 073h		;62dc
	jr c,L_630F		;62de
	cp 075h		;62e0
	jr c,L_6321		;62e2
	cp 077h		;62e4
	jr c,L_631D		;62e6
L_62E8:
	ld a,l			;62e8
	cp 06fh		;62e9
	jr c,L_62F9		;62eb
	cp 073h		;62ed
	jr c,L_630F		;62ef
	cp 075h		;62f1
	jr c,L_6321		;62f3
	cp 077h		;62f5
	jr c,L_631D		;62f7
L_62F9:
	ld a,h			;62f9
	cp 06dh		;62fa
	jr z,L_6321		;62fc
	ld a,l			;62fe
	cp 06dh		;62ff
	jr z,L_6321		;6301
	ld a,(0c135h)		;6303   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 019h		;6306
	ld a,007h		;6308
	jr z,L_6323		;630a
	xor a			;630c
	jr L_6323		;630d
L_630F:
	ld a,(0c130h)		;630f   ; lee la sala
	ld hl,06342h		;6312
	ld b,006h		;6315
L_6317:
	cp (hl)			;6317
	jr z,L_6321		;6318
	inc hl			;631a
	djnz L_6317		;631b
L_631D:
	ld a,004h		;631d
	jr L_6323		;631f
L_6321:
	ld a,002h		;6321
L_6323:
	ld hl,0c18bh		;6323   ; apunta a el modo de la pose de Snake
	cp (hl)			;6326
	ld (0c18bh),a		;6327   ; guarda el modo de la pose de Snake
	jr z,L_6333		;632a
	xor a			;632c
	ld (0c18dh),a		;632d
	ld (0c18fh),a		;6330
L_6333:
	ld a,(hl)			;6333
	cp 004h		;6334
	ret nz			;6336
	ld a,(0c135h)		;6337   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 00ah		;633a
	ret z			;633c
	ld c,008h		;633d
	jp 08c1ch		;633f   ; dano_cada_c: si 0xC199 es cero: 0xC199 = C y dano 2

; ----------------------------------------------------------------------
; DATOS salas_6342: 10 numeros de sala (0x46, 0x49, 0x4A, 0x4D, 0x4E, 0x6B,
;   0x69, 0x6A, 0xD3, 0xD4): p01:62C3 compara 0xC130 con las 10 y p01:6317
;   solo con las 6 primeras
;   0x6342..0x634c  (10 bytes)
DATA_salas_6342:
	defb 046h,049h,04ah,04dh,04eh,06bh,069h,06ah,0d3h,0d4h	; 6342  FIJMNkij..

; ======================================================================
; CODIGO 0x634c..0x6508  (444 bytes)
; ======================================================================


sala_35:		; en la sala 0x35, con el objeto no 2 y Snake en el recuadro: abajo pone 0xC1A0, si no estado 5
	xor a			;634c
	ld (0c1a0h),a		;634d
	ld a,(0c130h)		;6350   ; lee la sala
	cp 035h		;6353
	ret nz			;6355
	ld a,(0c135h)		;6356   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 002h		;6359
	ret z			;635b
	ld a,(0c182h)		;635c   ; lee la Y de Snake
	cp 050h		;635f
	ret c			;6361
	cp 060h		;6362
	ret nc			;6364
	ld a,(0c184h)		;6365   ; lee la X de Snake
	cp 048h		;6368
	ret c			;636a
	cp 0c0h		;636b
	ret nc			;636d
	ld a,(0c007h)		;636e   ; lee las teclas que hay
	and 002h		;6371
	jr z,L_637B		;6373
	ld a,001h		;6375
	ld (0c1a0h),a		;6377
	ret			;637a
L_637B:
	ld a,005h		;637b
	ld (0c180h),a		;637d   ; guarda el estado de Snake
	ld a,011h		;6380
	jp 0427ch		;6382   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
sube_por_la_ficha_8:		; sobre la ficha 8 con arriba nueva: Y = 0x99, estado 7 y pose 5
	call 082fbh		;6385   ; fichas_de_snake: H y L = las dos fichas de la sala bajo Snake
	ld a,h			;6388
	cp 008h		;6389
	ret nz			;638b
	ld a,(0c006h)		;638c   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	rra			;638f
	ret nc			;6390
	ld a,099h		;6391
	ld (0c182h),a		;6393   ; guarda la Y de Snake
	ld a,007h		;6396
	ld (0c180h),a		;6398   ; guarda el estado de Snake
	ld a,005h		;639b
	ld (0c18bh),a		;639d   ; guarda el modo de la pose de Snake
	xor a			;63a0
	ld l,a			;63a1
	ld (0c192h),a		;63a2
	ld (0c18dh),a		;63a5
	ld (0c18fh),a		;63a8
	inc a			;63ab
	ld h,a			;63ac
	ld (0c185h),a		;63ad   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld (0c191h),a		;63b0
	ld (0c143h),hl		;63b3   ; guarda el modulo de la velocidad de Snake y el byte siguiente (16 bits)
	jr L_63F9		;63b6
baja_en_la_sala_e0:		; en la sala 0xE0 con Y = 0x99 y un lado: Y = 0x9E, estado 6
	ld a,(0c130h)		;63b8   ; lee la sala
	cp 0e0h		;63bb
	ret nz			;63bd
	ld a,(0c182h)		;63be   ; lee la Y de Snake
	cp 099h		;63c1
	ret nz			;63c3
	ld a,(0c006h)		;63c4   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 00ch		;63c7
	ret z			;63c9
	and 008h		;63ca
	ld bc,00804h		;63cc
	jr nz,L_63D4		;63cf
	ld bc,00403h		;63d1
L_63D4:
	ld a,c			;63d4
	ld (0c185h),a		;63d5   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,b			;63d8
	ld (0c191h),a		;63d9
	ld a,09eh		;63dc
	ld (0c182h),a		;63de   ; guarda la Y de Snake
	ld a,006h		;63e1
	ld (0c180h),a		;63e3   ; guarda el estado de Snake
	ld hl,00200h		;63e6
	ld (0c143h),hl		;63e9   ; guarda el modulo de la velocidad de Snake y el byte siguiente (16 bits)
	xor a			;63ec
	ld (0c18bh),a		;63ed   ; guarda el modo de la pose de Snake
	ld (0c192h),a		;63f0
	ld (0c18dh),a		;63f3
	ld (0c18fh),a		;63f6
L_63F9:
	jp pose_de_snake		;63f9   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
mueve_snake:		; suma las velocidades a Snake y mira los cuatro bordes (0xC133 y el modo 1)
	call suma_velocidad_x_snake		;63fc   ; suma_velocidad_x_snake: la X de Snake += 0xC188
	ld a,h			;63ff
	cp 00ch		;6400
	ld c,003h		;6402
	jp c,sale_por_el_lado		;6404   ; sale_por_el_lado: 0xC133 = C y el modo de la partida 0xC151 = 1 (cambio de sala)
	inc c			;6407
	cp 0f4h		;6408
	jp nc,sale_por_el_lado		;640a   ; sale_por_el_lado: 0xC133 = C y el modo de la partida 0xC151 = 1 (cambio de sala)
	call suma_velocidad_y_snake		;640d   ; suma_velocidad_y_snake: la Y de Snake += 0xC186
	ld a,h			;6410
	cp 010h		;6411
	ld c,001h		;6413
	jr c,sale_por_el_lado		;6415
	inc c			;6417
	cp 0bah		;6418
	jr nc,sale_por_el_lado		;641a
	ret			;641c
mueve_snake_x:		; suma la velocidad X (no baja de 0x68) y mira el borde derecho
	call suma_velocidad_x_snake		;641d   ; suma_velocidad_x_snake: la X de Snake += 0xC188
	ld a,h			;6420
	cp 068h		;6421
	jr nc,L_642B		;6423
	ld h,068h		;6425
	ld (0c183h),hl		;6427   ; guarda la X de Snake (16 bits)
	ret			;642a
L_642B:
	ld a,h			;642b
	cp 0f4h		;642c
	ld c,004h		;642e
	jp nc,sale_por_el_lado		;6430   ; sale_por_el_lado: 0xC133 = C y el modo de la partida 0xC151 = 1 (cambio de sala)
	ret			;6433
mueve_snake_y:		; suma la velocidad Y y mira los bordes de arriba/abajo (con los casos de 0xE0 y 0xE2)
	call suma_velocidad_y_snake		;6434   ; suma_velocidad_y_snake: la Y de Snake += 0xC186
	ld a,(0c130h)		;6437   ; lee la sala
	cp 0e2h		;643a
	jr nz,L_6445		;643c
	ld c,a			;643e
	ld a,h			;643f
	cp 010h		;6440
	jr c,L_646B		;6442
	ld a,c			;6444
L_6445:
	cp 0e0h		;6445
	jr nz,L_6454		;6447
	ld a,h			;6449
	cp 099h		;644a
	jr c,L_6454		;644c
	ld h,099h		;644e
	ld (0c181h),hl		;6450   ; guarda la Y de Snake (16 bits)
	ret			;6453
L_6454:
	ld a,h			;6454
	cp 010h		;6455
	ld c,001h		;6457
	jr c,sale_por_el_lado		;6459
	inc c			;645b
	cp 0bah		;645c
	jr nc,sale_por_el_lado		;645e
	ret			;6460
sale_por_el_lado:		; 0xC133 = C y el modo de la partida 0xC151 = 1 (cambio de sala)
	ld a,c			;6461
	ld (0c133h),a		;6462   ; guarda el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,001h		;6465
	ld (0c151h),a		;6467   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ret			;646a
L_646B:
	ld a,001h		;646b
	ld (0c124h),a		;646d
	ret			;6470
suma_velocidad_x_snake:		; la X de Snake += 0xC188
	ld de,(0c188h)		;6471   ; lee la velocidad X de Snake y el byte siguiente (16 bits)
	ld hl,(0c183h)		;6475   ; lee la X de Snake (16 bits)
	add hl,de			;6478
	ld (0c183h),hl		;6479   ; guarda la X de Snake (16 bits)
	ret			;647c
suma_velocidad_y_snake:		; la Y de Snake += 0xC186
	ld de,(0c186h)		;647d   ; lee la velocidad Y de Snake y el byte siguiente (16 bits)
	ld hl,(0c181h)		;6481   ; lee la Y de Snake (16 bits)
	add hl,de			;6484
	ld (0c181h),hl		;6485   ; guarda la Y de Snake (16 bits)
	ret			;6488
baja_c132:		; borra 0xC640-0xC651 (salvo 0xC64D) y, si 0xC132 > 0, lo baja con el sonido 0x27
	ld a,(0c64dh)		;6489
	ld hl,0c640h		;648c
	ld de,0c641h		;648f
	ld bc,00011h		;6492
	ld (hl),b			;6495
	ldir		;6496
	ld (0c64dh),a		;6498
	xor a			;649b
	ld (0c13ah),a		;649c
	ld hl,0c132h		;649f   ; apunta a la CLASS (0-3 estrellas)
	ld a,(hl)			;64a2
	and a			;64a3
	ret z			;64a4
	dec (hl)			;64a5
	ld a,027h		;64a6
	call 0427ch		;64a8   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld a,(0c131h)		;64ab   ; lee la vida (LIFE)
	push af			;64ae
	call maximo_c137		;64af   ; maximo_c137: 0xC137 = 0x20, 0x28, 0x30 o 0x18 segun 0xC132 (1, 2, 3, 0) y lo pinta
	pop af			;64b2
	ld c,a			;64b3
	ld a,(0c137h)		;64b4   ; lee la vida maxima
	cp c			;64b7
	jr nc,L_64BE		;64b8
	ld a,(0c137h)		;64ba   ; lee la vida maxima
	ld c,a			;64bd
L_64BE:
	ld a,c			;64be
	ld (0c131h),a		;64bf   ; guarda la vida (LIFE)
	call 08f2eh		;64c2
	jp 04751h		;64c5   ; marcador_arma: pinta en el marcador el arma elegida (0xC134) y su municion
sube_c132_cada_5:		; sube 0xC13A y, cada 5, sube 0xC132
	ld hl,0c13ah		;64c8
	inc (hl)			;64cb
	ld a,(hl)			;64cc
	cp 005h		;64cd
	ret nz			;64cf
	ld (hl),000h		;64d0
sube_c132:		; sube 0xC132 hasta 3 con el sonido 0x26
	ld hl,0c132h		;64d2   ; apunta a la CLASS (0-3 estrellas)
	ld a,(hl)			;64d5
	cp 003h		;64d6
	ret z			;64d8
	inc (hl)			;64d9
	ld a,026h		;64da
	call 0427ch		;64dc   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
maximo_c137:		; 0xC137 = 0x20, 0x28, 0x30 o 0x18 segun 0xC132 (1, 2, 3, 0) y lo pinta
	push hl			;64df
	call 090aah		;64e0   ; estrellas: CLASS y las estrellas de 0xC132
	pop hl			;64e3
	ld c,(hl)			;64e4
	dec c			;64e5
	ld a,020h		;64e6
	jr z,L_64F6		;64e8
	dec c			;64ea
	ld a,028h		;64eb
	jr z,L_64F6		;64ed
	dec c			;64ef
	ld a,030h		;64f0
	jr z,L_64F6		;64f2
	ld a,018h		;64f4
L_64F6:
	ld (0c137h),a		;64f6   ; guarda la vida maxima
	ld (0c131h),a		;64f9   ; guarda la vida (LIFE)
	call 09067h		;64fc   ; barra_de_vida: LIFE y la barra 0xC131 sobre el maximo 0xC137
	jp 09101h		;64ff   ; maximos: los maximos de municion y de raciones por CLASS (0x918A-0x91BA) en 0xC380
pose_de_snake:		; elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
	ld a,(0c18bh)		;6502   ; lee el modo de la pose de Snake
	call 041eah		;6505   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_6508: 8 destinos del despachador p00:41EA (call en p01:6505, el
;   indice en A): 6518, 6561, 656A, 6589, 658E, 65A5, 65CA, 65E4; lo leen
;   p01:6505 (16 bytes)
;   0x6508..0x6518  (16 bytes)
DATA_tabla_6508:
	defw 06518h,06561h,0656ah,06589h,0658eh,065a5h,065cah,065e4h	; 6508

; ======================================================================
; CODIGO 0x6518..0x666a  (338 bytes)
; ======================================================================


pose_modo_0:		; andando: la pose por la direccion, el paso (0xC18F) y si lleva arma
	ld a,(0c18eh)		;6518
	and a			;651b
	jr z,L_6527		;651c
L_651E:
	xor a			;651e
	ld (0c18dh),a		;651f
	ld (0c18fh),a		;6522
	jr L_6540		;6525
L_6527:
	ld hl,0c18dh		;6527
	inc (hl)			;652a
	ld a,(hl)			;652b
	cp 006h		;652c
	jr nz,L_6536		;652e
	ld (hl),000h		;6530
	ld hl,0c18fh		;6532
	inc (hl)			;6535
L_6536:
	ld hl,0c18fh		;6536
	ld a,(hl)			;6539
	cp 003h		;653a
	jr nz,L_6540		;653c
	ld (hl),001h		;653e
L_6540:
	ld a,(0c185h)		;6540   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;6543
	ld c,a			;6544
	add a,a			;6545
	add a,c			;6546
	ld c,a			;6547
	ld a,(0c134h)		;6548   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	and a			;654b
	jr z,L_655A		;654c
	cp 005h		;654e
	jr z,L_655A		;6550
	cp 006h		;6552
	jr z,L_655A		;6554
	ld a,00ch		;6556
	add a,c			;6558
	ld c,a			;6559
L_655A:
	ld a,(0c18fh)		;655a
	add a,c			;655d
	jp pon_pose		;655e   ; pon_pose: 0xC18A = A
pose_modo_1:		; pose 0x18 + direccion - 1
	ld a,(0c185h)		;6561   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;6564
	add a,018h		;6565
	jp pon_pose		;6567   ; pon_pose: 0xC18A = A
pose_modo_2:		; pose 0x1C (0x20 con arma) + direccion - 1, + 0x11 con el bit 3 de 0xC003
	ld a,(0c185h)		;656a   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;656d
	ld c,a			;656e
	ld a,(0c134h)		;656f   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	and a			;6572
	ld a,01ch		;6573
	jr z,L_6579		;6575
	ld a,020h		;6577
L_6579:
	add a,c			;6579
	ld c,a			;657a
	ld a,(0c003h)		;657b   ; lee la cuenta de cuadros
	and 008h		;657e
	ld a,011h		;6580
	jr nz,L_6585		;6582
	xor a			;6584
L_6585:
	add a,c			;6585
	jp pon_pose		;6586   ; pon_pose: 0xC18A = A
pose_modo_3:		; pose 0x24
	ld a,024h		;6589
	jp pon_pose		;658b   ; pon_pose: 0xC18A = A
pose_modo_4:		; pose 0x25/0x26 alternas cada 4 cuadros
	ld hl,0c18dh		;658e
	inc (hl)			;6591
	ld a,(hl)			;6592
	cp 004h		;6593
	ret nz			;6595
	ld (hl),000h		;6596
	ld hl,0c18fh		;6598
	inc (hl)			;659b
	ld a,(hl)			;659c
	and 001h		;659d
	ld c,025h		;659f
	add a,c			;65a1
	jp pon_pose		;65a2   ; pon_pose: 0xC18A = A
pose_modo_5:		; pose 0x27/0x28 alternas cada 6 cuadros andando
	ld a,(0c18eh)		;65a5
	and a			;65a8
	jr z,L_65B1		;65a9
	xor a			;65ab
	ld (0c18dh),a		;65ac
	jr L_65BF		;65af
L_65B1:
	ld hl,0c18dh		;65b1
	inc (hl)			;65b4
	ld a,(hl)			;65b5
	cp 006h		;65b6
	ret nz			;65b8
	ld (hl),000h		;65b9
	ld hl,0c18fh		;65bb
	inc (hl)			;65be
L_65BF:
	ld a,(0c18fh)		;65bf
	and 001h		;65c2
	ld c,027h		;65c4
	add a,c			;65c6
	jp pon_pose		;65c7   ; pon_pose: 0xC18A = A
pose_modo_6:		; pose por 0xC19D (0x2B, 0x29 o la de la cuenta)
	ld a,(0c19dh)		;65ca
	cp 040h		;65cd
	ld c,02bh		;65cf
	jr c,L_65E0		;65d1
	ld c,029h		;65d3
	cp 070h		;65d5
	jr c,L_65E0		;65d7
	and 00ch		;65d9
	rra			;65db
	ld c,a			;65dc
	rra			;65dd
	add a,c			;65de
	ld c,a			;65df
L_65E0:
	ld a,c			;65e0
	jp pon_pose		;65e1   ; pon_pose: 0xC18A = A
pose_modo_7:		; pose 0x2A, o 0x2C con el bit 3 de 0xC003 andando
	ld a,(0c18eh)		;65e4
	and a			;65e7
	ld a,02ah		;65e8
	jr nz,pon_pose		;65ea
	ld a,(0c003h)		;65ec   ; lee la cuenta de cuadros
	and 008h		;65ef
	ld a,02ah		;65f1
	jr z,pon_pose		;65f3
	ld a,02ch		;65f5
pon_pose:		; 0xC18A = A
	ld (0c18ah),a		;65f7   ; guarda la pose de Snake
	ret			;65fa
sprite_de_la_grenade:		; con la GRENADE (arma 3): el sprite 0xEA24 (patron 0x18, color 14) delante de Snake (0x666A), o escondido
	ld a,(0c130h)		;65fb   ; lee la sala
	cp 0cch		;65fe
	ret z			;6600
	ld a,(0c134h)		;6601   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	cp 003h		;6604
	ret nz			;6606
	ld a,(0c18bh)		;6607   ; lee el modo de la pose de Snake
	cp 007h		;660a
	jr z,L_6664		;660c
	ld a,(0c130h)		;660e   ; lee la sala
	cp 0e0h		;6611
	jr nc,L_6664		;6613
	ld b,010h		;6615
	ld a,00eh		;6617
	ld hl,0e890h		;6619
L_661C:
	ld (hl),a			;661c
	inc hl			;661d
	djnz L_661C		;661e
	ld a,(0c182h)		;6620   ; lee la Y de Snake
	ld l,a			;6623
	ld c,a			;6624
	ld a,(0c184h)		;6625   ; lee la X de Snake
	ld h,a			;6628
	ld b,a			;6629
	ld a,(0c185h)		;662a   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;662d
	ld de,0666ah		;662e
	add a,a			;6631
	call 041e5h		;6632   ; de_mas_a: DE = DE + A
	ld a,(de)			;6635
	add a,l			;6636
	ld l,a			;6637
	inc de			;6638
	ld a,(de)			;6639
	add a,h			;663a
	ld h,a			;663b
	ld (0ea24h),hl		;663c
	ld a,018h		;663f
	ld (0ea26h),a		;6641
	ld a,(0c185h)		;6644   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;6647
	jr z,L_6655		;6648
	dec a			;664a
	jr z,L_665A		;664b
	dec a			;664d
	jr z,L_6660		;664e
	ld a,b			;6650
	cp 0c0h		;6651
	jr L_665D		;6653
L_6655:
	ld a,c			;6655
	cp 038h		;6656
	jr L_6663		;6658
L_665A:
	ld a,c			;665a
	cp 080h		;665b
L_665D:
	jr nc,L_6664		;665d
	ret			;665f
L_6660:
	ld a,b			;6660
	cp 050h		;6661
L_6663:
	ret nc			;6663
L_6664:
	ld a,0e1h		;6664
	ld (0ea24h),a		;6666
	ret			;6669

; ----------------------------------------------------------------------
; DATOS parejas_666a: 4 parejas, una por direccion (0xC185 = 1-4): p01:662E
;   lee 0x666A + 2 x (direccion - 1)
;   0x666a..0x6672  (8 bytes)
DATA_parejas_666a:
	defb 0ach,0f9h	; 666a
	defb 036h,0f9h	; 666c
	defb 0f0h,0b2h	; 666e
	defb 0f0h,03ch	; 6670

; ======================================================================
; CODIGO 0x6672..0x6686  (20 bytes)
; ======================================================================


juego_del_cuadro:		; sube 0xC003 y despacha por el estado del juego 0xC000 (tabla 0x6686)
	ld hl,0c003h		;6672   ; apunta a la cuenta de cuadros
	inc (hl)			;6675
	ld bc,(0c000h)		;6676   ; lee el estado del juego y el byte siguiente (16 bits)
	ld a,c			;667a
	cp 003h		;667b
	jr nc,L_6683		;667d
	ld hl,068bfh		;667f
	push hl			;6682
L_6683:
	call 041eah		;6683   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_6686: 9 destinos del despachador p00:41EA (call en p01:6683, el
;   indice en A): 6698, 6701, 670C, 6740, 675E, 6777, 67D0, 6819, 6897; lo
;   leen p01:6683 (18 bytes)
;   0x6686..0x6698  (18 bytes)
DATA_tabla_6686:
	defw 06698h,06701h,0670ch,06740h,0675eh,06777h,067d0h,06819h	; 6686
	defw 06897h	; 6696  -> juego_estado_8

; ======================================================================
; CODIGO 0x6698..0x6908  (624 bytes)
; ======================================================================


juego_estado_0:		; estado 0: los pasos 0xC001 del banco 9 (p09:B6B6, B4DA, B506, B670)
	djnz L_66B2		;6698
	call teclas_f_y_f0f7		;669a   ; teclas_f_y_f0f7: lee las teclas de funcion en 0xF0F9 y, con la 0x10 nueva, cambia 0xF0F7
	call 04919h		;669d   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b6b6h		;66a0   ; logotipo_konami_baja: descubre el logotipo de Konami linea a linea; al acabar 0xC132 = 1
	call 04248h		;66a3   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c132h)		;66a6   ; lee la CLASS (0-3 estrellas)
	or a			;66a9
	ret z			;66aa
	call 05317h		;66ab   ; nada: solo ret
	xor a			;66ae
	jp L_6738		;66af
L_66B2:
	djnz L_66C7		;66b2
	call teclas_f_y_f0f7		;66b4   ; teclas_f_y_f0f7: lee las teclas de funcion en 0xF0F9 y, con la 0x10 nueva, cambia 0xF0F7
	ld hl,0c004h		;66b7   ; apunta a la espera del estado, en cuadros
	dec (hl)			;66ba
	ret nz			;66bb
	call 04919h		;66bc   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b4dah		;66bf   ; titulo_prepara: pantalla limpia, fuente, titulo, paleta 0xB602 y la enciende
	call 04248h		;66c2   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	jr L_673B		;66c5
L_66C7:
	djnz L_66DF		;66c7
	call teclas_f_y_f0f7		;66c9   ; teclas_f_y_f0f7: lee las teclas de funcion en 0xF0F9 y, con la 0x10 nueva, cambia 0xF0F7
	call 04919h		;66cc   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b506h		;66cf   ; titulo_paso: un paso del titulo (0xC118, tabla 0xB515)
	call 04248h		;66d2   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c118h)		;66d5
	cp 004h		;66d8
	ret nz			;66da
	xor a			;66db
	jp L_676B		;66dc
L_66DF:
	call 04df8h		;66df   ; pantalla_limpia: esconde los sprites, apaga la pantalla, borra la pagina 0 y la enciende
	call 04919h		;66e2   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b670h		;66e5   ; logotipo_konami: el logotipo de Konami: paleta 0xB6A6, sus graficos y la cuenta en 0xC130/0xC131
	call 04248h		;66e8   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	jr L_673B		;66eb
teclas_f_y_f0f7:		; lee las teclas de funcion en 0xF0F9 y, con la 0x10 nueva, cambia 0xF0F7
	call teclas_de_funcion		;66ed   ; teclas_de_funcion: A = F1 (1), F2 (2), F3 (4), F4 (8), F5 (0x10) y RETURN (0x20)
	ld hl,0f0f9h		;66f0
	call guarda_teclas		;66f3   ; guarda_teclas: (HL) = A y (HL - 1) = las que no estaban
	bit 4,a		;66f6
	ret z			;66f8
	ld a,(0f0f7h)		;66f9
	cpl			;66fc
	ld (0f0f7h),a		;66fd
	ret			;6700
juego_estado_1:		; estado 1: espera 0xC004 cuadros y al estado siguiente
	call teclas_f_y_f0f7		;6701   ; teclas_f_y_f0f7: lee las teclas de funcion en 0xF0F9 y, con la 0x10 nueva, cambia 0xF0F7
	ld hl,0c004h		;6704   ; apunta a la espera del estado, en cuadros
	dec (hl)			;6707
	ret nz			;6708
	jp al_estado_siguiente		;6709   ; al_estado_siguiente: al estado siguiente con 0x20 cuadros de espera
juego_estado_2:		; estado 2: p06:BCAE y luego p06:BD6D/BD3F hasta 0xC123 = 0
	djnz L_672A		;670c
	call 04913h		;670e   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bd6dh		;6711   ; demo_teclas: la pareja [cuadros][teclas] siguiente del guion; 0xFF acaba (0xC123 = 0)
	call 0bd3fh		;6714   ; demo_cuadro: un cuadro de la demo (transceptor y ventana de texto en el guion 0)
	call 04248h		;6717   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c123h)		;671a
	or a			;671d
	ret nz			;671e
al_estado_0:		; estado 0 con 0x20 cuadros de espera
	xor a			;671f
al_estado_a:		; estado A con 0x20 cuadros de espera y el paso 0
	ld (0c000h),a		;6720   ; guarda el estado del juego
	ld a,020h		;6723
	ld (0c004h),a		;6725   ; guarda la espera del estado, en cuadros
	jr L_6772		;6728
L_672A:
	call 04df8h		;672a   ; pantalla_limpia: esconde los sprites, apaga la pantalla, borra la pagina 0 y la enciende
	call 04913h		;672d   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bcaeh		;6730   ; demo_empieza: el guion siguiente de la demo (0xC00C, 0xBD8F): sala, arma, transceptor y Snake
	call 04248h		;6733   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,020h		;6736
L_6738:
	ld (0c004h),a		;6738   ; guarda la espera del estado, en cuadros
L_673B:
	ld hl,0c001h		;673b   ; apunta a el paso del estado del juego
	inc (hl)			;673e
	ret			;673f
juego_estado_3:		; estado 3: el rotulo p02:9282 parpadeando, luego p02:8FB0
	djnz L_6753		;6740
	ld hl,0c004h		;6742   ; apunta a la espera del estado, en cuadros
	dec (hl)			;6745
	jr z,L_673B		;6746
	bit 2,(hl)		;6748
	ld hl,09282h		;674a
	call z,0510ch		;674d   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	jp 05110h		;6750   ; borra_rotulo: lo mismo que rotulo, con el caracter en blanco
L_6753:
	djnz L_675A		;6753
	call 08fb0h		;6755   ; borra_la_partida: 0xC120-0xEC8F a cero y 0xC008 = 0
	jr al_estado_siguiente		;6758
L_675A:
	ld a,050h		;675a
	jr L_6738		;675c
juego_estado_4:		; estado 4: pantalla limpia, la partida desde el principio (L_6D6F), 0xC123 = 1
	call 04df8h		;675e   ; pantalla_limpia: esconde los sprites, apaga la pantalla, borra la pagina 0 y la enciende
	call empieza_la_partida		;6761   ; empieza_la_partida: la partida desde el principio: puertas, objeto 6, sala 0x79 (si se juega), frecuencia 120.85, Snake
	ld hl,0c123h		;6764
	ld (hl),001h		;6767
al_estado_siguiente:		; al estado siguiente con 0x20 cuadros de espera
	ld a,020h		;6769
L_676B:
	ld (0c004h),a		;676b   ; guarda la espera del estado, en cuadros
	ld hl,0c000h		;676e   ; apunta a el estado del juego
	inc (hl)			;6771
L_6772:
	xor a			;6772
	ld (0c001h),a		;6773   ; guarda el paso del estado del juego
	ret			;6776
juego_estado_5:		; estado 5: la partida (L_6F18); 0xC008 = 1 la pausa
	xor a			;6777
	ld (0c0f1h),a		;6778
	call partida		;677b   ; partida: un cuadro de partida: Snake, actores y el modo 0xC151 (tabla 0x6F7A)
	ld a,(0c008h)		;677e   ; lee la pausa (1) o F5 (2)
	dec a			;6781
	jp z,L_6795		;6782
	ld a,(0c124h)		;6785
	and a			;6788
	ld a,008h		;6789
	jp nz,al_estado_a		;678b   ; al_estado_a: estado A con 0x20 cuadros de espera y el paso 0
	ld a,(0c123h)		;678e
	or a			;6791
	ret nz			;6792
	jr al_estado_siguiente		;6793
L_6795:
	call rotulo_pause		;6795   ; rotulo_pause: guarda el fondo y escribe PAUSE (0x5C1D)
	xor a			;6798
	ld hl,0e500h		;6799
	ld de,0e501h		;679c
	ld (hl),a			;679f
	ld bc,0001dh		;67a0
	ldir		;67a3
	inc a			;67a5
	ld (0c0f1h),a		;67a6
	ld a,04dh		;67a9
	call 0427ch		;67ab   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld a,007h		;67ae
	jp al_estado_a		;67b0   ; al_estado_a: estado A con 0x20 cuadros de espera y el paso 0
rotulo_pause:		; guarda el fondo y escribe PAUSE (0x5C1D)
	ld hl,06c58h		;67b3
	ld de,0d898h		;67b6
	ld bc,02808h		;67b9
	ld a,004h		;67bc
	push hl			;67be
	push bc			;67bf
	call 04fcdh		;67c0   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop bc			;67c3
	pop hl			;67c4
	xor a			;67c5
	ld d,a			;67c6
	call 04f91h		;67c7   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
	ld hl,05c1dh		;67ca
	jp 0510ch		;67cd   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
juego_estado_6:		; estado 6: espera que acabe la musica (0xC012) o la tecla
	djnz L_6809		;67d0
	ld a,(0c125h)		;67d2
	and a			;67d5
	call z,borra_game_over		;67d6   ; borra_game_over: con F5 borra el rotulo 0x92A0 y pone 0xC125 = 1
	ld a,(0c012h)		;67d9
	or a			;67dc
	ret nz			;67dd
L_67DE:
	ld a,(0c125h)		;67de
	and a			;67e1
	ld a,004h		;67e2
	jp nz,al_estado_a		;67e4   ; al_estado_a: estado A con 0x20 cuadros de espera y el paso 0
L_67E7:
	ld hl,0c002h		;67e7   ; apunta a las banderas del juego (bit 6: se juega; en la demo no)
	ld a,(hl)			;67ea
	and 0bfh		;67eb
	ld (hl),a			;67ed
	jp al_estado_0		;67ee   ; al_estado_0: estado 0 con 0x20 cuadros de espera
borra_game_over:		; con F5 borra el rotulo 0x92A0 y pone 0xC125 = 1
	call lee_teclas		;67f1   ; lee_teclas: si se juega, las teclas de funcion en 0xC113/0xC112 y las del juego en 0xC007/0xC006
	ld a,(0c113h)		;67f4   ; lee las teclas de funcion que hay
	bit 4,a		;67f7
	ret z			;67f9
	ld hl,092a0h		;67fa
	call 05110h		;67fd   ; borra_rotulo: lo mismo que rotulo, con el caracter en blanco
	xor a			;6800
	ld (0c6a0h),a		;6801   ; guarda la cinta (1 carga, 2 graba)
	inc a			;6804
	ld (0c125h),a		;6805
	ret			;6808
L_6809:
	call 04df8h		;6809   ; pantalla_limpia: esconde los sprites, apaga la pantalla, borra la pagina 0 y la enciende
	ld hl,09293h		;680c
	call 0510ch		;680f   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	xor a			;6812
	ld (0c125h),a		;6813
	jp L_673B		;6816
juego_estado_7:		; estado 7: la pausa: F1 sigue (y mira las claves tecleadas), F4 carga y F5 graba en cinta (0xC6A0)
	ld a,(0c6a0h)		;6819   ; lee la cinta (1 carga, 2 graba)
	or a			;681c
	jr z,L_684A		;681d
	call 04913h		;681f   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bea8h		;6822   ; lee_matriz: las 9 filas del teclado: las que hay en 0xE515 y las nuevas en 0xE50C
	call 04248h		;6825   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 04925h		;6828   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b948h		;682b   ; cinta: carga (0xC6A0 = 1) o graba (2) la partida en cinta, por pasos (0xC6A1)
	call 04248h		;682e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c165h)		;6831
	or a			;6834
	ret z			;6835
	xor a			;6836
	ld (0c008h),a		;6837   ; guarda la pausa (1) o F5 (2)
	ld (0c167h),a		;683a
	ld (0c6a0h),a		;683d   ; guarda la cinta (1 carga, 2 graba)
	inc a			;6840
	ld (0c0f1h),a		;6841
	ld (0c125h),a		;6844
	jp L_67DE		;6847
L_684A:
	call lee_teclas		;684a   ; lee_teclas: si se juega, las teclas de funcion en 0xC113/0xC112 y las del juego en 0xC007/0xC006
	ld a,(0c112h)		;684d   ; lee las teclas de funcion nuevas (F1 1, F2 2, F3 4, F4 8, F5 0x10)
	rra			;6850
	jr c,L_6873		;6851
	push af			;6853
	call 04913h		;6854   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bea2h		;6857   ; teclea_clave: lee el teclado y mete la tecla nueva en la clave (0xE500, 12 teclas)
	call 04248h		;685a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	pop af			;685d
	rra			;685e
	rra			;685f
	rra			;6860
	ld b,001h		;6861
	jr c,L_6868		;6863
	rra			;6865
	ret nc			;6866
	inc b			;6867
L_6868:
	ld a,b			;6868
	ld (0c6a0h),a		;6869   ; guarda la cinta (1 carga, 2 graba)
	xor a			;686c
	ld (0c6a1h),a		;686d
	jp 04e2ch		;6870   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
L_6873:
	call 04913h		;6873   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bf2fh		;6876   ; claves: las 5 claves (0xBEF1, BEF6, BF03, BF0C, BF16): CLASS +1, CLASS +3, municion 999, raciones 999, las CARD1-8
	call 04248h		;6879   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	xor a			;687c
	ld (0c008h),a		;687d   ; guarda la pausa (1) o F5 (2)
	inc a			;6880
	ld (0c0f1h),a		;6881
	ld de,06c58h		;6884
	ld hl,0d898h		;6887
	ld bc,02808h		;688a
	ld a,001h		;688d
	call 04fcdh		;688f   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld a,005h		;6892
	jp al_estado_a		;6894   ; al_estado_a: estado A con 0x20 cuadros de espera y el paso 0
juego_estado_8:		; estado 8: p15:B8BC, BD92 y B8DE hasta 0xC922 = 0x0E
	djnz L_68B3		;6897
	call 04925h		;6899   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b8bch		;689c   ; cambia_tabla_de_sprites: alterna las tablas de atributos (0xF600/0xF400 y 0xF200/0xF000) con R#5
	call 0bd92h		;689f   ; final_paso: un paso del final (0xC922): Snake corre, transceptor, textos, fundido y la cuenta 0xC13D
	call 0b8deh		;68a2   ; sprites_a_vram: atributos y colores a la tabla de 0xC114, empezando cada cuadro por otro grupo (0xC00F)
	call 04248h		;68a5   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0c922h		;68a8
	ld a,(hl)			;68ab
	sub 00eh		;68ac
	ret nz			;68ae
	ld (hl),a			;68af
	jp L_67E7		;68b0
L_68B3:
	call 04925h		;68b3   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bd62h		;68b6   ; final_prepara: sala 0xFB, cuenta 0x200, modo 4, Snake en (0x80, 0x80) y la frecuencia 0x13
	call 04248h		;68b9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	jp L_673B		;68bc
teclas_del_titulo:		; en los estados 0-2: con la tecla 0x10/0x20 empieza la partida (0xC002 = 0x40, estado 3)
	call teclas		;68bf   ; teclas: A = palanca y cursores: 1 arriba, 2 abajo, 4 izquierda, 8 derecha, 0x10 espacio/boton 1, 0x20 M, N o boton 2
	ld hl,0c111h		;68c2
	call guarda_teclas		;68c5   ; guarda_teclas: (HL) = A y (HL - 1) = las que no estaban
	or a			;68c8
	ret z			;68c9
	ld hl,0c004h		;68ca   ; apunta a la espera del estado, en cuadros
	ld (hl),000h		;68cd
	ld hl,0c000h		;68cf   ; apunta a el estado del juego
	ld b,(hl)			;68d2
	djnz L_68E2		;68d3
	and 030h		;68d5
	ret z			;68d7
	ld a,040h		;68d8
	ld (0c002h),a		;68da   ; guarda las banderas del juego (bit 6: se juega; en la demo no)
	ld (hl),003h		;68dd
	inc hl			;68df
	ld (hl),b			;68e0
	ret			;68e1
L_68E2:
	ld (hl),001h		;68e2
	ld a,028h		;68e4
	call 04284h		;68e6   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
	call 04919h		;68e9   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b4dah		;68ec   ; titulo_prepara: pantalla limpia, fuente, titulo, paleta 0xB602 y la enciende
	ld a,004h		;68ef
	ld (0c118h),a		;68f1
	call 0b506h		;68f4   ; titulo_paso: un paso del titulo (0xC118, tabla 0xB515)
	jp 04248h		;68f7   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
modo_4:		; modo 4: el transceptor (pasos 0xC153, tabla 0x6908)
	ld a,(0c112h)		;68fa   ; lee las teclas de funcion nuevas (F1 1, F2 2, F3 4, F4 8, F5 0x10)
	and 008h		;68fd
	jp nz,sale_del_transceptor		;68ff   ; sale_del_transceptor: paleta de Snake y vuelve a la sala
	ld a,(0c153h)		;6902   ; lee el paso del modo
	call 041eah		;6905   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_6908: 5 destinos del despachador p00:41EA (call en p01:6905, el
;   indice en A): 6912, 695E, 699F, 69B8, 69CC; lo leen p01:6905 (10 bytes)
;   0x6908..0x6912  (10 bytes)
DATA_tabla_6908:
	defw 06912h,0695eh,0699fh,069b8h,069cch	; 6908

; ======================================================================
; CODIGO 0x6912..0x6b34  (546 bytes)
; ======================================================================


transceptor_abre:		; paso 0: la pantalla del transceptor (marco p15:B369, retrato p15:B40D, rotulo, frecuencia)
	call 04e0eh		;6912   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04e2ch		;6915   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	call 04e1bh		;6918   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
	call 04aaah		;691b   ; paleta_del_transceptor: manda al VDP la paleta p05:8B1E
	ld a,002h		;691e
	ld (0c15fh),a		;6920   ; guarda la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna)
	dec a			;6923
	ld (0c168h),a		;6924
	ld de,03018h		;6927
	ld hl,0b369h		;692a
	call 0449eh		;692d
	ld de,0c828h		;6930
	ld hl,0b40dh		;6933
	call 0449eh		;6936
	ld hl,0c800h		;6939
	ld de,0c801h		;693c   ; apunta a la barra de senal del transceptor (0-12)
	ld bc,00010h		;693f
	ld (hl),000h		;6942
	ldir		;6944
	call 04bb1h		;6946   ; rotulo_b833: escribe el rotulo p06:B833
	call digitos_de_frecuencia		;6949   ; digitos_de_frecuencia: los dos digitos de 0xC138 en (0x98, 0x21), dos caracteres cada uno (0x6B34)
	call 08fc1h		;694c   ; marcador: LIFE, CLASS, la llamada, el arma y el objeto
	call siguiente_paso_c153		;694f   ; siguiente_paso_c153: sube 0xC153
	ld a,(0c922h)		;6952
	and a			;6955
	ld a,050h		;6956
	call z,0427ch		;6958   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	jp 04e01h		;695b   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)
transceptor_espera:		; paso 1: RECV; con arriba nueva, SEND y el texto 10; si no, cambia la frecuencia y busca llamada
	ld a,(0c800h)		;695e
	and a			;6961
	jr z,L_696D		;6962
	ld a,(0c922h)		;6964
	and a			;6967
	ld a,050h		;6968
	call z,0427ch		;696a   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
L_696D:
	ld de,06b48h		;696d
	ld hl,06b4fh		;6970
	call cambia_rotulo		;6973   ; cambia_rotulo: borra el rotulo DE y escribe el HL
	ld a,(0c006h)		;6976   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 001h		;6979
	jr nz,L_6986		;697b
	ld (0c800h),a		;697d
	call cambia_frecuencia		;6980   ; cambia_frecuencia: con izquierda/derecha sube o baja la frecuencia 0xC138 (BCD, 00-99)
	jp busca_llamada		;6983   ; busca_llamada: busca en 0xC880 una llamada con la frecuencia 0xC138 que se oiga; paso 2
L_6986:
	ld (0c800h),a		;6986
	ld (0c806h),a		;6989
	ld de,06b4fh		;698c
	ld hl,06b48h		;698f
	call cambia_rotulo		;6992   ; cambia_rotulo: borra el rotulo DE y escribe el HL
	ld a,05ch		;6995
	call 0427ch		;6997   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld a,00ah		;699a
	jp 05ce1h		;699c   ; ventana_de_texto: abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
transceptor_senal:		; paso 2: sube la barra de senal 0xC801 hasta 12
	ld hl,0c802h		;699f
	dec (hl)			;69a2
	ret nz			;69a3
	ld (hl),002h		;69a4
	ld hl,0c801h		;69a6   ; apunta a la barra de senal del transceptor (0-12)
	inc (hl)			;69a9
	push hl			;69aa
	call barra_de_senal		;69ab   ; barra_de_senal: la barra de senal 0xC801 (0-12) desde (0x40, 0x20)
	pop hl			;69ae
	ld a,(hl)			;69af
	cp 00ch		;69b0
	ret nz			;69b2
siguiente_paso_c153:		; sube 0xC153
	ld hl,0c153h		;69b3   ; apunta a el paso del modo
	inc (hl)			;69b6
	ret			;69b7
transceptor_texto:		; paso 3: el texto de la llamada ((0xC803) + 3) con el sonido 0x5C
	ld hl,0c153h		;69b8   ; apunta a el paso del modo
	ld (hl),004h		;69bb
	ld a,05ch		;69bd
	call 0427ch		;69bf   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	ld hl,(0c803h)		;69c2
	inc hl			;69c5
	inc hl			;69c6
	inc hl			;69c7
	ld a,(hl)			;69c8
	jp 05ce1h		;69c9   ; ventana_de_texto: abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
transceptor_vuelve:		; paso 4: vuelve al paso 1 con la barra a cero
	xor a			;69cc
	ld (0c806h),a		;69cd
	ld (0c801h),a		;69d0   ; guarda la barra de senal del transceptor (0-12)
	inc a			;69d3
	ld (0c805h),a		;69d4
	ld hl,0c153h		;69d7   ; apunta a el paso del modo
	ld (hl),a			;69da
	ld a,(0c922h)		;69db
	and a			;69de
	ld a,050h		;69df
	call z,0427ch		;69e1   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	jp barra_de_senal		;69e4   ; barra_de_senal: la barra de senal 0xC801 (0-12) desde (0x40, 0x20)
L_69E7:
	ld de,06b48h		;69e7
	ld hl,06b4fh		;69ea
	jr cambia_rotulo		;69ed
L_69EF:
	ld hl,06b48h		;69ef
	ld de,06b4fh		;69f2
	jr cambia_rotulo		;69f5
cambia_rotulo:		; borra el rotulo DE y escribe el HL
	push de			;69f7
	call 05110h		;69f8   ; borra_rotulo: lo mismo que rotulo, con el caracter en blanco
	pop hl			;69fb
	jp 0510ch		;69fc   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
L_69FF:
	call cambia_rotulo		;69ff   ; cambia_rotulo: borra el rotulo DE y escribe el HL
cambia_frecuencia:		; con izquierda/derecha sube o baja la frecuencia 0xC138 (BCD, 00-99)
	ld a,(0c006h)		;6a02   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 00ch		;6a05
	jr nz,L_6A18		;6a07
	ld a,(0c007h)		;6a09   ; lee las teclas que hay
	and 00ch		;6a0c
	ret z			;6a0e
	ld hl,0c15ch		;6a0f
	dec (hl)			;6a12
	ret nz			;6a13
	ld (hl),002h		;6a14
	jr L_6A25		;6a16
L_6A18:
	ld hl,0c805h		;6a18
	ld (hl),000h		;6a1b
	inc hl			;6a1d
	ld (hl),000h		;6a1e
	ld hl,0c15ch		;6a20
	ld (hl),008h		;6a23
L_6A25:
	rra			;6a25
	rra			;6a26
	rra			;6a27
	jr c,L_6A36		;6a28
	ld hl,0c138h		;6a2a   ; apunta a la frecuencia del transceptor (BCD)
	ld a,(hl)			;6a2d
	cp 099h		;6a2e
	ret z			;6a30
	add a,001h		;6a31
	daa			;6a33
	ld (hl),a			;6a34
	ret			;6a35
L_6A36:
	ld hl,0c138h		;6a36   ; apunta a la frecuencia del transceptor (BCD)
	ld a,(hl)			;6a39
	and a			;6a3a
	ret z			;6a3b
	sub 001h		;6a3c
	daa			;6a3e
	ld (hl),a			;6a3f
	ret			;6a40
busca_llamada:		; busca en 0xC880 una llamada con la frecuencia 0xC138 que se oiga; paso 2
	call digitos_de_frecuencia		;6a41   ; digitos_de_frecuencia: los dos digitos de 0xC138 en (0x98, 0x21), dos caracteres cada uno (0x6B34)
	ld a,(0c87fh)		;6a44   ; lee cuantas llamadas de radio tiene la sala
	and a			;6a47
	ret z			;6a48
	ld b,a			;6a49
	ld a,(0c138h)		;6a4a   ; lee la frecuencia del transceptor (BCD)
	ld c,a			;6a4d
	ld hl,0c880h		;6a4e   ; apunta a las llamadas de radio de la sala (fichas de 0x1D)
L_6A51:
	ld a,c			;6a51
	cp (hl)			;6a52
	jp z,L_6A5E		;6a53
L_6A56:
	ld a,020h		;6a56
	call 041e0h		;6a58   ; hl_mas_a: HL = HL + A
	djnz L_6A51		;6a5b
	ret			;6a5d
L_6A5E:
	inc hl			;6a5e
	inc hl			;6a5f
	ld a,(hl)			;6a60
	dec hl			;6a61
	dec hl			;6a62
	and 001h		;6a63
	jr z,L_6A6F		;6a65
	ld a,(0c806h)		;6a67
	and a			;6a6a
	jr z,L_6A56		;6a6b
	jr L_6A74		;6a6d
L_6A6F:
	ld a,(0c805h)		;6a6f
	and a			;6a72
	ret nz			;6a73
L_6A74:
	push hl			;6a74
	call llamada_callada		;6a75   ; llamada_callada: acarreo si la llamada de HL no se oye ahora (casos 0x85, 0x13, 0x79, 0x26, 0x48 y 0x0F)
	pop hl			;6a78
	ret c			;6a79
	ld (0c803h),hl		;6a7a
	ld hl,0c153h		;6a7d   ; apunta a el paso del modo
	ld (hl),002h		;6a80
	ld a,010h		;6a82
	ld (0c802h),a		;6a84
	ret			;6a87
llamada_callada:		; acarreo si la llamada de HL no se oye ahora (casos 0x85, 0x13, 0x79, 0x26, 0x48 y 0x0F)
	inc hl			;6a88
	inc hl			;6a89
	inc hl			;6a8a
	ld c,(hl)			;6a8b
	ld a,(0c161h)		;6a8c   ; lee el nibble de p12:A2FF de la sala
	cp 005h		;6a8f
	jr c,L_6A99		;6a91
	ld a,(0c5a7h)		;6a93
	and a			;6a96
	jr z,L_6B02		;6a97
L_6A99:
	dec hl			;6a99
	dec hl			;6a9a
	dec hl			;6a9b
	ld a,(hl)			;6a9c
	cp 085h		;6a9d
	jr z,L_6AA5		;6a9f
	cp 013h		;6aa1
	jr nz,L_6AB2		;6aa3
L_6AA5:
	ld a,(0c664h)		;6aa5
	and a			;6aa8
	jr z,L_6AB2		;6aa9
	inc hl			;6aab
	inc hl			;6aac
	inc hl			;6aad
	ld (hl),088h		;6aae
	jr L_6B00		;6ab0
L_6AB2:
	ld a,(hl)			;6ab2
	cp 085h		;6ab3
	jr z,L_6ABB		;6ab5
	cp 013h		;6ab7
	jr nz,L_6AD0		;6ab9
L_6ABB:
	ld a,(0c5b6h)		;6abb
	and a			;6abe
	jr z,L_6AD0		;6abf
	ld a,(0c161h)		;6ac1   ; lee el nibble de p12:A2FF de la sala
	cp 004h		;6ac4
	jp z,L_6AD0		;6ac6
	inc hl			;6ac9
	inc hl			;6aca
	inc hl			;6acb
	ld (hl),032h		;6acc
	jr L_6B00		;6ace
L_6AD0:
	ld a,(hl)			;6ad0
	cp 079h		;6ad1
	jr z,L_6AD9		;6ad3
	cp 026h		;6ad5
	jr nz,L_6AE1		;6ad7
L_6AD9:
	ld a,(0c662h)		;6ad9
	and a			;6adc
	jr z,L_6B00		;6add
	jr L_6B02		;6adf
L_6AE1:
	ld a,(hl)			;6ae1
	cp 048h		;6ae2
	jr nz,L_6AF5		;6ae4
	ld a,(0c132h)		;6ae6   ; lee la CLASS (0-3 estrellas)
	cp 003h		;6ae9
	jr nz,L_6B02		;6aeb
	ld a,(0c657h)		;6aed
	and a			;6af0
	jr nz,L_6B02		;6af1
	jr L_6B00		;6af3
L_6AF5:
	ld a,c			;6af5
	cp 00fh		;6af6
	jr nz,L_6B00		;6af8
	ld a,(0c660h)		;6afa
	and a			;6afd
	jr nz,L_6B02		;6afe
L_6B00:
	and a			;6b00
	ret			;6b01
L_6B02:
	scf			;6b02
	ret			;6b03
digitos_de_frecuencia:		; los dos digitos de 0xC138 en (0x98, 0x21), dos caracteres cada uno (0x6B34)
	ld c,001h		;6b04
	ld de,09821h		;6b06
	ld a,(0c138h)		;6b09   ; lee la frecuencia del transceptor (BCD)
	rra			;6b0c
	rra			;6b0d
	rra			;6b0e
	rra			;6b0f
	call digito_de_frecuencia		;6b10   ; digito_de_frecuencia: el digito A (dos caracteres de 0x6B34) en (D, E)
	ld a,(0c138h)		;6b13   ; lee la frecuencia del transceptor (BCD)
digito_de_frecuencia:		; el digito A (dos caracteres de 0x6B34) en (D, E)
	and 00fh		;6b16
	ld hl,06b34h		;6b18
	call 041dfh		;6b1b   ; hl_mas_2a: HL = HL + 2 x A
	ld a,(hl)			;6b1e
	call 05135h		;6b1f   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	ld a,e			;6b22
	add a,008h		;6b23
	ld e,a			;6b25
	inc hl			;6b26
	ld a,(hl)			;6b27
	call 05135h		;6b28   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	ld a,e			;6b2b
	sub 008h		;6b2c
	ld e,a			;6b2e
	ld a,d			;6b2f
	add a,008h		;6b30
	ld d,a			;6b32
	ret			;6b33

; ----------------------------------------------------------------------
; DATOS caracteres_de_las_frecuencias: 10 parejas de caracteres (0xA4-0xAF,
;   los digitos grandes del transceptor), una por frecuencia (nibble bajo de
;   0xC138): p01:6B18 lee 0x6B34 + 2 x n y p01:6B1E los pinta con L_5135
;   0x6b34..0x6b48  (20 bytes)
DATA_caracteres_de_las_frecuencias:
	defb 0a4h,0a5h	; 6b34
	defb 0a6h,0a7h	; 6b36
	defb 0a8h,0a9h	; 6b38
	defb 0aah,0abh	; 6b3a
	defb 0ach,0a7h	; 6b3c
	defb 0adh,0abh	; 6b3e
	defb 0adh,0a5h	; 6b40
	defb 0aeh,0a7h	; 6b42
	defb 0afh,0a5h	; 6b44
	defb 0afh,0abh	; 6b46

; ----------------------------------------------------------------------
; DATOS rotulo_recv: [X 0x38][Y 0x40] "RECV" 0xFF, que p01:69F7 (L_5110)
;   escribe o borra segun quien habla (p01:696D, 698C, 69E7, 69EF)
;   0x6b48..0x6b4f  (7 bytes)
DATA_rotulo_recv:
	defb 038h,040h,052h,045h,043h,056h,0ffh	; 6b48

; ----------------------------------------------------------------------
; DATOS rotulo_send: [X 0x38][Y 0x38] "SEND" 0xFF, la pareja del anterior
;   0x6b4f..0x6b56  (7 bytes)
DATA_rotulo_send:
	defb 038h,038h,053h,045h,04eh,044h,0ffh	; 6b4f

; ======================================================================
; CODIGO 0x6b56..0x6f7a  (1060 bytes)
; ======================================================================


barra_de_senal:		; la barra de senal 0xC801 (0-12) desde (0x40, 0x20)
	ld de,04020h		;6b56
	ld a,(0c801h)		;6b59   ; lee la barra de senal del transceptor (0-12)
	srl a		;6b5c
	and a			;6b5e
	jr z,L_6B68		;6b5f
	ld b,a			;6b61
	ld hl,01890h		;6b62
	call tramos_de_barra		;6b65   ; tramos_de_barra: B tramos de la ficha HL de la pagina 1 en (D, E) y (D, E + 8)
L_6B68:
	ld a,(0c801h)		;6b68   ; lee la barra de senal del transceptor (0-12)
	rra			;6b6b
	jr nc,L_6B76		;6b6c
	ld b,001h		;6b6e
	ld hl,01090h		;6b70
	call tramos_de_barra		;6b73   ; tramos_de_barra: B tramos de la ficha HL de la pagina 1 en (D, E) y (D, E + 8)
L_6B76:
	ld a,(0c801h)		;6b76   ; lee la barra de senal del transceptor (0-12)
	cp 00bh		;6b79
	ret nc			;6b7b
	and 001h		;6b7c
	ld c,a			;6b7e
	ld a,(0c801h)		;6b7f   ; lee la barra de senal del transceptor (0-12)
	srl a		;6b82
	add a,c			;6b84
	ld c,a			;6b85
	ld a,006h		;6b86
	sub c			;6b88
	ld b,a			;6b89
	ld hl,00890h		;6b8a
tramos_de_barra:		; B tramos de la ficha HL de la pagina 1 en (D, E) y (D, E + 8)
	push bc			;6b8d
	push hl			;6b8e
	push hl			;6b8f
	ld bc,00808h		;6b90
	ld a,001h		;6b93
	push bc			;6b95
	call 04fcdh		;6b96   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop bc			;6b99
	pop hl			;6b9a
	ld a,e			;6b9b
	add a,008h		;6b9c
	ld e,a			;6b9e
	ld a,001h		;6b9f
	call 04fcdh		;6ba1   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld a,e			;6ba4
	sub 008h		;6ba5
	ld e,a			;6ba7
	ld a,d			;6ba8
	add a,008h		;6ba9
	ld d,a			;6bab
	pop hl			;6bac
	pop bc			;6bad
	djnz tramos_de_barra		;6bae
	ret			;6bb0
sale_del_transceptor:		; paleta de Snake y vuelve a la sala
	ld a,001h		;6bb1
	ld (0c0f1h),a		;6bb3
	call 04a9dh		;6bb6   ; paleta_de_snake: manda al VDP los colores 7 y 10 (0x4AA3)
	jp cierra_ventana		;6bb9   ; cierra_ventana: vuelve a la sala: monta la sala, paletas, puertas, objetos y jefes, y la enciende
modo_2:		; modo 2: la ventana de las armas
	ld a,(0c112h)		;6bbc   ; lee las teclas de funcion nuevas (F1 1, F2 2, F3 4, F4 8, F5 0x10)
	and 002h		;6bbf
	jp nz,cierra_ventana		;6bc1   ; cierra_ventana: vuelve a la sala: monta la sala, paletas, puertas, objetos y jefes, y la enciende
	ld a,(0c153h)		;6bc4   ; lee el paso del modo
	dec a			;6bc7
	jp z,L_6BF0		;6bc8
	call 04e0eh		;6bcb   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04e2ch		;6bce   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	call 04e1bh		;6bd1   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
	call 04a92h		;6bd4   ; paleta_del_juego: manda al VDP la paleta p05:8B0B
	ld hl,0c153h		;6bd7   ; apunta a el paso del modo
	inc (hl)			;6bda
	call 0922dh		;6bdb   ; aprieta_armas: quita los huecos de la lista de armas 0xC500
	call 0469ch		;6bde   ; ventana_de_armas: pinta la ventana de las armas que se llevan (0xC500): dibujo, nombre y municion
	call hueco_del_arma		;6be1   ; hueco_del_arma: 0xC154 = el hueco de 0xC500 del arma elegida (1 si no esta)
	call 043cah		;6be4
	call pon_marca		;6be7   ; pon_marca: el caracter 0x3C en 0xC155
	call 08fc1h		;6bea   ; marcador: LIFE, CLASS, la llamada, el arma y el objeto
	jp 04e01h		;6bed   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)
L_6BF0:
	ld a,(0c006h)		;6bf0   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 00fh		;6bf3
	jr nz,L_6C02		;6bf5
	ld a,(0c007h)		;6bf7   ; lee las teclas que hay
	and 00fh		;6bfa
	ret z			;6bfc
	ld hl,0c15ch		;6bfd
	dec (hl)			;6c00
	ret nz			;6c01
L_6C02:
	ld hl,0c15ch		;6c02
	ld (hl),008h		;6c05
	rra			;6c07
	jr c,L_6C1B		;6c08
	rra			;6c0a
	jr c,L_6C28		;6c0b
	rra			;6c0d
	jr c,L_6C35		;6c0e
	ld a,(0c154h)		;6c10   ; lee el hueco elegido en la ventana de armas
	cp 004h		;6c13
	ret nc			;6c15
	add a,004h		;6c16
	ld c,a			;6c18
	jr L_6C3E		;6c19
L_6C1B:
	ld a,(0c154h)		;6c1b   ; lee el hueco elegido en la ventana de armas
	cp 001h		;6c1e
	ret z			;6c20
	cp 005h		;6c21
	ret z			;6c23
	dec a			;6c24
	ld c,a			;6c25
	jr L_6C3E		;6c26
L_6C28:
	ld a,(0c154h)		;6c28   ; lee el hueco elegido en la ventana de armas
	cp 004h		;6c2b
	ret z			;6c2d
	cp 007h		;6c2e
	ret z			;6c30
	inc a			;6c31
	ld c,a			;6c32
	jr L_6C3E		;6c33
L_6C35:
	ld a,(0c154h)		;6c35   ; lee el hueco elegido en la ventana de armas
	cp 005h		;6c38
	ret c			;6c3a
	sub 004h		;6c3b
	ld c,a			;6c3d
L_6C3E:
	ld a,020h		;6c3e
	call 0427ch		;6c40   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	call borra_marca		;6c43   ; borra_marca: el caracter 0 en 0xC155
	ld a,c			;6c46
	ld (0c154h),a		;6c47   ; guarda el hueco elegido en la ventana de armas
	call 043cah		;6c4a
	call pon_marca		;6c4d   ; pon_marca: el caracter 0x3C en 0xC155
	ld a,(0c13bh)		;6c50   ; lee la bandera de capturado (sin armas ni objetos)
	and a			;6c53
	jr z,L_6C59		;6c54
	xor a			;6c56
	jr L_6C64		;6c57
L_6C59:
	ld a,(0c154h)		;6c59   ; lee el hueco elegido en la ventana de armas
	call 042bdh		;6c5c   ; cuatro_a_menos_4: HL = 4 x (A - 1)
	ld de,0c500h		;6c5f   ; apunta a las armas que se llevan (fichas de 4: [arma][municion BCD])
	add hl,de			;6c62
	ld a,(hl)			;6c63
L_6C64:
	ld (0c134h),a		;6c64   ; guarda el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	ld (0c142h),a		;6c67
	jp 04751h		;6c6a   ; marcador_arma: pinta en el marcador el arma elegida (0xC134) y su municion
cierra_ventana:		; vuelve a la sala: monta la sala, paletas, puertas, objetos y jefes, y la enciende
	xor a			;6c6d
	ld (0c151h),a		;6c6e   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	call 04e0eh		;6c71   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04e2ch		;6c74   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	call 04bech		;6c77   ; patrones_del_arma: carga los patrones del arma elegida (p10:6392) y los de su explosion
	ld hl,0ea10h		;6c7a
	ld b,018h		;6c7d
	ld a,0e0h		;6c7f
L_6C81:
	ld (hl),a			;6c81
	inc hl			;6c82
	djnz L_6C81		;6c83
	ld hl,0c200h		;6c85   ; apunta a los proyectiles (0x180 bytes)
	ld de,0c201h		;6c88
	ld bc,0017fh		;6c8b
	ld (hl),000h		;6c8e
	ldir		;6c90
	xor a			;6c92
	ld (0c60bh),a		;6c93
	call 04cf0h		;6c96   ; monta_la_sala: monta la sala (p13:6000) en 0xE000 y la pinta en la VRAM
	call 04acbh		;6c99   ; paleta_de_la_sala: manda al VDP la paleta de la sala (nibble p05:8B40, tabla p05:8BBE)
	call 04ab5h		;6c9c   ; paleta_de_sprites: manda al VDP la paleta del juego de sprites de la sala (p05:8CB4)
	call pinta_las_puertas		;6c9f   ; pinta_las_puertas: pinta cerradas las puertas de la sala cuyo byte 1 no es cero, por su tipo (tabla 0x773C)
	ld a,(0c920h)		;6ca2
	cp 00ch		;6ca5
	jr c,L_6CC4		;6ca7
	call 04913h		;6ca9   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bc47h		;6cac   ; pinta_objetos: los 3 objetos de 0xC5D0: guarda el fondo en la pagina 1 y los pone con TIMP
	call 04248h		;6caf   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 04925h		;6cb2   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bf22h		;6cb5   ; rayos_con_goggl: con GOGGL (objeto 4), sin 0xC602, en las salas 0x18, 0x19 y 0x48: pinta los rayos de los actores
	call 04248h		;6cb8   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 0491fh		;6cbb   ; zona_banco_12: pone el banco 12 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bc26h		;6cbe   ; dibujo_si_metal_gear: si el primer actor es el 0x11, el dibujo de Metal Gear en (0x60, 0x20)
	call 04248h		;6cc1   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
L_6CC4:
	call 0af9ch		;6cc4   ; minas_con_detec: con DETEC (objeto 7) marca las minas (tipo 7)
	call 0b862h		;6cc7   ; dibujo_si_hind_d: si el primer actor es el 0x26, el dibujo p15:B431 en (0x40, 0)
	call 0a6fbh		;6cca   ; trampas_abiertas: dibuja abiertas las trampas (tipo 0x10) que lo esten
	call 0a1d3h		;6ccd   ; camaras_con_c632: con 0xC632, el dibujo de cada camara (tipo 6)
	call fichas_de_c63b_si_hay		;6cd0   ; fichas_de_c63b_si_hay: fichas_de_c63b si 0xC63B y no 0xC616
	call 08fc1h		;6cd3   ; marcador: LIFE, CLASS, la llamada, el arma y el objeto
	jp 04e01h		;6cd6   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)
hueco_del_arma:		; 0xC154 = el hueco de 0xC500 del arma elegida (1 si no esta)
	ld hl,0c134h		;6cd9   ; apunta a el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	ld b,007h		;6cdc
	ld de,0c500h		;6cde   ; apunta a las armas que se llevan (fichas de 4: [arma][municion BCD])
busca_hueco_c:		; C = el hueco de la lista DE (de 4 en 4) donde esta (HL)
	ld c,001h		;6ce1
	ld a,(hl)			;6ce3
	and a			;6ce4
	ex de,hl			;6ce5
	ld de,00004h		;6ce6
	jr z,L_6CF8		;6ce9
L_6CEB:
	cp (hl)			;6ceb
	jr z,L_6CF3		;6cec
	add hl,de			;6cee
	inc c			;6cef
	djnz L_6CEB		;6cf0
	ret			;6cf2
L_6CF3:
	ld a,c			;6cf3
	ld (0c154h),a		;6cf4   ; guarda el hueco elegido en la ventana de armas
	ret			;6cf7
L_6CF8:
	ld a,(hl)			;6cf8
	or a			;6cf9
	jr z,L_6CF3		;6cfa
	add hl,de			;6cfc
	inc c			;6cfd
	djnz L_6CF8		;6cfe
	ld c,001h		;6d00
	jr L_6CF3		;6d02
borra_marca:		; el caracter 0 en 0xC155
	ld a,000h		;6d04
	jr L_6D0A		;6d06
pon_marca:		; el caracter 0x3C en 0xC155
	ld a,03ch		;6d08
L_6D0A:
	ld de,(0c155h)		;6d0a
	jp 05135h		;6d0e   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
guarda_paleta:		; lee la paleta de 0xF680 (VRAM) a 0xC1CF en formato [color][RB][G]
	ld de,0c1cfh		;6d11
	ld hl,0f680h		;6d14   ; apunta a la copia de la paleta en la VRAM (0xF680, 2 bytes por color)
	ld bc,01000h		;6d17
L_6D1A:
	ld a,c			;6d1a
	inc c			;6d1b
	ld (de),a			;6d1c
	inc de			;6d1d
	push bc			;6d1e
	ld bc,00002h		;6d1f
	call 04d3eh		;6d22   ; lee_vram: lee BC bytes de la VRAM HL a DE
	inc hl			;6d25
	inc hl			;6d26
	pop bc			;6d27
	djnz L_6D1A		;6d28
	ld a,0ffh		;6d2a
	ld (de),a			;6d2c
	ret			;6d2d
funde_paleta:		; apaga un poco la paleta de 0xC1CF y la manda; acarreo cuando todo es 0
	call apaga_un_poco		;6d2e   ; apaga_un_poco: cada 4 cuadros baja en 1 cada componente de la paleta de 0xC1D0
	ld hl,0c1cfh		;6d31
	call 04ec4h		;6d34   ; paleta: manda al VDP la lista de HL: [color][RB][G] ... 0xFF
	ld hl,0c1d0h		;6d37
	ld b,010h		;6d3a
	xor a			;6d3c
L_6D3D:
	or (hl)			;6d3d
	inc hl			;6d3e
	or (hl)			;6d3f
	inc hl			;6d40
	inc hl			;6d41
	djnz L_6D3D		;6d42
	and a			;6d44
	ret nz			;6d45
	scf			;6d46
	ret			;6d47
apaga_un_poco:		; cada 4 cuadros baja en 1 cada componente de la paleta de 0xC1D0
	ld a,(0c003h)		;6d48   ; lee la cuenta de cuadros
	and 003h		;6d4b
	ret nz			;6d4d
	ld hl,0c1d0h		;6d4e
	ld b,010h		;6d51
L_6D53:
	ld a,(hl)			;6d53
	and 0f0h		;6d54
	jr z,L_6D5C		;6d56
	ld a,(hl)			;6d58
	sub 010h		;6d59
	ld (hl),a			;6d5b
L_6D5C:
	ld a,(hl)			;6d5c
	and 00fh		;6d5d
	jr z,L_6D62		;6d5f
	dec (hl)			;6d61
L_6D62:
	inc hl			;6d62
	ld a,(hl)			;6d63
	and 00fh		;6d64
	ld (hl),a			;6d66
	jr z,L_6D6A		;6d67
	dec (hl)			;6d69
L_6D6A:
	inc hl			;6d6a
	inc hl			;6d6b
	djnz L_6D53		;6d6c
	ret			;6d6e
empieza_la_partida:		; la partida desde el principio: puertas, objeto 6, sala 0x79 (si se juega), frecuencia 120.85, Snake
	call 04e42h		;6d6f   ; esconde_los_sprites_ram: llena de 0xE0 la copia de los atributos (0xEA00-0xEA7F)
	xor a			;6d72
	ld (0c151h),a		;6d73   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ld a,(0c125h)		;6d76
	and a			;6d79
	jp nz,L_6DCD		;6d7a
	call 04347h		;6d7d   ; puertas_al_empezar: 0xC450-0xC4EF: 0 si los bits 7-6 de p15:B046 son 10, 1 si no (160 puertas)
	xor a			;6d80
	ld (0c4fch),a		;6d81
	ld a,006h		;6d84
	ld (0c530h),a		;6d86   ; guarda los objetos que se llevan (fichas de 4)
	ld (0c135h),a		;6d89   ; guarda el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	ld a,001h		;6d8c
	ld (0c5a5h),a		;6d8e
	ld (0c531h),a		;6d91
	ld a,(0c002h)		;6d94   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;6d97
	jr z,L_6DA3		;6d99
	ld a,079h		;6d9b
	ld (0c130h),a		;6d9d   ; guarda la sala
	ld (0c136h),a		;6da0   ; guarda la parada del ascensor
L_6DA3:
	ld a,0ffh		;6da3
	ld (0c157h),a		;6da5   ; guarda el juego de fichas cargado
	ld a,085h		;6da8
	ld (0c138h),a		;6daa   ; guarda la frecuencia del transceptor (BCD)
	ld a,028h		;6dad
	ld (0c13fh),a		;6daf
	ld (0c140h),a		;6db2
	ld a,02ch		;6db5
	ld (0c159h),a		;6db7   ; guarda la musica que suena
	ld a,029h		;6dba
	call 0427ch		;6dbc   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	call 05fa6h		;6dbf   ; snake_al_empezar: Snake al empezar: paleta, pose, direccion, y con 0xC002 bit 6 la pose 0x25 en (0xB8, 0xC0)
	call 04b33h		;6dc2   ; fichas_del_marcador: carga en la pagina 1 las fichas de los objetos, del marcador, de la camara y del retrato
	call 049f4h		;6dc5   ; fichas_de_las_puertas: copia las fichas de las puertas (p07:61C9-6749) a la pagina 1
	call 09101h		;6dc8   ; maximos: los maximos de municion y de raciones por CLASS (0x918A-0x91BA) en 0xC380
	jr L_6DE0		;6dcb
L_6DCD:
	call 04913h		;6dcd   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0be17h		;6dd0   ; vuelve_al_punto: devuelve la partida guardada en 0xCA00
	call 04248h		;6dd3   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 058c9h		;6dd6
musica_de_nuevo:		; 0xC159 = 0 y elige la musica de la sala
	xor a			;6dd9
	ld (0c159h),a		;6dda   ; guarda la musica que suena
	call 044f0h		;6ddd
L_6DE0:
	call 04376h		;6de0   ; nibble_a2ff_de_la_sala: 0xC161 = el nibble de la sala en p12:A2FF
	call 048bdh		;6de3   ; llamadas_de_la_sala: carga las llamadas de radio de la sala (p15:B6C6) en 0xC880 (fichas de 0x1D) y cuantas en 0xC87F
	call 043fah		;6de6   ; carga_las_puertas: copia las puertas de la sala (p15:A7C0) a 0xC3D0 con su estado (0xC450) y cuenta en 0xC4FF
	jr L_6E16		;6de9
modo_1:		; modo 1: cambio de sala
	ld hl,0e500h		;6deb
	ld de,0e501h		;6dee
	ld (hl),000h		;6df1
	ld bc,0001dh		;6df3
	ldir		;6df6
	call 092dbh		;6df8   ; nueva_sala: la sala nueva: por la puerta 0xC4FC, por el lado (sala_vecina) o el ascensor
	call 04376h		;6dfb   ; nibble_a2ff_de_la_sala: 0xC161 = el nibble de la sala en p12:A2FF
	call 048bdh		;6dfe   ; llamadas_de_la_sala: carga las llamadas de radio de la sala (p15:B6C6) en 0xC880 (fichas de 0x1D) y cuantas en 0xC87F
	ld a,(0c151h)		;6e01   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 009h		;6e04
	jr z,L_6E10		;6e06
	ld a,(0c002h)		;6e08   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;6e0b
	call nz,044f0h		;6e0d
L_6E10:
	call 043fah		;6e10   ; carga_las_puertas: copia las puertas de la sala (p15:A7C0) a 0xC3D0 con su estado (0xC450) y cuenta en 0xC4FF
	call 0941bh		;6e13   ; entra_snake: pone a Snake en la sala nueva segun por donde entro
L_6E16:
	call 04913h		;6e16   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bdf8h		;6e19   ; punto_de_control: si (sala, parada) esta en 0xBE64 (31 parejas), guarda la partida en 0xCA00
	call 04248h		;6e1c   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 04362h		;6e1f   ; byte_a204_de_la_sala: 0xC158 = los 3 bits bajos de p12:A204[sala]
	call 04919h		;6e22   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bf49h		;6e25   ; sube_al_camion: en las salas de 0xBF60: 0xC608 = 0x90 y el modo 5
	call 0bfb0h		;6e28   ; salas_85_y_6f: en la sala 0x85 sin 0xC660: modo 12; en la 0x6F: 0xC664 = 1
	call 04248h		;6e2b   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	xor a			;6e2e
	ld (0c150h),a		;6e2f
	ld (0c4fch),a		;6e32
	ld (0c616h),a		;6e35
	ld (0c5c0h),a		;6e38
	ld (0cee1h),a		;6e3b
	ld (0c610h),a		;6e3e
	ld hl,0c200h		;6e41   ; apunta a los proyectiles (0x180 bytes)
	ld de,0c201h		;6e44
	ld bc,0017fh		;6e47
	ld (hl),a			;6e4a
	ldir		;6e4b
	ld a,(0c130h)		;6e4d   ; lee la sala
	cp 0f0h		;6e50
	jr nc,L_6E61		;6e52
	ld hl,0ea10h		;6e54
	ld de,0ea11h		;6e57
	ld bc,00017h		;6e5a
	ld (hl),0e0h		;6e5d
	ldir		;6e5f
L_6E61:
	call 04e0eh		;6e61   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04e2ch		;6e64   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	call 04935h		;6e67   ; juego_de_fichas: carga el juego de fichas de la sala (nibble p07:6000) si no es el de 0xC157, y sus bits de choque en 0xC700
	call 04bech		;6e6a   ; patrones_del_arma: carga los patrones del arma elegida (p10:6392) y los de su explosion
	call 04a44h		;6e6d   ; sprites_de_la_sala: carga los patrones del juego de sprites de la sala (p10:6185, p10:6280) en 0xF800
	call 04cf0h		;6e70   ; monta_la_sala: monta la sala (p13:6000) en 0xE000 y la pinta en la VRAM
	call pinta_las_puertas		;6e73   ; pinta_las_puertas: pinta cerradas las puertas de la sala cuyo byte 1 no es cero, por su tipo (tabla 0x773C)
	call 04913h		;6e76   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bbddh		;6e79   ; objetos_al_entrar: 0xC5D0 a cero y los objetos de la sala (0x7A-0xD9: 0xB9EF, 0xBA50) que no se cogieron
	call 0bc47h		;6e7c   ; pinta_objetos: los 3 objetos de 0xC5D0: guarda el fondo en la pagina 1 y los pone con TIMP
	call 04248h		;6e7f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 04a92h		;6e82   ; paleta_del_juego: manda al VDP la paleta p05:8B0B
	call 04acbh		;6e85   ; paleta_de_la_sala: manda al VDP la paleta de la sala (nibble p05:8B40, tabla p05:8BBE)
	call 04ab5h		;6e88   ; paleta_de_sprites: manda al VDP la paleta del juego de sprites de la sala (p05:8CB4)
	call 08fc1h		;6e8b   ; marcador: LIFE, CLASS, la llamada, el arma y el objeto
	ld a,(0c6a0h)		;6e8e   ; lee la cinta (1 carga, 2 graba)
	or a			;6e91
	jr nz,L_6E9B		;6e92
	ld a,(0c167h)		;6e94
	or a			;6e97
	call z,055f0h		;6e98   ; actores_de_la_sala: al entrar en sala: borra 0xD000-0xD7FF y crea los actores de la sala (p05:9560)
L_6E9B:
	call 04925h		;6e9b   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bf22h		;6e9e   ; rayos_con_goggl: con GOGGL (objeto 4), sin 0xC602, en las salas 0x18, 0x19 y 0x48: pinta los rayos de los actores
	call 04248h		;6ea1   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c6a0h)		;6ea4   ; lee la cinta (1 carga, 2 graba)
	or a			;6ea7
	jr z,L_6EC2		;6ea8
	call 0491fh		;6eaa   ; zona_banco_12: pone el banco 12 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bc26h		;6ead   ; dibujo_si_metal_gear: si el primer actor es el 0x11, el dibujo de Metal Gear en (0x60, 0x20)
	call 04248h		;6eb0   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 0b862h		;6eb3   ; dibujo_si_hind_d: si el primer actor es el 0x26, el dibujo p15:B431 en (0x40, 0)
	call 0a6fbh		;6eb6   ; trampas_abiertas: dibuja abiertas las trampas (tipo 0x10) que lo esten
	call 0a1d3h		;6eb9   ; camaras_con_c632: con 0xC632, el dibujo de cada camara (tipo 6)
	call 0af9ch		;6ebc   ; minas_con_detec: con DETEC (objeto 7) marca las minas (tipo 7)
	call fichas_de_c63b		;6ebf   ; fichas_de_c63b: pinta las dos fichas de 0x7703 (0x7705 en la sala 0x28) en 0xC63B
L_6EC2:
	call 04e01h		;6ec2   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)
	ld a,(0c002h)		;6ec5   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;6ec8
	jr nz,L_6ED1		;6eca
	ld a,006h		;6ecc
	ld (0f0f6h),a		;6ece   ; guarda el banco de zona de 0xA000
L_6ED1:
	ld a,(0c130h)		;6ed1   ; lee la sala
	cp 0f0h		;6ed4
	jr c,L_6EE4		;6ed6
	call 09598h		;6ed8   ; sprites_del_ascensor: los sprites del ascensor (0x95B7) en 0xEA00 y colores 15
	call 04919h		;6edb   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0ae28h		;6ede   ; sprites_de_la_cabina: los 12 sprites del ascensor (0xAE5F) en 0xEA50 y sus colores en 0xE940
	jp 04248h		;6ee1   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
L_6EE4:
	ld a,(0c6a0h)		;6ee4   ; lee la cinta (1 carga, 2 graba)
	or a			;6ee7
	jp z,04248h		;6ee8   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 053a5h		;6eeb   ; sprites_de_snake: atributos, colores y patrones de la pose de Snake
	call atributos_de_los_actores		;6eee   ; atributos_de_los_actores: los atributos del cuadro de los 16 actores
	call 05599h		;6ef1   ; sprites_de_los_actores: pone los sprites de los 16 actores en la copia de atributos y sus colores
	call rotulo_pause		;6ef4   ; rotulo_pause: guarda el fondo y escribe PAUSE (0x5C1D)
	call 04925h		;6ef7   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b8deh		;6efa   ; sprites_a_vram: atributos y colores a la tabla de 0xC114, empezando cada cuadro por otro grupo (0xC00F)
	call 0b8bch		;6efd   ; cambia_tabla_de_sprites: alterna las tablas de atributos (0xF600/0xF400 y 0xF200/0xF000) con R#5
	call 0b8deh		;6f00   ; sprites_a_vram: atributos y colores a la tabla de 0xC114, empezando cada cuadro por otro grupo (0xC00F)
	xor a			;6f03
	ld (0c6a0h),a		;6f04   ; guarda la cinta (1 carga, 2 graba)
	ld (0c167h),a		;6f07
	jp 04248h		;6f0a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
L_6F0D:
	ld a,(0c623h)		;6f0d
	dec a			;6f10
	jr z,L_6F31		;6f11
	dec a			;6f13
	jr z,L_6F31		;6f14
	jr L_6F71		;6f16
partida:		; un cuadro de partida: Snake, actores y el modo 0xC151 (tabla 0x6F7A)
	ld a,(0c151h)		;6f18   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	and a			;6f1b
	jr z,L_6F26		;6f1c
	cp 00ah		;6f1e
	jr z,L_6F0D		;6f20
	cp 005h		;6f22
	jr c,L_6F3A		;6f24
L_6F26:
	ld a,(0c920h)		;6f26
	cp 005h		;6f29
	jr c,L_6F31		;6f2b
	cp 008h		;6f2d
	jr c,L_6F3A		;6f2f
L_6F31:
	call 04925h		;6f31   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b8bch		;6f34   ; cambia_tabla_de_sprites: alterna las tablas de atributos (0xF600/0xF400 y 0xF200/0xF000) con R#5
	call 04248h		;6f37   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
L_6F3A:
	ld a,(0c151h)		;6f3a   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 008h		;6f3d
	jr z,L_6F64		;6f3f
	call 09067h		;6f41   ; barra_de_vida: LIFE y la barra 0xC131 sobre el maximo 0xC137
	call 090aah		;6f44   ; estrellas: CLASS y las estrellas de 0xC132
	ld a,(0c151h)		;6f47   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 002h		;6f4a
	jr z,L_6F55		;6f4c
	cp 003h		;6f4e
	jr z,L_6F55		;6f50
	call 08fd0h		;6f52   ; marcador_llamada: CALL parpadeando con 0xC15F = 1 (sonido 0x22) o la cuenta atras 0xC13D
L_6F55:
	call 053abh		;6f55   ; patrones_de_snake: descomprime los patrones de la pose 0xC18A (p10:6000) en 0xF800
	call 05318h		;6f58   ; atributos_de_snake: los sprites de la pose 0xC18A (p10:606A, p10:609F) a 0xEA00 (0xEA40 en las salas 0xF0+ salvo 0xFB) mas su Y y su X
	call 0535eh		;6f5b   ; colores_de_snake: los colores de la pose 0xC18A, 16 lineas por sprite, a 0xE800 (0xE900 en las salas 0xF0+)
	call sprite_de_la_grenade		;6f5e   ; sprite_de_la_grenade: con la GRENADE (arma 3): el sprite 0xEA24 (patron 0x18, color 14) delante de Snake (0x666A), o escondido
	call 08176h		;6f61   ; sprites_de_los_proyectiles: los sprites de los proyectiles a 0xEA00 y sus colores a 0xE800
L_6F64:
	ld a,(0c130h)		;6f64   ; lee la sala
	cp 0f0h		;6f67
	jr nc,L_6F71		;6f69
	call atributos_de_los_actores		;6f6b   ; atributos_de_los_actores: los atributos del cuadro de los 16 actores
	call 05599h		;6f6e   ; sprites_de_los_actores: pone los sprites de los 16 actores en la copia de atributos y sus colores
L_6F71:
	call lee_teclas		;6f71   ; lee_teclas: si se juega, las teclas de funcion en 0xC113/0xC112 y las del juego en 0xC007/0xC006
	ld a,(0c151h)		;6f74   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	call 041eah		;6f77   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_6F7A: 13 destinos del despachador p00:41EA (call en p01:6F77, el
;   indice en A): 6F94, 6DEB, 6BBC, 7EB5, 68FA, 7024, 702F, 7046, 704B, 7060,
;   7070, 7086, 708E; lo leen p01:6F77 (26 bytes)
;   0x6f7a..0x6f94  (26 bytes)
DATA_tabla_6F7A:
	defw 06f94h,06debh,06bbch,07eb5h,068fah,07024h,0702fh,07046h	; 6f7a
	defw 0704bh,07060h,07070h,07086h,0708eh	; 6f8a

; ======================================================================
; CODIGO 0x6f94..0x71da  (582 bytes)
; ======================================================================


modo_0:		; modo 0, el juego: teclas de funcion, Snake, actores y proyectiles
	ld a,(0c180h)		;6f94   ; lee el estado de Snake
	cp 008h		;6f97
	jr z,L_6FCB		;6f99
	ld a,(0c130h)		;6f9b   ; lee la sala
	cp 0e0h		;6f9e
	jr nc,L_6FCB		;6fa0
	cp 0cch		;6fa2
	jr z,L_6FCB		;6fa4
	ld a,(0c112h)		;6fa6   ; lee las teclas de funcion nuevas (F1 1, F2 2, F3 4, F4 8, F5 0x10)
	rra			;6fa9
	jr nc,L_6FB2		;6faa
	ld a,001h		;6fac
	ld (0c008h),a		;6fae   ; guarda la pausa (1) o F5 (2)
	ret			;6fb1
L_6FB2:
	rra			;6fb2
	ld c,002h		;6fb3
	jp c,al_modo_c		;6fb5   ; al_modo_c: el modo de la partida 0xC151 = C (salas < 0xF0); con el 4, el sonido 0x59
	inc c			;6fb8
	rra			;6fb9
	jp c,al_modo_c		;6fba   ; al_modo_c: el modo de la partida 0xC151 = C (salas < 0xF0); con el 4, el sonido 0x59
	inc c			;6fbd
	rra			;6fbe
	jp c,al_modo_c		;6fbf   ; al_modo_c: el modo de la partida 0xC151 = C (salas < 0xF0); con el 4, el sonido 0x59
	rra			;6fc2
	jr nc,L_6FCB		;6fc3
	ld a,002h		;6fc5
	ld (0c008h),a		;6fc7   ; guarda la pausa (1) o F5 (2)
	ret			;6fca
L_6FCB:
	call 05877h		;6fcb   ; mira_c602: quita 0xC602 (y lo que sigue) segun la sala, la cuenta 0xC605 y los actores que quedan
	ld hl,0c199h		;6fce   ; apunta a la cuenta de herido (Snake parpadea)
	ld a,(hl)			;6fd1
	and a			;6fd2
	jr z,L_6FD6		;6fd3
	dec (hl)			;6fd5
L_6FD6:
	call 091e9h		;6fd6   ; cuenta_de_llamada: baja 0xC160 y pasa 0xC15F de 0 a 1 (llamando) y de 1 a 2
	call 09209h		;6fd9   ; cuenta_atras: con 0xC13C baja la cuenta 0xC13D (BCD); a cero, Snake muere
	ld a,(0c151h)		;6fdc   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 009h		;6fdf
	jp z,L_7099		;6fe1
	ld a,(0d000h)		;6fe4   ; lee los 16 actores (fichas de 0x80)
	ld c,a			;6fe7
	and 07fh		;6fe8
	cp 011h		;6fea
	jr nz,L_6FF8		;6fec
	ld a,(0d00dh)		;6fee
	and a			;6ff1
	jr z,L_6FFB		;6ff2
	bit 7,c		;6ff4
	jr nz,L_6FFB		;6ff6
L_6FF8:
	call 05ffbh		;6ff8   ; estado_de_snake: despacha por el estado de Snake (0xC180, tabla en p01:6001)
L_6FFB:
	call 080a3h		;6ffb   ; dispara: con arma, en salas < 0xE0 (no 0xCC) y sin las poses 2, 4, 7: el disparo del arma (tabla 0x80C4)
	call 08147h		;6ffe   ; proyectiles: un cuadro de los 6 proyectiles por su arma (tabla 0x8168); 0xFF lo quita
	call actores_del_cuadro		;7001   ; actores_del_cuadro: lo de 0xC669, los refuerzos y un cuadro de cada uno de los 16 actores
	call 088efh		;7004   ; choques_del_cuadro: proyectiles y Snake contra los actores, fichas y salas que hieren, puertas y objetos
	ld a,(0c135h)		;7007   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 019h		;700a
	call z,sprite_de_la_grenade		;700c   ; sprite_de_la_grenade: con la GRENADE (arma 3): el sprite 0xEA24 (patron 0x18, color 14) delante de Snake (0x666A), o escondido
	ld a,(0c003h)		;700f   ; lee la cuenta de cuadros
	and 03fh		;7012
	jp nz,L_7099		;7014
	ld a,(0c139h)		;7017
	and a			;701a
	jr z,L_7099		;701b
	ld b,001h		;701d
	call 09029h		;701f   ; dano_4: dano 4
	jr L_7099		;7022
modo_5:		; modo 5: p09:BF66
	call 04919h		;7024   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bf66h		;7027   ; camion: modo 5: el camion (0xC608): texto 0x5B, sonido 0x1F y la sacudida con R#23
	call 04248h		;702a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	jr L_7099		;702d
modo_6:		; modo 6: p02:9209, p09:AD69 y los sprites de Snake
	call 09209h		;702f   ; cuenta_atras: con 0xC13C baja la cuenta 0xC13D (BCD); a cero, Snake muere
	call 04919h		;7032   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0ad69h		;7035   ; ascensor: modo 6: el ascensor (0xC196): sube o baja con las teclas y para en 0x38, 0x78 y 0xB8
	call 04248h		;7038   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 053abh		;703b   ; patrones_de_snake: descomprime los patrones de la pose 0xC18A (p10:6000) en 0xF800
	call 05318h		;703e   ; atributos_de_snake: los sprites de la pose 0xC18A (p10:606A, p10:609F) a 0xEA00 (0xEA40 en las salas 0xF0+ salvo 0xFB) mas su Y y su X
	call 0535eh		;7041   ; colores_de_snake: los colores de la pose 0xC18A, 16 lineas por sprite, a 0xE800 (0xE900 en las salas 0xF0+)
	jr L_7099		;7044
modo_7:		; modo 7: L_7A84
	call abre_puerta		;7046   ; abre_puerta: la puerta 0xC4FE se abre paso a paso (0xC4FD, tabla 0x7A8A)
	jr L_7099		;7049
modo_8:		; modo 8: la sala vecina (L_710D); con la tecla de funcion 4 vuelve
	ld a,(0c19ah)		;704b
	dec a			;704e
	jr nz,L_705B		;704f
	ld a,(0c112h)		;7051   ; lee las teclas de funcion nuevas (F1 1, F2 2, F3 4, F4 8, F5 0x10)
	and 004h		;7054
	ld c,003h		;7056
	jp nz,vuelve_de_la_vecina		;7058   ; vuelve_de_la_vecina: devuelve los actores de 0xD800 y lo guardado, y al modo C
L_705B:
	call mira_la_vecina		;705b   ; mira_la_vecina: con una tecla de direccion pone en 0xC130 la sala vecina; 0xC19C cuadros despues vuelve
	jr L_70B3		;705e
modo_9:		; modo 9: baja 0xC19D y mueve a Snake; al acabar 0xC123 = 0
	ld hl,0c19dh		;7060
	dec (hl)			;7063
	jr z,L_706B		;7064
	call 05ffbh		;7066   ; estado_de_snake: despacha por el estado de Snake (0xC180, tabla en p01:6001)
	jr colores_a_vram_15		;7069
L_706B:
	xor a			;706b
	ld (0c123h),a		;706c
	ret			;706f
modo_10:		; modo 10: la ventana de texto (con el texto 0x96, hasta 3 veces 0xC623)
	ld a,(0cef0h)		;7070   ; lee el texto de la ventana
	cp 096h		;7073
	jp nz,05d03h		;7075   ; ventana_paso: un paso de la ventana de texto (0xCEF2, tabla 0x5D1D)
	ld a,(0c623h)		;7078
	cp 003h		;707b
	jp z,05d03h		;707d   ; ventana_paso: un paso de la ventana de texto (0xCEF2, tabla 0x5D1D)
	inc a			;7080
	ld (0c623h),a		;7081
	jr L_7099		;7084
modo_11:		; modo 11: la secuencia 0xC900 y los actores
	call secuencia_c900		;7086   ; secuencia_c900: la secuencia de 6 pasos de 0xC900 (tabla 0x7D85)
	call actores_del_cuadro		;7089   ; actores_del_cuadro: lo de 0xC669, los refuerzos y un cuadro de cada uno de los 16 actores
	jr colores_a_vram_15		;708c
modo_12:		; modo 12: p09:BFD1
	call 04919h		;708e   ; zona_banco_9: pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bfd1h		;7091   ; modo_12_cuenta: modo 12: baja 0xC608; texto 0x59 y 0xC660 = 1
	call 04248h		;7094   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	jr L_7099		;7097
L_7099:
	ld a,(0c130h)		;7099   ; lee la sala
	cp 02dh		;709c
	jr z,colores_a_vram_15		;709e
	cp 02eh		;70a0
	jr z,colores_a_vram_15		;70a2
	cp 0f0h		;70a4
	jr c,L_70BB		;70a6
	call colores_a_vram_15		;70a8   ; colores_a_vram_15: colores_a_vram con el banco 15
colores_a_vram_15:		; colores_a_vram con el banco 15
	call 04925h		;70ab   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b918h		;70ae   ; colores_a_vram: 0x280 bytes de colores de 0xE800 a la tabla de 0xC114
	jr L_70C1		;70b1
L_70B3:
	call 04925h		;70b3   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b924h		;70b6   ; colores_de_actores_a_vram: los colores de 0xE840 y los atributos de 0xEA10 a las tablas
	jr L_70C1		;70b9
L_70BB:
	call 04925h		;70bb   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b8deh		;70be   ; sprites_a_vram: atributos y colores a la tabla de 0xC114, empezando cada cuadro por otro grupo (0xC00F)
L_70C1:
	jp 04248h		;70c1   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
vuelve_de_la_vecina:		; devuelve los actores de 0xD800 y lo guardado, y al modo C
	push bc			;70c4
	ld hl,0d800h		;70c5
	ld de,0d000h		;70c8   ; apunta a los 16 actores (fichas de 0x80)
	ld bc,00800h		;70cb
	ldir		;70ce
	ld a,(0c639h)		;70d0
	ld (0c616h),a		;70d3
	ld hl,(0c163h)		;70d6
	ld (0c15fh),hl		;70d9   ; guarda la llamada del transceptor (0 pendiente, 1 llamando, 2 ninguna) y el byte siguiente (16 bits)
	ld a,(0c16ah)		;70dc
	ld (0c632h),a		;70df
	ld hl,0ea0eh		;70e2
	ld de,0ea0fh		;70e5
	ld bc,00057h		;70e8
	ld (hl),0e0h		;70eb
	ldir		;70ed
	pop bc			;70ef
al_modo_c:		; el modo de la partida 0xC151 = C (salas < 0xF0); con el 4, el sonido 0x59
	ld a,(0c130h)		;70f0   ; lee la sala
	cp 0f0h		;70f3
	ret nc			;70f5
	ld a,c			;70f6
	ld (0c151h),a		;70f7   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 004h		;70fa
	jr nz,L_7108		;70fc
	ld a,001h		;70fe
	ld (0c0f1h),a		;7100
	ld a,059h		;7103
	call 0427ch		;7105   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
L_7108:
	xor a			;7108
	ld (0c153h),a		;7109   ; guarda el paso del modo
	ret			;710c
mira_la_vecina:		; con una tecla de direccion pone en 0xC130 la sala vecina; 0xC19C cuadros despues vuelve
	ld a,(0c19ah)		;710d
	ld b,a			;7110
	djnz L_7130		;7111
	ld a,(0c006h)		;7113   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	and 00fh		;7116
	ret z			;7118
	rra			;7119
	ld c,002h		;711a
	jr c,L_7127		;711c
	inc c			;711e
	rra			;711f
	jr c,L_7127		;7120
	inc c			;7122
	rra			;7123
	jr c,L_7127		;7124
	inc c			;7126
L_7127:
	ld a,080h		;7127
	ld (0c19ch),a		;7129
	ld a,c			;712c
	dec a			;712d
	jr L_714D		;712e
L_7130:
	djnz L_7136		;7130
	ld a,002h		;7132
	jr L_7146		;7134
L_7136:
	djnz L_713C		;7136
	ld a,001h		;7138
	jr L_7146		;713a
L_713C:
	djnz L_7142		;713c
	ld a,004h		;713e
	jr L_7146		;7140
L_7142:
	djnz monta_la_vecina		;7142
	ld a,003h		;7144
L_7146:
	ld hl,0c19ch		;7146
	dec (hl)			;7149
	ret nz			;714a
	ld c,001h		;714b
L_714D:
	ld (0c133h),a		;714d   ; guarda el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	push bc			;7150
	call 042e6h		;7151   ; sala_vecina: A = la sala vecina por el lado 0xC133 (tabla p05:8E0E); 0xFF si la sala no tiene vecinas
	pop bc			;7154
	inc a			;7155
	ret z			;7156
	dec a			;7157
	ld (0c130h),a		;7158   ; guarda la sala
	ld a,c			;715b
	ld (0c19bh),a		;715c
	xor a			;715f
	ld (0c19ah),a		;7160
	ret			;7163
monta_la_vecina:		; monta la sala 0xC130 con sus actores
	call 04e0eh		;7164   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04e1bh		;7167   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
	call 04e2ch		;716a   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	call 04935h		;716d   ; juego_de_fichas: carga el juego de fichas de la sala (nibble p07:6000) si no es el de 0xC157, y sus bits de choque en 0xC700
	call 04a44h		;7170   ; sprites_de_la_sala: carga los patrones del juego de sprites de la sala (p10:6185, p10:6280) en 0xF800
	call 04913h		;7173   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bbddh		;7176   ; objetos_al_entrar: 0xC5D0 a cero y los objetos de la sala (0x7A-0xD9: 0xB9EF, 0xBA50) que no se cogieron
	call 04248h		;7179   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 04acbh		;717c   ; paleta_de_la_sala: manda al VDP la paleta de la sala (nibble p05:8B40, tabla p05:8BBE)
	call 04ab5h		;717f   ; paleta_de_sprites: manda al VDP la paleta del juego de sprites de la sala (p05:8CB4)
	call 043fah		;7182   ; carga_las_puertas: copia las puertas de la sala (p15:A7C0) a 0xC3D0 con su estado (0xC450) y cuenta en 0xC4FF
	call 04cf0h		;7185   ; monta_la_sala: monta la sala (p13:6000) en 0xE000 y la pinta en la VRAM
	call pinta_las_puertas		;7188   ; pinta_las_puertas: pinta cerradas las puertas de la sala cuyo byte 1 no es cero, por su tipo (tabla 0x773C)
	ld hl,0d000h		;718b   ; apunta a los 16 actores (fichas de 0x80)
	ld de,0d001h		;718e
	ld (hl),000h		;7191
	ld bc,007ffh		;7193
	ldir		;7196
	ld hl,0ea28h		;7198   ; apunta a los atributos de los sprites de los actores
	ld de,0ea29h		;719b
	ld (hl),0e0h		;719e
	ld bc,00057h		;71a0
	ldir		;71a3
	call 055f0h		;71a5   ; actores_de_la_sala: al entrar en sala: borra 0xD000-0xD7FF y crea los actores de la sala (p05:9560)
	ld a,(0c19bh)		;71a8
	dec a			;71ab
	jr nz,L_71BB		;71ac
	ld hl,0ea28h		;71ae   ; apunta a los atributos de los sprites de los actores
	ld de,0ea29h		;71b1
	ld (hl),0e0h		;71b4
	ld bc,00057h		;71b6
	ldir		;71b9
L_71BB:
	ld hl,092beh		;71bb
	call 0510ch		;71be   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	ld a,(0c19bh)		;71c1
	ld (0c19ah),a		;71c4
	dec a			;71c7
	ld hl,071dah		;71c8
	call 041e0h		;71cb   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;71ce
	ld de,0c0c4h		;71cf
	ld c,0ffh		;71d2
	call 05135h		;71d4   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	jp 04e01h		;71d7   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)

; ----------------------------------------------------------------------
; DATOS tabla_71da: 5 bytes (0, 0x9A, 0x9B, 0x99, 0x3C) que p01:71C8 lee en
;   0x71DA + (0xC19B - 1) y manda a 0xC0C4
;   0x71da..0x71df  (5 bytes)
DATA_tabla_71da:
	defb 000h,09ah,09bh,099h,03ch	; 71da

; ======================================================================
; CODIGO 0x71df..0x722f  (80 bytes)
; ======================================================================


actores_del_cuadro:		; lo de 0xC669, los refuerzos y un cuadro de cada uno de los 16 actores
	call cuenta_c669		;71df   ; cuenta_c669: al acabar 0xC669, en la sala 0xC60F y con 0xC668 a cero copia 16 x 16 de (0x60, 0x80) de la pagina 1 a 0xC60C
	call 0581bh		;71e2   ; refuerzos: con 0xC602 puesto, cada 0xC605 cuadros crea un actor de p06:A445 (sala x 3) si hay pocos de ese tipo
	ld ix,0d000h		;71e5   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;71e9
L_71EB:
	ld a,(ix+000h)		;71eb   ; lee el tipo del actor
	and a			;71ee
	jr z,L_720A		;71ef
	push bc			;71f1
	ld a,(ix+01fh)		;71f2   ; lee la cuenta del golpe del actor
	and a			;71f5
	jr z,L_7200		;71f6
	dec (ix+01fh)		;71f8   ; baja la cuenta del golpe del actor
	call sacude_actor		;71fb   ; sacude_actor: con (ix+0x1F) 0x3F/0x3D sube la Y 4 puntos, con 0x3B/0x39 la baja
	jr L_7209		;71fe
L_7200:
	call un_actor		;7200   ; un_actor: sube (ix+0x0C) y despacha: sin aguante muere, con el bit 7 del tipo muriendo, si no su tipo (tabla 0x722F)
	call mueve_actor		;7203   ; mueve_actor: suma las velocidades a la Y y a la X (16 bits) si (ix+6) no es cero
	call actor_fuera		;7206   ; actor_fuera: si el actor sale de la sala (Y >= 0xC1, X >= 0xFF o < 7) lo quita
L_7209:
	pop bc			;7209
L_720A:
	ld de,00080h		;720a
	add ix,de		;720d
	djnz L_71EB		;720f
fin_de_actores:		; solo ret: fin del bucle de actores y lo de cada cuadro de los tipos 2, 7, 17, 42 y 56
	ret			;7211
un_actor:		; sube (ix+0x0C) y despacha: sin aguante muere, con el bit 7 del tipo muriendo, si no su tipo (tabla 0x722F)
	inc (ix+00ch)		;7212   ; sube la cuenta de cuadros del actor
	ld a,(ix+00dh)		;7215   ; lee el aguante del actor
	or a			;7218
	jp z,muere_actor		;7219   ; muere_actor: baja 0xC606 (tipos 10, 11, 13, 20-22), tapa el 7 y marca el tipo con el bit 7 (salvo 0x40), sonido 0x16
	ld a,(ix+000h)		;721c   ; lee el tipo del actor
	bit 7,a		;721f
	jp nz,muriendo		;7221   ; muriendo: despacha por el nibble del tipo (0x74D0, tabla 0x74C0)
	dec a			;7224
	bit 6,(ix+01eh)		;7225   ; mira el bit 6 de las marcas del actor (bits 0-4 el arma que le dio, 6 golpe, 7 contacto)
	jp nz,actor_golpeado		;7229   ; actor_golpeado: sube (ix+0x7A): al tercero muere (y a veces suelta algo); si no, (ix+0x1F) = 0x40
	call 041eah		;722c   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_722F: 65 destinos del despachador p00:41EA (call en p01:722C, el
;   indice en A): A549, 7211, 9CD4, 9DA9, 9DA9, 9F19, 7211, 99F7, B9F4, A7BB,
;   A7BB, B959, AD40, AB5C, 994E, A604, 7211, B1F6, AA3C, B00F, B053, B0B8,
;   B8C5, B290, 9B2F, BB75, B42C, BCD3, B5A4, 9DA9, B146, BDA2, B5F0, B6E5,
;   54AF, A24C, A502, B871, B8F5, BF90, 95BF, 7211, B6AF, A202, 7E0E, 9A39,
;   830D, 9AD9, 9C9E, 9C9E, 9C9E, 9C9E, 9F8E, A072, 9C04, 7211, AE7F, B8C5,
;   830D, B81B, B8C5, BB33, 969A, A0E8, B97D; lo leen p01:722C (130 bytes)
;   0x722f..0x72b1  (130 bytes)
DATA_tabla_722F:
	defw 0a549h,07211h,09cd4h,09da9h,09da9h,09f19h,07211h,099f7h	; 722f
	defw 0b9f4h,0a7bbh,0a7bbh,0b959h,0ad40h,0ab5ch,0994eh,0a604h	; 723f
	defw 07211h,0b1f6h,0aa3ch,0b00fh,0b053h,0b0b8h,0b8c5h,0b290h	; 724f
	defw 09b2fh,0bb75h,0b42ch,0bcd3h,0b5a4h,09da9h,0b146h,0bda2h	; 725f
	defw 0b5f0h,0b6e5h,054afh,0a24ch,0a502h,0b871h,0b8f5h,0bf90h	; 726f
	defw 095bfh,07211h,0b6afh,0a202h,07e0eh,09a39h,0830dh,09ad9h	; 727f
	defw 09c9eh,09c9eh,09c9eh,09c9eh,09f8eh,0a072h,09c04h,07211h	; 728f
	defw 0ae7fh,0b8c5h,0830dh,0b81bh,0b8c5h,0bb33h,0969ah,0a0e8h	; 729f
	defw 0b97dh	; 72af

; ======================================================================
; CODIGO 0x72b1..0x74c0  (527 bytes)
; ======================================================================


cuenta_c669:		; al acabar 0xC669, en la sala 0xC60F y con 0xC668 a cero copia 16 x 16 de (0x60, 0x80) de la pagina 1 a 0xC60C
	ld hl,0c669h		;72b1
	ld a,(hl)			;72b4
	or a			;72b5
	ret z			;72b6
	dec (hl)			;72b7
	ret nz			;72b8
	ld a,(0c130h)		;72b9   ; lee la sala
	ld b,a			;72bc
	ld a,(0c60fh)		;72bd
	cp b			;72c0
	ret nz			;72c1
	ld hl,0c668h		;72c2
	ld a,(hl)			;72c5
	ld (hl),000h		;72c6
	or a			;72c8
	ret nz			;72c9
	ld hl,0c60ch		;72ca
	ld e,(hl)			;72cd
	inc hl			;72ce
	ld d,(hl)			;72cf
	ld hl,06080h		;72d0
	ld bc,01010h		;72d3
	ld a,001h		;72d6
	jp 04fcdh		;72d8   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
sacude_actor:		; con (ix+0x1F) 0x3F/0x3D sube la Y 4 puntos, con 0x3B/0x39 la baja
	ld a,(ix+01fh)		;72db   ; lee la cuenta del golpe del actor
	cp 03fh		;72de
	ld c,0fch		;72e0
	jr z,L_72F1		;72e2
	cp 03dh		;72e4
	jr z,L_72F1		;72e6
	cp 03bh		;72e8
	ld c,004h		;72ea
	jr z,L_72F1		;72ec
	cp 039h		;72ee
	ret nz			;72f0
L_72F1:
	ld a,(ix+003h)		;72f1   ; lee la Y del actor
	add a,c			;72f4
	ld (ix+003h),a		;72f5   ; guarda la Y del actor
	ret			;72f8
actor_golpeado:		; sube (ix+0x7A): al tercero muere (y a veces suelta algo); si no, (ix+0x1F) = 0x40
	inc (ix+07ah)		;72f9
	ld a,(ix+07ah)		;72fc
	cp 003h		;72ff
	jr z,L_7308		;7301
	ld (ix+01fh),040h		;7303   ; la cuenta del golpe del actor = 0x40
	ret			;7307
L_7308:
	ld a,(ix+000h)		;7308   ; lee el tipo del actor
	cp 004h		;730b
	jr nz,L_7333		;730d
	cp 005h		;730f
	jr z,L_731B		;7311
	cp 00eh		;7313
	jr z,L_731B		;7315
	cp 01eh		;7317
	jr z,L_731B		;7319
L_731B:
	ld a,(ix+003h)		;731b   ; lee la Y del actor
	sub 004h		;731e
	ld e,a			;7320
	ld a,(ix+005h)		;7321   ; lee la X del actor
	sub 008h		;7324
	ld d,a			;7326
	ld a,r		;7327
	rra			;7329
	rra			;732a
	and 003h		;732b
	cp 002h		;732d
	ld c,a			;732f
	call c,pon_objeto		;7330   ; pon_objeto: p06:BB8E con A = C y DE (Y, X)
L_7333:
	jp muere_actor		;7333   ; muere_actor: baja 0xC606 (tipos 10, 11, 13, 20-22), tapa el 7 y marca el tipo con el bit 7 (salvo 0x40), sonido 0x16
mueve_actor:		; suma las velocidades a la Y y a la X (16 bits) si (ix+6) no es cero
	bit 7,(ix+000h)		;7336   ; mira el bit 7 de el tipo del actor
	ret nz			;733a
	ld a,(ix+006h)		;733b   ; lee si el actor se mueve (p01:7336)
	and a			;733e
	ret z			;733f
	ld b,002h		;7340
	push ix		;7342
L_7344:
	ld e,(ix+007h)		;7344   ; lee la velocidad Y del actor
	ld d,(ix+008h)		;7347   ; lee la velocidad Y del actor (alta)
	ld l,(ix+002h)		;734a
	ld h,(ix+003h)		;734d   ; lee la Y del actor
	add hl,de			;7350
	ld (ix+002h),l		;7351
	ld (ix+003h),h		;7354   ; guarda la Y del actor
	inc ix		;7357
	inc ix		;7359
	djnz L_7344		;735b
	pop ix		;735d
	ret			;735f
actor_fuera:		; si el actor sale de la sala (Y >= 0xC1, X >= 0xFF o < 7) lo quita
	ld a,(ix+003h)		;7360   ; lee la Y del actor
	cp 0c1h		;7363
	jr nc,L_7371		;7365
	ld a,(ix+005h)		;7367   ; lee la X del actor
	cp 0ffh		;736a
	jr nc,L_7371		;736c
	cp 007h		;736e
	ret nc			;7370
L_7371:
	ld a,(ix+000h)		;7371   ; lee el tipo del actor
	and 07fh		;7374
	cp 025h		;7376
	jp z,0a538h		;7378
quita_actor:		; quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld a,(ix+000h)		;737b   ; lee el tipo del actor
	cp 0a0h		;737e
	jr nz,L_738F		;7380
	ld a,001h		;7382
	ld (0c610h),a		;7384
	ld hl,0c637h		;7387
	set 0,(hl)		;738a
	jp L_7409		;738c
L_738F:
	ld a,(ix+000h)		;738f   ; lee el tipo del actor
	cp 09ah		;7392
	jr nz,L_73A3		;7394
	ld hl,0c626h		;7396
	dec (hl)			;7399
	jr nz,L_73A3		;739a
	ld c,002h		;739c
	ld de,03030h		;739e
	jr L_7406		;73a1
L_73A3:
	ld a,(ix+000h)		;73a3   ; lee el tipo del actor
	cp 0a9h		;73a6
	jr nz,L_73B1		;73a8
	ld c,003h		;73aa
	ld de,03870h		;73ac
	jr L_7406		;73af
L_73B1:
	ld a,(ix+000h)		;73b1   ; lee el tipo del actor
	cp 0a4h		;73b4
	jr nz,L_73BF		;73b6
	ld a,001h		;73b8
	ld (0c627h),a		;73ba
	jr L_7409		;73bd
L_73BF:
	ld a,(ix+000h)		;73bf   ; lee el tipo del actor
	cp 0a1h		;73c2
	jr nz,L_73CD		;73c4
	ld hl,0c631h		;73c6
	set 0,(hl)		;73c9
	jr L_7409		;73cb
L_73CD:
	ld a,(ix+000h)		;73cd   ; lee el tipo del actor
	cp 0a2h		;73d0
	jr nz,L_73DB		;73d2
	ld hl,0c630h		;73d4
	set 0,(hl)		;73d7
	jr L_7409		;73d9
L_73DB:
	ld a,(ix+000h)		;73db   ; lee el tipo del actor
	cp 0b9h		;73de
	jr nz,L_73EF		;73e0
	ld hl,0c638h		;73e2
	dec (hl)			;73e5
	jr nz,L_73EF		;73e6
	ld c,004h		;73e8
	ld de,06224h		;73ea
	jr L_7406		;73ed
L_73EF:
	ld a,(ix+000h)		;73ef   ; lee el tipo del actor
	res 7,a		;73f2
	cp 012h		;73f4
	call z,0b26fh		;73f6   ; bandera_c622: 0xC622 = 1 y la musica de la sala
	ld a,(ix+000h)		;73f9   ; lee el tipo del actor
	and 07fh		;73fc
	cp 02ch		;73fe
	jr nz,borra_actor		;7400
	ld (ix+000h),a		;7402   ; guarda el tipo del actor
	ret			;7405
L_7406:
	call pon_objeto		;7406   ; pon_objeto: p06:BB8E con A = C y DE (Y, X)
L_7409:
	call 044ech		;7409   ; musica_de_la_sala: 0xC602 a cero y elige la musica de la sala (0xC159, 0xC0F4) y 0xC15F
borra_actor:		; el tipo y (ix+0x0E) a cero y sus sprites escondidos
	xor a			;740c
	ld (ix+000h),a		;740d   ; guarda el tipo del actor
	ld (ix+00eh),a		;7410   ; guarda con que choca el actor (bit 0 Snake, bit 1 proyectiles)
	push ix		;7413
	pop hl			;7415
	set 5,l		;7416
	ld c,(hl)			;7418
	ld a,c			;7419
	and a			;741a
	ret z			;741b
	inc l			;741c
	ex de,hl			;741d
L_741E:
	ld hl,0ea28h		;741e   ; apunta a los atributos de los sprites de los actores
	ld a,(de)			;7421
	add a,a			;7422
	add a,a			;7423
	add a,l			;7424
	ld l,a			;7425
	ld (hl),0e0h		;7426
	inc e			;7428
	ld a,0e0h		;7429
	ld (de),a			;742b
	ld a,e			;742c
	add a,004h		;742d
	ld e,a			;742f
	dec c			;7430
	jr nz,L_741E		;7431
	ret			;7433
pon_objeto:		; p06:BB8E con A = C y DE (Y, X)
	ld a,c			;7434
	push ix		;7435
	call 04913h		;7437   ; zona_banco_6: pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bb8eh		;743a   ; suelta_objeto: el objeto de 0xBBD8 + A en (E, D) como objeto de la sala, y lo pinta con el sonido 0x25
	call 04248h		;743d   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	pop ix		;7440
	ret			;7442
tapa_tipo_7:		; copia 16 x 16 de (p03:AF8C, 0xA0) de la pagina 1 a la Y/X del actor
	ld h,(ix+005h)		;7443   ; lee la X del actor
	ld l,(ix+003h)		;7446   ; lee la Y del actor
	call 0af8ch		;7449   ; sitio_de_mina: H, L - 8 y A = (ix+0x0F) x 16
	ex de,hl			;744c
	ld h,a			;744d
	ld l,0a0h		;744e
	ld bc,01010h		;7450
	ld a,040h		;7453
	jp 05011h		;7455   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
atributos_de_los_actores:		; los atributos del cuadro de los 16 actores
	ld ix,0d000h		;7458   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;745c
L_745E:
	push bc			;745e
	ld a,(ix+000h)		;745f   ; lee el tipo del actor
	and a			;7462
	call nz,05506h		;7463   ; atributos_del_actor: el cuadro (ix+0x0B) de p05:9890 a los sprites de IX sumando su Y y su X (0x91-0xA5: grupo de 0x556F)
	ld de,00080h		;7466
	add ix,de		;7469
	pop bc			;746b
	djnz L_745E		;746c
	ret			;746e
muere_actor:		; baja 0xC606 (tipos 10, 11, 13, 20-22), tapa el 7 y marca el tipo con el bit 7 (salvo 0x40), sonido 0x16
	ld a,(ix+000h)		;746f   ; lee el tipo del actor
	ld d,a			;7472
	cp 00ah		;7473
	jr z,L_7489		;7475
	cp 00bh		;7477
	jr z,L_7489		;7479
	cp 00dh		;747b
	jr z,L_7489		;747d
	sub 014h		;747f
	jr z,L_7489		;7481
	dec a			;7483
	jr z,L_7489		;7484
	dec a			;7486
	jr nz,L_7493		;7487
L_7489:
	ld hl,0c606h		;7489
	dec (hl)			;748c
	bit 7,(hl)		;748d
	jr z,L_7493		;748f
	ld (hl),000h		;7491
L_7493:
	ld a,d			;7493
	cp 007h		;7494
	call z,tapa_tipo_7		;7496   ; tapa_tipo_7: copia 16 x 16 de (p03:AF8C, 0xA0) de la pagina 1 a la Y/X del actor
	cp 040h		;7499
	jr z,muriendo		;749b
	xor a			;749d
	set 7,(ix+000h)		;749e   ; pone a uno el bit 7 de el tipo del actor
	ld (ix+00eh),a		;74a2   ; guarda con que choca el actor (bit 0 Snake, bit 1 proyectiles)
	ld (ix+00ch),a		;74a5   ; guarda la cuenta de cuadros del actor
	inc a			;74a8
	ld (ix+00dh),a		;74a9   ; guarda el aguante del actor
	ld a,016h		;74ac
	call 04284h		;74ae   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
muriendo:		; despacha por el nibble del tipo (0x74D0, tabla 0x74C0)
	ld a,(ix+000h)		;74b1   ; lee el tipo del actor
	and 07fh		;74b4
	dec a			;74b6
	ld hl,074d0h		;74b7
	call 042d4h		;74ba   ; nibble_a: A = el nibble A de la tabla HL (el alto si A es par)
	call 041eah		;74bd   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_74C0: 8 destinos del despachador p00:41EA (call en p01:74BD, el
;   indice en A): 7371, 7512, 7507, 74F1, 7521, 753C, 7562, 7684; lo leen
;   p01:74BD (16 bytes)
;   0x74c0..0x74d0  (16 bytes)
DATA_tabla_74C0:
	defw 07371h,07512h,07507h,074f1h,07521h,0753ch,07562h,07684h	; 74c0

; ----------------------------------------------------------------------
; DATOS nibbles_74d0: 64 nibbles y un byte: p01:74BA lee el nibble (A & 0x7F)
;   - 1 con L_42D4 y con el llama al despachador de 0x74BD (la tabla de
;   0x74C0)
;   0x74d0..0x74f1  (33 bytes)
DATA_nibbles_74d0:
	defb 000h,001h,015h,050h,061h,010h,011h,000h,066h,014h,044h,001h,011h,011h,001h,011h	; 74d0  ...Pa...f.D.....
	defb 011h,001h,006h,000h,010h,007h,000h,001h,032h,022h,050h,013h,010h,000h,000h,000h	; 74e0  ........2"P.....
	defb 000h	; 74f0

; ======================================================================
; CODIGO 0x74f1..0x7645  (340 bytes)
; ======================================================================


muriendo_3:		; en la sala 0xC1 con (ix+0x0F) = 3 pone 0xC657 y 0xC64D; y muriendo_2
	ld a,(0c130h)		;74f1   ; lee la sala
	cp 0c1h		;74f4
	jr nz,muriendo_2		;74f6
	ld a,(ix+00fh)		;74f8   ; lee el numero del actor entre los de su tipo
	cp 003h		;74fb
	jr nz,muriendo_2		;74fd
	ld a,001h		;74ff
	ld (0c657h),a		;7501
	ld (0c64dh),a		;7504
muriendo_2:		; si (ix+0x0C) es 0, baja_c132; y muriendo_1
	ld a,(ix+00ch)		;7507   ; lee la cuenta de cuadros del actor
	and a			;750a
	push ix		;750b
	call z,baja_c132		;750d   ; baja_c132: borra 0xC640-0xC651 (salvo 0xC64D) y, si 0xC132 > 0, lo baja con el sonido 0x27
	pop ix		;7510
muriendo_1:		; con el tipo 0x20, 0xC4BA = 0; y lo quita
	ld a,(ix+000h)		;7512
	and 07fh		;7515
	sub 020h		;7517
	jr nz,L_751E		;7519
	ld (0c4bah),a		;751b
L_751E:
	jp quita_actor		;751e   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
muriendo_4:		; explosion de 6 sprites (cuadros 0x7A-0x7C) y la quita al cuadro 0x10
	ld hl,0764bh		;7521
	ld a,(ix+00ch)		;7524   ; lee la cuenta de cuadros del actor
	cp 005h		;7527
	ld c,07ah		;7529
	jr c,L_7538		;752b
	cp 00ah		;752d
	inc c			;752f
	jr c,L_7538		;7530
	cp 010h		;7532
	jp z,quita_actor		;7534   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	inc c			;7537
L_7538:
	ld b,006h		;7538
	jr L_7555		;753a
muriendo_5:		; explosion de 2 sprites (cuadros 0x6A-0x6C) y la quita al cuadro 0x10
	ld hl,07647h		;753c
	ld a,(ix+00ch)		;753f   ; lee la cuenta de cuadros del actor
	cp 005h		;7542
	ld c,06ah		;7544
	jr c,L_7553		;7546
	cp 00ah		;7548
	inc c			;754a
	jr c,L_7553		;754b
	cp 010h		;754d
	jp z,quita_actor		;754f   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	inc c			;7552
L_7553:
	ld b,002h		;7553
L_7555:
	ld (ix+00bh),c		;7555   ; guarda el cuadro del actor
	push ix		;7558
	pop de			;755a
	ld a,025h		;755b
	call 041e5h		;755d   ; de_mas_a: DE = DE + A
	jr L_75D7		;7560
muriendo_6:		; la bandera (ix+0x1B), y explosion de 18 u 8 sprites (cuadros 0x7F-0x81); Metal Gear (0x11) aparte
	ld l,(ix+01bh)		;7562
	ld h,(ix+01ch)		;7565
	ld a,(hl)			;7568
	and a			;7569
	jr nz,L_758D		;756a
	ld (hl),001h		;756c
	call 044ech		;756e   ; musica_de_la_sala: 0xC602 a cero y elige la musica de la sala (0xC159, 0xC0F4) y 0xC15F
	ld a,(ix+000h)		;7571   ; lee el tipo del actor
	and 07fh		;7574
	sub 011h		;7576
	jr nz,L_758D		;7578
	inc a			;757a
	ld (0c13ch),a		;757b   ; guarda la cuenta atras en marcha
	ld hl,03000h		;757e
	ld (0c13dh),hl		;7581   ; guarda la cuenta atras (BCD, 16 bits) y el byte siguiente (16 bits)
	ld a,l			;7584
	ld (0c4b2h),a		;7585
	ld a,053h		;7588
	call 04284h		;758a   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
L_758D:
	ld a,(ix+000h)		;758d   ; lee el tipo del actor
	and 07fh		;7590
	cp 011h		;7592
	jr z,muriendo_metal_gear		;7594
	ld a,(ix+00ch)		;7596   ; lee la cuenta de cuadros del actor
	cp 005h		;7599
	ld hl,07647h		;759b
	ld c,07fh		;759e
	jr c,cuadro_y_colores		;75a0
	cp 010h		;75a2
	jp z,muriendo_7		;75a4   ; muriendo_7: tipos 9 y 0x12 se quitan, 0x26 p03:B8C6, 0x11 p12:BC36, 0x2C deja dos fichas en 0xC63B
	inc c			;75a7
	cp 00ah		;75a8
	ld hl,07647h		;75aa
	jr c,cuadro_y_colores		;75ad
	ld c,081h		;75af
	ld hl,07659h		;75b1
	jr nz,cuadro_y_colores		;75b4
	ld a,001h		;75b6
	ld (0c610h),a		;75b8
cuadro_y_colores:		; (ix+0x0B) = C y los colores de HL, uno cada 5 bytes desde (ix+0x25), B sprites
	ld (ix+00bh),c		;75bb   ; guarda el cuadro del actor
	push ix		;75be
	pop de			;75c0
	ld a,025h		;75c1
	call 041e5h		;75c3   ; de_mas_a: DE = DE + A
	ld b,012h		;75c6
	ld a,(ix+000h)		;75c8   ; lee el tipo del actor
	and 07fh		;75cb
	cp 009h		;75cd
	jr z,L_75D7		;75cf
	cp 012h		;75d1
	jr z,L_75D7		;75d3
	ld b,008h		;75d5
L_75D7:
	ld a,(hl)			;75d7
	ld (de),a			;75d8
	inc hl			;75d9
	ld a,005h		;75da
	call 041e5h		;75dc   ; de_mas_a: DE = DE + A
	djnz L_75D7		;75df
	ret			;75e1
muriendo_metal_gear:		; el tipo 0x11: el color 15 parpadea, cuadros 0x89-0x8E y al final el texto 0x96
	ld a,(ix+00ch)		;75e2   ; lee la cuenta de cuadros del actor
	and 002h		;75e5
	ld de,00000h		;75e7
	jr nz,L_75EF		;75ea
	ld de,07707h		;75ec
L_75EF:
	ld a,00fh		;75ef
	call 04e66h		;75f1   ; color: el color A de la paleta = DE ([RB][G]), y su copia en 0xF680
	ld a,(ix+00ch)		;75f4   ; lee la cuenta de cuadros del actor
	cp 005h		;75f7
	ld hl,07649h		;75f9
	ld c,089h		;75fc
	jr c,cuadro_y_colores		;75fe
	inc c			;7600
	cp 00ah		;7601
	ld hl,07647h		;7603
	jr c,cuadro_y_colores		;7606
	inc c			;7608
	cp 00fh		;7609
	ld hl,07645h		;760b
	jr c,cuadro_y_colores		;760e
	inc c			;7610
	cp 014h		;7611
	ld hl,07647h		;7613
	jr c,cuadro_y_colores		;7616
	inc c			;7618
	cp 019h		;7619
	ld hl,0766bh		;761b
	jr c,cuadro_y_colores		;761e
	inc c			;7620
	cp 021h		;7621
	ld hl,07673h		;7623
	jr c,cuadro_y_colores		;7626
	jr z,L_763C		;7628
	cp 022h		;762a
	jr nz,L_7634		;762c
	ld a,001h		;762e
	ld (0c610h),a		;7630
	ret			;7633
L_7634:
	call quita_actor		;7634   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	ld a,096h		;7637
	jp 05cd9h		;7639   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
L_763C:
	call muriendo_7		;763c   ; muriendo_7: tipos 9 y 0x12 se quitan, 0x26 p03:B8C6, 0x11 p12:BC36, 0x2C deja dos fichas en 0xC63B
	ld hl,0764dh		;763f
	jp cuadro_y_colores		;7642   ; cuadro_y_colores: (ix+0x0B) = C y los colores de HL, uno cada 5 bytes desde (ix+0x25), B sprites

; ----------------------------------------------------------------------
; DATOS fichas_7645: 54 bytes en los que p01:7521-763F pone HL (0x7645,
;   0x7647, 0x7649, 0x764B, 0x764D, 0x7659, 0x766B o 0x7673 segun (ix+0x0C)) y
;   C para p01:75BB: parejas [0x06][0x48] y [0x0E][0x0E] con ceros entre
;   medias
;   0x7645..0x767b  (54 bytes)
DATA_fichas_7645:
	defb 006h,048h	; 7645
	defb 006h,048h	; 7647
	defb 006h,048h	; 7649
	defb 006h,048h	; 764b
	defb 000h,000h	; 764d
	defb 000h,000h	; 764f
	defb 000h,000h	; 7651
	defb 000h,000h	; 7653
	defb 000h,000h	; 7655
	defb 000h,000h	; 7657
	defb 00eh,00eh	; 7659
	defb 00eh,00eh	; 765b
	defb 006h,048h	; 765d
	defb 006h,048h	; 765f
	defb 000h,000h	; 7661
	defb 000h,000h	; 7663
	defb 000h,000h	; 7665
	defb 000h,000h	; 7667
	defb 000h,000h	; 7669
	defb 00eh,00eh	; 766b
	defb 00eh,00eh	; 766d
	defb 006h,048h	; 766f
	defb 000h,000h	; 7671
	defb 00eh,00eh	; 7673
	defb 00eh,00eh	; 7675
	defb 000h,000h	; 7677
	defb 000h,000h	; 7679

; ======================================================================
; CODIGO 0x767b..0x7703  (136 bytes)
; ======================================================================


metal_gear_roto:		; p12:BC36
	call 0491fh		;767b   ; zona_banco_12: pone el banco 12 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bc36h		;767e   ; dibujo_sin_metal_gear: el dibujo p15:B5F7 en (0x60, 0x20)
	jp 04248h		;7681   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
muriendo_7:		; tipos 9 y 0x12 se quitan, 0x26 p03:B8C6, 0x11 p12:BC36, 0x2C deja dos fichas en 0xC63B
	ld a,(ix+000h)		;7684   ; lee el tipo del actor
	and 07fh		;7687
	cp 009h		;7689
	jp z,quita_actor		;768b   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	cp 012h		;768e
	jp z,quita_actor		;7690   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
	cp 026h		;7693
	jp z,0b8c6h		;7695
	cp 011h		;7698
	jr z,metal_gear_roto		;769a
	cp 02ch		;769c
	ret nz			;769e
	xor a			;769f
	ld (0c616h),a		;76a0
	ld (ix+000h),a		;76a3   ; guarda el tipo del actor
	ld hl,0c63bh		;76a6
	ld a,(ix+003h)		;76a9   ; lee la Y del actor
	sub 008h		;76ac
	ld (hl),a			;76ae
	inc hl			;76af
	ld a,(ix+005h)		;76b0   ; lee la X del actor
	sub 004h		;76b3
	ld (hl),a			;76b5
	call 04acbh		;76b6   ; paleta_de_la_sala: manda al VDP la paleta de la sala (nibble p05:8B40, tabla p05:8BBE)
	call quita_actor		;76b9   ; quita_actor: quita al actor: banderas por tipo (0xA0, 0x9A, 0xA9, 0xA4, 0xA1, 0xA2, 0xB9, 0x12, 0x2C), objeto y musica
fichas_de_c63b:		; pinta las dos fichas de 0x7703 (0x7705 en la sala 0x28) en 0xC63B
	ld hl,0c63bh		;76bc
	ld e,(hl)			;76bf
	inc hl			;76c0
	ld d,(hl)			;76c1
	ld a,e			;76c2
	or d			;76c3
	ret z			;76c4
	ld a,(0c130h)		;76c5   ; lee la sala
	cp 028h		;76c8
	ld hl,07705h		;76ca
	jr z,L_76D1		;76cd
	dec hl			;76cf
	dec hl			;76d0
L_76D1:
	ld (ix+00eh),000h		;76d1   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x00
	jr L_76E4		;76d5
fichas_de_c63b_si_hay:		; fichas_de_c63b si 0xC63B y no 0xC616
	ld hl,0c63bh		;76d7
	ld a,(hl)			;76da
	or a			;76db
	ret z			;76dc
	ld a,(0c616h)		;76dd
	or a			;76e0
	ret nz			;76e1
	jr fichas_de_c63b		;76e2
L_76E4:
	ld a,(hl)			;76e4
	inc hl			;76e5
	push hl			;76e6
	push de			;76e7
	ld bc,00808h		;76e8
	push bc			;76eb
	ld h,a			;76ec
	ld l,010h		;76ed
	ld a,001h		;76ef
	call 04fcdh		;76f1   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop bc			;76f4
	pop de			;76f5
	ld a,e			;76f6
	add a,008h		;76f7
	ld e,a			;76f9
	pop hl			;76fa
	ld h,(hl)			;76fb
	ld l,010h		;76fc
	ld a,001h		;76fe
	jp 04fcdh		;7700   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)

; ----------------------------------------------------------------------
; DATOS dos_posiciones: dos parejas (0x30, 0x38) y (0x50, 0x70): p01:76CA coge
;   la segunda en la sala 0x28 y la primera en las demas (`dec hl` x 2) y las
;   pasa a L_4FCD
;   0x7703..0x7707  (4 bytes)
DATA_dos_posiciones:
	defb 030h,038h	; 7703
	defb 050h,070h	; 7705

; ======================================================================
; CODIGO 0x7707..0x773c  (53 bytes)
; ======================================================================


llama_bf6e:		; p15:BF6E
	call 04925h		;7707   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bf6eh		;770a   ; borra_rayos: tapa los rayos copiando de la pagina 1
	jp 04248h		;770d   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
pinta_las_puertas:		; pinta cerradas las puertas de la sala cuyo byte 1 no es cero, por su tipo (tabla 0x773C)
	ld a,(0c4ffh)		;7710   ; lee cuantas puertas tiene la sala
	and a			;7713
	ret z			;7714
	ld b,a			;7715
	ld hl,0c3d0h		;7716   ; apunta a las puertas de la sala
L_7719:
	push bc			;7719
	push hl			;771a
	inc hl			;771b
	ld a,(hl)			;771c
	and a			;771d
	jr z,L_772F		;771e
	inc hl			;7720
	inc hl			;7721
	ld a,(hl)			;7722
	inc hl			;7723
	inc hl			;7724
	ld e,(hl)			;7725
	inc hl			;7726
	ld d,(hl)			;7727
	ld (0ec00h),de		;7728   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	call pinta_puerta		;772c   ; pinta_puerta: pinta la puerta del tipo A en 0xEC00
L_772F:
	pop hl			;772f
	ld de,00010h		;7730
	add hl,de			;7733
	pop bc			;7734
	djnz L_7719		;7735
L_7737:
	ret			;7737
pinta_puerta:		; pinta la puerta del tipo A en 0xEC00
	dec a			;7738
	call 041eah		;7739   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_773C: 19 destinos del despachador p00:41EA (call en p01:7739, el
;   indice en A): 77D8, 7762, 777E, 77A7, 77F3, 7737, 780F, 7814, 7819, 781E,
;   7823, 7828, 782D, 7832, 7837, 783C, 7841, 7846, 784B; lo leen p01:7739 (38
;   bytes)
;   0x773c..0x7762  (38 bytes)
DATA_tabla_773C:
	defw 077d8h,07762h,0777eh,077a7h,077f3h,07737h,0780fh,07814h	; 773c
	defw 07819h,0781eh,07823h,07828h,0782dh,07832h,07837h,0783ch	; 774c
	defw 07841h,07846h,0784bh	; 775c  -> L_7841 L_7846 L_784B

; ======================================================================
; CODIGO 0x7762..0x78f4  (402 bytes)
; ======================================================================


puerta_tipo_2:		; copia 0x20 x 8 de (0xE0, 0xC0) de la pagina 1 y el marco
	ld de,(0ec00h)		;7762   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld hl,0e0c0h		;7766
	ld bc,02008h		;7769
	ld a,048h		;776c
	call 05011h		;776e   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	ld bc,00401h		;7771
	ld de,(0ec00h)		;7774   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
L_7778:
	ld hl,0a700h		;7778
	jp 044b6h		;777b
puerta_tipo_3:		; ocho tiras de 1 x 0x20 en diagonal desde (0xE0, 0xA0)
	ld b,008h		;777e
	ld de,(0ec00h)		;7780   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld hl,0e0a0h		;7784
L_7787:
	push bc			;7787
	push hl			;7788
	push de			;7789
	ld bc,00120h		;778a
	ld a,048h		;778d
	call 05011h		;778f   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	pop de			;7792
	pop hl			;7793
	inc e			;7794
	inc e			;7795
	inc e			;7796
	inc e			;7797
	inc d			;7798
	inc h			;7799
	pop bc			;779a
	djnz L_7787		;779b
	ld de,(0ec00h)		;779d   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,d			;77a1
	sub 008h		;77a2
	ld d,a			;77a4
	jr L_77CE		;77a5
puerta_tipo_4:		; ocho tiras de 1 x 0x20 en diagonal desde (0xE8, 0xA0)
	ld b,008h		;77a7
	ld de,(0ec00h)		;77a9   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,01ch		;77ad
	add a,e			;77af
	ld e,a			;77b0
	ld hl,0e8a0h		;77b1
L_77B4:
	push bc			;77b4
	push hl			;77b5
	push de			;77b6
	ld bc,00120h		;77b7
	ld a,048h		;77ba
	call 05011h		;77bc   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	pop de			;77bf
	pop hl			;77c0
	dec e			;77c1
	dec e			;77c2
	dec e			;77c3
	dec e			;77c4
	inc d			;77c5
	inc h			;77c6
	pop bc			;77c7
	djnz L_77B4		;77c8
	ld de,(0ec00h)		;77ca   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
L_77CE:
	ld bc,00204h		;77ce
	ld a,020h		;77d1
	add a,e			;77d3
	ld e,a			;77d4
	jp L_7778		;77d5
puerta_tipo_1:		; copia 0x18 x 0x20 de (0xC4, 0xA0) de la pagina 1 y el marco
	ld de,(0ec00h)		;77d8   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld hl,0c4a0h		;77dc
	ld bc,01820h		;77df
	ld a,048h		;77e2
	call 05011h		;77e4   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	ld bc,00404h		;77e7
	ld de,(0ec00h)		;77ea   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,d			;77ee
	sub b			;77ef
	ld d,a			;77f0
	jr L_7778		;77f1
puerta_tipo_5:		; copia 0x18 x 0x20 de (0xC4, 0xC0) de la pagina 1 y el marco
	ld de,(0ec00h)		;77f3   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld hl,0c4c0h		;77f7
	ld bc,01820h		;77fa
	ld a,048h		;77fd
	call 05011h		;77ff   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	ld bc,00404h		;7802
	ld de,(0ec00h)		;7805   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,d			;7809
	sub b			;780a
	ld d,a			;780b
	jp L_7778		;780c
L_780F:
	ld de,0b0e2h		;780f
	jr puerta_dibujo		;7812
L_7814:
	ld de,0b0fch		;7814
	jr puerta_dibujo		;7817
L_7819:
	ld de,0b102h		;7819
	jr puerta_dibujo		;781c
L_781E:
	ld de,0b12bh		;781e
	jr puerta_dibujo		;7821
L_7823:
	ld de,0b16eh		;7823
	jr puerta_dibujo		;7826
L_7828:
	ld de,0b1ach		;7828
	jr puerta_dibujo		;782b
L_782D:
	ld de,0b1ach		;782d
	jr puerta_dibujo		;7830
L_7832:
	ld de,0b1b2h		;7832
	jr puerta_dibujo		;7835
L_7837:
	ld de,0b1dbh		;7837
	jr puerta_dibujo		;783a
L_783C:
	ld de,0b1f5h		;783c
	jr puerta_dibujo		;783f
L_7841:
	ld de,0b247h		;7841
	jr puerta_dibujo		;7844
L_7846:
	ld de,0b261h		;7846
	jr puerta_dibujo		;7849
L_784B:
	ld de,0b29fh		;784b
puerta_dibujo:		; copia el dibujo DE del banco 15 a 0xE600 y lo pone en 0xEC00
	ld hl,(0ec00h)		;784e   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	push hl			;7851
	push de			;7852
	call 045efh		;7853   ; dibujo_a_e600: copia un dibujo del banco 15 ([ancho][alto] en DE) a 0xE600
	pop hl			;7856
	pop de			;7857
	jp 044afh		;7858   ; pone_dibujo: pone un dibujo del banco 15 ([filas][columnas] y fichas) en la sala, en D/E
mira_las_puertas:		; Snake ante una puerta que se abre: modo 7; en un paso abierto: modo 1 y 0xC4FC = la puerta
	ld hl,0c3d0h		;785b   ; apunta a las puertas de la sala
	ld c,000h		;785e
	ld a,(0c4ffh)		;7860   ; lee cuantas puertas tiene la sala
	and a			;7863
	ret z			;7864
	ld b,a			;7865
L_7866:
	push bc			;7866
	push hl			;7867
	ld a,(hl)			;7868
	ld (0ec00h),a		;7869   ; guarda la casilla de trabajo 0xEC00
	inc hl			;786c
	ld a,(hl)			;786d
	inc hl			;786e
	and a			;786f
	jr z,L_7896		;7870
	ld a,(0c623h)		;7872
	and a			;7875
	jr z,L_787F		;7876
	ld a,(0ec00h)		;7878   ; lee la casilla de trabajo 0xEC00
	cp 062h		;787b
	jr z,L_78D3		;787d
L_787F:
	call se_abre		;787f   ; se_abre: acarreo si la puerta HL se abre ahora, por su clase (bits 0-4, tabla 0x78F4)
	jr nc,L_78D3		;7882
	pop hl			;7884
	pop bc			;7885
	ld a,c			;7886
	ld (0c4feh),a		;7887
	ld a,007h		;788a
	ld (0c151h),a		;788c   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	xor a			;788f
	ld (0c4fdh),a		;7890
	jp 053a5h		;7893   ; sprites_de_snake: atributos, colores y patrones de la pose de Snake
L_7896:
	ld a,(0ec00h)		;7896   ; lee la casilla de trabajo 0xEC00
	cp 040h		;7899
	jr z,L_78D3		;789b
	cp 06ch		;789d
	jr z,L_78D3		;789f
	ld a,(hl)			;78a1
	and 01fh		;78a2
	cp 00fh		;78a4
	jr z,L_78AC		;78a6
	cp 010h		;78a8
	jr nz,L_78B1		;78aa
L_78AC:
	ld a,(hl)			;78ac
	and 020h		;78ad
	jr z,L_78D3		;78af
L_78B1:
	ld de,00009h		;78b1
	add hl,de			;78b4
	call snake_en_recuadro_hl		;78b5   ; snake_en_recuadro_hl: acarreo si Snake esta en el recuadro de HL ([Y][alto][X][ancho])
	jr nc,L_78D3		;78b8
	pop hl			;78ba
	pop bc			;78bb
	ld de,0c3d0h		;78bc   ; apunta a las puertas de la sala
	ld a,c			;78bf
	call 042beh		;78c0   ; cuatro_a: HL = 4 x A
	add hl,hl			;78c3
	add hl,hl			;78c4
	add hl,de			;78c5
	ld a,(hl)			;78c6
	ld (0c4fch),a		;78c7
	xor a			;78ca
	ld (0c4fdh),a		;78cb
	inc a			;78ce
	ld (0c151h),a		;78cf   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ret			;78d2
L_78D3:
	pop hl			;78d3
	pop bc			;78d4
	ld de,00010h		;78d5
	add hl,de			;78d8
	inc c			;78d9
	djnz L_7866		;78da
	xor a			;78dc
	ld (0c4fch),a		;78dd
	ret			;78e0
se_abre:		; acarreo si la puerta HL se abre ahora, por su clase (bits 0-4, tabla 0x78F4)
	ld a,(0c18bh)		;78e1   ; lee el modo de la pose de Snake
	cp 007h		;78e4
	jr nz,L_78EA		;78e6
	xor a			;78e8
	ret			;78e9
L_78EA:
	ld a,(hl)			;78ea
	and 01fh		;78eb
	inc hl			;78ed
	ld c,l			;78ee
	ld b,h			;78ef
	dec a			;78f0
	call 041eah		;78f1   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_78F4: 16 destinos del despachador p00:41EA (call en p01:78F1, el
;   indice en A): 7914, 792F, 7933, 7937, 793B, 793F, 7943, 7947, 794B, 7960,
;   7973, 79A7, 79C9, 79D9, 79E9, 7A18; lo leen p01:78F1 (32 bytes)
;   0x78f4..0x7914  (32 bytes)
DATA_tabla_78F4:
	defw 07914h,0792fh,07933h,07937h,0793bh,0793fh,07943h,07947h	; 78f4
	defw 0794bh,07960h,07973h,079a7h,079c9h,079d9h,079e9h,07a18h	; 7904

; ======================================================================
; CODIGO 0x7914..0x7a50  (316 bytes)
; ======================================================================


abre_clase_1:		; mirando a la derecha (o arriba si el byte es 5) y en el recuadro
	ld l,c			;7914
	ld h,b			;7915
	ld a,(hl)			;7916
	cp 005h		;7917
	jr z,L_7925		;7919
	ld a,(0c185h)		;791b   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	sub 004h		;791e
	jp nz,L_7A77		;7920
	jr L_792C		;7923
L_7925:
	ld a,(0c185h)		;7925   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;7928
	jp nz,L_7A77		;7929
L_792C:
	jp snake_en_recuadro		;792c   ; snake_en_recuadro: acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
L_792F:
	ld d,00eh		;792f
	jr abre_con_tarjeta		;7931
L_7933:
	ld d,00fh		;7933
	jr abre_con_tarjeta		;7935
L_7937:
	ld d,010h		;7937
	jr abre_con_tarjeta		;7939
L_793B:
	ld d,011h		;793b
	jr abre_con_tarjeta		;793d
L_793F:
	ld d,012h		;793f
	jr abre_con_tarjeta		;7941
L_7943:
	ld d,013h		;7943
	jr abre_con_tarjeta		;7945
L_7947:
	ld d,014h		;7947
	jr abre_con_tarjeta		;7949
L_794B:
	ld d,015h		;794b
abre_con_tarjeta:		; con la tarjeta D elegida (0x0E-0x15 = CARD1-8), mirando hacia ella y en el recuadro
	ld l,c			;794d
	ld h,b			;794e
	ld a,(0c135h)		;794f   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp d			;7952
	jp nz,L_7A77		;7953
	ld a,(0c185h)		;7956   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp (hl)			;7959
	jp nz,L_7A77		;795a
	jp snake_en_recuadro		;795d   ; snake_en_recuadro: acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
abre_clase_10:		; mirando hacia ella, golpeando (estado 1) y en el recuadro
	ld l,c			;7960
	ld h,b			;7961
	ld a,(0c185h)		;7962   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp (hl)			;7965
	jp nz,L_7A77		;7966
	ld a,(0c180h)		;7969   ; lee el estado de Snake
	dec a			;796c
	jp nz,L_7A77		;796d
	jp snake_en_recuadro		;7970   ; snake_en_recuadro: acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
abre_clase_11:		; una P.BOMB (proyectil 5) en marcha dentro, o golpe de 8 cuadros mirando hacia ella
	ld l,c			;7973
	ld h,b			;7974
	ld a,(0c200h)		;7975   ; lee los proyectiles (0x180 bytes)
	cp 005h		;7978
	jr nz,L_798A		;797a
	ld a,(0c201h)		;797c
	cp 002h		;797f
	jr nz,L_798A		;7981
	inc hl			;7983
	inc hl			;7984
	inc hl			;7985
	inc hl			;7986
	jp proyectil_en_recuadro		;7987   ; proyectil_en_recuadro: acarreo si el proyectil (0xC204, 0xC206) esta en el recuadro de HL
L_798A:
	ld a,(0c180h)		;798a   ; lee el estado de Snake
	dec a			;798d
	jp nz,L_7A77		;798e
	ld a,(0c185h)		;7991   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp (hl)			;7994
	jp nz,L_7A77		;7995
	call snake_en_recuadro		;7998   ; snake_en_recuadro: acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
	ret nc			;799b
	ld a,(0c190h)		;799c   ; lee la cuenta del golpe
	cp 008h		;799f
	jp nz,L_7A77		;79a1
	jp L_7A49		;79a4
abre_clase_12:		; en la sala 0x49 mirando abajo y en el recuadro; si no, con 0xC62C
	ld l,c			;79a7
	ld h,b			;79a8
	ld a,(0c130h)		;79a9   ; lee la sala
	cp 049h		;79ac
	jr nz,L_79BB		;79ae
	ld a,(0c185h)		;79b0   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	sub 002h		;79b3
	jp nz,L_7A77		;79b5
	jp snake_en_recuadro		;79b8   ; snake_en_recuadro: acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
L_79BB:
	ld a,(0c62ch)		;79bb
	and a			;79be
	jp z,L_7A77		;79bf
	xor a			;79c2
	ld (0c62ch),a		;79c3
	jp L_7A79		;79c6
abre_clase_13:		; con 0xC663 (lo pone el texto 0x76)
	ld l,c			;79c9
	ld h,b			;79ca
	ld a,(0c663h)		;79cb
	and a			;79ce
	jp z,L_7A77		;79cf
	xor a			;79d2
	ld (0c663h),a		;79d3
	jp L_7A79		;79d6
abre_clase_14:		; con 0xC610
	ld l,c			;79d9
	ld h,b			;79da
	ld a,(0c610h)		;79db
	and a			;79de
	jp z,L_7A77		;79df
	xor a			;79e2
	ld (0c610h),a		;79e3
	jp L_7A79		;79e6
abre_clase_15:		; golpeando mirando hacia ella: baja 0xC13F (o 0xC140 con la puerta 0x0C) hasta cero
	ld l,c			;79e9
	ld h,b			;79ea
	ld a,(hl)			;79eb
	sub 007h		;79ec
	ld de,07a50h		;79ee
	call 041e5h		;79f1   ; de_mas_a: DE = DE + A
	ld a,(de)			;79f4
	ld d,a			;79f5
	ld a,(0c185h)		;79f6   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp d			;79f9
	jr nz,$+125		;79fa
	ld a,(0c180h)		;79fc   ; lee el estado de Snake
	dec a			;79ff
	jr nz,$+119		;7a00
	call snake_en_recuadro		;7a02   ; snake_en_recuadro: acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
	ret nc			;7a05
	ld a,(0ec00h)		;7a06   ; lee la casilla de trabajo 0xEC00
	cp 00ch		;7a09
	ld hl,0c140h		;7a0b
	jr z,L_7A13		;7a0e
	ld hl,0c13fh		;7a10
L_7A13:
	dec (hl)			;7a13
	jr nz,L_7A49		;7a14
	jr $+99		;7a16
abre_clase_16:		; una P.BOMB (proyectil 5) dentro, o golpe mirando hacia ella; con el sonido 0x0A
	ld l,c			;7a18
	ld h,b			;7a19
	ld a,(0c200h)		;7a1a   ; lee los proyectiles (0x180 bytes)
	cp 005h		;7a1d
	jr nz,L_7A2E		;7a1f
	ld a,(0c201h)		;7a21
	cp 002h		;7a24
	jr nz,L_7A2E		;7a26
	inc hl			;7a28
	inc hl			;7a29
	inc hl			;7a2a
	inc hl			;7a2b
	jr $+79		;7a2c
L_7A2E:
	ld a,(hl)			;7a2e
	sub 007h		;7a2f
	ld de,07a50h		;7a31
	call 041e5h		;7a34   ; de_mas_a: DE = DE + A
	ld a,(de)			;7a37
	ld d,a			;7a38
	ld a,(0c185h)		;7a39   ; lee la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	cp d			;7a3c
	jr nz,$+58		;7a3d
	ld a,(0c180h)		;7a3f   ; lee el estado de Snake
	dec a			;7a42
	jr nz,$+52		;7a43
	call snake_en_recuadro		;7a45   ; snake_en_recuadro: acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
	ret nc			;7a48
L_7A49:
	ld a,00ah		;7a49
	call 0427ch		;7a4b   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	and a			;7a4e
	ret			;7a4f

; ----------------------------------------------------------------------
; DATOS tabla_por_puerta: 14 bytes (2, 2, 3, 4, 3, 1, 2, 3, 4, 1, 4, 4, 1, 3),
;   uno por numero de puerta 7-20: p01:79EE y p01:7A31 leen 0x7A50 + puerta -
;   7 y usan el byte como D
;   0x7a50..0x7a5e  (14 bytes)
DATA_tabla_por_puerta:
	defb 002h,002h,003h,004h,003h,001h,002h,003h,004h,001h,004h,004h,001h,003h	; 7a50  ..............

; ======================================================================
; CODIGO 0x7a5e..0x7a8a  (44 bytes)
; ======================================================================


snake_en_recuadro:		; acarreo si Snake esta en el recuadro de HL + 4 ([Y][alto][X][ancho])
	inc hl			;7a5e
	inc hl			;7a5f
	inc hl			;7a60
	inc hl			;7a61
snake_en_recuadro_hl:		; acarreo si Snake esta en el recuadro de HL ([Y][alto][X][ancho])
	ld a,(0c184h)		;7a62   ; lee la X de Snake
	ld d,a			;7a65
	ld a,(0c182h)		;7a66   ; lee la Y de Snake
L_7A69:
	sub (hl)			;7a69
	inc hl			;7a6a
	cp (hl)			;7a6b
	inc hl			;7a6c
	inc hl			;7a6d
	jr nc,L_7A77		;7a6e
	dec hl			;7a70
	ld a,d			;7a71
	sub (hl)			;7a72
	inc hl			;7a73
	cp (hl)			;7a74
	jr c,L_7A79		;7a75
L_7A77:
	and a			;7a77
	ret			;7a78
L_7A79:
	scf			;7a79
	ret			;7a7a
proyectil_en_recuadro:		; acarreo si el proyectil (0xC204, 0xC206) esta en el recuadro de HL
	ld a,(0c206h)		;7a7b
	ld d,a			;7a7e
	ld a,(0c204h)		;7a7f
	jr L_7A69		;7a82
abre_puerta:		; la puerta 0xC4FE se abre paso a paso (0xC4FD, tabla 0x7A8A)
	ld a,(0c4fdh)		;7a84
	call 041eah		;7a87   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_7A8A: 20 destinos del despachador p00:41EA (call en p01:7A87, el
;   indice en A): 7AB2, 7AE9, 7B06, 7B20, 7B48, 7B74, 7BA4, 7BA5, 7BAA, 7BAF,
;   7BB4, 7BB9, 7BA4, 7BBE, 7BAF, 7BC3, 7BC8, 7BC3, 7BB9, 7BCD; lo leen
;   p01:7A87 (40 bytes)
;   0x7a8a..0x7ab2  (40 bytes)
DATA_tabla_7A8A:
	defw 07ab2h,07ae9h,07b06h,07b20h,07b48h,07b74h,07ba4h,07ba5h	; 7a8a
	defw 07baah,07bafh,07bb4h,07bb9h,07ba4h,07bbeh,07bafh,07bc3h	; 7a9a
	defw 07bc8h,07bc3h,07bb9h,07bcdh	; 7aaa  -> L_7BC8 L_7BC3 L_7BB9 L_7BCD

; ======================================================================
; CODIGO 0x7ab2..0x7ae3  (49 bytes)
; ======================================================================


abre_puerta_0:		; paso 0: el sonido de la puerta (0x19 o 0x1B; 0x1E los tipos 7+) y el paso por su tipo
	call 04925h		;7ab2   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0b8bch		;7ab5   ; cambia_tabla_de_sprites: alterna las tablas de atributos (0xF600/0xF400 y 0xF200/0xF000) con R#5
	call 04248h		;7ab8   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call ficha_de_c4fe		;7abb   ; ficha_de_c4fe: HL = la ficha de la puerta 0xC4FE en 0xC3D0
	inc hl			;7abe
	inc hl			;7abf
	inc hl			;7ac0
	ld a,(hl)			;7ac1
	ld c,a			;7ac2
	dec a			;7ac3
	ld de,07c56h		;7ac4
	call 041e5h		;7ac7   ; de_mas_a: DE = DE + A
	inc hl			;7aca
	ld a,(de)			;7acb
	ld (hl),a			;7acc
	ld a,c			;7acd
	ld (0c4fdh),a		;7ace
	ld hl,07ae3h		;7ad1
	dec a			;7ad4
	cp 006h		;7ad5
	ld c,01eh		;7ad7
	jr nc,L_7ADF		;7ad9
	call 041e0h		;7adb   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;7ade
L_7ADF:
	ld a,c			;7adf
	jp 04284h		;7ae0   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5

; ----------------------------------------------------------------------
; DATOS tabla_7ae3: 6 bytes (0x19 x 4 y 0x1B x 2) que p01:7AD1 lee con 0xC4FD
;   - 1 cuando es menor que 6 (si no, C = 0x1E)
;   0x7ae3..0x7ae9  (6 bytes)
DATA_tabla_7ae3:
	defb 019h,019h,019h,019h,01bh,01bh	; 7ae3

; ======================================================================
; CODIGO 0x7ae9..0x7c56  (365 bytes)
; ======================================================================


abre_puerta_1:		; tipo 1: borra una linea de 0x20 cada cuadro hasta 0x18
	call ficha_de_c4fe		;7ae9   ; ficha_de_c4fe: HL = la ficha de la puerta 0xC4FE en 0xC3D0
	inc hl			;7aec
	inc hl			;7aed
	inc hl			;7aee
	inc hl			;7aef
	inc (hl)			;7af0
	ld a,(hl)			;7af1
	cp 018h		;7af2
	jp z,puerta_abierta		;7af4   ; puerta_abierta: la puerta queda abierta: 0xC450 a cero, el marco y el modo 0
	ld c,(hl)			;7af7
	inc hl			;7af8
	ld e,(hl)			;7af9
	inc hl			;7afa
	ld a,(hl)			;7afb
	add a,c			;7afc
	ld d,a			;7afd
	ex de,hl			;7afe
	ld b,020h		;7aff
	ld c,000h		;7b01
	jp 04f2fh		;7b03   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
abre_puerta_2:		; tipo 2: borra una linea de 8 cada cuadro
	call ficha_de_c4fe		;7b06   ; ficha_de_c4fe: HL = la ficha de la puerta 0xC4FE en 0xC3D0
	inc hl			;7b09
	inc hl			;7b0a
	inc hl			;7b0b
	inc hl			;7b0c
	dec (hl)			;7b0d
	jp z,puerta_abierta		;7b0e   ; puerta_abierta: la puerta queda abierta: 0xC450 a cero, el marco y el modo 0
	ld a,(hl)			;7b11
	dec a			;7b12
	inc hl			;7b13
	ld e,(hl)			;7b14
	inc hl			;7b15
	add a,(hl)			;7b16
	ld d,a			;7b17
	ex de,hl			;7b18
	ld b,008h		;7b19
	ld c,000h		;7b1b
	jp 04f2fh		;7b1d   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
abre_puerta_3:		; tipo 3: borra 8 puntos en diagonal cada cuadro
	call ficha_de_c4fe		;7b20   ; ficha_de_c4fe: HL = la ficha de la puerta 0xC4FE en 0xC3D0
	inc hl			;7b23
	inc hl			;7b24
	inc hl			;7b25
	inc hl			;7b26
	dec (hl)			;7b27
	jp z,puerta_abierta		;7b28   ; puerta_abierta: la puerta queda abierta: 0xC450 a cero, el marco y el modo 0
	ld a,(hl)			;7b2b
	inc hl			;7b2c
	ld e,(hl)			;7b2d
	inc hl			;7b2e
	ld d,(hl)			;7b2f
	add a,e			;7b30
	ld e,a			;7b31
	ex de,hl			;7b32
	ld b,008h		;7b33
L_7B35:
	push bc			;7b35
	push hl			;7b36
	ld b,001h		;7b37
	ld c,000h		;7b39
	call 04f2fh		;7b3b   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
	pop hl			;7b3e
	inc l			;7b3f
	inc l			;7b40
	inc l			;7b41
	inc l			;7b42
	inc h			;7b43
	pop bc			;7b44
	djnz L_7B35		;7b45
	ret			;7b47
abre_puerta_4:		; tipo 4: borra 8 puntos en la otra diagonal cada cuadro hasta 0x23
	call ficha_de_c4fe		;7b48   ; ficha_de_c4fe: HL = la ficha de la puerta 0xC4FE en 0xC3D0
	inc hl			;7b4b
	inc hl			;7b4c
	inc hl			;7b4d
	inc hl			;7b4e
	inc (hl)			;7b4f
	ld a,(hl)			;7b50
	cp 023h		;7b51
	jp z,puerta_abierta		;7b53   ; puerta_abierta: la puerta queda abierta: 0xC450 a cero, el marco y el modo 0
	inc hl			;7b56
	ld e,(hl)			;7b57
	inc hl			;7b58
	ld d,(hl)			;7b59
	add a,e			;7b5a
	add a,01ch		;7b5b
	ld e,a			;7b5d
	ex de,hl			;7b5e
	ld b,008h		;7b5f
L_7B61:
	push bc			;7b61
	push hl			;7b62
	ld b,001h		;7b63
	ld c,000h		;7b65
	call 04f2fh		;7b67   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
	pop hl			;7b6a
	dec l			;7b6b
	dec l			;7b6c
	dec l			;7b6d
	dec l			;7b6e
	inc h			;7b6f
	pop bc			;7b70
	djnz L_7B61		;7b71
	ret			;7b73
abre_puerta_5:		; tipo 5: borra dos lineas de 0x20 cada cuadro
	call ficha_de_c4fe		;7b74   ; ficha_de_c4fe: HL = la ficha de la puerta 0xC4FE en 0xC3D0
	inc hl			;7b77
	inc hl			;7b78
	inc hl			;7b79
	inc hl			;7b7a
	dec (hl)			;7b7b
	jp z,puerta_abierta		;7b7c   ; puerta_abierta: la puerta queda abierta: 0xC450 a cero, el marco y el modo 0
	ld a,(hl)			;7b7f
	inc hl			;7b80
	ld e,(hl)			;7b81
	inc hl			;7b82
	dec a			;7b83
	add a,(hl)			;7b84
	ld d,a			;7b85
	ex de,hl			;7b86
	ld b,020h		;7b87
	ld c,000h		;7b89
	call 04f2fh		;7b8b   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
	ex de,hl			;7b8e
	ld a,00ch		;7b8f
	dec hl			;7b91
	dec hl			;7b92
	sub (hl)			;7b93
	ld c,a			;7b94
	inc hl			;7b95
	inc hl			;7b96
	ld a,00ch		;7b97
	add a,(hl)			;7b99
	add a,c			;7b9a
	ld d,a			;7b9b
	ex de,hl			;7b9c
	ld b,020h		;7b9d
	ld c,000h		;7b9f
	jp 04f2fh		;7ba1   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
L_7BA4:
	ret			;7ba4
L_7BA5:
	ld bc,00406h		;7ba5
	jr abre_dibujo		;7ba8
L_7BAA:
	ld bc,00401h		;7baa
	jr abre_dibujo		;7bad
L_7BAF:
	ld bc,0030dh		;7baf
	jr abre_dibujo		;7bb2
L_7BB4:
	ld bc,0050dh		;7bb4
	jr abre_dibujo		;7bb7
L_7BB9:
	ld bc,0050ch		;7bb9
	jr abre_dibujo		;7bbc
L_7BBE:
	ld bc,00401h		;7bbe
	jr abre_dibujo		;7bc1
L_7BC3:
	ld bc,0020ch		;7bc3
	jr abre_dibujo		;7bc6
L_7BC8:
	ld bc,0080ah		;7bc8
	jr abre_dibujo		;7bcb
L_7BCD:
	ld bc,00605h		;7bcd
abre_dibujo:		; tipos 7+: pone el dibujo abierto de 0xE600 (B x C fichas)
	call ficha_de_c4fe		;7bd0   ; ficha_de_c4fe: HL = la ficha de la puerta 0xC4FE en 0xC3D0
	inc hl			;7bd3
	inc hl			;7bd4
	inc hl			;7bd5
	inc hl			;7bd6
	inc hl			;7bd7
	push hl			;7bd8
	ld e,(hl)			;7bd9
	inc hl			;7bda
	ld d,(hl)			;7bdb
	ld hl,0e600h		;7bdc   ; apunta a el dibujo copiado del banco 15
	call 044b6h		;7bdf
	pop hl			;7be2
	dec hl			;7be3
puerta_abierta:		; la puerta queda abierta: 0xC450 a cero, el marco y el modo 0
	ld (hl),000h		;7be4
	dec hl			;7be6
	ld c,(hl)			;7be7
	dec hl			;7be8
	ld a,(hl)			;7be9
	dec hl			;7bea
	ld (hl),000h		;7beb
	dec hl			;7bed
	and 0c0h		;7bee
	jr nz,L_7C0D		;7bf0
	ld a,(hl)			;7bf2
	dec a			;7bf3
	ld de,0c450h		;7bf4   ; apunta a el estado de las 160 puertas
	call 041e5h		;7bf7   ; de_mas_a: DE = DE + A
	xor a			;7bfa
	ld (de),a			;7bfb
	ld a,c			;7bfc
	cp 007h		;7bfd
	jr c,L_7C0D		;7bff
	jr z,L_7C0B		;7c01
	cp 00ah		;7c03
	jr z,L_7C0B		;7c05
	cp 00bh		;7c07
	jr nz,L_7C0D		;7c09
L_7C0B:
	ld (hl),000h		;7c0b
L_7C0D:
	inc hl			;7c0d
	inc hl			;7c0e
	inc hl			;7c0f
	inc hl			;7c10
	inc hl			;7c11
	ld e,(hl)			;7c12
	inc hl			;7c13
	ld d,(hl)			;7c14
	ld a,c			;7c15
	cp 003h		;7c16
	jr nz,L_7C1E		;7c18
	ld a,d			;7c1a
	sub 008h		;7c1b
	ld d,a			;7c1d
L_7C1E:
	xor a			;7c1e
	ld (0c151h),a		;7c1f   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ld a,c			;7c22
	cp 007h		;7c23
	ret nc			;7c25
	dec a			;7c26
	ld bc,00404h		;7c27
	jr z,L_7C44		;7c2a
	dec a			;7c2c
	ld bc,00401h		;7c2d
	jr z,L_7C44		;7c30
	dec a			;7c32
	ld bc,00204h		;7c33
	jr z,L_7C40		;7c36
	dec a			;7c38
	jr z,L_7C40		;7c39
	ld bc,00404h		;7c3b
	jr L_7C44		;7c3e
L_7C40:
	ld a,020h		;7c40
	add a,e			;7c42
	ld e,a			;7c43
L_7C44:
	ld hl,0a710h		;7c44
	jp 044b6h		;7c47
ficha_de_c4fe:		; HL = la ficha de la puerta 0xC4FE en 0xC3D0
	ld a,(0c4feh)		;7c4a
	ld hl,0c3d0h		;7c4d   ; apunta a las puertas de la sala
	add a,a			;7c50
	add a,a			;7c51
	add a,a			;7c52
	jp 041dfh		;7c53   ; hl_mas_2a: HL = HL + 2 x A

; ----------------------------------------------------------------------
; DATOS parejas_7c56: 3 parejas ([0xFF][0x21], [0x24][0xFF], [0x0D][0x21]) que
;   p01:7AC4 lee en 0x7C56 + 2 x (0xC4FD - 1)
;   0x7c56..0x7c5c  (6 bytes)
DATA_parejas_7c56:
	defb 0ffh,021h	; 7c56
	defb 024h,0ffh	; 7c58
	defb 00dh,021h	; 7c5a

; ======================================================================
; CODIGO 0x7c5c..0x7ca2  (70 bytes)
; ======================================================================


pantalla_al_empezar:		; PSG, SCREEN 5, las dos paginas a cero, R#1/5/6/11 (0x7CA2) y los sprites
	ld a,0bfh		;7c5c
	ld (0c0f0h),a		;7c5e
	ld e,a			;7c61
	ld a,007h		;7c62
	call 00093h		;7c64   ; BIOS WRTPSG - Writes data to PSG-register
	call 04e50h		;7c67   ; sprites_apagados: pone el bit SPD de R#8
	ld a,005h		;7c6a
	call 0005fh		;7c6c   ; BIOS CHGMOD - Switches to given screen mode
	call 04e0eh		;7c6f   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04e1bh		;7c72   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
	ld d,001h		;7c75
	call 04e1dh		;7c77   ; borra_la_pagina_d: llena la pagina de D de color 0 y pone R#23 a cero
	call 04ed2h		;7c7a   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	ld b,004h		;7c7d
	ld hl,07ca2h		;7c7f
L_7C82:
	push bc			;7c82
	ld c,(hl)			;7c83
	inc hl			;7c84
	ld b,(hl)			;7c85
	inc hl			;7c86
	push hl			;7c87
	call 00047h		;7c88   ; BIOS WRTVDP - Writes data in the VDP-register
	pop hl			;7c8b
	pop bc			;7c8c
	djnz L_7C82		;7c8d
	ld hl,0f87fh		;7c8f
	ld de,0f880h		;7c92
	ld bc,000a0h		;7c95
	ld (hl),000h		;7c98
	ldir		;7c9a
	call 04e2ch		;7c9c   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	jp 04e01h		;7c9f   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)

; ----------------------------------------------------------------------
; DATOS registros_del_vdp: 4 parejas [registro][valor] que p01:7C83 escribe en
;   el VDP al arrancar: R1 = 0x62, R5 = 0xEF, R6 = 0x1F y R11 = 1
;   0x7ca2..0x7caa  (8 bytes)
DATA_registros_del_vdp:
	defb 001h,062h	; 7ca2
	defb 005h,0efh	; 7ca4
	defb 006h,01fh	; 7ca6
	defb 00bh,001h	; 7ca8

; ======================================================================
; CODIGO 0x7caa..0x7d85  (219 bytes)
; ======================================================================


lee_teclas:		; si se juega, las teclas de funcion en 0xC113/0xC112 y las del juego en 0xC007/0xC006
	ld a,(0c002h)		;7caa   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;7cad
	ret z			;7caf
	call teclas_de_funcion		;7cb0   ; teclas_de_funcion: A = F1 (1), F2 (2), F3 (4), F4 (8), F5 (0x10) y RETURN (0x20)
	ld hl,0c113h		;7cb3   ; apunta a las teclas de funcion que hay
	call guarda_teclas		;7cb6   ; guarda_teclas: (HL) = A y (HL - 1) = las que no estaban
	call teclas		;7cb9   ; teclas: A = palanca y cursores: 1 arriba, 2 abajo, 4 izquierda, 8 derecha, 0x10 espacio/boton 1, 0x20 M, N o boton 2
teclas_del_juego:		; 0xC007 = las teclas que hay, 0xC006 = las nuevas
	ld hl,0c007h		;7cbc   ; apunta a las teclas que hay
guarda_teclas:		; (HL) = A y (HL - 1) = las que no estaban
	ld c,(hl)			;7cbf
	ld (hl),a			;7cc0
	xor c			;7cc1
	and (hl)			;7cc2
	dec hl			;7cc3
	ld (hl),a			;7cc4
	ret			;7cc5
teclas:		; A = palanca y cursores: 1 arriba, 2 abajo, 4 izquierda, 8 derecha, 0x10 espacio/boton 1, 0x20 M, N o boton 2
	ld e,08fh		;7cc6
	ld a,00fh		;7cc8
	call 00093h		;7cca   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;7ccd
	di			;7ccf
	call 00096h		;7cd0   ; BIOS RDPSG - Reads value from PSG-register
	ei			;7cd3
	cpl			;7cd4
	and 03fh		;7cd5
	push af			;7cd7
	ld a,004h		;7cd8
	call 00141h		;7cda   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	rra			;7cdd
	rra			;7cde
	rra			;7cdf
	ld e,020h		;7ce0
	jr nc,L_7CE9		;7ce2
	rra			;7ce4
	jr nc,L_7CE9		;7ce5
	ld e,000h		;7ce7
L_7CE9:
	ld a,008h		;7ce9
	call 00141h		;7ceb   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;7cee
	rrca			;7cef
	rrca			;7cf0
	ld b,a			;7cf1
	and 004h		;7cf2
	or e			;7cf4
	ld c,a			;7cf5
	ld a,b			;7cf6
	rrca			;7cf7
	rrca			;7cf8
	ld b,a			;7cf9
	and 018h		;7cfa
	or c			;7cfc
	ld c,a			;7cfd
	ld a,b			;7cfe
	rrca			;7cff
	and 003h		;7d00
	or c			;7d02
	pop bc			;7d03
	or b			;7d04
	ret			;7d05
teclas_de_funcion:		; A = F1 (1), F2 (2), F3 (4), F4 (8), F5 (0x10) y RETURN (0x20)
	ld a,006h		;7d06
	call 00141h		;7d08   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;7d0b
	rlca			;7d0c
	rlca			;7d0d
	rlca			;7d0e
	and 007h		;7d0f
	ld e,a			;7d11
	ld a,007h		;7d12
	call 00141h		;7d14   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;7d17
	ld c,a			;7d18
	rlca			;7d19
	rlca			;7d1a
	rlca			;7d1b
	and 018h		;7d1c
	or e			;7d1e
	ld e,a			;7d1f
	ld a,c			;7d20
	rra			;7d21
	rra			;7d22
	and 020h		;7d23
	or e			;7d25
	ret			;7d26
pon_c602_con_cuenta:		; 0xC605 = A y pon_c602
	ld (0c605h),a		;7d27   ; guarda la cuenta de los refuerzos
pon_c602:		; 0xC602 = 1, 0xC604 = la sala, 0xC606 y la musica 0x32 (0x2F si la pone un actor del tipo 6 o 0x23)
	ld a,001h		;7d2a
	ld (0c602h),a		;7d2c   ; guarda la bandera 0xC602 (refuerzos y musica)
	ld (0c632h),a		;7d2f
	ld a,(0c130h)		;7d32   ; lee la sala
	ld (0c604h),a		;7d35
	cp 0d8h		;7d38
	ld a,000h		;7d3a
	jr z,L_7D4D		;7d3c
	ld hl,0c5b4h		;7d3e
	ld b,008h		;7d41
L_7D43:
	bit 0,(hl)		;7d43
	jr nz,L_7D4A		;7d45
	dec hl			;7d47
	djnz L_7D43		;7d48
L_7D4A:
	ld a,b			;7d4a
	add a,003h		;7d4b
L_7D4D:
	ld (0c606h),a		;7d4d
	ld a,(0c13ch)		;7d50   ; lee la cuenta atras en marcha
	or a			;7d53
	ret nz			;7d54
	ld a,(0c012h)		;7d55
	cp 044h		;7d58
	ret z			;7d5a
	ld a,(ix+000h)		;7d5b
	cp 006h		;7d5e
	jr z,L_7D6A		;7d60
	cp 023h		;7d62
	jr z,L_7D6A		;7d64
	ld c,032h		;7d66
	jr L_7D6C		;7d68
L_7D6A:
	ld c,02fh		;7d6a
L_7D6C:
	ld a,(0c002h)		;7d6c   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;7d6f
	jr nz,L_7D78		;7d71
	ld a,(0f0f7h)		;7d73
	and a			;7d76
	ret nz			;7d77
L_7D78:
	ld a,c			;7d78
	ld (0c159h),a		;7d79   ; guarda la musica que suena
	jp 04284h		;7d7c   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
secuencia_c900:		; la secuencia de 6 pasos de 0xC900 (tabla 0x7D85)
	ld a,(0c900h)		;7d7f   ; lee el paso de la secuencia 0xC900
	call 041eah		;7d82   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_7D85: 6 destinos del despachador p00:41EA (call en p01:7D82, el
;   indice en A): 7D91, 7DAE, 7DA0, 7DAF, 7DB9, 7DC5; lo leen p01:7D82 (12
;   bytes)
;   0x7d85..0x7d91  (12 bytes)
DATA_tabla_7D85:
	defw 07d91h,07daeh,07da0h,07dafh,07db9h,07dc5h	; 7d85

; ======================================================================
; CODIGO 0x7d91..0x7e14  (131 bytes)
; ======================================================================


c900_paso_0:		; crea un actor del tipo 0x2D en la Y de Snake, X = 0xF0
	ld hl,0c900h		;7d91   ; apunta a el paso de la secuencia 0xC900
	inc (hl)			;7d94
	ld c,02dh		;7d95
	ld a,(0c182h)		;7d97   ; lee la Y de Snake
	ld e,a			;7d9a
	ld d,0f0h		;7d9b
	jp 0569ah		;7d9d   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
c900_paso_2:		; espera de 0x3C cuadros y la musica 0x5C
	ld hl,0c900h		;7da0   ; apunta a el paso de la secuencia 0xC900
	inc (hl)			;7da3
	ld hl,0c901h		;7da4
	ld (hl),03ch		;7da7
	ld a,05ch		;7da9
	ld (0c0f4h),a		;7dab
L_7DAE:
	ret			;7dae
c900_paso_3:		; al acabar la espera, guarda la paleta
	ld hl,0c901h		;7daf
	dec (hl)			;7db2
	ret nz			;7db3
	dec hl			;7db4
	inc (hl)			;7db5
	jp guarda_paleta		;7db6   ; guarda_paleta: lee la paleta de 0xF680 (VRAM) a 0xC1CF en formato [color][RB][G]
c900_paso_4:		; funde la paleta hasta negro
	call funde_paleta		;7db9   ; funde_paleta: apaga un poco la paleta de 0xC1CF y la manda; acarreo cuando todo es 0
	ret nc			;7dbc
	ld hl,0c900h		;7dbd   ; apunta a el paso de la secuencia 0xC900
	inc (hl)			;7dc0
	inc hl			;7dc1
	ld (hl),010h		;7dc2
	ret			;7dc4
c900_paso_5:		; 0xC13B = 1, sin arma ni objeto, sala 0xA5, parada 8, Snake en (0x50, 0x80)
	ld hl,0c901h		;7dc5
	dec (hl)			;7dc8
	ret nz			;7dc9
	ld hl,0c13bh		;7dca   ; apunta a la bandera de capturado (sin armas ni objetos)
	ld (hl),001h		;7dcd
	xor a			;7dcf
	ld (0c134h),a		;7dd0   ; guarda el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	ld (0c135h),a		;7dd3   ; guarda el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	ld (0c602h),a		;7dd6   ; guarda la bandera 0xC602 (refuerzos y musica)
	ld (0c605h),a		;7dd9   ; guarda la cuenta de los refuerzos
	ld hl,0c130h		;7ddc   ; apunta a la sala
	ld (hl),0a5h		;7ddf
	ld hl,0c136h		;7de1   ; apunta a la parada del ascensor
	ld (hl),008h		;7de4
	ld hl,0c182h		;7de6   ; apunta a la Y de Snake
	ld (hl),050h		;7de9
	ld hl,0c184h		;7deb   ; apunta a la X de Snake
	ld (hl),080h		;7dee
	call 04e42h		;7df0   ; esconde_los_sprites_ram: llena de 0xE0 la copia de los atributos (0xEA00-0xEA7F)
	call 04e0eh		;7df3   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04a9dh		;7df6   ; paleta_de_snake: manda al VDP los colores 7 y 10 (0x4AA3)
	ld hl,0c151h		;7df9   ; apunta a el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ld (hl),000h		;7dfc
	jp musica_de_nuevo		;7dfe   ; musica_de_nuevo: 0xC159 = 0 y elige la musica de la sala
crea_tipo_45:		; la creacion del tipo 45
	ld (ix+00bh),00ah		;7e01
	ld (ix+00eh),000h		;7e05
	ld (ix+012h),002h		;7e09
	ret			;7e0d
cuadro_tipo_45:		; lo de cada cuadro del tipo 45
	ld a,(ix+001h)		;7e0e
	call 041eah		;7e11   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_7E14: 7 destinos del despachador p00:41EA (call en p01:7E11, el
;   indice en A): 7E22, 7E2A, 7E60, 7E7D, 7E99, 7EA9, 7EB4; lo leen p01:7E11
;   (14 bytes)
;   0x7e14..0x7e22  (14 bytes)
DATA_tabla_7E14:
	defw 07e22h,07e2ah,07e60h,07e7dh,07e99h,07ea9h,07eb4h	; 7e14

; ======================================================================
; CODIGO 0x7e22..0x8000  (478 bytes)
; ======================================================================


L_7E22:
	dec (ix+012h)		;7e22
	ret nz			;7e25
	inc (ix+001h)		;7e26
	ret			;7e29
L_7E2A:
	ld (ix+001h),006h		;7e2a
	ld a,006h		;7e2e
	call 05cd9h		;7e30   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
	ld c,02dh		;7e33
	ld a,(0c182h)		;7e35   ; lee la Y de Snake
	cp 098h		;7e38
	ld e,0b0h		;7e3a
	jr c,L_7E40		;7e3c
	ld e,088h		;7e3e
L_7E40:
	ld d,0f0h		;7e40
	call 0569ah		;7e42   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	push ix		;7e45
	push hl			;7e47
	pop ix		;7e48
	ld (ix+001h),002h		;7e4a
	ld (ix+006h),001h		;7e4e
	ld (ix+011h),003h		;7e52
	ld (ix+00bh),00ah		;7e56
	call 0a908h		;7e5a   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
	pop ix		;7e5d
	ret			;7e5f
L_7E60:
	call 0a920h		;7e60   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld a,(ix+005h)		;7e63
	cp 0b8h		;7e66
	ret nz			;7e68
	inc (ix+001h)		;7e69
	ld a,(ix+003h)		;7e6c
	cp 088h		;7e6f
	ld a,002h		;7e71
	jp z,L_7E77		;7e73
	dec a			;7e76
L_7E77:
	ld (ix+011h),a		;7e77
	jp 0a908h		;7e7a   ; velocidad_a916_dir: las velocidades de la direccion (ix+0x11) de la tabla 0xA916
L_7E7D:
	call 0a920h		;7e7d   ; cuadro_por_direccion: cuadro = 2 x ((ix+0x11) - 1), +1 con el bit 2 de (ix+0x0C)
	ld a,(0c182h)		;7e80   ; lee la Y de Snake
	and 0feh		;7e83
	cp (ix+003h)		;7e85
	ret nz			;7e88
	inc (ix+001h)		;7e89
	ld (ix+006h),000h		;7e8c
	ld (ix+00bh),00bh		;7e90
	ld (ix+012h),002h		;7e94
	ret			;7e98
L_7E99:
	dec (ix+012h)		;7e99
	ret nz			;7e9c
	inc (ix+001h)		;7e9d
	ld (ix+012h),01eh		;7ea0
	ld a,007h		;7ea4
	jp 05cd9h		;7ea6   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
L_7EA9:
	dec (ix+012h)		;7ea9
	ret nz			;7eac
	inc (ix+001h)		;7ead
	ld hl,0c900h		;7eb0   ; apunta a el paso de la secuencia 0xC900
	inc (hl)			;7eb3
L_7EB4:
	ret			;7eb4
L_7EB5:
	ld a,(0c112h)		;7eb5   ; lee las teclas de funcion nuevas (F1 1, F2 2, F3 4, F4 8, F5 0x10)
	and 004h		;7eb8
	jp nz,L_7FD3		;7eba
	ld a,(0c153h)		;7ebd   ; lee el paso del modo
	dec a			;7ec0
	jp z,L_7EF1		;7ec1
	call 04e0eh		;7ec4   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call 04e2ch		;7ec7   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	call 04e1bh		;7eca   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
	call 04a92h		;7ecd   ; paleta_del_juego: manda al VDP la paleta p05:8B0B
	ld hl,0c153h		;7ed0   ; apunta a el paso del modo
	inc (hl)			;7ed3
	call 09234h		;7ed4   ; aprieta_objetos: quita los huecos de la lista de objetos 0xC530
	call 047a6h		;7ed7   ; ventana_de_equipo: pinta la ventana de los objetos que se llevan (0xC530): dibujo y nombre
	ld hl,0c135h		;7eda   ; apunta a el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	ld b,019h		;7edd
	ld de,0c530h		;7edf   ; apunta a los objetos que se llevan (fichas de 4)
	call busca_hueco_c		;7ee2   ; busca_hueco_c: C = el hueco de la lista DE (de 4 en 4) donde esta (HL)
	call 043cfh		;7ee5
	call pon_marca		;7ee8   ; pon_marca: el caracter 0x3C en 0xC155
	call 08fc1h		;7eeb   ; marcador: LIFE, CLASS, la llamada, el arma y el objeto
	jp 04e01h		;7eee   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)
L_7EF1:
	ld a,(0c006h)		;7ef1   ; lee las teclas nuevas (1 arriba, 2 abajo, 4 izq., 8 der., 0x10, 0x20)
	bit 4,a		;7ef4
	jp nz,L_7F76		;7ef6
	and 00fh		;7ef9
	jr nz,L_7F08		;7efb
	ld a,(0c007h)		;7efd   ; lee las teclas que hay
	and 00fh		;7f00
	ret z			;7f02
	ld hl,0c15ch		;7f03
	dec (hl)			;7f06
	ret nz			;7f07
L_7F08:
	ld hl,0c15ch		;7f08
	ld (hl),008h		;7f0b
	rra			;7f0d
	jr c,L_7F21		;7f0e
	rra			;7f10
	jr c,L_7F31		;7f11
	rra			;7f13
	jr c,L_7F41		;7f14
	ld a,(0c154h)		;7f16   ; lee el hueco elegido en la ventana de armas
	cp 011h		;7f19
	ret nc			;7f1b
	add a,009h		;7f1c
	ld c,a			;7f1e
	jr L_7F4A		;7f1f
L_7F21:
	ld a,(0c154h)		;7f21   ; lee el hueco elegido en la ventana de armas
	cp 001h		;7f24
	ret z			;7f26
	cp 00ah		;7f27
	ret z			;7f29
	cp 013h		;7f2a
	ret z			;7f2c
	dec a			;7f2d
	ld c,a			;7f2e
	jr L_7F4A		;7f2f
L_7F31:
	ld a,(0c154h)		;7f31   ; lee el hueco elegido en la ventana de armas
	cp 009h		;7f34
	ret z			;7f36
	cp 012h		;7f37
	ret z			;7f39
	cp 019h		;7f3a
	ret z			;7f3c
	inc a			;7f3d
	ld c,a			;7f3e
	jr L_7F4A		;7f3f
L_7F41:
	ld a,(0c154h)		;7f41   ; lee el hueco elegido en la ventana de armas
	cp 00ah		;7f44
	ret c			;7f46
	sub 009h		;7f47
	ld c,a			;7f49
L_7F4A:
	ld a,020h		;7f4a
	call 0427ch		;7f4c   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	call borra_marca		;7f4f   ; borra_marca: el caracter 0 en 0xC155
	ld a,c			;7f52
	ld (0c154h),a		;7f53   ; guarda el hueco elegido en la ventana de armas
	call 043cfh		;7f56
	call pon_marca		;7f59   ; pon_marca: el caracter 0x3C en 0xC155
	ld a,(0c13bh)		;7f5c   ; lee la bandera de capturado (sin armas ni objetos)
	and a			;7f5f
	jr z,L_7F65		;7f60
	xor a			;7f62
	jr L_7F70		;7f63
L_7F65:
	ld a,(0c154h)		;7f65   ; lee el hueco elegido en la ventana de armas
	call 042bdh		;7f68   ; cuatro_a_menos_4: HL = 4 x (A - 1)
	ld de,0c530h		;7f6b   ; apunta a los objetos que se llevan (fichas de 4)
	add hl,de			;7f6e
	ld a,(hl)			;7f6f
L_7F70:
	ld (0c135h),a		;7f70   ; guarda el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	jp 04843h		;7f73   ; marcador_objeto: pinta en el marcador el objeto elegido (0xC135)
L_7F76:
	ld a,(0c135h)		;7f76   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	and a			;7f79
	ret z			;7f7a
	call 043e1h		;7f7b   ; busca_objeto: busca A en los 25 objetos de 0xC530 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld a,(0c18bh)		;7f7e   ; lee el modo de la pose de Snake
	cp 004h		;7f81
	jr z,L_7F9B		;7f83
	ld a,(hl)			;7f85
	cp 016h		;7f86
	jr nz,L_7F9B		;7f88
	ld c,002h		;7f8a
	inc hl			;7f8c
	call 04613h		;7f8d   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld a,(0c137h)		;7f90   ; lee la vida maxima
	ld (0c131h),a		;7f93   ; guarda la vida (LIFE)
	call 09067h		;7f96   ; barra_de_vida: LIFE y la barra 0xC131 sobre el maximo 0xC137
	jr L_7FCE		;7f99
L_7F9B:
	cp 017h		;7f9b
	jr nz,L_7FAB		;7f9d
	ld c,002h		;7f9f
	inc hl			;7fa1
	call 04613h		;7fa2   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	xor a			;7fa5
	ld (0c5b6h),a		;7fa6
	jr L_7FCE		;7fa9
L_7FAB:
	cp 00dh		;7fab
	jr nz,L_7FB5		;7fad
	xor a			;7faf
	ld (0c139h),a		;7fb0
	jr L_7FCE		;7fb3
L_7FB5:
	cp 006h		;7fb5
	ret nz			;7fb7
	ld a,(0c13ch)		;7fb8   ; lee la cuenta atras en marcha
	and a			;7fbb
	ret z			;7fbc
	ld c,002h		;7fbd
	inc hl			;7fbf
	call 04613h		;7fc0   ; gasta_municion: resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld hl,0c13eh		;7fc3
	ld a,020h		;7fc6
	add a,(hl)			;7fc8
	daa			;7fc9
	ld (hl),a			;7fca
	call 08fd0h		;7fcb   ; marcador_llamada: CALL parpadeando con 0xC15F = 1 (sonido 0x22) o la cuenta atras 0xC13D
L_7FCE:
	ld a,021h		;7fce
	jp 0427ch		;7fd0   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
L_7FD3:
	ld a,(0c158h)		;7fd3   ; lee los 3 bits bajos de p12:A204 de la sala
	and a			;7fd6
	jp nz,cierra_ventana		;7fd7   ; cierra_ventana: vuelve a la sala: monta la sala, paletas, puertas, objetos y jefes, y la enciende
	ld a,(0c135h)		;7fda   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 009h		;7fdd
	jp nz,cierra_ventana		;7fdf   ; cierra_ventana: vuelve a la sala: monta la sala, paletas, puertas, objetos y jefes, y la enciende
	ld a,008h		;7fe2
	ld (0c151h),a		;7fe4   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	xor a			;7fe7
	ld (0c19ah),a		;7fe8
	inc a			;7feb
	ld (0c19bh),a		;7fec
	call 04e0eh		;7fef   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	ld hl,0d000h		;7ff2   ; apunta a los 16 actores (fichas de 0x80)
	ld de,0d800h		;7ff5
	ld bc,00800h		;7ff8
	ldir		;7ffb
	ld a,(0c616h)		;7ffd
