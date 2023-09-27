module tb;
reg [7:0] I;
wire [2:0] Y;
integer i;
eightx3msbPE PE1(Y,I);
initial 
 begin 
  for(i=0;i<=9;i=i+1)
  begin
   I=$random;
   #1;
   $display("I=%b,Y=%b",I,Y);
  end
 end
endmodule