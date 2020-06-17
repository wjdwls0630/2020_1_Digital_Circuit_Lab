module ttl74147_v_tb ();
  reg [9:1] r_An;

  initial begin
    r_An <= 9'b011111111;
    #20 r_An <= 9'b101111111;
    #20 r_An <= 9'b110111111;
    #20 r_An <= 9'b111011111;
    #20 r_An <= 9'b111101111;
    #20 r_An <= 9'b111110111;
    #20 r_An <= 9'b111111011;
    #20 r_An <= 9'b111111101;
    #20 r_An <= 9'b111111110;
  end



  wire [3:0] Zn;

  always @ ( Zn ) begin
    $monitor("%b", Zn);
  end

  ttl74147_v ttl74147_v(
    .An(r_An),
    .Zn(Zn)
    );

endmodule //multiplexer_4to1_tb
