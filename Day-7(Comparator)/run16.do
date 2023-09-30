vlib work

vlog mux.v
vlog mux_3bit.v
vlog comp1.v
vlog comp2.v
vlog comp16.v +define+m2
vlog comp4.v
vlog comp8.v
vlog comp16tb.v
vsim work.tb
run -all