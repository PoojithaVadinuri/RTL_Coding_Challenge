module fa8(cout2,cout1,cout0,sum,a,b,c,d,e,f,g,h);
input a,b,c,d,e,f,g,h;
output sum,cout2,cout1,cout0;

fa7 s1(c1,c0,s,a,b,c,d,e,f,g);
ha s2(c2,sum,s,h);
ha s3(c3,cout0,c0,c2);
ha s4(cout2,cout1,c1,c3);

endmodule