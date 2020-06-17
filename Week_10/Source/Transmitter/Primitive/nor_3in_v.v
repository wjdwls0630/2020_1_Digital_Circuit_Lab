module nor_3in_v (
  input [2:0] A,
  output Z
  );

  nor(Z, A[2], A[1], A[0]);

endmodule //nor_3in_v
