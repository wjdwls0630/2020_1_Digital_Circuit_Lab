module bits4_register_tb ();
  reg clk;
  reg r_D;

  initial begin
    r_D <= 1'b0;
    clk <= 1'b0;
    #40 r_D <= 1'b1;
    #20 r_D <= 1'b0;
	 #20 r_D <= 1'b0;
	 #20 r_D <= 1'b1;
	 #20 r_D <= 1'b1;
	 #20 r_D <= 1'b1;
	 #20 r_D <= 1'b0;
	 #20 r_D <= 1'b0;
	 #20 r_D <= 1'b1;
  end

  always begin
    #10 clk <= ~clk;
  end



  wire [3:0] w_Q;

  bits4_register bits4_register(
    .i_D(r_D),
    .o_Q(w_Q),
    .i_CLK(clk)
    );

endmodule //seg_decoder_tb
