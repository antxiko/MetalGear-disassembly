#!/usr/bin/env python3
"""Los textos del cartucho, sacados de la ROM inglesa y de la japonesa.

Lo leido en el listado (p00:52BB empieza_texto, p00:52D7 trozo_de_texto,
p00:5D99 ventana_escribe, p00:5135 caracter):
- p12:A37D: 159 punteros, uno por texto (texto n = puntero n - 1), en la
  misma direccion en las dos versiones.
- Cada texto: [tipo de ventana] y las letras; 0xFE linea nueva, 0xFD otra
  pagina (otro trozo), 0xFF fin; 0xA1 en adelante = trozo compartido n - 0xA1
  (tabla p12:B8A7 en la inglesa, p12:BBCA en la japonesa; cada uno acaba en
  0xFF). La inglesa apunta 69 textos a un 0xFF suelto (p12:B8A6): vacios.
- La letra c es la ficha c + 0x10 de la pagina 1: la fuente p09:B0B2 (0x6C
  caracteres) va de 0x30 a 0x9B y solo cambia en 7 bytes: 0x5C es el punto
  centrado en la japonesa y el punto final en la inglesa, y 0x97 es el
  handakuten en la japonesa y el apostrofo en la inglesa. 0x97 y 0x98 se
  pintan con 4 puntos de ancho (p00:5DE8): las marcas van con la letra de antes.
- Nombres del menu: armas p06:B865 (las dos), objetos p06:B8F6 (inglesa) y
  p06:B8FD (japonesa): los indices que cargan p00:46F0 y p00:47EB.

Uso: textos.py tabla                 la tabla de trabajo (work/textos.md)
     textos.py pagina [DIR_DOCS]     LOS-TEXTOS.md y THE-TEXTS.md
Las ROMs: metalgear.rom (inglesa) y metalgear-jp.rom (japonesa) en la raiz.
"""
import hashlib
import os
import sys
import unicodedata
import zlib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import textos_traduccion as T  # noqa: E402

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ROMS = {"en": os.path.join(RAIZ, "metalgear.rom"),
        "jp": os.path.join(RAIZ, "metalgear-jp.rom")}
SHA1 = {"en": "b656bd19df58fc1ba4628342b87beeec5948e0b3",
        "jp": "a52021f1b257c7c35d626d5d642134091c45e4f4"}

BANCO = 12
TABLA = 0xA37D
N_TEXTOS = 159
TROZOS = {"en": 0xB8A7, "jp": 0xBBCA}
VACIO_EN = 0xB8A6

# La fuente p09:B0B2, dibujada letra a letra.
_COMUN = {0x00: " "}
for _i, _c in enumerate("0123456789"):
    _COMUN[0x30 + _i] = _c
_COMUN.update({0x3A: "©", 0x3B: "★", 0x3C: "→", 0x3D: "!", 0x3E: "!!",
               0x3F: "↵", 0x40: "-", 0x5B: "?", 0x5D: "。", 0x5E: "、",
               0x5F: ",", 0x98: "゙", 0x99: "←", 0x9A: "↑", 0x9B: "↓"})
for _i in range(26):
    _COMUN[0x41 + _i] = chr(ord("A") + _i)
for _i, _c in enumerate("アイウエオカキクケコサシスセソタチツテトナニヌネノ"
                        "ハヒフヘホマミムメモヤユヨラリルレロワヲン"
                        "ァィゥェォッャュョ"):
    _COMUN[0x60 + _i] = _c
FUENTE = {"en": {**_COMUN, 0x5C: ".", 0x97: "'"},
          "jp": {**_COMUN, 0x5C: "・", 0x97: "゚"}}

# Los rotulos ([X][Y], letras, 0xFE otra posicion, 0xFF fin) que el listado
# ingles declara; estan byte a byte iguales en la japonesa.
ROTULOS = [(0, 0x5C1D), (1, 0x6B48), (1, 0x6B4F), (2, 0x9262), (2, 0x9282),
           (2, 0x9293), (2, 0x92AF), (2, 0x92B6), (2, 0x92BE), (6, 0xB805),
           (6, 0xB81F), (6, 0xB833), (15, 0xBC9F), (15, 0xBCBD),
           (15, 0xBCDB), (15, 0xBCE4), (15, 0xBCF1), (15, 0xBD00),
           (15, 0xBD1A), (15, 0xBD3B), (15, 0xBD41), (15, 0xBD48),
           (15, 0xBD52)]


def org(banco):
    return 0x4000 if banco == 0 else 0x6000 + 0x2000 * ((banco - 1) % 3)


def sitio(banco, dire):
    return banco * 0x2000 + dire - org(banco)


def palabra(rom, dire, banco=BANCO):
    o = sitio(banco, dire)
    return rom[o] | rom[o + 1] << 8


def byte(rom, dire, banco=BANCO):
    return rom[sitio(banco, dire)]


def hasta_ff(rom, banco, dire):
    o = sitio(banco, dire)
    return list(rom[o:rom.index(0xFF, o)])


def trozo(rom, version, n):
    """Los bytes del trozo compartido n (sin el 0xFF)."""
    return hasta_ff(rom, BANCO, palabra(rom, TROZOS[version] + 2 * n))


def letras(codigos, version):
    """Los codigos con la fuente de la version; 0x40 tras un kana es la raya."""
    f = FUENTE[version]
    sal = []
    for c in codigos:
        if c not in f:
            sal.append("[%02X]" % c)
        elif c == 0x40 and sal and ("ァ" <= sal[-1][-1] <= "ヺ"
                                    or sal[-1] in ("゙", "゚")):
            sal.append("ー")
        else:
            sal.append(f[c])
    return unicodedata.normalize("NFC", "".join(sal))


def puntero(rom, n):
    return palabra(rom, TABLA + 2 * (n - 1))


def texto(rom, version, n):
    """(tipo de ventana, paginas: lista de lineas) del texto n (1-159)."""
    d = puntero(rom, n)
    tipo = byte(rom, d)
    if tipo == 0xFF:
        return tipo, []
    d += 1
    paginas, linea, lineas = [], [], []
    while True:
        c = byte(rom, d)
        d += 1
        if c in (0xFF, 0xFD):
            lineas.append(letras(linea, version))
            paginas.append(lineas)
            linea, lineas = [], []
            if c == 0xFF:
                return tipo, paginas
        elif c == 0xFE:
            lineas.append(letras(linea, version))
            linea = []
        elif c >= 0xA1:
            linea.extend(trozo(rom, version, c - 0xA1))
        else:
            linea.append(c)


def plano(paginas):
    """Una sola linea: las lineas con un blanco, las paginas con ' / '."""
    return " / ".join(" ".join(" ".join(l.split()) for l in p if l.strip())
                      for p in paginas)


def nombres(rom, version):
    """(armas, objetos): los nombres del menu, por los indices de p00."""
    sal = []
    for lector, n in ((0x46F0, 8), (0x47EB, 25)):
        indice = palabra(rom, lector + 1, 0)        # ld de,INDICE
        sal.append([letras(hasta_ff(rom, 6, palabra(rom, indice + 2 * i, 6)),
                           version) for i in range(n)])
    return sal


def rotulo(rom, banco, dire):
    """Las palabras del rotulo, una por posicion."""
    o = sitio(banco, dire)
    trozos, cod = [], []
    o += 2
    while True:
        c = rom[o]
        if c in (0xFE, 0xFF):
            t = " ".join(letras(cod, "en").split())
            if t:
                trozos.append(t)
            if c == 0xFF:
                return trozos, sitio(banco, dire), o + 1
            cod = []
            o += 3
            continue
        if c in FUENTE["en"]:         # 0xA3-0xA9: los digitos grandes, sin letra
            cod.append(c)
        o += 1


def roms():
    sal = {}
    for v, ruta in ROMS.items():
        with open(ruta, "rb") as f:
            d = f.read()
        if hashlib.sha1(d).hexdigest() != SHA1[v]:
            raise SystemExit("%s no es la ROM esperada (sha1 %s)" % (ruta, SHA1[v]))
        sal[v] = d
    return sal


def tabla():
    r = roms()
    print("| n | tipo EN | inglesa | tipo JP | japonesa |")
    print("|---|---|---|---|---|")
    for n in range(1, N_TEXTOS + 1):
        te, pe = texto(r["en"], "en", n)
        tj, pj = texto(r["jp"], "jp", n)
        print("| 0x%02X | %02X | %s | %02X | %s |" % (n, te, plano(pe), tj, plano(pj)))


def _celda(t):
    return t.replace("|", "\\|")


def pagina(docs):
    r = roms()
    for idioma, ruta in (("es", os.path.join(docs, "es", "LOS-TEXTOS.md")),
                         ("en", os.path.join(docs, "THE-TEXTS.md"))):
        k = 0 if idioma == "es" else 1
        P = T.PAGINA[idioma]
        out = [P["intro"].format(
            crc_en="%08X" % zlib.crc32(r["en"]), crc_jp="%08X" % zlib.crc32(r["jp"]),
            sha_en=SHA1["en"], sha_jp=SHA1["jp"])]
        # Cada tabla, un solo bloque: una linea en blanco entre filas la parte.
        out.append(P["h_textos"])
        filas = ["| %s |\n|---|---|---|---|" % " | ".join(P["cols"])]
        for n in range(1, N_TEXTOS + 1):
            _, pe = texto(r["en"], "en", n)
            _, pj = texto(r["jp"], "jp", n)
            jp, en = plano(pj), plano(pe)
            if not jp and not en:
                filas.append("| 0x%02X | %s | %s | |" % (n, P["vacio_dos"], P["vacio_dos"]))
                continue
            filas.append("| 0x%02X | %s | %s | %s |" % (
                n, _celda(jp), _celda(en) if en else P["vacio"],
                _celda(T.TRAD[n][k])))
        out.append("\n".join(filas))
        out.append(P["h_nombres"])
        filas = ["| %s |\n|---|---|---|---|" % " | ".join(P["cols_nombres"])]
        (aj, oj), (ae, oe) = nombres(r["jp"], "jp"), nombres(r["en"], "en")
        for i, (j, e, t) in enumerate(zip(aj + oj, ae + oe, T.ARMAS + T.OBJETOS)):
            tipo = P["arma"] if i < 8 else P["objeto"]
            num = i + 1 if i < 8 else i - 7
            filas.append("| %s %d | %s | %s | %s |" % (tipo, num, j, e, t[k]))
        out.append("\n".join(filas))
        out.append(P["h_rotulos"])
        filas = ["| %s |\n|---|---|" % " | ".join(P["cols_rotulos"])]
        for banco, dire in ROTULOS:
            palabras, i, j = rotulo(r["en"], banco, dire)
            if r["jp"].find(r["en"][i:j]) < 0:
                raise SystemExit("rotulo p%02d:%04X distinto en la japonesa" % (banco, dire))
            filas.append("| `p%02d:%04X` | %s |" % (banco, dire, _celda(" · ".join(palabras))))
        out.append("\n".join(filas))
        out.append(P["fin"])
        with open(ruta, "w", encoding="utf-8", newline="\n") as f:
            f.write("\n\n".join(out) + "\n")
        print(ruta)


if __name__ == "__main__":
    orden = sys.argv[1] if len(sys.argv) > 1 else "tabla"
    if orden == "tabla":
        tabla()
    elif orden == "pagina":
        pagina(sys.argv[2] if len(sys.argv) > 2 else os.path.join(RAIZ, "docs"))
    else:
        raise SystemExit(__doc__)
