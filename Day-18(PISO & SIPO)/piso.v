module piso (
input clk,
input rst,
input start,
input [7:0] din,
output wire dout
);
reg [3:0] cnt;
always @(posedge clk or posedge rst)
	begin
	if (rst)
		cnt <=8;
	else
	begin
	if (cnt==8)
		cnt <= start? 7:8;
	else 
		cnt <= (cnt==0)? 8: (cnt-1);
	end
	end


assign dout = (cnt==8) ? 8'bx : din[cnt];
endmodule