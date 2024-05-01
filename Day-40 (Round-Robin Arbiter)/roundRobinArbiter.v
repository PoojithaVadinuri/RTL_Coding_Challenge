module round_robin_arbiter(
	input clk,
	input rst,
	input [3:0] Req,
	output reg [3:0] Grant);
	
enum {ideal_s, s0,s1,s2,s3} state;

always @(posedge clk or posedge rst)
begin
	if (rst)
		state <= ideal_s;
	else
		begin
		case (state)
		ideal_s : casex (Req)
					4'bxxx1 : state <= s0;
					4'bxx1x : state <= s1;
					4'bx1xx : state <= s2;
					4'b1xxx : state <= s3;
					default : state <= ideal_s;
				endcase
					
		s0      : casex (Req)
					4'bxxx1 : state <= s0;
					4'bxx1x : state <= s1;
					4'bx1xx : state <= s2;
					4'b1xxx : state <= s3;
					
					default : state <= ideal_s;
				  endcase
				  
		s1      : casex (Req)
					4'bxx1x : state <= s1;
					4'bx1xx : state <= s2;
					4'b1xxx : state <= s3;
					4'bxxx1 : state <= s0;
					
					default : state <= ideal_s;
				  endcase
					
		s2      : casex (Req)
					4'bx1xx : state <= s2;
					4'b1xxx : state <= s3;
					4'bxxx1 : state <= s0;
					4'bxx1x : state <= s1;
					
					default : state <= ideal_s;	
				  endcase
					
		s3      : casex (Req)
					4'b1xxx : state <= s3;
					4'bxxx1 : state <= s0;
					4'bxx1x : state <= s1;
					4'bx1xx : state <= s2;
					
					default : state <= ideal_s;	
				 endcase
		endcase		 
	end
end

always @(*)
	begin
	case (state)
	s0 : Grant <= 4'b0001;
	s1 : Grant <= 4'b0010;
	s2 : Grant <= 4'b0100;
	s3 : Grant <= 4'b1000;
	default : Grant <= 4'b0000;
	endcase
	end
	
endmodule