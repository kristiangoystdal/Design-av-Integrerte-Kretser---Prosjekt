//-----------------------------------------------------------------------------
//
// Title       : Full_Adder
// Design      : MAC Unit
// Author      : kristgg
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\krisg\OneDrive - NTNU\2023 Høst\Design av integrete kretser\Prosjekt\Verilog\Verilog_Implementasjon\MAC Unit\src\Full_Adder.v
// Generated   : Mon Oct 23 16:15:36 2023
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
//{module {Full_Adder}}
module Full_Adder ( C_I ,S_O ,A_I ,C_O ,B_I );

input C_I ;
wire C_I ;
output S_O ;
wire S_O ;
input A_I ;
wire A_I ;
output C_O ;
wire C_O ;
input B_I ;
wire B_I ;
//}} End of automatically maintained section

wire w1,w2,w3;
xor(w1, A_I, B_I);
and(w2, A_I, B_I); 
and(w3, w1, C_I);
xor(S_O, w1, C_I);
or(C_O, w2, w3); 

endmodule
