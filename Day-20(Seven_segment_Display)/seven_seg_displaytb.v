module tb;
	reg [3:0] bcd;
	wire [6:0]seg;

	integer i;
	
segment7 dut(bcd,seg);

task stimuli;
begin
for (i=0; i< 15; i=i+1)
	begin
	{bcd}=i;
	#2;
	end
end
endtask

task initialize;
{bcd}=0;
endtask

initial
	begin
	initialize;
	stimuli;
	$finish();
	end
initial
$monitor ("{bcd}=%b, {7seg}= %b", {bcd}, {seg});
endmodule