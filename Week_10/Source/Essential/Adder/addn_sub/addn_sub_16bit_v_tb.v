module addn_sub_16bit_v_tb ();
  reg [15:0] r_A;
  reg [15:0] r_B;
  reg r_ADDNSUB;
  wire [15:0] w_S;
  wire w_C;
  wire [17:0] result;
  initial begin
    r_A <= 16'b1011111110111111;
    r_B <= 16'b1111001111110011;
    r_ADDNSUB <= 1'b0;
    #50 r_ADDNSUB <= 1'b1;
  end
  assign result = {r_ADDNSUB, w_C, w_S};
  addn_sub_16bit_v addn_sub_16bit_v (
    .i_A(r_A),
    .i_B(r_B),
    .i_ADDN_SUB(r_ADDNSUB),
    .o_S(w_S),
    .o_C(w_C)
    );
endmodule //adder_4bit_v
