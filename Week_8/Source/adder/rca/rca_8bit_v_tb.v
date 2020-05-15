module rca_8bit_v_tb ();
  reg [7:0] r_A;
  reg [7:0] r_B;
  reg r_C;
  wire [7:0] w_S;
  wire w_C;
  initial begin
    r_A <= 8'b11110011;
    r_B <= 8'b10111111;
    r_C <= 1'b1;
  end
  rca_8bit_v rca_8bit_v (
    .i_A(r_A),
    .i_B(r_B),
    .i_C(r_C),
    .o_S(w_S),
    .o_C(w_C)
    );
endmodule //adder_4bit_v
