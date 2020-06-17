module addn_sub_16bit_v (
  input [15:0] i_A,
  input [15:0] i_B,
  input i_ADDN_SUB,
  output [15:0] o_S,
  output o_C
  );

  wire [15:0] w_B;
  wire w_C;
  wire w_C1;
  xor(w_B[0], i_ADDN_SUB, i_B[0]);
  xor(w_B[1], i_ADDN_SUB, i_B[1]);
  xor(w_B[2], i_ADDN_SUB, i_B[2]);
  xor(w_B[3], i_ADDN_SUB, i_B[3]);
  xor(w_B[4], i_ADDN_SUB, i_B[4]);
  xor(w_B[5], i_ADDN_SUB, i_B[5]);
  xor(w_B[6], i_ADDN_SUB, i_B[6]);
  xor(w_B[7], i_ADDN_SUB, i_B[7]);
  xor(w_B[8], i_ADDN_SUB, i_B[8]);
  xor(w_B[9], i_ADDN_SUB, i_B[9]);
  xor(w_B[10], i_ADDN_SUB, i_B[10]);
  xor(w_B[11], i_ADDN_SUB, i_B[11]);
  xor(w_B[12], i_ADDN_SUB, i_B[12]);
  xor(w_B[13], i_ADDN_SUB, i_B[13]);
  xor(w_B[14], i_ADDN_SUB, i_B[14]);
  xor(w_B[15], i_ADDN_SUB, i_B[15]);

  xor(o_C, i_ADDN_SUB, w_C);
  rca_8bit_v rca_8bit_v_0 (
    .i_A(i_A[7:0]),
    .i_B(w_B[7:0]),
    .i_C(i_ADDN_SUB),
    .o_S(o_S[7:0]),
    .o_C(w_C1)
    );
  rca_8bit_v rca_8bit_v_1 (
    .i_A(i_A[15:8]),
    .i_B(w_B[15:8]),
    .i_C(w_C1),
    .o_S(o_S[15:8]),
    .o_C(w_C)
    );

endmodule //addn_sub
