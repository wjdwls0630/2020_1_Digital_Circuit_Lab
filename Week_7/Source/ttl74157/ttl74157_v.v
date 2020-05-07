module ttl74157_v (
  input [4:1] A,
  input [4:1] B,
  input SEL,
  input GN,
  output [4:1] Y
  );

  wire w_nor_1;
  wire w_nor_2;
  nor(w_nor_1, GN, SEL);
  nor(w_nor_2, GN, ~SEL);

  wire w_and_1_1;
  wire w_and_1_2;
  and(w_and_1_1, A[1], w_nor_1);
  and(w_and_1_2, B[1], w_nor_2);
  or(Y[1], w_and_1_1, w_and_1_2);

  wire w_and_2_1;
  wire w_and_2_2;
  and(w_and_2_1, A[2], w_nor_1);
  and(w_and_2_2, B[2], w_nor_2);
  or(Y[2], w_and_2_1, w_and_2_2);

  wire w_and_3_1;
  wire w_and_3_2;
  and(w_and_3_1, A[3], w_nor_1);
  and(w_and_3_2, B[3], w_nor_2);
  or(Y[3], w_and_3_1, w_and_3_2);

  wire w_and_4_1;
  wire w_and_4_2;
  and(w_and_4_1, A[4], w_nor_1);
  and(w_and_4_2, B[4], w_nor_2);
  or(Y[4], w_and_4_1, w_and_4_2);




endmodule //ttl74157_v
