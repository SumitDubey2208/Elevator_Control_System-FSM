{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 module Lift8_Tb();\
  reg  clk, reset;\
  reg [2:0] req_floor;\
  wire  [1:0] idle, door, Up, Down;\
   wire [2:0] current_floor;\
   wire [2:0] max_request, min_request;\
   wire [7:0] requests;\
   reg  emergency_stop;\
\
  Lift8 dut(\
    .clk(clk),\
    .reset(reset),\
    .req_floor(req_floor),\
    .idle(idle),\
    .door(door),\
    .Up(Up),\
    .Down(Down),\
    .current_floor(current_floor),\
    .max_request(max_request),\
    .min_request(min_request),\
    .requests(requests),\
    .emergency_stop(emergency_stop)\
  );\
\
  initial begin\
    $dumpfile("waveform.vcd"); // Specify the VCD waveform output file\
    $dumpvars(0, Lift8_Tb);    // Dump all variables in the module hierarchy\
\
    clk = 1'b0;\
    emergency_stop = 0;\
    reset = 1;\
    #10;\
    reset = 0;\
    req_floor = 1;\
    #30;\
    req_floor = 4;\
    \
    #10\
    \
    // Simulate elevator operation\
    req_floor = 3; // Request floor 3\
    #20;\
    req_floor = 7; // Request floor 5\
    #20;\
    emergency_stop = 1; // Activate emergency stop\
    #20;\
    emergency_stop = 0; // Deactivate emergency stop\
    #10;\
    req_floor = 2; // Request floor 2\
    #40;\
    req_floor = 6; // Request floor 6\
    #20;\
    \
    #20;\
    req_floor = 1;\
  end\
\
  initial begin\
  $display("Starting simulation...");\
    $monitor("Time=%t,clk=%b,reset=%b,req_floor=%h,idle=%h,door=%h,Up=%h,Down=%h,current_floor=%h,max_request=%h,min_request=%h,requests=%h",\
    $time, clk, reset, req_floor, idle, door, Up, Down, current_floor, max_request, min_request, requests);\
  // Run the simulation for a sufficient duration\
  #305; // Adjust the simulation time as needed\
  $display("Simulation finished.");\
  $finish;\
end\
\
// C\
  always #5 clk = ~clk;\
endmodule}