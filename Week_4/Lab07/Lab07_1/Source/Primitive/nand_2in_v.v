module nand_2in_v (
  input [1:0] A,
  output Z
  );

  nand(Z, A[0], A[1]);

endmodule //nand_2in_v
