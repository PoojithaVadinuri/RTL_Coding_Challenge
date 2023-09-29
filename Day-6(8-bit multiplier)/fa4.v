module fa4(cout1,cout0,sum,a,b,c,d);
input a,b,c,d;
output sum,cout1,cout0;
fa3 f1(c0,s0,a,b,c);
ha f2(c1,sum,s0,d);
ha f3(cout1,cout0,c0,c1);
endmodule