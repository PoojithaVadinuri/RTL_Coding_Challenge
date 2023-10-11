module tb;
reg clk,rst;
wire [3:0]hun,ten,uni;
htu dut(clk,rst,hun,ten,uni);
always #5 clk = !clk;
initial begin
clk=0;
rst=1;
#2;
rst=0;
#30000;
$finish;
end
always @(negedge clk) 
 $display("%d : %d : %d",hun,ten,uni);
endmodule