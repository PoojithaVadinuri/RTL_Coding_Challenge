module mod100(clk,rst,cnt);
input clk,rst;
output [6:0] cnt;
reg [6:0] cnt;
wire [6:0] b1,tom;
assign b1= cnt + 1;
assign s1 = cnt == 99;
assign tom = s1 ? 0:b1;
always@(posedge clk or posedge rst)
begin
if (rst) cnt <=0;
else cnt <= tom;
end
endmodule