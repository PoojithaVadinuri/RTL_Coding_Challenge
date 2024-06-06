module rtl_memory( input clk,simple_bus dutif);

  logic [31:0] mem [0:15];
  
  always @(posedge clk or posedge dutif.rst)
    begin
      if (dutif.rst)
        begin
          dutif.rdata <= 0;
          mem[dutif.addr] <= 0;
        end
      else
        begin
          if (dutif.wr)
            mem[dutif.addr] <= dutif.wdata;
          else
            begin
              if (dutif.rd)
                dutif.rdata <= mem[dutif.addr];
            end
        end
    end
endmodule
    