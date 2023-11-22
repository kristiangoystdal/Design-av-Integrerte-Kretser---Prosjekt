module Mux(input A, input B, input S, output Y);

    //Define wires
    wire A, B, S, notS, Y; 

    //Invert the Set-signal

    not(notS, S);

    //Define the transmission gates

    cmos(Y, A, notS, S);
    cmos(Y, B, S, notS);

endmodule