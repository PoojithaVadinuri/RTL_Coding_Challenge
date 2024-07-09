// Code your testbench here
// or browse Examples
module tb;
  initial begin
    $display("[%0t] main Thread: Fork join is about to start",$time);
    fork
      //Thread1
      #40 $display("[%0t] thread1 finished", $time);
      //Thread2
      begin
        #2 $display("[%0t] Thread2...",$time);
        #20 $display("[%0t] Thread2 finished", $time);
      end
      //Thread 3
      #30 $display("[%0t] Thread3 is done", $time);
    join
    $display("[%0t] Main thread: fork join has finished",$time);
  end
  
endmodule




