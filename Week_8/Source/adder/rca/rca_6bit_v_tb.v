module rca_6bit_v_tb ();
  reg [5:0] r_A;
  reg [5:0] r_B;
  reg r_C;
  wire [5:0] w_S;
  wire w_C;
  initial begin
    r_A <= 6'b111100;
    r_B <= 4'b101111;
    r_C <= 1'b1;
  end
  rca_6bit_v rca_6bit_v (
    .i_A(r_A),
    .i_B(r_B),
    .i_C(r_C),
    .o_S(w_S),
    .o_C(w_C)
    );
endmodule //adder_4bit_v
