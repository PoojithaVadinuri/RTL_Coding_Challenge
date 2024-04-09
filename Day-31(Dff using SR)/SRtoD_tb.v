
module tb;
reg d,clk=0;
reg dNBA =0; always @* dNBA <=d;
wire q,qbar;

SRtoD dut(dNBA,clk,q,qbar);
always #5 clk =~clk;
initial
begin
 repeat(5) @(posedge clk);
 repeat(10)
 begin
 @(posedge clk); d =1; @(posedge clk); d=0;

 end
  #500;
  $finish;
end
endmodule



