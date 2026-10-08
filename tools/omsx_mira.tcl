# omsx_mira.tcl - Mira que ensena el juego: una captura cada 5 s emulados,
# con el reloj en el nombre, y las teclas que diga MG_TECLAS. Throttle ON,
# que con el throttle quitado openMSX se salta el pintado y la captura sale
# vieja.
#
# MG_OUT=<dir>, MG_SEGS=<segundos emulados>, MG_TECLAS = lista Tcl de
# {t fila mascara duracion} (filas y mascaras de la matriz MSX).
set OUT $::env(MG_OUT)
set SEGS $::env(MG_SEGS)
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
}
debug set_watchpoint write_mem 0x6000 {} {apunta 0x6000}
debug set_watchpoint write_mem 0x8000 {} {apunta 0x8000}
debug set_watchpoint write_mem 0xA000 {} {apunta 0xA000}
set ::fl [open [file join $OUT capturas.txt] w]
proc captura {} {
    set t [machine_info time]
    set n [format "%03d" [expr {int($t)}]]
    screenshot [file join $::OUT "t$n.png"]
    puts $::fl [format "%.2f t%s.png pc %04X bancos %d %d %d" $t $n [reg pc] \
        $::b6 $::b8 $::ba]
    flush $::fl
    after time 5 captura
}
proc tecla {t fila mascara d} {
    after time $t "keymatrixdown $fila $mascara"
    after time [expr {$t + $d}] "keymatrixup $fila $mascara"
}
set throttle on
after time 5 captura
foreach k $::env(MG_TECLAS) {
    tecla [lindex $k 0] [lindex $k 1] [lindex $k 2] [lindex $k 3]
}
after time $SEGS {close $::fl; exit}
