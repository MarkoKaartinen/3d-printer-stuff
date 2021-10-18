; Initial setups
G90 ; use absolute coordinates
M83 ; extruder relative mode
M900 K0.12 ; K factor
M900 W[extrusion_width] H[layer_height] D[filament_diameter]
M200 D0 ; disable volumetric e
M220 S100 ; reset speed factor to 100%
M221 S100 ; reset extrusion rate to 100%

; Set the heating
M190 S[first_layer_bed_temperature] ; wait for bed to heat up
M104 S150 ; set extruder temp for auto bed leveling

; Home
G1 Z3 F3000 ; move z up little to prevent scratching of surface
G28 ; home all axes
G1 X3 Y3 F5000 ; move to corner of the bed to avoid ooze over centre

;Auto bed Leveling
@BEDLEVELVISUALIZER
G29 ; ABL T
M420 S1 Z3 ; reload and fade mesh bed leveling until it reach 3mm Z

; Wait for final heating
M104 S[first_layer_temperature] ; start nozzle heating but don't wait
M190 S[first_layer_bed_temperature] ; wait for the bed to heat up
M109 S[first_layer_temperature] ; wait for the nozzle to heat up

; Return to prime position, Prime line routine
G92 E0 ; Reset Extruder
G1 Z3 F3000 ; move z up little to prevent scratching of surface
G1 X10 Y.5 Z0.25 F5000.0 ; Move to start position
G1 X100 Y.5 Z0.25 F1500.0 E15 ; Draw the first line
G1 X100 Y.2 Z0.25 F5000.0 ; Move to side a little
G1 X10 Y.2 Z0.25 F1500.0 E30 ; Draw the second line
G92 E0 ; Reset Extruder
M221 S{if layer_height<0.075}100{else}95{endif}