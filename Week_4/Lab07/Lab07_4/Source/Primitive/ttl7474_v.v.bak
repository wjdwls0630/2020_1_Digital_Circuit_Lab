module ttl7474 (
  input i_D,
  output o_Q,
  output o_Qn,
  input i_CLK
  );

  assign o_Qn = ~o_Q;
  always @ ( posedge i_CLK ) begin
    o_Q <= i_D;
  end

endmodule //ttl7474
