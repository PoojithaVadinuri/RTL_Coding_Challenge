module tb;
        bit [7:0] data;

        initial begin
                //assign a value as example
                data = 8'hBC; // 8'hBC = 8'b 1011_1100

                for (int i=0; i < $size(data); i++)
                        begin
                        $display("data[%0d] = %0b", i, data[i]);
                        end
        end
endmodule
~                                                                               
~                                                                               
~                        