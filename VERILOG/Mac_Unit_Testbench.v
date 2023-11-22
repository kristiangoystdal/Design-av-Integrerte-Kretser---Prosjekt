`timescale 1 ns / 1 ps

`include "MAC_Unit.v"

module Mac_Unit_Testbench ();
   
 // Define the constants									 						   
  parameter CLK_PERIOD = 10; // Define clock period in ns

  // Declare signals
  reg [2:0] Ta, Tb;
  reg [1:0] I;
  reg CLK, S;
  reg [1:0] A;
  reg [1:0] B;
  wire [7:0] Y;

  // Instantiate the MAC_Unit module
  MAC_Unit uut (
    .I(I),
    .CLK(CLK),
    .A(A),
    .B(B),
    .Y(Y),
	.S(S)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) CLK = ~CLK;

  // Test scenario					
  initial begin			
	    $dumpfile("MAC_Unit_sim.vcd");
        $dumpvars(0, Mac_Unit_Testbench);
	   	$display("Hello");
	  
    // Initialize signals
    I = 2'b10;
    A = 2'b00;
    B = 2'b00;
    CLK = 0;   
	  S = 1'b0;
    Ta = 3'b000;
    Tb = 3'b000;

    #10; // Wait a few time units for signals to stabilize	  
	
	  S = 1'b1;

    #10;

	  I = 2'b01;
	
    #10;	 
    
	for(Ta=0; Ta < 4 ; Ta = Ta + 1) begin
    A = Ta;
		for(Tb=0; Tb < 4 ; Tb = Tb + 1) begin
      B = Tb;
			$display("A = %b", A, " | B = %b", B, " | Y = %b",Y);
      #(CLK_PERIOD);
		end
	end

  A = 2'b01;
  B = 2'b01;

  #500;
	
  $display("Y = %d",Y);
	
  $finish;
  end
		
endmodule
