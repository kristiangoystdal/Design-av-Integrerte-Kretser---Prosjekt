`timescale 1 ns / 1 ps
`include "FSM.v"

module FSM_Testbench();
    parameter CLK_PERIOD = 10;

    reg [1:0] I;
    reg CLK, S;
    wire [1:0] O;

    FSM FSM_Instance(.I(I), .CLK(CLK), .O(O), .S(S));
    always #((CLK_PERIOD / 2)) CLK = ~CLK;
    initial begin
        $dumpfile("FSM_Testbench.vcd");
        $dumpvars(0, FSM_Testbench);
        CLK = 0;
        I = 2'b00;
        S = 0;
        #5 S = 1;

        // Testing Run and Pause states: 
        // #5 I = 2'b01;
        // #50 I = 2'b00;
        // #20 I = 2'b01;
        // #50 I = 2'b00;
        // #20 I = 2'b01;
        // #50 I = 2'b00;
        // #20

        // Testing Reset state:
        #5 I = 2'b10;
        #10 I = 2'b00;
        #10 I = 2'b11;
        #10 I = 2'b01;
        #10 I = 2'b10;
        #10 I = 2'b01;
        #20 I = 2'b10;
        #10 I = 2'b01;
        #30 I = 2'b10;
        #20



        $finish;
    end


endmodule