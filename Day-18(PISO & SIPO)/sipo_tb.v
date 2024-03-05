
module tb();

reg clk,serial_in;
wire [3:0] parallel_out;

sipo dut(.clk(clk), .serial_in(serial_in),.parallel_out(parallel_out) );

initial
begin
$monitor($time,"serial_in = %b, parallel_out = %b",serial_in,parallel_out);
end

initial 
begin

clk = 0;
serial_in = 0;

#10 serial_in=1'b1;

#10 serial_in=1'b0;

#10 serial_in=1'b1;

#10 serial_in=1'b0;

#10 serial_in=1'b1;

#10 serial_in=1'b0;
#500;
$finish;

end

always #5 clk = ~clk;

endmodule
