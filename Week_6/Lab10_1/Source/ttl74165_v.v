module ttl74165_v (
  input CLK,
  input CLKIH,
  input SER,
  input STLD, // async
  input [7:0] P,
  output QH,
  output QHN
  );
  reg [7:0] Q;
  assign QH = Q[7];
  assign QHN = ~Q[7];
  always @ ( posedge CLK, negedge STLD) begin
    if(!STLD) Q <= P;
    else begin
      if(!CLKIH) Q <= {Q[6:0], SER};
      else Q <= Q;
    end
  end


endmodule //ttl74165_v
