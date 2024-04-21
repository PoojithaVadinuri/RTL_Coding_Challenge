module tb;

reg clk=0,rst;
wire divide_by_2, divide_by_4, divide_by_8, divide_by_16;

freq_divider dut( clk, rst, divide_by_2, divide_by_4, divide_by_8, divide_by_16 );

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
#1000;
$finish;
end

endmodule
	