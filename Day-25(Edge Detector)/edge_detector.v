module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] t1,t2;  
    always @(posedge clk)
        begin
        t1 <= in;
    	t2 <= t1;
        end
    assign pedge = ~t2 & t1;
    

endmodule