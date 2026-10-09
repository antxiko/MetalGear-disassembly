; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 04 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x6078  (120 bytes)
; ======================================================================


sonido_del_cuadro:		; el controlador de sonido, cada interrupcion: mezclador, modo 0xC0F1, fundido 0xC0F4 y los 4 canales
	ld a,(0c0f2h)		;6000   ; con la musica guardada (0xC0F2) no...
	or a			;6003
	jr nz,L_601F		;6004
	ld a,(0c0fbh)		;6006   ; ...si la ultima pedida fue la 0x53...
	cp 053h		;6009
	jr nz,L_601F		;600b
	ld a,(0c032h)		;600d   ; ...y su canal 2 ya acabo...
	or a			;6010
	jr nz,L_601F		;6011
	xor a			;6013   ; ...se olvida...
	ld (0c0fbh),a		;6014
	ld a,03bh		;6017   ; ...y suena la 0x3B
	ld (0c159h),a		;6019   ; guarda la musica que suena
	call pide_sonido		;601c   ; pide_sonido: el sonido A (indice 0x6892): < 0x29 efecto en 0xC070 si manda mas, si no musica de 3 o 4 canales; 0x4D/0x59 guardan la musica
L_601F:
	ld a,(0c0f0h)		;601f   ; el mezclador al PSG
	call pon_mezclador		;6022   ; pon_mezclador: 0xC0F0 = A y al registro 7 del PSG
	exx			;6025
	ld b,004h		;6026   ; B' = 4 canales, DE' = 0x20 por canal
	ld de,00020h		;6028
	exx			;602b
	xor a			;602c   ; 0xC0F3 a cero
	ld (0c0f3h),a		;602d
	ld a,(0c0f1h)		;6030   ; con 0xC0F1 (volver de la pausa o del transceptor)...
	or a			;6033
	jr z,L_604A		;6034
	ld a,c			;6036
	ld hl,0c090h		;6037   ; ...la musica guardada en 0xC090 vuelve a 0xC010
	ld de,0c010h		;603a
	call copia_canales		;603d   ; copia_canales: copia 0x60 bytes de HL a DE (guarda o devuelve tres canales)
	ld a,000h		;6040   ; 0xC0F2 a cero
	ld (0c0f2h),a		;6042
	ld a,001h		;6045   ; 0xC0F3 = 1: refrescar periodos y volumenes
	ld (0c0f3h),a		;6047
L_604A:
	ld a,(0c0f2h)		;604a   ; sin musica guardada...
	or a			;604d
	jr nz,L_6057		;604e
	ld a,(0c0f4h)		;6050   ; ...y con un sonido esperando (0xC0F4), el fundido
	or a			;6053
	call nz,fundido		;6054   ; fundido: baja el volumen (0xC0F5, 0xC0F6) y, al acabar, pide el sonido de 0xC0F4
L_6057:
	ld c,001h		;6057   ; C = 1: el registro de tono del canal A
	ld ix,0c010h		;6059   ; el primer canal
	exx			;605d
L_605E:
	exx			;605e   ; un canal
	ld a,(ix+002h)		;605f   ; lee el sonido del canal
	or a			;6062   ; suena algo: un cuadro de su lista
	push af			;6063
	call nz,canal		;6064   ; canal: un cuadro del canal IX (C = su registro de tono del PSG)
	pop af			;6067
	jr nz,L_6070		;6068   ; callado...
	ld a,c			;606a   ; ...(salvo el cuarto) se apaga
	cp 007h		;606b
	call nz,fin_de_lista		;606d   ; fin_de_lista: 0xFF: vuelve a la lista guardada (ix+0x18, 0x19) o calla el canal
L_6070:
	inc c			;6070   ; el registro del canal siguiente (de 2 en 2)
	inc c			;6071
	exx			;6072
	add ix,de		;6073   ; la ficha siguiente
	djnz L_605E		;6075
	ret			;6077

; ----------------------------------------------------------------------
; DATOS codigo_sin_entrada_6078: 7 bytes de codigo al que no llega nadie (`ld
;   h,0 / call 0x6434 / jr 0x6070`): entre el `ret` de 0x6077 y la rutina de
;   0x607F; lo leen nadie (7 bytes)
;   0x6078..0x607f  (7 bytes)
DATA_codigo_sin_entrada_6078:
	defb 026h,000h,0cdh,034h,064h,018h,0f1h	; 6078

; ======================================================================
; CODIGO 0x607f..0x63fd  (894 bytes)
; ======================================================================


canal:		; un cuadro del canal IX (C = su registro de tono del PSG)
	ld a,(ix+002h)		;607f   ; lee el sonido del canal
	cp 050h		;6082   ; el sonido 0x50 (la senal del transceptor)...
	jr nz,L_60A1		;6084
	ld a,(0c138h)		;6086   ; lee la frecuencia del transceptor (BCD)
	and 0f0h		;6089   ; ...suena mas grave cuanto mas baja la frecuencia:
	srl a		;608b
	srl a		;608d
	srl a		;608f
	srl a		;6091
	inc a			;6093   ; las decenas + 1...
	ld b,a			;6094
	ld a,(0c138h)		;6095   ; lee la frecuencia del transceptor (BCD)
	add a,006h		;6098   ; ...restan 6 a las unidades...
L_609A:
	sub 006h		;609a
	djnz L_609A		;609c
	ld (0c0f9h),a		;609e   ; ...en 0xC0F9
L_60A1:
	ld a,(ix+00eh)		;60a1   ; lee el formato de la lista (0xFE 0 lo cambia)
	or a			;60a4
	jp nz,L_617A		;60a5   ; en el formato 1, a L_617A
	ld (ix+010h),a		;60a8   ; guarda el instrumento
	dec (ix+000h)		;60ab   ; baja la cuenta de la nota
	jp nz,refresca_canal		;60ae   ; refresca_canal: con 0xC0F3 vuelve a mandar el periodo y el volumen
L_60B1:
	ld l,(ix+003h)		;60b1   ; lee por donde va la lista
	ld h,(ix+004h)		;60b4   ; lee por donde va la lista (alta)
	ld a,(hl)			;60b7
	cp 0feh		;60b8   ; 0xFE: una orden; 0xFF: el fin
	jp z,orden_fe		;60ba   ; orden_fe: 0xFE n: repite n veces; 0xFE 0: cambia de modo; 0xFE 0xFF: llama a otra lista
	jp nc,fin_de_lista		;60bd   ; fin_de_lista: 0xFF: vuelve a la lista guardada (ix+0x18, 0x19) o calla el canal
L_60C0:
	ld a,(ix+00eh)		;60c0   ; lee el formato de la lista (0xFE 0 lo cambia)
	or a			;60c3
	ld a,(hl)			;60c4
	jp nz,L_6212		;60c5   ; el formato 1 se lee en L_6212
L_60C8:
	and 0f0h		;60c8   ; 0x2x: [tipo][duracion]
	cp 020h		;60ca
	jr nz,L_6105		;60cc
	ld a,(hl)			;60ce
	ld (ix+005h),a		;60cf   ; guarda el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	inc hl			;60d2   ; la duracion
	ld a,(ix+010h)		;60d3   ; lee el instrumento
	or a			;60d6
	ld a,(hl)			;60d7
	jr nz,L_60DD		;60d8
	ld (ix+001h),a		;60da   ; guarda la duracion de la nota
L_60DD:
	ld (ix+014h),a		;60dd   ; guarda la duracion de la nota del instrumento
	inc hl			;60e0
	ld a,(ix+005h)		;60e1   ; lee el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	cp 020h		;60e4   ; 0x20: un silencio
	jr nz,L_60ED		;60e6
	dec hl			;60e8
	xor a			;60e9
	ld b,a			;60ea
	jr L_6135		;60eb
L_60ED:
	bit 3,a		;60ed   ; con el bit 3 (envolvente) y no el 2...
	jr z,L_6105		;60ef
	bit 2,a		;60f1
	jr nz,L_6105		;60f3
	ld a,(hl)			;60f5   ; ...el periodo de la envolvente al PSG...
	ld e,a			;60f6
	ld a,00ch		;60f7   ; ...R#12...
	call 00093h		;60f9   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;60fc
	ld a,(hl)			;60fd
	ld e,a			;60fe
	ld a,00bh		;60ff   ; ...y R#11
	call 00093h		;6101   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;6104
L_6105:
	ld a,(hl)			;6105   ; 0x1x: el ruido
	and 0f0h		;6106
	cp 010h		;6108
	jr nz,L_6122		;610a
	ld a,(hl)			;610c   ; el periodo del ruido x 2
	and 00fh		;610d
	add a,a			;610f
	ld e,a			;6110
	ld a,c			;6111   ; en el canal C...
	cp 005h		;6112
	jr nz,L_611C		;6114
	ld a,(0c072h)		;6116   ; ...si suena un efecto, el ruido es suyo
	or a			;6119
	jr nz,L_6121		;611a
L_611C:
	ld a,006h		;611c   ; R#6: el periodo del ruido
	call 00093h		;611e   ; BIOS WRTPSG - Writes data to PSG-register
L_6121:
	inc hl			;6121
L_6122:
	ld a,(hl)			;6122   ; el nibble alto: el volumen; el bajo: el periodo alto
	and 0f0h		;6123
	ld b,a			;6125
	xor (hl)			;6126   ; D = el periodo alto
	ld d,a			;6127
	ld e,000h		;6128
	ld a,(ix+005h)		;612a   ; lee el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	and 003h		;612d   ; en el tipo 1 (solo ruido) no hay periodo bajo
	cp 001h		;612f
	jr z,L_6135		;6131
	inc hl			;6133   ; E = el periodo bajo
	ld e,(hl)			;6134
L_6135:
	ld a,(ix+010h)		;6135   ; lee el instrumento
	or a			;6138
	jp nz,L_633D		;6139   ; con instrumento, L_633D
	call avanza_lista		;613c   ; avanza_lista: (ix+3, ix+4) = HL + 1
L_613F:
	ex de,hl			;613f   ; HL = el periodo
	ld a,(0c012h)		;6140   ; el sonido 0x50 en el canal 1...
	cp 050h		;6143
	jr nz,L_6150		;6145
	push bc			;6147   ; ...baja el periodo (sube el tono) lo de 0xC0F9
	ld a,(0c0f9h)		;6148
	ld b,a			;614b
	ld a,l			;614c
	sub b			;614d
	ld l,a			;614e
	pop bc			;614f
L_6150:
	ld (ix+015h),l		;6150   ; guarda el periodo
	ld (ix+016h),h		;6153   ; guarda el periodo (alto)
	call periodo_al_psg		;6156   ; periodo_al_psg: manda el periodo del canal al PSG (el canal 5/7 cede al efecto de 0xC072)
	ld a,b			;6159   ; el volumen: el nibble alto
	rrca			;615a
	rrca			;615b
	rrca			;615c
	rrca			;615d
	ld (ix+017h),a		;615e   ; guarda el volumen
	ld a,(ix+010h)		;6161   ; lee el instrumento
	or a			;6164   ; sin instrumento...
	jp z,L_6171		;6165
	ld a,(ix+014h)		;6168   ; lee la duracion de la nota del instrumento
	ld (ix+013h),a		;616b   ; guarda la cuenta del instrumento
	jp volumen_al_psg		;616e   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
L_6171:
	ld a,(ix+001h)		;6171   ; lee la duracion de la nota
	ld (ix+000h),a		;6174   ; guarda la cuenta de la nota
	jp volumen_al_psg		;6177   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
L_617A:
	dec (ix+000h)		;617a   ; baja la cuenta de la nota
	jp z,L_60B1		;617d   ; al acabar la nota, la siguiente
	ld a,(0c0f8h)		;6180   ; en pausa (0xC0F8), nada mas
	or a			;6183
	ret nz			;6184
	ld a,(ix+010h)		;6185   ; lee el instrumento
	or a			;6188
	jp nz,L_632B		;6189   ; con instrumento, L_632B
	bit 2,(ix+00fh)		;618c   ; mira el bit 2 de las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
	call nz,vibrato		;6190   ; vibrato: con el bit 2 de (ix+0x0F): sube y baja el periodo segun (ix+0x1C) [cada][cuanto]
	dec (ix+00ah)		;6193   ; baja la cuenta de la bajada de volumen
	ld a,(ix+00ah)		;6196   ; lee la cuenta de la bajada de volumen
	cp (ix+000h)		;6199   ; compara con la cuenta de la nota
	jr nz,L_61A8		;619c
	ld e,a			;619e
	ld a,(ix+00dh)		;619f   ; lee el nibble bajo tras Fx
	cp e			;61a2
	jr nc,L_61AB		;61a3
	jp refresca_canal		;61a5   ; refresca_canal: con 0xC0F3 vuelve a mandar el periodo y el volumen
L_61A8:
	dec (ix+00ah)		;61a8   ; baja la cuenta de la bajada de volumen
L_61AB:
	ld a,(ix+008h)		;61ab   ; lee el volumen que va bajando
	dec a			;61ae   ; el volumen baja 1 (hasta 0)
	jp m,refresca_canal		;61af   ; refresca_canal: con 0xC0F3 vuelve a mandar el periodo y el volumen
	ld (ix+008h),a		;61b2   ; guarda el volumen que va bajando
	ld (ix+017h),a		;61b5   ; guarda el volumen
	jp volumen_al_psg		;61b8   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
vibrato:		; con el bit 2 de (ix+0x0F): sube y baja el periodo segun (ix+0x1C) [cada][cuanto]
	bit 0,(ix+00fh)		;61bb   ; mira el bit 0 de las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
	jr nz,L_61D0		;61bf   ; el vibrato empieza tras 10 cuadros
	ld a,(ix+01ah)		;61c1   ; lee la cuenta del vibrato
	inc a			;61c4
	cp 00ah		;61c5
	jr c,L_620E		;61c7
	inc (ix+00fh)		;61c9   ; sube las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
	xor a			;61cc
	jp L_620E		;61cd
L_61D0:
	ld a,(ix+01ch)		;61d0   ; lee el vibrato ([cada][cuanto])
	and 0f0h		;61d3
	rrca			;61d5
	rrca			;61d6
	rrca			;61d7
	rrca			;61d8
	ld e,a			;61d9
	ld a,(ix+01ah)		;61da   ; lee la cuenta del vibrato
	inc a			;61dd
	cp e			;61de
	jr c,L_620E		;61df
	ld e,(ix+015h)		;61e1   ; lee el periodo
	ld d,(ix+016h)		;61e4   ; lee el periodo (alto)
	ld a,(ix+01ch)		;61e7   ; lee el vibrato ([cada][cuanto])
	and 00fh		;61ea
	ld b,a			;61ec
	ld a,(ix+01bh)		;61ed   ; lee el sentido del vibrato
	cpl			;61f0
	ld (ix+01bh),a		;61f1   ; guarda el sentido del vibrato
	and a			;61f4
	ld a,e			;61f5
	jr nz,L_61FF		;61f6
	add a,b			;61f8   ; + B
	ld e,a			;61f9
	jr nc,L_6204		;61fa
	inc d			;61fc
	jr L_6204		;61fd
L_61FF:
	sub b			;61ff   ; - B
	ld e,a			;6200
	jr nc,L_6204		;6201
	dec d			;6203
L_6204:
	ld (ix+015h),e		;6204   ; guarda el periodo
	ld (ix+016h),d		;6207   ; guarda el periodo (alto)
	call periodo_al_psg		;620a   ; periodo_al_psg: manda el periodo del canal al PSG (el canal 5/7 cede al efecto de 0xC072)
	xor a			;620d
L_620E:
	ld (ix+01ah),a		;620e   ; guarda la cuenta del vibrato
	ret			;6211
L_6212:
	ld a,(hl)			;6212   ; formato 1: 0xDx = la unidad de duracion
	and 0f0h		;6213
	cp 0d0h		;6215
	ld a,(hl)			;6217
	jr nz,L_6221		;6218
	and 00fh		;621a
	ld (ix+006h),a		;621c   ; guarda la unidad de duracion (Dx)
	inc hl			;621f
	ld a,(hl)			;6220
L_6221:
	cp 0f0h		;6221   ; 0xFx = el volumen + 1...
	jr c,L_623E		;6223
	and 00fh		;6225
	inc a			;6227
	ld (ix+007h),a		;6228   ; guarda el volumen de la nota (Fx)
	inc hl			;622b
	ld a,(hl)			;622c   ; ...y un byte de dos nibbles
	and 0f0h		;622d
	rrca			;622f
	rrca			;6230
	rrca			;6231
	rrca			;6232
	ld (ix+00ch),a		;6233   ; guarda el nibble alto tras Fx
	ld a,(hl)			;6236
	and 00fh		;6237
	ld (ix+00dh),a		;6239   ; guarda el nibble bajo tras Fx
	inc hl			;623c
	ld a,(hl)			;623d
L_623E:
	cp 0e0h		;623e   ; 0xEx: una orden
	jr c,L_628E		;6240
	and 00fh		;6242
	cp 008h		;6244   ; 0xE0-0xE7: la octava
	jr c,L_6289		;6246
	jr z,L_6281		;6248   ; 0xE8: el periodo + 1 (bit 3)
	cp 00ch		;624a   ; 0xEC: vibrato con el byte siguiente
	jr z,L_6275		;624c
	cp 00fh		;624e   ; 0xEF: sin instrumento ni banderas
	jr z,L_6259		;6250
	inc hl			;6252   ; 0xE9-0xEE (salvo 0xEC): el instrumento del byte siguiente
	ld a,(hl)			;6253
	ld (ix+010h),a		;6254   ; guarda el instrumento
	jr L_628C		;6257
L_6259:
	xor a			;6259   ; 0xEF
	ld (ix+00fh),a		;625a   ; guarda las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
	ld (ix+010h),a		;625d   ; guarda el instrumento
	inc hl			;6260
	ld a,(0c0f8h)		;6261   ; en pausa...
	or a			;6264
	jr z,L_6212		;6265
	xor a			;6267   ; ...el canal callado
	ld (ix+005h),a		;6268   ; guarda el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	ld (ix+017h),a		;626b   ; guarda el volumen
	push hl			;626e
	call volumen_al_psg		;626f   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
	pop hl			;6272
	jr L_6212		;6273
L_6275:
	set 2,(ix+00fh)		;6275   ; pone a uno el bit 2 de las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
	inc hl			;6279
	ld a,(hl)			;627a   ; ...y sus parametros
	ld (ix+01ch),a		;627b   ; guarda el vibrato ([cada][cuanto])
	jp L_6285		;627e
L_6281:
	set 3,(ix+00fh)		;6281   ; pone a uno el bit 3 de las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
L_6285:
	inc hl			;6285
	jp L_6212		;6286
L_6289:
	ld (ix+009h),a		;6289   ; guarda la octava (E0-E7)
L_628C:
	inc hl			;628c
	ld a,(hl)			;628d
L_628E:
	and 00fh		;628e   ; [nota][duracion]: la duracion en unidades
	ld b,a			;6290
	ld a,(ix+006h)		;6291   ; lee la unidad de duracion (Dx)
	jr z,L_629B		;6294
L_6296:
	add a,(ix+006h)		;6296   ; le suma la unidad de duracion (Dx)
	djnz L_6296		;6299
L_629B:
	ld (ix+001h),a		;629b   ; guarda la duracion de la nota
	ld a,(hl)			;629e   ; la nota (el nibble alto)
	call avanza_lista		;629f   ; avanza_lista: (ix+3, ix+4) = HL + 1
	and 0f0h		;62a2
	rrca			;62a4
	rrca			;62a5
	rrca			;62a6
	rrca			;62a7
	ld b,a			;62a8
	ld a,(ix+010h)		;62a9   ; lee el instrumento
	or a			;62ac
	jr nz,L_62FD		;62ad
	ld a,b			;62af   ; la nota 0x0C: silencio
	sub 00ch		;62b0
	jp z,L_6351		;62b2
	ld a,(ix+007h)		;62b5   ; lee el volumen de la nota (Fx)
	ld (ix+008h),a		;62b8   ; guarda el volumen que va bajando
	ld (ix+017h),a		;62bb   ; guarda el volumen
	res 0,(ix+00fh)		;62be   ; pone a cero el bit 0 de las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
	xor a			;62c2
	ld (ix+01ah),a		;62c3   ; guarda la cuenta del vibrato
	ld (ix+01bh),a		;62c6   ; guarda el sentido del vibrato
	ld e,(ix+001h)		;62c9   ; lee la duracion de la nota
	ld (ix+000h),e		;62cc   ; guarda la cuenta de la nota
	ld a,(0c0f8h)		;62cf   ; en pausa, nada mas
	or a			;62d2
	ret nz			;62d3
	ld a,(ix+00ch)		;62d4   ; lee el nibble alto tras Fx
	add a,e			;62d7
	ld (ix+00ah),a		;62d8   ; guarda la cuenta de la bajada de volumen
	ld a,b			;62db   ; el periodo de la nota (0x63FD)...
	ld hl,063fdh		;62dc
	add a,l			;62df
	ld l,a			;62e0
	jr nc,L_62E4		;62e1
	inc h			;62e3
L_62E4:
	ld l,(hl)			;62e4
	ld h,000h		;62e5
	ld a,(ix+009h)		;62e7   ; lee la octava (E0-E7)
	or a			;62ea
	jr z,L_62F1		;62eb
	ld b,a			;62ed
L_62EE:
	add hl,hl			;62ee
	djnz L_62EE		;62ef
L_62F1:
	ld (ix+015h),l		;62f1   ; guarda el periodo
	ld (ix+016h),h		;62f4   ; guarda el periodo (alto)
	call periodo_al_psg		;62f7   ; periodo_al_psg: manda el periodo del canal al PSG (el canal 5/7 cede al efecto de 0xC072)
	jp volumen_al_psg		;62fa   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
L_62FD:
	add a,a			;62fd   ; el instrumento: 0x6529 + 2 x n...
	ld de,06529h		;62fe
	add a,e			;6301
	ld e,a			;6302
	jr nc,L_6306		;6303
	inc d			;6305
L_6306:
	ld a,(de)			;6306   ; ...HL = su tabla de 12 notas
	ld l,a			;6307
	inc de			;6308
	ld a,(de)			;6309
	ld h,a			;630a
	ld a,(ix+001h)		;630b   ; lee la duracion de la nota
	ld (ix+000h),a		;630e   ; guarda la cuenta de la nota
	ld a,(0c0f8h)		;6311   ; en pausa, nada mas
	or a			;6314
	ret nz			;6315
	ld a,b			;6316   ; la nota B de la tabla
	add a,a			;6317
	add a,l			;6318
	ld l,a			;6319
	jr nc,L_631D		;631a
	inc h			;631c
L_631D:
	ld e,(hl)			;631d   ; (ix+0x11, 0x12) = su lista
	ld (ix+011h),e		;631e   ; guarda la nota del instrumento
	inc hl			;6321
	ld d,(hl)			;6322
	ld (ix+012h),d		;6323   ; guarda la nota del instrumento (alta)
	ex de,hl			;6326
	ld a,(hl)			;6327   ; y se lee como el formato 0
	jp L_60C8		;6328
L_632B:
	dec (ix+013h)		;632b   ; baja la cuenta del instrumento
	ret nz			;632e
	ld l,(ix+011h)		;632f   ; lee la nota del instrumento
	ld h,(ix+012h)		;6332   ; lee la nota del instrumento (alta)
	ld a,(hl)			;6335
	cp 0ffh		;6336   ; 0xFF: el instrumento acabo
	jr z,L_6347		;6338
	jp L_60C8		;633a
L_633D:
	inc hl			;633d   ; el instrumento sigue por aqui
	ld (ix+011h),l		;633e   ; guarda la nota del instrumento
	ld (ix+012h),h		;6341   ; guarda la nota del instrumento (alta)
	jp L_613F		;6344
L_6347:
	xor a			;6347   ; callado
	ld (ix+005h),a		;6348   ; guarda el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	ld (ix+017h),a		;634b   ; guarda el volumen
	jp volumen_al_psg		;634e   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
L_6351:
	xor a			;6351   ; la nota 0x0C: silencio
	ld (ix+015h),a		;6352   ; guarda el periodo
	ld (ix+016h),a		;6355   ; guarda el periodo (alto)
	ld (ix+017h),a		;6358   ; guarda el volumen
	ld a,(ix+001h)		;635b   ; lee la duracion de la nota
	ld (ix+000h),a		;635e   ; guarda la cuenta de la nota
	call periodo_al_psg		;6361   ; periodo_al_psg: manda el periodo del canal al PSG (el canal 5/7 cede al efecto de 0xC072)
	jp volumen_al_psg		;6364   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
fin_de_lista:		; 0xFF: vuelve a la lista guardada (ix+0x18, 0x19) o calla el canal
	ld a,(ix+019h)		;6367   ; lee la vuelta de la llamada (alta)
	or a			;636a
	jr z,L_6381		;636b
	ld (ix+004h),a		;636d   ; guarda por donde va la lista (alta)
	ld a,(ix+018h)		;6370   ; lee la vuelta de la llamada (0xFE 0xFF)
	ld (ix+003h),a		;6373   ; guarda por donde va la lista
	ld (ix+019h),000h		;6376   ; la vuelta de la llamada (alta) = 0x00
	ld (ix+000h),001h		;637a   ; la cuenta de la nota = 0x01
	jp canal		;637e   ; canal: un cuadro del canal IX (C = su registro de tono del PSG)
L_6381:
	xor a			;6381   ; el canal callado
	ld (ix+002h),a		;6382   ; guarda el sonido del canal
	ld (ix+005h),a		;6385   ; guarda el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	ld (ix+00bh),a		;6388   ; guarda la cuenta de repeticiones (0xFE n)
	ld (ix+010h),a		;638b   ; guarda el instrumento
	ld (ix+015h),a		;638e   ; guarda el periodo
	ld (ix+016h),a		;6391   ; guarda el periodo (alto)
	ld (ix+017h),a		;6394   ; guarda el volumen
	ld (ix+01bh),a		;6397   ; guarda el sentido del vibrato
	ld a,c			;639a   ; en el cuarto canal (C = 7)...
	cp 007h		;639b
	jp c,volumen_al_psg		;639d   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
	dec c			;63a0   ; ...el tercero (0xC050) vuelve a sonar con volumen 5
	dec c			;63a1
	ld ix,0c050h		;63a2
	ld (ix+017h),005h		;63a6   ; el volumen = 0x05
	call periodo		;63aa   ; periodo: el periodo (ix+0x15, 0x16) a los registros C y C - 1 del PSG
	jp volumen		;63ad   ; volumen: el volumen (ix+0x17) menos el fundido 0xC0F6 al registro 8 + C/2, o la envolvente
refresca_canal:		; con 0xC0F3 vuelve a mandar el periodo y el volumen
	ld a,(0c0f3h)		;63b0   ; con 0xC0F3, refresca
	or a			;63b3
	ret z			;63b4
	call periodo_al_psg		;63b5   ; periodo_al_psg: manda el periodo del canal al PSG (el canal 5/7 cede al efecto de 0xC072)
	jp volumen_al_psg		;63b8   ; volumen_al_psg: manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
periodo_al_psg:		; manda el periodo del canal al PSG (el canal 5/7 cede al efecto de 0xC072)
	ld a,(0c072h)		;63bb   ; el efecto (0xC072) en marcha...
	ld e,a			;63be
	ld a,c			;63bf   ; los canales A y B siempre
	cp 005h		;63c0
	jr c,periodo		;63c2
	jr nz,L_63CB		;63c4   ; el C (5) solo sin efecto
	ld a,e			;63c6
	or a			;63c7
	ret nz			;63c8
	jr periodo		;63c9
L_63CB:
	ld a,e			;63cb   ; el cuarto (7) solo con efecto...
	or a			;63cc
	ret z			;63cd
	dec c			;63ce   ; ...y en el registro del C
	dec c			;63cf
	call periodo		;63d0   ; periodo: el periodo (ix+0x15, 0x16) a los registros C y C - 1 del PSG
	inc c			;63d3
	inc c			;63d4
	ret			;63d5
periodo:		; el periodo (ix+0x15, 0x16) a los registros C y C - 1 del PSG
	ld l,(ix+015h)		;63d6   ; lee el periodo
	ld h,(ix+016h)		;63d9   ; lee el periodo (alto)
	bit 3,(ix+00fh)		;63dc   ; mira el bit 3 de las banderas del canal (bit 0 y 2 vibrato, 3 periodo + 1)
	jr z,L_63E3		;63e0
	inc hl			;63e2
L_63E3:
	ld a,c			;63e3   ; el periodo alto al registro C
	ld e,h			;63e4
	call 00093h		;63e5   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,c			;63e8   ; el bajo al registro C - 1
	dec a			;63e9
	ld e,l			;63ea
	call 00093h		;63eb   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(ix+010h)		;63ee   ; lee el instrumento
	or a			;63f1
	ret nz			;63f2
	ld a,(ix+00eh)		;63f3   ; lee el formato de la lista (0xFE 0 lo cambia)
	or a			;63f6
	ret z			;63f7
	ld (ix+005h),002h		;63f8   ; el tipo de nota (bits 0-1 tono/ruido, 3 envolvente) = 0x02
	ret			;63fc

; ----------------------------------------------------------------------
; DATOS periodo_de_las_12_notas: el periodo del PSG (byte bajo) de las 12
;   notas de la octava mas aguda, que p04:62DC lee en 0x63FD + nota y desplaza
;   (ix+9) veces a la izquierda para bajar de octava; lo leen p04:62DC (12
;   bytes)
;   0x63fd..0x6409  (12 bytes)
DATA_periodo_de_las_12_notas:
	defb 06bh,065h,05fh,05ah,055h,050h,04ch,047h,043h,040h,03ch,039h	; 63fd  ke_ZUPLGC@<9

; ======================================================================
; CODIGO 0x6409..0x652b  (290 bytes)
; ======================================================================


fundido:		; baja el volumen (0xC0F5, 0xC0F6) y, al acabar, pide el sonido de 0xC0F4
	ld hl,0c0f5h		;6409   ; 0xC0F5: la cuenta del fundido
	inc (hl)			;640c
	ld a,(0c012h)		;640d   ; con la musica 0x41, cada 0x0E cuadros...
	cp 041h		;6410
	jr nz,L_641A		;6412
	ld a,(hl)			;6414
	cp 00eh		;6415
	ret c			;6417
	jr L_641E		;6418
L_641A:
	ld a,(hl)			;641a   ; ...con las demas, cada 3
	cp 003h		;641b
	ret c			;641d
L_641E:
	ld (hl),000h		;641e   ; 0xC0F6: lo que baja el volumen
	inc hl			;6420
	inc (hl)			;6421
	ld a,(hl)			;6422
	cp 00bh		;6423   ; hasta 0x0B
	ret c			;6425
	xor a			;6426   ; al acabar, a cero...
	ld hl,0c0f4h		;6427
	ld e,(hl)			;642a
	ld (hl),a			;642b
	inc l			;642c
	ld (hl),a			;642d
	inc l			;642e
	ld (hl),a			;642f
	ld a,e			;6430   ; ...y el sonido que esperaba
	jp pide_sonido		;6431   ; pide_sonido: el sonido A (indice 0x6892): < 0x29 efecto en 0xC070 si manda mas, si no musica de 3 o 4 canales; 0x4D/0x59 guardan la musica
volumen_al_psg:		; manda el volumen del canal al PSG (el canal 5/7 cede al efecto)
	ld a,(0c072h)		;6434   ; el efecto (0xC072) en marcha...
	ld e,a			;6437
	ld a,c			;6438   ; los canales A y B siempre
	cp 005h		;6439
	jr c,volumen		;643b
	jr nz,L_6444		;643d   ; el C (5) solo sin efecto
	ld a,e			;643f
	or a			;6440
	ret nz			;6441
	jr volumen		;6442
L_6444:
	ld a,e			;6444   ; el cuarto (7) solo con efecto, en el registro del C
	or a			;6445
	ret z			;6446
	dec c			;6447
	dec c			;6448
volumen:		; el volumen (ix+0x17) menos el fundido 0xC0F6 al registro 8 + C/2, o la envolvente
	call mezclador		;6449   ; mezclador: tono y ruido del canal por (ix+5) bits 0-1, al registro 7 del PSG
	ld a,c			;644c   ; el registro de volumen: 8 + C / 2
	rrca			;644d
	add a,088h		;644e
	ld d,a			;6450
	ld h,(ix+017h)		;6451   ; lee el volumen
	ld a,(0c0f2h)		;6454   ; sin musica guardada...
	or a			;6457
	jr nz,L_6471		;6458
	ld a,(ix+00eh)		;645a   ; lee el formato de la lista (0xFE 0 lo cambia)
	or a			;645d   ; ...en el formato 1...
	jr z,L_6471		;645e
	ld a,(0c0f6h)		;6460   ; ...con fundido...
	or a			;6463
	jp z,L_6471		;6464
	ld e,a			;6467   ; ...el volumen baja (sin pasar de cero)...
	ld a,h			;6468
	sub e			;6469
	ret m			;646a
	bit 3,(ix+005h)		;646b   ; mira el bit 3 de el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	ret nz			;646f   ; ...y sin envolvente
	ld h,a			;6470
L_6471:
	ld a,(ix+005h)		;6471   ; lee el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	bit 3,a		;6474   ; con envolvente (bit 3)...
	jr z,L_6484		;6476
	bit 2,a		;6478
	ret nz			;647a
	ld e,h			;647b   ; ...el volumen como forma de la envolvente (R#13)...
	ld a,00dh		;647c
	call 00093h		;647e   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,010h		;6481   ; ...y el volumen 0x10 (envolvente)
	ld h,a			;6483
L_6484:
	ld a,d			;6484   ; al registro de volumen
	ld e,h			;6485
	jp 00093h		;6486   ; BIOS WRTPSG - Writes data to PSG-register
copia_canales:		; copia 0x60 bytes de HL a DE (guarda o devuelve tres canales)
	ld bc,00060h		;6489   ; 3 canales
	ldir		;648c
	ld c,a			;648e   ; C = A
	xor a			;648f   ; 0xC0F1 a cero
	ld (0c0f1h),a		;6490
	ret			;6493
orden_fe:		; 0xFE n: repite n veces; 0xFE 0: cambia de modo; 0xFE 0xFF: llama a otra lista
	inc hl			;6494
	ld a,(hl)			;6495   ; 0xFE 0: cambia el formato
	or a			;6496
	jr z,L_64C5		;6497
	inc a			;6499   ; 0xFE 0xFF: llama a otra lista
	jr z,L_64D5		;649a
	ld a,(ix+00bh)		;649c   ; lee la cuenta de repeticiones (0xFE n)
	inc a			;649f   ; 0xFE n: repite n veces...
	cp (hl)			;64a0   ; ...desde la direccion que sigue
	jr z,L_64B6		;64a1
	jp m,L_64A7		;64a3
	dec a			;64a6
L_64A7:
	ld (ix+00bh),a		;64a7   ; guarda la cuenta de repeticiones (0xFE n)
	inc hl			;64aa   ; la direccion
	ld a,(hl)			;64ab
	ld (ix+003h),a		;64ac   ; guarda por donde va la lista
	inc hl			;64af
	ld a,(hl)			;64b0
	ld (ix+004h),a		;64b1   ; guarda por donde va la lista (alta)
	jr L_64BF		;64b4
L_64B6:
	inc hl			;64b6   ; hechas: sigue detras
	inc hl			;64b7
	xor a			;64b8
	ld (ix+00bh),a		;64b9   ; guarda la cuenta de repeticiones (0xFE n)
L_64BC:
	call avanza_lista		;64bc   ; avanza_lista: (ix+3, ix+4) = HL + 1
L_64BF:
	inc (ix+000h)		;64bf   ; sube la cuenta de la nota
	jp canal		;64c2   ; canal: un cuadro del canal IX (C = su registro de tono del PSG)
L_64C5:
	ld a,(ix+00eh)		;64c5   ; lee el formato de la lista (0xFE 0 lo cambia)
	or a			;64c8   ; el formato 1 pasa al 0...
	jr z,L_64D0		;64c9
	dec (ix+00eh)		;64cb   ; baja el formato de la lista (0xFE 0 lo cambia)
	jr L_64D3		;64ce
L_64D0:
	inc (ix+00eh)		;64d0   ; sube el formato de la lista (0xFE 0 lo cambia)
L_64D3:
	jr L_64BC		;64d3
L_64D5:
	inc hl			;64d5   ; la lista llamada
	ld e,(hl)			;64d6
	ld (ix+003h),e		;64d7   ; guarda por donde va la lista
	inc hl			;64da
	ld d,(hl)			;64db
	ld (ix+004h),d		;64dc   ; guarda por donde va la lista (alta)
	inc hl			;64df   ; la vuelta en (ix+0x18, 0x19)
	ld (ix+018h),l		;64e0   ; guarda la vuelta de la llamada (0xFE 0xFF)
	ld (ix+019h),h		;64e3   ; guarda la vuelta de la llamada (alta)
	ex de,hl			;64e6
	jp L_60C0		;64e7   ; y sigue alli
avanza_lista:		; (ix+3, ix+4) = HL + 1
	inc hl			;64ea
	ld (ix+003h),l		;64eb   ; guarda por donde va la lista
	ld (ix+004h),h		;64ee   ; guarda por donde va la lista (alta)
	ret			;64f1
mezclador:		; tono y ruido del canal por (ix+5) bits 0-1, al registro 7 del PSG
	ld a,(0c0f0h)		;64f2
	ld e,a			;64f5
	ld a,(ix+005h)		;64f6   ; lee el tipo de nota (bits 0-1 tono/ruido, 3 envolvente)
	and 003h		;64f9
	ld d,a			;64fb
	ld a,c			;64fc
	cp 001h		;64fd
	jr z,L_6502		;64ff
	dec a			;6501
L_6502:
	ld b,a			;6502
	bit 1,d		;6503
	call z,pon_bits		;6505   ; pon_bits: E = E OR A
	bit 1,d		;6508
	call nz,quita_bits		;650a   ; quita_bits: E = E AND NOT A
	ld a,b			;650d
	rlca			;650e
	rlca			;650f
	rlca			;6510
	bit 0,d		;6511
	call z,pon_bits		;6513   ; pon_bits: E = E OR A
	bit 0,d		;6516
	call nz,quita_bits		;6518   ; quita_bits: E = E AND NOT A
pon_mezclador:		; 0xC0F0 = A y al registro 7 del PSG
	ld (0c0f0h),a		;651b
	ld e,a			;651e
	ld a,007h		;651f
	jp 00093h		;6521   ; BIOS WRTPSG - Writes data to PSG-register
quita_bits:		; E = E AND NOT A
	cpl			;6524
	and e			;6525
	ld e,a			;6526
	ret			;6527
pon_bits:		; E = E OR A
	or e			;6528
	ld e,a			;6529
	ret			;652a

; ----------------------------------------------------------------------
; DATOS indice_de_instrumentos: 5 punteros, instrumentos 1-5, que p04:62FE lee
;   en 0x6529 + 2 x instrumento: cada uno es una tabla de 12 palabras, una por
;   nota (p04:6316 suma 2 x nota), con la secuencia de registros de efecto de
;   esa nota; lo leen p04:62FE (10 bytes)
;   0x652b..0x6535  (10 bytes)
DATA_indice_de_instrumentos:
	defw 06535h,06629h,06642h,0665bh,066e0h	; 652b

; ----------------------------------------------------------------------
; DATOS instrumento_1: el instrumento 1: 12 punteros, uno por nota, a su
;   secuencia de registros de efecto (p04:631D los pone en (ix+0x11)); el 1 es
;   la bateria, un golpe distinto por nota; lo leen p04:631D (24 bytes)
;   0x6535..0x654d  (24 bytes)
DATA_instrumento_1:
	defw 0654dh,06552h,0655fh,0656fh,0657dh,0657dh	; 6535
	defw 0657dh,0657eh,065a1h,065cah,065f3h,0661ah	; 6541

; ----------------------------------------------------------------------
; DATOS nota_654D: la nota 0 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (5 bytes)
;   0x654d..0x6552  (5 bytes)
DATA_nota_654D:
	defb 021h,001h,010h,0b0h,0ffh	; 654d

; ----------------------------------------------------------------------
; DATOS nota_6552: la nota 1 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (13 bytes)
;   0x6552..0x655f  (13 bytes)
DATA_nota_6552:
	defb 023h,001h,010h,0bah,000h,021h,004h,010h,090h,080h,070h,060h,0ffh	; 6552  #....!....p`.

; ----------------------------------------------------------------------
; DATOS nota_655F: la nota 2 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (16 bytes)
;   0x655f..0x656f  (16 bytes)
DATA_nota_655F:
	defb 02ah,001h,000h,0b8h,0a1h,080h,021h,001h,014h,0b0h,090h,080h,070h,060h,050h,0ffh	; 655f  *.....!.....p`P.

; ----------------------------------------------------------------------
; DATOS nota_656F: la nota 3 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (14 bytes)
;   0x656f..0x657d  (14 bytes)
DATA_nota_656F:
	defb 02ah,001h,000h,0b8h,0a1h,080h,021h,001h,014h,090h,080h,070h,060h,0ffh	; 656f  *.....!....p`.

; ----------------------------------------------------------------------
; DATOS nota_657D: la nota 4 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (1 bytes)
;   0x657d..0x657e  (1 bytes)
DATA_nota_657D:
	defb 0ffh	; 657d

; ----------------------------------------------------------------------
; DATOS nota_657E: la nota 7 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (35 bytes)
;   0x657e..0x65a1  (35 bytes)
DATA_nota_657E:
	defb 022h,001h,0b1h,0a0h,0a1h,0aah,0a1h,0b5h,091h,0c0h,091h,0cah,091h,0d5h,081h,0e0h	; 657e  "...............
	defb 081h,0eah,081h,0f5h,082h,000h,072h,00ah,072h,015h,072h,020h,072h,02ah,062h,035h	; 658e  ......r.r.r r*b5
	defb 052h,040h,0ffh	; 659e

; ----------------------------------------------------------------------
; DATOS nota_65A1: la nota 8 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (41 bytes)
;   0x65a1..0x65ca  (41 bytes)
DATA_nota_65A1:
	defb 022h,001h,0c2h,000h,0b2h,00ah,0b2h,015h,0a2h,020h,0a2h,02ah,0a2h,035h,092h,040h	; 65a1  "........ .*.5.@
	defb 092h,04ah,092h,055h,092h,060h,082h,06ah,082h,075h,082h,080h,082h,08ah,082h,095h	; 65b1  .J.U.`.j.u......
	defb 072h,0a0h,072h,0aah,072h,0b5h,062h,0c0h,0ffh	; 65c1  r.r.r.b..

; ----------------------------------------------------------------------
; DATOS nota_65CA: la nota 9 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (41 bytes)
;   0x65ca..0x65f3  (41 bytes)
DATA_nota_65CA:
	defb 022h,001h,0d3h,000h,0c3h,00ah,0c3h,015h,0b3h,020h,0b3h,02ah,0b3h,035h,0a3h,040h	; 65ca  "........ .*.5.@
	defb 0a3h,04ah,0a3h,055h,0a3h,060h,093h,06ah,093h,075h,093h,080h,093h,08ah,093h,095h	; 65da  .J.U.`.j.u......
	defb 083h,0a0h,083h,0aah,083h,0b5h,073h,0c0h,0ffh	; 65ea  ......s..

; ----------------------------------------------------------------------
; DATOS nota_65F3: la nota 10 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (39 bytes)
;   0x65f3..0x661a  (39 bytes)
DATA_nota_65F3:
	defb 022h,001h,0e4h,000h,0d4h,015h,0c4h,030h,0c4h,045h,0b4h,060h,0b4h,075h,0b4h,090h	; 65f3  "......0.E.`.u..
	defb 0a4h,0b0h,0a4h,0d0h,0a4h,0f0h,0a5h,010h,095h,030h,095h,050h,084h,070h,084h,090h	; 6603  .........0.P.p..
	defb 084h,0b0h,074h,0d0h,074h,0f0h,0ffh	; 6613

; ----------------------------------------------------------------------
; DATOS nota_661A: la nota 11 del instrumento 1: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (15 bytes)
;   0x661a..0x6629  (15 bytes)
DATA_nota_661A:
	defb 02ah,001h,003h,000h,093h,0d0h,02eh,001h,096h,000h,097h,000h,098h,000h,0ffh	; 661a  *..............

; ----------------------------------------------------------------------
; DATOS instrumento_2: el instrumento 2: 12 punteros, uno por nota, a su
;   secuencia de registros de efecto (p04:631D los pone en (ix+0x11)); el 1 es
;   la bateria, un golpe distinto por nota; lo leen p04:631D (24 bytes)
;   0x6629..0x6641  (24 bytes)
DATA_instrumento_2:
	defw 06641h,06641h,06641h,06641h,06641h,06641h	; 6629
	defw 06641h,06641h,06641h,06641h,06641h,06641h	; 6635

; ----------------------------------------------------------------------
; DATOS nota_6641: la nota 0 del instrumento 2: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (1 bytes)
;   0x6641..0x6642  (1 bytes)
DATA_nota_6641:
	defb 0ffh	; 6641

; ----------------------------------------------------------------------
; DATOS instrumento_3: el instrumento 3: 12 punteros, uno por nota, a su
;   secuencia de registros de efecto (p04:631D los pone en (ix+0x11)); el 1 es
;   la bateria, un golpe distinto por nota; lo leen p04:631D (24 bytes)
;   0x6642..0x665a  (24 bytes)
DATA_instrumento_3:
	defw 0665ah,0665ah,0665ah,0665ah,0665ah,0665ah	; 6642
	defw 0665ah,0665ah,0665ah,0665ah,0665ah,0665ah	; 664e

; ----------------------------------------------------------------------
; DATOS nota_665A: la nota 0 del instrumento 3: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (1 bytes)
;   0x665a..0x665b  (1 bytes)
DATA_nota_665A:
	defb 0ffh	; 665a

; ----------------------------------------------------------------------
; DATOS instrumento_4: el instrumento 4: 12 punteros, uno por nota, a su
;   secuencia de registros de efecto (p04:631D los pone en (ix+0x11)); el 1 es
;   la bateria, un golpe distinto por nota; lo leen p04:631D (24 bytes)
;   0x665b..0x6673  (24 bytes)
DATA_instrumento_4:
	defw 06673h,06673h,06673h,06673h,06674h,06690h	; 665b
	defw 06690h,06691h,066a5h,066a6h,066c2h,066c3h	; 6667

; ----------------------------------------------------------------------
; DATOS nota_6673: la nota 0 del instrumento 4: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (1 bytes)
;   0x6673..0x6674  (1 bytes)
DATA_nota_6673:
	defb 0ffh	; 6673

; ----------------------------------------------------------------------
; DATOS nota_6674: la nota 4 del instrumento 4: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); se solapan 2 bloques: (nota_6690
;   6690-6691); lo leen p04:632B (29 bytes)
;   0x6674..0x6691  (29 bytes)
DATA_nota_6674:
	defb 022h,001h,0cah,09ah,0c5h,04dh,022h,004h,0cah,09ah,0bah,09ch,0aah,09eh,09ah,0a0h	; 6674  "....M".........
	defb 08ah,0a2h,08ah,0a4h,07ah,0a6h,07ah,0a8h,06ah,0aah,06ah,0ach,0ffh	; 6684  ....z.z.j.j..

; ----------------------------------------------------------------------
; DATOS nota_6691: la nota 7 del instrumento 4: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); se solapan 2 bloques: (nota_66A5
;   66A5-66A6); lo leen p04:632B (21 bytes)
;   0x6691..0x66a6  (21 bytes)
DATA_nota_6691:
	defb 022h,001h,0c8h,0eah,0c4h,075h,022h,004h,0c8h,0eeh,0b8h,0f0h,0a8h,0f2h,098h,0f4h	; 6691  "....u".........
	defb 088h,0f6h,088h,078h,0ffh	; 66a1

; ----------------------------------------------------------------------
; DATOS nota_66A6: la nota 9 del instrumento 4: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); se solapan 2 bloques: (nota_66C2
;   66C2-66C3); lo leen p04:632B (29 bytes)
;   0x66a6..0x66c3  (29 bytes)
DATA_nota_66A6:
	defb 022h,001h,0c7h,0f2h,0c3h,0f9h,022h,004h,0c7h,0f2h,0b7h,0f4h,0a7h,0f6h,097h,0f8h	; 66a6  ".....".........
	defb 087h,0fah,087h,0fch,077h,0fdh,078h,000h,068h,002h,068h,004h,0ffh	; 66b6  ....w.x.h.h..

; ----------------------------------------------------------------------
; DATOS nota_66C3: la nota 11 del instrumento 4: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (29 bytes)
;   0x66c3..0x66e0  (29 bytes)
DATA_nota_66C3:
	defb 022h,001h,0c7h,014h,0c3h,08ah,022h,004h,0c7h,014h,0b7h,016h,0a7h,018h,097h,01ah	; 66c3  ".....".........
	defb 087h,01ch,087h,01eh,077h,020h,077h,022h,067h,024h,067h,026h,0ffh	; 66d3  ....w w"g$g&.

; ----------------------------------------------------------------------
; DATOS instrumento_5: el instrumento 5: 12 punteros, uno por nota, a su
;   secuencia de registros de efecto (p04:631D los pone en (ix+0x11)); el 1 es
;   la bateria, un golpe distinto por nota; lo leen p04:631D (24 bytes)
;   0x66e0..0x66f8  (24 bytes)
DATA_instrumento_5:
	defw 066f8h,06715h,06732h,0674eh,0674fh,0676ch	; 66e0
	defw 06789h,067a6h,067c2h,067c3h,067dfh,067e0h	; 66ec

; ----------------------------------------------------------------------
; DATOS nota_66F8: la nota 0 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (29 bytes)
;   0x66f8..0x6715  (29 bytes)
DATA_nota_66F8:
	defb 022h,001h,0c6h,0aeh,0c3h,057h,022h,004h,0c6h,0aeh,0b6h,0b0h,0a6h,0b2h,096h,0b4h	; 66f8  "....W".........
	defb 086h,0b6h,086h,0b8h,076h,0bah,076h,0bch,066h,0beh,066h,0c0h,0ffh	; 6708  ....v.v.f.f..

; ----------------------------------------------------------------------
; DATOS nota_6715: la nota 1 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (29 bytes)
;   0x6715..0x6732  (29 bytes)
DATA_nota_6715:
	defb 022h,001h,0c6h,04eh,0c3h,027h,022h,004h,0c6h,04eh,0b6h,050h,0a6h,052h,096h,054h	; 6715  "..N.'"..N.P.R.T
	defb 086h,056h,086h,058h,076h,05ah,076h,05ch,066h,05eh,066h,060h,0ffh	; 6725  .V.XvZv\f^f`.

; ----------------------------------------------------------------------
; DATOS nota_6732: la nota 2 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); se solapan 2 bloques: (nota_674E
;   674E-674F); lo leen p04:632B (29 bytes)
;   0x6732..0x674f  (29 bytes)
DATA_nota_6732:
	defb 022h,001h,0c5h,0f4h,0c2h,0fah,022h,003h,0c5h,0f4h,0b5h,0f6h,0a5h,0f8h,095h,0fah	; 6732  ".....".........
	defb 085h,0fch,085h,0fdh,076h,000h,076h,002h,066h,004h,066h,006h,0ffh	; 6742  ....v.v.f.f..

; ----------------------------------------------------------------------
; DATOS nota_674F: la nota 4 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (29 bytes)
;   0x674f..0x676c  (29 bytes)
DATA_nota_674F:
	defb 022h,001h,0c5h,04dh,0c2h,0a6h,022h,004h,0c5h,04dh,0b5h,04fh,0a5h,051h,095h,053h	; 674f  "..M.."..M.O.Q.S
	defb 085h,055h,085h,057h,075h,059h,075h,05bh,065h,05dh,065h,060h,0ffh	; 675f  .U.WuYu[e]e`.

; ----------------------------------------------------------------------
; DATOS nota_676C: la nota 5 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (29 bytes)
;   0x676c..0x6789  (29 bytes)
DATA_nota_676C:
	defb 022h,001h,0c5h,001h,0c2h,080h,022h,004h,0c5h,001h,0b5h,003h,0a5h,005h,095h,007h	; 676c  ".....".........
	defb 085h,009h,085h,00bh,075h,00dh,075h,011h,065h,013h,065h,015h,0ffh	; 677c  ....u.u.e.e..

; ----------------------------------------------------------------------
; DATOS nota_6789: la nota 6 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (29 bytes)
;   0x6789..0x67a6  (29 bytes)
DATA_nota_6789:
	defb 022h,001h,0c4h,0b9h,0c2h,05ch,022h,004h,0c4h,0b9h,0b4h,0bbh,0a4h,0bdh,094h,0bfh	; 6789  "....\".........
	defb 084h,0c1h,084h,0c3h,074h,0c5h,074h,0c7h,064h,0c9h,064h,0cbh,0ffh	; 6799  ....t.t.d.d..

; ----------------------------------------------------------------------
; DATOS nota_67A6: la nota 7 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); se solapan 2 bloques: (nota_67C2
;   67C2-67C3); lo leen p04:632B (29 bytes)
;   0x67a6..0x67c3  (29 bytes)
DATA_nota_67A6:
	defb 022h,001h,0c4h,075h,0c2h,03ah,022h,004h,0c4h,075h,0b4h,077h,0a4h,079h,094h,07bh	; 67a6  "..u.:"..u.w.y.{
	defb 084h,07dh,084h,07fh,074h,081h,074h,083h,064h,085h,064h,087h,0ffh	; 67b6  .}..t.t.d.d..

; ----------------------------------------------------------------------
; DATOS nota_67C3: la nota 9 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); se solapan 2 bloques: (nota_67DF
;   67DF-67E0); lo leen p04:632B (29 bytes)
;   0x67c3..0x67e0  (29 bytes)
DATA_nota_67C3:
	defb 022h,001h,0c3h,0f9h,0c1h,0fch,022h,004h,0c3h,0f9h,0b3h,0fah,0a3h,0fbh,093h,0fch	; 67c3  ".....".........
	defb 083h,0fdh,084h,000h,074h,001h,074h,002h,064h,003h,064h,004h,0ffh	; 67d3  ....t.t.d.d..

; ----------------------------------------------------------------------
; DATOS nota_67E0: la nota 11 del instrumento 5: registros de efecto hasta
;   0xFF, uno por tic (p04:632B -> p04:60C8); lo leen p04:632B (29 bytes)
;   0x67e0..0x67fd  (29 bytes)
DATA_nota_67E0:
	defb 022h,001h,0c3h,08ah,0c1h,0c5h,022h,004h,0c3h,08ah,0b3h,08bh,0a3h,08ch,093h,08dh	; 67e0  ".....".........
	defb 083h,08eh,083h,08fh,073h,090h,073h,091h,063h,092h,053h,093h,0ffh	; 67f0  ....s.s.c.S..

; ======================================================================
; CODIGO 0x67fd..0x6892  (149 bytes)
; ======================================================================


pide_sonido:		; el sonido A (indice 0x6892): < 0x29 efecto en 0xC070 si manda mas, si no musica de 3 o 4 canales; 0x4D/0x59 guardan la musica
	ld c,a			;67fd   ; C = el sonido
	cp 053h		;67fe   ; la 0x53: se apunta en 0xC0FB
	jr nz,L_6805		;6800
	ld (0c0fbh),a		;6802
L_6805:
	cp 04dh		;6805   ; los sonidos 0x4D y 0x59...
	jr z,L_680F		;6807
	cp 059h		;6809
	jr z,L_680F		;680b
	jr L_681E		;680d
L_680F:
	ld a,c			;680f   ; ...guardan la musica en 0xC090...
	ld hl,0c010h		;6810
	ld de,0c090h		;6813
	call copia_canales		;6816   ; copia_canales: copia 0x60 bytes de HL a DE (guarda o devuelve tres canales)
	ld a,001h		;6819   ; ...y 0xC0F2 = 1
	ld (0c0f2h),a		;681b
L_681E:
	ld hl,0c012h		;681e   ; el primer canal, uno
	ld b,001h		;6821
	ld a,c			;6823
	cp 029h		;6824   ; menos de 0x29: un efecto
	jr c,L_684A		;6826
	cp 05ch		;6828   ; 0x29-0x5B: musica de 3 canales
	jr c,L_682D		;682a
	inc b			;682c   ; 0x5C en adelante: de 4
L_682D:
	inc b			;682d
	inc b			;682e
	ld a,(0c0f2h)		;682f   ; sin musica guardada, sin fundido
	or a			;6832
	jr nz,L_683F		;6833
	xor a			;6835
	ld (0c0f5h),a		;6836
	ld (0c0f6h),a		;6839
	ld (0c0f4h),a		;683c
L_683F:
	ld a,c			;683f   ; si no es la 0x59, el efecto se corta
	cp 059h		;6840
	jr z,L_6848		;6842
	xor a			;6844
	ld (0c072h),a		;6845
L_6848:
	jr L_6857		;6848
L_684A:
	ld l,072h		;684a   ; el efecto, en el cuarto canal (0xC070)
	ld a,(0c052h)		;684c   ; con 0x59 o mas en el tercero, no
	cp 059h		;684f
	ret nc			;6851
	ld a,(hl)			;6852   ; ni si suena un efecto de numero mayor
	ld e,a			;6853
	ld a,c			;6854
	cp e			;6855
	ret c			;6856
L_6857:
	ld a,c			;6857   ; la lista del sonido: 0x6890 + 2 x n
	ld de,06890h		;6858
	add a,a			;685b
	jr nc,L_685F		;685c
	inc d			;685e
L_685F:
	add a,e			;685f
	ld e,a			;6860
	jr nc,L_6864		;6861
	inc d			;6863
L_6864:
	dec l			;6864   ; HL = la ficha del canal
	dec l			;6865
L_6866:
	ld (hl),001h		;6866   ; +0: la cuenta a 1
	inc l			;6868
	inc l			;6869
	ld (hl),c			;686a   ; +2: el sonido
	inc l			;686b
	ld a,(de)			;686c   ; +3, +4: la lista
	ld (hl),a			;686d
	inc l			;686e
	inc de			;686f
	ld a,(de)			;6870
	ld (hl),a			;6871
	ld a,007h		;6872   ; +0x0B: sin repeticiones
	add a,l			;6874
	ld l,a			;6875
	xor a			;6876
	ld (hl),a			;6877
	ld a,003h		;6878   ; +0x0E = 1: el formato 1
	add a,l			;687a
	ld l,a			;687b
	ld a,001h		;687c
	ld (hl),a			;687e
	inc l			;687f   ; +0x0F y +0x10 a cero
	dec a			;6880
	ld (hl),a			;6881
	inc l			;6882
	ld (hl),a			;6883
	ld a,009h		;6884   ; +0x19 a cero
	add a,l			;6886
	ld l,a			;6887
	ld (hl),000h		;6888
	ld a,007h		;688a   ; la ficha siguiente
	add a,l			;688c
	ld l,a			;688d
	inc de			;688e   ; la lista del canal siguiente
	djnz L_6866		;688f
	ret			;6891

; ----------------------------------------------------------------------
; DATOS indice_de_sonidos: 95 punteros, sonidos 1-95 (p04:6858 lee 0x6890 + 2
;   x numero; el del 0 serian los dos ultimos bytes de codigo): cada sonido se
;   lleva B palabras seguidas, una por canal (p04:681E: 1 los efectos 1-0x28,
;   3 las musicas 0x29-0x5B, 4 las de 0x5C en adelante), asi que los numeros
;   de las musicas van de 3 en 3; lo leen p04:6858 (190 bytes)
;   0x6892..0x6950  (190 bytes)
DATA_indice_de_sonidos:
	defw 06b9bh,06b9ch,06ba9h,07197h,06bc8h,071a4h,06bfah,06c1fh	; 6892
	defw 06c32h,06c59h,07145h,06c8ah,06ca0h,06cb3h,06cc5h,06ee2h	; 68a2
	defw 06f25h,06ceeh,06d1dh,06d2dh,06d44h,06d62h,06d8bh,06e59h	; 68b2
	defw 06e68h,06da8h,06eb1h,06df1h,0716dh,06f70h,06fe4h,070feh	; 68c2
	defw 07109h,07136h,06f5ah,06e0eh,06a1ah,06b28h,06b5dh,06ba8h	; 68d2
	defw 07245h,07383h,07516h,07285h,073d1h,07551h,07673h,076d2h	; 68e2
	defw 07733h,078c8h,07958h,07a0ch,07adch,07b5eh,07be1h,07f3eh	; 68f2
	defw 07ff8h,08066h,07d2dh,07d9dh,07e6bh,080e4h,0815fh,081e1h	; 6902
	defw 08289h,08359h,08435h,08528h,0858ah,085f0h,06a53h,06aa8h	; 6912
	defw 06afch,06a82h,06ad7h,06ba8h,08658h,08666h,08674h,06950h	; 6922
	defw 069b0h,06a10h,08675h,086b4h,086f2h,086f2h,086f3h,08792h	; 6932
	defw 06ba8h,06ba8h,06ba8h,06ba8h,06ba8h,06ba8h,06ba8h	; 6942

; ----------------------------------------------------------------------
; DATOS sonido_50_6950: canal del sonido 0x50 (palabra 80 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (202
;   bytes)
;   0x6950..0x6a1a  (202 bytes)
DATA_sonido_50_6950:
	defb 0feh,000h,022h,004h,070h,0f5h,070h,0f2h,070h,0efh,070h,0ech,070h,0e9h,070h,0e6h	; 6950  ..".p.p.p.p.p.p.
	defb 070h,0e3h,070h,0e0h,070h,0ddh,070h,0dah,070h,0d7h,070h,0d4h,070h,0d1h,070h,0ceh	; 6960  p.p.p.p.p.p.p.p.
	defb 070h,0cbh,070h,0c8h,070h,0c5h,070h,0c2h,070h,0bfh,070h,0bch,070h,0b9h,070h,0b6h	; 6970  p.p.p.p.p.p.p.p.
	defb 070h,0b3h,070h,0b6h,070h,0b9h,070h,0bch,070h,0bfh,070h,0c2h,070h,0c5h,070h,0c8h	; 6980  p.p.p.p.p.p.p.p.
	defb 070h,0cbh,070h,0ceh,070h,0d1h,070h,0d4h,070h,0d7h,070h,0dah,070h,0ddh,070h,0e0h	; 6990  p.p.p.p.p.p.p.p.
	defb 070h,0e3h,070h,0e6h,070h,0e9h,070h,0ech,070h,0efh,070h,0f2h,0feh,0feh,052h,069h	; 69a0  p.p.p.p.p.p...Ri
	defb 0feh,000h,022h,004h,070h,0f3h,070h,0f0h,070h,0edh,070h,0eah,070h,0e7h,070h,0e4h	; 69b0  ..".p.p.p.p.p.p.
	defb 070h,0e1h,070h,0deh,070h,0dbh,070h,0d8h,070h,0d5h,070h,0d2h,070h,0cfh,070h,0cch	; 69c0  p.p.p.p.p.p.p.p.
	defb 070h,0c9h,070h,0c6h,070h,0c3h,070h,0c0h,070h,0bdh,070h,0bah,070h,0b7h,070h,0b4h	; 69d0  p.p.p.p.p.p.p.p.
	defb 070h,0b1h,070h,0b4h,070h,0b7h,070h,0bah,070h,0bdh,070h,0c0h,070h,0c3h,070h,0c6h	; 69e0  p.p.p.p.p.p.p.p.
	defb 070h,0c9h,070h,0cch,070h,0cfh,070h,0d2h,070h,0d5h,070h,0d8h,070h,0dbh,070h,0deh	; 69f0  p.p.p.p.p.p.p.p.
	defb 070h,0e1h,070h,0e4h,070h,0e7h,070h,0eah,070h,0edh,070h,0f0h,0feh,0feh,0b2h,069h	; 6a00  p.p.p.p.p.p....i
	defb 0feh,000h,021h,00fh,013h,040h,0feh,0feh,012h,06ah	; 6a10  ..!..@...j

; ----------------------------------------------------------------------
; DATOS sonido_25_6A1A: canal del sonido 0x25 (palabra 37 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (57
;   bytes)
;   0x6a1a..0x6a53  (57 bytes)
DATA_sonido_25_6A1A:
	defb 0feh,000h,022h,001h,0d1h,040h,0d1h,020h,0d1h,000h,0d0h,0e0h,0d1h,020h,0d1h,000h	; 6a1a  .."..@. ..... ..
	defb 0d0h,0e0h,0d0h,0c0h,0d1h,000h,0d0h,0e0h,0d0h,0c0h,0d0h,0a0h,0d0h,0e0h,0d0h,0c0h	; 6a2a  ................
	defb 0d0h,0a0h,0d0h,080h,0a0h,0e0h,0a0h,0c0h,0a0h,0a0h,0a0h,080h,080h,0e0h,080h,0c0h	; 6a3a  ................
	defb 080h,0a0h,080h,080h,070h,0e0h,070h,0c0h,0ffh	; 6a4a  ....p.p..

; ----------------------------------------------------------------------
; DATOS sonido_47_6A53: canal del sonido 0x47 (palabra 71 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (85
;   bytes)
;   0x6a53..0x6aa8  (85 bytes)
DATA_sonido_47_6A53:
	defb 0feh,000h,023h,002h,014h,0a0h,011h,0a0h,012h,0a0h,013h,0a0h,014h,0b0h,015h,0b0h	; 6a53  ..#.............
	defb 016h,0b0h,017h,0b0h,018h,0b0h,019h,0c0h,01ah,0c0h,01bh,0c0h,01ch,0c0h,01dh,0c0h	; 6a63  ................
	defb 01eh,0d0h,01fh,0d0h,020h,0d0h,021h,0d0h,022h,0d0h,023h,000h,000h,0feh,000h,0feh	; 6a73  .... .!.".#.....
	defb 000h,022h,001h,0c0h,0a3h,0c0h,040h,0c0h,024h,0c0h,041h,023h,004h,010h,000h,000h	; 6a83  ."....@.$.A#....
	defb 0d0h,024h,0d0h,023h,0c0h,023h,0c0h,023h,0b0h,023h,0a0h,023h,090h,023h,080h,023h	; 6a93  .$.#.#.#.#.#.#.#
	defb 070h,023h,060h,023h,0ffh	; 6aa3

; ----------------------------------------------------------------------
; DATOS sonido_48_6AA8: canal del sonido 0x48 (palabra 72 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (84
;   bytes)
;   0x6aa8..0x6afc  (84 bytes)
DATA_sonido_48_6AA8:
	defb 0feh,000h,023h,002h,010h,0a1h,070h,0a1h,080h,0b1h,090h,0b1h,0a0h,0b1h,0b0h,0b1h	; 6aa8  ..#...p.........
	defb 0c0h,0b1h,0d0h,0c1h,0e0h,0c1h,0f0h,0c2h,000h,0c2h,010h,0c2h,020h,0d2h,030h,0d2h	; 6ab8  ............ .0.
	defb 040h,0d2h,050h,0d2h,060h,0d2h,070h,0d2h,080h,0d2h,090h,000h,000h,0feh,000h,0feh	; 6ac8  @.P.`.p.........
	defb 000h,022h,001h,0b0h,0a4h,0b0h,031h,0b0h,025h,0b0h,042h,022h,004h,000h,000h,0c0h	; 6ad8  ."....1.%.B"....
	defb 025h,0c0h,024h,0c0h,024h,0b0h,024h,0b0h,024h,0a0h,024h,090h,024h,080h,024h,070h	; 6ae8  %.$.$.$.$.$.$.$p
	defb 024h,060h,024h,0ffh	; 6af8

; ----------------------------------------------------------------------
; DATOS sonido_49_6AFC: canal del sonido 0x49 (palabra 73 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (44
;   bytes)
;   0x6afc..0x6b28  (44 bytes)
DATA_sonido_49_6AFC:
	defb 0feh,000h,023h,002h,010h,0a1h,050h,0b1h,060h,0b1h,070h,0b1h,080h,0c1h,090h,0c1h	; 6afc  ..#...P.`.p.....
	defb 0a0h,0c1h,0b0h,0c1h,0b0h,0c1h,0d0h,0d1h,0e0h,0d1h,0f0h,0d2h,000h,0d2h,010h,0d2h	; 6b0c  ................
	defb 020h,0d2h,030h,0d2h,040h,0d2h,050h,0d2h,060h,0d2h,070h,0ffh	; 6b1c   .0.@.P.`.p.

; ----------------------------------------------------------------------
; DATOS sonido_26_6B28: canal del sonido 0x26 (palabra 38 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (53
;   bytes)
;   0x6b28..0x6b5d  (53 bytes)
DATA_sonido_26_6B28:
	defb 0d2h,0fch,000h,0e3h,070h,0b0h,0e2h,020h,070h,0e3h,0b0h,0e2h,020h,070h,0b0h,020h	; 6b28  ....p.. p... p.
	defb 070h,0b0h,0e1h,020h,0e2h,070h,0b0h,0e1h,020h,070h,0e2h,0b0h,0e1h,020h,070h,0b0h	; 6b38  p.. .p.. p... p.
	defb 0fah,000h,0e2h,0b0h,0e1h,020h,070h,0b0h,0f8h,000h,0e2h,0b0h,0e1h,020h,070h,0b0h	; 6b48  ..... p...... p.
	defb 0f6h,000h,0e2h,0b0h,0ffh	; 6b58

; ----------------------------------------------------------------------
; DATOS sonido_27_6B5D: canal del sonido 0x27 (palabra 39 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (62
;   bytes)
;   0x6b5d..0x6b9b  (62 bytes)
DATA_sonido_27_6B5D:
	defb 0d2h,0fch,000h,0e1h,000h,0e2h,090h,060h,030h,090h,060h,030h,000h,060h,030h,000h	; 6b5d  .......`0.`0.`0.
	defb 0e3h,090h,0e2h,060h,0e3h,060h,0e4h,060h,0fbh,000h,0e2h,060h,0e3h,060h,0e4h,060h	; 6b6d  ...`.`.`...`.`.`
	defb 0fah,000h,0e2h,060h,0e3h,060h,0e4h,060h,0f9h,000h,0e2h,060h,0e3h,060h,0e4h,060h	; 6b7d  ...`.`.`...`.`.`
	defb 0f8h,000h,0e2h,060h,0e3h,060h,0e4h,060h,0f7h,000h,0e2h,060h,0e3h,060h	; 6b8d  ...`.`.`...`.`

; ----------------------------------------------------------------------
; DATOS sonido_01_6B9B: canal del sonido 0x01 (palabra 1 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (1 bytes)
;   0x6b9b..0x6b9c  (1 bytes)
DATA_sonido_01_6B9B:
	defb 0ffh	; 6b9b

; ----------------------------------------------------------------------
; DATOS sonido_02_6B9C: canal del sonido 0x02 (palabra 2 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (13 bytes)
;   0x6b9c..0x6ba9  (13 bytes)
DATA_sonido_02_6B9C:
	defb 0feh,000h,021h,001h,018h,060h,080h,019h,0a0h,0c0h,01ah,0d0h,0ffh	; 6b9c  ..!..`.......

; ----------------------------------------------------------------------
; DATOS sonido_03_6BA9: canal del sonido 0x03 (palabra 3 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (31 bytes)
;   0x6ba9..0x6bc8  (31 bytes)
DATA_sonido_03_6BA9:
	defb 0feh,000h,022h,001h,093h,030h,0b2h,050h,0c1h,070h,0d1h,030h,0d0h,0d0h,0d1h,020h	; 6ba9  .."..0.P.p.0...
	defb 0d1h,0a0h,0d2h,020h,0d2h,0e0h,0d4h,050h,000h,000h,0feh,002h,0abh,06bh,0ffh	; 6bb9  ... ...P.....k.

; ----------------------------------------------------------------------
; DATOS sonido_05_6BC8: canal del sonido 0x05 (palabra 5 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (50 bytes)
;   0x6bc8..0x6bfa  (50 bytes)
DATA_sonido_05_6BC8:
	defb 0feh,000h,023h,001h,01fh,0b0h,040h,022h,001h,0c6h,000h,000h,000h,0b1h,048h,0b1h	; 6bc8  ..#...@"......H.
	defb 072h,0b1h,0a2h,0b1h,0d7h,0b2h,014h,0b2h,059h,0b2h,0a6h,091h,000h,091h,021h,091h	; 6bd8  r.......Y.....!.
	defb 046h,091h,070h,091h,09fh,091h,0d5h,092h,011h,080h,0b0h,080h,0d5h,080h,0f0h,081h	; 6be8  F.p.............
	defb 00fh,0ffh	; 6bf8

; ----------------------------------------------------------------------
; DATOS sonido_07_6BFA: canal del sonido 0x07 (palabra 7 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (37 bytes)
;   0x6bfa..0x6c1f  (37 bytes)
DATA_sonido_07_6BFA:
	defb 0feh,000h,021h,003h,01fh,090h,0a0h,0b0h,0c0h,0d0h,01eh,0d0h,01dh,0d0h,01ch,0d0h	; 6bfa  ..!.............
	defb 01bh,0d0h,01ah,0d0h,019h,0d0h,018h,0d0h,017h,0d0h,016h,0d0h,015h,0d0h,014h,0d0h	; 6c0a  ................
	defb 013h,0d0h,012h,0d0h,0ffh	; 6c1a

; ----------------------------------------------------------------------
; DATOS sonido_08_6C1F: canal del sonido 0x08 (palabra 8 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (19 bytes)
;   0x6c1f..0x6c32  (19 bytes)
DATA_sonido_08_6C1F:
	defb 0feh,000h,021h,001h,01fh,0d0h,01ch,0d0h,019h,0d0h,017h,0d0h,015h,0d0h,013h,0d0h	; 6c1f  ..!.............
	defb 011h,0d0h,0ffh	; 6c2f

; ----------------------------------------------------------------------
; DATOS sonido_09_6C32: canal del sonido 0x09 (palabra 9 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (39 bytes)
;   0x6c32..0x6c59  (39 bytes)
DATA_sonido_09_6C32:
	defb 0feh,000h,022h,001h,0e1h,050h,0c6h,000h,0d1h,080h,0d2h,000h,0b2h,040h,0a2h,000h	; 6c32  .."..P.......@..
	defb 0d4h,000h,0c4h,068h,0b4h,0a5h,0a4h,080h,000h,000h,092h,000h,082h,040h,072h,000h	; 6c42  ...h.........@r.
	defb 0a4h,000h,094h,068h,084h,0a5h,0ffh	; 6c52

; ----------------------------------------------------------------------
; DATOS sonido_0A_6C59: canal del sonido 0x0A (palabra 10 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (49
;   bytes)
;   0x6c59..0x6c8a  (49 bytes)
DATA_sonido_0A_6C59:
	defb 0feh,000h,022h,001h,0d2h,0f0h,0d2h,0b0h,0d2h,080h,0d2h,050h,0d2h,038h,0d2h,020h	; 6c59  .."........P.8.
	defb 0d2h,008h,0d1h,0f0h,0d1h,0d8h,0d1h,0c0h,0c2h,020h,0c2h,008h,0c1h,0f0h,0c1h,0d8h	; 6c69  ......... ......
	defb 0c1h,0c0h,0c1h,0a8h,0c1h,090h,0b1h,0f0h,0b1h,0d8h,0b1h,0c0h,0b1h,0a8h,0b1h,090h	; 6c79  ................
	defb 0ffh	; 6c89

; ----------------------------------------------------------------------
; DATOS sonido_0C_6C8A: canal del sonido 0x0C (palabra 12 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (22
;   bytes)
;   0x6c8a..0x6ca0  (22 bytes)
DATA_sonido_0C_6C8A:
	defb 0feh,000h,021h,001h,01dh,0e0h,022h,001h,0d6h,000h,021h,002h,01dh,0d0h,0c0h,0b0h	; 6c8a  ..!..."...!.....
	defb 0a0h,090h,080h,070h,060h,0ffh	; 6c9a

; ----------------------------------------------------------------------
; DATOS sonido_0D_6CA0: canal del sonido 0x0D (palabra 13 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (19
;   bytes)
;   0x6ca0..0x6cb3  (19 bytes)
DATA_sonido_0D_6CA0:
	defb 0feh,000h,023h,001h,015h,0e2h,080h,0c0h,028h,0e2h,0a0h,0c1h,070h,021h,005h,0b0h	; 6ca0  ..#.....(...p!..
	defb 090h,070h,0ffh	; 6cb0

; ----------------------------------------------------------------------
; DATOS sonido_0E_6CB3: canal del sonido 0x0E (palabra 14 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (18
;   bytes)
;   0x6cb3..0x6cc5  (18 bytes)
DATA_sonido_0E_6CB3:
	defb 0feh,000h,021h,001h,015h,0e0h,022h,001h,0d1h,0a0h,021h,002h,014h,0c0h,0a0h,080h	; 6cb3  ..!..."...!.....
	defb 060h,0ffh	; 6cc3

; ----------------------------------------------------------------------
; DATOS sonido_0F_6CC5: canal del sonido 0x0F (palabra 15 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (41
;   bytes)
;   0x6cc5..0x6cee  (41 bytes)
DATA_sonido_0F_6CC5:
	defb 0feh,000h,021h,002h,01dh,0d0h,022h,001h,0e6h,000h,021h,002h,010h,0d0h,012h,0d0h	; 6cc5  ..!..."...!.....
	defb 014h,0d0h,016h,0d0h,018h,0d0h,01ah,0d0h,010h,0a0h,012h,0a0h,014h,0a0h,016h,0a0h	; 6cd5  ................
	defb 018h,0a0h,01ah,0a0h,010h,070h,012h,070h,0ffh	; 6ce5  .....p.p.

; ----------------------------------------------------------------------
; DATOS sonido_12_6CEE: canal del sonido 0x12 (palabra 18 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (47
;   bytes)
;   0x6cee..0x6d1d  (47 bytes)
DATA_sonido_12_6CEE:
	defb 0feh,000h,022h,002h,080h,040h,080h,041h,080h,042h,080h,043h,090h,044h,090h,045h	; 6cee  .."..@.A.B.C.D.E
	defb 090h,046h,090h,047h,0a0h,048h,0a0h,049h,0a0h,04ah,0a0h,04bh,0b0h,04ch,0b0h,04dh	; 6cfe  .F.G.H.I.J.K.L.M
	defb 0b0h,04eh,0b0h,04fh,0c0h,050h,0c0h,051h,0c0h,052h,0c0h,053h,0c0h,054h,0ffh	; 6d0e  .N.O.P.Q.R.S.T.

; ----------------------------------------------------------------------
; DATOS sonido_13_6D1D: canal del sonido 0x13 (palabra 19 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (16
;   bytes)
;   0x6d1d..0x6d2d  (16 bytes)
DATA_sonido_13_6D1D:
	defb 0feh,000h,021h,003h,016h,0e0h,01ch,0e0h,0c0h,0b0h,0a0h,090h,080h,070h,060h,0ffh	; 6d1d  ..!..........p`.

; ----------------------------------------------------------------------
; DATOS sonido_14_6D2D: canal del sonido 0x14 (palabra 20 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (23
;   bytes)
;   0x6d2d..0x6d44  (23 bytes)
DATA_sonido_14_6D2D:
	defb 0feh,000h,021h,002h,012h,0e0h,01fh,0e0h,014h,0d0h,017h,0b0h,01ah,090h,01dh,080h	; 6d2d  ..!.............
	defb 021h,00fh,0a0h,090h,080h,070h,0ffh	; 6d3d

; ----------------------------------------------------------------------
; DATOS sonido_15_6D44: canal del sonido 0x15 (palabra 21 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (30
;   bytes)
;   0x6d44..0x6d62  (30 bytes)
DATA_sonido_15_6D44:
	defb 0feh,000h,023h,001h,011h,0e0h,020h,022h,001h,091h,040h,023h,001h,0c0h,020h,023h	; 6d44  ..#... "..@#.. #
	defb 001h,000h,000h,0d0h,011h,0b0h,011h,0a0h,011h,090h,011h,080h,011h,0ffh	; 6d54  ..............

; ----------------------------------------------------------------------
; DATOS sonido_16_6D62: canal del sonido 0x16 (palabra 22 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (41
;   bytes)
;   0x6d62..0x6d8b  (41 bytes)
DATA_sonido_16_6D62:
	defb 0feh,000h,022h,002h,0e1h,060h,0e2h,000h,0e2h,080h,0e3h,050h,0e5h,000h,0e7h,000h	; 6d62  .."..`.....P....
	defb 0c1h,060h,0c2h,000h,0c2h,080h,0c3h,050h,0c5h,000h,0c7h,000h,0a1h,060h,0a2h,000h	; 6d72  .`.....P.....`..
	defb 0a2h,080h,0a3h,050h,0a5h,000h,0a7h,000h,0ffh	; 6d82  ...P.....

; ----------------------------------------------------------------------
; DATOS sonido_17_6D8B: canal del sonido 0x17 (palabra 23 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (29
;   bytes)
;   0x6d8b..0x6da8  (29 bytes)
DATA_sonido_17_6D8B:
	defb 0feh,000h,022h,001h,0e0h,060h,0e0h,0c0h,0e1h,080h,0c3h,000h,022h,002h,0e0h,0c0h	; 6d8b  .."..`......"...
	defb 0e0h,060h,0e0h,030h,0c0h,0c0h,0c0h,060h,0c0h,030h,090h,060h,0ffh	; 6d9b  .`.0...`.0.`.

; ----------------------------------------------------------------------
; DATOS sonido_1A_6DA8: canal del sonido 0x1A (palabra 26 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (73
;   bytes)
;   0x6da8..0x6df1  (73 bytes)
DATA_sonido_1A_6DA8:
	defb 0feh,000h,022h,001h,0f1h,0a0h,0f2h,000h,0f2h,060h,0f2h,0c0h,0f3h,024h,0f3h,0b1h	; 6da8  .."......`...$..
	defb 0f4h,06dh,0f5h,040h,0f6h,054h,0f8h,000h,0fbh,000h,0d1h,0a0h,0d2h,000h,0d2h,060h	; 6db8  .m.@.T.........`
	defb 0d2h,0c0h,0d3h,024h,0d3h,0b1h,0d4h,060h,0d5h,040h,0d6h,054h,0d8h,000h,0dbh,000h	; 6dc8  ...$...`.@.T....
	defb 0d2h,000h,0d2h,060h,0d2h,0c0h,0d3h,024h,0d3h,0b1h,0d4h,06dh,0d5h,040h,0d6h,054h	; 6dd8  ...`...$...m.@.T
	defb 0b1h,0a0h,0b2h,000h,0b2h,060h,0b2h,0c0h,0ffh	; 6de8  .....`...

; ----------------------------------------------------------------------
; DATOS sonido_1C_6DF1: canal del sonido 0x1C (palabra 28 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (29
;   bytes)
;   0x6df1..0x6e0e  (29 bytes)
DATA_sonido_1C_6DF1:
	defb 0feh,000h,021h,001h,01fh,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,021h,008h,016h,0e0h,017h	; 6df1  ..!........!....
	defb 0e0h,019h,0e0h,01bh,0e0h,01dh,0d0h,01fh,0c0h,0a0h,080h,060h,0ffh	; 6e01  ...........`.

; ----------------------------------------------------------------------
; DATOS sonido_24_6E0E: canal del sonido 0x24 (palabra 36 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (75
;   bytes)
;   0x6e0e..0x6e59  (75 bytes)
DATA_sonido_24_6E0E:
	defb 0feh,000h,022h,001h,0d3h,000h,0d2h,040h,0d1h,080h,0d1h,020h,0d0h,0c0h,0d0h,090h	; 6e0e  .."....@... ....
	defb 0d0h,060h,0d0h,048h,0d0h,030h,0d0h,018h,0b3h,000h,0b2h,040h,0b1h,080h,0b1h,020h	; 6e1e  .`.H.0.....@...
	defb 0b0h,0c0h,0b0h,090h,0b0h,060h,0b0h,048h,0b0h,030h,0b0h,018h,093h,000h,092h,040h	; 6e2e  .....`.H.0.....@
	defb 091h,080h,091h,020h,090h,0c0h,090h,090h,090h,060h,090h,048h,090h,030h,090h,018h	; 6e3e  ... .....`.H.0..
	defb 073h,000h,072h,040h,071h,080h,071h,020h,070h,0c0h,0ffh	; 6e4e  s.r@q.q p..

; ----------------------------------------------------------------------
; DATOS sonido_18_6E59: canal del sonido 0x18 (palabra 24 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (15
;   bytes)
;   0x6e59..0x6e68  (15 bytes)
DATA_sonido_18_6E59:
	defb 0feh,000h,02ah,002h,000h,011h,080h,010h,080h,020h,0feh,008h,05bh,06eh,0ffh	; 6e59  ..*...... ..[n.

; ----------------------------------------------------------------------
; DATOS sonido_19_6E68: canal del sonido 0x19 (palabra 25 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (73
;   bytes)
;   0x6e68..0x6eb1  (73 bytes)
DATA_sonido_19_6E68:
	defb 0feh,000h,022h,001h,081h,0e0h,081h,040h,091h,0e0h,091h,040h,0a1h,0e0h,0a1h,040h	; 6e68  .."....@...@...@
	defb 0a1h,0e0h,0a1h,040h,0b1h,0e0h,0b1h,040h,0c1h,0e0h,0c1h,040h,0c1h,0e0h,0d1h,040h	; 6e78  ...@...@...@...@
	defb 0d1h,0e0h,0d1h,040h,0c1h,0e0h,0c1h,040h,0c1h,0e0h,0b1h,040h,0b1h,0e0h,0b1h,040h	; 6e88  ...@...@...@...@
	defb 0a1h,0e0h,0a1h,040h,0a1h,0e0h,0a1h,040h,091h,0e0h,091h,040h,081h,0e0h,081h,040h	; 6e98  ...@...@...@...@
	defb 071h,0e0h,071h,040h,071h,0e0h,071h,040h,0ffh	; 6ea8  q.q@q.q@.

; ----------------------------------------------------------------------
; DATOS sonido_1B_6EB1: canal del sonido 0x1B (palabra 27 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (49
;   bytes)
;   0x6eb1..0x6ee2  (49 bytes)
DATA_sonido_1B_6EB1:
	defb 0feh,000h,022h,001h,0b2h,000h,0b3h,000h,0c1h,0f0h,0c2h,0f0h,0d1h,0e0h,0d2h,0e0h	; 6eb1  ..".............
	defb 0d1h,0d0h,0d2h,0d0h,0d1h,0c0h,0d2h,0c0h,0d1h,0b0h,0d2h,0b0h,0d1h,0a0h,0d2h,0a0h	; 6ec1  ................
	defb 0c1h,090h,0b2h,090h,0b1h,080h,0b2h,080h,0a1h,070h,0a2h,070h,091h,060h,092h,060h	; 6ed1  .........p.p.`.`
	defb 0ffh	; 6ee1

; ----------------------------------------------------------------------
; DATOS sonido_10_6EE2: canal del sonido 0x10 (palabra 16 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (67
;   bytes)
;   0x6ee2..0x6f25  (67 bytes)
DATA_sonido_10_6EE2:
	defb 0feh,000h,022h,001h,0d1h,080h,0d2h,000h,0d2h,080h,0d3h,000h,0d4h,000h,0d6h,000h	; 6ee2  ..".............
	defb 0e8h,000h,0d2h,000h,0d2h,030h,0d2h,060h,0d2h,090h,0c2h,000h,0c2h,030h,0c2h,060h	; 6ef2  .....0.`.....0.`
	defb 0c2h,090h,0b2h,000h,0b2h,030h,0b2h,060h,0b2h,090h,0a2h,000h,0a2h,030h,0a2h,060h	; 6f02  .....0.`.....0.`
	defb 0a2h,090h,092h,000h,092h,030h,092h,060h,092h,090h,082h,000h,082h,030h,082h,060h	; 6f12  .....0.`.....0.`
	defb 082h,090h,0ffh	; 6f22

; ----------------------------------------------------------------------
; DATOS sonido_11_6F25: canal del sonido 0x11 (palabra 17 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (53
;   bytes)
;   0x6f25..0x6f5a  (53 bytes)
DATA_sonido_11_6F25:
	defb 0feh,000h,023h,001h,017h,091h,050h,091h,030h,0a1h,010h,0a0h,0f0h,0a0h,0d0h,0b0h	; 6f25  ..#...P.0.......
	defb 0b0h,0b0h,0a0h,023h,003h,017h,0b0h,0b0h,0c0h,0c0h,0c0h,0d0h,0b0h,0e0h,0b0h,0f0h	; 6f35  ...#............
	defb 0a0h,0b0h,0b0h,0c0h,0b0h,0d0h,0a0h,0e0h,0a0h,0f0h,091h,000h,081h,010h,071h,020h	; 6f45  ..............q
	defb 061h,030h,051h,040h,0ffh	; 6f55

; ----------------------------------------------------------------------
; DATOS sonido_23_6F5A: canal del sonido 0x23 (palabra 35 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (22
;   bytes)
;   0x6f5a..0x6f70  (22 bytes)
DATA_sonido_23_6F5A:
	defb 0feh,000h,023h,001h,013h,0b0h,0a0h,0a0h,015h,021h,001h,010h,0a0h,000h,023h,001h	; 6f5a  ..#......!....#.
	defb 013h,080h,010h,060h,010h,0ffh	; 6f6a

; ----------------------------------------------------------------------
; DATOS sonido_1E_6F70: canal del sonido 0x1E (palabra 30 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (116
;   bytes)
;   0x6f70..0x6fe4  (116 bytes)
DATA_sonido_1E_6F70:
	defb 0feh,000h,021h,001h,018h,0f0h,022h,001h,0f1h,0c0h,0f2h,080h,0f6h,000h,0f2h,0e0h	; 6f70  ..!...".........
	defb 0f3h,050h,0f4h,000h,0f2h,000h,0f3h,050h,021h,001h,018h,0c0h,022h,001h,0c1h,0c0h	; 6f80  .P.....P!..."...
	defb 0c2h,080h,0c6h,000h,0c2h,0e0h,0c3h,050h,0c4h,000h,0c2h,000h,021h,001h,017h,0d0h	; 6f90  .......P....!...
	defb 022h,002h,0f6h,000h,000h,000h,021h,001h,018h,000h,000h,0c0h,022h,002h,0fbh,000h	; 6fa0  ".....!....."...
	defb 000h,000h,021h,001h,019h,0b0h,022h,002h,0e6h,000h,000h,000h,021h,001h,01ah,000h	; 6fb0  ..!...".....!...
	defb 0a0h,022h,002h,0e9h,000h,000h,000h,021h,001h,01bh,090h,022h,002h,0ddh,000h,000h	; 6fc0  .".....!..."....
	defb 000h,021h,001h,01ch,080h,022h,002h,0cdh,000h,000h,000h,021h,001h,01dh,070h,022h	; 6fd0  .!...".....!..p"
	defb 002h,0bdh,000h,0ffh	; 6fe0

; ----------------------------------------------------------------------
; DATOS sonido_1F_6FE4: canal del sonido 0x1F (palabra 31 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (282
;   bytes)
;   0x6fe4..0x70fe  (282 bytes)
DATA_sonido_1F_6FE4:
	defb 0feh,000h,023h,001h,011h,0b2h,050h,082h,050h,0c2h,050h,092h,050h,0feh,00bh,0e6h	; 6fe4  ..#...P.P.P.P...
	defb 06fh,0c2h,04dh,092h,04ch,0b2h,04bh,082h,04ah,0c2h,049h,092h,043h,082h,042h,0c2h	; 6ff4  o.M.L.K.J.I.C.B.
	defb 041h,092h,040h,0b2h,03fh,082h,03eh,0c2h,03dh,092h,03ch,0b2h,03bh,082h,03ah,0c2h	; 7004  A.@.?.>.=.<...:.
	defb 039h,092h,038h,0b2h,037h,082h,036h,0c2h,035h,092h,034h,0b2h,033h,082h,032h,0c2h	; 7014  9.8.7.6.5.4.3.2.
	defb 031h,092h,030h,0b2h,02fh,082h,02eh,0c2h,02dh,092h,02ch,0b2h,02bh,082h,02ah,0c2h	; 7024  1.0./...-.,.+.*.
	defb 029h,092h,028h,0b2h,027h,082h,026h,0c2h,025h,092h,024h,0b2h,023h,082h,022h,0c2h	; 7034  ).(.'.&.%.$.#.".
	defb 021h,092h,020h,0b2h,01fh,082h,01eh,0c2h,01dh,092h,01ch,0b2h,01bh,082h,01ah,0c2h	; 7044  !. .............
	defb 019h,092h,018h,0b2h,017h,082h,016h,0c2h,030h,092h,030h,0b2h,030h,082h,02fh,0b2h	; 7054  ........0.0.0./.
	defb 02fh,092h,02eh,0b2h,02eh,082h,02dh,0c2h,02dh,092h,02ch,0b2h,02ch,082h,02bh,0c2h	; 7064  /.....-.-.,.,.+.
	defb 02bh,092h,02ah,0b2h,02ah,082h,029h,0c2h,029h,092h,028h,0b2h,028h,082h,027h,0c2h	; 7074  +.*.*.).).(.(.'.
	defb 027h,092h,026h,0b2h,026h,082h,025h,0c2h,024h,092h,023h,0b2h,022h,082h,021h,0c2h	; 7084  '.&.&.%.$.#.".!.
	defb 020h,092h,01fh,0b2h,01eh,082h,01dh,0c2h,01ch,092h,01bh,0b2h,01ah,082h,019h,0c2h	; 7094   ...............
	defb 018h,092h,017h,0b2h,016h,082h,015h,0c2h,014h,092h,013h,0b2h,012h,082h,011h,0c2h	; 70a4  ................
	defb 010h,092h,00fh,0b2h,00eh,082h,00dh,0c2h,00ch,092h,00bh,0b2h,00ah,082h,009h,0c2h	; 70b4  ................
	defb 008h,092h,007h,0b2h,006h,082h,005h,0c2h,000h,092h,000h,0b2h,000h,082h,000h,0feh	; 70c4  ................
	defb 01ah,0cbh,070h,0b2h,000h,082h,000h,0a2h,000h,072h,000h,0a2h,000h,082h,000h,092h	; 70d4  ..p......r......
	defb 000h,062h,000h,0a2h,000h,072h,000h,082h,000h,062h,000h,092h,000h,072h,000h,072h	; 70e4  .b...r...b...r.r
	defb 000h,052h,000h,082h,000h,062h,000h,062h,000h,0ffh	; 70f4  .R...b.b..

; ----------------------------------------------------------------------
; DATOS sonido_20_70FE: canal del sonido 0x20 (palabra 32 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (11
;   bytes)
;   0x70fe..0x7109  (11 bytes)
DATA_sonido_20_70FE:
	defb 0feh,000h,022h,001h,0d1h,000h,0d0h,080h,0d0h,040h,0ffh	; 70fe  .."......@.

; ----------------------------------------------------------------------
; DATOS sonido_21_7109: canal del sonido 0x21 (palabra 33 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (45
;   bytes)
;   0x7109..0x7136  (45 bytes)
DATA_sonido_21_7109:
	defb 0feh,000h,022h,001h,0d4h,000h,0d2h,000h,0d1h,000h,0d0h,080h,022h,002h,0d3h,000h	; 7109  .."........."...
	defb 0d1h,080h,0d0h,0c0h,0d0h,060h,0d0h,030h,0a3h,000h,0a1h,080h,0a0h,0c0h,0a0h,060h	; 7119  .....`.0.......`
	defb 0a0h,030h,073h,000h,071h,080h,070h,0c0h,070h,060h,070h,030h,0ffh	; 7129  .0s.q.p.p`p0.

; ----------------------------------------------------------------------
; DATOS sonido_22_7136: canal del sonido 0x22 (palabra 34 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (15
;   bytes)
;   0x7136..0x7145  (15 bytes)
DATA_sonido_22_7136:
	defb 0feh,000h,022h,001h,0a0h,0cah,0a0h,0a9h,0a1h,000h,0feh,006h,038h,071h,0ffh	; 7136  ..".........8q.

; ----------------------------------------------------------------------
; DATOS sonido_0B_7145: canal del sonido 0x0B (palabra 11 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (40
;   bytes)
;   0x7145..0x716d  (40 bytes)
DATA_sonido_0B_7145:
	defb 0feh,000h,023h,002h,010h,090h,020h,090h,021h,090h,022h,0a0h,023h,0a0h,024h,0a0h	; 7145  ..#... .!.".#.$.
	defb 025h,0b0h,026h,0b0h,027h,0b0h,028h,0b0h,029h,0c0h,02ah,0c0h,02bh,0c0h,02ch,0c0h	; 7155  %.&.'.(.).*.+.,.
	defb 02dh,0c0h,02eh,0d0h,02fh,0d0h,030h,0ffh	; 7165  -.../.0.

; ----------------------------------------------------------------------
; DATOS sonido_1D_716D: canal del sonido 0x1D (palabra 29 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (42
;   bytes)
;   0x716d..0x7197  (42 bytes)
DATA_sonido_1D_716D:
	defb 0feh,000h,023h,002h,013h,0e4h,000h,022h,002h,0e6h,000h,090h,028h,0e5h,000h,0e7h	; 716d  ..#...."....(...
	defb 000h,0e4h,000h,0e6h,000h,0e3h,060h,0c5h,000h,0c7h,000h,0c4h,000h,0c5h,000h,0c7h	; 717d  ......`.........
	defb 000h,094h,000h,095h,000h,097h,000h,094h,000h,0ffh	; 718d  ..........

; ----------------------------------------------------------------------
; DATOS sonido_04_7197: canal del sonido 0x04 (palabra 4 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (13 bytes)
;   0x7197..0x71a4  (13 bytes)
DATA_sonido_04_7197:
	defb 0feh,000h,022h,001h,0d0h,050h,0d0h,0a0h,0feh,008h,09bh,071h,0ffh	; 7197  .."..P.....q.

; ----------------------------------------------------------------------
; DATOS sonido_06_71A4: canal del sonido 0x06 (palabra 6 del indice): comandos
;   del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (14 bytes)
;   0x71a4..0x71b2  (14 bytes)
DATA_sonido_06_71A4:
	defb 0feh,000h,023h,002h,013h,0a1h,0d0h,0c1h,030h,0b1h,080h,082h,000h,0ffh	; 71a4  ..#.....0.....

; ----------------------------------------------------------------------
; DATOS sonido_29_71B2: canal del sonido 0x29 (palabra 41 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (1814
;   bytes)
;   0x71b2..0x78c8  (1814 bytes)
DATA_sonido_29_71B2:
	defb 0efh,0d7h,0fah,003h,0ech,053h,0e2h,033h,041h,0f7h,022h,041h,0e9h,004h,043h,0b3h	; 71b2  .....S.3A."A..C.
	defb 0e9h,005h,003h,0e9h,004h,093h,0b3h,073h,0ffh,0efh,0d7h,0fah,003h,0ech,053h,0e3h	; 71c2  .......s......S.
	defb 063h,071h,0f8h,022h,071h,0f9h,003h,0ech,063h,0e2h,077h,067h,027h,0ffh,0efh,0fah	; 71d2  cq."q...c.wg'...
	defb 012h,0e3h,0b1h,0b1h,0b1h,0f9h,021h,0b1h,0fah,012h,0b1h,0f9h,021h,0b1h,0ffh,0fbh	; 71e2  ......!.....!...
	defb 023h,0e2h,001h,001h,001h,0f9h,021h,001h,0fbh,023h,001h,0f9h,021h,001h,0ffh,0efh	; 71f2  #.....!..#..!...
	defb 0d7h,0fah,003h,0ech,053h,0e3h,0a3h,0b1h,0f7h,022h,0b1h,0e8h,0f6h,003h,0e2h,079h	; 7202  ....S....".....y
	defb 067h,025h,0ffh,0efh,0fah,012h,0e2h,051h,051h,051h,0f9h,031h,051h,0fah,012h,051h	; 7212  g%.....QQQ.1Q..Q
	defb 0f9h,021h,051h,0ffh,0efh,0fah,003h,0ech,062h,0e2h,051h,001h,051h,0e1h,009h,0e2h	; 7222  .!Q.....b.Q.Q...
	defb 061h,011h,061h,0ffh,0e9h,005h,051h,051h,051h,051h,051h,051h,051h,051h,061h,061h	; 7232  a.a...QQQQQQQQaa
	defb 061h,061h,0ffh,0d1h,0cdh,0e9h,001h,022h,023h,026h,026h,006h,02dh,026h,026h,02dh	; 7242  aa....."#&&.-&&-
	defb 02dh,0d7h,0e9h,005h,0b1h,0e9h,004h,0b1h,0efh,0fbh,022h,0ech,052h,0e2h,043h,0e5h	; 7252  -.........".R.C.
	defb 040h,040h,0e2h,040h,040h,041h,041h,071h,0b1h,092h,090h,0e1h,047h,021h,001h,0e2h	; 7262  @@.@@AAq....G!..
	defb 0bbh,0e1h,043h,0f9h,000h,037h,0f8h,000h,032h,0f7h,000h,032h,0f6h,000h,032h,0f5h	; 7272  ..C..7..2..2..2.
	defb 000h,032h,0cfh,0efh,0d7h,0c3h,0efh,0fah,003h,0ech,053h,0e2h,033h,041h,0f7h,022h	; 7282  .2........S.3A."
	defb 041h,0e9h,005h,043h,043h,043h,043h,043h,043h,0feh,002h,088h,072h,0feh,0ffh,0b2h	; 7292  A..CCCCCC...r...
	defb 071h,0feh,003h,09fh,072h,0efh,0fah,003h,0ech,053h,0e2h,033h,041h,0f7h,022h,041h	; 72a2  q...r....S.3A."A
	defb 0fch,036h,0e5h,043h,0b3h,0e4h,003h,0e5h,093h,0fbh,020h,0b3h,0f8h,000h,0b3h,0f7h	; 72b2  .6.C...... .....
	defb 000h,0b3h,0f6h,000h,0b3h,0f5h,000h,0b3h,0f4h,000h,0b3h,0efh,0fah,003h,0ech,053h	; 72c2  ...............S
	defb 0e2h,083h,091h,0f7h,022h,091h,0e9h,004h,093h,0e9h,005h,043h,053h,023h,043h,003h	; 72d2  ...."......CS#C.
	defb 0feh,002h,0cdh,072h,0feh,0ffh,0b2h,071h,0feh,002h,0e6h,072h,0e9h,005h,051h,051h	; 72e2  ...r...q...r..QQ
	defb 053h,053h,051h,051h,053h,053h,051h,051h,053h,0feh,004h,0eeh,072h,0e9h,005h,051h	; 72f2  SSQQSSQQS...r..Q
	defb 051h,051h,051h,051h,051h,051h,051h,061h,061h,061h,061h,061h,061h,061h,061h,0feh	; 7302  QQQQQQQaaaaaaaa.
	defb 002h,0ffh,072h,0feh,0ffh,026h,072h,0e1h,019h,0feh,0ffh,026h,072h,0e1h,011h,0e2h	; 7312  ..r..&r....&r...
	defb 071h,021h,071h,0e1h,021h,0fah,012h,0ech,053h,0e2h,02bh,043h,075h,065h,073h,095h	; 7322  q!q.!...S.+Cues.
	defb 051h,09fh,073h,093h,0bbh,0b3h,095h,075h,063h,070h,060h,049h,023h,040h,060h,070h	; 7332  Q.s....ucp`I#@`p
	defb 060h,04bh,02bh,0e1h,043h,0e2h,0b5h,095h,073h,095h,051h,09fh,073h,093h,0b5h,071h	; 7342  `K+.C...s.Q.s..q
	defb 0e1h,047h,0e2h,0b5h,071h,0e1h,047h,0fah,02fh,0e3h,070h,072h,0f8h,02fh,070h,072h	; 7352  .G..q.G./.pr./pr
	defb 0f6h,02fh,070h,072h,0f4h,02fh,070h,072h,0c1h,0f9h,02fh,090h,092h,0f7h,02fh,090h	; 7362  ./pr./pr../.../.
	defb 092h,0f5h,02fh,090h,092h,0f3h,02fh,090h,092h,090h,092h,090h,092h,0feh,0feh,09fh	; 7372  ../.../.........
	defb 072h,0d7h,0c1h,0e9h,001h,000h,000h,009h,0b1h,0b1h,0efh,0fch,023h,0e4h,043h,040h	; 7382  r...........#.C@
	defb 040h,041h,023h,023h,010h,010h,0e3h,010h,0e4h,010h,010h,0e3h,010h,0e4h,010h,010h	; 7392  @A##............
	defb 001h,001h,0e3h,001h,0e4h,001h,0e5h,0b3h,0b3h,0b3h,0d2h,0fah,000h,0e5h,0b1h,0e4h	; 73a2  ................
	defb 000h,010h,020h,030h,040h,050h,060h,070h,080h,090h,0a0h,0b0h,0d7h,0f9h,000h,0ech	; 73b2  .. 0@P`p........
	defb 054h,0b7h,0f8h,000h,0b2h,0f7h,000h,0b2h,0f6h,000h,0b2h,0f5h,000h,0b2h,0cfh,0efh	; 73c2  T...............
	defb 0d7h,0c3h,0efh,0fah,003h,0ech,053h,0e3h,0a3h,0b1h,0f7h,022h,0b1h,0e9h,004h,043h	; 73d2  ......S...."...C
	defb 043h,043h,043h,043h,043h,0feh,002h,0d4h,073h,0feh,0ffh,0cbh,071h,0feh,003h,0ebh	; 73e2  CCCCC...s...q...
	defb 073h,0efh,0fah,003h,0ech,053h,0e3h,063h,071h,0f8h,022h,071h,0f9h,003h,0ech,063h	; 73f2  s....S.cq."q...c
	defb 0e2h,077h,067h,0fah,020h,023h,0f7h,000h,023h,0f6h,000h,023h,0f5h,000h,023h,0f4h	; 7402  .wg. #..#..#..#.
	defb 000h,023h,0f3h,000h,023h,0efh,0fah,003h,0ech,053h,0e2h,033h,041h,0f8h,022h,041h	; 7412  .#..#....S.3A."A
	defb 0f9h,003h,0ech,072h,0e1h,007h,0e2h,0b7h,097h,0feh,002h,017h,074h,0feh,0ffh,0cbh	; 7422  ...r........t...
	defb 071h,0feh,002h,02fh,074h,0feh,0ffh,0e0h,071h,0feh,0ffh,0e0h,071h,0fah,012h,0b1h	; 7432  q../t...q...q...
	defb 0b1h,0b1h,0f9h,021h,0b1h,0feh,0ffh,0f1h,071h,0feh,0ffh,0f1h,071h,0fah,012h,001h	; 7442  ...!....q...q...
	defb 001h,001h,0f9h,021h,001h,0feh,002h,037h,074h,0f6h,000h,0ech,061h,0e1h,050h,0f7h	; 7452  ...!...7t...a.P.
	defb 000h,050h,0f8h,000h,050h,0f9h,003h,05ch,0f6h,000h,040h,0f7h,000h,040h,0f8h,000h	; 7462  .P..P..\..@..@..
	defb 040h,0f9h,003h,04ch,0feh,002h,05bh,074h,0feh,0ffh,036h,072h,061h,061h,061h,061h	; 7472  @..L..[t..6raaaa
	defb 0feh,0ffh,036h,072h,071h,071h,071h,071h,0efh,0e9h,005h,041h,0feh,010h,08ah,074h	; 7482  ..6rqqqq...A...t
	defb 0efh,0e9h,005h,051h,0feh,010h,092h,074h,041h,0feh,008h,09ah,074h,021h,0feh,008h	; 7492  ...Q...tA...t!..
	defb 09fh,074h,001h,001h,001h,001h,000h,0e9h,004h,070h,0e9h,005h,000h,040h,070h,040h	; 74a2  .t.......p...@p@
	defb 000h,040h,021h,021h,021h,021h,020h,0e9h,004h,090h,0e9h,005h,020h,060h,090h,060h	; 74b2  .@!!!! ..... `.`
	defb 020h,060h,0efh,0fch,033h,0e4h,041h,040h,040h,0feh,008h,0c7h,074h,051h,050h,050h	; 74c2   `..3.A@@...tQPP
	defb 0feh,008h,0cfh,074h,042h,040h,0b1h,0e3h,043h,0e4h,041h,0b1h,0e3h,041h,0e4h,022h	; 74d2  ...tB@..C.A..A."
	defb 020h,091h,0e3h,023h,0e4h,021h,091h,0e3h,021h,0fch,02fh,0e3h,000h,002h,0f9h,02fh	; 74e2   ..#.!..!./..../
	defb 000h,002h,0f7h,02fh,000h,002h,0f5h,02fh,000h,002h,0fbh,02fh,020h,022h,0f9h,02fh	; 74f2  .../.../.../ "./
	defb 020h,022h,0f7h,02fh,020h,022h,0f5h,02fh,020h,022h,020h,022h,020h,022h,020h,020h	; 7502   "./ "./ " " "
	defb 0feh,0feh,0ebh,073h,0d7h,0fbh,021h,0e3h,0c1h,0cfh,0b3h,0e9h,001h,030h,030h,010h	; 7512  ...s..!......00.
	defb 0efh,0b0h,0b1h,0b1h,0e2h,021h,071h,042h,040h,093h,073h,071h,071h,0fah,011h,040h	; 7522  .....!qB@.sqq..@
	defb 0e3h,0b0h,090h,0feh,005h,02fh,075h,040h,0b0h,0e2h,030h,060h,090h,0b0h,0e1h,030h	; 7532  ...../u@..0`...0
	defb 060h,090h,0f7h,000h,0b2h,0f6h,000h,0b2h,0f5h,000h,0b2h,0f4h,000h,0b2h,0cfh,0efh	; 7542  `...............
	defb 0d7h,0c3h,0efh,0fah,003h,0ech,053h,0e3h,063h,071h,0f7h,022h,071h,0e9h,001h,0b3h	; 7552  ......S.cq."q...
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0feh,002h,054h,075h,0feh,0ffh,001h,072h,0feh,003h,06bh	; 7562  .......Tu...r..k
	defb 075h,0efh,0fah,003h,0ech,053h,0e3h,0a3h,0b1h,0f7h,022h,0b1h,0e8h,0f7h,003h,0e2h	; 7572  u....S....".....
	defb 079h,065h,0f8h,020h,023h,0f5h,000h,023h,0f4h,000h,023h,0f3h,000h,023h,0f2h,000h	; 7582  ye. #..#..#..#..
	defb 027h,0efh,0fah,003h,0ech,053h,0e3h,0b3h,0e2h,001h,0f7h,022h,001h,0f8h,003h,0ech	; 7592  '....S....."....
	defb 072h,097h,087h,047h,0feh,002h,093h,075h,0feh,0ffh,001h,072h,0feh,002h,0aah,075h	; 75a2  r..G...u...r...u
	defb 0feh,0ffh,015h,072h,0feh,0ffh,015h,072h,0fah,012h,051h,051h,051h,0f9h,021h,051h	; 75b2  ...r...r..QQQ.!Q
	defb 0feh,004h,0b2h,075h,0efh,0f6h,000h,0ech,061h,0e2h,0b0h,0f7h,000h,0b0h,0f8h,000h	; 75c2  ...u....a.......
	defb 0b0h,0f9h,003h,0bch,0f6h,000h,0e1h,010h,0f7h,000h,010h,0f8h,000h,010h,0f9h,003h	; 75d2  ................
	defb 01ch,0feh,002h,0c6h,075h,0e8h,0f9h,002h,0ech,062h,0e2h,053h,001h,051h,051h,001h	; 75e2  ....u....b.S.QQ.
	defb 051h,0e1h,003h,0e2h,061h,011h,061h,061h,011h,061h,0e1h,013h,0e2h,051h,001h,051h	; 75f2  Q...a.aa.a...Q.Q
	defb 051h,001h,051h,0e1h,003h,0e2h,061h,011h,061h,0e1h,011h,0e2h,071h,021h,071h,0f9h	; 7602  Q.Q...a.a...q!q.
	defb 012h,0ech,054h,0e3h,09bh,0b3h,0e2h,045h,025h,0e3h,0b3h,0e2h,005h,001h,05fh,043h	; 7612  ..T....E%....._C
	defb 053h,07bh,073h,065h,045h,023h,040h,020h,00bh,001h,0e3h,091h,091h,09bh,0ech,053h	; 7622  S{seE#@ .......S
	defb 0e3h,075h,045h,0fah,012h,0e2h,073h,075h,065h,043h,005h,001h,05fh,0e3h,0b3h,093h	; 7632  .uE...sueC.._...
	defb 075h,071h,077h,065h,061h,067h,0fbh,02fh,0e3h,040h,042h,0f9h,02fh,040h,042h,0f7h	; 7642  uqweag./.@B./@B.
	defb 02fh,040h,042h,0f5h,02fh,040h,042h,0fbh,02fh,060h,062h,0f9h,02fh,060h,062h,0f7h	; 7652  /@B./@B./`b./`b.
	defb 02fh,060h,062h,0f5h,02fh,060h,062h,060h,062h,060h,062h,060h,060h,0feh,0feh,06bh	; 7662  /`b./`b`b`b``..k
	defb 075h,0feh,000h,022h,001h,0b1h,078h,0b1h,070h,0b1h,060h,0b1h,050h,0b1h,040h,0b1h	; 7672  u.."..x.p.`.P.@.
	defb 030h,0b1h,020h,0b1h,010h,0b1h,000h,0b0h,0f0h,0b0h,0e0h,0b0h,0d0h,0b0h,0c0h,022h	; 7682  0. ............"
	defb 003h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h,0aeh,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h	; 7692  ................
	defb 0aeh,022h,001h,0b0h,0b0h,0b0h,0c0h,0b0h,0d0h,0b0h,0e0h,0b0h,0f0h,0b1h,000h,0b1h	; 76a2  ."..............
	defb 010h,0b1h,020h,0b1h,030h,0b1h,040h,0b1h,050h,0b1h,060h,0b1h,078h,022h,007h,0b0h	; 76b2  .. .0.@.P.`.x"..
	defb 000h,0feh,004h,075h,076h,0feh,000h,0d1h,0fah,000h,0e2h,0c0h,0feh,0feh,0d8h,078h	; 76c2  ...uv..........x
	defb 0feh,000h,022h,001h,0b1h,079h,0b1h,079h,0b1h,071h,0b1h,061h,0b1h,051h,0b1h,041h	; 76d2  .."..y.y.q.a.Q.A
	defb 0b1h,031h,0b1h,021h,0b1h,011h,0b1h,001h,0b0h,0f1h,0bbh,0e1h,0b0h,0d1h,0b0h,0c1h	; 76e2  .1.!............
	defb 022h,003h,0b0h,0b1h,0b0h,0b3h,0b0h,0b1h,0b0h,0afh,0b0h,0b1h,0b0h,0b3h,0b0h,0b1h	; 76f2  "...............
	defb 0b0h,0afh,022h,001h,0b0h,0b1h,0b0h,0c1h,0b0h,0d1h,0b0h,0e1h,0b0h,0f1h,0b1h,001h	; 7702  ..".............
	defb 0b1h,011h,0b1h,021h,0b1h,031h,0b1h,041h,0b1h,051h,0b1h,061h,0b1h,079h,022h,006h	; 7712  ...!.1.A.Q.a.y".
	defb 000h,000h,0feh,004h,0d4h,076h,0feh,000h,0d1h,0fah,000h,0e2h,0c0h,0feh,0feh,068h	; 7722  .....v.........h
	defb 079h,0feh,000h,022h,001h,0b1h,07ah,0b1h,07ah,0b1h,07ah,0b1h,072h,0b1h,062h,0b1h	; 7732  y.."..z.z.z.r.b.
	defb 052h,0b1h,042h,0b1h,032h,0b1h,022h,0b1h,012h,0b1h,002h,0b0h,0f2h,0b0h,0e2h,0b0h	; 7742  R.B.2.".........
	defb 0d2h,0b0h,0c2h,022h,003h,0b0h,0b2h,0b0h,0b4h,0b0h,0b2h,0b0h,0b0h,0b0h,0b2h,0b0h	; 7752  ..."............
	defb 0b4h,0b0h,0b2h,0b0h,0b0h,022h,001h,0b0h,0b2h,0b0h,0c2h,0b0h,0d2h,0b0h,0e2h,0b0h	; 7762  ....."..........
	defb 0f2h,0b1h,002h,0b1h,012h,0b1h,022h,0b1h,032h,0b1h,042h,0b1h,052h,0b1h,062h,0b1h	; 7772  ......".2.B.R.b.
	defb 07ah,022h,005h,000h,000h,0feh,004h,035h,077h,0feh,000h,0d1h,0fah,000h,0e2h,0c0h	; 7782  z".....5w.......
	defb 0feh,0feh,01ch,07ah,0efh,0d5h,0fbh,022h,0ech,052h,0e2h,0b1h,040h,040h,041h,091h	; 7792  ...z...".R..@@A.
	defb 040h,040h,041h,0b1h,0e1h,001h,0e2h,0b1h,0ffh,0e8h,0fch,031h,0ech,052h,0e3h,0b3h	; 77a2  @@A........1.R..
	defb 0e2h,043h,073h,061h,021h,045h,075h,0b3h,090h,0c0h,049h,0f9h,022h,043h,0fch,031h	; 77b2  .Csa!Eu...I."C.1
	defb 0e3h,040h,040h,041h,040h,040h,041h,041h,041h,060h,090h,0e2h,021h,0e3h,0b3h,0e2h	; 77c2  .@@A@@AAA`..!...
	defb 043h,0ffh,0e8h,0fch,031h,0ech,052h,0e5h,020h,040h,0e2h,071h,0c0h,071h,070h,091h	; 77d2  C...1.R. @.q.qp.
	defb 063h,021h,070h,0c0h,071h,040h,070h,0e1h,001h,0e2h,090h,0c0h,091h,060h,090h,0e1h	; 77e2  c!p.q@p......`..
	defb 021h,0e5h,020h,040h,0e2h,071h,0c0h,071h,070h,091h,0ffh,0fdh,032h,0e4h,041h,041h	; 77f2  !. @.q.qp...2.AA
	defb 041h,040h,040h,041h,041h,041h,040h,040h,071h,071h,071h,070h,070h,071h,071h,071h	; 7802  A@@AAA@@qqqppqqq
	defb 070h,070h,091h,091h,091h,090h,090h,091h,091h,091h,090h,090h,001h,001h,000h,000h	; 7812  pp..............
	defb 001h,001h,001h,020h,020h,021h,041h,041h,041h,040h,040h,041h,041h,041h,040h,040h	; 7822  ...  !AAA@@AAA@@
	defb 0ffh,0fdh,032h,0e4h,020h,020h,041h,041h,040h,040h,021h,021h,021h,020h,020h,001h	; 7832  ..2.  AA@@!!!  .
	defb 001h,001h,000h,000h,021h,021h,020h,020h,021h,020h,040h,041h,040h,041h,040h,071h	; 7842  ....!!  ! @A@A@q
	defb 021h,020h,020h,0ffh,0d5h,0fbh,022h,0ech,052h,0e2h,071h,0e9h,001h,000h,000h,011h	; 7852  !  ...".R.q.....
	defb 0efh,061h,0e9h,001h,000h,000h,011h,0efh,071h,091h,071h,0e9h,001h,000h,000h,011h	; 7862  .a......q.q.....
	defb 0ffh,0fch,041h,0ech,052h,0e3h,073h,0b3h,0e2h,043h,021h,0e3h,091h,0b5h,0e2h,045h	; 7872  ..A.R.s..C!....E
	defb 073h,040h,0c0h,019h,0e9h,001h,080h,080h,081h,0efh,0e3h,070h,070h,071h,070h,070h	; 7882  s@.........ppqpp
	defb 071h,071h,071h,020h,060h,091h,0e3h,073h,0b3h,0ffh,0e9h,001h,0b0h,0b0h,0efh,0fch	; 7892  qqq `..s........
	defb 041h,0ech,052h,0e2h,041h,0c0h,041h,040h,061h,023h,0e3h,091h,0e2h,040h,0c0h,041h	; 78a2  A.R.A.A@a#...@.A
	defb 0e3h,0b0h,0e2h,040h,071h,060h,0c0h,061h,020h,060h,091h,0e9h,001h,0b0h,0b0h,0efh	; 78b2  ...@q`.a `......
	defb 041h,0c0h,041h,040h,061h,0ffh	; 78c2

; ----------------------------------------------------------------------
; DATOS sonido_32_78C8: canal del sonido 0x32 (palabra 50 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (16
;   bytes)
;   0x78c8..0x78d8  (16 bytes)
DATA_sonido_32_78C8:
	defb 0d3h,0fbh,011h,0e3h,060h,090h,0e2h,000h,030h,060h,090h,0e1h,000h,030h,067h,0c7h	; 78c8  ....`...0`...0g.

; ----------------------------------------------------------------------
; DATOS sonido_29_78D8: canal del sonido 0x29 (palabra 41 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (499
;   bytes)
;   0x78d8..0x7acb  (499 bytes)
DATA_sonido_29_78D8:
	defb 0feh,0ffh,096h,077h,040h,040h,041h,091h,040h,040h,041h,061h,071h,0feh,0ffh,096h	; 78d8  ...w@@A.@@Aaq...
	defb 077h,0e3h,0b0h,0b0h,0b1h,0e1h,001h,0e3h,0b0h,0b0h,0b1h,0e1h,023h,0feh,0ffh,0abh	; 78e8  w...........#...
	defb 077h,071h,021h,041h,061h,075h,025h,0e1h,023h,01fh,0e2h,021h,020h,010h,020h,010h	; 78f8  wq!Aau%.#..! . .
	defb 020h,040h,061h,060h,040h,060h,040h,060h,0b0h,0feh,0ffh,0abh,077h,072h,040h,061h	; 7908   @a`@`@`....wr@a
	defb 091h,0b5h,091h,073h,093h,075h,060h,040h,077h,095h,070h,060h,043h,063h,0feh,0ffh	; 7918  ...s.u`@w.p`Cc..
	defb 0d4h,077h,063h,021h,072h,070h,0e1h,023h,0e1h,012h,010h,0e1h,043h,0feh,0ffh,0d4h	; 7928  .wc!rp.#....C...
	defb 077h,071h,061h,021h,0fbh,012h,040h,060h,070h,090h,0b0h,090h,070h,060h,040h,060h	; 7938  wqa!..@`p...p`@`
	defb 070h,090h,0b0h,090h,070h,040h,0fch,031h,093h,073h,063h,033h,0feh,0feh,0d8h,078h	; 7948  p...p@.1.sc3...x
	defb 0d3h,0fbh,011h,0e3h,030h,060h,090h,0e2h,000h,030h,060h,090h,0e1h,000h,037h,0c7h	; 7958  ....0`...0`...7.
	defb 0d5h,0fdh,032h,0e4h,041h,041h,040h,040h,041h,041h,041h,040h,040h,041h,021h,021h	; 7968  ..2.AA@@AAA@@A!!
	defb 020h,020h,021h,021h,021h,020h,020h,021h,001h,001h,000h,000h,001h,001h,001h,000h	; 7978    !!!  !........
	defb 000h,001h,0e5h,0b1h,0b1h,0b0h,0b0h,0b1h,0e4h,001h,001h,0e5h,0b0h,0b0h,0b1h,0feh	; 7988  ................
	defb 0ffh,0fdh,077h,071h,071h,071h,070h,070h,071h,071h,071h,070h,070h,091h,091h,091h	; 7998  ..wqqqppqqqpp...
	defb 090h,090h,091h,091h,091h,090h,090h,0b1h,0b1h,0b1h,0b0h,0b0h,091h,091h,070h,070h	; 79a8  ..............pp
	defb 061h,0feh,0ffh,0fdh,077h,021h,021h,021h,020h,020h,021h,021h,021h,020h,020h,001h	; 79b8  a...w!!!  !!!  .
	defb 001h,001h,000h,000h,001h,001h,001h,000h,000h,021h,021h,021h,020h,020h,021h,021h	; 79c8  .........!!!  !!
	defb 020h,060h,090h,060h,0feh,0ffh,033h,078h,021h,071h,071h,070h,070h,071h,091h,091h	; 79d8   `.`..3x!qqppq..
	defb 090h,090h,091h,0feh,0ffh,033h,078h,071h,0b0h,0b0h,0b1h,0b0h,0b0h,0b1h,0b1h,0b1h	; 79e8  .....3xq........
	defb 0b0h,0b0h,0b0h,0b0h,090h,0b0h,0b1h,0b0h,0b0h,0b1h,091h,091h,070h,070h,060h,060h	; 79f8  ............pp``
	defb 0feh,0feh,068h,079h,0d3h,0fbh,011h,0e3h,000h,030h,060h,090h,0e2h,000h,030h,060h	; 7a08  ..hy.....0`...0`
	defb 090h,0e1h,007h,0c7h,0feh,0ffh,056h,078h,0efh,061h,0e9h,001h,000h,000h,011h,0efh	; 7a18  ......Vx.a......
	defb 021h,041h,0feh,0ffh,056h,078h,0efh,091h,0e9h,001h,000h,000h,011h,0efh,0b3h,0feh	; 7a28  !A..Vx..........
	defb 0ffh,073h,078h,0e2h,041h,0e3h,091h,0b1h,0e2h,021h,045h,0e3h,075h,063h,041h,040h	; 7a38  .sx.A....!E.ucA@
	defb 010h,040h,010h,040h,060h,071h,070h,060h,070h,060h,070h,090h,0b1h,0b0h,090h,0b0h	; 7a48  .@.@`qp`p`p.....
	defb 090h,0b0h,0e2h,000h,021h,020h,0e3h,0b0h,0e2h,020h,0e3h,0b0h,0e2h,020h,060h,0feh	; 7a58  ....! ... ... `.
	defb 0ffh,073h,078h,0e2h,042h,0e3h,0b0h,0e2h,021h,061h,075h,061h,043h,063h,045h,020h	; 7a68  .sx.B...!auaCcE
	defb 0e3h,0b0h,0e2h,047h,065h,040h,020h,0e3h,0b3h,020h,060h,090h,060h,0feh,0ffh,09ch	; 7a78  ...Ge@ .. `.`...
	defb 078h,023h,0e3h,091h,0e2h,042h,040h,0b3h,092h,090h,093h,0feh,0ffh,09ch,078h,041h	; 7a88  x#...B@.......xA
	defb 0e3h,091h,091h,0f9h,002h,0e2h,042h,060h,070h,090h,0b0h,090h,070h,060h,040h,060h	; 7a98  ......B`p...p`@`
	defb 080h,090h,0b0h,090h,0efh,0fch,041h,0ech,052h,063h,043h,033h,0e3h,0b3h,0feh,0feh	; 7aa8  ......A.RcC3....
	defb 01ch,07ah,0fbh,023h,0e2h,0b0h,0b0h,0b1h,0f9h,023h,0e3h,0b0h,0b0h,0b1h,0f8h,023h	; 7ab8  .z.#.....#.....#
	defb 0b0h,0b0h,0ffh	; 7ac8

; ----------------------------------------------------------------------
; DATOS sonido_35_7ACB: canal del sonido 0x35 (palabra 53 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (480
;   bytes)
;   0x7acb..0x7cab  (480 bytes)
DATA_sonido_35_7ACB:
	defb 0fbh,023h,0e2h,040h,040h,041h,0f9h,023h,0e3h,040h,040h,041h,0f8h,023h,040h,040h	; 7acb  .#.@@A.#.@@A.#@@
	defb 0ffh,0d9h,0c1h,0ech,053h,0d9h,0fbh,023h,0e2h,0b7h,0e1h,027h,017h,0e2h,097h,0e1h	; 7adb  ....S..#...'....
	defb 007h,0e2h,0b7h,067h,097h,0bfh,0e1h,00fh,0e2h,0b3h,0e1h,043h,053h,0b3h,0e0h,02fh	; 7aeb  ...g.......CS../
	defb 0feh,0ffh,0bah,07ah,0b1h,0feh,002h,0fbh,07ah,0fbh,023h,0e2h,0b0h,0b0h,0b1h,0b0h	; 7afb  ...z....z.#.....
	defb 0b0h,0b1h,0feh,0ffh,0bah,07ah,0b0h,0f7h,021h,0e2h,0b0h,0f9h,021h,0b0h,0fah,021h	; 7b0b  .....z..!...!..!
	defb 0b0h,0fbh,021h,0b0h,0fch,021h,0b0h,0efh,0fbh,021h,0e2h,0b0h,0e1h,040h,050h,0b0h	; 7b1b  ..!..!...!...@P.
	defb 000h,050h,060h,0e0h,000h,0feh,002h,022h,07bh,0efh,0fbh,022h,0e2h,0b0h,0b0h,0fch	; 7b2b  .P`...."{.."....
	defb 022h,0b1h,0fbh,022h,0b0h,0b0h,0b1h,0f8h,023h,0b0h,0f9h,023h,0b0h,0fah,023h,0b0h	; 7b3b  ".."....#..#..#.
	defb 0fbh,023h,0b0h,0fch,022h,0b0h,0fah,023h,0b0h,0f9h,023h,0b0h,0f8h,023h,0b0h,0feh	; 7b4b  .#.."..#..#..#..
	defb 0feh,0deh,07ah,0d9h,0c1h,0d9h,0fch,021h,0e5h,0b3h,0e4h,003h,043h,033h,0feh,002h	; 7b5b  ..z....!....C3..
	defb 060h,07bh,0e5h,0b3h,0e4h,043h,033h,0b3h,0e5h,0b3h,0e4h,003h,043h,033h,0fch,023h	; 7b6b  `{...C3.....C3.#
	defb 0e4h,041h,0fbh,021h,041h,0fch,023h,051h,0fbh,021h,051h,0fch,023h,091h,0fbh,021h	; 7b7b  .A.!A.#Q.!Q.#..!
	defb 091h,0fch,023h,081h,0fbh,021h,081h,0feh,004h,079h,07bh,0fch,023h,043h,053h,0feh	; 7b8b  ..#..!...y{.#CS.
	defb 005h,096h,07bh,043h,0f7h,021h,050h,0f9h,021h,050h,0fah,021h,050h,0fbh,021h,050h	; 7b9b  ..{C.!P.!P.!P.!P
	defb 0efh,0fch,021h,0e5h,0b0h,0e4h,040h,050h,0b0h,000h,050h,0b0h,000h,0feh,002h,0abh	; 7bab  ..!...@P..P.....
	defb 07bh,0efh,0e3h,000h,000h,001h,000h,000h,001h,0f8h,023h,0e4h,0b0h,0f9h,023h,0b0h	; 7bbb  {.........#...#.
	defb 0fah,023h,0b0h,0fbh,023h,0b0h,0fch,022h,0b0h,0fah,023h,040h,0f9h,023h,0b0h,0f8h	; 7bcb  .#..#.."..#@.#..
	defb 023h,040h,0feh,0feh,060h,07bh,0d9h,0c1h,0e8h,0ech,043h,0d9h,0f9h,023h,0e2h,090h	; 7bdb  #@..`{....C..#..
	defb 0a0h,0b7h,0e1h,027h,017h,0e2h,097h,0e1h,007h,0e2h,0b7h,067h,097h,0ech,053h,0bfh	; 7beb  ...'.......g..S.
	defb 0e1h,00dh,0d3h,0f5h,000h,080h,070h,080h,0b0h,090h,0b0h,070h,0f6h,000h,080h,070h	; 7bfb  ......p....p...p
	defb 080h,0f7h,000h,0b0h,090h,0b0h,070h,0f8h,000h,080h,070h,080h,0f9h,000h,0b0h,080h	; 7c0b  ......p...p.....
	defb 0b0h,070h,0f8h,000h,080h,070h,080h,0f7h,000h,0b0h,080h,0b0h,070h,0f6h,000h,080h	; 7c1b  .p...p......p...
	defb 070h,080h,0f5h,000h,0b0h,080h,0b0h,0c1h,0d9h,0f9h,020h,0e2h,053h,0b3h,0e1h,043h	; 7c2b  p......... .S..C
	defb 0b3h,0e0h,023h,0feh,0ffh,0cbh,07ah,041h,0feh,002h,03eh,07ch,0fbh,023h,040h,040h	; 7c3b  ..#...zA..>|.#@@
	defb 041h,040h,040h,041h,0feh,0ffh,0cbh,07ah,040h,0f7h,023h,040h,0f8h,023h,040h,0f9h	; 7c4b  A@@A...z@.#@.#@.
	defb 023h,040h,0fah,023h,040h,0fbh,023h,040h,0efh,0fch,023h,0e4h,0b0h,0e3h,040h,050h	; 7c5b  #@.#@.#@..#...@P
	defb 0b0h,0e3h,000h,050h,060h,0e2h,000h,0feh,002h,063h,07ch,0efh,0fch,022h,0e3h,040h	; 7c6b  ...P`....c|..".@
	defb 040h,041h,040h,040h,041h,0f8h,023h,040h,0f9h,023h,040h,0fah,023h,040h,0fbh,023h	; 7c7b  @A@@A.#@.#@.#@.#
	defb 040h,0fch,022h,040h,0fah,023h,040h,0f9h,023h,040h,0f8h,023h,040h,0feh,0feh,0e3h	; 7c8b  @."@.#@.#@.#@...
	defb 07bh,0efh,0fch,024h,0e4h,071h,070h,070h,0e9h,001h,0a1h,0efh,0e4h,070h,070h,0ffh	; 7c9b  {..$.qpp.....pp.

; ----------------------------------------------------------------------
; DATOS sonido_3B_7CAB: canal del sonido 0x3B (palabra 59 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF; lo leen p04:60B1 (634
;   bytes)
;   0x7cab..0x7f25  (634 bytes)
DATA_sonido_3B_7CAB:
	defb 0e3h,001h,000h,000h,0e9h,001h,0a1h,0efh,0e4h,000h,000h,0ffh,0efh,0e4h,021h,020h	; 7cab  ..............!
	defb 020h,0e9h,001h,0a1h,0a1h,0ffh,051h,050h,050h,0e9h,001h,0a1h,0efh,050h,050h,0ffh	; 7cbb   .....QPP....PP.
	defb 041h,040h,040h,0e9h,001h,0a1h,0efh,040h,040h,0ffh,0d5h,0fbh,012h,0e1h,071h,021h	; 7ccb  A@@....@@.....q!
	defb 0e2h,0a1h,0e1h,071h,021h,0e2h,0a1h,0e1h,071h,021h,0ffh,0efh,0fbh,012h,0e1h,021h	; 7cdb  ...q!...q!.....!
	defb 0e2h,0a1h,071h,0e1h,021h,0e2h,0a1h,071h,0e1h,021h,0e2h,0a1h,0ffh,021h,020h,020h	; 7ceb  ..q.!..q.!...!
	defb 021h,020h,020h,051h,050h,050h,051h,050h,0ffh,050h,070h,090h,0a0h,090h,0a0h,0e1h	; 7cfb  !  QPPQP.Pp.....
	defb 000h,0ffh,0a0h,0a1h,0a0h,070h,071h,070h,040h,041h,040h,070h,071h,0ffh,0fch,023h	; 7d0b  .....pqp@A@pq..#
	defb 0e2h,021h,020h,020h,021h,020h,020h,061h,060h,060h,061h,060h,060h,091h,090h,090h	; 7d1b  .!  !  a``a``...
	defb 091h,0ffh,0d5h,0feh,023h,0e4h,0c3h,051h,051h,051h,051h,061h,061h,061h,061h,0feh	; 7d2b  ....#..QQQQaaaa.
	defb 0ffh,09ch,07ch,0feh,008h,03ah,07dh,0feh,0ffh,0abh,07ch,0feh,004h,042h,07dh,0feh	; 7d3b  ..|..:}...|..B}.
	defb 0ffh,0b7h,07ch,0feh,004h,04ah,07dh,0feh,0ffh,09ch,07ch,0feh,008h,052h,07dh,0feh	; 7d4b  ..|..J}...|..R}.
	defb 0ffh,0abh,07ch,0feh,004h,05ah,07dh,0feh,0ffh,0b7h,07ch,0feh,004h,062h,07dh,0feh	; 7d5b  ..|..Z}...|..b}.
	defb 0ffh,09ch,07ch,0feh,0ffh,09ch,07ch,0feh,0ffh,0c1h,07ch,0feh,0ffh,0c1h,07ch,0feh	; 7d6b  ..|...|...|...|.
	defb 0ffh,0cbh,07ch,0feh,0ffh,0cbh,07ch,031h,030h,030h,0e9h,001h,0a1h,0efh,070h,0a0h	; 7d7b  ..|...|100....p.
	defb 051h,050h,050h,0e9h,001h,0a1h,0efh,090h,0e3h,000h,0feh,002h,06ah,07dh,0feh,0feh	; 7d8b  QPP.........j}..
	defb 03ah,07dh,0d5h,0f9h,003h,0ech,051h,0e1h,0c3h,001h,001h,0fah,003h,001h,001h,0fbh	; 7d9b  :}....Q.........
	defb 003h,011h,011h,011h,011h,0efh,0fbh,012h,0e2h,070h,090h,0a0h,0e1h,020h,0feh,008h	; 7dab  .........p... ..
	defb 0b0h,07dh,0e2h,070h,090h,0a0h,0e1h,010h,0feh,008h,0bdh,07dh,0e2h,070h,090h,0a0h	; 7dbb  .}.p.......}.p..
	defb 0e1h,000h,0feh,008h,0c7h,07dh,0e1h,000h,000h,0e2h,0b0h,0b0h,0a0h,0a0h,090h,090h	; 7dcb  .....}..........
	defb 0e1h,010h,010h,000h,000h,0e2h,0b0h,0b0h,0a0h,0a0h,070h,070h,060h,060h,050h,050h	; 7ddb  ..........pp``PP
	defb 040h,040h,0e1h,030h,030h,020h,020h,010h,010h,000h,000h,0e2h,070h,090h,0a0h,0e1h	; 7deb  @@.00  .....p...
	defb 020h,0feh,008h,0f6h,07dh,0e2h,070h,090h,0a0h,0e1h,010h,0feh,008h,000h,07eh,0e2h	; 7dfb   ...}.p.......~.
	defb 070h,090h,0a0h,0e1h,000h,0feh,008h,00ah,07eh,0feh,0ffh,019h,07dh,090h,090h,0e1h	; 7e0b  p.......~...}...
	defb 001h,000h,000h,001h,060h,0e8h,060h,0feh,0ffh,0d5h,07ch,0efh,000h,0feh,0ffh,0f8h	; 7e1b  ....`.`...|.....
	defb 07ch,071h,041h,0e2h,0a1h,0e1h,051h,041h,0e2h,071h,0a1h,091h,070h,0feh,0ffh,004h	; 7e2b  |qA...QA.q..p...
	defb 07dh,020h,000h,020h,030h,050h,030h,050h,060h,0feh,0ffh,0d5h,07ch,090h,090h,051h	; 7e3b  } . 0P0P`...|..Q
	defb 001h,091h,050h,050h,001h,091h,051h,0feh,0ffh,00dh,07dh,070h,0a1h,0a0h,0a0h,070h	; 7e4b  ..PP..Q...}p...p
	defb 030h,0e2h,0a0h,070h,091h,090h,090h,050h,000h,0e2h,050h,090h,0feh,0feh,0b0h,07dh	; 7e5b  0..p...P..P....}
	defb 0d5h,0fch,023h,0e5h,0c3h,051h,051h,0e9h,001h,0a3h,0efh,061h,061h,0e9h,001h,0a3h	; 7e6b  ..#..QQ....aa...
	defb 0efh,0fbh,012h,0e2h,020h,050h,070h,0a0h,0feh,010h,07ch,07eh,0e2h,020h,050h,070h	; 7e7b  .... Pp...|~. Pp
	defb 090h,0feh,008h,087h,07eh,0fch,022h,0e2h,050h,050h,041h,031h,021h,060h,060h,051h	; 7e8b  ....~.".PPA1!``Q
	defb 041h,031h,020h,020h,011h,001h,0e3h,0b1h,0e2h,080h,080h,071h,061h,051h,0fbh,012h	; 7e9b  A1  .......qaQ..
	defb 0e2h,020h,050h,070h,0a0h,0feh,010h,0abh,07eh,0e2h,020h,050h,070h,090h,0feh,008h	; 7eab  . Pp....~. Pp...
	defb 0b4h,07eh,001h,000h,000h,001h,000h,000h,0feh,0ffh,019h,07dh,0e1h,020h,060h,0feh	; 7ebb  .~.........}. `.
	defb 0ffh,0e6h,07ch,000h,0feh,0ffh,0f8h,07ch,0fch,022h,0e1h,041h,0e2h,0a1h,071h,0e1h	; 7ecb  ..|....|.".A..q.
	defb 021h,001h,0e2h,041h,071h,051h,0e8h,070h,0feh,0ffh,004h,07dh,0efh,0e2h,0a0h,090h	; 7edb  !..AqQ.p...}....
	defb 0a0h,0e1h,000h,020h,000h,020h,030h,0feh,0ffh,0e6h,07ch,0e1h,050h,050h,001h,0e2h	; 7eeb  ... . 0...|.PP..
	defb 091h,0e1h,051h,000h,000h,0e2h,091h,0e1h,051h,001h,0fbh,012h,0e8h,0a0h,0feh,0ffh	; 7efb  ..Q.....Q.......
	defb 00dh,07dh,0efh,0fbh,012h,071h,070h,070h,030h,0e2h,0a0h,070h,030h,0e8h,090h,091h	; 7f0b  .}...qpp0..p0...
	defb 090h,090h,050h,000h,0e2h,050h,0feh,0feh,07ch,07eh	; 7f1b  ..P..P..|~

; ----------------------------------------------------------------------
; DATOS sonido_38_7F25: canal del sonido 0x38 (palabra 56 del indice):
;   comandos del controlador de p04:60B1 hasta 0xFF (sigue en el banco 5, en
;   0x8000); lo leen p04:60B1 (219 bytes)
;   0x7f25..0x8000  (219 bytes)
DATA_sonido_38_7F25:
	defb 050h,060h,070h,080h,090h,0a0h,0b1h,0ffh,080h,090h,0a0h,0b0h,0e2h,000h,010h,021h	; 7f25  P`p............!
	defb 0ffh,010h,020h,030h,040h,050h,060h,071h,0ffh,0d6h,0c2h,0d6h,0fbh,013h,0ech,052h	; 7f35  .. 0@P`q.......R
	defb 0e3h,047h,0d1h,0fah,000h,040h,0feh,0ffh,025h,07fh,0f9h,000h,040h,0feh,0ffh,025h	; 7f45  .G...@..%...@..%
	defb 07fh,0f7h,000h,040h,0feh,0ffh,025h,07fh,0f5h,000h,040h,0feh,0ffh,025h,07fh,0d6h	; 7f55  ...@..%...@..%..
	defb 0fah,013h,040h,060h,076h,0d1h,0fah,000h,0e3h,070h,0feh,0ffh,02dh,07fh,0f9h,000h	; 7f65  ..@`v....p..-...
	defb 0e3h,070h,0feh,0ffh,02dh,07fh,0f8h,000h,0e3h,070h,0feh,0ffh,02dh,07fh,0f5h,000h	; 7f75  .p..-....p..-...
	defb 0e3h,070h,080h,090h,0a0h,0b0h,0e2h,000h,010h,02ch,0c6h,0feh,002h,040h,07fh,0d6h	; 7f85  .p.......,...@..
	defb 0fbh,013h,0ech,052h,0e2h,007h,0d1h,0f9h,000h,000h,0feh,0ffh,036h,07fh,0f8h,000h	; 7f95  ...R........6...
	defb 000h,0feh,0ffh,036h,07fh,0f6h,000h,000h,0feh,0ffh,036h,07fh,0f4h,000h,000h,0feh	; 7fa5  ...6......6.....
	defb 0ffh,036h,07fh,0d6h,0fah,013h,000h,020h,0e3h,0b6h,0d1h,0f9h,000h,0b0h,0e2h,000h	; 7fb5  .6..... ........
	defb 010h,020h,030h,040h,050h,061h,0f8h,000h,0e3h,0b0h,0e2h,000h,010h,020h,030h,040h	; 7fc5  . 0@Pa....... 0@
	defb 050h,061h,0f7h,000h,0e3h,0b0h,0e2h,000h,010h,020h,030h,040h,050h,061h,0f4h,000h	; 7fd5  Pa....... 0@Pa..
	defb 0e3h,0b0h,0e3h,000h,010h,020h,030h,040h,050h,06ch,0c6h,0feh,002h,094h,07fh,0feh	; 7fe5  ..... 0@Pl......
	defb 0feh,040h,07fh,0d6h,0c2h,0d6h,0fdh,033h,0e4h,041h,0fah	; 7ff5  .@.....3.A.
