# omsx_sitios.tcl - Que banco hay en 0xA000 cuando cada sitio de los bancos
# 0-2 salta o llama a 0xA000-0xBFFF. El trazador estatico no puede saberlo:
# el juego mete en 0xA000 el banco 6, 9, 12 o 15 segun la zona (p00:4913-
# 4925) y el mismo `call 0xBD6D` cae en uno u otro.
#
# MG_OUT=<dir>, MG_SEGS=<segundos emulados>, MG_SITIOS=<fichero> con una
# linea "PC DESTINO pNN" por sitio (work/sitios_a000.txt). Pone un
# breakpoint en cada PC y apunta (pc, destino, banco en 0xA000). Ademas
# vigila el `jp (hl)` del despachador (p00:41F2) y apunta HL con los tres
# bancos: asi salen tambien las entradas de tabla que caen en 0xA000+.
# Deja <dir>/sitios.txt con "pc destino b6 b8 bA" por paso (sin repetir).
set OUT $::env(MG_OUT)
set SEGS $::env(MG_SEGS)
set ::b6 1
set ::b8 2
set ::ba 3
set ::f [open [file join $OUT sitios.txt] w]
array set ::visto {}
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
proc sitio {pc dest} {
    set k [format "%04X %04X %d %d %d" $pc $dest $::b6 $::b8 $::ba]
    if {![info exists ::visto($k)]} {
        set ::visto($k) 1
        puts $::f "$k"
        flush $::f
    }
}
proc despacho {} {
    sitio 0x41F2 [reg hl]
}
set n 0
set fs [open $::env(MG_SITIOS) r]
while {[gets $fs ln] >= 0} {
    set p [split [string trim $ln]]
    if {[llength $p] < 2} continue
    set pc [expr 0x[lindex $p 0]]
    set dest [expr 0x[lindex $p 1]]
    debug set_bp $pc {} "sitio $pc $dest"
    incr n
}
close $fs
debug set_bp 0x41F2 {} despacho
proc tecla {t fila mascara d} {
    after time $t "keymatrixdown $fila $mascara"
    after time [expr {$t + $d}] "keymatrixup $fila $mascara"
}
set throttle off
# SPACE en el titulo (sale a los 12 s), y luego lo que diga MG_TECLAS
tecla 15 8 0x01 0.3
tecla 20 8 0x01 0.3
if {[info exists ::env(MG_TECLAS)]} {
    foreach k $::env(MG_TECLAS) {
        tecla [lindex $k 0] [lindex $k 1] [lindex $k 2] [lindex $k 3]
    }
}
after time $SEGS {close $::f; exit}
