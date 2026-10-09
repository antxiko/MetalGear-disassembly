#!/usr/bin/env python3
"""EL CONTENIDO de la web de este cartucho: lo unico que es de este juego.

md2html.py y make_web.py son la maquinaria y no llevan dentro el nombre de
ningun juego: lo leen de aqui. Asi no se puede colar el texto de otro
cartucho al copiar la maquinaria.

Todas las cifras de aqui estan medidas sobre este cartucho, con las
herramientas de tools/: CODIGO y DATOS los imprime tools/presupuesto.py
(make sanity) y RUTINAS, INSTRUCCIONES y COMENTARIOS son la suma de los
bancos con codigo en tools/densidad.py (make densidad). tests/test_web.py
las vuelve a medir.
"""

NOMBRE = "Metal Gear"
CATALOGO = "RC-750"
ANIO = 1987
REPOSITORIO = "https://github.com/antxiko/MetalGear-disassembly"

CODIGO = 35620
DATOS = 95452
RUTINAS = 2190
INSTRUCCIONES = 17071
COMENTARIOS = 7985

# Los bancos con codigo, para volver a medir la densidad (tests/test_web.py)
BANCOS_CON_CODIGO = ("00", "01", "02", "03", "04", "06", "09", "12", "15")


def densidad(idioma):
    """El porcentaje comentado, con la coma o el punto de cada idioma."""
    d = "%.1f" % (100.0 * COMENTARIOS / INSTRUCCIONES)
    return d.replace(".", ",") if idioma == "es" else d


# El pie legal de cada pagina. Este cartucho no lleva la marca oculta de la
# casa (tools/marca_konami.py: "sin marca").
PIE_LEGAL = {
    "es": "<em>Metal Gear</em> lo public&oacute; Konami para MSX2 en 1987; su "
          "n&uacute;mero de cat&aacute;logo es RC-750 y son 128 KB. Todos los "
          "derechos sobre el juego siguen siendo de sus titulares. Este trabajo "
          "es de preservaci&oacute;n, estudio y documentaci&oacute;n, y la "
          "imagen del cartucho no se distribuye.",
    "en": "<em>Metal Gear</em> was published by Konami for the MSX2 in 1987; "
          "its catalogue number is RC-750 and it is 128 KB. All rights in the "
          "game remain with their holders. This is preservation, study and "
          "documentation work, and the cartridge image is not distributed.",
}

# La cabecera de la portada
PORTADA = {
    "es": dict(
        titulo="Metal Gear - desensamblado comentado",
        claim="Outer Heaven entero desde sus tablas: 235 salas en 9 zonas, "
              "unidas por sus ascensores, 154 puertas, 64 tipos de actor con "
              "sus cuadros, Metal Gear, el Hind D y el equipo. Todo dibujado "
              "desde la ROM.",
        ficha=["Konami - <b>(c) Konami 1987</b>",
               "Cartucho <b>RC-750</b>, MegaROM de 128 KB (Konami4)",
               "<b>MSX2</b>", "Volcado europeo <b>d16fff4a...</b>"],
        aviso="<b>Aqu&iacute; no hay ninguna captura.</b> Todas las "
              "im&aacute;genes est&aacute;n <b>dibujadas desde los bytes de la "
              "ROM</b> con las tablas del cartucho: las salas con sus puertas y "
              "objetos, Snake y los actores, Metal Gear y el Hind D, el logotipo "
              "y el transceptor. Las 235 salas <b>casan punto por punto con las "
              "im&aacute;genes de referencia de Manuel Pazos</b>, a quien damos "
              "las gracias por su estupendo trabajo. <b>El cotejo contra la "
              "VRAM de openMSX est&aacute; pendiente.</b> El listado se "
              "reensambla <b>byte a byte</b> con <code>make</code>.",
    ),
    "en": dict(
        titulo="Metal Gear - a commented disassembly",
        claim="All of Outer Heaven from its tables: 235 rooms in 9 zones, "
              "joined by their lifts, 154 doors, 64 actor types with their "
              "frames, Metal Gear, the Hind D and the equipment. All drawn from "
              "the ROM.",
        ficha=["Konami - <b>(c) Konami 1987</b>",
               "An <b>RC-750</b> cartridge, a 128 KB MegaROM (Konami4)",
               "<b>MSX2</b>", "European dump <b>d16fff4a...</b>"],
        aviso="<b>Not one capture here.</b> Every picture is <b>drawn from the "
              "bytes of the ROM</b> with the cartridge's own tables: the rooms "
              "with their doors and items, Snake and the actors, Metal Gear and "
              "the Hind D, the logo and the transceiver. All 235 rooms <b>match "
              "point for point the reference images by Manuel Pazos</b>, whom we "
              "thank for his superb work. <b>The check against the openMSX VRAM "
              "is still to be done.</b> The listing reassembles <b>byte for "
              "byte</b> with <code>make</code>.",
    ),
}

HALLAZGOS = {
    "es": [
        ("Cinco claves en la pausa",
         "<p>Con F1 se para el juego y se puede teclear (tabla en "
         "<code>p06:BEF1</code>, se comprueban al seguir, <code>p06:BF2F</code>): "
         "<b>DS 4</b> da una estrella m&aacute;s de CLASS, <b>ANTA WA ERAI</b> "
         "tres, <b>INTRUDER</b> pone la munici&oacute;n a 999, <b>ISOLATION</b> "
         "las raciones a 999 y <b>HIRAKE GOMA</b> da las ocho tarjetas.</p>"
         "<p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Las teclas de funci&oacute;n",
         "<p>F1 pausa, F2 armas, F3 equipo y F4 transceptor "
         "(<code>p01:6F94</code>). En la pausa, F4 carga y F5 graba la partida "
         "en cinta, con un nombre de 6 letras y una suma de control "
         "(<code>p15:B948</code>). Tras GAME OVER, F5 sigue desde el "
         "&uacute;ltimo de 31 puntos de control (<code>p06:BE64</code>).</p>"
         "<p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Metal Gear solo cae en orden",
         "<p>Las 16 P.BOMB tienen que darle en el orden de "
         "<code>p02:8D3B</code>, a un lado o al otro de su X. Entonces empieza "
         "una cuenta atr&aacute;s desde 3000 (<code>p01:757B</code>), y salir "
         "por arriba de la sala 0xE2 lleva al final "
         "(<code>p01:643A</code>).</p><p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Lo que hace cada objeto",
         "<p>GOGGL deja ver los rayos (<code>p15:BF22</code>) y LIGHT quita la "
         "oscuridad (<code>p00:4ACB</code>); DETEC marca las minas "
         "(<code>p03:AF9C</code>); MASK protege del gas en 9 salas "
         "(<code>p02:8C05</code>); ARMOR reduce a la mitad el da&ntilde;o de "
         "algunos tipos (<code>p02:8A05</code>); ANTID quita el veneno del "
         "escorpi&oacute;n (<code>p01:7FAB</code>); PARAC salva en las "
         "trampillas (<code>p02:93BF</code>); dentro de la BOX y quieto, los "
         "guardias no ven a Snake (<code>p02:974F</code>); SCOPE pone el "
         "TELESCOPE MODE (<code>p01:7FDD</code>).</p><p>Le&iacute;do en el "
         "c&oacute;digo.</p>"),
        ("El disparo se oye",
         "<p>Sin SILENCER, disparar da la alarma y trae refuerzos "
         "(<code>p02:804F</code>), salvo en 55 salas (<code>p02:806C</code>).</p>"
         "<p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Puertas",
         "<p>Las de las clases 2 a 9 piden su tarjeta, de CARD1 a CARD8, "
         "elegida (<code>p01:794D</code>). Otras se abren a pu&ntilde;etazos "
         "(40 golpes, <code>p01:79E9</code>) o con la P.BOMB "
         "(<code>p01:7973</code>).</p><p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("El transceptor",
         "<p>Siete frecuencias, de 120.13 a 120.91 (<code>p00:490C</code>). "
         "Algunas llamadas solo se oyen enviando (SEND) o con ciertas "
         "condiciones (<code>p01:6A88</code>).</p><p>Le&iacute;do en el "
         "c&oacute;digo.</p>"),
    ],
    "en": [
        ("Five passwords in the pause",
         "<p>F1 stops the game and you can type (table at "
         "<code>p06:BEF1</code>, checked on resuming, <code>p06:BF2F</code>): "
         "<b>DS 4</b> gives one more CLASS star, <b>ANTA WA ERAI</b> three, "
         "<b>INTRUDER</b> sets the ammunition to 999, <b>ISOLATION</b> the "
         "rations to 999 and <b>HIRAKE GOMA</b> gives all eight cards.</p>"
         "<p>Read in the code.</p>"),
        ("The function keys",
         "<p>F1 pause, F2 weapons, F3 equipment and F4 transceiver "
         "(<code>p01:6F94</code>). In the pause, F4 loads and F5 saves the game "
         "on tape, with a 6-letter name and a checksum "
         "(<code>p15:B948</code>). After GAME OVER, F5 goes on from the last "
         "of 31 checkpoints (<code>p06:BE64</code>).</p><p>Read in the "
         "code.</p>"),
        ("Metal Gear only falls in order",
         "<p>The 16 P.BOMBs have to hit it in the order of "
         "<code>p02:8D3B</code>, on one side or the other of its X. Then a "
         "countdown from 3000 starts (<code>p01:757B</code>), and leaving room "
         "0xE2 at the top leads to the ending (<code>p01:643A</code>).</p>"
         "<p>Read in the code.</p>"),
        ("What each item does",
         "<p>GOGGL shows the beams (<code>p15:BF22</code>) and LIGHT removes "
         "the darkness (<code>p00:4ACB</code>); DETEC marks the mines "
         "(<code>p03:AF9C</code>); MASK protects from the gas in 9 rooms "
         "(<code>p02:8C05</code>); ARMOR halves the damage of some types "
         "(<code>p02:8A05</code>); ANTID cures the scorpion's poison "
         "(<code>p01:7FAB</code>); PARAC saves you at the trapdoors "
         "(<code>p02:93BF</code>); inside the BOX and still, the guards do not "
         "see Snake (<code>p02:974F</code>); SCOPE turns on TELESCOPE MODE "
         "(<code>p01:7FDD</code>).</p><p>Read in the code.</p>"),
        ("The shot is heard",
         "<p>Without the SILENCER, firing raises the alarm and brings "
         "reinforcements (<code>p02:804F</code>), except in 55 rooms "
         "(<code>p02:806C</code>).</p><p>Read in the code.</p>"),
        ("Doors",
         "<p>Those of classes 2 to 9 want their card, CARD1 to CARD8, selected "
         "(<code>p01:794D</code>). Others open with punches (40 hits, "
         "<code>p01:79E9</code>) or with the P.BOMB (<code>p01:7973</code>).</p>"
         "<p>Read in the code.</p>"),
        ("The transceiver",
         "<p>Seven frequencies, from 120.13 to 120.91 (<code>p00:490C</code>). "
         "Some calls are only heard while sending (SEND) or under certain "
         "conditions (<code>p01:6A88</code>).</p><p>Read in the code.</p>"),
    ],
}

# (imagen, pie en castellano, pie en ingles). El logotipo de la cabecera es
# LOGOTIPO: el titulo que pinta el cartucho, no un montaje.
LOGOTIPO = "titulo.png"
GALERIA = [
    ("titulo.png",
     "La pantalla de t&iacute;tulo, montada desde la ROM (<code>p09:B5B5</code>, "
     "la fuente de <code>p09:B0B2</code>). Sin cotejar a&uacute;n contra la VRAM.",
     "The title screen, built from the ROM (<code>p09:B5B5</code>, the font at "
     "<code>p09:B0B2</code>). Not yet checked against the VRAM."),
    ("zona_01.png",
     "Una zona entera: sus salas colocadas por sus vecinas "
     "(<code>p05:8E0E</code>), con las puertas, los objetos y los actores de "
     "cada una; debajo, las salas a las que solo se llega por una puerta.",
     "A whole zone: its rooms laid out by their neighbours "
     "(<code>p05:8E0E</code>), with each room's doors, items and actors; "
     "below, the rooms reached only through a door."),
    ("sala_118_metalgear.png",
     "Metal Gear en su sala: un dibujo de fichas del banco 15 "
     "(<code>p15:B595</code>), no sprites.",
     "Metal Gear in its room: a drawing made of bank 15 tiles "
     "(<code>p15:B595</code>), not sprites."),
    ("sala_050_hind.png",
     "El Hind D, tambi&eacute;n de fichas (<code>p15:B431</code>).",
     "The Hind D, tiles as well (<code>p15:B431</code>)."),
    ("snake.png",
     "Las 53 poses de Snake (<code>p10:6000</code>) con sus atributos "
     "(<code>p10:609F</code>).",
     "Snake's 53 poses (<code>p10:6000</code>) with their attributes "
     "(<code>p10:609F</code>)."),
    ("tipo_32.png",
     "Big Boss (tipo 32; el nombre, de Manuel Pazos) y sus cuadros "
     "(<code>p05:9890</code>).",
     "Big Boss (type 32; the name is Manuel Pazos's) and his frames "
     "(<code>p05:9890</code>)."),
    ("armas.png",
     "Los proyectiles de las armas 1-7 y sus explosiones (<code>p10:63B0</code>).",
     "The projectiles of weapons 1-7 and their explosions "
     "(<code>p10:63B0</code>)."),
    ("transceptor.png",
     "El transceptor (<code>p01:6912</code>): el marco y el retrato del banco "
     "15, en 120.85. Sin cotejar a&uacute;n contra la VRAM.",
     "The transceiver (<code>p01:6912</code>): the frame and portrait from "
     "bank 15, on 120.85. Not yet checked against the VRAM."),
]
