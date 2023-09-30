module comp2(gt,eq,lt,A,B);
input [1:0] A,B;
output gt,eq,lt;
wire [2:0] B1;
comp1 a1(a,b,c,A[1],B[1]);
comp1 a2(d,e,f,A[0],B[0]);
mux3_bit_wide a3(B1,c,3'b001,{d,e,f});
mux3_bit_wide a4({gt,eq,lt},a,3'b100,B1);

endmodule