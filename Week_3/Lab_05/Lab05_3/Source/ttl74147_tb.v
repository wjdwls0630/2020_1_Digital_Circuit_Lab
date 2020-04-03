module ttl74147_v_tb ();
  reg clk;
  reg [9:1] r_An;

  initial begin
    r_An <= 9'b1;
    clk <= 1'b0;
  end

  always begin
    #10 clk <= ~clk;
  end

  always @ ( posedge clk ) begin
    r_An <= {r_An[8:1], 1'b0};
  end



  wire [3:0] Zn;
  wire [3:0] Z;

  always @ ( Zn ) begin
    $monitor("%b", Zn);
  end

  ttl74147_v ttl74147_v(
    .An(r_An),
    .Zn(Zn)
    );

endmodule //multiplexer_4to1_tb
