module any_to_none;
  
  initial begin
    
    fork
      //By introducing begin end inside of fork join we can come out of the fork join any without executing a single thread...At this time it acts as fork-join_none 
      begin
      end
    
    $display("At t=%0t Thread 1 ..started to execute", $time); //process-1
    begin//process 2
      #5 $display("At t=%0t Thread 2 ..started to execute", $time);
      #10 $display("At t=%0t Thread 2 ..completed its execution", $time);
    end
    
    #5 $display("At t= %0t Thread 3 ..started to execute and is done", $time);
    #20 $display("It is the lasst thread to execute");
    
    join_any
    
    $display("At t= %0t Out of fork block",$time);
    
  end
endmodule