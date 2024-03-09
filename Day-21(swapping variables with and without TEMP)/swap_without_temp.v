module tb;
integer a,b;
integer temp;
initial
	begin
	a=3;
	b=4;
	$display("a=%d, b=%d", a,b);

	//using Non -blocking assignment
	a<=b;
	b<=a;
	
	end
	initial begin
	$monitor(" Swapping without using temporary Variable: a=%d, b=%d", a,b);
	end
endmodule

	

	