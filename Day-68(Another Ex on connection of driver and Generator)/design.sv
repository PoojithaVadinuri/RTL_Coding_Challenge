// Code your design here
module router_dut (clk,reset,dut_inp,inp_valid,dut_outp,outp_valid,busy,error);
  input clk,reset;
  input [7:0] dut_inp;
  input inp_valid;
  
  output [7:0] dut_outp;
  output outp_valid;
  output busy;
  output [3:0] error;
  reg [7:0] dut_outp;
  reg outp_valid,busy;
  reg [3:0] error;
logic [7:0] inp_pkt[$];
bit done,sop; 
reg [7:0] reg_inp;
bit [31:0] len_recv; 
bit [31:0] crc_dropped_count;
bit [31:0] pkt_len_dropped_count;
bit [31:0] pkt_corrupt_dropped_count;
bit [31:0] total_inp_pkt_count;
bit [31:0] total_outp_pkt_count;

always@(posedge clk or posedge reset) begin 
if(reset) begin
busy <='0;
inp_pkt.delete();
done <='0;
len_recv <='0;
error <='0; 
crc_dropped_count <='0;
pkt_len_dropped_count <='0;
total_inp_pkt_count <='0;
total_outp_pkt_count <='0;
pkt_corrupt_dropped_count <='0;
outp_valid <='0;
dut_outp <='z;
sop <=0;
reg_inp<='0;
end
else if(inp_valid) begin
sop<=1; 
reg_inp<=dut_inp;
end
else 
sop<=0;
end//end_of_always

always @(posedge sop) begin
error<='0; //clear the error status
 inp_pkt.push_back(reg_inp);
while(1) begin
 @(posedge clk);
 if(inp_valid==0)  begin
	len_recv={inp_pkt[5],inp_pkt[4],inp_pkt[3],inp_pkt[2]};
		if (inp_pkt.size() == len_recv) begin
				total_inp_pkt_count++;
		if($test$plusargs("dut_debug") )
		$display("[DUT Input] Packet %0d collected size=%0d time=%0t",total_inp_pkt_count,inp_pkt.size(),$time);
		end else begin
		total_inp_pkt_count++;
		pkt_corrupt_dropped_count++;
		if($test$plusargs("dut_debug"))
		 $display("[DUT LEN Error] Packet %0d Dropped in DUT due to Length Mismatch time=%0t",total_inp_pkt_count,$time);
		
		    error<=5;
		    inp_pkt.delete();
			done<=0;
			busy<=0;
			break; 
		end//Len_Check_ends
		
		if(is_packet_not_ok(inp_pkt)) begin
			inp_pkt.delete();
			done<=0;
			busy<=0;
			break;//drop the packet as size criteria not matching
		end
		if(calc_crc(inp_pkt)) begin
			  done<=1;
			  busy<=1;
			  break; 
		end//end_of_crc_if
		else begin
			crc_dropped_count++;
			if($test$plusargs("dut_debug_crc")) 
			$display("[DUT CRC] Packet %0d Dropped in DUT due to CRC Mismatch time=%0t",total_inp_pkt_count,$time);
			error<=2;//CRC mismatch
			inp_pkt.delete();
			done<=0;
			busy<=0;
			break;
		end
 end//end_of_if_inp_valid_0_Check
 inp_pkt.push_back(dut_inp);
 if($test$plusargs("dut_debug_input"))
    $display("[DUT Input] dut_inp=%0d time=%0t",dut_inp,$time);
end//end_of_while
sop<=0;
len_recv<=0;
reg_inp<='0;
end//end_of_always

always @(posedge clk) begin
while (done==1 && error==0) begin
@(posedge clk);
outp_valid <=1;
dut_outp <= inp_pkt.pop_front();
 if($test$plusargs("dut_debug_output"))
    $strobe("[DUT Output] dut_outp=%0d time=%0t",dut_outp,$time);
if(inp_pkt.size() ==0) begin
      total_outp_pkt_count++;
   if($test$plusargs("dut_debug") )
      $display("[DUT Output] Total Packet %0d Driving completed at time=%0t \n",total_outp_pkt_count,$time);
  done<=0;
  busy<=0;
  @(posedge clk);
  outp_valid <= 1'b0;
  dut_outp <= 'z;
  //break;
end//end_of_if;  
end//end_of_while
end

always@(inp_valid or dut_inp) begin
if(!$isunknown(dut_inp) && busy) begin
    if($test$plusargs("dut_debug"))begin
     $display("[DUT Protocol ERROR] *************************************");
     $display("[DUT Protocol] Protocol violation detected at time=%0t",$time);
     $display("[DUT Protocol] inp_valid or dut_inp changed while router is busy at time=%0t",$time);
     $display("[DUT Protocol ERROR] *************************************");
    end
     error <= 1;
end
else error<=0;
end

function automatic bit calc_crc(const ref logic [7:0] pkt[$]);
bit [31:0] crc,new_crc;
bit [7:0] payload[$];
crc={pkt[9],pkt[8],pkt[7],pkt[6]};
for(int i=10;i < pkt.size(); i++) begin
    payload.push_back(pkt[i]);
end
new_crc=payload.sum();
payload.delete();
    if($test$plusargs("dut_debug_crc"))
       	$display("[DUT CRC] Received crc=%0d caluclated crc=%0d time=%0t",crc,new_crc,$time);
return (crc == new_crc);
endfunction

function automatic bit is_packet_not_ok(const ref logic [7:0] pkt[$]);
if(pkt.size() < 12 || pkt.size() > 2000) begin
pkt_len_dropped_count++; //Drop the packet as its not satisfying minimum or maximux size of packet
 if($test$plusargs("dut_debug")) begin
   $display("[DUT_ERROR] Packet %0d Dropped in DUT due to size mismatch at time=%0t",total_inp_pkt_count,$time);
   $display("[DUT_ERROR] Received packet size=%0d Bytes, Allowed range 12Bytes ->to-> 2000 Bytes ",pkt.size());
 end
if(pkt.size() < 12 )   error<=3;
if(pkt.size() > 2000 ) error<=4;
return 1;
end else return 0;
endfunction
endmodule