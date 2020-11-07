; Configuration file for Duet Maestro (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Oct 29 2020 12:13:59 GMT-0400 (Eastern Daylight Time)

; General preferences
G90                                                             ; send absolute coordinates...
M83                                                             ; ...but relative extruder moves
M550 P"lk_printer"                                              ; set printer name

; Network
M552 P192.168.1.127 S1                                          ; enable network and set IP address
M553 P255.255.255.0                                             ; set netmask
M554 P192.168.1.254                                             ; set gateway
M586 P0 S1                                                      ; enable HTTP
M586 P1 S0                                                      ; disable FTP
M586 P2 S0                                                      ; disable Telnet

; Drives
M569 P0 S0                                                      ; physical drive 0 goes backwards
M569 P1 S1                                                      ; physical drive 1 goes forwards
M569 P2 S1                                                      ; physical drive 2 goes forwards
M569 P3 S1                                                      ; physical drive 3 goes forwards
M569 P4 S1                                                      ; physical drive 4 goes forwards
M569 P5 S1                                                      ; physical drive 5 goes forwards
M569 P6 S1                                                      ; physical drive 6 goes forwards
M584 X0 Y1 Z2:6 U5 E4:3                                         ; set drive mapping
M350 X256 Y256 Z256 U256 E256:256 I0                            ; configure microstepping without interpolation
M92 X1280.00 Y1280.00 Z6400.00 U1280.00 E6640.00:6640.00        ; set steps per mm
M566 X420.00 Y240.00 Z18.00 U420.00 E420.00:420.00              ; set maximum instantaneous speed changes (mm/min)
M203 X9600.00 Y9600.00 Z180.00 U9600.00 E6000.00:6000.00        ; set maximum speeds (mm/min)
M201 X800.00 Y500.00 Z100.00 U800.00 E10000.00:10000.00         ; set accelerations (mm/s^2)
M906 X1000 Y1000 Z600 U1000 E750:750 I30                        ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                         ; Set idle timeout

; Axis Limits
M208 X-66 Y-33 U0 Z0 S1                                           ; set axis minima
M208 X300 Y200 U365 Z295 S0                                          ; set axis maxima

; Endstops
M574 X1 S1 P"!xstop"                                            ; configure active-high endstop for low end on X via pin !xstop
M574 Y1 S1 P"!ystop"                                            ; configure active-high endstop for low end on Y via pin !ystop
M574 Z1 S2                                                      ; configure Z-probe endstop for low end on Z
M574 U2 S1 p"!e0stop"                                            ; configure active-high endstop for high end on U via pin !e0stop

; Z-Probe
M950 S0 C"^zprobe.mod"                                          ; create servo pin 0 for BLTouch
M558 P9 C"^zprobe.in" H5 F120 T9000                             ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-30 Y0.5 Z3                                            ; set Z probe trigger value, offset and trigger height
M557 X10:290 Y10:190 S40                                        ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4725 C7.06e-8         ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                                           ; create bed heater output on bedheat and map it to sensor 0
M307 H0 B0 S1.00                                                ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                         ; map heated bed to heater 0
M143 H0 S200                                                    ; set temperature limit for heater 0 to 200C
M308 S1 P"e0temp" Y"thermistor" T500000 B4723 C1.19622e-7       ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                            ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                                ; disable bang-bang mode for heater  and set PWM limit
M308 S2 P"e1temp" Y"thermistor" T500000 B4723 C1.19622e-7       ; configure sensor 2 as thermistor on pin e1temp
M950 H2 C"e1heat" T2                                            ; create nozzle heater output on e1heat and map it to sensor 2
M307 H2 B0 S1.00                                                ; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"fan0" Q500                                            ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                                  ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                                            ; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1:2 T45                                             ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q500                                            ; create fan 2 on pin fan2 and set its frequency
M106 P2 S0 H-1                                                  ; set fan 2 value. Thermostatic control is turned off

; Tools
M563 P0 S"Main (Left)" D0 H1 F0                                 ; define tool 0
G10 P0 X0 Y0 Z0                                                 ; set tool 0 axis offsets
G10 P0 R0 S0                                                    ; set initial tool 0 active and standby temperatures to 0C
M563 P1 S"Secondary (Right)" D1 H2 X3 F2                        ; define tool 1
G10 P1 X0 Y0 Z0                                                 ; set tool 1 axis offsets
G10 P1 R0 S0                                                    ; set initial tool 1 active and standby temperatures to 0C

; Custom settings
M501
M557 X0:270 Y10:190 P5:5                                       ; Bed leveling mesh
M572 D0 S0.025                                                  ; pressure advance
M671 X-147.75:297.75 Y0:0 S30                                   ; leadscrews at left (connected to Z) and right

; Miscellaneous
T0                                                              ; select first tool

