//-----------------------------------------------------------------------------
//
// Title       : twobit_multiplier
// Design      : MAC Unit
// Author      : Einar
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\Einar\OneDrive\Dokumenter\ELSYS\5. Semester\DIK\Project\Verilog_Implementasjon\MAC Unit\src\twobit_multiplier.v
// Generated   : Wed Oct 25 08:25:18 2023
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
//{module {twobit_multiplier}}
module twobit_multiplier ( A ,B ,O );

input [1:0] A ;
wire [1:0] A ;
input [1:0] B ;
wire [1:0] B ;
output [3:0] O ;
wire [3:0] O ;

wire C, D, E;

and(C,A[1],B[1]);
and(D,A[1],B[0]);
and(E,A[0],B[1]);
and(O[0],A[0],B[0]);
and(O[3],D,E);
xor(O[2],C,O[3]);
xor(O[1],D,E);

endmodule
