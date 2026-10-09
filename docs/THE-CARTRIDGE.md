# The cartridge

## The machine

MSX2: the VDP is a V9938 and the game works in SCREEN 5 (256 × 212, 16
colours, `CHGMOD` at `p01:7C6C`). VRAM page 0 is the screen and page 1 holds
the tiles, the item drawings, the font and the backgrounds that get covered;
almost everything is painted by copying rectangles from page 1 to page 0 with
the VDP commands (`p00:4FCD` HMMM, `p00:5011` LMMM with TIMP, `p00:4F91`
HMMV).

## The mapper

A 128 KB MegaROM with the Konami mapper without SCC: 16 banks of 8 KB. Bank 0
is fixed at 0x4000; the other three are chosen by writing to 0x6000, 0x8000
and 0xA000. Bank 3k+1 goes to 0x6000, 3k+2 to 0x8000 and 3k+3 to 0xA000, and
they are set in trios (`p00:4248` 1-2-3, `p00:424E` 4-5-6, `p00:426A` 7-8-9,
`p00:4270` 10-11-12, `p00:4276` 13-14-15), with their copy at 0xF0F1-0xF0F3.

The code in banks 6, 9, 12 and 15 runs at 0xA000 with 1 and 2 below: these
are the **zone banks** (`p00:4913`-`4925`), noted at 0xF0F6. To call a routine
that switches banks and come back with their own in place they use the
**trampolines** at `p00:4050`-`4195`: each one calls the routine and ends at
`p00:4198`, which sets 1-2-3 and puts the bank in 0xF0F6 back at 0xA000.

## The interrupt

`p00:41AC` hangs from H.TIMI. Every frame it sets banks 4 and 5 and calls the
sound driver (bank 4, 0x6000); then, if the previous frame has finished
(0xC005), it calls the frame's game (`p01:6672`).

## Sound

Four channels of 0x20 bytes from 0xC010 over the PSG (`p04:6000`). There are
95 sounds (index `p04:6892`): below 0x29 they are effects on the fourth
channel, from 0x29 to 0x5B three-channel music and from 0x5C on four-channel
(`p04:67FD`). The lists have two formats and five instruments of 12 notes
(`p04:652B`).

## Sprites

V9938 sprite mode 2, 16 × 16. There are two attribute tables (0xF600 and
0xF200) swapped every frame with R#5 (`p15:B8BC`), and the order in which the
sprite groups are written changes every frame (`p15:B8DE`), so that with more
than eight on a line it is not always the same one that disappears.

## The RAM

| Address | What it is |
|---|---|
| 0xC000 / 0xC001 | the game state and its step |
| 0xC002 | bit 6: being played (the demo makes no sound) |
| 0xC006 / 0xC007 | the new keys and the ones held |
| 0xC112 / 0xC113 | the new function keys and the ones held |
| 0xC130 | the room |
| 0xC131 / 0xC137 | the life and its maximum |
| 0xC132 | the CLASS (0-3) |
| 0xC134 / 0xC135 | the selected weapon and item |
| 0xC138 | the transceiver frequency (BCD) |
| 0xC151 | the game mode |
| 0xC180 | Snake's state |
| 0xC181-0xC184 | Snake's Y and X (16 bits) |
| 0xC200 | the 6 projectiles (0x40-byte records) |
| 0xC500 / 0xC530 | the weapons and items carried |
| 0xCA00 | the saved game (0x300 bytes) |
| 0xD000 | the 16 actors (0x80-byte records) |
| 0xE000 | the built room (32 × 24 tiles) |
| 0xEA00 | the copy of the sprite attributes |
