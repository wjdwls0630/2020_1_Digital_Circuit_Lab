module full_adder_v (
  input A,
  input B,
  input Cin,
  output S,
  output Cout
  );
  wire w_and_1;
  wire w_and_2;
  wire w_and_3;

  and(w_and_1, A, B);
  and(w_and_2, A, Cin);
  and(w_and_3, B, Cin);
  or(Cout, w_and_1, w_and_2, w_and_3);
  xor(S, A, B, Cin);
endmodule // full_adder
