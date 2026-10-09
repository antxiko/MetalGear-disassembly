#!/usr/bin/env python3
"""El modelo de las salas de Metal Gear, leido de la ROM como lo lee el juego.

Todo lo que hay aqui sale de rutinas del listado, citadas en cada funcion:
nada se supone. Las tablas estan declaradas en src/pNN.notes (bloques.py).

  - Una sala son 6 filas de 8 metafichas (p00:4C9A); cada metaficha, 4 x 4
    numeros de ficha (16 bytes); el juego de metafichas lo da un nibble por
    sala (p13:61F6) y el indice p13:6274.
  - Las fichas se cargan en la VRAM por juegos (un nibble por sala en
    p07:6000, descriptores en p07:608E, p00:495E-49DF): cada ficha son 24
    bytes, 3 planos de bits, y el indice de 3 bits pasa por la tabla de
    colores 0x4B13 (L_42C4 -> 0xE700) para dar el color de la paleta.
  - La paleta: la de arranque (p00:4EA4, 16 parejas [RB][G]) y encima la de
    la sala (nibble en p05:8B40, indice p05:8BBE, ternas hasta 0xFF).
  - Las vecinas: 4 bytes por sala en p05:8E0E (p00:42E6), con la sala a la
    que se sale por cada lado.
  - Los ascensores (salas 0xF0-0xFA): indice p05:8DA8 y fichas con las
    salas a las que paran (p00:432D, p00:431F).
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from bloques import leer, palabra, ROM          # noqa: E402

N_SALAS = 251


def nibble(trio, base, k):
    """L_42D1/L_42D4: el nibble k de una tabla de nibbles (alto en los pares)."""
    b = leer(trio, base + k // 2)
    return (b >> 4) if k % 2 == 0 else (b & 0x0F)


def voltea(ficha):
    """L_50B1: cada fila al reves (la copia 'volteada' de un juego de fichas)."""
    return [fila[::-1] for fila in ficha]


def ficha_3_planos(trio, src):
    """L_5288: 8 filas de 3 bytes; el indice de cada punto es
    (bit del 3er byte) * 4 + (bit del 2o) * 2 + (bit del 1o), de izquierda
    a derecha. Devuelve 8 filas de 8 indices 0-7."""
    out = []
    for f in range(8):
        b0, b1, b2 = (leer(trio, src + 3 * f + i) for i in range(3))
        fila = []
        for x in range(8):
            m = 0x80 >> x
            fila.append(((b2 & m) and 4) | ((b1 & m) and 2) | ((b0 & m) and 1))
        out.append(fila)
    return out


def colores_por_defecto():
    """p00:4B13, los 8 colores de paleta de los indices 0-7 (L_42C4)."""
    return [ROM[0x4B13 - 0x4000 + i] for i in range(8)]


def numero_de_ficha(vram):
    """L_49DF al reves: la ficha que vive en esa direccion de la VRAM
    (0x8000 + 0x400 x (ficha / 32) + 4 x (ficha % 32))."""
    d = vram - 0x8000
    return ((d >> 10) << 5) | ((d & 0x3FF) >> 2)


def juego_de_fichas(j, con_cajas=True):
    """{numero de ficha: 8 x 8 indices} del juego j (p00:495E): hasta 3
    descriptores de 5 bytes, y las 'volteadas' (bit 6) repiten el origen
    anterior. Mas las fichas que se cargan siempre: el interruptor
    (p00:4BBC, 4 fichas en la VRAM 0x9048) y, salvo en el juego 6
    (p00:4952), las cajas (p00:4BCF: 8 en 0x9400 y volteadas en 0x9840)."""
    fichas = {}
    ix = palabra(7, 0x607E + 2 * j)
    prev = None
    for k in range(3):
        r = ix + 5 * k
        bits = leer(7, r)
        if bits & 0x80:
            break
        if bits & 0x40:
            primera = leer(7, r + 1)
            src, n = prev
            for i in range(n):
                fichas[primera + i] = voltea(ficha_3_planos(7, src + 24 * i))
            continue
        n, primera, src = leer(7, r + 1), leer(7, r + 2), palabra(7, r + 3)
        for i in range(n):
            fichas[primera + i] = ficha_3_planos(7, src + 24 * i)
        prev = (src, n)
    t = numero_de_ficha(0x9048)
    for i in range(4):
        fichas[t + i] = ficha_3_planos(13, 0xB2BF + 24 * i)
    if con_cajas and j != 6:
        a, b = numero_de_ficha(0x9400), numero_de_ficha(0x9840)
        for i in range(8):
            fichas[a + i] = ficha_3_planos(7, 0x9509 + 24 * i)
            fichas[b + i] = voltea(fichas[a + i])
    return fichas


def es_sala(r):
    """Los 16 numeros cuyo puntero de p13:6000 cae en la tabla de nibbles
    (155, 222, 223, 227-239) no son salas: no hay 48 bytes detras."""
    return 0 <= r < N_SALAS and palabra(13, 0x6000 + 2 * r) >= 0x6280


def juego_de_sala(r):
    """p00:493E: el juego de fichas de la sala (nibble en p07:6000)."""
    return nibble(7, 0x6000, r)


def metafichas_de_sala(r):
    """p00:4CF0/4C9A: 6 x 8 indices de metaficha (1-N) y la base del juego."""
    ptr = palabra(13, 0x6000 + 2 * r)
    juego = nibble(13, 0x61F6, r)
    base = palabra(13, 0x6274 + 2 * (juego - 1))
    filas = [[leer(13, ptr + 8 * f + c) for c in range(8)] for f in range(6)]
    return filas, base, juego


def fichas_de_sala(r):
    """La sala como 24 x 32 numeros de ficha (p00:4CC3-4CD5: cada metaficha
    son 4 filas de 4 numeros, seguidos)."""
    filas, base, _ = metafichas_de_sala(r)
    out = [[0] * 32 for _ in range(24)]
    for f in range(6):
        for c in range(8):
            m = base + 16 * (filas[f][c] - 1)
            for i in range(4):
                for k in range(4):
                    out[4 * f + i][4 * c + k] = leer(13, m + 4 * i + k)
    return out


_JUEGOS = {}


def pixeles_de_sala(r):
    """La sala como 192 filas de 256 indices de paleta (lo que el juego deja
    en la VRAM), y las fichas que ninguna carga pone en la VRAM (se dejan a
    0: la 1 es el hueco de una puerta, que p01 pinta aparte; la 2, negro)."""
    j = juego_de_sala(r)
    if j not in _JUEGOS:
        _JUEGOS[j] = juego_de_fichas(j)
    fichas = _JUEGOS[j]
    colores = colores_por_defecto()
    px = [[0] * 256 for _ in range(192)]
    faltan = set()
    for f, fila in enumerate(fichas_de_sala(r)):
        for c, t in enumerate(fila):
            fi = fichas.get(t)
            if fi is None:
                faltan.add(t)
                continue
            for yy in range(8):
                for xx in range(8):
                    px[8 * f + yy][8 * c + xx] = colores[fi[yy][xx]]
    return px, faltan


def paleta_de_arranque():
    """p00:4E90: 16 parejas [RB][G] -> (r, g, b) de 0 a 7."""
    out = []
    for k in range(16):
        rb, g = ROM[0x4EA4 - 0x4000 + 2 * k], ROM[0x4EA4 - 0x4000 + 2 * k + 1]
        out.append(((rb >> 4) & 7, g & 7, rb & 7))
    return out


def aplica_paleta(pal, trio, a):
    """L_4EC4: ternas [color][RB][G] hasta 0xFF encima de pal."""
    pal = list(pal)
    while leer(trio, a) != 0xFF:
        c, rb, g = leer(trio, a), leer(trio, a + 1), leer(trio, a + 2)
        pal[c & 0x0F] = ((rb >> 4) & 7, g & 7, rb & 7)
        a += 3
    return pal


def paleta_de_sala(r):
    """p00:4ACB: el nibble de p05:8B40 elige la paleta de p05:8BBE (sin las
    gafas ni el foco, que son los casos 0xB y 0xA)."""
    k = nibble(4, 0x8B40, r)
    return aplica_paleta(paleta_de_arranque(), 4, palabra(4, 0x8BBE + 2 * k))


def rgb(c):
    return tuple(v * 255 // 7 for v in c)


def indice_de_vecinas(r):
    """p00:42E6: donde caen las 4 vecinas de la sala en p05:8E0E."""
    if r < 0x7E:
        return r
    if r < 0xD0:
        return None             # p00:42F2-42F4: las salas 0x7E-0xCF no estan en la tabla
    if r < 0xE4:
        return r - 0x52
    if r < 0xF1:
        return None
    return r - 0x5F


# El lado por el que se sale (0xC133 = 1-4) se lee en el mismo orden que la
# direccion del jugador (0xC185): las velocidades de la bala (p02:83E6) dan
# 1 = izquierda (dx -6), 2 = derecha (dx +6), 3 = arriba (dy -6), 4 = abajo.
# SUPOSICION: que 0xC133 y 0xC185 usan el mismo codigo; la simetria de las
# vecinas (ver `salas.py vecinas`) es la prueba.
LADOS = ("izquierda", "derecha", "arriba", "abajo")


def vecinas(r):
    """[izquierda, derecha, arriba, abajo] de la sala (None si no hay)."""
    i = indice_de_vecinas(r)
    if i is None:
        return [None] * 4
    out = []
    for k in range(4):
        v = leer(4, 0x8E0E + 4 * i + k)
        out.append(None if v == 0xFF else v)
    return out


def puertas(r):
    """p00:43FA/441A: las puertas de la sala, fichas de 5 bytes
    [puerta][tipo][y][x][sala de destino] (p15:A7C0; las salas 0xF0-0xFA
    restan 0xF). Primero la Y: el tercer byte nunca pasa de 184 y el cuarto
    llega a 240, como en los actores (p05:9560) y los caminos (p06:A2DF)."""
    if 0xE1 <= r < 0xF0:
        return []
    k = r - 0xF if r >= 0xF0 else r
    d = palabra(13, 0xA7C0 + 2 * k)
    out = []
    while leer(13, d) != 0xFF:
        out.append(tuple(leer(13, d + i) for i in range(5)))
        d += 5
    return out


def lado_de_puerta(x, y):
    """Por donde queda una puerta vista desde el centro de la sala (para
    colocar la sala de detras en el mapa): el eje en el que mas se aleja."""
    dx, dy = x + 16 - 128, y + 8 - 96
    if abs(dx) >= abs(dy):
        return 0 if dx < 0 else 1
    return 2 if dy < 0 else 3


def vecinas_por_puertas(r):
    """[(sala de destino, lado)] por cada puerta de la sala."""
    return [(e, lado_de_puerta(x, y)) for (_p, _t, y, x, e) in puertas(r)]


def ascensor(r):
    """p00:432D/431F: (dos bytes, [(sala, b, c), ...]) del ascensor r (0xF0+)."""
    k = r - 0xF0
    d = palabra(4, 0x8DA8 + 2 * k)
    fines = sorted({palabra(4, 0x8DA8 + 2 * i) for i in range(11)} | {0x8E0E})
    z = min(f for f in fines if f > d)
    cab = (leer(4, d), leer(4, d + 1))
    paradas = []
    a = d + 2
    while a + 3 <= z:
        paradas.append((leer(4, a), leer(4, a + 1), leer(4, a + 2)))
        a += 3
    return cab, paradas


def main(argv):
    if len(argv) > 1 and argv[1] == "vecinas":
        bien = mal = 0
        for r in range(N_SALAS):
            for k, v in enumerate(vecinas(r)):
                if v is None or v >= N_SALAS:
                    continue
                otro = k ^ 1
                if vecinas(v)[otro] == r:
                    bien += 1
                else:
                    mal += 1
                    print("  %3d -> %s -> %3d, pero %3d -> %s -> %s" % (
                        r, LADOS[k], v, v, LADOS[otro], vecinas(v)[otro]))
        print("vecinas simetricas: %d; asimetricas: %d" % (bien, mal))
    elif len(argv) > 1 and argv[1] == "ascensores":
        for r in range(0xF0, 0xFB):
            cab, paradas = ascensor(r)
            print("ascensor 0x%02X: %s paradas %s" % (
                r, cab, " ".join("%d" % p[0] for p in paradas)))
    else:
        print(__doc__)


if __name__ == "__main__":
    main(sys.argv)
