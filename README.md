# PWM_Generator_SystemVerilog
Digital PWM generator with double-buffering
## Project Overview
This project implements a fully parameterized Digital Pulse Width Modulation (PWM) generator using SystemVerilog. It is designed with hardware synthesis in mind and features runtime configurability for both frequency and duty cycle.

## Key Features
* Integrated double buffering to ensure that runtime updates to the duty cycle or frequency do not cause glitches or incomplete pulses in the current cycle.
* Written using standard RTL design practices (counters, separated combinational/sequential logic).

## File Structure
* `source/PWM.sv`: The core RTL design.
* `source/PWM_testbench.sv`: SystemVerilog testbench for verification.
* `img/`: Contains simulation waveforms.

## Simulation & Verification
The design was verified using Siemens Questa via EDA Playground. 

**Test Scenario:** 
1. Fixed 50MHz clock, Frequency Divider = 5, Duty Cycle = 75% (191/255).
2. Fixed 50MHz clock, Frequency Divider = 10, Duty Cycle = 25% (64/255).
3. Fixed 50MHz clock, Frequency Divider = 1000, Duty Cycle = 50% (127/255).
## How to Run
You can simulate this project directly on EDA Playground without installing local EDA tools.
1. Copy the code from `source`.
2. Paste into a new EDA Playground project.
3. Select an appropriate simulator (Siemens Questa,...) and run to view waveform.
