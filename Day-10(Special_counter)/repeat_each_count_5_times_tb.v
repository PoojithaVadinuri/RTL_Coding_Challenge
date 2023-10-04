module tb;
reg clk,rst;
wire [1:0] cnt;
repeat5 DUT (clk,rst,cnt);
initial
begin
rst=0;
#2;
rst=1;
#1;
rst=0;
end
initial
begin
clk=0;
repeat (100)
begin
clk=!clk;#5;
end
end
endmodule