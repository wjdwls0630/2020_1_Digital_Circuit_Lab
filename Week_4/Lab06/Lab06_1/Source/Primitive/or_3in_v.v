module or_3in_v (
  input [2:0] A,
  output Z
  );

  or(Z, A[2], A[1], A[0]);

endmodule //and_3in_v
