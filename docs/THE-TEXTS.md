# The texts

Metal Gear came out in Japan in 1987 (RC-750) and Konami later made the English version, which is the one in the listing. Here are all the texts of both, taken from the ROMs with `tools/textos.py`, side by side and with a translation of the Japanese so you can see where the script was changed or cut down. **The translation is ours, not Konami's.**

| | English (the listing's) | Japanese |
|---|---|---|
| CRC32 | E85C5731 | FAFE1303 |
| SHA-1 | `b656bd19df58fc1ba4628342b87beeec5948e0b3` | `a52021f1b257c7c35d626d5d642134091c45e4f4` |

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
- The Japanese version has not been disassembled: which texts it asks for has not been measured.

## The 159 texts

One per row, with its number. « / » is a new page of the window; *(empty)* means the English version points that text at `p12:B8A6`.

| No. | Japanese (ROM) | English (ROM) | Translation of the Japanese |
|---|---|---|---|

| 0x01 | コウタイダ!! | RELIEVE | Change of shift!! |

| 0x02 | コチラ BIG BOSS ・・・ OPERATION INTRUDE N313。 テキ ヨウサイ OUTER HEAVEN ニ センニュウ 、サイシュウヘイキ METAL GEAR ヲ ハカイ セヨ! / マズハ ショウソク ヲ タッタ、 GREY FOX ト コンタクト 、 サイシュウヘイキ 、METAL GEAR ノ ショウタイ ヲ サグレ。 / イゴ ノ レンラク ハ シュウハスウ 12085 デ オコナウ。 ・・・ OVER | THIS IS BIG BOSS... OPERATION INTRUDE N313. / PENETRATE THE ENEMY'S OUTER HEAVEN AND DESTOROY THE ULTIMATE WEAPON METAL GEAR! / FIRST, CONTACT MISSING GREY FOX AND SEARCH FOR METAL GEAR! / CONTACT IN THE BAND OF 12085 FROM NOW ON. ...OVER | This is Big Boss... Operation Intrude N313. Infiltrate the enemy fortress Outer Heaven and destroy the ultimate weapon Metal Gear! / First, contact Grey Fox, who has gone missing, and find out what the ultimate weapon Metal Gear really is. / From now on we keep in touch on frequency 12085. ...Over. |

| 0x03 | コチラ BIG BOSS ・・・ ニンム ハ センニュウ ダ。 クレグレモ テキニ ミツカラヌ ヨウ ニ コウドウ シロ。 ・・・ OVER | THIS IS BIG BOSS... MISION! GAIN ACCESS TO THE ENEMY'S FORTRESS, OUTER HEAVEN. / TAKE ACTION NOT TO BE DISCOVERED BY THE ENEMY. ...OVER | This is Big Boss... Your mission is infiltration. Whatever you do, move so that the enemy does not spot you. ...Over. |

| 0x04 | コチラ BIG BOSS ・・・ ブキ、ソウビ ハ テキ ノ トラック 、 ブキコ カラ ウバエ! ダンヤク ハ ミハリ カラ、ウバエ!! / トビラ ヲ アケル ニハ カード ガ ヒツヨウダ。 カード ヲ サガセ。 ・・・ OVER | THIS IS BIG BOSS... TAKE THE WEAPONS AND EQUIPMENTS FROM THE ENEMY'S LORRY!! / YOU SHOULD HAVE AN I.D.CARD TO OPEN THE DOOR. ...OVER | This is Big Boss... Take your weapons and equipment from the enemy: from the trucks and the armoury. Take ammunition from the guards!! / You need a card to open the doors. Look for the cards. ...Over. |

| 0x05 | コチラ BIG BOSS ・・・ エレベーター ニ ノルト フロア カン ノ イドウ ガ デキル。エレベーター ノ イチ ヲ オボエル コトダ。 ・・・ OVER | *(empty)* | This is Big Boss... The elevators take you from floor to floor. Memorise where they are. ...Over. |

| 0x06 | ウゴクナ!! | DON'T MOVE! | Don't move!! |

| 0x07 | レンコウスル! | YOU ARE CAPTURED! | You're coming with me! |

| 0x08 | レーション ヲ ニュウシュ シタ。 | *(empty)* | Got the ration. |

| 0x09 | コチラ BIG BOSS ・・・ レーション ? ヒジョウ ヨウ ショクリョウ ダ。 スグ ニ タベズ ニ ノコシテ オケ。 ・・・ OVER | *(empty)* | This is Big Boss... The ration? It's emergency food. Don't eat it straight away: keep it. ...Over. |

| 0x0A | コチラ SOLID SNAKE ・・・ オウトウ ネガイ マス。 | THIS IS SOLID SNAKE... YOUR REPLY,PLEASE. | This is Solid Snake... Please respond. |

| 0x0B | カード 1 ヲ ニュウシュ シタ。 | *(empty)* | Got card 1. |

| 0x0C | コチラ BIG BOSS ・・・ カード ? トビラ ヲ アケル カード ダ。 / トビラ ニ ヨッテ、 カード ナンバー ガ チガウ。 チュウイ シロ 。 ・・・ OVER | *(empty)* | This is Big Boss... A card? It's a card that opens doors. / Each door takes a different card number. Be careful. ...Over. |

| 0x0D | ソウガンキョウ ヲ ニュウシュ シタ。 | *(empty)* | Got the binoculars. |

| 0x0E | コチラ BIG BOSS ・・・ ソウガンキョウ ? / シュウイ ヲ ミルトキ ニ ツカエ 。 トオク ノ チケイ ヤ テキ ノ ハイチ ガワカル。ツネニ ソウガンキョウ ヲ ツカウヨウ ニ ココロ ガケロ。 ・・・ OVER | *(empty)* | This is Big Boss... The binoculars? / Use them to look around: you can see the terrain in the distance and where the enemies are. Make a habit of always using them. ...Over. |

| 0x0F | ・・・ キコエルカ? SOLID SNAKE ・・・ ワタシ ハ シナン・・・ イツカ、ケッチャク ヲ ツケヨウ。 / イツノヒカ・・・ マタ アオウ! | LISTEN! SOLID SNAKE... I'LL NEVER DIE... / I'LL GET YOU. ONE DAY. / SEE YOU AGAIN... | ...Can you hear me? Solid Snake... I will not die... One day we will settle this. / Some day... we will meet again! |

| 0x10 | ハンドガン ヲ ニュウシュ シタ。 | *(empty)* | Got the handgun. |

| 0x11 | コチラ BIG BOSS ・・・ ハンドガン ? BELLETA M92F・・・ / ツカイカタ ハ ワカッテイルナ 。 ダンヤク ヲ サガセ 。 タマ ハ ムダヅカイ スルナ。 ・・・ OVER | *(empty)* | This is Big Boss... The handgun? Beretta M92F (BELLETA in the ROM)... / You know how to use it. Look for ammunition. Don't waste bullets. ...Over. |

| 0x12 | ジライ ヲ ニュウシュ シタ。 | *(empty)* | Got land mines. |

| 0x13 | コチラ BIG BOSS ・・・ ジライ ? ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(empty)* | This is Big Boss... Land mines? You know how to use it. ...Over. |

| 0x14 | コチラ BIG BOSS ・・・ レジスタンス ガ イルハズ ダ。 ムセン デ コンタクト シテミロ。 ・・・ OVER | THIS IS BIG BOSS... THERE MUST BE SOME RESISTANCE. / TRY TO CONTACT WITH THE TRANSCEIVER! ...OVER | This is Big Boss... There must be a resistance. Try to contact them by radio. ...Over. |

| 0x15 | ダンヤク ヲ ニュウシュ シタ。 | *(empty)* | Got ammunition. |

| 0x16 | コチラ BIG BOSS ・・・ ダンヤク ハ モテル カズ ニ セイゲン ガ アル。 チュウイ シロ 。 ・・・ OVER | *(empty)* | This is Big Boss... There is a limit to how much ammunition you can carry. Be careful. ...Over. |

| 0x17 | コチラ レジスタンス リーダー SCHNEIDER ・・・ / ヨウサイ ノ ナイブ ニ ツイテ ガイド スル。 シュウハスウ 12079 デ レンラク サレタシ。 ・・・ OVER | THIS IS THE RESISTANCE LEADER,MR.SCHNEIDER... / I WILL BRIEF YOU ON THE FORTRESS DETAILS. PLEASE CONTACT ON WAVEBAND 12079. ...OVER | This is resistance leader Schneider... / I will guide you through the inside of the fortress. Contact me on frequency 12079. ...Over. |

| 0x18 | コチラ BIG BOSS ・・・ カンシカメラ ニ チュウイ シロ 。 ・・・ OVER | *(empty)* | This is Big Boss... Watch out for the surveillance cameras. ...Over. |

| 0x19 | コチラ BIG BOSS ・・・ イイワスレテイタガ 、 ガスチタイ デハ ガスマスク ガ ヒツヨウダ。 / ガスマスク ノ アリカ ハ レジスタンス リーダー SCHNEIDER ガ シッテイル ハズダ。 ・・・ OVER | THIS IS BIG BOSS... PUT ON A GAS MASK IN THE GAS ROOM. ...OVER | This is Big Boss... I forgot to tell you: you need a gas mask in the gas zone. / The resistance leader, Schneider, should know where the mask is. ...Over. |

| 0x1A | コチラ レジスタンス リーダー SCHNEIDER ・・・ ガスマスク ハ 1F ノ ミナミ ニ アル。 ・・・ OVER | THIS IS THE RESISTANCE LEADER,MR.SCHNEIDER... / GO TO THE SOUTH PART OF THE 1ST FLOOR TO GET YOUR MASK. ...OVER | This is resistance leader Schneider... The gas mask is in the south of floor 1. ...Over. |

| 0x1B | タスカッタ! / シュウハスウ 12033 デ レジスタンス ノ DIANE ガ サポート シテクレル。 / DIANE ハ テキ ノ ジョウホウニ クワシイハズ ダ。 | RESCUED! / RESISTANCE,DIANE WILL SUPPORT YOU ON WAVEBAND 12033. | You saved me! / On frequency 12033 Diane, from the resistance, will support you. / Diane should know a lot about the enemy. |

| 0x1C | タスカッタ! | RESCUED | You saved me! |

| 0x1D | リモコン・ミサイル ヲ ニュウシュ シタ。 | *(empty)* | Got the remote-control missile. |

| 0x1E | コチラ BIG BOSS ・・・ リモコン・ミサイル ? / リモコン ソウサ デキル ミサイル ダ。 ショウガイブツ ノ オオイ トコロ デ ツカエ 。 ・・・ OVER | *(empty)* | This is Big Boss... The remote-control missile? / It's a missile you steer by remote control. Use it where there are lots of obstacles. ...Over. |

| 0x1F | コチラ ラジオ KNK。 リンジニュース ヲ モウシアゲマス。 / ホンジツ ミメイ、SOUTH AFRICA GALZBURG フキン デ ダイキボ ナ ジシン ガ アッタモヨウ・・・ | THIS IS RADIO KNK. EMERGENCY NEWS FLASH! / THERE WAS APPARENTLY A TREMENDOUS EARTH TREMOR IN THE REGION OF GALZBURG,SOUTH AFRICA AT MIDNIGHT. | This is Radio KNK. We interrupt with a news flash. / In the small hours of today there appears to have been a major earthquake near Galzburg, South Africa... |

| 0x20 | タスカッタ! / スウジツ マエ ニ センニュウ シテキタ FOX HOUNDER ナラ、ブジダ。 / ヤツラ ニ トラエラレ テ イル。 | RESCUED! / FOX HOUNDER INTRUDED A FEW DAYS AGO / AND IS SAFE NOW. / HE WAS CAPTURED BY THE ENEMY. | You saved me! / The Fox Hounder who got in a few days ago is alive. / They are holding him prisoner. |

| 0x21 | アー!ネムイ!! | I'M SLEEPY. | Aah! I'm so sleepy!! |

| 0x22 | ネテシマッタ! | OVERSLEPT! | I fell asleep! |

| 0x23 | FOX HOUNDER ガ センニュウ シテイル ラシイ。 ゼッタイ ニ トオスナ! | PROBABLY, FOX HOUNDER GAINED ACCESS. / DON'T MAKE WAY FOR HIM, AT ANY COST. | It seems a Fox Hounder has got in. Don't let him through, whatever happens! |

| 0x24 | コチラ BIG BOSS ・・・ FUNCTION KEY ノ セツメイ ヲ スル。 F1 KEY ヲ オス ト、ポーズ。 / F2 KEY ヲ オス ト、ブキ セレクト。 F3 KEY ヲ オス ト、ソウビ セレクト。 F4 KEY ヲ オス ト、ムセン モード。 / ヨク、アタマ ニ イレテ オクコト ダ。 ・・・ OVER | THIS IS BIG BOSS... WILL EXPLAIN HOW TO USE F-KEY. / F-1 KEY FOR PAUSE. F-2 KEY FOR SELECTING YOUR WEAPONS. F-3 KEY FOR SELECTING YOUR EQUIPMENTS. / F-4 KEY FOR TRANSCEIVER BAND. REMEMBER THESE WELL. ...OVER | This is Big Boss... I'll explain the function keys. F1 pauses. / F2 selects a weapon. F3 selects equipment. F4 is radio mode. / Get that into your head. ...Over. |

| 0x25 | カード 2 ヲ ニュウシュ シタ。 | *(empty)* | Got card 2. |

| 0x26 | コチラ BIG BOSS ・・・ イイワスレテイタガ 、コウアツデンリュウ ハ デンゲン パネル ヲ ハカイ セヨ。 / リモコン・ミサイル ヲ ツカウノダ。 リモコン・ミサイル ノ アリカ ハ レジスタンス リーダー SCHNEIDER ガ シッテイル。 ・・・ OVER | THIS IS BIG BOSS... / BREAK DOWN THE POWER SUPPLY BOX WITH THE REMOTE-CONTROL MISSILE TO GET RID OF THE HIGH-VOLTAGE. / ...OVER | This is Big Boss... I forgot to tell you: for the high voltage, destroy the power panel. / Use the remote-control missile. The resistance leader, Schneider, knows where the missile is. ...Over. |

| 0x27 | コチラ レジスタンス リーダー SCHNEIDER ・・・ リモコン・ミサイル ハ セイナン ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE REMOTE-CONTROL MISSILE IS AVAILABLE IN THE SOUTHEASTERN AREA. ...OVER | This is resistance leader Schneider... The remote-control missile is in the southwest. ...Over. |

| 0x28 | ダンボール ヲ ニュウシュ シタ。 | *(empty)* | Got the cardboard box. |

| 0x29 | コチラ BIG BOSS ・・・ ダンボール ? ヒッコシ デモ スルノカ? ・・・ OVER | *(empty)* | This is Big Boss... A cardboard box? Are you moving house or something? ...Over. |

| 0x2A | コチラ BIG BOSS ・・・ イイワスレテイタガ 、オクジョウ ハ ウインド・バリア ガ、ハラレテイル。 ボム・ブラスト・スーツ ヲ サガセ! ・・・ OVER | THIS IS BIG BOSS... WIND BARRIER IS EXTENDED ON THE ROOFTOP. / LOOK FOR THE BOMB BLAST SUIT TO BE INTO THE BARRIER. ...OVER | This is Big Boss... I forgot to tell you: there is a wind barrier on the roof. Look for the bomb blast suit! ...Over. |

| 0x2B | サイレンサー ヲ ニュウシュ シタ。 | *(empty)* | Got the silencer. |

| 0x2C | コチラ BIG BOSS ・・・ サイレンサー ? コレ ヲ ツケルト、ジュウセイ ガ ケセル。 ・・・ OVER | *(empty)* | This is Big Boss... The silencer? With this fitted, your shots can't be heard. ...Over. |

| 0x2D | カワリマシテ METAL GEAR STAFF ショウカイ・・・ / MAIN PROGRAM HIROYUKI FUKUI / SUB PROGRAM TOMONORI OTSUKA KOJI TOYOHARA / GRAPHIC DESIGN MASAMI TABATA AZUSA FUJIMOTO / MAIN SOUND EFFECT IKU MIZUTANI / SUB SOUND EFFECT SHIGEHIRO TAKENOUCHI MOTOAKI FURUKAWA / GAME DESIGN HIDEO KOJIMA / PRESENTED BY KONAMI 1987 | NEXT, WE INTRODUCE METAL GEAR STAFF... / MAIN PROGRAM HIROYUKI FUKUI / SUB PROGRAM TOMONORI OSTUKA KOJI TOYOHARA / GRAPHIC DESIGN MASAMI TABATA AZUSA FUJIMOTO / MAIN SOUND EFFECT IKU MIZUTANI / SUB SOUND EFFECT SHIGEHIRO TAKENOUCHI MOTOAKI FURUKAWA / GAME DESIGN HIDEO KOJIMA / PRESENTED BY KONAMI 1987 | And now, introducing the Metal Gear staff... / (the credits, in Latin letters in both versions) |

| 0x2E | グレネード・ランチャー ヲ ニュウシュ シタ。 | *(empty)* | Got the grenade launcher. |

| 0x2F | コチラ BIG BOSS ・・・ グレネード・ランチャー M79? ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(empty)* | This is Big Boss... The M79 grenade launcher? You know how to use it. ...Over. |

| 0x30 | コチラ BIG BOSS ・・・ イイワスレテイタガ セキガイセン センサー ニハ チュウイ シロ 。 セキガイセン ゴーグル ガ ヒツヨウダ。 ・・・ OVER | *(empty)* | This is Big Boss... I forgot to tell you: watch out for the infrared sensors. You need infrared goggles. ...Over. |

| 0x31 | コチラ BIG BOSS ・・・ ミトオシ ノ ヨイ トコロ ハ、 カモフラージュ ガ ヒツヨウダ。 タトエバ、ナニカ ヲ カブル トカ・・・ ・・・ OVER | *(empty)* | This is Big Boss... Where you can be seen from far away you need camouflage. For example, hiding under something... ...Over. |

| 0x32 | コチラ BIG BOSS ・・・ ソウビ ヲ テンケン シテミロ!! / テキ ニ ハッシンキ カ ナニカ、 トリツケラレテ ハ イナイカ? ・・・ OVER | THIS IS BIG BOSS... CHECK YOUR EQUIPMENTS! CHECK IF YOU HAVE BEEN BUGGED BY THE ENEMY. ...OVER | This is Big Boss... Check your equipment!! / Hasn't the enemy planted a transmitter or something on you? ...Over. |

| 0x33 | コチラ SCHNEIDER ・・・ ボム・ブラスト・スーツ ハ チカ ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE BOMB BLAST SUIT CAN BE FOUND IN THE BASEMENT. ...OVER | This is Schneider... The bomb blast suit is in the basement. ...Over. |

| 0x34 | タスカッタ! / GREY FOX トカイウ FOX HOUNDER ナラ・・・ / ヒミツ ノ ドクボウ ニ カンキン サレテ イルハズダ。 | RESCUED! / FOX HOUNDER CALLED GREY FOX MUST BE / CONFINED IN THE SECRET CELL. | You saved me! / If it's a Fox Hounder called Grey Fox... / he should be locked up in the secret cell. |

| 0x35 | コチラ SCHNEIDER ・・・ ヒミツ ノ ドクボウ ? ザンネン ナガラ、シラナイ・・・ ・・・ OVER | *(empty)* | This is Schneider... The secret cell? Sorry, I don't know... ...Over. |

| 0x36 | タスカッタ! / ヒミツ ノ ドクボウ ニ チカヅク イチバン ノ ホウホウ ハ テキ ニ ワザト ツカマル コトダ・・・ | RESCUED! / THE BEST WAY OF GAINING ACCESS TO THE SECRET CELL, / IS TO ALLOW THE ENEMY TO CAPTURE YOU. | You saved me! / The best way to get near the secret cell is to let the enemy catch you on purpose... |

| 0x37 | カード 4 ヲ ニュウシュ シタ。 | *(empty)* | Got card 4. |

| 0x38 | サブマシンガン ヲ ニュウシュ シタ。 | *(empty)* | Got the submachine gun. |

| 0x39 | コチラ BIG BOSS ・・・ サブマシンガン ? INGRUM MAC 11・・・ ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(empty)* | This is Big Boss... The submachine gun? Ingram MAC 11 (INGRUM in the ROM)... You know how to use it. ...Over. |

| 0x3A | コチラ BIG BOSS ・・・ センニュウ セイコウ ダ。 GREY FOX ノ ドクボウ ヲ サガセ 。 / カベ ヲ シラベテ ミロ!! ・・・ OVER | THIS IS BIG BOSS... MOVE OUT,AND LOCATE GREY FOX'S SOLITARY CELL. / CHECK THE WALL! ...OVER | This is Big Boss... Infiltration successful. Look for Grey Fox's cell. / Try examining the walls!! ...Over. |

| 0x3B | ヨクキテクレタ・・・ シンイリ。 GREY FOX ダ。 / サイシュウヘイキ METAL GEAR トハ アラユル チケイ ニ タイオウ デキル カク トウサイ、 ジュウホコウ センシャ ダ。 / コレ ガ カンセイ スルト、 チキュウジョウ ノ アラユル トコロ カラ ノ カクコウゲキ ガ カノウ ト ナル。 / ナント シテモ カンセイマエ ニ ハカイ シナケレバ ナラナイ。 METAL GEAR ハカイ ノ ホウホウ ハ タダヒトツ。 / ソレ ハ カイハツシャ DR・PETTROVICH ガ シッテイル・・・ / コノ ビル ノ ドコカ ニ カンキン サレテイル ハズダ。 DR・PETTROVICH ヲ サガセ! | I'M GREY FOX. / THE ULTIMATE WEAPON METAL GEAR HAS / NUCLEAR WEAPONS DESIGNED FOR EVERY PART OF EARTH. / IF IT IS COMPLETED, NUCLEAR ATTACK / FROM ANYWHWRE / WILL BE POSSIBLE. / METAL GEAR MUST BE DESTOROYED, / BEFORE IT IS COMPLETED. / THERE IS ONLY ONE WAY TO DESTOROY METAL GEAR. / DR.PETTROVICH,WHO DEVELOPED IT KNOW THE ONLY METHOD. | Thanks for coming... rookie. I'm Grey Fox. / The ultimate weapon Metal Gear is a nuclear-armed walking tank that can handle any terrain. / Once it's finished, a nuclear strike will be possible from anywhere on Earth. / It has to be destroyed before it's finished, whatever it takes. There is only one way to destroy Metal Gear. / And its designer, Dr. Pettrovich, knows it... / He must be held somewhere in this building. Find Dr. Pettrovich! |

| 0x3C | コチラ BIG BOSS ・・・ ウバワレタ、ブキ、ソウビ ヲ トリカエシ、ダッシュツ セヨ! / ドコカ ノ ヘヤ ニ カクサレテ イルハズダ。 パンチ デ サガセ! ・・・ OVER | THIS IS BIG BOSS... TAKE BACK YOUR WEAPONS AND EQUIPMENTS, AND GET OUT OF HERE! / THEY MUST BE CONCEALED IN A ROOM. BREAK THE DOOR! ...OVER | This is Big Boss... Get back the weapons and equipment they took from you and escape! / They must be hidden in some room. Search with your fists! ...Over. |

| 0x3D | オレ ハ SHOOT GUNNER ダ!! / ココカラ ダッソウ デキタモノ ハ イナイ! | I'M SHOOT GUNNER! / NOBODY HAS / EVER BEEN ABLE TO ESCAPE FROM HERE. | I am Shoot Gunner!! / No one has ever escaped from here! |

| 0x3E | ブキ、ソウビ ヲ トリカエシタ!! | I TOOK BACK THE WEAPONS AND EQUIPMENTS. | Weapons and equipment recovered!! |

| 0x3F | カード 3 ヲ ニュウシュ シタ。 | *(empty)* | Got card 3. |

| 0x40 | コチラ SCHNEIDER ・・・ / カベ ヲ タタイテ、 オト ガ チガウ トコロ ヲ バクハ スルト イイ。 ・・・ OVER | THIS IS MR.SCHNEIDER... / YOU SHOULD KNOCK THE WALL AND BLAST IT WHICH SOUNDS IRREGULARLY. ...OVER | This is Schneider... / Tap the walls and blow up the places that sound different. ...Over. |

| 0x41 | ボデイー・アーマー ヲ ニュウシュ シタ。 | *(empty)* | Got the body armour. |

| 0x42 | コチラ BIG BOSS ・・・ ボデイー・アーマー ? オトコ ナラ ツカウナ! ・・・ OVER | *(empty)* | This is Big Boss... Body armour? A real man doesn't use it! ...Over. |

| 0x43 | ボム・ブラスト・スーツ ヲ ニュウシュ シタ。 | *(empty)* | Got the bomb blast suit. |

| 0x44 | コチラ BIG BOSS ・・・ ボム・ブラスト・スーツ ? バクフウ ヤ カゼ ニ ツヨイ。 ・・・ OVER | *(empty)* | This is Big Boss... The bomb blast suit? It stands up to blasts and wind. ...Over. |

| 0x45 | プラスチック・バクダン ヲ ニュウシュ シタ。 | *(empty)* | Got plastic explosive. |

| 0x46 | コチラ BIG BOSS ・・・ プラスチック・バクダン ? ドコ ニ デモ セット デキル、 バクダン ダ。 ・・・ OVER | *(empty)* | This is Big Boss... Plastic explosive? It's a bomb you can set anywhere. ...Over. |

| 0x47 | テキ ノ ユニホーム ヲ ニュウシュ シタ。 | *(empty)* | Got the enemy uniform. |

| 0x48 | コチラ BIG BOSS ・・・ テキ ノ ユニホーム ? セーラー・フク カ? ・・・ OVER | *(empty)* | This is Big Boss... The enemy uniform? A sailor suit? ...Over. |

| 0x49 | *(empty in both)* | *(empty in both)* | |

| 0x4A | *(empty in both)* | *(empty in both)* | |

| 0x4B | セキガイセン ゴーグル ヲ ニュウシュ シタ。 | *(empty)* | Got the infrared goggles. |

| 0x4C | コチラ BIG BOSS ・・・ セキガイセン ゴーグル ? セキガイセン センサー ガ ミエル ヨウニ ナル。 ・・・ OVER | *(empty)* | This is Big Boss... The infrared goggles? They let you see the infrared sensors. ...Over. |

| 0x4D | タスカッタ! / ナカニワ ヘ イクニハ オクジョウ カラ、パラシュート コウカ スルシカ ナイ。 | RESCUED! / THE ONLY WAY TO REACH THE COURTYARD IS BY PARACHUTE. | You saved me! / The only way to reach the courtyard is to parachute down from the roof. |

| 0x4E | タスカッタ! DR・PETTROVICH ハ ナカニワ ノ ドクボウ ニ イル。 | RESCUED! / DR.PETTROVICH IS CONFINED TO / A SOLITARY CELL IN THE COURTYARD. | You saved me! Dr. Pettrovich is in the cell in the courtyard. |

| 0x4F | オレ ハ MACHINEGUN KID !! コノサキ ハ トオサン! | I'M MACHINE GUN KID! / I'LL NEVER LET YOU GO AHEAD!! | I am Machinegun Kid!! You won't get past here! |

| 0x50 | ハーイ。コチラ DIANE ・・・ / MACHINEGUN KID ハ リモコン・ミサイル ニ ヨワイ ハズ ヨ。 ・・・ BYE | HELLO! THIS IS DIANE... MACHINE GUN KID MUST BE KILLED BY REMOTE-CONTROL MISSILE. ...OVER | Hi. This is Diane... / Machinegun Kid should be weak against the remote-control missile. ...Bye. |

| 0x51 | パラシュート ヲ ニュウシュ シタ。 | *(empty)* | Got the parachute. |

| 0x52 | コチラ BIG BOSS ・・・ パラシュート ? コウカ マエ ニ セット シロ。 ・・・ OVER | *(empty)* | This is Big Boss... The parachute? Put it on before you jump. ...Over. |

| 0x53 | コチラ SCHNEIDER ・・・ パラシュート ハ 2F ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... YOU CAN GET THE PARACHUTE ON THE 2ND FLOOR. ...OVER | This is Schneider... The parachute is on floor 2. ...Over. |

| 0x54 | タスカッタ! パラシュート ガ アレバ サク ノ キレメ カラ、コウカ デキル 。 | RESCUED | You saved me! With a parachute you can jump through the gap in the fence. |

| 0x55 | ジライ タンチキ ヲ ニュウシュ シタ。 | *(empty)* | Got the mine detector. |

| 0x56 | コチラ BIG BOSS ・・・ ジライ タンチキ ? ジライ ノ イチ ガ ワカル。 ・・・ OVER | *(empty)* | This is Big Boss... The mine detector? It shows you where the mines are. ...Over. |

| 0x57 | コチラ レジスタンス リーダー SCHNEIDER ・・・ ジライ タンチキ ハ オクジョウ ニ アル。・・・ OVER | *(empty)* | This is resistance leader Schneider... The mine detector is on the roof. ...Over. |

| 0x58 | ハーイ。コチラ DIANE ・・・ HIND D ハ グレネード・ランチャー デ タオセルワ。 ・・・ BYE | HELLO! THIS IS DIANE... HIND-D MUST BE DESTOROYED BY GRENADE LAUNCHER. ...BYE | Hi. This is Diane... You can bring down the Hind D with the grenade launcher. ...Bye. |

| 0x59 | DR・PETTROVICH ・・・ オソカッタカ・・・ | ...DR.PETTROVICH. IT'S TOO LATE. | Dr. Pettrovich... Was I too late?... |

| 0x5A | タスカッタ! / DR・PETTROVICH ハ ヒトアシサキ ニ ビル 2 ヘ ウツサレタ。 / ビル 2 ハ ココカラ キタ ヘ 10 キロ ノ トコロ ニ アル。 | RESCUED! / DR.PETTROVICH WAS QUICKLY MOVED TO BUILDING NO.2. / BUILDING NO.2 LIES 10KM TO THE NORTH FROM HERE. | You saved me! / Dr. Pettrovich was moved to building 2 just before you arrived. / Building 2 is 10 km north of here. |

| 0x5B | シマッタ! トラック ガ ウゴキダシタ!! | I GOOFED!! THE LORRY STARTED TO MOVE! | Damn! The truck is moving!! |

| 0x5C | ハーイ。コチラ DIANE ・・・ TANK ハ ジライ デ タオセルワ。 ・・・ BYE | HELLO! THIS IS DIANE... DESTOROY THE TANK WITH THE LAND MINE. ...BYE | Hi. This is Diane... You can destroy the tank with land mines. ...Bye. |

| 0x5D | コチラ BIG BOSS ・・・ ケンモン ダ。 テキ ノ ユニホーム ヲ キテ、センニュウ セヨ! / ココカラ ノ レンラク ハ シュウハスウ 12013 デ オコナウ。 ・・・ OVER | THIS IS BIG BOSS... CHECK POINT! / PUT ON AN ENEMY'S UNIFORM AND GAIN ACCESS. / WILL USE WAVEBAND 12013 FOR FUTURE CONTACT. ...OVER | This is Big Boss... It's a checkpoint. Put on the enemy uniform and get in! / From here on we keep in touch on frequency 12013. ...Over. |

| 0x5E | コチラ レジスタンス リーダー SCHNEIDER ・・・ テキ ノ ユニホーム ハ ビル 1 ノ チカ ニ アル。 / ココカラ ノ レンラク ハ シュウハスウ 12026 ニ ヘンコウ スル。 ・・・ OVER | THIS IS MR.SCHNEIDER... / ENEMY'S UNIFORM IS AVAILABLE IN THE BASEMENT OF BUILDING NO.1. / WILL CONTACT IN THE BAND OF 12026 FROM NOW ON. ...OVER | This is resistance leader Schneider... The enemy uniform is in the basement of building 1. / From here on I'm switching contact to frequency 12026. ...Over. |

| 0x5F | ハーイ。コチラ DIANE ・・・ ココカラ ノ レンラク ハ シュウハスウ 12091 ニ ヘンコウ スルワ。 マタ ヨンデネ。 ・・・ BYE | HELLO! THIS IS DIANE... WILL CONTACT ON WAVEBAND 12091 FROM NOW ON. / ...BYE | Hi. This is Diane... From here on I'm switching contact to frequency 12091. Call me again. ...Bye. |

| 0x60 | フラッシュ・ライト ヲ ニュウシュ シタ。 | *(empty)* | Got the flashlight. |

| 0x61 | コチラ BIG BOSS ・・・ フラッシュ・ライト ? ツカイカタ ハ ワカッテイルナ 。 ・・・ OVER | *(empty)* | This is Big Boss... The flashlight? You know how to use it. ...Over. |

| 0x62 | アンテナ ヲ ニュウシュ シタ。 | *(empty)* | Got the antenna. |

| 0x63 | コチラ BIG BOSS ・・・ ボウガイ デンパ ガ デテイタ ガ、 コレデ ダイジョウブ ダ。 ・・・ OVER | THIS IS BIG BOSS... IT WAS JAMMING,BUT... OK NOW. ...OVER | This is Big Boss... There was jamming, but with this you're fine. ...Over. |

| 0x64 | コチラ SCHNEIDER ・・・ キタ エレベーター ハ ウエ ニ シカ イドウ シナイ。 ・・・ OVER | *(empty)* | This is Schneider... The north elevator only goes up. ...Over. |

| 0x65 | タスカッタ! DR・PETTROVICH ハ チカロウ ニ イル。 | RESCUED! / DR.PETTROVICH IS CONFINED IN THE BASEMENT. | You saved me! Dr. Pettrovich is in the underground dungeon. |

| 0x66 | *(empty in both)* | *(empty in both)* | |

| 0x67 | カード 5 ヲ ニュウシュ シタ。 | *(empty)* | Got card 5. |

| 0x68 | *(empty in both)* | *(empty in both)* | |

| 0x69 | コチラ SCHNEIDER ・・・ ミナミ エレベーター ハ シタ ニ シカ イドウ シナイ。 ・・・ OVER | *(empty)* | This is Schneider... The south elevator only goes down. ...Over. |

| 0x6A | コチラ SCHNEIDER ・・・ コノ サキ ハ ガス チタイダ。 ・・・ OVER | THIS IS MR.SCHNEIDER... LEAD YOU TO THE GAS ROOM! ...OVER | This is Schneider... There's a gas zone up ahead. ...Over. |

| 0x6B | タスカッタ! / コノ フロア カラ ダッシュツ スル ニハ キタ エレベーター ヲ サガス シカナイ! | RESCUED | You saved me! / The only way off this floor is to find the north elevator. |

| 0x6C | オレ ハ FIRE TROOPER !! マルヤキ ニ シテヤル!! | I'M FIRE TROOPER! / I WILL / BURN YOU ALIVE! | I am Fire Trooper!! I'll roast you alive!! |

| 0x6D | ワナ ニ ハマッタナ! / ホンモノ ノ DR・PETTROVICH ハ 2F ニ イル・・・ / シネ!! FOX HOUNDER ! | YOU ARE CAUGHT IN A TRAP. / IN FACT, / WE HAVE CONFINED DR.PETTROVICH ON THE SECOND FLOOR. / I WILL GET YOU FOX HOUNDER! | You fell into the trap! / The real Dr. Pettrovich is on floor 2... / Die, Fox Hounder!! |

| 0x6E | カード 6 ヲ ニュウシュ シタ。 | *(empty)* | Got card 6. |

| 0x6F | コチラ SCHNEIDER ・・・ コノ サキ ニ キタ エレベーター ガ アル。 ・・・ OVER | *(empty)* | This is Schneider... The north elevator is up ahead. ...Over. |

| 0x70 | コチラ SCHNEIDER ・・・ フラッシュ・ライト ハ 1F ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE FLASH LIGHT CAN BE FOUND ON THE 1ST FLOOR. ...OVER | This is Schneider... The flashlight is on floor 1. ...Over. |

| 0x71 | ハーイ。コチラ DIANE 。ゲンキ? オトシアナ ニ チュウイ シテ! ・・・ BYE | HELLO! THIS IS DIANE... PLEASE TAKE CARE, THERE MAY BE A PITFALL. ...BYE | Hi. This is Diane... How are you? Watch out for the pitfalls! ...Bye. |

| 0x72 | ハーイ。コチラ DIANE ・・・ トビラ ヲ マモッテ イル ARNOLD ハ フジミ ダワ! ニゲテ!! | HELLO! THIS IS DIANE... THE DOORKEEPER, MR.ARNOLD IS INVINCIBLE! ESCAPE! | Hi. This is Diane... Arnold, who guards the door, is immortal! Run!! |

| 0x73 | タスカッタ! サバク ヲ ワタル ニハ コンパス ガ ヒツヨウダ。 | RESCUED! / YOU MUST HAVE A COMPASS TO CROSS THE DESERT. | You saved me! You need a compass to cross the desert. |

| 0x74 | タスカッタ! / シュウハスウ 12048 デ レジスタンス ノ JENNIFER ト レンラク ガ トレルハズダ。 / JENNIFER ハ ジカ ニ サポート シテクレル。 / シカシ、プライド ガ タカイ。 / ツネ ニ、サイコウ カイキュウ デ ナイト オウトウ シテクレ ナイ ダロウ。 | RESCUED! / YOU MIGHT BE ABLE TO CONTACT JENNIFER OF RESISTANCE ON / WAVEBAND 12048. / BUT SHE IS PROUD, AND WOULDN'T ANSWER, / IF YOU WERE NOT THE EXECUTIVE. | You saved me! / On frequency 12048 you should be able to reach Jennifer, from the resistance. / Jennifer will support you from the inside. / But she is very proud. / She probably won't answer unless you have the highest rank. |

| 0x75 | コチラ JENNIFER ・・・ ロケット・ランチャー ヲ ヨウイ スルワ。 トリ ニ キテ。 ・・・ OVER | THIS IS JENNIFER... WILL ARRANGE A ROCKET LAUNCHER. / COME FOR A ROCKET LAUNCHER! ...OVER | This is Jennifer... I'll have a rocket launcher ready for you. Come and get it. ...Over. |

| 0x76 | コチラ JENNIFER ・・・ イマカラ トビラ ヲ アケルワ。 ・・・ OVER | THIS IS JENNIFER... WILL OPEN THE DOOR. ...OVER | This is Jennifer... I'm opening the door for you now. ...Over. |

| 0x77 | ロケット・ランチャー ヲ ニュウシュ シタ。 | *(empty)* | Got the rocket launcher. |

| 0x78 | コンパス ヲ ニュウシュ シタ。 | *(empty)* | Got the compass. |

| 0x79 | ゲドクザイ ヲ ニュウシュ シタ。 | *(empty)* | Got the antidote. |

| 0x7A | コチラ SCHNEIDER ・・・ コンパス ハ 2F ニ アル。 ・・・ OVER | THIS IS MR.SCHNEIDER... THE COMPASS CAN BE FOUND ON THE 2ND FLOOR. ...OVER | This is Schneider... The compass is on floor 2. ...Over. |

| 0x7B | タスカッタ! スイコウ ノ オク ガ ビル 3 ニツナガッテ イル。 | RESCUED! / THE DITCH WILL LEAD YOU TO THE NO.3 BUILDING. | You saved me! The far end of the waterway leads to building 3. |

| 0x7C | ワタシ ハ DR・PETTROVICH ダ。 ムスメ ノ ELEN ガ ヒトジチ ニ ナッテイル。 / ELEN ヲ タスケテ クレナケレバ、 METAL GEAR ニ ツイテ、ハナスコト ハ デキナイ。 / ELEN ハ ビル 1 ノ チカ ニ カンキン サレテイル。 タスケテ クレ。 | I'M DR.PETTROVICH. / MY DAUGHTER ELLEN WAS TAKEN AS HOSTAGE. / SAVE ELLEN OR,I WON'T DISCUSS METAL GEAR. | I am Dr. Pettrovich. My daughter Elen is being held hostage. / Unless you rescue her, I cannot tell you about Metal Gear. / Elen is locked up in the basement of building 1. Please save her. |

| 0x7D | ワタシ ハ DR・PETTROVICH ダ。 / METAL GEAR ハ コノ ビル カラ キタ ニ 20キロ ノ トコロ ニアル、 ビル 3 ノ チカ 100カイ ニ アル。 / METAL GEAR ノ ハカイ ホウホウ ハ ヒトツ。 ソウコウ ノ ウスイ キャクブ ニ プラスチック・バクダン セット スル。 / ジュンバン ハ R、R、L、 R、L、L、R、L、 L、R、R、L、R、 L、R、・・・ アト ハ ワスレテシマッタ! / トニカク、 16コ セット スルノダ。 / ビル 2 ヲ デル トビラ ノ カード ハ ARNOLD ガ モッテイル。ARNOLD ハ ロケット・ランチャー ニ ヨワイ! / コウウン ヲ イノル・・・ | I'M DR.PETTROVICH. / METAL GEAR IS IN 100TH BASEMENT OF BUILDING NO.3, / 20KM TO THE NORTH OF HERE. / METAL GEAR CAN BE DESTOROYED IN ONLY ONE WAY. / ATTACH PLASTIC BOMB TO THE FOOT OF METAL GEAR. / R,R,L,R,L,L,R,L,L, R,R,L,R,L,R,... IN ORDER. / I FORGOT THE REMAINDER. / ANYWAY, / SET 16 UNITS. / YOU CAN NOT, DESTOROY / IF YOU COMMIT AN ERROR IN THE ORDER. / MR.ARNOLD HAS AN I.D. CARD / TO GET OUT OF BUILDING NO.2. / YOU SHOULD USE A ROCKET LAUNCHER TO KILL MR.ARNOLD. | I am Dr. Pettrovich. / Metal Gear is on basement level 100 of building 3, 20 km north of this building. / There is only one way to destroy Metal Gear: set plastic explosive on the legs, where the armour is thin. / The order is R, R, L, R, L, L, R, L, L, R, R, L, R, L, R... I've forgotten the rest! / Anyway, you have to set 16. / Arnold has the card for the door out of building 2. Arnold is weak against the rocket launcher! / I wish you luck... |

| 0x7E | コチラ SCHNEIDER ・・・ ビル 1 ニハ、チカ ノ ナンセイ カラ ヒミツ ノ チカツウロ ガ レンラク シテイル。 ・・・ OVER | THIS IS MR.SCHNEIDER... SECRET SUBWAY FROM THE SOUTHEAST LEADS YOU TO NO.1 BUILDING. ...OVER | This is Schneider... A secret underground passage reaches building 1 from the southwest of the basement. ...Over. |

| 0x7F | ヨシ、ハイレ! | COME IN | All right, go in! |

| 0x80 | タスケテ! | HELP ME | Help! |

| 0x81 | アリガトウ・・・ ワタシ ハ DR・PETTROVICH ノ ムスメ、 ELEN 。 / チチ ハ キョウハク サレテ、 METAL GEAR ヲ ツクラサレテ イルノ。 ハヤク チチ ヲ タスケテ クダサイ。 | THANK YOU. / I'M THE DAUGHTER OF DR.PETTROVICH, ELLEN. / MY FATHER WAS FORCED TO DEVELOP METAL GEAR. / PLEASE HELP MY FATHER URGENTLY. | Thank you... I am Elen, Dr. Pettrovich's daughter. / My father is being threatened and forced to build Metal Gear. Please save my father, quickly. |

| 0x82 | ハーイ。コチラ DIANE ・・・ サソリ ノ ドク ハ ゲドクザイ ヲ ツカウ ト イイワ。 ・・・ BYE | HELLO! THIS IS DIANE... AN ANTIDOTE IS GOOD FOR THE POISON OF A SCORPION. ...BYE | Hi. This is Diane... For scorpion poison, use the antidote. ...Bye. |

| 0x83 | タスカッタ! | RESCUED | You saved me! |

| 0x84 | コチラ BIG BOSS ・・・ ヒダリ ノ トビラ ヘ ハイレ! ・・・ OVER | THIS IS BIG BOSS... ENTER THE LEFT DOOR. ...OVER | This is Big Boss... Go through the door on the left! ...Over. |

| 0x85 | コチラ BIG BOSS ・・・ ミギ ハシ ノ トラック ヘ ハイレ! ・・・ OVER | THIS IS BIG BOSS... CREEP INTO THE LORRY ON THE RIGHT SIDE. ...OVER | This is Big Boss... Get into the truck at the far right! ...Over. |

| 0x86 | コチラ JENNIFER ・・・ カベ ヲ ハカイ スルノヨ!! ・・・ OVER | THIS IS JENNIFER... YOU SHOULD BREAK DOWN THE WALL. ...OVER | This is Jennifer... Destroy the wall!! ...Over. |

| 0x87 | コチラ JENNIFER ! カベ ノ ムコウ ニ サンソボンベ ガ アルハズ!! ・・・ OVER | THIS IS JENNIFER... THERE IS AN OXYGEN CYLINDER BEYOND THE WALL. ...OVER | This is Jennifer! There should be an oxygen tank behind the wall!! ...Over. |

| 0x88 | コチラ BIG BOSS ・・・ SOLID SNAKE ! サクセン チュウシ ダ! タダチ ニ キカン セヨ。 / コレハ メイレイ ダ!! MSX ノ デンゲン ヲ キレ!! ・・・ OVER | THIS IS BIG BOSS... SOLID SNAKE! STOP THE OPERATION. SWITCH OFF YOUR MSX AT ONCE. / THIS IS THE COMMAND. ...OVER | This is Big Boss... Solid Snake! The operation is cancelled! Return at once. / That's an order!! Switch off the MSX!! ...Over. |

| 0x89 | コチラ JENNIFER ! / コノサキ ノ トビラ ヲ アケル カード ハビル 3 ノ ヒガシガワ ニ アルワ。 ソコ ハ ビル 2 ノ スイコウ ト ツナガッテ イルノヨ。 ・・・ BYE | THIS IS JENNIFER... A CARD WHICH OPEN THE NEXT DOOR LIES IN THE EAST OF BUILDING 3. / THE EASTERN SIDE LEADS TO THE DITCH OF BUILDING 2. ...OVER | This is Jennifer! / The card for the door ahead is on the east side of building 3. That place connects with the waterway of building 2. ...Bye. |

| 0x8A | コチラ SCHNEIDER ・・・ OUTER HEAVEN ノ ボス ノ ショウタイ ガ ワカッタゾ! / ナント・・・ OUTER HEAVEN ノ ボス ハ・・・ / ・・・ ワー!! ・・・ | THIS IS MR.SCHNEIDER... I HAVE DISCOVERED WHO THE BOSS OF OUTER HEAVEN IS. / THE BOSS IS.... / OH NO!! WHA.A....... | This is Schneider... I've found out who the boss of Outer Heaven is! / Believe it or not... the boss of Outer Heaven is... / ...Aaargh!!... |

| 0x8B | オレ ハ COWARD DUCK ! / ウテルモノ ナラ ウッテミロ!! | I'M COWARD DUCK! / YOU CAN'T / SHOOT ME, / CAN YOU? | I am Coward Duck! / Shoot if you dare!! |

| 0x8C | タスカッタ! / ワタシ ハ JENNIFER ノ / アニ ダ。 / ダッシュツ スルトキ ハ ヒダリハシ / ノ ハシゴ ヲ ノボレ!! | RESCUED! / I'M A BROTHER OF / JENNIFER. / CLIMB THE LEFT / LADDER / WHEN ESCAPING. | You saved me! / I am / Jennifer's brother. / To escape, climb the ladder at the far left!! |

| 0x8D | ハーイ。コチラ DIANE ! ミカタ ヲ コロサズ、タオス ホウホウ ハ ハンドガン シカ ナイワ。 ・・・ BYE | HELLO! THIS IS DIANE... / USE THE HAND GUN TO CAPTURE THE PRISONERS, NOT TO KILL THEM. ...BYE | Hi, this is Diane! The only way to take him down without killing our people is the handgun. ...Bye. |

| 0x8E | コチラ JENNIFER ・・・ カード 8 ハ COWARD DUCK ガ モッテイルワ。 / ホリョ ノ ナカニ ワタシ ノ アニ ガ イルノ! コロサナイデ・・・ / アニ ニ ナニカ アッタラ、 モウ、キョウリョク シナイワ! | THIS IS JENNIFER... COWARD DUCK HAS CARD 8. / MY BROTHER IS AMONG THE CAPTIVES. PLEASE DON'T KILL THEM. ...OVER | This is Jennifer... Coward Duck has card 8. / My brother is among the prisoners! Don't kill him... / If anything happens to my brother, I won't help you any more! |

| 0x8F | カード 8ヲ ニュウシュ シタ。 | *(empty)* | Got card 8. |

| 0x90 | タスカッタ! / OUTER HEAVEN ノ ボス ハ / FOX HOUNDER ソウシレイカン 、BIG BOSS ダ! / ナニモカモ ヤツ ノ シワザ ダ!! ダマサレルナ!! | RESCUED! / BOSS OF OUTER HEAVEN IS BIG BOSS, / GENERAL COMMANDANT OF FOX HOUND. / EVERYTHING IS DONE BY HIM. | You saved me! / The boss of Outer Heaven is... / the commander of Fox Hound, Big Boss! / He is behind everything!! Don't be fooled!! |

| 0x91 | コチラ JENNIFER !! ヒダリ ノ カベ ヲ コワスノヨ! ・・・ OVER | *(empty)* | This is Jennifer!! Break the wall on the left! ...Over. |

| 0x92 | コチラ JENNIFER ! イッキ ニ ハシルシカ、ナイワ! レーション ガ アレバ ダイジョウブヨ。 ・・・ OVER | THIS IS JENNIFER... YOU MUST RUN FAST. ...OVER | This is Jennifer! All you can do is run straight through! You'll be fine if you have rations. ...Over. |

| 0x93 | SOLID SNAKE ! ヨク ココマデ キタナ!・・・ / ・・・ ワタシ ガ FOX HOUNDER ソウシレイカン 、ソシテ、 / コノ ヨウサイ 、 OUTER HEAVEN ノ ボス、BIG BOSS ダ!! / シンイリ デアル、オマエ ニ コノ ニンム ヲ アタエタ ノモ、ウソ ノ ジョウホウ ヲ モチカエラセルタメダッタ・・・ / シカシ、 オマエ ハ ヤリスギタ。 ヤリスギタノダ! / SOLID SNAKE ! / ワタシ ハ タダデ ハ シナナイ。 ミチヅレ ニ シテヤル!! / カカッテ コイ! | SOLID SNAKE! YOU'VE FINALLY COME HERE. / YEAH,I'M BIG BOSS GENERAL COMMANDANT OF FOX HOUND. / AND IN CHARGE OF THIS FORTRESS, OUTER HEAVEN. / I GAVE YOU INSTRUCTIONS TO BRING BACK / FALSE INFORMATION OF METAL GEAR. / HOWEVER, YOU ACCOMPLISHED TOO MUCH. / YOU HAVE COMPLETELY SMASHED MY AMBITIONS. / SOLID SNAKE!! / I WILL NOT DIE ALONE. / YOU WILL JOIN ME. | Solid Snake! You've come a long way... / ...I am the commander of Fox Hound and also / the boss of this fortress, Outer Heaven: Big Boss!! / I gave this mission to you, a rookie, so that you would bring back false information... / But / you went too far. You went too far! / Solid Snake! / I won't die for nothing. I'll take you with me!! / Come on! |

| 0x94 | コチラ JENNIFER ! タバコ ヲ ツカウ ト タイマー ガ フエルワ。 イキテ カエッテネ! SOLID SNAKE ・・・ | THIS IS JENNIFER... YOU CAN EXTEND THE TIME LIMIT BY USING A CIGARETTE. / PLEASE RETURN IN SAFETY, SOLID SNAKE! | This is Jennifer! If you use the cigarettes, the timer goes up. Come back alive! Solid Snake... |

| 0x95 | コチラ DIANE ! BIG BOSS ヲ タオス ホウホウ ハ シラナイワ・・・ ソレ ハ アナタ シダイ! SOLID SNAKE ! / ・・・ ワタシ・・・ アナタ ノ コト・・・ イエ、ナンデモ ナイワ・・・ ゴブジ デ・・・ | THIS IS DIANE... I DON'T KNOW HOW TO DEFEAT BIG BOSS. IT ALL DEPENDS ON YOU. SOLID SNAKE! / I LOVE.... NO,IT WAS A MERE NOTHING! GOOD LUCK!! | This is Diane! I don't know how to beat Big Boss... That's up to you, Solid Snake! / ...I... about you... No, it's nothing... Stay safe... |

| 0x96 | キンキュウ ジタイ!! / キンキュウ ジタイ!! / OUTER HEAVEN ノ バクハ スイッチ ガ、サドウ シマシタ! / タダチ ニ ダッシュツ カツドウ ヲ オコナッテ クダサイ! | EMERGENCY!! / EMERGENCY!! / THE SELF-DESTRUCTION SWITCH OF / OUTER HEAVEN HAS BEEN ACTIVATED. / ESCAPE QUICKLY!! | Emergency!! / Emergency!! / Outer Heaven's detonation switch has been activated! / Evacuate immediately! |

| 0x97 | ガスマスク ヲ ニュウシュ シタ。 | *(empty)* | Got the gas mask. |

| 0x98 | サンソボンベ ヲ ニュウシュ シタ。 | *(empty)* | Got the oxygen tank. |

| 0x99 | カード 7 ヲ ニュウシュ シタ。 | *(empty)* | Got card 7. |

| 0x9A | コチラ BIG BOSS ・・・ ガスマスク ? ガスチタイ デ ツカウノダ。 ・・・ OVER | *(empty)* | This is Big Boss... The gas mask? Use it in the gas zone. ...Over. |

| 0x9B | コチラ SOLID SNAKE ・・・ METAL GEAR ハカイ ニ セイコウ。 OPERATION INTRUDE N313 カンリョウ シタ! / ナニモカモ オワッタ・・・ ナニモカモ・・・ / タダイマ カラ キカンスル。 ・・・ OVER | THIS IS SOLID SNAKE... METAL GEAR'S DESTRUCTION IS A SUCCESS. / OPERATION INTRUDE N313 FINISHED!... / EVERYTHING IS FINISHED. / I WILL GO BACK NOW. ...OVER | This is Solid Snake... Metal Gear destroyed. Operation Intrude N313 complete. / It's all over... All of it... / Returning now. ...Over. |

| 0x9C | ハーイ。コチラ DIANE ・・・ カレラ ハ サイレンサー ヲ モッテイルワ。 ・・・ OVER | HELLO! THIS IS DIANE... I SUPPOSE THEY HAVE A SILENCER. ...BYE | Hi. This is Diane... They have the silencer. ...Over. |

| 0x9D | コチラ STEVE・・・ DIANE ? DIANE ナラ、カイモノ ニ イッタ ママ、カエッテ イナイ ケド・・・ | *(empty)* | This is Steve... Diane? Diane went out shopping and hasn't come back yet... |

| 0x9E | コチラ STEVE・・・ DIANE ? DIANE ナラ イマ、シャワー ヲ アビテイルケド・・・ | *(empty)* | This is Steve... Diane? Diane is in the shower right now... |

| 0x9F | コチラ STEVE・・・ DIANE ? マタ オマエ カ! / モウ、DIANE ニハ チカヅカナイデ クレ!! | *(empty)* | This is Steve... Diane? You again?! / Stay away from Diane!! |

## The weapons and items of the menu

|  | Japanese (ROM) | English (ROM) | Translation |
|---|---|---|---|

| weapon 1 | ハンド ガン | HAND GUN | handgun |

| weapon 2 | サブマシンガン | SMG | submachine gun |

| weapon 3 | グレネード | GRENADE | grenade |

| weapon 4 | ロケットランチャー | ROCKET | rocket launcher |

| weapon 5 | Pバクダン | P-BOMB | P bomb |

| weapon 6 | ジライ | L-MAIN | land mines |

| weapon 7 | リモコンミサイル | MISSILE | remote-control missile |

| weapon 8 | サイレンサー | SILENCER | silencer |

| item 1 | アーマー | ARMOR | armour |

| item 2 | スーツ | SUIT | suit |

| item 3 | ライト | LIGHT | light |

| item 4 | ゴーグル | GOGGL | goggles |

| item 5 | ガスマスク | MASK | gas mask |

| item 6 | タバコ | CIGAL | cigarettes |

| item 7 | タンチキ | DETEC | detector |

| item 8 | アンテナ | ANTEN | antenna |

| item 9 | ズーム | SCOPE | zoom |

| item 10 | ボンベ | BOMBE | oxygen tank |

| item 11 | コンパス | COMPAS | compass |

| item 12 | ラッカサン | PARAC | parachute |

| item 13 | ドクケシ | ANTID | antidote |

| item 14 | カード 1 | CARD1 | card 1 |

| item 15 | カード 2 | CARD2 | card 2 |

| item 16 | カード 3 | CARD3 | card 3 |

| item 17 | カード 4 | CARD4 | card 4 |

| item 18 | カード 5 | CARD5 | card 5 |

| item 19 | カード 6 | CARD6 | card 6 |

| item 20 | カード 7 | CARD7 | card 7 |

| item 21 | カード 8 | CARD8 | card 8 |

| item 22 | レーション | RATIO | ration |

| item 23 | ハッシンキ | TRANS | transmitter |

| item 24 | ユニホーム | UNIFO | uniform |

| item 25 | ダンボール | BOX | cardboard box |

## The labels, the same in both

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

## How to extract them again

With both ROMs in the root of the repository (`metalgear.rom` and `metalgear-jp.rom`, with the SHA-1 above), `python3 tools/textos.py pagina` writes this page and its Spanish twin; `python3 tools/textos.py tabla` prints the working table with the window type of each text.
