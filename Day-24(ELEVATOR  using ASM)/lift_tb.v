module tb;
 
reg clk=0,rst=1,ra=0,rb=0,rc=0,rd=0,raNBA=0,rbNBA=0,rcNBA=0,rdNBA=0;
wire [2:0] floor;


always @* raNBA <= ra;
always @* rbNBA <= rb;
always @* rcNBA <= rc;
always @* rdNBA <= rd;


//enum {DOWN, UP} d;
enum { A,BU,BD,CU,CD,D} s; //A, B-UP, B-DOWN, C-UP, C-DOWN, D

/*always @*
begin
	case (tb.dut.dir)
	0: d=DOWN;
	1: d=UP;
	endcase
end */

always @*
begin
	case (tb.dut.floor)
	0: s=A;
	1: s=BU;
	2: s=BD;
	3: s=CU;
	4: s=CD;
	5: s=D;
	endcase
end  



always #5 clk = !clk;
initial #2 rst =0;

lift dut(.clk(clk),.rst(rst),.ra(raNBA),.rb(rbNBA),.rc(rcNBA),.rd(rdNBA),.floor(floor));

initial
	begin
	cycles (5);
	repeat (20)
		begin
		@(posedge clk);
		{ra,rb,rc,rd}=$random;
		@(posedge clk)
		{ra,rb,rc,rd}=4'b0000;
		
	    end
	cycles (5);
	$finish;
	end
		
task cycles;
input integer n;
begin
 repeat (n) @(posedge clk);
end
endtask
endmodule



