// Code your testbench here
// or browse Examples
module none_any;
  event e;
  
  task thread1;
     begin
      $display("thread1 started at %t ns", $time);
      #5;
      $display("thread1 ended at %tns",$time);
      ->e;
    end
  endtask
  
  task thread2;
  begin
    $display("thread2 started at %t ns", $time);
      #10;
    $display("thread2 ended at %tns",$time);
      ->e;
    end
  endtask
  
    
  initial begin
    fork
      thread1();
      thread2();
        
    
    join_none
    @e;
    $display("out of fork block at %0t", $time);
  end
  endmodule
    
    