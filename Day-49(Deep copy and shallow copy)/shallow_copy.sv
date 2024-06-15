//1st class
class A;
  bit [7:0] addr,data;
endclass
//2nd class
class B;
  bit [7:0] p1,p2;
  A a1;
  
  function new();
    a1 = new;
  endfunction
  
endclass

//testing
module tb;
B b1,b2;
initial begin
  b1 = new; b1.p1 =33; b1.p2=44;
  b1.a1.addr = 11;
  b1.a1.data = 22;
  
  $display("b1.p1=%d, b1.p2=%d, b1.a1.addr=%d, b1.a1.data=%d",b1.p1,b1.p2,b1.a1.addr,b1.a1.data);
  
  b2= new b1; /*b2 = new()
  				b2.p1 = b1.p1;
                b2.p2 = b1.p2;
                b2.a1 = b1.a1 //Handle is assigned 
                */
  b1.p1= 32;
  b1.p2 = 43;
  b1.a1.addr = 70;
  b1.a1.data = 60;
 
  $display("b1.p1=%d, b1.p2=%d, b1.a1.addr=%d, b1.a1.data=%d",b1.p1,b1.p2,b1.a1.addr,b1.a1.data);
  
  $display("b2.p1=%d, b2.p2=%d, b2.a1.addr=%d, b2.a1.data=%d",b2.p1,b2.p2,b2.a1.addr,b2.a1.data);
  end
endmodule

