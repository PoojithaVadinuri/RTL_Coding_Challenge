vlib work
vdel -all
vlib work
vlog ringCounter.v
vlog ringCountertb.v
vsim work.tb
add wave -r *
run -all