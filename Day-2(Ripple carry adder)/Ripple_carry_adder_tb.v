module tb;
reg [3:0] A,B;
wire [3:0] sum;
wire cout;
Ripple_carry_adder DUT(cout,sum,A,B);
initial
begin
repeat(10)
begin
{A,B}=$random;
#1;
$display("A=%b,B=%b,cout=%b,sum=%b",A,B,cout,sum);
end
end
endmodule