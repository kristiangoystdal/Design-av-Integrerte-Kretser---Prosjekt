module Reg_mux (
    input S_mux,
    input R_mux,
    input D_I_mux,
    input Q_mux,
    output D_O_mux
);

wire Y_mux, sbar, rbar;	
not(sbar,S_mux);
not(rbar,R_mux); 

cmos(Y_mux,D_I_mux, S_mux, sbar);
cmos(Y_mux,Q_mux,sbar,S_mux);
and(D_O_mux, rbar, Y_mux);

endmodule  