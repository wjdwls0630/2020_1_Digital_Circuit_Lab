module ttl74153_tb ();
  reg clk;
  reg [5:0] r_counter;
  wire [3:0] w_C1;
  wire [1:0] S;
  initial begin
    r_counter <= 6'b0;
    clk <= 1'b0;
  end

  always begin
    #10 clk <= ~clk;
  end

  always @ ( posedge clk ) begin
    r_counter <= r_counter + 1'b1;
  end

  assign w_C1 = r_counter[5:2];
  assign S = r_counter[1:0];

  wire Y1;
  always @ ( Y1 ) begin
    $monitor("%b", Y1);
  end

  ttl74153_v ttl74153_v(
    .S(S),	// input [1:0] S_sig
    .C1(w_C1),	// input [3:0] A_sig
    .C2(),	// input [3:0] B_sig
    .en_A_n(1'b0),	// input  en_A_n_sig
    .en_B_n(1'b1),	// input  en_B_n_sig
    .Y1(Y1),	// output  Y1_sig
    .Y2() 	// output  Y2_sig
    );

endmodule //multiplexer_4to1_tb
