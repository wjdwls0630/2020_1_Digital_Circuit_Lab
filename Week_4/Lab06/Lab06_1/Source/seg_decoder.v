module seg_decoder (
  input wire [3:0] i_A,
  output wire [6:0] o_Z
  );
  // RTL

  wire w_Dn; // [3]
  wire w_Cn; // [2]
  wire w_Bn; // [1]
  wire w_An; // [0]
  not_1in not_1in_0(
    .A(i_A[0]),
    .Z(w_An)
    );
  not_1in not_1in_1(
    .A(i_A[1]),
    .Z(w_Bn)
    );
  not_1in not_1in_2(
    .A(i_A[2]),
    .Z(w_Cn)
    );
  not_1in not_1in_3(
    .A(i_A[3]),
    .Z(w_Dn)
    );

  wire w_and_2in_a_1;
  wire w_and_2in_a_2;
  wire w_and_2in_a_3;
  and_2in and_2in_a_1(
    .A({w_Cn, w_An}),
    .Z(w_and_2in_a_1)
    );
  and_2in and_2in_a_2(
    .A({i_A[2], i_A[0]}),
    .Z(w_and_2in_a_2)
    );
  and_2in and_2in_a_3(
    .A({w_Cn, i_A[1]}),
    .Z(w_and_2in_a_3)
    );
  or_4in or_4in_a(
    .A({w_and_2in_a_1, w_and_2in_a_2, i_A[3], w_and_2in_a_3}),
    .Z(o_Z[6])
    );

  wire w_and_2in_b_1;
  wire w_and_2in_b_2;

  and_2in and_2in_b_1(
    .A({w_Bn, w_An}),
    .Z(w_and_2in_b_1)
    );
  and_2in and_2in_b_2(
    .A({i_A[1], i_A[0]}),
    .Z(w_and_2in_b_2)
    );
  or_3in or_3in_b(
    .A({w_and_2in_b_1, w_and_2in_b_2, w_Cn}),
    .Z(o_Z[5])
    );

  or_3in or_3in_c(
    .A({w_Bn, i_A[0], i_A[2]}),
    .Z(o_Z[4])
    );

  wire w_and_3in_d_1;
  wire w_and_2in_d_2;
  wire w_and_2in_d_3;
  wire w_and_2in_d_4;
  and_3in and_3in_d_1(
    .A({i_A[2], w_Bn, i_A[0]}),
    .Z(w_and_3in_d_1)
    );
  and_2in and_2in_d_2(
    .A({w_Cn, w_An}),
    .Z(w_and_2in_d_2)
    );
  and_2in and_2in_d_3(
    .A({w_Cn, i_A[1]}),
    .Z(w_and_2in_d_3)
    );
  and_2in and_2in_d_4(
    .A({i_A[1], w_An}),
    .Z(w_and_2in_d_4)
    );
  or_4in or_4in_d(
    .A({w_and_3in_d_1, w_and_2in_d_2, w_and_2in_d_3, w_and_2in_d_4}),
    .Z(o_Z[3])
    );

  wire w_and_2in_e_1;
  wire w_and_2in_e_2;
  and_2in and_2in_e_1(
    .A({w_Cn, w_An}),
    .Z(w_and_2in_e_1)
    );
  and_2in and_2in_e_2(
    .A({i_A[1], w_An}),
    .Z(w_and_2in_e_2)
    );
  or_2in or_2in_e(
    .A({w_and_2in_e_1, w_and_2in_e_2}),
    .Z(o_Z[2])
    );

  wire w_and_2in_f_1;
  wire w_and_2in_f_2;
  wire w_and_2in_f_3;
  and_2in and_2in_f_1(
    .A({w_Bn, w_An}),
    .Z(w_and_2in_f_1)
    );
  and_2in and_2in_f_2(
    .A({i_A[2], w_Bn}),
    .Z(w_and_2in_f_2)
    );
  and_2in and_2in_f_3(
    .A({i_A[2], w_An}),
    .Z(w_and_2in_f_3)
    );
  or_4in or_4in_f(
    .A({w_and_2in_f_1, w_and_2in_f_2, w_and_2in_f_3, i_A[3]}),
    .Z(o_Z[1])
    );

  wire w_and_2in_g_1;
  wire w_and_2in_g_2;
  wire w_and_2in_g_3;
  and_2in and_2in_g_1(
    .A({w_Cn, i_A[1]}),
    .Z(w_and_2in_g_1)
    );
  and_2in and_2in_g_2(
    .A({i_A[2], w_Bn}),
    .Z(w_and_2in_g_2)
    );
  and_2in and_2in_g_3(
    .A({i_A[2], w_An}),
    .Z(w_and_2in_g_3)
    );
  or_4in or_4in_g(
    .A({w_and_2in_g_1, w_and_2in_g_2, i_A[3], w_and_2in_g_3}),
    .Z(o_Z[0])
    );

  // modelsim
  /*
  wire w_Dn; // [3]
  wire w_Cn; // [2]
  wire w_Bn; // [1]
  wire w_An; // [0]
  not_1in_v not_1in_0(
    .A(i_A[0]),
    .Z(w_An)
    );
  not_1in_v not_1in_1(
    .A(i_A[1]),
    .Z(w_Bn)
    );
  not_1in_v not_1in_2(
    .A(i_A[2]),
    .Z(w_Cn)
    );
  not_1in_v not_1in_3(
    .A(i_A[3]),
    .Z(w_Dn)
    );

  wire w_and_2in_a_1;
  wire w_and_2in_a_2;
  wire w_and_2in_a_3;
  and_2in_v and_2in_a_1(
    .A({w_Cn, w_An}),
    .Z(w_and_2in_a_1)
    );
  and_2in_v and_2in_a_2(
    .A({i_A[2], i_A[0]}),
    .Z(w_and_2in_a_2)
    );
  and_2in_v and_2in_a_3(
    .A({w_Cn, i_A[1]}),
    .Z(w_and_2in_a_3)
    );
  or_4in_v or_4in_a(
    .A({w_and_2in_a_1, w_and_2in_a_2, i_A[3], w_and_2in_a_3}),
    .Z(o_Z[6])
    );

  wire w_and_2in_b_1;
  wire w_and_2in_b_2;

  and_2in_v and_2in_b_1(
    .A({w_Bn, w_An}),
    .Z(w_and_2in_b_1)
    );
  and_2in_v and_2in_b_2(
    .A({i_A[1], i_A[0]}),
    .Z(w_and_2in_b_2)
    );
  or_3in_v or_3in_b(
    .A({w_and_2in_b_1, w_and_2in_b_2, w_Cn}),
    .Z(o_Z[5])
    );

  or_3in_v or_3in_c(
    .A({w_Bn, i_A[0], i_A[2]}),
    .Z(o_Z[4])
    );

  wire w_and_3in_d_1;
  wire w_and_2in_d_2;
  wire w_and_2in_d_3;
  wire w_and_2in_d_4;
  and_3in_v and_3in_d_1(
    .A({i_A[2], w_Bn, i_A[0]}),
    .Z(w_and_3in_d_1)
    );
  and_2in_v and_2in_d_2(
    .A({w_Cn, w_An}),
    .Z(w_and_2in_d_2)
    );
  and_2in_v and_2in_d_3(
    .A({w_Cn, i_A[1]}),
    .Z(w_and_2in_d_3)
    );
  and_2in_v and_2in_d_4(
    .A({i_A[1], w_An}),
    .Z(w_and_2in_d_4)
    );
  or_4in_v or_4in_d(
    .A({w_and_3in_d_1, w_and_2in_d_2, w_and_2in_d_3, w_and_2in_d_4}),
    .Z(o_Z[3])
    );

  wire w_and_2in_e_1;
  wire w_and_2in_e_2;
  and_2in_v and_2in_e_1(
    .A({w_Cn, w_An}),
    .Z(w_and_2in_e_1)
    );
  and_2in_v and_2in_e_2(
    .A({i_A[1], w_An}),
    .Z(w_and_2in_e_2)
    );
  or_2in_v or_2in_e(
    .A({w_and_2in_e_1, w_and_2in_e_2}),
    .Z(o_Z[2])
    );

  wire w_and_2in_f_1;
  wire w_and_2in_f_2;
  wire w_and_2in_f_3;
  and_2in_v and_2in_f_1(
    .A({w_Bn, w_An}),
    .Z(w_and_2in_f_1)
    );
  and_2in_v and_2in_f_2(
    .A({i_A[2], w_Bn}),
    .Z(w_and_2in_f_2)
    );
  and_2in_v and_2in_f_3(
    .A({i_A[2], w_An}),
    .Z(w_and_2in_f_3)
    );
  or_4in_v or_4in_f(
    .A({w_and_2in_f_1, w_and_2in_f_2, w_and_2in_f_3, i_A[3]}),
    .Z(o_Z[1])
    );

  wire w_and_2in_g_1;
  wire w_and_2in_g_2;
  wire w_and_2in_g_3;
  and_2in_v and_2in_g_1(
    .A({w_Cn, i_A[1]}),
    .Z(w_and_2in_g_1)
    );
  and_2in_v and_2in_g_2(
    .A({i_A[2], w_Bn}),
    .Z(w_and_2in_g_2)
    );
  and_2in_v and_2in_g_3(
    .A({i_A[2], w_An}),
    .Z(w_and_2in_g_3)
    );
  or_4in_v or_4in_g(
    .A({w_and_2in_g_1, w_and_2in_g_2, i_A[3], w_and_2in_g_3}),
    .Z(o_Z[0])
    );
  */


endmodule //seg_decoder
