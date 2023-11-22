`timescale 1 ns / 1 ps
`include "Mealy_FSM.v"

module Testbench;

    reg CLK;
    reg [1:0] I;
    wire [1:0] O;

    always #5 CLK = ~CLK;

    Mealy_FSM uut(
        .RunIN(I[0]), 
        .ResetIN(I[1]), 
        .CLK(CLK), 
        .RunOUT(O[0]), 
        .ResetOUT(O[1]));

    initial begin

        $dumpfile("TB_dumpfile.vcd");
        $dumpvars(0, Testbench);

        CLK = 0;
        I = 3;
        #10;
        I = 1;
        #50;
        for(integer temp = 0 ; temp < 5 ; temp++)begin
            I = $random % 4;
            #40;
        end
        $finish;
    end

endmodule