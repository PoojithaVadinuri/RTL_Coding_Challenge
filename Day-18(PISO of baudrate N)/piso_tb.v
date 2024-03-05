module tb;
reg clk=0;
reg rst=1;
reg start=0, startNBA=0; always @* startNBA <= start;

reg [7:0] din=0,dinNBA=0; always @* dinNBA <= din;
wire dout;


always #5 clk = !clk;
initial #2 rst=0;



piso dut(clk,rst,startNBA,dinNBA,dout);


initial
	begin
	repeat(20) @(posedge clk);
	repeat(5)
	begin
	start =1;
	din=$random;
	@(posedge clk);
	start=0;
	repeat(40) @(posedge clk);
	end
	$finish;
	end
	endmodule
	