module sr_latch (
  input i_S,
  input i_R,
  output o_Q,
  output o_Qn
  );

  //RTL
  /*
  wire w_nand_1;
  wire w_nand_2;
  assign o_Q = w_nand_1;
  assign o_Qn = w_nand_2;
  nand_2in nand_2in_1(
    .A({i_S, w_nand_2}),
    .Z(w_nand_1)
    );

  nand_2in nand_2in_2(
    .A({i_R, w_nand_1}),
    .Z(w_nand_2)
    );
	*/
  // modelsim
  wire w_nand_1;
  wire w_nand_2;
  assign o_Q = w_nand_1;
  assign o_Qn = w_nand_2;
  nand_2in_v nand_2in_1(
    .A({i_S, w_nand_2}),
    .Z(w_nand_1)
    );

  nand_2in_v nand_2in_2(
    .A({i_R, w_nand_1}),
    .Z(w_nand_2)
    );
  
endmodule //sr_latch
