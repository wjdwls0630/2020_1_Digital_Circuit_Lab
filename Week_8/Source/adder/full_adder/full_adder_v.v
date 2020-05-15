module full_adder_v (
  input i_A,
  input i_B,
  input i_C,
  output o_S,
  output o_C
  );

  wire w_S_1;
  wire w_C_1;
  half_adder_v half_adder_v_1(
    .i_A(i_A),
    .i_B(i_B),
    .o_S(w_S_1),
    .o_C(w_C_1)
    );

  wire w_C_2;
  half_adder_v half_adder_v_2(
    .i_A(i_C),
    .i_B(w_S_1),
    .o_S(o_S),
    .o_C(w_C_2)
    );

  or(o_C, w_C_1 ,w_C_2);

endmodule //full_adder_v
