module mul_2_by_2_v (
  input [1:0] i_A,
  input [1:0] i_B,
  output [3:0] o_Y
  );

  // o_Y = i_A * i_B
  and(o_Y[0], i_A[0], i_B[0]);

  wire [3:0] w_temp;
  and(w_temp[0], i_A[1], i_B[0]);
  and(w_temp[1], i_A[0], i_B[1]);
  and(w_temp[2], i_A[1], i_B[1]);

  half_adder_v half_adder_v_1(
    .i_A(w_temp[0]),
    .i_B(w_temp[1]),
    .o_S(o_Y[1]),
    .o_C(w_temp[3])
    );

  half_adder_v half_adder_v_2(
    .i_A(w_temp[2]),
    .i_B(w_temp[3]),
    .o_S(o_Y[2]),
    .o_C(o_Y[3])
    );



endmodule // mul_2_by_2_v
