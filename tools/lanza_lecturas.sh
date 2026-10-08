#!/bin/sh
# lanza_lecturas.sh <nombre> <segundos> [fichero de teclas] [maquina]: una
# medida de tools/omsx_lecturas.tcl en work/omsx/<nombre>.txt. UN openMSX
# cada vez. La maquina es MSX2: por defecto C-BIOS_MSX2_EU.
R=$(cd "$(dirname "$0")/.." && pwd)
O=$R/work/omsx
mkdir -p $O
cd $R
X="/c/Program Files/openMSX/openmsx.exe"
T=""
[ -n "$3" ] && T="$(cat $3)"
MG_OUT=$O/$1.txt MG_SEGS=$2 MG_TECLAS="$T" MG_FOTOS="15 25 40 60 90" \
  timeout 1800 "$X" -machine ${4:-C-BIOS_MSX2_EU} -cart metalgear.rom -romtype Konami -script tools/omsx_lecturas.tcl > $O/$1.log 2>&1
echo hecho > $O/$1.fin
