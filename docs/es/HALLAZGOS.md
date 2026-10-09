# Hallazgos

Todo lo de esta página está leído en el código; ninguno se ha visto todavía
en el emulador.

## Cinco claves en la pausa

Con F1 se para el juego y se puede teclear. La clave se guarda en las doce
últimas teclas (0xE500, `p06:BEA2`) y se mira al seguir (`p06:BF2F`, tabla
`p06:BEF1`, cada tecla como fila × 8 + posición en la matriz):

| Clave | Lo que hace |
|---|---|
| DS 4 | una estrella más de CLASS |
| ANTA WA ERAI | tres estrellas más |
| INTRUDER | todos los máximos de munición a 999 |
| ISOLATION | el máximo de raciones a 999 |
| HIRAKE GOMA | las ocho tarjetas |

## Las teclas de función

F1 pausa, F2 armas, F3 equipo y F4 transceptor (`p01:6F94`). En la pausa, F4
carga y F5 graba la partida en cinta: la cabecera son diez bytes 0xEA y un
nombre de seis letras, y detrás van los 0x300 bytes de 0xCA00 y su suma
(`p15:B948`). Tras GAME OVER, F5 sigue desde el último punto de control: hay
31, cada uno una pareja sala y entrada (`p06:BE64`).

## Metal Gear solo cae en orden

Solo la P.BOMB le hace daño, y solo cuando los 16 últimos golpes, cada uno a
un lado o al otro de su X, casan con `p02:8D3B`. Al romperse empieza una
cuenta atrás desde 3000 (`p01:757B`), y salir por arriba de la sala 0xE2
(`p01:643A`) lleva al final.

## Lo que hace cada objeto

| Objeto | Lo que hace | Dónde |
|---|---|---|
| GOGGL | deja ver los rayos | `p15:BF22` |
| LIGHT | quita la oscuridad de las salas 0x7B-0x7D, 0xDC y 0xDD | `p00:4ACB` |
| DETEC | marca las minas | `p03:AF9C` |
| MASK | protege del gas en 9 salas | `p02:8C05` |
| ARMOR | reduce a la mitad el daño de los tipos 0x2B, 0x2F y 0x3A-0x3E | `p02:8A05` |
| ANTID | quita el veneno del escorpión | `p01:7FAB` |
| PARAC | salva en las trampillas | `p02:93BF` |
| BOX | dentro y quieto, los guardias no ven a Snake | `p02:974F` |
| SCOPE | pone el TELESCOPE MODE: se mira la sala vecina | `p01:7FDD` |

## El disparo se oye

Sin el SILENCER, disparar pone la alarma y trae refuerzos (`p02:804F`),
salvo en 55 salas (`p02:806C`).

## Las puertas

Las de las clases 2 a 9 piden su tarjeta, de CARD1 a CARD8, elegida
(`p01:794D`). Otras se abren a puñetazos, cuarenta golpes (`p01:79E9`), o con
la P.BOMB (`p01:7973`).

## El transceptor

Siete frecuencias, de 120.13 a 120.91 (`p00:490C`). Algunas llamadas solo se
oyen enviando (SEND) y otras según lo que haya pasado: la CLASS, si se ha
leído un texto o una bandera de la partida (`p01:6A88`).

## Gracias

Manuel Pazos publicó en 2017 su desensamblado de este mismo cartucho
(GuillianSeed/MetalGear). Aquí se ha usado solo como consulta, sin tomar nada
de su código; las 235 salas de este repositorio casan punto por punto con sus
imágenes de referencia, y los nombres de los tipos de enemigo que se citan
son los suyos. Gracias, Manuel, por un trabajo estupendo.
