#!/bin/sh
# lanza_mapper.sh <dir> <segundos> [maquina]: tools/omsx_mapper.tcl, UN openMSX.
# La maquina es MSX2: por defecto C-BIOS_MSX2_EU.
R=$(cd "$(dirname "$0")/.." && pwd)
d=$R/work/$1
mkdir -p $d
cd $R
MG_OUT="$d" MG_SEGS=$2 timeout 1800 "/c/Program Files/openMSX/openmsx.exe" -machine ${3:-C-BIOS_MSX2_EU} -cart metalgear.rom -romtype Konami -script tools/omsx_mapper.tcl > $d/stdout.txt 2>&1
echo hecho > $d/fin.txt
