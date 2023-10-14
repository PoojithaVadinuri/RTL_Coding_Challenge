// testbench
module tb();

reg clk,b;
wire [3:0]q;

sipo_shift_register_design dut(q,clk,b);

initial
begin
clk=1'b0;
forever #5clk=~clk;
end

initial
begin
$monitor("clk=%d,b=%d,q=%b",clk,b,q);
end

initial
begin
b=1;
#10;
b=0;
#10;
b=1;
#10;
b=0;

#50;
$finish;

end

endmodule