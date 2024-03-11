module tb;
reg clk=0;
reg reset=1;
reg din;
wire dout;

moore_nonoverlap dut(clk,reset,din,dout);

always #5 clk = !clk;
initial #2 reset=0;

initial 
	begin
	repeat(5) @(posedge clk);
	@(negedge clk);
	din=0;
	repeat(3)
	begin
	@(negedge clk);
	din=1;
	@(negedge clk);
	din=0;
	@(negedge clk);
	din=0;
	@(negedge clk);
	din=1;
	end
	@(negedge clk);
	$finish;
	end
endmodule
	
	
