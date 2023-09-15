module fa7(cout1,cout0,sum,a,b,c,d,e,f,g);
input a,b,c,d,e,f,g;
output sum,cout1,cout0;

fa6 s1(c1,c0,s,a,b,c,d,e,f);
ha s2(c2,sum,s,g);
ha s3(c3,cout0,c0,c2);
ha s4(unused,cout1,c1,c3);

endmodule