module johnson_counter(
input over_ridden_sig,clk,
output reg [3:0] Q
);


always @(posedge clk )
begin
	if (!over_ridden_sig)
	begin
		Q <= 4'b0;
	end
	else
	begin
		Q <= { ~Q[0], Q[3:1]};
		/* Q[0] <= Q[3];
		Q[1] <= Q[0];
		Q[2] <= Q[1];
		Q[3] <= Q[2]; */
	end
end
endmodule
	
	
		
		