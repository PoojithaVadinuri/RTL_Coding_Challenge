module mux4(Y,s,I1,I0);
input [3:0] I1,I0;
input s;
output [3:0] Y;
mux m1(Y[3],s,I1[3],I0[3]);
mux m2(Y[2],s,I1[2],I0[2]);
mux m3(Y[1],s,I1[1],I0[1]);
mux m4(Y[0],s,I1[0],I0[0]);

endmodule
