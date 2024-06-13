interface simple_bus(input clk);
  logic [3:0] rdata,wdata;
  logic [2:0] addr;
  logic wr,rd,rst,outp_valid;
  
  clocking cb @(posedge clk);
    output wdata,addr,wr,rd;
    input rdata,outp_valid;
  endclocking
  
  modport tb(clocking cb,output rst);
  
endinterface


module top;
 logic clk=0; 
 always #5 clk= ~clk;
  
  simple_bus intf(clk);
  
  tb test(.tbif(intf.tb));
  
  rtl_memory dut (.clk(clk), .rst(intf.rst), .wr(intf.wr), .rd(intf.rd), .wdata(intf.wdata), .rdata(intf.rdata), .addr(intf.addr),.outp_valid(intf.outp_valid));
  
endmodule