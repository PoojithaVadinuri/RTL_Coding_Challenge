module tb;
reg [15:0] A,B;
wire gt,eq,lt;
integer i;
hw1 DUT(gt,eq,lt,A,B);


initial 
 begin
  for(i=0;i<10;i=i+1)
  begin
   {A,B}=$random;
   
   #1;
   $display("A=%d  B=%d  gt=%b  eq=%b  lt=%b", A,B,gt,eq,lt);

   
   
  end
A=16'b1010000110100001;
B=16'b1010000110100001;
#1;
$display("A=%d  B=%d  gt=%b  eq=%b  lt=%b", A,B,gt,eq,lt);
 end
endmodule