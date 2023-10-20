module tb;
reg clk=0,rst=1;
reg [7:0] letter=0,letterNBA=0;//ASCII
wire e;
always #5 clk=!clk;
initial #2 rst=0;
always @* letterNBA<=letter;
`include "parameter.txt" //to get ASCII values of alphabets
absent dut(clk,rst,letterNBA,e);
initial
begin
letter="";
repeat(5) @(posedge clk);
letter=P;@(posedge clk);
letter=O;@(posedge clk);
letter=O;@(posedge clk);
letter=J;@(posedge clk);
letter=I;@(posedge clk);
letter=T;@(posedge clk);
letter=H;@(posedge clk);
letter=A;@(posedge clk);
letter=S;@(posedge clk);
letter=P;@(posedge clk);
letter=S;@(posedge clk);
letter=D;@(posedge clk);
$finish;
end
endmodule