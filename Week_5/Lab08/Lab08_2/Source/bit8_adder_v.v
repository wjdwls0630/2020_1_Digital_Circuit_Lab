module bit8_adder_v (
  input [7:0] A,
  input [7:0] B,
  input Cin,
  output [7:0] S,
  output Cout
  );

  wire w_cout;
  ttl74283_v ttl74283_v_1(
    .A(A[3:0]),
    .B(B[3:0]),
    .Cin(Cin),
    .S(S[3:0]),
    .Cout(w_cout)
    );

  ttl74283_v ttl74283_v_2(
    .A(A[7:4]),
    .B(B[7:4]),
    .Cin(w_cout),
    .S(S[7:4]),
    .Cout(Cout)
    );
endmodule //ttl74283_v
