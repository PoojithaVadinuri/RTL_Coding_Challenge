module bidirectional_shift_reg #(parameter N=3)(
input d,
input en,
input dir,
input clk,rst,
output reg [N-1 : 0] Q
);

always @(posedge clk or posedge rst)
begin
	if (rst)
		Q <=0;
	else
	begin
	if (en)
		case(dir)
		0 : Q <= {Q[N-2 : 0],d} ;//shift left operation
		1 : Q <= {d, Q[N-1 : 1]} ;//Shift right operation
		endcase
	end
end

endmodule