`timescale 1 ns / 1 ps
`include "twobit_multiplier.v"

module Multiplier_Testbench();
    reg [1:0] A, B;
    wire [3:0] O;
    integer errors;
    integer Acount, Bcount;

    twobit_multiplier mul_instance (.A(A), .B(B), .O(O));
    initial begin
        $dumpfile("Multiplier_Testbench.vcd");
        $dumpvars(0, Multiplier_Testbench);
        errors = 0;

        for(Acount = 0 ; Acount < 4 ; Acount++) begin
            for(Bcount = 0 ; Bcount < 4 ; Bcount++) begin
                A = Acount;
                B = Bcount;
                #1;
                if((A*B) != O) begin
                    $display("Error: ",A,"*",B,"=",O);
                    errors++;
                end else begin
                    $display(A,"*",B,"=",O);
                end
            end
        end
        if(errors==0)begin
            $display("No errors found");
        end else begin
            $display(errors," errors found. Reevaluate design.");
        end
        $finish;
    end

endmodule