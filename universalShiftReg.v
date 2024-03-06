//Universal shift register
module USR (
input [3:0] parallel_in,
input serial_rightin,
input serial_leftin,
input [1:0] select,
input clk,rstN,
output serial_rightout,
output serial_leftout,
output reg [3:0] parallel_out
);

always @(posedge clk or negedge rstN)
begin
if (!rstN)
	parallel_out <=0;
else
begin
case (select)
2'h1: parallel_out <= {serial_rightin,parallel_out[3:1]};// Right shift
2'h2: parallel_out <= {parallel_out[2:0],serial_leftin};// left Shift
2'h3: parallel_out <= parallel_in;// Parallel-in Parallel-out
default: parallel_out <= parallel_out; // Do nothing
endcase
end
end

assign serial_leftout = parallel_out[0];
assign serial_rightout = parallel_out[3];

endmodule