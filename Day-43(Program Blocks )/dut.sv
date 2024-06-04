// Code your design here
module dut(in,q,cout,clk);
  input [1:0] in;
  input clk;
  output reg q;
  output reg cout;
  
  always @(posedge clk)
    q <= in;
  always @(in)
    cout = ~in;
endmodule