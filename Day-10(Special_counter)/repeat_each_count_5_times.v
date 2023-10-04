module repeat5 (clk,rst,cnt);
input clk,rst;
output [1:0] cnt;
wire [2:0] b1,b2;
wire s1;
wire [1:0] b3,b4;
reg [2:0] mod5;
reg [1:0] cnt;
assign b1 = mod5+1;
assign s1 = (mod5==5 );
assign b3 = cnt + 1;
assign b4 = s1 ? b3 : cnt;
assign b2 = s1 ? 1 : b1;
always @(posedge clk, posedge rst)
begin
if (rst) mod5<=1;
else mod5<=b2;
end
always @(posedge rst or posedge clk)
begin
if (rst) cnt<=0;
else cnt<=b4;
end
endmodule