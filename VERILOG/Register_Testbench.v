`timescale 1 ns / 1 ps
`include "eightbit_register.v"

module Register_Testbench();
    parameter CLK_PERIOD = 10;
    reg s_eight,r_eight,clk_eight;
    reg [7:0] d_eight;
    wire [7:0] q_eight;
    integer errors;
    integer temp;

    eightbit_register register_instance(
        .s_eight(s_eight), 
        .r_eight(r_eight),
        .clk_eight(clk_eight),
        .d_eight(d_eight),
        .q_eight(q_eight)
    );

    always #((CLK_PERIOD / 2)) clk_eight = ~clk_eight;

    initial begin
        $dumpfile("Register_Testbench.vcd");
        $dumpvars(0, Register_Testbench);
        errors = 0;
        clk_eight = 0;

        //Setting a value in the register and checking output
        s_eight = 1;
        r_eight = 0;
        d_eight = 123;
        #CLK_PERIOD;

        //Testing controlsignals 00 for all inputs d
        s_eight = 0;
        r_eight = 0;
        for(temp = 0 ; temp < 256 ; temp++) begin
            d_eight = temp;
            #CLK_PERIOD;
            if(q_eight != 123) begin
                $display("Error: Value overwritten when S=0");
                errors++;
            end
        end

        //Testing controllsignals 01 and 11 for all inputs d
        s_eight = 0;
        r_eight = 1;
        for(temp = 0 ; temp < 256 ; temp++) begin
            d_eight = temp;
            #CLK_PERIOD;
            if(q_eight != 0) begin
                $display("Error: Output not zero when R=1");
                errors++;
            end
        end

        s_eight = 1;
        r_eight = 1;
        for(temp = 0 ; temp < 256 ; temp++) begin
            d_eight = temp;
            #CLK_PERIOD;
            if(q_eight != 0) begin
                $display("Error: Output not zero when R=1");
                errors++;
            end
        end

        //Testing all inputs d with control signals 10
        s_eight = 1;
        r_eight = 0;
        for(temp = 0 ; temp < 256 ; temp++) begin
            d_eight = temp;
            #CLK_PERIOD;
            if(q_eight != d_eight) begin
                $display("Error: Value not set when S=1");
                errors++;
            end
        end
        if(errors==0) begin
            $display("Congratulations! No errors found.");
        end else begin
            $display("WARNING! ",errors, " errors found. Reevaluate circuit.");
        end
        $finish;
    end
endmodule