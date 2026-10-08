#!/bin/sh
# lanza_sitios.sh <dir> <segundos> ["<teclas>"] [maquina]: tools/omsx_sitios.tcl,
# UN openMSX sin throttle. Los sitios salen de work/sitios_a000.txt.
R=$(cd "$(dirname "$0")/.." && pwd)
d=$R/work/$1
mkdir -p $d
cd $R
MG_OUT="$d" MG_SEGS=$2 MG_TECLAS="$3" MG_SITIOS=$R/work/sitios_a000.txt timeout 1800 "/c/Program Files/openMSX/openmsx.exe" -machine ${4:-C-BIOS_MSX2_EU} -cart metalgear.rom -romtype Konami -script tools/omsx_sitios.tcl > $d/stdout.txt 2>&1
echo hecho > $d/fin.txt
