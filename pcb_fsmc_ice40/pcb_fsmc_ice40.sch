EESchema Schematic File Version 2
LIBS:pcb_sram-rescue
LIBS:knielsenlib
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
LIBS:pcb_fsmc_ice40-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "STM32F4 FSMC to ICE40 connector board"
Date "26 jul 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND-RESCUE-pcb_sram #PWR01
U 1 1 51E1C15E
P 3750 5000
F 0 "#PWR01" H 3750 5000 30  0001 C CNN
F 1 "GND" H 3750 4930 30  0001 C CNN
F 2 "" H 3750 5000 60  0001 C CNN
F 3 "" H 3750 5000 60  0001 C CNN
	1    3750 5000
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR02
U 1 1 51EA6307
P 6400 1700
F 0 "#PWR02" H 6400 1700 30  0001 C CNN
F 1 "GND" H 6400 1630 30  0001 C CNN
F 2 "" H 6400 1700 60  0001 C CNN
F 3 "" H 6400 1700 60  0001 C CNN
	1    6400 1700
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_4PIN B1
U 1 1 51EA62D5
P 5950 1750
F 0 "B1" H 5957 1973 60  0000 C CNN
F 1 "SWITCH_4PIN" H 5949 1495 60  0000 C CNN
F 2 "knielsenlib:pushbutton_EVQ_PSR02K" H 5950 1750 60  0001 C CNN
F 3 "" H 5950 1750 60  0001 C CNN
	1    5950 1750
	1    0    0    -1  
$EndComp
Text Label 5100 4050 0    40   ~ 0
user_led2
$Comp
L GND-RESCUE-pcb_sram #PWR03
U 1 1 51E9B6D4
P 6700 4250
F 0 "#PWR03" H 6700 4250 30  0001 C CNN
F 1 "GND" H 6700 4180 30  0001 C CNN
F 2 "" H 6700 4250 60  0001 C CNN
F 3 "" H 6700 4250 60  0001 C CNN
	1    6700 4250
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-pcb_sram R?
U 1 1 51E9B6C3
P 5600 4050
AR Path="/51E9B6BD" Ref="R?"  Part="1" 
AR Path="/51E9B6C3" Ref="R2"  Part="1" 
F 0 "R2" V 5680 4050 50  0000 C CNN
F 1 "1k" V 5600 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5600 4050 60  0001 C CNN
F 3 "" H 5600 4050 60  0001 C CNN
	1    5600 4050
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-pcb_sram R1
U 1 1 51E9B6BD
P 5600 3600
F 0 "R1" V 5680 3600 50  0000 C CNN
F 1 "1k" V 5600 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5600 3600 60  0001 C CNN
F 3 "" H 5600 3600 60  0001 C CNN
	1    5600 3600
	0    -1   -1   0   
$EndComp
$Comp
L LED-RESCUE-pcb_sram D?
U 1 1 51E9B667
P 6250 4050
AR Path="/51E9B65E" Ref="D?"  Part="1" 
AR Path="/51E9B667" Ref="D2"  Part="1" 
F 0 "D2" H 6250 4150 50  0000 C CNN
F 1 "SML-211YTT86" H 6250 3950 50  0000 C CNN
F 2 "LEDs:LED_0603" H 6250 4050 60  0001 C CNN
F 3 "" H 6250 4050 60  0001 C CNN
	1    6250 4050
	1    0    0    -1  
$EndComp
$Comp
L LED-RESCUE-pcb_sram D1
U 1 1 51E9B65E
P 6250 3600
F 0 "D1" H 6250 3700 50  0000 C CNN
F 1 "SML-211UTT86" H 6250 3500 50  0000 C CNN
F 2 "LEDs:LED_0603" H 6250 3600 60  0001 C CNN
F 3 "" H 6250 3600 60  0001 C CNN
	1    6250 3600
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR04
U 1 1 51E9B03F
P 9150 1825
F 0 "#PWR04" H 9150 1825 30  0001 C CNN
F 1 "GND" H 9150 1755 30  0001 C CNN
F 2 "" H 9150 1825 60  0001 C CNN
F 3 "" H 9150 1825 60  0001 C CNN
	1    9150 1825
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR05
U 1 1 51E9B02A
P 9150 1575
F 0 "#PWR05" H 9150 1535 30  0001 C CNN
F 1 "+3.3V" H 9150 1685 30  0000 C CNN
F 2 "" H 9150 1575 60  0001 C CNN
F 3 "" H 9150 1575 60  0001 C CNN
	1    9150 1575
	1    0    0    -1  
$EndComp
$Comp
L Csmall C30
U 1 1 51E9B00E
P 9350 1675
F 0 "C30" H 9375 1725 30  0000 L CNN
F 1 "100n" H 9375 1625 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 9350 1675 60  0001 C CNN
F 3 "" H 9350 1675 60  0001 C CNN
	1    9350 1675
	1    0    0    -1  
$EndComp
Text Label 8050 2175 0    40   ~ 0
sd_cd
Text Label 8050 2075 0    40   ~ 0
sd_d2
Text Label 8050 1975 0    40   ~ 0
sd_d1
Text Label 8050 1875 0    40   ~ 0
sd_d0
Text Label 8050 1675 0    40   ~ 0
sd_clk
Text Label 8050 1375 0    40   ~ 0
sd_cmd
Text Label 8050 1275 0    40   ~ 0
sd_d3
Text Label 5000 950  0    40   ~ 0
3V3_adc
$Comp
L PWR_FLAG #FLG06
U 1 1 51E3A726
P 4850 850
F 0 "#FLG06" H 4850 945 30  0001 C CNN
F 1 "PWR_FLAG" H 4850 1030 30  0000 C CNN
F 2 "" H 4850 850 60  0001 C CNN
F 3 "" H 4850 850 60  0001 C CNN
	1    4850 850 
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L2
U 1 1 51E3A64F
P 6000 950
F 0 "L2" V 5950 950 40  0000 C CNN
F 1 "22@100MHz" V 6100 950 40  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 6000 950 60  0001 C CNN
F 3 "" H 6000 950 60  0001 C CNN
	1    6000 950 
	0    1    1    0   
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR07
U 1 1 51E39DD1
P 5250 1800
F 0 "#PWR07" H 5250 1800 30  0001 C CNN
F 1 "GND" H 5250 1730 30  0001 C CNN
F 2 "" H 5250 1800 60  0001 C CNN
F 3 "" H 5250 1800 60  0001 C CNN
	1    5250 1800
	1    0    0    -1  
$EndComp
$Comp
L Csmall C29
U 1 1 51E39DB5
P 5050 1750
F 0 "C29" H 5075 1800 30  0000 L CNN
F 1 "100n" H 5075 1700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5050 1750 60  0001 C CNN
F 3 "" H 5050 1750 60  0001 C CNN
	1    5050 1750
	0    -1   -1   0   
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR08
U 1 1 51E32522
P 5800 750
F 0 "#PWR08" H 5800 750 30  0001 C CNN
F 1 "GND" H 5800 680 30  0001 C CNN
F 2 "" H 5800 750 60  0001 C CNN
F 3 "" H 5800 750 60  0001 C CNN
	1    5800 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C25
U 1 1 51E32464
P 5500 700
F 0 "C25" H 5525 750 30  0000 L CNN
F 1 "100n" H 5525 650 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5500 700 60  0001 C CNN
F 3 "" H 5500 700 60  0001 C CNN
	1    5500 700 
	0    -1   -1   0   
$EndComp
$Comp
L Csmall C26
U 1 1 51E3245F
P 5500 850
F 0 "C26" H 5525 900 30  0000 L CNN
F 1 "1u" H 5525 800 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5500 850 60  0001 C CNN
F 3 "" H 5500 850 60  0001 C CNN
	1    5500 850 
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR09
U 1 1 51E3244D
P 6450 900
F 0 "#PWR09" H 6450 860 30  0001 C CNN
F 1 "+3.3V" H 6450 1010 30  0000 C CNN
F 2 "" H 6450 900 60  0001 C CNN
F 3 "" H 6450 900 60  0001 C CNN
	1    6450 900 
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR010
U 1 1 51E32422
P 5600 1300
F 0 "#PWR010" H 5600 1300 30  0001 C CNN
F 1 "GND" H 5600 1230 30  0001 C CNN
F 2 "" H 5600 1300 60  0001 C CNN
F 3 "" H 5600 1300 60  0001 C CNN
	1    5600 1300
	1    0    0    -1  
$EndComp
$Comp
L Csmall C28
U 1 1 51E32404
P 5500 1200
F 0 "C28" H 5525 1250 30  0000 L CNN
F 1 "1u" H 5525 1150 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5500 1200 60  0001 C CNN
F 3 "" H 5500 1200 60  0001 C CNN
	1    5500 1200
	0    -1   -1   0   
$EndComp
$Comp
L Csmall C27
U 1 1 51E323F3
P 5500 1050
F 0 "C27" H 5525 1100 30  0000 L CNN
F 1 "100n" H 5525 1000 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5500 1050 60  0001 C CNN
F 3 "" H 5500 1050 60  0001 C CNN
	1    5500 1050
	0    -1   -1   0   
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR011
U 1 1 51E3207F
P 5350 1300
F 0 "#PWR011" H 5350 1300 30  0001 C CNN
F 1 "GND" H 5350 1230 30  0001 C CNN
F 2 "" H 5350 1300 60  0001 C CNN
F 3 "" H 5350 1300 60  0001 C CNN
	1    5350 1300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR012
U 1 1 51E32078
P 5000 1200
F 0 "#PWR012" H 5000 1160 30  0001 C CNN
F 1 "+3.3V" H 5000 1310 30  0000 C CNN
F 2 "" H 5000 1200 60  0001 C CNN
F 3 "" H 5000 1200 60  0001 C CNN
	1    5000 1200
	1    0    0    -1  
$EndComp
$Comp
L Csmall C21
U 1 1 51E31FE2
P 4250 750
F 0 "C21" H 4275 800 30  0000 L CNN
F 1 "4.7u" H 4275 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4250 750 60  0001 C CNN
F 3 "" H 4250 750 60  0001 C CNN
	1    4250 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C22
U 1 1 51E31FCA
P 5250 1250
F 0 "C22" H 5275 1300 30  0000 L CNN
F 1 "100n" H 5275 1200 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5250 1250 60  0001 C CNN
F 3 "" H 5250 1250 60  0001 C CNN
	1    5250 1250
	0    -1   -1   0   
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR013
U 1 1 51E31FAE
P 4450 1150
F 0 "#PWR013" H 4450 1150 30  0001 C CNN
F 1 "GND" H 4450 1080 30  0001 C CNN
F 2 "" H 4450 1150 60  0001 C CNN
F 3 "" H 4450 1150 60  0001 C CNN
	1    4450 1150
	1    0    0    -1  
$EndComp
Text Label 1300 5850 0    60   ~ 0
swclk
Text Label 1300 6050 0    60   ~ 0
swdio
Text Label 1300 6150 0    60   ~ 0
nrst
$Comp
L GND-RESCUE-pcb_sram #PWR014
U 1 1 51E2F4FC
P 4950 1450
F 0 "#PWR014" H 4950 1450 30  0001 C CNN
F 1 "GND" H 4950 1380 30  0001 C CNN
F 2 "" H 4950 1450 60  0001 C CNN
F 3 "" H 4950 1450 60  0001 C CNN
	1    4950 1450
	1    0    0    -1  
$EndComp
$Comp
L Csmall C?
U 1 1 51E2F4D7
P 4750 1400
AR Path="/51E2F4CE" Ref="C?"  Part="1" 
AR Path="/51E2F4D7" Ref="C23"  Part="1" 
F 0 "C23" H 4775 1450 30  0000 L CNN
F 1 "2.2u" H 4775 1350 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4750 1400 60  0001 C CNN
F 3 "" H 4750 1400 60  0001 C CNN
	1    4750 1400
	0    -1   -1   0   
$EndComp
$Comp
L Csmall C24
U 1 1 51E2F4CE
P 4750 1600
F 0 "C24" H 4775 1650 30  0000 L CNN
F 1 "2.2u" H 4775 1550 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4750 1600 60  0001 C CNN
F 3 "" H 4750 1600 60  0001 C CNN
	1    4750 1600
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR015
U 1 1 51E2F49F
P 4650 1800
F 0 "#PWR015" H 4650 1760 30  0001 C CNN
F 1 "+3.3V" H 4650 1910 30  0000 C CNN
F 2 "" H 4650 1800 60  0001 C CNN
F 3 "" H 4650 1800 60  0001 C CNN
	1    4650 1800
	-1   0    0    1   
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR016
U 1 1 51E29AAE
P 5200 2750
F 0 "#PWR016" H 5200 2750 30  0001 C CNN
F 1 "GND" H 5200 2680 30  0001 C CNN
F 2 "" H 5200 2750 60  0001 C CNN
F 3 "" H 5200 2750 60  0001 C CNN
	1    5200 2750
	1    0    0    -1  
$EndComp
$Comp
L Csmall C?
U 1 1 51E29A9A
P 5100 2600
AR Path="/51E29A90" Ref="C?"  Part="1" 
AR Path="/51E29A9A" Ref="C20"  Part="1" 
F 0 "C20" H 5125 2650 30  0000 L CNN
F 1 "22p" H 5125 2550 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5100 2600 60  0001 C CNN
F 3 "" H 5100 2600 60  0001 C CNN
	1    5100 2600
	0    -1   -1   0   
$EndComp
$Comp
L Csmall C3
U 1 1 51E29A90
P 5100 2000
F 0 "C3" H 5125 2050 30  0000 L CNN
F 1 "22p" H 5125 1950 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5100 2000 60  0001 C CNN
F 3 "" H 5100 2000 60  0001 C CNN
	1    5100 2000
	0    -1   -1   0   
$EndComp
Text Label 4400 2050 0    20   ~ 0
osc_out
Text Label 4400 2000 0    20   ~ 0
osc_in
$Comp
L CRYSTAL X1
U 1 1 51E29A2D
P 4800 2300
F 0 "X1" H 4800 2450 60  0000 C CNN
F 1 "CRYSTAL" H 4800 2150 60  0000 C CNN
F 2 "knielsenlib:2-SOJ" H 4800 2300 60  0001 C CNN
F 3 "" H 4800 2300 60  0001 C CNN
	1    4800 2300
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR017
U 1 1 51E1D3C0
P 1100 5750
F 0 "#PWR017" H 1100 5710 30  0001 C CNN
F 1 "+3.3V" H 1100 5860 30  0000 C CNN
F 2 "" H 1100 5750 60  0001 C CNN
F 3 "" H 1100 5750 60  0001 C CNN
	1    1100 5750
	1    0    0    -1  
$EndComp
Text Label 950  4550 0    20   ~ 0
pg15
Text Label 950  4500 0    20   ~ 0
pg14
Text Label 950  4450 0    20   ~ 0
pg13
Text Label 950  4350 0    20   ~ 0
pg11
Text Label 950  4200 0    20   ~ 0
pg8
Text Label 950  4150 0    20   ~ 0
pg7
Text Label 950  2750 0    20   ~ 0
pc13
Text Label 2100 3500 0    20   ~ 0
pf11
Text Label 2100 3450 0    20   ~ 0
pf10
Text Label 2100 3400 0    20   ~ 0
pf9
Text Label 2100 3350 0    20   ~ 0
pf8
Text Label 2100 3300 0    20   ~ 0
pf7
Text Label 2100 3250 0    20   ~ 0
pf6
Text Label 950  3250 0    20   ~ 0
pe6
Text Label 950  3200 0    20   ~ 0
pe5
Text Label 950  3050 0    20   ~ 0
pe2
Text Label 2100 2400 0    20   ~ 0
pd6
Text Label 2100 2250 0    20   ~ 0
pd3
Text Label 950  2850 0    20   ~ 0
pc15
Text Label 950  2800 0    20   ~ 0
pc14
Text Label 950  4100 0    20   ~ 0
sd_cd
Text Label 4400 1750 0    20   ~ 0
nrst
Text Label 3700 4100 0    20   ~ 0
usb_id
Text Label 3700 3800 0    20   ~ 0
usb_5v
Text Label 3700 3900 0    20   ~ 0
usb_dm
Text Label 3700 4000 0    20   ~ 0
usb_dp
$Comp
L GND-RESCUE-pcb_sram #PWR018
U 1 1 51E1C166
P 3900 4300
F 0 "#PWR018" H 3900 4300 30  0001 C CNN
F 1 "GND" H 3900 4230 30  0001 C CNN
F 2 "" H 3900 4300 60  0001 C CNN
F 3 "" H 3900 4300 60  0001 C CNN
	1    3900 4300
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 51E1C15D
P 3750 4600
F 0 "L1" V 3700 4600 40  0000 C CNN
F 1 "30@100MHz" V 3850 4600 40  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 3750 4600 60  0001 C CNN
F 3 "" H 3750 4600 60  0001 C CNN
	1    3750 4600
	-1   0    0    1   
$EndComp
$Comp
L KNUSB P7
U 1 1 51E1C158
P 3250 3700
F 0 "P7" H 3250 3700 60  0000 C CNN
F 1 "KNUSB" H 3250 3000 60  0000 C CNN
F 2 "knielsenlib:10103594-0001LF" H 3250 3700 60  0001 C CNN
F 3 "" H 3250 3700 60  0001 C CNN
	1    3250 3700
	1    0    0    -1  
$EndComp
Text Label 950  2450 0    20   ~ 0
pc7
Text Label 950  2400 0    20   ~ 0
pc6
Text Label 950  2350 0    20   ~ 0
pc5
Text Label 950  2300 0    20   ~ 0
pc4
Text Label 950  2250 0    20   ~ 0
pc3
Text Label 950  2200 0    20   ~ 0
pc2
Text Label 950  2150 0    20   ~ 0
pc1
Text Label 950  2100 0    20   ~ 0
pc0
Text Label 2100 2000 0    20   ~ 0
pb15
Text Label 2100 1950 0    20   ~ 0
pb14
Text Label 2100 1900 0    20   ~ 0
pb13
Text Label 2100 1850 0    20   ~ 0
pb12
Text Label 2100 1800 0    20   ~ 0
fpga_io2
Text Label 2100 1750 0    20   ~ 0
fpga_io1
Text Label 2100 1700 0    20   ~ 0
pb9
Text Label 2100 1650 0    20   ~ 0
pb8
Text Label 2100 1600 0    20   ~ 0
pb7
Text Label 2100 1550 0    20   ~ 0
pb6
Text Label 2100 1500 0    20   ~ 0
pb5
Text Label 2100 1450 0    20   ~ 0
pb4
Text Label 2100 1400 0    20   ~ 0
pb3
Text Label 2100 1350 0    20   ~ 0
boot1
Text Label 2100 1300 0    20   ~ 0
pb1
Text Label 2100 1250 0    20   ~ 0
pb0
Text Label 950  2000 0    20   ~ 0
sd_wp
Text Label 950  1950 0    20   ~ 0
swclk
Text Label 950  1900 0    20   ~ 0
swdio
Text Label 950  1850 0    20   ~ 0
usb_dp
Text Label 950  1800 0    20   ~ 0
usb_dm
Text Label 950  1750 0    20   ~ 0
usb_id
Text Label 950  1700 0    20   ~ 0
user_led2
Text Label 950  1650 0    20   ~ 0
user_led1
Text Label 950  1600 0    20   ~ 0
pa7
Text Label 950  1550 0    20   ~ 0
pa6
Text Label 950  1500 0    20   ~ 0
pa5
Text Label 950  1450 0    20   ~ 0
pa4
Text Label 950  1400 0    20   ~ 0
pa3
Text Label 950  1350 0    20   ~ 0
pa2
Text Label 950  1300 0    20   ~ 0
pa1
Text Label 950  1250 0    20   ~ 0
pa0
Text Label 950  2700 0    20   ~ 0
sd_clk
Text Label 950  2650 0    20   ~ 0
sd_d3
Text Label 950  2600 0    20   ~ 0
sd_d2
Text Label 950  2550 0    20   ~ 0
sd_d1
Text Label 950  2500 0    20   ~ 0
sd_d0
Text Label 2100 2200 0    20   ~ 0
sd_cmd
$Comp
L +3.3V-RESCUE-pcb_sram #PWR019
U 1 1 51E050B0
P 3400 1000
F 0 "#PWR019" H 3400 960 30  0001 C CNN
F 1 "+3.3V" H 3400 1110 30  0000 C CNN
F 2 "" H 3400 1000 60  0001 C CNN
F 3 "" H 3400 1000 60  0001 C CNN
	1    3400 1000
	-1   0    0    1   
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR020
U 1 1 51E035A1
P 4450 700
F 0 "#PWR020" H 4450 700 30  0001 C CNN
F 1 "GND" H 4450 630 30  0001 C CNN
F 2 "" H 4450 700 60  0001 C CNN
F 3 "" H 4450 700 60  0001 C CNN
	1    4450 700 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C18
U 1 1 51E0355B
P 3850 750
F 0 "C18" H 3875 800 30  0000 L CNN
F 1 "100n" H 3875 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3850 750 60  0001 C CNN
F 3 "" H 3850 750 60  0001 C CNN
	1    3850 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C19
U 1 1 51E0355A
P 4050 750
F 0 "C19" H 4075 800 30  0000 L CNN
F 1 "100n" H 4075 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4050 750 60  0001 C CNN
F 3 "" H 4050 750 60  0001 C CNN
	1    4050 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C17
U 1 1 51E03559
P 3650 750
F 0 "C17" H 3675 800 30  0000 L CNN
F 1 "100n" H 3675 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3650 750 60  0001 C CNN
F 3 "" H 3650 750 60  0001 C CNN
	1    3650 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C16
U 1 1 51E03558
P 3450 750
F 0 "C16" H 3475 800 30  0000 L CNN
F 1 "100n" H 3475 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3450 750 60  0001 C CNN
F 3 "" H 3450 750 60  0001 C CNN
	1    3450 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C8
U 1 1 51E0354F
P 1850 750
F 0 "C8" H 1875 800 30  0000 L CNN
F 1 "100n" H 1875 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1850 750 60  0001 C CNN
F 3 "" H 1850 750 60  0001 C CNN
	1    1850 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C9
U 1 1 51E0354E
P 2050 750
F 0 "C9" H 2075 800 30  0000 L CNN
F 1 "100n" H 2075 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2050 750 60  0001 C CNN
F 3 "" H 2050 750 60  0001 C CNN
	1    2050 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C11
U 1 1 51E0354D
P 2450 750
F 0 "C11" H 2475 800 30  0000 L CNN
F 1 "100n" H 2475 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2450 750 60  0001 C CNN
F 3 "" H 2450 750 60  0001 C CNN
	1    2450 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C10
U 1 1 51E0354C
P 2250 750
F 0 "C10" H 2275 800 30  0000 L CNN
F 1 "100n" H 2275 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2250 750 60  0001 C CNN
F 3 "" H 2250 750 60  0001 C CNN
	1    2250 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C14
U 1 1 51E03543
P 3050 750
F 0 "C14" H 3075 800 30  0000 L CNN
F 1 "100n" H 3075 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3050 750 60  0001 C CNN
F 3 "" H 3050 750 60  0001 C CNN
	1    3050 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C15
U 1 1 51E03542
P 3250 750
F 0 "C15" H 3275 800 30  0000 L CNN
F 1 "100n" H 3275 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3250 750 60  0001 C CNN
F 3 "" H 3250 750 60  0001 C CNN
	1    3250 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C13
U 1 1 51E0352E
P 2850 750
F 0 "C13" H 2875 800 30  0000 L CNN
F 1 "100n" H 2875 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2850 750 60  0001 C CNN
F 3 "" H 2850 750 60  0001 C CNN
	1    2850 750 
	1    0    0    -1  
$EndComp
$Comp
L Csmall C12
U 1 1 51E0350B
P 2650 750
F 0 "C12" H 2675 800 30  0000 L CNN
F 1 "100n" H 2675 700 30  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2650 750 60  0001 C CNN
F 3 "" H 2650 750 60  0001 C CNN
	1    2650 750 
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-pcb_sram #PWR021
U 1 1 51E034D8
P 3450 2150
F 0 "#PWR021" H 3450 2150 30  0001 C CNN
F 1 "GND" H 3450 2080 30  0001 C CNN
F 2 "" H 3450 2150 60  0001 C CNN
F 3 "" H 3450 2150 60  0001 C CNN
	1    3450 2150
	1    0    0    -1  
$EndComp
Text Label 950  4400 0    20   ~ 0
pg12
Text Label 950  4300 0    20   ~ 0
sram3_ce
Text Label 950  4250 0    20   ~ 0
sram2_ce
Text Label 2100 2750 0    20   ~ 0
sram_a18
Text Label 2100 2700 0    20   ~ 0
sram_a17
Text Label 2100 2650 0    20   ~ 0
sram_a16
Text Label 950  4050 0    20   ~ 0
sram_a15
Text Label 950  4000 0    20   ~ 0
sram_a14
Text Label 950  3950 0    20   ~ 0
sram_a13
Text Label 950  3900 0    20   ~ 0
sram_a12
Text Label 950  3850 0    20   ~ 0
sram_a11
Text Label 950  3800 0    20   ~ 0
sram_a10
Text Label 2100 3700 0    20   ~ 0
sram_a9
Text Label 2100 3650 0    20   ~ 0
sram_a8
Text Label 2100 3600 0    20   ~ 0
sram_a7
Text Label 2100 3550 0    20   ~ 0
sram_a6
Text Label 2100 3200 0    20   ~ 0
sram_a5
Text Label 2100 3150 0    20   ~ 0
sram_a4
Text Label 2100 3100 0    20   ~ 0
sram_a3
Text Label 2100 3050 0    20   ~ 0
sram_a2
Text Label 2100 3000 0    20   ~ 0
sram_a1
Text Label 2100 2950 0    20   ~ 0
sram_a0
Text Label 2100 2600 0    20   ~ 0
sram_d15
Text Label 2100 2550 0    20   ~ 0
sram_d14
Text Label 2100 2500 0    20   ~ 0
sram_d13
Text Label 2100 2150 0    20   ~ 0
sram_d3
Text Label 2100 2100 0    20   ~ 0
sram_d2
Text Label 2100 2850 0    20   ~ 0
sram_d1
Text Label 2100 2800 0    20   ~ 0
sram_d0
Text Label 950  3700 0    20   ~ 0
sram_d12
Text Label 950  3650 0    20   ~ 0
sram_d11
Text Label 950  3600 0    20   ~ 0
sram_d10
Text Label 950  3550 0    20   ~ 0
sram_d9
Text Label 950  3500 0    20   ~ 0
sram_d8
Text Label 950  3450 0    20   ~ 0
sram_d7
Text Label 950  3400 0    20   ~ 0
sram_d6
Text Label 950  3350 0    20   ~ 0
sram_d5
Text Label 950  3300 0    20   ~ 0
sram_d4
Text Label 950  3150 0    20   ~ 0
sram_a20
Text Label 950  3100 0    20   ~ 0
sram_a19
Text Label 950  3000 0    20   ~ 0
pe1
Text Label 950  2950 0    20   ~ 0
pe0
Text Label 2100 2350 0    20   ~ 0
sram_we
Text Label 2100 2300 0    20   ~ 0
sram_oe
Text Label 2100 2450 0    20   ~ 0
sram1_ce
$Comp
L STM32F40X_LQFP144 U1
U 2 1 51D12604
P 3950 1600
F 0 "U1" H 3950 2250 60  0000 C CNN
F 1 "STM32F40X_LQFP144" H 4000 950 60  0000 C CNN
F 2 "Housings_QFP:LQFP-144_20x20mm_Pitch0.5mm" H 3950 1600 60  0001 C CNN
F 3 "" H 3950 1600 60  0001 C CNN
	2    3950 1600
	1    0    0    -1  
$EndComp
$Comp
L STM32F40X_LQFP144 U1
U 1 1 51D125EF
P 1600 2900
F 0 "U1" H 1600 4650 60  0000 C CNN
F 1 "STM32F40X_LQFP144" H 1600 1100 60  0000 C CNN
F 2 "Housings_QFP:LQFP-144_20x20mm_Pitch0.5mm" H 1600 2900 60  0001 C CNN
F 3 "" H 1600 2900 60  0001 C CNN
	1    1600 2900
	1    0    0    -1  
$EndComp
Text Label 7500 4200 0    60   ~ 0
sram_d0
Text Label 8900 4200 2    60   ~ 0
sram_d1
Text Label 8525 3800 0    60   ~ 0
sram_d2
Text Label 8900 3900 2    60   ~ 0
sram_d3
Text Label 7500 5000 0    60   ~ 0
sram_d4
Text Label 8900 5000 2    60   ~ 0
sram_d5
Text Label 7500 4900 0    60   ~ 0
sram_d6
Text Label 8900 4900 2    60   ~ 0
sram_d7
Text Label 7500 4700 0    60   ~ 0
sram_d8
Text Label 8900 4700 2    60   ~ 0
sram_d9
Text Label 7500 4600 0    60   ~ 0
sram_d10
Text Label 8900 4600 2    60   ~ 0
sram_d11
Text Label 7500 4500 0    60   ~ 0
sram_d12
Text Label 8900 4500 2    60   ~ 0
sram_d13
Text Label 7500 4300 0    60   ~ 0
sram_d14
Text Label 8900 4300 2    60   ~ 0
sram_d15
Text Label 8900 5300 2    60   ~ 0
sram_a0
Text Label 7500 5300 0    60   ~ 0
sram_a1
Text Label 8900 5400 2    60   ~ 0
sram_a2
Text Label 7500 5400 0    60   ~ 0
sram_a3
Text Label 8900 5500 2    60   ~ 0
sram_a4
Text Label 7500 5500 0    60   ~ 0
sram_a5
Text Label 7500 5100 0    60   ~ 0
sram_a6
Text Label 8900 5100 2    60   ~ 0
sram_a7
Text Label 8900 3700 2    60   ~ 0
vcc_io
Text Label 7500 3900 0    60   ~ 0
sram_oe
Text Label 8900 4100 2    60   ~ 0
sram_we
Text Label 7500 4100 0    60   ~ 0
sram2_ce
Text Label 7875 3800 2    60   ~ 0
fpga_io1
Text Label 7500 3700 0    60   ~ 0
fpga_io2
$Comp
L GND #PWR022
U 1 1 579D3A4E
P 7250 5750
F 0 "#PWR022" H 7250 5500 50  0001 C CNN
F 1 "GND" H 7258 5573 50  0000 C CNN
F 2 "" H 7250 5750 50  0000 C CNN
F 3 "" H 7250 5750 50  0000 C CNN
	1    7250 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 579D4134
P 9150 5750
F 0 "#PWR023" H 9150 5500 50  0001 C CNN
F 1 "GND" H 9158 5573 50  0000 C CNN
F 2 "" H 9150 5750 50  0000 C CNN
F 3 "" H 9150 5750 50  0000 C CNN
	1    9150 5750
	-1   0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 579D81F4
P 8800 1375
F 0 "R3" V 8700 1375 50  0000 C CNN
F 1 "47k" V 8800 1375 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8800 1375 50  0001 C CNN
F 3 "" H 8800 1375 50  0000 C CNN
	1    8800 1375
	0    1    1    0   
$EndComp
$Comp
L GND #PWR024
U 1 1 579D95B6
P 850 6050
F 0 "#PWR024" H 850 5800 50  0001 C CNN
F 1 "GND" H 858 5873 50  0000 C CNN
F 2 "" H 850 6050 50  0000 C CNN
F 3 "" H 850 6050 50  0000 C CNN
	1    850  6050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR025
U 1 1 579DA110
P 9150 3550
F 0 "#PWR025" H 9150 3510 30  0001 C CNN
F 1 "+3.3V" H 9150 3660 30  0000 C CNN
F 2 "" H 9150 3550 60  0001 C CNN
F 3 "" H 9150 3550 60  0001 C CNN
	1    9150 3550
	-1   0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 579DFF86
P 9150 3800
F 0 "C1" H 9000 3900 50  0000 L CNN
F 1 "10uF" H 8950 3700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9150 3800 50  0001 C CNN
F 3 "" H 9150 3800 50  0000 C CNN
	1    9150 3800
	-1   0    0    -1  
$EndComp
Text Label 4400 1900 0    30   ~ 0
boot0
Text Notes 4800 5450 0    120  ~ 0
Boot selection
Text Label 4550 6025 0    60   ~ 0
boot0
$Comp
L R_Small R5
U 1 1 579E47BD
P 4975 6700
F 0 "R5" V 4875 6700 50  0000 C CNN
F 1 "47k" V 4975 6700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4975 6700 50  0001 C CNN
F 3 "" H 4975 6700 50  0000 C CNN
	1    4975 6700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR026
U 1 1 579E4C44
P 5375 6800
F 0 "#PWR026" H 5375 6550 50  0001 C CNN
F 1 "GND" H 5383 6623 50  0000 C CNN
F 2 "" H 5375 6800 50  0000 C CNN
F 3 "" H 5375 6800 50  0000 C CNN
	1    5375 6800
	1    0    0    -1  
$EndComp
Text Label 4575 6700 0    60   ~ 0
boot1
Text Notes 4600 7400 0    60   ~ 0
Jumper off boots from flash (BOOT0=0)\nJumper on boots from system/DFU\n  (BOOT0=1 BOOT1=0)
NoConn ~ 1100 6250
$Comp
L CONN_02X12 P5
U 1 1 57A0DE95
P 2000 6300
F 0 "P5" H 2000 5513 50  0000 C CNN
F 1 "CONN_02X12" H 2000 5606 50  0000 C CNN
F 2 "knielsenlib:ice40_top_conn_12" H 2000 5100 50  0001 C CNN
F 3 "" H 2000 5100 50  0000 C CNN
	1    2000 6300
	1    0    0    1   
$EndComp
$Comp
L CONN_02X20 P2
U 1 1 57A0EAC3
P 8200 4650
F 0 "P2" H 8200 5821 50  0000 C CNN
F 1 "CONN_02X20" H 8200 5728 50  0000 C CNN
F 2 "knielsenlib:ice40_vert_conn" H 8200 3700 50  0001 C CNN
F 3 "" H 8200 3700 50  0000 C CNN
	1    8200 4650
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_INV SW1
U 1 1 57A10848
P 5650 6025
F 0 "SW1" H 5650 6362 50  0000 C CNN
F 1 "SWITCH_INV" H 5650 6269 50  0000 C CNN
F 2 "knielsenlib:switch_msk_12c02" H 5650 6025 50  0001 C CNN
F 3 "" H 5650 6025 50  0000 C CNN
	1    5650 6025
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR027
U 1 1 57A113F4
P 6225 5850
F 0 "#PWR027" H 6225 5810 30  0001 C CNN
F 1 "+3.3V" H 6225 5960 30  0000 C CNN
F 2 "" H 6225 5850 60  0001 C CNN
F 3 "" H 6225 5850 60  0001 C CNN
	1    6225 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 57A11614
P 4950 6325
F 0 "#PWR028" H 4950 6075 50  0001 C CNN
F 1 "GND" H 5050 6200 50  0000 C CNN
F 2 "" H 4950 6325 50  0000 C CNN
F 3 "" H 4950 6325 50  0000 C CNN
	1    4950 6325
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 57A1201A
P 4950 6175
F 0 "R4" H 5009 6222 50  0000 L CNN
F 1 "47k" H 5009 6129 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 4950 6175 50  0001 C CNN
F 3 "" H 4950 6175 50  0000 C CNN
	1    4950 6175
	1    0    0    -1  
$EndComp
NoConn ~ 6150 6125
Text Label 5100 3600 0    40   ~ 0
user_led1
$Comp
L SD_CARD P1
U 1 1 57A16B82
P 7600 1825
F 0 "P1" H 7606 2637 60  0000 C CNN
F 1 "SD_CARD" H 7606 2527 60  0000 C CNN
F 2 "knielsenlib:SD_CARD_10100" H 7600 1825 60  0001 C CNN
F 3 "" H 7600 1825 60  0000 C CNN
	1    7600 1825
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 57A16E97
P 8550 2550
F 0 "#PWR029" H 8550 2300 50  0001 C CNN
F 1 "GND" H 8558 2373 50  0000 C CNN
F 2 "" H 8550 2550 50  0000 C CNN
F 3 "" H 8550 2550 50  0000 C CNN
	1    8550 2550
	1    0    0    -1  
$EndComp
Text Label 8050 2275 0    40   ~ 0
sd_wp
$Comp
L GND #PWR030
U 1 1 57A1AB0F
P 3100 5950
F 0 "#PWR030" H 3100 5700 50  0001 C CNN
F 1 "GND" H 3108 5773 50  0000 C CNN
F 2 "" H 3100 5950 50  0000 C CNN
F 3 "" H 3100 5950 50  0000 C CNN
	1    3100 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 57A1AB77
P 2950 6950
F 0 "#PWR031" H 2950 6700 50  0001 C CNN
F 1 "GND" H 2958 6773 50  0000 C CNN
F 2 "" H 2950 6950 50  0000 C CNN
F 3 "" H 2950 6950 50  0000 C CNN
	1    2950 6950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 57A1ABDD
P 1100 6950
F 0 "#PWR032" H 1100 6700 50  0001 C CNN
F 1 "GND" H 1108 6773 50  0000 C CNN
F 2 "" H 1100 6950 50  0000 C CNN
F 3 "" H 1100 6950 50  0000 C CNN
	1    1100 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1600 6400 1700
Wire Wire Line
	6150 1600 6400 1600
Wire Wire Line
	4950 1600 5750 1600
Wire Wire Line
	4950 1600 4950 1750
Wire Wire Line
	5050 3600 5350 3600
Wire Wire Line
	5850 3600 6050 3600
Wire Wire Line
	6700 3600 6700 4250
Wire Wire Line
	6700 3600 6450 3600
Wire Wire Line
	9150 1775 9150 1825
Wire Wire Line
	7950 1575 9350 1575
Connection ~ 5400 950 
Wire Wire Line
	5400 950  5700 950 
Connection ~ 5400 1150
Wire Wire Line
	5400 1150 5350 1150
Wire Wire Line
	5350 1150 5350 1050
Wire Wire Line
	5350 1050 4550 1050
Wire Wire Line
	4550 1050 4550 1400
Wire Wire Line
	4550 1400 4350 1400
Wire Wire Line
	6300 950  6450 950 
Connection ~ 5400 850 
Wire Wire Line
	5400 700  5400 1200
Wire Wire Line
	5250 1800 5250 1750
Wire Wire Line
	5250 1750 5150 1750
Wire Wire Line
	5600 850  5600 700 
Connection ~ 5400 700 
Connection ~ 5000 1250
Wire Wire Line
	5000 1200 5000 1250
Wire Wire Line
	4350 1250 5150 1250
Wire Wire Line
	4650 1400 4650 1550
Wire Wire Line
	4650 1550 4350 1550
Wire Wire Line
	4950 1450 4950 1400
Wire Wire Line
	4950 1400 4850 1400
Wire Wire Line
	4350 1800 4650 1800
Connection ~ 4800 2600
Wire Wire Line
	4550 2600 5000 2600
Wire Wire Line
	3600 4100 3900 4100
Wire Wire Line
	3900 3800 3600 3800
Wire Wire Line
	3750 4900 3750 5000
Wire Wire Line
	3600 4000 3900 4000
Wire Wire Line
	3600 3900 3900 3900
Wire Wire Line
	2050 3500 2250 3500
Wire Wire Line
	2050 3450 2250 3450
Wire Wire Line
	2050 3400 2250 3400
Wire Wire Line
	2050 3350 2250 3350
Wire Wire Line
	2050 3300 2250 3300
Wire Wire Line
	2050 3250 2250 3250
Wire Wire Line
	2050 2250 2250 2250
Wire Wire Line
	1100 4550 900  4550
Wire Wire Line
	1100 4500 900  4500
Wire Wire Line
	1100 4450 900  4450
Wire Wire Line
	1100 4200 900  4200
Wire Wire Line
	1100 4150 900  4150
Wire Wire Line
	1100 4100 900  4100
Wire Wire Line
	1100 3050 900  3050
Wire Wire Line
	1100 2450 900  2450
Wire Wire Line
	1100 2400 900  2400
Wire Wire Line
	1100 2350 900  2350
Wire Wire Line
	1100 2300 900  2300
Wire Wire Line
	1100 2250 900  2250
Wire Wire Line
	1100 2200 900  2200
Wire Wire Line
	1100 2150 900  2150
Wire Wire Line
	1100 2100 900  2100
Wire Wire Line
	2050 2200 2250 2200
Wire Wire Line
	1100 2700 900  2700
Wire Wire Line
	1100 2600 900  2600
Wire Wire Line
	1100 2500 900  2500
Connection ~ 3650 850 
Connection ~ 3550 850 
Connection ~ 3850 650 
Connection ~ 3450 650 
Connection ~ 3050 650 
Connection ~ 2650 650 
Connection ~ 2250 650 
Connection ~ 2250 850 
Connection ~ 2650 850 
Connection ~ 3050 850 
Connection ~ 3450 850 
Connection ~ 3550 1100
Connection ~ 3550 1200
Connection ~ 3550 1300
Connection ~ 3550 1400
Connection ~ 3550 1500
Connection ~ 3550 2050
Wire Wire Line
	3550 1700 3550 2100
Connection ~ 3550 1950
Connection ~ 3550 1850
Connection ~ 3550 1750
Wire Wire Line
	900  4400 1100 4400
Wire Wire Line
	1100 4250 900  4250
Wire Wire Line
	2050 3700 2250 3700
Wire Wire Line
	2050 3650 2250 3650
Wire Wire Line
	2050 3600 2250 3600
Wire Wire Line
	2050 3550 2250 3550
Wire Wire Line
	2050 2850 2250 2850
Wire Wire Line
	2050 2800 2250 2800
Wire Wire Line
	2050 2750 2250 2750
Wire Wire Line
	2050 2700 2250 2700
Wire Wire Line
	2050 2650 2250 2650
Wire Wire Line
	2050 2600 2250 2600
Wire Wire Line
	2050 2550 2250 2550
Wire Wire Line
	2050 2500 2250 2500
Wire Wire Line
	1100 3000 900  3000
Wire Wire Line
	2050 2300 2250 2300
Wire Wire Line
	2050 2450 2250 2450
Wire Wire Line
	2050 2350 2250 2350
Wire Wire Line
	1100 2950 900  2950
Wire Wire Line
	2050 2100 2250 2100
Wire Wire Line
	2050 2150 2250 2150
Wire Wire Line
	2050 2950 2250 2950
Wire Wire Line
	2050 3000 2250 3000
Wire Wire Line
	2050 3050 2250 3050
Wire Wire Line
	2050 3100 2250 3100
Wire Wire Line
	2050 3150 2250 3150
Wire Wire Line
	2050 3200 2250 3200
Wire Wire Line
	1100 3100 900  3100
Wire Wire Line
	1100 3150 900  3150
Wire Wire Line
	1100 3300 900  3300
Wire Wire Line
	1100 3350 900  3350
Wire Wire Line
	1100 3400 900  3400
Wire Wire Line
	1100 3450 900  3450
Wire Wire Line
	1100 3500 900  3500
Wire Wire Line
	1100 3550 900  3550
Wire Wire Line
	1100 3600 900  3600
Wire Wire Line
	1100 3650 900  3650
Wire Wire Line
	1100 3700 900  3700
Wire Wire Line
	1100 3800 900  3800
Wire Wire Line
	1100 3850 900  3850
Wire Wire Line
	1100 3900 900  3900
Wire Wire Line
	1100 3950 900  3950
Wire Wire Line
	1100 4000 900  4000
Wire Wire Line
	1100 4050 900  4050
Wire Wire Line
	1100 4300 900  4300
Connection ~ 3550 1800
Connection ~ 3550 1900
Connection ~ 3550 2000
Wire Wire Line
	3550 2100 3450 2100
Wire Wire Line
	3450 2100 3450 2150
Connection ~ 3550 1550
Connection ~ 3550 1450
Connection ~ 3550 1350
Connection ~ 3550 1250
Connection ~ 3550 1150
Wire Wire Line
	3550 850  3550 1600
Connection ~ 3550 1050
Connection ~ 3250 850 
Connection ~ 2850 850 
Connection ~ 2450 850 
Connection ~ 2050 850 
Connection ~ 2050 650 
Connection ~ 2450 650 
Connection ~ 2850 650 
Connection ~ 3250 650 
Connection ~ 3650 650 
Wire Wire Line
	1850 650  4450 650 
Wire Wire Line
	4450 650  4450 700 
Connection ~ 4050 650 
Connection ~ 3850 850 
Wire Wire Line
	3550 950  3400 950 
Connection ~ 3550 950 
Wire Wire Line
	3400 950  3400 1000
Wire Wire Line
	1100 2550 900  2550
Wire Wire Line
	1100 2650 900  2650
Wire Wire Line
	1100 1250 900  1250
Wire Wire Line
	1100 1300 900  1300
Wire Wire Line
	1100 1350 900  1350
Wire Wire Line
	1100 1400 900  1400
Wire Wire Line
	1100 1450 900  1450
Wire Wire Line
	1100 1500 900  1500
Wire Wire Line
	1100 1550 900  1550
Wire Wire Line
	1100 1600 900  1600
Wire Wire Line
	1100 1650 900  1650
Wire Wire Line
	1100 1700 900  1700
Wire Wire Line
	1100 1750 900  1750
Wire Wire Line
	1100 1800 900  1800
Wire Wire Line
	1100 1850 900  1850
Wire Wire Line
	1100 1900 900  1900
Wire Wire Line
	1100 1950 900  1950
Wire Wire Line
	1100 2000 900  2000
Wire Wire Line
	1100 2750 900  2750
Wire Wire Line
	1100 2800 900  2800
Wire Wire Line
	1100 2850 900  2850
Wire Wire Line
	1100 3200 900  3200
Wire Wire Line
	1100 3250 900  3250
Wire Wire Line
	1100 4350 900  4350
Wire Wire Line
	2050 1250 2250 1250
Wire Wire Line
	2050 1300 2250 1300
Wire Wire Line
	2050 1350 2250 1350
Wire Wire Line
	2050 1400 2250 1400
Wire Wire Line
	2050 1450 2250 1450
Wire Wire Line
	2050 1500 2250 1500
Wire Wire Line
	2050 1550 2250 1550
Wire Wire Line
	2050 1600 2250 1600
Wire Wire Line
	2050 1650 2250 1650
Wire Wire Line
	2050 1700 2250 1700
Wire Wire Line
	2050 1750 2250 1750
Wire Wire Line
	2050 1800 2250 1800
Wire Wire Line
	2050 1850 2250 1850
Wire Wire Line
	2050 1900 2250 1900
Wire Wire Line
	2050 1950 2250 1950
Wire Wire Line
	2050 2000 2250 2000
Wire Wire Line
	2050 2400 2250 2400
Wire Wire Line
	3600 4300 3750 4300
Wire Wire Line
	3600 4200 3900 4200
Wire Wire Line
	3900 4200 3900 4300
Wire Wire Line
	4350 2050 4550 2050
Wire Wire Line
	4550 2050 4550 2600
Wire Wire Line
	4350 2000 5000 2000
Connection ~ 4800 2000
Wire Wire Line
	5200 2000 5200 2750
Connection ~ 5200 2600
Wire Wire Line
	4850 1400 4850 1600
Wire Wire Line
	4350 1600 4650 1600
Wire Wire Line
	4350 1100 4450 1100
Wire Wire Line
	4450 1100 4450 1150
Wire Wire Line
	1850 850  4250 850 
Connection ~ 4050 850 
Connection ~ 4250 650 
Wire Wire Line
	5350 1250 5350 1300
Wire Wire Line
	5600 1050 5600 1300
Connection ~ 5600 1200
Wire Wire Line
	6450 950  6450 900 
Connection ~ 5400 1050
Wire Wire Line
	5600 700  5800 700 
Wire Wire Line
	5800 700  5800 750 
Wire Wire Line
	4950 1750 4350 1750
Wire Wire Line
	4350 1050 4450 1050
Wire Wire Line
	4450 1050 4450 950 
Wire Wire Line
	4450 950  5350 950 
Wire Wire Line
	5350 950  5350 750 
Wire Wire Line
	5350 750  5400 750 
Connection ~ 5400 750 
Wire Wire Line
	4850 950  4850 850 
Connection ~ 4850 950 
Wire Wire Line
	7950 1775 9350 1775
Connection ~ 9150 1575
Connection ~ 9150 1775
Wire Wire Line
	6450 4050 6700 4050
Connection ~ 6700 4050
Wire Wire Line
	5850 4050 6050 4050
Wire Wire Line
	5050 4050 5350 4050
Wire Wire Line
	5550 1600 5550 1900
Connection ~ 5550 1600
Wire Wire Line
	5550 1900 5750 1900
Connection ~ 5750 1600
Connection ~ 5750 1900
Wire Wire Line
	6150 1900 6300 1900
Wire Wire Line
	6300 1900 6300 1600
Connection ~ 6300 1600
Wire Wire Line
	7950 3700 7400 3700
Wire Wire Line
	7950 3800 7400 3800
Wire Wire Line
	7950 3900 7400 3900
Wire Wire Line
	7250 4000 7950 4000
Wire Wire Line
	7950 4100 7400 4100
Wire Wire Line
	7950 4200 7400 4200
Wire Wire Line
	7950 4300 7400 4300
Wire Wire Line
	7250 4400 7950 4400
Wire Wire Line
	7950 4500 7400 4500
Wire Wire Line
	7950 4600 7400 4600
Wire Wire Line
	7950 4700 7400 4700
Wire Wire Line
	7250 4800 7950 4800
Wire Wire Line
	7950 4900 7400 4900
Wire Wire Line
	7950 5000 7400 5000
Wire Wire Line
	7950 5100 7400 5100
Wire Wire Line
	7250 5200 7950 5200
Wire Wire Line
	7950 5300 7400 5300
Wire Wire Line
	7950 5400 7400 5400
Wire Wire Line
	7950 5500 7400 5500
Wire Wire Line
	7250 5600 7950 5600
Wire Wire Line
	9150 3700 8450 3700
Wire Wire Line
	8450 3800 9000 3800
Wire Wire Line
	8450 3900 9000 3900
Wire Wire Line
	9150 4000 8450 4000
Wire Wire Line
	8450 4100 9000 4100
Wire Wire Line
	8450 4200 9000 4200
Wire Wire Line
	8450 4300 9000 4300
Wire Wire Line
	9150 4400 8450 4400
Wire Wire Line
	8450 4500 9000 4500
Wire Wire Line
	8450 4600 9000 4600
Wire Wire Line
	8450 4700 9000 4700
Wire Wire Line
	9150 4800 8450 4800
Wire Wire Line
	8450 4900 9000 4900
Wire Wire Line
	8450 5000 9000 5000
Wire Wire Line
	8450 5100 9000 5100
Wire Wire Line
	9150 5200 8450 5200
Wire Wire Line
	8450 5300 9000 5300
Wire Wire Line
	8450 5400 9000 5400
Wire Wire Line
	8450 5500 9000 5500
Wire Wire Line
	8450 5600 9400 5600
Wire Wire Line
	7250 4000 7250 5750
Connection ~ 7250 4400
Connection ~ 7250 4800
Connection ~ 7250 5200
Wire Wire Line
	9150 3900 9150 5750
Connection ~ 9150 5200
Connection ~ 9150 4800
Connection ~ 9150 4400
Connection ~ 9150 5600
Connection ~ 7250 5600
Wire Wire Line
	1750 5750 1100 5750
Wire Wire Line
	850  5950 1750 5950
Wire Wire Line
	1750 6050 1100 6050
Wire Wire Line
	1750 6150 1100 6150
Wire Wire Line
	1750 6250 1100 6250
Wire Wire Line
	1750 6350 1100 6350
Wire Wire Line
	1750 6450 1100 6450
Wire Wire Line
	1750 6550 1100 6550
Wire Wire Line
	1750 6650 1100 6650
Wire Wire Line
	900  6750 1750 6750
Wire Wire Line
	1750 6850 1100 6850
Wire Wire Line
	2950 5750 2250 5750
Wire Wire Line
	2250 5850 3100 5850
Wire Wire Line
	2950 5950 2250 5950
Wire Wire Line
	2950 6050 2250 6050
Wire Wire Line
	2950 6150 2250 6150
Wire Wire Line
	2950 6250 2250 6250
Wire Wire Line
	2950 6350 2250 6350
Wire Wire Line
	2950 6450 2250 6450
Wire Wire Line
	2950 6550 2250 6550
Wire Wire Line
	2950 6650 2250 6650
Wire Wire Line
	2250 6750 3150 6750
Wire Wire Line
	2950 6850 2250 6850
Wire Wire Line
	7950 2075 8550 2075
Wire Wire Line
	7950 1275 8550 1275
Wire Wire Line
	7950 1375 8700 1375
Wire Wire Line
	7950 1675 8550 1675
Wire Wire Line
	7950 1875 8550 1875
Wire Wire Line
	7950 1975 8550 1975
Wire Wire Line
	7950 2175 8550 2175
Wire Wire Line
	8900 1375 9000 1375
Wire Wire Line
	9000 1375 9000 1575
Connection ~ 9000 1575
Wire Wire Line
	9150 3550 9150 3700
Wire Wire Line
	850  5950 850  6050
Wire Wire Line
	1750 5850 1100 5850
Connection ~ 9150 4000
Wire Wire Line
	4350 1900 4550 1900
Wire Wire Line
	4525 6025 5150 6025
Wire Wire Line
	4525 6700 4875 6700
Wire Wire Line
	5075 6700 5375 6700
Wire Wire Line
	5375 6700 5375 6800
Wire Wire Line
	6150 5925 6225 5925
Wire Wire Line
	6225 5925 6225 5850
Wire Wire Line
	4950 6275 4950 6325
Wire Wire Line
	4950 6025 4950 6075
Connection ~ 4950 6025
Wire Wire Line
	7950 2375 8550 2375
Wire Wire Line
	8550 2375 8550 2550
Wire Wire Line
	7950 2275 8550 2275
Wire Wire Line
	7950 1475 8675 1475
Wire Wire Line
	8675 1475 8675 1775
Connection ~ 8675 1775
Wire Wire Line
	3100 5850 3100 5950
Wire Wire Line
	1100 6850 1100 6950
Wire Wire Line
	2950 6850 2950 6950
Wire Wire Line
	3150 6750 3150 6650
Wire Wire Line
	900  6750 900  6650
$Comp
L +3.3V-RESCUE-pcb_sram #PWR033
U 1 1 57A1B5FD
P 3150 6650
F 0 "#PWR033" H 3150 6610 30  0001 C CNN
F 1 "+3.3V" H 3150 6760 30  0000 C CNN
F 2 "" H 3150 6650 60  0001 C CNN
F 3 "" H 3150 6650 60  0001 C CNN
	1    3150 6650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-pcb_sram #PWR034
U 1 1 57A1B65E
P 900 6650
F 0 "#PWR034" H 900 6610 30  0001 C CNN
F 1 "+3.3V" H 900 6760 30  0000 C CNN
F 2 "" H 900 6650 60  0001 C CNN
F 3 "" H 900 6650 60  0001 C CNN
	1    900  6650
	1    0    0    -1  
$EndComp
Text Label 1300 6650 0    60   ~ 0
pe0
Text Label 2300 6650 0    60   ~ 0
pe1
Text Label 2300 6550 0    60   ~ 0
pb9
Text Label 1300 6550 0    60   ~ 0
pb8
Text Label 1300 6450 0    60   ~ 0
pb6
Text Label 1300 6350 0    60   ~ 0
pb4
Text Label 2300 6450 0    60   ~ 0
pb7
Text Label 2300 6350 0    60   ~ 0
pb5
Text Label 2300 6250 0    60   ~ 0
pb3
Text Label 2300 6150 0    60   ~ 0
pg14
Text Label 2300 6050 0    60   ~ 0
pg13
Text Label 2300 5950 0    60   ~ 0
pg12
Text Label 2300 5750 0    60   ~ 0
usb_5v
NoConn ~ 900  1250
NoConn ~ 900  1300
NoConn ~ 900  1350
NoConn ~ 900  1400
NoConn ~ 900  1450
NoConn ~ 900  1500
NoConn ~ 900  1550
NoConn ~ 900  1600
NoConn ~ 2250 1250
NoConn ~ 2250 1300
NoConn ~ 2250 1950
NoConn ~ 2250 2000
NoConn ~ 900  2100
NoConn ~ 900  2150
NoConn ~ 900  2200
NoConn ~ 900  2250
NoConn ~ 900  2300
NoConn ~ 900  2350
NoConn ~ 900  2400
NoConn ~ 900  2450
NoConn ~ 900  2750
NoConn ~ 900  2800
NoConn ~ 900  2850
NoConn ~ 2250 2250
NoConn ~ 2250 2400
NoConn ~ 2250 2450
NoConn ~ 2250 2650
NoConn ~ 2250 2700
NoConn ~ 2250 2750
NoConn ~ 900  3050
NoConn ~ 900  3100
NoConn ~ 900  3150
NoConn ~ 900  3200
NoConn ~ 900  3250
NoConn ~ 2250 3250
NoConn ~ 2250 3300
NoConn ~ 2250 3350
NoConn ~ 2250 3400
NoConn ~ 2250 3450
NoConn ~ 2250 3500
NoConn ~ 2250 3650
NoConn ~ 2250 3700
NoConn ~ 900  3800
NoConn ~ 900  3850
NoConn ~ 900  3900
NoConn ~ 900  3950
NoConn ~ 900  4000
NoConn ~ 900  4050
NoConn ~ 900  4150
NoConn ~ 900  4200
NoConn ~ 900  4300
NoConn ~ 900  4350
NoConn ~ 900  4550
Wire Wire Line
	9150 3625 9375 3625
Wire Wire Line
	9375 3625 9375 3550
Connection ~ 9150 3625
$Comp
L PWR_FLAG #FLG035
U 1 1 57A2473C
P 9375 3550
F 0 "#FLG035" H 9375 3645 50  0001 C CNN
F 1 "PWR_FLAG" H 9375 3778 50  0000 C CNN
F 2 "" H 9375 3550 50  0000 C CNN
F 3 "" H 9375 3550 50  0000 C CNN
	1    9375 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 5600 9400 5750
$Comp
L PWR_FLAG #FLG036
U 1 1 57A249E7
P 9400 5750
F 0 "#FLG036" H 9400 5845 50  0001 C CNN
F 1 "PWR_FLAG" H 9400 5977 50  0000 C CNN
F 2 "" H 9400 5750 50  0000 C CNN
F 3 "" H 9400 5750 50  0000 C CNN
	1    9400 5750
	-1   0    0    1   
$EndComp
NoConn ~ 2250 1850
NoConn ~ 2250 1900
NoConn ~ 8975 1400
$EndSCHEMATC
