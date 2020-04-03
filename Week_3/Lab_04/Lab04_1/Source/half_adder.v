module half_adder (
  input [1:0] A,
  output S,
  output C
  );

  Lab04_1_Half_Adder Lab04_1_Half_Adder_inst(
	.A(A) ,	// input [1:0] A_sig
	.S(S) ,	// output  S_sig
	.C(C) 	// output  C_sig
  );
endmodule //half_adder
