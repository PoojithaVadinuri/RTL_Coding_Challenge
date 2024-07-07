 class constraints;
    rand bit [3:0] a,b,c;
    constraint c1 {
      a inside {[1:2]};
    }
    constraint c2 {
      c <= 5;
    }
endclass

module test;
  initial begin
    constraints cls;
    cls = new(); //constructing an object 
    cls.randomize(); //randomizes all 3 variables    
    $display("a=%d \t b=%d \t c=%d", cls.a,cls.b,cls.c);
	#20;
	//Randomizing only variable b and turning off the rand variables a,c..so that they wont randomize by randomize() function
    $display("RANDOMIZING ONLY VARIABLE B using RAND_MODE");
    repeat(2)
      begin
    cls.a.rand_mode(0);
    cls.c.rand_mode(0);
    cls.randomize();
    $display("a=%d \t b=%d \t c=%d", cls.a,cls.b,cls.c);
    //printing the rand mode of 'a', 'b', 'c'    
    $display("a.rand_mode=%d \t b.rand_mode()=%d \t c.rand_mode()=%d",cls.a.rand_mode(),cls.b.rand_mode(),cls.c.rand_mode());
      end   
    $display(" CONSTRAINT_MODE");
    cls.c1.constraint_mode(0);
    $display("a=%d \t b=%d \t c=%d", cls.a,cls.b,cls.c);
    #10;
    cls.c1.constraint_mode(1);
    cls.c2.constraint_mode(0);
    cls.randomize();
    $display("a=%d \t b=%d \t c=%d", cls.a,cls.b,cls.c);
    end
endmodule

