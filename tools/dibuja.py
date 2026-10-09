#!/usr/bin/env python3
"""Dibuja salas y mapas de Metal Gear desde la ROM (tools/salas.py).

Uso: dibuja.py sala <sala> <png>            una sala (SCREEN 5, 256 x 192)
     dibuja.py salas <directorio>            las 251, sala_NNN.png
     dibuja.py mapas <directorio> [--numeros] [--actores]
                                            un PNG por zona: las salas colocadas
                                            por sus salidas (p05:8E0E, BFS por
                                            los lados) y, debajo, las salas a las
                                            que solo se entra por una puerta;
                                            con --actores, los enemigos donde
                                            los crea p00:564C (dibuja_sprites.py)
     dibuja.py zonas                        solo el reparto de salas por zona
Ninguna imagen es una captura: todo sale de las tablas del cartucho.
"""
import os
import sys
from collections import deque

try:
    from PIL import Image, ImageDraw      # solo lo necesitan los PNG
except ImportError:
    Image = ImageDraw = None

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))
import salas as S  # noqa: E402
import pagina1 as P1  # noqa: E402
import dibujos as D  # noqa: E402

ANCHO, ALTO = 256, 192


def pinta_sala(r, img=None, x0=0, y0=0, puertas=True, objetos=True, jefes=True):
    """La sala r sobre img en (x0, y0), con sus puertas cerradas, sus
    objetos sin coger copiados de la pagina 1 (tools/pagina1.py) y el jefe
    que se pinta con fichas (tools/dibujos.py), en el orden de la entrada a
    la sala: puertas p01:6E73, objetos p01:6E7C, jefe p01:6EAD/6EB3.
    Devuelve (img, fichas que faltan)."""
    if img is None:
        img = Image.new("RGB", (ANCHO, ALTO))
    px = img.load()
    pal = [S.rgb(c) for c in S.paleta_de_sala(r)]
    indices, faltan = S.pixeles_de_sala(r)
    for y in range(ALTO):
        fila = indices[y]
        for x in range(ANCHO):
            px[x0 + x, y0 + y] = pal[fila[x]]
    encima = {}
    if puertas:
        encima.update(P1.pixeles_de_puertas(r))
        px7, f7 = D.pixeles_de_puertas_dibujadas(r)
        encima.update(px7)
        faltan = faltan | f7
    if objetos:
        encima.update(P1.pixeles_de_objetos(r))
    if jefes:
        pj, fj = D.pixeles_de_jefe(r)
        encima.update(pj)
        faltan = faltan | fj
    for (x, y), c in encima.items():
        if 0 <= x < ANCHO and 0 <= y < ALTO:
            px[x0 + x, y0 + y] = pal[c]
    return img, faltan


def salidas(r):
    """Las vecinas de verdad: sin 0xFF, sin la propia sala (las salas 64-69
    se apuntan a si mismas a izquierda y derecha) y sin los ascensores."""
    out = []
    for k, v in enumerate(S.vecinas(r)):
        if v is not None and v != r and v < 0xF0 and S.es_sala(v):
            out.append((v, k))
    return out


def zonas():
    """Las salas con salidas, agrupadas por ellas y colocadas en una rejilla
    (BFS por los lados): [(posiciones {sala: (x, y)}, choques, tras_puertas)].
    tras_puertas son las salas sin salidas a las que se llega por una puerta
    desde la zona (y desde esas, por mas puertas): [(sala, desde, puerta)]."""
    vistas = set()
    out = []
    for inicio in range(S.N_SALAS):
        if inicio in vistas or inicio >= 0xF0 or not S.es_sala(inicio) or not salidas(inicio):
            continue
        pos = {inicio: (0, 0)}
        cola = deque([inicio])
        vistas.add(inicio)
        choques = []
        while cola:
            r = cola.popleft()
            x, y = pos[r]
            for v, k in salidas(r):
                nx, ny = x + (0, 0, -1, 1)[k], y + (-1, 1, 0, 0)[k]
                if v in pos:
                    if pos[v] != (nx, ny):
                        choques.append((r, S.LADOS[k], v, pos[v], (nx, ny)))
                    continue
                vistas.add(v)
                if (nx, ny) in pos.values():
                    choques.append((r, S.LADOS[k], v, None, (nx, ny)))
                    continue
                pos[v] = (nx, ny)
                cola.append(v)
        out.append((pos, choques, []))
    colocadas = set()
    for pos, _, _ in out:
        colocadas |= set(pos)
    for pos, _, tras in out:
        cola = deque(sorted(pos))
        vistas = set(pos)
        while cola:
            r = cola.popleft()
            for (p, _t, _y, _x, e) in S.puertas(r):
                if e >= 0xF0 or e in colocadas or e in vistas or not S.es_sala(e):
                    continue
                vistas.add(e)
                tras.append((e, r, p))
                cola.append(e)
    return out


def etiqueta(d, x, y, texto, color=(255, 255, 0)):
    d.rectangle([x + 2, y + 2, x + 6 + 6 * len(texto), y + 14], fill=(0, 0, 0))
    d.text((x + 5, y + 3), texto, fill=color)


def mapa_png(pos, tras, ruta, numeros=False, actores=False):
    if actores:
        import dibuja_sprites        # los sprites, aparte: tools/sprites.py
    xs = [p[0] for p in pos.values()]
    ys = [p[1] for p in pos.values()]
    mx, my = min(xs), min(ys)
    cols = max(xs) - mx + 1
    filas = max(ys) - my + 1
    por_fila = max(cols, 4)
    filas_tras = (len(tras) + por_fila - 1) // por_fila
    w, h = por_fila * ANCHO, (filas + filas_tras) * ALTO + (24 if tras else 0)
    img = Image.new("RGB", (w, h), (24, 24, 24))
    d = ImageDraw.Draw(img)
    faltan = set()
    for r, (x, y) in pos.items():
        _, f = pinta_sala(r, img, (x - mx) * ANCHO, (y - my) * ALTO)
        faltan |= f
        if actores:
            dibuja_sprites.actores_en_sala(img, r, (x - mx) * ANCHO, (y - my) * ALTO)
        if numeros:
            etiqueta(d, (x - mx) * ANCHO, (y - my) * ALTO, "%d" % r)
            asc = [v for v in S.vecinas(r) if v is not None and v >= 0xF0]
            if asc:
                etiqueta(d, (x - mx) * ANCHO, (y - my) * ALTO + 14,
                         "ascensor " + " ".join("%02X" % a for a in asc), (0, 255, 255))
    if tras:
        y0 = filas * ALTO
        d.rectangle([0, y0, w, y0 + 24], fill=(60, 60, 60))
        d.text((6, y0 + 6), "tras una puerta (sala <- desde, puerta):", fill=(255, 255, 255))
        y0 += 24
        for i, (r, desde, p) in enumerate(tras):
            x, y = (i % por_fila) * ANCHO, y0 + (i // por_fila) * ALTO
            _, f = pinta_sala(r, img, x, y)
            faltan |= f
            if actores:
                dibuja_sprites.actores_en_sala(img, r, x, y)
            if numeros:
                etiqueta(d, x, y, "%d <- %d, puerta %d" % (r, desde, p), (0, 255, 0))
    img.save(ruta)
    return faltan


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "sala":
        img, faltan = pinta_sala(int(argv[2], 0))
        img.save(argv[3])
        print("%s: %s" % (argv[3], "fichas sin cargar %s" % sorted(faltan) if faltan else "OK"))
    elif argv[1] == "salas":
        os.makedirs(argv[2], exist_ok=True)
        for r in range(S.N_SALAS):
            if S.palabra(13, 0x6000 + 2 * r) < 0x6280:
                continue
            img, faltan = pinta_sala(r)
            img.save(os.path.join(argv[2], "sala_%03d.png" % r))
    elif argv[1] in ("mapas", "zonas"):
        if argv[1] == "mapas":
            os.makedirs(argv[2], exist_ok=True)
        for i, (pos, choques, tras) in enumerate(zonas()):
            xs = [p[0] for p in pos.values()]
            ys = [p[1] for p in pos.values()]
            print("zona %2d: %3d salas (%s), %d x %d; %d tras puertas%s" % (
                i, len(pos), ", ".join(str(r) for r in sorted(pos)[:6]) + (" ..." if len(pos) > 6 else ""),
                max(xs) - min(xs) + 1, max(ys) - min(ys) + 1, len(tras),
                "; CHOQUES %d: %s" % (len(choques), choques[:3]) if choques else ""))
            if argv[1] == "mapas":
                faltan = mapa_png(pos, tras, os.path.join(argv[2], "zona_%02d.png" % i), "--numeros" in argv, "--actores" in argv)
                if faltan - {1, 2}:
                    print("   fichas sin cargar %s" % sorted(faltan))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
