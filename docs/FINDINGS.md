# Findings

Everything on this page is read in the code; none of it has yet been seen in
the emulator.

## Five passwords in the pause

F1 stops the game and you can type. The password is kept in the last twelve
keys (0xE500, `p06:BEA2`) and checked on resuming (`p06:BF2F`, table
`p06:BEF1`, each key as row × 8 + position in the matrix):

| Password | What it does |
|---|---|
| DS 4 | one more CLASS star |
| ANTA WA ERAI | three more stars |
| INTRUDER | every ammunition maximum to 999 |
| ISOLATION | the ration maximum to 999 |
| HIRAKE GOMA | all eight cards |

## The function keys

F1 pause, F2 weapons, F3 equipment and F4 transceiver (`p01:6F94`). In the
pause, F4 loads and F5 saves the game on tape: the header is ten 0xEA bytes
and a six-letter name, followed by the 0x300 bytes at 0xCA00 and their sum
(`p15:B948`). After GAME OVER, F5 goes on from the last checkpoint: there are
31, each a room and entrance pair (`p06:BE64`).

## Metal Gear only falls in order

Only the P.BOMB hurts it, and only when the last 16 hits, each on one side or
the other of its X, match `p02:8D3B`. When it breaks a countdown from 3000
starts (`p01:757B`), and leaving room 0xE2 at the top (`p01:643A`) leads to
the ending.

## What each item does

| Item | What it does | Where |
|---|---|---|
| GOGGL | shows the beams | `p15:BF22` |
| LIGHT | removes the darkness of rooms 0x7B-0x7D, 0xDC and 0xDD | `p00:4ACB` |
| DETEC | marks the mines | `p03:AF9C` |
| MASK | protects from the gas in 9 rooms | `p02:8C05` |
| ARMOR | halves the damage of types 0x2B, 0x2F and 0x3A-0x3E | `p02:8A05` |
| ANTID | cures the scorpion's poison | `p01:7FAB` |
| PARAC | saves you at the trapdoors | `p02:93BF` |
| BOX | inside it and still, the guards do not see Snake | `p02:974F` |
| SCOPE | turns on TELESCOPE MODE: you look into the next room | `p01:7FDD` |

## The shot is heard

Without the SILENCER, firing raises the alarm and brings reinforcements
(`p02:804F`), except in 55 rooms (`p02:806C`).

## Doors

Those of classes 2 to 9 want their card, CARD1 to CARD8, selected
(`p01:794D`). Others open with punches, forty hits (`p01:79E9`), or with the
P.BOMB (`p01:7973`).

## The transceiver

Seven frequencies, from 120.13 to 120.91 (`p00:490C`). Some calls are only
heard while sending (SEND) and others depending on what has happened: the
CLASS, whether a text has been read or a game flag (`p01:6A88`).

## Two bugs in the game

Both were found by Manuel Pazos, and Néstor (theNestruo) brought them to this
repository. They are measured by running the ROM's routines on a Z80, not in
the emulator.

**The weapon and equipment windows are not fully packed.** When they open
(F2 and F3), `p02:922D` and `p02:9234` move the list entries up to remove the
gaps. But the `djnz` at `p02:9250` jumps back one instruction too far (0xF3
instead of 0xF5, at byte 0x5251 of the ROM): it only looks at the entry right
after each gap, and with two gaps in a row nothing moves up.

| Before | The cartridge | With 0xF5 |
|---|---|---|
| 1 · 2 3 · 4 5 | 1 2 3 · · 4 5 | 1 2 3 4 5 · · |
| 1 · · 2 3 · · 4 5 | 1 · · 2 3 · · 4 5 | 1 2 3 4 5 · · · · |

**Only the slow guards drop anything.** On the third punch, `p01:72F9`
checks the guard's type: the code compares against all four (4, 5, 0x0E and
0x1E), but after `cp 4` there is a `jr nz` that sends every type other than 4
straight to dying (`p01:730D`), and the other three comparisons never match.
Run with all 128 values of the random number (`ld a,r`, `p01:7327`):
GUARD_SLOW drops a ration or an ammunition box (`p02:8E9F`) half of the time;
GUARD_MEDIUM, GUARD_ELEVATOR and GUARD_FAST, never.

## Thanks

Manuel Pazos published his disassembly of this same cartridge in 2017
(GuillianSeed/MetalGear). Here it has been used only as a reference, without
taking anything from his code; the 235 rooms of this repository match his
reference images point for point, and the enemy type names quoted are his.
Thank you, Manuel, for a superb piece of work.
