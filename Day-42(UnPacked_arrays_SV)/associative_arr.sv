// Code your testbench here
// or browse Examples
typedef int id []; //typedef that creates dynamic array


module tb;

int arr1 [int]; //an integer array with integer index

int arr2 [string];

string arr3[string];

string f;
  string f1;
  string k= "MAY";
  string k1= "Mar";
int flowers [] [string]; ///Dynamic array of associative arrays


id fruits [string];
initial begin
        arr1 = '{ 3:32,  4:21};

        arr2 = '{"jan": 01 , "Feb": 02, "Mar": 03, "Apr": 04, "May":05 };

        arr3 = '{"month" : "dec" , "Week" : "sun"};

        $display("printing arr1       arr2      arr3");
        $display("arr1=%0p",arr1);
        $display("arr2=%0p",arr2);
        $display("arr3=%0p",arr3);

        $display("******************************************");

        //considering arr2 further

        //size(): print the number of items in given dynamic array

        $display("arr2.size()=%0d",arr2.size());

        //num() : Another function to print number of items in a given array

        $display("arr2.num()=%0d",arr2.num());

        //exists(): Check if a particular key exists in this dynamic array
        $display("exists(): Check if a particular key exists in this dynamic array");

        if(arr2.exists("Feb"))
                $display("FOund Feb",arr2["Feb"]);
        if(!arr2.exists("Monday"))
                $display("Sorry, Monday is not a month, its a day in a week");


        begin
        //first(): Get the first element in the array
        $display("first(): Get the first element in the arr2");

//      string f;

        if(arr2.first(f))
                $display("first element in array is arr2.first [%0s] = %0d",f,arr2[f]);
        end

         begin
        //last(): Get the last element in the array
        $display("last(): Get the last element in the arr2");


           if(arr2.last(f1))
             $display("last element in array is arr2.last [%0s] = %0d",f1,arr2[f1]);
        end

         begin
        //prev(): Get the first element in the array
        $display("prev(): Get the first element in the arr2");

           if(arr2.prev(k))
             $display("prev  element in array is arr2.prev [%0s] = %0d",k,arr2[k]);
        end

         begin
        //next(): Get the first element in the array
        $display("next(): Get the first element in the arr2");

      //  string f="Mar";

        if(arr2.next(f))
                $display("next element in array is arr2.next [%0s] = %0d",f,arr2[f]);
        end



        $display("******************************************************************************************");
        $display("DYnamic array of Associative arrays");

        //Creating associative array with key of type string

        flowers = new[2];

        //initialize the assosciative array inside each dynamic array index

        flowers [0] ='{"rose":1, "Jasmine":2};
        flowers [1] = '{"lily ":3, "sunflower":4};

        foreach (flowers[i])
                                                                                                                                                                                   
$display("**************************************************************************************************");

        fruits ["apple"] = new[2];
        fruits ["apple"] = '{4,9};

        foreach (fruits[str])
                foreach(fruits[str][i])
                        $display("fruits[%0s][%0d]=%0d", str,i,fruits[str][i]);
        end

endmodule

