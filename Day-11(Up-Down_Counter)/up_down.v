module updown(clk,rst,cnt);
input clk,rst;
output [2:0] cnt;

reg [2:0] cnt;

`ifdef  PREV_CNT;
reg [2:0] pcnt;

always @(posedge clk or posedge rst)
begin
 if (rst) pcnt <=1;
 else pcnt <= cnt;
end

always @(posedge clk or posedge rst)
begin
 if (rst) cnt <=0;
 else
  begin
   if (cnt==7) cnt <=6;
   else 
    begin
	 if (cnt==0) cnt <=1;
	 else 
	 begin
	  cnt <= (pcnt > cnt) ? (cnt -1): (cnt+1);
	  end
	 end
  end
end
`endif

`ifdef FSM
parameter UP=0;
parameter DOWN=1;
reg state;

always @(posedge clk or posedge rst)
begin
 if (rst) state <= UP;
 else
 case (state)
 UP: state <= cnt==6 ? DOWN:UP;
 DOWN: state <= cnt==1 ? UP:DOWN;
 endcase

end

always @(posedge clk or posedge rst)
begin
if (rst) cnt <=0;
else 
if (cnt==7) cnt <=6;
   else 
    begin
	 if (cnt==0) cnt <=1;
	 else 
	  case(state)
	  UP: cnt<= cnt+1;
	  DOWN:cnt<= cnt-1;
	  endcase
	  end
	 end
`endif


endmodule