module tb;

reg clk =0;
reg rst =1; initial #2 rst=0;
reg wr=0,wrNBA=0; always @* wrNBA <= wr;
reg rd=0,rdNBA=0; always @* rdNBA <= rd;
wire [3:0] wrptr;
wire [3:0] rdptr;
reg [7:0] din=0,dinNBA=0;always @* dinNBA <= din;
wire [7:0] dout;

fifo dut (.*,.wr(wrNBA),.rd(rdNBA),.din(dinNBA));
always #5 clk = !clk;

initial begin
	cycles(5);
	repeat(11) 

	wrpulse;
cycles(5);
fork
	wrpulse;
	rdpulse;
join

repeat(12) rdpulse;
	cycles(5);
	$finish;
	end

task cycles;
input integer n;
begin
	repeat(n) @(posedge clk);
end
endtask

task wrpulse;
begin
	@(posedge clk); wr=1; din = $random;
	@(posedge clk); wr=0;
end
endtask

task rdpulse;
begin
	@(posedge clk); rd=1;
	@(posedge clk); rd=0;
end
endtask
endmodule