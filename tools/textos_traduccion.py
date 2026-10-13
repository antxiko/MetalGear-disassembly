# -*- coding: utf-8 -*-
"""La traduccion de los textos japoneses del cartucho (no es de Konami).

TRAD[n] = (castellano, ingles) del texto n de p12:A37D; " / " separa las
paginas de la ventana igual que en las columnas de la ROM. Los nombres propios
y lo que la ROM ya trae en letras latinas se dejan como estan.
"""

# "X ヲ ニュウシュ シタ。": el aviso al coger un objeto (el trozo 0xD9).
_COGE = {
    0x08: ("la ración", "the ration"),
    0x0B: ("la tarjeta 1", "card 1"),
    0x0D: ("los prismáticos", "the binoculars"),
    0x10: ("la pistola", "the handgun"),
    0x12: ("minas", "land mines"),
    0x15: ("munición", "ammunition"),
    0x1D: ("el misil teledirigido", "the remote-control missile"),
    0x25: ("la tarjeta 2", "card 2"),
    0x28: ("la caja de cartón", "the cardboard box"),
    0x2B: ("el silenciador", "the silencer"),
    0x2E: ("el lanzagranadas", "the grenade launcher"),
    0x37: ("la tarjeta 4", "card 4"),
    0x38: ("el subfusil", "the submachine gun"),
    0x3F: ("la tarjeta 3", "card 3"),
    0x41: ("el chaleco antibalas", "the body armour"),
    0x43: ("el traje antiexplosiones", "the bomb blast suit"),
    0x45: ("explosivo plástico", "plastic explosive"),
    0x47: ("el uniforme enemigo", "the enemy uniform"),
    0x4B: ("las gafas de infrarrojos", "the infrared goggles"),
    0x51: ("el paracaídas", "the parachute"),
    0x55: ("el detector de minas", "the mine detector"),
    0x60: ("la linterna", "the flashlight"),
    0x62: ("la antena", "the antenna"),
    0x67: ("la tarjeta 5", "card 5"),
    0x6E: ("la tarjeta 6", "card 6"),
    0x77: ("el lanzacohetes", "the rocket launcher"),
    0x78: ("la brújula", "the compass"),
    0x79: ("el antídoto", "the antidote"),
    0x8F: ("la tarjeta 8", "card 8"),
    0x97: ("la máscara antigás", "the gas mask"),
    0x98: ("la bombona de oxígeno", "the oxygen tank"),
    0x99: ("la tarjeta 7", "card 7"),
}

BB = ("Aquí Big Boss... ", "This is Big Boss... ")
SCH = ("Aquí Schneider... ", "This is Schneider... ")
LIDER = ("Aquí el líder de la resistencia, Schneider... ",
         "This is resistance leader Schneider... ")
DIANE = ("Hola. Aquí Diane... ", "Hi. This is Diane... ")
JEN = ("Aquí Jennifer... ", "This is Jennifer... ")
SALVA = ("¡Me has salvado!", "You saved me!")
CORTO = (" ...Corto.", " ...Over.")
ADIOS = (" ...Adiós.", " ...Bye.")
USO = ("Ya sabes cómo se usa.", "You know how to use it.")


def _de(quien, es, en, fin=CORTO):
    return (quien[0] + es + fin[0], quien[1] + en + fin[1])


TRAD = {n: ("Has conseguido %s." % es, "Got %s." % en)
        for n, (es, en) in _COGE.items()}

TRAD.update({
    0x01: ("¡¡Cambio de guardia!!", "Change of shift!!"),
    0x02: _de(BB, "Operación Intrude N313. Infíltrate en la fortaleza enemiga "
              "Outer Heaven y destruye el arma definitiva Metal Gear. / "
              "Lo primero: contacta con Grey Fox, que ha desaparecido, y "
              "averigua qué es de verdad el arma definitiva Metal Gear. / "
              "A partir de ahora el contacto será en la frecuencia 12085.",
              "Operation Intrude N313. Infiltrate the enemy fortress Outer "
              "Heaven and destroy the ultimate weapon Metal Gear! / First, "
              "contact Grey Fox, who has gone missing, and find out what the "
              "ultimate weapon Metal Gear really is. / From now on we keep in "
              "touch on frequency 12085."),
    0x03: _de(BB, "Tu misión es infiltrarte. Ante todo, actúa sin que el "
              "enemigo te descubra.",
              "Your mission is infiltration. Whatever you do, move so that "
              "the enemy does not spot you."),
    0x04: _de(BB, "Las armas y el equipo, quítaselos al enemigo: de los "
              "camiones y del arsenal. ¡¡La munición, quítasela a los "
              "centinelas!! / Para abrir las puertas hace falta una tarjeta. "
              "Busca las tarjetas.",
              "Take your weapons and equipment from the enemy: from the "
              "trucks and the armoury. Take ammunition from the guards!! / "
              "You need a card to open the doors. Look for the cards."),
    0x05: _de(BB, "Con los ascensores se pasa de una planta a otra. "
              "Memoriza dónde están.",
              "The elevators take you from floor to floor. Memorise where "
              "they are."),
    0x06: ("¡¡No te muevas!!", "Don't move!!"),
    0x07: ("¡Quedas detenido!", "You're coming with me!"),
    0x09: _de(BB, "¿La ración? Es comida de emergencia. No te la comas "
              "enseguida: guárdala.",
              "The ration? It's emergency food. Don't eat it straight away: "
              "keep it."),
    0x0A: ("Aquí Solid Snake... Respondan, por favor.",
           "This is Solid Snake... Please respond."),
    0x0C: _de(BB, "¿Una tarjeta? Es una tarjeta para abrir puertas. / Cada "
              "puerta lleva un número de tarjeta distinto. Ten cuidado.",
              "A card? It's a card that opens doors. / Each door takes a "
              "different card number. Be careful."),
    0x0E: _de(BB, "¿Los prismáticos? / Úsalos para mirar alrededor: se ve el "
              "terreno de lejos y dónde están los enemigos. Acostúmbrate a "
              "usarlos siempre.",
              "The binoculars? / Use them to look around: you can see the "
              "terrain in the distance and where the enemies are. Make a "
              "habit of always using them."),
    0x0F: ("...¿Me oyes? Solid Snake... Yo no moriré... Algún día "
           "zanjaremos esto. / Algún día... ¡nos volveremos a ver!",
           "...Can you hear me? Solid Snake... I will not die... One day we "
           "will settle this. / Some day... we will meet again!"),
    0x11: _de(BB, "¿La pistola? Beretta M92F (en la ROM, BELLETA)... / Ya "
              "sabes cómo se usa. Busca munición. No malgastes las balas.",
              "The handgun? Beretta M92F (BELLETA in the ROM)... / You know "
              "how to use it. Look for ammunition. Don't waste bullets."),
    0x13: _de(BB, "¿Minas? " + USO[0], "Land mines? " + USO[1]),
    0x14: _de(BB, "Tiene que haber una resistencia. Prueba a contactar por "
              "radio.",
              "There must be a resistance. Try to contact them by radio."),
    0x16: _de(BB, "La munición que puedes llevar tiene un límite. Ten "
              "cuidado.",
              "There is a limit to how much ammunition you can carry. Be "
              "careful."),
    0x17: _de(LIDER, "/ Te guiaré por el interior de la fortaleza. Contacta "
              "en la frecuencia 12079.",
              "/ I will guide you through the inside of the fortress. "
              "Contact me on frequency 12079."),
    0x18: _de(BB, "Cuidado con las cámaras de vigilancia.",
              "Watch out for the surveillance cameras."),
    0x19: _de(BB, "Se me olvidaba: en la zona de gas hace falta máscara "
              "antigás. / Dónde está la máscara lo sabrá el líder de la "
              "resistencia, Schneider.",
              "I forgot to tell you: you need a gas mask in the gas zone. / "
              "The resistance leader, Schneider, should know where the mask "
              "is."),
    0x1A: _de(LIDER, "La máscara antigás está en el sur de la planta 1.",
              "The gas mask is in the south of floor 1."),
    0x1B: (SALVA[0] + " / En la frecuencia 12033 te ayudará Diane, de la "
           "resistencia. / Diane conoce bien al enemigo.",
           SALVA[1] + " / On frequency 12033 Diane, from the resistance, "
           "will support you. / Diane should know a lot about the enemy."),
    0x1C: SALVA,
    0x1E: _de(BB, "¿El misil teledirigido? / Es un misil que se maneja a "
              "distancia. Úsalo donde haya muchos obstáculos.",
              "The remote-control missile? / It's a missile you steer by "
              "remote control. Use it where there are lots of obstacles."),
    0x1F: ("Aquí Radio KNK. Interrumpimos para dar una noticia de última "
           "hora. / Esta madrugada parece que ha habido un gran terremoto "
           "cerca de Galzburg, Sudáfrica...",
           "This is Radio KNK. We interrupt with a news flash. / In the "
           "small hours of today there appears to have been a major "
           "earthquake near Galzburg, South Africa..."),
    0x20: (SALVA[0] + " / El Fox Hounder que se infiltró hace unos días "
           "está vivo. / Lo tienen prisionero.",
           SALVA[1] + " / The Fox Hounder who got in a few days ago is "
           "alive. / They are holding him prisoner."),
    0x21: ("¡Aah! ¡¡Qué sueño!!", "Aah! I'm so sleepy!!"),
    0x22: ("¡Me he quedado dormido!", "I fell asleep!"),
    0x23: ("Parece que se ha infiltrado un Fox Hounder. ¡Que no pase de "
           "ninguna manera!",
           "It seems a Fox Hounder has got in. Don't let him through, "
           "whatever happens!"),
    0x24: _de(BB, "Te explico las teclas de función. Con F1, pausa. / Con "
              "F2, eliges arma. Con F3, eliges equipo. Con F4, modo radio. / "
              "Grábatelo bien.",
              "I'll explain the function keys. F1 pauses. / F2 selects a "
              "weapon. F3 selects equipment. F4 is radio mode. / Get that "
              "into your head."),
    0x26: _de(BB, "Se me olvidaba: contra la alta tensión, destruye el "
              "panel de la corriente. / Usa el misil teledirigido. Dónde está "
              "el misil lo sabe el líder de la resistencia, Schneider.",
              "I forgot to tell you: for the high voltage, destroy the power "
              "panel. / Use the remote-control missile. The resistance "
              "leader, Schneider, knows where the missile is."),
    0x27: _de(LIDER, "El misil teledirigido está en el suroeste.",
              "The remote-control missile is in the southwest."),
    0x29: _de(BB, "¿Una caja de cartón? ¿Es que te vas de mudanza?",
              "A cardboard box? Are you moving house or something?"),
    0x2A: _de(BB, "Se me olvidaba: en la azotea hay una barrera de viento. "
              "¡Busca el traje antiexplosiones!",
              "I forgot to tell you: there is a wind barrier on the roof. "
              "Look for the bomb blast suit!"),
    0x2C: _de(BB, "¿El silenciador? Con esto puesto no se oyen los "
              "disparos.",
              "The silencer? With this fitted, your shots can't be heard."),
    0x2D: ("Y ahora os presentamos al equipo de Metal Gear... / (los "
           "créditos, en letras latinas en las dos versiones)",
           "And now, introducing the Metal Gear staff... / (the credits, in "
           "Latin letters in both versions)"),
    0x2F: _de(BB, "¿El lanzagranadas M79? " + USO[0],
              "The M79 grenade launcher? " + USO[1]),
    0x30: _de(BB, "Se me olvidaba: cuidado con los sensores de infrarrojos. "
              "Hacen falta gafas de infrarrojos.",
              "I forgot to tell you: watch out for the infrared sensors. You "
              "need infrared goggles."),
    0x31: _de(BB, "Donde se ve mucho de lejos hace falta camuflaje. Por "
              "ejemplo, meterse debajo de algo...",
              "Where you can be seen from far away you need camouflage. For "
              "example, hiding under something..."),
    0x32: _de(BB, "¡¡Revisa tu equipo!! / ¿No te habrá colocado el enemigo "
              "un transmisor o algo así?",
              "Check your equipment!! / Hasn't the enemy planted a "
              "transmitter or something on you?"),
    0x33: _de(SCH, "El traje antiexplosiones está en el sótano.",
              "The bomb blast suit is in the basement."),
    0x34: (SALVA[0] + " / Si es un Fox Hounder que se llama Grey Fox... / "
           "estará encerrado en la celda secreta.",
           SALVA[1] + " / If it's a Fox Hounder called Grey Fox... / he "
           "should be locked up in the secret cell."),
    0x35: _de(SCH, "¿La celda secreta? Lo siento, no lo sé...",
              "The secret cell? Sorry, I don't know..."),
    0x36: (SALVA[0] + " / La mejor forma de llegar a la celda secreta es "
           "dejarse atrapar por el enemigo a propósito...",
           SALVA[1] + " / The best way to get near the secret cell is to "
           "let the enemy catch you on purpose..."),
    0x39: _de(BB, "¿El subfusil? Ingram MAC 11 (en la ROM, INGRUM)... "
              + USO[0],
              "The submachine gun? Ingram MAC 11 (INGRUM in the ROM)... "
              + USO[1]),
    0x3A: _de(BB, "Infiltración conseguida. Busca la celda de Grey Fox. / "
              "¡¡Prueba a examinar las paredes!!",
              "Infiltration successful. Look for Grey Fox's cell. / Try "
              "examining the walls!!"),
    0x3B: ("Gracias por venir... novato. Soy Grey Fox. / El arma "
           "definitiva Metal Gear es un tanque bípedo con armas nucleares, "
           "capaz de moverse por cualquier terreno. / Cuando esté terminado "
           "podrá lanzar un ataque nuclear desde cualquier lugar del "
           "planeta. / Hay que destruirlo como sea antes de que lo terminen. "
           "Solo hay una forma de destruir Metal Gear. / Y la conoce su "
           "creador, el Dr. Pettrovich... / Debe de estar encerrado en algún "
           "lugar de este edificio. ¡Busca al Dr. Pettrovich!",
           "Thanks for coming... rookie. I'm Grey Fox. / The ultimate weapon "
           "Metal Gear is a nuclear-armed walking tank that can handle any "
           "terrain. / Once it's finished, a nuclear strike will be possible "
           "from anywhere on Earth. / It has to be destroyed before it's "
           "finished, whatever it takes. There is only one way to destroy "
           "Metal Gear. / And its designer, Dr. Pettrovich, knows it... / He "
           "must be held somewhere in this building. Find Dr. Pettrovich!"),
    0x3C: _de(BB, "¡Recupera las armas y el equipo que te han quitado y "
              "escapa! / Estarán escondidos en alguna habitación. "
              "¡Búscalos a puñetazos!",
              "Get back the weapons and equipment they took from you and "
              "escape! / They must be hidden in some room. Search with your "
              "fists!"),
    0x3D: ("¡¡Yo soy Shoot Gunner!! / ¡De aquí no ha escapado nadie!",
           "I am Shoot Gunner!! / No one has ever escaped from here!"),
    0x3E: ("¡¡Has recuperado las armas y el equipo!!",
           "Weapons and equipment recovered!!"),
    0x40: _de(SCH, "/ Golpea las paredes y vuela con explosivos donde "
              "suenen distinto.",
              "/ Tap the walls and blow up the places that sound different."),
    0x42: _de(BB, "¿Un chaleco antibalas? ¡Un hombre de verdad no lo usa!",
              "Body armour? A real man doesn't use it!"),
    0x44: _de(BB, "¿El traje antiexplosiones? Aguanta las explosiones y el "
              "viento.",
              "The bomb blast suit? It stands up to blasts and wind."),
    0x46: _de(BB, "¿Explosivo plástico? Es una bomba que se puede colocar en "
              "cualquier sitio.",
              "Plastic explosive? It's a bomb you can set anywhere."),
    0x48: _de(BB, "¿El uniforme enemigo? ¿Un traje de marinero?",
              "The enemy uniform? A sailor suit?"),
    0x4C: _de(BB, "¿Las gafas de infrarrojos? Con ellas se ven los sensores "
              "de infrarrojos.",
              "The infrared goggles? They let you see the infrared "
              "sensors."),
    0x4D: (SALVA[0] + " / Para llegar al patio no hay más remedio que bajar "
           "en paracaídas desde la azotea.",
           SALVA[1] + " / The only way to reach the courtyard is to "
           "parachute down from the roof."),
    0x4E: (SALVA[0] + " El Dr. Pettrovich está en la celda del patio.",
           SALVA[1] + " Dr. Pettrovich is in the cell in the courtyard."),
    0x4F: ("¡¡Yo soy Machinegun Kid!! ¡De aquí no pasas!",
           "I am Machinegun Kid!! You won't get past here!"),
    0x50: _de(DIANE, "/ Machinegun Kid tiene que ser débil al misil "
              "teledirigido.",
              "/ Machinegun Kid should be weak against the remote-control "
              "missile.", ADIOS),
    0x52: _de(BB, "¿El paracaídas? Póntelo antes de saltar.",
              "The parachute? Put it on before you jump."),
    0x53: _de(SCH, "El paracaídas está en la planta 2.",
              "The parachute is on floor 2."),
    0x54: (SALVA[0] + " Con el paracaídas puedes saltar por el hueco de la "
           "valla.",
           SALVA[1] + " With a parachute you can jump through the gap in "
           "the fence."),
    0x56: _de(BB, "¿El detector de minas? Te dice dónde están las minas.",
              "The mine detector? It shows you where the mines are."),
    0x57: _de(LIDER, "El detector de minas está en la azotea.",
              "The mine detector is on the roof."),
    0x58: _de(DIANE, "Al Hind D se le derriba con el lanzagranadas.",
              "You can bring down the Hind D with the grenade launcher.",
              ADIOS),
    0x59: ("Dr. Pettrovich... ¿He llegado tarde?...",
           "Dr. Pettrovich... Was I too late?..."),
    0x5A: (SALVA[0] + " / Al Dr. Pettrovich se lo han llevado al edificio 2 "
           "justo antes de que llegaras. / El edificio 2 está 10 km al norte "
           "de aquí.",
           SALVA[1] + " / Dr. Pettrovich was moved to building 2 just "
           "before you arrived. / Building 2 is 10 km north of here."),
    0x5B: ("¡Maldita sea! ¡¡El camión se ha puesto en marcha!!",
           "Damn! The truck is moving!!"),
    0x5C: _de(DIANE, "Al tanque se le derriba con minas.",
              "You can destroy the tank with land mines.", ADIOS),
    0x5D: _de(BB, "Es un puesto de control. ¡Ponte el uniforme enemigo e "
              "infíltrate! / Desde aquí el contacto será en la frecuencia "
              "12013.",
              "It's a checkpoint. Put on the enemy uniform and get in! / "
              "From here on we keep in touch on frequency 12013."),
    0x5E: _de(LIDER, "El uniforme enemigo está en el sótano del edificio 1. "
              "/ Desde aquí cambio el contacto a la frecuencia 12026.",
              "The enemy uniform is in the basement of building 1. / From "
              "here on I'm switching contact to frequency 12026."),
    0x5F: _de(DIANE, "Desde aquí cambio el contacto a la frecuencia 12091. "
              "Vuelve a llamarme.",
              "From here on I'm switching contact to frequency 12091. Call "
              "me again.", ADIOS),
    0x61: _de(BB, "¿La linterna? " + USO[0], "The flashlight? " + USO[1]),
    0x63: _de(BB, "Había interferencias, pero con esto ya está.",
              "There was jamming, but with this you're fine."),
    0x64: _de(SCH, "El ascensor norte solo sube.",
              "The north elevator only goes up."),
    0x65: (SALVA[0] + " El Dr. Pettrovich está en la mazmorra del sótano.",
           SALVA[1] + " Dr. Pettrovich is in the underground dungeon."),
    0x69: _de(SCH, "El ascensor sur solo baja.",
              "The south elevator only goes down."),
    0x6A: _de(SCH, "Más adelante hay una zona de gas.",
              "There's a gas zone up ahead."),
    0x6B: (SALVA[0] + " / Para salir de esta planta no hay más remedio que "
           "encontrar el ascensor norte.",
           SALVA[1] + " / The only way off this floor is to find the north "
           "elevator."),
    0x6C: ("¡¡Yo soy Fire Trooper!! ¡¡Te voy a asar vivo!!",
           "I am Fire Trooper!! I'll roast you alive!!"),
    0x6D: ("¡Has caído en la trampa! / El verdadero Dr. Pettrovich está en "
           "la planta 2... / ¡¡Muere, Fox Hounder!!",
           "You fell into the trap! / The real Dr. Pettrovich is on floor "
           "2... / Die, Fox Hounder!!"),
    0x6F: _de(SCH, "Más adelante está el ascensor norte.",
              "The north elevator is up ahead."),
    0x70: _de(SCH, "La linterna está en la planta 1.",
              "The flashlight is on floor 1."),
    0x71: _de(DIANE, "¿Qué tal? ¡Cuidado con los fosos!",
              "How are you? Watch out for the pitfalls!", ADIOS),
    0x72: (DIANE[0] + "¡Arnold, el que guarda la puerta, es inmortal! "
           "¡¡Huye!!",
           DIANE[1] + "Arnold, who guards the door, is immortal! Run!!"),
    0x73: (SALVA[0] + " Para cruzar el desierto hace falta una brújula.",
           SALVA[1] + " You need a compass to cross the desert."),
    0x74: (SALVA[0] + " / En la frecuencia 12048 podrás hablar con Jennifer, "
           "de la resistencia. / Jennifer te ayudará desde dentro. / Pero es "
           "muy orgullosa. / Seguramente no te responderá si no tienes el "
           "rango más alto.",
           SALVA[1] + " / On frequency 12048 you should be able to reach "
           "Jennifer, from the resistance. / Jennifer will support you from "
           "the inside. / But she is very proud. / She probably won't answer "
           "unless you have the highest rank."),
    0x75: _de(JEN, "Te preparo un lanzacohetes. Ven a por él.",
              "I'll have a rocket launcher ready for you. Come and get it."),
    0x76: _de(JEN, "Ahora te abro la puerta.",
              "I'm opening the door for you now."),
    0x7A: _de(SCH, "La brújula está en la planta 2.",
              "The compass is on floor 2."),
    0x7B: (SALVA[0] + " El fondo del canal conecta con el edificio 3.",
           SALVA[1] + " The far end of the waterway leads to building 3."),
    0x7C: ("Soy el Dr. Pettrovich. Tienen a mi hija Elen de rehén. / Si no "
           "la salvas, no puedo hablarte de Metal Gear. / Elen está "
           "encerrada en el sótano del edificio 1. Sálvala, por favor.",
           "I am Dr. Pettrovich. My daughter Elen is being held hostage. / "
           "Unless you rescue her, I cannot tell you about Metal Gear. / "
           "Elen is locked up in the basement of building 1. Please save "
           "her."),
    0x7D: ("Soy el Dr. Pettrovich. / Metal Gear está en el sótano 100 del "
           "edificio 3, a 20 km al norte de este edificio. / Solo hay una "
           "forma de destruir Metal Gear: colocar explosivo plástico en las "
           "patas, donde el blindaje es más fino. / El orden es R, R, L, R, "
           "L, L, R, L, L, R, R, L, R, L, R... ¡El resto lo he olvidado! / "
           "En cualquier caso, hay que colocar 16. / La tarjeta de la puerta "
           "para salir del edificio 2 la tiene Arnold. ¡Arnold es débil al "
           "lanzacohetes! / Te deseo suerte...",
           "I am Dr. Pettrovich. / Metal Gear is on basement level 100 of "
           "building 3, 20 km north of this building. / There is only one "
           "way to destroy Metal Gear: set plastic explosive on the legs, "
           "where the armour is thin. / The order is R, R, L, R, L, L, R, L, "
           "L, R, R, L, R, L, R... I've forgotten the rest! / Anyway, you "
           "have to set 16. / Arnold has the card for the door out of "
           "building 2. Arnold is weak against the rocket launcher! / I "
           "wish you luck..."),
    0x7E: _de(SCH, "Al edificio 1 llega un pasadizo subterráneo secreto "
              "desde el suroeste del sótano.",
              "A secret underground passage reaches building 1 from the "
              "southwest of the basement."),
    0x7F: ("¡Bien, pasa!", "All right, go in!"),
    0x80: ("¡Socorro!", "Help!"),
    0x81: ("Gracias... Soy Elen, la hija del Dr. Pettrovich. / A mi padre "
           "lo tienen amenazado y lo obligan a construir Metal Gear. Salva a "
           "mi padre, deprisa, por favor.",
           "Thank you... I am Elen, Dr. Pettrovich's daughter. / My father "
           "is being threatened and forced to build Metal Gear. Please save "
           "my father, quickly."),
    0x82: _de(DIANE, "Para el veneno de escorpión, usa el antídoto.",
              "For scorpion poison, use the antidote.", ADIOS),
    0x83: SALVA,
    0x84: _de(BB, "¡Entra por la puerta de la izquierda!",
              "Go through the door on the left!"),
    0x85: _de(BB, "¡Métete en el camión del extremo derecho!",
              "Get into the truck at the far right!"),
    0x86: _de(JEN, "¡¡Destruye la pared!!", "Destroy the wall!!"),
    0x87: ("¡Aquí Jennifer! ¡¡Detrás de la pared tiene que haber una "
           "bombona de oxígeno!!" + CORTO[0],
           "This is Jennifer! There should be an oxygen tank behind the "
           "wall!!" + CORTO[1]),
    0x88: _de(BB, "¡Solid Snake! ¡Se suspende la operación! Regresa de "
              "inmediato. / ¡¡Es una orden!! ¡¡Apaga el MSX!!",
              "Solid Snake! The operation is cancelled! Return at once. / "
              "That's an order!! Switch off the MSX!!"),
    0x89: ("¡Aquí Jennifer! / La tarjeta de la puerta de más adelante está "
           "en el lado este del edificio 3. Ese sitio conecta con el canal "
           "del edificio 2." + ADIOS[0],
           "This is Jennifer! / The card for the door ahead is on the east "
           "side of building 3. That place connects with the waterway of "
           "building 2." + ADIOS[1]),
    0x8A: (SCH[0] + "¡He descubierto quién es el jefe de Outer Heaven! / "
           "Nada menos que... el jefe de Outer Heaven es... / ...¡¡Aaah!!...",
           SCH[1] + "I've found out who the boss of Outer Heaven is! / "
           "Believe it or not... the boss of Outer Heaven is... / "
           "...Aaargh!!..."),
    0x8B: ("¡Yo soy Coward Duck! / ¡¡Dispara si te atreves!!",
           "I am Coward Duck! / Shoot if you dare!!"),
    0x8C: (SALVA[0] + " / Soy / el hermano de Jennifer. / ¡¡Para escapar, "
           "sube por la escalera del extremo izquierdo!!",
           SALVA[1] + " / I am / Jennifer's brother. / To escape, climb the "
           "ladder at the far left!!"),
    0x8D: ("¡Hola, aquí Diane! Para abatirlo sin matar a los nuestros solo "
           "te sirve la pistola." + ADIOS[0],
           "Hi, this is Diane! The only way to take him down without killing "
           "our people is the handgun." + ADIOS[1]),
    0x8E: (JEN[0] + "La tarjeta 8 la tiene Coward Duck. / ¡Entre los "
           "prisioneros está mi hermano! No lo mates... / ¡Si le pasa algo a "
           "mi hermano, no te ayudo más!",
           JEN[1] + "Coward Duck has card 8. / My brother is among the "
           "prisoners! Don't kill him... / If anything happens to my "
           "brother, I won't help you any more!"),
    0x90: (SALVA[0] + " / El jefe de Outer Heaven es... / ¡el comandante "
           "de Fox Hound, Big Boss! / ¡¡Todo es obra suya!! ¡¡No te dejes "
           "engañar!!",
           SALVA[1] + " / The boss of Outer Heaven is... / the commander of "
           "Fox Hound, Big Boss! / He is behind everything!! Don't be "
           "fooled!!"),
    0x91: ("¡¡Aquí Jennifer!! ¡Rompe la pared de la izquierda!" + CORTO[0],
           "This is Jennifer!! Break the wall on the left!" + CORTO[1]),
    0x92: ("¡Aquí Jennifer! ¡No queda otra que cruzar corriendo de un "
           "tirón! Si llevas raciones, no pasará nada." + CORTO[0],
           "This is Jennifer! All you can do is run straight through! "
           "You'll be fine if you have rations." + CORTO[1]),
    0x93: ("¡Solid Snake! Has llegado lejos... / ...Yo soy el comandante "
           "de Fox Hound y, además, / el jefe de esta fortaleza, Outer "
           "Heaven: ¡¡Big Boss!! / Si te di esta misión a ti, un novato, fue "
           "para que volvieras con información falsa... / Pero / has ido "
           "demasiado lejos. ¡Has ido demasiado lejos! / ¡Solid Snake! / No "
           "moriré sin más. ¡¡Te llevaré conmigo!! / ¡Ven a por mí!",
           "Solid Snake! You've come a long way... / ...I am the commander "
           "of Fox Hound and also / the boss of this fortress, Outer Heaven: "
           "Big Boss!! / I gave this mission to you, a rookie, so that you "
           "would bring back false information... / But / you went too far. "
           "You went too far! / Solid Snake! / I won't die for nothing. I'll "
           "take you with me!! / Come on!"),
    0x94: ("¡Aquí Jennifer! Si usas el tabaco, el temporizador aumenta. "
           "¡Vuelve vivo! Solid Snake...",
           "This is Jennifer! If you use the cigarettes, the timer goes up. "
           "Come back alive! Solid Snake..."),
    0x95: ("¡Aquí Diane! No sé cómo derrotar a Big Boss... ¡Eso depende de "
           "ti, Solid Snake! / ...Yo... tú... No, no es nada... Cuídate...",
           "This is Diane! I don't know how to beat Big Boss... That's up to "
           "you, Solid Snake! / ...I... about you... No, it's nothing... "
           "Stay safe..."),
    0x96: ("¡¡Emergencia!! / ¡¡Emergencia!! / ¡Se ha activado el detonador "
           "de Outer Heaven! / ¡Evacúen de inmediato!",
           "Emergency!! / Emergency!! / Outer Heaven's detonation switch has "
           "been activated! / Evacuate immediately!"),
    0x9A: _de(BB, "¿La máscara antigás? Úsala en la zona de gas.",
              "The gas mask? Use it in the gas zone."),
    0x9B: ("Aquí Solid Snake... Metal Gear destruido. Operación Intrude "
           "N313 completada. / Todo ha terminado... Todo... / Regreso ahora "
           "mismo." + CORTO[0],
           "This is Solid Snake... Metal Gear destroyed. Operation Intrude "
           "N313 complete. / It's all over... All of it... / Returning now."
           + CORTO[1]),
    0x9C: _de(DIANE, "Ellos tienen el silenciador.",
              "They have the silencer."),
    0x9D: ("Aquí Steve... ¿Diane? Diane salió de compras y todavía no ha "
           "vuelto...",
           "This is Steve... Diane? Diane went out shopping and hasn't come "
           "back yet..."),
    0x9E: ("Aquí Steve... ¿Diane? Diane está ahora en la ducha...",
           "This is Steve... Diane? Diane is in the shower right now..."),
    0x9F: ("Aquí Steve... ¿Diane? ¡¿Otra vez tú?! / ¡¡No te acerques más a "
           "Diane!!",
           "This is Steve... Diane? You again?! / Stay away from Diane!!"),
})

# La prosa de LOS-TEXTOS.md / THE-TEXTS.md (textos.py pagina la rellena).
PAGINA = {
    "es": dict(
        intro="""# Los textos

Metal Gear salió en Japón en 1987 (RC-750) y Konami hizo después la versión inglesa, que es la del listado. Aquí están todos los textos de las dos, sacados de las ROMs con `tools/textos.py`, uno al lado del otro y con una traducción del japonés para ver dónde se cambió o se recortó el guion. **La traducción es nuestra, no de Konami.**

| | Inglesa (la del listado) | Japonesa |
|---|---|---|
| CRC32 | {crc_en} | {crc_jp} |
| SHA-1 | `{sha_en}` | `{sha_jp}` |

## Cómo se guardan

- `p12:A37D` tiene 159 punteros, uno por texto, en la misma dirección en las dos ROMs. Los pide `ventana_de_texto` (`p00:5CE1`) con el número en A.
- Cada texto empieza por el tipo de ventana y sigue con las letras: 0xFE es línea nueva, 0xFD página nueva (aquí « / ») y 0xFF el final. Del 0xA1 en adelante es un trozo compartido: la tabla `p12:B8A7` en la inglesa y `p12:BBCA` en la japonesa.
- La letra c es la ficha c + 0x10 de la página 1. La fuente (`p09:B0B2`, 108 caracteres) es la misma en las dos: 0x30-0x39 las cifras, 0x41-0x5A las letras, 0x60-0x96 los katakana y 0x98 el dakuten. Solo cambian 7 bytes: 0x5C es el punto centrado (・) en la japonesa y el punto final en la inglesa, y 0x97 es el handakuten (゜) en la japonesa y el apóstrofo en la inglesa. Esas dos marcas avanzan medio carácter (`p00:5DE8`) para caer sobre la letra anterior.

## Lo que cambió de una versión a otra

### La inglesa vació 69 textos

69 de los 159 punteros de la inglesa van a un 0xFF suelto (`p12:B8A6`): esos textos están vacíos. Son los 32 avisos de «has conseguido...», las explicaciones de Big Boss sobre cada objeto, varias pistas de Schneider, una de Jennifer y las tres bromas de Steve sobre Diane. Otros cuatro (0x49, 0x4A, 0x66 y 0x68) están vacíos en las dos.

La inglesa no pide nunca ninguno de esos 69. Está medido así:

- En toda la ROM hay 28 saltos o llamadas a la ventana de texto (buscados en los bytes, condicionales incluidos: son los mismos que tiene el listado) y una sola escritura del número de texto, 0xCEF0 (`p00:5CE3`).
- 21 llevan el número escrito en el código (24 textos: el del final, `p15:BE8C`, recibe el 0x0F, el 0x9B, el 0x1F y el 0x2D) y 2 son los puentes desde otros bancos (`p00:405F` y `p00:4127`). Los tres de los personajes que hablan sacan el suyo de 0x81, 0x7C/0x7D, 0x83/0x8C y la tabla de 19 salas `p02:9D59`. La radio, de la tabla de llamadas de cada sala (`p15:B6C6`, 43 textos), que `p00:48BD` copia a 0xC880; ahí `llamada_callada` (`p01:6A88`) cambia el texto por el 0x88 o el 0x32 según dos banderas, y nada más escribe en esa zona.
- Al coger un objeto solo pasa el 0x3E (lo explica el apartado siguiente).

En total la inglesa pide 90 textos. Con los 69 vacíos salen los 159: no queda ningún texto con letras que nadie pida.

### El aviso al coger un objeto

Las dos buscan el texto del objeto en `p05:8AC5`, pero la inglesa añadió `cp 03eh` / `ret nz` (`p02:8F19`): solo abre la ventana con el 0x3E, «I TOOK BACK THE WEAPONS AND EQUIPMENTS.». La japonesa (`p02:8F5A`) la abre con todos. Sus 32 avisos acaban con el trozo 0xD9, «ヲ ニュウシュ シタ。» («has conseguido»), que pone 0xCF02 = 1 (`p00:52FD`). Con esa bandera la ventana no espera entre letras (`p00:5DDA`), escribe el aviso de golpe (`p00:5E3B`) y lo corta en cuanto hay una dirección pulsada (`p00:5DCC`).

### El bloqueo de región

La japonesa llama a `p00:5322` al arrancar (`p00:4226`) y desde `p01:66FA`. Esa rutina mira dos bytes de la BIOS: si 0x002B tiene algún bit puesto que no sea el 3, o 0x002C alguno que no sea el 4 o el 5, salta a 0 y el MSX vuelve a arrancar. Esos bytes dicen el juego de caracteres, el formato de la fecha, la frecuencia de la interrupción y el teclado: un MSX de 50 Hz o con teclado que no sea japonés no pasa. En el mismo sitio la inglesa llama a `nada` (`p00:5317`), un `ret` suelto: es lo que queda del bloqueo.

### Los nombres de armas y objetos

Las armas están en `p06:B865` en las dos, y los objetos en `p06:B8F6` (inglesa) y `p06:B8FD` (japonesa). La japonesa escribe los nombres enteros en katakana; la inglesa corta los objetos a cinco o seis letras (GOGGL, CIGAL, RATIO...) y llama L-MAIN a lo que la japonesa llama ジライ, «minas». La lista completa está más abajo.

### Lo demás

- Los créditos (texto 0x2D) son la misma lista en las dos, pero la inglesa escribe TOMONORI OSTUKA donde la japonesa pone OTSUKA.
- Los rótulos de los menús, del título, del transceptor y de la cinta están en inglés también en la japonesa, y son iguales byte a byte (lista al final).
- No se ha desensamblado la japonesa: no está medido qué textos pide ella.""",
        h_textos="""## Los 159 textos

Uno por fila, con su número. « / » es una página nueva de la ventana; *(vacío)* quiere decir que la inglesa apunta ese texto a `p12:B8A6`.""",
        cols=("Nº", "Japonés (ROM)", "Inglés (ROM)", "Traducción del japonés"),
        vacio="*(vacío)*", vacio_dos="*(vacío en las dos)*",
        h_nombres="""## Las armas y los objetos del menú""",
        cols_nombres=("", "Japonés (ROM)", "Inglés (ROM)", "Traducción"),
        arma="arma", objeto="objeto",
        h_rotulos="""## Los rótulos, iguales en las dos""",
        fin="""## Cómo sacarlos otra vez

Con las dos ROMs en la raíz del repositorio (`metalgear.rom` y `metalgear-jp.rom`, con los SHA-1 de arriba), `python3 tools/textos.py pagina` escribe esta página y su pareja en inglés; `python3 tools/textos.py tabla` saca la tabla de trabajo con el tipo de ventana de cada texto.""",
    ),
    "en": dict(
        intro="""# The texts

Metal Gear came out in Japan in 1987 (RC-750) and Konami later made the English version, which is the one in the listing. Here are all the texts of both, taken from the ROMs with `tools/textos.py`, side by side and with a translation of the Japanese so you can see where the script was changed or cut down. **The translation is ours, not Konami's.**

| | English (the listing's) | Japanese |
|---|---|---|
| CRC32 | {crc_en} | {crc_jp} |
| SHA-1 | `{sha_en}` | `{sha_jp}` |

## How they are stored

- `p12:A37D` holds 159 pointers, one per text, at the same address in both ROMs. `ventana_de_texto` (`p00:5CE1`) asks for them with the number in A.
- Each text starts with the window type and goes on with the letters: 0xFE is a new line, 0xFD a new page (« / » here) and 0xFF the end. From 0xA1 up it is a shared piece: the table at `p12:B8A7` in the English version and `p12:BBCA` in the Japanese one.
- Letter c is tile c + 0x10 of page 1. The font (`p09:B0B2`, 108 characters) is the same in both: 0x30-0x39 the digits, 0x41-0x5A the letters, 0x60-0x96 the katakana and 0x98 the dakuten. Only 7 bytes change: 0x5C is the middle dot (・) in the Japanese version and the full stop in the English one, and 0x97 is the handakuten (゜) in the Japanese version and the apostrophe in the English one. Those two marks advance half a character (`p00:5DE8`) so they land on the letter before.

## What changed from one version to the other

### The English version emptied 69 texts

69 of the 159 English pointers go to a lone 0xFF (`p12:B8A6`): those texts are empty. They are the 32 "you got..." messages, Big Boss's explanation of each item, several of Schneider's hints, one of Jennifer's and Steve's three jokes about Diane. Four more (0x49, 0x4A, 0x66 and 0x68) are empty in both.

The English version never asks for any of those 69. This is how it was measured:

- In the whole ROM there are 28 jumps or calls to the text window (searched for in the bytes, conditional ones included: they are the same as in the listing) and a single write of the text number, 0xCEF0 (`p00:5CE3`).
- 21 have the number written in the code (24 texts: the one in the ending, `p15:BE8C`, gets 0x0F, 0x9B, 0x1F and 0x2D) and 2 are the bridges from other banks (`p00:405F` and `p00:4127`). The three for the characters who talk take theirs from 0x81, 0x7C/0x7D, 0x83/0x8C and the 19-room table at `p02:9D59`. The radio takes them from the table of calls per room (`p15:B6C6`, 43 texts), which `p00:48BD` copies to 0xC880; there `llamada_callada` (`p01:6A88`) changes the text to 0x88 or 0x32 depending on two flags, and nothing else writes to that area.
- When an item is picked up only 0x3E gets through (see the next section).

All in all the English version asks for 90 texts. Together with the 69 empty ones that makes 159: no text with letters is left that nobody asks for.

### The message when you pick something up

Both look the item's text up at `p05:8AC5`, but the English version added `cp 03eh` / `ret nz` (`p02:8F19`): it only opens the window for 0x3E, "I TOOK BACK THE WEAPONS AND EQUIPMENTS.". The Japanese version (`p02:8F5A`) opens it for all of them. Its 32 messages end with piece 0xD9, "ヲ ニュウシュ シタ。" ("you got"), which sets 0xCF02 = 1 (`p00:52FD`). With that flag the window does not wait between letters (`p00:5DDA`), writes the message all at once (`p00:5E3B`) and cuts it as soon as a direction is held (`p00:5DCC`).

### The region lock

The Japanese version calls `p00:5322` at start-up (`p00:4226`) and from `p01:66FA`. That routine looks at two BIOS bytes: if 0x002B has any bit set other than bit 3, or 0x002C any other than bits 4 and 5, it jumps to 0 and the MSX starts again. Those bytes give the character set, the date format, the interrupt frequency and the keyboard: a 50 Hz MSX, or one whose keyboard is not Japanese, does not get through. At the same spot the English version calls `nada` (`p00:5317`), a lone `ret`: that is what is left of the lock.

### The names of weapons and items

The weapons are at `p06:B865` in both, and the items at `p06:B8F6` (English) and `p06:B8FD` (Japanese). The Japanese version writes the full names in katakana; the English one cuts the items down to five or six letters (GOGGL, CIGAL, RATIO...) and calls L-MAIN what the Japanese calls ジライ, "land mines". The full list is further down.

### The rest

- The credits (text 0x2D) are the same list in both, but the English version writes TOMONORI OSTUKA where the Japanese has OTSUKA.
- The labels of the menus, the title, the transceiver and the tape are in English in the Japanese version too, and are byte for byte the same (list at the end).
- The Japanese version has not been disassembled: which texts it asks for has not been measured.""",
        h_textos="""## The 159 texts

One per row, with its number. « / » is a new page of the window; *(empty)* means the English version points that text at `p12:B8A6`.""",
        cols=("No.", "Japanese (ROM)", "English (ROM)", "Translation of the Japanese"),
        vacio="*(empty)*", vacio_dos="*(empty in both)*",
        h_nombres="""## The weapons and items of the menu""",
        cols_nombres=("", "Japanese (ROM)", "English (ROM)", "Translation"),
        arma="weapon", objeto="item",
        h_rotulos="""## The labels, the same in both""",
        fin="""## How to extract them again

With both ROMs in the root of the repository (`metalgear.rom` and `metalgear-jp.rom`, with the SHA-1 above), `python3 tools/textos.py pagina` writes this page and its Spanish twin; `python3 tools/textos.py tabla` prints the working table with the window type of each text.""",
    ),
}

# Los nombres del menu (p06:B865 armas, p06:B8F6/B8FD objetos).
ARMAS = [("pistola", "handgun"), ("subfusil", "submachine gun"),
         ("granada", "grenade"), ("lanzacohetes", "rocket launcher"),
         ("bomba P", "P bomb"), ("minas", "land mines"),
         ("misil teledirigido", "remote-control missile"),
         ("silenciador", "silencer")]
OBJETOS = [("chaleco", "armour"), ("traje", "suit"), ("linterna", "light"),
           ("gafas", "goggles"), ("máscara antigás", "gas mask"),
           ("tabaco", "cigarettes"), ("detector", "detector"),
           ("antena", "antenna"), ("zoom", "zoom"),
           ("bombona", "oxygen tank"), ("brújula", "compass"),
           ("paracaídas", "parachute"), ("antídoto", "antidote")] + \
          [("tarjeta %d" % i, "card %d" % i) for i in range(1, 9)] + \
          [("ración", "ration"), ("transmisor", "transmitter"),
           ("uniforme", "uniform"), ("caja de cartón", "cardboard box")]
