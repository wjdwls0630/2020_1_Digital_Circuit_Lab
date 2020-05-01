module nand_4in_v (
  input [3:0] A,
  output Z
  );

  nand(Z, A[3], A[2], A[1], A[0]);

endmodule //nand_4in_v
