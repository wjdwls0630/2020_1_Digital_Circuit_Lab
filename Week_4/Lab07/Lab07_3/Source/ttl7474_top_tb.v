module ttl7474_top_tb ();
  reg clk;
  reg r_D;

  initial begin
    r_D <= 1'bx;
    clk <= 1'b0;
    #25 r_D <= 1'b0;
    #20 r_D <= 1'b1;
    #15 r_D <= 1'b0;
    #30 r_D <= 1'b1;
    #20 r_D <= 1'b0;
  end

  always begin
    #10 clk <= ~clk;
  end



  wire w_Q;
  wire w_Qn;

  ttl7474_top ttl7474_top(
    .i_D(r_D),
    .o_Q(w_Q),
    .o_Qn(w_Qn),
    .i_CLK(clk)
    );

endmodule //seg_decoder_tb
