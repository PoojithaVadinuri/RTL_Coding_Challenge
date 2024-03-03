module hmsv2(clk,rst,stop_run,inc,dec,next,hrs,min,sec);
input clk,rst,stop_run,inc,dec,next;
output reg [4:0] hrs;
output reg [5:0] min,sec;

enum {RUN,HB,MB,SB} state;

always @(posedge clk or posedge rst)
begin
	if (rst) state <=RUN;
	else
	case(state)
	RUN: state <=stop_run ? HB:RUN;
	HB: if(stop_run) state <=RUN;
	    else state <=next?MB:HB;
	MB: if(stop_run) state <=RUN;
		else
			case (next)
			1: state <=SB;
			0: state <= stop_run? RUN:MB;
			endcase
	SB: case(1)
		stop_run: state <= RUN;
		next : state <= HB;
		default : state <= SB;
		endcase
	endcase
end

function [5:0] plus1;
input [5:0] variable;
input [5:0] UL;
begin
	//$display ("Entry time:",$time);
	plus1 = variable == UL ? 0: (variable+1);
	//@(posedge clk);
	//$display ("Exit time:",$time);
end
endfunction

function [5:0] minus1;
input [5:0] variable;
input [5:0] UL;
begin
	//$display ("Entry time:",$time);
	minus1 = variable == 0 ? UL: (variable-1);
	//@(posedge clk);
	//$display ("Exit time:",$time);
end
endfunction

always @(posedge clk or posedge rst)
begin
	if (rst) sec<=0;
	else
	case (state)
	RUN: if (stop_run) sec<=sec;
		else sec <= plus1(sec,59);
	HB: if (stop_run) sec<= plus1(sec,59);
		else sec <=sec;
	MB: sec<=sec;
	SB: if (next) sec <=sec;
		else
			case({inc,dec})
			2'b10: sec<=plus1(sec,59);
			2'b01: sec<=minus1(sec,59);
			default: sec<=sec;//00,11
		    endcase
	endcase
end

always @(posedge clk or posedge rst)
begin
	if (rst) min <=0;
	else
		case(state)
		RUN: if (sec==59) min<=plus1(min,59);
			 else min <= min;
	    HB: min<=min;
		MB: if (next) min<= min;
			else
				case({inc,dec})
				2'b10 : min <= plus1(min,59);
				2'b01 : min <= minus1(min,59);
				default : min<=min;
				endcase
		SB: min <=min;
		endcase
end

always @(posedge clk or posedge rst)
begin
	if (rst) hrs <=0;
	else
		case (state)
		RUN:if ({min,sec}=={6'd59,6'd59}) hrs <= plus1(hrs,23);
			else hrs <= hrs;
		MB: hrs<=hrs;
        SB: hrs<= hrs;
		HB:
			`ifdef FIX
				if(next) hrs<=hrs;
				else 
				 case({inc,dec})
				 2'b10: hrs<=plus1(hrs,23);
				 2'b01: hrs<=minus1(hrs,23);
				 default:hrs<=hrs; //00,11
				 endcase
			`endif
			`ifdef BUG
				case(1)
				inc: hrs <= plus1(hrs,23);
				dec: hrs <= minus1(hrs,23);
				default: hrs<=hrs;
				endcase
			`endif
		endcase 
end
endmodule
