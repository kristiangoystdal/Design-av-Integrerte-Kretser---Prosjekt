`include "Full_Adder.v"

module full_adder_tb;

    reg a, b, ci;
    wire sum;
    wire co;

    Full_Adder full_adder1 (ci, sum, a, co, b);

    integer errors;

    initial begin
        // Create a dump file for viewing simulation results
        $dumpfile("fulladder.vcd");
        $dumpvars(0, full_adder_tb);
        
        $display("Checking for errors...");
        errors = 0;

        for (a = 0; a < 2; a = a + 1) begin
            $display(a);
        end

        $display("Done");

        // Simulate all possible 1-bit full adder combinations
        // for (a = 0; a < 2; a = a + 1) begin
        //     for (b = 0; b < 2; b = b + 1) begin
        //         for (ci = 0; ci < 2; ci = ci + 1) begin
        //             #1 // Wait for 1 time unit
        //             if (sum != (a ^ b ^ ci)) begin
        //                 $display("Error: a = %d, b = %d, ci = %d, sum = %d, co = %d", a, b, ci, sum, co);
        //                 errors = errors + 1;
        //             end
        //         end
        //     end
            
        // end

        // Finish the simulation after testing all combinations
        $finish;
    end
endmodule
