module mul8(Y,A,B);
input [7:0] A,B;
output [16:0] Y;




and g00(Y[0],A[0],B[0]);
and g10(p10,A[1],B[0]);
and g20(p20,A[2],B[0]);
and g30(p30,A[3],B[0]);
and g40(p40,A[4],B[0]);
and g50(p50,A[5],B[0]);
and g60(p60,A[6],B[0]);
and g70(p70,A[7],B[0]);

and g01(p01,A[0],B[1]);
and g11(p11,A[1],B[1]);
and g21(p21,A[2],B[1]);
and g31(p31,A[3],B[1]);
and g41(p41,A[4],B[1]);
and g51(p51,A[5],B[1]);
and g61(p61,A[6],B[1]);
and g71(p71,A[7],B[1]);

and g02(p02,A[0],B[2]);
and g12(p12,A[1],B[2]);
and g22(p22,A[2],B[2]);
and g32(p32,A[3],B[2]);
and g42(p42,A[4],B[2]);
and g52(p52,A[5],B[2]);
and g62(p62,A[6],B[2]);
and g72(p72,A[7],B[2]);

and g03(p03,A[0],B[3]);
and g13(p13,A[1],B[3]);
and g23(p23,A[2],B[3]);
and g33(p33,A[3],B[3]);
and g43(p43,A[4],B[3]);
and g53(p53,A[5],B[3]);
and g63(p63,A[6],B[3]);
and g73(p73,A[7],B[3]);

and g04(p04,A[0],B[4]);
and g14(p14,A[1],B[4]);
and g24(p24,A[2],B[4]);
and g34(p34,A[3],B[4]);
and g44(p44,A[4],B[4]);
and g54(p54,A[5],B[4]);
and g64(p64,A[6],B[4]);
and g74(p74,A[7],B[4]);

and g05(p05,A[0],B[5]);
and g15(p15,A[1],B[5]);
and g25(p25,A[2],B[5]);
and g35(p35,A[3],B[5]);
and g45(p45,A[4],B[5]);
and g55(p55,A[5],B[5]);
and g65(p65,A[6],B[5]);
and g75(p75,A[7],B[5]);

and g06(p06,A[0],B[6]);
and g16(p16,A[1],B[6]);
and g26(p26,A[2],B[6]);
and g36(p36,A[3],B[6]);
and g46(p46,A[4],B[6]);
and g56(p56,A[5],B[6]);
and g66(p66,A[6],B[6]);
and g76(p76,A[7],B[6]);

and g07(p07,A[0],B[7]);
and g17(p17,A[1],B[7]);
and g27(p27,A[2],B[7]);
and g37(p37,A[3],B[7]);
and g47(p47,A[4],B[7]);
and g57(p57,A[5],B[7]);
and g67(p67,A[6],B[7]);
and g77(p77,A[7],B[7]);

ha a1(c0,Y[1],p01,p10);


fa4 a2(c2,c1,Y[2],p20,p11,p02,c0);
fa5 a3(c4,c3,Y[3],p30,p21,p12,p03,c1);
fa7 a4(c6,c5,Y[4],p40,p31,p22,p13,p04,c2,c3);
fa8 a5(c9,c8,c7,Y[5],p50,p41,p32,p23,p14,p05,c4,c5);
fa9 a6(c12,c11,c10,Y[6],p60,p51,p42,p33,p24,p15,p06,c6,c7);
fa10 a7(c15,c14,c13,Y[7],p70,p61,p52,p43,p34,p25,p16,p07,c8,c10);
fa10 a8(c18,c17,c16,Y[8],p71,p62,p53,p44,p35,p26,p17,c9,c11,c13);
fa9 a9(c21,c20,c19,Y[9],p72,p63,p54,p45,p36,p27,c12,c14,c16);
fa8 a10(c24,c23,c22,Y[10],p73,p64,p55,p46,p37,c15,c17,c19);
fa7 a11(c26,c25,Y[11],p74,p65,p56,p47,c18,c20,c22);
fa6 a12(c28,c27,Y[12],p75,p66,p57,c21,c23,c25);
fa5 a13(c30,c29,Y[13],p76,p67,c24,c26,c27);
fa3 a14(c31,Y[14],p77,c28,c29);
ha a15(Y[16],Y[15],c30,c31);

endmodule