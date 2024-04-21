module tb;

reg clk=0,rst;
wire q;

freq_by_2_5 dut( .clk(clk), .rst(rst), .q(q));

task reset();
	begin
	rst <= 1;
	@(posedge clk);
	rst <=0;
	end
endtask

always #5 clk =!clk;


initial begin
reset();
#200;
$finish;
end

endmodule
	