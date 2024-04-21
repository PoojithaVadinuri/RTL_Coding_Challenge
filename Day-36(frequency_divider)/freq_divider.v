module freq_divider (
input clk,
input rst,
output reg divide_by_2, divide_by_4, divide_by_8, divide_by_16
);
reg  [3:0] cnt ;

always @(posedge clk or posedge rst)
begin
	if (rst)
		cnt <=0;
	else
		begin
		
		divide_by_2 <= cnt[0];
		divide_by_4 <= cnt[1];
		divide_by_8 <= cnt[2];
		divide_by_16 <= cnt[3];
		cnt <= cnt + 1;
		end
end
endmodule

