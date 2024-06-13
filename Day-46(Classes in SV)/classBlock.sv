class Packet;
  bit [7:0] addr;
  bit [31:0] wdata;
  logic rd,wr,rst;
 
  
  task reset();
    begin
    tbif.rst =1;
    tbif.cb.wr <=0;tbif.cb.rd<=0;
      tbif.cb.addr<=0;
      tbif.cb.wdata<=0;
      repeat(2) @(tbif.cb);
    end
  endtask
  
   task write();
    begin
      @(tbif.cb);
      tbif.rst=1'b0;
      tbif.cb.wr<=1'b1;
      for (int i=0; i<=15; i++)
        begin
          tbif.cb.addr<= i;
          tbif.cb.wdata <= $urandom;
          @(tbif.cb);
        end
      tbif.cb.wr<=0;
      tbif.cb.wdata<= 'bz;
      repeat(2) @(tbif.cb);
    end
  endtask
  
  
    task read();
    begin
      @(tbif.cb);
      tbif.rst=1'b0;
      tbif.cb.rd<=1;
      for (int i=0; i<=15; i++)
        begin
          tbif.cb.addr<= i;
          
          @(tbif.cb);
        end
      tbif.cb.rd<=0;
    end
  endtask
  
endclass

