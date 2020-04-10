module sr_latch_tb ();
  reg clk;
  reg [1:0] r_counter;

  initial begin
    r_counter <= 2'b01;
    clk <= 1'b0;
  end

  always begin
    #10 clk <= ~clk;
  end

  always @ ( posedge clk ) begin
    if(r_counter == 2'b11) r_counter <= 2'b01;
    else r_counter <= r_counter + 1'b1;
  end
  wire w_S;
  wire w_R;
  assign w_S = r_counter[1];
  assign w_R = r_counter[0];
  wire w_Q;
  wire w_Qn;
  always @ ( w_Q, w_Qn ) begin
    $monitor("%b","%b", w_Q, w_Qn);
  end
  sr_latch sr_latch(
    .i_S(w_S),
    .i_R(w_R),
    .o_Q(w_Q),
    .o_Qn(w_Qn)
    );

endmodule //seg_decoder_tb
