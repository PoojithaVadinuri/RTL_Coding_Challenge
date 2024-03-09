module tb;
integer a,b;
integer temp;
initial
	begin
	a=3;
	b=4;
	$display("a=%d, b=%d", a,b);

	//using temp---> swapping
	temp=a;
	a=b;
	b=temp;
	$display (" Swapping using temporary Variable: a=%d, b=%d", a,b);
	end
endmodule

	

	