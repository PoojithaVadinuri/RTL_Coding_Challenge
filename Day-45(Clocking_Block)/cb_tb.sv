//interface block
interface intf(input clk);
  logic reset;
  logic [7:0] qin,qout;
  
clocking cb @(posedge clk);
  default input #1step  output #4;
  input qout; 
  output qin;
endclocking

modport tb(clocking cb, output reset);
endinterface

//test block
program test(intf tbif,input clk);
//default clocking block
  default clocking bus @(posedge tbif.clk);
  endclocking
  
  initial
   begin
    tbif.cb.qin <= '0;
    tbif.reset <= 1;
    ##2 tbif.reset <= 0;
    ##3 tbif.reset <= 1;
    for (int i = 1; i < 8; i++)
      begin
         ##1 tbif.cb.qin <= i;
      end 
     ##3;
  
    end
  
initial begin
  $dumpfile("dump.vcd");
  $dumpvars();
end
endprogram
//Top module 
module top;
  logic clk=1;
`define PERIOD 10
always
    #(`PERIOD/2)clk = ~clk;
  intf intf_inst(.clk(clk));
  flipflop DUT(.clk(clk), .reset(intf_inst.reset),.qin(intf_inst.qin),.qout(intf_inst.qout));
  test test_dut(.tbif(intf_inst),.clk(clk));
endmodule