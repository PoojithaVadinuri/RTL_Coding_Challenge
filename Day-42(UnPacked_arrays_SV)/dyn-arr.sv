module tb;

int arr[];
int cpy[];

initial begin
        //Allocate 6 memory locations and inititalize with values

        arr = new[6];
        arr = '{ 34,5,6,8,21,32};

        $display("arr.size()=%0d",arr.size());
        $display("arr = %0p", arr);

        arr = new[7](arr);
        arr[arr.size()-1]= 10;
        $display("**************************************");
        $display("After changing size of array");
        $display("arr.size()=%0d",arr.size());
        $display("arr = %0p", arr);

        cpy = arr;
       $display("*****************************************");
        $display("After copying arr to cpy"     );
        $display("cpy=%0p",cpy);


        //decreasing size of cpy and copying the existing elements
        cpy = new[cpy.size()-2] (cpy);

        //Display contents of new cpy
        $display("*****************************************");
        $display("dsplaying contents of new cpy");
        $display("NEw cpy = %p", cpy);

        //Display both arraysizes
        $display("*****************************************");
        $display("both array sizes are");
        $display("arr.size() = %0d, cpy.size()=%0d",arr.size(),cpy.size());

        //to empty the array we use delete
        cpy.delete();
        $display("***********************************");
        $display("after deleting entire cpy");
        $display("Size of cpy=%0d",cpy.size());

        end
endmodule

~                                        