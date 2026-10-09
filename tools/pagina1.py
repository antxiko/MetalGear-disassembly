#!/usr/bin/env python3
"""Lo que el juego guarda en la pagina 1 de la VRAM (SCREEN 5, 0x8000-0xFFFF)
y copia a la sala con el comando de copia del VDP: las puertas y los objetos.

Todo leido en el listado (cada funcion cita su rutina):
  - L_5011 (0x40A5) es el copiador: H = X y L = Y de origen, D = X y E = Y
    de destino, B = ancho, C = alto; los bits de A dicen la pagina (0x48:
    origen en la pagina 1, destino en la 0).
  - Las fichas de puerta (p07:61C9-6749, 4 bits por punto tal cual) las
    vuelca p00:49FA-4A2E con L_4A33/L_509C en bloques de B x C fichas:
    0xD060 (x 192, y 160, 4 x 4), 0xE060 (192, 192, 4 x 4), 0xD070 (224,
    160, 1 x 4), 0xD074 (232, 160, 1 x 4) y 0xE070 (224, 192, 4 x 1).
  - Las 132 fichas de objetos y armas (p06:A75D, 3 planos por la tabla
    p00:4B1B) las vuelca p00:4B3F-4B47 desde 0xB000 (y 96), 32 por fila
    (L_509C pasa a la fila siguiente cuando E llega a 0x80).
  - p06:BC47-BCA1 pinta cada objeto de la sala: [X | 16 puntos][Y] de
    origen en p06:B855 (armas 1-8) o p06:B8C0 (objetos 9-35), 32 x 16 o
    16 x 16, en la (Y, X) de su terna (p06:BC07, listas p06:BA50).
  - p01:7710-7808 pinta cada puerta de la sala (fichas de 0xC3D0, p00:441A)
    segun su tipo: 1 y 5, 24 x 32 desde (196, 160) y (196, 192); 2, 32 x 8
    desde (224, 192); 3 y 4, ocho tiras de 1 x 32 en diagonal desde (224,
    160) y (232, 160); 6 (ascensor), nada; 7-19, dibujos del banco 15 por
    p00:45EF (sin leer todavia).
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from bloques import leer, palabra          # noqa: E402  (el banco 6 va en 0xA000 con el trio 4)
import salas as S                          # noqa: E402

ANCHO = 256


def ficha_4bpp(trio, src):
    """32 bytes tal cual: 8 filas de 4 bytes, dos puntos por byte, el alto
    a la izquierda (L_5087 -> L_4D59)."""
    out = []
    for f in range(8):
        fila = []
        for k in range(4):
            b = leer(trio, src + 4 * f + k)
            fila += [b >> 4, b & 0x0F]
        out.append(fila)
    return out


def pon_ficha(canvas, x, y, ficha):
    for fy, fila in enumerate(ficha):
        for fx, c in enumerate(fila):
            canvas[(x + fx, y + fy)] = c


def bloque(canvas, trio, src, x, y, b, c):
    """L_4A33: C filas de B fichas de 32 bytes seguidas desde src."""
    for fy in range(c):
        for fx in range(b):
            pon_ficha(canvas, x + 8 * fx, y + 8 * fy, ficha_4bpp(trio, src))
            src += 32


_P1 = None


def pagina1():
    """{(x, y): color} de la pagina 1 con las puertas (p00:49FA-4A2E) y los
    objetos (p00:4B3F-4B47; indices por la tabla p00:4B1B)."""
    global _P1
    if _P1 is not None:
        return _P1
    canvas = {}
    bloque(canvas, 7, 0x61C9, 192, 160, 4, 4)     # 0xD060
    bloque(canvas, 7, 0x63C9, 192, 192, 4, 4)     # 0xE060
    bloque(canvas, 7, 0x65C9, 224, 160, 1, 4)     # 0xD070
    bloque(canvas, 7, 0x6649, 232, 160, 1, 4)     # 0xD074
    bloque(canvas, 7, 0x66C9, 224, 192, 4, 1)     # 0xE070
    colores = [leer(0, 0x4B1B + i) for i in range(8)]
    x, y = 0, 96
    for k in range(132):
        fi = S.ficha_3_planos(4, 0xA75D + 24 * k)
        pon_ficha(canvas, x, y, [[colores[c] for c in fila] for fila in fi])
        x += 8
        if x == ANCHO:
            x, y = 0, y + 8
    _P1 = canvas
    return canvas


def copia(sx, sy, w, h, dx, dy):
    """Lo que deja el copiador en la pagina 0: {(x, y): color} (el color 0
    tambien se copia: el comando no es transparente)."""
    p1 = pagina1()
    return {(dx + i, dy + j): p1.get((sx + i, sy + j), 0) for j in range(h) for i in range(w)}


# ---------------------------------------------------------------- objetos

def objetos_de_sala(r):
    """p06:BBF4-BC07: [(objeto, y, x)] de la sala r (solo las 0x7A-0xDA
    tienen lista: p06:B9EF; 0 = ninguna)."""
    if not 0x7A <= r < 0xDA:         # p06:BBE9-BBF1
        return []
    k = leer(4, 0xB9EF + r - 0x7A)
    if k == 0:
        return []
    d = palabra(4, 0xBA50 + 2 * (k - 1))
    out = []
    while leer(4, d) != 0xFF:
        out.append((leer(4, d), leer(4, d + 1), leer(4, d + 2)))
        d += 3
    return out


def dibujo_de_objeto(o):
    """p06:BC55-BC85: (x, y, ancho, alto) en la pagina 1 del objeto o: las
    armas 1-8 en p06:B855, los objetos 9-35 en p06:B8C0; el bit 0 de la X
    dice 16 puntos de ancho (si no, 32); 16 de alto."""
    d = 0xB855 + 2 * (o - 1) if o < 9 else 0xB8C0 + 2 * (o - 9)
    x, y = leer(4, d), leer(4, d + 1)
    return x & 0xFE, y, 16 if x & 1 else 32, 16


def nombre_de_objeto(o):
    """p06:B8F6 (p00:47EB): el rotulo del objeto 9-33 en el menu; las armas
    y los dos ultimos no tienen."""
    if not 9 <= o <= 33:
        return None
    p = palabra(4, 0xB8F6 + 2 * (o - 9))
    s = ""
    while leer(4, p) != 0xFF:
        b = leer(4, p)
        s += chr(b) if 32 <= b < 127 else "<%02X>" % b
        p += 1
    return s


def rotulo_de_objeto(o):
    return nombre_de_objeto(o) or ("arma %d" % o if o < 9 else "objeto %d" % o)


def pixeles_de_objetos(r):
    """Los objetos de la sala como los deja p06:BC47 (sin coger ninguno)."""
    px = {}
    for (o, y, x) in objetos_de_sala(r):
        sx, sy, w, h = dibujo_de_objeto(o)
        px.update(copia(sx, sy, w, h, x, y))
    return px


# ---------------------------------------------------------------- puertas

def copias_de_puerta(tipo, y, x):
    """p01:7738-7808: las copias (sx, sy, w, h, dx, dy) con las que se pinta
    una puerta del tipo dado en (y, x). Los tipos 7-19 (dibujos del banco
    15) y el 6 (ascensor) no se pintan aqui."""
    if tipo == 1:
        return [(196, 160, 24, 32, x, y)]                       # p01:77D8
    if tipo == 5:
        return [(196, 192, 24, 32, x, y)]                       # p01:77F3
    if tipo == 2:
        return [(224, 192, 32, 8, x, y)]                        # p01:7762
    if tipo == 3:                                               # p01:777E
        return [(224 + i, 160, 1, 32, x + i, y + 4 * i) for i in range(8)]
    if tipo == 4:                                               # p01:77A7
        return [(232 + i, 160, 1, 32, x + i, y + 0x1C - 4 * i) for i in range(8)]
    return []


def pixeles_de_puertas(r):
    """Las puertas de la sala cerradas (p01:7710 las pinta si el byte 1 de
    su ficha no es 0)."""
    px = {}
    for (_p, t, y, x, _e) in S.puertas(r):
        for (sx, sy, w, h, dx, dy) in copias_de_puerta(t, y, x):
            px.update(copia(sx, sy, w, h, dx, dy))
    return px


def main(argv):
    if len(argv) > 1 and argv[1] == "objetos":
        for r in range(0x7A, 0xDA):
            o = objetos_de_sala(r)
            if o:
                print("sala %3d: %s" % (r, "  ".join("%s(%d)@%d,%d" % (rotulo_de_objeto(k), k, y, x) for (k, y, x) in o)))
    else:
        print(__doc__)


if __name__ == "__main__":
    main(sys.argv)
