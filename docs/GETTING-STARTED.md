# Getting started

This repository does not contain the game. It contains the tools that, from
your own image of the cartridge, rebuild the commented listing, reassemble it
and check that the ROM comes out **byte for byte**.

## What you need

- The European *Metal Gear* cartridge image (RC-750), 131,072 bytes, in the
  root as `metalgear.rom`. Its sha256:
  `d16fff4a59ce26b570851c7200f67e05f385978598dcad91c83bf9c671a295ae`.
- `make`, `python3` and the `pasmo` assembler.
- For the pictures, Python with PIL.

## What to run

    make comprueba     # the ROM's sha256
    make               # trace, generate the listing, reassemble, run the tests
    make densidad      # how many instructions carry a comment, bank by bank
    make sanity        # the budget: not one byte unassigned

`make verify` reassembles the sixteen banks and compares them with the ROM:
it must say `OK: la ROM entera reproducible byte a byte`.

## Where things are

- `src/metalgear_pNN.asm`: the listing of each bank (p00 to p15).
- `src/pNN.notes`: the names, comments and data blocks of each bank. The
  listing is generated from here.
- `tools/anota.py` and `tools/anotaciones.py`: the names of the routines and
  of the RAM, and the automatic comments for the records IX points to.
- `tools/salas.py`, `tools/dibuja.py`, `tools/sprites.py`,
  `tools/dibuja_sprites.py`, `tools/dibujos.py`: the pictures, drawn from the
  ROM.

## The pictures

    python tools/dibuja.py mapas work/dibujos --numeros --actores
    python tools/dibuja_sprites.py tipos work/dibujos/sprites --escala 3
    python tools/dibuja_sprites.py snake work/dibujos/snake.png
    python tools/dibuja.py transceptor work/dibujos/transceptor.png
