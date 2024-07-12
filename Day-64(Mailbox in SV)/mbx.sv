module tb;
  mailbox mbx;
  integer k;
  initial begin
    mbx = new(1); //Mailbox size = 1
    fork 
      
      //First thread
      
      for (int i=1; i<4; i++)
        begin
          $display("Producer: before put(%0d)",i);
          mbx.put(i);
          $display("Producer: after put(%0d)",i);
        end
      
      //second thread
      repeat(3) 
        begin
          mbx.get(k);
          $display("Consumer: after get(%0d)",k);
        end
    join
  end
endmodule