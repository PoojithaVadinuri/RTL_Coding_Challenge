module siso_design(clk,b,q);
input clk,b;
output q;
wire w1,w2,w3;

d_ff dut1(clk,rst,b,w1);
d_ff dut2(clk,rst,w1,w2);
d_ff dut3(clk,rst,w2,w3);
d_ff dut4(clk,rst,w3,q);
endmodule