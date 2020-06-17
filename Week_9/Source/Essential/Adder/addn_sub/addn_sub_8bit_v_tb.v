module addn_sub_8bit_v_tb ();
  reg [7:0] r_A;
  reg [7:0] r_B;
  reg r_ADDNSUB;
  wire [7:0] w_S;
  wire w_C;
  wire [9:0] result;
  initial begin
    r_A <= 8'b10111111;
    r_B <= 8'b11110011;
    r_ADDNSUB <= 1'b0;
    #50 r_ADDNSUB <= 1'b1;
  end
  assign result = {r_ADDNSUB, w_C, w_S};
  addn_sub_8bit_v addn_sub_8bit_v (
    .i_A(r_A),
    .i_B(r_B),
    .i_ADDN_SUB(r_ADDNSUB),
    .o_S(w_S),
    .o_C(w_C)
    );
endmodule //adder_4bit_v
