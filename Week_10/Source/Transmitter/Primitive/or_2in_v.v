module or_2in_v (
  input [1:0] A,
  output Z
  );

  or(Z, A[0], A[1]);

endmodule //and_2in_v
