module mod8_modern (clk,rst,cnt);
input clk,rst;
output [2:0] cnt;
reg [2:0] cnt;
wire s1,s2;
wire [2:0] b1,tom,b2;
assign b1 = cnt +1;
assign s2 = cnt==2;
assign b2 = s2 ? 4 : b1;
assign s1 = cnt==7;
assign tom = s1 ? 0 : b2;
always @(posedge clk or posedge rst)
begin
if (rst) cnt<=0;
else cnt<=tom;
end
endmodule