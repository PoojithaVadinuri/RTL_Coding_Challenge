program testbench(input clk, router_if vif);

//Section4: TB Variables declarations. 
//Variables required for various testbench related activities . 
//ex: class handles

//Section 4.1 : Include packet,generator and driver classes
`include "packet.sv"
`include "Generator.sv"
`include "Driver.sv"

//Section 4.2 : Define generator,driver and mailbox class handles
generator gen;
driver drvr;
mailbox #(packet) mbx;


//Section 4.3 : Stimulus packet count 
bit [31:0] pkt_count;

//Section 6: Verification Flow
initial begin
//Section 6.1 : How many number of packets to generate

pkt_count = 5;
//Section 6.2 : Construct objects for mailbox,generator and driver.
//Also connect vif(interface) port of program block to driver virtual interface.

mbx = new(1);
gen = new(mbx,pkt_count);
  drvr = new(mbx,vif,pkt_count);

//Section 6.3 : Start generator and driver
fork 
gen.run();
drvr.run();
join_any

wait fork;
//Wait for dut to process the packet and to drive on output
wait(vif.cb.busy==0);//drain time
  repeat(10) @(vif.cb);//drain time
  $finish;
end

endprogram


`include "top.sv"




