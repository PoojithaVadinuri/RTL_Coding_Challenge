module Ripple_carry_adder(cout,sum,A,B);
input [3:0] A,B;
output [3:0] sum;
output cout;

ha a1(c0,sum[0],A[0],B[0]);
fa a2(c1,sum[1],A[1],B[1],c0);
fa a3(c2,sum[2],A[2],B[2],c1);
fa a4(cout,sum[3],A[3],B[3],c2);
endmodule
