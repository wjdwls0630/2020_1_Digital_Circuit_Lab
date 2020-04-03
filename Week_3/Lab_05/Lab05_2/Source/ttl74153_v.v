module ttl74153_v (
  input [1:0] S,	// input [1:0] S_sig
  input [3:0] C1,	// input [3:0] A_sig
  input [3:0] C2,	// input [3:0] B_sig
  input en_A_n,	// input  en_A_n_sig
  input en_B_n,	// input  en_B_n_sig
  output Y1,	// output  Y1_sig
  output Y2 	// output  Y2_sig
  );


  wire w_or_1;
  wire w_or_2;
  wire w_or_3;
  wire w_or_4;
  wire w_or_5;
  wire w_or_6;
  wire w_or_7;
  wire w_or_8;

	and(w_or_1, C1[0], ~en_A_n, ~S[1], ~S[0]);
	and(w_or_2, C1[1], ~en_A_n, ~S[1], S[0]);
  and(w_or_3, C1[2], ~en_A_n, S[1], ~S[0]);
  and(w_or_4, C1[3], ~en_A_n, S[1], S[0]);

  and(w_or_5, C2[0], ~en_B_n, ~S[1], ~S[0]);
  and(w_or_6, C2[1], ~en_B_n, ~S[1], S[0]);
  and(w_or_7, C2[2], ~en_B_n, S[1], ~S[0]);
  and(w_or_8, C2[3], ~en_B_n, S[1], S[0]);


  or(Y1, w_or_1, w_or_2, w_or_3, w_or_4);
  or(Y2, w_or_5, w_or_6, w_or_7, w_or_8);

endmodule //multiplexer_4to1
