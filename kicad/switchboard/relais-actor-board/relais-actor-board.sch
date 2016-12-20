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
LIBS:relais-actor-board-cache
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
L PCF8574 U1
U 1 1 5825F8E2
P 4400 3900
F 0 "U1" H 4050 4500 50  0000 L CNN
F 1 "PCF8574" H 4500 4500 50  0000 L CNN
F 2 "SMD_Packages:SO-16-W" H 4400 3900 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCF8574_PCF8574A.pdf" H 4400 3900 50  0001 C CNN
F 4 "568-1076-5-ND" H 4400 3900 60  0001 C CNN "Digi-Key"
	1    4400 3900
	1    0    0    -1  
$EndComp
$Comp
L Relay K1
U 1 1 5825FF5C
P 7400 1100
F 0 "K1" H 7350 1250 30  0000 C CNN
F 1 "G5LE-1A4" H 7350 950 30  0000 C CNN
F 2 "bolay:Relais-12V-Schlieser" H 6700 1400 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1461402&DocType=Customer+Drawing&DocLang=English" H 6700 1400 60  0001 C CNN
F 4 "PB876-ND" H 7400 1100 60  0001 C CNN "Digi-Key"
	1    7400 1100
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q1
U 1 1 58260E0B
P 6650 1500
F 0 "Q1" H 6950 1550 50  0000 R CNN
F 1 "FDN337N" H 6800 1750 50  0000 R CNN
F 2 "bolay:SOT-23_Handsoldering-FDN-337N" H 6850 1600 50  0001 C CNN
F 3 "https://www.fairchildsemi.com/datasheets/FD/FDN337N.pdf" H 6650 1500 50  0001 C CNN
F 4 "FDN337NTR-ND" H 6650 1500 60  0001 C CNN "Digi-Key"
	1    6650 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 58260FC6
P 6750 1750
F 0 "#PWR01" H 6750 1500 50  0001 C CNN
F 1 "GND" H 6750 1600 50  0000 C CNN
F 2 "" H 6750 1750 50  0000 C CNN
F 3 "" H 6750 1750 50  0000 C CNN
	1    6750 1750
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58261026
P 5950 1400
F 0 "R1" V 6030 1400 50  0000 C CNN
F 1 "1K" V 5950 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5880 1400 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5950 1400 50  0001 C CNN
F 4 "311-1.0KERCT-ND" V 5950 1400 60  0001 C CNN "Digi-Key"
	1    5950 1400
	0    1    1    0   
$EndComp
$Comp
L R 1M1
U 1 1 5826105E
P 6250 1550
F 0 "1M1" V 6330 1550 50  0000 C CNN
F 1 "1M" V 6250 1550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6180 1550 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 6250 1550 50  0001 C CNN
F 4 "311-1.0MERCT-ND" V 6250 1550 60  0001 C CNN "Digi-Key"
	1    6250 1550
	-1   0    0    1   
$EndComp
$Comp
L +12VA #PWR02
U 1 1 582610C6
P 7250 850
F 0 "#PWR02" H 7250 700 50  0001 C CNN
F 1 "+12VA" H 7250 990 50  0000 C CNN
F 2 "" H 7250 850 50  0000 C CNN
F 3 "" H 7250 850 50  0000 C CNN
	1    7250 850 
	1    0    0    -1  
$EndComp
$Comp
L Relay K2
U 1 1 58261900
P 7400 1800
F 0 "K2" H 7350 1950 30  0000 C CNN
F 1 "G5LE-1A4" H 7350 1650 30  0000 C CNN
F 2 "bolay:Relais-12V-Schlieser" H 6700 2100 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1461402&DocType=Customer+Drawing&DocLang=English" H 6700 2100 60  0001 C CNN
F 4 "PB876-ND" H 7400 1800 60  0001 C CNN "Digi-Key"
	1    7400 1800
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q2
U 1 1 58261906
P 6650 2200
F 0 "Q2" H 6950 2250 50  0000 R CNN
F 1 "FDN337N" H 6750 2400 50  0000 R CNN
F 2 "bolay:SOT-23_Handsoldering-FDN-337N" H 6850 2300 50  0001 C CNN
F 3 "https://www.fairchildsemi.com/datasheets/FD/FDN337N.pdf" H 6650 2200 50  0001 C CNN
F 4 "FDN337NTR-ND" H 6650 2200 60  0001 C CNN "Digi-Key"
	1    6650 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5826190C
P 6750 2450
F 0 "#PWR03" H 6750 2200 50  0001 C CNN
F 1 "GND" H 6750 2300 50  0000 C CNN
F 2 "" H 6750 2450 50  0000 C CNN
F 3 "" H 6750 2450 50  0000 C CNN
	1    6750 2450
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 58261912
P 5950 2100
F 0 "R2" V 6030 2100 50  0000 C CNN
F 1 "1K" V 5950 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5880 2100 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5950 2100 50  0001 C CNN
F 4 "311-1.0KERCT-ND" V 5950 2100 60  0001 C CNN "Digi-Key"
	1    5950 2100
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 58261918
P 6250 2250
F 0 "R9" V 6330 2250 50  0000 C CNN
F 1 "1M" V 6250 2250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6180 2250 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 6250 2250 50  0001 C CNN
F 4 "311-1.0MERCT-ND" V 6250 2250 60  0001 C CNN "Digi-Key"
	1    6250 2250
	-1   0    0    1   
$EndComp
$Comp
L Relay K4
U 1 1 58261D1F
P 7400 3200
F 0 "K4" H 7350 3350 30  0000 C CNN
F 1 "G5LE-1A4" H 7350 3050 30  0000 C CNN
F 2 "bolay:Relais-12V-Schlieser" H 6700 3500 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1461402&DocType=Customer+Drawing&DocLang=English" H 6700 3500 60  0001 C CNN
F 4 "PB876-ND" H 7400 3200 60  0001 C CNN "Digi-Key"
	1    7400 3200
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q4
U 1 1 58261D25
P 6650 3600
F 0 "Q4" H 6950 3650 50  0000 R CNN
F 1 "FDN337N" H 6750 3800 50  0000 R CNN
F 2 "bolay:SOT-23_Handsoldering-FDN-337N" H 6850 3700 50  0001 C CNN
F 3 "https://www.fairchildsemi.com/datasheets/FD/FDN337N.pdf" H 6650 3600 50  0001 C CNN
F 4 "FDN337NTR-ND" H 6650 3600 60  0001 C CNN "Digi-Key"
	1    6650 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 58261D2B
P 6750 3850
F 0 "#PWR04" H 6750 3600 50  0001 C CNN
F 1 "GND" H 6750 3700 50  0000 C CNN
F 2 "" H 6750 3850 50  0000 C CNN
F 3 "" H 6750 3850 50  0000 C CNN
	1    6750 3850
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58261D31
P 5950 3500
F 0 "R4" V 6030 3500 50  0000 C CNN
F 1 "1K" V 5950 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5880 3500 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5950 3500 50  0001 C CNN
F 4 "311-1.0KERCT-ND" V 5950 3500 60  0001 C CNN "Digi-Key"
	1    5950 3500
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 58261D37
P 6250 3650
F 0 "R11" V 6330 3650 50  0000 C CNN
F 1 "1M" V 6250 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6180 3650 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 6250 3650 50  0001 C CNN
F 4 "311-1.0MERCT-ND" V 6250 3650 60  0001 C CNN "Digi-Key"
	1    6250 3650
	-1   0    0    1   
$EndComp
$Comp
L +12VA #PWR05
U 1 1 58261F3B
P 7250 2950
F 0 "#PWR05" H 7250 2800 50  0001 C CNN
F 1 "+12VA" H 7250 3090 50  0000 C CNN
F 2 "" H 7250 2950 50  0000 C CNN
F 3 "" H 7250 2950 50  0000 C CNN
	1    7250 2950
	1    0    0    -1  
$EndComp
$Comp
L Relay K3
U 1 1 58261F41
P 7400 2500
F 0 "K3" H 7350 2650 30  0000 C CNN
F 1 "G5LE-1A4" H 7350 2350 30  0000 C CNN
F 2 "bolay:Relais-12V-Schlieser" H 6700 2800 60  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1461402&DocType=Customer+Drawing&DocLang=English" H 6700 2800 60  0001 C CNN
F 4 "PB876-ND" H 7400 2500 60  0001 C CNN "Digi-Key"
	1    7400 2500
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q3
U 1 1 58261F47
P 6650 2900
F 0 "Q3" H 6950 2950 50  0000 R CNN
F 1 "FDN337N" H 6750 3100 50  0000 R CNN
F 2 "bolay:SOT-23_Handsoldering-FDN-337N" H 6850 3000 50  0001 C CNN
F 3 "https://www.fairchildsemi.com/datasheets/FD/FDN337N.pdf" H 6650 2900 50  0001 C CNN
F 4 "FDN337NTR-ND" H 6650 2900 60  0001 C CNN "Digi-Key"
	1    6650 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58261F4D
P 6750 3150
F 0 "#PWR06" H 6750 2900 50  0001 C CNN
F 1 "GND" H 6750 3000 50  0000 C CNN
F 2 "" H 6750 3150 50  0000 C CNN
F 3 "" H 6750 3150 50  0000 C CNN
	1    6750 3150
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 58261F53
P 5950 2800
F 0 "R3" V 6030 2800 50  0000 C CNN
F 1 "1K" V 5950 2800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5880 2800 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 5950 2800 50  0001 C CNN
F 4 "311-1.0KERCT-ND" V 5950 2800 60  0001 C CNN "Digi-Key"
	1    5950 2800
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 58261F59
P 6250 2950
F 0 "R10" V 6330 2950 50  0000 C CNN
F 1 "1M" V 6250 2950 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6180 2950 50  0001 C CNN
F 3 "http://www.yageo.com.tw/exep/pages/download/literatures/PYu-R_INT-thick_7.pdf" H 6250 2950 50  0001 C CNN
F 4 "311-1.0MERCT-ND" V 6250 2950 60  0001 C CNN "Digi-Key"
	1    6250 2950
	-1   0    0    1   
$EndComp
$Comp
L +12VA #PWR07
U 1 1 58261F5F
P 7250 2250
F 0 "#PWR07" H 7250 2100 50  0001 C CNN
F 1 "+12VA" H 7250 2390 50  0000 C CNN
F 2 "" H 7250 2250 50  0000 C CNN
F 3 "" H 7250 2250 50  0000 C CNN
	1    7250 2250
	1    0    0    -1  
$EndComp
$Comp
L +12VA #PWR08
U 1 1 5826191E
P 7250 1550
F 0 "#PWR08" H 7250 1400 50  0001 C CNN
F 1 "+12VA" H 7250 1690 50  0000 C CNN
F 2 "" H 7250 1550 50  0000 C CNN
F 3 "" H 7250 1550 50  0000 C CNN
	1    7250 1550
	1    0    0    -1  
$EndComp
$Comp
L D D1
U 1 1 582643BF
P 6950 1100
F 0 "D1" H 6950 1200 50  0000 C CNN
F 1 "1N4148" H 6950 1000 50  0000 C CNN
F 2 "Diodes_SMD:SOD-123" H 6950 1100 50  0001 C CNN
F 3 "http://www.diodes.com/_files/datasheets/ds30086.pdf" H 6950 1100 50  0001 C CNN
F 4 "1N4148W-FDICT-ND" H 6950 1100 60  0001 C CNN "Digi-Key"
	1    6950 1100
	0    1    1    0   
$EndComp
$Comp
L D D2
U 1 1 58264696
P 6950 1800
F 0 "D2" H 6950 1900 50  0000 C CNN
F 1 "1N4148" H 6950 1700 50  0000 C CNN
F 2 "Diodes_SMD:SOD-123" H 6950 1800 50  0001 C CNN
F 3 "http://www.diodes.com/_files/datasheets/ds30086.pdf" H 6950 1800 50  0001 C CNN
F 4 "1N4148W-FDICT-ND" H 6950 1800 60  0001 C CNN "Digi-Key"
	1    6950 1800
	0    1    1    0   
$EndComp
$Comp
L D D3
U 1 1 58264794
P 6950 2500
F 0 "D3" H 6950 2600 50  0000 C CNN
F 1 "1N4148" H 6950 2400 50  0000 C CNN
F 2 "Diodes_SMD:SOD-123" H 6950 2500 50  0001 C CNN
F 3 "http://www.diodes.com/_files/datasheets/ds30086.pdf" H 6950 2500 50  0001 C CNN
F 4 "1N4148W-FDICT-ND" H 6950 2500 60  0001 C CNN "Digi-Key"
	1    6950 2500
	0    1    1    0   
$EndComp
$Comp
L D D4
U 1 1 582649EA
P 6950 3200
F 0 "D4" H 6950 3300 50  0000 C CNN
F 1 "1N4148" H 6950 3100 50  0000 C CNN
F 2 "Diodes_SMD:SOD-123" H 6950 3200 50  0001 C CNN
F 3 "http://www.diodes.com/_files/datasheets/ds30086.pdf" H 6950 3200 50  0001 C CNN
F 4 "1N4148W-FDICT-ND" H 6950 3200 60  0001 C CNN "Digi-Key"
	1    6950 3200
	0    1    1    0   
$EndComp
$Comp
L CONN_01X08 P1
U 1 1 5826EF76
P 1800 3850
F 0 "P1" H 1800 4300 50  0000 C CNN
F 1 "Conn_jack_conn_board" V 1900 3850 50  0000 C CNN
F 2 "bolay:4x2pin_50mil_header" H 1800 3850 50  0001 C CNN
F 3 "http://sullinscorp.com/drawings/89_LPPB___2NFSP-RC,_11018.pdf" H 1800 3850 50  0001 C CNN
F 4 "S9007E-04-ND" H 1800 3850 60  0001 C CNN "Digi-Key"
	1    1800 3850
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 5826F2AD
P 4400 3150
F 0 "#PWR09" H 4400 3000 50  0001 C CNN
F 1 "+3.3V" H 4400 3290 50  0000 C CNN
F 2 "" H 4400 3150 50  0000 C CNN
F 3 "" H 4400 3150 50  0000 C CNN
	1    4400 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5826F31B
P 4400 4650
F 0 "#PWR010" H 4400 4400 50  0001 C CNN
F 1 "GND" H 4400 4500 50  0000 C CNN
F 2 "" H 4400 4650 50  0000 C CNN
F 3 "" H 4400 4650 50  0000 C CNN
	1    4400 4650
	1    0    0    -1  
$EndComp
$Comp
L JUMPER3 JP3
U 1 1 582708C6
P 2900 3900
F 0 "JP3" H 2950 3800 50  0000 L CNN
F 1 "SJ" H 2900 4000 50  0000 C BNN
F 2 "bolay:solder-jumper-3er" H 2900 3900 50  0001 C CNN
F 3 "" H 2900 3900 50  0000 C CNN
	1    2900 3900
	0    -1   -1   0   
$EndComp
$Comp
L JUMPER3 JP1
U 1 1 582709E7
P 3200 3900
F 0 "JP1" H 3250 3800 50  0000 L CNN
F 1 "SJ" H 3200 4000 50  0000 C BNN
F 2 "bolay:solder-jumper-3er" H 3200 3900 50  0001 C CNN
F 3 "" H 3200 3900 50  0000 C CNN
	1    3200 3900
	0    -1   -1   0   
$EndComp
$Comp
L JUMPER3 JP2
U 1 1 58270A9E
P 3500 3900
F 0 "JP2" H 3550 3800 50  0000 L CNN
F 1 "SJ" H 3500 4000 50  0000 C BNN
F 2 "bolay:solder-jumper-3er" H 3500 3900 50  0001 C CNN
F 3 "" H 3500 3900 50  0000 C CNN
	1    3500 3900
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR011
U 1 1 58270BA6
P 2750 3650
F 0 "#PWR011" H 2750 3500 50  0001 C CNN
F 1 "+3.3V" H 2750 3790 50  0000 C CNN
F 2 "" H 2750 3650 50  0000 C CNN
F 3 "" H 2750 3650 50  0000 C CNN
	1    2750 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 58270C41
P 2750 4150
F 0 "#PWR012" H 2750 3900 50  0001 C CNN
F 1 "GND" H 2750 4000 50  0000 C CNN
F 2 "" H 2750 4150 50  0000 C CNN
F 3 "" H 2750 4150 50  0000 C CNN
	1    2750 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 582714D1
P 2050 4200
F 0 "#PWR013" H 2050 3950 50  0001 C CNN
F 1 "GND" H 2050 4050 50  0000 C CNN
F 2 "" H 2050 4200 50  0000 C CNN
F 3 "" H 2050 4200 50  0000 C CNN
	1    2050 4200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 5827156C
P 2450 4000
F 0 "#PWR014" H 2450 3850 50  0001 C CNN
F 1 "+3.3V" H 2450 4140 50  0000 C CNN
F 2 "" H 2450 4000 50  0000 C CNN
F 3 "" H 2450 4000 50  0000 C CNN
	1    2450 4000
	1    0    0    -1  
$EndComp
$Comp
L +12VA #PWR015
U 1 1 58271967
P 2250 4100
F 0 "#PWR015" H 2250 3950 50  0001 C CNN
F 1 "+12VA" H 2250 4240 50  0000 C CNN
F 2 "" H 2250 4100 50  0000 C CNN
F 3 "" H 2250 4100 50  0000 C CNN
	1    2250 4100
	1    0    0    -1  
$EndComp
NoConn ~ 4900 3900
NoConn ~ 4900 4000
NoConn ~ 4900 4100
NoConn ~ 4900 4200
NoConn ~ 3900 4300
NoConn ~ 2000 3500
NoConn ~ 2000 3600
NoConn ~ 2000 3700
$Comp
L PWR_FLAG #FLG016
U 1 1 58275D66
P 3000 2000
F 0 "#FLG016" H 3000 2095 50  0001 C CNN
F 1 "PWR_FLAG" H 3000 2180 50  0000 C CNN
F 2 "" H 3000 2000 50  0000 C CNN
F 3 "" H 3000 2000 50  0000 C CNN
	1    3000 2000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR017
U 1 1 58275DCC
P 3250 2000
F 0 "#PWR017" H 3250 1850 50  0001 C CNN
F 1 "+3.3V" H 3250 2140 50  0000 C CNN
F 2 "" H 3250 2000 50  0000 C CNN
F 3 "" H 3250 2000 50  0000 C CNN
	1    3250 2000
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG018
U 1 1 58275E2B
P 3000 2300
F 0 "#FLG018" H 3000 2395 50  0001 C CNN
F 1 "PWR_FLAG" H 3000 2480 50  0000 C CNN
F 2 "" H 3000 2300 50  0000 C CNN
F 3 "" H 3000 2300 50  0000 C CNN
	1    3000 2300
	1    0    0    -1  
$EndComp
$Comp
L +12VA #PWR019
U 1 1 58275E8A
P 3250 2300
F 0 "#PWR019" H 3250 2150 50  0001 C CNN
F 1 "+12VA" H 3250 2440 50  0000 C CNN
F 2 "" H 3250 2300 50  0000 C CNN
F 3 "" H 3250 2300 50  0000 C CNN
	1    3250 2300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR020
U 1 1 58275FC9
P 3250 2600
F 0 "#PWR020" H 3250 2450 50  0001 C CNN
F 1 "VCC" H 3250 2750 50  0000 C CNN
F 2 "" H 3250 2600 50  0000 C CNN
F 3 "" H 3250 2600 50  0000 C CNN
	1    3250 2600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG021
U 1 1 58276028
P 3000 2600
F 0 "#FLG021" H 3000 2695 50  0001 C CNN
F 1 "PWR_FLAG" H 3000 2780 50  0000 C CNN
F 2 "" H 3000 2600 50  0000 C CNN
F 3 "" H 3000 2600 50  0000 C CNN
	1    3000 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 582763F6
P 3250 2850
F 0 "#PWR022" H 3250 2600 50  0001 C CNN
F 1 "GND" H 3250 2700 50  0000 C CNN
F 2 "" H 3250 2850 50  0000 C CNN
F 3 "" H 3250 2850 50  0000 C CNN
	1    3250 2850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG023
U 1 1 58276455
P 3000 2850
F 0 "#FLG023" H 3000 2945 50  0001 C CNN
F 1 "PWR_FLAG" H 3000 3030 50  0000 C CNN
F 2 "" H 3000 2850 50  0000 C CNN
F 3 "" H 3000 2850 50  0000 C CNN
	1    3000 2850
	1    0    0    -1  
$EndComp
NoConn ~ 7450 900 
NoConn ~ 7450 1600
NoConn ~ 7450 2300
NoConn ~ 7450 3000
$Comp
L CONN_01X06 P2
U 1 1 582898FB
P 9550 1550
F 0 "P2" H 9550 1900 50  0000 C CNN
F 1 "Conn_Licht_1" V 9650 1550 50  0000 C CNN
F 2 "Connect:bornier6" H 9550 1550 50  0001 C CNN
F 3 "http://www.on-shore.com/wp-content/uploads/2015/09/ed120ds.pdf" H 9550 1550 50  0001 C CNN
F 4 "ED2229-ND" H 9550 1550 60  0001 C CNN "Digi-Key"
	1    9550 1550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P3
U 1 1 5828997B
P 9550 2850
F 0 "P3" H 9550 3200 50  0000 C CNN
F 1 "Conn_Licht_2" V 9650 2850 50  0000 C CNN
F 2 "Connect:bornier6" H 9550 2850 50  0001 C CNN
F 3 "http://www.on-shore.com/wp-content/uploads/2015/09/ed120ds.pdf" H 9550 2850 50  0001 C CNN
F 4 "ED2229-ND" H 9550 2850 60  0001 C CNN "Digi-Key"
	1    9550 2850
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5830B1D2
P 3700 4500
F 0 "C3" H 3725 4600 50  0000 L CNN
F 1 "100nF" H 3725 4400 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3738 4350 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 3700 4500 50  0001 C CNN
F 4 "1276-2854-1-ND" H 3700 4500 60  0001 C CNN "Digi-Key"
	1    3700 4500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR024
U 1 1 5830B315
P 3700 4300
F 0 "#PWR024" H 3700 4150 50  0001 C CNN
F 1 "+3.3V" H 3700 4440 50  0000 C CNN
F 2 "" H 3700 4300 50  0000 C CNN
F 3 "" H 3700 4300 50  0000 C CNN
	1    3700 4300
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5830BAA9
P 2350 4250
F 0 "C1" H 2375 4350 50  0000 L CNN
F 1 "100nF" H 2375 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2388 4100 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 2350 4250 50  0001 C CNN
F 4 "1276-2854-1-ND" H 2350 4250 60  0001 C CNN "Digi-Key"
	1    2350 4250
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5830BB48
P 2550 4250
F 0 "C2" H 2575 4350 50  0000 L CNN
F 1 "100nF" H 2575 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2588 4100 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 2550 4250 50  0001 C CNN
F 4 "1276-2854-1-ND" H 2550 4250 60  0001 C CNN "Digi-Key"
	1    2550 4250
	1    0    0    -1  
$EndComp
NoConn ~ 9350 1300
NoConn ~ 9350 1600
NoConn ~ 9350 2600
NoConn ~ 9350 2900
$Comp
L R R8
U 1 1 5831609C
P 7100 3450
F 0 "R8" V 7180 3450 50  0000 C CNN
F 1 "150" V 7100 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7030 3450 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7100 3450 50  0001 C CNN
F 4 "RHM150YCT-ND" V 7100 3450 60  0001 C CNN "Digi-Key"
	1    7100 3450
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 583167DF
P 7100 2750
F 0 "R7" V 7180 2750 50  0000 C CNN
F 1 "150" V 7100 2750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7030 2750 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7100 2750 50  0001 C CNN
F 4 "RHM150YCT-ND" V 7100 2750 60  0001 C CNN "Digi-Key"
	1    7100 2750
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 58316A69
P 7100 2050
F 0 "R6" V 7180 2050 50  0000 C CNN
F 1 "150" V 7100 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7030 2050 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7100 2050 50  0001 C CNN
F 4 "RHM150YCT-ND" V 7100 2050 60  0001 C CNN "Digi-Key"
	1    7100 2050
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 58316AF6
P 7000 1350
F 0 "R5" V 7080 1350 50  0000 C CNN
F 1 "150" V 7000 1350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6930 1350 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7000 1350 50  0001 C CNN
F 4 "RHM150YCT-ND" V 7000 1350 60  0001 C CNN "Digi-Key"
	1    7000 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 850  7250 900 
Wire Wire Line
	6750 1700 6750 1750
Wire Wire Line
	6250 1700 6750 1700
Wire Wire Line
	6450 1500 6350 1500
Wire Wire Line
	6350 1500 6350 1400
Wire Wire Line
	6350 1400 6100 1400
Connection ~ 6250 1400
Wire Wire Line
	7250 1550 7250 1600
Wire Wire Line
	6750 2400 6750 2450
Wire Wire Line
	6250 2400 6750 2400
Wire Wire Line
	6450 2200 6350 2200
Wire Wire Line
	6350 2200 6350 2100
Wire Wire Line
	6350 2100 6100 2100
Connection ~ 6250 2100
Wire Wire Line
	7250 2950 7250 3000
Wire Wire Line
	6750 3800 6750 3850
Wire Wire Line
	6250 3800 6750 3800
Wire Wire Line
	6450 3600 6350 3600
Wire Wire Line
	6350 3600 6350 3500
Wire Wire Line
	6350 3500 6100 3500
Connection ~ 6250 3500
Wire Wire Line
	7250 2250 7250 2300
Wire Wire Line
	6750 3100 6750 3150
Wire Wire Line
	6250 3100 6750 3100
Wire Wire Line
	6450 2900 6350 2900
Wire Wire Line
	6350 2900 6350 2800
Wire Wire Line
	6350 2800 6100 2800
Connection ~ 6250 2800
Wire Wire Line
	6950 3050 6950 3000
Wire Wire Line
	6950 3000 7250 3000
Wire Wire Line
	6950 2350 6950 2300
Wire Wire Line
	6950 2300 7250 2300
Wire Wire Line
	6950 1650 6950 1600
Wire Wire Line
	6950 1600 7250 1600
Wire Wire Line
	6950 950  6950 900 
Wire Wire Line
	6950 900  7250 900 
Wire Wire Line
	5100 1400 5100 3800
Wire Wire Line
	5100 1400 5800 1400
Wire Wire Line
	5800 2100 5200 2100
Wire Wire Line
	5300 2800 5800 2800
Wire Wire Line
	5800 3500 5400 3500
Wire Wire Line
	4400 3200 4400 3150
Wire Wire Line
	4400 4650 4400 4600
Wire Wire Line
	2750 3650 3500 3650
Connection ~ 3200 3650
Connection ~ 2900 3650
Wire Wire Line
	2750 4150 3500 4150
Connection ~ 2900 4150
Connection ~ 3200 4150
Wire Wire Line
	3900 3900 3600 3900
Wire Wire Line
	3900 3800 3400 3800
Wire Wire Line
	3400 3800 3400 3900
Wire Wire Line
	3400 3900 3300 3900
Wire Wire Line
	3900 4000 3050 4000
Wire Wire Line
	3050 4000 3050 3900
Wire Wire Line
	3050 3900 3000 3900
Wire Wire Line
	2950 3600 3900 3600
Wire Wire Line
	2950 3600 2950 3450
Wire Wire Line
	2950 3450 2300 3450
Wire Wire Line
	2300 3450 2300 3900
Wire Wire Line
	2300 3900 2000 3900
Wire Wire Line
	3900 3500 3050 3500
Wire Wire Line
	3050 3500 3050 3350
Wire Wire Line
	3050 3350 2200 3350
Wire Wire Line
	2200 3350 2200 3800
Wire Wire Line
	2200 3800 2000 3800
Wire Wire Line
	2000 4200 2200 4200
Wire Wire Line
	2000 4100 2550 4100
Wire Wire Line
	2000 4000 2450 4000
Wire Wire Line
	3000 2000 3250 2000
Wire Wire Line
	3000 2300 3250 2300
Wire Wire Line
	3000 2600 3250 2600
Wire Wire Line
	3000 2850 3250 2850
Wire Wire Line
	8550 1800 9350 1800
Wire Wire Line
	8550 1800 8550 2000
Wire Wire Line
	8550 2000 7450 2000
Wire Wire Line
	7650 1800 8450 1800
Wire Wire Line
	8450 1800 8450 1700
Wire Wire Line
	8450 1700 9350 1700
Wire Wire Line
	7450 1300 8450 1300
Wire Wire Line
	8450 1300 8450 1500
Wire Wire Line
	8450 1500 9350 1500
Wire Wire Line
	9350 1400 8550 1400
Wire Wire Line
	8550 1400 8550 1100
Wire Wire Line
	8550 1100 7650 1100
Wire Wire Line
	7650 2500 8550 2500
Wire Wire Line
	8550 2500 8550 2700
Wire Wire Line
	8550 2700 9350 2700
Wire Wire Line
	7450 2700 8450 2700
Wire Wire Line
	8450 2700 8450 2800
Wire Wire Line
	8450 2800 9350 2800
Wire Wire Line
	7650 3200 8450 3200
Wire Wire Line
	8450 3200 8450 3000
Wire Wire Line
	8450 3000 9350 3000
Wire Wire Line
	9350 3100 8550 3100
Wire Wire Line
	8550 3100 8550 3400
Wire Wire Line
	8550 3400 7450 3400
Wire Wire Line
	4400 4650 3700 4650
Wire Wire Line
	3700 4350 3700 4300
Connection ~ 2250 4100
Connection ~ 2350 4100
Wire Wire Line
	2200 4400 2550 4400
Wire Wire Line
	2200 4200 2200 4400
Connection ~ 2050 4200
Connection ~ 2350 4400
Wire Wire Line
	6950 1250 6950 1300
Wire Wire Line
	6950 1300 7250 1300
Wire Wire Line
	7150 1350 7150 1300
Connection ~ 7150 1300
Wire Wire Line
	6750 1300 6850 1300
Wire Wire Line
	6850 1300 6850 1350
Wire Wire Line
	7250 2000 6950 2000
Wire Wire Line
	6950 2000 6950 1950
Wire Wire Line
	6750 2000 6850 2000
Wire Wire Line
	6850 2000 6850 2050
Wire Wire Line
	6850 2050 6950 2050
Wire Wire Line
	7250 2050 7250 2000
Wire Wire Line
	7250 3400 6950 3400
Wire Wire Line
	6950 3400 6950 3350
Wire Wire Line
	7250 3400 7250 3450
Wire Wire Line
	6950 3450 6850 3450
Wire Wire Line
	6850 3450 6850 3400
Wire Wire Line
	6850 3400 6750 3400
Wire Wire Line
	6750 2700 6850 2700
Wire Wire Line
	6850 2700 6850 2750
Wire Wire Line
	6850 2750 6950 2750
Wire Wire Line
	6950 2650 6950 2700
Wire Wire Line
	6950 2700 7250 2700
Wire Wire Line
	7250 2700 7250 2750
Wire Wire Line
	4900 3500 5300 3500
Wire Wire Line
	5300 3500 5300 2800
Wire Wire Line
	5400 3500 5400 3600
Wire Wire Line
	5400 3600 4900 3600
Wire Wire Line
	5100 3800 4900 3800
Wire Wire Line
	4900 3700 5200 3700
Wire Wire Line
	5200 3700 5200 2100
$EndSCHEMATC
