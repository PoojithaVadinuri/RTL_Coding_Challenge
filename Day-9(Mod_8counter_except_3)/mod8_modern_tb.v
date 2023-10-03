module tb;
reg clk,rst;
wire [2:0] cnt;
mod8_modern dut(clk,rst,cnt);
initial
begin
rst=0;
#1;
rst=1;
#1;
rst=0;
end
initial
begin
clk=0;
repeat (220)
begin
clk=!clk;#5;
end
end
endmodule
