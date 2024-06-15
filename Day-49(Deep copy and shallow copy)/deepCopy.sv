//1st class    
class A;
  bit [7:0] addr,data;
    function void copy(A inp);
		this.addr = inp.addr;
		this.data = inp.data;
    endfunction
endclass
//2nd class
class B;
  bit [7:0] p1,p2;
  A a1;
  function new();
    a1 = new;
  endfunction
  
  function void copy(B inp); //copy function
    p1 = inp.p1;
    p2= inp.p2;
    a1.copy(inp.a1);
  endfunction
endclass
//testing
module tb;
  B b1,b2;
  initial begin
    b1 = new;
    b1.p1=33;
    b1.p2 = 44;
    b1.a1.addr = 11;
    b1.a1.data = 22;
    $display("b1.p1=%d, b1.p2=%d, b1.a1.addr=%d, b1.a1.data=%d",b1.p1,b1.p2,b1.a1.addr,b1.a1.data);
    b2 = new; //object b2 is created
    b2.copy(b1);
    b1.p1= 32;
    b1.p2 = 43;
    b1.a1.addr = 70;
    b1.a1.data = 60;
    $display("b1.p1=%d, b1.p2=%d, b1.a1.addr=%d, b1.a1.data=%d",b1.p1,b1.p2,b1.a1.addr,b1.a1.data);   
    $display("b2.p1= %0d, b2.p2= %0d, b2.a1.addr %d, b2.a1.data= %d", b2.p1,b2.p2,b2.a1.addr,b2.a1.data);
    end
endmodule
