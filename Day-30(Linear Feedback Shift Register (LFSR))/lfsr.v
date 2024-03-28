module lfsr(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg [4:0] q
); 
    always @(posedge clk)
        begin
        if (reset)
            q <= 1;
    	else
            begin
            q[4] <= q[0] ^ 0; //xor operation
			q[3] <= q[4];
			q[2] <= q[3] ^ q[0]; // xor operation
			q[1] <= q[2];
			q[0] <= q[1];
    end
    end

endmodule
