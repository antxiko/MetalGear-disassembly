"""Las salas y los mapas montados desde la ROM (tools/salas.py, dibuja.py).

Lo que se comprueba aqui NO es que se parezcan al juego (eso es el cotejo
contra la VRAM de openMSX, que necesita el emulador): es que las tablas se
leen como las lee el codigo y cuadran entre si.
"""
import os
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))

ROM = os.path.join(RAIZ, "metalgear.rom")


class Salas(unittest.TestCase):
    def setUp(self):
        # sin la ROM no hay nada que leer (los demas tests hacen lo mismo)
        if not os.path.exists(ROM):
            raise unittest.SkipTest("hace falta metalgear.rom")

    def test_las_vecinas_son_simetricas(self):
        """Si A sale por la derecha a B, B sale por la izquierda a A: con el
        orden izquierda-derecha-arriba-abajo cuadran 332 de 335 sin contar
        las salas que se apuntan a si mismas (las tres que no, 222 y 227,
        son de un solo sentido en la ROM)."""
        import salas as S
        bien = mal = 0
        for r in range(S.N_SALAS):
            for k, v in enumerate(S.vecinas(r)):
                if v is None or v >= S.N_SALAS or v == r:
                    continue
                if S.vecinas(v)[k ^ 1] == r:
                    bien += 1
                else:
                    mal += 1
        self.assertGreaterEqual(bien, 330)
        self.assertLessEqual(mal, 3)

    def test_las_puertas_llevan_a_salas_que_existen(self):
        import salas as S
        for r in range(0xE1):
            for (_p, _t, _x, _y, e) in S.puertas(r):
                self.assertTrue(S.es_sala(e) or 0xF0 <= e <= 0xFA, "sala %d, destino %d" % (r, e))

    def test_una_sala_se_monta_con_sus_fichas(self):
        """La sala 1 (la primera del juego) usa solo fichas de su juego, y
        ninguna sala usa fichas que no esten cargadas, salvo la 1 (hueco de
        puerta) y la 2 (negro)."""
        import salas as S
        px, faltan = S.pixeles_de_sala(1)
        self.assertEqual((len(px), len(px[0])), (192, 256))
        self.assertEqual(faltan, set())
        self.assertTrue(any(v for fila in px for v in fila))
        raras = {}
        for r in range(S.N_SALAS):
            if S.es_sala(r):
                _, f = S.pixeles_de_sala(r)
                if f - {1, 2}:
                    raras[r] = sorted(f - {1, 2})
        self.assertEqual(raras, {})

    def test_las_zonas_y_los_ascensores(self):
        """9 zonas por las salidas; cada parada de ascensor cae en una zona."""
        import dibuja
        import salas as S
        zs = dibuja.zonas()
        self.assertEqual(len(zs), 9)
        en_zona = set()
        for pos, _, tras in zs:
            en_zona |= set(pos) | {r for r, _, _ in tras}
        for r in range(0xF0, 0xFB):
            for (sala, _b, _c) in S.ascensor(r)[1]:
                if sala:
                    self.assertIn(sala, en_zona, "ascensor %02X, parada %d" % (r, sala))


    def test_la_paleta_de_la_sala_pasa_por_8B0B_y_la_de_snake(self):
        """p01:6E82 aplica p05:8B0B (L_4A92) antes de la paleta de la sala:
        el 15 queda NEGRO (los bordes de las fichas), el 14 blanco, el 12
        gris y el 8 rojo puro; y siguen el 7 y el 10 de Snake (p00:4AA3),
        que ninguna paleta de sala ni de sprites toca."""
        import salas as S
        for r in (1, 5, 50, 181):
            pal = S.paleta_de_sala(r)
            self.assertEqual(pal[15], (0, 0, 0))
            self.assertEqual(pal[14], (7, 7, 7))
            self.assertEqual(pal[8], (7, 0, 0))
            self.assertEqual(pal[7], (1, 2, 2))
            self.assertEqual(pal[10], (6, 4, 3))
        # la sala 5 por encima: 5 = tierra (3,2,1), 9 = hierba (0,2,0)
        pal = S.paleta_de_sala(5)
        self.assertEqual((pal[5], pal[9]), ((3, 2, 1), (0, 2, 0)))


if __name__ == "__main__":
    unittest.main()
