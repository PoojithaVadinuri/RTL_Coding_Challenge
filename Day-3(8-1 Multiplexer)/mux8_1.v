module mux8_1(Y,S,I);
input [7:0] I;
input [2:0] S;
output Y;
mux4_1 a1(y0,S[1:0],I[3:0]);
mux4_1 a2(y1,S[1:0],I[7:4]);
mux a3(Y,S[2],y1,y0);
endmodule