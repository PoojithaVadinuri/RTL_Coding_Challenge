
module fa9(cout2,cout1,cout0,sum,a,b,c,d,e,f,g,h,i);
input a,b,c,d,e,f,g,h,i;
output sum,cout2,cout1,cout0;

fa8 s1(c2,c1,c0,s,a,b,c,d,e,f,g,h);
ha s2(c3,sum,s,i);
ha s3(c4,cout0,c0,c3);
ha s4(c5,cout1,c4,c1);
ha s5(unused,cout2,c5,c2);
endmodule