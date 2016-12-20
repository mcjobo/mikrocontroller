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
LIBS:mcp34063
LIBS:bolay-library
LIBS:borniers
LIBS:ESP8266
LIBS:jack-connector-board-cache
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
L CONN_01X08 P1
U 1 1 5820C696
P 4150 3650
F 0 "P1" H 4150 4100 50  0000 C CNN
F 1 "ConnMainboard" V 4250 3650 50  0000 C CNN
F 2 "bolay:4x2pin_50mil_header" H 4150 3650 50  0001 C CNN
F 3 "http://www.sullinscorp.com/catalogs/86_PAGE92-93_.050_FEMALE_HDR_ST_RA_SMT.pdf" H 4150 3650 50  0001 C CNN
F 4 "S9005E-08-ND" H 4150 3650 60  0001 C CNN "Digi-Key"
	1    4150 3650
	-1   0    0    -1  
$EndComp
$Comp
L RJ45 J1
U 1 1 5820C7AD
P 5850 2600
F 0 "J1" H 6050 3100 50  0000 C CNN
F 1 "ConnBus" H 5700 3100 50  0000 C CNN
F 2 "bolay:RJ45_vertical_8" H 5850 2600 50  0001 C CNN
F 3 "http://www.assmann-wsw.com/fileadmin/datasheets/A-2014-2-4-R_REV00.pdf" H 5850 2600 50  0001 C CNN
F 4 "AE10392-ND" H 5850 2600 60  0001 C CNN "Digi-Key"
	1    5850 2600
	1    0    0    -1  
$EndComp
$Comp
L RJ45 J2
U 1 1 5820C8CF
P 6950 2600
F 0 "J2" H 7150 3100 50  0000 C CNN
F 1 "ConnBus" H 6800 3100 50  0000 C CNN
F 2 "bolay:RJ45_vertical_8" H 6950 2600 50  0001 C CNN
F 3 "http://www.assmann-wsw.com/fileadmin/datasheets/A-2014-2-4-R_REV00.pdf" H 6950 2600 50  0001 C CNN
F 4 "AE10392-ND" H 6950 2600 60  0001 C CNN "Digi-Key"
	1    6950 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 5820CA66
P 4900 3100
F 0 "#PWR01" H 4900 2950 50  0001 C CNN
F 1 "+3.3V" H 4900 3240 50  0000 C CNN
F 2 "" H 4900 3100 50  0000 C CNN
F 3 "" H 4900 3100 50  0000 C CNN
	1    4900 3100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR02
U 1 1 5820CA80
P 4700 3100
F 0 "#PWR02" H 4700 2950 50  0001 C CNN
F 1 "+12V" H 4700 3240 50  0000 C CNN
F 2 "" H 4700 3100 50  0000 C CNN
F 3 "" H 4700 3100 50  0000 C CNN
	1    4700 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5820CA9A
P 4450 3100
F 0 "#PWR03" H 4450 2850 50  0001 C CNN
F 1 "GND" H 4450 2950 50  0000 C CNN
F 2 "" H 4450 3100 50  0000 C CNN
F 3 "" H 4450 3100 50  0000 C CNN
	1    4450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3300 6600 3300
Wire Wire Line
	5500 3300 5500 3050
Wire Wire Line
	6600 3300 6600 3050
Connection ~ 5500 3300
Wire Wire Line
	4350 3400 6700 3400
Wire Wire Line
	5600 3400 5600 3050
Wire Wire Line
	6700 3400 6700 3050
Connection ~ 5600 3400
Wire Wire Line
	6800 3050 6800 3500
Wire Wire Line
	6800 3500 4350 3500
Wire Wire Line
	4350 3600 7500 3600
Wire Wire Line
	6900 3600 6900 3050
Wire Wire Line
	4350 3700 7500 3700
Wire Wire Line
	7000 3050 7000 3700
Wire Wire Line
	4350 3800 7100 3800
Wire Wire Line
	7100 3800 7100 3050
Wire Wire Line
	4350 3900 7200 3900
Wire Wire Line
	7200 3900 7200 3050
Wire Wire Line
	4350 4000 7300 4000
Wire Wire Line
	7300 4000 7300 3050
Wire Wire Line
	5700 3050 5700 3500
Connection ~ 5700 3500
Wire Wire Line
	5800 3050 5800 3600
Connection ~ 5800 3600
Wire Wire Line
	5900 3050 5900 3700
Connection ~ 5900 3700
Wire Wire Line
	6000 3050 6000 3800
Connection ~ 6000 3800
Wire Wire Line
	6100 3050 6100 3900
Connection ~ 6100 3900
Wire Wire Line
	6200 3050 6200 4000
Connection ~ 6200 4000
Connection ~ 4550 3300
Connection ~ 4700 3400
Connection ~ 4900 3500
$Comp
L Jumper_NC_Small JP1
U 1 1 5820CB97
P 7600 3600
F 0 "JP1" H 7600 3680 50  0000 C CNN
F 1 "Jumper_NC_Small" H 7610 3540 50  0001 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 7600 3600 50  0001 C CNN
F 3 "" H 7600 3600 50  0000 C CNN
	1    7600 3600
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NC_Small JP2
U 1 1 5820CCA6
P 7600 3700
F 0 "JP2" H 7600 3650 50  0000 C CNN
F 1 "Jumper_NC_Small" H 7610 3640 50  0001 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 7600 3700 50  0001 C CNN
F 3 "" H 7600 3700 50  0000 C CNN
	1    7600 3700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5820CCFE
P 7950 3600
F 0 "R1" V 7850 3600 50  0000 C CNN
F 1 "4,7k" V 7950 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7880 3600 50  0001 C CNN
F 3 "http://www.yageo.com/NewPortal/yageodocoutput?fileName=/pdf/R-Chip/PYu-RC_Group_51_RoHS_L_4.pdf" H 7950 3600 50  0001 C CNN
F 4 "311-4.7KERCT-ND" V 7950 3600 60  0001 C CNN "Digi-Key"
	1    7950 3600
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5820CD77
P 7950 3700
F 0 "R2" V 8030 3700 50  0000 C CNN
F 1 "4,7k" V 7950 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7880 3700 50  0001 C CNN
F 3 "http://www.yageo.com/NewPortal/yageodocoutput?fileName=/pdf/R-Chip/PYu-RC_Group_51_RoHS_L_4.pdf" H 7950 3700 50  0001 C CNN
F 4 "311-4.7KERCT-ND" V 7950 3700 60  0001 C CNN "Digi-Key"
	1    7950 3700
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 5820CDA4
P 8250 3650
F 0 "#PWR04" H 8250 3500 50  0001 C CNN
F 1 "+3.3V" H 8250 3790 50  0000 C CNN
F 2 "" H 8250 3650 50  0000 C CNN
F 3 "" H 8250 3650 50  0000 C CNN
	1    8250 3650
	0    1    1    0   
$EndComp
Connection ~ 6900 3600
Connection ~ 7000 3700
Wire Wire Line
	7700 3700 7800 3700
Wire Wire Line
	7700 3600 7800 3600
Wire Wire Line
	8100 3600 8100 3700
Wire Wire Line
	8250 3650 8100 3650
Connection ~ 8100 3650
NoConn ~ 7500 2250
NoConn ~ 6400 2250
Wire Wire Line
	4900 3100 4900 3500
Wire Wire Line
	4450 3100 4550 3100
Wire Wire Line
	4550 3100 4550 3300
Wire Wire Line
	4700 3100 4700 3400
$Comp
L PWR_FLAG #FLG05
U 1 1 5820D86E
P 4450 3050
F 0 "#FLG05" H 4450 3145 50  0001 C CNN
F 1 "PWR_FLAG" H 4450 3230 50  0000 C CNN
F 2 "" H 4450 3050 50  0000 C CNN
F 3 "" H 4450 3050 50  0000 C CNN
	1    4450 3050
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG06
U 1 1 5820D8F0
P 5100 3150
F 0 "#FLG06" H 5100 3245 50  0001 C CNN
F 1 "PWR_FLAG" H 5100 3330 50  0000 C CNN
F 2 "" H 5100 3150 50  0000 C CNN
F 3 "" H 5100 3150 50  0000 C CNN
	1    5100 3150
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 5820D910
P 4800 3250
F 0 "#FLG07" H 4800 3345 50  0001 C CNN
F 1 "PWR_FLAG" H 4800 3430 50  0000 C CNN
F 2 "" H 4800 3250 50  0000 C CNN
F 3 "" H 4800 3250 50  0000 C CNN
	1    4800 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3250 4700 3250
Connection ~ 4700 3250
Wire Wire Line
	5100 3150 4900 3150
Connection ~ 4900 3150
Wire Wire Line
	4450 3100 4450 3050
$Comp
L Case U1
U 1 1 5820DF09
P 4350 1950
F 0 "U1" H 4350 1750 60  0000 C CNN
F 1 "Case" H 4400 2150 60  0000 C CNN
F 2 "" H 4350 1950 60  0000 C CNN
F 3 "http://www.budind.com/pdf/hb4770.pdf" H 4350 1950 60  0001 C CNN
F 4 "377-1807-ND" H 4350 1950 60  0001 C CNN "Digi-Key"
	1    4350 1950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
