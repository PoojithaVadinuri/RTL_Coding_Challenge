module eightx3msbPE(Y,I);
input [7:0] I;
output [2:0] Y;
wire[2:0] B1,B2,B3,B4,B5,B6,B7;

mux3_bit_wide M1(B1,I[0],3'b000,3'b000);
mux3_bit_wide M2(B2,I[1],3'b001,B1);
mux3_bit_wide M3(B3,I[2],3'b010,B2);
mux3_bit_wide M4(B4,I[3],3'b011,B3);
mux3_bit_wide M5(B5,I[4],3'b100,B4);
mux3_bit_wide M6(B6,I[5],3'b101,B5);
mux3_bit_wide M7(B7,I[6],3'b110,B6);
mux3_bit_wide M8(Y,I[7],3'b111,B7);
endmodule
