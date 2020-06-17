module nand_3in_v(
  input [2:0] A,
  output Z
  );

  nand(Z, A[2], A[1], A[0]);

endmodule //nand_3in_v
