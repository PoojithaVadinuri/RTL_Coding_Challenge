`timescale 1ns / 1ps
 
module tb;
 
reg clk =0, rst = 0, we = 0;
reg [3:0] addr = 0;
reg [7:0] datain = 0;
wire [7:0] dataout;
integer i = 0;
 
ram dut (clk, rst, we, addr, datain, dataout);
 
always #5 clk = ~clk;
 
task reset;
begin
rst = 1;
we = 0;
addr = 0;
datain = 0;
repeat(10) @(posedge clk);
end
endtask
 
task write();
begin
@(posedge clk);
rst = 1'b0;
we = 1'b1;
for(i = 0; i < 20; i = i+1)
begin
addr   = $urandom;
datain = $urandom();
@(posedge clk);
end
end
endtask
 
 
 
task read();
begin
@(posedge clk);
rst = 1'b0;
we = 1'b0;
for(i = 0; i < 20; i = i+1)
begin
addr   = $urandom;
datain = 0;
repeat(2) @(posedge clk);
end
end
endtask
 
 
 
 
initial begin
reset();
write();
read();
 @(posedge clk); $finish;
end
 
 
 
 
 
endmodule
