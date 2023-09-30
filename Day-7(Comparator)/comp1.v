module comp1(gt,eq,lt,a,b);
input a,b;
output gt,eq,lt;
and G1(gt,a,bbar);
xnor G2(eq,a,b);
and G3(lt,abar,b);
not G4(abar,a);
not G5(bbar,b);
endmodule 