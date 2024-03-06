module tb;
reg [3:0] parallel_in;
reg serial_rightin;
reg serial_leftin;
reg [1:0] select;
reg clk=0,rstN=0;
wire serial_rightout;
wire serial_leftout;
wire reg [3:0] parallel_out;

USR dut (.clk(clk),.rstN(rstN),.serial_rightin(serial_rightin),.serial_leftin(serial_leftin),.serial_rightout(serial_rightout),.serial_leftout(serial_leftout),.select(select),.parallel_in(parallel_in),.parallel_out(parallel_out));


always #5 clk = ~clk;
  initial begin
    $monitor("At t=%t  select=%b, p_din=%b, s_left_din=%b, s_right_din=%b --> p_dout = %b, s_left_dout = %b, s_right_dout = %b",$time,select, parallel_in, serial_leftin, serial_rightin, parallel_out, serial_leftout, serial_rightout);
    
    #2 rstN = 1;
    
    parallel_in = 4'b1101;
    serial_leftin = 1'b1;
    serial_rightin = 1'b0;
    
    select = 2'h3; #10;
    select = 2'h1; #20;
    parallel_in = 4'b1100;
    select = 2'h3; #10;
    select = 2'h2; #20;
    select = 2'h0; #20;
    
    $finish;
  end

  initial begin 
    $dumpfile("dump.vcd"); 
	$dumpvars;
  end
   
endmodule

