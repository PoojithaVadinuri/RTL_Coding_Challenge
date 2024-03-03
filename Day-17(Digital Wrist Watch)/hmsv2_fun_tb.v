module tb;
reg clk=0; always #5 clk=!clk;
reg rst=1; initial #2 rst=0;

reg stop_run=0,next=0,inc=0,dec=0;
reg stop_runNBA=0,nextNBA=0,incNBA=0,decNBA=0;

always @* stop_runNBA <=stop_run;
always @* incNBA <= inc;
always @* decNBA <= dec;
always @* nextNBA <= next;

wire [4:0] hours;
wire [5:0] minutes,seconds;


hmsv2 dut(clk,rst,stop_runNBA,incNBA,decNBA,nextNBA,hours,minutes,seconds);

`include "tasks.txt"
initial 
	begin
	cycles(5);
	#3;
	stop_run_pulse;
	cycles(12);
		incpulse;
	repeat(5) @(posedge clk);
	
	fork
		begin//T1
			incpulse;
			decpulse;
		end
		begin//T2
			stop_run_pulse;//Line 31 parallel to 35
			nextpulse;
		end
	join
	
	cycles(5);
	
	fork
		nextpulse;
		incpulse;
	join
	
	cycles(100);
	incpulse;
	cycles(20);
	
	fork
		stop_run_pulse;
		nextpulse;
	join
	cycles(5);
	
	repeat(30)
	begin
		incpulse;
		repeat ($urandom_range(3,10)) @(posedge clk); //increment pulse
	end
	
	repeat(5) @(posedge clk);
	repeat(30)
	begin
		decpulse;
		repeat ($urandom_range(3,10)) @(posedge clk); //decrement pulse
	end
	
	repeat(5) @(posedge clk);
	stop_run_pulse;
	repeat(5) @(posedge clk);

    $finish;
	end
endmodule
	