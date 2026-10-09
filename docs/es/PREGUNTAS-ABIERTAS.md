# Preguntas abiertas

Lo que no está cerrado.

## El cotejo contra el emulador

Ninguna imagen se ha cotejado todavía contra la VRAM de openMSX. Las 235
salas casan con las imágenes de referencia de Manuel Pazos, pero el
logotipo, el título, el transceptor, los sprites y los jefes solo están
dibujados desde la ROM, sin esa prueba.

## Los sprites

- El modo 2 se dibuja con el color de cada sprite y el bit CC haciendo OR
  con el anterior donde se pisan. Que la cadena CC se vea también donde no se
  pisan es una suposición hasta el cotejo.
- Los tipos 7, 17 y 42 tienen color 0: no se ven como sprites.
- Algunos cuadros se calculan en tiempo de juego y no están todos leídos
  (por ejemplo los del perro y el Hind D).

## Las puertas

- En los datos hay 20 tipos de puerta y la tabla `p01:773C` tiene 19
  destinos: la única puerta de tipo 20 (de la sala 117 a la 204) cae fuera.
- Que los dibujos de los tipos 7 a 19 sean paredes que se abren es una
  suposición.

## Datos sin lector

Cuatro bloques no los nombra ninguna instrucción: 0x4010 y 0x4030 del banco 0
(una segunda cabecera y una lista de direcciones del sonido), `p02:9262` (un
rótulo «KONAMI 1987» igual al del título) y `p10:6388` (una lista de sprites
sin índice).

## Banderas sin significado

Muchas banderas de la RAM llevan en el listado un nombre por su dirección
(0xC602, 0xC616, 0xC62C...) porque se sabe dónde se ponen y qué cambian, pero
no qué representan dentro del juego.
