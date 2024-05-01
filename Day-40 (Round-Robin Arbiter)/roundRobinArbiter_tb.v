module tb;
reg clk;
reg rst;
reg [3:0] req;
wire [3:0] Grant;

round_robin_arbiter dut(clk,rst,req,Grant);

always #5 clk = !clk;

initial begin
clk =0;
rst = 1 ;
req = 4'b0;

#5 rst =0;
repeat(5)
begin
@(negedge clk);
	req = 4'b1111;
end	

@(negedge clk);
	req = 4'b1110;
	
@(negedge clk);
	req = 4'b0010;
	
@(negedge clk);
	req = 4'b0011;
	
@(negedge clk);
	req = 4'b0110;
	
@(negedge clk);
	req = 4'b0101;
	
@(negedge clk);
	req = 4'b0111;
	
	
@(negedge clk);
	req = 4'b1010;
	
@(negedge clk);
	req = 4'b0100;
	
#5 rst =1;
#100 $finish;
end

initial begin 
$dumpfile("dump.vcd");
$dumpvars();
end
endmodule