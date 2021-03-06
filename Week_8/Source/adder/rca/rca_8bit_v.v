module rca_8bit_v (
  input [7:0] i_A,
  input [7:0] i_B,
  input i_C,
  output [7:0] o_S,
  output o_C
  );

  wire w_C;
  rca_4bit_v rca_4bit_v_0(
    .i_A(i_A[3:0]),
    .i_B(i_B[3:0]),
    .i_C(i_C),
    .o_S(o_S[3:0]),
    .o_C(w_C)
    );

  rca_4bit_v rca_4bit_v_1(
    .i_A(i_A[7:4]),
    .i_B(i_B[7:4]),
    .i_C(w_C),
    .o_S(o_S[7:4]),
    .o_C(o_C)
    );
endmodule // rca_4bit_v
