module tb;
reg [7:0] I;
wire [3:0] Y;
counting1s DUT(Y,I);
initial
begin
 repeat(10)
 begin
  I=$random;
  #1;
  $display("Binary input(I)=%b     Number of 1's(Y)= %d",I,Y);
 end
end
endmodule