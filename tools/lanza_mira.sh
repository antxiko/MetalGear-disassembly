#!/bin/sh
# lanza_mira.sh <dir> <segundos> "<teclas>" [maquina]: tools/omsx_mira.tcl,
# UN openMSX con throttle (tarda los segundos de verdad). Las teclas son una
# lista Tcl de {t fila mascara duracion}.
R=$(cd "$(dirname "$0")/.." && pwd)
d=$R/work/$1
mkdir -p $d
cd $R
MG_OUT="$d" MG_SEGS=$2 MG_TECLAS="$3" timeout 1800 "/c/Program Files/openMSX/openmsx.exe" -machine ${4:-C-BIOS_MSX2_EU} -cart metalgear.rom -romtype Konami -script tools/omsx_mira.tcl > $d/stdout.txt 2>&1
echo hecho > $d/fin.txt
