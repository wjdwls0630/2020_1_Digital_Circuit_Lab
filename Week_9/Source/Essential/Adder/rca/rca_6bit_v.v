module rca_6bit_v (
  input [5:0] i_A,
  input [5:0] i_B,
  input i_C,
  output [5:0] o_S,
  output o_C
  );

  wire [1:0] w_C;
  rca_4bit_v rca_4bit_v(
    .i_A(i_A[3:0]),
    .i_B(i_B[3:0]),
    .i_C(i_C),
    .o_S(o_S[3:0]),
    .o_C(w_C[0])
    );

  full_adder_v full_adder_v_0 (
    .i_A(i_A[4]),
    .i_B(i_B[4]),
    .i_C(w_C[0]),
    .o_S(o_S[4]),
    .o_C(w_C[1])
    );

  full_adder_v full_adder_v_1 (
    .i_A(i_A[5]),
    .i_B(i_B[5]),
    .i_C(w_C[1]),
    .o_S(o_S[5]),
    .o_C(o_C)
    );





endmodule // rca_4bit_v
