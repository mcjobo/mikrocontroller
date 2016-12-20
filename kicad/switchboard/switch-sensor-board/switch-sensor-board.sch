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
LIBS:switch-sensor-board-cache
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
U 1 1 58276B3C
P 5050 3200
F 0 "U1" H 4700 3800 50  0000 L CNN
F 1 "PCF8574" H 5150 3800 50  0000 L CNN
F 2 "SMD_Packages:SO-16-W" H 5050 3200 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCF8574_PCF8574A.pdf" H 5050 3200 50  0001 C CNN
F 4 "568-1076-5-ND" H 5050 3200 60  0001 C CNN "Digi-Key"
	1    5050 3200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P1
U 1 1 58276BCA
P 1950 3100
F 0 "P1" H 1950 3550 50  0000 C CNN
F 1 "Conn_jack_conn_board" V 2050 3100 50  0000 C CNN
F 2 "bolay:4x2pin_50mil_header" H 1950 3100 50  0001 C CNN
F 3 "http://sullinscorp.com/drawings/89_LPPB___2NFSP-RC,_11018.pdf" H 1950 3100 50  0001 C CNN
F 4 "S9007E-04-ND" H 1950 3100 60  0001 C CNN "Digi-Key"
	1    1950 3100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 58275B73
P 5050 3950
F 0 "#PWR01" H 5050 3700 50  0001 C CNN
F 1 "GND" H 5050 3800 50  0000 C CNN
F 2 "" H 5050 3950 50  0000 C CNN
F 3 "" H 5050 3950 50  0000 C CNN
	1    5050 3950
	1    0    0    -1  
$EndComp
$Comp
L JUMPER3 JP3
U 1 1 58275E3F
P 4100 3200
F 0 "JP3" H 4150 3100 50  0000 L CNN
F 1 "SJ" H 4100 3300 50  0000 C BNN
F 2 "bolay:solder-jumper-3er" H 4100 3200 50  0001 C CNN
F 3 "" H 4100 3200 50  0000 C CNN
	1    4100 3200
	0    -1   -1   0   
$EndComp
$Comp
L JUMPER3 JP2
U 1 1 58275EDC
P 3800 3200
F 0 "JP2" H 3850 3100 50  0000 L CNN
F 1 "SJ" H 3800 3300 50  0000 C BNN
F 2 "bolay:solder-jumper-3er" H 3800 3200 50  0001 C CNN
F 3 "" H 3800 3200 50  0000 C CNN
	1    3800 3200
	0    -1   -1   0   
$EndComp
$Comp
L JUMPER3 JP1
U 1 1 58275F37
P 3500 3200
F 0 "JP1" H 3550 3100 50  0000 L CNN
F 1 "SJ" H 3500 3300 50  0000 C BNN
F 2 "bolay:solder-jumper-3er" H 3500 3200 50  0001 C CNN
F 3 "" H 3500 3200 50  0000 C CNN
	1    3500 3200
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR02
U 1 1 5827619F
P 3400 2950
F 0 "#PWR02" H 3400 2800 50  0001 C CNN
F 1 "+3.3V" H 3400 3090 50  0000 C CNN
F 2 "" H 3400 2950 50  0000 C CNN
F 3 "" H 3400 2950 50  0000 C CNN
	1    3400 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 582761F3
P 3400 3450
F 0 "#PWR03" H 3400 3200 50  0001 C CNN
F 1 "GND" H 3400 3300 50  0000 C CNN
F 2 "" H 3400 3450 50  0000 C CNN
F 3 "" H 3400 3450 50  0000 C CNN
	1    3400 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 58276240
P 2300 3450
F 0 "#PWR04" H 2300 3200 50  0001 C CNN
F 1 "GND" H 2300 3300 50  0000 C CNN
F 2 "" H 2300 3450 50  0000 C CNN
F 3 "" H 2300 3450 50  0000 C CNN
	1    2300 3450
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR05
U 1 1 58276279
P 2450 3350
F 0 "#PWR05" H 2450 3200 50  0001 C CNN
F 1 "+12V" H 2450 3490 50  0000 C CNN
F 2 "" H 2450 3350 50  0000 C CNN
F 3 "" H 2450 3350 50  0000 C CNN
	1    2450 3350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 582762CD
P 2650 3250
F 0 "#PWR06" H 2650 3100 50  0001 C CNN
F 1 "+3.3V" H 2650 3390 50  0000 C CNN
F 2 "" H 2650 3250 50  0000 C CNN
F 3 "" H 2650 3250 50  0000 C CNN
	1    2650 3250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 58276330
P 5050 2450
F 0 "#PWR07" H 5050 2300 50  0001 C CNN
F 1 "+3.3V" H 5050 2590 50  0000 C CNN
F 2 "" H 5050 2450 50  0000 C CNN
F 3 "" H 5050 2450 50  0000 C CNN
	1    5050 2450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 58277483
P 2400 1500
F 0 "#PWR08" H 2400 1350 50  0001 C CNN
F 1 "+3.3V" H 2400 1640 50  0000 C CNN
F 2 "" H 2400 1500 50  0000 C CNN
F 3 "" H 2400 1500 50  0000 C CNN
	1    2400 1500
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR09
U 1 1 582774D3
P 2400 1250
F 0 "#PWR09" H 2400 1100 50  0001 C CNN
F 1 "+12V" H 2400 1390 50  0000 C CNN
F 2 "" H 2400 1250 50  0000 C CNN
F 3 "" H 2400 1250 50  0000 C CNN
	1    2400 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 58277523
P 2400 1750
F 0 "#PWR010" H 2400 1500 50  0001 C CNN
F 1 "GND" H 2400 1600 50  0000 C CNN
F 2 "" H 2400 1750 50  0000 C CNN
F 3 "" H 2400 1750 50  0000 C CNN
	1    2400 1750
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG011
U 1 1 5827755E
P 2750 1250
F 0 "#FLG011" H 2750 1345 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 1430 50  0000 C CNN
F 2 "" H 2750 1250 50  0000 C CNN
F 3 "" H 2750 1250 50  0000 C CNN
	1    2750 1250
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG012
U 1 1 582775B5
P 2750 1500
F 0 "#FLG012" H 2750 1595 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 1680 50  0000 C CNN
F 2 "" H 2750 1500 50  0000 C CNN
F 3 "" H 2750 1500 50  0000 C CNN
	1    2750 1500
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG013
U 1 1 58277605
P 2750 1750
F 0 "#FLG013" H 2750 1845 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 1930 50  0000 C CNN
F 2 "" H 2750 1750 50  0000 C CNN
F 3 "" H 2750 1750 50  0000 C CNN
	1    2750 1750
	1    0    0    -1  
$EndComp
NoConn ~ 2150 2850
NoConn ~ 2150 2750
$Comp
L CONN_01X06 P2
U 1 1 5833514C
P 10000 1950
F 0 "P2" H 10000 2300 50  0000 C CNN
F 1 "CONN_01X06_Taster_1" V 10100 1950 50  0000 C CNN
F 2 "Connect:bornier6" H 10000 1950 50  0001 C CNN
F 3 "http://www.on-shore.com/wp-content/uploads/2015/09/ed120ds.pdf" H 10000 1950 50  0001 C CNN
F 4 "ED2229-ND" H 10000 1950 60  0001 C CNN "Digi-Key"
	1    10000 1950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P3
U 1 1 583354AF
P 10050 5050
F 0 "P3" H 10050 5400 50  0000 C CNN
F 1 "CONN_01X06_Taster_2" V 10150 5050 50  0000 C CNN
F 2 "Connect:bornier6" H 10050 5050 50  0001 C CNN
F 3 "http://www.on-shore.com/wp-content/uploads/2015/09/ed120ds.pdf" H 10050 5050 50  0001 C CNN
F 4 "ED2229-ND" H 10050 5050 60  0001 C CNN "Digi-Key"
	1    10050 5050
	1    0    0    -1  
$EndComp
$Comp
L R R17
U 1 1 58335816
P 8850 900
F 0 "R17" V 8930 900 50  0000 C CNN
F 1 "2k2" V 8850 900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 900 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 900 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 900 60  0001 C CNN "Digi-Key"
	1    8850 900 
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 58335E25
P 7350 650
F 0 "#PWR014" H 7350 500 50  0001 C CNN
F 1 "+3.3V" H 7350 790 50  0000 C CNN
F 2 "" H 7350 650 50  0000 C CNN
F 3 "" H 7350 650 50  0000 C CNN
	1    7350 650 
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 58335F7B
P 7600 900
F 0 "R2" V 7680 900 50  0000 C CNN
F 1 "100k" V 7600 900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 900 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 900 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 900 60  0001 C CNN "Digi-Key"
	1    7600 900 
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5833609F
P 7600 650
F 0 "R1" V 7680 650 50  0000 C CNN
F 1 "4k7" V 7600 650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 650 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 650 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 650 60  0001 C CNN "Digi-Key"
	1    7600 650 
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 58336426
P 7600 1100
F 0 "C2" H 7625 1200 50  0000 L CNN
F 1 "100nF" V 7650 800 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 950 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 1100 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 1100 60  0001 C CNN "Digi-Key"
	1    7600 1100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR015
U 1 1 5833659A
P 7850 1100
F 0 "#PWR015" H 7850 850 50  0001 C CNN
F 1 "GND" H 7850 950 50  0000 C CNN
F 2 "" H 7850 1100 50  0000 C CNN
F 3 "" H 7850 1100 50  0000 C CNN
	1    7850 1100
	1    0    0    -1  
$EndComp
$Comp
L R R18
U 1 1 58338202
P 8850 1650
F 0 "R18" V 8930 1650 50  0000 C CNN
F 1 "2k2" V 8850 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 1650 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 1650 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 1650 60  0001 C CNN "Digi-Key"
	1    8850 1650
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR016
U 1 1 58338208
P 7350 1400
F 0 "#PWR016" H 7350 1250 50  0001 C CNN
F 1 "+3.3V" H 7350 1540 50  0000 C CNN
F 2 "" H 7350 1400 50  0000 C CNN
F 3 "" H 7350 1400 50  0000 C CNN
	1    7350 1400
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5833820F
P 7600 1650
F 0 "R4" V 7680 1650 50  0000 C CNN
F 1 "100k" V 7600 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 1650 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 1650 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 1650 60  0001 C CNN "Digi-Key"
	1    7600 1650
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 58338216
P 7600 1400
F 0 "R3" V 7680 1400 50  0000 C CNN
F 1 "4k7" V 7600 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 1400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 1400 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 1400 60  0001 C CNN "Digi-Key"
	1    7600 1400
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 5833821D
P 7600 1850
F 0 "C3" H 7625 1950 50  0000 L CNN
F 1 "100nF" V 7650 1550 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 1700 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 1850 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 1850 60  0001 C CNN "Digi-Key"
	1    7600 1850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR017
U 1 1 58338223
P 7850 1850
F 0 "#PWR017" H 7850 1600 50  0001 C CNN
F 1 "GND" H 7850 1700 50  0000 C CNN
F 2 "" H 7850 1850 50  0000 C CNN
F 3 "" H 7850 1850 50  0000 C CNN
	1    7850 1850
	1    0    0    -1  
$EndComp
$Comp
L R R19
U 1 1 583383A9
P 8850 2400
F 0 "R19" V 8930 2400 50  0000 C CNN
F 1 "2k2" V 8850 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 2400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 2400 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 2400 60  0001 C CNN "Digi-Key"
	1    8850 2400
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR018
U 1 1 583383AF
P 7350 2150
F 0 "#PWR018" H 7350 2000 50  0001 C CNN
F 1 "+3.3V" H 7350 2290 50  0000 C CNN
F 2 "" H 7350 2150 50  0000 C CNN
F 3 "" H 7350 2150 50  0000 C CNN
	1    7350 2150
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 583383B6
P 7600 2400
F 0 "R6" V 7680 2400 50  0000 C CNN
F 1 "100k" V 7600 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 2400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 2400 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 2400 60  0001 C CNN "Digi-Key"
	1    7600 2400
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 583383BD
P 7600 2150
F 0 "R5" V 7680 2150 50  0000 C CNN
F 1 "4k7" V 7600 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 2150 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 2150 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 2150 60  0001 C CNN "Digi-Key"
	1    7600 2150
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 583383C4
P 7600 2600
F 0 "C4" H 7625 2700 50  0000 L CNN
F 1 "100nF" V 7650 2300 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 2450 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 2600 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 2600 60  0001 C CNN "Digi-Key"
	1    7600 2600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR019
U 1 1 583383CA
P 7850 2600
F 0 "#PWR019" H 7850 2350 50  0001 C CNN
F 1 "GND" H 7850 2450 50  0000 C CNN
F 2 "" H 7850 2600 50  0000 C CNN
F 3 "" H 7850 2600 50  0000 C CNN
	1    7850 2600
	1    0    0    -1  
$EndComp
$Comp
L R R20
U 1 1 58338710
P 8850 3150
F 0 "R20" V 8930 3150 50  0000 C CNN
F 1 "2k2" V 8850 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 3150 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 3150 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 3150 60  0001 C CNN "Digi-Key"
	1    8850 3150
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR020
U 1 1 58338716
P 7350 2900
F 0 "#PWR020" H 7350 2750 50  0001 C CNN
F 1 "+3.3V" H 7350 3040 50  0000 C CNN
F 2 "" H 7350 2900 50  0000 C CNN
F 3 "" H 7350 2900 50  0000 C CNN
	1    7350 2900
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 5833871D
P 7600 3150
F 0 "R8" V 7680 3150 50  0000 C CNN
F 1 "100k" V 7600 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 3150 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 3150 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 3150 60  0001 C CNN "Digi-Key"
	1    7600 3150
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 58338724
P 7600 2900
F 0 "R7" V 7680 2900 50  0000 C CNN
F 1 "4k7" V 7600 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 2900 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 2900 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 2900 60  0001 C CNN "Digi-Key"
	1    7600 2900
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 5833872B
P 7600 3350
F 0 "C5" H 7625 3450 50  0000 L CNN
F 1 "100nF" V 7650 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 3200 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 3350 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 3350 60  0001 C CNN "Digi-Key"
	1    7600 3350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR021
U 1 1 58338731
P 7850 3350
F 0 "#PWR021" H 7850 3100 50  0001 C CNN
F 1 "GND" H 7850 3200 50  0000 C CNN
F 2 "" H 7850 3350 50  0000 C CNN
F 3 "" H 7850 3350 50  0000 C CNN
	1    7850 3350
	1    0    0    -1  
$EndComp
$Comp
L R R21
U 1 1 58338BC3
P 8850 3900
F 0 "R21" V 8930 3900 50  0000 C CNN
F 1 "2k2" V 8850 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 3900 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 3900 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 3900 60  0001 C CNN "Digi-Key"
	1    8850 3900
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR022
U 1 1 58338BC9
P 7350 3650
F 0 "#PWR022" H 7350 3500 50  0001 C CNN
F 1 "+3.3V" H 7350 3790 50  0000 C CNN
F 2 "" H 7350 3650 50  0000 C CNN
F 3 "" H 7350 3650 50  0000 C CNN
	1    7350 3650
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 58338BD0
P 7600 3900
F 0 "R10" V 7680 3900 50  0000 C CNN
F 1 "100k" V 7600 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 3900 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 3900 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 3900 60  0001 C CNN "Digi-Key"
	1    7600 3900
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 58338BD7
P 7600 3650
F 0 "R9" V 7680 3650 50  0000 C CNN
F 1 "4k7" V 7600 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 3650 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 3650 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 3650 60  0001 C CNN "Digi-Key"
	1    7600 3650
	0    1    1    0   
$EndComp
$Comp
L C C6
U 1 1 58338BDE
P 7600 4100
F 0 "C6" H 7625 4200 50  0000 L CNN
F 1 "100nF" V 7650 3800 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 3950 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 4100 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 4100 60  0001 C CNN "Digi-Key"
	1    7600 4100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR023
U 1 1 58338BE4
P 7850 4100
F 0 "#PWR023" H 7850 3850 50  0001 C CNN
F 1 "GND" H 7850 3950 50  0000 C CNN
F 2 "" H 7850 4100 50  0000 C CNN
F 3 "" H 7850 4100 50  0000 C CNN
	1    7850 4100
	1    0    0    -1  
$EndComp
$Comp
L R R22
U 1 1 58338E04
P 8850 4650
F 0 "R22" V 8930 4650 50  0000 C CNN
F 1 "2k2" V 8850 4650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 4650 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 4650 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 4650 60  0001 C CNN "Digi-Key"
	1    8850 4650
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR024
U 1 1 58338E0A
P 7350 4400
F 0 "#PWR024" H 7350 4250 50  0001 C CNN
F 1 "+3.3V" H 7350 4540 50  0000 C CNN
F 2 "" H 7350 4400 50  0000 C CNN
F 3 "" H 7350 4400 50  0000 C CNN
	1    7350 4400
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 58338E11
P 7600 4650
F 0 "R12" V 7680 4650 50  0000 C CNN
F 1 "100k" V 7600 4650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 4650 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 4650 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 4650 60  0001 C CNN "Digi-Key"
	1    7600 4650
	0    -1   -1   0   
$EndComp
$Comp
L R R11
U 1 1 58338E18
P 7600 4400
F 0 "R11" V 7680 4400 50  0000 C CNN
F 1 "4k7" V 7600 4400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 4400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 4400 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 4400 60  0001 C CNN "Digi-Key"
	1    7600 4400
	0    1    1    0   
$EndComp
$Comp
L C C7
U 1 1 58338E1F
P 7600 4850
F 0 "C7" H 7625 4950 50  0000 L CNN
F 1 "100nF" V 7650 4550 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 4700 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 4850 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 4850 60  0001 C CNN "Digi-Key"
	1    7600 4850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR025
U 1 1 58338E25
P 7850 4850
F 0 "#PWR025" H 7850 4600 50  0001 C CNN
F 1 "GND" H 7850 4700 50  0000 C CNN
F 2 "" H 7850 4850 50  0000 C CNN
F 3 "" H 7850 4850 50  0000 C CNN
	1    7850 4850
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 5833B057
P 8850 5400
F 0 "R23" V 8930 5400 50  0000 C CNN
F 1 "2k2" V 8850 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 5400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 5400 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 5400 60  0001 C CNN "Digi-Key"
	1    8850 5400
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR026
U 1 1 5833B05D
P 7350 5150
F 0 "#PWR026" H 7350 5000 50  0001 C CNN
F 1 "+3.3V" H 7350 5290 50  0000 C CNN
F 2 "" H 7350 5150 50  0000 C CNN
F 3 "" H 7350 5150 50  0000 C CNN
	1    7350 5150
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 5833B064
P 7600 5400
F 0 "R14" V 7680 5400 50  0000 C CNN
F 1 "100k" V 7600 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 5400 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 5400 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 5400 60  0001 C CNN "Digi-Key"
	1    7600 5400
	0    -1   -1   0   
$EndComp
$Comp
L R R13
U 1 1 5833B06B
P 7600 5150
F 0 "R13" V 7680 5150 50  0000 C CNN
F 1 "4k7" V 7600 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 5150 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 5150 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 5150 60  0001 C CNN "Digi-Key"
	1    7600 5150
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 5833B072
P 7600 5600
F 0 "C8" H 7625 5700 50  0000 L CNN
F 1 "100nF" V 7650 5300 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 5450 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 5600 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 5600 60  0001 C CNN "Digi-Key"
	1    7600 5600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR027
U 1 1 5833B078
P 7850 5600
F 0 "#PWR027" H 7850 5350 50  0001 C CNN
F 1 "GND" H 7850 5450 50  0000 C CNN
F 2 "" H 7850 5600 50  0000 C CNN
F 3 "" H 7850 5600 50  0000 C CNN
	1    7850 5600
	1    0    0    -1  
$EndComp
$Comp
L R R24
U 1 1 5833B208
P 8850 6150
F 0 "R24" V 8930 6150 50  0000 C CNN
F 1 "2k2" V 8850 6150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8780 6150 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 8850 6150 50  0001 C CNN
F 4 "RHM2.2KYCT-ND" V 8850 6150 60  0001 C CNN "Digi-Key"
	1    8850 6150
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR028
U 1 1 5833B20E
P 7350 5900
F 0 "#PWR028" H 7350 5750 50  0001 C CNN
F 1 "+3.3V" H 7350 6040 50  0000 C CNN
F 2 "" H 7350 5900 50  0000 C CNN
F 3 "" H 7350 5900 50  0000 C CNN
	1    7350 5900
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 5833B215
P 7600 6150
F 0 "R16" V 7680 6150 50  0000 C CNN
F 1 "100k" V 7600 6150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 6150 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 6150 50  0001 C CNN
F 4 "RHM100KYCT-ND" V 7600 6150 60  0001 C CNN "Digi-Key"
	1    7600 6150
	0    -1   -1   0   
$EndComp
$Comp
L R R15
U 1 1 5833B21C
P 7600 5900
F 0 "R15" V 7680 5900 50  0000 C CNN
F 1 "4k7" V 7600 5900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 5900 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/passive/resistor/chip_resistor/ltr.pdf" H 7600 5900 50  0001 C CNN
F 4 "RHM4.7YCT-ND" V 7600 5900 60  0001 C CNN "Digi-Key"
	1    7600 5900
	0    1    1    0   
$EndComp
$Comp
L C C9
U 1 1 5833B223
P 7600 6350
F 0 "C9" H 7625 6450 50  0000 L CNN
F 1 "100nF" V 7650 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7638 6200 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 7600 6350 50  0001 C CNN
F 4 "1276-2854-1-ND" H 7600 6350 60  0001 C CNN "Digi-Key"
	1    7600 6350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR029
U 1 1 5833B229
P 7850 6350
F 0 "#PWR029" H 7850 6100 50  0001 C CNN
F 1 "GND" H 7850 6200 50  0000 C CNN
F 2 "" H 7850 6350 50  0000 C CNN
F 3 "" H 7850 6350 50  0000 C CNN
	1    7850 6350
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 583410DD
P 4700 3900
F 0 "C1" H 4725 4000 50  0000 L CNN
F 1 "100nF" V 4750 3600 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 4738 3750 50  0001 C CNN
F 3 "http://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL31F104MBCNNNC_Spec.pdf" H 4700 3900 50  0001 C CNN
F 4 "1276-2854-1-ND" H 4700 3900 60  0001 C CNN "Digi-Key"
	1    4700 3900
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR030
U 1 1 583412D6
P 4350 3900
F 0 "#PWR030" H 4350 3750 50  0001 C CNN
F 1 "+3.3V" H 4350 4040 50  0000 C CNN
F 2 "" H 4350 3900 50  0000 C CNN
F 3 "" H 4350 3900 50  0000 C CNN
	1    4350 3900
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR031
U 1 1 58341DF8
P 9700 1800
F 0 "#PWR031" H 9700 1650 50  0001 C CNN
F 1 "+12V" H 9700 1940 50  0000 C CNN
F 2 "" H 9700 1800 50  0000 C CNN
F 3 "" H 9700 1800 50  0000 C CNN
	1    9700 1800
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR032
U 1 1 58342403
P 9750 4900
F 0 "#PWR032" H 9750 4750 50  0001 C CNN
F 1 "+12V" H 9750 5040 50  0000 C CNN
F 2 "" H 9750 4900 50  0000 C CNN
F 3 "" H 9750 4900 50  0000 C CNN
	1    9750 4900
	1    0    0    -1  
$EndComp
$Comp
L TLP291-4 U2
U 1 1 5834B6A2
P 8300 1000
F 0 "U2" H 8100 1200 50  0000 L CNN
F 1 "TLP293-4" H 8300 1200 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 800 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 1000 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 1000 60  0001 C CNN "Digi-Key"
	1    8300 1000
	-1   0    0    -1  
$EndComp
$Comp
L TLP291-4 U2
U 2 1 5834BC03
P 8300 1750
F 0 "U2" H 8100 1950 50  0000 L CNN
F 1 "TLP293-4" H 8300 1950 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 1550 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 1750 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 1750 60  0001 C CNN "Digi-Key"
	2    8300 1750
	-1   0    0    -1  
$EndComp
$Comp
L TLP291-4 U2
U 3 1 5834BC88
P 8300 2500
F 0 "U2" H 8100 2700 50  0000 L CNN
F 1 "TLP293-4" H 8300 2700 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 2300 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 2500 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 2500 60  0001 C CNN "Digi-Key"
	3    8300 2500
	-1   0    0    -1  
$EndComp
$Comp
L TLP291-4 U2
U 4 1 5834C2FE
P 8300 3250
F 0 "U2" H 8100 3450 50  0000 L CNN
F 1 "TLP293-4" H 8300 3450 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 3050 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 3250 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 3250 60  0001 C CNN "Digi-Key"
	4    8300 3250
	-1   0    0    -1  
$EndComp
$Comp
L TLP291-4 U3
U 1 1 5834D8D0
P 8300 6250
F 0 "U3" H 8100 6450 50  0000 L CNN
F 1 "TLP293-4" H 8300 6450 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 6050 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 6250 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 6250 60  0001 C CNN "Digi-Key"
	1    8300 6250
	-1   0    0    -1  
$EndComp
$Comp
L TLP291-4 U3
U 2 1 5834D955
P 8300 5500
F 0 "U3" H 8100 5700 50  0000 L CNN
F 1 "TLP293-4" H 8300 5700 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 5300 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 5500 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 5500 60  0001 C CNN "Digi-Key"
	2    8300 5500
	-1   0    0    -1  
$EndComp
$Comp
L TLP291-4 U3
U 3 1 5834D9F2
P 8300 4750
F 0 "U3" H 8100 4950 50  0000 L CNN
F 1 "TLP293-4" H 8300 4950 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 4550 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 4750 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 4750 60  0001 C CNN "Digi-Key"
	3    8300 4750
	-1   0    0    -1  
$EndComp
$Comp
L TLP291-4 U3
U 4 1 5834DA7F
P 8300 4000
F 0 "U3" H 8100 4200 50  0000 L CNN
F 1 "TLP293-4" H 8300 4200 50  0000 L CNN
F 2 "SMD_Packages:SO-16-N" H 8100 3800 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=15287&prodName=TLP293-4" H 8300 4000 50  0001 L CNN
F 4 "TLP293-4(LGBE-ND" H 8300 4000 60  0001 C CNN "Digi-Key"
	4    8300 4000
	-1   0    0    -1  
$EndComp
$Comp
L D_Small D1
U 1 1 5834E75C
P 8650 1000
F 0 "D1" H 8600 1080 50  0000 L CNN
F 1 "RS1MTR" H 8500 920 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 1000 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 1000 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 1000 60  0001 C CNN "Digi-Key"
	1    8650 1000
	0    1    1    0   
$EndComp
$Comp
L D_Small D2
U 1 1 58351863
P 8650 1750
F 0 "D2" H 8600 1830 50  0000 L CNN
F 1 "RS1MTR" H 8500 1670 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 1750 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 1750 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 1750 60  0001 C CNN "Digi-Key"
	1    8650 1750
	0    1    1    0   
$EndComp
$Comp
L D_Small D3
U 1 1 58352884
P 8650 2500
F 0 "D3" H 8600 2580 50  0000 L CNN
F 1 "RS1MTR" H 8500 2420 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 2500 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 2500 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 2500 60  0001 C CNN "Digi-Key"
	1    8650 2500
	0    1    1    0   
$EndComp
$Comp
L D_Small D4
U 1 1 5835294F
P 8650 3250
F 0 "D4" H 8600 3330 50  0000 L CNN
F 1 "RS1MTR" H 8500 3170 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 3250 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 3250 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 3250 60  0001 C CNN "Digi-Key"
	1    8650 3250
	0    1    1    0   
$EndComp
$Comp
L D_Small D5
U 1 1 58352A19
P 8650 4000
F 0 "D5" H 8600 4080 50  0000 L CNN
F 1 "RS1MTR" H 8500 3920 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 4000 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 4000 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 4000 60  0001 C CNN "Digi-Key"
	1    8650 4000
	0    1    1    0   
$EndComp
$Comp
L D_Small D6
U 1 1 58352D9B
P 8650 4750
F 0 "D6" H 8600 4830 50  0000 L CNN
F 1 "RS1MTR" H 8500 4670 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 4750 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 4750 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 4750 60  0001 C CNN "Digi-Key"
	1    8650 4750
	0    1    1    0   
$EndComp
$Comp
L D_Small D7
U 1 1 58352E6B
P 8650 5500
F 0 "D7" H 8600 5580 50  0000 L CNN
F 1 "RS1MTR" H 8500 5420 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 5500 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 5500 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 5500 60  0001 C CNN "Digi-Key"
	1    8650 5500
	0    1    1    0   
$EndComp
$Comp
L D_Small D8
U 1 1 583530F4
P 8650 6250
F 0 "D8" H 8600 6330 50  0000 L CNN
F 1 "RS1MTR" H 8500 6170 50  0000 L CNN
F 2 "Diodes_SMD:SMA_Handsoldering" V 8650 6250 50  0001 C CNN
F 3 "http://www.smc-diodes.com/propdf/RS1A-M%20N0988%20REV.A.pdf" V 8650 6250 50  0001 C CNN
F 4 "1655-1501-1-ND" H 8650 6250 60  0001 C CNN "Digi-Key"
	1    8650 6250
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 2950 4100 2950
Connection ~ 3800 2950
Wire Wire Line
	4550 3200 4200 3200
Wire Wire Line
	4000 3100 4550 3100
Wire Wire Line
	4000 3100 4000 3200
Wire Wire Line
	4000 3200 3900 3200
Wire Wire Line
	4550 3300 3700 3300
Wire Wire Line
	3700 3300 3700 3200
Wire Wire Line
	3700 3200 3600 3200
Wire Wire Line
	3400 3450 4100 3450
Connection ~ 3800 3450
Connection ~ 3500 3450
Connection ~ 3500 2950
Wire Wire Line
	4550 2900 3550 2900
Wire Wire Line
	3550 2900 3550 2750
Wire Wire Line
	3550 2750 2500 2750
Wire Wire Line
	4550 2800 3650 2800
Wire Wire Line
	3650 2800 3650 2650
Wire Wire Line
	3650 2650 2400 2650
Wire Wire Line
	2150 3450 2300 3450
Wire Wire Line
	2450 3350 2150 3350
Wire Wire Line
	2650 3250 2150 3250
Wire Wire Line
	2500 2750 2500 3150
Wire Wire Line
	2500 3150 2150 3150
Wire Wire Line
	2400 2650 2400 3050
Wire Wire Line
	2400 3050 2150 3050
Wire Wire Line
	2150 2950 2300 2950
Wire Wire Line
	2300 2950 2300 2550
Wire Wire Line
	2300 2550 3750 2550
Wire Wire Line
	3750 2550 3750 2700
Wire Wire Line
	3750 2700 4400 2700
Wire Wire Line
	4400 2700 4400 3600
Wire Wire Line
	4400 3600 4550 3600
Wire Wire Line
	5050 3950 5050 3900
Wire Wire Line
	5050 2450 5050 2500
Wire Wire Line
	2400 1250 2750 1250
Wire Wire Line
	2750 1500 2400 1500
Wire Wire Line
	2400 1750 2750 1750
Wire Wire Line
	7350 650  7450 650 
Wire Wire Line
	7750 650  7850 650 
Wire Wire Line
	7850 650  7850 900 
Wire Wire Line
	7750 900  8000 900 
Connection ~ 7850 900 
Wire Wire Line
	7750 1100 8000 1100
Connection ~ 7850 1100
Wire Wire Line
	6000 900  7450 900 
Wire Wire Line
	7350 900  7350 1100
Wire Wire Line
	7350 1100 7450 1100
Wire Wire Line
	7350 1400 7450 1400
Wire Wire Line
	7750 1400 7850 1400
Wire Wire Line
	7850 1400 7850 1650
Wire Wire Line
	7750 1650 8000 1650
Connection ~ 7850 1650
Wire Wire Line
	7750 1850 8000 1850
Connection ~ 7850 1850
Wire Wire Line
	6100 1650 7450 1650
Wire Wire Line
	7350 1650 7350 1850
Wire Wire Line
	7350 1850 7450 1850
Wire Wire Line
	7350 2150 7450 2150
Wire Wire Line
	7750 2150 7850 2150
Wire Wire Line
	7850 2150 7850 2400
Wire Wire Line
	7750 2400 8000 2400
Connection ~ 7850 2400
Wire Wire Line
	7750 2600 8000 2600
Connection ~ 7850 2600
Wire Wire Line
	6200 2400 7450 2400
Wire Wire Line
	7350 2400 7350 2600
Wire Wire Line
	7350 2600 7450 2600
Wire Wire Line
	7350 2900 7450 2900
Wire Wire Line
	7750 2900 7850 2900
Wire Wire Line
	7850 2900 7850 3150
Wire Wire Line
	7750 3150 8000 3150
Connection ~ 7850 3150
Wire Wire Line
	7750 3350 8000 3350
Connection ~ 7850 3350
Wire Wire Line
	6200 3150 7450 3150
Wire Wire Line
	7350 3150 7350 3350
Wire Wire Line
	7350 3350 7450 3350
Wire Wire Line
	7350 3650 7450 3650
Wire Wire Line
	7750 3650 7850 3650
Wire Wire Line
	7850 3650 7850 3900
Wire Wire Line
	7750 3900 8000 3900
Connection ~ 7850 3900
Wire Wire Line
	7750 4100 8000 4100
Connection ~ 7850 4100
Wire Wire Line
	6100 3900 7450 3900
Wire Wire Line
	7350 3900 7350 4100
Wire Wire Line
	7350 4100 7450 4100
Wire Wire Line
	7350 4400 7450 4400
Wire Wire Line
	7750 4400 7850 4400
Wire Wire Line
	7850 4400 7850 4650
Wire Wire Line
	7750 4650 8000 4650
Connection ~ 7850 4650
Wire Wire Line
	7750 4850 8000 4850
Connection ~ 7850 4850
Wire Wire Line
	6000 4650 7450 4650
Wire Wire Line
	7350 4650 7350 4850
Wire Wire Line
	7350 4850 7450 4850
Wire Wire Line
	7350 5150 7450 5150
Wire Wire Line
	7750 5150 7850 5150
Wire Wire Line
	7850 5150 7850 5400
Wire Wire Line
	7750 5400 8000 5400
Connection ~ 7850 5400
Wire Wire Line
	7750 5600 8000 5600
Connection ~ 7850 5600
Wire Wire Line
	5900 5400 7450 5400
Wire Wire Line
	7350 5400 7350 5600
Wire Wire Line
	7350 5600 7450 5600
Wire Wire Line
	7350 5900 7450 5900
Wire Wire Line
	7750 5900 7850 5900
Wire Wire Line
	7850 5900 7850 6150
Wire Wire Line
	7750 6150 8000 6150
Connection ~ 7850 6150
Wire Wire Line
	7750 6350 8000 6350
Connection ~ 7850 6350
Wire Wire Line
	5800 6150 7450 6150
Wire Wire Line
	7350 6150 7350 6350
Wire Wire Line
	7350 6350 7450 6350
Wire Wire Line
	6000 900  6000 2800
Wire Wire Line
	6000 2800 5550 2800
Connection ~ 7350 900 
Wire Wire Line
	6100 1650 6100 2900
Wire Wire Line
	6100 2900 5550 2900
Connection ~ 7350 1650
Wire Wire Line
	6200 2400 6200 3000
Wire Wire Line
	6200 3000 5550 3000
Connection ~ 7350 2400
Wire Wire Line
	6200 3150 6200 3100
Wire Wire Line
	6200 3100 5550 3100
Connection ~ 7350 3150
Connection ~ 7350 3900
Connection ~ 7350 4650
Wire Wire Line
	5900 3300 5900 5400
Connection ~ 7350 5400
Wire Wire Line
	5800 3200 5800 6150
Connection ~ 7350 6150
Wire Wire Line
	9000 900  9600 900 
Wire Wire Line
	9600 1900 9800 1900
Wire Wire Line
	9000 1650 9500 1650
Wire Wire Line
	9500 2000 9800 2000
Wire Wire Line
	9000 2400 9500 2400
Wire Wire Line
	9500 2100 9800 2100
Wire Wire Line
	9000 3150 9600 3150
Wire Wire Line
	9600 2200 9800 2200
Wire Wire Line
	9000 3900 9600 3900
Wire Wire Line
	9600 3900 9600 5000
Wire Wire Line
	9500 4650 9500 5100
Wire Wire Line
	9500 4650 9000 4650
Wire Wire Line
	9000 5400 9500 5400
Wire Wire Line
	9000 6150 9600 6150
Wire Wire Line
	9600 6150 9600 5300
Wire Wire Line
	9600 5300 9850 5300
Wire Wire Line
	9500 5400 9500 5200
Wire Wire Line
	9500 5200 9850 5200
Wire Wire Line
	9500 5100 9850 5100
Wire Wire Line
	9600 5000 9850 5000
Wire Wire Line
	9200 6350 9200 1100
Connection ~ 9200 1850
Connection ~ 9200 2600
Connection ~ 9200 3350
Connection ~ 9200 4100
Connection ~ 9200 5600
Wire Wire Line
	9850 4800 9200 4800
Connection ~ 9200 4800
Connection ~ 9200 4850
Wire Wire Line
	9800 1700 9200 1700
Connection ~ 9200 1700
Wire Wire Line
	5050 3900 4850 3900
Wire Wire Line
	4550 3900 4350 3900
Wire Wire Line
	9750 4900 9850 4900
Wire Wire Line
	9700 1800 9800 1800
Wire Wire Line
	8600 900  8700 900 
Connection ~ 8650 900 
Connection ~ 8650 1100
Wire Wire Line
	8600 6150 8700 6150
Connection ~ 8650 6150
Wire Wire Line
	8600 5600 9200 5600
Connection ~ 8650 5600
Wire Wire Line
	8600 5400 8700 5400
Connection ~ 8650 5400
Wire Wire Line
	8600 4650 8700 4650
Connection ~ 8650 4650
Wire Wire Line
	8600 4850 9200 4850
Connection ~ 8650 4850
Wire Wire Line
	8600 4100 9200 4100
Connection ~ 8650 4100
Wire Wire Line
	8600 3900 8700 3900
Connection ~ 8650 3900
Wire Wire Line
	8600 3350 9200 3350
Connection ~ 8650 3350
Wire Wire Line
	8600 3150 8700 3150
Connection ~ 8650 3150
Wire Wire Line
	8600 2600 9200 2600
Connection ~ 8650 2600
Wire Wire Line
	8600 2400 8700 2400
Connection ~ 8650 2400
Wire Wire Line
	8600 1650 8700 1650
Connection ~ 8650 1650
Wire Wire Line
	8600 1850 9200 1850
Connection ~ 8650 1850
Wire Wire Line
	9200 1100 8600 1100
Wire Wire Line
	9600 3150 9600 2200
Wire Wire Line
	9500 2400 9500 2100
Wire Wire Line
	9500 1650 9500 2000
Wire Wire Line
	9600 900  9600 1900
Wire Wire Line
	8600 6350 9200 6350
Connection ~ 8650 6350
Wire Wire Line
	5550 3200 5800 3200
Wire Wire Line
	5900 3300 5550 3300
Wire Wire Line
	5550 3400 6000 3400
Wire Wire Line
	6000 3400 6000 4650
Wire Wire Line
	6100 3900 6100 3500
Wire Wire Line
	6100 3500 5550 3500
$EndSCHEMATC
