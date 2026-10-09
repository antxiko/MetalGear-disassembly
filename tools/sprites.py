#!/usr/bin/env python3
"""Los sprites de Metal Gear, leidos de la ROM como los lee el juego.

Todo sale de rutinas del listado, citadas en cada funcion. Las tablas estan
declaradas en src/pNN.notes (bloques.py). Sprites de 16 x 16 (los patrones
que usan las tablas van de 4 en 4) en modo 2 del V9938: el color va por
sprite (el juego copia el mismo byte a las 16 lineas), el bit 6 (CC) suma
el color al del sprite anterior donde se pisan, el bit 7 (EC) lo corre 32
puntos a la izquierda; el color 0 es transparente.

  - Patrones de la sala: el juego de sprites de la sala (p10:6185, 0xC130)
    da en p10:6280 una lista de ternas [patron][origen] que p00:4A44-4A79
    descomprime con L_4DD5 en la VRAM 0xF800 + 8 x patron.
  - Patrones de Snake: 53 juegos (p10:6000, 0xC18A) descomprimidos con
    L_53AB en 0xF800 (patrones 0 en adelante); sus atributos, en las listas
    de p10:609F ([cuantos] y fichas [y][x][patron][color], p00:5318-535A).
  - Actores: por sala, [cuantos] y ternas [tipo][y][x] (p05:9560, p00:564C);
    por tipo, cuantos sprites (p05:971C) y un color por sprite (p05:975A);
    el cuadro (ix+0x0B) da en p05:9890 la lista [y][x][patron] por sprite,
    o un byte 0x91-0xA5 que trae las parejas [y][x] del grupo p00:556F y
    deja en la lista solo los patrones (p00:5506-556C).
  - Paleta: la de arranque (p00:4EA4), la de Snake (p00:4AA3: colores 7 y
    10), la del juego (p05:8B0B, L_4A92), la de la sala (p05:8BBE) y
    encima la del juego de sprites
    (p05:8CB4), en ese orden (p01:6E6D-6E88).
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from bloques import leer, palabra, ROM          # noqa: E402
import salas as S                                # noqa: E402

VRAM_PATRONES = 0xF800
N_JUEGOS = 32            # punteros en p10:6280
N_JUEGOS_SNAKE = 53      # punteros en p10:6000
N_CUADROS = 143          # punteros en p05:9890
N_TIPOS = 64             # destinos del despachador p00:575F


# ---------------------------------------------------------------- patrones

def descomprime(trio, a, destino, vram, con_destino=True):
    """L_4DD5 (con_destino) o L_53AB: n == 0 acaba; n < 0x80 repite el
    byte siguiente n veces; n == 0x80 trae otro destino (2 bytes, solo en
    L_4DD5; en L_53AB acaba); n > 0x80 copia n & 0x7F bytes tal cual.
    Escribe en vram (los 2048 bytes de 0xF800-0xFFFF). Devuelve los bytes
    que se salieron de la tabla de patrones."""
    fuera = 0
    d = destino

    def pon(b):
        nonlocal d, fuera
        k = d - VRAM_PATRONES
        if 0 <= k < len(vram):
            vram[k] = b
        else:
            fuera += 1
        d += 1

    while True:
        n = leer(trio, a)
        a += 1
        if n == 0:
            return fuera
        if n < 0x80:
            b = leer(trio, a)
            a += 1
            for _ in range(n):
                pon(b)
        elif n == 0x80:
            if not con_destino:
                return fuera
            d = palabra(trio, a)
            a += 2
        else:
            for _ in range(n & 0x7F):
                pon(leer(trio, a))
                a += 1


def patrones_del_juego(j):
    """p00:4A44-4A79: los patrones del juego de sprites j (ternas
    [patron][origen lo][origen hi] hasta 0xFF en p10:6280[j], trio
    10-11-12 puesto) en la VRAM 0xF800 + 8 x patron. Devuelve (los 2048
    bytes de patrones, {patron de 16 x 16 cargado})."""
    vram = bytearray(2048)
    cargados = set()
    p = palabra(10, 0x6280 + 2 * j)
    while leer(10, p) != 0xFF:
        patron, origen = leer(10, p), palabra(10, p + 1)
        antes = bytes(vram)
        descomprime(10, origen, VRAM_PATRONES + 8 * patron, vram)
        for k in range(0, 2048, 32):
            if vram[k:k + 32] != antes[k:k + 32]:
                cargados.add(k // 8)
        p += 3
    return vram, cargados


def patrones_de_snake(k):
    """L_53AB: el juego k de patrones de Snake (p10:6000[k], 0xC18A), en
    0xF800 en adelante."""
    vram = bytearray(2048)
    descomprime(10, palabra(10, 0x6000 + 2 * k), VRAM_PATRONES, vram, con_destino=False)
    return vram


def patrones_del_arma(w):
    """p00:4BF6-4C08: los patrones del proyectil del arma w (1-15, 0xC134)
    de p10:6392 en la VRAM 0xF880 (patron 0x10); las armas 4 y 7 no cargan
    nada. Devuelve los 2048 bytes."""
    vram = bytearray(2048)
    if w in (4, 7):
        return vram
    descomprime(10, palabra(10, 0x6392 + 2 * (w - 1)), VRAM_PATRONES + 0x80, vram)
    return vram


def sprite16(vram, patron):
    """Las 16 filas (16 bits, el bit 15 a la izquierda) del sprite de 16 x
    16 cuyo patron es `patron`: 32 bytes desde 0xF800 + 8 x patron, arriba-
    izquierda, abajo-izquierda, arriba-derecha, abajo-derecha."""
    b = 8 * patron
    return [(vram[b + y] << 8) | vram[b + 16 + y] for y in range(16)]


# ---------------------------------------------------------------- paletas

def paleta_de_snake(pal):
    """p00:4A9D: las dos ternas de p00:4AA3 (colores 7 y 10) encima."""
    return S.aplica_paleta(pal, 0, 0x4AA3)


def paleta_de_sprites(pal, j):
    """p00:4AB5-4B10: la paleta del juego de sprites j (p05:8CB4[j], ternas
    hasta 0xFF) encima de pal."""
    return S.aplica_paleta(pal, 4, palabra(4, 0x8CB4 + 2 * j))


def juego_de_sala(r):
    """p00:4A4A: el juego de sprites de la sala (p10:6185 + sala)."""
    return leer(10, 0x6185 + r)


def paleta_de_sala(r):
    """La paleta con la que se ve la sala r con sus sprites: arranque,
    Snake, la del juego (L_4A92, p05:8B0B), sala y juego de sprites, en el
    orden de p01:6E6D-6E88 (8B0B no toca el 7 ni el 10 de Snake)."""
    pal = S.paleta_de_juego()          # ya lleva la de Snake
    pal = S.aplica_paleta(pal, 4, palabra(4, 0x8BBE + 2 * S.nibble(4, 0x8B40, r)))
    return paleta_de_sprites(pal, juego_de_sala(r))


# ---------------------------------------------------------------- actores

def actores_de_sala(r):
    """p00:564C-566C: [(tipo, y, x)] de la sala r (p05:9560; las salas
    0xDE en adelante no tienen lista)."""
    if r >= 0xDE:
        return []
    p = palabra(4, 0x9560 + 2 * r)
    n = leer(4, p) & 0x0F
    return [(leer(4, p + 1 + 3 * i), leer(4, p + 2 + 3 * i), leer(4, p + 3 + 3 * i))
            for i in range(n)]


def sprites_por_tipo(t):
    """p00:56CA: cuantos sprites lleva el tipo t (p05:971B + tipo)."""
    return leer(4, 0x971B + t)


def colores_por_tipo(t):
    """p00:5745/57EC: el color de cada sprite del tipo t (p05:975A[t])."""
    p = palabra(4, 0x975A + 2 * t)
    return [leer(4, p + i) for i in range(sprites_por_tipo(t))]


def cuadro(c, n):
    """p00:5506-556C: los n sprites del cuadro c: [(dy, dx, patron)]. Un
    byte 0x91-0xA5 trae las parejas [dy][dx] del grupo p00:556F[b - 0x91]
    y deja en la lista un patron por sprite que falte."""
    a = palabra(4, 0x9890 + 2 * c)
    out = []
    while len(out) < n:
        b = leer(4, a)
        if 0x91 <= b <= 0xA5:
            g = palabra(4, 0x556F + 2 * (b - 0x91))
            a += 1
            while len(out) < n:
                out.append((leer(4, g), leer(4, g + 1), leer(4, a)))
                g += 2
                a += 1
            break
        out.append((b, leer(4, a + 1), leer(4, a + 2)))
        a += 3
    return out


def con_signo(b):
    return b - 256 if b >= 0x80 else b


FIN_DE_CUADROS = 0x9DA5      # donde empiezan los grupos (el menor puntero de p00:556F)


def largo_de_cuadro(c):
    """Cuantos sprites caben en la lista del cuadro c antes de que empiece
    la siguiente (o los grupos, en el ultimo): k ternas y, si hay byte de
    grupo, un patron por cada byte que quede. Es la cuenta de sprites con
    la que el cuadro cuadra: con otra, p00:5526 se saldria de su lista."""
    a = palabra(4, 0x9890 + 2 * c)
    z = palabra(4, 0x9890 + 2 * c + 2) if c + 1 < N_CUADROS else FIN_DE_CUADROS
    k = 0
    while a + 3 * k < z:
        if 0x91 <= leer(4, a + 3 * k) <= 0xA5:
            return k + (z - (a + 3 * k) - 1)
        k += 1
    return k if a + 3 * k == z else -1


def sprites_de_actor(t, c, y=0, x=0, n=None, envuelve=True):
    """Los sprites del actor de tipo t en el cuadro c, puesto en (y, x):
    [(y, x, patron, color)] en orden de prioridad (p00:56E3 da los huecos
    de la tabla de atributos en orden). n cambia la cuenta de sprites (las
    explosiones, p01:7553). Con envuelve, las sumas son de 8 bits como en
    el juego; sin el, los desplazamientos van con signo (para recortar)."""
    cols = colores_por_tipo(t)
    n = len(cols) if n is None else n
    cols = (cols + [0x02, 0x4D] * n)[:n]
    out = []
    for i, (dy, dx, p) in enumerate(cuadro(c, n)):
        if envuelve:
            out.append(((y + dy) & 0xFF, (x + dx) & 0xFF, p, cols[i]))
        else:
            out.append((y + con_signo(dy), x + con_signo(dx), p, cols[i]))
    return out


def cuadro_de_snake(k, y=0, x=0, envuelve=True):
    """p00:5318-535A: los sprites de Snake con el juego k de patrones: la
    lista de atributos p10:609F[p10:606A[k]], [cuantos] y fichas
    [y][x][patron][color]; y == 0x80 esconde el sprite (y = 0xE0)."""
    p = palabra(10, 0x609F + 2 * leer(10, 0x606A + k))
    n = leer(10, p)
    out = []
    for i in range(n):
        dy, dx, pat, col = (leer(10, p + 1 + 4 * i + j) for j in range(4))
        if dy == 0x80:
            continue
        if envuelve:
            out.append(((y + dy) & 0xFF, (x + dx) & 0xFF, pat, col))
        else:
            out.append((y + con_signo(dy), x + con_signo(dx), pat, col))
    return out


# ---------------------------------------------------------------- pintar

def compone(sprites, vram):
    """Lo que deja el V9938 en pantalla con esos sprites (modo 2): {(x, y):
    color 1-15}. Un sprite con CC (bit 6) se encadena al anterior y en cada
    punto el color es el OR de los de la cadena que tienen punto; las
    cadenas se pintan por prioridad (la primera, encima). EC (bit 7) resta
    32 a x. La fila mostrada es y + 1. El color 0 no se pinta."""
    cadenas = []
    for s in sprites:
        if (s[3] & 0x40) and cadenas:
            cadenas[-1].append(s)
        else:
            cadenas.append([s])
    px = {}
    for cadena in cadenas:
        puntos = {}
        for (y, x, patron, col) in cadena:
            c = col & 0x0F
            if c == 0:
                continue
            x0 = x - 32 if col & 0x80 else x
            for fy, fila in enumerate(sprite16(vram, patron)):
                for fx in range(16):
                    if fila & (0x8000 >> fx):
                        k = (x0 + fx, (y + 1 + fy) & 0xFF)
                        puntos[k] = puntos.get(k, 0) | c
        for k, c in puntos.items():
            if k not in px:
                px[k] = c
    return px


def caja(px):
    xs = [k[0] for k in px]
    ys = [k[1] for k in px]
    return min(xs), min(ys), max(xs) + 1, max(ys) + 1


# ---------------------------------------------------------------- cli

def resumen_de_juegos():
    for j in range(N_JUEGOS):
        _, cargados = patrones_del_juego(j)
        salas = [r for r in range(S.N_SALAS) if S.es_sala(r) and juego_de_sala(r) == j]
        print("juego %2d: %2d sprites de 16 x 16 (patrones %s), %d salas%s" % (
            j, len(cargados), ("%02X-%02X" % (min(cargados), max(cargados))) if cargados else "-",
            len(salas), " (%s...)" % " ".join(str(r) for r in salas[:8]) if salas else ""))


def main(argv):
    if len(argv) > 1 and argv[1] == "juegos":
        resumen_de_juegos()
    elif len(argv) > 1 and argv[1] == "actores":
        for r in range(0xDE):
            a = actores_de_sala(r)
            if a:
                print("sala %3d (juego %2d): %s" % (r, juego_de_sala(r),
                      " ".join("t%d@%d,%d" % (t, y, x) for (t, y, x) in a)))
    else:
        print(__doc__)


if __name__ == "__main__":
    main(sys.argv)
