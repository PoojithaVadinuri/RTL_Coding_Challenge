module alu(dout,oe,command,A,B);
input [7:0] A,B;
input [3:0] command;
input oe;
output [15:0] dout;
parameter  ADD = 4'b0000,
            INC = 4'b0001,
            SUB = 4'b0010,
            DEC = 4'b0011,
            MUL = 4'b0100,
            DIV = 4'b0101,
            SHL = 4'b0110,
            SHR = 4'b0111,
            AND = 4'b1000,
            OR = 4'b1001,
            INV = 4'b1010,
            NAND = 4'b1011,
            NOR = 4'b1100,
            XOR = 4'b1101,
            XNOR = 4'b1110,
            BUF = 4'b1111;
reg [15:0] out;
always @(command,A,B)
begin
 case(command)
  ADD : out = A+B;
  INC : out = A+1;
  SUB : out = A-B;
  DEC : out = A-1;
  MUL : out = A*B;
  DIV : out = A / B;
  SHL : out = A<<2;
  SHR : out = A>>2;
  
  AND : out = A && B;
  OR : out = A || B;
  INV : out = ~(A);
  NAND : out = ~(A&B);
  NOR : out = ~(A | B);
  XOR : out = A^B;
  XNOR : out = A^~B;
  BUF : out = A;
 endcase
end
assign dout = oe ? out : 16'hzzzz;
endmodule
  
			
			