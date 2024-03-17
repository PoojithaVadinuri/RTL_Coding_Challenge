vlib work
vdel -all
vlib work
vlog JohnsonCounter.v
vlog JohnsonCountertb.v
vsim work.tb
add wave -r *
run -all