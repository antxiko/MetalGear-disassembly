# El código

## Las cifras

- **100 %** del binario explicado: 35.620 bytes de código trazado y 95.452
  de datos con nombre, que suman los 131.072 del cartucho.
- 17.071 instrucciones en los bancos 0, 1, 2, 3, 4, 6, 9, 12 y 15, con
  **7.985 comentarios: el 46,8 %**.
- 2.190 rutinas y etiquetas; ninguna por debajo del 10 % de comentarios, y
  ningún `call` a una rutina sin nombre.

## Cómo se ordena

El juego del cuadro (`p01:6672`) despacha por el **estado del juego**
(0xC000): el logotipo y el título, la espera, la demo, PLAY START, la partida
nueva, la partida, GAME OVER, la pausa y el final.

En la partida (`p01:6F18`) manda el **modo** (0xC151, tabla `p01:6F7A`): el
juego, el cambio de sala, las ventanas de armas y de equipo, el transceptor,
el camión, el ascensor, abrir una puerta, el telescopio, Snake muerto, la
ventana de texto, la captura y la sala 0x85.

Snake tiene su propio **estado** (0xC180, tabla `p01:6001`) y su **modo de
pose** (0xC18B, tabla `p01:6508`).

## Las fichas

IX apunta a tres clases de ficha, y `tools/anotaciones.py` comenta sus campos
allí donde IX es seguro una de ellas:

- **actor** (0xD000, 16 de 0x80): +0 el tipo (bit 7: muriendo), +1 el paso,
  +3 la Y, +5 la X, +7/+9 las velocidades, +0x0B el cuadro, +0x0C la cuenta
  de cuadros, +0x0D el aguante, +0x0E con qué choca, +0x11 la dirección,
  +0x1E las marcas de golpe, +0x20 cuántos sprites;
- **proyectil** (0xC200, 6 de 0x40): el arma, el paso, la Y, la X, la Y del
  suelo y si hiere;
- **canal de sonido** (0xC010, 4 de 0x20): la lista, la nota, el periodo,
  el volumen, el instrumento y el vibrato.

## Los actores

Cada tipo tiene dos manejadores: el de **creación** (`p00:575F`, tabla
`p00:5762`) y el de **cada cuadro** (`p01:722C`, tabla `p01:722F`, desde el
bucle `p01:71E5`). En el listado se llaman `crea_tipo_N` y `cuadro_tipo_N`.
Los choques del cuadro están en `p02:88EF`: los proyectiles contra los
actores, Snake contra los actores, las fichas y las salas que hieren, las
puertas y los objetos.

## Los textos

159 textos (`p12:A37D`) con 92 trozos compartidos (`p12:B8A7`): un byte de
0xA1 en adelante mete un trozo. La ventana va por pasos (`p00:5D03`) y
escribe una letra cada 4 cuadros con su sonido.

## Los nombres

Los nombres y los comentarios automáticos salen de `tools/anotaciones.py`,
cada uno con la rutina donde se lee; `tools/anota.py` los escribe en las
notas. Los manejadores por tipo se nombran solos desde las dos tablas de
despacho, y los trampolines del banco 0 por la rutina a la que llaman.
