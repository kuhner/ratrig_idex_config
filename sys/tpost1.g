; tpost1.g
; called after tool 1 has been selected
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Oct 29 2020 12:14:01 GMT-0400 (Eastern Daylight Time)

M106 R2           ; restore print cooling fan speed
M116 P1 ; wait for tool 1 heaters to reach operating temperature
M83 ; relative extruder movement