; ==========================================================================
; METAL GEAR - Konami (1987) - MSX2 - MegaROM RC-750 de 128 KB (Konami4) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l5b9dh:	equ 0x05b9d

; ----------------------------------------------------------------------
; DATOS cabecera: la cabecera del cartucho: "AB", INIT = 0x41F3 (p00:41F3
;   arranca ahi), STATEMENT, DEVICE y TEXT a 0 y 6 bytes reservados; la BIOS
;   la lee al encender
;   0x4000..0x4010  (16 bytes)
DATA_cabecera:
	defb 041h,042h,0f3h,041h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.A............

; ----------------------------------------------------------------------
; DATOS segunda_cabecera: "CD" y la palabra 0x5007 seguidos de 28 ceros;
;   0x5007 cae en medio de una instruccion de L_4FCD (`out (c),a`), asi que no
;   es una entrada: ninguna instruccion de los 16 bancos lee estos bytes
;   0x4010..0x4030  (32 bytes)
DATA_segunda_cabecera:
	defb 043h,044h,007h,050h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4010  CD.P............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4020  ................

; ----------------------------------------------------------------------
; DATOS direcciones_del_sonido: 16 palabras: las direcciones de la RAM del
;   controlador de sonido (0xC0F8, 0xC012, 0xC032, 0xC052, 0xC010, 0xC011,
;   0xC030, 0xC031, 0xC050, 0xC051, 0xC0F2, 0xC0F4, 0xC072, 0xC070, 0xC071) y
;   la del indice de sonidos del banco 4 (0x6892); ninguna instruccion de los
;   16 bancos las nombra (grep de 0x4030-0x404E en los listados). SIN LECTOR A
;   LA VISTA
;   0x4030..0x4050  (32 bytes)
DATA_direcciones_del_sonido:
	defw 0c0f8h,0c012h,0c032h,0c052h,0c010h,0c011h,0c030h,0c031h	; 4030
	defw 0c050h,0c051h,06892h,0c0f2h,0c0f4h,0c072h,0c070h,0c071h	; 4040

; ======================================================================
; CODIGO 0x4050..0x45de  (1422 bytes)
; ======================================================================


hl_mas_a_y_vuelve:		; llama a hl_mas_a (p00:41E0) y deja otra vez los bancos 1-2 y el de zona
	call hl_mas_a		;4050   ; hl_mas_a: HL = HL + A
	jr L_40A3		;4053
de_mas_a_y_vuelve:		; llama a de_mas_a (p00:41E5) y deja otra vez los bancos 1-2 y el de zona
	call de_mas_a		;4055   ; de_mas_a: DE = DE + A
	jr L_40A3		;4058
sonido_si_hay_y_vuelve:		; llama a sonido_si_hay (p00:427C) y deja otra vez los bancos 1-2 y el de zona
	call sonido_si_hay		;405a   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	jr L_40A3		;405d
ventana_de_texto_y_vuelve:		; llama a ventana_de_texto (p00:5CE1) y deja otra vez los bancos 1-2 y el de zona
	call ventana_de_texto		;405f   ; ventana_de_texto: abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
	jr L_40A3		;4062
velocidad_de_snake_y_vuelve:		; llama a velocidad_de_snake (p01:617A) y deja otra vez los bancos 1-2 y el de zona
	call 0617ah		;4064   ; velocidad_de_snake: 0xC185 y la velocidad de Snake (0xC186 Y, 0xC188 X) con el modulo 0xC143
	jr L_40A3		;4067
velocidad_arriba_abajo_y_vuelve:		; llama a velocidad_arriba_abajo (p01:6160) y deja otra vez los bancos 1-2 y el de zona
	call 06160h		;4069   ; velocidad_arriba_abajo: la velocidad de Snake (0xC186/0xC188) si se pulsa arriba o abajo
	jr L_40A3		;406c
choque_de_snake_y_vuelve:		; llama a choque_de_snake (p01:6205) y deja otra vez los bancos 1-2 y el de zona
	call 06205h		;406e   ; choque_de_snake: mira con p02:8298 el sitio al que va Snake y la para si choca
	jr L_40A3		;4071
mueve_snake_y_vuelve:		; llama a mueve_snake (p01:63FC) y deja otra vez los bancos 1-2 y el de zona
	call 063fch		;4073   ; mueve_snake: suma las velocidades a Snake y mira los cuatro bordes (0xC133 y el modo 1)
	jr L_40A3		;4076
pose_de_snake_y_vuelve:		; llama a pose_de_snake (p01:6502) y deja otra vez los bancos 1-2 y el de zona
	call 06502h		;4078   ; pose_de_snake: elige la pose 0xC18A por el modo 0xC18B (tabla 0x6508)
	jr L_40A3		;407b
transceptor_abre_y_vuelve:		; llama a transceptor_abre (p01:6912) y deja otra vez los bancos 1-2 y el de zona
	call 06912h		;407d   ; transceptor_abre: paso 0: la pantalla del transceptor (marco p15:B369, retrato p15:B40D, rotulo, frecuencia)
	jr L_40A3		;4080
transceptor_senal_y_vuelve:		; llama a transceptor_senal (p01:699F) y deja otra vez los bancos 1-2 y el de zona
	call 0699fh		;4082   ; transceptor_senal: paso 2: sube la barra de senal 0xC801 hasta 12
	jr L_40A3		;4085
sale_del_transceptor_y_vuelve:		; llama a sale_del_transceptor (p01:6BB1) y deja otra vez los bancos 1-2 y el de zona
	call 06bb1h		;4087   ; sale_del_transceptor: paleta de Snake y vuelve a la sala
	jr L_40A3		;408a
caracteres_1_bit_y_vuelve:		; llama a caracteres_1_bit (p00:505D) y deja otra vez los bancos 1-2 y el de zona
	call caracteres_1_bit		;408c   ; caracteres_1_bit: B caracteres de 1 bit de HL en el color C a la pagina 1 desde (D, E)
	jr L_40A3		;408f
fichas_2_planos_y_vuelve:		; llama a fichas_2_planos (p00:51FE) y deja otra vez los bancos 1-2 y el de zona
	call fichas_2_planos		;4091   ; fichas_2_planos: B fichas de 2 planos (16 bytes) de HL a la VRAM DE con los colores de 0xE700
	jr L_40A3		;4094
rellena_y_vuelve:		; llama a rellena (p00:4F91) y deja otra vez los bancos 1-2 y el de zona
	call rellena		;4096   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
	jr L_40A3		;4099
pantalla_limpia_y_vuelve:		; llama a pantalla_limpia (p00:4DF8) y deja otra vez los bancos 1-2 y el de zona
	call pantalla_limpia		;409b   ; pantalla_limpia: esconde los sprites, apaga la pantalla, borra la pagina 0 y la enciende
	jr L_40A3		;409e
apaga_la_pantalla_y_vuelve:		; llama a apaga_la_pantalla (p00:4E0E) y deja otra vez los bancos 1-2 y el de zona
	call apaga_la_pantalla		;40a0   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
L_40A3:
	jr L_40F3		;40a3
copia_logica_y_vuelve:		; llama a copia_logica (p00:5011) y deja otra vez los bancos 1-2 y el de zona
	call copia_logica		;40a5   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	jr L_40F3		;40a8
enciende_la_pantalla_y_vuelve:		; llama a enciende_la_pantalla (p00:4E01) y deja otra vez los bancos 1-2 y el de zona
	call enciende_la_pantalla		;40aa   ; enciende_la_pantalla: pone el bit 6 de R#1 y enciende los sprites (R#8)
	jr L_40F3		;40ad
rotulo_y_vuelve:		; llama a rotulo (p00:510C) y deja otra vez los bancos 1-2 y el de zona
	call rotulo		;40af   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	jr L_40F3		;40b2
ficha_en_pagina_1_y_vuelve:		; llama a ficha_en_pagina_1 (p00:518A) y deja otra vez los bancos 1-2 y el de zona
	call ficha_en_pagina_1		;40b4   ; ficha_en_pagina_1: copia la ficha A de la pagina 1 a (D, E) de la pagina 1
	jr L_40F3		;40b7
L_40B9:
	call 060feh		;40b9
	jr L_40F3		;40bc
palabra_a_y_vuelve:		; llama a palabra_a (p00:42B4) y deja otra vez los bancos 1-2 y el de zona
	call palabra_a		;40be   ; palabra_a: DE = la palabra A de la tabla DE
	jr L_40F3		;40c1
vram_para_escribir_y_vuelve:		; llama a vram_para_escribir (p00:4D93) y deja otra vez los bancos 1-2 y el de zona
	call vram_para_escribir		;40c3   ; vram_para_escribir: pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	jr L_40F3		;40c6
escribe_vram_y_vuelve:		; llama a escribe_vram (p00:4D59) y deja otra vez los bancos 1-2 y el de zona
	call escribe_vram		;40c8   ; escribe_vram: copia BC bytes de HL a la VRAM DE
	jr L_40F3		;40cb
color_y_vuelve:		; llama a color (p00:4E66) y deja otra vez los bancos 1-2 y el de zona
	call color		;40cd   ; color: el color A de la paleta = DE ([RB][G]), y su copia en 0xF680
	jr L_40F3		;40d0
busca_objeto_y_vuelve:		; llama a busca_objeto (p00:43E1) y deja otra vez los bancos 1-2 y el de zona
	call busca_objeto		;40d2   ; busca_objeto: busca A en los 25 objetos de 0xC530 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	jr L_40F3		;40d5
sube_c132_y_vuelve:		; llama a sube_c132 (p01:64D2) y deja otra vez los bancos 1-2 y el de zona
	call 064d2h		;40d7   ; sube_c132: sube 0xC132 hasta 3 con el sonido 0x26
	jr L_40F3		;40da
borra_rotulo_y_vuelve:		; llama a borra_rotulo (p00:5110) y deja otra vez los bancos 1-2 y el de zona
	call borra_rotulo		;40dc   ; borra_rotulo: lo mismo que rotulo, con el caracter en blanco
	jr L_40F3		;40df
musica_de_nuevo_y_vuelve:		; llama a musica_de_nuevo (p01:6DD9) y deja otra vez los bancos 1-2 y el de zona
	call 06dd9h		;40e1   ; musica_de_nuevo: 0xC159 = 0 y elige la musica de la sala
	jr L_40F3		;40e4
caracter_y_vuelve:		; llama a caracter (p00:5135) y deja otra vez los bancos 1-2 y el de zona
	call caracter		;40e6   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	jr L_40F3		;40e9
esconde_los_sprites_y_vuelve:		; llama a esconde_los_sprites (p00:4E2C) y deja otra vez los bancos 1-2 y el de zona
	call esconde_los_sprites		;40eb   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	jr L_40F3		;40ee
dibujo_de_metal_gear_y_vuelve:		; llama a dibujo_de_metal_gear (p00:44A7) y deja otra vez los bancos 1-2 y el de zona
	call dibujo_de_metal_gear		;40f0   ; dibujo_de_metal_gear: pone el dibujo p15:B595 (Metal Gear) con L_44AF
L_40F3:
	jr L_4143		;40f3
borra_la_pagina_0_y_vuelve:		; llama a borra_la_pagina_0 (p00:4E1B) y deja otra vez los bancos 1-2 y el de zona
	call borra_la_pagina_0		;40f5   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
	jr L_4143		;40f8
juego_de_fichas_y_vuelve:		; llama a juego_de_fichas (p00:4935) y deja otra vez los bancos 1-2 y el de zona
	call juego_de_fichas		;40fa   ; juego_de_fichas: carga el juego de fichas de la sala (nibble p07:6000) si no es el de 0xC157, y sus bits de choque en 0xC700
	jr L_4143		;40fd
paleta_de_la_sala_y_vuelve:		; llama a paleta_de_la_sala (p00:4ACB) y deja otra vez los bancos 1-2 y el de zona
	call paleta_de_la_sala		;40ff   ; paleta_de_la_sala: manda al VDP la paleta de la sala (nibble p05:8B40, tabla p05:8BBE)
	jr L_4143		;4102
pone_dibujo_y_vuelve:		; llama a pone_dibujo (p00:44AF) y deja otra vez los bancos 1-2 y el de zona
	call pone_dibujo		;4104   ; pone_dibujo: pone un dibujo del banco 15 ([filas][columnas] y fichas) en la sala, en D/E
	jr L_4143		;4107
dibujo_b5f7_y_vuelve:		; llama a dibujo_b5f7 (p00:44AC) y deja otra vez los bancos 1-2 y el de zona
	call dibujo_b5f7		;4109   ; dibujo_b5f7: pone el dibujo p15:B5F7 con L_44AF
	jr L_4143		;410c
teclas_del_juego_y_vuelve:		; llama a teclas_del_juego (p01:7CBC) y deja otra vez los bancos 1-2 y el de zona
	call 07cbch		;410e   ; teclas_del_juego: 0xC007 = las teclas que hay, 0xC006 = las nuevas
	jr L_4143		;4111
paleta_por_defecto_y_vuelve:		; llama a paleta_por_defecto (p00:4E90) y deja otra vez los bancos 1-2 y el de zona
	call paleta_por_defecto		;4113   ; paleta_por_defecto: manda al VDP los 16 colores de 0x4EA4
	jr L_4143		;4116
paleta_y_vuelve:		; llama a paleta (p00:4EC4) y deja otra vez los bancos 1-2 y el de zona
	call paleta		;4118   ; paleta: manda al VDP la lista de HL: [color][RB][G] ... 0xFF
	jr L_4143		;411b
graficos_del_logotipo_konami_y_vuelve:		; llama a graficos_del_logotipo_konami (p00:4C4B) y deja otra vez los bancos 1-2 y el de zona
	call graficos_del_logotipo_konami		;411d   ; graficos_del_logotipo_konami: carga los tres bloques de 1 bit del logotipo de Konami (p09:B719, B781, B7E9) y pinta su montaje p09:B6D8
	jr L_4143		;4120
copia_vram_y_vuelve:		; llama a copia_vram (p00:4FCD) y deja otra vez los bancos 1-2 y el de zona
	call copia_vram		;4122   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	jr L_4143		;4125
ventana_de_texto_2_y_vuelve:		; llama a ventana_de_texto_2 (p00:5CD9) y deja otra vez los bancos 1-2 y el de zona
	call ventana_de_texto_2		;4127   ; ventana_de_texto_2: abre la ventana del texto A en el modo 2 (0xCEE0)
	jr L_4143		;412a
L_412C:
	call 08ffeh		;412c
	jr L_4143		;412f
linea_vertical_y_vuelve:		; llama a linea_vertical (p00:4F2F) y deja otra vez los bancos 1-2 y el de zona
	call linea_vertical		;4131   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
	jr L_4143		;4134
linea_horizontal_y_vuelve:		; llama a linea_horizontal (p00:4EFC) y deja otra vez los bancos 1-2 y el de zona
	call linea_horizontal		;4136   ; linea_horizontal: LINE de B puntos desde (H, L) en el color C
	jr L_4143		;4139
L_413B:
	call 0737bh		;413b
	jr L_4143		;413e
sonido_y_vuelve:		; llama a sonido (p00:4284) y deja otra vez los bancos 1-2 y el de zona
	call sonido		;4140   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
L_4143:
	jr L_4193		;4143
paleta_a_y_vuelve:		; llama a paleta_a (p00:4B03) y deja otra vez los bancos 1-2 y el de zona
	call paleta_a		;4145   ; paleta_a: manda al VDP la paleta A de la tabla p05:8BBE
	jr L_4193		;4148
ventana_paso_y_vuelve:		; llama a ventana_paso (p00:5D03) y deja otra vez los bancos 1-2 y el de zona
	call ventana_paso		;414a   ; ventana_paso: un paso de la ventana de texto (0xCEF2, tabla 0x5D1D)
	jr L_4193		;414d
pon_recv_y_vuelve:		; llama a pon_recv (p01:69E7) y deja otra vez los bancos 1-2 y el de zona
	call 069e7h		;414f   ; pon_recv: borra SEND y escribe RECV
	jr L_4193		;4152
pon_send_y_vuelve:		; llama a pon_send (p01:69EF) y deja otra vez los bancos 1-2 y el de zona
	call 069efh		;4154   ; pon_send: borra RECV y escribe SEND
	jr L_4193		;4157
L_4159:
	call 06d6fh		;4159
	jr L_4193		;415c
L_415E:
	call 06f18h		;415e
	jr L_4193		;4161
borra_la_pagina_d_y_vuelve:		; llama a borra_la_pagina_d (p00:4E1D) y deja otra vez los bancos 1-2 y el de zona
	call borra_la_pagina_d		;4163   ; borra_la_pagina_d: llena la pagina de D de color 0 y pone R#23 a cero
	jr L_4193		;4166
fichas_3_planos_y_vuelve:		; llama a fichas_3_planos (p00:524C) y deja otra vez los bancos 1-2 y el de zona
	call fichas_3_planos		;4168   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	jr L_4193		;416b
paleta_del_juego_y_vuelve:		; llama a paleta_del_juego (p00:4A92) y deja otra vez los bancos 1-2 y el de zona
	call paleta_del_juego		;416d   ; paleta_del_juego: manda al VDP la paleta p05:8B0B
	jr L_4193		;4170
fichas_del_marcador_y_vuelve:		; llama a fichas_del_marcador (p00:4B33) y deja otra vez los bancos 1-2 y el de zona
	call fichas_del_marcador		;4172   ; fichas_del_marcador: carga en la pagina 1 las fichas de los objetos, del marcador, de la camara y del retrato
	jr L_4193		;4175
guarda_paleta_y_vuelve:		; llama a guarda_paleta (p01:6D11) y deja otra vez los bancos 1-2 y el de zona
	call 06d11h		;4177   ; guarda_paleta: lee la paleta de 0xF680 (VRAM) a 0xC1CF en formato [color][RB][G]
	jr L_4193		;417a
funde_paleta_y_vuelve:		; llama a funde_paleta (p01:6D2E) y deja otra vez los bancos 1-2 y el de zona
	call 06d2eh		;417c   ; funde_paleta: apaga un poco la paleta de 0xC1CF y la manda; acarreo cuando todo es 0
	jr L_4193		;417f
L_4181:
	call 06b04h		;4181
	jr L_4193		;4184
atributos_de_snake_y_vuelve:		; llama a atributos_de_snake (p00:5318) y deja otra vez los bancos 1-2 y el de zona
	call atributos_de_snake		;4186   ; atributos_de_snake: los sprites de la pose 0xC18A (p10:606A, p10:609F) a 0xEA00 (0xEA40 en las salas 0xF0+ salvo 0xFB) mas su Y y su X
	jr L_4193		;4189
patrones_de_snake_y_vuelve:		; llama a patrones_de_snake (p00:53AB) y deja otra vez los bancos 1-2 y el de zona
	call patrones_de_snake		;418b   ; patrones_de_snake: descomprime los patrones de la pose 0xC18A (p10:6000) en 0xF800
	jr L_4193		;418e
esconde_los_sprites_ram_y_vuelve:		; llama a esconde_los_sprites_ram (p00:4E42) y deja otra vez los bancos 1-2 y el de zona
	call esconde_los_sprites_ram		;4190   ; esconde_los_sprites_ram: llena de 0xE0 la copia de los atributos (0xEA00-0xEA7F)
L_4193:
	jr vuelve_a_1_2_3		;4193
L_4195:
	call 08fb0h		;4195
vuelve_a_1_2_3:		; pone los bancos 1-2-3 y devuelve a 0xA000 el banco de 0xF0F6 si no es cero
	call bancos_1_2_3		;4198   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	push af			;419b
	ld a,(0f0f6h)		;419c   ; lee el banco de zona de 0xA000
	and a			;419f
	jr z,L_41AA		;41a0
	di			;41a2
	ld (0a000h),a		;41a3   ; el mapper: pone en 0xA000 el banco de A
	ld (0f0f3h),a		;41a6   ; guarda la copia del banco de 0xA000
	ei			;41a9
L_41AA:
	pop af			;41aa
	ret			;41ab
interrupcion:		; H.TIMI: el sonido (banco 4, 0x6000) y, si no esta ya en marcha (0xC005), el juego del cuadro (0x6672)
	di			;41ac   ; sin interrupciones mientras se tocan los bancos
	call 0013eh		;41ad   ; BIOS RDVDP - Reads VDP status register
	ld a,004h		;41b0   ; el banco 4 (el controlador de sonido) a 0x6000...
	ld (06000h),a		;41b2   ; el mapper: pone en 0x6000 el banco de A
	inc a			;41b5   ; ...y el 5 a 0x8000, sin tocar sus copias de 0xF0F1/0xF0F2
	ld (08000h),a		;41b6   ; el mapper: pone en 0x8000 el banco de A
	call 06000h		;41b9   ; sonido_del_cuadro: el controlador de sonido, cada interrupcion: mezclador, modo 0xC0F1, fundido 0xC0F4 y los 4 canales
	ld a,(0f0f1h)		;41bc   ; lee la copia del banco de 0x6000
	ld (06000h),a		;41bf   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0f0f2h)		;41c2   ; lee la copia del banco de 0x8000
	ld (08000h),a		;41c5   ; el mapper: pone en 0x8000 el banco de A
	ld hl,0c005h		;41c8   ; apunta a el semaforo del juego del cuadro
	bit 0,(hl)		;41cb   ; si el juego del cuadro anterior aun no acabo, este cuadro no lo llama
	jp nz,L_41D9		;41cd
	inc (hl)			;41d0   ; marca que el juego del cuadro esta en marcha
	ei			;41d1   ; con interrupciones: el juego del cuadro puede durar mas de un cuadro
	call 06672h		;41d2   ; juego_del_cuadro: sube 0xC003 y despacha por el estado del juego 0xC000 (tabla 0x6686)
	xor a			;41d5   ; el juego del cuadro acabo
	ld (0c005h),a		;41d6   ; guarda el semaforo del juego del cuadro
L_41D9:
	call 0013eh		;41d9   ; BIOS RDVDP - Reads VDP status register
	ei			;41dc
	ret			;41dd   ; (vuelve a la BIOS por H.TIMI)
hl_mas_2a_menos_2:		; HL = HL + 2 x (A - 1)
	dec a			;41de
hl_mas_2a:		; HL = HL + 2 x A
	add a,a			;41df
hl_mas_a:		; HL = HL + A
	add a,l			;41e0
	ld l,a			;41e1
	ret nc			;41e2   ; sin acarreo, H no cambia
	inc h			;41e3   ; acarreo de L a H
	ret			;41e4
de_mas_a:		; DE = DE + A
	add a,e			;41e5
	ld e,a			;41e6
	ret nc			;41e7   ; sin acarreo, D no cambia
	inc d			;41e8   ; acarreo de E a D
	ret			;41e9
despacha:		; salta a la palabra A de la tabla que va pegada detras del `call`
	pop hl			;41ea   ; HL = la direccion de vuelta: la tabla va justo detras del call
	call hl_mas_2a		;41eb   ; hl_mas_2a: HL = HL + 2 x A
	ld e,(hl)			;41ee   ; DE = la palabra A de la tabla
	inc hl			;41ef
	ld d,(hl)			;41f0
	ex de,hl			;41f1
	jp (hl)			;41f2   ; salta alli (no vuelve detras del call, que es la tabla)
init:		; el arranque: slot del cartucho en 0x8000, RAM 0xC000-0xF0EF a cero, bancos, H.TIMI y a esperar
	di			;41f3
	ld sp,0f0f0h		;41f4   ; la pila debajo de las copias de los bancos (0xF0F1-0xF0F6)
	call 00138h		;41f7   ; BIOS RSLREG - Reads the primary slot register
	rrca			;41fa   ; el slot primario de la pagina 1 (bits 2-3 de A8h)...
	rrca			;41fb
	and 003h		;41fc
	ld c,a			;41fe   ; BC = el slot primario
	ld b,000h		;41ff
	ld hl,0fcc1h		;4201   ; EXPTBL: si el slot esta expandido (bit 7)
	add hl,bc			;4204
	ld a,(hl)			;4205
	and 080h		;4206
	or c			;4208
	ld c,a			;4209   ; C = [expandido][slot primario]
	inc hl			;420a   ; SLTTBL (EXPTBL + 4): el subslot de la pagina 1 (bits 2-3)
	inc hl			;420b
	inc hl			;420c
	inc hl			;420d
	ld a,(hl)			;420e
	and 00ch		;420f
	or c			;4211   ; A = el slot del cartucho para ENASLT
	ld h,080h		;4212   ; H = 0x80: la pagina 2 (0x8000-0xBFFF) tambien al cartucho
	call 00024h		;4214   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld hl,0c000h		;4217   ; apunta a el estado del juego
	ld de,0c001h		;421a   ; apunta a el paso del estado del juego
	ld bc,030efh		;421d   ; 0x30EF bytes: 0xC000-0xF0EF
	ld (hl),l			;4220   ; L = 0: el primer byte a cero y ldir lo arrastra
	ldir		;4221
	call bancos_1_2_3		;4223   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call nada		;4226   ; nada: solo ret
	xor a			;4229   ; 0xF0F4, 0xF0F5 y 0xF0F6 (el banco de zona) a cero
	ld hl,0f0f4h		;422a
	ld (hl),a			;422d
	inc hl			;422e
	ld (hl),a			;422f
	inc hl			;4230
	ld (hl),a			;4231
	call 07c5ch		;4232   ; p01:7C5C: PSG, SCREEN 5, VDP y sprites
	di			;4235
	ld a,0c3h		;4236   ; H.TIMI (0xFD9F) = jp interrupcion
	ld (0fd9fh),a		;4238
	ld hl,interrupcion		;423b
	ld (0fda0h),hl		;423e
	xor a			;4241   ; CLIKSW a cero: sin clic de teclas
	ld (0f3dbh),a		;4242
	ei			;4245
L_4246:
	jr L_4246		;4246   ; de aqui en adelante todo pasa en la interrupcion
bancos_1_2_3:		; pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	di			;4248   ; sin interrupciones: la de 0x41AC tambien toca los bancos
	push af			;4249   ; A se guarda: las llamadas lo usan como parametro
	ld a,001h		;424a   ; el trio 1-2-3
	jr bancos_desde_a		;424c
bancos_4_5_6:		; pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	di			;424e
	push af			;424f
	ld a,004h		;4250   ; el trio 4-5-6
bancos_desde_a:		; pone A, A + 1 y A + 2 en 0x6000, 0x8000 y 0xA000 (y sus copias)
	push hl			;4252
	ld hl,0f0f1h		;4253   ; apunta a la copia del banco de 0x6000
	ld (06000h),a		;4256   ; el mapper: pone en 0x6000 el banco de A
	ld (hl),a			;4259   ; la copia del banco de 0x6000 en 0xF0F1
	inc a			;425a   ; el siguiente banco, a 0x8000
	inc hl			;425b
	ld (08000h),a		;425c   ; el mapper: pone en 0x8000 el banco de A
	ld (hl),a			;425f   ; y su copia en 0xF0F2
	inc a			;4260   ; el siguiente, a 0xA000
	inc hl			;4261
	ld (0a000h),a		;4262   ; el mapper: pone en 0xA000 el banco de A
	ld (hl),a			;4265   ; y su copia en 0xF0F3
	pop hl			;4266
	pop af			;4267
	ei			;4268
	ret			;4269
bancos_7_8_9:		; pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	di			;426a
	push af			;426b
	ld a,007h		;426c   ; el trio 7-8-9
	jr bancos_desde_a		;426e
bancos_10_11_12:		; pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	di			;4270
	push af			;4271
	ld a,00ah		;4272   ; el trio 10-11-12
	jr bancos_desde_a		;4274
bancos_13_14_15:		; pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	di			;4276
	push af			;4277
	ld a,00dh		;4278   ; el trio 13-14-15
	jr bancos_desde_a		;427a
sonido_si_hay:		; pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	push hl			;427c
	ld hl,0c002h		;427d   ; apunta a las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,(hl)		;4280   ; bit 6: se esta jugando (en la demo, sin sonido)
	pop hl			;4282
	ret z			;4283   ; en la demo no suena nada
sonido:		; pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
	di			;4284
	push hl			;4285
	push de			;4286
	push bc			;4287
	ld hl,(0f0f1h)		;4288   ; guarda los bancos de 0x6000 y 0x8000 (sus copias)
	push hl			;428b
	push af			;428c
	ld a,004h		;428d   ; el banco 4 a 0x6000 y el 5 a 0x8000, con sus copias
	ld (06000h),a		;428f   ; el mapper: pone en 0x6000 el banco de A
	ld (0f0f1h),a		;4292   ; guarda la copia del banco de 0x6000
	inc a			;4295
	ld (0f0f2h),a		;4296   ; guarda la copia del banco de 0x8000
	ld (08000h),a		;4299   ; el mapper: pone en 0x8000 el banco de A
	pop af			;429c   ; A = el sonido pedido
	call 067fdh		;429d   ; pide_sonido: el sonido A (indice 0x6892): < 0x29 efecto en 0xC070 si manda mas, si no musica de 3 o 4 canales; 0x4D/0x59 guardan la musica
	pop hl			;42a0   ; devuelve los bancos de antes, copias y registros
	ld (0f0f1h),hl		;42a1   ; guarda la copia del banco de 0x6000 y el byte siguiente (16 bits)
	ld a,l			;42a4
	ld (06000h),a		;42a5   ; el mapper: pone en 0x6000 el banco de A
	ld a,h			;42a8
	ld (08000h),a		;42a9   ; el mapper: pone en 0x8000 el banco de A
	pop bc			;42ac
	pop de			;42ad
	pop hl			;42ae
	ei			;42af
	ret			;42b0
palabra_de_la_sala:		; DE = la palabra de la tabla DE que toca a la sala (0xC130)
	ld a,(0c130h)		;42b1   ; lee la sala
palabra_a:		; DE = la palabra A de la tabla DE
	ld l,a			;42b4   ; HL = 2 x A
	ld h,000h		;42b5
	add hl,hl			;42b7
	add hl,de			;42b8   ; + la tabla
	ld e,(hl)			;42b9   ; DE = la palabra
	inc hl			;42ba
	ld d,(hl)			;42bb
	ret			;42bc
cuatro_a_menos_4:		; HL = 4 x (A - 1)
	dec a			;42bd
cuatro_a:		; HL = 4 x A
	ld l,a			;42be   ; HL = 4 x A
	ld h,000h		;42bf
	add hl,hl			;42c1
	add hl,hl			;42c2
	ret			;42c3
colores_por_defecto:		; copia los 8 colores de 0x4B13 a 0xE700 (los de las fichas en 3 planos)
	ld hl,04b13h		;42c4   ; los colores de las fichas de 3 planos
ocho_colores:		; copia 8 colores de HL a 0xE700
	ld c,008h		;42c7
c_colores:		; copia C colores de HL a 0xE700
	ld de,0e700h		;42c9   ; apunta a los colores de las fichas
	ld b,000h		;42cc   ; BC = C
	ldir		;42ce
	ret			;42d0
nibble_de_la_sala:		; A = el nibble de la tabla HL que toca a la sala (0xC130)
	ld a,(0c130h)		;42d1   ; lee la sala
nibble_a:		; A = el nibble A de la tabla HL (el alto si A es par)
	ld c,a			;42d4   ; C = el indice (su bit 0 dice que nibble)
	srl a		;42d5   ; un byte por cada dos indices
	call hl_mas_a		;42d7   ; hl_mas_a: HL = HL + A
	bit 0,c		;42da   ; par: el nibble alto
	ld a,(hl)			;42dc
	jr nz,L_42E3		;42dd
	rra			;42df   ; el nibble alto baja al bajo
	rra			;42e0
	rra			;42e1
	rra			;42e2
L_42E3:
	and 00fh		;42e3   ; A = el nibble
	ret			;42e5
sala_vecina:		; A = la sala vecina por el lado 0xC133 (tabla p05:8E0E); 0xFF si la sala no tiene vecinas
	call bancos_4_5_6		;42e6   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld c,0ffh		;42e9   ; C = 0xFF: sin vecina
	ld a,(0c130h)		;42eb   ; lee la sala
	cp 07eh		;42ee   ; las salas 0x00-0x7D tienen vecinas
	jr c,L_4302		;42f0
	cp 0d0h		;42f2   ; 0x7E-0xCF no (se llega por puertas)
	jr c,L_4311		;42f4
	cp 0e4h		;42f6   ; 0xD0-0xE3: restan 0x52
	jr c,L_4300		;42f8
	cp 0f1h		;42fa   ; 0xE4-0xF0 no
	jr c,L_4311		;42fc
	sub 00dh		;42fe   ; 0xF1 y siguientes: restan 0x5F (0x0D + 0x52)
L_4300:
	sub 052h		;4300
L_4302:
	ld de,08e0eh		;4302   ; p05:8E0E: 4 vecinas por sala (arriba, abajo, izquierda, derecha)
	call cuatro_a		;4305   ; cuatro_a: HL = 4 x A
	add hl,de			;4308   ; HL = la ficha de la sala
	ld a,(0c133h)		;4309   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	dec a			;430c   ; el lado, de 1-4 a 0-3
	call hl_mas_a		;430d   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;4310   ; C = la sala de ese lado
L_4311:
	ld a,c			;4311   ; A = la vecina (o 0xFF)
	jp bancos_1_2_3		;4312   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
parada_del_ascensor:		; BC = los dos bytes que siguen a la parada 0xC136 en la lista del ascensor
	call datos_del_ascensor		;4315   ; datos_del_ascensor: 0xC197 y 0xC198 = los dos primeros bytes del ascensor (sala - 0xF0) en p05:8DA8
	call bancos_4_5_6		;4318   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	inc hl			;431b   ; HL = la lista de paradas: [parada][byte][byte]...
	ld a,(0c136h)		;431c   ; lee la parada del ascensor
L_431F:
	cp (hl)			;431f   ; busca la parada de la que viene Snake
	jr z,L_4327		;4320
	inc hl			;4322   ; siguiente terna
	inc hl			;4323
	inc hl			;4324
	jr L_431F		;4325
L_4327:
	inc hl			;4327   ; C y B = los dos bytes de la parada
	ld c,(hl)			;4328
	inc hl			;4329
	ld b,(hl)			;432a
	jr L_43A0		;432b
datos_del_ascensor:		; 0xC197 y 0xC198 = los dos primeros bytes del ascensor (sala - 0xF0) en p05:8DA8
	call bancos_4_5_6		;432d   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c130h)		;4330   ; lee la sala
	sub 0f0h		;4333   ; el numero de ascensor (sala - 0xF0)
	ld de,08da8h		;4335   ; p05:8DA8: un puntero por ascensor
	call palabra_a		;4338   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;433b   ; HL = los datos del ascensor
	ld a,(hl)			;433c
	ld (0c197h),a		;433d   ; guarda el primer byte del ascensor
	inc hl			;4340   ; el segundo byte
	ld a,(hl)			;4341
	ld (0c198h),a		;4342   ; guarda el segundo byte del ascensor
	jr L_43A0		;4345
puertas_al_empezar:		; 0xC450-0xC4EF: 0 si los bits 7-6 de p15:B046 son 10, 1 si no (160 puertas)
	call bancos_13_14_15		;4347   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0b046h		;434a   ; p15:B046: 160 bytes, uno por puerta
	ld hl,0c450h		;434d   ; apunta a el estado de las 160 puertas
	ld b,0a0h		;4350   ; 160 puertas
L_4352:
	ld a,(de)			;4352   ; los bits 7-6 de la puerta
	and 0c0h		;4353
	sub 080h		;4355   ; 10: empieza en 0 (abierta)
	jr z,L_435B		;4357
	ld a,001h		;4359   ; si no, 1 (cerrada)
L_435B:
	ld (hl),a			;435b
	inc de			;435c   ; siguiente puerta
	inc hl			;435d
	djnz L_4352		;435e
	jr L_43A0		;4360
byte_a204_de_la_sala:		; 0xC158 = los 3 bits bajos de p12:A204[sala]
	call bancos_10_11_12		;4362   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c130h)		;4365   ; lee la sala
	ld hl,0a204h		;4368   ; p12:A204: un byte por sala
	call hl_mas_a		;436b   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;436e   ; A = el byte de la sala
	and 007h		;436f   ; solo los 3 bits bajos
	ld (0c158h),a		;4371   ; guarda los 3 bits bajos de p12:A204 de la sala
	jr L_43A0		;4374
nibble_a2ff_de_la_sala:		; 0xC161 = el nibble de la sala en p12:A2FF
	call bancos_10_11_12		;4376   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0a2ffh		;4379   ; p12:A2FF: un nibble por sala
	call nibble_de_la_sala		;437c   ; nibble_de_la_sala: A = el nibble de la tabla HL que toca a la sala (0xC130)
	ld (0c161h),a		;437f   ; guarda el nibble de p12:A2FF de la sala
	jr L_43A0		;4382
tabla_de_dano:		; apunta 0xEC00 a la tabla de dano del arma A (p05:87B7)
	call bancos_4_5_6		;4384   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	dec a			;4387   ; del arma 1-8 al indice 0-7
	ld de,087b7h		;4388   ; p05:87B7: una tabla de dano por arma
	call palabra_a		;438b   ; palabra_a: DE = la palabra A de la tabla DE
	ld (0ec00h),de		;438e   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	dec de			;4392   ; el byte de antes de la tabla
L_4393:
	ld a,(de)			;4393   ; A = el byte de DE
	jr L_43A0		;4394
dano:		; A = el byte A de la tabla de dano de 0xEC00
	call bancos_4_5_6		;4396   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,(0ec00h)		;4399   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
L_439C:
	call hl_mas_a		;439c   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;439f   ; A = el byte A de la tabla
L_43A0:
	jp bancos_1_2_3		;43a0   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
byte_del_banco_5:		; A = el byte A - 1 de la tabla HL, con los bancos 4-5-6
	call bancos_4_5_6		;43a3   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	dec a			;43a6   ; del 1 al indice 0
	jr L_439C		;43a7
suma_de_objeto:		; A = el byte A de p05:8AE8 (lo que suma cada objeto)
	call bancos_4_5_6		;43a9   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,08ae8h		;43ac   ; p05:8AE8: lo que suma cada objeto al cogerlo
	call de_mas_a		;43af   ; de_mas_a: DE = DE + A
	jr L_4393		;43b2
caja_de_choque:		; copia la caja A (p05:8A55 + 4 x (A - 1)) a 0xC928; HL = 0xC928
	call bancos_4_5_6		;43b4   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	call cuatro_a_menos_4		;43b7   ; cuatro_a_menos_4: HL = 4 x (A - 1)
	ld de,08a55h		;43ba   ; p05:8A55: cajas de 4 bytes [dy][alto][dx][ancho]
	add hl,de			;43bd   ; HL = la caja
	ld de,0c928h		;43be   ; apunta a la caja de choque copiada
	push de			;43c1
	ld bc,00004h		;43c2   ; los 4 bytes de la caja
	ldir		;43c5
	pop hl			;43c7   ; HL = 0xC928, la caja copiada
	jr L_43A0		;43c8
marca_de_arma:		; 0xC155 = donde va la marca del hueco 0xC154 en la ventana de armas (p06:B8B0)
	ld de,0b8b0h		;43ca   ; p06:B8B0: los sitios de la marca en la ventana de armas
	jr L_43D2		;43cd
marca_de_objeto:		; 0xC155 = donde va la marca del hueco 0xC154 en la ventana de equipo (p06:B9BB)
	ld de,0b9bbh		;43cf   ; p06:B9BB: los sitios de la marca en la ventana de equipo
L_43D2:
	call bancos_4_5_6		;43d2   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c154h)		;43d5   ; lee el hueco elegido en la ventana de armas
	call palabra_a		;43d8   ; palabra_a: DE = la palabra A de la tabla DE
	ld (0c155h),de		;43db   ; 0xC155 = donde va la marca del hueco elegido
	jr L_43A0		;43df
busca_objeto:		; busca A en los 25 objetos de 0xC530 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld hl,0c530h		;43e1   ; apunta a los objetos que se llevan (fichas de 4)
	ld b,019h		;43e4   ; 25 objetos
	jr L_43ED		;43e6
busca_arma:		; busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	ld hl,0c500h		;43e8   ; apunta a las armas que se llevan (fichas de 4: [arma][municion BCD])
	ld b,007h		;43eb   ; 7 armas
L_43ED:
	ld c,000h		;43ed   ; C = el hueco, desde 0
	ld de,00004h		;43ef   ; fichas de 4 bytes
L_43F2:
	cp (hl)			;43f2   ; esta: Z (y HL apunta a su ficha)
	ret z			;43f3
	add hl,de			;43f4   ; siguiente ficha
	inc c			;43f5
	djnz L_43F2		;43f6
	scf			;43f8   ; no esta: acarreo
	ret			;43f9
carga_las_puertas:		; copia las puertas de la sala (p15:A7C0) a 0xC3D0 con su estado (0xC450) y cuenta en 0xC4FF
	ld ix,0c4ffh		;43fa   ; apunta a cuantas puertas tiene la sala
	ld (ix+000h),000h		;43fe   ; ninguna puerta todavia
	ld a,(0c130h)		;4402   ; lee la sala
	cp 0e1h		;4405   ; las salas 0xE1-0xEF no tienen puertas
	jr c,L_440E		;4407
	cp 0f0h		;4409
	ret c			;440b
	sub 00fh		;440c   ; 0xF0 y siguientes: el indice resta 0x0F
L_440E:
	call bancos_13_14_15		;440e   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0a7c0h		;4411   ; p15:A7C0: la lista de puertas de cada sala
	call palabra_a		;4414   ; palabra_a: DE = la palabra A de la tabla DE
	ld hl,0c3d0h		;4417   ; apunta a las puertas de la sala
L_441A:
	ld a,(de)			;441a   ; 0xFF acaba la lista
	inc a			;441b
	jp z,bancos_1_2_3		;441c   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	inc (ix+000h)		;441f   ; una puerta mas
	ld a,(de)			;4422   ; +0: el numero de puerta
	ld (hl),a			;4423
	ld c,a			;4424
	inc hl			;4425
	inc de			;4426
	push de			;4427
	dec a			;4428   ; +1: su estado en 0xC450 (0 abierta)
	ld de,0c450h		;4429   ; apunta a el estado de las 160 puertas
	call de_mas_a		;442c   ; de_mas_a: DE = DE + A
	ld a,(de)			;442f
	ld (hl),a			;4430
	inc hl			;4431
	ld a,c			;4432
	dec a			;4433
	ld de,0b046h		;4434   ; +2: su byte de p15:B046 (la clase con que se abre)
	call de_mas_a		;4437   ; de_mas_a: DE = DE + A
	ld a,(de)			;443a
	ld (hl),a			;443b
	inc hl			;443c
	pop de			;443d
	ld a,(de)			;443e   ; +3: el tipo de puerta (1-20)
	ld (hl),a			;443f
	ld c,a			;4440
	sub 006h		;4441   ; el tipo 6 (ascensor) va siempre abierto
	jr nz,L_444A		;4443
	dec hl			;4445
	dec hl			;4446
	ld (hl),a			;4447
	inc hl			;4448
	inc hl			;4449
L_444A:
	inc hl			;444a
	inc de			;444b
	ld (hl),000h		;444c   ; +4 a cero
	inc hl			;444e
	ld a,(de)			;444f   ; +5: la Y de la puerta
	ld (hl),a			;4450
	inc hl			;4451
	inc de			;4452
	ld a,(de)			;4453   ; +6: la X
	ld (hl),a			;4454
	inc hl			;4455
	push hl			;4456
	ld a,c			;4457   ; por el tipo, dos cajas de p15:A720 (8 bytes cada tipo)
	call cuatro_a_menos_4		;4458   ; cuatro_a_menos_4: HL = 4 x (A - 1)
	add hl,hl			;445b
	push de			;445c
	ld de,0a720h		;445d
	add hl,de			;4460
	pop de			;4461
	push hl			;4462
	pop iy		;4463
	pop hl			;4465
	dec de			;4466   ; vuelve a la Y
	ld a,(de)			;4467
	ld c,a			;4468
	add a,(iy+000h)		;4469   ; +7: la Y de la caja donde se abre
	ld (hl),a			;446c
	inc hl			;446d
	ld a,(iy+001h)		;446e   ; +8: su alto
	ld (hl),a			;4471
	inc de			;4472
	inc hl			;4473
	ld a,(de)			;4474
	ld b,a			;4475
	add a,(iy+002h)		;4476   ; +9: la X de la caja
	ld (hl),a			;4479
	inc hl			;447a
	ld a,(iy+003h)		;447b   ; +0A: su ancho
	ld (hl),a			;447e
	inc de			;447f
	inc hl			;4480
	ld a,c			;4481
	add a,(iy+004h)		;4482   ; +0B: la Y de la caja del paso
	ld (hl),a			;4485
	inc hl			;4486
	ld a,(iy+005h)		;4487   ; +0C: su alto
	ld (hl),a			;448a
	inc hl			;448b
	ld a,b			;448c
	add a,(iy+006h)		;448d   ; +0D: la X del paso
	ld (hl),a			;4490
	inc hl			;4491
	ld a,(iy+007h)		;4492   ; +0E: su ancho
	ld (hl),a			;4495
	inc hl			;4496
	ld a,(de)			;4497   ; +0F: la sala de destino
	ld (hl),a			;4498
	inc hl			;4499
	inc de			;449a
	jp L_441A		;449b   ; siguiente puerta (fichas de 0x10)
pone_dibujo_hl:		; pone el dibujo de HL ([filas][columnas] y fichas) en (D, E), de la mitad de la pagina 1 que diga 0xC168
	call bancos_13_14_15		;449e   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	ld c,(hl)			;44a1   ; C = filas y B = columnas, del propio dibujo
	inc hl			;44a2
	ld b,(hl)			;44a3
	inc hl			;44a4
	jr L_44BA		;44a5
dibujo_de_metal_gear:		; pone el dibujo p15:B595 (Metal Gear) con L_44AF
	ld hl,0b595h		;44a7   ; p15:B595: Metal Gear
	jr pone_dibujo		;44aa
dibujo_b5f7:		; pone el dibujo p15:B5F7 con L_44AF
	ld hl,0b5f7h		;44ac   ; p15:B5F7: el suelo sin Metal Gear
pone_dibujo:		; pone un dibujo del banco 15 ([filas][columnas] y fichas) en la sala, en D/E
	call bancos_13_14_15		;44af   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	ld c,(hl)			;44b2   ; C = filas, B = columnas
	inc hl			;44b3
	ld b,(hl)			;44b4
	inc hl			;44b5
L_44B6:
	xor a			;44b6   ; las fichas, de la primera mitad de la pagina 1
	ld (0c168h),a		;44b7
L_44BA:
	call bancos_13_14_15		;44ba   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	push de			;44bd   ; HL' = la ficha de la sala montada en (D, E)
	exx			;44be
	pop hl			;44bf
	call ficha_en_el_punto		;44c0   ; ficha_en_el_punto: HL = 0xE000 + (L / 8) x 32 + H / 8: la ficha de la sala montada en ese punto
	exx			;44c3
L_44C4:
	push bc			;44c4   ; una fila
	push de			;44c5
	exx			;44c6
	push hl			;44c7
	exx			;44c8
L_44C9:
	ld a,(hl)			;44c9   ; la ficha del dibujo...
	exx			;44ca
	ld (hl),a			;44cb   ; ...tambien en la sala montada (0xE000)
	inc hl			;44cc
	exx			;44cd
	inc hl			;44ce   ; siguiente ficha del dibujo
	call ficha_transparente		;44cf   ; ficha_transparente: copia la ficha A de la pagina 1 a (D, E) con TIMP (de la segunda mitad si 0xC168 bit 0)
	ld a,d			;44d2   ; 8 puntos a la derecha
	add a,008h		;44d3
	ld d,a			;44d5
	djnz L_44C9		;44d6
	exx			;44d8
	pop hl			;44d9
	ld a,020h		;44da   ; la fila siguiente de la sala montada (32 fichas)
	call hl_mas_a		;44dc   ; hl_mas_a: HL = HL + A
	exx			;44df
	pop de			;44e0
	ld a,e			;44e1   ; 8 lineas mas abajo
	add a,008h		;44e2
	ld e,a			;44e4
	pop bc			;44e5
	dec c			;44e6   ; siguiente fila
	jr nz,L_44C4		;44e7
	jp bancos_1_2_3		;44e9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
musica_de_la_sala:		; 0xC602 a cero y elige la musica de la sala (0xC159, 0xC0F4) y 0xC15F
	xor a			;44ec
	ld (0c602h),a		;44ed   ; guarda la bandera 0xC602 (refuerzos y musica)
L_44F0:
	ld a,(0c151h)		;44f0   ; lee el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	cp 008h		;44f3   ; con el modo 8 (el telescopio) la musica no cambia
	ret z			;44f5
	ld c,000h		;44f6   ; C = 0: sin la bandera 0xC602
	ld a,(0c161h)		;44f8   ; lee el nibble de p12:A2FF de la sala
	cp 004h		;44fb   ; los nibbles 4 y 8+ de p12:A2FF dejan la bandera a cero
	jr z,L_4524		;44fd
	cp 008h		;44ff
	jr nc,L_4524		;4501
	ld a,(0c130h)		;4503   ; lee la sala
	ld hl,045deh		;4506   ; las 17 salas de 0x45DE tambien
	ld b,011h		;4509
L_450B:
	cp (hl)			;450b   ; busca la sala en la lista
	jr z,L_4524		;450c
	inc hl			;450e
	djnz L_450B		;450f
	cp 040h		;4511   ; las salas 0x40-0x44...
	jr c,L_451D		;4513
	cp 045h		;4515
	jr c,L_4524		;4517
	cp 0f0h		;4519   ; ...y las 0xF0 en adelante tambien
	jr nc,L_4524		;451b
L_451D:
	ld a,(0c5b6h)		;451d   ; con 0xC5B6 puesto, C = 1
	and a			;4520
	jr z,L_452D		;4521   ; sin 0xC5B6, la bandera no se toca
	inc c			;4523
L_4524:
	ld a,c			;4524
	ld (0c602h),a		;4525   ; guarda la bandera 0xC602 (refuerzos y musica)
	ld a,01eh		;4528   ; la cuenta de 0x1E cuadros
	ld (0c605h),a		;452a   ; guarda la cuenta de los refuerzos
L_452D:
	ld a,(0c072h)		;452d   ; el sonido 0x22 en el canal de efectos...
	cp 022h		;4530
	ld a,028h		;4532   ; ...se cambia por el 0x28
	call z,sonido_si_hay		;4534   ; sonido_si_hay: pide el sonido A solo si se juega (bit 6 de 0xC002; en la demo no)
	call bancos_10_11_12		;4537   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c130h)		;453a   ; lee la sala
	ld hl,0a204h		;453d   ; p12:A204: el nibble alto elige la musica de la sala
	call hl_mas_a		;4540   ; hl_mas_a: HL = HL + A
	ld a,(0c13ch)		;4543   ; con la cuenta atras (0xC13C), la musica 0x3B
	and a			;4546
	ld c,03bh		;4547
	jr nz,L_4576		;4549
	ld a,(0c602h)		;454b   ; lee la bandera 0xC602 (refuerzos y musica)
	and a			;454e   ; sin la bandera 0xC602...
	jr z,L_455C		;454f
	ld a,(0c159h)		;4551   ; lee la musica que suena
	cp 02fh		;4554   ; con ella, si ya suenan la 0x2F o la 0x32, se quedan
	jr z,L_4595		;4556
	cp 032h		;4558
	jr z,L_4595		;455a
L_455C:
	ld b,010h		;455c   ; el nibble alto de p12:A204[sala]:
	ld a,(hl)			;455e
	and 0f0h		;455f
	ld c,02ch		;4561   ; 0x00: la musica 0x2C
	jr z,L_4576		;4563
	sub b			;4565
	ld c,035h		;4566   ; 0x10: la 0x35
	jr z,L_4576		;4568
	sub b			;456a
	ld c,038h		;456b   ; 0x20: la 0x38
	jr z,L_4576		;456d
	sub b			;456f
	ld c,03bh		;4570   ; 0x30: la 0x3B
	jr z,L_4576		;4572
	ld c,032h		;4574   ; otro: la 0x32
L_4576:
	ld a,(0c602h)		;4576   ; lee la bandera 0xC602 (refuerzos y musica)
	and a			;4579
	ld a,032h		;457a   ; con la bandera 0xC602, la 0x32
	jr nz,L_4585		;457c
	ld a,(0c159h)		;457e   ; lee la musica que suena
	cp c			;4581   ; si ya suena, no se vuelve a pedir
	jr z,L_4595		;4582
	ld a,c			;4584
L_4585:
	ld c,a			;4585
	ld a,(0c13ch)		;4586   ; con la cuenta atras, la 0x3B siempre
	and a			;4589
	jr z,L_458E		;458a
	ld c,03bh		;458c
L_458E:
	ld a,c			;458e
	ld (0c159h),a		;458f   ; guarda la musica que suena
	ld (0c0f4h),a		;4592   ; y se pide (0xC0F4: la que sigue al fundido)
L_4595:
	ld c,002h		;4595   ; C = 2 en 0xC15F por defecto
	ld a,(0c662h)		;4597   ; con 0xC662, las llamadas 0x79 y 0x26 no avisan
	and a			;459a
	jr z,L_45A8		;459b
	ld a,(0c880h)		;459d   ; lee las llamadas de radio de la sala (fichas de 0x1D)
	cp 079h		;45a0
	jr z,L_45D7		;45a2
	cp 026h		;45a4
	jr z,L_45D7		;45a6
L_45A8:
	ld a,(0c880h)		;45a8   ; lee las llamadas de radio de la sala (fichas de 0x1D)
	cp 048h		;45ab   ; la llamada 0x48 solo avisa con CLASS 3 y sin 0xC657
	jr nz,L_45BC		;45ad
	ld a,(0c132h)		;45af   ; lee la CLASS (0-3 estrellas)
	cp 003h		;45b2
	jr nz,L_45D7		;45b4
	ld a,(0c657h)		;45b6
	and a			;45b9
	jr nz,L_45D7		;45ba
L_45BC:
	ld a,(0c161h)		;45bc   ; lee el nibble de p12:A2FF de la sala
	cp 005h		;45bf   ; con el nibble 5+ de p12:A2FF, solo con 0xC5A7
	jr c,L_45C9		;45c1
	ld a,(0c5a7h)		;45c3
	and a			;45c6
	jr z,L_45D7		;45c7
L_45C9:
	ld a,(hl)			;45c9   ; el bit 3 de p12:A204[sala]: hay llamada al entrar
	and 008h		;45ca
	ld c,002h		;45cc
	jr z,L_45D7		;45ce
	add a,a			;45d0   ; 0xC160 = 0x20: la cuenta hasta la llamada
	add a,a			;45d1
	ld (0c160h),a		;45d2   ; guarda la cuenta hasta la llamada
	ld c,000h		;45d5   ; C = 0: llamada pendiente
L_45D7:
	ld a,c			;45d7
	ld (0c15fh),a		;45d8   ; 0xC15F = 0 (llamada pendiente) o 2 (ninguna)
	jp bancos_1_2_3		;45db   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)

; ----------------------------------------------------------------------
; DATOS salas_sin_cambio_de_musica: 17 numeros de sala (6, 9, 0xA, 0x14, 0x66,
;   0x67, 0x78, 0xAD, 0xAE, 0xAF, 0xD0, 0xD1, 0x87, 0xC7, 0x85, 0x81, 0x8F)
;   que p00:450B compara con la sala (0xC130): si esta, o si es 0x40-0x44 o
;   0xF0+, p00:4524 guarda C en 0xC602 sin mirar 0xC5B6 (el `inc c` de 0x4523)
;   0x45de..0x45ef  (17 bytes)
DATA_salas_sin_cambio_de_musica:
	defb 006h,009h,00ah,014h,066h,067h,078h,0adh,0aeh,0afh,0d0h,0d1h,087h,0c7h,085h,081h	; 45de  ....fgx.........
	defb 08fh	; 45ee

; ======================================================================
; CODIGO 0x45ef..0x490c  (797 bytes)
; ======================================================================


dibujo_a_e600:		; copia un dibujo del banco 15 ([ancho][alto] en DE) a 0xE600
	call bancos_13_14_15		;45ef   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(de)			;45f2   ; C = el alto del dibujo
	ld c,a			;45f3
	inc de			;45f4
	ld a,(de)			;45f5   ; B = el ancho
	ld b,a			;45f6
	call bancos_1_2_3		;45f7   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0e600h		;45fa   ; apunta a el dibujo copiado del banco 15
	call ficha_en_el_punto		;45fd   ; HL = la ficha de la sala montada en (D, E)
L_4600:
	push bc			;4600   ; una fila
	push hl			;4601
L_4602:
	ld a,(hl)			;4602   ; copia las fichas de la sala montada a 0xE600
	ld (de),a			;4603
	inc hl			;4604
	inc de			;4605
	djnz L_4602		;4606
	pop hl			;4608
	ld a,020h		;4609   ; la fila siguiente (32 fichas)
	call hl_mas_a		;460b   ; hl_mas_a: HL = HL + A
	pop bc			;460e
	dec c			;460f   ; siguiente fila
	jr nz,L_4600		;4610
	ret			;4612
gasta_municion:		; resta 1 (BCD) a la cantidad de HL y la pinta; con C = 1 o mas, al acabarse quita el arma o el objeto
	ld a,(hl)			;4613   ; la cantidad (BCD, 2 bytes) baja 1
	sub 001h		;4614
	daa			;4616
	ld (hl),a			;4617
	inc hl			;4618
	jr nc,L_461C		;4619   ; sin acarreo, el byte alto no cambia
	dec (hl)			;461b   ; acarreo al byte alto
L_461C:
	ld a,c			;461c   ; C = 0: solo pinta lo que queda
	and a			;461d
	jp z,pinta_municion		;461e   ; pinta_municion: el numero BCD de 2 bytes de HL en (0xC0, 0xC8)
	dec c			;4621   ; C = 1: un arma
	jr nz,L_4637		;4622
	ld a,(hl)			;4624   ; si aun quedan, pinta lo que queda
	dec hl			;4625
	or (hl)			;4626
	inc hl			;4627
	jp nz,pinta_municion		;4628   ; pinta_municion: el numero BCD de 2 bytes de HL en (0xC0, 0xC8)
	dec hl			;462b   ; si no, la ficha del arma fuera...
	dec hl			;462c
	call cuatro_ceros		;462d   ; cuatro_ceros: pone a cero 4 bytes desde HL
	xor a			;4630   ; ...y ningun arma elegida
	ld (0c134h),a		;4631   ; guarda el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	jp marcador_arma		;4634   ; marcador_arma: pinta en el marcador el arma elegida (0xC134) y su municion
L_4637:
	ld a,(hl)			;4637   ; C >= 2: un objeto; Z si se acabo
	dec hl			;4638
	or (hl)			;4639
	push af			;463a
	dec hl			;463b   ; A = el objeto
	ld a,(hl)			;463c
	call busca_objeto		;463d   ; C = su hueco en la lista
	pop af			;4640
	jp nz,pinta_cantidad		;4641   ; si quedan, pinta la cantidad
	call cuatro_ceros		;4644   ; si no, el objeto fuera
	call bancos_4_5_6		;4647   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,c			;464a   ; el sitio del hueco en la ventana de equipo (p06:B9BB)
	inc a			;464b
	ld de,0b9bbh		;464c
	call palabra_a		;464f   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;4652
	dec l			;4653   ; 4 lineas mas arriba...
	dec l			;4654
	dec l			;4655
	dec l			;4656
	ld a,008h		;4657   ; ...y 8 puntos a la derecha
	add a,h			;4659
	ld h,a			;465a
	ld bc,04810h		;465b   ; borra 0x48 x 0x10 en la pagina 0
	xor a			;465e
	ld d,a			;465f
	call rellena		;4660   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
	xor a			;4663   ; ningun objeto elegido
	ld (0c135h),a		;4664   ; guarda el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	jp marcador_objeto		;4667   ; marcador_objeto: pinta en el marcador el objeto elegido (0xC135)
cuatro_ceros:		; pone a cero 4 bytes desde HL
	xor a			;466a
	ld (hl),a			;466b   ; la ficha de 4 bytes a cero
	inc hl			;466c
	ld (hl),a			;466d
	inc hl			;466e
	ld (hl),a			;466f
	inc hl			;4670
	ld (hl),a			;4671
	ret			;4672
colores_del_actor:		; copia los colores del tipo (ix+0) (p05:975A) a la ficha, uno cada 5 bytes desde (ix+0x25)
	ld a,(ix+000h)		;4673   ; lee el tipo del actor
colores_del_tipo:		; copia los colores del tipo A (p05:975A) a la ficha IX, uno cada 5 bytes desde (ix+0x25)
	call bancos_4_5_6		;4676   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	add a,a			;4679   ; 2 x tipo
	ld e,a			;467a
	ld d,000h		;467b
	ld hl,0975ah		;467d   ; p05:975A: un puntero a los colores de cada tipo
	add hl,de			;4680
	ld e,(hl)			;4681   ; DE = los colores del tipo
	inc hl			;4682
	ld d,(hl)			;4683
	push ix		;4684   ; HL = la ficha del actor...
	pop hl			;4686
	ld a,025h		;4687   ; ...+0x25: el color del primer sprite
	call hl_mas_a		;4689   ; hl_mas_a: HL = HL + A
	ld b,(ix+020h)		;468c   ; lee cuantos sprites tiene el actor
L_468F:
	ld a,(de)			;468f   ; un color por sprite
	inc de			;4690
	ld (hl),a			;4691
	inc l			;4692   ; 5 bytes por sprite
	inc l			;4693
	inc l			;4694
	inc l			;4695
	inc l			;4696
	djnz L_468F		;4697   ; siguiente sprite
	jp bancos_1_2_3		;4699   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
ventana_de_armas:		; pinta la ventana de las armas que se llevan (0xC500): dibujo, nombre y municion
	call bancos_4_5_6		;469c   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0b805h		;469f   ; p06:B805: el rotulo de la ventana de armas
	call rotulo		;46a2   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	ld a,(0c13bh)		;46a5   ; con 0xC13B (capturado) la ventana va vacia
	and a			;46a8
	jp nz,bancos_1_2_3		;46a9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,01828h		;46ac   ; el primer hueco en (0x28, 0x18)
	ld (0ec03h),hl		;46af
	ld a,018h		;46b2   ; 0x18 puntos entre hueco y hueco
	ld (0ec05h),a		;46b4
	ld hl,0c500h		;46b7   ; apunta a las armas que se llevan (fichas de 4: [arma][municion BCD])
	ld b,008h		;46ba   ; 8 huecos
L_46BC:
	push bc			;46bc   ; un hueco
	push hl			;46bd
	ld a,(hl)			;46be
	and a			;46bf
	jr z,L_4720		;46c0   ; vacio: al siguiente
	ld (0ec00h),a		;46c2   ; guarda la casilla de trabajo 0xEC00
	inc hl			;46c5   ; DE = la municion (BCD)
	ld e,(hl)			;46c6
	inc hl			;46c7
	ld d,(hl)			;46c8
	ld (0ec01h),de		;46c9   ; guardada en 0xEC01
	ld a,(0ec00h)		;46cd   ; lee la casilla de trabajo 0xEC00
	ld hl,0b855h		;46d0   ; p06:B855: el sitio del dibujo de cada arma en la pagina 1
	call hl_mas_2a_menos_2		;46d3   ; hl_mas_2a_menos_2: HL = HL + 2 x (A - 1)
	ld c,(hl)			;46d6   ; [X | bit 0 = 16 de ancho][Y]
	ld de,(0ec03h)		;46d7
	rr c		;46db   ; bit 0: el dibujo es de 16 de ancho
	ld bc,02010h		;46dd   ; 32 x 16 normalmente...
	jr nc,L_46E7		;46e0
	ld b,c			;46e2   ; ...16 x 16 y 8 puntos mas a la derecha
	ld a,008h		;46e3
	add a,d			;46e5
	ld d,a			;46e6
L_46E7:
	ld a,(hl)			;46e7   ; H = la X y L = la Y del dibujo en la pagina 1
	inc hl			;46e8
	ld l,(hl)			;46e9
	ld h,a			;46ea
	ld a,001h		;46eb   ; de la pagina 1 a la 0
	call copia_vram		;46ed   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld de,0b865h		;46f0   ; p06:B865: el nombre de cada arma
	ld a,(0ec00h)		;46f3   ; lee la casilla de trabajo 0xEC00
	dec a			;46f6
	call palabra_a		;46f7   ; palabra_a: DE = la palabra A de la tabla DE
	ld hl,(0ec03h)		;46fa   ; el nombre, 0x20 puntos a la derecha del dibujo
	ld a,020h		;46fd
	add a,h			;46ff
	ld h,a			;4700
	ex de,hl			;4701
	call rotulo_en_de		;4702   ; rotulo_en_de: escribe los caracteres de HL desde (D, E) (0xFE otra posicion, 0xFF acaba)
	ld a,(0ec00h)		;4705   ; lee la casilla de trabajo 0xEC00
	cp 008h		;4708   ; el arma 8 (SILENCER) no lleva municion
	jr z,L_4720		;470a
	ld hl,(0ec03h)		;470c   ; la municion, 0x50 puntos a la derecha y 8 lineas mas abajo
	ld de,05008h		;470f
	add hl,de			;4712
	ld de,0ec02h		;4713   ; HL = 0xEC02: el byte alto de la municion (se pinta hacia atras)
	ex de,hl			;4716
	call bancos_1_2_3		;4717   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 090eah		;471a   ; p02:90EA: el numero BCD de 2 bytes
	call bancos_4_5_6		;471d   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
L_4720:
	ld a,(0ec03h)		;4720   ; el hueco siguiente, 0x18 lineas mas abajo
	ld hl,0ec05h		;4723
	add a,(hl)			;4726
	ld (0ec03h),a		;4727
	pop hl			;472a   ; siguiente ficha de 0xC500
	ld a,004h		;472b
	call hl_mas_a		;472d   ; hl_mas_a: HL = HL + A
	pop bc			;4730
	ld a,b			;4731   ; tras 3 huecos, la segunda columna en (0x28, 0x88)
	cp 005h		;4732
	jr nz,L_473F		;4734
	ld de,08828h		;4736
	ld (0ec03h),de		;4739
	jr L_474A		;473d
L_473F:
	cp 002h		;473f   ; tras 6, la tercera en (0xA8, 0x60)
	jr nz,L_474A		;4741
	ld de,060a8h		;4743
	ld (0ec03h),de		;4746
L_474A:
	dec b			;474a   ; siguiente hueco
	jp nz,L_46BC		;474b
L_474E:
	jp bancos_1_2_3		;474e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
marcador_arma:		; pinta en el marcador el arma elegida (0xC134) y su municion
	call bancos_4_5_6		;4751   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,09fc1h		;4754   ; el marco del arma en el marcador: (0xC1, 0x9F), 0x3A x 0x12, color 14
	ld de,03a12h		;4757
	ld c,00eh		;475a
	call recuadro		;475c   ; recuadro: un recuadro de D x E desde (H, L) en el color C
	call borra_marcador_arma		;475f   ; borra_marcador_arma: borra el hueco del arma en el marcador (0xA0C2, 0x38 x 0x10)
	ld a,(0c134h)		;4762   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	and a			;4765
	jr z,L_474E		;4766   ; sin arma, el hueco queda vacio
	ld a,(0c134h)		;4768   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	ld hl,0b855h		;476b   ; p06:B855: el sitio del dibujo del arma en la pagina 1
	call hl_mas_2a_menos_2		;476e   ; hl_mas_2a_menos_2: HL = HL + 2 x (A - 1)
	ld c,(hl)			;4771
	ld de,0a0c2h		;4772   ; en el marcador, en (0xC2, 0xA0)
	rr c		;4775   ; bit 0: el dibujo es de 16 de ancho
	ld bc,02010h		;4777
	jr nc,L_4781		;477a
	ld b,c			;477c   ; 16 x 16 y 8 puntos mas a la derecha
	ld a,008h		;477d
	add a,d			;477f
	ld d,a			;4780
L_4781:
	ld a,(hl)			;4781   ; H = la X y L = la Y del dibujo en la pagina 1
	inc hl			;4782
	ld l,(hl)			;4783
	ld h,a			;4784
	ld a,001h		;4785   ; de la pagina 1 a la 0
	call copia_vram		;4787   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	call bancos_1_2_3		;478a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c134h)		;478d   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	call busca_arma		;4790   ; busca_arma: busca A en las 7 armas de 0xC500 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;4793   ; HL = el byte alto de la municion del arma
	inc hl			;4794
pinta_municion:		; el numero BCD de 2 bytes de HL en (0xC0, 0xC8)
	ld de,0c0c8h		;4795   ; en (0xC0, 0xC8)
	jp 090eah		;4798   ; numero_bcd_2: el numero BCD de 2 bytes de HL
borra_marcador_arma:		; borra el hueco del arma en el marcador (0xA0C2, 0x38 x 0x10)
	ld hl,0a0c2h		;479b   ; 0x38 x 0x10 desde (0xC2, 0xA0) a negro
	ld bc,03810h		;479e
	xor a			;47a1
	ld d,a			;47a2
	jp rellena		;47a3   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
ventana_de_equipo:		; pinta la ventana de los objetos que se llevan (0xC530): dibujo y nombre
	call bancos_4_5_6		;47a6   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0b81fh		;47a9   ; p06:B81F: el rotulo de la ventana de equipo
	call rotulo		;47ac   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	ld a,(0c13bh)		;47af   ; con 0xC13B (capturado) la ventana va vacia
	and a			;47b2
	jr nz,L_474E		;47b3
	ld hl,01828h		;47b5   ; el primer hueco en (0x28, 0x18)
	ld (0ec03h),hl		;47b8
	ld hl,0c530h		;47bb   ; apunta a los objetos que se llevan (fichas de 4)
	ld b,019h		;47be   ; 25 huecos
L_47C0:
	push bc			;47c0   ; un hueco
	push hl			;47c1
	ld a,(hl)			;47c2
	and a			;47c3
	jr z,L_481B		;47c4   ; vacio: al siguiente
	ld (0ec00h),a		;47c6   ; guarda la casilla de trabajo 0xEC00
	inc hl			;47c9
	ld e,(hl)			;47ca   ; DE = la cantidad (BCD)
	inc hl			;47cb
	ld d,(hl)			;47cc
	ld (0ec01h),de		;47cd
	ld a,(0ec00h)		;47d1   ; lee la casilla de trabajo 0xEC00
	ld de,0b8c0h		;47d4   ; p06:B8C0: el sitio del dibujo de cada objeto en la pagina 1
	dec a			;47d7
	call palabra_a		;47d8   ; palabra_a: DE = la palabra A de la tabla DE
	ld bc,01010h		;47db   ; todos de 16 x 16
	res 0,e		;47de   ; (sin el bit del ancho)
	ld l,d			;47e0   ; H = la X y L = la Y del dibujo
	ld h,e			;47e1
	ld de,(0ec03h)		;47e2
	ld a,001h		;47e6   ; de la pagina 1 a la 0
	call copia_vram		;47e8   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	ld de,0b8f6h		;47eb   ; p06:B8F6: el nombre de cada objeto
	ld a,(0ec00h)		;47ee   ; lee la casilla de trabajo 0xEC00
	dec a			;47f1
	call palabra_a		;47f2   ; palabra_a: DE = la palabra A de la tabla DE
	ld hl,(0ec03h)		;47f5   ; el nombre, 0x10 puntos a la derecha del dibujo
	ld a,010h		;47f8
	add a,h			;47fa
	ld h,a			;47fb
	ex de,hl			;47fc
	call rotulo_en_de		;47fd   ; rotulo_en_de: escribe los caracteres de HL desde (D, E) (0xFE otra posicion, 0xFF acaba)
	ld a,(0ec00h)		;4800   ; lee la casilla de trabajo 0xEC00
	cp 016h		;4803   ; solo el objeto 0x16 (RATIO) lleva cantidad
	jr nz,L_481B		;4805
	ld hl,(0ec03h)		;4807   ; la cantidad, 0x28 puntos a la derecha y 8 lineas mas abajo
	ld de,02808h		;480a
	add hl,de			;480d
	ld de,0ec02h		;480e
	ex de,hl			;4811
	call bancos_1_2_3		;4812   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call 090eah		;4815   ; p02:90EA: el numero BCD de 2 bytes
	call bancos_4_5_6		;4818   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
L_481B:
	ld a,(0ec03h)		;481b   ; el hueco siguiente, 0x10 lineas mas abajo
	add a,010h		;481e
	ld (0ec03h),a		;4820
	pop hl			;4823   ; siguiente ficha de 0xC530
	ld a,004h		;4824
	call hl_mas_a		;4826   ; hl_mas_a: HL = HL + A
	pop bc			;4829
	ld a,b			;482a   ; tras 8 huecos, la segunda columna en (0x68, 0x28)...
	cp 011h		;482b
	ld de,06828h		;482d
	jr z,L_4838		;4830
	cp 008h		;4832   ; ...y tras 17, la tercera en (0xB8, 0x28)
	jr nz,L_483C		;4834
	ld d,0b8h		;4836
L_4838:
	ld (0ec03h),de		;4838
L_483C:
	dec b			;483c   ; siguiente hueco
	jp nz,L_47C0		;483d
	jp bancos_1_2_3		;4840   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
marcador_objeto:		; pinta en el marcador el objeto elegido (0xC135)
	call bancos_4_5_6		;4843   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0dec1h		;4846   ; el marco del objeto en el marcador: (0xC1, 0xDE), 0x1B x 0x12, color 14
	ld de,01b12h		;4849
	ld c,00eh		;484c
	call recuadro		;484e   ; recuadro: un recuadro de D x E desde (H, L) en el color C
	call borra_marcador_objeto		;4851   ; borra_marcador_objeto: borra el hueco del objeto en el marcador (0xE0C2, 0x18 x 0x10)
	ld a,(0c135h)		;4854   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	and a			;4857   ; sin objeto, el hueco queda vacio
	jp z,bancos_1_2_3		;4858   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0b8c0h		;485b   ; p06:B8C0: el sitio del dibujo del objeto en la pagina 1
	dec a			;485e
	call palabra_a		;485f   ; palabra_a: DE = la palabra A de la tabla DE
	ld bc,01010h		;4862   ; 16 x 16
	res 0,e		;4865
	ld l,d			;4867
	ld h,e			;4868
	ld de,0e0c2h		;4869   ; en el marcador, en (0xC2, 0xE0)
	ld a,001h		;486c   ; de la pagina 1 a la 0
	call copia_vram		;486e   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	call bancos_1_2_3		;4871   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld c,000h		;4874   ; C = 0
	ld a,(0c135h)		;4876   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 00eh		;4879   ; solo las CARD1-8 (0x0E-0x15)...
	ret c			;487b
	cp 016h		;487c
	ret nc			;487e
	call busca_objeto		;487f   ; busca_objeto: busca A en los 25 objetos de 0xC530 (fichas de 4): C = el sitio, Z si esta, acarreo si no
	inc hl			;4882   ; ...llevan su numero ('1'-'8', lo que sumaron al cogerlas)
	ld a,(hl)			;4883
	ld de,0f0c8h		;4884   ; en (0xC8, 0xF0)
	ld c,0ffh		;4887
	jp caracter		;4889   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
borra_marcador_objeto:		; borra el hueco del objeto en el marcador (0xE0C2, 0x18 x 0x10)
	ld hl,0e0c2h		;488c   ; 0x18 x 0x10 desde (0xC2, 0xE0) a negro
	ld bc,01810h		;488f
rellena_pagina_0:		; rellena con D = 0 y A = 0
	xor a			;4892   ; de la pagina 0, a negro
	ld d,a			;4893
	jp rellena		;4894   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
pinta_cantidad:		; la cantidad del objeto C en la ventana de equipo
	push hl			;4897
	call bancos_4_5_6		;4898   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0b9bbh		;489b   ; p06:B9BB: el sitio de cada hueco de la ventana de equipo
	ld a,c			;489e
	inc a			;489f
	call palabra_a		;48a0   ; palabra_a: DE = la palabra A de la tabla DE
	call bancos_1_2_3		;48a3   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ex de,hl			;48a6
	ld a,004h		;48a7   ; la cantidad, 4 lineas mas abajo...
	add a,l			;48a9
	ld l,a			;48aa
	ld a,030h		;48ab   ; ...y 0x30 puntos a la derecha
	add a,h			;48ad
	ld h,a			;48ae
	push hl			;48af
	ld bc,01808h		;48b0   ; borra 0x18 x 8
	call rellena_pagina_0		;48b3   ; rellena_pagina_0: rellena con D = 0 y A = 0
	pop de			;48b6
	pop hl			;48b7
	inc hl			;48b8   ; HL = el byte alto de la cantidad
	inc hl			;48b9
	jp 090eah		;48ba   ; p02:90EA: el numero BCD de 2 bytes
llamadas_de_la_sala:		; carga las llamadas de radio de la sala (p15:B6C6) en 0xC880 (fichas de 0x1D) y cuantas en 0xC87F
	call bancos_13_14_15		;48bd   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0b6c6h		;48c0   ; p15:B6C6: las llamadas de radio de cada sala
	call palabra_de_la_sala		;48c3   ; palabra_de_la_sala: DE = la palabra de la tabla DE que toca a la sala (0xC130)
	ex de,hl			;48c6
	ld a,(hl)			;48c7   ; 0: la sala no tiene llamadas
	and a			;48c8
	ld c,000h		;48c9   ; C = cuantas
	jr z,L_4905		;48cb
	ld de,0c880h		;48cd   ; apunta a las llamadas de radio de la sala (fichas de 0x1D)
L_48D0:
	ld a,(hl)			;48d0   ; una llamada: el nibble alto del primer byte...
	rra			;48d1
	rra			;48d2
	rra			;48d3
	rra			;48d4
	and 00fh		;48d5
	dec a			;48d7   ; ...elige los decimales de la frecuencia (1-7)
	push de			;48d8
	ld de,0490ch		;48d9
	call de_mas_a		;48dc   ; de_mas_a: DE = DE + A
	ld a,(de)			;48df
	pop de			;48e0
	ld (de),a			;48e1   ; +0: la frecuencia (BCD)
	ld b,a			;48e2
	ld a,(hl)			;48e3   ; los bits 2-3 del primer byte
	rra			;48e4
	rra			;48e5
	and 003h		;48e6
	inc de			;48e8
	inc de			;48e9
	ld (de),a			;48ea   ; +2: las banderas de la llamada
	bit 1,a		;48eb   ; bit 1: es la frecuencia que se pone sola
	jr z,L_48F3		;48ed
	ld a,b			;48ef
	ld (0c138h),a		;48f0   ; guarda la frecuencia del transceptor (BCD)
L_48F3:
	inc de			;48f3
	ld b,(hl)			;48f4   ; B = el primer byte (bit 0: es la ultima)
	inc hl			;48f5
	ld a,(hl)			;48f6   ; +3: el segundo byte (el texto)
	ld (de),a			;48f7
	inc c			;48f8   ; una llamada mas
	bit 0,b		;48f9   ; bit 0: no hay mas
	jr nz,L_4905		;48fb
	inc hl			;48fd   ; siguiente llamada de la lista
	ld a,01dh		;48fe   ; las fichas de 0xC880 son de 0x20 bytes (0x1D + los 3 de arriba)
	call de_mas_a		;4900   ; de_mas_a: DE = DE + A
	jr L_48D0		;4903
L_4905:
	ld a,c			;4905
	ld (0c87fh),a		;4906   ; guarda cuantas llamadas de radio tiene la sala
	jp bancos_1_2_3		;4909   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)

; ----------------------------------------------------------------------
; DATOS decimales_de_las_frecuencias: los decimales de las 7 frecuencias del
;   transceptor en BCD (120.85, 120.79, 120.33, 120.26, 120.91, 120.48 y
;   120.13): p00:48D9 lee 0x490C + nibble alto - 1 de cada llamada de radio
;   (0xB659 del banco 15) y lo deja en 0xC880 + 0x1D x n, y en 0xC138 si el
;   bit 1 esta puesto
;   0x490c..0x4913  (7 bytes)
DATA_decimales_de_las_frecuencias:
	defb 085h,079h,033h,026h,091h,048h,013h	; 490c

; ======================================================================
; CODIGO 0x4913..0x4aa3  (400 bytes)
; ======================================================================


zona_banco_6:		; pone el banco 6 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	di			;4913   ; sin interrupciones mientras se toca el mapper
	push af			;4914
	ld a,006h		;4915
	jr L_4929		;4917
zona_banco_9:		; pone el banco 9 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	di			;4919
	push af			;491a
	ld a,009h		;491b
	jr L_4929		;491d
zona_banco_12:		; pone el banco 12 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	di			;491f
	push af			;4920
	ld a,00ch		;4921
	jr L_4929		;4923
zona_banco_15:		; pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	di			;4925
	push af			;4926
	ld a,00fh		;4927
L_4929:
	ld (0f0f3h),a		;4929   ; guarda la copia del banco de 0xA000
	ld (0a000h),a		;492c   ; el mapper: pone en 0xA000 el banco de A
	ld (0f0f6h),a		;492f   ; guarda el banco de zona de 0xA000
	pop af			;4932   ; A no cambia
	ei			;4933
	ret			;4934
juego_de_fichas:		; carga el juego de fichas de la sala (nibble p07:6000) si no es el de 0xC157, y sus bits de choque en 0xC700
	call colores_por_defecto		;4935   ; colores_por_defecto: copia los 8 colores de 0x4B13 a 0xE700 (los de las fichas en 3 planos)
	call bancos_7_8_9		;4938   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,06000h		;493b   ; p07:6000: el juego de fichas de cada sala, un nibble por sala
	call nibble_de_la_sala		;493e   ; nibble_de_la_sala: A = el nibble de la tabla HL que toca a la sala (0xC130)
	ld hl,0c157h		;4941   ; apunta a el juego de fichas cargado
	cp (hl)			;4944   ; si ya esta cargado, nada que hacer
	jp z,bancos_1_2_3		;4945   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld e,(hl)			;4948   ; E = el juego de antes
	ld (hl),a			;4949   ; el juego nuevo
	push af			;494a
	call fichas_del_interruptor		;494b   ; fichas_del_interruptor: carga las fichas p15:B2BF en 0x9048 (VRAM)
	call bancos_7_8_9		;494e   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	pop af			;4951
	cp 006h		;4952   ; el juego 6 no lleva las cajas
	jr z,L_495E		;4954
	push af			;4956
	call fichas_de_las_cajas		;4957   ; fichas_de_las_cajas: carga las fichas p09:9509 en 0x9400 y 0x9840 (VRAM)
	call bancos_7_8_9		;495a   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	pop af			;495d
L_495E:
	ld de,0607eh		;495e   ; p07:607E: los descriptores de cada juego (hasta 3 de 5 bytes)
	call palabra_a		;4961   ; palabra_a: DE = la palabra A de la tabla DE
	push de			;4964   ; IX = los descriptores
	pop ix		;4965
	ld b,003h		;4967
L_4969:
	ld a,(ix+000h)		;4969   ; bit 7 del primer byte: no hay mas
	rla			;496c
	jr c,L_4979		;496d
	call descriptor_de_fichas		;496f   ; descriptor_de_fichas: carga un descriptor de juego de fichas (IX, 5 bytes) con L_524C o L_5265
	ld de,00005h		;4972   ; siguiente descriptor
	add ix,de		;4975
	djnz L_4969		;4977
L_4979:
	call bancos_1_2_3		;4979   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c157h)		;497c   ; lee el juego de fichas cargado
	call bancos_7_8_9		;497f   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0c700h		;4982   ; 0xC700: un byte por ficha, su bit de choque
	exx			;4985
	ld hl,060dbh		;4986   ; p07:60DB: los bits de choque de cada juego (32 bytes = 256 fichas)
	call hl_mas_2a		;4989   ; hl_mas_2a: HL = HL + 2 x A
	ld a,(hl)			;498c   ; HL = los bits del juego
	inc hl			;498d
	ld h,(hl)			;498e
	ld l,a			;498f
	ld c,020h		;4990   ; 32 bytes
L_4992:
	ld a,(hl)			;4992   ; 8 fichas por byte
	exx			;4993
	ld b,008h		;4994
L_4996:
	rlca			;4996   ; del bit 7 al bit 0...
	ld d,a			;4997
	and 001h		;4998   ; ...uno por ficha en 0xC700 (1 = choca)
	ld (hl),a			;499a
	ld a,d			;499b
	inc l			;499c   ; siguiente ficha
	djnz L_4996		;499d
	exx			;499f
	inc hl			;49a0   ; siguiente byte
	dec c			;49a1
	jr nz,L_4992		;49a2
	jp bancos_1_2_3		;49a4   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
descriptor_de_fichas:		; carga un descriptor de juego de fichas (IX, 5 bytes) con L_524C o L_5265
	push bc			;49a7
	bit 6,(ix+000h)		;49a8   ; bit 6: las mismas fichas de antes en espejo
	jr nz,L_49CB		;49ac
	ld b,(ix+001h)		;49ae   ; +1: cuantas fichas
	ld a,b			;49b1
	ld (0ec00h),a		;49b2   ; guarda la casilla de trabajo 0xEC00
	ld a,(ix+002h)		;49b5   ; +2: la primera ficha del juego (donde van en la VRAM)
	call sitio_de_ficha		;49b8   ; sitio_de_ficha: HL = 0x8000 + la direccion VRAM de la ficha A (8 x 8 en SCREEN 5)
	ld e,(ix+003h)		;49bb   ; +3, +4: donde estan en el cartucho
	ld d,(ix+004h)		;49be
	ld (0ec01h),de		;49c1
	ex de,hl			;49c5   ; HL = los datos, DE = la VRAM
	call fichas_3_planos		;49c6   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	pop bc			;49c9
	ret			;49ca
L_49CB:
	ld a,(0ec00h)		;49cb   ; en espejo: la misma cuenta y los mismos datos
	ld b,a			;49ce
	ld a,(ix+001h)		;49cf   ; +1: la primera ficha
	call sitio_de_ficha		;49d2   ; sitio_de_ficha: HL = 0x8000 + la direccion VRAM de la ficha A (8 x 8 en SCREEN 5)
	ld de,(0ec01h)		;49d5
	ex de,hl			;49d9
	call fichas_3_planos_espejo		;49da   ; fichas_3_planos_espejo: como fichas_3_planos, pero cada ficha volteada de lado
	pop bc			;49dd
	ret			;49de
sitio_de_ficha:		; HL = 0x8000 + la direccion VRAM de la ficha A (8 x 8 en SCREEN 5)
	ld c,a			;49df   ; C = la ficha
	and 0e0h		;49e0   ; la fila (A / 32)...
	call cuatro_a		;49e2   ; cuatro_a: HL = 4 x A
	add hl,hl			;49e5   ; ...por 0x400 (8 lineas de 0x80 bytes)
	add hl,hl			;49e6
	add hl,hl			;49e7
	ld a,c			;49e8   ; la columna (A mod 32)...
	and 01fh		;49e9
	add a,a			;49eb   ; ...por 4 (8 puntos de 4 bits)
	call hl_mas_2a		;49ec   ; hl_mas_2a: HL = HL + 2 x A
	ld de,08000h		;49ef   ; + 0x8000: la pagina 1
	add hl,de			;49f2
	ret			;49f3
fichas_de_las_puertas:		; copia las fichas de las puertas (p07:61C9-6749) a la pagina 1
	call bancos_7_8_9		;49f4   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,061c9h		;49f7   ; p07:61C9: 4 x 4 fichas en (192, 160) de la pagina 1
	ld de,0d060h		;49fa
	ld bc,00404h		;49fd
	push bc			;4a00
	call bloque_de_fichas		;4a01   ; bloque_de_fichas: copia C filas de B fichas de 32 bytes de HL a la VRAM DE (0x400 por fila)
	pop bc			;4a04
	ld hl,063c9h		;4a05   ; p07:63C9: 4 x 4 fichas en (192, 192)
	ld de,0e060h		;4a08
	call bloque_de_fichas		;4a0b   ; bloque_de_fichas: copia C filas de B fichas de 32 bytes de HL a la VRAM DE (0x400 por fila)
	ld hl,065c9h		;4a0e   ; p07:65C9: 1 x 4 fichas en (224, 160)
	ld de,0d070h		;4a11
	ld bc,00104h		;4a14
	push bc			;4a17
	call bloque_de_fichas		;4a18   ; bloque_de_fichas: copia C filas de B fichas de 32 bytes de HL a la VRAM DE (0x400 por fila)
	pop bc			;4a1b
	ld hl,06649h		;4a1c   ; p07:6649: 1 x 4 fichas en (232, 160)
	ld de,0d074h		;4a1f
	call bloque_de_fichas		;4a22   ; bloque_de_fichas: copia C filas de B fichas de 32 bytes de HL a la VRAM DE (0x400 por fila)
	ld hl,066c9h		;4a25   ; p07:66C9: 4 x 1 fichas en (224, 192)
	ld de,0e070h		;4a28
	ld bc,00401h		;4a2b
	call bloque_de_fichas		;4a2e   ; bloque_de_fichas: copia C filas de B fichas de 32 bytes de HL a la VRAM DE (0x400 por fila)
	jr L_4A66		;4a31
bloque_de_fichas:		; copia C filas de B fichas de 32 bytes de HL a la VRAM DE (0x400 por fila)
	push bc			;4a33   ; una fila de B fichas
	push de			;4a34
	call fichas_a_vram		;4a35   ; fichas_a_vram: B fichas de 32 bytes de HL a la VRAM DE, de 8 en 8 puntos y 8 lineas mas abajo cada 32
	pop de			;4a38
	ex de,hl			;4a39
	ld bc,00400h		;4a3a   ; la fila siguiente, 8 lineas mas abajo
	add hl,bc			;4a3d
	ex de,hl			;4a3e
	pop bc			;4a3f
	dec c			;4a40   ; C filas
	jr nz,bloque_de_fichas		;4a41
	ret			;4a43
sprites_de_la_sala:		; carga los patrones del juego de sprites de la sala (p10:6185, p10:6280) en 0xF800
	call bancos_10_11_12		;4a44   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c130h)		;4a47   ; lee la sala
	ld hl,06185h		;4a4a   ; p10:6185: el juego de sprites de cada sala
	call hl_mas_a		;4a4d   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;4a50
	ld de,06280h		;4a51   ; p10:6280: las ternas de cada juego
	call palabra_a		;4a54   ; palabra_a: DE = la palabra A de la tabla DE
L_4A57:
	ld a,(de)			;4a57   ; 0xFF acaba la lista
	inc a			;4a58
	jr z,L_4A66		;4a59
	dec a			;4a5b
	push de			;4a5c
	call patrones_de_terna		;4a5d   ; patrones_de_terna: descomprime una terna [patron][origen] a 0xF800 + 8 x patron
	pop de			;4a60
	inc de			;4a61   ; siguiente terna
	inc de			;4a62
	inc de			;4a63
	jr L_4A57		;4a64
L_4A66:
	jp bancos_1_2_3		;4a66   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
patrones_de_terna:		; descomprime una terna [patron][origen] a 0xF800 + 8 x patron
	ld a,(de)			;4a69   ; [patron]...
	call cuatro_a		;4a6a   ; cuatro_a: HL = 4 x A
	add hl,hl			;4a6d   ; ...por 8 bytes
	inc de			;4a6e
	ld a,(de)			;4a6f   ; [origen] de 16 bits
	ld c,a			;4a70
	inc de			;4a71
	ld a,(de)			;4a72
	ld de,0f800h		;4a73   ; + 0xF800: la tabla de patrones
	add hl,de			;4a76
	ld d,a			;4a77   ; DE = el origen
	ld e,c			;4a78
	jp patrones		;4a79   ; patrones: descomprime DE a la VRAM HL (n < 0x80 repite, n > 0x80 copia, 0x80 otro destino, 0 acaba)
montaje_a559:		; el montaje p09:A559 de fichas del bloque en (0x40, 0xA0) de la pagina 1
	call bancos_7_8_9		;4a7c   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	jr L_4A87		;4a7f
fichas_y_montaje_a559:		; B fichas de 2 planos de HL a la VRAM DE y el montaje p09:A559
	call bancos_7_8_9		;4a81   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	call fichas_2_planos		;4a84   ; fichas_2_planos: B fichas de 2 planos (16 bytes) de HL a la VRAM DE con los colores de 0xE700
L_4A87:
	ld hl,0a559h		;4a87   ; p09:A559: la lista de fichas del pozo
	ld de,040a0h		;4a8a   ; en (0x40, 0xA0) de la pagina 1
	call lista_de_fichas		;4a8d   ; lista_de_fichas: pinta la lista HL de fichas del bloque desde (D, E) (0xFE baja 8, 0xFF acaba)
	jr L_4A66		;4a90
paleta_del_juego:		; manda al VDP la paleta p05:8B0B
	call bancos_4_5_6		;4a92   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,08b0bh		;4a95   ; p05:8B0B: la paleta comun de la partida
	call paleta		;4a98   ; paleta: manda al VDP la lista de HL: [color][RB][G] ... 0xFF
	jr L_4A66		;4a9b
paleta_de_snake:		; manda al VDP los colores 7 y 10 (0x4AA3)
	ld hl,04aa3h		;4a9d
	jp paleta		;4aa0   ; paleta: manda al VDP la lista de HL: [color][RB][G] ... 0xFF

; ----------------------------------------------------------------------
; DATOS paleta_de_snake: dos ternas [registro][RB][G] (los colores 7 y 10) y
;   0xFF, que p00:4A9D manda al VDP con L_4EC4
;   0x4aa3..0x4aaa  (7 bytes)
DATA_paleta_de_snake:
	defb 007h,012h,002h	; 4aa3
	defb 00ah,063h,004h	; 4aa6
	defb 0ffh	; 4aa9

; ======================================================================
; CODIGO 0x4aaa..0x4b13  (105 bytes)
; ======================================================================


paleta_del_transceptor:		; manda al VDP la paleta p05:8B1E
	call bancos_4_5_6		;4aaa   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,08b1eh		;4aad   ; p05:8B1E
	call paleta		;4ab0   ; paleta: manda al VDP la lista de HL: [color][RB][G] ... 0xFF
	jr L_4B10		;4ab3
paleta_de_sprites:		; manda al VDP la paleta del juego de sprites de la sala (p05:8CB4)
	call bancos_10_11_12		;4ab5   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,06185h		;4ab8   ; p10:6185: el juego de sprites de la sala...
	ld a,(0c130h)		;4abb   ; lee la sala
	call hl_mas_a		;4abe   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;4ac1
	call bancos_4_5_6		;4ac2   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,08cb4h		;4ac5   ; ...elige su paleta en p05:8CB4
	jp L_4B09		;4ac8
paleta_de_la_sala:		; manda al VDP la paleta de la sala (nibble p05:8B40, tabla p05:8BBE)
	ld hl,08b40h		;4acb   ; p05:8B40: la paleta de cada sala, un nibble por sala
	call bancos_4_5_6		;4ace   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c130h)		;4ad1   ; lee la sala
	ld b,a			;4ad4
	cp 0fbh		;4ad5   ; la sala 0xFB: la suya siempre
	jr z,L_4AFF		;4ad7
	cp 0dch		;4ad9   ; las salas 0xDC, 0xDD y 0x7B-0x7D son oscuras:
	jr z,L_4AE9		;4adb
	cp 0ddh		;4add
	jr z,L_4AE9		;4adf
	cp 07eh		;4ae1
	jr nc,L_4AF4		;4ae3
	cp 07bh		;4ae5
	jr c,L_4AF4		;4ae7
L_4AE9:
	ld a,(0c135h)		;4ae9   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 003h		;4aec   ; con LIGHT (objeto 3), la paleta normal...
	jr z,L_4AF4		;4aee
	ld a,00bh		;4af0   ; ...si no, la oscura (0x0B)
	jr paleta_a		;4af2
L_4AF4:
	ld a,(0c135h)		;4af4   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 004h		;4af7   ; con GOGGL (objeto 4), la paleta 0x0A
	jr nz,L_4AFF		;4af9
	ld a,00ah		;4afb
	jr paleta_a		;4afd
L_4AFF:
	ld a,b			;4aff   ; el nibble de la sala
	call nibble_a		;4b00   ; nibble_a: A = el nibble A de la tabla HL (el alto si A es par)
paleta_a:		; manda al VDP la paleta A de la tabla p05:8BBE
	call bancos_4_5_6		;4b03   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,08bbeh		;4b06   ; p05:8BBE: las paletas
L_4B09:
	call palabra_a		;4b09   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;4b0c   ; HL = la paleta A
	call paleta		;4b0d   ; paleta: manda al VDP la lista de HL: [color][RB][G] ... 0xFF
L_4B10:
	jp bancos_1_2_3		;4b10   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)

; ----------------------------------------------------------------------
; DATOS colores_por_defecto: 8 bytes: a que color de la paleta va cada indice
;   de 3 bits de las fichas en 3 planos (L_5288); L_42C4 los copia a 0xE700
;   (desde p00:4935, 4BBF, 4BD2 y 4B55)
;   0x4b13..0x4b1b  (8 bytes)
DATA_colores_por_defecto:
	defb 001h,003h,005h,008h,009h,00ch,00eh,00fh	; 4b13  ........

; ----------------------------------------------------------------------
; DATOS colores_de_los_objetos: 8 bytes de la misma tabla para las fichas de
;   objetos del banco 6 (p00:4B39 -> L_42C7)
;   0x4b1b..0x4b23  (8 bytes)
DATA_colores_de_los_objetos:
	defb 000h,006h,007h,008h,00ah,00ch,00eh,00fh	; 4b1b  ........

; ----------------------------------------------------------------------
; DATOS colores_de_la_camara: 4 bytes (fichas en 2 planos, L_5221) para la
;   camara (p00:4B71 -> L_42C9 con C = 4)
;   0x4b23..0x4b27  (4 bytes)
DATA_colores_de_la_camara:
	defb 000h,002h,00dh,00fh	; 4b23

; ----------------------------------------------------------------------
; DATOS colores_del_pozo: 4 bytes que p03:A6BC copia a 0xE700 (C = 4) antes de
;   pintar el pozo
;   0x4b27..0x4b2b  (4 bytes)
DATA_colores_del_pozo:
	defb 000h,005h,009h,00fh	; 4b27

; ----------------------------------------------------------------------
; DATOS colores_del_retrato: 8 bytes para el retrato de Snake del banco 9
;   (p00:4B92 -> L_42C7)
;   0x4b2b..0x4b33  (8 bytes)
DATA_colores_del_retrato:
	defb 002h,004h,008h,00bh,00dh,00ch,00eh,00fh	; 4b2b  ........

; ======================================================================
; CODIGO 0x4b33..0x4ea4  (881 bytes)
; ======================================================================


fichas_del_marcador:		; carga en la pagina 1 las fichas de los objetos, del marcador, de la camara y del retrato
	call fichas_de_las_cajas		;4b33   ; fichas_de_las_cajas: carga las fichas p09:9509 en 0x9400 y 0x9840 (VRAM)
	call bancos_4_5_6		;4b36   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,04b1bh		;4b39   ; los colores de las fichas de objetos
	call ocho_colores		;4b3c   ; ocho_colores: copia 8 colores de HL a 0xE700
	ld hl,0a75dh		;4b3f   ; p06:A75D: 132 fichas de objetos en (0, 0x60) de la pagina 1
	ld de,0b000h		;4b42
	ld b,084h		;4b45
	call fichas_3_planos		;4b47   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	ld hl,0b3bdh		;4b4a   ; p06:B3BD: 4 fichas en (0, 0x88)
	ld de,0c400h		;4b4d
	ld b,004h		;4b50
	call fichas_3_planos		;4b52   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	ld hl,04b13h		;4b55   ; los colores normales
	call ocho_colores		;4b58   ; ocho_colores: copia 8 colores de HL a 0xE700
	ld hl,0b41dh		;4b5b   ; p06:B41D: 31 fichas en (8, 0x90)
	ld de,0c804h		;4b5e
	ld b,01fh		;4b61
	call fichas_3_planos		;4b63   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	ld hl,0b65dh		;4b66   ; p06:B65D: 7 fichas en espejo en (0, 0x98)
	ld de,0cc00h		;4b69
	ld b,007h		;4b6c
	call fichas_3_planos_espejo		;4b6e   ; fichas_3_planos_espejo: como fichas_3_planos, pero cada ficha volteada de lado
	ld hl,04b23h		;4b71   ; los 4 colores de la camara
	ld c,004h		;4b74
	call c_colores		;4b76   ; c_colores: copia C colores de HL a 0xE700
	ld hl,0b705h		;4b79   ; p06:B705: 8 fichas de 2 planos en (0x20, 0x80)
	ld de,0c010h		;4b7c
	ld b,008h		;4b7f
	call fichas_2_planos		;4b81   ; fichas_2_planos: B fichas de 2 planos (16 bytes) de HL a la VRAM DE con los colores de 0xE700
	ld hl,0b785h		;4b84   ; p06:B785: 8 fichas de 2 planos en (0x20, 0x88)
	ld de,0c410h		;4b87
	ld b,008h		;4b8a
	call fichas_2_planos		;4b8c   ; fichas_2_planos: B fichas de 2 planos (16 bytes) de HL a la VRAM DE con los colores de 0xE700
	call bancos_7_8_9		;4b8f   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,04b2bh		;4b92   ; los colores del retrato
	call ocho_colores		;4b95   ; ocho_colores: copia 8 colores de HL a 0xE700
	ld hl,0aba1h		;4b98   ; p09:ABA1: 16 fichas del retrato en (0x80, 0x80)
	ld de,0c040h		;4b9b
	ld b,010h		;4b9e
	call fichas_3_planos		;4ba0   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	ld hl,0ad21h		;4ba3   ; p09:AD21: 3 fichas en (0x80, 0x88)
	ld de,0c440h		;4ba6
	ld b,003h		;4ba9
	call fichas_3_planos		;4bab   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
L_4BAE:
	jp bancos_1_2_3		;4bae   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
rotulo_b833:		; escribe el rotulo p06:B833
	call bancos_4_5_6		;4bb1   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0b833h		;4bb4   ; p06:B833
	call rotulo		;4bb7   ; rotulo: escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	jr L_4BAE		;4bba
fichas_del_interruptor:		; carga las fichas p15:B2BF en 0x9048 (VRAM)
	call bancos_13_14_15		;4bbc   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	call colores_por_defecto		;4bbf   ; colores_por_defecto: copia los 8 colores de 0x4B13 a 0xE700 (los de las fichas en 3 planos)
	ld hl,0b2bfh		;4bc2   ; p15:B2BF: 4 fichas del interruptor
	ld de,09048h		;4bc5   ; en la ficha 0x12 de la pagina 1 (0x9048)
	ld b,004h		;4bc8
	call fichas_3_planos		;4bca   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	jr L_4BAE		;4bcd
fichas_de_las_cajas:		; carga las fichas p09:9509 en 0x9400 y 0x9840 (VRAM)
	call bancos_7_8_9		;4bcf   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	call colores_por_defecto		;4bd2   ; colores_por_defecto: copia los 8 colores de 0x4B13 a 0xE700 (los de las fichas en 3 planos)
	ld hl,09509h		;4bd5   ; p09:9509: 8 fichas de las cajas...
	ld de,09400h		;4bd8   ; ...en la ficha 0x80 de la pagina 1 (0x9400)...
	ld b,008h		;4bdb
	push hl			;4bdd
	call fichas_3_planos		;4bde   ; fichas_3_planos: B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	pop hl			;4be1
	ld de,09840h		;4be2   ; ...y en espejo en la 0x90 (0x9840)
	ld b,008h		;4be5
	call fichas_3_planos_espejo		;4be7   ; fichas_3_planos_espejo: como fichas_3_planos, pero cada ficha volteada de lado
L_4BEA:
	jr L_4BAE		;4bea
patrones_del_arma:		; carga los patrones del arma elegida (p10:6392) y los de su explosion
	call bancos_10_11_12		;4bec   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c134h)		;4bef   ; lee el arma elegida (p06:B865: 1 HAND GUN, 2 SMG, 3 GRENADE, 4 ROCKET, 5 P.BOMB, 6 L.MINE, 7 MISSILE, 8 SILENCER)
	and a			;4bf2   ; sin arma, nada
	jr z,L_4BEA		;4bf3
	push af			;4bf5
	cp 004h		;4bf6   ; el ROCKET y el MISSILE cargan los suyos al dispararlos
	jr z,L_4C0B		;4bf8
	cp 007h		;4bfa
	jr z,L_4C0B		;4bfc
	dec a			;4bfe
	ld de,06392h		;4bff   ; p10:6392: los patrones de cada arma
	call palabra_a		;4c02   ; palabra_a: DE = la palabra A de la tabla DE
	ld hl,0f880h		;4c05   ; en el patron 0x10 (0xF880)
	call patrones		;4c08   ; patrones: descomprime DE a la VRAM HL (n < 0x80 repite, n > 0x80 copia, 0x80 otro destino, 0 acaba)
L_4C0B:
	pop af			;4c0b
	sub 003h		;4c0c   ; la explosion: nada con las armas 1 y 2
	jr c,L_4BEA		;4c0e
	jr z,L_4C23		;4c10   ; la GRENADE (3)...
	dec a			;4c12
	jr z,L_4C1B		;4c13
	dec a			;4c15
	jr z,L_4C1B		;4c16
	dec a			;4c18   ; ...y la L.MINE (6): la explosion pequena
	jr z,L_4C23		;4c19
L_4C1B:
	ld hl,0f8c0h		;4c1b   ; el ROCKET, la P.BOMB y el MISSILE: p10:77D3 en el patron 0x18
	ld de,077d3h		;4c1e
	jr L_4C29		;4c21
L_4C23:
	ld hl,0f900h		;4c23   ; p10:773E en el patron 0x20
	ld de,0773eh		;4c26
L_4C29:
	call patrones		;4c29   ; patrones: descomprime DE a la VRAM HL (n < 0x80 repite, n > 0x80 copia, 0x80 otro destino, 0 acaba)
	jr L_4BEA		;4c2c
patrones_del_cohete:		; carga los patrones del proyectil por la direccion (ix+0x0C) en 0xF880
	call bancos_10_11_12		;4c2e   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(ix+00ch)		;4c31   ; la direccion del proyectil (1-4)...
	dec a			;4c34
	call palabra_a		;4c35   ; ...elige sus patrones en la tabla DE
	ld hl,0f880h		;4c38   ; en el patron 0x10
	call patrones		;4c3b   ; patrones: descomprime DE a la VRAM HL (n < 0x80 repite, n > 0x80 copia, 0x80 otro destino, 0 acaba)
	jr L_4BEA		;4c3e
patrones_a6f9:		; los patrones de p06:A6F9 (con su destino)
	call bancos_4_5_6		;4c40   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0a6f9h		;4c43   ; p06:A6F9: patrones con su destino
	call patrones_con_destino		;4c46   ; patrones_con_destino: lee la direccion VRAM de DE y descomprime detras
	jr L_4BEA		;4c49
graficos_del_logotipo_konami:		; carga los tres bloques de 1 bit del logotipo de Konami (p09:B719, B781, B7E9) y pinta su montaje p09:B6D8
	call bancos_7_8_9		;4c4b   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0b719h		;4c4e   ; p09:B719: 13 caracteres de 1 bit en el color 1...
	ld de,00800h		;4c51   ; ...desde (0, 0x10) de la pagina 1
	ld bc,00d01h		;4c54
	call caracteres_1_bit		;4c57   ; caracteres_1_bit: B caracteres de 1 bit de HL en el color C a la pagina 1 desde (D, E)
	ld hl,0b781h		;4c5a   ; p09:B781: 13 en el color 2 desde (0, 0xE0)
	ld de,07000h		;4c5d
	ld bc,00d02h		;4c60
	call caracteres_1_bit		;4c63   ; caracteres_1_bit: B caracteres de 1 bit de HL en el color C a la pagina 1 desde (D, E)
	ld hl,0b7e9h		;4c66   ; p09:B7E9: 26 en el color 3 desde (0, 0xB0)
	ld de,0d800h		;4c69
	ld bc,01a03h		;4c6c
	call caracteres_1_bit		;4c6f   ; caracteres_1_bit: B caracteres de 1 bit de HL en el color C a la pagina 1 desde (D, E)
	ld de,04040h		;4c72   ; el montaje p09:B6D8 desde (0x40, 0x40)
	ld hl,0b6d8h		;4c75
L_4C78:
	push de			;4c78   ; una fila
L_4C79:
	ld a,(hl)			;4c79   ; 0xFF acaba
	inc hl			;4c7a
	ld c,a			;4c7b
	inc a			;4c7c
	jr z,L_4C96		;4c7d
	inc a			;4c7f   ; 0xFE: fila nueva...
	jr nz,L_4C8D		;4c80
	pop de			;4c82
	ld a,(hl)			;4c83   ; ...con el desplazamiento X que sigue...
	inc hl			;4c84
	add a,d			;4c85
	ld d,a			;4c86
	ld a,008h		;4c87   ; ...y 8 lineas mas abajo
	add a,e			;4c89
	ld e,a			;4c8a
	jr L_4C78		;4c8b
L_4C8D:
	ld a,c			;4c8d   ; otro: la ficha C de la pagina 1 en (D, E)
	call ficha_en_pagina_1		;4c8e   ; ficha_en_pagina_1: copia la ficha A de la pagina 1 a (D, E) de la pagina 1
	call siguiente_sitio		;4c91   ; siguiente_sitio: D = D + 8; si da la vuelta, E = E + 8
	jr L_4C79		;4c94
L_4C96:
	pop de			;4c96
	jp bancos_1_2_3		;4c97   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
metafichas:		; pone 8 metafichas de 4 x 4 de la lista HL en 0xEC00.. (filas de 32)
	ld a,008h		;4c9a   ; 8 metafichas por fila
	ld (0ec06h),a		;4c9c
	ld (0ec00h),de		;4c9f   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld (0ec04h),hl		;4ca3   ; 0xEC04 = la lista de metafichas
	ld hl,061f6h		;4ca6   ; p13:61F6: el juego de metafichas de la sala, un nibble por sala
	call nibble_de_la_sala		;4ca9   ; nibble_de_la_sala: A = el nibble de la tabla HL que toca a la sala (0xC130)
	dec a			;4cac
	ld de,06274h		;4cad   ; p13:6274: los 6 juegos de metafichas
	call palabra_a		;4cb0   ; palabra_a: DE = la palabra A de la tabla DE
	ld (0ec02h),de		;4cb3   ; 0xEC02 = el juego
L_4CB7:
	ld hl,(0ec04h)		;4cb7   ; la metaficha siguiente de la lista
	ld a,(hl)			;4cba
	inc hl			;4cbb
	ld (0ec04h),hl		;4cbc
	ld de,(0ec02h)		;4cbf
	call cuatro_a_menos_4		;4cc3   ; cuatro_a_menos_4: HL = 4 x (A - 1)
	add hl,hl			;4cc6   ; 16 bytes por metaficha (4 x 4 fichas)
	add hl,hl			;4cc7
	add hl,de			;4cc8
	ld de,(0ec00h)		;4cc9   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld c,004h		;4ccd   ; 4 filas...
L_4CCF:
	ld b,004h		;4ccf   ; ...de 4 fichas
L_4CD1:
	ld a,(hl)			;4cd1
	ld (de),a			;4cd2
	inc hl			;4cd3
	inc de			;4cd4
	djnz L_4CD1		;4cd5
	ld a,01ch		;4cd7   ; la fila siguiente de la sala montada (32 - 4)
	call de_mas_a		;4cd9   ; de_mas_a: DE = DE + A
	dec c			;4cdc
	jr nz,L_4CCF		;4cdd
	ex de,hl			;4cdf   ; arriba otra vez, 4 fichas a la derecha
	and a			;4ce0
	ld de,0007ch		;4ce1
	sbc hl,de		;4ce4
	ld (0ec00h),hl		;4ce6   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld hl,0ec06h		;4ce9   ; siguiente metaficha
	dec (hl)			;4cec
	jr nz,L_4CB7		;4ced
	ret			;4cef
monta_la_sala:		; monta la sala (p13:6000) en 0xE000 y la pinta en la VRAM
	call bancos_13_14_15		;4cf0   ; bancos_13_14_15: pone los bancos 13, 14 y 15 (y sus copias en 0xF0F1-0xF0F3)
	call borra_la_pagina_0		;4cf3   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
	ld hl,0e000h		;4cf6   ; la sala montada: 32 x 24 fichas desde 0xE000
	ld (0ec00h),hl		;4cf9   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld de,06000h		;4cfc   ; p13:6000: la lista de metafichas de cada sala
	call palabra_de_la_sala		;4cff   ; palabra_de_la_sala: DE = la palabra de la tabla DE que toca a la sala (0xC130)
	ex de,hl			;4d02
	ld b,006h		;4d03   ; 6 filas de metafichas
L_4D05:
	push bc			;4d05
	ld de,(0ec00h)		;4d06   ; lee la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	push de			;4d0a
	push hl			;4d0b
	call metafichas		;4d0c   ; metafichas: pone 8 metafichas de 4 x 4 de la lista HL en 0xEC00.. (filas de 32)
	pop hl			;4d0f
	pop de			;4d10
	ld a,080h		;4d11   ; la fila siguiente: 4 filas de fichas (0x80) mas abajo
	call de_mas_a		;4d13   ; de_mas_a: DE = DE + A
	ld (0ec00h),de		;4d16   ; guarda la casilla de trabajo 0xEC00 y el byte siguiente (16 bits)
	ld a,008h		;4d1a   ; 8 metafichas por fila en la lista
	call hl_mas_a		;4d1c   ; hl_mas_a: HL = HL + A
	pop bc			;4d1f
	djnz L_4D05		;4d20
	call bancos_1_2_3		;4d22   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0e000h		;4d25   ; apunta a la sala montada (32 x 24 fichas)
	ld de,00000h		;4d28   ; desde (0, 0)
	ld bc,00300h		;4d2b   ; las 0x300 fichas
L_4D2E:
	push bc			;4d2e
	ld a,(hl)			;4d2f   ; la ficha de la sala montada...
	inc hl			;4d30
	call ficha_a_pagina_0		;4d31   ; ...a la pagina 0
	call siguiente_sitio		;4d34   ; siguiente_sitio: D = D + 8; si da la vuelta, E = E + 8
	pop bc			;4d37
	dec bc			;4d38   ; siguiente ficha
	ld a,c			;4d39
	or b			;4d3a
	jr nz,L_4D2E		;4d3b
	ret			;4d3d
lee_vram:		; lee BC bytes de la VRAM HL a DE
	call vram_para_leer		;4d3e   ; vram_para_leer: pone la direccion de lectura de la VRAM en HL (R#14 y el puerto 1)
	call cuenta_de_bloques		;4d41   ; cuenta_de_bloques: B y A = los bloques de 256 de BC para otir/inir
	ex af,af'			;4d44   ; A = los bloques
	ld a,(00006h)		;4d45   ; el puerto de datos del VDP (lectura)
	ld c,a			;4d48
	ex af,af'			;4d49
L_4D4A:
	inir		;4d4a   ; 256 bytes (o C) por vuelta
	dec a			;4d4c
	jr nz,L_4D4A		;4d4d
	ex de,hl			;4d4f
	ret			;4d50
cuenta_de_bloques:		; B y A = los bloques de 256 de BC para otir/inir
	ex de,hl			;4d51   ; HL = el origen, DE = la VRAM
	ld a,c			;4d52   ; C = 0: justo B bloques de 256
	or a			;4d53
	ld a,b			;4d54
	ld b,c			;4d55   ; B = el resto (primera vuelta)
	ret z			;4d56
	inc a			;4d57   ; un bloque mas para el resto
	ret			;4d58
escribe_vram:		; copia BC bytes de HL a la VRAM DE
	ex de,hl			;4d59
	call vram_para_escribir		;4d5a   ; vram_para_escribir: pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	call cuenta_de_bloques		;4d5d   ; cuenta_de_bloques: B y A = los bloques de 256 de BC para otir/inir
	ex af,af'			;4d60
	ld a,(00007h)		;4d61   ; el puerto de datos del VDP (escritura)
	ld c,a			;4d64
	ex af,af'			;4d65
L_4D66:
	otir		;4d66   ; 256 bytes (o C) por vuelta
	dec a			;4d68
	jr nz,L_4D66		;4d69
	ret			;4d6b
llena_vram:		; llena BC bytes de la VRAM HL con A
	push de			;4d6c
	push af			;4d6d
	call vram_para_escribir		;4d6e   ; vram_para_escribir: pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	ld d,c			;4d71   ; D = el resto
	ld a,c			;4d72
	or a			;4d73
	jr z,L_4D77		;4d74
	inc b			;4d76   ; un bloque mas
L_4D77:
	ld a,(00007h)		;4d77
	ld c,a			;4d7a
	pop af			;4d7b
L_4D7C:
	out (c),a		;4d7c   ; A en la VRAM, BC veces
	dec d			;4d7e
	jr nz,L_4D7C		;4d7f
	djnz L_4D7C		;4d81
	pop de			;4d83
	ret			;4d84
byte_a_vram:		; escribe A en la VRAM HL
	push bc			;4d85
	push af			;4d86
	call vram_para_escribir		;4d87   ; vram_para_escribir: pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	ld a,(00007h)		;4d8a
	ld c,a			;4d8d
	pop af			;4d8e
	out (c),a		;4d8f   ; el byte
	pop bc			;4d91
	ret			;4d92
vram_para_escribir:		; pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	push bc			;4d93
	ld a,(00007h)		;4d94   ; el puerto de registros del VDP
	inc a			;4d97
	ld c,a			;4d98
	ld a,h			;4d99   ; R#14: los bits 14-15 de la direccion
	rlca			;4d9a
	rlca			;4d9b
	and 003h		;4d9c
	di			;4d9e
	out (c),a		;4d9f
	ld a,08eh		;4da1   ; 0x80 + 14
	out (c),a		;4da3
	ld a,l			;4da5   ; los 8 bits bajos
	out (c),a		;4da6
	ld a,h			;4da8   ; los bits 8-13 y 0x40: escritura
	and 03fh		;4da9
	or 040h		;4dab
	out (c),a		;4dad
	pop bc			;4daf
	ei			;4db0
	ret			;4db1
vram_para_leer:		; pone la direccion de lectura de la VRAM en HL (R#14 y el puerto 1)
	push bc			;4db2
	ld a,(00007h)		;4db3   ; el puerto de registros del VDP
	inc a			;4db6
	ld c,a			;4db7
	ld a,h			;4db8   ; R#14: los bits 14-15 de la direccion
	rlca			;4db9
	rlca			;4dba
	and 003h		;4dbb
	di			;4dbd
	out (c),a		;4dbe
	ld a,08eh		;4dc0   ; 0x80 + 14
	out (c),a		;4dc2
	ld a,l			;4dc4   ; los 8 bits bajos
	out (c),a		;4dc5
	ld a,h			;4dc7   ; los bits 8-13 sin 0x40: lectura
	and 03fh		;4dc8
	out (c),a		;4dca
	pop bc			;4dcc
	ei			;4dcd
	ret			;4dce
patrones_con_destino:		; lee la direccion VRAM de DE y descomprime detras
	ex de,hl			;4dcf
	ld e,(hl)			;4dd0   ; HL = la direccion VRAM que sigue en la lista
	inc hl			;4dd1
	ld d,(hl)			;4dd2
	inc hl			;4dd3
	ex de,hl			;4dd4   ; DE = los datos detras
patrones:		; descomprime DE a la VRAM HL (n < 0x80 repite, n > 0x80 copia, 0x80 otro destino, 0 acaba)
	call vram_para_escribir		;4dd5   ; vram_para_escribir: pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	ld a,(00007h)		;4dd8   ; el puerto de datos del VDP
	ld c,a			;4ddb
L_4DDC:
	ld a,(de)			;4ddc   ; 0 acaba
	and a			;4ddd
	ret z			;4dde
	inc de			;4ddf
	ld b,a			;4de0
	and 07fh		;4de1   ; sin el bit 7
	cp b			;4de3   ; n < 0x80: repite el byte siguiente n veces
	jr z,L_4DF0		;4de4
	and a			;4de6   ; 0x80: un destino nuevo
	jr z,patrones_con_destino		;4de7
	ex de,hl			;4de9   ; n > 0x80: copia los n - 0x80 bytes siguientes
	ld b,a			;4dea
	otir		;4deb
	ex de,hl			;4ded
	jr L_4DDC		;4dee
L_4DF0:
	ld a,(de)			;4df0   ; el byte a repetir
	inc de			;4df1
L_4DF2:
	out (c),a		;4df2   ; n veces
	djnz L_4DF2		;4df4
	jr L_4DDC		;4df6
pantalla_limpia:		; esconde los sprites, apaga la pantalla, borra la pagina 0 y la enciende
	call esconde_los_sprites		;4df8   ; esconde_los_sprites: llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	call apaga_la_pantalla		;4dfb   ; apaga_la_pantalla: quita el bit 6 de R#1 y apaga los sprites (R#8)
	call borra_la_pagina_0		;4dfe   ; borra_la_pagina_0: llena la pagina 0 de color 0 y pone R#23 a cero
enciende_la_pantalla:		; pone el bit 6 de R#1 y enciende los sprites (R#8)
	ld a,(0f3e0h)		;4e01   ; la copia de R#1 de la BIOS (RG1SAV)
	or 040h		;4e04   ; bit 6: la pantalla encendida
	ld b,a			;4e06
	ld c,001h		;4e07   ; R#1
	call 00047h		;4e09   ; BIOS WRTVDP - Writes data in the VDP-register
	jr sprites_encendidos		;4e0c
apaga_la_pantalla:		; quita el bit 6 de R#1 y apaga los sprites (R#8)
	ld a,(0f3e0h)		;4e0e
	and 0bfh		;4e11   ; sin el bit 6
	ld b,a			;4e13
	ld c,001h		;4e14
	call 00047h		;4e16   ; BIOS WRTVDP - Writes data in the VDP-register
	jr sprites_apagados		;4e19
borra_la_pagina_0:		; llena la pagina 0 de color 0 y pone R#23 a cero
	ld d,000h		;4e1b
borra_la_pagina_d:		; llena la pagina de D de color 0 y pone R#23 a cero
	xor a			;4e1d   ; A = 0: color 0
	ld h,a			;4e1e   ; desde (0, 0)
	ld l,a			;4e1f
	ld b,a			;4e20   ; 256 x 256: la pagina entera
	ld c,a			;4e21
	call rellena		;4e22   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
	ld b,000h		;4e25   ; R#23 = 0: sin desplazamiento vertical
	ld c,017h		;4e27
	jp 00047h		;4e29   ; BIOS WRTVDP - Writes data in the VDP-register
esconde_los_sprites:		; llena de 0xE0 las dos tablas de atributos de la VRAM (0xF600 y 0xF200)
	ld hl,0f600h		;4e2c   ; la tabla de atributos de los sprites (pagina 1, la primera)
	ld a,0e0h		;4e2f   ; Y = 0xE0: fuera de la pantalla
	ld bc,00080h		;4e31   ; 32 sprites x 4 bytes
	call llena_vram		;4e34   ; llena_vram: llena BC bytes de la VRAM HL con A
	ld hl,0f200h		;4e37   ; y la segunda tabla
	ld a,0e0h		;4e3a
	ld bc,00080h		;4e3c
	jp llena_vram		;4e3f   ; llena_vram: llena BC bytes de la VRAM HL con A
esconde_los_sprites_ram:		; llena de 0xE0 la copia de los atributos (0xEA00-0xEA7F)
	ld de,0ea01h		;4e42
	ld hl,0ea00h		;4e45   ; apunta a la copia de los atributos de los sprites
	ld bc,0007fh		;4e48   ; 0x80 bytes
	ld (hl),0e0h		;4e4b
	ldir		;4e4d
	ret			;4e4f
sprites_apagados:		; pone el bit SPD de R#8
	ld a,(0ffe7h)		;4e50   ; la copia de R#8 de la BIOS (RG8SAV)
	or 002h		;4e53   ; bit 1 (SPD): sprites apagados
	ld b,a			;4e55
	ld c,008h		;4e56   ; R#8
	jp 00047h		;4e58   ; BIOS WRTVDP - Writes data in the VDP-register
sprites_encendidos:		; quita el bit SPD de R#8
	ld a,(0ffe7h)		;4e5b
	and 0fdh		;4e5e   ; sin el bit SPD
	ld b,a			;4e60
	ld c,008h		;4e61
	jp 00047h		;4e63   ; BIOS WRTVDP - Writes data in the VDP-register
color:		; el color A de la paleta = DE ([RB][G]), y su copia en 0xF680
	push bc			;4e66
	push hl			;4e67
	ld b,a			;4e68   ; B = el color
	ld a,(00007h)		;4e69   ; el puerto de registros del VDP
	inc a			;4e6c
	ld c,a			;4e6d
	di			;4e6e
	out (c),b		;4e6f   ; R#16 = el color...
	ld a,090h		;4e71   ; 0x80 + 16
	out (c),a		;4e73
	inc c			;4e75   ; el puerto de la paleta
	out (c),d		;4e76   ; [0 R R R 0 B B B]
	push af			;4e78   ; espera
	pop af			;4e79
	out (c),e		;4e7a   ; [0 0 0 0 0 G G G]
	dec c			;4e7c   ; otra vez el de registros
	ld hl,0f680h		;4e7d   ; apunta a la copia de la paleta en la VRAM (0xF680, 2 bytes por color)
	ld a,b			;4e80   ; la copia en la VRAM, 2 bytes por color
	add a,a			;4e81
	add a,l			;4e82
	ld l,a			;4e83
	call vram_para_escribir		;4e84   ; vram_para_escribir: pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	dec c			;4e87   ; el puerto de datos
	out (c),d		;4e88   ; la misma pareja en la copia
	out (c),e		;4e8a
	pop hl			;4e8c
	pop bc			;4e8d
	ei			;4e8e
	ret			;4e8f
paleta_por_defecto:		; manda al VDP los 16 colores de 0x4EA4
	ld hl,04ea4h		;4e90
	ld b,010h		;4e93   ; 16 colores
	ld a,000h		;4e95   ; desde el 0
L_4E97:
	ld d,(hl)			;4e97   ; D = [RB], E = [G]
	inc hl			;4e98
	ld e,(hl)			;4e99
	inc hl			;4e9a
	push af			;4e9b
	call color		;4e9c   ; color: el color A de la paleta = DE ([RB][G]), y su copia en 0xF680
	pop af			;4e9f
	inc a			;4ea0   ; el color siguiente
	djnz L_4E97		;4ea1
	ret			;4ea3

; ----------------------------------------------------------------------
; DATOS paleta_por_defecto: 16 parejas [RB][G], colores 0-15, que p00:4E97
;   manda al VDP uno a uno con L_4E66 (registro 16 = color, y la copia en la
;   RAM 0xF680)
;   0x4ea4..0x4ec4  (32 bytes)
DATA_paleta_por_defecto:
	defb 000h,000h	; 4ea4
	defb 000h,000h	; 4ea6
	defb 011h,006h	; 4ea8
	defb 033h,007h	; 4eaa
	defb 017h,001h	; 4eac
	defb 027h,003h	; 4eae
	defb 051h,001h	; 4eb0
	defb 027h,006h	; 4eb2
	defb 071h,001h	; 4eb4
	defb 073h,003h	; 4eb6
	defb 061h,006h	; 4eb8
	defb 064h,006h	; 4eba
	defb 011h,004h	; 4ebc
	defb 065h,002h	; 4ebe
	defb 055h,005h	; 4ec0
	defb 077h,007h	; 4ec2

; ======================================================================
; CODIGO 0x4ec4..0x556f  (1707 bytes)
; ======================================================================


paleta:		; manda al VDP la lista de HL: [color][RB][G] ... 0xFF
	ld a,(hl)			;4ec4   ; [color]
	inc hl			;4ec5
	inc a			;4ec6   ; 0xFF acaba
	ret z			;4ec7
	dec a			;4ec8
	ld d,(hl)			;4ec9   ; [RB][G]
	inc hl			;4eca
	ld e,(hl)			;4ecb
	inc hl			;4ecc
	call color		;4ecd   ; color: el color A de la paleta = DE ([RB][G]), y su copia en 0xF680
	jr paleta		;4ed0
espera_al_vdp:		; espera a que el VDP acabe el comando (S#2, bit CE)
	ld a,002h		;4ed2   ; S#2
	call estado_del_vdp		;4ed4   ; estado_del_vdp: A = el registro de estado A del VDP
	rra			;4ed7   ; bit 0 (CE): el VDP aun hace un comando
	jp c,espera_al_vdp		;4ed8   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	ret			;4edb
estado_del_vdp:		; A = el registro de estado A del VDP
	push bc			;4edc
	push hl			;4edd
	ld hl,(00006h)		;4ede   ; los puertos de lectura y escritura del VDP
	inc h			;4ee1   ; los de estado y registros (+1)
	inc l			;4ee2
	ld c,h			;4ee3
	di			;4ee4
	out (c),a		;4ee5   ; R#15 = A: el registro de estado que se lee
	ld a,08fh		;4ee7   ; 0x80 + 15
	out (c),a		;4ee9
	ld c,l			;4eeb
	in a,(c)		;4eec   ; A = el estado
	push af			;4eee
	xor a			;4eef   ; R#15 = 0 otra vez (lo que espera la BIOS)
	ld c,h			;4ef0
	out (c),a		;4ef1
	ld a,08fh		;4ef3
	out (c),a		;4ef5
	pop af			;4ef7
	pop hl			;4ef8
	pop bc			;4ef9
	ei			;4efa
	ret			;4efb
linea_horizontal:		; LINE de B puntos desde (H, L) en el color C
	call espera_al_vdp		;4efc   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	push bc			;4eff
	ld a,(00007h)		;4f00   ; el puerto de registros del VDP
	inc a			;4f03
	ld c,a			;4f04
	ld a,024h		;4f05   ; R#17 = 36 (0x24): escritura seguida desde R#36
	di			;4f07
	out (c),a		;4f08
	ld a,091h		;4f0a
	out (c),a		;4f0c
	inc c			;4f0e   ; el puerto de registros indirectos
	inc c			;4f0f
	out (c),h		;4f10   ; R#36-37: DX = H
	xor a			;4f12
	out (c),a		;4f13
	out (c),l		;4f15   ; R#38-39: DY = L (pagina 0)
	out (c),a		;4f17
	pop hl			;4f19   ; H = B, L = C
	dec h			;4f1a   ; R#40-41: NX = B - 1 (el lado largo)
	out (c),h		;4f1b
	xor a			;4f1d
	out (c),a		;4f1e
	xor a			;4f20   ; R#42-43: NY = 0
	out (c),a		;4f21
	out (c),a		;4f23
	out (c),l		;4f25   ; R#44: el color C
	out (c),a		;4f27   ; R#45 = 0: el lado largo en X
	ld a,070h		;4f29   ; R#46 = 0x70: LINE
	out (c),a		;4f2b
	ei			;4f2d
	ret			;4f2e
linea_vertical:		; LINE de B puntos hacia abajo desde (H, L) en el color C
	call espera_al_vdp		;4f2f   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	push bc			;4f32
	ld a,(00007h)		;4f33   ; el puerto de registros del VDP
	inc a			;4f36
	ld c,a			;4f37
	ld a,024h		;4f38   ; R#17 = 36 (0x24): escritura seguida desde R#36
	di			;4f3a
	out (c),a		;4f3b
	ld a,091h		;4f3d
	out (c),a		;4f3f
	inc c			;4f41   ; el puerto de registros indirectos
	inc c			;4f42
	out (c),h		;4f43   ; R#36-37: DX = H
	xor a			;4f45
	out (c),a		;4f46
	out (c),l		;4f48   ; R#38-39: DY = L (pagina 0)
	out (c),a		;4f4a
	pop hl			;4f4c   ; H = B, L = C
	dec h			;4f4d   ; R#40-41: NX = B - 1 (el lado largo)
	out (c),h		;4f4e
	xor a			;4f50
	out (c),a		;4f51
	xor a			;4f53   ; R#42-43: NY = 0
	out (c),a		;4f54
	out (c),a		;4f56
	out (c),l		;4f58   ; R#44: el color C
	inc a			;4f5a   ; R#45 = 1 (MAJ): el lado largo en Y
	out (c),a		;4f5b
	ld a,070h		;4f5d   ; R#46 = 0x70: LINE
	out (c),a		;4f5f
	ei			;4f61
	ret			;4f62
recuadro:		; un recuadro de D x E desde (H, L) en el color C
	ld b,e			;4f63   ; el lado izquierdo, E de alto
	call linea_vertical_guarda		;4f64   ; linea_vertical_guarda: linea_vertical guardando HL, DE y BC
	ld b,d			;4f67   ; el de arriba, D de ancho
	call linea_horizontal_guarda		;4f68   ; linea_horizontal_guarda: linea_horizontal guardando HL, DE y BC
	push hl			;4f6b
	ld a,l			;4f6c   ; el de abajo: L + E - 1
	dec a			;4f6d
	add a,e			;4f6e
	ld l,a			;4f6f
	ld b,d			;4f70
	call linea_horizontal_guarda		;4f71   ; linea_horizontal_guarda: linea_horizontal guardando HL, DE y BC
	pop hl			;4f74
	ld a,h			;4f75   ; el derecho: H + D - 1
	dec a			;4f76
	add a,d			;4f77
	ld h,a			;4f78
	ld b,e			;4f79
	jp linea_vertical_guarda		;4f7a   ; linea_vertical_guarda: linea_vertical guardando HL, DE y BC
linea_vertical_guarda:		; linea_vertical guardando HL, DE y BC
	push hl			;4f7d
	push de			;4f7e
	push bc			;4f7f
	call linea_vertical		;4f80   ; linea_vertical: LINE de B puntos hacia abajo desde (H, L) en el color C
	pop bc			;4f83
	pop de			;4f84
	pop hl			;4f85
	ret			;4f86
linea_horizontal_guarda:		; linea_horizontal guardando HL, DE y BC
	push hl			;4f87
	push de			;4f88
	push bc			;4f89
	call linea_horizontal		;4f8a   ; linea_horizontal: LINE de B puntos desde (H, L) en el color C
	pop bc			;4f8d
	pop de			;4f8e
	pop hl			;4f8f
	ret			;4f90
rellena:		; HMMV: llena B x C desde (H, L) de la pagina D con el byte A
	ex af,af'			;4f91   ; A' = el byte de relleno
	call espera_al_vdp		;4f92   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	push bc			;4f95
	ld a,(00007h)		;4f96   ; el puerto de registros del VDP
	inc a			;4f99
	ld c,a			;4f9a
	ld a,024h		;4f9b   ; R#17 = 36 (0x24): escritura seguida desde R#36
	di			;4f9d
	out (c),a		;4f9e
	ld a,091h		;4fa0
	out (c),a		;4fa2
	inc c			;4fa4   ; el puerto de registros indirectos
	inc c			;4fa5
	out (c),h		;4fa6   ; R#36-37: DX = H
	xor a			;4fa8
	out (c),a		;4fa9
	out (c),l		;4fab   ; R#38-39: DY = L y la pagina D
	out (c),d		;4fad
	pop hl			;4faf   ; H = B, L = C
	out (c),h		;4fb0   ; R#40-41: NX = B (0 = 256)
	cp h			;4fb2
	jr nz,L_4FB6		;4fb3
	inc a			;4fb5
L_4FB6:
	out (c),a		;4fb6
	xor a			;4fb8
	out (c),l		;4fb9   ; R#42-43: NY = C (0 = 256)
	cp l			;4fbb
	jr nz,L_4FBF		;4fbc
	inc a			;4fbe
L_4FBF:
	out (c),a		;4fbf
	ex af,af'			;4fc1   ; R#44: el byte (dos puntos)
	out (c),a		;4fc2
	xor a			;4fc4   ; R#45 = 0
	out (c),a		;4fc5
	ld a,0c0h		;4fc7   ; R#46 = 0xC0: HMMV
	out (c),a		;4fc9
	ei			;4fcb
	ret			;4fcc
copia_vram:		; HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	ex af,af'			;4fcd   ; A' = las paginas
	call espera_al_vdp		;4fce   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	push bc			;4fd1
	ld a,(00007h)		;4fd2   ; el puerto de registros del VDP
	inc a			;4fd5
	ld c,a			;4fd6
	ld a,020h		;4fd7   ; R#17 = 32 (0x20): escritura seguida desde R#32
	di			;4fd9
	out (c),a		;4fda
	ld a,091h		;4fdc
	out (c),a		;4fde
	inc c			;4fe0   ; el puerto de registros indirectos
	inc c			;4fe1
	out (c),h		;4fe2   ; R#32-33: SX = H
	xor a			;4fe4
	out (c),a		;4fe5
	out (c),l		;4fe7   ; R#34: SY = L
	ex af,af'			;4fe9
	ld l,a			;4fea
	and 003h		;4feb   ; R#35: la pagina de origen (bits 0-1 de A)
	out (c),a		;4fed
	out (c),d		;4fef   ; R#36-37: DX = D
	xor a			;4ff1
	out (c),a		;4ff2
	out (c),e		;4ff4   ; R#38: DY = E
	ld a,l			;4ff6   ; R#39: la pagina de destino (bits 2-3 de A)
	rra			;4ff7
	rra			;4ff8
	and 003h		;4ff9
	out (c),a		;4ffb
	pop hl			;4ffd   ; H = B, L = C
	out (c),h		;4ffe   ; R#40-41: NX = B
	xor a			;5000
	out (c),a		;5001
	out (c),l		;5003   ; R#42-43: NY = C
	out (c),a		;5005
	out (c),a		;5007   ; R#44-45 = 0
	out (c),a		;5009
	ld a,0d0h		;500b   ; R#46 = 0xD0: HMMM
	out (c),a		;500d
	ei			;500f
	ret			;5010
copia_logica:		; LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	ex af,af'			;5011   ; A' = [pagina origen][pagina destino][operacion]
	call espera_al_vdp		;5012   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	push bc			;5015
	ld a,(00007h)		;5016   ; el puerto de registros del VDP
	inc a			;5019
	ld c,a			;501a
	ld a,020h		;501b   ; R#17 = 32 (0x20): escritura seguida desde R#32
	di			;501d
	out (c),a		;501e
	ld a,091h		;5020
	out (c),a		;5022
	inc c			;5024   ; el puerto de registros indirectos
	inc c			;5025
	out (c),h		;5026   ; R#32-33: SX = H
	xor a			;5028
	out (c),a		;5029
	out (c),l		;502b   ; R#34: SY = L
	ex af,af'			;502d
	rlca			;502e   ; los bits 7-6 de A bajan a 1-0...
	rlca			;502f
	ld l,a			;5030
	and 003h		;5031   ; ...R#35: la pagina de origen
	out (c),a		;5033
	out (c),d		;5035   ; R#36-37: DX = D
	xor a			;5037
	out (c),a		;5038
	out (c),e		;503a   ; R#38: DY = E
	ld a,l			;503c
	ld e,a			;503d
	rlca			;503e   ; los bits 5-4 de A...
	rlca			;503f
	and 003h		;5040   ; ...R#39: la pagina de destino
	out (c),a		;5042
	pop hl			;5044   ; H = B, L = C
	out (c),h		;5045   ; R#40-41: NX = B
	xor a			;5047
	out (c),a		;5048
	out (c),l		;504a   ; R#42-43: NY = C
	out (c),a		;504c
	out (c),a		;504e   ; R#44-45 = 0
	out (c),a		;5050
	ld a,e			;5052   ; los bits 3-0 de A: la operacion logica (8 = TIMP, 0 = IMP)
	rra			;5053
	rra			;5054
	and 00fh		;5055
	or 090h		;5057   ; R#46 = 0x90 + operacion: LMMM
	out (c),a		;5059
	ei			;505b
	ret			;505c
caracteres_1_bit:		; B caracteres de 1 bit de HL en el color C a la pagina 1 desde (D, E)
	call caracter_1_bit		;505d   ; caracter_1_bit: un caracter de 1 bit de HL en el color C a la pagina 1 en (D, E)
	call siguiente_sitio		;5060   ; siguiente_sitio: D = D + 8; si da la vuelta, E = E + 8
	djnz caracteres_1_bit		;5063   ; B caracteres
	ret			;5065
caracter_1_bit:		; un caracter de 1 bit de HL en el color C a la pagina 1 en (D, E)
	push bc			;5066
	push de			;5067
	push hl			;5068
	push de			;5069   ; los 8 bytes del caracter a 4 bits en 0xEC40
	call pasa_a_4_bits		;506a   ; pasa_a_4_bits: 8 bytes de 1 bit de HL a 4 bits por punto en 0xEC40, con el color C
	pop de			;506d
	ld b,d			;506e   ; D = E (la Y), E = D (la X)...
	ld d,e			;506f
	ld e,b			;5070
	srl d		;5071   ; ...la direccion = Y x 0x80 + X / 2
	rr e		;5073
	ld a,d			;5075   ; + 0x8000: la pagina 1
	add a,080h		;5076
	ld d,a			;5078
	ld hl,0ec40h		;5079   ; los 32 bytes del caracter ya pasado
	call ficha_a_vram		;507c   ; ficha_a_vram: 8 lineas de 4 bytes de HL a la VRAM DE (lineas de 0x80)
	pop hl			;507f
	ld bc,00008h		;5080   ; el caracter siguiente (8 bytes de 1 bit)
	add hl,bc			;5083
	pop de			;5084
	pop bc			;5085
	ret			;5086
ficha_a_vram:		; 8 lineas de 4 bytes de HL a la VRAM DE (lineas de 0x80)
	push de			;5087
	ld b,008h		;5088   ; 8 lineas
L_508A:
	push bc			;508a
	ld bc,00004h		;508b   ; 4 bytes: 8 puntos de 4 bits
	call escribe_vram		;508e   ; escribe_vram: copia BC bytes de HL a la VRAM DE
	ex de,hl			;5091
	ld bc,00080h		;5092   ; la linea siguiente (128 bytes por linea en SCREEN 5)
	add hl,bc			;5095
	ex de,hl			;5096
	pop bc			;5097
	djnz L_508A		;5098
	pop de			;509a
	ret			;509b
fichas_a_vram:		; B fichas de 32 bytes de HL a la VRAM DE, de 8 en 8 puntos y 8 lineas mas abajo cada 32
	push bc			;509c
	call ficha_a_vram		;509d   ; ficha_a_vram: 8 lineas de 4 bytes de HL a la VRAM DE (lineas de 0x80)
	ld a,004h		;50a0   ; 8 puntos a la derecha
	add a,e			;50a2
	cp 080h		;50a3   ; al final de la linea (0x80 bytes)...
	jr nz,L_50AC		;50a5
	ld a,004h		;50a7   ; ...8 lineas mas abajo (0x400) y a la izquierda
	add a,d			;50a9
	ld d,a			;50aa
	xor a			;50ab
L_50AC:
	ld e,a			;50ac
	pop bc			;50ad
	djnz fichas_a_vram		;50ae
	ret			;50b0
fichas_a_vram_espejo:		; como fichas_a_vram, pero cada ficha volteada de lado
	push bc			;50b1
	push de			;50b2
	ld de,0ec43h		;50b3   ; hacia atras: el ultimo byte de la linea primero
	ld c,008h		;50b6   ; 8 lineas
L_50B8:
	ld b,004h		;50b8   ; 4 bytes por linea
L_50BA:
	ld a,(hl)			;50ba
	rrca			;50bb   ; los dos puntos del byte cambian de sitio
	rrca			;50bc
	rrca			;50bd
	rrca			;50be
	ld (de),a			;50bf
	dec de			;50c0   ; hacia la izquierda en 0xEC40...
	inc hl			;50c1
	djnz L_50BA		;50c2
	ld a,008h		;50c4   ; ...y la linea siguiente empieza 8 mas alla
	call de_mas_a		;50c6   ; de_mas_a: DE = DE + A
	dec c			;50c9
	jr nz,L_50B8		;50ca
	pop de			;50cc
	push hl			;50cd
	ld hl,0ec40h		;50ce   ; la ficha volteada
	call ficha_a_vram		;50d1   ; ficha_a_vram: 8 lineas de 4 bytes de HL a la VRAM DE (lineas de 0x80)
	pop hl			;50d4
	ld a,004h		;50d5   ; 8 puntos a la derecha
	add a,e			;50d7
	cp 080h		;50d8   ; al final de la linea (0x80 bytes)...
	jr nz,L_50E1		;50da
	ld a,004h		;50dc   ; ...8 lineas mas abajo y a la izquierda
	add a,d			;50de
	ld d,a			;50df
	xor a			;50e0
L_50E1:
	ld e,a			;50e1
	pop bc			;50e2
	djnz fichas_a_vram_espejo		;50e3
	ret			;50e5
pasa_a_4_bits:		; 8 bytes de 1 bit de HL a 4 bits por punto en 0xEC40, con el color C
	ld b,008h		;50e6   ; 8 lineas
	ld de,0ec40h		;50e8   ; a 0xEC40
L_50EB:
	push bc			;50eb
	push hl			;50ec
	ex de,hl			;50ed
	ld a,(de)			;50ee   ; D = la linea de 1 bit
	ld d,a			;50ef
	ld b,004h		;50f0   ; 4 bytes de 2 puntos
L_50F2:
	ld a,c			;50f2   ; punto puesto: el color C
	rl d		;50f3
	jr c,L_50F8		;50f5
	xor a			;50f7   ; punto quitado: 0
L_50F8:
	rld		;50f8   ; mete el nibble en (HL)
	ld a,c			;50fa   ; el segundo punto del byte
	rl d		;50fb
	jr c,L_5100		;50fd
	xor a			;50ff
L_5100:
	rld		;5100
	inc hl			;5102   ; el byte siguiente
	djnz L_50F2		;5103
	ex de,hl			;5105
	pop hl			;5106
	inc hl			;5107   ; la linea siguiente
	pop bc			;5108
	djnz L_50EB		;5109
	ret			;510b
rotulo:		; escribe el rotulo de HL ([X][Y], caracteres, 0xFE otra posicion, 0xFF acaba)
	ld c,0ffh		;510c   ; C = 0xFF: el caracter de verdad
	jr L_5112		;510e
borra_rotulo:		; lo mismo que rotulo, con el caracter en blanco
	ld c,000h		;5110   ; C = 0: el blanco en su lugar
L_5112:
	ld d,(hl)			;5112   ; [X][Y]
	inc hl			;5113
	ld e,(hl)			;5114
	inc hl			;5115
rotulo_en_de:		; escribe los caracteres de HL desde (D, E) (0xFE otra posicion, 0xFF acaba)
	ld a,(hl)			;5116
	inc hl			;5117
	cp 0ffh		;5118   ; 0xFF acaba
	ret z			;511a
	cp 0feh		;511b   ; 0xFE: otra posicion
	jr z,L_5112		;511d
	push af			;511f
	call caracter		;5120   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	pop af			;5123
	ld b,008h		;5124   ; 8 puntos a la derecha...
	cp 097h		;5126   ; ...4 con los caracteres 0x97 y 0x98
	jr z,L_512E		;5128
	sub 098h		;512a
	jr nz,L_5130		;512c
L_512E:
	ld b,004h		;512e
L_5130:
	ld a,d			;5130
	add a,b			;5131
	ld d,a			;5132
	jr rotulo_en_de		;5133
caracter:		; copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	push bc			;5135
	push hl			;5136
	push de			;5137
	and a			;5138   ; el caracter 0 es el blanco
	ld hl,00000h		;5139   ; HL = (0, 0): la ficha en blanco de la pagina 1
	jr z,L_514B		;513c
	dec c			;513e   ; C = 0: el blanco
	inc c			;513f
	jr z,L_514B		;5140
	add a,010h		;5142   ; el caracter c es la ficha c + 0x10...
	call sitio_en_pagina_1		;5144   ; sitio_en_pagina_1: H = 8 x (A mod 32), L = 8 x (A / 32): donde esta la ficha A en la pagina 1
	ld a,030h		;5147   ; ...0x30 lineas mas abajo
	add a,l			;5149
	ld l,a			;514a
L_514B:
	ld bc,00808h		;514b   ; 8 x 8
	ld a,001h		;514e   ; de la pagina 1 a la 0
	call copia_vram		;5150   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;5153
	pop hl			;5154
	pop bc			;5155
	ret			;5156
ficha_a_pagina_0:		; copia la ficha A de la pagina 1 a (D, E) de la pagina 0
	push bc			;5157
	push hl			;5158
	push de			;5159
	call sitio_en_pagina_1		;515a   ; sitio_en_pagina_1: H = 8 x (A mod 32), L = 8 x (A / 32): donde esta la ficha A en la pagina 1
	ld bc,00808h		;515d   ; 8 x 8
	ld a,001h		;5160   ; de la pagina 1 a la 0
	call copia_vram		;5162   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;5165
	pop hl			;5166
	pop bc			;5167
	ret			;5168
ficha_transparente:		; copia la ficha A de la pagina 1 a (D, E) con TIMP (de la segunda mitad si 0xC168 bit 0)
	push bc			;5169
	push hl			;516a
	push de			;516b
	ld hl,0c168h		;516c   ; la segunda mitad de la pagina 1 si 0xC168 bit 0
	bit 0,(hl)		;516f
	jr z,L_5178		;5171
	call sitio_en_pagina_1_abajo		;5173   ; sitio_en_pagina_1_abajo: lo mismo que sitio_en_pagina_1, 0x80 lineas mas abajo
	jr L_517B		;5176
L_5178:
	call sitio_en_pagina_1		;5178   ; sitio_en_pagina_1: H = 8 x (A mod 32), L = 8 x (A / 32): donde esta la ficha A en la pagina 1
L_517B:
	ld bc,00808h		;517b   ; 8 x 8
	ld a,048h		;517e   ; de la pagina 1 a la 0, TIMP: el color 0 no se copia
	call copia_logica		;5180   ; copia_logica: LMMM: copia B x C de (H, L) a (D, E); A = [pagina origen 7-6][pagina destino 5-4][operacion 3-0]
	call espera_al_vdp		;5183   ; espera_al_vdp: espera a que el VDP acabe el comando (S#2, bit CE)
	pop de			;5186
	pop hl			;5187
	pop bc			;5188
	ret			;5189
ficha_en_pagina_1:		; copia la ficha A de la pagina 1 a (D, E) de la pagina 1
	push bc			;518a
	push hl			;518b
	push de			;518c
	call sitio_en_pagina_1		;518d   ; sitio_en_pagina_1: H = 8 x (A mod 32), L = 8 x (A / 32): donde esta la ficha A en la pagina 1
	ld bc,00808h		;5190   ; 8 x 8
	ld a,005h		;5193   ; de la pagina 1 a la 1
	call copia_vram		;5195   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;5198
	pop hl			;5199
	pop bc			;519a
	ret			;519b
ficha_del_bloque:		; copia la ficha A del bloque de (0x38, 0x98) a (D, E) de la pagina 1
	push bc			;519c
	push hl			;519d
	push de			;519e
	call sitio_en_el_bloque		;519f   ; sitio_en_el_bloque: H/L de la ficha A dentro del bloque de (0x38, 0x98)
	ld bc,00808h		;51a2   ; 8 x 8
	ld a,005h		;51a5   ; de la pagina 1 a la 1
	call copia_vram		;51a7   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;51aa
	pop hl			;51ab
	pop bc			;51ac
	ret			;51ad
sitio_en_pagina_1:		; H = 8 x (A mod 32), L = 8 x (A / 32): donde esta la ficha A en la pagina 1
	ld b,a			;51ae
	and 01fh		;51af   ; la columna (A mod 32)...
	add a,a			;51b1   ; ...por 8 puntos
	add a,a			;51b2
	add a,a			;51b3
	ld h,a			;51b4
	ld a,b			;51b5
	and 0e0h		;51b6   ; la fila (A / 32)...
	rrca			;51b8   ; ...por 8 lineas
	rrca			;51b9
	ld l,a			;51ba
	ret			;51bb
sitio_en_pagina_1_abajo:		; lo mismo que sitio_en_pagina_1, 0x80 lineas mas abajo
	call sitio_en_pagina_1		;51bc   ; sitio_en_pagina_1: H = 8 x (A mod 32), L = 8 x (A / 32): donde esta la ficha A en la pagina 1
	ld a,080h		;51bf   ; 0x80 lineas mas abajo
	add a,l			;51c1
	ld l,a			;51c2
	ret			;51c3
sitio_en_el_bloque:		; H/L de la ficha A dentro del bloque de (0x38, 0x98)
	ld b,a			;51c4
	and 01fh		;51c5   ; la columna (A mod 32) por 8...
	add a,a			;51c7
	add a,a			;51c8
	add a,a			;51c9
	add a,038h		;51ca   ; ...desde la X 0x38
	ld h,a			;51cc
	ld a,b			;51cd
	and 0e0h		;51ce   ; la fila por 8...
	rrca			;51d0
	rrca			;51d1
	ld l,a			;51d2
	ld a,098h		;51d3   ; ...desde la Y 0x98
	add a,l			;51d5
	ld l,a			;51d6
	ret			;51d7
siguiente_sitio:		; D = D + 8; si da la vuelta, E = E + 8
	ld a,d			;51d8
	add a,008h		;51d9   ; 8 puntos a la derecha
	ld d,a			;51db
	ret nz			;51dc   ; sin dar la vuelta, listo
	ld a,e			;51dd   ; si da la vuelta, 8 lineas mas abajo
	add a,008h		;51de
	ld e,a			;51e0
	ret			;51e1
lista_de_fichas:		; pinta la lista HL de fichas del bloque desde (D, E) (0xFE baja 8, 0xFF acaba)
	push de			;51e2
L_51E3:
	ld a,(hl)			;51e3   ; la ficha siguiente
	inc hl			;51e4
	ld c,a			;51e5
	inc a			;51e6
	jr z,L_51FC		;51e7   ; 0xFF acaba
	inc a			;51e9
	jr nz,L_51F3		;51ea   ; 0xFE: la fila siguiente...
	pop de			;51ec
	ld a,008h		;51ed   ; ...8 lineas mas abajo
	add a,e			;51ef
	ld e,a			;51f0
	jr lista_de_fichas		;51f1
L_51F3:
	ld a,c			;51f3   ; otra: la ficha del bloque en (D, E)
	call ficha_del_bloque		;51f4   ; ficha_del_bloque: copia la ficha A del bloque de (0x38, 0x98) a (D, E) de la pagina 1
	call siguiente_sitio		;51f7   ; siguiente_sitio: D = D + 8; si da la vuelta, E = E + 8
	jr L_51E3		;51fa
L_51FC:
	pop de			;51fc
	ret			;51fd
fichas_2_planos:		; B fichas de 2 planos (16 bytes) de HL a la VRAM DE con los colores de 0xE700
	push bc			;51fe
	exx			;51ff   ; HL' = 0xE708, donde va la ficha a 4 bits
	ld hl,0e708h		;5200
	exx			;5203
	push de			;5204
	call ficha_2_planos		;5205   ; ficha_2_planos: una ficha de 2 planos de HL a 4 bits en 0xE708
	pop de			;5208
	push hl			;5209
	ld hl,0e708h		;520a   ; la ficha a 4 bits...
	ld b,001h		;520d   ; ...a la VRAM DE
	call fichas_a_vram		;520f   ; fichas_a_vram: B fichas de 32 bytes de HL a la VRAM DE, de 8 en 8 puntos y 8 lineas mas abajo cada 32
	pop hl			;5212
	pop bc			;5213
	djnz fichas_2_planos		;5214   ; B fichas
	ret			;5216
ficha_2_planos:		; una ficha de 2 planos de HL a 4 bits en 0xE708
	ld b,008h		;5217   ; 8 filas
L_5219:
	push bc			;5219
	call fila_2_planos		;521a   ; fila_2_planos: una fila (2 bytes) de una ficha de 2 planos a 4 bits en (HL')
	pop bc			;521d
	djnz L_5219		;521e
	ret			;5220
fila_2_planos:		; una fila (2 bytes) de una ficha de 2 planos a 4 bits en (HL')
	ld b,004h		;5221   ; 4 bytes de 2 puntos
	ld e,(hl)			;5223   ; DE = los dos planos de la fila
	inc hl			;5224
	ld d,(hl)			;5225
	inc hl			;5226
L_5227:
	xor a			;5227   ; el indice del punto (bit de cada plano)...
	rl d		;5228
	rla			;522a
	rl e		;522b
	rla			;522d
	exx			;522e   ; ...con los colores de 0xE700 (indice 0-3)
	ld e,a			;522f
	ld d,0e7h		;5230
	ld a,(de)			;5232
	add a,a			;5233   ; el primer punto, al nibble alto
	add a,a			;5234
	add a,a			;5235
	add a,a			;5236
	ld c,a			;5237
	exx			;5238
	xor a			;5239   ; el indice del segundo punto
	rl d		;523a
	rla			;523c
	rl e		;523d
	rla			;523f
	exx			;5240
	ld e,a			;5241
	ld d,0e7h		;5242
	ld a,(de)			;5244
	or c			;5245   ; los dos puntos en un byte
	ld (hl),a			;5246   ; a 0xE708 y siguientes
	inc hl			;5247
	exx			;5248
	djnz L_5227		;5249
	ret			;524b
fichas_3_planos:		; B fichas de 3 planos (24 bytes) de HL a la VRAM DE con los colores de 0xE700
	push bc			;524c
	exx			;524d   ; HL' = 0xE708, donde va la ficha a 4 bits
	ld hl,0e708h		;524e
	exx			;5251
	push de			;5252
	call ficha_3_planos		;5253   ; ficha_3_planos: una ficha de 3 planos de HL a 4 bits en 0xE708
	pop de			;5256
	push hl			;5257
	ld hl,0e708h		;5258   ; la ficha a 4 bits...
	ld b,001h		;525b   ; ...a la VRAM DE
	call fichas_a_vram		;525d   ; fichas_a_vram: B fichas de 32 bytes de HL a la VRAM DE, de 8 en 8 puntos y 8 lineas mas abajo cada 32
	pop hl			;5260
	pop bc			;5261
	djnz fichas_3_planos		;5262   ; B fichas
	ret			;5264
fichas_3_planos_espejo:		; como fichas_3_planos, pero cada ficha volteada de lado
	push bc			;5265
	exx			;5266   ; HL' = 0xE708, donde va la ficha a 4 bits
	ld hl,0e708h		;5267
	exx			;526a
	push de			;526b
	call ficha_3_planos		;526c   ; ficha_3_planos: una ficha de 3 planos de HL a 4 bits en 0xE708
	pop de			;526f
	push hl			;5270
	ld hl,0e708h		;5271   ; la ficha a 4 bits...
	ld b,001h		;5274   ; ...volteada a la VRAM DE
	call fichas_a_vram_espejo		;5276   ; fichas_a_vram_espejo: como fichas_a_vram, pero cada ficha volteada de lado
	pop hl			;5279
	pop bc			;527a
	djnz fichas_3_planos_espejo		;527b   ; B fichas
	ret			;527d
ficha_3_planos:		; una ficha de 3 planos de HL a 4 bits en 0xE708
	ld b,008h		;527e   ; 8 filas
L_5280:
	push bc			;5280
	call fila_3_planos		;5281   ; fila_3_planos: una fila (3 bytes) de una ficha de 3 planos a 4 bits en (HL')
	pop bc			;5284
	djnz L_5280		;5285
	ret			;5287
fila_3_planos:		; una fila (3 bytes) de una ficha de 3 planos a 4 bits en (HL')
	ld b,004h		;5288   ; 4 bytes de 2 puntos
	ld e,(hl)			;528a   ; E, D y C = los tres planos de la fila
	inc hl			;528b
	ld d,(hl)			;528c
	inc hl			;528d
	ld c,(hl)			;528e
	inc hl			;528f
L_5290:
	xor a			;5290   ; el indice del punto (bit de cada plano)...
	rl c		;5291
	rla			;5293
	rl d		;5294
	rla			;5296
	rl e		;5297
	rla			;5299
	exx			;529a   ; ...con los colores de 0xE700 (indice 0-7)
	ld e,a			;529b
	ld d,0e7h		;529c
	ld a,(de)			;529e
	add a,a			;529f   ; el primer punto, al nibble alto
	add a,a			;52a0
	add a,a			;52a1
	add a,a			;52a2
	ld c,a			;52a3
	exx			;52a4
	xor a			;52a5   ; el indice del segundo punto
	rl c		;52a6
	rla			;52a8
	rl d		;52a9
	rla			;52ab
	rl e		;52ac
	rla			;52ae
	exx			;52af
	ld e,a			;52b0
	ld d,0e7h		;52b1
	ld a,(de)			;52b3
	or c			;52b4   ; los dos puntos en un byte
	ld (hl),a			;52b5   ; a 0xE708 y siguientes
	inc hl			;52b6
	exx			;52b7
	djnz L_5290		;52b8
	ret			;52ba
empieza_texto:		; 0xCEF3 = el texto 0xCEF0 (p12:A37D) y 0xCEF5 = su primer byte (el tipo de ventana)
	call bancos_10_11_12		;52bb   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	xor a			;52be   ; 0xCEE3 a cero
	ld (0cee3h),a		;52bf
	ld a,(0cef0h)		;52c2   ; lee el texto de la ventana
	dec a			;52c5   ; del texto 1-n al indice
	ld de,0a37dh		;52c6   ; p12:A37D: los punteros de los 159 textos
	call palabra_a		;52c9   ; palabra_a: DE = la palabra A de la tabla DE
	ld (0cef3h),de		;52cc   ; guarda por donde va el texto y el byte siguiente (16 bits)
	ld a,(de)			;52d0   ; el primer byte del texto: el tipo de ventana
	ld (0cef5h),a		;52d1   ; guarda el tipo de ventana de texto
L_52D4:
	jp bancos_1_2_3		;52d4   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
trozo_de_texto:		; copia el texto de 0xCEF3 a 0xCF10 con los trozos >= 0xA1 (p12:B8A7) puestos; A = 0 con 0xFF, 1 con 0xFD
	call bancos_10_11_12		;52d7   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0cf10h		;52da   ; apunta a el trozo de texto que se escribe
	ld hl,(0cef3h)		;52dd   ; lee por donde va el texto y el byte siguiente (16 bits)
L_52E0:
	ld a,(hl)			;52e0   ; un caracter
	inc a			;52e1
	jr z,L_52F6		;52e2   ; 0xFF: acaba el texto (A = 0)
	inc a			;52e4
	jr z,L_52F0		;52e5   ; 0xFE: se copia (el cambio de linea)
	inc a			;52e7
	jr z,L_52F9		;52e8   ; 0xFD: acaba el trozo (A = 1, sigue otro)
	ld a,(hl)			;52ea
	cp 0a1h		;52eb   ; 0xA1 en adelante: un trozo compartido
	jp nc,L_52FD		;52ed
L_52F0:
	ld a,(hl)			;52f0   ; los demas se copian
	ld (de),a			;52f1
	inc de			;52f2
	inc hl			;52f3
	jr L_52E0		;52f4
L_52F6:
	xor a			;52f6
	jr L_52FB		;52f7
L_52F9:
	ld a,001h		;52f9
L_52FB:
	jr L_52D4		;52fb
L_52FD:
	sub 0a1h		;52fd   ; el trozo n - 0xA1...
	inc hl			;52ff
	push hl			;5300
	push de			;5301
	ld de,0b8a7h		;5302   ; ...de p12:B8A7
	call palabra_a		;5305   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;5308
	pop de			;5309
L_530A:
	ld a,(hl)			;530a   ; se copia hasta su 0xFF
	inc a			;530b
	jr z,L_5314		;530c
	dec a			;530e
	ld (de),a			;530f
	inc de			;5310
	inc hl			;5311
	jr L_530A		;5312
L_5314:
	pop hl			;5314   ; y sigue el texto
	jr L_52E0		;5315
nada:		; solo ret
	ret			;5317
atributos_de_snake:		; los sprites de la pose 0xC18A (p10:606A, p10:609F) a 0xEA00 (0xEA40 en las salas 0xF0+ salvo 0xFB) mas su Y y su X
	call bancos_10_11_12		;5318   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0606ah		;531b   ; p10:606A: el juego de sprites de cada pose
	ld a,(0c18ah)		;531e   ; lee la pose de Snake
	call de_mas_a		;5321   ; de_mas_a: DE = DE + A
	ld a,(de)			;5324   ; A = el juego de la pose
	ld de,0609fh		;5325   ; p10:609F: los atributos de cada juego
	call palabra_a		;5328   ; palabra_a: DE = la palabra A de la tabla DE
	ld a,(0c130h)		;532b   ; lee la sala
	cp 0f0h		;532e   ; en las salas 0xF0+ (ascensores) los de Snake van mas abajo...
	ld hl,0ea00h		;5330   ; apunta a la copia de los atributos de los sprites
	jr c,L_533C		;5333
	cp 0fbh		;5335   ; ...salvo en la 0xFB
	jr z,L_533C		;5337
	ld hl,0ea40h		;5339
L_533C:
	ex de,hl			;533c   ; HL = los atributos, DE = la copia en RAM
	ld b,(hl)			;533d   ; B = cuantos sprites
	inc hl			;533e
	ld c,0ffh		;533f
L_5341:
	ld a,(hl)			;5341   ; [y][x][patron][color] por sprite
	cp 080h		;5342   ; y = 0x80: sprite escondido
	ld a,0e0h		;5344   ; 0xE0: fuera de la pantalla
	jr z,L_534C		;5346
	ld a,(0c182h)		;5348   ; lee la Y de Snake
	add a,(hl)			;534b   ; la y del sprite + la Y de Snake
L_534C:
	ld (de),a			;534c
	inc hl			;534d
	inc e			;534e
	ld a,(0c184h)		;534f   ; lee la X de Snake
	add a,(hl)			;5352   ; la x del sprite + la X de Snake
	ld (de),a			;5353
	inc hl			;5354
	inc e			;5355
	ldi		;5356   ; el patron, tal cual
	inc hl			;5358   ; el color se salta (lo pone colores_de_snake)
	inc e			;5359
	djnz L_5341		;535a   ; siguiente sprite
	jr L_53A2		;535c
colores_de_snake:		; los colores de la pose 0xC18A, 16 lineas por sprite, a 0xE800 (0xE900 en las salas 0xF0+)
	call bancos_10_11_12		;535e   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0606ah		;5361   ; p10:606A: el juego de sprites de cada pose
	ld a,(0c18ah)		;5364   ; lee la pose de Snake
	call de_mas_a		;5367   ; de_mas_a: DE = DE + A
	ld a,(de)			;536a
	ld de,0609fh		;536b   ; p10:609F: los atributos de cada juego
	call palabra_a		;536e   ; palabra_a: DE = la palabra A de la tabla DE
	ld a,(0c130h)		;5371   ; lee la sala
	cp 0f0h		;5374   ; en las salas 0xF0+ (ascensores), los colores mas abajo
	ld hl,0e800h		;5376
	jr c,L_537E		;5379
	ld hl,0e900h		;537b
L_537E:
	ex de,hl			;537e
	ld a,(0c199h)		;537f   ; con 0xC199 (herido), un cuadro si y otro no...
	and a			;5382
	jr z,L_538F		;5383
	ld a,(0c003h)		;5385   ; lee la cuenta de cuadros
	bit 0,a		;5388
	jr nz,L_538F		;538a
	ld hl,06174h		;538c   ; ...los colores de p10:6174 (el parpadeo)
L_538F:
	ld c,(hl)			;538f   ; C = cuantos sprites
	inc hl			;5390   ; al primer color ([y][x][patron][color])
	inc hl			;5391
	inc hl			;5392
	inc hl			;5393
L_5394:
	ld a,(hl)			;5394   ; el color del sprite...
	ld b,010h		;5395   ; ...en sus 16 lineas (modo 2 de sprites)
L_5397:
	ld (de),a			;5397
	inc de			;5398
	djnz L_5397		;5399
	inc hl			;539b   ; el color del sprite siguiente
	inc hl			;539c
	inc hl			;539d
	inc hl			;539e
	dec c			;539f
	jr nz,L_5394		;53a0   ; siguiente sprite
L_53A2:
	jp bancos_1_2_3		;53a2   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
sprites_de_snake:		; atributos, colores y patrones de la pose de Snake
	call atributos_de_snake		;53a5   ; atributos_de_snake: los sprites de la pose 0xC18A (p10:606A, p10:609F) a 0xEA00 (0xEA40 en las salas 0xF0+ salvo 0xFB) mas su Y y su X
	call colores_de_snake		;53a8   ; colores_de_snake: los colores de la pose 0xC18A, 16 lineas por sprite, a 0xE800 (0xE900 en las salas 0xF0+)
patrones_de_snake:		; descomprime los patrones de la pose 0xC18A (p10:6000) en 0xF800
	ld hl,0f800h		;53ab   ; los patrones de Snake, desde el 0
	call vram_para_escribir		;53ae   ; vram_para_escribir: pone la direccion de escritura de la VRAM en HL (R#14 y el puerto 1)
	ld de,06000h		;53b1   ; p10:6000: los patrones de cada pose
	ld a,(0c18ah)		;53b4   ; lee la pose de Snake
	call bancos_10_11_12		;53b7   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	call palabra_a		;53ba   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;53bd   ; HL = los datos comprimidos
	ld a,(00007h)		;53be   ; el puerto de datos del VDP
	ld c,a			;53c1
L_53C2:
	ld a,(hl)			;53c2   ; n = 0: acaba
	and 07fh		;53c3
	jr z,L_53A2		;53c5
	cp (hl)			;53c7   ; n < 0x80: repite el byte siguiente n veces
	jr z,L_53D0		;53c8
	ld b,a			;53ca   ; n > 0x80: copia los n - 0x80 bytes siguientes
	inc hl			;53cb
	otir		;53cc
	jr L_53C2		;53ce
L_53D0:
	ld b,a			;53d0   ; el byte a repetir
	inc hl			;53d1
	ld a,(hl)			;53d2
	inc hl			;53d3
L_53D4:
	out (c),a		;53d4   ; n veces
	djnz L_53D4		;53d6
	jr L_53C2		;53d8
atributos_del_proyectil:		; el cuadro (ix+0x0B) de p10:63B0 a los sprites de IX sumando (ix+4) y (ix+6); 0x80 = escondido
	call bancos_10_11_12		;53da   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(ix+00bh)		;53dd   ; el cuadro del proyectil...
	ld de,063b0h		;53e0   ; ...en p10:63B0
	call palabra_a		;53e3   ; palabra_a: DE = la palabra A de la tabla DE
	push ix		;53e6   ; HL = la ficha del proyectil...
	pop hl			;53e8
	ld a,022h		;53e9   ; ...+0x22: la y de su primer sprite
	call hl_mas_a		;53eb   ; hl_mas_a: HL = HL + A
	ld a,(ix+020h)		;53ee   ; B = cuantos sprites
	ld b,a			;53f1
L_53F2:
	ld a,(de)			;53f2   ; [y][x][patron][color]; y = 0x80: escondido
	cp 080h		;53f3
	jr nz,L_53FE		;53f5
	ld (hl),0e1h		;53f7   ; Y = 0xE1: fuera de la pantalla
	inc hl			;53f9
	inc hl			;53fa
	inc hl			;53fb
	jr L_5411		;53fc
L_53FE:
	add a,(ix+004h)		;53fe   ; la y + la Y del proyectil
	ld (hl),a			;5401
	inc de			;5402
	inc hl			;5403
	ld a,(de)			;5404
	add a,(ix+006h)		;5405   ; la x + la X del proyectil
	ld (hl),a			;5408
	inc de			;5409
	inc hl			;540a
	ld a,(de)			;540b   ; el patron
	ld (hl),a			;540c
	inc hl			;540d
	inc de			;540e
	ld a,(de)			;540f   ; el color
	ld (hl),a			;5410
L_5411:
	inc hl			;5411   ; 5 bytes por sprite en la ficha
	inc hl			;5412
	inc de			;5413
	djnz L_53F2		;5414   ; siguiente sprite
	jp bancos_1_2_3		;5416   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
crea_tipo_35:		; la creacion del tipo 35
	ld a,(0c602h)		;5419   ; lee la bandera 0xC602 (refuerzos y musica)
	and a			;541c
	jp nz,0737bh		;541d   ; con la bandera 0xC602 el actor se quita
	ld a,(0c130h)		;5420   ; lee la sala
	sub 018h		;5423   ; la sala 0x18: la lista p12:A132
	ld de,0a132h		;5425
	jr z,L_5433		;5428
	dec a			;542a   ; la 0x19: p12:A15D
	ld de,0a15dh		;542b
	jr z,L_5433		;542e
	ld de,0a181h		;5430   ; las demas (la 0x48): p12:A181
L_5433:
	call bancos_10_11_12		;5433   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld hl,0d000h		;5436   ; los rayos ocupan los primeros huecos de actor
	ld a,(de)			;5439   ; [cuantos] en 0xC609
	ld (0c609h),a		;543a
	inc de			;543d
	ld b,a			;543e
L_543F:
	push bc			;543f   ; un rayo
	push hl			;5440
	push de			;5441
	ld (hl),023h		;5442   ; +0: el tipo 0x23
	inc hl			;5444
	ld a,(de)			;5445   ; +1: el primer byte de la ficha (bit 0: encendido)
	ld (hl),a			;5446
	ld (0ec00h),a		;5447   ; guarda la casilla de trabajo 0xEC00
	inc de			;544a
	inc hl			;544b
	ld (hl),000h		;544c   ; +2 a cero
	inc hl			;544e
	ld a,(de)			;544f   ; +3: la Y
	ld (hl),a			;5450
	ld c,a			;5451
	inc de			;5452
	inc hl			;5453
	ld (hl),000h		;5454   ; +4 a cero
	inc hl			;5456
	ld a,(de)			;5457   ; +5: la X
	ld (hl),a			;5458
	ld b,a			;5459
	ld (0ec01h),bc		;545a   ; 0xEC01 = Y, 0xEC02 = X
	inc de			;545e
	inc hl			;545f
	ld (hl),000h		;5460   ; +6 a cero
	ld a,007h		;5462   ; +0x0D: aguante 1
	call hl_mas_a		;5464   ; hl_mas_a: HL = HL + A
	ld (hl),001h		;5467
	inc hl			;5469
	ld a,(0ec00h)		;546a   ; +0x0E: el primer byte otra vez
	ld (hl),a			;546d
	inc hl			;546e
	inc hl			;546f
	ld (hl),000h		;5470   ; +0x10 a cero
	inc hl			;5472
	inc hl			;5473
	inc hl			;5474
	ld a,(de)			;5475   ; +0x13 y +0x14: donde se guarda el fondo en la pagina 1
	ld (hl),a			;5476
	ld c,a			;5477
	inc de			;5478
	inc hl			;5479
	ld a,(de)			;547a
	ld (hl),a			;547b
	ld b,a			;547c
	ld (0ec03h),bc		;547d   ; 0xEC03 = ese sitio
	inc de			;5481
	inc hl			;5482
	ld a,(de)			;5483   ; +0x15: el largo
	ld (hl),a			;5484
	ld b,a			;5485
	inc de			;5486
	inc hl			;5487
	ld a,(de)			;5488   ; +0x16: bit 0, el rayo es horizontal
	ld (hl),a			;5489
	ld c,002h		;548a   ; 2 de grueso
	ld hl,(0ec01h)		;548c   ; del sitio del rayo...
	ld de,(0ec03h)		;548f   ; ...al sitio de la copia
	rra			;5493   ; vertical: 2 de ancho y B de alto
	jr c,L_5499		;5494
	ld a,b			;5496   ; horizontal: B de ancho y 2 de alto
	ld b,c			;5497
	ld c,a			;5498
L_5499:
	ld a,004h		;5499   ; guarda el fondo del rayo en la pagina 1 (de la 0 a la 1)
	call copia_vram		;549b   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	pop de			;549e
	pop hl			;549f
	pop bc			;54a0
	ld a,007h		;54a1   ; 7 bytes por rayo en la lista
	call de_mas_a		;54a3   ; de_mas_a: DE = DE + A
	ld a,080h		;54a6   ; el hueco de actor siguiente
	call hl_mas_a		;54a8   ; hl_mas_a: HL = HL + A
	djnz L_543F		;54ab   ; siguiente rayo
	jr L_5503		;54ad
cuadro_tipo_35:		; lo de cada cuadro del tipo 35
	ld a,(0c130h)		;54af   ; lee la sala
	cp 048h		;54b2   ; solo en la sala 0x48...
	ret nz			;54b4
	ld a,(0c135h)		;54b5   ; lee el objeto elegido (p06:B8F6: 3 LIGHT, 4 GOGGL, 6 CIGAL, 0x0E-0x15 CARD1-8, 0x16 RATIO, 0x19 BOX...)
	cp 004h		;54b8   ; ...y con GOGGL (objeto 4)
	ret nz			;54ba
	ld hl,0c60ah		;54bb   ; cada 0xC0 cuadros (0xC60A)...
	inc (hl)			;54be
	ld a,(hl)			;54bf
	cp 0c0h		;54c0
	ret nz			;54c2
	ld (hl),000h		;54c3   ; ...cambia el grupo de rayos encendidos (0xC60B, 0-4)
	inc hl			;54c5
	inc (hl)			;54c6
	ld a,(hl)			;54c7
	sub 005h		;54c8
	jr nz,L_54CD		;54ca
	ld (hl),a			;54cc
L_54CD:
	call zona_banco_15		;54cd   ; borra los rayos (p15:BF6E)
	call 0bf6eh		;54d0   ; borra_rayos: tapa los rayos copiando de la pagina 1
	call bancos_1_2_3		;54d3   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call bancos_10_11_12		;54d6   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c60bh)		;54d9   ; p12:A1C8: que rayos se encienden en cada grupo
	ld de,0a1c8h		;54dc
	call palabra_a		;54df   ; palabra_a: DE = la palabra A de la tabla DE
	ld hl,0d001h		;54e2   ; +1 del primer actor
	ld a,(0c609h)		;54e5
	ld b,a			;54e8
L_54E9:
	ld a,(de)			;54e9   ; el byte nuevo de cada rayo...
	ld (hl),a			;54ea
	inc de			;54eb
	ld c,a			;54ec
	ld a,00dh		;54ed   ; ...tambien en su +0x0E
	call hl_mas_a		;54ef   ; hl_mas_a: HL = HL + A
	ld (hl),c			;54f2
	ld a,073h		;54f3   ; el actor siguiente (0x80 en total)
	call hl_mas_a		;54f5   ; hl_mas_a: HL = HL + A
	djnz L_54E9		;54f8
	call bancos_1_2_3		;54fa   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	call zona_banco_15		;54fd   ; zona_banco_15: pone el banco 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bf22h		;5500   ; los pinta otra vez (p15:BF22)
L_5503:
	jp bancos_1_2_3		;5503   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
atributos_del_actor:		; el cuadro (ix+0x0B) de p05:9890 a los sprites de IX sumando su Y y su X (0x91-0xA5: grupo de 0x556F)
	ld a,(ix+020h)		;5506   ; lee cuantos sprites tiene el actor
	or a			;5509   ; sin sprites, nada
	ret z			;550a
	call bancos_4_5_6		;550b   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(ix+000h)		;550e   ; lee el tipo del actor
	cp 0f0h		;5511   ; los tipos 0xF0 y mas no tienen cuadros
	jr nc,L_5546		;5513
	ld a,(ix+00bh)		;5515   ; lee el cuadro del actor
	ld de,09890h		;5518   ; p05:9890: los atributos de cada cuadro
	call palabra_a		;551b   ; palabra_a: DE = la palabra A de la tabla DE
	push ix		;551e   ; HL = la ficha del actor...
	pop hl			;5520
	set 5,l		;5521   ; ...+0x20: cuantos sprites
	ld b,(hl)			;5523
	inc l			;5524   ; +0x22: la y del primer sprite
	inc l			;5525
L_5526:
	ld a,(de)			;5526   ; la y relativa del sprite...
	ld c,a			;5527
	inc de			;5528
	sub 091h		;5529   ; ...o 0x91-0xA5: un grupo de posiciones
	jr c,L_5531		;552b
	cp 015h		;552d
	jr c,L_5549		;552f
L_5531:
	ld a,c			;5531   ; la y + la Y del actor
	add a,(ix+003h)		;5532   ; le suma la Y del actor
	ld (hl),a			;5535
	inc l			;5536
	ld a,(de)			;5537   ; la x + la X del actor
	add a,(ix+005h)		;5538   ; le suma la X del actor
	ld (hl),a			;553b
	inc de			;553c
	inc l			;553d
	ld a,(de)			;553e   ; el patron
	ld (hl),a			;553f
	inc de			;5540
	inc l			;5541
	inc l			;5542   ; 5 bytes por sprite en la ficha
	inc l			;5543
	djnz L_5526		;5544   ; siguiente sprite
L_5546:
	jp bancos_1_2_3		;5546   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
L_5549:
	exx			;5549   ; el grupo n - 0x91...
	ld de,0556fh		;554a   ; ...de 0x556F
	call palabra_a		;554d   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;5550
	exx			;5551
L_5552:
	exx			;5552   ; [y][x] de cada sprite del grupo
	ld a,(hl)			;5553
	inc hl			;5554
	add a,(ix+003h)		;5555   ; le suma la Y del actor
	exx			;5558
	ld (hl),a			;5559   ; en la ficha del actor
	inc l			;555a
	exx			;555b
	ld a,(hl)			;555c
	inc hl			;555d
	add a,(ix+005h)		;555e   ; le suma la X del actor
	exx			;5561
	ld (hl),a			;5562
	inc l			;5563
	ld a,(de)			;5564   ; y el patron, de la lista del cuadro
	ld (hl),a			;5565
	inc de			;5566
	inc l			;5567
	inc l			;5568
	inc l			;5569
	djnz L_5552		;556a   ; siguiente sprite
	jp bancos_1_2_3		;556c   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)

; ----------------------------------------------------------------------
; DATOS grupos_de_sprites: 21 punteros a listas de parejas [y][x] del banco 5
;   (0x9DA5-0x9E99): los atributos de un actor pueden traer un byte 0x91-0xA5
;   que p00:554A cambia por el grupo 0x556F[n - 0x91] (p00:5552 va sumando la
;   posicion del actor)
;   0x556f..0x5599  (42 bytes)
DATA_grupos_de_sprites:
	defw 09da5h,09dadh,09db5h,09dbdh,09dc5h,09dcdh,09df1h	; 556f
	defw 09e15h,09e1dh,09e2dh,09e35h,09e41h,09e59h,09e4dh	; 557d
	defw 09e71h,09e79h,09e81h,09e89h,09e91h,09e91h,09e99h	; 558b

; ======================================================================
; CODIGO 0x5599..0x5762  (457 bytes)
; ======================================================================


sprites_de_los_actores:		; pone los sprites de los 16 actores en la copia de atributos y sus colores
	ld hl,0d000h		;5599   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;559c   ; los 16 actores
L_559E:
	push bc			;559e
	push hl			;559f
	ld a,(hl)			;55a0
	and a			;55a1   ; hueco vacio: nada
	call nz,sprites_de_un_actor		;55a2   ; sprites_de_un_actor: los sprites del actor HL a 0xEA28 + 4 x n y sus colores a 0xE8A0 + 16 x n
	pop hl			;55a5
	pop bc			;55a6
	ld de,00080h		;55a7   ; la ficha siguiente
	add hl,de			;55aa
	djnz L_559E		;55ab
	ret			;55ad
sprites_de_un_actor:		; los sprites del actor HL a 0xEA28 + 4 x n y sus colores a 0xE8A0 + 16 x n
	set 5,l		;55ae   ; +0x20: cuantos sprites
	ld b,(hl)			;55b0
	ld a,b			;55b1
	and a			;55b2
	ret z			;55b3
	inc l			;55b4   ; +0x21: el hueco del primer sprite
L_55B5:
	push bc			;55b5   ; B = el hueco de 0xEA28 que usa el sprite
	ld a,(hl)			;55b6
	ld b,a			;55b7
	inc l			;55b8
	ld de,0ea28h		;55b9   ; apunta a los atributos de los sprites de los actores
	ld a,b			;55bc   ; 4 bytes por hueco
	add a,a			;55bd
	add a,a			;55be
	add a,e			;55bf
	ld e,a			;55c0
	ld c,0ffh		;55c1
	ldi		;55c3   ; la y, la x y el patron del sprite a la copia de atributos
	ldi		;55c5
	ldi		;55c7
	ld a,(hl)			;55c9   ; el color
	and a			;55ca
	jr nz,L_55D6		;55cb   ; color 0: el sprite se esconde...
	dec e			;55cd
	dec e			;55ce
	dec e			;55cf
	ld a,0e1h		;55d0   ; ...con Y = 0xE1
	ld (de),a			;55d2
	inc e			;55d3
	inc e			;55d4
	inc e			;55d5
L_55D6:
	ex de,hl			;55d6   ; los colores del hueco n: (0x7450 + 8 x n) x 2 = 0xE8A0 + 16 x n
	ld hl,07450h		;55d7
	ld a,b			;55da
	add a,a			;55db
	add a,a			;55dc
	add a,a			;55dd
	ld c,a			;55de
	ld b,000h		;55df
	add hl,bc			;55e1
	add hl,hl			;55e2
	ex de,hl			;55e3
	ld a,(hl)			;55e4   ; el color...
	ld b,010h		;55e5   ; ...en las 16 lineas del sprite
L_55E7:
	ld (de),a			;55e7
	inc e			;55e8
	djnz L_55E7		;55e9
	pop bc			;55eb
	inc l			;55ec   ; el sprite siguiente de la ficha
	djnz L_55B5		;55ed
	ret			;55ef
actores_de_la_sala:		; al entrar en sala: borra 0xD000-0xD7FF y crea los actores de la sala (p05:9560)
	call mira_c602		;55f0   ; mira_c602: quita 0xC602 (y lo que sigue) segun la sala, la cuenta 0xC605 y los actores que quedan
	ld a,(0c602h)		;55f3   ; lee la bandera 0xC602 (refuerzos y musica)
	ld (0c632h),a		;55f6   ; 0xC632 = la bandera 0xC602 al entrar
	xor a			;55f9   ; 0xC616, 0xC668, 0xC669-0xC66A y 0xC63B-0xC63C a cero
	ld (0c616h),a		;55fa
	ld (0c668h),a		;55fd
	ld hl,0c669h		;5600
	ld (hl),a			;5603
	inc hl			;5604
	ld (hl),a			;5605
	ld hl,0c63bh		;5606
	ld (hl),a			;5609
	inc hl			;560a
	ld (hl),a			;560b
	ld a,(0c130h)		;560c   ; lee la sala
	cp 053h		;560f   ; en la sala 0x53, 0xC626 = 2
	jr nz,L_5618		;5611
	ld hl,0c626h		;5613
	ld (hl),002h		;5616
L_5618:
	ld a,(0c130h)		;5618   ; lee la sala
	cp 096h		;561b   ; en la sala 0x96, 0xC638 = 4
	jr nz,L_5624		;561d
	ld hl,0c638h		;561f
	ld (hl),004h		;5622
L_5624:
	ld a,01bh		;5624   ; cuantos actores del tipo 0x1B quedaban, en 0xC62E
	call cuenta_tipo		;5626   ; cuenta_tipo: A = cuantos actores del tipo A hay
	ld (0c62eh),a		;5629
	ld hl,0d000h		;562c   ; los 16 actores a cero (0x800 bytes)
	ld de,0d001h		;562f
	ld bc,007ffh		;5632
	ld (hl),000h		;5635
	ldir		;5637
	call esconde_sprites_de_actores		;5639   ; esconde_sprites_de_actores: llena de 0xE0 los atributos de los actores (0xEA28-0xEA7F)
	call bancos_4_5_6		;563c   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,001h		;563f   ; 0xC62F = 1 mientras se crean
	ld (0c62fh),a		;5641
	ld a,(0c130h)		;5644   ; lee la sala
	cp 0deh		;5647   ; las salas 0xDE y siguientes no tienen actores
	jp nc,bancos_1_2_3		;5649   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld de,09560h		;564c   ; p05:9560: la lista de actores de cada sala
	call palabra_a		;564f   ; palabra_a: DE = la palabra A de la tabla DE
	ex de,hl			;5652
	ld a,(hl)			;5653   ; [cuantos] en el nibble bajo
	and 00fh		;5654
	ld b,a			;5656
	or a			;5657
	jp z,bancos_1_2_3		;5658   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	inc hl			;565b
L_565C:
	call bancos_4_5_6		;565c   ; un actor
	push bc			;565f
	ld c,(hl)			;5660   ; [tipo]...
	inc hl			;5661
	ld e,(hl)			;5662   ; ...[Y]...
	inc hl			;5663
	ld d,(hl)			;5664   ; ...[X]
	inc hl			;5665
	push hl			;5666
	call crea_actor		;5667   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	pop hl			;566a
	pop bc			;566b
	djnz L_565C		;566c   ; siguiente actor
	xor a			;566e   ; 0xC62F = 0: ya estan
	ld (0c62fh),a		;566f
	jp bancos_1_2_3		;5672   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
esconde_sprites_de_actores:		; llena de 0xE0 los atributos de los actores (0xEA28-0xEA7F)
	ld hl,0ea28h		;5675   ; apunta a los atributos de los sprites de los actores
	ld de,0ea29h		;5678
	ld bc,00057h		;567b   ; 0x58 bytes: los atributos de los actores
	ld (hl),0e0h		;567e   ; Y = 0xE0: fuera de la pantalla
	ldir		;5680
	ret			;5682
crea_lista_de_actores:		; crea los actores de la lista ([cuantos] y [tipo][Y][X]) a la que apunta (HL + 1)
	inc hl			;5683   ; HL + 1: un puntero a la lista
	ld e,(hl)			;5684
	inc hl			;5685
	ld d,(hl)			;5686
	ex de,hl			;5687
	ld b,(hl)			;5688   ; [cuantos]
	inc hl			;5689
L_568A:
	ld c,(hl)			;568a   ; [tipo][Y][X]
	inc hl			;568b
	ld e,(hl)			;568c
	inc hl			;568d
	ld d,(hl)			;568e
	inc hl			;568f
	push hl			;5690
	push bc			;5691
	call crea_actor		;5692   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	pop bc			;5695
	pop hl			;5696
	djnz L_568A		;5697   ; siguiente actor
	ret			;5699
crea_actor:		; crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
	ld a,c			;569a
	ld (0ec00h),a		;569b   ; guarda la casilla de trabajo 0xEC00
	ld (0ec02h),de		;569e   ; 0xEC02 = Y, 0xEC03 = X
	ld hl,0d000h		;56a2   ; apunta a los 16 actores (fichas de 0x80)
	ld b,010h		;56a5   ; los 16 huecos
	xor a			;56a7
	ld de,00080h		;56a8
L_56AB:
	cp (hl)			;56ab   ; tipo 0: hueco libre
	jr nz,L_56B9		;56ac
	push ix		;56ae
	call inicia_actor		;56b0   ; la ficha nueva...
	push ix		;56b3   ; ...en HL, con IX como estaba
	pop hl			;56b5
	pop ix		;56b6
	ret			;56b8
L_56B9:
	add hl,de			;56b9   ; el hueco siguiente
	djnz L_56AB		;56ba
	xor a			;56bc   ; A = 0: no cabe
	ret			;56bd
inicia_actor:		; rellena la ficha HL: sprites (p05:971B), huecos en 0xEA28, colores, aguante (p05:984F) y la creacion de su tipo
	ld (0ec04h),hl		;56be
	push hl			;56c1
	pop ix		;56c2
	call bancos_4_5_6		;56c4   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0ec00h)		;56c7   ; lee la casilla de trabajo 0xEC00
	ld hl,0971bh		;56ca   ; p05:971B: cuantos sprites tiene cada tipo
	call hl_mas_a		;56cd   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;56d0
	ld (ix+020h),a		;56d1
	ld c,a			;56d4   ; C = los sprites que faltan por colocar
	call bancos_1_2_3		;56d5   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	or a			;56d8   ; sin sprites: directo a la ficha
	jr z,L_5716		;56d9
	ld de,00000h		;56db   ; D = el hueco de sprite, E = el sprite del actor
	ld hl,0ea28h		;56de   ; apunta a los atributos de los sprites de los actores
	ld b,016h		;56e1   ; 22 huecos de sprite para los actores
L_56E3:
	ld a,(hl)			;56e3   ; 0xE0: libre
	cp 0e0h		;56e4
	jr nz,L_56F0		;56e6
	inc (hl)			;56e8   ; lo marca ocupado (0xE1)
	call apunta_hueco		;56e9   ; apunta_hueco: el sprite E del actor (0xEC04) usa el hueco D de 0xEA28
	inc e			;56ec   ; el sprite siguiente del actor
	dec c			;56ed
	jr z,L_5716		;56ee
L_56F0:
	inc d			;56f0   ; el hueco siguiente
	inc l			;56f1
	inc l			;56f2
	inc l			;56f3
	inc l			;56f4
	djnz L_56E3		;56f5
	ld a,(ix+020h)		;56f7   ; no caben todos: los ya cogidos se devuelven...
	sub c			;56fa
	ret z			;56fb
	ld b,a			;56fc
	push ix		;56fd   ; ...uno por uno desde (ix+0x21)
	pop hl			;56ff
	set 5,l		;5700
	inc l			;5702
L_5703:
	ld a,(hl)			;5703   ; el hueco que tenia...
	ld de,0ea28h		;5704   ; apunta a los atributos de los sprites de los actores
	add a,a			;5707
	add a,a			;5708
	call de_mas_a		;5709   ; de_mas_a: DE = DE + A
	ld a,0e0h		;570c   ; ...otra vez libre
	ld (de),a			;570e
	ld de,00005h		;570f   ; 5 bytes por sprite
	add hl,de			;5712
	djnz L_5703		;5713
	ret			;5715   ; sin acarreo y sin crear el actor
L_5716:
	ld hl,(0ec04h)		;5716
	ld a,(0ec00h)		;5719   ; lee la casilla de trabajo 0xEC00
	ld (hl),a			;571c   ; +0: el tipo
	xor a			;571d
	inc l			;571e
	ld (hl),a			;571f   ; +1 (el paso) a cero
	ld de,(0ec02h)		;5720
	inc l			;5724
	ld (hl),a			;5725   ; +2 a cero, +3 la Y
	inc l			;5726
	ld (hl),e			;5727
	inc l			;5728
	ld (hl),a			;5729   ; +4 a cero, +5 la X
	inc l			;572a
	ld (hl),d			;572b
	inc l			;572c
	ld (hl),a			;572d   ; +6 a cero
	ld (ix+00ch),a		;572e
	ld (ix+07ah),a		;5731   ; (ix+0x7A), los golpes recibidos, a cero
	ld (ix+00eh),003h		;5734
	ld (ix+01eh),a		;5738
	ld (ix+07fh),001h		;573b
	ld (ix+01fh),a		;573f
	call bancos_4_5_6		;5742   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0975ah		;5745   ; p05:975A: los colores de cada tipo
	call colores_de_tabla		;5748   ; colores_de_tabla: copia los colores del tipo (ix+0) de la tabla DE a la ficha, uno cada 5 bytes
	ld a,(0ec00h)		;574b   ; lee la casilla de trabajo 0xEC00
	ld de,0984fh		;574e   ; p05:984F: el aguante de cada tipo
	call de_mas_a		;5751   ; de_mas_a: DE = DE + A
	ld a,(de)			;5754
	ld (ix+00dh),a		;5755
	call bancos_1_2_3		;5758   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(ix+000h)		;575b   ; la creacion del tipo (tabla 0x5762)
	dec a			;575e
	call despacha		;575f   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_5762: 64 destinos del despachador p00:41EA (call en p00:575F, el
;   indice en A): A5F4, A5F4, 9D7F, 593D, 5939, 9EAF, AF52, 99E9, B9B1, A749,
;   A749, B933, ACC3, AB08, 99C8, A6BC, 57E3, B248, A9D7, AFC4, B038, B091,
;   BB10, B278, 9B14, BB51, B3D8, BCA9, B58B, 5935, B132, BD8D, B5C0, B6D4,
;   5419, A4A2, A4DD, B843, B8E5, BF79, 971D, 57E2, B693, A1F5, 7E01, 9A25,
;   A9BF, 9AA5, 9C4F, 9C4F, 9C4F, 9C4F, 9E99, A04A, 9C4F, 9C4F, AE46, AE00,
;   AE1A, B80E, B8D2, BB28, 9662, A0D6; lo leen p00:575F (128 bytes)
;   0x5762..0x57e2  (128 bytes)
DATA_tabla_5762:
	defw 0a5f4h,0a5f4h,09d7fh,0593dh,05939h,09eafh,0af52h,099e9h	; 5762
	defw 0b9b1h,0a749h,0a749h,0b933h,0acc3h,0ab08h,099c8h,0a6bch	; 5772
	defw 057e3h,0b248h,0a9d7h,0afc4h,0b038h,0b091h,0bb10h,0b278h	; 5782
	defw 09b14h,0bb51h,0b3d8h,0bca9h,0b58bh,05935h,0b132h,0bd8dh	; 5792
	defw 0b5c0h,0b6d4h,05419h,0a4a2h,0a4ddh,0b843h,0b8e5h,0bf79h	; 57a2
	defw 0971dh,057e2h,0b693h,0a1f5h,07e01h,09a25h,0a9bfh,09aa5h	; 57b2
	defw 09c4fh,09c4fh,09c4fh,09c4fh,09e99h,0a04ah,09c4fh,09c4fh	; 57c2
	defw 0ae46h,0ae00h,0ae1ah,0b80eh,0b8d2h,0bb28h,09662h,0a0d6h	; 57d2

; ======================================================================
; CODIGO 0x57e2..0x5a5e  (636 bytes)
; ======================================================================


nada_57e2:		; solo ret (la creacion del tipo 42)
	ret			;57e2
crea_tipo_17:		; la creacion del tipo 17
	call zona_banco_12		;57e3   ; zona_banco_12: pone el banco 12 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6
	call 0bc12h		;57e6   ; p12:BC12: Metal Gear
	jp bancos_1_2_3		;57e9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
colores_de_tabla:		; copia los colores del tipo (ix+0) de la tabla DE a la ficha, uno cada 5 bytes
	ld a,(ix+020h)		;57ec   ; lee cuantos sprites tiene el actor
	and a			;57ef
	ret z			;57f0   ; sin sprites, nada
	ld a,(ix+000h)		;57f1   ; lee el tipo del actor
	call palabra_a		;57f4   ; DE = los colores del tipo
	ld hl,(0ec04h)		;57f7
	set 5,l		;57fa   ; +0x20: cuantos sprites
	ld b,(hl)			;57fc
	ld a,005h		;57fd   ; +0x25: el color del primer sprite
	add a,l			;57ff
	ld l,a			;5800
L_5801:
	ld a,(de)			;5801   ; un color por sprite
	inc de			;5802
	ld (hl),a			;5803
	ld a,l			;5804   ; 5 bytes por sprite
	add a,005h		;5805
	ld l,a			;5807
	djnz L_5801		;5808
	ret			;580a
apunta_hueco:		; el sprite E del actor (0xEC04) usa el hueco D de 0xEA28
	push hl			;580b
	ld hl,(0ec04h)		;580c   ; HL = la ficha del actor
	ld a,e			;580f   ; +0x21 + 5 x E: el hueco del sprite E
	add a,a			;5810
	add a,a			;5811
	add a,e			;5812
	add a,021h		;5813
	call hl_mas_a		;5815   ; hl_mas_a: HL = HL + A
	ld (hl),d			;5818   ; = D
	pop hl			;5819
	ret			;581a
refuerzos:		; con 0xC602 puesto, cada 0xC605 cuadros crea un actor de p06:A445 (sala x 3) si hay pocos de ese tipo
	ld a,(0c602h)		;581b   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;581e   ; sin la bandera, no hay refuerzos
	ret z			;581f
	ld hl,0c605h		;5820   ; apunta a la cuenta de los refuerzos
	ld a,(hl)			;5823
	or a			;5824   ; sin cuenta, tampoco
	ret z			;5825
	dec (hl)			;5826   ; todavia no
	ret nz			;5827
	ld hl,0c003h		;5828   ; apunta a la cuenta de cuadros
	ld a,r		;582b   ; la cuenta siguiente: 0x14 + 0-15 cuadros al azar
	xor (hl)			;582d
	and 00fh		;582e
	add a,014h		;5830
	ld (0c605h),a		;5832   ; guarda la cuenta de los refuerzos
	ld a,(0c130h)		;5835   ; lee la sala
	cp 0bch		;5838   ; las salas 0xBC y siguientes no tienen refuerzos
	ret nc			;583a
	call tres_a		;583b   ; tres_a: HL = 3 x A
	call bancos_4_5_6		;583e   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0a445h		;5841   ; p06:A445: 3 bytes por sala: [tipo][sitio][sitio]
	add hl,de			;5844
	ld a,(hl)			;5845
	or a			;5846   ; tipo 0: la sala no tiene refuerzos
	jp z,bancos_1_2_3		;5847   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld c,a			;584a
	cp 00bh		;584b   ; de los tipos 0x0B y 0x16, hasta 3 a la vez...
	ld b,003h		;584d
	jr z,L_5856		;584f
	cp 016h		;5851
	jr z,L_5856		;5853
	inc b			;5855   ; ...de los demas, hasta 4
L_5856:
	exx			;5856
	call cuenta_tipo		;5857   ; cuenta_tipo: A = cuantos actores del tipo A hay
	exx			;585a
	cp b			;585b   ; ya hay bastantes
	jp nc,bancos_1_2_3		;585c   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	inc hl			;585f
	ld a,(0c003h)		;5860   ; uno de los dos sitios, por la paridad del cuadro
	rra			;5863
	jr nc,L_5867		;5864
	inc hl			;5866
L_5867:
	ld a,(hl)			;5867   ; [Y en el nibble alto][X en el bajo], de 16 en 16
	and 0f0h		;5868
	ld e,a			;586a
	ld a,(hl)			;586b
	add a,a			;586c
	add a,a			;586d
	add a,a			;586e
	add a,a			;586f
	ld d,a			;5870
	call bancos_1_2_3		;5871   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	jp crea_actor		;5874   ; crea_actor: crea un actor del tipo C en Y = E, X = D en la primera ficha libre de 0xD000; HL = la ficha, A = 0 si no cabe
mira_c602:		; quita 0xC602 (y lo que sigue) segun la sala, la cuenta 0xC605 y los actores que quedan
	ld a,(0c5b6h)		;5877
	or a			;587a   ; con 0xC5B6 la bandera se queda
	ret nz			;587b
	ld a,(0c602h)		;587c   ; lee la bandera 0xC602 (refuerzos y musica)
	or a			;587f
	ret z			;5880   ; sin la bandera, nada
	ld a,(0c130h)		;5881   ; lee la sala
	cp 0f0h		;5884   ; en los ascensores (0xF0+) la bandera se quita
	jr nc,quita_c602		;5886
	ld hl,0c605h		;5888   ; apunta a la cuenta de los refuerzos
	ld a,(hl)			;588b   ; mientras corre la cuenta de los refuerzos...
	or a			;588c
	jr z,L_589D		;588d
	inc hl			;588f
	ld a,(hl)			;5890   ; ...y la de 0xC606 no se acabe, sigue
	or a			;5891
	ret nz			;5892
	ld (0c605h),a		;5893   ; si no, la cuenta a cero y apunta la sala en 0xC604
	ld a,(0c130h)		;5896   ; lee la sala
	ld (0c604h),a		;5899
	ret			;589c
L_589D:
	ld a,(0c130h)		;589d   ; lee la sala
	ld hl,0c604h		;58a0
	cp (hl)			;58a3   ; si Snake ya no esta en esa sala, se quita
	jr nz,quita_c602		;58a4
	ld b,a			;58a6
	cp 0d8h		;58a7   ; en la sala 0xD8 los refuerzos son del tipo 0x0B
	ld a,00bh		;58a9
	jr z,L_58C0		;58ab
	ld a,b			;58ad
	cp 0bch		;58ae   ; las salas 0xBC y siguientes la quitan
	jr nc,quita_c602		;58b0
	call tres_a		;58b2   ; tres_a: HL = 3 x A
	call bancos_4_5_6		;58b5   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0a445h		;58b8   ; p06:A445: el tipo de los refuerzos de la sala
	add hl,de			;58bb
	ld a,(hl)			;58bc
	call bancos_1_2_3		;58bd   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
L_58C0:
	call cuenta_tipo		;58c0   ; cuenta_tipo: A = cuantos actores del tipo A hay
	cp 010h		;58c3   ; con 16 de ese tipo (todos los huecos) se quita
	jr z,quita_c602		;58c5
	or a			;58c7   ; si queda alguno, sigue
	ret nz			;58c8
quita_c602:		; la bandera 0xC602 y 0xC603-0xC607 a cero y, si se juega, la musica de la sala
	ld hl,0c602h		;58c9   ; apunta a la bandera 0xC602 (refuerzos y musica)
	ld (hl),000h		;58cc   ; la bandera a cero...
	ld de,0c603h		;58ce   ; ...y 0xC603-0xC607 tambien (copia el cero en cadena)
	ldi		;58d1
	ldi		;58d3
	ldi		;58d5
	ldi		;58d7
	ldi		;58d9
	ld a,(0c002h)		;58db   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;58de   ; si se juega, la musica de la sala otra vez
	ret z			;58e0
	jp L_44F0		;58e1
reaparece_ya:		; 0xC605 = 1 y crea en IX el actor de p06:A445 de la sala
	ld a,001h		;58e4
	ld (0c605h),a		;58e6   ; guarda la cuenta de los refuerzos
reaparece:		; crea en IX el actor de p06:A445 de la sala (salas < 0xBC)
	ld a,(0c130h)		;58e9   ; lee la sala
	cp 0bch		;58ec   ; las salas 0xBC y siguientes no tienen refuerzos
	ret nc			;58ee
	call tres_a		;58ef   ; tres_a: HL = 3 x A
	call bancos_4_5_6		;58f2   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld de,0a445h		;58f5   ; p06:A445: el tipo de los refuerzos de la sala
	add hl,de			;58f8
	ld a,(hl)			;58f9
	call bancos_1_2_3		;58fa   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
pon_tipo:		; pone el tipo A en IX y lo prepara (p03:B3F8, p02:8334, p03:A923, colores)
	ld (ix+000h),a		;58fd   ; guarda el tipo del actor
	ld (ix+001h),000h		;5900   ; el paso 0
	call 0b3f8h		;5904   ; p03:B3F8: quieto
	ld (ix+006h),001h		;5907   ; se mueve
	ld (ix+012h),001h		;590b   ; la cuenta de espera del actor = 0x01
	ld (ix+00eh),003h		;590f   ; con que choca el actor (bit 0 Snake, bit 1 proyectiles) = 0x03
	res 0,(ix+003h)		;5913   ; la Y y la X pares
	res 0,(ix+005h)		;5917   ; pone a cero el bit 0 de la X del actor
	call 08334h		;591b   ; p02:8334: mirando hacia Snake
	ld (ix+011h),a		;591e   ; guarda la direccion del actor
	call 0a923h		;5921   ; p03:A923: el cuadro de esa direccion
	jp colores_del_actor		;5924   ; colores_del_actor: copia los colores del tipo (ix+0) (p05:975A) a la ficha, uno cada 5 bytes desde (ix+0x25)
tres_a:		; HL = 3 x A
	ld l,a			;5927
	ld h,000h		;5928   ; HL = A...
	ld e,a			;592a
	ld d,h			;592b
	add hl,hl			;592c   ; ...x 3
	add hl,de			;592d
	ret			;592e
punto_siguiente:		; el punto de DE como el siguiente del camino
	call bancos_4_5_6		;592f   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	jp L_59F5		;5932   ; el punto siguiente del camino de DE
crea_tipo_30:		; la creacion del tipo 30
	ld b,008h		;5935   ; la marcha 8: 1,5 puntos por cuadro (0x5A5E)
	jr L_593F		;5937
crea_tipo_5:		; la creacion del tipo 5
	ld b,004h		;5939   ; la marcha 4: 1,25
	jr L_593F		;593b
crea_tipo_4:		; la creacion del tipo 4
	ld b,000h		;593d   ; la marcha 0: 1
L_593F:
	ld (ix+043h),b		;593f   ; guarda la marcha del actor (0, 4 u 8)
	ld b,000h		;5942   ; B = 0
	ld a,(0c130h)		;5944   ; lee la sala
	cp 01ah		;5947   ; en las salas 0x1A, 0x55 y 0x8A...
	jr z,L_5953		;5949
	cp 055h		;594b
	jr z,L_5953		;594d
	cp 08ah		;594f
	jr nz,L_5954		;5951
L_5953:
	inc b			;5953   ; ...0xC633 = 1: los guardias se duermen
L_5954:
	ld a,b			;5954
	ld (0c633h),a		;5955
	ld a,r		;5958   ; la espera hasta dormirse: 5 o 0x40 al azar
	and 001h		;595a
	ld a,005h		;595c
	jr z,L_5962		;595e
	ld a,040h		;5960
L_5962:
	ld (ix+044h),a		;5962
	call elige_camino		;5965   ; elige_camino: elige un camino de la sala para IX (por los actores que hay) y lo carga
	jp 09d98h		;5968   ; p02:9D98: el cuadro por la direccion
elige_camino:		; elige un camino de la sala para IX (por los actores que hay) y lo carga
	inc (ix+006h)		;596b   ; se mueve
	ld a,004h		;596e   ; el numero de camino: cuantos actores hay de los tipos 4, 6, 0x30, 5 y 0x1E
	call cuenta_tipo		;5970   ; cuenta_tipo: A = cuantos actores del tipo A hay
	ld b,a			;5973
	push bc			;5974
	ld a,006h		;5975
	call cuenta_tipo		;5977   ; cuenta_tipo: A = cuantos actores del tipo A hay
	pop bc			;597a
	add a,b			;597b
	ld b,a			;597c
	ld a,030h		;597d
	push bc			;597f
	call cuenta_tipo		;5980   ; cuenta_tipo: A = cuantos actores del tipo A hay
	pop bc			;5983
	add a,b			;5984
	ld b,a			;5985
	ld a,005h		;5986
	push bc			;5988
	call cuenta_tipo		;5989   ; cuenta_tipo: A = cuantos actores del tipo A hay
	pop bc			;598c
	add a,b			;598d
	ld b,a			;598e
	ld a,01eh		;598f
	push bc			;5991
	call cuenta_tipo		;5992   ; cuenta_tipo: A = cuantos actores del tipo A hay
	pop bc			;5995
	add a,b			;5996
camino_b:		; el camino B de la sala (p06:A2DF) para IX, con los arreglos de algunas salas (p03:A10C-A17B)
	ld b,a			;5997   ; B = el camino (1-n)
	ld a,(0c133h)		;5998   ; D = el lado por el que entro Snake, E = la parada
	ld d,a			;599b
	ld a,(0c136h)		;599c   ; lee la parada del ascensor
	ld e,a			;599f
	ld a,(0c130h)		;59a0   ; lee la sala
	dec a			;59a3   ; los arreglos de las salas 1, 0x0D, 0x0F, 0x11, 0x12, 0x13, 0x16 y 0x23 (p03:A10C-A17B)
	call z,0a10ch		;59a4
	sub 00ch		;59a7
	call z,0a129h		;59a9
	sub 002h		;59ac
	call z,0a134h		;59ae
	sub 002h		;59b1
	call z,0a13fh		;59b3
	dec a			;59b6
	call z,0a14bh		;59b7
	dec a			;59ba
	call z,0a15dh		;59bb
	sub 003h		;59be
	call z,0a16dh		;59c0
	cp 00dh		;59c3
	call z,0a17bh		;59c5
	ld (ix+00bh),000h		;59c8   ; el cuadro 0
carga_camino:		; carga el camino B de la sala (p06:A2DF) en IX y va al primer punto
	ld (ix+014h),000h		;59cc   ; empieza por el punto 0
	call bancos_4_5_6		;59d0   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(0c130h)		;59d3   ; lee la sala
	ld l,a			;59d6
	ld h,000h		;59d7
	ld de,0a2dfh		;59d9   ; p06:A2DF: los caminos de cada sala
	add hl,hl			;59dc
	add hl,de			;59dd
	ld e,(hl)			;59de
	inc hl			;59df
	ld d,(hl)			;59e0
	ex de,hl			;59e1   ; HL = los caminos de la sala
	dec b			;59e2   ; el camino B - 1
	ld a,b			;59e3
	call hl_mas_2a		;59e4   ; hl_mas_2a: HL = HL + 2 x A
	ld e,(hl)			;59e7
	inc hl			;59e8
	ld d,(hl)			;59e9
	ld (ix+017h),e		;59ea   ; (ix+0x17, 0x18) = el camino
	ld (ix+018h),d		;59ed
	ld a,(de)			;59f0   ; [cuantos puntos] en (ix+0x13)
	ld (ix+013h),a		;59f1
	inc de			;59f4
L_59F5:
	ld a,(de)			;59f5   ; [Y] del punto en (ix+0x15)
	ld (ix+015h),a		;59f6
	inc de			;59f9
	ld a,(de)			;59fa   ; [X] en (ix+0x16)
	ld (ix+016h),a		;59fb
	ld (ix+019h),001h		;59fe   ; el sentido: hacia delante (+1) en (ix+0x19)
hacia_el_punto:		; direccion (ix+0x11) y velocidades hacia el punto (ix+0x15, ix+0x16) con la marcha (ix+0x43)
	ld a,(ix+003h)		;5a02   ; lee la Y del actor
	sub (ix+015h)		;5a05   ; Y - la Y del punto
	ld de,00000h		;5a08
	ld b,000h		;5a0b
	jr z,L_5A16		;5a0d   ; en la misma fila: sin velocidad Y
	ld e,002h		;5a0f   ; mas abajo: sube (2)
	jr nc,L_5A16		;5a11
	ld e,001h		;5a13   ; mas arriba: baja (1) y B = 1
	inc b			;5a15
L_5A16:
	ld a,(ix+005h)		;5a16   ; lee la X del actor
	sub (ix+016h)		;5a19   ; X - la X del punto
	ld c,000h		;5a1c
	jr z,L_5A29		;5a1e   ; en la misma columna: sin velocidad X
	ld d,002h		;5a20   ; a la derecha: hacia la izquierda (D = 2, C = 2)
	ld c,002h		;5a22
	jr nc,L_5A29		;5a24
	ld d,001h		;5a26   ; a la izquierda: hacia la derecha (D = 1, C = 3)
	inc c			;5a28
L_5A29:
	ld a,b			;5a29   ; la direccion del cuadro: 0 abajo, 1 arriba, 2 izquierda, 3 derecha
	or c			;5a2a
	ld (ix+011h),a		;5a2b   ; guarda la direccion del actor
	ld bc,00000h		;5a2e   ; la velocidad X: 0x5A5C + 2 x D + la marcha
	ld a,d			;5a31
	add a,a			;5a32
	jr z,L_5A41		;5a33
	add a,(ix+043h)		;5a35   ; le suma la marcha del actor (0, 4 u 8)
	ld hl,05a5ch		;5a38
	call hl_mas_a		;5a3b   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;5a3e
	inc hl			;5a3f
	ld b,(hl)			;5a40
L_5A41:
	ld hl,00000h		;5a41   ; la velocidad Y: 0x5A5C + 2 x E + la marcha
	ld a,e			;5a44
	ld d,b			;5a45   ; DE = la velocidad X
	ld e,c			;5a46
	add a,a			;5a47
	jr z,L_5A58		;5a48
	add a,(ix+043h)		;5a4a   ; le suma la marcha del actor (0, 4 u 8)
	ld hl,05a5ch		;5a4d
	call hl_mas_a		;5a50   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;5a53
	inc hl			;5a54
	ld b,(hl)			;5a55
	ld h,b			;5a56   ; HL = la velocidad Y
	ld l,c			;5a57
L_5A58:
	call bancos_1_2_3		;5a58   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	jp velocidades		;5a5b   ; velocidades: la velocidad X del actor = DE y la Y = HL

; ----------------------------------------------------------------------
; DATOS velocidades_5a5e: 6 palabras (+1, -1, +1,25, -1,25, +1,5 y -1,5 en
;   1/256) que p00:5A38 y p00:5A4D leen en 0x5A5C + 2 x d + (ix+0x43): la d (1
;   o 2) es el sentido y (ix+0x43) la marcha (0, 4 u 8, p00:5935-593D)
;   0x5a5e..0x5a6a  (12 bytes)
DATA_velocidades_5a5e:
	defw 00100h,0ff00h,00140h,0fec0h,00180h,0fe80h	; 5a5e

; ======================================================================
; CODIGO 0x5a6a..0x5b9e  (308 bytes)
; ======================================================================


punto_alcanzado:		; pone el actor en el punto, pasa al siguiente del camino y, a veces, se para
	call bancos_4_5_6		;5a6a   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld e,(ix+015h)		;5a6d   ; el actor queda justo en el punto
	ld d,(ix+016h)		;5a70
	xor a			;5a73
	ld (ix+003h),e		;5a74   ; guarda la Y del actor
	ld (ix+002h),a		;5a77
	ld (ix+005h),d		;5a7a   ; guarda la X del actor
	ld (ix+004h),a		;5a7d
	ld c,(ix+013h)		;5a80   ; C = cuantos puntos
	ld a,(ix+014h)		;5a83   ; el punto siguiente en el sentido (ix+0x19)
	add a,(ix+019h)		;5a86
	jr c,L_5A91		;5a89   ; hacia atras desde el 0: el ultimo
	cp c			;5a8b   ; hacia delante, tras el ultimo: el 0
	jr nz,L_5A93		;5a8c
	xor a			;5a8e
	jr L_5A93		;5a8f
L_5A91:
	ld a,c			;5a91
	dec a			;5a92
L_5A93:
	ld (ix+014h),a		;5a93
	ld e,(ix+017h)		;5a96   ; el camino...
	ld d,(ix+018h)		;5a99
	inc de			;5a9c   ; ...tras [cuantos], 2 bytes por punto
	ld a,(ix+014h)		;5a9d
	add a,a			;5aa0
	call de_mas_a		;5aa1   ; de_mas_a: DE = DE + A
	ld a,(de)			;5aa4
	ld (ix+015h),a		;5aa5   ; la Y del punto nuevo
	inc de			;5aa8
	ld a,(de)			;5aa9
	ld (ix+016h),a		;5aaa   ; la X
	call hacia_el_punto		;5aad   ; hacia_el_punto: direccion (ix+0x11) y velocidades hacia el punto (ix+0x15, ix+0x16) con la marcha (ix+0x43)
	ld a,(ix+000h)		;5ab0   ; los tipos 4, 5, 0x12 y 0x1E: a veces se paran
	sub 004h		;5ab3
	jr z,L_5AC4		;5ab5
	dec a			;5ab7
	jr z,L_5AC4		;5ab8
	dec a			;5aba
	jr z,L_5AF0		;5abb   ; el tipo 6: se para un rato al azar
	sub 00dh		;5abd
	jr z,L_5AC4		;5abf
	sub 00bh		;5ac1
	ret nz			;5ac3
L_5AC4:
	ld a,(ix+000h)		;5ac4   ; lee el tipo del actor
	cp 013h		;5ac7   ; el tipo 0x13 no se para en el punto 1
	call z,sigue_si_punto_1		;5ac9   ; sigue_si_punto_1: si (ix+0x14) no es 1 vuelve; si es 1, sale tambien de quien llamo
	ld a,r		;5acc   ; la mitad de las veces sigue
	rra			;5ace
	ret nc			;5acf
	pop hl			;5ad0   ; si se para, sale tambien de quien llamo
	dec (ix+006h)		;5ad1   ; baja si el actor se mueve (p01:7336)
	ld (ix+012h),010h		;5ad4   ; la cuenta de espera del actor = 0x10
	ld (ix+040h),001h		;5ad8   ; (ix+0x40) = 1: mirando
	ld a,r		;5adc   ; mira a un lado al azar
	and 006h		;5ade
	add a,(ix+011h)		;5ae0   ; le suma la direccion del actor
	ld (ix+00bh),a		;5ae3   ; guarda el cuadro del actor
	jp bancos_1_2_3		;5ae6   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
sigue_si_punto_1:		; si (ix+0x14) no es 1 vuelve; si es 1, sale tambien de quien llamo
	ld a,(ix+014h)		;5ae9   ; el punto 1...
	dec a			;5aec
	ret nz			;5aed
	pop hl			;5aee   ; ...sale tambien de quien llamo
	ret			;5aef
L_5AF0:
	ld (ix+006h),000h		;5af0   ; si el actor se mueve (p01:7336) = 0x00
	ld a,r		;5af4   ; la espera: R / 2 (al menos 1)
	srl a		;5af6
	jr nz,L_5AFB		;5af8
	inc a			;5afa
L_5AFB:
	ld (ix+012h),a		;5afb   ; guarda la cuenta de espera del actor
	jp bancos_1_2_3		;5afe   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
camino_al_azar:		; elige un camino al azar de la sala (p06:A2DF) para IX
	call bancos_4_5_6		;5b01   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,030h		;5b04   ; el numero del centinela entre los del tipo 0x30...
	call cuenta_tipo		;5b06   ; cuenta_tipo: A = cuantos actores del tipo A hay
	ld (ix+00fh),a		;5b09   ; guarda el numero del actor entre los de su tipo
	ld b,a			;5b0c
	ld a,(0c130h)		;5b0d   ; lee la sala
	ld l,a			;5b10
	ld h,000h		;5b11
	ld de,0a2dfh		;5b13   ; ...elige su camino en p06:A2DF
	add hl,hl			;5b16
	add hl,de			;5b17
	ld e,(hl)			;5b18
	inc hl			;5b19
	ld d,(hl)			;5b1a
	ex de,hl			;5b1b
	dec b			;5b1c
	ld a,b			;5b1d
	call hl_mas_2a		;5b1e   ; hl_mas_2a: HL = HL + 2 x A
	ld e,(hl)			;5b21   ; DE = el camino
	inc hl			;5b22
	ld d,(hl)			;5b23
	ld a,(de)			;5b24
	inc de			;5b25
	ld (ix+013h),a		;5b26   ; [cuantos] direcciones
	ld (ix+05bh),e		;5b29   ; (ix+0x5B, 0x5C) = la direccion siguiente de la lista
	ld (ix+05ch),d		;5b2c
L_5B2F:
	ld a,(de)			;5b2f   ; la direccion...
	ld (ix+011h),a		;5b30   ; guarda la direccion del actor
	add a,008h		;5b33   ; ...el cuadro: 8 + direccion
	ld (ix+00bh),a		;5b35   ; guarda el cuadro del actor
	ld a,r		;5b38   ; (ix+0x5D): cuanto tarda en girar, al azar
	ld (ix+05dh),a		;5b3a
	jp bancos_1_2_3		;5b3d   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
L_5B40:
	call bancos_4_5_6		;5b40   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	jr L_5B2F		;5b43
sitio_de_snake:		; E = la Y de Snake, D = la X
	ld a,(0c182h)		;5b45   ; lee la Y de Snake
	ld e,a			;5b48
	ld a,(0c184h)		;5b49   ; lee la X de Snake
	ld d,a			;5b4c
	ret			;5b4d
velocidad_y:		; la velocidad Y del actor (ix+7, ix+8) = DE
	ld (ix+007h),e		;5b4e   ; guarda la velocidad Y del actor
	ld (ix+008h),d		;5b51   ; guarda la velocidad Y del actor (alta)
	ret			;5b54
suma_velocidad_x:		; la velocidad X del actor (ix+9, ix+0x0A) += DE
	ld l,(ix+009h)		;5b55   ; lee la velocidad X del actor
	ld h,(ix+00ah)		;5b58   ; lee la velocidad X del actor (alta)
	add hl,de			;5b5b
	ex de,hl			;5b5c
velocidad_x:		; la velocidad X del actor (ix+9, ix+0x0A) = DE
	ld (ix+009h),e		;5b5d   ; guarda la velocidad X del actor
	ld (ix+00ah),d		;5b60   ; guarda la velocidad X del actor (alta)
	ret			;5b63
velocidades:		; la velocidad X del actor = DE y la Y = HL
	call velocidad_x		;5b64   ; velocidad_x: la velocidad X del actor (ix+9, ix+0x0A) = DE
	ex de,hl			;5b67
	jr velocidad_y		;5b68
alterna_cuadro:		; si (ix+0x0C) AND B es 0, cambia el bit 0 del cuadro
	ld a,(ix+00ch)		;5b6a   ; lee la cuenta de cuadros del actor
	and b			;5b6d   ; solo en los cuadros con (ix+0x0C) AND B a cero
	ret nz			;5b6e
	ld a,001h		;5b6f
	xor (ix+00bh)		;5b71   ; XOR con el cuadro del actor
	ld (ix+00bh),a		;5b74   ; guarda el cuadro del actor
	ret			;5b77
cuadro_de_paso:		; si (ix+0x0C) AND B es 0, cuadro = 3 x direccion + paso (0x5B9E) + C
	ld a,(ix+00ch)		;5b78   ; lee la cuenta de cuadros del actor
	and b			;5b7b
	ret nz			;5b7c   ; solo en los cuadros con (ix+0x0C) AND B a cero
	ld a,(ix+011h)		;5b7d   ; lee la direccion del actor
	ld b,a			;5b80   ; B = 3 x direccion
	add a,a			;5b81
	add a,b			;5b82
	ld b,a			;5b83
	dec (ix+07fh)		;5b84   ; baja el paso de la animacion del actor (1-4)
	ld a,(ix+07fh)		;5b87   ; lee el paso de la animacion del actor (1-4)
	jr nz,L_5B91		;5b8a   ; el paso de la animacion baja de 4 a 1 y vuelve a 4
	ld a,004h		;5b8c
	ld (ix+07fh),a		;5b8e   ; guarda el paso de la animacion del actor (1-4)
L_5B91:
	ld hl,l5b9dh		;5b91   ; el desplazamiento del paso (0x5B9E)...
	call hl_mas_a		;5b94   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;5b97
	add a,b			;5b98   ; ...+ 3 x direccion + C
	add a,c			;5b99
	ld (ix+00bh),a		;5b9a   ; guarda el cuadro del actor
L_5B9D:
	ret			;5b9d

; ----------------------------------------------------------------------
; DATOS pasos_5b9e: 4 bytes (1, 2, 1, 0) que p00:5B91 lee en 0x5B9D +
;   (ix+0x7F) (1-4, baja uno por cuadro y vuelve a 4) y suma a B y C para
;   (ix+0x0B)
;   0x5b9e..0x5ba2  (4 bytes)
DATA_pasos_5b9e:
	defb 001h,002h,001h,000h	; 5b9e

; ======================================================================
; CODIGO 0x5ba2..0x5c1d  (123 bytes)
; ======================================================================


paso_siguiente:		; sube el paso del actor (ix+1)
	inc (ix+001h)		;5ba2   ; sube el paso del actor
	ret			;5ba5
paso_cero:		; el paso del actor (ix+1) a cero
	ld (ix+001h),000h		;5ba6   ; el paso del actor = 0x00
	ret			;5baa
paso_a:		; el paso del actor (ix+1) = A
	ld (ix+001h),a		;5bab   ; guarda el paso del actor
	ret			;5bae
cuenta_tipo:		; A = cuantos actores del tipo A hay
	ld bc,01000h		;5baf   ; B = 16 huecos, C = 0
	ld hl,0d000h		;5bb2   ; apunta a los 16 actores (fichas de 0x80)
	ld de,00080h		;5bb5
L_5BB8:
	cp (hl)			;5bb8   ; el tipo de este hueco
	jr nz,L_5BBC		;5bb9
	inc c			;5bbb   ; uno mas
L_5BBC:
	add hl,de			;5bbc   ; el hueco siguiente
	djnz L_5BB8		;5bbd
	ld a,c			;5bbf   ; A = cuantos
	ret			;5bc0
colores_a_cero:		; escribe A y C alternos cada 5 bytes desde (ix+0x25)
	xor a			;5bc1   ; A = C = 0: transparentes
	ld c,a			;5bc2
L_5BC3:
	push ix		;5bc3
	pop hl			;5bc5
	set 5,l		;5bc6   ; +0x20: cuantos sprites
	ld b,a			;5bc8
	ld a,(hl)			;5bc9
	or a			;5bca
	ret z			;5bcb   ; sin sprites, nada
	ld a,b			;5bcc
	ld b,(hl)			;5bcd
	rrc b		;5bce   ; B = cuantos / 2 (dos colores por vuelta)
	inc l			;5bd0   ; +0x25: el color del primer sprite
	inc l			;5bd1
	inc l			;5bd2
	inc l			;5bd3
	inc l			;5bd4
	ld de,00005h		;5bd5
L_5BD8:
	ld (hl),a			;5bd8   ; A al sprite par...
	add hl,de			;5bd9
	ld (hl),c			;5bda   ; ...C al impar
	add hl,de			;5bdb
	djnz L_5BD8		;5bdc
	ret			;5bde
pareja_del_angulo:		; C y B = los bytes (ix+0x14) y 63 - (ix+0x14) de la tabla p06:A6B9
	ld a,(ix+014h)		;5bdf
pareja_a:		; C y B = los bytes A y 63 - A (A de 0 a 63) de la tabla p06:A6B9
	call bancos_4_5_6		;5be2   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	and 03fh		;5be5   ; el angulo 0-63
	ld e,a			;5be7
	ld d,000h		;5be8
	sub 03fh		;5bea   ; 63 - angulo
	neg		;5bec
	ld hl,0a6b9h		;5bee   ; p06:A6B9: 64 valores
	push hl			;5bf1
	add hl,de			;5bf2
	ld c,(hl)			;5bf3   ; C = tabla[angulo]
	pop hl			;5bf4
	ld e,a			;5bf5
	add hl,de			;5bf6
	ld b,(hl)			;5bf7   ; B = tabla[63 - angulo]
	jp bancos_1_2_3		;5bf8   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
de_negado:		; DE = -DE
	ex de,hl			;5bfb
	call hl_negado		;5bfc   ; hl_negado: HL = -HL
	ex de,hl			;5bff
	ret			;5c00
hl_negado:		; HL = -HL
	xor a			;5c01
	sub l			;5c02   ; L = 0 - L
	ld l,a			;5c03
	ld a,000h		;5c04
	sbc a,h			;5c06   ; H = 0 - H - acarreo
	ld h,a			;5c07
	ret			;5c08
ficha_en_el_punto:		; HL = 0xE000 + (L / 8) x 32 + H / 8: la ficha de la sala montada en ese punto
	ld a,l			;5c09   ; la Y / 8 (la fila)...
	rra			;5c0a
	rra			;5c0b
	rra			;5c0c
	rra			;5c0d
	rr h		;5c0e   ; ...por 32, junto con...
	rra			;5c10
	rr h		;5c11
	rra			;5c13
	rr h		;5c14
	ld l,h			;5c16   ; ...la X / 8 (la columna)
	and 003h		;5c17   ; los dos bits altos de la fila...
	add a,0e0h		;5c19   ; ...+ 0xE0: la sala montada
	ld h,a			;5c1b
	ret			;5c1c

; ----------------------------------------------------------------------
; DATOS rotulo_pause: rotulo con posicion ([X 0x6C][Y 0x58] "PAUSE" 0xFF) que
;   p01:67CA escribe con L_510C
;   0x5c1d..0x5c25  (8 bytes)
DATA_rotulo_pause:
	defb 06ch,058h,050h,041h,055h,053h,045h,0ffh	; 5c1d  lXPAUSE.

; ======================================================================
; CODIGO 0x5c25..0x5d1d  (248 bytes)
; ======================================================================


hacia_snake:		; HL y DE = la velocidad de IX hacia Snake con el modulo 0x80 (+ 8 x 0xC152)
	ld a,080h		;5c25
hacia_snake_a:		; HL y DE = la velocidad de IX hacia Snake con el modulo A (+ 8 x 0xC152)
	ld e,(ix+003h)		;5c27   ; lee la Y del actor
	ld d,(ix+005h)		;5c2a   ; lee la X del actor
	ld c,a			;5c2d   ; C = el modulo de la velocidad
	ld a,(0c152h)		;5c2e   ; + 8 x 0xC152
	add a,a			;5c31
	add a,a			;5c32
	add a,a			;5c33
	add a,c			;5c34
	ld (0ec80h),a		;5c35
	call angulo_a_snake		;5c38   ; angulo_a_snake: 0xEC86 = el angulo de (E, D) a Snake (p06:A679) y los signos en 0xEC81/0xEC82
	ld a,(0ec86h)		;5c3b   ; el angulo hacia Snake (0-63)
	ld e,a			;5c3e
	ld d,000h		;5c3f
	ld a,e			;5c41   ; 63 - angulo
	sub 03fh		;5c42
	neg		;5c44
	ld hl,0a6b9h		;5c46   ; p06:A6B9: 64 valores
	call bancos_4_5_6		;5c49   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	push hl			;5c4c
	add hl,de			;5c4d
	ld c,(hl)			;5c4e   ; C = tabla[angulo]
	pop hl			;5c4f
	ld e,a			;5c50
	add hl,de			;5c51
	ld a,(hl)			;5c52   ; y tabla[63 - angulo]
	ld (0ec85h),a		;5c53
	call bancos_1_2_3		;5c56   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
	ld e,c			;5c59   ; la velocidad Y, a escala del modulo
	call escala		;5c5a   ; escala: DE = E x (0xEC80) / 32
	ld a,(0ec81h)		;5c5d   ; Snake por encima: negativa
	and a			;5c60
	call nz,de_negado		;5c61   ; de_negado: DE = -DE
	ld (0ec83h),de		;5c64
	ld a,(0ec85h)		;5c68   ; la velocidad X, a escala del modulo
	ld e,a			;5c6b
	call escala		;5c6c   ; escala: DE = E x (0xEC80) / 32
	ld a,(0ec82h)		;5c6f   ; Snake a la izquierda: negativa
	and a			;5c72
	call nz,de_negado		;5c73   ; de_negado: DE = -DE
	ld hl,(0ec83h)		;5c76   ; HL = la velocidad Y, DE = la X
	ret			;5c79
angulo_a_snake:		; 0xEC86 = el angulo de (E, D) a Snake (p06:A679) y los signos en 0xEC81/0xEC82
	ld a,(0c182h)		;5c7a   ; lee la Y de Snake
	ld (0ec00h),a		;5c7d   ; guarda la casilla de trabajo 0xEC00
	ld a,(0c184h)		;5c80   ; lee la X de Snake
	ld (0ec01h),a		;5c83
	ld hl,0ec81h		;5c86   ; 0xEC81: el signo de la Y
	ld (hl),000h		;5c89
	ld a,(0ec00h)		;5c8b   ; la Y de Snake - la Y
	sub e			;5c8e
	jr nc,L_5C94		;5c8f
	neg		;5c91   ; por encima: positiva y el signo a 1
	inc (hl)			;5c93
L_5C94:
	inc hl			;5c94
	ld (hl),000h		;5c95   ; 0xEC82: el signo de la X
	rra			;5c97   ; los 3 bits altos de |dy|, por 8
	rra			;5c98
	and 038h		;5c99
	ld e,a			;5c9b
	ld a,(0ec01h)		;5c9c   ; la X de Snake - la X
	sub d			;5c9f
	jr nc,L_5CA5		;5ca0
	neg		;5ca2   ; a la izquierda: positiva y el signo a 1
	inc (hl)			;5ca4
L_5CA5:
	rlca			;5ca5   ; los 3 bits altos de |dx|
	rlca			;5ca6
	rlca			;5ca7
	and 007h		;5ca8
	add a,e			;5caa   ; el indice: 8 x |dy| + |dx| (de 32 en 32 puntos)
	ld hl,0a679h		;5cab   ; p06:A679: el angulo de cada pareja
	call hl_mas_a		;5cae   ; hl_mas_a: HL = HL + A
	call bancos_4_5_6		;5cb1   ; bancos_4_5_6: pone los bancos 4, 5 y 6 (y sus copias en 0xF0F1-0xF0F3)
	ld a,(hl)			;5cb4
	ld (0ec86h),a		;5cb5
	jp bancos_1_2_3		;5cb8   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xF0F1-0xF0F3)
escala:		; DE = E x (0xEC80) / 32
	ld a,(0ec80h)		;5cbb
	ld h,a			;5cbe   ; H = el modulo
	call multiplica		;5cbf   ; multiplica: HL = H x E
	xor a			;5cc2   ; HL x 8...
	add hl,hl			;5cc3
	adc a,a			;5cc4
	add hl,hl			;5cc5
	adc a,a			;5cc6
	add hl,hl			;5cc7
	adc a,a			;5cc8
	ld l,h			;5cc9   ; ...y se queda con los 16 bits altos: / 32
	ld h,a			;5cca
	ex de,hl			;5ccb
	ret			;5ccc
multiplica:		; HL = H x E
	ld b,008h		;5ccd   ; 8 bits
	ld l,000h		;5ccf
	ld d,l			;5cd1   ; DE = E
L_5CD2:
	add hl,hl			;5cd2   ; desplaza y suma
	jr nc,L_5CD6		;5cd3
	add hl,de			;5cd5
L_5CD6:
	djnz L_5CD2		;5cd6
	ret			;5cd8
ventana_de_texto_2:		; abre la ventana del texto A en el modo 2 (0xCEE0)
	ld c,002h		;5cd9
	jr L_5CE3		;5cdb
ventana_de_texto_1:		; abre la ventana del texto A en el modo 1 (0xCEE0)
	ld c,001h		;5cdd
	jr L_5CE3		;5cdf
ventana_de_texto:		; abre la ventana del texto A en el modo 0: 0xCEF0 = A, guarda 0xC151 en 0xCEF1 y pone 0xC151 = 10
	ld c,000h		;5ce1
L_5CE3:
	ld (0cef0h),a		;5ce3   ; guarda el texto de la ventana
	ld a,c			;5ce6   ; el modo de la ventana
	ld (0cee0h),a		;5ce7
	ld hl,0cef1h		;5cea   ; 0xCEF1-0xCF0F a cero
	ld de,0cef2h		;5ced   ; apunta a el paso de la ventana de texto
	ld bc,0001eh		;5cf0
	ld (hl),000h		;5cf3
	ldir		;5cf5
	ld a,(0c151h)		;5cf7   ; guarda el modo de la partida en 0xCEF1
	ld (0cef1h),a		;5cfa
	ld a,00ah		;5cfd   ; el modo 10: la ventana de texto
	ld (0c151h),a		;5cff   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ret			;5d02
ventana_paso:		; un paso de la ventana de texto (0xCEF2, tabla 0x5D1D)
	ld a,(0cef1h)		;5d03
	cp 004h		;5d06   ; desde el transceptor (modo 4)...
	jr nz,L_5D17		;5d08
	ld a,(0c112h)		;5d0a   ; lee las teclas de funcion nuevas (F1 1, F2 2, F3 4, F4 8, F5 0x10)
	and 008h		;5d0d   ; ...F4 corta el texto
	jr z,L_5D17		;5d0f
	call ventana_vuelve		;5d11   ; ventana_vuelve: devuelve el modo 0xCEF1 a 0xC151 y marca 0xC661/0xC663/0xC662 con los textos 0x75/0x76/0x8A
	jp 06bb1h		;5d14   ; p01:6BB1: sale del transceptor
L_5D17:
	ld a,(0cef2h)		;5d17   ; lee el paso de la ventana de texto
	call despacha		;5d1a   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_5D1D: 6 destinos del despachador p00:41EA (call en p00:5D1A, el
;   indice en A): 5D29, 5D83, 5D99, 5E6B, 5EC1, 5EE9; lo leen p00:5D1A (12
;   bytes)
;   0x5d1d..0x5d29  (12 bytes)
DATA_tabla_5D1D:
	defw 05d29h,05d83h,05d99h,05e6bh,05ec1h,05ee9h	; 5d1d

; ======================================================================
; CODIGO 0x5d29..0x5f4c  (547 bytes)
; ======================================================================


ventana_prepara:		; paso 0: tipo de ventana (0xCEF5), marco, recuadro y el fondo guardado en la pagina 1
	call empieza_texto		;5d29   ; empieza_texto: 0xCEF3 = el texto 0xCEF0 (p12:A37D) y 0xCEF5 = su primer byte (el tipo de ventana)
	and 00fh		;5d2c   ; el tipo de ventana (0-4)
	add a,a			;5d2e   ; C = 2 x tipo
	ld c,a			;5d2f
	add a,a			;5d30   ; A = 4 x tipo
	push af			;5d31
	push bc			;5d32
	ld hl,05f4ch		;5d33   ; 0x5F4C + 8 x tipo: los 8 bytes de la ventana...
	call hl_mas_2a		;5d36   ; hl_mas_2a: HL = HL + 2 x A
	ld de,0c528h		;5d39   ; ...a 0xC528
	ld bc,00008h		;5d3c
	ldir		;5d3f
	pop bc			;5d41
	pop af			;5d42
	add a,c			;5d43   ; A = 6 x tipo
	ld hl,05f74h		;5d44   ; 0x5F74 + 6 x tipo: el marco
	call hl_mas_a		;5d47   ; hl_mas_a: HL = HL + A
	call cuatro_bytes		;5d4a   ; cuatro_bytes: E, D, C y B = los 4 bytes de HL
	ld (0cef6h),de		;5d4d   ; 0xCEF6 = [X][Y] del texto, 0xCEF8 = [ancho][alto]
	ld (0cef8h),bc		;5d51
	inc hl			;5d55   ; 0xCF00 = donde va el cursor
	ld e,(hl)			;5d56
	inc hl			;5d57
	ld d,(hl)			;5d58
	ld (0cf00h),de		;5d59
	ld a,(0cef0h)		;5d5d   ; lee el texto de la ventana
	cp 002h		;5d60   ; el texto 2, desde el transceptor o el estado 8 de Snake...
	jr z,ventana_paso_siguiente		;5d62
	ld a,(0cef1h)		;5d64   ; ...no guardan el fondo
	cp 004h		;5d67
	jr z,ventana_paso_siguiente		;5d69
	ld a,(0c180h)		;5d6b   ; lee el estado de Snake
	cp 008h		;5d6e
	jr z,ventana_paso_siguiente		;5d70
	call recuadro_de_ventana		;5d72   ; recuadro_de_ventana: E D C B = el recuadro del tipo de ventana (0x5F92)
	ex de,hl			;5d75   ; el recuadro de la ventana...
	ld de,000a0h		;5d76   ; ...se guarda en (0, 0xA0) de la pagina 1
	ld a,004h		;5d79   ; de la pagina 0 a la 1
	call copia_vram		;5d7b   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
ventana_paso_siguiente:		; sube el paso de la ventana de texto 0xCEF2
	ld hl,0cef2h		;5d7e   ; apunta a el paso de la ventana de texto
	inc (hl)			;5d81
	ret			;5d82
ventana_abre:		; paso 1: espera a p02:8240 y salta al paso 4
	call 08240h		;5d83   ; p02:8240: el recuadro crece; acarreo al acabar
	ret nc			;5d86
	ld hl,(0cef3h)		;5d87   ; lee por donde va el texto y el byte siguiente (16 bits)
	inc hl			;5d8a   ; salta el tipo de ventana
	ld (0cef3h),hl		;5d8b   ; guarda por donde va el texto y el byte siguiente (16 bits)
	ld a,004h		;5d8e   ; al paso 4: el primer trozo
	ld (0cef2h),a		;5d90   ; guarda el paso de la ventana de texto
	ld a,001h		;5d93   ; 0xCEFA = 1: hay texto
	ld (0cefah),a		;5d95
	ret			;5d98
ventana_escribe:		; paso 2: escribe una letra cada 4 (u 8) cuadros con el sonido 0x23
	ld a,(0cee0h)		;5d99   ; en los modos 1 y 2 no se corta con teclas
	dec a			;5d9c
	jr z,L_5DB2		;5d9d
	dec a			;5d9f
	jr z,L_5DB2		;5da0
	ld a,(0c006h)		;5da2   ; la tecla 0x20 nueva...
	and 020h		;5da5
	jp nz,L_5E5E		;5da7
	ld a,(0c112h)		;5daa   ; ...o RETURN cortan el texto
	and 020h		;5dad
	jp nz,L_5E5E		;5daf
L_5DB2:
	ld a,(0cef0h)		;5db2   ; lee el texto de la ventana
	cp 02dh		;5db5   ; el texto 0x2D va mas despacio:
	ld c,003h		;5db7   ; una letra cada 4 cuadros...
	jr nz,L_5DBD		;5db9
	ld c,007h		;5dbb   ; ...o cada 8
L_5DBD:
	ld a,(0c003h)		;5dbd   ; lee la cuenta de cuadros
	and c			;5dc0
	ret nz			;5dc1
	ld hl,(0cefeh)		;5dc2   ; HL = por donde va, DE = donde escribe
	ld de,(0cefch)		;5dc5
L_5DC9:
	ld a,(hl)			;5dc9   ; 0xFF: acaba el trozo
	inc a			;5dca
	jp z,L_5E42		;5dcb
	inc a			;5dce   ; 0xFE: linea nueva
	jp z,L_5E4D		;5dcf
	ld a,(0cef7h)		;5dd2   ; la X maxima: X + ancho - 8
	ld b,a			;5dd5
	ld a,(0cef9h)		;5dd6
	add a,b			;5dd9
	sub 008h		;5dda
	cp d			;5ddc   ; si se pasa, linea nueva
	jr c,L_5E4E		;5ddd
	ld a,(hl)			;5ddf
	push af			;5de0
	ld c,001h		;5de1   ; la letra en el color de verdad
	call caracter		;5de3   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
	pop af			;5de6
	push af			;5de7
	ld b,008h		;5de8   ; 8 puntos a la derecha (4 con 0x97 y 0x98)
	cp 097h		;5dea
	jr z,L_5DF2		;5dec
	sub 098h		;5dee
	jr nz,L_5DF4		;5df0
L_5DF2:
	ld b,004h		;5df2
L_5DF4:
	pop af			;5df4
	and a			;5df5   ; el blanco no suena
	jr z,L_5E02		;5df6
	ld a,(0c922h)		;5df8   ; con 0xC922 = 0x0A (el final) tampoco
	cp 00ah		;5dfb
	ld a,023h		;5dfd   ; el sonido 0x23 por letra
	call nz,sonido		;5dff   ; sonido: pide el sonido A al controlador del banco 4 (0x67FD) con los bancos 4 y 5
L_5E02:
	ld a,d			;5e02   ; la X siguiente
	add a,b			;5e03
	ld d,a			;5e04
	inc hl			;5e05   ; guarda por donde va
	ld (0cefeh),hl		;5e06
	ld (0cefch),de		;5e09
	ld a,(0cef0h)		;5e0d   ; lee el texto de la ventana
	cp 00ah		;5e10   ; los textos 0x0A y 0x9B mueven la boca del retrato:
	jr z,L_5E17		;5e12
	cp 09bh		;5e14
	ret nz			;5e16
L_5E17:
	ld a,(0c003h)		;5e17   ; cada 4 cuadros, uno de los tres dibujos
	and 01ch		;5e1a
	ld hl,0b425h		;5e1c   ; p15:B425
	jr z,L_5E2B		;5e1f
	bit 2,a		;5e21
	ld hl,0b42bh		;5e23   ; p15:B42B
	jr nz,L_5E2B		;5e26
retrato_b41f:		; pone el retrato p15:B41F en la ventana (modo 4)
	ld hl,0b41fh		;5e28   ; p15:B41F: la boca cerrada
L_5E2B:
	ld a,(0cef1h)		;5e2b   ; solo en el transceptor (modo 4)...
	cp 004h		;5e2e
	ret nz			;5e30
	ld a,(0c922h)		;5e31   ; ...y no en el final
	cp 008h		;5e34
	ret nc			;5e36
	ld a,001h		;5e37   ; de la segunda mitad de la pagina 1
	ld (0c168h),a		;5e39
	ld de,0d030h		;5e3c   ; en (0xD0, 0x30)
	jp pone_dibujo_hl		;5e3f   ; pone_dibujo_hl: pone el dibujo de HL ([filas][columnas] y fichas) en (D, E), de la mitad de la pagina 1 que diga 0xC168
L_5E42:
	call retrato_b41f		;5e42   ; retrato_b41f: pone el retrato p15:B41F en la ventana (modo 4)
	ld a,060h		;5e45   ; 0x60 cuadros de espera al acabar el trozo
	ld (0cefbh),a		;5e47
	jp ventana_paso_siguiente		;5e4a   ; ventana_paso_siguiente: sube el paso de la ventana de texto 0xCEF2
L_5E4D:
	inc hl			;5e4d   ; salta el 0xFE
L_5E4E:
	ld a,(0cefch)		;5e4e   ; la linea siguiente, 0x0C mas abajo...
	add a,00ch		;5e51
	ld (0cefch),a		;5e53
	ld e,a			;5e56
	ld a,(0cef7h)		;5e57   ; ...desde la X del principio
	ld d,a			;5e5a
	jp L_5DC9		;5e5b
L_5E5E:
	ld a,001h		;5e5e   ; 0xCEE3 = 1: cortado con la tecla
	ld (0cee3h),a		;5e60
	call retrato_b41f		;5e63   ; retrato_b41f: pone el retrato p15:B41F en la ventana (modo 4)
	call ventana_paso_siguiente		;5e66   ; ventana_paso_siguiente: sube el paso de la ventana de texto 0xCEF2
	jr L_5E9F		;5e69
ventana_espera:		; paso 3: espera la tecla o la cuenta 0xCEFB y borra el recuadro
	ld a,(0cee0h)		;5e6b
	cp 002h		;5e6e   ; en el modo 2 no se espera la tecla
	jr z,L_5E9A		;5e70
	ld a,(0c006h)		;5e72   ; la tecla 0x20 nueva...
	and 020h		;5e75
	jr nz,L_5E9F		;5e77
	ld a,(0c112h)		;5e79   ; ...o RETURN: sigue
	and 020h		;5e7c
	jp nz,L_5E9F		;5e7e
	ld a,(0cee0h)		;5e81   ; en el modo 1 tampoco
	dec a			;5e84
	jr z,L_5E9A		;5e85
	ld a,(0cef0h)		;5e87   ; ni con el texto 0x0A
	cp 00ah		;5e8a
	jr z,L_5E9A		;5e8c
	ld a,(0cefah)		;5e8e   ; sin mas texto, espera
	and a			;5e91
	ret z			;5e92
	ld a,(0cef5h)		;5e93   ; los tipos de ventana con el nibble alto: el cursor parpadea
	and 0f0h		;5e96
	jr nz,L_5EAE		;5e98
L_5E9A:
	ld hl,0cefbh		;5e9a   ; la cuenta de 0xCEFB
	dec (hl)			;5e9d
	ret nz			;5e9e
L_5E9F:
	ld hl,(0cef6h)		;5e9f   ; borra el recuadro del texto...
	ld bc,(0cef8h)		;5ea2
	xor a			;5ea6   ; ...a negro
	ld d,a			;5ea7
	call rellena		;5ea8   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
	jp ventana_paso_siguiente		;5eab   ; ventana_paso_siguiente: sube el paso de la ventana de texto 0xCEF2
L_5EAE:
	ld a,(0c003h)		;5eae   ; cada 16 cuadros...
	bit 4,a		;5eb1
	ld c,000h		;5eb3   ; ...el cursor (0x3F) o el blanco
	jr z,L_5EB8		;5eb5
	inc c			;5eb7
L_5EB8:
	ld de,(0cf00h)		;5eb8   ; en 0xCF00
	ld a,03fh		;5ebc
	jp caracter		;5ebe   ; caracter: copia el caracter A de la pagina 1 a (D, E); con A = 0 o C = 0, el blanco
ventana_siguiente:		; paso 4: el trozo siguiente del texto a 0xCF10 (trozo_de_texto)
	ld a,(0cefah)		;5ec1
	and a			;5ec4   ; sin mas texto, al paso 5
	jp z,ventana_paso_siguiente		;5ec5   ; ventana_paso_siguiente: sube el paso de la ventana de texto 0xCEF2
	call trozo_de_texto		;5ec8   ; trozo_de_texto: copia el texto de 0xCEF3 a 0xCF10 con los trozos >= 0xA1 (p12:B8A7) puestos; A = 0 con 0xFF, 1 con 0xFD
	ld (0cefah),a		;5ecb   ; 0xCEFA = 1 si queda otro trozo
	inc hl			;5ece   ; detras del 0xFF o 0xFD
	ld (0cef3h),hl		;5ecf   ; guarda por donde va el texto y el byte siguiente (16 bits)
	ld a,002h		;5ed2   ; al paso 2: escribir
	ld (0cef2h),a		;5ed4   ; guarda el paso de la ventana de texto
	ld a,0ffh		;5ed7   ; el trozo copiado acaba en 0xFF
	ld (de),a			;5ed9
	ld hl,0cf10h		;5eda   ; apunta a el trozo de texto que se escribe
	ld (0cefeh),hl		;5edd   ; 0xCEFE = por donde va
	ld de,(0cef6h)		;5ee0   ; 0xCEFC = donde escribe: el principio
	ld (0cefch),de		;5ee4
	ret			;5ee8
ventana_cierra:		; paso 5: devuelve el fondo, 0xC151, y marca 0xC661/0xC663/0xC662 con los textos 0x75/0x76/0x8A
	call recuadro_de_ventana		;5ee9   ; recuadro_de_ventana: E D C B = el recuadro del tipo de ventana (0x5F92)
	ld a,(0cef0h)		;5eec   ; lee el texto de la ventana
	cp 002h		;5eef   ; el texto 2 y el transceptor no guardaron el fondo...
	jr z,L_5F0D		;5ef1
	ld a,(0cef1h)		;5ef3
	cp 004h		;5ef6
	jr z,L_5F0D		;5ef8
	ld a,(0c922h)		;5efa   ; ...ni el final (0xC922)
	and a			;5efd
	jr nz,L_5F0D		;5efe
	ld hl,000a0h		;5f00   ; devuelve el fondo de (0, 0xA0) de la pagina 1
	ld a,001h		;5f03   ; de la pagina 1 a la 0
	call copia_vram		;5f05   ; copia_vram: HMMM: copia B x C de (H, L) a (D, E); A = paginas (bits 0-1 origen, 2-3 destino)
	call 0a6fbh		;5f08   ; p03:A6FB: las trampas abiertas encima
	jr ventana_vuelve		;5f0b
L_5F0D:
	ex de,hl			;5f0d   ; si no, el recuadro a negro
	xor a			;5f0e
	ld d,a			;5f0f
	call rellena		;5f10   ; rellena: HMMV: llena B x C desde (H, L) de la pagina D con el byte A
ventana_vuelve:		; devuelve el modo 0xCEF1 a 0xC151 y marca 0xC661/0xC663/0xC662 con los textos 0x75/0x76/0x8A
	ld a,(0cef1h)		;5f13   ; el modo de antes de la ventana
	ld (0c151h),a		;5f16   ; guarda el modo de la partida (0 juego, 1 cambio de sala, 2 armas, 4 transceptor...)
	ld a,(0cee3h)		;5f19   ; si se corto con la tecla, sin marcas
	and a			;5f1c
	ret nz			;5f1d
	ld hl,0c661h		;5f1e
	ld a,(0cef0h)		;5f21   ; lee el texto de la ventana
	cp 075h		;5f24   ; el texto 0x75: 0xC661 (el arma 4 aparece)
	jr z,L_5F35		;5f26
	ld hl,0c663h		;5f28
	cp 076h		;5f2b   ; el texto 0x76: 0xC663 (la puerta de clase 13)
	jr z,L_5F35		;5f2d
	ld hl,0c662h		;5f2f
	cp 08ah		;5f32   ; el texto 0x8A: 0xC662
	ret nz			;5f34
L_5F35:
	ld (hl),001h		;5f35
	ret			;5f37
recuadro_de_ventana:		; E D C B = el recuadro del tipo de ventana (0x5F92)
	ld a,(0cef5h)		;5f38   ; lee el tipo de ventana de texto
	and 00fh		;5f3b   ; el tipo de ventana
	add a,a			;5f3d
	ld hl,05f92h		;5f3e   ; 0x5F92 + 4 x tipo
	call hl_mas_2a		;5f41   ; hl_mas_2a: HL = HL + 2 x A
cuatro_bytes:		; E, D, C y B = los 4 bytes de HL
	ld e,(hl)			;5f44   ; E = X, D = Y...
	inc hl			;5f45
	ld d,(hl)			;5f46
	inc hl			;5f47
	ld c,(hl)			;5f48   ; ...C = ancho, B = alto
	inc hl			;5f49
	ld b,(hl)			;5f4a
	ret			;5f4b

; ----------------------------------------------------------------------
; DATOS ventanas_de_texto: 5 fichas de 8 bytes, una por tipo de ventana
;   (nibble bajo de 0xCEF5, 0-4), que p00:5D33 copia a 0xC528 (0x5F4C + 8 x
;   tipo)
;   0x5f4c..0x5f74  (40 bytes)
DATA_ventanas_de_texto:
	defb 008h,01fh,0bch,001h,004h,002h,008h,00eh	; 5f4c  ........
	defb 013h,01ah,078h,001h,004h,004h,010h,00eh	; 5f54  ..x.....
	defb 01eh,022h,094h,001h,002h,004h,010h,00eh	; 5f5c  ."......
	defb 021h,094h,080h,001h,003h,001h,003h,00eh	; 5f64  !.......
	defb 00ch,01ah,078h,001h,006h,004h,010h,00eh	; 5f6c  ..x.....

; ----------------------------------------------------------------------
; DATOS marcos_de_texto: 5 fichas de 6 bytes, una por tipo de ventana:
;   [e][d][c][b] (p00:5F44 -> 0xCEF6/0xCEF8) y una palabra (p00:5D55 ->
;   0xCF00); p00:5D44 lee 0x5F74 + 6 x tipo
;   0x5f74..0x5f92  (30 bytes)
DATA_marcos_de_texto:
	defb 01ch,0a4h,008h,038h,01ch,0d4h	; 5f74
	defb 00ch,034h,020h,098h,024h,0c4h	; 5f7a
	defb 008h,05ch,038h,080h,038h,0d4h	; 5f80
	defb 078h,024h,038h,0b8h,0a8h,0d4h	; 5f86
	defb 012h,038h,014h,088h,01eh,0b8h	; 5f8c

; ----------------------------------------------------------------------
; DATOS recuadros_de_texto: 5 fichas de 4 bytes [e][d][c][b], una por tipo de
;   ventana, que p00:5F3E lee en 0x5F92 + 4 x tipo y pasa a L_4FCD (el
;   recuadro que se borra)
;   0x5f92..0x5fa6  (20 bytes)
DATA_recuadros_de_texto:
	defb 018h,0a0h,011h,040h	; 5f92
	defb 008h,030h,029h,0a0h	; 5f96
	defb 004h,058h,040h,088h	; 5f9a
	defb 074h,020h,048h,0c8h	; 5f9e
	defb 008h,030h,029h,0a0h	; 5fa2

; ======================================================================
; CODIGO 0x5fa6..0x5ffe  (88 bytes)
; ======================================================================


snake_al_empezar:		; Snake al empezar: paleta, pose, direccion, y con 0xC002 bit 6 la pose 0x25 en (0xB8, 0xC0)
	call paleta_de_snake		;5fa6   ; paleta_de_snake: manda al VDP los colores 7 y 10 (0x4AA3)
	ld a,018h		;5fa9   ; LIFE: 0x18...
	ld (0c131h),a		;5fab   ; guarda la vida (LIFE)
	ld (0c137h),a		;5fae   ; ...de 0x18
	xor a			;5fb1   ; CLASS 0
	ld (0c132h),a		;5fb2   ; guarda la CLASS (0-3 estrellas)
	ld (0c18fh),a		;5fb5
	ld (0c18bh),a		;5fb8   ; guarda el modo de la pose de Snake
	ld (0c180h),a		;5fbb   ; guarda el estado de Snake
	inc a			;5fbe   ; 0xC18E = 1: quieto
	ld (0c18eh),a		;5fbf
	inc a			;5fc2   ; mirando abajo
	ld (0c185h),a		;5fc3   ; guarda la direccion de Snake (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	inc a			;5fc6   ; la pose 3
	ld (0c18ah),a		;5fc7   ; guarda la pose de Snake
	ld hl,00200h		;5fca   ; el modulo de la velocidad: 2 puntos por cuadro
	ld (0c143h),hl		;5fcd   ; guarda el modulo de la velocidad de Snake y el byte siguiente (16 bits)
	ld a,(0c002h)		;5fd0   ; lee las banderas del juego (bit 6: se juega; en la demo no)
	bit 6,a		;5fd3
	ret z			;5fd5   ; en la demo, nada mas
	ld a,004h		;5fd6   ; jugando: la llegada (pose 4, estado 8, pose 0x25)
	ld (0c18bh),a		;5fd8   ; guarda el modo de la pose de Snake
	rlca			;5fdb
	ld (0c180h),a		;5fdc   ; guarda el estado de Snake
	ld a,025h		;5fdf
	ld (0c18ah),a		;5fe1   ; guarda la pose de Snake
	ld hl,0b800h		;5fe4   ; en (0xB8, 0xC0)
	ld (0c181h),hl		;5fe7   ; guarda la Y de Snake (16 bits)
	ld h,0c0h		;5fea
	ld (0c183h),hl		;5fec   ; guarda la X de Snake (16 bits)
	ld hl,00100h		;5fef   ; a 1 punto por cuadro
	ld (0c143h),hl		;5ff2   ; guarda el modulo de la velocidad de Snake y el byte siguiente (16 bits)
	ld a,040h		;5ff5   ; 0xC921 = 0x40: la cuenta del paso de la llegada
	ld (0c921h),a		;5ff7
	ret			;5ffa
estado_de_snake:		; despacha por el estado de Snake (0xC180, tabla en p01:6001)
	ld a,(0c180h)		;5ffb   ; lee el estado de Snake

; ----------------------------------------------------------------------
; DATOS call_partido_al_despachador: los dos primeros bytes (CD EA) de `call
;   0x41EA`: el tercero (41) es el primer byte del banco 1, en 0x6000. Es el
;   despachador del estado del jugador (A = 0xC180, leido en p00:5FFB) y su
;   tabla de 9 destinos empieza en p01:6001. Ningun trazador de un solo banco
;   puede ver la instruccion entera: por eso va como datos
;   0x5ffe..0x6000  (2 bytes)
DATA_call_partido_al_despachador:
	defb 0cdh,0eah	; 5ffe
