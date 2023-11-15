`timescale 1ns / 1ps

`include "MAC_Unit.v"

module test_MAC_Unit;

  reg [1:0] I;
  reg CLK;
  reg [1:0] A;
  reg [1:0] B;
  wire [7:0] Y;
  reg S;

  // Instantiate the MAC_Unit module
  MAC_Unit dut (
    .I(I),
    .CLK(CLK),
    .A(A),
    .B(B),
    .Y(Y),
    .S(S)
  );

  // Define a file handle
  integer file_handle;

  // Clock generation
  always begin
    #5 CLK = ~CLK; // Assuming a 10ns clock period
  end

  // Test stimulus
  initial begin

    $dumpfile("MAC_unit.vcd");
    $dumpvars(0, test_MAC_Unit);
    I = 2'b00;
    A = 2'b01;
    B = 2'b10;
    S = 0;
    CLK = 0;

    // Open a file for writing
    file_handle = $fopen("results.txt", "w");

    // Apply inputs and wait for some time
    #10 I = 2'b01;
    #10 A = 2'b11;
    #10 B = 2'b01;
    #10 S = 1;

    // Write results to the file
    $fdisplay(file_handle, "I = %b, A = %b, B = %b, Y = %b, S = %b\n", I, A, B, Y, S);

    // Close the file
    $fclose(file_handle);

    // Finish simulation
    $finish;
  end

  // Display outputs
  always @(posedge CLK) begin
    $display("I = %b, A = %b, B = %b, Y = %b, S = %b", I, A, B, Y, S);
  end

endmodule
