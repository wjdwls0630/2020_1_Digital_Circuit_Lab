module nor_2in_v (
  input [1:0] A,
  output Z
  );

  nor(Z, A[0], A[1]);

endmodule //nor_2in_v
