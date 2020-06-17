module xor_2in_v (
  input [1:0] A,
  output Z
  );

  xor(Z, A[0], A[1]);

endmodule //and_2in_v
