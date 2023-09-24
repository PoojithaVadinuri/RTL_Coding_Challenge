module tb;

reg a,b,cin;

wire s,cout;
fa DUT(s,cout,a,b,cin);
initial
  begin
    repeat(12)
    begin
    {a,b,cin}=$random;
	#1;
	$display(a,b,cin ,":",{s,cout});
	end
  end
endmodule
	
