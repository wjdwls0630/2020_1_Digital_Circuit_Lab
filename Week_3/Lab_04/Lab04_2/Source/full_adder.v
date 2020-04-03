module full_adder (
  input [1:0] A, // A , B
  input C_in,
  output S,
  output C_out
  );

  wire S_half;
  wire C_half;
  wire w_and_1;
  wire w_and_2;
  half_adder half_adder(
    .A(A),
    .S(S_half),
    .C(C_half)
    );

  // RTL Viewer instantiation
  /*
  xor_2in xor_2in(
    .A({S_half, C_in}),
    .Z(S)
    );


  and_2in and_2in_1(
    .A({A[0], C_in}),
    .Z(w_and_1)
    );

  and_2in and_2in_2(
    .A({A[1], C_in}),
    .Z(w_and_2)
    );

  or_3in or_3in(
    .A({C_half, w_and_1, w_and_2}),
    .Z(C_out)
    );
  */
  // modelsim instantiation
  xor_2in_v xor_2in(
    .A({S_half, C_in}),
    .Z(S)
    );


  and_2in_v and_2in_1(
    .A({A[0], C_in}),
    .Z(w_and_1)
    );

  and_2in_v and_2in_2(
    .A({A[1], C_in}),
    .Z(w_and_2)
    );

  or_3in_v or_3in(
    .A({C_half, w_and_1, w_and_2}),
    .Z(C_out)
    );
endmodule // full_adder
