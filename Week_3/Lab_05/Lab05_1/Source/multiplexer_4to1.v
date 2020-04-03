module multiplexer_4to1 (
  input [3:0] A,
  input [1:0] S,
  output Y
  );

  wire w_s1_n;
  wire w_s2_n;
  wire w_and_1;
  wire w_and_2;
  wire w_and_3;
  wire w_and_4;
  wire w_or_1;
  wire w_or_2;
  wire w_or_3;
  // RTL Viewer instantiation
  /*
  not_1in not_1in_1(
    .A(S[0]),
    .Z(w_s2_n)
    );
  not_1in not_1in_2(
    .A(S[1]),
    .Z(w_s1_n)
    );

  and_3in and_3in_1(
    .A({A[3], w_s1_n, w_s2_n}),
    .Z(w_and_1)
    );
  and_3in and_3in_2(
    .A({A[2], w_s1_n, S[0]}),
    .Z(w_and_2)
    );
  and_3in and_3in_3(
    .A({A[1], S[1], w_s2_n}),
    .Z(w_and_3)
    );
  and_3in and_3in_4(
    .A({A[0], S[1], S[0]}),
    .Z(w_and_4)
    );

  or_2in or_2in_1(
    .A({w_and_1, w_and_2}),
    .Z(w_or_1)
    );
  or_2in or_2in_2(
    .A({w_and_3, w_and_4}),
    .Z(w_or_2)
    );
  or_2in or_2in_3(
    .A({w_or_1, w_or_2}),
    .Z(Y)
    );
*/
  // modelsim instantiation

  not_1in_v not_1in_1(
    .A(S[0]),
    .Z(w_s2_n)
    );
  not_1in_v not_1in_2(
    .A(S[1]),
    .Z(w_s1_n)
    );

  and_3in_v and_3in_1(
    .A({A[3], w_s1_n, w_s2_n}),
    .Z(w_and_1)
    );
  and_3in_v and_3in_2(
    .A({A[2], w_s1_n, S[0]}),
    .Z(w_and_2)
    );
  and_3in_v and_3in_3(
    .A({A[1], S[1], w_s2_n}),
    .Z(w_and_3)
    );
  and_3in_v and_3in_4(
    .A({A[0], S[1], S[0]}),
    .Z(w_and_4)
    );

  or_2in_v or_2in_1(
    .A({w_and_1, w_and_2}),
    .Z(w_or_1)
    );
  or_2in_v or_2in_2(
    .A({w_and_3, w_and_4}),
    .Z(w_or_2)
    );
  or_2in_v or_2in_3(
    .A({w_or_1, w_or_2}),
    .Z(Y)
    );


endmodule //multiplexer_4to1
