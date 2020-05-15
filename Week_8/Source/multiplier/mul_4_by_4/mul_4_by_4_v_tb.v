module mul_4_by_4_v_tb ();

  reg [3:0] r_A;
  reg [3:0] r_B;
  wire [7:0] w_Y;
  initial begin
    r_A <= 4'b1111;
    r_B <= 4'b1011;
  end
  mul_4_by_4_v mul_4_by_4_v (
    .i_A(r_A),
    .i_B(r_B),
    .o_Y(w_Y)
    );


endmodule // mul_2_by_2_v
