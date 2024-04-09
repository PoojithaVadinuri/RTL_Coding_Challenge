module tb;
reg j,k,clk=0,rst=1;
wire q,qbar;
reg jNBA=0; always @* jNBA <=j;
reg kNBA=0; always @* kNBA <=k;

JK_USING_D dut(jNBA,kNBA,clk,rst,q,qbar);
always #5 clk =!clk;
initial #2 rst=0;

initial begin
	@(posedge clk ) ;
	{j,k}=2'b00;
	@(posedge clk);
	{j,k}=2'b01;
	@(posedge clk)
	{j,k}=2'b00;
	
	@(posedge clk);
	{j,k}=2'b10 ;
	@(posedge clk)
	{j,k}=2'b00;
	
	@(posedge clk);
	{j,k}=2'b11;
	@(posedge clk)
	{j,k}=2'b00;
	repeat(5) @(posedge clk);
	$finish;
	end
	
endmodule