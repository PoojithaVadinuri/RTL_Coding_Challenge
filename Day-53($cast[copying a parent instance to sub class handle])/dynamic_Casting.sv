// Code your testbench here
// or browse Examples
class Base;
  
  function void print();
    $display("it is a [base] class" );
  endfunction
  
endclass

class Derived extends Base;
  
  function void print();
    $display("It is a [derived] class");
  endfunction

endclass

program test;
  Derived d1,d2;
  Base b;
  
  initial begin
    d1 = new;
    b = d1;//handle assignment
    b.print();
    $cast(d2,b);//Legal...
    d2.print();
   
  end
endprogram