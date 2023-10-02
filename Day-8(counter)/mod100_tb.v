module tb;
reg clk,rst;
wire [6:0] cnt;
mod100 DUT(clk,rst,cnt);
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
repeat(110)
begin
clk=0;#5;
clk=1;#5;
end
end
endmodule