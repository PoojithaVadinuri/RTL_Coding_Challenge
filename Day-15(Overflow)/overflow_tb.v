module tb;
reg [3:0] a;
reg [3:0] b;
wire [4:0] s;
wire overflow;
top_module dut(a,b,s,overflow);
initial
 begin
  repeat(5)
  begin
   {a,b}=$random;
   #1;
   $display("a=%b,b=%b,s=%b,overflow=%b",a,b,s,overflow);
  end
 a=4'b1111;b=4'b1111;
 #1;
 $display("a=%b,b=%b,s=%b,overflow=%b",a,b,s,overflow);
 end
endmodule
