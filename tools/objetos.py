#!/usr/bin/env python3
"""Los dibujos de las armas y los objetos, la pagina 1 entera y la boca del
retrato del transceptor, desde la ROM.

  - hoja: cada arma (1-8, sitio en p06:B855) y cada objeto (9-33, p06:B8C0)
    como los copia la ventana de equipo (p00:47D4-47E8, HMMM de la pagina 1
    a la 0) con su nombre (p06:B865 las armas, p00:46F0; p06:B8F6 los
    objetos, p00:47EB) escrito con la fuente del juego (dibujos.rotulo), en
    la paleta del juego (p01:6E82). Las ocho tarjetas comparten dibujo.
  - pagina1: la pagina 1 de la VRAM tal como la dejan las cargas que lee
    pagina1.pagina1() (puertas, objetos, transceptor, camara y retrato).
  - boca: el retrato p15:B40D con la boca que pone p00:5E17-5E3F. Solo con
    los textos 0x0A (el SEND de Snake, p01:695E) y 0x9B; ventana_escribe
    (p00:5D99) escribe una letra cuando (0xC003) & 3 = 0, y en cada letra
    (0xC003) & 0x1C elige el dibujo: 0 -> p15:B425, bit 2 -> p15:B42B, si
    no -> p15:B41F (la boca cerrada). Una vuelta son 32 cuadros.

Uso: objetos.py hoja <png> | pagina1 <png> | boca <gif>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from bloques import leer, palabra   # noqa: E402
import dibujos as D                 # noqa: E402
import pagina1 as P1                # noqa: E402
import salas as S                   # noqa: E402

FONDO = (24, 24, 24)


def nombre(o):
    """Los bytes del nombre: p06:B865 (armas) o p06:B8F6 (objetos)."""
    p = palabra(4, (0xB865 + 2 * (o - 1)) if o < 9 else (0xB8F6 + 2 * (o - 9)))
    out = []
    while leer(4, p) != 0xFF:
        out.append(leer(4, p))
        p += 1
    return out


def texto(px, bytes_, x, y, fuente):
    """Lo que hace rotulo_en_de (L_510C sin la [X][Y]): cada caracter c de la
    ficha c + 0x10 de la fuente, 0x30 lineas mas abajo; el 0, el hueco."""
    for c in bytes_:
        if c == 0:
            sx, sy = 0, 0
        else:
            t = (c + 0x10) & 0xFF
            sx, sy = 8 * (t % 32), 8 * (t // 32) + 0x30
        for j in range(8):
            for i in range(8):
                px[(x + i, y + j)] = fuente.get((sx + i, sy + j), 0)
        x += 4 if c in (0x97, 0x98) else 8


def lienzo(px, w, h, pal, esc):
    from PIL import Image
    img = Image.new("RGB", (w, h), S.rgb(pal[0]))
    p = img.load()
    for (x, y), c in px.items():
        if 0 <= x < w and 0 <= y < h:
            p[x, y] = S.rgb(pal[c])
    return img.resize((w * esc, h * esc), Image.NEAREST)


# p02:98B5-98BE: el aviso encima del soldado que ve a Snake, 16 x 16 de la
# pagina 1: (0, 0x80) el "!", o (0x10, 0x80) el "!!" si 0xC614 no es 0 (y
# entonces llegan refuerzos cada 0x1E cuadros)
AVISOS = ((0x00, 0x80), (0x10, 0x80))


def hoja(fn, esc=3):
    from PIL import Image
    p1 = P1.pagina1()
    fuente = D.fuente()
    pal = S.paleta_de_juego()
    COL, ANCHO, ALTO = 4, 112, 24
    objetos = list(range(1, 34))
    filas = (len(objetos) + COL - 1) // COL
    px = {}
    for k, o in enumerate(objetos):
        x0, y0 = (k % COL) * ANCHO + 4, (k // COL) * ALTO + 4
        sx, sy, w, h = P1.dibujo_de_objeto(o)
        for j in range(h):
            for i in range(w):
                px[(x0 + i, y0 + j)] = p1.get((sx + i, sy + j), 0)
        texto(px, nombre(o), x0 + 36, y0 + 4, fuente)
    k = len(objetos)                     # detras de BOX, los dos avisos
    for n, (sx, sy) in enumerate(AVISOS):
        x0, y0 = (k % COL) * ANCHO + 4 + 24 * n, (k // COL) * ALTO + 4
        for j in range(16):
            for i in range(16):
                px[(x0 + i, y0 + j)] = p1.get((sx + i, sy + j), 0)
    img = Image.new("RGB", (COL * ANCHO, filas * ALTO), FONDO)
    p = img.load()
    for (x, y), c in px.items():
        if c:
            p[x, y] = S.rgb(pal[c])
    img.resize((img.width * esc, img.height * esc), Image.NEAREST).save(fn)


def pagina1(fn):
    """Lo de la pagina 1 que se ve con la paleta del juego: las fichas de
    objetos (y 96-127) y los dos avisos (x 0-31, y 128-143). Lo demas se ve
    con otras paletas: la camara, el transceptor y el retrato con la del
    transceptor (p05:8B1E), y las puertas con la de cada sala (salen en los
    mapas); aqui no se pintan."""
    p = {(x, y): c for (x, y), c in P1.pagina1().items()
         if 96 <= y < 128 or (128 <= y < 144 and x < 32)}
    lienzo(p, 256, 256, S.paleta_de_juego(), 2).save(fn)


BOCAS = {"cerrada": 0xB41F, "b425": 0xB425, "b42b": 0xB42B}


def boca_del_cuadro(c003):
    """p00:5E17-5E2B: el dibujo de la boca con la cuenta de cuadros."""
    a = c003 & 0x1C
    if a == 0:
        return 0xB425
    if a & 4:
        return 0xB42B
    return 0xB41F


def retrato(boca):
    """El retrato p15:B40D en (0xC8, 0x28) y la boca en (0xD0, 0x30), los
    dos de la mitad de abajo de la pagina 1 (0xC168 = 1)."""
    px, _ = D.pixeles_de_dibujo_abajo(0xB40D, 0xC8, 0x28)
    # las fichas del retrato pasan por 0x4B2B (2, 4, 8, 0xB, 0xD, 0xC, 0xE,
    # 0xF): ningun punto es 0, asi que el TIMP de la copia no deja ver nada
    # de la boca anterior
    b, _ = D.pixeles_de_dibujo_abajo(boca, 0xD0, 0x30)
    px.update(b)
    return {(x - 0xC8, y - 0x28): c for (x, y), c in px.items()}


def boca(fn, esc=6):
    pal = S.aplica_paleta(S.paleta_de_juego(), 4, 0x8B1E)   # la del transceptor
    ims, dur, t = [], [], 0
    for c003 in range(0, 32, 4):        # una letra cada 4 cuadros
        ims.append(lienzo(retrato(boca_del_cuadro(c003)), 32, 32, pal, esc))
        t0 = round(t * 100 / 60)
        t += 4
        dur.append((round(t * 100 / 60) - t0) * 10)
    ims[0].save(fn, save_all=True, append_images=ims[1:], duration=dur,
                loop=0)


def main(argv):
    if len(argv) != 3 or argv[1] not in ("hoja", "pagina1", "boca"):
        sys.exit(__doc__)
    {"hoja": hoja, "pagina1": pagina1, "boca": boca}[argv[1]](argv[2])


if __name__ == "__main__":
    main(sys.argv)
