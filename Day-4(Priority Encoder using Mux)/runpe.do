vlib work
vlog mux.v +define+m2
vlog mux_3bit.v +define+m2
vlog PE.v
vlog PE_tb.v

vsim work.tb
run -all