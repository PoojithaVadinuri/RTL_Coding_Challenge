

module ha(sum,cout,a,b);
  input a,b;
  output cout,sum;
  xor G2(sum,a,b);
  and G1(cout,a,b);
endmodule
