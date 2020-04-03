module half_adder_tb ();
  reg clk;
  reg [1:0] A;

  initial begin
    A <= 2'b0;
    clk <= 1'b0;
  end

  always begin
    #10 clk <= ~clk;
  end

  always @ ( posedge clk ) begin
    A <= A + 1'b1;
  end

  always @ ( S, C ) begin
    $monitor("%b %b", S, C);
  end
  
  wire S;
  wire C;
  half_adder half_adder(
    .A(A),
    .S(S),
    .C(C)
    );
endmodule //half_adder_tb
