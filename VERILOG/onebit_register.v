`include "../Mealy FSM/Reg_mux.v"
`include "../Mealy FSM/D_Flip_Flop.v"

module onebit_register (input D, input S, input R, input CLK, output Q);

  wire D_O_mux; // Output from the multiplexer 

  Reg_mux mux_instance (
    .S_mux(S),
    .R_mux(R),
    .D_I_mux(D), 
    .Q_mux(Q), // Connect the Q output of the flip-flop to the input of the multiplexer  
    .D_O_mux(D_O_mux)
  );

  D_Flip_Flop flip_flop_instance (
    .D_flip(D_O_mux), // Connect the input of the flip-flop to the multiplexer's output
    .Q_flip(Q),
    .clk_flip(CLK)
  );

endmodule
