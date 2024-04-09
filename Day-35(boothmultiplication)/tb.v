

module tb;
reg clk, start;
reg [7:0] a, b;
wire [15:0] ab;
wire busy;
booth_multiplication dut(ab, busy, a, b, clk, start);
initial begin
clk = 0;
$display("first example: a = 5 b = 10");
a = 5; b = 10; start = 1; #50 start = 0;
#80 $display("first example done");
$display("second example: a = 8 b = 7");
a = 8; b = -7; start = 1; #50 start = 0;
#80 $display("second example done");
$finish;
end
always #5 clk = !clk;
always @(posedge clk) $strobe("ab: %d busy: %d at time=%t", ab, busy, $stime);
endmodule
	