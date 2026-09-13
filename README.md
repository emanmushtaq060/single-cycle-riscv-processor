# single-cycle-riscv-processor
32-bit single-cycle RISC-V processor implemented in Verilog with a complete datapath, control unit, memory, and testbench.
# Single-Cycle RISC-V Processor

A 32-bit single-cycle RISC-V processor implemented in Verilog.

## Overview

This project implements a basic single-cycle RISC-V processor based on the
RV32I instruction set architecture. The processor includes the main datapath,
control unit, ALU, register file, instruction memory, and data memory.

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

The processor is designed to execute RISC-V instructions including:

- Arithmetic and logical operations
- Immediate operations
- Load and store operations
- Branch instructions

## Tools Used

- Verilog
- QuestaSim
- Vivado

## Simulation

The processor will be simulated using a Verilog testbench in QuestaSim.
Simulation waveforms will be used to observe the processor's operation and
verify the implemented instructions.

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
