//-----------------------------------------------------------------------------
//
// Title       : eightbit_register
// Design      : MAC Unit
// Author      : kristgg
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\krisg\OneDrive - NTNU\2023 Høst\Design av integrete kretser\Prosjekt\Verilog\Verilog_Implementasjon\MAC Unit\src\eightbit_register.v
// Generated   : Mon Oct 23 15:23:06 2023
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
//{module {eightbit_register}} 
	
`include "onebit_register.v"
module eightbit_register ( input s_eight , input r_eight ,input clk_eight, input [7:0] d_eight ,output [7:0] q_eight );
	
	onebit_register onebit_instance0 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[0]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[0])
	); 
	onebit_register onebit_instance1 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[1]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[1])
	);
	onebit_register onebit_instance2 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[2]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[2])
	);		   
	onebit_register onebit_instance3 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[3]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[3])
	);
	onebit_register onebit_instance4 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[4]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[4])
	);
	onebit_register onebit_instance5 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[5]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[5])
	);
	onebit_register onebit_instance6 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[6]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[6])
	);
	onebit_register onebit_instance7 (
	    .S(s_eight),
	    .R(r_eight),
		.CLK(clk_eight),
	    .D(d_eight[7]), // Connect the corresponding bit of d_eight to onebit_register
	    .Q(q_eight[7])
	);

endmodule


