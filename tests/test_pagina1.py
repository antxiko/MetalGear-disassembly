"""Las puertas y los objetos copiados de la pagina 1 (tools/pagina1.py).

Como en test_mapas: se comprueba que las tablas se leen como las lee el
codigo y cuadran entre si, no que se parezcan al juego (eso es el cotejo
contra la VRAM de openMSX).
"""
import os
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))

ROM = os.path.join(RAIZ, "metalgear.rom")


class Pagina1(unittest.TestCase):
    def setUp(self):
        if not os.path.exists(ROM):
            raise unittest.SkipTest("hace falta metalgear.rom")

    def test_las_puertas_caen_dentro_de_la_pantalla(self):
        """Toda puerta de los tipos 1-5 se copia entera dentro de los 256 x
        192 de la sala, y su origen esta dentro de los bloques de la pagina 1."""
        import pagina1 as P1
        import salas as S
        p1 = P1.pagina1()
        n = 0
        for r in range(0xE1):
            for (_p, t, y, x, _e) in S.puertas(r):
                for (sx, sy, w, h, dx, dy) in P1.copias_de_puerta(t, y, x):
                    n += 1
                    self.assertTrue(0 <= dx and dx + w <= 256 and 0 <= dy and dy + h <= 192, "sala %d puerta tipo %d en %d,%d" % (r, t, y, x))
                    for j in range(h):
                        for i in range(w):
                            self.assertIn((sx + i, sy + j), p1)
        self.assertGreater(n, 250)

    def test_los_objetos_tienen_dibujo_y_sitio(self):
        """Cada objeto de cada sala tiene su dibujo en la tira de la pagina
        1 (y 96-135) y cabe en la sala; los objetos 9-33 tienen nombre."""
        import pagina1 as P1
        n = 0
        for r in range(0x7A, 0xDA):
            for (o, y, x) in P1.objetos_de_sala(r):
                n += 1
                self.assertTrue(1 <= o <= 35, "sala %d objeto %d" % (r, o))
                sx, sy, w, h = P1.dibujo_de_objeto(o)
                self.assertTrue(96 <= sy and sy + h <= 136 and sx + w <= 256, "objeto %d: origen %d,%d" % (o, sx, sy))
                self.assertTrue(x + w <= 256 and y + h <= 192, "sala %d objeto %d en %d,%d" % (r, o, y, x))
                if 9 <= o <= 33:
                    self.assertTrue(P1.nombre_de_objeto(o))
        self.assertEqual(n, 60)        # 59 ternas en 47 listas; una lista sirve a dos salas

    def test_la_pagina_1_tiene_las_fichas_de_puerta(self):
        """Los cinco bloques de puertas (44 fichas) y las 132 de objetos."""
        import pagina1 as P1
        p1 = P1.pagina1()
        self.assertEqual(len(p1), 64 * (16 + 16 + 4 + 4 + 4) + 64 * 132)
        self.assertTrue(any(p1[(192 + i, 160 + j)] for i in range(32) for j in range(32)))


    def test_la_copia_es_transparente(self):
        """L_5011 con A = 0x48 es LMMM con TIMP: el color 0 de la pagina 1
        no se copia. Un objeto no tapa el fondo con negro."""
        import pagina1 as P1
        p1 = P1.pagina1()
        sx, sy = 0, 96
        ceros = sum(1 for j in range(16) for i in range(32) if p1.get((sx + i, sy + j), 0) == 0)
        hecho = P1.copia(sx, sy, 32, 16, 0, 0)
        self.assertGreater(ceros, 0)
        self.assertEqual(len(hecho), 32 * 16 - ceros)
        self.assertNotIn(0, hecho.values())


if __name__ == "__main__":
    unittest.main()
