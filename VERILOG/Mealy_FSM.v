`include "../Mealy FSM/onebit_register.v"

module Mealy_FSM(
    input RunIN, 
    input ResetIN, 
    input CLK, 
    output RunOUT, 
    output ResetOUT
    );

    //Define wires

    wire RunIN, ResetIN, CLK, RunOUT, ResetOUT, Set, A, B;
    wire [1:0] C, N;

    //The FSM should always take in the next state

    assign Set = 1;

    //Define the registers

    onebit_register Reg0(.D(N[0]), .S(Set), .R(ResetIN), .CLK(CLK), .Q(C[0]));
    onebit_register Reg1(.D(N[1]), .S(Set), .R(ResetIN), .CLK(CLK), .Q(C[1]));

    //Throughput the reset-signal

    assign ResetOUT = ResetIN;

    //Define logic gates and MUX

    xor(N[0], C[0], RunIN);
    and(A, C[0], RunIN);
    xor(N[1], A, C[1]);
    nand(B, C[0], C[1]);
    and(RunOUT, B, RunIN);

endmodule