module SR_USING_JK_T(
input s,r,clk,rst,
output q_jk,q_t
);
   wire w1,w2,w3;
   
   jk ff1(s,r,clk,rst,q_jk);
   
   assign w1 = r&q_t;
   assign w2 = ~q_t&s;
   assign w3 = w1 | w2;
   T_ff ff2(w3,clk,rst,q_t);
   

  
endmodule

module jk(
input j,k,clk,rst,
output reg q
);

always@(posedge clk or posedge rst)
begin
if (rst)
q<=0;
else 
	begin
		case({j,k})
		2'b00:q<=q;
		2'b01:q<=0;
		2'b10:q<=1;
		2'b11:q<=~q;
		endcase
	end
end
endmodule



module T_ff(
input t,clk,rst,
output reg q);

always@(posedge clk or posedge rst)
begin
if(rst)
q<=1'b0;
else 
begin
   if(t)
    q<=~q;
   else
    q<=q;
    end
end
endmodule



