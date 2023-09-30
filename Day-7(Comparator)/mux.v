module mux(y,s,i1,i0);
input i1,i0,s;
output y;

wire sbar,pi,p2;

not G1(sbar,s);
and G2(p1,sbar,i0);
and G3(p2,s,i1);
or G4(y,p1,p2);
endmodule
