class Packet;
  bit [1:0] a;
  logic [2:0] b[2];
  bit [2:0] c,d;
  
  function new(bit [1:0]x=3, logic [2:0] y = 6);
    a=x;
    b[0]=y;
    b[1]=y;
  endfunction
  
extern function void write(bit [2:0] c);
extern function void write2(bit [2:0] c);
endclass
//WITHOUT using THIS keyword  
  function void Packet::write(bit [2:0] c);
    d=c;
    c = d +2;
  endfunction
    
//using THIS keyword
  function void Packet::write2(bit [2:0] c);
    d=c;
    this.c = d +2;
  endfunction
       
/////TOP MODULE
module tb;
  Packet p1, p2;
  initial begin
    p1= new();
	void'(p1.randomize());
    $display("p1 Object properties by assigning default argument values: a=%d, b=%p, c= %d, d= %d",p1.a,p1.b,p1.c,p1.d);
    
	p2 = new (1,5);
	void'(p2.randomize());
    $display("p2 Object properties by assigning actual values to the function: a=%d, b=%p,c=%d, d=%d",p2.a,p2.b,p2.c,p2.d);
    
    p1.write(3);//without using this keyword
    void'(p1.randomize());
    $display("p1 Object properties without using THIS Keyword : a=%d, b=%p, c= %d, d= %d",p1.a,p1.b,p1.c,p1.d);
    
    p1.write2(3); //using this keyword
    void'(p1.randomize());
    $display("p1 object properties after using THIS keyword: a=%d, b=%p, c=%d, d=%d",p1.a,p1.b,p1.c,p1.d);
  end
endmodule