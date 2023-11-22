# Design of Integrated Circuits Project

This repository contains the project files for the Integrated Circuit course at NTNU Trondheim. The Overleaf Files for the report, as well as the AIMSpice and Verilog code for the circuits, can be found here. Both AIMSpice and Verilog code should be able to run at its current location using the correct programs.

## Project Description

### TFE4152 Design of Integrated Circuits

Welcome to the TFE4152 Design of Integrated Circuits project for Autumn 2023 at NTNU, Department of Electronic Systems. In this project, you will be designing a Multiply-Accumulate (MAC) unit. This readme provides an overview of the project specifications, requirements, and instructions.

### Group Formation

This project is to be performed in groups of two. Before signing up for a group on Blackboard, please find a partner to work with. Utilize the "Looking for a project partner" forum on Blackboard to find a suitable teammate.

### Multiply-Accumulate (MAC) Unit

The primary goal of this project is to design a MAC unit that performs the multiply-accumulate operation, as described by Equation 1:

C ← C + (A ⋅ B)

#### Motivation and Background

The MAC operation is fundamental in various applications, including artificial intelligence (AI) and signal processing. Given the increasing relevance of AI, designing a reliable MAC unit is essential.

#### Specifications

- Technology: gpdk 90nm
- Circuit Parts: MAC unit and Finite State Machine (FSM)
- FSM Inputs: Reset, Clk, Run
- FSM State Update: Only at the positive edge of Clk
- FSM Behavior (Table 1):
  - Reset: Reset the accumulated value register.
  - 0, 0: Do not update the accumulated value.
  - 0, 1: Update the accumulated value.
- Binary Numbers: Unsigned, 2-bit inputs A[1:0] and B[1:0]
- Register: 8-bit, updated at each positive edge of Clk
- Output: Accumulated value Y[7:0]

#### Additional Specifications

- Gate lengths <= 300 nm
- Gate widths <= 1500 nm
- Supply voltage <= 1.0 V
- Fan-in of logic gate <= 4

#### FSM Update (2.2.1)

The multiply-accumulate operation should be performed three times in a row, followed by a pause for one clock cycle. This 3+1 pattern should be repeated continuously unless indicated otherwise by FSM inputs.

### Additional Considerations

Consider static (leakage) power consumption when designing the circuit. Aim for a low-power MAC unit, and provide reasoning for design choices in the final report.

### Implementation and Simulation

The implementation and simulation have two parts:

#### Part 1: AIMSpice

- Implement a 1-bit version of the register in AIMSpice.
- Verify functionality for TT, SS, FF, SF, and FS corners at 0, 27, and 70 degrees Celsius.
- Simulate static power consumption for the 1-bit register for TT and FF corners.

#### Part 2: Using Verilog in ActiveHDL

- Implement the entire system, including FSM and MAC unit, using Verilog in ActiveHDL.
- Create modules for different parts of the circuit for individual testing.
- Simulate the entire system and include FSM simulation results in the final report.
- Use logic gates level coding, except for the testbenches.

## Instructions for GitHub

- Clone this repository to get started with the project.
- Ensure you have the necessary tools (AIMSpice, ActiveHDL) for simulation.
- Follow the project guidelines and specifications in the provided documentation.
- Document your design choices, considerations, and simulation results in the final report.
- Use clear and concise comments in your Verilog code.
- Keep everything at the logic gates level, except for the testbenches.

Best of luck with your project!
