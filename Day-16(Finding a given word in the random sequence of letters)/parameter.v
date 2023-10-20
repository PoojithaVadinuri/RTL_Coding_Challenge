module tb;
integer i;
integer p;

initial
	begin
	p=$fopen("parameter.txt");
	for(i=65;i<=90;i=i+1)
		$fdisplay(p,"parameter %s = %0d;",i,i);
	end
	
endmodule