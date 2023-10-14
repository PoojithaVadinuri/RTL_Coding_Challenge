module sipo_shift_register_design(q,clk,b);
input clk,b;
output[3:0]q;
d_ff dut1(clk,rst,b,q[3]);
d_ff dut2(clk,rst,q[3],q[2]);
d_ff dut3(clk,rst,q[2],q[1]);
d_ff dut4(clk,rst,q[1],q[0]);

endmodule

