//-----------------------------------------------------------------------------
//
// Title       : Reg_mux
// Design      : MAC Unit
// Author      : kristgg
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\krisg\OneDrive - NTNU\2023 H�st\Design av integrete kretser\Prosjekt\Verilog\Verilog_Implementasjon\MAC Unit\src\Reg_mux.v
// Generated   : Mon Oct 23 13:11:06 2023
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
//{module {Reg_mux}}
module Reg_mux (
    input S_mux,
    input R_mux,
    input D_I_mux,
    input Q_mux,
    output D_O_mux
);			  
wire Y_mux, sbar, rbar;	
not(sbar,S_mux);
not(rbar,R_mux); 

cmos(Y_mux,D_I_mux, S_mux, sbar);
cmos(Y_mux,Q_mux,sbar,S_mux);
and(D_O_mux, rbar, Y_mux);

endmodule  
