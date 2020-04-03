module half_adder (
  input [1:0] A,
  output S,
  output C
  );

	// RTL Viewer instantiation
  /*
  xor_2in xor_2in(
    .A(A),
    .Z(S)
    );

  and_2in and_2in(
    .A(A),
    .Z(C)
    );
  */
	// modelsim instantiation
  xor_2in_v xor_2in(
    .A(A),
    .Z(S)
    );

  and_2in_v and_2in(
    .A(A),
    .Z(C)
    );

endmodule //half_adder
