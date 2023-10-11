module htu(clk,rst,hun,ten,uni);
input clk,rst;
output [3:0]hun,ten,uni;
reg [3:0]hun,ten,uni;

parameter UL=9;

always @(posedge clk or posedge rst)
begin
 if (rst) ten<=0;
 else 
  if (uni==UL)  ten<=ten==UL ? 0:ten+1;
  else 
   ten<=ten;
end

always @(posedge clk or posedge rst)
begin
 if (rst) uni<=0;
 else
  uni<=uni==UL ? 0:uni+1;
end
always @(posedge clk or posedge rst)
begin
 if (rst) hun<=0;
 else
 if ({ten,uni}=={4'd9,4'd9}) hun<= (hun==9)? 0:hun+1;
 else
 hun <=hun;
 end
 endmodule