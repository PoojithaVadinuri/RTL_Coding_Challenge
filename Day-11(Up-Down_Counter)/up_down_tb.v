module tb;
reg clk,rst;
wire [2:0] cnt;
updown dut(clk,rst,cnt);
always #5 clk =!clk;
initial
begin
clk=0;
rst=1;
#2;
rst=0;
#300;
$finish;
end
endmodule