
// To show the difference between wait(event_name.triggered) and @(event_name) in same simulation time
module event_example_using_wait_triggered();
  event e1;
  
  task Thread1();
   
    $display("at %0tns: Before triggering event e1 in Thread1", $time);
    ->e1;
    $display("at %0tns: After triggering event e1 in Thread1", $time);
  endtask
  
  task Thread2();
    $display("at %0tns: waiting for the event e1 in Thread2", $time);
    @e1;
    $display("at %0tns: event e1 is triggered in Thread2", $time);
  endtask

  task Thread3();
    $display("at %0tns: waiting for the event e1 using wait.triggered in Thread3", $time);
    wait(e1.triggered);
    $display(" at %0tns: event e1 using wait.triggered  is triggered in Thread3", $time);
  endtask
  
  // Here I have given #10 delay such that wait (e1.triggered) is blocked completely (never unblocks) due to different simulation times
  
  task Thread4();
  #10;
   $display("at %0tns: waiting for the event e1 using wait.triggered in Thread4", $time);
    wait(e1.triggered);
    $display(" at %0tns: event e1 using wait.triggered  is triggered in Thread4", $time);
  endtask
  
  initial begin
    fork
      Thread1();
      Thread2();
      Thread3();
	  Thread4();
    join
  end
endmodule

