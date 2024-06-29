//Static class properties

class packet;
  static int id;
  bit [4:0] no_of_obj_created;
  
  function new();
    id++;
    no_of_obj_created = id;
  endfunction
  
endclass

module tb;
packet pkt1, pkt2, pkt3;

initial begin
  $display("id = %0d", packet::id);
  
  pkt1 = new; $display("[packet1 object] pkt1.id =%d, no_of_obj_created =%d ", pkt1.id, pkt1.no_of_obj_created);
  
  pkt2 = new; $display("[packet2 object] pkt2.id =%d, no_of_obj_created =%d ", pkt2.id, pkt2.no_of_obj_created);
  
  pkt3 = new; $display("[packet3 object] pkt3.id =%d, no_of_obj_created =%d ", pkt3.id, pkt3.no_of_obj_created);
  
  $display("pkt1.id =%d pkt1.no_of_obj_created =%d \n pkt2.id =%d  pkt2.no_of_obj_created =%d \n pkt3.id =%d pkt3.no_of_obj_created =%d", pkt1.id,pkt1.no_of_obj_created,pkt2.id,pkt2.no_of_obj_created,pkt3.id,pkt3.no_of_obj_created);
 
end

endmodule


