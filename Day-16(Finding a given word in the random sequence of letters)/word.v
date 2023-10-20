
//finding word Poojitha

module absent(clk,rst,letter,e);
input clk,rst;
input [7:0] letter;//ASCII
output e;
`include "parameter.txt" //to get ASCII values of alphabets
enum {NO,SP,SO1,SO2,SJ,SI,ST,SH,SA} state;
always @(posedge clk or posedge rst)
	begin
		if(rst) state <=NO;
		else
		case (state)
		NO : state <= letter==P ? SP:NO;
		SP : case(letter)
				O:state<=SO1;
				P:state<=SP;
				default:state<=NO;//Not P, Not O1
			 endcase
		SO1 : case(letter)
				O:state<=SO2;
				P:state<=SP;
				default:state<=NO;//Not O2, Not P
			 endcase
		SO2 : case(letter)
				J:state<=SJ;
				P:state<=SP;
				default:state<=NO;//Not P, Not J
			 endcase
		SJ : case(letter)
				I:state<=SI;
				P:state<=SP;
				default:state<=NO;//Not P, Not I
			 endcase
		SI : case(letter)
				T:state<=ST;
				P:state<=SP;
				default:state<=NO;//Not P, Not T
			 endcase
		ST : case(letter)
				H:state<=SH;
				P:state<=SP;
				default:state<=NO;//Not P, Not H
			 endcase
		SH : case(letter)
				A:state<=SA;
				P:state<=SP;
				default:state<=NO;//Not P, Not A
			 endcase
		SA : state <= letter==P ? SP:NO;
		endcase
	end
assign e = (state==SA);
endmodule