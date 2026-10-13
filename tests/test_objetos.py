"""Los dibujos de armas y objetos, los avisos y la boca del retrato
(tools/objetos.py), leidos en el listado."""
import os
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))

import objetos as O   # noqa: E402
import pagina1 as P1  # noqa: E402


class Objetos(unittest.TestCase):
    def test_las_ocho_tarjetas_comparten_dibujo(self):
        self.assertEqual({P1.dibujo_de_objeto(o) for o in range(22, 30)},
                         {(144, 112, 16, 16)})

    def test_la_rom_escribe_l_main(self):
        # p06:B89E: 'L', el punto de la fuente (0x40) y MAIN
        self.assertEqual(bytes(O.nombre(6)), b"L@MAIN")

    def test_los_avisos_estan_enteros(self):
        """Las dos mitades: las fichas de objetos 128-131 (y 128) y las de
        p06:B3BD (y 136, p00:4B4A)."""
        p1 = P1.pagina1()
        for sx, sy in O.AVISOS:
            for mitad in (sy, sy + 8):
                self.assertTrue(any(p1.get((sx + i, mitad + j), 0)
                                    for i in range(16) for j in range(8)))

    def test_la_boca_en_una_vuelta_de_32_cuadros(self):
        self.assertEqual([O.boca_del_cuadro(c) for c in range(0, 32, 4)],
                         [0xB425, 0xB42B, 0xB41F, 0xB42B,
                          0xB41F, 0xB42B, 0xB41F, 0xB42B])

    def test_las_imagenes_estan_publicadas(self):
        for fn in ("objetos.png", "pagina1.png", "transceptor_habla.gif"):
            self.assertTrue(os.path.exists(
                os.path.join(RAIZ, "docs", "imagenes", fn)), fn)


if __name__ == "__main__":
    unittest.main()
