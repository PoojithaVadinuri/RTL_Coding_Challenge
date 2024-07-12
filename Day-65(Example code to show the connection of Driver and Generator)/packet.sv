class packet;
  rand bit [7:0] addr;
  rand bit [7:0] data;
  
  //Displaying randomized values
  function void post_randomize();
    $display("Packet::Packet Generated");
    $display("Packet::Addr=%0d,Data=%0d",addr,data);
  endfunction
endclass