class A;
  int x;
endclass

module tb;
A a1,a2;
initial begin
  a1 = new; a1.x = 10;
  $display("a1.x=%d",a1.x);
  a2 = new; a2.x = 20;
  $display("a2.x=%d",a2.x);
  a1=a2;
  a1.x =30;
  $display("a1.x=%d, a2.x=%d", a1.x,a2.x);
  a2.x =50;
  $display("a1.x=%d, a2.x=%d", a1.x,a2.x);
end
endmodule