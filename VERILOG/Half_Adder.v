//-----------------------------------------------------------------------------
//
// Title       : Half_Adder
// Design      : MAC Unit
// Author      : kristgg
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\krisg\OneDrive - NTNU\2023 Høst\Design av integrete kretser\Prosjekt\Verilog\Verilog_Implementasjon\MAC Unit\src\Half_Adder.v
// Generated   : Mon Oct 23 16:08:12 2023
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
//{module {Half_Adder}}
module Half_Adder ( A_0 ,B_0 ,S_0 ,C_0 );

input A_0 ;
wire A_0 ;
input B_0 ;
wire B_0 ;
output S_0 ;
wire S_0 ;
output C_0 ;
wire C_0 ;
//}} End of automatically maintained section

and(C_0, A_0, B_0);
xor(S_0, A_0, B_0);

endmodule


