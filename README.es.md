# Metal Gear - desensamblado comentado

*(Also [in English](README.md).)*

El desensamblado comentado de **Metal Gear** (Konami, 1987, RC-750) para
MSX2: un MegaROM de 128 KB con el mapper de Konami, dieciséis bancos de 8 KB.

- **100 %** del binario explicado: 35.620 bytes de código y 95.452 de datos
  con nombre, ni un byte sin asignar.
- **46,8 %** del listado comentado, 2.190 rutinas y etiquetas, ninguna por
  debajo del 10 % de comentarios.
- El listado se reensambla en la ROM original **byte a byte**.
- Las 235 salas, las puertas, los objetos, Snake, los actores, Metal Gear, el
  Hind D, el logotipo y el transceptor están **dibujados desde la ROM**, no
  capturados.

La web: <https://antxiko.github.io/MetalGear-disassembly/es/>
(en inglés: <https://antxiko.github.io/MetalGear-disassembly/>).

## Gracias

Manuel Pazos publicó en 2017 su propio desensamblado de este cartucho
(GuillianSeed/MetalGear). Aquí se ha usado solo como consulta: las 235 salas
que dibuja este repositorio casan punto por punto con sus imágenes de
referencia, y los nombres de los tipos de enemigo que se citan son los suyos.
Gracias, Manuel, por un trabajo estupendo.

## Reproducirlo

La imagen del cartucho no se distribuye. Pon la tuya en la raíz como
`metalgear.rom` (sha256 `d16fff4a...`) y ejecuta `make`. El detalle, en
[EMPEZAR](docs/es/EMPEZAR.md).

## Legal

El juego es de Konami y de sus titulares. La licencia de `LICENSE` cubre solo
las herramientas, los comentarios, el análisis y la documentación de aquí.
Mira [AVISO-LEGAL.md](AVISO-LEGAL.md).
