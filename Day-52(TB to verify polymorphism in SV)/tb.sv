class Base;
  int a,e;
  function int display();
    return a;
  endfunction
  
  virtual function void print();
    $display("[base] e=%d",e);
  endfunction
endclass

class Derived extends Base;
  int c;
  
  function void print();
    $display("[derived] c=%d,e=%d", c,e);
  endfunction
  
endclass

program test;
  Derived d;
  Base b;
  int r1,r2;
  initial begin
    b = new;
    d = new;
    b.a = 40;
    b.e = 21;
    d.a=20;
    d.c = 30;
    d.e = 12;
    r1=b.display();
    r2=d.display();
    $display("b.display=%d",b.display());
    $display("d.display=%d",d.display()); 
    b.print();
    b = d; //handle assignment
    b.print();
    d.print(); 
     end
endprogram
