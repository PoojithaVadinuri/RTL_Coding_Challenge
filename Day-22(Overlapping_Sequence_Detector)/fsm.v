module fsm_overlapping(
	input clk,rst,din,
	output reg dout
	);
	

parameter s0=0;
parameter s1=1;
parameter s2=2;

reg [1:0] state;

always @(posedge clk or posedge rst)
if (rst)
begin
	dout <= 1'b0;
	state <= s0;
end
else
begin
case(state)

	s0: begin
		if(din == 1'b1)
			begin
			state <= s1;
			dout <= 1'b0;
			end
		else
			begin
			state <= s0;
			dout <= 1'b0;
			end
	end

	s1: begin
		if(din == 1'b0)
			begin
			state <= s2;
			dout <= 1'b0;
			end
		else
			begin
			state <= s0;
			dout <= 1'b0;
			end
	end

	s2: begin
		if(din == 1'b1)
			begin
			state <= s2;
			dout <= 1'b1;
			end
		else
			begin
			state <= s0;
			dout <= 1'b0;
			end
	end
	
default: begin
		state <= s0;
		dout <= 1'b0;
		end
	
endcase

end
endmodule

	