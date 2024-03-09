vlib work
vdel -all
vlib work
vlog seven_seg_display.v
vlog seven_seg_displaytb.v
vsim work.tb
add wave -r *
run -all