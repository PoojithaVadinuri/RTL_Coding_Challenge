module tb;
reg clk=0;
reg [7:0] in;
wire [7:0] pedge;


top_module dut(.clk(clk),.in(in),.pedge(pedge));

always #5 clk = !clk;

initial begin
	
	
	repeat(2)
	begin
	@(negedge clk);
	in =0;
	end
	repeat(4)
	begin
	@(negedge clk);
	in =2;
	end
	repeat(3)
	begin
	@(negedge clk);
	in =14;
	end
	repeat(4)
	begin
	@(negedge clk);
	in =2;
	end
	@(negedge clk);
	$finish;
end
endmodule
	
	
	
	
