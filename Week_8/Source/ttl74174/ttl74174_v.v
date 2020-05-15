// Quad D FF
module ttl74174_v (
  input [5:0] D,
  output [5:0] Q,
  input CLK,
  input CLRb
  );

  dff_v dff_v_1(
    .i_D(D[0]),
    .o_Q(Q[0]),
    .o_Qn(),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_2(
    .i_D(D[1]),
    .o_Q(Q[1]),
    .o_Qn(),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_3(
    .i_D(D[2]),
    .o_Q(Q[2]),
    .o_Qn(),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_4(
    .i_D(D[3]),
    .o_Q(Q[3]),
    .o_Qn(),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_5(
    .i_D(D[4]),
    .o_Q(Q[4]),
    .o_Qn(),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );

  dff_v dff_v_6(
    .i_D(D[5]),
    .o_Q(Q[5]),
    .o_Qn(),
    .i_CLK(CLK),
    .i_RSTN(CLRb)
    );


endmodule // ttl74174_v
