module tb;

reg clk=0;
wire rs,rw, en;
wire [7:0] dout;	
	
	
lcd dut (
.clk(clk),
.rs(rs),
.rw(rw),
.en(en),
.dout(dout)
);

	always #5 clk = !clk;

initial
	begin
	
	
	#10000;
	$finish;
	end
endmodule
	

