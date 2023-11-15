//-----------------------------------------------------------------------------
//
// Title       : \\MAC_Unit
// Design      : MAC Unit
// Author      : Einar
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\Einar\OneDrive\Dokumenter\ELSYS\5. Semester\DIK\Project\Nye Verilogfiler\VERILOG\MAC Unit\src\MAC Unit.v
// Generated   : Wed Oct 25 11:24:31 2023
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
//{module {\\MAC_Unit}}	

`include "FSM.v"
`include "twobit_multiplier.v"
`include "eightbit_adder.v"
`include "eightbit_register.v"
	
module MAC_Unit ( I ,CLK ,A ,B ,Y ,S);

input [1:0] I ;
wire [1:0] I ;
input CLK ;
wire CLK ;
input [1:0] A ;
wire [1:0] A ;
input [1:0] B ;
wire [1:0] B ;
output [7:0] Y ;
wire [7:0] Y ;
//}} End of automatically maintained section	

wire [1:0] CTRL;
wire [3:0] PROD;
wire [7:0] SUM;	  
input S;
wire S;

//Bug-fixing
//wire Temp1[7:0];
//wire [7:0]Temp2;
//and(Temp1, {4'b0000, PROD}, S);
//assign Temp2 = Y & S;


FSM FSM_instance(I,CLK,CTRL,S);			 
twobit_multiplier Multiplier_instance(A,B,PROD);
eightbit_adder Adder_instance({4'b0000, PROD},Y,SUM);
eightbit_register Register_instance(CTRL[0],CTRL[1],CLK,SUM,Y);


endmodule