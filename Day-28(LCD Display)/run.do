vlib work
vdel -all
vlib work
vlog LCD_Characters.v
vlog LCD_Characterstb.v
vsim work.tb
add wave -r *
run -all