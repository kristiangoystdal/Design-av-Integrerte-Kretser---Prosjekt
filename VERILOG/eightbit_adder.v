//-----------------------------------------------------------------------------
//
// Title       : eightbit_adder
// Design      : MAC Unit
// Author      : kristgg
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\krisg\OneDrive - NTNU\2023 Høst\Design av integrete kretser\Prosjekt\Verilog\Verilog_Implementasjon\MAC Unit\src\eightbit_adder.v
// Generated   : Mon Oct 23 16:25:52 2023
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {eightbit_adder}}
`include "Half_Adder.v"
`include "Full_Adder.v"

module eightbit_adder (
    input [7:0] A,
    input [7:0] B,
    output [7:0] S
);

wire [7:0] carry;
wire [7:0] carry_out;

Half_Adder ha_instance_0 (
    .A_0(A[0]),
    .B_0(B[0]),
    .S_0(S[0]),
    .C_0(carry[0])
);

Full_Adder FA_1 (
    .A_I(A[1]),
    .B_I(B[1]),
    .C_I(carry[0]),
    .S_O(S[1]),
    .C_O(carry_out[1])
);

Full_Adder FA_2 (
    .A_I(A[2]),
    .B_I(B[2]),
    .C_I(carry_out[1]),
    .S_O(S[2]),
    .C_O(carry_out[2])
);

Full_Adder FA_3 (
    .A_I(A[3]),
    .B_I(B[3]),
    .C_I(carry_out[2]),
    .S_O(S[3]),
    .C_O(carry_out[3])
);

Full_Adder FA_4 (
    .A_I(A[4]),
    .B_I(B[4]),
    .C_I(carry_out[3]),
    .S_O(S[4]),
    .C_O(carry_out[4])
);

Full_Adder FA_5 (
    .A_I(A[5]),
    .B_I(B[5]),
    .C_I(carry_out[4]),
    .S_O(S[5]),
    .C_O(carry_out[5])
);

Full_Adder FA_6 (
    .A_I(A[6]),
    .B_I(B[6]),
    .C_I(carry_out[5]),
    .S_O(S[6]),
    .C_O(carry_out[6])
);

Full_Adder FA_7 (
    .A_I(A[7]),
    .B_I(B[7]),
    .C_I(carry_out[6]),
    .S_O(S[7]),
    .C_O(carry_out[7])
);

endmodule
