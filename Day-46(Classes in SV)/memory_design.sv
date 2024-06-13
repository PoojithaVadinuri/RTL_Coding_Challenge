// Code your design here
// Code your design here
module rtl_memory(
  input logic clk,rst,
  input logic wr,rd,
  input logic [3:0] wdata,
  input logic [2:0] addr,
  output logic [3:0] rdata,
  output logic outp_valid
);
  logic [31:0] mem [0:15];
  
  always @(posedge clk or posedge rst)
    begin
      if (rst)
        begin
          rdata <= 'bz;
          mem[addr] <= 0;
        end
      else
        begin
          if (wr)
            mem[addr] <= wdata;
          else
            begin
              if (rd)
                begin
                outp_valid <=1;
                rdata <= mem[addr];
                   end
              
              else
                begin
              	outp_valid <='bz;      
           	    rdata <= 'bz;
                end
            end
          
          
        end
    end
endmodule
    