module top (
  input [9:0] A,
  input START,
  input EQUAL,
  input Addn_Sub,
  output [6:0] seg1,
  output [6:0] seg10
  );

  wire w_nand_A_1;
  wire w_nand_A_2;
  wire w_nand_A_3;
  wire w_click;
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
    .Z(w_click)
    );

  wire [3:0] w_A_BCD;
  ttl74147 ttl74147(
    .An(A[9:1]),
    .Zn(w_A_BCD)
    );

  wire [3:0] w_A;
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

  wire [5:0] w_B_reg;
  wire [5:0] w_A_reg;
  ttl74174 ttl74174_1(
    .D({2'b0, w_A[3:0]}),
    .Q(w_A_reg),
    .CLK(w_click),
    .CLRb(START)
    );

  ttl74174 ttl74174_2(
    .D({2'b0, w_A_reg[3:0]}),
    .Q(w_B_reg),
    .CLK(w_click),
    .CLRb(START)
    );

  // Addn_Sub = 1'b0 <= add
  // Addn_Sub = 1'b1 <= sub
  wire [3:0] w_B_in_1;
  xor_2in xor_2in_1(
    .A({w_A_reg[0], Addn_Sub}),
    .Z(w_B_in_1[0])
    );

  xor_2in xor_2in_2(
    .A({w_A_reg[1], Addn_Sub}),
    .Z(w_B_in_1[1])
    );

  xor_2in xor_2in_3(
    .A({w_A_reg[2], Addn_Sub}),
    .Z(w_B_in_1[2])
    );

  xor_2in xor_2in_4(
    .A({w_A_reg[3], Addn_Sub}),
    .Z(w_B_in_1[3])
    );


  wire [3:0] w_S_1;
  wire w_Cout_1;
  ttl74283 ttl74283_1(
    .A(w_A_reg[3:0]),
    .B(w_B_in_1),
    .Cin(Addn_Sub),
    .S(w_S_1),
    .Cout(w_Cout_1)
    );

  wire w_Addn_Sub_not;
  not_1in not_1in_5(
    .A(Addn_Sub),
    .Z(w_Addn_Sub_not)
    );

  wire w_sel_and_1;
  and_2in and_2in_1(
    .A({w_Addn_Sub_not, w_Cout_1}),
    .Z(w_sel_and_1)
    );

  wire w_sel_and_2;
  and_3in and_3in_1(
    .A({w_Addn_Sub_not, w_S_1[3], w_S_1[1]}),
    .Z(w_sel_and_2)
    );

  wire w_sel_and_3;
  and_3in and_3in_2(
    .A({w_Addn_Sub_not, w_S_1[3], w_S_1[2]}),
    .Z(w_sel_and_3)
    );

  wire w_sel;
  or_3in or_3in(
    .A({w_sel_and_1, w_sel_and_2, w_sel_and_3}),
    .Z(w_sel)
    );

  wire [3:0] w_aux;
  ttl74157 ttl74157_1(
    .A(4'b0000),
    .B(4'b0110),
    .SEL(w_sel),
    .Y(w_aux)
    );

  wire w_comp;
  nor_2in nor_2in(
    .A({w_Addn_Sub_not, w_Cout_1}),
    .Z(w_comp)
    );

  wire [3:0] w_B_in_2;
  xor_2in xor_2in_5(
    .A({w_S_1[0], w_comp}),
    .Z(w_B_in_2[0])
    );

  xor_2in xor_2in_6(
    .A({w_S_1[1], w_comp}),
    .Z(w_B_in_2[1])
    );

  xor_2in xor_2in_7(
    .A({w_S_1[2], w_comp}),
    .Z(w_B_in_2[2])
    );

  xor_2in xor_2in_8(
    .A({w_S_1[3], w_comp}),
    .Z(w_B_in_2[3])
    );

  wire [3:0] w_S_2;
  wire w_Cout_2;
  ttl74283 ttl74283_2(
    .A(w_aux),
    .B(w_B_in_2),
    .Cin(w_comp),
    .S(w_S_2),
    .Cout(w_Cout_2)
    );

  wire w_show;
  xor_2in xor_2in_9(
    .A({w_click, EQUAL}),
    .Z(w_show)
    );

  wire [5:0] w_result;
  ttl74174 ttl74174_3(
    .D({1'b0, w_Cout_2, w_S_2}),
    .Q(w_result),
    .CLK(w_show),
    .CLRb(START)
    );

  ttl7448 ttl7448_1(
    .i_A(w_result[3:0]),
    .o_Z(seg1)
    );

  wire [6:0] w_seg_10;
  ttl7448 ttl7448_10(
    .i_A({3'b0, w_result[4]}),
    .o_Z(w_seg_10)
    );

  wire [6:0] w_seg_10_not;
  not_1in not_1in_6(
    .A(w_seg_10[0]),
    .Z(w_seg_10_not[0])
    );

  not_1in not_1in_7(
    .A(w_seg_10[1]),
    .Z(w_seg_10_not[1])
    );

  not_1in not_1in_8(
    .A(w_seg_10[2]),
    .Z(w_seg_10_not[2])
    );

  not_1in not_1in_9(
    .A(w_seg_10[3]),
    .Z(w_seg_10_not[3])
    );

  not_1in not_1in_10(
    .A(w_seg_10[4]),
    .Z(w_seg_10_not[4])
    );

  not_1in not_1in_11(
    .A(w_seg_10[5]),
    .Z(w_seg_10_not[5])
    );

  not_1in not_1in_12(
    .A(w_seg_10[6]),
    .Z(w_seg_10_not[6])
    );

  wire [3:0] w_temp_seg_10_1;
  ttl74157 ttl74157_2(
    .A(w_seg_10[3:0]),
    .B(w_seg_10_not[3:0]),
    .SEL(w_comp),
    .Y(w_temp_seg_10_1[3:0])
    );

  wire [3:0] w_temp_seg_10_2;
  ttl74157 ttl74157_3(
    .A({1'b0, w_seg_10[6:4]}),
    .B({1'b0, w_seg_10_not[6:4]}),
    .SEL(w_comp),
    .Y(w_temp_seg_10_2)
    );

  assign seg10 = {w_temp_seg_10_2[2:0], w_temp_seg_10_1[3:0]};
endmodule // top
