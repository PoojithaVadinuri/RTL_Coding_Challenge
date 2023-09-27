
//3-bit wide 2:1 MUX
module mux3_bit_wide(y,s,I1,I0);
input s;
input [2:0] I1,I0;
output [2:0]y;
`ifdef m1
mux M1(y[2],s,I1[2],I0[2]);
mux M2(y[1],s,I1[1],I0[1]);
mux M3(y[0],s,I1[0],I0[0]);
`endif

//Another way
`ifdef m2
wire [2:0] y,I1,I0;
assign y = s ? I1:I0;
`endif
endmodule