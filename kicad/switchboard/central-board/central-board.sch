EESchema Schematic File Version 2
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
LIBS:mcp34063
LIBS:borniers
LIBS:ESP8266
LIBS:central-board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ESP-12E U2
U 1 1 58278344
P 7500 2900
F 0 "U2" H 7500 2800 50  0000 C CNN
F 1 "ESP-12E" H 7500 3000 50  0000 C CNN
F 2 "ESP8266:ESP-12E" H 7500 2900 50  0001 C CNN
F 3 "" H 7500 2900 50  0001 C CNN
F 4 "vorhanden" H 7500 2900 60  0001 C CNN "Digi-Key"
	1    7500 2900
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P3
U 1 1 58278375
P 10200 2950
F 0 "P3" H 10200 3400 50  0000 C CNN
F 1 "Conn_jack_conn_board" V 10300 2950 50  0000 C CNN
F 2 "bolay:4x2pin_50mil_header" H 10200 2950 50  0001 C CNN
F 3 "http://sullinscorp.com/drawings/89_LPPB___2NFSP-RC,_11018.pdf" H 10200 2950 50  0001 C CNN
F 4 "S9007E-04-ND" H 10200 2950 60  0001 C CNN "Digi-Key"
	1    10200 2950
	1    0    0    -1  
$EndComp
$Comp
L MC34063 U1
U 1 1 5827884A
P 3500 2300
F 0 "U1" H 3850 2650 50  0000 L CNN
F 1 "MC34063" H 3600 1950 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 3500 2300 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MC34063A-D.PDF" H 3500 2300 50  0001 C CNN
F 4 "497-7852-1-ND" H 3500 2300 60  0001 C CNN "Digi-Key"
	1    3500 2300
	1    0    0    -1  
$EndComp
$Comp
L D D3
U 1 1 58278A3D
P 1700 1850
F 0 "D3" H 1700 1950 50  0000 C CNN
F 1 "RS1MTR" H 1700 1750 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 1700 1850 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" H 1700 1850 50  0001 C CNN
F 4 "1655-1501-1-ND" H 1700 1850 60  0001 C CNN "Digi-Key"
	1    1700 1850
	0    1    1    0   
$EndComp
$Comp
L CP C1
U 1 1 58278AC0
P 2300 2250
F 0 "C1" H 2325 2350 50  0000 L CNN
F 1 "470uF" H 2325 2150 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_10x10.5" H 2338 2100 50  0001 C CNN
F 3 "" H 2300 2250 50  0001 C CNN
	1    2300 2250
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 58278B49
P 5600 2350
F 0 "C3" H 5625 2450 50  0000 L CNN
F 1 "50uF" H 5625 2250 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x7.7" H 5638 2200 50  0001 C CNN
F 3 "" H 5600 2350 50  0000 C CNN
F 4 "vorhanden" H 5600 2350 60  0001 C CNN "Digi-Key"
F 5 "100uF Kondens von reichelt" H 5600 2350 60  0001 C CNN "Bemerkungen"
	1    5600 2350
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58278BB7
P 2950 1650
F 0 "R1" V 3030 1650 50  0000 C CNN
F 1 "0.33" V 2950 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 2880 1650 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773269&DocType=DS&DocLang=English" H 2950 1650 50  0001 C CNN
F 4 "A103274CT-ND" V 2950 1650 60  0001 C CNN "Digi-Key"
	1    2950 1650
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 58278C04
P 5300 2100
F 0 "R2" V 5380 2100 50  0000 C CNN
F 1 "18k" V 5300 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5230 2100 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5300 2100 50  0001 C CNN
F 4 "311-18KERCT-ND" V 5300 2100 60  0001 C CNN "Digi-Key"
	1    5300 2100
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 58278CCD
P 5300 2550
F 0 "R3" V 5380 2550 50  0000 C CNN
F 1 "11k" V 5300 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5230 2550 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5300 2550 50  0001 C CNN
F 4 "RC1206JR-0711KL" V 5300 2550 60  0001 C CNN "Digi-Key"
	1    5300 2550
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D5
U 1 1 58278D15
P 4600 2000
F 0 "D5" H 4600 2100 50  0000 C CNN
F 1 "B140F" H 4600 1900 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 4600 2000 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/A400/B120-B160.pdf" H 4600 2000 50  0001 C CNN
F 4 "vorhanden" H 4600 2000 60  0001 C CNN "Digi-Key"
	1    4600 2000
	0    1    1    0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 58278D4E
P 4950 1850
F 0 "L1" V 4900 1850 50  0000 C CNN
F 1 "35uH" V 5050 1850 50  0000 C CNN
F 2 "bolay:SRN_1060_Power_Inductors" H 4950 1850 50  0001 C CNN
F 3 "http://www.bourns.com/docs/Product-Datasheets/SRN1060.pdf" H 4950 1850 50  0001 C CNN
F 4 "SRN1060-470MCT-ND" V 4950 1850 60  0001 C CNN "Digi-Key"
	1    4950 1850
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 58278DBD
P 2550 2600
F 0 "C2" H 2575 2700 50  0000 L CNN
F 1 "160pF" H 2575 2500 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2588 2450 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2015/06/03/CL31C151JBCNNNC.pdf" H 2550 2600 50  0001 C CNN
F 4 "1276-2811-1-ND" H 2550 2600 60  0001 C CNN "Digi-Key"
	1    2550 2600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR01
U 1 1 582792FA
P 2300 1600
F 0 "#PWR01" H 2300 1450 50  0001 C CNN
F 1 "+12V" H 2300 1740 50  0000 C CNN
F 2 "" H 2300 1600 50  0000 C CNN
F 3 "" H 2300 1600 50  0000 C CNN
	1    2300 1600
	1    0    0    -1  
$EndComp
$Comp
L +12VA #PWR02
U 1 1 5827932E
P 1000 2100
F 0 "#PWR02" H 1000 1950 50  0001 C CNN
F 1 "+12VA" H 1000 2240 50  0000 C CNN
F 2 "" H 1000 2100 50  0000 C CNN
F 3 "" H 1000 2100 50  0000 C CNN
	1    1000 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 58279362
P 3500 2850
F 0 "#PWR03" H 3500 2600 50  0001 C CNN
F 1 "GND" H 3500 2700 50  0000 C CNN
F 2 "" H 3500 2850 50  0000 C CNN
F 3 "" H 3500 2850 50  0000 C CNN
	1    3500 2850
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR04
U 1 1 582793A6
P 1000 2300
F 0 "#PWR04" H 1000 2100 50  0001 C CNN
F 1 "GNDPWR" H 1000 2170 50  0000 C CNN
F 2 "" H 1000 2250 50  0000 C CNN
F 3 "" H 1000 2250 50  0000 C CNN
	1    1000 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5827A02B
P 4600 2200
F 0 "#PWR05" H 4600 1950 50  0001 C CNN
F 1 "GND" H 4600 2050 50  0000 C CNN
F 2 "" H 4600 2200 50  0000 C CNN
F 3 "" H 4600 2200 50  0000 C CNN
	1    4600 2200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5827AA67
P 5600 1850
F 0 "#PWR06" H 5600 1700 50  0001 C CNN
F 1 "+3.3V" H 5600 1990 50  0000 C CNN
F 2 "" H 5600 1850 50  0000 C CNN
F 3 "" H 5600 1850 50  0000 C CNN
	1    5600 1850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 5827AC7B
P 1050 1900
F 0 "#FLG07" H 1050 1995 50  0001 C CNN
F 1 "PWR_FLAG" H 1050 2080 50  0000 C CNN
F 2 "" H 1050 1900 50  0000 C CNN
F 3 "" H 1050 1900 50  0000 C CNN
	1    1050 1900
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG08
U 1 1 5827ACBD
P 2000 1600
F 0 "#FLG08" H 2000 1695 50  0001 C CNN
F 1 "PWR_FLAG" H 2000 1780 50  0000 C CNN
F 2 "" H 2000 1600 50  0000 C CNN
F 3 "" H 2000 1600 50  0000 C CNN
	1    2000 1600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 5827AECA
P 5800 1850
F 0 "#FLG09" H 5800 1945 50  0001 C CNN
F 1 "PWR_FLAG" H 5800 2030 50  0000 C CNN
F 2 "" H 5800 1850 50  0000 C CNN
F 3 "" H 5800 1850 50  0000 C CNN
	1    5800 1850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG010
U 1 1 5827B172
P 3800 3000
F 0 "#FLG010" H 3800 3095 50  0001 C CNN
F 1 "PWR_FLAG" H 3800 3180 50  0000 C CNN
F 2 "" H 3800 3000 50  0000 C CNN
F 3 "" H 3800 3000 50  0000 C CNN
	1    3800 3000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR011
U 1 1 5827B4AA
P 6400 3300
F 0 "#PWR011" H 6400 3150 50  0001 C CNN
F 1 "+3.3V" H 6400 3440 50  0000 C CNN
F 2 "" H 6400 3300 50  0000 C CNN
F 3 "" H 6400 3300 50  0000 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5827B5AE
P 8500 3550
F 0 "#PWR012" H 8500 3300 50  0001 C CNN
F 1 "GND" H 8500 3400 50  0000 C CNN
F 2 "" H 8500 3550 50  0000 C CNN
F 3 "" H 8500 3550 50  0000 C CNN
	1    8500 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5827B94A
P 9850 2600
F 0 "#PWR013" H 9850 2350 50  0001 C CNN
F 1 "GND" H 9850 2450 50  0000 C CNN
F 2 "" H 9850 2600 50  0000 C CNN
F 3 "" H 9850 2600 50  0000 C CNN
	1    9850 2600
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 5827BA15
P 9550 2800
F 0 "#PWR014" H 9550 2650 50  0001 C CNN
F 1 "+3.3V" H 9550 2940 50  0000 C CNN
F 2 "" H 9550 2800 50  0000 C CNN
F 3 "" H 9550 2800 50  0000 C CNN
	1    9550 2800
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR015
U 1 1 5827BC20
P 9700 2700
F 0 "#PWR015" H 9700 2550 50  0001 C CNN
F 1 "+12V" H 9700 2840 50  0000 C CNN
F 2 "" H 9700 2700 50  0000 C CNN
F 3 "" H 9700 2700 50  0000 C CNN
	1    9700 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 58288F37
P 6500 3700
F 0 "#PWR016" H 6500 3450 50  0001 C CNN
F 1 "GND" H 6500 3550 50  0000 C CNN
F 2 "" H 6500 3700 50  0000 C CNN
F 3 "" H 6500 3700 50  0000 C CNN
	1    6500 3700
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58289433
P 6400 2400
F 0 "R4" V 6480 2400 50  0000 C CNN
F 1 "10k" V 6400 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6330 2400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 6400 2400 50  0001 C CNN
F 4 "RHM10KZCT-ND" V 6400 2400 60  0001 C CNN "Digi-Key"
	1    6400 2400
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58289485
P 6200 2400
F 0 "C4" H 6225 2500 50  0000 L CNN
F 1 "100nF" H 6225 2300 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6238 2250 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 6200 2400 50  0001 C CNN
F 4 "1276-2854-1-ND" H 6200 2400 60  0001 C CNN "Digi-Key"
	1    6200 2400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR017
U 1 1 5828983E
P 9100 3000
F 0 "#PWR017" H 9100 2850 50  0001 C CNN
F 1 "+3.3V" H 9100 3140 50  0000 C CNN
F 2 "" H 9100 3000 50  0000 C CNN
F 3 "" H 9100 3000 50  0000 C CNN
	1    9100 3000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR018
U 1 1 58289C20
P 6500 2150
F 0 "#PWR018" H 6500 2000 50  0001 C CNN
F 1 "+3.3V" H 6500 2290 50  0000 C CNN
F 2 "" H 6500 2150 50  0000 C CNN
F 3 "" H 6500 2150 50  0000 C CNN
	1    6500 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2800 5600 2500
Connection ~ 3500 2800
Wire Wire Line
	3650 1650 3650 1700
Wire Wire Line
	3100 1650 3650 1650
Wire Wire Line
	3500 1650 3500 1700
Wire Wire Line
	3350 1650 3350 1700
Connection ~ 3500 1650
Wire Wire Line
	2750 1650 2750 2100
Wire Wire Line
	2300 1600 2300 2100
Connection ~ 2300 1650
Wire Wire Line
	1350 1700 1350 1650
Wire Wire Line
	1700 1700 1700 1650
Wire Wire Line
	3500 2800 3500 2850
Wire Wire Line
	1350 2800 5600 2800
Wire Wire Line
	2550 2800 2550 2750
Wire Wire Line
	2550 2450 2650 2450
Wire Wire Line
	1350 1650 2800 1650
Connection ~ 1700 1650
Connection ~ 2750 1650
Connection ~ 3350 1650
Wire Wire Line
	2300 2400 2300 2800
Connection ~ 2550 2800
Wire Wire Line
	1350 2800 1350 2700
Connection ~ 2300 2800
Wire Wire Line
	1700 2700 1700 2800
Connection ~ 1700 2800
Wire Wire Line
	1350 2000 1350 2400
Wire Wire Line
	1700 2000 1700 2400
Wire Wire Line
	900  2150 1350 2150
Connection ~ 1350 2150
Wire Wire Line
	900  2250 1700 2250
Connection ~ 1700 2250
Wire Wire Line
	1000 2100 1000 2150
Connection ~ 1000 2150
Wire Wire Line
	1000 2300 1000 2250
Connection ~ 1000 2250
Wire Wire Line
	4600 2200 4600 2150
Wire Wire Line
	4400 1850 4650 1850
Wire Wire Line
	5300 2250 5300 2400
Wire Wire Line
	5300 2700 5300 2800
Connection ~ 5300 2800
Wire Wire Line
	5250 1850 5800 1850
Wire Wire Line
	5300 1850 5300 1950
Wire Wire Line
	5600 1850 5600 2200
Connection ~ 5300 1850
Wire Wire Line
	4350 2350 4400 2350
Wire Wire Line
	4400 2350 4400 1850
Connection ~ 4600 1850
Wire Wire Line
	4350 2500 4950 2500
Wire Wire Line
	4950 2500 4950 2350
Wire Wire Line
	4950 2350 5300 2350
Connection ~ 5300 2350
Wire Wire Line
	1050 1900 1050 2150
Connection ~ 1050 2150
Wire Wire Line
	2000 1600 2000 1650
Connection ~ 2000 1650
Connection ~ 5600 1850
Wire Wire Line
	3800 3000 3600 3000
Wire Wire Line
	3600 3000 3600 2800
Connection ~ 3600 2800
Wire Wire Line
	6400 3300 6600 3300
Wire Wire Line
	9850 2600 10000 2600
Wire Wire Line
	10000 2700 9700 2700
Wire Wire Line
	10000 2800 9550 2800
Wire Wire Line
	6500 3350 6500 3300
Connection ~ 6500 3300
Wire Wire Line
	6500 3650 6500 3700
Wire Wire Line
	8400 3000 8700 3000
Wire Wire Line
	9000 3000 9100 3000
Wire Wire Line
	8400 3200 8700 3200
Wire Wire Line
	8400 3300 8500 3300
Wire Wire Line
	8500 3300 8500 3550
Wire Wire Line
	8700 3500 8500 3500
Connection ~ 8500 3500
Wire Wire Line
	8600 1700 8600 3000
Wire Wire Line
	6200 1700 8600 1700
Wire Wire Line
	7650 1700 7650 1350
Connection ~ 8600 3000
Wire Wire Line
	6600 2600 6550 2600
Wire Wire Line
	6550 2600 6550 2550
Wire Wire Line
	6200 2800 6600 2800
Wire Wire Line
	6400 2800 6400 2550
Wire Wire Line
	6400 2250 6400 2200
Wire Wire Line
	6400 2200 6550 2200
Wire Wire Line
	6550 2200 6550 2250
Wire Wire Line
	6500 2150 6500 2200
Connection ~ 6500 2200
Wire Wire Line
	6200 1700 6200 2250
Connection ~ 7650 1700
Wire Wire Line
	6200 2550 6200 2800
Connection ~ 6400 2800
Wire Wire Line
	8400 2700 8500 2700
Wire Wire Line
	8500 2700 8500 1800
Wire Wire Line
	8500 1800 7550 1800
Wire Wire Line
	7550 1800 7550 1350
Wire Wire Line
	8400 2600 8400 1900
Wire Wire Line
	8400 1900 7450 1900
Wire Wire Line
	7450 1900 7450 1350
$Comp
L GND #PWR019
U 1 1 58289F56
P 7350 1400
F 0 "#PWR019" H 7350 1150 50  0001 C CNN
F 1 "GND" H 7350 1250 50  0000 C CNN
F 2 "" H 7350 1400 50  0000 C CNN
F 3 "" H 7350 1400 50  0000 C CNN
	1    7350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1350 7350 1400
Wire Wire Line
	8400 2800 9450 2800
Wire Wire Line
	9450 2800 9450 2900
Wire Wire Line
	9450 2900 10000 2900
Wire Wire Line
	8400 2900 9350 2900
Wire Wire Line
	9350 2900 9350 3000
Wire Wire Line
	9350 3000 10000 3000
Wire Wire Line
	8400 3100 10000 3100
NoConn ~ 6600 2700
NoConn ~ 6600 2900
NoConn ~ 6600 3000
NoConn ~ 7250 3800
NoConn ~ 7350 3800
NoConn ~ 7450 3800
NoConn ~ 7550 3800
NoConn ~ 7650 3800
NoConn ~ 7750 3800
Wire Wire Line
	10000 3200 9100 3200
Wire Wire Line
	9100 3200 9100 4100
Wire Wire Line
	9100 4100 6100 4100
Wire Wire Line
	6100 4100 6100 3200
Wire Wire Line
	6100 3200 6600 3200
Wire Wire Line
	6600 3100 6000 3100
Wire Wire Line
	6000 3100 6000 4200
Wire Wire Line
	6000 4200 9200 4200
Wire Wire Line
	9200 4200 9200 3300
Wire Wire Line
	9200 3300 10000 3300
$Comp
L PWR_FLAG #FLG020
U 1 1 5828C5AD
P 1100 2600
F 0 "#FLG020" H 1100 2695 50  0001 C CNN
F 1 "PWR_FLAG" H 1100 2780 50  0000 C CNN
F 2 "" H 1100 2600 50  0000 C CNN
F 3 "" H 1100 2600 50  0000 C CNN
	1    1100 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	1100 2250 1100 2600
$Comp
L D D1
U 1 1 58396CD9
P 1350 1850
F 0 "D1" H 1350 1950 50  0000 C CNN
F 1 "RS1MTR" H 1350 1750 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 1350 1850 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" H 1350 1850 50  0001 C CNN
F 4 "1655-1501-1-ND" H 1350 1850 60  0001 C CNN "Digi-Key"
	1    1350 1850
	0    1    1    0   
$EndComp
$Comp
L D D2
U 1 1 58396D34
P 1350 2550
F 0 "D2" H 1350 2650 50  0000 C CNN
F 1 "RS1MTR" H 1350 2450 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 1350 2550 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" H 1350 2550 50  0001 C CNN
F 4 "1655-1501-1-ND" H 1350 2550 60  0001 C CNN "Digi-Key"
	1    1350 2550
	0    1    1    0   
$EndComp
$Comp
L D D4
U 1 1 58396DA4
P 1700 2550
F 0 "D4" H 1700 2650 50  0000 C CNN
F 1 "RS1MTR" H 1700 2450 50  0000 C CNN
F 2 "Diodes_SMD:SMA_Handsoldering" H 1700 2550 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" H 1700 2550 50  0001 C CNN
F 4 "1655-1501-1-ND" H 1700 2550 60  0001 C CNN "Digi-Key"
	1    1700 2550
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 58397957
P 6500 3500
F 0 "C5" H 6525 3600 50  0000 L CNN
F 1 "100nF" H 6525 3400 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6538 3350 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 6500 3500 50  0001 C CNN
F 4 "1276-2854-1-ND" H 6500 3500 60  0001 C CNN "Digi-Key"
	1    6500 3500
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 58397D9E
P 6550 2400
F 0 "R5" V 6630 2400 50  0000 C CNN
F 1 "10k" V 6550 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6480 2400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 6550 2400 50  0001 C CNN
F 4 "RHM10KZCT-ND" V 6550 2400 60  0001 C CNN "Digi-Key"
	1    6550 2400
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 58398026
P 8700 3350
F 0 "R6" V 8780 3350 50  0000 C CNN
F 1 "10k" V 8700 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8630 3350 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8700 3350 50  0001 C CNN
F 4 "RHM10KZCT-ND" V 8700 3350 60  0001 C CNN "Digi-Key"
	1    8700 3350
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 583980EC
P 8850 3000
F 0 "R7" V 8930 3000 50  0000 C CNN
F 1 "10k" V 8850 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 3000 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 3000 50  0001 C CNN
F 4 "RHM10KZCT-ND" V 8850 3000 60  0001 C CNN "Digi-Key"
	1    8850 3000
	0    1    1    0   
$EndComp
$Comp
L CONN_01X06 P1
U 1 1 58398ED0
P 700 2400
F 0 "P1" H 700 2750 50  0000 C CNN
F 1 "CONN_01X06_Power" V 800 2400 50  0000 C CNN
F 2 "Connect:bornier6" H 700 2400 50  0001 C CNN
F 3 "http://www.on-shore.com/wp-content/uploads/2015/09/ed120ds.pdf" H 700 2400 50  0001 C CNN
F 4 "ED2229-ND" H 700 2400 60  0001 C CNN "Digi-Key"
	1    700  2400
	-1   0    0    -1  
$EndComp
Connection ~ 1100 2250
$Comp
L CONN_01X06 P2
U 1 1 583999F0
P 7600 1150
F 0 "P2" H 7600 1500 50  0000 C CNN
F 1 "Conn_ftdi_serial" V 7700 1150 50  0000 C CNN
F 2 "bolay:6x1pin_50mil_header" H 7600 1150 50  0001 C CNN
F 3 "http://www.sullinscorp.com/drawings/86_LPPB___1NFS_-RC,_10965.pdf" H 7600 1150 50  0001 C CNN
F 4 "S9005E-06-ND" H 7600 1150 60  0001 C CNN "Digi-Key"
	1    7600 1150
	0    -1   -1   0   
$EndComp
NoConn ~ 7750 1350
NoConn ~ 7850 1350
NoConn ~ 900  2350
NoConn ~ 900  2450
NoConn ~ 900  2550
NoConn ~ 900  2650
$EndSCHEMATC