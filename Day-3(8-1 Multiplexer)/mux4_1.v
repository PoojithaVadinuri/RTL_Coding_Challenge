module mux4_1(y,s,I);
input [3:0] I;
input [1:0] s;
output y;
wire t1,t2;

mux M1(t1,s[0],I[3],I[2]);
mux M2(t2,s[0],I[1],I[0]);
mux M3(y,s[1],t1,t2);
endmodule