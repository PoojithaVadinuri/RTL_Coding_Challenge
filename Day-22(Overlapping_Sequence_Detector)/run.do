vlib work
vdel -all
vlib work
vlog fsm.v
vlog fsmtb.v
vsim work.tb
add wave -r *
run -all