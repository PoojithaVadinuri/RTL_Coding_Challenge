module counting1s(Y,I);
input [7:0] I;
output [3:0] Y;
wire [3:0] s1,s2,s3,s4,s5,s6,s7;
onebitproc z1(s7,I[7],4'b0000);
onebitproc z2(s6,I[6],s7);
onebitproc z3(s5,I[5],s6);
onebitproc z4(s4,I[4],s5);
onebitproc z5(s3,I[3],s4);
onebitproc z6(s2,I[2],s3);
onebitproc z7(s1,I[1],s2);
onebitproc z8(Y,I[0],s1);
endmodule