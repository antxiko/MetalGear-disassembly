#!/usr/bin/env python3
"""Ficha de cada tipo de actor (1-64) desde las tablas del banco 5.

Todo sale de rutinas del listado, citadas en cada funcion.

  - Aguante: p00:574E-5755 copia p05:984F + tipo en (ix+0x0D) al crear el
    actor (L_41E5 suma el tipo tal cual: A = (0xEC00), el tipo que p00:571C
    pone en (ix+0)).
  - Dano: p02:8C33 pasa por los proyectiles (0xC200, 0x40 bytes cada uno)
    con el arma de 0xC142; p00:4388 toma el puntero p05:87B7 + 2 x (arma - 1)
    y p02:8CDC-8CE0 lee ese puntero + (tipo - 1) (L_4396 -> L_41E0); 0xFF
    = no le hace nada (p02:8CE4). p02:8D28-8D2F lo resta de (iy+0x0D) y se
    queda en 0 si no llega.
  - Antes del dano, p02:8C8A-8C91: la caja de choque del tipo en la tabla
    del arma (p02:8C38: p05:8951 con las armas 1, 2, 4 y 7; p02:8C47:
    p05:8992 con la 3, la 5 y la 6) + (tipo - 1) (L_43A3); 0xFF = el
    proyectil no lo toca, y el dano no se mira.
  - Metal Gear (tipo 0x11) con el arma 5 (p02:8CE7-8D26): cada golpe que
    entra mete 1 o 2 (1 si (iy+5) >= (ix+6): la X del actor no es menor que
    la del proyectil) delante de 16 bytes en 0xC1BF-0xC1CE (lddr); solo
    cuando los 16 casan con p02:8D3B pone el dano 2 y borra 0xD08D y
    0xD10D. Con otro orden el golpe no quita nada (jr nz, L_8D32).
  - Sprites por tipo p05:971B + tipo (lo de sprites.py) y salas donde lo
    crea p00:564C (sprites.actores_de_sala).
Los nombres de tipo son los de Pazos (constants/Enums.asm), solo como
referencia acreditada; los de arma, del menu (p06:B865).
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from bloques import leer, palabra              # noqa: E402

BANCO = 5                  # el trio que pone L_424E: p05 en 0x8000-0x9FFF
N_TIPOS = 64
ARMAS = range(1, 8)


def aguante(tipo):
    """p00:574E: el byte de p05:984F + tipo que va a (ix+0x0D)."""
    return leer(BANCO, 0x984F + tipo)


def tabla_de_dano(arma):
    """p00:4388: el puntero p05:87B7 + 2 x (arma - 1)."""
    return palabra(BANCO, 0x87B7 + 2 * (arma - 1))


def caja(arma, tipo):
    """p02:8C8D: el byte de la caja de choque; None si es 0xFF."""
    t = 0x8951 if arma in (1, 2, 4, 7) else 0x8992
    b = leer(BANCO, t + tipo - 1)
    return None if b == 0xFF else b


def dano(arma, tipo):
    """p02:8CDC: (tabla del arma) + tipo - 1; None si es 0xFF o si el
    proyectil no lo toca (caja)."""
    if caja(arma, tipo) is None:
        return None
    d = leer(BANCO, tabla_de_dano(arma) + tipo - 1)
    return None if d == 0xFF else d


def orden_de_metal_gear():
    """p02:8D3B: los 16 lados que comprueba p02:8D18, el mas reciente
    primero (lddr mete cada golpe en 0xC1BF y empuja los demas)."""
    return [leer(2, 0x8D3B + i) for i in range(16)]


def golpes(arma, tipo):
    """Cuantos golpes del arma hacen falta para dejar (ix+0x0D) a 0."""
    d, v = dano(arma, tipo), aguante(tipo)
    if not d:
        return None
    return -(-v // d)


def ficha(tipo):
    import sprites as SP
    import salas as S
    from dibuja_sprites import PAZOS
    salas = sorted({r for r in range(S.N_SALAS) if S.es_sala(r)
                    for a in SP.actores_de_sala(r) if a[0] == tipo})
    return {
        "tipo": tipo,
        "pazos": PAZOS.get(tipo),
        "aguante": aguante(tipo),
        "dano": {w: dano(w, tipo) for w in ARMAS},
        "salas": salas,
    }


def main(argv):
    from dibuja_sprites import NOMBRE_DE_ARMA
    print("tipo  Pazos              aguante  " + " ".join("%8s" % NOMBRE_DE_ARMA[w] for w in ARMAS) + "  salas")
    for t in range(1, N_TIPOS + 1):
        f = ficha(t)
        a = f["aguante"]
        print("%4d  %-18s %7s  " % (t, f["pazos"], "-" if a == 0xFF else a)
              + " ".join("%8s" % ("-" if f["dano"][w] is None else f["dano"][w]) for w in ARMAS)
              + "  %d" % len(f["salas"]))
    print("\nMetal Gear con %s: orden p02:8D3B (el ultimo golpe primero): %s"
          % (NOMBRE_DE_ARMA[5], " ".join(str(b) for b in orden_de_metal_gear())))


if __name__ == "__main__":
    main(sys.argv)
