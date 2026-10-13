#!/usr/bin/env python3
"""Los textos de las dos versiones (tools/textos.py): lo que la pagina
LOS-TEXTOS / THE-TEXTS afirma, medido otra vez sobre las ROMs.

Necesita metalgear.rom y metalgear-jp.rom en la raiz (ver la pagina).
"""
import os
import sys
import tempfile
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))

import textos as X                # noqa: E402
import textos_traduccion as T     # noqa: E402

R = X.roms()


class Textos(unittest.TestCase):

    def test_todas_las_letras_se_leen(self):
        for v in ("en", "jp"):
            for n in range(1, X.N_TEXTOS + 1):
                self.assertNotIn("[", X.plano(X.texto(R[v], v, n)[1]), (v, n))

    def test_la_inglesa_vacia_69(self):
        vacios = [n for n in range(1, X.N_TEXTOS + 1)
                  if X.puntero(R["en"], n) == X.VACIO_EN]
        self.assertEqual(len(vacios), 69)
        self.assertEqual(X.byte(R["en"], X.VACIO_EN), 0xFF)
        dos = [n for n in range(1, X.N_TEXTOS + 1)
               if not X.plano(X.texto(R["jp"], "jp", n)[1])]
        self.assertEqual(dos, [0x49, 0x4A, 0x66, 0x68])
        self.assertTrue(set(dos) <= set(vacios))

    def test_una_traduccion_por_texto_japones(self):
        con_texto = {n for n in range(1, X.N_TEXTOS + 1)
                     if X.plano(X.texto(R["jp"], "jp", n)[1])}
        self.assertEqual(set(T.TRAD), con_texto)
        for n, (es, en) in T.TRAD.items():
            self.assertTrue(es and en, n)
        self.assertEqual(len(T.ARMAS) + len(T.OBJETOS), 33)

    def test_la_recogida_y_el_bloqueo(self):
        en, jp = R["en"], R["jp"]
        # p02:8F17 en la inglesa: and a / ret z / cp 03eh / ret nz / jp 5CE1
        o = X.sitio(2, 0x8F17)
        self.assertEqual(en[o:o + 8], bytes.fromhex("a7 c8 fe 3e c0 c3 e1 5c"))
        # p00:4226: la japonesa llama al bloqueo 5322, la inglesa a un ret
        self.assertEqual(jp[0x226:0x229], bytes.fromhex("cd 22 53"))
        self.assertEqual(en[0x226:0x229], bytes.fromhex("cd 17 53"))
        self.assertEqual(en[0x1317], 0xC9)
        self.assertEqual(jp[0x1322:0x1331],
                         bytes.fromhex("2a 2b 00 7d e6 f7 c2 00 00 7c e6 cf c2 00 00"))

    def test_la_fuente_cambia_en_dos_letras(self):
        f = X.sitio(9, 0xB0B2)
        distintas = {0x30 + (i - f) // 8 for i in range(f, f + 0x6C * 8)
                     if R["en"][i] != R["jp"][i]}
        self.assertEqual(distintas, {0x5C, 0x97})

    def test_la_web_es_la_que_sale_de_las_roms(self):
        with tempfile.TemporaryDirectory() as d:
            os.makedirs(os.path.join(d, "es"))
            X.pagina(d)
            for rel in (os.path.join("es", "LOS-TEXTOS.md"), "THE-TEXTS.md"):
                with open(os.path.join(d, rel), encoding="utf-8") as a, \
                        open(os.path.join(RAIZ, "docs", rel), encoding="utf-8") as b:
                    self.assertEqual(a.read(), b.read(), rel)


if __name__ == "__main__":
    unittest.main()
