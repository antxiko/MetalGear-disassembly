# Metal Gear - a commented disassembly

*(También [en castellano](README.es.md).)*

The commented disassembly of **Metal Gear** (Konami, 1987, RC-750) for the
MSX2: a 128 KB MegaROM with the Konami mapper, sixteen 8 KB banks.

- **100%** of the binary explained: 35,620 bytes of code and 95,452 of named
  data, not one byte unassigned.
- **46.8%** of the listing commented, 2,190 routines and labels, none below
  10% of comments.
- The listing reassembles to the original ROM **byte for byte**.
- The 235 rooms, the doors, the items, Snake, the actors, Metal Gear, the
  Hind D, the logo and the transceiver are **drawn from the ROM**, not
  captured.

The web: <https://antxiko.github.io/MetalGear-disassembly/>
(in Spanish: <https://antxiko.github.io/MetalGear-disassembly/es/>).

## Thanks

Manuel Pazos published his own disassembly of this cartridge in 2017
(GuillianSeed/MetalGear). It has been used here only as a reference: the 235
rooms drawn by this repository match his reference images point for point,
and the enemy type names quoted are his. Thank you, Manuel, for a superb
piece of work.

## Reproducing it

The cartridge image is not distributed. Put yours in the root as
`metalgear.rom` (sha256 `d16fff4a...`) and run `make`. Details in
[GETTING-STARTED](docs/GETTING-STARTED.md).

## Legal

The game belongs to Konami and its rights holders. The licence in `LICENSE`
covers only the tools, comments, analysis and documentation here. See
[LEGAL-NOTICE.md](LEGAL-NOTICE.md).
