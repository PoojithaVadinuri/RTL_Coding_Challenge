module tb;
reg [7:0] A,B;
wire [16:0] Y;
mul8 dut(Y,A,B);

initial
 begin
  repeat(20)
   begin
    {A,B}=$random;
	#1;
	$display("A=%d B=%d Y=%d",A,B,Y);

   end
  repeat(10)
  begin
    {A,B}=$random;
	#1;
	$display("A=%b B=%b Y=%b",A,B,Y);
  end
 end
endmodule