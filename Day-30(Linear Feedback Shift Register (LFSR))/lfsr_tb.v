module tb;
   reg clk = 0;
   reg reset=1;    // Active-high synchronous reset to 5'h1
   wire [4:0] q;


lfsr dut (
.clk(clk),
.reset(reset),
.q(q)
);

always #5 clk = !clk;

initial 
	begin
	#10 reset =0;
	
	#30 reset =1;
	#40 reset =0;
	end

initial 
	begin
	 #500;
	 $finish;
	end
endmodule
