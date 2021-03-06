module top_v_tb ();
  reg [9:0] A;
  reg START;
  reg EQUAL;
  reg Addn_Sub;

  initial begin
    A <= 10'b1111111111;
    START <= 1'b0;
    EQUAL <= 1'b0;
    Addn_Sub <= 1'b0;
  end


  initial begin
    #20 START <= 1'b1;
    #20 A <= 10'b1101111111; //7
    #20 A <= 10'b1111111111;
    #20 A <= 10'b1111110111; //4
    #20 A <= 10'b1111111111;
    #50 EQUAL <= 1'b1;
    #20 EQUAL <= 1'b0;
    #50 START <= 1'b0;
    #20 START <= 1'b1;
    #20 A <= 10'b1111111011; //3
    #20 A <= 10'b1111111111;
    #20 A <= 10'b1111110111; //4
    #20 A <= 10'b1111111111;
    #50 EQUAL <= 1'b1;
    #20 EQUAL <= 1'b0;
    #50 START <= 1'b0;
    #20 START <= 1'b1;
    #20 A <= 10'b1011111111; //8
    #20 A <= 10'b1111111111;
    #20 A <= 10'b0111111111; //9
    #20 A <= 10'b1111111111;
    #50 EQUAL <= 1'b1;
    #20 EQUAL <= 1'b0;
    #50 START <= 1'b0;
    #20 START <= 1'b1;
    #100 Addn_Sub <= 1'b1;
    #20 A <= 10'b1101111111; //7
    #20 A <= 10'b1111111111;
    #20 A <= 10'b1111101111; //4
    #20 A <= 10'b1111111111;
    #50 EQUAL <= 1'b1;
    #20 EQUAL <= 1'b0;
    #50 START <= 1'b0;
    #20 START <= 1'b1;
    #20 A <= 10'b1111111011; //2
    #20 A <= 10'b1111111111;
    #20 A <= 10'b1101111111; //7
    #20 A <= 10'b1111111111;
    #50 EQUAL <= 1'b1;
    #20 EQUAL <= 1'b0;
    #50 START <= 1'b0;
    #20 START <= 1'b1;
  end

  wire [6:0] seg1;
  wire [6:0] seg10;
  top_v top_v(
    .A(A),
    .START(START),
    .EQUAL(EQUAL),
    .Addn_Sub(Addn_Sub),
    .seg1(seg1),
    .seg10(seg10)
    );

endmodule //multiplexer_4to1_tb
