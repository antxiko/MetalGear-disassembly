#!/usr/bin/env python3
"""Que cuadros de sprites ((ix+0x0B)) usa cada tipo de actor, leido del listado.

Cada tipo (1-64) tiene dos entradas: la de crearlo (despachador p00:575F,
tabla p00:5762) y la de cada cuadro (p01:722C, tabla p01:722F, desde el
bucle de actores p01:71E5). Desde las dos se sigue TODO el codigo
alcanzable por saltos, llamadas y los despachadores de estado (`call
0x41EA` + tabla, declaradas en src/pNN.nocode) y se apuntan las
instrucciones `ld (ix+0bh),n`: las que cargan un numero dan un cuadro
seguro; las que cargan un registro se apuntan como "calculado en
p02:XXXX" y hay que leerlas a mano.

Lo que NO se sigue: los dos despachadores de tipo hacia OTROS tipos (un
actor que crea otro, p00:569A) y la BIOS. Es una SOBREaproximacion: un cuadro puede salir en un
tipo que comparte una rutina con otro (los de morir, por ejemplo); la
cuenta de sprites del tipo (p05:971C) descarta los cuadros que no son
suyos (sprites.py los lee con esa cuenta, y un cuadro de 2 sprites leido
con 4 pisa el siguiente).

Uso: cuadros.py            la tabla tipo -> cuadros
     cuadros.py <tipo>     el detalle (de donde sale cada cuadro)
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
from bloques import leer, palabra            # noqa: E402

BANCOS = {0x4000: 0, 0x6000: 1, 0x8000: 2, 0xA000: 3}   # el trio 1-2-3 (L_4248)
RE_INSTR = re.compile(r"^\t([a-z]+)(?:\s+([^\t;]*?))?\s*(?:\t|;)+;?([0-9a-f]{4})")
RE_CODE = re.compile(r"^\t([a-z]+)([^;]*);([0-9a-f]{4})")
POR_TIPO = {0x575F: 0x5762, 0x722C: 0x722F}   # despachadores de tipo: solo la entrada del tipo


def banco_de(a):
    return BANCOS.get(a & 0xE000)


def tablas_nocode():
    """{direccion del call 0x41EA: [destinos]} de los src/pNN.nocode."""
    out = {}
    for p in range(4):
        ruta = os.path.join(RAIZ, "src", "p%02d.nocode" % p)
        if not os.path.exists(ruta):
            continue
        for linea in open(ruta, encoding="utf-8"):
            m = re.match(r"0x([0-9A-F]{4}) 0x([0-9A-F]{4})\s+tabla de (\d+) palabras del despachador \(call 0x41EA en 0x([0-9A-F]{4})\)", linea)
            if m:
                ini, _fin, n, en = int(m.group(1), 16), m.group(2), int(m.group(3)), int(m.group(4), 16)
                out[en] = [palabra(1, ini + 2 * k) for k in range(n)]
    return out


def lee_listado():
    """{direccion: (mnemonico, operandos, siguiente)} de p00-p03 (el trio
    por defecto cuando corre el codigo de los actores)."""
    codigo = {}
    for p in range(4):
        ruta = os.path.join(RAIZ, "src", "metalgear_p%02d.asm" % p)
        previa = None
        for linea in open(ruta, encoding="utf-8", errors="replace"):
            if linea.startswith("\tdef") or linea.startswith("\torg"):
                previa = None
                continue
            m = RE_CODE.match(linea)
            if not m:
                continue
            mn, ops, a = m.group(1), m.group(2).strip(), int(m.group(3), 16)
            if previa is not None:
                codigo[previa] = codigo[previa][:2] + (a,)
            codigo[a] = (mn, ops, None)
            previa = a
    return codigo


def destino(ops, a):
    """La direccion a la que salta/llama una instruccion, o None."""
    t = ops.split(",")[-1].strip()
    m = re.match(r"^L_([0-9A-F]{4})$", t)
    if m:
        return int(m.group(1), 16)
    m = re.match(r"^l([0-9a-f]{4})h$", t)
    if m:
        return int(m.group(1), 16)
    m = re.match(r"^0([0-9a-f]{1,4})h$", t)
    if m:
        return int(m.group(1), 16)
    m = re.match(r"^\$([+-]\d+)$", t)
    if m:
        return a + int(m.group(1))
    return None


def sucesores(a, codigo, tablas, tipo):
    mn, ops, sig = codigo[a]
    out = []
    if mn in ("ret", "reti", "retn"):
        if "," in ops or ops:           # ret cc sigue
            out.append(sig)
        return [s for s in out if s is not None]
    if mn in ("jp", "jr", "call", "djnz"):
        d = destino(ops, a)
        if mn == "call" and d == 0x41EA:
            if a in POR_TIPO:
                out.append(palabra(1, POR_TIPO[a] + 2 * (tipo - 1)))
            else:
                out.extend(tablas.get(a, []))
            return out
        if d is not None and banco_de(d) is not None:
            out.append(d)
        if mn == "call" or mn == "djnz" or "," in ops:
            out.append(sig)
        elif d is None and sig is not None:       # jp (hl): nada
            pass
        return [s for s in out if s is not None]
    return [sig] if sig is not None else []


def alcanzable(entradas, codigo, tablas, tipo):
    vistos = set()
    pila = list(entradas)
    while pila:
        a = pila.pop()
        if a in vistos or a not in codigo:
            continue
        vistos.add(a)
        pila.extend(sucesores(a, codigo, tablas, tipo))
    return vistos


def cuadros_de(vistos, codigo):
    """([cuadros fijos], [(direccion, registro)]) entre lo alcanzado."""
    fijos, calc = set(), []
    for a in sorted(vistos):
        mn, ops, _ = codigo[a]
        if mn == "ld" and ops.startswith("(ix+00bh),"):
            v = ops.split(",", 1)[1].strip()
            m = re.match(r"^0([0-9a-f]{1,2})h$", v)
            if m:
                fijos.add(int(m.group(1), 16))
            else:
                calc.append((a, v))
    return sorted(fijos), calc


def entradas_de_tipo(t):
    """(crear, cada cuadro): p00:5762[tipo - 1] y p01:722F[tipo - 1]; el
    bucle p01:7212 (contadores, (ix+0x0D), bit 7 del tipo) entra siempre."""
    return palabra(1, 0x5762 + 2 * (t - 1)), palabra(1, 0x722F + 2 * (t - 1)), 0x7212


# Sitios que calculan el cuadro y cuya formula esta leida:
# {direccion: (cuadros, de donde sale, tipos a los que vale o None = todos)}
FORMULAS = {
    0x9DA5: (list(range(0, 8)), "p02:9D98: 2 x direccion (ix+0x11, 0-3) + paso (bit 0, que p02:9DDA alterna con L_5B6A y mascara 7)", None),
    0xA930: (list(range(0, 8)), "p03:A920-A930: 2 x (direccion - 1) + bit 2 de (ix+0x0C) + (ix+0x1B), y (ix+0x1B) = 0 (p03:A789)", {10, 11}),
    0xA93C: (list(range(8, 12)), "p03:A934-A93C: direccion (1-4) + 7 + (ix+0x1B), y (ix+0x1B) = 0 (p03:A789)", {10, 11}),
    0x9EDF: (list(range(28, 32)), "p02:9EC8-9EDF: 0x1C + el byte de la tabla p02:9EF6 de la sala (0-3)", {6}),
    0xBC8B: ([130, 131, 132, 133], "p03:BC7C-BC8B: 0x7C + 2 x direccion (3 o 4, p03:BBA4) + paso (bit 2 de (ix+0x0C))", {26}),
    0xBBC5: ([130, 132], "p03:BBBB-BBC5: 0x82 + 2 x (bit al azar)", {26}),
}

# Al destruirse, p01:7544-75BB cambia el cuadro Y la cuenta de sprites
# ((ix+0x20) = B): 0x6A-0x6C con 2 sprites; 0x7F-0x81 con 18 para los
# tipos 9 y 18 (p01:75C6-75D3). [(cuadro, sprites)]
EXPLOSIONES = [(106, 2), (107, 2), (108, 2), (127, 18), (128, 18), (129, 18)]


def cuadros_por_tipo(t, codigo=None, tablas=None):
    """{crear: [cuadros fijos al crearlo], todos: [fijos + formulas leidas],
    calculados: [(direccion, registro)] sin formula}."""
    import sprites as SP
    codigo = codigo or lee_listado()
    tablas = tablas or tablas_nocode()
    e = entradas_de_tipo(t)
    crear, _ = cuadros_de(alcanzable([e[0]], codigo, tablas, t), codigo)
    todos, calc = cuadros_de(alcanzable(e, codigo, tablas, t), codigo)
    todos = set(todos)
    sin = []
    for a, v in calc:
        if a in FORMULAS and (FORMULAS[a][2] is None or t in FORMULAS[a][2]):
            todos |= set(FORMULAS[a][0])
        elif a in (0x7555, 0x75BB):
            continue                      # explosiones: EXPLOSIONES, con otra cuenta de sprites
        else:
            sin.append((a, v))
    # El analisis sigue los dos lados de cada salto condicional, asi que
    # coge cuadros de rutinas vecinas de otro tipo (p03:A4A2-A4FF: el
    # lanzallamas y su llama). La cuenta de sprites del tipo (p05:971C)
    # tiene que ser la de la lista del cuadro: si no, no es suyo.
    n = SP.sprites_por_tipo(t)
    ajenos = sorted(c for c in todos if SP.largo_de_cuadro(c) != n)
    crear = [c for c in crear if c not in ajenos]
    todos = [c for c in sorted(todos) if c not in ajenos]
    return dict(crear=crear, todos=todos, calculados=sin, ajenos=ajenos)


def nombre_de(a):
    b = banco_de(a)
    return "p%02d:%04X" % (b, a) if b is not None else "%04X" % a


def main(argv):
    codigo = lee_listado()
    tablas = tablas_nocode()
    tipos = [int(argv[1], 0)] if len(argv) > 1 else range(1, 65)
    for t in tipos:
        e = entradas_de_tipo(t)
        vistos = alcanzable(e, codigo, tablas, t)
        fijos, calc = cuadros_de(vistos, codigo)
        import sprites as SP
        n = SP.sprites_por_tipo(t)
        print("tipo %2d (%s / %s, %d sprites, %d instr): cuadros %s%s" % (
            t, nombre_de(e[0]), nombre_de(e[1]), n, len(vistos),
            " ".join("%d" % c for c in fijos) if fijos else "-",
            ("; calculados en " + " ".join("%s(%s)" % (nombre_de(a), v) for a, v in calc)) if calc else ""))
        if len(argv) > 1:
            for a in sorted(vistos):
                mn, ops, _ = codigo[a]
                if mn == "ld" and ops.startswith("(ix+00bh),"):
                    print("   %s  ld %s" % (nombre_de(a), ops))


if __name__ == "__main__":
    main(sys.argv)
