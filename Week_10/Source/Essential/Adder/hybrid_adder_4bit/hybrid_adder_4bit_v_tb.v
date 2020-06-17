module hybrid_adder_4bit_v_tb ();
  reg [3:0] r_A;
  reg [3:0] r_B;
  reg [3:0] r_C;
  wire [3:0] w_S;
  wire w_C;
  initial begin
    r_A <= 4'b1111;
    r_B <= 4'b1011;
    r_C <= 4'b1111;
  end
  hybrid_adder_4bit_v hybrid_adder_4bit_v (
    .i_A(r_A),
    .i_B(r_B),
    .i_C(r_C),
    .o_S(w_S),
    .o_C(w_C)
    );
endmodule //adder_4bit_v
