// t-FF using Jk, SR,D

module T_using_JK_D_SR(
input T,clk,rst,
output q_jk,q_d,q_sr
);
wire w1,w2,w3;
jkff jkff1(.j(T),.k(T),.clk(clk),.rst(rst),.q(q_jk));
assign w1 = (T & (~q_sr));
assign w2 = (T & (q_sr));
srff srff1 (w1,w2,clk,rst,q_sr);
assign w3 = T ^ q_d;
dff dff1(w3,clk,rst,q_d);
endmodule

//JK Flip Flop
module jkff(
input j,k,clk,rst,
output reg q
);

always @(posedge clk or posedge rst)
begin
	if (rst)
		q <= 0;
	else if (j==0 && k ==0)
	begin
		q <= q;
	
	end
	else if (j==0 && k ==1)
	begin
		q <= 0;
	end
	else if (j==1 && k==0)
	begin
	q <= 1;
	
	end
	else if (j==1 && k==1)
	begin
	q <= ~q;
	
	end
end
endmodule

//SR Flip Flop
module srff (
input s,r,clk,rst,
output reg q
);
always @(posedge clk or posedge rst)
 begin
	if (rst)
		q <=0;
		
	else if (s==0 && r==0)
	begin
		q <= q;
		
	end
	
	else if (s==0 && r==1)
	begin
		q <= 1'b0;
		
	end
	
	else if (s==1 && r==0)
	begin
		q <= 1'b1;
		
	end
	else if (s==1 && r==1)
	begin
		q <= 1'bx;
		
	end
	end
endmodule

// D-flipflop
module dff(
input d,clk,rst,
output reg q);

always @(posedge clk or posedge rst)
begin
if (rst)
	q <= 1'b0;
else
	begin
	q <= d;
	
	end
end
endmodule