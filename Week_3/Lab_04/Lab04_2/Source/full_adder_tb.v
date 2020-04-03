module full_adder_tb ();
  reg clk;
  reg [2:0] r_counter;
  wire [1:0] r_A;
  wire C_in;

  initial begin
    r_counter <= 3'b0;
    clk <= 1'b0;
  end

  always begin
    #10 clk <= ~clk;
  end

  always @ ( posedge clk ) begin
    r_counter <= r_counter + 1'b1;
  end

  assign r_A = r_counter[2:1];
  assign C_in = r_counter[0];
  always @ ( S, C ) begin
    $monitor("%b %b", S, C);
  end

  wire S;
  wire C;
  full_adder full_adder(
    .A(r_counter[2:1]),
    .C_in(r_counter[0]),
    .S(S),
    .C_out(C)
    );
endmodule //half_adder_tb
