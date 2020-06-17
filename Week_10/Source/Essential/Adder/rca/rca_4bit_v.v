module rca_4bit_v (
  input [3:0] i_A,
  input [3:0] i_B,
  input i_C,
  output [3:0] o_S,
  output o_C
  );

  wire [3:0] w_C;
  full_adder_v full_adder_v_0 (
    .i_A(i_A[0]),
    .i_B(i_B[0]),
    .i_C(i_C),
    .o_S(o_S[0]),
    .o_C(w_C[0])
    );

  full_adder_v full_adder_v_1 (
    .i_A(i_A[1]),
    .i_B(i_B[1]),
    .i_C(w_C[0]),
    .o_S(o_S[1]),
    .o_C(w_C[1])
    );

  full_adder_v full_adder_v_2 (
    .i_A(i_A[2]),
    .i_B(i_B[2]),
    .i_C(w_C[1]),
    .o_S(o_S[2]),
    .o_C(w_C[2])
    );

  full_adder_v full_adder_v_3 (
    .i_A(i_A[3]),
    .i_B(i_B[3]),
    .i_C(w_C[2]),
    .o_S(o_S[3]),
    .o_C(o_C)
    );




endmodule // rca_4bit_v
