# The code

## The numbers

- **100%** of the binary explained: 35,620 bytes of traced code and 95,452
  of named data, which add up to the cartridge's 131,072.
- 17,071 instructions in banks 0, 1, 2, 3, 4, 6, 9, 12 and 15, with **7,985
  comments: 46.8%**.
- 2,190 routines and labels; none below 10% of comments, and no `call` to an
  unnamed routine.

## How it is organised

The frame's game (`p01:6672`) dispatches on the **game state** (0xC000): the
logo and the title, the wait, the demo, PLAY START, the new game, the game,
GAME OVER, the pause and the ending.

Inside the game (`p01:6F18`) the **mode** rules (0xC151, table `p01:6F7A`):
play, room change, the weapons and equipment windows, the transceiver, the
lorry, the lift, opening a door, the telescope, Snake dead, the text window,
the capture and room 0x85.

Snake has his own **state** (0xC180, table `p01:6001`) and his **pose mode**
(0xC18B, table `p01:6508`).

## The records

IX points to three kinds of record, and `tools/anotaciones.py` comments their
fields wherever IX is surely one of them:

- **actor** (0xD000, 16 of 0x80): +0 the type (bit 7: dying), +1 the step, +3
  the Y, +5 the X, +7/+9 the speeds, +0x0B the frame, +0x0C the frame count,
  +0x0D the stamina, +0x0E what it collides with, +0x11 the direction, +0x1E
  the hit marks, +0x20 how many sprites;
- **projectile** (0xC200, 6 of 0x40): the weapon, the step, the Y, the X, the
  ground Y and whether it hurts;
- **sound channel** (0xC010, 4 of 0x20): the list, the note, the period, the
  volume, the instrument and the vibrato.

## Actors

Each type has two handlers: **creation** (`p00:575F`, table `p00:5762`) and
**every frame** (`p01:722C`, table `p01:722F`, from the loop at `p01:71E5`).
In the listing they are called `crea_tipo_N` and `cuadro_tipo_N`. The frame's
collisions are at `p02:88EF`: projectiles against actors, Snake against
actors, the tiles and rooms that hurt, doors and items.

## Texts

159 texts (`p12:A37D`) with 92 shared pieces (`p12:B8A7`): a byte from 0xA1
on inserts a piece. The window works in steps (`p00:5D03`) and writes a
letter every 4 frames with its sound.

## The names

The names and the automatic comments come from `tools/anotaciones.py`, each
with the routine where it is read; `tools/anota.py` writes them into the
notes. The per-type handlers are named on their own from the two dispatch
tables, and the bank 0 trampolines after the routine they call.
