module mul_8_by_8_v_tb ();

  reg [7:0] r_A;
  reg [7:0] r_B;
  wire [15:0] w_Y;
  initial begin
    r_A <= 8'b11111111;
    r_B <= 8'b11001101;
  end
  mul_8_by_8_v mul_8_by_8_v (
    .i_A(r_A),
    .i_B(r_B),
    .o_Y(w_Y)
    );


endmodule // mul_2_by_2_v
