module full_subtractor_tb ();
  reg clk;
  reg [2:0] r_counter;
  wire [1:0] r_A;
  wire B_in;
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
  assign B_in = r_counter[0];

  wire D;
  wire B_out;
  always @ ( D, B_out ) begin
    $monitor("%b %b", D, B_out);
  end
  full_subtractor full_subtractor(
    .A(r_counter[2:1]),
    .B_in(r_counter[0]),
    .D(D),
    .B_out(B_out)
    );
endmodule //half_adder_tb
