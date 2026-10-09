# Open questions

What is not settled.

## The check against the emulator

No picture has yet been checked against the openMSX VRAM. The 235 rooms match
Manuel Pazos's reference images, but the logo, the title, the transceiver,
the sprites and the bosses are only drawn from the ROM, without that proof.

## Sprites

- Mode 2 is drawn with each sprite's colour and the CC bit ORing with the
  previous one where they overlap. That the CC chain also shows where they do
  not overlap is an assumption until the check.
- Types 7, 17 and 42 have colour 0: they are not visible as sprites.
- Some frames are computed during play and not all of them are read (for
  instance the dog's and the Hind D's).

## Doors

- The data has 20 door types and the table at `p01:773C` has 19 targets: the
  only type 20 door (from room 117 to 204) falls outside it.
- That the drawings of types 7 to 19 are walls that open is an assumption.

## Data without a reader

Four blocks are named by no instruction: 0x4010 and 0x4030 in bank 0 (a
second header and a list of sound addresses), `p02:9262` (a "KONAMI 1987"
caption equal to the title's) and `p10:6388` (a sprite list with no index).

## Flags without a meaning

Many RAM flags carry in the listing a name after their address (0xC602,
0xC616, 0xC62C...) because where they are set and what they change is known,
but not what they stand for in the game.
