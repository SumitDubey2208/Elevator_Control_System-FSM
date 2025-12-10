# Elevator Control System – Easy-to-Read Summary

PROJECT OVERVIEW:

This project implements an Elevator Control System using a Finite State
Machine (FSM) in Verilog.
The design handles multiple elevator requests and ensures safe and
smooth operation.

KEY FEATURES:

-   FSM-based elevator controller
-   Supports multiple user floor requests
-   Ensures safe door opening and closing
-   Handles movement between floors efficiently
-   Fully synthesizable RTL design

DESIGN DETAILS:

-   Written in Verilog HDL
-   States include:
    -   IDLE
    -   MOVING_UP
    -   MOVING_DOWN
    -   DOOR_OPEN
    -   DOOR_CLOSE
    -   WAIT
-   Handles:
    -   Request queue
    -   Movement direction logic
    -   Door safety timing
    -   Floor sensor feedback

DEBUGGING & VALIDATION:

-   Waveform analysis in Vivado Simulator
-   Verified:
    -   Correct state transitions
    -   Door-open safety timing
    -   Response to multiple pending requests

FPGA IMPLEMENTATION:

-   Synthesized using Xilinx Vivado
-   Implemented on Xilinx Spartan-7 FPGA board
-   Optimized resource utilization:
    -   LUTs
    -   Flip-flops
    -   Timing closure

HOW IT WORKS:

1.  User presses a floor button
2.  FSM queues the request
3.  Elevator moves according to current position and request direction
4.  Door opens only when elevator is stable
5.  FSM returns to IDLE when no requests remain

TOOLS USED:

-   Verilog HDL
-   Xilinx Vivado (Simulation + Synthesis + Implementation)
-   FPGA: Xilinx Spartan-7


