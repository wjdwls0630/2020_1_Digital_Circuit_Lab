module mul_2_by_2_v_tb ();

  reg [1:0] r_A;
  reg [1:0] r_B;
  wire [3:0] w_Y;
  initial begin
    r_A <= 2'b11;
    r_B <= 2'b10;
  end
  mul_2_by_2_v mul_2_by_2_v (
    .i_A(r_A),
    .i_B(r_B),
    .o_Y(w_Y)
    );


endmodule // mul_2_by_2_v
