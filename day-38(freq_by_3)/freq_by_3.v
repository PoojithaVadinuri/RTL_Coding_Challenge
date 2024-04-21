module freq_by_3 (
input clk,
input rst,
output reg q
);
reg  [1:0] cnt ;
always @(posedge clk or posedge rst)
	begin
	
	if(rst)
	begin
		q <=0;
		cnt <=0;
	end
	else
	begin
		cnt <= (cnt ==3) ? 1 : cnt+1;
		if (cnt==1)
			q <= ~q;
		else 
			q <=0;
		
	end
	end
	
endmodule
