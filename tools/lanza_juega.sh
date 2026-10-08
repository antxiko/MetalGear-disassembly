#!/bin/sh
# lanza_juega.sh [dir] [maquina]: UN openMSX con tools/omsx_juega.tcl para que
# juegue una persona. Se cierra la ventana cuando se quiera: lo medido queda
# en work/<dir>/ (sitios.txt, muestras.txt y partida.omr).
R=$(cd "$(dirname "$0")/.." && pwd)
d=$R/work/${1:-juega}
mkdir -p $d
cd $R
MG_OUT="$d" MG_SITIOS=$R/work/sitios_a000.txt "/c/Program Files/openMSX/openmsx.exe" -machine ${2:-C-BIOS_MSX2_EU} -cart metalgear.rom -romtype Konami -script tools/omsx_juega.tcl > $d/stdout.txt 2>&1
echo hecho > $d/fin.txt
