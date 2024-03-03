vlib work
vdel -all
vlib work
vlog -f $1.list +acc
vsim work.tb
add wave -r *
#do wave.do
run -all
