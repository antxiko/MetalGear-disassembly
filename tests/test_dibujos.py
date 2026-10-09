"""Los dibujos de fichas que se ponen encima de una sala (tools/dibujos.py):
los dos jefes y las puertas de los tipos 7-19.

Como en test_mapas: se comprueba que las tablas se leen como las lee el
codigo y cuadran entre si, no que se parezcan al juego.
"""
import os
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))

ROM = os.path.join(RAIZ, "metalgear.rom")


class Dibujos(unittest.TestCase):
    def setUp(self):
        if not os.path.exists(ROM):
            raise unittest.SkipTest("hace falta metalgear.rom")

    def test_los_dibujos_acaban_donde_empieza_el_siguiente(self):
        """[filas][columnas] y filas x columnas fichas: cada dibujo de puerta
        acaba donde empieza el siguiente (el 12 y el 13 comparten), y los
        cuatro de los jefes miden lo mismo dos a dos."""
        import dibujos as D
        orden = sorted(set(D.DIBUJO_DE_PUERTA.values()))
        for a, b in zip(orden, orden[1:]):
            f, c, _ = D.dibujo(a)
            self.assertEqual(a + 2 + f * c, b, "p15:%04X" % a)
        f, c, _ = D.dibujo(orden[-1])
        self.assertEqual(orden[-1] + 2 + f * c, 0xB2BF)   # las fichas del interruptor
        self.assertEqual(D.dibujo(0xB431)[:2], (11, 16))
        self.assertEqual(D.dibujo(0xB4E3)[:2], (11, 16))
        self.assertEqual(D.dibujo(0xB595)[:2], (12, 8))
        self.assertEqual(D.dibujo(0xB5F7)[:2], (12, 8))

    def test_los_jefes_estan_en_su_sala_y_sus_fichas_cargadas(self):
        """El Hind D es el primer actor de la sala 50 y Metal Gear el de la
        118; todas las fichas de sus dibujos estan en el juego de la sala y
        el dibujo cabe en la pantalla."""
        import dibujos as D
        import salas as S
        vistos = {}
        for r in range(S.N_SALAS):
            if S.es_sala(r):
                j = D.jefe_de_sala(r)
                if j:
                    vistos[r] = j[0]
        self.assertEqual(vistos, {50: 0x26, 118: 0x11})
        for r in vistos:
            for otro in (False, True):
                px, faltan = D.pixeles_de_jefe(r, otro)
                self.assertEqual(faltan, set())
                self.assertTrue(px)
                self.assertTrue(all(0 <= x < 256 and 0 <= y < 192 for (x, y) in px))

    def test_las_puertas_dibujadas_tienen_sus_fichas(self):
        """Toda puerta de los tipos 7-19 tiene sus fichas en el juego de la
        sala: no falta ninguna."""
        import dibujos as D
        import salas as S
        n = 0
        for r in range(S.N_SALAS):
            if not S.es_sala(r):
                continue
            px, faltan = D.pixeles_de_puertas_dibujadas(r)
            self.assertEqual(faltan, set(), "sala %d" % r)
            n += bool(px)
        self.assertEqual(n, 19)        # las 19 salas de `dibujos.py lista`


if __name__ == "__main__":
    unittest.main()
