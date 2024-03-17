module tb;
reg over_ridden_sig=0,clk=0;
wire [3:0] Q;

johnson_counter dut (
.over_ridden_sig(over_ridden_sig),
.clk(clk),
.Q(Q)
);

always #5 clk = !clk;

task over_rid();
begin
over_ridden_sig=0;
#10;
over_ridden_sig=1;
end
endtask

initial begin
 over_rid();
	#100;
	$finish;
end
endmodule

