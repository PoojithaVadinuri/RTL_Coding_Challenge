module tb;
reg [7:0] I;
reg [2:0] S;
wire Y;
integer i;
mux8_1 dut(Y,S,I);
initial
  begin
  for(i=0;i<=7;i=i+1)
  begin
   {I,S}=$random;
   #1;
   $display("I=%b,S=%b,Y=%b",I,S,Y);
  end
 end
endmodule