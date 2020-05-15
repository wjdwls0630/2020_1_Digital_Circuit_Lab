module addn_sub_8bit_v (
  input [7:0] i_A,
  input [7:0] i_B,
  input i_ADDN_SUB,
  output [7:0] o_S,
  output o_C
  );

  wire [7:0] w_B;
  wire w_C;
  xor(w_B[0], i_ADDN_SUB, i_B[0]);
  xor(w_B[1], i_ADDN_SUB, i_B[1]);
  xor(w_B[2], i_ADDN_SUB, i_B[2]);
  xor(w_B[3], i_ADDN_SUB, i_B[3]);
  xor(w_B[4], i_ADDN_SUB, i_B[4]);
  xor(w_B[5], i_ADDN_SUB, i_B[5]);
  xor(w_B[6], i_ADDN_SUB, i_B[6]);
  xor(w_B[7], i_ADDN_SUB, i_B[7]);
  xor(o_C, i_ADDN_SUB, w_C);
  rca_8bit_v rca_8bit_v (
    .i_A(i_A),
    .i_B(w_B),
    .i_C(i_ADDN_SUB),
    .o_S(o_S),
    .o_C(w_C)
    );

endmodule //addn_sub
