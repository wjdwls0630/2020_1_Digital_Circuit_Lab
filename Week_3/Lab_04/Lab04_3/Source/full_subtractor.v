module full_subtractor (
  input [1:0] A,
  input B_in,
  output D,
  output B_out
  );
  wire w_A_1_bar;
  wire w_D_1;
  wire w_and_1;
  wire w_and_2;
  wire w_and_3;

  // RTL Viewer instantiation
  /*
  not_1in not_1in(
    .A(A[1]),
    .Z(w_A_1_bar)
    );

  xor_3in xor_3in(
    .A({A, B_in}),
    .Z(D)
    );

  and_2in and_2in_1(
    .A({w_A_1_bar, A[0]}),
    .Z(w_and_1)
    );

  and_2in and_2in_2(
    .A({w_A_1_bar, B_in}),
    .Z(w_and_2)
    );

  and_2in and_2in_3(
    .A({A[0], B_in}),
    .Z(w_and_3)
    );

  or_3in or_3in(
    .A({w_and_1, w_and_2, w_and_3}),
    .Z(B_out)
    );
  */
  // modelsim instantiation

  not_1in_v not_1in(
    .A(A[1]),
    .Z(w_A_1_bar)
    );

  xor_3in_v xor_3in(
    .A({A, B_in}),
    .Z(D)
    );

  and_2in_v and_2in_1(
    .A({w_A_1_bar, A[0]}),
    .Z(w_and_1)
    );

  and_2in_v and_2in_2(
    .A({w_A_1_bar, B_in}),
    .Z(w_and_2)
    );

  and_2in_v and_2in_3(
    .A({A[0], B_in}),
    .Z(w_and_3)
    );

  or_3in_v or_3in(
    .A({w_and_1, w_and_2, w_and_3}),
    .Z(B_out)
    );
  

endmodule //full_subtractor
