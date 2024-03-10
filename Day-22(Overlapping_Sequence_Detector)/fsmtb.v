module tb;
	reg clk=0,rst=1,din;
	wire dout;
	
fsm_overlapping dut(.clk(clk),.rst(rst),.din(din),.dout(dout));
always #5 clk = !clk;
initial #2 rst=0;

initial
	begin
	repeat(2) @(posedge clk);
	
	@(negedge clk);
	din =1;
	@(negedge clk);
	din =0;
	@(negedge clk);
	din =1;
	@(negedge clk);
	din =1;
	@(negedge clk);
	din =1;
	@(negedge clk);
	din =1;
	@(negedge clk);
	din =0;
	@(negedge clk);
	$finish;
	end
endmodule
	
	
	
	

	