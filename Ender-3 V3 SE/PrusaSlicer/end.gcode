G91 ; Set all axis to relative
G1 E-1 ; Retract a little
G1 E-1 Z0.2 F240 ; Retract more and raise Z
G1 X5 Y5 F1000 ; Move out of the melt zone
{if max_layer_z < max_print_height-15}G1 Z10 F240 ; Move Z up {endif}
G90 ; Set all axis to absolute
G1 X0 Y{print_bed_max[1]*0.85} F3000 ; Present print

M140 S0 ; turn off heatbed
M104 S0 ; turn off temperature
M107 ; turn off fan
M84 X Y E ; disable motors