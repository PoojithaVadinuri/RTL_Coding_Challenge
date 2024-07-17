// Code your testbench here
// or browse Examples
module sem();
	semaphore sema;
	int a,b,y;
	
	task automatic resource(string s, int a,b);
	sema.get(1);
	$display("%0s: \t at %0tns writing started", s , $time);
	
	#5;
	y = a + b;
	$display("%0s: \t at time = %0tns writing is done | a = %0d, | b = %0d | y=%0d",s,$time,a,b,y);
	
	sema.put(1);
	
	endtask
	
	initial begin
	sema = new(1);
	fork 
	 resource("1st",10,20);
	 resource("2nd",30,20);
	 resource("3rd",20,40);
	join
	
	end
	endmodule