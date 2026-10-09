# Empezar

Este repositorio no trae el juego. Trae las herramientas que, a partir de tu
propia imagen del cartucho, vuelven a montar el listado comentado, lo
reensamblan y comprueban que sale la ROM **byte a byte**.

## Lo que hace falta

- La imagen del cartucho europeo de *Metal Gear* (RC-750), 131.072 bytes, en
  la raíz con el nombre `metalgear.rom`. Su sha256:
  `d16fff4a59ce26b570851c7200f67e05f385978598dcad91c83bf9c671a295ae`.
- `make`, `python3` y el ensamblador `pasmo`.
- Para las imágenes, Python con PIL.

## Lo que se ejecuta

    make comprueba     # el sha256 de la ROM
    make               # traza, genera el listado, reensambla y pasa los tests
    make densidad      # cuántas instrucciones llevan comentario, banco a banco
    make sanity        # el presupuesto: ni un byte sin asignar

`make verify` reensambla los dieciséis bancos y los compara con la ROM: tiene
que decir `OK: la ROM entera reproducible byte a byte`.

## Dónde está cada cosa

- `src/metalgear_pNN.asm`: el listado de cada banco (p00 a p15).
- `src/pNN.notes`: los nombres, los comentarios y los bloques de datos de
  cada banco. El listado se genera desde aquí.
- `tools/anota.py` y `tools/anotaciones.py`: los nombres de las rutinas y de
  la RAM, y los comentarios automáticos de las fichas a las que apunta IX.
- `tools/salas.py`, `tools/dibuja.py`, `tools/sprites.py`,
  `tools/dibuja_sprites.py`, `tools/dibujos.py`: las imágenes, dibujadas
  desde la ROM.

## Las imágenes

    python tools/dibuja.py mapas work/dibujos --numeros --actores
    python tools/dibuja_sprites.py tipos work/dibujos/sprites --escala 3
    python tools/dibuja_sprites.py snake work/dibujos/snake.png
    python tools/dibuja.py transceptor work/dibujos/transceptor.png
