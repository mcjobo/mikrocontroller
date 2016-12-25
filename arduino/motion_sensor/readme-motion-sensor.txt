Dieses Projekt ist für den Bewegungsmelder, da der sowohl unter dem Bett als auch in der Küche für die Beleuchtung der Arbeitsplatte zuständig ist. In Zusammenarbeit mit dem mqtt_lib.ino

Zum Auslesen der Fuses kann folgendes Kommando verwendet werden:
avrdude  -b 19200 -c avrispmkII -p m328p -v -U lfuse:r:-:i -B 32
Das "-B" ist wichtig, um den Programmer soweit auszubremsen, dass er den atmega im Auslieferungszustand lesen / beschreiben kann. Ausgeliefert wird der atmega mit einer internen Clock von 1Mhz 


Es muss aus dem Auslieferungszustand die Fuses auf folgenden Wert geschrieben werden
avrdude  -b 19200 -c avrispmkII -p m328p -v -U lfuse:w:0xe2:m -U hfuse:w:0xd9:m -U efuse:w:0xff:m -B 32

Für den Atmega 328pb kann über das "-F" Flag der Atmega zur Zusammenarbeit gebracht werden.

Die boards.txt Datei der Arduino IDE wurde angepasst um dieses Setup zu unterstützen. Diese Datei liegt unter: 
~/.arduino15/packages/arduino/hardware/avr/1.6.14/boards.txt

##############################################################

atmega328.name=ATmega328 (8 MHz internal clock)

atmega328.upload.protocol=stk500
atmega328.upload.maximum_size=30720
atmega328.upload.speed=57600
atmega328.upload.tool=avrdude
atmega328.build.board=ATMEGA_328

atmega328.bootloader.tool=avrdude
atmega328.bootloader.low_fuses=0xE2
atmega328.bootloader.high_fuses=0xD9
atmega328.bootloader.extended_fuses=0x05
atmega328.bootloader.path=arduino:atmega
atmega328.bootloader.file=atmega/ATmegaBOOT_168_atmega328.hex
atmega328.bootloader.unlock_bits=0x3F
atmega328.bootloader.lock_bits=0x0F

atmega328.build.mcu=atmega328p
atmega328.build.f_cpu=8000000L
atmega328.build.core=arduino:arduino
atmega328.build.variant=arduino:standard


##############################################################


Der Atmega 328PB wird von avrdude direkt noch nicht unterstützt. Es reicht hier aber in der /etc/avrdude/avrdude.conf den Abschnitt für den 328p zu kopieren und nochmal einzufügen. Zum Beispiel so:

part parent "m328"
    id                  = "m328p";
    desc                = "ATmega328P";
    signature           = 0x1e 0x95 0x0F;

    ocdrev              = 1;
;


part parent "m328"
    id                  = "m328pb";
    desc                = "ATmega328PB";
    signature           = 0x1e 0x95 0x16;

    ocdrev              = 1;
;


Es scheint ein Arduino Packet zu geben das den 328pb direkt unterstützt. Hier die entsprechende URL:
https://github.com/watterott/ATmega328PB-Testing


