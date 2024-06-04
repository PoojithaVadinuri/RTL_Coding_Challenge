program tb(
  output reg in,
  input clk,q,cout
);
  initial begin
    @(posedge clk);
    in = 1;
    $strobe("q=%d,cout=%d",q,cout);//q=x, cout = 0
    @(posedge clk);
    in = 2;
    $strobe("q=%d,cout=%d",q,cout); //q=1,cout=
    
  end
endprogram


module top;
  bit clk=0;
  always #5 clk = ~clk;
  dut inst(in,q,cout,clk);
  tb inst_tb(in,clk,q,cout);
endmodule