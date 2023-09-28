module onebitproc(sumN,cb,sump);
input [3:0] sump;
input cb;
output [3:0] sumN;
wire [3:0] B1;

mux4 a1(sumN,cb,B1,sump);
RCA a2(B1,unused,sump,4'b0001);
endmodule