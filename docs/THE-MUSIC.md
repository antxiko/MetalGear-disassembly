# The music

Everything you hear here comes from running the cartridge's own sound engine (`sonido_del_cuadro`, p04:6000, and `pide_sonido`, p04:67FD, which points the track; the interrupt calls it at p00:41B9 with banks 4 and 5) on an emulated Z80, frame by frame at 60 per second, just as the game calls it. What the engine writes to the PSG is turned into sound with an AY-3-8910 (`tools/musica.py`). Each MP3 is the whole piece up to where it starts again, plus 8 seconds of the repeat fading out; those that do not repeat end where the engine ends.

## Checked against openMSX

The PSG writes have been compared frame by frame with those of openMSX (C-BIOS MSX2 japonés). In every frame the PSG ends up the same:

- tune 0x2F, its first 116 frames;
- tune 0x3B, its first 116 frames.

The timbre is not checked: it is a textbook AY-3-8910, not a recording of the emulator. The probes are `tools/omsx_psg.tcl` and `tools/coteja_psg.py`.

## How a piece is asked for

`sonido` (p00:4284) maps banks 4 and 5 and calls `pide_sonido` (p04:67FD) with the number in A: below 0x29 it is an effect, which takes the channel at 0xC070 if it outranks what is playing, and from 0x29 up it is three- or four-channel music. The game computes each room's tune number, so almost all are tracks «in the table». The sound RAM is at 0xC010-0xC0FB and 0xC0F0 holds the copy of the PSG mixer, which start-up leaves at 0xB8. Those that sound like another are published once, and those that last over 75 seconds without starting again are cut at 75.

## The tunes

**A room's tune** (0x32)

Asked for by `pon_c602`: la música 0x32 (0x2F si la pone un actor del tipo 6); lasts 45.2 s and starts again at second 6.5.

<audio controls preload="none" src="audio/musica_32.mp3?v=3d365169"></audio>

**The transceiver tune** (0x5C)

Asked for by `transceptor_texto` y `c900_paso_2`; lasts 0.1 s.

<audio controls preload="none" src="audio/musica_5C.mp3?v=a9fedc66"></audio>

**Table track 0x29** (0x29)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_29.mp3?v=09bcc7eb"></audio>

**Table track 0x2A** (0x2A)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_2A.mp3?v=d602b9ab"></audio>

**Table track 0x2B** (0x2B)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_2B.mp3?v=fff8070b"></audio>

**Table track 0x2C** (0x2C)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_2C.mp3?v=b77a90b7"></audio>

**Table track 0x2D** (0x2D)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_2D.mp3?v=b7e815b1"></audio>

**Table track 0x2E** (0x2E)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_2E.mp3?v=4255ecec"></audio>

**Table track 0x2F** (0x2F)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; lasts 47.8 s and starts again at second 9.2.

<audio controls preload="none" src="audio/musica_2F.mp3?v=206e3106"></audio>

**Table track 0x30** (0x30)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; lasts 47.8 s and starts again at second 9.2.

<audio controls preload="none" src="audio/musica_30.mp3?v=45f0a776"></audio>

**Table track 0x31** (0x31)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; lasts 45.2 s and starts again at second 6.5.

<audio controls preload="none" src="audio/musica_31.mp3?v=688f023d"></audio>

**Table track 0x33** (0x33)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_33.mp3?v=b7f3983d"></audio>

**Table track 0x34** (0x34)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_34.mp3?v=ce2bd451"></audio>

**Table track 0x35** (0x35)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; lasts 50.7 s and starts again at second 19.5.

<audio controls preload="none" src="audio/musica_35.mp3?v=fd6be314"></audio>

**Table track 0x36** (0x36)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_36.mp3?v=dbfe96c7"></audio>

**Table track 0x37** (0x37)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_37.mp3?v=22ca8017"></audio>

**Table track 0x38** (0x38)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_38.mp3?v=4f7e2006"></audio>

**Table track 0x39** (0x39)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_39.mp3?v=eb7ee9d7"></audio>

**Table track 0x3A** (0x3A)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_3A.mp3?v=5d9044be"></audio>

**Table track 0x3B** (0x3B)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; lasts 55.0 s and starts again at second 23.0.

<audio controls preload="none" src="audio/musica_3B.mp3?v=ba26829f"></audio>

**Table track 0x3C** (0x3C)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_3C.mp3?v=04f88602"></audio>

**Table track 0x3D** (0x3D)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_3D.mp3?v=c9c43ea3"></audio>

**Table track 0x1F** (0x1F)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; lasts 4.6 s.

<audio controls preload="none" src="audio/musica_1F.mp3?v=83d8ba23"></audio>

**Table track 0x4E** (0x4E)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_4E.mp3?v=4653c1c5"></audio>

**Table track 0x4F** (0x4F)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_4F.mp3?v=34bd0307"></audio>

**Table track 0x50** (0x50)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; lasts 44.0 s and starts again at second 0.0.

<audio controls preload="none" src="audio/musica_50.mp3?v=94f4d6da"></audio>

**Table track 0x51** (0x51)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_51.mp3?v=7c8beb76"></audio>

**Table track 0x53** (0x53)

Asked for by ninguna llamada directa: sale de la tabla de pistas por un número calculado; is cut at 75 s (the piece goes on).

<audio controls preload="none" src="audio/musica_53.mp3?v=eef8a160"></audio>
