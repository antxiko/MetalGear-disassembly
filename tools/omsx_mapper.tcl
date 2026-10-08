# omsx_mapper.tcl - Mide el reparto de bancos de verdad: apunta cada
# escritura a los registros del mapper (0x6000/0x8000/0xA000) con el PC que
# la hace, y muestrea el PC cada 2 ms emulados con el reparto vigente.
#
# MG_OUT=<dir>, MG_SEGS=<segundos emulados>. Deja en <dir>:
#   mapper.txt    "t pc registro banco" por escritura
#   muestras.txt  "t pc b6000 b8000 bA000" por muestra
#
# El teclado: SPACE a los 10 s (empieza la partida), luego cursores y SPACE
# a ratos, y F1-F5 y ESC por turnos a partir de los 40 s, para pasar por las
# pantallas que el titulo no ensena (equipo, transceptor...).
set OUT $::env(MG_OUT)
set SEGS $::env(MG_SEGS)
set ::f [open [file join $OUT mapper.txt] w]
set ::fs [open [file join $OUT muestras.txt] w]
# el estado de encendido del Konami4: 1, 2 y 3
set ::b6 1
set ::b8 2
set ::ba 3

proc apunta {reg} {
    set v $::wp_last_value
    switch $reg {
        0x6000 {set ::b6 $v}
        0x8000 {set ::b8 $v}
        0xA000 {set ::ba $v}
    }
    puts $::f [format "%.4f %04X %s %d" [machine_info time] [reg pc] $reg $v]
}
proc muestra {} {
    puts $::fs [format "%.4f %04X %d %d %d" [machine_info time] [reg pc] \
        $::b6 $::b8 $::ba]
    after time 0.002 muestra
}
# una tecla pulsada durante d segundos: fila y mascara de la matriz MSX
proc tecla {t fila mascara d} {
    after time $t "keymatrixdown $fila $mascara"
    after time [expr {$t + $d}] "keymatrixup $fila $mascara"
}

set throttle off
debug set_watchpoint write_mem 0x6000 {} {apunta 0x6000}
debug set_watchpoint write_mem 0x8000 {} {apunta 0x8000}
debug set_watchpoint write_mem 0xA000 {} {apunta 0xA000}
after time 0.5 muestra

# SPACE (fila 8, bit 0) para salir del titulo
tecla 10 8 0x01 0.3
tecla 13 8 0x01 0.3
# moverse: RIGHT 0x80, LEFT 0x10, UP 0x20, DOWN 0x40 (fila 8)
set t 16
foreach m {0x80 0x20 0x10 0x40 0x80 0x01 0x20 0x80 0x01 0x40 0x10 0x20} {
    tecla $t 8 $m 1.5
    set t [expr {$t + 2}]
}
# F1 F2 F3 (fila 6, bits 5-7), F4 F5 ESC (fila 7, bits 0-2), con SPACE entre
# medias para salir de cada pantalla
set t 42
foreach par {{6 0x20} {7 0x04} {6 0x40} {7 0x04} {6 0x80} {7 0x04} \
             {7 0x01} {7 0x04} {7 0x02} {7 0x04}} {
    tecla $t [lindex $par 0] [lindex $par 1] 0.4
    set t [expr {$t + 3}]
}
after time $SEGS {close $::f; close $::fs; exit}
