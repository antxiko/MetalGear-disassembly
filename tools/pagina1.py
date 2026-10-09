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
  - Abajo (y 128-151), p00:4B4A-4BAB: las fichas del transceptor, la
    camara (2 planos, L_51FE, colores 0x4B23) y el retrato de Snake (p09,
    colores 0x4B2B); las 7 de 0xCC00 volteadas (L_5265).
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


def sitio_en_vram(a):
    """La (x, y) de la pagina 1 de una direccion de la VRAM (SCREEN 5: 128
    bytes por linea, dos puntos por byte)."""
    d = a - 0x8000
    return 2 * (d % 128), d // 128


def ficha_2_planos(trio, src, colores):
    """L_5221: 8 filas de 2 bytes [e][d]; el indice de cada punto es
    (bit de d) x 2 + (bit de e), de izquierda a derecha, y pasa por la tabla
    de 0xE700 (L_42C9 con C = 4)."""
    out = []
    for f in range(8):
        e, d = leer(trio, src + 2 * f), leer(trio, src + 2 * f + 1)
        out.append([colores[(((d >> (7 - x)) & 1) << 1) | ((e >> (7 - x)) & 1)] for x in range(8)])
    return out


def fichas_seguidas(canvas, a, fichas):
    """L_509C/L_50B1: una ficha cada 4 bytes de VRAM desde a (no cruzan de
    fila en estas cargas: se comprueba)."""
    x, y = sitio_en_vram(a)
    assert x + 8 * len(fichas) <= ANCHO, hex(a)
    for k, fi in enumerate(fichas):
        pon_ficha(canvas, x + 8 * k, y, fi)


def tres_planos(trio, src, n, colores, volteadas=False):
    """L_524C (y L_5265, que pasa cada ficha por L_50B1: volteada)."""
    out = []
    for k in range(n):
        fi = [[colores[c] for c in fila] for fila in S.ficha_3_planos(trio, src + 24 * k)]
        out.append(S.voltea(fi) if volteadas else fi)
    return out


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
    # p00:4B4A-4BAB: la parte de abajo (y 128-151), lo del transceptor;
    # cada carga con la tabla de 0xE700 que deja la anterior
    t1b = [leer(0, 0x4B1B + i) for i in range(8)]
    t13 = S.colores_por_defecto()
    t23 = [leer(0, 0x4B23 + i) for i in range(4)]
    t2b = [leer(0, 0x4B2B + i) for i in range(8)]
    fichas_seguidas(canvas, 0xC400, tres_planos(4, 0xB3BD, 4, t1b))          # p00:4B52
    fichas_seguidas(canvas, 0xC804, tres_planos(4, 0xB41D, 31, t13))         # p00:4B63
    fichas_seguidas(canvas, 0xCC00, tres_planos(4, 0xB65D, 7, t13, True))    # p00:4B6E
    fichas_seguidas(canvas, 0xC010, [ficha_2_planos(4, 0xB705 + 16 * k, t23) for k in range(8)])  # p00:4B81
    fichas_seguidas(canvas, 0xC410, [ficha_2_planos(4, 0xB785 + 16 * k, t23) for k in range(8)])  # p00:4B8C
    fichas_seguidas(canvas, 0xC040, tres_planos(7, 0xABA1, 16, t2b))        # p00:4BA0 (p09)
    fichas_seguidas(canvas, 0xC440, tres_planos(7, 0xAD21, 3, t2b))         # p00:4BAB (p09)
    _P1 = canvas
    return canvas


def copia(sx, sy, w, h, dx, dy):
    """Lo que deja el copiador en la pagina 0: {(x, y): color}. Puertas
    (p01:776C...) y objetos (p06:BC9F) llaman a L_5011 con A = 0x48: paginas
    1 -> 0 (bits 7-6 y 5-4) y operacion 8 (bits 3-0, p00:5052-5059) = LMMM
    con TIMP: el color 0 NO se copia, se ve el fondo."""
    p1 = pagina1()
    out = {}
    for j in range(h):
        for i in range(w):
            c = p1.get((sx + i, sy + j), 0)
            if c:
                out[(dx + i, dy + j)] = c
    return out


# ---------------------------------------------------------------- objetos

def objetos_de_sala(r, mensaje_75=False):
    """p06:BBF4-BC07: [(objeto, y, x)] de la sala r (solo las 0x7A-0xDA
    tienen lista: p06:B9EF; 0 = ninguna). El objeto 4 solo sale con 0xC661
    puesto (p06:BC0C-BC14), y si no, la lista se CORTA ahi (ret z); 0xC661
    lo pone p00:5F35 cuando el mensaje 0xCEF0 es el 0x75. Por defecto, el
    estado del principio de la partida (sin el mensaje)."""
    if not 0x7A <= r < 0xDA:         # p06:BBE9-BBF1
        return []
    k = leer(4, 0xB9EF + r - 0x7A)
    if k == 0:
        return []
    d = palabra(4, 0xBA50 + 2 * (k - 1))
    out = []
    while leer(4, d) != 0xFF:
        if leer(4, d) == 4 and not mensaje_75:
            break
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
