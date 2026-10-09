#!/usr/bin/env python3
"""Declara los bloques de datos que el codigo LEE, recorriendolos como el cartucho.

Un rango de datos no se declara porque sobre: se declara porque hay una
instruccion que lo lee. Aqui cada bloque sale de un LECTOR del listado (la
instruccion que carga el puntero y la rutina que recorre el formato), y su
final sale de RECORRER el formato como lo recorre esa rutina, o de la cuenta
que le pasa quien la llama, leida en el listado.

Metal Gear es MSX2 (SCREEN 5, 4 bits por punto, 128 bytes por linea). Los
lectores del banco 0 que importan aqui, con su direccion en NUESTRO listado:

  L_42B4   DE = tabla[A]: la palabra A de la tabla que apunta DE.
  L_42D1   un nibble por sala: (HL + sala/2), el alto en las salas pares.
  L_524C   fichas de 8 x 8 en 3 planos (24 bytes por ficha, L_5288: 3 bytes
           por fila) -> 4 bits por punto por la tabla de colores 0xE700 ->
           VRAM (L_509C). L_5265 lo mismo volteadas. L_51FE: 2 planos (16
           bytes por ficha). L_509C a secas: 32 bytes por ficha tal cual.
  L_505D   caracteres de 1 bit por punto (8 bytes) con un color (L_50E6).
  L_4DD5   patrones de sprite comprimidos: n == 0 acaba; n < 0x80 repite el
           byte siguiente n veces; n == 0x80 trae otro destino (2 bytes);
           n > 0x80 copia n & 0x7F bytes tal cual.
  L_53AB   lo mismo para el jugador, sin el caso 0x80 (n & 0x7F == 0 acaba).
  L_4EC4   paleta: ternas [registro][rojo-azul][verde] hasta 0xFF.
  L_510C   texto con posicion: [X][Y] (D y E del copiador) y bytes; 0xFE trae otra
           posicion; 0xFF acaba. L_5116 lo mismo sin la posicion inicial.
  L_52E0   texto de ventana: 0xFF acaba (y 0xFD acaba una pagina); >= 0xA1
           mete la lista 0xB8A7[n - 0xA1] del banco 12.
  L_4C9A   sala: 6 filas de 8 metafichas; cada metaficha, 16 bytes.
  L_49A7   fichas de un juego: [bits][cuantas][primera][origen lo][origen hi].
  p04:60B1 sonido: 0xFE 0x00 cambia de modo; 0xFE 0xFF lo hi llama; 0xFE n
           lo hi repite; 0xFF acaba o vuelve. Musica (p04:6212): Dx, Fx+1,
           E0-E7+nota, E8, EC+1, EF, E9/EA/EB/ED/EE+1+nota, nota. Efectos
           (p04:60C8): 2x [+len] [+2 si 28-2B], 1x, frecuencia (1 o 2 bytes
           segun los dos bits bajos del 2x).

Lo que sale se escribe, banco a banco, en una seccion delimitada de
src/pNN.notes que esta herramienta reescribe entera; lo de fuera no lo toca.
Un bloque que pise codigo trazado o una D escrita a mano NO se escribe: se
avisa, porque algo esta mal y hay que mirarlo.

Uso: bloques.py              informa de lo que encontraria
     bloques.py --escribe    y lo escribe en las notas
"""
import json
import os
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
from paginas import ORG, TAM_PAGINA, nombre          # noqa: E402

ROM = open(os.path.join(RAIZ, "metalgear.rom"), "rb").read()
CAB = "# --- BLOQUES QUE LEE EL CODIGO (seccion que reescribe tools/bloques.py; no editar a mano) ---"
FIN = "# --- fin de los bloques de bloques.py ---"

# Los trios del mapper: con 4-5-6 puesto, 0x6000 es el banco 4, 0x8000 el 5
# y 0xA000 el 6 (p00:424E); 7-8-9 (p00:426A); 10-11-12 (p00:4270); 13-14-15
# (p00:4276). Los bancos de ZONA (6, 9, 12, 15) tambien entran por 0xF0F6.
def banco(trio, a):
    """El banco que hay en la direccion a con el trio puesto."""
    if 0x4000 <= a < 0x6000:
        return 0
    return trio + ((a - 0x6000) >> 13)


def leer(trio, a):
    b = banco(trio, a)
    return ROM[b * TAM_PAGINA + (a - ORG[b])]


def palabra(trio, a):
    return leer(trio, a) | (leer(trio, a + 1) << 8)


BLOQUES = []       # dict(p, ini, fin, nombre, texto, lectores, F)
AVISOS = []


def declara(trio, ini, fin, nom, texto, lectores, F=None):
    """Un bloque [ini, fin) de la ventana con el trio puesto; si cruza de
    banco se parte y cada trozo dice de donde viene y a donde sigue."""
    if fin <= ini:
        AVISOS.append("bloque vacio %s en %04X" % (nom, ini))
        return
    if isinstance(lectores, str):
        lectores = [lectores]
    if fin > 0xC000 or ini < 0x4000:
        AVISOS.append("bloque %s %04X-%04X se sale de la ventana: no se declara" % (nom, ini, fin))
        return
    a = ini
    while a < fin:
        b = banco(trio, a)
        tope = ORG[b] + TAM_PAGINA
        z = min(fin, tope)
        t = texto
        if a > ini:
            t += " (sigue del banco %d)" % banco(trio, a - 1)
        if z < fin:
            t += " (sigue en el banco %d, en 0x%04X)" % (banco(trio, z), z)
        BLOQUES.append(dict(p=b, ini=a, fin=z, nombre=nom if a == ini else nom + "_cola",
                            texto=t, lectores=list(lectores), F=F))
        a = z


# ---------------------------------------------------------------- formatos

def paleta(trio, a):
    """Ternas [registro][RB][G] hasta 0xFF (L_4EC4). Devuelve el final."""
    while leer(trio, a) != 0xFF:
        a += 3
    return a + 1


def texto_pos(trio, a, con_pos=True):
    """L_510C: [fila][col] y bytes; 0xFE trae otra posicion; 0xFF acaba."""
    if con_pos:
        a += 2
    while True:
        c = leer(trio, a)
        a += 1
        if c == 0xFF:
            return a
        if c == 0xFE:
            a += 2


def rle_sprite(trio, a):
    """L_4DD5. Devuelve el final (tras el 0)."""
    while True:
        n = leer(trio, a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        elif n == 0x80:
            a += 2
        else:
            a += n & 0x7F


def rle_jugador(trio, a):
    """L_53AB: n < 0x80 copia n bytes; n > 0x80 repite el siguiente; 0 acaba."""
    while True:
        n = leer(trio, a)
        a += 1
        if (n & 0x7F) == 0:
            return a
        if n < 0x80:
            a += 1
        else:
            a += n & 0x7F


def palabras_hasta_primer_destino(trio, a):
    """Una tabla de punteros que acaba donde empieza lo que apunta: el
    numero de palabras es (minimo de los destinos - inicio) / 2."""
    n = 0
    minimo = 0x10000
    while a + 2 * n < minimo:
        w = palabra(trio, a + 2 * n)
        if w < a:
            break
        minimo = min(minimo, w)
        n += 1
    return n


# --------------------------------------------------------------- el sonido

def sonido_musica(trio, a, estado):
    """Un comando de musica (p04:6212). Devuelve cuantos bytes ocupa."""
    i = a
    b = leer(trio, i)
    if (b & 0xF0) == 0xD0:
        i += 1
        b = leer(trio, i)
    if b >= 0xF0:
        i += 2
        b = leer(trio, i)
    if b >= 0xE0:
        n = b & 0x0F
        if n < 8:
            i += 1
        elif n == 8:
            return i + 1 - a
        elif n == 0xC:
            return i + 2 - a
        elif n == 0xF:
            return i + 1 - a
        else:
            i += 2
    return i + 1 - a


def sonido_efecto(trio, a, estado):
    """Un registro de efecto (p04:60C8/6105/6122). estado['s5'] es (ix+5)."""
    i = a
    b = leer(trio, i)
    if (b & 0xF0) == 0x20:
        estado["s5"] = b
        if b == 0x20:
            return 2
        i += 2
        if (b & 0x0C) == 0x08:
            i += 2
    b = leer(trio, i)
    if (b & 0xF0) == 0x10:
        i += 1
    i += 1
    if (estado["s5"] & 3) != 1:
        i += 1
    return i - a


def recorre_sonido(trio, inicio, visitados, llamadas):
    """Sigue un canal desde inicio: devuelve el conjunto de direcciones que
    recorre, metiendo en `llamadas` los destinos de 0xFE 0xFF y 0xFE n."""
    pila = [(inicio, 1, {"s5": 0x21})]
    tocados = set()
    while pila:
        a, modo, estado = pila.pop()
        estado = dict(estado)
        while a not in visitados and a < 0x10000:
            b = leer(trio, a)
            if b == 0xFE:
                v = leer(trio, a + 1)
                if v == 0:
                    tocados.update((a, a + 1))
                    visitados.update((a, a + 1))
                    a += 2
                    modo ^= 1
                    continue
                dest = palabra(trio, a + 2)
                tocados.update(range(a, a + 4))
                visitados.update(range(a, a + 4))
                llamadas[dest].add(a)
                pila.append((dest, modo, estado))
                a += 4
                continue
            if b == 0xFF:
                tocados.add(a)
                visitados.add(a)
                break
            n = (sonido_musica if modo else sonido_efecto)(trio, a, estado)
            tocados.update(range(a, a + n))
            visitados.update(range(a, a + n))
            a += n
    return tocados


def tramos(conjunto):
    xs = sorted(conjunto)
    out = []
    for x in xs:
        if out and out[-1][1] == x:
            out[-1][1] = x + 1
        else:
            out.append([x, x + 1])
    return [tuple(t) for t in out]


def sonido():
    T = 4
    declara(T, 0x6078, 0x607F, "codigo_sin_entrada_6078",
            "7 bytes de codigo al que no llega nadie (`ld h,0 / call 0x6434 / "
            "jr 0x6070`): entre el `ret` de 0x6077 y la rutina de 0x607F", "nadie")
    declara(T, 0x63FD, 0x6409, "periodo_de_las_12_notas",
            "el periodo del PSG (byte bajo) de las 12 notas de la octava mas "
            "aguda, que p04:62DC lee en 0x63FD + nota y desplaza (ix+9) veces "
            "a la izquierda para bajar de octava", "p04:62DC", F=12)
    declara(T, 0x652B, 0x6535, "indice_de_instrumentos",
            "5 punteros, instrumentos 1-5, que p04:62FE lee en 0x6529 + 2 x "
            "instrumento: cada uno es una tabla de 12 palabras, una por nota "
            "(p04:6316 suma 2 x nota), con la secuencia de registros de efecto "
            "de esa nota", "p04:62FE", F="w5")
    vistos = set()
    for k in range(5):
        t = palabra(T, 0x652B + 2 * k)
        declara(T, t, t + 24, "instrumento_%d" % (k + 1),
                "el instrumento %d: 12 punteros, uno por nota, a su secuencia "
                "de registros de efecto (p04:631D los pone en (ix+0x11)); el 1 "
                "es la bateria, un golpe distinto por nota" % (k + 1), "p04:631D", F="w6")
        for n in range(12):
            d = palabra(T, t + 2 * n)
            if d in vistos:
                continue
            vistos.add(d)
            z = d
            est = {"s5": 0x21}
            while leer(T, z) != 0xFF:
                z += sonido_efecto(T, z, est)
            declara(T, d, z + 1, "nota_%04X" % d,
                    "la nota %d del instrumento %d: registros de efecto hasta "
                    "0xFF, uno por tic (p04:632B -> p04:60C8)" % (n, k + 1), "p04:632B")
    # el indice de sonidos: 0x6890 + 2 x numero; cada sonido ocupa 1, 3 o 4
    # palabras seguidas (p04:681E: B = canales), asi que los numeros de las
    # musicas van de 3 en 3
    declara(T, 0x6892, 0x6950, "indice_de_sonidos",
            "95 punteros, sonidos 1-95 (p04:6858 lee 0x6890 + 2 x numero; el "
            "del 0 serian los dos ultimos bytes de codigo): cada sonido se lleva B palabras seguidas, una por canal "
            "(p04:681E: 1 los efectos 1-0x28, 3 las musicas 0x29-0x5B, 4 las de "
            "0x5C en adelante), asi que los numeros de las musicas van de 3 en 3",
            "p04:6858", F="w8")
    visitados = set()
    llamadas = defaultdict(set)
    canales = {}
    for k in range(1, 96):
        d = palabra(T, 0x6890 + 2 * k)
        if not (0x6950 <= d < 0x8800):
            continue
        canales[k] = d
    for k, d in sorted(canales.items()):
        t = recorre_sonido(T, d, visitados, llamadas)
        for i, f in tramos(t):
            declara(T, i, f, "sonido_%02X_%04X" % (k, i),
                    "canal del sonido 0x%02X (palabra %d del indice): comandos "
                    "del controlador de p04:60B1 hasta 0xFF" % (k, k), "p04:60B1")
    for dest in sorted(llamadas):
        if dest in visitados:
            continue
        t = recorre_sonido(T, dest, visitados, llamadas)
        for i, f in tramos(t):
            declara(T, i, f, "trozo_%04X" % i,
                    "trozo de musica al que saltan %d sitios (0xFE 0xFF lo hi "
                    "llama, 0xFE n lo hi repite): %s" % (
                        len(llamadas[dest]),
                        ", ".join("%04X" % x for x in sorted(llamadas[dest])[:6])),
                    "p04:64D5")


# ------------------------------------------------------------ las fichas

def fichas(trio, ini, n, nom, texto, lector, planos=3):
    por = {3: 24, 2: 16, 4: 32, 1: 8}[planos]
    declara(trio, ini, ini + n * por, nom, texto, lector, F=por)
    return ini + n * por


def tilesets():
    T = 7
    declara(T, 0x6000, 0x607E, "juego_de_fichas_por_sala",
            "el juego de fichas de cada sala, un nibble por sala (252 salas: el "
            "alto en las pares, p00:493E con L_42D1); vale 0-7 y elige en 0x607E",
            "p00:493E", F=16)
    declara(T, 0x607E, 0x608E, "indice_de_juegos_de_fichas",
            "8 punteros, juegos 0-7, a los descriptores de 0x608E (p00:4961)",
            "p00:4961", F="w8")
    declara(T, 0x608E, 0x60DB, "descriptores_de_los_juegos",
            "hasta 3 fichas de 5 bytes por juego: [bits][cuantas][primera "
            "ficha][origen lo][origen hi]; bit 7 acaba, bit 6 = las mismas "
            "fichas que la anterior, volteadas (p00:4969/49A7, L_5265). Las "
            "volteadas solo usan 2 bytes, y el descriptor del juego siguiente "
            "empieza encima de los otros 3", "p00:4969", F=5)
    declara(T, 0x60DB, 0x60E9, "indice_de_colisiones",
            "7 punteros, juegos 0-6, a 32 bytes de bits de colision (p00:4986 "
            "lee 0x60DB + 2 x juego); el juego 7 caeria en 0x60E9, el primer "
            "word de los bits del juego 0", "p00:4986", F="w7")
    for j in range(7):
        d = palabra(T, 0x60DB + 2 * j)
        declara(T, d, d + 32, "colisiones_juego_%d" % j,
                "256 bits, uno por ficha del juego %d: p00:4992 los desdobla "
                "en 0xC700-0xC7FF (1 = la ficha choca)" % j, "p00:4992", F=8)
    for d, n, vram, lec in ((0x61C9, 16, "0xD060", "p00:4A01"), (0x63C9, 16, "0xE060", "p00:4A0B"),
                            (0x65C9, 4, "0xD070", "p00:4A18"), (0x6649, 4, "0xD074", "p00:4A22"),
                            (0x66C9, 4, "0xE070", "p00:4A2E")):
        fichas(T, d, n, "puertas_%04X" % d,
               "%d fichas de puerta en 4 bits por punto, tal cual (32 bytes por "
               "ficha): %s las vuelca en la VRAM %s por L_4A33/L_509C" % (n, lec, vram),
               lec, planos=4)
    vistas = set()
    for j in range(8):
        ix = palabra(T, 0x607E + 2 * j)
        for k in range(3):
            r = ix + 5 * k
            bits = leer(T, r)
            if bits & 0x80:
                break
            if bits & 0x40:
                continue
            n = leer(T, r + 1)
            primera = leer(T, r + 2)
            src = palabra(T, r + 3)
            if (src, n) in vistas:
                continue
            vistas.add((src, n))
            fichas(T, src, n, "fichas_juego_%d_%04X" % (j, src),
                   "%d fichas de 8 x 8 en 3 planos (24 bytes por ficha) del juego "
                   "%d, desde la ficha %d de la VRAM: p00:49C6 (L_524C) las pasa "
                   "a 4 bits por punto con la tabla de colores de 0xE700" % (n, j, primera),
                   "p00:49C6")
    fichas(T, 0x9509, 8, "cajas_9509",
           "8 fichas en 3 planos de las cajas, que p00:4BDE vuelca en la VRAM "
           "0x9400 y p00:4BE7 otra vez volteadas en 0x9840", ["p00:4BDE", "p00:4BE7"])
    fichas(T, 0xABA1, 16, "retrato_de_snake",
           "16 fichas en 3 planos (colores 0x4B2B) que p00:4BA0 vuelca en la "
           "VRAM 0xC040 (el retrato del transceptor)", "p00:4BA0")
    fichas(T, 0xAD21, 3, "retrato_de_snake_2",
           "3 fichas mas del retrato, en la VRAM 0xC440 (p00:4BAB)", "p00:4BAB")
    a = 0xA559
    while leer(T, a) != 0xFF:
        a += 1
    declara(T, 0xA559, a + 1, "mapa_del_pozo",
            "el dibujo del pozo como numeros de ficha, por filas: 0xFE baja una "
            "fila (8 puntos), 0xFF acaba; p00:51E2 (desde p00:4A8D) copia cada "
            "ficha de la VRAM a la VRAM con L_519C", "p00:4A8D")
    fichas(7, 0xB8B9, 0x46, "logotipo_metal_gear",
           "70 fichas en 3 planos del logotipo METAL GEAR del titulo, que "
           "p09:B5C8 vuelca en la VRAM 0x8004 (por p00:4168, L_524C)", "p09:B5C8")
    # el logotipo de Konami y la fuente: 1 bit por punto
    for d, n, lec, que in ((0xB719, 13, "p00:4C57", "VRAM 0x0800, color 1"),
                           (0xB781, 13, "p00:4C63", "VRAM 0x7000, color 2"),
                           (0xB7E9, 26, "p00:4C6F", "VRAM 0xD800, color 3")):
        fichas(7, d, n, "logotipo_konami_%04X" % d,
               "%d caracteres de 1 bit por punto (8 bytes) del logotipo de Konami "
               "que %s pinta con L_505D en la %s" % (n, lec, que), lec, planos=1)
    a = 0xB6D8
    while leer(T, a) != 0xFF:
        a += 2 if leer(T, a) == 0xFE else 1
    declara(T, 0xB6D8, a + 1, "montaje_del_logotipo_konami",
            "numeros de ficha del logotipo de Konami por filas (0xFE n baja una "
            "fila y corre n puntos, 0xFF acaba) que p00:4C79 copia con L_518A",
            "p00:4C75")
    fichas(7, 0xB0B2, 108, "fuente",
           "108 caracteres de 1 bit por punto (8 bytes) que p09:B06D pinta con "
           "L_505D en la VRAM 0x0040 con el color 0xE", "p09:B06D", planos=1)
    fichas(7, 0xB412, 13, "fuente_2",
           "13 caracteres mas de 1 bit por punto, en la VRAM 0x9858 (p09:B079)",
           "p09:B079", planos=1)
    fichas(7, 0xB47A, 6, "fichas_b47a",
           "6 fichas en 2 planos (16 bytes) que p09:B09B vuelca con L_51FE en la "
           "VRAM 0xAC30", "p09:B09B", planos=2)
    declara(T, 0xB0AE, 0xB0B2, "colores_de_la_fuente",
            "4 bytes que p09:B088 copia a 0xE700: la tabla de colores de los "
            "caracteres", "p09:B088")
    declara(T, 0xB5AD, 0xB5B5, "colores_del_titulo",
            "8 bytes que p09:B5B5 copia a 0xE700 antes del logotipo", "p09:B5B5")
    declara(T, 0xB602, paleta(T, 0xB602), "paleta_del_titulo",
            "ternas [registro][RB][G] hasta 0xFF que p09:B500 manda al VDP "
            "(p00:4118, L_4EC4)", "p09:B500", F=3)
    declara(T, 0xB6A6, paleta(T, 0xB6A6), "paleta_del_logotipo_konami",
            "ternas de paleta hasta 0xFF (p09:B67E -> L_4EC4)", "p09:B67E", F=3)
    declara(T, 0xB618, 0xB618 + 52, "montaje_del_titulo",
            "4 filas de 13 numeros de ficha que p09:B5D4 (L_B5E0) pinta de una "
            "en una con p00:40B4 desde (0x20,0x68)", "p09:B5D4", F=13)
    declara(T, 0xB64C, 0xB64C + 36, "montaje_del_titulo_2",
            "4 filas de 9 numeros de ficha (p09:B5DD, desde (0x88,0x70))",
            "p09:B5DD", F=9)
    declara(T, 0xAE5F, 0xAE8F, "sprites_del_ascensor",
            "12 fichas de 4 bytes [y][x][patron][color] que p09:AE31 pone en "
            "0xEA50 sumando la posicion (0xC193/0xC194), y p09:AE50 copia el "
            "color 16 veces a 0xE940", "p09:AE28", F=4)
    declara(T, 0xAE98, 0xAEB2, "saltos_de_la_intro",
            "13 direcciones de codigo del banco 9, una por paso de la intro "
            "(0xC920): p09:AE92 las recorre con L_B50C (`jp (hl)`)", "p09:AE92", F="w13")
    declara(T, 0xB515, 0xB51F, "saltos_del_menu",
            "5 direcciones de codigo, una por estado del menu (0xC118): "
            "p09:B509 -> L_B50C", "p09:B509", F="w5")
    declara(T, 0xBF60, 0xBF66, "salas_del_camion",
            "6 numeros de sala que p09:BF4F busca con cpir", "p09:BF4F")
    declara(T, 0xBF99, 0xBFA1, "bf99",
            "8 bytes que p09:BF90 lee en 0xBF99 + ((bits 1-3 de A) / 2)", "p09:BF90")
    # bancos 6 y 15: fichas de objetos, radio, camara, interruptor
    fichas(4, 0xA75D, 0x84, "fichas_de_objetos",
           "132 fichas en 3 planos (colores 0x4B1B) que p00:4B47 vuelca en la "
           "VRAM 0xB000: los objetos y las armas", "p00:4B47")
    fichas(4, 0xB3BD, 4, "fichas_b3bd",
           "4 fichas en 3 planos en la VRAM 0xC400 (p00:4B52)", "p00:4B52")
    fichas(4, 0xB41D, 0x1F, "fichas_del_transceptor",
           "31 fichas en 3 planos (colores 0x4B13) que p00:4B63 vuelca en la "
           "VRAM 0xC804; las 7 de 0xB65D van otra vez volteadas a 0xCC00 (p00:4B6E)",
           ["p00:4B63", "p00:4B6E"])
    fichas(4, 0xB705, 8, "fichas_de_la_camara",
           "8 fichas en 2 planos (16 bytes, colores 0x4B23) en la VRAM 0xC010 "
           "(p00:4B81, L_51FE)", "p00:4B81", planos=2)
    fichas(4, 0xB785, 8, "fichas_de_la_camara_2",
           "8 fichas mas en 2 planos, en la VRAM 0xC410 (p00:4B8C)", "p00:4B8C", planos=2)
    fichas(13, 0xB2BF, 4, "fichas_del_interruptor",
           "4 fichas en 3 planos que p00:4BCA vuelca en la VRAM 0x9048 (el "
           "interruptor de la corriente)", "p00:4BCA")


# --------------------------------------------------------------- las salas

def salas():
    T = 13
    declara(T, 0x6000, 0x61F6, "indice_de_salas",
            "251 punteros, uno por numero de sala (0xC130), a 48 bytes de "
            "metafichas: p00:4CFF los lee con L_42B1", "p00:4CFF", F="w8")
    declara(T, 0x61F6, 0x6274, "juego_de_metafichas_por_sala",
            "el juego de metafichas de cada sala, un nibble por sala (1-6): "
            "p00:4CA9 con L_42D1", "p00:4CA9", F=16)
    declara(T, 0x6274, 0x6280, "indice_de_metafichas",
            "6 punteros, juegos 1-6, a las metafichas (16 bytes cada una): "
            "p00:4CB0 lee 0x6274 + 2 x (juego - 1)", "p00:4CB0", F="w6")
    ptr = defaultdict(list)
    for s in range(251):
        ptr[palabra(T, 0x6000 + 2 * s)].append(s)
    maximo = defaultdict(int)
    for d, ss in sorted(ptr.items()):
        if d < 0x6280:
            AVISOS.append("las salas %s apuntan a %04X, dentro de la tabla de nibbles: no son salas"
                          % (ss, d))
            continue
        juego = leer(T, 0x61F6 + ss[0] // 2)
        juego = (juego >> 4 if ss[0] % 2 == 0 else juego) & 0x0F
        for i in range(48):
            maximo[juego] = max(maximo[juego], leer(T, d + i))
        quien = ", ".join(str(s) for s in ss[:8]) + (" ..." if len(ss) > 8 else "")
        declara(T, d, d + 48, "sala_%s" % "_".join(str(s) for s in ss[:3]),
                "la sala %s: 6 filas de 8 metafichas (un byte cada una, indice "
                "1-%d en el juego %d); p00:4CB7 las monta en 0xE000 de 4 x 4 "
                "fichas y p00:4D2E las pinta" % (quien, maximo[juego], juego),
                "p00:4CB7", F=8)
    for j in range(1, 7):
        d = palabra(T, 0x6274 + 2 * (j - 1))
        n = maximo[j]
        declara(T, d, d + 16 * n, "metafichas_juego_%d" % j,
                "las %d metafichas del juego %d, 4 x 4 numeros de ficha (16 "
                "bytes) cada una; el numero de la sala es 1-%d (p00:4CC3 resta "
                "1); lo que las salas de ese juego usan como mucho" % (n, j, n),
                "p00:4CC3", F=16)


# ------------------------------------------------------------- los sprites

def sprites():
    T = 10
    declara(T, 0x6000, 0x606A, "indice_de_patrones_del_jugador",
            "53 punteros, uno por juego de patrones de Snake (0xC18A), a sus "
            "patrones comprimidos: p00:53BA (L_42B4)", "p00:53BA", F="w8")
    vistos = set()
    for k in range(53):
        d = palabra(T, 0x6000 + 2 * k)
        if d in vistos:
            continue
        vistos.add(d)
        declara(T, d, rle_jugador(T, d), "patrones_de_snake_%d" % k,
                "patrones de sprite de Snake (juego %d), comprimidos: n < 0x80 "
                "repite el byte siguiente n veces, n > 0x80 copia n & 0x7F bytes, "
                "0 acaba (p00:53C2 los manda a la VRAM 0xF800)" % k, "p00:53C2")
    declara(T, 0x606A, 0x609F, "atributos_por_juego_del_jugador",
            "53 bytes: que lista de atributos de 0x609F usa cada juego de "
            "patrones (p00:531E, p00:5364)", "p00:531E", F=16)
    n = palabras_hasta_primer_destino(T, 0x609F)
    declara(T, 0x609F, 0x609F + 2 * n, "indice_de_atributos_del_jugador",
            "%d punteros a las listas de atributos de Snake (p00:5328, p00:536E)" % n,
            "p00:5328", F="w8")
    for k in range(n):
        d = palabra(T, 0x609F + 2 * k)
        c = leer(T, d)
        declara(T, d, d + 1 + 4 * c, "atributos_de_snake_%d" % k,
                "[cuantos] y %d fichas [y][x][patron][color]: p00:5341 suma la "
                "posicion (0xC182/0xC184) y las pone en 0xEA00 (o 0xEA40), y "
                "p00:5394 copia el color 16 veces a 0xE800/0xE900" % c, "p00:533C", F="1,4")
    c = leer(T, 0x6174)
    declara(T, 0x6174, 0x6174 + 1 + 4 * c, "atributos_de_snake_agachado",
            "la lista de atributos que p00:538C usa cuando 0xC199 no es 0 y el "
            "bit 0 de 0xC003 esta a 0", "p00:538C", F="1,4")
    declara(T, 0x6185, 0x6280, "juego_de_sprites_por_sala",
            "251 bytes: el juego de sprites de cada sala (0xC130): p00:4A4A y "
            "p00:4AB8 lo leen en 0x6185 + sala", "p00:4A4A", F=16)
    n = palabras_hasta_primer_destino(T, 0x6280)
    declara(T, 0x6280, 0x6280 + 2 * n, "indice_de_juegos_de_sprites",
            "%d punteros a las listas de patrones de cada juego de sprites "
            "(p00:4A51)" % n, "p00:4A51", F="w8")
    rles = {}
    vistos = set()
    for k in range(n):
        d = palabra(T, 0x6280 + 2 * k)
        if d in vistos:
            continue
        vistos.add(d)
        a = d
        while leer(T, a) != 0xFF:
            pat, src = leer(T, a), palabra(T, a + 1)
            rles.setdefault(src, []).append("juego %d, patron %d" % (k, pat))
            a += 3
        declara(T, d, a + 1, "sprites_del_juego_%d" % k,
                "ternas [patron][origen lo][origen hi] hasta 0xFF: cada una, "
                "unos patrones comprimidos que p00:4A69 descomprime en la VRAM "
                "0xF800 + 8 x patron (L_4DD5)", "p00:4A57", F=3)
    declara(T, 0x6392, 0x63B0, "indice_de_patrones_de_las_armas",
            "15 punteros a patrones comprimidos de proyectil que L_4DD5 "
            "descomprime en la VRAM 0xF880: p00:4BFF elige el del arma (0xC134) "
            "al entrar en la sala, salvo ROCKET (4) y MISSILE (7), que cargan el "
            "suyo al disparar segun la direccion (0xC185) con L_4C2E: 0x63A0 + 2 "
            "x (direccion - 1) el cohete (p02:86A1) y 0x63A8 el misil (p02:8886, "
            "88CE); la palabra de las armas 4 y 7 (0x63A0) no la lee nadie",
            "p00:4BFF", F="w5")
    for k in range(15):
        if k + 1 in (4, 7):
            continue            # p00:4BF6-4BFC: las armas 4 y 7 no cargan aqui
        d = palabra(T, 0x6392 + 2 * k)
        rles.setdefault(d, []).append(
            "arma %d" % (k + 1) if k < 7 else
            "%s hacia %s" % ("ROCKET" if k < 11 else "MISSILE",
                             ("arriba", "abajo", "la izquierda", "la derecha")[(k - 7) % 4]))
    rles.setdefault(0x773E, []).append("p00:4C26 (VRAM 0xF900)")
    rles.setdefault(0x77D3, []).append("p00:4C1E (VRAM 0xF8C0)")
    for src in sorted(rles):
        declara(T, src, rle_sprite(T, src), "patrones_%04X" % src,
                "patrones de sprite comprimidos (n < 0x80 repite el byte "
                "siguiente n veces, n == 0x80 trae otro destino, n > 0x80 copia "
                "n & 0x7F bytes, 0 acaba; L_4DD5): %s" % "; ".join(rles[src][:4]),
                "p00:4DD5")
    n = palabras_hasta_primer_destino(T, 0x63B0)
    declara(T, 0x63B0, 0x63B0 + 2 * n, "indice_de_atributos_de_las_armas",
            "%d punteros a listas de atributos por cuadro ((ix+0x0B)): "
            "p00:53E0" % n, "p00:53E0", F="w8")
    primero = min(palabra(T, 0x63B0 + 2 * k) for k in range(n))
    declara(T, primero, 0x6436, "atributos_de_las_armas",
            "las listas de atributos de los proyectiles, una por cuadro: por "
            "sprite [y][x][patron][color], o 0x80 si va escondido; cuantos "
            "sprites lo dice el actor ((ix+0x20)), por eso no llevan cuenta "
            "(p00:53F2)", "p00:53F2", F=4)
    # el punto de mira: [destino en la VRAM][patrones comprimidos]
    d = 0xA6F9
    declara(4, d, rle_sprite(4, d + 2), "punto_de_mira",
            "[destino en la VRAM (0xF880)] y los patrones comprimidos del punto "
            "de mira, que p00:4C43 descomprime con L_4DCF/L_4DD5", "p00:4C43")


# -------------------------------------------------------------- los textos

def textos():
    T = 10
    n = palabras_hasta_primer_destino(T, 0xA37D)
    declara(T, 0xA37D, 0xA37D + 2 * n, "indice_de_textos",
            "%d punteros, uno por numero de texto (0xCEF0 - 1), que p00:52C6 "
            "lee con L_42B4" % n, "p00:52C6", F="w8")
    vistos = set()
    for k in range(n):
        d = palabra(T, 0xA37D + 2 * k)
        if d in vistos:
            continue
        vistos.add(d)
        a = d
        while leer(T, a) != 0xFF:
            a += 1
        declara(T, d, a + 1, "texto_%d" % (k + 1),
                "el texto %d: [tipo de ventana] y los caracteres; 0xFE salto de "
                "linea, 0xFD fin de pagina (sigue la siguiente), >= 0xA1 mete "
                "el trozo 0xB8A7[n - 0xA1], 0xFF acaba (p00:52E0)" % (k + 1), "p00:52E0")
    n = palabras_hasta_primer_destino(T, 0xB8A7)
    declara(T, 0xB8A7, 0xB8A7 + 2 * n, "indice_de_trozos_de_texto",
            "%d punteros a trozos de texto que los textos meten con los "
            "codigos 0xA1-0x%02X (p00:5302)" % (n, 0xA1 + n - 1), "p00:5302", F="w8")
    for k in range(n):
        d = palabra(T, 0xB8A7 + 2 * k)
        a = d
        while leer(T, a) != 0xFF:
            a += 1
        declara(T, d, a + 1, "trozo_%02X" % (0xA1 + k),
                "trozo de texto 0x%02X: caracteres hasta 0xFF (p00:530A)" % (0xA1 + k),
                "p00:530A")
    declara(T, 0xA204, 0xA2FF, "musica_y_radio_por_sala",
            "251 bytes, uno por sala: los bits 0-2 son la zona de musica "
            "(p00:4368 -> 0xC158) y p00:453D lee el resto", ["p00:4368", "p00:453D"], F=16)
    declara(T, 0xA2FF, 0xA37D, "zona_de_radio_por_sala",
            "un nibble por sala (p00:4379 con L_42D1 -> 0xC161): la zona del "
            "transceptor", "p00:4379", F=16)
    declara(T, 0xA132, 0xA1C8, "laseres_de_las_salas_18_1a",
            "los laseres de las salas 0x18 (0xA132), 0x19 (0xA15D) y 0x1A "
            "(0xA181): [cuantos] y sus fichas, que p00:5433 copia a 0xD000",
            "p00:5425")
    declara(T, 0xA1C8, 0xA1D2, "indice_de_laseres",
            "5 punteros (0xC60B) a listas de 10 bytes: p00:54DC", "p00:54DC", F="w5")
    declara(T, 0xA1D2, 0xA204, "laseres",
            "5 listas de 10 bytes, un byte por laser, que p00:54E9 reparte en "
            "0xD001 + 0x80 x n", "p00:54E9", F=10)


# ---------------------------------------------------- las tablas del banco 5

def banco5():
    T = 4
    declara(T, 0x87B7, 0x87C5, "indice_de_danos_por_arma",
            "7 punteros, armas 1-7, a la tabla de dano de esa arma por tipo de "
            "actor (p00:4388 lee 0x87B7 + 2 x (arma - 1) y guarda el puntero en "
            "0xEC00; p00:4393 lee el byte de delante, p00:4396 el del tipo)",
            "p00:4388", F="w7")
    declara(T, 0x87C5, 0x87C6, "byte_de_delante_de_los_danos",
            "el byte que p00:4393 lee justo delante de la primera tabla de "
            "dano (DE - 1)", "p00:4393")
    tabs = sorted({palabra(T, 0x87B7 + 2 * k) for k in range(7)})
    for i, d in enumerate(tabs):
        z = tabs[i + 1] if i + 1 < len(tabs) else 0x8951
        declara(T, d, z, "dano_%04X" % d,
                "el dano de un arma a cada tipo de actor, un byte por tipo "
                "(0xFF = no le afecta): p00:4396 lee (0xEC00) + tipo", "p00:4396", F=16)
    for d, lec in ((0x8951, "p02:8C38"), (0x8992, "p02:8C47"), (0x89D3, "p02:898C"),
                   (0x8A14, "p02:89E5")):
        declara(T, d, d + 65, "forma_%04X" % d,
                "65 bytes, uno por tipo de actor, que %s carga en HL y lee por "
                "p00:439C/p00:43A3 (HL + tipo, con 4-5-6 puesto)" % lec, lec, F=16)
    declara(T, 0x8A55, 0x8AC5, "formas_de_los_proyectiles",
            "28 fichas de 4 bytes, tipos 1-28, que p00:43B4 copia a 0xC928 "
            "(0x8A55 + 4 x (tipo - 1))", "p00:43B4", F=4)
    declara(T, 0x8AC5, 0x8AE8, "texto_al_coger_cada_objeto",
            "35 bytes, uno por objeto: el numero de texto que sale al cogerlo "
            "(p00:43A3 lo lee en 0x8AC5 + objeto - 1 desde p02)", "p00:43A3", F=16)
    declara(T, 0x8AE8, 0x8B0B, "unidades_de_cada_objeto",
            "35 bytes, uno por objeto: cuantas unidades da (p00:43AC lee 0x8AE8 "
            "+ objeto)", "p00:43AC", F=16)
    declara(T, 0x8B0B, paleta(T, 0x8B0B), "paleta_del_menu_de_armas",
            "ternas [registro][RB][G] hasta 0xFF (p00:4A95 -> L_4EC4)", "p00:4A95", F=3)
    declara(T, 0x8B1E, paleta(T, 0x8B1E), "paleta_del_transceptor",
            "ternas de paleta hasta 0xFF (p00:4AAD -> L_4EC4)", "p00:4AAD", F=3)
    declara(T, 0x8B40, 0x8BBE, "paleta_por_sala",
            "un nibble por sala (p00:4B00 con L_42D4): que paleta de 0x8BBE "
            "usa; las salas 0x7B-0x7D y 0xDC/0xDD con gafas (0xC135 = 3) usan "
            "la 0xB y con el foco (0xC135 = 4) la 0xA", "p00:4ACB", F=16)
    declara(T, 0x8BBE, 0x8BDE, "indice_de_paletas_de_sala",
            "16 punteros a las paletas de sala (p00:4B06 -> L_42B4)", "p00:4B06", F="w8")
    for k in range(16):
        d = palabra(T, 0x8BBE + 2 * k)
        declara(T, d, paleta(T, d), "paleta_de_sala_%d" % k,
                "la paleta %d de sala: ternas hasta 0xFF (p00:4B0D -> L_4EC4)" % k,
                "p00:4B0D", F=3)
    declara(T, 0x8CB4, 0x8CF4, "indice_de_paletas_de_sprites",
            "32 punteros, uno por juego de sprites (0x6185 del banco 10), a su "
            "paleta (p00:4AC5)", "p00:4AC5", F="w8")
    vistos = set()
    for k in range(32):
        d = palabra(T, 0x8CB4 + 2 * k)
        if d in vistos:
            continue
        vistos.add(d)
        declara(T, d, paleta(T, d), "paleta_de_sprites_%04X" % d,
                "paleta de un juego de sprites: ternas hasta 0xFF (p00:4B0D)",
                "p00:4B0D", F=3)
    declara(T, 0x8DA8, 0x8DBE, "indice_de_ascensores",
            "11 punteros, salas 0xF0-0xFA, a la ficha del ascensor (p00:4335 "
            "lee 0x8DA8 + 2 x (sala - 0xF0))", "p00:4335", F="w8")
    asc = sorted({palabra(T, 0x8DA8 + 2 * k) for k in range(11)})
    for i, d in enumerate(asc):
        z = asc[i + 1] if i + 1 < len(asc) else 0x8E0E
        declara(T, d, z, "ascensor_%04X" % d,
                "la ficha de un ascensor: 2 bytes que p00:433C guarda en "
                "0xC197/0xC198 y ternas [sala][b][c] que p00:431F busca por la "
                "sala de 0xC136", "p00:432D")
    declara(T, 0x8E0E, 0x907E, "salas_vecinas",
            "156 fichas de 4 bytes, una por sala (L_42E6: las salas < 0x7E van "
            "tal cual, las 0xD0-0xE3 restan 0x52 y las 0xF1+ restan 0x5F; las "
            "0x7E-0xCF y 0xE4-0xF0 no tienen), con la sala a la que se sale por "
            "arriba, abajo, izquierda y derecha (0xC133 - 1 elige el byte, "
            "p01:63FC-6462; 0xFF = no hay)",
            "p00:4302", F=4)
    n = 222
    declara(T, 0x9560, 0x9560 + 2 * n, "indice_de_actores_por_sala",
            "222 punteros, salas 0-0xDD (p00:564C -> L_42B4), a la lista de "
            "actores de esa sala", "p00:564C", F="w8")
    vistos = set()
    for s in range(n):
        d = palabra(T, 0x9560 + 2 * s)
        if d in vistos:
            continue
        vistos.add(d)
        c = leer(T, d) & 0x0F
        declara(T, d, d + 1 + 3 * c, "actores_de_la_sala_%d" % s,
                "[cuantos (nibble bajo)] y %d ternas [tipo][y][x]: p00:5660 crea "
                "un actor por terna (L_569A; la Y va a (ix+3) y la X a (ix+5), "
                "p00:5727/572B, y p00:5526 suma (ix+3) a la Y del sprite)" % c,
                "p00:5660", F="1,3")
    declara(T, 0x971C, 0x975A, "sprites_por_tipo_de_actor",
            "un byte por tipo de actor (1-62): cuantos sprites lleva, que "
            "p00:56CA pone en (ix+0x20); el byte del tipo 0 es el alto del "
            "ultimo puntero de 0x9560", "p00:56CA", F=16)
    declara(T, 0x975A, 0x97DC, "indice_de_colores_por_tipo",
            "65 punteros, uno por tipo de actor, a sus colores de sprite "
            "(p00:467D lee 0x975A + 2 x tipo; p00:5745 por p00:57EC)",
            ["p00:467D", "p00:5745"], F="w8")
    cols = sorted({palabra(T, 0x975A + 2 * k) for k in range(65)})
    cols = [c for c in cols if 0x97DC <= c < 0x984F]
    for i, d in enumerate(cols):
        z = cols[i + 1] if i + 1 < len(cols) else 0x984F
        declara(T, d, z, "colores_%04X" % d,
                "los colores de los sprites de un tipo de actor, un byte por "
                "sprite (p00:468F los pone en (ix+0x25) de 5 en 5)", "p00:468F")
    declara(T, 0x984F, 0x9890, "byte_0d_por_tipo",
            "65 bytes, uno por tipo de actor, que p00:5754 guarda en (ix+0x0D)",
            "p00:574E", F=16)
    n = palabras_hasta_primer_destino(T, 0x9890)
    declara(T, 0x9890, 0x9890 + 2 * n, "indice_de_atributos_por_cuadro",
            "%d punteros, uno por cuadro ((ix+0x0B)), a los atributos de sus "
            "sprites (p00:5518 -> L_42B4)" % n, "p00:5518", F="w8")
    ptrs = sorted({palabra(T, 0x9890 + 2 * k) for k in range(n)})
    fin_caminos = caminos()
    # los grupos de posiciones: 21 punteros en p00:556F (p00:554A), parejas
    # [y][x] que p00:5552 va leyendo (tantas como sprites queden); van justo
    # detras de la ultima lista de atributos y hasta los caminos
    grupos = sorted({palabra(T, 0x556F + 2 * k) for k in range(21)})
    declara(T, ptrs[0], grupos[0], "atributos_por_cuadro",
            "las listas de atributos de los actores, una por cuadro: por sprite "
            "[y][x][patron] (p00:5526), o un byte 0x91-0xA5 que trae las "
            "posiciones del grupo p00:556F[n - 0x91] y deja solo los patrones "
            "(p00:5549); cuantos sprites lo dice (ix+0x20), por eso no llevan "
            "cuenta; la ultima lista empieza en 0x%04X y acaba donde empiezan "
            "los grupos" % ptrs[-1], "p00:5526", F=3)
    declara(T, grupos[0], fin_caminos, "grupos_de_posiciones",
            "%d grupos de parejas [y][x] (los punteros en p00:556F) que p00:5552 "
            "suma a la posicion del actor, una pareja por sprite que quede en "
            "el cuadro; el largo de cada grupo lo da el cuadro que lo usa, por "
            "eso se solapan unos con otros; de 0x%04X al principio de los "
            "caminos" % (len(grupos), grupos[0]), "p00:5552", F=2)


def caminos():
    """Los caminos de los guardias: 0xA2DF + 2 x sala -> tabla con una palabra
    por actor (B - 1) -> registro [byte][parejas x,y]. Las tablas y los
    registros van revueltos entre el final del banco 5 y 0xA2DF del 6, y se
    reparten por sus punteros ordenados."""
    T = 4
    n_act = {}
    for s in range(222):
        d = palabra(T, 0x9560 + 2 * s)
        n_act[s] = leer(T, d) & 0x0F
    declara(T, 0xA2DF, 0xA445, "indice_de_caminos",
            "179 punteros, salas 0-178 (p00:59D9 y p00:5B13 leen 0xA2DF + 2 x "
            "sala), a la tabla de caminos de esa sala: una palabra por actor "
            "(B - 1, p00:59E4)", ["p00:59D9", "p00:5B13"], F="w8")
    tablas = {}
    for s in range(179):
        tablas.setdefault(palabra(T, 0xA2DF + 2 * s), []).append(s)
    registros = {}
    for t, salas in tablas.items():
        n = max(n_act.get(s, 0) for s in salas)
        for k in range(n):
            registros.setdefault(palabra(T, t + 2 * k), []).append((salas[0], k + 1))
    todos = sorted(set(tablas) | set(registros))
    todos = [a for a in todos if 0x9800 <= a < 0xA2DF]
    for i, a in enumerate(todos):
        z = todos[i + 1] if i + 1 < len(todos) else 0xA2DF
        if a in tablas:
            salas = tablas[a]
            declara(T, a, z, "caminos_de_la_sala_%d" % salas[0],
                    "la tabla de caminos de la sala %s: una palabra por actor "
                    "(%d actores en 0x9560), al registro de su camino" % (
                        ", ".join(str(x) for x in salas[:6]), max(n_act.get(x, 0) for x in salas)),
                    "p00:59E4", F="w4")
        else:
            quien = registros[a]
            declara(T, a, z, "camino_%04X" % a,
                    "el camino del actor %d de la sala %d%s: [byte para (ix+0x13)] "
                    "y parejas [y][x] de puntos de paso que p00:59F5 va cargando "
                    "en (ix+0x15)/(ix+0x16) (p00:5A02 los resta de (ix+3)/(ix+5), Y y X, "
                    "para sacar la direccion al siguiente)" % (
                        quien[0][1], quien[0][0], " y %d mas" % (len(quien) - 1) if len(quien) > 1 else ""),
                    "p00:59F5", F=2)
    declara(T, 0xA445, 0xA679, "reaparicion_por_sala",
            "188 fichas de 3 bytes, salas 0-0xBB (p00:583B: 3 x sala): [tipo de "
            "actor][xy][xy]; p00:5867 coge el segundo o el tercer byte segun el "
            "bit 0 de 0xC003 (azar) y saca la x del nibble alto y la y del bajo",
            ["p00:5841", "p00:58B8", "p00:58F5"], F=3)
    return todos[0]


# ---------------------------------------------------------- bancos 6 y 15

def banco6():
    T = 4
    declara(T, 0xA679, 0xA6B9, "tabla_a679",
            "64 bytes que p00:5CAB lee en 0xA679 + 8 x (bits 5-7) + E", "p00:5CAB", F=8)
    declara(T, 0xA6B9, 0xA6F9, "tabla_a6b9",
            "64 bytes que p00:5BEE y p00:5C46 leen dos veces (0xA6B9 + DE y "
            "0xA6B9 + A, con A = 0x3F - E)", ["p00:5BEE", "p00:5C46"], F=8)
    for d, lec, que in ((0xB805, "p00:46A2", "WEAPON / SELECT / OPTION"),
                        (0xB81F, "p00:47AC", "EQUIPMENT / SELECT"),
                        (0xB833, "p00:4BB7", "TRANSCEIVER / RECV y los simbolos")):
        declara(T, d, texto_pos(T, d), "rotulo_%04X" % d,
                "rotulo con posicion ([X][Y] y caracteres, 0xFE otra "
                "posicion, 0xFF acaba) que %s escribe con L_510C: %s" % (lec, que), lec)
    declara(T, 0xB855, 0xB865, "dibujo_de_cada_arma",
            "8 palabras, armas 1-8: de donde copia p00:46ED el dibujo del arma "
            "en el menu (p00:46D0 lee 0xB855 + 2 x (arma - 1))", "p00:46D0", F="w8")
    declara(T, 0xB865, 0xB875, "indice_de_nombres_de_armas",
            "8 punteros a los nombres de las armas (p00:46F0)", "p00:46F0", F="w8")
    for k in range(8):
        d = palabra(T, 0xB865 + 2 * k)
        declara(T, d, texto_pos(T, d, False), "nombre_de_arma_%d" % (k + 1),
                "el nombre del arma %d, caracteres hasta 0xFF (p00:4702, L_5116)" % (k + 1),
                "p00:4702")
    declara(T, 0xB8B0, 0xB8C0, "cursor_del_menu_de_armas",
            "8 palabras [x][y] del cursor por hueco del menu de armas (p00:43CA "
            "-> L_42B4 por 0xC154)", "p00:43CA", F="w8")
    declara(T, 0xB8C0, 0xB8F6, "dibujo_de_cada_objeto",
            "27 palabras, objetos 1-27: de donde copia p00:47E8 el dibujo del "
            "objeto en el menu (p00:47D4)", "p00:47D4", F="w8")
    n = palabras_hasta_primer_destino(T, 0xB8F6)
    declara(T, 0xB8F6, 0xB8F6 + 2 * n, "indice_de_nombres_de_objetos",
            "%d punteros a los nombres de los objetos (p00:47EB)" % n, "p00:47EB", F="w8")
    vistos = set()
    for k in range(n):
        d = palabra(T, 0xB8F6 + 2 * k)
        if d in vistos:
            continue
        vistos.add(d)
        declara(T, d, texto_pos(T, d, False), "nombre_de_objeto_%d" % (k + 1),
                "el nombre del objeto %d, caracteres hasta 0xFF (p00:47FD)" % (k + 1),
                "p00:47FD")
    declara(T, 0xB9BB, 0xB9EF, "cursor_del_menu_de_objetos",
            "26 palabras [x][y] del cursor por hueco del menu de objetos "
            "(p00:43CF, p00:489B)", ["p00:43CF", "p00:489B"], F="w8")
    declara(T, 0xB9EF, 0xBA50, "objetos_por_sala",
            "97 bytes, salas 0x7A-0xDA: que lista de 0xBA50 tiene cada sala (0 "
            "= ninguna); p06:BBF4 lee 0xB9EF + sala - 0x7A", "p06:BBF4", F=16)
    n = palabras_hasta_primer_destino(T, 0xBA50)
    declara(T, 0xBA50, 0xBA50 + 2 * n, "indice_de_objetos_en_sala",
            "%d punteros a las listas de objetos (p06:BBFE -> p00:40BE)" % n,
            "p06:BBFE", F="w8")
    vistos = set()
    for k in range(n):
        d = palabra(T, 0xBA50 + 2 * k)
        if d in vistos:
            continue
        vistos.add(d)
        a = d
        while leer(T, a) != 0xFF:
            a += 3
        declara(T, d, a + 1, "objetos_en_sala_%d" % (k + 1),
                "ternas [objeto][x][y] hasta 0xFF: p06:BC07 crea los que aun no "
                "se han cogido (0xC520/0xC5A0)", "p06:BC07", F=3)
    declara(T, 0xBBD8, 0xBBDD, "bbd8",
            "5 bytes que p06:BB8E lee en 0xBBD8 + A", "p06:BB8E")
    declara(T, 0xBD8F, 0xBD97, "indice_de_la_demo",
            "4 punteros (0xC00C) a los guiones de la demo (p06:BCBA)", "p06:BCBA", F="w4")
    gs = sorted({palabra(T, 0xBD8F + 2 * k) for k in range(4)})
    for i, d in enumerate(gs):
        z = gs[i + 1] if i + 1 < len(gs) else 0xBDF8
        declara(T, d, z, "guion_de_la_demo_%04X" % d,
                "un guion de la demo: [sala][teclas] y parejas [cuadros][teclas] "
                "que p06:BCC0 va mandando como si las pulsara alguien", "p06:BCC0", F=2)
    declara(T, 0xBE51, 0xBE64, "puntos_de_control",
            "6 ternas y 0xFF que p06:BE2F recorre al cargar o al empezar (lo que "
            "se pone en 0xCA00 + c)", "p06:BE2F", F=3)
    declara(T, 0xBE64, 0xBEA2, "salas_de_punto_de_control",
            "31 parejas [sala][sala siguiente] que p06:BE0A compara con 0xC130 y "
            "0xC136", "p06:BE0A", F=2)
    for d, lec in ((0xBEF1, "p06:BF2F"), (0xBEF6, "p06:BF3A"), (0xBF03, "p06:BF43"),
                   (0xBF0C, "p06:BF4C"), (0xBF16, "p06:BF55")):
        a = d
        while leer(T, a) != 0xFF:
            a += 1
        declara(T, d, a + 1, "clave_%04X" % d,
                "una contrasena: caracteres hasta 0xFF que %s compara con lo "
                "tecleado (0xE50B hacia abajo, p06:BF22)" % lec, lec)


def banco15():
    T = 13
    declara(T, 0xA700, 0xA720, "a700",
            "32 bytes que leen p01:7778 (0xA700) y p01:7C44 (0xA710)",
            ["p01:7778", "p01:7C44"], F=16)
    declara(T, 0xA720, 0xA7C0, "fichas_de_tipo_de_puerta",
            "20 fichas de 8 bytes, una por numero de puerta (p00:445D lee 0xA720 "
            "+ 8 x (puerta - 1)): 4 parejas de desplazamiento que suma a la "
            "posicion de la puerta", "p00:445D", F=8)
    n = 0xEC
    declara(T, 0xA7C0, 0xA7C0 + 2 * n, "indice_de_puertas_por_sala",
            "236 punteros, salas 0-0xE0 y 0xF0-0xFA (que restan 0xF: p00:440C), "
            "a las puertas "
            "de cada sala (p00:4411 -> L_42B4)", "p00:4411", F="w8")
    vistos = set()
    for s in range(n):
        d = palabra(T, 0xA7C0 + 2 * s)
        if d in vistos:
            continue
        vistos.add(d)
        a = d
        while leer(T, a) != 0xFF:
            a += 5
        declara(T, d, a + 1, "puertas_de_la_sala_%d" % s,
                "fichas de 5 bytes [puerta][tipo][y][x][e] hasta 0xFF (la Y primero, "
                "como en los actores: el tercer byte no pasa de 184): p00:441A "
                "monta una ficha en 0xC3D0 por puerta (el cerrojo sale de 0xC450 "
                "y de 0xB046)", "p00:441A", F=5)
    declara(T, 0xB046, 0xB0E6, "cerrojo_de_cada_puerta",
            "160 bytes, uno por puerta: p00:4347 pone a 1 en 0xC450 las que no "
            "tienen los bits 6-7 a 10, y p00:4434 lee el byte de la puerta",
            ["p00:4347", "p00:4434"], F=16)
    heads = [(0xB0E2, "p01:780F"), (0xB0FC, "p01:7814"), (0xB102, "p01:7819"),
             (0xB12B, "p01:781E"), (0xB16E, "p01:7823"), (0xB1AC, "p01:7828"),
             (0xB1B2, "p01:7832"), (0xB1DB, "p01:7837"), (0xB1F5, "p01:783C"),
             (0xB247, "p01:7841"), (0xB261, "p01:7846"), (0xB29F, "p01:784B")]
    for i, (d, lec) in enumerate(heads):
        z = heads[i + 1][0] if i + 1 < len(heads) else 0xB2BF
        if d < 0xB0E6:
            declara(T, 0xB0E6, z, "puerta_%04X_resto" % d,
                    "el resto del registro de puerta que %s carga desde 0x%04X: "
                    "sus 4 primeros bytes son los ultimos cerrojos de 0xB046" % (lec, d), lec)
            continue
        declara(T, d, z, "puerta_%04X" % d,
                "dibujo de una puerta de los tipos 7-19 que %s carga en DE para "
                "p01:784E: %d filas x %d columnas de numeros de ficha ([filas]"
                "[columnas] y las fichas; L_44AF las pinta en la X/Y de la "
                "puerta)" % (lec, leer(T, d), leer(T, d + 1)), lec)
    # los bloques de fichas: [filas][columnas] y filas x columnas numeros de
    # ficha (L_44AF: el bucle de dentro, djnz, avanza la X; el de fuera la Y)
    conocidos = {0xB31F: "p15:BEF7", 0xB325: "p15:BF01", 0xB33F: "p15:BF1C",
                 0xB369: "p01:692A", 0xB40D: "p01:6933", 0xB595: "p00:44A7",
                 0xB5F7: "p00:44AC", 0xB41F: "p00:5E28", 0xB425: "p00:5E1C",
                 0xB42B: "p00:5E23", 0xB431: "p03:B86B", 0xB4E3: "p03:B8C9"}
    que = {0xB431: "el Hind D (p03:B862 lo pinta en X=0x40, Y=0 si el primer "
                   "actor es del tipo 0x26)",
           0xB4E3: "el suelo de la sala del Hind D sin el Hind (p03:B8C6, desde "
                   "p01:7695)",
           0xB595: "Metal Gear (p12:BC26 lo pinta en X=0x60, Y=0x20 si el primer "
                   "actor es del tipo 0x11)",
           0xB5F7: "el suelo de la sala de Metal Gear sin Metal Gear (p12:BC36, "
                   "desde p01:767E)"}
    a = 0xB31F
    while a < 0xB659:
        f, c = leer(T, a), leer(T, a + 1)
        z = a + 2 + f * c
        lec = conocidos.get(a, "p00:449E")
        declara(T, a, z, "bloque_%04X" % a,
                "un bloque de %d filas x %d columnas de numeros de ficha "
                "([filas][columnas] y las fichas) que p00:44BA pinta con "
                "L_4104%s; %s" % (
                    f, c, ": " + que[a] if a in que else "",
                    "lo carga " + lec if a in conocidos else
                    "sigue al anterior, su lector no esta a la vista"), lec, F=c)
        a = z
    if a != 0xB659:
        AVISOS.append("los bloques de fichas acaban en %04X, no en B659" % a)
    declara(T, 0xB6C6, 0xB8BC, "indice_de_llamadas_de_radio",
            "251 punteros, uno por sala (p00:48C0 -> L_42B1), a las llamadas de "
            "radio de esa sala", "p00:48C0", F="w8")
    vistos = set()
    for s in range(251):
        d = palabra(T, 0xB6C6 + 2 * s)
        if d in vistos:
            continue
        vistos.add(d)
        a = d
        if leer(T, a) != 0:
            while not (leer(T, a) & 1):
                a += 2
            a += 2
        else:
            a += 1
        declara(T, d, a, "radio_de_la_sala_%d" % s,
                "las llamadas de radio de una sala: 0 = ninguna; si no, "
                "parejas [frecuencia (nibble alto, en 0x490C) | bits][texto] "
                "hasta la que tiene el bit 0 (p00:48D0)", "p00:48D0", F=2)
    for d, lec in ((0xBC9F, "p15:B959"), (0xBCBD, "p15:BAE1"), (0xBCDB, "p15:B979"),
                   (0xBCE4, "p15:B96F"), (0xBCF1, "p15:BABE"), (0xBD00, "p15:BA5E"),
                   (0xBD11, "p15:BA04"), (0xBD1A, "p15:B9E6"), (0xBD25, "p15:BA0A"),
                   (0xBD3B, "p15:BA1C"), (0xBD41, "p15:BBE1"), (0xBD48, "p15:BBCE"),
                   (0xBD52, "p15:BAFC")):
        declara(T, d, texto_pos(T, d), "rotulo_%04X" % d,
                "rotulo con posicion de la pantalla de guardar y cargar (L_510C), "
                "que %s escribe" % lec, lec)


def despachadores():
    """Las tablas del despachador de Konami (p00:41EA), que van pegadas detras
    de su `call` y estan en los .nocode (tools/bancos.py): aqui se declaran
    con sus destinos."""
    import re
    for p in range(16):
        ruta = os.path.join(RAIZ, "src", nombre(p) + ".nocode")
        if not os.path.exists(ruta):
            continue
        for ln in open(ruta, encoding="utf-8"):
            m = re.match(r"(0x[0-9A-Fa-f]+)\s+(0x[0-9A-Fa-f]+)\s+tabla de (\d+) palabras del despachador \(call 0x41EA en (0x[0-9A-Fa-f]+)\)", ln.strip())
            if not m:
                continue
            ini, fin, n, pc = int(m.group(1), 0), int(m.group(2), 0), int(m.group(3)), int(m.group(4), 0)
            dest = [ROM[p * TAM_PAGINA + (ini - ORG[p]) + 2 * k] | (ROM[p * TAM_PAGINA + (ini - ORG[p]) + 2 * k + 1] << 8)
                    for k in range(n)]
            BLOQUES.append(dict(p=p, ini=ini, fin=fin, nombre="tabla_%04X" % ini,
                                texto="%d destinos del despachador p00:41EA (call en %s:%04X, el "
                                      "indice en A): %s" % (n, nombre(p), pc,
                                                            ", ".join("%04X" % d for d in dest)),
                                lectores=["%s:%04X" % (nombre(p), pc)], F="w%d" % min(n, 8)))


def relleno():
    """La cola de 0xFF de los bancos de zona y del 3."""
    for p in (3, 6, 9, 12, 15):
        fin = ORG[p] + TAM_PAGINA
        a = fin
        while a > ORG[p] and ROM[p * TAM_PAGINA + (a - 1 - ORG[p])] == 0xFF:
            a -= 1
        if fin - a >= 16:
            BLOQUES.append(dict(p=p, ini=a, fin=fin, nombre="relleno_ff",
                                texto="%d bytes a 0xFF hasta el final del banco: "
                                "relleno" % (fin - a), lectores=["nadie"], F=16))


# ------------------------------------------------------------- escritura

def listado(b):
    """[(direccion, linea)] del listado del banco b, para quien_apunta.py."""
    import re
    out = []
    ruta = os.path.join(RAIZ, "src", "metalgear_%s.asm" % nombre(b))
    for ln in open(ruta, encoding="utf-8"):
        m = re.search(r";([0-9a-f]{4})", ln)
        if m and ln.startswith("	"):
            out.append((int(m.group(1), 16), ln.split(";")[0].strip()))
    return out


def codigo_trazado(p):
    m = bytearray(TAM_PAGINA)
    ruta = os.path.join(RAIZ, "work", nombre(p) + ".trace.json")
    if os.path.exists(ruta):
        for k, a, b in json.load(open(ruta))["blocks"]:
            if k == "c":
                for i in range(a - ORG[p], b - ORG[p]):
                    m[i] = 1
    return m


def a_mano(p):
    out = []
    ruta = os.path.join(RAIZ, "src", nombre(p) + ".notes")
    if not os.path.exists(ruta):
        return out
    dentro = False
    for ln in open(ruta, encoding="utf-8"):
        if ln.startswith(CAB):
            dentro = True
        elif ln.startswith(FIN):
            dentro = False
        elif not dentro and ln.startswith("D "):
            q = ln.split(None, 3)
            out.append((int(q[1], 0), int(q[2], 0)))
    return out


def junta(bloques):
    """Funde los que se solapan en uno, diciendo cuantos eran."""
    bloques.sort(key=lambda b: (b["ini"], b["fin"]))
    out = []
    for b in bloques:
        if out and b["ini"] < out[-1]["fin"]:
            u = out[-1]
            u.setdefault("n", 1)
            u["n"] += 1
            u["fin"] = max(u["fin"], b["fin"])
            for l in b["lectores"]:
                if l not in u["lectores"]:
                    u["lectores"].append(l)
            u["solapa"] = u.get("solapa", "") + " (%s %04X-%04X)" % (b["nombre"], b["ini"], b["fin"])
        else:
            out.append(dict(b))
    return out


def main(argv):
    escribe = "--escribe" in argv
    sonido()
    tilesets()
    salas()
    sprites()
    textos()
    banco5()
    banco6()
    banco15()
    despachadores()
    relleno()
    por = defaultdict(list)
    for b in BLOQUES:
        por[b["p"]].append(b)
    total = 0
    for p in sorted(por):
        cod = codigo_trazado(p)
        mano = a_mano(p)
        lineas = []
        buenos = []
        for b in por[p]:
            pisa = sum(cod[i - ORG[p]] for i in range(b["ini"], b["fin"]))
            if pisa:
                AVISOS.append("%s %04X-%04X %s PISA CODIGO (%d bytes): no se escribe"
                              % (nombre(p), b["ini"], b["fin"], b["nombre"], pisa))
                continue
            if any(b["ini"] < f and i < b["fin"] for i, f in mano):
                AVISOS.append("%s %04X-%04X %s pisa una D a mano: no se escribe"
                              % (nombre(p), b["ini"], b["fin"], b["nombre"]))
                continue
            buenos.append(b)
        for b in junta(buenos):
            txt = b["texto"]
            if b.get("n"):
                txt += "; se solapan %d bloques:%s" % (b["n"], b["solapa"])
                print("  SOLAPE %s %04X-%04X %s:%s" % (nombre(p), b["ini"], b["fin"], b["nombre"], b["solapa"][:160]))
            txt += "; lo leen %s (%d bytes)" % (", ".join(b["lectores"][:8]), b["fin"] - b["ini"])
            lineas.append("D 0x%04X 0x%04X %s  %s" % (b["ini"], b["fin"], b["nombre"], txt))
            if b["F"]:
                lineas.append("F 0x%04X %s" % (b["ini"], b["F"]))
            total += b["fin"] - b["ini"]
        print("%s: %d bloques, %d bytes" % (nombre(p), len([l for l in lineas if l.startswith("D ")]),
                                            sum(int(l.split()[2], 0) - int(l.split()[1], 0)
                                                for l in lineas if l.startswith("D "))))
        if escribe:
            ruta = os.path.join(RAIZ, "src", nombre(p) + ".notes")
            filas = open(ruta, encoding="utf-8").read().split("\n") if os.path.exists(ruta) else ["# notas del banco %02d" % p, ""]
            if CAB in filas:
                i, f = filas.index(CAB), filas.index(FIN)
                filas[i:f + 1] = [CAB] + lineas + [FIN]
            else:
                while filas and filas[-1] == "":
                    filas.pop()
                filas += ["", CAB] + lineas + [FIN, ""]
            open(ruta, "w", encoding="utf-8", newline="\n").write("\n".join(filas))
    print("total %d bytes" % total)
    for a in AVISOS:
        print("AVISO:", a)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
