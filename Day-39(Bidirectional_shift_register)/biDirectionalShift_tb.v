module tb;
parameter N=4;
reg d;
reg en;
reg dir;
reg clk=0,rst=1;
wire [N-1 : 0] Q;

bidirectional_shift_reg #(.N(N)) dut(
.d(d),
.en(en),
.dir(dir),
.clk(clk),
.rst(rst),
.Q(Q)
);

initial #2 rst =0;
always #5 clk = !clk;
initial 
	begin
	repeat(5)
	begin
	@(posedge clk);
	en <=1;
	dir <=1;
	d <=1;
	@(posedge clk);
	en <=0;
	
	d <=0;
	@(posedge clk);
	en <=1;
	dir <=1;
	d <=1;
	@(posedge clk);
	en <=0;
	
	d <=0;
	
	@(posedge clk);
	en <=1;
	dir <=0;
	d <=1;
	@(posedge clk);
	en <=0;
	
	d <=0;
	@(posedge clk);
	en <=1;
	dir <=0;
	d <=1;
	@(posedge clk);
	en <=0;
	
	d <=0;
	
	end
	#500;
	$finish;
	end
endmodule
