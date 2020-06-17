module csa_4bit_v (
  input [3:0] i_A,
  input [3:0] i_B,
  input [3:0] i_C,
  output [4:0] o_S,
  output o_C
  );

  wire [3:1] w_S;
  wire [3:0] w_C;
  full_adder_v full_adder_v_0 (
    .i_A(i_A[0]),
    .i_B(i_B[0]),
    .i_C(i_C[0]),
    .o_S(o_S[0]),
    .o_C(w_C[0])
    );

  full_adder_v full_adder_v_1 (
    .i_A(i_A[1]),
    .i_B(i_B[1]),
    .i_C(i_C[1]),
    .o_S(w_S[1]),
    .o_C(w_C[1])
    );

  full_adder_v full_adder_v_2 (
    .i_A(i_A[2]),
    .i_B(i_B[2]),
    .i_C(i_C[2]),
    .o_S(w_S[2]),
    .o_C(w_C[2])
    );

  full_adder_v full_adder_v_3 (
    .i_A(i_A[3]),
    .i_B(i_B[3]),
    .i_C(i_C[3]),
    .o_S(w_S[3]),
    .o_C(w_C[3])
    );

  rca_4bit_v rca_4bit_v (
    .i_A(w_C),
    .i_B({1'b0, w_S}),
    .i_C(1'b0),
    .o_S(o_S[4:1]),
    .o_C(o_C)
    );
endmodule // csa_4bit
