EESchema Schematic File Version 2
LIBS:motion-sensor-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:bolay-library
LIBS:motion-sensor-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Motion Sensor with PWM LED Strip"
Date "2015-12-13"
Rev "0.1"
Comp "Jörg Bolay"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328P-A IC1
U 1 1 566926EE
P 4150 4700
F 0 "IC1" H 3400 5950 50  0000 L BNN
F 1 "ATMEGA328P-A AU 1537" H 4550 3300 50  0000 L BNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 4150 4700 50  0001 C CIN
F 3 "http://www.atmel.com/images/atmel-8271-8-bit-avr-microcontroller-atmega48a-48pa-88a-88pa-168a-168pa-328-328p_datasheet_summary.pdf" H 4150 4700 50  0001 C CNN
F 4 "vorhanden" H 4150 4700 60  0001 C CNN "Digi-Key"
	1    4150 4700
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR1
U 1 1 56692781
P 1200 1150
F 0 "#PWR1" H 1200 1000 50  0001 C CNN
F 1 "+12V" H 1200 1290 50  0000 C CNN
F 2 "" H 1200 1150 50  0000 C CNN
F 3 "" H 1200 1150 50  0000 C CNN
	1    1200 1150
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 56692A0A
P 1500 1750
F 0 "C1" H 1525 1850 50  0000 L CNN
F 1 "100uF" H 1525 1650 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x7.7" H 1538 1600 50  0001 C CNN
F 3 "https://www.reichelt.de/index.html?&ACTION=7&LA=3&OPEN=0&INDEX=0&FILENAME=B300%252FDATASHEET_PANASONIC_VFP_SERIES.pdf" H 1500 1750 50  0001 C CNN
F 4 "vorhanden" H 1500 1750 60  0001 C CNN "Digi-Key"
	1    1500 1750
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D1
U 1 1 56692BF4
P 3650 1550
F 0 "D1" H 3650 1650 50  0000 C CNN
F 1 "B140F" H 3650 1450 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 3650 1550 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/A400/B120-B160.pdf" H 3650 1550 50  0001 C CNN
F 4 "vorhanden" H 3650 1550 60  0001 C CNN "Digi-Key"
	1    3650 1550
	0    1    1    0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 56692C8F
P 4000 1300
F 0 "L1" V 3950 1300 50  0000 C CNN
F 1 "35uH" V 4100 1300 50  0000 C CNN
F 2 "bolay library:SRN_1060_Power_Inductors" H 4000 1300 50  0001 C CNN
F 3 "http://www.bourns.com/docs/Product-Datasheets/SRN1060.pdf" H 4000 1300 50  0001 C CNN
F 4 "SRN1060-470MCT-ND" V 4000 1300 60  0001 C CNN "Digi-Key"
	1    4000 1300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR2
U 1 1 56693012
P 1200 2350
F 0 "#PWR2" H 1200 2100 50  0001 C CNN
F 1 "GND" H 1200 2200 50  0000 C CNN
F 2 "" H 1200 2350 50  0000 C CNN
F 3 "" H 1200 2350 50  0000 C CNN
	1    1200 2350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR12
U 1 1 56693E9A
P 4700 1250
F 0 "#PWR12" H 4700 1100 50  0001 C CNN
F 1 "+3.3V" H 4700 1390 50  0000 C CNN
F 2 "" H 4700 1250 50  0000 C CNN
F 3 "" H 4700 1250 50  0000 C CNN
	1    4700 1250
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 566944E6
P 2900 4500
F 0 "C3" H 2925 4600 50  0000 L CNN
F 1 "100nF" H 2925 4400 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2938 4350 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 2900 4500 50  0001 C CNN
F 4 "1276-2854-1-ND" H 2900 4500 60  0001 C CNN "Digi-Key"
	1    2900 4500
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 56694619
P 8850 4500
F 0 "R5" V 8930 4500 50  0000 C CNN
F 1 "1K" V 8850 4500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 4500 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 8850 4500 50  0001 C CNN
F 4 "311-1.0KERCT-ND" V 8850 4500 60  0001 C CNN "Digi-Key"
	1    8850 4500
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 56694914
P 9100 4800
F 0 "R6" V 9180 4800 50  0000 C CNN
F 1 "1M" V 9100 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9030 4800 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 9100 4800 50  0001 C CNN
F 4 "311-1.0MERCT-ND" V 9100 4800 60  0001 C CNN "Digi-Key"
	1    9100 4800
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q1
U 1 1 56694EF9
P 9400 4700
F 0 "Q1" H 9700 4750 50  0000 R CNN
F 1 "FDN337N" H 10050 4650 50  0000 R CNN
F 2 "bolay library:SOT-23_Handsoldering-FDN-337N" H 9600 4800 50  0001 C CNN
F 3 "https://www.fairchildsemi.com/datasheets/FD/FDN337N.pdf" H 9400 4700 50  0001 C CNN
F 4 "FDN337NTR-ND" H 9400 4700 60  0001 C CNN "Digi-Key"
	1    9400 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR19
U 1 1 56695647
P 9500 5050
F 0 "#PWR19" H 9500 4800 50  0001 C CNN
F 1 "GND" H 9500 4900 50  0000 C CNN
F 2 "" H 9500 5050 50  0000 C CNN
F 3 "" H 9500 5050 50  0000 C CNN
	1    9500 5050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR7
U 1 1 56696591
P 2900 3400
F 0 "#PWR7" H 2900 3250 50  0001 C CNN
F 1 "+3.3V" H 2900 3540 50  0000 C CNN
F 2 "" H 2900 3400 50  0000 C CNN
F 3 "" H 2900 3400 50  0000 C CNN
	1    2900 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR8
U 1 1 566965BA
P 2900 6000
F 0 "#PWR8" H 2900 5750 50  0001 C CNN
F 1 "GND" H 2900 5850 50  0000 C CNN
F 2 "" H 2900 6000 50  0000 C CNN
F 3 "" H 2900 6000 50  0000 C CNN
	1    2900 6000
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P1
U 1 1 5669831C
P 4050 7150
F 0 "P1" H 4050 7350 50  0000 C CNN
F 1 "ISP" H 4050 6950 50  0000 C CNN
F 2 "bolay library:6x1pin_50mil_header" H 4050 5950 50  0000 C CNN
F 3 "http://www.sullinscorp.com/drawings/86_LPPB___1NFS_-RC,_10965.pdf" H 4050 5950 50  0001 C CNN
F 4 "S9005E-06-ND" H 4050 7150 60  0001 C CNN "Digi-Key"
	1    4050 7150
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON1
U 1 1 566AC197
P 900 1700
F 0 "CON1" H 900 1950 50  0000 C CNN
F 1 "LUM 1613-14" H 900 1500 50  0000 C CNN
F 2 "bolay library:barrel_jack_ds_1613_14" H 900 1700 50  0001 C CNN
F 3 "https://www.reichelt.de/index.html?&ACTION=7&LA=3&OPEN=0&INDEX=0&FILENAME=C160%252FDS_1613_14.pdf" H 900 1700 50  0001 C CNN
F 4 "vorhanden" H 900 1700 60  0001 C CNN "Digi-Key"
	1    900  1700
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 566AD052
P 10600 4200
F 0 "D4" H 10600 4300 50  0000 C CNN
F 1 "LED_STRIP" H 10600 4100 50  0000 C CNN
F 2 "" H 10600 4200 50  0000 C CNN
F 3 "" H 10600 4200 50  0000 C CNN
F 4 "vorhanden" H 10600 4200 60  0001 C CNN "Digi-Key"
	1    10600 4200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR20
U 1 1 566AFC0E
P 9550 3100
F 0 "#PWR20" H 9550 2850 50  0001 C CNN
F 1 "GND" H 9550 2950 50  0000 C CNN
F 2 "" H 9550 3100 50  0000 C CNN
F 3 "" H 9550 3100 50  0000 C CNN
	1    9550 3100
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_INV SW1
U 1 1 566B00C1
P 10000 1450
F 0 "SW1" H 9800 1600 50  0000 C CNN
F 1 "Motion-Sensor-1" H 9850 1300 50  0000 C CNN
F 2 "" H 10000 1450 50  0000 C CNN
F 3 "" H 10000 1450 50  0000 C CNN
F 4 "vorhanden" H 10000 1450 60  0001 C CNN "Digi-Key"
	1    10000 1450
	0    1    1    0   
$EndComp
$Comp
L +12V #PWR18
U 1 1 566B026D
P 9400 4000
F 0 "#PWR18" H 9400 3850 50  0001 C CNN
F 1 "+12V" H 9400 4140 50  0000 C CNN
F 2 "" H 9400 4000 50  0000 C CNN
F 3 "" H 9400 4000 50  0000 C CNN
	1    9400 4000
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_INV SW2
U 1 1 566B0514
P 10500 1450
F 0 "SW2" H 10300 1600 50  0000 C CNN
F 1 "Motion-Sensor-2" H 10350 1300 50  0000 C CNN
F 2 "" H 10500 1450 50  0000 C CNN
F 3 "" H 10500 1450 50  0000 C CNN
F 4 "vorhanden" H 10500 1450 60  0001 C CNN "Digi-Key"
	1    10500 1450
	0    1    1    0   
$EndComp
Text GLabel 5250 3900 2    60   Input ~ 0
MOSI
Text GLabel 5250 4000 2    60   Input ~ 0
MISO
Text GLabel 5250 4100 2    60   Input ~ 0
SCK
Text GLabel 5250 5050 2    60   Input ~ 0
RESET
$Comp
L +3.3V #PWR10
U 1 1 566B729E
P 4400 7000
F 0 "#PWR10" H 4400 6850 50  0001 C CNN
F 1 "+3.3V" H 4400 7140 50  0000 C CNN
F 2 "" H 4400 7000 50  0000 C CNN
F 3 "" H 4400 7000 50  0000 C CNN
	1    4400 7000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR11
U 1 1 566B7663
P 4400 7300
F 0 "#PWR11" H 4400 7050 50  0001 C CNN
F 1 "GND" H 4400 7150 50  0000 C CNN
F 2 "" H 4400 7300 50  0000 C CNN
F 3 "" H 4400 7300 50  0000 C CNN
	1    4400 7300
	1    0    0    -1  
$EndComp
Text GLabel 4400 7150 2    60   Input ~ 0
MOSI
Text GLabel 3700 7000 0    60   Input ~ 0
MISO
Text GLabel 3700 7300 0    60   Input ~ 0
RESET
Text GLabel 3700 7150 0    60   Input ~ 0
SCK
Text GLabel 8000 2250 0    60   Input ~ 0
Motion_Sensor_Pin_1
Text GLabel 8000 3300 0    60   Input ~ 0
Motion_Sensor_Pin_2
Text GLabel 5250 5500 2    60   Input ~ 0
Motion_Sensor_Pin_1
Text GLabel 5250 5400 2    60   Input ~ 0
Motion_Sensor_Pin_2
Text GLabel 8600 4500 0    60   Input ~ 0
PWM_Pin
$Comp
L CONN_02X04 P2
U 1 1 566B21B4
P 7600 5750
F 0 "P2" H 7600 6000 50  0000 C CNN
F 1 "ESP8266" H 7600 5500 50  0000 C CNN
F 2 "bolay library:8pin_Header_SMD" H 7600 4550 50  0001 C CNN
F 3 "http://sullinscorp.com/drawings/103_NPxCxx2KFMx-RC,_10488-G.pdf" H 7600 4550 50  0001 C CNN
F 4 "S5674-ND" H 7600 5750 60  0001 C CNN "Digi-Key"
	1    7600 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR15
U 1 1 566B2638
P 7200 5900
F 0 "#PWR15" H 7200 5650 50  0001 C CNN
F 1 "GND" H 7200 5750 50  0000 C CNN
F 2 "" H 7200 5900 50  0000 C CNN
F 3 "" H 7200 5900 50  0000 C CNN
	1    7200 5900
	1    0    0    -1  
$EndComp
Text GLabel 5250 5200 2    60   Input ~ 0
RXD
Text GLabel 5250 5300 2    60   Input ~ 0
TXD
Text GLabel 7950 5900 2    60   Input ~ 0
RXD
Text GLabel 7250 5600 0    60   Input ~ 0
TXD
Text GLabel 5250 4650 2    60   Input ~ 0
LED_PIN
$Comp
L LED D2
U 1 1 566B37F7
P 6100 1800
F 0 "D2" H 6100 1900 50  0000 C CNN
F 1 "LED" H 6100 1700 50  0000 C CNN
F 2 "LEDs:LED_1206" H 6100 1800 50  0001 C CNN
F 3 "http://optoelectronics.liteon.com/upload/download/DS22-2000-253/S_110_LTST-C230KRKT.pdf" H 6100 1800 50  0001 C CNN
F 4 "160-1457-1-ND" H 6100 1800 60  0001 C CNN "Digi-Key"
	1    6100 1800
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 566B38A0
P 6100 2200
F 0 "R4" V 6180 2200 50  0000 C CNN
F 1 "560" V 6100 2200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6030 2200 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 6100 2200 50  0001 C CNN
F 4 "311-560ERCT-ND" V 6100 2200 60  0001 C CNN "Digi-Key"
	1    6100 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR14
U 1 1 566B3930
P 6100 2400
F 0 "#PWR14" H 6100 2150 50  0001 C CNN
F 1 "GND" H 6100 2250 50  0000 C CNN
F 2 "" H 6100 2400 50  0000 C CNN
F 3 "" H 6100 2400 50  0000 C CNN
	1    6100 2400
	1    0    0    -1  
$EndComp
Text GLabel 6000 1500 0    60   Input ~ 0
LED_PIN
NoConn ~ 3250 4950
NoConn ~ 3250 5050
NoConn ~ 5150 5900
NoConn ~ 5150 5700
NoConn ~ 5150 5600
NoConn ~ 5150 4950
NoConn ~ 5150 4850
NoConn ~ 5150 4750
NoConn ~ 5150 4300
NoConn ~ 5150 4200
NoConn ~ 5150 3800
NoConn ~ 5150 3700
NoConn ~ 5150 3600
NoConn ~ 7350 5800
NoConn ~ 7350 5700
Text GLabel 5250 5800 2    60   Input ~ 0
PWM_Pin
$Comp
L PWR_FLAG #FLG1
U 1 1 566B6761
P 1400 1200
F 0 "#FLG1" H 1400 1295 50  0001 C CNN
F 1 "PWR_FLAG" H 1400 1380 50  0000 C CNN
F 2 "" H 1400 1200 50  0000 C CNN
F 3 "" H 1400 1200 50  0000 C CNN
	1    1400 1200
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG2
U 1 1 566B6917
P 1450 2350
F 0 "#FLG2" H 1450 2445 50  0001 C CNN
F 1 "PWR_FLAG" H 1450 2530 50  0000 C CNN
F 2 "" H 1450 2350 50  0000 C CNN
F 3 "" H 1450 2350 50  0000 C CNN
	1    1450 2350
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG3
U 1 1 566B6ECE
P 4900 1250
F 0 "#FLG3" H 4900 1345 50  0001 C CNN
F 1 "PWR_FLAG" H 4900 1430 50  0000 C CNN
F 2 "" H 4900 1250 50  0000 C CNN
F 3 "" H 4900 1250 50  0000 C CNN
	1    4900 1250
	1    0    0    -1  
$EndComp
NoConn ~ 3250 4200
$Comp
L +3.3V #PWR16
U 1 1 566C0F40
P 8000 5600
F 0 "#PWR16" H 8000 5450 50  0001 C CNN
F 1 "+3.3V" H 8000 5740 50  0000 C CNN
F 2 "" H 8000 5600 50  0000 C CNN
F 3 "" H 8000 5600 50  0000 C CNN
	1    8000 5600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR17
U 1 1 566C1158
P 8450 1350
F 0 "#PWR17" H 8450 1200 50  0001 C CNN
F 1 "+3.3V" H 8450 1490 50  0000 C CNN
F 2 "" H 8450 1350 50  0000 C CNN
F 3 "" H 8450 1350 50  0000 C CNN
	1    8450 1350
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 566C9FBD
P 8350 5850
F 0 "C5" H 8375 5950 50  0000 L CNN
F 1 "100nF" H 8375 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 8388 5700 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 8350 5850 50  0001 C CNN
F 4 "1276-2854-1-ND" H 8350 5850 60  0001 C CNN "Digi-Key"
	1    8350 5850
	1    0    0    -1  
$EndComp
Text Notes 650  900  0    60   ~ 0
Step Down Converter
Text Notes 8200 4000 0    60   ~ 0
Mosfet Treiber für PWM
Text Notes 7150 1050 0    60   ~ 0
Anschluss Bewegungsmelder
Text Notes 5700 2500 1    60   ~ 0
Status LED
$Comp
L CP CIN1
U 1 1 5669299B
P 4600 1650
F 0 "CIN1" H 4625 1750 50  0000 L CNN
F 1 "50uF" H 4625 1550 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x7.7" H 4638 1500 50  0001 C CNN
F 3 "" H 4600 1650 50  0000 C CNN
F 4 "vorhanden" H 4600 1650 60  0001 C CNN "Digi-Key"
F 5 "100uF Kondens von reichelt" H 4600 1650 60  0001 C CNN "Bemerkungen"
	1    4600 1650
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 566F1004
P 2000 1200
F 0 "R1" V 2080 1200 50  0000 C CNN
F 1 "0.33" V 2000 1200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1930 1200 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773269&DocType=DS&DocLang=English" H 2000 1200 50  0001 C CNN
F 4 "R_SC" V 2000 1200 60  0001 C CNN "Schaltregler-Name"
F 5 "A103274CT-ND" V 2000 1200 60  0001 C CNN "Digi-Key"
	1    2000 1200
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 566F132C
P 4300 1600
F 0 "R2" V 4380 1600 50  0000 C CNN
F 1 "18k" V 4300 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 4230 1600 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4300 1600 50  0001 C CNN
F 4 "311-18KERCT-ND" V 4300 1600 60  0001 C CNN "Digi-Key"
	1    4300 1600
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 566F13A6
P 4300 2050
F 0 "R3" H 4380 2050 50  0000 C CNN
F 1 "11k" V 4300 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 4230 2050 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 4300 2050 50  0001 C CNN
F 4 "RC1206JR-0711KL" H 4300 2050 60  0001 C CNN "Digi-Key"
	1    4300 2050
	-1   0    0    1   
$EndComp
$Comp
L MC34063-RESCUE-motion-sensor U1
U 1 1 566F3D0D
P 2600 1800
F 0 "U1" H 2950 2150 50  0000 L CNN
F 1 "MC34063" H 2700 1450 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 2600 1800 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MC34063A-D.PDF" H 2600 1800 50  0001 C CNN
F 4 "497-7852-1-ND" H 2600 1800 60  0001 C CNN "Digi-Key"
	1    2600 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 566F4A0F
P 3650 1750
F 0 "#PWR9" H 3650 1500 50  0001 C CNN
F 1 "GND" H 3650 1600 50  0000 C CNN
F 2 "" H 3650 1750 50  0000 C CNN
F 3 "" H 3650 1750 50  0000 C CNN
	1    3650 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR13
U 1 1 56693308
P 4800 2350
F 0 "#PWR13" H 4800 2100 50  0001 C CNN
F 1 "GND" H 4800 2200 50  0000 C CNN
F 2 "" H 4800 2350 50  0000 C CNN
F 3 "" H 4800 2350 50  0000 C CNN
	1    4800 2350
	1    0    0    -1  
$EndComp
Wire Notes Line
	5550 2600 5550 1400
Wire Notes Line
	6250 2600 5550 2600
Wire Notes Line
	6250 1400 6250 2600
Wire Notes Line
	5550 1400 6250 1400
Wire Notes Line
	6950 850  6950 3450
Wire Notes Line
	10800 850  6950 850 
Wire Notes Line
	10800 3450 10800 850 
Wire Notes Line
	6950 3450 10800 3450
Wire Notes Line
	10750 5250 10750 3800
Wire Notes Line
	8100 5250 10750 5250
Wire Notes Line
	8100 3800 8100 5250
Wire Notes Line
	10750 3800 8100 3800
Wire Notes Line
	5050 2700 500  2700
Wire Notes Line
	5050 750  5050 2700
Wire Notes Line
	500  750  5050 750 
Connection ~ 8000 5700
Connection ~ 7300 5900
Wire Wire Line
	7300 6050 7300 5900
Wire Wire Line
	8350 6050 7300 6050
Wire Wire Line
	8350 6000 8350 6050
Wire Wire Line
	5250 5800 5150 5800
Wire Wire Line
	6100 2350 6100 2400
Wire Wire Line
	6100 2000 6100 2050
Wire Wire Line
	6100 1500 6100 1600
Wire Wire Line
	6000 1500 6100 1500
Wire Wire Line
	5150 4650 5250 4650
Wire Wire Line
	7850 5900 7950 5900
Wire Wire Line
	7250 5600 7350 5600
Wire Wire Line
	5150 5300 5250 5300
Wire Wire Line
	5250 5200 5150 5200
Wire Wire Line
	7850 5700 8350 5700
Wire Wire Line
	8000 5600 8000 5800
Wire Wire Line
	7200 5900 7350 5900
Wire Wire Line
	8000 5600 7850 5600
Wire Wire Line
	8700 4500 8600 4500
Wire Wire Line
	3800 7300 3700 7300
Wire Wire Line
	3800 7000 3700 7000
Wire Wire Line
	4400 7150 4300 7150
Wire Wire Line
	3800 7300 3800 7250
Wire Wire Line
	3800 7150 3700 7150
Wire Wire Line
	3800 7000 3800 7050
Wire Wire Line
	4400 7250 4400 7300
Wire Wire Line
	4300 7250 4400 7250
Wire Wire Line
	4400 7050 4300 7050
Wire Wire Line
	4400 7000 4400 7050
Wire Wire Line
	5250 5050 5150 5050
Wire Wire Line
	5250 3900 5150 3900
Wire Wire Line
	5250 4000 5150 4000
Wire Wire Line
	5250 4100 5150 4100
Wire Wire Line
	10400 2200 10400 1950
Wire Wire Line
	10100 1950 10100 2150
Wire Wire Line
	10500 900  10500 950 
Wire Wire Line
	10750 900  10500 900 
Wire Wire Line
	10750 3300 10750 900 
Wire Wire Line
	10000 900  10000 950 
Wire Wire Line
	9700 900  10000 900 
Wire Wire Line
	9700 2250 9700 900 
Wire Wire Line
	10600 4450 10600 4400
Wire Wire Line
	9500 4450 10600 4450
Wire Wire Line
	10600 3950 10600 4000
Wire Wire Line
	9750 3950 10600 3950
Connection ~ 2900 5900
Connection ~ 2900 3600
Connection ~ 2900 3900
Wire Wire Line
	2900 3900 3250 3900
Connection ~ 2900 5700
Wire Wire Line
	3250 5700 2900 5700
Connection ~ 2900 5800
Wire Wire Line
	2900 5800 3250 5800
Wire Wire Line
	2900 4650 2900 6000
Wire Wire Line
	2900 5900 3250 5900
Connection ~ 2900 3700
Wire Wire Line
	2900 3700 3250 3700
Wire Wire Line
	2900 3400 2900 4350
Wire Wire Line
	3250 3600 2900 3600
Connection ~ 9500 4950
Wire Wire Line
	9100 4950 9500 4950
Wire Wire Line
	9500 4900 9500 5050
Wire Wire Line
	9100 4650 9100 4500
Wire Wire Line
	9100 4500 9000 4500
Wire Wire Line
	1200 2350 1450 2350
Wire Wire Line
	1200 1700 1200 2350
Connection ~ 1200 1800
Wire Wire Line
	1200 2300 4800 2300
Connection ~ 1200 2300
Connection ~ 2600 2300
Wire Wire Line
	4300 1300 4300 1450
Wire Wire Line
	4300 1750 4300 1900
Wire Wire Line
	4300 2300 4300 2200
Connection ~ 4300 2300
Wire Wire Line
	3450 2000 3900 2000
Wire Wire Line
	3900 2000 3900 1800
Wire Wire Line
	3900 1800 4300 1800
Connection ~ 4300 1800
Wire Wire Line
	1500 1900 1500 2300
Connection ~ 1500 2300
Wire Wire Line
	1200 1150 1200 1600
Connection ~ 1200 1200
Wire Wire Line
	1200 1200 1850 1200
Connection ~ 1400 1200
Wire Wire Line
	3450 1300 3700 1300
Connection ~ 4300 1300
Wire Wire Line
	2150 1200 2750 1200
Connection ~ 2450 1200
Connection ~ 2600 1200
Wire Wire Line
	1800 1200 1800 1600
Wire Wire Line
	1800 1600 1850 1600
Wire Wire Line
	1500 1200 1800 1200
Connection ~ 1800 1200
Wire Wire Line
	1500 1600 1500 1200
Connection ~ 1500 1200
Wire Wire Line
	1700 1950 1750 1950
Wire Wire Line
	3450 1300 3450 1850
Wire Wire Line
	3650 1700 3650 1750
Wire Wire Line
	3650 1400 3650 1300
Connection ~ 3650 1300
Wire Wire Line
	4800 2300 4800 2350
Wire Wire Line
	4700 1300 4700 1250
Wire Wire Line
	4900 1300 4900 1250
Connection ~ 4700 1300
Wire Wire Line
	4600 1300 4600 1500
Connection ~ 4600 1300
Wire Wire Line
	4600 1800 4600 2300
Connection ~ 4600 2300
Wire Notes Line
	500  2700 500  750 
Wire Wire Line
	4300 1300 4900 1300
$Comp
L C C2
U 1 1 566F646F
P 1700 2100
F 0 "C2" H 1725 2200 50  0000 L CNN
F 1 "160pF" H 1725 2000 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1738 1950 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2015/06/03/CL31C151JBCNNNC.pdf" H 1700 2100 50  0001 C CNN
F 4 "1276-2811-1-ND" H 1700 2100 60  0001 C CNN "Digi-Key"
	1    1700 2100
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5671D8BE
P 8200 2050
F 0 "C4" H 8225 2150 50  0000 L CNN
F 1 "100nF" H 8225 1950 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 8238 1900 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 8200 2050 50  0001 C CNN
F 4 "1276-2854-1-ND" H 8200 2050 60  0001 C CNN "Digi-Key"
	1    8200 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2250 1700 2300
Connection ~ 1700 2300
Wire Wire Line
	8000 5800 7850 5800
Wire Wire Line
	9400 1200 9400 3250
Wire Wire Line
	9400 2050 9100 2050
Connection ~ 9400 1300
Connection ~ 9400 2050
Connection ~ 9400 2400
Connection ~ 9400 2500
Wire Wire Line
	8450 1350 8450 3250
Connection ~ 8450 2050
Wire Wire Line
	8450 2050 8800 2050
Wire Wire Line
	8200 1900 8450 1900
Connection ~ 8450 1900
Wire Wire Line
	8200 2200 10400 2200
Connection ~ 9400 2200
Wire Wire Line
	8900 2250 8900 2050
Wire Wire Line
	8000 2250 9700 2250
Wire Wire Line
	8450 3250 8800 3250
Wire Wire Line
	8000 3300 10750 3300
Wire Wire Line
	8900 3300 8900 3250
Connection ~ 8900 2250
Connection ~ 8900 3300
Wire Wire Line
	9900 2200 9900 1950
Connection ~ 9900 2200
Wire Wire Line
	8800 2050 8800 2150
Wire Wire Line
	8800 2150 10600 2150
Connection ~ 10100 2150
Wire Wire Line
	10600 2150 10600 1950
NoConn ~ 9000 2050
NoConn ~ 9000 3250
Wire Wire Line
	9400 3250 9100 3250
Wire Wire Line
	9550 3100 9400 3100
Connection ~ 9400 3100
$Comp
L BARREL_JACK CON2
U 1 1 56823177
P 10050 4200
F 0 "CON2" H 10050 4450 50  0000 C CNN
F 1 "LUM 1613-14" H 10050 4000 50  0000 C CNN
F 2 "bolay library:barrel_jack_ds_1613_14" H 10050 4200 50  0001 C CNN
F 3 "https://www.reichelt.de/index.html?&ACTION=7&LA=3&OPEN=0&INDEX=0&FILENAME=C160%252FDS_1613_14.pdf" H 10050 4200 50  0001 C CNN
F 4 "vorhanden" H 10050 4200 60  0001 C CNN "Digi-Key"
	1    10050 4200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9750 4100 9750 3950
$Comp
L D_Schottky D3
U 1 1 5682436C
P 9550 4100
F 0 "D3" H 9550 4200 50  0000 C CNN
F 1 "B140F" H 9550 4000 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 9550 4100 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/A400/B120-B160.pdf" H 9550 4100 50  0001 C CNN
F 4 "vorhanden" H 9550 4100 60  0001 C CNN "Digi-Key"
	1    9550 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 4100 9750 4100
Wire Wire Line
	9400 4100 9400 4000
$Comp
L Case U2
U 1 1 56825B43
P 6500 7500
F 0 "U2" H 6500 7300 60  0000 C CNN
F 1 "Case" H 6550 7700 60  0000 C CNN
F 2 "" H 6500 7500 60  0000 C CNN
F 3 "http://www.hammondmfg.com/pdf/1551H.pdf" H 6500 7500 60  0001 C CNN
F 4 "HM361-ND" H 6500 7500 60  0001 C CNN "Digi-Key"
	1    6500 7500
	1    0    0    -1  
$EndComp
$Comp
L RJ10_4p4c J2
U 1 1 56912E30
P 8900 2800
F 0 "J2" H 9100 3300 50  0000 C CNN
F 1 "RJ10_4p4c" H 8750 3300 50  0000 C CNN
F 2 "bolay library:RJ10_SMD_4p4c" H 8900 2800 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/73306.pdf" H 8900 2800 50  0001 C CNN
F 4 "609-4469-1-ND" H 8900 2800 60  0001 C CNN "Digi-Key"
	1    8900 2800
	1    0    0    -1  
$EndComp
$Comp
L RJ10_4p4c J1
U 1 1 5691303D
P 8900 1600
F 0 "J1" H 9100 2100 50  0000 C CNN
F 1 "RJ10_4p4c" H 8750 2100 50  0000 C CNN
F 2 "bolay library:RJ10_SMD_4p4c" H 8900 1600 50  0001 C CNN
F 3 "http://portal.fciconnect.com/Comergent//fci/drawing/73306.pdf" H 8900 1600 50  0001 C CNN
F 4 "609-4469-1-ND" H 8900 1600 60  0001 C CNN "Digi-Key"
	1    8900 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5400 5250 5400
Wire Wire Line
	5150 5500 5250 5500
NoConn ~ 5150 4450
NoConn ~ 5150 4550
$Comp
L +3.3V #PWR3
U 1 1 56B23B4C
P 1850 3400
F 0 "#PWR3" H 1850 3250 50  0001 C CNN
F 1 "+3.3V" H 1850 3540 50  0000 C CNN
F 2 "" H 1850 3400 50  0000 C CNN
F 3 "" H 1850 3400 50  0000 C CNN
	1    1850 3400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR5
U 1 1 56B23BAE
P 2250 3400
F 0 "#PWR5" H 2250 3250 50  0001 C CNN
F 1 "+3.3V" H 2250 3540 50  0000 C CNN
F 2 "" H 2250 3400 50  0000 C CNN
F 3 "" H 2250 3400 50  0000 C CNN
	1    2250 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 56B23D32
P 1850 4150
F 0 "#PWR4" H 1850 3900 50  0001 C CNN
F 1 "GND" H 1850 4000 50  0000 C CNN
F 2 "" H 1850 4150 50  0000 C CNN
F 3 "" H 1850 4150 50  0000 C CNN
	1    1850 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 56B23D94
P 2250 4150
F 0 "#PWR6" H 2250 3900 50  0001 C CNN
F 1 "GND" H 2250 4000 50  0000 C CNN
F 2 "" H 2250 4150 50  0000 C CNN
F 3 "" H 2250 4150 50  0000 C CNN
	1    2250 4150
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 56B23ECF
P 2050 3500
F 0 "R7" V 2130 3500 50  0000 C CNN
F 1 "0" V 2050 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 3500 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2050 3500 50  0001 C CNN
F 4 "311-0.0ERCT-ND" H 2050 3500 60  0001 C CNN "Digi-Key"
	1    2050 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 3400 1850 3500
Wire Wire Line
	1850 3500 1900 3500
Wire Wire Line
	2200 3500 2250 3500
Wire Wire Line
	2250 3500 2250 3400
Wire Wire Line
	2250 3900 2250 4150
Wire Wire Line
	2250 4050 2200 4050
Wire Wire Line
	1900 4050 1850 4050
Wire Wire Line
	1850 3900 1850 4150
$Comp
L R R8
U 1 1 56B243CB
P 2050 4050
F 0 "R8" V 2130 4050 50  0000 C CNN
F 1 "0" V 2050 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 4050 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2050 4050 50  0001 C CNN
F 4 "311-0.0ERCT-ND" H 2050 4050 60  0001 C CNN "Digi-Key"
	1    2050 4050
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 56B24DF4
P 2050 3900
F 0 "R9" V 2130 3900 50  0000 C CNN
F 1 "0" V 2050 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1980 3900 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 2050 3900 50  0001 C CNN
F 4 "311-0.0ERCT-ND" H 2050 3900 60  0001 C CNN "Digi-Key"
	1    2050 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 3900 2250 3900
Connection ~ 2250 4050
Wire Wire Line
	1900 3900 1850 3900
Connection ~ 1850 4050
Wire Wire Line
	9200 4600 9200 4700
Wire Wire Line
	9200 4600 9100 4600
Connection ~ 9100 4600
$Comp
L R R10
U 1 1 56C89AC4
P 9550 4300
F 0 "R10" V 9630 4300 50  0000 C CNN
F 1 "0" V 9550 4300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9480 4300 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 9550 4300 50  0001 C CNN
F 4 "311-0.0ERCT-ND" H 9550 4300 60  0001 C CNN "Digi-Key"
	1    9550 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	9750 4300 9700 4300
Wire Wire Line
	9500 4450 9500 4500
Connection ~ 9750 4450
Wire Wire Line
	9750 4200 9400 4200
Wire Wire Line
	9400 4200 9400 4300
Wire Wire Line
	9750 4450 9750 4300
$EndSCHEMATC
