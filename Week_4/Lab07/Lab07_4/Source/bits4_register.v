module bits4_register (
  input i_D,
  output [3:0] o_Q,
  input i_CLK
  );

  // RTL
  /*
  wire w_q0;
  wire w_q1;
  wire w_q2;
  wire w_q3;

  assign o_Q = {w_q3, w_q2, w_q1, w_q0};
  ttl7474 ttl7474_1(
    .i_D(i_D),
    .o_Q(w_q0),
    .o_Qn(),
    .i_CLK(i_CLK)
    );

  ttl7474 ttl7474_2(
    .i_D(w_q0),
    .o_Q(w_q1),
    .o_Qn(),
    .i_CLK(i_CLK)
    );

  ttl7474 ttl7474_3(
    .i_D(w_q1),
    .o_Q(w_q2),
    .o_Qn(),
    .i_CLK(i_CLK)
    );

  ttl7474 ttl7474_4(
    .i_D(w_q2),
    .o_Q(w_q3),
    .o_Qn(),
    .i_CLK(i_CLK)
    );
	*/
  // modelsim
  
  wire w_q0;
  wire w_q1;
  wire w_q2;
  wire w_q3;

  assign o_Q = {w_q3, w_q2, w_q1, w_q0};
  ttl7474_v ttl7474_1(
    .i_D(i_D),
    .o_Q(w_q0),
    .o_Qn(),
    .i_CLK(i_CLK)
    );

  ttl7474_v ttl7474_2(
    .i_D(w_q0),
    .o_Q(w_q1),
    .o_Qn(),
    .i_CLK(i_CLK)
    );

  ttl7474_v ttl7474_3(
    .i_D(w_q1),
    .o_Q(w_q2),
    .o_Qn(),
    .i_CLK(i_CLK)
    );

  ttl7474_v ttl7474_4(
    .i_D(w_q2),
    .o_Q(w_q3),
    .o_Qn(),
    .i_CLK(i_CLK)
    );
  

endmodule //ttl7474_top
