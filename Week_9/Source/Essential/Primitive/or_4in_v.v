module or_4in_v (
  input [3:0] A,
  output Z
  );

  or(Z, A[3], A[2], A[1], A[0]);

endmodule //and_3in_v
