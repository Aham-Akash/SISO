# SISO
# Verilog SISO Shift Register
This repository contains the Verilog code for a simple Serial-In, Serial-Out (SISO) shift register and a corresponding testbench to verify its functionality.

## Table of Contents
- [Project Description](#project-description)
- [File Structure](#file-structure)
- [Module: SISO](#module-siso)
- [Testbench: SISO_tb](#testbench-siso_tb)
- [How to Simulate](#how-to-simulate)

## Project Description

A Serial-In, Serial-Out (SISO) shift register is a digital circuit that allows data to be loaded in series, one bit at a time, and read out in the same manner. This implementation is a configurable n-bit shift register written in Verilog. It is a fundamental component in digital logic design, often used for data storage, manipulation, and serial communication.

The core behavior is as follows:

On each clock cycle, one bit of data is shifted into the register.

Simultaneously, the bit at the end of the register is shifted out.

The entire register can be cleared using an asynchronous reset.

## File Structure
The repository contains the following files:

SISO.v: The synthesizable Verilog module for the n-bit SISO shift register.

SISO_tb.v: The testbench used to simulate and verify the SISO.v module.

## Module: SISO
This file defines the SISO module.

Parameters

n: The number of bits in the shift register. It defaults to 4.

Ports

i_clk (Input): The clock signal. The register shifts on the positive edge of this clock.

i_rst (Input): An active-high asynchronous reset. When high, it clears the shift register and the output.

i_serial_in (Input): The serial data input bit.

o_serial_out (Output): The serial data output bit, which is the most significant bit of the register.

Functionality

When i_rst is asserted (high), o_serial_out and the internal register are reset to 0.

On the positive edge of i_clk (when not in reset), the value of i_serial_in is shifted into the least significant bit (LSB) of the register, and all other bits are shifted one position towards the most significant bit (MSB). The original MSB is shifted out through o_serial_out.

## Testbench: SISO_tb
This file (SISO_tb.v) instantiates the SISO module (as DUT - Device Under Test) and provides stimuli to verify its correct operation.

Test Sequence

Reset: The testbench begins by asserting the reset signal to initialize the register.

De-assert Reset: The reset is then de-asserted to allow normal operation.

Data Input: A sequence of serial data bits (1, 0, 1, 0) is fed into the i_serial_in port over several clock cycles.

Simulation End: The simulation runs for a fixed duration and then finishes.

The testbench also generates a clock signal for the DUT.

## How to Simulate
To run the simulation, you will need a Verilog simulator such as ModelSim, Vivado, or an open-source tool like Icarus Verilog.

Compile both SISO.v and SISO_tb.v.

Set SISO_tb as the top-level module for the simulation.

Run the simulation.

You can observe the signals (especially i_serial_in and o_serial_out) in a waveform viewer to confirm that the output data (o_serial_out) matches the input data (i_serial_in) after a delay of n clock cycles.
