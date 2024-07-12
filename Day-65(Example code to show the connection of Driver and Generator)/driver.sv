class driver;
  packet pkt;
  mailbox m_box;
  
  //constructor, getting mailbox handle
  function new(mailbox inp);
    this.m_box = inp;
  endfunction
  
  task run;
    repeat(2) begin
      m_box.get(pkt); //getting packet from mailbox
      $display("Driver::Packet Recived");
      $display("Driver::Addr=%0d,Data=%0d\n",pkt.addr,pkt.data);
    end
  endtask
endclass