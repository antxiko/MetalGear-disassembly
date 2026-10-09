# El cartucho

## La máquina

MSX2: el VDP es un V9938 y el juego trabaja en SCREEN 5 (256 × 212, 16
colores, `CHGMOD` en `p01:7C6C`). La página 0 de la VRAM es la pantalla y la
página 1 guarda las fichas, los dibujos de los objetos, la fuente y los
fondos que se tapan; casi todo se pinta copiando rectángulos de la página 1 a
la 0 con los comandos del VDP (`p00:4FCD` HMMM, `p00:5011` LMMM con TIMP,
`p00:4F91` HMMV).

## El mapper

MegaROM de 128 KB con el mapper Konami sin SCC: 16 bancos de 8 KB. El banco 0
está fijo en 0x4000; los otros tres se eligen escribiendo en 0x6000, 0x8000 y
0xA000. El banco 3k+1 va a 0x6000, el 3k+2 a 0x8000 y el 3k+3 a 0xA000, y se
ponen por tríos (`p00:4248` 1-2-3, `p00:424E` 4-5-6, `p00:426A` 7-8-9,
`p00:4270` 10-11-12, `p00:4276` 13-14-15), con su copia en 0xF0F1-0xF0F3.

El código de los bancos 6, 9, 12 y 15 corre en 0xA000 con el 1 y el 2 debajo:
son los **bancos de zona** (`p00:4913`-`4925`), y se apuntan en 0xF0F6. Para
llamar a una rutina que cambia de banco y volver con el suyo puesto usan los
**trampolines** de `p00:4050`-`4195`: cada uno hace `call` a la rutina y acaba
en `p00:4198`, que pone 1-2-3 y devuelve a 0xA000 el banco de 0xF0F6.

## La interrupción

`p00:41AC` cuelga de H.TIMI. Cada cuadro pone los bancos 4 y 5 y llama al
controlador de sonido (banco 4, 0x6000); después, si el cuadro anterior ya
acabó (0xC005), llama al juego del cuadro (`p01:6672`).

## El sonido

Cuatro canales de 0x20 bytes desde 0xC010 sobre el PSG (`p04:6000`). Hay 95
sonidos (índice `p04:6892`): por debajo de 0x29 son efectos en el cuarto
canal, de 0x29 a 0x5B músicas de tres canales y desde 0x5C de cuatro
(`p04:67FD`). Las listas tienen dos formatos y cinco instrumentos de 12 notas
(`p04:652B`).

## Los sprites

Modo 2 de sprites del V9938, 16 × 16. Hay dos tablas de atributos (0xF600 y
0xF200) que se alternan cada cuadro con R#5 (`p15:B8BC`), y el orden en que se
escriben los grupos de sprites cambia cada cuadro (`p15:B8DE`), para que con
más de ocho en una línea no desaparezca siempre el mismo.

## La RAM

| Dirección | Qué es |
|---|---|
| 0xC000 / 0xC001 | el estado del juego y su paso |
| 0xC002 | bit 6: se juega (en la demo no suena nada) |
| 0xC006 / 0xC007 | las teclas nuevas y las que hay |
| 0xC112 / 0xC113 | las teclas de función nuevas y las que hay |
| 0xC130 | la sala |
| 0xC131 / 0xC137 | la vida y su máximo |
| 0xC132 | la CLASS (0-3) |
| 0xC134 / 0xC135 | el arma y el objeto elegidos |
| 0xC138 | la frecuencia del transceptor (BCD) |
| 0xC151 | el modo de la partida |
| 0xC180 | el estado de Snake |
| 0xC181-0xC184 | la Y y la X de Snake (16 bits) |
| 0xC200 | los 6 proyectiles (fichas de 0x40) |
| 0xC500 / 0xC530 | las armas y los objetos que se llevan |
| 0xCA00 | la partida guardada (0x300 bytes) |
| 0xD000 | los 16 actores (fichas de 0x80) |
| 0xE000 | la sala montada (32 × 24 fichas) |
| 0xEA00 | la copia de los atributos de los sprites |
