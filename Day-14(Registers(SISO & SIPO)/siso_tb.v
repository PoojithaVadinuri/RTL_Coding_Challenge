module tb;
reg clk,rst,b;
wire reg q;
siso_design xyz(clk,b,q);
initial
begin
clk=1'b0;
forever #5clk=~clk;

end

initial
begin
$monitor("clk=%d,b=%d,q=%d",clk,b,q);
end

initial
begin
b=1;
#10;
b=0;
#10;
b=1;
#10;
b=1;

#100;
$finish;

end
endmodule