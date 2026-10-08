#!/usr/bin/env python3
"""Lo que se ha MEDIDO del cartucho, clavado para que no se deshaga solo.

Estas comprobaciones necesitan la ROM, y si no esta **fallan**: no se saltan.
Un test que se salta no comprueba nada y en verde daria la impresion
contraria. Quien clone esto sin poner su copia del cartucho vera fallar este
fichero con un mensaje que dice exactamente que falta; los tests que solo
miran el listado publicado siguen pasando.

Cada una corresponde a una afirmacion de la web o de las notas, y todas leen
el binario: ninguna compara una constante contra si misma.
"""
import hashlib
import os
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)

from paginas import ORG, TAM_PAGINA, N_PAGINAS   # noqa: E402

ROM = os.path.join(RAIZ, "metalgear.rom")
SHA = "d16fff4a59ce26b570851c7200f67e05f385978598dcad91c83bf9c671a295ae"

FALTA = ("falta metalgear.rom en la raiz del repo. Son los 131.072 bytes de "
         "Metal Gear (Konami, RC-750, 1987, MSX2), la version europea, y no se "
         "distribuyen aqui: pon tu copia. El sha256 tiene que ser %s" % SHA)


class Cartucho(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        if not os.path.exists(ROM):
            raise AssertionError(FALTA)
        with open(ROM, "rb") as f:
            cls.rom = f.read()

    def test_es_la_misma_rom(self):
        self.assertEqual(len(self.rom), 131072)
        self.assertEqual(hashlib.sha256(self.rom).hexdigest(), SHA)

    def test_cabecera_ab(self):
        """0x4000 'AB', INIT 0x41F3 y los otros tres vectores a cero."""
        self.assertEqual(self.rom[0:2], b"AB")
        self.assertEqual(self.rom[2] | (self.rom[3] << 8), 0x41F3)
        self.assertEqual(self.rom[4:10], b"\x00" * 6)

    def test_segunda_cabecera_del_game_master(self):
        """0x4010: 'CD', 0x07 y 0x50, o sea RC-750."""
        self.assertEqual(self.rom[0x10:0x14], bytes([0x43, 0x44, 0x07, 0x50]))

    def test_es_msx2_cambia_de_modo_por_la_bios(self):
        """Hay `call 0x005F` (CHGMOD) en el cartucho: el modo de pantalla lo
        pone la BIOS del MSX2, no el juego a pelo contra el VDP."""
        self.assertIn(bytes([0xCD, 0x5F, 0x00]), self.rom)

    def test_mapper_es_konami4(self):
        """Ni una escritura a los registros del mapper CON SCC."""
        for reg in (0x5000, 0x7000, 0x9000, 0xB000):
            pat = bytes([0x32, reg & 0xFF, reg >> 8])
            self.assertNotIn(pat, self.rom,
                             "aparece un ld (%#06x),a: seria Konami5" % reg)
        for reg in (0x6000, 0x8000, 0xA000):
            self.assertIn(bytes([0x32, reg & 0xFF, reg >> 8]), self.rom)

    def test_los_cinco_cambiadores_de_banco(self):
        """p00:4248, 424E, 426A, 4270 y 4276 cargan 1, 4, 7, 10 y 13 y caen en
        p00:4252, que reparte el trio: 0x6000 / inc a / 0x8000 / inc a /
        0xA000, apuntando cada banco en 0xF0F1-3 con `ld (hl),a`."""
        self.assertEqual(self.rom[0x0252:0x026A], bytes([
            0xE5, 0x21, 0xF1, 0xF0,              # push hl / ld hl,0xF0F1
            0x32, 0x00, 0x60, 0x77, 0x3C, 0x23,  # ld (0x6000),a / ld (hl),a / inc a / inc hl
            0x32, 0x00, 0x80, 0x77, 0x3C, 0x23,  # ld (0x8000),a / ld (hl),a / inc a / inc hl
            0x32, 0x00, 0xA0, 0x77,              # ld (0xA000),a / ld (hl),a
            0xE1, 0xF1, 0xFB, 0xC9]))            # pop hl / pop af / ei / ret
        for off, banco, salto in ((0x0248, 1, 0x04), (0x024E, 4, None),
                                  (0x026A, 7, 0xE2), (0x0270, 10, 0xDC),
                                  (0x0276, 13, 0xD6)):
            self.assertEqual(self.rom[off:off + 4],
                             bytes([0xF3, 0xF5, 0x3E, banco]))    # di / push af / ld a,N
            if salto is not None:
                self.assertEqual(self.rom[off + 4:off + 6], bytes([0x18, salto]))

    def test_regla_banco_org(self):
        """tools/reconocimiento.py: toda escritura con banco conocido lo pone en
        la ranura que dice tools/paginas.py (exit 0)."""
        r = subprocess.run([sys.executable, os.path.join(TOOLS, "reconocimiento.py"), ROM],
                           capture_output=True, text=True, cwd=TOOLS)
        self.assertEqual(r.returncode, 0, r.stdout)
        self.assertIn("OK: la regla banco -> org", r.stdout)

    def test_el_banco_15_en_0xa000(self):
        """p00:4925 pone el 15 en 0xA000 y lo apunta en 0xF0F3 y 0xF0F6, y
        p00:419C devuelve a 0xA000 lo que haya en 0xF0F6 si no es cero."""
        self.assertEqual(self.rom[0x0925:0x0935], bytes([
            0xF3, 0xF5, 0x3E, 0x0F, 0x32, 0xF3, 0xF0, 0x32, 0x00, 0xA0,
            0x32, 0xF6, 0xF0, 0xF1, 0xFB, 0xC9]))
        self.assertEqual(self.rom[0x019C:0x01AC], bytes([
            0x3A, 0xF6, 0xF0, 0xA7, 0x28, 0x08,          # ld a,(0xF0F6) / and a / jr z
            0xF3, 0x32, 0x00, 0xA0, 0x32, 0xF3, 0xF0, 0xFB,
            0xF1, 0xC9]))

    def test_gancho_de_interrupcion(self):
        """INIT engancha 0x41AC en H.TIMI (0xFD9F/0xFDA0) y se queda en `jr $`."""
        pat = bytes([0x3E, 0xC3,                     # ld a,0xC3
                     0x32, 0x9F, 0xFD,               # ld (0xFD9F),a
                     0x21, 0xAC, 0x41,               # ld hl,0x41AC
                     0x22, 0xA0, 0xFD])              # ld (0xFDA0),hl
        self.assertEqual(self.rom[0x0236:0x0236 + len(pat)], pat)
        self.assertEqual(self.rom[0x0246:0x0248], bytes([0x18, 0xFE]))   # jr $

    def test_la_interrupcion_llama_al_sonido_en_el_banco_4(self):
        """p00:41B0 pone los bancos 4 y 5, llama a 0x6000 y devuelve las dos
        ranuras leyendo las copias 0xF0F1 y 0xF0F2."""
        esperado = bytes([0x3E, 0x04, 0x32, 0x00, 0x60,  # ld a,4 / ld (0x6000),a
                          0x3C, 0x32, 0x00, 0x80,        # inc a / ld (0x8000),a
                          0xCD, 0x00, 0x60,              # call 0x6000
                          0x3A, 0xF1, 0xF0, 0x32, 0x00, 0x60,
                          0x3A, 0xF2, 0xF0, 0x32, 0x00, 0x80])
        self.assertEqual(self.rom[0x01B0:0x01B0 + len(esperado)], esperado)

    def test_no_hay_bancos_de_relleno(self):
        """Ningun banco es 0xFF de punta a punta."""
        for b in range(N_PAGINAS):
            blq = self.rom[b * TAM_PAGINA:(b + 1) * TAM_PAGINA]
            self.assertNotEqual(blq, b"\xff" * TAM_PAGINA)

    def test_despachador_de_konami(self):
        """El despachador esta en 0x41EA: la tabla va detras del `call`.

        `pop hl / call 0x41DF (add a,a / add a,l / ld l,a / ret nc / inc h /
        ret) / ld e,(hl) / inc hl / ld d,(hl) / ex de,hl / jp (hl)`.
        """
        self.assertEqual(self.rom[0x01DF:0x01E5],
                         bytes([0x87, 0x85, 0x6F, 0xD0, 0x24, 0xC9]))
        self.assertEqual(self.rom[0x01EA:0x01F3],
                         bytes([0xE1, 0xCD, 0xDF, 0x41, 0x5E, 0x23, 0x56,
                                0xEB, 0xE9]))


if __name__ == "__main__":
    unittest.main()
