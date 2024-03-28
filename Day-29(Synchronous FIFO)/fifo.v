module fifo (
input clk,
input rst,
input wr,rd,
input [7:0] din,
output reg [7:0] dout,
output reg [3:0] wrptr,rdptr
);

//reg [7:0] box1,box2,box3,box4,box5,box6,box7,box8,box9,box10;
reg [7:0] box[1:10];
integer i;
wire [3:0] wrptrnext,rdptrnext;
enum {EMP,PAR,FUL} state;
assign wrptrnext = (wrptr==10) ? 1:(wrptr+1); 
assign rdptrnext = (rdptr==10) ? 1:(rdptr+1); 

always @(posedge clk or posedge rst)
begin
if (rst) state <= EMP;
else
	case (state)
	EMP: state <= wr? PAR : EMP;
	PAR: case(1)
		wr && (wrptrnext == rdptr) : state <= FUL;
		rd && (rdptrnext == wrptr) : state <= EMP;
		default: state <= PAR;
		endcase
	FUL: state <= rd ? PAR : FUL;
	endcase
end

always @(posedge clk or posedge rst)
begin
if (rst)
	wrptr <= 1;
else
case (state)
EMP,PAR : wrptr <= wr ? wrptrnext : wrptr;
FUL: wrptr <= wrptr;
endcase
end

always @(posedge clk or posedge rst)
begin
if (rst)
	rdptr <= 1;
else
case (state)
FUL,PAR : rdptr <= rd ? rdptrnext : rdptr;
EMP: rdptr <= rdptr;
endcase
end

always @(posedge clk or posedge rst)
begin
if(rst) for (i=1;i<=10;i=i+1) box[i] <= 0;

else
case(state)
EMP,PAR:if(wr)
			box[wrptr] <= din;
endcase
end			

always @(posedge clk or posedge rst)
begin
if (rst) dout <= 0;
else 
case (state)
EMP: dout <= dout;
PAR,FUL : if (rd)
			dout <= box[rdptr];
endcase
end

endmodule
