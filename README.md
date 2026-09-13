# Single-Cycle RISC-V Processor

A 32-bit single-cycle RISC-V processor implemented in Verilog based on the RV32I instruction set architecture.

## Overview

This project implements a basic single-cycle RISC-V processor with a complete datapath and control path. The design includes the processor's ALU, register file, instruction memory, data memory, control unit, immediate generation, and program counter logic.

## Components

- Program Counter (PC)
- Instruction Memory
- Register File
- ALU
- Main Decoder
- ALU Decoder
- Sign Extension Unit
- Data Memory
- PC Adder
- Control Unit

## Supported Operations

The processor is designed to support RISC-V instructions including:

- Arithmetic and logical operations
- Immediate operations
- Load and store operations
- Branch instructions

## Tools Used

- Verilog
- Xilinx Vivado


## Testbench

A Verilog testbench (`single_cycle_top_tb.v`) is included for testing the processor design.


## Project Structure

```text
├── P_C.v
├── instr_mem.v
├── Reg_file.v
├── ALU.v
├── Sign_extend.v
├── Control_Unit_Top.v
├── data_mem.v
├── PC_adder.v
├── main_decoder.v
├── ALU_Decoder.v
├── single_cycle.v
└── single_cycle_top_tb.v
