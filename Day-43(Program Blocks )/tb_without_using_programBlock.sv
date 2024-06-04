
module tb;
  reg [1:0] in;
  bit clk=0;
  wire q,cout;

  always #5 clk = !clk;
  dut inst(in,q,cout,clk);
  initial begin
    @(posedge clk);
    in = 1;
    $strobe("q=%d,cout=%d",q,cout);//q=x, cout = 0
    @(posedge clk);
    in = 2;
    $strobe("q=%d,cout=%d",q,cout); //q=1,cout=
    @(posedge clk);
    $finish;
  end
endmodule
