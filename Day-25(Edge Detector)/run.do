vlib work
vdel -all
vlib work
vlog edge_detector.v
vlog edge_detector_tb.v
vsim work.tb
add wave -r *
run -all