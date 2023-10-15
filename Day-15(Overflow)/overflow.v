module top_module (
    input [3:0] a,
    input [3:0] b,
    output [4:0] s,
    output overflow
); 

 wire c_in,s2,c_out;
 wire [2:0] sum;
 assign {c_in,sum} = a[2:0]+b[2:0];
 assign {c_out,s2}= a[3]+b[3]+c_in;
 assign s={c_out,s2,sum};
 assign overflow = c_out ^ c_in;

endmodule