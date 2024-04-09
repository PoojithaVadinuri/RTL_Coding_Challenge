module tb;
reg T,clk=0,rst=1;
reg TNBA=0; always @* TNBA <= T;
wire q_jk,q_d,q_sr;

T_using_JK_D_SR dut(TNBA,clk,rst,q_jk,q_d,q_sr);
always #5 clk = !clk;
initial #2 rst = 0;

initial begin
	repeat(10)
	begin
	@(posedge clk); T=1; @(posedge clk) ; T=0;
	end
	#500;
	$finish;
	end
endmodule
	