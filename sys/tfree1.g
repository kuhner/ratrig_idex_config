; tfree1.g
; called when tool 1 is freed
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Oct 29 2020 12:14:01 GMT-0400 (Eastern Daylight Time)

M83 ; relative extruder movement
M106 S0           ; turn off our print cooling fan
G91 ; relative axis movement
G1 Z3 F1000 ; up 3mm
G90 ; absolute axis movement
G1 H0 U356 F6000 ; park the U carriage at +364mm