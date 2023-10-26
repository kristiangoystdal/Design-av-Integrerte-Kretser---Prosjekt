//-----------------------------------------------------------------------------
//
// Title       : FSM
// Design      : MAC Unit
// Author      : Einar
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\Einar\Downloads\Verilog_Implementasjon\Verilog_Implementasjon\MAC Unit\src\FSM.v
// Generated   : Mon Oct 23 15:28:39 2023
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
//{module {FSM}}								
`include "D_Flip_Flop.v"

module FSM ( I ,CLK ,O ,S);

//Initiate inputs/outputs

input [1:0] I ;
wire [1:0] I ;
input CLK ;
wire CLK ;
output [1:0] O ;
wire [1:0] O ;	 
input S;


//Initiate all internal wires

wire C[2:0];		//Current state		   
wire N[2:0];		//Next state   

wire C2not;
wire C1not;
wire C0not;
wire I1not;
wire I0not;
wire C0orC1;   
wire C1xorC0;
wire A;
wire B;
wire T;
wire D;
wire E;
wire F;
wire G;
wire H;
wire J;
wire K;	
wire S;	   //Set bit for testing
wire X;
wire Y;
wire Z;

	//Initiate the 3-bit register

	D_Flip_Flop flip_flop_instance_0 (
	.D_flip(N[0]),
	.Q_flip(C[0]),
	.clk_flip(CLK)
	);	  
	
	D_Flip_Flop flip_flop_instance_1 (
	.D_flip(N[1]),
	.Q_flip(C[1]),
	.clk_flip(CLK)
	);	
	
	D_Flip_Flop flip_flop_instance_2 (
	.D_flip(N[2]),
	.Q_flip(C[2]),
	.clk_flip(CLK)
	);	
	
	//Initiate the output logic
	
	and(O[1],C[1],C[2]);
	and(O[0],C0orC1,C2not);
	or(C0orC1, C[0], C[1]);
	
	
	//Initiate the Next state logic
	
	//NOT-gates
	not(C2not, C[2]);
	not(C1not, C[1]);
	not(C0not, C[0]);
	not(I1not, I[1]);
	not(I0not, I[0]);
	
	//other gates

	and(N[2], X, S);	//To initiate the register for this simulation we make the next state N[2:0]=000 if S=0
	
	or(X, I[1], A, B);
	and(A, C[2], C1not, I0not);
	and(B, I0not, C2not, C1xorC0);
	xor(C1xorC0, C[1], C[0]);

	and(N[1], Y, S);	
	
	or(Y, I[1], T, D);
	and(T, C[2], C1not, I[0]);
	and(D, I[0], C2not, C1xorC0);
	
	and(N[0], Z, S);
	
	or(Z, K, J);	 
	or(K, G, H);
	or(J, E, F);	
	and(E, C2not, C0not, I1not, I[0]);
	and(F, C[2], C1not, C[0], I1not);
	and(G, C[1], C0not, I1not, I[0]);
	and(H, C2not, C[1], C0not, I1not);

endmodule