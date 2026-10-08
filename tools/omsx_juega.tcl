# omsx_juega.tcl - Para que juegue una persona con la sonda puesta.
#
# Mientras se juega (throttle normal) apunta tres cosas, y las vuelca cada
# 30 s emulados y al salir, asi que se puede cerrar la ventana sin mas:
#   sitios.txt    "pc destino b6 b8 bA": que banco hay en 0xA000 cuando cada
#                 sitio de work/sitios_a000.txt salta a 0xA000-0xBFFF, y el
#                 HL del despachador p00:41F2
#   muestras.txt  "pc b6 b8 bA cuenta": el PC muestreado cada 0,5 ms emulados
#                 (solo 0x6000-0xBFFF, que es donde importa el banco)
#   partida.omr   el replay de openMSX, por si hay que volver a mirar algo
# MG_OUT=<dir>, MG_SITIOS=<fichero de sitios>.
set OUT $::env(MG_OUT)
set ::b6 1
set ::b8 2
set ::ba 3
array set ::visto {}
array set ::cnt {}
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
    set ::visto($k) 1
}
proc despacho {} {
    sitio 0x41F2 [reg hl]
}
set fs [open $::env(MG_SITIOS) r]
while {[gets $fs ln] >= 0} {
    set p [split [string trim $ln]]
    if {[llength $p] < 2} continue
    set pc [expr 0x[lindex $p 0]]
    set dest [expr 0x[lindex $p 1]]
    debug set_bp $pc {} "sitio $pc $dest"
}
close $fs
debug set_bp 0x41F2 {} despacho
proc muestra {} {
    set pc [reg pc]
    if {$pc >= 0x6000 && $pc < 0xC000} {
        set k [format "%04X %d %d %d" $pc $::b6 $::b8 $::ba]
        if {[info exists ::cnt($k)]} {incr ::cnt($k)} else {set ::cnt($k) 1}
    }
    after time 0.0005 muestra
}
proc vuelca {} {
    set f [open [file join $::OUT sitios.txt] w]
    foreach k [lsort [array names ::visto]] {puts $f $k}
    close $f
    set f [open [file join $::OUT muestras.txt] w]
    foreach k [lsort [array names ::cnt]] {puts $f "$k $::cnt($k)"}
    close $f
    reverse savereplay [file join $::OUT partida.omr]
    osd::display_message [format "sonda: %d sitios, %d pc distintos (%.0f s)" \
        [array size ::visto] [array size ::cnt] [machine_info time]] info
    after time 30 vuelca
}
after time 0.5 muestra
after time 30 vuelca
after quit vuelca
osd::display_message "sonda de bancos puesta: juega; se guarda sola cada 30 s" info
