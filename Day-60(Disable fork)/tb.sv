// Code your testbench here
// or browse Examples
module disable_fork_example;
  initial begin
    fork
      begin // Thread A
        $display("Thread A started at time = %0t", $time);
        #10;
        $display("Thread A completed at time = %0t", $time);
      end
      begin //Thread B
        $display("Thread B started at time = %0t", $time);
        #15;
        $display("Thread B completed at time = %0t", $time);
      end
      begin // Thread C
        $display("Thread C started at time = %0t", $time);
        #20;
        $display("Thread C completed at time = %0t", $time);
      end
    join_any
    $display("Disabling fork.....");
    disable fork;
      $display("fork-join_any completed, at time = %0t", $time);
  end
endmodule