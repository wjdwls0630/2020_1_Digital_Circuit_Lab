module top (
  input [9:0] A,
  input [9:0] B,
  input START,
  input EQUAL,
  input Addn_Sub,
  output [4:0] result,
  output [3:0] S,
  output Cout,
  //output wire [6:0] seg1,
  //output reg [6:0] seg10,
  input CLK
  );

  wire w_nand_A_1;
  wire w_nand_A_2;
  wire w_nand_A_3;
  wire w_click_A;
  nand_4in nand_4in_A_1(
    .A(A[9:6]),
    .Z(w_nand_A_1)
    );

  nand_4in nand_4in_A_2(
    .A(A[5:2]),
    .Z(w_nand_A_2)
    );

  nand_3in nand_3in_A_3(
    .A(A[2:0]),
    .Z(w_nand_A_3)
    );

  or_3in or_3in_1(
    .A({w_nand_A_1, w_nand_A_2, w_nand_A_3}),
    .Z(w_click_A)
    );

  wire w_nand_B_1;
  wire w_nand_B_2;
  wire w_nand_B_3;
  wire w_click_B;
  nand_4in nand_4in_B_1(
    .A(B[9:6]),
    .Z(w_nand_B_1)
    );

  nand_4in nand_4in_B_2(
    .A(B[5:2]),
    .Z(w_nand_B_2)
    );

  nand_3in nand_3in_B_3(
    .A(B[2:0]),
    .Z(w_nand_B_3)
    );

  or_3in or_3in_2(
    .A({w_nand_B_1, w_nand_B_2, w_nand_B_3}),
    .Z(w_click_B)
    );

  wire [5:0] w_A1n;
  wire [5:0] w_A2n;
  ttl74174 ttl74174_A_1(
    .D({1'b0, A[4:0]}),
    .Q(w_A1n),
    .CLK(w_click_A),
    .CLRb(START)
    );

  ttl74174 ttl74174_A_2(
    .D({1'b0, A[9:5]}),
    .Q(w_A2n),
    .CLK(w_click_A),
    .CLRb(START)
    );

  wire [5:0] w_B1n;
  wire [5:0] w_B2n;
  ttl74174 ttl74174_B_1(
    .D({1'b0, B[4:0]}),
    .Q(w_B1n),
    .CLK(w_click_B),
    .CLRb(START)
    );

  ttl74174 ttl74174_B_2(
    .D({1'b0, B[9:5]}),
    .Q(w_B2n),
    .CLK(w_click_B),
    .CLRb(START)
    );
  wire [3:0] w_A_BCD;
  wire [3:0] w_B_BCD;
  ttl74147 ttl74147_A(
    .An({w_A2n[4:0], w_A1n[4:1]}),
    .Zn(w_A_BCD)
    );

  ttl74147 ttl74147_B(
    .An({w_B2n[4:0], w_B1n[4:1]}),
    .Zn(w_B_BCD)
    );

  wire [3:0] w_A;
  wire [3:0] w_B;
  not_1in not_1in_1(
    .A(w_A_BCD[0]),
    .Z(w_A[0])
    );

  not_1in not_1in_2(
    .A(w_A_BCD[1]),
    .Z(w_A[1])
    );

  not_1in not_1in_3(
    .A(w_A_BCD[2]),
    .Z(w_A[2])
    );

  not_1in not_1in_4(
    .A(w_A_BCD[3]),
    .Z(w_A[3])
    );

  not_1in not_1in_5(
    .A(w_B_BCD[0]),
    .Z(w_B[0])
    );

  not_1in not_1in_6(
    .A(w_B_BCD[1]),
    .Z(w_B[1])
    );

  not_1in not_1in_7(
    .A(w_B_BCD[2]),
    .Z(w_B[2])
    );

  not_1in not_1in_8(
    .A(w_B_BCD[3]),
    .Z(w_B[3])
    );

  //assign w_A = ~w_A_BCD;
  //assign w_B = ~w_B_BCD;
  // Addn_Sub = 1'b0 <= add
  // Addn_Sub = 1'b1 <= sub
  wire [3:0] w_B_in;
  xor_2in xor_2in_1(
    .A({w_B[0], Addn_Sub}),
    .Z(w_B_in[0])
    );

  xor_2in xor_2in_2(
    .A({w_B[1], Addn_Sub}),
    .Z(w_B_in[1])
    );

  xor_2in xor_2in_3(
    .A({w_B[2], Addn_Sub}),
    .Z(w_B_in[2])
    );

  xor_2in xor_2in_4(
    .A({w_B[3], Addn_Sub}),
    .Z(w_B_in[3])
    );


  wire [3:0] w_S;
  wire w_Cout;
  ttl74283 ttl74283(
    .A(w_A),
    .B(w_B_in),
    .Cin(Addn_Sub),
    .S(w_S),
    .Cout(w_Cout)
    );
  assign S = w_S;
  assign Cout = w_Cout;
  wire [4:0] w_result;
  wire w_msb;
  xor_2in xor_2in_5(
    .A({w_Cout, Addn_Sub}),
    .Z(w_msb)
    );
  assign w_result = {w_msb, w_S};

  wire w_clk_en;
  and_2in and_2in(
    .A({EQUAL, CLK}),
    .Z(w_clk_en)
    );

  wire [5:0] w_result_Q;
  ttl74174 ttl74174_1(
    .D({1'b0, w_result}),
    .Q(w_result_Q),
    .CLK(w_clk_en),
    .CLRb(START)
    );

  assign result = w_result_Q[4:0];

/*
  reg [3:0] r_seg1_decode_in;
  reg r_neg;
  reg r_seg10;
  always @ ( result ) begin
    if(result > 5'b01001) begin
      if(result > 5'b10110) begin
        r_neg <= 1'b1;
        r_seg10 <= 1'b0;
        r_seg1_decode_in <= (~result[3:0])+1'b1;
      end else begin
        r_neg <= 1'b0;
        r_seg10 <= 1'b1;
        if(result == 5'b01010) r_seg1_decode_in <= 4'b0000;
        if(result == 5'b01011) r_seg1_decode_in <= 4'b0001;
        if(result == 5'b01100) r_seg1_decode_in <= 4'b0010;
        if(result == 5'b01101) r_seg1_decode_in <= 4'b0011;
        if(result == 5'b01110) r_seg1_decode_in <= 4'b0100;
        if(result == 5'b01111) r_seg1_decode_in <= 4'b0101;
        if(result == 5'b10000) r_seg1_decode_in <= 4'b0110;
        if(result == 5'b10001) r_seg1_decode_in <= 4'b0111;
        if(result == 5'b10010) r_seg1_decode_in <= 4'b1000;
      end
    end else begin
      r_seg10 <= 1'b0;
      r_neg <= 1'b0;
      r_seg1_decode_in <= result;
    end
  end

  wire w_clk_en;
  and(w_clk_en, EQUAL, CLK);

  wire [5:0] w_seg_1_reg;
  wire [5:0] w_seg_10_reg;

  ttl74174_v ttl74174_v_1(
    .D({2'b0, r_seg1_decode_in[3:0]}),
    .Q(w_seg_1_reg),
    .CLK(w_clk_en),
    .CLRb(START)
    );

  ttl74174_v ttl74174_v_10(
    .D({4'b0, r_neg, r_seg10}),
    .Q(w_seg_10_reg),
    .CLK(w_clk_en),
    .CLRb(START)
    );

  seg_decoder_v seg_decoder_v_1(
    .i_A(w_seg_1_reg[3:0]),
    .o_Z(seg1)
    );

  always @ ( w_seg_10_reg ) begin
    if(w_seg_10_reg[1]) seg10 <= 7'b0000001;
    else if(w_seg_10_reg[0]) seg10 <= 7'b0110000;
    else seg10 <= 7'b1111110;
  end
  */
endmodule // top_v
