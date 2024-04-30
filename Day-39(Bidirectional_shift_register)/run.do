vlib work
vdel -all
vlib work
vlog -f $1.list
vsim work.tb
add wave -r *
run -all