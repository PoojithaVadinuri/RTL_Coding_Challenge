program tb( simple_bus tbif);
  `include "class.sv"
  Packet pkt;
  bit [31:0] outp_stream[$];
  
  
  initial begin
    pkt=new;
    
    pkt.reset();
    pkt.write();
   // pkt.print();
    pkt.read();
    
    repeat(2) @(tbif.cb);
    $finish;
  end
  
  initial begin
    forever begin
      @(posedge tbif.cb.outp_valid);
      
      while(1)
        begin
          outp_stream.push_back(tbif.cb.rdata);
          $strobe("rdata=%0d",tbif.cb.rdata, "at t= %t",$time);  
          if (tbif.cb.outp_valid==0)
            break;
          @(tbif.cb);
             
        end
     end
   end
  
initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end

endprogram

      