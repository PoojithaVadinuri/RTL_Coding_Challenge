
`include "top.sv"
`include "program.sv"
#Day44 of #RTLCodingChallenge (Interfaces in SV)



In Verilog, the communication between blocks is specified using module ports. SystemVerilog adds the interface construct which encapsulates the communication between blocks. 

An interface is a bundle of signals or nets through which a testbench communicates with a design. All related signals are grouped together to form an interface block so that the same interface can be re-used for other projects.



An interface also specifies the,

directional information, i.e modports

timing information, i.e clocking blocks

An interface can have parameters, constants, variables, functions, and tasks.



A small example of how interface block is connected to DUT and Tb is attached below for reference.



Check my Github Repository Link: https://github.com/PoojithaVadinuri/RTL_Coding_Challenge

#SystemVerilog #EDAPlayground #Interfaces #Tasks #functions

﻿