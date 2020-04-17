`timescale 1ns / 1ps

module ttl74283_tb_1 ();
  reg Cin;
  reg [3:0] A;
  reg [3:0] B;
  initial begin
    Cin <= 1'bx;
    A <= 4'b0;
    B <= 4'b1111;
  end

  initial begin
    #20 Cin <= 1'b1;
  end
  wire [3:0] S;
  wire Cout;
  ttl74283_v ttl74283_v(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );


endmodule //multiplexer_4to1_tb
