module ttl74165_v_tb ();
  reg CLK;
  reg CLKIH;
  reg SER;
  reg STLD;
  reg [7:0] P;
  wire QH;
  wire QHN;

  initial begin
    CLK <= 1'b0;
    SER <= 1'b0;
  end
  always begin
    #10 CLK <= ~CLK; // 50MHz
  end

  initial begin
    CLKIH <= 1'b1;
    P <= 8'b0;
    STLD <= 1'b1;
    #10 P <= 8'b11010101;
    #10 STLD <= 1'b0;
    #20 STLD <= 1'b1;
    #20 CLKIH <= 1'b0;
    #100 SER <= 1'b1;
    #40 SER <= 1'b0;
  end

  always @ ( QH, QHN ) begin
    $monitor("%b %b", QH, QHN);
  end
  ttl74165_v ttl74165_v(
    .CLK(CLK),
    .CLKIH(CLKIH),
    .SER(SER),
    .STLD(STLD), // async
    .P(P),
    .QH(QH),
    .QHN(QHN)
    );


endmodule //multiplexer_8to1_tb
