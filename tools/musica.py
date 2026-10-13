#!/usr/bin/env python3
"""La musica del cartucho, ejecutando su motor de sonido (ver motor_musica.py).

`pide_sonido` (p04:67FD, A = numero, con los bancos 4 y 5 en 0x6000 y 0x8000;
`sonido` p00:4284 los pone y la llama, `sonido_si_hay` p00:427C solo si se
juega) apunta el sonido, y el controlador `sonido_del_cuadro` (p04:6000) lo
toca cada cuadro; la interrupcion lo llama en p00:41B9. La RAM del sonido es
0xC010-0xC0FB, con la copia del mezclador del PSG en 0xC0F0. MegaROM Konami4 de
128 KB, MSX2, sin SCC.
Uso:  musica.py registros 0x2F [cuadros] | mp3 0x2F f.mp3 | todas docs/audio
      musica.py barrido 0x01 0x7F | emu | python tools/unicas.py 0x01 0x7F
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402
from motor_musica import P  # noqa: E402

TABLA = "ninguna llamada directa: sale de la tabla de pistas por un número calculado"

PIEZAS = [
    P(0x32, "La música de una sala", "A room's tune",
      "`pon_c602`: la música 0x32 (0x2F si la pone un actor del tipo 6)"),
    P(0x5C, "La música del transceptor", "The transceiver tune",
      "`transceptor_texto` y `c900_paso_2`"),
] + [P(n, "Pista 0x%02X de la tabla" % n, "Table track 0x%02X" % n, TABLA)
     for n in list(range(0x29, 0x32)) + list(range(0x33, 0x3E))
     + [0x1F, 0x4E, 0x4F, 0x50, 0x51, 0x53]]

PAGINA = motor_musica.pagina_basica(
    "`sonido_del_cuadro`, p04:6000, y `pide_sonido`, p04:67FD, que apunta "
    "la pista; la interrupción lo llama en p00:41B9 con los bancos 4 y 5",
    "`sonido_del_cuadro`, p04:6000, and `pide_sonido`, p04:67FD, which "
    "points the track; the interrupt calls it at p00:41B9 with banks 4 and 5",
    "C-BIOS MSX2 japonés",
    [("la música 0x2F, sus primeros 116 cuadros",
      "tune 0x2F, its first 116 frames"),
     ("la música 0x3B, sus primeros 116 cuadros",
      "tune 0x3B, its first 116 frames")],
    [("Cómo se pide una pieza",
      "`sonido` (p00:4284) mete los bancos 4 y 5 y llama a `pide_sonido` "
      "(p04:67FD) con el número en A: por debajo de 0x29 es un efecto, que "
      "ocupa el canal de 0xC070 si manda más que lo que suena, y del 0x29 en "
      "adelante es música de tres o cuatro canales. El número de la música "
      "de cada sala lo calcula el juego, así que casi todas son pistas «de "
      "la tabla». La RAM del sonido está en 0xC010-0xC0FB y 0xC0F0 guarda "
      "la copia del mezclador del PSG, que el arranque deja en 0xB8. Las "
      "que suenan igual que otra se publican una vez, y las que duran más "
      "de 75 segundos sin volver a empezar se cortan a los 75.",
      "How a piece is asked for",
      "`sonido` (p00:4284) maps banks 4 and 5 and calls `pide_sonido` "
      "(p04:67FD) with the number in A: below 0x29 it is an effect, which "
      "takes the channel at 0xC070 if it outranks what is playing, and from "
      "0x29 up it is three- or four-channel music. The game computes each "
      "room's tune number, so almost all are tracks «in the table». The "
      "sound RAM is at 0xC010-0xC0FB and 0xC0F0 holds the copy of the PSG "
      "mixer, which start-up leaves at 0xB8. Those that sound like another "
      "are published once, and those that last over 75 seconds without "
      "starting again are cut at 75.")])

CFG = dict(rom="metalgear.rom", org=0x4000, mapper="konami",
           bancos0=((0x4000, 0), (0x6000, 4), (0x8000, 5), (0xA000, 6)),
           bancos_frame=((0x6000, 4), (0x8000, 4)),
           frame=0x6000, pide=0x67FD, banco_frame=4, banco_pide=4,
           ram=(0xC010, 0xC0FC), ram0=[(0xC0F0, 0xB8)], hz=60,
           psg0={7: 0xB8}, romtype="konami", maquina="C-BIOS_MSX2_JP",
           max_s=75, piezas=PIEZAS, pagina=PAGINA,
           cotejado=[(0x2F, 2870, 550), (0x3B, 3301, 1381)])

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
