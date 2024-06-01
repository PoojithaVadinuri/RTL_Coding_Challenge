module tb;

bit [2:0] [3:0] [7:0] data;

initial begin
        repeat(2)
        begin
                data = $random;
                $display("data = %0h",data);

                foreach(data[i])
                begin
                        $display("data[%0d]=0x%0h",i,data[i]);
                        foreach(data[i][j])
                        begin
                                $display("data[%0d][%0d] = 0x%0h",i,j,data[i][j]);
                        end
                end

        end
end

endmodule
