; pause.g
; called when a print from SD card is paused
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Oct 29 2020 12:14:00 GMT-0400 (Eastern Daylight Time)
M83            ; relative extruder moves
G1 E-10 F3600  ; retract 10mm of filament
G91            ; relative positioning
G1 Z5 F360     ; lift Z by 5mm
G90            ; absolute positioning
G1 S2 X-64 U364.33 F6000 ; park both heads

