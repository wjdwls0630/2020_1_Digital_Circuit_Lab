module rca_12bit_v (
  input [11:0] i_A,
  input [11:0] i_B,
  input i_C,
  output [11:0] o_S,
  output o_C
  );

  wire w_C;
  rca_6bit_v rca_6bit_v_0(
    .i_A(i_A[5:0]),
    .i_B(i_B[5:0]),
    .i_C(i_C),
    .o_S(o_S[5:0]),
    .o_C(w_C)
    );

  rca_6bit_v rca_6bit_v_1(
    .i_A(i_A[11:6]),
    .i_B(i_B[11:6]),
    .i_C(w_C),
    .o_S(o_S[11:6]),
    .o_C(o_C)
    );
endmodule // rca_4bit_v
