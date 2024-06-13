// Code your design here
module flipflop (input logic clk, reset, 
                 input logic [7:0] qin, 
                 output logic [7:0] qout);


always @(posedge clk or posedge reset)
  if (!reset)
    qout <= '0;
  else
    qout <= qin;

endmodule 