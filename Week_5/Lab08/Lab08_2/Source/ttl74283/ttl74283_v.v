module ttl74283_v (
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] S,
  output Cout
  );
  wire w_cin_buf_1;
  wire w_cout_1;
  buf(w_cin_buf_1, Cin);
  full_adder full_adder_1(
    .A(A[0]),
    .B(B[0]),
    .Cin(w_cin_buf_1),
    .S(S[0]),
    .Cout(w_cout_1)
    );

  wire w_cin_buf_2;
  wire w_cout_2;
  buf(w_cin_buf_2, w_cout_1);
  full_adder full_adder_2(
    .A(A[1]),
    .B(B[1]),
    .Cin(w_cin_buf_2),
    .S(S[1]),
    .Cout(w_cout_2)
    );

  wire w_cin_buf_3;
  wire w_cout_3;
  buf(w_cin_buf_3, w_cout_2);
  full_adder full_adder_3(
    .A(A[2]),
    .B(B[2]),
    .Cin(w_cin_buf_3),
    .S(S[2]),
    .Cout(w_cout_3)
    );
  wire w_cin_buf_4;
  wire w_cout_4;
  buf(w_cin_buf_4, w_cout_3);
  full_adder full_adder_4(
    .A(A[3]),
    .B(B[3]),
    .Cin(w_cin_buf_4),
    .S(S[3]),
    .Cout(w_cout_4)
    );

  buf(Cout, w_cout_4);
endmodule //ttl74283_v
