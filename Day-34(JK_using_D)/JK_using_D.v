module JK_USING_D(
input j,k,clk,rst,
output q,qbar
    );
   wire w1,w2,w3;
  assign w1 = j&qbar;
  assign w2 = (~k&q);
  assign w3 =(w1 | w2);
  
dff dut(w3,clk,rst,q,qbar); 
     
endmodule

module dff(
input d,clk,rst,
output reg q,qbar);

always @(posedge clk or posedge rst)
begin
if (rst)
	q <= 1'b0;
else
	begin
	q <= d;
	qbar <= ~d;
	
	end
end
endmodule