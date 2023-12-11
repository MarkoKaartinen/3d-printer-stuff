G90 ; use absolute coordinates
M83 ; extruder relative mode
M104 S150 ; set temporary nozzle temp to prevent oozing during homing
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate

M140 S60 ; Set bed temp to 65
M190 S60 ; wait for bed temp to stabilize
G28 ; home all axis and restore leveling
@BEDLEVELVISUALIZER
G29 ; Auto Level

M140 S{first_layer_bed_temperature[0]} ; set final bed temp
M190 S{first_layer_bed_temperature[0]} ; wait for bed temp to stabilize

G1 X2.0 Y10 F3000
G1 Z0.28 F240
M104 S{first_layer_temperature[0]} ; set final nozzle temp
M109 S{first_layer_temperature[0]} ; wait for nozzle temp to stabilize

G1 X2 Y30 E2 F1200 ; Slowly move away from the possible blob at the nozzle
G92 E0