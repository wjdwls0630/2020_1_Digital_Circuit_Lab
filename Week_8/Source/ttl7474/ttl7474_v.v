module ttl7474_v (
  input D1,
  output reg Q1,
  output Q1b,
  input PR1n,
  input CLR1n,
  input CLK1,
  input D2,
  output reg Q2,
  output Q2b,
  input PR2n,
  input CLR2n,
  input CLK2
  );

  assign Q1b = ~Q1;
  assign Q2b = ~Q2;

  always @ ( posedge CLK1, negedge PR1n, negedge CLR1n) begin
    if(!PR1n) Q1 <= 1'b1;
    else if(!CLR1n) Q1 <= 1'b0;
    else Q1 <= D1;
  end

  always @ ( posedge CLK2, negedge PR2n, negedge CLR2n) begin
    if(!PR2n) Q2 <= 1'b1;
    else if(!CLR2n) Q2 <= 1'b0;
    else Q2 <= D2;
  end

endmodule // ttl7474_v
