#!/usr/bin/env python3
"""Dibuja los sprites de Metal Gear desde la ROM (tools/sprites.py, cuadros.py).

Uso: dibuja_sprites.py tipos <dir> [--escala N]
         un PNG por tipo de actor con sprites: sus cuadros (los que el listado
         le atribuye, cuadros.py) con los patrones del juego de sprites de sus
         salas y sus colores (tipo_NN.png), y tipos.txt con el detalle
     dibuja_sprites.py snake <png> [--escala N]
         los 53 juegos de patrones de Snake con sus atributos
     dibuja_sprites.py cuadros <dir> [--escala N]
         los 143 cuadros, cada uno con todos los juegos de sprites que tienen
         cargados sus patrones (para cotejar a mano a quien pertenece)
     dibuja_sprites.py sala <sala> <png>
         la sala con sus actores donde los crea p00:564C, en su cuadro de
         creacion (o el 0 si su rutina no lo cambia)
Ninguna imagen es una captura: todo sale de las tablas del cartucho.
"""
import os
import sys

try:
    from PIL import Image, ImageDraw
except ImportError:
    Image = ImageDraw = None

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))
import salas as S        # noqa: E402
import sprites as SP     # noqa: E402
import cuadros as C      # noqa: E402
import dibuja as D       # noqa: E402

# Nombres de los tipos: referencia acreditada (Pazos, GuillianSeed/MetalGear,
# constants/Enums.asm), NO leidos en nuestro listado; solo para rotular.
PAZOS = {1: "BRIDGE_CTRL", 2: "BRIDGE", 3: "HELPME_VOICE", 4: "GUARD_SLOW", 5: "GUARD_MEDIUM",
         6: "CAMERA", 7: "LAND_MINE", 8: "GAS", 9: "TANK", 10: "GUARD_ALERT", 11: "GUARD_REDALERT",
         12: "TANK_SHELL_AIR", 13: "SHOOTER", 14: "GUARD_ELEVATOR", 15: "ROLLING_BARREL",
         16: "PITFALL", 17: "METAL_GEAR", 18: "BULLDOZER", 19: "GUARD_EXIT_LORRY",
         20: "JETPACK_TAKEOFF", 21: "JETPACK_SWITCH", 22: "JETPACK", 23: "TANK_SHELL_BOSS",
         24: "GUARD_SWITCH", 25: "DOG", 26: "ARNOLD", 27: "DOG_BASEMENT", 28: "LORRY_SHOOTER",
         29: "SPAWN_DOG", 30: "GUARD_FAST", 31: "SCORPION", 32: "BIG_BOSS", 33: "SHOT_GUNNER",
         34: "MACH_GUN_KID", 35: "LASER", 36: "FIRE_TROOPER", 37: "FLAME", 38: "HIND_D",
         39: "SPAWN_TANK_SHELL", 40: "SPAWN_GUARD_ELEV", 41: "COWARD_DUCK", 42: "ACTORS_2A",
         43: "SGUNNER_SHOT", 44: "POWER_SWITCH", 45: "CAPTURE_GUARD", 46: "DESERT_SECURITY",
         47: "GUARD_BULLET", 48: "SENTINEL", 49: "PRISONER1", 50: "ELLEN", 51: "GREY_FOX",
         52: "MADNAR", 53: "CAMERA_LASER", 54: "LASER_SHOT", 55: "FAKE_MADNAR", 56: "PRISONER6",
         57: "GUARD_SILENCER", 58: "BULLET_HORIZ", 59: "BULLET_VERT", 60: "SHOT_M_GUN_KID",
         61: "BULLET", 62: "TANK_BULLET", 63: "BOOMERANG", 64: "SLEEPING_SIGN"}

FONDO = (24, 24, 24)


def escala_de(argv, defecto=3):
    if "--escala" in argv:
        return int(argv[argv.index("--escala") + 1])
    return defecto


def pinta_puntos(img, px, pal, x0, y0, escala=1):
    """px {(x, y): color} -> img desde (x0, y0)."""
    p = img.load()
    for (x, y), c in px.items():
        for dy in range(escala):
            for dx in range(escala):
                p[x0 + x * escala + dx, y0 + y * escala + dy] = pal[c]


def recorte(sprites, vram, pal, escala, margen=1):
    """Un PNG RGB con solo esos sprites, pegados a la esquina."""
    px = SP.compone(sprites, vram)
    if not px:
        return Image.new("RGB", (16 * escala, 16 * escala), FONDO)
    x0, y0, x1, y1 = SP.caja(px)
    img = Image.new("RGB", ((x1 - x0 + 2 * margen) * escala, (y1 - y0 + 2 * margen) * escala), FONDO)
    pinta_puntos(img, {(x - x0 + margen, y - y0 + margen): c for (x, y), c in px.items()}, pal, 0, 0, escala)
    return img


def salas_de_tipo(t):
    return [r for r in range(0xDE) if any(a[0] == t for a in SP.actores_de_sala(r))]


def tira(imagenes, rotulos, titulo, escala):
    """Las imagenes en fila con su rotulo debajo y un titulo encima."""
    w = max(sum(i.width + 6 for i in imagenes) + 6, 6 * len(titulo) + 12)
    h = 20 + max(i.height for i in imagenes) + 14
    out = Image.new("RGB", (w, h), FONDO)
    d = ImageDraw.Draw(out)
    d.text((6, 4), titulo, fill=(255, 255, 255))
    x = 6
    for img, rot in zip(imagenes, rotulos):
        out.paste(img, (x, 20))
        d.text((x, 20 + img.height + 2), rot, fill=(255, 255, 0))
        x += img.width + 6
    return out


def tipos_png(directorio, escala):
    os.makedirs(directorio, exist_ok=True)
    codigo, tablas = C.lee_listado(), C.tablas_nocode()
    detalle = []
    for t in range(1, SP.N_TIPOS + 1):
        n = SP.sprites_por_tipo(t)
        if n == 0:
            continue
        salas = salas_de_tipo(t)
        juegos = sorted({SP.juego_de_sala(r) for r in salas})
        cu = C.cuadros_por_tipo(t, codigo, tablas)
        linea = "tipo %2d (Pazos: %s): %d sprites, colores %s, salas %s, juegos %s, cuadros al crear %s, todos %s%s%s" % (
            t, PAZOS.get(t, "?"), n, " ".join("%02X" % c for c in SP.colores_por_tipo(t)),
            salas or "-", juegos or "-", cu["crear"] or "-", cu["todos"] or "-",
            "; calculados en " + " ".join(C.nombre_de(a) for a, _ in cu["calculados"]) if cu["calculados"] else "",
            "; ajenos (otra cuenta de sprites) %s" % cu["ajenos"] if cu["ajenos"] else "")
        detalle.append(linea)
        print(linea)
        if not juegos or not cu["todos"]:
            continue
        j = juegos[0]
        vram, _ = SP.patrones_del_juego(j)
        pal = [S.rgb(c) for c in SP.paleta_de_sala(salas[0])]
        imgs, rots = [], []
        for c in cu["todos"]:
            imgs.append(recorte(SP.sprites_de_actor(t, c, 128, 128, envuelve=False), vram, pal, escala))
            rots.append("c%d" % c)
        titulo = "tipo %d (Pazos: %s)  juego %d, sala %d" % (t, PAZOS.get(t, "?"), j, salas[0])
        tira(imgs, rots, titulo, escala).save(os.path.join(directorio, "tipo_%02d.png" % t))
    # las explosiones (p01:7544-75BB), con la cuenta de sprites que pone ahi
    vram2, _ = SP.patrones_del_juego(2)
    vram13, _ = SP.patrones_del_juego(13)
    pal = [S.rgb(c) for c in SP.paleta_de_sala(1)]
    imgs, rots = [], []
    for c, n in C.EXPLOSIONES:
        v = vram13 if n == 18 else vram2
        imgs.append(recorte(SP.sprites_de_actor(4, c, 128, 128, n=n, envuelve=False), v, pal, escala))
        rots.append("c%d (%d spr)" % (c, n))
    tira(imgs, rots, "explosiones (p01:7544-75BB): 0x6A-0x6C con 2 sprites, 0x7F-0x81 con 18 (tanque y bulldozer)", escala).save(
        os.path.join(directorio, "explosiones.png"))
    detalle.append("formulas leidas: " + "; ".join("%s -> %s" % (C.nombre_de(a), f[1]) for a, f in sorted(C.FORMULAS.items())))
    open(os.path.join(directorio, "tipos.txt"), "w", encoding="utf-8").write("\n".join(detalle) + "\n")


def snake_png(ruta, escala):
    pal = [S.rgb(c) for c in SP.paleta_de_snake(S.paleta_de_juego())]
    imgs, rots = [], []
    for k in range(SP.N_JUEGOS_SNAKE):
        vram = SP.patrones_de_snake(k)
        imgs.append(recorte(SP.cuadro_de_snake(k, 128, 128, envuelve=False), vram, pal, escala))
        rots.append("%d" % k)
    tira(imgs, rots, "Snake: los 53 juegos de patrones (p10:6000) con sus atributos (p10:609F)", escala).save(ruta)


def cuadros_png(directorio, escala):
    os.makedirs(directorio, exist_ok=True)
    juegos = {}
    for j in range(SP.N_JUEGOS):
        juegos[j] = SP.patrones_del_juego(j)
    for c in range(SP.N_CUADROS):
        n = SP.largo_de_cuadro(c)
        if n <= 0:
            continue
        sprites = SP.cuadro(c, n)
        imgs, rots = [], []
        for j, (vram, cargados) in juegos.items():
            if all((p & ~3) in cargados for (_, _, p) in sprites):
                cols = [0x02, 0x4D] * ((n + 1) // 2)
                lista = [(128 + SP.con_signo(dy), 128 + SP.con_signo(dx), p, cols[i]) for i, (dy, dx, p) in enumerate(sprites)]
                imgs.append(recorte(lista, vram, [S.rgb(x) for x in SP.paleta_de_snake(S.paleta_de_juego())], escala))
                rots.append("j%d" % j)
        if imgs:
            tira(imgs, rots, "cuadro %d: %d sprites (%s)" % (c, n, " ".join("%02X" % p for (_, _, p) in sprites)), escala).save(
                os.path.join(directorio, "cuadro_%03d.png" % c))


_CACHE = {}


def actores_en_sala(img, r, x0=0, y0=0):
    """Pinta sobre img (la sala r ya dibujada en (x0, y0)) sus actores donde
    los crea p00:564C, cada uno en su cuadro de creacion (cuadros.py; el 0
    si su rutina no lo cambia). Devuelve cuantos sprites puso."""
    if "codigo" not in _CACHE:
        _CACHE["codigo"], _CACHE["tablas"] = C.lee_listado(), C.tablas_nocode()
    j = SP.juego_de_sala(r)
    if ("juego", j) not in _CACHE:
        _CACHE[("juego", j)] = SP.patrones_del_juego(j)[0]
    vram = _CACHE[("juego", j)]
    pal = [S.rgb(c) for c in SP.paleta_de_sala(r)]
    sprites = []
    for (t, y, x) in SP.actores_de_sala(r):
        if SP.sprites_por_tipo(t) == 0:
            continue
        if ("tipo", t) not in _CACHE:
            _CACHE[("tipo", t)] = C.cuadros_por_tipo(t, _CACHE["codigo"], _CACHE["tablas"])
        cu = _CACHE[("tipo", t)]
        c = cu["crear"][0] if cu["crear"] else 0
        sprites += SP.sprites_de_actor(t, c, y, x)
    px = {k: v for k, v in SP.compone(sprites, vram).items() if 0 <= k[0] < 256 and 0 <= k[1] < 192}
    pinta_puntos(img, px, pal, x0, y0)
    return len(sprites)


def sala_png(r, ruta):
    img, _ = D.pinta_sala(r)
    n = actores_en_sala(img, r)
    img.save(ruta)
    print("%s: %d actores, %d sprites" % (ruta, len(SP.actores_de_sala(r)), n))


def main(argv):
    if len(argv) < 3:
        sys.exit(__doc__)
    esc = escala_de(argv)
    if argv[1] == "tipos":
        tipos_png(argv[2], esc)
    elif argv[1] == "snake":
        snake_png(argv[2], esc)
    elif argv[1] == "cuadros":
        cuadros_png(argv[2], esc)
    elif argv[1] == "sala":
        sala_png(int(argv[2], 0), argv[3])
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
