"""Los sprites leidos de la ROM (tools/sprites.py, cuadros.py).

Como en test_mapas: no se comprueba que se parezcan al juego (eso es el
cotejo contra la VRAM de openMSX), sino que las tablas se leen como las lee
el codigo y cuadran entre si.
"""
import os
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))

ROM = os.path.join(RAIZ, "metalgear.rom")


class Sprites(unittest.TestCase):
    def setUp(self):
        if not os.path.exists(ROM):
            raise unittest.SkipTest("hace falta metalgear.rom")

    def test_los_patrones_de_las_tablas_son_de_16_x_16(self):
        """Todos los patrones que nombran los cuadros, los atributos de
        Snake y las listas de los juegos van de 4 en 4 (sprites de 16 x 16,
        4 patrones de 8 bytes seguidos)."""
        import sprites as SP
        patrones = set()
        for c in range(SP.N_CUADROS):
            n = SP.largo_de_cuadro(c)
            self.assertGreaterEqual(n, 0, "cuadro %d: la lista no cuadra" % c)
            patrones |= {p for (_, _, p) in SP.cuadro(c, n)}
        for k in range(SP.N_JUEGOS_SNAKE):
            patrones |= {p for (_, _, p, _) in SP.cuadro_de_snake(k)}
        self.assertTrue(patrones)
        self.assertEqual({p & 3 for p in patrones}, {0})

    def test_cada_actor_tiene_sus_patrones_cargados(self):
        """Para cada sala con actores, los patrones del cuadro con el que
        se crea cada tipo (cuadros.py) estan en el juego de sprites de la
        sala (p10:6185): la unica forma de que casen las tres tablas."""
        import cuadros as C
        import sprites as SP
        codigo, tablas = C.lee_listado(), C.tablas_nocode()
        juegos = {}
        fallos = []
        comprobados = 0
        for r in range(0xDE):
            j = SP.juego_de_sala(r)
            if j not in juegos:
                juegos[j] = SP.patrones_del_juego(j)[1]
            for (t, _y, _x) in SP.actores_de_sala(r):
                if SP.sprites_por_tipo(t) == 0:
                    continue
                for c in C.cuadros_por_tipo(t, codigo, tablas)["crear"]:
                    comprobados += 1
                    faltan = {p for (_, _, p, _) in SP.sprites_de_actor(t, c) if (p & ~3) not in juegos[j]}
                    if faltan:
                        fallos.append((r, t, c, sorted(faltan)))
        self.assertGreater(comprobados, 60)
        self.assertEqual(fallos, [])

    def test_snake_no_pisa_los_patrones_de_la_sala(self):
        """Los 53 juegos de Snake van en los patrones 0x00-0x37 y los juegos
        de la sala empiezan en el 0x38 (los dos se cargan en 0xF800)."""
        import sprites as SP
        tope = 0
        for k in range(SP.N_JUEGOS_SNAKE):
            vram = SP.patrones_de_snake(k)
            self.assertTrue(any(vram), "juego %d de Snake vacio" % k)
            tope = max(tope, max(i for i, b in enumerate(vram) if b) // 8)
            for (_, _, p, _) in SP.cuadro_de_snake(k):
                self.assertLess(p, 0x38)
        self.assertLess(tope, 0x38)
        minimo = min(min(SP.patrones_del_juego(j)[1]) for j in range(SP.N_JUEGOS) if SP.patrones_del_juego(j)[1])
        self.assertGreaterEqual(minimo, 0x38)

    def test_los_actores_caben_en_la_pantalla(self):
        import sprites as SP
        n = 0
        for r in range(0xDE):
            for (t, y, x) in SP.actores_de_sala(r):
                n += 1
                self.assertTrue(1 <= t <= 64, "sala %d tipo %d" % (r, t))
                self.assertLess(y, 192, "sala %d: y %d" % (r, y))
        self.assertGreater(n, 200)

    def test_el_or_de_colores_de_dos_sprites_encadenados(self):
        """Modo 2 del V9938: un sprite con CC pintado sobre otro da el OR de
        los colores donde los dos tienen punto, y cada uno el suyo donde
        esta solo (p00:5394 copia el mismo color a las 16 lineas)."""
        import sprites as SP
        vram = bytearray(2048)
        vram[0:8] = [0xF0] * 8          # patron 0: 8 filas, los 4 puntos de la izquierda
        vram[32:40] = [0x3C] * 8        # patron 4: 8 filas, los 4 del medio
        px = SP.compone([(10, 10, 0, 0x02), (10, 10, 4, 0x4D)], vram)
        self.assertEqual(px[(10, 11)], 2)         # solo el primero
        self.assertEqual(px[(12, 11)], 2 | 13)    # los dos
        self.assertEqual(px[(15, 11)], 13)        # solo el segundo (CC)
        self.assertNotIn((16, 11), px)

    def test_las_explosiones_y_las_formulas(self):
        """Los cuadros de las formulas leidas existen y la cuenta de sprites
        de las explosiones cuadra con la longitud de sus listas."""
        import cuadros as C
        import sprites as SP
        for a, cs, _texto, _tipos in C.formulas_leidas():
            for c in cs:
                self.assertLess(c, SP.N_CUADROS)
        for c, n in C.EXPLOSIONES:
            self.assertEqual(SP.largo_de_cuadro(c), n, "cuadro %d" % c)
        # y los cuadros que el listado da a cada tipo son de su cuenta de sprites
        codigo, tablas = C.lee_listado(), C.tablas_nocode()
        for t in (4, 9, 13, 14, 18, 20, 25, 26, 28, 31, 32, 33, 34, 36, 38, 48, 53, 57):
            cu = C.cuadros_por_tipo(t, codigo, tablas)
            self.assertTrue(cu["todos"], "tipo %d sin cuadros" % t)
            for c in cu["todos"]:
                self.assertEqual(SP.largo_de_cuadro(c), SP.sprites_por_tipo(t))
        # las balas leen solo el principio de una lista mas larga, y el
        # letrero del 64 una mas corta con un segundo sprite de color 0
        for t in (23, 60, 62, 64):
            self.assertTrue(C.cuadros_por_tipo(t, codigo, tablas)["todos"], "tipo %d" % t)

    def test_los_proyectiles_de_las_armas(self):
        """p02:8140 da 1, 1, 2, 4, 4, 2, 4 sprites a las armas 1-7; la bala
        (cuadro 0), la granada (1), la bomba (6) y la mina (10) salen de los
        patrones que carga su arma (p10:6392)."""
        import sprites as SP
        self.assertEqual([SP.sprites_del_arma(w) for w in range(1, 8)], [1, 1, 2, 4, 4, 2, 4])
        for w, k in ((1, 0), (2, 0), (3, 1), (5, 6), (6, 10)):
            sp = SP.cuadro_de_arma(k, SP.sprites_del_arma(w))
            self.assertTrue(SP.compone(sp, SP.patrones_del_arma(w)), "arma %d cuadro %d" % (w, k))

    def test_las_explosiones_y_el_cohete_tienen_patrones(self):
        """Cada sprite de cada cuadro de las armas 1-7 pide un patron que
        se carga: el proyectil (0x10-0x17), la explosion de p00:4C0B (0x18
        o 0x20 hasta 0x37) y, en ROCKET y MISSILE, el de su direccion
        (L_4C2E, p10:63A0 y p10:63A8)."""
        import sprites as SP
        for w, (_, cuadros) in SP.CUADROS_DE_ARMA.items():
            for d in ((1, 2, 3, 4) if w in (4, 7) else (1,)):
                vram = SP.patrones_del_arma(w, d)
                for k in cuadros:
                    for _, _, p, _ in SP.cuadro_de_arma(k, SP.sprites_del_arma(w)):
                        self.assertTrue(any(vram[8 * p:8 * p + 32]),
                                        "arma %d dir %d cuadro %d patron 0x%02X" % (w, d, k, p))


if __name__ == "__main__":
    unittest.main()
