module tb; 
reg [7:0] A,B;
reg [3:0] command;
reg oe;
wire [15:0] dout;

alu dut(dout,oe,command,A,B);
initial
begin
repeat(20)
begin
{oe,command,A,B}=$random;
#1;
$display("oe=%d,command=%d,A=%b,B=%b : dout=%b",oe,command,A,B,dout);
end

end
oe=1;
command=1010;
$display("oe=%d,command=%d,A=%b,B=%b : dout=%b",oe,command,A,B,dout);
endmodule