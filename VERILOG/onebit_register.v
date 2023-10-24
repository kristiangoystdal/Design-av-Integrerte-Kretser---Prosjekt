//-----------------------------------------------------------------------------
//
// Title       : \\1bit_register
// Design      : MAC Unit
// Author      : kristgg
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\krisg\OneDrive - NTNU\2023 Høst\Design av integrete kretser\Prosjekt\Verilog\Verilog_Implementasjon\MAC Unit\src\1bit_register.v
// Generated   : Mon Oct 23 14:31:54 2023
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {1bit_register}}
`include "Reg_mux.v"
`include "D_Flip_Flop.v"

module onebit_register (input D, input S, input R, input CLK, output Q);

  wire D_O_mux; // Output from the multiplexer 

  Reg_mux mux_instance (
    .S_mux(S),
    .R_mux(R),
    .D_I_mux(D), 
    .Q_mux(Q), // Connect the Q output of the flip-flop to the input of the multiplexer  
    .D_O_mux(D_O_mux)
  );

  D_Flip_Flop flip_flop_instance (
    .D_flip(D_O_mux), // Connect the input of the flip-flop to the multiplexer's output
    .Q_flip(Q),
    .clk_flip(CLK)
  );  
  
  not(D, Q);

endmodule
