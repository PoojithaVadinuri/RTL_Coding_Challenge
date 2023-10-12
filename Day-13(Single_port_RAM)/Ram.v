`timescale 1ns / 1ps
//16x8
module ram(
input clk,
input rst,
input we,
input [3:0] addr,
input [7:0] datain,
output reg [7:0] dataout
    );
    
reg [7:0] mem [15:0]; 
integer i = 0; 
 
always@(posedge clk)
begin
 if(rst == 1'b1)
    begin
        dataout <= 8'h00;
        for(i=0; i< 16; i = i + 1)
        begin
         mem[i] <= 0;
        end
    end
  else
    begin
      if(we)
       mem[addr] <= datain; //writing data in the address location
     else
       dataout   <= mem[addr];//reading data from the address location
    end
 
end
endmodule
