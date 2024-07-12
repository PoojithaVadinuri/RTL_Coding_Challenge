`include "packet.sv"
`include "generator.sv"
`include "driver.sv"

module mailbox_ex;
  generator gen;
  driver    drvr;
  mailbox m_box; //declaring mailbox m_box
  
  initial begin
    //Creating the mailbox, Passing the same handle to generator and driver, because same mailbox shold be used inorder to communicate.
    m_box = new(); //creating mailbox
    
    gen = new(m_box); //creating generator and passing mailbox handle
    drvr = new(m_box); //creating driver and passing mailbox handle
    $display("*************************************");
    fork
      gen.run(); //Process-1
      drvr.run(); //Process-2
    join
    $display("**************************************");
  end
endmodule