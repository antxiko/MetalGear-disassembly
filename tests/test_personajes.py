import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))


class TestPersonajes(unittest.TestCase):
    def test_las_armas_1_y_2_comparten_tabla(self):
        """p05:87B7: siete punteros; la pistola y el subfusil apuntan a la
        misma tabla (0x87C6) y las otras cinco van seguidas de 0x42 en 0x42."""
        import personajes as P
        t = [P.tabla_de_dano(w) for w in P.ARMAS]
        self.assertEqual(t, [0x87C6, 0x87C6, 0x8808, 0x884A, 0x888C, 0x88CE, 0x8910])

    def test_los_jefes_solo_caen_con_su_arma(self):
        """Los bytes de dano distintos de 0 en las tablas de p05 para los
        jefes: Big Boss (32) y Arnold (26) solo con el arma 4, el tanque (9)
        solo con la 6, el bulldozer (18) y el Hind D (38) solo con la 3, y
        Metal Gear (17) solo con la 5."""
        import personajes as P
        solo = {32: 4, 26: 4, 9: 6, 18: 3, 38: 3, 17: 5}
        for tipo, arma in solo.items():
            con_dano = [w for w in P.ARMAS if P.dano(w, tipo)]
            self.assertEqual(con_dano, [arma], tipo)
        self.assertEqual([P.aguante(t) for t in (9, 17, 18, 26, 32, 38)], [55, 2, 40, 40, 40, 100])

    def test_el_orden_de_metal_gear_son_16_lados(self):
        """p02:8D3B: 16 bytes, todos 1 o 2 (los dos valores que p02:8D01-8D05
        pueden meter)."""
        import personajes as P
        o = P.orden_de_metal_gear()
        self.assertEqual(len(o), 16)
        self.assertEqual(set(o), {1, 2})


if __name__ == "__main__":
    unittest.main()
