class Parameterized #(int size=10);
  bit [size-1:0] a;
  bit [size :0] b;
  
  function void disp();
    $display("size=%d",size);
  endfunction
  
  function void add (logic [size-1:0] in1,in2);
    b = in1 + in2;
    $display("[size]=%d, [add] b =%d",size,b);
  endfunction
  
endclass

//parametrized type
class type_param #( type T =int);
  T data;
  
  function T add_a(T a);
    return data + a;
  endfunction
endclass  

//initial block
module tb;
  Parameterized p10;
  Parameterized #(8) p8;
  Parameterized #(.size(11)) p11;
  
 type_param  d1;
 type_param #(bit[3:0]) d2;
  
initial begin
  p10 = new;
  p10.a = 10'h3ab;
  
  $display("[size=10] p10.a =%b('h%0h)",p10.a,p10.a);
  
  p8 = new;
  p8.a = 8'hcd;
  p8.disp();
  $display("[size=8] p8.a =%b('h%0h)",p8.a,p8.a);
  
  p11 = new;
  p11.a = $random;
  $display("size=11] p11.a=%b('h%0h)",p11.a,p11.a);
  
  p11.disp();
  p11.add(10,11);
  
  d1 = new;
  d2 = new;
  
  d1.data = -32;
  $display("d1.data=%0d",d1.add_a(10));
  
  d2.data = 4'hA;
  $display("d2.data=%d",d2.add_a(10));
    
  
end
endmodule