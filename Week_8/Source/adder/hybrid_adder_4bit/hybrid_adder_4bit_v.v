module hybrid_adder_4bit_v (
  input [3:0] i_A,
  input [3:0] i_B,
  input [3:0] i_C,
  output [3:0] o_S,
  output o_C
  );

  wire [3:0] w_C;
  wire [3:1] w_S;
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

  wire [2:0] w_p;
  half_adder_v half_adder_v_0(
    .i_A(w_C[0]),
    .i_B(w_S[1]),
    .o_S(o_S[1]),
    .o_C(w_p[0])
    );

  full_adder_v full_adder_v_4 (
    .i_A(w_C[1]),
    .i_B(w_S[2]),
    .i_C(w_p[0]),
    .o_S(o_S[2]),
    .o_C(w_p[1])
    );

  full_adder_v full_adder_v_5 (
    .i_A(w_S[3]),
    .i_B(w_C[2]),
    .i_C(w_p[1]),
    .o_S(o_S[3]),
    .o_C(w_p[2])
    );


  wire w_temp;
  and(w_temp, w_p[0], w_p[1], w_p[2]);
  or(o_C, w_C[3], w_p[2], w_temp);
endmodule //adder_4bit_v
