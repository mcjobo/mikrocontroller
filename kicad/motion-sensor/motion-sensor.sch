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
LIBS:motion-sensor-cache
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
L ATMEGA328P-A IC1
U 1 1 566926EE
P 4150 4700
F 0 "IC1" H 3400 5950 50  0000 L BNN
F 1 "ATMEGA328P-A" H 4550 3300 50  0000 L BNN
F 2 "" H 4150 4700 50  0000 C CIN
F 3 "" H 4150 4700 50  0000 C CNN
	1    4150 4700
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR01
U 1 1 56692781
P 1200 1350
F 0 "#PWR01" H 1200 1200 50  0001 C CNN
F 1 "+12V" H 1200 1490 50  0000 C CNN
F 2 "" H 1200 1350 50  0000 C CNN
F 3 "" H 1200 1350 50  0000 C CNN
	1    1200 1350
	1    0    0    -1  
$EndComp
$Comp
L CP CIN1
U 1 1 5669299B
P 1600 1750
F 0 "CIN1" H 1625 1850 50  0000 L CNN
F 1 "100uF" H 1625 1650 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_4x5.8" H 1638 1600 50  0001 C CNN
F 3 "" H 1600 1750 50  0000 C CNN
	1    1600 1750
	1    0    0    -1  
$EndComp
$Comp
L CP COUT1
U 1 1 56692A0A
P 4300 1950
F 0 "COUT1" H 4325 2050 50  0000 L CNN
F 1 "470uF" H 4325 1850 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x5.8" H 4338 1800 50  0001 C CNN
F 3 "" H 4300 1950 50  0000 C CNN
	1    4300 1950
	1    0    0    -1  
$EndComp
$Comp
L LM2574HVH-3.3 U1
U 1 1 56692AD3
P 2500 1700
F 0 "U1" H 2200 2000 40  0000 C CNN
F 1 "LM2574HVH-3.3" H 2600 2000 40  0000 C CNN
F 2 "" H 2500 1800 40  0000 C CNN
F 3 "" H 2500 1700 60  0000 C CNN
	1    2500 1700
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D1
U 1 1 56692BF4
P 3250 1950
F 0 "D1" H 3250 2050 50  0000 C CNN
F 1 "B140F" H 3250 1850 50  0000 C CNN
F 2 "" H 3250 1950 50  0001 C CNN
F 3 "" H 3250 1950 50  0000 C CNN
	1    3250 1950
	0    1    1    0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 56692C8F
P 3750 1800
F 0 "L1" V 3700 1800 50  0000 C CNN
F 1 "330uH" V 3850 1800 50  0000 C CNN
F 2 "" H 3750 1800 50  0001 C CNN
F 3 "" H 3750 1800 50  0000 C CNN
	1    3750 1800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR02
U 1 1 56693012
P 1200 2000
F 0 "#PWR02" H 1200 1750 50  0001 C CNN
F 1 "GND" H 1200 1850 50  0000 C CNN
F 2 "" H 1200 2000 50  0000 C CNN
F 3 "" H 1200 2000 50  0000 C CNN
	1    1200 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 56693308
P 4150 2200
F 0 "#PWR03" H 4150 1950 50  0001 C CNN
F 1 "GND" H 4150 2050 50  0000 C CNN
F 2 "" H 4150 2200 50  0000 C CNN
F 3 "" H 4150 2200 50  0000 C CNN
	1    4150 2200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 56693E9A
P 4150 1650
F 0 "#PWR04" H 4150 1500 50  0001 C CNN
F 1 "+3.3V" H 4150 1790 50  0000 C CNN
F 2 "" H 4150 1650 50  0000 C CNN
F 3 "" H 4150 1650 50  0000 C CNN
	1    4150 1650
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 566944E6
P 2900 4500
F 0 "C3" H 2925 4600 50  0000 L CNN
F 1 "100nF" H 2925 4400 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2938 4350 50  0001 C CNN
F 3 "" H 2900 4500 50  0000 C CNN
	1    2900 4500
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 56694619
P 8850 4500
F 0 "R1" V 8930 4500 50  0000 C CNN
F 1 "1K" V 8850 4500 50  0000 C CNN
F 2 "" V 8780 4500 50  0001 C CNN
F 3 "" H 8850 4500 50  0000 C CNN
	1    8850 4500
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 56694914
P 9100 4800
F 0 "R2" V 9180 4800 50  0000 C CNN
F 1 "1M" V 9100 4800 50  0000 C CNN
F 2 "" V 9030 4800 50  0001 C CNN
F 3 "" H 9100 4800 50  0000 C CNN
	1    9100 4800
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q1
U 1 1 56694EF9
P 9400 4500
F 0 "Q1" H 9700 4550 50  0000 R CNN
F 1 "Q_NMOS_DGS" H 10050 4450 50  0000 R CNN
F 2 "" H 9600 4600 50  0001 C CNN
F 3 "" H 9400 4500 50  0000 C CNN
	1    9400 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 56695647
P 9500 5050
F 0 "#PWR05" H 9500 4800 50  0001 C CNN
F 1 "GND" H 9500 4900 50  0000 C CNN
F 2 "" H 9500 5050 50  0000 C CNN
F 3 "" H 9500 5050 50  0000 C CNN
	1    9500 5050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 56696591
P 2900 3400
F 0 "#PWR06" H 2900 3250 50  0001 C CNN
F 1 "+3.3V" H 2900 3540 50  0000 C CNN
F 2 "" H 2900 3400 50  0000 C CNN
F 3 "" H 2900 3400 50  0000 C CNN
	1    2900 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 566965BA
P 2900 6000
F 0 "#PWR07" H 2900 5750 50  0001 C CNN
F 1 "GND" H 2900 5850 50  0000 C CNN
F 2 "" H 2900 6000 50  0000 C CNN
F 3 "" H 2900 6000 50  0000 C CNN
	1    2900 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1800 3450 1800
Connection ~ 3250 1800
Wire Wire Line
	4050 1800 4300 1800
Wire Wire Line
	2950 2100 4300 2100
Wire Wire Line
	1200 1600 2000 1600
Wire Wire Line
	2000 2200 2950 2200
Wire Wire Line
	2000 1800 2000 2200
Wire Wire Line
	1200 1900 2000 1900
Connection ~ 2000 1900
Wire Wire Line
	2950 2200 2950 2100
Connection ~ 3250 2100
Connection ~ 2600 2200
Wire Wire Line
	1200 1350 1200 1650
Connection ~ 1600 1600
Wire Wire Line
	1200 1750 1200 2000
Connection ~ 1600 1900
Wire Wire Line
	4150 2200 4150 2100
Connection ~ 4150 2100
Wire Wire Line
	4150 1650 4150 1800
Connection ~ 4150 1800
Wire Wire Line
	9000 4500 9200 4500
Wire Wire Line
	9100 4650 9100 4500
Connection ~ 9100 4500
Wire Wire Line
	9500 4700 9500 5050
Wire Wire Line
	9100 4950 9500 4950
Connection ~ 9500 4950
Wire Wire Line
	3250 3600 2900 3600
Wire Wire Line
	2900 3400 2900 4350
Wire Wire Line
	2900 3700 3250 3700
Connection ~ 2900 3700
Wire Wire Line
	2900 5900 3250 5900
Wire Wire Line
	2900 4650 2900 6000
Wire Wire Line
	3250 5800 2900 5800
Connection ~ 2900 5800
Wire Wire Line
	3250 5700 2900 5700
Connection ~ 2900 5700
Wire Wire Line
	3250 3900 2900 3900
Connection ~ 2900 3900
Connection ~ 2900 3600
Connection ~ 2900 5900
Wire Wire Line
	2600 2000 2600 2200
Wire Wire Line
	2500 2000 2500 2200
Connection ~ 2500 2200
$Comp
L CONN_02X03 P1
U 1 1 5669831C
P 4050 7150
F 0 "P1" H 4050 7350 50  0000 C CNN
F 1 "ISP" H 4050 6950 50  0000 C CNN
F 2 "" H 4050 5950 50  0000 C CNN
F 3 "" H 4050 5950 50  0000 C CNN
	1    4050 7150
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 566A7590
P 9000 1650
F 0 "P3" H 9000 1850 50  0000 C CNN
F 1 "CONN_01X03" V 9100 1650 50  0000 C CNN
F 2 "" H 9000 1650 50  0000 C CNN
F 3 "" H 9000 1650 50  0000 C CNN
	1    9000 1650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P4
U 1 1 566A7C7F
P 9000 2200
F 0 "P4" H 9000 2400 50  0000 C CNN
F 1 "CONN_01X03" V 9100 2200 50  0000 C CNN
F 2 "" H 9000 2200 50  0000 C CNN
F 3 "" H 9000 2200 50  0000 C CNN
	1    9000 2200
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON1
U 1 1 566AC197
P 900 1750
F 0 "CON1" H 900 2000 50  0000 C CNN
F 1 "BARREL_JACK" H 900 1550 50  0000 C CNN
F 2 "" H 900 1750 50  0000 C CNN
F 3 "" H 900 1750 50  0000 C CNN
	1    900  1750
	1    0    0    -1  
$EndComp
Connection ~ 1200 1600
Connection ~ 1200 1900
Connection ~ 1200 1850
$Comp
L CONN_01X02 P5
U 1 1 566ACA49
P 9950 4200
F 0 "P5" H 9950 4350 50  0000 C CNN
F 1 "CONN_01X02" V 10050 4200 50  0000 C CNN
F 2 "" H 9950 4200 50  0000 C CNN
F 3 "" H 9950 4200 50  0000 C CNN
	1    9950 4200
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 566AD052
P 10600 4200
F 0 "D3" H 10600 4300 50  0000 C CNN
F 1 "LED" H 10600 4100 50  0000 C CNN
F 2 "" H 10600 4200 50  0000 C CNN
F 3 "" H 10600 4200 50  0000 C CNN
	1    10600 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10250 4150 10250 3950
Wire Wire Line
	10250 3950 10600 3950
Wire Wire Line
	10600 3950 10600 4000
Connection ~ 9750 4150
Wire Wire Line
	9500 4250 10250 4250
Wire Wire Line
	10250 4250 10250 4450
Wire Wire Line
	10250 4450 10600 4450
Wire Wire Line
	10600 4450 10600 4400
Connection ~ 9750 4250
Wire Wire Line
	9500 4150 10250 4150
Wire Wire Line
	9500 4250 9500 4300
Wire Wire Line
	8750 1550 9750 1550
Wire Wire Line
	8750 1550 8750 1350
Wire Wire Line
	8750 1350 9500 1350
Connection ~ 9500 1350
Wire Wire Line
	8750 2100 10400 2100
Wire Wire Line
	8750 2100 8750 1950
Wire Wire Line
	8750 1950 9500 1950
$Comp
L GND #PWR09
U 1 1 566AFC0E
P 9300 2450
F 0 "#PWR09" H 9300 2200 50  0001 C CNN
F 1 "GND" H 9300 2300 50  0000 C CNN
F 2 "" H 9300 2450 50  0000 C CNN
F 3 "" H 9300 2450 50  0000 C CNN
	1    9300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2450 8750 2450
Wire Wire Line
	8750 2450 8750 2300
Wire Wire Line
	8750 2300 9400 2300
Wire Wire Line
	9300 2450 9300 1900
Wire Wire Line
	9300 1900 8750 1900
Wire Wire Line
	8750 1900 8750 1750
Wire Wire Line
	8750 1750 9400 1750
Wire Wire Line
	8500 1650 9700 1650
$Comp
L SWITCH_INV SW1
U 1 1 566B00C1
P 10000 1450
F 0 "SW1" H 9800 1600 50  0000 C CNN
F 1 "Motion-Sensor-1" H 9850 1300 50  0000 C CNN
F 2 "" H 10000 1450 50  0000 C CNN
F 3 "" H 10000 1450 50  0000 C CNN
	1    10000 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 1950 9500 1250
$Comp
L +12V #PWR010
U 1 1 566B026D
P 9500 4000
F 0 "#PWR010" H 9500 3850 50  0001 C CNN
F 1 "+12V" H 9500 4140 50  0000 C CNN
F 2 "" H 9500 4000 50  0000 C CNN
F 3 "" H 9500 4000 50  0000 C CNN
	1    9500 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4000 9500 4150
$Comp
L SWITCH_INV SW2
U 1 1 566B0514
P 10500 1450
F 0 "SW2" H 10300 1600 50  0000 C CNN
F 1 "Motion-Sensor-2" H 10350 1300 50  0000 C CNN
F 2 "" H 10500 1450 50  0000 C CNN
F 3 "" H 10500 1450 50  0000 C CNN
	1    10500 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 1650 9700 900 
Wire Wire Line
	9700 900  10000 900 
Wire Wire Line
	10000 900  10000 950 
Connection ~ 8800 1650
Wire Wire Line
	10750 2200 10750 900 
Wire Wire Line
	10750 900  10500 900 
Wire Wire Line
	10500 900  10500 950 
Connection ~ 8800 2200
Wire Wire Line
	9900 1950 9750 1950
Wire Wire Line
	9750 1950 9750 1550
Connection ~ 8800 1550
Wire Wire Line
	10100 1950 10100 2000
Wire Wire Line
	10100 2000 9400 2000
Wire Wire Line
	9400 2000 9400 1750
Connection ~ 8800 1750
Wire Wire Line
	10400 2100 10400 1950
Connection ~ 8800 2100
Wire Wire Line
	10600 1950 10600 2250
Wire Wire Line
	10600 2250 9400 2250
Wire Wire Line
	9400 2250 9400 2300
Connection ~ 8800 2300
Text GLabel 5250 3900 2    60   Input ~ 0
MOSI
Text GLabel 5250 4000 2    60   Input ~ 0
MISO
Text GLabel 5250 4100 2    60   Input ~ 0
SCK
Wire Wire Line
	5250 4100 5150 4100
Wire Wire Line
	5250 4000 5150 4000
Wire Wire Line
	5250 3900 5150 3900
Text GLabel 5250 5050 2    60   Input ~ 0
RESET
Wire Wire Line
	5250 5050 5150 5050
$Comp
L +3.3V #PWR011
U 1 1 566B729E
P 4400 7000
F 0 "#PWR011" H 4400 6850 50  0001 C CNN
F 1 "+3.3V" H 4400 7140 50  0000 C CNN
F 2 "" H 4400 7000 50  0000 C CNN
F 3 "" H 4400 7000 50  0000 C CNN
	1    4400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 7000 4400 7050
Wire Wire Line
	4400 7050 4300 7050
$Comp
L GND #PWR012
U 1 1 566B7663
P 4400 7300
F 0 "#PWR012" H 4400 7050 50  0001 C CNN
F 1 "GND" H 4400 7150 50  0000 C CNN
F 2 "" H 4400 7300 50  0000 C CNN
F 3 "" H 4400 7300 50  0000 C CNN
	1    4400 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7250 4400 7250
Wire Wire Line
	4400 7250 4400 7300
Text GLabel 4400 7150 2    60   Input ~ 0
MOSI
Text GLabel 3700 7000 0    60   Input ~ 0
MISO
Text GLabel 3700 7300 0    60   Input ~ 0
RESET
Text GLabel 3700 7150 0    60   Input ~ 0
SCK
Wire Wire Line
	3800 7000 3800 7050
Wire Wire Line
	3800 7150 3700 7150
Wire Wire Line
	3800 7300 3800 7250
Wire Wire Line
	4400 7150 4300 7150
Wire Wire Line
	3800 7000 3700 7000
Wire Wire Line
	3800 7300 3700 7300
Text GLabel 8500 1650 0    60   Input ~ 0
Motion_Sensor_Pin_1
Text GLabel 8500 2200 0    60   Input ~ 0
Motion_Sensor_Pin_2
Wire Wire Line
	8500 2200 10750 2200
Text GLabel 5250 4450 2    60   Input ~ 0
Motion_Sensor_Pin_1
Text GLabel 5250 4550 2    60   Input ~ 0
Motion_Sensor_Pin_2
Wire Wire Line
	5250 4450 5150 4450
Wire Wire Line
	5250 4550 5150 4550
Text GLabel 8600 4500 0    60   Input ~ 0
PWM_Pin
Wire Wire Line
	8700 4500 8600 4500
$Comp
L CONN_02X04 P2
U 1 1 566B21B4
P 7600 5750
F 0 "P2" H 7600 6000 50  0000 C CNN
F 1 "ESP8266" H 7600 5500 50  0000 C CNN
F 2 "" H 7600 4550 50  0000 C CNN
F 3 "" H 7600 4550 50  0000 C CNN
	1    7600 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 566B2638
P 7200 5900
F 0 "#PWR014" H 7200 5650 50  0001 C CNN
F 1 "GND" H 7200 5750 50  0000 C CNN
F 2 "" H 7200 5900 50  0000 C CNN
F 3 "" H 7200 5900 50  0000 C CNN
	1    7200 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 5600 7850 5600
Wire Wire Line
	7200 5900 7350 5900
Text GLabel 5250 5200 2    60   Input ~ 0
RXD
Text GLabel 5250 5300 2    60   Input ~ 0
TXD
Wire Wire Line
	8000 5600 8000 5700
Wire Wire Line
	8000 5700 7850 5700
Wire Wire Line
	5250 5200 5150 5200
Wire Wire Line
	5150 5300 5250 5300
Text GLabel 7950 5900 2    60   Input ~ 0
RXD
Text GLabel 7250 5600 0    60   Input ~ 0
TXD
Wire Wire Line
	7250 5600 7350 5600
Wire Wire Line
	7850 5900 7950 5900
Text GLabel 5250 4650 2    60   Input ~ 0
LED_PIN
Wire Wire Line
	5150 4650 5250 4650
$Comp
L LED D2
U 1 1 566B37F7
P 8100 3250
F 0 "D2" H 8100 3350 50  0000 C CNN
F 1 "LED" H 8100 3150 50  0000 C CNN
F 2 "" H 8100 3250 50  0000 C CNN
F 3 "" H 8100 3250 50  0000 C CNN
	1    8100 3250
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 566B38A0
P 8100 3650
F 0 "R3" V 8180 3650 50  0000 C CNN
F 1 "560" V 8100 3650 50  0000 C CNN
F 2 "" V 8030 3650 50  0000 C CNN
F 3 "" H 8100 3650 50  0000 C CNN
	1    8100 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 566B3930
P 8100 3850
F 0 "#PWR015" H 8100 3600 50  0001 C CNN
F 1 "GND" H 8100 3700 50  0000 C CNN
F 2 "" H 8100 3850 50  0000 C CNN
F 3 "" H 8100 3850 50  0000 C CNN
	1    8100 3850
	1    0    0    -1  
$EndComp
Text GLabel 8000 2950 0    60   Input ~ 0
LED_PIN
Wire Wire Line
	8000 2950 8100 2950
Wire Wire Line
	8100 2950 8100 3050
Wire Wire Line
	8100 3450 8100 3500
Wire Wire Line
	8100 3800 8100 3850
Wire Wire Line
	3000 1600 4050 1600
Wire Wire Line
	4050 1600 4050 1800
Connection ~ 4050 1800
NoConn ~ 3250 4950
NoConn ~ 3250 5050
NoConn ~ 5150 5900
NoConn ~ 5150 5700
NoConn ~ 5150 5600
NoConn ~ 5150 5500
NoConn ~ 5150 5400
NoConn ~ 5150 4950
NoConn ~ 5150 4850
NoConn ~ 5150 4750
NoConn ~ 5150 4300
NoConn ~ 5150 4200
NoConn ~ 5150 3800
NoConn ~ 5150 3700
NoConn ~ 5150 3600
NoConn ~ 7850 5800
NoConn ~ 7350 5800
NoConn ~ 7350 5700
Text GLabel 5250 5800 2    60   Input ~ 0
PWM_Pin
Wire Wire Line
	5250 5800 5150 5800
$Comp
L PWR_FLAG #FLG016
U 1 1 566B6761
P 1350 1350
F 0 "#FLG016" H 1350 1445 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 1530 50  0000 C CNN
F 2 "" H 1350 1350 50  0000 C CNN
F 3 "" H 1350 1350 50  0000 C CNN
	1    1350 1350
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG017
U 1 1 566B6917
P 1350 2000
F 0 "#FLG017" H 1350 2095 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 2180 50  0000 C CNN
F 2 "" H 1350 2000 50  0000 C CNN
F 3 "" H 1350 2000 50  0000 C CNN
	1    1350 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 1350 1200 1350
Wire Wire Line
	1200 2000 1350 2000
$Comp
L PWR_FLAG #FLG018
U 1 1 566B6ECE
P 4350 1650
F 0 "#FLG018" H 4350 1745 50  0001 C CNN
F 1 "PWR_FLAG" H 4350 1830 50  0000 C CNN
F 2 "" H 4350 1650 50  0000 C CNN
F 3 "" H 4350 1650 50  0000 C CNN
	1    4350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1650 4350 1650
NoConn ~ 3250 4200
$Comp
L +3.3V #PWR?
U 1 1 566C0F40
P 8000 5600
F 0 "#PWR?" H 8000 5450 50  0001 C CNN
F 1 "+3.3V" H 8000 5740 50  0000 C CNN
F 2 "" H 8000 5600 50  0000 C CNN
F 3 "" H 8000 5600 50  0000 C CNN
	1    8000 5600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 566C1158
P 9500 1250
F 0 "#PWR?" H 9500 1100 50  0001 C CNN
F 1 "+3.3V" H 9500 1390 50  0000 C CNN
F 2 "" H 9500 1250 50  0000 C CNN
F 3 "" H 9500 1250 50  0000 C CNN
	1    9500 1250
	1    0    0    -1  
$EndComp
$EndSCHEMATC