module hw1(gt,eq,lt,A,B);
input [15:0] A,B;
output gt,eq,lt;
`ifdef m1
wire [2:0] B1;
comp8 a1(a,b,c,A[15:8],B[15:8]);
comp8 a2(d,e,f,A[7:0],B[7:0]);
mux3_bit_wide a3(B1,c,3'b001,{d,e,f});
mux3_bit_wide a4({gt,eq,lt},a,3'b100,B1);
`endif
`ifdef m2
wire gt,eq,lt;
assign gt =(A>B);
assign eq =(A==B);
assign lt =(A<B);
`endif

endmodule