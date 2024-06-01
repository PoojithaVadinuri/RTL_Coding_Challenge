module tb;

bit [3:0] [7:0] data;

initial
        begin

        data = 32'h abcd_face;

        for (int i=0; i < $size(data) ; i++)
        begin
                $display("data[%0d] = %b (0x%0h)",i,data[i],data[i]);
        end
        end
        endmodule
        
        
