// Quad D FF
module ttl74175_v (
  input [3:0] D,
  output [3:0] Q,
  output [3:0] Qb,
  input CLK,
  input CLRb
  );

  dff_v dff_v_1(
    .i_D(D[0]),
    .o_Q(Q[0]),
    .o_Qn(Qb[0]),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_2(
    .i_D(D[1]),
    .o_Q(Q[1]),
    .o_Qn(Qb[1]),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_3(
    .i_D(D[2]),
    .o_Q(Q[2]),
    .o_Qn(Qb[2]),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_4(
    .i_D(D[3]),
    .o_Q(Q[3]),
    .o_Qn(Qb[3]),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

endmodule // ttl74175_v
