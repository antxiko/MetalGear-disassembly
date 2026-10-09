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


def pixeles_de_dibujo_abajo(a, x, y):
    """Como pixeles_de_dibujo, pero con el bit 0 de 0xC168 puesto (L_51BC):
    la ficha t sale de la pagina 1 en (8 x (t mod 32), 128 + 8 x (t / 32)),
    lo que cargan p00:4B4A-4BAB (pagina1.pagina1). Las fichas que no carga
    nadie quedan a 0 y TIMP no las copia: se devuelven aparte."""
    import pagina1 as P1
    p1 = P1.pagina1()
    px, faltan = {}, set()
    filas, columnas, t = dibujo(a)
    for f in range(filas):
        for c in range(columnas):
            sx, sy = 8 * (t[f][c] % 32), 128 + 8 * (t[f][c] // 32)
            if (sx, sy) not in p1:
                faltan.add(t[f][c])
                continue
            for yy in range(8):
                for xx in range(8):
                    col = p1[(sx + xx, sy + yy)]
                    if col:
                        px[(x + 8 * c + xx, y + 8 * f + yy)] = col
    return px, faltan


def pantalla_del_transceptor(rotulos=True):
    """p01:6912: paleta p05:8B1E (L_4AAA) encima de la del juego, 0xC168 = 1
    y los dibujos p15:B369 en (0x30, 0x18) y p15:B40D (el retrato) en (0xC8,
    0x28) con L_449E; luego el rotulo p06:B833 (p00:4BB1 -> L_510C).
    SUPOSICION: la fuente de la pagina 1 es la que cargo el titulo (las
    fichas de sala y los objetos no pisan las lineas 64-95). Lo que pintan
    L_6B04 y L_69B3 NO esta. Devuelve ({(x, y): color}, paleta, fichas sin
    cargar)."""
    pal = S.aplica_paleta(S.paleta_de_juego(), 4, 0x8B1E)
    px, faltan = pixeles_de_dibujo_abajo(0xB369, 0x30, 0x18)
    p2, f2 = pixeles_de_dibujo_abajo(0xB40D, 0xC8, 0x28)
    px.update(p2)
    if rotulos:
        px.update(rotulo(4, 0xB833))
    return px, pal, faltan | f2


def fuente():
    """{(x, y): color} de la pagina 1 con la fuente que carga L_B05C (p09):
    L_505D pinta cada caracter de 8 bytes de 1 bit (L_50E6: bit 1 = el
    color C, bit 0 = 0) en la (X, Y) de DE, 8 a la derecha cada vez y a la
    fila siguiente al dar la vuelta (L_51D8):
      p09:B06D  108 caracteres de p09:B0B2 desde (0x00, 0x40), color 0x0E;
      p09:B079  13 de p09:B412 desde (0x98, 0x58), color 0x08;
      p09:B085  1 de p09:B10A (la estrella, el caracter 11) en (0x58, 0x40),
                color 0x06."""
    p1 = {}
    for (src, x, y, n, color) in ((0xB0B2, 0x00, 0x40, 108, 0x0E),
                                  (0xB412, 0x98, 0x58, 13, 0x08),
                                  (0xB10A, 0x58, 0x40, 1, 0x06)):
        for k in range(n):
            for f in range(8):
                b = leer(7, src + 8 * k + f)
                for xx in range(8):
                    p1[(x + xx, y + f)] = color if b & (0x80 >> xx) else 0
            x = (x + 8) & 0xFF
            if x == 0:
                y += 8
    return p1


def rotulo(trio, a, p1=None):
    """L_510C: [X][Y] y caracteres hasta 0xFF (0xFE trae otra [X][Y]). El
    caracter c sale de la pagina 1 en la ficha c + 0x10, 0x30 lineas mas
    abajo (L_5135 -> L_51AE); el 0 de (0, 0) (el hueco). L_4FCD con A = 1:
    HMMM de la pagina 1 a la 0, opaco. Avanza 8 (4 con 0x97 y 0x98)."""
    if p1 is None:
        p1 = fuente()
    px = {}
    x, y = leer(trio, a), leer(trio, a + 1)
    a += 2
    while True:
        c = leer(trio, a)
        a += 1
        if c == 0xFF:
            return px
        if c == 0xFE:
            x, y = leer(trio, a), leer(trio, a + 1)
            a += 2
            continue
        if c == 0:
            sx, sy = 0, 0
        else:
            t = (c + 0x10) & 0xFF
            sx, sy = 8 * (t % 32), 8 * (t // 32) + 0x30
        for j in range(8):
            for i in range(8):
                px[(x + i, y + j)] = p1.get((sx + i, sy + j), 0)
        x += 4 if c in (0x97, 0x98) else 8


def pantalla_de_titulo():
    """El titulo en su sitio (titulo()) y el rotulo p09:B58A que escribe
    p09:B579 ("(C) KONAMI 1987", "PUSH SPACE KEY")."""
    px, pal = titulo()
    px.update(rotulo(7, 0xB58A))
    return px, pal


def titulo(y=0x20):
    """El titulo (p09:B4DA-B503 y el menu p09:B515):
      - L_B0A3: L_4F91 (HMMV) pone a 0 la esquina (0,0) de la pagina 1, 24 x
        8: la ficha 0 queda vacia.
      - L_B5B5: la tabla de colores de 0xE700 = p09:B5AD; L_524C (0x4168)
        carga 70 fichas en 3 planos de p09:B8B9 en la VRAM 0x8004 (fichas
        1-70); L_B5E0 pone con L_518A (HMMM, opaca, pagina 1 -> 1) los
        dibujos p09:B618 (13 columnas x 4 filas) en (0x20, 0x68) y p09:B64C
        (9 x 4) en (0x88, 0x70). OJO: aqui el ancho va en B y el alto en C,
        no en la ROM.
      - Paleta p09:B602 (0x4118 = L_4EC4): fija 2, 3, 4, 5, 9, 10 y 14, que
        son los de la tabla menos el 0.
      - L_B534 copia con TIMP (A = 0x48) (0x20, 0x68) de 0x68 x 0x20 a (0x20,
        y) y (0x88, 0x68) de 0x48 x 0x20 a (0x88, y + 8), con y de p09:B5F7
        (0xC0 ... 0x20: el titulo sube) y se queda en y = 0x20 (p09:B55F).
        La segunda copia corta la ultima fila del segundo dibujo (la ficha
        0x46) y arrastra 8 lineas de la pagina 1 que nadie limpia a la
        vista: SUPOSICION, que estan a 0.
    Devuelve ({(x, y): color}, paleta)."""
    colores = [leer(7, 0xB5AD + i) for i in range(8)]
    p1 = {}
    fichas = {0: [[0] * 8 for _ in range(8)]}
    for k in range(70):
        fichas[k + 1] = [[colores[c] for c in fila] for fila in S.ficha_3_planos(7, 0xB8B9 + 24 * k)]
    for (a, x0, y0, cols, filas) in ((0xB618, 0x20, 0x68, 13, 4), (0xB64C, 0x88, 0x70, 9, 4)):
        for f in range(filas):
            for c in range(cols):
                fi = fichas[leer(7, a + cols * f + c)]
                for yy in range(8):
                    for xx in range(8):
                        p1[(x0 + 8 * c + xx, y0 + 8 * f + yy)] = fi[yy][xx]
    px = {}
    for (sx, sy, w, h, dx, dy) in ((0x20, 0x68, 0x68, 0x20, 0x20, y), (0x88, 0x68, 0x48, 0x20, 0x88, y + 8)):
        for j in range(h):
            for i in range(w):
                col = p1.get((sx + i, sy + j), 0)
                if col:
                    px[(dx + i, dy + j)] = col
    pal = S.aplica_paleta(S.paleta_de_arranque(), 7, 0xB602)
    return px, pal


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
