# Los textos

Metal Gear salió en Japón en 1987 (RC-750) y Konami hizo después la versión inglesa, que es la del listado. Aquí están todos los textos de las dos, sacados de las ROMs con `tools/textos.py`, uno al lado del otro y con una traducción del japonés para ver dónde se cambió o se recortó el guion. **La traducción es nuestra, no de Konami.**

| | Inglesa (la del listado) | Japonesa |
|---|---|---|
| CRC32 | E85C5731 | FAFE1303 |
| SHA-1 | `b656bd19df58fc1ba4628342b87beeec5948e0b3` | `a52021f1b257c7c35d626d5d642134091c45e4f4` |

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
- No se ha desensamblado la japonesa: no está medido qué textos pide ella.

## Los 159 textos

Uno por fila, con su número. « / » es una página nueva de la ventana; *(vacío)* quiere decir que la inglesa apunta ese texto a `p12:B8A6`.

| Nº | Japonés (ROM) | Inglés (ROM) | Traducción del japonés |
|---|---|---|---|

| 0x01 | コウタイダ!! | RELIEVE | ¡¡Cambio de guardia!! |

| 0x02 | コチラ BIG BOSS ・・・ OPERATION INTRUDE N313。 テキ ヨウサイ OUTER HEAVEN ニ センニュウ 、サイシュウヘイキ METAL GEAR ヲ ハカイ セヨ! / マズハ ショウソク ヲ タッタ、 GREY FOX ト コンタクト 、 サイシュウヘイキ 、METAL GEAR ノ ショウタイ ヲ サグレ。 / イゴ ノ レンラク ハ シュウハスウ 12085 デ オコナウ。 ・・・ OVER | THIS IS BIG BOSS... OPERATION INTRUDE N313. / PENETRATE THE ENEMY'S OUTER HEAVEN AND DESTOROY THE ULTIMATE WEAPON METAL GEAR! / FIRST, CONTACT MISSING GREY FOX AND SEARCH FOR METAL GEAR! / CONTACT IN THE BAND OF 12085 FROM NOW ON. ...OVER | Aquí Big Boss... Operación Intrude N313. Infíltrate en la fortaleza enemiga Outer Heaven y destruye el arma definitiva Metal Gear. / Lo primero: contacta con Grey Fox, que ha desaparecido, y averigua qué es de verdad el arma definitiva Metal Gear. / A partir de ahora el contacto será en la frecuencia 12085. ...Corto. |

| 0x03 | コチラ BIG BOSS ・・・ ニンム ハ センニュウ ダ。 クレグレモ テキニ ミツカラヌ ヨウ ニ コウドウ シロ。 ・・・ OVER | THIS IS BIG BOSS... MISION! GAIN ACCESS TO THE ENEMY'S FORTRESS, OUTER HEAVEN. / TAKE ACTION NOT TO BE DISCOVERED BY THE ENEMY. ...OVER | Aquí Big Boss... Tu misión es infiltrarte. Ante todo, actúa sin que el enemigo te descubra. ...Corto. |

| 0x04 | コチラ BIG BOSS ・・・ ブキ、ソウビ ハ テキ ノ トラック 、 ブキコ カラ ウバエ! ダンヤク ハ ミハリ カラ、ウバエ!! / トビラ ヲ アケル ニハ カード ガ ヒツヨウダ。 カード ヲ サガセ。 ・・・ OVER | THIS IS BIG BOSS... TAKE THE WEAPONS AND EQUIPMENTS FROM THE ENEMY'S LORRY!! / YOU SHOULD HAVE AN I.D.CARD TO OPEN THE DOOR. ...OVER | Aquí Big Boss... Las armas y el equipo, quítaselos al enemigo: de los camiones y del arsenal. ¡¡La munición, quítasela a los centinelas!! / Para abrir las puertas hace falta una tarjeta. Busca las tarjetas. ...Corto. |

| 0x05 | コチラ BIG BOSS ・・・ エレベーター ニ ノルト フロア カン ノ イドウ ガ デキル。エレベーター ノ イチ ヲ オボエル コトダ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... Con los ascensores se pasa de una planta a otra. Memoriza dónde están. ...Corto. |

| 0x06 | ウゴクナ!! | DON'T MOVE! | ¡¡No te muevas!! |

| 0x07 | レンコウスル! | YOU ARE CAPTURED! | ¡Quedas detenido! |

| 0x08 | レーション ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la ración. |

| 0x09 | コチラ BIG BOSS ・・・ レーション ? ヒジョウ ヨウ ショクリョウ ダ。 スグ ニ タベズ ニ ノコシテ オケ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿La ración? Es comida de emergencia. No te la comas enseguida: guárdala. ...Corto. |

| 0x0A | コチラ SOLID SNAKE ・・・ オウトウ ネガイ マス。 | THIS IS SOLID SNAKE... YOUR REPLY,PLEASE. | Aquí Solid Snake... Respondan, por favor. |

| 0x0B | カード 1 ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 1. |

| 0x0C | コチラ BIG BOSS ・・・ カード ? トビラ ヲ アケル カード ダ。 / トビラ ニ ヨッテ、 カード ナンバー ガ チガウ。 チュウイ シロ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿Una tarjeta? Es una tarjeta para abrir puertas. / Cada puerta lleva un número de tarjeta distinto. Ten cuidado. ...Corto. |

| 0x0D | ソウガンキョウ ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido los prismáticos. |

| 0x0E | コチラ BIG BOSS ・・・ ソウガンキョウ ? / シュウイ ヲ ミルトキ ニ ツカエ 。 トオク ノ チケイ ヤ テキ ノ ハイチ ガワカル。ツネニ ソウガンキョウ ヲ ツカウヨウ ニ ココロ ガケロ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿Los prismáticos? / Úsalos para mirar alrededor: se ve el terreno de lejos y dónde están los enemigos. Acostúmbrate a usarlos siempre. ...Corto. |

| 0x0F | ・・・ キコエルカ? SOLID SNAKE ・・・ ワタシ ハ シナン・・・ イツカ、ケッチャク ヲ ツケヨウ。 / イツノヒカ・・・ マタ アオウ! | LISTEN! SOLID SNAKE... I'LL NEVER DIE... / I'LL GET YOU. ONE DAY. / SEE YOU AGAIN... | ...¿Me oyes? Solid Snake... Yo no moriré... Algún día zanjaremos esto. / Algún día... ¡nos volveremos a ver! |

| 0x10 | ハンドガン ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la pistola. |

| 0x11 | コチラ BIG BOSS ・・・ ハンドガン ? BELLETA M92F・・・ / ツカイカタ ハ ワカッテイルナ 。 ダンヤク ヲ サガセ 。 タマ ハ ムダヅカイ スルナ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿La pistola? Beretta M92F (en la ROM, BELLETA)... / Ya sabes cómo se usa. Busca munición. No malgastes las balas. ...Corto. |

| 0x12 | ジライ ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido minas. |

| 0x13 | コチラ BIG BOSS ・・・ ジライ ? ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿Minas? Ya sabes cómo se usa. ...Corto. |

| 0x14 | コチラ BIG BOSS ・・・ レジスタンス ガ イルハズ ダ。 ムセン デ コンタクト シテミロ。 ・・・ OVER | THIS IS BIG BOSS... THERE MUST BE SOME RESISTANCE. / TRY TO CONTACT WITH THE TRANSCEIVER! ...OVER | Aquí Big Boss... Tiene que haber una resistencia. Prueba a contactar por radio. ...Corto. |

| 0x15 | ダンヤク ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido munición. |

| 0x16 | コチラ BIG BOSS ・・・ ダンヤク ハ モテル カズ ニ セイゲン ガ アル。 チュウイ シロ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... La munición que puedes llevar tiene un límite. Ten cuidado. ...Corto. |

| 0x17 | コチラ レジスタンス リーダー SCHNEIDER ・・・ / ヨウサイ ノ ナイブ ニ ツイテ ガイド スル。 シュウハスウ 12079 デ レンラク サレタシ。 ・・・ OVER | THIS IS THE RESISTANCE LEADER,MR.SCHNEIDER... / I WILL BRIEF YOU ON THE FORTRESS DETAILS. PLEASE CONTACT ON WAVEBAND 12079. ...OVER | Aquí el líder de la resistencia, Schneider... / Te guiaré por el interior de la fortaleza. Contacta en la frecuencia 12079. ...Corto. |

| 0x18 | コチラ BIG BOSS ・・・ カンシカメラ ニ チュウイ シロ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... Cuidado con las cámaras de vigilancia. ...Corto. |

| 0x19 | コチラ BIG BOSS ・・・ イイワスレテイタガ 、 ガスチタイ デハ ガスマスク ガ ヒツヨウダ。 / ガスマスク ノ アリカ ハ レジスタンス リーダー SCHNEIDER ガ シッテイル ハズダ。 ・・・ OVER | THIS IS BIG BOSS... PUT ON A GAS MASK IN THE GAS ROOM. ...OVER | Aquí Big Boss... Se me olvidaba: en la zona de gas hace falta máscara antigás. / Dónde está la máscara lo sabrá el líder de la resistencia, Schneider. ...Corto. |

| 0x1A | コチラ レジスタンス リーダー SCHNEIDER ・・・ ガスマスク ハ 1F ノ ミナミ ニ アル。 ・・・ OVER | THIS IS THE RESISTANCE LEADER,MR.SCHNEIDER... / GO TO THE SOUTH PART OF THE 1ST FLOOR TO GET YOUR MASK. ...OVER | Aquí el líder de la resistencia, Schneider... La máscara antigás está en el sur de la planta 1. ...Corto. |

| 0x1B | タスカッタ! / シュウハスウ 12033 デ レジスタンス ノ DIANE ガ サポート シテクレル。 / DIANE ハ テキ ノ ジョウホウニ クワシイハズ ダ。 | RESCUED! / RESISTANCE,DIANE WILL SUPPORT YOU ON WAVEBAND 12033. | ¡Me has salvado! / En la frecuencia 12033 te ayudará Diane, de la resistencia. / Diane conoce bien al enemigo. |

| 0x1C | タスカッタ! | RESCUED | ¡Me has salvado! |

| 0x1D | リモコン・ミサイル ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el misil teledirigido. |

| 0x1E | コチラ BIG BOSS ・・・ リモコン・ミサイル ? / リモコン ソウサ デキル ミサイル ダ。 ショウガイブツ ノ オオイ トコロ デ ツカエ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El misil teledirigido? / Es un misil que se maneja a distancia. Úsalo donde haya muchos obstáculos. ...Corto. |

| 0x1F | コチラ ラジオ KNK。 リンジニュース ヲ モウシアゲマス。 / ホンジツ ミメイ、SOUTH AFRICA GALZBURG フキン デ ダイキボ ナ ジシン ガ アッタモヨウ・・・ | THIS IS RADIO KNK. EMERGENCY NEWS FLASH! / THERE WAS APPARENTLY A TREMENDOUS EARTH TREMOR IN THE REGION OF GALZBURG,SOUTH AFRICA AT MIDNIGHT. | Aquí Radio KNK. Interrumpimos para dar una noticia de última hora. / Esta madrugada parece que ha habido un gran terremoto cerca de Galzburg, Sudáfrica... |

| 0x20 | タスカッタ! / スウジツ マエ ニ センニュウ シテキタ FOX HOUNDER ナラ、ブジダ。 / ヤツラ ニ トラエラレ テ イル。 | RESCUED! / FOX HOUNDER INTRUDED A FEW DAYS AGO / AND IS SAFE NOW. / HE WAS CAPTURED BY THE ENEMY. | ¡Me has salvado! / El Fox Hounder que se infiltró hace unos días está vivo. / Lo tienen prisionero. |

| 0x21 | アー!ネムイ!! | I'M SLEEPY. | ¡Aah! ¡¡Qué sueño!! |

| 0x22 | ネテシマッタ! | OVERSLEPT! | ¡Me he quedado dormido! |

| 0x23 | FOX HOUNDER ガ センニュウ シテイル ラシイ。 ゼッタイ ニ トオスナ! | PROBABLY, FOX HOUNDER GAINED ACCESS. / DON'T MAKE WAY FOR HIM, AT ANY COST. | Parece que se ha infiltrado un Fox Hounder. ¡Que no pase de ninguna manera! |

| 0x24 | コチラ BIG BOSS ・・・ FUNCTION KEY ノ セツメイ ヲ スル。 F1 KEY ヲ オス ト、ポーズ。 / F2 KEY ヲ オス ト、ブキ セレクト。 F3 KEY ヲ オス ト、ソウビ セレクト。 F4 KEY ヲ オス ト、ムセン モード。 / ヨク、アタマ ニ イレテ オクコト ダ。 ・・・ OVER | THIS IS BIG BOSS... WILL EXPLAIN HOW TO USE F-KEY. / F-1 KEY FOR PAUSE. F-2 KEY FOR SELECTING YOUR WEAPONS. F-3 KEY FOR SELECTING YOUR EQUIPMENTS. / F-4 KEY FOR TRANSCEIVER BAND. REMEMBER THESE WELL. ...OVER | Aquí Big Boss... Te explico las teclas de función. Con F1, pausa. / Con F2, eliges arma. Con F3, eliges equipo. Con F4, modo radio. / Grábatelo bien. ...Corto. |

| 0x25 | カード 2 ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 2. |

| 0x26 | コチラ BIG BOSS ・・・ イイワスレテイタガ 、コウアツデンリュウ ハ デンゲン パネル ヲ ハカイ セヨ。 / リモコン・ミサイル ヲ ツカウノダ。 リモコン・ミサイル ノ アリカ ハ レジスタンス リーダー SCHNEIDER ガ シッテイル。 ・・・ OVER | THIS IS BIG BOSS... / BREAK DOWN THE POWER SUPPLY BOX WITH THE REMOTE-CONTROL MISSILE TO GET RID OF THE HIGH-VOLTAGE. / ...OVER | Aquí Big Boss... Se me olvidaba: contra la alta tensión, destruye el panel de la corriente. / Usa el misil teledirigido. Dónde está el misil lo sabe el líder de la resistencia, Schneider. ...Corto. |

| 0x27 | コチラ レジスタンス リーダー SCHNEIDER ・・・ リモコン・ミサイル ハ セイナン ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE REMOTE-CONTROL MISSILE IS AVAILABLE IN THE SOUTHEASTERN AREA. ...OVER | Aquí el líder de la resistencia, Schneider... El misil teledirigido está en el suroeste. ...Corto. |

| 0x28 | ダンボール ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la caja de cartón. |

| 0x29 | コチラ BIG BOSS ・・・ ダンボール ? ヒッコシ デモ スルノカ? ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿Una caja de cartón? ¿Es que te vas de mudanza? ...Corto. |

| 0x2A | コチラ BIG BOSS ・・・ イイワスレテイタガ 、オクジョウ ハ ウインド・バリア ガ、ハラレテイル。 ボム・ブラスト・スーツ ヲ サガセ! ・・・ OVER | THIS IS BIG BOSS... WIND BARRIER IS EXTENDED ON THE ROOFTOP. / LOOK FOR THE BOMB BLAST SUIT TO BE INTO THE BARRIER. ...OVER | Aquí Big Boss... Se me olvidaba: en la azotea hay una barrera de viento. ¡Busca el traje antiexplosiones! ...Corto. |

| 0x2B | サイレンサー ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el silenciador. |

| 0x2C | コチラ BIG BOSS ・・・ サイレンサー ? コレ ヲ ツケルト、ジュウセイ ガ ケセル。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El silenciador? Con esto puesto no se oyen los disparos. ...Corto. |

| 0x2D | カワリマシテ METAL GEAR STAFF ショウカイ・・・ / MAIN PROGRAM HIROYUKI FUKUI / SUB PROGRAM TOMONORI OTSUKA KOJI TOYOHARA / GRAPHIC DESIGN MASAMI TABATA AZUSA FUJIMOTO / MAIN SOUND EFFECT IKU MIZUTANI / SUB SOUND EFFECT SHIGEHIRO TAKENOUCHI MOTOAKI FURUKAWA / GAME DESIGN HIDEO KOJIMA / PRESENTED BY KONAMI 1987 | NEXT, WE INTRODUCE METAL GEAR STAFF... / MAIN PROGRAM HIROYUKI FUKUI / SUB PROGRAM TOMONORI OSTUKA KOJI TOYOHARA / GRAPHIC DESIGN MASAMI TABATA AZUSA FUJIMOTO / MAIN SOUND EFFECT IKU MIZUTANI / SUB SOUND EFFECT SHIGEHIRO TAKENOUCHI MOTOAKI FURUKAWA / GAME DESIGN HIDEO KOJIMA / PRESENTED BY KONAMI 1987 | Y ahora os presentamos al equipo de Metal Gear... / (los créditos, en letras latinas en las dos versiones) |

| 0x2E | グレネード・ランチャー ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el lanzagranadas. |

| 0x2F | コチラ BIG BOSS ・・・ グレネード・ランチャー M79? ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El lanzagranadas M79? Ya sabes cómo se usa. ...Corto. |

| 0x30 | コチラ BIG BOSS ・・・ イイワスレテイタガ セキガイセン センサー ニハ チュウイ シロ 。 セキガイセン ゴーグル ガ ヒツヨウダ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... Se me olvidaba: cuidado con los sensores de infrarrojos. Hacen falta gafas de infrarrojos. ...Corto. |

| 0x31 | コチラ BIG BOSS ・・・ ミトオシ ノ ヨイ トコロ ハ、 カモフラージュ ガ ヒツヨウダ。 タトエバ、ナニカ ヲ カブル トカ・・・ ・・・ OVER | *(vacío)* | Aquí Big Boss... Donde se ve mucho de lejos hace falta camuflaje. Por ejemplo, meterse debajo de algo... ...Corto. |

| 0x32 | コチラ BIG BOSS ・・・ ソウビ ヲ テンケン シテミロ!! / テキ ニ ハッシンキ カ ナニカ、 トリツケラレテ ハ イナイカ? ・・・ OVER | THIS IS BIG BOSS... CHECK YOUR EQUIPMENTS! CHECK IF YOU HAVE BEEN BUGGED BY THE ENEMY. ...OVER | Aquí Big Boss... ¡¡Revisa tu equipo!! / ¿No te habrá colocado el enemigo un transmisor o algo así? ...Corto. |

| 0x33 | コチラ SCHNEIDER ・・・ ボム・ブラスト・スーツ ハ チカ ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE BOMB BLAST SUIT CAN BE FOUND IN THE BASEMENT. ...OVER | Aquí Schneider... El traje antiexplosiones está en el sótano. ...Corto. |

| 0x34 | タスカッタ! / GREY FOX トカイウ FOX HOUNDER ナラ・・・ / ヒミツ ノ ドクボウ ニ カンキン サレテ イルハズダ。 | RESCUED! / FOX HOUNDER CALLED GREY FOX MUST BE / CONFINED IN THE SECRET CELL. | ¡Me has salvado! / Si es un Fox Hounder que se llama Grey Fox... / estará encerrado en la celda secreta. |

| 0x35 | コチラ SCHNEIDER ・・・ ヒミツ ノ ドクボウ ? ザンネン ナガラ、シラナイ・・・ ・・・ OVER | *(vacío)* | Aquí Schneider... ¿La celda secreta? Lo siento, no lo sé... ...Corto. |

| 0x36 | タスカッタ! / ヒミツ ノ ドクボウ ニ チカヅク イチバン ノ ホウホウ ハ テキ ニ ワザト ツカマル コトダ・・・ | RESCUED! / THE BEST WAY OF GAINING ACCESS TO THE SECRET CELL, / IS TO ALLOW THE ENEMY TO CAPTURE YOU. | ¡Me has salvado! / La mejor forma de llegar a la celda secreta es dejarse atrapar por el enemigo a propósito... |

| 0x37 | カード 4 ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 4. |

| 0x38 | サブマシンガン ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el subfusil. |

| 0x39 | コチラ BIG BOSS ・・・ サブマシンガン ? INGRUM MAC 11・・・ ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El subfusil? Ingram MAC 11 (en la ROM, INGRUM)... Ya sabes cómo se usa. ...Corto. |

| 0x3A | コチラ BIG BOSS ・・・ センニュウ セイコウ ダ。 GREY FOX ノ ドクボウ ヲ サガセ 。 / カベ ヲ シラベテ ミロ!! ・・・ OVER | THIS IS BIG BOSS... MOVE OUT,AND LOCATE GREY FOX'S SOLITARY CELL. / CHECK THE WALL! ...OVER | Aquí Big Boss... Infiltración conseguida. Busca la celda de Grey Fox. / ¡¡Prueba a examinar las paredes!! ...Corto. |

| 0x3B | ヨクキテクレタ・・・ シンイリ。 GREY FOX ダ。 / サイシュウヘイキ METAL GEAR トハ アラユル チケイ ニ タイオウ デキル カク トウサイ、 ジュウホコウ センシャ ダ。 / コレ ガ カンセイ スルト、 チキュウジョウ ノ アラユル トコロ カラ ノ カクコウゲキ ガ カノウ ト ナル。 / ナント シテモ カンセイマエ ニ ハカイ シナケレバ ナラナイ。 METAL GEAR ハカイ ノ ホウホウ ハ タダヒトツ。 / ソレ ハ カイハツシャ DR・PETTROVICH ガ シッテイル・・・ / コノ ビル ノ ドコカ ニ カンキン サレテイル ハズダ。 DR・PETTROVICH ヲ サガセ! | I'M GREY FOX. / THE ULTIMATE WEAPON METAL GEAR HAS / NUCLEAR WEAPONS DESIGNED FOR EVERY PART OF EARTH. / IF IT IS COMPLETED, NUCLEAR ATTACK / FROM ANYWHWRE / WILL BE POSSIBLE. / METAL GEAR MUST BE DESTOROYED, / BEFORE IT IS COMPLETED. / THERE IS ONLY ONE WAY TO DESTOROY METAL GEAR. / DR.PETTROVICH,WHO DEVELOPED IT KNOW THE ONLY METHOD. | Gracias por venir... novato. Soy Grey Fox. / El arma definitiva Metal Gear es un tanque bípedo con armas nucleares, capaz de moverse por cualquier terreno. / Cuando esté terminado podrá lanzar un ataque nuclear desde cualquier lugar del planeta. / Hay que destruirlo como sea antes de que lo terminen. Solo hay una forma de destruir Metal Gear. / Y la conoce su creador, el Dr. Pettrovich... / Debe de estar encerrado en algún lugar de este edificio. ¡Busca al Dr. Pettrovich! |

| 0x3C | コチラ BIG BOSS ・・・ ウバワレタ、ブキ、ソウビ ヲ トリカエシ、ダッシュツ セヨ! / ドコカ ノ ヘヤ ニ カクサレテ イルハズダ。 パンチ デ サガセ! ・・・ OVER | THIS IS BIG BOSS... TAKE BACK YOUR WEAPONS AND EQUIPMENTS, AND GET OUT OF HERE! / THEY MUST BE CONCEALED IN A ROOM. BREAK THE DOOR! ...OVER | Aquí Big Boss... ¡Recupera las armas y el equipo que te han quitado y escapa! / Estarán escondidos en alguna habitación. ¡Búscalos a puñetazos! ...Corto. |

| 0x3D | オレ ハ SHOOT GUNNER ダ!! / ココカラ ダッソウ デキタモノ ハ イナイ! | I'M SHOOT GUNNER! / NOBODY HAS / EVER BEEN ABLE TO ESCAPE FROM HERE. | ¡¡Yo soy Shoot Gunner!! / ¡De aquí no ha escapado nadie! |

| 0x3E | ブキ、ソウビ ヲ トリカエシタ!! | I TOOK BACK THE WEAPONS AND EQUIPMENTS. | ¡¡Has recuperado las armas y el equipo!! |

| 0x3F | カード 3 ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 3. |

| 0x40 | コチラ SCHNEIDER ・・・ / カベ ヲ タタイテ、 オト ガ チガウ トコロ ヲ バクハ スルト イイ。 ・・・ OVER | THIS IS MR.SCHNEIDER... / YOU SHOULD KNOCK THE WALL AND BLAST IT WHICH SOUNDS IRREGULARLY. ...OVER | Aquí Schneider... / Golpea las paredes y vuela con explosivos donde suenen distinto. ...Corto. |

| 0x41 | ボデイー・アーマー ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el chaleco antibalas. |

| 0x42 | コチラ BIG BOSS ・・・ ボデイー・アーマー ? オトコ ナラ ツカウナ! ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿Un chaleco antibalas? ¡Un hombre de verdad no lo usa! ...Corto. |

| 0x43 | ボム・ブラスト・スーツ ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el traje antiexplosiones. |

| 0x44 | コチラ BIG BOSS ・・・ ボム・ブラスト・スーツ ? バクフウ ヤ カゼ ニ ツヨイ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El traje antiexplosiones? Aguanta las explosiones y el viento. ...Corto. |

| 0x45 | プラスチック・バクダン ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido explosivo plástico. |

| 0x46 | コチラ BIG BOSS ・・・ プラスチック・バクダン ? ドコ ニ デモ セット デキル、 バクダン ダ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿Explosivo plástico? Es una bomba que se puede colocar en cualquier sitio. ...Corto. |

| 0x47 | テキ ノ ユニホーム ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el uniforme enemigo. |

| 0x48 | コチラ BIG BOSS ・・・ テキ ノ ユニホーム ? セーラー・フク カ? ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El uniforme enemigo? ¿Un traje de marinero? ...Corto. |

| 0x49 | *(vacío en las dos)* | *(vacío en las dos)* | |

| 0x4A | *(vacío en las dos)* | *(vacío en las dos)* | |

| 0x4B | セキガイセン ゴーグル ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido las gafas de infrarrojos. |

| 0x4C | コチラ BIG BOSS ・・・ セキガイセン ゴーグル ? セキガイセン センサー ガ ミエル ヨウニ ナル。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿Las gafas de infrarrojos? Con ellas se ven los sensores de infrarrojos. ...Corto. |

| 0x4D | タスカッタ! / ナカニワ ヘ イクニハ オクジョウ カラ、パラシュート コウカ スルシカ ナイ。 | RESCUED! / THE ONLY WAY TO REACH THE COURTYARD IS BY PARACHUTE. | ¡Me has salvado! / Para llegar al patio no hay más remedio que bajar en paracaídas desde la azotea. |

| 0x4E | タスカッタ! DR・PETTROVICH ハ ナカニワ ノ ドクボウ ニ イル。 | RESCUED! / DR.PETTROVICH IS CONFINED TO / A SOLITARY CELL IN THE COURTYARD. | ¡Me has salvado! El Dr. Pettrovich está en la celda del patio. |

| 0x4F | オレ ハ MACHINEGUN KID !! コノサキ ハ トオサン! | I'M MACHINE GUN KID! / I'LL NEVER LET YOU GO AHEAD!! | ¡¡Yo soy Machinegun Kid!! ¡De aquí no pasas! |

| 0x50 | ハーイ。コチラ DIANE ・・・ / MACHINEGUN KID ハ リモコン・ミサイル ニ ヨワイ ハズ ヨ。 ・・・ BYE | HELLO! THIS IS DIANE... MACHINE GUN KID MUST BE KILLED BY REMOTE-CONTROL MISSILE. ...OVER | Hola. Aquí Diane... / Machinegun Kid tiene que ser débil al misil teledirigido. ...Adiós. |

| 0x51 | パラシュート ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el paracaídas. |

| 0x52 | コチラ BIG BOSS ・・・ パラシュート ? コウカ マエ ニ セット シロ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El paracaídas? Póntelo antes de saltar. ...Corto. |

| 0x53 | コチラ SCHNEIDER ・・・ パラシュート ハ 2F ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... YOU CAN GET THE PARACHUTE ON THE 2ND FLOOR. ...OVER | Aquí Schneider... El paracaídas está en la planta 2. ...Corto. |

| 0x54 | タスカッタ! パラシュート ガ アレバ サク ノ キレメ カラ、コウカ デキル 。 | RESCUED | ¡Me has salvado! Con el paracaídas puedes saltar por el hueco de la valla. |

| 0x55 | ジライ タンチキ ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el detector de minas. |

| 0x56 | コチラ BIG BOSS ・・・ ジライ タンチキ ? ジライ ノ イチ ガ ワカル。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿El detector de minas? Te dice dónde están las minas. ...Corto. |

| 0x57 | コチラ レジスタンス リーダー SCHNEIDER ・・・ ジライ タンチキ ハ オクジョウ ニ アル。・・・ OVER | *(vacío)* | Aquí el líder de la resistencia, Schneider... El detector de minas está en la azotea. ...Corto. |

| 0x58 | ハーイ。コチラ DIANE ・・・ HIND D ハ グレネード・ランチャー デ タオセルワ。 ・・・ BYE | HELLO! THIS IS DIANE... HIND-D MUST BE DESTOROYED BY GRENADE LAUNCHER. ...BYE | Hola. Aquí Diane... Al Hind D se le derriba con el lanzagranadas. ...Adiós. |

| 0x59 | DR・PETTROVICH ・・・ オソカッタカ・・・ | ...DR.PETTROVICH. IT'S TOO LATE. | Dr. Pettrovich... ¿He llegado tarde?... |

| 0x5A | タスカッタ! / DR・PETTROVICH ハ ヒトアシサキ ニ ビル 2 ヘ ウツサレタ。 / ビル 2 ハ ココカラ キタ ヘ 10 キロ ノ トコロ ニ アル。 | RESCUED! / DR.PETTROVICH WAS QUICKLY MOVED TO BUILDING NO.2. / BUILDING NO.2 LIES 10KM TO THE NORTH FROM HERE. | ¡Me has salvado! / Al Dr. Pettrovich se lo han llevado al edificio 2 justo antes de que llegaras. / El edificio 2 está 10 km al norte de aquí. |

| 0x5B | シマッタ! トラック ガ ウゴキダシタ!! | I GOOFED!! THE LORRY STARTED TO MOVE! | ¡Maldita sea! ¡¡El camión se ha puesto en marcha!! |

| 0x5C | ハーイ。コチラ DIANE ・・・ TANK ハ ジライ デ タオセルワ。 ・・・ BYE | HELLO! THIS IS DIANE... DESTOROY THE TANK WITH THE LAND MINE. ...BYE | Hola. Aquí Diane... Al tanque se le derriba con minas. ...Adiós. |

| 0x5D | コチラ BIG BOSS ・・・ ケンモン ダ。 テキ ノ ユニホーム ヲ キテ、センニュウ セヨ! / ココカラ ノ レンラク ハ シュウハスウ 12013 デ オコナウ。 ・・・ OVER | THIS IS BIG BOSS... CHECK POINT! / PUT ON AN ENEMY'S UNIFORM AND GAIN ACCESS. / WILL USE WAVEBAND 12013 FOR FUTURE CONTACT. ...OVER | Aquí Big Boss... Es un puesto de control. ¡Ponte el uniforme enemigo e infíltrate! / Desde aquí el contacto será en la frecuencia 12013. ...Corto. |

| 0x5E | コチラ レジスタンス リーダー SCHNEIDER ・・・ テキ ノ ユニホーム ハ ビル 1 ノ チカ ニ アル。 / ココカラ ノ レンラク ハ シュウハスウ 12026 ニ ヘンコウ スル。 ・・・ OVER | THIS IS MR.SCHNEIDER... / ENEMY'S UNIFORM IS AVAILABLE IN THE BASEMENT OF BUILDING NO.1. / WILL CONTACT IN THE BAND OF 12026 FROM NOW ON. ...OVER | Aquí el líder de la resistencia, Schneider... El uniforme enemigo está en el sótano del edificio 1. / Desde aquí cambio el contacto a la frecuencia 12026. ...Corto. |

| 0x5F | ハーイ。コチラ DIANE ・・・ ココカラ ノ レンラク ハ シュウハスウ 12091 ニ ヘンコウ スルワ。 マタ ヨンデネ。 ・・・ BYE | HELLO! THIS IS DIANE... WILL CONTACT ON WAVEBAND 12091 FROM NOW ON. / ...BYE | Hola. Aquí Diane... Desde aquí cambio el contacto a la frecuencia 12091. Vuelve a llamarme. ...Adiós. |

| 0x60 | フラッシュ・ライト ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la linterna. |

| 0x61 | コチラ BIG BOSS ・・・ フラッシュ・ライト ? ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿La linterna? Ya sabes cómo se usa. ...Corto. |

| 0x62 | アンテナ ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la antena. |

| 0x63 | コチラ BIG BOSS ・・・ ボウガイ デンパ ガ デテイタ ガ、 コレデ ダイジョウブ ダ。 ・・・ OVER | THIS IS BIG BOSS... IT WAS JAMMING,BUT... OK NOW. ...OVER | Aquí Big Boss... Había interferencias, pero con esto ya está. ...Corto. |

| 0x64 | コチラ SCHNEIDER ・・・ キタ エレベーター ハ ウエ ニ シカ イドウ シナイ。 ・・・ OVER | *(vacío)* | Aquí Schneider... El ascensor norte solo sube. ...Corto. |

| 0x65 | タスカッタ! DR・PETTROVICH ハ チカロウ ニ イル。 | RESCUED! / DR.PETTROVICH IS CONFINED IN THE BASEMENT. | ¡Me has salvado! El Dr. Pettrovich está en la mazmorra del sótano. |

| 0x66 | *(vacío en las dos)* | *(vacío en las dos)* | |

| 0x67 | カード 5 ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 5. |

| 0x68 | *(vacío en las dos)* | *(vacío en las dos)* | |

| 0x69 | コチラ SCHNEIDER ・・・ ミナミ エレベーター ハ シタ ニ シカ イドウ シナイ。 ・・・ OVER | *(vacío)* | Aquí Schneider... El ascensor sur solo baja. ...Corto. |

| 0x6A | コチラ SCHNEIDER ・・・ コノ サキ ハ ガス チタイダ。 ・・・ OVER | THIS IS MR.SCHNEIDER... LEAD YOU TO THE GAS ROOM! ...OVER | Aquí Schneider... Más adelante hay una zona de gas. ...Corto. |

| 0x6B | タスカッタ! / コノ フロア カラ ダッシュツ スル ニハ キタ エレベーター ヲ サガス シカナイ! | RESCUED | ¡Me has salvado! / Para salir de esta planta no hay más remedio que encontrar el ascensor norte. |

| 0x6C | オレ ハ FIRE TROOPER !! マルヤキ ニ シテヤル!! | I'M FIRE TROOPER! / I WILL / BURN YOU ALIVE! | ¡¡Yo soy Fire Trooper!! ¡¡Te voy a asar vivo!! |

| 0x6D | ワナ ニ ハマッタナ! / ホンモノ ノ DR・PETTROVICH ハ 2F ニ イル・・・ / シネ!! FOX HOUNDER ! | YOU ARE CAUGHT IN A TRAP. / IN FACT, / WE HAVE CONFINED DR.PETTROVICH ON THE SECOND FLOOR. / I WILL GET YOU FOX HOUNDER! | ¡Has caído en la trampa! / El verdadero Dr. Pettrovich está en la planta 2... / ¡¡Muere, Fox Hounder!! |

| 0x6E | カード 6 ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 6. |

| 0x6F | コチラ SCHNEIDER ・・・ コノ サキ ニ キタ エレベーター ガ アル。 ・・・ OVER | *(vacío)* | Aquí Schneider... Más adelante está el ascensor norte. ...Corto. |

| 0x70 | コチラ SCHNEIDER ・・・ フラッシュ・ライト ハ 1F ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE FLASH LIGHT CAN BE FOUND ON THE 1ST FLOOR. ...OVER | Aquí Schneider... La linterna está en la planta 1. ...Corto. |

| 0x71 | ハーイ。コチラ DIANE 。ゲンキ? オトシアナ ニ チュウイ シテ! ・・・ BYE | HELLO! THIS IS DIANE... PLEASE TAKE CARE, THERE MAY BE A PITFALL. ...BYE | Hola. Aquí Diane... ¿Qué tal? ¡Cuidado con los fosos! ...Adiós. |

| 0x72 | ハーイ。コチラ DIANE ・・・ トビラ ヲ マモッテ イル ARNOLD ハ フジミ ダワ! ニゲテ!! | HELLO! THIS IS DIANE... THE DOORKEEPER, MR.ARNOLD IS INVINCIBLE! ESCAPE! | Hola. Aquí Diane... ¡Arnold, el que guarda la puerta, es inmortal! ¡¡Huye!! |

| 0x73 | タスカッタ! サバク ヲ ワタル ニハ コンパス ガ ヒツヨウダ。 | RESCUED! / YOU MUST HAVE A COMPASS TO CROSS THE DESERT. | ¡Me has salvado! Para cruzar el desierto hace falta una brújula. |

| 0x74 | タスカッタ! / シュウハスウ 12048 デ レジスタンス ノ JENNIFER ト レンラク ガ トレルハズダ。 / JENNIFER ハ ジカ ニ サポート シテクレル。 / シカシ、プライド ガ タカイ。 / ツネ ニ、サイコウ カイキュウ デ ナイト オウトウ シテクレ ナイ ダロウ。 | RESCUED! / YOU MIGHT BE ABLE TO CONTACT JENNIFER OF RESISTANCE ON / WAVEBAND 12048. / BUT SHE IS PROUD, AND WOULDN'T ANSWER, / IF YOU WERE NOT THE EXECUTIVE. | ¡Me has salvado! / En la frecuencia 12048 podrás hablar con Jennifer, de la resistencia. / Jennifer te ayudará desde dentro. / Pero es muy orgullosa. / Seguramente no te responderá si no tienes el rango más alto. |

| 0x75 | コチラ JENNIFER ・・・ ロケット・ランチャー ヲ ヨウイ スルワ。 トリ ニ キテ。 ・・・ OVER | THIS IS JENNIFER... WILL ARRANGE A ROCKET LAUNCHER. / COME FOR A ROCKET LAUNCHER! ...OVER | Aquí Jennifer... Te preparo un lanzacohetes. Ven a por él. ...Corto. |

| 0x76 | コチラ JENNIFER ・・・ イマカラ トビラ ヲ アケルワ。 ・・・ OVER | THIS IS JENNIFER... WILL OPEN THE DOOR. ...OVER | Aquí Jennifer... Ahora te abro la puerta. ...Corto. |

| 0x77 | ロケット・ランチャー ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el lanzacohetes. |

| 0x78 | コンパス ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la brújula. |

| 0x79 | ゲドクザイ ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido el antídoto. |

| 0x7A | コチラ SCHNEIDER ・・・ コンパス ハ 2F ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE COMPASS CAN BE FOUND ON THE 2ND FLOOR. ...OVER | Aquí Schneider... La brújula está en la planta 2. ...Corto. |

| 0x7B | タスカッタ! スイコウ ノ オク ガ ビル 3 ニツナガッテ イル。 | RESCUED! / THE DITCH WILL LEAD YOU TO THE NO.3 BUILDING. | ¡Me has salvado! El fondo del canal conecta con el edificio 3. |

| 0x7C | ワタシ ハ DR・PETTROVICH ダ。 ムスメ ノ ELEN ガ ヒトジチ ニ ナッテイル。 / ELEN ヲ タスケテ クレナケレバ、 METAL GEAR ニ ツイテ、ハナスコト ハ デキナイ。 / ELEN ハ ビル 1 ノ チカ ニ カンキン サレテイル。 タスケテ クレ。 | I'M DR.PETTROVICH. / MY DAUGHTER ELLEN WAS TAKEN AS HOSTAGE. / SAVE ELLEN OR,I WON'T DISCUSS METAL GEAR. | Soy el Dr. Pettrovich. Tienen a mi hija Elen de rehén. / Si no la salvas, no puedo hablarte de Metal Gear. / Elen está encerrada en el sótano del edificio 1. Sálvala, por favor. |

| 0x7D | ワタシ ハ DR・PETTROVICH ダ。 / METAL GEAR ハ コノ ビル カラ キタ ニ 20キロ ノ トコロ ニアル、 ビル 3 ノ チカ 100カイ ニ アル。 / METAL GEAR ノ ハカイ ホウホウ ハ ヒトツ。 ソウコウ ノ ウスイ キャクブ ニ プラスチック・バクダン セット スル。 / ジュンバン ハ R、R、L、 R、L、L、R、L、 L、R、R、L、R、 L、R、・・・ アト ハ ワスレテシマッタ! / トニカク、 16コ セット スルノダ。 / ビル 2 ヲ デル トビラ ノ カード ハ ARNOLD ガ モッテイル。ARNOLD ハ ロケット・ランチャー ニ ヨワイ! / コウウン ヲ イノル・・・ | I'M DR.PETTROVICH. / METAL GEAR IS IN 100TH BASEMENT OF BUILDING NO.3, / 20KM TO THE NORTH OF HERE. / METAL GEAR CAN BE DESTOROYED IN ONLY ONE WAY. / ATTACH PLASTIC BOMB TO THE FOOT OF METAL GEAR. / R,R,L,R,L,L,R,L,L, R,R,L,R,L,R,... IN ORDER. / I FORGOT THE REMAINDER. / ANYWAY, / SET 16 UNITS. / YOU CAN NOT, DESTOROY / IF YOU COMMIT AN ERROR IN THE ORDER. / MR.ARNOLD HAS AN I.D. CARD / TO GET OUT OF BUILDING NO.2. / YOU SHOULD USE A ROCKET LAUNCHER TO KILL MR.ARNOLD. | Soy el Dr. Pettrovich. / Metal Gear está en el sótano 100 del edificio 3, a 20 km al norte de este edificio. / Solo hay una forma de destruir Metal Gear: colocar explosivo plástico en las patas, donde el blindaje es más fino. / El orden es R, R, L, R, L, L, R, L, L, R, R, L, R, L, R... ¡El resto lo he olvidado! / En cualquier caso, hay que colocar 16. / La tarjeta de la puerta para salir del edificio 2 la tiene Arnold. ¡Arnold es débil al lanzacohetes! / Te deseo suerte... |

| 0x7E | コチラ SCHNEIDER ・・・ ビル 1 ニハ、チカ ノ ナンセイ カラ ヒミツ ノ チカツウロ ガ レンラク シテイル。 ・・・ OVER | THIS IS MR.SCHNEIDER... SECRET SUBWAY FROM THE SOUTHEAST LEADS YOU TO NO.1 BUILDING. ...OVER | Aquí Schneider... Al edificio 1 llega un pasadizo subterráneo secreto desde el suroeste del sótano. ...Corto. |

| 0x7F | ヨシ、ハイレ! | COME IN | ¡Bien, pasa! |

| 0x80 | タスケテ! | HELP ME | ¡Socorro! |

| 0x81 | アリガトウ・・・ ワタシ ハ DR・PETTROVICH ノ ムスメ、 ELEN 。 / チチ ハ キョウハク サレテ、 METAL GEAR ヲ ツクラサレテ イルノ。 ハヤク チチ ヲ タスケテ クダサイ。 | THANK YOU. / I'M THE DAUGHTER OF DR.PETTROVICH, ELLEN. / MY FATHER WAS FORCED TO DEVELOP METAL GEAR. / PLEASE HELP MY FATHER URGENTLY. | Gracias... Soy Elen, la hija del Dr. Pettrovich. / A mi padre lo tienen amenazado y lo obligan a construir Metal Gear. Salva a mi padre, deprisa, por favor. |

| 0x82 | ハーイ。コチラ DIANE ・・・ サソリ ノ ドク ハ ゲドクザイ ヲ ツカウ ト イイワ。 ・・・ BYE | HELLO! THIS IS DIANE... AN ANTIDOTE IS GOOD FOR THE POISON OF A SCORPION. ...BYE | Hola. Aquí Diane... Para el veneno de escorpión, usa el antídoto. ...Adiós. |

| 0x83 | タスカッタ! | RESCUED | ¡Me has salvado! |

| 0x84 | コチラ BIG BOSS ・・・ ヒダリ ノ トビラ ヘ ハイレ! ・・・ OVER | THIS IS BIG BOSS... ENTER THE LEFT DOOR. ...OVER | Aquí Big Boss... ¡Entra por la puerta de la izquierda! ...Corto. |

| 0x85 | コチラ BIG BOSS ・・・ ミギ ハシ ノ トラック ヘ ハイレ! ・・・ OVER | THIS IS BIG BOSS... CREEP INTO THE LORRY ON THE RIGHT SIDE. ...OVER | Aquí Big Boss... ¡Métete en el camión del extremo derecho! ...Corto. |

| 0x86 | コチラ JENNIFER ・・・ カベ ヲ ハカイ スルノヨ!! ・・・ OVER | THIS IS JENNIFER... YOU SHOULD BREAK DOWN THE WALL. ...OVER | Aquí Jennifer... ¡¡Destruye la pared!! ...Corto. |

| 0x87 | コチラ JENNIFER ! カベ ノ ムコウ ニ サンソボンベ ガ アルハズ!! ・・・ OVER | THIS IS JENNIFER... THERE IS AN OXYGEN CYLINDER BEYOND THE WALL. ...OVER | ¡Aquí Jennifer! ¡¡Detrás de la pared tiene que haber una bombona de oxígeno!! ...Corto. |

| 0x88 | コチラ BIG BOSS ・・・ SOLID SNAKE ! サクセン チュウシ ダ! タダチ ニ キカン セヨ。 / コレハ メイレイ ダ!! MSX ノ デンゲン ヲ キレ!! ・・・ OVER | THIS IS BIG BOSS... SOLID SNAKE! STOP THE OPERATION. SWITCH OFF YOUR MSX AT ONCE. / THIS IS THE COMMAND. ...OVER | Aquí Big Boss... ¡Solid Snake! ¡Se suspende la operación! Regresa de inmediato. / ¡¡Es una orden!! ¡¡Apaga el MSX!! ...Corto. |

| 0x89 | コチラ JENNIFER ! / コノサキ ノ トビラ ヲ アケル カード ハビル 3 ノ ヒガシガワ ニ アルワ。 ソコ ハ ビル 2 ノ スイコウ ト ツナガッテ イルノヨ。 ・・・ BYE | THIS IS JENNIFER... A CARD WHICH OPEN THE NEXT DOOR LIES IN THE EAST OF BUILDING 3. / THE EASTERN SIDE LEADS TO THE DITCH OF BUILDING 2. ...OVER | ¡Aquí Jennifer! / La tarjeta de la puerta de más adelante está en el lado este del edificio 3. Ese sitio conecta con el canal del edificio 2. ...Adiós. |

| 0x8A | コチラ SCHNEIDER ・・・ OUTER HEAVEN ノ ボス ノ ショウタイ ガ ワカッタゾ! / ナント・・・ OUTER HEAVEN ノ ボス ハ・・・ / ・・・ ワー!! ・・・ | THIS IS MR.SCHNEIDER... I HAVE DISCOVERED WHO THE BOSS OF OUTER HEAVEN IS. / THE BOSS IS.... / OH NO!! WHA.A....... | Aquí Schneider... ¡He descubierto quién es el jefe de Outer Heaven! / Nada menos que... el jefe de Outer Heaven es... / ...¡¡Aaah!!... |

| 0x8B | オレ ハ COWARD DUCK ! / ウテルモノ ナラ ウッテミロ!! | I'M COWARD DUCK! / YOU CAN'T / SHOOT ME, / CAN YOU? | ¡Yo soy Coward Duck! / ¡¡Dispara si te atreves!! |

| 0x8C | タスカッタ! / ワタシ ハ JENNIFER ノ / アニ ダ。 / ダッシュツ スルトキ ハ ヒダリハシ / ノ ハシゴ ヲ ノボレ!! | RESCUED! / I'M A BROTHER OF / JENNIFER. / CLIMB THE LEFT / LADDER / WHEN ESCAPING. | ¡Me has salvado! / Soy / el hermano de Jennifer. / ¡¡Para escapar, sube por la escalera del extremo izquierdo!! |

| 0x8D | ハーイ。コチラ DIANE ! ミカタ ヲ コロサズ、タオス ホウホウ ハ ハンドガン シカ ナイワ。 ・・・ BYE | HELLO! THIS IS DIANE... / USE THE HAND GUN TO CAPTURE THE PRISONERS, NOT TO KILL THEM. ...BYE | ¡Hola, aquí Diane! Para abatirlo sin matar a los nuestros solo te sirve la pistola. ...Adiós. |

| 0x8E | コチラ JENNIFER ・・・ カード 8 ハ COWARD DUCK ガ モッテイルワ。 / ホリョ ノ ナカニ ワタシ ノ アニ ガ イルノ! コロサナイデ・・・ / アニ ニ ナニカ アッタラ、 モウ、キョウリョク シナイワ! | THIS IS JENNIFER... COWARD DUCK HAS CARD 8. / MY BROTHER IS AMONG THE CAPTIVES. PLEASE DON'T KILL THEM. ...OVER | Aquí Jennifer... La tarjeta 8 la tiene Coward Duck. / ¡Entre los prisioneros está mi hermano! No lo mates... / ¡Si le pasa algo a mi hermano, no te ayudo más! |

| 0x8F | カード 8ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 8. |

| 0x90 | タスカッタ! / OUTER HEAVEN ノ ボス ハ / FOX HOUNDER ソウシレイカン 、BIG BOSS ダ! / ナニモカモ ヤツ ノ シワザ ダ!! ダマサレルナ!! | RESCUED! / BOSS OF OUTER HEAVEN IS BIG BOSS, / GENERAL COMMANDANT OF FOX HOUND. / EVERYTHING IS DONE BY HIM. | ¡Me has salvado! / El jefe de Outer Heaven es... / ¡el comandante de Fox Hound, Big Boss! / ¡¡Todo es obra suya!! ¡¡No te dejes engañar!! |

| 0x91 | コチラ JENNIFER !! ヒダリ ノ カベ ヲ コワスノヨ! ・・・ OVER | *(vacío)* | ¡¡Aquí Jennifer!! ¡Rompe la pared de la izquierda! ...Corto. |

| 0x92 | コチラ JENNIFER ! イッキ ニ ハシルシカ、ナイワ! レーション ガ アレバ ダイジョウブヨ。 ・・・ OVER | THIS IS JENNIFER... YOU MUST RUN FAST. ...OVER | ¡Aquí Jennifer! ¡No queda otra que cruzar corriendo de un tirón! Si llevas raciones, no pasará nada. ...Corto. |

| 0x93 | SOLID SNAKE ! ヨク ココマデ キタナ!・・・ / ・・・ ワタシ ガ FOX HOUNDER ソウシレイカン 、ソシテ、 / コノ ヨウサイ 、 OUTER HEAVEN ノ ボス、BIG BOSS ダ!! / シンイリ デアル、オマエ ニ コノ ニンム ヲ アタエタ ノモ、ウソ ノ ジョウホウ ヲ モチカエラセルタメダッタ・・・ / シカシ、 オマエ ハ ヤリスギタ。 ヤリスギタノダ! / SOLID SNAKE ! / ワタシ ハ タダデ ハ シナナイ。 ミチヅレ ニ シテヤル!! / カカッテ コイ! | SOLID SNAKE! YOU'VE FINALLY COME HERE. / YEAH,I'M BIG BOSS GENERAL COMMANDANT OF FOX HOUND. / AND IN CHARGE OF THIS FORTRESS, OUTER HEAVEN. / I GAVE YOU INSTRUCTIONS TO BRING BACK / FALSE INFORMATION OF METAL GEAR. / HOWEVER, YOU ACCOMPLISHED TOO MUCH. / YOU HAVE COMPLETELY SMASHED MY AMBITIONS. / SOLID SNAKE!! / I WILL NOT DIE ALONE. / YOU WILL JOIN ME. | ¡Solid Snake! Has llegado lejos... / ...Yo soy el comandante de Fox Hound y, además, / el jefe de esta fortaleza, Outer Heaven: ¡¡Big Boss!! / Si te di esta misión a ti, un novato, fue para que volvieras con información falsa... / Pero / has ido demasiado lejos. ¡Has ido demasiado lejos! / ¡Solid Snake! / No moriré sin más. ¡¡Te llevaré conmigo!! / ¡Ven a por mí! |

| 0x94 | コチラ JENNIFER ! タバコ ヲ ツカウ ト タイマー ガ フエルワ。 イキテ カエッテネ! SOLID SNAKE ・・・ | THIS IS JENNIFER... YOU CAN EXTEND THE TIME LIMIT BY USING A CIGARETTE. / PLEASE RETURN IN SAFETY, SOLID SNAKE! | ¡Aquí Jennifer! Si usas el tabaco, el temporizador aumenta. ¡Vuelve vivo! Solid Snake... |

| 0x95 | コチラ DIANE ! BIG BOSS ヲ タオス ホウホウ ハ シラナイワ・・・ ソレ ハ アナタ シダイ! SOLID SNAKE ! / ・・・ ワタシ・・・ アナタ ノ コト・・・ イエ、ナンデモ ナイワ・・・ ゴブジ デ・・・ | THIS IS DIANE... I DON'T KNOW HOW TO DEFEAT BIG BOSS. IT ALL DEPENDS ON YOU. SOLID SNAKE! / I LOVE.... NO,IT WAS A MERE NOTHING! GOOD LUCK!! | ¡Aquí Diane! No sé cómo derrotar a Big Boss... ¡Eso depende de ti, Solid Snake! / ...Yo... tú... No, no es nada... Cuídate... |

| 0x96 | キンキュウ ジタイ!! / キンキュウ ジタイ!! / OUTER HEAVEN ノ バクハ スイッチ ガ、サドウ シマシタ! / タダチ ニ ダッシュツ カツドウ ヲ オコナッテ クダサイ! | EMERGENCY!! / EMERGENCY!! / THE SELF-DESTRUCTION SWITCH OF / OUTER HEAVEN HAS BEEN ACTIVATED. / ESCAPE QUICKLY!! | ¡¡Emergencia!! / ¡¡Emergencia!! / ¡Se ha activado el detonador de Outer Heaven! / ¡Evacúen de inmediato! |

| 0x97 | ガスマスク ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la máscara antigás. |

| 0x98 | サンソボンベ ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la bombona de oxígeno. |

| 0x99 | カード 7 ヲ ニュウシュ シタ。 | *(vacío)* | Has conseguido la tarjeta 7. |

| 0x9A | コチラ BIG BOSS ・・・ ガスマスク ? ガスチタイ デ ツカウノダ。 ・・・ OVER | *(vacío)* | Aquí Big Boss... ¿La máscara antigás? Úsala en la zona de gas. ...Corto. |

| 0x9B | コチラ SOLID SNAKE ・・・ METAL GEAR ハカイ ニ セイコウ。 OPERATION INTRUDE N313 カンリョウ シタ! / ナニモカモ オワッタ・・・ ナニモカモ・・・ / タダイマ カラ キカンスル。 ・・・ OVER | THIS IS SOLID SNAKE... METAL GEAR'S DESTRUCTION IS A SUCCESS. / OPERATION INTRUDE N313 FINISHED!... / EVERYTHING IS FINISHED. / I WILL GO BACK NOW. ...OVER | Aquí Solid Snake... Metal Gear destruido. Operación Intrude N313 completada. / Todo ha terminado... Todo... / Regreso ahora mismo. ...Corto. |

| 0x9C | ハーイ。コチラ DIANE ・・・ カレラ ハ サイレンサー ヲ モッテイルワ。 ・・・ OVER | HELLO! THIS IS DIANE... I SUPPOSE THEY HAVE A SILENCER. ...BYE | Hola. Aquí Diane... Ellos tienen el silenciador. ...Corto. |

| 0x9D | コチラ STEVE・・・ DIANE ? DIANE ナラ、カイモノ ニ イッタ ママ、カエッテ イナイ ケド・・・ | *(vacío)* | Aquí Steve... ¿Diane? Diane salió de compras y todavía no ha vuelto... |

| 0x9E | コチラ STEVE・・・ DIANE ? DIANE ナラ イマ、シャワー ヲ アビテイルケド・・・ | *(vacío)* | Aquí Steve... ¿Diane? Diane está ahora en la ducha... |

| 0x9F | コチラ STEVE・・・ DIANE ? マタ オマエ カ! / モウ、DIANE ニハ チカヅカナイデ クレ!! | *(vacío)* | Aquí Steve... ¿Diane? ¡¿Otra vez tú?! / ¡¡No te acerques más a Diane!! |

## Las armas y los objetos del menú

|  | Japonés (ROM) | Inglés (ROM) | Traducción |
|---|---|---|---|

| arma 1 | ハンド ガン | HAND GUN | pistola |

| arma 2 | サブマシンガン | SMG | subfusil |

| arma 3 | グレネード | GRENADE | granada |

| arma 4 | ロケットランチャー | ROCKET | lanzacohetes |

| arma 5 | Pバクダン | P-BOMB | bomba P |

| arma 6 | ジライ | L-MAIN | minas |

| arma 7 | リモコンミサイル | MISSILE | misil teledirigido |

| arma 8 | サイレンサー | SILENCER | silenciador |

| objeto 1 | アーマー | ARMOR | chaleco |

| objeto 2 | スーツ | SUIT | traje |

| objeto 3 | ライト | LIGHT | linterna |

| objeto 4 | ゴーグル | GOGGL | gafas |

| objeto 5 | ガスマスク | MASK | máscara antigás |

| objeto 6 | タバコ | CIGAL | tabaco |

| objeto 7 | タンチキ | DETEC | detector |

| objeto 8 | アンテナ | ANTEN | antena |

| objeto 9 | ズーム | SCOPE | zoom |

| objeto 10 | ボンベ | BOMBE | bombona |

| objeto 11 | コンパス | COMPAS | brújula |

| objeto 12 | ラッカサン | PARAC | paracaídas |

| objeto 13 | ドクケシ | ANTID | antídoto |

| objeto 14 | カード 1 | CARD1 | tarjeta 1 |

| objeto 15 | カード 2 | CARD2 | tarjeta 2 |

| objeto 16 | カード 3 | CARD3 | tarjeta 3 |

| objeto 17 | カード 4 | CARD4 | tarjeta 4 |

| objeto 18 | カード 5 | CARD5 | tarjeta 5 |

| objeto 19 | カード 6 | CARD6 | tarjeta 6 |

| objeto 20 | カード 7 | CARD7 | tarjeta 7 |

| objeto 21 | カード 8 | CARD8 | tarjeta 8 |

| objeto 22 | レーション | RATIO | ración |

| objeto 23 | ハッシンキ | TRANS | transmisor |

| objeto 24 | ユニホーム | UNIFO | uniforme |

| objeto 25 | ダンボール | BOX | caja de cartón |

## Los rótulos, iguales en las dos

- `p00:5C1D` PAUSE
- `p01:6B48` RECV
- `p01:6B4F` SEND
- `p02:9262` ©KONAMI 1987 · PUSH SPACE KEY
- `p02:9282` PLAY START
- `p02:9293` GAME OVER · CONTINUE F5
- `p02:92AF` LIFE
- `p02:92B6` CLASS
- `p02:92BE` TELESCOPE MODE
- `p06:B805` WEAPON SELECT · OPTION
- `p06:B81F` EQUIPMENT SELECT
- `p06:B833` TRANSCEIVER · RECV
- `p15:BC9F` SAVE MODE · INPUT FILE NAME
- `p15:BCBD` LOAD MODE · INPUT FILE NAME
- `p15:BCDB` SAVING
- `p15:BCE4` SAVE ERROR
- `p15:BCF1` VERIFY ERROR
- `p15:BD00` VERIFY SUCCESS · RETRY?
- `p15:BD1A` VERIFY? · YES Y · NO N
- `p15:BD3B` ING
- `p15:BD41` SKIP
- `p15:BD48` FOUND
- `p15:BD52` LOAD ERROR

## Cómo sacarlos otra vez

Con las dos ROMs en la raíz del repositorio (`metalgear.rom` y `metalgear-jp.rom`, con los SHA-1 de arriba), `python3 tools/textos.py pagina` escribe esta página y su pareja en inglés; `python3 tools/textos.py tabla` saca la tabla de trabajo con el tipo de ventana de cada texto.
