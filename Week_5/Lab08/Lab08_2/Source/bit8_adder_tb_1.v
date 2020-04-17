`timescale 1ns / 1ps

module bit8_adder_tb_1 ();
  reg Cin;
  reg [7:0] A;
  reg [7:0] B;
  initial begin
    Cin <= 1'bx;
    A <= 8'b0;
    B <= 8'b11111111;
  end

  initial begin
    #20 Cin <= 1'b1;
  end
  wire [7:0] S;
  wire Cout;
  bit8_adder_v bit8_adder_v(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );


endmodule //multiplexer_4to1_tb
