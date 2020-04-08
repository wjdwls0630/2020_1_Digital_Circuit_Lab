module ttl7474_v (
  input i_D,
  output reg o_Q,
  output wire o_Qn,
  input i_CLK
  );

  assign o_Qn = ~o_Q;
  always @ ( posedge i_CLK ) begin
    o_Q <= i_D;
  end

endmodule //ttl7474
