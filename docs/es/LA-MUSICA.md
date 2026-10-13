# La música

Todo lo que suena aquí sale de ejecutar el motor de sonido del cartucho (`sonido_del_cuadro`, p04:6000, y `pide_sonido`, p04:67FD, que apunta la pista; la interrupción lo llama en p00:41B9 con los bancos 4 y 5) en un Z80 emulado, cuadro a cuadro y a 60 por segundo, igual que lo llama el juego. Lo que el motor escribe en el PSG pasa a sonido con un AY-3-8910 (`tools/musica.py`). Cada MP3 es la pieza entera hasta donde vuelve a empezar, más 8 segundos de la vuelta apagándose; las que no se repiten acaban donde acaba el motor.

## Cotejado con openMSX

Las escrituras al PSG se han comparado cuadro a cuadro con las de openMSX (C-BIOS MSX2 japonés). En todos los cuadros el PSG queda igual:

- la música 0x2F, sus primeros 116 cuadros;
- la música 0x3B, sus primeros 116 cuadros.

El timbre no está cotejado: es el de un AY-3-8910 de manual, no una grabación del emulador. Las sondas están en `tools/omsx_psg.tcl` y `tools/coteja_psg.py`.

## Cómo se pide una pieza

`sonido` (p00:4284) mete los bancos 4 y 5 y llama a `pide_sonido` (p04:67FD) con el número en A: por debajo de 0x29 es un efecto, que ocupa el canal de 0xC070 si manda más que lo que suena, y del 0x29 en adelante es música de tres o cuatro canales. El número de la música de cada sala lo calcula el juego, así que casi todas son pistas «de la tabla». La RAM del sonido está en 0xC010-0xC0FB y 0xC0F0 guarda la copia del mezclador del PSG, que el arranque deja en 0xB8. Las que suenan igual que otra se publican una vez, y las que duran más de 75 segundos sin volver a empezar se cortan a los 75.

## Las músicas

**La música de una sala** (0x32)

Lo pide `pon_c602`: la música 0x32 (0x2F si la pone un actor del tipo 6); dura 45,2 s y vuelve a empezar en el segundo 6,5.

<audio controls preload="none" src="../audio/musica_32.mp3?v=3d365169"></audio>

**La música del transceptor** (0x5C)

Lo pide `transceptor_texto` y `c900_paso_2`; dura 0,1 s.

<audio controls preload="none" src="../audio/musica_5C.mp3?v=a9fedc66"></audio>

**Pista 0x29 de la tabla** (0x29)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_29.mp3?v=09bcc7eb"></audio>

**Pista 0x2A de la tabla** (0x2A)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_2A.mp3?v=d602b9ab"></audio>

**Pista 0x2B de la tabla** (0x2B)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_2B.mp3?v=fff8070b"></audio>

**Pista 0x2C de la tabla** (0x2C)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_2C.mp3?v=b77a90b7"></audio>

**Pista 0x2D de la tabla** (0x2D)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_2D.mp3?v=b7e815b1"></audio>

**Pista 0x2E de la tabla** (0x2E)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_2E.mp3?v=4255ecec"></audio>

**Pista 0x2F de la tabla** (0x2F)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; dura 47,8 s y vuelve a empezar en el segundo 9,2.

<audio controls preload="none" src="../audio/musica_2F.mp3?v=206e3106"></audio>

**Pista 0x30 de la tabla** (0x30)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; dura 47,8 s y vuelve a empezar en el segundo 9,2.

<audio controls preload="none" src="../audio/musica_30.mp3?v=45f0a776"></audio>

**Pista 0x31 de la tabla** (0x31)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; dura 45,2 s y vuelve a empezar en el segundo 6,5.

<audio controls preload="none" src="../audio/musica_31.mp3?v=688f023d"></audio>

**Pista 0x33 de la tabla** (0x33)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_33.mp3?v=b7f3983d"></audio>

**Pista 0x34 de la tabla** (0x34)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_34.mp3?v=ce2bd451"></audio>

**Pista 0x35 de la tabla** (0x35)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; dura 50,7 s y vuelve a empezar en el segundo 19,5.

<audio controls preload="none" src="../audio/musica_35.mp3?v=fd6be314"></audio>

**Pista 0x36 de la tabla** (0x36)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_36.mp3?v=dbfe96c7"></audio>

**Pista 0x37 de la tabla** (0x37)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_37.mp3?v=22ca8017"></audio>

**Pista 0x38 de la tabla** (0x38)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_38.mp3?v=4f7e2006"></audio>

**Pista 0x39 de la tabla** (0x39)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_39.mp3?v=eb7ee9d7"></audio>

**Pista 0x3A de la tabla** (0x3A)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_3A.mp3?v=5d9044be"></audio>

**Pista 0x3B de la tabla** (0x3B)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; dura 55,0 s y vuelve a empezar en el segundo 23,0.

<audio controls preload="none" src="../audio/musica_3B.mp3?v=ba26829f"></audio>

**Pista 0x3C de la tabla** (0x3C)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_3C.mp3?v=04f88602"></audio>

**Pista 0x3D de la tabla** (0x3D)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_3D.mp3?v=c9c43ea3"></audio>

**Pista 0x1F de la tabla** (0x1F)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; dura 4,6 s.

<audio controls preload="none" src="../audio/musica_1F.mp3?v=83d8ba23"></audio>

**Pista 0x4E de la tabla** (0x4E)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_4E.mp3?v=4653c1c5"></audio>

**Pista 0x4F de la tabla** (0x4F)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_4F.mp3?v=34bd0307"></audio>

**Pista 0x50 de la tabla** (0x50)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; dura 44,0 s y vuelve a empezar en el segundo 0,0.

<audio controls preload="none" src="../audio/musica_50.mp3?v=94f4d6da"></audio>

**Pista 0x51 de la tabla** (0x51)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_51.mp3?v=7c8beb76"></audio>

**Pista 0x53 de la tabla** (0x53)

Lo pide ninguna llamada directa: sale de la tabla de pistas por un número calculado; se corta a los 75 s (la pieza sigue).

<audio controls preload="none" src="../audio/musica_53.mp3?v=eef8a160"></audio>
