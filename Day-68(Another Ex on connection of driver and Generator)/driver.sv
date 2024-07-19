class driver ;
//Section D.1:Define virtual interface, mailbox and packet class handles
packet pkt;
  packet q_inp[$];
virtual router_if.tb_mod_port vif;
mailbox #(packet) mbx;

//Section D.2: Define variable no_of_pkts_recvd to keep track of packets received from generator
bit [31:0] no_of_pkts_recvd;
  bit [31:0] total_packets;

//Section D.3: Define custom constructor with mailbox and virtual interface handles as arguments
  function new (input mailbox #(packet) mbx_arg, input virtual router_if.tb_mod_port vif_arg,input bit [31:0] pkt_count);
mbx = mbx_arg;
vif = vif_arg;
total_packets = pkt_count;
endfunction
//Define extern methods.
extern task run();
extern task drive (packet pkt);
extern task drive_reset(packet pkt);
extern task drive_stimulus(packet pkt);
endclass

//Section D.7: Define run method to start the driver operations
task driver::run();
$display("[Driver] run started at time=%0t",$time); 

while(1) begin //driver runs forever 
//Section D.7.1: Wait for packet from generator and pullout once packet available in mailbox
 
$display("Waiting to receive packets");
mbx.get(pkt);
$display("[Driver] Received  %0s packet %0d from generator at time=%0t",pkt.kind.name(),no_of_pkts_recvd,$time); 
//Section D.7.2: Process the Received transaction
drive(pkt);
$display("[Driver] Done with %0s packet %0d from generator at time=%0t",pkt.kind.name(),no_of_pkts_recvd,$time); 
  if (no_of_pkts_recvd == total_packets)
    break;
  
no_of_pkts_recvd++;
  
end//end_of_while
endtask

//Section D.6: Define drive method with packet as argument
task driver::drive(packet pkt);
//Section D.6.1: Check the transaction type and call the appropriate method
case (pkt.kind)
	RESET : drive_reset(pkt);
	STIMULUS : 
      begin
        //pkt.pack(pkt.inp_stream);
        drive_stimulus(pkt);
        //q_inp.pushback(pkt);
      end
  
	default : $display("[Driver] Unknown packet received");
endcase
endtask

//Section D.4: Define drive_reset method with packet as argument
task driver::drive_reset(packet pkt);
$display("[Driver] driving reset transaction into DUT at time = %0t", $time);
vif.reset <= 1'b1;
repeat(pkt.reset_cycles) @(vif.cb);
vif.reset <= 1'b0;
$display("[Driver] Driving reset transaction completed at time = %0t", $time);
endtask


//Section D.5: Define drive_stimulus method with packet as argument
task driver::drive_stimulus(packet pkt);
wait (vif.cb.busy==0);
@(vif.cb);
$display("[Driver] Driving of packet %0d (size = %0d) started at time = %0t",no_of_pkts_recvd,pkt.len,$time);
vif.cb.inp_valid <= 1;
foreach(pkt.inp_stream[i])
begin
 vif.cb.dut_inp <= pkt.inp_stream[i];
 @(vif.cb);
 end
 
 $display("[Driver] driving of packet %0d (size = %0d) ended at time = %0t\n", no_of_pkts_recvd, pkt.len,$time);
 //@(vif.cb);
 vif.cb.inp_valid <=0;
 vif.cb.dut_inp <= 'z;
 repeat(5) @(vif.cb);
 endtask


