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
      join_any
      result(10,"process2");
    join_any
    $display("[%0t] Main thread: Fork join is completed",$time);
    end
             
             
endmodule