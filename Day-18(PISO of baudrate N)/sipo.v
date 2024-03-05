
module sipo(clk, serial_in, parallel_out);

input clk, serial_in;
output [3:0] parallel_out;
reg [3:0] temp;
reg [3:0] parallel_out;

always @(posedge clk)

begin

    temp <= temp >> 1;
	temp[3] <= serial_in;
	parallel_out = temp;

end

endmodule