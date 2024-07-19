//sa ,da,len,crc,payload
//Section P.1 Define enum (control knob) to identify transaction type
typedef enum {IDLE,RESET,STIMULUS} pkt_type_t;

class packet ;
rand bit [7:0] sa;
rand bit [7:0] da;
bit [31:0] len;
bit [31:0] crc;
rand bit [7:0] payload[];

bit [7:0] inp_stream[$];
bit [7:0] outp_stream[$];

//Section P.2: Define kind variable of type enum pkt_type_t.
pkt_type_t kind;

//Section P.3: Define reset_cycles variable.

bit [7:0] reset_cycles;

constraint valid {
sa inside {[1:8]};
da inside {[1:8]};
payload.size() inside {[10:100]};
foreach(payload[i]) payload[i] inside {[0:255]};
}

function void post_randomize();
len=payload.size() + 1+1+4+4; 
crc=payload.sum();
this.pack(inp_stream);
endfunction

function void pack(ref bit [7:0] q_inp[$]);
  $display("Packing strated");
  q_inp = {<< 8 {this.payload,this.crc,this.len,this.da,this.sa } };
endfunction

function void unpack(ref bit [7:0] q_inp[$]); 
  {<< 8 {this.payload,this.crc,this.len,this.da,this.sa } } = q_inp;
endfunction

function void copy(packet rhs);
if(rhs==null) begin
$display("[Error] NULL handle passed to copy method");
$finish;
end
this.sa=rhs.sa;
this.da=rhs.da;
this.len=rhs.len;
this.crc=rhs.crc;
this.payload=rhs.payload;
//Section P.4: Copy the packed strema , this we use it in driver to drive transaction
this.inp_stream=rhs.inp_stream;
endfunction

function bit compare(input packet dut_pkt);
bit status;
status =1;
foreach(dut_pkt.inp_stream[i]) begin
    status = status && (this.inp_stream[i] == dut_pkt.outp_stream[i]);
end
return status;
endfunction

function void print();
$write("[Packet Print] Sa=%0d Da=%0d Len=%0d Crc=%0d",sa,da,len,crc);
$write(" Payload:");
foreach(payload[k])
  $write(" %0h",payload[k]);

$display("\n");
endfunction

endclass