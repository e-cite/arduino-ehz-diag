EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "EHZ Diagnose-Tool 1-Kanal mit Buzzer"
Date "2021-09-05"
Rev "1.1"
Comp "Andreas Dolp"
Comment1 "GitHub: e-cite/ehz-diag"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A1
U 1 1 6128CE8D
P 8700 3850
F 0 "A1" H 8700 5150 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 8700 5050 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 8700 3850 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 8700 3850 50  0001 C CNN
F 4 "Mit Ethernet Shield R3" H 8700 4950 50  0000 C CNN "Shield"
	1    8700 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 61295D5A
P 9700 2250
F 0 "C1" H 9818 2296 50  0000 L CNN
F 1 "1µ" H 9818 2205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 9738 2100 50  0001 C CNN
F 3 "~" H 9700 2250 50  0001 C CNN
	1    9700 2250
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT46 D2
U 1 1 61294BE3
P 8900 2250
F 0 "D2" V 8854 2330 50  0000 L CNN
F 1 "BAT46" V 8945 2330 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P12.70mm_Horizontal" H 8900 2075 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85662/bat46.pdf" H 8900 2250 50  0001 C CNN
	1    8900 2250
	0    1    1    0   
$EndComp
Connection ~ 8900 1850
Connection ~ 8700 5400
Wire Wire Line
	4000 3850 4700 3850
$Comp
L Connector:Screw_Terminal_01x04 J1
U 1 1 6129A7AA
P 3800 4050
F 0 "J1" H 3750 4300 50  0000 L CNN
F 1 "Screw-Terminal" H 3800 4400 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MPT-0,5-4-2.54_1x04_P2.54mm_Horizontal" H 3800 4050 50  0001 C CNN
F 3 "~" H 3800 4050 50  0001 C CNN
F 4 "PTR 50692040021E" H 3800 3500 50  0001 C CNN "Bezeichnung"
F 5 "4x0,75 mm²" H 3800 4500 50  0000 C CNN "Ausführung"
	1    3800 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 2100 9700 1850
Wire Wire Line
	9700 1850 8900 1850
Wire Wire Line
	9700 2400 9700 5400
Wire Wire Line
	9700 5400 8700 5400
Wire Notes Line
	3000 1200 3000 6300
Wire Notes Line
	3000 6300 10850 6300
Wire Notes Line
	10850 1200 3000 1200
Text Notes 3000 1150 0    50   ~ 0
Gehäuse 125 x 115 x 58\nTRU COMPONENTS 4U63131206017 TC-7910716
Wire Notes Line
	10850 6300 10850 1200
NoConn ~ 8200 3250
NoConn ~ 8200 3350
NoConn ~ 8200 3650
NoConn ~ 8200 3950
NoConn ~ 8200 4050
NoConn ~ 8200 4150
NoConn ~ 8200 4250
NoConn ~ 8200 4350
NoConn ~ 8200 4450
NoConn ~ 8200 4550
NoConn ~ 8600 4950
NoConn ~ 8800 4950
NoConn ~ 9200 4650
NoConn ~ 9200 4550
NoConn ~ 9200 4350
NoConn ~ 9200 4250
NoConn ~ 9200 4150
NoConn ~ 9200 4050
NoConn ~ 9200 3950
NoConn ~ 9200 3850
NoConn ~ 9200 3250
NoConn ~ 9200 3450
NoConn ~ 9200 3650
NoConn ~ 8800 2850
NoConn ~ 8600 2850
Text Label 7950 3750 0    50   ~ 0
TXD1
Wire Wire Line
	8900 1850 8900 2100
$Comp
L power:GND #PWR0101
U 1 1 612ABE02
P 8700 5500
F 0 "#PWR0101" H 8700 5250 50  0001 C CNN
F 1 "GND" H 8705 5327 50  0000 C CNN
F 2 "" H 8700 5500 50  0001 C CNN
F 3 "" H 8700 5500 50  0001 C CNN
	1    8700 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4950 8700 5400
Wire Wire Line
	8700 5500 8700 5400
Wire Wire Line
	8900 2400 8900 2850
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 612B9C13
P 8300 5500
F 0 "#FLG0101" H 8300 5575 50  0001 C CNN
F 1 "PWR_FLAG" H 8300 5673 50  0000 C CNN
F 2 "" H 8300 5500 50  0001 C CNN
F 3 "~" H 8300 5500 50  0001 C CNN
	1    8300 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 5500 8300 5400
Connection ~ 8300 5400
Wire Wire Line
	8300 5400 8700 5400
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 612BB3F3
P 8400 2150
F 0 "#FLG0102" H 8400 2225 50  0001 C CNN
F 1 "PWR_FLAG" H 8400 2323 50  0000 C CNN
F 2 "" H 8400 2150 50  0001 C CNN
F 3 "~" H 8400 2150 50  0001 C CNN
	1    8400 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	8400 2150 8400 1850
Connection ~ 8400 1850
Wire Wire Line
	8400 1850 8900 1850
$Comp
L power:+5V #PWR0102
U 1 1 612BD38A
P 8400 1750
F 0 "#PWR0102" H 8400 1600 50  0001 C CNN
F 1 "+5V" H 8415 1923 50  0000 C CNN
F 2 "" H 8400 1750 50  0001 C CNN
F 3 "" H 8400 1750 50  0001 C CNN
	1    8400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1750 8400 1850
Text Label 7950 3850 0    50   ~ 0
RXD1
NoConn ~ 8200 3550
NoConn ~ 3550 4050
NoConn ~ 3550 4150
NoConn ~ 3550 3950
NoConn ~ 3550 3850
Text Label 2050 4050 0    50   ~ 0
grün
Text Notes 850  3050 0    50   ~ 0
Gehäuse 35 x 35 x 20\nHammond 1551 MBK
Wire Notes Line
	1900 3100 850  3100
Wire Notes Line
	1900 5650 1900 3100
Wire Notes Line
	850  5650 1900 5650
Wire Notes Line
	850  3100 850  5650
Wire Wire Line
	3550 4050 1650 4050
Wire Wire Line
	1650 5000 1650 4050
$Comp
L LED:SFH4356P D?
U 1 1 61295803
P 1500 4700
AR Path="/61291C31/61295803" Ref="D?"  Part="1" 
AR Path="/61295803" Ref="D1"  Part="1" 
F 0 "D1" V 1250 4750 50  0000 L CNN
F 1 "L-934SF4C" V 1150 4450 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_IRBlack" H 1500 4875 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic5/00181708_0.pdf" H 1450 4700 50  0001 C CNN
F 4 "Kingbright " V 1050 4450 50  0000 L CNN "Hersteller"
	1    1500 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 5000 1650 5000
Wire Wire Line
	1500 4900 1500 5000
Wire Wire Line
	1250 3400 1600 3400
Wire Wire Line
	1250 3400 1250 3450
$Comp
L Sensor_Optical:SFH309 Q?
U 1 1 61295810
P 1150 3650
AR Path="/61291C31/61295810" Ref="Q?"  Part="1" 
AR Path="/61295810" Ref="Q1"  Part="1" 
F 0 "Q1" H 1000 4050 50  0000 L CNN
F 1 "SFH309FA" H 1000 3950 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm_Clear" H 1630 3510 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic2/00101811_0.pdf/SFH%20309,%20SFH%20309%20FA,%20Lead%20(Pb)%20Free%20Product%20-%20RoHS%20Compliant.pdf" H 1150 3650 50  0001 C CNN
	1    1150 3650
	1    0    0    -1  
$EndComp
Text Notes 3150 3800 0    50   ~ 0
Beschriftung:\nC: Collector / Pin 4 / weiß\nA: Anode / Pin 3 / gelb\nK: Kathode / Pin 2 / grün\nE: Emitter / Pin 1 / braun\n\n
$Comp
L Device:R R4
U 1 1 612C0B20
P 7550 5050
F 0 "R4" H 7620 5096 50  0000 L CNN
F 1 "220" H 7620 5005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7480 5050 50  0001 C CNN
F 3 "~" H 7550 5050 50  0001 C CNN
	1    7550 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3400 1600 3850
Wire Wire Line
	1600 3850 3550 3850
Wire Wire Line
	1250 4150 3550 4150
Wire Wire Line
	8200 3450 7550 3450
Wire Wire Line
	7550 5200 7550 5400
Wire Wire Line
	1250 3850 1250 4150
Wire Wire Line
	1500 4600 1500 3950
Text Label 2050 3950 0    50   ~ 0
gelb
Wire Wire Line
	1500 3950 3550 3950
$Comp
L Device:R R2
U 1 1 6129C2D2
P 6900 3300
F 0 "R2" H 7000 3350 50  0000 L CNN
F 1 "10k" H 7000 3250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P15.24mm_Horizontal" V 6830 3300 50  0001 C CNN
F 3 "~" H 6900 3300 50  0001 C CNN
	1    6900 3300
	1    0    0    -1  
$EndComp
Connection ~ 7550 5400
Wire Wire Line
	7550 5400 8300 5400
$Comp
L Device:R R1
U 1 1 6129C666
P 4700 5050
F 0 "R1" H 4770 5096 50  0000 L CNN
F 1 "10k" H 4770 5005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4630 5050 50  0001 C CNN
F 3 "~" H 4700 5050 50  0001 C CNN
	1    4700 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6129B8F1
P 6350 5050
F 0 "R3" H 6200 4950 50  0000 L CNN
F 1 "220" H 6150 5050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6280 5050 50  0001 C CNN
F 3 "~" H 6350 5050 50  0001 C CNN
	1    6350 5050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 61339553
P 5450 2900
F 0 "R5" H 5520 2946 50  0000 L CNN
F 1 "10k" H 5520 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5380 2900 50  0001 C CNN
F 3 "~" H 5450 2900 50  0001 C CNN
	1    5450 2900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC548 Q3
U 1 1 612F8AA0
P 5350 4550
F 0 "Q3" H 5541 4596 50  0000 L CNN
F 1 "BC548" H 5541 4505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 5550 4475 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 5350 4550 50  0001 L CNN
	1    5350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5400 4700 5400
Connection ~ 5450 5400
Wire Wire Line
	5450 4750 5450 5400
Wire Wire Line
	4700 1850 5450 1850
Connection ~ 5450 1850
Wire Wire Line
	5450 2750 5450 1850
Wire Wire Line
	4000 4150 4700 4150
Wire Wire Line
	4700 4150 4700 4550
Wire Wire Line
	4700 5200 4700 5400
Wire Wire Line
	4700 3850 4700 1850
Wire Wire Line
	5150 4550 4700 4550
Connection ~ 4700 4550
Wire Wire Line
	4700 4550 4700 4900
Wire Wire Line
	5450 3050 5450 3850
Connection ~ 5450 3850
Wire Wire Line
	5450 3850 5450 4350
Wire Wire Line
	6350 4900 6350 4050
Wire Wire Line
	5450 3850 8200 3850
Wire Wire Line
	6900 3750 8200 3750
Wire Wire Line
	4000 4050 6350 4050
Wire Wire Line
	4000 3950 6350 3950
$Comp
L Transistor_BJT:BC557 Q2
U 1 1 613F7C21
P 6450 2900
F 0 "Q2" H 6641 2854 50  0000 L CNN
F 1 "BC557" H 6641 2945 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 6650 2825 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC556BTA-D.pdf" H 6450 2900 50  0001 L CNN
	1    6450 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5450 1850 6350 1850
Wire Wire Line
	5450 5400 6350 5400
Wire Wire Line
	6350 5200 6350 5400
Connection ~ 6350 5400
Wire Wire Line
	6350 5400 7550 5400
Wire Wire Line
	6350 2700 6350 1850
Connection ~ 6350 1850
Wire Wire Line
	6350 1850 8400 1850
Wire Wire Line
	6350 3100 6350 3950
Wire Wire Line
	6900 3750 6900 3450
Wire Wire Line
	6900 3150 6900 2900
Wire Wire Line
	6900 2900 6650 2900
Text Label 2050 4150 0    50   ~ 0
braun
Text Label 2050 3850 0    50   ~ 0
weiß
$Comp
L Device:Speaker LS1
U 1 1 614102C4
P 7250 4500
F 0 "LS1" H 7213 4817 50  0000 C CNN
F 1 "Piezo Buzzer" H 7213 4726 50  0000 C CNN
F 2 "speaker:Buzzer_22x7.5RM7.6" H 7250 4300 50  0001 C CNN
F 3 "~" H 7240 4450 50  0001 C CNN
	1    7250 4500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7550 4600 7450 4600
Wire Wire Line
	7550 4600 7550 4900
Wire Wire Line
	7450 4500 7550 4500
Wire Wire Line
	7550 3450 7550 4500
$EndSCHEMATC
