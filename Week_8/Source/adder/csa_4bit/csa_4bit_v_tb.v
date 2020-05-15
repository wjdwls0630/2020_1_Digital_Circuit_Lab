module csa_4bit_v_tb ();
  reg [3:0] r_A;
  reg [3:0] r_B;
  reg [3:0] r_C;
  wire [4:0] w_S;
  wire w_C;
  initial begin
    r_A <= 4'b1100;
    r_B <= 4'b1101;
    r_C <= 4'b1110;
  end
  csa_4bit_v csa_4bit_v (
    .i_A(r_A),
    .i_B(r_B),
    .i_C(r_C),
    .o_S(w_S),
    .o_C(w_C)
    );
endmodule //adder_4bit_v
