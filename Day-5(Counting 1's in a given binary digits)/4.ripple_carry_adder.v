module RCA(S,cout,A,B);
input [3:0] A,B;
output [3:0] S;
output cout;
ha M1(S[0],c0,A[0],B[0]);
fa M2(S[1],c1,A[1],B[1],c0);
fa M3(S[2],c2,A[2],B[2],c1);
fa M4(S[3],cout,A[3],B[3],c2);
endmodule
