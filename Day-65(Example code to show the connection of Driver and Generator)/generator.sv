class generator;
  packet pkt;
  mailbox m_box;
  
  //constructor, getting mailbox handle
  function new(mailbox inp1);
    this.m_box = inp1;
  endfunction
  
  task run;
    repeat(2) begin
      pkt = new();
      pkt.randomize(); //generating packet
      m_box.put(pkt);  //putting packet into mailbox
      $display("Generator::Packet Put into Mailbox");
      #5;
    end
  endtask
endclass