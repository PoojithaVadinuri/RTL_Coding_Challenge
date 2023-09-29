module fa5(cout1,cout0,sum,a,b,c,d,e);
input a,b,c,d,e;
output sum,cout1,cout0;
fa4 f1(c1,c0,s,a,b,c,d);
ha f2(c2,sum,s,e);
ha f3(c3,cout0,c0,c2);
ha f4(unused,cout1,c1,c3);

endmodule
