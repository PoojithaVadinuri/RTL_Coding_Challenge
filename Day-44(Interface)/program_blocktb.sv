program tb( simple_bus tbif, input clk);
  
  task reset();
    begin
    tbif.rst =1;
    tbif.wr=0;tbif.rd=0;
      tbif.addr=0;
      tbif.wdata=0;
      repeat(2) @(posedge clk);
    end
  endtask
  
  task write();
    begin
      @(posedge clk);
      tbif.rst=1'b0;
      tbif.wr=1'b1;
      for (int i=0; i<=15; i++)
        begin
          tbif.addr= i;
          tbif.wdata = $urandom;
          @(posedge clk);
        end
      tbif.wr=0;
    end
  endtask
  
  task read();
    begin
      @(posedge clk);
      tbif.rst=1'b0;
      tbif.rd=1;
      for (int i=0; i<=15; i++)
        begin
          tbif.addr= i;
          
          @(posedge clk);
        end
      tbif.rd=0;
    end
  endtask
  
  initial begin
    reset();
    write();
    read();
    repeat(2) @(posedge clk);
   
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endprogram

      