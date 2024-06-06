interface simple_bus;
  logic [31:0] rdata,wdata;
  logic [3:0] addr;
  logic wr,rd,rst;
endinterface


module top;
  logic clk=0;
  
 always #5 clk= ~clk;
  
  simple_bus intf();
  
  tb test(.tbif(intf),.clk(clk));
  
  rtl_memory dut (.clk(clk), .dutif(intf));
  
endmodule