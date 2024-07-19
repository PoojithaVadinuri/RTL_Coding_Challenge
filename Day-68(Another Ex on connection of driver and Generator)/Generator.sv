class generator ;
bit [31:0] pkt_count;
//Section G.1:Define mailbox and packet class handles
packet ref_pkt;
mailbox #(packet) mbx;
//Section G.2: Define custom constructor with mailbox and packet class handles as arguments
function new(input mailbox #(packet) mbx_arg, input bit [31:0] count_arg);
mbx = mbx_arg;
pkt_count = count_arg;
ref_pkt = new;
endfunction

task run ();
bit [31:0] pkt_id;
packet gen_pkt;

//Section G.3: Generate First packet as Reset packet
gen_pkt = new;

//Section G.3.1: Fill the packet type, this will be used in driver to identify
gen_pkt.kind = RESET;
gen_pkt.reset_cycles = 2;

$display("[Generator] Sending %0s packet %0d to driver at time=%0t",gen_pkt.kind.name(),pkt_id,$time); 
//Section G.3.2: Place the Reset packet in mailbox

mbx.put(gen_pkt);
//Section G.4: Generate NORMAL Stimulus packets
repeat (pkt_count)
begin
	pkt_id++;
	void'(ref_pkt.randomize());
	gen_pkt = new;	
//Section G.4.1: Fill the packet type, this will be used in driver to identify
gen_pkt.copy(ref_pkt);
gen_pkt.kind = STIMULUS;
//Section G.4.2: Place normal stimulus packet in mailbox
mbx.put(gen_pkt);
  $display("[Generator] Packet %0d (size=%0d) Generated at time=%0t",pkt_id,gen_pkt.len,$time); 
end
endtask
endclass