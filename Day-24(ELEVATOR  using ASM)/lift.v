module lift (clk,rst,ra,rb,rc,rd,floor);
 
input clk,rst,ra,rb,rc,rd;
output [2:0] floor;
reg [2:0] floor;
parameter A=0, BU=1, BD=2, CU=3, CD=4, D=5; //Floor A, Floor-B (direction Upper), Floor B (Direction-Down), Floor-C (direction Upper), Floor C (Direction-Down), Floor D
//enum {A,BU,BD,CU,CD,D} floor;
always @(posedge clk or posedge rst)
begin
	if (rst) floor <=A;
	else 
	case (floor) 
	A: case (1)
		ra : floor <= A;
		rb : floor <= BU;
		rc : floor <= CU;
		rd : floor <=D;
	   endcase
		
    BU: case (1)
		rb : floor <= BU;
		rc : floor <= CU;
		rd : floor <= D;
		ra : floor <=A;
	   endcase
	   	
    BD: case (1)
		rb : floor <= BD;
		ra : floor <=A;
		rc : floor <= CU;
		rd : floor <= D;
	   endcase
	   
	CU: case (1)
		rc : floor <= CU;
		rd : floor <=D;
		rb : floor <= BD;
		ra : floor <= A;
	   endcase
	  
	CD: case (1)
		rc : floor <=CD;
		rb : floor <= BD;
		ra : floor <= A;
		rd : floor <=D;
		endcase 
	
    D: case (1)
	    rd : floor <=D; 
		rc : floor <=CD;
		rb : floor <= BD;
		ra : floor <= A;
		
		endcase
		
	endcase
end

endmodule
	
		
		
		


   