module ttl74283_tb ();
  reg Cin;
  reg [3:0] A;
  reg [3:0] B;
  initial begin
    Cin <= 1'b0;
    A <= 4'b0;
    B <= 4'b0;
  end

  initial begin
    #10 A <= 4'b0101;
    B <= 4'b1010;
    #10 A <= 4'b0101;
    B <= 4'b0101;
    #10 A <= 4'b1111;
    B <= 4'b0000;
    #10 A <= 4'b0000;
    B <= 4'b1111;
    #10 A <= 4'b1010;
    B <= 4'b0101;
    #10 A <= 4'b1010;
    B <= 4'b1010;
    #10 A <= 4'b1111;
    B <= 4'b1111;


    #10 A <= 4'b0000;
    B <= 4'b0000;
    Cin <= 1'b1;
    #10 A <= 4'b0101;
    B <= 4'b1010;
    #10 A <= 4'b0101;
    B <= 4'b0101;
    #10 A <= 4'b1111;
    B <= 4'b0000;
    #10 A <= 4'b0000;
    B <= 4'b1111;
    #10 A <= 4'b1010;
    B <= 4'b0101;
    #10 A <= 4'b1010;
    B <= 4'b1010;
    #10 A <= 4'b1111;
    B <= 4'b1111;
  end
  wire [3:0] S;
  wire Cout;
  always @ ( S, Cout ) begin
    $monitor("%4b %b", S, Cout);
  end
  ttl74283_v ttl74283_v(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );


endmodule //multiplexer_4to1_tb
