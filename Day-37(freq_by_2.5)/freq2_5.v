module freq_by_2_5 (
input clk,
input rst,
output wire q
);
reg  [2:0] cnt ;
reg q1,q2;
always @(posedge clk or posedge rst)
	begin
	if (rst)
	cnt <=0;
	else
	begin
	cnt <= (cnt==4) ? 0 : (cnt+1);
	end
	end

always @(posedge clk  )
	begin
	if (rst)
		q1 <=0;
	else if (cnt ==0)
		q1 <= ~q1;
	else if (cnt ==1)
		q1 <= ~q1;
	else
		q1 <=q1;
	end

always @(negedge clk or posedge rst)
	begin
	if (rst)
		q2 <=0;
	else if (cnt ==3)
		q2 <= ~q2;
	else if (cnt ==4)
		q2 <= ~q2;
	else
		q2 <= q2;
	end
	
assign q = q1 | q2;
endmodule

	
		