module D_Flip_Flop ( input D_flip , output Q_flip , input clk_flip );
	
	wire clk_bar_flip; 
	not(clk_bar_flip, clk_flip);
	not(w1_flip, D_flip);	  
	wire w2_flip;
	cmos(w2_flip, w1_flip, clk_bar_flip, clk_flip);	
	wire w3_flip;
	not(w3_flip, w2_flip); 
	wire w4_flip;
	not(w4_flip, w3_flip);
	cmos(w2_flip, w4_flip, clk_flip, clk_bar_flip);	 
	wire w5_flip;
	cmos(w5_flip, w3_flip, clk_flip, clk_bar_flip);
	wire w6_flip, w7_flip;
	not(w6_flip, w5_flip);
	not(w7_flip, w6_flip);
	cmos(w5_flip, w7_flip, clk_bar_flip, clk_flip);	 
	not(Q_flip, w6_flip);

endmodule