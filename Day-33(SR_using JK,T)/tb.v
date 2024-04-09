module tb;
reg s,r,clk=0,rst=1;
wire q_jk,q_t;
reg sNBA=0,rNBA=0;
always @* sNBA <= s;
always @* rNBA <= r;
always #5 clk =!clk;
initial #2 rst=0;

SR_USING_JK_T dut(sNBA,rNBA,clk,rst,q_jk,q_t);
initial
	begin
	@(posedge clk ) ;
	{s,r}=0;
	@(posedge clk);
	{s,r}=2'b01;
	@(posedge clk)
	{s,r}=2'b00;
	
	@(posedge clk);
	{s,r}=2'b10 ;
	@(posedge clk)
	{s,r}=2'b00;
	
	@(posedge clk);
	{s,r}=2'b11;
	@(posedge clk)
	{s,r}=2'b00;
	repeat(5) @(posedge clk);
	$finish;
	end
	
endmodule