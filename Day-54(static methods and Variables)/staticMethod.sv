// Code your testbench here
// or browse Examples
class packet;
  bit [7:0] addr,data;
  
  static int id;
  static bit mode =1;
  
  function new();
    id ++;
  endfunction
  //STATIC FUNCTION
  static function int get();
    return id;
  endfunction
  
endclass
module tb;

packet pkt1,pkt2;

int ret;

initial begin
  $display("static variable id = %0d", packet::id);
  
  $display("static methid ret = %0d", packet::get());
  
  pkt1 = new;
  $display("id= %0d, id = %0d", packet::id,pkt1.id);
  
  pkt2 = new;
  $display("static variable id = %0d", packet::id);
  
  ret = packet::get();
  
  $display("static method ret = %0d",ret);
  
end

endmodule