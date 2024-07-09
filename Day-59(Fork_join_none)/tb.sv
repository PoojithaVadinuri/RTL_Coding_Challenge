// Code your testbench here
// or browse Examples
module tb;
  
  task automatic result(int _time, string name);
    #(_time) $display("[%0t] %s", $time,name);
  endtask
  
  initial begin
    $display("[%0t] Main thread: Fork_join started",$time);
    fork
      fork
        result(20, "process1_0");
        result(30, "process1_1");
      join_none
      result(10,"process2");
    join_none
             $display("[%0t] Main thread: Fork join is completed",$time);
    end
             
             
endmodule