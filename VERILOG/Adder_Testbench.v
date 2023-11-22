`timescale 1 ns / 1 ps
`include "eightbit_adder.v"

module Adder_Testbench();
    reg [7:0] A, B;
    wire [7:0] S;
    integer errors;
    integer Acount, Bcount;

    eightbit_adder adder_instance(.A(A), .B(B), .S(S));

    initial begin
        $dumpfile("Adder_Testbench.vcd");
        $dumpvars(0, Adder_Testbench);
        errors = 0;
        for(Acount = 0 ; Acount < 256 ; Acount++) begin
            for(Bcount = 0 ; Bcount < 256 ; Bcount++) begin
                A = Acount;
                B = Bcount;
                #1;
                if((A+B) == S) begin
                    $display(A,"+",B,"=",S);
                end else begin
                    $display("Error: ", A, "+", B, "=",S);
                    errors++;
                end
            end
        end
        if(errors==0)begin
            $display("Congratulations! No errors found.");
        end else begin
            $display("WARNING! ",errors," errors found. Reevaluate circuit.");
        end
        $finish;
    end
endmodule