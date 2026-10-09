#!/usr/bin/env python3
"""Los dibujos de fichas que el juego pone ENCIMA de una sala ya pintada.

Todo sale de rutinas del listado, citadas en cada funcion.

  - L_44AF (entrada 0x4104; L_44A7 = 0x40F0 y L_44AC = 0x4109 con el
    dibujo ya puesto): pone los bancos 13-14-15 (L_4276) y lee del banco 15
    [filas][columnas] y filas x columnas numeros de ficha. El bucle de
    dentro (djnz, p00:44C9-44D6) avanza la X 8 puntos por columna y el de
    fuera (dec c) baja la Y 8 por fila: el PRIMER byte es el alto. Cada
    numero se escribe en el mapa de la sala (0xE000 + 32 x fila + columna,
    L_5C09) y su ficha se copia de la pagina 1 con L_5169: la ficha t vive
    en (8 x (t mod 32), 8 x (t / 32)) (L_51AE; con el bit 0 de 0xC168, 128
    lineas mas abajo, L_51BC), copia de 8 x 8 con A = 0x48 = LMMM con TIMP.
  - DE trae el sitio: D = X, E = Y (los dos van tal cual a R#36 y R#38 en
    L_5011).
  - Jefes, al entrar en la sala (p01:6EAA-6EB3, si 0xC6A0 no es 0; ese
    byte esta SIN LEER): p12:BC26 pinta p15:B595 en (0x60, 0x20) si el
    primer actor (0xD000) es del tipo 0x11 (Pazos: METAL_GEAR), y p03:B862
    pinta p15:B431 en (0x40, 0x00) si es del tipo 0x26 (Pazos: HIND_D). Sus
    otros dibujos (p15:B5F7 por p12:BC36 desde p01:767E, y p15:B4E3 por
    p03:B8C6 desde p01:7695), pintados en el mismo sitio, son el SUELO de
    la sala sin el jefe (fichas de suelo y cajas: visto al dibujarlos): lo
    que queda cuando el jefe ya no esta.
  - Puertas de los tipos 7-19 (p01:780F-784E): el despachador p01:773C
    da a cada tipo un dibujo del banco 15; p01:7853 guarda lo de debajo en
    0xE600 (L_45EF) y p01:7858 lo pinta con L_44AF en (0xEC00) = bytes 5
    (Y) y 6 (X) del registro de la puerta (p00:441A), los de la ficha.
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from bloques import leer                       # noqa: E402
import salas as S                              # noqa: E402

TRIO = 13          # L_4276: 13-14-15, el banco 15 en 0xA000-0xBFFF

# p01:780F-784B, los tipos 7-19 en el orden de la tabla p01:773C
DIBUJO_DE_PUERTA = {
    7: 0xB0E2, 8: 0xB0FC, 9: 0xB102, 10: 0xB12B, 11: 0xB16E, 12: 0xB1AC,
    13: 0xB1AC, 14: 0xB1B2, 15: 0xB1DB, 16: 0xB1F5, 17: 0xB247, 18: 0xB261,
    19: 0xB29F,
}

# tipo del primer actor -> (dibujo, X, Y, quien lo pinta); y el otro dibujo
JEFES = {
    0x11: (0xB595, 0x60, 0x20, "p12:BC26"),
    0x26: (0xB431, 0x40, 0x00, "p03:B862"),
}
OTRO_DIBUJO_DE_JEFE = {0x11: (0xB5F7, "p12:BC36"), 0x26: (0xB4E3, "p03:B8C6")}


def dibujo(a):
    """(filas, columnas, [[numero de ficha]]) del dibujo en p15:a."""
    filas, columnas = leer(TRIO, a), leer(TRIO, a + 1)
    t = [[leer(TRIO, a + 2 + columnas * f + c) for c in range(columnas)] for f in range(filas)]
    return filas, columnas, t


def pixeles_de_dibujo(r, a, x, y):
    """{(x, y): color} que deja el dibujo p15:a puesto en (x, y) en la sala
    r, con las fichas que el juego de la sala tiene en la pagina 1 y sus
    indices pasados por la tabla de colores (p00:4B13, L_42C4). TIMP: el
    color 0 no se copia. Devuelve tambien las fichas que no estan cargadas."""
    j = S.juego_de_sala(r)
    if j not in S._JUEGOS:
        S._JUEGOS[j] = S.juego_de_fichas(j)
    fichas = S._JUEGOS[j]
    colores = S.colores_por_defecto()
    px, faltan = {}, set()
    filas, columnas, t = dibujo(a)
    for f in range(filas):
        for c in range(columnas):
            fi = fichas.get(t[f][c])
            if fi is None:
                faltan.add(t[f][c])
                continue
            for yy in range(8):
                for xx in range(8):
                    col = colores[fi[yy][xx]]
                    if col:
                        px[(x + 8 * c + xx, y + 8 * f + yy)] = col
    return px, faltan


def jefe_de_sala(r):
    """El primer actor de la sala, si es uno de los dos jefes que se pintan
    con fichas: (tipo, dibujo, X, Y, quien) o None."""
    import sprites as SP
    a = SP.actores_de_sala(r)
    if a and a[0][0] in JEFES:
        return (a[0][0],) + JEFES[a[0][0]]
    return None


def pixeles_de_jefe(r, otro=False):
    """El jefe de la sala pintado como lo deja la entrada a la sala (o, con
    otro=True, su otro dibujo)."""
    j = jefe_de_sala(r)
    if j is None:
        return {}, set()
    tipo, a, x, y, _ = j
    if otro:
        a = OTRO_DIBUJO_DE_JEFE[tipo][0]
    return pixeles_de_dibujo(r, a, x, y)


def pixeles_de_puertas_dibujadas(r):
    """Las puertas de los tipos 7-19 de la sala."""
    px, faltan = {}, set()
    for (_p, t, y, x, _e) in S.puertas(r):
        if t in DIBUJO_DE_PUERTA:
            p, f = pixeles_de_dibujo(r, DIBUJO_DE_PUERTA[t], x, y)
            px.update(p)
            faltan |= f
    return px, faltan


def main(argv):
    if len(argv) > 1 and argv[1] == "lista":
        for t, a in sorted(DIBUJO_DE_PUERTA.items()):
            f, c, _ = dibujo(a)
            salas = sorted({r for r in range(S.N_SALAS) if S.es_sala(r)
                            for (_p, tt, _y, _x, _e) in S.puertas(r) if tt == t})
            print("puerta tipo %2d: p15:%04X, %2d x %2d fichas, salas %s" % (t, a, f, c, salas))
        for tipo, (a, x, y, quien) in sorted(JEFES.items()):
            f, c, _ = dibujo(a)
            o = OTRO_DIBUJO_DE_JEFE[tipo]
            f2, c2, _ = dibujo(o[0])
            print("jefe 0x%02X: p15:%04X %d x %d en (%d, %d) por %s; otro p15:%04X %d x %d por %s"
                  % (tipo, a, f, c, x, y, quien, o[0], f2, c2, o[1]))
    else:
        print(__doc__)


if __name__ == "__main__":
    main(sys.argv)
