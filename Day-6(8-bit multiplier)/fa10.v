
module fa10(cout2,cout1,cout0,sum,a,b,c,d,e,f,g,h,i,j);
input a,b,c,d,e,f,g,h,i,j;
output sum,cout2,cout1,cout0;

fa9 s1(c2,c1,c0,s,a,b,c,d,e,f,g,h,i);
ha s2(c3,sum,s,j);
ha s3(c4,cout0,c0,c3);
ha s4(c5,cout1,c4,c1);
ha s5(unused,cout2,c2,c5);

endmodule
